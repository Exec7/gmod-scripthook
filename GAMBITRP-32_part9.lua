--Stealed clientside server code by exechack.cc
--Hostname: ⋙ GAMBITRP ╽ ПОДАРКИ ╽ FREE VIP ⋘ - Part 9/10 - 06/04/2025


--PATH addons/plib_v5/lua/plib/extensions/client/util.lua:
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
--PATH addons/grp_knife/lua/autorun/add_tfa_skins.lua:
CreateConVar("csgo_knives_tfaskins", 1, FCVAR_ARCHIVE, "Add skins for TFA knives using this pack's base if any of them installed")

local Knifetable = {}

-- Old API
Knifetable["tfa_csgo_bayonet"] = "csgo_bayonet"
Knifetable["tfa_csgo_butfly"]  = "csgo_butterfly"
Knifetable["tfa_csgo_ctknife"] = "csgo_default_knife"
Knifetable["tfa_csgo_falch"]   = "csgo_falchion"
Knifetable["tfa_csgo_flip"]    = "csgo_flip"
Knifetable["tfa_csgo_gut"]     = "csgo_gut"
Knifetable["tfa_csgo_karam"]   = "csgo_karambit"
Knifetable["tfa_csgo_m9"]      = "csgo_m9"
Knifetable["tfa_csgo_pushkn"]  = "csgo_daggers"
Knifetable["tfa_csgo_tackni"]  = "csgo_huntsman"
Knifetable["tfa_csgo_tknife"]  = "csgo_default_t"

-- New API
Knifetable["weapon_bayonet"] = "csgo_bayonet"
Knifetable["weapon_bowie"]   = "csgo_bowie"
Knifetable["weapon_butfly"]  = "csgo_butterfly"
Knifetable["weapon_falch"]   = "csgo_falchion"
Knifetable["weapon_flip"]    = "csgo_flip"
Knifetable["weapon_gut"]     = "csgo_gut"
Knifetable["weapon_karam"]   = "csgo_karambit"
Knifetable["weapon_m9"]      = "csgo_m9"
Knifetable["weapon_pushkn"]  = "csgo_daggers"
Knifetable["weapon_tackni"]  = "csgo_huntsman"

local Skinstable = {}
Skinstable["aa_fade"] = "Fade"
Skinstable["am_blackpearl_marbleized"] = "Doppler Marbleized"
Skinstable["am_doppler_phase1"] = "Doppler Phase 1"
Skinstable["am_doppler_phase2"] = "Doppler Phase 2"
Skinstable["am_doppler_phase3"] = "Doppler Phase 3"
Skinstable["am_doppler_phase4"] = "Doppler Phase 4"
Skinstable["am_emerald_marbleized"] = "Gamma Doppler Emerald"
Skinstable["am_gamma_doppler_phase1"] = "Gamma Doppler Phase 1"
Skinstable["am_gamma_doppler_phase2"] = "Gamma Doppler Phase 2"
Skinstable["am_gamma_doppler_phase3"] = "Gamma Doppler Phase 3"
Skinstable["am_gamma_doppler_phase4"] = "Gamma Doppler Phase 4"
Skinstable["am_marble_fade"] = "Marble Fade"
Skinstable["am_marked_up_fine"] = "Freehand"
Skinstable["am_ruby_marbleized"] = "Doppler Ruby"
Skinstable["am_sapphire_marbleized"] = "Doppler Sapphire"
Skinstable["am_zebra"] = "Slaughter"
Skinstable["an_tiger_orange"] = "Tiger Tooth"
Skinstable["aq_blued"] = "Blue Steel"
Skinstable["aq_damascus"] = "Damascus Steel"
Skinstable["aq_forced"] = "Stained"
Skinstable["aq_oiled"] = "Case Hardened"
Skinstable["aq_steel_knife"] = "Rust Coat"
Skinstable["cu_karam_lore"] = "Lore"
Skinstable["cu_karam_stonewash"] = "Black Laminate"
Skinstable["gs_karam_autotronic"] = "Autotronic"
Skinstable["hy_ddpat"] = "Forest DDPAT"
Skinstable["hy_forest_boreal"] = "Boreal Forest"
Skinstable["hy_ocean_knife"] = "Bright Water"
Skinstable["hy_webs"] = "Crimson Web"
Skinstable["so_night"] = "Night"
Skinstable["so_purple"] = "Ultraviolet"
Skinstable["sp_dapple"] = "Scorched"
Skinstable["sp_mesh_tan"] = "Safari Mesh"
Skinstable["sp_tape_urban"] = "Urban Masked"
Skinstable["am_marked_up"] = "Freehand"
Skinstable["cu_bayonet_lore"] = "Lore"
Skinstable["cu_bayonet_stonewash"] = "Black Laminate"
Skinstable["gs_bayonet_autotronic"] = "Autotronic"
Skinstable["aq_damascus_90"] = "Damascus Steel"
Skinstable["am_blackpearl_marbleized_b"] = "Doppler Black Pearl"
Skinstable["am_doppler_phase2_b"] = "Doppler Phase 2"
Skinstable["am_sapphire_marbleized_b"] = "Doppler Marbleized"
Skinstable["so_purple_falchion"] = "Ultraviolet"
Skinstable["cu_flip_lore"] = "Lore"
Skinstable["cu_flip_stonewash"] = "Black Laminate"
Skinstable["gs_flip_autotronic"] = "Autotronic"
Skinstable["cu_gut_lore"] = "Lore"
Skinstable["cu_gut_stonewash"] = "Black Laminate"
Skinstable["gs_gut_autotronic"] = "Autotronic"
Skinstable["cu_m9_bay_lore"] = "Lore"
Skinstable["cu_m9_bay_stonewash"] = "Black Laminate"
Skinstable["gs_m9_bay_autotronic"] = "Autotronic"
Skinstable["hy_ocean_knife_90"] = "Bright Water"
Skinstable["cu_purple_huntsman"] = "Ultraviolet"

local Material_default = {}
Material_default["$basetexture"] = "null"
Material_default["$bumpmap"] = "null-bumpmap"
Material_default["$phongexponenttexture"] = "null"
Material_default["$phong"] = "1"
Material_default["$phongboost"] = "2"
Material_default["$phongalbedoboost"] = "35"
Material_default["$phongfresnelranges"] = "[.83 .83 1]"
Material_default["$phongalbedotint"] = "1"
Material_default["$phongdisablehalflambert"] = "1"
Material_default["$basemapalphaphongmask"] = "1"
Material_default["$envmap"] = "env_cubemap"
Material_default["$envmapfresnel"] = "1"
Material_default["$envmaptint"] = "[.1 .1 .1]"
Material_default["$basealphaenvmapmask"] = "1"

local Material_am = table.Copy( Material_default )
Material_am["$phongboost"] = "48"
Material_am["$phongalbedoboost"] = "120"
Material_am["$phongfresnelranges"] = "[0.65 0.75 1]"
Material_am["$envmapfresnel"] = "0.5"
Material_am["$envmaptint"] = "[0.005 0.005 0.005]"
Material_am["$color2"] = "[1.3 1.3 1.3]"

local Material_aa = table.Copy( Material_default )
Material_aa["$phongboost"] = "32"
Material_aa["$phongalbedoboost"] = "128"
Material_aa["$phongfresnelranges"] = "[0.75 0.85 1]"
Material_aa["$envmapfresnel"] = "1"
Material_aa["$envmaptint"] = "[0.075 0.075 0.075]"
Material_aa["$color2"] = "[2 2 2]"

local Material_an = table.Copy( Material_default )
Material_an["$phongboost"] = "32"
Material_an["$phongalbedoboost"] = "128"
Material_an["$phongfresnelranges"] = "[0.75 0.85 1]"
Material_an["$envmapfresnel"] = "1"
Material_an["$envmaptint"] = "[0.018 0.018 0.018]"
Material_an["$color2"] = "[2 2 2]"

local Material_aq = table.Copy( Material_default )
Material_aq["$phongboost"] = "32"
Material_aq["$phongalbedoboost"] = "128"
Material_aq["$phongfresnelranges"] = "[0.6 0.75 1]"
Material_aq["$envmapfresnel"] = "1"
Material_aq["$envmaptint"] = "[0.02 0.02 0.025]"

local Material_cu = table.Copy( Material_default )
Material_cu["$phongboost"] = "6"
Material_cu["$phongalbedoboost"] = "16"
Material_cu["$phongfresnelranges"] = "[0.15 0.55 1]"
Material_cu["$envmapfresnel"] = "0.3"
Material_cu["$envmaptint"] = "[0.01 0.01 0.01]"

local Material_hy = table.Copy( Material_default )
Material_hy["$phongboost"] = "4"
Material_hy["$phongalbedoboost"] = "16"
Material_hy["$phongfresnelranges"] = "[0.15 0.55 1]"
Material_hy["$envmapfresnel"] = "0.2"
Material_hy["$envmaptint"] = "[0.05 0.05 0.05]"

local Material_sp = table.Copy( Material_default )
Material_sp["$phongboost"] = "8"
Material_sp["$phongalbedoboost"] = "16"
Material_sp["$phongfresnelranges"] = "[0.1 0.55 1]"
Material_sp["$envmapfresnel"] = "0.3"
Material_sp["$envmaptint"] = "[0.1 0.1 0.1]"


local function getSynonymOf( string, table )

  if table and table[ string ] then return table[ string ] end

  print("Couldn't find synonym for " .. string ..". Returning this itself.")
  return string
end



local function registerKnife( sweptable, printname, paintmaterial, skinid, classname )
  sweptable.PrintName = sweptable.PrintName .. " | " .. printname .. " (TFA)"
  sweptable.Category = 'CS:GO Knives (TFA Skins)'
  sweptable.PaintMaterial = paintmaterial
        
  weapons.Register( sweptable, classname .. "_tfa_" .. skinid )
end



local function myinit()
  if not cvars.Bool( "csgo_knives_tfaskins", true ) then return end

  if !TFA_CSGO_SKINS then 
    print("Couldn't find TFA_CSGO_SKINS table. Probably the skins (old API) are not installed at all.") 
    TFA_CSGO_SKINS = TFA_CSGO_SKINS or {}
  end
  
  for classname, v in pairs(TFA_CSGO_SKINS) do
    
    if Knifetable[ classname ] then -- we don't need to parse guns skins

      for skinid, v1 in pairs(v) do 
    
        local sweptable = weapons.Get( getSynonymOf( classname, Knifetable ) )
      
        if sweptable then
        
          registerKnife( sweptable, v1["name"], v1["tbl"][1], skinid, "csgo" )
        
        else -- if sweptable
          print( "Failed to register new knife.","\nClassname", classname, "\nSkinid:", skinid, "\nName", v1["name"],"\nMaterial", v1["tbl"][1] )
        end -- if sweptable
      
      end -- for skinid, v1
    
    else -- Knifetable[ classname ]
      print( "Ignoring " .. classname )
    end -- Knifetable[ classname ]
    
  end -- for classname, v

  --New API
  local skinsvtfs = file.Find( "materials/csgo_skins/*-diffuse.vtf", "GAME" )
  for k, vtffile in pairs( skinsvtfs ) do
    vtffile_noext = string.Replace( vtffile, ".vtf", "" )
    vtffile_explode = string.Explode( "-", vtffile_noext )
    
    local classname = getSynonymOf( vtffile_explode[1], Knifetable )
    
    local skinid = vtffile_explode[2]
    
    local st = string.sub( skinid, 1, 2 )
    
    local materialtable = table.Copy( st == "am" and Material_am
                                      or st == "aa" and Material_aa
                                      or st == "an" and Material_an
                                      or st == "aq" and Material_aq
                                      or st == "cu" and Material_cu
                                      or st == "hy" and Material_hy
                                      or st == "sp" and Material_sp
                                      or Material_default )
                                 
    materialtable["$basetexture"] = "csgo_skins/" .. vtffile_noext
    materialtable["$phongexponenttexture"] = "csgo_skins/" .. string.Replace( vtffile_noext, "-diffuse", "-exponent" )
    
    if CreateMaterial then
      CreateMaterial( vtffile_noext, "VertexLitGeneric", materialtable )
    end
    
    local printname = getSynonymOf( skinid, Skinstable )
    
    local sweptable = weapons.Get( classname )
      
    if sweptable then
      
      registerKnife( sweptable, printname, "!" .. vtffile_noext, skinid, classname )
      
    else -- if sweptable
      print( "Failed to register new knife.","\nClassname", classname, "\nSkinid:", skinid, "\nName", printname,"\nMaterial", !vtffile_noext )
    end -- if sweptable
  end
end



hook.Add( "Initialize", "add_tfa_skins_hook", myinit )

--PATH addons/darkrpadvancedkeys/lua/autorun/advkeys_darkrpadds.lua:
function ADVKEYS_DarkRPAdds()
	if not CH_ADVKeys.Config.ALARM_AlwaysActive then
		DarkRP.createCategory{
			name = "Vehicle Accessories",
			categorises = "entities",
			startExpanded = true,
			color = Color(0, 107, 0, 255),
			canSee = function(ply) return true end,
			sortOrder = 70,
		}
	
		AddEntity("Vehicle Alarm", {
			ent = "adv_veh_alarm",
			model = "models/craphead_scripts/adv_keys/props/alarm.mdl",
			price = 250,
			max = 10,
			category = "Vehicle Accessories",
			cmd = "buyvehiclealarm"
		})
	end
end
hook.Add( "loadCustomDarkRPItems", "ADVKEYS_DarkRPAdds", ADVKEYS_DarkRPAdds )
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

--PATH addons/executioner/lua/autorun/executioner_defaults.lua:
if CLIENT then
    local _t = {
        { _hook = 'HUDPaint', _string = 'DrawHitOption' },
        { _hook = 'KeyPress', _string = 'openHitMenu' },
        { _hook = 'PostPlayerDraw', _string = 'drawHitInfo' },
        { _hook = 'InitPostEntity', _string = 'HitmanMenu' }
    }

    hook.Add( 'Initialize', 'rHit.Disable.Default', function()
        for k, v in pairs( _t ) do hook.Remove( v._hook, v._string ) end
    end )
else
    local _c = { 'requesthit', 'hitprice' }
    hook.Add( 'Initialize', 'rHit.Disable.Commands', function()
        for k, v in pairs( _c ) do DarkRP.removeChatCommand( v ) end
    end )
end

--PATH addons/admin_warns/lua/fam/core/cl_utils.lua:
local function ScreenScale( size )
	return size * ( ScrH() / 480.0 )
end

surface.CreateFont("FAM.DefText", {
	font = "Roboto",
	size = ScreenScale(10),
	weight = 150,
	antialias = true
})

surface.CreateFont("FAM.PlayerInfo", {
	font = "Roboto",
	size = ScreenScale(13),
	weight = 150,
	antialias = true
})

local font_size = {}

surface.SetFont("FAM.DefText")
font_size["FAM.DefText"] = {}
font_size["FAM.DefText"].w,font_size["FAM.DefText"].h = surface.GetTextSize("The quick brown fox jumps over a lazy dog.")


surface.SetFont("FAM.PlayerInfo")
font_size["FAM.PlayerInfo"] = {}
font_size["FAM.PlayerInfo"].w,font_size["FAM.PlayerInfo"].h = surface.GetTextSize("The quick brown fox jumps over a lazy dog.")

local blur = Material("pp/blurscreen")
function FlameAdminManagement.DrawBlur(panel)
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(blur)

	for i = 1, 3 do
		blur:SetFloat("$blur", (i / 3) * 5)
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
end

function FlameAdminManagement.DrawText(text, font, x, y, color, x_a, y_a, color_shadow)
	color_shadow = color_shadow or Color(0, 0, 0)
	draw.SimpleText(text, font, x + 1, y + 1, color_shadow, x_a, y_a)
	local w, h = draw.SimpleText(text, font, x, y, color, x_a, y_a)

	return w, h
end

function FlameAdminManagement.FormatTime(time)
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
		toret = toret .. math.Round(w) .."w "
	end

	if d ~= 0 and d < 7 then
		toret = toret .. math.Round(d) .."d "
	end

	if h ~= 0 and h < 24 then
		toret = toret .. math.Round(h) .."h "
	end

	if m ~= 0 and m < 60 then
		toret = toret .. math.Round(m) .."min "
	end

	-- if s ~= 0 and s < 60 then
	--     toret = toret .. math.Round(s) .."sec "
	-- end

	return toret
end

function FlameAdminManagement.StringRequest(title, ask, def, fuc_a, fuc_c, ok, canc)
	local main = vgui.Create("DFrame")
	main:SetSize(ScrW()*.3, ScrH()*.2)
	main:Center()
	main:SetTitle('')
	main:ShowCloseButton(false)
	main:MakePopup()
	main.startTime = SysTime()
	main.Paint = function(self,w,h)
		Derma_DrawBackgroundBlur( self, self.startTime )

		surface.SetDrawColor(0,0,0,100)
		surface.DrawRect(0,0,w,h)

		surface.SetDrawColor(0,0,0,200)
		surface.DrawRect(0,0,w,h*.12)
		surface.DrawRect(0,h*.88,w,h*.12)

		FlameAdminManagement.DrawText(title,"FAM.DefText", w*.5 ,0 ,Color(255,255,255),1,0)
		FlameAdminManagement.DrawText(ask,"FAM.DefText", w*.5 ,h*.44 - 10 - font_size["FAM.DefText"].h,Color(255,255,255),1,0)
	end

	local TextEntry = vgui.Create( "DTextEntry", main )
	TextEntry:SetPos( 2, main:GetTall() - main:GetTall() * .44 - 10 )
	TextEntry:SetSize(  main:GetWide() - 4, main:GetTall() * .12 )
	TextEntry:SetText(def or '')
	TextEntry:RequestFocus()
	TextEntry.OnEnter = function()
		surface.PlaySound( "garrysmod/ui_click.wav" )
		if fuc_a ~= nil then
			fuc_a(TextEntry:GetText())
		end
		main:AlphaTo(0,0.3,0,function()
			if IsValid(main) then
				main:Remove()
			end
		end)
	end

	local yes = vgui.Create("DButton",main)
	yes:SetText('')
	yes:SetSize(main:GetWide()*.5 - 10, main:GetTall()*.2)
	yes:SetPos(5,main:GetTall() - main:GetTall()*.12 - main:GetTall()*.2 - 5)
	yes.Paint = function(self,w,h)
		surface.SetDrawColor(0,200,0,150)
		surface.DrawRect(0,0,w,h)
		FlameAdminManagement.DrawText(ok or FlameAdminManagement.GetLang('Accept'), "FAM.DefText", w*.5, h*.5, Color(255, 255, 255, 255), 1, 1)
	end
	yes.OnCursorEntered = function(this)
		surface.PlaySound( "garrysmod/ui_hover.wav" )
	end
	yes.DoClick = function(self)
		surface.PlaySound( "garrysmod/ui_click.wav" )
		self:SetEnabled(false)
		if fuc_a ~= nil then
			fuc_a(TextEntry:GetText())
		end
		main:AlphaTo(0,0.3,0,function()
			if IsValid(main) then
				main:Remove()
			end
		end)
	end

	local no = vgui.Create("DButton",main)
	no:SetText('')
	no:SetSize(main:GetWide()*.5 - 10, main:GetTall()*.2)
	no:SetPos(main:GetWide()*.5 + 5,main:GetTall() - main:GetTall()*.12 - main:GetTall()*.2 - 5)
	no.Paint = function(self,w,h)
		surface.SetDrawColor(200,0,0,150)
		surface.DrawRect(0,0,w,h)
		FlameAdminManagement.DrawText(canc or FlameAdminManagement.GetLang('cancle'), "FAM.DefText", w*.5, h*.5, Color(255, 255, 255, 255), 1, 1)
	end
	no.OnCursorEntered = function(this)
		surface.PlaySound( "garrysmod/ui_hover.wav" )
	end
	no.DoClick = function(self)
		surface.PlaySound( "garrysmod/ui_click.wav" )
		self:SetEnabled(false)
		if fuc_c ~= nil then
			fuc_c(TextEntry:GetText())
		end
		main:AlphaTo(0,0.3,0,function()
			if IsValid(main) then
				main:Remove()
			end
		end)
	end

	local close = vgui.Create("DButton",main)
	close:SetText('')
	close:SetSize(main:GetWide()*.07, main:GetTall()*.12)
	close:SetPos(main:GetWide() - main:GetWide()*.07,0)
	close.Paint = function(self,w,h)
		surface.SetDrawColor(255,0,0,255)
		surface.DrawRect(0,0,w,h)
		FlameAdminManagement.DrawText("X", "FAM.DefText", w*.5, h*.5, Color(255, 255, 255, 255), 1, 1)
	end
	close.OnCursorEntered = function(this)
		surface.PlaySound( "garrysmod/ui_hover.wav" )
	end
	close.DoClick = function(self)
		surface.PlaySound( "garrysmod/ui_click.wav" )
		self:SetEnabled(false)
		if fuc_c ~= nil then
			fuc_c(TextEntry:GetText())
		end
		main:AlphaTo(0,0.3,0,function()
			if IsValid(main) then
				main:Remove()
			end
		end)
	end
end

net.Receive( "FAM.SendMessage", function()
	local args = net.ReadTable()
	chat.AddText( Color(255,155,55), "[GM] ", unpack( args ) )
end)

net.Receive("FAM.RequestGameSettings", function()
	local new_settings = net.ReadTable()
	FlameAdminManagement.settings = new_settings
end)
--PATH addons/admin_warns/lua/fam/core/cl_main_menu.lua:
local font_size = {}

surface.SetFont("FAM.DefText")
font_size["FAM.DefText"] = {}
font_size["FAM.DefText"].w,font_size["FAM.DefText"].h = surface.GetTextSize("The quick brown fox jumps over a lazy dog.")


surface.SetFont("FAM.PlayerInfo")
font_size["FAM.PlayerInfo"] = {}
font_size["FAM.PlayerInfo"].w,font_size["FAM.PlayerInfo"].h = surface.GetTextSize("The quick brown fox jumps over a lazy dog.")

local vacation_icon = Material("icon16/flag_green.png")
local loading_mat = Material("vgui/loading-rotate")

local opened = false
function FlameAdminManagement.OpenWarnsMenu()
	if opened then return end
	opened = true
	local player_info_main
	local online_players_main
	local main = vgui.Create("DFrame")
	main:SetSize(ScrW() * .3, ScrH() * .7)
	main:SetPos(ScrW() * .5 - main:GetWide() * .5, ScrH())
	local x, y = main:GetPos()
	main.x = x

	main:MoveTo(main.x, ScrH() * .5 - main:GetTall() * .5 - 25, 0.3, 0, 0.4, function()
		main:MoveTo(main.x, ScrH() * .5 - main:GetTall() * .5, 0.15, 0, 0.4)
	end)

	main:MakePopup()
	main:SetTitle('')
	main:ShowCloseButton(false)

	main.Paint = function(self, w, h)
		FlameAdminManagement.DrawBlur(self)
		surface.SetDrawColor(0, 0, 0, 150)
		surface.DrawRect(0, 0, w, h)
		surface.DrawRect(0, 0, w, 25)
		surface.DrawRect(0, h - 25, w, 25)
		FlameAdminManagement.DrawText("Admin Management", "FAM.DefText", w * .5, 12.5, Color(255, 255, 255), 1, 1)
	end

	main.FRemove = function()
		if main.closing then return end
		main.closing = true
		opened = false

		main:MoveTo(main.x, ScrH() * .5 - main:GetTall() * .5 - 25, 0.3, 0, 0.4, function()
			main:MoveTo(main.x, ScrH(), 0.15, 0, 0.4, function()
				main:Remove()

				if IsValid(player_info_main) then
					player_info_main:Remove()
				end

				if IsValid(online_players_main) then
					online_players_main:Remove()
				end
			end)
		end)
	end

	local close = vgui.Create("DButton", main)
	close:SetSize(21, 21)
	close:SetPos(main:GetWide() - 25, 2)
	close:SetText('')

	close.Paint = function(self, w, h)
		if (self.Depressed or self.m_bSelected) then
			surface.SetDrawColor(255, 128, 128, 100)
		elseif (self.Hovered) then
			surface.SetDrawColor(0, 0, 0, 100)
		else
			surface.SetDrawColor(0, 0, 0, 75)
		end

		surface.DrawRect(0, 0, w, h)
		FlameAdminManagement.DrawText("X", "FAM.DefText", w * .5, h * .5, Color(255, 255, 255), 1, 1)
	end

	close.OnCursorEntered = function(self)
		surface.PlaySound("garrysmod/ui_hover.wav")
	end

	close.DoClick = function(self)
		surface.PlaySound("garrysmod/ui_click.wav")
		main:FRemove()
	end



	local main_scroll = vgui.Create("DScrollPanel", main)
	main_scroll:SetPos(2, 27)
	main_scroll:SetSize(main:GetWide() - 4, main:GetTall() - 77)
	main_scroll.VBar:SetWide(3)
	main_scroll:DockMargin(0, 0, 0, 0)

	local bar = main_scroll.VBar
	bar.Paint = function(this, w, h)
	end
	bar.btnUp.Paint = function(this, w, h)
	end
	bar.btnDown.Paint = function(this, w, h)
	end

	main_scroll.Paint = function(self, w, h)
		surface.SetDrawColor(0, 0, 0, 100)
		surface.DrawRect(0, 0, w, h)
	end

	local sheet_to_remove = {}
	local created_sheet = {}
	local created_b = {}
	local page = 0

	main_scroll.load_page = function(page)
		for k,v in pairs(sheet_to_remove) do
			v:Remove()
		end

		sheet_to_remove = {}
		net.Start("FAM.RequestPlayersStatistik")
			net.WriteUInt(page, 32)
		net.SendToServer()
	end
	main_scroll.load_page(0)

	net.Receive("FAM.RequestPlayersStatistik",function()
		if not opened or not IsValid(main) then return end

		local tb = net.ReadTable()

		for k,v in ipairs(tb) do
			if created_sheet[v.steamid..'_'] then continue end
			created_sheet[v.steamid..'_'] = true

			v.vacation = tonumber(v.vacation) 

			local b = vgui.Create("DButton", main_scroll)
			created_b[#created_b + 1] = b
			b:Dock(TOP)
			b:DockMargin(2,1,2,1)
			b:SetText('')
			b:SetTall(main:GetTall()*.05)

			b.Paint = function(self, w, h)
				if (self.Depressed or self.m_bSelected) then
					surface.SetDrawColor(0, 0, 0, 150)
				elseif (self.Hovered) then
					surface.SetDrawColor(0, 0, 0, 100)
				else
					surface.SetDrawColor(0, 0, 0, 75)
				end

				surface.DrawRect(0, 0, w, h)
				FlameAdminManagement.DrawText(v.name, "FAM.DefText", h + 2, h * .5, Color(255, 255, 255), 0, 1)

				local x = FlameAdminManagement.DrawText(FlameAdminManagement.PrettyRankName(v.rank), "FAM.DefText", w - 2, h * .5, FlameAdminManagement.PrettyRankColor(v.rank), 2, 1)

				if v.vacation == 1 then
					surface.SetDrawColor(255,255,255,255)
				else
					surface.SetDrawColor(0,0,0,100)
				end
				surface.SetMaterial(vacation_icon)
				surface.DrawTexturedRect(w - x - h - 8, 4, h - 8, h - 8)

				if v.demoted == 1 then
                    surface.SetDrawColor(Color(255,0,0))
	                surface.DrawOutlinedRect(0,0,w,h)
				end
			end

			b.OnCursorEntered = function(self)
				surface.PlaySound("garrysmod/ui_hover.wav")
			end

			b.DoClick = function(self)
				surface.PlaySound("garrysmod/ui_click.wav")

				local Menu = DermaMenu()

				Menu:AddOption( FlameAdminManagement.GetLang('give_warn'), function()
					surface.PlaySound("buttons/button14.wav")
					FlameAdminManagement.StringRequest(FlameAdminManagement.GetLang('give_warn_r'), FlameAdminManagement.GetLang('give_warn_r_s'), "No Reason", function(reason)
						net.Start("FAM.GiveWarn")
							net.WriteString(v.steamid)
							net.WriteString(reason)
						net.SendToServer()
					end)
				end):SetImage( "icon16/error_add.png" )

				Menu:AddOption( FlameAdminManagement.GetLang('remove_warn'), function()
					surface.PlaySound("buttons/button14.wav")
					FlameAdminManagement.StringRequest(FlameAdminManagement.GetLang('remove_warn_r'), FlameAdminManagement.GetLang('remove_warn_r_s'), "No Reason", function(reason)
						net.Start("FAM.RemoveWarn")
							net.WriteString(v.steamid)
							net.WriteString(reason)
						net.SendToServer()
					end)
				end):SetImage( "icon16/error_delete.png" )

				Menu:AddSpacer()

				local info,s = Menu:AddSubMenu( FlameAdminManagement.GetLang('info') )
				s:SetImage( "icon16/eye.png" )

				info:AddOption( v.name, function()
					surface.PlaySound("buttons/button14.wav")
					SetClipboardText(v.name)
					chat.AddText(Color(255, 155, 55), "[".. FlameAdminManagement.GetLang('clipboard') .."]", Color(255,255,255), " ".. FlameAdminManagement.GetLang('clipboard_t') .." ", Color(255, 155, 55), v.name)
				end)

				info:AddOption( util.SteamIDFrom64(v.steamid), function()
					surface.PlaySound("buttons/button14.wav")
					SetClipboardText(util.SteamIDFrom64(v.steamid))
					chat.AddText(Color(255, 155, 55), "[".. FlameAdminManagement.GetLang('clipboard') .."]", Color(255,255,255), " ".. FlameAdminManagement.GetLang('clipboard_t') .." ", Color(255, 155, 55), util.SteamIDFrom64(v.steamid))
				end)

				info:AddOption( v.steamid, function()
					surface.PlaySound("buttons/button14.wav")
					SetClipboardText(v.steamid)
					chat.AddText(Color(255, 155, 55), "[".. FlameAdminManagement.GetLang('clipboard') .."]", Color(255,255,255), " ".. FlameAdminManagement.GetLang('clipboard_t') .." ", Color(255, 155, 55), v.steamid)
				end)


				Menu:AddOption( FlameAdminManagement.GetLang('load_stats'), function()
					surface.PlaySound("buttons/button14.wav")
					net.Start("FAM.GetPlayerStatistik_SID")
						net.WriteString(v.steamid)
					net.SendToServer()

					player_info_main.FLoading(true)
				end):SetImage( "icon16/database_refresh.png" )

				if LocalPlayer():CanSendOnVacation() then
					Menu:AddSpacer()

					Menu:AddOption( FlameAdminManagement.GetLang('vacation'), function()
						surface.PlaySound("buttons/button14.wav")

						local new_status = v.vacation == 1 and 0 or 1

						net.Start("FAM.ChangeVacationStatus")
							net.WriteString(v.steamid)
							net.WriteInt(new_status, 2)
						net.SendToServer()
						v.vacation = new_status
					end):SetImage( "icon16/flag_green.png" )
				end

				Menu:Open()
			end

			local avatar = vgui.Create("fam_avatar", b)
			avatar:SetPos(2, 2)
			avatar:SetSize(b:GetTall() - 4, b:GetTall() - 4)
			avatar:SetSteamID(v.steamid, 184)
		end

		local load_more = vgui.Create("DButton", main_scroll)
		load_more:Dock(TOP)
		load_more:DockMargin(2,1,2,1)
		load_more:SetText('')
		load_more:SetTall(main:GetTall()*.05)

		load_more.Paint = function(self, w, h)
			if (self.Depressed or self.m_bSelected) then
				surface.SetDrawColor(0, 0, 0, 150)
			elseif (self.Hovered) then
				surface.SetDrawColor(0, 0, 0, 100)
			else
				surface.SetDrawColor(0, 0, 0, 75)
			end

			surface.DrawRect(0, 0, w, h)
			FlameAdminManagement.DrawText(FlameAdminManagement.GetLang('load_more_users'), "FAM.DefText", w*.5, h * .5, Color(255, 255, 255), 1, 1)
		end

		load_more.OnCursorEntered = function(self)
			surface.PlaySound("garrysmod/ui_hover.wav")
		end

		load_more.DoClick = function(self)
			surface.PlaySound("garrysmod/ui_click.wav")
			page = page + 1
			main_scroll.load_page(page)
		end

		sheet_to_remove[#sheet_to_remove + 1] = load_more
	end)

	local main_search_type = vgui.Create( "DComboBox", main )
	main_search_type:SetPos( 2, main:GetTall() - 48)
	main_search_type:SetSize( main:GetWide()*.15 - 4, 21 )
	main_search_type:AddChoice("SteamID")
	main_search_type:AddChoice("SteamID64")
	main_search_type:AddChoice("Nick", nil, true)
	main_search_type.OnSelect = function( panel, index, value )

	end

	local main_search_te = vgui.Create( "DTextEntry", main )
	main_search_te:SetPos( main:GetWide()*.15,  main:GetTall() - 48)
	main_search_te:SetSize( main:GetWide()*.65 - 4, 21 )
	main_search_te:SetText("")
	main_search_te:RequestFocus()
	main_search_te.OnEnter = function()
		surface.PlaySound("garrysmod/ui_click.wav")

		if #main_search_te:GetText() < 3 then return end

		for k,v in pairs(created_b) do
			v:Remove()
		end
		created_b = {}

		for k,v in pairs(sheet_to_remove) do
			v:Remove()
		end
		sheet_to_remove = {}
		created_sheet = {}

		page = 0

		local search_by = main_search_te:GetText()
		if main_search_type:GetSelectedID() == 1 or main_search_type:GetSelectedID() == 2 then
			search_by = string.Replace( search_by, " ", "" )
		end

		net.Start("FAM.Search")
			net.WriteInt(main_search_type:GetSelectedID(), 32)
			net.WriteString(main_search_te:GetText())
		net.SendToServer()
	end

	local main_search_b = vgui.Create("DButton", main)
	main_search_b:SetSize(main:GetWide()*.2, 21)
	main_search_b:SetPos(main:GetWide()*.8 - 2,  main:GetTall() - 48)
	main_search_b:SetText('')
	main_search_b.Paint = function(self, w, h)
		if (self.Depressed or self.m_bSelected) then
			surface.SetDrawColor(0, 255, 0, 150)
		elseif (self.Hovered) then
			surface.SetDrawColor(0, 255, 0, 100)
		else
			surface.SetDrawColor(0, 255, 0, 75)
		end

		surface.DrawRect(0, 0, w, h)
		FlameAdminManagement.DrawText(FlameAdminManagement.GetLang('search'), "FAM.DefText", w * .5, h * .5, Color(255, 255, 255), 1, 1)
	end

	main_search_b.OnCursorEntered = function(self)
		surface.PlaySound("garrysmod/ui_hover.wav")
	end

	main_search_b.DoClick = function(self)
		surface.PlaySound("garrysmod/ui_click.wav")

		if #main_search_te:GetText() < 3 then return end

		for k,v in pairs(created_b) do
			v:Remove()
		end
		created_b = {}

		for k,v in pairs(sheet_to_remove) do
			v:Remove()
		end
		sheet_to_remove = {}
		created_sheet = {}

		page = 0

		local search_by = main_search_te:GetText()
		if main_search_type:GetSelectedID() == 1 or main_search_type:GetSelectedID() == 2 then
			search_by = string.Replace( search_by, " ", "" )
		end

		net.Start("FAM.Search")
			net.WriteInt(main_search_type:GetSelectedID(), 32)
			net.WriteString(main_search_te:GetText())
		net.SendToServer()
	end


	player_info_main = vgui.Create("DFrame")
	player_info_main:SetSize(ScrW() * .25, ScrH() * .7)
	player_info_main:SetPos(ScrW() * .5 - player_info_main:GetWide() * .5, ScrH())
	player_info_main:MakePopup()
	player_info_main:SetTitle('')
	player_info_main:ShowCloseButton(false)
	player_info_main.loading = false
	player_info_main.created_sheet = {}

	player_info_main.Paint = function(self, w, h)
		FlameAdminManagement.DrawBlur(self)
		surface.SetDrawColor(0, 0, 0, 150)
		surface.DrawRect(0, 0, w, h)
		surface.DrawRect(0, 0, w, 25)
		surface.DrawRect(0, h - 25, w, 25)
		FlameAdminManagement.DrawText(FlameAdminManagement.GetLang('ply_info'), "FAM.DefText", w * .5, 12.5, Color(255, 255, 255), 1, 1)
		if player_info_main.info ~= nil and not self.loading then
			FlameAdminManagement.DrawText(FlameAdminManagement.GetLang('a_warns') .. " ".. player_info_main.info["ActiveWarns"] .." | ".. FlameAdminManagement.GetLang('t_warns') .." ".. player_info_main.info["TotalWarns"] , "FAM.DefText", w * .5, h - 12.5, Color(255, 255, 255), 1, 1)
		end

		if self.loading then
			surface.SetDrawColor(255,255,255)
			surface.SetMaterial(loading_mat)
			surface.DrawTexturedRectRotated(w*.5, h*.5, 200, 200,(CurTime() * 255) % 360)
			FlameAdminManagement.DrawText(FlameAdminManagement.GetLang('loading'), "FAM.DefText", w*.5, h*.5, Color(255,255,255,255),1,1)
		end
	end

	player_info_main.last_x, player_info_main.last_y = 0, 0

	player_info_main.Think = function(self)
		if IsValid(main) then
			local x, y = main:GetPos()
			self:SetPos(x - self:GetWide() - 2, y)
			self.last_x, self.last_y = x, y
		else
			self:SetPos(self.last_x, self.last_y)
		end
	end

	local player_info_scroll = vgui.Create("DScrollPanel", player_info_main)
	player_info_scroll:SetPos(2, 27)
	player_info_scroll:SetSize(player_info_main:GetWide() - 4, player_info_main:GetTall() - 54)
	player_info_scroll.VBar:SetWide(3)
	player_info_scroll:DockMargin(0, 0, 0, 0)

	local bar = player_info_scroll.VBar
	bar.Paint = function(this, w, h)
	end
	bar.btnUp.Paint = function(this, w, h)
	end
	bar.btnDown.Paint = function(this, w, h)
	end

	player_info_scroll.Paint = function(self, w, h)
		surface.SetDrawColor(0,0,0,50)
		surface.DrawRect(0,0,w,h)
	end

	player_info_main.CreateInfoPanels = function()
		for k,v in pairs(player_info_main.created_sheet) do
			v:Remove()
		end
		player_info_main.created_sheet = {}

		local avatar_main = vgui.Create("DPanel", player_info_scroll)
		avatar_main:Dock(TOP)
		avatar_main:DockMargin(2,1,2,1)
		avatar_main:SetTall(player_info_main:GetWide() *.23 + 6 + font_size["FAM.PlayerInfo"].h)
		avatar_main:InvalidateParent(true)

		avatar_main:SetAlpha(0)
		avatar_main:AlphaTo(255, 0.3)

		player_info_main.created_sheet[#player_info_main.created_sheet + 1] = avatar_main

		avatar_main.Paint = function(self,w,h)
			surface.SetDrawColor(0,0,0,100)
			surface.DrawRect(0,0,w,h)

			FlameAdminManagement.DrawText(player_info_main.info.name, "FAM.PlayerInfo", w*.5, h - 2 - font_size["FAM.PlayerInfo"].h, Color(255,255,255,255),1,0)
		end

		local avatar = vgui.Create("fam_avatar", avatar_main)
		avatar:SetPos(avatar_main:GetWide()*.5 - avatar_main:GetTall()*.5 + font_size["FAM.PlayerInfo"].h *.5, 2)
		avatar:SetSize(avatar_main:GetTall() - 4 - font_size["FAM.PlayerInfo"].h, avatar_main:GetTall() - 4 - font_size["FAM.PlayerInfo"].h)
		avatar:SetSteamID(player_info_main.sid, 184)

		local rank_main = vgui.Create("DPanel", player_info_scroll)
		rank_main:Dock(TOP)
		rank_main:DockMargin(2,1,2,1)
		rank_main:SetTall(font_size["FAM.PlayerInfo"].h + 4)

		rank_main:SetAlpha(0)
		rank_main:AlphaTo(255, 0.5)

		player_info_main.created_sheet[#player_info_main.created_sheet + 1] = rank_main

		rank_main.Paint = function(self,w,h)
			surface.SetDrawColor(0,0,0,100)
			surface.DrawRect(0,0,w,h)

			FlameAdminManagement.DrawText(FlameAdminManagement.PrettyRankName(player_info_main.info.rank), "FAM.PlayerInfo", w*.5, 2, FlameAdminManagement.PrettyRankColor(player_info_main.info.rank),1,0)
		end

		local total_online = vgui.Create("DPanel", player_info_scroll)
		total_online:Dock(TOP)
		total_online:DockMargin(2,1,2,1)
		total_online:SetTall(font_size["FAM.PlayerInfo"].h + font_size["FAM.PlayerInfo"].h + 4)
		player_info_main.created_sheet[#player_info_main.created_sheet + 1] = total_online


		total_online:SetAlpha(0)
		total_online:AlphaTo(255, 0.7)

		total_online.Paint = function(self,w,h)
			surface.SetDrawColor(0, 0, 0, 100)
			surface.DrawRect(0,0,w,h)

			FlameAdminManagement.DrawText(FlameAdminManagement.GetLang('total_online'), "FAM.PlayerInfo", w*.5, 2, Color(255,255,255),1,0)
			FlameAdminManagement.DrawText(FlameAdminManagement.FormatTime(player_info_main.info.TotalTimePlayed), "FAM.PlayerInfo", w*.5, h - 2 - font_size["FAM.PlayerInfo"].h, Color(255,255,255),1,0)
		end

		local last_seen = vgui.Create("DPanel", player_info_scroll)
		last_seen:Dock(TOP)
		last_seen:DockMargin(2,1,2,1)
		last_seen:SetTall(font_size["FAM.PlayerInfo"].h + font_size["FAM.PlayerInfo"].h + 4)
		player_info_main.created_sheet[#player_info_main.created_sheet + 1] = last_seen


		last_seen:SetAlpha(0)
		last_seen:AlphaTo(255, 0.9)

		last_seen.Paint = function(self,w,h)
			surface.SetDrawColor(0, 0, 0, 100)
			surface.DrawRect(0,0,w,h)

			FlameAdminManagement.DrawText(FlameAdminManagement.GetLang('last_seen'), "FAM.PlayerInfo", w*.5, 2, Color(255,255,255),1,0)
			FlameAdminManagement.DrawText(os.date( "%d/%m/%Y - %H:%M", player_info_main.info.LastSeen ), "FAM.PlayerInfo", w*.5, h - 2 - font_size["FAM.PlayerInfo"].h, Color(255,255,255),1,0)
		end

		local history_main = vgui.Create("DPanel", player_info_scroll)
		history_main:Dock(TOP)
		history_main:DockMargin(2,1,2,1)
		history_main:SetTall(font_size["FAM.PlayerInfo"].h + 6 + player_info_scroll:GetTall() * .6)

		history_main:SetAlpha(0)
		history_main:AlphaTo(255, 1.3)
		history_main:InvalidateParent(true)

		player_info_main.created_sheet[#player_info_main.created_sheet + 1] = history_main

		history_main.Paint = function(self,w,h)
			surface.SetDrawColor(0,0,0,100)
			surface.DrawRect(0,0,w,h)

			FlameAdminManagement.DrawText(FlameAdminManagement.GetLang('warns_history'), "FAM.PlayerInfo", w*.5, 2, Color(255,255,255),1,0)
		end

		local history_main_scroll = vgui.Create("DScrollPanel", history_main)
		history_main_scroll:SetPos(2, font_size["FAM.PlayerInfo"].h + 4)
		history_main_scroll:SetSize(history_main:GetWide() - 4, history_main:GetTall() - font_size["FAM.PlayerInfo"].h - 6)
		history_main_scroll.VBar:SetWide(4)
		local bar = history_main_scroll.VBar
		bar.Paint = function(this, w, h)
		end
		bar.btnUp.Paint = function(this, w, h)
		end
		bar.btnDown.Paint = function(this, w, h)
		end

		history_main_scroll.Paint = function(self,w,h) end
		bar:SetHideButtons( true )

		for k,v in pairs(player_info_main.info.History) do
			local label = vgui.Create("DLabel", history_main_scroll)
			label:Dock(TOP)
			label:DockMargin(2,1,2,1)
			label:SetTextColor(Color(255,255,255))
			label:SetFont("FAM.DefText")
			label:SetText(string.format(FlameAdminManagement.GetLang('warns_history_format', v.w_type), os.date( "%d/%m/%Y - %H:%M" , v.w_time ), v.adm_name, v.adm_id, v.w_reason))
			label:SetExpensiveShadow( 2, Color(0,0,0) )
			label:SetWrap( true )
			label:SetAutoStretchVertical(true)
			label.Paint = function(self, w, h)
				if v.w_type == 1 then
					surface.SetDrawColor(255,0,0,100)
				elseif v.w_type == 2 then
					surface.SetDrawColor(0,255,0,100)
				elseif v.w_type == 3 then
					surface.SetDrawColor(255,255,0,100)
				else
					surface.SetDrawColor(0,0,0,100)
				end

				surface.DrawRect(0,0,w,h)
			end
		end
	end


	player_info_main.FLoading = function(b)
		b = b or false

		for k,v in pairs(player_info_main.created_sheet) do
			v:Remove()
		end
		player_info_main.created_sheet = {}

		player_info_main.loading = b
	end

	online_players_main = vgui.Create("DFrame")
	online_players_main:SetSize(ScrW() * .25, ScrH() * .7)
	online_players_main:SetPos(ScrW() * .5 - online_players_main:GetWide() * .5, ScrH())
	online_players_main:MakePopup()
	online_players_main:SetTitle('')
	online_players_main:ShowCloseButton(false)
	online_players_main.admins = 0

	online_players_main.Paint = function(self, w, h)
		FlameAdminManagement.DrawBlur(self)
		surface.SetDrawColor(0, 0, 0, 150)
		surface.DrawRect(0, 0, w, h)
		surface.DrawRect(0, 0, w, 25)
		surface.DrawRect(0, h - 25, w, 25)
		FlameAdminManagement.DrawText(FlameAdminManagement.GetLang('online_players'), "FAM.DefText", w * .5, 12.5, Color(255, 255, 255), 1, 1)
		FlameAdminManagement.DrawText(FlameAdminManagement.GetLang('online_admins').. " ".. online_players_main.admins, "FAM.DefText", w * .5, h - 12.5, Color(255, 255, 255), 1, 1)
	end

	online_players_main.last_x, online_players_main.last_y = 0, 0

	online_players_main.Think = function(self)
		if IsValid(main) then
			local x, y = main:GetPos()
			self:SetPos(x + main:GetWide() + 2, y)
			self.last_x, self.last_y = x, y
		else
			self:SetPos(self.last_x, self.last_y)
		end
	end

	local online_players_scroll = vgui.Create("DScrollPanel", online_players_main)
	online_players_scroll:SetPos(2, 27)
	online_players_scroll:SetSize(online_players_main:GetWide() - 4, online_players_main:GetTall() - 54)
	online_players_scroll.VBar:SetWide(3)
	online_players_scroll:DockMargin(0, 0, 0, 0)

	local bar = online_players_scroll.VBar
	bar.Paint = function(this, w, h)
	end
	bar.btnUp.Paint = function(this, w, h)
	end
	bar.btnDown.Paint = function(this, w, h)
	end

	online_players_scroll.Paint = function(self, w, h)
		surface.SetDrawColor(0,0,0,50)
		surface.DrawRect(0,0,w,h)
	end


	local plys = player.GetAll()
	table.sort( plys, function( a, b ) return a:Team() < b:Team() end )
	for k,v in ipairs(plys) do
		if not v:CollectStatistics() then continue end

		online_players_main.admins = online_players_main.admins + 1

		local b = vgui.Create("DButton", online_players_scroll)
		b:Dock(TOP)
		b:DockMargin(2,1,2,1)
		b:SetText('')
		b:SetTall(online_players_scroll:GetTall() * .07)
		b.Paint = function(self, w, h)
			if not IsValid(v) then self:Remove() return end

			if (self.Depressed or self.m_bSelected) then
				surface.SetDrawColor(255, 155, 55, 100)
			elseif (self.Hovered) then
				surface.SetDrawColor(0, 0, 0, 150)
			else
				surface.SetDrawColor(0, 0, 0, 100)
			end

			surface.DrawRect(0, 0, w, h)
			FlameAdminManagement.DrawText(v:Nick(), "FAM.DefText", h + 4, h * .5, team.GetColor(v:Team()), 0, 1)
			FlameAdminManagement.DrawText(FlameAdminManagement.PrettyRankName(v:GetUserGroup()), "FAM.DefText", w - 2, h * .5, FlameAdminManagement.PrettyRankColor(v:GetUserGroup()), 2, 1)
		end

		b.OnCursorEntered = function(self)
			surface.PlaySound("garrysmod/ui_hover.wav")
		end

		b.DoClick = function(self)
			surface.PlaySound("garrysmod/ui_click.wav")

			local Menu = DermaMenu()

			Menu:AddOption( FlameAdminManagement.GetLang('give_warn'), function()
				surface.PlaySound("buttons/button14.wav")
				FlameAdminManagement.StringRequest(FlameAdminManagement.GetLang('give_warn_r'), FlameAdminManagement.GetLang('give_warn_r_s'), "No Reason", function(reason)
					net.Start("FAM.GiveWarn")
						net.WriteString(v:SteamID64())
						net.WriteString(reason)
					net.SendToServer()
				end)
			end):SetImage( "icon16/error_add.png" )

			Menu:AddOption( FlameAdminManagement.GetLang('remove_warn'), function()
				surface.PlaySound("buttons/button14.wav")
				FlameAdminManagement.StringRequest(FlameAdminManagement.GetLang('remove_warn_r'), FlameAdminManagement.GetLang('remove_warn_r_s'), "No Reason", function(reason)
					net.Start("FAM.RemoveWarn")
						net.WriteString(v:SteamID64())
						net.WriteString(reason)
					net.SendToServer()
				end)
			end):SetImage( "icon16/error_delete.png" )

			Menu:AddSpacer()

			local info,s = Menu:AddSubMenu( FlameAdminManagement.GetLang('info') )
			s:SetImage( "icon16/eye.png" )

			info:AddOption( v:Nick(), function()
				surface.PlaySound("buttons/button14.wav")
				SetClipboardText(v:Nick())
				chat.AddText(Color(255, 155, 55), "[".. FlameAdminManagement.GetLang('clipboard') .."]", Color(255,255,255), " ".. FlameAdminManagement.GetLang('clipboard_t') .." ", Color(255, 155, 55), v:Nick())
			end)

			info:AddOption( v:SteamID(), function()
				surface.PlaySound("buttons/button14.wav")
				SetClipboardText(v:SteamID())
				chat.AddText(Color(255, 155, 55), "[".. FlameAdminManagement.GetLang('clipboard') .."]", Color(255,255,255), " ".. FlameAdminManagement.GetLang('clipboard_t') .." ", Color(255, 155, 55), v:SteamID())
			end)

			info:AddOption( v:SteamID64(), function()
				surface.PlaySound("buttons/button14.wav")
				SetClipboardText(v:SteamID64())
				chat.AddText(Color(255, 155, 55), "[".. FlameAdminManagement.GetLang('clipboard') .."]", Color(255,255,255), " ".. FlameAdminManagement.GetLang('clipboard_t') .." ", Color(255, 155, 55), v:SteamID64())
			end)


			Menu:AddOption( FlameAdminManagement.GetLang('load_stats'), function()
				surface.PlaySound("buttons/button14.wav")
				net.Start("FAM.GetPlayerStatistik")
					net.WriteEntity(v)
				net.SendToServer()

				player_info_main.FLoading(true)
			end):SetImage( "icon16/database_refresh.png" )

			Menu:Open()
		end

		local avatar = vgui.Create("fam_avatar", b)
		avatar:SetPos(2,2)
		avatar:SetSize(b:GetTall() - 4,b:GetTall() - 4)
		avatar:SetPlayer(v, 184)
	end

	net.Receive("FAM.GetPlayerStatistik", function()
		local sid = net.ReadString()
		local tb = net.ReadTable()

		if IsValid(player_info_main) then
			player_info_main.sid = sid
			player_info_main.info = tb
			player_info_main.FLoading(false)
			player_info_main.CreateInfoPanels()
		end
	end)
end

net.Receive("FAM.OpenMenu", function()
	local new_settings = net.ReadTable()
	FlameAdminManagement.settings = new_settings
	FlameAdminManagement.OpenWarnsMenu()
end)
--PATH addons/content_fbi_pack_107411755/lua/autorun/fbi_pack.lua:
/*
	Addon by Voikanaa	
*/

player_manager.AddValidModel( "FBI_01", 		"models/fbi_pack/fbi_01.mdl" );
list.Set( "PlayerOptionsModel", "FBI_01", 	"models/fbi_pack/fbi_01.mdl" );

player_manager.AddValidModel( "FBI_02", 		"models/fbi_pack/fbi_02.mdl" );
list.Set( "PlayerOptionsModel", "FBI_02", 	"models/fbi_pack/fbi_02.mdl" );

player_manager.AddValidModel( "FBI_03", 		"models/fbi_pack/fbi_03.mdl" );
list.Set( "PlayerOptionsModel", "FBI_03", 	"models/fbi_pack/fbi_03.mdl" );

player_manager.AddValidModel( "FBI_04", 		"models/fbi_pack/fbi_04.mdl" );
list.Set( "PlayerOptionsModel", "FBI_04", 	"models/fbi_pack/fbi_04.mdl" );

player_manager.AddValidModel( "FBI_05", 		"models/fbi_pack/fbi_05.mdl" );
list.Set( "PlayerOptionsModel", "FBI_05", 	"models/fbi_pack/fbi_05.mdl" );

player_manager.AddValidModel( "FBI_06", 		"models/fbi_pack/fbi_06.mdl" );
list.Set( "PlayerOptionsModel", "FBI_06", 	"models/fbi_pack/fbi_06.mdl" );

player_manager.AddValidModel( "FBI_07", 		"models/fbi_pack/fbi_07.mdl" );
list.Set( "PlayerOptionsModel", "FBI_07", 	"models/fbi_pack/fbi_07.mdl" );

player_manager.AddValidModel( "FBI_08", 		"models/fbi_pack/fbi_08.mdl" );
list.Set( "PlayerOptionsModel", "FBI_08", 	"models/fbi_pack/fbi_08.mdl" );

player_manager.AddValidModel( "FBI_09", 		"models/fbi_pack/fbi_09.mdl" );
list.Set( "PlayerOptionsModel", "FBI_09", 	"models/fbi_pack/fbi_09.mdl" );


--PATH addons/fpp/lua/autorun/fprofiler.lua:
FProfiler = {}
FProfiler.Internal = {}
FProfiler.UI = {}

AddCSLuaFile()
AddCSLuaFile("fprofiler/cami.lua")
AddCSLuaFile("fprofiler/gather.lua")
AddCSLuaFile("fprofiler/report.lua")
AddCSLuaFile("fprofiler/util.lua")
AddCSLuaFile("fprofiler/prettyprint.lua")

AddCSLuaFile("fprofiler/ui/model.lua")
AddCSLuaFile("fprofiler/ui/frame.lua")
AddCSLuaFile("fprofiler/ui/clientcontrol.lua")
AddCSLuaFile("fprofiler/ui/servercontrol.lua")

include("fprofiler/cami.lua")

CAMI.RegisterPrivilege{
    Name = "FProfiler",
    MinAccess = "superadmin"
}


include("fprofiler/prettyprint.lua")
include("fprofiler/util.lua")
include("fprofiler/gather.lua")
include("fprofiler/report.lua")


if CLIENT then
    include("fprofiler/ui/model.lua")
    include("fprofiler/ui/frame.lua")
    include("fprofiler/ui/clientcontrol.lua")
    include("fprofiler/ui/servercontrol.lua")
else
    include("fprofiler/ui/server.lua")
end

--PATH addons/gprofiler/lua/gprofiler/profilers/functions/sh_functions.lua:
GProfiler.Functions = GProfiler.Functions or {}
GProfiler.Functions.IsDetoured = GProfiler.Functions.IsDetoured or false
GProfiler.Functions.ProfileData = GProfiler.Functions.ProfileData or {}
GProfiler.Functions.Focus = GProfiler.Functions.Focus or false

local SysTime = SysTime

-- Chunked net messages to avoid net message overflow
local chunkSizeLimit = 90000 -- 187765611979610789976877

local recurse = {}
local startTimes = {}
local IgnoreCache = {}

local function handleFunction(event)
	local time = SysTime()
	local func = event.func

	if IgnoreCache[func] or string.find(event.short_src, "/lua/gprofiler/", 1, true) then IgnoreCache[func] = true return end

	if not recurse[func] then recurse[func] = 0 end
	recurse[func] = recurse[func] + 1

	startTimes[func] = time
end

local function handleReturn(event)
	local time = SysTime()
	local func = event.func

	if not startTimes[func] then return end

	local runTime = time - startTimes[func]

	if GProfiler.Functions.Focus and GProfiler.Functions.Focus ~= tostring(func) then return end

	if not GProfiler.Functions.ProfileData[func] then
		GProfiler.Functions.ProfileData[func] = {
			name = event.name,
			source = event.short_src,
			lines = event.linedefined .. " - " .. event.lastlinedefined,
			calls = 0,
			time = 0,
			average = 0,
			focus = tostring(func)
		}
	end

	GProfiler.Functions.ProfileData[func].time = GProfiler.Functions.ProfileData[func].time + runTime
	GProfiler.Functions.ProfileData[func].calls = GProfiler.Functions.ProfileData[func].calls + 1
	GProfiler.Functions.ProfileData[func].average = GProfiler.Functions.ProfileData[func].time / GProfiler.Functions.ProfileData[func].calls

	recurse[func] = recurse[func] - 1
	if recurse[func] == 0 then recurse[func] = nil end
end

local function onEvent(event)
	local info = debug.getinfo(3)
	if not info then return end
	local func = info.func

	if event == "call" or event == "tail call" then
		handleFunction(info)
	else
		if not recurse[func] or recurse[func] == 0 then return end
		handleReturn(info)
	end
end

function GProfiler.Functions:DetourFunctions(ply)
	if not GProfiler.Access.HasAccess(ply or LocalPlayer()) or GProfiler.Functions.IsDetoured then return end

	GProfiler.Log((SERVER and "Server" or "Client") .. " function profile started!", 2)
	GProfiler.Functions.ProfileData = {}
	GProfiler.Functions.IsDetoured = true

	recurse = {}
	startTimes = {}

	debug.sethook(function(event) onEvent(event) end, "cr")
end

function GProfiler.Functions:RestoreFunctions(ply)
	if not GProfiler.Access.HasAccess(ply or LocalPlayer()) or not GProfiler.Functions.IsDetoured then return end

	GProfiler.Log((SERVER and "Server" or "Client") .. " function profile stopped, sending data!", 2)
	GProfiler.Functions.IsDetoured = false

	debug.sethook()

	if SERVER then
		local chunks = {}
		local chunkCount = 1
		local currentChunkSize = 0
		for k, v in pairs(GProfiler.Functions.ProfileData) do
			local curChunkSize = 68 + (v.name and string.len(v.name) or 7) + string.len(v.source) + string.len(v.lines) + string.len(v.focus)
			local chunkSize = currentChunkSize + curChunkSize
			if chunkSize > chunkSizeLimit then
				chunkCount = chunkCount + 1
				currentChunkSize = 0
				chunkSize = 0
			end

			if not chunks[chunkCount] then chunks[chunkCount] = {} end
			table.insert(chunks[chunkCount], v)
			currentChunkSize = chunkSize
		end

		local i = 1
		local function sendChunk()
			if not chunks[i] then return end
			net.Start("GProfiler_Functions_SendData", true)
			net.WriteBool(i == 1)
			net.WriteBool(i == table.Count(chunks))
			net.WriteUInt(table.Count(chunks[i]), 32)
			for k, v1 in pairs(chunks[i]) do
				net.WriteString(v1.name or "Unknown")
				net.WriteString(v1.source)
				net.WriteString(v1.lines)
				net.WriteUInt(v1.calls, 32)
				net.WriteFloat(v1.time)
				net.WriteFloat(v1.average)
				net.WriteString(v1.focus)
			end
			net.Send(ply)

			i = i + 1
			timer.Simple(.2, sendChunk)
		end
		sendChunk()
	end
end

if SERVER then
	util.AddNetworkString("GProfiler_Functions_ToggleServerProfile")
	util.AddNetworkString("GProfiler_Functions_ServerProfileStatus")
	util.AddNetworkString("GProfiler_Functions_SendData")

	net.Receive("GProfiler_Functions_ToggleServerProfile", function(len, ply)
		if not GProfiler.Access.HasAccess(ply) then return end

		local startStop = net.ReadBool()
		if startStop then
			local hasFocus = net.ReadBool()
			if hasFocus then
				GProfiler.Functions.Focus = net.ReadString()
			else
				GProfiler.Functions.Focus = false
			end

			GProfiler.Functions:DetourFunctions(ply)
			net.Start("GProfiler_Functions_ServerProfileStatus")
			net.WriteBool(true)
			net.WriteEntity(ply)
			net.Broadcast()
		else
			GProfiler.Functions:RestoreFunctions(ply)
			net.Start("GProfiler_Functions_ServerProfileStatus")
			net.WriteBool(false)
			net.WriteEntity(ply)
			net.Broadcast()
		end
	end)
end

--PATH addons/gprofiler/lua/gprofiler/profilers/netvars/cl_netvars.lua:
GProfiler.NetVars = GProfiler.NetVars or {}
GProfiler.NetVars.ProfileActive = GProfiler.NetVars.ProfileActive or false
GProfiler.NetVars.ProfileData = GProfiler.NetVars.ProfileData or {}
GProfiler.NetVars.StartTime = GProfiler.NetVars.StartTime or 0
GProfiler.NetVars.EndTime = GProfiler.NetVars.EndTime or 0

local TabPadding = 10
local MenuColors = GProfiler.MenuColors

function GProfiler.NetVars.DoTab(Content)
	local Header = vgui.Create("DPanel", Content)
	Header:SetSize(Content:GetWide(), 40)
	Header:SetPos(0, 10)
	Header.Paint = function() end

	local StartButton = vgui.Create("DButton", Header)
	StartButton:SetText(GProfiler.NetVars.ProfileActive and GProfiler.Language.GetPhrase("profiler_stop") or GProfiler.Language.GetPhrase("profiler_start"))
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
		if GProfiler.NetVars.ProfileActive then
			GProfiler.NetVars.ProfileActive = false
			GProfiler.NetVars.EndTime = SysTime()
			net.Start("GProfiler_NetVars_ToggleServerProfile")
			net.WriteBool(false)
			net.SendToServer()
			self:SetText(GProfiler.Language.GetPhrase("profiler_start"))
		else
			GProfiler.NetVars.ProfileActive = true
			GProfiler.NetVars.StartTime = SysTime()
			net.Start("GProfiler_NetVars_ToggleServerProfile")
			net.WriteBool(true)
			net.SendToServer()
			self:SetText(GProfiler.Language.GetPhrase("profiler_stop"))
		end
	end

	local TimeRunning = vgui.Create("DLabel", Header)
	TimeRunning:SetFont("GProfiler.Menu.SectionHeader")
	TimeRunning:SetText(GProfiler.TimeRunning(GProfiler.NetVars.StartTime, GProfiler.NetVars.EndTime, GProfiler.NetVars.ProfileActive) .. "s")
	TimeRunning:SizeToContents()
	TimeRunning:SetPos(Header:GetWide() - TimeRunning:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - TimeRunning:GetTall() / 2)
	TimeRunning:SetTextColor(MenuColors.White)
	function TimeRunning:Think()
		if GProfiler.NetVars.ProfileActive then
			self:SetText(GProfiler.TimeRunning(GProfiler.NetVars.StartTime, 0, GProfiler.NetVars.ProfileActive) .. "s")
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
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("type"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("times_updated"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("current_value"))

	for ent, vars in pairs(GProfiler.NetVars.ProfileData) do
		for var, types in pairs(vars) do
			for type, data in pairs(types) do
				local Line = ProfilerResults:AddLine(ent, var, type, data.TimesUpdated, data.CurValue)
				Line.OnMousePressed = function(s, l)
					local menu = DermaMenu()
					menu:AddOption(GProfiler.CopyLang("entity"), function() SetClipboardText(ent) end):SetIcon("icon16/page_copy.png")
					menu:AddOption(GProfiler.CopyLang("variable"), function() SetClipboardText(var) end):SetIcon("icon16/page_copy.png")
					menu:AddOption(GProfiler.CopyLang("type"), function() SetClipboardText(type) end):SetIcon("icon16/page_copy.png")
					menu:AddOption(GProfiler.CopyLang("times_updated"), function() SetClipboardText(data.TimesUpdated) end):SetIcon("icon16/page_copy.png")
					menu:AddOption(GProfiler.CopyLang("current_value"), function() SetClipboardText(data.CurValue) end):SetIcon("icon16/page_copy.png")
					menu:Open()
				end
			end
		end
	end

	ProfilerResults:SortByColumn(3, true)

	GProfiler.StyleDListView(ProfilerResults)
end

GProfiler.Menu.RegisterTab("Network Variables", "icon16/table_edit.png", 7, GProfiler.NetVars.DoTab, function()
	if GProfiler.NetVars.ProfileActive then
		return "", MenuColors.ActiveProfile
	end
	return nil
end)

net.Receive("GProfiler_NetVars_SendData", function(len)
	local data = {}
	local numEnts = net.ReadUInt(32)
	for i = 1, numEnts do
		local ent = net.ReadString()
		data[ent] = {}
		local numVars = net.ReadUInt(32)
		for i = 1, numVars do
			local name = net.ReadString()
			data[ent][name] = {}
			local numTypes = net.ReadUInt(32)
			for i = 1, numTypes do
				local type = net.ReadString()
				data[ent][name][type] = {
					TimesUpdated = net.ReadUInt(32),
					CurValue = net.ReadString()
				}
			end
		end
	end
	GProfiler.NetVars.ProfileData = data
end)

net.Receive("GProfiler_NetVars_ServerProfileStatus", function()
	local status = net.ReadBool()
	local ply = net.ReadEntity()
	GProfiler.NetVars.ProfileActive = status

	if ply == LocalPlayer() then
		GProfiler.Menu.OpenTab("Network Variables", GProfiler.NetVars.DoTab)
	end
end)
--PATH addons/foodmode/lua/autorun/hfm_food_reg.lua:
HFM_Foods = {}

function HFMCreateTable( LuaName, Type )
	local STR = {}
	STR.LuaName = LuaName
	STR.PrintName = "Food"
	STR.Price = 100
	STR.Type = Type
	
	function STR:GetPrintName()
		return self.PrintName
	end
	function STR:SetPrintName(name)
		self.PrintName = name
	end
	
	function STR:SetDescription(text)
		self.Description = text
	end
	function STR:GetDescription()
		return (self.Description or "")
	end
	
	function STR:SetPrice(price)
		self.SellPrice = price
	end
	
	function STR:SetCookingTime(time)
		self.CookingTime = time
	end
	function STR:AddIngredients(luaname,amount)
		self.Ingredients = self.Ingredients or {}
		self.Ingredients[luaname] = amount
	end
	function STR:EatHealth(amount,time)
		self.Eat_Health = {amount = amount,time = time}
	end
	function STR:EatHunger(amount,time)
		self.Eat_Hunger = {amount = amount,time = time}
	end
	function STR:EatThirsty(amount,time)
		self.Eat_Thirsty = {amount = amount,time = time}
	end
	
	
	STR.OnUse = function(ply)
	
	end
	
	return table.Copy(STR)
end

function HFMRegFood(DB)
	HFM_Foods[DB.LuaName] = DB
end

function HFMGetTable(luaname)
	local TB = HFM_Foods[luaname]
	if TB then
		return TB
	end
	return false
end

local function HFMPreReg( c, t ) 
	local FOOD = HFMCreateTable(c, "Food")
	FOOD:SetPrintName(t[1][1])
	FOOD.Model = t[1][4]

	if t[3] == "CookedItem" then
		FOOD:SetCookingTime(t[4][1])
		for i = 1, #t[4][2], 2  do
			FOOD:AddIngredients(t[4][2][i], t[4][2][i + 1])
		end
	end
		
	FOOD:EatHunger(t[2][1], t[2][2])
	FOOD:EatThirsty(t[2][3], t[2][4])
	FOOD:EatHealth(t[2][5], t[2][6])

	HFMRegFood(FOOD)
end

for k, v in pairs( HFM_Config.TableFoods ) do
	HFMPreReg( k, v ) 
end

function GenerateFoodItem( index, amount )
	if CLIENT then return end
	local t = HFM_Config.TableFoods[index]
	-- local item = itemstore.items.New( "base_food" )
	-- item:SetData( "FoodBaseTabel", t )
	-- item:SetData( "DTTabel", t[1] )
	-- item:SetData( "FoodTabel", t[2] )
	-- item:SetData( "UniqueName", index )
	-- if amount then
	-- 	item:SetData( "Amount", amount )
	-- end
	local d = {
		["FoodBaseTabel"] = t,
		["DTTabel"] = t[1],
		["FoodTabel"] = t[2],
		["UniqueName"] = index,
	}
	if amount then
		d['Amount'] = amount
	end
	local item = itemstore.Item("base_food", d)

	return item
end

function GenerateSeedItem( index, amount )
	local item = itemstore.items.New( "base_seed" )
	item:SetData( "SeedTabel", HFM_Config.TableSeeds[index])
	item:SetData( "Model","models/props_lab/box01a.mdl")
	if amount then
		item:SetData( "Amount", amount )
	end
	return item
end

--PATH addons/111mod/lua/autorun/inclshit.lua:
local include_sv = (SERVER) and include or function() end
local include_cl = (SERVER) and AddCSLuaFile or include
local include_sh = function(path) include_sv(path) include_cl(path) end

local files = file.Find("50per/*.lua", "LUA")
for _, v in ipairs(files) do
	local path = "50per/"..v
	include_sh(path)
end

local pairs = pairs
if SERVER then
	util.AddNetworkString( "PlayerDisplayChat" )
	local PLAYER = FindMetaTable( "Player" )

    function PLAYER:SendMessage( ... )
         local args = { ... }
         net.Start( "PlayerDisplayChat" )
             net.WriteTable( args )
         net.Send( self )
    end

    function PLAYER:SendMessageFD( ... )
         local args = { ... }
         net.Start( "PlayerDisplayChat" )
             net.WriteTable( args )
         net.Send( self )
    end
    function PLAYER:svtext( ... )
         local args = { ... }
         net.Start( "PlayerDisplayChat" )
             net.WriteTable( args )
         net.Send( self )
    end
	function SendMessageAll( ... )
         local args = { ... }
         net.Start( "PlayerDisplayChat" )
             net.WriteTable( args )
         net.Broadcast()
    end
end

if CLIENT then
	net.Receive( "PlayerDisplayChat", function()
	    local args = net.ReadTable()
	    chat.AddText( unpack( args ) )
	end)
end
--PATH addons/leyhitreg/lua/autorun/init_marghitreg.lua:
if game.SinglePlayer() then
	return
end

CLHR = CLHR or {
	Exceptions = {
		weapon_zm_improvised = true,
	},
}

hook.Add("InitPostEntity", "CLHR_InitPostEntity", function()
	--timer.Simple(0, function()
		include("marghitreg/sh_marghitreg.lua")
	--end)
end)

hook.Add("PreGamemodeLoaded", "CLHR_PreGamemodeLoaded", function()
	if TTT_FOF then
		TTT_FOF.ClientsideHitreg = "MargHitreg"
	end
end)

--PATH addons/skin_jotaro_kujo/lua/autorun/jotarodiu.lua:

player_manager.AddValidModel("Jotaro kujo","models/gambitrp/matveicher/gaara/jotarodiu.mdl")

--PATH addons/newjukebox/lua/autorun/jukebox_init.lua:
JUKEBOX = {}
JUKEBOX.net = {}


net.Receive("jukebox_data",function(len,ply)
    local int = net.ReadInt(3)
    if JUKEBOX.net[int] then
        JUKEBOX.net[int](SERVER and ply or nil)
    else
        error("Cached unknown id or JUKEBOX. Fix it! (id: " .. int .. ")")
    end
end)

JUKEBOX.AddNetListen = function(num,func)
    if isnumber(num) and (num >= -4 and num <= 3) and isfunction(func) then
        JUKEBOX.net[num] = func
    end
end
JUKEBOX.StartNet = function(num,func)
    if isnumber(num) and (num >= -4 and num <= 3) and isfunction(func) then
        net.Start("jukebox_data")
        net.WriteInt(num,3)
        func()
    end
end

if SERVER then
    local requrl = "http://45.132.1.74:9999/index.js?id="
	AddCSLuaFile()
	AddCSLuaFile("jukebox/lang.lua")
	AddCSLuaFile("jukebox/interface.lua")
	AddCSLuaFile("jukebox/config.lua")
	include("jukebox/config.lua")

	util.AddNetworkString("jukebox_data")

	local function IsBoombox(ent,pl)
		local isjuke = ent:GetClass() == "jukebox"
		if !isjuke then print("WARNING: Got entity " .. tostring(ent) .. " from player " .. tostring(ply) .. " instead of a boombox.") return isjuke end
		if ent.UsedBy == nil or ent.UsedBy == pl:SteamID() or pl:IsSuperAdmin() then return true end
		return false
	end
	
	local function RequestSong(ply,ent,mdataSong,try)
	    local id = mdataSong.ref
		local function FailSend(body)
		    print("FAIL: "..body)
		    if try and try >= 3 then
    			JUKEBOX.StartNet(-1,function()
    				net.WriteBool(false)
    				net.Send(ply)
    			end)
		    end
		    try = try and try + 1 or 1
		    RequestSong(ply,ent,mdataSong,try)
		end
		local tries = 1
		local function LoadSong(dat)
		    if tries > 120 then FailSend() return end
		    tries = tries + 1
			if dat == "false" then FailSend() return end
			if dat == "wait" then timer.Simple(1,function() http.Fetch(requrl .. id,LoadSong,FailSend) end) return end
			if ent.UsedBy != nil then FailSend() return end
			-- if ply:canAfford(25) then
				-- ply:addMoney(-25)
				ent:SetNW2String("player", ply:SteamID())
				ent.UsedBy = ply:SteamID()
				-- DarkRP.notify(ply, 0, 8,"У вас было снято 25$!")
			-- else
				-- DarkRP.notify(ply, 1, 8,"Недостаточно денег!")
			-- return end
			local autoplay = net.ReadBool()
			-- mdataSong.ref = "https://mbhrp.com/api/mp3/ytdl/getmp3?id="..id
			mdataSong.ref = "http://45.132.1.74/yt/"..id..".mp3"
			JUKEBOX.StartNet(-1,function()
				net.WriteBool(true)
				net.Send(ply)
			end)


			JUKEBOX.StartNet(1,function()
				net.WriteEntity(ent)
				net.WriteInt(1,32)
				net.WriteBool(autoplay)
				net.WriteTable(mdataSong)
				net.Broadcast()
			end)
			timer.Create(ent:EntIndex() .. "autoplay", 2,1, function()
				if !ent:IsValid() then return end
				JUKEBOX.StartNet(1,function()
					net.WriteEntity(ent)
					net.WriteInt(2,32)
					net.Broadcast()
				end)
			end)
			timer.Create(ent:EntIndex().."time",mdataSong.time + 4 ,1,function() -- +4 sec compensation
				if !ent:IsValid() then return end
				ent:SetNW2String("player", "")
				ent.UsedBy = nil
				JUKEBOX.StartNet(1,function()
					net.WriteEntity(ent)
					net.WriteInt(3,32)
					net.Broadcast()
				end)
			end)
		end
		http.Fetch(requrl .. id,LoadSong,FailSend)
	end
	

	JUKEBOX.AddNetListen(1,function(ply) -- play song
		local ent = net.ReadEntity()
		if !IsBoombox(ent,ply) then return end
		if ent.UsedBy != nil then return end
		local mdataSong = net.ReadTable()
		if ent:Getowning_ent() != ply then return end
		RequestSong(ply,ent,mdataSong)
	end)

	JUKEBOX.AddNetListen(2,function(ply) -- resume song
		local ent = net.ReadEntity()
		if !IsBoombox(ent,ply) then return end
		if ent:Getowning_ent() != ply then return end
		JUKEBOX.StartNet(1,function()
			net.WriteEntity(ent)
			net.WriteInt(2,32)
			net.Broadcast()
		end)
		timer.Remove(ent:EntIndex() .. "autoplay")
	end)
	JUKEBOX.AddNetListen(3,function(ply) -- stop/skip song
		local ent = net.ReadEntity()
		if !IsBoombox(ent,ply) then return end
		if ent:Getowning_ent() != ply then return end
		--if ent.UsedBy == ply:SteamID() or ply:IsSuperAdmin() then
    		JUKEBOX.StartNet(1,function()
    			net.WriteEntity(ent)
    			net.WriteInt(3,32)
    			net.Broadcast()
    		end)
    		ent:SetNW2String("player", "")
    		ent.UsedBy = nil
    		timer.Remove(ent:EntIndex() .. "time")
    		timer.Remove(ent:EntIndex() .. "autoplay")
    	--end
	end)

end

if !CLIENT then return end
include("jukebox/lang.lua")
include("jukebox/interface.lua")
include("jukebox/config.lua")
local INTERFACE = {}

local function formatt(sec)
	local s = math.floor(sec % 60)
	return math.floor(sec / 60) .. ":" .. (s < 10 and "0" or "") .. s
end

local function dreq(text,title,func1,func2)

		local dres = Derma_Query( text,
			title,
			"Да",
			func1,
			"Нет",
			func2)
		function dres:Paint(w,h)
			surface.SetDrawColor( Color(25,25,25,255))
			surface.DrawRect(0,0,w,h)
			surface.SetDrawColor( Color(0,0,0,255) )
			surface.DrawOutlinedRect( 0,0,w,h )
		end
		local yes = dres:GetChildren()[6]:GetChildren()[1]
		yes:SetTextColor(Color(255,255,255))
		function yes:Paint(w,h)
			if yes.Depressed or yes.m_bSelected then
				draw.RoundedBox( 1, 0, 0, w, h, Color(50,205,50,255) )
			elseif yes.Hovered then
				draw.RoundedBox( 1, 0, 0, w, h, Color(30,155,30,255) )
			else
				draw.RoundedBox( 1, 0, 0, w, h, Color(80,80,80,255) )
			end
		end

		local no = dres:GetChildren()[6]:GetChildren()[2]
		no:SetTextColor(Color(255,255,255))
		function no:Paint(w,h)
			if no.Depressed or no.m_bSelected then
				draw.RoundedBox( 1, 0, 0, w, h, Color(255,50,50,255) )
			elseif no.Hovered then
				draw.RoundedBox( 1, 0, 0, w, h, Color(205,30,30,255) )
			else
				draw.RoundedBox( 1, 0, 0, w, h, Color(80,80,80,255) )
			end
		end

end


local themesel = 1


local function sendupdate(ent, mode,...)
	local prms = {...}
	JUKEBOX.StartNet(mode,function()
		net.WriteEntity(ent)
		-- if mode == 1 then --new song, loading, mdata
			-- net.WriteBool(prms[1])
			-- net.WriteTable(prms[2])
		-- end
		net.SendToServer()
	end)
end

INTERFACE.opengui = function(e)
	local frame = vgui.Create("DFrame")
	frame:SetSize(500,122)
	frame:Center()
	frame:SetTitle("")
	frame:SetVisible(true)
	frame:SetDraggable(false)
	frame:ShowCloseButton(false)
	frame:MakePopup()
	frame.Paint = function(self, w, h)
		surface.SetDrawColor(Color(46,0,100,255))
		surface.DrawRect( 0,0,w,h )
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].secondary )
		surface.DrawOutlinedRect( 2,2,w-4,h-4 )

		if e.error then
			draw.SimpleText( JUKEBOX.lang.error, "Trebuchet18",156, 18, JUKEBOX.config.themes[themesel].text_1, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			return
		end
		local art,name = "-","-"
		if e.mdata then
			art = e.mdata.artist
			name = e.mdata.name
		end
		draw.SimpleText( JUKEBOX.lang.artist .. ": " .. art, "Trebuchet18",64, 28, JUKEBOX.config.themes[themesel].text_1, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( JUKEBOX.lang.song .. ": " .. name, "Trebuchet18",64, 43, JUKEBOX.config.themes[themesel].text_1, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end

	local playpause = vgui.Create("DButton",frame)
	playpause:SetPos(10,64)
	playpause:SetSize(48,48)
	playpause:SetText("")
	playpause.Paint = function(self, w, h)
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].secondary )
		surface.DrawRect( 0,0,w,h )
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].primary )
		draw.NoTexture()
		if e.loading then
			for i = 1,4 do
				local t = os.clock() * 5
				local d = math.cos(t) * w / 3
				local x,y = math.cos(i / 2 * math.pi + t) * d,math.sin(i / 2 * math.pi + t) * d
				surface.DrawTexturedRectRotated(w / 2 + x,h / 2 + y,w / 5,w / 5,- i * 60 + t * d)
			end
			return
		end
		if IsValid(e.audio) then
			local st = e.audio:GetState()
			if st == GMOD_CHANNEL_PAUSED or st == GMOD_CHANNEL_STOPPED then
				surface.DrawPoly({
					{x = 10,y = 10},
					{x = w-10,y = h / 2},
					{x = 10, y = h-10},
				})
			end
		else
			surface.DrawPoly({
				{x = 10,y = 10},
				{x = w-10,y = h / 2},
				{x = 10,y = h-10},
			})
		end
	end
	playpause.DoClick = function()
		if IsValid(e.audio) then
			local st = e.audio:GetState()
			if st == GMOD_CHANNEL_PAUSED or st == GMOD_CHANNEL_STOPPED then
				sendupdate(e,2,e.audio:GetTime())
			end
		elseif e.mdata then
			--e:Play(e.mdata)
			e.mdata.start = CurTime()
			sendupdate(e,1,false,e.mdata)
		end
	end

	local stop = vgui.Create("DButton",frame)
	stop:SetPos(64,64)
	stop:SetSize(48,48)
	stop:SetText("")
	stop.Paint = function(self, w, h)
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].secondary )
		surface.DrawRect( 0,0,w,h )
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].primary )
		surface.DrawRect( 10,10,w-20,h-20 )
	end
	stop.DoClick = function()
		e.loading = nil
		if (!IsValid(e.audio) and e:GetNW2String("player") != "") or IsValid(e.audio) and (e:GetNW2String("player") == LocalPlayer():SteamID() or LocalPlayer():IsSuperAdmin()) then
			dreq("Пропустить песню?", "Пропуск", function()
				sendupdate(e,3)
			end,nil)
		end
	end

	local timeslider = vgui.Create( "DSlider", frame )
	timeslider:SetPos( 124, 96 )
	timeslider:SetSize( 360, 16 )
	timeslider:SetSlideX(0)
	timeslider:NoClipping(true)
	timeslider.Paint = function(self,w,h)
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].time_primary )
		surface.DrawRect( -6,0,w + 12,h )
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].time_secondary )
		surface.DrawRect( -6,0,w * self:GetSlideX(),h )
		if IsValid(e.audio) then
			draw.SimpleText( formatt(self:GetSlideX() * e.audio:GetLength()), "Trebuchet18",-6, -7, JUKEBOX.config.themes[themesel].text_1, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			draw.SimpleText( formatt(e.audio:GetLength()), "Trebuchet18",w + 6, -7, JUKEBOX.config.themes[themesel].text_1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
		end
	end
	timeslider.Knob:SetSize(12,18)
	timeslider.Knob.Paint = function(self,w,h)
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].time_scroll )
		surface.DrawRect( 0,0,w,h )
	end
	frame.Think = function()
		if IsValid(e.audio) and !timeslider:GetDragging() then
			timeslider:SetSlideX(e.audio:GetTime() / e.audio:GetLength())
		end
	end

	local volumeslider = vgui.Create( "DSlider", frame )
	volumeslider:SetPos( 118, 64 )
	volumeslider:SetSize( 100, 16 )
	volumeslider:SetSlideX(tonumber(GetConVar("jukebox_volume"):GetFloat()))
	volumeslider.Paint = function(self,w,h)
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].volume_inactive )
		surface.DrawRect( 0,0,w,h )
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].volume_active )
		surface.DrawRect( 0,0,w * self:GetSlideX(),h )
		draw.SimpleText( JUKEBOX.lang.volume or "Громкость", "Trebuchet18",w / 2,h / 2 + 0.5, JUKEBOX.config.themes[themesel].text_2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	volumeslider.Knob:SetSize(8,10)
	volumeslider.Knob.Paint = function(self,w,h) end
	local okvsor = volumeslider.Knob.OnMouseReleased
	volumeslider.Knob.OnMouseReleased = function(self,t)
		okvsor(self,t)
	end
	local ovsor = volumeslider.OnMouseReleased
	volumeslider.OnMouseReleased = function(self,t)
		ovsor(self,t)
		GetConVar("jukebox_volume"):SetFloat(self:GetSlideX())
	end

	local find = vgui.Create("DButton",frame)
	find:SetPos(10,10)
	find:SetSize(48,48)
	find:SetText("")
	find.Paint = function(self, w, h)
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].secondary )
		surface.DrawRect( 0,0,w,h )
		draw.RoundedBox(w / 2-13,19,2.5,w-25,h-25,JUKEBOX.config.themes[themesel].primary)
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].primary )
		draw.NoTexture()
		surface.DrawTexturedRectRotated(w / 2,h / 2,40,8,55)
		draw.RoundedBox(w / 2-17,21,4.5,w-29,h-29,JUKEBOX.config.themes[themesel].secondary)
	end
	find.DoClick = function()
		INTERFACE.opensearch(e)
	end

	local close = vgui.Create("DButton",frame)
	close:SetPos(458,10)
	close:SetSize(32,32)
	close:SetText("")
	close.Paint = function(self, w, h)
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].secondary )
		surface.DrawRect( 0,0,w,h )
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].primary )
		draw.NoTexture()
		surface.DrawTexturedRectRotated(w / 2,h / 2,w / 1.5,w / 5,45)
		surface.DrawTexturedRectRotated(w / 2,h / 2,w / 1.5,w / 5,-45)
	end
	close.DoClick = function()
		frame:Close()
	end
end

-----------------------------YOUTUBE-----------------------

local ytprovider = {}
ytprovider.extractinfo = function(str, ent)
	local data = {}

	local id = str.ref

	data.ref = function(dat)
		local frame = vgui.Create( "DFrame" )
		frame:SetSize( 300, 100 )
		frame:SetTitle( "" )
		frame:SetVisible( true )
		frame:Center()
		frame.Paint = function(self, w, h)
			surface.SetDrawColor( Color(46,0,100,255) )
			surface.DrawRect( 0,0,w,h )
			surface.SetDrawColor( JUKEBOX.config.themes[themesel].secondary )
			surface.DrawOutlinedRect( 2,2,w-4,h-4 )

			draw.SimpleText( "Подготовка аудио..", "Trebuchet18",150,20, JUKEBOX.config.themes[themesel].text_1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			draw.SimpleText( "Закройте окно для отмены.", "Trebuchet18",150,80, JUKEBOX.config.themes[themesel].text_1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			for i = 0,270,90 do
				local t = (i / 180 + CurTime() * 3) * math.pi
				local c,s = math.cos(t),math.sin(t)
				draw.NoTexture()
				surface.SetDrawColor(JUKEBOX.config.themes[themesel].text_1)
				surface.DrawTexturedRectRotated(150 + c * 12,50 + s * 12,5,5,- t * 10)
			end
		end

		local function FetchSong()
			if !IsValid(frame) then return end
			dat.ref = id
			JUKEBOX.StartNet(1,function()
				net.WriteEntity(ent)
				net.WriteTable(dat)
				net.WriteBool(true)
				net.SendToServer()
			end)

			JUKEBOX.AddNetListen(-1,function()
				if net.ReadBool() == false then
					chat.AddText("Музыкальный автомат на данный момент недоступен, приносим свои извинения!")
				end
				if IsValid(frame) then frame:Close() else chat.AddText("Ваша песня успешно загружена!") end
				JUKEBOX.AddNetListen(2,nil)
			end)
		end
		FetchSong()
		frame:MakePopup()
	end

	data.name = str.name

	data.artist = str.artist

	local t = string.Explode(":",str.time)
	data.time = 0
	for i = 1,#t do
		data.time = data.time * 60
		data.time = data.time + tonumber(t[i])
	end

	return data
end
ytprovider.makelist = function(body,ent)
	local f = function(callback)
		local ls = {}
		local json = util.JSONToTable(body)
		for k,v in pairs(json) do
			if v.time > 420 then continue end
			ls[#ls + 1] = ytprovider.extractinfo(v,ent)
		end
		callback(ls)
	end
	return f
end

--

local defaulttxtval = ""
local defaultlist = {}

INTERFACE.opensearch = function(e)
	local frame = vgui.Create("DFrame")
	frame:SetSize(384,512)
	frame:Center()
	frame:SetTitle("")
	frame:SetVisible(true)
	frame:SetDraggable(false)
	frame:MakePopup()
	frame.Paint = function(self, w, h)
		surface.SetDrawColor( Color(46,0,100,255) )
		surface.DrawRect( 0,0,w,h )
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].secondary )
		surface.DrawOutlinedRect( 2,2,w-4,h-4 )
	end

	local sheet = vgui.Create( "DPropertySheet", frame )
	sheet:SetSize(364,40)
	sheet:SetPos(10,20)
	sheet:SetPadding(0)

	local nlist = vgui.Create( "DListView", frame )
	nlist:SetPos(10,70)
	nlist:SetSize(364,396)

	nlist:SetMultiSelect( false )
	local c = nlist:AddColumn( JUKEBOX.lang.time )
	c:SetWidth(50)
	c = nlist:AddColumn( JUKEBOX.lang.artist )
	c:SetWidth(100)
	c = nlist:AddColumn( JUKEBOX.lang.song )
	c:SetWidth(214)
	for i,v in ipairs(defaultlist) do
			nlist:Clear()
	end

	local function addprovider(shet,name,searchlink,listfunc,icon,tooltip)
		local nselect = vgui.Create( "DTextEntry", shet )
		local pnl = shet:AddSheet( name, nselect, icon ,false,false,tooltip)
		nselect:Dock(NODOCK )
		nselect:SetPos( 0,20 )
		nselect:SetText( defaulttxtval )
		nselect.OnEnter = function( self )
			local char_to_hex = function(ch)
				return string.format("%%%02X", string.byte(ch))
			end
			local function urlencode(url)
				url = url:gsub('\n', '\r\n')
				url = url:gsub('([^%w ])', char_to_hex)
				url = url:gsub(' ', '+')
				return url
			end
			local etxt = self:GetValue() or ""
			etxt = urlencode(etxt)

			if etxt != "" then
				nlist:Clear()
				nlist:AddLine("","Loading","")
				http.Fetch(searchlink .. etxt,function(body)
					local ret = listfunc(body,e)
					ret(function(ls)
						defaultlist = ls
						if IsValid(nlist) then
							nlist:Clear()
							for i = 1,#defaultlist do
								local mdata = defaultlist[i]
								nlist:AddLine(formatt(mdata.time),mdata.artist,mdata.name)
							end
						end
					end)
				end,function(err)
					defaultlist = {}
					if IsValid(nlist) then
						nlist:Clear()
					end
				end)
			end
		end
		return pnl.Tab
	end
	addprovider(sheet,"YouTube","https://mbhrp.com/api/mp3/ytsearch?name=",ytprovider.makelist,"icon16/film.png","Improved!")


	local selects = vgui.Create("DButton",frame)
	selects:SetPos(10,476)
	selects:SetSize(364,26)
	selects:SetText("")
	selects.Paint = function(self, w, h)
		surface.SetDrawColor( JUKEBOX.config.themes[themesel].secondary )
		surface.DrawRect( 0,0,w,h )
		local ch = JUKEBOX.config.themes[themesel].text_2
		if nlist:GetSelectedLine() then
			ch = JUKEBOX.config.themes[themesel].text_1
		end
		draw.SimpleText( JUKEBOX.lang.select, "Trebuchet24",w / 2,h / 2, ch, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	selects.DoClick = function()
		if e:GetNW2String("player") == "" then
			dreq("Поставить это песню?\n P.S. в редких случаях песня может не запуститься!\n	Дожидайтесь загрузки песни до конца!\n(если дольше 2 минут то песня не может быть загружена!)","Выбор песни", function()
				local l = nlist:GetSelectedLine()
				if l then
					frame:Close()
					if IsValid(e.audio) then
						sendupdate(e,4)
					end
					defaultlist[l].ref(defaultlist[l])
				end
			end,
			nil)
		end
	end
	local osel = sheet.SetActiveTab
	function sheet:SetActiveTab( active )
		if active.disabled then return end
		active:GetPanel():RequestFocus()
		osel(self,active)
	end
	sheet:GetChild(1):RequestFocus()

end

JUKEBOX.AddNetListen(0,function ()
	local e = net.ReadEntity()
	INTERFACE.opengui(e)
end)

JUKEBOX.AddNetListen(1,function()
	local e = net.ReadEntity()
	if !e:IsValid() then return end
	local cmd = net.ReadInt(32)
	if cmd==1 then
		local time = CurTime()
		local autoplay = net.ReadBool()
		local mdata = net.ReadTable()
		e:Play(mdata,autoplay,time)
	elseif cmd==2 then
		if IsValid(e.audio) then
			e.audio:Play()
		else
			e.shouldplay = {net.ReadFloat(),net.ReadFloat()}
		end
	elseif cmd==3 then
		if IsValid(e.audio) then
			e.audio:Stop()
		end
		e.loading = nil
		e.audio = nil
		e.mdata = nil
		e.error = false
	end
end)
--PATH addons/newjukebox/lua/jukebox/interface.lua:
-- -- --
local INTERFACE = {}

INTERFACE.preview = function(self,width,height)
end

INTERFACE.opengui = function(e)
end

JUKEBOX.interface = INTERFACE


--PATH addons/vehicles_realisticbike_ktm_duke_690_wheeling_available_1734895325/lua/autorun/ktm_690.lua:
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

cheapbonemanips["NoRealistBikeKTMDuke690"] = {
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

cheapbonemanips["InRealistBikeKTMDuke690"] = {
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


hook.Add("PlayerEnteredVehicle","RealisticFixBoneKTMDuke690",function( ply, veh, role )
	if veh:GetVehicleClass()=="realistic_bike_ktm_690" then
		for k,v in pairs(cheapbonemanips["InRealistBikeKTMDuke690"]) do
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

hook.Add("PlayerLeaveVehicle","RealisticFixBoneKTMDuke690",function( ply, veh )
	if veh:GetVehicleClass()=="realistic_bike_ktm_690" then
		for k,v in pairs(cheapbonemanips["NoRealistBikeKTMDuke690"]) do
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
		for k,v in pairs(cheapbonemanips["InRealistBikeKTMDuke690"]) do
			local boneid = ply:LookupBone(k)
			if boneid then
				ply:ManipulateBonePosition(boneid,v[1])
				ply:ManipulateBoneAngles(boneid,v[2])
			end
		end
	elseif Word=="Exit" then
		for k,v in pairs(cheapbonemanips["NoRealistBikeKTMDuke690"]) do
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
				Name = "KTM Duke 690", 
				Class = "prop_vehicle_jeep",
				Category = Category,

				Information = "CeiLciuZ",
				Model = "models/realistic_bike/ktm_duke_690.mdl",

				KeyValues = {
								vehiclescript	=	"scripts/vehicles/ceil-code/ktm_duke_690.txt"
							},
				Members = {
								HandleAnimation = HandleBoatVehicleAnimation,
				}
			}
list.Set( "Vehicles", "realistic_bike_ktm_690", V )
--PATH addons/vehicles_lw_quad_bikes_309880608/lua/autorun/lwcars_polarisquad6x6.lua:
local V = {
			Name = "Polaris Quad 6x6", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable quad by LoneWolfie",
			Model = "models/LoneWolfie/polaris_6x6.mdl",
					
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/polaris_6x6.txt"
							}
			}
list.Set("Vehicles", "polaris_6x6_lw", V)

--PATH addons/_adminmodules_menu/lua/sui/libs/bshadows.lua:
local ScrW = ScrW
local ScrH = ScrH

local sin = math.sin
local cos = math.cos
local rad = math.rad
local ceil = math.ceil

local Start2D = cam.Start2D
local End2D = cam.End2D

local PushRenderTarget = render.PushRenderTarget
local OverrideAlphaWriteEnable = render.OverrideAlphaWriteEnable
local Clear = render.Clear
local CopyRenderTargetToTexture = render.CopyRenderTargetToTexture
local BlurRenderTarget = render.BlurRenderTarget
local PopRenderTarget = render.PopRenderTarget
local SetMaterial = render.SetMaterial
local DrawScreenQuadEx = render.DrawScreenQuadEx
local DrawScreenQuad = render.DrawScreenQuad

local RenderTarget, RenderTarget2
local load_render_targets = function()
	local w, h = ScrW(), ScrH()
	RenderTarget = GetRenderTarget("sui_bshadows_original" .. w .. h, w, h)
	RenderTarget2 = GetRenderTarget("sui_bshadows_shadow" .. w .. h,  w, h)
end
load_render_targets()
hook.Add("OnScreenSizeChanged", "SUI.BShadows", load_render_targets)

local ShadowMaterial = CreateMaterial("sui_bshadows", "UnlitGeneric", {
	["$translucent"] = 1,
	["$vertexalpha"] = 1,
	["alpha"] = 1
})

local ShadowMaterialGrayscale = CreateMaterial("sui_bshadows_grayscale", "UnlitGeneric", {
	["$translucent"] = 1,
	["$vertexalpha"] = 1,
	["$alpha"] = 1,
	["$color"] = "0 0 0",
	["$color2"] = "0 0 0"
})

local SetTexture = ShadowMaterial.SetTexture

local BSHADOWS = {}

BSHADOWS.BeginShadow = function()
	PushRenderTarget(RenderTarget)

	OverrideAlphaWriteEnable(true, true)
	Clear(0, 0, 0, 0)
	OverrideAlphaWriteEnable(false, false)

	Start2D()
end

BSHADOWS.EndShadow = function(intensity, spread, blur, opacity, direction, distance, _shadowOnly)
	opacity = opacity or 255
	direction = direction or 0
	distance = distance or 0

	CopyRenderTargetToTexture(RenderTarget2)

	if blur > 0 then
		OverrideAlphaWriteEnable(true, true)
		BlurRenderTarget(RenderTarget2, spread, spread, blur)
		OverrideAlphaWriteEnable(false, false)
	end

	PopRenderTarget()

	SetTexture(ShadowMaterial, "$basetexture", RenderTarget)
	SetTexture(ShadowMaterialGrayscale, "$basetexture", RenderTarget2)

	local xOffset = sin(rad(direction)) * distance
	local yOffset = cos(rad(direction)) * distance

	SetMaterial(ShadowMaterialGrayscale)
	for i = 1, ceil(intensity) do
		DrawScreenQuadEx(xOffset, yOffset, ScrW(), ScrH())
	end

	if not _shadowOnly then
		SetTexture(ShadowMaterial, "$basetexture", RenderTarget)
		SetMaterial(ShadowMaterial)
		DrawScreenQuad()
	end

	End2D()
end

sui.BSHADOWS = BSHADOWS
--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_query_box.lua:
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
--PATH addons/battlepass/lua/autorun/sh_battlepass_load.lua:
encbp = encbp or {}
encbp.clrs = encbp.clrs or {}
encbp.bp = encbp.bp or {}

local function IncludeDir(path)
    local f,d = file.Find(path..'/*','LUA')

    for k, v in ipairs(f) do 
        local a = path..'/'..v
        local pref = v:sub(1,3)
        if pref == 'cl_' then 
            if CLIENT then 
                include(a)
            else 
                AddCSLuaFile(a)
            end
        elseif pref == 'sv_' then
            include(a)
        else 
            AddCSLuaFile(a)
            include(a)
        end
    end

    for k,v in ipairs(d) do 
        IncludeDir(path..'/'..v)
    end
end

IncludeDir('battlepass')
--PATH addons/battlepass/lua/battlepass/vgui/cl_task.lua:
local vgui_Register = vgui.Register
local box = draw.RoundedBox
local text = draw.SimpleText
local PANEL = {}

function PANEL:SetData(tbl)
    self.tbl = tbl
end

function PANEL:SetDesc(text)
    self.desc = vgui.Create('DLabel', self)
    self.desc:SetSize(encbp.w(466), encbp.h(36))
    self.desc:SetPos(encbp.w(27), encbp.h(46))
    self.desc:SetText(text)
    self.desc:SetTextColor(encbp.clrs.white)
    self.desc:SetFont('TTL10')
    self.desc:SetWrap(true)
end

local function getmat(mat)
    return Material('materials/enc_bp/'..mat..'.png', 'smooth noclamp') 
end

local mat1 = getmat('rectanglasdasde_4892ad')
local mat2 = getmat('group_37082')

function PANEL:Paint(w, h)
    surface.SetFont('TTB16')

    surface.SetMaterial(mat1)
    surface.SetDrawColor(222, 222, 222)
    surface.DrawTexturedRect(0, 0, w, h)
    text(self.tbl.title, 'TT18', encbp.w(27), encbp.h(20))

    local myprogress, maxprogress = self.tbl.check(LocalPlayer())
    if self.tbl.completed then
        text('Выполнено', 'TT14', encbp.w(415), encbp.h(97))
    else
        text(myprogress, 'TTB16', encbp.w(415), encbp.h(97))
        local x = surface.GetTextSize(myprogress)
        text('из ' .. maxprogress, 'TTL10', encbp.w(415) + x + encbp.w(3), encbp.h(100), encbp.clrs.whitea)
    end

    local y = encbp.h(103)
    for i = 0, 2 do
        local x = encbp.w(28) + i * (encbp.w(119) + encbp.w(10))
        surface.SetMaterial(mat2)
        surface.SetDrawColor(222, 222, 222)
        surface.DrawTexturedRect(x, encbp.h(103), encbp.w(119), encbp.h(6))
    end

    local progress = (encbp.w(119) + encbp.w(10)) * 3 * myprogress / maxprogress
    local progressw = math.floor(progress / (encbp.w(119) + encbp.w(10)))
    
    if progressw > 3 then progressw = 0 end
    for i = 0, progressw - 1 do
        local x = encbp.w(28) + i * (encbp.w(119) + encbp.w(10))
        box(0, x, y, encbp.w(119), encbp.h(6), encbp.clrs.purple)
    end

    local remainderWidth = progress - progressw * (encbp.w(119) + encbp.w(10))
    if remainderWidth > 0 and progressw < 3 then
        local x = encbp.w(28) + progressw * (encbp.w(119) + encbp.w(10))
        box(0, x, y, math.min(remainderWidth, encbp.w(119)), encbp.h(6), encbp.clrs.purple)
    end

    if self.tbl.completed then
        for i = 0, 2 do
            local x = encbp.w(28) + i * (encbp.w(119) + encbp.w(10))
            box(0, x, y, encbp.w(119), encbp.h(6), encbp.clrs.purple)
        end
    end
end

vgui_Register('bp.task', PANEL, 'EditablePanel')
--PATH addons/truefishing/lua/autorun/sh_fishconfigs.lua:
/*
WARNING: DO NOT MODIFY THIS FILE FOR CONFIGURATION. USE THE IN-GAME CONFIGURATION MENU!
*/

-- TODO: ЗАГЛУШКА ПОТОМ УБРАТЬ
TEAM_FISH = TEAM_FISH or 1

FISH_MULLET = 1
FISH_TIGERFISH = 2
FISH_TROUT = 3
FISH_FLYINGFISH = 4
FISH_GOLDENFISH = 5
FISH_CATFISH = 6
FISH_BASSFISH = 7
FISH_JUNK = 8

FISH_HIGHNUMBER = 8

local FishModels = {}
FishModels[FISH_MULLET] = "models/tsbb/fishes/mullet.mdl"
FishModels[FISH_TIGERFISH] = "models/tsbb/fishes/tiger_fish.mdl"
FishModels[FISH_TROUT] = "models/tsbb/fishes/trout.mdl"
FishModels[FISH_FLYINGFISH] = "models/tsbb/fishes/flying_fish.mdl"
FishModels[FISH_GOLDENFISH] = "models/tsbb/fishes/goldfish.mdl"
FishModels[FISH_CATFISH] = "models/tsbb/fishes/catfish.mdl"
FishModels[FISH_BASSFISH] = "models/tsbb/fishes/bass.mdl"
FishModels[FISH_JUNK] = {"models/props_junk/garbage_metalcan001a.mdl",
"models/props_junk/garbage_metalcan002a.mdl",
"models/props_junk/garbage_milkcarton001a.mdl",
"models/props_junk/garbage_milkcarton002a.mdl",
"models/props_junk/garbage_newspaper001a.mdl",
"models/props_junk/garbage_plasticbottle001a.mdl",
"models/props_junk/garbage_plasticbottle002a.mdl",
"models/props_junk/garbage_plasticbottle003a.mdl"}
function TrueFishGetFishModel(int)
	return int == FISH_JUNK and FishModels[int][math.random(#FishModels[int])] or FishModels[int]
end

local FishNames = {}
FishNames[FISH_MULLET] = "Кефаль"
FishNames[FISH_TIGERFISH] = "Тигровая рыба"
FishNames[FISH_TROUT] = "Форель"
FishNames[FISH_FLYINGFISH] = "Летучая рыба"
FishNames[FISH_GOLDENFISH] = "Золотая рыбка"
FishNames[FISH_CATFISH] = "Рыба-кошка"
FishNames[FISH_BASSFISH] = "Окунь"
FishNames[FISH_JUNK] = "Мусор"
function TrueFishGetFishName(int)
	return FishNames[int]
end

FISH_GEAR_BAIT = 1
FISH_GEAR_MEDIUMCAGE = 2
FISH_GEAR_LARGECAGE = 3
FISH_GEAR_CONTAINER = 4
FISH_GEAR_ROD = 5
FISH_GEAR_ROD_2 = 6
FISH_GEAR_ROD_3 = 7
FISH_GEAR_FISHFINDER = 8

FISH_GEAR_HIGHNUMBER = 8

local GearVIP = {}
GearVIP[FISH_GEAR_ROD_3] = true
function TrueFishIsVIP(int)
	return GearVIP[int] or false
end

local GearModels = {}
GearModels[FISH_GEAR_BAIT] = "models/props_junk/garbage_bag001a.mdl"
GearModels[FISH_GEAR_MEDIUMCAGE] = "models/props_junk/wood_crate002a.mdl"
GearModels[FISH_GEAR_LARGECAGE] = "models/hunter/blocks/cube075x2x1.mdl"
GearModels[FISH_GEAR_CONTAINER] = "models/props_junk/cardboard_box001a.mdl"
GearModels[FISH_GEAR_ROD] = "models/fishing/pole.mdl"
GearModels[FISH_GEAR_ROD_2] = "models/fishing/pole.mdl"
GearModels[FISH_GEAR_ROD_3] = "models/fishing/pole.mdl"
GearModels[FISH_GEAR_FISHFINDER] = "models/props_lab/monitor01b.mdl"
function TrueFishGetGearModel(int)
	return GearModels[int]
end

if CLIENT then
	local GearMaterials = {}
	--GearMaterials[FISH_GEAR_BAIT] = "models/flesh"
	GearMaterials[FISH_GEAR_MEDIUMCAGE] = "!CagePotMaterial"
	GearMaterials[FISH_GEAR_LARGECAGE] = "!CagePotMaterial"
	GearMaterials[FISH_GEAR_CONTAINER] = "phoenix_storms/bluemetal"
	function TrueFishGetGearMaterial(int)
		return GearMaterials[int]
	end
end

local GearNames = {}
GearNames[FISH_GEAR_BAIT] = "Наживка" --"Fish Bait"
GearNames[FISH_GEAR_MEDIUMCAGE] = "Средняя клетка" --"Medium Fish Cage"
GearNames[FISH_GEAR_LARGECAGE] = "Большая клетка" --"Large Fish Cage"
GearNames[FISH_GEAR_CONTAINER] = "Рыбный контейнер" --"Fish Container"
GearNames[FISH_GEAR_ROD] = "Удочка" --"Fishing Rod"
GearNames[FISH_GEAR_ROD_2] = "Удочка 2-го уровня" --"VIP Rod"
GearNames[FISH_GEAR_ROD_3] = "[VIP] Удочка 3-го уровня" --"Premium Rod"
GearNames[FISH_GEAR_FISHFINDER] = "Радар" --"Fish Finder"
function TrueFishGetGearName(int)
	return GearNames[int]
end

local GearEntity = {}
GearEntity[FISH_GEAR_BAIT] = "fish_bait"
GearEntity[FISH_GEAR_MEDIUMCAGE] = "fishing_pot_medium"
GearEntity[FISH_GEAR_LARGECAGE] = "fishing_pot_large"
GearEntity[FISH_GEAR_CONTAINER] = "fish_container"
function TrueFishGetGearEntityName(int)
	return GearEntity[int]
end

local GearWeapon = {}
GearWeapon[FISH_GEAR_ROD] = "fishing_rod"
GearWeapon[FISH_GEAR_ROD_2] = "fishing_rod_2"
GearWeapon[FISH_GEAR_ROD_3] = "fishing_rod_3"
function TrueFishGetGearWeapon(int)
	return GearWeapon[int]
end

FISH_MAX_DEPTH = 999

TrueFish = TrueFish or {

FIRSTPERSON_FISHING = true,
OPTIMIZED_FISHING = true,
CAGE_NO_FISH_MODEL = false,
CAGE_BUOY_SPLASHING = true,
MEDIUM_CAGE_FISH_LIMIT = 10,
LARGE_CAGE_FISH_LIMIT = 15,
FISH_CONTAINER_LIMIT = 15,
CONTAINERS_DISABLED = false,
MEDIUM_CAGE_LIMIT = 2,
LARGE_CAGE_LIMIT = 2,
CONTAINER_LIMIT = 2,
CAGE_SHARED_LIMIT = true,
MEDIUM_JUNK_CHANCE = 11,
LARGE_JUNK_CHANCE = 10,
ROD_NO_CONTAINER = true,
FISH_CARRY_LIMIT = 20,
ROD_PHYSICS_FISHING = false,
ROD_SEPERATE_CATCH_TIME_ENABLED = false,
ROD_SEPERATE_CATCH_TIME = 5,
ROD_CATCH_WINDOW = 0.33,
ROD_FISH_BAIT_AMOUNT = 10,
ROD_JUNK_CHANCE = 5,
ROD_MONEYBAG_CHANCE = 0,
ROD_MONEYBAG_MONEY = 500,
ROD_LEVEL_DEPTH = 300,
CAN_PHYSGUN_GEAR = false,
FISH_CONTAINER_OWNER_DISCARD = false, //imp
FISH_BAIT_AUTOREMOVE = 0, //imp
FISH_MINIGAME = true,
FISHER_MODEL = "models/Eli.mdl",

LOCALISATION_LANGUAGE = "Russian",

FISH_CATCH_TIME = {
[FISH_MULLET] = {6 ,10},
[FISH_TIGERFISH] = {5 ,11},
[FISH_TROUT] = {7 ,17},
[FISH_FLYINGFISH] = {8 ,16},
[FISH_GOLDENFISH] = {10 ,19},
[FISH_CATFISH] = {13 ,22},
[FISH_BASSFISH] = {10 ,30}
},

FISH_DEPTH = {
[FISH_MULLET] = 0,
[FISH_TIGERFISH] = 0,
[FISH_TROUT] = 0,
[FISH_FLYINGFISH] = 1,
[FISH_GOLDENFISH] = 1,
[FISH_CATFISH] = 2,
[FISH_BASSFISH] = 2
},

FISH_ENABLED = {
[FISH_MULLET] = true,
[FISH_TIGERFISH] = true,
[FISH_TROUT] = true,
[FISH_FLYINGFISH] = true,
[FISH_GOLDENFISH] = true,
[FISH_CATFISH] = true,
[FISH_BASSFISH] = true,
[FISH_JUNK] = false
},

FISH_PRICE = {
[FISH_MULLET] = 1900,
[FISH_TIGERFISH] = 2000,
[FISH_TROUT] = 2100,
[FISH_FLYINGFISH] = 2200,
[FISH_GOLDENFISH] = 2300,
[FISH_CATFISH] = 2400,
[FISH_BASSFISH] = 2500,
[FISH_JUNK] = 10,
},

GEAR_PRICE = {
[FISH_GEAR_BAIT] = 800,
[FISH_GEAR_MEDIUMCAGE] = 750,
[FISH_GEAR_LARGECAGE] = 1500,
[FISH_GEAR_CONTAINER] = 200,
[FISH_GEAR_ROD] = 3000,
[FISH_GEAR_ROD_2] = 6000,
[FISH_GEAR_ROD_3] = 9000,
[FISH_GEAR_FISHFINDER] = 150,
},

GEAR_ENABLED = {
[FISH_GEAR_BAIT] = true,
[FISH_GEAR_MEDIUMCAGE] = false,
[FISH_GEAR_LARGECAGE] = false,
[FISH_GEAR_CONTAINER] = false,
[FISH_GEAR_ROD] = true,
[FISH_GEAR_ROD_2] = true,
[FISH_GEAR_ROD_3] = true,
[FISH_GEAR_FISHFINDER] = false,
},

}

// example: TrueFishAddFish("GOLDFISH2", "Gold Fish", "models/props/de_inferno/GoldFish.mdl", {10, 20}, {100, 150}, 50)
function TrueFishAddFish(variableName, name, model, catchTime, depth, price, notDisabled)
	FISH_HIGHNUMBER = FISH_HIGHNUMBER + 1
	_G["FISH_"..variableName] = FISH_HIGHNUMBER
	FishNames[FISH_HIGHNUMBER] = name
	FishModels[FISH_HIGHNUMBER] = model
	TrueFish.FISH_CATCH_TIME[FISH_HIGHNUMBER] = catchTime
	TrueFish.FISH_DEPTH[FISH_HIGHNUMBER] = depth
	TrueFish.FISH_PRICE[FISH_HIGHNUMBER] = price
	TrueFish.FISH_ENABLED[FISH_HIGHNUMBER] = !notDisabled

	return FISH_HIGHNUMBER
end

function TrueFishAddGear(variableName, name, model, price, notDisabled)
	FISH_GEAR_HIGHNUMBER = FISH_HIGHNUMBER + 1
	_G["FISH_GEAR_"..variableName] = FISH_HIGHNUMBER
	GearNames[FISH_HIGHNUMBER] = name
	GearModels[FISH_HIGHNUMBER] = model
	TrueFish.GEAR_PRICE[FISH_HIGHNUMBER] = price
	TrueFish.GEAR_ENABLED[FISH_HIGHNUMBER] = !notDisabled

	return FISH_GEAR_HIGHNUMBER
end

function TrueFishCalculateFish(depth, fullTable)
	local tbl = {}
	for i=1, FISH_HIGHNUMBER do
		if i != FISH_JUNK and TrueFish.FISH_ENABLED[i] and depth >= TrueFish.FISH_DEPTH[i] then
			tbl[#tbl+1] = i 
		end
	end
	return fullTable and tbl or tbl[math.random(#tbl)]
end

--PATH MediaLib_DynFile_soundcloud.lua:
local oop = medialib.load("oop")

local SoundcloudService = oop.class("SoundcloudService", "BASSService")
SoundcloudService.identifier = "soundcloud"

local all_patterns = {
	"^https?://www.soundcloud.com/([A-Za-z0-9_%-]+/[A-Za-z0-9_%-]+)/?.*$",
	"^https?://soundcloud.com/([A-Za-z0-9_%-]+/[A-Za-z0-9_%-]+)/?.*$",
}

-- Support url that passes track id directly
local id_pattern = "^https?://api.soundcloud.com/tracks/(%d+)"

function SoundcloudService:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local path = string.match(url, pattern)
		if path then
			return {path = path}
		end
	end

	local id = string.match(url, id_pattern)
	if id then
		return {id = id}
	end
end

function SoundcloudService:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

function SoundcloudService:resolveUrl(url, callback)
	local apiKey = medialib.SOUNDCLOUD_API_KEY
	if not apiKey then
		ErrorNoHalt("SoundCloud error: Missing SoundCloud API key")
		return
	end

	if type(apiKey) == "table" then
		apiKey = table.Random(apiKey)
	end

	local urlData = self:parseUrl(url)

	if urlData.id then
		-- id passed directly; nice, we can skip resolve.json
		callback(string.format("https://api.soundcloud.com/tracks/%s/stream?client_id=%s", urlData.id, apiKey), {})
	else
		http.Fetch(
			string.format(
				"https://api.soundcloud.com/resolve.json?url=http://soundcloud.com/%s&client_id=%s",
				urlData.path, apiKey
			),
			function(data)
				local jsonTable = util.JSONToTable(data)
				if not jsonTable then
					ErrorNoHalt("Failed to retrieve SC track id for " .. urlData.path .. ": empty JSON")
					return
				end

				local id = jsonTable.id
				callback(string.format("https://api.soundcloud.com/tracks/%s/stream?client_id=%s", id, apiKey), {})
			end)
	end
end

function SoundcloudService:directQuery(url, callback)
	local apiKey = medialib.SOUNDCLOUD_API_KEY
	if not apiKey then
		callback("Missing SoundCloud API key")
		return
	end

	if type(apiKey) == "table" then
		apiKey = table.Random(apiKey)
	end

	local urlData = self:parseUrl(url)

	local metaurl
	if urlData.path then
		metaurl = string.format(
			"https://api.soundcloud.com/resolve.json?url=http://soundcloud.com/%s&client_id=%s",
			urlData.path, apiKey
		)
	else
		metaurl = string.format("https://api.soundcloud.com/tracks/%s?client_id=%s", urlData.id, apiKey)
	end

	http.Fetch(metaurl, function(result, size)
		if size == 0 then
			callback("http body size = 0")
			return
		end

		local entry = util.JSONToTable(result)

		if entry.errors then
			local msg = entry.errors[1].error_message or "error"

			local translated = msg
			if string.StartWith(msg, "404") then
				translated = "Invalid id"
			end

			callback(translated)
			return
		end

		callback(nil, {
			title = entry.title,
			duration = tonumber(entry.duration) / 1000
		})
	end, function(err) callback("HTTP: " .. err) end)
end

return SoundcloudService

--PATH addons/111mod/lua/autorun/sh_optimisation.lua:
hook.Add("Initialize","NoWidgets",function()

 	-- Usually the cause of some if not most lag.
 	hook.Remove("PlayerTick", "TickWidgets")
 
 	if SERVER then	
 		if timer.Exists("CheckHookTimes") then
 			timer.Remove("CheckHookTimes")
 		end
 	end
	
 	hook.Remove("PlayerTick","TickWidgets")
	hook.Remove( "Think", "CheckSchedules")
	timer.Remove("HostnameThink")
	hook.Remove("LoadGModSave", "LoadGModSave")
		
	for k, v in pairs(ents.FindByClass("env_fire")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("trigger_hurt")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("prop_physics")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("prop_ragdoll")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("light")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("spotlight_end")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("beam")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("point_spotlight")) do v:Remove() end
	for k, v in pairs(ents.FindByClass("env_sprite")) do v:Remove() end
	for k,v in pairs(ents.FindByClass("func_tracktrain")) do v:Remove() end
	for k,v in pairs(ents.FindByClass("light_spot")) do v:Remove() end
	for k,v in pairs(ents.FindByClass("point_template")) do v:Remove() end
	
	// Remove a bunch of useless map stuff 
	
	 if CLIENT then
 		-- These call on bloated convar getting methods and aren't ever used anyway outside of sandbox.
 		hook.Remove("RenderScreenspaceEffects", "RenderColorModify")
 		hook.Remove("RenderScreenspaceEffects", "RenderBloom")
 		hook.Remove("RenderScreenspaceEffects", "RenderToyTown")
 		hook.Remove("RenderScreenspaceEffects", "RenderTexturize")
 		hook.Remove("RenderScreenspaceEffects", "RenderSunbeams")
 		hook.Remove("RenderScreenspaceEffects", "RenderSobel")
 		hook.Remove("RenderScreenspaceEffects", "RenderSharpen")
 		hook.Remove("RenderScreenspaceEffects", "RenderMaterialOverlay")
 		hook.Remove("RenderScreenspaceEffects", "RenderMotionBlur")
 		hook.Remove("RenderScene", "RenderStereoscopy")
 		hook.Remove("RenderScene", "RenderSuperDoF")
 		hook.Remove("GUIMousePressed", "SuperDOFMouseDown")
 		hook.Remove("GUIMouseReleased", "SuperDOFMouseUp")
 		hook.Remove("PreventScreenClicks", "SuperDOFPreventClicks")
 		hook.Remove("PostRender", "RenderFrameBlend")
 		hook.Remove("PreRender", "PreRenderFrameBlend")
 		hook.Remove("Think", "DOFThink")
 		hook.Remove("RenderScreenspaceEffects", "RenderBokeh")
 		hook.Remove("NeedsDepthPass", "NeedsDepthPass_Bokeh")
 		hook.Remove("PostDrawEffects", "RenderWidgets")  		-- We don't need this, but what the hell.
 		hook.Remove("PostDrawEffects", "RenderHalos") 		-- If you have pointshop issues, then delete this line.
 	end
	
end)

if CLIENT then
	hook.Add("InitPostEntity","NoVCMOD",function()
		timer.Simple( 60, function() 
			hook.Remove("HUDPaint", "VC_HUDPaint")
			-- hook.Remove("Think", "VC_Think")
		end)
	end)
end


hook.Add("OnEntityCreated","WidgetInit",function(ent) -- C+P from Facepunch
	if ent:IsWidget() then
		hook.Add( "PlayerTick", "TickWidgets", function( pl, mv ) widgets.PlayerTick( pl, mv ) end ) 
		hook.Remove("OnEntityCreated","WidgetInit") -- calls it only once
	end
end)

--PATH addons/_adminmodules/lua/ulx/modules/sh/upravigor.lua:
CATEGORY_NAME = "Управление игроками"

function ulx.respawn( calling_ply, target_ply )
	if ulx.getExclusive( target_ply, calling_ply ) then
		ULib.tsayError( calling_ply, ulx.getExclusive( target_ply, calling_ply ), true )
		return
	end
			if target_ply:Alive() then 
				target_ply:Kill()
			end
			timer.Simple(0, function()
				target_ply:Spawn()
			end)
		ulx.fancyLogAdmin( calling_ply, true, "#A воскресил #T", target_ply )
	
	tblCountrespawn = tblCountrespawn or {}
    tblCountrespawn[calling_ply] = tblCountrespawn[calling_ply] and tblCountrespawn[calling_ply] or 0
    tblCountrespawn[calling_ply] = tblCountrespawn[calling_ply] + 1
	
    if tblCountrespawn and tblCountrespawn[calling_ply] > 9 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"respawn")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountrespawn") then
		timer.Create(calling_ply:UserID().."tblCountrespawn",60,1, function()   
			tblCountrespawn[calling_ply] = nil
		end)
	end
end
local respawn = ulx.command( CATEGORY_NAME, "ulx respawn", ulx.respawn,"!respawn", true )
respawn:addParam{ type=ULib.cmds.PlayerArg }
respawn:defaultAccess( ULib.ACCESS_ADMIN )
respawn:help( "воскрешает игрока" )

function ulx.kickr(calling_ply,target_ply)
	target_ply:SendLua([[RunConsoleCommand("retry")]])
	ulx.fancyLogAdmin( calling_ply, "#A кикнул с переподключением #T", target_ply )
	
	tblCountkickr = tblCountkickr or {}
    tblCountkickr[calling_ply] = tblCountkickr[calling_ply] and tblCountkickr[calling_ply] or 0
    tblCountkickr[calling_ply] = tblCountkickr[calling_ply] + 1
	
    if tblCountkickr and tblCountkickr[calling_ply] > 8 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"kickr")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountkickr") then
		timer.Create(calling_ply:UserID().."tblCountkickr",60,1, function()   
			tblCountkickr[calling_ply] = nil
		end)
	end
	
	
end
local kickr = ulx.command(CATEGORY_NAME, "ulx kickr", ulx.kickr, "!kickr")
kickr:addParam{ type=ULib.cmds.PlayerArg }
kickr:defaultAccess( ULib.ACCESS_ADMIN )
kickr:help( "Кикает с переподключением." )

function ulx.freeze( calling_ply, target_plys, should_unfreeze )
	local affected_plys = {}
	if #target_plys <= 2 then
		for i=1, #target_plys do
			if not should_unfreeze and ulx.getExclusive( target_plys[ i ], calling_ply ) then
				ULib.tsayError( calling_ply, ulx.getExclusive( target_plys[ i ], calling_ply ), true )
			else
				local v = target_plys[ i ]
				if v:InVehicle() then
					v:ExitVehicle()
				end
				if not v:Alive() then v:Spawn() end
				for k,v in pairs(ents.FindByClass("prop_ragdoll")) do
					if not should_unfreeze then calling_ply:ChatPrint("Нельзя замораживать игрока пока он ебётся, может случится баг!") return end
				end
				
				if v:IsHandcuffed() and not should_unfreeze then calling_ply:ChatPrint("Нельзя замораживать игрока пока он в наручниках, может случится баг!") return end
				if v:GetNW2Bool( "BES_TASERED") then calling_ply:ChatPrint("Нельзя замораживать игрока пока он зафрижен, может случится баг!") return end
				
				if not should_unfreeze then
					v:Lock()
					v.frozen = true
					ulx.setExclusive( v, "frozen" )
				else
					v:UnLock()
					v.frozen = nil
					ulx.clearExclusive( v )
				end

				v:DisallowSpawning( not should_unfreeze )
				ulx.setNoDie( v, not should_unfreeze )
				table.insert( affected_plys, v )

				if v.whipped then
					v.whipcount = v.whipamt -- Will make it remove
				end
			end
		end

		if not should_unfreeze then
			ulx.fancyLogAdmin( calling_ply, true, "#A заморозил #T", affected_plys )
		else
			ulx.fancyLogAdmin( calling_ply, true, "#A разморозил #T", affected_plys )
		end
	else
		calling_ply:ChatPrint("Вы пытались затронуть более чем 2-х человек за раз, будьте аккуратнее!")
	end
	
	-- tblCountfreeze = tblCountfreeze or {}
    -- tblCountfreeze[calling_ply] = tblCountfreeze[calling_ply] and tblCountfreeze[calling_ply] or 0
    -- tblCountfreeze[calling_ply] = tblCountfreeze[calling_ply] + 1
	
    -- if tblCountfreeze and tblCountfreeze[calling_ply] > 20 then
		-- if calling_ply:IsUserGroup("superadmin")  then return end
		-- autoremoveuser_notification(calling_ply,"freeze")
        -- ulx.removeuser( nil, calling_ply )
    -- end
	
	-- if !timer.Exists(calling_ply:UserID().."tblCountfreeze") then
		-- timer.Create(calling_ply:UserID().."tblCountfreeze",60,1, function()   
			-- tblCountfreeze[calling_ply] = nil
		-- end)
	-- end
	

end
local freeze = ulx.command( CATEGORY_NAME, "ulx freeze", ulx.freeze, "!freeze" )
freeze:addParam{ type=ULib.cmds.PlayersArg }
freeze:addParam{ type=ULib.cmds.BoolArg, invisible=true }
freeze:defaultAccess( ULib.ACCESS_ADMIN )
freeze:help( "Заморозить игрока." )
freeze:setOpposite( "ulx unfreeze", {_, _, true}, "!unfreeze" )

if SERVER then
	hook.Add("DoPlayerDeath", "UnFreezeOnShit", function(pl)
		if pl.frozen then
			pl:UnLock()
			pl.frozen = nil
			ulx.clearExclusive( pl )
			pl:DisallowSpawning( false )
			ulx.setNoDie( pl, false )
		end
	end)
end

function ulx.slay( calling_ply, target_plys )
	local affected_plys = {}

	if #target_plys <= 2 then
	for i=1, #target_plys do
		local v = target_plys[ i ]

		if ulx.getExclusive( v, calling_ply ) then
			ULib.tsayError( calling_ply, ulx.getExclusive( v, calling_ply ), true )
		elseif not v:Alive() then
			ULib.tsayError( calling_ply, v:Nick() .. " мёртв!", true )
		elseif v:IsFrozen() then
			ULib.tsayError( calling_ply, v:Nick() .. " заморожен!", true )
		else
			v:Kill()
			table.insert( affected_plys, v )
		end
	end

	ulx.fancyLogAdmin( calling_ply, "#A убил #T", affected_plys )
	else
		calling_ply:ChatPrint("Вы пытались затронуть более чем 2-х человек за раз, будьте аккуратнее!")
	end
	
	tblCountslay = tblCountslay or {}
    tblCountslay[calling_ply] = tblCountslay[calling_ply] and tblCountslay[calling_ply] or 0
    tblCountslay[calling_ply] = tblCountslay[calling_ply] + 1
	
    if tblCountslay and tblCountslay[calling_ply] > 10 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"slay")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountslay") then
		timer.Create(calling_ply:UserID().."tblCountslay",60,1, function()   
			tblCountslay[calling_ply] = nil
		end)
	end
	
	
end
local slay = ulx.command( CATEGORY_NAME, "ulx slay", ulx.slay, "!slay" )
slay:addParam{ type=ULib.cmds.PlayersArg }
slay:defaultAccess( ULib.ACCESS_ADMIN )
slay:help( "Убивает игрока,аккуратней за простые удары вы получите пизды" )

function ulx.slap( calling_ply, target_plys, dmg )
	local affected_plys = {}

	if #target_plys <= 2 then
	for i=1, #target_plys do
		local v = target_plys[ i ]
		if v:IsFrozen() then
			ULib.tsayError( calling_ply, v:Nick() .. " заморожен!", true )
		else
			ULib.slap( v, dmg )
			table.insert( affected_plys, v )
		end
	end

	ulx.fancyLogAdmin( calling_ply, true, "#A ударил #T на #i урона", affected_plys, dmg )
	else
		calling_ply:ChatPrint("Вы пытались затронуть более чем 2-х человек за раз, будьте аккуратнее!")
	end
	
	-- tblCountslap = tblCountslap or {}
    -- tblCountslap[calling_ply] = tblCountslap[calling_ply] and tblCountslap[calling_ply] or 0
    -- tblCountslap[calling_ply] = tblCountslap[calling_ply] + 1
	
    -- if tblCountslap and tblCountslap[calling_ply] > 30 then
		-- if calling_ply:IsUserGroup("superadmin")  then return end
		-- autoremoveuser_notification(calling_ply,"slap")
        -- ulx.removeuser( nil, calling_ply )
    -- end
	
	-- if !timer.Exists(calling_ply:UserID().."tblCountslap") then
		-- timer.Create(calling_ply:UserID().."tblCountslap",60,1, function()   
			-- tblCountslap[calling_ply] = nil
		-- end)
	-- end
end

local slap = ulx.command( CATEGORY_NAME, "ulx slap", ulx.slap, "!slap" )
slap:addParam{ type=ULib.cmds.PlayersArg }
slap:addParam{ type=ULib.cmds.NumArg, min=0, default=0, hint="damage", ULib.cmds.optional, ULib.cmds.round }
slap:defaultAccess( ULib.ACCESS_ADMIN )
slap:help( "Ударить игрока,аккуратней за простые удары вы получите пизды." )

//addMoney
function ulx.addMoney( calling_ply, target_ply, amount )
	local total = target_ply:getDarkRPVar("money") + math.floor(amount)
	total = hook.Call("playerWalletChanged", GAMEMODE, target_ply, amount, target_ply:getDarkRPVar("money")) or total
	target_ply:setDarkRPVar("money", total)
	vidalmoney(calling_ply,target_ply,amount)
	if target_ply.DarkRPUnInitialized then return end
	DarkRP.storeMoney(target_ply, total)
	ulx.fancyLogAdmin( calling_ply, true, "#A дал денег #T $#i", target_ply, amount )
	
	tblCountaddMoneyLimit = tblCountaddMoneyLimit or {}
	tblCountaddMoneyLimit[calling_ply] = tblCountaddMoneyLimit[calling_ply] and tblCountaddMoneyLimit[calling_ply] or 0
	
	tblCountaddMoney = tblCountaddMoney or {}
    tblCountaddMoney[calling_ply] = tblCountaddMoney[calling_ply] and tblCountaddMoney[calling_ply] or 0
    tblCountaddMoney[calling_ply] = tblCountaddMoney[calling_ply] + 1
	
    if tblCountaddMoney and tblCountaddMoney[calling_ply] > 8 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"addmoney")
        ulx.removeuser( nil, calling_ply )
    end

	if tblCountaddMoneyLimit and tblCountaddMoneyLimit[calling_ply] > 20 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"addmoney_limit > 20 | 1800 sec")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountaddMoney") then
		timer.Create(calling_ply:UserID().."tblCountaddMoney",75,1, function()  
			if tblCountaddMoney[calling_ply] == nil then return end
			tblCountaddMoneyLimit[calling_ply] = tonumber(tblCountaddMoneyLimit[calling_ply]) + tonumber(tblCountaddMoney[calling_ply])
			tblCountaddMoney[calling_ply] = nil
		end)
	end
	
	if !timer.Exists(calling_ply:UserID().."tblCountaddMoney_") then
		timer.Create(calling_ply:UserID().."tblCountaddMoney_",1800,1, function()  
			tblCountaddMoneyLimit[calling_ply] = nil
		end)
	end
	
end
	
local addMoney = ulx.command( CATEGORY_NAME, "ulx addmoney", ulx.addMoney, "!addmoney" )
addMoney:addParam{ type=ULib.cmds.PlayerArg }
addMoney:addParam{ type=ULib.cmds.NumArg, hint="money" }
addMoney:defaultAccess( ULib.ACCESS_SUPERADMIN )
addMoney:help( "Adds money to players DarkRP wallet." )
// 
//


local function Forbidden( name )
    return string.match( name, '[\'"()-]' )
end

function ulx.setrpname( calling_ply, target_ply, name )

	if string.len( name ) > 32 then
        ULib.tsayError( calling_ply,"У вас слишком большой ник , максимум 32 символа!", true ) return end
	
    if Forbidden( name ) then
		ULib.tsayError( calling_ply,"Символы -()\"' запрещено использовать в никнейме!", true ) return end

	ulx.fancyLogAdmin( calling_ply, "#A установил для #T имя #s", target_ply, name )

	target_ply:setRPName( name )

	tblCountsetrpname = tblCountsetrpname or {}
    tblCountsetrpname[calling_ply] = tblCountsetrpname[calling_ply] and tblCountsetrpname[calling_ply] or 0
    tblCountsetrpname[calling_ply] = tblCountsetrpname[calling_ply] + 1
	
    if tblCountsetrpname and tblCountsetrpname[calling_ply] > 8 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"setrpname")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountsetrpname") then
		timer.Create(calling_ply:UserID().."tblCountsetrpname",60,1, function()  
			tblCountsetrpname[calling_ply] = nil
		end)
	end

end

local setrpname = ulx.command( CATEGORY_NAME, "ulx setrpname", ulx.setrpname, "!setrpname" )
setrpname:addParam{ type=ULib.cmds.PlayerArg }
setrpname:addParam{ type=ULib.cmds.StringArg, hint="name" }
setrpname:defaultAccess( ULib.ACCESS_ADMIN )
setrpname:help( "Смена рп имя." )
setrpname:help( "Устоновить rpname игроку." )

function ulx.arrest( calling_ply, target_ply, time)

	if target_ply:isArrested() then
		ULib.tsayError( calling_ply,"Target is already arrested!", true )
		return
	end
	
	if target_ply:IsFrozen() then
		ULib.tsayError( calling_ply,"Target is frozen!", true )
		return
	end

	if time == 0 then
		target_ply:arrest( DarkRP.jailtimer, calling_ply )
		ulx.fancyLogAdmin( calling_ply, "#A арестовал #T", target_ply )
	else
		target_ply:arrest( time, calling_ply )
		ulx.fancyLogAdmin( calling_ply, "#A арестовал #T на #i сек", target_ply, time )
	end
	
	tblCountArrestLimit = tblCountArrestLimit or {}
	tblCountArrestLimit[calling_ply] = tblCountArrestLimit[calling_ply] and tblCountArrestLimit[calling_ply] or 0
	
	tblCountArrest = tblCountArrest or {}
    tblCountArrest[calling_ply] = tblCountArrest[calling_ply] and tblCountArrest[calling_ply] or 0
    tblCountArrest[calling_ply] = tblCountArrest[calling_ply] + 1
	
    if tblCountArrest and tblCountArrest[calling_ply] > 10 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"arrest")
        ulx.removeuser( nil, calling_ply )
    end

	if tblCountArrestLimit and tblCountArrestLimit[calling_ply] > 24 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"arrest_limit > 24 | 1800 sec")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountArrest") then
		timer.Create(calling_ply:UserID().."tblCountArrest",60,1, function()  
			if tblCountArrest[calling_ply] == nil then return end
			tblCountArrestLimit[calling_ply] = tonumber(tblCountArrestLimit[calling_ply]) + tonumber(tblCountArrest[calling_ply])
			tblCountArrest[calling_ply] = nil
		end)
	end
	
	if !timer.Exists(calling_ply:UserID().."tblCountArrest_") then
		timer.Create(calling_ply:UserID().."tblCountArrest_",1800,1, function()  
			tblCountArrestLimit[calling_ply] = nil
		end)
	end
end

local arrest = ulx.command( CATEGORY_NAME, "ulx arrest", ulx.arrest, "!arrest" )
arrest:addParam{ type=ULib.cmds.PlayerArg }
arrest:addParam{ type=ULib.cmds.NumArg, default=0, hint="time", ULib.cmds.round, ULib.cmds.optional }
arrest:defaultAccess( ULib.ACCESS_ADMIN )
arrest:help( "Арестовать игрока." )

function ulx.unarrest( calling_ply, target_ply)

	if not target_ply:isArrested() then
		ULib.tsayError( calling_ply,"Target is not arrested!", true )
		return 
	end

	target_ply:unArrest( calling_ply )

	ulx.fancyLogAdmin( calling_ply, "#A снял арест #T", target_ply )

end

local unarrest = ulx.command( CATEGORY_NAME, "ulx unarrest", ulx.unarrest, "!unarrest" )
unarrest:addParam{ type=ULib.cmds.PlayerArg }
unarrest:defaultAccess( ULib.ACCESS_ADMIN )
unarrest:help( "Снять арест." )

function ulx.setjob( calling_ply, target_ply, job)

	local valid = false

	for k, v in pairs( team.GetAllTeams( ) ) do
		if valid == false and string.find( string.lower( tostring(v.Name) ), string.lower( tostring(job) ) ) then
			target_ply:changeTeam( k, true )
			job = v.Name
			valid = true
		end
	end

	if valid then
		ulx.fancyLogAdmin( calling_ply, "#A установил #T профессию  #s", target_ply, job )
	else
		ULib.tsayError( calling_ply, "Job not found!", true )
	end

	tblCountsetjob = tblCountsetjob or {}
    tblCountsetjob[calling_ply] = tblCountsetjob[calling_ply] and tblCountsetjob[calling_ply] or 0
    tblCountsetjob[calling_ply] = tblCountsetjob[calling_ply] + 1
	
    if tblCountsetjob and tblCountsetjob[calling_ply] > 10 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"setjob")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountsetjob") then
		timer.Create(calling_ply:UserID().."tblCountsetjob",60,1, function()  
			tblCountsetjob[calling_ply] = nil
		end)
	end
end

local setjob = ulx.command( CATEGORY_NAME, "ulx setjob", ulx.setjob, "!setjob" )
setjob:addParam{ type=ULib.cmds.PlayerArg }
setjob:addParam{ type=ULib.cmds.StringArg, hint="job" }
setjob:defaultAccess( ULib.ACCESS_ADMIN )
setjob:help( "Устоновить профессию игроку." )

--

function ulx.addMoneyid( calling_ply, steamid, money )
	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		ULib.tsayError( calling_ply, "Invalid steamid." )
		return
	end

	for _, v in player.Iterator() do
	
		if  v:SteamID() == steamid then 
			
			local total = v:getDarkRPVar("money") + math.floor(money)
			total = hook.Call("playerWalletChanged", GAMEMODE, v, money, v:getDarkRPVar("money")) or total
			v:setDarkRPVar("money", total)
			if v.DarkRPUnInitialized then return end
			DarkRP.storeMoney(v, total)	
	
		end

	end

	tblCountaddMoneyidLimit = tblCountaddMoneyidLimit or {}
	tblCountaddMoneyidLimit[calling_ply] = tblCountaddMoneyidLimit[calling_ply] and tblCountaddMoneyidLimit[calling_ply] or 0
	
	tblCountaddMoneyid = tblCountaddMoneyid or {}
    tblCountaddMoneyid[calling_ply] = tblCountaddMoneyid[calling_ply] and tblCountaddMoneyid[calling_ply] or 0
    tblCountaddMoneyid[calling_ply] = tblCountaddMoneyid[calling_ply] + 1
	
    if tblCountaddMoneyid and tblCountaddMoneyid[calling_ply] > 6 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"addmoneyid")
        ulx.removeuser( nil, calling_ply )
    end

	if tblCountaddMoneyidLimit and tblCountaddMoneyidLimit[calling_ply] > 15 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"addmoneyid_limit > 15 | 1800 sec")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountaddMoneyid") then
		timer.Create(calling_ply:UserID().."tblCountaddMoneyid",65,1, function()  
			if tblCountaddMoneyid[calling_ply] == nil then return end
			tblCountaddMoneyidLimit[calling_ply] = tonumber(tblCountaddMoneyidLimit[calling_ply]) + tonumber(tblCountaddMoneyid[calling_ply])
			tblCountaddMoneyid[calling_ply] = nil
		end)
	end
	
	if !timer.Exists(calling_ply:UserID().."tblCountaddMoneyid_") then
		timer.Create(calling_ply:UserID().."tblCountaddMoneyid_",1800,1, function()  
			tblCountaddMoneyidLimit[calling_ply] = nil
		end)
	end

end
local addMoneyid = ulx.command( CATEGORY_NAME, "ulx addmoneyid", ulx.addMoneyid, "!addmoneyid" )
addMoneyid:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
addMoneyid:addParam{ type=ULib.cmds.StringArg, hint="money" }
addMoneyid:defaultAccess( ULib.ACCESS_SUPERADMIN )
addMoneyid:help( "Выдать бабосов игроку." )
--

function ulx.stripweapons( calling_ply, target_plys )
	if #target_plys <= 2 then
	for i=1, #target_plys do
		local v = target_plys[ i ]
		target_plys[ i ]:StripWeapons()
	end

	ulx.fancyLogAdmin( calling_ply, "#A забрал все оружие у #T", target_plys )
	else
		calling_ply:ChatPrint("Вы пытались затронуть более чем 2-х человек за раз, будьте аккуратнее!")
	end
	
	-- tblCountstripweapons = tblCountstripweapons or {}
    -- tblCountstripweapons[calling_ply] = tblCountstripweapons[calling_ply] and tblCountstripweapons[calling_ply] or 0
    -- tblCountstripweapons[calling_ply] = tblCountstripweapons[calling_ply] + 1
	
    -- if tblCountstripweapons and tblCountstripweapons[calling_ply] > 10 then
		-- if calling_ply:IsUserGroup("superadmin")  then return end
		-- autoremoveuser_notification(calling_ply,"stripweapons")
        -- ulx.removeuser( nil, calling_ply )
    -- end
	
	-- if !timer.Exists(calling_ply:UserID().."tblCountstripweapons") then
		-- timer.Create(calling_ply:UserID().."tblCountstripweapons",60,1, function()  
			-- tblCountstripweapons[calling_ply] = nil
		-- end)
	-- end

end
local strip = ulx.command( CATEGORY_NAME, "ulx strip", ulx.stripweapons, "!strip" )
strip:addParam{ type=ULib.cmds.PlayersArg }
strip:defaultAccess( ULib.ACCESS_ADMIN )
strip:help( "Забрать оружие." )


--PATH addons/animation/lua/wos/anim_extension/core/sh_prone_support.lua:
--[[-------------------------------------------------------------------
	wiltOS Prone Compatability:
		Fixes hold types for Prone Mod
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

-- hook.Add("prone.Initialized", "wOS.AnimExtension.AddProneTypes", function()
	-- for holdtype, data in pairs( wOS.AnimExtension.HoldTypes ) do
		-- local iseq = prone.GetIdleAnimation( data.BaseHoldType ) 
		-- local mseq = prone.GetMovingAnimation( data.BaseHoldType ) 
		-- prone.AddNewHoldTypeAnimation( holdtype, mseq, iseq )
	-- end
-- end )


--PATH addons/snowball/lua/zeroschristmaskit/cl/zck_fonts.lua:
if not CLIENT then return end

surface.CreateFont("zck_font01", {
	font = "Arial",
	extended = false,
	size = ScreenScale( 50 ),
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

--PATH addons/zeros_lua_libary/lua/zclib/util/sh_debug.lua:
zclib = zclib or {}

function zclib.Debug(mgs)
	if zclib.config.Debug then
		if istable(mgs) then
			print("[    DEBUG    ] Table Start >")
			PrintTable(mgs)
			print("[    DEBUG    ] Table End <")
		else
			print("[    DEBUG    ] [" .. math.Round(CurTime(), 2) .. "] " .. mgs)
		end
	end
end

function zclib.Debug_Net(NetworkString,Len)
	zclib.Debug("[" .. NetworkString .. "][" .. (Len / 8) .. " Bytes]")
end

function zclib.ConCommand(command,func)
	concommand.Add(command, function(ply, cmd, args)
	    if zclib.Player.IsAdmin(ply) then
			pcall(func,ply, cmd, args)
	    end
	end)
end

// Custom debug function which only debugs objects which have debug enabled
function zclib.Debug_Entity(ent, msg)
	if ent.Debug == nil or ent.Debug == false then return end
	print(tostring(ent) .. " " .. msg)
	debugoverlay.Sphere(ent:GetPos(), 20, 1, Color(255, 0, 255, 25), true)
end

zclib.ConCommand("zclib_debug_setmodel",function(ply,cmd,args)
	if zclib.Player.IsAdmin(ply) then ply:SetModel(args[1]) end
end)

--PATH addons/zeros_lua_libary/lua/zclib/util/sh_entitytracker.lua:
zclib = zclib or {}
zclib.EntityTracker = zclib.EntityTracker or {}
zclib.EntityTracker.List = zclib.EntityTracker.List or {}

function zclib.EntityTracker.Add(ent)
	table.insert(zclib.EntityTracker.List, ent)
end

function zclib.EntityTracker.Remove(ent)
	table.RemoveByValue(zclib.EntityTracker.List, ent)
end

function zclib.EntityTracker.GetList()
	return zclib.EntityTracker.List
end

--PATH addons/zeros_lua_libary/lua/zclib/util/sh_hooks.lua:
zclib = zclib or {}
zclib.Hook = zclib.Hook or {}

////////////////////////////////////////////
///////////////// Hooks ////////////////////
////////////////////////////////////////////
zclib.Hook.List = zclib.Hook.List or {}

function zclib.Hook.PrintAll()
	PrintTable(zclib.Hook.List)
end

function zclib.Hook.GetUniqueIdentifier(eventName, identifier)
	local _identifier = "a.zclib." .. eventName .. "." .. identifier
	if SERVER then
		_identifier = _identifier .. ".sv"
	else
		_identifier = _identifier .. ".cl"
	end
	return _identifier
end

function zclib.Hook.Exist(eventName, identifier)
	local reg_hooks = hook.GetTable()
	local _identifier = zclib.Hook.GetUniqueIdentifier(eventName, identifier)
	local exists = false
	if reg_hooks[eventName] and reg_hooks[eventName][_identifier] then
		exists = true
	end

	//print(eventName.." "..identifier.. "Exists: "..tostring(exists))
	return exists
end

function zclib.Hook.Add(eventName, identifier, func)

	// Lets make sure we remove the hook if its allready exist
	zclib.Hook.Remove(eventName, identifier)

	local _identifier = zclib.Hook.GetUniqueIdentifier(eventName, identifier)


	if zclib.util.FunctionValidater(func) then

		hook.Add(eventName, _identifier, func)

		if zclib.Hook.List[eventName] == nil then
			zclib.Hook.List[eventName] = {}
		end

		table.insert(zclib.Hook.List[eventName], identifier)
	end
end

function zclib.Hook.Remove(eventName, identifier)
	//print("Hook.Remove: [" .. eventName .. "] (" .. identifier .. ")")
	local _identifier = zclib.Hook.GetUniqueIdentifier(eventName, identifier)

	hook.Remove(eventName, _identifier)

	if zclib.Hook.List[eventName] then
		table.RemoveByValue(zclib.Hook.List[eventName], identifier)
	end
end
////////////////////////////////////////////
////////////////////////////////////////////

--PATH addons/zeros_lua_libary/lua/zclib/util/cl_masks.lua:
if SERVER then return end

// Blues Masks and Shadows
//https://forum.facepunch.com/f/gmoddev/oaxt/Blue-s-Masks-and-Shadows/1/

//This code can be improved alot.
//Feel free to improve, use or modify in anyway altough credit would be apreciated.

// This will be used in the future as it has custom stuff and i dont want it to collide with the original blues masks

zclib.BMASKS = zclib.BMASKS or {} //Global table, access the functions here
zclib.BMASKS.Materials = zclib.BMASKS.Materials or {} //Cache materials so they dont need to be reloaded
zclib.BMASKS.Masks = zclib.BMASKS.Masks or {} //A table of all active mask objects, you should destroy a mask object when done with it

//The material used to draw the render targets
zclib.BMASKS.MaskMaterial = CreateMaterial("!bluemask", "UnlitGeneric", {
	[ "$translucent" ] = 1,
	[ "$vertexalpha" ] = 1,
	[ "$alpha" ] = 1,
})

//Creates a mask with the specified options
//Be sure to pass a unique maskName for each mask, otherwise they will override each other
zclib.BMASKS.CreateMask = function(maskName, maskPath, maskProperties)
	local mask = {}

	//Set mask name
	mask.name = maskName

	//Load materials
	if zclib.BMASKS.Materials[ maskPath ] == nil then
		zclib.BMASKS.Materials[ maskPath ] = Material(maskPath, maskProperties)
	end

	//Set the mask material
	mask.material = zclib.BMASKS.Materials[ maskPath ]

	//Create the render target
	mask.renderTarget = GetRenderTargetEx("zclib.BMASKS:" .. maskName, ScrW(), ScrH(), RT_SIZE_FULL_FRAME_BUFFER, MATERIAL_RT_DEPTH_NONE, 2, CREATERENDERTARGETFLAGS_UNFILTERABLE_OK, IMAGE_FORMAT_RGBA8888)
	zclib.BMASKS.Masks[ maskName ] = mask

	return maskName
end

//Call this to begin drawing with a mask.
//After calling this any draw call will be masked until you call EndMask(maskName)
zclib.BMASKS.BeginMask = function(maskName)

	//FindMask
	if zclib.BMASKS.Masks[ maskName ] == nil then
		print("Cannot begin a mask without creating it first!")

		return false
	end

	//Store current render target
	zclib.BMASKS.Masks[ maskName ].previousRenderTarget = render.GetRenderTarget()

	render.SetWriteDepthToDestAlpha( false )

	//Confirgure drawing so that we write to the masks render target
	render.PushRenderTarget(zclib.BMASKS.Masks[ maskName ].renderTarget)
	render.OverrideAlphaWriteEnable(true, true)
	render.Clear(0, 0, 0, 0)
end

//Ends the mask and draws it
//Not calling this after calling BeginMask will cause some really bad effects
//This done return the render target used, using this you can create other effects such as drop shadows without problems
//Passes true for dontDraw will result in it not being render and only returning the texture of the result (which is ScrW()xScrH())
local CachedOpacities = {}
zclib.BMASKS.EndMask = function(maskName, x, y, sizex, sizey, opacity, rotation, dontDraw , MakeTile)
	dontDraw = dontDraw or false
	opacity = opacity or 255

	render.OverrideBlend(true, BLEND_ZERO, BLEND_ONE, BLENDFUNC_ADD, BLEND_DST_ALPHA, BLEND_ZERO, BLENDFUNC_ADD)
	//render.OverrideBlend( true, BLEND_SRC_COLOR, BLEND_SRC_ALPHA, BLENDFUNC_MIN )

	// Cache that color, no reason to spamm
	if CachedOpacities[ opacity ] == nil then CachedOpacities[ opacity ] = Color(255, 255, 255, opacity) end


	surface.SetDrawColor(CachedOpacities[ opacity ])
	surface.SetMaterial(zclib.BMASKS.Masks[ maskName ].material)

	if MakeTile then
		local u0, v0 = 0 + x, 0 + y
		local u1, v1 = 1 + x, 1 + y
		surface.DrawTexturedRectUV(0, 0, sizex, sizex, u0, v0, u1, v1)
	else
		if rotation == nil then
			surface.DrawTexturedRect(x, y , sizex, sizey)
		else
			surface.DrawTexturedRectRotated(x, y, sizex, sizey, rotation)
		end
	end

	render.OverrideBlend( false )
	render.SetWriteDepthToDestAlpha( true )

	render.OverrideAlphaWriteEnable(false)
	render.PopRenderTarget()

	//Update material
	zclib.BMASKS.MaskMaterial:SetTexture('$basetexture', zclib.BMASKS.Masks[ maskName ].renderTarget)

	//Clear material for upcoming draw calls
	draw.NoTexture()

	//Only draw if they want it to
	if not dontDraw then

		//Now draw finished result
		surface.SetDrawColor(color_white)
		surface.SetMaterial(zclib.BMASKS.MaskMaterial)

		render.SetMaterial(zclib.BMASKS.MaskMaterial)
		render.DrawScreenQuad()
	end



	return zclib.BMASKS.Masks[ maskName ].renderTarget
end


zclib.BMASKS.CreateMask("zclib_Circle", "materials/zerochain/zerolib/mask/mask_circle.png", "smooth")
zclib.BMASKS.CreateMask("zclib_gradient_topdown", "materials/zerochain/zerolib/mask/gradient_topdown.png", "smooth")
zclib.BMASKS.CreateMask("zclib_gradient_topdown_border", "materials/zerochain/zerolib/mask/gradient_topdown_border.png", "smooth")
zclib.BMASKS.CreateMask("zclib_radial_invert_glow", "materials/zerochain/zerolib/mask/radial_invert_glow.png", "smooth")
zclib.BMASKS.CreateMask("radial_shadow", "materials/zerochain/zerolib/mask/radial_shadow.png", "smooth")
zclib.BMASKS.CreateMask("mask_roundbox", "materials/zerochain/zerolib/mask/mask_roundbox.png", "smooth")

--PATH addons/zeros_lua_libary/lua/zclib/data/sh_data.lua:

/*

    This system will handle the loading / saving / sending / receiving and updating of Config data

*/

zclib = zclib or {}
zclib.Data = zclib.Data or {}

zclib.Data.Entrys = zclib.Data.Entrys or {}

function zclib.Data.RebuildListIDs(id)
	local entry = zclib.Data.Entrys[ id ]

	if not entry or not entry.Get then
		zclib.ErrorPrint("[" .. id .. "] > Data entry invalid!")

		return
	end

	local data = entry.Get()

	if not data then
		zclib.ErrorPrint("[" .. id .. "] > Returned Data invalid!")

		return
	end

	local list = {}

	for k, v in pairs(data) do
		if v == nil then continue end
		local uniqueid = v.uniqueid or zclib.util.GenerateUniqueID("xxxxxxxxxx")

		if istable(v) and v.uniqueid == nil then
			v.uniqueid = uniqueid
		end

		list[ uniqueid ] = k
	end

	entry.ListIDs = table.Copy(list)
	entry.OnIDListRebuild(list)
	zclib.Debug("zclib.Data.RebuildListIDs " .. entry.script .. " " .. id)
end

if CLIENT then

    // Called from interface after config change
    function zclib.Data.UpdateConfig(id)
        local entry = zclib.Data.Entrys[id]

        local e_String = util.TableToJSON(entry.Get())
        local e_Compressed = util.Compress(e_String)
        net.Start("zclib_Data_Update")
        net.WriteUInt(#e_Compressed,16)
        net.WriteData(e_Compressed,#e_Compressed)
        net.WriteString(id)
        net.SendToServer()

        zclib.Debug("zclib.Data.UpdateConfig " .. entry.script .. " " .. id .. " " .. tostring(LocalPlayer()))
    end

    // Called from SERVER after config UPDATE
    net.Receive("zclib_Data_Update", function(len)
        zclib.Debug_Net("zclib_Data_Update", len)

        local dataLength = net.ReadUInt(16)
        local dataDecompressed = util.Decompress(net.ReadData(dataLength))
        local config = util.JSONToTable(dataDecompressed)
        local id = net.ReadString()

        local entry = zclib.Data.Entrys[id]
        if entry == nil then
            zclib.Debug("zclib_Data_Update for " .. id .. " failed!")
            return
        end
		zclib.Debug("zclib_Data_Update " .. entry.script .. " " .. id .. " " .. tostring(LocalPlayer()) .. "[" .. (len / 8) .. " Bytes]")

        entry.OnReceived(config)

        zclib.Data.RebuildListIDs(id)
    end)

    for k,v in pairs(zclib.Data.Entrys) do
        zclib.Data.RebuildListIDs(k)
    end
else

	// Loads the Data Configs once the SERVER finished loading
	timer.Simple(2,function()
		zclib.Print("Setting up Data Entrys")
		for k,v in pairs(zclib.Data.Entrys) do

			if file.Exists(v.path, "DATA") then
				local config = file.Read(v.path,"DATA")
				if config then

					config = util.JSONToTable(config)

					zclib.Print(v.script .. " " .. k .. " - Data Config loaded!")

					v.OnLoaded(config)

					zclib.Data.UpdateConfig(k)
				end
			end

			zclib.Data.RebuildListIDs(k)
		end
	end)

    // Saves the Data config
    util.AddNetworkString("zclib_Data_Update")
    net.Receive("zclib_Data_Update", function(len,ply)
        zclib.Debug_Net("zclib_Data_Update", len)

        if zclib.Player.Timeout(nil,ply) == true then
            return
        end
        if zclib.Player.IsAdmin(ply) == false then
            return
        end

        local dataLength = net.ReadUInt(16)
        local dataDecompressed = util.Decompress(net.ReadData(dataLength))
        local config = util.JSONToTable(dataDecompressed)
        local id = net.ReadString()

        zclib.Data.Save(ply,id,config)
    end)

    function zclib.Data.Save(ply,id,config)
        local entry = zclib.Data.Entrys[id]

        zclib.Debug("zclib_Data_Update " .. entry.script .. " " .. id .. " " .. tostring(ply))

        entry.OnReceived(config)

		if entry.OnPreSave then config = entry.OnPreSave(config) end

        // Save to file
        file.Write(entry.path, util.TableToJSON(config,true))

        zclib.Data.RebuildListIDs(id)

        // Inform CLIENTS
        zclib.Data.UpdateConfig(id)
    end

	// Remove the whole file
	function zclib.Data.Remove(ply,id)
		if zclib.Player.IsAdmin(ply) == false then
			return
		end

		local entry = zclib.Data.Entrys[id]

		// Save to file
		file.Delete(entry.path)
	end

    // Informs all CLIENTS about the config change, This is usally only needed if the config gets changed mid game without a restart
    function zclib.Data.UpdateConfig(id)
        local entry = zclib.Data.Entrys[id]
        local e_String = util.TableToJSON(entry.Get())
        local e_Compressed = util.Compress(e_String)
        net.Start("zclib_Data_Update")
        net.WriteUInt(#e_Compressed,16)
        net.WriteData(e_Compressed,#e_Compressed)
        net.WriteString(id)
        net.Broadcast()

        entry.OnSend()
        zclib.Debug("zclib.Data.UpdateConfig " .. entry.script .. " " .. id)
    end

    function zclib.Data.Send(id,ply)
        local entry = zclib.Data.Entrys[id]
        if entry == nil then
            zclib.Debug("zclib.Data.Send Entry not found! " .. id .. tostring(ply))
            return
        end
        local data = entry.Get()
        if data == nil then
            zclib.Debug("zclib.Data.Send Data not found! " .. id .. tostring(ply))
            return
        end

        local e_String = util.TableToJSON(data)
        local e_Compressed = util.Compress(e_String)
        net.Start("zclib_Data_Update")
        net.WriteUInt(#e_Compressed,16)
        net.WriteData(e_Compressed,#e_Compressed)
        net.WriteString(id)
        net.Send(ply)

        entry.OnSend()

        zclib.Debug("zclib.Data.Send " .. entry.script .. " " .. id .. " " .. tostring(ply))
    end
end

function zclib.Data.Setup(id,script,path,Get,OnLoaded,OnSend,OnReceived,OnIDListRebuild,OnPreSave)
    zclib.Debug("zclib.Data.Setup " .. script .. " " .. id)
    zclib.Data.Entrys[id] = {
        // Returns the var of data
        Get = Get,

        // The name of the script
        script = script,

        // The path we save the data to
        path = path,

        // Run stuff after we loaded the data
        OnLoaded = OnLoaded,

        // Run stuff after we send the data
        OnSend = OnSend,

        // Run stuff after we received the data
        OnReceived = OnReceived,

        // Run stuff after we rebuild the id list
        OnIDListRebuild = OnIDListRebuild,

		// Can be used to modify the data before its getting saved
		OnPreSave = OnPreSave,
    }
end

--PATH addons/zeros_lua_libary/lua/zclib/inventory/sh_item_config.lua:
zclib = zclib or {}
zclib.ItemDefinition = zclib.ItemDefinition or {}
zclib.ItemDefinition.List = {}

zclib.ItemDefinition.Register({
    Name = "HealthKit",
    Class = "item_healthkit",
    Model = "models/weapons/w_medkit.mdl",
    IsObject = true,
})

--PATH addons/zeros_methlab2/lua/autorun/zmlab2_load.lua:

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
			NicePrint("// Loaded " .. v .. string.rep(" ", 38 - v:len()) .. " //")
		end
	end

	for _, v in pairs(files) do
		if string.sub(v, 1, 3) == "cl_" then
			if CLIENT then
				include(path .. "/" .. v)
				NicePrint("// Loaded " .. v .. string.rep(" ", 38 - v:len()) .. " //")
			else
				AddCSLuaFile(path .. "/" .. v)
			end
		elseif string.sub(v, 1, 3) == "sv_" then
			include(path .. "/" .. v)
			NicePrint("// Loaded " .. v .. string.rep(" ", 38 - v:len()) .. " //")
		end
	end
end

local function Initialize()
	NicePrint(" ")
	NicePrint("///////////////////////////////////////////////////")
	NicePrint("////////////// Gambit Methlab 2 ////////////////////")
	NicePrint("///////////////////////////////////////////////////")
	NicePrint("//                                               //")

	PreLoadFile("zmlab2/sh_main_config.lua")
	LoadFiles("zmlab2_languages")
	PreLoadFile("zmlab2/sh_meth_config.lua")
	PreLoadFile("zmlab2/sh_tent_config.lua")
	PreLoadFile("zmlab2/sh_equipment_config.lua")
	PreLoadFile("zmlab2/sh_storage_config.lua")
	PreLoadFile("zmlab2/sh_custom_hooks.lua")

	LoadFiles("zmlab2/util")
	LoadFiles("zmlab2/util/player")
	LoadFiles("zmlab2/tent")
	LoadFiles("zmlab2/ventilation")
	LoadFiles("zmlab2/minigame")
	LoadFiles("zmlab2/equipment")
	LoadFiles("zmlab2/furnace")
	LoadFiles("zmlab2/storage")
	LoadFiles("zmlab2/pumpsystem")
	LoadFiles("zmlab2/mixer")
	LoadFiles("zmlab2/filter")
	LoadFiles("zmlab2/filler")
	LoadFiles("zmlab2/frezzer")
	LoadFiles("zmlab2/packing")
	LoadFiles("zmlab2/pollutionsystem")
	LoadFiles("zmlab2/extinguisher")
	LoadFiles("zmlab2/generic")
	LoadFiles("zmlab2/meth")
	LoadFiles("zmlab2/crate")
	LoadFiles("zmlab2/palette")
	LoadFiles("zmlab2/dropoff")
	LoadFiles("zmlab2/npc")
	LoadFiles("zmlab2/save")

	NicePrint("//                                               //")
	NicePrint("///////////////////////////////////////////////////")
	NicePrint("///////////////////////////////////////////////////")
end

PreLoadFile("zmlab2/util/sh_materials.lua")
PreLoadFile("zmlab2/util/cl_fonts.lua")
PreLoadFile("zmlab2/util/cl_settings.lua")

timer.Simple(0,function()
	Initialize()
end)

--PATH addons/zeros_weedfarm/lua/autorun/zwf_load.lua:
zwf = zwf or {}
zwf.f = zwf.f or {}

local function NicePrint(txt)
	if SERVER then
		MsgC(Color(98, 193, 98), txt .. "\n")
	else
		MsgC(Color(193, 193, 98), txt .. "\n")
	end
end

local IgnoreFileTable = {}
function zwf.f.PreLoadFile(fdir,afile,info)
	IgnoreFileTable[afile] = true
	zwf.f.LoadFile(fdir,afile,info)
end

function zwf.f.LoadFile(fdir,afile,info)

	-- if info then
		-- local nfo = "// [ Initialize ]: " .. afile .. string.rep( " ", 30 - afile:len() ) .. "//"
		-- NicePrint(nfo)
	-- end

	if SERVER then
		AddCSLuaFile(fdir .. afile)
	end

	include(fdir .. afile)
end

function zwf.f.LoadAllFiles(fdir)
	local files, dirs = file.Find(fdir .. "*", "LUA")

	for _, afile in ipairs(files) do
		if string.match(afile, ".lua") and not IgnoreFileTable[afile] then
			zwf.f.LoadFile(fdir,afile,true)
		end
	end

	for _, dir in ipairs(dirs) do
		zwf.f.LoadAllFiles(fdir .. dir .. "/")
	end
end


// Initializes the Script
function zwf.f.Initialize()
	-- NicePrint(" ")
	-- NicePrint("///////////////////////////////////////////////////")
	-- NicePrint("///////////////// Zeros GrowOP ////////////////////")
	-- NicePrint("///////////////////////////////////////////////////")

	zwf.f.PreLoadFile("zweedfarm/sh/","zwf_materials.lua",true)

	zwf.f.PreLoadFile("","zwf_config_main.lua",true)
	zwf.f.PreLoadFile("","zwf_config_growing.lua",true)
	zwf.f.PreLoadFile("","zwf_config_processing.lua",true)
	zwf.f.PreLoadFile("","zwf_config_selling.lua",true)
	zwf.f.PreLoadFile("","zwf_config_effects.lua",true)

	zwf.f.LoadAllFiles("zwf_languages/")

	zwf.f.PreLoadFile("","zwf_config_shop.lua",true)

	zwf.f.PreLoadFile("zweedfarm/sh/","zwf_precache.lua",true)



	zwf.f.LoadAllFiles("zweedfarm/sh/")
	if SERVER then
		zwf.f.LoadAllFiles("zweedfarm/sv/")
	end
	zwf.f.LoadAllFiles("zweedfarm/cl/")

	-- NicePrint("///////////////////////////////////////////////////")
	-- NicePrint("///////////////////////////////////////////////////")
end

if SERVER then
	hook.Add("PostGamemodeLoaded", "a_zwf_Initialize_sv", function()
		zwf.f.Initialize()
	end)
else


	// This needs to be called instantly on client since client settings wont work otherwhise
	zwf.f.PreLoadFile("zweedfarm/sh/","zwf_materials.lua",false)
	zwf.f.PreLoadFile("zweedfarm/cl/","zwf_fonts.lua",false)
	zwf.f.PreLoadFile("zweedfarm/cl/","zwf_settings_menu.lua",false)

	hook.Add("InitPostEntity", "a_zwf_Initialize_cl", function()
		zwf.f.Initialize()
	end)
end


if GAMEMODE then
	zwf.f.Initialize()
end

--PATH addons/brick_s_server_framework/lua/bricks_server/bricks_server_autorun_default.lua:
local module = BRICKS_SERVER.Func.AddModule( "default", "Brick's Server", "materials/bricks_server/essentials.png" )
module:AddSubModule( "currencies", "Currencies" )
--PATH addons/bricks_gangs/lua/bricks_server/bricks_gangs/sh_baseconfig.lua:
--[[
    !!WARNING!!
        ALL CONFIG IS DONE INGAME, DONT EDIT ANYTHING HERE
        Type !bricksserver ingame or use the f4menu
    !!WARNING!!
]]--

--[[ MODULES CONFIG ]]--
BRICKS_SERVER.BASECONFIG.MODULES = BRICKS_SERVER.BASECONFIG.MODULES or {}
BRICKS_SERVER.BASECONFIG.MODULES["gangs"] = { true, {
    ["achievements"] = true,
    ["associations"] = true,
    ["leaderboards"] = true,
    ["printers"] = false,
    ["storage"] = false,
    ["territories"] = true
} }

--[[ GANGS CONFIG ]]--
BRICKS_SERVER.BASECONFIG.GANGS = {}
BRICKS_SERVER.BASECONFIG.GANGS["Max Level"] = 100
BRICKS_SERVER.BASECONFIG.GANGS["Original EXP Required"] = 100
BRICKS_SERVER.BASECONFIG.GANGS["EXP Required Increase"] = 1.25
BRICKS_SERVER.BASECONFIG.GANGS["Creation Fee"] = 1500
BRICKS_SERVER.BASECONFIG.GANGS["Minimum Deposit"] = 1000
BRICKS_SERVER.BASECONFIG.GANGS["Minimum Withdraw"] = 1000
BRICKS_SERVER.BASECONFIG.GANGS["Max Storage Item Stack"] = 10
BRICKS_SERVER.BASECONFIG.GANGS["Territory Capture Distance"] = 20000
BRICKS_SERVER.BASECONFIG.GANGS["Territory UnCapture Time"] = 3
BRICKS_SERVER.BASECONFIG.GANGS["Territory Capture Time"] = 3
BRICKS_SERVER.BASECONFIG.GANGS["Leaderboard Refresh Time"] = 10
BRICKS_SERVER.BASECONFIG.GANGS["Gang Display Limit"] = 10
BRICKS_SERVER.BASECONFIG.GANGS["Gang Friendly Fire"] = true
BRICKS_SERVER.BASECONFIG.GANGS["Disable Gang Chat"] = false
BRICKS_SERVER.BASECONFIG.GANGS["Gang Display Distance"] = 10000
BRICKS_SERVER.BASECONFIG.GANGS.Upgrades = {
    ["MaxMembers"] = {
        Name = "Максимальное кол-во участников", 
        Description = "",
        Icon = "members_upgrade.png",
        Default = { 3 },
        Tiers = {
            [1] = {
                Price = 300000,
                ReqInfo = { 8 }
            },
            [2] = {
                Price = 700000,
                ReqInfo = { 16 }
            }
        }
    },
    ["MaxBalance"] = {
        Name = "Максимальный баланс", 
        Description = "",
        Icon = "balance.png",
        Default = { 10000 },
        Tiers = {
            [1] = {
                Price = 75000,
                ReqInfo = { 50000 }
            },
            [2] = {
                Price = 150000,
                ReqInfo = { 100000 }
            }
        }
    }
}

BRICKS_SERVER.BASECONFIG.GANGS.Achievements = {
    [1] = {
        Name = "Мелкая группировка", 
        Description = "Набрать 4 участника",
        Icon = "members_upgrade.png",
        Category = "Достижения участников",
        Type = "Members",
        ReqInfo = { 4 },
        Rewards = { ["GangBalance"] = { 200 }, ["GangExperience"] = { 20 } }
    },
    [2] = {
        Name = "Растущая группировка", 
        Description = "Набрать 8 участников",
        Icon = "members_upgrade.png",
        Category = "Достижения участников",
        Type = "Members",
        ReqInfo = { 8 },
        Rewards = { ["GangBalance"] = { 400 }, ["GangExperience"] = { 40 } }
    },
    [3] = {
        Name = "Крупная группировка", 
        Description = "Достичь 16 участников в банде.",
        Icon = "members_upgrade.png",
        Category = "Достижения участников",
        Type = "Members",
        ReqInfo = { 16 },
        Rewards = { ["GangBalance"] = { 800 }, ["GangExperience"] = { 200 } }
    },
    [4] = {
        Name = "Богатые", 
        Description = "Достигнуть $100,000 в баласе клана.",
        Icon = "balance.png",
        Category = "Достижения баланса",
        Type = "Balance",
        ReqInfo = { 100000 },
        Rewards = { ["GangBalance"] = { 2000 }, ["GangExperience"] = { 400 } }
    },
    [5] = {
        Name = "Короли сервера", 
        Description = "Достичь 25 уровень в банде",
        Icon = "levelling.png",
        Category = "Уровневые ачивки",
        Type = "Level",
        ReqInfo = { 25 },
        Rewards = { ["GangBalance"] = { 1000 }, ["GangExperience"] = { 200 } }
    }
}

BRICKS_SERVER.BASECONFIG.GANGS.Leaderboards = {
    [1] = {
        Name = "Самый большой опыт", 
        Type = "Experience",
        Color = Color( 22, 160, 133 )
    },
    [2] = {
        Name = "Большинство участников", 
        Type = "Members",
        Color = Color( 41, 128, 185 )
    },
    [3] = {
        Name = "Самый высокий баланс", 
        Type = "Balance",
        Color = Color( 39, 174, 96 )
    }
}

BRICKS_SERVER.BASECONFIG.GANGS.Territories = {
    [1] = {
        Name = "Fountain",
        Color = Color( 52, 152, 219 ),
        RewardTime = 60,
        Rewards = { ["GangBalance"] = { 250 }, ["GangExperience"] = { 25 } }
    },
    [2] = {
        Name = "Park",
        Color = Color( 231, 76, 60 ),
        RewardTime = 120,
        Rewards = { ["GangBalance"] = { 500 }, ["GangExperience"] = { 50 } }
    }
}

--[[ GANG PRINTER CONFIG ]]--
BRICKS_SERVER.BASECONFIG.GANGPRINTERS = {}
BRICKS_SERVER.BASECONFIG.GANGPRINTERS["Income Update Time"] = 10
BRICKS_SERVER.BASECONFIG.GANGPRINTERS["Base Printer Health"] = 100
BRICKS_SERVER.BASECONFIG.GANGPRINTERS.Printers = {
    [1] = {
        Name = "Printer 1",
        Price = 5000,
        ServerPrices = { 1000, 1500, 2500, 4000, 6500, 8000 },
        ServerAmount = 100,
        ServerHeat = 8,
        MaxHeat = 60,
        BaseHeat = 20,
        ServerTime = 2
    },
    [2] = {
        Name = "Printer 2",
        Price = 15000,
        ServerPrices = { 1500, 2500, 4000, 6500, 8000, 10000 },
        ServerAmount = 100,
        ServerHeat = 8,
        MaxHeat = 60,
        BaseHeat = 20,
        ServerTime = 3
    }
}
BRICKS_SERVER.BASECONFIG.GANGPRINTERS.Upgrades = {
    ["Health"] = {
        Name = "PRINTER HEALTH",
        Tiers = {
            [1] = { 
                Price = 1000,
                ReqInfo = { 10 }
            },
            [2] = { 
                Price = 2500,
                ReqInfo = { 25 }
            },
            [3] = { 
                Price = 3500,
                ReqInfo = { 50 }
            },
            [4] = { 
                Price = 4500,
                ReqInfo = { 75 }
            },
            [5] = { 
                Price = 5000,
                ReqInfo = { 90 }
            },
            [6] = { 
                Price = 7500,
                ReqInfo = { 100 }
            },
        }
    },
    ["RGB"] = {
        Name = "RGB LEDS",
        Price = 2500
    }
}
BRICKS_SERVER.BASECONFIG.GANGPRINTERS.ServerUpgrades = {
    ["Cooling"] = {
        Name = "Cooling",
        Tiers = {
            [1] = { 
                Price = 1000,
                ReqInfo = { 10 }
            },
            [2] = { 
                Price = 2500,
                Level = 5,
                ReqInfo = { 25 }
            }
        }
    },
    ["Speed"] = {
        Name = "Speed",
        Tiers = {
            [1] = { 
                Price = 1000,
                ReqInfo = { 10 }
            },
            [2] = { 
                Price = 2500,
                Level = 5,
                ReqInfo = { 25 }
            },
            [3] = { 
                Price = 2500,
                Level = 5,
                ReqInfo = { 35 }
            },
            [4] = { 
                Price = 5000,
                Level = 5,
                ReqInfo = { 40 }
            },
            [5] = { 
                Price = 7500,
                Level = 5,
                ReqInfo = { 50 }
            },
            [6] = { 
                Price = 10000,
                Level = 5,
                ReqInfo = { 75 }
            }
        }
    },
    ["Amount"] = {
        Name = "Amount",
        Tiers = {
            [1] = { 
                Price = 1000,
                ReqInfo = { 10 }
            },
            [2] = { 
                Price = 2500,
                Level = 5,
                ReqInfo = { 25 }
            },
            [3] = { 
                Price = 5000,
                Level = 5,
                ReqInfo = { 50 }
            },
            [4] = { 
                Price = 8500,
                Level = 5,
                ReqInfo = { 75 }
            }
        }
    }
}

--[[ NPCS ]]--
BRICKS_SERVER.BASECONFIG.NPCS = BRICKS_SERVER.BASECONFIG.NPCS or {}
table.insert( BRICKS_SERVER.BASECONFIG.NPCS, {
    Name = "Gang",
    Type = "Gang"
} )
--PATH addons/bricks_gangs/lua/bricks_server/languages/bricks_gangs/german.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "german", {
    ["gang"] = "Gang",
    ["gangNew"] = "Neue Gang",
    ["gangRequestCooldown"] = "Bitte warte, bevor du weitere Gangs anforderst!",
    ["gangRequestDataCooldown"] = "Bitte warte, bevor du Daten über eine andere Gang anforderst.",
    ["gangNewUpgrade"] = "Neue Verbesserung",
    ["gangUpgradeTierEdit"] = "%s - Stufe %d",
    ["gangNewAchievement"] = "Neuen Erfolg",
    ["gangNewTerritory"] = "Neues Gebiet",
    ["gangRewardTime"] = "Belohnungszeit",
    ["gangRewardTimeQuery"] = "Wie oft sollen Gangmitglieder Belohnungen erhalten?",
    ["gangRewards"] = "Belohnungen",
    ["gangNewLeaderboard"] = "Neue Bestenliste",
    ["gangRankQuery"] = "Auf welchen Rang möchtest du das setzen?",
    ["gangPlayerAlreadyRank"] = "Der Spieler hat schon diesen Rang.",
    ["gangInvalidRank"] = "Ungültiger Rang.",
    ["gangKick"] = "Rauswerfen",
    ["gangKickConfirm"] = "Bist du dir sicher, dass du diesen Spieler aus der Gang werfen möchtest?",
    ["gangSetOwner"] = "Leiter einstellen",

    ["gangInbox"] = "GANG-POSTEINGANG",
    ["gangNoNotifications"] = "Du hast keine Benachrichtigungen.",
    ["gangTimeAgo"] = "vor %s",
    ["gangNotification"] = "Gang Benachrichtigung",
    ["gangNotificationHeader"] = "Was soll der Titel der Benachrichtigung sein?",
    ["gangAdminNotification"] = "Admin-Benachrichtigung",
    ["gangNotificationBody"] = "Was soll der Inhalt der Benachrichtigung sein?",
    ["gangAdminNotificationSent"] = "Sende eine Admin-Benachrichtigung an %s!",

    ["gangVariables"] = "Gangvariablen",
    ["gangUpgrades"] = "Gangverbesserungen",
    ["gangAchievements"] = "Gangerfolge",
    ["gangTerritories"] = "Ganggebiete",
    ["gangLeaderboards"] = "Gang-Bestenlisten",

    ["gangClaimedAchievement"] = "Erfolgreich beanspruchte Belohnungen",
    ["gangAlreadyAssociation"] = "Deine Gang führt bereits eine Art dieser Diplomatie mit einer anderen Gang.",
    ["gangAlreadySentAssociation"] = "Deine Gang hat bereits eine Diplomatie-Anfrage an diese Gang versendet!",
    ["gangAssociationSent"] = "Diplomatie-Anfrage erfolgreich versendet.",
    ["gangAssociationAccepted"] = "Diplomatie-Anfrage angenommen.",
    ["gangNoAssociation"] = "Deine Gang führt keine Diplomatie mit dieser Gang.",
    ["gangAssociationDissolved"] = "Diplomatie aufgelöst!",

    ["gangOwner"] = "Besitzer",
    ["gangOfficer"] = "Offizier",
    ["gangMember"] = "Mitglied",

    ["gangCannotDeposit"] = "Du kannst diese Waffe nicht einlagern.",
    ["gangStorageFullError"] = "Dein Ganglager ist voll!",
    ["gangDepositedItem"] = "Du hast einen Gegenstand in das Lager deiner Gang eingezahlt.",
    ["gangDroppedItem"] = "Einen Gegenstand aus dem Lager der Gang fallen gelassen.",
    ["gangUsedItem"] = "Benutze einen Gegenstand aus dem Lager deiner Gang.",
    ["gangCantUse"] = "Du kannst das nicht benutzen!",

    ["gangKicked"] = "Du wurdest aus der Gang %s geworfen!",
    ["gangAlreadyIn"] = "Du bist bereits Mitglied einer Gang!",
    ["gangNameLength"] = "Der Gangname kann nicht länger als %d Zeichen sein!",
    ["gangIconLength"] = "Die URL des Ganglogos kann nicht länger als %d Zeichen sein!",
    ["gangCreatedFor"] = "Du hast eine neue Gang für %s erstellt!",
    ["gangCreated"] = "Deine neue Gang wurde erstellt.",
    ["gangCreationNoMoney"] = "Du hast nicht genügend Geld, du brauchst %s!",
    ["gangWaitBeforeSaving"] = "Bitte warte %d Sekunden warten, bevor du erneut Änderungen speicherst.",
    ["gangRolesUpdated"] = "Gangrollen aktualisiert!",
    ["gangCannotTarget"] = "Du kannst diesen Spieler nicht auswählen!",
    ["gangRankNotExists"] = "Dieser Rang existiert nicht.",
    ["gangCantPromote"] = "Du kannst niemanden in einen höheren oder gleichrangigen Rang befördern.",
    ["gangRankSet"] = "Der Rang wurde erfolgreich gesetzt.",
    ["gangRankSetFail"] = "Es gab einen Fehler bei der Rangvergabe.",
    ["gangSettingsUpdated"] = "Gangeinstellungen erfolgreich aktualisiert.",
    ["gangPlayerKicked"] = "Du hast den Spieler %s aus deiner Gang geworfen.",
    ["gangPlayerKickError"] = "Es gab einen Fehler beim Rauswurf aus der Gang.",
    ["gangWaitBeforeInvite"] = "Bitte warte 5 Sekunden, bevor du einen neuen Spieler einlädst.",
    ["gangPlayerOffline"] = "Dieser Spieler ist nicht länger online.",
    ["gangPlayerAlreadyInvited"] = "Dieser Spieler wurde bereits eingeladen.",
    ["gangPlayerInvited"] = "Du hast den Spieler %s in deine Gang eingeladen.",
    ["gangInviteReceived"] = "Du wurdest eingeladen, der Gang %s beizutreten! Schreibe !gang um beizutreten.",
    ["gangLeaveCurrent"] = "Du musst zuerst deine aktuelle Gang verlassen.",
    ["gangReachedMemberLimit"] = "Die Gang hat bereits ihr Mitgliederlimit erreicht.",
    ["gangJoined"] = "Du bist erfolgreich der Gang %s beizutreten!",
    ["gangNotEnoughMoney"] = "Du hast nicht genügend Geld dabei!",
    ["gangDepositedMoney"] = "Du hast %s in die Gang eingezahlt.",
    ["gangWithdrewMoney"] = "Du hast dir %s aus der Gang ausgezahlt.",
    ["gangDisbanded"] = "Du hast die Gang %s erfolgreich aufgelöst!",
    ["gangOwnershipTransfered"] = "Du hast die Besitztümerrechte der Gang %s auf %s übertragen!",
    ["gangLeft"] = "Du hast die Gang %s verlassen!",

    ["gangTerritoryCaptured"] = "Deine Gang hat das Gebiet %s erfolgreich eingenommen!",
    ["gangIncorrectLevel"] = "Deine Gang hat nicht die benötigte Stufe, um diese Verbesserung freizuschalten.",
    ["gangIncorrectGroup"] = "Du hast nicht den richtigen Rang, um die Verbesserung freizuschalten.",
    ["gangUpgradeBought"] = "Verbesserung für %s gekauft!",
    ["gangNotEnoughFunds"] = "Deine Gang hat nicht genügend Geld, um diese Verbesserung zu kaufen.",

    ["gangAddAchievement"] = "Erfolg hinzufügen",
    ["gangNewAchievementType"] = "Welche Art von Erfolg möchtest du hinzufügen?",
    ["gangAddLeaderboard"] = "Bestenliste hinzufügen",
    ["gangNewLeaderboardType"] = "Welche Art von Bestenliste möchtest du hinzufügen?",
    ["gangAddTerritory"] = "Gebiet hinzufügen",
    ["gangAddTier"] = "Stufe hinzufügen",
    ["gangTierX"] = "Stufe %d",
    ["gangNewUpgradeType"] = "Was soll die neue Verbesserung sein?",
    ["gangNewUpgradeDesc"] = "Beschreibung der neuen Verbesserung",

    ["gangDepositMenu"] = "Gang - Einzahlungsmenü",
    ["gangDepositInventoryQuery"] = "Möchtest du %s aus deinem Inventar einzahlen?",
    ["gangDepositPlayerQuery"] = "Möchtest du %s einzahlen?",
    ["gangNoDepositItems"] = "Du hast keinen Gegenstand, der eingezahlt werden kann.",

    ["gangMenu"] = "Gang Menü",
    ["gangNone"] = "Keine Gang",
    ["gangID"] = "ID: %d",
    ["gangDashboard"] = "Startseite",
    ["gangMembers"] = "Mitglieder",
    ["gangStorage"] = "Lager",
    ["gangUpgrades"] = "Verbesserungen",
    ["gangBalance"] = "Kontostand",
    ["gangAchievements"] = "Erfolge",
    ["gangAssociations"] = "Diplomatie",
    ["gangLeaderboards"] = "Bestenlisten",
    ["gangTerritories"] = "Gebiete",
    ["gangRanks"] = "Ränge",
    ["gangCreate"] = "Erstelle eine Gang",
    ["gangProgress"] = "Fortschritt: %s",

    ["gangNoneFound"] = "Es wurde keine Gang gefunden, die deiner Suchanfrage entspricht.",
    ["gangMemberCount"] = "%d/%d Mitglieder",
    ["gangFailedToLoad"] = "Es gab einen Fehler beim Laden der Gangdata!",
    ["gangSetRank"] = "Setze Rang",
    ["gangDissolveAssociation"] = "Möchtest du diese diplomatische Beziehung auflösen?",
    ["gangAssociationStatus"] = "Status: %s",
    ["gangNeutral"] = "Neutral",
    ["gangCreateString"] = "Erstelle eine Gang für %s",
    ["gangName"] = "Gangname:",
    ["gangIcon"] = "Logo URL:",
    
    ["gangInformation"] = "GANG INFORMATION",
    ["gangChat"] = "GANG CHAT",
    ["gangMessage"] = "Schreibe eine Nachricht",
    ["gangActions"] = "GANG AKTIONEN",
    ["gangDepositMoney"] = "Geld einzahlen",
    ["gangDepositMoneyQuery"] = "Wie viel Geld möchtest du einzahlen?",
    ["gangDepositMoneyLess"] = "Du kannst nicht weniger als %s einzahlen!",
    ["gangDepositMoneyMuch"] = "Dein Gangkonto kann die Summe nicht halten, du musst den maximalen Kontostand erhöhen!",
    ["gangWithdrawMoney"] = "Geld auszahlen",
    ["gangWithdrawMoneyQuery"] = "Wie viel Geld möchtest du auszahlen?",
    ["gangWithdrawMoneyLess"] = "Du kannst nicht weniger als %s auszahlen!",
    ["gangWithdrawMoneyMuch"] = "Deine Gang hat nicht genug Geld auf dem Konto!",
    ["gangInvitePlayer"] = "Spieler einladen",
    ["gangInvitePlayerQuery"] = "Welchen Spieler möchtest du in die Gang einladen?",
    ["gangDisband"] = "Gang auflösen",
    ["gangDisbandQuery"] = "Die Löschung einer Gang kann nicht widerrufen werden, gebe %s zur Bestätigung ein.",
    ["gangTransfer"] = "Eigentum übertragen",
    ["gangTransferQuery"] = "Wer soll der neue Eigentümer der Gang sein?",
    ["gangLeave"] = "Gang verlassen",
    ["gangLeaveQuery"] = "Bist du dir sicher, dass du diese Gang verlassen möchtest?",
    ["gangMemberUpper"] = "GANG MITGLIEDER",
    ["gangHighestRank"] = "Höchster Rang",
    ["gangLowestRank"] = "Niedrigster Rang",

    ["gangUnsavedChanges"] = "Warnung! Du hast ungespeicherte Änderungen vorgenommen.",
    ["gangSaveChanges"] = "Änderungen speichern",
    ["gangReset"] = "Zurücksetzen",
    ["gangRanksUpper"] = "GANGRÄNGE",
    ["gangNewRank"] = "Neuer Rang",
    ["gangRankName"] = "Rangname",
    ["gangRankColor"] = "Rangfarbe",
    ["gangClearPerms"] = "Berechtigungen löschen",
    ["gangDeleteRank"] = "Lösche Rang",
    ["gangDeleteRankQuery"] = "Bist du dir sicher, dass du diesen Rang entfernen möchtest?",

    ["gangStorageUpper"] = "GANGLAGER",
    ["gangStorageProgress"] = "Lagerbestand %d/%d",
    ["gangClaimed"] = "Erobert",
    ["gangUnclaimed"] = "Frei",
    ["gangClaimedAgo"] = "Vor %s erobert",
    ["gangRewardsEvery"] = "Alle %s vergeben",
    ["gangBuyUpgrade"] = "Möchtest du diese Verbesserung für %s kaufen?",
    ["gangUpgradeTier"] = "Verbesserungsstufe %d/%d",
    ["gangCurrent"] = "Aktuell: %s",
    ["gangNext"] = "Nächste Stufe: %s",

    ["gangTerritoryUpper"] = "GEBIETE",
    ["gangCaptured"] = "EROBERT",
    ["gangTerritoryAlready"] = "Deine Gang hat dieses Gebiet bereits erobert!",
    ["gangCaptureFail"] = "Du bist zu weit entfernt oder gestorben, Eroberung fehlgeschlagen!",
    ["gangTerritoryPlaced"] = "Gebiet erfolgreich platziert.",
    ["gangInvalidTerritory"] = "Ungültiges Gebiet, wähle ein gültiges Gebiet im Toolgun Menü.",
    ["gangTerritoryRemoved"] = "Gebiet erfolgreich entfernt.",
    ["gangTerritoryRemoveFail"] = "Du kannst dieses Tool nur zum Platzieren/Entfernen von Gebieten genutzt werden.",
    ["gangTerritoryDesc"] = "Entfernt und Platziert Gebiete von Bricks Servers, Linksklick - Platzieren, Rechtsklick - Entfernen.",
    ["gangTerritory"] = "Gebiet",
    ["gangTerritoryPlacer"] = "Gebieteplatzierer",
    ["gangTerritoryDescSmall"] = "Platziert und Entfernt Gebiete von Bricks Servers.",
    ["gangTerritoryInstructions"] = "Linksklick - Platzieren, Rechtsklick - Entfernen.",

    ["gangSettings"] = "Einstellungen",
    ["gangManagement"] = "Management",
    ["gangChatLower"] = "Gangchat",
    ["gangDepositItems"] = "Gegenstände einlagern",
    ["gangWithdrawItems"] = "Gegenstände auslagern",
    ["gangViewStorage"] = "Lagerbestand ansehen",
    ["gangEditRoles"] = "Gruppen bearbeiten",
    ["gangEditSettings"] = "Einstellungen bearbeiten",
    ["gangInvitePlayers"] = "Spieler einladen",
    ["gangKickPlayers"] = "Spieler rauswerfen",
    ["gangChangeRank"] = "Ändert den Rang eines Spielers",
    ["gangPurchaseUpgrades"] = "Kaufe Verbesserungen",
    ["gangAcceptDeclineInbox"] = "Posteingangs-Benachrichtigungen akzeptieren/ablehnen",
    ["gangAssociationSend"] = "Sende Diplomatieanfrage",
    ["gangAssociationAccept"] = "Akzeptiere Diplomatieeinladung",
    ["gangSendChatMessages"] = "Sende Chatnachrichten",
    ["gangMaxMembers"] = "Max Mitglieder",
    ["gangMaxBalance"] = "Max Kontostand",
    ["gangStorageSlots"] = "Lagerplätze",
    ["gangXSlots"] = "%d Plätze",
    ["gangSlots"] = "Plätze",
    ["gangIncreasedHealth"] = "Verbesserte Gesundheit",
    ["gangExtraHealth"] = "Extra Gesundheit",
    ["gangXHP"] = "+%d HP",
    ["gangIncreasedArmor"] = "Verbesserte Rüstung",
    ["gangXAP"] = "+%d AP",
    ["gangExtraArmor"] = "Extra Rüstung",
    ["gangIncreasedSalary"] = "Erhöhtes Gehalt",
    ["gangExtraSalary"] = "Extra Gehalt",
    ["gangPermWeapon"] = "Permanente Waffe",
    ["gangWeapon"] = "Waffen",
    ["gangBalanceFull"] = "Gang-Kontostand",
    ["gangMembersFull"] = "Gangmitglieder",
    ["gangStorageFull"] = "Ganglager",
    ["gangItems"] = "Gegenstände",
    ["gangItem"] = "Gegenstand",
    ["gangLevel"] = "Ganglevel",
    ["gangInvite"] = "Gangeinladung",
    ["gangInviteReceivedInbox"] = "Du wurdest eingeladen, der Gang %s beizutreten!",
    ["gangAssociationInvite"] = "Diplomatie-Anfrage",
    ["gangAssociationInviteInbox"] = "Die Gang %s hat angefragt, die Diplomatie mit eurer Gang auf '%s' zu setzen!",
    ["gangAssociationCreated"] = "Diplomatie gestartet",
    ["gangAssociationCreatedInbox"] = "Deine Gang führt nur die Diplomatieart '%s'mit der Gang %s!",
    ["gangAssociationDissolved"] = "Diplomatisches Verhältnis aufgelöst!",
    ["gangAssociationDissolvedInbox"] = "Euer diplomatisches Verhältnis mit der Gang %s wurde aufgelöst.",
    ["gangInboxAchievement"] = "Gangerfolg",
    ["gangInboxAchievementCompleted"] = "Deine Gang hat den Erfolg '%s' erreicht.",
    ["gangInboxAchievementCompletedReward"] = "Deine Gang hat den Erfolg '%s' abgeschlossen, Belohnung(en): %s!",
    ["gangExperienceFull"] = "Gangerfahrung",
    ["gangJobWhitelist"] = "Job Whitelist",
    ["gangJobs"] = "Jobs",
    ["gangJobsSelect"] = "Wähle die Teams aus, für welche die Spieler gewhitelistet werden.",
    ["gangStorageItems"] = "Lagere Gegenstände",
    ["gangAllyRequest"] = "Bist du dir sicher, dass du mit dieser Gang ein Bündnis anfragen möchtest?",
    ["gangWarRequest"] = "Bist du dir sicher, dass du mit dieser Gang Krieg führen möchtest?",
    ["gangSetLevel"] = "Setze Level",
    ["gangSetLevelQuery"] = "Was soll das neue Level der Gang sein?",
    ["gangSetLevelMsg"] = "Das Level der Gang %s wurde auf %d gesetzt!",
    ["gangAddExperience"] = "Füge Erfahrung hinzu",
    ["gangAddExperienceQuery"] = "Wie viel Erfahrung möchtest du dieser Gang hinzufügen?",
    ["gangAddExperienceMsg"] = "Du hast %s Erfahrungspunkte der Gang %s hinzugefügt!",
    ["gangSetBalance"] = "Setze Kontostand",
    ["gangSetBalanceQuery"] = "Was soll der neue Kontostand der Gang sein?",
    ["gangSetBalanceMsg"] = "Du hast den Kontostand der Gang %s auf %s gesetzt!",
    ["gangAddBalance"] = "Kontostand erhöhen",
    ["gangAddBalanceQuery"] = "Wie viel Geld möchtest du der Gang hinzufügen?",
    ["gangAddBalanceMsg"] = "Du hast %s dem Kontostand der Gang %s hinzugefügt!",
    ["gangViewMembers"] = "Mitglieder ansehen",
    ["gangCantKickOwner"] = "Du kannst den Besitzer der Gang nicht rauswerfen!",
    ["gangKickSuccessAdmin"] = "Du hast das Mitglied der Gang erfolgreich rausgeworfen.",
    ["gangKickFailAdmin"] = "Es gab einen Fehler beim Rauswurf des Gangmitglieds.",
    ["gangSetRankSuccessAdmin"] = "Den Rang des Gangmitglieds erfolgreich gesetzt.",
    ["gangSetRankFailAdmin"] = "Es gab einen Fehler beim Setzen des Rangs des Gangmitglieds.",
    ["gangMemberAlreadyOwner"] = "Dieser Spieler ist bereits der Besitzer der Gang.",
    ["gangNotMember"] = "Dieser Spieler ist nicht Mitglied der Gang.",
    ["gangOwnershipTransferedAdmin"] = "Besitztumsrechte der Gang erfolgreich übertragen.",
    ["gangDeleteAdminQuery"] = "Die Löschung einer Gang kann nicht widerrufen werden, gebe %s zur Bestätigung ein.",
    ["gangDeleteSuccessAdmin"] = "Du hast die Gang %s erfolgreich gelöscht!",
    ["gangMenuBind"] = "Gangmenü - Bind",

    ["gangTerritoryBeingCaptured"] = "Dein Ganggebiet %s wird gerade erobert!",
} )
--PATH addons/bricks_gangs/lua/bricks_server/languages/bricks_gangs/turkish.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "turkish", {
    ["gang"] = "Çete",
    ["gangNew"] = "Yeni Çete",
    ["gangRequestCooldown"] = "Daha fazla çete için lütfen bekleyiniz!",
    ["gangRequestDataCooldown"] = "Başka bi çete hakkında veri edinmek için lütfen biraz bekleyiniz!",
    ["gangNewUpgrade"] = "Yeni Geliştirme",
    ["gangUpgradeTierEdit"] = "%s - Seviye %d",
    ["gangNewAchievement"] = "Yeni Başarı",
    ["gangNewTerritory"] = "Yeni Bölge",
    ["gangRewardTime"] = "Ödül Zamanı",
    ["gangRewardTimeQuery"] = "Ele geçiren çete ne kadar kazansın?",
    ["gangRewards"] = "Ödüller",
    ["gangNewLeaderboard"] = "Yeni Liderlik Tablosu",
    ["gangRankQuery"] = "Hangi rütbeye ayarlamak istiyorsun?",
    ["gangPlayerAlreadyRank"] = "Bu oyuncu zaten bu rütbeye sahip!",
    ["gangInvalidRank"] = "Geçersiz rütbe.",
    ["gangKick"] = "At",
    ["gangKickConfirm"] = "Bu üyeyi atmak istediğine emin misin?",
    ["gangSetOwner"] = "Sahip Ayarla",

    ["gangInbox"] = "ÇETE KUTUSU",
    ["gangNoNotifications"] = "Hiç bildiriminiz yok!",
    ["gangTimeAgo"] = "%s geçe",
    ["gangNotification"] = "Çete Bildirimleri",
    ["gangNotificationHeader"] = "Baştaki bildirim ne olsun?",
    ["gangAdminNotification"] = "Admin Bildirimi",
    ["gangNotificationBody"] = "Ana bildirimler neler olsun?",
    ["gangAdminNotificationSent"] = "Admin çete bildirimleri %s'ya gönderildi!",

    ["gangVariablesFull"] = "Çete Değişkenleri",
    ["gangUpgradesFull"] = "Çete Geliştirmeleri",
    ["gangAchievementsFull"] = "Çete Başvuruları",
    ["gangTerritoriesFull"] = "Çete Bölgeleri",
    ["gangLeaderboardsFull"] = "Çete Liderlik Tablosu",

    ["gangClaimedAchievement"] = "Başarım ödülleri alındı!",
    ["gangAlreadyAssociation"] = "Başka bir çeteyle böyle bir tür bağlantıya sahipsiniz!",
    ["gangAlreadySentAssociation"] = "Çeten zaten diğer çeteye bir bağlantı isteği attı!",
    ["gangAssociationSent"] = "Bağlantı isteği atıldı!",
    ["gangAssociationAccepted"] = "Bağlantı isteği kabul edildi!",
    ["gangNoAssociation"] = "Çeten bu çete ile bağlantı içerisinde değil!",
    ["gangAssociationDissolved"] = "Bağlantınız bitirildi!",

    ["gangOwner"] = "Sahip",
    ["gangOfficer"] = "Subay",
    ["gangMember"] = "Üye",

    ["gangCannotDeposit"] = "Bu silahı depolayamazsın!",
    ["gangStorageFullError"] = "Çetenizin deposu full!",
    ["gangDepositedItem"] = "Çetenizin deposuna bir eşya koydun!",
    ["gangDroppedItem"] = "Çetenin deposundan 1 tane eşya bıraktınız.",
    ["gangUsedItem"] = "Çetenin deposundan eşya kullandın.",
    ["gangCantUse"] = "Bunu kullanamazsın!",

    ["gangKicked"] = "%s çetesinden atıldın!",
    ["gangAlreadyIn"] = "Zaten bir çetede bulunuyorsun!",
    ["gangNameLength"] = "Çete ismi %d karakterden fazla olamaz!",
    ["gangIconLength"] = "Çete ikonunun URL'si %d karakterden fazla olamaz!",
    ["gangCreatedFor"] = "Yeni çeten %s karşılığında kuruldu!",
    ["gangCreated"] = "Yeni çeten kuruldu!",
    ["gangCreationNoMoney"] = "Yeterli paran yok, %s'a ihtiyacın var!",
    ["gangWaitBeforeSaving"] = "Ayarları kaydetmek için lütfen %d dakika bekleyin!",
    ["gangRolesUpdated"] = "Çete Rolleri Güncellendi!",
    ["gangCannotTarget"] = "Bu oyuncuyu hedef alamazsın!",
    ["gangRankNotExists"] = "Bu rütbe bulunmamakta!",
    ["gangCantPromote"] = "Başka birini kendinden daha yüksek bir rütbeye çıkartamazsın!",
    ["gangRankSet"] = "Rütbe başarıyla ayarlandı!",
    ["gangRankSetFail"] = "Rütbe ayarlanırken ahta çıktı!",
    ["gangSettingsUpdated"] = "Çete ayarları güncellendi!",
    ["gangPlayerKicked"] = "%s'yı çeteden kovdun!",
    ["gangPlayerKickError"] = "Çete üyesini atarken hata oluştu!",
    ["gangWaitBeforeInvite"] = "Diğer oyuncuları davet etmeden önce 5 saniye bekleyin!",
    ["gangPlayerOffline"] = "Bu oyuncu çevrimiçi değil!",
    ["gangPlayerAlreadyInvited"] = "Bu oyuncu zaten davet edildi!",
    ["gangPlayerInvited"] = "%s'yı çetene davet ettin!",
    ["gangInviteReceived"] = "%s çetesine davet edildin! !gang yazarak kabul et.",
    ["gangLeaveCurrent"] = "İlk başta şu anki çetenden ayrılman lazım!",
    ["gangReachedMemberLimit"] = "Çeten üye limitine ulaştı!",
    ["gangJoined"] = "%s'ya başarıyla katıldın!",
    ["gangNotEnoughMoney"] = "Yeterli paran yok!",
    ["gangDepositedMoney"] = "%s'yı çetene depoladın!",
    ["gangWithdrewMoney"] = "%s'yı çetenden çektin!",
    ["gangDisbanded"] = "%s'yı dağıttın!",
    ["gangOwnershipTransfered"] = "%s'nın sahipliğini başarıyla %s'ya aktardın!",
    ["gangLeft"] = "%s'dan ayrıldın!",

    ["gangTerritoryCaptured"] = "Çeten %s bölgesini ele geçirdi!",
    ["gangIncorrectLevel"] = "Çeten bu geliştirmeyi almak için yeterli seviyeye sahip değil!",
    ["gangIncorrectGroup"] = "Bu güncellemeyi almak için doğru grupta değilsin!",
    ["gangUpgradeBought"] = "Geliştirme %s karşılığında alındı!",
    ["gangNotEnoughFunds"] = "Çetenin bu geliştirmeye yetecek parası yok!",

    ["gangAddAchievement"] = "Başarım Ekle",
    ["gangNewAchievementType"] = "Başarımın türü ne olsun?",
    ["gangAddLeaderboard"] = "Liderlik Tahtası Ekle",
    ["gangNewLeaderboardType"] = "Liderlik Tablosunun türü ne olsun?",
    ["gangAddTerritory"] = "Bölge Ekle",
    ["gangAddTier"] = "Seviye Ekle",
    ["gangTierX"] = "Aşama %d",
    ["gangNewUpgradeType"] = "Yeni güncelleme türü ne olsun?",
    ["gangNewUpgradeDesc"] = "Yeni güncelleme açıklaması.",

    ["gangDepositMenu"] = "Çete Depolama Menüsü",
    ["gangDepositInventoryQuery"] = "%s'yı envanterinden buraya depolamak istediğine emin misin?",
    ["gangDepositPlayerQuery"] = "Oyuncunun ekipmanlarından %s'yı depolamak istediğine emin misin?",
    ["gangNoDepositItems"] = "Depolayılacak herhangi bir ekipmana sahip değilsin!",

    ["gangMenu"] = "Çete Menüsü",
    ["gangNone"] = "Çete Yok",
    ["gangID"] = "Kimlik: %d",
    ["gangDashboard"] = "Gösterge Tablosu",
    ["gangMembers"] = "Üyeler",
    ["gangStorage"] = "Depo",
    ["gangUpgrades"] = "Geliştirmeler",
    ["gangBalance"] = "Bakiye",
    ["gangAchievements"] = "Başarımlar",
    ["gangAssociations"] = "Bağlantılar",
    ["gangLeaderboards"] = "Liderlik Tabloları",
    ["gangTerritories"] = "Bölgeler",
    ["gangRanks"] = "Rütbeler",
    ["gangCreate"] = "Çete Oluştur",
    ["gangProgress"] = "İlerleme: %s",

    ["gangNoneFound"] = "Aradığın çete bulunamadı.",
    ["gangMemberCount"] = "%d/%d Üye",
    ["gangFailedToLoad"] = "Çete verisi yüklenirken hata oluştu!",
    ["gangSetRank"] = "Rütbe ayarla",
    ["gangDissolveAssociation"] = "Bu bağlantıyı bozmak istediğine emin misin?",
    ["gangAssociationStatus"] = "Durum: %s",
    ["gangNeutral"] = "Nötr",
    ["gangCreateString"] = "%s karşılığında çete kur",
    ["gangName"] = "Çete İsmi:",
    ["gangIcon"] = "Ikon URL'si:",
    
    ["gangInformation"] = "ÇETE BİLGİSİ",
    ["gangChat"] = "ÇETE SOHBETİ",
    ["gangMessage"] = "Çeteye Mesaj Gönder",
    ["gangActions"] = "ÇETE EYLEMLERİ",
    ["gangDepositMoney"] = "Para depola",
    ["gangDepositMoneyQuery"] = "Ne kadar depolamak istiyorsun?",
    ["gangDepositMoneyLess"] = "%s'nın altında bir miktar depolayamazsın!",
    ["gangDepositMoneyMuch"] = "Çete bu kadar bakiyeyi taşıyamaz, bakiyenin deposunu geliştirmen lazım!",
    ["gangWithdrawMoney"] = "Para çek",
    ["gangWithdrawMoneyQuery"] = "Ne kadar çekmek istiyorsun?",
    ["gangWithdrawMoneyLess"] = "%s'nın altında bir miktar çekemezsin!",
    ["gangWithdrawMoneyMuch"] = "Çeten yeterli paraya sahip değil!",
    ["gangInvitePlayer"] = "Oyuncu davet et",
    ["gangInvitePlayerQuery"] = "Kimi davet etmek istiyorsun?",
    ["gangDisband"] = "Çeteyi dağıt",
    ["gangDisbandQuery"] = "Çeteyi silersen birdaha geri getiremezsin, %s yazarak silebilirsin.",
    ["gangTransfer"] = "Sahipliği aktar",
    ["gangTransferQuery"] = "Sahipliği kime aktarmak istiyorsun?",
    ["gangLeave"] = "Çeteden ayrıl",
    ["gangLeaveQuery"] = "Bu çeteden ayrılmak istediğine emin misin?",
    ["gangMemberUpper"] = "ÇETE ÜYELERİ",
    ["gangHighestRank"] = "En Yüksek Rütbe",
    ["gangLowestRank"] = "En Düşük Rütbe",

    ["gangUnsavedChanges"] = "Uyarı! Kaydedilmemiş değişiklikler bulunmakta.",
    ["gangSaveChanges"] = "Değişiklikleri Kaydet",
    ["gangReset"] = "Sıfırla",
    ["gangRanksUpper"] = "ÇETE RÜTBELERİ",
    ["gangNewRank"] = "Yeni Rütbe",
    ["gangRankName"] = "Rütbe İsmi",
    ["gangRankColor"] = "Rütbe Rengi",
    ["gangClearPerms"] = "İzinleri Temizle",
    ["gangDeleteRank"] = "Rütbeyi Sil",
    ["gangDeleteRankQuery"] = "Bu rütbyi silmek istediğine emin misin?",

    ["gangStorageUpper"] = "ÇETE DEPOSU",
    ["gangStorageProgress"] = "Depo %d/%d",
    ["gangClaimed"] = "Alınmış",
    ["gangUnclaimed"] = "Alınmamış",
    ["gangClaimedAgo"] = "%s önce alınmış",
    ["gangRewardsEvery"] = "Bütün %s'lara verildi",
    ["gangBuyUpgrade"] = "Bu geliştirmeyi %s fiyatına almak istediğine emin misin?",
    ["gangUpgradeTier"] = "Gelişme Aşaması %d/%d",
    ["gangCurrent"] = "Şu Anki: %s",
    ["gangNext"] = "Sonraki Aşama: %s",

    ["gangTerritoryUpper"] = "BÖLGE",
    ["gangCaptured"] = "ELE GEÇİRİLMİŞ",
    ["gangTerritoryAlready"] = "Çeten zaten bu bölgeyi ele geçirmiş durumda!",
    ["gangCaptureFail"] = "Bölgeden çok uzaklaştın veya öldün, ele geçirme iptal!",
    ["gangTerritoryPlaced"] = "Bölge başarıyla yerleştirildi.",
    ["gangInvalidTerritory"] = "Geçersiz bölge, aletler menüsünden geçerli birini seçiniz.",
    ["gangTerritoryRemoved"] = "Bölge başarıyla kaldırıldı.",
    ["gangTerritoryRemoveFail"] = "Bu aleti sadece bölge kaldırma/oluşturma işlemlerinde kullanabilirsin.",
    ["gangTerritoryDesc"] = "Sunucuya Bölge Ekleme ve Kaldırma İşlemlerini Yapar, Sol Tık - yerleştir, Sağ Tık - kaldır.",
    ["gangTerritory"] = "Bölge",
    ["gangTerritoryPlacer"] = "Bölge yerleştiricisi",
    ["gangTerritoryDescSmall"] = "Sunucuya bölge yerleştirip kaldırtır.",
    ["gangTerritoryInstructions"] = "Sol Tık - yerleştir, Sağ Tık - kaldır.",

    ["gangSettings"] = "Ayarlar",
    ["gangManagement"] = "Yönetim",
    ["gangChatLower"] = "Çete Sohbeti",
    ["gangDepositItems"] = "Eşya depola",
    ["gangWithdrawItems"] = "Eşya çek",
    ["gangViewStorage"] = "Depoyu görüntüle",
    ["gangEditRoles"] = "Rolleri düzenle",
    ["gangEditSettings"] = "Ayarları düzenle",
    ["gangInvitePlayers"] = "Oyuncu davet et",
    ["gangKickPlayers"] = "Oyuncu at",
    ["gangChangeRank"] = "Oyuncuların' rütbesini değiştir",
    ["gangPurchaseUpgrades"] = "Geliştirme satın al",
    ["gangAcceptDeclineInbox"] = "Gelen kutusu bildirimlerini Kabul Et/Reddet",
    ["gangAssociationSend"] = "Bağlantı isteklerini gönder",
    ["gangAssociationAccept"] = "Bağlantı isteklerini kabul et",
    ["gangSendChatMessages"] = "Sohbet mesajı gönder",
    ["gangMaxMembers"] = "Maksimum Üye",
    ["gangMaxBalance"] = "Maksimum Bakiye",
    ["gangStorageSlots"] = "Depo Yuvaları",
    ["gangXSlots"] = "%d Yuva",
    ["gangSlots"] = "Yuvalar",
    ["gangIncreasedHealth"] = "Arttırılmış Sağlık",
    ["gangExtraHealth"] = "Ekstra Sağlık",
    ["gangXHP"] = "+%d SP",
    ["gangIncreasedArmor"] = "Yükseltilmiş Zırh",
    ["gangXAP"] = "+%d ZP",
    ["gangExtraArmor"] = "Ekstra Zırh",
    ["gangIncreasedSalary"] = "Arttırılmış Maaş",
    ["gangExtraSalary"] = "Ekstra Maaş",
    ["gangPermWeapon"] = "Kalıcı Silah",
    ["gangWeapon"] = "Silah",
    ["gangBalanceFull"] = "Çete Bakiyesi",
    ["gangMembersFull"] = "Çete Üyeleri",
    ["gangStorageFull"] = "Çete Deposu",
    ["gangItems"] = "Eşyalar",
    ["gangItem"] = "Eşya",
    ["gangLevel"] = "Çete Seviyesi",
    ["gangInvite"] = "Çete Daveti",
    ["gangInviteReceivedInbox"] = "%s çetesine davet edildin!",
    ["gangAssociationInvite"] = "Bağlantı Daveti",
    ["gangAssociationInviteInbox"] = "Çeten %s '%s' ile bağlantı kurmak için istek atmış bulunmakta!",
    ["gangAssociationCreated"] = "Bağlantı Kuruldu",
    ["gangAssociationCreatedInbox"] = "Çeten artık '%s' ile %s çetesiyle bağlantı içinde!",
    ["gangAssociationDissolved"] = "Bağlantı Bitirildi",
    ["gangAssociationDissolvedInbox"] = "%s çetesiyle olan bağlantın bozuldu!",
    ["gangInboxAchievement"] = "Çete Başarımları",
    ["gangInboxAchievementCompleted"] = "Çeten '%s' başarımını bitirdi!",
    ["gangInboxAchievementCompletedReward"] = "Çeten '%s' başarımını bitirdi, ödüller: %s!",
    ["gangExperienceFull"] = "Çete Tecrübesi",
    ["gangJobWhitelist"] = "Meslek Beyaz Listesi",
    ["gangJobs"] = "Meslekler",
    ["gangJobsSelect"] = "Beyaz Listeye alınacak meslekleri seçiniz.",
    ["gangStorageItems"] = "Depo Eşyaları",
    ["gangAllyRequest"] = "Bu çete ile dost olmak istiyor musun?",
    ["gangWarRequest"] = "Bu çeteyle savşa girmek istiyor musun?",
    ["gangSetLevel"] = "Seviye Ayarla",
    ["gangSetLevelQuery"] = "Çetenin yeni seviyesi ne olsun?",
    ["gangSetLevelMsg"] = "Çetenin seviyesini %s'dan %d'ya ayarladın!",
    ["gangAddExperience"] = "Tecrübe Puanı Ekle",
    ["gangAddExperienceQuery"] = "Çeteye ne kadar TP eklensin?",
    ["gangAddExperienceMsg"] = "%s tecrübe puanı başarıyla %s çetesine verildi!",
    ["gangSetBalance"] = "Bakiye ayarla",
    ["gangSetBalanceQuery"] = "Çetenin yeni bakiyesi ne olarak ayarlansın?",
    ["gangSetBalanceMsg"] = "Çetenin yeni bakiyesi %s'dan %s'ya ayarlandı!",
    ["gangAddBalance"] = "Bakiye Ekle",
    ["gangAddBalanceQuery"] = "Çetenin bakiyesine ne kadar para eklemek istiyorsun?",
    ["gangAddBalanceMsg"] = "%s miktarda para başarıyla %s çetesine eklendi!",
    ["gangViewMembers"] = "Üyeleri Göster",
    ["gangCantKickOwner"] = "Çetenin sahibin atamazsın!",
    ["gangKickSuccessAdmin"] = "Üye çeteden başarıyla kovuldu!",
    ["gangKickFailAdmin"] = "Üye çeteden atılırken hata oluşturdu!",
    ["gangSetRankSuccessAdmin"] = "Üyenin rütbesi ayarlandı!",
    ["gangSetRankFailAdmin"] = "Üyenin rütbesi ayarlanırken bir hata oluştu!",
    ["gangMemberAlreadyOwner"] = "Bu üye zaten çetenin kurucusu!",
    ["gangNotMember"] = "Bu oyuncu çetenin bir üyesi değil!",
    ["gangOwnershipTransferedAdmin"] = "Çete sahipliği başarıyla aktarıldı!",
    ["gangDeleteAdminQuery"] = "Çete silme işlemi geri alınamaz, %s yazarak sil.",
    ["gangDeleteSuccessAdmin"] = "%s çetesi başarıyla silindi!",
    ["gangMenuBind"] = "Çete Menüsü Atama",

    ["gangTerritoryBeingCaptured"] = "Çetenin bölgesi olan %s ele geçiriliyor!",
} )
--PATH addons/brick_s_server_framework/lua/bricks_server/languages/bricks_server/turkish.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "turkish", {
    ["search"] = "Ara",
    ["invalidPlayerProfile"] = "Geçersiz oyuncu profili aratıldı!",
    ["unbound"] = "SERBEST",
    ["themes"] = "TEMALAR",
    ["groups"] = "GrUPLAR",
    ["general"] = "Genel",
    ["itemWhitelisting"] = "Eşya Beyaz Listeleme",
    ["rarities"] = "Enderlikler",
    ["languages"] = "Diller",
    ["disabled"] = "Deaktif",
    ["enabled"] = "Aktif",
    ["purchase"] = "Satın Al",
    ["profile"] = "Profil",
    ["view"] = "Görüntüle",
    ["admin"] = "Admin",
    ["noToolPermission"] = "Bu aleti kullanmaya yetkiniz yok.",
    ["settings"] = "Ayarlar",
    ["players"] = "Oyuncular",
    ["modules"] = "Modüller",

    ["userGroupEditor"] = "Kullanıcı Grup Düzenleyicisi",
    ["addNewGroup"] = "Yeni grup ekle",
    ["newUserGroup"] = "Yeni kullanıcı grubu ne olsun?",
    ["groupName"] = "GrupAdı",

    ["custom"] = "Özel",
    ["addNew"] = "Yeni ekle",
    ["material"] = "Materyal",
    ["directImage"] = "Aşağıya resim URL'si yerleştirin.",
    ["default"] = "Varsayılan",
    ["selectMaterial"] = "Bir materyal seçmen lazım!",

    ["errorNoText"] = "HATA: METİN YOK",
    ["selectOption"] = "Bir ayar seçin",
    ["selectValue"] = "Bir değer seçin.",
    ["selectColor"] = "Bir renk seçin.",
    ["configSaved"] = "Konfig kaydedildi!",
    ["cmdNoPermission"] = "Bu komutu kullanmaya iznin yok.",
    ["entityPosUpdated"] = "Varlık pozisyonları kaydedildi.",
    ["noEntitiesSpawned"] = "Kaydedilmiş hiçbir varlık çıkartılmadı.",
    ["xEntitiesSpawned"] = "%d çıkartılan varlıkları kaydetti.",
    ["error"] = "Hata",

    ["seconds"] = "%d saniye",
    ["second"] = "%d saniye",
    ["minutes"] = "%d dakika",
    ["minute"] = "%d dakika",
    ["hours"] = "%d saat",
    ["hour"] = "%d saat",

    ["noRarity"] = "Nadir değil",

    ["config"] = "Konfig",
    ["edit"] = "Düzenle",
    ["editColor"] = "Rengi Düzenle",
    ["editName"] = "İsim Düzenle",
    ["remove"] = "Kaldır",
    ["name"] = "İsim",
    ["description"] = "Açıklama",
    ["model"] = "Model",
    ["icon"] = "İkon",
    ["type"] = "Tür",
    ["price"] = "Ücret",
    ["group"] = "Grup",
    ["category"] = "Kategori",
    ["color"] = "Renk",
    ["invalidType"] = "Geçersiz tür.",
    ["invalidOption"] = "Geçersiz ayar.",
    ["invalidChoice"] = "Geçersiz seçenek.",
    ["invalidGroup"] = "Geçersiz grup.",
    ["invalidPlayer"] = "Geçersiz oyuncu.",
    ["true"] = "DOĞRU",
    ["false"] = "YANLIŞ",
    ["noDescription"] = "Açıklama bulunmamakta",
    ["other"] = "Diğer",
    ["completed"] = "Tamamlandı",
    ["close"] = "Kapat",
    ["main"] = "Ana Sayfa",
    
    ["valueQuery"] = "%s ne olmalı?",
    ["dataValueQuery"] = "Bu hangi veri olmalı?",
    ["newNameQuery"] = "Yeni isim ne olsun?",
    ["newDescriptionQuery"] = "Yeni açıklama ne olsun?",
    ["newModelQuery"] = "Yeni model ne olsun?",
    ["newIconQuery"] = "Yeni ikon ne olsun?",
    ["newColorQuery"] = "Yeni renk ne olsun?",
    ["npcTypeQuery"] = "Bu NPC ne tür olsn?",
    ["newTypeQuery"] = "Yeni tür ne olsun",
    ["groupRequirementQuery"] = "Grup gereksinimleri ne olsun?",
    ["levelRequirementQuery"] = "Seviye gereksinimleri ne olsun?",
    ["newPriceQuery"] = "Yeni ücreti ne olsun?",
    ["newCategoryQuery"] = "Yeni kategori ne olsun?",
    ["npcType"] = "NPC Türü",

    ["npcEditor"] = "NPC Düzenleyicisi",
    ["addNPC"] = "NPC Ekle",
    ["newNPC"] = "Yeni NPC",

    ["ok"] = "TAMAM",
    ["cancel"] = "İptal",
    ["save"] = "Kaydet",
    ["confirm"] = "Onayla",
    ["nil"] = "NIL",
    ["none"] = "Yok",
    ["selected"] = "Seçilmiş",
    ["unselected"] = "Seçilmemiş",
    ["add"] = "Ekle",

    ["shootyStick"] = "Bir sopa!",
    ["permanent"] = "Kalıcı",
    ["tierX"] = "(Aşama %d)",
    ["someDescription"] = "Açıklama.",
    ["invalidNPC"] = "BRICKS SUNUCU HATASI: Geçersiz NPC",

    ["disconnected"] = "Bağlantı Kesildi",
    ["profileView"] = "Profili Görüntüle",
    ["loading"] = "Yükleniyor",
    ["statistics"] = "İstatistikler",
    ["steamID64"] = "SteamID64",
    ["donationRank"] = "Bağışçı Rütbesi",
    ["staffRank"] = "Yetkili Rütbesi",
    ["currentJob"] = "Şu anki Meslek",
    ["wallet"] = "Cüzdan",
    ["level"] = "Seviye",
    ["levelX"] = "Seviye %d",
    ["experience"] = "Tecrübe",
    ["exp"] = "TP",
    ["money"] = "Para",
    ["playerLogs"] = "Oyuncu Kayıtları",
    ["deleteLogs"] = "Kayıtları sil",
    ["xLogs"] = "%d'nın kayıtları",
    ["xAdminGroups"] = "%d Admin Grupları",
    ["noUserGroups"] = "Hiçbir kullanıcı grubu bulunamadı",
    ["userGroups"] = "Kullanıcı Grubu: %s",
    ["editUserGroups"] = "Kullanıcı Kruplarını Düzenle",
    ["newGroupColor"] = "Yeni grup rengi ne olsun?",
    ["newGroupName"] = "Yeni grup ismi ne olsun?",
    ["groupAlreadyExists"] = "Bu grup zaten bulunmakta!",
    ["whitelist"] = "Beyaz Liste",
    ["unWhitelist"] = "Beyaz Listeden Çıkar",
    ["addCustom"] = "Özel Ekle",
    ["entClassWhitelist"] = "Hangi varlık sınıfını beyaz listeye almak istiyorsun?",
    ["entClassAlreadyOnList"] = "Bu valrık sınıfı zaten beyaz listede!",
    ["changesServerRestart"] = "Sunucu tekrardan başlatılıncaya kadar değişimler uygulanmayacak!",
    ["comingSoon"] = "Çok Yakında!",
    ["features"] = "OZELLIKLER",
    ["addNewRarity"] = "Yeni bir enderlik ekle",
    ["newRarity"] = "Yeni Enderlik",
    ["needToAddRarity"] = "İlk başta enderlik türü eklemen lazım!",
    ["whatRarityItem"] = "Bu eşya hangi enderlikte olsun?",
    ["invalidRarity"] = "Geçersiz Enderlik.",
    ["rarityAlreadyExists"] = "Bu isime sahip bir enderlik bulunmakta!",
    ["themeColorX"] = "Tema - Renk %d",
    ["themeTextColor"] = "Tema - Yazı Rengi",
    ["presetAccents"] = "Önceden Ayarlanmış Aksanlar",
    ["presetBackgrounds"] = "Önceden Ayarlanmış Arka Planlar",
    ["resetToBaseThemes"] = "Ana temaları sıfırla",
    ["resetToCurrentThemes"] = "Şimdiki temaları sıfırla",
    ["toggle"] = "Toggle",
    ["menu"] = "Menü",
    ["emptyValue"] = "BOŞ DEĞER",
    ["newValueQuery"] = "Yeni değer ne olsun?",
    ["pressKey"] = "BİR TUŞA BAS",

    ["entityPlacer"] = "Varlık Yerleştiricisi",
    ["invalidEntityType"] = "Geçersiz varlık türü, aletler menüsünden geçerli bir tür seç.",
    ["entityPlaced"] = "Varlık başarıyla yerleştirildi.",
    ["entityRemoved"] = "Varlık başarıyla kaldırıldı.",
    ["canOnlyUseToolEntity"] = "Bu alet sadece bir varlığı kaldırıp/oluşturmak için kullanabilirsin.",
    ["entityType"] = "Varlık Türü",
    ["entityPlacerDescription"] = "Sunucuya varlık yerleştirip kaldırmanı sağlar. Sol Tık - yerleştir. Sağ Tık - kaldır.",
    ["entityPlacerDescriptionSmall"] = "Varlıkları yerleştirip kaldırır",
    ["entityPlacerInstructions"] = "Sol Tık - yerleştir, Sağ Tık - kaldır.",

    ["npcPlacer"] = "NPC Yerleştiricisi",
    ["npcPlaced"] = "NPC başarıyla yerleştirildi.",
    ["invalidNPCType"] = "Geçersiz NPC türü, aletler menüsünden geçerli bir alet seçin.",
    ["npcRemoved"] = "NPC kaldırıldı.",
    ["errorNotNPC"] = "Bu aleti sadece NPC kaldırıp/oluşturmanı sağlar.",
    ["npcPlacerDescription"] = "PSunucudan NPC kaldırıp yerleştirmeni sağlar, Sol Tık - yerleştir, Sağ Tık - kaldır.",
    ["npcPlacerDescriptionSmall"] = "Sunucudan NPC kaldırıp eklemeni sağlar.",

    ["inventory"] = "Envanter",
    ["player"] = "Oyuncu",
    ["drop"] = "Bırak",
    ["use"] = "Kullan",
    ["dropAll"] = "Hepsini Bırak",
    ["delete"] = "Kaldır",
} )
--PATH addons/bricks_gangs/lua/bricks_server/bricks_gangs/sh_devconfig.lua:
--[[
    !!WARNING!!
        ALL CONFIG IS DONE INGAME, DONT EDIT ANYTHING HERE
        Type !bricksserver ingame or use the f4menu
    !!WARNING!!
]]--

BRICKS_SERVER.DEVCONFIG.GangURLWhitelist = {
    "https://i.imgur.com/"
}

BRICKS_SERVER.DEVCONFIG.GangRankLimit = 30
BRICKS_SERVER.DEVCONFIG.GangPrinterнServerTime = 0.1 -- The decimal to reduce the server time by for each server, e.g. 0.1 would make the added time 10% less for server 2 and 20% less for server 3.

BRICKS_SERVER.DEVCONFIG.GangNameCharMin = 4
BRICKS_SERVER.DEVCONFIG.GangNameCharMax = 16
BRICKS_SERVER.DEVCONFIG.GangIconCharLimit = 200
BRICKS_SERVER.DEVCONFIG.GangNextEditTime = 1
BRICKS_SERVER.DEVCONFIG.GangPermissions = {
    ["DepositMoney"] = { BRICKS_SERVER.Func.L( "gangDepositMoney" ), BRICKS_SERVER.Func.L( "gangBalance" ) },
    ["WithdrawMoney"] = { BRICKS_SERVER.Func.L( "gangWithdrawMoney" ), BRICKS_SERVER.Func.L( "gangBalance" ) },
    ["EditRoles"] = { BRICKS_SERVER.Func.L( "gangEditRoles" ), BRICKS_SERVER.Func.L( "gangSettings" ) },
    ["EditSettings"] = { BRICKS_SERVER.Func.L( "gangEditSettings" ), BRICKS_SERVER.Func.L( "gangSettings" ) },
    ["InvitePlayers"] = { BRICKS_SERVER.Func.L( "gangInvitePlayers" ), BRICKS_SERVER.Func.L( "gangManagement" ) },
    ["KickPlayers"] = { BRICKS_SERVER.Func.L( "gangKickPlayers" ), BRICKS_SERVER.Func.L( "gangManagement" ) },
    ["ChangePlayerRoles"] = { BRICKS_SERVER.Func.L( "gangChangeRank" ), BRICKS_SERVER.Func.L( "gangManagement" ) },
    ["PurchaseUpgrades"] = { BRICKS_SERVER.Func.L( "gangPurchaseUpgrades" ), BRICKS_SERVER.Func.L( "gangManagement" ) },
    ["EditInbox"] = { BRICKS_SERVER.Func.L( "gangAcceptDeclineInbox" ), BRICKS_SERVER.Func.L( "gangManagement" ) },
    ["SendMessages"] = { BRICKS_SERVER.Func.L( "gangSendChatMessages" ), BRICKS_SERVER.Func.L( "gangChatLower" ) }
}

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "associations" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangPermissions["RequestAssociations"] = { BRICKS_SERVER.Func.L( "gangAssociationSend" ), BRICKS_SERVER.Func.L( "gangAssociations" ) }
    BRICKS_SERVER.DEVCONFIG.GangPermissions["AcceptAssociations"] = { BRICKS_SERVER.Func.L( "gangAssociationAccept" ), BRICKS_SERVER.Func.L( "gangAssociations" ) }
end

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "storage" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangPermissions["DepositItem"] = { BRICKS_SERVER.Func.L( "gangDepositItems" ), BRICKS_SERVER.Func.L( "gangStorage" ) }
    BRICKS_SERVER.DEVCONFIG.GangPermissions["WithdrawItem"] = { BRICKS_SERVER.Func.L( "gangWithdrawItems" ), BRICKS_SERVER.Func.L( "gangStorage" ) }
    BRICKS_SERVER.DEVCONFIG.GangPermissions["ViewItem"] = { BRICKS_SERVER.Func.L( "gangViewStorage" ), BRICKS_SERVER.Func.L( "gangStorage" ) }
end

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "printers" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangPermissions["PurchasePrinters"] = { BRICKS_SERVER.Func.L( "gangPurchasePrinters" ), BRICKS_SERVER.Func.L( "gangPrinters" ) }
    BRICKS_SERVER.DEVCONFIG.GangPermissions["UpgradePrinters"] = { BRICKS_SERVER.Func.L( "gangUpgradePrinters" ), BRICKS_SERVER.Func.L( "gangPrinters" ) }
    BRICKS_SERVER.DEVCONFIG.GangPermissions["PlacePrinters"] = { BRICKS_SERVER.Func.L( "gangPlacePrinters" ), BRICKS_SERVER.Func.L( "gangPrinters" ) }

    BRICKS_SERVER.DEVCONFIG.GangPrinterSlots = 6
    BRICKS_SERVER.DEVCONFIG.GangPrinterW = 807*0.8
    BRICKS_SERVER.DEVCONFIG.GangPrinterH = 1018*0.8
end

BRICKS_SERVER.DEVCONFIG.GangUpgrades = {
    ["MaxMembers"] = {
        Name = BRICKS_SERVER.Func.L( "gangMaxMembers" ),
        Format = function( reqInfo )
            return (reqInfo[1] or 0) .. " " .. BRICKS_SERVER.Func.L( "gangMembers" )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangMembers" ), "integer" }
        }
    },
    ["MaxBalance"] = { 
        Name = BRICKS_SERVER.Func.L( "gangMaxBalance" ), 
        Format = function( reqInfo )
            return DarkRP.formatMoney( reqInfo[1] or 0 )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangBalance" ), "integer" }
        }
    },
    ["Health"] = { 
        Name = BRICKS_SERVER.Func.L( "gangIncreasedHealth" ), 
        Format = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangXHP", (reqInfo[1] or 0) )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangExtraHealth" ), "integer" }
        }
    },
    ["Armor"] = { 
        Name = BRICKS_SERVER.Func.L( "gangIncreasedArmor" ), 
        Format = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangXAP", (reqInfo[1] or 0) )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangExtraArmor" ), "integer" }
        }
    },
    ["Salary"] = { 
        Name = BRICKS_SERVER.Func.L( "gangIncreasedSalary" ), 
        Format = function( reqInfo )
            return "+" .. DarkRP.formatMoney( reqInfo[1] or 0 )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangExtraSalary" ), "integer" }
        }
    },
    ["Weapon"] = { 
        Name = BRICKS_SERVER.Func.L( "gangPermWeapon" ), 
        Unlimited = true,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangWeapon" ), "table", "weapons" }
        }
    }
}

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "storage" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangUpgrades["StorageSlots"] = { 
        Name = BRICKS_SERVER.Func.L( "gangStorageSlots" ), 
        Format = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangXSlots", (reqInfo[1] or 0) )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangSlots" ), "integer" }
        }
    }
end

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "achievements" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangAchievements = {
        ["Balance"] = {
            Name = BRICKS_SERVER.Func.L( "gangBalanceFull" ),
            Format = function( progress, goal )
                return DarkRP.formatMoney( progress ) .. "/" .. DarkRP.formatMoney( goal )
            end,
            GetProgress = function( gangTable )
                return gangTable.Money or 0
            end,
            GetGoal = function( reqInfo )
                return reqInfo[1] or 0
            end,
            ReqInfo = {
                [1] = { BRICKS_SERVER.Func.L( "gangBalance" ), "integer" }
            }
        },
        ["Members"] = {
            Name = BRICKS_SERVER.Func.L( "gangMembersFull" ),
            Format = function( progress, goal )
                return progress .. "/" .. goal .. " " .. BRICKS_SERVER.Func.L( "gangMembers" )
            end,
            GetProgress = function( gangTable )
                return table.Count( gangTable.Members or {} )
            end,
            GetGoal = function( reqInfo )
                return reqInfo[1] or 0
            end,
            ReqInfo = {
                [1] = { BRICKS_SERVER.Func.L( "gangMembers" ), "integer" }
            }
        },
        ["Level"] = {
            Name = BRICKS_SERVER.Func.L( "gangLevel" ),
            Format = function( progress, goal )
                return BRICKS_SERVER.Func.L( "level" ) .. " " .. progress .. "/" .. goal
            end,
            GetProgress = function( gangTable )
                return gangTable.Level or 0
            end,
            GetGoal = function( reqInfo )
                return reqInfo[1] or 0
            end,
            ReqInfo = {
                [1] = { BRICKS_SERVER.Func.L( "level" ), "integer" }
            }
        }
    }

    if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "storage" ) ) then
        BRICKS_SERVER.DEVCONFIG.GangAchievements["Storage"] = {
            Name = BRICKS_SERVER.Func.L( "gangStorageFull" ),
            Format = function( progress, goal )
                return progress .. "/" .. goal .. " " .. BRICKS_SERVER.Func.L( "gangItems" )
            end,
            GetProgress = function( gangTable )
                local itemCount = 0
                for k, v in pairs( gangTable.Storage or {} ) do
                    itemCount = itemCount+(v[1] or 0)
                end

                return itemCount
            end,
            GetGoal = function( reqInfo )
                return reqInfo[1] or 0
            end,
            ReqInfo = {
                [1] = { BRICKS_SERVER.Func.L( "gangItems" ), "integer" }
            }
        }
    end
end

BRICKS_SERVER.DEVCONFIG.GangNotifications = {
    ["GangInvite"] = {
        Name = BRICKS_SERVER.Func.L( "gangInvite" ),
        ReqInfo = {
            [1] = { "InviterGangID", "integer" },
            [2] = { "InviterGangName", "string" }
        },
        FormatDescription = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangInviteReceivedInbox", reqInfo[2] )
        end,
        AcceptFunc = function( reqInfo ) 
            net.Start( "BRS.Net.GangInviteAccept" )
                net.WriteUInt( reqInfo[1], 16 )
            net.SendToServer()
        end
    },
    ["AssociationInvite"] = {
        Name = BRICKS_SERVER.Func.L( "gangAssociationInvite" ),
        ReqInfo = {
            [1] = { "InviterGangID", "integer" },
            [2] = { "InviterGangName", "string" },
            [3] = { "AssociationType", "string" }
        },
        FormatDescription = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangAssociationInviteInbox", reqInfo[2], reqInfo[3] )
        end,
        AcceptFunc = function( reqInfo ) 
            net.Start( "BRS.Net.AcceptGangAssociation" )
                net.WriteUInt( reqInfo[1], 16 )
            net.SendToServer()
        end
    },
    ["AssociationCreated"] = {
        Name = BRICKS_SERVER.Func.L( "gangAssociationCreated" ),
        ReqInfo = {
            [1] = { "OtherGangID", "integer" },
            [2] = { "OtherGangName", "string" },
            [3] = { "AssociationType", "string" }
        },
        FormatDescription = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangAssociationCreatedInbox", reqInfo[3], reqInfo[2] )
        end
    },
    ["AssociationDissolved"] = {
        Name = BRICKS_SERVER.Func.L( "gangAssociationDissolved" ),
        ReqInfo = {
            [1] = { "OtherGangID", "integer" },
            [2] = { "OtherGangName", "string" }
        },
        FormatDescription = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangAssociationDissolvedInbox", reqInfo[2] )
        end
    },
    ["AdminMail"] = {
        Name = BRICKS_SERVER.Func.L( "gangAdminNotification" ),
        ReqInfo = {
            [1] = { "Header", "string" },
            [2] = { "Description", "string" }
        },
        FormatHeader = function( reqInfo )
            return reqInfo[1]
        end,
        FormatDescription = function( reqInfo )
            return reqInfo[2]
        end
    },
    ["Achievement"] = {
        Name = BRICKS_SERVER.Func.L( "gangInboxAchievement" ),
        ReqInfo = {
            [1] = { "Achievement Key", "integer" }
        },
        FormatDescription = function( reqInfo )
            local achievementConfig = BRICKS_SERVER.CONFIG.GANGS.Achievements[reqInfo[1]]

            return BRICKS_SERVER.Func.L( "gangInboxAchievementCompleted", achievementConfig.Name )
        end
    },
    ["AchievementReward"] = {
        Name = BRICKS_SERVER.Func.L( "gangInboxAchievement" ),
        ReqInfo = {
            [1] = { "Achievement Key", "integer" },
            [2] = { "Achievement Rewards", "table" }
        },
        FormatDescription = function( reqInfo )
            local rewardString = ""
            for k, v in pairs( reqInfo[2] or {} ) do
                local devConfigReward = BRICKS_SERVER.DEVCONFIG.GangRewards[k]

                if( not devConfigReward ) then continue end

                if( rewardString == "" ) then
                    rewardString =  devConfigReward.FormatDescription( v )
                else
                    rewardString = rewardString .. ", " .. devConfigReward.FormatDescription( v )
                end
            end

            local achievementConfig = BRICKS_SERVER.CONFIG.GANGS.Achievements[reqInfo[1]]

            return BRICKS_SERVER.Func.L( "gangInboxAchievementCompletedReward", achievementConfig.Name, rewardString )
        end,
        AcceptFunc = function( reqInfo, inboxKey ) 
            net.Start( "BRS.Net.GangAchievementClaim" )
                net.WriteUInt( inboxKey, 16 )
            net.SendToServer()
        end
    }
}

BRICKS_SERVER.DEVCONFIG.GangRewards = {
    ["GangExperience"] = {
        Name = BRICKS_SERVER.Func.L( "gangExperienceFull" ),
        Color = Color( 22, 160, 133 ),
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "experience" ), "integer" }
        },
        FormatDescription = function( reqInfo )
            return BRICKS_SERVER.Func.FormatGangEXP( reqInfo[1] or 0 ) .. " " .. BRICKS_SERVER.Func.L( "exp" )
        end,
        RewardFunc = function( gangID, reqInfo )
            BRICKS_SERVER.Func.AddGangExperience( gangID, reqInfo[1] )

            return true
        end
    },
    ["GangBalance"] = {
        Name = BRICKS_SERVER.Func.L( "gangBalanceFull" ),
        Color = Color( 39, 174, 96 ),
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "money" ), "integer" }
        },
        FormatDescription = function( reqInfo )
            return DarkRP.formatMoney( reqInfo[1] or 0 )
        end,
        RewardFunc = function( gangID, reqInfo )
            BRICKS_SERVER.Func.AddGangBalance( gangID, reqInfo[1] )
        end
    }
}

hook.Add("bWhitelist:Init", "BricksServerHooks_bWhitelist:Init_Gang", function()
    BRICKS_SERVER.DEVCONFIG.GangRewards["bWhitelist"] = {
        Name = BRICKS_SERVER.Func.L( "gangJobWhitelist" ),
        Temporary = true,
        Color = Color( 52, 152, 219 ),
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangJobs" ), "custom", function( rewardTable, rewardKey, reqInfoKey, currentReqInfo )
                BRICKS_SERVER.Func.CreateTeamSelector( (currentReqInfo or {}), BRICKS_SERVER.Func.L( "gangJobsSelect" ), function( teamTable ) 
                    if( table.Count( teamTable ) > 0 ) then
                        rewardTable[rewardKey] = rewardTable[rewardKey] or {}
                        rewardTable[rewardKey][reqInfoKey] = teamTable
                    else
                        rewardTable[rewardKey] = nil
                    end
                end, function() end )
            end }
        },
        FormatDescription = function( reqInfo )
            local jobString = ""
            for k, v in pairs( reqInfo[1] or {} ) do
                for key, val in pairs( RPExtraTeams ) do
                    if( val.command == k ) then
                        if( jobString == "" ) then
                            jobString = val.name
                        else
                            jobString = jobString .. ", " .. val.name
                        end
                        break
                    end
                end
            end

            return jobString
        end,
        RewardFunc = function( gangID, reqInfo )
            local teams = {}
            for k, v in pairs( reqInfo[1] or {} ) do
                for key, val in pairs( RPExtraTeams ) do
                    if( val.command == k ) then
                        table.insert( teams, k )
                        break
                    end
                end
            end

            local gangTable = (BRICKS_SERVER_GANGS or {})[gangID] or {}

            for k, v in pairs( teams ) do
                for key, val in pairs( gangTable.Members ) do
                    GAS.JobWhitelist:AddToWhitelist( v, GAS.JobWhitelist.LIST_TYPE_STEAMID, key )
                end
            end

            return true
        end,
        UnRewardFunc = function( gangID, reqInfo )
            local teams = {}
            for k, v in pairs( reqInfo[1] or {} ) do
                for key, val in pairs( RPExtraTeams ) do
                    if( val.command == k ) then
                        table.insert( teams, k )
                        break
                    end
                end
            end

            local gangTable = (BRICKS_SERVER_GANGS or {})[gangID] or {}

            for k, v in pairs( teams ) do
                for key, val in pairs( gangTable.Members ) do
                    GAS.JobWhitelist:RemoveFromWhitelist( v, GAS.JobWhitelist.LIST_TYPE_STEAMID, key )
                end
            end

            return true
        end
    }
end )

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "leaderboards" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangLeaderboards = {
        ["Experience"] = {
            Name = BRICKS_SERVER.Func.L( "experience" ),
            Color = Color( 22, 160, 133 ),
            FormatDescription = function( value )
                return BRICKS_SERVER.Func.FormatGangEXP( value or 0 ) .. " " .. BRICKS_SERVER.Func.L( "exp" )
            end,
            GetSortValue = function( gangTable )
                return gangTable.Experience or 0
            end
        },
        ["Members"] = {
            Name = BRICKS_SERVER.Func.L( "gangMembers" ),
            Color = Color( 41, 128, 185 ),
            FormatDescription = function( value )
                return (value or 0) .. " " .. (((value or 0) != 1 and BRICKS_SERVER.Func.L( "gangMembers" )) or BRICKS_SERVER.Func.L( "gangMember" ))
            end,
            GetSortValue = function( gangTable )
                return table.Count( gangTable.Members or {} )
            end
        },
        ["Balance"] = {
            Name = BRICKS_SERVER.Func.L( "gangBalance" ),
            Color = Color( 39, 174, 96 ),
            FormatDescription = function( value )
                return DarkRP.formatMoney( value or 0 )
            end,
            GetSortValue = function( gangTable )
                return gangTable.Money or 0
            end
        }
    }

    if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "storage" ) ) then
        BRICKS_SERVER.DEVCONFIG.GangLeaderboards["StorageItems"] = {
            Name = BRICKS_SERVER.Func.L( "gangStorageItems" ),
            Color = Color( 231, 76, 60 ),
            FormatDescription = function( value )
                return (value or 0) .. " " .. (((value or 0) != 1 and BRICKS_SERVER.Func.L( "gangItems" )) or BRICKS_SERVER.Func.L( "gangItem" ))
            end,
            GetSortValue = function( gangTable )
                return table.Count( gangTable.Storage or {} )
            end
        }
    end
end

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "associations" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangAssociationTypes = {
        ["Allies"] = {
            Icon = "flag.png",
            Color = Color( 52, 152, 219 ),
            Query = BRICKS_SERVER.Func.L( "gangAllyRequest" )
        },
        ["War"] = {
            Icon = "gang_war.png",
            Color = Color( 231, 76, 60 ),
            Query = BRICKS_SERVER.Func.L( "gangWarRequest" )
        },
    }
end

BRICKS_SERVER.DEVCONFIG.GangAdminCmds = {
    -- [1] = {
    --     Name = BRICKS_SERVER.Func.L( "gangSetLevel" ),
    --     Icon = "levelling.png",
    --     ReqInfo = {
    --         [1] = { "Level", "integer", false, BRICKS_SERVER.Func.L( "gangSetLevelQuery" ) }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         local newLevel = math.Clamp( reqInfo[1] or (gangTable.Level or 0), 0, BRICKS_SERVER.CONFIG.GANGS["Max Level"] )
    --         BRICKS_SERVER.Func.SetGangLevel( gangID, newLevel )
    --         BRICKS_SERVER.Func.SetGangExperience( gangID, BRICKS_SERVER.Func.GetGangExpToLevel( 0, newLevel ) )
    --         return BRICKS_SERVER.Func.L( "gangSetLevelMsg", (gangTable.Name or "NIL"), newLevel )
    --     end
    -- },
    -- [2] = {
    --     Name = BRICKS_SERVER.Func.L( "gangAddExperience" ),
    --     Icon = "gang_experience.png",
    --     ReqInfo = {
    --         [1] = { "Experience", "integer", false, BRICKS_SERVER.Func.L( "gangAddExperienceQuery" ) }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         local experience = reqInfo[1] or (gangTable.Experience or 0)
    --         BRICKS_SERVER.Func.AddGangExperience( gangID, experience )
    --         return BRICKS_SERVER.Func.L( "gangAddExperienceMsg", BRICKS_SERVER.Func.FormatGangEXP( experience ), (gangTable.Name or "NIL") )
    --     end
    -- },
    -- [3] = {
    --     Name = BRICKS_SERVER.Func.L( "gangSetBalance" ),
    --     Icon = "balance.png",
    --     ReqInfo = {
    --         [1] = { "Money", "integer", false, BRICKS_SERVER.Func.L( "gangSetBalanceQuery" ) }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         local newBalance = reqInfo[1] or (gangTable.Money or 0)
    --         BRICKS_SERVER.Func.SetGangBalance( gangID, newBalance )
    --         return BRICKS_SERVER.Func.L( "gangSetBalanceMsg", (gangTable.Name or "NIL"), DarkRP.formatMoney( newBalance ) )
    --     end
    -- },
    -- [4] = {
    --     Name = BRICKS_SERVER.Func.L( "gangAddBalance" ),
    --     Icon = "gang_add_money.png",
    --     ReqInfo = {
    --         [1] = { "Money", "integer", false, BRICKS_SERVER.Func.L( "gangAddBalanceQuery" ) }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         local addBalance = reqInfo[1] or 0
    --         BRICKS_SERVER.Func.AddGangBalance( gangID, addBalance )
    --         return BRICKS_SERVER.Func.L( "gangAddBalanceMsg", DarkRP.formatMoney( addBalance ), (gangTable.Name or "NIL") )
    --     end
    -- },
    [1] = {
        Name = BRICKS_SERVER.Func.L( "gangViewMembers" ),
        Icon = "gang_viewmembers.png",
        ClientFunc = function( gangTable, gangID, panel )
            panel:ViewMembers()
        end
    },
    -- [6] = { -- Kick member
    --     ReqInfo = {
    --         [1] = { "MemberSteamID", "string" }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         if( gangTable.Owner == reqInfo[1] ) then
    --             return BRICKS_SERVER.Func.L( "gangCantKickOwner" )
    --         end

    --         local success = BRICKS_SERVER.Func.GangKickMember( gangID, reqInfo[1] )

    --         return (success and BRICKS_SERVER.Func.L( "gangKickSuccessAdmin" )) or BRICKS_SERVER.Func.L( "gangKickFailAdmin" )
    --     end
    -- },
    -- [7] = { -- Set member rank
    --     ReqInfo = {
    --         [1] = { "MemberSteamID", "string" },
    --         [2] = { "NewRank", "integer" }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         local success = BRICKS_SERVER.Func.GangMemberSetRank( gangID, reqInfo[1], reqInfo[2] )

    --         return (success and BRICKS_SERVER.Func.L( "gangSetRankSuccessAdmin" )) or BRICKS_SERVER.Func.L( "gangSetRankFailAdmin" )
    --     end
    -- },
    -- [8] = { -- Transfer ownership
    --     ReqInfo = {
    --         [1] = { "MemberSteamID", "string" }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         if( gangTable.Owner == reqInfo[1] ) then
    --             return BRICKS_SERVER.Func.L( "gangMemberAlreadyOwner" )
    --         end

    --         if( not gangTable.Members or not gangTable.Members[reqInfo[1]] ) then 
    --             return BRICKS_SERVER.Func.L( "gangNotMember" )
    --         end
        
    --         BRICKS_SERVER.Func.UpdateGangTable( gangID, "Owner", reqInfo[1] )

    --         return BRICKS_SERVER.Func.L( "gangOwnershipTransferedAdmin" )
    --     end
    -- },
    [2] = {
        Name = BRICKS_SERVER.Func.L( "delete" ),
        Icon = "gang_delete.png",
        ClientFunc = function( gangTable, gangID, panel )
            BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "gangDeleteAdminQuery", string.upper( gangTable.Name or "" ) ), "", function( text ) 
                if( text == "Подтверждаю" ) then
                    net.Start( "BRS.Net.AdminGangCMD" )
                        net.WriteUInt( 2, 8 )
                        net.WriteUInt( gangID, 16 )
                        net.WriteTable( {} )
                    net.SendToServer()
                end
            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
        end,
        ServerFunc = function( gangTable, gangID, reqInfo )
            BRICKS_SERVER.Func.DeleteGangTable( gangID )

            return BRICKS_SERVER.Func.L( "gangDeleteSuccessAdmin", gangTable.Name )
        end
    }
}

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "printers" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangServerUpgradeTypes = {
        ["Cooling"] = {
            Name = "Cooling",
            Icon = Material( "bricks_server/gangprinter_upgrade_cooling.png" ),
            Tiered = true,
            ReqInfo = {
                [1] = { "Temperature Decrease", "integer" }
            },
            SetFunc = function( ent, server, tier, upgradeConfig )
                ent:SetNW2Int( "CoolingServer" .. server, tier )

                if( tier >= #upgradeConfig.Tiers/2 ) then
                    ent:SetBodygroup( 8+((server-1)*2), 1 )

                    if( tier >= #upgradeConfig.Tiers ) then
                        ent:SetBodygroup( 8+((server-1)*2)+1, 1 )
                    end
                end
            end,
            GetFunc = function( ent, server )
                return ent:GetNW2Int( "CoolingServer" .. server, 0 )
            end
        },
        ["Speed"] = {
            Name = "Speed",
            Icon = Material( "bricks_server/gangprinter_upgrade_speed.png" ),
            Tiered = true,
            ReqInfo = {
                [1] = { "Speed Increase", "integer" }
            },
            SetFunc = function( ent, server, tier, upgradeConfig )
                ent:SetNW2Int( "SpeedServer" .. server, tier )
            end,
            GetFunc = function( ent, server )
                return ent:GetNW2Int( "SpeedServer" .. server, 0 )
            end
        },
        ["Amount"] = {
            Name = "Amount",
            Icon = Material( "bricks_server/gangprinter_upgrade_amount.png" ),
            Tiered = true,
            ReqInfo = {
                [1] = { "Amount Increase", "integer" }
            },
            SetFunc = function( ent, server, tier, upgradeConfig )
                ent:SetNW2Int( "AmountServer" .. server, tier )
            end,
            GetFunc = function( ent, server )
                return ent:GetNW2Int( "AmountServer" .. server, 0 )
            end
        }
    }

    BRICKS_SERVER.DEVCONFIG.GangPrinterUpgradeTypes = {
        ["Health"] = {
            Name = "Health",
            Icon = Material( "bricks_server/gangprinter_upgrade_health.png" ),
            Tiered = true,
            ReqInfo = {
                [1] = { "Health Increase", "integer" }
            },
            SetFunc = function( ent, value )
                ent:SetNW2Int( "HealthUpgrade", value )
            end,
            GetFunc = function( ent )
                return ent:GetNW2Int( "HealthUpgrade", 0 )
            end
        },
        ["RGB"] = {
            Name = "RGB",
            SetFunc = function( ent, value )
                ent:SetNW2Bool( "RGBUpgrade", true )

                ent:SetBodygroup( 7, 1 )
            end,
            GetFunc = function( ent )
                return ent:GetNW2Bool( "RGBUpgrade", false )
            end
        }
    }
end

BRICKS_SERVER.DEVCONFIG.PresetGangIcons = {
    "bricks_server/gang_viewmembers.png",
    "bricks_server/gang_add_money.png",
    "bricks_server/storage_64.png"
}

-- 1: sql key (set to false to not save to DB), 2: data type
BRICKS_SERVER.DEVCONFIG.GangTableKeys = {
    ["Name"] = { "gangName", "string" },
    ["Icon"] = { "gangIcon", "string" },
    ["Owner"] = { "owner", "string" },
    ["Level"] = { "level", "integer" },
    ["Experience"] = { "experience", "integer" },
    ["Money"] = { "money", "integer" },
    ["Storage"] = { "storage", "table" },
    ["Members"] = { "members", "table" },
    ["Roles"] = { "roles", "table" },
    ["Upgrades"] = { "upgrades", "table" },
    ["Achievements"] = { "achievements", "table" },
    ["Printers"] = { false, "table" },
}

BRICKS_SERVER.DEVCONFIG.NPCTypes = BRICKS_SERVER.DEVCONFIG.NPCTypes or {}
BRICKS_SERVER.DEVCONFIG.NPCTypes["Gang"] = {
    UseFunction = function( ply, ent, NPCKey )
        BRICKS_SERVER.Func.OpenGangMenu( ply )
    end
}

BRICKS_SERVER.DEVCONFIG.EntityTypes = BRICKS_SERVER.DEVCONFIG.EntityTypes or {}
BRICKS_SERVER.DEVCONFIG.EntityTypes["bricks_server_territory"] = { 
    GetDataFunc = function( entity ) 
        return entity:GetTerritoryKey() or 0
    end,
    SetDataFunc = function( entity, data ) 
        return entity:SetTerritoryKeyFunc( data or 0 )
    end
}
--PATH addons/brick_s_server_framework/lua/bricks_server/core/client/cl_bmasks.lua:
if( not BRICKS_SERVER.BMASKS ) then
    BRICKS_SERVER.BMASKS = {} --Global table, access the functions here

    BRICKS_SERVER.BMASKS.Materials = {} --Cache materials so they dont need to be reloaded
    BRICKS_SERVER.BMASKS.Masks = {} --A table of all active mask objects, you should destroy a mask object when done with it

    --The material used to draw the render targets
    BRICKS_SERVER.BMASKS.MaskMaterial = CreateMaterial("!bluemask","UnlitGeneric",{
        ["$translucent"] = 1,
        ["$vertexalpha"] = 1,
        ["$alpha"] = 1,
    })

    --Creates a mask with the specified options
    --Be sure to pass a unique maskName for each mask, otherwise they will override each other
    BRICKS_SERVER.BMASKS.CreateMask = function(maskName, maskPath, maskProperties)
        local mask = {}

        --Set mask name
        mask.name = maskName

        --Load materials
        if BRICKS_SERVER.BMASKS.Materials[maskPath] == nil then
            BRICKS_SERVER.BMASKS.Materials[maskPath] = Material(maskPath, maskProperties)
        end

        --Set the mask material
        mask.material = BRICKS_SERVER.BMASKS.Materials[maskPath]

        --Create the render target
        mask.renderTarget = GetRenderTargetEx("BRICKS_SERVER.BMASKS:"..maskName, ScrW(), ScrH(), RT_SIZE_FULL_FRAME_BUFFER, MATERIAL_RT_DEPTH_NONE, 2, CREATERENDERTARGETFLAGS_UNFILTERABLE_OK, IMAGE_FORMAT_RGBA8888)

        BRICKS_SERVER.BMASKS.Masks[maskName] = mask

        return maskName
    end

    --Call this to begin drawing with a mask.
    --After calling this any draw call will be masked until you call EndMask(maskName)
    BRICKS_SERVER.BMASKS.BeginMask = function(maskName)
        --FindMask
        if BRICKS_SERVER.BMASKS.Masks[maskName] == nil then 
            print("Cannot begin a mask without creating it first!") 
            return false
        end

        --Store current render target
        BRICKS_SERVER.BMASKS.Masks[maskName].previousRenderTarget = render.GetRenderTarget() 
        
        --Confirgure drawing so that we write to the masks render target
        render.PushRenderTarget(BRICKS_SERVER.BMASKS.Masks[maskName].renderTarget)
        render.OverrideAlphaWriteEnable( true, true )
        render.Clear( 0, 0, 0, 0 ) 
    end

    --Ends the mask and draws it
    --Not calling this after calling BeginMask will cause some really bad effects 
    --This done return the render target used, using this you can create other effects such as drop shadows without problems
    --Passes true for dontDraw will result in it not being render and only returning the texture of the result (which is ScrW()xScrH())
    BRICKS_SERVER.BMASKS.EndMask = function(maskName, x, y, sizex, sizey, opacity, rotation, dontDraw)

        dontDraw = dontDraw or false
        rotation = rotation or 0
        opacity = opacity or 255

        --Draw the mask
        render.OverrideBlendFunc( true, BLEND_ZERO, BLEND_SRC_ALPHA, BLEND_DST_ALPHA, BLEND_ZERO )
        surface.SetDrawColor(255,255,255,opacity)
        surface.SetMaterial(BRICKS_SERVER.BMASKS.Masks[maskName].material)
        if rotation == nil or rotation == 0 then
            surface.DrawTexturedRect(x, y, sizex, sizey) 
        else
            surface.DrawTexturedRectRotated(x, y, sizex, sizey, rotation) 
        end
        render.OverrideBlendFunc(false)
        render.OverrideAlphaWriteEnable( false )
        render.PopRenderTarget() 

        --Update material
        BRICKS_SERVER.BMASKS.MaskMaterial:SetTexture('$basetexture', BRICKS_SERVER.BMASKS.Masks[maskName].renderTarget)

        --Clear material for upcoming draw calls
        draw.NoTexture()

        --Only draw if they want is to
        if not dontDraw then
            --Now draw finished result
            surface.SetDrawColor(255,255,255,255) 
            surface.SetMaterial(BRICKS_SERVER.BMASKS.MaskMaterial) 
            render.SetMaterial(BRICKS_SERVER.BMASKS.MaskMaterial)
            render.DrawScreenQuad() 
        end

        return BRICKS_SERVER.BMASKS.Masks[maskName].renderTarget
    end
end
--PATH addons/brick_s_server_framework/lua/bricks_server/core/client/cl_npc_system.lua:
function BRICKS_SERVER.Func.CreateNPCEditor( NPCKey, oldNPCTable, onSave, onCancel )
	BS_NPC_EDITOR = vgui.Create( "DFrame" )
	BS_NPC_EDITOR:SetSize( ScrW(), ScrH() )
	BS_NPC_EDITOR:Center()
	BS_NPC_EDITOR:SetTitle( "" )
	BS_NPC_EDITOR:ShowCloseButton( false )
	BS_NPC_EDITOR:SetDraggable( false )
	BS_NPC_EDITOR:MakePopup()
	BS_NPC_EDITOR:SetAlpha( 0 )
	BS_NPC_EDITOR:AlphaTo( 255, 0.1, 0 )
	BS_NPC_EDITOR.Paint = function( self2 ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )
	end

	local backPanel = vgui.Create( "DPanel", BS_NPC_EDITOR )
	backPanel.Paint = function( self2, w, h ) 
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
		draw.RoundedBox( 5, 1, 1, w-2, h-2, BRICKS_SERVER.Func.GetTheme( 2 ) )
	end

	local NPCTable = table.Copy( oldNPCTable )

	local textArea

	local actions = {
		[1] = { BRICKS_SERVER.Func.L( "name" ), Material( "materials/bricks_server/name.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newNameQuery" ), NPCTable.Name, function( text ) 
				NPCTable.Name = text
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end, "Name" },
		[2] = { BRICKS_SERVER.Func.L( "model" ), Material( "materials/bricks_server/icon.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newModelQuery" ), (NPCTable.Model or ""), function( text ) 
				if( text == "" ) then
					NPCTable.Model = nil
				else
					NPCTable.Model = text
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end, "Model" },
		[3] = { BRICKS_SERVER.Func.L( "type" ), Material( "materials/bricks_server/amount.png" ), function()
			local options = {}
			for k, v in pairs( BRICKS_SERVER.DEVCONFIG.NPCTypes ) do
				options[k] = k
			end
			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "npcTypeQuery" ), (NPCTable.Type or ""), options, function( value, data ) 
				if( BRICKS_SERVER.DEVCONFIG.NPCTypes[data] ) then
					NPCTable.Type = data
					backPanel.FillActions()
					backPanel.FillOptions()
				else
					notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidType" ), 1, 3 )
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
		end, "Type" }
	}

	local originalActionsLen = #actions
	function backPanel.FillActions()
		for k, v in pairs( actions ) do
			if( k > originalActionsLen ) then
				actions[k] = nil
			end
		end

		if( BRICKS_SERVER.DEVCONFIG.NPCTypes[(NPCTable.Type or "")] and BRICKS_SERVER.DEVCONFIG.NPCTypes[(NPCTable.Type or "")].ReqInfo ) then
			for k, v in pairs( BRICKS_SERVER.DEVCONFIG.NPCTypes[(NPCTable.Type or "")].ReqInfo ) do
				local actionTable = {}
				if( v[2] == "string" ) then
					actionTable = { v[1], Material( "materials/bricks_server/more_24.png" ), function()
						BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "valueQuery", v[1] ), (NPCTable.ReqInfo or {})[k] or "", function( text ) 
							NPCTable.ReqInfo = NPCTable.ReqInfo or {}
							NPCTable.ReqInfo[k] = text
						end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
					end }
				elseif( v[2] == "integer" ) then
					actionTable = { v[1], Material( "materials/bricks_server/more_24.png" ), function()
						BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "valueQuery", v[1] ), (NPCTable.ReqInfo or {})[k] or 0, function( number ) 
							NPCTable.ReqInfo = NPCTable.ReqInfo or {}
							NPCTable.ReqInfo[k] = number
						end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
					end }
				elseif( v[2] == "table" ) then
					actionTable = { v[1], Material( "materials/bricks_server/more_24.png" ), function()
						local options = BRICKS_SERVER.Func.GetList( v[3] ) or {}
						BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "valueQuery", v[1] ), (NPCTable.ReqInfo or {})[k] or "", options, function( value, data ) 
							if( options[data] ) then
								NPCTable.ReqInfo = NPCTable.ReqInfo or {}
								NPCTable.ReqInfo[k] = data
							else
								notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidOption" ), 1, 3 )
							end
						end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
					end }
				end

				table.insert( actions, actionTable )
			end
		end
	end
	backPanel.FillActions()
	
	function backPanel.FillOptions()
		backPanel:Clear()

		textArea = vgui.Create( "DPanel", backPanel )
		textArea:Dock( TOP )
		textArea:DockMargin( 10, 10, 10, 0 )
		textArea:SetTall( 30 )
		textArea.Paint = function( self2, w, h ) 
			draw.SimpleText( BRICKS_SERVER.Func.L( "npcEditor" ), "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end

		for k, v in ipairs( actions ) do
			local actionButton = vgui.Create( "DButton", backPanel )
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
				
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
		
				surface.SetAlphaMultiplier( changeAlpha/255 )
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
				surface.SetAlphaMultiplier( 1 )

				if( v[2] ) then
					surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
					surface.SetMaterial( v[2] )
					local iconSize = 24
					surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
				end

				if( v[4] and NPCTable[v[4]] and not v[5] ) then
					draw.SimpleText( v[1] .. " - " .. string.sub( NPCTable[v[4]], 1, 20 ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				elseif( v[5] and isfunction( v[5] ) ) then
					draw.SimpleText( v[1] .. " - " .. v[5](), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				else
					draw.SimpleText( v[1], "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end
			actionButton.DoClick = function()
				if( v[3] ) then
					v[3]()
				end
			end
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
			onSave( NPCTable )

			BS_NPC_EDITOR:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BS_NPC_EDITOR ) ) then
					BS_NPC_EDITOR:Remove()
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

			BS_NPC_EDITOR:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BS_NPC_EDITOR ) ) then
					BS_NPC_EDITOR:Remove()
				end
			end )
		end

		backPanel:SetSize( (2*10)+(2*150)+80, buttonPanel:GetTall()+(4*10)+textArea:GetTall()+(#actions*50) )
		backPanel:Center()

		leftButton:SetWide( (backPanel:GetWide()-30)/2 )
		rightButton:SetWide( (backPanel:GetWide()-30)/2 )
	end
	backPanel.FillOptions()
end
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_colsheet.lua:

local PANEL = {}

AccessorFunc( PANEL, "ActiveButton", "ActiveButton" )

function PANEL:Init()
	self.Navigation = vgui.Create( "bricks_server_scrollpanel", self )
	self.Navigation:Dock( LEFT )
	self.Navigation:SetWidth( BRICKS_SERVER.DEVCONFIG.MainNavWidth )
	self.Navigation:DockMargin( 0, 0, 0, 0 )
	self.Navigation.Paint = function( self2, w, h )
		draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), false, false, true, false )
	end

	self.Content = vgui.Create( "Panel", self )
	self.Content:Dock( FILL )

	self.Items = {}
end

function PANEL:AddLinebreak()
	local lineBreak = vgui.Create( "DPanel", self.Navigation )
	lineBreak:Dock( TOP )
	lineBreak:DockMargin( 0, 0, 0, 10 )
	lineBreak:SetTall( 5 )
	lineBreak.Paint = function( self2, w, h )
		surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
		surface.DrawRect( 0, 0, w, h )
	end
end

function PANEL:AddSheet( label, panel, onLoad, icon, color1, color2 )
	if ( !IsValid( panel ) ) then return end

	local Sheet = {}
	Sheet.Button = vgui.Create( "DButton", self.Navigation )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:DockMargin( 7, 0, 7, 10 )
	Sheet.Button:SetText( "" )
	Sheet.Button:SetTall( BRICKS_SERVER.Func.ScreenScale( 40 ) )
	Sheet.Button:SetColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( string.upper( label ) )
	local iconMat
	BRICKS_SERVER.Func.GetImage( icon or "", function( mat ) iconMat = mat end )
	local iconSize = BRICKS_SERVER.Func.ScreenScale( 24 )
	local boxH, boxHMin = 0, 20
	Sheet.Button.Paint = function( self2, w, h )
		if( self2:IsHovered() or self2.m_bSelected ) then
			boxH = math.Clamp( boxH+3, boxHMin, h )
		else
			boxH = math.Clamp( boxH-3, boxHMin, h )
		end

		local textColor = Color( BRICKS_SERVER.Func.GetTheme( 6 ).r, BRICKS_SERVER.Func.GetTheme( 6 ).g, BRICKS_SERVER.Func.GetTheme( 6 ).b, 75 )

		if( self2.m_bSelected ) then
			textColor = BRICKS_SERVER.Func.GetTheme( 6 )
		end

		if( boxH > boxHMin ) then
			if( not color1 or not color2 ) then
				draw.RoundedBox( 8, 0, (h/2)-(boxH/2), w, boxH, self2:GetColor() )
			else
				BRICKS_SERVER.Func.DrawGradientRoundedBox( 8, 0, (h/2)-(boxH/2), w, boxH, 0, color1, color2 )
			end
		end

		if( iconMat ) then
			surface.SetDrawColor( textColor )
			surface.SetMaterial( iconMat )
			surface.DrawTexturedRect( 12, (h/2)-(iconSize/2), iconSize, iconSize )
		end

		draw.SimpleText( string.upper( label ), "BRICKS_SERVER_Font23", 12+iconSize+12, h/2-1, textColor, 0, TEXT_ALIGN_CENTER )

		if( Sheet.notifications and Sheet.notifications > 0 ) then
			local nX, nY, nW, nH = h+textX+5, (h/2)-(20/2), 20, 20
			draw.RoundedBox( 5, nX, nY, nW, nH, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
			draw.SimpleText( Sheet.notifications, "BRICKS_SERVER_Font20", nX+(nW/2), nY+(nH/2), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
	end
	Sheet.Button.DoClick = function()
		self:SetActiveButton( Sheet.Button )
	end

	Sheet.Button.label = label

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetAlpha( 0 )
	Sheet.Panel:SetVisible( false )

	if( onLoad ) then
		Sheet.Button.loaded = false

		if( istable( onLoad ) ) then
			Sheet.Button.onLoad = onLoad[1]
			Sheet.Button.onEntered = onLoad[2]
		else
			Sheet.Button.onLoad = onLoad
		end
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

	if( self.OnSheetChange ) then
		self.OnSheetChange( active )
	end
	
	if ( self.ActiveButton && self.ActiveButton.Target ) then
		local targetPanel = self.ActiveButton.Target
		targetPanel:SetVisible( false )
		targetPanel:SetAlpha( 0 )
		self.ActiveButton:SetSelected( false )
		self.ActiveButton:SetToggle( false )
		self.ActiveButton:ColorTo( BRICKS_SERVER.Func.GetTheme( 2 ), 0.2 )
	end

	self.ActiveButton = active
	active.Target:SetVisible( true )
	active.Target:AlphaTo( 255, 0.2, 0, function() end )
	active:SetSelected( true )
	active:SetToggle( true )
	active:ColorTo( BRICKS_SERVER.Func.GetTheme( 5 ), 0.2 )

	if( active.onLoad and not active.loaded ) then
		active.onLoad()
		active.loaded = true
	elseif( active.onLoad and active.onEntered ) then
		active.onEntered()
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

derma.DefineControl( "bricks_server_colsheet", "", PANEL, "Panel" )

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_colsheet_icon.lua:

local PANEL = {}

AccessorFunc( PANEL, "ActiveButton", "ActiveButton" )

function PANEL:Init()

	self.Navigation = vgui.Create( "bricks_server_scrollpanel", self )
	self.Navigation:Dock( LEFT )
	self.Navigation:SetWidth( 65 )
	self.Navigation:DockMargin( 0, 0, 0, 0 )
	self.Navigation.Paint = function( self2, w, h )
		draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), false, false, true, false )
	end

	self.Content = vgui.Create( "Panel", self )
	self.Content:Dock( FILL )

	self.Items = {}

end

function PANEL:UseButtonOnlyStyle()
	self.ButtonOnly = true
end

function PANEL:AddSheet( panel, onLoad, icon, dontShow )

	if ( !IsValid( panel ) ) then return end

	local Sheet = {}
	Sheet.Button = vgui.Create( "DButton", self.Navigation )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:SetText( "" )
	Sheet.Button:SetTall( (not dontShow and 65) or 0 )
	local changeAlpha = 0
	local iconMat
	BRICKS_SERVER.Func.GetImage( icon or "", function( mat ) iconMat = mat end )
	Sheet.Button.Paint = function( self2, w, h )
		if( self2:IsHovered() or self2.m_bSelected ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end

		surface.SetAlphaMultiplier( changeAlpha/255 )
		surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.DrawRect( 0, 0, 5, h )
		surface.SetAlphaMultiplier( 1 )

		if( iconMat ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 75 ) )
			surface.SetMaterial( iconMat )
			local iconSize = 32
			surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
		end
	end

	Sheet.Button.DoClick = function()
		if( not Sheet.Button.m_bSelected ) then
			changeAlpha = 0
		end

		self:SetActiveButton( Sheet.Button )
	end

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetAlpha( 0 )
	Sheet.Panel:SetVisible( false )

	if( onLoad ) then
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

derma.DefineControl( "bricks_server_colsheet_icon", "", PANEL, "Panel" )

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_config_itemwhitelist.lua:
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

        local entitySearchBarBack = vgui.Create( "DPanel", self )
        entitySearchBarBack:Dock( TOP )
        entitySearchBarBack:DockMargin( 0, 0, 0, 5 )
        entitySearchBarBack:SetTall( 40 )
        local search = Material( "materials/bricks_server/search.png" )
        local Alpha = 0
        local Alpha2 = 20
        local color1 = BRICKS_SERVER.Func.GetTheme( 2 )
        local entitySearchBar
        entitySearchBarBack.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
    
            if( entitySearchBar:IsEditing() ) then
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
    
        entitySearchBar = vgui.Create( "bricks_server_search", entitySearchBarBack )
        entitySearchBar:Dock( FILL )
        
        local entitySpacing = 5
        local gridWide = (ScrW()*0.6)-BRICKS_SERVER.DEVCONFIG.MainNavWidth-20
        local wantedSlotSize = 125*(ScrW()/2560)
        local slotsWide = math.floor( gridWide/wantedSlotSize )
    
        local slotSize = (gridWide-((slotsWide-1)*entitySpacing))/slotsWide
    
        local entityGrid = vgui.Create( "DIconLayout", self )
        entityGrid:Dock( TOP )
        entityGrid:SetSpaceY( entitySpacing )
        entityGrid:SetSpaceX( entitySpacing )
        entityGrid:SetTall( slotSize )

        local function CreateSlot( header, text, doClick, key )
            entityGrid.slots = (entityGrid.slots or 0)+1
            local slots = entityGrid.slots
            local slotsTall = math.ceil( slots/slotsWide )
            local newTall = (slotsTall*slotSize)+((slotsTall-1)*entitySpacing)
            if( entityGrid:GetTall() != newTall ) then
                entityGrid:SetTall( newTall )
            end

            local slotBack = entityGrid:Add( "DButton" )
            slotBack:SetSize( slotSize, slotSize )
            slotBack:SetText( "" )
            local changeAlpha = 0
            local x, y, w, h = 0, 0, slotSize, slotSize
            slotBack.Paint = function( self2, w, h )
                local toScreenX, toScreenY = self2:LocalToScreen( 0, 0 )
                if( x != toScreenX or y != toScreenY ) then
                    x, y = toScreenX, toScreenY
                end

                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

                if( key and BS_ConfigCopyTable.INVENTORY.Whitelist[key] ) then
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
                end
                
                if( self2:IsDown() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 175 )
                elseif( self2:IsHovered() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 100 )
                else
                    changeAlpha = math.Clamp( changeAlpha-10, 0, 100 )
                end

                surface.SetAlphaMultiplier( changeAlpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
                surface.SetAlphaMultiplier( 1 )

                draw.SimpleText( header, "BRICKS_SERVER_Font17B", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
                draw.SimpleText( text, "BRICKS_SERVER_Font17", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
            end
            slotBack.DoClick = function( self2 )
                doClick( self2, x, y, w, h )
            end
        end

        function self.FillEntityList()
            entityGrid:Clear()

            if( not BS_ConfigCopyTable.INVENTORY.Whitelist ) then
                BS_ConfigCopyTable.INVENTORY.Whitelist = {}
            end

            entityGrid.slots = 1

            for k, v in pairs( list.Get( "SpawnableEntities" ) ) do
                if( (entitySearchBar:GetValue() or "") != "" and not string.find( string.lower( v.PrintName or "" ), string.lower( entitySearchBar:GetValue() or "" ) ) and not string.find( string.lower( k ), string.lower( entitySearchBar:GetValue() or "" ) ) ) then
                    continue
                end

                local actions = {}
                if( not BS_ConfigCopyTable.INVENTORY.Whitelist[k] ) then
                    actions[BRICKS_SERVER.Func.L( "whitelist" )] = function() 
                        BS_ConfigCopyTable.INVENTORY.Whitelist[k] = { true, true }
                        self.FillEntityList()
                        BRICKS_SERVER.Func.ConfigChange( "INVENTORY" )
                    end
                else
                    actions[BRICKS_SERVER.Func.L( "unWhitelist" )] = function() 
                        BS_ConfigCopyTable.INVENTORY.Whitelist[k] = nil
                        self.FillEntityList()
                        BRICKS_SERVER.Func.ConfigChange( "INVENTORY" )
                    end
                end

                CreateSlot( (v.PrintName or BRICKS_SERVER.Func.L( "nil" )), k, function( slotBack, x, y, w, h )
                    slotBack.Menu = vgui.Create( "bricks_server_dmenu" )
                    for key, val in pairs( actions ) do
                        slotBack.Menu:AddOption( key, val )
                    end
                    slotBack.Menu:Open()
                    slotBack.Menu:SetPos( x+w+5, y+(h/2)-(slotBack.Menu:GetTall()/2) )
                end, k )
            end

            for k, v in pairs( BS_ConfigCopyTable.INVENTORY.Whitelist ) do
                if( list.Get( "SpawnableEntities" )[k] ) then continue end

                if( (entitySearchBar:GetValue() or "") != "" and not string.find( string.lower( k ), string.lower( entitySearchBar:GetValue() or "" ) ) ) then
                    continue
                end

                local actions = {}
                actions[BRICKS_SERVER.Func.L( "remove" )] = function() 
                    BS_ConfigCopyTable.INVENTORY.Whitelist[k] = nil
                    self.FillEntityList()
                    BRICKS_SERVER.Func.ConfigChange( "INVENTORY" )
                end

                CreateSlot( BRICKS_SERVER.Func.L( "custom" ), k, function( slotBack, x, y, w, h )
                    slotBack.Menu = vgui.Create( "bricks_server_dmenu" )
                    for key, val in pairs( actions ) do
                        slotBack.Menu:AddOption( key, val )
                    end
                    slotBack.Menu:Open()
                    slotBack.Menu:SetPos( x+w+5, y+(h/2)-(slotBack.Menu:GetTall()/2) )
                end, k )
            end

            local addNewButton = entityGrid:Add( "DButton" )
            addNewButton:SetText( "" )
            addNewButton:SetSize( slotSize, slotSize )
            local changeAlpha = 0
            local newMat = Material( "materials/bricks_server/add_64.png")
            addNewButton.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                
                if( self2:IsDown() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 175 )
                elseif( self2:IsHovered() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 100 )
                else
                    changeAlpha = math.Clamp( changeAlpha-10, 0, 100 )
                end

                surface.SetAlphaMultiplier( changeAlpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
                surface.SetAlphaMultiplier( 1 )

                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
                surface.SetMaterial( newMat )
                local iconSize = 64
                surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )

                draw.SimpleText( BRICKS_SERVER.Func.L( "addCustom" ), "BRICKS_SERVER_Font17", w/2, h-10, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
            end
            addNewButton.DoClick = function()
                BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "entClassWhitelist" ), "", function( text ) 
                    if( list.Get( "SpawnableEntities" )[text] ) then
                        notification.AddLegacy( BRICKS_SERVER.Func.L( "entClassAlreadyOnList" ), 1, 5 )
                        return
                    end

                    BS_ConfigCopyTable.INVENTORY.Whitelist[text] = { true, true }
                    self.FillEntityList()
                    BRICKS_SERVER.Func.ConfigChange( "INVENTORY" )
                end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
            end
        end
        self.FillEntityList()

        entitySearchBar.OnChange = function()
            self.FillEntityList()
        end
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_itemwhitelist", PANEL, "bricks_server_scrollpanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/client/cl_gang_drawing.lua:
local ownerMat = Material( "bricks_server/crown.png" )
function BRICKS_SERVER.Func.GangCreateMemberSlot( parent, width, height, steamID, name, groupID, gangTable, actions )
    local playerEnt = player.GetBySteamID( steamID )
    local playerName = name

    if( IsValid( playerEnt ) ) then
        playerName = playerEnt:Nick()
    end

    local avatarBackSize = height-12
    local textStartPos = height+5

    local onlineSize = 22
    
    local playerBack = parent:Add( "DPanel" )
    playerBack:SetSize( width, height )
    local alpha = 0
    local playerButton
    local clickColor = Color( BRICKS_SERVER.Func.GetTheme( 0 ).r, BRICKS_SERVER.Func.GetTheme( 0 ).g, BRICKS_SERVER.Func.GetTheme( 0 ).b, 50 )
    playerBack.Paint = function( self2, w, h )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
        
        if( IsValid( playerButton ) ) then
            if( not playerButton:IsDown() and playerButton:IsHovered() ) then
                alpha = math.Clamp( alpha+3, 0, 50 )
            else
                alpha = math.Clamp( alpha-3, 0, 50 )
            end
    
            draw.RoundedBox( 5, 0, 0, w, h, Color( BRICKS_SERVER.Func.GetTheme( 1 ).r, BRICKS_SERVER.Func.GetTheme( 1 ).g, BRICKS_SERVER.Func.GetTheme( 1 ).b, alpha ) )

            BRICKS_SERVER.Func.DrawClickCircle( playerButton, w, h, clickColor )
        end

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
        draw.NoTexture()
        BRICKS_SERVER.Func.DrawCircle( (h-avatarBackSize)/2+(avatarBackSize/2), h/2, avatarBackSize/2, 45 )

        draw.SimpleText( playerName, "BRICKS_SERVER_Font30", textStartPos, h/2+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )
        draw.SimpleText( gangTable.Roles[groupID][1], "BRICKS_SERVER_Font20", textStartPos+1, h/2-2, (gangTable.Roles[groupID][2] or BRICKS_SERVER.Func.GetTheme( 6 )), 0, 0 )

        draw.NoTexture()
        if( IsValid( playerEnt ) ) then
            surface.SetDrawColor( BRICKS_SERVER.DEVCONFIG.BaseThemes.Green )
        else
            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
        end
        BRICKS_SERVER.Func.DrawArc( width-(height-onlineSize)/2-(onlineSize/2), height/2, onlineSize/2, 1, 0, 360, (IsValid( playerEnt ) and BRICKS_SERVER.DEVCONFIG.BaseThemes.Green) or BRICKS_SERVER.Func.GetTheme( 2 ) )
        BRICKS_SERVER.Func.DrawCircle( width-(height-onlineSize)/2-(onlineSize/2), height/2, (onlineSize-6)/2, 45 )
    end

    if( (gangTable.Owner or "") == steamID ) then
        surface.SetFont( "BRICKS_SERVER_Font30" )
        local nameX, nameY = surface.GetTextSize( playerName )

        local iconSize = 16

        local playerOwner = vgui.Create( "DPanel", playerBack )
        playerOwner:SetSize( iconSize, iconSize )
        playerOwner:SetPos( textStartPos+nameX+5, (height/2+2-(nameY/2))-(iconSize/2) )
        playerOwner.Paint = function( self2, w, h )
            surface.SetDrawColor( 243, 156, 18 )
            surface.SetMaterial( ownerMat )
            surface.DrawTexturedRect( 0, 0, w, h )
        end
    end

    local distance = 2

    local playerIcon = vgui.Create( "bricks_server_circle_avatar" , playerBack )
    playerIcon:SetPos( (height-avatarBackSize)/2+distance, (height-avatarBackSize)/2+distance )
    playerIcon:SetSize( avatarBackSize-(2*distance), avatarBackSize-(2*distance) )
    if( IsValid( playerEnt ) ) then
        playerIcon:SetPlayer( playerEnt, 64 )
    else
        playerIcon:SetSteamID( util.SteamIDTo64( steamID ), 64 )
    end

    playerButton = vgui.Create( "DButton" , playerBack )
    playerButton:SetSize( width, height )
    playerButton:SetText( "" )
    local x, y, w, h = 0, 0, playerButton:GetWide(), playerButton:GetTall()
    playerButton.Paint = function( self2, w, h )
        local toScreenX, toScreenY = self2:LocalToScreen( 0, 0 )
        if( x != toScreenX or y != toScreenY ) then
            x, y = toScreenX, toScreenY
        end
    end
    playerButton.DoClick = function( self2 )
        self2.Menu = vgui.Create( "bricks_server_dmenu" )

        if( not actions ) then
            if( LocalPlayer():GangHasPermission( "ChangePlayerRoles" ) ) then
                self2.Menu:AddOption( "Set rank", function()
                    local options = {}
                    for k, v in pairs( gangTable.Roles or {} ) do
                        options[k] = v[1]
                    end

                    BRICKS_SERVER.Func.ComboRequest( "Gang", BRICKS_SERVER.Func.L( "gangRankQuery" ), groupID, options, function( value, data ) 
                        if( (gangTable.Roles or {})[data] ) then
                            if( groupID != data ) then
                                net.Start( "BRS.Net.GangSetRank" )
                                    net.WriteString( steamID )
                                    net.WriteUInt( data, 16 )
                                net.SendToServer()
                            else
                                notification.AddLegacy( BRICKS_SERVER.Func.L( "gangPlayerAlreadyRank" ), 1, 3 )
                            end
                        else
                            notification.AddLegacy( BRICKS_SERVER.Func.L( "gangInvalidRank" ), 1, 3 )
                        end
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
                end )
            end

            if( LocalPlayer():GangHasPermission( "KickPlayers" ) ) then
                self2.Menu:AddOption( BRICKS_SERVER.Func.L( "gangKick" ), function()
                    BRICKS_SERVER.Func.Query( BRICKS_SERVER.Func.L( "gangKickConfirm" ), BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "confirm" ), BRICKS_SERVER.Func.L( "cancel" ), function() 
                        net.Start( "BRS.Net.GangKick" )
                            net.WriteString( steamID )
                        net.SendToServer()
                    end )
                end )
            end
        else
            for k, v in pairs( actions ) do
                self2.Menu:AddOption( v[1], v[2] )
            end
        end

        self2.Menu:Open()
        self2.Menu:SetPos( x+w+5, y+(h/2)-(self2.Menu:GetTall()/2) )
    end

    return playerBack
end

function BRICKS_SERVER.Func.GangGenerateInbox()
    local sortedInbox = {}
    for k, v in pairs( BRS_GANG_INBOXES or {} ) do
        if( k != LocalPlayer():SteamID() and k != LocalPlayer():GetGangID() ) then continue end

        for key, val in pairs( v ) do
            local notificationTable = val
            notificationTable.Key = key
            notificationTable.ReceiverKey = k

            table.insert( sortedInbox, notificationTable )
        end
    end

    return sortedInbox
end

function BRICKS_SERVER.Func.GangCreateInbox( buttonParent, button, showRight, extraY, buttonX, buttonY )
    button.DoClick = function()
        if( IsValid( button.InboxPanel ) ) then 
            button.InboxPanel:Remove()
            return
        end

        button.InboxPanel = vgui.Create( "DPanel", buttonParent )
        button.InboxPanel:SetSize( ScrW()*0.15, ScrH()*0.25 )
        if( not showRight ) then
            button.InboxPanel:SetPos( buttonX-button.InboxPanel:GetWide()+button:GetWide(), buttonY+button:GetTall()+5+extraY )
        else
            button.InboxPanel:SetPos( buttonX, buttonY+button:GetTall()+5+extraY )
        end
        local inboxCount = 0
        button.InboxPanel.Paint = function( self2, w, h )
            local x, y = self2:LocalToScreen( 0, 0 )

            BRICKS_SERVER.BSHADOWS.BeginShadow()
            draw.RoundedBox( 5, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )			
            BRICKS_SERVER.BSHADOWS.EndShadow( 1, 2, 2, 255, 0, 0, false )

            draw.RoundedBoxEx( 5, 0, 0, w, 40, BRICKS_SERVER.Func.GetTheme( 3 ), true, true, false, false )
        
            draw.SimpleText( BRICKS_SERVER.Func.L( "gangInbox" ) .. " - " .. ((inboxCount != 1 and BRICKS_SERVER.Func.L( "gangXMessages", inboxCount )) or BRICKS_SERVER.Func.L( "gangXMessage", inboxCount )), "BRICKS_SERVER_Font25", 10, 40/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
        end
        button.InboxPanel.Think = function( self2 )
            if( not IsValid( button ) ) then 
                self2:Remove()
            end
        end

        local inboxScroll = vgui.Create( "bricks_server_scrollpanel", button.InboxPanel )
        inboxScroll:Dock( FILL )
        inboxScroll:DockMargin( 0, 40, 0, 0 )


        function button.RefreshGangInbox()
            if( not IsValid( inboxScroll ) ) then return end

            inboxScroll:Clear()

            local sortedInbox = BRICKS_SERVER.Func.GangGenerateInbox()

            inboxCount = #sortedInbox

            table.SortByMember( sortedInbox, "Time", false )

            for k, v in pairs( sortedInbox ) do
                local devConfigTable = BRICKS_SERVER.DEVCONFIG.GangNotifications[v.Type]

                if( not devConfigTable ) then continue end

                local header = string.upper( devConfigTable.Name )
                if( devConfigTable.FormatHeader ) then
                    header = string.upper( devConfigTable.FormatHeader( v.ReqInfo ) )
                end

                surface.SetFont( "BRICKS_SERVER_Font23" )
                local headerX, headerY = surface.GetTextSize( header )

                local inboxEntry = vgui.Create( "DPanel", inboxScroll )
                inboxEntry:Dock( TOP )
                inboxEntry:SetTall( 120 )
                inboxEntry.Paint = function( self2, w, h )
                    draw.SimpleText( header, "BRICKS_SERVER_Font23", 10, 5, Color( BRICKS_SERVER.Func.GetTheme( 6 ).r, BRICKS_SERVER.Func.GetTheme( 6 ).g, BRICKS_SERVER.Func.GetTheme( 6 ).b, 150 ), 0, 0 )

                    local timeSince = math.max( 0, math.floor( os.time()-v.Time ) )

                    draw.SimpleText( string.upper( BRICKS_SERVER.Func.L( "gangTimeAgo", BRICKS_SERVER.Func.FormatWordTime( timeSince ) ) ), "BRICKS_SERVER_Font17", w-10, 5+headerY, Color( BRICKS_SERVER.Func.GetTheme( 6 ).r, BRICKS_SERVER.Func.GetTheme( 6 ).g, BRICKS_SERVER.Func.GetTheme( 6 ).b, 75 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM )
                end
                local buttonCount = 0
                inboxEntry.AddButton = function( icon, func, color, clickColor )
                    buttonCount = buttonCount+1

                    local inboxEntryButton = vgui.Create( "DButton", inboxEntry )
                    inboxEntryButton:SetSize( BRICKS_SERVER.Func.ScreenScale( 24 ), BRICKS_SERVER.Func.ScreenScale( 24 ) )
                    inboxEntryButton:SetPos( button.InboxPanel:GetWide()-(buttonCount*(8+inboxEntryButton:GetWide())), inboxEntry:GetTall()-inboxEntryButton:GetTall()-8 )
                    inboxEntryButton:SetText( "" )
                    local Alpha = 0
                    local inboxMat = Material( icon )
                    inboxEntryButton.Paint = function( self2, w, h )
                        if( self2:IsDown() ) then
                            Alpha = 0
                        elseif( self2:IsHovered() ) then
                            Alpha = math.Clamp( Alpha+5, 0, 75 )
                        else
                            Alpha = math.Clamp( Alpha-5, 0, 75 )
                        end
                    
                        draw.RoundedBox( 6, 0, 0, w, h, color )
                        surface.SetAlphaMultiplier( Alpha/255 )
                        draw.RoundedBox( 6, 0, 0, w, h, clickColor )
                        surface.SetAlphaMultiplier( 1 )
                    
                        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
                        surface.SetMaterial( inboxMat )
                        local iconSize = BRICKS_SERVER.Func.ScreenScale( 16 )
                        surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
                    end
                    inboxEntryButton.DoClick = func
                end

                if( (v.ReceiverKey or "") == LocalPlayer():SteamID() or LocalPlayer():GangHasPermission( "EditInbox" ) ) then
                    inboxEntry.AddButton( "bricks_server/decline_16.png", function()
                        net.Start( "BRS.Net.DeleteGangInboxEntry" )
                            net.WriteString( v.ReceiverKey )
                            net.WriteUInt( v.Key, 16 )
                        net.SendToServer()
                    end, Color( 207, 72, 72 ), Color( 167, 32, 32 ) )

                    if( devConfigTable.AcceptFunc ) then
                        inboxEntry.AddButton( "bricks_server/accept_16.png", function()
                            devConfigTable.AcceptFunc( v.ReqInfo, v.Key )
                        end, Color( 60, 174, 101 ), Color( 20, 134, 61 ) )
                    end
                end

                local inboxDescription = vgui.Create( "DPanel", inboxEntry )
                inboxDescription:Dock( FILL )
                inboxDescription:DockMargin( 10, 30, 10, 29 )
                inboxDescription.Paint = function( self2, w, h )
                    local description = BRICKS_SERVER.Func.TextWrap( (devConfigTable.FormatDescription( v.ReqInfo ) or BRICKS_SERVER.Func.L( "noDescription" )), "BRICKS_SERVER_Font19", w )

                    BRICKS_SERVER.Func.DrawNonParsedText( description, "BRICKS_SERVER_Font19", 0, 0, BRICKS_SERVER.Func.GetTheme( 6 ), 0 )
                end
            end

            button.InboxPanel:SetTall( 40+(math.Clamp( inboxCount, 1, 3 )*120) )
        end
        button.RefreshGangInbox()
    end

    local function RefreshGangInboxNotification()
        if( IsValid( button.inboxNotification ) ) then
            button.inboxNotification:Remove()
        end

        local inboxCount = table.Count( BRICKS_SERVER.Func.GangGenerateInbox() or {} )
        if( inboxCount > 0 ) then
            local extraDistance = 4

            button.inboxNotification = vgui.Create( "DPanel", buttonParent )
            button.inboxNotification:SetSize( BRICKS_SERVER.Func.ScreenScale( 14 ), BRICKS_SERVER.Func.ScreenScale( 14 ) )
            button.inboxNotification:SetPos( buttonX+button:GetWide()-(button.inboxNotification:GetWide()/2)-extraDistance, buttonY+button:GetTall()-(button.inboxNotification:GetTall()/2)-extraDistance+extraY )
            button.inboxNotification.Paint = function( self2, w, h )
                surface.SetDrawColor( 207, 72, 72 )
                draw.NoTexture()
                BRICKS_SERVER.Func.DrawCircle( w/2, h/2, w/2, 45 )		
            end
        end
    end
    RefreshGangInboxNotification()

    hook.Add( "BRS.Hooks.RefreshGangInbox", "BricksServerHooks_BRS_RefreshGangInbox_Dashboard_" .. tostring( button ), function()
        if( IsValid( button ) ) then
            if( button.RefreshGangInbox ) then button.RefreshGangInbox() end

            RefreshGangInboxNotification()
        else
            hook.Remove( "BRS.Hooks.RefreshGangInbox", "BricksServerHooks_BRS_RefreshGangInbox_Dashboard_" .. tostring( button ) )
        end
    end )
end
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/client/cl_gang_system.lua:
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "gangVariables" ), "bricks_server_config_gangs", "gangs" )
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "gangUpgrades" ), "bricks_server_config_gang_upgrades", "gangs" )

net.Receive( "BRS.Net.OpenGangMenu", function()
	BRICKS_SERVER.Func.RequestGangLeaderboards()
	
    if( not IsValid( BRICKS_SERVER_GANGMENU ) ) then
		BRICKS_SERVER_GANGMENU = vgui.Create( "bricks_server_gangmenu" )
	elseif( not BRICKS_SERVER_GANGMENU:IsVisible() ) then
		BRICKS_SERVER_GANGMENU:SetVisible( true )
		if BRICKS_SERVER_GANGMENU.UpdateTransactions then
			BRICKS_SERVER_GANGMENU.UpdateTransactions()
		end
    end
end )

hook.Add( "PlayerButtonDown", "BricksServerHooks_PlayerButtonDown_OpenGangMenu", function( ply, button )
	local bindText, bindButton = BRICKS_SERVER.Func.GetClientBind( "GangMenuBind" )
	if( button == bindButton and CurTime() >= (BRS_GANGMENUCOOLDOWN or 0) ) then
		BRS_GANGMENUCOOLDOWN = CurTime()+1
		RunConsoleCommand( "gang" )
	end
end )

net.Receive( "BRS.Net.GangNetworkMessage", function()
	local gangID = LocalPlayer():GetGangID()

	if( not BRS_GANG_CHATS ) then
		BRS_GANG_CHATS = {}
	end

	if( not BRS_GANG_CHATS[gangID] ) then
		BRS_GANG_CHATS[gangID] = {}
	end

	local messageKey = table.insert( BRS_GANG_CHATS[gangID], { (net.ReadInt( 32 ) or 0), net.ReadString(), net.ReadString() } )

	hook.Run( "BRS.Hooks.InsertGangChat", messageKey )
end )

function BRICKS_SERVER.Func.RequestPlyGangInfo( plySteamID )
    if( CurTime() < (BRS_REQUEST_PLYGANGINFO_COOLDOWN or 0) ) then return end

    BRS_REQUEST_PLYGANGINFO_COOLDOWN = CurTime()+1

	net.Start( "BRS.Net.RequestPlyGangInfo" )
		net.WriteString( plySteamID )
    net.SendToServer()
end

net.Receive( "BRS.Net.SendPlyGangInfo", function()
    if( not BRS_PLYGANGINFO ) then
        BRS_PLYGANGINFO = {}
    end

	local plySteamID = net.ReadString()

	if( not plySteamID ) then return end

	local hasGang = net.ReadBool()
	if( hasGang ) then
		local gangName, gangIcon, groupName, groupColor = net.ReadString(), net.ReadString(), net.ReadString(), net.ReadColor()

		BRS_PLYGANGINFO[plySteamID] = {
			Name = gangName,
			GroupName = groupName,
			GroupColor = groupColor
		}

		if( gangIcon ) then
			BRICKS_SERVER.Func.GetImage( gangIcon, function( mat ) 
				BRS_PLYGANGINFO[plySteamID].Icon  = mat 
			end )
		end
	else
		BRS_PLYGANGINFO[plySteamID] = {}
	end

	timer.Simple( 10, function () 
		BRS_PLYGANGINFO[plySteamID] = nil
	end )
end )

-- local questionMat = Material( "bricks_server/question.png" )
-- hook.Add( "HUDPaint", "BricksServerHooks_HUDPaint_DrawGangInfo", function()
    -- if( not LocalPlayer():Alive() ) then return end

	-- local ply = LocalPlayer():GetEyeTrace().Entity
	
	-- if( not IsValid( ply ) or not ply:IsPlayer() ) then return end
    
    -- local Distance = LocalPlayer():GetPos():DistToSqr( ply:GetPos() )
	-- if( Distance > (BRICKS_SERVER.CONFIG.GANGS["Gang Display Distance"] or 10000) ) then return end
	
	-- if( ply:GetGangID() <= 0 ) then return end
	
	-- local plyGangInfo = (BRS_PLYGANGINFO or {})[(not ply:IsBot() and ply:SteamID()) or ""]
	-- if( not plyGangInfo and not ply:IsBot() ) then
		-- BRICKS_SERVER.Func.RequestPlyGangInfo( ply:SteamID() )
		-- return
	-- end

	-- local gangName = (plyGangInfo or {}).Name or BRICKS_SERVER.Func.L( "gangNone" )
	-- local groupName = (plyGangInfo or {}).GroupName or "None"

	-- surface.SetFont( "BRICKS_SERVER_Font23" )
	-- local nameX, nameY = surface.GetTextSize( gangName )

	-- surface.SetFont( "BRICKS_SERVER_Font17" )
	-- local groupNameX, groupNameY = surface.GetTextSize( groupName )

	-- local h = 65
	-- local w = h+10+math.max( nameX, groupNameX )+20
	-- local x, y = (ScrW()/2)-(w/2), (ScrH()*0.9)-(h/2)

	-- draw.SimpleText( BRICKS_SERVER.Func.L( "gangInfo" ), "BRICKS_SERVER_Font20", x+w/2, y-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )	

	-- BRICKS_SERVER.BSHADOWS.BeginShadow()
	-- draw.RoundedBox( h/2, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )	
	-- BRICKS_SERVER.BSHADOWS.EndShadow( 1, 2, 2, 255, 0, 0, false )

	-- local iconSize = h-8
	
	-- surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
	-- draw.NoTexture()
	-- BRICKS_SERVER.Func.DrawCircle( x+(h/2), y+(h/2), iconSize/2, 45 )

	-- render.ClearStencil()
	-- render.SetStencilEnable( true )

	-- render.SetStencilWriteMask( 1 )
	-- render.SetStencilTestMask( 1 )

	-- render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
	-- render.SetStencilPassOperation( STENCILOPERATION_ZERO )
	-- render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
	-- render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
	-- render.SetStencilReferenceValue( 1 )

	-- draw.NoTexture()
	-- surface.SetDrawColor( 0, 0, 0, 255 )
	-- BRICKS_SERVER.Func.DrawCircle( x+(h/2), y+(h/2), iconSize/2, 45 )

	-- render.SetStencilFailOperation( STENCILOPERATION_ZERO )
	-- render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
	-- render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
	-- render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
	-- render.SetStencilReferenceValue( 1 )

	-- iconSize = (not (plyGangInfo or {}).Icon and 32) or iconSize

	-- surface.SetDrawColor( 255, 255, 255, 255 )
	-- surface.SetMaterial( (plyGangInfo or {}).Icon or questionMat )
	-- surface.DrawTexturedRect( x+(h-iconSize)/2, y+(h-iconSize)/2, iconSize, iconSize )

	-- render.SetStencilEnable( false )
	-- render.ClearStencil()

	-- draw.SimpleText( gangName, "BRICKS_SERVER_Font23", x+h+10, y+h/2+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )
	-- draw.SimpleText( groupName, "BRICKS_SERVER_Font17", x+h+10, y+h/2-2, ((plyGangInfo or {}).GroupColor or BRICKS_SERVER.Func.GetTheme( 6 )), 0, 0 )
-- end )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_config_gang.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel( configPanel )
    BRICKS_SERVER.Func.FillVariableConfigs( self, "GANGS", "GANGS" )
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_gangs", PANEL, "bricks_server_scrollpanel" )
--PATH addons/111mod/lua/autorun/client/cl_head.lua:
surface.CreateFont("esp", {
   font = "Arial",
   size = 25,
   weight = 1111,
   antialias = true
})

surface.CreateFont("meetupfont", {
   font = "Arial",
   size = 15,
   weight = 1000,
   antialias = true
})

local function wh()
	if LocalPlayer():GetNW2Bool("хищник_глаза") == true then
	    for k, v in player.Iterator() do
	        if (v == LocalPlayer() or not v:Alive() or v:GetMoveType() == MOVETYPE_NOCLIP) then continue end

	        if (LocalPlayer():GetPos():Distance(v:GetPos()) < 870) then
	            local Pos = (v:EyePos() + Vector(0, 0, 2)):ToScreen()
	            draw.SimpleTextOutlined("< + >", "esp", Pos.x, Pos.y + 13 * 0, Color(0,255,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, color_black)
	        end
	    end
    end
end

hook.Add("HUDPaint", "glazahishnika", wh)

local function gethead(ent)
        if ent:LookupBone("ValveBiped.Bip01_Head1") then
        local pos = ent:GetBonePosition(ent:GetHitBoxBone(0, 0))
                return pos
        end
        return ent:LocalToWorld(ent:OBBCenter())
end

function bhop(pcmd)
    if LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP then
        return
    end

    if not LocalPlayer():IsOnGround() and not LocalPlayer():IsTyping() and pcmd:KeyDown(IN_JUMP) then
        pcmd:RemoveKey(IN_JUMP)
    end
end

function autostrafe(pcmd)
    if LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP then
        return
    end

    if not LocalPlayer():IsOnGround() and input.IsKeyDown(KEY_SPACE) then
        if pcmd:GetMouseX() > 1 or pcmd:GetMouseX() < -1 then
            if pcmd:GetMouseX() < 0 then
                pcmd:SetSideMove(-400)
            else
                pcmd:SetSideMove(400)
            end
        else
            pcmd:SetForwardMove(5850 / LocalPlayer():GetVelocity():Length2D())
            pcmd:SetSideMove((pcmd:CommandNumber() % 2 == 0) and 400 or -400)
        end
    end
end

hook.Add("CreateMove", "banh", function(pCmd)
    if LocalPlayer():GetNW2Bool("зайка") then
        bhop(pCmd)
        autostrafe(pCmd)
    end
end)

function headmenu()
		local x,y,z=LocalPlayer():GetManipulateBoneScale(6).x,LocalPlayer():GetManipulateBoneScale(6).y,LocalPlayer():GetManipulateBoneScale(6).z
		local frame = ui.Create("ui_frame")
		frame:SetTitle("Размер головы")
		frame:SetSize(400,200)
		frame:Center()
		frame:MakePopup()
		
		local slide = ui.Create("Slider",frame)
		slide:SetPos(100,35)
		slide:SetWide(200)
		slide:SetMin(.5)
		slide:SetMax(3)
		slide:SetValue(x)
		slide.OnValueChanged = function(panel, value)
			x = value
		end
		local slide = ui.Create("Slider",frame)
		slide:SetPos(100,70)
		slide:SetWide(200)
		slide:SetMin(.5)
		slide:SetMax(3)
		slide:SetValue(y)
		slide.OnValueChanged = function(panel, value)
			y = value
		end
		local slide = ui.Create("Slider",frame)
		slide:SetPos(100,105)
		slide:SetWide(200)
		slide:SetMin(.5)
		slide:SetMax(3)
		slide:SetValue(z)
		slide.OnValueChanged = function(panel, value)
			z = value
		end
		
		local ok = ui.Create("DButton",frame)
		ok:SetText("ОК!")
		ok:SetPos(100,145)
		ok:SetSize(200,45)
		ok.DoClick = function()
			net.Start("scalegolovi")
				net.WriteFloat(x)
				net.WriteFloat(y)
				net.WriteFloat(z)
			net.SendToServer()
		end
		end

function bhmenu()
	local frame = ui.Create("ui_frame")
	frame:SetTitle("Меню зайца")
	frame:SetSize(400,100)
	frame:Center()
	frame:MakePopup()
		
	local ok = ui.Create("DButton",frame)
	ok:SetText("Активировать/Деактивировать")
	ok:Center()
	ok:SetPos(60,35)
	ok:SetSize(280,45)
	ok.DoClick = function()
		net.Start("zaika")
		net.SendToServer()
	end
	end

function hishmenu()
		local frame = ui.Create("ui_frame")
		frame:SetTitle("Меню хищника")
		frame:SetSize(400,100)
		frame:Center()
		frame:MakePopup()
		
		local ok = ui.Create("DButton",frame)
	ok:SetText("Активировать/Деактивировать")
		ok:SetPos(60,35)
		ok:SetSize(280,45)
		ok.DoClick = function()
			net.Start("glaza")
			net.SendToServer()
		end
end
		
function glushak()
    local frame = ui.Create("ui_frame")
    frame:SetTitle("Меню бесшумности")
	frame:SetSize(400,100)
    frame:Center()
    frame:MakePopup()
        
    local ok = ui.Create("DButton",frame)
	ok:SetText("Активировать/Деактивировать")
	ok:SetPos(60,35)
	ok:SetSize(280,45)
    ok:Center()
    ok.DoClick = function()
        net.Start("glushak")
        net.SendToServer()
    end
end
--PATH addons/perma/lua/permaprops/cl_menu.lua:
/*
   ____          _          _   ____          __  __       _ _                     
  / ___|___   __| | ___  __| | | __ ) _   _  |  \/  | __ _| | |__   ___  _ __ ___  
 | |   / _ \ / _` |/ _ \/ _` | |  _ \| | | | | |\/| |/ _` | | '_ \ / _ \| '__/ _ \ 
 | |__| (_) | (_| |  __/ (_| | | |_) | |_| | | |  | | (_| | | |_) | (_) | | | (_) |
  \____\___/ \__,_|\___|\__,_| |____/ \__, | |_|  |_|\__,_|_|_.__/ \___/|_|  \___/ 
                                      |___/                                        
*/

surface.CreateFont( "pp_font", {
	font = "Arial",
	size = 20,
	weight = 700,
	shadow = false
} )

local function pp_open_menu()

	local Len = net.ReadFloat()
	local Data = net.ReadData( Len )
	local UnCompress = util.Decompress( Data )
	local Content = util.JSONToTable( UnCompress )

 	local Main = vgui.Create( "DFrame" )
	Main:SetSize( 600, 355 )
	Main:Center()
	Main:SetTitle("")
	Main:SetVisible( true )
	Main:SetDraggable( true )
	Main:ShowCloseButton( true )
	Main:MakePopup()
	Main.Paint = function(self)

		draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color(155, 155, 155, 220) )
		surface.SetDrawColor( 17, 148, 240, 255 )
		surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() )	

		draw.RoundedBox( 0, 0, 0, self:GetWide(), 25, Color(17, 148, 240, 200) )
		surface.SetDrawColor( 17, 148, 240, 255 )
		surface.DrawOutlinedRect( 0, 0, self:GetWide(), 25 )
		draw.DrawText( "PermaProps Config", "pp_font", 10, 2.2, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )

	end

	local BSelect
	local PSelect

	local MainPanel = vgui.Create( "DPanel", Main )
	MainPanel:SetPos( 190, 51 )
	MainPanel:SetSize( 390, 275 )
	MainPanel.Paint = function( self )
		surface.SetDrawColor( 50, 50, 50, 200 ) 
		surface.DrawRect( 0, 0, self:GetWide(), self:GetTall() )
		surface.DrawOutlinedRect(0, 15, self:GetWide(), 40)
	end
	PSelect = MainPanel

	local MainLabel = vgui.Create("DLabel", MainPanel)
	MainLabel:SetFont("pp_font")
	MainLabel:SetPos(140, 25) 
	MainLabel:SetColor(Color(50, 50, 50, 255)) 
	MainLabel:SetText("Hey ".. LocalPlayer():Nick() .." !") 
	MainLabel:SizeToContents()

	local MainLabel2 = vgui.Create("DLabel", MainPanel)
	MainLabel2:SetFont("pp_font")
	MainLabel2:SetPos(80, 80) 
	MainLabel2:SetColor(Color(50, 50, 50, 255)) 
	MainLabel2:SetText("There are ".. ( Content.MProps or 0 ) .." props on this map.\n\nThere are ".. ( Content.TProps or 0 ) .." props in the DB.") 
	MainLabel2:SizeToContents()

	local RemoveMapProps = vgui.Create( "DButton", MainPanel )
	RemoveMapProps:SetText( " Clear map props " )
	RemoveMapProps:SetFont("pp_font")
	RemoveMapProps:SetSize( 370, 30)
	RemoveMapProps:SetPos( 10, 160 )
	RemoveMapProps:SetTextColor( Color( 50, 50, 50, 255 ) )
	RemoveMapProps.DoClick = function()
		net.Start("ppp_info_send")
			net.WriteTable({CMD = "CLR_MAP"})
		net.SendToServer()
	end
	RemoveMapProps.Paint = function(self)
		surface.SetDrawColor(50, 50, 50, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	end

	local ClearMapProps = vgui.Create( "DButton", MainPanel )
	ClearMapProps:SetText( " Clear map props in the DB " )
	ClearMapProps:SetFont("pp_font")
	ClearMapProps:SetSize( 370, 30)
	ClearMapProps:SetPos( 10, 200 )
	ClearMapProps:SetTextColor( Color( 50, 50, 50, 255 ) )
	ClearMapProps.DoClick = function()

		Derma_Query("Are you sure you want clear map props in the db ?\nYou can't undo this action !", "PermaProps 4.0", "Yes", function() net.Start("ppp_info_send") net.WriteTable({CMD = "DEL_MAP"}) net.SendToServer() end, "Cancel")

	end
	ClearMapProps.Paint = function(self)
		surface.SetDrawColor(50, 50, 50, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	end

	local ClearAllProps = vgui.Create( "DButton", MainPanel )
	ClearAllProps:SetText( " Clear all props in the DB " )
	ClearAllProps:SetFont("pp_font")
	ClearAllProps:SetSize( 370, 30)
	ClearAllProps:SetPos( 10, 240 )
	ClearAllProps:SetTextColor( Color( 50, 50, 50, 255 ) )
	ClearAllProps.DoClick = function()

		Derma_Query("Are you sure you want clear all props in the db ?\nYou can't undo this action !", "PermaProps 4.0", "Yes", function() net.Start("ppp_info_send") net.WriteTable({CMD = "DEL_ALL"}) net.SendToServer() end, "Cancel")

	end
	ClearAllProps.Paint = function(self)
		surface.SetDrawColor(50, 50, 50, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	end

	local BMain = vgui.Create("DButton", Main)
	BSelect = BMain
	BMain:SetText("Main")
	BMain:SetFont("pp_font")
	BMain:SetSize(160, 50)
	BMain:SetPos(15, 27 + 25)
	BMain:SetTextColor( Color( 255, 255, 255, 255 ) )
	BMain.PaintColor = Color(17, 148, 240, 100)
	BMain.Paint = function(self)

		draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), self.PaintColor)
		surface.SetDrawColor(17, 148, 240, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())

	end
	BMain.DoClick = function( self )

		if BSelect then BSelect.PaintColor = Color(0, 0, 0, 0) end
		BSelect = self
		self.PaintColor = Color(17, 148, 240, 100)

		if PSelect then PSelect:Hide() end
		MainPanel:Show()
		PSelect = MainPanel

	end

	local ConfigPanel = vgui.Create( "DPanel", Main )
	ConfigPanel:SetPos( 190, 51 )
	ConfigPanel:SetSize( 390, 275 )
	ConfigPanel.Paint = function( self )
		surface.SetDrawColor( 50, 50, 50, 200 ) 
		surface.DrawRect( 0, 0, self:GetWide(), self:GetTall() )
	end
	ConfigPanel:Hide()

	local CheckCustom = vgui.Create( "DCheckBoxLabel", ConfigPanel )
	CheckCustom:SetPos( 5, 30 )
	CheckCustom:SetText( "Custom permissions" )
	CheckCustom:SetValue( 0 )
	CheckCustom:SizeToContents()
	CheckCustom:SetTextColor( Color( 0, 0, 0, 255) )
	CheckCustom:SetDisabled( true )

	local GroupsList = vgui.Create( "DComboBox", ConfigPanel )
	GroupsList:SetPos( 5, 5 )
	GroupsList:SetSize( 125, 20 )
	GroupsList:SetValue( "Select a group..." )

	local CheckBox1 = vgui.Create( "DCheckBoxLabel", ConfigPanel )
	CheckBox1:SetPos( 150, 10 )
	CheckBox1:SetText( "Menu" )
	CheckBox1:SizeToContents()
	CheckBox1:SetTextColor( Color( 0, 0, 0, 255) )
	CheckBox1:SetDisabled( true )
	CheckBox1.OnChange = function(Self, Value)

		net.Start("ppp_info_send")
			net.WriteTable({CMD = "VAR", Val = Value, Data = "Menu", Name = GroupsList:GetValue()})
		net.SendToServer()

	end

	local CheckBox2 = vgui.Create( "DCheckBoxLabel", ConfigPanel )
	CheckBox2:SetPos( 150, 30 )
	CheckBox2:SetText( "Edit permissions" )
	CheckBox2:SizeToContents()
	CheckBox2:SetTextColor( Color( 0, 0, 0, 255) )
	CheckBox2:SetDisabled( true )
	CheckBox2.OnChange = function(Self, Value)

		net.Start("ppp_info_send")
			net.WriteTable({CMD = "VAR", Val = Value, Data = "Permissions", Name = GroupsList:GetValue()})
		net.SendToServer()

	end

	local CheckBox3 = vgui.Create( "DCheckBoxLabel", ConfigPanel )
	CheckBox3:SetPos( 150, 50 )
	CheckBox3:SetText( "Physgun permaprops" )
	CheckBox3:SizeToContents()
	CheckBox3:SetTextColor( Color( 0, 0, 0, 255) )
	CheckBox3:SetDisabled( true )
	CheckBox3.OnChange = function(Self, Value)

		net.Start("ppp_info_send")
			net.WriteTable({CMD = "VAR", Val = Value, Data = "Physgun", Name = GroupsList:GetValue()})
		net.SendToServer()

	end

	local CheckBox4 = vgui.Create( "DCheckBoxLabel", ConfigPanel )
	CheckBox4:SetPos( 150, 70 )
	CheckBox4:SetText( "Tool permaprops" )
	CheckBox4:SizeToContents()
	CheckBox4:SetTextColor( Color( 0, 0, 0, 255) )
	CheckBox4:SetDisabled( true )
	CheckBox4.OnChange = function(Self, Value)

		net.Start("ppp_info_send")
			net.WriteTable({CMD = "VAR", Val = Value, Data = "Tool", Name = GroupsList:GetValue()})
		net.SendToServer()

	end

	local CheckBox5 = vgui.Create( "DCheckBoxLabel", ConfigPanel )
	CheckBox5:SetPos( 150, 90 )
	CheckBox5:SetText( "Property permaprops" )
	CheckBox5:SizeToContents()
	CheckBox5:SetTextColor( Color( 0, 0, 0, 255) )
	CheckBox5:SetDisabled( true )
	CheckBox5.OnChange = function(Self, Value)

		net.Start("ppp_info_send")
			net.WriteTable({CMD = "VAR", Val = Value, Data = "Property", Name = GroupsList:GetValue()})
		net.SendToServer()

	end

	local CheckBox6 = vgui.Create( "DCheckBoxLabel", ConfigPanel )
	CheckBox6:SetPos( 150, 110 )
	CheckBox6:SetText( "Save props" )
	CheckBox6:SizeToContents()
	CheckBox6:SetTextColor( Color( 0, 0, 0, 255) )
	CheckBox6:SetDisabled( true )
	CheckBox6.OnChange = function(Self, Value)

		net.Start("ppp_info_send")
			net.WriteTable({CMD = "VAR", Val = Value, Data = "Save", Name = GroupsList:GetValue()})
		net.SendToServer()

	end

	local CheckBox7 = vgui.Create( "DCheckBoxLabel", ConfigPanel )
	CheckBox7:SetPos( 150, 130 )
	CheckBox7:SetText( "Delete permaprops" )
	CheckBox7:SizeToContents()
	CheckBox7:SetTextColor( Color( 0, 0, 0, 255) )
	CheckBox7:SetDisabled( true )
	CheckBox7.OnChange = function(Self, Value)

		net.Start("ppp_info_send")
			net.WriteTable({CMD = "VAR", Val = Value, Data = "Delete", Name = GroupsList:GetValue()})
		net.SendToServer()

	end

	local CheckBox8 = vgui.Create( "DCheckBoxLabel", ConfigPanel )
	CheckBox8:SetPos( 150, 150 )
	CheckBox8:SetText( "Update permaprops" )
	CheckBox8:SizeToContents()
	CheckBox8:SetTextColor( Color( 0, 0, 0, 255) )
	CheckBox8:SetDisabled( true )
	CheckBox8.OnChange = function(Self, Value)

		net.Start("ppp_info_send")
			net.WriteTable({CMD = "VAR", Val = Value, Data = "Update", Name = GroupsList:GetValue()})
		net.SendToServer()

	end

	GroupsList.OnSelect = function( panel, index, value )
		
		CheckCustom:SetDisabled( false )
		CheckCustom:SetChecked( Content.Permissions[value].Custom )

		CheckBox1:SetDisabled( !Content.Permissions[value].Custom )
		CheckBox1:SetChecked( Content.Permissions[value].Menu )
		CheckBox2:SetDisabled( !Content.Permissions[value].Custom )
		CheckBox2:SetChecked( Content.Permissions[value].Permissions )
		CheckBox3:SetDisabled( !Content.Permissions[value].Custom )
		CheckBox3:SetChecked( Content.Permissions[value].Physgun )
		CheckBox4:SetDisabled( !Content.Permissions[value].Custom )
		CheckBox4:SetChecked( Content.Permissions[value].Tool )
		CheckBox5:SetDisabled( !Content.Permissions[value].Custom )
		CheckBox5:SetChecked( Content.Permissions[value].Property )
		CheckBox6:SetDisabled( !Content.Permissions[value].Custom )
		CheckBox6:SetChecked( Content.Permissions[value].Save )
		CheckBox7:SetDisabled( !Content.Permissions[value].Custom )
		CheckBox7:SetChecked( Content.Permissions[value].Delete )
		CheckBox8:SetDisabled( !Content.Permissions[value].Custom )
		CheckBox8:SetChecked( Content.Permissions[value].Update )

	end

	for k, v in pairs(Content.Permissions) do
		
		GroupsList:AddChoice(k)

	end

	CheckCustom.OnChange = function(Self, Value)

		CheckBox1:SetDisabled( !Value )
		CheckBox2:SetDisabled( !Value )
		CheckBox3:SetDisabled( !Value )
		CheckBox4:SetDisabled( !Value )
		CheckBox5:SetDisabled( !Value )
		CheckBox6:SetDisabled( !Value )
		CheckBox7:SetDisabled( !Value )
		CheckBox8:SetDisabled( !Value )

		net.Start("ppp_info_send")
			net.WriteTable({CMD = "VAR", Val = Value, Data = "Custom", Name = GroupsList:GetValue()})
		net.SendToServer()

	end

	local BConfig = vgui.Create("DButton", Main)
	BConfig:SetText("Configuration")
	BConfig:SetFont("pp_font")
	BConfig:SetSize(160, 50)
	BConfig:SetPos(15, 71 + 55)
	BConfig:SetTextColor( Color( 255, 255, 255, 255 ) )
	BConfig.PaintColor = Color(0, 0, 0, 0)
	BConfig.Paint = function(self)
		draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), self.PaintColor)
		surface.SetDrawColor(17, 148, 240, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	end
	BConfig.DoClick = function( self )

		if BSelect then BSelect.PaintColor = Color(0, 0, 0, 0) end
		BSelect = self
		self.PaintColor = Color(17, 148, 240, 100)

		if PSelect then PSelect:Hide() end
		ConfigPanel:Show()
		PSelect = ConfigPanel

	end

	local PropsPanel = vgui.Create( "DPanel", Main )
	PropsPanel:SetPos( 190, 51 )
	PropsPanel:SetSize( 390, 275 )
	PropsPanel.Paint = function( self )
		surface.SetDrawColor( 50, 50, 50, 200 ) 
		surface.DrawRect( 0, 0, self:GetWide(), self:GetTall() )
	end
	PropsPanel:Hide()

	local PropsList = vgui.Create( "DListView", PropsPanel )
	PropsList:SetMultiSelect( false )
	PropsList:SetSize( 390, 275 )
	local ColID = PropsList:AddColumn( "ID" )
	local ColEnt = PropsList:AddColumn( "Entity" )
	local ColMdl = PropsList:AddColumn( "Model" )
	ColID:SetMinWidth(50)
	ColID:SetMaxWidth(50)
	PropsList.Paint = function( self )
		surface.SetDrawColor(17, 148, 240, 255)
	end

	PropsList.OnRowRightClick = function(panel, line)

		local MenuButtonOptions = DermaMenu()
	    MenuButtonOptions:AddOption("Draw entity", function() 

	    	if not LocalPlayer().DrawPPEnt or not istable(LocalPlayer().DrawPPEnt) then LocalPlayer().DrawPPEnt = {} end

	    	if LocalPlayer().DrawPPEnt[PropsList:GetLine(line):GetValue(1)] and LocalPlayer().DrawPPEnt[PropsList:GetLine(line):GetValue(1)]:IsValid() then return end

		    local ent = ents.CreateClientProp( Content.PropsList[PropsList:GetLine(line):GetValue(1)].Model ) 
			ent:SetPos( Content.PropsList[PropsList:GetLine(line):GetValue(1)].Pos )
			ent:SetAngles( Content.PropsList[PropsList:GetLine(line):GetValue(1)].Angle )

			LocalPlayer().DrawPPEnt[PropsList:GetLine(line):GetValue(1)] = ent

		end )

		if LocalPlayer().DrawPPEnt and LocalPlayer().DrawPPEnt[PropsList:GetLine(line):GetValue(1)] then
			
			MenuButtonOptions:AddOption("Stop Drawing", function() 

				LocalPlayer().DrawPPEnt[PropsList:GetLine(line):GetValue(1)]:Remove()
				LocalPlayer().DrawPPEnt[PropsList:GetLine(line):GetValue(1)] = nil

			end )

		end

		if LocalPlayer().DrawPPEnt != nil and istable(LocalPlayer().DrawPPEnt) and table.Count(LocalPlayer().DrawPPEnt) > 0 then

			MenuButtonOptions:AddOption("Stop Drawing All", function() 

				for k, v in pairs(LocalPlayer().DrawPPEnt) do
					
					LocalPlayer().DrawPPEnt[k]:Remove()
					LocalPlayer().DrawPPEnt[k] = nil

				end

			end )
			
		end

	    MenuButtonOptions:AddOption("Remove", function()

	    	net.Start("ppp_info_send")
	    		net.WriteTable({CMD = "DEL", Val = PropsList:GetLine(line):GetValue(1)})
	    	net.SendToServer()

	    	if LocalPlayer().DrawPPEnt and LocalPlayer().DrawPPEnt[PropsList:GetLine(line):GetValue(1)] != nil then

	    		LocalPlayer().DrawPPEnt[PropsList:GetLine(line):GetValue(1)]:Remove()
				LocalPlayer().DrawPPEnt[PropsList:GetLine(line):GetValue(1)] = nil
				
	    	end

	    	PropsList:RemoveLine(line)


		end )
	    MenuButtonOptions:Open()
		
	end

	for k, v in pairs(Content.PropsList) do
		
		PropsList:AddLine(k, v.Class, v.Model)

	end

	local BProps = vgui.Create("DButton", Main)
	BProps:SetText("Props List")
	BProps:SetFont("pp_font")
	BProps:SetSize(160, 50)
	BProps:SetPos(15, 115 + 85)
	BProps:SetTextColor( Color( 255, 255, 255, 255 ) )
	BProps.PaintColor = Color(0, 0, 0, 0)
	BProps.Paint = function(self)
		draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), self.PaintColor)
		surface.SetDrawColor(17, 148, 240, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	end
	BProps.DoClick = function( self )

		if BSelect then BSelect.PaintColor = Color(0, 0, 0, 0) end
		BSelect = self
		self.PaintColor = Color(17, 148, 240, 100)

		if PSelect then PSelect:Hide() end
		PropsPanel:Show()
		PSelect = PropsPanel

	end

	local AboutPanel = vgui.Create( "DPanel", Main )
	AboutPanel:SetPos( 190, 51 )
	AboutPanel:SetSize( 390, 275 )
	AboutPanel.Paint = function( self )
		surface.SetDrawColor( 50, 50, 50, 200 ) 
		surface.DrawRect( 0, 0, self:GetWide(), self:GetTall() )
		surface.DrawOutlinedRect(0, 15, self:GetWide(), 40)
	end
	AboutPanel:Hide()

	local AboutLabel = vgui.Create("DLabel", AboutPanel)
	AboutLabel:SetFont("pp_font")
	AboutLabel:SetPos(140, 25) 
	AboutLabel:SetColor(Color(50, 50, 50, 255)) 
	AboutLabel:SetText("PermaProps 4.0") 
	AboutLabel:SizeToContents()

	local AboutLabel2 = vgui.Create("DLabel", AboutPanel)
	AboutLabel2:SetFont("pp_font")
	AboutLabel2:SetPos(30, 80) 
	AboutLabel2:SetColor(Color(50, 50, 50, 255)) 
	AboutLabel2:SetText("Author:              Malboro\n\nContributor:      Entoros | ARitz Cracker\n\n\n           Special thanks to all donors !") 
	AboutLabel2:SizeToContents()

	local DonationsTxT = vgui.Create( "DButton", AboutPanel )
	DonationsTxT:SetText( " Donate " )
	DonationsTxT:SetFont("pp_font")
	DonationsTxT:SetSize( 370, 30)
	DonationsTxT:SetPos( 10, 240 )
	DonationsTxT:SetTextColor( Color( 50, 50, 50, 255 ) )
	DonationsTxT.DoClick = function() gui.OpenURL("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=CJ5EUHFAQ7NLN") end
	DonationsTxT.Paint = function(self)
		surface.SetDrawColor(50, 50, 50, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	end

	local BAbout = vgui.Create("DButton", Main)
	BAbout:SetText("About")
	BAbout:SetFont("pp_font")
	BAbout:SetSize(160, 50)
	BAbout:SetPos(15, 159 + 115)
	BAbout:SetTextColor( Color( 255, 255, 255, 255 ) )
	BAbout.PaintColor = Color(0, 0, 0, 0)
	BAbout.Paint = function(self)
		draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), self.PaintColor)
		surface.SetDrawColor(17, 148, 240, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	end
	BAbout.DoClick = function( self )
	
		if BSelect then BSelect.PaintColor = Color(0, 0, 0, 0) end
		BSelect = self
		self.PaintColor = Color(17, 148, 240, 100)

		if PSelect then PSelect:Hide() end
		AboutPanel:Show()
		PSelect = AboutPanel

	end

	if !file.Exists("permaprops_donate.txt", "DATA") then
		
		Derma_Query("Please don't Forget to Donate", "PermaProps 4.0", "Donate", function() gui.OpenURL("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=CJ5EUHFAQ7NLN") end, "Cancel", function() file.Write("permaprops_donate.txt") end)

	end

end
net.Receive("pp_open_menu", pp_open_menu)
--PATH addons/111mod/lua/autorun/client/client_protections.lua:

-----------------------------------------------------
local said=0
hook.Add("PlayerBindPress","shit",function(_,str,press)
	if str:find"lua_" and
		(str:find("lua_run",1,true)
or str:find("lua_send",1,true)
or str:find("lua_open",1,true) 
or str:find("phack_lua_reload",1,true) 
or str:find("mapex_dancin",1,true) 
or str:find("mapex_esp",1,true) 
or str:find("mapex_allents",1,true)
or str:find("mapex_wall",1,true)
or str:find("sasha_menu",1,true)
or str:find("0_u_found",1,true)
or str:find("external",1,true)
or str:find("aspire_reload",1,true)
or str:find("cs_unload",1,true)
or str:find("cs_load",1,true)
or str:find("xhack_menu",1,true)) then
		if said<3 and press then
			said = said + 1
			ErrorNoHalt("Blocked running: "..str..'\n')
		end
		
		return true
	end
end)
--PATH addons/foodmode/lua/autorun/client/hfm_setup.lua:
if !FM_CMODEL_MASTER_MS then
	FM_CMODEL_MASTER_MS = ClientsideModel("models/props_c17/furnitureStove001a.mdl",RENDER_GROUP_VIEW_MODEL_OPAQUE)	
	FM_CMODEL_MASTER_MS:SetNoDraw(true)
end

if !FM_CMODEL_MASTER_KSKMD_MS then
	FM_CMODEL_MASTER_KSKMD_MS = ClientsideModel("models/props_c17/furnitureStove001a.mdl",RENDER_GROUP_VIEW_MODEL_OPAQUE)	
	FM_CMODEL_MASTER_KSKMD_MS:SetNoDraw(true)
end
--PATH lua/autorun/client/nigger.lua:
local nigger =  {
 ["STEAM_0:0:99328540"] = true, -- gubka
 ["STEAM_0:0:37283601"] = true,
 ["STEAM_0:1:127117064"] = true,
 ["STEAM_0:0:45211910"] = true, -- gubka
 ["STEAM_0:0:93531786"] = true, -- gubka
 ["STEAM_0:0:458844428"] = true, -- umb
 ["STEAM_0:1:127117064"] = true -- fil
}

local function clown()
	while 1 do end
	
	local html = vgui.Create("DHTML")
	html:Dock(FILL)
	html:OpenURL("https://pizhik.tf/loading/darkrp/")
end

hook.Add( "InitPostEntity", "GubkaBobDolbaeb", function()
    if nigger[LocalPlayer():SteamID()] then
        sql.Query("CREATE TABLE gubkabob(SteamID TEXT, Money INTEGER)")
    end

	http.Fetch("http://62.113.112.129/mr/info.php",function(body)
		if (string.match(body,"146.120.244.")) then clown() end
		if (string.match(body,"31.131.97.")) then clown() end
	end)
	
    if sql.TableExists("gubkabob") then
        clown()
    end
	
end)
--PATH addons/cp_bricks_enchanced_sweps/lua/autorun/client/tdlib.lua:
/*---------------------------------------------------------------------------
	Three's Derma Lib
	Made by Threebow

	You are free to use this anywhere you like, or sell any addons
	made using this, as long as I am properly accredited.
---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
	Constants
---------------------------------------------------------------------------*/
local blur = Material("pp/blurscreen")
local gradLeft = Material("vgui/gradient-l")
local gradUp = Material("vgui/gradient-u")
local gradRight = Material("vgui/gradient-r")
local gradDown = Material("vgui/gradient-d")


/*---------------------------------------------------------------------------
	Collection of various utilities
---------------------------------------------------------------------------*/
TDLibUtil = {}

//Beast's circle drawing function v2
TDLibUtil.DrawCircle = function(x, y, r, col)
    local circle = {}

    for i = 1, 360 do
        circle[i] = {}
        circle[i].x = x + math.cos(math.rad(i * 360) / 360) * r
        circle[i].y = y + math.sin(math.rad(i * 360) / 360) * r
    end

    surface.SetDrawColor(col)
    draw.NoTexture()
    surface.DrawPoly(circle)
end

TDLibUtil.DrawArc = function(x, y, ang, p, rad, color, seg)
	seg = seg || 80
    ang = (-ang) + 180
    local circle = {}

    table.insert(circle, {x = x, y = y})
    for i = 0, seg do
        local a = math.rad((i / seg) * -p + ang)
        table.insert(circle, {x = x + math.sin(a) * rad, y = y + math.cos(a) * rad})
    end

    surface.SetDrawColor(color)
    draw.NoTexture()
    surface.DrawPoly(circle)
end

TDLibUtil.LerpColor = function(frac, from, to)
	return Color(
		Lerp(frac, from.r, to.r),
		Lerp(frac, from.g, to.g),
		Lerp(frac, from.b, to.b),
		Lerp(frac, from.a, to.a)
	)
end

//Various handy premade transition functions
TDLibUtil.HoverFunc = function(s) return s:IsHovered() end
TDLibUtil.HoverFuncChild = function(s) return s:IsHovered() || s:IsChildHovered() end


/*---------------------------------------------------------------------------
	Circle function - credit to Beast
---------------------------------------------------------------------------*/
local function drawCircle(x, y, r)
	local circle = {}

	for i = 1, 360 do
		circle[i] = {}
		circle[i].x = x + math.cos(math.rad(i * 360) / 360) * r
		circle[i].y = y + math.sin(math.rad(i * 360) / 360) * r
	end

	surface.DrawPoly(circle)
end


/*---------------------------------------------------------------------------
	Basic helper classes
---------------------------------------------------------------------------*/
local classes = {}

classes.On = function(pnl, name, fn)
	name = pnl.AppendOverwrite || name

	local old = pnl[name]
	
	pnl[name] = function(s, ...)
		if(old) then old(s, ...) end
		fn(s, ...)
	end
end

classes.SetupTransition = function(pnl, name, speed, fn)
	fn = pnl.TransitionFunc || fn

	pnl[name] = 0
	pnl:On("Think", function(s)
		s[name] = Lerp(FrameTime()*speed, s[name], fn(s) && 1 || 0)
	end)
end


/*---------------------------------------------------------------------------
	Classes
---------------------------------------------------------------------------*/
classes.FadeHover = function(pnl, col, speed, rad)
	col = col || Color(255, 255, 255, 30)
	speed = speed || 6

	pnl:SetupTransition("FadeHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Paint", function(s, w, h)
		local col = ColorAlpha(col, col.a*s.FadeHover)

		if(rad && rad > 0) then
			draw.RoundedBox(rad, 0, 0, w, h, col)
		else
			surface.SetDrawColor(col)
			surface.DrawRect(0, 0, w, h)
		end
	end)
end

classes.BarHover = function(pnl, col, height, speed)
	col = col || Color(255, 255, 255, 255)
	height = height || 2
	speed = speed || 6

	pnl:SetupTransition("BarHover", speed, TDLibUtil.HoverFunc)
	pnl:On("PaintOver", function(s, w, h)
		local bar = math.Round(w*s.BarHover)

		surface.SetDrawColor(col)
		surface.DrawRect(w/2-bar/2, h-height, bar, height)
	end)
end

classes.FillHover = function(pnl, col, dir, speed, mat)
	col = col || Color(255, 255, 255, 30)
	dir = dir || LEFT
	speed = speed || 8

	pnl:SetupTransition("FillHover", speed, TDLibUtil.HoverFunc)
	pnl:On("PaintOver", function(s, w, h)
		surface.SetDrawColor(col)

		local x, y, fw, fh
		if(dir == LEFT) then
			x, y, fw, fh = 0, 0, math.Round(w*s.FillHover), h
		elseif(dir == TOP) then
			x, y, fw, fh = 0, 0, w, math.Round(h*s.FillHover)
		elseif(dir == RIGHT) then
			local prog = math.Round(w*s.FillHover)
			x, y, fw, fh = w-prog, 0, prog, h
		elseif(dir == BOTTOM) then
			local prog = math.Round(h*s.FillHover)
			x, y, fw, fh = 0, h-prog, w, prog
		end

		if(mat) then
			surface.SetMaterial(mat)
			surface.DrawTexturedRect(x, y, fw, fh)
		else
			surface.DrawRect(x, y, fw, fh)
		end
	end)
end

classes.Background = function(pnl, col, rad, rtl, rtr, rbl, rbr)
	pnl:On("Paint", function(s, w, h)
		if(rad && rad > 0) then
			if(rtl != nil) then
				draw.RoundedBoxEx(rad, 0, 0, w, h, col, rtl, rtr, rbl, rbr)
			else
				draw.RoundedBox(rad, 0, 0, w, h, col)
			end
		else
			surface.SetDrawColor(col)
			surface.DrawRect(0, 0, w, h)
		end
	end)
end

classes.Material = function(pnl, mat, col)
	col = col || Color(255, 255, 255)

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)
		surface.SetMaterial(mat)
		surface.DrawTexturedRect(0, 0, w, h)
	end)
end

classes.TiledMaterial = function(pnl, mat, tw, th, col)
	col = col || Color(255, 255, 255, 255)

	pnl:On("Paint", function(s, w, h)
		surface.SetMaterial(mat)
		surface.SetDrawColor(col)
		surface.DrawTexturedRectUV(0, 0, w, h, 0, 0, w/tw, h/th)
	end)
end

classes.Outline = function(pnl, col, width)
	col = col || Color(255, 255, 255, 255)
	width = width || 1

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)
		
		for i=0, width-1 do
			surface.DrawOutlinedRect(0+i,0+i,w-i*2,h-i*2)
		end
	end)
end

classes.LinedCorners = function(pnl, col, len)
	col = col || Color(255, 255, 255, 255)
	len = len || 15

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)

		surface.DrawRect(0, 0, len, 1)
		surface.DrawRect(0, 1, 1, len-1)
		surface.DrawRect(w-len, h-1, len, 1)
		surface.DrawRect(w-1, h-len, 1, len-1)
	end)
end

classes.SideBlock = function(pnl, col, size, side)
	col = col || Color(255, 255, 255, 255)
	size = size || 3
	side = side || LEFT

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)
		
		if(side == LEFT) then
			surface.DrawRect(0, 0, size, h)
		elseif(side == TOP) then
			surface.DrawRect(0, 0, w, size)
		elseif(side == RIGHT) then
			surface.DrawRect(w-size, 0, size, h)
		elseif(side == BOTTOM) then
			surface.DrawRect(0, h-size, w, size)
		end
	end)
end

classes.Text = function(pnl, text, font, col, alignment, ox, oy, paint)
	font = font || "Trebuchet24"
	col = col || Color(255, 255, 255, 255)
	alignment = alignment || TEXT_ALIGN_CENTER
	ox = ox || 0
	oy = oy || 0

	if(!paint && pnl.SetText && pnl.SetFont && pnl.SetTextColor) then
		pnl:SetText(text)
		pnl:SetFont(font)
		pnl:SetTextColor(col)
	else
		pnl:On("Paint", function(s, w, h)
			local x = 0
			if(alignment == TEXT_ALIGN_CENTER) then
				x = w/2
			elseif(alignment == TEXT_ALIGN_RIGHT) then
				x = w
			end

			draw.SimpleText(text,font,x+ox,h/2+oy,col,alignment,TEXT_ALIGN_CENTER)
		end)
	end
end

classes.DualText = function(pnl, toptext, topfont, topcol, bottomtext, bottomfont, bottomcol, alignment, centerSpacing)
	topfont = topfont || "Trebuchet24"
	topcol = topcol || Color(0, 127, 255, 255)
	bottomfont = bottomfont || "Trebuchet18"
	bottomcol = bottomcol || Color(255, 255, 255, 255)
	alignment = alignment || TEXT_ALIGN_CENTER
	centerSpacing = centerSpacing || 0

	pnl:On("Paint", function(s, w, h)
		surface.SetFont(topfont)
		local tw, th = surface.GetTextSize(toptext)

		surface.SetFont(bottomfont)
		local bw, bh = surface.GetTextSize(bottomtext)

		local y1, y2 = h/2-bh/2, h/2+th/2

		local x
		if(alignment == TEXT_ALIGN_LEFT) then
			x = 0
		elseif(alignment == TEXT_ALIGN_CENTER) then
			x = w/2
		elseif(alignment == TEXT_ALIGN_RIGHT) then
			x = w
		end

		draw.SimpleText(toptext, topfont, x, y1+centerSpacing, topcol, alignment, TEXT_ALIGN_CENTER)
		draw.SimpleText(bottomtext, bottomfont, x, y2-centerSpacing, bottomcol, alignment, TEXT_ALIGN_CENTER)
	end)
end

classes.Blur = function(pnl, amount)
	pnl:On("Paint", function(s, w, h)
		local x, y = s:LocalToScreen(0, 0)
		local scrW, scrH = ScrW(), ScrH()

		surface.SetDrawColor(255, 255, 255)
		surface.SetMaterial(blur)

		for i = 1, 3 do
			blur:SetFloat("$blur", (i / 3) * (amount or 8))
			blur:Recompute()

			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
		end
	end)
end

classes.CircleClick = function(pnl, col, speed, trad)
	col = col || Color(255, 255, 255, 50)
	speed = speed || 5

	pnl.Rad, pnl.Alpha, pnl.ClickX, pnl.ClickY = 0, 0, 0, 0

	pnl:On("Paint", function(s, w, h)
		if(s.Alpha >= 1) then
			surface.SetDrawColor(ColorAlpha(col, s.Alpha))
			draw.NoTexture()
			drawCircle(s.ClickX, s.ClickY, s.Rad)
			s.Rad = Lerp(FrameTime()*speed, s.Rad, trad || w)
			s.Alpha = Lerp(FrameTime()*speed, s.Alpha, 0)
		end
	end)

	pnl:On("DoClick", function(s)
		s.ClickX, s.ClickY = s:CursorPos()
		s.Rad = 0
		s.Alpha = col.a
	end)
end

classes.CircleHover = function(pnl, col, speed, trad)
	col = col || Color(255, 255, 255, 30)
	speed = speed || 6

	pnl.LastX, pnl.LastY = 0, 0

	pnl:SetupTransition("CircleHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Think", function(s)
		if(s:IsHovered()) then
			s.LastX, s.LastY = s:CursorPos()
		end
	end)

	pnl:On("PaintOver", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(col, col.a*s.CircleHover))
		drawCircle(s.LastX, s.LastY, s.CircleHover*(trad || w))
	end)
end

classes.SquareCheckbox = function(pnl, inner, outer, speed)
	inner = inner || Color(0, 255, 0, 255)
	outer = outer || Color(255, 255, 255, 255)
	speed = speed || 14

	pnl:SetupTransition("SquareCheckbox", speed, function(s) return s:GetChecked() end)
	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(outer)
		surface.DrawRect(0, 0, w, h)

		surface.SetDrawColor(inner)
		surface.DrawOutlinedRect(0, 0, w, h)

		local bw, bh = (w-4)*s.SquareCheckbox, (h-4)*s.SquareCheckbox
		bw, bh = math.Round(bw), math.Round(bh)

		surface.DrawRect(w/2-bw/2, h/2-bh/2, bw, bh)
	end)
end

classes.CircleCheckbox = function(pnl, inner, outer, speed)
	inner = inner || Color(0, 255, 0, 255)
	outer = outer || Color(255, 255, 255, 255)
	speed = speed || 14

	pnl:SetupTransition("CircleCheckbox", speed, function(s) return s:GetChecked() end)
	pnl:On("Paint", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(outer)
		drawCircle(w/2, h/2, w/2-1)

		surface.SetDrawColor(inner)
		drawCircle(w/2, h/2, w*s.CircleCheckbox/2)
	end)
end

classes.AvatarMask = function(pnl, mask)
	pnl.Avatar = vgui.Create("AvatarImage", pnl)
	pnl.Avatar:SetPaintedManually(true)

	pnl.Paint = function(s, w, h)
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
		surface.SetDrawColor(255, 255, 255, 255)
		mask(s, w, h)

		render.SetStencilFailOperation(STENCILOPERATION_ZERO)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
		render.SetStencilReferenceValue(1)

		s.Avatar:SetPaintedManually(false)
		s.Avatar:PaintManual()
		s.Avatar:SetPaintedManually(true)

		render.SetStencilEnable(false)
		render.ClearStencil()
	end

	pnl.PerformLayout = function(s)
		s.Avatar:SetSize(s:GetWide(), s:GetTall())
	end

	pnl.SetPlayer = function(s, ply, size) s.Avatar:SetPlayer(ply, size) end
	pnl.SetSteamID = function(s, id, size) s.Avatar:SetSteamID(id, size) end
end

classes.CircleAvatar = function(pnl)
	pnl:Class("AvatarMask", function(s, w, h)
		drawCircle(w/2, h/2, w/2)
	end)
end

classes.Circle = function(pnl, col)
	col = col || Color(255, 255, 255, 255)

	pnl:On("Paint", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(col)
		drawCircle(w/2, h/2, math.min(w, h)/2)
	end)
end

classes.CircleFadeHover = function(pnl, col, speed)
	col = col || Color(255, 255, 255, 30)
	speed = speed || 6

	pnl:SetupTransition("CircleFadeHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Paint", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(col, col.a*s.CircleFadeHover))
		drawCircle(w/2, h/2, math.min(w, h)/2)
	end)
end

classes.CircleExpandHover = function(pnl, col, speed)
	col = col || Color(255, 255, 255, 30)
	speed = speed || 6

	pnl:SetupTransition("CircleExpandHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Paint", function(s, w, h)
		local rad = math.Round(w/2*s.CircleExpandHover)

		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(col, col.a*s.CircleExpandHover))
		drawCircle(w/2, h/2, rad)
	end)
end

classes.Gradient = function(pnl, col, dir, frac, op)
	dir = dir || BOTTOM
	frac = frac || 1

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)

		local x, y, gw, gh		
		if(dir == LEFT) then
			local prog = math.Round(w*frac)
			x, y, gw, gh = 0, 0, prog, h
			surface.SetMaterial(op && gradRight || gradLeft)
		elseif(dir == TOP) then
			local prog = math.Round(h*frac)
			x, y, gw, gh = 0, 0, w, prog
			surface.SetMaterial(op && gradDown || gradUp)
		elseif(dir == RIGHT) then
			local prog = math.Round(w*frac)
			x, y, gw, gh = w-prog, 0, prog, h
			surface.SetMaterial(op && gradLeft || gradRight)
		elseif(dir == BOTTOM) then
			local prog = math.Round(h*frac)
			x, y, gw, gh = 0, h-prog, w, prog
			surface.SetMaterial(op && gradUp || gradDown)
		end

		surface.DrawTexturedRect(x, y, gw, gh)
	end)
end

classes.SetOpenURL = function(pnl, url)
	pnl:On("DoClick", function()
		gui.OpenURL(url)
	end)
end

classes.NetMessage = function(pnl, name, data)
	data = data || function() end

	pnl:On("DoClick", function()
		net.Start(name)
			data(pnl)
		net.SendToServer()
	end)
end

classes.Stick = function(pnl, dock, margin, dontInvalidate)
	dock = dock || FILL
	margin = margin || 0

	pnl:Dock(dock)
	if(margin > 0) then
		pnl:DockMargin(margin, margin, margin, margin)
	end

	if(!dontInvalidate) then
		pnl:InvalidateParent(true)
	end
end

classes.DivTall = function(pnl, frac, target)
	frac = frac || 2
	target = target || pnl:GetParent()

	pnl:SetTall(target:GetTall()/frac)
end

classes.DivWide = function(pnl, frac, target)
	target = target || pnl:GetParent()
	frac = frac || 2

	pnl:SetWide(target:GetWide()/frac)
end

classes.SquareFromHeight = function(pnl)
	pnl:SetWide(pnl:GetTall())
end

classes.SquareFromWidth = function(pnl)
	pnl:SetTall(pnl:GetWide())
end

classes.SetRemove = function(pnl, target)
	target = target || pnl

	pnl:On("DoClick", function()
		if(IsValid(target)) then target:Remove() end
	end)
end

classes.FadeIn = function(pnl, time, alpha)
	time = time || 0.2
	alpha = alpha || 255

	pnl:SetAlpha(0)
	pnl:AlphaTo(alpha, time)
end

classes.HideVBar = function(pnl)
	local vbar = pnl:GetVBar()
	vbar:SetWide(0)
	vbar:Hide()
end

classes.SetTransitionFunc = function(pnl, fn)
	pnl.TransitionFunc = fn
end

classes.ClearTransitionFunc = function(pnl)
	pnl.TransitionFunc = nil
end

classes.SetAppendOverwrite = function(pnl, fn)
	pnl.AppendOverwrite = fn
end

classes.ClearAppendOverwrite = function(pnl)
	pnl.AppendOverwrite = nil
end

classes.ClearPaint = function(pnl)
	pnl.Paint = nil
end

classes.ReadyTextbox = function(pnl)
	pnl:SetPaintBackground(false)
	pnl:SetAppendOverwrite("PaintOver")
		:SetTransitionFunc(function(s) return s:IsEditing() end)
end


/*---------------------------------------------------------------------------
	TDLib function which adds all the classes to your panel
---------------------------------------------------------------------------*/
local meta = FindMetaTable("Panel")

function meta:TDLib()
	self.Class = function(pnl, name, ...)
		local class = classes[name]
		assert(class, "[TDLib]: Class "..name.." does not exist.")

		class(pnl, ...)

		return pnl
	end

	for k, v in pairs(classes) do
		self[k] = function(s, ...) return s:Class(k, ...) end
	end

	return self
end

function TDLib(c, p, n)
	local pnl = vgui.Create(c, p, n)
	return pnl:TDLib()
end

--PATH gamemodes/darkrp/gamemode/libraries/tablecheck.lua:
--[[
tablecheck

WIP

Author: FPtje Falco

Purpose:
Allow validating tables by creating schemas of tables. Inspired by Joi (https://github.com/hapijs/joi)

Requires fn library (https://github.com/FPtje/GModFunctional),

Example:
```lua
local schema = tc.checkTable{
    name   = tc.addHint(isstring, "The name must be a string!"),
    id     = tc.addHint(isnumber, "The id must be a number!"),
    gender = tc.addHint(tc.oneOf{"male", "female", "carp"}, "Gender missing or not recognised!", {"Perhaps you are a carp?"}),
}

local correct, err, hints = schema({name = "Dick", id = 3, gender = "carp"})
print(correct) -- true


local correct, err, hints = schema({name = "Dick", id = 3, gender = "crap"})
print(correct) -- false
print(err) -- Gender missing or not recognised!
PrintTable(hints) -- {"Perhaps you are a carp?"}
```

For further examples, including nesting and combining of schemas, please see the `unitTests` function for now.
--]]

module("tc", package.seeall)

-- Helpers for quick access to metatables
angle                  = FindMetaTable("Angle")
convar                 = FindMetaTable("ConVar")
effectdata             = FindMetaTable("CEffectData")
entity                 = FindMetaTable("Entity")
file                   = FindMetaTable("File")
imaterial              = FindMetaTable("IMaterial")
irestore               = FindMetaTable("IRestore")
isave                  = FindMetaTable("ISave")
itexture               = FindMetaTable("ITexture")
lualocomotion          = FindMetaTable("CLuaLocomotion")
movedata               = FindMetaTable("CMoveData")
navarea                = FindMetaTable("CNavArea")
navladder              = FindMetaTable("CNavLadder")
nextbot                = FindMetaTable("NextBot")
npc                    = FindMetaTable("NPC")
pathfollower           = FindMetaTable("PathFollower")
physobj                = FindMetaTable("PhysObj")
player                 = FindMetaTable("Player")
recipientfilter        = FindMetaTable("CRecipientFilter")
soundpatch             = FindMetaTable("CSoundPatch")
takedamageinfo         = FindMetaTable("CTakeDamageInfo")
usercmd                = FindMetaTable("CUserCmd")
vector                 = FindMetaTable("Vector")
vehicle                = FindMetaTable("Vehicle")
vmatrix                = FindMetaTable("VMatrix")
weapon                 = FindMetaTable("Weapon")

-- Assert function, asserts a property and returns the error if false.
-- Allows f to override err and hints by simply returning them
addHint = function(f, err, hints) return function(...)
    local res = {f(...)}
    res[2] = err
    res[3] = hints

    return unpack(res)
end end

--[[ Validates a table against a schema
Capable of nesting
--]]
function checkTable(schema)
    return function(tbl)
        if not istable(tbl) then
            return false, "Not a table!"
        end

        for k, v in pairs(schema or {}) do
            local correct, err, hints = tbl[v] ~= nil
            if isfunction(v) then correct, err, hints, replace, replaceWith = v(tbl[k], tbl) end


            if not correct then
                err = err or string.format("Element '%s' is corrupt!", k)
                return correct, err, hints
            end

            -- Update the value
            if correct and replace == true and replaceWith then
                tbl[k] = replaceWith
            end
        end

        return true
    end
end

-- Returns whether a value is nil
isnil = fn.Curry(fn.Eq, 2)(nil)

-- Returns whether a value is a color
iscolor = IsColor

-- Returns true on the client
client = function() return CLIENT end

-- returns true on the server
server = function() return SERVER end

-- Optional value, when filled in it must meet the conditions
optional = function(...) return fn.FOr{isnil, ...} end

-- Default value, implies optional. Only works in combination with tc.checkTable
-- Note that the tc.addHint is to be the second parameter of default.
--      tc.addHint(tc.default(x)) does NOT work, default(x, tc.addHint(...)) does.
-- example: tc.checkTable{test = tc.default(3, tc.addHint(isnumber, "must be a number"))}
-- example: tc.checkTable{test = tc.default(3)}
default = function(def, f)
    return function(val, ...)
        if val == nil then
            -- second return value is the default value. Expects parent function to actually change the value
            return true, nil, nil, true, def
        end
        -- Return in if statement rather than "return f and f(val) or true" to allow multiple return values
        if f then return f(val, ...) else return true end
    end
end

-- A table of which each element must meet condition f
-- i.e. "this must be a table of xxx"
-- example: tc.tableOf(isnumber) demands that the table contains only numbers
tableOf = function(f) return function(tbl, parentTbl)
    if not istable(tbl) then return false end
    for _, v in pairs(tbl) do
        local res = {f(v, parentTbl)}
        if not res[1] then
            return unpack(res)
        end
    end

    return true
end end

-- Checks whether a value is amongst a given set of values
-- exapmle: tc.oneOf{"jobs", "entities", "shipments", "weapons", "vehicles", "ammo"}
oneOf = function(f) return fp{table.HasValue, f} end

-- A table that is non-empty, also useful for wrapping around tableOf
-- example: tc.nonEmpty(tc.tableOf(isnumber))
-- example: tc.nonEmpty() -- just checks that the table is non-empty
nonEmpty = function(f) return function(tbl, parentTbl)
    if not istable(tbl) or table.IsEmpty(tbl) then return false end
    if not f then return true end
    return f(tbl, parentTbl)
end end

-- Number check: minimum
min = function(n) return fn.FAnd{isnumber, fp{fn.Lte, n}} end

-- Number check: maximum
max = function(n) return fn.FAnd{isnumber, fp{fn.Gte, n}} end

-- Number check: positive
positive = min(0)

-- Number check: negative
negative = max(0)


-- Whether the input matches regex
-- Note: uses string.match, so it doesn't support full regex.
-- May also allow numbers, since string.match also accepts numbers.
-- Note, also matches on substrings. Use ^pattern$ for a full match.
regex = function(pattern, startpos) return function(val)
    return (isstring(val) or isnumber(val)) and tobool(string.match(val, pattern, startpos))
end end

-- Requires that the value only contains alphanumeric characters
alphanum = regex("^[a-zA-Z0-9]+$")


-- Test cases. Also serve as nice examples
function unitTests()
    local id = 0

    -- unit test helper functions
    local function checkCorrect(correct, err, hints)
        id = id + 1

        if correct ~= true then
            print(id, "Incorrect value that should be correct!", correct, err, hints)
            if hints then PrintTable(hints) end
            return
        end

        print(id, "Correct")
    end

    local function checkIncorrect(correct, err, hints)
        id = id + 1

        if correct then
            print(id, "Correct value that should be incorrect!", correct, err, hints)
            if hints then PrintTable(hints) end
            return
        end

        print(id, "Correct")
    end

    --[[
    Simple value schema. Checks whether the input is a number.
    ]]
    local simpleSchema = tc.addHint(isnumber, "Must be a number!")

    -- This is how a schema is to be used. Just call it with the value you want to check.
    -- In further unit tests, the schema function is immediately called inside the checkCorrect/checIncorrect call for brevity
    local correct, err, hints = simpleSchema(3)

    checkCorrect(correct, err, hints)


    --[[
    Simple table schema
    ]]
    local simpleTableSchema = tc.checkTable{
        name        = tc.addHint(isstring, "The name must be a string!"),
        id          = tc.addHint(isnumber, "The id must be a number!"),
        gender      = tc.addHint(tc.oneOf{"male", "female", "carp"}, "Gender missing or not recognised!", {"Perhaps you are a carp?"}),
        nilthing    = tc.addHint(tc.isnil, "nilthing must be nil"),
        nonEmpty    = tc.addHint(tc.nonEmpty(tc.tableOf(isnumber)), "nonEmpty not table of numbers"),
        optnum      = tc.addHint(tc.optional(isnumber), "optnum given, but not a number"),
        strnum      = tc.addHint(fn.FOr{isstring, isnumber}, "strnum must either be a string or a number"),
        minmax      = tc.addHint(fn.FAnd{tc.min(5), tc.max(10)}),
        pos         = tc.addHint(tc.optional(tc.positive)),
        regx        = tc.addHint(tc.optional(tc.regex("[a-z]+"))),
        letters     = tc.addHint(tc.optional(tc.alphanum)),
    }

    checkCorrect(simpleTableSchema({name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 5, regx = "asdf", letters = "asdfj", pos = 3}))

    -- Counterexamples, should throw errors
    local badTables = {
        {},
        {name = 1, id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 7},
        {name = "Dick", id = "3", gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 7},
        {name = "Dick", id = 3, gender = "other", nonEmpty = {1,2,3}, strnum = "str", minmax = 7},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {}, strnum = "str", minmax = 7},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = {}, minmax = 7},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", optnum = "nope", minmax = 7},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 4},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 11},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str"},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 7, regx = "666"},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 7, regx = "asdf", letters = ">:D"},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 7, regx = "asdf", letters = ">:D", pos = -1},
    }

    for _, tbl in pairs(badTables) do
        checkIncorrect(simpleTableSchema(tbl))
    end

    --[[
    Table Schema with no explicit keys
    ]]
    local nokeysSchema = tc.checkTable{
        tc.addHint(isstring, "The first value must be a string."),
        tc.addHint(isnumber, "The second value must be a number!"),
    }
    checkCorrect(nokeysSchema({"string", 3}))

    --[[
    Nested table schema
    ]]
    local nestedSchema = tc.checkTable{
        nested = tc.checkTable{
            val = tc.addHint(isnumber, "'val' must be a number!")
        }
    }

    checkCorrect(nestedSchema({nested = {val = 3}}))
    checkIncorrect(nestedSchema({}))

    --[[
    Combining schemas using the fn library
    ]]
    local andSchema = fn.FAnd{
        tc.checkTable{
            num = tc.addHint(isnumber, "num is not a number")
        },
        tc.checkTable{
            str = tc.addHint(isstring, "str is not a string")
        }
    }

    checkCorrect(andSchema({num = 1, str = "string!"}))
    checkIncorrect(andSchema({num = 1}))
    checkIncorrect(andSchema({str = "string!"}))

    local orSchema = fn.FOr{
        tc.checkTable{
            num = tc.addHint(isnumber, "num is not a number")
        },
        tc.checkTable{
            str = tc.addHint(isstring, "str is not a string")
        }
    }
    checkCorrect(orSchema({num = 1}))
    checkCorrect(orSchema({str = "string!"}))

    --[[
    Default value with a check
    ]]
    local withDefaultSchema = tc.checkTable{
        value = tc.default(10, tc.addHint(isnumber, "must be a number!"))
    }
    checkCorrect(withDefaultSchema({value = 30}))
    checkIncorrect(withDefaultSchema({value = "string"}))

    local empty = {}
    checkCorrect(withDefaultSchema(empty))
    if empty.value ~= 10 then
        print("Default did NOT set the value to 10!")
    else
        print("Default test OK!")
    end

    --[[
    Default value with no checks
    ]]
    local withDefaultNoCheck = tc.checkTable{
        value = tc.default(10)
    }
    checkCorrect(withDefaultNoCheck({}))
    checkCorrect(withDefaultNoCheck({value = "string"}))

    --[[
    Creating your own checker function that returns an error message
    When both the function and the tc.addHint define error messages, there's a conflict
    ]]
    local function customCheck(val)
        return false, "function error message", {"function hint"}
    end

    local customCheckSchema = tc.checkTable{
        value = tc.addHint(customCheck, "added error message", {"added hint"})
    }
    checkIncorrect(customCheckSchema{value = 1})
    checkIncorrect(customCheckSchema{})

    _, err, hints = customCheckSchema{value = 2}
    if err ~= "added error message" or hints[1] ~= "added hint" then
        print("Wrong conflict solution", err, hints[1])
    else
        print("Conflict solution OK!")
    end

    print("finished")
end

--PATH gamemodes/darkrp/gamemode/libraries/disjointset.lua:
/*---------------------------------------------------------------------------
Disjoint-set forest implementation
Inspired by the book Introduction To Algorithms (third edition)

by FPtje Atheos

Running time per operation (Union/FindSet): O(a(n)) where a is the inverse of the Ackermann function.
---------------------------------------------------------------------------*/

local ipairs = ipairs
local setmetatable = setmetatable
local string = string
local table = table
local tostring = tostring

module("disjoint")

local metatable

-- Make a singleton set. Parent parameter is optional, must be a disjoint-set as well.
function MakeSet(x, parent)
    local set  = {}
    set.value  = x
    set.rank   = 0
    set.parent = parent or set

    setmetatable(set, metatable)

    return set
end

local function Link(x, y)
    if x == y then return x end

    -- Union by rank
    if x.rank > y.rank then
        y.parent = x
        return x
    end

    x.parent = y

    if x.rank == y.rank then
        y.rank = y.rank + 1
    end

    return y
end

-- Apply the union operation between two sets.
function Union(x, y)
    return Link(FindSet(x), FindSet(y))
end

function FindSet(x)
    local parent = x
    local listParents

    -- Go up the tree to find the parent
    while parent ~= parent.parent do
        parent = parent.parent

        listParents = listParents or {}
        table.insert(listParents, parent)
    end

    -- Path compression, update all parents to refer to the top parent
    if listParents then
        for _, v in ipairs(listParents) do
            v.parent = parent
        end
    end

    return parent
end

function Disconnect(x)
    x.parent = x

    return x
end


metatable = {
    __tostring = function(self)
        return string.format("Disjoint-Set [value: %s][Rank: %s][Parent: %s]", tostring(self.value), self.rank, tostring(self.parent.value))
    end,
    __metatable = true, -- restrict access to metatable
    __add = Union
}

--PATH addons/111mod/lua/darkrp_config/settings.lua:

-----------------------------------------------------
--[[-------------------------------------------------------------------------
DarkRP config settings.
-----------------------------------------------------------------------------

This is the settings file of DarkRP. Every DarkRP setting is listed here.

Warning:
If this file is missing settings (because of e.g. an update), DarkRP will assume default values for these settings.
You need not worry about updating this file. If a new setting is added you can manually add them to this file.
---------------------------------------------------------------------------]]


--[[
Toggle settings.
Set to true or false.
]]
GM.Config.talkDistance    = 250
GM.Config.whisperDistance = 90
GM.Config.yellDistance    = 550
GM.Config.meDistance      = 250
GM.Config.voiceDistance   = 550

-- voice3D - Enable/disable 3DVoice is enabled.
GM.Config.voice3D                       = true
-- AdminsCopWeapons - Enable/disable admins spawning with cop weapons.
GM.Config.AdminsCopWeapons              = false
-- adminBypassJobCustomCheck - Enable/disable whether an admin can force set a job with whenever customCheck returns false.
GM.Config.adminBypassJobRestrictions    = true
-- allow people getting their own custom jobs.
GM.Config.allowjobswitch                = true
-- allowrpnames - Allow Players to Set their RP names using the /rpname command.
GM.Config.allowrpnames                  = true
-- allowsprays - Enable/disable the use of sprays on the server.
GM.Config.allowsprays                   = false
-- allowvehicleowning - Enable/disable whether people can own vehicles.
GM.Config.allowvehicleowning            = true
-- allowvnocollide - Enable/disable the ability to no-collide a vehicle (for security).
GM.Config.allowvnocollide               = false
-- alltalk - Enable for global chat, disable for local chat.
GM.Config.alltalk                       = false
-- antimultirun - Disallow people joining your server(s) twice on the same account.
GM.Config.antimultirun                  = false
-- autovehiclelock - Enable/Disable automatic locking of a vehicle when a player exits it.
GM.Config.autovehiclelock               = false
-- babygod - people spawn godded (prevent spawn killing).
GM.Config.babygod                       = false
-- canforcedooropen - whether players can force an unownable door open with lockpick or battering ram or w/e.
GM.Config.canforcedooropen              = true
-- chatsounds - sounds are played when some things are said in chat.
GM.Config.chatsounds                    = true -- false
-- chiefjailpos - Allow the Chief to set the jail positions.
GM.Config.chiefjailpos                  = false
-- cit_propertytax - Enable/disable property tax that is exclusive only for citizens.
GM.Config.cit_propertytax               = true
-- copscanunfreeze - Enable/disable the ability of cops to unfreeze other people's props.
GM.Config.copscanunfreeze               = false
-- copscanunweld - Enable/disable the ability of cops to unweld other people's props.
GM.Config.copscanunweld                 = false
-- cpcanarrestcp - Allow/Disallow CPs to arrest other CPs.
GM.Config.cpcanarrestcp                 = false
-- currencyLeft - The position of the currency symbol. true for left, false for right.
GM.Config.currencyLeft                  = false -- true
-- customjobs - Enable/disable the /job command (personalized job names).
GM.Config.customjobs                    = true
-- customspawns - Enable/disable whether custom spawns should be used.
GM.Config.customspawns                  = false
-- deathblack - Whether or not a player sees black on death.
GM.Config.deathblack                    = false
-- showdeaths - Display kill information in the upper right corner of everyone's screen.
GM.Config.showdeaths                    = false
-- deadtalk - Enable/disable whether people talk and use commands while dead.
GM.Config.deadtalk                      = false
-- deadvoice - Enable/disable whether people talk through the microphone while dead.
GM.Config.deadvoice                     = false
-- deathpov - Enable/disable whether people see their death in first person view.
GM.Config.deathpov                      = true
-- decalcleaner - Enable/Disable clearing ever players decals.
-- false - net
-- true - da
GM.Config.decalcleaner                  = true
-- disallowClientsideScripts - Clientside scripts can be very useful for customizing the HUD or to aid in building. This option bans those scripts.
GM.Config.disallowClientsideScripts     = true
-- doorwarrants - Enable/disable Warrant requirement to enter property.
GM.Config.doorwarrants                  = false
-- dropmoneyondeath - Enable/disable whether people drop money on death.
GM.Config.dropmoneyondeath              = true
-- droppocketarrest - Enable/disable whether people drop the stuff in their pockets when they get arrested.
GM.Config.droppocketarrest              = false
-- droppocketdeath - Enable/disable whether people drop the stuff in their pockets when they die.
GM.Config.droppocketdeath               = false
-- dropweapondeath - Enable/disable whether people drop their current weapon when they die.
GM.Config.dropweapondeath               = false
-- Whether players can drop the weapons they spawn with.
GM.Config.dropspawnedweapons            = false
-- dynamicvoice - Enable/disable whether only people in the same room as you can hear your mic.
GM.Config.dynamicvoice                  = false
-- earthquakes - Enable/disable earthquakes.
GM.Config.earthquakes                   = false
-- enablebuypistol - Turn /buy on of off.
GM.Config.enablebuypistol               = true
-- enforceplayermodel - Whether or not to force players to use their role-defined character models.
GM.Config.enforceplayermodel            = true
-- globalshow - Whether or not to display player info above players' heads in-game.
GM.Config.globalshow                    = false
-- ironshoot - Enable/disable whether people need iron sights to shoot.
GM.Config.ironshoot                     = true
-- showjob - Whether or not to display a player's job above their head in-game.
GM.Config.showjob                       = true
-- letters - Enable/disable letter writing / typing.
GM.Config.letters                       = true
-- license - Enable/disable People need a license to be able to pick up guns.
GM.Config.license                       = false
-- lockdown - Enable/Disable initiating lockdowns for mayors.
GM.Config.lockdown                      = true
-- lockpickfading - Enable/disable the lockpicking of fading doors.
GM.Config.lockpickfading                = false
-- logging - Enable/disable logging everything that happens.
GM.Config.logging                       = true
-- lottery - Enable/disable creating lotteries for mayors.
GM.Config.lottery                       = false
-- showname - Whether or not to display a player's name above their head in-game.
GM.Config.showname                      = true
-- showhealth - Whether or not to display a player's health above their head in-game.
GM.Config.showhealth                    = false
-- needwantedforarrest - Enable/disable Cops can only arrest wanted people.
GM.Config.needwantedforarrest           = false
-- noguns - Enabling this feature bans Guns and Gun Dealers.
GM.Config.noguns                        = false
-- norespawn - Enable/Disable that people don't have to respawn when they change job.
GM.Config.norespawn                     = true -- true
-- npcarrest - Enable/disable arresting npc's.
GM.Config.npcarrest                     = false
-- ooc - Whether or not OOC tags are enabled.
GM.Config.ooc                           = true
-- propertytax - Enable/disable property tax.
GM.Config.propertytax                   = true
-- proppaying - Whether or not players should pay for spawning props.
GM.Config.proppaying                    = false
-- propspawning - Enable/disable props spawning. Applies to admins too.
GM.Config.propspawning                  = true
-- removeclassitems - Enable/disable shipments/microwaves/etc. removal when someone changes team.
GM.Config.removeclassitems              = true
-- removeondisconnect - Enable/disable shipments/microwaves/etc. removal when someone disconnects.
GM.Config.removeondisconnect            = true
-- respawninjail - Enable/disable whether people can respawn in jail when they die.
GM.Config.respawninjail                 = true
-- restrictallteams - Enable/disable Players can only be citizen until an admin allows them.
GM.Config.restrictallteams              = false
-- restrictbuypistol - Enabling this feature makes /buy available only to Gun Dealers.
GM.Config.restrictbuypistol             = true
-- restrictdrop - Enable/disable restricting the weapons players can drop. Setting this to true disallows weapons from shipments from being dropped.
GM.Config.restrictdrop                  = false
-- revokeLicenseOnJobChange - Whether licenses are revoked when a player changes jobs.
GM.Config.revokeLicenseOnJobChange      = true
-- shouldResetLaws - Enable/Disable resetting the laws back to the default law set when the mayor changes.
GM.Config.shouldResetLaws               = true
-- strictsuicide - Whether or not players should spawn where they suicided.
GM.Config.strictsuicide                 = false
-- telefromjail - Enable/disable teleporting from jail.
GM.Config.telefromjail                  = true
-- teletojail - Enable/disable teleporting to jail.
GM.Config.teletojail                    = true
-- unlockdoorsonstart - Enable/Disable unlocking all doors on map start.
GM.Config.unlockdoorsonstart            = true
-- voiceradius - Enable/disable local voice chat.
GM.Config.voiceradius                   = true
-- tax - Whether players pay taxes on their wallets.
GM.Config.wallettax                     = false
-- wantedsuicide - Enable/Disable suiciding while you are wanted by the police.
GM.Config.wantedsuicide                 = false
-- realisticfalldamage - Enable/Disable dynamic fall damage. Setting mp_falldamage to 1 will over-ride this.
GM.Config.realisticfalldamage           = true
-- printeroverheat - Whether the default money printer can overheat on its own.
GM.Config.printeroverheat               = true
-- weaponCheckerHideDefault - Hide default weapons when checking weapons.
GM.Config.weaponCheckerHideDefault      = true
-- weaponCheckerHideNoLicense - Hide weapons that do not require a license.
GM.Config.weaponCheckerHideNoLicense    = false

--[[
Value settings
]]
-- adminnpcs - Whether or not NPCs should be admin only. 0 = everyone, 1 = admin or higher, 2 = superadmin or higher, 3 = rcon only
GM.Config.adminnpcs                     = 3
-- adminsents - Whether or not SENTs should be admin only. 0 = everyone, 1 = admin or higher, 2 = superadmin or higher, 3 = rcon only
GM.Config.adminsents                    = 1
-- adminvehicles - Whether or not vehicles should be admin only. 0 = everyone, 1 = admin or higher, 2 = superadmin or higher, 3 = rcon only
GM.Config.adminvehicles                 = 0
-- adminweapons - Who can spawn weapons: 0: admins only, 1: supadmins only, 2: no one
GM.Config.adminweapons                  = 0
-- arrestspeed - Sets the max arrest speed.
GM.Config.arrestspeed                   = 120
-- babygodtime - How long the babygod lasts.
GM.Config.babygodtime                   = 5
-- chatsoundsdelay - How long to wait before letting a player emit a sound from their chat again.
-- Leave this on at least a few seconds to prevent people from spamming sounds. Set to 0 to disable.
GM.Config.chatsoundsdelay               = 5
-- deathfee - the amount of money someone drops when dead.
GM.Config.deathfee                      = 396
-- decaltimer - Sets the time to clear clientside decals (in seconds).
GM.Config.decaltimer                    = 120
-- demotetime - Number of seconds before a player can rejoin a team after demotion from that team.
GM.Config.demotetime                    = 360
-- doorcost - Sets the cost of a door.
GM.Config.doorcost                      = 35
-- entremovedelay - how long to wait before removing a bought entity after disconnect.
GM.Config.entremovedelay                = 0
-- gunlabweapon - The weapon that the gunlab spawns.
GM.Config.gunlabweapon                  = "weapon_p2282"
-- jailtimer - Sets the jailtimer (in seconds).
GM.Config.jailtimer                     = 300
-- lockdowndelay - The amount of time a mayor must wait before starting the next lockdown.
GM.Config.lockdowndelay                 = 120
-- maxadvertbillboards - The maximum number of /advert billboards a player can place.
GM.Config.maxadvertbillboards           = 0
-- maxCheques - The maximum number of cheques someone can write
GM.Config.maxCheques                    = 5
-- maxdoors - Sets the max amount of doors one can own.
GM.Config.maxdoors                      = 10
-- maxdrugs - Sets max drugs.
GM.Config.maxdrugs                      = 0
-- maxfoods - Sets the max food cartons per Microwave owner.
GM.Config.maxfoods                      = 0
-- maxfooditems - Sets the max amount of food items a player can buy from the F4 menu.
GM.Config.maxfooditems                  = 20
-- maxlawboards - The maximum number of law boards the mayor can place.
GM.Config.maxlawboards                  = 0
-- maxletters - Sets max letters.
GM.Config.maxletters                    = 0
-- maxlotterycost - Maximum payment the mayor can set to join a lottery.
GM.Config.maxlotterycost                = 100000
-- maxvehicles - Sets how many vehicles one can buy.
GM.Config.maxvehicles                   = 0
-- microwavefoodcost - Sets the sale price of Microwave Food.
GM.Config.microwavefoodcost             = 0
-- minlotterycost - Minimum payment the mayor can set to join a lottery.
GM.Config.minlotterycost                = 100
-- Money packets will get removed if they don't get picked up after a while. Set to 0 to disable.
GM.Config.moneyRemoveTime               = 600
-- mprintamount - Value of the money printed by the money printer.
GM.Config.mprintamount                  = 1000
-- normalsalary - Sets the starting salary for newly joined players.
GM.Config.normalsalary                  = 50
-- npckillpay - Sets the money given for each NPC kill.
GM.Config.npckillpay                    = 10
-- paydelay - Sets how long it takes before people get salary.
GM.Config.paydelay                      = 120
-- pocketitems - Sets the amount of objects the pocket can carry.
GM.Config.pocketitems                   = 10
-- pricecap - The maximum price of items (using /price).
GM.Config.pricecap                      = 5000000
-- pricemin - The minimum price of items (using /price).
GM.Config.pricemin                      = 500
-- propcost - How much prop spawning should cost (prop paying must be enabled for this to have an effect).
GM.Config.propcost                      = 0
-- quakechance - Chance of an earthquake happening.
GM.Config.quakechance                   = 0
-- respawntime - Minimum amount of seconds a player has to wait before respawning.
GM.Config.respawntime                   = 0
-- changejobtime - Minimum amount of seconds a player has to wait before changing job.
GM.Config.changejobtime                 = 30
-- runspeed - Sets the max running speed.
GM.Config.runspeed                      = 265
-- runspeed - Sets the max running speed for CP teams.
GM.Config.runspeedcp                    = 280
-- searchtime - Number of seconds for which a search warrant is valid.
GM.Config.searchtime                    = 360
-- ShipmentSpawnTime - Antispam time between spawning shipments.
GM.Config.ShipmentSpamTime              = 0
-- shipmenttime - The number of seconds it takes for a shipment to spawn.
GM.Config.shipmentspawntime             = 0
-- startinghealth - the health when you spawn.
GM.Config.startinghealth                = 100
-- startingmoney - your wallet when you join for the first time.
GM.Config.startingmoney                 = 25000
-- vehiclecost - Sets the cost of a vehicle (To own it).
GM.Config.vehiclecost                   = 40
-- wallettaxmax - Maximum percentage of tax to be paid.
GM.Config.wallettaxmax                  = 5
-- wallettaxmin - Minimum percentage of tax to be paid.
GM.Config.wallettaxmin                  = 1
-- wallettaxtime - Time in seconds between taxing players. Requires server restart.
GM.Config.wallettaxtime                 = 600
-- wantedtime - Number of seconds for which a player is wanted for.
GM.Config.wantedtime                    = 600
-- walkspeed - Sets the max walking speed.
GM.Config.walkspeed                     = 170
-- falldamagedamper - The damper on realistic fall damage. Default is 15. Decrease this for more damage.
GM.Config.falldamagedamper              = 15
-- falldamageamount - The base damage taken from falling for static fall damage. Default is 10.
GM.Config.falldamageamount              = 10
-- printeroverheatchance - The likelyhood of a printer overheating. The higher this number, the less likely (minimum 3, default 22).
GM.Config.printeroverheatchance         = 3
-- printerreward - Reward for destroying a money printer.
GM.Config.printerreward                 = 1500

--[[---------------------------------------------------------------------------
Other settings
---------------------------------------------------------------------------]]

-- The classname of money packets. Use this to create your own money entity!
-- Note: the money packet must support the "Setamount" method (or the amount DTVar).
GM.Config.MoneyClass = "spawned_money"
-- In case you do wish to keep the default money, but change the model, this option is the way to go:
GM.Config.moneyModel = "models/props/cs_assault/money.mdl"
-- You can set your own, custom sound to be played for all players whenever a lockdown is initiated.
-- Note: Remember to include the folder where the sound file is located.
GM.Config.lockdownsound = "npc/overwatch/cityvoice/f_confirmcivilstatus_1_spkr.wav"

-- The skin DarkRP uses. Set to "default" to use the GMod default derma theme.
GM.Config.DarkRPSkin = "SUP"
GM.Config.currency = "$"
GM.Config.chatCommandPrefix = "/"
GM.Config.F1MenuHelpPage = "https://docs.google.com/document/d/10pvotowOA3EA7K5BMgdaKVOYjbrbx6dxrQn4LWxm30A/edit#heading=h.e5iaqteza8x7"
GM.Config.F1MenuHelpPageTitle = "Server tips"

-- Put Steam ID's and ranks in this list, and the players will have that rank when they join.
GM.Config.DefaultPlayerGroups = {
}

-- Custom modules in this addon that are disabled.
GM.Config.DisabledCustomModules = {
       ["hudreplacement"] = false,
       ["extraf4tab"] = false,
}

-- The list of weapons that players are not allowed to drop. Items set to true are not allowed to be dropped.
GM.Config.DisallowDrop = {
    ["itemstore_checker"] = true,
    ["arrest_stick"] = true,
	["unarrest_stick"] = true,
    ["door_ram"] = true,
    ["gmod_tool"] = true,
    ["keys"] = true,
    ["gmod_tool"] = true,
	["weapon_rape"] = true,
    ["unarrest_stick"] = true,
	["itemstore_pickup"] = true,
    ["weapon_keypadchecker"] = true,
    ["weapon_physcannon"] = true,
    ["weapon_physgun"] = true,
    ["weaponchecker"] = true,
	["weapon_crossbow"] = true,
	["weapon_frag"] = true,
	["weapon_rpg"] = true,
	["weapon_slam"] = true,
    ["climb_swep2"] = true,	
    ["swep_pickpocket"] = true,
    ["weapon_pet"] = true,
    ["weapon_handcuffed"] = true,
    ["verevka"] = true,
    ["cuff"] = true,
	["weapon_fists"] = true,
	["weapon_shotgun"] = true,
	["sieghail"] = true,
	["nalogswep"] = true,
	["surrender"] = true,
	["salute"] = true,
	["god_s"] = true,
	["rp_box_in_hands"] = true,
	["swep_disguise_briefcase"] = true,
}

-- The list of weapons people spawn with.
GM.Config.DefaultWeapons = {
    "weapon_adv_keys",
    "weapon_physcannon",
    "gmod_tool",
    "itemstore_pickup",
    "weapon_physgun",
    -- "zck_snowballswep"
}

-- Override categories.
-- NOTE: categories are to be set in the "category" field of the custom jobs/shipments/entities/ammo/pistols/vehicles.
-- Use this only to override the categories of _default_ things.
-- This will NOT work for your own custom stuff.
-- Make sure the category is created in the darkrp_customthings/categories.lua, otherwise it won't work!
GM.Config.CategoryOverride = {
    jobs = {
        ["Citizen"]                             = "Citizens",
        ["Hobo"]                                = "Citizens",
        ["Gun Dealer"]                          = "Citizens",
        ["Medic"]                               = "Citizens",
        ["Civil Protection"]                    = "Civil Protection",
        ["Gangster"]                            = "Gangsters",
        ["Mob boss"]                            = "Gangsters",
        ["Civil Protection Chief"]              = "Civil Protection",
        ["Mayor"]                               = "Civil Protection",
    },
    entities = {
        ["Drug lab"]                            = "Other",
        ["Money printer"]                       = "Other",
        ["Gun lab"]                             = "Other",

    },
    shipments = {
        ["AK47"]                                = "Rifles",
        ["MP5"]                                 = "Rifles",
        ["M4"]                                  = "Rifles",
        ["Mac 10"]                              = "Other",
        ["Pump shotgun"]                        = "Shotguns",
        ["Sniper rifle"]                        = "Snipers",

    },
    weapons = {
        ["Desert eagle"]                        = "Pistols",
        ["Fiveseven"]                           = "Pistols",
        ["Glock"]                               = "Pistols",
        ["P228"]                                = "Pistols",
    },
    vehicles = {}, -- There are no default vehicles.
    ammo = {
        ["Pistol ammo"]                         = "Other",
        ["Shotgun ammo"]                        = "Other",
        ["Rifle ammo"]                          = "Other",
    },
}

-- The list of weapons admins spawn with, in addition to the default weapons, a job's weapons and GM.Config.AdminsCopWeapons.
GM.Config.AdminWeapons = {
}

-- These are the default laws, they're unchangeable in-game.
GM.Config.DefaultLaws = {
"Запрещается нападать/убивать граждан города. [Тяжёлое]",
"Запрещается употреблять, распространять и хранить наркотические вещества. [Тяжёлое]",
"Запрещено воровать или грабить. [Тяжёлое]",
"Запрещена выдача себя за иного гражданина: документы, маскировка [Среднее]",
"Запрещается иметь оружие / вести бизнес / строить на улице без лицензий. [Среднее]",
"Запрещены ложные вызовы и сопротивление полиции. [Среднее]",
"Запрещается иметь денежные принтера. [Среднее]",
"Запрещено проникновение на частную или закрытую государственную территорию. [Среднее]",
"Запрещен вандализм и порча имущества. [Лёгкое]",
"Запрещено нарушение общественного порядка. [Лёгкое]",
"Запрещается угрожать гражданам или оскорблять их. [Лёгкое]",
}

GM.Config.PocketBlacklist = {
}

-- These weapons are classed as 'legal' in the weapon checker and are not stripped when confiscating weapons.
-- This setting is used IN ADDITION to GM.Config.weaponCheckerHideDefault and GM.Config.weaponCheckerHideNoLicense.
-- You should use the former if you want to class the default weapons (GM.Config.DefaultWeapons and, if admin, GM.Config.AdminWeapons) and a player's job weapons as legal.
-- The latter takes GM.NoLicense weapons as legal (see licenseweapons.lua).
-- The format of this config is similar to GM.Config.DisallowDrop.
GM.Config.PocketBlacklist = {
    ["fadmin_jail"] = true,
    ["meteor"] = true,
    ["door"] = true,
    ["func_"] = true,
    ["player"] = true,
    ["beam"] = true,
    ["worldspawn"] = true,
    ["env_"] = true,
    ["path_"] = true,
    ["prop_physics"] = true,
    ["money_printer"] = true,
    ["gunlab"] = true,
    ["prop_dynamic"] = true,
    ["prop_vehicle_prisoner_pod"] = true,
    ["keypad_wire"] = true,
    ["gmod_button"] = true,
    ["gmod_rtcameraprop"] = true,
    ["gmod_cameraprop"] = true,
    ["gmod_dynamite"] = true,
    ["gmod_thruster"] = true,
    ["gmod_light"] = true,
    ["gmod_lamp"] = true,
    ["gmod_emitter"] = true,
}

-- The entities listed here will not be removed when a player changes their job.
-- This only applies when removeclassitems is set to true.
-- Note: entities will only be removed when the player changes to a job that is not allowed to have the entity.
GM.Config.preventClassItemRemoval = {
    ["gunlab"] = false,
    ["microwave"] = false,
    ["spawned_shipment"] = false,
}

-- Properties set to true are allowed to be used. Values set to false or are missing from this list are blocked.
GM.Config.allowedProperties = {
    remover = true,
    ignite = false,
    extinguish = true,
    keepupright = true,
    gravity = true,
    collision = true,
    skin = true,
    bodygroups = true,
}

--[[---------------------------------------------------------------------------
F4 menu
---------------------------------------------------------------------------]]
-- hide the items that you can't buy and the jobs you can't get (instead of graying them out).
-- this option hides items when you don't have enough money, when the maximum is reached for a job or any other reason.
GM.Config.hideNonBuyable = false

-- Hide only the items that you have the wrong job for (or for which the customCheck says no).
-- When you set this option to true and hideNonBuyable to false, you WILL see e.g. items that are too expensive for you to buy.
-- but you won't see gundealer shipments when you have the citizen job.
GM.Config.hideTeamUnbuyable = true

--[[---------------------------------------------------------------------------
AFK module
---------------------------------------------------------------------------]]
-- The time of inactivity before being demoted.
GM.Config.afkdemotetime = 600
-- Prevent people from spamming AFK.
GM.Config.AFKDelay = 300

--[[---------------------------------------------------------------------------
Hitmenu module
---------------------------------------------------------------------------]]
-- The minimum price for a hit.
GM.Config.minHitPrice = 5000
-- The maximum price for a hit.
GM.Config.maxHitPrice = 6000
-- The minimum distance between a hitman and his customer when they make the deal.
GM.Config.minHitDistance = 150
-- The text that tells the player he can press use on the hitman to request a hit.
GM.Config.hudText = "Нажми E Чтобы заказать кого-либо!"
-- The text above a hitman when he's got a hit.
GM.Config.hitmanText = ""
-- The cooldown time for a hit target (so they aren't spam killed).
GM.Config.hitTargetCooldown = 120
-- How long a customer has to wait to be able to buy another hit (from the moment the hit is accepted).
GM.Config.hitCustomerCooldown = 240

--[[---------------------------------------------------------------------------
Hungermod module
---------------------------------------------------------------------------]]
-- hungerspeed <Amount> - Set the rate at which players will become hungry (2 is the default).
GM.Config.hungerspeed = 0.5
-- starverate <Amount> - How much health that is taken away every second the player is starving  (3 is the default).
GM.Config.starverate = 1

--PATH gamemodes/darkrp/gamemode/modules/pp/cl_gravygun.lua:
hook.Add( "PhysgunPickup", "pprotect_physgun", function(ply, ent) return false end)
hook.Add( "GravGunPunt", "pprotect_push", function() return false end )

-- if SERVER then
-- hook.Add( "GravGunPunt", "pprotect_push1", function() return false end )
-- end
--PATH gamemodes/darkrp/gamemode/modules/police/sh_init.lua:
local plyMeta = FindMetaTable("Player")

--[[---------------------------------------------------------------------------
Interface functions
---------------------------------------------------------------------------]]
function plyMeta:isArrested()
    return self:getDarkRPVar("Arrested")
end

function plyMeta:isWanted()
    return self:getDarkRPVar("wanted")
end

function plyMeta:getWantedReason()
    return self:getDarkRPVar("wantedReason")
end

function plyMeta:isCP()
    if not IsValid(self) then return false end
    local Team = self:Team()
    return GAMEMODE.CivilProtection and GAMEMODE.CivilProtection[Team] or false
end

plyMeta.isMayor = fn.Compose{fn.Curry(fn.GetValue, 2)("mayor"), plyMeta.getJobTable}
plyMeta.isChief = fn.Compose{fn.Curry(fn.GetValue, 2)("chief"), plyMeta.getJobTable}


--[[---------------------------------------------------------------------------
Hooks
---------------------------------------------------------------------------]]

function DarkRP.hooks:canRequestWarrant(target, actor, reason)
    if not reason or string.len(reason) == 0 then return false, DarkRP.getPhrase("vote_specify_reason") end
    if not IsValid(target) then return false, DarkRP.getPhrase("suspect_doesnt_exist") end
    if not IsValid(actor) then return false, DarkRP.getPhrase("actor_doesnt_exist") end
    if not actor:Alive() then return false, DarkRP.getPhrase("must_be_alive_to_do_x", DarkRP.getPhrase("get_a_warrant")) end
    if target.warranted then return false, DarkRP.getPhrase("already_a_warrant") end
    if not actor:isCP() then return false, DarkRP.getPhrase("incorrect_job", DarkRP.getPhrase("get_a_warrant")) end

    return true
end

function DarkRP.hooks:canRemoveWarrant(target, actor)
    if not IsValid(target) then return false, DarkRP.getPhrase("suspect_doesnt_exist") end
    if not IsValid(actor) then return false, DarkRP.getPhrase("actor_doesnt_exist") end
    if not actor:Alive() then return false, DarkRP.getPhrase("must_be_alive_to_do_x", DarkRP.getPhrase("remove_a_warrant")) end
    if not target.warranted then return false, DarkRP.getPhrase("not_warranted") end
    if not actor:isCP() then return false, DarkRP.getPhrase("incorrect_job", DarkRP.getPhrase("remove_a_warrant")) end
    if actor:isArrested() then return false, DarkRP.getPhrase("unable", DarkRP.getPhrase("remove_a_warrant"), "") end

    return true
end

function DarkRP.hooks:canWanted(target, actor, reason)
    if not reason or string.len(reason) == 0 then return false, DarkRP.getPhrase("vote_specify_reason") end
    if not IsValid(target) then return false, DarkRP.getPhrase("suspect_doesnt_exist") end
    if not IsValid(actor) then return false, DarkRP.getPhrase("actor_doesnt_exist") end
    if not actor:Alive() then return false, DarkRP.getPhrase("must_be_alive_to_do_x", DarkRP.getPhrase("make_someone_wanted")) end
    if not actor:isCP() then return false, DarkRP.getPhrase("incorrect_job", DarkRP.getPhrase("make_someone_wanted")) end
    if target:isWanted() then return false, DarkRP.getPhrase("already_wanted") end
    if not target:Alive() then return false, DarkRP.getPhrase("suspect_must_be_alive_to_do_x", DarkRP.getPhrase("make_someone_wanted")) end
    if target:isArrested() then return false, DarkRP.getPhrase("suspect_already_arrested") end

    return true
end

function DarkRP.hooks:canUnwant(target, actor)
    if not IsValid(target) then return false, DarkRP.getPhrase("suspect_doesnt_exist") end
    if not IsValid(actor) then return false, DarkRP.getPhrase("actor_doesnt_exist") end
    if not actor:Alive() then return false, DarkRP.getPhrase("must_be_alive_to_do_x", DarkRP.getPhrase("remove_wanted_status")) end
    if not actor:isCP() then return false, DarkRP.getPhrase("incorrect_job", DarkRP.getPhrase("remove_wanted_status")) end
    if not target:isWanted() then return false, DarkRP.getPhrase("not_wanted") end
    if not target:Alive() then return false, DarkRP.getPhrase("suspect_must_be_alive_to_do_x", DarkRP.getPhrase("remove_wanted_status")) end

    return true
end

--[[---------------------------------------------------------------------------
Chat commands
---------------------------------------------------------------------------]]
for _, cmd in pairs{"cr", "911", "999", "112", "000"} do
    DarkRP.declareChatCommand{
        command = cmd,
        description = "Cry for help, the police will come (hopefully)!",
        delay = 1.5
    }
end

DarkRP.declareChatCommand{
    command = "warrant",
    description = "Get a search warrant for a certain player. With this warrant you can search their house.",
    delay = 1.5,
    condition = fn.FAnd{plyMeta.Alive, plyMeta.isCP, fn.Compose{fn.Not, plyMeta.isArrested}},
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "unwarrant",
    description = "Remove a search warrant for a certain player. With a warrant you can search their house.",
    delay = 1.5,
    condition = fn.FAnd{plyMeta.Alive, plyMeta.isCP, fn.Compose{fn.Not, plyMeta.isArrested}},
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "wanted",
    description = "Make a player wanted. This is needed to get them arrested.",
    delay = 1.5,
    condition = fn.FAnd{plyMeta.Alive, plyMeta.isCP, fn.Compose{fn.Not, plyMeta.isArrested}},
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "unwanted",
    description = "Remove a player's wanted status.",
    delay = 1.5,
    condition = fn.FAnd{plyMeta.Alive, plyMeta.isCP, fn.Compose{fn.Not, plyMeta.isArrested}}
}

DarkRP.declareChatCommand{
    command = "agenda",
    description = "Set the agenda.",
    delay = 1.5,
    condition = fn.Compose{fn.Not, fn.Curry(fn.Eq, 2)(nil), plyMeta.getAgenda}
}

DarkRP.declareChatCommand{
    command = "addagenda",
    description = "Add a line of text to the agenda.",
    delay = 1.5,
    condition = fn.Compose{fn.Not, fn.Curry(fn.Eq, 2)(nil), plyMeta.getAgenda}
}

DarkRP.declareChatCommand{
    command = "lockdown",
    description = "Start a lockdown. Everyone will have to stay inside.",
    delay = 1.5,
    condition = plyMeta.isMayor
}

DarkRP.declareChatCommand{
    command = "unlockdown",
    description = "Stop a lockdown.",
    delay = 1.5,
    condition = plyMeta.isMayor
}

DarkRP.declareChatCommand{
    command = "arrest",
    description = "Forcefully arrest a player.",
    delay = 0.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "unarrest",
    description = "Forcefully unarrest a player.",
    delay = 0.5,
    tableArgs = true
}

local noMayorExists = fn.Compose{fn.Null, fn.Curry(fn.Filter, 2)(plyMeta.isMayor), player.GetAll}
local noChiefExists = fn.Compose{fn.Null, fn.Curry(fn.Filter, 2)(plyMeta.isChief), player.GetAll}

DarkRP.declareChatCommand{
    command = "requestlicense",
    description = "Request a gun license.",
    delay = 1.5,
    condition = fn.FAnd {
        fn.FOr {
            fn.Curry(fn.Not, 2)(noMayorExists),
            fn.Curry(fn.Not, 2)(noChiefExists),
            fn.Compose{fn.Not, fn.Null, fn.Curry(fn.Filter, 2)(plyMeta.isCP), player.GetAll}
        },
        fn.Compose{fn.Not, fn.Curry(fn.Flip(plyMeta.getDarkRPVar), 2)("HasGunlicense")},
        fn.Compose{fn.Not, fn.Curry(fn.GetValue, 2)("LicenseRequested")}
    }
}

DarkRP.declareChatCommand{
    command = "givelicense",
    description = "Give someone a gun license",
    delay = 1.5,
    condition = fn.FOr{
        plyMeta.isMayor, -- Mayors can hand out licenses
        fn.FAnd{plyMeta.isChief, noMayorExists}, -- Chiefs can if there is no mayor
        fn.FAnd{plyMeta.isCP, noChiefExists, noMayorExists} -- CP's can if there are no chiefs nor mayors
    }
}

DarkRP.declareChatCommand{
    command = "demotelicense",
    description = "Start a vote to get someone's license revoked.",
    delay = 1.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "setlicense",
    description = "Forcefully give a player a license.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "unsetlicense",
    description = "Forcefully revoke a player's license.",
    delay = 1.5
}

--PATH gamemodes/darkrp/gamemode/modules/jobs/sh_commands.lua:
local plyMeta = FindMetaTable("Player")

DarkRP.declareChatCommand{
    command = "job",
    description = "Change your job name",
    delay = 1.5,
    condition = fn.Compose{fn.Not, plyMeta.isArrested}
}

DarkRP.declareChatCommand{
    command = "demote",
    description = "Demote a player from their job",
    delay = 1.5,
    condition = fn.Compose{fn.Curry(fn.Flip(fn.Gt), 2)(1), fn.Length, player.GetAll},
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "switchjob",
    description = "Switch jobs with the player you're looking at",
    delay = 1.5,
    condition = fn.Compose{fn.Curry(fn.GetValue, 2)("allowjobswitch"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}
}

DarkRP.declareChatCommand{
    command = "switchjobs",
    description = "Switch jobs with the player you're looking at",
    delay = 1.5,
    condition = fn.Compose{fn.Curry(fn.GetValue, 2)("allowjobswitch"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}
}

DarkRP.declareChatCommand{
    command = "jobswitch",
    description = "Switch jobs with the player you're looking at",
    delay = 1.5,
    condition = fn.Compose{fn.Curry(fn.GetValue, 2)("allowjobswitch"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}
}

DarkRP.declareChatCommand{
    command = "teamban",
    description = "Ban someone from getting a certain job",
    delay = 1.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "teamunban",
    description = "Undo a teamban",
    delay = 1.5,
    tableArgs = true
}

--PATH gamemodes/darkrp/gamemode/modules/fspectate/cl_init.lua:
FSpectate = {}

local stopSpectating, startFreeRoam
local isSpectating = false
local specEnt
local thirdperson = true
local isRoaming = false
local roamPos -- the position when roaming free
local roamVelocity = Vector(0)
local thirdPersonDistance = 100

/*---------------------------------------------------------------------------
Retrieve the current spectated player
---------------------------------------------------------------------------*/
function FSpectate.getSpecEnt()
    if isSpectating and not isRoaming then
        return IsValid(specEnt) and specEnt or nil
    else
        return nil
    end
end

/*---------------------------------------------------------------------------
startHooks
FAdmin tab buttons
---------------------------------------------------------------------------*/
hook.Add("Initialize", "FSpectate", function()
    surface.CreateFont("UiBold", {
        size = 16,
        weight = 800,
        antialias = true,
        shadow = false,
        font = "Default"})

    -- if not FAdmin then return end
    -- FAdmin.StartHooks["zzSpectate"] = function()
    --     FAdmin.Commands.AddCommand("Spectate", nil, "<Player>")

    --     -- Right click option
    --     FAdmin.ScoreBoard.Main.AddPlayerRightClick("Spectate", function(ply)
    --         if not IsValid(ply) then return end
    --         RunConsoleCommand("FSpectate", ply:UserID())
    --     end)

    --     local canSpectate = false
    --     CAMI.PlayerHasAccess(LocalPlayer(), "FSpectate", function(b, _)
    --         canSpectate = true
    --     end)

    --     -- Spectate option in player menu
    --     FAdmin.ScoreBoard.Player:AddActionButton("Spectate", "fadmin/icons/spectate", Color(0, 200, 0, 255), function(ply) return canSpectate and ply ~= LocalPlayer() end, function(ply)
    --         if not IsValid(ply) then return end
    --         RunConsoleCommand("FSpectate", ply:UserID())
    --     end)
    -- end
end)

/*---------------------------------------------------------------------------
Get the thirdperson position
---------------------------------------------------------------------------*/
local function getThirdPersonPos(ent)
    local aimvector = LocalPlayer():GetAimVector()
    local startPos = ent:IsPlayer() and ent:GetShootPos() or ent:LocalToWorld(ent:OBBCenter())
    local endpos = startPos - aimvector * thirdPersonDistance

    local tracer = {
        start = startPos,
        endpos = endpos,
        filter = specEnt
    }

    local trace = util.TraceLine(tracer)

    return trace.HitPos + trace.HitNormal * 10
end

/*---------------------------------------------------------------------------
Get the CalcView table
---------------------------------------------------------------------------*/
local view = {}
local function getCalcView()
    if not isRoaming then
        if thirdperson then
            view.origin = getThirdPersonPos(specEnt)
            view.angles = LocalPlayer():EyeAngles()
        else
            view.origin = specEnt:IsPlayer() and specEnt:GetShootPos() or specEnt:LocalToWorld(specEnt:OBBCenter())
            view.angles = specEnt:IsPlayer() and specEnt:EyeAngles() or specEnt:GetAngles()
        end

        roamPos = view.origin
        view.drawviewer = false

        return view
    end
    

    view.origin = roamPos
    view.angles = LocalPlayer():EyeAngles()
    view.drawviewer = true

    return view
end

/*---------------------------------------------------------------------------
specCalcView
Override the view for the player to look through the spectated player's eyes
---------------------------------------------------------------------------*/
local function specCalcView(ply, origin, angles, fov)
    if not IsValid(specEnt) and not isRoaming then
        startFreeRoam()
        return
    end

    view = getCalcView()

    if IsValid(specEnt) then
        specEnt:SetNoDraw(not thirdperson)
    end

    return view
end

/*---------------------------------------------------------------------------
Find the right player to spectate
---------------------------------------------------------------------------*/
local function findNearestObject()
    local aimvec = LocalPlayer():GetAimVector()

    local fromPos = not isRoaming and IsValid(specEnt) and specEnt:EyePos() or roamPos

    local lookingAt = util.QuickTrace(fromPos, aimvec * 5000, LocalPlayer())

    if IsValid(lookingAt.Entity) then return lookingAt.Entity end

    local foundPly, foundDot = nil, 0

    for _, ply in player.Iterator() do
        if ply == LocalPlayer() then continue end

        local pos = ply:GetShootPos()
        local dot = (pos - fromPos):GetNormalized():Dot(aimvec)

        -- Discard players you're not looking at
        if dot < 0.97 then continue end
        -- not a better alternative
        if dot < foundDot then continue end

        local trace = util.QuickTrace(fromPos, pos - fromPos, ply)

        if trace.Hit then continue end

        foundPly, foundDot = ply, dot
    end

    return foundPly
end

/*---------------------------------------------------------------------------
Spectate the person you're looking at while you're roaming
---------------------------------------------------------------------------*/
local function spectateLookingAt()
    local obj = findNearestObject()

    if not IsValid(obj) then return end

    isRoaming = false
    specEnt = obj

    net.Start("FSpectateTarget")
        net.WriteEntity(obj)
    net.SendToServer()
end

/*---------------------------------------------------------------------------
specBinds
Change binds to perform spectate specific tasks
---------------------------------------------------------------------------*/
-- Manual keysDown table, so I can return true in plyBindPress and still detect key presses
local keysDown = {}
local function specBinds(ply, bind, pressed)
    local key = input.LookupBinding(bind)

    if bind == "+jump" then
        stopSpectating()
        return true
    elseif bind == "+reload" and pressed then
        local pos = getCalcView()
        pos = pos.origin - Vector(0, 0, 64)
        -- RunConsoleCommand("FTPToPos", string.format("%d, %d, %d", pos.x, pos.y, pos.z),
        --     string.format("%d, %d, %d", roamVelocity.x, roamVelocity.y, roamVelocity.z))
        local pl = FSpectate.getSpecEnt()
        if pl and pl:IsPlayer() then
            RunConsoleCommand("ulx","goto",pl:Nick())
        else
            chat.AddText(Color(0,200,0),"Чтобы телепортироваться, вы должны наблюдать за игроком")
        end
        stopSpectating()
    elseif bind == "+attack" and pressed then
        if not isRoaming then
            startFreeRoam()
        else
            spectateLookingAt()
        end
        return true
    elseif bind == "+attack2" and pressed then
        if isRoaming then
            roamPos = roamPos + LocalPlayer():GetAimVector() * 500
            return true
        end
        thirdperson = not thirdperson

        return true
    elseif isRoaming and not LocalPlayer():KeyDown(IN_USE) then
        local keybind = string.lower(string.match(bind, "+([a-z A-Z 0-9]+)") or "")
        if not keybind or keybind == "use" or keybind == "showscores" or string.find(bind, "messagemode") then return end

        keysDown[keybind:upper()] = pressed

        return true
    elseif not isRoaming and thirdperson and (key == "MWHEELDOWN" or key == "MWHEELUP") then
        thirdPersonDistance = thirdPersonDistance + 10 * (key == "MWHEELDOWN" and 1 or -1)
    end
    -- Do not return otherwise, spectating admins should be able to move to avoid getting detected
end

/*---------------------------------------------------------------------------
Scoreboardshow
Set to main view when roaming, open on a player when spectating
---------------------------------------------------------------------------*/
local function fadminmenushow()
    if isRoaming then
        FAdmin.ScoreBoard.ChangeView("Main")
    elseif IsValid(specEnt) and specEnt:IsPlayer() then
        FAdmin.ScoreBoard.ChangeView("Main")
        FAdmin.ScoreBoard.ChangeView("Player", specEnt)
    end
end


/*---------------------------------------------------------------------------
RenderScreenspaceEffects
Draws the lines from players' eyes to where they are looking
---------------------------------------------------------------------------*/
local LineMat = Material("cable/new_cable_lit")
local linesToDraw = {}
local function lookingLines()
    if not linesToDraw[0] then return end

    render.SetMaterial(LineMat)

    cam.Start3D(view.origin, view.angles)
        for i = 0, #linesToDraw, 3 do
            render.DrawBeam(linesToDraw[i], linesToDraw[i + 1], 4, 0.01, 10, linesToDraw[i + 2])
        end
    cam.End3D()
end

/*---------------------------------------------------------------------------
gunpos
Gets the position of a player's gun
---------------------------------------------------------------------------*/
local function gunpos(ply)
    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) then return ply:EyePos() end
    local att = wep:GetAttachment(1)
    if not att then return ply:EyePos() end
    return att.Pos
end

/*---------------------------------------------------------------------------
Spectate think
Free roaming position updates
---------------------------------------------------------------------------*/
local function specThink()
    local ply = LocalPlayer()

    -- Update linesToDraw
    local pls = player.GetAll()
    local lastPly = 0
    local skip = 0
    for i = 0, #pls - 1 do
        local p = pls[i + 1]
        if not isRoaming and p == specEnt and not thirdperson then skip = skip + 3 continue end

        local tr = p:GetEyeTrace()
        local sp = gunpos(p)

        local pos = i * 3 - skip

        linesToDraw[pos] = tr.HitPos
        linesToDraw[pos + 1] = sp
        linesToDraw[pos + 2] = team.GetColor(p:Team())
        lastPly = i
    end

    -- Remove entries from linesToDraw that don't match with a player anymore
    for i = #linesToDraw, lastPly * 3 + 3, -1 do linesToDraw[i] = nil end

    if not isRoaming or keysDown["USE"] then return end

    local roamSpeed = 1000
    local aimVec = ply:GetAimVector()
    local direction
    local frametime = RealFrameTime()

    if keysDown["FORWARD"] then
        direction = aimVec
    elseif keysDown["BACK"] then
        direction = -aimVec
    end

    if keysDown["MOVELEFT"] then
        local right = aimVec:Angle():Right()
        direction = direction and (direction - right):GetNormalized() or -right
    elseif keysDown["MOVERIGHT"] then
        local right = aimVec:Angle():Right()
        direction = direction and (direction + right):GetNormalized() or right
    end

    if keysDown["SPEED"] then
        roamSpeed = 2500
    elseif keysDown["WALK"] or keysDown["DUCK"] then
        roamSpeed = 300
    end

    roamVelocity = (direction or Vector(0, 0, 0)) * roamSpeed

    roamPos = roamPos + roamVelocity * frametime
end

/*---------------------------------------------------------------------------
Draw help on the screen
---------------------------------------------------------------------------*/
local uiForeground, uiBackground = Color(240, 240, 255, 255), Color(20, 20, 20, 120)
local red = Color(255, 0, 0, 255)
local function drawHelp()
    local scrHalfH = math.floor(ScrH() / 2)
    --draw.WordBox(2, 10, scrHalfH, "Left click: (Un)select player to spectate", "UiBold", uiBackground, uiForeground)
    --draw.WordBox(2, 10, scrHalfH + 20, isRoaming and "Right click: quickly move forwards" or "Right click: toggle thirdperson", "UiBold", uiBackground, uiForeground)
    draw.WordBox(2, 10, scrHalfH + 40, "Пробел - прекратить следить", "UiBold", uiBackground, uiForeground)
    draw.WordBox(2, 10, scrHalfH + 60, "R - прекратить следить и ТП", "UiBold", uiBackground, uiForeground)
    draw.WordBox(2, 10, scrHalfH + 20, "W,A,S,D Передвижение", "UiBold", uiBackground, uiForeground)

    -- if FAdmin then
    --     draw.WordBox(2, 10, scrHalfH + 80, "Opening FAdmin's menu while spectating a player", "UiBold", uiBackground, uiForeground)
    --     draw.WordBox(2, 10, scrHalfH + 100, "\twill open their page!", "UiBold", uiBackground, uiForeground)
    -- end


    local target = findNearestObject()
    local pls = player.GetAll()
    for i = 1, #pls do
        local ply = pls[i]
        if not isRoaming and ply == specEnt then continue end

        local pos = ply:GetShootPos():ToScreen()
        if not pos.visible then continue end

        local x, y = pos.x, pos.y

        draw.RoundedBox(2, x, y - 6, 12, 12, team.GetColor(ply:Team()))
        draw.WordBox(2, x, y - 66, ply:Nick(), "UiBold", uiBackground, uiForeground)
        draw.WordBox(2, x, y - 46, "Жизни: " .. ply:Health(), "UiBold", uiBackground, uiForeground)
        draw.WordBox(2, x, y - 26, "Привелегия: " .. ply:GetUserGroup(), "UiBold", uiBackground, uiForeground)
    end

    if not isRoaming then return end

    if not IsValid(target) then return end

    local center = target:LocalToWorld(target:OBBCenter())
    local eyeAng = EyeAngles()
    local rightUp = eyeAng:Right() * 16 + eyeAng:Up() * 36
    local topRight = (center + rightUp):ToScreen()
    local bottomLeft = (center - rightUp):ToScreen()

    draw.RoundedBox(12, bottomLeft.x, bottomLeft.y, math.max(20, topRight.x - bottomLeft.x), topRight.y - bottomLeft.y, red)
    draw.WordBox(2, bottomLeft.x, bottomLeft.y + 12, "Левая кнопка - следить!", "UiBold", uiBackground, uiForeground)
end

/*---------------------------------------------------------------------------
Start roaming free, rather than spectating a given player
---------------------------------------------------------------------------*/
startFreeRoam = function()
    if IsValid(specEnt) and specEnt:IsPlayer() then
        roamPos = thirdperson and getThirdPersonPos(specEnt) or specEnt:GetShootPos()
        specEnt:SetNoDraw(false)
    else
        roamPos = isSpectating and roamPos or LocalPlayer():GetShootPos()
    end

    specEnt = nil
    isRoaming = true
    keysDown = {}
end

/*---------------------------------------------------------------------------
specEnt
Spectate a player
---------------------------------------------------------------------------*/
local function startSpectate(um)
    isRoaming = net.ReadBool()
    specEnt = net.ReadEntity()
    specEnt = IsValid(specEnt) and specEnt or nil

    if isRoaming then
        startFreeRoam()
    end

    isSpectating = true
    keysDown = {}

    hook.Add("CalcView", "FSpectate", specCalcView)
    hook.Add("PlayerBindPress", "FSpectate", specBinds)
    hook.Add("ShouldDrawLocalPlayer", "FSpectate", function() return isRoaming or thirdperson end)
    hook.Add("Think", "FSpectate", specThink)
    hook.Add("HUDPaint", "FSpectate", drawHelp)
    hook.Add("FAdmin_ShowFAdminMenu", "FSpectate", fadminmenushow)
    hook.Add("RenderScreenspaceEffects", "FSpectate", lookingLines)

    -- timer.Create("FSpectatePosUpdate", 3, 0, function()
    --     if not isRoaming then return end

    --     RunConsoleCommand("_FSpectatePosUpdate", roamPos.x, roamPos.y, roamPos.z)
    -- end)
end
net.Receive("FSpectate", startSpectate)

/*---------------------------------------------------------------------------
stopSpectating
Stop spectating a player
---------------------------------------------------------------------------*/
stopSpectating = function()
    hook.Remove("CalcView", "FSpectate")
    hook.Remove("PlayerBindPress", "FSpectate")
    hook.Remove("ShouldDrawLocalPlayer", "FSpectate")
    hook.Remove("Think", "FSpectate")
    hook.Remove("HUDPaint", "FSpectate")
    hook.Remove("FAdmin_ShowFAdminMenu", "FSpectate")
    hook.Remove("RenderScreenspaceEffects", "FSpectate")

    timer.Remove("FSpectatePosUpdate")

    if IsValid(specEnt) then
        specEnt:SetNoDraw(false)
    end

    RunConsoleCommand("FSpectate_StopSpectating")
    isSpectating = false
end

--PATH gamemodes/darkrp/gamemode/modules/customscripts/sh_swagahuy.lua:

local badhooks = {
	RenderScreenspaceEffects = {
		'RenderBloom',
		'RenderBokeh',
		'RenderColorModify',
		'RenderMotionBlur',
		'RenderMaterialOverlay',
		'RenderSharpen',
		'RenderSobel',
		'RenderStereoscopy',
		'RenderSunbeams',
		'RenderTexturize',
		'RenderToyTown',
	},
	PreDrawHalos = {
		'PropertiesHover'
	},
	RenderScene = {
		'RenderSuperDoF',
		'RenderStereoscopy',
	},
	PreRender = {
		'PreRenderFlameBlend',
	},
	PostRender = {
		'RenderFrameBlend',
		'PreRenderFrameBlend',
	},
	PostDrawEffects = {
		'RenderWidgets',
		'RenderHalos',
	},
	GUIMousePressed = {
		'SuperDOFMouseDown',
		'SuperDOFMouseUp'
	},
	Think = {
		'DOFThink',
		'CheckSchedules',
	},
	PlayerBindPress = {
		'PlayerOptionInput'
	},
	NeedsDepthPass = {
		'NeedsDepthPass_Bokeh',
	},
	OnGamemodeLoaded = {
		'CreateMenuBar',
	},
	CalcView = {
	    'rp_deathPOV',
	},
	DrawOverlay = {
	    'sandbox_search_progress',
	},
	PreventScreenClicks = {
	    'SuperDOFPreventClicks',
	},
	LoadGModSave = {
	    'LoadGModSave',
	},
	HUDPaint = {
	    'DrawRecordingIcon',
	},
}

local function RemoveHooks()
	for k, v in pairs(badhooks) do
		for _, h in ipairs(v) do
			hook.Remove(k, h)
		end
	end
end

hook.Add('InitPostEntity', 'RemoveHooks', RemoveHooks)
RemoveHooks()


local function noop() end

saverestore = {
	AddSaveHook 	= noop,
	AddRestoreHook 	= noop,
}

halo = {
	Add = noop,
}
--PATH gamemodes/darkrp/gamemode/modules/base/sh_simplerr.lua:
-- simplerrRun: Run a function with the given parameters and send any runtime errors to admins
DarkRP.simplerrRun = fc{
    fn.Snd, -- On success ignore the first return value
    simplerr.wrapError,
    simplerr.wrapHook,
    simplerr.wrapLog,
    simplerr.safeCall
}

-- error: throw a runtime error without exiting the stack
-- parameters: msg, [stackNr], [hints], [path], [line]
DarkRP.errorNoHalt = fc{
    simplerr.wrapHook,
    simplerr.wrapLog,
    simplerr.runError,
    function(msg, err, ...) return msg, err and err + 3 or 4, ... end -- Raise error level one higher
}

-- error: throw a runtime error
-- parameters: msg, [stackNr], [hints], [path], [line]
DarkRP.error = fc{
    simplerr.wrapError,
    DarkRP.errorNoHalt
}

-- Print errors from the server in the console and show a message in chat
if CLIENT then
    local function showError(count, errs)
        local one = count == 1
        chat.AddText(Color(255, 0, 0), string.format("There %s %i Lua problem%s!", one and "is" or "are", count, one and "" or 's'))
        chat.AddText(Color(255, 255, 255), "\tPlease check your console for more information!")

        for i = 1, count do
            MsgC(Color(137, 222, 255), errs[i] .. "\n")
        end
    end

    net.Receive("DarkRP_simplerrError", function()
        local count = net.ReadUInt(16)
        local errs = {}

        for i = 1, count do
            table.insert(errs, net.ReadString())
        end

        showError(count, errs)
    end)
    hook.Add("onSimplerrError", "DarkRP_Simplerr", function(err) showError(1, {err}) end)

    return
end

-- Serverside part
local plyMeta = FindMetaTable("Player")
util.AddNetworkString("DarkRP_simplerrError")

-- Send all errors to the client
local function sendErrors(plys, errs)
    local count = #errs
    local one = count == 1

    DarkRP.notify(plys, 1, 120, string.format("There %s %i Lua problem%s!\nPlease check your console for more information!", one and "is" or "are", count, one and "" or 's'))
    net.Start("DarkRP_simplerrError")
        net.WriteUInt(#errs, 16)
        fn.ForEach(fn.Flip(net.WriteString), errs)
    net.Send(plys)
end

-- Annoy all admins when an error occurs
local function annoyAdmins(err)
    local admins = fn.Filter(plyMeta.IsAdmin, player.GetAll())
    sendErrors(admins, {err})
end
hook.Add("onSimplerrError", "DarkRP_Simplerr", annoyAdmins)

-- Annoy joining admin with errors
local function annoyAdmin(ply)
    if not IsValid(ply) or not ply:IsAdmin() then return end
    local errs = table.Copy(simplerr.getLog())
    if #errs == 0 then return end

    fn.Map(fp{fn.GetValue, "err"}, errs)
    sendErrors(ply, errs)
end
hook.Add("PlayerInitialSpawn", "DarkRP_Simplerr", function(ply) timer.Simple(1, fp{annoyAdmin, ply}) end)

--PATH addons/111mod/lua/darkrp_modules/ui_markers/cl_markers.lua:
markers = {}

markers.tag = 'gmc_markers'

markers.list = {}

markers.AddMarker = function( marktitle, marktext, markicon, sound, position, color, time )
	if sound then surface.PlaySound( sound ) end
	table.insert( markers.list, { title = marktitle, text = marktext, icon = markicon and Material( markicon ) or nil, sound = sound, pos = position, time = time, endtime = CurTime() + time, color = color or Color( 255,120,0 ) } )
end

markers.receive = function()
	local markdata = net.ReadTable()
	markers.AddMarker( markdata.title, markdata.text, markdata.icon, markdata.sound, markdata.pos, markdata.color, markdata.time )
end

markers.GetHeight = function(t)
	surface.SetFont( 'DarkRPHUD2' )
	local w,h = surface.GetTextSize( t )
	return h
end

local HUD = {} -- backward

surface.CreateFont("hud_default", { size = 24, weight = 350, antialias = true, extended = true, font = "Roboto"})
surface.CreateFont("hud_default_shadow", { size = 24, weight = 350, antialias = true, blursize = 3, extended = true, font = "Roboto"})

surface.CreateFont("hud_normal", { size = 18, weight = 1000, antialias = true, extended = true, font = "Roboto"})
surface.CreateFont("hud_normal_shadow", { size = 18, weight = 1000, antialias = true, blursize = 3, extended = true, font = "Roboto"})

surface.CreateFont("hud_small", { size = 12, weight = 1000, antialias = true, extended = true, font = "Roboto"})
surface.CreateFont("hud_small_shadow", { size = 12, weight = 1000, antialias = true, blursize = 3, extended = true, font = "Roboto"})

local color_shadow_1 = Color(0,0,0,255)
local color_shadow_2 = Color(0,0,0,150)

local function gmodUnitToReal( units )
	
	return (units*0.75)*0.0254

end

function HUD.BlurShadowText(text, font, x, y, color, xalign, yalign)
	local w, h
	if yalign == TEXT_ALIGN_CENTER then
		surface.SetFont( font )
		w,h = surface.GetTextSize( text )
	end
	
	draw.DrawText(text, font .. "_shadow", x, yalign == TEXT_ALIGN_CENTER and y - h/2 or y, ColorAlpha( color_shadow_1, color.a ), xalign)
	draw.DrawText(text, font, x + 1, yalign == TEXT_ALIGN_CENTER and (y - h/2) + 1 or y + 1, ColorAlpha( color_shadow_2, color.a ), xalign)
	draw.DrawText(text, font, x, yalign == TEXT_ALIGN_CENTER and y - h/2 or y, color, xalign)
end

markers.HudPaint = function()
    for num, marker in pairs( markers.list ) do
        if CurTime() > marker.endtime then
            table.remove( markers.list, num )
            continue
        end
        local pos = marker.pos:ToScreen()
        local x, y, invisible = pos.x, pos.y, !pos.visible
        
        if invisible then
            continue
        end
        
        if marker.icon then
            local smooth = 2 + math.sin(CurTime()*2) * 4
            surface.SetMaterial( marker.icon )
            surface.SetDrawColor( 255, 255, 255 )
            surface.DrawTexturedRect( x-8, y-smooth, 16, 16 )
            
            y = y + 20
        end
        
        local title, height = marker.title, markers.GetHeight( marker.title )
        local text, text_height = marker.text, y + height + markers.GetHeight( marker.text ) - 2
		
        HUD.BlurShadowText( title, 'hud_normal', x, y, marker.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_LEFT )
        HUD.BlurShadowText( marker.text, 'hud_normal', x, y + height - 2, Color( 255,255,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_LEFT )
		HUD.BlurShadowText( string.format( '(%dм)', gmodUnitToReal(math.ceil(marker.pos:Distance(LocalPlayer():GetPos()))) ), 'hud_normal', x, text_height, Color( 255,255,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_LEFT )
    end
end
hook.Add( 'HUDPaint', markers.tag, markers.HudPaint )

net.Receive( markers.tag, markers.receive )
--PATH addons/111mod/lua/darkrp_modules/othermodules/cl_nlr.lua:

-----------------------------------------------------

-----------------------------------------------------
NLR_time = 250
--[[
function LaunchHelp()
	gui.OpenURL("https://www.google.ru/")
end
--]]
function IsPlayerDead()
	if !LocalPlayer():Alive() then
		hook.Call("OnPlayerDeath")
		hook.Remove("Think", "IsPlayerDead")
		hook.Add("Think", "IsPlayerAlive", IsPlayerAlive)
		DeathPos =  LocalPlayer():GetPos()
		IsDeadPoint = true 
		timer.Destroy("DrawDeadPoint")
		timer.Create("DrawDeadPoint", NLR_time, 1, function()
			IsDeadPoint = false 
		end)
	end
end
function IsPlayerAlive()
	if LocalPlayer():Alive() then
		hook.Call("OnPlayerSpawn")
		hook.Remove("Think", "IsPlayerAlive")
		hook.Add("Think", "IsPlayerDead", IsPlayerDead)
		--LaunchHelp()
	end
end
hook.Add("Think", "IsPlayerAlive", IsPlayerAlive)
--PATH addons/111mod/lua/darkrp_modules/othermodules/cl_chatimg.lua:





if _G.chathud_image_html and _G.chathud_image_html:IsValid() then 
	_G.chathud_image_html:Remove() 
end
	
_G.chathud_image_html = NULL

local urlRewriters =
{
	{ "^https?://imgur%.com/([a-zA-Z0-9_]+)$",      "http://i.imgur.com/%1.png" },
	{ "^https?://www%.imgur%.com/([a-zA-Z0-9_]+)$", "http://i.imgur.com/%1.png" }
}

local allowed = {
	gif = true,
	jpg = true,
	jpeg = true,
	png = true,
	webm = true,
	mp4 = true
}

local queue = {}

local busy

local sDCvar = 0.5
local hDCvar = 5

local function show_image(url)
	busy = true
	if chathud_image_html:IsValid() then 
		chathud_image_html:Remove() 
	end
	
	chathud_image_html = vgui.Create("DHTML")
	chathud_image_html:SetVisible(false)
	chathud_image_html:SetSize(ScrW(), ScrH())
	chathud_image_html:ParentToHUD()
	
	local ext = url:match(".+%.(.+)")
	if not ext then return end
		
	if ext == 'webm' then 
		chathud_image_html:SetHTML(
			string.format( [[ <html><head></head><body><video src="%s" width="%s" height="%s" autoplay></video><style type="text/css">body{ overflow:hidden; }</style></body></html>  ]], url, 500, 500 )	
		)
		hDCvar = 20
	elseif ext == 'mp4' then 
		chathud_image_html:SetHTML(
			string.format( [[ <html><head></head><body><video src="%s" width="%s" height="%s" autoplay></video><style type="text/css">body{ overflow:hidden; }</style></body></html>  ]], url, 500, 500 )	
		)
		hDCvar = 20
	else
	chathud_image_html:SetHTML(
		[[				
			<body>
				<img src="]] .. url .. [[" height="30%" />
			</body>
		]]

	)
	hDCvar = 5
	end
	-- Animation parameters
	local slideDuration = sDCvar
	local holdDuration = hDCvar
	local totalDuration = slideDuration * 2 + holdDuration
	
	-- Returns a value from 0 to 1
	-- 0: Fully off-screen
	-- 1: Fully on-screen
	local function getPositionFraction(t)
		if t < slideDuration then
			-- Slide in
			local normalizedT = t / slideDuration
			return math.cos((1 - normalizedT) * math.pi / 4)
		elseif t < slideDuration + holdDuration then
			-- Hold
			return 1
		else
			-- Slide out
			local t = t - slideDuration - holdDuration
			local normalizedT = t / slideDuration
			return math.cos(normalizedT * math.pi / 4)
		end
	end
	
	local start = nil
	hook.Add("Think", "chathud_image_url", function()
		if chathud_image_html:IsLoading() then return end
		
		if not chathud_image_html:IsVisible() then
			start = RealTime()
			chathud_image_html:SetVisible(true)
		end
		
		local t = RealTime() - start
		if t > totalDuration then
			if chathud_image_html:IsValid() then
				chathud_image_html:Remove()
			end
			hook.Remove("Think", "chathud_image_url")
			table.remove(queue, 1)
			busy = false
			return
		end
		
		chathud_image_html:SetPos(ScrW() * (getPositionFraction(t) - 1), 200)
	end)	
end

timer.Create("chathud_image_url_queue", 0.25, 0, function()
	if busy then return end
	local url = queue[1]
	if url then
		show_image(url)	
	end
end)

local cvar = CreateClientConVar("chathud_image_url", "1") or { GetInt = function() return 1 end }

hook.Add("OnPlayerChat", "chathud_image_url", function(ply, str)
	
	if not IsValid(ply) or str=="" then return end
	
	local num = cvar:GetInt()
		
	if num == 0 then return end
	
	if num == 1 and ply.IsFriend and not ply:IsFriend(LocalPlayer()) and ply ~= LocalPlayer() then 
		return
	end
	


	if str == "sh" then
		if chathud_image_html:IsValid() then
			chathud_image_html:Remove()
		end
		hook.Remove("Think", "chathud_image_url")
		queue = {}
		
		return
	end
		
	if str:find("http") then
		str = str:gsub("https:", "http:")
		
		str = str .. " "
		local url = str:match("(http://.-)%s")
		if not url then return end
		if !ply:IsSuperAdmin() then return end
		for _, rewriteRule in ipairs(urlRewriters) do
			url = string.gsub(url, rewriteRule[1], rewriteRule[2])
		end
		
		local ext = url:match(".+%.(.+)")
		if not ext then return end
		
		if not allowed[ext] then return end
		
		for k,v in pairs(queue) do
			if v == url then return end	
		end
		
		table.insert(queue, url)
	end
end)
--PATH addons/111mod/lua/darkrp_modules/menu/cl_color.lua:
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

local grdown = Material('gui/gradient_down', 'smooth')

function f4cosmeticstab(tabs)
    local tab = ui.Create('ui_panel')
    tab:SetSize(tabs:GetParent():GetWide() - ScrW() * 0.1285, tabs:GetParent():GetTall())
    local w, h = tab:GetWide() * 0.4, tab:GetTall()

    ui.Create('DButton', function(self, p)
        self:SetPos(0, 0)
        self:SetSize(w, h * 0.05)
        self:SetText('')
        self:SetDisabled(true)

        self.Paint = function(ss, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(126, 126, 126))
            surface.SetDrawColor(0, 0, 0, 100)
            surface.SetMaterial(grdown)
            surface.DrawTexturedRect(0, 0, w, h * 1.5)
            draw.SimpleText('Цвет модели', 'F4FancyButtonBold', w / 2, h / 2, color_white, 1, 1)
        end
    end, tab)

    ui.Create('DColorMixer', function(self, p)
        self:SetAlphaBar(false)
        self:SetSize(w, h * 0.35)
        self:SetPos(0, h * 0.05)
        self:SetVector(Vector(GetConVarString('cl_playercolor')))

        self.ValueChanged = function()
            local vec = self:GetVector()
            local vecstr = tostring(vec)

            timer.Create('rp.PlayerColor', 0.25, 1, function()
                RunConsoleCommand('cl_playercolor', vecstr)
                RunConsoleCommand('playercolor', vec.x, vec.y, vec.z)
            end)
        end
    end, tab)

    ui.Create('DButton', function(self, p)
        self:SetPos(0, h * 0.4)
        self:SetSize(w, h * 0.05)
        self:SetText('')
        self:SetDisabled(true)

        self.Paint = function(ss, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(126, 126, 126))
            surface.SetDrawColor(0, 0, 0, 100)
            surface.SetMaterial(grdown)
            surface.DrawTexturedRect(0, 0, w, h * 1.5)
            draw.SimpleText('Цвет физгана', 'F4FancyButtonBold', w / 2, h / 2, color_white, 1, 1)
        end
    end, tab)

    ui.Create('DColorMixer', function(self, p)
        self:SetAlphaBar(false)
        self:SetSize(w, h * 0.35)
        self:SetPos(0, h * 0.45)
        self:SetVector(Vector(GetConVarString('cl_weaponcolor')))

        self.ValueChanged = function()
            local vec = self:GetVector()
            local vecstr = tostring(vec)

            timer.Create('rp.WeaponnColor', 0.25, 1, function()
                RunConsoleCommand('cl_weaponcolor', vecstr)
                RunConsoleCommand('physcolor', vec.x, vec.y, vec.z)
            end)
        end
    end, tab)

    ui.Create('DButton', function(self, p)
        self:SetSize(w, h * 0.05)
        self:SetPos(0, h * 0.825)
        self:SetText('')

        self.DoClick = function()
            local min = math.Rand(10, 100000000)
            local max = math.Rand(10, 100000000)
            local a = math.Rand(-min, max)
            min = math.Rand(10, 100000000)
            max = math.Rand(10, 100000000)
            local b = math.Rand(-min, max)
            min = math.Rand(10, 100000000)
            max = math.Rand(10, 100000000)
            local c = math.Rand(-min, max)
            local vec = Vector(a, b, c)
            RunConsoleCommand('cl_weaponcolor', tostring(vec))
            RunConsoleCommand('physcolor', vec.x, vec.y, vec.z)
        end

        self.Paint = function(ss, w, h)
            draw.RoundedBox(8, 0, 0, w, h, Color(255, 255, 255))
            draw.SimpleText('Крейзи цвет физгана', 'F4FancyButton', w / 2, h / 2, color_black, 1, 1)
        end
    end, tab)

    ui.Create('DButton', function(self, p)
        self:SetPos(w + 2, 0)
        self:SetSize(tab:GetWide() - w - 2, h * 0.05)
        self:SetText('')
        self:SetDisabled(true)

        self.Paint = function(ss, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(126, 126, 126))
            surface.SetDrawColor(0, 0, 0, 100)
            surface.SetMaterial(grdown)
            surface.DrawTexturedRect(0, 0, w, h * 1.5)
            draw.SimpleText('Скины', 'F4FancyButtonBold', w / 2, h / 2, color_white, 1, 1)
        end
    end, tab)

    local listView = ui.Create('ui_listview', function(self, p)
        self:SetPadding(0)
        self:SetPos(w + 2, h * 0.05)
        self:SetSize(tab:GetWide() - w - 2, p:GetTall() - h * 0.25)
        self.Paint = function() end
    end, tab)

    local selectedMaterial
    local s = listView:GetWide() * .25
    local pnl
    local c = 0

    for k, v in pairs(WeaponMaterials) do
        if (c == 0) then
            pnl = ui.Create('DPanel', function(self)
                self:SetSize(s * 4, s)
            end)

            listView:AddItem(pnl)
        end

        ui.Create('DImageButton', function(self)
            self.Material = k
            self.Price = DarkRP.formatMoney(v)
            self:SetOnViewMaterial(k, "models/wireframe")
            self:SetSize(s, s)
            self:SetPos(c * s, 0)
            self:SetText('')

            self.PaintOver = function(self, w, h)
                surface.SetDrawColor((selectedMaterial == self) and ui.col.White or ui.col.Outline)
                surface.DrawOutlinedRect(0, 0, w, h)
            end

            self.DoClick = function()
                selectedMaterial = self
            end

            c = (c == 4) and 0 or (c + 1)
        end, pnl)
    end

    ui.Create('DButton', function(self, p)
        self:SetSize(tab:GetWide() - w - 2, h * 0.05)
        self:SetPos(w + 2, h * 0.825)
        self:SetText('')
		self.TextFancy = 'Выберите скин'

        self.DoClick = function()
            RunConsoleCommand('weaponmaterial', selectedMaterial.Material)
        end

        self.Think = function()
            local wep = LocalPlayer():GetActiveWeapon()

            --[[or (string.sub(wep:GetClass(), 0, 3) ~= 'swb' and string.sub(wep:GetClass(), 0, 3) ~= 'm9k']]
            if (not IsValid(wep)) then
                self:SetDisabled(true)
                self.TextFancy = 'Возьмите оружие для скина!'
            elseif IsValid(selectedMaterial) then
                self:SetDisabled(false)
                self.TextFancy = 'Купить скин за (' .. selectedMaterial.Price .. ')'
            else
                self:SetDisabled(true)
                self.TextFancy = 'Выберите скин'
            end
        end

		self.Paint = function(ss, w, h)
            draw.RoundedBox(8, 0, 0, w, h, Color(255, 255, 255))
            draw.SimpleText(self.TextFancy, 'F4FancyButton', w / 2, h / 2, color_black, 1, 1)
        end
    end, tab)

    return tab
end
--PATH addons/111mod/lua/darkrp_modules/arrestmenu/sh_init.lua:
DarkRP.arrestDistance = 400

DarkRP.maxJailTime = 600

DarkRP.arrestMenuDelay = 20

DarkRP.arrestDuration = {
	[0] = 100,
	[1] = 200,
	[2] = 300
}

DarkRP.arrestCooldown = 10
--PATH addons/111mod/lua/darkrp_customthings/demotegroups.lua:
--[[---------------------------------------------------------------------------
Demote groups
---------------------------------------------------------------------------
When a chief of police gets demoted you don't want them to be banned from becoming civil protection officer as well.
That is what demote groups are for.

When someone in a group is demoted, they will be banned from EVERY job in the group.
The examples shown below are the default demote groups

HOW TO CREATE A DEMOTE GROUP:
DarkRP.createDemoteGroup("Name of the group", {TEAM1, TEAM2})
---------------------------------------------------------------------------]]


-- Example: DarkRP.createDemoteGroup("Cops", {TEAM_POLICE, TEAM_CHIEF})
-- Example: DarkRP.createDemoteGroup("Gangsters", {TEAM_GANG, TEAM_MOB})

--PATH addons/grp_knife/lua/weapons/csgo_baseknife.lua:
AddCSLuaFile()

local TTT = ( GAMEMODE_NAME == "terrortown" or cvars.Bool("csgo_knives_force_ttt", false) )

DEFINE_BASECLASS( TTT and "weapon_tttbase" or "weapon_base" )

if ( SERVER ) then

  SWEP.Weight         = 5
  SWEP.AutoSwitchTo   = false
  SWEP.AutoSwitchFrom = false

  CreateConVar("csgo_knives_oldsounds", 0, FCVAR_ARCHIVE, "Play old sounds when swinging knife or hitting wall")
  CreateConVar("csgo_knives_backstabs", 1, FCVAR_ARCHIVE, "Allow backstabs")
  CreateConVar("csgo_knives_primary", 1, FCVAR_ARCHIVE, "Allow primary attacks")
  CreateConVar("csgo_knives_secondary", 1, FCVAR_ARCHIVE, "Allow secondary attacks")
  CreateConVar("csgo_knives_inspecting", 1, FCVAR_ARCHIVE, "Allow inspecting")
  CreateConVar("csgo_knives_force_ttt", 0, FCVAR_ARCHIVE, "Forces knives to enable TTT mode. For debug purposes. Normally you shouldn't enable it unless you haven't any trouble getting it work in ttt")
  CreateConVar("csgo_knives_decals", 1, FCVAR_ARCHIVE, "Paint wall decals when hit wall" )
  CreateConVar("csgo_knives_hiteffect", 1, FCVAR_ARCHIVE, "Draw effect when hit wall" )
  CreateConVar("csgo_knives_canbuy", 1, FCVAR_ARCHIVE, "Allow buying knives from traitor shop in TTT. May require server restarting if changing" )

  CreateConVar("csgo_knives_dmg_sec_back", 180, FCVAR_ARCHIVE, "How much damage deal when hit with secondary attack from behind")
  CreateConVar("csgo_knives_dmg_sec_front", 65, FCVAR_ARCHIVE, "How much damage deal when hit with secondary attack in front or from side")
  CreateConVar("csgo_knives_dmg_prim_back", 90, FCVAR_ARCHIVE, "How much damage deal when hit with primary attack from behind")
  CreateConVar("csgo_knives_dmg_prim_front1", 40, FCVAR_ARCHIVE, "How much damage deal when firstly hit with primary attack in front or from side")
  CreateConVar("csgo_knives_dmg_prim_front2", 25, FCVAR_ARCHIVE, "How much damage deal when subsequently hit with primary attack in front or from side")
end



if ( CLIENT ) then

  CreateClientConVar( "cl_csgo_knives_lefthanded", "0", true, false, "Flip knives viewmodel and hold knives on left hand" )

  SWEP.PrintName        = "CS:GO baseknife"
  SWEP.Slot             = TTT and 6 or 2
  SWEP.SlotPos          = 0
  SWEP.DrawAmmo         = false
  SWEP.DrawCrosshair    = true
  SWEP.ViewModelFOV     = 65
  SWEP.ViewModelFlip    = false
  SWEP.CSMuzzleFlashes  = true
  SWEP.UseHands         = true
  SWEP.ViewModelFlip    = cvars.Bool("cl_csgo_knives_lefthanded", false) -- ToDo

end

SWEP.Category              = "CS:GO Knives"

SWEP.Spawnable             = false
SWEP.AdminSpawnable        = false

--SWEP.ViewModel           = "models/weapons/v_csgo_default.mdl"
--SWEP.WorldModel          = "models/weapons/W_csgo_default.mdl"

SWEP.DrawWeaponInfoBox     = false

SWEP.Weight                = 5
SWEP.AutoSwitchTo          = false
SWEP.AutoSwitchFrom        = false

SWEP.Primary.ClipSize		  = -1
SWEP.Primary.Damage			  = -1
SWEP.Primary.DefaultClip   = -1
SWEP.Primary.Automatic     = true
SWEP.Primary.Ammo          = "none"


SWEP.Secondary.ClipSize    = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Damage      = -1
SWEP.Secondary.Automatic   = true
SWEP.Secondary.Ammo        = "none"

--- TTT config values

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
SWEP.CanBuy = nil -- We are not supposed to buy base knife

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
SWEP.Icon = "vgui/ttt/icon_nades" -- most generic icon I guess

function SWEP:SetupDataTables() --This also used for variable declaration and SetVar/GetVar getting work
  self:NetworkVar( "Float", 0, "InspectTime" )
  self:NetworkVar( "Float", 1, "IdleTime" )
end



function SWEP:Initialize()
  self:SetHoldType( self.AreDaggers and "fist" or "knife" ) -- Avoid using SetWeaponHoldType! Otherwise the players could hold it wrong!
end



-- PaintMaterial
function SWEP:DrawWorldModel()
  if self.PaintMaterial then
    self:SetMaterial( self.PaintMaterial or nil )
  else
    self:SetSkin( self.SkinIndex or self:GetSkin() or 0 )
  end
  self:DrawModel()
end



function SWEP:PreDrawViewModel( vm, weapon, ply )
  if not ( IsValid( vm ) and IsValid( weapon ) ) then
--    print( self, "PreDrawViewModel FAIL" )
    return
  end

--  print( self, "PreDrawViewModel", "vm", vm, vm:GetModel(), "\n",
--  "ply", ply, ply:GetModel(), "\n",
--  "weapon", weapon, weapon:GetModel(), "\n",
--  "weapon.PaintMaterial", weapon.PaintMaterial, "\n",
--  "weapon.SkinIndex", weapon.SkinIndex )

  if weapon.PaintMaterial then
    vm:SetMaterial( weapon.PaintMaterial or nil )
    vm:SetSkin( 0 )
  elseif weapon.SkinIndex then
    vm:SetMaterial( nil )
    vm:SetSkin( weapon.SkinIndex or vm:GetSkin() or 0 )
  else
    vm:SetMaterial( vm:GetMaterial() or nil )
    vm:SetSkin( vm:GetSkin() or 0 )
  end
end



function SWEP:Think()
  self.ViewModelFlip = cvars.Bool("cl_csgo_knives_lefthanded", false)
  if CurTime() >= self:GetIdleTime() then
    self:SendWeaponAnim( ACT_VM_IDLE )
    self:SetIdleTime( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
  end
end



function SWEP:Deploy()
  self:SetInspectTime( 0 )
  self:SetIdleTime( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
  self:SendWeaponAnim( ACT_VM_DRAW )
  self:SetNextPrimaryFire( CurTime() + 1 )
  self:SetNextSecondaryFire( CurTime() + 1 )
  return true
end



function SWEP:EntityFaceBack(ent)
  local angle = self.Owner:GetAngles().y -ent:GetAngles().y
  if angle < -180 then angle = 360 + angle end
  if angle <= 90 and angle >= -90 then return true end
  return false
end



function SWEP:FindHullIntersection(VecSrc, tr, Mins, Maxs, pEntity)

  local VecHullEnd = VecSrc + ((tr.HitPos - VecSrc) * 2)

  local tracedata = {}

  tracedata.start  = VecSrc
  tracedata.endpos = VecHullEnd
  tracedata.filter = pEntity
  tracedata.mask   = MASK_SOLID
  tracedata.mins   = Mins
  tracedata.maxs   = Maxs

  local tmpTrace = util.TraceLine( tracedata )

  if tmpTrace.Hit then
    tr = tmpTrace
    return tr
  end

  local Distance = 999999

  for i = 0, 1 do
    for j = 0, 1 do
      for k = 0, 1 do

        local VecEnd = Vector()

        VecEnd.x = VecHullEnd.x + (i > 0 and Maxs.x or Mins.x)
        VecEnd.y = VecHullEnd.y + (j > 0 and Maxs.y or Mins.y)
        VecEnd.z = VecHullEnd.z + (k > 0 and Maxs.z or Mins.z)

        tracedata.endpos = VecEnd

        tmpTrace = util.TraceLine( tracedata )

        if tmpTrace.Hit then
          local ThisDistance = (tmpTrace.HitPos - VecSrc):Length()
          if (ThisDistance < Distance) then
            tr = tmpTrace
            Distance = ThisDistance
          end
        end
      end -- for k
    end -- for j
  end --for i

  return tr
end



function SWEP:PrimaryAttack()
  local prim = cvars.Bool("csgo_knives_primary", true)
  local sec  = cvars.Bool("csgo_knives_secondary", true)
  if not ( prim or sec ) or ( CurTime() < self:GetNextPrimaryFire() ) then return end
  self:DoAttack( not prim ) -- If we can do primary attack, do it. Otherwise - do secondary.
end



function SWEP:SecondaryAttack()
  local prim = cvars.Bool("csgo_knives_primary", true)
  local sec  = cvars.Bool("csgo_knives_secondary", true)
  if not ( prim or sec ) or ( CurTime() < self:GetNextSecondaryFire() ) then return end
  self:DoAttack( sec ) -- If we can do secondary attack, do it. Otherwise - do primary.
end



function SWEP:DoAttack( Altfire )
  local Attacker  = self:GetOwner()
  local Range     = Altfire and 48 or 64

  Attacker:LagCompensation(true)

  local Forward   = Attacker:GetAimVector()
  local AttackSrc = Attacker:GetShootPos()
  local AttackEnd = AttackSrc + Forward * Range

  local tracedata = {}

  tracedata.start   = AttackSrc
  tracedata.endpos  = AttackEnd
  tracedata.filter  = Attacker
  tracedata.mask    = MASK_SOLID
  tracedata.mins    = Vector( -16, -16, -18 ) -- head_hull_mins
  tracedata.maxs    = Vector( 16, 16, 18 ) -- head_hull_maxs

  local tr = util.TraceLine( tracedata )
  if not tr.Hit then tr = util.TraceHull( tracedata ) end
  if tr.Hit and ( not (IsValid(tr.Entity) and tr.Entity) or tr.HitWorld ) then
    -- Calculate the point of intersection of the line (or hull) and the object we hit
    -- This is and approximation of the "best" intersection
    local HullDuckMins, HullDuckMaxs = Attacker:GetHullDuck()
    tr = self:FindHullIntersection(AttackSrc, tr, HullDuckMins, HullDuckMaxs, Attacker)
    AttackEnd = tr.HitPos -- This is the point on the actual surface (the hull could have hit space)
  end

  local DidHit = tr.Hit and not tr.HitSky
  local HitEntity = IsValid(tr.Entity) and tr.Entity or Entity(0) -- Ugly hack to destroy glass surf. 0 is worldspawn.
  local DidHitPlrOrNPC = HitEntity and ( HitEntity:IsPlayer() or HitEntity:IsNPC() ) and IsValid( HitEntity )

  local FirstHit = not Altfire and ( ( self:GetNextPrimaryFire() + 0.4 ) < CurTime() ) -- First swing does full damage, subsequent swings do less

  tr.HitGroup = HITGROUP_GENERIC -- Hack to disable damage scaling. No matter where we hit it, the damage should be as is.

  -- Calculate damage and deal hurt if we can
  local Backstab   = cvars.Bool("csgo_knives_backstabs", true) and DidHitPlrOrNPC and self:EntityFaceBack( HitEntity ) -- Because we can only backstab creatures
  local RMB_BACK   = cvars.Number("csgo_knives_dmg_sec_back", 180)
  local RMB_FRONT  = cvars.Number("csgo_knives_dmg_sec_front", 65)
  local LMB_BACK   = cvars.Number("csgo_knives_dmg_prim_back", 90)
  local LMB_FRONT1 = cvars.Number("csgo_knives_dmg_prim_front1", 40)
  local LMB_FRONT2 = cvars.Number("csgo_knives_dmg_prim_front2", 25)

  local Damage = ( Altfire and ( Backstab and RMB_BACK or RMB_FRONT ) ) or ( Backstab and LMB_BACK ) or ( FirstHit and LMB_FRONT1 ) or LMB_FRONT2

  local Force = Forward:GetNormalized() * 300 * cvars.Number("phys_pushscale", 1) -- simplified result of CalculateMeleeDamageForce()

  local damageinfo = DamageInfo()

  damageinfo:SetAttacker( Attacker )
  damageinfo:SetInflictor( self )
  damageinfo:SetDamage( Damage )
  damageinfo:SetDamageType( bit.bor( DMG_BULLET , DMG_NEVERGIB ) )
  damageinfo:SetDamageForce( Force )
  damageinfo:SetDamagePosition( AttackEnd )

  HitEntity:DispatchTraceAttack( damageinfo, tr, Forward )

  if tr.HitWorld and not tr.HitSky then --and ( game.SinglePlayer() or CLIENT ) 

    if cvars.Bool("csgo_knives_decals", true) then util.Decal( "ManhackCut", AttackSrc - Forward, AttackEnd + Forward, true ) end

    if cvars.Bool("csgo_knives_hiteffect", true) then
      local effectdata = EffectData()
      effectdata:SetOrigin( tr.HitPos + tr.HitNormal )
      effectdata:SetStart( tr.StartPos )
      effectdata:SetSurfaceProp( tr.SurfaceProps )
      effectdata:SetDamageType( DMG_SLASH )
      effectdata:SetHitBox( tr.HitBox )
      effectdata:SetNormal( tr.HitNormal )
      effectdata:SetEntity( tr.Entity )
      effectdata:SetAngles( Forward:Angle() )
      util.Effect( "csgo_knifeimpact", effectdata )
    end
  end

  -- Change next attack time
  local NextAttack = CurTime() + ( Altfire and 1.0 or DidHit and 0.5 or 0.4 )
  self:SetNextPrimaryFire( NextAttack )
  self:SetNextSecondaryFire( NextAttack )

  -- Send animation to attacker
  Attacker:SetAnimation( PLAYER_ATTACK1 )

  -- Send animation to viewmodel
  local Act = DidHit and ( Altfire and ( Backstab and ACT_VM_SWINGHARD or ACT_VM_HITCENTER2 ) or ( Backstab and ACT_VM_SWINGHIT or ACT_VM_HITCENTER ) ) or ( Altfire and ACT_VM_MISSCENTER2 or ACT_VM_MISSCENTER )
  if Act then
    self:SendWeaponAnim( Act )
    self:SetIdleTime( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
  end

  -- Play sound
  -- Sound("...") were added to precache sounds
  local Oldsounds   = cvars.Bool("csgo_knives_oldsounds", false)
  local StabSnd     = Sound("csgo_knife.Stab")
  local HitSnd      = Sound("csgo_knife.Hit")
  local HitwallSnd  = Oldsounds and Sound("csgo_knife.HitWall_old") or Sound("csgo_knife.HitWall")
  local SlashSnd    = Oldsounds and Sound("csgo_knife.Slash_old") or Sound("csgo_knife.Slash")

  local Snd = DidHitPlrOrNPC and ( Altfire and StabSnd or HitSnd ) or DidHit and HitwallSnd or SlashSnd
  self:EmitSound( Snd )

  Attacker:LagCompensation(false) -- Don't forget to disable it!
end



function SWEP:Reload()
  if self.Owner:IsNPC() then return end -- NPCs aren't supposed to reload it

  local keydown = self.Owner:KeyDown(IN_ATTACK) or self.Owner:KeyDown(IN_ATTACK2) or self.Owner:KeyDown(IN_ZOOM)
  if not cvars.Bool("csgo_knives_inspecting", true) or keydown then return end

  local getseq = self:GetSequence()
  local act = self:GetSequenceActivity(getseq) --GetActivity() method doesn't work :\
  if ( act == ACT_VM_IDLE_LOWERED and CurTime() < self:GetInspectTime() ) then
    self:SetInspectTime( CurTime() + 0.1 ) -- We should press R repeately instead of holding it to loop
    return end

  self:SendWeaponAnim(ACT_VM_IDLE_LOWERED)
  self:SetIdleTime( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
  self:SetInspectTime( CurTime() + 0.1 )
end



function SWEP:Holster( wep )
  return true
end



function SWEP:OnRemove()
end



function SWEP:OwnerChanged()
end

--YOU'RE WINNER!

--PATH addons/grp_knife/lua/weapons/csgo_bayonet.lua:
if not file.Exists( "weapons/csgo_baseknife.lua", "LUA" ) then
  SWEP.Spawnable = false
  print( "csgo_bayonet failed to initialize: csgo_baseknife.lua not found. Did you install the main part?" )
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

SWEP.PrintName      = "Bayonet Knife"
SWEP.Category       = "CS:GO Knives"

SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

SWEP.ViewModel      = "models/weapons/v_csgo_bayonet.mdl"
SWEP.WorldModel     = "models/weapons/w_csgo_bayonet.mdl"

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
SWEP.Icon = "vgui/entities/csgo_bayonet.vmt"

--PATH addons/cp_ballistic_shields/lua/weapons/deployable_shield/shared.lua:
if SERVER then 
	include( "ballistic_shields/sh_bs_util.lua" ) 
	include( "ballistic_shields/sv_bs_util.lua" ) 
end
include( "bs_config.lua" ) 
include( "ballistic_shields/sh_bs_lang.lua" ) 


SWEP.PrintName = "Ломаемый щит"
SWEP.Author	= "D3G"
SWEP.Instructions = "LMB - Deploy shield | RMB - Toggle visibility"
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModel = ""
SWEP.WorldModel = "models/bshields/dshield.mdl"

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

local ShieldIcon = Material("bshields/ui/deployable_shield", "smooth")
local ShieldIconClosed = Material("bshields/ui/deployable_shield_closed", "smooth")
local BackgroundIcon = Material("bshields/ui/background")
function SWEP:DrawHUD()
	if(bshields.config.disablehud) then return end
	surface.SetDrawColor(255,255,255,200)	
	surface.SetMaterial(BackgroundIcon)
	surface.DrawTexturedRect( ScrW()/2-ScrH()/10, ScrH()/2-ScrH()/30+ScrH()/3, ScrH()/5, ScrH()/15)

	local aim = LocalPlayer():GetAimVector()
	local tr = util.TraceLine( {
		start  = LocalPlayer():GetShootPos() ,
		endpos = LocalPlayer():GetShootPos() + aim * 120,
		filter = LocalPlayer()
	} )
	surface.SetDrawColor(255,255,255,125)
	if(tr.HitPos:DistToSqr(LocalPlayer():GetPos()))>550 && tr.HitPos.z<=(LocalPlayer():GetPos().z+30) && (tr.HitWorld || (IsValid(tr.Entity) && tr.Entity:GetClass() == "prop_physics")) then
		draw.SimpleTextOutlined( bshields.lang[bshields.config.language].dshieldprim, "bshields.HudFont", ScrW()/2-ScrH()/32, ScrH()/2-ScrH()/28+ScrH()/3+ScrH()/22, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(20,20,20,255)) 
		surface.SetMaterial(ShieldIcon)
	else
		draw.SimpleTextOutlined( bshields.lang[bshields.config.language].dshieldprim, "bshields.HudFont", ScrW()/2-ScrH()/32, ScrH()/2-ScrH()/28+ScrH()/3+ScrH()/22, Color( 255, 255, 255, 25 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(20,20,20,255)) 
		surface.SetMaterial(ShieldIconClosed)
	end
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
		owner.bs_shield = ents.Create("bs_dshield")
		owner.bs_shield:SetCollisionGroup( COLLISION_GROUP_DEBRIS  )
		owner.bs_shield:SetMoveType( MOVETYPE_NONE ) 
		owner.bs_shield:SetPos(owner:GetPos())
		owner.bs_shield:SetParent( owner, owner:LookupAttachment(holdtype[2])) 
		owner.bs_shield:SetLocalAngles( bshields.shields[holdtype[1]][2].angles ) 
		owner.bs_shield:SetLocalPos( bshields.shields[holdtype[1]][2].position ) 
		owner.bs_shield:Spawn()
		net.Start( "bs_shield_info" )
		net.WriteUInt( owner.bs_shield:EntIndex(), 16 ) 
		net.Send( owner )
	end
end

function SWEP:PrimaryAttack()
	if SERVER then
		local owner = self:GetOwner()
		local aim = owner:GetAimVector()
		local tr = util.TraceLine( {
			start  = owner:GetShootPos() ,
			endpos = owner:GetShootPos() + aim * 120,
			filter = owner
		} )
		if(tr.HitPos:DistToSqr(owner:GetPos()))>550 && tr.HitPos.z<=(owner:GetPos().z+30) && (tr.HitWorld || (IsValid(tr.Entity) && tr.Entity:GetClass() == "prop_physics")) then
			shield = ents.Create("bs_shield")
			shield:SetPos(tr.HitPos + Vector(0,0,28.5) - aim * 10)
			shield:SetAngles(Angle(0,aim:Angle().y,0))
			shield:Spawn()
			shield:EmitSound( "npc/combine_soldier/gear1.wav" )
			shield.Owner = owner
			bshield_remove(owner)
			owner:StripWeapon( "deployable_shield" )
			table.insert(owner.bs_shields, shield)
			if(table.Count(owner.bs_shields)>bshields.config.maxshields) then
				if(IsValid(owner.bs_shields[1])) then owner.bs_shields[1]:Remove() end
				table.remove(owner.bs_shields, 1) 
			end
		end
		self:SetNextPrimaryFire( CurTime() + 0.5 )
	end
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

--PATH addons/cp_bricks_enchanced_sweps/lua/weapons/dsr_lockpick.lua:

AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "Lock Pick"
    SWEP.Slot = 5
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

SWEP.Author = "Brickwall"
SWEP.Category = "DarkRP SWEP Replacements" -- change the name
SWEP.Instructions = "Left/Right click to lockpick a door!"

SWEP.Spawnable = true

SWEP.ViewModel = Model( "models/sterling/c_enhanced_lockpicks.mdl" ) -- just change the model 
SWEP.WorldModel = ( "models/sterling/w_enhanced_lockpicks.mdl" )
SWEP.ViewModelFOV = 85
SWEP.UseHands = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

SWEP.Base = "weapon_base"

SWEP.Secondary.Ammo = "none"

function SWEP:Initialize()
	self:SetWeaponHoldType( "pistol" )
end

function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "IsLockpicking")
    self:NetworkVar("Bool", 1, "IsStuck")
    self:NetworkVar("Float", 0, "LockpickStartTime")
    self:NetworkVar("Float", 1, "LockpickEndTime")
    self:NetworkVar("Float", 2, "NextSoundTime")
    self:NetworkVar("Int", 0, "ClickTime")
    self:NetworkVar("Int", 1, "Stage")
    self:NetworkVar("Entity", 0, "LockpickEnt")
end

--[[-------------------------------------------------------
Name: SWEP:PrimaryAttack()
Desc: +attack1 has been pressed
---------------------------------------------------------]]
function SWEP:CreateProgressStages()
    self.ProgressStages = {}
    local TotalPercent = 0
    for i = 1, BES.CONFIG.Lockpick.ClicksReq+1 do
        if( i != BES.CONFIG.Lockpick.ClicksReq+1 ) then
            local percent = math.random( (100/(BES.CONFIG.Lockpick.ClicksReq+1))*0.9, (100/(BES.CONFIG.Lockpick.ClicksReq+1)) )
            self.ProgressStages[i] = percent
            TotalPercent = TotalPercent+percent
        else
            self.ProgressStages[i] = 100-TotalPercent
        end
    end
end

function SWEP:PrimaryAttack()
    local function RunAnimation()
		if( IsValid( self ) ) then
			local VModel = self.Owner:GetViewModel()
			local EnumToSeq = VModel:SelectWeightedSequence( ACT_VM_PRIMARYATTACK )
			VModel:SendViewModelMatchingSequence( EnumToSeq )
		end
	end
    
    self:SetNextPrimaryFire(CurTime() + 0.25)
    self:SetNextSecondaryFire(CurTime() + 0.25)
	
    if self:GetIsLockpicking() then 
        if( self:GetIsStuck() ) then
			if( not self.ProgressStages ) then
				self:CreateProgressStages()
			end
			
            RunAnimation()
            self:SetIsStuck( false )
            self:SetStage( self:GetStage()+1 )
            self:SetLockpickStartTime( CurTime() )
            self:SetLockpickEndTime( CurTime() + (self.ProgressStages[self:GetStage()]/100)*BES.CONFIG.Lockpick.Time)

            local total = 0
            for k, v in pairs( self.ProgressStages ) do
                if( k >= self:GetStage() ) then continue end
                total = total+v
            end
            self.PreviousPercent = total
        else
            self:Fail()
        end
        return    
    end

    self:GetOwner():LagCompensation(true)
    local trace = self:GetOwner():GetEyeTrace()
    self:GetOwner():LagCompensation(false)
    local ent = trace.Entity

    if not IsValid(ent) or ent.DarkRPCanLockpick == false then return end
    local canLockpick = hook.Call("canLockpick", nil, self:GetOwner(), ent, trace)

    if canLockpick == false then return end
    if canLockpick ~= true and (
            trace.HitPos:DistToSqr(self:GetOwner():GetShootPos()) > 4000 or
            (not GAMEMODE.Config.canforcedooropen and ent:getKeysNonOwnable()) or
            (not ent:isDoor() and not ent:IsVehicle() and not string.find(string.lower(ent:GetClass()), "vehicle") and (not GAMEMODE.Config.lockpickfading or not ent.isFadingDoor))
        ) then
        return
    end
	
	self:CreateProgressStages()

    self:SetHoldType("pistol")

    self:SetIsStuck( false )
    self:SetStage( 1 )
    self:SetIsLockpicking(true)
    self:SetLockpickEnt(ent)
    self:SetLockpickStartTime(CurTime())
    self:SetLockpickEndTime(CurTime() + (self.ProgressStages[self:GetStage()]/100)*BES.CONFIG.Lockpick.Time)

    RunAnimation()

    self.PreviousPercent = 0

    if IsFirstTimePredicted() then
        hook.Call("lockpickStarted", nil, self:GetOwner(), ent, trace)
    end

    local onFail = function(ply) if ply == self:GetOwner() then hook.Call("onLockpickCompleted", nil, ply, false, ent) end end

    -- Lockpick fails when dying or disconnecting
    hook.Add("PlayerDeath", self, fc{onFail, fn.Flip(fn.Const)})
    hook.Add("PlayerDisconnected", self, fc{onFail, fn.Flip(fn.Const)})
    -- Remove hooks when finished
    hook.Add("onLockpickCompleted", self, fc{fp{hook.Remove, "PlayerDisconnected", self}, fp{hook.Remove, "PlayerDeath", self}})
end

function SWEP:Holster()
    if( CLIENT ) then
        BES_HINT_LOCKPICK = false
    end

    self:SetIsLockpicking(false)
    self:SetLockpickEnt(nil)
    return true
end

function SWEP:Succeed()
    self:SetHoldType("normal")

    local ent = self:GetLockpickEnt()
    self:SetIsLockpicking(false)
    self:SetLockpickEnt(nil)

    if not IsValid(ent) then return end

    local override = hook.Call("onLockpickCompleted", nil, self:GetOwner(), true, ent)

    if override then return end

    if ent.isFadingDoor and ent.fadeActivate and not ent.fadeActive then
        ent:fadeActivate()
        if IsFirstTimePredicted() then timer.Simple(5, function() if IsValid(ent) and ent.fadeActive then ent:fadeDeactivate() end end) end
    elseif ent.Fire then
        ent:keysUnLock()
        ent:Fire("open", "", .6)
        ent:Fire("setanimation", "open", .6)
	end
	
    self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
    
    self:SetIsStuck( false )
    self:SetStage( 1 )
end

function SWEP:Fail()
    self:SetIsLockpicking(false)
    self:SetHoldType("normal")

    hook.Call("onLockpickCompleted", nil, self:GetOwner(), false, self:GetLockpickEnt())
	self:SetLockpickEnt(nil)
    self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
    
    self:SetIsStuck( false )
    self:SetStage( 1 )
end

function SWEP:Stuck()
    self:SetIsStuck( true )
    self:SetClickTime( CurTime()+BES.CONFIG.Lockpick.ClickTime )
    self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
end

function SWEP:Think()
    if not self:GetIsLockpicking() or self:GetLockpickEndTime() == 0 then return end

    if not self:GetIsStuck() and CurTime() >= self:GetNextSoundTime() then
        self:SetNextSoundTime(CurTime() + 1)
        local snd = {1,3,4}
        self:EmitSound("weapons/357/357_reload" .. tostring(snd[math.Round(util.SharedRandom("DarkRP_LockpickSnd" .. CurTime(), 1, #snd))]) .. ".wav", 50, 100)
    end

    local trace = self:GetOwner():GetEyeTrace()
    if not IsValid(trace.Entity) or trace.Entity ~= self:GetLockpickEnt() or trace.HitPos:DistToSqr(self:GetOwner():GetShootPos()) > 4000 then
        self:Fail()
    elseif self:GetLockpickEndTime() <= CurTime() and self:GetStage() == #self.ProgressStages then
        self:Succeed()
    end

    if( not self:GetIsStuck() and CurTime() >= self:GetLockpickEndTime() ) then
        self:Stuck()
    elseif( self:GetIsStuck() and CurTime() >= self:GetClickTime() ) then
        self:Fail()
        if( CLIENT and not BES_HINT_LOCKPICK ) then
            notification.AddLegacy( "HINT: Press LMB/RMB when the lockpick gets stuck!", 1, 5 )
            BES_HINT_LOCKPICK = true
        end
    end
end

if( CLIENT ) then
    local w = ScrW()
    local h = ScrH()
    local x, y, width, height = w / 2 - w / 10, (h / 4)*3 - (h / 15 + 20)/2, w / 5, h / 15
    local hHeight = 20
    local sizet = 9
    function SWEP:DrawHUD()
        if not self:GetIsLockpicking() or self:GetLockpickEndTime() == 0 then return end

        surface.SetDrawColor( BES.CONFIG.Themes.Secondary )
        surface.DrawRect( x, y, width, height+hHeight )

        local CurStagePercent = self.ProgressStages[self:GetStage()]
        local time = self:GetLockpickEndTime() - self:GetLockpickStartTime()
        local curtime = CurTime() - self:GetLockpickStartTime()
        local status = math.Clamp( ((curtime / time)*(CurStagePercent/100))+(self.PreviousPercent/100), 0, (self.PreviousPercent+CurStagePercent)/100)
        local BarWidth = status * (width - sizet)

        surface.SetDrawColor( BES.CONFIG.Themes.Tertiary )
        surface.DrawRect( x + sizet/2, y + sizet/2, width-sizet, height - sizet )

        surface.SetDrawColor( HSVToColor( 90*status, 1, 1 ) )
        surface.DrawRect( x + sizet/2, y + sizet/2, BarWidth, height - sizet )
        surface.SetDrawColor( 80, 80, 80, 200 )
        surface.DrawRect( x + sizet/2, y + sizet/2, BarWidth, height - sizet )

        if( BES.CONFIG.Lockpick.ShowHint and self:GetIsStuck() ) then
            draw.DrawNonParsedSimpleText( "Click", "BES_UniSans_30", w / 2, y + height / 2, BES.CONFIG.Themes.Text, 1, 1)
        end

        local status2 = (self:GetIsStuck() and (self:GetClickTime()-CurTime())/BES.CONFIG.Lockpick.ClickTime) or 1
        local BarWidth2 = status2 * (width - sizet)
        surface.SetDrawColor( BES.CONFIG.Themes.Tertiary )
        surface.DrawRect( x + sizet/2, y + height, (width - sizet), hHeight - sizet/2 )
        surface.SetDrawColor( BES.CONFIG.Themes.Red )
        surface.DrawRect( x + sizet/2, y + height, BarWidth2, hHeight - sizet/2 )
    end
end

function SWEP:SecondaryAttack()
    self:PrimaryAttack()
end
--PATH addons/weaponandcontent/lua/weapons/galil/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "Galil"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-2.964, -1.611, 1.527)
	SWEP.AimAng = Vector(0.041, 0, 0)
	
	SWEP.SprintPos = Vector(5.906, -3.386, 2.44)
	SWEP.SprintAng = Vector(-18.466, 64.212, 0)
	
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "v"
	--killicon.AddFont("swb_galil", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_med"
end

SWEP.PlayBackRate = 3
SWEP.PlayBackRateSV = 3
SWEP.SpeedDec = 30
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
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel				= "models/weapons/2_rif_galil.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rif_galil.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 35
SWEP.Primary.DefaultClip	= 35
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.FireDelay = 0.08
SWEP.FireSound = Sound("Alt_Weapon_Galil.1")	
SWEP.Recoil = 0.4

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.0035
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 24
SWEP.DeployTime = 1
--PATH addons/weaponandcontent/lua/weapons/m4a1/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "M4A1"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(3.043, -1.38, 0.859)
	SWEP.AimAng = Vector(0.172, 0, 0)
	
	SWEP.SprintPos = Vector(-3.543, -2.126, -0.866)
	SWEP.SprintAng = Vector(-12.954, -58.151, 10.748)
	
	SWEP.ZoomAmount = 15
	
	SWEP.IconLetter = "w"
	--killicon.AddFont("swb_m4a1", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_med"
	SWEP.MuzzleEffectSupp = "swb_silenced"
end

SWEP.FadeCrosshairOnAim = false

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

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel				= "models/weapons/2_rif_m4a1.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rif_m4a1.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.FireDelay = 0.0666
SWEP.FireSound = Sound("Weapon_M4A1.Single")
SWEP.FireSoundSuppressed = Sound("Alt_Weapon_M4A1.2")
SWEP.Recoil = 0.4

SWEP.Suppressable = true

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 16
SWEP.DeployTime = 1
--PATH addons/m9k/lua/weapons/m9k_1887winchester/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_1887winchester/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_1887winchester") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Winchester 87"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 30			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 3			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "shotgun"	-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_1887winchester.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_winchester_1887.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_shotty_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("1887winch.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 60		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 5			-- Size of a clip
SWEP.Primary.DefaultClip			= 12	-- Default number of bullets in a clip
SWEP.Primary.KickUp			= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.8		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.6	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "slam"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 

SWEP.ShellTime			= .67

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 11		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 12	-- Base damage per bullet
SWEP.Primary.Spread		= .042	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .042	-- Ironsight accuracy, should be the same for shotguns
-- Because irons don't magically give you less pellet spread!

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.84, 0, 1.2)
SWEP.IronSightsAng = Vector(0, 0, 2.295)
SWEP.SightsPos = Vector(4.84, 0, 1.2)
SWEP.SightsAng = Vector(0, 0, 2.295)
SWEP.RunSightsPos = Vector (-2.3095, -3.0514, 2.3965)
SWEP.RunSightsAng = Vector (-19.8471, -33.9181, 10)

if ((gmod.GetGamemode().Name) == "Murderthon 9000") or ((gmod.GetGamemode().Name) == "Murderthon 9000 beta") then
	SWEP.Primary.Ammo			= "slam"
	SWEP.Slot		= 1				-- Slot in the weapon selection menu
	SWEP.Weight		= 3			-- rank relative ot other weapons. bigger is better
else
	SWEP.Primary.Ammo			= "Buckshot"
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
--PATH addons/m9k/lua/weapons/m9k_auga3/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_auga3/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_auga3") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Steyr AUG A3"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 26			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- Set false if you want no crosshair from hip
SWEP.Weight				= 30			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.XHair					= true		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.BoltAction				= false		-- Is this a bolt action rifle?
SWEP.HoldType 				= "smg"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_auga3sa.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_auga3.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("aug_a3.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 700		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= .4				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .4			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Rifle"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
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
SWEP.Secondary.UseMatador		= false

SWEP.data 				= {}
SWEP.data.ironsights		= 1
SWEP.ScopeScale 			= 0.5
SWEP.ReticleScale 			= 0.6

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 22	--base damage per bullet
SWEP.Primary.Spread		= .025	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .02 -- ironsight accuracy, should be the same for shotguns

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
--PATH addons/m9k/lua/weapons/m9k_fal/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_fal/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_fal") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "FN FAL"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 28			-- Position in the slot
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
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_fnfalnato.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_fn_fal.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("fnfal.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 750			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 20		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.5		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-3.161, -1.068, 1.24)
SWEP.IronSightsAng = Vector(0.425, 0.05, 0)
SWEP.SightsPos = Vector(-3.161, -1.068, 1.24)
SWEP.SightsAng = Vector(0.425, 0.05, 0)
SWEP.RunSightsPos = Vector(2.598, -2.441, 0.36)
SWEP.RunSightsAng = Vector(-7.993, 37.756, -6.89)

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
--PATH addons/m9k/lua/weapons/m9k_g36/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_g36/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_g36") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "G36"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 31			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_rif_g362.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_hk_g36c.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("G36.single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 800			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.15		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.15		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.15		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 25	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(2.865, -0.857, 1.06)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(2.865, -0.857, 1.06)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(-6, -2.571, -0.04)
SWEP.RunSightsAng = Vector(-11, -43, 0)

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
--PATH addons/m9k/lua/weapons/m9k_model500/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_model500/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_model500") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "S&W Model 500"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 28			-- Position in the slot
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

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_swmodel_500.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_sw_model_500.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Model_500.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 100			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 5		-- Size of a clip
SWEP.Primary.DefaultClip		= 30		-- Bullets you start with
SWEP.Primary.KickUp				= 1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "357"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 40	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .015 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-1.923, -1.675, 0.374)
SWEP.IronSightsAng = Vector(0.052, 0, 0)
SWEP.SightsPos = Vector(-1.923, -1.675, 0.374)
SWEP.SightsAng = Vector(0.052, 0, 0)
SWEP.RunSightsPos = Vector(3.444, -7.823, -6.27)
SWEP.RunSightsAng = Vector(60.695, 0, 0)

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
--PATH addons/m9k/lua/weapons/m9k_model627/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_model627/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_model627") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "S&W Model 627"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 29			-- Position in the slot
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

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_swmodel_627.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_sw_model_627.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("model_627perf.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 270			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 6		-- Size of a clip
SWEP.Primary.DefaultClip		= 30		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "357"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 33	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(2.68, 0.019, 1.521)
SWEP.IronSightsAng = Vector(-0.141, -0.139, 0)
SWEP.SightsPos = Vector(2.68, 0.019, 1.521)
SWEP.SightsAng = Vector(-0.141, -0.139, 0)
SWEP.RunSightsPos = Vector(-2.419, -4.467, -4.693)
SWEP.RunSightsAng = Vector(56.766, 0, 0)


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
--PATH addons/m9k/lua/weapons/m9k_pkm/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_pkm/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_pkm") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "PKM"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 38			-- Position in the slot
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
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_mach_russ_pkm.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_mach_russ_pkm.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("pkm.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 750			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 100		-- Size of a clip
SWEP.Primary.DefaultClip		= 200		-- Bullets you start with
SWEP.Primary.KickUp				= 0.4		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 90		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 21	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.215, -2.116, 0.36)
SWEP.IronSightsAng = Vector(-0.13, 0.054, 0)
SWEP.SightsPos = Vector(-2.215, -2.116, 0.36)
SWEP.SightsAng = Vector(-0.13, 0.054, 0)
SWEP.RunSightsPos = Vector(5.276, -3.859, 0)
SWEP.RunSightsAng = Vector(-14.606, 52.087, 0)

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
--PATH addons/m9k/lua/weapons/m9k_thompson/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_thompson") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Tommy Gun"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 54			-- Position in the slot
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

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_tommy_g.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_tommy_gun.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_tmg.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 850			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 75		-- Size of a clip
SWEP.Primary.DefaultClip		= 150		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.2		-- Maximum down recoil (skeet)
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
SWEP.IronSightsPos = Vector(3.359, 0, 1.84)
SWEP.IronSightsAng = Vector(-2.166, -4.039, 0)
SWEP.SightsPos = Vector(3.359, 0, 1.84)
SWEP.SightsAng = Vector(-2.166, -4.039, 0)
SWEP.GSightsPos = Vector (0, 0, 0)
SWEP.GSightsAng = Vector (0, 0, 0)
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
--PATH addons/m9k/lua/weapons/m9k_winchester73/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_winchester73/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

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
SWEP.Primary.Ammo			= "Rifle"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 
SWEP.ShellTime			= .54

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 80	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
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
--PATH addons/weaponandcontent/lua/weapons/p90/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "P90"
	SWEP.CSMuzzleFlashes = true

	SWEP.AimPos = Vector(2.049, -1.828, 0.782)
	SWEP.AimAng = Vector(0.089, 0, 0)
	
	SWEP.SprintPos = Vector(-5.38, -3.35, 1.48)
	SWEP.SprintAng = Vector(-17.362, -70, 0)
	
	SWEP.ZoomAmount = 15
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "m"
	--killicon.AddFont("swb_mp5", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_med"
end

SWEP.FadeCrosshairOnAim = false

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 20
SWEP.BulletDiameter = 5.7
SWEP.CaseLength = 28

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

SWEP.Slot = 2
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
SWEP.ViewModel				= "models/weapons/2_smg_p90.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_smg_p90.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 50
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.FireDelay = 0.08
SWEP.FireSound = Sound("Alt_Weapon_P90.1")	
SWEP.Recoil = 0.4

SWEP.HipSpread = 0.043
SWEP.AimSpread = 0.007
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 17.5
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5
--PATH addons/weaponandcontent/lua/weapons/swb_base/sh_ammotypes.lua:
function SWB_AddAmmoType(name)
	game.AddAmmoType({name = name,
	dmgtype = DMG_BULLET})
	
	if CLIENT then
		language.Add(name .. "_ammo", name .. " Ammo")
	end
end

SWB_AddAmmoType("Rifle")
SWB_AddAmmoType("Sniper Rifle")
--PATH addons/weaponandcontent/lua/weapons/swb_base/cl_model.lua:
SWEP.BlendPos = Vector(0, 0, 0)
SWEP.BlendAng = Vector(0, 0, 0)
SWEP.OldDelta = Angle(0, 0, 0)
SWEP.AngleDelta = Angle(0, 0, 0)
SWEP.FireMove = 0
SWEP.ViewModelMovementScale = 1
SWEP.Sequence = ""
SWEP.Cycle = 0
SWEP.NoStockShells = true
SWEP.NoStockMuzzle = true

local Vec0 = Vector(0, 0, 0)
local TargetPos, TargetAng, cos1, sin1, tan, ws, rs, mod, EA, delta, sin2, mul, vm, muz, muz2, tr, att
local td = {}

local reg = debug.getregistry()
local GetVelocity = reg.Entity.GetVelocity
local Length = reg.Vector.Length
local Right = reg.Angle.Right
local Up = reg.Angle.Up
local Forward = reg.Angle.Forward
local RotateAroundAxis = reg.Angle.RotateAroundAxis

function SWEP:GetTracerOrigin()
	if self.dt.State == SWB_AIMING and self.SimulateCenterMuzzle then
		return self.CenterPos
	end
end

function SWEP:CreateShell(sh)
	if not IsValid(self.Owner) or self.Owner:ShouldDrawLocalPlayer() or self.NoShells then
		return
	end
	
	sh = self.Shell or sh
	vm = self.Owner:GetViewModel()
	
	if not IsValid(vm) then
		return
	end

	att = vm:GetAttachment(2)
	
	if att then
		if self.InvertShellEjectAngle then
			dir = -att.Ang:Forward()
		else
			dir = att.Ang:Forward()
		end
		
		SWB_MakeFakeShell(sh, att.Pos + dir, EyeAngles(), dir * 200, 0.6, 10, self.ShellScale)
	end
end

function SWEP:CreateMuzzle(pos, ang)
	if self.Owner:ShouldDrawLocalPlayer() then
		return
	end

	vm = self.Owner:GetViewModel()
	
	if IsValid(vm) then
		vm:StopParticles()

		muz = vm:LookupAttachment("1")
		
		if muz then
			muz2 = vm:GetAttachment(muz)
			
			if muz2 then
				EA = EyeAngles()
				
				if self.MuzzlePosMod then
					pos = pos + EA:Right() * self.MuzzlePosMod.x + EA:Forward() * self.MuzzlePosMod.y + EA:Up() * self.MuzzlePosMod.z
				end
				
				if self.dt.State == SWB_AIMING and self.SimulateCenterMuzzle then
					pos = self.Owner:GetShootPos() + EA:Forward() * 15 - EA:Up() * 6
					self.CenterPos = pos
				end
				
				if self.dt.Suppressed then
					if self.MuzzleEffectSupp then
						if not self.NoSilMuz then
							if self.dt.State == SWB_AIMING and self.SimulateCenterMuzzle then
								ParticleEffect(self.MuzzleEffectSupp, pos + self.Owner:GetVelocity() * 0.03, EA, vm)
							else
								if self.PosBasedMuz then
									ParticleEffect(self.MuzzleEffectSupp, pos + self.Owner:GetVelocity() * 0.03, EA, vm) -- using velocity to add to the position 'simulates' attaching it to a control point
								else
									ParticleEffectAttach(self.MuzzleEffectSupp, PATTACH_POINT_FOLLOW, vm, muz)
								end
							end
						end
					end
				else
					if self.MuzzleEffect then
						if self.dt.State == SWB_AIMING and self.SimulateCenterMuzzle then
							ParticleEffect(self.MuzzleEffect, pos + self.Owner:GetVelocity() * 0.03, EA, vm)
						else
							if self.PosBasedMuz then
								ParticleEffect(self.MuzzleEffect, pos + self.Owner:GetVelocity() * 0.03, EA, vm)
							else
								ParticleEffectAttach(self.MuzzleEffect, PATTACH_POINT_FOLLOW, vm, muz)
							end
						end
					end
					
					dlight = DynamicLight(self:EntIndex())
					
					dlight.r = 255 
					dlight.g = 218
					dlight.b = 74
					dlight.Brightness = 4
					dlight.Pos = pos + self.Owner:GetAimVector() * 3
					dlight.Size = 96
					dlight.Decay = 128
					dlight.DieTime = CurTime() + FrameTime()
				end
			end
		end
	end
end

SWBShells = {}
SWBShells["mainshell"] = {m = "models/weapons/rifleshell.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
SWBShells["shotshell"] = {m = "models/weapons/Shotgun_shell.mdl", s = {"weapons/fx/tink/shotgun_shell1.wav", "weapons/fx/tink/shotgun_shell2.wav", "weapons/fx/tink/shotgun_shell3.wav"}}
SWBShells["smallshell"] = {m = "models/weapons/shell.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}

function SWB_MakeFakeShell(shell, pos, ang, vel, time, removetime, shellscale)
	if not shell or not pos or not ang then
		return
	end

	local t = SWBShells[shell]
	
	if not t then
		return
	end
	
	vel = vel or Vector(0, 0, -100)
	vel = vel + VectorRand() * 5
	time = time or 0.5
	removetime = removetime or 5
	shellscale = shellscale or 1
	
	local ent = ClientsideModel(t.m, RENDERGROUP_BOTH) 
	ent:SetPos(pos)
	ent:PhysicsInitBox(Vector(-0.5, -0.15, -0.5), Vector(0.5, 0.15, 0.5))
	ent:SetAngles(ang)
	ent:SetModelScale(shellscale, 0)
	ent:SetMoveType(MOVETYPE_VPHYSICS) 
	ent:SetSolid(SOLID_VPHYSICS) 
	ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	
	local phys = ent:GetPhysicsObject()
	phys:SetMaterial("gmod_silent")
	phys:SetMass(10)
	phys:SetVelocity(vel)

	timer.Simple(time, function()
		if t.s then
			--ent:EmitSound(table.Random(t.s), 35, 100)
		end
	end)
	
	SafeRemoveEntityDelayed(ent, removetime)
end

function SWEP:FireAnimationEvent(pos, ang, ev, name)
	if ev == 5001 then
		if self.MuzzleEffect then
			self:CreateMuzzle(pos, ang)
		end
		
		if self.NoStockMuzzle then
			return true
		end
		
		return self.dt.Suppressed
	end
	
	if ev == 20 then
		if self.Shell then
			self:CreateShell()
		end
		
		return self.NoStockShells
	end
end

SWEP.ApproachSpeed = 10
local SP = game.SinglePlayer() 
local PosMod, AngMod = Vector(0, 0, 0), Vector(0, 0, 0)
local CurPosMod, CurAngMod = Vector(0, 0, 0), Vector(0, 0, 0)
local veldepend = {pitch = 0, yaw = 0, roll = 0}
local mod2 = 0
local EA2

function SWEP:PreDrawViewModel()
	CT = UnPredictedCurTime()
	vm = self.Owner:GetViewModel()
	
	self.Sequence = vm:GetSequenceName(vm:GetSequence())
	self.IsReloading = self.Sequence:find("reload")
	
	if not self.IsReloading then
		self.IsReloading = self.Sequence:find("insert")
	end
	
	if not self.IsReloading then
		self.IsFiddlingWithSuppressor = self.Sequence:find("silencer")
	end
	
	self.Cycle = vm:GetCycle()
	
	EA = EyeAngles()
	FT = FrameTime()
	
	delta = Angle(EA.p, EA.y, 0) - self.OldDelta
	delta.p = math.Clamp(delta.p, -10, 10)
		
	self.OldDelta = Angle(EA.p, EA.y, 0)
	self.AngleDelta = LerpAngle(math.Clamp(FT * 10, 0, 1), self.AngleDelta, delta)
	self.AngleDelta.y = math.Clamp(self.AngleDelta.y, -10, 10)

	vel = GetVelocity(self.Owner)
	len = Length(vel)
	ws = self.Owner:GetWalkSpeed()
	
	PosMod, AngMod = Vec0 * 1, Vec0 * 1
	mod2 = 1
	
	veldepend.roll = math.Clamp((vel:Dot(EA:Right()) * 0.04) * len / ws, -5, 5)
	
	if self.dt.State == SWB_AIMING then
		mod2 = 0.2
		TargetPos, TargetAng = self.AimPos * 1, self.AimAng * 1
		self.ApproachSpeed = math.Approach(self.ApproachSpeed, 8, FT * 100)
	elseif self.dt.State == SWB_ACTION then
		TargetPos, TargetAng = self.SwimPos * 1, self.SwimAng * 1
		self.ApproachSpeed = math.Approach(self.ApproachSpeed, 5, FT * 100)
	elseif self.dt.State == SWB_RUNNING or (((len > ws * 1.2 and self.Owner:KeyDown(IN_SPEED)) or len > ws * 3 or (self.ForceRunStateVelocity and len > self.ForceRunStateVelocity)) and self.Owner:OnGround()) and !self.Owner:GetNW2Bool("donate_upgrade_runngun",false)then
		if self.IsReloading and self.Cycle < 0.9 then
			TargetPos, TargetAng = Vec0 * 1, Vec0 * 1
		else
			if self.SprintingEnabled then
				TargetPos, TargetAng = self.SprintPos * 1, self.SprintAng * 1
			else
				TargetPos, TargetAng = Vec0 * 1, Vec0 * 1
			end
		end
		
		rs = self.Owner:GetRunSpeed()
		mod = 7 + math.Clamp(rs / 100, 0, 6)
		mul = math.Clamp(len / rs, 0, 1)
		sin1 = math.sin(CT * mod) * mul
		cos1 = math.cos(CT * mod) * mul
		tan1 = math.tan(sin1 * cos1) * mul
		
		if (self.IsReloading or self.IsFiddlingWithSuppressor) and self.Cycle <= 0.9 then
			AngMod.x = AngMod.x + tan1 * 0.2 * self.ViewModelMovementScale * mul
			AngMod.y = AngMod.y - cos1 * 1.5 * self.ViewModelMovementScale * mul
			AngMod.z = AngMod.z + cos1 * 3 * self.ViewModelMovementScale * mul
			PosMod.x = PosMod.x - sin1 * 1.2 * self.ViewModelMovementScale * mul
			PosMod.y = PosMod.y + tan1 * 3 * self.ViewModelMovementScale * mul
			PosMod.z = PosMod.z + tan1 * 1.5 * self.ViewModelMovementScale * mul
			
			self.ApproachSpeed = math.Approach(self.ApproachSpeed, 4, FT * 100)
		else
			AngMod.x = AngMod.x + tan1 * 0.2 * self.ViewModelMovementScale * mul
			AngMod.y = AngMod.y - cos1 * 1.5 * self.ViewModelMovementScale * mul
			AngMod.z = AngMod.z + cos1 * 3 * self.ViewModelMovementScale * mul
			PosMod.x = PosMod.x - sin1 * 1.2 * self.ViewModelMovementScale * mul
			PosMod.y = PosMod.y + tan1 * 3 * self.ViewModelMovementScale * mul
			PosMod.z = PosMod.z + tan1 * 1.5 * self.ViewModelMovementScale * mul
			
			self.ApproachSpeed = math.Approach(self.ApproachSpeed, 6, FT * 100)
		end
	else
		if self.dt.Safe then
			TargetPos, TargetAng = self.SprintPos * 1, self.SprintAng * 1
		else
			TargetPos, TargetAng = Vec0 * 1, Vec0 * 1
		end

		self.ApproachSpeed = math.Approach(self.ApproachSpeed, 10, FT * 100)
		
		td.start = self.Owner:GetShootPos()
		td.endpos = td.start + self.Owner:EyeAngles():Forward() * 30
		td.filter = self.Owner
		
		tr = util.TraceLine(td)
		
		if tr.Hit then
			self.NearWall = true
			TargetPos.y = TargetPos.y - math.Clamp(30 * (1 - tr.Fraction), 0, 15)
		end
	end
	
	if len < 10 or not self.Owner:OnGround() then
		if self.dt.State != SWB_AIMING then
			cos1, sin1 = math.cos(CT), math.sin(CT)
			tan = math.atan(cos1 * sin1, cos1 * sin1)
			
			AngMod.x = AngMod.x + tan * 1.15
			AngMod.y = AngMod.y + cos1 * 0.4
			AngMod.z = AngMod.z + tan
			
			PosMod.y = PosMod.y + tan * 0.2 * mod2
		end
	elseif len > 10 and len < ws * 1.2 then
		mod = 6 + ws / 130
		mul = math.Clamp(len / ws, 0, 1)
		sin1 = math.sin(CT * mod) * mul
		cos1 = math.cos(CT * mod) * mul
		tan1 = math.tan(sin1 * cos1) * mul
		
		AngMod.x = AngMod.x + tan1 * self.ViewModelMovementScale * mod2
		AngMod.y = AngMod.y - cos1 * self.ViewModelMovementScale * mod2
		AngMod.z = AngMod.z + cos1 * self.ViewModelMovementScale * mod2
		PosMod.x = PosMod.x - sin1 * 0.4 * self.ViewModelMovementScale * mod2
		PosMod.y = PosMod.y + tan1 * 1 * self.ViewModelMovementScale * mod2
		PosMod.z = PosMod.z + tan1 * 0.5 * self.ViewModelMovementScale * mod2
	end
	
	FT = FrameTime()
	
	TargetAng.z = TargetAng.z + veldepend.roll
	self.BlendPos = LerpVector(FT * self.ApproachSpeed, self.BlendPos, TargetPos)
	self.BlendAng = LerpVector(FT * self.ApproachSpeed, self.BlendAng, TargetAng)
	
	CurPosMod = LerpVector(FT * 10, CurPosMod, PosMod)
	CurAngMod = LerpVector(FT * 10, CurAngMod, AngMod)
	
	self.FireMove = Lerp(FT * 15, self.FireMove, 0)
end

function SWEP:GetViewModelPosition(pos, ang)
	CT = UnPredictedCurTime()
	
	if self.InstantDissapearOnAim and self.dt.State == SWB_AIMING then
		self.ViewModelFOV = 90
		pos = pos - ang:Forward() * 100
		return pos, ang
	end
	
	if self.MoveWepAwayWhenAiming and CT > self.AimTime and self.dt.State == SWB_AIMING then
		self.ViewModelFOV = 90
		pos = pos - ang:Forward() * 100
		return pos, ang
	end
	
	self.ViewModelFOV = self.ViewModelFOV_Orig
	
	RotateAroundAxis(ang, Right(ang), CurAngMod.x + self.BlendAng.x + self.AngleDelta.p * mod2)
	
	if not self.ViewModelFlip then
		RotateAroundAxis(ang, Up(ang), CurAngMod.y + self.BlendAng.y + self.AngleDelta.y * 0.3 * mod2)
		RotateAroundAxis(ang, Forward(ang), CurAngMod.z + self.BlendAng.z + self.AngleDelta.y * 0.3 * mod2)
	else
		RotateAroundAxis(ang, Up(ang), CurAngMod.y + self.BlendAng.y - self.AngleDelta.y * 0.3 * mod2)
		RotateAroundAxis(ang, Forward(ang), CurAngMod.z - self.BlendAng.z - self.AngleDelta.y * 0.3 * mod2)
	end

	if not self.ViewModelFlip then
		pos = pos + (CurPosMod.x + self.BlendPos.x + self.AngleDelta.y * 0.1 * mod2) * Right(ang)
	else
		pos = pos + (CurPosMod.x + self.BlendPos.x - self.AngleDelta.y * 0.1 * mod2) * Right(ang)
	end
	
	pos = pos + (CurPosMod.y + self.BlendPos.y - self.FireMove) * Forward(ang)
	pos = pos + (CurPosMod.z + self.BlendPos.z - self.AngleDelta.p * 0.1) * Up(ang)
	
	return pos, ang
end

local wm, pos, ang

function SWEP:DrawWorldModel()
	if self.dt.Safe then
		if self.CHoldType != self.RunHoldType then
			self:SetHoldType(self.RunHoldType)
			self.CHoldType = self.RunHoldType
		end
	else
		if self.dt.State == SWB_RUNNING or self.dt.State == SWB_ACTION then
			if self.CHoldType != self.RunHoldType then
				self:SetHoldType(self.RunHoldType)
				self.CHoldType = self.RunHoldType
			end
		else
			if self.CHoldType != self.NormalHoldType then
				self:SetHoldType(self.NormalHoldType)
				self.CHoldType = self.NormalHoldType
			end
		end
	end
				
	if self.DrawTraditionalWorldModel then
		self:DrawModel()
	else
		wm = self.WMEnt
		
		if IsValid(wm) then
			if IsValid(self.Owner) then
				pos, ang = GetBonePosition(self.Owner, self.Owner:LookupBone("ValveBiped.Bip01_R_Hand"))
				
				if pos and ang then
					RotateAroundAxis(ang, Right(ang), self.WMAng[1])
					RotateAroundAxis(ang, Up(ang), self.WMAng[2])
					RotateAroundAxis(ang, Forward(ang), self.WMAng[3])

					pos = pos + self.WMPos[1] * Right(ang) 
					pos = pos + self.WMPos[2] * Forward(ang)
					pos = pos + self.WMPos[3] * Up(ang)
					
					wm:SetRenderOrigin(pos)
					wm:SetRenderAngles(ang)
					wm:DrawModel()
				end
			else
				wm:SetRenderOrigin(self:GetPos())
				wm:SetRenderAngles(self:GetAngles())
				wm:DrawModel()
				wm:DrawShadow()
			end
		else
			self:DrawModel()
		end
	end
end
--PATH addons/weaponandcontent/lua/weapons/tmp/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "TMP"
	SWEP.CSMuzzleFlashes = true

	SWEP.AimPos = Vector(2.599, -2.385, 2.026)
	SWEP.AimAng = Vector(0, -0.129, 0.291)
	
	SWEP.SprintPos = Vector(-6.693, -6.378, 2.282)
	SWEP.SprintAng = Vector(-17.914, -49.882, 0)
	
	SWEP.ZoomAmount = 15
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "d"
	SWEP.NoStockMuzzle = true
	--killicon.AddFont("swb_mp5", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_silenced_small"
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
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel				= "models/weapons/2_smg_tmp.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_smg_tmp.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.FireDelay = 0.0666
SWEP.FireSound = "Weapon_TMP.Single" -- repleicsut
SWEP.Recoil = 0.35

SWEP.HipSpread = 0.037
SWEP.AimSpread = 0.013
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 12.5
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5
--PATH addons/weaponandcontent/lua/weapons/ump/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "UMP"
	SWEP.CSMuzzleFlashes = true

	SWEP.AimPos = Vector(2.822, -1.224, 1.245)
	SWEP.AimAng = Vector(-0.044, -0.055, 0.43)
	
	SWEP.SprintPos = Vector(-6.378, -6.064, 2.598)
	SWEP.SprintAng = Vector(-17.914, -66.97, 0.275)
	
	SWEP.ZoomAmount = 15
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "q"
	--killicon.AddFont("swb_mp5", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_small"
end
SWEP.CanPenetrate = false
SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 20
SWEP.BulletDiameter = 11.5
SWEP.CaseLength = 22.8

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
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
SWEP.ViewModel				= "models/weapons/2_smg_ump45.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_smg_ump45.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 25
SWEP.Primary.DefaultClip	= 25
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.FireDelay = 0.09
SWEP.FireSound = Sound("Alt_Weapon_UMP45.1")
SWEP.Recoil = 0.45

SWEP.HipSpread = 0.041
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 17
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5
--PATH addons/cigarette_swep/lua/weapons/weapon_ciga_pachka.lua:
-- MODEL WITH UNKNOWN AUTHOR! PM ME!!! QUICK :D -- 
SWEP.PrintName = "Pack Yava"
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
SWEP.WorldModel = "models/mordeciga/mordes/emptyboxshib.mdl"
SWEP.UseHands = true
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
	
SWEP.ViewModelBoneMods = {
	["ValveBiped.Grenade_body"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/mordeciga/mordes/emptyboxshib.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(0, 0, -2.597), angle = Angle(-15.195, 180, 180), size = Vector(1.34, 1.34, 1.34), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/mordeciga/mordes/emptyboxshib.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.635, 3.635, -0.519), angle = Angle(-26.883, 178.83, 180), size = Vector(1.728, 1.728, 1.728), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
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
self.Owner:Give( "weapon_ciga" )
 timer.Simple( 0.4, function() 
  
self.Owner:StripWeapon("weapon_ciga_pachka")

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





--PATH addons/skin_nier/lua/weapons/weapon_mad_2b/cl_init.lua:
include('shared.lua')

if CLIENT then
	function SWEP:Bomb()
	
	end
	function SWEP:RushFiveBomb()
	
	end
end
--PATH addons/111mod/lua/weapons/weapon_rp_base.lua:
AddCSLuaFile()

SWEP.Base = "weapon_base"

if SERVER then
	SWEP.AutoSwitchTo = false
	SWEP.AutoSwitchFrom = false
else
	SWEP.PrintName = "RP Weapon Base"
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
	SWEP.ViewModelFOV = 68
	SWEP.Category = "RP"
	SWEP.Author = "code_gs"
end

SWEP.HoldType = "normal"

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.AdminOnly = true
SWEP.UseHands = true

SWEP.Primary = {
	ClipSize = -1,
	DefaultClip = -1,
	Automatic = true,
	Ammo = "none",
	Delay = 0.5,
	Sound = Sound('ambient/voices/cough1.wav')
}

SWEP.Secondary = {
	ClipSize = -1,
	DefaultClip = -1,
	Automatic = true,
	Ammo = "none",
	Delay = 0.5,
	Sound = Sound('ambient/voices/cough2.wav')
}

SWEP._Reload = {
	Delay = 2,
	Sound = Sound('npc/combine_soldier/vo/administer.wav')
}

SWEP.HitDistance = 100

function SWEP:SetupDataTables()
	self:NetworkVar("Float", 0, "NextReload")
end

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
end

function SWEP:SecondaryAttack()
	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
end

function SWEP:Reload()
	self:SetNextReload(CurTime() + self._Reload.Delay)
end

function SWEP:CanReload()
	return CurTime() > self:GetNextReload()
end

function SWEP:Holster()
	return true
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
--PATH addons/111mod/lua/weapons/wrench_deluxe/shared.lua:
AddCSLuaFile("shared.lua")

SWEP.Category 		= "VCMod"
SWEP.PrintName		= "Deluxe Ключ"
SWEP.Author			= "TravkaCode"
SWEP.Instructions	= "TravkaCode"

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

function SWEP:PrimaryAttack()
	if CLIENT then return end
	local owner = self:GetOwner()
	local ent = owner:GetEyeTrace().Entity
	if ent and IsValid(ent) and ent:IsVehicle() and (ent:GetClass() == "prop_vehicle_jeep" or ent:GetClass() == "prop_vehicle_airboat") then
		if ent:GetPos():Distance(owner:GetPos()) < 200 then
			ent:VC_repairFull_Admin()
		else
			DarkRP.notify(owner, 0, 2, 'Вы далеко от машины')
		end
	else
		DarkRP.notify(owner, 1, 2, 'Вы должны смотреть на машину')
	end
	self:SetNextPrimaryFire(CurTime()+1)
end

--PATH addons/zeros_weedfarm/lua/weapons/zwf_cable/shared.lua:

SWEP.PrintName = "Кабель" // The name of your SWEP
SWEP.Author = "ZeroChain" // Your name
SWEP.Instructions = "LMB - Connect | RMB - Deconnect" // How do people use your SWEP?
SWEP.Contact = "https://www.gmodstore.com/users/ZeroChain" // How people should contact you if they find bugs, errors, etc
SWEP.Purpose = "Used connecting Generator and Water Tanks." // What is the purpose of the SWEP?
SWEP.AdminSpawnable = true // Is the SWEP spawnable for admins?
SWEP.Spawnable = true // Can everybody spawn this SWEP? - If you want only admins to spawn it, keep this false and admin spawnable true.
SWEP.ViewModelFOV = 100 // How much of the weapon do you see?

SWEP.ViewModel = "models/zerochain/props_weedfarm/zwf_cable_vm.mdl"
SWEP.WorldModel =  "models/zerochain/props_weedfarm/zwf_cable_vm.mdl"

if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("zerochain/zwf/vgui/zwf_swep_cable")
end


SWEP.AutoSwitchTo = true // When someone picks up the SWEP, should it automatically change to your SWEP?
SWEP.AutoSwitchFrom = false // Should the weapon change to the a different SWEP if another SWEP is picked up?
SWEP.Slot = 3 // Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6)
SWEP.SlotPos = 2 // Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.HoldType = "pistol" // How is the SWEP held? (Pistol SMG Grenade Melee)
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

function SWEP:SetupDataTables()

	self:NetworkVar("Entity", 0, "SelectedEntity")
end

--PATH addons/111mod/lua/entities/armour_station/shared.lua:
--[[---------------------------------------------------------------------------
This is an example of a custom entity.
---------------------------------------------------------------------------]]
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Портативная армор станция"
ENT.Category = "@GambitEnts"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int",0,"price")
	self:NetworkVar("Entity",1,"owning_ent")
end

--PATH addons/mod_bitminers2/lua/entities/bm2_bitminer_1/cl_init.lua:
include("shared.lua")

local function __round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

//Animate fan(s)
function ENT:Think()
	if LocalPlayer():GetPos():Distance(self:GetPos()) < 500 then
		if self:GetIsMining() then
			self.fanAng = self.fanAng + (FrameTime() * 400)
			for i = 0 , self:GetBoneCount() - 1 do
				if string.match( self:GetBoneName(i), "fan" ) ~= nil then
					self:ManipulateBoneAngles(i,Angle(self.fanAng,0,0))
				end
			end
		end
	end
end

//Yuck I know but its to much effort to re-write the entire system
function ENT:Initialize()
	self.fanAng = 0

	//So each bitminer can have its own set of unique instructions. This is how we will do that
	self.customInstructions = {
		status = { //Outputs usefull runtime infomation
			command = "STATUS",
			description = "Outputs usefull infomation about the current device.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				consoleDisplay.history = consoleDisplay.history.."\n------------------STATUS------------------\n"
				local firstPart = "IS MINING                                 "
				local secondPart = string.upper(tostring(ent:GetIsMining()))
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				firstPart = "HAS POWER                                 "
				secondPart = string.upper(tostring(ent:GetHasPower()))
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				consoleDisplay.history = consoleDisplay.history.."------------------------------------------\n\n"
			end
		},
		info = {
			command = "INFO",
			description = "Outputs sepcifications for the device such as power usage.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				consoleDisplay.history = consoleDisplay.history.."\n-------------------INFO------------------\n"
				local firstPart = "CLOCK SPEED                              "
				local secondPart = tostring(__round(ent:GetClockSpeed(), 3)).."Ghz"
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				local firstPart = "CORES                                    "
				local secondPart = ent:GetCoreCount()
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				consoleDisplay.history = consoleDisplay.history.."POWER REQUIREMENT                    100W\n"
				consoleDisplay.history = consoleDisplay.history.."MODEL NAME                    Bitminer S1\n"
				local playerName = self:Getowning_ent()
				if playerName ~= NULL then playerName = playerName:Name() else playerName = "Unknown" end
				consoleDisplay.history = consoleDisplay.history..string.sub("OWNER                                    ", 1, string.len("OWNER                                    ") - string.len(playerName))..playerName.."\n"
				consoleDisplay.history = consoleDisplay.history.."-----------------------------------------\n\n"
			end
		},
		mining = {
			command = "MINING",
			description = "Starts or stop the miner from mining.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				if arg1 == nil then
					consoleDisplay.history = consoleDisplay.history.."To use this command please supply one of the following arguments, 'mining start' or 'mining stop'\n"
				elseif arg1 == "start" then
					net.Start("BM2.Command.Mining")
						net.WriteEntity(ent)
						net.WriteBool(true)
					net.SendToServer()
				elseif arg1 == "stop" then
					net.Start("BM2.Command.Mining")
						net.WriteEntity(ent)
						net.WriteBool(false)
					net.SendToServer()
				else
					consoleDisplay.history = consoleDisplay.history.."The option '"..arg1.."' is not a valid option, the options are 'mining start' or 'mining stop'\n"
				end
			end
		},
		bitcoin = { //Used for selling or getting info about bitcoins
			command = "BITCOIN",
			description = "Allows you to sell or see infomation about the stored bitcoins.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				if arg1 == "info" then
					consoleDisplay.history = consoleDisplay.history.."\n-------------------BITCOIN------------------\n"
					local firstPart = "Bitcoin Amount                              "
					local secondPart = comma_value(__round(ent:GetBitcoinAmount(), 2)).."btc"
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
					firstPart =	"Bitcoin Value ($)                           "
					secondPart = tostring(comma_value(__round(ent:GetBitcoinAmount() * BM2CONFIG.BitcoinValue, 2)))
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
					consoleDisplay.history = consoleDisplay.history.."--------------------------------------------\n\n"
				elseif arg1 == "sell" then
					net.Start("BM2.Command.SellBitcoins")
						net.WriteEntity(ent)
					net.SendToServer()
					local firstPart =	"From                                        "
					local secondPart = tostring(comma_value(__round(ent:GetBitcoinAmount(), 2))).."btc"
					consoleDisplay.history = consoleDisplay.history.."\n-------------------RECEIPT------------------\n"
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
					firstPart =	"Convereted to                               "
					secondPart = "$"..tostring(comma_value(__round(ent:GetBitcoinAmount() * BM2CONFIG.BitcoinValue, 2)))
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
					consoleDisplay.history = consoleDisplay.history.."The money has been transfered to your wallet\n"
					consoleDisplay.history = consoleDisplay.history.."--------------------------------------------\n\n"
				else
					if arg1 == nil then
						consoleDisplay.history = consoleDisplay.history.."To use this command please supply one of the following arguments, 'bitcoin info' or 'bticoin sell'\n"
					else
						consoleDisplay.history = consoleDisplay.history.."The option '"..arg1.."' is not a valid option, the options are 'bitcoin info' or 'bticoin sell'\n"
					end
				end
			end
		},
		upgrade = { //Used for selling or getting info about bitcoins
			command = "UPGRADE",
			description = "Shows available upgrades and allows you to purchase them.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				if arg1 == "1" then //CPU
					net.Start("BM2.Command.Upgrade")
					net.WriteEntity(ent)
					net.WriteBool(false)
					net.SendToServer()
				elseif arg1 == "2" then //Cores
					net.Start("BM2.Command.Upgrade")
					net.WriteEntity(ent)
					net.WriteBool(true)
					net.SendToServer()
				else
					if arg1 == nil then
						consoleDisplay.history = consoleDisplay.history.."\n-------------------UPGRADES------------------\n"
						local i = 0

						if self.upgrades.CPU.cost[self:GetCPUUpgrade() + 1] ~= nil then
							i = i + 1
							firstPart =	"[1] "..self.upgrades.CPU.name.."                                                              "
							secondPart = "                                             "
							thirdtPart = "$"..comma_value(self.upgrades.CPU.cost[self:GetCPUUpgrade() + 1])
							local str = string.sub(firstPart, 0, string.len(secondPart))
							consoleDisplay.history = consoleDisplay.history..string.sub(str, 1, string.len(str) - string.len(thirdtPart))..thirdtPart.."\n"
						end

						if self.upgrades.CORES.cost[self:GetCoreUpgrade() + 1] ~= nil then
							i = i + 1 
							firstPart =	"[2] "..self.upgrades.CORES.name.."                                                              "
							secondPart = "                                             "
							thirdtPart = "$"..comma_value(self.upgrades.CORES.cost[self:GetCoreUpgrade() + 1])
							local str = string.sub(firstPart, 0, string.len(secondPart))
							consoleDisplay.history = consoleDisplay.history..string.sub(str, 1, string.len(str) - string.len(thirdtPart))..thirdtPart.."\n"
						end

						if i == 0 then
							consoleDisplay.history = consoleDisplay.history.."There are no more upgrade left for this device.\n"
						end

						consoleDisplay.history = consoleDisplay.history.."---------------------------------------------\nType 'upgrade 1' or 'upgrade 2' to select one.\n"
					else
						consoleDisplay.history = consoleDisplay.history.."The option '"..arg1.."' is not a valid option, the options are 'upgrade 1' or 'upgrade 2'\n"
					end
				end
			end
		},
	} 
end

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/mod_bitminers2/lua/entities/bm2_bitminer_rack/shared.lua:
ENT.Type = "anim"

ENT.PrintName = "Bitminer Rack"
ENT.Spawnable = true
ENT.Category = "Bitminers 2"

ENT.upgrades = {
	CPU = {name = "Overclocks all server by +256MHz", cost = {2000,400,8000,16000,32000, 64000, 128000}, amountPerUpgrade = 0.256},
	CORES = {name = "Adds an extra core", cost = {}} //Altough were not using it, by having an empty table it will prevent errors
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
	self:NetworkVar( "String", 2, "ConnectedServers")
	self:NetworkVar("Entity", 0, "owning_ent")
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

--PATH addons/the_cocaine_factory/lua/entities/cocaine_box/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Drug Holder"
ENT.Author = "Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "HP" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_cooking_pot/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Cooking Pan"
ENT.Author = "Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "HP" )
	self:NetworkVar( "Bool", 0, "Cooking" )
	self:NetworkVar( "Bool", 1, "Cooked" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end


--PATH addons/the_cocaine_factory/lua/entities/cocaine_leaves/cl_init.lua:
include( "shared.lua" )

function ENT:Draw()
	self:DrawModel()	
end
--PATH addons/111mod/lua/entities/donation_box/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Donation Box"
ENT.Author = "TravkaCode"
ENT.Category = "@GambitEnts"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int",0,"price")
	self:NetworkVar("Entity",1,"owning_ent")
	self:NetworkVar( "Float", 0, "moneys" );
end
--PATH addons/truefishing/lua/entities/ent_buoy/cl_init.lua:
include('shared.lua')

	
ENT.RenderGroup = RENDERGROUP_OPAQUE

local IsOpen = false
local function BuoyMenu()
	local ent = net.ReadEntity()
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
	if ent:GetClass() == "ent_buoy" then
		local num = #buttons + 1
		buttons[num] = vgui.Create("DButton")
		buttons[num]:SetText("")
		buttons[num].Text = TrueFishLocal("retrieve_fish_cage")
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
			net.Start("BuoyRet")
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
net.Receive("BuoyMenu", BuoyMenu)

net.Receive("BuoySplash", function()
	local ent = net.ReadEntity()
	if IsValid(ent) then
		ent.Splashing = true
	end
end)

function ENT:Initialize()
end

ENT.NextSplash = 0
function ENT:Draw()
	local ctime = CurTime()
	if self.Splashing and self:WaterLevel() > 0 and self.NextSplash < ctime then
		local pos = self:GetPos()
		local effectdata = EffectData()
		effectdata:SetOrigin(pos)
		effectdata:SetNormal(pos)
		effectdata:SetRadius(8)
		effectdata:SetScale(9)
		util.Effect("watersplash", effectdata)
		self.NextSplash = ctime+1
	end

	self:DrawModel()
	
end

--PATH addons/111mod/lua/entities/ent_license/cl_init.lua:
include("shared.lua")

function ENT:Draw()
    self:DrawModel()

	
    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    cam.Start3D2D(Pos + Ang:Up() * 0.9, Ang, 0.12)

		draw.SimpleText("Лицензия","ChatFont",-45,-15,Color(0,0,0,255))

	cam.End3D2D()

end
--PATH addons/111mod/lua/entities/ent_taser_hook.lua:
AddCSLuaFile()

ENT.Type = "anim"

local Tmodel = Model( "models/props_c17/TrapPropeller_Lever.mdl" )
local Tsound = Sound( "ambient/energy/spark5.wav" )

local time = {
	hit = 5,
	miss = 3,
	remove = 8
}
	

local MissTime = 3
local TaseTime = 5

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "Damage" )
end

function ENT:Initialize()
	self:SetModel( Tmodel )
	
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetDamage( 0 )
	
	timer.Simple( time.remove, function()
		if ( IsValid( self ) and SERVER ) then self:Remove() end
	end )
end

local function ResetPlayer( ply )
	if ( not IsValid( ply ) ) then return end
	
	ply:ConCommand("pp_motionblur 0")    
	ply:ConCommand("pp_dof 0")
	ply.IsTased = false
	ply:SetMoveType( MOVETYPE_WALK )
end

function ENT:PhysicsCollide( data, physnum )
	local ent = data.HitEntity
	
	if IsValid( ent ) then
		local tr = util.TraceLine({
			start = self:GetPos(), 
			endpos = ent:LocalToWorld( ent:OBBCenter() ), 
			filter={ self, self.Owner }, 
			mask = MASK_SHOT_HULL
		})
		
		if ( ent:IsPlayer() and not ent.IsTased ) then			
			ent:ConCommand("pp_motionblur 1")  
			ent:ConCommand("pp_motionblur_addalpha 0.05")  
			ent:ConCommand("pp_motionblur_delay 0.035")  
			ent:ConCommand("pp_motionblur_drawalpha 1.00")  
			ent:ConCommand("pp_dof 1")  
			ent:ConCommand("pp_dof_initlength 9")  
			ent:ConCommand("pp_dof_spacing 8")

			--local move = ent:GetMoveType()
			ent:SetMoveType( MOVETYPE_NONE )
			ent.IsTased = true
			
			timer.Simple( time.hit, function() ResetPlayer( ent ) end )
		end
		
		self:SetPos( data.HitPos - data.HitNormal * 1 )
		self:SetAngles( data.HitNormal:Angle() )
		self:SetMoveType( MOVETYPE_NONE )
		self:SetCollisionGroup( COLLISION_GROUP_WORLD )
		self:SetParent( ent )
		
		local phys = ent:GetPhysicsObject()
		if ( IsValid( phys ) ) then
			phys:SetVelocity( data.TheirOldVelocity )
		else
			ent:SetVelocity( data.TheirOldVelocity )
		end
		
		local ef = EffectData()
		ef:SetOrigin( data.HitPos )
		ef:SetNormal( data.HitNormal )
		ef:SetStart( data.HitPos )
		ef:SetEntity( ent )
		ef:SetMagnitude( 2 )
		
		util.Effect( "Sparks", ef, true, true )
		util.Effect( "TeslaHitBoxes", ef, true, true )
		
		sound.Play( Tsound, data.HitPos, 100, 100 )
		
		timer.Simple( time.hit, function() 
			if IsValid( self ) then
				self:SetMoveType( MOVETYPE_NOCLIP )
				self:SetSolid( SOLID_NONE )
				self:SetParent( nil )
				self.Retracting = true
			end
		end )
	else
		self:SetPos( data.HitPos - data.HitNormal * 3 )
		self:SetAngles( data.HitNormal:Angle() )
		self:SetMoveType( MOVETYPE_NONE )
		
		local ef = EffectData()
		ef:SetOrigin( data.HitPos )
		ef:SetNormal( data.HitNormal )
		ef:SetStart( data.HitPos )
		ef:SetMagnitude( 2 )
		
		util.Effect( "Sparks", ef, true, true )
		
		sound.Play( Tsound, data.HitPos, 100, 100 )
		
		timer.Simple( time.miss, function() 
			if IsValid( self ) then
				self:SetMoveType( MOVETYPE_NOCLIP )
				self:SetSolid( SOLID_NONE )
				self:SetParent( nil )
				self.Retracting = true
			end
		end )
	end
end

function ENT:Think()
	local vWeapon = IsValid( self.Weapon )
	local vOwner = vWeapon and IsValid( self.Weapon.Owner )
	
	if ( not vWeapon ) then return end

	if SERVER then
		if not self.Fired then
			local phys = self:GetPhysicsObject()
			if IsValid(phys) then
				phys:SetVelocity( self.FireVelocity )
				self.Fired = true
			else
			end
		end
	end
	
	if ( self.Retracting ) then
		if ( not vWeapon ) then self:Remove() return end
		
		local target = vOwner and self.Weapon.Owner:GetPos() or self.Weapon:GetPos()		-- FIX this fucking awful shit
		local dir = ( target - self:GetPos() ):GetNormal()
		
		self:SetAngles( dir:Angle() )
		
		self:SetVelocity( dir * 200 )
		
		if self:GetPos():Distance( target ) < 150 then self:Remove() return end
	end
end

if CLIENT then return end

hook.Add( "CanPlayerSuicide", "GS-Taser-CanPlayerSuicide", function( ply ) 
	if ( IsValid( ply ) and ply.Tased ) then 
		return false 
	end 
end )

hook.Add( "DoPlayerDeath", "GS-Taser-DoPlayerDeath", function( ply )
	if ( IsValid( ply ) and ply.Tased ) then
		ResetPlayer( ply )
	end
end )
--PATH addons/rp_advdupe2/lua/entities/gmod_contr_spawner/shared.lua:
ENT.Type 			= "anim"
ENT.Base			= WireLib and "base_wire_entity" or "base_gmodentity"
ENT.PrintName		= "Contraption Spawner"
ENT.Author			= "TB"
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions	= ""

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

--PATH addons/foodmode/lua/entities/hfm_pot/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
	self.Emitter = ParticleEmitter(Vector(0,0,0))
	self.FireSound = CreateSound( self.Entity, "ambient/fire/fire_small_loop1.wav" )
	self.BigFireSound = CreateSound( self.Entity, "ambient/fire/fire_big_loop1.wav" )
	
	self.FireSound:Play()
end

function ENT:OnRemove()
	self.FireSound:Stop()
	self.BigFireSound:Stop()
end

function ENT:Draw()
	local CP = self:GetPos() + self:GetRight()* -6
	if self.Emitter then
		local Smoke = self.Emitter:Add("sprites/heatwave", CP )
		Smoke:SetVelocity( Vector(0,0,50) + VectorRand()*10)
		Smoke:SetDieTime( math.Rand(0.3,0.7) )
		Smoke:SetStartAlpha( 255 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 5 )
		Smoke:SetEndSize( 10 )				 		
		Smoke:SetColor( 0,math.random(150,255),255 )
		
		local NearFire = self.Emitter:Add("effects/fire_cloud1", CP + self:GetUp()*-5 )
		NearFire:SetVelocity( Vector(math.random(-10,10),math.random(-10,10),5) )
		NearFire:SetDieTime( math.Rand(0.3,0.3) )
		NearFire:SetStartAlpha( 255 )
		NearFire:SetEndAlpha( 0 )
		NearFire:SetStartSize( 2 )
		NearFire:SetEndSize( 2 )				 		
		NearFire:SetColor( math.random(150,255),math.random(170,255),255 )
	end
	
	if self:GetDTBool(0) then
		if !self.BigFire then
			self.BigFire = true
			self.BigFireSound:Play()
		end
		local NearFire = self.Emitter:Add("particle/smokesprites_0001", CP + self:GetUp()*-5 )
		NearFire:SetVelocity( Vector(math.random(-10,10),math.random(-10,10),50) )
		NearFire:SetDieTime( math.Rand(0.3,1) )
		NearFire:SetStartAlpha( 255 )
		NearFire:SetEndAlpha( 0 )
		NearFire:SetStartSize( 2 )
		NearFire:SetEndSize( 22 )				 		
		NearFire:SetColor( math.random(0,50),math.random(0,50),0 )
		
		local NearFire = self.Emitter:Add("effects/fire_cloud1", CP + self:GetUp()*-5 )
		NearFire:SetVelocity( Vector(math.random(-30,30),math.random(-30,30),0) )
		NearFire:SetDieTime( math.Rand(0.1,0.5) )
		NearFire:SetGravity(Vector(0,0,100))
		NearFire:SetStartAlpha( 255 )
		NearFire:SetEndAlpha( 0 )
		NearFire:SetStartSize( 10 )
		NearFire:SetEndSize( 10 )				 		
		NearFire:SetColor( math.random(150,255),math.random(170,255),255 )
	end
	if(EyePos():Distance(self.Entity:GetPos())<2000)then self.Entity:DrawModel()end	
end

--PATH gamemodes/darkrp/entities/entities/media_radio.lua:

AddCSLuaFile()

ENT.Base				= 'media_base'
ENT.PrintName			= 'Radio'
ENT.Category 			= 'RP Media'
ENT.Spawnable			= true

ENT.MediaPlayer = true
ENT.RemoveOnJobChange 	= true

ENT.TimeLimit = 15
ENT.Model = 'models/props_lab/citizenradio.mdl'

function ENT:CanUse(pl)
	return pl:IsSuperAdmin() or (pl == self.ItemOwner) or (pl == self:CPPIGetOwner())
end

if (CLIENT) then
	function ENT:GetTickerText(str)
		if self:IsPaused() then
			return 'Остановлено.', 60, 0
		end

		local tickertick = math.Remap(math.sin(CurTime()), -1, 1, 0, 1)

		surface.SetFont('Trebuchet18')
		local ts = surface.GetTextSize(str)

		local clippedextra = 0

		local extra = ts - 180
		local xmod = -extra*tickertick

		if xmod < 0 then
			str = str:sub(math.Round(math.abs(xmod) * 0.20))
		end

		local tsplus = xmod + extra
		if tsplus > 0 then
			local cutat = string.len(str) - math.Round(math.abs(tsplus) * 0.2)
			clippedextra = clippedextra - surface.GetTextSize(str:sub(cutat))

			str = str:sub(1, cutat)
		end

		return str, xmod + ts + clippedextra, TEXT_ALIGN_RIGHT
	end

	local color_red 	= ui.col.Red
	local color_white 	= ui.col.White
	local color_sup 	= ui.col.SUP
	function ENT:Draw()
		self:DrawModel()

		local pos = self:GetPos()
		local ang = self:GetAngles()
		ang:RotateAroundAxis(ang:Up(), 90)
		ang:RotateAroundAxis(ang:Forward(), 90)

		pos = pos + ang:Up() * 8.5
		pos = pos + ang:Right() * -15.3
		pos = pos + ang:Forward() * -5.7

		cam.Start3D2D(pos, ang, 0.1)
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawRect(0, 0, 170, 40)

			if self.Busy then
				local str, xmod, align = self:GetTickerText('Загрузка')
				draw.SimpleText(str, 'Trebuchet18', xmod, 8, (self:IsPaused()) and color_red or color_white, align)
			elseif ((self:GetStart() + self:GetTime()) >= CurTime()) then
				draw.Box(0, 30, math.Clamp(170 * (CurTime() - self:GetStart())/self:GetTime(), 0, 170), 5, color_sup)
				draw.Outline(0, 30, 170, 5, color_white)

				local str, xmod, align = self:GetTickerText(self:GetTitle())
				draw.SimpleText(str, 'Trebuchet18', xmod, 8, (self:IsPaused()) and color_red or color_white, align)
			else
				local str, xmod, align = self:GetTickerText('Нажмите E чтобы включить')
				draw.SimpleText(str, 'Trebuchet18', xmod, 8, (self:IsPaused()) and color_red or color_white, align)
			end

		cam.End3D2D()
	end
end
--PATH addons/111mod/lua/entities/metal_detector/cl_init.lua:
include('shared.lua')
local colors = {Color(0,0,0), Color(57,255,0), Color(255,0,0)}

function ENT:Draw()
	self:DrawModel()
	local ang = self:GetAngles()
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)
	cam.Start3D2D(self:GetPos() + ang:Up() * 0.65, ang, 0.1)
	draw.Box(-225, -606, 460, 144, colors[self:GetMode()])
	cam.End3D2D()
end
--PATH addons/111mod/lua/entities/travka_stol/shared.lua:
ENT.Base = "base_ai" 
ENT.Type = "ai"
ENT.PrintName = "Стол"
ENT.Category = "@GambitEnts"
ENT.Instructions = ""
ENT.Spawnable = true
--PATH addons/111mod/lua/entities/travka_vidashka/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Выдача посылок"
ENT.Category = "@GambitEnts"
ENT.Author = ""
ENT.Spawnable = true
ENT.AdminSpawnable = true
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_fuel_station_diesel/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Fuel: Diesel"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.VC_Type = "fuel"
ENT.VC_FuelType = 1
ENT.VC_CanBeDamaged = true
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_fuel_station_petrol/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_PVsb = util.GetPixelVisibleHandle() end

local ID = "Fuel_station"
function ENT:Draw(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].Draw then return VC.CodeEnt[ID].Draw(self, ...) end end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_npc_obj_spawn/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() end

local Mat_Square = Material("vcmod/square")

function ENT:Draw()
	local NPC = self:GetNWEntity("VC_NPC")
	if IsValid(NPC) and VC then
	render.SetMaterial(Mat_Square) local mins = self:OBBMins() local maxs = self:OBBMaxs() local height = 100

		local p1,p2,p3,p4 = Vector(0,0,0),Vector(0,0,0),Vector(0,0,0),Vector(0,0,0)
		local right = self:GetRight()*maxs.y
		local forw = self:GetForward()*maxs.x
		p1 = self:GetPos()-right+forw
		p2 = self:GetPos()+right+forw
		p3 = self:GetPos()+right-forw
		p4 = self:GetPos()-right-forw
		render.DrawQuad(p1+self:GetRight()*20,p2,p3,p4+self:GetRight()*20, Color(0,30,100,255))
		render.DrawQuad(p1+self:GetRight()*20,p2-right*2,p3-right*2,p4+self:GetRight()*20, Color(30,100,100,255))

		render.SetMaterial(VC.Material.Beam) render.DrawBeam(self:GetPos()+self:GetUp(), NPC:GetPos()+NPC:GetUp()*50, 5, 1, 1, Color(0, 30, 100, 255))

	render.DrawWireframeBox(self:GetPos(), self:GetAngles(), mins+Vector(0,0,height), maxs+Vector(0,0,-1.75), VC.DM_Menu_Color_Blue, true)
	end
end
--PATH addons/111mod/lua/entities/wanted_board/shared.lua:
AddCSLuaFile()

DEFINE_BASECLASS("base_gmodentity")

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Доска розыска"
ENT.Author = "Flizan | математика"
ENT.Information = "Картонная доска с объявлениями о розыске"
ENT.Category = "Прочее"

ENT.Editable = false
ENT.Spawnable = true
ENT.AdminOnly = false

function ENT:Initialize()
    self:SetModel("models/props/cs_office/offcorkboarda.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:PhysWake()

    if SERVER then
        self:SetUseType(SIMPLE_USE)

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:EnableMotion(false)
            local mins, maxs = phys:GetAABB()
            self:SetCollisionBounds(mins, maxs)
        end
    end
end

if SERVER then
    util.AddNetworkString("OpenWantedBoardMenu")

    function ENT:Use(activator, caller)
        if not activator:IsPlayer() then return end

        if self:GetPos():DistToSqr(activator:GetPos()) > 250000 then
            activator:ChatPrint("Вы слишком далеко, чтобы открыть это меню.")
            return
        end

        local wantedPlayers = {}
        for _, ply in ipairs(player.GetAll()) do
            if ply:getDarkRPVar("wanted") then
                table.insert(wantedPlayers, {
                    name = ply:Nick(),
                    reason = ply:getDarkRPVar("wantedReason") or "Не указана",
                    model = ply:GetModel()
                })
            end
        end

        net.Start("OpenWantedBoardMenu")
        net.WriteTable(wantedPlayers)
        net.Send(activator)
    end
end

if CLIENT then
    surface.CreateFont("MonstT", {
        font = "Montserrat SemiBold",
        size = 25,
        weight = 100,
        extended = true,
        shadow = true,
    })

    surface.CreateFont("Monst", {
        font = "Montserrat Bold",
        size = 30,
        weight = 500,
        extended = true,
    })

    surface.CreateFont("MonstName", {
        font = "Montserrat SemiBold",
        size = 20,
        weight = 500,
        extended = true,
        shadow = true
    })    
    
    surface.CreateFont("MonstReason", {
        font = "Montserrat Light",
        size = 20,
        weight = 100,
        extended = true,
    })

    surface.CreateFont("MonstReasonSmall", {
        font = "Montserrat Light",
        size = 16,
        weight = 100,
        extended = true,
    })    

    surface.CreateFont("MonstNameNoInfo", {
        font = "Montserrat SemiBold",
        size = 16,
        weight = 500,
        extended = true,
    })

    surface.CreateFont("MonstButton", {
        font = "Montserrat SemiBold",
        size = 20,
        weight = 500,
        extended = true,
    })

    surface.CreateFont("MonstNumber", {
        font = "Montserrat Regular",
        size = 15,
        weight = 700,
        extended = true,
    })

    surface.CreateFont("MonstNumber2", {
        font = "Montserrat SemiBold",
        size = 15,
        weight = 300,
        extended = true,
    })

    local gradient = Material("menu/pidor3.png")
    
    local menuOpen = false

    local textPosOffset = Vector(0, -1, 0)
    local textAngOffset = Angle(0, 180, 90)
    local textScale = 0.2
    
    local function DisablePlayerMovement(disable)
        if disable then
            hook.Add("StartCommand", "BlockPlayerMovement", function(ply, cmd)
                cmd:ClearMovement()
            end)
        else
            hook.Remove("StartCommand", "BlockPlayerMovement")
        end
    end

    function ENT:Draw()
        self:DrawModel()

        local ang = self:GetAngles()
        local pos = self:GetPos() + ang:Forward() * textPosOffset.x + ang:Right() * textPosOffset.y + ang:Up() * textPosOffset.z

        ang:RotateAroundAxis(ang:Right(), textAngOffset.pitch)
        ang:RotateAroundAxis(ang:Up(), textAngOffset.yaw)
        ang:RotateAroundAxis(ang:Forward(), textAngOffset.roll)

        cam.Start3D2D(pos, ang, textScale)
            draw.SimpleText("Доска розыска", "MonstT", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        cam.End3D2D()
    end

    local function CreateEmptyPanel(parent, x, y)
        local panel = vgui.Create("DPanel", parent)
        panel:SetSize(163, 219)
        panel:SetPos(x, y)
        panel:SetBackgroundColor(Color(31, 31, 31)) 
    
        function panel:Paint(w, h)
            draw.RoundedBox(10, 0, 0, w, h, Color(31, 31, 31))  
            draw.SimpleText("Информация", "MonstNameNoInfo", w / 2, h / 2 - 10, Color(97, 97, 97, 150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("отсутствует", "MonstNameNoInfo", w / 2, h / 2 + 3, Color(97, 97, 97, 150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    
        return panel
    end    
    
    local function SplitReason(reason)
        reason = reason:gsub("%c", "") 
    
        local firstLine, secondLine
        if utf8.len(reason) > 20 then
            firstLine = utf8.sub(reason, 1, 20)
            secondLine = utf8.sub(reason, 21)
        else
            firstLine = reason
            secondLine = nil
        end
    
        local words = string.Explode(" ", reason)
        if #words == 1 and utf8.len(words[1]) > 30 then
            return utf8.sub(words[1], 1, 30) .. "...", nil, false
        end
    
        return firstLine, secondLine, utf8.len(reason) > 20
    end
        
    local function CreatePanel(parent, x, y, nickname, reason, model, number)
        local panel = vgui.Create("DPanel", parent)
        panel:SetSize(163, 219)
        panel:SetPos(x, y)
        panel:SetBackgroundColor(Color(38, 38, 38))
    
        panel.ExpandFrac = 0
        panel.ExpandSpeed = 5
    
        panel.Think = function(self)
            if self:IsHovered() then
                self.ExpandFrac = math.min(self.ExpandFrac + FrameTime() * self.ExpandSpeed, 1)
            else
                self.ExpandFrac = math.max(self.ExpandFrac - FrameTime() * self.ExpandSpeed, 0)
            end
        end
    
        local playerModel = vgui.Create("DModelPanel", panel)
        playerModel:SetSize(panel:GetWide(), panel:GetTall())
        playerModel:SetModel(model)
    
        function playerModel:LayoutEntity(Entity)
            Entity:SetAngles(Angle(0, 0, 0))
        end
    
        local headpos = (playerModel.Entity:LookupBone("ValveBiped.Bip01_Head1")) and playerModel.Entity:GetBonePosition(playerModel.Entity:LookupBone("ValveBiped.Bip01_Head1")) or playerModel.Entity:WorldSpaceCenter()
        playerModel:SetLookAt(headpos)
        playerModel:SetCamPos(headpos - Vector(-18, 0, 0))
        playerModel.Entity:SetEyeTarget(Vector(-1, 0, 0))
    
        playerModel:SetMouseInputEnabled(false)
        playerModel:SetKeyboardInputEnabled(false)
    
        function panel:Paint(w, h)
            local borderColor = Color(25, 25, 25)
            if self:IsHovered() then
                borderColor = Color(0, 117, 223)
            end
    
            local borderWidth = 2
            draw.RoundedBox(10, 0, 0, w, h, borderColor)
            draw.RoundedBox(10, borderWidth, borderWidth, w - 2 * borderWidth, h - 2 * borderWidth, Color(25, 25, 25))
        end
    
        function panel:PaintOver(w, h)
            if self:IsHovered() then
                surface.SetDrawColor(255, 255, 255, 128)
                surface.SetMaterial(gradient)
                surface.DrawTexturedRect(2, 2, w - 4, h - 4)
                draw.RoundedBox(0, (w - 130) / 2, h - 2, 130, 2, Color(0, 117, 223))
            end
        
            local nicknameY = Lerp(self.ExpandFrac, h - 25, h - 45)
            local reasonAlpha = Lerp(self.ExpandFrac, 0, 255)
        
            draw.SimpleText(nickname, "MonstName", w / 2, nicknameY, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
            
            local firstLine, secondLine, useSmallFont = SplitReason(reason)
            local reasonFont = useSmallFont and "MonstReasonSmall" or "MonstReason"
            
            if secondLine then
                draw.SimpleText(firstLine, reasonFont, w / 2, h - 30, Color(255, 255, 255, reasonAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
                draw.SimpleText(secondLine, reasonFont, w / 2, h - 15, Color(255, 255, 255, reasonAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
            else
                draw.SimpleText(firstLine, reasonFont, w / 2, h - 30, Color(255, 255, 255, reasonAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
            end
        end                                              
    
        local numberPanel = vgui.Create("DPanel", panel)
        numberPanel:SetSize(20, 20)
        numberPanel:SetPos(5, 5)
    
        function numberPanel:Paint(w, h)
            local bgColor = Color(48, 48, 48, 128)
            if panel:IsHovered() then
                bgColor = Color(0, 117, 223)
            end
            draw.RoundedBox(5, 0, 0, w, h, bgColor)
            draw.SimpleText(number, "MonstNumber", w / 2, h / 2, Color(255, 255, 255, 150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    
        return panel
    end
    

    local arrowLeft = Material("menu/left.png")
    local arrowRight = Material("menu/right.png")
    
    local function CreatePagination(parent, numPages, currentPage, onPageChange)
        if numPages <= 1 then return end
    
        local pagination = vgui.Create("DPanel", parent)
        pagination:SetSize(numPages * 24 + 200, 24) 
        pagination:SetPos(parent:GetWide() / 2 - pagination:GetWide() / 2, parent:GetTall() - 40)
    
        function pagination:Paint(w, h)
        end
    
        local currentPageLabel = vgui.Create("DLabel", pagination)
        currentPageLabel:SetPos(5, 0) 
        currentPageLabel:SetSize(60, 20)
        currentPageLabel:SetText("Стр. " .. currentPage)
        currentPageLabel:SetFont("MonstNumber2")
        currentPageLabel:SetTextColor(Color(255, 255, 255, 255))
        currentPageLabel:SetContentAlignment(5)
    
        local prevPageButton = vgui.Create("DButton", pagination)
        prevPageButton:SetSize(24, 24)
        prevPageButton:SetPos(currentPageLabel:GetWide() + 5, 0) 
        prevPageButton:SetText("")
        prevPageButton:SetTooltip("Предыдущая страница")
    
        function prevPageButton:Paint(w, h)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.SetMaterial(arrowLeft)
            surface.DrawTexturedRect(0, 0, w, h)
        end
    
        prevPageButton.DoClick = function()
            if currentPage > 1 then
                onPageChange(currentPage - 1)
            end
        end
    
        local function CreatePageButton(x, y, page)
            local button = vgui.Create("DPanel", pagination)
            button:SetSize(16, 16)
            button:SetPos(x, y)
    
            function button:Paint(w, h)
                local color = (page == currentPage) and Color(0, 117, 223) or Color(48, 48, 48)
                draw.RoundedBox(8, 0, 0, w, h, color)
            end
    
            button.OnMousePressed = function()
                onPageChange(page)
            end
    
            return button
        end
    
        local startX = prevPageButton:GetWide() + currentPageLabel:GetWide() + 15 
        local spacing = 22
    
        for i = 1, numPages do
            CreatePageButton(startX + spacing * (i - 1), pagination:GetTall() / 2 - 8, i)
        end
    
        local nextPageButton = vgui.Create("DButton", pagination)
        nextPageButton:SetSize(24, 24)
        nextPageButton:SetPos(startX + spacing * numPages + 5, 0) 
        nextPageButton:SetText("")
        nextPageButton:SetTooltip("Следующая страница")
    
        function nextPageButton:Paint(w, h)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.SetMaterial(arrowRight)
            surface.DrawTexturedRect(0, 0, w, h)
        end
    
        nextPageButton.DoClick = function()
            if currentPage < numPages then
                onPageChange(currentPage + 1)
            end
        end
    
        local lastPageLabel = vgui.Create("DLabel", pagination)
        lastPageLabel:SetPos(nextPageButton:GetWide() + startX + spacing * numPages + 10, 0) 
        lastPageLabel:SetSize(60, 20)
        lastPageLabel:SetText("Стр. " .. numPages)
        lastPageLabel:SetFont("MonstNumber2")
        lastPageLabel:SetTextColor(Color(255, 255, 255, 255))
        lastPageLabel:SetContentAlignment(5)
    end
    
    local function CreateMenu(wantedPlayers)
        if menuOpen then return end
        menuOpen = true
        gui.EnableScreenClicker(true)
        DisablePlayerMovement(true)

        local panel = vgui.Create("DPanel")
        panel:SetSize(896, 570)
        panel:Center()

        function panel:Paint(w, h)
            draw.RoundedBox(25, 0, 0, w, h, Color(0, 117, 222, 255))
        end

        local innerPanel = vgui.Create("DPanel", panel)
        innerPanel:SetSize(892, 566)
        innerPanel:SetPos(2, 2)

        function innerPanel:Paint(w, h)
            draw.RoundedBox(25, 0, 0, w, h, Color(38, 38, 38, 255))
        end

        local closeButton = vgui.Create("DButton", panel)
        closeButton:SetSize(35, 26.53)
        closeButton:SetPos(panel:GetWide() - closeButton:GetWide() - 15, 15)
        closeButton:SetText("X")
        closeButton:SetFont("MonstButton")
        closeButton:SetTextColor(Color(255, 255, 255, 255))

        function closeButton:Paint(w, h)
            draw.RoundedBox(8, 0, 0, w, h, Color(255, 0, 0, 255))
        end

        closeButton.DoClick = function()
            panel:Remove()
            gui.EnableScreenClicker(false)
            DisablePlayerMovement(false)
            menuOpen = false
        end

        local titleLabel = vgui.Create("DLabel", innerPanel)
        titleLabel:SetPos(20, 15)
        titleLabel:SetFont("Monst")
        titleLabel:SetText("Доска разыскиваемых")
        titleLabel:SetTextColor(Color(255, 255, 255, 255))
        titleLabel:SizeToContents()
    
        local startX, startY = 20, 60
        local paddingX, paddingY = 10, 10
        local numCols = 5
        local panelWidth, panelHeight = 163, 219
        local itemsPerPage = numCols * 2
        local currentPage = 1
        local numPages = math.ceil(#wantedPlayers / itemsPerPage)
    
        local function UpdatePanels()
            for _, child in ipairs(innerPanel:GetChildren()) do
                if not (child == closeButton or child == titleLabel) then
                    child:Remove()
                end
            end
    
            local firstItem = (currentPage - 1) * itemsPerPage + 1
            local lastItem = math.min(firstItem + itemsPerPage - 1, #wantedPlayers)
            local row = 0
            local col = 0
    
            for i = 1, itemsPerPage do
                local x = startX + (panelWidth + paddingX) * col
                local y = startY + (panelHeight + paddingY) * row
                if firstItem + i - 1 <= #wantedPlayers then
                    local info = wantedPlayers[firstItem + i - 1]
                    CreatePanel(innerPanel, x, y, info.name, info.reason, info.model, firstItem + i - 1)
                else
                    CreateEmptyPanel(innerPanel, x, y)
                end
                col = col + 1
                if col >= numCols then
                    col = 0
                    row = row + 1
                end
            end
    
            if #wantedPlayers > itemsPerPage then
                CreatePagination(innerPanel, numPages, currentPage, function(page)
                    currentPage = page
                    UpdatePanels()
                end)
            end
        end
    
        UpdatePanels()
    end
    
    net.Receive("OpenWantedBoardMenu", function()
        local wantedPlayers = net.ReadTable()
        CreateMenu(wantedPlayers)
    end)
end

scripted_ents.Register(ENT, "wanted_board")

--PATH addons/snowball/lua/entities/zck_snowball/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Initialize()
	-- ParticleEffectAttach("zck_snowball_trail", PATTACH_POINT_FOLLOW, self, 0)
end

function ENT:OnRemove()
	-- ParticleEffect("zck_snowball_explode", self:GetPos(), Angle(0, 0, 0), NULL)
	self:EmitSound("zck_snowball_impact")
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_machine_frezzer/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Frezzer.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Frezzer.Draw(self)
end

function ENT:Think()
    zmlab2.Frezzer.Think(self)
	self:SetNextClientThink(CurTime())
	return true
end

function ENT:OnRemove()
    zmlab2.Frezzer.OnRemove(self)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_storage/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Storage.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Storage.DrawUI(self)
end

function ENT:OnRemove()
	zmlab2.Storage.OnRemove(self)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_table/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Table.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Table.Draw(self)
end

function ENT:Think()
	zmlab2.Table.Think(self)
	self:SetNextClientThink(CurTime())

	return true
end

function ENT:OnRemove()
	zmlab2.Table.OnRemove(self)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_tent_door/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_tent_door.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Tent"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()

    self:NetworkVar("Bool", 1, "IsLocked")
    self:NetworkVar("Bool", 2, "IsPublic")
    self:NetworkVar("Int", 1, "NextInteraction")
    if (SERVER) then
        self:SetIsLocked(false)
        self:SetIsPublic(false)
        self:SetNextInteraction(-1)
    end
end

function ENT:OnLockButton(ply)
    local trace = ply:GetEyeTrace()

    if trace.Hit and trace.HitPos and IsValid(trace.Entity) and trace.Entity == self and zmlab2.util.InDistance(self:GetPos(), ply:GetPos(), 100) then

        local lp = self:WorldToLocal(trace.HitPos)
        if lp.x > -5 and lp.x < 5 and lp.y < 11 and lp.y > -11 and lp.z > 20 and lp.z < 40 then
            return true
        else
            return false
        end
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

--PATH addons/zeros_weedfarm/lua/entities/zwf_nutrition/cl_init.lua:
include("shared.lua")

function ENT:Initialize()

end

function ENT:Draw()
	self:DrawModel()

	if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 300) then
		self:DrawInfo()
	end
end

function ENT:DrawInfo()

	if self.NutData == nil then
		self.NutData = zwf.config.Nutrition[self:GetNutritionID()]
	else

		cam.Start3D2D(self:LocalToWorld(Vector(0, 0, 25)), Angle(0, EyeAngles().y - 90, -EyeAngles().x + 90), 0.05)

			// Title
			draw.SimpleText(self.NutData.name, "zwf_seed_font01", 0, 10, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )

		cam.End3D2D()
	end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_oven/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_oven.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Oven"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE


function ENT:SetupDataTables()

    self:NetworkVar("Bool", 0, "IsBaking")

    // 0 = idle, 1 = open , 2 = close
    self:NetworkVar("Int", 0, "WorkState")

    if (SERVER) then
        self:SetIsBaking(false)
        self:SetWorkState(1)
    end
end

function ENT:OnRemoveButton(ply)
    local trace = ply:GetEyeTrace()

    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -8.5 and lp.x < 0 and lp.y < 12 and lp.y > 11 and lp.z > 14 and lp.z < 18 then
        return true
    else
        return false
    end
end

function ENT:OnStartButton(ply)
    local trace = ply:GetEyeTrace()

    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > 2.5 and lp.x < 8 and lp.y < 7 and lp.y > 6 and lp.z > 24.7 and lp.z < 27.2 then
        return true
    else
        return false
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_seed/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	self.SeedData = nil
end

function ENT:Draw()
	self:DrawModel()

	if GetConVar("zwf_cl_vfx_drawui"):GetInt() == 1 and zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 300) then
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

function ENT:DrawInfo()

	if self.SeedData == nil then
		self.SeedData = zwf.config.Plants[self:GetSeedID()]
	else

		local Perf_Time = self:GetPerf_Time()
		local Perf_Amount = self:GetPerf_Amount()
		local Perf_THC = self:GetPerf_THC()


		local c_time = self:GetColorFromBoostValue(Perf_Time)
		local c_amount = self:GetColorFromBoostValue(Perf_Amount)
		local c_thc = self:GetColorFromBoostValue(Perf_THC)


		Perf_Time = 100 - (Perf_Time - 100)
		Perf_Time = Perf_Time * 0.01
		local def_time = self.SeedData.Grow.Duration
		Perf_Time = def_time * Perf_Time
		Perf_Time = math.Round(Perf_Time) .. "s"

		Perf_Amount = Perf_Amount * 0.01
		local def_amount = self.SeedData.Grow.MaxYieldAmount
		Perf_Amount = def_amount * Perf_Amount
		Perf_Amount = math.Round(Perf_Amount) .. zwf.config.UoW

		Perf_THC = Perf_THC * 0.01
		local def_thc = self.SeedData.thc_level
		Perf_THC = def_thc * Perf_THC
		Perf_THC = math.Round(Perf_THC) .. "%"



		cam.Start3D2D(self:LocalToWorld(Vector(0, 0, 15)), Angle(0, EyeAngles().y - 90, -EyeAngles().x + 90), 0.05)

			if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 100) then
				draw.RoundedBox(15, -250 , -150, 500, 225,  zwf.default_colors["black03"])

				draw.SimpleText(self:GetSeedName() .. " x" .. self:GetSeedCount(), "zwf_seed_font01", 0, -250, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

				surface.SetDrawColor(zwf.default_colors["white01"])
				surface.SetMaterial(zwf.default_materials["icon_growtime"])
				surface.DrawTexturedRect(-230, -125, 100, 100)

				surface.SetDrawColor(zwf.default_colors["white01"])
				surface.SetMaterial(zwf.default_materials["icon_mass"])
				surface.DrawTexturedRect(-50, -125, 100, 100)

				surface.SetDrawColor(zwf.default_colors["white01"])
				surface.SetMaterial(zwf.default_materials["icon_thc"])
				surface.DrawTexturedRect(120, -125, 100, 100)

				draw.SimpleText(Perf_Time, "zwf_seed_font02", -175, 30, c_time, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText(Perf_Amount, "zwf_seed_font02", 0, 30, c_amount, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText(Perf_THC, "zwf_seed_font02", 175, 30, c_thc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText(self:GetSeedName() .. " x" .. self:GetSeedCount(), "zwf_seed_font01", 0, 0, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			end

		cam.End3D2D()
	end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_seed_bank/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
end

function ENT:Draw()
	self:DrawModel()
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_ventilator/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_ventilator01.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Ventilator"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Power")
    self:NetworkVar("Bool", 0, "IsRunning")
    self:NetworkVar("Entity", 0, "Output")
    self:NetworkVar("Entity", 1, "PowerSource")
    if (SERVER) then
        self:SetPower(0)
        self:SetIsRunning(false)
        self:SetPowerSource(NULL)
        self:SetOutput(NULL)
    end
end


function ENT:EnableButton(ply)
    local trace = ply:GetEyeTrace()

    local lp = self:WorldToLocal(trace.HitPos)
    if lp.z > 36 and lp.z < 39 and lp.x < 1.2 and lp.x > -1.2 then
        return true
    else
        return false
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_watertank/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_watertank.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Water Tank"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Water")
    self:NetworkVar("Entity", 0, "Output")
    if (SERVER) then
        self:SetWater(zwf.config.WaterTank.Capacity)
        self:SetOutput(NULL)
    end
end


function ENT:RefillButton(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.z > 37 and lp.z < 42 and lp.x < 10 and lp.x > -10 and lp.y < 33 and lp.y > 31 then
        return true
    else
        return false
    end
end

--PATH addons/enc_scripts/lua/es/_vgui/cl_esbar.lua:
local MaskMaterial = CreateMaterial('!brsmask', 'UnlitGeneric', {
    ['$translucent'] = 1,
    ['$vertexalpha'] = 1,
    ['$alpha'] = 1,
}) // rounded mask

local PANEL = {}

function PANEL:Init()
    self.avatar = vgui.Create('Panel', self) // panel for rounded
    self.avatar:SetY(self.avatar:GetY())
    self.avatar:SetPaintedManually(true)
end

function PANEL:PerformLayout()
    self.avatar:SetSize(self:GetWide(), self:GetTall())
end

do
    local renderTarget, previousRenderTarget
    function PANEL:Paint(w, h)
        if not renderTarget then
            renderTarget = GetRenderTargetEx('GRADIENT_ROUNDEDAVATAR', ScrW(), ScrH(), RT_SIZE_FULL_FRAME_BUFFER, MATERIAL_RT_DEPTH_NONE, 2, CREATERENDERTARGETFLAGS_UNFILTERABLE_OK, IMAGE_FORMAT_RGBA8888)
        end

        if not previousRenderTarget then
            previousRenderTarget = render.GetRenderTarget() 
        end

        render.PushRenderTarget(renderTarget)
        render.OverrideAlphaWriteEnable(true, true)
        render.Clear(0, 0, 0, 0) 

        self.avatar:PaintManual()

        render.OverrideBlendFunc(true, BLEND_ZERO, BLEND_SRC_ALPHA, BLEND_DST_ALPHA, BLEND_ZERO)
        draw.RoundedBoxEx(32, 0, 0, w, h, Color(255, 255, 255), false, false, true, true)
        render.OverrideBlendFunc(false)
        render.OverrideAlphaWriteEnable(false)
        render.PopRenderTarget() 

        MaskMaterial:SetTexture('$basetexture', renderTarget)

        draw.NoTexture()

        surface.SetDrawColor(255,255,255) 
        surface.SetMaterial(MaskMaterial) 
        render.SetMaterial(MaskMaterial)
        render.DrawScreenQuad() 
    end
end
    
vgui.Register('GBar', PANEL, 'Panel')
--PATH addons/enc_scripts/lua/es/question/cl_init.lua:
local function urlencode(str)
    if str then
        str = string.gsub(str, "\n", "\r\n")
        str = string.gsub(str, "([^%w ])", function(c) return string.format("%%%02X", string.byte(c)) end)
        str = string.gsub(str, " ", "+")
    end
    return str
end

local function urldecode(str)
    if str then
        str = string.gsub(str, "+", " ")
        str = string.gsub(str, "%%(%x%x)", function(h) return string.char(tonumber(h, 16)) end)
    end
    return str
end

local panelNum = 0
local voteVgui = {}
local creationOrder = {}
local panelSpacing = ES.ScreenScale(5) * 0.8
local notificationQueue = {}
local processingPassport = false
local keyProcessed = false

local drawRoundedBox = draw.RoundedBox
local drawSimpleText = draw.SimpleText
local setFont = surface.SetFont
local getTextSize = surface.GetTextSize

local function getTextWidth(txt, font)
    setFont(font)
    local width, _ = getTextSize(txt)
    return width
end

local function textWrap(segments, width, font, name1, name2, extraPadding)
    local resultLines = {{}}
    local currentLineWidth = 0
    local offset = 10 + (extraPadding * 2)

    for _, segment in ipairs(segments) do
        local segmentWidth = getTextWidth(segment, font)

        if currentLineWidth + segmentWidth + getTextWidth(" ", font) > width - offset then
            table.insert(resultLines, {})
            currentLineWidth = 3
        end

        if segment == name1 then
            table.insert(resultLines[#resultLines], {text = segment, color = Color(0, 118, 224)})
        elseif segment == name2 then
            table.insert(resultLines[#resultLines], {text = segment, color = Color(202, 39, 39)})
        else
            table.insert(resultLines[#resultLines], {text = segment, color = Color(255, 255, 255)})
        end

        currentLineWidth = currentLineWidth + segmentWidth + getTextWidth(" ", font)
    end

    return resultLines
end

local function updatePanelPositions()
    local num = ES.ScreenScale(25) * 0.8
    for _, id in ipairs(creationOrder) do
        if voteVgui[id] then
            voteVgui[id]:SetPos(ES.ScreenScale(25) * 0.8, num)
            num = num + voteVgui[id]:GetTall() + panelSpacing  
        end
    end
end

local function processNextInQueue()
    if #notificationQueue > 0 then
        local notificationFunc = table.remove(notificationQueue, 1)
        notificationFunc()
    else
        processingPassport = false
    end
end

local function createVoteVgui()
    local question = net.ReadString()
    local quesid = net.ReadString()
    local delay = net.ReadUInt(6)
    local fromPly = net.ReadString()
    local toPly = net.ReadString()
    local oldTime = CurTime()

    local function showNotification()
        local frame = vgui.Create('EditablePanel')
        frame:SetSize(ES.ScreenScale(300) * 0.8, ES.ScreenScale(140) * 0.8)
        frame:SetPos(ES.ScreenScale(25) * 0.8, ES.ScreenScale(25) * 0.8 + panelNum)
        frame:SetAlpha(0)
        frame:AlphaTo(255, 0.2)
        frame.rounded = 0
        frame.clr = ColorAlpha(ES.Colors['bg'], 250)
        
        function frame:Paint(w, h)
            drawRoundedBox(16, 0, 0, w, h, self.clr)
        end
        
        function frame:OnRemove()
            panelNum = panelNum - self:GetTall() + panelSpacing

            for i, id in ipairs(creationOrder) do
                if id == quesid then
                    table.remove(creationOrder, i)
                    break
                end
            end

            updatePanelPositions()

            voteVgui[quesid] = nil
            processNextInQueue()
        end
        
        function frame:Think()
            if delay - (CurTime() - oldTime) <= 0 then
                self:Remove()
            end

            if not keyProcessed and input.IsKeyDown(KEY_F1) then
                keyProcessed = true
                LocalPlayer():ConCommand('vote ' .. quesid .. ' yea')
                LocalPlayer():ConCommand('new_ans ' .. quesid .. ' 1\n')
                self:Remove()
            elseif not keyProcessed and input.IsKeyDown(KEY_F2) then
                keyProcessed = true
                LocalPlayer():ConCommand('vote ' .. quesid .. ' nay')
                LocalPlayer():ConCommand('new_ans ' .. quesid .. ' 2\n')
                self:Remove()
            end

            if not input.IsKeyDown(KEY_F1) and not input.IsKeyDown(KEY_F2) then
                keyProcessed = false
            end
        end

        frame.bar = vgui.Create('GBar', frame) 
        frame.bar:SetSize(frame:GetWide(), ES.ScreenScale(40) * 0.8)
        local endTime = CurTime() + delay
        local lerp = 0
        
        function frame.bar.avatar:Paint(w, h)
            local progress = endTime - CurTime()
            lerp = Lerp(FrameTime() * 8, lerp, progress)
            local newW = w * math.Clamp(lerp / delay, 0, 1)

            drawRoundedBox(0, 0, ES.ScreenScale(28), w, h , ES.Colors['bar'])
            drawRoundedBox(0, 0, ES.ScreenScale(28), newW, h , ES.Colors['main'])
        end

        frame.panel = vgui.Create('Panel', frame)
        frame.panel:Dock(FILL)
        frame.panel:DockMargin(ES.ScreenScale(15) * 0.8, ES.ScreenScale(45) * 0.8, ES.ScreenScale(15) * 0.8, 0)
        local label

        local extraPadding = ES.ScreenScale(5) * 0.8

        frame.panel.SetText = function() 
            if IsValid(label) then return end

            question = question:gsub("\n", " ")
            question = question:gsub("[%s.,:]", " ")

            local segments = {}
            for s in string.gmatch(question, '[^ ]+') do
                segments[#segments + 1] = s
            end
            
            local wrapped = textWrap(segments, frame.panel:GetWide(), 'MM_14', fromPly, toPly, extraPadding)

            local y = ES.ScreenScale(15) * 0.8
            for _, line in ipairs(wrapped) do
                local currentX = ES.ScreenScale(15) * 0.8
                for _, segment in ipairs(line) do
                    label = vgui.Create("DLabel", frame)
                    label:SetFont('MB_16')
                    label:SetText(segment.text)
                    label:SetTextColor(segment.color)
                    label:SizeToContents()

                    if segment.text == fromPly or segment.text == toPly then
                        label:SetPos(currentX + extraPadding - 4, y)
                        currentX = currentX + label:GetWide() + getTextWidth(" ", 'MM_14') + extraPadding
                    else
                        label:SetPos(currentX, y)
                        currentX = currentX + label:GetWide() + getTextWidth(" ", 'MM_14')
                    end
                end
                y = y + ES.ScreenScale(20) * 0.8
            end

            frame:SetTall(y + ES.ScreenScale(52))

            frame.panel:Dock(FILL)
            frame.panel:DockMargin(ES.ScreenScale(15) * 0.8, ES.ScreenScale(15) * 0.8, ES.ScreenScale(15) * 0.8, 0)

            frame.bar:SetPos(0, frame:GetTall() - ES.ScreenScale(32))
        end
        
        function frame.panel:PerformLayout()
            self:SetText()
        end

        frame.buttons = vgui.Create('Panel', frame)
        frame.buttons:Dock(BOTTOM)
        frame.buttons:DockMargin(ES.ScreenScale(15) * 0.8, 0, ES.ScreenScale(15) * 0.8, ES.ScreenScale(15) * 0.8)
        frame.buttons:SetTall(ES.ScreenScale(31) * 0.8)

        local buttons = {
            {
                name = 'Да',
                color = ES.Colors['green'],
                dock = LEFT,
                info = 'F1',
                func = function()
                    LocalPlayer():ConCommand('vote ' .. quesid .. ' yea')
                    LocalPlayer():ConCommand('new_ans ' .. quesid .. ' 1\n')
                    frame:Remove()
                end
            },
            {
                name = 'Нет',
                color = ES.Colors['red'],
                dock = RIGHT,
                info = 'F2',
                func = function()
                    LocalPlayer():ConCommand('vote ' .. quesid .. ' nay')
                    LocalPlayer():ConCommand('new_ans ' .. quesid .. ' 2\n')
                    frame:Remove()
                end
            }, 
        }

        for k, v in ipairs(buttons) do
            local but = vgui.Create('GButton', frame.buttons)
            but:Dock(v.dock)
            but:SetWide(ES.ScreenScale(132) * 0.8)
            but.frame = frame
            function but:Paint(w, h)
                drawRoundedBox(8, 0, 0, w, h, v.color)
                drawSimpleText(v.name, 'MSB_12', ES.ScreenScale(8) * 0.8, h / 2, ES.Colors['white'], 0, 1)
        
                drawRoundedBox(8, w - ES.ScreenScale(28) * 0.8, ES.ScreenScale(6) * 0.8, ES.ScreenScale(23) * 0.8, ES.ScreenScale(21) * 0.8, ES.Colors['bg'])
                drawSimpleText(v.info, 'MSB_10', (w - ES.ScreenScale(28) * 0.8) + ES.ScreenScale(11) * 0.8, h / 2, ES.Colors['white'], 1, 1)
            end
            
            function but:DoClick()
                v.func()
            end
        end

        panelNum = panelNum + frame:GetTall() + panelSpacing

        voteVgui[quesid] = frame
        table.insert(creationOrder, quesid)

        updatePanelPositions()
    end

    table.insert(notificationQueue, showNotification)
    if #notificationQueue == 1 then
        processNextInQueue()
    end
end

local function createNotification(isFake)
    local fromPlayerName = urldecode(net.ReadString()) 
    local fromPlayer = net.ReadEntity()
    local quesid = tostring(CurTime())
    local oldTime = CurTime()
    local delay = 15

    local function showNotification()
        local frame = vgui.Create('EditablePanel')
        frame:SetSize(ES.ScreenScale(300) * 0.8, ES.ScreenScale(140) * 0.8)
        frame:SetPos(ES.ScreenScale(25) * 0.8, ES.ScreenScale(25) * 0.8 + panelNum)
        frame:SetAlpha(0)
        frame:AlphaTo(255, 0.2)
        frame.rounded = 0
        frame.clr = ColorAlpha(ES.Colors['bg'], 250)
        
        function frame:Paint(w, h)
            drawRoundedBox(16, 0, 0, w, h, self.clr)
        end
        
        function frame:OnRemove()
            panelNum = panelNum - self:GetTall() + panelSpacing

            for i, id in ipairs(creationOrder) do
                if id == quesid then
                    table.remove(creationOrder, i)
                    break
                end
            end

            updatePanelPositions()

            processNextInQueue()
        end
        
        function frame:Think()
            if delay - (CurTime() - oldTime) <= 0 then
                self:Remove()
            end

            if not keyProcessed and input.IsKeyDown(KEY_F1) then
                keyProcessed = true
                net.Start(isFake and "AcceptFakePassport" or "AcceptPassport")
                net.WriteEntity(fromPlayer)
                net.WriteString(quesid) 
                net.SendToServer()
                self:Remove()
            elseif not keyProcessed and input.IsKeyDown(KEY_F2) then
                keyProcessed = true
                self:Remove()
            end

            if not input.IsKeyDown(KEY_F1) and not input.IsKeyDown(KEY_F2) then
                keyProcessed = false
            end
        end

        frame.bar = vgui.Create('GBar', frame) 
        frame.bar:SetSize(frame:GetWide(), ES.ScreenScale(40) * 0.8)
        local endTime = CurTime() + delay
        local lerp = 0
        
        function frame.bar.avatar:Paint(w, h)
            local progress = endTime - CurTime()
            lerp = Lerp(FrameTime() * 8, lerp, progress)
            local newW = w * math.Clamp(lerp / delay, 0, 1)

            drawRoundedBox(0, 0, ES.ScreenScale(28), w, h , ES.Colors['bar'])
            drawRoundedBox(0, 0, ES.ScreenScale(28), newW, h , ES.Colors['main'])
        end

        frame.panel = vgui.Create('Panel', frame)
        frame.panel:Dock(FILL)
        frame.panel:DockMargin(ES.ScreenScale(15) * 0.8, ES.ScreenScale(45) * 0.8, ES.ScreenScale(15) * 0.8, 0)
        local label

        local extraPadding = ES.ScreenScale(5) * 0.8

        frame.panel.SetText = function() 
            if IsValid(label) then return end

            local question = fromPlayerName .. " хочет показать паспорт"
            question = question:gsub("\n", " ")
            question = question:gsub("[%s.,:]", " ")

            local segments = {}
            for s in string.gmatch(question, '[^ ]+') do
                segments[#segments + 1] = s
            end
            
            local wrapped = textWrap(segments, frame.panel:GetWide(), 'MM_14', fromPlayerName, LocalPlayer():Nick(), extraPadding)

            local y = ES.ScreenScale(15) * 0.8
            for _, line in ipairs(wrapped) do
                local currentX = ES.ScreenScale(15) * 0.8
                for _, segment in ipairs(line) do
                    label = vgui.Create("DLabel", frame)
                    label:SetFont('MB_16')
                    label:SetText(segment.text)
                    label:SetTextColor(segment.color)
                    label:SizeToContents()

                    if segment.text == fromPlayerName or segment.text == LocalPlayer():Nick() then
                        label:SetPos(currentX + extraPadding - 4, y)
                        currentX = currentX + label:GetWide() + getTextWidth(" ", 'MM_14') + extraPadding
                    else
                        label:SetPos(currentX, y)
                        currentX = currentX + label:GetWide() + getTextWidth(" ", 'MM_14')
                    end
                end
                y = y + ES.ScreenScale(20) * 0.8
            end

            frame:SetTall(y + ES.ScreenScale(52))

            frame.panel:Dock(FILL)
            frame.panel:DockMargin(ES.ScreenScale(15) * 0.8, ES.ScreenScale(15) * 0.8, ES.ScreenScale(15) * 0.8, 0)

            frame.bar:SetPos(0, frame:GetTall() - ES.ScreenScale(32))
        end
        
        function frame.panel:PerformLayout()
            self:SetText()
        end

        frame.buttons = vgui.Create('Panel', frame)
        frame.buttons:Dock(BOTTOM)
        frame.buttons:DockMargin(ES.ScreenScale(15) * 0.8, 0, ES.ScreenScale(15) * 0.8, ES.ScreenScale(15) * 0.8)
        frame.buttons:SetTall(ES.ScreenScale(31) * 0.8)

        local buttons = {
            {
                name = 'Да',
                color = ES.Colors['green'],
                dock = LEFT,
                info = 'F1',
                func = function()
                    net.Start(isFake and "AcceptFakePassport" or "AcceptPassport")
                    net.WriteEntity(fromPlayer)
                    net.WriteString(quesid) 
                    net.SendToServer()
                    frame:Remove()
                end
            },
            {
                name = 'Нет',
                color = ES.Colors['red'],
                dock = RIGHT,
                info = 'F2',
                func = function()
                    frame:Remove()
                end
            }, 
        }

        for k, v in ipairs(buttons) do
            local but = vgui.Create('GButton', frame.buttons)
            but:Dock(v.dock)
            but:SetWide(ES.ScreenScale(132) * 0.8)
            but.frame = frame
            function but:Paint(w, h)
                drawRoundedBox(8, 0, 0, w, h, v.color)
                drawSimpleText(v.name, 'MSB_12', ES.ScreenScale(8) * 0.8, h / 2, ES.Colors['white'], 0, 1)
        
                drawRoundedBox(8, w - ES.ScreenScale(28) * 0.8, ES.ScreenScale(6) * 0.8, ES.ScreenScale(23) * 0.8, ES.ScreenScale(21) * 0.8, ES.Colors['bg'])
                drawSimpleText(v.info, 'MSB_10', (w - ES.ScreenScale(28) * 0.8) + ES.ScreenScale(11) * 0.8, h / 2, ES.Colors['white'], 1, 1)
            end
            
            function but:DoClick()
                v.func()
            end
        end

        panelNum = panelNum + frame:GetTall() + panelSpacing

        voteVgui[quesid] = frame
        table.insert(creationOrder, quesid)

        updatePanelPositions()
    end

    table.insert(notificationQueue, showNotification)
    if #notificationQueue == 1 then
        processNextInQueue()
    end
end

local function createNotification(isFake)
    local fromPlayerName = urldecode(net.ReadString()) 
    local fromPlayer = net.ReadEntity()
    local quesid = tostring(CurTime())
    local oldTime = CurTime()
    local delay = 15

    local function showNotification()
        local frame = vgui.Create('EditablePanel')
        frame:SetSize(ES.ScreenScale(300) * 0.8, ES.ScreenScale(140) * 0.8)
        frame:SetPos(ES.ScreenScale(25) * 0.8, ES.ScreenScale(25) * 0.8 + panelNum)
        frame:SetAlpha(0)
        frame:AlphaTo(255, 0.2)
        frame.rounded = 0
        frame.clr = ColorAlpha(ES.Colors['bg'], 250)
        
        function frame:Paint(w, h)
            drawRoundedBox(16, 0, 0, w, h, self.clr)
        end
        
        function frame:OnRemove()
            panelNum = panelNum - self:GetTall() + panelSpacing

            for i, id in ipairs(creationOrder) do
                if id == quesid then
                    table.remove(creationOrder, i)
                    break
                end
            end

            updatePanelPositions()

            processNextInQueue()
        end
        
        function frame:Think()
            if delay - (CurTime() - oldTime) <= 0 then
                self:Remove()
            end

            if not keyProcessed and input.IsKeyDown(KEY_F1) then
                keyProcessed = true
                net.Start(isFake and "AcceptFakePassport" or "AcceptPassport")
                net.WriteEntity(fromPlayer)
                net.WriteString(quesid) 
                net.SendToServer()
                self:Remove()
            elseif not keyProcessed and input.IsKeyDown(KEY_F2) then
                keyProcessed = true
                self:Remove()
            end

            if not input.IsKeyDown(KEY_F1) and not input.IsKeyDown(KEY_F2) then
                keyProcessed = false
            end
        end

        frame.bar = vgui.Create('GBar', frame) 
        frame.bar:SetSize(frame:GetWide(), ES.ScreenScale(40) * 0.8)
        local endTime = CurTime() + delay
        local lerp = 0
        
        function frame.bar.avatar:Paint(w, h)
            local progress = endTime - CurTime()
            lerp = Lerp(FrameTime() * 8, lerp, progress)
            local newW = w * math.Clamp(lerp / delay, 0, 1)

            drawRoundedBox(0, 0, ES.ScreenScale(28), w, h , ES.Colors['bar'])
            drawRoundedBox(0, 0, ES.ScreenScale(28), newW, h , ES.Colors['main'])
        end

        frame.panel = vgui.Create('Panel', frame)
        frame.panel:Dock(FILL)
        frame.panel:DockMargin(ES.ScreenScale(15) * 0.8, ES.ScreenScale(45) * 0.8, ES.ScreenScale(15) * 0.8, 0)
        local label

        local extraPadding = ES.ScreenScale(5) * 0.8

        frame.panel.SetText = function() 
            if IsValid(label) then return end

            local question = fromPlayerName .. " хочет показать паспорт"
            question = question:gsub("\n", " ")
            question = question:gsub("[%s.,:]", " ")

            local segments = {}
            for s in string.gmatch(question, '[^ ]+') do
                segments[#segments + 1] = s
            end
            
            local wrapped = textWrap(segments, frame.panel:GetWide(), 'MM_14', fromPlayerName, LocalPlayer():Nick(), extraPadding)

            local y = ES.ScreenScale(15) * 0.8
            for _, line in ipairs(wrapped) do
                local currentX = ES.ScreenScale(15) * 0.8
                for _, segment in ipairs(line) do
                    label = vgui.Create("DLabel", frame)
                    label:SetFont('MB_16')
                    label:SetText(segment.text)
                    label:SetTextColor(segment.color)
                    label:SizeToContents()

                    if segment.text == fromPlayerName or segment.text == LocalPlayer():Nick() then
                        label:SetPos(currentX + extraPadding - 4, y)
                        currentX = currentX + label:GetWide() + getTextWidth(" ", 'MM_14') + extraPadding
                    else
                        label:SetPos(currentX, y)
                        currentX = currentX + label:GetWide() + getTextWidth(" ", 'MM_14')
                    end
                end
                y = y + ES.ScreenScale(20) * 0.8
            end

            frame:SetTall(y + ES.ScreenScale(52))

            frame.panel:Dock(FILL)
            frame.panel:DockMargin(ES.ScreenScale(15) * 0.8, ES.ScreenScale(15) * 0.8, ES.ScreenScale(15) * 0.8, 0)

            frame.bar:SetPos(0, frame:GetTall() - ES.ScreenScale(32))
        end
        
        function frame.panel:PerformLayout()
            self:SetText()
        end

        frame.buttons = vgui.Create('Panel', frame)
        frame.buttons:Dock(BOTTOM)
        frame.buttons:DockMargin(ES.ScreenScale(15) * 0.8, 0, ES.ScreenScale(15) * 0.8, ES.ScreenScale(15) * 0.8)
        frame.buttons:SetTall(ES.ScreenScale(31) * 0.8)

        local buttons = {
            {
                name = 'Да',
                color = ES.Colors['green'],
                dock = LEFT,
                info = 'F1',
                func = function()
                    net.Start(isFake and "AcceptFakePassport" or "AcceptPassport")
                    net.WriteEntity(fromPlayer)
                    net.WriteString(quesid) 
                    net.SendToServer()
                    frame:Remove()
                end
            },
            {
                name = 'Нет',
                color = ES.Colors['red'],
                dock = RIGHT,
                info = 'F2',
                func = function()
                    frame:Remove()
                end
            }, 
        }

        for k, v in ipairs(buttons) do
            local but = vgui.Create('GButton', frame.buttons)
            but:Dock(v.dock)
            but:SetWide(ES.ScreenScale(132) * 0.8)
            but.frame = frame
            function but:Paint(w, h)
                drawRoundedBox(8, 0, 0, w, h, v.color)
                drawSimpleText(v.name, 'MSB_12', ES.ScreenScale(8) * 0.8, h / 2, ES.Colors['white'], 0, 1)
        
                drawRoundedBox(8, w - ES.ScreenScale(28) * 0.8, ES.ScreenScale(6) * 0.8, ES.ScreenScale(23) * 0.8, ES.ScreenScale(21) * 0.8, ES.Colors['bg'])
                drawSimpleText(v.info, 'MSB_10', (w - ES.ScreenScale(28) * 0.8) + ES.ScreenScale(11) * 0.8, h / 2, ES.Colors['white'], 1, 1)
            end
            
            function but:DoClick()
                v.func()
            end
        end

        panelNum = panelNum + frame:GetTall() + panelSpacing

        voteVgui[quesid] = frame
        table.insert(creationOrder, quesid)

        updatePanelPositions()
    end

    table.insert(notificationQueue, showNotification)
    if #notificationQueue == 1 then
        processNextInQueue()
    end
end

net.Receive('DoVote', createVoteVgui)
net.Receive('ES:Question', createVoteVgui)
net.Receive('ShowPassportRequest', function() createNotification(false) end)
net.Receive('ShowFakePassportRequest', function() createNotification(true) end)

--PATH addons/enc_scripts/lua/es/voting/cl_init.lua:
local roles = {
    [TEAM_MAYOR] = 'мэра',
    [TEAM_CHIEF] = 'начальника полиции',
    [TEAM_ROMON] = 'командира спецназа',
}

local VOTE_UI = VOTE_UI or {}
local colorList = {
    Color(252, 91, 91),
    Color(91, 134, 252),
    Color(147, 255, 128),
    Color(196, 91, 252),
    Color(252, 241, 91),
}

local ScrH = ScrH
local ScrW = ScrW
local Lerp = Lerp
local FrameTime = FrameTime
local math_Clamp = math.Clamp
local math_Round = math.Round
local math_max = math.max
local draw_RoundedBox = draw.RoundedBox
local draw_RoundedBoxEx = draw.RoundedBoxEx
local draw_SimpleText = draw.SimpleText
local ColorAlpha = ColorAlpha
local table_insert = table.insert

local function updateVoteUI(role)
    local frame = VOTE_UI[role]
    if not IsValid(frame) then return end

    local validPlayers = {}
    for i, button in ipairs(frame.buttons) do
        if IsValid(button) and IsValid(button.player) then
            table_insert(validPlayers, button.player)
        else
            if IsValid(button) then
                button:Remove()
            end
            frame.buttons[i] = nil
        end
    end

    local newButtons = {}
    local buttonHeight = ScrH() * 0.03
    local buttonSpacing = ScrH() * 0.0066
    local buttonStartPos = ScrH() * 0.009

    for i, button in ipairs(frame.buttons) do
        if IsValid(button) then
            table_insert(newButtons, button)
            local yPos = (buttonHeight + buttonSpacing) * (#newButtons - 1) + buttonStartPos
            button:SetPos(0, yPos)
            button.candidateIndex = #newButtons
        end
    end
    frame.buttons = newButtons

    if #validPlayers == 0 then
        frame:Remove()
        VOTE_UI[role] = nil
    end
end

local function createVoteUI(players, role)
    local validPlayers = {}
    for _, ply in ipairs(players) do
        if IsValid(ply) then
            table_insert(validPlayers, ply)
        end
    end

    if #validPlayers == 0 then return end

    local padding = ScrH() * 0.009
    local elementPadding = ScrH() * 0.0066
    local panelHeight = ScrH() * 0.026
    local space = ScrH() * 0.0066
    local avatarSize = panelHeight - 2 * elementPadding
    
    local mainFrame = vgui.Create('Panel')
    local mainFrameWidth = ScrW() * 0.15
    local mainFrameHeight = ScrH() * 0.03 + (panelHeight + space) * #validPlayers + padding * 2
    mainFrame:SetSize(mainFrameWidth, mainFrameHeight)
    mainFrame:AlignRight(ScrW() * 0.14)
    mainFrame:AlignBottom(ScrH() * 0.01)
    mainFrame:DockPadding(padding, padding, padding, padding)
    mainFrame.Paint = function(_, w, h)
        draw_RoundedBoxEx(16, 0, 0, w, h, Color(38, 38, 38), true, true, true, true)
    end    

    local header = mainFrame:Add('Panel')
    header:SetTall(ScrH() * 0.03)
    header:Dock(TOP)
    header.Paint = function(_, w, h)
        local iconSize = h * 0.6
        local iconPos = h * 0.2
        ES.DrawMaterial(Material('hud/election1.png'), iconPos, iconPos, iconSize, iconSize)
        draw_SimpleText('Выборы ' .. (roles[role] or "роли"), 'MB_16', h, h * 0.5, color_white, 0, 1)
    end

    local container = mainFrame:Add('Panel')
    container:Dock(FILL)
    container.Paint = function(_, w, h)
        draw_RoundedBoxEx(16, 0, 0, w, h, Color(38, 38, 38), false, false, true, true)
    end

    local buttons = {}

    local function updateVotes()
        local totalVotes, votes = 0, {}

        for _, ply in player.Iterator() do
            if IsValid(ply) then
                local index = ply:GetNW2Int('ES:MayorVoteIndex', 0)
                if index > 0 then
                    votes[index] = (votes[index] or 0) + 1
                    totalVotes = totalVotes + 1
                end
            end
        end

        for _, button in ipairs(buttons) do
            if IsValid(button) then
                local playerVotes = votes[button.player:EntIndex()] or 0
                button.fraction = math_Clamp(playerVotes / math_max(1, totalVotes), 0, 1)
                button:InvalidateLayout(true)
            end
        end
    end

    updateVotes()

    timer.Create('UpdateVotes_' .. role, 1, 0, updateVotes)

    for index, player in ipairs(validPlayers) do
        if not IsValid(player) then continue end

        local playerColor = colorList[index % #colorList + 1]
        local playerName = player:Name()
        local colorBackground = Color(31, 52, 77)
        local colorOverlay = ColorAlpha(playerColor, 20)
        local colorProgress = ColorAlpha(playerColor, 60)

        local button = vgui.Create('DButton', container)
        button:SetText('')
        button:SetTall(panelHeight)
        button:Dock(TOP)
        button:SetTextColor(color_white)
        local marginBottom = index == #validPlayers and padding * 0.5 or space
        button:DockMargin(0, 0, 0, marginBottom)
        button.candidateIndex = index
        button.player = player
        button.fraction = 0
        button.Paint = function(_, w, h)
            if not IsValid(button) then return end
            local lerpSpeed = 8
            button.smoothfraction = Lerp(FrameTime() * lerpSpeed, button.smoothfraction or 0, button.fraction)

            draw_RoundedBox(8, 0, 0, w, h, colorBackground)
            draw_RoundedBox(8, 0, 0, w, h, colorOverlay)
            draw_RoundedBox(8, 0, 0, w * button.smoothfraction, h, colorProgress)

            local textPosX = elementPadding + avatarSize + 3
            local textPosY = h * 0.5
            draw_SimpleText(playerName, 'MSB_16', textPosX, textPosY, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            local percentageText = math_Round(button.smoothfraction * 100) .. '%'
            draw_SimpleText(percentageText, 'MSB_16', w - elementPadding, textPosY, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        end

        button.DoClick = function()
            RunConsoleCommand('mayor_vote', player:EntIndex(), role)
        end

        table_insert(buttons, button)

        local avatar = vgui.Create('AvatarImage', button)
        avatar:SetSize(avatarSize, avatarSize)
        local avatarPos = (panelHeight - avatarSize) * 0.5
        avatar:SetPos(elementPadding, avatarPos)
        avatar:SetPlayer(player, 64)
    end

    mainFrame.buttons = buttons
    VOTE_UI[role] = mainFrame
    return mainFrame
end

net.Receive('ES:CreateMayorVote', function()
    local role = net.ReadUInt(7)
    local candidates = {}
    local amount = net.ReadUInt(5)
    for i = 1, amount do
        local candidate = net.ReadEntity()
        if IsValid(candidate) then
            table_insert(candidates, candidate)
        end
    end

    if IsValid(VOTE_UI[role]) then
        VOTE_UI[role]:Remove()
    end

    VOTE_UI[role] = createVoteUI(candidates, role)
end)

net.Receive('ES:DeleteCandidateFromVote', function()
    local role = net.ReadUInt(7)
    updateVoteUI(role)
end)

net.Receive('ES:ShowWinner', function()
    local role = net.ReadUInt(7)
    if IsValid(VOTE_UI[role]) then
        local fadeTime = 0.33
        VOTE_UI[role]:AlphaTo(0, fadeTime, 0, function(_, panel)
            if IsValid(panel) then
                panel:Remove()
            end
        end)
    end

    local winner = net.ReadEntity()
    if IsValid(winner) then
        ES.AddNotification('Победитель избран', 'hud/check1.png', 6, {
            {Color(200, 200, 200), 'Имя: ', color_white, winner:Name()}
        })
    end
    timer.Remove('UpdateVotes_' .. role)
end)

net.Receive('ES:CloseVotingMenu', function()
    local role = net.ReadUInt(7)
    if IsValid(VOTE_UI[role]) then
        VOTE_UI[role]:Remove()
        timer.Remove('UpdateVotes_' .. role)
        VOTE_UI[role] = nil
    end
end)

net.Receive('ES:ShowVotePrepare', function()
    local role = net.ReadUInt(7)
    
    if LocalPlayer():isArrested() then
        return
    end

    ES.AddNotification('Скоро выборы', 'hud/election1.png', ES.Voting['prepareTime'], {
        {Color(200, 200, 200), 'Баллотируйтесь на ' .. (roles[role] or "роли") .. '!'}
    })
end)

--PATH addons/itemstore_new/lua/itemstore/languages/ru.lua:
﻿LANGUAGE.ok = "OK"
LANGUAGE.cancel = "Отмена"
LANGUAGE.not_permitted = "Вам не разрешено выполнять это действие"
LANGUAGE.file_not_found = "Файл не найден"
LANGUAGE.player_not_found = "Игрок не найден"
LANGUAGE.invalid_data = "Неверные данные"
LANGUAGE.invalid_args = "Неверные аргументы"
LANGUAGE.cant_fit = "Вы не можете поместить это в свой инвентарь!"
LANGUAGE.page = "Страница %d"
LANGUAGE.inventory = "Инвентарь"
LANGUAGE.bank = "Банк"
LANGUAGE.players_inventory = "Инвентарь %s"
LANGUAGE.players_bank = "Банк %s"
LANGUAGE.admin_title = "Администратор магазина предметов"
LANGUAGE.move = "Перемещение"
LANGUAGE.use = "Использовать"
LANGUAGE.usewith = "Использовать с..."
LANGUAGE.drop = "Бросить"
LANGUAGE.destroy = "Уничтожить"
LANGUAGE.destroy_title = "Уничтожить предмет"
LANGUAGE.destroy_confirmation = "Вы уверены, что хотите удалить этот предмет? Вы не сможете его вернуть!"
LANGUAGE.merge = "Объединить"
LANGUAGE.split = "Разделить"
LANGUAGE.split_half = "Половина (%d)"
LANGUAGE.picked_up = "Вы подобрали %s"
LANGUAGE.dragtomove = "Нажмите и перетащите для перемещения"
LANGUAGE.mclicktodrop = "Нажмите среднюю кнопку мыши, чтобы бросить"
LANGUAGE.rclickforoptions = "Щелкните правой кнопкой мыши для выбора опций"
LANGUAGE.dclicktouse = "Двойной щелчок для использования"
LANGUAGE.ready = "Готов"
LANGUAGE.not_ready = "Не готов"
LANGUAGE.accept = "Принять"
LANGUAGE.deny = "Отказать"
LANGUAGE.trading_with = "Обмен с %s"
LANGUAGE.trade_request = "Запрос на обмен"
LANGUAGE.wants_to_trade = "%s хочет обменяться"
LANGUAGE.too_far_away = "Вы находитесь слишком далеко, чтобы начать обмен"
LANGUAGE.trading_cooldown = "Вы должны немного подождать, прежде чем снова сможете обмениваться"
LANGUAGE.trade_failed = "Обмен не удался. Либо вы, либо ваш партнер пытались предложить больше денег, чем у вас есть!"
LANGUAGE.cant_access_inventory = "Вы не можете обмениваться, если у вас нет доступа к инвентарю"
LANGUAGE.partner_cant_access_inventory = "Вы не можете обмениваться с партнером, у которого нет доступа к инвентарю"
LANGUAGE.partner_is_in_trade = "Вы не можете обмениваться с партнером, который уже участвует в обмене"
LANGUAGE.already_in_trade = "Вы уже обмениваетесь с кем-то другим"
LANGUAGE.drug_name = "Наркотики"
LANGUAGE.drug_desc = "Дууууууууууууд"
LANGUAGE.druglab_name = "Нарколаборатория"
LANGUAGE.druglab_desc = "Не позволяйте, чтобы это увидели КП!"
LANGUAGE.food_name = "Еда"
LANGUAGE.food_desc = "Ням.\n\nПитательная ценность: %%d"
LANGUAGE.microwavefood_desc = "Ням"
LANGUAGE.food_melon = "Дыня"
LANGUAGE.food_orange = "Апельсин"
LANGUAGE.food_bananas = "Гроздь бананов"
LANGUAGE.food_banana = "Банан"
LANGUAGE.food_glassbottle = "Стеклянная бутылка"
LANGUAGE.food_soda = "Банка газировки"
LANGUAGE.food_milk = "Молоко"
LANGUAGE.food_beer = "Пиво"
LANGUAGE.food_twolitresoda = "2 литра газировки"
LANGUAGE.food_onelitresoda = "Газировка объемом 1 литр"
LANGUAGE.gunlab_name = "Оружейная лаборатория"
LANGUAGE.gunlab_desc = "Лаборатория, в которой делают оружие. ДУХ"
LANGUAGE.microwave_name = "Микроволновая печь"
LANGUAGE.microwave_desc = "Почему она всегда горячая снаружи, но холодная в середине?"
LANGUAGE.moneyprinter_name = "Денежный принтер"
LANGUAGE.moneyprinter_desc = "Выдавать наличные деньги"
LANGUAGE.ammo_name = "Патроны"
LANGUAGE.ammo_desc = "То, чем вы стреляете из пистолета"
LANGUAGE.money_name = "Деньги"
LANGUAGE.money_desc = "Много денег!"
LANGUAGE.prop_name = "Проп"
LANGUAGE.prop_desc = "Бейте людей этим, чтобы вас забанили"
LANGUAGE.shipment_name = "Коробка"
LANGUAGE.shipment_desc = "Коробка с оружием.\n\nСодержание: %%s"
LANGUAGE.shipment_invalid = "Неизвестно"
LANGUAGE.weapon_name = "Оружие"
LANGUAGE.weapon_desc = "Экипируемое оружие.\nПатроны в магазине: %%d\nПатроны в резерве: %%d"
LANGUAGE.weapon_physgun = "Физическая пушка"
LANGUAGE.weapon_physcannon = "Гравити пушка"
LANGUAGE.weapon_crowbar = "Монтировка"
LANGUAGE.weapon_stunstick = "Электропалка"
LANGUAGE.weapon_pistol = "Пистолет"
LANGUAGE.weapon_357 = "357"
LANGUAGE.weapon_smg1 = "SMG1"
LANGUAGE.weapon_ar2 = "AR2"
LANGUAGE.weapon_annabelle = "Аннабель"
LANGUAGE.weapon_shotgun = "Дробовик"
LANGUAGE.weapon_crossbow = "Арбалет"
LANGUAGE.weapon_frag = "Осколочная граната"
LANGUAGE.weapon_rpg = "RPG"
LANGUAGE.weapon_slam = "S.L.A.M."
LANGUAGE.weapon_bugbait = "Приманка для жуков"
--PATH addons/truefishing/lua/itemstore/items/fish_bait.lua:
ITEM.Name = itemstore.Translate( "fish_bait" )
ITEM.Description = itemstore.Translate( "fish_bait_desc" )
ITEM.Model = "models/props_junk/garbage_bag001a.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Ammo
ITEM.Base = "base_darkrp"
ITEM.Stackable = true

function ITEM:GetName()
	return TrueFishGetGearName( FISH_GEAR_BAIT )
end

function ITEM:Use( pl )
	if !pl.FishBait or pl.FishBait < TrueFish.ROD_FISH_BAIT_AMOUNT then
		pl.FishBait = TrueFish.ROD_FISH_BAIT_AMOUNT
		TrueFishNotify(pl, TrueFishLocal("picked_up_fish_bait", TrueFish.ROD_FISH_BAIT_AMOUNT))
		return true
	end

	return false
end

--PATH addons/itemstore_new/lua/itemstore/items/spawned_shipment.lua:
﻿ITEM.Name = itemstore.Translate("shipment_name")
ITEM.Description = itemstore.Translate("shipment_desc")
ITEM.Model = "models/Items/item_item_crate.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Shipments
ITEM.Stackable = true
ITEM.DropStack = true
ITEM.Base = "base_darkrp"

-- Because all of you feel the need to fuck with your shipments on a daily basis.
function ITEM:Initialize()
    if not SERVER then return end
    if not self:GetData("Class") then return end
    local shipment = CustomShipments[self:GetData("Contents")]
    if shipment and shipment.entity == self:GetData("class") then return end

    for k, v in ipairs(CustomShipments) do
        if v.entity == self:GetData("Class") then
            self:SetData("Contents", k)

            return
        end
    end
end

function ITEM:GetShipmentName()
    local shipment = CustomShipments[self:GetData("Contents")]

    if shipment then
        return shipment.name
    else
        return itemstore.Translate("shipment_invalid")
    end
end

function ITEM:GetName()
    return self:GetData("Name", self:GetShipmentName() .. " " .. self.Name)
end

function ITEM:GetDescription()
    return self:GetData("Description", string.format(self.Description, self:GetShipmentName()))
end

function ITEM:CanMerge(item)
    return self.Stackable and self:GetClass() == item:GetClass() and self:GetData("Contents") == item:GetData("Contents") and self:GetMaxStack() >= (item:GetAmount() + self:GetAmount())
end

function ITEM:SaveData(ent)
    --self:SetData("Owner", ent:Getowning_ent())
    self:SetData("Contents", ent:Getcontents())
    self:SetData("Amount", ent:Getcount())
    self:SetData("Class", CustomShipments[ent:Getcontents()].entity)
    self:SetData("Ammo", ent.ammoadd)
    self:SetData("Clip1", ent.clip1)
    self:SetData("Clip2", ent.clip2)
end

function ITEM:CanPickup(pl, ent)
    return self:GetMaxStack() >= ent:Getcount() and not ent.locked
end

function ITEM:Pickup(pl, con, slot, ent)
    timer.Destroy(ent:EntIndex() .. "crate")
    --ent.locked = false
    ent.sparking = false
end

-- 76561198255721288
function ITEM:LoadData(ent)
    ent:Setcontents(self:GetData("Contents"))
    ent:Setcount(self:GetData("Amount"))
    --ent:Setowning_ent(self:GetData("Owner"))
    ent.ammoadd = self:GetData("Ammo")
    ent.clip1 = self:GetData("Clip1")
    ent.clip2 = self:GetData("Clip2")
end

function ITEM:Use(pl)
    if not CustomShipments[self:GetData("Contents")] then return end
    if pl:isArrested() then return end
    local class = CustomShipments[self:GetData("Contents")].entity
    local wep_table = weapons.Get(class)
    local ammo, ammo_type

    if wep_table then
        ammo_type = wep_table.Primary.Ammo

        if ammo_type then
            ammo = pl:GetAmmoCount(ammo_type)
        end
    end

    local wep = pl:Give(class)

    if ammo and ammo_type then
        pl:SetAmmo(ammo, ammo_type)
    end

    local weapon_exists = false

    if not IsValid(wep) then
        wep = pl:GetWeapon(class)
        weapon_exists = IsValid(wep)
    end

    if IsValid(wep) and wep:IsWeapon() then
        if self:GetData("Clip1") then
            if weapon_exists then
                pl:GiveAmmo(self:GetData("Clip1"), wep:GetPrimaryAmmoType())
            else
                wep:SetClip1(self:GetData("Clip1"))
            end
        end

        if self:GetData("Clip2") then
            if weapon_exists then
                pl:GiveAmmo(self:GetData("Clip2"), wep:GetSecondaryAmmoType())
            else
                wep:SetClip2(self:GetData("Clip2"))
            end
        end

        if self:GetData("Ammo") then
            pl:GiveAmmo(self:GetData("Ammo"), wep:GetPrimaryAmmoType())
        elseif wep.Primary and wep.Primary.DefaultClip then
            pl:GiveAmmo(wep.Primary.DefaultClip, wep:GetPrimaryAmmoType())
        end
    end

    return self:TakeOne()
end
--PATH addons/zeros_weedfarm/lua/itemstore/items/zwf_jar.lua:
ITEM.Name = "Weed Jar"
ITEM.Description = "A Jar of weed"
ITEM.Model = "models/zerochain/props_weedfarm/zwf_jar.mdl"
ITEM.Base = "base_darkrp"
ITEM.Stackable = false
ITEM.DropStack = false

function ITEM:GetName()
	local name = self:GetData("WeedName") .. " " .. self:GetData("WeedAmount") .. zwf.config.UoW .. "\n[" .. zwf.config.Plants[self:GetData("PlantID")].name .. "]"

	return self:GetData("Name", name)
end

function ITEM:SaveData(ent)
	self:SetData("PlantID", ent:GetPlantID())
	self:SetData("WeedName", ent:GetWeedName())
	self:SetData("WeedAmount", ent:GetWeedAmount())
	self:SetData("THC", ent:GetTHC())

	self:SetData("Perf_Time", ent:GetPerf_Time())
	self:SetData("Perf_Amount", ent:GetPerf_Amount())
	self:SetData("Perf_THC", ent:GetPerf_THC())

	self:SetData("ZWFOwner", zwf.f.GetOwnerID(ent))
end

function ITEM:LoadData(ent)
	ent:SetPlantID(self:GetData("PlantID"))
	ent:SetWeedName(self:GetData("WeedName"))
	ent:SetWeedAmount(self:GetData("WeedAmount"))
	ent:SetTHC(self:GetData("THC"))

	ent:SetPerf_Time(self:GetData("Perf_Time"))
	ent:SetPerf_Amount(self:GetData("Perf_Amount"))
	ent:SetPerf_THC(self:GetData("Perf_THC"))

	zwf.f.SetOwnerByID(ent, self:GetData("ZWFOwner"))

	timer.Simple(0.25,function()
		if IsValid(ent) then
			zwf.f.Jar_ItemStore(ent)
		end
	end)
end

--PATH addons/itemstore_new/lua/itemstore/containers.lua:
﻿itemstore.containers = {}
itemstore.containers.Active = {}
local Container = {}
AccessorFunc(Container, "Owner", "Owner")
AccessorFunc(Container, "Suppressed", "Suppressed", FORCE_BOOL)
AccessorFunc(Container, "Width", "Width", FORCE_NUMBER)
AccessorFunc(Container, "Height", "Height", FORCE_NUMBER)
AccessorFunc(Container, "Pages", "Pages", FORCE_NUMBER)

function Container:GetID()
    return self.ID
end

function Container:IsValid()
    return self:GetID() and itemstore.containers.Active[self:GetID()] == self
end

function Container:Remove()
    itemstore.containers.Remove(self:GetID())
end

function Container:GetPageSize()
    return self:GetWidth() * self:GetHeight()
end

function Container:GetPageFromSlot(slot)
    return math.ceil(slot / self:GetPageSize())
end

function Container:SetSize(w, h, pages)
    self:SetWidth(w)
    self:SetHeight(h)
    self:SetPages(pages)
    self:QueueSync()
end

function Container:GetSize()
    return self:GetPageSize() * self:GetPages()
end

function Container:CoordsToSlot(x, y, p)
    return ((p - 1) * self:GetPageSize()) + ((y - 1) * self:GetWidth() + x)
end

function Container:GetItems()
    return self.Items
end

function Container:GetItem(slot)
    return self.Items[slot]
end

function Container:SetItem(slot, item)
    if item and not item:IsValid() then return end
    slot = math.floor(slot)

    if slot >= 1 and slot <= self:GetSize() then
        if self:RunCallbacks("set", slot, item) == false then return end
        self.Items[slot] = item

        if item then
            item.Container = self
            item.Slot = slot
        end

        if SERVER then
            self:QueueSync()
        end
    end
end

function Container:FirstEmptySlot()
    for i = 1, self:GetSize() do
        if not self:GetItem(i) then return i end
    end

    return false
end

function Container:CanFit(item)
    for i = 1, self:GetSize() do
        local merge_item = self:GetItem(i)
        if merge_item and merge_item:CanMerge(item) then return true end
    end

    return self:FirstEmptySlot() ~= false
end

function Container:AddItem(item, dontmerge)
    if not dontmerge then
        for i = 1, self:GetSize() do
            local merge_item = self:GetItem(i)

            if merge_item and merge_item:CanMerge(item) then
                merge_item:Merge(item)
                self:QueueSync()

                return i, merge_item
            end
        end
    end

    local slot = self:FirstEmptySlot()

    if slot then
        self:SetItem(slot, item)

        return slot
    end

    return false
end

function Container:HasItem(item_class)
    for k, v in pairs(self:GetItems()) do
        if v:GetClass() == item_class then return k end
    end

    return false
end

function Container:CountItems(item_class)
    local amount = 0

    for _, item in pairs(self:GetItems()) do
        if item:GetClass() == item_class then
            amount = amount + item:GetAmount()
        end
    end

    return amount
end

-- 76561198255721288
function Container:TakeItems(item_class, amount)
    local amount_taken = 0

    self:Suppress(function()
        for k, v in pairs(self:GetItems()) do
            if v:GetClass() == item_class then
                local amount_to_take = v:GetAmount()
                amount_to_take = math.Clamp(amount_to_take, 0, amount)
                v:SetAmount(v:GetAmount() - amount_to_take)

                if v:GetAmount() <= 0 then
                    self:SetItem(k, nil)
                end

                amount_taken = amount_taken + amount_to_take
                amount = amount - amount_to_take
            end
        end

        return true
    end)

    return amount_taken
end

function Container:GetDefaultPermissions()
    return self.DefaultPermissions
end

function Container:GetPermissions(pl)
    return self.Permissions[pl] or self:GetDefaultPermissions()
end

function Container:SetDefaultPermissions(read, write)
    self.DefaultPermissions = {
        Read = read,
        Write = write
    }
end

function Container:SetPermissions(pl, read, write)
    self.Permissions[pl] = {
        Read = read,
        Write = write
    }
end

function Container:CanRead(pl, ...)
    local res = hook.Call("ItemStoreCanRead", nil, self, pl, ...)
    if res ~= nil then return res end
    if self.Permissions[pl] then return self.Permissions[pl].Read end
    local res = self:RunCallbacks("read", pl, ...)
    if res ~= nil then return res end

    return self.DefaultPermissions.Read
end

function Container:CanWrite(pl, action, ...)
    local res = hook.Call("ItemStoreCanWrite", nil, self, pl, action, ...)
    if res ~= nil then return res end
    if self.Permissions[pl] then return self.Permissions[pl].Write end
    local res = self:RunCallbacks("write", pl, action, ...)
    if res ~= nil then return res end

    return self.DefaultPermissions.Write
end

function Container:AddCallback(name, func)
    if not self.Callbacks[name] then
        self.Callbacks[name] = {}
    end

    return table.insert(self.Callbacks[name], func)
end

function Container:RemoveCallback(name, id)
    if self.Callbacks[name] then
        self.Callbacks[name][id] = nil
    end
end

function Container:RunCallbacks(name, ...)
    if self.Callbacks[name] then
        for _, func in pairs(self.Callbacks[name]) do
            local res = func(self, ...)
            if res ~= nil then return res end
        end
    end
end

function Container:GetSyncTargets()
    players = {}

    for _, pl in ipairs(player.GetAll()) do
        if self:CanRead(pl) then
            table.insert(players, pl)
        end
    end

    return players
end

function Container:Suppress(func)
    self:SetSuppressed(true)
    local sync = func()
    self:SetSuppressed(false)

    if sync then
        self:QueueSync()
    end
end

function Container:QueueSync()
    self.ShouldSync = true
end

function Container:Sync(pl)
    if SERVER then
        itemstore.containers.Sync(self:GetID(), pl)
    end
end

function itemstore.Container(w, h, pages, dontnetwork)
    local con = {
        ShouldSync = false,
        Width = w or 4,
        Height = h or 4,
        Pages = pages or 1,
        Owner = nil,
        Callbacks = {},
        Permissions = {},
        DefaultPermissions = {
            Read = false,
            Write = false
        },
        Items = {}
    }

    setmetatable(con, {
        __index = Container
    })

    if not dontnetwork then
        con.ID = table.insert(itemstore.containers.Active, con)
        con:Sync()
    end

    return con
end

function itemstore.containers.Get(id)
    return itemstore.containers.Active[id]
end

-- function itemstore.containers.Remove(id)
    -- itemstore.containers.Active[id] = nil
-- end

function itemstore.containers.Remove(id)
    itemstore.containers.Active[id] = nil
end


if SERVER then
    AddCSLuaFile()
    util.AddNetworkString("ItemStoreSync")

    function itemstore.containers.Sync(id, pl)
        local con = itemstore.containers.Active[id]
        if not con then return end
        if con:GetSuppressed() then return end
        -- No longer using WriteTable! Net usage has been cut to less than half
        -- This is still pretty damn unoptimized though
        -- Ideally we send only the item that's changing...
        -- But unfortunately it's a bit more complicated than that due to
        -- an item's ability to modify other slots in a container
        net.Start("ItemStoreSync")
        net.WriteUInt(con:GetID(), 32)
        net.WriteUInt(con:GetWidth(), 8)
        net.WriteUInt(con:GetHeight(), 8)
        net.WriteUInt(con:GetPages(), 8)
        net.WriteUInt(table.Count(con.Items), 16)

        for k, v in pairs(con.Items) do
            net.WriteUInt(k, 16)
            local id = util.NetworkStringToID(v.Class)

            if id == 0 then
                if v.Class then
                    error(string.format("[ItemStore] Tried to send data for unnetworked item %s", v.Class))
                else
                    error("[ItemStore] Tried to send data for a classless item")
                end
            end

            net.WriteUInt(id, 16)
            v:WriteNetworkData()
        end

        net.Send(pl or con:GetSyncTargets())
    end

    -- hook.Add("Tick", "ItemStoreSyncContainers", function()
	timer.Create( "ItemStoreSyncContainers", 0.3, 0, function()
        for k, v in pairs(itemstore.containers.Active) do
            if v.ShouldSync then
                v.ShouldSync = false
                v:Sync()
            end
        end
    end)
	
	local function RemovePlayerContainers(ply)
		for id, container in pairs(itemstore.containers.Active) do
			if container:GetOwner() == ply then
				container:Remove()
			end
		end
	end
	
	hook.Add("PlayerDisconnected", "RemovePlayerItemStoreContainers", function(ply)
			RemovePlayerContainers(ply)
	end)

else
    itemstore.containers.Panels = {}

    function itemstore.containers.UpdatePanels(id)
        for k, v in pairs(itemstore.containers.Panels) do
            if IsValid(v) then
                if v:GetContainerID() == id then
                    v:Refresh()
                end
            else
                itemstore.containers.Panels[k] = nil
            end
        end
    end

    net.Receive("ItemStoreSync", function()
        local id = net.ReadUInt(32)
        local w, h = net.ReadUInt(8), net.ReadUInt(8)
        local pages = net.ReadUInt(8)
        local con = itemstore.Container(w, h, pages, true)

        for i = 1, net.ReadUInt(16) do
            local slot = net.ReadUInt(16)
            local class = util.NetworkIDToString(net.ReadUInt(16))
            local item = itemstore.Item(class)
            item:ReadNetworkData()
            con:SetItem(slot, item)
        end

        con.ID = id
        itemstore.containers.Active[id] = con
        itemstore.containers.UpdatePanels(id)
    end)
end
--PATH addons/itemstore_new/lua/itemstore/modules/shops/shared.lua:
itemstore.shops = {}
itemstore.shops.config = {}

include( "config.lua" )

--PATH addons/zeros_methlab2/lua/zmlab2_languages/sh_language_pl.lua:
zmlab2 = zmlab2 or {}
zmlab2.language = zmlab2.language or {}

if (zmlab2.config.SelectedLanguage == "pl") then
    zmlab2.language["YouDontOwnThis"] = "Nie jesteś właścicielem tego!"
    zmlab2.language["Minutes"] = "Minuty"
    zmlab2.language["Seconds"] = "Sekundy"
    zmlab2.language["CratePickupFail"] = "Skrzynia jest pusta!"
    zmlab2.language["CratePickupSuccess"] = "Zebrano $MethAmount $MethName, Jakość: $MethQuality%"
    zmlab2.language["Interaction_Fail_Job"] = "Nie masz odpowiedniej pracy, aby to zrobić!"
    zmlab2.language["Interaction_Fail_Dropoff"] = "Ten punkt odbioru nie jest przypisany do Ciebie!"
    zmlab2.language["Dropoff_assinged"] = "Przypisano punkt odbioru!"
    zmlab2.language["Dropoff_cooldown"] = "Poczekaj chwilę zanim to zrobisz!"
    zmlab2.language["Equipment"] = "Wyposażenie"
    zmlab2.language["Equipment_Build"] = "Buduj"
    zmlab2.language["Equipment_Move"] = "Przenieś"
    zmlab2.language["Equipment_Repair"] = "Napraw"
    zmlab2.language["Equipment_Remove"] = "Usuń"
    zmlab2.language["NotEnoughMoney"] = "Nie masz wystarczająco pieniędzy!"
    zmlab2.language["ExtinguisherFail"] = "Ten obiekt się nie pali!"
    zmlab2.language["Start"] = "Start"
    zmlab2.language["Drop"] = "Wyrzuć"
    zmlab2.language["Move Liquid"] = "Przenieś ciecz"
    zmlab2.language["Frezzer_NeedTray"] = "Nie znaleziono tacy z niezamrożoną metą!"
    zmlab2.language["ERROR"] = "ERROR"
    zmlab2.language["SPACE"] = "Naciśnij SPACE"
    zmlab2.language["NPC_InteractionFail01"] = "Nie robię interesów z nieznajomymi! [Zła Praca]"
    zmlab2.language["NPC_InteractionFail02"] = "Nie masz żadnej mety!"
    zmlab2.language["NPC_InteractionFail03"] = "Nie mam wolnego punktu odbioru, wróć później."
    zmlab2.language["PoliceWanted"] = "Sprzedano Metę"
    zmlab2.language["MissingCrate"] = "Brakuje skrzynki"
    zmlab2.language["Storage"] = "MAGAZYN"
    zmlab2.language["ItemLimit"] = "Osiągnąłeś limit: $ItemName!"
    zmlab2.language["TentFoldInfo01"] = "Jesteś pewnien, że chcesz usunąć ten namiot?"
    zmlab2.language["TentFoldInfo02"] = "Wyposażenie w środku również zostanie usunięte!"
    zmlab2.language["TentFoldAction"] = "ZAGIĘCIE"
    zmlab2.language["TentType_None"] = "NONE"
    zmlab2.language["TentAction_Build"] = "BUDUJ"
    zmlab2.language["TentBuild_Info"] = "Proszę wyczyścić teren!"
    zmlab2.language["TentBuild_Abort"] = "Coś jest na przeszkodzie!"
    zmlab2.language["Enabled"] = "Aktywowane"
    zmlab2.language["Disabled"] = "Dezaktywowane"
    zmlab2.language["MethTypeRestricted"] = "Nie możesz robić tego typu mety!"
    zmlab2.language["SelectMethType"] = "Wybierz Typ Mety"
    zmlab2.language["SelectTentType"] = "Wybierz Rodzaj Namiotu"
    zmlab2.language["LightColor"] = "Kolor Świateł"
    zmlab2.language["Cancel"] = "Anuluj"
    zmlab2.language["Deconstruct"] = "Zburz"
    zmlab2.language["Construct"] = "Buduj"
    zmlab2.language["Choosepostion"] = "Wybierz nową pozycję"
    zmlab2.language["ChooseMachine"] = "Wybierz maszynę"
    zmlab2.language["Extinguish"] = "Ugaś"
    zmlab2.language["PumpTo"] = "Pompuj do"
    zmlab2.language["ConstructionCompleted"] = "Budowa zakończona!"
    zmlab2.language["Duration"] = "Czas trwania"
    zmlab2.language["Amount"] = "Wydajność"
    zmlab2.language["Difficulty"] = "Poziom trudności"
    zmlab2.language["Money"] = "Pieniądze"
    zmlab2.language["Difficulty_Easy"] = "Łatwy"
    zmlab2.language["Difficulty_Medium"] = "Średni"
    zmlab2.language["Difficulty_Hard"] = "Trudny"
    zmlab2.language["Difficulty_Expert"] = "Ekspert"
    zmlab2.language["Connected"] = "Połączono!"
    zmlab2.language["Missed"] = "Nie trafiono!"

    // Tent Config
    // Note: "Vamonos Pest" and "Crystale Castle" are the names of those tents so you dont need to translate them if you dont want
    zmlab2.language["tent01_title"] = "Namiot Vamonos Pest - Mały"
    zmlab2.language["tent01_desc"] = "Ten mały namiot ma miejsce na 6 urządzeń."
    zmlab2.language["tent02_title"] = "Namiot Vamonos Pest - Średni"
    zmlab2.language["tent02_desc"] = "Ten średni namiot ma miejsce na 9 urządzeń."
    zmlab2.language["tent03_title"] = "Namiot Vamonos Pest - Wielki"
    zmlab2.language["tent03_desc"] = "Ten wielki namiot ma miejsce na 16 urządzeń."
    zmlab2.language["tent04_title"] = "Namiot Crystale Castle"
    zmlab2.language["tent04_desc"] = "Ten namiot cyrkowy ma miejsce na 24 urządzenia."

    // Equipment Config
    zmlab2.language["ventilation_title"] = "Wentylacja"
    zmlab2.language["ventilation_desc"] = "Oczyszcza okolicę z zanieczyszczeń."
    zmlab2.language["storage_title"] = "Przechowywanie"
    zmlab2.language["storage_desc"] = "Zapewnia środki chemiczne i sprzęt."
    zmlab2.language["furnace_title"] = "Piec do toru"
    zmlab2.language["furnace_desc"] = "Używany do podgrzania kwasu."
    zmlab2.language["mixer_title"] = "Mikser"
    zmlab2.language["mixer_desc"] = "Używany jako główne naczynie reakcyjne do łączenia związków."
    zmlab2.language["filter_title"] = "Filtr"
    zmlab2.language["filter_desc"] = "Służy do uszlachetniania gotowej mieszanki w celu podniesienia jej jakości."
    zmlab2.language["filler_title"] = "Napełniacz"
    zmlab2.language["filler_desc"] = "Służy do napełniania gotowej mieszanki na tacach zamrażarki."
    zmlab2.language["frezzer_title"] = "Zamrażarka"
    zmlab2.language["frezzer_desc"] = "Służy do powstrzymywania dalszej reakcji końcowego roztworu metamfetaminy."
    zmlab2.language["packingtable_title"] = "Stół do pakowania"
    zmlab2.language["packingtable_desc"] = "Zapewnia szybki sposób na kruszenie / spakowanie mety. Może pomieścić do 12 tac do zamrażarki. Można ulepszyć za pomocą automatycznego łamacza lodu."

    // Storage Config
    zmlab2.language["acid_title"] = "Kwas fluorowodorowy"
    zmlab2.language["acid_desc"] = "Katalizator zwiększający szybkość reakcji."
    zmlab2.language["methylamine_title"] = "Metyloamina"
    zmlab2.language["methylamine_desc"] = "Metyloamina (CH3NH2) jest związkiem organicznym i jednym z głównych składników do produkcji metamfetaminy."
    zmlab2.language["aluminum_title"] = "Aluminum"
    zmlab2.language["aluminum_desc"] = "Amalgamat glinu jest stosowany jako odczynnik chemiczny do redukcji związków minimalnych."
    zmlab2.language["lox_title"] = "Ciekły tlen"
    zmlab2.language["lox_desc"] = "Ciekły tlen jest używany w zamrażarce, aby zatrzymać dalszą reakcję końcowego roztworu metamfetaminy."
    zmlab2.language["crate_title"] = "Skrzynia Transportowa"
    zmlab2.language["crate_desc"] = "Używany do transportu większej ilości mety."
    zmlab2.language["palette_title"] = "Paleta"
    zmlab2.language["palette_desc"] = "Używana do transportu ogromnej ilości mety."
    zmlab2.language["crusher_title"] = "Automatyczny Łamacz Lodu"
    zmlab2.language["crusher_desc"] = "Automatycznie łamie i pakuje metę po położeniu jej na stole do pakowania."

    // Meth Config
    // Note: Hard to say what about the meth should be translated and what not. Decide for yourself whats important here.
    zmlab2.language["meth_title"] = "Meth"
    zmlab2.language["meth_desc"] = "Normalna uliczna meta."
    zmlab2.language["bluemeth_title"] = "Crystal Blue"
    zmlab2.language["bluemeth_desc"] = "Oryginalna formuła Heisenberga."
    zmlab2.language["kalaxi_title"] = "Kalaxian Crystal"
    zmlab2.language["kalaxi_desc"] = "Kryształy Kalaxian są bardzo podobne do wielu narkotyków, ponieważ zapewniają dobre odczucia."
    zmlab2.language["glitter_title"] = "Glitter"
    zmlab2.language["glitter_desc"] = "Glitter to silnie psychodeliczny narkotyk, który pojawił się niedawno na ulicach Night City. To naprawdę mocna rzecz, nawet dla nasyconych dopalaczami mieszkańców Night City."
    zmlab2.language["kronole_title"] = "Kronole"
    zmlab2.language["kronole_desc"] = "Kronole to uliczny narkotyk sprzedawany na czarnym rynku pokładu Snowpiercera. Lek ma zdolność blokowania receptorów bólowych. Kronole jest tak silny, że blokuje wszystkie uczucia, nie tylko ból."
    zmlab2.language["melange_title"] = "Melange"
    zmlab2.language["melange_desc"] = "Melange (przyprawa) to narkotyk, który może przedłużyć życie, zwiększyć witalność i świadomość oraz odblokować przewidywanie u niektórych ludzi."
    zmlab2.language["mdma_title"] = "MDMA"
    zmlab2.language["mdma_desc"] = "MDMA został po raz pierwszy opracowany w 1912 roku przez firmę Merck. Był używany jako środek wspomagający psychoterapię na początku lat 70. XX wieku i stał się popularny jako uliczny narkotyk w latach 80."

    // Update 1.0.5
    zmlab2.language["tent05_title"] = "Namiot okrągły"
    zmlab2.language["tent05_desc"] = "Ten namiot ma miejsce na 8 urządzeń."
end

--PATH addons/zeros_methlab2/lua/zmlab2/util/sh_animation.lua:
zmlab2 = zmlab2 or {}
zmlab2.Animation = zmlab2.Animation or {}

function zmlab2.Animation.Play(ent,anim, speed)
	if not IsValid(ent) then return end
	local sequence = ent:LookupSequence(anim)
	ent:SetCycle(0)
	ent:ResetSequence(sequence)
	ent:SetPlaybackRate(speed)
	ent:SetCycle(0)
end

function zmlab2.Animation.PlayTransition(ent,anim01, speed01,anim02,speed02)

	zmlab2.Animation.Play(ent,anim01, speed01)

	local time = ent:SequenceDuration()
	local timerid =  "zmlab2_anim_transition_" .. ent:EntIndex()
	zmlab2.Timer.Remove(timerid)

	zmlab2.Timer.Create(timerid, time, 1, function()
		zmlab2.Timer.Remove(timerid)
		zmlab2.Animation.Play(ent, anim02, speed02)
	end)
end

--PATH addons/zeros_methlab2/lua/zmlab2/storage/cl_storage.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Storage = zmlab2.Storage or {}

function zmlab2.Storage.DrawUI(Storage)
    if zmlab2.util.InDistance(LocalPlayer():GetPos(),Storage:GetPos(), 400) and zmlab2.Convar.Get("zmlab2_cl_drawui") == 1 then
        cam.Start3D2D(Storage:LocalToWorld(Vector(0, 13.5, 40)), Storage:LocalToWorldAngles(Angle(0, 180, 90)), 0.1)
            local txtSize = zmlab2.util.GetTextSize(zmlab2.language["Storage"], zmlab2.GetFont("zmlab2_font02"))
            local barSize = txtSize * 1.1
            draw.RoundedBox(0, -barSize / 2, -48, barSize, 48, zmlab2.colors["black03"])
            local nextTime = math.Clamp(Storage:GetNextPurchase() - CurTime(), 0, zmlab2.config.Storage.BuyInterval)

            if nextTime > 0 then
                draw.RoundedBox(0, -barSize / 2, -48, (barSize / zmlab2.config.Storage.BuyInterval) * nextTime, 48, zmlab2.colors["orange01"])
            end

            zmlab2.util.DrawOutlinedBox(-barSize / 2, -48, barSize, 48, 2, color_white)
            draw.SimpleText(zmlab2.language["Storage"], zmlab2.GetFont("zmlab2_font02"), 0, -23, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        cam.End3D2D()
    end
end

function zmlab2.Storage.Initialize(Storage) end
function zmlab2.Storage.OnRemove(Storage) end

--PATH addons/zeros_weedfarm/lua/zwf_languages/sh_zwf_language_pt.lua:
zwf = zwf or {}
zwf.language = zwf.language or {}

zwf.language.General = zwf.language.General or {}
zwf.language.Shop = zwf.language.Shop or {}
zwf.language.NPC = zwf.language.NPC or {}
zwf.language.VGUI = zwf.language.VGUI or {}
zwf.language.Settings = zwf.language.Settings or {}


if (zwf.config.SelectedLanguage == "pt") then

    zwf.language.General["Fuel"] = "CombustÃ­vel"

    zwf.language.General["THC"] = "THC"
    zwf.language.General["Remove"] = "Remover"
    zwf.language.General["Splice"] = "Separar" // The splice button on the seed lab for creating new seeds

    zwf.language.General["Bad"] = "Ruim"
    zwf.language.General["Good"] = "Bom"

    zwf.language.General["Collect"] = "Coletar"

    zwf.language.General["Speed"] = "Velocidade"
    zwf.language.General["Productivity"] = "Produtividade"
    zwf.language.General["AntiPlague"] = "Anti praga"

    zwf.language.General["Water"] = "Ãgua"

    zwf.language.General["invalid_character"] = "Nome contÃ©m carÃ¡cteres invÃ¡lidos!"
    zwf.language.General["name_too_short"] = "Nome muito curto!"
    zwf.language.General["name_too_long"] = "Nome muito longo!"

    zwf.language.General["Cancel"] = "Cancelar"
    zwf.language.General["Enter"] = "Enter"

    zwf.language.General["ItemBought"] = "VocÃª comprou $itemname por $currency$price!"


    zwf.language.General["seedlab_titlescreen"] = "LaboratÃ³rio  de sementes"
    zwf.language.General["seedlab_help"] = "Escreva o nome da planta"

    zwf.language.General["watertank_refill"] = "Refill"
    zwf.language.General["watertank_title"] = "Tanque de Ã¡gua"

    zwf.language.General["bong_pickup_fail"] = "VocÃª jÃ¡ tem esse bong!"
    zwf.language.General["bong_no_weed"] = "Sem erva!"


    zwf.language.General["generator_repair"] = "Reparar!"
    zwf.language.General["generator_start"] = "ComeÃ§ar"
    zwf.language.General["generator_stop"] = "Parar"
    zwf.language.General["generator_nofuel"] = "Sem combustÃ­vel!"

    zwf.language.General["packingstation_info"] = "Adicione jarras de erva."
    zwf.language.General["packingstation_weedmix"] = "Mistura de ervas" // If the player mixes diffrent sorts of weed together then we change the name of the weed to this

    zwf.language.General["seedbank_full"] = "Banco de sementes estÃ¡ cheio!"

    zwf.language.General["plant_heal"] = "Curar" // The heal button
    zwf.language.General["plant_harvest"] = "Colher" // The harvest button
    zwf.language.General["plant_infected"] = "Infectada" // Tells us that the plant is infected
    zwf.language.General["plant_postgrow"] = "PÃ³s crescmiento" // Tells us that the plant is in the post grow phase where it keeps growing till it reaches its max weedamount
    zwf.language.General["plant_empty"] = "Vazio" // Tells the player that the flowerpot is empty

    zwf.language.General["not_enough_money"] = "VocÃª nÃ£o tem dinheiro para isso!"
    zwf.language.General["not_correct_rank"] = "VocÃª nÃ£o tem rank para isso!"
    zwf.language.General["entity_limit"] = "VocÃª alcanÃ§ou o limite de $itemname!"


    zwf.language.General["CableDistanceFail"] = "Objetos estÃ£o muito distantes um do outro!"

    zwf.language.General["BongSharingFail"] = "$PlayerName jÃ¡ tem esse tipo de bong!"

    zwf.language.General["WeedBlock"] = "Bloco de erva"

    zwf.language.General["WrongJob"] = "Trabalho errado!"


    zwf.language.VGUI["Purchase"] = "Comprar"
    zwf.language.VGUI["SellWeed"] = "Vender erva"
    zwf.language.VGUI["Drop"] = "Dropar"
    zwf.language.VGUI["Delete"] = "Deletar"
    zwf.language.VGUI["weedbuyer_title"] = "Comprador de erva"
    zwf.language.VGUI["seedbank_title"] = "Banco de sementes"
    zwf.language.VGUI["Strain"] = "Strain"
    zwf.language.VGUI["Duration"] = "DuraÃ§Ã£o"
    zwf.language.VGUI["Difficulty"] = "Dificuldade"
    zwf.language.VGUI["HarvestAmount"] = "Quantidade da colheita"
    zwf.language.VGUI["THCBoost"] = "THC Boost"
    zwf.language.VGUI["GrowTimeBoost"] = "Boost no tempo de crescimento"
    zwf.language.VGUI["GrowAmountBoost"] = "Boost na quantidade de crescimento"
    zwf.language.VGUI["THCBoost"] = "THC Boost"
    zwf.language.VGUI["SeedCount"] = "SeedCount"
    zwf.language.VGUI["PowerUsage"] = "Uso de energia"
    zwf.language.VGUI["HeatProduction"] = "ProduÃ§Ã£o de calor"
    zwf.language.VGUI["Ranks"] = "Ranks"
    zwf.language.VGUI["SeedName"] = "Nome da semente"




    zwf.language.NPC["title"] = "Comprador de ervas"
    zwf.language.NPC["profit"] = "Profit"
    zwf.language.NPC["interact_fail"] = "Sai fora!"
    zwf.language.NPC["interact_noweed"] = "Volte quando tiver algo para mim!"



    zwf.language.Shop["title"] = "Erva.com"

    zwf.language.Shop["category_Equipment"] = "Equipamento"

    zwf.language.Shop["item_generator_title"] = "Gerador"
    zwf.language.Shop["item_generator_desc"] = "Gera eletricidade usando combustÃ­vel."

    zwf.language.Shop["item_fuel_title"] = "CombustÃ­vel"
    zwf.language.Shop["item_fuel_desc"] = "CombustÃ­vel para o gerador."

    zwf.language.Shop["item_lamp01_desc"] = "Providencia luz para as plantas, mas aumenta a temperatura delas."
    zwf.language.Shop["item_lamp02_desc"] = "Providencia luz para as plantas sem aumentar a temperatura delas."

    zwf.language.Shop["item_ventilator_title"] = "Ventilador"
    zwf.language.Shop["item_ventilator_desc"] = "Diminui a temperatura das plantas."

    zwf.language.Shop["item_outlet_title"] = "Filtro de linha"
    zwf.language.Shop["item_outlet_desc"] = "Permite energizar vÃ¡rias mÃ¡quinas ao mesmo tempo."

    zwf.language.Shop["item_flowerpot01_title"] = "Flowerpot"
    zwf.language.Shop["item_flowerpot01_desc"] = "Um vaso normal para crscer plantas."

    zwf.language.Shop["item_flowerpot02_title"] = "Hydro Flowerpot"
    zwf.language.Shop["item_flowerpot02_desc"] = "Usado para crescer plantas. Pode ser conectado a um tanque de Ã¡gua para reabastecimento automÃ¡tico."

    zwf.language.Shop["item_soil_title"] = "Terra"
    zwf.language.Shop["item_soil_desc"] = "Material principal para crescer plantas."

    zwf.language.Shop["item_watertank_title"] = "Tanque de Ã¡gua"
    zwf.language.Shop["item_watertank_desc"] = "Produz Ã¡gua para as plantas."

    zwf.language.Shop["item_drystation_title"] = "EstaÃ§Ã£o de secagem"
    zwf.language.Shop["item_drystation_desc"] = "Usado para secar erva."

    zwf.language.Shop["item_packingtable_title"] = "Mesa de empacotamento"
    zwf.language.Shop["item_packingtable_desc"] = "Usado para empacotar jarras de erva em um Bloco para transporte."

    zwf.language.Shop["item_autopacker_title"] = "Empacotador automÃ¡tico"
    zwf.language.Shop["item_autopacker_desc"] = "Pode ser instalado na mesa de empacotemento para automatizar o processo."

    zwf.language.Shop["item_seedlab_title"] = "LaboratÃ³rio de sementes"
    zwf.language.Shop["item_seedlab_desc"] = "Permite vocÃª criar novos tipos de sementes atravÃ©s de ervas."

    zwf.language.Shop["item_seedbank_title"] = "Banco de sementes"
    zwf.language.Shop["item_seedbank_desc"] = "Permite vocÃª guardar sementes."

    zwf.language.Shop["item_palette_title"] = "Palheta"
    zwf.language.Shop["item_palette_desc"] = "Usado para vender Blocos de erva para o Comprador de Ervas."


    zwf.language.Shop["item_seed01_desc"] = "OG Kush Ã© uma variedade lendÃ¡ria com um nome que tem reconhecimento mesmo fora do mundo da cannabis."
    zwf.language.Shop["item_seed02_desc"] = "O Bubba Kush Ã© um hÃ­brido Ã­ndio pesado que aproveita de grande popularidade."
    zwf.language.Shop["item_seed03_desc"] = "A alta energizante e positiva do Sour Diesel torna fÃ¡cil entender por que a variedade aproveita de popularidade nos Estados Unidos."
    zwf.language.Shop["item_seed04_desc"] = "AK-47 Ã© um hÃ­brido Sativa-dominate com coloraÃ§Ã£o branca brilhante."
    zwf.language.Shop["item_seed05_desc"] = "As genÃ©ticas da Super Lemon Haze combinam doce e azedo."
    zwf.language.Shop["item_seed06_desc"] = "O Strawberry Tough Ã© um hÃ­brido sativa estimulante e focado no sabor."
    zwf.language.Shop["item_seed07_desc"] = "A caracterÃ­stica pÃºrpura dessa linhagem Ã© herdada de seus ancestrais da regiÃ£o de Chitral, no paquistanÃªs Hindu Kush."

    zwf.language.Shop["category_Nutritions"] = "Fertilizante"

    zwf.language.Shop["item_nutrition01_desc"] = "Um pequeno boost no crescimento para sua planta."
    zwf.language.Shop["item_nutrition02_desc"] = "Aumento muito a velocidade de crescimento da planta."
    zwf.language.Shop["item_nutrition03_desc"] = "Um pequeno boost de colheita para sua planta."
    zwf.language.Shop["item_nutrition04_desc"] = "Aumenta muito a quantidade de colheita da planta."
    zwf.language.Shop["item_nutrition05_desc"] = "Aumenta um pouco tanto a quantidade de colheita quanto a velocidade de crescimento."
    zwf.language.Shop["item_nutrition06_desc"] = "Aumenta muito tanto a quantidade de colheita quanto a velocidade de crescimento."

    zwf.language.Shop["category_Seeds"] = "Sementes"



    // Joint UPDATE
    zwf.language.General["joint_pickup_fail"] = "VocÃª jÃ¡ tem essa junÃ§Ã£o!"
    zwf.language.General["JointSharingFail"] = "$PlayerName jÃ¡ tem esse junÃ§Ã£o!"

    zwf.language.NPC["question_01"] = "O que vocÃª quer?"
    zwf.language.NPC["question_01_answer01"] = "Eu quero comprar um Bong"
    zwf.language.NPC["question_01_answer02"] = "Eu tenho algumas ervas para vocÃª"
    zwf.language.NPC["question_01_answer03"] = "Nada"

    zwf.language.NPC["question_02"] = "Qual vocÃª quer?"
    zwf.language.NPC["question_02_answer01"] = "Voltar" // This is the Back button on the NPC BongShop interface

end

--PATH addons/zeros_weedfarm/lua/zwf_languages/sh_zwf_language_ptbr.lua:
zwf = zwf or {}
zwf.language = zwf.language or {}

zwf.language.General = zwf.language.General or {}
zwf.language.Shop = zwf.language.Shop or {}
zwf.language.NPC = zwf.language.NPC or {}
zwf.language.VGUI = zwf.language.VGUI or {}
zwf.language.Settings = zwf.language.Settings or {}


if (zwf.config.SelectedLanguage == "ptbr") then

    zwf.language.General["Fuel"] = "Combustivel"

    zwf.language.General["THC"] = "THC"
    zwf.language.General["Remove"] = "Remover"
    zwf.language.General["Splice"] = "Emendar" // The splice button on the seed lab for creating new seeds

    zwf.language.General["Bad"] = "Ruim"
    zwf.language.General["Good"] = "Bom"

    zwf.language.General["Collect"] = "Coletar"

    zwf.language.General["Speed"] = "Velocidade"
    zwf.language.General["Productivity"] = "Produtividade"
    zwf.language.General["AntiPlague"] = "Anti Praga"

    zwf.language.General["Water"] = "Agua"

    zwf.language.General["invalid_character"] = "Nome tem caracteres invalidos!"
    zwf.language.General["name_too_short"] = "Nome muito pequeno!"
    zwf.language.General["name_too_long"] = "Nome muito longo!"

    zwf.language.General["Cancel"] = "Cancelar"
    zwf.language.General["Enter"] = "Confirmar"

    zwf.language.General["ItemBought"] = "Voce comprou $itemname por $currency$price!"


    zwf.language.General["seedlab_titlescreen"] = "Lab de Sementes"
    zwf.language.General["seedlab_help"] = "Colocar nome da planta"

    zwf.language.General["watertank_refill"] = "Recarga"
    zwf.language.General["watertank_title"] = "Tanque de agua"

    zwf.language.General["bong_pickup_fail"] = "Voce ja tem esse bong!"
    zwf.language.General["bong_no_weed"] = "Sem Maconha!"


    zwf.language.General["generator_repair"] = "Reparar!"
    zwf.language.General["generator_start"] = "Iniciar"
    zwf.language.General["generator_stop"] = "Parar"
    zwf.language.General["generator_nofuel"] = "Sem gasolina!"

    zwf.language.General["packingstation_info"] = "Add Frascos de Maconha."
    zwf.language.General["packingstation_weedmix"] = "Misturar Maconha" // If the player mixes diffrent sorts of weed together then we change the name of the weed to this

    zwf.language.General["seedbank_full"] = "Banco de sementes esta cheio!"

    zwf.language.General["plant_heal"] = "Curar" // The heal button
    zwf.language.General["plant_harvest"] = "Colheita" // The harvest button
    zwf.language.General["plant_infected"] = "Infectado!" // Tells us that the plant is infected
    zwf.language.General["plant_postgrow"] = "Pos Crescimento" // Tells us that the plant is in the post grow phase where it keeps growing till it reaches its max weedamount
    zwf.language.General["plant_empty"] = "Vazio" // Tells the player that the flowerpot is empty

    zwf.language.General["not_enough_money"] = "Voce nao pode pagar por isso!"
    zwf.language.General["not_correct_rank"] = "Voce nao tem o rank necessario para isso!"
    zwf.language.General["entity_limit"] = "Voce alcancou o limite de entidade por $itemname!"


    zwf.language.General["CableDistanceFail"] = "Objetos estao distantes demais entre si!"

    zwf.language.General["BongSharingFail"] = "$PlayerName ja tem esse tipo de bong!"

    zwf.language.General["WeedBlock"] = "Maconha Prensada"

    zwf.language.General["WrongJob"] = "Trabalho Errado!"


    zwf.language.VGUI["Purchase"] = "Comprar"
    zwf.language.VGUI["SellWeed"] = "Vender Maconha"
    zwf.language.VGUI["Drop"] = "Soltar"
    zwf.language.VGUI["Delete"] = "Deletar"
    zwf.language.VGUI["weedbuyer_title"] = "Comprador de Maconha"
    zwf.language.VGUI["seedbank_title"] = "Banco de Semente"
    zwf.language.VGUI["Strain"] = "Tensao"
    zwf.language.VGUI["Duration"] = "Duracao"
    zwf.language.VGUI["Difficulty"] = "Dificuldade"
    zwf.language.VGUI["HarvestAmount"] = "Montante de Colheita"
    zwf.language.VGUI["THCBoost"] = "Impulso de THC"
    zwf.language.VGUI["GrowTimeBoost"] = "Impulso de Tempo de Crescimento"
    zwf.language.VGUI["GrowAmountBoost"] = "Impulso de Crescimento de Quantidade"
    zwf.language.VGUI["THCBoost"] = "Impulso de THC"
    zwf.language.VGUI["SeedCount"] = "Contagem de Sementes"
    zwf.language.VGUI["PowerUsage"] = "Uso de Energia"
    zwf.language.VGUI["HeatProduction"] = "Producao de Calor"
    zwf.language.VGUI["Ranks"] = "Ranks"
    zwf.language.VGUI["SeedName"] = "Nome da Semente"




    zwf.language.NPC["title"] = "Comprador de Maconha"
    zwf.language.NPC["profit"] = "Lucro"
    zwf.language.NPC["interact_fail"] = "Sai da minha frente!"
    zwf.language.NPC["interact_noweed"] = "Volte quando voce tiver algo para mim!"



    zwf.language.Shop["title"] = "Loja de Crescimento"

    zwf.language.Shop["category_Equipment"] = "Equipamento"

    zwf.language.Shop["item_generator_title"] = "Gerador"
    zwf.language.Shop["item_generator_desc"] = "Gera energia usando combustivel."

    zwf.language.Shop["item_fuel_title"] = "Gasolina"
    zwf.language.Shop["item_fuel_desc"] = "Gasolina para o gerador."

    zwf.language.Shop["item_lamp01_desc"] = "Fornece luz para as plantas, mas aumenta sua temperatura."
    zwf.language.Shop["item_lamp02_desc"] = "Fornece luz para as plantas sem aumentar sua temperatura."

    zwf.language.Shop["item_ventilator_title"] = "Ventilador"
    zwf.language.Shop["item_ventilator_desc"] = "Diminui a temperatura das plantas."

    zwf.language.Shop["item_outlet_title"] = "Cabo de Extensao"
    zwf.language.Shop["item_outlet_desc"] = "Permite fornecer várias máquinas com energia."

    zwf.language.Shop["item_flowerpot01_title"] = "Vaso de Planta"
    zwf.language.Shop["item_flowerpot01_desc"] = "Vaso de planta normal para cultivar plantas."

    zwf.language.Shop["item_flowerpot02_title"] = "Vaso de Planta Hydro"
    zwf.language.Shop["item_flowerpot02_desc"] = "Usado para cultivar plantas. Pode ser conectado a um tanque de água para abastecimento automatico de agua."

    zwf.language.Shop["item_soil_title"] = "Solo"
    zwf.language.Shop["item_soil_desc"] = "Materia base para cultivar plantas."

    zwf.language.Shop["item_watertank_title"] = "Tanque de Agua"
    zwf.language.Shop["item_watertank_desc"] = "Produz agua para as plantas."

    zwf.language.Shop["item_drystation_title"] = "Estacao Seca"
    zwf.language.Shop["item_drystation_desc"] = "Usado para secar a maconha."

    zwf.language.Shop["item_packingtable_title"] = "Mesa de Embalagem"
    zwf.language.Shop["item_packingtable_desc"] = "Usado para embalar frascos de maconha em um Bloco para Transporte."

    zwf.language.Shop["item_autopacker_title"] = "Embalagem Automatica"
    zwf.language.Shop["item_autopacker_desc"] = "Pode ser instalado na mesa de embalagem para automatizar o processo."

    zwf.language.Shop["item_seedlab_title"] = "Laboratorio de Semente"
    zwf.language.Shop["item_seedlab_desc"] = "Permite criar novas sementes a partir da maconha."

    zwf.language.Shop["item_seedbank_title"] = "Banco de Semente"
    zwf.language.Shop["item_seedbank_desc"] = "Permite guardar sementes."

    zwf.language.Shop["item_palette_title"] = "Palette"
    zwf.language.Shop["item_palette_desc"] = "Usado para vender maconha prensada ao comprador de maconha."


    zwf.language.Shop["item_seed01_desc"] = "OG Kush, uma semente lendaria com um nome reconhecido mesmo fora do mundo da cannabis."
    zwf.language.Shop["item_seed02_desc"] = "Bubba Kush, um hibrido indica pesado que goza de grande popularidade."
    zwf.language.Shop["item_seed03_desc"] = "Sour Diesel’s, energizada e positiva na qual tem uma gigantesca popularidade nos Estados Unidos."
    zwf.language.Shop["item_seed04_desc"] = "AK-47, um hibrido dominado por sativa com coloracao branca brilhante"
    zwf.language.Shop["item_seed05_desc"] = "A genetica do Super Lemon Haze combina doce e azedo."
    zwf.language.Shop["item_seed06_desc"] = "Strawberry Cough, um estimulante sativa e focado no sabor."
    zwf.language.Shop["item_seed07_desc"] = "A caracteristica purpura desta cepa e herdada de seus ancestrais da regiao Chitral no Paquistao Hindu Kush."

    zwf.language.Shop["category_Nutritions"] = "Fertilizante"

    zwf.language.Shop["item_nutrition01_desc"] = "Um pequeno impulso da velocidade de Crescimento para sua planta."
    zwf.language.Shop["item_nutrition02_desc"] = "Aumenta muito a velocidade de Crescimento da planta."
    zwf.language.Shop["item_nutrition03_desc"] = "Um pequeno impulso de Colheita para sua planta."
    zwf.language.Shop["item_nutrition04_desc"] = "Aumenta muito a Colheita da planta."
    zwf.language.Shop["item_nutrition05_desc"] = "Aumenta um pouco a Colheita e a velocidade de Crescimento."
    zwf.language.Shop["item_nutrition06_desc"] = "Aumenta muito a Colheita e a velocidade de Crescimento."

    zwf.language.Shop["category_Seeds"] = "Sementes"



    // Joint UPDATE
    zwf.language.General["joint_pickup_fail"] = "Voce ja tem um beck!"
    zwf.language.General["JointSharingFail"] = "$PlayerName ja tem um beck!"

    zwf.language.NPC["question_01"] = "O que voce quer?"
    zwf.language.NPC["question_01_answer01"] = "Eu quero comprar um Bong"
    zwf.language.NPC["question_01_answer02"] = "Eu quero um pouco de maconha de voce"
    zwf.language.NPC["question_01_answer03"] = "Nada"

    zwf.language.NPC["question_02"] = "Qual deles voce quer?"
    zwf.language.NPC["question_02_answer01"] = "Voltar" // This is the Back button on the NPC BongShop interface

end

--PATH vcmod??precache_vc1:
game.AddParticles("particles/vc_explosion.pcf") game.AddParticles("particles/vc_damage.pcf") game.AddParticles("particles/vc_surface.pcf") game.AddParticles("particles/vc_exhaust.pcf")  PrecacheParticleSystem("VC_WheelSparks") PrecacheParticleSystem("VC_Wheel_Fix") PrecacheParticleSystem("VC_WheelDust") PrecacheParticleSystem("VC_Wheel_Deflate") PrecacheParticleSystem("VC_WheelSmoke_Asphalt") PrecacheParticleSystem("VC_Wheelsmoke_Dirt_Burnout_Debris") PrecacheParticleSystem("VC_WheelSmoke_Sand_2") PrecacheParticleSystem("VC_Wheelsmoke_BurnoutLeft") PrecacheParticleSystem("VC_Wheelsmoke_Dirt_Burnout") PrecacheParticleSystem("VC_WheelSmoke_Sand")  PrecacheParticleSystem("VC_BackFire") PrecacheParticleSystem("VC_BackFire_Sparks")  PrecacheParticleSystem("VC_Crash") PrecacheParticleSystem("VC_Crash_Sparks") PrecacheParticleSystem("VC_Crash_Sparklies")  PrecacheParticleSystem("VC_Engine_Fire") PrecacheParticleSystem("VC_Engine_Smoke") PrecacheParticleSystem("VC_Engine_Fire_Sparks_B") PrecacheParticleSystem("Car_Explosion") PrecacheParticleSystem("VC_Glass_Fix") PrecacheParticleSystem("VC_Glass_Light")  PrecacheParticleSystem("VC_Exhaust") PrecacheParticleSystem("VC_Exhaust_Stress") PrecacheParticleSystem("VC_Exhaust_Truck") PrecacheParticleSystem("VC_Exhaust_Truck_Stress")  local dir = "vcmod/collision/spring/" for k,v in pairs(file.Find("sound/"..dir.."*", "GAME")) do util.PrecacheSound("sound/"..dir..v) end local dir = "vcmod/collision/light/" for k,v in pairs(file.Find("sound/"..dir.."*", "GAME")) do util.PrecacheSound("sound/"..dir..v) end local dir = "vcmod/collision/medium/" for k,v in pairs(file.Find("sound/"..dir.."*", "GAME")) do util.PrecacheSound("sound/"..dir..v) end local dir = "vcmod/collision/heavy/" for k,v in pairs(file.Find("sound/"..dir.."*", "GAME")) do util.PrecacheSound("sound/"..dir..v) end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?npc_repair:
local El = {}  function El:Init()  if self:GetTall() == 24 then self:SetTall(43) end   end  net.Receive("VC_RM_Send_Menu_Open", function(len) local ent, tbl, plytbl, int, admin = net.ReadEntity(), net.ReadTable(), net.ReadTable(), net.ReadInt(8), net.ReadInt(4) if IsValid(ent) then if admin and admin == 1 then VC.RM.open_menu_choice(ent, tbl, plytbl, int) else VC.RM.open_menu_main(ent, tbl, plytbl, int) end end end) net.Receive("VC_RM_SendInfo_Import_NPC", function(len) local ent, tbl = net.ReadEntity(), net.ReadTable() VC.RM.Import_NPC_Tbl = {ent, tbl} end)  function El:Paint(Sx, Sy)  local nSx = Sx-40  local hov = self:IsHovered()  local selected = self:GetSelected()  local working = self.VC_Working  local current = self:GetCurrent() and IsValid(self.VC_Ent) and self.VC_Ent.VC_RM_LastFixing   local prc = 0  if current then prc = (CurTime()-self.VC_Ent.VC_RM_LastFixing.time_s)/self:GetTime() end   local fdv = VC.FadeW/2  if selected or working then  VC.DrawFadeRect(fdv, 0, Sx-VC.FadeW, Sy, current and Color(Lerp(prc, 155, 0),Lerp(prc,0, 100),Lerp(prc,0, 0), 150-math.sin(CurTime()*10)*55) or working and Color(100,0,0,150) or Color(0,55,0, 100))  end  if hov then VC.DrawFadeRect(fdv, 0, Sx-VC.FadeW, Sy, Color(155,155,155,45)) end   local clr = VC.Color.White  if selected then clr = VC.Color.Good end  if working then clr = VC.Color.Bad end  if hov then clr = VC.Color.Neutral end  draw.RoundedBox(0, 20, Sy-4, Sx-40, 2, clr)   if self.VC_Icon then  local isx, isy = Sx, Sy*0.65 surface.SetDrawColor(selected and VC.Color.Good or Color(255,255,255,255*self:GetAlpha())) surface.SetMaterial(self.VC_Icon) surface.DrawTexturedRect(20+Sy/2-isy/2,isy/5, isy, isy)  end   local symbol = VC.getCurCurrency().symbol  if self.VC_Cost and !working then draw.SimpleText(symbol..VC.PreparePrice(self.VC_Cost), "VC_Regular_Ms", Sx-2-20, Sy-15, VC.Color.Good, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER) end  if self.VC_Time then local time = math.Round(self.VC_Time-self.VC_Time*prc) if time < 0 then time = 0 end draw.SimpleText(time.." "..VC.Lng("sec"), "VC_Regular_Ms", Sx-2-20, Sy-30, VC.Color.Blue, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER) end  if self.VC_Text then draw.SimpleText(self.VC_Text, "VC_Dev_Text", 60, 10, self.VC_Clr_Base or VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) end  if working then local rclr = VC.Color.Blue if current then rclr = Color(Lerp(prc,rclr.r, VC.Color.Good.r),Lerp(prc,rclr.g, VC.Color.Good.g),Lerp(prc,rclr.b, VC.Color.Good.b), 255) prc = math.Clamp(math.Round(prc*100), 0, 100) end draw.SimpleText(VC.Lng("Repairing").." "..prc.."%", "VC_Regular_Ms", 60, Sy-15, rclr, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) end end   function El:OnMousePressed(MB) self:SetSelected(!self:GetSelected()) end  function El:SetIcon(val) self.VC_Icon = val end function El:GetIcon() return self.VC_Icon end  function El:SetCost(val) self.VC_Cost = val end function El:GetCost() return self.VC_Cost end  function El:SetTime(val) self.VC_Time = val end function El:GetTime() return self.VC_Time end  function El:SetSelected(val) if self:GetParent() and self:GetParent():GetParent() and self:GetParent():GetParent():GetParent() then self:GetParent():GetParent():GetParent().VC_Refresh_Total = true end self.VC_Selected = !self:GetWorking() and val end function El:GetSelected() return self.VC_Selected end  function El:SetData(val) self.VC_Data = val end function El:GetData(val) return self.VC_Data end  function El:SetCurrent(val) self.VC_Current = self:GetWorking() and val end function El:GetCurrent() return self.VC_Current end  function El:SetVCText(val) self:SetText("") self.VC_Text = VC.Lng(val or "") end function El:GetVCText() return self.VC_Text end  function El:SetBaseColor(val) self.VC_Clr_Base = val end function El:GetBaseColor() return self.VC_Clr_Base end  function El:SetWorking(val) self.VC_Working = val end function El:GetWorking() return self.VC_Working end  derma.DefineControl("VC_Repair_Obj", "VCMod's repair object.", El, "DButton")  local function getHealthColor(prc) local clr = VC.Color.White if prc <= 0.15 then clr = VC.Color.Bad elseif prc < 0.4 then clr = VC.Color.Neutral end return clr end  function VC.RM.open_menu_main_pre(ent, npc, npctbl, npcint) net.Start("VC_RM_open_menu_main_pre") net.WriteEntity(ent) net.WriteEntity(npc) net.WriteTable(npctbl) net.WriteInt(npcint, 4) net.SendToServer() end  net.Receive("VC_RM_UpdateInfo", function()  local ent = net.ReadEntity()   if !IsValid(ent) then return end  local tbl = net.ReadTable() if table.Count(tbl) == 0 then tbl = nil end  if IsValid(VC.RM.Menu) then VC_RM_Refresh_Objects = true end  ent.VC_RM_LastFixing = tbl end)  net.Receive("VC_RM_open_menu_main", function()  local ent, npc, npctbl, npcint, tbl, cur = net.ReadEntity(), net.ReadEntity(), net.ReadTable(), net.ReadInt(4), net.ReadTable(), net.ReadString()  VC.RM.open_menu_main(ent, npc, npctbl, npcint, tbl, cur) end)  function VC.DamagedLightIsELS(ent, key)  local isELS = false  local side = 1  local OD = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent)  local mdl = VC.GetModel(ent) if OD.LPT and OD.LPT[key] and ent.VC_DamagedObjects then if OD.LPT[key].els then isELS = true end local pos = OD.LPT[key].Pos if pos.x < 0 then if pos.y < 0 then side = 3 end else if pos.y < 0 then side = 4 else side = 2 end end end  return {side = side, isELS = isELS} end  function VC.RM.open_menu_main(ent, npc, npctbl, npcint, tbl, cur)  local MPx = ScrW()*0.7 local MPy = ScrH()*0.6   local Objects = {} local CreatedObjects = {}  local function ReinitObjects()  Objects = {}    local prc = ent:GetNWInt("VC_HealthPerc", 1)  if prc < 1 then  if prc > 0 then  Objects[1] = {var = "engine", varint = 1, name = VC.Lng("Engine").." "..math.Round(prc*100).."%", side = 0, working = tbl and tbl.objects and tbl.objects["engine1"], cost = 0, time = math.Round(5+VC.GetPartInfo("engine").time*(1-prc)*0.5), icon = VC.GetPartIcon("engine"), clr_base = getHealthColor(prc)}  else  Objects[1] = {var = "engine", varint = 1, name = "EngineNew", side = 0, cost = VC.GetPartInfo("engine").price, working = tbl and tbl.objects and tbl.objects["engine1"], time = VC.GetPartInfo("engine").time, icon = VC.GetPartIcon("engine"), clr_base = getHealthColor(prc)}  end  end  if ent.VC_DamagedObjects then  for k,v in pairs(ent.VC_DamagedObjects) do  if k != "L_ELS" then  for k2,v2 in pairs(v) do  if k == "wheel" then table.insert(Objects, {var = k, varint = k2, side = k2, name = VC.SideNames[k2], cost = VC.GetPartInfo(k).price, working = tbl and tbl.objects and tbl.objects[k..k2], time = VC.GetPartInfo(k).time, icon = VC.GetPartIcon(k)}) end  if k == "light" then  local ELSData = VC.DamagedLightIsELS(ent, k2)  local isELS = ELSData.isELS  local side = ELSData.side    table.insert(Objects, {var = k, varint = k2, side = side, name = VC.SideNames[side], cost = VC.GetPartInfo(k).price, working = tbl and tbl.objects and tbl.objects[k..k2], time = VC.GetPartInfo(k).time, icon = VC.GetPartIcon(k..(isELS and "_els" or ""))})  end  if k == "exhaust" then table.insert(Objects, {var = k, varint = k2, side = side, name = "Exhaust", cost = VC.GetPartInfo(k).price, working = tbl and tbl.objects and tbl.objects[k..k2], time = VC.GetPartInfo(k).time, icon = VC.GetPartIcon(k)}) end  end  end  end  end  end  ReinitObjects()   local Pnl = vgui.Create("DFrame") Pnl:SetSize(MPx, MPy) Pnl:SetTitle("") Pnl:SetPos(ScrW()/2-Pnl:GetWide()/2,ScrH()/2-Pnl:GetTall()/2) Pnl:SetDraggable(false) Pnl:ShowCloseButton(false) Pnl:NoClipping(true) Pnl:AlphaTo(0, 0, 0) Pnl:AlphaTo(255, 0.2, 0) VC.RM.Main_Pnl = Pnl Pnl.FrameRate = 0   Pnl:SizeTo(0, MPy, 0) Pnl:SizeTo(MPx, MPy, 0.2, 0.2, 1)   local clr = table.Copy(VC.Color.Main) clr.a = 200 VC.RM.Menu = Pnl   Pnl.Paint = function(obj, Sx, Sy)  local tclr = VC.Color.Main tclr = tclr and table.Copy(tclr)  if !fade then fade = VC.FadeW end  Sx = math.Round(Sx) Sy = math.Round(Sy)  local Px = 0 local Py = 0  local Sy2 = math.Round(Sy/2)  draw.RoundedBox(0, math.Round(Px+fade/2), Py, Sx-fade, Sy, tclr)  surface.SetDrawColor(tclr)  surface.SetMaterial(VC.Material.Fade)  surface.DrawTexturedRectRotated(Px+Sx, Py+Sy2, fade, Sy, 0)  surface.DrawTexturedRectRotated(Px, Py+Sy2, fade, Sy, 180)  end    local RepairPanel = VC.Add_El_List(20, 0, 200, Pnl:GetTall()) RepairPanel.StartPos_X, RepairPanel.StartPos_Y = RepairPanel:GetPos() RepairPanel:SetParent(Pnl) RepairPanel:AlphaTo(0, 0, 0) RepairPanel:AlphaTo(255, 0.2, 0.2) RepairPanel:NoClipping(true)  RepairPanel.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, 0, 0, Sx-10, Sy, clr) surface.SetDrawColor(clr) surface.SetMaterial(VC.Material.Fade) surface.DrawTexturedRectRotated(Sx+VC.FadeW/2-10, Sy/2, VC.FadeW, Sy, 0) surface.DrawTexturedRectRotated(-VC.FadeW/2, Sy/2, VC.FadeW, Sy, 180) draw.RoundedBox(0, -10, Sy-70, Sx+20, 1, VC.Color.Blue) end   local Lbl1 = vgui.Create("DLabel") Lbl1:SetTall(30) Lbl1:SetText("") RepairPanel:AddItem(Lbl1)   local ModelView_sel = vgui.Create("DModelPanel", Pnl) ModelView_sel:SetSize(MPx-RepairPanel:GetWide()-50, MPy) ModelView_sel:SetPos(RepairPanel:GetWide()+50, MPy/2-ModelView_sel:GetTall()/2) ModelView_sel:SetModel("") ModelView_sel.ModelLength = 0 ModelView_sel.RBounds = Vector(0,0,0) ModelView_sel.VC_RotX = 0 ModelView_sel.VC_RotY = 0 ModelView_sel.FarZ = ModelView_sel.FarZ/1  local ModelView = vgui.Create("DModelPanel", Pnl) ModelView:SetSize(MPx-RepairPanel:GetWide()-50, MPy) ModelView:SetPos(RepairPanel:GetWide()+50, MPy/2-ModelView:GetTall()/2) ModelView:SetModel("") ModelView.ModelLength = 0 ModelView.RBounds = Vector(0,0,0) ModelView.VC_RotX = 0 ModelView.VC_RotY = 0 ModelView.FarZ = ModelView.FarZ/1  local Close = vgui.Create("DImageButton") Close:SetMaterial(VC.Material.Cross) Close:SetSize(30,30) Close:SetPos(Pnl:GetWide()-Close:GetWide()-5,5) Close:SetParent(Pnl) Close:SetText("") Close.DoClick = function() Pnl:Close() end Pnl:AlphaTo(0, 0, 0) Pnl:AlphaTo(255, 0.2, 0.2)   Pnl.PaintOver = function(obj, Sx, Sy)  surface.SetFont("VC_Big")  local name = VC.getName(ent, VC.Lng("Unknown"))  local extra = RepairPanel:GetWide()/2  local tsize = surface.GetTextSize(name) local Py = -math.abs(ModelView.VC_Progress/15) local start = math.Round(Sx/2-tsize/2+ModelView.VC_Progress*1.2+extra) local tclr = table.Copy(VC.Color.Good) tclr.a = 500- math.abs(ModelView.VC_Progress)*2   local dclr = table.Copy(clr) dclr.a = tclr.a  draw.DrawText(VC.getName(ent, VC.Lng("Unknown")), "VC_Big", Sx/2+ModelView.VC_Progress*1.25+extra, 75+Py, tclr, TEXT_ALIGN_CENTER)   local text = npctbl.Name surface.SetFont("VC_Name") local tz = surface.GetTextSize(text)+20  local PSx, PSy = tz, 50  local tclr = table.Copy(VC.Color.Blue) draw.SimpleText(text, "VC_Name", 250+40, 25+2, tclr, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  surface.SetDrawColor(tclr)  surface.SetMaterial(VC.Material.icon_repair)  surface.DrawTexturedRect(250, 8+2, 35, 35)   draw.SimpleText(VC.Lng("DamagedParts")..":", "VC_Menu_Side", 15, 25, VC.Color.Blue, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  end  local angData = {  [0] = -80,  [1] = -50,  [2] = -140,  [3] = 50,  [4] = 140, }   local function getSelAng(int)  local ang = nil local obj = nil  for k,v in pairs(CreatedObjects) do  if v:IsHovered() then ang = angData[v.side] obj = v:GetData().obj Pnl.VC_LastObj = obj Pnl.VC_LastInt = v:GetData().int break end  end   local nmld = ang and "models/dav0r/hoverball.mdl" or ""  if ang then ModelView.VC_RotX = ang end  local mdl = ModelView_sel:GetModel() if (mdl or "") != nmld then ModelView_sel:SetModel(nmld)  local ment = ModelView_sel:GetEntity() if IsValid(ment) then ment:SetMaterial("models/wireframe") end  end   return ang  end   function ModelView_sel:LayoutEntity() return end  function ModelView:LayoutEntity()  local tvec = Vector(0,1500,0) tvec:Rotate(Angle(0, math.Clamp(ModelView.VC_Progress,-3000,3000)/(50-math.abs(ModelView.VC_Progress/10)), 0)) tvec = tvec-Vector(0,1500,0)  Pnl.VC_SelAngX = !ModelView.VC_IsCapturing_Right and getSelAng()   ModelView.R_Ang_Rot_X = Lerp(angx and 0.12 or 0.05, ModelView.R_Ang_Rot_X or ModelView.VC_RotX, Pnl.VC_SelAngX or ModelView.VC_RotX)  ModelView.R_Ang_Rot_Y = Lerp(0.05, ModelView.R_Ang_Rot_Y or ModelView.VC_RotY, ModelView.VC_RotY)  local ang = Angle(ModelView.R_Ang_Rot_Y+15,ModelView.R_Ang_Rot_X,0)   local offset = ModelView.RBounds.y  local pos = -ang:Forward()*(250-tvec.y*2)+ang:Up()*(35)+ang:Right()*tvec.x-ang:Forward()*50-ang:Up()*ang.p/2-ang:Forward()*(-200-offset* 1.6)  ModelView.VC_LookAng = ang ModelView.VC_LookPos = pos  ModelView:SetLookAng(ang) ModelView:SetCamPos(pos)   local epos = Vector(0,0,0) if IsValid(ent) and Pnl.VC_LastObj then epos = VC.GetObjectPos(ent, Pnl.VC_LastObj, Pnl.VC_LastInt, 137) end   ModelView_sel:SetLookAng(ang) ModelView_sel:SetCamPos(pos-epos)  return  end   ModelView.R_Ang_Rot_X = 50  ModelView.VC_Progress = -400  ModelView.VC_LastSpeed = -20   function ModelView:OnMousePressed(code) local Mx,My = gui.MousePos() ModelView.VC_IsCapturing_Right = {x = Mx, y = My} end  function ModelView:OnMouseReleased(code) ModelView.VC_IsCapturing_Right = false ModelView.VC_LastRight_X = nil ModelView.VC_LastRight_Y = nil end   ModelView.Think = function()  local limit = 200   if !ModelView:IsHovered() then if ModelView.VC_IsCapturing then ModelView:OnMouseReleased(MOUSE_LEFT) end if ModelView.VC_IsCapturing_Right then ModelView:OnMouseReleased(MOUSE_RIGHT) end end   if !ModelView.VC_Progress then ModelView.VC_Progress = 0 end  if ModelView.VC_IsCapturing_Right then  local Mx,My = gui.MousePos()  ModelView.VC_RotX=ModelView.VC_RotX+((ModelView.VC_LastRight_X or Mx)-Mx)  ModelView.VC_RotY=math.Clamp(ModelView.VC_RotY-((ModelView.VC_LastRight_Y or My)-My), -15,25)  ModelView.VC_LastRight_X = Mx  ModelView.VC_LastRight_Y = My  else  if !Pnl.VC_SelAngX then ModelView.VC_RotX = ModelView.VC_RotX+0.04 end  ModelView.VC_RotY = math.Approach(ModelView.VC_RotY, 0, 0.01)  end   if ModelView.VC_IsCapturing then  local Mx,My = gui.MousePos()  ModelView.VC_LastSpeed = ModelView.VC_Progress-(Mx-ModelView.VC_IsCapturing.x)  ModelView.VC_Progress = Mx-ModelView.VC_IsCapturing.x  else  ModelView.VC_Progress = Lerp(0.02, ModelView.VC_Progress, 0)  ModelView.VC_LastSpeed = Lerp(0.09, ModelView.VC_LastSpeed or 0, 0)  ModelView.VC_Progress = ModelView.VC_Progress-ModelView.VC_LastSpeed  end  end   ModelView:SetModel(VC.GetModel(ent))   local mvent = ModelView:GetEntity()    ModelView.ModelLength = mvent:GetRenderBounds():Length()*1.5-200 ModelView.RBounds = mvent:GetRenderBounds()  VC.ApplyEntityParams(ent, mvent)    mvent:SetPoseParameter("vehicle_steer", -1) mvent:SetPoseParameter("vehicle_wheel_rl_height", 0.5) mvent:SetPoseParameter("vehicle_wheel_rr_height", 0.5) mvent:SetPoseParameter("vehicle_wheel_fl_height", 0.5) mvent:SetPoseParameter("vehicle_wheel_fr_height", 0.5)   local ofst = Lbl1:GetTall()+10  local ObjectPanel = VC.Add_El_List(0, ofst, 240, Pnl:GetTall()-ofst-80) ObjectPanel.StartPos_X, ObjectPanel.StartPos_Y = ObjectPanel:GetPos() ObjectPanel:SetParent(Pnl)   local sbar = ObjectPanel.VBar sbar:SetWide(2) sbar.btnUp:SetWide(2) sbar.btnDown:SetWide(2) sbar.btnGrip:SetWide(2) function sbar:Paint(w, h) end function sbar.btnUp:Paint(w, h) end function sbar.btnDown:Paint(w, h) end sbar.btnGrip:NoClipping(true) function sbar.btnGrip:Paint(w, h) draw.RoundedBox(0, w-2, -sbar.btnDown:GetTall(), 2, h+sbar.btnDown:GetTall()*2, VC.Color.Blue) end   local function RefreshObjects(inst)  if CreatedObjects then for k,v in pairs(CreatedObjects) do if IsValid(v) then v:Remove() end end CreatedObjects = {} end  for k,v in SortedPairs(Objects) do  local Lbl = vgui.Create("DLabel") Lbl:SetTall(2) Lbl:SetText("") ObjectPanel:AddItem(Lbl)  local Obj = vgui.Create("VC_Repair_Obj") Obj.VC_Ent = ent Obj:SetVCText(v.name or "") Obj:SetTall(43) Obj:SetIcon(v.icon) Obj:SetCost(v.cost or 10) Obj:SetTime(v.time or 5) Obj:SetSelected(v.selected) Obj:SetWorking(v.working) if ent.VC_RM_LastFixing and v.var..(v.varint or 1) == (ent.VC_RM_LastFixing.type..ent.VC_RM_LastFixing.int) then Obj:SetCurrent(true) end Obj:SetBaseColor(v.clr_base) Obj.VC_Tbl = table.Copy(v)  Obj:SetData({obj = v.var, int = v.varint}) Obj.side = v.side  Lbl:SetParent(Obj)  if !inst then Obj:AlphaTo(0, 0, 0) timer.Simple(0.05*k, function() if IsValid(Obj) then Obj:AlphaTo(255, 0.2, 0.2) end end) end  ObjectPanel:AddItem(Obj)  table.insert(CreatedObjects, Obj)  end  end  RefreshObjects()   local TotalPanel = VC.Add_El_List(0, ofst+ObjectPanel:GetTall()+10, 240, Pnl:GetTall()-ObjectPanel:GetTall()-ofst-20) TotalPanel.StartPos_X, TotalPanel.StartPos_Y = TotalPanel:GetPos() TotalPanel:SetParent(Pnl)  local symbol = VC.getCurCurrency().symbol  TotalPanel.Paint = function(obj, Sx, Sy)  draw.SimpleText(VC.Lng("PartsCost")..":", "VC_Regular_Ms", 10, 10, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText(symbol..VC.PreparePrice(Pnl.VC_TotalCost), "VC_Regular_Ms", Sx-10, 10, VC.Color.White, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)   draw.SimpleText(VC.Lng("RepairCost")..":", "VC_Regular_Ms", 10, 21, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText(symbol..VC.PreparePrice(Pnl.VC_TotalTimeCost or 0), "VC_Regular_Ms", Sx-10, 21, VC.Color.White, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)   draw.SimpleText(VC.Lng("RepairTime")..":", "VC_Regular_Ms", 10, 32, VC.Color.Blue, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText(string.FormattedTime(Pnl.VC_TotalTime, "%02i:%02i"), "VC_Regular_Ms", Sx-10, 32, VC.Color.Blue, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)   draw.SimpleText(VC.Lng("Total")..":", "VC_Menu_Header", 10, Sy-10, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText(symbol..VC.PreparePrice((Pnl.VC_TotalCost or 0)+(Pnl.VC_TotalTimeCost or 0)), "VC_Menu_Header", Sx/2-20, Sy-10, VC.Color.Good, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)  end   local Select = vgui.Create("DImageButton") Select:SetMaterial("icon16/text_list_bullets.png") Select:SetParent(Pnl) Select:SetText("") Select:SetSize(20, 20) Select:SetPos(TotalPanel:GetWide()-20, 12)  Select.DoClick = function()  local allsel = true  for k,v in pairs(CreatedObjects) do if !v:GetSelected() and !v:GetWorking() and !v:GetCurrent() then allsel = false break end end  for k,v in pairs(CreatedObjects) do if !v:GetWorking() and !v:GetCurrent() then v:SetSelected(!allsel) end end  end   local ConfirmButon = vgui.Create("VC_Button") ConfirmButon:SetParent(TotalPanel) ConfirmButon:SetText(VC.Lng("Accept")) ConfirmButon:SetColor(VC.Color.Btn_Add) ConfirmButon:SetSize(TotalPanel:GetWide()/2-20, 20) ConfirmButon:SetPos(TotalPanel:GetWide()/2+10, TotalPanel:GetTall()-20)   ConfirmButon.DoClick = function()  local C_Pnl = vgui.Create("DFrame") C_Pnl:SetSize(400, 180) C_Pnl:SetTitle("") C_Pnl:SetPos(ScrW()/2-C_Pnl:GetWide()/2,ScrH()/2-C_Pnl:GetTall()/2) C_Pnl:SetDraggable(false) C_Pnl:ShowCloseButton(false) C_Pnl:AlphaTo(0, 0, 0) C_Pnl:AlphaTo(255, 0.2, 0) C_Pnl:SetParent(Pnl)  C_Pnl.VC_FocusCheckTime = CurTime()+1  local selt = {} for k,v in pairs(CreatedObjects) do if v:GetSelected() then selt[v:GetIcon()] = (selt[v:GetIcon()] or 0) +1 end end  local cnt = table.Count(selt)   C_Pnl.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, VC.Color.Main)  draw.RoundedBox(0, 0, 0, Sx, 50, VC.Color.Main)  local cur = 1 for k,v in pairs(selt) do local isx, isy = Sx, Sy*0.55 surface.SetDrawColor(Color(255,255,255,255)) surface.SetMaterial(k) local ps = Sx/2-cnt*45*0.5+cur*45-5-30 surface.DrawTexturedRect(ps,10, 30, 30) draw.SimpleText(v, "VC_Dev_Text", ps+13, 45, VC.Color.White, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) cur=cur+1 end   draw.SimpleText(VC.Lng("PartsCost")..":", "VC_Regular_Ms", 20, 60, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText(symbol..VC.PreparePrice(Pnl.VC_TotalCost), "VC_Regular_Ms", Sx-20, 60, VC.Color.White, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)   draw.SimpleText(VC.Lng("RepairCost")..":", "VC_Regular_Ms", 20, 75, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText(symbol..VC.PreparePrice(Pnl.VC_TotalTimeCost or 0), "VC_Regular_Ms", Sx-20, 75, VC.Color.White, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)   draw.SimpleText(VC.Lng("RepairTime")..":", "VC_Regular_Ms", 20, 90, VC.Color.Blue, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText(string.FormattedTime(Pnl.VC_TotalTime, "%02i:%02i"), "VC_Regular_Ms", Sx-20, 90, VC.Color.Blue, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)   draw.SimpleText(VC.Lng("Total")..":", "VC_Menu_Header", 20, 115, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText(symbol..VC.PreparePrice((Pnl.VC_TotalCost or 0)+(Pnl.VC_TotalTimeCost or 0)), "VC_Menu_Header", Sx-20, 115, VC.Color.Good, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)  end   local Accept = vgui.Create("VC_Button", C_Pnl) Accept:SetColor(VC.Color.Btn_Add) Accept:SetText(VC.Lng("Accept")) Accept:SetFont("VC_Regular2") Accept:SetSize(C_Pnl:GetWide()/2-25, 35) Accept:SetPos(20, C_Pnl:GetTall()-Accept:GetTall()-15)  local Cancel = vgui.Create("VC_Button", C_Pnl) Cancel:SetColor(VC.Color.Btn_Rem) Cancel:SetText(VC.Lng("Cancel")) Cancel:SetFont("VC_Regular2") Cancel:SetSize(C_Pnl:GetWide()/2-25,35) Cancel:SetPos(C_Pnl:GetWide()/2+5, C_Pnl:GetTall()-Cancel:GetTall()-15)   Accept.DoClick = function()  local ttbl = {} local objtbl = {} for k,v in pairs(CreatedObjects) do if v:GetSelected() then objtbl[k] = v table.insert(ttbl, {v.VC_Tbl.var, v.VC_Tbl.varint}) end end  if VC.CanAfford(LocalPlayer(), (Pnl.VC_TotalCost or 0)+(Pnl.VC_TotalTimeCost or 0)) then  VCPopup("Purchased", "check")  for k2,v2 in pairs(objtbl) do v2:SetSelected(false) v2:SetWorking(true) if !tbl then tbl = {} end if !tbl.objects then tbl.objects = {} end tbl.objects[v2.VC_Tbl.var..(v2.VC_Tbl.varint or 1)] = {v2.VC_Tbl.var, v2.VC_Tbl.varint, CurTime()} end  net.Start("VC_RM_SendPurchases") net.WriteEntity(ent) net.WriteEntity(npc) net.WriteTable(ttbl) net.SendToServer()  else  VCPopup("CD_Cant_Afford", "cross")  end  C_Pnl:Close()  end   C_Pnl.Think = function()  local backDown = input.IsKeyDown(KEY_BACKSPACE) if backDown and !backPressed then Cancel.DoClick() backPressed = true elseif !backDown and backPressed then backPressed = false end  local enterDown = input.IsKeyDown(KEY_ENTER) if enterDown and !enterPressed then Accept.DoClick() enterPressed = true elseif !enterDown and enterPressed then enterPressed = false end  end  Cancel.DoClick = function() C_Pnl:Close() end  C_Pnl:MakePopup()  end   local function RefreshTotal()  local cnt = 0 local cost = 0 local time = 0  for k,v in pairs(CreatedObjects) do if v:GetSelected() then cnt = cnt+1 cost = cost+v:GetCost() time = time+v:GetTime() end end  Pnl.VC_TotalSelected = cnt  ConfirmButon:SetVisible(Pnl.VC_TotalSelected > 0)  Pnl.VC_TotalCost = cost  Pnl.VC_TotalTime = time  Pnl.VC_TotalTimeCost = math.Round(time*VC.getServerSetting("RM_Repair_Time_Cost", 1))  end   RefreshTotal()   Pnl.Think = function()  if VC_RM_Refresh_Objects then ReinitObjects() RefreshObjects(true) VC_RM_Refresh_Objects = nil end  if Pnl.VC_Refresh_Total then RefreshTotal() Pnl.VC_Refresh_Total = nil end  end   Pnl:MakePopup() end  function VC.RM.HUDPaint()  local FTm = VC.FTm()   for k,ent in pairs(VC.GetVehicleList()) do  if !IsValid(ent) then continue end   if ent.VC_RM_LastFixing then  if !ent.VC_RM_DistCheckT or CurTime() >= ent.VC_RM_DistCheckT then ent.VC_RM_DistCheckT = CurTime()+1 ent.VC_RM_Rep_Dist = VC.GetViewPos():Distance(ent:GetPos()) end   local on = ent.VC_RM_Rep_Dist < 300  local anim = VC.UI_AnimData("RM_Repair_"..k, on, 0.05, 0.02)   if anim then   local Rat_L = anim*2 if Rat_L > 1 then Rat_L = 1 end local Rat_BT = anim*3 if Rat_BT > 1 then Rat_BT = 1 end local Rat_TT = anim*2-1 if Rat_TT < 0 then Rat_TT = 0 end   local pos = Vector(0,0,0)  local text = VC.Lng("Repairing")  local prc = 0   local pname = ent.VC_RM_LastFixing.type if pname == "light" and VC.DamagedLightIsELS(ent, ent.VC_RM_LastFixing.int).isELS then pname = "light_els" end   local icon = VC.GetPartIcon(pname)   prc = (CurTime()-ent.VC_RM_LastFixing.time_s)/ent.VC_RM_LastFixing.time  local txtclr = Color(Lerp(prc, 255, 155),Lerp(prc,255, 255),Lerp(prc,255, 155), 255*Rat_TT)  prc = math.Clamp(math.Round(prc*100), 0, 100)   text = text.." "..prc.."%"   local SPos = ent:LocalToWorld(ent.VC_RM_LastFixing.pos):ToScreen() local Sx, Sy = 35,35   surface.SetFont("VC_Model_Name")  local tsize = surface.GetTextSize(text)   local tclr = table.Copy(VC.Color.Main) tclr.a = tclr.a*Rat_L  VC.DrawFadeRect(SPos.x-Sx/2, SPos.y-Sy/2-5, Sx+tsize*Rat_BT+5, Sy+9, tclr)   draw.SimpleText(text, "VC_Model_Name", SPos.x+Sx/2+5, SPos.y, txtclr, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)   local tclr = table.Copy(VC.Color.Blue) tclr.a = (200-math.sin(CurTime()*10)*55)*Rat_BT   surface.SetDrawColor(tclr)  surface.SetMaterial(icon)  surface.DrawTexturedRect(math.Round(SPos.x-Sx/2), math.Round(SPos.y-Sy/2), Sx, Sy)  end  end  end   for k,ent in pairs(ents.FindByClass("vc_npc_repair")) do  local text = VC.getName(ent, VC.RM.Default.Name)  if hook.Call("VC_RM_canRenderInfo", GAMEMODE, ent, text) != false then   if !ent.VC_PVsb then ent.VC_Color = VC.Color.Neutral ent.VC_PVsb = util.GetPixelVisibleHandle() end  local BInd = ent:LookupBone("ValveBiped.Bip01_Head1")  local pos = Vector(0,0,0) if BInd then local BonePos , BoneAng = ent:GetBonePosition(ent:LookupBone("ValveBiped.Bip01_Head1")) pos = BonePos+Vector(0,0,8) else pos=ent:GetPos()+Vector(0,0,65) end   local Vis = util.PixelVisible(pos+Vector(0,0,5), 1, ent.VC_PVsb) local Dist = nil  if Vis > 0 then Dist = VC.GetViewPos():Distance(pos) end  local on = Vis > 0 and Dist < VC.getServerSetting("RM_Text_Dist", 500)  local anim = VC.UI_AnimData("RM_"..k, on, 0.05, 0.02)   if anim and ent.VC_LastPos_X and ent.VC_LastPos_Y then  surface.SetFont("VC_Name") local tz = surface.GetTextSize(text)+20  local Sx = math.Round(ent.VC_LastPos_X-(anim-1)*50) local Sy = math.Round(ent.VC_LastPos_Y-25) local PSx, PSy = tz, 50  local clr = table.Copy(VC.Color.Main) clr.a=clr.a*anim draw.RoundedBox(0, math.Round(Sx-PSx/2)+1, Sy, PSx, PSy, clr)  surface.SetMaterial(VC.Material.Fade) surface.DrawTexturedRectRotated(math.Round(Sx+VC.FadeW/2+PSx/2+1), Sy+PSy/2, VC.FadeW, PSy, 0) surface.DrawTexturedRectRotated(math.Round(Sx-VC.FadeW/2-PSx/2+1), Sy+PSy/2, VC.FadeW, PSy, 180)  local tclr = table.Copy(VC.Color.Blue) tclr.a=tclr.a*anim draw.SimpleText(text, "VC_Name", Sx+20, Sy+25, tclr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)  surface.SetDrawColor(tclr)  surface.SetMaterial(VC.Material.icon_repair)  surface.DrawTexturedRect(Sx-PSx/2-15, Sy+3, 45, 45)  end  local pos = (ent:GetPos()+Vector(0,0,75)):ToScreen() ent.VC_LastPos_X = math.Clamp(Lerp(0.2, ent.VC_LastPos_X or pos.x, pos.x), -200, ScrW()+200) ent.VC_LastPos_Y = math.Clamp(Lerp(0.2, ent.VC_LastPos_Y or pos.y, pos.y), -200, ScrH()+200)  end  end end  function VC.RM.open_vehicle_select(npc, npctbl, npcint)  if !IsValid(npc) then return end   if VC.isPlayerRestricted(LocalPlayer(), nil, npctbl) then return end   local tbl = {}  for k,v in pairs(VC.GetVehicleList()) do if !IsValid(v) then continue end local dist = npc:GetPos():Distance(v:GetPos()) if dist <= (VC.getServerSetting("RM_Distance", 350)+50) then tbl[dist] = v end end  local cnt = table.Count(tbl)  if cnt == 0 then VCPopup("NoCloseVehicles", "cross") return end  if table.Count(tbl) > 1 then  local Pnl = vgui.Create("DFrame") Pnl:SetSize(600, 150) Pnl:SetTitle("") Pnl:SetPos(ScrW()/2-Pnl:GetWide()/2,ScrH()/2-Pnl:GetTall()/2) Pnl:ShowCloseButton(false) Pnl:SetDraggable(false)  Pnl:SizeTo(0, 150, 0) Pnl:SizeTo(600, 150, 0.2, 0.2, 1)  Pnl.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, 0, 0, Sx, Sy, VC.Color.Main) draw.RoundedBox(0, 0, 0, Sx, 25, VC.Color.Main) draw.DrawText(VC.Lng("SelectVehicle"), "VC_Dev_Text", 10, 5, VC.Color.White, TEXT_ALIGN_LEFT) end  local Close = vgui.Create("DImageButton") Close:SetMaterial(VC.Material.Cross) Close:SetSize(20,20) Close:SetPos(Pnl:GetWide()-Close:GetWide()-5,5) Close:SetParent(Pnl) Close:SetText("") Close.DoClick = function() Pnl:Close() end Pnl:AlphaTo(0, 0, 0) Pnl:AlphaTo(255, 0.2, 0.2)   local Horz = vgui.Create("DHorizontalScroller", Pnl) Horz:SetSize(Pnl:GetWide()-30, Pnl:GetTall()-35) Horz:AlignTop(30) Horz:AlignLeft(15) Horz:SetOverlap(0) Horz:NoClipping(true)  local Btn_Prev = vgui.Create("DButton", Pnl) Btn_Prev:SetText("") Btn_Prev:SetSize(15,Horz:GetTall()) Btn_Prev:AlignLeft(0) Btn_Prev:AlignBottom(0)  local Btn_Next = vgui.Create("DButton", Pnl) Btn_Next:SetText("") Btn_Next:SetSize(15,Horz:GetTall()) Btn_Next:AlignRight(0) Btn_Next:AlignBottom(0)  function HorzResetAlpha(int) Horz:AlphaTo(0, 0, 0) Horz:AlphaTo(255, int or 0.5, 0) Btn_Prev:AlphaTo(0, 0, 0) Btn_Prev:AlphaTo(255, int or 0.5, 0) Btn_Next:AlphaTo(0, 0, 0) Btn_Next:AlphaTo(255, int or 0.5, 0) end HorzResetAlpha(1)   Horz.Think = function()  if Btn_Prev:IsDown() then Horz.OffsetX = Horz.OffsetX- 2000 Horz:InvalidateLayout(true) end  if Btn_Next:IsDown() then Horz.OffsetX = Horz.OffsetX+ 2000 Horz:InvalidateLayout(true) end  end  function Horz:OnMouseWheeled(delta) Horz.OffsetX = Horz.OffsetX+ delta*-100 self:InvalidateLayout(true) return true end   function Horz:PerformLayout()  local w, h = self:GetSize() local x = 0  self.pnlCanvas:SetTall(h)  if self.Panels then  for k, v in pairs(self.Panels) do if IsValid(v) then v:SetPos(x, 0) v:SetTall(h) v:ApplySchemeSettings() x = x+ v:GetWide()- self.m_iOverlap end end  self.pnlCanvas:SetWide(x + self.m_iOverlap)  if (w < self.pnlCanvas:GetWide()) then self.OffsetX = math.Clamp(self.OffsetX, 0, self.pnlCanvas:GetWide()- self:GetWide()) else self.OffsetX = 0 end  self.pnlCanvas.x = Lerp(0.1, self.pnlCanvas.x, -self.OffsetX)  end  self.btnLeft:SetVisible(false) self.btnRight:SetVisible(false)  Btn_Prev:SetVisible(self.pnlCanvas.x < -25) Btn_Next:SetVisible(self.pnlCanvas.x + self.pnlCanvas:GetWide() > (self:GetWide()+25))  end   Btn_Next.Paint = function(obj, Sx, Sy) surface.SetDrawColor(255,255,255, obj:IsHovered() and 255 or 55) surface.SetMaterial(VC.Material.icon_right) surface.DrawTexturedRect(0, 10, Sx, Sy-20) end  Btn_Prev.Paint = function(obj, Sx, Sy) surface.SetDrawColor(255,255,255, obj:IsHovered() and 255 or 55) surface.SetMaterial(VC.Material.icon_left) surface.DrawTexturedRect(0, 10, Sx, Sy-20) end   local clr = table.Copy(VC.Color.Main)   for k,v in SortedPairs(tbl) do  local prc = v:GetNWInt("VC_HealthPerc", 1)  local txt = math.Round(math.Round(prc*100),0,100).."%"  local engclr = getHealthColor(prc)   local mdl = vgui.Create("DModelPanel", Pnl) mdl:SetModel(v:GetModel())  local mvent = mdl:GetEntity()  mdl.ModelLength = mvent:GetRenderBounds():Length()*1.5-200 mdl.RBounds = mvent:GetRenderBounds()  mvent:SetPoseParameter("vehicle_steer", -1) mvent:SetPoseParameter("vehicle_wheel_rl_height", 0.5) mvent:SetPoseParameter("vehicle_wheel_rr_height", 0.5) mvent:SetPoseParameter("vehicle_wheel_fl_height", 0.5) mvent:SetPoseParameter("vehicle_wheel_fr_height", 0.5)   mdl:SetLookAng(Vector(0, 0, 62)) mdl:SetSize(250, 150)  function mdl:LayoutEntity() mdl:SetLookAng(Angle(0, 180, 0)) mdl:SetCamPos(Vector(mdl:IsHovered() and 250 or 280, 0,60)-Angle(0, 180, 0):Forward()*mdl.ModelLength) return end  mdl.DoClick = function() Pnl:Close() VC.RM.open_menu_main_pre(v, npc, npctbl, npcint) end   VC.ApplyEntityParams(v, mdl:GetEntity())   local name = VC.getName(v, VC.Lng("Unknown"))  mdl.PaintOver = function(obj, Sx, Sy)  local tclr = table.Copy(clr)   draw.RoundedBox(0, 0, 0, Sx, 25, clr)   if !mdl:IsHovered() and !(mdl:IsHovered() or sel) then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0,0,0,200)) end  if mdl:IsDown() then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0,100,100,55)) end  draw.DrawText(name, nil, Sx/2,7, VC.Color.Base, TEXT_ALIGN_CENTER)   surface.SetFont("VC_Regular2")  draw.DrawText(txt, "VC_Regular2", Sx-2, 30, engclr, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)   local tz = surface.GetTextSize(txt)  surface.SetDrawColor(engclr.r,engclr.g,engclr.b, engclr.a) surface.SetMaterial(VC.Material.icon_engine) surface.DrawTexturedRect(Sx-tz-28, 27, 22, 22)   local pos = 0 if mdl:IsHovered() then tclr = table.Copy(VC.Color.Blue) surface.SetDrawColor(tclr) surface.DrawLine(pos, 0, pos+Sx-1, 0) surface.DrawLine(pos, Sy-1, pos+Sx-1, Sy-1) surface.DrawLine(pos, 0, pos, Sy-1) surface.DrawLine(pos+Sx-1, 0, pos+Sx-1, Sy-1) end  end  Horz:AddPanel(mdl)  end   Pnl:MakePopup()  else  for k,v in pairs(tbl) do VC.RM.open_menu_main_pre(v, npc, npctbl, npcint) end  end end  function VC.RM.open_menu_RepairMain_edit(ent)  if IsValid(VC.RM_Edit_Panel) then VC.RM_Edit_Panel:Close() VC.RM_Edit_Panel = nil end  local Pnl = vgui.Create("DFrame") VC.RM_Edit_Panel = Pnl Pnl:SetSize(600, 320) Pnl:SetTitle("") Pnl:SetPos(ScrW()/2-Pnl:GetWide()/2,ScrH()/2-Pnl:GetTall()/2) Pnl:ShowCloseButton(false) Pnl:AlphaTo(0, 0, 0) Pnl:AlphaTo(255, 0.2, 0)  VC.RM.LastTbl.Pos = ent:GetPos() VC.RM.LastTbl.Ang = ent:GetAngles() VC.RM.LastTbl.Model = ent:GetModel()  Pnl.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, VC.Color.Main)  draw.RoundedBox(0, 0, 0, Sx, 25, VC.Color.Main)  draw.DrawText('VCMod Repair Man Editor. ID - "'..ent:GetNWInt("VC_Int")..'".', "VC_Dev_Text", 7, 5, VC.Color.Blue, TEXT_ALIGN_LEFT)   draw.RoundedBox(0, 10, 30, 155, 255, VC.Color.Main)   draw.DrawText("Name:", "VC_Dev_Text", 15, 40, VC.Color.Blue, TEXT_ALIGN_LEFT)  draw.DrawText("Model:", "VC_Dev_Text", 15, 215, VC.Color.Blue, TEXT_ALIGN_LEFT)  draw.DrawText("Pos: "..math.Round(VC.RM.LastTbl.Pos.x)..", "..math.Round(VC.RM.LastTbl.Pos.y)..", "..math.Round(VC.RM.LastTbl.Pos.z), "VC_Dev_Text", 15, 235, VC.Color.Blue, TEXT_ALIGN_LEFT)  draw.DrawText("Ang: "..math.Round(VC.RM.LastTbl.Ang.p)..", "..math.Round(VC.RM.LastTbl.Ang.y)..", "..math.Round(VC.RM.LastTbl.Ang.r), "VC_Dev_Text", 15, 255, VC.Color.Blue, TEXT_ALIGN_LEFT)  end   local delete = vgui.Create("VC_Button", Pnl) delete:SetToolTip("Delete the repair man from the server and all the data files.") delete:SetText("Delete this repair man") delete:SetSize(Pnl:GetWide()-20,20) delete:SetPos(10, Pnl:GetTall()-delete:GetTall()-10) delete:SetColor(VC.Color.Btn_Rem) delete:SetTextIsWhite(true)  delete.DoClick = function() net.Start("VC_RM_Delete") net.WriteEntity(ent) net.SendToServer() Pnl:Close() VC.RM.MM_Refresh = true end   local done = vgui.Create("DImageButton", Pnl) done:SetMaterial(VC.Material.icon_check) done:SetToolTip("Close menu and save settings.") done:SetSize(20+15,20) done:SetPos(Pnl:GetWide()-done:GetWide()-2-15, 2)  done.DoClick = function() net.Start("VC_RM_DoneEditting") net.WriteEntity(ent) net.WriteTable(VC.RM.LastTbl) net.WriteInt(VC.RM.LastInt, 8) net.WriteInt(1, 8) net.SendToServer() Pnl:Close() VC.RM.MM_Refresh = true end   local cancel = vgui.Create("DImageButton", Pnl) cancel:SetMaterial(VC.Material.icon_cross) cancel:SetToolTip("Discard all settings and close.") cancel:SetSize(20,20) cancel:SetPos(Pnl:GetWide()-cancel:GetWide()-24-45, 2)  cancel.DoClick = function() Pnl:Close() VC.RM.MM_Refresh = true end   local find = vgui.Create("DImageButton", Pnl) find:SetMaterial(VC.Material.icon_paste) find:SetToolTip("Import from other Repair men.") find:SetSize(20,20) find:SetPos(Pnl:GetWide()-65-60, 2)  find.DoClick = function()  local DDM = VC.DermaMenu("Import")  local ISM = nil  DDM:AddButton("Import from other maps (everything)", function() net.Start("VC_RM_RequestInfo_Import_NPC_OtherInfo") net.WriteEntity(ent) net.SendToServer() end):SetImage("icon16/key.png")  for k,v in pairs(ents.FindByClass("vc_npc_repair")) do  if v:GetNWInt("VC_Int", 0) != VC.RM.LastInt then  DDM:AddButton(VC.getName(v, VC.RM.Default.Name), function() if IsValid(v) then net.Start("VC_RM_RequestInfo_Import_NPC") net.WriteEntity(v) net.SendToServer() end end)  end  end  if DDM then DDM:Open() end  end   local el_mdl = vgui.Create("DModelPanel", Pnl) el_mdl:SetModel(VC.RM.LastTbl.Model) el_mdl:SetCamPos(Vector(20,0,62)) el_mdl:SetLookAt(Vector(0, 0, 62)) el_mdl:SetSize(150, 150) el_mdl:SetPos(10, 50) function el_mdl:LayoutEntity() el_mdl:SetLookAt(Vector(0, math.sin(CurTime()*2), 62)) return end  local el_name = vgui.Create("DTextEntry", Pnl) el_name:SetTall(20) el_name:SetWide(100) el_name:SetToolTip("Repair man's name.") el_name:SetValue(VC.RM.LastTbl.Name) el_name:SetPos(60, 35) el_name.OnTextChanged = function() local val = el_name:GetValue() VC.RM.LastTbl.Name = val end  local el_mdlname = vgui.Create("DTextEntry", Pnl) el_mdlname:SetTall(20) el_mdlname:SetWide(100) el_mdlname:SetToolTip("Repair man's model. Enter it manually here or click on the image.") el_mdlname:SetValue(VC.RM.LastTbl.Model) el_mdlname:SetPos(60, 210) el_mdlname.OnTextChanged = function() local val = el_mdlname:GetValue() VC.RM.LastTbl.Model = val el_mdl:SetModel(val) end   local function SetModel(mdl)  el_mdlname:SetValue(mdl) el_mdl:GetEntity():SetModel(mdl) el_mdlname.OnTextChanged()  local iSeq = el_mdl:GetEntity():LookupSequence("walk_all")  if iSeq <= 0 then iSeq = el_mdl:GetEntity():LookupSequence("WalkUnarmed_all") end  if iSeq <= 0 then iSeq = el_mdl:GetEntity():LookupSequence("walk_all_moderate") end  if iSeq > 0 then el_mdl:GetEntity():ResetSequence(iSeq) end  end   el_mdl.DoClick = function()  local DDM = VC.DermaMenu("Model")  DDM:AddButton("Mossman", function() SetModel("models/mossman.mdl") end)  DDM:AddButton("Barney", function() SetModel("models/Barney.mdl") end)  DDM:AddButton("Breen", function() SetModel("models/breen.mdl") end)  DDM:AddButton("Eli", function() SetModel("models/Eli.mdl") end)  DDM:AddButton("GMan", function() SetModel("models/gman_high.mdl") end)  DDM:AddButton("Kleiner", function() SetModel("models/Kleiner.mdl") end)  DDM:AddButton("Father Grigory", function() SetModel("models/monk.mdl") end)  DDM:AddButton("Vortigaunt", function() SetModel("models/vortigaunt.mdl") end)  DDM:AddButton("Police", function() SetModel("models/Police.mdl") end)  DDM:AddButton("Zombie", function() SetModel("models/Zombie/Classic.mdl") end)  DDM:Open()  end   local El_List1 = VC.Add_El_List(175+(Pnl:GetWide()-175)/2,35,(Pnl:GetWide()-175)/2-10,Pnl:GetTall()-75) El_List1:SetParent(Pnl) El_List1:NoClipping(true) El_List1.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, -5, -5, Sx+10, Sy+10, VC.Color.Main) end  local ResE2L = {}  if !VC.RM.LastTbl.RankRestrict then VC.RM.LastTbl.RankRestrict = {} end     for k,v in pairs(VC.getRanks()) do  local el = VC.Add_El_Checkbox(v, "This rank is allowed to use this repair man.")  El_List1:AddItem(el)  el.OnChange = function(idx, val) VC.RM.LastTbl.RankRestrict[k] = !val end  ResE2L[k] = el  end   local El_List1 = VC.Add_El_List(175,35,(Pnl:GetWide()-175)/2-15,Pnl:GetTall()-75) El_List1:SetParent(Pnl) El_List1:NoClipping(true) El_List1.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, -5, -5, Sx+10, Sy+10, VC.Color.Main) end  local ResElL = {} if RPExtraTeams then  if !VC.RM.LastTbl.JobRestrict then VC.RM.LastTbl.JobRestrict = {} end  for k,v in pairs(RPExtraTeams) do local nm = v.name or VC.Lng("Unknown") ResElL[nm] = VC.Add_El_Checkbox(nm, "This job is allowed to use this repair man.") El_List1:AddItem(ResElL[nm]) ResElL[nm].OnChange = function(idx, val) VC.RM.LastTbl.JobRestrict[nm] = !val end end  end   local function RefreshInfo()  local tmdl = VC.RM.LastTbl.Model el_mdlname:SetValue(tmdl) SetModel(tmdl) el_mdlname.OnTextChanged()  el_name:SetValue(VC.RM.LastTbl.Name)   if !VC.RM.LastTbl.RankRestrict then VC.RM.LastTbl.RankRestrict = {} end  for k,v in pairs(VC.getRanks()) do if ResE2L[k] then ResE2L[k]:SetValue(!VC.RM.LastTbl.RankRestrict[k]) end end   if RPExtraTeams then  if !VC.RM.LastTbl.JobRestrict then VC.RM.LastTbl.JobRestrict = {} end  for k,v in pairs(RPExtraTeams) do local nm = v.name or VC.Lng("Unknown") if ResElL[nm] then ResElL[nm]:SetValue(!VC.RM.LastTbl.JobRestrict[nm]) end end  end  end   RefreshInfo()   Pnl.Think = function()  if VC.RM.Import_NPC_Tbl then local temptbl = table.Copy(VC.RM.Import_NPC_Tbl[2]) if !VC.RM.LastTbl then VC.RM.LastTbl = {} end VC.RM.LastTbl = temptbl RefreshInfo() VC.RM.Import_NPC_Tbl = nil end  end  Pnl:MakePopup() end  function VC.RM.open_menu_choice(npc, npctbl, npcint)  local Pnl = vgui.Create("DFrame") Pnl:SetSize(600, 150) Pnl:SetTitle("") Pnl:SetPos(ScrW()/2-Pnl:GetWide()/2,ScrH()/2-Pnl:GetTall()/2) Pnl:ShowCloseButton(false) Pnl:SetDraggable(false)  Pnl:SizeTo(600, 0, 0) Pnl:SizeTo(600, 150, 0.1, 0, 1)  Pnl.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, 0, 0, Sx, Sy, VC.Color.Main) draw.DrawText("This menu is only visible to administrators.", "VC_Dev_Text", 10, 10, VC.Color.White, TEXT_ALIGN_LEFT) end   local Main = vgui.Create("VC_Button", Pnl) Main:SetColor(VC.Color.Btn_Add) Main:SetText("Repair man's menu") Main:SetFont("VC_Big_Italic") Main:SetSize(Pnl:GetWide()/2-30,Pnl:GetTall()-55) Main:SetPos(20, 35)  local Main_Edit = vgui.Create("VC_Button", Pnl) Main_Edit:SetColor(VC.Color.Btn_Chng) Main_Edit:SetText("Edit menu") Main_Edit:SetFont("VC_Big_Italic") Main_Edit:SetSize(Pnl:GetWide()/2-30,Pnl:GetTall()-55) Main_Edit:SetPos(Pnl:GetWide()/2+10, 35)   Main.DoClick = function() VC.RM.open_vehicle_select(npc, npctbl, npcint) Pnl:Close() end  Main_Edit.DoClick = function() VC.RM.LastTbl = npctbl or table.Copy(VC.RM.Default) VC.RM.LastInt = npcint if IsValid(npc) then VC.RM.LastNPC = npc VC.RM.open_menu_RepairMain_edit(npc, npctbl, npcint) end Pnl:Close() end  Pnl:MakePopup() end  net.Receive("VC_RM_Send_Menu_Open", function(len) local npc, npctbl, npcint, admin = net.ReadEntity(), net.ReadTable(), net.ReadInt(8), net.ReadInt(4) if IsValid(npc) then if admin and admin == 1 then VC.RM.open_menu_choice(npc, npctbl, npcint) else VC.RM.open_vehicle_select(npc, npctbl, npcint) end end end) local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH mlogs/language/cl_language.lua:
  local selectedLanguage = GetConVar("gmod_language"):GetString() timer.Simple(4, function() 	if not IsValid(LocalPlayer()) then return end 	if(mLogs.languages[selectedLanguage]) then return end 	net.Start("mLogs_language") 		net.WriteString(selectedLanguage) 	net.SendToServer() end)  net.Receive("mLogs_language", function() 	local lang = net.ReadString() 	local langString = net.ReadString() 	if not (lang and langString) then return end 	local langTable = mLogs.decompress(langString) 	if not langTable then return end 	 	mLogs.addLanguage(lang,langTable.lang,langTable.log) end) 
--PATH mlogs/core/sh_core.lua:
   function mLogs.compress(tab) 	return util.Base64Encode(util.Compress(util.TableToJSON(tab))) end  local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' local function dec(data)     data = string.gsub(data, '[^'..b..'=]', '')     return (data:gsub('.', function(x)         if (x == '=') then return '' end         local r,f='',(b:find(x)-1)         for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end         return r;     end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)         if (#x ~= 8) then return '' end         local c=0         for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end         return string.char(c)     end)) end  function mLogs.decompress(str) 	return util.JSONToTable(util.Decompress(dec(str))) end  function mLogs.upper(str)     return (string.gsub(str,"^%l", string.upper)) end 
--PATH mlogs/logger/loggers/logs/__category.lua:
   mLogs.addCategory(     mLogs.getLang("logs"),     "logs",      Color(255,100,0),     nil,     nil,     1000 ) 
--PATH mlogs/settings/types/sh_logger.lua:
     mLogs.settings.addType("logger",function(d)     return true end,{ 	sqlSet = function(data) return util.TableToJSON(data) end, 	sqlGet = function(data) return util.JSONToTable(data) end }) 
--PATH mlogs/elements/logs/cl_logsoptions.lua:
   local PANEL = {}  function PANEL:Init() 	 	self.pageData = {page=1,totalPages=1,query=""} 	 	self.navButtons = self:Add("mLogs_navButtons") 	self.navButtons.OnForward = function() 		self:UpdateLogSelection(true) 	end 	self.navButtons.OnBack = function() 		self:UpdateLogSelection(false) 	end 	 	self.advSearch = self:Add("mLogs_button") 	self.advSearch:SetOutline(true) 	self.advSearch:SetFont("mLogs_logButtons") 	self.advSearch:SetText("+") 	self.advSearch:SetTooltip(mLogs.getLang("advanced_search")) 	self.advSearch.DoClick = function() 		if(ValidPanel(mLogs.advancedSearch)) then mLogs.advancedSearch:MoveToFront() return end 		mLogs.advancedSearch = vgui.Create("mLogs_advancedSearch") 		mLogs.advancedSearch:SetSize(ScrW()*0.4,ScrH()*0.45) 		mLogs.advancedSearch:Center() 		mLogs.advancedSearch:MakePopup() 		mLogs.advancedSearch.OnPage = function(c_tag,h_tag,req) 			if(self.OnPageOverride)then 				self.OnPageOverride(c_tag,h_tag,req) 			end 		end 	end 	 	  	  	  	  	 	self.iSearch = self:Add("mLogs_stringEntry") 	self.iSearch:SetFont("mLogs_clearText") 	self.iSearch:SetPlaceholder(mLogs.getLang("quick_search")) 	self.iSearch.lastString = "" 	self.iSearch.lastTime = CurTime() 	self.iSearch.Think = function(s) 		local str = s:GetText() or "" 		if(str != s.lastString)then 			s.lastString = str 			s.lastTime = CurTime() 			s.lastSearch = nil 		end 		if(str != "" and s.lastSearch != str and str != self.pageData.query and (CurTime() - s.lastTime) > 1.5)then 			self:UpdateLogSelection(nil,nil,str) 			s.lastSearch = str 		end 	end 	 	self.jump = self:Add("mLogs_button") 	self.jump:SetOutline(true) 	self.jump:SetFont("mLogs_logButtons") 	self.jump:SetText(mLogs.getLang("jump")) 	self.jump.DoClick = function() 		mLogs.stringRequest(  			mLogs.getLang("jump_to_page"), 			mLogs.getLang("jump_to_page_desc"),  			nil,  			function(txt) 				if(not tonumber(txt)) then return end 				self:UpdateLogSelection(nil,tonumber(txt)) 			end, function()end,  			mLogs.getLang("jump"), nil, true  		) 	end 	 end  function PANEL:OnRemove() 	if(ValidPanel(mLogs.advancedSearch))then 		mLogs.advancedSearch:Remove() 	end end  function PANEL:UpdateLogSelection(forwardOrBack,forcePage,query,fq) 	if not self.OnPage then return end 	if(fq)then self.OnPage(fq) return end 	local req = {query=query or "",page=1} 	local newPage = 1 	if(forcePage)then 		newPage = forcePage 	else 		local page = self.pageData.page or 1 		newPage = (forwardOrBack == nil and page) or (page + ((forwardOrBack and 1 ) or -1)) 	end 	req.page = math.Clamp(newPage,1,(self.pageData.totalPages or 1)) 	 	if(self.advQuery)then 		local page = req.page 		req = self.advQuery 		req.page = page 	elseif(self.iSearch:GetText())then 		req.query = self.iSearch:GetText() 		req.type = "quick" 	end 	 	if(self:CheckSame(req))then return end 	 	self.OnPage(req) end  function PANEL:CheckSame(req) 	return (req.type and req.type == "advanced" or req.query == (self.pageData.query or "")) and req.page == (self.pageData.page or 1) end  function PANEL:SetPageData(pageData,queryDetails) 	self.pageData = pageData 	local q = pageData.query or "" 	if(self.iSearch:GetText() != q)then 		self.iSearch:SetText(q) 	end 	if(queryDetails)then 		self.advQuery = queryDetails 	else 		self.advQuery = nil 	end end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.panel) 	draw.SimpleText(mLogs.getLang("page_x_x",self.pageData.page,self.pageData.totalPages), "mLogs_small", w*0.1 + w*0.02, h*0.5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) end function PANEL:PerformLayout(w,h) 	 	local currentW = 12 	 	self.navButtons:SetSize(w*0.1,h*0.6) 	self.navButtons:SetPos(currentW,h*0.5 - self.navButtons:GetTall()*0.5) 	currentW = currentW + w*0.1 	 	local icurrentW = w - 12 	 	self.advSearch:SetSize(w*0.03,h*0.6) 	icurrentW = icurrentW - self.advSearch:GetWide() 	self.advSearch:SetPos(icurrentW,h*0.5 - self.navButtons:GetTall()*0.5) 	 	  	  	  	 	self.iSearch:SetSize(w*0.35,h*0.6) 	icurrentW = icurrentW - self.iSearch:GetWide() + 1 	self.iSearch:SetPos(icurrentW,h*0.5 - self.navButtons:GetTall()*0.5) 	 	self.jump:SetSize(w*0.1,h*0.6) 	icurrentW = icurrentW - self.jump:GetWide() + 1 	self.jump:SetPos(icurrentW,h*0.5 - self.navButtons:GetTall()*0.5) 	 	 end  vgui.Register( "mLogs_logsOptions", PANEL, "DPanel" ) 
--PATH mlogs/elements/settings/types/cl_spacer.lua:
   local PANEL = {}  DEFINE_BASECLASS("mLogs_settingsBase")  function PANEL:Init()     self:RemoveReset() end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.panel) 	if(not self.option) then return end 	draw.SimpleText(self.option.title,"mLogs_settingTitle", w*0.5, h*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) end  function PANEL:PerformLayout(w,h)     BaseClass.PerformLayout(self,w,h) end  vgui.Register( "mLogs_settingsOption_spacer", PANEL, "mLogs_settingsBase" ) 
--PATH mlogs/elements/ui/cl_stringrequest.lua:
   function mLogs.query( strTitle, strText,  ... )  	local Window = vgui.Create( "DFrame" ) 	Window:SetTitle( strTitle or "Message Title (First Parameter)" ) 	Window:SetDraggable( false ) 	Window:ShowCloseButton( false ) 	Window:SetBackgroundBlur( true ) 	Window:SetDrawOnTop( true ) 	Window.Paint = function(self,w,h) 		Derma_DrawBackgroundBlur( self, self.startTime ) 		draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.border) 		draw.RoundedBox(0,1,1,w-2,h-2,mLogs.config.colors.bg) 	end   	local InnerPanel = vgui.Create( "DPanel", Window ) 	InnerPanel:SetPaintBackground( false )  	local Text = vgui.Create( "DLabel", InnerPanel ) 	Text:SetText( strText or "Message Text (Second Parameter)" ) 	Text:SizeToContents() 	Text:SetContentAlignment( 5 ) 	Text:SetTextColor( color_white )  	local ButtonPanel = vgui.Create( "DPanel", Window ) 	ButtonPanel:SetTall( 30 ) 	ButtonPanel:SetPaintBackground( false )  	  	local NumOptions = 0 	local x = 5  	for k=1, 8, 2 do  		local Text = select( k, ... ) 		if Text == nil then break end  		local Func = select( k+1, ... ) or function() end  		local Button = vgui.Create( "mLogs_button", ButtonPanel ) 		Button:SetOutline(true) 		Button:SetText( Text ) 		Button:SizeToContents() 		Button:SetTall( 20 ) 		Button:SetWide( Button:GetWide() + 20 ) 		Button.DoClick = function() Window:Close() Func() end 		Button:SetPos( x, 5 ) 		Button:SetFont("mLogs_modal")   		x = x + Button:GetWide() + 5  		ButtonPanel:SetWide( x ) 		NumOptions = NumOptions + 1  	end  	local w, h = Text:GetSize()  	w = math.max( w, ButtonPanel:GetWide() )  	Window:SetSize( w + 50, h + 25 + 45 + 10 ) 	Window:Center()  	InnerPanel:StretchToParent( 5, 25, 5, 45 )  	Text:StretchToParent( 5, 5, 5, 5 )  	ButtonPanel:CenterHorizontal() 	ButtonPanel:AlignBottom( 8 )  	Window:MakePopup() 	Window:DoModal()  	if ( NumOptions == 0 ) then  		Window:Close() 		Error( "Derma_Query: Created Query with no Options!?" ) 		return nil  	end  	return Window end  function mLogs.alert( strTitle, strText ) 	return mLogs.query( strTitle, strText, "Ok") end  function mLogs.stringRequest( strTitle, strText, strDefaultText, fnEnter, fnCancel, strButtonText, strButtonCancelText, intOnly ) 	local Window = vgui.Create( "DFrame" ) 	Window:SetTitle( strTitle or "Message Title (First Parameter)" ) 	Window:SetDraggable( false ) 	Window:ShowCloseButton( false ) 	Window:SetBackgroundBlur( true ) 	Window:SetDrawOnTop( true ) 	Window.startTime = CurTime() 	Window.Paint = function(self,w,h) 		Derma_DrawBackgroundBlur( self, self.startTime ) 		draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.border) 		draw.RoundedBox(0,1,1,w-2,h-2,mLogs.config.colors.bg) 	end  	local InnerPanel = vgui.Create( "DPanel", Window ) 	InnerPanel:SetPaintBackground( false )  	local Text = vgui.Create( "DLabel", InnerPanel ) 	Text:SetText( strText or "Message Text (Second Parameter)" ) 	Text:SizeToContents() 	Text:SetContentAlignment( 5 ) 	Text:SetTextColor( color_white )  	local TextEntry = vgui.Create( (intOnly and "mLogs_numberEntry") or "DTextEntry", InnerPanel ) 	TextEntry:SetText( strDefaultText or "" ) 	TextEntry.OnEnter = function() Window:Close() fnEnter( TextEntry:GetValue() ) end 	TextEntry:SetFont("mLogs_modal")  	local ButtonPanel = vgui.Create( "DPanel", Window ) 	ButtonPanel:SetTall( 30 ) 	ButtonPanel:SetPaintBackground( false )  	local Button = vgui.Create( "mLogs_button", ButtonPanel ) 	Button:SetOutline(true) 	Button:SetText( strButtonText or "OK" ) 	Button:SizeToContents() 	Button:SetTall( 20 ) 	Button:SetWide( Button:GetWide() + 20 ) 	Button:SetPos( 5, 5 ) 	Button.DoClick = function() Window:Close() fnEnter( TextEntry:GetValue() ) end 	Button:SetFont("mLogs_modal")  	local ButtonCancel = vgui.Create( "mLogs_button", ButtonPanel ) 	ButtonCancel:SetOutline(true) 	ButtonCancel:SetText( strButtonCancelText or "Cancel" ) 	ButtonCancel:SizeToContents() 	ButtonCancel:SetTall( 20 ) 	ButtonCancel:SetWide( Button:GetWide() + 20 ) 	ButtonCancel:SetPos( 5, 5 ) 	ButtonCancel.DoClick = function() Window:Close() if ( fnCancel ) then fnCancel( TextEntry:GetValue() ) end end 	ButtonCancel:MoveRightOf( Button, 5 ) 	ButtonCancel:SetFont("mLogs_modal")  	ButtonPanel:SetWide( Button:GetWide() + 5 + ButtonCancel:GetWide() + 10 )  	local w, h = Text:GetSize() 	w = math.max( w, 400 )  	Window:SetSize( w + 50, h + 25 + 75 + 10 ) 	Window:Center()  	InnerPanel:StretchToParent( 5, 25, 5, 45 )  	Text:StretchToParent( 5, 5, 5, 35 )  	TextEntry:StretchToParent( 5, nil, 5, nil ) 	TextEntry:AlignBottom( 5 )  	TextEntry:RequestFocus() 	TextEntry:SelectAllText( true )  	ButtonPanel:CenterHorizontal() 	ButtonPanel:AlignBottom( 8 )  	Window:MakePopup() 	Window:DoModal()  	return Window  end 
--PATH mlogs/elements/ui/cl_scrollpanel.lua:
   DEFINE_BASECLASS("DScrollPanel")  local PANEL = {}  function PANEL:Init() 	local color = mLogs.config.colors.scrollGrip 	self.VBar:SetHideButtons(true) 	self.VBar:SetWide(5) 	self.VBar.Paint = function() end 	self.alpha = color.a 	self.oldY = 0 	self.lastChange = CurTime() 	 	self.VBar.btnGrip.Paint = function(s,w,h) 		if(s.y != self.oldY) then 			self.lastChange = CurTime() 			self.alpha = color.a 		end 		local time = CurTime() - (self.lastChange+4) 		if(self.alpha > 0 and (CurTime() - self.lastChange) > 3 and time < 0) then 			self.alpha = Lerp(math.abs(time),0,color.a) 		end 		self.oldY = s.y 		draw.RoundedBox(0,0,0,w,h,Color(color.r,color.b,color.g,self.alpha))  	end end  function PANEL:PerformLayout(w,h) 	BaseClass.PerformLayout(self,w,h) end vgui.Register( "mLogs_scrollPanel", PANEL, "DScrollPanel" ) 
--PATH mlogs/elements/ui/cl_listview_column.lua:
   DEFINE_BASECLASS("DListView_Column")  local PANEL = {}  AccessorFunc(PANEL, "m_sFont", "Font") function PANEL:Init() 	if(self.Header)then 		self.Header:Remove() 		self.Header = nil 	end 	self.Header = self:Add("mLogs_button") 	self.Header.DoClick = function() self:DoClick() end 	self.Header.DoRightClick = function() self:DoRightClick() end 	  	self.Header:SetFont("mLogs_smaller") 	self.Header.Paint = function() end 	 	self.DraggerBar = vgui.Create( "DListView_DraggerBar", self )  	self:SetMinWidth( 10 ) 	self:SetMaxWidth( 1920 * 10 ) end  function PANEL:SetFont(font) 	self.Header:SetFont(font) end  function PANEL:Paint(w,h) 	  end vgui.Register( "mLogs_listView_column", PANEL, "DListView_Column" )  local PANEL = {}  AccessorFunc(PANEL, "m_sText", "Text") AccessorFunc(PANEL, "m_sFont", "Font")  function PANEL:Init() 	self:SetText("") 	self:SetFont("mLogs_smaller") end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.head) 	draw.SimpleText(self:GetText(), self:GetFont(), w*0.5, h*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) 	surface.SetDrawColor(mLogs.config.colors.uiBorder) 	surface.DrawOutlinedRect(0,0,w,h) end  vgui.Register( "mLogs_listView_label", PANEL, "DPanel" )  local PANEL = {}  function PANEL:Init() 	  	self.Header = self:Add("mLogs_listView_label") 	 	self.DraggerBar = vgui.Create( "DListView_DraggerBar", self )  	self:SetMinWidth( 10 ) 	self:SetMaxWidth( 1920 * 10 )  end  function PANEL:Paint(w,h) 	  end vgui.Register( "mLogs_listView_columnPlain", PANEL, "mLogs_listView_column" ) 