--Stealed clientside server code by exechack.cc
--Hostname: ⋙ GAMBITRP ╽ ПОДАРКИ ╽ FREE VIP ⋘ - Part 10/10 - 06/04/2025


--PATH addons/accessory/lua/accessory_addons.lua:
-- In this file you can decide what accessory add-on to use on your server.
-- Remember that the more add-ons enabled, the more files your players will have to download to join.
-- If you are enabling an add-on that isn't supported by default by this script, you'll have to create the accessory items!
-- (See help file)

/*
	You can check out a list of recommended add-ons to use with this script here:
	http://pastebin.com/AKcpgFmq

	You can of course add other add-ons here if you're planning to create accessories with custom content yourself.
*/

SH_ACC.Addons = {
	["572310302"] = true,
	["3211437970"] = true
}



/*local atleast = false

for id, enable in pairs (SH_ACC.Addons) do
	if (!enable) then
		continue end

	atleast = true

	if (SERVER) then
		KostilWork(id)
	end
end

if (!atleast) then
	MsgC(Color(52, 152, 219), "SH Accessories", Color(219, 52, 52), ": No accessory add-ons were enabled at all! Check the accessory_addons.lua file to enable an add-on to use!\n")
	MsgC(Color(219, 52, 52), "While no add-on is enabled, the Accessory Vendor will show up empty.\n")

	if (CLIENT) then
		chat.AddText(Color(52, 152, 219), "SH Accessories", Color(219, 52, 52), ": No accessory add-ons were enabled at all! Check the accessory_addons.lua file to enable an add-on to use!")
		chat.AddText(Color(219, 52, 52), "While no add-on is enabled, the Accessory Vendor will show up empty.")
	end
end
*/
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
--PATH addons/vehicles_go_kart_vehicle_2228601321/lua/autorun/electric_gokart.lua:
list.Set("Vehicles", "electric_gokart", {
	Name =	"Go-Kart",
	Class = "prop_vehicle_jeep",
	Category = "Go Kart",

	icon = "vgui/freeman/icon_gokart",
	Author = "The One Free-Man",
	Information = "LOWEST COMMON DENOMINATOR KART RACING GAME",
	Model =	"models/freeman/vehicles/electric_go-kart.mdl",

	KeyValues = {				
		vehiclescript =	"scripts/vehicles/freeman/go_kart.txt"
	}
})
--PATH addons/vehicles_go_kart_vehicle_2228601321/lua/autorun/electric_gokart_jr.lua:
list.Set("Vehicles", "electric_gokart_weenie", {
	Name =	"Go-Kart JR",
	Class = "prop_vehicle_jeep",
	Category = "Go Kart",
	icon = "vgui/freeman/icon_gokart_jr",

	Author = "The One Free-Man",
	Information = "WEENIE HUT JUNIOR ALWAYS LOOKED LIKE THE SUPERIOR WEENIE HUT, CHANGE MY MIND COWARD YOU WON'T",
	Model =	"models/freeman/vehicles/electric_go-kart.mdl",

	KeyValues = {				
		vehiclescript =	"scripts/vehicles/freeman/go_kart_jr.txt"
	}
})
--PATH addons/epoe/lua/epoe/client_gui.lua:

local e=epoe -- we cant be in epoe table or we'd need to add locals here on everything too
local TagHuman=e.TagHuman

-- For reloading
if e.GUI and e.GUI:IsValid() then e.GUI:Remove() end

local gradient = surface.GetTextureID( "VGUI/gradient_up" )

local epoe_font = CreateClientConVar("epoe_font", "BudgetLabel", true, false)
local epoe_draw_background = CreateClientConVar("epoe_draw_background", 			"1", true, false)
local epoe_show_in_screenshots = CreateClientConVar("epoe_show_in_screenshots", "0", true, false)
local epoe_keep_active = CreateClientConVar("epoe_keep_active", "0", true, false)
local epoe_max_alpha = CreateClientConVar("epoe_max_alpha", "255", true, false)
local epoe_always_clickable = CreateClientConVar("epoe_always_clickable", "0", true, false)
local epoe_links_mode = CreateClientConVar("epoe_links_mode", "1", true, false)
local epoe_parse_steamids = CreateClientConVar("epoe_parse_steamids", "1", true, false)

-- Cannot be 1 by default or normal players would be exposed to EPOE
local epoe_context_menu = CreateClientConVar("epoe_context_menu", "0", true, false)

--- HELPER ---
local function CheckFor(tbl,a,b)
	local a_len=#a
	local res,endpos=true,1
	while res and endpos < a_len do
		res,endpos=a:find(b,endpos)
		if res then
			tbl[#tbl+1]={res,endpos}
		end
	end
end

local function make_url(url)

	if epoe_parse_steamids:GetBool() then
		if url:find"^76561[0123]%d%d%d%d+$" then
			return 'http://steamcommunity.com/profiles/'..url
		end

		if url:find"^STEAM_0%:[01]:%d+$" then
			local sid = util.SteamIDTo64(url)
			if sid then return 'http://steamcommunity.com/profiles/'..sid end
		end
	end

end

local function SORT1(a, b)
	return a[1] < b[1]
end
local function AppendTextLink(a, callback)

	local result = { }

	local checkpatterns = {
		"https?://[^%s%\"]+",
		"ftp://[^%s%\"]+",
		"steam://[^%s%\"]+"
	}

	if epoe_parse_steamids:GetBool() then
		table.insert(checkpatterns, "76561[0123]%d%d%d%d+")
		table.insert(checkpatterns, "STEAM_0%:[01]:%d+")
	end

	hook.Run("EPOEAddLinkPatterns", checkpatterns)

	for _, patt in pairs(checkpatterns) do
		CheckFor(result, a, patt)
	end

	if #result == 0 then
		return false
	end

	table.sort(result, SORT1)
	local _l, _r
	for k, tbl in next,result do
		local l, r = tbl[1], tbl[2]
		if not _l then
			_l, _r = tbl[1], tbl[2]
			continue
		end

		if l < _r then
			table.remove(result, k)
		end

		_l, _r = tbl[1], tbl[2]
	end

	local function TEX(str)
		callback(false, str)
	end

	local function LNK(str)
		callback(true, str, make_url(str))
	end

	local offset = 1
	local right
	for _, tbl in pairs(result) do
		local l, r = tbl[1], tbl[2]
		local link = a:sub(l, r)
		local left = a:sub(offset, l - 1)
		right = a:sub(r + 1, -1)
		offset = r + 1
		TEX(left)
		LNK(link)
	end

	TEX(right)
	return true
end



--------------






local PANEL={}
function PANEL:Init()

	-- Activity fade
	self.LastActivity = RealTime()

	self:SetFocusTopLevel( true )
	self:SetCursor( "sizeall" )

	self:SetPaintBackgroundEnabled( false )
	self:SetPaintBorderEnabled( false )

	self:DockPadding( 3, 6, 3, 3 )

	local Cfg=vgui.Create( "DHorizontalScroller", self )

		Cfg:DockMargin(-8,0,-8,4)
		Cfg:SetOverlap( -4 )
		Cfg:SetTall(16)
		Cfg:Dock( TOP )

		function Cfg:Paint()
			surface.SetDrawColor(40 ,40 ,40,196)
			surface.SetTexture( gradient )
			surface.DrawTexturedRect(0,0,self:GetWide(),self:GetTall())

			surface.SetDrawColor(40 ,40 ,40,196)
			surface.DrawRect(0,0,self:GetWide(),self:GetTall())
			return true
		end

		Cfg.OnMousePressed=function(_,...) self.OnMousePressed(self,...) end
		Cfg.OnMouseReleased=function(_,...) self.OnMouseReleased(self,...) end

		local Button = vgui.Create( "DButton" , self )
			Button:SetText( "Login" )
			function Button:DoClick()
				epoe.AddSub()
			end
			Button:SizeToContents() Button:SetDrawBorder(false)  Button:SetTall( 16 ) Button:SetWide( Button:GetWide(  ) + 6 ) -- gah
		Cfg:AddPanel( Button )
		local Button = vgui.Create( "DButton" , self )
			Button:SetText( "Logout" )
			function Button:DoClick()
				epoe.DelSub()
			end
			Button:SizeToContents() Button:SetDrawBorder(false)  Button:SetTall( 16 ) Button:SetWide( Button:GetWide(  ) + 6 ) -- gah
		Cfg:AddPanel( Button )
		local Button = vgui.Create( "DButton" , self )
			Button:SetText( "Clear" )
			function Button:DoClick()
				e.ClearLog()
			end
			Button:SizeToContents() Button:SetDrawBorder(false)  Button:SetTall( 16 ) Button:SetWide( Button:GetWide(  ) + 6 ) -- gah
		Cfg:AddPanel( Button )


		local function CheckBox(txt,cvar)
			local checkbox = vgui.Create( "DCheckBoxLabel" , self )
				checkbox:SetText( txt )
				checkbox:SetConVar( cvar )
				checkbox:SizeToContents()

				checkbox:SetMouseInputEnabled( true )
				checkbox:SetKeyboardInputEnabled( true )
				function checkbox.OnMouseReleased( _, mousecode )
					self.pressing= false
					return checkbox.Button:Toggle()
				end
				function checkbox.OnMousePressed( checkbox, mousecode )
					self.pressing= true
				--	return checkbox.Button.OnMousePressed( checkbox.Button, mousecode )
				end
				checkbox.Button.OnMouseReleased=checkbox.OnMouseReleased
				checkbox.Label.OnMouseReleased=checkbox.OnMouseReleased
				checkbox.Button.OnMousePressed=checkbox.OnMousePressed
				checkbox.Label.OnMousePressed=checkbox.OnMousePressed

				checkbox.m_iIndent=-16
				checkbox.Button:SetAlpha(0)
				checkbox:SetWide(checkbox:GetWide() -8 )
				checkbox.Paint=function(checkbox,w,h)
					if checkbox.Label:IsHovered() or checkbox:IsHovered() or checkbox.Button:IsHovered() then
						surface.SetDrawColor(255,255,255,self.pressing and 150 or 55)
						surface.DrawRect(0,h-2,w,2)
					end
					if checkbox:GetChecked() then
						surface.SetDrawColor(109+9,207+9,246+9,100)
						surface.DrawRect(0,h-2,w,2)
					end
				end

				checkbox:SetTall( 16 )
			Cfg:AddPanel( checkbox )
		end
		CheckBox("autologin","epoe_autologin")
		CheckBox("time","epoe_timestamps")
		CheckBox("to console","epoe_toconsole")
		CheckBox("show on activity","epoe_show_on_activity")
		CheckBox("no autoscroll","epoe_disable_autoscroll")
		CheckBox("Stay visible","epoe_keep_active")
		CheckBox("Hoverable anywhere","epoe_always_clickable")
		CheckBox("Draw BG","epoe_draw_background")
		CheckBox("screenshots","epoe_show_in_screenshots")
		CheckBox("In Ctx Menu","epoe_context_menu")

		local FontChooser = vgui.Create("DComboBox", Cfg )
		local function AddFont(txt,name)
			local ok=pcall(function() surface.SetFont(name) end)
			if ok then
				FontChooser:AddChoice(txt,name)
			end
		end

		AddFont("Fixed","BudgetLabel")
		AddFont("Fixed Shadow","DefaultFixedDropShadow")
		AddFont("Fixed Tiny","DebugFixed")

		AddFont("Even smaller","DebugFixedSmall")

		AddFont("Smallest","HudHintTextSmall")
		-- AddFont("Smaller","ConsoleText")
		AddFont("Small","DefaultSmall")
		AddFont("Chat","ChatFont")

		AddFont("Big","Default")
		AddFont("Bigger","HDRDemoText")

		AddFont("Huge","DermaLarge")
		AddFont("Huger","DermaLarge")

		-- AddFont("TEST","BUTOFCOURSE")

		function FontChooser.Think(FontChooser)
			FontChooser:ConVarStringThink()
		end

		function FontChooser.PerformLayout(FontChooser,w,h)
			DComboBox.PerformLayout(FontChooser,w,h)

			FontChooser:SizeToContents()
			FontChooser:SetTall(16)
			FontChooser:SetWide(FontChooser:GetWide()+32)

			Cfg:InvalidateLayout()
		end

		-- we're overriding big time
		function FontChooser.OnSelect(FontChooser,_,_,font)
			self.RichText:SetFontInternal(font)
			local _ = self.RichText.SetUnderlineFont and self.RichText:SetUnderlineFont(font)
			RunConsoleCommand("epoe_font",font)
		end
		FontChooser:SetConVar("epoe_font")
		FontChooser:SizeToContents()
		FontChooser:SetTall(16)
		FontChooser:SetWide(FontChooser:GetWide()+32)
		Cfg:AddPanel( FontChooser )

		-- FEEL FREE TO CHANGE/FIX/REMOVE( :( ) THIS
		local ok,err = pcall(function()
			local PlaceChooser = vgui.Create("DComboBox", Cfg )
			PlaceChooser:AddChoice("Wherever", "0")
			PlaceChooser:AddChoice("Top Left", "1")
			PlaceChooser:AddChoice("Top", "2")
			PlaceChooser:AddChoice("Top Right", "3")
			PlaceChooser:AddChoice("Left", "4")
			PlaceChooser:AddChoice("Center", "5")
			PlaceChooser:AddChoice("Right", "6")
			PlaceChooser:AddChoice("Bottom Left", "7")
			PlaceChooser:AddChoice("Bottom", "8")
			PlaceChooser:AddChoice("Bottom Right", "9")
			function PlaceChooser:Think()
				self:ConVarStringThink()
				PlaceChooser:SizeToContents()
				PlaceChooser:SetTall(16)
				PlaceChooser:SetWide(PlaceChooser:GetWide()+32)
			end

			function PlaceChooser:OnSelect(index, value, data)
				LocalPlayer():ConCommand("epoe_autoplace " .. (index - 1))
			end
			PlaceChooser:ChooseOptionID((GetConVarNumber("epoe_autoplace") or 0) + 1)
			PlaceChooser:SizeToContents()
			PlaceChooser:SetTall(16)
			PlaceChooser:SetWide(PlaceChooser:GetWide()+32)
			Cfg:AddPanel( PlaceChooser )
		end)
		if not ok then ErrorNoHalt(err) end
	self.uppermenu=Cfg


	self.canvas=vgui.Create('EditablePanel',self)
	local canvas=self.canvas
	canvas:Dock(FILL)

	self.RichText = vgui.Create('RichText',canvas)
	local RichText=self.RichText
		RichText:InsertColorChange(255,255,255,255)
		RichText:SetPaintBackgroundEnabled( false )
		RichText:SetPaintBorderEnabled( false )
		RichText:SetMouseInputEnabled(true)
		-- We'll keep it visible constantly but clip it off to make the richtext behave how we want
		RichText:SetVerticalScrollbarEnabled(true)

		RichText:Dock(FILL)
		function RichText.HideScrollbar()
			RichText.__background=false
			RichText:DockMargin(0,0,-20,0)
		end
		function RichText.ShowScrollbar()
			RichText.__background=true
			RichText:DockMargin(0,0,0,0)
		end
		RichText:HideScrollbar()
		function RichText:Paint()
			if self.__background then
				surface.SetDrawColor(70,70,70,40)
				surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
			end
		end


		local function linkhack(self,id)
			self:InsertClickableTextStart( id )
			self:AppendText' '
			self:InsertClickableTextEnd()
			self:AppendText' '
		end

		RichText.AddLink=function(richtext,func,func2)
			-- warning: infinitely growing list. fix!
			richtext.__links=richtext.__links or {}
			local id = table.insert(richtext.__links,func2)
			richtext.__links[id]=func2

			local cbid = "cb_"..tostring(id)
			linkhack(richtext,cbid)

			richtext:InsertClickableTextStart(cbid)
				func(richtext)
			richtext:InsertClickableTextEnd()
		end
		RichText.ActionSignal=function(richtext,key,value)
			if key~="TextClicked" then return end

			local id = value:match("cb_(.+)",1,true)
			id=tonumber(id)
			local callback = id and richtext.__links[id]
			if callback then
				callback(richtext,value)
				return
			end
		end
	self:ButtonHolding(false)
end

function PANEL:PostInit()
	self.RichText:SetVerticalScrollbarEnabled(true)

	local ok = pcall(function()
		self.RichText:SetFontInternal( epoe_font:GetString() )

		local _ = self.RichText.SetUnderlineFont and self.RichText:SetUnderlineFont(epoe_font:GetString())
	end)

	if not ok then
		RunConsoleCommand("epoe_font","BudgetLabel")
		self.RichText:SetFontInternal( "BudgetLabel" )
	end

end


---------------------
-- Text manipulation
---------------------
-- We don't want a newline appended right away so we hack it up..
PANEL.__appendNL=false
function PANEL:AppendText(txt)
	if self.__appendNL then
		self.RichText:AppendText "\n"
	end
	if txt:sub(-1)=="\n" then
		self.__appendNL=true
		txt = txt:sub(1,txt:len()-1)
	else
		self.__appendNL=false
	end

	-- fix crashing from big texts
	-- limit around 512,000
	if #txt > 510000 then
		txt = txt:sub(1, 510000) .. "..."
	end

	self.RichText:AppendText(txt)
end

function PANEL:AppendTextX(txt)
	local lmode = epoe_links_mode:GetInt()
	if lmode==0 then
		return self:AppendText(txt)
	end

	local function func(link,url,real_url)
		if url:len()==0 then return end
		real_url = real_url or url
		if link then
			self.RichText:AddLink(
				function()
					self:ResetLastColor()
					self:AppendText(url)
				end,
				function()
					local lmode = epoe_links_mode:GetInt()
					if lmode >= 2 then
						SetClipboardText(real_url)
						-- should probably print this on EPOE?
						if lmode==2 then
							LocalPlayer():ChatPrint("Copied to clipboard: "..real_url.." ")
						end
					end
					if lmode==1 or lmode>2 then
						local handled = hook.Run("EPOEOpenLink", real_url)

						if not handled then
							gui.OpenURL(real_url)
						end
					end
				end
			)
		else
			self:AppendText(url)
		end
	end

	local res = AppendTextLink(txt,func)
	if not res then
		self:AppendText(txt)
	end
end


function PANEL:Clear()
	self.RichText:SetText ""
	self.RichText:GotoTextEnd()
end


function PANEL:SetColor(r,g,b)
	self.RichText:InsertColorChange(r,g,b,255)
	self.RichText.lr = r
	self.RichText.lg = g
	self.RichText.lb = b
end

function PANEL:ResetLastColor(r,g,b)
	local r = self.RichText.lr or r or 255
	local g = self.RichText.lg or g or 255
	local b = self.RichText.lb or b or 255
	self.RichText:InsertColorChange(r,g,b,255)
end
---------------------
-- Visuals
---------------------
--[[function PANEL:PerformLayout()
	self.RichText:InvalidateLayout()
end]]--

function PANEL:Paint(w,h)
	-- cvar callback ffs
	if self.Last_SetRenderInScreenshots ~= epoe_show_in_screenshots:GetBool() then
		local new = epoe_show_in_screenshots:GetBool()
		self.Last_SetRenderInScreenshots = new
		self:SetRenderInScreenshots(new)
	end

	if self.__repeatact then
		if self.__repeatact>RealTime() then

			surface.SetDrawColor(180,230 ,255,196)
			surface.DrawRect(0,0,3,6)
		else
			self.__repeatact = false
		end
	end

	if not self.__holding and not epoe_draw_background:GetBool() and not self.being_hovered then return end

	if self.__holding then
		surface.SetDrawColor(40 ,40 ,40,196)
		local q=16+4
		surface.DrawRect(0,q,w,h-q)

		-- header
			surface.SetDrawColor(90,90,90,255)
			surface.DrawRect(0,0,w,16)
		if self.__highlight then
			surface.SetDrawColor(35 ,35 ,35,255)
		else
			surface.SetDrawColor(30 ,30 ,30,255)
		end
			surface.DrawRect(1,1,w-2,16-2)

		local txt="EPOE - Enhanced Perception Of Errors"
		surface.SetFont"DebugFixed"
		local w,h=surface.GetTextSize(txt)
		surface.SetTextPos(3,8-h*0.5)
		if self.__highlight then
			surface.SetTextColor(255,255,255,255)
		else
			surface.SetTextColor(150,150,150,255)
		end
		surface.DrawText(txt)
	else
		surface.SetDrawColor(40 ,40 ,40,196)
		surface.DrawRect(0,0,w,h)
	end
	return true
end

---------------------
-- Functionality
---------------------
function PANEL:ButtonHolding(isHolding)
	self.__holding=isHolding
	if isHolding then
		self:DockPadding( 8, 16+4, 8, 8 )
		self.being_hovered = true
		self.RichText:ShowScrollbar()
		self.uppermenu:Dock(TOP)
		self.uppermenu:SetVisible(true)
		self:FixPosition()
		self:InvalidateLayout()
		self:SetParent()
	else
		self.being_hovered = false
		self.RichText:HideScrollbar()
		self.uppermenu:Dock(NODOCK)
		self:DockPadding( 0,0,0,0 )
		self.uppermenu:SetVisible(false)
		self:InvalidateLayout()
		if not epoe_always_clickable:GetBool() then
			self:ParentToHUD()
		end
	end
end


local epoe_ui_holdtime=CreateClientConVar("epoe_ui_holdtime","5",true,false)--seconds
local remainvisible=CreateClientConVar("epoe_ui_obeydrawing","1",true,false)
local fadespeed=CreateClientConVar("epoe_ui_fadespeed","3",true,false)--seconds
function PANEL:Think()

	if not self.__starthack then
		self.__starthack=true
		self:PostInit()
	end

	local mx = gui.MouseX()
	local my = gui.MouseY()

	local px, py = self:GetPos()

	if
		mx > px and
		mx < px + self:GetWide() and
		my > py and
		my < py + self:GetTall()
	then
		self.being_hovered = true
		--self.RichText:PerformLayout()
	else
		--self.RichText:PerformLayout()
		self.being_hovered = false
	end


	-- Hiding for gmod camera..
	if remainvisible:GetBool() and hook.Call('HUDShouldDraw',GAMEMODE,"CHud"..TagHuman)==false and not self.being_hovered then self:SetAlpha(0) return end
	if (self.Dragging) then



		local x = mx - self.Dragging[1]
		local y = my - self.Dragging[2]

		--if ( self:GetScreenLock() ) then

			x = math.Clamp( x, 0, ScrW() - self:GetWide() )
			y = math.Clamp( y, 0, ScrH() - self:GetTall() )

		--end

		self:SetPos( x, y )

	end


	if ( self.Sizing ) then

		local x = mx - self.Sizing[1]
		local y = my - self.Sizing[2]

		if ( x < 100 ) then x = 100 end
		if ( y < 18 ) then y = 18 end

		self:SetSize( x, y )
		self:SetCursor( "sizenwse" )
		return

	end

	if ( self.Hovered and
		 --self.m_bSizable and
		 mx > (self.x + self:GetWide() - 20) and
		 my > (self.y + self:GetTall() - 20) ) then

		self:SetCursor( "sizenwse" )
		return

	end

	if ( self.Hovered and my < (self.y + 20) ) then
		self:SetCursor( "sizeall" )
		self.__highlight=true
		return
	end

	self.__highlight=false

	self:SetCursor( "arrow" )
	if self:IsActive() then self:Activity() end

	local inactive_time = RealTime() - self.LastActivity
	--print("inactive_time",inactive_time)
	local epoe_ui_holdtime=epoe_ui_holdtime:GetInt()
	local fadespeed=fadespeed:GetInt()
	inactive_time = ( inactive_time - epoe_ui_holdtime ) * ( 255 / fadespeed )
	--print("inactive_time post",inactive_time)

	local alpha = 255 - ( (inactive_time >= 255 and 255) or (inactive_time <= 0 and 0) or inactive_time )
	if alpha<=0 then
		self:SetVisible(false)
		self:SetAlpha(255)
	end

	local alphascale = 255
	if not self.__highlight and not self.__holding then
		alphascale = epoe_max_alpha:GetInt()
		alphascale = alphascale >255 and 255 or alphascale<0 and 0 or alphascale
		alphascale=alphascale/255
	end
	self:SetAlpha(math.ceil(alpha*alphascale))
end

function PANEL:OnMousePressed( mc )

	if mc == MOUSE_RIGHT or ( gui.MouseX() > (self.x + self:GetWide() - 20) and
			gui.MouseY() > (self.y + self:GetTall() - 20) ) then
		self.Sizing = { gui.MouseX() - self:GetWide(), gui.MouseY() - self:GetTall() }
		self:MouseCapture( true )
		return
	else
		self.Dragging = { gui.MouseX() - self.x, gui.MouseY() - self.y }
		self:MouseCapture( true )
		return
	end

end
function PANEL:FixPosition()
	local x,y=self:GetPos()
	local w,h=self:GetSize()
	local sw,sh=ScrW(),ScrH()
	local failed=false
	if w > sw then
		failed=true
		w=sw
	end
	if h > sh then
		failed=true
		h=sh
	end
	if x > sw then
		failed=true
		x=0
	end
	if y > sh then
		failed=true
		y=0
	end
	if x+w > sw then
		failed=true
		x=sw-w
	end
	if y+h > sh then
		failed=true
		y=sh-h
	end

	if failed then
		self:SetPos(x,y)
		self:SetSize(w,h)
		--self.RichText:AppendText"GUI: Recovered position after invalid values\n"
	end
end

function PANEL:OnMouseReleased()

	self.Dragging = nil
	self.Sizing = nil

	self:FixPosition()
	local x,y=self:GetPos()
	e.GUI:SetCookie("w",self:GetWide())
	e.GUI:SetCookie("h",self:GetTall())
	e.GUI:SetCookie("x",x)
	e.GUI:SetCookie("y",y)

	self:MouseCapture( false )

end

function PANEL:ToggleActive()
	local state=epoe_keep_active:GetBool()

	RunConsoleCommand("epoe_keep_active",state and "0" or "1")

	e.internalPrint(state and "Fading Enabled" or "Fading Disabled")

end

function PANEL:IsActive()

	if epoe_keep_active:GetBool() or self.being_hovered or self:HasFocus() or vgui.FocusedHasParent( self ) then return true end

end

-- Bring up if something happened.
function PANEL:Activity()
	self:SetAlpha(255)
	self.LastActivity=RealTime()
end
PANEL.OnCursorMoved=PANEL.Activity

function PANEL:Repeat()
		self.__repeatact = RealTime()+0.01
end


vgui.Register( "EPOEUI", PANEL, "EditablePanel" )



function e.CreateGUI()
	if not ValidPanel(e.GUI) then
		e.GUI=vgui.Create('EPOEUI')
		if not ValidPanel(e.GUI) then
			return
		end
		e.GUI:SetCookieName("epoe2_gui")
		local w = tonumber( e.GUI:GetCookie("w") ) or ScrW()*0.5
		local h = tonumber( e.GUI:GetCookie("h") ) or ScrH()*0.25
		local x = tonumber( e.GUI:GetCookie("x") ) or ScrW()*0.5 - w*0.5
		local y = tonumber( e.GUI:GetCookie("y") ) or ScrH() - h

		e.GUI:SetSize(w,h)
		e.GUI:SetPos(x,y)
	end
end

function e.ShowGUI(show)
	e.CreateGUI()
	e.GUI:SetVisible(show==nil or show)
	e.GUI:Activity()
end

function e.ClearLog()
	if ValidPanel( e.GUI ) then
		e.GUI:Clear()
	end
end
concommand.Add('epoe_clearlog', e.ClearLog)

-- Debug
concommand.Add('epoe_ui_remove',function()
	if ValidPanel(e.GUI) then e.GUI:Remove() end
end)

local threshold  = 0.35 -- I'm sorry if you can't click this fast!
local lastclick  = 0

local function epoe_toggle(_,cmd,args)
	if cmd=="+epoe" then

		gui.EnableScreenClicker(true)
		e.ShowGUI() -- also creates it
		local egui=e.GUI
		if ValidPanel(egui) then

			local x,y=egui:LocalToScreen( )
			x,y=x+egui:GetWide()*0.5,y+10
			gui.SetMousePos(x,y)

			if lastclick+threshold>RealTime() then -- Doubleclick
				lastclick = 0 -- reset
				e.GUI:ToggleActive()
			else
				lastclick=RealTime()
			end

			e.GUI:ButtonHolding(true)

		end
	else
		gui.EnableScreenClicker(false)
		e.GUI:ButtonHolding(false)
	end
end

concommand.Add('+epoe',epoe_toggle)
concommand.Add('-epoe',epoe_toggle)


local ctxopen
hook.Add("ContextMenuOpened", TagHuman, function()
	if not g_ContextMenu or not g_ContextMenu:IsValid() then return end
	if not epoe_context_menu:GetBool() then return end
	ctxopen=true
	e.ShowGUI()
	e.GUI:ButtonHolding(true) -- sets parent
	e.GUI:SetParent(g_ContextMenu) -- so set it to context menu
end)

hook.Add("ContextMenuClosed", TagHuman, function()
	if not ctxopen then return end
	e.GUI:ButtonHolding(false)
end)


----------------------------
-- Hooking, timestamps, activity showing
----------------------------

local epoe_timestamps = CreateClientConVar("epoe_timestamps", 			"1", true, false)
local epoe_timestamp_format = CreateClientConVar("epoe_timestamp_format", 			"%H:%M", true, false)
local epoe_show_on_activity = CreateClientConVar("epoe_show_on_activity", 	"1", true, false)
local epoe_disable_autoscroll = CreateClientConVar("epoe_disable_autoscroll", 	"0", true, false)
local notimestamp  = false

local prevtext
hook.Add( TagHuman, TagHuman..'_GUI', function(newText,flags,c)
	flags = flags or 0

	-- create the gui (if possible) so we can print epoe.api prints also regardless of subscription status
	local ok,err  = pcall(e.CreateGUI)
	if not ok then ErrorNoHalt(err..'\n') end

	if ValidPanel( e.GUI ) then
		local epoemsg = e.HasFlag(flags,e.IS_EPOE)

		if epoemsg then
			e.ShowGUI() -- Force it
			e.GUI:Activity()
		end

		if epoemsg or epoe_show_on_activity:GetBool() then
			e.ShowGUI()
			local same = prevtext==newText
			prevtext=newText
			if same then
				e.GUI:Repeat()
			end
			e.GUI:Activity()
		end

		if epoe_timestamps:GetBool() then
			if not notimestamp then
				e.GUI:SetColor(100,100,100)	e.GUI:AppendText(			"[")

				local formatted_stamp = os.date(epoe_timestamp_format:GetString())
				e.GUI:SetColor(255,255,255)	e.GUI:AppendText(formatted_stamp)

				e.GUI:SetColor(100,100,100)	e.GUI:AppendText(			"] ")
			end
			notimestamp = not ( newText:Right(1)=="\n" ) -- negation hard
		end

		if epoemsg then
			e.GUI:SetColor(255,100,100)
			e.GUI:AppendText("[EPOE] ")
			e.GUI:SetColor(255,250,250)
			e.GUI:AppendTextX(newText.."\n")
			notimestamp = false
			return
		end

		-- did I really write this. Oh well...
		if e.HasFlag(flags,e.IS_MSGC) and c and type(c) == "table" and type(c.r) == "number" and type(c.g) == "number" and type(c.b) == "number" then
			e.GUI:SetColor(c.r, c.g, c.b)
		elseif e.HasFlag(flags,e.IS_ERROR) then
			e.GUI:SetColor(255,80,80)
		elseif e.HasFlag(flags,e.IS_CERROR) then
			e.GUI:SetColor( 234,111,111)
		elseif e.HasFlag(flags,e.IS_MSGN) or e.HasFlag(flags,e.IS_MSG) then
			e.GUI:SetColor( 255,181,80)
		else
			e.GUI:SetColor(255,255,255)
		end

		e.GUI:AppendTextX(newText)

		if not epoe_disable_autoscroll:GetBool() and not e.GUI.being_hovered then
			e.GUI.RichText:GotoTextEnd()
		end

	end
end)

--PATH addons/executioner/lua/autorun/executioner_logging.lua:
function Executioner.HandleBLogs()
    if bLogs and SERVER then
        local m = bLogs:Module()
        m.Category = 'General'
        m.Name = 'Executioner'
        m.Colour = Color( 230, 32, 25 )
        m:Hook( 'Executioner.OnHitAccepted', 'Executioner.Log.Accept', function( data )
            m:Log( bLogs:FormatPlayer( data.hitman ) .. ' has accepted a hit against ' .. bLogs:FormatPlayer( data.target ) .. ' for ' .. DarkRP.formatMoney( data.price ) .. '.' )
        end )
        m:Hook( 'Executioner.OnHitDeclined', 'Executioner.Log.Decline', function( data )
            m:Log( bLogs:FormatPlayer( data.hitman ) .. ' has declined a hit against ' .. bLogs:FormatPlayer( data.target ) .. ' for ' .. DarkRP.formatMoney( data.price ) .. '.' )
        end )
        m:Hook( 'Executioner.OnHitCompleted', 'Executioner.Log.Completed', function( data, victim, attacker, bonus )
            m:Log( bLogs:FormatPlayer( data.hitman ) .. ' has completed a hit against ' .. bLogs:FormatPlayer( data.target ) .. ' for ' .. DarkRP.formatMoney( data.price ) .. '.' )
        end )
        m:Hook( 'Executioner.OnHitFailed', 'Executioner.Log.Failed', function( data, victim, attacker, bonus )
            m:Log( bLogs:FormatPlayer( victim ) .. ' was killed. The hit has failed!' )
        end )
        m:Hook( 'Executioner.OnHitDisconnected', 'Executioner.Log.Disconnected', function( data, self )
            m:Log( 'Someone with a hit left the server. ' .. bLogs:FormatPlayer( data.hitman ) .. '\'s hit has failed!' )
        end )
        m:Hook( 'Executioner.OnHitArrested', 'Executioner.Log.Arrested', function( data, target, time, arrestor )
            m:Log( bLogs:FormatPlayer( target ) .. ' has been arrested by ' .. bLogs:FormatPlayer( arrestor ) .. '. The hit has failed!' )
        end )
        m:Hook( 'Executioner.OnHitExpired', 'Executioner.Log.Expired', function( data, reason )
            m:Log( reason )
        end )
        bLogs:AddModule( m )
    end
end
hook.Add( 'bLogs_FullyLoaded', 'Executioner.Handle.BLogs', Executioner.HandleBLogs )

------------------------------

--PATH addons/admin_warns/lua/fam/languages/russian.lua:
local id = "RUS"

local phrases = {
	accept = "Принять",
	cancle = "Отменить",
	give_warn = "Выдать варн",
	give_warn_r = "Причина варна",
	give_warn_r_s = "Напишите причину выдачи варна",
	remove_warn = "Убрать варн",
	remove_warn_r = "Причина снятия варна",
	remove_warn_r_s = "Напишите причину снятия варна",
	info = "Информация",
	load_stats = "Загрузить статистику",
	vacation = "Вкл/Выкл отпуск",
	load_more_users = "Загрузить еще ...",
	search          = "Поиск",
	ply_info = "Информация о игроке",
	a_warns  = "Активные варны:",
	t_warns  = "Всего варнов:",
	loading  = "Загрузка...",
	go_back  = "Вернутся",
	total_online = "Общее время",
	last_seen = "Последний раз заходил",
	monthly_online = "Месячный онлайн",
	press_to_open = "(Нажми чтобы открыть)",
	warns_history = "История варнов",
	online_players = "Игроки онлайн",
	online_admins = "Админов:",



	clipboard = "Копирование",
	clipboard_t = "Вы скопировали:",


	mysql_setup_t = "Вам нужно настроить MySQL!",
	mysql_setup_ip = "IP Ардес",
	mysql_setup_username = "Имя пользователя",
	mysql_setup_pass = "Пароль",
	mysql_setup_db = "Database",
	mysql_setup_port = "Порт",
	mysql_setup_desc = "Вам не стоит переживать.\nВсе что вы тут напишите будет сохранено \nи использовано при следующем зщапуске.\nЕсли что-то нужно будет изменить\nвы всегда сможете это сделать в\nвнутриигровых настройках.",
	mysql_setup_confirm = "Подтвердить",


	settings = "Настройки",
	settings_who_can_give_warn = "Кто может выдавать варны",
	settings_who_can_give_warn_d = "Кто из администрации может выдавать варны",
	settings_who_can_collect_stats = "Кто будет собирать статистику и получать варны",
	settings_who_can_collect_stats_d = "будет сохранять статистику об этих игроках",
	settings_who_can_open_main_menu = "Кто может открывать меню",
	settings_who_can_open_main_menu_d = "Кто сможет открывать меню и смотреть информацию о админах",
	settings_who_has_accet_to_ingame_s = "Кто сможет открывать внутриигровые настройки",
	settings_who_has_accet_to_ingame_s_d1 = "Лучше всего доступ оставить только вам.",
	settings_who_has_accet_to_ingame_s_d2 = "Люди у которых есть доступ к этой опции смогут управлять MySQL",
	settings_punishments = "Наказания за варны",
	settings_punishments_d = "Создать новые методы можно в конфиге",
	settings_punishments_af = 'После "N" кол. во варнов игрок получит -> наказание',
	settings_save = "Сохранить настройки",


	settings_enable = "Включено",
	settings_disable = "Выключено",
	settings_delete = "Удалить",


	warns_history_format = {
		[1] = "Дата: %s\n%s (%s) выдал варн с причиной:\n%s",
		[2] = "Дата: %s\n%s (%s) убрал варн с причиной:\n%s",
		[3] = 'Купил снятие варна!',
	},

	gave_warn = "выдал варн админу",
	removed_warn = "убрал варн админу",
	by_reason = "по причине:",
}

FlameAdminManagement.RegisterLanguage(id, phrases)
--PATH addons/fpp/lua/fprofiler/report.lua:
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

--PATH addons/gprofiler/lua/autorun/gprofiler_load.lua:
GProfiler = GProfiler or { Config = {}, Access = {} }

local logLevels = {
	[1] = {"DEBUG", Color(0, 255, 0)},
	[2] = {"INFO", Color(0, 0, 255)},
	[3] = {"WARNING", Color(255, 255, 0)},
	[4] = {"ERROR", Color(255, 0, 0)},
	[5] = {"LOAD", Color(255, 0, 255)}
}

local color_white = Color(255, 255, 255)

function GProfiler.Log(str, lvl)
	lvl = logLevels[lvl or 1] and lvl or 1

	if not GProfiler.Config[string.format("LOG_%s", logLevels[lvl][1])] then return end

	MsgC(logLevels[lvl][2], string.format("[GProfiler][%s] ", logLevels[lvl][1]), color_white, str, "\n")
end

local incFuncs = {
	sv = SERVER and include or function() end,
	cl = SERVER and AddCSLuaFile or include,
	sh = function(f) include(f) AddCSLuaFile(f) end
}

local function incFile(f)
	(incFuncs[string.GetFileFromFilename(f):sub(1,2)] or incFuncs.sh)(f)
	GProfiler.Log(string.format("Loading file %s", f), 5)
end

local function incFolder(folder)
	GProfiler.Log(string.format("Loading folder %s", folder), 5)

	local files, folders = file.Find(folder.."/*", "LUA")
	for _, f in pairs(files) do incFile(string.format("%s/%s", folder, f)) end
	for _, f in pairs(folders) do incFolder(folder.."/"..f) end
end

incFile("gprofiler/sh_config.lua")
incFile("gprofiler/sh_utils.lua")
incFile("gprofiler/cl_language.lua")
incFile("gprofiler/cl_menu.lua")
incFile("gprofiler/sh_access.lua")
incFolder("gprofiler/profilers")

-- 76561197961078988

--PATH addons/gprofiler/lua/gprofiler/profilers/hooks/cl_hooks.lua:
GProfiler.Hooks = GProfiler.Hooks or {}
GProfiler.Hooks.Realm = GProfiler.Hooks.Realm or "Client"
GProfiler.Hooks.ProfileActive = GProfiler.Hooks.ProfileActive or false
GProfiler.Hooks.StartTime = GProfiler.Hooks.StartTime or 0
GProfiler.Hooks.EndTime = GProfiler.Hooks.EndTime or 0

local TabPadding = 10
local MenuColors = GProfiler.MenuColors

local function GetHookTable(realm, callback)
	if realm == "Server" then
		net.Start("GProfiler_Hooks_HookTbl")
		net.SendToServer()
		net.Receive("GProfiler_Hooks_HookTbl", function()
			local hookCount = net.ReadUInt(15)
			local hookTable = {}
			for i = 1, hookCount do
				hookTable[net.ReadString()] = net.ReadUInt(10)
			end
			callback(hookTable)
		end)
	else
		local hookTbl = {}
		local hooks = hook.GetTable()
		for hookName, hookReceivers in pairs(hooks) do
			hookTbl[hookName] = table.Count(hookReceivers)
		end

		callback(hookTbl)
	end
end

function GProfiler.Hooks.DoTab(Content)
	local Header = vgui.Create("DPanel", Content)
	Header:SetSize(Content:GetWide(), 40)
	Header:SetPos(0, 10)
	Header.Paint = function() end

	local RealmSelector = GProfiler.Menu.CreateRealmSelector(Header, "Hooks", Header:GetWide() - TabPadding - 110, Header:GetTall() / 2 - 30 / 2, 110, 30, function(s, _, value)
		GProfiler.Hooks.Realm = value
		GProfiler.Menu.OpenTab("Hooks", GProfiler.Hooks.DoTab)
	end)
	RealmSelector:SetPos(Header:GetWide() - RealmSelector:GetWide() - TabPadding, Header:GetTall() / 2 - RealmSelector:GetTall() / 2)

	local StartButton = vgui.Create("DButton", Header)
	StartButton:SetText(GProfiler.Hooks.ProfileActive and GProfiler.Language.GetPhrase("profiler_stop") or GProfiler.Language.GetPhrase("profiler_start"))
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

	local HookTimeRunning = vgui.Create("DLabel", Header)
	HookTimeRunning:SetFont("GProfiler.Menu.SectionHeader")
	HookTimeRunning:SetText(GProfiler.TimeRunning(GProfiler.Hooks.StartTime, GProfiler.Hooks.EndTime, GProfiler.Hooks.ProfileActive) .. "s")
	HookTimeRunning:SizeToContents()
	HookTimeRunning:SetPos(Header:GetWide() - HookTimeRunning:GetWide() - RealmSelector:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - HookTimeRunning:GetTall() / 2)
	HookTimeRunning:SetTextColor(MenuColors.White)
	function HookTimeRunning:Think()
		if GProfiler.Hooks.ProfileActive then
			self:SetText(GProfiler.TimeRunning(GProfiler.Hooks.StartTime, 0, GProfiler.Hooks.ProfileActive) .. "s")
			self:SizeToContents()
			self:SetPos(Header:GetWide() - self:GetWide() - RealmSelector:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - self:GetTall() / 2)
		end
	end

	StartButton.DoClick = function()
		if GProfiler.Hooks.ProfileActive then
			GProfiler.Hooks.EndTime = SysTime()
			if GProfiler.Hooks.Realm == "Server" then
				net.Start("GProfiler_Hooks_ToggleServerProfile")
					net.WriteBool(false)
				net.SendToServer()
			else
				GProfiler.Hooks:RestoreHooks()
				GProfiler.Hooks.ProfileActive = false
				GProfiler.Menu.OpenTab("Hooks", GProfiler.Hooks.DoTab)
			end

			if timer.Exists("GProfiler.Hooks.Time") then
				timer.Remove("GProfiler.Hooks.Time")
			end
		else
			GProfiler.Hooks.StartTime = SysTime()
			GProfiler.Hooks.EndTime = 0
			if GProfiler.Hooks.Realm == "Server" then
				net.Start("GProfiler_Hooks_ToggleServerProfile")
					net.WriteBool(true)
				net.SendToServer()
			else
				GProfiler.Hooks:DetourHooks()
				GProfiler.Hooks.ProfileActive = true
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
	local RightHeader, RightHeaderText = GProfiler.Menu.CreateHeader(SectionHeader, GProfiler.Language.GetPhrase("Hook Function"), LeftHeader:GetWide() + 10, 0, SectionHeader:GetWide() * rightFraction - 5, LeftHeader:GetTall())

	local LeftContent = vgui.Create("DPanel", Content)
	LeftContent:SetSize(LeftHeader:GetWide(), Content:GetTall() - SectionHeader:GetTall() - Header:GetTall())
	LeftContent:SetPos(0, SectionHeader:GetTall() + Header:GetTall())
	LeftContent.Paint = function() end

	local RightContent = vgui.Create("DPanel", Content)
	RightContent:SetSize(RightHeader:GetWide(), Content:GetTall() - SectionHeader:GetTall() - Header:GetTall())
	RightContent:SetPos(LeftContent:GetWide() + 10, SectionHeader:GetTall() + Header:GetTall())
	RightContent.Paint = function() end

	local HookProfiler = vgui.Create("DListView", LeftContent)
	HookProfiler:SetSize(LeftContent:GetWide() - TabPadding * 2, (LeftContent:GetTall() - TabPadding * 2) / 2 - 10)
	HookProfiler:SetPos(TabPadding, TabPadding)
	HookProfiler:SetMultiSelect(false)
	HookProfiler:AddColumn(GProfiler.Language.GetPhrase("name"))
	HookProfiler:AddColumn(GProfiler.Language.GetPhrase("receiver"))
	HookProfiler:AddColumn(GProfiler.Language.GetPhrase("total_time"))
	HookProfiler:AddColumn(GProfiler.Language.GetPhrase("times_called"))

	local HookList = vgui.Create("DListView", LeftContent)
	HookList:SetSize(HookProfiler:GetWide(), HookProfiler:GetTall())
	HookList:SetPos(TabPadding, HookProfiler:GetTall() + TabPadding * 2)
	HookList:SetMultiSelect(false)
	HookList:AddColumn(GProfiler.Language.GetPhrase("name"))
	HookList:AddColumn(GProfiler.Language.GetPhrase("receivers"))

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
	FunctionDetails:SetText(GProfiler.Language.GetPhrase("hook_select"))

	table.sort(GProfiler.Hooks.ProfileData, function(a, b) return a.t > b.t end)
	local LastSelected = ""
	for k, v in pairs(GProfiler.Hooks.ProfileData) do
		if v.c == 0 then continue end
		local Line = HookProfiler:AddLine(v.h, v.r, v.t, v.c)
		Line.OnRightClick = function()
			local menu = DermaMenu()
			menu:AddOption(GProfiler.CopyLang("name"), function() SetClipboardText(v.h) end):SetIcon("icon16/page_copy.png")
			menu:AddOption(GProfiler.CopyLang("receiver"), function() SetClipboardText(v.r) end):SetIcon("icon16/page_copy.png")
			menu:AddOption(GProfiler.CopyLang("total_time"), function() SetClipboardText(v.t) end):SetIcon("icon16/page_copy.png")
			menu:AddOption(GProfiler.CopyLang("times_called"), function() SetClipboardText(v.c) end):SetIcon("icon16/page_copy.png")
			menu:AddOption(GProfiler.Language.GetPhrase("remove"), function()
				if GProfiler.Hooks.Realm == "Server" then
					net.Start("GProfiler_Hooks_RemoveHook")
						net.WriteString(v.h)
						net.WriteString(v.r)
					net.SendToServer()
					HookProfiler:RemoveLine(Line:GetID())
				else
					hook.Remove(v.h, v.r)
					HookProfiler:RemoveLine(Line:GetID())
				end
			end):SetIcon("icon16/delete.png")
			menu:Open()
		end

		Line.OnSelect = function()
			if LastSelected == v.h..v.r then return end
			LastSelected = v.h..v.r

			FunctionDetails:SetText(GProfiler.Language.GetPhrase("requesting_source"))
			GProfiler.RequestFunctionSource(v.Source, tonumber(v.Lines[1]), tonumber(v.Lines[2]), function(source)
				if not IsValid(FunctionDetails) then return end
				FunctionDetails:SetText(table.concat(source, "\n"))
			end)
		end
	end

	HookProfiler:SortByColumn(3, true)

	local function UpdateLists()
		GProfiler.StyleDListView(HookList)
		GProfiler.StyleDListView(HookProfiler)
	end
	UpdateLists()

	GetHookTable(GProfiler.Hooks.Realm, function(hookTable)
		if not IsValid(HookList) then return end
		local hookTableSorted = {}
		for k, v in pairs(hookTable) do table.insert(hookTableSorted, {k, v}) end
		table.sort(hookTableSorted, function(a, b) return a[2] > b[2] end)

		for k, v in pairs(hookTableSorted) do
			local Line = HookList:AddLine(v[1], v[2])
			Line.OnRightClick = function()
				local menu = DermaMenu()
				menu:AddOption(GProfiler.CopyLang("name"), function() SetClipboardText(v[1]) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("receivers"), function() SetClipboardText(v[2]) end):SetIcon("icon16/page_copy.png")
				menu:Open()
			end
		end

		UpdateLists()
	end)
end

GProfiler.Menu.RegisterTab("Hooks", "icon16/bricks.png", 1, GProfiler.Hooks.DoTab, function()
	if GProfiler.Hooks.ProfileActive then
		return "", MenuColors.ActiveProfile
	end
end)

net.Receive("GProfiler_Hooks_ServerProfileStatus", function()
	local status = net.ReadBool()
	local ply = net.ReadEntity()
	GProfiler.Hooks.ProfileActive = status

	if ply == LocalPlayer() then
		GProfiler.Menu.OpenTab("Hooks", GProfiler.Hooks.DoTab)
	end
end)

net.Receive("GProfiler_Hooks_SendData", function()
	local data = {}
	for i = 1, net.ReadUInt(20) do
		local hookName = net.ReadString()
		data[hookName] = {
			h = net.ReadString(),
			r = hookName,
			c = net.ReadUInt(32),
			t = net.ReadFloat(),
			Source = net.ReadString(),
			Lines = {net.ReadUInt(16), net.ReadUInt(16)}
		}
	end
	GProfiler.Hooks.ProfileData = data
end)

--PATH addons/foodmode/lua/autorun/hfm_config.lua:
HFM_Config = {}

HFM_Config.MaxPlayerHealth = 100
HFM_Config.MaxPlayerHunger = 100

HFM_Config.StartHunger = 1

HFM_Config.Healing = 36
HFM_Config.DropTime = 50
HFM_Config.DropHunger = 1

HFM_Config.LowDmgHunger = 15
HFM_Config.LowDmgThirsty = 8
HFM_Config.LowHungryMessage = "Я голоден! Срочно нужно поесть!"
HFM_Config.LowThirstyMessage = "Я хочу пить! Нужно что-то выпить!"

HFM_Config.HUDDangerMin = 10
HFM_Config.HUDEntDrawDistance = 100
HFM_Config.HUDEntUseDistance = 96

HFM_Config.StovePrice = 1000
HFM_Config.StoveBurnTime = 20

HFM_Config.KioskPrice = 500

HFM_Config.TableFoods = {
	["apple"] 	= 			{ { "Яблоко",					Color(138, 239,  95),	Vector(0, 0, 10),	"models/props/de_inferno/crate_fruit_break_gib2.mdl" },		{25,	5,		2,		4,		0,		0,		120,		150},	"Food"},
	["bananna"] = 			{ { "Банан",					Color(200, 200,   0),	Vector(0, 0, 10),	"models/props/cs_italy/bananna.mdl" },						{30,	5,		2,		4,		0,		0,		80,			110},	"Food"},
	["cabbage"] = 			{ { "Капуста",					Color(100, 130,  50),	Vector(0, 0, 10),	"models/foods/cabbage1.mdl" },								{25,	10,		0,		0,		0,		0,		90,			120},	"Food"},
	["cauliflower"] = 		{ { "Цветная капуста",			Color(150,  50, 200),	Vector(0, 0, 10),	"models/foods/cabbage2.mdl" },								{15,	10,		0,		0,		0,		0,		90,			120},	"Food"},
	["lemon"] = 			{ { "Лимон",					Color(225, 255,   0),	Vector(0, 0, 10),	"models/foods/lemon.mdl" },									{0,		0,		2,		2,		0,		0,		100,		130},	"Food"},
	["orange"] = 			{ { "Апельсин",					Color(255, 150,   0),	Vector(0, 0, 10),	"models/props/cs_italy/orange.mdl" },						{10,	2,		10,		10,		0,		0,		120,		150},	"Food"},
	["potato"] = 			{ { "Картофель",				Color(130,  80,  30),	Vector(0, 0, 10),	"models/props_phx/misc/potato.mdl" },						{20,	10,		0,		0,		0,		0,		50, 	 	 80},	"Food"},
	["tomato"] = 			{ { "Помидор",					Color(175,   0,   0),	Vector(0, 0, 10),	"models/props/cs_italy/orange.mdl" },						{5,		2,		10,		10,		0,		0,		80,			110},	"Food"},
	["watermelon"] = 		{ { "Арбуз",					Color(119, 214,  25),	Vector(0, 0, 10),	"models/props_junk/watermelon01.mdl" },						{10,	10,		50,		10,		0,		0,		40, 		 70},	"Food"},
	
	["water"] = 			{ { "Вода",						Color(  0,   0, 255),	Vector(0, 0, 10),	"models/props/cs_office/Water_bottle.mdl" },				{0,		0,		25,		5,		0,		0,		500,		600},	"ShopItem",	50	},
	["egg"] = 				{ { "Яйцо",						Color(255, 255, 255),	Vector(0, 0, 10),	"models/props_phx/misc/egg.mdl" },							{1,	 	1,		1,		1,		0,		0,		100,		130},	"ShopItem",	150	},
	["oil"] = 				{ { "Масло",					Color(255, 255,   0),	Vector(0, 0, 10),	"models/props_junk/GlassBottle01a.mdl" },					{1,		1,		1,		1,		-20,	1,		500,		600},	"ShopItem",	110	},
	["tost"] = 				{ { "Тост",						Color(194, 103,  22),	Vector(0, 0, 10),	"models/foods/toast1.mdl" },								{10,	5,		0,		0,		0,		0,		80,			110},	"ShopItem",	50	},
	["meat"] = 				{ { "Сырое мясо",				Color(189,  49,  49),	Vector(0, 0, 10),	"models/foods/backbacon.mdl" },								{7,		5,		0,		0,		-35,	5,		50,			 80},	"ShopItem",	35	},
	["sauce"] = 			{ { "Соус",						Color(189,  49,  49),	Vector(0, 0, 10),	"models/foods/lemoncleaner.mdl" },							{0,	 	0,		0,		0,		0,		0,		500,		600},	"ShopItem",	40	},
	["cucumbers"] = 		{ { "Огурцы",					Color( 58, 110,  25),	Vector(0, 0, 10),	"models/foods/picklejar.mdl" },								{5,		2,		5,		2,		0,		0,		100,		130},	"ShopItem",	90	},
	["sausage"] = 			{ { "Сырая сосиска",			Color(217, 110,  76),	Vector(0, 0, 10),	"models/foods/sausage.mdl" },								{7,		3, 		-5,		5,		-5,		0,		50,			 80},	"ShopItem",	150	},
	["dough"] = 			{ { "Тесто",					Color(235, 235, 177),	Vector(0, 0, 10),	"models/foods/twinkie.mdl" },								{5,	 	5,		-20,	5, 		0,		0,		50,			 80},	"ShopItem",	50	},
	["cereals"] = 			{ { "Хлопья",					Color(238, 186,  14),	Vector(0, 0, 10),	"models/foods/applejacks.mdl" },							{20,	10,		-20,	10,		0,		0,		500,		600},	"ShopItem",	200	},
	["milk"] = 				{ { "Молоко",					Color(255, 255, 255),	Vector(0, 0, 10),	"models/foods/milk.mdl" },									{0,		0,		20,		10,		0,		0,		500,		600},	"ShopItem",	140	},
	["pizzabase"] = 		{ { "Основа для пицы",			Color(216, 187, 151),	Vector(0, 0, 10),	"models/foods/pancakesingle.mdl" },							{5,		5,		-10,	5,		0,		0,		50,			 80},	"ShopItem",	160	},
	["rawchickenleg"] = 	{ { "Куриная ножка сырая",		Color(246, 199, 197),	Vector(0, 0, 10),	"models/foods/mcdfriedchickenleg.mdl" },	 				{5,		5,		0,		0,		-20,	5,		50,			 80},	"ShopItem",	250	},
	
	["omelette"] = 			{ { "Яичница",					Color(246, 236, 206),	Vector(0, 0, 10),	"models/foods/egg.mdl" },									{10,	20,		0,		0,		0,		0,		50,		  	 80},	"CookedItem", { 13, {"oil", 1, "egg", 1 } } },
	["grilledmeat"] = 		{ { "Жареное мясо",				Color(255, 177,  92),	Vector(0, 0, 10),	"models/foods/backbacon.mdl" },	 							{20,	10,		0,		0,		0,		0,		50,		 	 80},	"CookedItem", { 15, {"oil", 1, "meat", 1 } } },
	["sandwich"] = 			{ { "Сэндвич",					Color(132,  53,  17),	Vector(0, 0, 10),	"models/foods/bigsandwich.mdl" },	 						{45,	10,		0,		0,		0,		0,		50,		 	 80},	"CookedItem", { 25, {"friedtoast", 2, "tomato", 1, "cabbage", 1, "grilledmeat", 1 } } },
	["fries"] = 			{ { "Картофель фри",			Color(219, 160,  34),	Vector(0, 0, 10),	"models/foods/chipbunch.mdl" },								{10,	10,		0,		0,  	0,		0,		50,		 	 80},	"CookedItem", { 10, {"oil", 1, "potato", 5 } } },
	["sprite"] = 			{ { "Спрайт",					Color(246, 199, 197),	Vector(0, 0, 10),	"models/foods/sprunk1.mdl" },	 			 				{0,		0,		30,		20,		0,		0,		500,		600},	"CookedItem", { 10,	{"lemon", 5, "water", 1 } } },
	["applej"] = 			{ { "Яблочный сок",				Color(254, 199,  30),	Vector(0, 0, 10),	"models/foods/juicesmall.mdl" },	 						{0,		0,		20,		10,		0,		0,		500,		600},	"CookedItem", { 7, 	{"apple", 3, "water", 1 } } },
	["hamburger"] = 		{ { "Гамбургер",				Color(132,  53,  17),	Vector(0, 0, 10),	"models/foods/burgergtasa.mdl" },	 						{60,	30,		0,		0,		0,		0,		50,			 80},	"CookedItem", { 50, {"tost", 3, "sauce", 1, "grilledmeat", 2, "cucumbers", 1, "cabbage", 1, "tomato", 1 } } },
	["hotdog"] = 			{ { "Сосиска в тесте",			Color(217, 110,  76),	Vector(0, 0, 10),	"models/foods/hotdog.mdl" },	 							{30,	15,		0,		0,		0,		0,		50,			 80},	"CookedItem", { 30, {"dough", 1, "sausage", 1 } } },
	["milkcereals"] = 		{ { "Хлопья с молоком",			Color(238, 186,  14),	Vector(0, 0, 10),	"models/foods/cerealbowl.mdl" },	 						{20,	10,		10,		10,		0,		0,		30,			 50},	"CookedItem", { 20, {"cereals", 1, "milk", 1 } } },
	["friedtoast"] = 		{ { "Жаренный тост",			Color(194, 103,  22),	Vector(0, 0, 10),	"models/foods/toast.mdl" },							 		{5,		5,		0,		0,		0,		0,		50,			 80},	"CookedItem", { 5, 	{"tost", 1, "oil", 1 } } },
	["pizza"] = 			{ { "Пицца",					Color(246, 199, 147),	Vector(0, 0, 10),	"models/foods/pepperonipizza.mdl" },		   				{100,	50,		0,		0,		0,		0,		50,		 	 80},	"CookedItem", { 70, {"pizzabase", 1, "grilledmeat", 3, "tomato", 5, "cucumbers", 1 } } },
	["chickenlegsfried"] = 	{ { "Куриные ножки жареные",	Color(255, 177,  92),	Vector(0, 0, 10),	"models/foods/mcdfriedchickenlegs.mdl" },					{25,	15,		0,		0,		0,		0,		50,		 	 80},	"CookedItem", { 18, {"rawchickenleg", 2, "oil", 1 } } },
	["cola"] = 				{ { "Кола",						Color(  0,   0,   0),	Vector(0, 0, 10),	"models/foods/cola.mdl" },	 								{0,		0,		100,	15,		0,		0,		500,		600},	"CookedItem", { 35, {"water", 1, "apple", 3, "orange", 3, "lemon", 3 } } }
}
--PATH addons/models_mafia_don_hitman/lua/autorun/hitman_absolution_47_classic.lua:
--Add Playermodel
player_manager.AddValidModel( "Hitman Agent 47 Classic Suit", "models/player/hitman_absolution_47_classic.mdl" )
player_manager.AddValidHands( "Hitman Agent 47 Classic Suit", "models/arms/hitman_absolution_47_classic_arms.mdl", 0, "00000000" )

local Category = "Hitman Absolution"

local NPC =
{
	Name = "Agent 47 Classic Suit (Friendly)",
	Class = "npc_citizen",
	KeyValues = { citizentype = 4 },
	Model = "models/npc/hitman_absolution_47_classic_f.mdl",
	Category = Category
}

list.Set( "NPC", "hitman_absolution_47_classic_friendly", NPC )

local NPC =
{
	Name = "Agent 47 Classic Suit (Enemy)",
	Class = "npc_combine_s",
	Numgrenades = "4",
	Model = "models/npc/hitman_absolution_47_classic_e.mdl",
	Category = Category
}

list.Set( "NPC", "hitman_absolution_47_classic_enemy", NPC )

--PATH addons/honkai_impact_3rd_void_archieves_pm_npcs_2689740321/lua/autorun/honkai_impact_3rd_void_archieves.lua:
player_manager.AddValidModel( "Honkai Impact 3rd Void Archieves", "models/Void_Archieves/honkai_impact/rstar/Void_Archieves/Void_Archieves.mdl" );
player_manager.AddValidHands( "Honkai Impact 3rd Void Archieves", "models/Void_Archieves/honkai_impact/rstar/Void_Archieves/arms/Void_Archieves_arms.mdl", 0, "00000000" )

local Category = "R. Star's Models"


local NPC =
{
	Name = "Honkai Impact 3rd Void Archieves (Friendly)",
	Class = "npc_citizen",
	Health = "100",
	KeyValues = { citizentype = 4 },
	Model = "models/Void_Archieves/honkai_impact/rstar/Void_Archieves/Void_Archieves_npc.mdl",
	Category = Category
}

list.Set( "NPC", "honkai_impact_Void_Archieves_friendly", NPC )



local NPC =
{
	Name = "Honkai Impact 3rd Void Archieves (Enemy)",
	Class = "npc_combine_s",
	Health = "100",
	Numgrenades = "4",
	Model = "models/Void_Archieves/honkai_impact/rstar/Void_Archieves/Void_Archieves_npc.mdl",
	Weapons = { "weapon_pistol" },
	Category = Category
}

list.Set( "NPC", "honkai_impact_Void_Archieves_enemy", NPC )
--PATH addons/itemstore_new/lua/autorun/itemstore.lua:
hook.Add( "PostGamemodeLoaded", "ItemStoreInitialize", function()
	itemstore = {}

	if SERVER then
		include( "itemstore/sv_init.lua" )
	else
		include( "itemstore/cl_init.lua" )
	end
end )
--PATH addons/svnv_ru_lib/lua/autorun/load/shared/string.lua:
local TblInjection = {
"\\",
"'" ,
"{" ,
"}" ,
"[" ,
"]" ,
"\"",
"," ,
"." ,
"/"
}
function string.InjectionSafe( str )
	for k,v in pairs(TblInjection) do
		str = string.Replace( str, v, " " ) 
	end
	return str
end

function string.random(normal, numbers, length,upper)
	if not length or length <= 1 then
		length = 6
	end
	local string_change = "abcdefghijklmnopqrstuvwxyz"
	if upper then
		string_change = string.upper( string_change )
	end
	local holder = (normal and string_change or "") .. (numbers and "1234567890" or "")
	local random_shuffle = {string.byte(holder, 1, #holder)}
	local str = ""
	for i = 1, length do
		str = str .. string.char(random_shuffle[math.random(#random_shuffle)])
	end
	return str
end

function string.Capital(str)
	return (str:gsub('^%l', string.upper))
end

function string.Quotify(str)
	return '"' .. str .. '"'
end

function string.StartWith(str, value)
	return value:lower():find(str:lower():sub(1, value:len()), nil, true)
end

function string.ExplodeQuotes(str)
	str = ' ' .. str .. ' '
	local res = {}
	local ind = 1
	while (true) do
		local sInd, start = string.find(str, '[^%s]', ind)
		if not sInd then break end
		ind = sInd + 1
		local quoted = str:sub(sInd, sInd):match('["\']') and true or false
		local fInd, finish = string.find(str, quoted and '["\']' or '[%s]', ind)
		if not fInd then break end
		ind = fInd + 1
		local str = str:sub(quoted and sInd + 1 or sInd, fInd - 1)
		res[#res + 1] = str
	end
	return res
end

function string.FormatTime(t)
	if not t then return 'N/A' end
		
	local hours = math.floor(t / 3600)
	local minutes = math.floor((t % 3600) / 60)
	local seconds = math.floor(t - (hours * 3600) - (minutes * 60))
		
	if (minutes < 10) then minutes = '0' .. minutes end
	if (seconds < 10) then seconds = '0' .. seconds end
		
	return (hours .. ':' .. minutes .. ':' .. seconds)
end
--PATH addons/models_mafia_don_hitman/lua/autorun/mafia.lua:
player_manager.AddValidModel( "models/humans/mafia/male_09", "models/humans/mafia/male_09.mdl" )
player_manager.AddValidModel( "models/humans/mafia/male_08", "models/humans/mafia/male_08.mdl" )
player_manager.AddValidModel( "models/humans/mafia/male_07", "models/humans/mafia/male_07.mdl" )
player_manager.AddValidModel( "models/humans/mafia/male_06", "models/humans/mafia/male_06.mdl" )
player_manager.AddValidModel( "models/humans/mafia/male_04", "models/humans/mafia/male_04.mdl" )
player_manager.AddValidModel( "models/humans/mafia/male_02", "models/humans/mafia/male_02.mdl" )
player_manager.AddValidModel( "Asss", "models/player/ezio.mdl" )
--PATH addons/enc_advmarket/lua/autorun/market.lua:
enc = enc or {}

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

hook.Add('OnGamemodeLoaded','enc.market.load',function()
    IncludeDir('market')
end) 


--PATH addons/rp_advdupe2/lua/autorun/netstream.lua:
--A net extension which allows sending large streams of data without overflowing the reliable channel
--Keep it in lua/autorun so it will be shared between addons
AddCSLuaFile()

net.Stream = {}
net.Stream.ReadStreamQueues = {}            --This holds a read stream for each player, or one read stream for the server if running on the CLIENT
net.Stream.WriteStreams = {}            --This holds the write streams
net.Stream.SendSize = 20000            --This is the maximum size of each stream to send
net.Stream.Timeout = 30            --How long the data should exist in the store without being used before being destroyed
net.Stream.MaxServerReadStreams = 128  --The maximum number of keep-alives to have queued. This should prevent naughty players from flooding the network with keep-alive messages.
net.Stream.MaxServerChunks = 3200 --Maximum number of pieces the stream can send to the server. 64 MB
net.Stream.MaxTries = 3 --Maximum times the client may retry downloading the whole data
net.Stream.MaxKeepalive = 15 --Maximum times the client may request data stay live

net.Stream.ReadStream = {}
--Send the data sender a request for data
function net.Stream.ReadStream:Request()
	if self.downloads == net.Stream.MaxTries * self.numchunks then self:Remove() return end
	self.downloads = self.downloads + 1
	-- print("Requesting",self.identifier,false,false,#self.chunks)

	net.Start("NetStreamRequest")
	net.WriteUInt(self.identifier, 32)
	net.WriteBit(false)
	net.WriteBit(false)
	net.WriteUInt(#self.chunks, 32)
	if CLIENT then net.SendToServer() else net.Send(self.player) end

	timer.Create("NetStreamReadTimeout" .. self.identifier, net.Stream.Timeout/2, 1, function() self:Request() end)

end

--Received data so process it
function net.Stream.ReadStream:Read(size)
	timer.Remove("NetStreamReadTimeout" .. self.identifier)

	local progress = net.ReadUInt(32)
	if self.chunks[progress] then return end

	local crc = net.ReadString()
	local data = net.ReadData(size)

	if crc == util.CRC(data) then
		self.chunks[progress] = data
	end
	if #self.chunks == self.numchunks then
		self.returndata = table.concat(self.chunks)
		if self.compressed then
			self.returndata = util.Decompress(self.returndata)
		end
		self:Remove()
	else
		self:Request()
	end

end

--Gets the download progress
function net.Stream.ReadStream:GetProgress()
	return #self.chunks/self.numchunks
end

--Pop the queue and start the next task
function net.Stream.ReadStream:Remove()

	local ok, err = xpcall(self.callback, debug.traceback, self.returndata)
	if not ok then ErrorNoHalt(err) end

	net.Start("NetStreamRequest")
	net.WriteUInt(self.identifier, 32)
	net.WriteBit(false)
	net.WriteBit(true)
	if CLIENT then net.SendToServer() else net.Send(self.player) end

	timer.Remove("NetStreamReadTimeout" .. self.identifier)
	timer.Remove("NetStreamKeepAlive" .. self.identifier)

	if self == self.queue[1] then
		table.remove(self.queue, 1)
		local nextInQueue = self.queue[1]
		if nextInQueue then
			timer.Remove("NetStreamKeepAlive" .. nextInQueue.identifier)
			nextInQueue:Request()
		else
			net.Stream.ReadStreamQueues[self.player] = nil
		end
	else
		for k, v in ipairs(self.queue) do
			if v == self then
				table.remove(self.queue, k)
				break
			end
		end
	end
end

net.Stream.ReadStream.__index = net.Stream.ReadStream

net.Stream.WriteStream = {}

-- The player wants some data
function net.Stream.WriteStream:Write(ply)
	local progress = net.ReadUInt(32)+1
	local chunk = self.chunks[progress]
	if chunk then
		self.clients[ply].progress = progress
		net.Start("NetStreamDownload")
		net.WriteUInt(#chunk.data, 32)
		net.WriteUInt(progress, 32)
		net.WriteString(chunk.crc)
		net.WriteData(chunk.data, #chunk.data)
		if CLIENT then net.SendToServer() else net.Send(ply) end
	end
end

-- The player notified us they finished downloading or cancelled
function net.Stream.WriteStream:Finished(ply)
	self.clients[ply].finished = true
	if self.callback then
		local ok, err = xpcall(self.callback, debug.traceback, ply)
		if not ok then ErrorNoHalt(err) end
	end
end

-- Get player's download progress
function net.Stream.WriteStream:GetProgress(ply)
	return self.clients[ply].progress / #self.chunks
end

-- If the stream owner cancels it, notify everyone who is subscribed
function net.Stream.WriteStream:Remove()
	local sendTo = {}
	for ply, client in pairs(self.clients) do
		if not client.finished then
			client.finished = true
			if ply:IsValid() then sendTo[#sendTo+1] = ply end
		end
	end

	net.Start("NetStreamDownload")
	net.WriteUInt(0, 32)
	net.WriteUInt(self.identifier, 32)
	if SERVER then net.Send(sendTo) else net.SendToServer() end
	net.Stream.WriteStreams[self.identifier] = nil
end

net.Stream.WriteStream.__index = net.Stream.WriteStream

--Store the data and write the file info so receivers can request it.
local identifier = 1
function net.WriteStream(data, callback, dontcompress)

	if not isstring(data) then
		error("bad argument #1 to 'WriteStream' (string expected, got " .. type(data) .. ")", 2)
	end
	if callback ~= nil and not isfunction(callback) then
		error("bad argument #2 to 'WriteStream' (function expected, got " .. type(callback) .. ")", 2)
	end

	local compressed = not dontcompress
	if compressed then
		data = util.Compress(data) or ""
	end

	if #data == 0 then
		net.WriteUInt(0, 32)
		return
	end

	local numchunks = math.ceil(#data / net.Stream.SendSize)
	if CLIENT and numchunks > net.Stream.MaxServerChunks then
		ErrorNoHalt("net.WriteStream request is too large! ", #data/1048576, "MiB")
		net.WriteUInt(0, 32)
		return
	end

	local chunks = {}
	for i=1, numchunks do
		local datachunk = string.sub(data, (i - 1) * net.Stream.SendSize + 1, i * net.Stream.SendSize)
		chunks[i] = {
			data = datachunk,
			crc = util.CRC(datachunk),
		}
	end
	
	local startid = identifier
	while net.Stream.WriteStreams[identifier] do
		identifier = identifier % 1024 + 1
		if identifier == startid then
			ErrorNoHalt("Netstream is full of WriteStreams!")
			net.WriteUInt(0, 32)
			return
		end
	end

	local stream = {
		identifier = identifier,
		chunks = chunks,
		compressed = compressed,
		numchunks = numchunks,
		callback = callback,
		clients = setmetatable({},{__index = function(t,k)
			local r = {
				finished = false,
				downloads = 0,
				keepalives = 0,
				progress = 0,
			} t[k]=r return r
		end})
	}
	setmetatable(stream, net.Stream.WriteStream)

	net.Stream.WriteStreams[identifier] = stream
	timer.Create("NetStreamWriteTimeout" .. identifier, net.Stream.Timeout, 1, function() stream:Remove() end)

	net.WriteUInt(numchunks, 32)
	net.WriteUInt(identifier, 32)
	net.WriteBool(compressed)

	return stream
end

--If the receiver is a player then add it to a queue.
--If the receiver is the server then add it to a queue for each individual player
function net.ReadStream(ply, callback)

	if CLIENT then
		ply = NULL
	else
		if type(ply) ~= "Player" then
			error("bad argument #1 to 'ReadStream' (Player expected, got " .. type(ply) .. ")", 2)
		elseif not ply:IsValid() then
			error("bad argument #1 to 'ReadStream' (Tried to use a NULL entity!)", 2)
		end
	end
	if not isfunction(callback) then
		error("bad argument #2 to 'ReadStream' (function expected, got " .. type(callback) .. ")", 2)
	end

	local queue = net.Stream.ReadStreamQueues[ply]
	if queue then
		if SERVER and #queue == net.Stream.MaxServerReadStreams then
			ErrorNoHalt("Receiving too many ReadStream requests from ", ply)
			return
		end
	else
		queue = {} net.Stream.ReadStreamQueues[ply] = queue
	end

	local numchunks = net.ReadUInt(32)
	if numchunks == nil then
		return
	elseif numchunks == 0 then
		local ok, err = xpcall(callback, debug.traceback, "")
		if not ok then ErrorNoHalt(err) end
		return
	end
	if SERVER and numchunks > net.Stream.MaxServerChunks then
		ErrorNoHalt("ReadStream requests from ", ply, " is too large! ", numchunks * net.Stream.SendSize / 1048576, "MiB")
		return
	end

	local identifier = net.ReadUInt(32)
	local compressed = net.ReadBool()
	--print("Got info", numchunks, identifier, compressed)

	for _, v in ipairs(queue) do
		if v.identifier == identifier then
			ErrorNoHalt("Tried to start a new ReadStream for an already existing stream!")
			return
		end
	end

	local stream = {
		identifier = identifier,
		chunks = {},
		compressed = compressed,
		numchunks = numchunks,
		callback = callback,
		queue = queue,
		player = ply,
		downloads = 0
	}
	setmetatable(stream, net.Stream.ReadStream)

	queue[#queue + 1] = stream
	if #queue > 1 then
		timer.Create("NetStreamKeepAlive" .. identifier, net.Stream.Timeout / 2, 0, function()
			net.Start("NetStreamRequest")
			net.WriteUInt(identifier, 32)
			net.WriteBit(true)
			if CLIENT then net.SendToServer() else net.Send(ply) end
		end)
	else
		stream:Request()
	end

	return stream
end

if SERVER then

	util.AddNetworkString("NetStreamRequest")
	util.AddNetworkString("NetStreamDownload")

end

--Stream data is requested
net.Receive("NetStreamRequest", function(len, ply)

	local identifier = net.ReadUInt(32)
	local stream = net.Stream.WriteStreams[identifier]

	if stream then
		ply = ply or NULL
		local client = stream.clients[ply]

		if not client.finished then
			local keepalive = net.ReadBit() == 1
			if keepalive then
				if client.keepalives < net.Stream.MaxKeepalive then
					client.keepalives = client.keepalives + 1
					timer.Adjust("NetStreamWriteTimeout" .. identifier, net.Stream.Timeout, 1)
				end
			else
				local completed = net.ReadBit() == 1
				if completed then
					stream:Finished(ply)
				else
					if client.downloads < net.Stream.MaxTries * #stream.chunks then
						client.downloads = client.downloads + 1
						stream:Write(ply)
						timer.Adjust("NetStreamWriteTimeout" .. identifier, net.Stream.Timeout, 1)
					else
						client.finished = true
					end
				end
			end
		end
	end

end)

--Download the stream data
net.Receive("NetStreamDownload", function(len, ply)

	ply = ply or NULL
	local queue = net.Stream.ReadStreamQueues[ply]
	if queue then
		local size = net.ReadUInt(32)
		if size > 0 then
			queue[1]:Read(size)
		else
			local id = net.ReadUInt(32)
			for k, v in ipairs(queue) do
				if v.identifier == id then
					v:Remove()
					break
				end
			end
		end
	end

end)

--PATH addons/radial_menu/lua/nexus_framework/core/languages.lua:
local framework = Nexus:ClassManager("Framework")
local settings = framework:Class("Settings")
local languages = framework:Class("Languages")

languages:Add("Languages", {})
languages:Add("GetActiveLanguage", function(self)
	return settings:Call("Language")
end)
languages:Add("Register", function(self, script, language, data)
	language = language:lower()

	self:TernaryExistance("Languages", script, nil, function(self, lookup)
		lookup = {}
	end)
	self:Get("Languages")[script][language] = data
end)
languages:Add("GetTranslation", function(self, script, phrase, extraData)
	local activeLanguage = self:Call("GetActiveLanguage")

	local lookup = self:Get("Languages")[script]
	if (!lookup) then
		return "Unknown script"
	end
	local tempLookup = lookup[activeLanguage]
	lookup = lookup or lookup["english"]
	lookup = lookup[phrase] or "Unknown phrase"

	return isfunction(lookup) and lookup(self, extraData, phrase, script) or lookup
end)





--PATH addons/putin_playermodel/lua/autorun/putin_playermodel.lua:
player_manager.AddValidModel( "PUTIN", "models/player/putin.mdl" );
player_manager.AddValidHands( "PUTIN", "models/player/putin_arms.mdl", 0, "00000000" ) 
list.Set( "PlayerOptionsModel",  "PUTIN", 					"models/player/putin.mdl" )

--PATH addons/_adminmodules_menu/lua/sui/libs/tdlib/cl_tdlib.lua:
--[[
	Three's Derma Lib
	Made by Threebow

	You are free to use this anywhere you like, or sell any addons
	made using this, as long as I am properly accredited.
]]

local pairs = pairs
local ipairs = ipairs
local Color = Color
local render = render
local SysTime = SysTime
local Lerp, RealFrameTime = Lerp, RealFrameTime
local RoundedBox, RoundedBoxEx, NoTexture = draw.RoundedBox, draw.RoundedBoxEx, draw.NoTexture
local SetDrawColor, DrawRect = surface.SetDrawColor, surface.DrawRect
local DrawPoly = surface.DrawPoly
local sui = sui

local Panel = FindMetaTable("Panel")

--[[
	Constants
]]
local BLUR = CreateMaterial("SUI.TDLib.Blur", "gmodscreenspace", {
	["$basetexture"] = "_rt_fullframefb",
	["$blur"] = (1 / 3) * 7,
})

local COL_WHITE_1 = Color(255, 255, 255)
local COL_WHITE_2 = Color(255, 255, 255, 30)

--[[
	credits to http://slabode.exofire.net/circle_draw.shtml
]]
local calculate_circle do
	local cos = math.cos
	local sin = math.sin
	local round = math.Round
	local sqrt = math.sqrt
	local pi = math.pi
	calculate_circle = function(circle, x_centre, y_centre, r)
		if circle.x == x_centre and circle.y == y_centre and circle.r == r then return end

		local step = (2 * pi) / round(6 * sqrt(r))

		local i = 0
		for theta = 2 * pi, 0, -step do
			local x = x_centre + r * cos(theta)
			local y = y_centre - r * sin(theta)
			i = i + 1
			circle[i] = {
				x = x,
				y = y
			}
		end

		for i = i + 1, #circle do
			circle[i] = nil
		end

		circle.x = x_centre
		circle.y = y_centre
		circle.r = r
	end
end

--[[
void DrawArc(float cx, float cy, float r, float start_angle, float arc_angle, int num_segments)
{
	float theta = arc_angle / float(num_segments - 1);//theta is now calculated from the arc angle instead, the - 1 bit comes from the fact that the arc is open

	float tangetial_factor = tanf(theta);

	float radial_factor = cosf(theta);


	float x = r * cosf(start_angle);//we now start at the start angle
	float y = r * sinf(start_angle);

	glBegin(GL_LINE_STRIP);//since the arc is not a closed curve, this is a strip now
	for(int ii = 0; ii < num_segments; ii++)
	{
		glVertex2f(x + cx, y + cy);

		float tx = -y;
		float ty = x;

		x += tx * tangetial_factor;
		y += ty * tangetial_factor;

		x *= radial_factor;
		y *= radial_factor;
	}
	glEnd();
}
]]

local copy_color = function(color)
	return Color(color.r, color.g, color.b, color.a)
end

local color_alpha = function(color, a)
	color.a = a
	return color
end

--[[
	Collection of various utilities
]]

local TDLibUtil = {}

function TDLibUtil.DrawCircle(circle, x, y, r, color)
	calculate_circle(circle, x, y, r)

	SetDrawColor(color)
	NoTexture()
	DrawPoly(circle)
end
local DrawCircle = TDLibUtil.DrawCircle

do
	local SetMaterial = surface.SetMaterial
	local UpdateScreenEffectTexture, DrawTexturedRect, SetScissorRect = render.UpdateScreenEffectTexture, surface.DrawTexturedRect, render.SetScissorRect

	local scrW, scrH = ScrW(), ScrH()
	hook.Add("OnScreenSizeChanged", "SUI.TDLib", function()
		scrW, scrH = ScrW(), ScrH()
	end)

	function TDLibUtil.BlurPanel(s)
		local x, y = s:LocalToScreen(0, 0)

		SetDrawColor(255, 255, 255)
		SetMaterial(BLUR)

		for i = 1, 2 do
			UpdateScreenEffectTexture()
			DrawTexturedRect(x * -1, y * -1, scrW, scrH)
		end
	end

	function TDLibUtil.DrawBlur(x, y, w, h)
		SetDrawColor(255, 255, 255)
		SetMaterial(BLUR)

		SetScissorRect(x, y, x + w, y + h, true)
			for i = 1, 2 do
				UpdateScreenEffectTexture()
				DrawTexturedRect(-1, -1, scrW, scrH)
			end
		SetScissorRect(0, 0, 0, 0, false)
	end
end

local LibClasses = {}

do
	local on_funcs = {}

	function LibClasses:On(name, func)
		local old_func = self[name]

		if not old_func then
			self[name] = func
			return self
		end

		local name_2 = name .. "_funcs"

		-- we gotta avoid creating 13535035 closures
		if not on_funcs[name] then
			on_funcs[name] = function(s, a1, a2, a3, a4)
				local funcs = s[name_2]
				local i, n = 0, #funcs
				::loop::
				i = i + 1
				if i <= n then
					funcs[i](s, a1, a2, a3, a4)
					goto loop
				end
			end
		end

		if not self[name_2] then
			self[name] = on_funcs[name]
			self[name_2] = {
				old_func,
				func
			}
		else
			table.insert(self[name_2], func)
		end

		return self
	end
end

do
	local UnPredictedCurTime = UnPredictedCurTime

	local transition_func = function(s)
		local transitions = s.transitions
		local i, n = 0, #transitions
		::loop::
		i = i + 1

		if i <= n then
			local v = transitions[i]
			local name = v.name
			local v2 = s[name]
			if v.func(s) then
				if v.start_0 then
					v.start_1, v.start_0 = UnPredictedCurTime(), nil
				end

				if v2 ~= 1 then
					s[name] = Lerp((UnPredictedCurTime() - v.start_1) / v.time, v2, 1)
				end
			else
				if v.start_1 then
					v.start_0, v.start_1 = UnPredictedCurTime(), nil
				end

				if v2 ~= 0 then
					s[name] = Lerp((UnPredictedCurTime() - v.start_0) / v.time, v2, 0)
				end
			end

			goto loop
		end
	end

	function LibClasses:SetupTransition(name, time, func)
		self[name] = 0

		local transition = {
			name = name,
			time = time,
			func = func,
			start_0 = 0,
			start_1 = 0,
		}

		if self.transitions then
			for k, v in ipairs(self.transitions) do
				if v.name == name then
					self.transitions[k] = transition
					return self
				end
			end
			table.insert(self.transitions, transition)
		else
			self.transitions = {transition}
			self:On("Think", transition_func)
		end

		return self
	end
end

function LibClasses:ClearPaint()
	self.Paint = nil
	self.Paint_funcs = nil
	local SetPaintBackgroundEnabled = self.SetPaintBackgroundEnabled
	if SetPaintBackgroundEnabled then
		SetPaintBackgroundEnabled(self, false)
	end
	return self
end

function LibClasses:RoundedBox(id, r, x, y, w, h, c)
	self.colors = self.colors or {}
	local colors = self.colors

	local id_c = colors[id]
	if not id_c then
		id_c = Color(c:Unpack())
		colors[id] = id_c
	end

	sui.lerp_color(id_c, c)
	RoundedBox(r, x, y, w, h, id_c)
end

do
	local SetFGColor = Panel.SetFGColor

	local set_color = function(s, col)
		s.m_colText = col
		SetFGColor(s, col.r, col.g, col.b, col.a)
	end

	local paint = function(s)
		local col = s.sui_textcolor
		sui.lerp_color(col, s.new_col)
		set_color(s, col)
	end

	function LibClasses:TextColor(c, use_paint)
		local col = self.sui_textcolor
		if not col then
			col = Color(c:Unpack())
			self.sui_textcolor = col

			if use_paint then
				self:On("Paint", paint)
			end
		end

		if use_paint then
			self.new_col = c
		else
			sui.lerp_color(col, c)
			self:SetTextColor(col)
		end
	end
end

do
	local fade_hover_Paint = function(s, w, h)
		if s.FadeHovers ~= 0 then
			color_alpha(s.fadehover_color, s.fadehover_old_alpha * s.FadeHovers)
			if s.fadehover_radius > 0 then
				RoundedBox(s.fadehover_radius, 0, 0, w, h, s.fadehover_color)
			else
				SetDrawColor(s.fadehover_color)
				DrawRect(0, 0, w, h)
			end
		end
	end

	function LibClasses:FadeHover(color, time, radius, func)
		color = copy_color(color or COL_WHITE_2)
		self.fadehover_color = color
		self.fadehover_radius = radius or 0
		self.fadehover_old_alpha = color.a
		self:SetupTransition("FadeHovers", time or 0.8, func or TDLibUtil.HoverFunc)
		self:On("Paint", fade_hover_Paint)
		return self
	end
end

function LibClasses:BarHover(color, height, time)
	color = color or COL_WHITE_1
	height = height or 2
	time = time or 1.6
	self:SetupTransition("BarHovers", time, TDLibUtil.HoverFunc)
	self:On("Paint", function(s, w, h)
		if s.BarHovers ~= 0 then
			local bar = Round(w * s.BarHovers)
			SetDrawColor(color)
			DrawRect((w / 2) - (bar / 2), h - height, bar, height)
		end
	end)
	return self
end

do
	local paint = function(s, w, h)
		draw.RoundedBox(0, 0, 0, w, h, s.SUI_GetColor("line"))
	end

	function LibClasses:Line(dock, m1, m2, m3, m4)
		self.making_line = true

		local line = self:Add("SAM.Panel")
		line:Dock(dock or TOP)

		if self.line_margin then
			line:DockMargin(unpack(self.line_margin))
		else
			line:DockMargin(m1 or 0, m2 or 0, m3 or 0, m4 or 10)
		end

		line.no_scale = true
		line:SetTall(1)
		line.Paint = paint

		self.making_line = false
		return line
	end

	function LibClasses:LineMargin(m1, m2, m3, m4)
		self.line_margin = {m1 or 0, m2 or 0, m3 or 0, m4 or 0}
		return self
	end
end

do
	local background_Paint_1 = function(s)
		s:SetBGColor(s.background_color)
	end

	local background_Paint_2 = function(s, w, h)
		RoundedBoxEx(s.background_radius, 0, 0, w, h, s.background_color, true, true, true, true)
	end

	local background_Paint_3 = function(s, w, h)
		RoundedBoxEx(s.background_radius, 0, 0, w, h, s.background_color, s.background_r_tl, s.background_r_tr, s.background_r_bl, s.background_r_br)
	end

	function LibClasses:Background(color, radius, r_tl, r_tr, r_bl, r_br)
		self.background_color = color
		if isnumber(radius) and radius ~= 0 then
			self.background_radius = radius
			if isbool(r_tl) or isbool(r_tr) or isbool(r_bl) or isbool(r_br) then
				self.background_r_tl = r_tl
				self.background_r_tr = r_tr
				self.background_r_bl = r_bl
				self.background_r_br = r_br
				self:On("Paint", background_Paint_3)
			else
				self:On("Paint", background_Paint_2)
			end
		else
			self:SetPaintBackgroundEnabled(true)
			self:On("ApplySchemeSettings", background_Paint_1)
			self:On("PerformLayout", background_Paint_1)
		end
		return self
	end
end

function LibClasses:CircleClick(color, speed, target_radius)
	self.circle_click_color = color or COL_WHITE_2

	speed = speed or 5
	target_radius = isnumber(target_radius) and target_radius or false

	local radius, alpha, click_x, click_y = 0, -1, 0, 0
	local circle = {}
	self:On("Paint", function(s, w)
		if alpha >= 0 then
			DrawCircle(circle, click_x, click_y, radius, ColorAlpha(self.circle_click_color, alpha))
			local frame_time = RealFrameTime()
			radius, alpha = Lerp(frame_time * speed, radius, target_radius or w), Lerp(frame_time * speed, alpha, -1)
		end
	end)
	self:On("DoClick", function()
		click_x, click_y = self:CursorPos()
		radius, alpha = 0, self.circle_click_color.a
	end)
	return self
end

do
	local min = math.min
	function LibClasses:CircleClick2(color, speed, target_radius, start_radius)
		color = color or COL_WHITE_2
		local _color = Color(color:Unpack())

		speed = speed or 5
		target_radius = isnumber(target_radius) and target_radius or false

		local radius, alpha = 0, -1
		local circle = {}
		self:On("Paint", function(s, w, h)
			if alpha >= 0 then
				_color.a = alpha
				DrawCircle(circle, w / 2, h / 2, radius, _color)

				local frame_time = RealFrameTime()
				radius, alpha = Lerp(frame_time * speed, radius, target_radius or min(w, h) / 2), Lerp(frame_time * speed, alpha, -1)
			end
		end)

		self:On("DoClick", function()
			radius, alpha = start_radius or 0, color.a
		end)

		return self
	end
end

-- https://github.com/Facepunch/garrysmod/pull/1520#issuecomment-410458090
function LibClasses:Outline(color, width)
	color = color or COL_WHITE_1
	width = width or 1
	self:On("Paint", function(s, w, h)
		SetDrawColor(color)
		DrawRect(0, 0, w, width)
		DrawRect(0, h - width, w, width)
		DrawRect(0, width, width, h - (width * 2))
		DrawRect(w - width, width, width, h - (width * 2))
	end)
	return self
end

function LibClasses:LinedCorners(color, len)
	color = color or COL_WHITE_1
	len = len or 15
	self:On("Paint", function(s, w, h)
		SetDrawColor(color)
		DrawRect(0, 0, len, 1)
		DrawRect(0, 1, 1, len - 1)
		DrawRect(w - len, h - 1, len, 1)
		DrawRect(w - 1, h - len, 1, len - 1)
	end)
	return self
end

function LibClasses:SideBlock(color, size, side)
	color = color or COL_WHITE_1
	size = size or 3
	side = side or LEFT
	self:On("Paint", function(s, w, h)
		SetDrawColor(color)
		if side == LEFT then
			DrawRect(0, 0, size, h)
		elseif side == TOP then
			DrawRect(0, 0, w, size)
		elseif size == RIGHT then
			DrawRect(w - size, 0, size, h)
		elseif side == BOTTOM then
			DrawRect(0, h - size, w, size)
		end
	end)
	return self
end

function LibClasses:Blur()
	self:On("Paint", TDLibUtil.BlurPanel)
	return self
end

do
	local STENCILOPERATION_REPLACE = STENCILOPERATION_REPLACE
	local STENCILOPERATION_ZERO = STENCILOPERATION_ZERO
	local STENCILCOMPARISONFUNCTION_NEVER = STENCILCOMPARISONFUNCTION_NEVER
	local STENCILCOMPARISONFUNCTION_EQUAL = STENCILCOMPARISONFUNCTION_EQUAL

	local ClearStencil = render.ClearStencil
	local SetStencilEnable = render.SetStencilEnable
	local SetStencilWriteMask = render.SetStencilWriteMask
	local SetStencilTestMask = render.SetStencilTestMask
	local SetStencilFailOperation = render.SetStencilFailOperation
	local SetStencilPassOperation = render.SetStencilPassOperation
	local SetStencilZFailOperation = render.SetStencilZFailOperation
	local SetStencilCompareFunction = render.SetStencilCompareFunction
	local SetStencilReferenceValue = render.SetStencilReferenceValue

	local color_white = color_white

	local avatar_setplayer = function(s, ply, size)
		s.avatar:SetPlayer(ply, size)
	end

	local avatar_setsteamid = function(s, steamid, size)
		s.avatar:SetSteamID(steamid, size)
	end

	function LibClasses:CircleAvatar()
		local avatar = self:Add("AvatarImage")
		avatar:Dock(FILL)
		avatar:SetPaintedManually(true)
		self.avatar = avatar
		self.SetSteamID = avatar_setsteamid
		self.SetPlayer = avatar_setplayer

		local circle = {}
		local PaintManual = avatar.PaintManual
		self.Paint = function(s, w, h)
			ClearStencil()
			SetStencilEnable(true)

			SetStencilWriteMask(1)
			SetStencilTestMask(1)

			SetStencilFailOperation(STENCILOPERATION_REPLACE)
			SetStencilPassOperation(STENCILOPERATION_ZERO)
			SetStencilZFailOperation(STENCILOPERATION_ZERO)
			SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
			SetStencilReferenceValue(1)

			local a = w / 2
			DrawCircle(circle, a, a, a, color_white)

			SetStencilFailOperation(STENCILOPERATION_ZERO)
			SetStencilPassOperation(STENCILOPERATION_REPLACE)
			SetStencilZFailOperation(STENCILOPERATION_ZERO)
			SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
			SetStencilReferenceValue(1)

			PaintManual(avatar)

			SetStencilEnable(false)
		end
		return self
	end
end

do
	function LibClasses:AnimationThinkInternal()
		local systime = SysTime()

		if self.Term and self.Term <= systime then
			self:Remove()

			return
		end

		local m_AnimList = self.m_AnimList
		if not m_AnimList then return end

		for i = #m_AnimList, 1, -1 do
			local anim = m_AnimList[i]
			if systime >= anim.StartTime then
				local frac = math.TimeFraction(anim.StartTime, anim.EndTime, systime)
				frac = math.Clamp(frac, 0, 1)

				local Think = anim.Think
				if Think then
					Think(anim, self, frac ^ (1.0 - (frac - 0.5)))
				end

				if frac == 1 then
					local OnEnd = anim.OnEnd
					if OnEnd then
						OnEnd(anim, self)
					end

					m_AnimList[i] = nil
				end
			end
		end
	end

	local sort = function(a, b)
		return a.EndTime > b.EndTime
	end

	function LibClasses:NewAnimation(length, delay, ease, callback)
		delay = delay or 0
		ease = ease or -1

		if self.m_AnimQueue then
			delay = delay + self:AnimTail()
			self.m_AnimQueue = false
		else
			delay = delay + SysTime()
		end

		local anim = {
			StartTime = delay,
			EndTime = delay + length,
			Ease = ease,
			OnEnd = callback
		}

		self:SetAnimationEnabled(true)

		if self.m_AnimList == nil then
			self.m_AnimList = {}
		end

		table.insert(self.m_AnimList, anim)
		table.sort(self.m_AnimList, sort)

		self.AnimationThink = self.AnimationThinkInternal

		return anim
	end

	local MoveThink = function(anim, panel, frac)
		if not anim.startx then
			anim.startx = panel.x
			anim.starty = panel.y
		end

		local x = Lerp(frac, anim.startx, anim.x)
		local y = Lerp(frac, anim.starty, anim.y)
		panel:SetPos(x, y)
	end

	function LibClasses:MoveTo(x, y, length, delay, ease, callback)
		if self.x == x and self.y == y then return end

		local anim = self:NewAnimation(length, delay, ease, callback)
		anim.x = x
		anim.y = y
		anim.Think = MoveThink
	end

	local SetSize = Panel.SetSize
	local SizeThink = function(anim, panel, frac)
		if not anim.startw then
			anim.startw, anim.starth = panel:GetSize()
		end

		local w, h
		if anim.sizew and anim.sizeh then
			w = Lerp(frac, anim.startw, anim.w)
			h = Lerp(frac, anim.starth, anim.h)
			SetSize(panel, w, h)
		elseif anim.sizew then
			w = Lerp(frac, anim.startw, anim.w)
			SetSize(panel, w, panel.starth)
		else
			h = Lerp(frac, anim.starth, anim.h)
			SetSize(panel, panel.startw, h)
		end

		if panel:GetDock() > 0 then
			panel:InvalidateParent()
		end
	end

	function LibClasses:SizeTo(w, h, length, delay, ease, callback)
		local anim = self:NewAnimation(length, delay, ease, callback)

		if w ~= -1 then
			anim.sizew = true
		end

		if h ~= -1 then
			anim.sizeh = true
		end

		anim.w, anim.h = w, h
		anim.Think = SizeThink

		return anim
	end

	local SetVisible = Panel.SetVisible
	local IsVisible = Panel.IsVisible

	local is_visible = function(s)
		local state = s.visible_state
		if state ~= nil then
			return state
		else
			return IsVisible(s)
		end
	end

	function LibClasses:AnimatedSetVisible(visible, cb)
		if visible == is_visible(self) then
			if cb then
				cb()
			end
			return
		end

		if visible then
			SetVisible(self, true)
		end

		self.visible_state = visible
		self:Stop()

		self:AlphaTo(visible and 255 or 0, 0.2, 0, function()
			SetVisible(self, visible)
			self:InvalidateParent(true)
			if cb then
				cb()
			end
		end)

		self:InvalidateParent(true)
	end

	function LibClasses:AnimatedToggleVisible()
		self:AnimatedSetVisible(not is_visible(self))
	end

	function LibClasses:AnimatedIsVisible()
		return is_visible(self)
	end
end

function Panel:SUI_TDLib()
	for k, v in pairs(LibClasses) do
		self[k] = v
	end
	return self
end

TDLibUtil.Install = Panel.SUI_TDLib

local count = 0
TDLibUtil.Start = function()
	count = count + 1
	for k, v in pairs(LibClasses) do
		if not Panel["SUI_OLD" .. k] then
			local old = Panel[k]
			if old == nil then
				old = v
			end
			Panel[k], Panel["SUI_OLD" .. k] = v, old
		end
	end
end

TDLibUtil.End = function()
	count = count - 1
	if count > 0 then return end
	for k, v in pairs(LibClasses) do
		local old = Panel["SUI_OLD" .. k]
		if old == v then
			Panel[k] = nil
		else
			Panel[k] = old
		end
		Panel["SUI_OLD" .. k] = nil
	end
end

TDLibUtil.HoverFunc = function(p)
	return p:IsHovered() and not p:GetDisabled()
end

TDLibUtil.DrawOutlinedBox = function(radius, x, y, w, h, bg, outline, thickness)
	thickness = thickness or 2
	draw.RoundedBox(radius, x, y, w, h, outline)
	draw.RoundedBox(radius, x + thickness, y + thickness, w - (thickness * 2), h - (thickness * 2), bg)
end

do
	local cos, sin, sqrt = math.cos, math.sin, math.sqrt
	local clamp, floor = math.Clamp, math.floor
	local min, max = math.min, math.max

	local calc_ellipse_points = function(rx, ry)
		local points = sqrt(((rx * ry) / 2) * 6)
		return max(points, 8)
	end

	local M_PI = 3.14159265358979323846
	calc_rect = function(c, r, x, y, w, h)
		if
			(c.r == r) and
			(c.x == x and c.y == y) and
			(c.w == w and c.h == h)
		then return end

		r = clamp(r, 0, min(w, h) / 2)

		local rx, ry = r, r
		if w >= 0.02 then
			rx = min(rx, w / 2.0 - 0.01)
		end
		if h >= 0.02 then
			ry = min(ry, h / 2.0 - 0.01)
		end

		local points = max(calc_ellipse_points(rx, ry) / 4, 1)
		points = floor(points)

		local half_pi = M_PI / 2
		local angle_shift = half_pi / (points + 1)

		local phi = 0
		for i = 1, points + 2 do
			c[i] = {
				x = x + rx * (1 - cos(phi)),
				y = y + ry * (1 - sin(phi))
			}
			phi = phi + angle_shift
		end

		phi = half_pi
		for i = points + 3, 2 * (points + 2) do
			c[i] = {
				x = x + w - rx * (1 + cos(phi)),
				y = y +     ry * (1 - sin(phi))
			}
			phi = phi + angle_shift
		end

		phi = 2 * half_pi
		for i = (2 * (points + 2)) + 1, 3 * (points + 2) do
			c[i] = {
				x = x + w - rx * (1 + cos(phi)),
				y = y + h - ry * (1 + sin(phi))
			}
			phi = phi + angle_shift
		end

		phi = 3 * half_pi
		for i = (3 * (points + 2)) + 1, 4 * (points + 2) do
			c[i] = {
				x = x +     rx * (1 - cos(phi)),
				y = y + h - ry * (1 + sin(phi))
			}
			phi = phi + angle_shift
		end

		local last = (points + 2) * 4 + 1
		c[last] = c[1]

		for i = last + 1, #c do
			c[i] = nil
		end

		c.r = r
		c.x, c.y = x, y
		c.w, c.h = w, h
	end

	TDLibUtil.RoundedBox = function(c, r, x, y, w, h, color)
		calc_rect(c, r, x, y, w, h)

		SetDrawColor(color)
		NoTexture()
		DrawPoly(c)
	end
end

TDLibUtil.LibClasses = LibClasses

sui.TDLib = TDLibUtil
--PATH addons/_adminmodules_menu/lua/sui/libs/types.lua:
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

function sui.type(value)
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
		sui["is" .. name:lower()] = function(value)
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

function sui.isentity(value)
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
sui.IsEntity = sui.isentity

local type = sui.type
function sui.istable(value)
	return type(value) == "table"
end
--PATH addons/_adminmodules_menu/lua/sam/menu/cl_init.lua:
if SAM_LOADED then return end

local vgui = vgui
local draw = draw

local sam = sam
local sui = sui
local TDLib = sui.TDLib

local config = sam.config

do
	local funcs = {
		["SAM.ComboBox"] = {
			event = "OnSelect",
			function(s, _, value)
				config.set(s.config_key, value)
			end
		},
		["SAM.TextEntry"] = {
			event = "OnEnter",
			function(s)
				local v = s:GetText()
				if s:GetNumeric() then
					v = tonumber(v)
				end
				config.set(s.config_key, v)
			end
		},
		["SAM.ToggleButton"] = {
			event = "OnChange",
			function(s, v)
				config.set(s.config_key, v)
			end
		}
	}

	sam.SUI = sam.SUI or sui.new("SAM", true, {
		SetConfig = function(s, key, default)
			s.config_key = key

			local i = config.hook({key}, function(value, old)
				local v = config.get(key, default)
				s:SetValue(v)
			end)

			local t = funcs[s:GetName()]
			s[t.event] = t[1]

			s:On("OnRemove", function()
				config.remove_hook(i)
			end)
		end
	})
end

local SUI = sam.SUI
local GetColor = SUI.GetColor

sam.menu = {}

SAM_TAB_TITLE_FONT = SUI.CreateFont("TabTitle", "Roboto Bold", 22)
SAM_TAB_DESC_FONT = SUI.CreateFont("TabDesc", "Roboto Medium", 15)

local MENU_LOADING = SUI.CreateFont("MenuLoading", "Roboto", 30)

SUI.AddToTheme("Dark", {
	frame = "#181818",

	scroll_panel = "#181818",

	menu_tabs_title = "#ffffff",

	player_list_titles = "#f2f1ef",

	player_list_names = "#eeeeee",
	player_list_names_2 = "#ff6347",
	player_list_data = "#e8e8e8",

	player_list_rank = "#41b9ff",
	player_list_console = "#00c853",
	player_list_rank_text = "#2c3e50",

	player_list_steamid = "#a4a4a4",

	actions_button = Color(0, 0, 0, 0),
	actions_button_hover = Color(200, 200, 200, 60),

	actions_button_icon = "#aaaaaa",
	actions_button_icon_hover = "#ffffff",

	page_switch_bg = "#222222",
})

SUI.SetTheme("Dark")

function SUI.panels.Frame:Paint(w, h)
	if GetColor("frame_blur") then
		TDLib.BlurPanel(self)
	end

	draw.RoundedBox(8, 0, 0, w, h, GetColor("frame"))
end

function SUI.panels.Frame:HeaderPaint(w, h)
	draw.RoundedBoxEx(8, 0, 0, w, h, GetColor("header"), true, true, false, false)
	draw.RoundedBox(0, 0, h - 1, w, 1, GetColor("line"))
end


--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_combobox.lua:
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local TEXT_FONT = SUI.CreateFont("ComboBox", "Roboto Regular", 12)

local GetColor = SUI.GetColor
local draw_material = sui.draw_material

local PANEL = {}

PANEL.NoOverrideClear = true

sui.scaling_functions(PANEL)

function PANEL:Init()
	self.DropButton:Remove()
	self:SetFont("RM_16")
	self:SetSize(34, 22)
	self:SetIsMenu(true)

	local image = self:Add(NAME .. ".Image")
	image:Dock(FILL)
	image:SetImage("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sui/arrow.png")
	image.Draw = self.Paint
end

function PANEL:OpenMenu(pControlOpener)
	if pControlOpener and pControlOpener == self.TextEntry then return end
	if #self.Choices == 0 then return end

	if IsValid(self.Menu) then
		self.Menu:Remove()
		self.Menu = nil
	end

	self.Menu = vgui.Create(NAME .. ".Menu", self)
	self.Menu:SetInternal(self)

	for k, v in ipairs(self.Choices) do
		self.Menu:AddOption(v, function()
			self:ChooseOption(v, k)
		end)
	end

	local x, y = self:LocalToScreen(0, self:GetTall())
	self.Menu:SetMinimumWidth(self:GetWide())
	self.Menu:Open(x, y, false, self)
end

function PANEL:Paint(w, h, from_image)
	local text_color = GetColor("menu_option_hover_text")

	if from_image then
		local size = SUI.ScaleEven(10)
		draw_material(nil, w - (size / 2) - 6, h / 2, size, text_color)
	else
		local col = GetColor("menu")
		self:RoundedBox("Background", 4, 0, 0, w, h, col)
		self:SetTextColor(text_color)
	end
end

function PANEL:PerformLayout()
end

sui.register("ComboBox", PANEL, "DComboBox")
--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_number_slider.lua:
local surface = surface

local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local NUMBER_SLIDER_FONT = SUI.CreateFont("NumberSlider", "Roboto Regular", 14)

local PANEL = {}

sui.scaling_functions(PANEL)

function PANEL:Init()
	self:ScaleInit()

	local slider = vgui.Create(NAME .. ".Slider", self, "NumberSlider")
	slider:Dock(FILL)

	self.slider = slider

	local label = self:Add(NAME .. ".Label")
	label:Dock(RIGHT)
	label:DockMargin(3, 0, 0, 0)
	label:SetFont(NUMBER_SLIDER_FONT)
	self.label = label

	function label:Think()
		self:SetText(slider:GetValue())

		self:SizeToContents()
	end

	self:SetSize(100, 12)
	self:InvalidateLayout(true)
end

sui.register("NumberSlider", PANEL, "Panel")
--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_scroll_panel.lua:
local math = math
local table = table

local pairs = pairs
local RealFrameTime = RealFrameTime

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
	s.scroll_speed = s.scroll_speed + (14 * RealFrameTime() --[[ slowly increase scroll speed ]])
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
	local frame_time = RealFrameTime() * 14
	local scroll_target = s.scroll_target

	s.Scroll = Lerp(frame_time, s.Scroll, scroll_target)

	if not s.Dragging then
		s.scroll_target = Lerp(frame_time, scroll_target, math.Clamp(scroll_target, 0, s.CanvasSize))
	end

	-- now start slowing it down!!!
	s.scroll_speed = Lerp(frame_time / 14, s.scroll_speed, starting_scroll_speed)
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
			canvas._y = Lerp(14 * RealFrameTime(), canvas._y or canvas.y, self:GetTall() - canvas:GetTall())
		else
			canvas._y = Lerp(14 * RealFrameTime(), canvas._y or canvas.y, -vbar.Scroll)
		end
		canvas.y = canvas._y
	end
end

sui.register("ScrollPanel", Panel, "DScrollPanel")
--PATH addons/scoreboard/lua/autorun/settings.lua:

Relax = {}
Relax.Ranks = {}
Relax.Ranks["superadmin"] = {"Владелец", Color(255, 30, 30), "icon16/application_osx_terminal.png"}
Relax.Ranks["manager"] = {"Администатор", Color(255, 80, 80), "icon16/award_star_silver_2.png"}
Relax.Ranks["admin_d"] = {"Донат-Администатор", Color(255, 80, 80), "icon16/award_star_silver_2.png"}
Relax.Ranks["vip"] = {"Вип", Color(255, 80, 80), "icon16/award_star_silver_2.png"}
Relax.Ranks["moderator"] = {"Модератор", Color(30, 30, 255), "icon16/shield_add.png"}
Relax.Ranks["moderator_d"] = {"Донат модератор", Color(255, 155, 55), "icon16/award_star_gold_2.png"}
Relax.Ranks["NS-moder"] = {"Наборный модератор", Color(30, 30, 255), "icon16/shield_add.png"}
Relax.Ranks["moder"] = {"донат модератор", Color(30, 30, 255), "icon16/shield_add.png"}
Relax.Ranks["NS-admin"] = {"Наборный администратор", Color(255, 155, 55), "icon16/award_star_silver_2.png"}

Relax.Servername = "Servername"

buttons = {}

table.insert( buttons, { Title = "Открыть профиль", Func = function( pl ) pl:ShowProfile() end } )
--PATH addons/battlepass/lua/battlepass/shared/sh_battlepass_core.lua:
encbp.clrs = {
	white = Color(255,255,255),
	whitea = Color(255,255,255,127),
	graya = Color(217,217,217,10),
	black = Color(0,0,0),
	blue = Color(0,240,255),
	purple = Color(240,74,255),
}

local BP_lvl = {}
BP_lvl[0] = 0
BP_lvl[1] = 1000
BP_lvl[2] = 2000
BP_lvl[3] = 3000
BP_lvl[4] = 4000
BP_lvl[5] = 5000
BP_lvl[6] = 6000
BP_lvl[7] = 7000
BP_lvl[8] = 8000
BP_lvl[9] = 9000
BP_lvl[10] = 10000
BP_lvl[11] = 11000
BP_lvl[12] = 12000
BP_lvl[13] = 13000
BP_lvl[14] = 14000
BP_lvl[15] = 15000
BP_lvl[16] = 16000
BP_lvl[17] = 17000
BP_lvl[18] = 18000
BP_lvl[19] = 19000
BP_lvl[20] = 20000
BP_lvl[21] = 21000
BP_lvl[22] = 22000
BP_lvl[23] = 23000
BP_lvl[24] = 24000
BP_lvl[25] = 25000
BP_lvl[26] = 26000
BP_lvl[27] = 27000
BP_lvl[28] = 28000
BP_lvl[29] = 29000
BP_lvl[30] = 30000

local function formula(lvl)
	return 1000 * (1 ^ lvl)
end

local PLAYER = FindMetaTable('Player')

function PLAYER:GetBPLevel()
	return self:GetNWInt('encbp.bp.lvl')
end

function PLAYER:GetBPExp()
	return self:GetNWInt('encbp.bp.exp')
end


--PATH addons/truefishing/lua/autorun/sh_language_localisation.lua:
local Languages = {}

function TrueFishLocal(name, ...)
	return string.format(Languages[TrueFish.LOCALISATION_LANGUAGE][name], ...)
end

function TrueFishLanguages()
	return Languages
end

Languages["English"] =
{
cant_afford = "You can't afford that!",
fish_limit_reached = "You've reached your %s limit!",
fisherman_spots_full = "Can't find an empty spot near the Fisherman!",
bought_gear = "You bought %s!",
sold_fish = "You made $%s for selling your fish!",
no_water_detected = "No water detected under the cage!",
cant_find_water_surface = "Couldn't find the water surface!",
water_surface_shallow = "This is too shallow!",
carry_limit_reached = "You already have %s fishes!",
no_fish_containers_near = "There are no Fish Containers near you!",
fish_containers_full = "All the nearby Fish Containers are full!",
no_fish_bait = "You don't have any fish bait. Use some!",
didnt_catch_anything = "You didn't catch anything.",
money_bag_caught = "You caught a money bag with $%s inside!",
fish_caught = "You caught a %s!",
empty_fish_containers_near = "Can't find any empty containers near you to put fish in!",
hook_caught = "You caught something! Use(E) your hook.",
picked_up_fish_bait = "You now have %s Fish Bait.",
buoy_too_far = "Too far away from the buoy!",

fish_market = "Fish Market",
no_fish_to_sell = "You have no fish\nto sell",
reward_txt = "Reward: $%s",
price_txt = "Price: $%s",
purchase_txt = "Purchase",
fish_sells_for = "Your fish sells for $%s",
sell_all = "Sell all",
fisherman = "Fisherman",

deploy_fish_cage = "Deploy Fish Cage",
collect_fish = "Collect fish",
close_menu = "Close Menu",
untie_fish_cage = "Untie Fish Cage" ,
tie_down_fish_cage = "Tie down Fish Cage",
discard_fish = "Discard %s",
untie_fish_container = "Untie Fish Container",
tie_down_fish_container = "Tie down Fish Container",
empty_container_text = "Empty container",
retrieve_fish_cage = "Retrieve Fish Cage",

fishing_rod_phys_tip = "You can press R(Reload) to adjust the throwing strength of the fishing rod.",
throw_str = "Throw Strength",
throw_desc = "Pick how hard to throw your fishing pole. Higher number means your hook will be thrown farther away.",
fishing_hud = "Fishing",

fish_finder_no_fish = "No Fish",
fish_finder_depth_text = "Depth",

only_vip = "This gear for VIP only or greater!",
too_many_bait = "You already have maximum (%s) baits!",
not_fisher = "You need fisher job first!",
}

Languages["Russian"] =
{
cant_afford = "У вас недостаточно средств!",
fish_limit_reached = "Вы достигли лимита %s!",
fisherman_spots_full = "Не могу найти свободное место рядом с Рыбаком!",
bought_gear = "Вы купили %s!",
sold_fish = "Вы заработали $%s, продав свою рыбу!",
no_water_detected = "Под клеткой не обнаружено воды!",
cant_find_water_surface = "Не удается найти поверхность воды!",
water_surface_shallow = "Слишком мелко!",
carry_limit_reached = "У вас нету места в инвентаре!",
no_fish_containers_near = "Рядом нет контейнеров для рыбы!",
fish_containers_full = "Все ближайшие контейнеры для рыбы заполнены!",
no_fish_bait = "У вас нет наживки для рыбы. Используйте её!",
didnt_catch_anything = "Вы ничего не поймали.",
money_bag_caught = "Вы поймали мешок с деньгами, в котором было $%s!",
fish_caught = "Вы поймали %s!",
empty_fish_containers_near = "Не могу найти пустые контейнеры поблизости, чтобы положить в них рыбу!",
hook_caught = "Вы что-то поймали! Используйте(E) ваш крючок.",
picked_up_fish_bait = "Теперь у вас есть %s Наживки для рыбы.",
buoy_too_far = "Слишком далеко от буя!",
	
fish_market = "Морской рынок",
no_fish_to_sell = "У вас нет рыбы\nдля продажи",
reward_txt = "Награда: $%s",
price_txt = "Цена: $%s",
purchase_txt = "Купить",
fish_sells_for = "Ваша рыба продается за $%s",
sell_all = "Продать всё",
fisherman = "Мишаня",

deploy_fish_cage = "Развернуть Рыболовную Клетку",
collect_fish = "Собрать рыбу",
close_menu = "Закрыть Меню",
untie_fish_cage = "Отвязать Рыболовную Клетку",
tie_down_fish_cage = "Привязать Рыболовную Клетку",
discard_fish = "Выбросить %s",
untie_fish_container = "Отвязать Контейнер для Рыбы",
tie_down_fish_container = "Привязать Контейнер для Рыбы",
empty_container_text = "Пустой контейнер",
retrieve_fish_cage = "Забрать Рыболовную Клетку",

fishing_rod_phys_tip = "Вы можете нажать R(Перезарядка), чтобы отрегулировать силу броска удочки.",
throw_str = "Сила Броска",
throw_desc = "Выберите, как сильно бросить вашу удочку. Большее число означает, что крючок будет заброшен дальше.",
fishing_hud = "Рыбалка",

fish_finder_no_fish = "Рыбы нет",
fish_finder_depth_text = "Глубина",

only_vip = "Эта вещь доступна только от VIP и выше!",
too_many_bait = "У вас уже максимум (%s) наживки!",
not_fisher = "Сначала надо устроится работать рыбаком!",
}
--PATH MediaLib_DynFile_twitch.lua:
local oop = medialib.load("oop")

local TwitchService = oop.class("TwitchService", "HTMLService")
TwitchService.identifier = "twitch"

local all_patterns = {
	"https?://www.twitch.tv/([A-Za-z0-9_%-]+)",
	"https?://twitch.tv/([A-Za-z0-9_%-]+)"
}

function TwitchService:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local id = string.match(url, pattern)
		if id then
			return {id = id}
		end
	end
end

function TwitchService:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

local player_url = "https://wyozi.github.io/gmod-medialib/twitch.html?channel=%s"
function TwitchService:resolveUrl(url, callback)
	local urlData = self:parseUrl(url)
	local playerUrl = string.format(player_url, urlData.id)

	callback(playerUrl, {start = urlData.start})
end

local CLIENT_ID = "4cryixome326gh0x0j0fkulahsbdvx"

local function nameToId(name, callback)
	http.Fetch("https://api.twitch.tv/kraken/users?login=" .. name, function(b)
		local obj = util.JSONToTable(b)
		if not obj then
			callback("malformed response JSON")
			return
		end

		callback(nil, obj.users[1]._id)
	end, function()
		callback("failed HTTP request")
	end, {
		Accept = "application/vnd.twitchtv.v5+json",
		["Client-ID"] = CLIENT_ID
	})
end

local function metaQuery(id, callback)
	http.Fetch("https://api.twitch.tv/kraken/channels/" .. id, function(b)
		local obj = util.JSONToTable(b)
		if not obj then
			callback("malformed response JSON")
			return
		end

		callback(nil, obj)
	end, function()
		callback("failed HTTP request")
	end, {
		Accept = "application/vnd.twitchtv.v5+json",
		["Client-ID"] = CLIENT_ID
	})
end

function TwitchService:directQuery(url, callback)
	local urlData = self:parseUrl(url)

	nameToId(urlData.id, function(err, id)
		if err then
			callback(err)
			return
		end

		metaQuery(id, function(metaErr, meta)
			if metaErr then
				callback(metaErr)
				return
			end

			local data = {}
			data.id = urlData.id

			if meta.error then
				callback(meta.message)
				return
			else
				data.title = meta.display_name .. ": " .. meta.status
			end

			callback(nil, data)
		end)
	end)
end

return TwitchService
--PATH addons/battlepass/lua/autorun/sh_metadata.lua:
local FindMetaTable = FindMetaTable
local util_AddNetworkString = SERVER and util.AddNetworkString
local player_GetBySteamID64 = player.GetBySteamID64
local hook_Add = hook.Add
local hook_Remove = hook.Remove

metadata = metadata || {
	stored = {}
}

local stored, pcache, Sync, encode = metadata.stored, {} do
	local function Get(sid64, key, def)
		local userData = stored[sid64]
		if userData then
			return userData[key] or def
		end
		return def
	end
	local PLAYER = FindMetaTable("Player")
	function PLAYER:GetMetadata(key, def)
		-- print('GetMetadata?')
		return Get(self:SteamID64(), key, def)
	end

	metadata.Get = Get
	local net = net
	if (SERVER) then
		util_AddNetworkString("Metadata::Sync")
		local pairs, table_count = pairs, table.Count
		function Sync(ply, key, recipients)
			-- print('Sync?')
			local sid64 = ply:SteamID64()
			net.Start("Metadata::Sync")
				net.WriteString(sid64)
				net.WriteBool(key ~= nil)
				if (key) then
					net.WriteString(key)
					net.WriteType(stored[sid64][key])
				else
					net.WriteUInt(table_count(stored[sid64]), 10)
					for k, v in pairs(stored[sid64]) do
						net.WriteString(k)
						net.WriteType(v)
					end
				end
			-- net[recipients && "Send" || "Broadcast"](recipients)
			net.Send(ply)
		end

		local prepared = {
			"UPDATE `metadata` SET `value` = %s, `type` = %s WHERE `sid64` = %s AND `key` = %s",
			"INSERT INTO `metadata` VALUES(%s, %s, %s, %s)"
		}


		local isvalid = IsValid
		local function GetCachedPlayerBySteamID64(sid64)
			local ply = pcache[sid64]
			if (isvalid(ply)) then return ply end
			ply = player_GetBySteamID64(sid64)
			pcache[sid64] = ply
			return ply
		end

		local typeid, format, query, sqlstr = TypeID, Format, sql.Query, SQLStr
		local function Set(sid64, key, value, recipients, nosave)
			local ply = GetCachedPlayerBySteamID64(sid64)
			if (isvalid(ply)) then
				stored[sid64][key] = value
				Sync(ply, key, recipients)
			end

			if (nosave) then return end
			if (value == nil) then
				query("DELETE FROM `metadata` WHERE sid64 = "..sid64.." AND key = "..key)
			else
				key = sqlstr(key)
				local data, type = query("SELECT `sid64` FROM `metadata` WHERE `sid64` = "..sid64.." AND `key` = "..key), typeid(value)
				query(data && format(prepared[1], sqlstr(encode(value, type)), type, sid64, key) || format(prepared[2], sid64, key, sqlstr(encode(value, type)), type))
			end
		end

		function PLAYER:SetMetadata(key, value, recipients, nosave)
			Set(self:SteamID64(), key, value, recipients, nosave)
		end

		function metadata.Wait(ply, cback)
			if (ply.IsFullyMetadataLoaded) then return end
			if (!ply.MetadataWait) then ply.MetadataWait = {} end
			ply.MetadataWait[#ply.MetadataWait + 1] = cback
		end

		PLAYER.SyncMetadata = Sync
		metadata.Set = Set
	else
		net.Receive("Metadata::Sync", function()
			local sid64 = net.ReadString()
			if (!stored[sid64]) then stored[sid64] = {} end

			if (net.ReadBool()) then
				stored[sid64][net.ReadString()] = net.ReadType()
			else
				local stored = stored[sid64]
				for i = 1, net.ReadUInt(10) do
					stored[net.ReadString()] = net.ReadType()
				end
			end
		end)
	end
end

if (CLIENT) then return end
hook_Add("Initialize", "Metadata::Init", function()
	sql.Query[[CREATE TABLE IF NOT EXISTS `metadata`(
	`sid64` CHAR(17) NOT NULL,
	`key` TINYTEXT,
	`value` BIGTEXT,
	`type` TINYINT)]]
	--hook_Remove("Initialize", "Metadata::Init")
end)

local safety_types do
	local vector, angle, color, unpack, split, json, unjson = Vector, Angle, Color, unpack, string.Split, util.TableToJSON, util.JSONToTable
	safety_types = {
		[1] = {e = tostring, d = tobool},
		[3] = {e = tostring, d = tonumber},
		[5] = {e = json, d = unjson},
		[11] = {e = tostring,
			d = function(ang)
				return angle(unpack(split(ang, " ")))
			end
		},
		[10] = {e = tostring,
			d = function(vec)
				return vector(unpack(split(vec, " ")))
			end
		},
		[255] = {e = tostring,
			d = function(rgb)
				return color(unpack(split(rgb, " ")))
			end
		}
	}
end

function encode(value, type)
	local encoder = safety_types[type]
	return encoder && encoder.e(value) || value
end

local function decode(value, type)
	local decoder = safety_types[type]
	return decoder && decoder.d(value) || value
end

local query, pairs, tonumber, players = sql.Query, pairs, tonumber, player.GetAll
hook_Add("PlayerInitialSpawn", "Metadata::Sync", function(ply)
	local sid64 = ply:SteamID64()
	local data, nstored = query("SELECT key, value, type FROM `metadata` WHERE sid64 = "..sid64), {}
	if (!data) then goto skip end

	for k, v in pairs(data) do
		nstored[v.key] = decode(v.value, tonumber(v.type))
	end

	::skip::
	stored[sid64] = nstored
	-- PrintTable(stored[sid64])
	ply.IsFullyMetadataLoaded = true

	-- local players = players()
	-- for i = 1, #players do
		-- Sync(players[i], nil, ply)
	-- end
	Sync(ply, nil, ply)

	local mdwait = ply.MetadataWait
	if (!mdwait) then return end
	for i = 1, #mdwait do
		mdwait[i](ply)
	end

	ply.MetadataWait = nil
end)

hook_Add("PlayerDisconnected", "Metadata::Clear", function(ply)
	if (ply.IsFullyMetadataLoaded) then
		local sid64 = ply:SteamID64()
		pcache[sid64], stored[sid64] = nil, nil
	end
end)
--PATH addons/dermaf4/lua/ui/theme.lua:
local SKIN 	= {
	PrintName 	= 'SUP',
	Author 	 	= 'aStonedPenguin'
}

color_sup 			= ui.col.SUP
color_background 		= ui.col.Background
color_outline 		= ui.col.Outline
color_hover 			= ui.col.Hover
color_button 			= ui.col.Button
color_button_hover	= ui.col.ButtonHover
color_close 			= ui.col.Close
color_close_bg 		= ui.col.CloseBackground
color_close_hover 	= ui.col.CloseHovered

color_offwhite 		= ui.col.OffWhite
color_flat_black 		= ui.col.FlatBlack
color_black 			= ui.col.Black
color_white 			= ui.col.White
color_red 			= ui.col.Red

SKIN.fontFrame					= "ui.20"
SKIN.fontTab					= "ui.20"
SKIN.fontCategoryHeader			= "ui.20"
-- Frames    
function SKIN:PaintFrame(self, w, h)
	draw.Box(0, 0, w, h, Color(36, 36, 36))
	draw.Box(0, 0, w, 28, Color(23, 23, 23))
	draw.Box(1, 1, 3, 28, color_sup)
end

function SKIN:PaintPanel(self, w, h)
	if (not self.m_bBackground) then return end

	draw.Box(0, 0, w, h, Color(36, 36, 36))
end

function SKIN:PaintShadow() end

-- Buttons    
function SKIN:PaintButton(self, w, h)
	if (not self.m_bBackground) then return end

	if not self.lerptime then
		self.lerptime = SysTime() - 2
	end

	self.OnCursorEntered = function(s) self.lerptime = SysTime() end
	self.OnCursorExited = function(s) self.lerptime = SysTime() end

	local lerpbut = Lerp((SysTime() - self.lerptime) * 6, 0, h / 2)
	local colorlerp = LerpVector((SysTime() - self.lerptime) * 6, color_button:ToVector(), color_button_hover:ToVector()):ToColor()
	local colorlerpa = LerpVector((SysTime() - self.lerptime) * 6, color_button_hover:ToVector(), color_button:ToVector()):ToColor()
	if colorlerp.r > color_button_hover.r then
		colorlerp = color_button_hover
	end
	if colorlerpa.r > color_button_hover.r then
		colorlerpa = color_button_hover
	end
	if self:GetDisabled() then
		draw.Box(0, 0, w, h, color_flat_black)
	elseif (self.Active == true) then
		draw.Box(0, 0, w, h, self.BackgroundColor or color_sup)
	elseif (self.Hovered) then
		draw.Box(0, 0, w, h, color_button)
		draw.Box(0, h / 2 - lerpbut + h / 2, w, h / 2, colorlerp)
		draw.Box(0, lerpbut - h / 2, w, h / 2, colorlerp)
	else
		draw.Box(0, 0, w, h, color_button)
		draw.Box(0, lerpbut + h / 2, w, h / 2, colorlerpa)
		draw.Box(0, h / 2 - lerpbut - h / 2, w, h / 2, colorlerpa)
	end

	local colorlerptext = Lerp((SysTime() - self.lerptime) * 6, 255, 0)
	local colorlerptexta = Lerp((SysTime() - self.lerptime) * 6, 0, 255)
	self:SetTextColor((self.Hovered and (not self:GetDisabled()) and (not self.Active)) and Color(colorlerptext, colorlerptext, colorlerptext) or ((not self:GetDisabled()) and (not self.Active)) and Color(colorlerptexta, colorlerptexta, colorlerptexta) or color_white)

	if (not self.fontset) then
		self:SetFont('ui.20')
		self.fontset = true
	end
end

function SKIN:PaintPlayerButton(self, w, h)
	if self.Active then
		draw.OutlinedBox(0, 0, w, h, color_flat_black, color_outline)
		return
	else
		draw.OutlinedBox(0, 0, w, h, self.PlayerColor or color_background, color_outline)
	end

	if self:IsHovered() then
		draw.Box(0, 0, w, h, color_hover)
	end
end

function SKIN:PaintAvatarImage(self, w, h)
	if self.Hovered then
		draw.Box(0, 0, w, h, color_hover)
	end
end

function SKIN:PaintTree( self, w, h )

	if ( !self.m_bBackground ) then return end

	draw.Box(0, 0, w, h, Color(36, 36, 36))

end

function SKIN:PaintExpandButton( self, w, h )

	draw.Box(0, 0, w, h, Color(55, 55, 55))
	if ( !self:GetExpanded() ) then
		draw.SimpleText("+", "ui.16", w / 2 - 1, h / 2 - 1, Color(200, 200, 200), 1, 1)
	else
		draw.SimpleText("-", "ui.16", w / 2 - 1, h / 2 - 1, Color(200, 200, 200), 1, 1)
	end

end


-- Close Button                                               
function SKIN:PaintWindowCloseButton(self, w, h)
	if (not self.m_bBackground) then return end

	draw.Box(0, 0, w, h, (self.Hovered and color_close_hover or color_close_bg))
		
	draw.SimpleText("×", "ui.32", w / 2, h / 2, Color(200, 200, 200), 1, 1)
end

function SKIN:PaintWindowMinimizeButton( self, w, h )
	if (not self.m_bBackground ) then return end

	draw.Box(0, 0, w, h, (self.Hovered and color_button_hover or color_button))
		
	draw.SimpleText("-", "ui.32", w / 2, h / 2, Color(200, 200, 200), 1, 1)
end

function SKIN:PaintWindowMaximizeButton( self, w, h )
	if (not self.m_bBackground ) then return end

	draw.Box(0, 0, w, h, (self.Hovered and color_button_hover or color_button))
		
	draw.SimpleText("▭", "ui.32", w / 2, h / 2, Color(200, 200, 200), 1, 1)
end

-- Scrollbar
function SKIN:PaintVScrollBar(self, w, h) end

function SKIN:PaintButtonUp(self, w, h) 

end

function SKIN:PaintButtonDown(self, w, h) 
	if (not self.m_bBackground ) then return end

	draw.Box(0, 0, w, h, (self.Hovered and color_button_hover or color_button))
		
	draw.SimpleText("▭", "ui.32", w / 2, h / 2, Color(200, 200, 200), 1, 1)
end

function SKIN:PaintButtonLeft(self, w, h) 
	if (not self.m_bBackground ) then return end
		
	draw.Box(0, 0, w, h, color_button)

	draw.SimpleText("<", "ui.18", w / 2, h / 2, Color(255, 255, 255), 1, 1)
end

function SKIN:PaintButtonRight(self, w, h) 
	if (not self.m_bBackground ) then return end
		
	draw.Box(0, 0, w, h, color_button)


	draw.SimpleText(">", "ui.18", w / 2, h / 2, Color(255, 255, 255), 1, 1)
end

function SKIN:PaintScrollBarGrip(self, w, h)
	draw.Box(0, 0, w, h, color_sup)
end

function SKIN:PaintScrollPanel(self, w, h)
	draw.Box(0, 0, w, h, color_background)
end

function SKIN:PaintUIScrollBar(self, w, h)
	draw.Box(0, self.scrollButton.y, w, self.height, color_sup)
end


-- Slider
function SKIN:PaintUISlider(self, w, h)
	SKIN:PaintPanel(self, w, h)
	draw.Box(1, 1, self:GetValue() * w - self:GetValue() * 16, h - 2, color_sup)
end

function SKIN:PaintSliderButton(self, w, h)
	draw.RoundedBox(32, 0, 0, w, h, ui.col.Outline)
end


-- Text Entry
function SKIN:PaintTextEntry(self, w, h)
	draw.Box(0, 0, w, h, color_offwhite)

	self:DrawTextEntryText(color_black, color_sup, color_black)
end


-- List View
function SKIN:PaintUIListView(self, w, h) 
	draw.Box(0, 0, w, h, color_offwhite)
end


function SKIN:PaintListView(self, w, h) 
	--draw.Box(0, 0, w, h, color_offwhite)
end

function SKIN:PaintListViewLine(self, w, h) -- todo, just make a new control and never use this
	if self.m_bAlt then
		draw.Box(0, 0, w, h, (self:IsSelected() or self:IsHovered()) and color_sup or color_hover)
	else
		draw.Box(0, 0, w, h, (self:IsSelected() or self:IsHovered()) and color_sup or color_background)
	end

	for k, v in ipairs(self.Columns) do
		if (self:IsSelected() or self:IsHovered()) then
			v:SetTextColor(color_black)
			v:SetFont('ui.20')
		else
			v:SetTextColor(color_white)
			v:SetFont('ui.17')
		end
	end
end


-- Checkbox
function SKIN:PaintCheckBox(self, w, h)
	draw.OutlinedBox(0, 0, w, h, color_background, Color(46, 46, 46))

	if self:GetChecked() then 
		--draw.Box(4, 4, w - 8, h - 8, color_sup)
		draw.SimpleText("✓", "ui.14", w / 2, h / 2 - 1, Color(0, 255, 0), 1, 1)
	else
		draw.SimpleText("❌", "ui.14", w / 2 - 1, h / 2 - 2, Color(255, 0, 0), 1, 1)
	end
end


-- Tabs
function SKIN:PaintTabButton(self, w, h)
	if not self.lerptime then
		self.lerptime = SysTime() - 2
	end

	draw.Box(0, 0, w, h, Color(46, 46, 46))

	self:SetTextColor(color_white)

	self.OnCursorEntered = function(s) self.lerptime = SysTime() end
	self.OnCursorExited = function(s) self.lerptime = SysTime() end

	local lerpbut = Lerp( (SysTime() - self.lerptime) * 8, 0, 6 )
	local lerpbuta = Lerp( (SysTime() - self.lerptime) * 8, 6, 0 )
	if self.Hovered then
		draw.Box(1, 1, lerpbut, h - 2, color_sup)
		draw.Box(w - lerpbut, 1, lerpbut, h - 2, color_sup)
	elseif self.Active then
		draw.Box(1, 1, 3, h - 2, color_sup)
		draw.Box(w - 3, 1, 6, h - 2, color_sup)
	else
		draw.Box(1, 1, lerpbuta, h - 2, color_sup)
		draw.Box(w - lerpbuta, 1, lerpbuta, h - 2, color_sup)
	end
end

function SKIN:PaintTabListPanel(self, w, h)
	draw.Box(150, 0, w - 150, h, color_background)
end


-- ComboBox
function SKIN:PaintComboBox(self, w, h)
	if IsValid(self.Menu) and (not self.Menu.SkinSet) then
		self.Menu:SetSkin('SUP')
		self.Menu.SkinSet = true
	end

	self:SetTextColor(((self.Hovered or self.Depressed or self:IsMenuOpen()) and color_black or color_white))

	draw.Box(0, 0, w, h, ((self.Hovered or self.Depressed or self:IsMenuOpen()) and color_button_hover or color_background))
end

function SKIN:PaintComboDownArrow(self, w, h)
	draw.SimpleText("▼", "ui.14", w / 2, h / 2, Color(255, 255, 255), 1, 1)
end

function SKIN:PaintCollapsibleCategory( panel, w, h )

	if ( h <= panel:GetHeaderHeight() ) then
		--self.tex.CategoryList.Header( 0, 0, w, h )
		draw.Box(0, 0, w, h, Color(75, 75, 75))

		-- Little hack, draw the ComboBox's dropdown arrow to tell the player the category is collapsed and not empty
		--if ( !panel:GetExpanded() ) then self.tex.Input.ComboBox.Button.Down( w - 18, h / 2 - 8, 15, 15 ) end
		return
	end

	--self.tex.CategoryList.InnerH( 0, 0, w, panel:GetHeaderHeight() )
	--self.tex.CategoryList.Inner( 0, panel:GetHeaderHeight(), w, h - panel:GetHeaderHeight() )

	draw.Box(0, 0, w, panel:GetHeaderHeight(), Color(36, 36, 36))
	draw.Box(0, panel:GetHeaderHeight(), w, h - panel:GetHeaderHeight() , Color(50, 50, 50))

end

function SKIN:PaintCategoryList( panel, w, h )

	--self.tex.CategoryList.Outer( 0, 0, w, h, panel:GetBackgroundColor() )

	draw.Box(0, 0, w, h, Color(36, 36, 36))

end

function SKIN:PaintTreeNodeButton( panel, w, h )

	if ( !panel.m_bSelected ) then return end

	-- Don't worry this isn't working out the size every render
	-- it just gets the cached value from inside the Label
	local w, _ = panel:GetTextSize()

	draw.Box(38, 0, w + 6, h, Color(55, 55, 55))

end

-- DMenu
function SKIN:PaintMenu(self, w, h)
	draw.Box(0, 0, w, h, Color(26, 26, 26))
end

function SKIN:PaintMenuOption(self, w, h)
	if (not self.FontSet) then
		self:SetFont('ui.22')
		self:SetTextInset(5, 0)
		self.FontSet = true
	end
	
	self:SetTextColor(color_white)

	draw.Box(0, 0, w, h + 1, Color(26, 26, 26))
	
	if self.m_bBackground and (self.Hovered or self.Highlight) then
		draw.Box(0, 0, w, h + 1, Color(66, 66, 66))
	end
end


-- DPropertySheet
function SKIN:PaintPropertySheet(self, w, h)
	draw.Box(0, self:GetActiveTab():GetTall(), w, h - self:GetActiveTab():GetTall(), Color(36, 36, 36))
end

function SKIN:PaintTab(self, w, h)
	local active = self:GetPropertySheet():GetActiveTab() == self
	
	if (active) then
		self:SetTextColor(color_white)
		draw.Box(0, 0, w, h, Color(36, 36, 36))
	elseif (self:IsHovered()) then
		self:SetTextColor(color_white)
		draw.Box(0, 0, w, h, Color(color_outline.r + 15, color_outline.g + 15, color_outline.b + 15))
	else
		self:SetTextColor(color_white)
		draw.Box(0, 0, w, h, Color(color_outline.r - 40, color_outline.g - 40, color_outline.b - 40))
	end
end

derma.DefineSkin('SUP', 'SUP\'s derma skin', SKIN)
--PATH addons/dermaf4/lua/ui/controls/panel.lua:
local PANEL = {}

Derma_Hook(PANEL, 'Paint', 'Paint', 'Panel')

function PANEL:DockToFrame()
	local p = self:GetParent()
	local x, y = p:GetDockPos()
	self:SetPos(x, y)
	self:SetSize(p:GetWide() - 10, p:GetTall() - (y + 5))
end

vgui.Register('ui_panel', PANEL, 'Panel')
--PATH addons/_adminmodules/lua/ulib/cl_init.lua:
ULib = ULib or {} -- Init table

include( "ulib/shared/defines.lua" )
include( "ulib/shared/misc.lua" )
include( "ulib/shared/util.lua" )
include( "ulib/shared/hook.lua" )
include( "ulib/shared/tables.lua" )
include( "ulib/client/commands.lua" )
include( "ulib/shared/messages.lua" )
include( "ulib/shared/player.lua" )
include( "ulib/client/cl_util.lua" )
include( "ulib/client/draw.lua" )
include( "ulib/shared/commands.lua" )
include( "ulib/shared/sh_ucl.lua" )
include( "ulib/shared/plugin.lua" )
include( "ulib/shared/cami_global.lua" )
include( "ulib/shared/cami_ulib.lua" )

--Shared modules
local files = file.Find( "ulib/modules/*.lua", "LUA" )
if #files > 0 then
	for _, file in ipairs( files ) do
		-- Msg( "[ULIB] Loading SHARED module: " .. file .. "\n" )
		include( "ulib/modules/" .. file )
	end
end

--Client modules
local files = file.Find( "ulib/modules/client/*.lua", "LUA" )
if #files > 0 then
	for _, file in ipairs( files ) do
		-- Msg( "[ULIB] Loading CLIENT module: " .. file .. "\n" )
		include( "ulib/modules/client/" .. file )
	end
end

local needs_auth = {}

local function onEntCreated( ent )
	if ent:IsPlayer() and needs_auth[ ent:UserID() ] then
		hook.Call( ULib.HOOK_UCLAUTH, _, ent ) -- Because otherwise the server might call this before the player is created
		needs_auth[ ent:UserID() ] = nil
	end
end
hook.Add( "OnEntityCreated", "ULibPlayerAuthCheck", onEntCreated, HOOK_MONITOR_HIGH ) -- Listen for player creations

local function onInitPostEntity()
	if LocalPlayer():IsValid() then
		hook.Call( ULib.HOOK_LOCALPLAYERREADY, _, LocalPlayer() )
		RunConsoleCommand( "ulib_cl_ready" )
	end
end
hook.Add( "InitPostEntity", "ULibLocalPlayerReady", onInitPostEntity, HOOK_MONITOR_HIGH ) -- Flag server when LocalPlayer() should be valid

-- We're trying to make sure that the player auths after the player object is created, this function is part of that check
function authPlayerIfReady( ply, userid )
	if ply and ply:IsValid() then
		hook.Call( ULib.HOOK_UCLAUTH, _, ply ) -- Call hook
	else
		needs_auth[ userid ] = true
	end
end

--PATH addons/_adminmodules/lua/ulib/client/cl_util.lua:
--[[
	Title: Utilities

	Some client-side utilties
]]

local function ULibRPC()
	local fn_string = net.ReadString()
	local args = net.ReadTable()
	local success, fn = ULib.findVar( fn_string )
	if not success or type( fn ) ~= "function" then return error( "Received bad RPC, invalid function (" .. tostring( fn_string ) .. ")!" ) end

	-- Since the table length operator can't always be trusted if there are holes in it, find the length by ourself
	local max = 0
	for k, v in pairs( args ) do
		local n = tonumber( k )
		if n and n > max then
			max = n
		end
	end

	fn( unpack( args, 1, max ) )
end
net.Receive( "URPC", ULibRPC )


--[[
	Function: umsgRcv

	Receive a umsg sent by ULib.umsgSend

	Parameters:

		um - The user message object

	Returns:

		The variable from the umsg.
]]
function ULib.umsgRcv( um, control )
	local tv = control or um:ReadChar()

	local ret -- Our return value
	if tv == ULib.TYPE_STRING then
		ret = um:ReadString()
	elseif tv == ULib.TYPE_FLOAT then
		ret = um:ReadFloat()
	elseif tv == ULib.TYPE_SHORT then
		ret = um:ReadShort()
	elseif tv == ULib.TYPE_LONG then
		ret = um:ReadLong()
	elseif tv == ULib.TYPE_BOOLEAN then
		ret = um:ReadBool()
	elseif tv == ULib.TYPE_ENTITY then
		ret = um:ReadEntity()
	elseif tv == ULib.TYPE_VECTOR then
		ret = um:ReadVector()
	elseif tv == ULib.TYPE_ANGLE then
		ret = um:ReadAngle()
	elseif tv == ULib.TYPE_CHAR then
		ret = um:ReadChar()
	elseif tv == ULib.TYPE_TABLE_BEGIN then
		ret = {}
		while true do -- Yes an infite loop. We have a break inside.
			local key = ULib.umsgRcv( um )
			if key == nil then break end -- Here's our break
			ret[ key ] = ULib.umsgRcv( um )
		end
	elseif tv == ULib.TYPE_TABLE_END then
		return nil
	elseif tv == ULib.TYPE_NIL then
		return nil
	else
		ULib.error( "Unknown type passed to umsgRcv - " .. tv )
	end

	return ret
end

-- local cvarinfo = {} -- Stores the client cvar object indexed by name of the server cvar
-- local reversecvar = {} -- Stores the name of server cvars indexed by the client cvar

-- -- When our client side cvar is changed, notify the server to change it's cvar too.
-- local function clCvarChanged( cl_cvar, oldvalue, newvalue )
	-- if not reversecvar[ cl_cvar ] then -- Error
		-- return
	-- elseif reversecvar[ cl_cvar ].ignore then -- ignore
		-- reversecvar[ cl_cvar ].ignore = nil
		-- return
	-- end

	-- local sv_cvar = reversecvar[ cl_cvar ].sv_cvar
	-- RunConsoleCommand( "ulib_update_cvar", sv_cvar, newvalue )
-- end

-- This is the counterpart to <replicatedWithWritableCvar>. See that function for more info. We also add callbacks from here.
local function readCvar()
	local sv_cvar = net.ReadString()
	local cl_cvar = net.ReadString()
	local default_value = net.ReadString()
	local current_value = net.ReadString()

	cvarinfo[ sv_cvar ] = GetConVar( cl_cvar ) or CreateClientConVar( cl_cvar, default_value, false, false ) -- Make sure it's created one way or another (second case is most common)
	reversecvar[ cl_cvar ] = { sv_cvar=sv_cvar }

	ULib.queueFunctionCall( function() -- Queued to ensure we don't overload the client console
		hook.Call( ULib.HOOK_REPCVARCHANGED, _, sv_cvar, cl_cvar, nil, nil, current_value )
		if cvarinfo[ sv_cvar ]:GetString() ~= current_value then
			reversecvar[ cl_cvar ].ignore = true -- Flag so hook doesn't do anything. Flag is removed at hook.
			RunConsoleCommand( cl_cvar, current_value )
		end
	end )

	cvars.AddChangeCallback( cl_cvar, clCvarChanged )
end

net.Receive( "ulib_repWriteCvar", readCvar)

-- -- This is called when they've attempted to change a cvar they don't have access to.
-- local function changeCvar()
	-- local ply = net.ReadEntity()
	-- local cl_cvar = net.ReadString()
	-- local oldvalue = net.ReadString()
	-- local newvalue = net.ReadString()
	-- local changed = oldvalue ~= newvalue

	-- if not reversecvar[ cl_cvar ] then -- Error!
		-- return
	-- end

	-- local sv_cvar = reversecvar[ cl_cvar ].sv_cvar

	-- ULib.queueFunctionCall( function() -- Queued so we won't overload the client console and so that changes are always going to be called via the hook AFTER the initial hook is called
		-- if changed then
			-- hook.Call( ULib.HOOK_REPCVARCHANGED, _, sv_cvar, cl_cvar, ply, oldvalue, newvalue )
		-- end

		-- if GetConVarString( cl_cvar ) ~= newvalue then
			-- reversecvar[ cl_cvar ].ignore = true -- Flag so hook doesn't do anything. Flag is removed at hook.
			-- RunConsoleCommand( cl_cvar, newvalue)
		-- end
	-- end )
-- end
-- net.Receive( "ulib_repChangeCvar", changeCvar)

--PATH addons/_adminmodules/lua/ulib/shared/sh_ucl.lua:
--[[
	Title: Shared UCL

	Shared UCL stuff.
]]

--[[
	Table: ucl

	Holds all of the ucl variables and functions
]]
ULib.ucl = ULib.ucl or {}
local ucl = ULib.ucl -- Make it easier for us to refer to

-- Setup!
ucl.groups = ucl.groups or {} -- Stores allows, inheritance, and custom addon info keyed by group name
ucl.users = ucl.users or {} -- Stores allows, denies, group, and last seen name keyed by user id (steamid, ip, whatever)
ucl.authed = ucl.authed or {} -- alias to ucl.users subtable for player if they have an entry, otherwise a "guest" entry. Keyed by uniqueid.
-- End setup

--[[
	Function: ucl.query

	This function is used to see if a user has access to a command.

	Parameters:

		ply - The player to check access for
		access - The access string to check for. (IE "ulx slap", doesn't have to be a command though). If nil is passed in, this always
			returns true.
		hide - *(Optional, defaults to false)* Normally, a listen host is automatically given access to everything.
			Set this to true if you want to treat the listen host as a normal user. (Will be denied commands that no one has access to)

	Returns:

		A bool signifying whether or not they have access.

	Revisions:
		v2.40 - Rewrite.
]]
function ucl.query( ply, access, hide )
	if SERVER and (not ply:IsValid() or (not hide and ply:IsListenServerHost())) then return true end -- Grant full access to server host.
	if access == nil then return true end
	-- if ply:IsBot() then return false end -- Bots have no access!

	access = access:lower()

	local unique_id = ply:UniqueID()
	if CLIENT and game.SinglePlayer() then
		unique_id = "1" -- Fix garry's bug
	end

	if not ucl.authed[ unique_id ] then return error( "[ULIB] Unauthed player" ) end -- Sanity check
	local playerInfo = ucl.authed[ unique_id ]

	-- First check the player's info
	if table.HasValue( playerInfo.deny, access ) then return false end -- Deny overrides all else
	if table.HasValue( playerInfo.allow, access ) then return true end
	if playerInfo.allow[ access ] then return true, playerInfo.allow[ access ] end -- Access tag

	-- Now move onto groups and group inheritance
	local group = ply:GetUserGroup()
	while group do -- While group is not nil
		local groupInfo = ucl.groups[ group ]
		if not groupInfo then return error( "[ULib] Player " .. ply:Nick() .. " has an invalid group (" .. group .. "), aborting. Please be careful when modifying the ULib files!" ) end
		if table.HasValue( groupInfo.allow, access ) then return true end
		if groupInfo.allow[ access ] then return true, groupInfo.allow[ access ] end

		group = ucl.groupInheritsFrom( group )
	end

	-- No specific instruction, assume they don't have access.
	return nil
end


--[[
	Function: ucl.groupInheritsFrom

	This function is used to see if a specified group is inheriting from another

	Parameters:

		group - The group to check inheritance on. Must be a valid group.

	Returns:

		The group this group is inheriting from or nil (everything implicity inherits from "user", "user" inherits from nil).

	Revisions:

		v2.40 - Initial.
]]
function ucl.groupInheritsFrom( group )
	if not ucl.groups[ group ] then return false end

	if group == ULib.ACCESS_ALL then -- Force this to inherit from nil
		return nil
	elseif not ucl.groups[ group ].inherit_from or ucl.groups[ group ].inherit_from == "" then
		return ULib.ACCESS_ALL
	else
		return ucl.groups[ group ].inherit_from
	end
end


--[[
	Function: ucl.getInheritanceTree

	This function returns a tree-like structure representing the group inheritance architecture.

	Returns:

		The inheritance tree.

	Example return:

		:PrintTable( ULib.ucl.getInheritanceTree() )
		:user:
		:	trusted:
		:		members:
		:	thedumbones:
		:	admin:
		:		superadmin:
		:		serverowner:
		:		clanowner:
		:	respected:

	Revisions:

		v2.40 - Initial
]]
function ucl.getInheritanceTree()
	local inherits = { [ULib.ACCESS_ALL]={} }
	local find = { [ULib.ACCESS_ALL]=inherits[ULib.ACCESS_ALL] }
	for group, _ in pairs( ucl.groups ) do
		if group ~= ULib.ACCESS_ALL then
			local inherits_from = ucl.groupInheritsFrom( group )
			if not inherits_from then inherits_from = ULib.ACCESS_ALL end

			find[ inherits_from ] = find[ inherits_from ] or {} -- Use index if it exists, otherwise create one for this group
			find[ group ] = find[ group ] or {} -- If someone's created our index, use it. Otherwise, create one.
			find[ inherits_from ][ group ] = find[ group ]
		end
	end

	return inherits
end


--[[
	Function: ucl.getGroupCanTarget

	Gets what a group is allowed to target in the UCL.

	Parameters:

		group - A string of the group name. (IE: superadmin)

	Returns:

		The string of who they're allowed to target (IE: !%admin) or nil if there's no restriction.

	Revisions:

		v2.40 - Initial.
]]
function ucl.getGroupCanTarget( group )
	ULib.checkArg( 1, "ULib.ucl.getGroupCanTarget", "string", group )
	if not ucl.groups[ group ] then return error( "Group does not exist (" .. group .. ")", 2 ) end

	return ucl.groups[ group ].can_target
end

-- Client init stuff
if CLIENT then
	function ucl.initClientUCL( authed, groups )
		ucl.authed = authed
		ucl.groups = groups
		for name, data in pairs( groups ) do
			if not ULib.findInTable( {"superadmin", "admin", "user"}, name ) then
				inherit_from = data.inherit_from or "user"
				CAMI.RegisterUsergroup( {Name=name, Inherits=inherit_from}, CAMI.ULX_TOKEN )
			end
		end
	end
end

------------------
--//Meta hooks//--
------------------
local meta = FindMetaTable( "Player" )
if not meta then return end


--[[
	Function: Player:query

	This is an alias of ULib.ucl.query()
]]
function meta:query( access, hide )
	return ULib.ucl.query( self, access, hide )
end


local origIsAdmin = meta.IsAdmin
--[[
	Function: Player:IsAdmin

	Overwrite garry's IsAdmin function to check for membership in admin group. This is so if group "serverowner"
	inherits from admin, this function will still return true when checking on a member belonging to the
	"serverowner" group.

	Returns:

		True is the user belongs in the admin group directly or indirectly, false otherwise.

	Revisions:

		v2.40 - Rewrite.
]]
function meta:IsAdmin()
	if ucl.groups[ ULib.ACCESS_ADMIN ] then
		return self:CheckGroup( ULib.ACCESS_ADMIN )
	else -- Group doesn't exist, fall back on garry's method
		origIsAdmin( self )
	end
end


local origIsSuperAdmin = meta.IsSuperAdmin
--[[
	Function: Player:IsSuperAdmin

	Overwrite garry's IsSuperAdmin function to check for membership in superadmin group. This is so if group "serverowner"
	inherits from superadmin, this function will still return true when checking on a member belonging to the
	"serverowner" group.

	Returns:

		True is the user belongs in the superadmin group directly or indirectly, false otherwise.

	Revisions:

		v2.40 - Rewrite.
]]
function meta:IsSuperAdmin()
	if ucl.groups[ ULib.ACCESS_SUPERADMIN ] then
		return self:CheckGroup( ULib.ACCESS_SUPERADMIN )
	else -- Group doesn't exist, fall back on garry's method
		origIsSuperAdmin( self )
	end
end


--[[
	Function: Player:GetUserGroup

	This should have been included with garrysmod by default, so ULib is creating it for us.

	Returns:

		The group the player belongs to.

	Revisions:

		v2.40 - Initial.
]]
function meta:GetUserGroup()
	if not self:IsValid() then return "" end -- Not a valid player

	local uid = self:UniqueID()
	if CLIENT and game.SinglePlayer() then
		uid = "1" -- Fix garry's bug
	end
	if not ucl.authed[ uid ] then return "" end
	return ucl.authed[ uid ].group or "user"
end


--[[
	Function: Player:CheckGroup

	This function is similar to IsUserGroup(), but this one checks the UCL group chain as well.
	For example, if a user is in group "superadmin" which inherits from "admin", this function
	will return true if you check the user against "admin", where IsUserGroup() wouldn't.

	Parameters:

		group - The group you want to check a player's membership in.

	Returns:

		A boolean stating whether they have membership in the group or not.

	Revisions:

		v2.40 - Initial.
]]
function meta:CheckGroup( group_check )
	if not ucl.groups[ group_check ] then return false end
	local group = self:GetUserGroup()
	while group do
		if group == group_check then return true end
		group = ucl.groupInheritsFrom( group )
	end

	return false
end

--PATH addons/_adminmodules/lua/ulx/sh_base.lua:
local ulxBuildNumURL = ulx.release and "https://teamulysses.github.io/ulx/ulx.build" or "https://raw.githubusercontent.com/TeamUlysses/ulx/master/ulx.build"
ULib.registerPlugin{
	Name          = "ULX",
	Version       = string.format( "%.2f", ulx.version ),
	IsRelease     = ulx.release,
	Author        = "Team Ulysses",
	URL           = "http://ulyssesmod.net",
	WorkshopID    = 557962280,
	BuildNumLocal         = tonumber(ULib.fileRead( "ulx.build" )),
	BuildNumRemoteURL      = ulxBuildNumURL,
	--BuildNumRemoteReceivedCallback = nil
}

function ulx.getVersion() -- This function will be removed in the future
	return ULib.pluginVersionStr( "ULX" )
end

local ulxCommand = inheritsFrom( ULib.cmds.TranslateCommand )

function ulxCommand:logString( str )
	Msg( "Warning: <ulx command>:logString() was called, this function is being phased out!\n" )
end

function ulxCommand:oppositeLogString( str )
	Msg( "Warning: <ulx command>:oppositeLogString() was called, this function is being phased out!\n" )
end

function ulxCommand:help( str )
	self.helpStr = str
end

function ulxCommand:getUsage( ply )
	local str = self:superClass().getUsage( self, ply )

	if self.helpStr or self.say_cmd or self.opposite then
		str = str:Trim() .. " - "
		if self.helpStr then
			str = str .. self.helpStr
		end
		if self.helpStr and self.say_cmd then
			str = str .. " "
		end
		if self.say_cmd then
			str = str .. "(say: " .. self.say_cmd[1] .. ")"
		end
		if self.opposite and (self.helpStr or self.say_cmd) then
			str = str .. " "
		end
		if self.opposite then
			str = str .. "(opposite: " .. self.opposite .. ")"
		end
	end

	return str
end

ulx.cmdsByCategory = ulx.cmdsByCategory or {}
function ulx.command( category, command, fn, say_cmd, hide_say, nospace, unsafe )
	if type( say_cmd ) == "string" then say_cmd = { say_cmd } end
	local obj = ulxCommand( command, fn, say_cmd, hide_say, nospace, unsafe )
	obj:addParam{ type=ULib.cmds.CallingPlayerArg }
	ulx.cmdsByCategory[ category ] = ulx.cmdsByCategory[ category ] or {}
	for cat, cmds in pairs( ulx.cmdsByCategory ) do
		for i=1, #cmds do
			if cmds[i].cmd == command then
				table.remove( ulx.cmdsByCategory[ cat ], i )
				break
			end
		end
	end
	table.insert( ulx.cmdsByCategory[ category ], obj )
	obj.category = category
	obj.say_cmd = say_cmd
	obj.hide_say = hide_say
	return obj
end

local function cc_ulx( ply, command, argv )
	local argn = #argv

	if argn == 0 then
		ULib.console( ply, "No command entered. If you need help, please type \"ulx help\" in your console." )
	else
		-- TODO, need to make this cvar hack actual commands for sanity and autocomplete
		-- First, check if this is a cvar and they just want the value of the cvar
		local cvar = ulx.cvars[ argv[ 1 ]:lower() ]
		if cvar and not argv[ 2 ] then
			ULib.console( ply, "\"ulx " .. argv[ 1 ] .. "\" = \"" .. GetConVarString( "ulx_" .. cvar.cvar ) .. "\"" )
			if cvar.help and cvar.help ~= "" then
				ULib.console( ply, cvar.help .. "\n  CVAR generated by ULX" )
			else
				ULib.console( ply, "  CVAR generated by ULX" )
			end
			return
		elseif cvar then -- Second, check if this is a cvar and they specified a value
			local args = table.concat( argv, " ", 2, argn )
			if ply:IsValid() then
				-- Workaround: gmod seems to choke on '%' when sending commands to players.
				-- But it's only the '%', or we'd use ULib.makePatternSafe instead of this.
				ply:ConCommand( "ulx_" .. cvar.cvar .. " \"" .. args:gsub( "(%%)", "%%%1" ) .. "\"" )
			else
				cvar.obj:SetString( argv[ 2 ] )
			end
			return
		end
		ULib.console( ply, "Invalid command entered. If you need help, please type \"ulx help\" in your console." )
	end
end
ULib.cmds.addCommand( "ulx", cc_ulx )

function ulx.help( ply )
	ULib.console( ply, "ULX Help:" )
	ULib.console( ply, "If a command can take multiple targets, it will usually let you use the keywords '*' for target" )
	ULib.console( ply, "all, '^' to target yourself, '@' for target your picker, '$<userid>' to target by ID (steamid," )
	ULib.console( ply, "uniqueid, userid, ip), '#<group>' to target users in a specific group, and '%<group>' to target" )
	ULib.console( ply, "users with access to the group (inheritance counts). IE, ulx slap #user slaps all players who are" )
	ULib.console( ply, "in the default guest access group. Any of these keywords can be preceded by '!' to negate it." )
	ULib.console( ply, "EG, ulx slap !^ slaps everyone but you." )
	ULib.console( ply, "You can also separate multiple targets by commas. IE, ulx slap bob,jeff,henry.")
	ULib.console( ply, "All commands must be preceded by \"ulx \", ie \"ulx slap\"" )
	ULib.console( ply, "\nCommand Help:\n" )

	for category, cmds in pairs( ulx.cmdsByCategory ) do
		local lines = {}
		for _, cmd in ipairs( cmds ) do
			local tag = cmd.cmd
			if cmd.manual then tag = cmd.access_tag end
			if ULib.ucl.query( ply, tag ) then
				local usage
				if not cmd.manual then
					usage = cmd:getUsage( ply )
				else
					usage = cmd.helpStr
				end
				table.insert( lines, string.format( "\to %s %s", cmd.cmd, usage:Trim() ) )
			end
		end

		if #lines > 0 then
			table.sort( lines )
			ULib.console( ply, "\nCategory: " .. category )
			for _, line in ipairs( lines ) do
				ULib.console( ply, line )
			end
			ULib.console( ply, "" ) -- New line
		end
	end


	ULib.console( ply, "\n-End of help\nULX version: " .. ULib.pluginVersionStr( "ULX" ) .. "\n" )
end


function ulx.dumpTable( t, indent, done )
	done = done or {}
	indent = indent or 0
	local str = ""

	for k, v in pairs( t ) do
		str = str .. string.rep( "\t", indent )

		if type( v ) == "table" and not done[ v ] then
			done[ v ] = true
			str = str .. tostring( k ) .. ":" .. "\n"
			str = str .. ulx.dumpTable( v, indent + 1, done )

		else
			str = str .. tostring( k ) .. "\t=\t" .. tostring( v ) .. "\n"
		end
	end

	return str
end

function ulx.uteamEnabled()
	return ULib.isSandbox() and GAMEMODE.Name ~= "DarkRP"
end

--PATH addons/_adminmodules/lua/ulx/modules/sh/propmodule.lua:
CATEGORY_NAME = "Управление пропами"
function ulx.cleanupall( calling_ply )

	for k, v in player.Iterator() do
		v:SendLua([[ LocalPlayer():ConCommand("gmod_cleanup") ]])
	end
	ulx.fancyLogAdmin( calling_ply, "#A Удалил пропы всех игроков !" )
	
end
local cleanupall = ulx.command(CATEGORY_NAME, "ulx cleanupall", ulx.cleanupall, "!cleanupall" )
cleanupall:defaultAccess( ULib.ACCESS_ADMIN )
cleanupall:help( "Удалить все пропы игроков на сервере." )

function ulx.cleanprops(calling_ply,target_ply)
	target_ply:SendLua([[ LocalPlayer():ConCommand("gmod_cleanup") ]])
    
    ulx.fancyLogAdmin( calling_ply, "#A очистил пропы игрока #T", target_ply )
	
	tblCountcleanprops = tblCountcleanprops or {}
    tblCountcleanprops[calling_ply] = tblCountcleanprops[calling_ply] and tblCountcleanprops[calling_ply] or 0
    tblCountcleanprops[calling_ply] = tblCountcleanprops[calling_ply] + 1
	
    if tblCountcleanprops and tblCountcleanprops[calling_ply] > 4 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"cleanprops")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountcleanprops") then
		timer.Create(calling_ply:UserID().."tblCountcleanprops",60,1, function()  
			tblCountcleanprops[calling_ply] = nil
		end)
	end
	
	
end
local cleanprops = ulx.command( CATEGORY_NAME , "ulx cleanprops", ulx.cleanprops, "!cleanprops")
cleanprops:addParam{ type=ULib.cmds.PlayerArg }
cleanprops:defaultAccess( ULib.ACCESS_ADMIN )
cleanprops:help( "Очистка пропов игрока." )
--PATH addons/vcmod_main_autoupdate/lua/autorun/vc_helper.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

// Adds a few quick helper functions for developers
// This is a seperate file to avoid potential load priority issues


// Does very rudimentary detour check and outputs some useful data. Does not check everything, only the basic methods. These quick methods themselves can be detoured!
function VC_getDetours_ManualCheck()
	local ret = {}

	// init the function
	local v_debug = debug.getinfo

	// debug.getinfo (a bit silly checking this, but why not?)
	local data = v_debug(v_debug) local source = "=[C]"
	if !data or !data.source or data.source != source then
		ret["debug.getinfo"] = {original = source, current = data.source}
	end

	// RunString
	local data = v_debug(RunString) local source = "=[C]"
	if !data or !data.source or data.source != source then
		ret["RunString"] = {original = source, current = data.source}
	end

	-- // file.Write
	-- local data = v_debug(file.Write) local source = "=[C]"
	-- if !data or !data.source or data.source != source then
	-- 	ret["file.Write"] = {original = source, current = data.source}
	-- end

	// HTTP Module
	local data = v_debug(HTTP) local source = "=[C]"
	if !data or !data.source or data.source != source then
		ret["HTTP Module"] = {original = source, current = data.source}
	end

	// http.Fetch Module
	local data = v_debug(http.Fetch) local source = "@lua/includes/modules/http.lua"
	if !data or !data.source or data.source != source then
		ret["http.Fetch"] = {original = source, current = data.source}
	end

	// HTTP Module
	local source = "@lua/includes/modules/http.lua"
	module("http", package.seeall)
	if Fetch then
		local data = v_debug(Fetch)
		if !data or !data.source or data.source != source then
			ret["HTTP Module Fetch"] = {original = source, current = data.source}
		end
	end

	return ret
end

concommand.Add("vc_detourCheck", function(ply)

	// Let's limit this to console command use only
	if IsValid(ply) and !ply:IsAdmin() then
		VCPrint("ERROR: this command is only accessible by administrators!")
		return
	end

	VCPrint_noPrefix("")
	VCPrint("Detour check started:")

	local detours = {}
	// Check if jit is installed or not, if not, most likely a 64bit branch
	if jit then
		detours = VC_getDetours_ManualCheck()
	else
		VCPrint("ERROR: jit is not installed!")
		return
	end

	// Checking the outputs
	if table.Count(detours) > 0 then
		VCPrint("WARNING! Found "..table.Count(detours).." detour(s)!")

		VCPrint_noPrefix("")
		for k,v in pairs(detours) do
			VCPrint(k..' is "'..v.current..'", should be "'..v.original..'"!')
		end
		VCPrint_noPrefix("")

		VCPrint("Remove the source of detours and restart the map!")
	else
		VCPrint("No detours found! If there still are issues, contact support.")
	end

	VCPrint_noPrefix("")
end)
--PATH vc_rs_t:
VC.Test_RS = true
--PATH addons/animation/lua/autorun/wos_fortnite_loader.lua:

--[[-------------------------------------------------------------------
	Fortnite Dancing Addon:
		Why the hell did we make this?
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

if SERVER then
	AddCSLuaFile( "wos/fortnite/loader/loader.lua" )
end

include( "wos/fortnite/loader/loader.lua" )
--PATH addons/snowball/lua/autorun/zck_load.lua:
local function zck_LoadAllFiles(fdir)
	local files, dirs = file.Find(fdir .. "*", "LUA")

	for _, file in ipairs(files) do
		if string.match(file, ".lua") then
			if SERVER then
				AddCSLuaFile(fdir .. file)
			end

			include(fdir .. file)
		end
	end

	for _, dir in ipairs(dirs) do
		zck_LoadAllFiles(fdir .. dir .. "/")
	end
end

zck_LoadAllFiles("zeroschristmaskit/")

--PATH addons/zeros_lua_libary/lua/zclib/util/sh_util.lua:
zclib = zclib or {}
zclib.util = zclib.util or {}

// EntityDistance check for net messages
zclib.netdist = 1500

function zclib.Print(msg)
	if zclib.config.NoPrint then return end
	MsgC(Color(37, 69, 129), "[Zero´s Libary] ", color_white, msg .. "\n")
end

function zclib.ErrorPrint(msg)
	if zclib.config.NoPrint then return end
	MsgC(Color(37, 69, 129), "[Zero´s Libary] ", Color(255, 0, 0), msg .. "\n")
end

// Basic notify function
function zclib.Notify(ply, msg, ntfType)
	if not IsValid(ply) then return end

	if SERVER then
		if DarkRP and DarkRP.notify then
			DarkRP.notify(ply, ntfType, 8, msg)
		else
			ply:ChatPrint(msg)
		end
	else
		zclib.vgui.Notify(msg, ntfType)
	end
end

function zclib.util.IsInsideViewCone(pos,eyepos,eyeangles,view_distance,cone_rad)
	local x = eyepos
	local dir = eyeangles:Forward()

	//debugoverlay.Sphere(x,5,1,Color( 0, 255, 0 ),false)

	// So you project pos onto dir to find the point's distance along the axis:
	local cone_dist = (pos - x):Dot(dir)

	//At this point, you can reject values outside 0 <= cone_dist <= view_distance.

	//Then you calculate the cone radius at that point along the axis:
	local cone_radius = (cone_dist / view_distance) * cone_rad

	// And finally calculate the point's orthogonal distance from the axis to compare against the cone radius:
	local orth_distance = ((pos - x) - cone_dist * dir):Length()

	//debugoverlay.Sphere(x,cone_radius,1,Color( 255, 255, 0 ),false)

	//debugoverlay.BoxAngles(eyepos, Vector(0, -15, -15), Vector(view_distance, 15, 15),eyeangles, 1, Color(255, 255, 255, 25))

	local is_point_inside_cone = (orth_distance < cone_radius)

	return is_point_inside_cone
end

if CLIENT then
	function zclib.util.LoopedSound(ent, soundfile, shouldplay,dist)
		if shouldplay and zclib.util.InDistance(LocalPlayer():GetPos(), ent:GetPos(), dist or 500) then
			if ent.Sounds == nil then
				ent.Sounds = {}
			end

			if ent.Sounds[soundfile] == nil then
				ent.Sounds[soundfile] = CreateSound(ent, soundfile)
			end

			if ent.Sounds[soundfile]:IsPlaying() == false then

				ent.Sounds[soundfile]:Play()
				ent.Sounds[soundfile]:ChangeVolume(zclib.Convar.Get("zclib_cl_sfx_volume"), 0)
				ent.LastVolume = zclib.Convar.Get("zclib_cl_sfx_volume")
			else
				if ent.LastVolume ~= zclib.Convar.Get("zclib_cl_sfx_volume") then
					ent.LastVolume = zclib.Convar.Get("zclib_cl_sfx_volume")
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

	function zclib.util.ScreenPointToRay(ViewPos,filter,mask)
		local x, y = input.GetCursorPos()
		local dir = gui.ScreenToVector( x,y )

		// Trace for valid Spawn Pos
		local c_trace = zclib.util.TraceLine({
			start = ViewPos,
			endpos = ViewPos + dir:Angle():Forward() * 10000,
			filter = filter,
			mask = mask,
		}, "ScreenPointToRay")
		return c_trace
	end

	local wtr = { collisiongroup = COLLISION_GROUP_WORLD, output = {} }
	local woff = Vector(0,0,100000)
	function zclib.util.IsInWorld( pos )
		wtr.start = pos
		wtr.endpos = pos - woff
		return util.TraceLine( wtr ).HitWorld
	end
end

function zclib.util.FormatDate(date)
	local chars = string.Split( date, "/" )
	local CleanDate = chars[3] .. "/" .. chars[2] .. "/" .. chars[1] .. " - " .. chars[4]

	return CleanDate
end

function zclib.util.GetDate()
	return os.time()
end

function zclib.util.GenerateUniqueID(template)
	return string.gsub(template, "[xy]", function(c)
		local v = (c == "x") and math.random(0, 0xf) or math.random(8, 0xb)

		return tostring(string.format("%x", v))
	end) .. "a"
end

function zclib.util.UnitToMeter(unit)
	return math.Round(unit * 0.01953125) .. "m"
end

// Takes in a savefile name and makes it clean and nice
function zclib.util.StringClean(id)
	// Make it lower case
	id = string.lower(id)

	// Lets removed any problematic symbols
	local pattern = '[\\/:%*%?"<>!|]' // a set of all restricted characters
	id = string.gsub(id,pattern,"",99)

	// Replace empty space with underline
	id = string.Replace(id," ","_")

	return id
end

function zclib.util.StringToUniqueID(str)
	local _bytes = {string.byte(str, 1, string.len(str))}
	local _seed = table.concat( _bytes,"", 1, #_bytes )
	math.randomseed( _seed )
	return math.random(1,9999999)
end


function zclib.util.FormatTime(time)
	local divid = time / 60
	local minutes = math.floor(time / 60)
	local seconds = math.Round(60 * (divid - minutes))

	local lang_m = zclib.Language["Minutes"]
	local lang_s = zclib.Language["Seconds"]

	if seconds > 0 and minutes > 0 then
		return minutes .. " " .. lang_m .. " | " .. seconds .. " " .. lang_s
	elseif seconds <= 0 and minutes > 0 then
		return minutes .. " " .. lang_m
	elseif seconds >= 0 and minutes <= 0 then
		return seconds .. " " .. lang_s
	end
end

// Checks if the distance between pos01 and pos02 is smaller then dist
function zclib.util.InDistance(pos01, pos02, dist)
	return pos01:DistToSqr(pos02) < (dist * dist)
end

// Used to fix the Duplication Glitch
local CollisionCooldownList = {}
function zclib.util.CollisionCooldown(ent)
	if zclib.Entity.GettingRemoved(ent) then return true end

	// NOTE I changed the way the collision cooldown gets saved since there will be problems for scripts which use the duplicator.CreateEntityFromTable function
	// As it saved any value from the entity which means that once the entity will be reconstructed it would cause the cooldown to be at the time at which it got saved
	local Cooldown = CollisionCooldownList[ent]
	if Cooldown == nil then
		CollisionCooldownList[ent] = CurTime() + 0.5
		return false
	else
		if CurTime() < Cooldown then
			return true
		else
			CollisionCooldownList[ent] = CurTime() + 0.5
			return false
		end
	end
end


function zclib.util.SnapValue(snapval,val)
	val = val / snapval
	val = math.Round(val)
	val = val * snapval
	return val
end

// Tells us if the functions is valid
function zclib.util.FunctionValidater(func)
	if (type(func) == "function") then return true end
	return false
end

// Performs a TraceLine
function zclib.util.TraceLine(tracedata,identifier)
	return util.TraceLine(tracedata)
end

// Calculates how much of the AddAmount will remain and how much can be added
function zclib.util.GetRemain(HaveAmount, CapAmount, AddAmount)
	local diff = CapAmount - HaveAmount
	local add = math.Clamp(AddAmount, 0, diff)
	local remain = AddAmount - add
	return remain, add
end

function zclib.util.RandomChance(chance)
	if math.random(0, 100) < math.Clamp(chance,0,100) then
		return true
	else
		return false
	end
end

// Returns a random postion on a
function zclib.util.GetRandomPositionInsideCircle(rad_min,rad_max,height)
	local randomAngle = math.random(360)
	local InnerCircleRadius = math.random(rad_min,rad_max)
	return Vector(math.cos(randomAngle) * InnerCircleRadius, math.sin(randomAngle) * InnerCircleRadius, height)
end

// Calls the provided function with a small delay, we cant use time 0 (NextFrame) since some scripts can fuck with that
function zclib.util.CallDelayed(ent,func)
	timer.Simple(math.Rand(0.001,0.01),function()
		if IsValid(ent) and ent:IsValid() then
			pcall(func)
		end
	end)
end

--PATH addons/zeros_lua_libary/lua/zclib/util/cl_bluemasks.lua:
if SERVER then return end

// Blues Masks and Shadows
//https://forum.facepunch.com/f/gmoddev/oaxt/Blue-s-Masks-and-Shadows/1/

//This code can be improved alot.
//Feel free to improve, use or modify in anyway altough credit would be apreciated.

// NOTE Implement this in the libary such that it wont conflict with other people who use bluesmasks

BMASKS = {} //Global table, access the functions here
BMASKS.Materials = {} //Cache materials so they dont need to be reloaded
BMASKS.Masks = {} //A table of all active mask objects, you should destroy a mask object when done with it

//The material used to draw the render targets
BMASKS.MaskMaterial = CreateMaterial("!bluemask", "UnlitGeneric", {
	[ "$translucent" ] = 1,
	[ "$vertexalpha" ] = 1,
	[ "$alpha" ] = 1
})

//Creates a mask with the specified options
//Be sure to pass a unique maskName for each mask, otherwise they will override each other
BMASKS.CreateMask = function(maskName, maskPath, maskProperties)
	local mask = {}

	//Set mask name
	mask.name = maskName

	//Load materials
	if BMASKS.Materials[ maskPath ] == nil then
		BMASKS.Materials[ maskPath ] = Material(maskPath, maskProperties)
	end

	//Set the mask material
	mask.material = BMASKS.Materials[ maskPath ]

	//Create the render target
	mask.renderTarget = GetRenderTargetEx("BMASKS:" .. maskName, ScrW(), ScrH(), RT_SIZE_FULL_FRAME_BUFFER, MATERIAL_RT_DEPTH_NONE, 2, CREATERENDERTARGETFLAGS_UNFILTERABLE_OK, IMAGE_FORMAT_RGBA8888)
	BMASKS.Masks[ maskName ] = mask

	return maskName
end

//Call this to begin drawing with a mask.
//After calling this any draw call will be masked until you call EndMask(maskName)
BMASKS.BeginMask = function(maskName)

	//FindMask
	if BMASKS.Masks[ maskName ] == nil then
		print("Cannot begin a mask without creating it first!")

		return false
	end

	//Store current render target
	BMASKS.Masks[ maskName ].previousRenderTarget = render.GetRenderTarget()

	//Confirgure drawing so that we write to the masks render target
	render.PushRenderTarget(BMASKS.Masks[ maskName ].renderTarget)
	render.OverrideAlphaWriteEnable(true, true)
	render.Clear(0, 0, 0, 0)
end

//Ends the mask and draws it
//Not calling this after calling BeginMask will cause some really bad effects
//This done return the render target used, using this you can create other effects such as drop shadows without problems
//Passes true for dontDraw will result in it not being render and only returning the texture of the result (which is ScrW()xScrH())
local CachedOpacities = {}
BMASKS.EndMask = function(maskName, x, y, sizex, sizey, opacity, rotation, dontDraw , MakeTile)
	dontDraw = dontDraw or false
	rotation = rotation or 0
	opacity = opacity or 255

	//Draw the mask
	//render.OverrideBlendFunc(true, BLEND_ZERO, BLEND_SRC_ALPHA, BLEND_DST_ALPHA, BLEND_ZERO)

	render.OverrideBlend(true, BLEND_ZERO, BLEND_SRC_ALPHA, BLENDFUNC_ADD, BLEND_DST_ALPHA, BLEND_ZERO, BLENDFUNC_ADD)

	// Cache that color, no reason to spamm
	if CachedOpacities[ opacity ] == nil then CachedOpacities[ opacity ] = Color(255, 255, 255, opacity) end

	surface.SetDrawColor(CachedOpacities[ opacity ])
	surface.SetMaterial(BMASKS.Masks[ maskName ].material)

	if MakeTile then
		local u0, v0 = 0 + x, 0 + y
		local u1, v1 = 1 + x, 1 + y
		surface.DrawTexturedRectUV(0, 0, sizex, sizex, u0, v0, u1, v1)
	else
		if rotation == nil or rotation == 0 then
			surface.DrawTexturedRect(x, y, sizex, sizey)
		else
			surface.DrawTexturedRectRotated(x, y, sizex, sizey, rotation)
		end
	end

	render.OverrideBlend( false )
	//render.OverrideBlendFunc(false)

	render.OverrideAlphaWriteEnable(false)
	render.PopRenderTarget()

	//Update material
	BMASKS.MaskMaterial:SetTexture('$basetexture', BMASKS.Masks[ maskName ].renderTarget)

	//Clear material for upcoming draw calls
	draw.NoTexture()

	//Only draw if they want it to
	if not dontDraw then

		//Now draw finished result
		surface.SetDrawColor(color_white)
		surface.SetMaterial(BMASKS.MaskMaterial)
		render.SetMaterial(BMASKS.MaskMaterial)
		render.DrawScreenQuad()
	end

	return BMASKS.Masks[ maskName ].renderTarget
end

BMASKS.CreateMask("zclib_Circle", "materials/zerochain/zerolib/mask/mask_circle.png", "smooth")
BMASKS.CreateMask("zclib_gradient_topdown", "materials/zerochain/zerolib/mask/gradient_topdown.png", "smooth")
BMASKS.CreateMask("zclib_gradient_topdown_border", "materials/zerochain/zerolib/mask/gradient_topdown_border.png", "smooth")
BMASKS.CreateMask("zclib_radial_invert_glow", "materials/zerochain/zerolib/mask/radial_invert_glow.png", "smooth")
BMASKS.CreateMask("radial_shadow", "materials/zerochain/zerolib/mask/radial_shadow.png", "smooth")

--PATH addons/zeros_lua_libary/lua/zclib/generic/sh_inventory_support.lua:
zclib = zclib or {}
zclib.Inventory = zclib.Inventory or {}

function zclib.Inventory.GetItems(ply)
    local inv = {}
    if itemstore then
        if SERVER then
            inv = table.Copy(ply.Inventory:GetItems())
        else
            if LocalPlayer().InventoryID and itemstore.containers.Active[LocalPlayer().InventoryID] and itemstore.containers.Active[LocalPlayer().InventoryID].Items then
                inv = table.Copy(itemstore.containers.Active[LocalPlayer().InventoryID].Items)
            end
        end
    end
    return inv
end

if SERVER then
    // Trys to pickup the specified enttiy in to the players Inventory, returns false otherwhise
    function zclib.Inventory.Pickup(ply,ent,class)
        local success = false
        if itemstore then
            local item = itemstore.Item(class)
            if item == nil then return false end
            local con = itemstore.config.PickupsGotoBank and ply.Bank or ply.Inventory
            if con == nil then return false end
            if con:CanFit(item) then
                ply:PickupItem(ent)
                success = true
            end
        elseif XeninInventory then

            local inv = ply:XeninInventory()
            local amt = table.Count(inv:GetInventory())
            local slots = inv:GetSlots()
            if (amt >= slots) then return false end
            if ply:XeninInventory():Pickup(ent) == true then
                success = true
            end
        elseif idinv then
            local inv = ply:GetInventory()
            if inv then
                idinv.item:Create(ent, nil, function(item, id)
                    inv:addItem(id)
                end)
            end
        elseif BRICKS_SERVER then

            if IsValid(ent) then

				if not ply.GetInventory then
					zclib.ErrorPrint("Could not find Bricks inventory player meta function > ply:GetInventory()")
					return
				end

                local inventoryTable = ply:GetInventory()
                if (table.Count(inventoryTable) >= BRICKS_SERVER.Func.GetInventorySlots(ply)) then
                    return
                end

                local itemData = BRICKS_SERVER.Func.GetEntTypeField(ent:GetClass(), "GetItemData")(ent)
                ply:BRS_InventoryAdd(itemData, 1)

                ent:Remove()
                success = true
            end
        elseif engine.ActiveGamemode() == "underdone" then
            ply:AddItem(class,1)
        end

        return success
    end

    // Takes the specified amount
    function zclib.Inventory.Take(ply,typecheck,amount)
        local success = false
        if itemstore then
            ply.Inventory:Suppress( function()
                for k, v in pairs( ply.Inventory:GetItems() ) do
                    if typecheck() then
                        v:SetAmount( v:GetAmount() - amount )

                        if v:GetAmount() <= 0 then
                            ply.Inventory:SetItem( k, nil )
                        end

                        success = true
                    end
                end
                return true
            end )
        end
        return success
    end
end

--PATH addons/zeros_lua_libary/lua/zclib/inventory/cl_inventory.lua:
if SERVER then return end
zclib = zclib or {}
zclib.Inventory = zclib.Inventory or {}

/*

    This inventory system does not get saved and is only used to temporarly store items

*/

/*
    Opens the players inventory vgui
*/
net.Receive("zclib_player_open", function(len)
    zclib.Debug_Net("zclib_player_open",len)

    local entInv = net.ReadEntity()

    // If we currently removing / placing something then stop
    zclib.PointerSystem.Stop()

    zclib.vgui.Page("Your Inventory",function(main,top)

        main:SetWide(650 * zclib.wM)

        local close_btn = zclib.vgui.ImageButton(940 * zclib.wM,10 * zclib.hM,50 * zclib.wM, 50 * zclib.hM,top,zclib.Materials.Get("close"),function()
            main:Close()
        end,false)
        close_btn:Dock(RIGHT)
        close_btn:DockMargin(10 * zclib.wM,0 * zclib.hM,0 * zclib.wM,0 * zclib.hM)
        close_btn.IconColor = zclib.colors["red01"]

        local seperator = zclib.vgui.AddSeperator(top)
        seperator:SetSize(5 * zclib.wM, 50 * zclib.hM)
        seperator:Dock(RIGHT)
        seperator:DockMargin(10 * zclib.wM,0 * zclib.hM,0 * zclib.wM,0 * zclib.hM)

        // Build Inventory
        local inv = zclib.Inventory.VGUI({
            parent = main,
            inv_ent = entInv,
            ExtraData = {
                SizeW = 80,
                SizeH = 80,
            },

            CanSelect = function(ItemData ,slot_data) return true end,

            OnDragDrop = function(DragPanel,ReceiverPanel) end
        })
        inv:SetSize(650 * zclib.wM, 370 * zclib.hM)

        main.OnInventoryChanged = function()

            // Do we already have the inventory build?
            if not IsValid(main.Inventory) then return end

            // Update the inventory
            main.Inventory:Update(zclib.Inventory.Get(entInv))
        end
    end)
end)



/*
    Gets called from server to send the new inventory data to the client
*/
net.Receive("zclib_Inventory_Sync", function(len)
    zclib.Debug_Net("zclib_Inventory_Sync", len)
    local dataLength = net.ReadUInt(16)
    local dataDecompressed = util.Decompress(net.ReadData(dataLength))
    local inv = util.JSONToTable(dataDecompressed)
    local ent = net.ReadEntity()
    local ent_index = net.ReadUInt(16)

	if not inv then zclib.ErrorPrint("zclib_Inventory_Sync > Inventory Data invalid!") return end

    zclib.InventoryCache[ent_index] = table.Copy(inv)

    if IsValid(ent) then
        ent.zclib_inv = table.Copy(inv)

        hook.Run("zclib_OnInventorySynch",ent)
    end
    ent.InventoryChanged = true

	// Is the interface currently open?
	if not IsValid(zclib_main_panel) then return end

	// Is the entity which inventory got synched the current ActiveVGUIEntity or the LocalPlayer
	if (ent ~= zclib.vgui.ActiveEntity and ent ~= LocalPlayer()) then return end

	// Did the inventory change?
    if not zclib_main_panel.OnInventoryChanged then return end

	zclib_main_panel:OnInventoryChanged()
end)


/*
    Draw the Pickup indicator
*/
local function DrawPickupIndicator()
    local tr = LocalPlayer():GetEyeTrace()
    if tr == nil then return end
    local ent = tr.Entity
    if not IsValid(ent) then return end
    if zclib.Inventory.CanPickup(ent:GetClass()) == false then return end

    local pos = ent:GetPos()
    pos = pos:ToScreen()

    local am = zclib.ItemDefinition.GetAmount(ent:GetClass(),ent)
    if am > 1 then am = "x" .. am else am = nil end

    local he = ent:Health()
    if he and he > 0 then he = (1 / ent:GetMaxHealth()) * ent:Health() else he = nil end
    zclib.util.DrawInfoBox(pos,{
        txt01 = zclib.Inventory.GetEntityName(ent),
        txt02 = "[ALT + E]",
        txt03 = am,
        color = zclib.colors["green01"],
        bar_fract = he,
        bar_col01 = zclib.colors["red01"],
        bar_col02 = zclib.colors["green01"],
    })
end

zclib.Hook.Add("HUDPaint", "zclib_player_inventory", function() if zclib.config.Inventory.ShowItemPickup then DrawPickupIndicator() end end)



// TODO Implement a language system in to zclib and connect it here

function zclib.Inventory.Slot(ItemData,GotSelected,CanSelect,OnSelect,PreDraw,PostDraw)
    local main_pnl = vgui.Create("zclib_inventory_slot")
    main_pnl:SetSize(200 * zclib.wM, 200 * zclib.hM)

    function main_pnl:PreDraw(w, h)
        if PreDraw then pcall(PreDraw,w,h,self,self.ItemData) end
    end

    function main_pnl:PostDraw(w, h)
        if PostDraw then pcall(PostDraw,w,h,self,self.ItemData) end
    end

    function main_pnl:CanSelect()
        local _,canselect = xpcall( CanSelect, function() end, self.ItemData )
        return canselect
    end

    function main_pnl:OnSelect()
        pcall(OnSelect,self.ItemData)
    end

    function main_pnl:GotSelected()
        local _,isselect = xpcall( GotSelected, function() end, self.ItemData )
        return isselect
    end

    return main_pnl
end

/*
zclib.Inventory.VGUI({
    parent = parent,

    // The entity who has the inventory
    inv_ent = entity,

    CanSelect = function(ItemData ,slot_data)
    end,

    OnSelect = function(slot_id)
    end,

    PreDraw = function(w,h,s,ItemData)
    end,

    PostDraw = function(w,h,s,ItemData)
    end,

    // This can be used to modify the inventory item panel
    OnItemUpdate = function(slot_id,slot_data,item_pnl)
    end,

    // Gets called when one item is dragged on another one
    // Return true to prevent one item being switched with the other one
    OnDragDrop = function(DragPanel,ReceiverPanel)

    end
})
*/

// Keeps track on which slot panel is currently selected
zclib.Inventory.SelectedSlot = nil

function zclib.Inventory.VGUI(data)
    zclib.Debug("zclib.Inventory.VGUI")

    if IsValid(data.parent.Inventory) then data.parent.Inventory:Remove() end

    local title = (data.ExtraData and data.ExtraData.title) and data.ExtraData.title //or "Inventory"//zclib.language["Inventory:"]
    local main = zclib.vgui.Panel(data.parent, title)
    main:SetSize(600 * zclib.wM, 300 * zclib.hM)

    // This mainly checks if the player has left / rightclicked on something that isnt a option box and removes the optionbox if its active
    main.Think = function() zclib.Inventory.ClickLogic(vgui.GetHoveredPanel()) end
    data.parent.Inventory = main



    // Keep track on the inventory entity
    main.inv_ent = data.inv_ent

    // Store the SlotOptions in the inventory panel
    main.SlotOptions = data.SlotOptions

    local list,scroll = zclib.vgui.List(main)
    list:DockMargin(0 * zclib.wM,0 * zclib.hM,-15 * zclib.wM,0 * zclib.hM)
    scroll:DockMargin(10 * zclib.wM,10 * zclib.hM,0 * zclib.wM,0 * zclib.hM)
    scroll.Paint = function(s, w, h)
        //draw.RoundedBox(5, 0, 0, w, h, zclib.colors["red01"])
    end

    local itmW,itmH = 100, 100
    local ItemSize
    if data.ExtraData then
        if data.ExtraData.ItemSize then ItemSize = data.ExtraData.ItemSize end
        if data.ExtraData.SizeW then itmW = data.ExtraData.SizeW end
        if data.ExtraData.SizeH then itmH = data.ExtraData.SizeH end
    end

    main.Items = {}
    main.UpdateItem = function(self,slot_id,slot_data)
        if slot_data == nil then return end

        local item_pnl = main.Items[slot_id]

        if not IsValid(item_pnl) then

            local fitmW = (ItemSize or itmW) * zclib.wM
            local fitmH = (ItemSize or itmH) * zclib.hM

            item_pnl = vgui.Create("zclib_inventory_slot")
            item_pnl:SetSize(fitmW, fitmH)
            item_pnl:SetPos( fitmW * slot_id, fitmH )

            function item_pnl:PreDraw(w, h)
                if data.PreDraw then pcall(data.PreDraw,w,h,self,self.ItemData) end
            end

            function item_pnl:PostDraw(w, h)
                if data.PostDraw then pcall(data.PostDraw,w,h,self,self.ItemData) end
            end

            function item_pnl:CanSelect()
                if data.CanSelect == nil then return false end
                if zclib.Inventory.SlotIsEmpty(data.inv_ent,slot_id) == true then
                    return false
                else
                    local _,canselect = xpcall( data.CanSelect, function() end, itmDat ,slot_data)
                    return canselect
                end
            end

            function item_pnl:OnSelect()
                zclib.Inventory.SelectedSlot = self

                zclib.Inventory.RemoveSlotOptions()
                zclib.Inventory.SlotOptions(self,slot_id)

                if data.OnSelect then pcall(data.OnSelect,slot_id,item_pnl) end
            end

            function item_pnl:OnClick()
                if data.OnClick then pcall(data.OnClick,slot_id,item_pnl) end
            end


            function item_pnl:GotSelected()
                return zclib.Inventory.SelectedSlot == self
            end

            list:Add(item_pnl)

            if main.Items == nil then main.Items = {} end
            main.Items[slot_id] = item_pnl
        end

        // Tell the slot which inventory he listens too
        item_pnl.Inventory = main

        // Tell the slot which entity his inventory belongs to
        item_pnl.inv_ent = data.inv_ent

        // If the item has no price value then lets give it one
        // TODO Not sure if this is still needed
        if slot_data and table.Count(slot_data) > 0 and slot_data.Price == nil then slot_data.Price = zclib.ItemDefinition.GetPrice(slot_data.Class,slot_data) end

        // Tell the panel what its id and data is
        item_pnl.slot_id = slot_id
        item_pnl.slot_data = slot_data

        // Send the slot panel its data so it can display / render the image of the item
        item_pnl:Update(slot_data)

        // Call inventory function should we wanna call anything else
        if data.OnItemUpdate then pcall(data.OnItemUpdate,slot_id,slot_data,item_pnl) end


        ///////////////// DRAG LOGIC
        // We make the DragBase id unique to the entity which prevents items being draged from one inventory to another one
        local DragBaseID = "zcLibDragBase_" .. data.inv_ent:EntIndex()

        // If the slot is not empty then it can be drag/dropped
        if item_pnl.slot_data and table.IsEmpty(item_pnl.slot_data) == false then
            item_pnl:Droppable( DragBaseID )
        end

        // Tell the panel it can receiver other panels being dropped on it
        item_pnl:Receiver(DragBaseID, function(s, panels, bDoDrop, Command, x, y)
            if bDoDrop and data.OnDragDrop then
                local rec = s
                for k, v in pairs(panels) do
                    local dra = v
                    if dra == nil then continue end
                    if dra == rec then continue end

                    // Play drop animation and sound
                    dra:OnDrop()

                    // If the Drag/Drop function returns true then stop here and dont perform the item switch
                    if data.OnDragDrop(dra, rec) == true then break end

                    zclib.Inventory.Drag(dra.inv_ent,rec.inv_ent,dra.slot_id,rec.slot_id,dra,rec)
                    break
                end
            end
        end)

        // Checks if the player is currently over the DropToFloor area on the interface
        local function OnDropToFloor()
            if not IsValid(zclib_main_panel) then return false end
            local mX,mY = input.GetCursorPos()

            local pX,pY = zclib_main_panel:GetPos()

            local maxX, maxY = pX - 10 * zclib.wM,pY + zclib_main_panel:GetTall()
            local minX, minY = pX - 110 * zclib.wM,pY

            if mX > minX and mX < maxX and mY > minY and mY < maxY then
                return true
            else
                return false
            end
        end

        item_pnl.OnStartDragging = function()
            zclib.Hook.Add("HUDPaint", "zclib_player_inventory_droptofloor", function()
                if IsValid(item_pnl) and IsValid(zclib_main_panel) then

                    local slotPnl = vgui.GetHoveredPanel()
                    if IsValid(slotPnl) then
                        slotPnl.LastHoveredByDragPanel = CurTime()
                    end

                    local x,y = zclib_main_panel:GetPos()
                    draw.RoundedBox(5, x - 110 * zclib.wM, y, 100 * zclib.hM, zclib_main_panel:GetTall(), zclib.colors["black_a200"])
                    if OnDropToFloor() then
                        zclib.util.DrawOutlinedBox(x - 110 * zclib.wM, y, 100 * zclib.hM, zclib_main_panel:GetTall(), 2, zclib.colors["green01"])
                    end
                    draw.SimpleText("DROP", zclib.GetFont("zclib_font_medium"), x - 60 * zclib.wM, y + (zclib_main_panel:GetTall() / 2), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                else
                    zclib.Hook.Remove("HUDPaint", "zclib_player_inventory_droptofloor")
                end
            end)
        end

        item_pnl.OnStopDragging = function()
            zclib.Hook.Remove("HUDPaint", "zclib_player_inventory_droptofloor")

            // If we drag the item on nothing then that means we want to drop the item from the inventory
            local pnl = vgui.GetHoveredPanel()
            if OnDropToFloor() and (pnl == nil or pnl:GetClassName() == "CGModBase") then
                zclib.Inventory.DropToFloor(data.inv_ent,item_pnl.slot_id)
            end
        end
        /////////////////
    end



    main.Update = function(s,inv) for slot_id, slot_data in pairs(inv) do main:UpdateItem(slot_id,slot_data) end end
    main:Update(zclib.Inventory.Get(data.inv_ent))

    scroll:InvalidateLayout(true)
    scroll:SizeToChildren(false, true)

    list:InvalidateLayout(true)
    list:SizeToChildren(false, true)

    main:InvalidateLayout(true)
    main:SizeToChildren(false, true)

    return main
end

// This needs to be called when the player clicks on a inventory slot which has a item
function zclib.Inventory.SlotOptions(pnl,slot)

    if pnl.Inventory.SlotOptions and table.Count(pnl.Inventory.SlotOptions) <= 0 then return end

    local SlotData = zclib.Inventory.GetSlotData(pnl.Inventory.inv_ent,slot)
    if SlotData == nil then return end
    if SlotData.Class == nil then return end

    local ItemDefinition = zclib.ItemDefinition.Get(SlotData.Class)

    local bg_pnl = vgui.Create("DPanel",pnl.Inventory)
    bg_pnl:Dock(FILL)
    bg_pnl.Paint = function(s, w, h)
        if input.IsKeyDown(KEY_ESCAPE) then s:Remove() end
        zclib.util.DrawBlur(s, 1, 5)
        draw.RoundedBox(5, 0, 0, w, h, zclib.colors["black_a100"])
    end
    zclib.vgui.SlotOptionPanel = bg_pnl
    bg_pnl:InvalidateLayout( true )
    bg_pnl:InvalidateParent(true)

    local main_pnl = vgui.Create("DPanel",bg_pnl)
    main_pnl:SetSize(300 * zclib.wM, 500 * zclib.hM)
    main_pnl:Center()
    main_pnl.Paint = function(s, w, h)
        //if input.IsKeyDown(KEY_ESCAPE) then s:Remove() end
        draw.RoundedBox(5, 0,0, w, h , zclib.colors["ui00"])

        draw.SimpleText("Options", zclib.GetFont("zclib_font_medium"), w / 2, 5 * zclib.hM, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
        draw.RoundedBox(0, 5 * zclib.wM,40 * zclib.hM, w - (10 * zclib.wM), 4 * zclib.hM , zclib.colors["ui02"])
    end
    //main_pnl:MoveToFront()

    main_pnl:DockPadding(5 * zclib.wM, 50 * zclib.hM, 5 * zclib.wM, 5 * zclib.hM)

    // Keep refrence of which slot of the inventory got clicked on
    main_pnl.slot = slot

    local function OptionButton(color_overwrite,txt,tooltip,action)
        local bttn_pnl = vgui.Create("DButton", main_pnl)
        bttn_pnl:Dock(TOP)
        bttn_pnl:DockMargin( 0, 0, 0, 5  * zclib.hM )
        bttn_pnl:SetSize(main_pnl:GetWide(), 30 * zclib.hM)
        bttn_pnl:SetAutoDelete(true)
        bttn_pnl:SetText("")
        bttn_pnl.IsOptionBoxButton = true

        local desc = string.Replace(tooltip or txt,"$ItemName",pnl.slot_data.Name)
        if pnl.slot_data.Price then desc = string.Replace(desc,"$ItemPrice",zclib.Money.Display(pnl.slot_data.Price)) end

        bttn_pnl:SetTooltip(desc)
        bttn_pnl.Paint = function(s, w, h)
            draw.RoundedBox(0, 0, 0, w, h, zclib.colors["ui02"])
            draw.SimpleText(txt, zclib.GetFont("zclib_font_small"), w / 2, h / 2, color_overwrite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            if s:IsHovered() then
                draw.RoundedBox(0, 0, 0, w, h, zclib.colors["white_a15"])
            end
        end
        bttn_pnl.DoClick = function()
            pcall(action)
        end
    end

    // If we have custom slotOptions then use them instead
    if pnl.Inventory.SlotOptions then
        for k,v in ipairs(pnl.Inventory.SlotOptions) do
            OptionButton(v.color,v.name,v.desc,function()
                v.func(slot,pnl)
                zclib.Inventory.RemoveSlotOptions()
            end)
        end
    else

        // Use option
        if ItemDefinition and ItemDefinition.OnUse then
            OptionButton(zclib.colors["blue01"],"Use","Uses $ItemName.",function()
                zclib.Inventory.UseItem(pnl.Inventory.inv_ent,slot)
            end)
        end

        // Equipt option for weapons
        if zclib.ItemDefinition.IsWeapon(SlotData.Class,SlotData) then
            OptionButton(zclib.colors["blue01"],"Equipt","Equipt $ItemName.",function()
                zclib.Inventory.EquiptItem(pnl.Inventory.inv_ent,slot)
                zclib.vgui.ForceClose()
            end)
        end

        // If the Item has a model or a Drop function then we allow it to be drop
        if (ItemDefinition == nil or ItemDefinition.PreventDrop == nil) and pnl.Inventory.inv_ent ~= LocalPlayer() and ItemDefinition.PreventCollect == nil then
            OptionButton(zclib.colors["text01"],"Collect","Collects $ItemName and places it in your inventory.",function()
                zclib.Inventory.CollectItem(pnl.Inventory.inv_ent,slot)
            end)
        end

        // If the Item has a model or a Drop function then we allow it to be drop
        if ItemDefinition == nil or ItemDefinition.PreventDrop == nil then
            OptionButton(zclib.colors["text01"],"Place","Places $ItemName in the world or send to some inventory.",function()
                zclib.Inventory.ThrowItem(pnl.Inventory.inv_ent,slot)
            end)
        end

		if ItemDefinition.CustomOptions then
			for k, v in pairs(ItemDefinition.CustomOptions(SlotData) or {}) do
				OptionButton(v.color, v.name, v.name .. " $ItemName.", function()

					v.func(LocalPlayer(),pnl.Inventory.inv_ent,slot,pnl)

					zclib.Inventory.CustomOption(pnl.Inventory.inv_ent, slot, k)
				end)
			end
		end

        // Destroy options
        OptionButton(zclib.colors["red01"],"Destroy","Destroy $ItemName.",function()
            zclib.Inventory.DestroyItem(pnl.Inventory.inv_ent,slot)
        end)


    end

    main_pnl:InvalidateLayout( true )
    main_pnl:SizeToChildren( false, true )
    main_pnl:Center()
    return main_pnl
end

// Removes the item options
function zclib.Inventory.RemoveSlotOptions()
    zclib.Inventory.SelectedSlot = nil
    if IsValid(zclib.vgui.SlotOptionPanel) then
        zclib.vgui.SlotOptionPanel:Remove()
    end
end

local RightClickIsDown = false
local LefClickIsDown = false
function zclib.Inventory.ClickLogic(pnl)

    // If the player RightClicks on something thats not a item slot panel then close the Item Option panel if its open
    if (input.IsMouseDown(MOUSE_RIGHT) and not RightClickIsDown) or (input.IsMouseDown(MOUSE_LEFT) and not LefClickIsDown) then
        if not IsValid(pnl) then
            zclib.Inventory.RemoveSlotOptions()
        else
            if pnl.IsOptionBoxButton then return end

            zclib.Inventory.RemoveSlotOptions()
        end
    end

    LefClickIsDown = input.IsMouseDown(MOUSE_LEFT)
    RightClickIsDown = input.IsMouseDown(MOUSE_RIGHT)
end


/*

    Slot Options

*/

// Drops the specified item on the floor
function zclib.Inventory.DropToFloor(ent,SlotID)
    net.Start("zclib_Inventory_DropToFloor")
    net.WriteEntity(ent)
    net.WriteInt(SlotID,16)
    net.SendToServer()
end

// Informs the server that one item got dragged on another one
function zclib.Inventory.Drag(DraggedEnt,ReceiverEnt,DraggedID,ReceiverID,DraggedPnl,ReceiverPnl)

    net.Start("zclib_Inventory_Drag")
    net.WriteEntity(DraggedEnt)
    net.WriteEntity(ReceiverEnt)
    net.WriteInt(DraggedID,10)
    net.WriteInt(ReceiverID,10)
    net.SendToServer()

    local ply = LocalPlayer()
    if not IsValid(DraggedEnt) then return end
    if not IsValid(ReceiverEnt) then return end
    if DraggedID == nil then return end
    if ReceiverID == nil then return end
    if zclib.util.InDistance(DraggedEnt:GetPos(), ply:GetPos(), 500) == false then return end

    local DraggedData = zclib.Inventory.GetSlotData(DraggedEnt,DraggedID)
    local ReceiverData = zclib.Inventory.GetSlotData(ReceiverEnt,ReceiverID)

    // Can be used to perform some other action when one item gets droped on another one
    local result01 = hook.Run("zclib_Inventory_OnDragDrop",ply,DraggedEnt,DraggedData,ReceiverData,DraggedPnl,ReceiverPnl)
    if result01 then return end

    // Can the item be used on the reciever item
    // Examble: A hammer can be used on a egg to crack it
    // The Dragged Item will not be removed or changed
    // The Receiver Item will be changed or removed
    local ModifiedReceiverData = hook.Run("zclib_Inventory_DragDrop_CanUse",ply,DraggedEnt,DraggedData,ReceiverData,DraggedPnl,ReceiverPnl)
    if ModifiedReceiverData then return end

    // Removes both items and creates a new one
    local ResultData = hook.Run("zclib_Inventory_DragDrop_CanCombine",ply,DraggedEnt,DraggedData,ReceiverData,DraggedPnl,ReceiverPnl)
    if ResultData then return end
end

// Moves a Item from one Inventory to another one instantly
function zclib.Inventory.CollectItem(ent,slot)
    net.Start("zclib_Inventory_Collect")
    net.WriteEntity(ent)
    net.WriteUInt(slot,16)
    net.SendToServer()

    zclib.Inventory.RemoveSlotOptions()
end

// Uses the item of the specified slot
function zclib.Inventory.UseItem(ent,slot)

    zclib.Inventory.RemoveSlotOptions()

    // Here we call the use function on client and stop any further call if it returns
    local Result
    local SlotData = zclib.Inventory.GetSlotData(ent,slot)
    if SlotData and SlotData.Class then
        local ItemDefinition = zclib.ItemDefinition.Get(SlotData.Class)
        if ItemDefinition and ItemDefinition.OnUse then
            Result = ItemDefinition.OnUse(LocalPlayer())
        end
    end
    if Result then return end

    net.Start("zclib_Inventory_Use")
    net.WriteEntity(ent)
    net.WriteInt(slot,10)
    net.SendToServer()
end

// Equipts the weapon of the specified slot
function zclib.Inventory.EquiptItem(ent,slot)

    zclib.Inventory.RemoveSlotOptions()

    net.Start("zclib_Inventory_Equipt")
    net.WriteEntity(ent)
    net.WriteInt(slot,10)
    net.SendToServer()
end

// Deletes the content of the specified slot
function zclib.Inventory.DestroyItem(ent,slot)
    net.Start("zclib_Inventory_Destroy")
    net.WriteEntity(ent)
    net.WriteInt(slot,10)
    net.SendToServer()

    zclib.Inventory.RemoveSlotOptions()
end

// Throws the content of the specified slot from one Inventory to another one
function zclib.Inventory.ThrowItem(from, SlotID)

    local SlotData = zclib.Inventory.GetSlotData(from,SlotID)
    if SlotData == nil or table.IsEmpty(SlotData) then
        return
    end

    zclib_main_panel:Close()

    zclib.PointerSystem.Start(from, function()
        // OnInit
        zclib.PointerSystem.Data.MainColor = zclib.colors["green01"]
        zclib.PointerSystem.Data.ActionName = "Throw"//zclib.language["Throw"]
        zclib.PointerSystem.Data.CancelName = "Cancel"//zclib.language["Cancel"]
    end, function()
        // OnLeftClick

        zclib.Inventory.SelectedSlot = nil

        SlotData = zclib.Inventory.GetSlotData(from,SlotID)
        if SlotData == nil or table.IsEmpty(SlotData) then
            zclib.PointerSystem.Stop()
            return
        end

        if SlotData.Model == nil and not IsValid(zclib.PointerSystem.Data.Target) then
            zclib.vgui.Notify("You cant place this on the floor!",NOTIFY_ERROR)
            return
        end


        if zclib.util.InDistance(zclib.PointerSystem.Data.Pos, LocalPlayer():GetPos(), 500) == false then
            zclib.vgui.Notify("Too far away!",NOTIFY_ERROR)
            return
        end

        // Send the target to the SERVER
        net.Start("zclib_Inventory_Throw")
        net.WriteEntity(from)
        net.WriteEntity(zclib.PointerSystem.Data.Target or NULL)
        net.WriteVector(zclib.PointerSystem.Data.Pos)
        net.WriteUInt(SlotID,16)
        net.SendToServer()

        local toPos = zclib.PointerSystem.Data.Pos
        if IsValid(zclib.PointerSystem.Data.Target) then
            toPos = zclib.PointerSystem.Data.Target:GetPos()
        end

        local traveltime = zclib.Inventory.GetThrowTime(from:GetPos(),toPos)
        zclib.ItemShooter.Add(from:GetPos() + Vector(0,0,25),toPos + Vector(0,0,25),traveltime,function(ent)

            zclib.Inventory.ApplyItemVisuals(ent,SlotData)

            // Can be used by other scripts to update the thrown items appearance
            hook.Run("zclib_Inventory_PreItemThrown",SlotID,ent,from,zclib.PointerSystem.Data.Target or toPos)
        end)

        zclib.PointerSystem.Stop()
    end, function()

        // Catch the Target
        if IsValid(zclib.PointerSystem.Data.HitEntity) and zclib.Inventory.IsThrowTarget(zclib.PointerSystem.Data.HitEntity,from,SlotID) then
            zclib.PointerSystem.Data.Target = zclib.PointerSystem.Data.HitEntity
        else
            zclib.PointerSystem.Data.Target = nil
        end

        if zclib.util.InDistance(zclib.PointerSystem.Data.Pos, LocalPlayer():GetPos(), 500) then
            zclib.PointerSystem.Data.MainColor = zclib.colors["green01"]
        else
            zclib.PointerSystem.Data.MainColor = zclib.colors["red01"]
        end

        // Update PreviewModel
        if IsValid(zclib.PointerSystem.Data.PreviewModel) then
            if IsValid(zclib.PointerSystem.Data.Target) then
                zclib.PointerSystem.Data.PreviewModel:SetColor(zclib.PointerSystem.Data.MainColor)
                zclib.PointerSystem.Data.PreviewModel:SetPos(zclib.PointerSystem.Data.Target:GetPos())
                zclib.PointerSystem.Data.PreviewModel:SetAngles(zclib.PointerSystem.Data.Target:GetAngles())
                zclib.PointerSystem.Data.PreviewModel:SetModel(zclib.PointerSystem.Data.Target:GetModel())
                zclib.PointerSystem.Data.PreviewModel:SetModelScale(zclib.PointerSystem.Data.Target:GetModelScale())
                zclib.PointerSystem.Data.PreviewModel:SetNoDraw(false)
            else
                zclib.PointerSystem.Data.PreviewModel:SetNoDraw(true)
            end
        end
    end,nil,function()
    end)
end

// Performs a custom function on the specified slot item
function zclib.Inventory.CustomOption(ent,slot,SlotOption)

    zclib.Inventory.RemoveSlotOptions()

    net.Start("zclib_Inventory_CustomOption")
    net.WriteEntity(ent)
    net.WriteInt(slot,10)
	net.WriteString(SlotOption)
    net.SendToServer()
end

--PATH addons/brick_s_server_framework/lua/bricks_server/bricks_server_basecfg_main.lua:
--[[
    !!WARNING!!
        ALL CONFIG IS DONE INGAME, DONT EDIT ANYTHING HERE
        Type !bricksserver ingame
    !!WARNING!!
]]--

--[[ MODULES CONFIG ]]--
BRICKS_SERVER.BASECONFIG.MODULES = BRICKS_SERVER.BASECONFIG.MODULES or {}
BRICKS_SERVER.BASECONFIG.MODULES["default"] = { true, {
    ["currencies"] = true
} }

--[[ GENERAL CONFIG ]]--
BRICKS_SERVER.BASECONFIG.GENERAL = BRICKS_SERVER.BASECONFIG.GENERAL or {}
BRICKS_SERVER.BASECONFIG.GENERAL["Donate Link"] = "https://www.blackrockgaming.co.uk/donate"
BRICKS_SERVER.BASECONFIG.GENERAL["Server Name"] = "BRG"
BRICKS_SERVER.BASECONFIG.GENERAL["3D2D Display Distance"] = 500000
BRICKS_SERVER.BASECONFIG.GENERAL["Use Textured Gradients (Better FPS)"] = true
BRICKS_SERVER.BASECONFIG.GENERAL.AdminPermissions = { 
    ["superadmin"] = true, 
    ["uprav"] = true
}
BRICKS_SERVER.BASECONFIG.GENERAL.Groups = {
    [1] = { "Staff", { ["moderator"] = true, ["admin"] = true, ["superadmin"] = true } },
    [2] = { "VIP++", { ["vip++"] = true, ["superadmin"] = true }, Color(201,176,55) },
    [3] = { "VIP+", { ["vip+"] = true, ["vip++"] = true, ["superadmin"] = true }, Color(180,180,180) },
    [4] = { "VIP", { ["vip"] = true, ["vip+"] = true, ["vip++"] = true, ["superadmin"] = true }, Color(173,138,86) },
    [5] = { "User", {}, Color(201, 70, 70), true }
}
BRICKS_SERVER.BASECONFIG.GENERAL.Rarities = {
    [1] = { "Common", "Gradient", { Color( 154, 154, 154 ), Color( 154*1.5, 154*1.5, 154*1.5 ) } },
    [2] = { "Uncommon", "Gradient", { Color( 104, 255, 104 ), Color( 104*1.5, 255*1.5, 104*1.5 ) } },
    [3] = { "Rare", "Gradient", { Color( 42, 133, 219 ),Color( 42*1.5, 133*1.5, 219*1.5 )  } },
    [4] = { "Epic", "Gradient", { Color( 152, 68, 255 ), Color( 152*1.5, 68*1.5, 255*1.5 ) } },
    [5] = { "Legendary", "Gradient", { Color( 253, 162, 77 ), Color( 253*1.5, 162*1.5, 77*1.5 ) } },
    [6] = { "Glitched", "Rainbow" }
}

--[[ LANGUAGE CONFIG ]]--
BRICKS_SERVER.BASECONFIG.LANGUAGE = {}
BRICKS_SERVER.BASECONFIG.LANGUAGE.Language = "english"
BRICKS_SERVER.BASECONFIG.LANGUAGE.Languages = {}

--[[ THEME CONFIG ]]--
BRICKS_SERVER.BASECONFIG.THEME = {}
BRICKS_SERVER.BASECONFIG.THEME[0] = Color(25, 25, 25)
BRICKS_SERVER.BASECONFIG.THEME[1] = Color(40, 40, 40)
BRICKS_SERVER.BASECONFIG.THEME[2] = Color(49, 49, 49)
BRICKS_SERVER.BASECONFIG.THEME[3] = Color(68, 68, 68)
BRICKS_SERVER.BASECONFIG.THEME[4] = Color(181, 50, 50)
BRICKS_SERVER.BASECONFIG.THEME[5] = Color(201, 70, 70)
BRICKS_SERVER.BASECONFIG.THEME[6] = Color(255, 255, 255)

--[[ INVENTORY ]]--
BRICKS_SERVER.BASECONFIG.INVENTORY = BRICKS_SERVER.BASECONFIG.INVENTORY or {}
BRICKS_SERVER.BASECONFIG.INVENTORY.ItemRarities = {
    ["Wood"] = "Uncommon",
    ["Scrap"] = "Uncommon",
    ["Iron"] = "Common",
    ["Plastic"] = "Common",
    ["Ruby"] = "Rare",
    ["Diamond"] = "Epic",
    ["weapon_ak472"] = "Legendary",
    ["weapon_deagle2"] = "Rare",
    ["weapon_fiveseven2"] = "Common",
    ["weapon_glock2"] = "Common",
    ["weapon_p2282"] = "Common",
    ["weapon_m42"] = "Rare",
    ["weapon_mac102"] = "Uncommon",
    ["weapon_mp52"] = "Uncommon",
    ["weapon_pumpshotgun2"] = "Uncommon",
    ["ls_sniper"] = "Epic",
}
BRICKS_SERVER.BASECONFIG.INVENTORY.Whitelist = {
    ["spawned_shipment"] = { true, true },
    ["spawned_weapon"] = { true, true },
    ["bricks_server_ink"] = { false, true },
    ["bricks_server_resource"] = { false, true },
    ["bricks_server_resource_wood"] = { false, true },
    ["bricks_server_resource_scrap"] = { false, true },
    ["bricks_server_resource_iron"] = { false, true },
    ["bricks_server_resource_plastic"] = { false, true },
    ["bricks_server_resource_ruby"] = { false, true },
    ["bricks_server_resource_diamond"] = { false, true }
}

--[[ NPCS ]]--
BRICKS_SERVER.BASECONFIG.NPCS = BRICKS_SERVER.BASECONFIG.NPCS or {}
--PATH addons/bricks_gangs/lua/bricks_server/languages/bricks_gangs/russian.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "russian", {
    ["gang"] = "Банда",
    ["gangNew"] = "Создать банду",
    ["gangRequestCooldown"] = "Пожалуйста подождите, прежде чем запросить другие банды!",
    ["gangRequestDataCooldown"] = "Пожалуйста подождите, прежде чем запросить данную про банды!",
    ["gangNewUpgrade"] = "Новое улучшение",
    ["gangUpgradeTierEdit"] = "%s - Уровень %d",
    ["gangNewAchievement"] = "Новое достижение",
    ["gangNewTerritory"] = "Новая территория",
    ["gangRewardTime"] = "Время приза",
    ["gangRewardTimeQuery"] = "Как часто банда которая одержала терреторию, должна получать награды?",
    ["gangRewards"] = "Награды",
    ["gangNewLeaderboard"] = "Новое меню лидеров",
    ["gangRankQuery"] = "Какой ранг вы хотели бы установить?",
    ["gangPlayerAlreadyRank"] = "Данный игрок уже имеет данный ранг!",
    ["gangInvalidRank"] = "Неверный ранг.",
    ["gangKick"] = "Выгнать",
    ["gangKickConfirm"] = "Вы уверены что хотите выгнать данного игрока?",
    ["gangSetOwner"] = "Установить владельца",

    ["gangInbox"] = "Криминальная почта",
    ["gangNoNotifications"] = "У вас нет новых уведомлений!",
    ["gangTimeAgo"] = "%s назад",
    ["gangNotification"] = "новое уведомление",
    ["gangNotificationHeader"] = "Какой будет заголовок уведомления?",
    ["gangAdminNotification"] = "Админское уведомление",
    ["gangNotificationBody"] = "Что вы напишите в основной части уведомления?",
    ["gangAdminNotificationSent"] = "Админское уведомление отправлено %s!",

    ["gangVariables"] = "Вариации Банды",
    ["gangUpgrades"] = "Улучшение банды",
    ["gangAchievements"] = "Достижения банды",
    ["gangTerritories"] = "Территория банды",
    ["gangLeaderboards"] = "Доска лидеров",

    ["gangClaimedAchievement"] = "Успешно, получено достижение!",
    ["gangAlreadyAssociation"] = "Ваша банда уже имеет такой тип связи с другой бандой!",
    ["gangAlreadySentAssociation"] = "Ваша банда уже отправила им приглашение, в ассоциацию!",
    ["gangAssociationSent"] = "Приглашение ассоциации отправлено!",
    ["gangAssociationAccepted"] = "Приглашение ассоциации принято!",
    ["gangNoAssociation"] = "Ваша банда не имеет никакого отношения к этой банде!",
    ["gangAssociationDissolved"] = "Ассоциация распущена!",

    ["gangOwner"] = "Владелец",
    ["gangOfficer"] = "Офицер",
    ["gangMember"] = "Участник",

    ["gangCannotDeposit"] = "Вы не можете положить это оружие!",
    ["gangStorageFullError"] = "Хранилище банды переполнено!",
    ["gangDepositedItem"] = "Вы поклали предмет в хранилище банды!",
    ["gangDroppedItem"] = "Выброшено 1 предмет из вашего хранилища банды.",
    ["gangUsedItem"] = "Использован 1 предмет из вашего хранилища банды.",
    ["gangCantUse"] = "Вы не можете использовать это!",

    ["gangKicked"] = "Вас выгнали из банды %s!",
    ["gangAlreadyIn"] = "Вы уже в банде!",
    ["gangNameLength"] = "Название банды не может быть длиннее %d символов!",
    ["gangIconLength"] = "URL значка банды не может быть длиннее %d символов!",
    ["gangCreatedFor"] = "Ваша новая банда была создана для %s!",
    ["gangCreated"] = "Ваша банда создана!",
    ["gangCreationNoMoney"] = "Вам не хватает денег, вам нужно %s!",
    ["gangWaitBeforeSaving"] = "Пожалуйста, подождите %d секунд, прежде чем сохранить изменения!",
    ["gangRolesUpdated"] = "Ранги банды обновлены!",
    ["gangCannotTarget"] = "Вы не можете трогать его!",
    ["gangRankNotExists"] = "Данный ранг не найден!",
    ["gangCantPromote"] = "Вы не можете повысить кого-либо на уровень выше, или такой же как у вас!",
    ["gangRankSet"] = "Ранг успешно установлен!",
    ["gangRankSetFail"] = "Не удалось установить ранг!",
    ["gangSettingsUpdated"] = "Настройки банды обновлены!",
    ["gangPlayerKicked"] = "Удачно выгнан %s с вашей банды!",
    ["gangPlayerKickError"] = "Ошибка при изгнании учасника!",
    ["gangWaitBeforeInvite"] = "Пожалуйста, подождите 10 секунд прежде чем пригласить другого игрока!",
    ["gangPlayerOffline"] = "Этот игрок больше не в сети!",
    ["gangPlayerAlreadyInvited"] = "Этот игрок уже имеет активное приглашение!",
    ["gangPlayerInvited"] = "Вы пригласили, %s в вашу банду!",
    ["gangInviteReceived"] = "Вы были приглашены в банду %s! Введите !gang дабы принять.",
    ["gangLeaveCurrent"] = "Вы должны покинуть свою текущую банду в первую очередь!",
    ["gangReachedMemberLimit"] = "Банда достигла предела своих участников!",
    ["gangJoined"] = "Успешно вступили в %s!",
    ["gangNotEnoughMoney"] = "Вам не хватает денег!",
    ["gangDepositedMoney"] = "Вы успешно внесли %s в вашу банду!",
    ["gangWithdrewMoney"] = "Вы успешно сняли %s с вашей банды!",
    ["gangDisbanded"] = "Ваша банда успешно распущена %s!",
    ["gangOwnershipTransfered"] = "Успешно передано право владения банды с %s на %s!",
    ["gangLeft"] = "Вы покинули %s!",

    ["gangTerritoryCaptured"] = "Ваша банда захватила %s территорию!",
    ["gangIncorrectLevel"] = "Ваша банда не имеет нужный уровень, чтобы купить это обновление!",
    ["gangIncorrectGroup"] = "Вы не подходящая группа, чтобы купить это обновление!",
    ["gangUpgradeBought"] = "Обновление куплено для банды %s!",
    ["gangNotEnoughFunds"] = "У вашей банды недостаточно средств для покупки этого улучшения!",

    ["gangAddAchievement"] = "Добавить достижение",
    ["gangNewAchievementType"] = "Каким должен быть новый тип достижений?",
    ["gangAddLeaderboard"] = "Добавить таблицу лидеров",
    ["gangNewLeaderboardType"] = "Каким должен быть новый тип таблицы лидеров??",
    ["gangAddTerritory"] = "Добавить территорию",
    ["gangAddTier"] = "Добавить уровень",
    ["gangTierX"] = "Уровень %d",
    ["gangNewUpgradeType"] = "Каким должен быть новый тип улучшения?",
    ["gangNewUpgradeDesc"] = "Новое описание улучшения.",

    ["gangDepositMenu"] = "Меню депозита",
    ["gangDepositInventoryQuery"] = "Вы хотите внести депозит %s с вашего инвентаря?",
    ["gangDepositPlayerQuery"] = "Вы хотите внести депозит %s с вашего владения?",
    ["gangNoDepositItems"] = "У вас нет предметов, которые можно сдать на в хранилище банды!",

    ["gangMenu"] = "Меню банды",
    ["gangNone"] = "Нет банды",
    ["gangID"] = "ID: %d",
    ["gangDashboard"] = "Управление",
    ["gangMembers"] = "Участники",
    ["gangStorage"] = "Хранилище",
    ["gangUpgrades"] = "Улучшения",
    ["gangBalance"] = "Баланс",
    ["gangAchievements"] = "Достижения",
    ["gangAssociations"] = "Ассоциации",
    ["gangLeaderboards"] = "Таблица лидеров",
    ["gangTerritories"] = "Территории",
    ["gangRanks"] = "Ранги",
    ["gangCreate"] = "Создать банду",
    ["gangProgress"] = "Прогресс: %s",

    ["gangNoneFound"] = "По вашему запросу ничего не найдено.",
    ["gangMemberCount"] = "%d/%d Участники",
    ["gangFailedToLoad"] = "Произошла ошибка при загрузке данных!",
    ["gangSetRank"] = "Установить ранг",
    ["gangDissolveAssociation"] = "Хотели бы вы расторгнуть эту ассоциацию??",
    ["gangAssociationStatus"] = "Статус: %s",
    ["gangNeutral"] = "Нейтрально",
    ["gangCreateString"] = "Создать банду для %s",
    ["gangName"] = "Название:",
    ["gangIcon"] = "URL Значка:",
    
    ["gangInformation"] = "ИНФОРМАЦИЯ О БАНДЕ",
    ["gangChat"] = "ЧАТ БАНДЫ",
    ["gangMessage"] = "Сообщение банды",
    ["gangActions"] = "ДЕЙСТВИЯ БАНДЫ",
    ["gangDepositMoney"] = "Внести деньги",
    ["gangDepositMoneyQuery"] = "Сколько бы вы хотели внести на депозит?",
    ["gangDepositMoneyLess"] = "Вы не можете внести депозит меньше, чем %s!",
    ["gangDepositMoneyMuch"] = "Баланс вашей банды не может вместить так много, вы должны улучшить хранилище баланса!",
    ["gangWithdrawMoney"] = "Снять деньги",
    ["gangWithdrawMoneyQuery"] = "Сколько бы вы хотели снять?",
    ["gangWithdrawMoneyLess"] = "Вы не можете снять меньше, чем %s!",
    ["gangWithdrawMoneyMuch"] = "Вашей банде не хватает средств!",
    ["gangInvitePlayer"] = "Пригласить игрока",
    ["gangInvitePlayerQuery"] = "Какого игрока вы бы хотели пригласить?",
    ["gangDisband"] = "Распустить банду",
    ["gangDisbandQuery"] = "Удаление банды не может быть отменено, введите 'Подтверждаю' дабы удалить банду.",
    ["gangTransfer"] = "Передать права на банду",
    ["gangTransferQuery"] = "Кому бы вы хотели передать права банды?",
    ["gangLeave"] = "Покинуть банду",
    ["gangLeaveQuery"] = "Вы уверены, что хотите покинуть эту банду??",
    ["gangMemberUpper"] = "УЧАСТНИКИ БАНДЫ",
    ["gangHighestRank"] = "Наивысший ранг",
    ["gangLowestRank"] = "Самый низкий ранг",

    ["gangUnsavedChanges"] = "Внимание! У вас есть несохраненные изменения.",
    ["gangSaveChanges"] = "Сохранить изменения",
    ["gangReset"] = "Сбросить",
    ["gangRanksUpper"] = "РАНГИ БАНДЫ",
    ["gangNewRank"] = "Новый ранг",
    ["gangRankName"] = "Название ранга",
    ["gangRankColor"] = "Цвет ранга",
    ["gangClearPerms"] = "Очистить права",
    ["gangDeleteRank"] = "Удалить ранг",
    ["gangDeleteRankQuery"] = "Вы уверены, что хотите удалить этот ранг?",

    ["gangStorageUpper"] = "ХРАНИЛИЩЕ БАНДЫ",
    ["gangStorageProgress"] = "Заполненость %d/%d",
    ["gangClaimed"] = "Создано",
    ["gangUnclaimed"] = "Не создано",
    ["gangClaimedAgo"] = "Создано %s назад",
    ["gangRewardsEvery"] = "Учитывая каждый %s",
    ["gangBuyUpgrade"] = "Вы хотите купить это обновление для %s?",
    ["gangUpgradeTier"] = "Уровень улучшения %d/%d",
    ["gangCurrent"] = "Текущий уровень: %s",
    ["gangNext"] = "Следующий уровень: %s",

    ["gangTerritoryUpper"] = "ТЕРРИТОРИЯ",
    ["gangCaptured"] = "ЗАХВАЧЕНО",
    ["gangTerritoryAlready"] = "Ваша банда уже захватила эту территорию!",
    ["gangCaptureFail"] = "Вы отошли слишком далеко или погибли, захват не удался!",
    ["gangTerritoryPlaced"] = "Территория успешно размещена.",
    ["gangInvalidTerritory"] = "Неверная территория, выберите действительную из меню инструментов.",
    ["gangTerritoryRemoved"] = "Территория успешно удалена.",
    ["gangTerritoryRemoveFail"] = "Вы можете использовать этот инструмент только для удаления/создания территорий.",
    ["gangTerritoryDesc"] = "Размещает и удаляет территории с Brick's Gangs. Щелкните левой кнопкой мыши - поместите, щелкните правой кнопкой мыши - удалите.",
    ["gangTerritory"] = "ТЕРРИТОРИЯ",
    ["gangTerritoryPlacer"] = "Место территории",
    ["gangTerritoryDescSmall"] = "Размещает и удаляет территории с сервера Брик.",
    ["gangTerritoryInstructions"] = "Левый клик - разместить, правый клик - удалить.",

    ["gangSettings"] = "Настройки",
    ["gangManagement"] = "Управление",
    ["gangChatLower"] = "Чат банды",
    ["gangDepositItems"] = "Депозит предметами",
    ["gangWithdrawItems"] = "Забрать предметы",
    ["gangViewStorage"] = "Посмотреть хранилище",
    ["gangEditRoles"] = "Изменить ранги",
    ["gangEditSettings"] = "Изменить настройки",
    ["gangInvitePlayers"] = "Пригласить игроков",
    ["gangKickPlayers"] = "Выгнать игроков",
    ["gangChangeRank"] = "Изменить ранг игрока",
    ["gangPurchaseUpgrades"] = "Купить улучшение",
    ["gangAcceptDeclineInbox"] = "Принять или отклонить входящие уведомления",
    ["gangAssociationSend"] = "Отправить запросы на ассоциацию",
    ["gangAssociationAccept"] = "Принять запросы на ассоциацию",
    ["gangSendChatMessages"] = "Отправить сообщение в чат",
    ["gangMaxMembers"] = "Макс. Участников",
    ["gangMaxBalance"] = "Макс. Баланс",
    ["gangStorageSlots"] = "Слоты хранилища",
    ["gangXSlots"] = "%d Слотов",
    ["gangSlots"] = "Слотов",
    ["gangIncreasedHealth"] = "Увеличение здоровья",
    ["gangExtraHealth"] = "Дополнительное здоровье",
    ["gangXHP"] = "+%d ХП",
    ["gangIncreasedArmor"] = "Усиленная броня",
    ["gangXAP"] = "+%d ЗАЩИТЫ",
    ["gangExtraArmor"] = "Дополнительная броня",
    ["gangIncreasedSalary"] = "Увеличение зарплаты",
    ["gangExtraSalary"] = "Дополнительная зарплата",
    ["gangPermWeapon"] = "Вечное оружие",
    ["gangWeapon"] = "Оружие",
    ["gangBalanceFull"] = "Баланс банды",
    ["gangMembersFull"] = "Участники банды",
    ["gangStorageFull"] = "Хранилище банды",
    ["gangItems"] = "Предметы",
    ["gangItem"] = "Предмет",
    ["gangLevel"] = "Уровень банды",
    ["gangInvite"] = "Пригласить в банду",
    ["gangInviteReceivedInbox"] = "Вас пригласили вступить в банду %s!",
    ["gangAssociationInvite"] = "Приглашение ассоциации",
    ["gangAssociationInviteInbox"] = "Банда %s запросила ассоциацию '%s' с вашей бандой!",
    ["gangAssociationCreated"] = "Ассоциация создана",
    ["gangAssociationCreatedInbox"] = "Ваша банда теперь имеет ассоциацию '%s' с бандой %s!",
    ["gangAssociationDissolved"] = "Ассоциация распущена",
    ["gangAssociationDissolvedInbox"] = "Ваша связь с бандой %s распущена!",
    ["gangInboxAchievement"] = "Достижение банды",
    ["gangInboxAchievementCompleted"] = "Ваша банда завершила '%s' достижение!",
    ["gangInboxAchievementCompletedReward"] = "Ваша банда завершила '%s' достижение, ваша награда: %s!",
    ["gangExperienceFull"] = "Опыт банды",
    ["gangJobWhitelist"] = "Белый список профессий",
    ["gangJobs"] = "Работы",
    ["gangJobsSelect"] = "Выберите команды, в которых игроки занесены в белый список.",
    ["gangStorageItems"] = "Хранение предметов",
    ["gangAllyRequest"] = "Вы уверены, что хотите запросить союз с этой бандой?",
    ["gangWarRequest"] = "Вы уверены, что хотите запросить войну с этой бандой?",
    ["gangSetLevel"] = "Установить уровень",
    ["gangSetLevelQuery"] = "Каким должен быть новый уровень банды?",
    ["gangSetLevelMsg"] = "Успешно установлен уровень банды с %s на %d!",
    ["gangAddExperience"] = "Добавить опыт",
    ["gangAddExperienceQuery"] = "Какой опыт вы бы хотели добавить в банду?",
    ["gangAddExperienceMsg"] = "Успешно добавил %s опыта в банду %s!",
    ["gangSetBalance"] = "Установить баланс",
    ["gangSetBalanceQuery"] = "Каким должен быть новый баланс банды?",
    ["gangSetBalanceMsg"] = "Успешно установлен баланс банды с %s на %s!",
    ["gangAddBalance"] = "Добавить баланс",
    ["gangAddBalanceQuery"] = "Сколько денег вы хотели бы добавить на баланс банды?",
    ["gangAddBalanceMsg"] = "Успешно добавлено %s баланс для банды %s!",
    ["gangViewMembers"] = "Просмотр участников",
    ["gangCantKickOwner"] = "Вы не можете выгнать владельца банды!",
    ["gangKickSuccessAdmin"] = "Успешно выгнали участника из банды!",
    ["gangKickFailAdmin"] = "Не удалось выгнать участника из банды!",
    ["gangSetRankSuccessAdmin"] = "Успешно установить ранг участника!",
    ["gangSetRankFailAdmin"] = "Не удалось установить ранг участника!",
    ["gangMemberAlreadyOwner"] = "Этот участник уже является владельцем этой банды!",
    ["gangNotMember"] = "Этот игрок не является участником этой банды!",
    ["gangOwnershipTransferedAdmin"] = "Успешно переданы права на банду!",
    ["gangDeleteAdminQuery"] = "Удаление банды не может быть отменено, введите 'Подтверждаю' дабы удалить банду.",
    ["gangDeleteSuccessAdmin"] = "Успешно удалили банду %s!",
    ["gangMenuBind"] = "Хоткей(Бинд) для меню банды",
	["gangTerritoryBeingCaptured"] = "Территория вашей банды %s захватывается!"
} )
--PATH addons/brick_s_server_framework/lua/sh_cami.lua:
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

--PATH addons/brick_s_server_framework/lua/bricks_server/core/shared/sh_modules.lua:
BRICKS_SERVER.DLCMODULES = {}
function BRICKS_SERVER.Func.AddDLCModule( id, table )
    BRICKS_SERVER.DLCMODULES[id] = table
end

BRICKS_SERVER.Func.AddDLCModule( "essentials", {
    ScriptID = 7244,
    Name = "Brick's Essentials", 
    Color = Color( 64, 126, 187 ),
    Icon = "materials/bricks_server/essentials.png", 
    Link ="https://www.gmodstore.com/market/view/bricks-essentials", 
    Description = "An all-in-one system that includes: F4 menu, Inventory, Crafting, HUD, Levelling, Printers, Marketplace, Zones, Bosses, Boosters and more!" ,
    Modules = { "essentials" }
} )

BRICKS_SERVER.Func.AddDLCModule( "gangs", {
    ScriptID = 7319,
    Name = "Brick's Gangs", 
    Color = Color( 255, 57, 57 ),
    Icon = "materials/bricks_server/gangs.png", 
    Link ="https://www.gmodstore.com/market/view/brick-s-gangs-territories-associations-achievements-more", 
    Description = "A gang system that includes Upgrades, Territories, Storage, Ranks, Achievements, Leaderboards and more!" ,
    Modules = { "gangs" }
} )

BRICKS_SERVER.Func.AddDLCModule( "unboxing", {
    ScriptID = 7476,
    Name = "Brick's Unboxing", 
    Color = Color( 26, 188, 156 ),
    Icon = "materials/bricks_server/unboxing.png", 
    Link = "https://www.gmodstore.com/market/view/brick-s-unboxing",
    Description = "An unboxing system that includes Crates, Keys, Trading, Marketplace, Shop and more!" ,
    Modules = { "unboxing" }
} )

BRICKS_SERVER.Func.AddDLCModule( "coinflip", {
    Name = "Brick's Coinflip", 
    Color = Color( 46, 204, 113 ),
    Icon = "materials/bricks_server/coinflip_64.png", 
    Link = "https://www.gmodstore.com/market/view/brick-s-coinflip-flip-items-and-money",
    Description = "A coinflip script that allows players to gamble their money and items!" ,
    Modules = { "coinflip" }
} )
--PATH addons/brick_s_server_framework/lua/bricks_server/core/client/cl_bshadows.lua:
local function createShadows()
    BRICKS_SERVER.BSHADOWS = {}
    
    --The original drawing layer
    BRICKS_SERVER.BSHADOWS.RenderTarget = GetRenderTarget("bshadows_original_" .. ScrW(), ScrW(), ScrH())
    
    --The shadow layer
    BRICKS_SERVER.BSHADOWS.RenderTarget2 = GetRenderTarget("bshadows_shadow_" .. ScrW(),  ScrW(), ScrH())
    
    --The matarial to draw the render targets on
    BRICKS_SERVER.BSHADOWS.ShadowMaterial = CreateMaterial("bshadows_" .. ScrW(),"UnlitGeneric",{
        ["$translucent"] = 1,
        ["$vertexalpha"] = 1,
        ["alpha"] = 1
    })
    
    --When we copy the rendertarget it retains color, using this allows up to force any drawing to be black
    --Then we can blur it to create the shadow effect
    BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale = CreateMaterial("bshadows_grayscale_" .. ScrW(),"UnlitGeneric",{
        ["$translucent"] = 1,
        ["$vertexalpha"] = 1,
        ["$alpha"] = 1,
        ["$color"] = "0 0 0",
        ["$color2"] = "0 0 0"
    })
    
    --Call this to begin drawing a shadow
    BRICKS_SERVER.BSHADOWS.BeginShadow = function( AreaX, AreaY, AreaEndX, AreaEndY )
        --Set the render target so all draw calls draw onto the render target instead of the screen
        render.PushRenderTarget(BRICKS_SERVER.BSHADOWS.RenderTarget)
    
        --Clear is so that theres no color or alpha
        render.OverrideAlphaWriteEnable(true, true)
        render.Clear(0,0,0,0)
        render.OverrideAlphaWriteEnable(false, false)
    
        if( AreaX and AreaY and AreaEndX and AreaEndY ) then
            render.SetScissorRect( AreaX, AreaY, AreaEndX, AreaEndY, true )
        end

        --Start Cam2D as where drawing on a flat surface 
        cam.Start2D()
    
        --Now leave the rest to the user to draw onto the surface
    end
    
    --This will draw the shadow, and mirror any other draw calls the happened during drawing the shadow
    BRICKS_SERVER.BSHADOWS.EndShadow = function(intensity, spread, blur, opacity, direction, distance, _shadowOnly)
        
        --Set default opcaity
        opacity = opacity or 255
        direction = direction or 0
        distance = distance or 0
        _shadowOnly = _shadowOnly or false
    
        --Copy this render target to the other
        render.CopyRenderTargetToTexture(BRICKS_SERVER.BSHADOWS.RenderTarget2)
    
        --Blur the second render target
        if blur > 0 then
            render.OverrideAlphaWriteEnable(true, true)
            render.BlurRenderTarget(BRICKS_SERVER.BSHADOWS.RenderTarget2, spread, spread, blur)
            render.OverrideAlphaWriteEnable(false, false) 
        end
    
        --First remove the render target that the user drew
        render.PopRenderTarget()
    
        --Now update the material to what was drawn
        BRICKS_SERVER.BSHADOWS.ShadowMaterial:SetTexture('$basetexture', BRICKS_SERVER.BSHADOWS.RenderTarget)
    
        --Now update the material to the shadow render target
        BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale:SetTexture('$basetexture', BRICKS_SERVER.BSHADOWS.RenderTarget2)
    
        --Work out shadow offsets
        local xOffset = math.sin(math.rad(direction)) * distance 
        local yOffset = math.cos(math.rad(direction)) * distance
    
        --Now draw the shadow
        BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale:SetFloat("$alpha", opacity/255) --set the alpha of the shadow
        render.SetMaterial(BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale)
        for i = 1 , math.ceil(intensity) do
            render.DrawScreenQuadEx(xOffset, yOffset, ScrW(), ScrH())
        end
    
        if not _shadowOnly then
            --Now draw the original
            BRICKS_SERVER.BSHADOWS.ShadowMaterial:SetTexture('$basetexture', BRICKS_SERVER.BSHADOWS.RenderTarget)
            render.SetMaterial(BRICKS_SERVER.BSHADOWS.ShadowMaterial)
            render.DrawScreenQuad()
        end
    
        cam.End2D()

        render.SetScissorRect( 0, 0, 0, 0, false )
    end
    
    --This will draw a shadow based on the texture you passed it.
    BRICKS_SERVER.BSHADOWS.DrawShadowTexture = function(texture, intensity, spread, blur, opacity, direction, distance, shadowOnly)
    
        --Set default opcaity
        opacity = opacity or 255
        direction = direction or 0
        distance = distance or 0
        shadowOnly = shadowOnly or false
    
        --Copy the texture we wish to create a shadow for to the shadow render target
        render.CopyTexture(texture, BRICKS_SERVER.BSHADOWS.RenderTarget2)
    
        --Blur the second render target
        if blur > 0 then
            render.PushRenderTarget(BRICKS_SERVER.BSHADOWS.RenderTarget2)
            render.OverrideAlphaWriteEnable(true, true)
            render.BlurRenderTarget(BRICKS_SERVER.BSHADOWS.RenderTarget2, spread, spread, blur)
            render.OverrideAlphaWriteEnable(false, false) 
            render.PopRenderTarget()
        end
    
        --Now update the material to the shadow render target
        BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale:SetTexture('$basetexture', BRICKS_SERVER.BSHADOWS.RenderTarget2)
    
        --Work out shadow offsets
        local xOffset = math.sin(math.rad(direction)) * distance 
        local yOffset = math.cos(math.rad(direction)) * distance
    
        --Now draw the shadow 
        BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale:SetFloat("$alpha", opacity/255) --Set the alpha
        render.SetMaterial(BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale)
        for i = 1 , math.ceil(intensity) do
            render.DrawScreenQuadEx(xOffset, yOffset, ScrW(), ScrH())
        end
        if not shadowOnly then
            --Now draw the original
            BRICKS_SERVER.BSHADOWS.ShadowMaterial:SetTexture('$basetexture', texture)
            render.SetMaterial(BRICKS_SERVER.BSHADOWS.ShadowMaterial)
            render.DrawScreenQuad()
        end
    end
end
createShadows()

hook.Add( "OnScreenSizeChanged", "BRS.OnScreenSizeChanged.Shadows", createShadows )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/client/cl_gang_inbox.lua:
net.Receive( "BRS.Net.SendGangInbox", function()
	BRS_GANG_INBOXES = net.ReadTable() or {}
end )

net.Receive( "BRS.Net.SendGangInboxEntry", function()
	local receiverKey = net.ReadString()
	local inboxKey = net.ReadUInt( 16 )
	local inboxEntryTable = net.ReadTable()

	if( not BRS_GANG_INBOXES ) then
		BRS_GANG_INBOXES = {}
	end

	if( isnumber( tonumber( receiverKey ) ) ) then
		receiverKey = tonumber( receiverKey )
	end

	if( not BRS_GANG_INBOXES[receiverKey] ) then
		BRS_GANG_INBOXES[receiverKey] = {}
	end

	BRS_GANG_INBOXES[receiverKey][inboxKey] = inboxEntryTable

	hook.Run( "BRS.Hooks.RefreshGangInbox" )
end )

net.Receive( "BRS.Net.RemoveGangInboxEntry", function()
	local receiverKey = net.ReadString()
	local inboxKey = net.ReadUInt( 16 )

	if( isnumber( tonumber( receiverKey ) ) ) then
		receiverKey = tonumber( receiverKey )
	end

	if( not BRS_GANG_INBOXES or not BRS_GANG_INBOXES[receiverKey] or not BRS_GANG_INBOXES[receiverKey][inboxKey] ) then return end

	BRS_GANG_INBOXES[receiverKey][inboxKey] = nil

	hook.Run( "BRS.Hooks.RefreshGangInbox" )
end )

BRICKS_SERVER.Func.AddAdminPlayerFunc( BRICKS_SERVER.Func.L( "gangNotification" ), BRICKS_SERVER.Func.L( "add" ), function( ply ) 
	BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "gangNotificationHeader" ), BRICKS_SERVER.Func.L( "gangAdminNotification" ), function( header ) 
		BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "gangNotificationBody" ), "", function( body ) 
			net.Start( "BRS.Net.AddGangAdminMail" )
				net.WriteString( ply:SteamID() )
				net.WriteString( header )
				net.WriteString( body )
			net.SendToServer()
		end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
	end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
end )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu.lua:
local PANEL = {}

function PANEL:Init()
    self:SetHeader( string.upper( BRICKS_SERVER.Func.L( "gangMenu" ) ) )
    self:SetSize( ScrW()*0.6, ScrH()*0.65 )
    self:Center()
    self.removeOnClose = false

    self.mainPanel = vgui.Create( "DPanel", self )
    self.mainPanel:Dock( FILL )
    self.mainPanel.Paint = function( self2, w, h ) end

    self:RefreshGang()

    hook.Add( "BRS.Hooks.RefreshGang", self, function(  self, valuesChanged, refreshGang )
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

    local gangTable = (BRICKS_SERVER_GANGS or {})[LocalPlayer():GetGangID()]

    local height = BRICKS_SERVER.Func.ScreenScale( 55 )
    local avatarSize = ((gangTable or {}).Icon and height-2*BRICKS_SERVER.UI.Margin5) or 32
    local textStartPos = BRICKS_SERVER.Func.ScreenScale( 65 )

    local gangIconBack = vgui.Create( "DPanel", self.sheet.Navigation )
    gangIconBack:Dock( TOP )
    gangIconBack:DockMargin( 10, 10, 10, 0 )
    gangIconBack:SetTall( height )
    local groupData = LocalPlayer():GangGetGroupData()
    gangIconBack.Paint = function( self2, w, h )
        draw.RoundedBox( 8, 0, 0, h, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

        draw.SimpleText( ((gangTable and (gangTable.Name or BRICKS_SERVER.Func.L( "nil" ))) or BRICKS_SERVER.Func.L( "gangNone" )), "BRICKS_SERVER_Font23", textStartPos, h/2+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )
        draw.SimpleText( ((groupData and groupData[1]) or "None"), "BRICKS_SERVER_Font17", textStartPos+1, h/2-2, ((groupData and groupData[2]) or BRICKS_SERVER.Func.GetTheme( 6 )), 0, 0 )
    end

    local gangIcon = vgui.Create( "bricks_server_gangicon", gangIconBack )
    gangIcon:SetSize( avatarSize, avatarSize )
    gangIcon:SetPos( BRICKS_SERVER.UI.Margin5, BRICKS_SERVER.UI.Margin5 )
    gangIcon:SetIconURL( (gangTable or {}).Icon or "bricks_server/question.png" )

    local levelBarH = 16
    local levelBack = vgui.Create( "DPanel", self.sheet.Navigation )
    levelBack:Dock( TOP )
    levelBack:DockMargin( 10, 10, 10, 25 )
    levelBack:SetTall( levelBarH+20 )
    levelBack.Paint = function( self2, w, h )
        draw.SimpleText( string.upper( BRICKS_SERVER.Func.L( "levelX", (gangTable or {}).Level or 0) ), "BRICKS_SERVER_Font15", 0, h-levelBarH-3, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )

        local currentXP = math.max( 0, ((gangTable or {}).Experience or 0)-BRICKS_SERVER.Func.GetGangExpToLevel( 0, ((gangTable or {}).Level or 0) ) )
        local goalXP = math.max( 0, BRICKS_SERVER.Func.GetGangExpToLevel( ((gangTable or {}).Level or 0), ((gangTable or {}).Level or 0)+1 ) )

        draw.SimpleText( string.Comma( math.floor( currentXP ) ) .. "/" .. string.Comma( math.floor( goalXP ) ) .. " Опыта", "BRICKS_SERVER_Font15", w, h-levelBarH-3, Color( BRICKS_SERVER.Func.GetTheme( 6 ).r, BRICKS_SERVER.Func.GetTheme( 6 ).g, BRICKS_SERVER.Func.GetTheme( 6 ).b, 75 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM )

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
        page.panelWide, page.panelHeight = ScrW()*0.6-BRICKS_SERVER.DEVCONFIG.MainNavWidth, ScrH()*0.65-self.headerHeight
        page.Paint = function( self, w, h ) end 
        if( page.FillPanel ) then
            self.sheet:AddSheet( v[1], page, function()
                page:FillPanel( gangTable )
                if page.UpdateTransactions then
                    self.UpdateTransactions = page.UpdateTransactions
                end 
            end, v[3], v[4], v[5] )
        else
            self.sheet:AddSheet( v[1], page, false, v[3], v[4], v[5] )
        end
    end

    if( self.previousSheet ) then
        self.sheet:SetActiveSheet( self.previousSheet )
    end
end

vgui.Register( "bricks_server_gangmenu", PANEL, "bricks_server_dframe" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/leaderboards/client/cl_gang_leaderboards.lua:
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "gangLeaderboards" ), "bricks_server_config_gang_leaderboards", "gangs" )

net.Receive( "BRS.Net.SendGangLeaderboardTables", function()
    BRS_GANG_LEADERBOARDS = net.ReadTable() or {}

    hook.Run( "BRS.Hooks.RefreshGangLeaderboards" )
end )

-- net.Receive( "BRS.Net.SendLeaderboardGangTables", function()
    -- if( not BRICKS_SERVER_GANGS ) then
        -- BRICKS_SERVER_GANGS = {}
    -- end

    -- for k, v in pairs( net.ReadTable() or {} ) do
        -- if( not BRICKS_SERVER_GANGS[k] ) then
            -- BRICKS_SERVER_GANGS[k] = {}
        -- end

        -- for key, val in pairs( v ) do
            -- BRICKS_SERVER_GANGS[k][key] = val
        -- end
    -- end

    -- hook.Run( "BRS.Hooks.RefreshGangLeaderboards" )
-- end )

-- function BRICKS_SERVER.Func.RequestLeaderboardGangs()
    -- if( CurTime() < (BRS_REQUEST_LEADERBOARDGANG_COOLDOWN or 0) ) then return end

    -- BRS_REQUEST_LEADERBOARDGANG_COOLDOWN = CurTime()+10

    -- net.Start( "BRS.Net.RequestLeaderboardGangs" )
    -- net.SendToServer()
-- end

function BRICKS_SERVER.Func.RequestGangLeaderboards()
	
    if( CurTime() < (BRS_REQUEST_GANGLEADERBOARDS_COOLDOWN or 0) ) then return end

    BRS_REQUEST_GANGLEADERBOARDS_COOLDOWN = CurTime()+3
	-- print('RequestGangLeaderboards')
    net.Start( "BRS.Net.RequestGangLeaderboards" )
    net.SendToServer()
end
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/territories/vgui/bricks_server_gangmenu_territories.lua:
local PANEL = {}

function PANEL:Init()
    self:DockMargin( 10, 10, 10, 10 )
end

function PANEL:FillPanel( gangTable )
    function self.RefreshPanel()
        self:Clear()

        for k, v in pairs( BRICKS_SERVER.CONFIG.GANGS.Territories or {} ) do
            local territoryTable = (BRS_GANG_TERRITORIES or {})[k] or {}
            local claimed = territoryTable.Claimed

            local itemBack = vgui.Create( "DPanel", self )
            itemBack:Dock( TOP )
            itemBack:DockMargin( 0, 0, 0, 5 )
            itemBack:SetTall( 140 )
            itemBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
            end

            local topBar = vgui.Create( "DPanel", itemBack )
            topBar:Dock( TOP )
            topBar:SetTall( 40 )
            surface.SetFont( "BRICKS_SERVER_Font20" )
            local nameX, nameY = surface.GetTextSize( v.Name )
            topBar.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                BRICKS_SERVER.Func.DrawPartialRoundedBox( 5, 0, 0, 3, h, (v.Color or BRICKS_SERVER.Func.GetTheme( 5 )), 10, h )
            
                draw.SimpleText( v.Name, "BRICKS_SERVER_Font20", 15, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )

                local text = (claimed and BRICKS_SERVER.Func.L( "gangClaimed" )) or BRICKS_SERVER.Func.L( "gangUnclaimed" )

                surface.SetFont( "BRICKS_SERVER_Font20" )
                local textX, textY = surface.GetTextSize( text )
                local boxW, boxH = textX+10, textY+3

                draw.RoundedBox( 5, 15+nameX+10, (h/2)-(boxH/2), boxW, boxH, (claimed and BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen) or BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
                draw.SimpleText( text, "BRICKS_SERVER_Font20", 15+nameX+10+(boxW/2), h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

                if( claimed ) then
                    local timeSince = math.max( 0, math.floor( os.time()-(territoryTable.ClaimedAt or 0) ) )

                    draw.SimpleText( BRICKS_SERVER.Func.L( "gangClaimedAgo", BRICKS_SERVER.Func.FormatWordTime( timeSince ) ), "BRICKS_SERVER_Font20", w-10, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
                end
            end

            local rewardsBackTall = itemBack:GetTall()-topBar:GetTall()

            local rewardsBack = vgui.Create( "DPanel", itemBack )
            rewardsBack:Dock( RIGHT )
            rewardsBack:DockMargin( 0, 0, 15, 0 )
            rewardsBack:SetWide( 150 )
            local noticeBack
            rewardsBack.Paint = function( self2, w, h ) 
                if( v.Rewards and table.Count( v.Rewards ) > 0 ) then
                    if( not IsValid( noticeBack ) ) then return end

                    local noticeX, noticeY = noticeBack:GetPos()
                    local noticeW, noticeH = noticeBack:GetSize()

                    draw.SimpleText( BRICKS_SERVER.Func.L( "gangRewards" ), "BRICKS_SERVER_Font23", w/2, noticeY-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )

                    draw.SimpleText( BRICKS_SERVER.Func.L( "gangRewardsEvery", BRICKS_SERVER.Func.FormatWordTime( v.RewardTime ) ), "BRICKS_SERVER_Font17", w/2, noticeY+noticeH+5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
                else
                    draw.SimpleText( BRICKS_SERVER.Func.L( "gangRewards" ), "BRICKS_SERVER_Font23", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
                    draw.SimpleText( BRICKS_SERVER.Func.L( "none" ), "BRICKS_SERVER_Font17", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
                end
            end

            noticeBack = vgui.Create( "DPanel", rewardsBack )
            noticeBack:SetSize( 0, 35 )
            noticeBack:SetPos( (rewardsBack:GetWide()/2)-(noticeBack:GetWide()/2), (rewardsBackTall/2)-(noticeBack:GetTall()/2) )
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

                if( noticeBack:GetWide() > rewardsBack:GetWide() ) then
                    rewardsBack:SetWide( noticeBack:GetWide() )
                end

                noticeBack:SetPos( (rewardsBack:GetWide()/2)-(noticeBack:GetWide()/2), (rewardsBackTall/2)-(noticeBack:GetTall()/2) )
            end

            local claimedGangTable = {}
            if( claimed ) then
                if( BRICKS_SERVER_GANGS[territoryTable.GangID or 0] ) then
                    claimedGangTable = BRICKS_SERVER_GANGS[territoryTable.GangID or 0]
                else
                    BRICKS_SERVER.Func.RequestTerritoryGangs()
                end
            end

            local avatarBack = vgui.Create( "DPanel", itemBack )
            avatarBack:Dock( FILL )
            avatarBack:DockMargin( 15, 15, 15, 15 )
            local avatarBackSize = 70
            local avatarSize = (claimedGangTable.Icon and avatarBackSize*0.6) or 32
            avatarBack.Paint = function( self2, w, h )
                local textStartPos = avatarBackSize+15

                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
                draw.NoTexture()
                BRICKS_SERVER.Func.DrawCircle( (h-avatarBackSize)/2+(avatarBackSize/2), h/2, avatarBackSize/2, 45 )
        
                draw.SimpleText( (claimedGangTable.Name or BRICKS_SERVER.Func.L( "gangNone" )), "BRICKS_SERVER_Font23", textStartPos, h/2+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )
        
                draw.SimpleText( BRICKS_SERVER.Func.L( "gangID", (claimedGangTable.GangID or 0) ), "BRICKS_SERVER_Font17", textStartPos, h/2-2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
            end

            local gangIcon = vgui.Create( "bricks_server_gangicon", avatarBack )
            gangIcon:SetSize( avatarSize, avatarSize )
            gangIcon:SetPos( (avatarBackSize-avatarSize)/2, (avatarBackSize-avatarSize)/2 )
            gangIcon:SetIconURL( claimedGangTable.Icon or "bricks_server/question.png" )
        end
    end
    self.RefreshPanel()

    hook.Add( "BRS.Hooks.RefreshGangTerritories", self, function()
        if( IsValid( self ) ) then
            self.RefreshPanel()
        else
            hook.Remove( "BRS.Hooks.RefreshGangTerritories", self )
        end
    end )
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gangmenu_territories", PANEL, "bricks_server_scrollpanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/modules/default/submodules/currencies/vgui/bricks_server_config_currencies.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel()
    local itemActions = {
        [1] = { "Edit", function( k, v )
            BRICKS_SERVER.Func.CreateCurrencyEditor( k, v, function( currencyTable ) 
                BS_ConfigCopyTable.CURRENCIES[k] = currencyTable
                BRICKS_SERVER.Func.ConfigChange( "CURRENCIES" )
                self.RefreshPanel()
            end, function() end )
        end },
        [2] = { "Remove", function( k, v )
            BS_ConfigCopyTable.CURRENCIES[k] = nil
            BRICKS_SERVER.Func.ConfigChange( "CURRENCIES" )
            self.RefreshPanel()
        end, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed },
    }
    
    BS_ConfigCopyTable.CURRENCIES = BS_ConfigCopyTable.CURRENCIES or {}
    function self.RefreshPanel()
        self:Clear()

        self.slots = nil
        if( self.grid and IsValid( self.grid ) ) then
            self.grid:Remove()
        end

        for k, v in pairs( BS_ConfigCopyTable.CURRENCIES or {} ) do
            local itemBack = vgui.Create( "DPanel", self )
            itemBack:Dock( TOP )
            itemBack:DockMargin( 0, 0, 0, 5 )
            itemBack:SetTall( 100 )
            itemBack:DockPadding( 0, 0, 25, 0 )
            local example = "Example: NOT CREATED"
            if( BRICKS_SERVER.DEVCONFIG.Currencies["custom_" .. k] ) then
                example = "Example: " .. BRICKS_SERVER.DEVCONFIG.Currencies["custom_" .. k].formatFunction( 1000 )
            end
            itemBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                draw.RoundedBox( 5, 5, 5, h-10, h-10, BRICKS_SERVER.Func.GetTheme( 2 ) )

                draw.SimpleText( v.Name, "BRICKS_SERVER_Font33", h+15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                draw.SimpleText( example, "BRICKS_SERVER_Font20", h+15, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                draw.SimpleText( "Key: custom_" .. k, "BRICKS_SERVER_Font20", h+15, 52, BRICKS_SERVER.Func.GetTheme( 5 ), 0, 0 )
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

        local addNewCurrency = vgui.Create( "DButton", self )
        addNewCurrency:Dock( TOP )
        addNewCurrency:SetText( "" )
        addNewCurrency:SetTall( 40 )
        local changeAlpha = 0
        addNewCurrency.Paint = function( self2, w, h )
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
    
            draw.SimpleText( "Add Currency", "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        addNewCurrency.DoClick = function()
            BS_ConfigCopyTable.CURRENCIES = BS_ConfigCopyTable.CURRENCIES or {}
            local newCurrency = {
                Name = "New Currency",
                Suffix = "New Currency"
            }
            table.insert( BS_ConfigCopyTable.CURRENCIES, newCurrency )
            BRICKS_SERVER.Func.ConfigChange( "CURRENCIES" )
            self.RefreshPanel()
        end
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_currencies", PANEL, "bricks_server_scrollpanel" )
--PATH addons/truefishing/lua/autorun/client/cl_fishing.lua:
function TFScreenScale(num)
	if ScrW()/ScrH() > 3 then // trying to fix triple monitor resolution scaling
		return num * 3
	else
		return ScreenScale(num)
	end
end

local font = system.IsOSX() and "Trebuchet" or "Segoe UI"
surface.CreateFont("SegoeUI_NormalBold_60", {
	font 		= font,
	size 		= 60,
	weight 		= 650,
	blursize 	= 0,
	scanlines 	= 0,
	antialias 	= true
})
surface.CreateFont("SegoeUI_NormalBold_60w", {
	font 		= font,
	size 		= 61,
	weight 		= 650,
	blursize 	= 0,
	scanlines 	= 0,
	antialias 	= true
})
surface.CreateFont("SegoeUI_NormalBold_20", {
	font 		= font,
	size 		= 20,
	weight 		= 650,
	blursize 	= 0,
	scanlines 	= 0,
	antialias 	= true
})
surface.CreateFont("SegoeUI_NormalBoldScaled", {
	font 		= font,
	size 		= TFScreenScale(8.5),
	weight 		= 800,
	blursize 	= 0,
	scanlines 	= 0,
	antialias 	= true
})
surface.CreateFont("SegoeUI_Normal", {
	font 		= font,
	size 		= 26,
	weight 		= 400,
	blursize 	= 0,
	scanlines 	= 0,
	antialias 	= true
})
surface.CreateFont("SegoeUI_18", {
	font 		= font,
	size 		= 18,
	weight 		= 400,
	blursize 	= 0,
	scanlines 	= 0,
	antialias 	= true
})
surface.CreateFont("FishingS16", {
	font = font, 
	size = 16, 
	weight = 500,
	antialias = true
})
surface.CreateFont("FishingS20", {
	font = font, 
	size = 20, 
	weight = 600,
	antialias = true
})
surface.CreateFont("FishingS30", {
	font = font, 
	size = 30, 
	weight = 600,
	antialias = true,
})
surface.CreateFont("FishingS85", {
	font = font, 
	size = 85, 
	weight = 500,
	antialias = true
})
surface.CreateFont("FishingS55", {
	font = font, 
	size = 55, 
	weight = 500,
	antialias = true
})
surface.CreateFont("FishingSS6", {
	font = font, 
	size = TFScreenScale(8.5), 
	weight = 540,
	antialias = true
})
surface.CreateFont("FishingSS9", {
	font = font, 
	size = TFScreenScale(9), 
	weight = 600,
	antialias = true
})
surface.CreateFont("FishingSS9_NumberFix", {
	font = font, 
	size = TFScreenScale(9), 
	weight = 650,
	antialias = true
})

net.Receive("FishConfigUpdate", function()
	LocalPlayer().TrueFishSynced = true
	
	local num = net.ReadUInt(6)	
	for i=1, num do
		TrueFish[net.ReadString()] = net.ReadType()
	end
end)

hook.Add("Move", "TrueFishSync", function() // ayy this works pretty well
	if !LocalPlayer().TrueFishSynced then
		net.Start("FishAskConfig")
		net.SendToServer()

		hook.Remove("Move", "TrueFishSync")
	end
end)

local configVariables = {}
local function addConfig(tbl)
	table.insert(configVariables, tbl)
end
addConfig{"Language to be used everywhere, except this config menu.", "LOCALISATION_LANGUAGE"}
addConfig{"Allows players' PhysGun to pick up Fish Cages and Containers.", "CAN_PHYSGUN_GEAR"}
addConfig{"Fish cages and buoys will be frozen when deployed.", "OPTIMIZED_FISHING"}
addConfig{"Fish cages will not render fish models.", "CAGE_NO_FISH_MODEL"}
addConfig{"Fish cage's buoy will make water splash when the fish cage is full of fish.", "CAGE_BUOY_SPLASHING"}
addConfig{"Limits the amount of fishes a Medium Fish Cage can catch.", "MEDIUM_CAGE_FISH_LIMIT"}
addConfig{"Limits the amount of fishes a Large Fish Cage can catch.", "LARGE_CAGE_FISH_LIMIT"}
addConfig{"Limits the amount of fishes a Fish Container can hold.", "FISH_CONTAINER_LIMIT"}
addConfig{"Fish from cages will be directly collected by the player, instead of the Fish Container.", "CONTAINERS_DISABLED"}
addConfig{"Limits the amount of Medium Fish Cages a player can buy.", "MEDIUM_CAGE_LIMIT"}
addConfig{"Limits the amount of Large Fish Cages a player can buy.", "LARGE_CAGE_LIMIT"}
addConfig{"Limits the amount of Fish Containers a player can buy.", "CONTAINER_LIMIT"}
addConfig{"Both Medium and Large Fish Cages will share the same limit. However, Medium Fish Cage limit will be used.", "CAGE_SHARED_LIMIT"}
addConfig{"Limits the amount of fish a player can carry when fish isn't added to a Fish Container.", "FISH_CARRY_LIMIT"}
addConfig{"Fish caught while fishing with a rod will be collected by the player instead of a Fish Container.", "ROD_NO_CONTAINER"}
addConfig{"Fishing Rods will use a physical hook, fish caught will be hooked for the player to pick up.", "ROD_PHYSICS_FISHING"}
addConfig{"Fishing Rods will use a different catch time, instead of the one based on fish types.", "ROD_SEPERATE_CATCH_TIME_ENABLED"}
addConfig{"Fishing Rod catch time (s). The above setting must be enabled for this to work.", "ROD_SEPERATE_CATCH_TIME"}
addConfig{"Limits how much time a player has to react (in %) when using a Fishing Rod to catch a fish. Ex: 10% of 10s catch time would give the player 1 second to react.", "ROD_CATCH_WINDOW", function(val) return val*100 end, function(val) return val/100 end}
addConfig{"Limits the amount of times a player can fish with one Fish Bait use, when using a Fishing Rod.", "ROD_FISH_BAIT_AMOUNT"}
addConfig{"Limit the chance (in %) Fishing Rods will catch a bag with money.", "ROD_MONEYBAG_CHANCE"}
addConfig{"Limit the amount of money inside a money bag, that you can catch with a Fishing Rod.", "ROD_MONEYBAG_MONEY"}
addConfig{"Allow only the Fish Container owner to discard the fish.", "FISH_CONTAINER_OWNER_DISCARD"}
addConfig{"Automatically remove unused Fish Bait after X seconds of inuse. Use 0 seconds if you don't want them to be removed.", "FISH_BAIT_AUTOREMOVE"}
//addConfig{"", ""}

net.Receive("FishConfigMenu", function(len)
	//print("Size: "..(len/8).."B")
	TrueFish = net.ReadTable()

	local function NetworkChanges(var, val)
		//print(var,val)
		net.Start("FishConfigVarChange")
		net.WriteString(var)
		net.WriteType(val)
		net.SendToServer()
	end
	local function NetworkFishChanges(var)
		//print(var)
		net.Start("FishVarChange")
		net.WriteString(var)
		net.WriteTable(TrueFish[var])
		net.SendToServer()
	end

	if menu and menu.IsValid then menu:Remove() menu = nil end

	local sizeX, sizeY = 700, 600
	menu = vgui.Create("DFrame")
	menu:SetTitle("")
	menu:ShowCloseButton(false)
	menu:SetSize(sizeX, sizeY)
	menu:Center()
	menu:MakePopup()
	menu.Paint = function(self)
		
		draw.RoundedBoxEx(8, 0, 0, self:GetWide(), 40, Color(47, 54, 76, 255), true, true)
		draw.SimpleText("Fishing Configuration", "FishingS30", self:GetWide()*0.5, 4, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		draw.SimpleText("by Tomasas", "FishingS16", self:GetWide()*0.99, 22, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT)
		draw.RoundedBoxEx(8, 0, self:GetTall()-40, self:GetWide(), 40, Color(47, 54, 76, 255), false, false, true, true)
		surface.SetDrawColor(30, 34, 43, 255)
		surface.DrawRect(0, 40, self:GetWide(), self:GetTall()-80)
		
		surface.SetDrawColor(50, 50, 50, 255)
		surface.DrawOutlinedRect(0, 40, self:GetWide(), self:GetTall()-80)

	end

	local panelListPaint = function(self)
		surface.SetDrawColor(34, 37, 47, 255)
		surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
		surface.SetDrawColor(50, 50, 50, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	end
	local left = vgui.Create("DPanelList", menu) // devide to left
	left:EnableVerticalScrollbar(true)
	left:SetSize(menu:GetWide()*0.5-5, menu:GetTall()-80)
	left:SetPos(0, 40)
	left.Paint = panelListPaint

	local sbarLeft = left.VBar
	function sbarLeft:Paint( w, h )
	end
	sbarLeft.btnUp.Paint = sbarLeft.Paint
	sbarLeft.btnDown.Paint = sbarLeft.Paint
	function sbarLeft.btnGrip:Paint( w, h )
		draw.RoundedBox(4, 0, 0, w-1, h, Color(200, 200, 200, 10))
	end

	local right = vgui.Create("DPanelList", menu) // devide to right
	right:EnableVerticalScrollbar(true)
	right:SetSize(menu:GetWide()*0.5-5, menu:GetTall()-80)
	right:SetPos(left:GetPos()+left:GetWide()+10, 40)
	right.Paint = panelListPaint

	local sbarRight = right.VBar
	sbarRight.Paint = sbarLeft.Paint
	sbarRight.btnUp.Paint = sbarRight.Paint
	sbarRight.btnDown.Paint = sbarRight.Paint
	sbarRight.btnGrip.Paint = sbarLeft.btnGrip.Paint

	for i=1, #configVariables do // populating right side of the menu with variables
		local panel = vgui.Create("DPanel", right)
		panel.Paint=panelListPaint
		local valuebox
		
		local f = function(p, val)
			val = tonumber(val) // dis some booshit derma does, numberwang returning a string sometimes
			TrueFish[configVariables[i][2]] = configVariables[i][4] and configVariables[i][4](val) or val
			NetworkChanges(configVariables[i][2], TrueFish[configVariables[i][2]])
		end
		local f2 = function(p, val)
			TrueFish[configVariables[i][2]] = tobool(val)
			NetworkChanges(configVariables[i][2], TrueFish[configVariables[i][2]])
		end

		if type(TrueFish[configVariables[i][2]]) == "boolean" then
			valuebox = vgui.Create("DCheckBox", panel)
			valuebox:SetValue(TrueFish[configVariables[i][2]])
			valuebox.OnChange = f2
		elseif configVariables[i][2] == "LOCALISATION_LANGUAGE" then
			valuebox = vgui.Create("DComboBox", panel)
			valuebox:SetWide(48)
			for k, v in pairs(TrueFishLanguages()) do
				valuebox:AddChoice(k)
			end
			valuebox:SetValue(TrueFish[configVariables[i][2]])
			valuebox.OnSelect = function(p, index, val)
				TrueFish[configVariables[i][2]] = val
				NetworkChanges(configVariables[i][2], TrueFish[configVariables[i][2]])
			end
		else
			valuebox = vgui.Create("DNumberWang", panel)
			valuebox:SetMinMax(0, 9999)
			valuebox:SetWide(40)
			valuebox:SetValue(configVariables[i][3] and configVariables[i][3](TrueFish[configVariables[i][2]]) or TrueFish[configVariables[i][2]])
			valuebox.OnValueChanged = f
		end
		local textbox = vgui.Create("DLabel", panel)
		textbox:SetTextColor(color_white)
		textbox:SetWrap(true)
		textbox:SetText(configVariables[i][1])
		textbox:SetSize(right:GetWide()*0.82, 40)
		textbox:SetPos(right:GetWide()*0.15, 0)
		
		panel:SetTall(textbox:GetTall())	
		valuebox:SetPos(right:GetWide()*0.15*0.5-valuebox:GetWide()*0.5, panel:GetTall()*0.5-valuebox:GetTall()*0.5)

		right:AddItem(panel)
		
	end

	for i=1, FISH_HIGHNUMBER do // populating left side of the menu with stuff
		local panel = vgui.Create("DPanel", left)
		panel:SetTall(86)
		panel.Paint=panelListPaint
		
		local textbox = vgui.Create("DLabel", panel)
		textbox:SetFont("FishingS16")
		textbox:SetTextColor(color_white)
		textbox:SetText(TrueFishGetFishName(i))
		textbox:SizeToContents()
		textbox:SetPos(left:GetWide()*0.5-textbox:GetWide()*0.5, 1)
		
		local modelIcon = vgui.Create("SpawnIcon", panel)
		modelIcon:SetModel(TrueFishGetFishModel(i))
		modelIcon:SetMouseInputEnabled(false)
		modelIcon:SetSize(64, 64)
		modelIcon:SetPos(0, panel:GetTall()*0.5-modelIcon:GetTall()*0.5)
		
		
		if i != FISH_JUNK then
			local enabled = vgui.Create("DCheckBox", panel)
			enabled:SetValue(TrueFish.FISH_ENABLED[i])
			enabled:SetPos(left:GetWide()-75, panel:GetTall()*0.5-enabled:GetTall()*0.5)
			
			local textbox2 = vgui.Create("DLabel", panel)
			textbox2:SetFont("FishingS16")
			textbox2:SetTextColor(color_white)
			textbox2:SetText("Enabled")
			textbox2:SizeToContents()
			local x, y = enabled:GetPos()
			textbox2:SetPos(x+17, y)
			
			
			local textbox3 = vgui.Create("DLabel", panel)
			textbox3:SetFont("FishingS16")
			textbox3:SetTextColor(color_white)
			textbox3:SetText("Depth from")
			textbox3:SizeToContents()
			textbox3:SetPos(74, 20)

			local depthMin = vgui.Create("DNumberWang", panel)
			depthMin:SetMinMax(0, 3000)
			depthMin:SetWide(40)
			depthMin:SetValue(TrueFish.FISH_DEPTH[i][1])
			local x, y = textbox3:GetPos()
			depthMin:SetPos(x+textbox3:GetWide()+2, y-2)
			
			local textbox4 = vgui.Create("DLabel", panel)
			textbox4:SetFont("FishingS16")
			textbox4:SetTextColor(color_white)
			textbox4:SetText("to")
			textbox4:SizeToContents()
			local x, y = depthMin:GetPos()
			textbox4:SetPos(x+depthMin:GetWide()+2, y+2)
			
			local depthMax = vgui.Create("DNumberWang", panel)
			depthMax:SetMinMax(0, 3000)
			depthMax:SetWide(40)
			depthMax:SetValue(TrueFish.FISH_DEPTH[i][2])
			local x, y = textbox4:GetPos()
			depthMax:SetPos(x+textbox4:GetWide()+1, y-2)
			
			
			local textbox6 = vgui.Create("DLabel", panel)
			textbox6:SetFont("FishingS16")
			textbox6:SetTextColor(color_white)
			textbox6:SetText("Catch time in (s)")
			textbox6:SizeToContents()
			local x, y = textbox3:GetPos()
			textbox6:SetPos(x, y+22)

			local timeMin = vgui.Create("DNumberWang", panel)
			timeMin:SetMinMax(0, 3000)
			timeMin:SetWide(40)
			timeMin:SetValue(TrueFish.FISH_CATCH_TIME[i][1])
			local x, y = textbox6:GetPos()
			timeMin:SetPos(x+textbox6:GetWide()+2, y-2)
			
			local textbox7 = vgui.Create("DLabel", panel)
			textbox7:SetFont("FishingS16")
			textbox7:SetTextColor(color_white)
			textbox7:SetText("to")
			textbox7:SizeToContents()
			local x, y = timeMin:GetPos()
			textbox7:SetPos(x+timeMin:GetWide()+2, y+2)
			
			local timeMax = vgui.Create("DNumberWang", panel)
			timeMax:SetMinMax(0, 3000)
			timeMax:SetWide(40)
			timeMax:SetValue(TrueFish.FISH_CATCH_TIME[i][2])
			local x, y = textbox7:GetPos()
			timeMax:SetPos(x+textbox7:GetWide()+1, y-2)
			
			local textbox5 = vgui.Create("DLabel", panel)
			textbox5:SetFont("FishingS16")
			textbox5:SetTextColor(color_white)
			textbox5:SetText("Reward $")
			textbox5:SizeToContents()
			local x, y = textbox6:GetPos()
			textbox5:SetPos(x, y+22)

			local price = vgui.Create("DNumberWang", panel)
			price:SetMinMax(0, 3000)
			price:SetWide(40)
			price:SetValue(TrueFish.FISH_PRICE[i])
			local x, y = textbox5:GetPos()
			price:SetPos(x+textbox5:GetWide()+2, y-2)
			
			local loseFocus = function(p, gained)
				if !gained then
					p:OnValueChanged(p:GetValue())
				end
			end
			depthMin.OnFocusChanged = loseFocus
			depthMax.OnFocusChanged = loseFocus
			timeMin.OnFocusChanged = loseFocus
			timeMax.OnFocusChanged = loseFocus
			
			local ignoreLoopback = false
			depthMin.OnValueChanged = function(p, val)
				if ignoreLoopback then ignoreLoopback = false return true end
				val = tonumber(val)
				if val > TrueFish.FISH_DEPTH[i][2] and !p:HasFocus() then
					p:FocusNext()
				end				
				TrueFish.FISH_DEPTH[i][1] = math.Clamp(val, val, TrueFish.FISH_DEPTH[i][2])
				ignoreLoopback = true
				timer.Simple(0, function() p:SetValue(TrueFish.FISH_DEPTH[i][1]) end) // so much hoops to jump just to have limiting work properly.. i love derma /s
				NetworkFishChanges("FISH_DEPTH")
			end
			depthMax.OnValueChanged = function(p, val)
				if ignoreLoopback then ignoreLoopback = false return true end
				val = tonumber(val)
				if val < TrueFish.FISH_DEPTH[i][1] and !p:HasFocus() then
					p:FocusNext()
				end				
				TrueFish.FISH_DEPTH[i][2] = math.Clamp(val, TrueFish.FISH_DEPTH[i][1], val)
				ignoreLoopback = true
				timer.Simple(0, function() p:SetValue(TrueFish.FISH_DEPTH[i][2]) end)
				NetworkFishChanges("FISH_DEPTH")
			end
			
			timeMin.OnValueChanged = function(p, val)
				if ignoreLoopback then ignoreLoopback = false return true end
				val = tonumber(val)
				if val > TrueFish.FISH_CATCH_TIME[i][2] and !p:HasFocus() then
					p:FocusNext()
				end				
				TrueFish.FISH_CATCH_TIME[i][1] = math.Clamp(val, val, TrueFish.FISH_CATCH_TIME[i][2])
				ignoreLoopback = true
				timer.Simple(0, function() p:SetValue(TrueFish.FISH_CATCH_TIME[i][1]) end)
				NetworkFishChanges("FISH_CATCH_TIME")
			end
			timeMax.OnValueChanged = function(p, val)
				if ignoreLoopback then ignoreLoopback = false return true end
				val = tonumber(val)
				if val < TrueFish.FISH_CATCH_TIME[i][1] and !p:HasFocus() then
					p:FocusNext()
				end				
				TrueFish.FISH_CATCH_TIME[i][2] = math.Clamp(val, TrueFish.FISH_CATCH_TIME[i][1], val)
				ignoreLoopback = true
				timer.Simple(0, function() p:SetValue(TrueFish.FISH_CATCH_TIME[i][2]) end)
				NetworkFishChanges("FISH_CATCH_TIME")
			end
			
			price.OnValueChanged = function(p, val)
				TrueFish.FISH_PRICE[i] = tonumber(val)
				NetworkFishChanges("FISH_PRICE")
			end
			
			enabled.OnChange = function(p, val)
				TrueFish.FISH_ENABLED[i] = tobool(val)
				NetworkFishChanges("FISH_ENABLED")
			end
			
		else
		
			panel:SetTall(panel:GetTall()+22)
			local textbox = vgui.Create("DLabel", panel)
			textbox:SetFont("FishingS16")
			textbox:SetTextColor(color_white)
			textbox:SetText("Medium Cage fish junk drop chance")
			textbox:SizeToContents()
			textbox:SetPos(74, 20)

			local percentage = vgui.Create("DNumberWang", panel)
			percentage:SetMinMax(0, 100)
			percentage:SetWide(40)
			percentage:SetValue(TrueFish.MEDIUM_JUNK_CHANCE/10)
			local x, y = textbox:GetPos()
			percentage:SetPos(x+textbox:GetWide()+2, y-2)
			
			local percentlabel = vgui.Create("DLabel", panel)
			percentlabel:SetFont("FishingS16")
			percentlabel:SetTextColor(color_white)
			percentlabel:SetText("%")
			percentlabel:SizeToContents()
			local x, y = percentage:GetPos()
			percentlabel:SetPos(x+percentage:GetWide()+2, y+2)
			
			local textbox2 = vgui.Create("DLabel", panel)
			textbox2:SetFont("FishingS16")
			textbox2:SetTextColor(color_white)
			textbox2:SetText("Large Cage fish junk drop chance")
			textbox2:SizeToContents()
			local x, y = textbox:GetPos()
			textbox2:SetPos(74, y+22)

			local percentage2 = vgui.Create("DNumberWang", panel)
			percentage2:SetMinMax(0, 100)
			percentage2:SetWide(40)
			percentage2:SetValue(TrueFish.LARGE_JUNK_CHANCE/10)
			local x, y = textbox2:GetPos()
			percentage2:SetPos(x+textbox2:GetWide()+2, y-2)
			
			local percentlabel2 = vgui.Create("DLabel", panel)
			percentlabel2:SetFont("FishingS16")
			percentlabel2:SetTextColor(color_white)
			percentlabel2:SetText("%")
			percentlabel2:SizeToContents()
			local x, y = percentage2:GetPos()
			percentlabel2:SetPos(x+percentage2:GetWide()+2, y+2)
			
			local textbox3 = vgui.Create("DLabel", panel)
			textbox3:SetFont("FishingS16")
			textbox3:SetTextColor(color_white)
			textbox3:SetText("Fishing Rod fish junk drop chance")
			textbox3:SizeToContents()
			local x, y = textbox2:GetPos()
			textbox3:SetPos(74, y+22)

			local percentage3 = vgui.Create("DNumberWang", panel)
			percentage3:SetMinMax(0, 100)
			percentage3:SetWide(40)
			percentage3:SetValue(TrueFish.ROD_JUNK_CHANCE/10)
			local x, y = textbox3:GetPos()
			percentage3:SetPos(x+textbox3:GetWide()+2, y-2)
			
			local percentlabel3 = vgui.Create("DLabel", panel)
			percentlabel3:SetFont("FishingS16")
			percentlabel3:SetTextColor(color_white)
			percentlabel3:SetText("%")
			percentlabel3:SizeToContents()
			local x, y = percentage3:GetPos()
			percentlabel3:SetPos(x+percentage3:GetWide()+2, y+2)
			
			local textbox4 = vgui.Create("DLabel", panel)
			textbox4:SetFont("FishingS16")
			textbox4:SetTextColor(color_white)
			textbox4:SetText("Reward $")
			textbox4:SizeToContents()
			local x, y = textbox3:GetPos()
			textbox4:SetPos(x, y+22)

			local price = vgui.Create("DNumberWang", panel)
			price:SetMinMax(0, 3000)
			price:SetWide(40)
			price:SetValue(TrueFish.FISH_PRICE[i])
			local x, y = textbox4:GetPos()
			price:SetPos(x+textbox4:GetWide()+2, y-2)
			
			percentage.OnValueChanged = function(p, val)
				TrueFish.MEDIUM_JUNK_CHANCE = tonumber(val)*10
				NetworkChanges("MEDIUM_JUNK_CHANCE", TrueFish.MEDIUM_JUNK_CHANCE)
			end
			
			percentage2.OnValueChanged = function(p, val)
				TrueFish.LARGE_JUNK_CHANCE = tonumber(val)*10
				NetworkChanges("LARGE_JUNK_CHANCE", TrueFish.LARGE_JUNK_CHANCE)
			end
			
			percentage3.OnValueChanged = function(p, val)
				TrueFish.ROD_JUNK_CHANCE = tonumber(val)*10
				NetworkChanges("ROD_JUNK_CHANCE", TrueFish.ROD_JUNK_CHANCE)
			end
			
			price.OnValueChanged = function(p, val)
				TrueFish.FISH_PRICE[i] = tonumber(val)
				NetworkFishChanges("FISH_PRICE")
			end
		end
		

		left:AddItem(panel)
		
	end

	for i=1, FISH_GEAR_HIGHNUMBER do // populating left side of the menu with stuff
		local panel = vgui.Create("DPanel", left)
		panel:SetTall(64)
		panel.Paint=panelListPaint
		
		local textbox = vgui.Create("DLabel", panel)
		textbox:SetFont("FishingS16")
		textbox:SetTextColor(color_white)
		textbox:SetText(TrueFishGetGearName(i))
		textbox:SizeToContents()
		textbox:SetPos(left:GetWide()*0.5-textbox:GetWide()*0.5, 1)
		
		local modelIcon = vgui.Create("SpawnIcon", panel)
		modelIcon:SetModel(TrueFishGetGearModel(i))
		modelIcon:SetMouseInputEnabled(false)
		modelIcon:SetSize(64, 64)
		modelIcon:SetPos(0, 5)
		
		
		local enabled = vgui.Create("DCheckBox", panel)
		enabled:SetValue(TrueFish.GEAR_ENABLED[i])
		enabled:SetPos(left:GetWide()-75, panel:GetTall()*0.5-enabled:GetTall()*0.5)
		
		local textbox2 = vgui.Create("DLabel", panel)
		textbox2:SetFont("FishingS16")
		textbox2:SetTextColor(color_white)
		textbox2:SetText("Enabled")
		textbox2:SizeToContents()
		local x, y = enabled:GetPos()
		textbox2:SetPos(x+17, y)
		
		
		local textbox5 = vgui.Create("DLabel", panel)
		textbox5:SetFont("FishingS16")
		textbox5:SetTextColor(color_white)
		textbox5:SetText("Price $")
		textbox5:SizeToContents()
		textbox5:SetPos(74, panel:GetTall()*0.5-textbox5:GetTall()*0.5)

		local price = vgui.Create("DNumberWang", panel)
		price:SetMinMax(0, 3000)
		price:SetWide(40)
		price:SetValue(TrueFish.GEAR_PRICE[i])
		local x, y = textbox5:GetPos()
		price:SetPos(x+textbox5:GetWide()+2, y-2)
		
		
		price.OnValueChanged = function(p, val)
			TrueFish.GEAR_PRICE[i] = tonumber(val)
			NetworkFishChanges("GEAR_PRICE")
		end
		
		enabled.OnChange = function(p, val)
			TrueFish.GEAR_ENABLED[i] = tobool(val)
			NetworkFishChanges("GEAR_ENABLED")
		end
		
		left:AddItem(panel)	

	end

	local exit = vgui.Create("DButton", menu)
	exit:SetSize(100, 30)
	exit:SetFont("FishingS16")
	exit:SetText("Done")
	exit:SetColor(Color(250, 250, 250, 255))
	exit:SetPos(menu:GetWide()*0.5-exit:GetWide()*0.5, menu:GetTall()-35)
	exit.Paint = function(self)
		surface.SetDrawColor(self.Hovered and Color(99, 102, 111, 255) or Color(69, 72, 81, 255))
		surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
		surface.SetDrawColor(50, 50, 50, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	end
	exit.DoClick = function(self)
		self:GetParent():Remove()
	end


end)
--PATH addons/a_passport/lua/autorun/client/cl_passport.lua:
local surface = surface
local draw = draw
local Color = Color
local Material = Material
local vgui = vgui
local util = util
local net = net
local Lerp = Lerp

local comboBoxColor = Color(33, 33, 33, 255)
local comboBoxHoverColor = Color(70, 70, 70, 255)
local comboBoxTextColor = Color(255, 255, 255)
local borderColor = Color(100, 100, 100, 255)
local checkboxBorderColor = Color(36, 36, 36)
local checkboxCheckColor = Color(0, 117, 222, 255)
local checkboxHoverColor = Color(70, 70, 70, 255)
local checkboxNormalColor = Color(45, 45, 45, 255)
local panelBackgroundColor = Color(48, 42, 42, 255)
local innerPanelColor = Color(38, 38, 38, 255)
local modelPanelColor = Color(31, 31, 31)
local whiteColor = Color(255, 255, 255, 255)
local whiteColor128 = Color(255, 255, 255, 128)
local redColor = Color(255, 0, 0, 255)

local passportMenuOpen = false

surface.CreateFont("CheckboxFont", {
    font = "Montserrat",
    size = 16,
    weight = 500,
    extended = true,
})

surface.CreateFont("ComboBoxFont", {
    font = "Montserrat",
    size = 16,
    weight = 500,
    extended = true,
})

surface.CreateFont("MonstTPassport", {
    font = "Montserrat SemiBold",
    size = 25,
    weight = 100,
    extended = true,
    shadow = true,
})

surface.CreateFont("MonstPassport", {
    font = "Montserrat Bold",
    size = 30,
    weight = 500,
    extended = true,
})

surface.CreateFont("MonstButtonPassport", {
    font = "Montserrat SemiBold",
    size = 20,
    weight = 500,
    extended = true,
})

surface.CreateFont("MonstNameLabelPassport", {
    font = "Montserrat Regular",
    size = 25,
    weight = 500,
    extended = true,
})

surface.CreateFont("MonstNamePassport", {
    font = "Montserrat SemiBold",
    size = 33,
    weight = 500,
    extended = true,
})

local function StylizeComboBox(comboBox)
    local material = Material("icon16/bullet_arrow_down.png")
    function comboBox:Paint(w, h)
        local color = self:IsHovered() and comboBoxHoverColor or comboBoxColor
        draw.RoundedBox(6, 0, 0, w, h, color)
        self:DrawTextEntryText(comboBoxTextColor, Color(100, 100, 100), comboBoxTextColor)
    end

    function comboBox:PaintOver(w, h)
        surface.SetDrawColor(whiteColor)
        surface.SetMaterial(material)
        surface.DrawTexturedRect(w - 20, (h / 2) - 8, 16, 16)
    end

    function comboBox:OpenMenu(pControlOpener)
        if pControlOpener and pControlOpener == self.TextEntry then return end
        if #self.Choices == 0 then return end
        if IsValid(self.Menu) then
            self.Menu:Remove()
            self.Menu = nil
        end

        self.Menu = DermaMenu(false, self)

        for k, v in ipairs(self.Choices) do
            self.Menu:AddOption(v, function() self:ChooseOption(v, k) end)
        end

        local x, y = self:LocalToScreen(0, self:GetTall())
        self.Menu:SetMinimumWidth(self:GetWide())
        self.Menu:Open(x, y, false, self)

        self.Menu.Paint = function(menu, mw, mh)
            draw.RoundedBox(6, 0, 0, mw, mh, comboBoxColor)
            surface.SetDrawColor(borderColor)
            surface.DrawOutlinedRect(0, 0, mw, mh)
        end

        for _, v in ipairs(self.Menu:GetCanvas():GetChildren()) do
            v:SetFont("ComboBoxFont")
            v.Paint = function(item, iw, ih)
                local itemColor = item:IsHovered() and comboBoxHoverColor or comboBoxColor
                draw.RoundedBox(6, 0, 0, iw, ih, itemColor)
                surface.SetDrawColor(borderColor)
                surface.DrawOutlinedRect(0, 0, iw, ih)
                item:SetTextInset(10, 0)
                item:SetTextColor(comboBoxTextColor)
            end
        end
    end
end

local PANEL = {}

function PANEL:Init()
    self:SetSize(20, 20)
    self:SetText("")
    self.IsChecked = false
    self.BackgroundColor = checkboxNormalColor
    self.BorderColor = checkboxBorderColor
    self.CheckColor = checkboxCheckColor
    self.HoverColor = checkboxHoverColor
    self.NormalColor = checkboxNormalColor
    self:SetCursor("hand")
end

function PANEL:OnMousePressed()
    self.IsChecked = not self.IsChecked
    self:DoClick()
    self:InvalidateLayout(true)
    self:InvalidateParent(true)
end

function PANEL:SetChecked(checked)
    self.IsChecked = checked
    self:InvalidateLayout(true)
    self:InvalidateParent(true)
end

function PANEL:GetChecked()
    return self.IsChecked
end

function PANEL:DoClick()
end

function PANEL:Paint(w, h)
    self.BackgroundColor = self:IsHovered() and self.HoverColor or self.NormalColor
    draw.RoundedBox(w / 2, 0, 0, w, h, self.BackgroundColor)
    surface.SetDrawColor(self.BorderColor)
    draw.RoundedBox(w / 2, 1, 1, w - 2, h - 2, self.BorderColor)
    if self.IsChecked then
        surface.SetDrawColor(self.CheckColor)
        surface.DrawLine(5, 10, 9, 14) 
        surface.DrawLine(9, 14, 15, 6) 
    end
end

vgui.Register("DStylizedCheckbox", PANEL, "DPanel")

local function urldecode(str)
    if str then
        str = string.gsub(str, "+", " ")
        str = string.gsub(str, "%%(%x%x)", function(h) return string.char(tonumber(h, 16)) end)
    end
    return str
end

local function drawIcon(iconPath, x, y, iconSize)
    local material = Material(iconPath)
    if not material:IsError() then
        surface.SetMaterial(material)
        surface.SetDrawColor(whiteColor)
        surface.DrawTexturedRect(x, y, iconSize, iconSize)
    else
        print("Ошибка в загрузке материалов: " .. iconPath)
    end
end

local function CreatePassportMenu(data)
    if not IsValid(data.targetPlayer) then return end

    if passportMenuOpen then 
        notification.AddLegacy("Вы уже просматриваете паспорт.", NOTIFY_ERROR, 5)
        return
    end

    passportMenuOpen = true

    local gradient = data.wanted and Material("passport/icons/red3.png") or Material("menu/pidor3.png")
    local weaponIcon = data.wanted and "passport/icons/weaponr.png" or "passport/icons/weapon3.png"
    local buildIcon = data.wanted and "passport/icons/buildr.png" or "passport/icons/build3.png"
    local homeIcon = data.wanted and "passport/icons/homer.png" or "passport/icons/home3.png"

    local panelWidth, panelHeight = 864, 578
    local panel = vgui.Create("DFrame")
    panel:SetSize(panelWidth, panelHeight)
    panel:Center()
    panel:SetTitle("")
    panel:ShowCloseButton(false)
    panel:MakePopup()

    function panel:OnRemove() 
        passportMenuOpen = false 
    end

    function panel:Paint(w, h)
        draw.RoundedBox(25, 0, 0, w, h, data.wanted and redColor or Color(0, 117, 222, 255))
    end

    local innerPanel = vgui.Create("DPanel", panel)
    innerPanel:SetSize(panelWidth - 4, panelHeight - 4)
    innerPanel:SetPos(2, 2)

    function innerPanel:Paint(w, h)
        draw.RoundedBox(25, 0, 0, w, h, data.wanted and panelBackgroundColor or innerPanelColor)
    end

    local innerMostPanel = vgui.Create("DPanel", innerPanel)
    innerMostPanel:SetSize(panelWidth - 54, panelHeight - 54)
    innerMostPanel:SetPos(25, 25)

    function innerMostPanel:Paint(w, h)
        draw.RoundedBox(25, 0, 0, w, h, data.wanted and panelBackgroundColor or checkboxNormalColor)
    end

    local closeButton = vgui.Create("DButton", innerMostPanel)
    closeButton:SetSize(35, 26.53)
    closeButton:SetPos(innerMostPanel:GetWide() - closeButton:GetWide() - 15, 15)
    closeButton:SetText("X")
    closeButton:SetFont("MonstButtonPassport")
    closeButton:SetTextColor(whiteColor)

    function closeButton:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, redColor)
    end

    closeButton.DoClick = function()
        panel:Remove()
    end

    local modelPanel = vgui.Create("DModelPanel", innerPanel)
    modelPanel:SetSize(386, 524)
    modelPanel:SetPos(25, 25)
    modelPanel:SetModel(data.targetPlayer:GetModel())
    function modelPanel:LayoutEntity(ent) return end 

    local neckPos = modelPanel.Entity:GetBonePosition(modelPanel.Entity:LookupBone("ValveBiped.Bip01_Neck1"))
    modelPanel:SetLookAt(neckPos + Vector(0, 0, 0)) 
    modelPanel:SetCamPos(neckPos - Vector(-25, 0, 0)) 

    function modelPanel:Paint(w, h)
        draw.RoundedBox(10, 0, 0, w, h, data.wanted and redColor or Color(0, 117, 222, 255))
        draw.RoundedBox(10, 2, 2, w - 4, h - 4, modelPanelColor)
        DModelPanel.Paint(self, w, h)
        surface.SetDrawColor(whiteColor.a, whiteColor.g, whiteColor.b, 100)
        surface.SetMaterial(gradient)
        surface.DrawTexturedRect(2, 2, w - 4, h - 4)
    end

    local bottomBar = vgui.Create("DPanel", modelPanel)
    bottomBar:SetSize(360, 2) 
    bottomBar:SetPos(5, 522) 

    function bottomBar:Paint(w, h)
        draw.RoundedBox(10, 0, 0, w, h, data.wanted and redColor or Color(0, 117, 222, 255))
    end

    local labels = {
        {"Имя", data.nick or "Unknown", 50, 70},
        {"Дата рождения", data.dob or "Unknown", 170, 190},
        {"Розыск", data.wanted and (data.wantedReason or "Unknown") or "Отсутствует", 230, 250},
        {"Номер паспорта", data.passportID or "Unknown", 290, 310}
    }

    for _, label in ipairs(labels) do
        local nameLabel = vgui.Create("DLabel", innerPanel)
        nameLabel:SetPos(430, label[3])
        nameLabel:SetFont("MonstNameLabelPassport")
        nameLabel:SetText(label[1])
        nameLabel:SetTextColor(whiteColor128)
        nameLabel:SizeToContents()

        local playerLabel = vgui.Create("DLabel", innerPanel)
        playerLabel:SetPos(430, label[4])
        playerLabel:SetFont("MonstNamePassport")
        playerLabel:SetText(label[2])
        playerLabel:SetTextColor(data.wanted and label[1] == "Розыск" and redColor or whiteColor)
        playerLabel:SizeToContents()
    end

    local jobComboBox

    if data.targetPlayer == LocalPlayer() and data.isFake then
        local jobLabel = vgui.Create("DLabel", innerPanel)
        jobLabel:SetPos(430, 110)
        jobLabel:SetFont("MonstNameLabelPassport")
        jobLabel:SetText("Профессия")
        jobLabel:SetTextColor(whiteColor128)
        jobLabel:SizeToContents()
    
        jobComboBox = vgui.Create("DComboBox", innerPanel)
        jobComboBox:SetPos(430, 135) 
        jobComboBox:SetSize(300, 30)
        jobComboBox:SetTextColor(whiteColor128)
        jobComboBox:SetValue(data.job or "Гражданин")
        local professions = {"Гражданин", "Банкир", "Офицер Полиции", "Начальник полиции", "Спецназ", "Медик спецназа", "Снайпер спецназа", "Командир спецназа", "Агент FBI", "Джаггернаут", "Мэр", "Продавец оружия", "Врач", "Торговец", "Повар"}
        for _, profession in ipairs(professions) do
            jobComboBox:AddChoice(profession)
        end
        jobComboBox:SetFont("ComboBoxFont")
    
        StylizeComboBox(jobComboBox)
    
        jobComboBox.OnSelect = function(panel, index, value)
            jobComboBox:SetValue(value)
        end        
    else
        local jobLabel = vgui.Create("DLabel", innerPanel)
        jobLabel:SetPos(430, 113)
        jobLabel:SetFont("MonstNameLabelPassport")
        jobLabel:SetText("Профессия")
        jobLabel:SetTextColor(whiteColor128) 
        jobLabel:SizeToContents()

        local playerLabel = vgui.Create("DLabel", innerPanel)
        playerLabel:SetPos(430, 130) 
        playerLabel:SetFont("MonstNamePassport")
        playerLabel:SetText(data.job or "Unknown")
        playerLabel:SetTextColor(whiteColor)
        playerLabel:SizeToContents()
    end

    local licenseLabel = vgui.Create("DLabel", innerPanel)
    licenseLabel:SetPos(430, 350)
    licenseLabel:SetFont("MonstNameLabelPassport")
    licenseLabel:SetText("Лицензии")
    licenseLabel:SetTextColor(whiteColor128)
    licenseLabel:SizeToContents()

    local licensePanel = vgui.Create("DPanel", innerPanel)
    if data.targetPlayer == LocalPlayer() and data.isFake then
        licensePanel:SetSize(300, 140)
        licensePanel:SetPos(430, 370)
    else
        licensePanel:SetSize(300, 70)
        licensePanel:SetPos(430, 370)
    end
    licensePanel:SetBackgroundColor(Color(0, 0, 0, 0))

    function licensePanel:Paint(w, h)
        local iconSize = 50
        local padding = 10
        local x = 0
        local y = 12
    
        local icons = {
            weapon = weaponIcon,
            build = buildIcon,
            home = homeIcon
        }
    
        local hasLicense = false
    
        if not (data.targetPlayer == LocalPlayer() and data.isFake) then
            if data.gunLicense or data.fakeGunLicense then
                drawIcon(icons.weapon, x, y, iconSize)
                x = x + iconSize + padding
                hasLicense = true
            end
            if data.buildingLicense or data.fakeBuildingLicense then
                drawIcon(icons.build, x, y, iconSize)
                x = x + iconSize + padding
                hasLicense = true
            end
            if data.businessLicense or data.fakeBusinessLicense then
                drawIcon(icons.home, x, y, iconSize)
                hasLicense = true
            end
    
            if not hasLicense then
                draw.SimpleText("Нет лицензий", "MonstNamePassport", w / 2 - 60, h / 2 - 20, whiteColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end
    end      

    if data.targetPlayer == LocalPlayer() and data.isFake then
        local function CreateCheckboxWithLabel(panel, x, y, text, initialChecked)
            local checkboxPanel = vgui.Create("DPanel", panel)
            checkboxPanel:SetPos(x, y)
            checkboxPanel:SetSize(300, 20)
            checkboxPanel:SetBackgroundColor(Color(0, 0, 0, 0)) 
        
            local checkbox = vgui.Create("DStylizedCheckbox", checkboxPanel)
            checkbox:SetPos(0, 0)
            checkbox:SetChecked(initialChecked)
            checkbox:SizeToContents()
        
            local label = vgui.Create("DLabel", checkboxPanel)
            label:SetPos(30, -3)
            label:SetFont("MonstNameLabelPassport")
            label:SetText(text)
            label:SetTextColor(whiteColor)
            label:SizeToContents()
            
            label:SetMouseInputEnabled(true) 

            function checkboxPanel:OnMousePressed()
                checkbox:SetChecked(not checkbox:GetChecked())
                checkbox:DoClick()
            end
        
            function label:OnMousePressed()
                checkbox:SetChecked(not checkbox:GetChecked())
                checkbox:DoClick()
            end
        
            return checkbox
        end
        
        local checkboxWeapon = CreateCheckboxWithLabel(innerPanel, 430, 383, "Оружейная лицензия", data.fakeGunLicense)
        local checkboxBuilding = CreateCheckboxWithLabel(innerPanel, 430, 413, "Строительная лицензия", data.fakeBuildingLicense)
        local checkboxBusiness = CreateCheckboxWithLabel(innerPanel, 430, 443, "Бизнес лицензия", data.fakeBusinessLicense)

        local saveButton = vgui.Create("DButton", innerPanel)
        saveButton:SetPos(430, 490)
        saveButton:SetSize(300, 40)
        saveButton:SetText("Сохранить информацию")
        saveButton:SetFont("MonstButtonPassport")
        saveButton:SetTextColor(whiteColor)
        
        local normalColor = Color(0, 117, 222, 255)
        local hoverColor = Color(0, 150, 255, 255)
        local clickColor = Color(0, 80, 200, 255)
        local bgColor = normalColor
        
        local lerpColor = normalColor
        local lerpSpeed = 0.1
        
        function saveButton:OnCursorEntered()
            lerpColor = hoverColor
        end
        
        function saveButton:OnCursorExited()
            lerpColor = normalColor
        end
        
        function saveButton:OnMousePressed(mousecode)
            if mousecode == MOUSE_LEFT then
                lerpColor = clickColor
            end
        end
        
        function saveButton:OnMouseReleased(mousecode)
            if mousecode == MOUSE_LEFT then
                lerpColor = hoverColor
                self:DoClick()
            end
        end
        
        function saveButton:Paint(w, h)
            bgColor = Color(
                Lerp(lerpSpeed, bgColor.r, lerpColor.r),
                Lerp(lerpSpeed, bgColor.g, lerpColor.g),
                Lerp(lerpSpeed, bgColor.b, lerpColor.b),
                Lerp(lerpSpeed, bgColor.a, lerpColor.a)
            )
            draw.RoundedBox(8, 0, 0, w, h, bgColor)
        end
        
        saveButton.DoClick = function()
            net.Start("UpdateFakeLicenses")
            net.WriteString(jobComboBox:GetValue() or "Гражданский")
            net.WriteBool(checkboxWeapon:GetChecked())
            net.WriteBool(checkboxBuilding:GetChecked())
            net.WriteBool(checkboxBusiness:GetChecked())
            net.SendToServer()
        end
    end
end

net.Receive('OpenPassportMenu', function()
    local targetPlayer = net.ReadEntity()
    local partsCount = net.ReadUInt(32)
    local jsonData = ""

    for i = 1, partsCount do
        jsonData = jsonData .. net.ReadString()
    end

    local isFake = net.ReadBool()

    local data = util.JSONToTable(jsonData)
    if data then
        data.targetPlayer = targetPlayer
        data.isFake = isFake
        CreatePassportMenu(data)
    end
end)

net.Receive('ShowFakePassportNotification', function()
    local fromPlayerName = urldecode(net.ReadString())
    local fromPlayer = net.ReadEntity()
    net.Start("AcceptFakePassport")
    net.WriteEntity(fromPlayer)
    net.SendToServer()
end)

net.Receive('ShowPassportNotification', function()
    local fromPlayerName = urldecode(net.ReadString())
    local fromPlayer = net.ReadEntity()
    net.Start("AcceptPassport")
    net.WriteEntity(fromPlayer)
    net.SendToServer()
end)

net.Receive('PassportAlreadyOpen', function()
    notification.AddLegacy("Вы уже просматриваете паспорт.", NOTIFY_ERROR, 5)
end)

--PATH addons/unbox/lua/unbox/crate.lua:
local CustomIcons = BUC2.CustomCrateIcons
local crateMat = Material("bu2/case.png", "smooth noclamp")
local keyMat = Material("bu2/key.png", "smooth noclamp")
local itemShadowMat = Material("bu2/item_shadow.png", "smooth noclamp")
local color_white = Color(255, 255, 255)

return {
    Base = "EditablePanel",
    Init = function(self)
        self.outlinec = Color(0, 0, 0)
        self.PaintCase = true
    end,
    Set = function(self, itemTable)
        self.itemTable = itemTable
        self.itemType = itemTable.itemType
        self:SetToolTip(itemTable.name2 or "")
    end,
    PaintBackground = function(self, w, h)
        surface.SetDrawColor(color_white)
        surface.SetMaterial(itemShadowMat)
        surface.DrawTexturedRect(0, 0, 180, 180)
        --[[ local col = self.itemTable.color

		surface.SetDrawColor(col)
		surface.SetMaterial(itemBannerMat)
		surface.DrawTexturedRect(0,180,180,40)--]]
        --Draw text
        draw.SimpleText(self.itemTable.name1, "ub2_1", w / 2, 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    end,
    --draw.SimpleText(self.itemTable.name2,"ub2_2",5,200,Color(255,255,255))
    Paint = function(self, w, h)
        self:PaintBackground(w, h)

        if self.itemType == "Crate" then
            local customIcon = CustomIcons[self.itemTable.name1]

            if customIcon then
                local size = h
                surface.SetDrawColor(color_white)
                surface.SetMaterial(customIcon)
                surface.DrawTexturedRect(w / 2 - size / 2 + 20, h / 2 - size / 2 + 28, size - 40, size - 40)
            else
                local size = h
                surface.SetDrawColor(self.PaintCase and self.itemTable.color or color_white)
                surface.SetMaterial(crateMat)
                surface.DrawTexturedRect(w / 2 - size / 2, h / 2 - size / 2 + 15, size, size)
            end
        elseif self.itemType == "Key" then
            surface.SetDrawColor(self.itemTable.color)
            surface.SetMaterial(keyMat)
            surface.DrawTexturedRect(0, 0, 180, 180)
        end
    end
}
--PATH addons/chat/lua/autorun/client/init_cl.lua:
grp = grp or {}

--[[
	UTF-8
]]

-- string.utf8lower()
-- string.utf8upper()
-- string.utf8sub()
-- string.utf8len()
-- string.utf8reverse()

local utf8_lc_uc = {
	["a"] = "A",
	["b"] = "B",
	["c"] = "C",
	["d"] = "D",
	["e"] = "E",
	["f"] = "F",
	["g"] = "G",
	["h"] = "H",
	["i"] = "I",
	["j"] = "J",
	["k"] = "K",
	["l"] = "L",
	["m"] = "M",
	["n"] = "N",
	["o"] = "O",
	["p"] = "P",
	["q"] = "Q",
	["r"] = "R",
	["s"] = "S",
	["t"] = "T",
	["u"] = "U",
	["v"] = "V",
	["w"] = "W",
	["x"] = "X",
	["y"] = "Y",
	["z"] = "Z",
	["µ"] = "Μ",
	["à"] = "À",
	["á"] = "Á",
	["â"] = "Â",
	["ã"] = "Ã",
	["ä"] = "Ä",
	["å"] = "Å",
	["æ"] = "Æ",
	["ç"] = "Ç",
	["è"] = "È",
	["é"] = "É",
	["ê"] = "Ê",
	["ë"] = "Ë",
	["ì"] = "Ì",
	["í"] = "Í",
	["î"] = "Î",
	["ï"] = "Ï",
	["ð"] = "Ð",
	["ñ"] = "Ñ",
	["ò"] = "Ò",
	["ó"] = "Ó",
	["ô"] = "Ô",
	["õ"] = "Õ",
	["ö"] = "Ö",
	["ø"] = "Ø",
	["ù"] = "Ù",
	["ú"] = "Ú",
	["û"] = "Û",
	["ü"] = "Ü",
	["ý"] = "Ý",
	["þ"] = "Þ",
	["ÿ"] = "Ÿ",
	["ā"] = "Ā",
	["ă"] = "Ă",
	["ą"] = "Ą",
	["ć"] = "Ć",
	["ĉ"] = "Ĉ",
	["ċ"] = "Ċ",
	["č"] = "Č",
	["ď"] = "Ď",
	["đ"] = "Đ",
	["ē"] = "Ē",
	["ĕ"] = "Ĕ",
	["ė"] = "Ė",
	["ę"] = "Ę",
	["ě"] = "Ě",
	["ĝ"] = "Ĝ",
	["ğ"] = "Ğ",
	["ġ"] = "Ġ",
	["ģ"] = "Ģ",
	["ĥ"] = "Ĥ",
	["ħ"] = "Ħ",
	["ĩ"] = "Ĩ",
	["ī"] = "Ī",
	["ĭ"] = "Ĭ",
	["į"] = "Į",
	["ı"] = "I",
	["ĳ"] = "Ĳ",
	["ĵ"] = "Ĵ",
	["ķ"] = "Ķ",
	["ĺ"] = "Ĺ",
	["ļ"] = "Ļ",
	["ľ"] = "Ľ",
	["ŀ"] = "Ŀ",
	["ł"] = "Ł",
	["ń"] = "Ń",
	["ņ"] = "Ņ",
	["ň"] = "Ň",
	["ŋ"] = "Ŋ",
	["ō"] = "Ō",
	["ŏ"] = "Ŏ",
	["ő"] = "Ő",
	["œ"] = "Œ",
	["ŕ"] = "Ŕ",
	["ŗ"] = "Ŗ",
	["ř"] = "Ř",
	["ś"] = "Ś",
	["ŝ"] = "Ŝ",
	["ş"] = "Ş",
	["š"] = "Š",
	["ţ"] = "Ţ",
	["ť"] = "Ť",
	["ŧ"] = "Ŧ",
	["ũ"] = "Ũ",
	["ū"] = "Ū",
	["ŭ"] = "Ŭ",
	["ů"] = "Ů",
	["ű"] = "Ű",
	["ų"] = "Ų",
	["ŵ"] = "Ŵ",
	["ŷ"] = "Ŷ",
	["ź"] = "Ź",
	["ż"] = "Ż",
	["ž"] = "Ž",
	["ſ"] = "S",
	["ƀ"] = "Ƀ",
	["ƃ"] = "Ƃ",
	["ƅ"] = "Ƅ",
	["ƈ"] = "Ƈ",
	["ƌ"] = "Ƌ",
	["ƒ"] = "Ƒ",
	["ƕ"] = "Ƕ",
	["ƙ"] = "Ƙ",
	["ƚ"] = "Ƚ",
	["ƞ"] = "Ƞ",
	["ơ"] = "Ơ",
	["ƣ"] = "Ƣ",
	["ƥ"] = "Ƥ",
	["ƨ"] = "Ƨ",
	["ƭ"] = "Ƭ",
	["ư"] = "Ư",
	["ƴ"] = "Ƴ",
	["ƶ"] = "Ƶ",
	["ƹ"] = "Ƹ",
	["ƽ"] = "Ƽ",
	["ƿ"] = "Ƿ",
	["ǅ"] = "Ǆ",
	["ǆ"] = "Ǆ",
	["ǈ"] = "Ǉ",
	["ǉ"] = "Ǉ",
	["ǋ"] = "Ǌ",
	["ǌ"] = "Ǌ",
	["ǎ"] = "Ǎ",
	["ǐ"] = "Ǐ",
	["ǒ"] = "Ǒ",
	["ǔ"] = "Ǔ",
	["ǖ"] = "Ǖ",
	["ǘ"] = "Ǘ",
	["ǚ"] = "Ǚ",
	["ǜ"] = "Ǜ",
	["ǝ"] = "Ǝ",
	["ǟ"] = "Ǟ",
	["ǡ"] = "Ǡ",
	["ǣ"] = "Ǣ",
	["ǥ"] = "Ǥ",
	["ǧ"] = "Ǧ",
	["ǩ"] = "Ǩ",
	["ǫ"] = "Ǫ",
	["ǭ"] = "Ǭ",
	["ǯ"] = "Ǯ",
	["ǲ"] = "Ǳ",
	["ǳ"] = "Ǳ",
	["ǵ"] = "Ǵ",
	["ǹ"] = "Ǹ",
	["ǻ"] = "Ǻ",
	["ǽ"] = "Ǽ",
	["ǿ"] = "Ǿ",
	["ȁ"] = "Ȁ",
	["ȃ"] = "Ȃ",
	["ȅ"] = "Ȅ",
	["ȇ"] = "Ȇ",
	["ȉ"] = "Ȉ",
	["ȋ"] = "Ȋ",
	["ȍ"] = "Ȍ",
	["ȏ"] = "Ȏ",
	["ȑ"] = "Ȑ",
	["ȓ"] = "Ȓ",
	["ȕ"] = "Ȕ",
	["ȗ"] = "Ȗ",
	["ș"] = "Ș",
	["ț"] = "Ț",
	["ȝ"] = "Ȝ",
	["ȟ"] = "Ȟ",
	["ȣ"] = "Ȣ",
	["ȥ"] = "Ȥ",
	["ȧ"] = "Ȧ",
	["ȩ"] = "Ȩ",
	["ȫ"] = "Ȫ",
	["ȭ"] = "Ȭ",
	["ȯ"] = "Ȯ",
	["ȱ"] = "Ȱ",
	["ȳ"] = "Ȳ",
	["ȼ"] = "Ȼ",
	["ɂ"] = "Ɂ",
	["ɇ"] = "Ɇ",
	["ɉ"] = "Ɉ",
	["ɋ"] = "Ɋ",
	["ɍ"] = "Ɍ",
	["ɏ"] = "Ɏ",
	["ɓ"] = "Ɓ",
	["ɔ"] = "Ɔ",
	["ɖ"] = "Ɖ",
	["ɗ"] = "Ɗ",
	["ə"] = "Ə",
	["ɛ"] = "Ɛ",
	["ɠ"] = "Ɠ",
	["ɣ"] = "Ɣ",
	["ɨ"] = "Ɨ",
	["ɩ"] = "Ɩ",
	["ɫ"] = "Ɫ",
	["ɯ"] = "Ɯ",
	["ɲ"] = "Ɲ",
	["ɵ"] = "Ɵ",
	["ɽ"] = "Ɽ",
	["ʀ"] = "Ʀ",
	["ʃ"] = "Ʃ",
	["ʈ"] = "Ʈ",
	["ʉ"] = "Ʉ",
	["ʊ"] = "Ʊ",
	["ʋ"] = "Ʋ",
	["ʌ"] = "Ʌ",
	["ʒ"] = "Ʒ",
	["ͅ"] = "Ι",
	["ͻ"] = "Ͻ",
	["ͼ"] = "Ͼ",
	["ͽ"] = "Ͽ",
	["ά"] = "Ά",
	["έ"] = "Έ",
	["ή"] = "Ή",
	["ί"] = "Ί",
	["α"] = "Α",
	["β"] = "Β",
	["γ"] = "Γ",
	["δ"] = "Δ",
	["ε"] = "Ε",
	["ζ"] = "Ζ",
	["η"] = "Η",
	["θ"] = "Θ",
	["ι"] = "Ι",
	["κ"] = "Κ",
	["λ"] = "Λ",
	["μ"] = "Μ",
	["ν"] = "Ν",
	["ξ"] = "Ξ",
	["ο"] = "Ο",
	["π"] = "Π",
	["ρ"] = "Ρ",
	["ς"] = "Σ",
	["σ"] = "Σ",
	["τ"] = "Τ",
	["υ"] = "Υ",
	["φ"] = "Φ",
	["χ"] = "Χ",
	["ψ"] = "Ψ",
	["ω"] = "Ω",
	["ϊ"] = "Ϊ",
	["ϋ"] = "Ϋ",
	["ό"] = "Ό",
	["ύ"] = "Ύ",
	["ώ"] = "Ώ",
	["ϐ"] = "Β",
	["ϑ"] = "Θ",
	["ϕ"] = "Φ",
	["ϖ"] = "Π",
	["ϙ"] = "Ϙ",
	["ϛ"] = "Ϛ",
	["ϝ"] = "Ϝ",
	["ϟ"] = "Ϟ",
	["ϡ"] = "Ϡ",
	["ϣ"] = "Ϣ",
	["ϥ"] = "Ϥ",
	["ϧ"] = "Ϧ",
	["ϩ"] = "Ϩ",
	["ϫ"] = "Ϫ",
	["ϭ"] = "Ϭ",
	["ϯ"] = "Ϯ",
	["ϰ"] = "Κ",
	["ϱ"] = "Ρ",
	["ϲ"] = "Ϲ",
	["ϵ"] = "Ε",
	["ϸ"] = "Ϸ",
	["ϻ"] = "Ϻ",
	["а"] = "А",
	["б"] = "Б",
	["в"] = "В",
	["г"] = "Г",
	["д"] = "Д",
	["е"] = "Е",
	["ж"] = "Ж",
	["з"] = "З",
	["и"] = "И",
	["й"] = "Й",
	["к"] = "К",
	["л"] = "Л",
	["м"] = "М",
	["н"] = "Н",
	["о"] = "О",
	["п"] = "П",
	["р"] = "Р",
	["с"] = "С",
	["т"] = "Т",
	["у"] = "У",
	["ф"] = "Ф",
	["х"] = "Х",
	["ц"] = "Ц",
	["ч"] = "Ч",
	["ш"] = "Ш",
	["щ"] = "Щ",
	["ъ"] = "Ъ",
	["ы"] = "Ы",
	["ь"] = "Ь",
	["э"] = "Э",
	["ю"] = "Ю",
	["я"] = "Я",
	["ѐ"] = "Ѐ",
	["ё"] = "Ё",
	["ђ"] = "Ђ",
	["ѓ"] = "Ѓ",
	["є"] = "Є",
	["ѕ"] = "Ѕ",
	["і"] = "І",
	["ї"] = "Ї",
	["ј"] = "Ј",
	["љ"] = "Љ",
	["њ"] = "Њ",
	["ћ"] = "Ћ",
	["ќ"] = "Ќ",
	["ѝ"] = "Ѝ",
	["ў"] = "Ў",
	["џ"] = "Џ",
	["ѡ"] = "Ѡ",
	["ѣ"] = "Ѣ",
	["ѥ"] = "Ѥ",
	["ѧ"] = "Ѧ",
	["ѩ"] = "Ѩ",
	["ѫ"] = "Ѫ",
	["ѭ"] = "Ѭ",
	["ѯ"] = "Ѯ",
	["ѱ"] = "Ѱ",
	["ѳ"] = "Ѳ",
	["ѵ"] = "Ѵ",
	["ѷ"] = "Ѷ",
	["ѹ"] = "Ѹ",
	["ѻ"] = "Ѻ",
	["ѽ"] = "Ѽ",
	["ѿ"] = "Ѿ",
	["ҁ"] = "Ҁ",
	["ҋ"] = "Ҋ",
	["ҍ"] = "Ҍ",
	["ҏ"] = "Ҏ",
	["ґ"] = "Ґ",
	["ғ"] = "Ғ",
	["ҕ"] = "Ҕ",
	["җ"] = "Җ",
	["ҙ"] = "Ҙ",
	["қ"] = "Қ",
	["ҝ"] = "Ҝ",
	["ҟ"] = "Ҟ",
	["ҡ"] = "Ҡ",
	["ң"] = "Ң",
	["ҥ"] = "Ҥ",
	["ҧ"] = "Ҧ",
	["ҩ"] = "Ҩ",
	["ҫ"] = "Ҫ",
	["ҭ"] = "Ҭ",
	["ү"] = "Ү",
	["ұ"] = "Ұ",
	["ҳ"] = "Ҳ",
	["ҵ"] = "Ҵ",
	["ҷ"] = "Ҷ",
	["ҹ"] = "Ҹ",
	["һ"] = "Һ",
	["ҽ"] = "Ҽ",
	["ҿ"] = "Ҿ",
	["ӂ"] = "Ӂ",
	["ӄ"] = "Ӄ",
	["ӆ"] = "Ӆ",
	["ӈ"] = "Ӈ",
	["ӊ"] = "Ӊ",
	["ӌ"] = "Ӌ",
	["ӎ"] = "Ӎ",
	["ӏ"] = "Ӏ",
	["ӑ"] = "Ӑ",
	["ӓ"] = "Ӓ",
	["ӕ"] = "Ӕ",
	["ӗ"] = "Ӗ",
	["ә"] = "Ә",
	["ӛ"] = "Ӛ",
	["ӝ"] = "Ӝ",
	["ӟ"] = "Ӟ",
	["ӡ"] = "Ӡ",
	["ӣ"] = "Ӣ",
	["ӥ"] = "Ӥ",
	["ӧ"] = "Ӧ",
	["ө"] = "Ө",
	["ӫ"] = "Ӫ",
	["ӭ"] = "Ӭ",
	["ӯ"] = "Ӯ",
	["ӱ"] = "Ӱ",
	["ӳ"] = "Ӳ",
	["ӵ"] = "Ӵ",
	["ӷ"] = "Ӷ",
	["ӹ"] = "Ӹ",
	["ӻ"] = "Ӻ",
	["ӽ"] = "Ӽ",
	["ӿ"] = "Ӿ",
	["ԁ"] = "Ԁ",
	["ԃ"] = "Ԃ",
	["ԅ"] = "Ԅ",
	["ԇ"] = "Ԇ",
	["ԉ"] = "Ԉ",
	["ԋ"] = "Ԋ",
	["ԍ"] = "Ԍ",
	["ԏ"] = "Ԏ",
	["ԑ"] = "Ԑ",
	["ԓ"] = "Ԓ",
	["ա"] = "Ա",
	["բ"] = "Բ",
	["գ"] = "Գ",
	["դ"] = "Դ",
	["ե"] = "Ե",
	["զ"] = "Զ",
	["է"] = "Է",
	["ը"] = "Ը",
	["թ"] = "Թ",
	["ժ"] = "Ժ",
	["ի"] = "Ի",
	["լ"] = "Լ",
	["խ"] = "Խ",
	["ծ"] = "Ծ",
	["կ"] = "Կ",
	["հ"] = "Հ",
	["ձ"] = "Ձ",
	["ղ"] = "Ղ",
	["ճ"] = "Ճ",
	["մ"] = "Մ",
	["յ"] = "Յ",
	["ն"] = "Ն",
	["շ"] = "Շ",
	["ո"] = "Ո",
	["չ"] = "Չ",
	["պ"] = "Պ",
	["ջ"] = "Ջ",
	["ռ"] = "Ռ",
	["ս"] = "Ս",
	["վ"] = "Վ",
	["տ"] = "Տ",
	["ր"] = "Ր",
	["ց"] = "Ց",
	["ւ"] = "Ւ",
	["փ"] = "Փ",
	["ք"] = "Ք",
	["օ"] = "Օ",
	["ֆ"] = "Ֆ",
	["ᵽ"] = "Ᵽ",
	["ḁ"] = "Ḁ",
	["ḃ"] = "Ḃ",
	["ḅ"] = "Ḅ",
	["ḇ"] = "Ḇ",
	["ḉ"] = "Ḉ",
	["ḋ"] = "Ḋ",
	["ḍ"] = "Ḍ",
	["ḏ"] = "Ḏ",
	["ḑ"] = "Ḑ",
	["ḓ"] = "Ḓ",
	["ḕ"] = "Ḕ",
	["ḗ"] = "Ḗ",
	["ḙ"] = "Ḙ",
	["ḛ"] = "Ḛ",
	["ḝ"] = "Ḝ",
	["ḟ"] = "Ḟ",
	["ḡ"] = "Ḡ",
	["ḣ"] = "Ḣ",
	["ḥ"] = "Ḥ",
	["ḧ"] = "Ḧ",
	["ḩ"] = "Ḩ",
	["ḫ"] = "Ḫ",
	["ḭ"] = "Ḭ",
	["ḯ"] = "Ḯ",
	["ḱ"] = "Ḱ",
	["ḳ"] = "Ḳ",
	["ḵ"] = "Ḵ",
	["ḷ"] = "Ḷ",
	["ḹ"] = "Ḹ",
	["ḻ"] = "Ḻ",
	["ḽ"] = "Ḽ",
	["ḿ"] = "Ḿ",
	["ṁ"] = "Ṁ",
	["ṃ"] = "Ṃ",
	["ṅ"] = "Ṅ",
	["ṇ"] = "Ṇ",
	["ṉ"] = "Ṉ",
	["ṋ"] = "Ṋ",
	["ṍ"] = "Ṍ",
	["ṏ"] = "Ṏ",
	["ṑ"] = "Ṑ",
	["ṓ"] = "Ṓ",
	["ṕ"] = "Ṕ",
	["ṗ"] = "Ṗ",
	["ṙ"] = "Ṙ",
	["ṛ"] = "Ṛ",
	["ṝ"] = "Ṝ",
	["ṟ"] = "Ṟ",
	["ṡ"] = "Ṡ",
	["ṣ"] = "Ṣ",
	["ṥ"] = "Ṥ",
	["ṧ"] = "Ṧ",
	["ṩ"] = "Ṩ",
	["ṫ"] = "Ṫ",
	["ṭ"] = "Ṭ",
	["ṯ"] = "Ṯ",
	["ṱ"] = "Ṱ",
	["ṳ"] = "Ṳ",
	["ṵ"] = "Ṵ",
	["ṷ"] = "Ṷ",
	["ṹ"] = "Ṹ",
	["ṻ"] = "Ṻ",
	["ṽ"] = "Ṽ",
	["ṿ"] = "Ṿ",
	["ẁ"] = "Ẁ",
	["ẃ"] = "Ẃ",
	["ẅ"] = "Ẅ",
	["ẇ"] = "Ẇ",
	["ẉ"] = "Ẉ",
	["ẋ"] = "Ẋ",
	["ẍ"] = "Ẍ",
	["ẏ"] = "Ẏ",
	["ẑ"] = "Ẑ",
	["ẓ"] = "Ẓ",
	["ẕ"] = "Ẕ",
	["ẛ"] = "Ṡ",
	["ạ"] = "Ạ",
	["ả"] = "Ả",
	["ấ"] = "Ấ",
	["ầ"] = "Ầ",
	["ẩ"] = "Ẩ",
	["ẫ"] = "Ẫ",
	["ậ"] = "Ậ",
	["ắ"] = "Ắ",
	["ằ"] = "Ằ",
	["ẳ"] = "Ẳ",
	["ẵ"] = "Ẵ",
	["ặ"] = "Ặ",
	["ẹ"] = "Ẹ",
	["ẻ"] = "Ẻ",
	["ẽ"] = "Ẽ",
	["ế"] = "Ế",
	["ề"] = "Ề",
	["ể"] = "Ể",
	["ễ"] = "Ễ",
	["ệ"] = "Ệ",
	["ỉ"] = "Ỉ",
	["ị"] = "Ị",
	["ọ"] = "Ọ",
	["ỏ"] = "Ỏ",
	["ố"] = "Ố",
	["ồ"] = "Ồ",
	["ổ"] = "Ổ",
	["ỗ"] = "Ỗ",
	["ộ"] = "Ộ",
	["ớ"] = "Ớ",
	["ờ"] = "Ờ",
	["ở"] = "Ở",
	["ỡ"] = "Ỡ",
	["ợ"] = "Ợ",
	["ụ"] = "Ụ",
	["ủ"] = "Ủ",
	["ứ"] = "Ứ",
	["ừ"] = "Ừ",
	["ử"] = "Ử",
	["ữ"] = "Ữ",
	["ự"] = "Ự",
	["ỳ"] = "Ỳ",
	["ỵ"] = "Ỵ",
	["ỷ"] = "Ỷ",
	["ỹ"] = "Ỹ",
	["ἀ"] = "Ἀ",
	["ἁ"] = "Ἁ",
	["ἂ"] = "Ἂ",
	["ἃ"] = "Ἃ",
	["ἄ"] = "Ἄ",
	["ἅ"] = "Ἅ",
	["ἆ"] = "Ἆ",
	["ἇ"] = "Ἇ",
	["ἐ"] = "Ἐ",
	["ἑ"] = "Ἑ",
	["ἒ"] = "Ἒ",
	["ἓ"] = "Ἓ",
	["ἔ"] = "Ἔ",
	["ἕ"] = "Ἕ",
	["ἠ"] = "Ἠ",
	["ἡ"] = "Ἡ",
	["ἢ"] = "Ἢ",
	["ἣ"] = "Ἣ",
	["ἤ"] = "Ἤ",
	["ἥ"] = "Ἥ",
	["ἦ"] = "Ἦ",
	["ἧ"] = "Ἧ",
	["ἰ"] = "Ἰ",
	["ἱ"] = "Ἱ",
	["ἲ"] = "Ἲ",
	["ἳ"] = "Ἳ",
	["ἴ"] = "Ἴ",
	["ἵ"] = "Ἵ",
	["ἶ"] = "Ἶ",
	["ἷ"] = "Ἷ",
	["ὀ"] = "Ὀ",
	["ὁ"] = "Ὁ",
	["ὂ"] = "Ὂ",
	["ὃ"] = "Ὃ",
	["ὄ"] = "Ὄ",
	["ὅ"] = "Ὅ",
	["ὑ"] = "Ὑ",
	["ὓ"] = "Ὓ",
	["ὕ"] = "Ὕ",
	["ὗ"] = "Ὗ",
	["ὠ"] = "Ὠ",
	["ὡ"] = "Ὡ",
	["ὢ"] = "Ὢ",
	["ὣ"] = "Ὣ",
	["ὤ"] = "Ὤ",
	["ὥ"] = "Ὥ",
	["ὦ"] = "Ὦ",
	["ὧ"] = "Ὧ",
	["ὰ"] = "Ὰ",
	["ά"] = "Ά",
	["ὲ"] = "Ὲ",
	["έ"] = "Έ",
	["ὴ"] = "Ὴ",
	["ή"] = "Ή",
	["ὶ"] = "Ὶ",
	["ί"] = "Ί",
	["ὸ"] = "Ὸ",
	["ό"] = "Ό",
	["ὺ"] = "Ὺ",
	["ύ"] = "Ύ",
	["ὼ"] = "Ὼ",
	["ώ"] = "Ώ",
	["ᾀ"] = "ᾈ",
	["ᾁ"] = "ᾉ",
	["ᾂ"] = "ᾊ",
	["ᾃ"] = "ᾋ",
	["ᾄ"] = "ᾌ",
	["ᾅ"] = "ᾍ",
	["ᾆ"] = "ᾎ",
	["ᾇ"] = "ᾏ",
	["ᾐ"] = "ᾘ",
	["ᾑ"] = "ᾙ",
	["ᾒ"] = "ᾚ",
	["ᾓ"] = "ᾛ",
	["ᾔ"] = "ᾜ",
	["ᾕ"] = "ᾝ",
	["ᾖ"] = "ᾞ",
	["ᾗ"] = "ᾟ",
	["ᾠ"] = "ᾨ",
	["ᾡ"] = "ᾩ",
	["ᾢ"] = "ᾪ",
	["ᾣ"] = "ᾫ",
	["ᾤ"] = "ᾬ",
	["ᾥ"] = "ᾭ",
	["ᾦ"] = "ᾮ",
	["ᾧ"] = "ᾯ",
	["ᾰ"] = "Ᾰ",
	["ᾱ"] = "Ᾱ",
	["ᾳ"] = "ᾼ",
	["ι"] = "Ι",
	["ῃ"] = "ῌ",
	["ῐ"] = "Ῐ",
	["ῑ"] = "Ῑ",
	["ῠ"] = "Ῠ",
	["ῡ"] = "Ῡ",
	["ῥ"] = "Ῥ",
	["ῳ"] = "ῼ",
	["ⅎ"] = "Ⅎ",
	["ⅰ"] = "Ⅰ",
	["ⅱ"] = "Ⅱ",
	["ⅲ"] = "Ⅲ",
	["ⅳ"] = "Ⅳ",
	["ⅴ"] = "Ⅴ",
	["ⅵ"] = "Ⅵ",
	["ⅶ"] = "Ⅶ",
	["ⅷ"] = "Ⅷ",
	["ⅸ"] = "Ⅸ",
	["ⅹ"] = "Ⅹ",
	["ⅺ"] = "Ⅺ",
	["ⅻ"] = "Ⅻ",
	["ⅼ"] = "Ⅼ",
	["ⅽ"] = "Ⅽ",
	["ⅾ"] = "Ⅾ",
	["ⅿ"] = "Ⅿ",
	["ↄ"] = "Ↄ",
	["ⓐ"] = "Ⓐ",
	["ⓑ"] = "Ⓑ",
	["ⓒ"] = "Ⓒ",
	["ⓓ"] = "Ⓓ",
	["ⓔ"] = "Ⓔ",
	["ⓕ"] = "Ⓕ",
	["ⓖ"] = "Ⓖ",
	["ⓗ"] = "Ⓗ",
	["ⓘ"] = "Ⓘ",
	["ⓙ"] = "Ⓙ",
	["ⓚ"] = "Ⓚ",
	["ⓛ"] = "Ⓛ",
	["ⓜ"] = "Ⓜ",
	["ⓝ"] = "Ⓝ",
	["ⓞ"] = "Ⓞ",
	["ⓟ"] = "Ⓟ",
	["ⓠ"] = "Ⓠ",
	["ⓡ"] = "Ⓡ",
	["ⓢ"] = "Ⓢ",
	["ⓣ"] = "Ⓣ",
	["ⓤ"] = "Ⓤ",
	["ⓥ"] = "Ⓥ",
	["ⓦ"] = "Ⓦ",
	["ⓧ"] = "Ⓧ",
	["ⓨ"] = "Ⓨ",
	["ⓩ"] = "Ⓩ",
	["ⰰ"] = "Ⰰ",
	["ⰱ"] = "Ⰱ",
	["ⰲ"] = "Ⰲ",
	["ⰳ"] = "Ⰳ",
	["ⰴ"] = "Ⰴ",
	["ⰵ"] = "Ⰵ",
	["ⰶ"] = "Ⰶ",
	["ⰷ"] = "Ⰷ",
	["ⰸ"] = "Ⰸ",
	["ⰹ"] = "Ⰹ",
	["ⰺ"] = "Ⰺ",
	["ⰻ"] = "Ⰻ",
	["ⰼ"] = "Ⰼ",
	["ⰽ"] = "Ⰽ",
	["ⰾ"] = "Ⰾ",
	["ⰿ"] = "Ⰿ",
	["ⱀ"] = "Ⱀ",
	["ⱁ"] = "Ⱁ",
	["ⱂ"] = "Ⱂ",
	["ⱃ"] = "Ⱃ",
	["ⱄ"] = "Ⱄ",
	["ⱅ"] = "Ⱅ",
	["ⱆ"] = "Ⱆ",
	["ⱇ"] = "Ⱇ",
	["ⱈ"] = "Ⱈ",
	["ⱉ"] = "Ⱉ",
	["ⱊ"] = "Ⱊ",
	["ⱋ"] = "Ⱋ",
	["ⱌ"] = "Ⱌ",
	["ⱍ"] = "Ⱍ",
	["ⱎ"] = "Ⱎ",
	["ⱏ"] = "Ⱏ",
	["ⱐ"] = "Ⱐ",
	["ⱑ"] = "Ⱑ",
	["ⱒ"] = "Ⱒ",
	["ⱓ"] = "Ⱓ",
	["ⱔ"] = "Ⱔ",
	["ⱕ"] = "Ⱕ",
	["ⱖ"] = "Ⱖ",
	["ⱗ"] = "Ⱗ",
	["ⱘ"] = "Ⱘ",
	["ⱙ"] = "Ⱙ",
	["ⱚ"] = "Ⱚ",
	["ⱛ"] = "Ⱛ",
	["ⱜ"] = "Ⱜ",
	["ⱝ"] = "Ⱝ",
	["ⱞ"] = "Ⱞ",
	["ⱡ"] = "Ⱡ",
	["ⱥ"] = "Ⱥ",
	["ⱦ"] = "Ⱦ",
	["ⱨ"] = "Ⱨ",
	["ⱪ"] = "Ⱪ",
	["ⱬ"] = "Ⱬ",
	["ⱶ"] = "Ⱶ",
	["ⲁ"] = "Ⲁ",
	["ⲃ"] = "Ⲃ",
	["ⲅ"] = "Ⲅ",
	["ⲇ"] = "Ⲇ",
	["ⲉ"] = "Ⲉ",
	["ⲋ"] = "Ⲋ",
	["ⲍ"] = "Ⲍ",
	["ⲏ"] = "Ⲏ",
	["ⲑ"] = "Ⲑ",
	["ⲓ"] = "Ⲓ",
	["ⲕ"] = "Ⲕ",
	["ⲗ"] = "Ⲗ",
	["ⲙ"] = "Ⲙ",
	["ⲛ"] = "Ⲛ",
	["ⲝ"] = "Ⲝ",
	["ⲟ"] = "Ⲟ",
	["ⲡ"] = "Ⲡ",
	["ⲣ"] = "Ⲣ",
	["ⲥ"] = "Ⲥ",
	["ⲧ"] = "Ⲧ",
	["ⲩ"] = "Ⲩ",
	["ⲫ"] = "Ⲫ",
	["ⲭ"] = "Ⲭ",
	["ⲯ"] = "Ⲯ",
	["ⲱ"] = "Ⲱ",
	["ⲳ"] = "Ⲳ",
	["ⲵ"] = "Ⲵ",
	["ⲷ"] = "Ⲷ",
	["ⲹ"] = "Ⲹ",
	["ⲻ"] = "Ⲻ",
	["ⲽ"] = "Ⲽ",
	["ⲿ"] = "Ⲿ",
	["ⳁ"] = "Ⳁ",
	["ⳃ"] = "Ⳃ",
	["ⳅ"] = "Ⳅ",
	["ⳇ"] = "Ⳇ",
	["ⳉ"] = "Ⳉ",
	["ⳋ"] = "Ⳋ",
	["ⳍ"] = "Ⳍ",
	["ⳏ"] = "Ⳏ",
	["ⳑ"] = "Ⳑ",
	["ⳓ"] = "Ⳓ",
	["ⳕ"] = "Ⳕ",
	["ⳗ"] = "Ⳗ",
	["ⳙ"] = "Ⳙ",
	["ⳛ"] = "Ⳛ",
	["ⳝ"] = "Ⳝ",
	["ⳟ"] = "Ⳟ",
	["ⳡ"] = "Ⳡ",
	["ⳣ"] = "Ⳣ",
	["ⴀ"] = "Ⴀ",
	["ⴁ"] = "Ⴁ",
	["ⴂ"] = "Ⴂ",
	["ⴃ"] = "Ⴃ",
	["ⴄ"] = "Ⴄ",
	["ⴅ"] = "Ⴅ",
	["ⴆ"] = "Ⴆ",
	["ⴇ"] = "Ⴇ",
	["ⴈ"] = "Ⴈ",
	["ⴉ"] = "Ⴉ",
	["ⴊ"] = "Ⴊ",
	["ⴋ"] = "Ⴋ",
	["ⴌ"] = "Ⴌ",
	["ⴍ"] = "Ⴍ",
	["ⴎ"] = "Ⴎ",
	["ⴏ"] = "Ⴏ",
	["ⴐ"] = "Ⴐ",
	["ⴑ"] = "Ⴑ",
	["ⴒ"] = "Ⴒ",
	["ⴓ"] = "Ⴓ",
	["ⴔ"] = "Ⴔ",
	["ⴕ"] = "Ⴕ",
	["ⴖ"] = "Ⴖ",
	["ⴗ"] = "Ⴗ",
	["ⴘ"] = "Ⴘ",
	["ⴙ"] = "Ⴙ",
	["ⴚ"] = "Ⴚ",
	["ⴛ"] = "Ⴛ",
	["ⴜ"] = "Ⴜ",
	["ⴝ"] = "Ⴝ",
	["ⴞ"] = "Ⴞ",
	["ⴟ"] = "Ⴟ",
	["ⴠ"] = "Ⴠ",
	["ⴡ"] = "Ⴡ",
	["ⴢ"] = "Ⴢ",
	["ⴣ"] = "Ⴣ",
	["ⴤ"] = "Ⴤ",
	["ⴥ"] = "Ⴥ",
	["ａ"] = "Ａ",
	["ｂ"] = "Ｂ",
	["ｃ"] = "Ｃ",
	["ｄ"] = "Ｄ",
	["ｅ"] = "Ｅ",
	["ｆ"] = "Ｆ",
	["ｇ"] = "Ｇ",
	["ｈ"] = "Ｈ",
	["ｉ"] = "Ｉ",
	["ｊ"] = "Ｊ",
	["ｋ"] = "Ｋ",
	["ｌ"] = "Ｌ",
	["ｍ"] = "Ｍ",
	["ｎ"] = "Ｎ",
	["ｏ"] = "Ｏ",
	["ｐ"] = "Ｐ",
	["ｑ"] = "Ｑ",
	["ｒ"] = "Ｒ",
	["ｓ"] = "Ｓ",
	["ｔ"] = "Ｔ",
	["ｕ"] = "Ｕ",
	["ｖ"] = "Ｖ",
	["ｗ"] = "Ｗ",
	["ｘ"] = "Ｘ",
	["ｙ"] = "Ｙ",
	["ｚ"] = "Ｚ",
	["𐐨"] = "𐐀",
	["𐐩"] = "𐐁",
	["𐐪"] = "𐐂",
	["𐐫"] = "𐐃",
	["𐐬"] = "𐐄",
	["𐐭"] = "𐐅",
	["𐐮"] = "𐐆",
	["𐐯"] = "𐐇",
	["𐐰"] = "𐐈",
	["𐐱"] = "𐐉",
	["𐐲"] = "𐐊",
	["𐐳"] = "𐐋",
	["𐐴"] = "𐐌",
	["𐐵"] = "𐐍",
	["𐐶"] = "𐐎",
	["𐐷"] = "𐐏",
	["𐐸"] = "𐐐",
	["𐐹"] = "𐐑",
	["𐐺"] = "𐐒",
	["𐐻"] = "𐐓",
	["𐐼"] = "𐐔",
	["𐐽"] = "𐐕",
	["𐐾"] = "𐐖",
	["𐐿"] = "𐐗",
	["𐑀"] = "𐐘",
	["𐑁"] = "𐐙",
	["𐑂"] = "𐐚",
	["𐑃"] = "𐐛",
	["𐑄"] = "𐐜",
	["𐑅"] = "𐐝",
	["𐑆"] = "𐐞",
	["𐑇"] = "𐐟",
	["𐑈"] = "𐐠",
	["𐑉"] = "𐐡",
	["𐑊"] = "𐐢",
	["𐑋"] = "𐐣",
	["𐑌"] = "𐐤",
	["𐑍"] = "𐐥",
	["𐑎"] = "𐐦",
	["𐑏"] = "𐐧",
}


local utf8_uc_lc = {
	["A"] = "a",
	["B"] = "b",
	["C"] = "c",
	["D"] = "d",
	["E"] = "e",
	["F"] = "f",
	["G"] = "g",
	["H"] = "h",
	["I"] = "i",
	["J"] = "j",
	["K"] = "k",
	["L"] = "l",
	["M"] = "m",
	["N"] = "n",
	["O"] = "o",
	["P"] = "p",
	["Q"] = "q",
	["R"] = "r",
	["S"] = "s",
	["T"] = "t",
	["U"] = "u",
	["V"] = "v",
	["W"] = "w",
	["X"] = "x",
	["Y"] = "y",
	["Z"] = "z",
	["À"] = "à",
	["Á"] = "á",
	["Â"] = "â",
	["Ã"] = "ã",
	["Ä"] = "ä",
	["Å"] = "å",
	["Æ"] = "æ",
	["Ç"] = "ç",
	["È"] = "è",
	["É"] = "é",
	["Ê"] = "ê",
	["Ë"] = "ë",
	["Ì"] = "ì",
	["Í"] = "í",
	["Î"] = "î",
	["Ï"] = "ï",
	["Ð"] = "ð",
	["Ñ"] = "ñ",
	["Ò"] = "ò",
	["Ó"] = "ó",
	["Ô"] = "ô",
	["Õ"] = "õ",
	["Ö"] = "ö",
	["Ø"] = "ø",
	["Ù"] = "ù",
	["Ú"] = "ú",
	["Û"] = "û",
	["Ü"] = "ü",
	["Ý"] = "ý",
	["Þ"] = "þ",
	["Ā"] = "ā",
	["Ă"] = "ă",
	["Ą"] = "ą",
	["Ć"] = "ć",
	["Ĉ"] = "ĉ",
	["Ċ"] = "ċ",
	["Č"] = "č",
	["Ď"] = "ď",
	["Đ"] = "đ",
	["Ē"] = "ē",
	["Ĕ"] = "ĕ",
	["Ė"] = "ė",
	["Ę"] = "ę",
	["Ě"] = "ě",
	["Ĝ"] = "ĝ",
	["Ğ"] = "ğ",
	["Ġ"] = "ġ",
	["Ģ"] = "ģ",
	["Ĥ"] = "ĥ",
	["Ħ"] = "ħ",
	["Ĩ"] = "ĩ",
	["Ī"] = "ī",
	["Ĭ"] = "ĭ",
	["Į"] = "į",
	["İ"] = "i",
	["Ĳ"] = "ĳ",
	["Ĵ"] = "ĵ",
	["Ķ"] = "ķ",
	["Ĺ"] = "ĺ",
	["Ļ"] = "ļ",
	["Ľ"] = "ľ",
	["Ŀ"] = "ŀ",
	["Ł"] = "ł",
	["Ń"] = "ń",
	["Ņ"] = "ņ",
	["Ň"] = "ň",
	["Ŋ"] = "ŋ",
	["Ō"] = "ō",
	["Ŏ"] = "ŏ",
	["Ő"] = "ő",
	["Œ"] = "œ",
	["Ŕ"] = "ŕ",
	["Ŗ"] = "ŗ",
	["Ř"] = "ř",
	["Ś"] = "ś",
	["Ŝ"] = "ŝ",
	["Ş"] = "ş",
	["Š"] = "š",
	["Ţ"] = "ţ",
	["Ť"] = "ť",
	["Ŧ"] = "ŧ",
	["Ũ"] = "ũ",
	["Ū"] = "ū",
	["Ŭ"] = "ŭ",
	["Ů"] = "ů",
	["Ű"] = "ű",
	["Ų"] = "ų",
	["Ŵ"] = "ŵ",
	["Ŷ"] = "ŷ",
	["Ÿ"] = "ÿ",
	["Ź"] = "ź",
	["Ż"] = "ż",
	["Ž"] = "ž",
	["Ɓ"] = "ɓ",
	["Ƃ"] = "ƃ",
	["Ƅ"] = "ƅ",
	["Ɔ"] = "ɔ",
	["Ƈ"] = "ƈ",
	["Ɖ"] = "ɖ",
	["Ɗ"] = "ɗ",
	["Ƌ"] = "ƌ",
	["Ǝ"] = "ǝ",
	["Ə"] = "ə",
	["Ɛ"] = "ɛ",
	["Ƒ"] = "ƒ",
	["Ɠ"] = "ɠ",
	["Ɣ"] = "ɣ",
	["Ɩ"] = "ɩ",
	["Ɨ"] = "ɨ",
	["Ƙ"] = "ƙ",
	["Ɯ"] = "ɯ",
	["Ɲ"] = "ɲ",
	["Ɵ"] = "ɵ",
	["Ơ"] = "ơ",
	["Ƣ"] = "ƣ",
	["Ƥ"] = "ƥ",
	["Ʀ"] = "ʀ",
	["Ƨ"] = "ƨ",
	["Ʃ"] = "ʃ",
	["Ƭ"] = "ƭ",
	["Ʈ"] = "ʈ",
	["Ư"] = "ư",
	["Ʊ"] = "ʊ",
	["Ʋ"] = "ʋ",
	["Ƴ"] = "ƴ",
	["Ƶ"] = "ƶ",
	["Ʒ"] = "ʒ",
	["Ƹ"] = "ƹ",
	["Ƽ"] = "ƽ",
	["Ǆ"] = "ǆ",
	["ǅ"] = "ǆ",
	["Ǉ"] = "ǉ",
	["ǈ"] = "ǉ",
	["Ǌ"] = "ǌ",
	["ǋ"] = "ǌ",
	["Ǎ"] = "ǎ",
	["Ǐ"] = "ǐ",
	["Ǒ"] = "ǒ",
	["Ǔ"] = "ǔ",
	["Ǖ"] = "ǖ",
	["Ǘ"] = "ǘ",
	["Ǚ"] = "ǚ",
	["Ǜ"] = "ǜ",
	["Ǟ"] = "ǟ",
	["Ǡ"] = "ǡ",
	["Ǣ"] = "ǣ",
	["Ǥ"] = "ǥ",
	["Ǧ"] = "ǧ",
	["Ǩ"] = "ǩ",
	["Ǫ"] = "ǫ",
	["Ǭ"] = "ǭ",
	["Ǯ"] = "ǯ",
	["Ǳ"] = "ǳ",
	["ǲ"] = "ǳ",
	["Ǵ"] = "ǵ",
	["Ƕ"] = "ƕ",
	["Ƿ"] = "ƿ",
	["Ǹ"] = "ǹ",
	["Ǻ"] = "ǻ",
	["Ǽ"] = "ǽ",
	["Ǿ"] = "ǿ",
	["Ȁ"] = "ȁ",
	["Ȃ"] = "ȃ",
	["Ȅ"] = "ȅ",
	["Ȇ"] = "ȇ",
	["Ȉ"] = "ȉ",
	["Ȋ"] = "ȋ",
	["Ȍ"] = "ȍ",
	["Ȏ"] = "ȏ",
	["Ȑ"] = "ȑ",
	["Ȓ"] = "ȓ",
	["Ȕ"] = "ȕ",
	["Ȗ"] = "ȗ",
	["Ș"] = "ș",
	["Ț"] = "ț",
	["Ȝ"] = "ȝ",
	["Ȟ"] = "ȟ",
	["Ƞ"] = "ƞ",
	["Ȣ"] = "ȣ",
	["Ȥ"] = "ȥ",
	["Ȧ"] = "ȧ",
	["Ȩ"] = "ȩ",
	["Ȫ"] = "ȫ",
	["Ȭ"] = "ȭ",
	["Ȯ"] = "ȯ",
	["Ȱ"] = "ȱ",
	["Ȳ"] = "ȳ",
	["Ⱥ"] = "ⱥ",
	["Ȼ"] = "ȼ",
	["Ƚ"] = "ƚ",
	["Ⱦ"] = "ⱦ",
	["Ɂ"] = "ɂ",
	["Ƀ"] = "ƀ",
	["Ʉ"] = "ʉ",
	["Ʌ"] = "ʌ",
	["Ɇ"] = "ɇ",
	["Ɉ"] = "ɉ",
	["Ɋ"] = "ɋ",
	["Ɍ"] = "ɍ",
	["Ɏ"] = "ɏ",
	["Ά"] = "ά",
	["Έ"] = "έ",
	["Ή"] = "ή",
	["Ί"] = "ί",
	["Ό"] = "ό",
	["Ύ"] = "ύ",
	["Ώ"] = "ώ",
	["Α"] = "α",
	["Β"] = "β",
	["Γ"] = "γ",
	["Δ"] = "δ",
	["Ε"] = "ε",
	["Ζ"] = "ζ",
	["Η"] = "η",
	["Θ"] = "θ",
	["Ι"] = "ι",
	["Κ"] = "κ",
	["Λ"] = "λ",
	["Μ"] = "μ",
	["Ν"] = "ν",
	["Ξ"] = "ξ",
	["Ο"] = "ο",
	["Π"] = "π",
	["Ρ"] = "ρ",
	["Σ"] = "σ",
	["Τ"] = "τ",
	["Υ"] = "υ",
	["Φ"] = "φ",
	["Χ"] = "χ",
	["Ψ"] = "ψ",
	["Ω"] = "ω",
	["Ϊ"] = "ϊ",
	["Ϋ"] = "ϋ",
	["Ϙ"] = "ϙ",
	["Ϛ"] = "ϛ",
	["Ϝ"] = "ϝ",
	["Ϟ"] = "ϟ",
	["Ϡ"] = "ϡ",
	["Ϣ"] = "ϣ",
	["Ϥ"] = "ϥ",
	["Ϧ"] = "ϧ",
	["Ϩ"] = "ϩ",
	["Ϫ"] = "ϫ",
	["Ϭ"] = "ϭ",
	["Ϯ"] = "ϯ",
	["ϴ"] = "θ",
	["Ϸ"] = "ϸ",
	["Ϲ"] = "ϲ",
	["Ϻ"] = "ϻ",
	["Ͻ"] = "ͻ",
	["Ͼ"] = "ͼ",
	["Ͽ"] = "ͽ",
	["Ѐ"] = "ѐ",
	["Ё"] = "ё",
	["Ђ"] = "ђ",
	["Ѓ"] = "ѓ",
	["Є"] = "є",
	["Ѕ"] = "ѕ",
	["І"] = "і",
	["Ї"] = "ї",
	["Ј"] = "ј",
	["Љ"] = "љ",
	["Њ"] = "њ",
	["Ћ"] = "ћ",
	["Ќ"] = "ќ",
	["Ѝ"] = "ѝ",
	["Ў"] = "ў",
	["Џ"] = "џ",
	["А"] = "а",
	["Б"] = "б",
	["В"] = "в",
	["Г"] = "г",
	["Д"] = "д",
	["Е"] = "е",
	["Ж"] = "ж",
	["З"] = "з",
	["И"] = "и",
	["Й"] = "й",
	["К"] = "к",
	["Л"] = "л",
	["М"] = "м",
	["Н"] = "н",
	["О"] = "о",
	["П"] = "п",
	["Р"] = "р",
	["С"] = "с",
	["Т"] = "т",
	["У"] = "у",
	["Ф"] = "ф",
	["Х"] = "х",
	["Ц"] = "ц",
	["Ч"] = "ч",
	["Ш"] = "ш",
	["Щ"] = "щ",
	["Ъ"] = "ъ",
	["Ы"] = "ы",
	["Ь"] = "ь",
	["Э"] = "э",
	["Ю"] = "ю",
	["Я"] = "я",
	["Ѡ"] = "ѡ",
	["Ѣ"] = "ѣ",
	["Ѥ"] = "ѥ",
	["Ѧ"] = "ѧ",
	["Ѩ"] = "ѩ",
	["Ѫ"] = "ѫ",
	["Ѭ"] = "ѭ",
	["Ѯ"] = "ѯ",
	["Ѱ"] = "ѱ",
	["Ѳ"] = "ѳ",
	["Ѵ"] = "ѵ",
	["Ѷ"] = "ѷ",
	["Ѹ"] = "ѹ",
	["Ѻ"] = "ѻ",
	["Ѽ"] = "ѽ",
	["Ѿ"] = "ѿ",
	["Ҁ"] = "ҁ",
	["Ҋ"] = "ҋ",
	["Ҍ"] = "ҍ",
	["Ҏ"] = "ҏ",
	["Ґ"] = "ґ",
	["Ғ"] = "ғ",
	["Ҕ"] = "ҕ",
	["Җ"] = "җ",
	["Ҙ"] = "ҙ",
	["Қ"] = "қ",
	["Ҝ"] = "ҝ",
	["Ҟ"] = "ҟ",
	["Ҡ"] = "ҡ",
	["Ң"] = "ң",
	["Ҥ"] = "ҥ",
	["Ҧ"] = "ҧ",
	["Ҩ"] = "ҩ",
	["Ҫ"] = "ҫ",
	["Ҭ"] = "ҭ",
	["Ү"] = "ү",
	["Ұ"] = "ұ",
	["Ҳ"] = "ҳ",
	["Ҵ"] = "ҵ",
	["Ҷ"] = "ҷ",
	["Ҹ"] = "ҹ",
	["Һ"] = "һ",
	["Ҽ"] = "ҽ",
	["Ҿ"] = "ҿ",
	["Ӏ"] = "ӏ",
	["Ӂ"] = "ӂ",
	["Ӄ"] = "ӄ",
	["Ӆ"] = "ӆ",
	["Ӈ"] = "ӈ",
	["Ӊ"] = "ӊ",
	["Ӌ"] = "ӌ",
	["Ӎ"] = "ӎ",
	["Ӑ"] = "ӑ",
	["Ӓ"] = "ӓ",
	["Ӕ"] = "ӕ",
	["Ӗ"] = "ӗ",
	["Ә"] = "ә",
	["Ӛ"] = "ӛ",
	["Ӝ"] = "ӝ",
	["Ӟ"] = "ӟ",
	["Ӡ"] = "ӡ",
	["Ӣ"] = "ӣ",
	["Ӥ"] = "ӥ",
	["Ӧ"] = "ӧ",
	["Ө"] = "ө",
	["Ӫ"] = "ӫ",
	["Ӭ"] = "ӭ",
	["Ӯ"] = "ӯ",
	["Ӱ"] = "ӱ",
	["Ӳ"] = "ӳ",
	["Ӵ"] = "ӵ",
	["Ӷ"] = "ӷ",
	["Ӹ"] = "ӹ",
	["Ӻ"] = "ӻ",
	["Ӽ"] = "ӽ",
	["Ӿ"] = "ӿ",
	["Ԁ"] = "ԁ",
	["Ԃ"] = "ԃ",
	["Ԅ"] = "ԅ",
	["Ԇ"] = "ԇ",
	["Ԉ"] = "ԉ",
	["Ԋ"] = "ԋ",
	["Ԍ"] = "ԍ",
	["Ԏ"] = "ԏ",
	["Ԑ"] = "ԑ",
	["Ԓ"] = "ԓ",
	["Ա"] = "ա",
	["Բ"] = "բ",
	["Գ"] = "գ",
	["Դ"] = "դ",
	["Ե"] = "ե",
	["Զ"] = "զ",
	["Է"] = "է",
	["Ը"] = "ը",
	["Թ"] = "թ",
	["Ժ"] = "ժ",
	["Ի"] = "ի",
	["Լ"] = "լ",
	["Խ"] = "խ",
	["Ծ"] = "ծ",
	["Կ"] = "կ",
	["Հ"] = "հ",
	["Ձ"] = "ձ",
	["Ղ"] = "ղ",
	["Ճ"] = "ճ",
	["Մ"] = "մ",
	["Յ"] = "յ",
	["Ն"] = "ն",
	["Շ"] = "շ",
	["Ո"] = "ո",
	["Չ"] = "չ",
	["Պ"] = "պ",
	["Ջ"] = "ջ",
	["Ռ"] = "ռ",
	["Ս"] = "ս",
	["Վ"] = "վ",
	["Տ"] = "տ",
	["Ր"] = "ր",
	["Ց"] = "ց",
	["Ւ"] = "ւ",
	["Փ"] = "փ",
	["Ք"] = "ք",
	["Օ"] = "օ",
	["Ֆ"] = "ֆ",
	["Ⴀ"] = "ⴀ",
	["Ⴁ"] = "ⴁ",
	["Ⴂ"] = "ⴂ",
	["Ⴃ"] = "ⴃ",
	["Ⴄ"] = "ⴄ",
	["Ⴅ"] = "ⴅ",
	["Ⴆ"] = "ⴆ",
	["Ⴇ"] = "ⴇ",
	["Ⴈ"] = "ⴈ",
	["Ⴉ"] = "ⴉ",
	["Ⴊ"] = "ⴊ",
	["Ⴋ"] = "ⴋ",
	["Ⴌ"] = "ⴌ",
	["Ⴍ"] = "ⴍ",
	["Ⴎ"] = "ⴎ",
	["Ⴏ"] = "ⴏ",
	["Ⴐ"] = "ⴐ",
	["Ⴑ"] = "ⴑ",
	["Ⴒ"] = "ⴒ",
	["Ⴓ"] = "ⴓ",
	["Ⴔ"] = "ⴔ",
	["Ⴕ"] = "ⴕ",
	["Ⴖ"] = "ⴖ",
	["Ⴗ"] = "ⴗ",
	["Ⴘ"] = "ⴘ",
	["Ⴙ"] = "ⴙ",
	["Ⴚ"] = "ⴚ",
	["Ⴛ"] = "ⴛ",
	["Ⴜ"] = "ⴜ",
	["Ⴝ"] = "ⴝ",
	["Ⴞ"] = "ⴞ",
	["Ⴟ"] = "ⴟ",
	["Ⴠ"] = "ⴠ",
	["Ⴡ"] = "ⴡ",
	["Ⴢ"] = "ⴢ",
	["Ⴣ"] = "ⴣ",
	["Ⴤ"] = "ⴤ",
	["Ⴥ"] = "ⴥ",
	["Ḁ"] = "ḁ",
	["Ḃ"] = "ḃ",
	["Ḅ"] = "ḅ",
	["Ḇ"] = "ḇ",
	["Ḉ"] = "ḉ",
	["Ḋ"] = "ḋ",
	["Ḍ"] = "ḍ",
	["Ḏ"] = "ḏ",
	["Ḑ"] = "ḑ",
	["Ḓ"] = "ḓ",
	["Ḕ"] = "ḕ",
	["Ḗ"] = "ḗ",
	["Ḙ"] = "ḙ",
	["Ḛ"] = "ḛ",
	["Ḝ"] = "ḝ",
	["Ḟ"] = "ḟ",
	["Ḡ"] = "ḡ",
	["Ḣ"] = "ḣ",
	["Ḥ"] = "ḥ",
	["Ḧ"] = "ḧ",
	["Ḩ"] = "ḩ",
	["Ḫ"] = "ḫ",
	["Ḭ"] = "ḭ",
	["Ḯ"] = "ḯ",
	["Ḱ"] = "ḱ",
	["Ḳ"] = "ḳ",
	["Ḵ"] = "ḵ",
	["Ḷ"] = "ḷ",
	["Ḹ"] = "ḹ",
	["Ḻ"] = "ḻ",
	["Ḽ"] = "ḽ",
	["Ḿ"] = "ḿ",
	["Ṁ"] = "ṁ",
	["Ṃ"] = "ṃ",
	["Ṅ"] = "ṅ",
	["Ṇ"] = "ṇ",
	["Ṉ"] = "ṉ",
	["Ṋ"] = "ṋ",
	["Ṍ"] = "ṍ",
	["Ṏ"] = "ṏ",
	["Ṑ"] = "ṑ",
	["Ṓ"] = "ṓ",
	["Ṕ"] = "ṕ",
	["Ṗ"] = "ṗ",
	["Ṙ"] = "ṙ",
	["Ṛ"] = "ṛ",
	["Ṝ"] = "ṝ",
	["Ṟ"] = "ṟ",
	["Ṡ"] = "ṡ",
	["Ṣ"] = "ṣ",
	["Ṥ"] = "ṥ",
	["Ṧ"] = "ṧ",
	["Ṩ"] = "ṩ",
	["Ṫ"] = "ṫ",
	["Ṭ"] = "ṭ",
	["Ṯ"] = "ṯ",
	["Ṱ"] = "ṱ",
	["Ṳ"] = "ṳ",
	["Ṵ"] = "ṵ",
	["Ṷ"] = "ṷ",
	["Ṹ"] = "ṹ",
	["Ṻ"] = "ṻ",
	["Ṽ"] = "ṽ",
	["Ṿ"] = "ṿ",
	["Ẁ"] = "ẁ",
	["Ẃ"] = "ẃ",
	["Ẅ"] = "ẅ",
	["Ẇ"] = "ẇ",
	["Ẉ"] = "ẉ",
	["Ẋ"] = "ẋ",
	["Ẍ"] = "ẍ",
	["Ẏ"] = "ẏ",
	["Ẑ"] = "ẑ",
	["Ẓ"] = "ẓ",
	["Ẕ"] = "ẕ",
	["Ạ"] = "ạ",
	["Ả"] = "ả",
	["Ấ"] = "ấ",
	["Ầ"] = "ầ",
	["Ẩ"] = "ẩ",
	["Ẫ"] = "ẫ",
	["Ậ"] = "ậ",
	["Ắ"] = "ắ",
	["Ằ"] = "ằ",
	["Ẳ"] = "ẳ",
	["Ẵ"] = "ẵ",
	["Ặ"] = "ặ",
	["Ẹ"] = "ẹ",
	["Ẻ"] = "ẻ",
	["Ẽ"] = "ẽ",
	["Ế"] = "ế",
	["Ề"] = "ề",
	["Ể"] = "ể",
	["Ễ"] = "ễ",
	["Ệ"] = "ệ",
	["Ỉ"] = "ỉ",
	["Ị"] = "ị",
	["Ọ"] = "ọ",
	["Ỏ"] = "ỏ",
	["Ố"] = "ố",
	["Ồ"] = "ồ",
	["Ổ"] = "ổ",
	["Ỗ"] = "ỗ",
	["Ộ"] = "ộ",
	["Ớ"] = "ớ",
	["Ờ"] = "ờ",
	["Ở"] = "ở",
	["Ỡ"] = "ỡ",
	["Ợ"] = "ợ",
	["Ụ"] = "ụ",
	["Ủ"] = "ủ",
	["Ứ"] = "ứ",
	["Ừ"] = "ừ",
	["Ử"] = "ử",
	["Ữ"] = "ữ",
	["Ự"] = "ự",
	["Ỳ"] = "ỳ",
	["Ỵ"] = "ỵ",
	["Ỷ"] = "ỷ",
	["Ỹ"] = "ỹ",
	["Ἀ"] = "ἀ",
	["Ἁ"] = "ἁ",
	["Ἂ"] = "ἂ",
	["Ἃ"] = "ἃ",
	["Ἄ"] = "ἄ",
	["Ἅ"] = "ἅ",
	["Ἆ"] = "ἆ",
	["Ἇ"] = "ἇ",
	["Ἐ"] = "ἐ",
	["Ἑ"] = "ἑ",
	["Ἒ"] = "ἒ",
	["Ἓ"] = "ἓ",
	["Ἔ"] = "ἔ",
	["Ἕ"] = "ἕ",
	["Ἠ"] = "ἠ",
	["Ἡ"] = "ἡ",
	["Ἢ"] = "ἢ",
	["Ἣ"] = "ἣ",
	["Ἤ"] = "ἤ",
	["Ἥ"] = "ἥ",
	["Ἦ"] = "ἦ",
	["Ἧ"] = "ἧ",
	["Ἰ"] = "ἰ",
	["Ἱ"] = "ἱ",
	["Ἲ"] = "ἲ",
	["Ἳ"] = "ἳ",
	["Ἴ"] = "ἴ",
	["Ἵ"] = "ἵ",
	["Ἶ"] = "ἶ",
	["Ἷ"] = "ἷ",
	["Ὀ"] = "ὀ",
	["Ὁ"] = "ὁ",
	["Ὂ"] = "ὂ",
	["Ὃ"] = "ὃ",
	["Ὄ"] = "ὄ",
	["Ὅ"] = "ὅ",
	["Ὑ"] = "ὑ",
	["Ὓ"] = "ὓ",
	["Ὕ"] = "ὕ",
	["Ὗ"] = "ὗ",
	["Ὠ"] = "ὠ",
	["Ὡ"] = "ὡ",
	["Ὢ"] = "ὢ",
	["Ὣ"] = "ὣ",
	["Ὤ"] = "ὤ",
	["Ὥ"] = "ὥ",
	["Ὦ"] = "ὦ",
	["Ὧ"] = "ὧ",
	["ᾈ"] = "ᾀ",
	["ᾉ"] = "ᾁ",
	["ᾊ"] = "ᾂ",
	["ᾋ"] = "ᾃ",
	["ᾌ"] = "ᾄ",
	["ᾍ"] = "ᾅ",
	["ᾎ"] = "ᾆ",
	["ᾏ"] = "ᾇ",
	["ᾘ"] = "ᾐ",
	["ᾙ"] = "ᾑ",
	["ᾚ"] = "ᾒ",
	["ᾛ"] = "ᾓ",
	["ᾜ"] = "ᾔ",
	["ᾝ"] = "ᾕ",
	["ᾞ"] = "ᾖ",
	["ᾟ"] = "ᾗ",
	["ᾨ"] = "ᾠ",
	["ᾩ"] = "ᾡ",
	["ᾪ"] = "ᾢ",
	["ᾫ"] = "ᾣ",
	["ᾬ"] = "ᾤ",
	["ᾭ"] = "ᾥ",
	["ᾮ"] = "ᾦ",
	["ᾯ"] = "ᾧ",
	["Ᾰ"] = "ᾰ",
	["Ᾱ"] = "ᾱ",
	["Ὰ"] = "ὰ",
	["Ά"] = "ά",
	["ᾼ"] = "ᾳ",
	["Ὲ"] = "ὲ",
	["Έ"] = "έ",
	["Ὴ"] = "ὴ",
	["Ή"] = "ή",
	["ῌ"] = "ῃ",
	["Ῐ"] = "ῐ",
	["Ῑ"] = "ῑ",
	["Ὶ"] = "ὶ",
	["Ί"] = "ί",
	["Ῠ"] = "ῠ",
	["Ῡ"] = "ῡ",
	["Ὺ"] = "ὺ",
	["Ύ"] = "ύ",
	["Ῥ"] = "ῥ",
	["Ὸ"] = "ὸ",
	["Ό"] = "ό",
	["Ὼ"] = "ὼ",
	["Ώ"] = "ώ",
	["ῼ"] = "ῳ",
	["Ω"] = "ω",
	["K"] = "k",
	["Å"] = "å",
	["Ⅎ"] = "ⅎ",
	["Ⅰ"] = "ⅰ",
	["Ⅱ"] = "ⅱ",
	["Ⅲ"] = "ⅲ",
	["Ⅳ"] = "ⅳ",
	["Ⅴ"] = "ⅴ",
	["Ⅵ"] = "ⅵ",
	["Ⅶ"] = "ⅶ",
	["Ⅷ"] = "ⅷ",
	["Ⅸ"] = "ⅸ",
	["Ⅹ"] = "ⅹ",
	["Ⅺ"] = "ⅺ",
	["Ⅻ"] = "ⅻ",
	["Ⅼ"] = "ⅼ",
	["Ⅽ"] = "ⅽ",
	["Ⅾ"] = "ⅾ",
	["Ⅿ"] = "ⅿ",
	["Ↄ"] = "ↄ",
	["Ⓐ"] = "ⓐ",
	["Ⓑ"] = "ⓑ",
	["Ⓒ"] = "ⓒ",
	["Ⓓ"] = "ⓓ",
	["Ⓔ"] = "ⓔ",
	["Ⓕ"] = "ⓕ",
	["Ⓖ"] = "ⓖ",
	["Ⓗ"] = "ⓗ",
	["Ⓘ"] = "ⓘ",
	["Ⓙ"] = "ⓙ",
	["Ⓚ"] = "ⓚ",
	["Ⓛ"] = "ⓛ",
	["Ⓜ"] = "ⓜ",
	["Ⓝ"] = "ⓝ",
	["Ⓞ"] = "ⓞ",
	["Ⓟ"] = "ⓟ",
	["Ⓠ"] = "ⓠ",
	["Ⓡ"] = "ⓡ",
	["Ⓢ"] = "ⓢ",
	["Ⓣ"] = "ⓣ",
	["Ⓤ"] = "ⓤ",
	["Ⓥ"] = "ⓥ",
	["Ⓦ"] = "ⓦ",
	["Ⓧ"] = "ⓧ",
	["Ⓨ"] = "ⓨ",
	["Ⓩ"] = "ⓩ",
	["Ⰰ"] = "ⰰ",
	["Ⰱ"] = "ⰱ",
	["Ⰲ"] = "ⰲ",
	["Ⰳ"] = "ⰳ",
	["Ⰴ"] = "ⰴ",
	["Ⰵ"] = "ⰵ",
	["Ⰶ"] = "ⰶ",
	["Ⰷ"] = "ⰷ",
	["Ⰸ"] = "ⰸ",
	["Ⰹ"] = "ⰹ",
	["Ⰺ"] = "ⰺ",
	["Ⰻ"] = "ⰻ",
	["Ⰼ"] = "ⰼ",
	["Ⰽ"] = "ⰽ",
	["Ⰾ"] = "ⰾ",
	["Ⰿ"] = "ⰿ",
	["Ⱀ"] = "ⱀ",
	["Ⱁ"] = "ⱁ",
	["Ⱂ"] = "ⱂ",
	["Ⱃ"] = "ⱃ",
	["Ⱄ"] = "ⱄ",
	["Ⱅ"] = "ⱅ",
	["Ⱆ"] = "ⱆ",
	["Ⱇ"] = "ⱇ",
	["Ⱈ"] = "ⱈ",
	["Ⱉ"] = "ⱉ",
	["Ⱊ"] = "ⱊ",
	["Ⱋ"] = "ⱋ",
	["Ⱌ"] = "ⱌ",
	["Ⱍ"] = "ⱍ",
	["Ⱎ"] = "ⱎ",
	["Ⱏ"] = "ⱏ",
	["Ⱐ"] = "ⱐ",
	["Ⱑ"] = "ⱑ",
	["Ⱒ"] = "ⱒ",
	["Ⱓ"] = "ⱓ",
	["Ⱔ"] = "ⱔ",
	["Ⱕ"] = "ⱕ",
	["Ⱖ"] = "ⱖ",
	["Ⱗ"] = "ⱗ",
	["Ⱘ"] = "ⱘ",
	["Ⱙ"] = "ⱙ",
	["Ⱚ"] = "ⱚ",
	["Ⱛ"] = "ⱛ",
	["Ⱜ"] = "ⱜ",
	["Ⱝ"] = "ⱝ",
	["Ⱞ"] = "ⱞ",
	["Ⱡ"] = "ⱡ",
	["Ɫ"] = "ɫ",
	["Ᵽ"] = "ᵽ",
	["Ɽ"] = "ɽ",
	["Ⱨ"] = "ⱨ",
	["Ⱪ"] = "ⱪ",
	["Ⱬ"] = "ⱬ",
	["Ⱶ"] = "ⱶ",
	["Ⲁ"] = "ⲁ",
	["Ⲃ"] = "ⲃ",
	["Ⲅ"] = "ⲅ",
	["Ⲇ"] = "ⲇ",
	["Ⲉ"] = "ⲉ",
	["Ⲋ"] = "ⲋ",
	["Ⲍ"] = "ⲍ",
	["Ⲏ"] = "ⲏ",
	["Ⲑ"] = "ⲑ",
	["Ⲓ"] = "ⲓ",
	["Ⲕ"] = "ⲕ",
	["Ⲗ"] = "ⲗ",
	["Ⲙ"] = "ⲙ",
	["Ⲛ"] = "ⲛ",
	["Ⲝ"] = "ⲝ",
	["Ⲟ"] = "ⲟ",
	["Ⲡ"] = "ⲡ",
	["Ⲣ"] = "ⲣ",
	["Ⲥ"] = "ⲥ",
	["Ⲧ"] = "ⲧ",
	["Ⲩ"] = "ⲩ",
	["Ⲫ"] = "ⲫ",
	["Ⲭ"] = "ⲭ",
	["Ⲯ"] = "ⲯ",
	["Ⲱ"] = "ⲱ",
	["Ⲳ"] = "ⲳ",
	["Ⲵ"] = "ⲵ",
	["Ⲷ"] = "ⲷ",
	["Ⲹ"] = "ⲹ",
	["Ⲻ"] = "ⲻ",
	["Ⲽ"] = "ⲽ",
	["Ⲿ"] = "ⲿ",
	["Ⳁ"] = "ⳁ",
	["Ⳃ"] = "ⳃ",
	["Ⳅ"] = "ⳅ",
	["Ⳇ"] = "ⳇ",
	["Ⳉ"] = "ⳉ",
	["Ⳋ"] = "ⳋ",
	["Ⳍ"] = "ⳍ",
	["Ⳏ"] = "ⳏ",
	["Ⳑ"] = "ⳑ",
	["Ⳓ"] = "ⳓ",
	["Ⳕ"] = "ⳕ",
	["Ⳗ"] = "ⳗ",
	["Ⳙ"] = "ⳙ",
	["Ⳛ"] = "ⳛ",
	["Ⳝ"] = "ⳝ",
	["Ⳟ"] = "ⳟ",
	["Ⳡ"] = "ⳡ",
	["Ⳣ"] = "ⳣ",
	["Ａ"] = "ａ",
	["Ｂ"] = "ｂ",
	["Ｃ"] = "ｃ",
	["Ｄ"] = "ｄ",
	["Ｅ"] = "ｅ",
	["Ｆ"] = "ｆ",
	["Ｇ"] = "ｇ",
	["Ｈ"] = "ｈ",
	["Ｉ"] = "ｉ",
	["Ｊ"] = "ｊ",
	["Ｋ"] = "ｋ",
	["Ｌ"] = "ｌ",
	["Ｍ"] = "ｍ",
	["Ｎ"] = "ｎ",
	["Ｏ"] = "ｏ",
	["Ｐ"] = "ｐ",
	["Ｑ"] = "ｑ",
	["Ｒ"] = "ｒ",
	["Ｓ"] = "ｓ",
	["Ｔ"] = "ｔ",
	["Ｕ"] = "ｕ",
	["Ｖ"] = "ｖ",
	["Ｗ"] = "ｗ",
	["Ｘ"] = "ｘ",
	["Ｙ"] = "ｙ",
	["Ｚ"] = "ｚ",
	["𐐀"] = "𐐨",
	["𐐁"] = "𐐩",
	["𐐂"] = "𐐪",
	["𐐃"] = "𐐫",
	["𐐄"] = "𐐬",
	["𐐅"] = "𐐭",
	["𐐆"] = "𐐮",
	["𐐇"] = "𐐯",
	["𐐈"] = "𐐰",
	["𐐉"] = "𐐱",
	["𐐊"] = "𐐲",
	["𐐋"] = "𐐳",
	["𐐌"] = "𐐴",
	["𐐍"] = "𐐵",
	["𐐎"] = "𐐶",
	["𐐏"] = "𐐷",
	["𐐐"] = "𐐸",
	["𐐑"] = "𐐹",
	["𐐒"] = "𐐺",
	["𐐓"] = "𐐻",
	["𐐔"] = "𐐼",
	["𐐕"] = "𐐽",
	["𐐖"] = "𐐾",
	["𐐗"] = "𐐿",
	["𐐘"] = "𐑀",
	["𐐙"] = "𐑁",
	["𐐚"] = "𐑂",
	["𐐛"] = "𐑃",
	["𐐜"] = "𐑄",
	["𐐝"] = "𐑅",
	["𐐞"] = "𐑆",
	["𐐟"] = "𐑇",
	["𐐠"] = "𐑈",
	["𐐡"] = "𐑉",
	["𐐢"] = "𐑊",
	["𐐣"] = "𐑋",
	["𐐤"] = "𐑌",
	["𐐥"] = "𐑍",
	["𐐦"] = "𐑎",
	["𐐧"] = "𐑏",
}

local strbyte, strlen, strsub, type = string.byte, string.len, string.sub, type

-- returns the number of bytes used by the UTF-8 character at byte i in s
-- also doubles as a UTF-8 character validator
local function utf8charbytes(s, i)
	-- argument defaults
	i = i or 1

	-- argument checking
	if type(s) ~= "string" then
		--error("bad argument #1 to 'utf8charbytes' (string expected, got " .. type(s) .. ")")
	end
	if type(i) ~= "number" then
		--error("bad argument #2 to 'utf8charbytes' (number expected, got " .. type(i) .. ")")
	end

	local c = strbyte(s, i)

	-- determine bytes needed for character, based on RFC 3629
	-- validate byte 1
	if c > 0 and c <= 127 then
		-- UTF8-1
		return 1

	elseif c >= 194 and c <= 223 then
		-- UTF8-2
		local c2 = strbyte(s, i + 1)

		if not c2 then
			--error("UTF-8 string terminated early")
			return 4
		end

		-- validate byte 2
		if c2 < 128 or c2 > 191 then
			----error("Invalid UTF-8 character")
		end

		return 2

	elseif c >= 224 and c <= 239 then
		-- UTF8-3
		local c2 = strbyte(s, i + 1)
		local c3 = strbyte(s, i + 2)

		if not c2 or not c3 then
			--error("UTF-8 string terminated early")
		end

		-- validate byte 2
		if c == 224 and (c2 < 160 or c2 > 191) then
			--error("Invalid UTF-8 character")
		elseif c == 237 and (c2 < 128 or c2 > 159) then
			--error("Invalid UTF-8 character")
		elseif c2 < 128 or c2 > 191 then
			--error("Invalid UTF-8 character")
		end

		-- validate byte 3
		if c3 < 128 or c3 > 191 then
			--error("Invalid UTF-8 character")
		end

		return 3

	elseif c >= 240 and c <= 244 then
		-- UTF8-4
		local c2 = strbyte(s, i + 1)
		local c3 = strbyte(s, i + 2)
		local c4 = strbyte(s, i + 3)

		if not c2 or not c3 or not c4 then
			--error("UTF-8 string terminated early")
		end

		-- validate byte 2
		if c == 240 and (c2 < 144 or c2 > 191) then
			--error("Invalid UTF-8 character")
		elseif c == 244 and (c2 < 128 or c2 > 143) then
			--error("Invalid UTF-8 character")
		elseif c2 < 128 or c2 > 191 then
			--error("Invalid UTF-8 character")
		end

		-- validate byte 3
		if c3 < 128 or c3 > 191 then
			--error("Invalid UTF-8 character")
		end

		-- validate byte 4
		if c4 < 128 or c4 > 191 then
			--error("Invalid UTF-8 character")
		end

		return 4

	else
		--error("Invalid UTF-8 character")

		return 4
	end
end

-- returns the number of characters in a UTF-8 string
local function utf8len(s)
	-- argument checking
	if type(s) ~= "string" then
		--error("bad argument #1 to 'utf8len' (string expected, got " .. type(s) .. ")")
	end

	local pos = 1
	local bytes = strlen(s)
	local len = 0

	while pos <= bytes do
		len = len + 1
		pos = pos + utf8charbytes(s, pos)
	end

	return len
end

-- install in the string library
if not string.utf8len then
	string.utf8len = utf8len
end

-- functions identically to string.sub except that i and j are UTF-8 characters
-- instead of bytes
local function utf8sub(s, i, j)
	-- argument defaults
	j = j or -1

	-- argument checking
	if type(s) ~= "string" then
		--error("bad argument #1 to 'utf8sub' (string expected, got " .. type(s) .. ")")
	end
	if type(i) ~= "number" then
		--error("bad argument #2 to 'utf8sub' (number expected, got " .. type(i) .. ")")
	end
	if type(j) ~= "number" then
		--error("bad argument #3 to 'utf8sub' (number expected, got " .. type(j) .. ")")
	end

	local pos = 1
	local bytes = strlen(s)
	local len = 0

	-- only set l if i or j is negative
	local l = (i >= 0 and j >= 0) or utf8len(s)
	local startChar = (i >= 0) and i or l + i + 1
	local endChar   = (j >= 0) and j or l + j + 1

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

		pos = pos + utf8charbytes(s, pos)

		if len == endChar then
			endByte = pos - 1
			break
		end
	end

	return strsub(s, startByte, endByte)
end

-- install in the string library
if not string.utf8sub then
	string.utf8sub = utf8sub
end

-- replace UTF-8 characters based on a mapping table
local function utf8replace(s, mapping)
	-- argument checking
	if type(s) ~= "string" then
		--error("bad argument #1 to 'utf8replace' (string expected, got " .. type(s) .. ")")
	end
	if type(mapping) ~= "table" then
		--error("bad argument #2 to 'utf8replace' (table expected, got " .. type(mapping) .. ")")
	end

	local pos = 1
	local bytes = strlen(s)
	local charbytes
	local newstr = ""

	while pos <= bytes do
		charbytes = utf8charbytes(s, pos)
		local c = strsub(s, pos, pos + charbytes - 1)

		newstr = newstr .. (mapping[c] or c)

		pos = pos + charbytes
	end

	return newstr
end

-- identical to string.upper except it knows about unicode simple case conversions
local function utf8upper(s)
	return utf8replace(s, utf8_lc_uc)
end

-- install in the string library
if not string.utf8upper and utf8_lc_uc then
	string.utf8upper = utf8upper
end

-- identical to string.lower except it knows about unicode simple case conversions
local function utf8lower(s)
	return utf8replace(s, utf8_uc_lc)
end

-- install in the string library
if not string.utf8lower and utf8_uc_lc then
	string.utf8lower = utf8lower
end

-- identical to string.reverse except that it supports UTF-8
local function utf8reverse(s)
	-- argument checking
	if type(s) ~= "string" then
		--error("bad argument #1 to 'utf8reverse' (string expected, got " .. type(s) .. ")")
	end

	local bytes = strlen(s)
	local pos = bytes
	local charbytes
	local newstr = ""

	while pos > 0 do
		c = strbyte(s, pos)
		while c >= 128 and c <= 191 do
			pos = pos - 1
			c = strbyte(pos)
		end

		charbytes = utf8charbytes(s, pos)

		newstr = newstr .. strsub(s, pos, pos + charbytes - 1)

		pos = pos - 1
	end

	return newstr
end

-- install in the string library
if not string.utf8reverse then
	string.utf8reverse = utf8reverse
end

--[[
	End
]]

chat.OldAddText = chat.OldAddText or chat.AddText
function chat.AddText(...)
	if IsValid(LocalPlayer()) then
		CHATBOX = CHATBOX or grp.CreateChatBox()
		CHATBOX:AddMessage({...})
	end
	return chat.OldAddText(...)
end

function chat.GetChatBoxSize(setup)
	if (setup or !IsValid(CHATBOX)) then
		local saved = cvar.GetValue('ChatboxSize')
		if (!saved) then
			return ScrW() * .4, ScrH() * .3
		else
			return math.Clamp(saved[1], 265, ScrW() - 20), math.Clamp(saved[2], 155, ScrH() - 20)
		end
	end

	return CHATBOX:GetSize()
end

function chat.GetChatBoxPos(w, h)
	local _, _h = chat.GetChatBoxSize()
	h = h or _h

	return chat.GetChatBoxLeftBound(), chat.GetChatBoxBottomBound() - h
end

function chat.GetChatBoxLeftBound()
	return ScrW() * 0.021
end

function chat.GetChatBoxBottomBound()
	return ScrH() * 0.85
end

local pmeta = FindMetaTable("Player")

function pmeta:ChatPrint(...)
	chat.AddText(...)
end

net.Receive("grp.ChatPrint", function()
	local str = net.ReadString()

	chat.AddText(Color(100, 255, 100), str)
end)

net.Receive("grp.ChatPrintTbl", function()
	local tbl = net.ReadTable()

	chat.AddText(unpack(tbl))
end)

hook.Add('PlayerBindPress', 'OpenChatbox', function(ply, bind, pressed)
	if (!pressed) then return end

	CHATBOX = CHATBOX or grp.CreateChatBox()

	if (string.find(bind, 'messagemode2')) then
			CHATBOX:Open(true)
		return true
	elseif (string.find(bind, 'messagemode')) then
		CHATBOX:Open(false)
		return true
	end
end)

local function ToggleChat()
	net.Start('grp.ToggleChat')
	net.SendToServer()
end
hook.Add('StartChat', 'grp.chat.StartChat', ToggleChat)

local function DeToggleChat()
	net.Start('grp.DeToggleChat')
	net.SendToServer()
end
hook.Add('FinishChat', 'grp.chat.FinishChat', DeToggleChat)
--PATH gamemodes/darkrp/gamemode/libraries/simplerr.lua:
local CompileFile = CompileFile
local CompileString = CompileString
local debug = debug
local error = error
local file = file
local hook = hook
local include = include
local isfunction = isfunction
local isstring = isstring
local math = math
local os = os
local string = string
local table = table
local tonumber = tonumber
local unpack = unpack
local xpcall = xpcall

-- Template for syntax errors
-- The [ERROR] start of it cannot be removed, because that would make the
-- error mechanism remove all square brackets. Only Garry can make that bullshit up.
local synErrTranslation = [=[[ERROR] Lua is unable to understand file "%s" because its author made a mistake around line number %i.
The best help I can give you is this:

%s

Hints:
%s

------- End of Simplerr error -------
]=] -- The end is a special string by which simplerr errors are internally recognised

-- Template for runtime errors
local runErrTranslation = [=[[ERROR] A runtime error has occurred in "%s" on line %i.
The best help I can give you is this:

%s

Hints:
%s

The responsibility for the error above lies with (the authors of) one (or more) of these files:
%s
------- End of Simplerr error -------
]=]

-- Structure that contains syntax errors and their translations. Catches only the most common errors.
-- Order is important: the structure with the first match is taken.
local synErrs = {
    {
        match = "'=' expected near '(.*)'",
        text = "Right before the '%s', Lua expected to read an '='-sign, but it didn't.",
        format = function(m) return m[1] end,
        hints = {
            "Did you simply forget the '='-sign?",
            "Did you forget a comma?",
            "Is this supposed to be a local variable?"
        }
    },
    {
        match = "'.' expected [(]to close '([{[(])' at line ([0-9-]+)[)] near '(.*)'",
        text = "There is an opening '%s' bracket at line %i, but this bracket is never closed or not closed in time. It was expected to be closed before the '%s' at line %i.",
        format = function(m, l) return m[1], m[2], m[3], l end,
        hints = {
            "Did you forget a comma?",
            "All open brackets ({, (, [) must have a matching closing bracket. Are you sure it's there?",
            "Brackets must be opened and closed in the right order. This will work: ({}), but this won't: ({)}."
        }
    },
    {
        match = "'end' expected [(]to close '(.*)' at line ([0-9-]+)[)] near '(.*)'",
        text = "An '%s' was started on line %i, but it was never ended or not ended in time. It was expected to be ended before the '%s' at line %i",
        format = function(m, l) return m[1], m[2], m[3], l end,
        hints = {
            "For every if/for/do/while/function there must be an 'end' that closes it."
        }
    },
    {
        match = "unfinished string near '(.*)'",
        text = "The string '%s' at line %i is opened, but not closed.",
        format = function(m, l) return m[1], l end,
        hints = {
            "A string is a different word for literal text.",
            "Strings must be in single or double quotation marks (e.g. 'example', \"example\")",
            "A third option for strings is for them to be in double square brackets.",
            "Whatever you use (quotations or square brackets), you must not forget that strings are enclosed within a pair of quotation marks/square brackets."
        }
    },
    {
        match = "unfinished long string near '(.*)'",
        text = "Lua expected to see the end of a multiline string somewhere before the '%s' at line %i.",
        format = function(m, l) return m[1], l end,
        hints = {
            "A string is a different word for literal text.",
            "Multiline strings are strings that span over multiple lines.",
            "Multiline strings must be enclosed by double square brackets.",
            "Whatever you use (quotations or square brackets), you must not forget that strings are enclosed within a pair of quotation marks/square brackets.",
            "If you used brackets, the source of the mistake may be somewhere above the reported line."
        }
    },
    {
        match = "unfinished long comment near '(.*)'",
        text = "Lua expected to see the end of a multiline comment somewhere before the '%s' at line %i.",
        format = function(m, l) return m[1], l end,
        hints = {
            "A comment is text ignored by Lua.",
            "Multiline comments are ones that span multiple lines.",
            "Multiline comments must be enclosed by either /* and */ or double square brackets.",
            "Whatever you use (/**/ or square brackets), you must not forget that once you start a comment, you must end it.",
            "The source of the mistake may be somewhere above the reported line."
        }
    },
    -- Generic error messages
    {
        match = "function arguments expected near '(.*)'",
        text = "A function is being called right before '%s', but its arguments are not given.",
        format = function(m) return m[1] end,
        hints = {
            "Did you write 'something:otherthing'? Try changing it to 'something:otherthing()'"
        }
    },
    {
        match = "unexpected symbol near '(.*)'",
        text = "Right before the '%s', Lua encountered something it could not make sense of.",
        format = function(m) return m[1] end,
        hints = {"Did you forget something here? (Perhaps a closing bracket)", "Is it a typo?"}
    },
    {
        match = "'(.*)' expected near '(.*)'",
        text = "Right before the '%s', Lua expected to read a '%s', but it didn't.",
        format = function(m) return m[2], m[1] end,
        hints = {"Did you forget a keyword?", "Did you forget a comma?"}
    },
    {
        match = "malformed number near '(.*)'",
        text = "Lua attempted to read '%s' as a number, but failed to do so.",
        format = function(m) return m[1] end,
        hints = {
            "Numbers starting with '0x' are hexidecimal.",
            "Lua can get confused when doing '<number>..\"some text\"'. Try inserting a space between the number and the '..'."
        }
    },
}

-- Similar structure for runtime errors. Catches only the most common errors.
-- Order is important: the structure with the first match is taken
local runErrs = {
    {
        match = "table index is nil",
        text = "A table is being indexed by something that does not exist (table index is nil).", -- Requires improvement
        format = function() end,
        hints = {
            "The thing between square brackets does not exist (is nil)."
        }
    },
    {
        match = "table index is NaN",
        text = "A table is being indexed by something that is not really a number (table index is NaN).",
        format = function() end,
        hints = {
            "Did you divide zero by zero thinking it would be funny?"
        }
    },
    {
        match = "attempt to index global '(.*)' [(]a nil value[)]",
        text = "'%s' is being indexed like it is a table, but in reality it does not exist (is nil).",
        format = function(m) return m[1] end,
        hints = {
            "You either have 'something.somethingElse', 'something[somethingElse]' or 'something:somethingElse(more)'. The 'something' here does not exist."
        }
    },
    {
        match = "attempt to index global '(.*)' [(]a (.*) value[)]",
        text = "'%s' is being indexed like it is a table, but in reality it is a %s value.",
        format = function(m) return m[1], m[2] end,
        hints = {
            "You either have 'something.somethingElse' or 'something:somethingElse(more)'. The 'something' here is not a table."
        }
    },
    {
        match = "attempt to index a nil value",
        text = "Something is being indexed like it is a table, but in reality does not exist (is nil).",
        format = function() end,
        hints = {
            "You either have 'something.somethingElse', 'something[somethingElse]' or 'something:somethingElse(more)'. The 'something' here does not exist."
        }
    },
    {
        match = "attempt to index a (.*) value",
        text = "Something is being indexed like it is a table, but in reality it is a %s value.",
        format = function(m) return m[1] end,
        hints = {
            "You either have 'something.somethingElse', 'something[somethingElse]' or 'something:somethingElse(more)'. The 'something' here is not a table."
        }
    },
    {
        match = "attempt to call global '(.*)' [(]a nil value[)]",
        text = "'%s' is being called like it is a function, but in reality does not exist (is nil).",
        format = function(m) return m[1] end,
        hints = {
            "You are doing something(<otherstuff>). The 'something' here does not exist."
        }
    },
    {
        match = "attempt to call a nil value",
        text = "Something is being called like it is a function, but in reality it does not exist (is nil).",
        format = function() end,
        hints = {
            "You are doing something(<otherstuff>). The 'something' here does not exist."
        }
    },
    {
        match = "attempt to call global '(.*)' [(]a (.*) value[)]",
        text = "'%s' is being called like it is a function, but in reality it is a %s.",
        format = function(m) return m[1], m[2] end,
        hints = {
            "You are doing something(<otherstuff>). The 'something' here is not a function."
        }
    },
    {
        match = "attempt to call a (.*) value",
        text = "Something is being called like it is a function, but in reality it is a %s.",
        format = function(m) return m[1] end,
        hints = {
            "You are doing something(<otherstuff>). The 'something' here is not a function."
        }
    },
    {
        match = "attempt to call field '(.*)' [(]a nil value[)]",
        text = "'%s' is being called like it is a function, but in reality it does not exist (is nil).",
        format = function(m) return m[1] end,
        hints = {
            "You are doing either stuff.something(<otherstuff>) or stuff:something(<otherstuff>). The 'something' here does not exist."
        }
    },
    {
        match = "attempt to call field '(.*)' [(]a (.*) value[)]",
        text = "'%s' is being called like it is a function, but in reality it is a %s.",
        format = function(m) return m[1], m[2] end,
        hints = {
            "You are doing either stuff.something(<otherstuff>) or stuff:something(<otherstuff>). The 'something' here is not a function."
        }
    },
    {
        match = "attempt to concatenate global '(.*)' [(]a nil value[)]",
        text = "'%s' is being concatenated to something else, but '%s' does not exist (is nil).",
        format = function(m) return m[1], m[1] end,
        hints = {
            "Concatenation looks like this: something .. otherThing. Either something or otherThing does not exist."
        }
    },
    {
        match = "attempt to concatenate global '(.*)' [(]a (.*) value[)]",
        text = "'%s' is being concatenated to something else, but %s values cannot be concatenated.",
        format = function(m) return m[1], m[2] end,
        hints = {
            "Concatenation looks like this: something .. otherThing. Either something or otherThing is neither string nor number."
        }
    },
    {
        match = "attempt to concatenate a nil value",
        text = "Two (or more) things are being concatenated and one of them does not exist (is nil).",
        format = function() end,
        hints = {
            "Concatenation looks like this: something .. otherThing. Either something or otherThing does not exist."
        }
    },
    {
        match = "attempt to concatenate a (.*) value",
        text = "Two (or more) things are being concatenated and one of them is neither string nor number, but a %s.",
        format = function(m) return m[1] end,
        hints = {
            "Concatenation looks like this: something .. otherThing. Either something or otherThing is neither string nor number."
        }
    },
    {
        match = "stack overflow",
        text = "The stack of function calls has overflowed",
        format = function() end,
        hints = {
            "Most likely infinite recursion.",
            "Do you have a function calling itself?"
        }
    },
    {
        match = "attempt to compare two (.*) values",
        text = "A comparison is being made between two %s values. They cannot be compared.",
        format = function(m) return m[1] end,
        hints = {
            "This error usually occurs when two incompatible things are being compared.",
            "'comparison' in this context means one of <, >, <=, >= (smaller than, greater than, etc.)"
        }
    },
    {
        match = "attempt to compare (.*) with (.*)",
        text = "A comparison is being made between a %s and a %s. This is not possible.",
        format = function(m) return m[1], m[2] end,
        hints = {
            "This error usually occurs when two incompatible things are being compared.",
            "'Comparison' in this context means one of <, >, <=, >= (smaller than, greater than, etc.)"
        }
    },
    {
        match = "attempt to perform arithmetic on a (.*) value",
        text = "Arithmetic operations are being performed on a %s. This is not possible.",
        format = function(m) return m[1] end,
        hints = {
            "'Arithmetic' in this context means adding, multiplying, dividing, etc."
        }
    },
    {
        match = "attempt to get length of global '(.*)' [(]a nil value[)]",
        text = "The length of '%s' is requested as if it is a table, but in reality it does not exist (is nil).",
        format = function(m) return m[1] end,
        hints = {
            "You are doing #something. The 'something' here is does not exist."
        }
    },
    {
        match = "attempt to get length of global '(.*)' [(]a (.*) value[)]",
        text = "The length of '%s' is requested as if it is a table, but in reality it is a %s.",
        format = function(m) return m[1], m[2] end,
        hints = {
            "You are doing #something. The 'something' here is not a table."
        }
    },
    {
        match = "attempt to get length of a nil value",
        text = "The length of something is requested as if it is a table, but in reality it does not exist (is nil).",
        format = function(m) return m[1] end,
        hints = {
            "You are doing #something. The 'something' here is does not exist."
        }
    },
    {
        match = "attempt to get length of a (.*) value",
        text = "The length of something is requested as if it is a table, but in reality it is a %s.",
        format = function(m) return m[1] end,
        hints = {
            "You are doing #something. The 'something' here is not a table."
        }
    },
}

module("simplerr")

-- Get a nicely formatted stack trace. Start is where to start numbering
-- stackMod allows the caller to modify the stack before it is numbered
local function getStack(i, start, stackMod)
    i = i or 1
    start = start or 1
    local stack = {}

    -- Invariant: stack level (i + count) >= 2 and <= last stack item
    for count = 1, math.huge do -- user visible count
        local info = debug.getinfo(i + count, "Sln")
        if not info then break end

        local line = info.currentline or "unknown"
        if line == -1 and info.name then
            table.insert(stack, string.format("function '%s'", info.name))
        else
            table.insert(stack, string.format("%s on line %s", info.short_src, line))
        end
    end

    -- Allow modification of the stack
    if stackMod then stack = stackMod(stack) end

    -- add the numbering
    for count = 1, #stack do
        local stackLevel = start + count - 1
        stack[count] = string.format("\t%i. %s", stackLevel, stack[count])
    end

    return table.concat(stack, "\n")
end

-- Translate a runtime error to simplerr format.
-- Decorate with e.g. wrapError to have it actually throw the error.
function runError(msg, stackNr, hints, path, line, stack)
    stackNr = stackNr or 1
    hints = hints or {"No hints, sorry."}
    hints = "\t- " .. table.concat(hints, "\n\t- ")

    if not path and not line then
        local info = debug.getinfo(stackNr + 1, "Sln") or debug.getinfo(stackNr, "Sln")
        path = info.short_src
        line = info.currentline
    end

    return false, string.format(runErrTranslation, path, line, msg, hints, stack or getStack(stackNr + 1))
end

-- Translate the message of an error
local function translateMsg(msg, path, line, errs)
    local res
    local hints = {"No hints, sorry."}

    for i = 1, #errs do
        local trans = errs[i]
        if not string.find(msg, trans.match) then continue end

        -- translate <eof>
        msg = string.Replace(msg, "<eof>", "end of the file")

        res = string.format(trans.text, trans.format({string.match(msg, trans.match)}, line, path))
        hints = trans.hints

        break
    end

    return res or msg, "\t- " .. table.concat(hints, "\n\t- ")
end

-- Translate an error into a language understandable by non-programmers
local function translateError(path, line, err, translation, errs, stack)
    -- Using .* instead of path because path may be wrong when error is called
    local msg = string.match(err, ".*:[0-9-]+: (.*)")

    local msg, hints = translateMsg(msg, path, line, errs)
    local res = string.format(translation, path, line, msg, hints, stack)
    return res
end


-- Trims the [C] functions at the beginning of the stack
local function trimStart(stack)
    while true do
        if string.StartWith(stack[1], "function ") then
            table.remove(stack, 1)
        else
            break
        end
    end

    return stack
end

-- safeCall uses xpcall, which has the downside that both xpcall and
-- the safeCall function itself end up in the stack trace.
-- This function removes them from the stack trace
local function removeXpcall(stack)
    for i = #stack - 1, 1, -1 do
        if stack[i] == "function 'xpcall'" and string.find(stack[i + 1], "simplerr") then
            table.remove(stack, i)
            table.remove(stack, i) -- also remove the simplerr safeCall call

            return stack
        end
    end

    return stack
end

-- Combines the two above functions
local function stackModAggregate(stack)
    stack = trimStart(stack)
    return removeXpcall(stack)
end

-- Used as the error handler in safeCall
local function errorHandler(err, func)
    -- Investigate the stack. Not using err matching because calls to error can give a different path and line
    local stack = getStack(func and 1 or 2, 1, stackModAggregate) -- add called func to stack

    -- Fetch the path and line number from the top of the stack
    local firstLine = string.sub(stack, 1, string.match(stack, "()\n") - 1)
    local path, line = string.match(firstLine, "\t[0-9-]+%. (.*) on line ([0-9-]+)")
    line = tonumber(line)

    return {err, path, line, stack}
end

-- Call a function and catch immediate runtime errors
function safeCall(f, ...)
    -- Use xpcall so fetching of debug info is in the stack of the error rather than after it is unwound
    local res = {xpcall(f, errorHandler, ...)}

    local succ, errInfo = res[1], res[2]

    if succ then return unpack(res) end

    -- This will only happen if the error is "not enough memory" or "error in error handling".
    -- The former tends to crash the game and the latter will mean it'll probably error in the next line.
    -- But we will try anyway.
    -- Note: stack trace will be less accurate.
    if isstring(errInfo) then errInfo = errorHandler(errInfo, f) end

    -- Skip translation if the error is already a simplerr error
    -- This prevents nested simplerr errors when runError is called by a file loaded by runFile
    local mustTranslate = not string.find(errInfo[1], "------- End of Simplerr error -------")
    return false, mustTranslate and translateError(errInfo[2], errInfo[3], errInfo[1], runErrTranslation, runErrs, errInfo[4]) or errInfo[1]
end

-- Run a file or explain its syntax errors in layman's terms
-- Returns bool succeed, [string error]
-- Do NOT use this on clientside files.
-- Clientside files sent by the server cannot be read using file.Read unless you're the host of a listen server
function runFile(path)
    if not file.Exists(path, "LUA") then error(string.format("Could not run file '%s' (file not found)", path)) end
    local contents = file.Read(path, "LUA")

    -- Files can make a comment containing #NoSimplerr# to disable simplerr (and thus enable autorefresh)
    if string.find(contents, "#NoSimplerr#") then include(path) return true end

    -- Catch syntax errors with CompileString
    local err = CompileString(contents, path, false)

    -- CompileString returns the following string whenever a file is empty: Invalid script - or too short.
    -- It also prints: Not running script <path> - it's too short.
    -- If so, do nothing.
    if err == "Invalid script - or too short." then return true end

    -- No syntax errors, check for immediate runtime errors using CompileFile
    -- Using the function CompileString returned leads to relative path trouble
    if isfunction(err) then return safeCall(CompileFile(path), path) end

    -- Fetch the line number from the error
    local line = string.match(err, ".*:([0-9-]+): .*")
    line = tonumber(line)

    return false, translateError(path, line, err, synErrTranslation, synErrs)
end

-- Error wrapper: decorator for runFile and safeCall that throws an error on failure.
-- Breaks execution. Must be the last decorator.
function wrapError(succ, err, ...)
    if succ then return succ, err, ... end

    error(err)
end

-- Hook wrapper: Calls a hook on error
function wrapHook(succ, err, ...)
    if not succ then hook.Call("onSimplerrError", nil, err) end

    return succ, err, ...
end

-- Logging wrapper: decorator for runFile and safeCall that logs failures.
local log = {}
function wrapLog(succ, err, ...)
    if succ then return succ, err, ... end

    local data = {
        err = err,
        time = os.time()
    }

    table.insert(log, data)

    return succ, err, ...
end

-- Retrieve the log
function getLog() return log end

-- Clear the log
function clearLog() log = {} end

--PATH gamemodes/darkrp/gamemode/libraries/interfaceloader.lua:
module("DarkRP", package.seeall)

MetaName = "DarkRP"

-- Variables that maintain the existing stubs and hooks
local stubs = {}
local hookStubs = {}

-- Contains the functions that the hooks call by default
hooks = {}

-- Delay the calling of methods until the functions are implemented
local delayedCalls = {}

local returnsLayout, isreturns
local parameterLayout, isparameters
local isdeprecated
local checkStub

local hookLayout

local realm -- State variable to manage the realm of the stubs

--[[---------------------------------------------------------------------------
Methods that check whether certain fields are valid
---------------------------------------------------------------------------]]
isreturns = function(tbl)
    if not istable(tbl) then return false end
    for _, v in pairs(tbl) do
        if not checkStub(v, returnsLayout) then return false end
    end
    return true
end

isparameters = function(tbl)
    if not istable(tbl) then return false end
    for _, v in pairs(tbl) do
        if not checkStub(v, parameterLayout) then return false end
    end
    return true
end

isdeprecated = function(val)
    return val == nil or isstring(val)
end

--[[---------------------------------------------------------------------------
The layouts of stubs
---------------------------------------------------------------------------]]
local stubLayout = {
    name = isstring,
    description = isstring,
    deprecated = isdeprecated,
    parameters = isparameters, -- the parameters of a method
    returns = isreturns, -- the return values of a method
    metatable = istable -- DarkRP, Player, Entity, Vector, ...
}

hookLayout = {
    name = isstring,
    description = isstring,
    deprecated = isdeprecated,
    parameters = isreturns, -- doesn't have the 'optional' field
    returns = isreturns,
}

returnsLayout = {
    name = isstring,
    description = isstring,
    type = isstring
}

parameterLayout = {
    name = isstring,
    description = isstring,
    type = isstring,
    optional = isbool
}

--[[---------------------------------------------------------------------------
Check the validity of a stub
---------------------------------------------------------------------------]]
checkStub = function(tbl, stub)
    if not istable(tbl) then return false, "table" end

    for name, check in pairs(stub) do
        if not check(tbl[name]) then
            return false, name
        end
    end

    return true
end

--[[---------------------------------------------------------------------------
When a stub is called, the calling of the method is delayed
---------------------------------------------------------------------------]]
local function notImplemented(name, args, thisFunc)
    if stubs[name] and stubs[name].metatable[name] ~= thisFunc then -- when calling the not implemented function after the function was implemented
        return stubs[name].metatable[name](unpack(args))
    end
    table.insert(delayedCalls, {name = name, args = args})

    return nil -- no return value because the method is not implemented
end

--[[---------------------------------------------------------------------------
Generate a stub
---------------------------------------------------------------------------]]
function stub(tbl)
    local isStub, field = checkStub(tbl, stubLayout)
    if not isStub then
        error("Invalid DarkRP method stub! Field \"" .. field .. "\" is invalid!", 2)
    end

    tbl.realm = tbl.realm or realm
    stubs[tbl.name] = tbl

    local function retNotImpl(...)
        return notImplemented(tbl.name, {...}, retNotImpl)
    end

    return retNotImpl
end

--[[---------------------------------------------------------------------------
Generate a hook stub
---------------------------------------------------------------------------]]
function hookStub(tbl)
    local isStub, field = checkStub(tbl, hookLayout)
    if not isStub then
        error("Invalid DarkRP hook! Field \"" .. field .. "\" is invalid!", 2)
    end

    tbl.realm = tbl.realm or realm
    hookStubs[tbl.name] = tbl
end

--[[---------------------------------------------------------------------------
Retrieve the stubs
---------------------------------------------------------------------------]]
function getStubs()
    return table.Copy(stubs)
end

--[[---------------------------------------------------------------------------
Retrieve the hooks
---------------------------------------------------------------------------]]
function getHooks()
    return table.Copy(hookStubs)
end

--[[---------------------------------------------------------------------------
Call the cached methods
---------------------------------------------------------------------------]]
function finish()
    local calls = table.Copy(delayedCalls) -- Loop through a copy, so the notImplemented function doesn't get called again
    for _, tbl in ipairs(calls) do
        local name = tbl.name

        if not stubs[name] then ErrorNoHalt("Calling non-existing stub \"" .. name .. "\"") continue end

        stubs[name].metatable[name](unpack(tbl.args))
    end

    delayedCalls = {}
end

--[[---------------------------------------------------------------------------
Load the interface files
---------------------------------------------------------------------------]]
local function loadInterfaces()
    local root = GM.FolderName .. "/gamemode/modules"

    local _, folders = file.Find(root .. "/*", "LUA")

    ENTITY = FindMetaTable("Entity")
    PLAYER = FindMetaTable("Player")
    VECTOR = FindMetaTable("Vector")

    for _, folder in SortedPairs(folders, true) do
        local interfacefile = string.format("%s/%s/%s_interface.lua", root, folder, "%s")
        local client = string.format(interfacefile, "cl")
        local shared = string.format(interfacefile, "sh")
        local server = string.format(interfacefile, "sv")

        if file.Exists(shared, "LUA") then
            if SERVER then AddCSLuaFile(shared) end
            realm = "Shared"
            include(shared)
        end

        if SERVER and file.Exists(client, "LUA") then
            AddCSLuaFile(client)
        end

        if SERVER and file.Exists(server, "LUA") then
            realm = "Server"
            include(server)
        end

        if CLIENT and file.Exists(client, "LUA") then
            realm = "Client"
            include(client)
        end
    end

    ENTITY, PLAYER, VECTOR = nil, nil, nil
end
loadInterfaces()

--PATH gamemodes/darkrp/gamemode/modules/language/sh_interface.lua:
DarkRP.addLanguage = DarkRP.stub{
    name = "addLanguage",
    description = "Create a language/translation.",
    parameters = {
        {
            name = "Language name",
            description = "The short name of the language (\"en\" is English). Make sure the language name fits a possible value for gmod_language!",
            type = "string",
            optional = false
        },
        {
            name = "Language contents",
            description = "A table that contains the translation sentences. Look at sh_english.lua for an example.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.addPhrase = DarkRP.stub{
    name = "addPhrase",
    description = "Add a phrase to the existing translation.",
    parameters = {
        {
            name = "Language name",
            description = "The short name of the language (\"en\" is English). Make sure the language name fits a possible value for gmod_language!",
            type = "string",
            optional = false
        },
        {
            name = "key",
            description = "The name of the translated phrase.",
            type = "string",
            optional = false
        },
        {
            name = "translation",
            description = "The translation of the phrase.",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getPhrase = DarkRP.stub{
    name = "getPhrase",
    description = "Get a phrase from the selected language.",
    parameters = {
        {
            name = "key",
            description = "The name of the translated phrase.",
            type = "string",
            optional = false
        },
        {
            name = "Phrase parameters",
            description = "Some phrases need extra information, like in \"PLAYERNAME just won the lottery!\". Not filling in the phrase parameters will cause errors.",
            type = "vararg",
            optional = false
        }
    },
    returns = {
        {
            name = "phrase",
            description = "The formatted phrase.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.getMissingPhrases = DarkRP.stub{
    name = "getMissingPhrases",
    description = "Get all the phrases a language is missing.",
    parameters = {
        {
            name = "languageCode",
            description = "The language code of the language. For English this is \"en\".",
            type = "string",
            optional = true
        }
    },
    returns = {
        {
            name = "missingPhrases",
            description = "All the missing phrases formatted in such way that you can copy and paste it in your language file.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.addChatCommandsLanguage = DarkRP.stub{
    name = "addChatCommandsLanguage",
    description = "Add a translation table for chat command descriptions. See darkrpmod/lua/darkrp_language/chatcommands.lua for an example.",
    parameters = {
        {
            name = "languageCode",
            description = "The language code of the language. For English this is \"en\".",
            type = "string",
            optional = false
        },
        {
            name = "translations",
            description = "Key-value table with chat command strings as keys and their translation as value.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getChatCommandDescription = DarkRP.stub{
    name = "getChatCommandDescription",
    description = "Get the translated description of a chat command.",
    parameters = {
        {
            name = "command",
            description = "The chat command string.",
            type = "string",
            optional = false
        }
    },
    returns = {
        {
            name = "description",
            description = "The translated chat command description.",
            type = "string"
        }
    },
    metatable = DarkRP
}

--PATH gamemodes/darkrp/gamemode/modules/base/sh_interface.lua:
DarkRP.registerDarkRPVar = DarkRP.stub{
    name = "registerDarkRPVar",
    description = "Register a DarkRPVar by name. You should definitely register DarkRPVars. Registering DarkRPVars will make networking much more efficient.",
    parameters = {
        {
            name = "name",
            description = "The name of the DarkRPVar.",
            type = "string",
            optional = false
        },
        {
            name = "writeFn",
            description = "The function that writes a value for this DarkRPVar. Examples: net.WriteString, function(val) net.WriteUInt(val, 8) end.",
            type = "function",
            optional = false
        },
        {
            name = "readFn",
            description = "The function that reads and returns a value for this DarkRPVar. Examples: net.ReadString, function() return net.ReadUInt(8) end.",
            type = "function",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.writeNetDarkRPVar = DarkRP.stub{
    name = "writeNetDarkRPVar",
    description = "Internal function. You probably shouldn't need this. DarkRP calls this function when sending DarkRPVar net messages. This function writes the net data for a specific DarkRPVar.",
    parameters = {
        {
            name = "name",
            description = "The name of the DarkRPVar.",
            type = "string",
            optional = false
        },
        {
            name = "value",
            description = "The value of the DarkRPVar.",
            type = "any",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.writeNetDarkRPVarRemoval = DarkRP.stub{
    name = "writeNetDarkRPVarRemoval",
    description = "Internal function. You probably shouldn't need this. DarkRP calls this function when sending DarkRPVar net messages. This function sets a DarkRPVar to nil.",
    parameters = {
        {
            name = "name",
            description = "The name of the DarkRPVar.",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.readNetDarkRPVar = DarkRP.stub{
    name = "readNetDarkRPVar",
    description = "Internal function. You probably shouldn't need this. DarkRP calls this function when reading DarkRPVar net messages. This function reads the net data for a specific DarkRPVar.",
    parameters = {
    },
    returns = {
        {
            name = "name",
            description = "The name of the DarkRPVar.",
            type = "string"
        },
        {
            name = "value",
            description = "The value of the DarkRPVar.",
            type = "any"
        }
    },
    metatable = DarkRP
}

DarkRP.readNetDarkRPVarRemoval = DarkRP.stub{
    name = "readNetDarkRPVarRemoval",
    description = "Internal function. You probably shouldn't need this. DarkRP calls this function when reading DarkRPVar net messages. This function the removal of a DarkRPVar.",
    parameters = {
    },
    returns = {
        {
            name = "name",
            description = "The name of the DarkRPVar.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.findPlayer = DarkRP.stub{
    name = "findPlayer",
    description = "Find a single player based on vague information.",
    parameters = {
        {
            name = "info",
            description = "The information of the player (UserID, SteamID, name).",
            type = "string",
            optional = false
        }
    },
    returns = {
        {
            name = "found",
            description = "The player that matches the description.",
            type = "Player"
        }
    },
    metatable = DarkRP
}

DarkRP.findPlayers = DarkRP.stub{
    name = "findPlayers",
    description = "Find a list of players based on vague information.",
    parameters = {
        {
            name = "info",
            description = "The information of the player (UserID, SteamID, name).",
            type = "string",
            optional = false
        }
    },
    returns = {
        {
            name = "found",
            description = "Table of players that match the description.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.nickSortedPlayers = DarkRP.stub{
    name = "nickSortedPlayers",
    description = "A table of players sorted by RP name.",
    parameters = {},
    returns = {
        {
            name = "players",
            description = "The list of players sorted by RP name.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.explodeArg = DarkRP.stub{
    name = "explodeArg",
    description = "String arguments exploded into a table. It accounts for substrings in quotes, which makes it more intelligent than string.Explode",
    parameters = {
        {
            name = "arg",
            description = "The full string of the argument",
            type = "string",
            optional = false
        },
    },
    returns = {
        {
            name = "args",
            description = "The table of arguments",
            type = "table"
        }
    },
    metatable = DarkRP
}


DarkRP.formatMoney = DarkRP.stub{
    name = "formatMoney",
    description = "Format a number as a money value. Includes currency symbol.",
    parameters = {
        {
            name = "amount",
            description = "The money to format, e.g. 100000.",
            type = "number",
            optional = false
        }
    },
    returns = {
        {
            name = "money",
            description = "The money as a nice string, e.g. \"$100,000\".",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.getJobByCommand = DarkRP.stub{
    name = "getJobByCommand",
    description = "Get the job table and number from the command of the job.",
    parameters = {
        {
            name = "command",
            description = "The command of the job, without preceding slash (e.g. 'medic' for medic)",
            type = "string",
            optional = false
        }
    },
    returns = {
        {
            name = "tbl",
            description = "A table containing all information about the job.",
            type = "table"
        },
        {
            name = "jobindex",
            description = "The index of the job (for 'medic' it's the value of TEAM_MEDIC).",
            type = "number"
        }
    },
    metatable = DarkRP
}

DarkRP.simplerrRun = DarkRP.stub{
    name = "simplerrRun",
    description = "Run a function with the given parameters and send any runtime errors to admins.",
    parameters = {
        {
            name = "f",
            description = "The function to be called.",
            type = "function",
            optional = false
        },
        {
            name = "args",
            description = "The arguments to be given to f.",
            type = "vararg",
            optional = true
        },
    },
    returns = {
        {
            name = "retVals",
            description = "The return values of f.",
            type = "vararg"
        }
    },
    metatable = DarkRP
}

DarkRP.error = DarkRP.stub{
    name = "error",
    description = "Throw a simplerr formatted error. Also halts the stack, which means that statements after calling this function will not execute.",
    parameters = {
        {
            name = "message",
            description = "The message of the error.",
            type = "string",
            optional = false
        },
        {
            name = "stack",
            description = "From which point in the function call stack to report the error. 1 to include the function that called DarkRP.error, 2 to exclude it, etc. The default value is 1.",
            type = "number",
            optional = true
        },
        {
            name = "hints",
            description = "Table containing hint strings. Use these hints to explain the error, describe possible causes or provide help to solve the problem.",
            type = "table",
            optional = true
        },
        {
            name = "path",
            description = "Override the path of the error. Will be shown in the error message. By default this is determined by the stack level.",
            type = "string",
            optional = true
        },
        {
            name = "line",
            description = "Override the line number of the error. By default this is determined by the stack level.",
            type = "number",
            optional = true
        },

    },
    returns = {
        {
            name = "succeed",
            description = "Simplerr return value: whether the calculation succeeded. Always false. This return value will never be reached.",
            type = "boolean"
        },
        {
            name = "msg",
            description = "Simplerr return value: nicely formatted error message. This return value will never be reached.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.errorNoHalt = DarkRP.stub{
    name = "errorNoHalt",
    description = "Throw a simplerr formatted error. Unlike DarkRP.error, this does not halt the stack. This means that statements after calling this function will be executed like normal.",
    parameters = {
        {
            name = "message",
            description = "The message of the error.",
            type = "string",
            optional = false
        },
        {
            name = "stack",
            description = "From which point in the function call stack to report the error. 1 to include the function that called DarkRP.error, 2 to exclude it, etc. The default value is 1.",
            type = "number",
            optional = true
        },
        {
            name = "hints",
            description = "Table containing hint strings. Use these hints to explain the error, describe possible causes or provide help to solve the problem.",
            type = "table",
            optional = true
        },
        {
            name = "path",
            description = "Override the path of the error. Will be shown in the error message. By default this is determined by the stack level.",
            type = "string",
            optional = true
        },
        {
            name = "line",
            description = "Override the line number of the error. By default this is determined by the stack level.",
            type = "number",
            optional = true
        },

    },
    returns = {
        {
            name = "succeed",
            description = "Simplerr return value: whether the calculation succeeded. Always false.",
            type = "boolean"
        },
        {
            name = "msg",
            description = "Simplerr return value: nicely formatted error message.",
            type = "string"
        }
    },
    metatable = DarkRP
}

-- This function is one of the few that's already defined before the stub is created
DarkRP.stub{
    name = "SteamName",
    description = "Retrieve a player's real (steam) name.",
    parameters = {

    },
    returns = {
        {
            name = "name",
            description = "The player's steam name.",
            type = "string"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.getJobTable = DarkRP.stub{
    name = "getJobTable",
    description = "Get the job table of a player.",
    parameters = {
    },
    returns = {
        {
            name = "job",
            description = "Table with the job information.",
            type = "table"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.getDarkRPVar = DarkRP.stub{
    name = "getDarkRPVar",
    description = "Get the value of a DarkRPVar, which is shared between server and client.",
    parameters = {
        {
            name = "var",
            description = "The name of the variable.",
            type = "string",
            optional = false
        }
    },
    returns = {
        {
            name = "value",
            description = "The value of the DarkRP var.",
            type = "any"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.getAgenda = DarkRP.stub{
    name = "getAgenda",
    description = "Get the agenda a player manages.",
    deprecated = "Use ply:getAgendaTable() instead.",
    parameters = {
    },
    returns = {
        {
            name = "agenda",
            description = "The agenda.",
            type = "table"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.getAgendaTable = DarkRP.stub{
    name = "getAgendaTable",
    description = "Get the agenda a player can see. Note: when a player is not the manager of an agenda, it returns the agenda of the manager.",
    parameters = {
    },
    returns = {
        {
            name = "agenda",
            description = "The agenda.",
            type = "table"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.hasDarkRPPrivilege = DarkRP.stub{
    name = "hasDarkRPPrivilege",
    description = "Whether the player has a certain privilege.",
    parameters = {
        {
            name = "priv",
            description = "The name of the privilege.",
            type = "string",
            optional = false
        }
    },
    returns = {
        {
            name = "answer",
            description = "Whether the player has the privilege.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.getEyeSightHitEntity = DarkRP.stub{
    name = "getEyeSightHitEntity",
    description = "Get the entity that is closest to a player's line of sight and its distance.",
    parameters = {
        {
            name = "searchDistance",
            description = "How far to look. You usually don't want this function to return an entity millions of units away. The default is 100 units.",
            type = "number",
            optional = true
        },
        {
            name = "hitDistance",
            description = "The maximum distance between the player's line of sight and the object. Basically how far the player can be 'looking away' from the object. The default is 15 units.",
            type = "number",
            optional = true
        },
        {
            name = "filter",
            description = "The filter for which entities to look for. By default it only looks for players.",
            type = "function",
            optional = true
        }
    },
    returns = {
        {
            name = "closestEnt",
            description = "The entity that is closest to the player's line of sight. Returns nil when not found.",
            type = "Entity"
        },
        {
            name = "distance",
            description = "The (minimum) distance between the player's line of sight and the object.",
            type = "number"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.VECTOR.isInSight = DarkRP.stub{
    name = "isInSight",
    description = "Decides whether the vector could be seen by the player if they were to look at it.",
    parameters = {
        {
            name = "filter",
            description = "Trace filter that decides what the player can see through.",
            type = "table",
            optional = false
        },
        {
            name = "ply",
            description = "The player for whom the vector may or may not be visible.",
            type = "Player",
            optional = false
        }
    },
    returns = {
        {
            name = "answer",
            description = "Whether the player can see the position.",
            type = "boolean"
        },
        {
            name = "HitPos",
            description = "The position of the thing that blocks the player's sight.",
            type = "Vector"
        }
    },
    metatable = DarkRP.VECTOR
}

DarkRP.hookStub{
    name = "UpdatePlayerSpeed",
    description = "Change a player's walking and running speed.",
    deprecated = "Use GMod's SetupMove and Move hooks instead.",
    parameters = {
        {
            name = "ply",
            description = "The player for whom the speed changes.",
            type = "Player"
        }
    },
    returns = {
    }
}

--[[---------------------------------------------------------------------------
Creating custom items
---------------------------------------------------------------------------]]
DarkRP.createJob = DarkRP.stub{
    name = "createJob",
    description = "Create a job for DarkRP.",
    parameters = {
        {
            name = "name",
            description = "The name of the job.",
            type = "string",
            optional = false
        },
        {
            name = "tbl",
            description = "Table containing the information for the job.",
            type = "table",
            optional = false
        }
    },
    returns = {
        {
            name = "team",
            description = "The team number of the job you've created.",
            type = "number"
        }
    },
    metatable = DarkRP
}
AddExtraTeam = DarkRP.createJob

DarkRP.removeJob = DarkRP.stub{
    name = "removeJob",
    description = "Remove a job from DarkRP.",
    parameters = {
        {
            name = "i",
            description = "The TEAM_ number of the job. Also the index of the job in RPExtraTeams.",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removeShipment = DarkRP.stub{
    name = "removeShipment",
    description = "Remove a shipment from DarkRP. NOTE: Must be called from BOTH server AND client to properly get it removed!",
    parameters = {
        {
            name = "i",
            description = "The index of the item.",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removeVehicle = DarkRP.stub{
    name = "removeVehicle",
    description = "Remove a vehicle from DarkRP. NOTE: Must be called from BOTH server AND client to properly get it removed!",
    parameters = {
        {
            name = "i",
            description = "The index of the item.",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removeEntity = DarkRP.stub{
    name = "removeEntity",
    description = "Remove an entity from DarkRP. NOTE: Must be called from BOTH server AND client to properly get it removed!",
    parameters = {
        {
            name = "i",
            description = "The index of the item.",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removeGroupChat = DarkRP.stub{
    name = "removeGroupChat",
    description = "Remove a groupchat from DarkRP. NOTE: Must be called from BOTH server AND client to properly get it removed!",
    parameters = {
        {
            name = "i",
            description = "The index of the item.",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removeAmmoType = DarkRP.stub{
    name = "removeAmmoType",
    description = "Remove an ammotype from DarkRP. NOTE: Must be called from BOTH server AND client to properly get it removed!",
    parameters = {
        {
            name = "i",
            description = "The index of the item.",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removeEntityGroup = DarkRP.stub{
    name = "removeEntityGroup",
    description = "Remove an entitygroup from DarkRP. NOTE: Must be called from BOTH server AND client to properly get it removed!",
    parameters = {
        {
            name = "name",
            description = "The name of the item.",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removeAgenda = DarkRP.stub{
    name = "removeAgenda",
    description = "Remove a agenda from DarkRP. NOTE: Must be called from BOTH server AND client to properly get it removed!",
    parameters = {
        {
            name = "name",
            description = "The name of the item.",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removeDemoteGroup = DarkRP.stub{
    name = "removeDemoteGroup",
    description = "Remove an demotegroup from DarkRP. NOTE: Must be called from BOTH server AND client to properly get it removed!",
    parameters = {
        {
            name = "name",
            description = "The name of the item.",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.createEntityGroup = DarkRP.stub{
    name = "createEntityGroup",
    description = "Create a entity group for DarkRP.",
    parameters = {
        {
            name = "name",
            description = "The name of the entity group.",
            type = "string",
            optional = false
        },
        {
            name = "teamNrs",
            description = "Vararg team numbers.",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}
AddDoorGroup = DarkRP.createEntityGroup

DarkRP.createShipment = DarkRP.stub{
    name = "createShipment",
    description = "Create a shipment for DarkRP.",
    parameters = {
        {
            name = "name",
            description = "The name of the shipment.",
            type = "string",
            optional = false
        },
        {
            name = "tbl",
            description = "Table containing the information for the shipment.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}
AddCustomShipment = DarkRP.createShipment

DarkRP.createVehicle = DarkRP.stub{
    name = "createVehicle",
    description = "Create a vehicle for DarkRP.",
    parameters = {
        {
            name = "name",
            description = "The name of the vehicle.",
            type = "string",
            optional = false
        },
        {
            name = "tbl",
            description = "Table containing the information for the vehicle.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}
AddCustomVehicle = DarkRP.createVehicle

DarkRP.createEntity = DarkRP.stub{
    name = "createEntity",
    description = "Create a entity for DarkRP.",
    parameters = {
        {
            name = "name",
            description = "The name of the entity.",
            type = "string",
            optional = false
        },
        {
            name = "tbl",
            description = "Table containing the information for the entity.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}
AddCustomVehicle = DarkRP.createEntity

DarkRP.createAgenda = DarkRP.stub{
    name = "createAgenda",
    description = "Create an agenda for groups of jobs to communicate.",
    parameters = {
        {
            name = "title",
            description = "The name of the agenda.",
            type = "string",
            optional = false
        },
        {
            name = "manager",
            description = "The team numer of the manager of the agenda (the one who can set the agenda).",
            type = "number",
            optional = false
        },
        {
            name = "listeners",
            description = "The jobs that can see this agenda.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}
AddAgenda = DarkRP.createAgenda

DarkRP.getAgendas = DarkRP.stub{
    name = "getAgendas",
    description = "Get all agendas. Note: teams that share an agenda use the exact same agenda table. E.g. when you change the agenda of the CP, the agenda of the Chief will automatically be updated as well. Make sure this property is maintained when modifying the agenda table. Not maintaining that property will lead to players not seeing the right agenda text.",
    parameters = {

    },
    returns = {
        {
            name = "agendas",
            description = "Table in which the keys are team numbers and the values agendas.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.createGroupChat = DarkRP.stub{
    name = "createGroupChat",
    description = "Create a group chat.",
    parameters = {
        {
            name = "functionOrJob",
            description = "A function that returns whether the person can see the group chat, or a team number.",
            type = "any",
            optional = false
        },
        {
            name = "teamNr",
            description = "VarArg team number.",
            type = "number",
            optional = true
        }
    },
    returns = {
    },
    metatable = DarkRP
}
GM.AddGroupChat = DarkRP.createGroupChat

DarkRP.createAmmoType = DarkRP.stub{
    name = "createAmmoType",
    description = "Create an ammo type.",
    parameters = {
        {
            name = "name",
            description = "The name of the ammo.",
            type = "string",
            optional = false
        },
        {
            name = "tbl",
            description = "Table containing the information for the ammo.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.createDemoteGroup = DarkRP.stub{
    name = "createDemoteGroup",
    description = "Create a demote group. When you get banned (demoted) from one of the jobs in this group, you will be banned from every job in this group.",
    parameters = {
        {
            name = "name",
            description = "The name of the demote group.",
            type = "string",
            optional = false
        },
        {
            name = "tbl",
            description = "Table consisting of a list of job.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getDemoteGroup = DarkRP.stub{
    name = "getDemoteGroup",
    description = "Get the demote group of a team. Every team in the same group will return the same object.",
    parameters = {
        {
            name = "teamNr",
            description = "Table consisting of a list of job.",
            type = "number",
            optional = false
        }
    },
    returns = {
        {
            name = "set",
            description = "The demote group identifier.",
            type = "Disjoint-Set"
        }
    },
    metatable = DarkRP
}

DarkRP.getGroupChats = DarkRP.stub{
    name = "getGroupChats",
    description = "Get all group chats.",
    parameters = {

    },
    returns = {
        {
            name = "set",
            description = "Table with functions that decide who can hear who.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.getDemoteGroups = DarkRP.stub{
    name = "getDemoteGroups",
    description = "Get all demote groups Every team in the same group will return the same object.",
    parameters = {

    },
    returns = {
        {
            name = "set",
            description = "Table in which the keys are team numbers and the values Disjoint-Set.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.createCategory = DarkRP.stub{
    name = "createCategory",
    description = "Create a category for the F4 menu.",
    parameters = {
        {
            name = "tbl",
            description = "Table describing the category.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.addToCategory = DarkRP.stub{
    name = "addToCategory",
    description = "Create a category for the F4 menu.",
    parameters = {
        {
            name = "item",
            description = "Table of the custom entity/job/etc.",
            type = "table",
            optional = false
        },
        {
            name = "kind",
            description = "The kind of the category (e.g. 'jobs' for job stuff).",
            type = "string",
            optional = false
        },
        {
            name = "cat",
            description = "The name of the category. Note that the category must exist. Defaults to 'Other'.",
            type = "string",
            optional = true
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removeFromCategory = DarkRP.stub{
    name = "removeFromCategory",
    description = "Create a category for the F4 menu.",
    parameters = {
        {
            name = "item",
            description = "Table of the custom entity/job/etc.",
            type = "table",
            optional = false
        },
        {
            name = "kind",
            description = "The kind of the category (e.g. 'jobs' for job stuff).",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getCategories = DarkRP.stub{
    name = "getCategories",
    description = "Get all categories for all F4 menu tabs.",
    parameters = {
    },
    returns = {
        {
            name = "tbl",
            description = "all categories.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.hookStub{
    name = "DarkRPVarChanged",
    description = "Called when a DarkRPVar was changed.",
    parameters = {
        {
            name = "ply",
            description = "The player for whom the DarkRPVar changed.",
            type = "Player"
        },
        {
            name = "varname",
            description = "The name of the variable that has changed.",
            type = "string"
        },
        {
            name = "oldValue",
            description = "The old value of the DarkRPVar.",
            type = "any"
        },
        {
            name = "newvalue",
            description = "The new value of the DarkRPVar.",
            type = "any"
        }
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "canBuyPistol",
    description = "Whether a player can buy a pistol.",
    parameters = {
        {
            name = "ply",
            description = "The player.",
            type = "Player"
        },
        {
            name = "shipmentTable",
            description = "The table, as defined in the shipments file.",
            type = "table"
        }
    },
    returns = {
        {
            name = "canBuy",
            description = "Whether it can be bought.",
            type = "boolean"
        },
        {
            name = "suppressMessage",
            description = "Suppress the notification message when it cannot be bought.",
            type = "boolean"
        },
        {
            name = "message",
            description = "A replacement for the message that shows if it cannot be bought.",
            type = "string"
        },
        {
            name = "price",
            description = "An optional override for the price.",
            type = "number"
        }
    }
}

DarkRP.hookStub{
    name = "canBuyShipment",
    description = "Whether a player can buy a shipment.",
    parameters = {
        {
            name = "ply",
            description = "The player.",
            type = "Player"
        },
        {
            name = "shipmentTable",
            description = "The table, as defined in the shipments file.",
            type = "table"
        }
    },
    returns = {
        {
            name = "canBuy",
            description = "Whether it can be bought.",
            type = "boolean"
        },
        {
            name = "suppressMessage",
            description = "Suppress the notification message when it cannot be bought.",
            type = "boolean"
        },
        {
            name = "message",
            description = "A replacement for the message that shows if it cannot be bought.",
            type = "string"
        },
        {
            name = "price",
            description = "An optional override for the price.",
            type = "number"
        }
    }
}

DarkRP.hookStub{
    name = "canBuyVehicle",
    description = "Whether a player can buy a vehicle.",
    parameters = {
        {
            name = "ply",
            description = "The player.",
            type = "Player"
        },
        {
            name = "vehicleTable",
            description = "The table, as defined in the vehicles file.",
            type = "table"
        }
    },
    returns = {
        {
            name = "canBuy",
            description = "Whether it can be bought.",
            type = "boolean"
        },
        {
            name = "suppressMessage",
            description = "Suppress the notification message when it cannot be bought.",
            type = "boolean"
        },
        {
            name = "message",
            description = "A replacement for the message that shows if it cannot be bought.",
            type = "string"
        },
        {
            name = "price",
            description = "An optional override for the price.",
            type = "number"
        }
    }
}

DarkRP.hookStub{
    name = "canBuyAmmo",
    description = "Whether a player can buy ammo.",
    parameters = {
        {
            name = "ply",
            description = "The player.",
            type = "Player"
        },
        {
            name = "ammoTable",
            description = "The table, as defined in the a ammo file.",
            type = "table"
        }
    },
    returns = {
        {
            name = "canBuy",
            description = "Whether it can be bought.",
            type = "boolean"
        },
        {
            name = "suppressMessage",
            description = "Suppress the notification message when it cannot be bought.",
            type = "boolean"
        },
        {
            name = "message",
            description = "A replacement for the message that shows if it cannot be bought.",
            type = "string"
        },
        {
            name = "price",
            description = "An optional override for the price.",
            type = "number"
        }
    }
}

DarkRP.hookStub{
    name = "canBuyCustomEntity",
    description = "Whether a player can a certain custom entity.",
    parameters = {
        {
            name = "ply",
            description = "The player.",
            type = "Player"
        },
        {
            name = "entTable",
            description = "The table, as defined by the user.",
            type = "table"
        }
    },
    returns = {
        {
            name = "canBuy",
            description = "Whether it can be bought.",
            type = "boolean"
        },
        {
            name = "suppressMessage",
            description = "Suppress the notification message when it cannot be bought.",
            type = "boolean"
        },
        {
            name = "message",
            description = "A replacement for the message that shows if it cannot be bought.",
            type = "string"
        },
        {
            name = "price",
            description = "An optional override for the price.",
            type = "number"
        }
    }
}

DarkRP.hookStub{
    name = "onJobRemoved",
    description = "Called when a job was removed.",
    parameters = {
        {
            name = "num",
            description = "The TEAM_ number of the job.",
            type = "number"
        },
        {
            name = "jobbtable",
            description = "The table containing all the job info.",
            type = "table"
        }
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "onShipmentRemoved",
    description = "Called when a shipment was removed.",
    parameters = {
        {
            name = "num",
            description = "The index of this item.",
            type = "number"
        },
        {
            name = "itemTable",
            description = "The table containing all the info about this item.",
            type = "table"
        }
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "onVehicleRemoved",
    description = "Called when a vehicle was removed.",
    parameters = {
        {
            name = "num",
            description = "The index of this item.",
            type = "number"
        },
        {
            name = "itemTable",
            description = "The table containing all the info about this item.",
            type = "table"
        }
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "onEntityRemoved",
    description = "Called when a buyable entity was removed.",
    parameters = {
        {
            name = "num",
            description = "The index of this item.",
            type = "number"
        },
        {
            name = "itemTable",
            description = "The table containing all the info about this item.",
            type = "table"
        }
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "onGroupChatRemoved",
    description = "Called when a groupchat was removed.",
    parameters = {
        {
            name = "num",
            description = "The index of this item.",
            type = "number"
        },
        {
            name = "itemTable",
            description = "The table containing all the info about this item.",
            type = "table"
        }
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "onAmmoTypeRemoved",
    description = "Called when a ammotype was removed.",
    parameters = {
        {
            name = "num",
            description = "The index of this item.",
            type = "number"
        },
        {
            name = "itemTable",
            description = "The table containing all the info about this item.",
            type = "table"
        }
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "onEntityGroupRemoved",
    description = "Called when an entity group was removed.",
    parameters = {
        {
            name = "name",
            description = "The name of this item.",
            type = "string"
        },
        {
            name = "itemTable",
            description = "The table containing all the info about this item.",
            type = "table"
        }
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "onAgendaRemoved",
    description = "Called when an agenda was removed.",
    parameters = {
        {
            name = "name",
            description = "The name of this item.",
            type = "string"
        },
        {
            name = "itemTable",
            description = "The table containing all the info about this item.",
            type = "table"
        }
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "onDemoteGroupRemoved",
    description = "Called when a job was demotegroup.",
    parameters = {
        {
            name = "name",
            description = "The name of this item.",
            type = "string"
        },
        {
            name = "itemTable",
            description = "The table containing all the info about this item.",
            type = "table"
        }
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "loadCustomDarkRPItems",
    description = "Runs right after the scripts from the DarkRPMod are run. You can add custom jobs, entities, shipments and whatever in this hook.",
    parameters = {
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "DarkRPStartedLoading",
    description = "Runs at the very start of loading DarkRP. Not even sandbox has loaded here yet.",
    parameters = {
    },
    returns = {
    }
}

DarkRP.hookStub{
    name = "DarkRPFinishedLoading",
    description = "Runs right after DarkRP itself has loaded. All DarkRPMod stuff (except for disabled_defaults) is loaded during this hook. NOTE! NO CUSTOM STUFF WILL BE AVAILABLE DURING THIS HOOK. USE `loadCustomDarkRPItems` INSTEAD IF YOU WANT THAT!",
    parameters = {
    },
    returns = {
    }
}

--PATH gamemodes/darkrp/gamemode/modules/base/cl_interface.lua:
DarkRP.PLAYER.isInRoom = DarkRP.stub{
    name = "isInRoom",
    description = "Whether the player is in the same room as the LocalPlayer.",
    parameters = {},
    returns = {
        {
            name = "inRoom",
            description = "Whether the player is in the same room.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.deLocalise = DarkRP.stub{
    name = "deLocalise",
    description = "Makes sure the string will not be localised when drawn or printed.",
    parameters = {
        {
            name = "text",
            description = "The text to delocalise.",
            type = "string",
            optional = false
        }
    },
    returns = {
        {
            name = "text",
            description = "The delocalised text.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.textWrap = DarkRP.stub{
    name = "textWrap",
    description = "Wrap a text around when reaching a certain width.",
    parameters = {
        {
            name = "text",
            description = "The text to wrap.",
            type = "string",
            optional = false
        },
        {
            name = "font",
            description = "The font of the text.",
            type = "string",
            optional = false
        },
        {
            name = "width",
            description = "The maximum width in pixels.",
            type = "number",
            optional = false
        }
    },
    returns = {
        {
            name = "text",
            description = "The wrapped string.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.setPreferredJobModel = DarkRP.stub{
    name = "setPreferredJobModel",
    description = "Set the model preferred by the player (if the job allows multiple models).",
    parameters = {
        {
            name = "teamNr",
            description = "The team number of the job.",
            type = "number",
            optional = false
        },
        {
            name = "model",
            description = "The preferred model for the job.",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getPreferredJobModel = DarkRP.stub{
    name = "getPreferredJobModel",
    description = "Get the model preferred by the player (if the job allows multiple models).",
    parameters = {
        {
            name = "teamNr",
            description = "The team number of the job.",
            type = "number",
            optional = false
        }
    },
    returns = {
        {
            name = "model",
            description = "The preferred model for the job.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.hookStub{
    name = "teamChanged",
    description = "When your team is changed.",
    deprecated = "Use the OnPlayerChangedTeam hook instead.",
    parameters = {
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

--PATH gamemodes/darkrp/gamemode/modules/animations/sh_interface.lua:
DarkRP.addPlayerGesture = DarkRP.stub{
    name = "addPlayerGesture",
    description = "Add a player gesture to the DarkRP animations menu (the one that opens with the keys weapon.). Note: This function must be called BOTH serverside AND clientside!",
    parameters = {
        {
            name = "anim",
            description = "The gesture enumeration.",
            type = "number",
            optional = false
        },
        {
            name = "text",
            description = "The textual description of the animation. This is what players see on the button in the menu.",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removePlayerGesture = DarkRP.stub{
    name = "removePlayerGesture",
    description = "Removes a player gesture from the DarkRP animations menu (the one that opens with the keys weapon.). Note: This function must be called BOTH serverside AND clientside!",
    parameters = {
        {
            name = "anim",
            description = "The gesture enumeration.",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

--PATH addons/111mod/lua/darkrp_config/disabled_defaults.lua:
--[[---------------------------------------------------------------------------
DarkRP disabled defaults
---------------------------------------------------------------------------

DarkRP comes with a bunch of default things:
	- a load of modules
	- default jobs
	- shipments and guns
	- entities (like the money printer)
	and many more

If you want to disable or replace the default things, you should disable them here

Note: if you want to have e.g. edit the official medic job, you MUST disable the default one in this file!
You can copy the medic from DarkRP and paste it in darkrp_config/jobs.lua
---------------------------------------------------------------------------]]


--[[---------------------------------------------------------------------------
The list of modules that are disabled. Set to true to disable, false to enable.
Modules that are not in this list are enabled by default.
In some cases some external addons may overwrite one of the modules below and will expect them to be enabled to work.
In these few cases it will be pretty obvious when you expect something to happen and nothing does.
---------------------------------------------------------------------------]]
DarkRP.disabledDefaults["modules"] = {
	["afk"]              = true,
	["chatsounds"]       = false,
	["events"]           = false,
	["fpp"]              = false,
	["f1menu"]           = true,
	["f4menu"]           = true,
	["hitmenu"]          = false,
	["hud"]              = true,
	["hungermod"]        = true,
	["playerscale"]      = false,
	["sleep"]            = true,
	["fadmin"]           = true,
}



--[[---------------------------------------------------------------------------
The disabled default jobs. true to disable, false to enable.

NOTE: If you disable a job and remake it, expect things that rely on the job to stop working
e.g. you disable the gundealer and you make a new job as TEAM_GUN. If you want the shipments/door groups/etc. to
work for your custom job, remake them to include your job as well.
---------------------------------------------------------------------------]]
DarkRP.disabledDefaults["jobs"] = {
	["chief"]     = true,
	["citizen"]   = true,
	["cook"]      = true, --Hungermod only
	["cp"]        = true,
	["gangster"]  = true,
	["gundealer"] = true,
	["hobo"]      = true,
	["mayor"]     = true,
	["medic"]     = true,
	["mobboss"]   = true,
}

--[[---------------------------------------------------------------------------
Shipments and pistols
---------------------------------------------------------------------------]]
DarkRP.disabledDefaults["shipments"] = {
	["AK47"]         = true,
	["Desert eagle"] = true,
	["Fiveseven"]    = true,
	["Glock"]        = true,
	["M4"]           = true,
	["Mac 10"]       = true,
	["MP5"]          = true,
	["P228"]         = true,
	["Pump shotgun"] = true,
	["Sniper rifle"] = true,
}

--[[---------------------------------------------------------------------------
Entities
---------------------------------------------------------------------------]]
DarkRP.disabledDefaults["entities"] = {
	["Drug lab"]      = true,
	["Gun lab"]       = true,
	["Money printer"] = true,
	["Microwave"]     = true, --Hungermod only
	["Tip Jar"]       = true,
}

--[[---------------------------------------------------------------------------
Vehicles
(at the moment there are no default vehicles)
You could use this to disable vehicles you added in the vehicles.lua located in the darkrp_customthings folder.
---------------------------------------------------------------------------]]
DarkRP.disabledDefaults["vehicles"] = {

}

--[[---------------------------------------------------------------------------
Food
Food is only enabled when hungermod is enabled (see disabled modules above).
---------------------------------------------------------------------------]]
DarkRP.disabledDefaults["food"] = {
	["Banana"]           = false,
	["Bunch of bananas"] = false,
	["Melon"]            = false,
	["Glass bottle"]     = false,
	["Pop can"]          = false,
	["Plastic bottle"]   = false,
	["Milk"]             = false,
	["Bottle 1"]         = false,
	["Bottle 2"]         = false,
	["Bottle 3"]         = false,
	["Orange"]           = false,
}

DarkRP.disabledDefaults["doorgroups"] = {
	["Cops and Mayor only"] = true,
	["Gundealer only"]      = true,
}


/*---------------------------------------------------------------------------
Ammo packets
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["ammo"] = {
	["Pistol ammo"]  = true,
	["Rifle ammo"]   = true,
	["Shotgun ammo"] = true,
}

/*---------------------------------------------------------------------------
Agendas
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["agendas"] = {
	["Gangster's agenda"] = false,
	["Police agenda"] = false,
}

/*---------------------------------------------------------------------------
Chat groups (chat with /g)
Chat groups do not have names, so their index is used instead.
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["groupchat"] = {
	[1] = false, -- Police group chat (mayor, cp, chief and/or your custom CP teams)
	[2] = false, -- Group chat between gangsters and the mobboss
}

/*---------------------------------------------------------------------------
Jobs that are hitmen
set to true to disable
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["hitmen"] = {
	["mobboss"] = true,
}

/*---------------------------------------------------------------------------
Demote groups
When anyone is demote from any job in this group, they will be temporarily banned
from every job in the group
---------------------------------------------------------------------------*/
DarkRP.disabledDefaults["demotegroups"] = {
	["Cops"]		 = false,
	["Gangsters"]	 = false,
}

--PATH gamemodes/darkrp/gamemode/modules/base/cl_jobmodels.lua:
-- Create a table for the preferred playermodels
sql.Query([[CREATE TABLE IF NOT EXISTS darkp_playermodels(
    jobcmd VARCHAR(45) NOT NULL PRIMARY KEY,
    model VARCHAR(140) NOT NULL
);]])

local preferredModels = {}


--[[---------------------------------------------------------------------------
Interface functions
---------------------------------------------------------------------------]]
function DarkRP.setPreferredJobModel(teamNr, model)
    local job = RPExtraTeams[teamNr]
    if not job then return end
    preferredModels[job.command] = model
    sql.Query(string.format([[REPLACE INTO darkp_playermodels VALUES(%s, %s);]], sql.SQLStr(job.command), sql.SQLStr(model)))

    net.Start("DarkRP_preferredjobmodel")
        net.WriteUInt(teamNr, 8)
        net.WriteString(model)
    net.SendToServer()
end

function DarkRP.getPreferredJobModel(teamNr)
    local job = RPExtraTeams[teamNr]
    if not job then return end
    return preferredModels[job.command]
end

--[[---------------------------------------------------------------------------
Load the preferred models
---------------------------------------------------------------------------]]
local function sendModels() -- run after the jobs have loaded
    net.Start("DarkRP_preferredjobmodels")
        for _, job in pairs(RPExtraTeams) do
            if not preferredModels[job.command] then net.WriteBit(false) continue end

            net.WriteBit(true)
            net.WriteString(preferredModels[job.command])
        end
    net.SendToServer()
end

do
    local models = sql.Query([[SELECT jobcmd, model FROM darkp_playermodels;]])
    for _, v in ipairs(models or {}) do
        preferredModels[v.jobcmd] = v.model
    end

    timer.Simple(0, sendModels)
end

--PATH gamemodes/darkrp/gamemode/config/jobrelated.lua:
-- People often copy jobs. When they do, the GM table does not exist anymore.
-- This line makes the job code work both inside and outside of gamemode files.
-- You should not copy this line into your code.
local GAMEMODE = GAMEMODE or GM
--[[--------------------------------------------------------
Default teams. Please do not edit this file. Please use the darkrpmod addon instead.
--------------------------------------------------------]]

--PATH gamemodes/darkrp/gamemode/config/ammotypes.lua:
DarkRP.createCategory{
    name = "Other",
    categorises = "ammo",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 255,
}

--PATH addons/111mod/lua/darkrp_modules/qmenu/sh_proplist.lua:
PropWhiteList = { 
	["Конструкции"] = {
	        "models/props_phx/construct/metal_plate1.mdl",
	        "models/props_phx/construct/metal_plate1x2.mdl",
	        "models/props_phx/construct/metal_plate1x2_tri.mdl",
			"models/props_phx/construct/metal_plate1_tri.mdl",
			"models/props_phx/construct/metal_plate2x2.mdl",
			"models/props_phx/construct/metal_plate2x2_tri.mdl",
			"models/props_phx/construct/metal_plate2x4.mdl",
			"models/props_phx/construct/metal_plate2x4_tri.mdl",
			"models/props_phx/construct/metal_plate4x4.mdl",
			"models/props_phx/construct/metal_plate4x4_tri.mdl",
			"models/props_phx/construct/metal_tube.mdl",
			"models/props_phx/construct/metal_tubex2.mdl",
			"models/props_phx/construct/metal_wire1x1.mdl",
			"models/props_phx/construct/metal_wire1x1x1.mdl",
			"models/props_phx/construct/metal_wire1x1x2.mdl",
			"models/props_phx/construct/metal_wire1x1x2b.mdl",
			"models/props_phx/construct/metal_wire1x2.mdl",
			"models/props_phx/construct/metal_wire1x2b.mdl",
			"models/props_phx/construct/metal_wire1x2x2b.mdl",
			"models/props_phx/construct/metal_wire2x2.mdl",
			"models/props_phx/construct/metal_wire2x2b.mdl",
			"models/props_phx/construct/metal_wire2x2x2b.mdl",
			"models/props_phx/construct/windows/window1x1.mdl",
			"models/props_phx/construct/windows/window1x2.mdl",
			"models/props_phx/construct/windows/window2x2.mdl",
			"models/props_phx/construct/windows/window2x4.mdl",
			"models/props_phx/construct/wood/wood_boardx1.mdl",
			"models/props_phx/construct/wood/wood_boardx2.mdl",
			"models/props_phx/construct/wood/wood_boardx4.mdl",
			"models/props_phx/construct/wood/wood_panel1x1.mdl",
			"models/props_phx/construct/wood/wood_panel1x2.mdl",
			"models/props_phx/construct/wood/wood_panel2x2.mdl",
			"models/props_phx/construct/wood/wood_panel2x4.mdl",
			"models/props_phx/construct/wood/wood_panel4x4.mdl",
			"models/props_phx/construct/wood/wood_wire1x1.mdl",
			"models/props_phx/construct/wood/wood_wire1x1x1.mdl",
			"models/props_phx/construct/wood/wood_wire1x1x2.mdl",
			"models/props_phx/construct/wood/wood_wire1x1x2b.mdl",
			"models/props_phx/construct/wood/wood_wire1x2.mdl",
			"models/props_phx/construct/wood/wood_wire1x2b.mdl",
			"models/props_phx/construct/wood/wood_wire1x2x2b.mdl",
			"models/props_phx/construct/wood/wood_wire2x2.mdl",
			"models/props_phx/construct/wood/wood_wire2x2.mdl",
			"models/props_phx/construct/wood/wood_wire2x2x2b.mdl",
			"models/props_phx/construct/plastic/plastic_angle_180.mdl",
			"models/props_phx/construct/plastic/plastic_angle_360.mdl",
			"models/props_phx/construct/plastic/plastic_angle_90.mdl",
			"models/props_phx/construct/plastic/plastic_panel1x1.mdl",
			"models/props_phx/construct/plastic/plastic_panel1x2.mdl",
			"models/props_phx/construct/plastic/plastic_panel1x3.mdl",
			"models/props_phx/construct/plastic/plastic_panel1x4.mdl",
			"models/props_phx/construct/plastic/plastic_panel1x8.mdl",
			"models/props_phx/construct/plastic/plastic_panel2x2.mdl",
			"models/props_phx/construct/plastic/plastic_panel2x3.mdl",
			"models/props_phx/construct/plastic/plastic_panel2x4.mdl",
			"models/props_phx/construct/plastic/plastic_panel2x8.mdl",
			"models/props_phx/construct/plastic/plastic_panel3x3.mdl",
			"models/props_phx/construct/plastic/plastic_panel4x4.mdl",
			"models/props_phx/construct/plastic/plastic_panel4x8.mdl",
			"models/props_phx/construct/plastic/plastic_panel8x8.mdl",
			"models/Mechanics/gears2/pinion_20t3.mdl",
			"models/Mechanics/gears2/pinion_40t3.mdl",
			"models/Mechanics/gears2/pinion_80t3.mdl",
			"models/hunter/tubes/circle2x2.mdl",
			"models/hunter/tubes/circle2x2c.mdl",
			"models/hunter/tubes/circle4x4.mdl",
			"models/hunter/tubes/circle4x4c.mdl",
			"models/props_phx/construct/metal_angle180.mdl",
			"models/props_phx/construct/metal_angle360.mdl",
			"models/props_phx/construct/metal_angle90.mdl",
			-- "models/props_phx/construct/metal_dome180.mdl",
			-- "models/props_phx/construct/metal_dome360.mdl",
			-- "models/props_phx/construct/metal_dome90.mdl",
			"models/props_phx/construct/metal_plate_curve.mdl",
			"models/props_phx/construct/metal_plate_curve180.mdl",
			"models/props_phx/construct/metal_plate_curve180x2.mdl",
			"models/props_phx/construct/metal_plate_curve2.mdl",
			"models/props_phx/construct/metal_plate_curve2x2.mdl",
			"models/props_phx/construct/windows/window_angle180.mdl",
			"models/props_phx/construct/windows/window_angle360.mdl",
			"models/props_phx/construct/windows/window_angle90.mdl",
			"models/props_phx/construct/windows/window_curve180x1.mdl",
			"models/props_phx/construct/windows/window_curve180x2.mdl",
			"models/props_phx/construct/windows/window_curve90x1.mdl",
			"models/props_phx/construct/windows/window_curve90x2.mdl",
			"models/props_phx/construct/windows/window_dome180.mdl",
			"models/props_phx/construct/windows/window_dome90.mdl",
			"models/hunter/triangles/025x025.mdl",
			"models/hunter/triangles/05x05.mdl",
			"models/hunter/triangles/075x075.mdl",
			"models/hunter/triangles/1x1.mdl",
			"models/hunter/triangles/2x2.mdl",
			"models/hunter/triangles/3x3.mdl",
			"models/hunter/triangles/4x4.mdl",
			"models/hunter/plates/tri2x1.mdl",
			"models/hunter/plates/tri3x1.mdl",
			"models/hunter/triangles/025x025mirrored.mdl",
			"models/hunter/triangles/05x05mirrored.mdl",
			"models/hunter/triangles/075x075mirrored.mdl",
			"models/hunter/triangles/1x1mirrored.mdl",
			"models/hunter/triangles/2x2mirrored.mdl",
			"models/hunter/triangles/3x3mirrored.mdl",
			"models/hunter/triangles/4x4mirrored.mdl",
			"models/hunter/triangles/05x05x05.mdl",
			"models/hunter/triangles/1x05x05.mdl",
			"models/hunter/triangles/1x05x1.mdl",
			"models/hunter/triangles/1x1x1.mdl",
			"models/hunter/triangles/1x1x2.mdl",
			"models/hunter/triangles/1x1x3.mdl",
			"models/hunter/triangles/1x1x4.mdl",
			"models/hunter/triangles/2x1x1.mdl",
			"models/hunter/triangles/2x2x2.mdl",
			"models/hunter/triangles/3x2x2.mdl",
			"models/hunter/triangles/1x1x1carved.mdl",
			"models/hunter/triangles/2x1x1carved.mdl",
			"models/hunter/triangles/2x2x1carved.mdl",
			"models/hunter/triangles/1x1x2carved.mdl",
			"models/hunter/triangles/1x1x1carved025.mdl",
			"models/hunter/triangles/1x1x2carved025.mdl",
			"models/hunter/triangles/1x1x4carved025.mdl",
			"models/XQM/panel45.mdl",
			"models/XQM/panel90.mdl",
			"models/XQM/panel180.mdl",
			"models/XQM/panel360.mdl",
			"models/PHXtended/bar1x.mdl",
			"models/PHXtended/bar2x.mdl",
			"models/PHXtended/tri1x1.mdl",
			"models/PHXtended/tri1x1solid.mdl",
			"models/PHXtended/tri1x1x1.mdl",
			"models/PHXtended/tri1x1x1solid.mdl",
			"models/PHXtended/tri1x1x2.mdl",
			"models/PHXtended/tri1x1x2solid.mdl",
			"models/PHXtended/trieq1x1x1.mdl",
			"models/PHXtended/trieq1x1x1solid.mdl",
			"models/PHXtended/trieq1x1x2.mdl",
			"models/PHXtended/trieq1x1x2solid.mdl",
			"models/hunter/misc/stair1x1.mdl",
			"models/hunter/misc/stair1x1inside.mdl",
			"models/hunter/misc/stair1x1outside.mdl",
			"models/hunter/plates/plate.mdl",
			"models/hunter/plates/plate025.mdl",
			"models/hunter/plates/plate025x025.mdl",
			"models/Mechanics/robotics/a1.mdl",
			"models/Mechanics/robotics/a2.mdl",
			"models/Mechanics/robotics/a3.mdl",
			"models/Mechanics/robotics/a4.mdl",
			"models/hunter/misc/sphere025x025.mdl",
		    "models/hunter/misc/sphere1x1.mdl",
			"models/hunter/misc/squarecap1x1x1.mdl",
			"models/hunter/misc/squarecap2x2x2.mdl",
			"models/hunter/tubes/tube1x1x1.mdl",
			"models/hunter/tubes/tube1x1x1c.mdl",
			"models/hunter/tubes/tube1x1x2.mdl",
			"models/hunter/tubes/tube1x1x2c.mdl",
			"models/hunter/tubes/tubebend1x1x90.mdl",
			"models/hunter/misc/shell2x2c.mdl",
	    },
	["Пластины, кубы"] = {
	        "models/hunter/plates/plate1x1.mdl",
	        "models/hunter/plates/plate1x2.mdl",
	        "models/hunter/plates/plate1x3.mdl",
			"models/hunter/plates/plate1x4.mdl",
	        "models/hunter/plates/plate1x5.mdl",
			"models/hunter/plates/plate1x6.mdl",
	        "models/hunter/plates/plate1x7.mdl",
			"models/hunter/plates/plate1x8.mdl",
	        "models/hunter/plates/plate2x2.mdl",
			"models/hunter/plates/plate2x3.mdl",
	        "models/hunter/plates/plate2x4.mdl",
			"models/hunter/plates/plate2x5.mdl",
	        "models/hunter/plates/plate2x6.mdl",
			"models/hunter/plates/plate2x7.mdl",
	        "models/hunter/plates/plate2x8.mdl",
			"models/hunter/plates/plate3x3.mdl",
	        "models/hunter/plates/plate3x4.mdl",
			"models/hunter/plates/plate3x5.mdl",
	        "models/hunter/plates/plate3x6.mdl",
			"models/hunter/plates/plate3x7.mdl",
	        "models/hunter/plates/plate3x8.mdl",
			"models/hunter/plates/plate4x4.mdl",
	        "models/hunter/plates/plate4x5.mdl",
			"models/hunter/plates/plate4x6.mdl",
	        "models/hunter/plates/plate4x7.mdl",
			"models/hunter/plates/plate4x8.mdl",
	        "models/hunter/plates/plate5x5.mdl",
			"models/hunter/plates/plate5x6.mdl",
	        "models/hunter/plates/plate5x7.mdl",
			"models/hunter/plates/plate5x8.mdl",
	        "models/hunter/plates/plate6x6.mdl",
			"models/hunter/plates/plate6x7.mdl",
	        "models/hunter/plates/plate6x8.mdl",
	        "models/hunter/plates/plate7x7.mdl",
			"models/hunter/plates/plate7x8.mdl",
	        "models/hunter/plates/plate8x8.mdl",
			"models/hunter/blocks/cube025x025x025.mdl",
	        "models/hunter/blocks/cube025x05x025.mdl",
			"models/hunter/blocks/cube025x075x025.mdl",
	        "models/hunter/blocks/cube025x1x025.mdl",
			"models/hunter/blocks/cube025x125x025.mdl",
	        "models/hunter/blocks/cube025x150x025.mdl",
			"models/hunter/blocks/cube025x2x025.mdl",
	        "models/hunter/blocks/cube025x3x025.mdl",
			"models/hunter/blocks/cube025x4x025.mdl",
	        "models/hunter/blocks/cube05x05x025.mdl",
			"models/hunter/blocks/cube05x075x025.mdl",
	        "models/hunter/blocks/cube05x1x025.mdl",
			"models/hunter/blocks/cube05x2x025.mdl",
	        "models/hunter/blocks/cube05x3x025.mdl",
			"models/hunter/blocks/cube05x4x025.mdl",
			"models/hunter/blocks/cube05x5x025.mdl",
			"models/hunter/blocks/cube05x6x025.mdl",
			"models/hunter/blocks/cube05x7x025.mdl",
	        "models/hunter/blocks/cube075x075x025.mdl",
			"models/hunter/blocks/cube075x1x025.mdl",
	        "models/hunter/blocks/cube075x2x025.mdl",
			"models/hunter/blocks/cube075x3x025.mdl",
	        "models/hunter/blocks/cube075x4x025.mdl",
			"models/hunter/blocks/cube1x1x025.mdl",
	        "models/hunter/blocks/cube1x2x025.mdl",
			"models/hunter/blocks/cube1x3x025.mdl",
	        "models/hunter/blocks/cube1x4x025.mdl",
			"models/hunter/blocks/cube1x5x025.mdl",
	        "models/hunter/blocks/cube1x6x025.mdl",
			"models/hunter/blocks/cube1x7x025.mdl",
	        "models/hunter/blocks/cube1x8x025.mdl",
			"models/hunter/blocks/cube2x2x025.mdl",
	        "models/hunter/blocks/cube2x3x025.mdl",
			"models/hunter/blocks/cube2x4x025.mdl",
	        "models/hunter/blocks/cube2x6x025.mdl",
			"models/hunter/blocks/cube2x8x025.mdl",
	        "models/hunter/blocks/cube3x3x025.mdl",
			"models/hunter/blocks/cube3x4x025.mdl",
	        "models/hunter/blocks/cube3x6x025.mdl",
			"models/hunter/blocks/cube3x8x025.mdl",
	        "models/hunter/blocks/cube4x4x025.mdl",
			"models/hunter/blocks/cube4x6x025.mdl",
	        "models/hunter/blocks/cube05x05x05.mdl",
			"models/hunter/blocks/cube05x1x05.mdl",
	        "models/hunter/blocks/cube05x105x05.mdl",
			"models/hunter/blocks/cube05x2x05.mdl",
	        "models/hunter/blocks/cube05x3x05.mdl",
			"models/hunter/blocks/cube05x4x05.mdl",
	        "models/hunter/blocks/cube1x1x05.mdl",
			"models/hunter/blocks/cube1x2x05.mdl",
	        "models/hunter/blocks/cube1x4x05.mdl",
			"models/hunter/blocks/cube1x6x05.mdl",
	        "models/hunter/blocks/cube2x2x05.mdl",
			"models/hunter/blocks/cube2x4x05.mdl",
	        "models/hunter/blocks/cube2x6x05.mdl",
			"models/hunter/blocks/cube3x3x05.mdl",
	        "models/hunter/blocks/cube4x4x05.mdl",
			"models/hunter/blocks/cube4x6x05.mdl",
	        "models/hunter/blocks/cube6x6x05.mdl",
			"models/hunter/plates/plate05.mdl",
			"models/hunter/plates/plate075.mdl",
			"models/hunter/plates/plate025x05.mdl",
			"models/hunter/plates/plate025x1.mdl",
			"models/hunter/plates/plate05x05.mdl",
			"models/hunter/plates/plate05x05_rounded.mdl",
			"models/hunter/plates/plate075x075.mdl",
			"models/hunter/blocks/cube075x075x075.mdl",
	    },
	
	["Декор"] = {
			"models/haxxer/normandy/medchair.mdl",
			"models/haxxer/normandy/kitchentable.mdl",
			"models/haxxer/normandy/meddesk.mdl",
			"models/haxxer/normandy/meddeskcor.mdl",
			"models/haxxer/normandy/lamp02.mdl",
			"models/haxxer/normandy/comfychair.mdl",
			"models/haxxer/normandy/comfybed.mdl",
			"models/haxxer/normandy/lamp01.mdl",
			"models/haxxer/normandy/coffetable.mdl",
			"models/splayn/rp/of/desk1.mdl",
			"models/splayn/rp/lr/lamp_tall.mdl",
			"models/splayn/rp/lr/couch.mdl",
			"models/splayn/rp/lr/entertainment_c1.mdl",
			"models/splayn/rp/lr/chair.mdl",
			"models/splayn/rp/lr/lamp_small.mdl",
			"models/splayn/rp/lr/endtable1.mdl",
			"models/splayn/rp/phone_old.mdl",
			"models/splayn/rp/ac/vase.mdl",
			"models/splayn/table_gewerbe.mdl",
			"models/splayn/chair_gewerbe.mdl",
			"models/props_c17/pottery07a.mdl",
			"models/props/de_tides/restaurant_table.mdl",
			"models/props/de_inferno/ClayPot03.mdl",
			"models/props/de_inferno/ClayPot03_Damage_01.mdl",
			"models/props/cs_office/Water_bottle.mdl",
			"models/props/cs_office/plant01.mdl",
			"models/props/de_nuke/NuclearControlBox.mdl",
			"models/props/de_tides/Vending_cart.mdl",
			"models/props/de_tides/patio_chair2.mdl",
			"models/props/de_tides/planter.mdl",
			"models/props/de_inferno/crate_fruit_break_p1.mdl",
			"models/props_interiors/furniture_cabinetdrawer01a.mdl",
			"models/props_interiors/furniture_cabinetdrawer02a.mdl",
			"models/props_junk/wheebarrow01a.mdl",
			"models/chairs/armchair.mdl",
			"models/maxofs2d/gm_painting.mdl",
			"models/maxofs2d/motion_sensor.mdl",
			"models/maxofs2d/companion_doll.mdl",
			"models/maxofs2d/thruster_propeller.mdl",
			"models/maxofs2d/thruster_projector.mdl",
			"models/maxofs2d/lamp_projector.mdl",
			"models/props/CS_militia/roof_vent.mdl",
			"models/props/CS_militia/refrigerator01.mdl",
			"models/props/CS_militia/mountedfish01.mdl",
			"models/lamps/torch.mdl",
			"models/props/cs_office/Shelves_metal1.mdl",
			"models/props/de_nuke/PowerPlantTank.mdl",
			"models/props/de_nuke/cinderblock_stack.mdl",
			"models/props/de_nuke/emergency_lighta.mdl",
			"models/props/de_nuke/HandTruck.mdl",
			"models/dynamite/dynamite.mdl",
			"models/dav0r/tnt/tnttimed.mdl",
			"models/dav0r/tnt/tnt.mdl",
			"models/xqm/hydcontrolbox.mdl",
			"models/props_phx/empty_barrel.mdl",
			"models/props_phx/misc/potato_launcher_cap.mdl",
			"models/props_phx/construct/concrete_pipe01.mdl",
			"models/xqm/modernchair.mdl",
			"models/props_phx/misc/t_light_head.mdl",
			"models/props_phx/misc/t_light_single_a.mdl",
			"models/props_phx/misc/t_light_x.mdl",
			"models/props_phx/misc/t_light_single_b.mdl",
			"models/props/cs_office/Snowman_arm.mdl",
	        "models/props/cs_office/Snowman_body.mdl",
	        "models/props/cs_office/Snowman_face.mdl",
	        "models/props/cs_office/Snowman_hat.mdl",
	        "models/props/cs_office/Snowman_head.mdl",
	        "models/props/cs_office/Snowman_nose.mdl",
	        "models/props_phx/rt_screen.mdl",
			"models/props_c17/FurnitureToilet001a.mdl",
			"models/props_c17/FurnitureSink001a.mdl",
			"models/props_c17/canister_propane01a.mdl",
			"models/props_c17/FurnitureWashingmachine001a.mdl",
			"models/props_c17/GasPipes006a.mdl",
			"models/props_canal/mattpipe.mdl",
			"models/props_borealis/door_wheel001a.mdl",
			"models/props_borealis/borealis_door001a.mdl",
			"models/props_borealis/bluebarrel001.mdl",
			"models/props_c17/canister01a.mdl",
			"models/props_c17/canister02a.mdl",
			"models/props_c17/bench01a.mdl",
			"models/props_c17/chair02a.mdl",
			-- "models/props_c17/door01_left.mdl",
			"models/props_c17/door02_double.mdl",
			"models/props_c17/concrete_barrier001a.mdl",
			"models/props_phx/construct/concrete_barrier00.mdl",
			"models/props_phx/construct/concrete_barrier01.mdl",
			"models/props_c17/fence01a.mdl",
			"models/props_c17/fence01b.mdl",
			"models/props_c17/fence03a.mdl",
			"models/props_c17/fence02b.mdl",
			"models/props_c17/fence02a.mdl",
			"models/props_c17/FurnitureBathtub001a.mdl",
			"models/props_c17/FurnitureBed001a.mdl",
			"models/props_c17/FurnitureBoiler001a.mdl",
			"models/props_c17/FurnitureChair001a.mdl",
			"models/props_c17/FurnitureCouch001a.mdl",
			"models/props_c17/FurnitureCouch002a.mdl",
			"models/props_c17/FurnitureCupboard001a.mdl",
			"models/props_c17/FurnitureDrawer001a.mdl",
			"models/props_c17/FurnitureDrawer002a.mdl",
			"models/props_c17/FurnitureDrawer003a.mdl",
			"models/props_c17/FurnitureDresser001a.mdl",
			"models/props_c17/FurnitureFireplace001a.mdl",
			"models/props_c17/FurnitureFridge001a.mdl",
			"models/props_c17/FurnitureRadiator001a.mdl",
			"models/props_wasteland/prison_heater001a.mdl",
			"models/props_c17/FurnitureShelf001a.mdl",
			"models/props_c17/FurnitureShelf001b.mdl",
			"models/props_c17/FurnitureShelf002a.mdl",
			"models/props_c17/furnitureStove001a.mdl",
			"models/props_c17/FurnitureTable001a.mdl",
			"models/props_c17/FurnitureTable002a.mdl",
			"models/props_c17/FurnitureTable003a.mdl",
			"models/props_c17/gate_door01a.mdl",
			"models/props_c17/gravestone001a.mdl",
			"models/props_c17/gravestone002a.mdl",
			"models/props_c17/gravestone003a.mdl",
			"models/props_junk/PlasticCrate01a.mdl",
			"models/props_c17/lampShade001a.mdl",
			"models/props_c17/Lockers001a.mdl",
			"models/props_c17/metalladder001.mdl",
			"models/props_c17/metalladder002.mdl",
			"models/props_c17/metalladder002b.mdl",
			"models/props_c17/oildrum001.mdl",
			"models/props_c17/pulleywheels_small01.mdl",
			"models/props_c17/pulleywheels_large01.mdl",
			"models/props_c17/shelfunit01a.mdl",
			"models/props_c17/signpole001.mdl",
			"models/props_combine/breenchair.mdl",
			"models/props_combine/breendesk.mdl",
			"models/props_combine/breenglobe.mdl",
			"models/props_debris/metal_panel01a.mdl",
			"models/props_debris/metal_panel02a.mdl",
			"models/props_docks/dock01_cleat01a.mdl",
			"models/props_doors/door03_slotted_left.mdl",
			"models/props_interiors/BathTub01a.mdl",
			"models/props_interiors/ElevatorShaft_Door01a.mdl",
			"models/props_interiors/Furniture_chair01a.mdl",
			"models/props_interiors/Furniture_chair03a.mdl",
			"models/props_interiors/Furniture_Couch01a.mdl",
			"models/props_interiors/Furniture_Couch02a.mdl",
			"models/props_interiors/Furniture_Desk01a.mdl",
			"models/props_interiors/Furniture_Lamp01a.mdl",
			"models/props_interiors/Furniture_shelf01a.mdl",
			"models/props_interiors/Furniture_Vanity01a.mdl",
			"models/props_interiors/pot01a.mdl",
			"models/props_interiors/pot02a.mdl",
			"models/props_interiors/Radiator01a.mdl",
			"models/props_interiors/refrigerator01a.mdl",
			"models/props_interiors/refrigeratorDoor01a.mdl",
			"models/props_interiors/refrigeratorDoor02a.mdl",
			"models/props_interiors/SinkKitchen01a.mdl",
			"models/props_interiors/VendingMachineSoda01a.mdl",
			"models/props_interiors/VendingMachineSoda01a_door.mdl",
			"models/props_junk/cardboard_box001a.mdl",
			"models/props_junk/cardboard_box002a.mdl",
			"models/props_junk/CinderBlock01a.mdl",
			"models/props_junk/harpoon002a.mdl",
			"models/props_junk/iBeam01a_cluster01.mdl",
			"models/props_junk/iBeam01a.mdl",
			"models/props_junk/meathook001a.mdl",
			"models/props_junk/metal_paintcan001a.mdl",
			"models/props_junk/MetalBucket01a.mdl",
			"models/props_junk/MetalBucket02a.mdl",
			"models/props_junk/metalgascan.mdl",
			"models/props_junk/PropaneCanister001a.mdl",
			"models/props_junk/PushCart01a.mdl",
			"models/props_junk/sawblade001a.mdl",
			"models/props_junk/TrashBin01a.mdl",
			"models/props_junk/TrafficCone001a.mdl",
			"models/props_junk/TrashDumpster02b.mdl",
			"models/props_junk/TrashDumpster01a.mdl",
			"models/props_junk/wood_crate001a.mdl",
			"models/props_junk/wood_crate002a.mdl",
			"models/props_junk/wood_pallet001a.mdl",
			"models/props_lab/blastdoor001a.mdl",
			"models/props_lab/blastdoor001b.mdl",
			"models/props_lab/blastdoor001c.mdl",
			"models/props_lab/filecabinet02.mdl",
			"models/props_lab/kennel_physics.mdl",
			"models/props_lab/lockerdoorleft.mdl",
			"models/props_trainstation/BenchOutdoor01a.mdl",
			"models/props_trainstation/bench_indoor001a.mdl",
			"models/props_trainstation/Ceiling_Arch001a.mdl",
			"models/props_trainstation/mount_connection001a.mdl",
			"models/props_trainstation/TrackSign02.mdl",
			"models/props_trainstation/TrackSign03.mdl",
			"models/props_trainstation/TrackSign07.mdl",
			"models/props_trainstation/TrackSign08.mdl",
			"models/props_trainstation/TrackSign09.mdl",
			"models/props_trainstation/TrackSign10.mdl",
			"models/props_trainstation/traincar_rack001.mdl",
			"models/props_trainstation/trainstation_clock001.mdl",
			"models/props_trainstation/trainstation_ornament002.mdl",
			"models/props_trainstation/trainstation_post001.mdl",
			"models/props_trainstation/trashcan_indoor001a.mdl",
			"models/props_vehicles/tire001a_tractor.mdl",
			"models/props_vehicles/tire001b_truck.mdl",
			"models/props_vehicles/tire001c_car.mdl",
			"models/props_vehicles/apc_tire001.mdl",
			"models/props_wasteland/barricade001a.mdl",
			"models/props_wasteland/barricade002a.mdl",
			"models/props_wasteland/cafeteria_bench001a.mdl",
			"models/props_wasteland/cafeteria_table001a.mdl",
			"models/props_wasteland/controlroom_desk001a.mdl",
			"models/props_wasteland/controlroom_filecabinet001a.mdl",
			"models/props_wasteland/controlroom_filecabinet002a.mdl",
			"models/props_wasteland/controlroom_storagecloset001a.mdl",
			"models/props_wasteland/gaspump001a.mdl",
			"models/props_wasteland/interior_fence001g.mdl",
			"models/props_wasteland/interior_fence002d.mdl",
			"models/props_wasteland/interior_fence002e.mdl",
			"models/props_wasteland/kitchen_counter001b.mdl",
			"models/props_wasteland/kitchen_counter001d.mdl",
			"models/props_wasteland/kitchen_shelf002a.mdl",
			"models/props_wasteland/kitchen_shelf001a.mdl",
			"models/props_wasteland/laundry_basket001.mdl",
			"models/props_wasteland/laundry_cart001.mdl",
			"models/props_wasteland/laundry_cart002.mdl",
			"models/props_wasteland/laundry_dryer002.mdl",
			"models/props_wasteland/laundry_washer001a.mdl",
			"models/props_wasteland/laundry_washer003.mdl",
			"models/props_wasteland/light_spotlight01_lamp.mdl",
			"models/props_wasteland/medbridge_post01.mdl",
			"models/props_wasteland/panel_leverHandle001a.mdl",
			"models/props_wasteland/prison_bedframe001b.mdl",
			"models/props_wasteland/prison_celldoor001b.mdl",
			"models/props_wasteland/prison_lamp001c.mdl",
			"models/props_wasteland/prison_shelf002a.mdl",
			"models/props_wasteland/wood_fence01a.mdl",
			"models/props_wasteland/wood_fence02a.mdl",
			"models/Gibs/HGIBS.mdl",
			"models/props_c17/BriefCase001a.mdl",
			"models/props_c17/bench01a.mdl",
			"models/props_c17/cashregister01a.mdl",
			"models/props_c17/chair_kleiner03a.mdl",
			"models/props_c17/chair_stool01a.mdl",
			"models/props_c17/chair_office01a.mdl",
			"models/props_c17/clock01.mdl",
			"models/props_c17/computer01_keyboard.mdl",
			"models/props_c17/doll01.mdl",
			"models/props_c17/Frame002a.mdl",
			"models/props_c17/metalPot001a.mdl",
			"models/props_c17/metalPot002a.mdl",
			"models/props_c17/playground_teetertoter_stan.mdl",
			"models/props_c17/playgroundTick-tack-toe_block01a.mdl",
			"models/props_c17/playgroundTick-tack-toe_post01.mdl",
			"models/props_c17/streetsign001c.mdl",
			"models/props_c17/streetsign002b.mdl",
			"models/props_c17/streetsign003b.mdl",
			"models/props_c17/streetsign004e.mdl",
			"models/props_c17/streetsign004f.mdl",
			"models/props_c17/streetsign005b.mdl",
			"models/props_c17/streetsign005c.mdl",
			"models/props_c17/streetsign005d.mdl",
			"models/props_c17/SuitCase001a.mdl",
			"models/props_c17/SuitCase_Passenger_Physics.mdl",
			"models/props_c17/tools_wrench01a.mdl",
			"models/props_c17/TrapPropeller_Engine.mdl",
			"models/props_c17/TrapPropeller_Lever.mdl",
			"models/props_c17/tv_monitor01.mdl",
			"models/props_combine/breenbust.mdl",
			"models/props_lab/reciever_cart.mdl",
			"models/props_lab/reciever01d.mdl",
			"models/props_lab/reciever01a.mdl",
			"models/props_lab/reciever01b.mdl",
			"models/props_lab/reciever01c.mdl",
			"models/props_lab/harddrive02.mdl",
			"models/props_lab/frame002a.mdl",
			"models/props_lab/clipboard.mdl",
			"models/props_lab/desklamp01.mdl",
			"models/props_lab/harddrive01.mdl",
			"models/props_lab/huladoll.mdl",
			"models/props_lab/monitor01a.mdl",
			"models/props_lab/monitor01b.mdl",
			"models/props_lab/monitor02.mdl",
			"models/props_lab/partsbin01.mdl",
			"models/props_lab/plotter.mdl",
			"models/props_trainstation/payphone001a.mdl",
			"models/props_vehicles/carparts_axel01a.mdl",
			"models/props_vehicles/carparts_muffler01a.mdl",
			"models/props_trainstation/traincar_seats001.mdl",
			"models/props_vehicles/carparts_wheel01a.mdl",
			"models/props_lab/cactus.mdl",
			"models/props/cs_assault/BarrelWarning.mdl",
			"models/props/cs_assault/camera.mdl",
			"models/props/cs_assault/ChainTrainStationSign.mdl",
			"models/props/cs_assault/ConsolePanelLoadingBay.mdl",
			"models/props/cs_assault/dryer_box.mdl",
			"models/props/cs_assault/duct.mdl",
			"models/props/cs_assault/FireHydrant.mdl",
			"models/props/cs_assault/Floodlight01.mdl",
			"models/props/cs_assault/light_shop2.mdl",
			"models/props/cs_assault/meter.mdl",
			"models/props/cs_assault/NoParking.mdl",
			"models/props/cs_assault/NoStopsSign.mdl",
			"models/props/cs_assault/pylon.mdl",
			"models/props/cs_assault/stoplight.mdl",
			"models/props/cs_assault/streetlight.mdl",
			"models/props/cs_assault/StreetSign02.mdl",
			"models/props/cs_assault/VentilationDuct01.mdl",
			"models/props/cs_assault/wirepipe.mdl",
			"models/props/cs_assault/wirespout.mdl",
			"models/props/CS_militia/bar01.mdl",
			"models/props/CS_militia/barstool01.mdl",
			"models/props/CS_militia/bathroomwallhole01_wood_broken.mdl",
			"models/props/CS_militia/boxes_frontroom.mdl",
			"models/props/CS_militia/boxes_garage_lower.mdl",
			"models/props/CS_militia/caseofbeer01.mdl",
			"models/props/CS_militia/circularsaw01.mdl",
			"models/props/CS_militia/couch.mdl",
			"models/props/CS_militia/crate_extrasmallmill.mdl",
			"models/props/CS_militia/crate_stackmill.mdl",
			"models/props/CS_militia/dryer.mdl",
			"models/props/CS_militia/FenceWoodLog01_Short.mdl",
			"models/props/CS_militia/FenceWoodLog03_Long.mdl",
			"models/props/CS_militia/fertilizer.mdl",
			"models/props/CS_militia/food_stack.mdl",
			"models/props/CS_militia/furnace01.mdl",
			"models/props/CS_militia/gun_cabinet.mdl",
			"models/props/CS_militia/haybale_target.mdl",
			"models/props/CS_militia/haybale_target_02.mdl",
			"models/props/CS_militia/haybale_target_03.mdl",
			"models/props/CS_militia/ladderwood.mdl",
			"models/props/CS_militia/lightfixture01.mdl",
			"models/props/CS_militia/light_shop2.mdl",
			"models/props/CS_militia/logpile2.mdl",
			"models/props/CS_militia/mailbox01.mdl",
			"models/props/CS_militia/microwave01.mdl",
			"models/props/CS_militia/militiawindow01.mdl",
			"models/props/CS_militia/militiawindow02_breakable.mdl",
			"models/props/CS_militia/militiawindow02_breakable_frame.mdl",
			"models/props/CS_militia/newspaperstack01.mdl",
			"models/props/CS_militia/oldphone01.mdl",
			"models/props/CS_militia/paintbucket01.mdl",
			"models/props/CS_militia/refrigerator01.mdl",
			"models/props/CS_militia/reloadingpress01.mdl",
			"models/props/CS_militia/reload_scale.mdl",
			"models/props/CS_militia/sawhorse.mdl",
			"models/props/CS_militia/sheetrock_leaning.mdl",
			"models/props/CS_militia/shelves.mdl",
			"models/props/CS_militia/shelves_wood.mdl",
			"models/props/CS_militia/spotlight.mdl",
			"models/props/CS_militia/stove01.mdl",
			"models/props/CS_militia/table_kitchen.mdl",
			"models/props/CS_militia/table_shed.mdl",
			"models/props/CS_militia/television_console01.mdl",
			"models/props/CS_militia/toilet.mdl",
			"models/props/CS_militia/urine_trough.mdl",
			"models/props/CS_militia/wndw01.mdl",
			"models/props/CS_militia/wood_bench.mdl",
			"models/props/CS_militia/wood_table.mdl",
			"models/props/cs_office/Bookshelf1.mdl",
			"models/props/cs_office/Bookshelf2.mdl",
			"models/props/cs_office/Bookshelf3.mdl",
			"models/props/cs_office/coffee_mug.mdl",
			"models/props/cs_office/coffee_mug2.mdl",
			"models/props/cs_office/coffee_mug3.mdl",
			"models/props/cs_office/computer.mdl",
			"models/props/cs_office/computer_caseB.mdl",
			"models/props/cs_office/computer_keyboard.mdl",
			"models/props/cs_office/computer_monitor.mdl",
			"models/props/cs_office/computer_mouse.mdl",
			"models/props/cs_office/Crates_indoor.mdl",
			"models/props/cs_office/Crates_outdoor.mdl",
			"models/props/cs_office/Exit_ceiling.mdl",
			"models/props/cs_office/file_box.mdl",
			"models/props/cs_office/file_cabinet1.mdl",
			"models/props/cs_office/file_cabinet1_group.mdl",
			"models/props/cs_office/file_cabinet2.mdl",
			"models/props/cs_office/file_cabinet3.mdl",
			"models/props/cs_office/Fire_Extinguisher.mdl",
			"models/props/cs_office/Light_security.mdl",
			"models/props/cs_office/offcertificatea.mdl",
			"models/props/cs_office/offcorkboarda.mdl",
			"models/props/cs_office/offinspa.mdl",
			"models/props/cs_office/offinspb.mdl",
			"models/props/cs_office/offinspc.mdl",
			"models/props/cs_office/offinspd.mdl",
			"models/props/cs_office/offpaintinga.mdl",
			"models/props/cs_office/offpaintingb.mdl",
			"models/props/cs_office/offpaintingd.mdl",
			"models/props/cs_office/offpaintinge.mdl",
			"models/props/cs_office/offpaintingf.mdl",
			"models/props/cs_office/sofa.mdl",
			"models/props/cs_office/sofa_chair.mdl",
			"models/props/cs_office/Table_coffee.mdl",
			"models/props/cs_office/Table_meeting.mdl",
			"models/props/cs_office/trash_can.mdl",
			"models/props/de_nuke/light_red1.mdl",
			"models/props/de_nuke/light_red2.mdl",
			"models/props/cs_italy/it_mkt_shelf1.mdl",
			"models/props/cs_militia/shelves.mdl",
			"models/props/de_tides/planter.mdl",
			"models/props_combine/combine_barricade_short02a.mdl",
			"models/props_junk/shovel01a.mdl",
			"models/props_phx/games/chess/black_dama.mdl",
			"models/props_phx/games/chess/white_dama.mdl",
			"models/props_phx/misc/fender.mdl",
			"models/mechanics/wheels/bmwl.mdl",
			"models/props_phx/normal_tire.mdl",
			"models/sal/cat.mdl",
			"models/sal/halloween/skull.mdl",
			"models/sal/hawk_1.mdl",
			"models/sal/wolf.mdl",
			"models/props/CS_militia/axe.mdl",
			"models/props/cs_italy/it_lantern2.mdl",
			"models/props/cs_italy/it_lantern1.mdl",
			"models/props/cs_italy/it_mkt_table1.mdl",
			"models/props/cs_italy/it_mkt_table2.mdl",
			"models/props/cs_italy/it_mkt_table3.mdl",
			"models/props/cs_office/Paper_towels.mdl",
			"models/props/de_inferno/ChairAntique.mdl",
			"models/props/de_inferno/hay_bails.mdl",
			"models/props/de_nuke/LifePreserver.mdl",
			"models/props/de_prodigy/Ammo_Can_02.mdl",
			"models/props_c17/awning001a.mdl",
			"models/props_c17/awning002a.mdl",
			"models/props_c17/pottery_large01a.mdl",
			"models/props_c17/pottery05a.mdl",
			"models/props_c17/pottery08a.mdl",
			"models/props_c17/pottery09a.mdl",
			"models/props_c17/light_floodlight02_off.mdl",
			"models/props_junk/bicycle01a.mdl",
			"models/props/de_train/Pallet_Barrels.mdl",
			"models/props/de_tides/patio_table.mdl",
			"models/props/de_tides/patio_table2.mdl",
			"models/props/de_inferno/potted_plant1.mdl",
			"models/props/de_inferno/potted_plant2.mdl",
			"models/props/de_inferno/potted_plant3.mdl",
			"models/props_wasteland/controlroom_monitor001b.mdl",
			"models/props_wasteland/controlroom_monitor001a.mdl",
			"models/props_wasteland/gear01.mdl",
			"models/props_wasteland/gear02.mdl",
			"models/props_wasteland/prison_padlock001a.mdl",
			"models/props_wasteland/prison_toilet01.mdl",
			"models/props_rooftop/satellitedish02.mdl",
			"models/props_pipes/valve001.mdl",
			"models/props_pipes/valve002.mdl",
			"models/props_pipes/valvewheel001.mdl",
			"models/props_lab/crematorcase.mdl",
			"models/props_lab/jar01a.mdl",
			"models/props_c17/furniturearmchair001a.mdl",
			"models/props/de_train/Processor.mdl",
			"models/props/de_train/ACunit2.mdl",
			"models/props/de_tides/Vending_tshirt.mdl",
			"models/props/de_tides/Vending_cart_base.mdl",
			"models/props/de_prodigy/tirestack3.mdl",
			"models/props/de_piranesi/pi_bucket.mdl",
			"models/props/de_dust/wagon.mdl",
			"models/props/de_chateau/light_chandelier02.mdl",
			"models/props/cs_italy/bananna.mdl",
			"models/props/de_inferno/LargeBush01.mdl",
			"models/props/de_inferno/LargeBush03.mdl",
			"models/props/de_inferno/LargeBush04.mdl",
			"models/props/de_inferno/LargeBush05.mdl",
			"models/props/de_inferno/flower_barrel.mdl",
	    },
   }

PropWhiteListed = {}

for _, cat in pairs(PropWhiteList) do
	for _, mdl in pairs(cat) do
		PropWhiteListed[mdl] = true -- на всякий случай
		PropWhiteListed[string.lower(mdl)] = true
	end
end
--PATH addons/111mod/lua/darkrp_modules/police_radio/sh_p_radio_config.lua:
Police_Radio_Config = {}

Police_Radio_Config["Allow_Teams"] = { --The script will normally use the jobs set by GAMEMODE.CivilProtection. If it doesnt work add the remaining team here
	["coop"] = true,
	["chief"] = true,
	["mayor"] = true,
	["fbi"] = true,
	["omon"] = true,
	["domon"] = true,
	["rspecnaz"] = true,
	["somon"] = true
}

--^^ These are CHAT COMMANDS!! Not teamnames

Police_Radio_Config["Require_Admin_Approval"] = false -- donnez une radio à un joueur ( true = autorisé / false = désactivée )
-- ^^ /giveradio <Name> /removeradio <Name>

Police_Radio_Config["CanHear_Default"] = false --The default state of whether or not people can hear one another over the radio

if CLIENT then

Police_Radio_Config["HUD_Text_On"] = "Передача включена! (Выкл %s)" 
Police_Radio_Config["HUD_Text_Off"] = "Передача выключена! (Вкл %s)" 
Police_Radio_Config["HUD_Text_On_Receive"] = "Прием включен! (Выкл %s)" 
Police_Radio_Config["HUD_Text_Off_Receive"] = "Прием выключен! (Вкл %s)" 

-- %s will be replaced with the key bound by the player that needs to be pressed
end

Police_Radio_Config["HUD_Enable"] = false --Set to true to enable the HUD icons
Police_Radio_Config["HUD_Use_Textures"] = false --If enabled. The HUD will use texture files (vtf) instead of a png file
Police_Radio_Config["HUD_Texture_On"] = "vgui/lordi/darkrp/police_radio_on" -- pas touchée
Police_Radio_Config["HUD_Texture_Off"] = "vgui/lordi/darkrp/police_radio_off" -- pas touchée

--When selecting a texture, MAKE SURE THE EXTENSION ISNT INCLUDED (.png/.vmt)
--The script does this by itself
--PATH addons/111mod/lua/darkrp_modules/othermodules/cl_lawsmenu.lua:
function weight(x)
    return x/1920*ScrW()
end

function height(y)
    return y/1080*ScrH()
end
surface.CreateFont('textLaws', {
    font = 'VK Sans Display Medium',
    weight = 200,
    size = height(18),
    extended = true,
})
surface.CreateFont('titleLaws', {
    font = 'VK Sans Display DemiBold',
    weight = 500,
    size = height(30),
    extended = true,
})
surface.CreateFont('controlsLaws', {
    font = 'VK Sans Display DemiBold',
    weight = 500,
    size = height(20),
    extended = true,
})


AddCSLuaFile()

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
local fr
local function lawsmenu()
	if IsValid(fr) then return end
	fr = vgui.Create( "DFrame" )
	fr:SetSize( weight(617), height(394) )
	fr:SetTitle( "" )
	fr:SetVisible( true )
	fr:SetAlpha(0)
	fr:AlphaTo(255,0.2,0)
	fr:ShowCloseButton( false )
	fr:MakePopup()
	fr:Center()
	function fr:Paint( w, h )
		draw.RoundedBox( 10, 0, 0, w, h, Color(45,45,45,254) )
		draw.SimpleText('ЗАКОНЫ ГОРОДА', 'titleLaws', weight(21),height(20), Color(255,255,255))
	end

	local frpan = vgui.Create( "DPanel",fr )
	frpan:SetSize(weight(574),height(309))
	frpan:SetPos(weight(21),height(68))
	function frpan:Paint( w, h )
		draw.RoundedBox( 10, 0, 0, w, h, Color(38,38,38,250) )
	end

	local lawscrol
	local function refreshLaws()
		if IsValid(lawscrol) then lawscrol:Remove() end
		lawscrol = vgui.Create( "DScrollPanel", fr )
		lawscrol:SetSize(weight(586),height(309-10))
		lawscrol:SetPos(weight(21),height(68+5))
		lawscrol:GetVBar():SetWide(weight(3))
		local bar = lawscrol.VBar
		bar:SetHideButtons(true)
		bar.Paint = nil
		bar.btnGrip.Paint = function(this, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(1,116,222))
		end
		lawscrol.Paint = function(self,w,h)
		end
		
		for k,v in ipairs(DarkRP.getLaws()) do
			local label = vgui.Create("DLabel",lawscrol)
			label:SetFont("textLaws")
			label:SetText(k .."."..v)
			label:SetTextColor(Color(255,255,255))
			label:Dock( TOP )
			label:DockMargin( weight(10), height(5), weight(19), 0 )
			label:SizeToContents()
			label.Paint = function(self,w,h)
				draw.RoundedBox(5, 0, 0, w, h, Color(46,46,46))
			end
		end
	end
	refreshLaws()
	local function mayorVisible()
		if LocalPlayer():Team() == TEAM_MAYOR then
			if IsValid(lasw_buttuns) then lasw_buttuns:Remove() end
			lasw_buttuns = vgui.Create('DPanel')
			lasw_buttuns:SetPos(weight(1280),height(343))
			lasw_buttuns:SetSize(weight(275),height(129))
			lasw_buttuns:SetVisible(false)
			lasw_buttuns.Paint = function(self,w,h)
				draw.RoundedBox( 10, 0, 0, w, h, Color(45,45,45,254) )
			end

			local lasw_buttun = vgui.Create('DButton',fr)
			lasw_buttun:SetPos(weight(386),height(9))
			lasw_buttun:SetSize(weight(150),height(55))
			lasw_buttun:SetText('')
			lasw_buttun.alpha = 0
			lasw_buttun.DoClick = function()
				lasw_buttuns:SetVisible(true)
			end
			function lasw_buttun:Paint( w, h )
				if self:IsHovered() then
					self.alpha = Lerp(FrameTime()*10,self.alpha,0.7)
				else
					self.alpha = Lerp(FrameTime()*7,self.alpha,1)
				end
				draw.RoundedBox( 8, 0, 0, w, h, Color(1,116,222,255*self.alpha) )
				draw.SimpleText('Управление','controlsLaws',w/2,h/2,Color(255,255,255),1,1)
			end

			local add_laws_button = vgui.Create( "DButton",lasw_buttuns)
			add_laws_button:SetPos( weight(19),height(8) )
			add_laws_button:SetText( "Добавить закон" )
			add_laws_button:SetFont("textLaws")
			add_laws_button.alpha = 0
			add_laws_button:SetTextColor( Color( 255, 255, 255, 255 ) )
			add_laws_button:SetSize( weight(237), height(35) )
			add_laws_button.DoClick = function()
				ui.StringRequest("Создание нового закона","Введите закон (БЕЗ НУМЕРАЦИИ)","",function( text ) 
					RunConsoleCommand("darkrp", "addlaw", text) 
					timer.Simple(.3,function()
						refreshLaws()
					end)
					mayorVisible()
				end)
			end
			function add_laws_button:Paint( w, h )
				if self:IsHovered() then
					self.alpha = Lerp(FrameTime()*10,self.alpha,0.6)
				else
					self.alpha = Lerp(FrameTime()*7,self.alpha,1)
				end
				draw.RoundedBox( 8, 0, 0, w, h, Color( 38,38,38,250*self.alpha ) )
			end

			local remove_laws_button = vgui.Create( "DButton",lasw_buttuns )
			remove_laws_button:SetPos( weight(19), height(47) )
			remove_laws_button:SetText( "Удалить закон" )
			remove_laws_button:SetFont("textLaws")
			remove_laws_button:SetTextColor( Color( 255, 255, 255, 255 ) )
			remove_laws_button:SetSize( weight(237), height(35) )
			remove_laws_button.alpha = 0
			remove_laws_button.DoClick = function()
				ui.StringRequest("Удаление закона","Введите НОМЕР закона","",function( text ) 
					RunConsoleCommand("darkrp", "removelaw", text) 
					timer.Simple(.3,function()
						refreshLaws()
					end)
					mayorVisible()
				end)
			end
			function remove_laws_button:Paint( w, h )
				if self:IsHovered() then
					self.alpha = Lerp(FrameTime()*10,self.alpha,0.6)
				else
					self.alpha = Lerp(FrameTime()*7,self.alpha,1)
				end
				draw.RoundedBox( 8, 0, 0, w, h, Color( 38,38,38,250*self.alpha ) )
			end

			local null_laws = vgui.Create( "DButton",lasw_buttuns )
			null_laws:SetPos( weight(19), height(86) )
			null_laws:SetText( "Обнулить законы" )
			null_laws:SetFont("textLaws")
			null_laws:SetTextColor( Color( 255, 255, 255, 255 ) )
			null_laws:SetSize( weight(237), height(35) )
			null_laws.alpha = 0
			null_laws.DoClick = function()
				RunConsoleCommand("darkrp", "resetlaws")
				timer.Simple(.3,function()
					refreshLaws()
				end)
				mayorVisible()
			end
			function null_laws:Paint( w, h )
				if self:IsHovered() then
					self.alpha = Lerp(FrameTime()*10,self.alpha,0.6)
				else
					self.alpha = Lerp(FrameTime()*7,self.alpha,1)
				end
				draw.RoundedBox( 8, 0, 0, w, h, Color( 38,38,38,250*self.alpha ) )
			end
		end
	end
	mayorVisible()

	local closedat = vgui.Create( "DButton", fr ) -- Close button
	closedat:SetPos(weight(540), height(9) ) 
	closedat:SetSize( weight(55), height(55) )
	closedat:SetText('')
	closedat.alpha = 0
	closedat.DoClick = function()
		fr:AlphaTo(0,0.2,0,function()
			fr:Remove()
		end)
		if IsValid(lasw_buttuns) then
			lasw_buttuns:Remove()
		end
	end
	function closedat:Paint( w, h ) 
		local color = Color(255,255,255)
		if self:IsHovered() then
			self.alpha = Lerp(FrameTime()*10,self.alpha,0.7)
			color = Color(1,116,222)
		else
			self.alpha = Lerp(FrameTime()*7,self.alpha,1)
		end
		draw.RoundedBox(10,0,0,w,h,Color(38,38,38,255*self.alpha))
		draw.SimpleText('✕','textLaws',w/2,h/2,color,1,1)
	end
end
concommand.Add( "lawsmenu", lawsmenu)
--PATH addons/111mod/lua/darkrp_modules/helecopter/sh_heli.lua:
HeliConfig= {
	MaxHealth = 10000,
}
--PATH addons/111mod/lua/darkrp_modules/gmb_samopis/cl_gmbplus.lua:
local PLAYER = FindMetaTable("Player")

function PLAYER:HasGambitPlus()
    return self:GetNW2Int("gmb", 0) > os.time()
end
local lastCheckedEntities = {}
local cacheUpdateInterval = 1  -- Интервал обновления кэша в секундах
local TimeGambitPlus 
local HasGambitPlus = false
local tbl = {["weapon_shotgun"] = true, ["weapon_crossbow"] = true}
hook.Add("PostDrawTranslucentRenderables", "gambitplus", function()
    if not HasGambitPlus then return end
    local wep = LocalPlayer():GetActiveWeapon()
    if not wep or not wep:IsValid() or (not wep.SWBWeapon and not tbl[wep:GetClass()]) then return end
    if DarkRP.thirdPersonEnabled then return end
    local pos = LocalPlayer():GetEyeTraceNoCursor().HitPos
    pos = pos - Vector(0, 0, 3)
    local max = LocalPlayer():WorldToLocal(LocalPlayer():GetShootPos())
    max = max - Vector(0, 25, 25)
    max = LocalPlayer():LocalToWorld(max)
    render.DrawLine(max, pos, Color(255, 0, 0))
end)

local lastCheckedEntities = {}
local cacheUpdateInterval = 1  -- Интервал обновления кэша в секундах
local TimeGambitPlus 
-- Обновляем список объектов раз в секунду
timer.Create("UpdateCachedEntities", cacheUpdateInterval, 0, function()
    local player = LocalPlayer()
	if IsValid(player) then
		lastCheckedEntities = ents.FindInSphere(player:GetPos(), 400)
		HasGambitPlus = player:HasGambitPlus()
		TimeGambitPlus = os.date("%H:%M:%S - %d/%m/%Y", player:GetNW2Int("gmb", 0))
	end
end)

-- local draw_SimpleTextOutlined = draw.SimpleTextOutlined
local draw_RoundedBoxEx = draw.RoundedBoxEx
local draw_SimpleText = draw.SimpleText
hook.Add("HUDPaint", "gambitplus", function()
    -- Проверка наличия GambitPlus
    if not HasGambitPlus then return end
	local player = LocalPlayer()
    -- Рисуем фон
    draw_RoundedBoxEx(16, 0, 0, 202, 47, Color(55, 55, 55, 100), false, false, false, true)

    local i = 2
    draw_SimpleText("Gambit PLUS", "ui.28", 30, i, Color(255, 255, 255, 100), 0, TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 100))
    i = i + 17
    draw_SimpleText("До: " .. TimeGambitPlus, "ui.19", 6, i + 7, Color(255, 255, 255, 100), 0, TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 100))

    -- Обработка объектов в радиусе 400 единиц
    local fds = 0
    for _, v in ipairs(lastCheckedEntities) do
        if IsValid(v) and v:GetClass() == "prop_physics" and v:GetNWBool("fadingfix") == "true" then
            fds = fds + 1
            local pos = v:GetPos():ToScreen()
            draw_SimpleText("FD", "ui.25", pos.x, pos.y, Color(0, 255, 0), 0, TEXT_ALIGN_TOP, 1, Color(0, 0, 0))
        end
    end

    -- Отображение информации о FD в радиусе
    if fds > 0 then
        i = i + 25
        draw_SimpleText("FD Рядом: " .. fds, "ui.19", 6, i, Color(0, 255, 0), 0, TEXT_ALIGN_TOP, 1, Color(0, 0, 0))
    end

    -- Дополнительный код для отображения информации о сущности на экране
    local ent = player:GetEyeTraceNoCursor().Entity
    if ent:IsPlayer() then
        i = i + 25
       draw_SimpleText("Вы смотрите на: " .. ent:Nick(), "ui.19", 6, i, Color(255, 255, 255), 0, TEXT_ALIGN_TOP, 1, Color(0, 0, 0))
    end

    -- Дополнительный код для отображения информации о игроке
    if not player:GetActiveWeapon().SWBWeapon then return end
    if not IsValid(ent) or not ent:IsPlayer() then return end
    if player:GetPos():Distance(ent:GetPos()) < 335 then return end
    local pos = (ent:EyePos() + Vector(0, 0, 25)):ToScreen()
    local color = team.GetColor(ent:Team())
    draw_SimpleText(ent:Nick(), "ui.20", pos.x, pos.y, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0))
    draw_SimpleText(ent:getJobTable().name, "ui.20", pos.x, pos.y + 15, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0))
    draw_SimpleText("ХП: " .. ent:Health(), "ui.20", pos.x, pos.y + 30, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0))
    draw_SimpleText("БР: " .. ent:Armor(), "ui.20", pos.x, pos.y + 45, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0))
end)
--PATH addons/111mod/lua/darkrp_modules/gmb_fpsfix/cl_fpsfix.lua:
net.Receive( "ClearLagsDed", function( len)
	RunConsoleCommand("dd")
	RunConsoleCommand( "r_shadows", 1 )
	RunConsoleCommand( "r_shadowrendertotexture", 0 ) 
	RunConsoleCommand( "r_shadowmaxrendered", 11 ) 
	RunConsoleCommand( "mat_shadowstate", 1 ) 
	RunConsoleCommand( "cl_interp", 0.116700 )
	RunConsoleCommand( "rate", 2097152)
	RunConsoleCommand( "cl_interp_ratio", 2 )
	RunConsoleCommand( "cl_pickupplayers", 0 )
	RunConsoleCommand( "cl_updaterate", 16 )
	RunConsoleCommand( "cl_cmdrate", 16 )
	RunConsoleCommand( "cl_phys_props_enable" , 0 )
	RunConsoleCommand( "cl_phys_props_max" , 0 )
	RunConsoleCommand( "props_break_max_pieces" , 0 )
	RunConsoleCommand( "r_propsmaxdist" , 1 )
	RunConsoleCommand( "violence_agibs" , 0 )
	RunConsoleCommand( "violence_hgibs" , 0 )
	RunConsoleCommand("r_threaded_client_shadow_manager", 1)
	RunConsoleCommand("mat_queue_mode","2")
	RunConsoleCommand("cl_threaded_bone_setup", 1)
	RunConsoleCommand("cl_threaded_client_leaf_system" , 1)
	RunConsoleCommand("r_threaded_particles", 1)
	RunConsoleCommand("r_drawmodeldecals", 0)
	RunConsoleCommand("r_threaded_renderables", 1)
	RunConsoleCommand("r_queued_ropes", 1)
	RunConsoleCommand("studio_queue_mode", 1)
	RunConsoleCommand("gmod_mcore_test", 1)
	RunConsoleCommand("rope_smooth","0")
	RunConsoleCommand("Rope_wind_dist","0")
	RunConsoleCommand("Rope_shake","0")
	RunConsoleCommand("violence_ablood","1")
	RunConsoleCommand("r_fastzreject","-1")
	RunConsoleCommand("Cl_ejectbrass","0")
	RunConsoleCommand("Muzzleflash_light","0")
	RunConsoleCommand("cl_wpn_sway_interp","0")
	RunConsoleCommand("in_usekeyboardsampletime","0")
	--[[ Own IO Optimization ]]
	RunConsoleCommand("r_3dsky","0")
	RunConsoleCommand("mat_fastnobump","1")
	RunConsoleCommand("mat_fastspecular","1")
	if GetConVar("mat_specular"):GetFloat() == 1 then
		RunConsoleCommand("mat_specular", 0)
	end
	-- RunConsoleCommand("gmod_unload_test",1)
end)

local sHook, sHookName = "RenderScene", "!FlushLod.RenderScene"
local sSayText, nRanTimes = "You ran r_flushlod %s times without a game crashing!\n", 0

local function RunCvarHere()
	RunConsoleCommand( "r_flushlod" )
	nRanTimes = nRanTimes + 1
	-- Msg( string.format( sSayText, nRanTimes ) )
	hook.Remove( sHook, sHookName )
	return true
end

local function flushlod()
	hook.Add( sHook, sHookName, RunCvarHere )
end

local sHelpText = "Flushes models out of cache ( stable version of r_flushlod )"

concommand.Add( "r_flushlod_fixed", flushlod, nil, sHelpText, FCVAR_DONTRECORD )

hook.Add("InitPostEntity", "CheckPlayersForTPose", function()
	timer.Simple( 5, function()
		RunConsoleCommand("r_flushlod_fixed")
	end )
end)
--PATH addons/111mod/lua/darkrp_modules/cmenu/cl_init.lua:
local C_CONFIG_POSITION = "left" -- left, right, top or bottom

local function o(x)
    return x / 1920 * ScrW()
end

local path = "gambitrp/gui/context/"
local mat_arrow = Material(path .. 'arrow.png')

local Menu = {}

local function Option(title, icon, cmd, check)
    table.insert(Menu, {
        title = title,
        icon = icon,
        cmd = cmd,
        check = check
    })
end

local function SubMenu(title, icon, func, check)
    table.insert(Menu, {
        title = title,
        icon = icon,
        func = func,
        check = check
    })
end

local function Spacer(check)
    table.insert(Menu, {
        check = check
    })
end

local function Request(title, text, func)
    return function()
        ui.StringRequest(title, text, nil, function(s)
            func(s)
        end)
    end
end

local function isCP()
    return LocalPlayer():isCP()
end


SubMenu("Денежные операции", "icon16/money.png", function(self)
    self:AddOption("Бросить деньги", Request("", "Сколько хотите бросить денег?", function(s)
        RunConsoleCommand("darkrp", "dropmoney", s)
    end)):SetImage(path .. 'drop_money.png')

    self:AddOption("Дать денег тому, на кого смотрите", Request("", "Сколько хотите дать денег", function(s)
        RunConsoleCommand("darkrp", "give", s)
    end)):SetImage(path .. 'give_money.png')
end)

SubMenu("Телефон", "icon16/calculator.png", function(self)

    self:AddOption("Включить телефон", function(s)
        RunConsoleCommand("say","/toggleon_phone")
    end):SetIcon("icon16/accept.png")
    
    self:AddOption("Выключить телефон", function(s)
        RunConsoleCommand("say","/toggleoff_phone")
    end):SetIcon("icon16/cancel.png")

    self:AddOption("Вызвать полицию", Request("", "Опишите ситуацию и [МЕСТОНАХОЖДЕНИЕ]", function(s)
    RunConsoleCommand("say", "/cr " .. s)
    end)):SetImage("icon16/user_go.png")
end)

SubMenu( "Позвонить", "icon16/computer.png", function(self)

    local j = table.Copy( player.GetAll() )

    table.RemoveByValue( j, LocalPlayer() )

    for k,v in pairs( j ) do

        self:AddOption2( v:Nick(), function()

            if IsValid( v ) then
                LocalPlayer():ConCommand( "darkrp call "..v:UserID() )
            end

        end):SetColor( team.GetColor( v:Team() ) )

    end
end)

Option("Купить патроны на текущее оружие",  path .. 'buy_bullets.png', function()
    RunConsoleCommand("darkrp", "buyammo", hook.Call("translateAmmoType", nil, LocalPlayer():GetActiveWeapon().Primary.Ammo) or LocalPlayer():GetActiveWeapon().Primary.Ammo)
end,
function()
    return IsValid(LocalPlayer():GetActiveWeapon()) and istable(LocalPlayer():GetActiveWeapon().Primary) and LocalPlayer():GetActiveWeapon().Primary.Ammo and fn.Head(fn.Filter(function(x) return x.ammoType == ( hook.Call("translateAmmoType", nil, LocalPlayer():GetActiveWeapon().Primary.Ammo) or LocalPlayer():GetActiveWeapon().Primary.Ammo ) end, GAMEMODE.AmmoTypes))
end)

-- Option("Купить патроны на текущее оружие",  path .. 'buy_bullets.png', function()
    -- RunConsoleCommand("darkrp", "buyammo", LocalPlayer():GetActiveWeapon().Primary.Ammo)
-- end,
-- function()
    -- return IsValid(LocalPlayer():GetActiveWeapon()) and istable(LocalPlayer():GetActiveWeapon().Primary) and LocalPlayer():GetActiveWeapon().Primary.Ammo and fn.Head(fn.Filter(function(x) return x.ammoType == LocalPlayer():GetActiveWeapon().Primary.Ammo end, GAMEMODE.AmmoTypes))
-- end)

SubMenu("Написать", "icon16/page_white.png", function(self)
    self:AddOption("Написать объявление", Request("", "Что рекламируем?", function(s)
        RunConsoleCommand("say", "/advert " .. s)
    end)):SetImage("icon16/email.png")

    self:AddOption("В DarkWEB канал (500$)", Request("", "Что будем объявлять криминальной половине?", function(s)
        RunConsoleCommand("say", "/darkweb " .. s)
    end)):SetImage("icon16/application_xp_terminal.png")
    
end)

SubMenu("Основное", path .. 'mayor_menu.png', function(self)
    self:AddOption("Изменить ник", Request("", "Укажите какой никнейм Вы хотите", function(s)
        RunConsoleCommand("say", "/rpname " .. s)
    end)):SetImage("icon16/tag_red.png")
    
    self:AddOption("Бонусы", function(s)
        RunConsoleCommand("rewards")
    end):SetIcon("icon16/controller.png")

    self:AddOption("Донат", function(s)
        RunConsoleCommand("say","!donate")
    end):SetIcon("icon16/star.png")

    self:AddOption("3 лицо", function(s)
        RunConsoleCommand("ctp")
    end):SetIcon("icon16/bug.png")

    self:AddOption("Меню организаций", function(s)
        RunConsoleCommand("say","!orgmenu")
    end):SetIcon("icon16/user_delete.png")

    self:AddOption("Законы", function(s)
        RunConsoleCommand("lawsmenu")
    end):SetIcon("icon16/comment.png")

    self:AddOption("Дать доступ к пропам", function(s)
        RunConsoleCommand("cppi_friends")
    end):SetIcon(path .. 'prop.png')
    
    self:AddOption("Застрял в текстурах", function(s)
        RunConsoleCommand("say","!unstuck")
    end):SetIcon("icon16/eye.png")
    
    self:AddOption("Продать все двери", function(s)
        RunConsoleCommand("say","/unownalldoors")
    end):SetIcon(path .. 'sell_doors.png')
	
    self:AddOption("BattlePass", function(s)
        RunConsoleCommand("say","!pass")
    end):SetIcon(path .. 'lottery.png')
    
    self:AddOption("Магазин построек", function(s)
        RunConsoleCommand("say","/market")
    end):SetIcon(path .. 'graffiti.png')	
end)

Option("Вызвать админа", path .. 'gasmask.png', Request("", "Опишите вашу проблем", function(s)
    RunConsoleCommand("say", "@ " .. s)
end))

Option("Бросить кубик", path .. 'dice.png', Request("", "Введите число", function(s)
    RunConsoleCommand("darkrp", "roll", s)
end))

--[[*
 * Начало общих кнопок
 ]]
Spacer()

Option("Выбросить оружие", path .. 'drop_gun.png', function()
    RunConsoleCommand("darkrp", "drop")
end)
SubMenu("Понизить игрока",  path .. 'demote.png', function(self)
    for k, v in player.Iterator() do
        if v == LocalPlayer() then continue end

        self:AddOption2(v:Name(), Request("Понизить игрока", "За что вы хотите его понизить?", function(s)
            RunConsoleCommand("darkrp", "demote", v:UserID(), s)
        end)):SetColor(team.GetColor( v:Team() ))
    end
end)

SubMenu("Принудительно понизить игрока", "icon16/user_delete.png", function(self)
    for k, v in pairs(player.GetAll()) do
        if v == LocalPlayer() then continue end
        if not v:isCP() then continue end
        if LocalPlayer():isChief() and (v:isMayor() or v:isChief() or v:Team() == TEAM_ROMON) then continue end
        if LocalPlayer():Team() == TEAM_ROMON and (v:isMayor() or v:Team() == TEAM_CHIEF or v:Team() == TEAM_ROMON) then continue end
        
        self:AddOption2(v:Name(), Request("Принудительно понизить игрока", "За что вы хотите его понизить?", function(s)
            RunConsoleCommand("darkrp", "pdemote", v:UserID(), s)
        end)):SetColor(team.GetColor(v:Team()))
    end
end, function() return LocalPlayer():isMayor() or LocalPlayer():isChief() or LocalPlayer():Team() == TEAM_ROMON end)

Option("Уникальная работа", path .. 'admin.png', Request("Получение уникальной работы", "Введите имя уникальной работы. Например \"бизнесмен\"", function(s)
    RunConsoleCommand("darkrp", "job", s)
end))
--[[*
 * Начало кнопок для ГО
 ]]
Spacer(isCP)

SubMenu("Повесить розыск", path .. 'want.png', function(self)
    for k, v in player.Iterator() do
        if v == LocalPlayer() then continue end

        if not v:isWanted() then
            self:AddOption2(v:Name(), Request("Повесить розыск", "Для чего вы ищите его?", function(s)
                RunConsoleCommand("darkrp", "wanted", v:UserID(), s)
            end)):SetColor(team.GetColor( v:Team() ))
        end
    end
end, isCP)

SubMenu("Снять розыск", path .. 'unwant.png', function(self)
    for k, v in player.Iterator() do
        if v:isWanted() then
            self:AddOption2(v:Name(), function()
                RunConsoleCommand("darkrp", "unwanted", v:UserID(), s)
            end):SetColor(team.GetColor( v:Team() ))
        end
    end
end, isCP)

SubMenu("Запросить ордер", path .. 'warrant.png', function(self)

    for k, v in player.Iterator() do

        if v == LocalPlayer() then continue end



        if not v:isWanted() then

            self:AddOption2(v:Name(), Request("Запросить ордер", "Для чего он вам нужен то?", function(s)

                RunConsoleCommand("darkrp", "warrant", v:UserID(), s)

            end)):SetColor(team.GetColor( v:Team() ))

        end

    end

end, isCP)

-- Option("Выдать лицензию", path .. 'license.png', function(self)
    -- RunConsoleCommand("darkrp", "givelicense")
-- end, function()
    -- local ply = LocalPlayer()
    -- local noMayorExists = fn.Compose{fn.Null, fn.Curry(fn.Filter, 2)(ply.isMayor), player.GetAll}
    -- local noChiefExists = fn.Compose{fn.Null, fn.Curry(fn.Filter, 2)(ply.isChief), player.GetAll}
    -- local canGiveLicense = fn.FOr{ply.isMayor, fn.FAnd{ply.isChief, noMayorExists}, fn.FAnd{ply.isCP, noChiefExists, noMayorExists}}

    -- Mayors can hand out licenses
    -- Chiefs can if there is no mayor
    -- CP's can if there are no chiefs nor mayors
    -- return canGiveLicense(ply)
-- end)

--[[*
 * Начало кнопок для мэра
 ]]
Spacer(function() return LocalPlayer():isMayor() end)

SubMenu("Лицензии", path .. 'license.png', function(self)
    self:AddOption("Выдать лицензию на оружие", function()
        RunConsoleCommand("givelicense", "weapon")
    end):SetIcon("icon16/gun.png")

    self:AddOption("Выдать лицензию на строительство", function()
        RunConsoleCommand("givelicense", "building")
    end):SetIcon("icon16/brick.png")

    self:AddOption("Выдать лицензию на бизнес", function()
        RunConsoleCommand("givelicense", "business")
    end):SetIcon("icon16/briefcase.png")
end, function()
    return LocalPlayer():isMayor()
end)
    
Option("Объявить ком. час", path .. 'lockdown.png', Request("Введите причину", "Введите причину ком.часа", function(s)
    --RunConsoleCommand("darkrp", "lockdown")
    RunConsoleCommand("say", "/lkd " .. s)
end), function() return LocalPlayer():isMayor() and not GetGlobalBool("LockDown1") end)

Option("Отменить ком. час", "icon16/stop.png", function()
    --RunConsoleCommand("darkrp", "unlockdown")
    RunConsoleCommand("say", "/unlkd")
end, function() return LocalPlayer():isMayor() and GetGlobalBool("LockDown1") end)
Option("Изменить Повестку дня", "icon16/application.png",
    Request("Изменить Повестку", "Что добавим? До 31 символа", function(s)
        RunConsoleCommand("darkrp", "agenda", s)
    end),
function()
    for k, v in pairs(DarkRPAgendas) do
        if type(v.Manager) == "table" then
            if table.HasValue(v.Manager, LocalPlayer():Team()) then return true end
        elseif v.Manager == LocalPlayer():Team() then
            return true
        end
    end
end)

Spacer()

SubMenu("Админ", path .. 'get_admin.png', function(self)

    self:AddOption("Админ меню", function()
        RunConsoleCommand("ulx", "menu")
    end):SetIcon("icon16/computer_link.png")
    
    self:AddOption("Режим админа", function()
        RunConsoleCommand("say", "/amode")
    end):SetIcon("icon16/rainbow.png")

    self:AddOption("Статистика админов", function()
        RunConsoleCommand("adminstats")
    end):SetIcon("icon16/application.png")

    self:AddOption("Последние жалобы", function()
        RunConsoleCommand("adminlogs")
    end):SetIcon("icon16/bell.png")
    
    self:AddOption("Варны", function()
        RunConsoleCommand("warns")
    end):SetIcon("icon16/printer_delete.png")
    
    self:AddOption("Логи ", function()
        RunConsoleCommand("say","!logs")
    end):SetIcon("icon16/report_add.png")
    
    self:AddOption("Следить", function()
        RunConsoleCommand("say", "!spectate")
    end):SetIcon("icon16/zoom.png")

    self:AddOption("Невидимость", function()
        RunConsoleCommand("ulx", "cloak")
    end):SetIcon("icon16/status_offline.png")

    self:AddOption("Видимость", function()
        RunConsoleCommand("ulx", "uncloak")
    end):SetIcon("icon16/status_offline.png")

    self:AddOption("Бессмертие", function()
        RunConsoleCommand("ulx", "god")
    end):SetIcon("icon16/shield_add.png")

    self:AddOption("Смертие", function()
        RunConsoleCommand("ulx", "ungod")
    end):SetIcon("icon16/shield_delete.png")
    
    self:AddOption("Ноуклип", function()
        RunConsoleCommand("ulx", "noclip")
    end):SetIcon("icon16/arrow_out.png")
    
    self:AddOption("Скрыть админ чат", function()
        RunConsoleCommand("say", "/ahide")
    end):SetIcon("icon16/comments_delete.png")
    
end, function() return ULib.ucl.query(LocalPlayer(), "ulx noclip") end)

local cmenu

if IsValid(cmenu) then
    cmenu:Remove()
end

hook.Add('OnContextMenuOpen', 'CMenuOnContextMenuOpen', function()
    if not g_ContextMenu:IsVisible() then
        local orig = g_ContextMenu.Open

        g_ContextMenu.Open = function(self, ...)
            self.Open = orig
            orig(self, ...)
            fonpanel = vgui.Create('DPanel')

            fonpanel.Paint = function(s, w, h)
                draw.RoundedBox(8, 0, 0, w, h, Color(47, 47, 47, 250))
                draw.SimpleText("Меню действий", "cmenutextbold", w / 2, o(7), Color(255, 255, 255), 1)
            end

            fonpanel.Think = function(s)
                if not IsValid(cmenu) then
                    s:Remove()
                else
                    s:SetWide(cmenu:GetWide())
                    s:SetTall(cmenu:GetTall() + o(40))
                    local x, y = cmenu:GetPos()
                    s:SetPos(x, y - o(30))
                end
            end

            cmenu = vgui.Create('CMenuExtension')
            cmenu:SetDrawOnTop(false)

            for k, v in pairs(Menu) do
                if not v.check or v.check() then
                    if v.cmd then
                        cmenu:AddOption(v.title, isfunction(v.cmd) and v.cmd or function() RunConsoleCommand(v.cmd) end):SetMaterial(v.icon)
                    elseif v.func then
                        local m, s = cmenu:AddSubMenu(v.title)
                        s:SetImage(v.icon)
                        v.func(m)
                    else
                        cmenu:AddSpacer()
                    end
                end
            end

            cmenu:Open()

            if C_CONFIG_POSITION == 'bottom' then
                cmenu:CenterHorizontal()
                cmenu.y = ScrH()
                cmenu:MoveTo(cmenu.x, ScrH() - cmenu:GetTall() - 8, .1, 0)
            elseif C_CONFIG_POSITION == 'right' then
                cmenu:CenterVertical()
                cmenu.x = ScrW()
                cmenu:MoveTo(ScrW() - cmenu:GetWide() - 8, cmenu.y, .1, 0)
            elseif C_CONFIG_POSITION == 'left' then
                cmenu:CenterVertical()
                cmenu.x = -cmenu:GetWide()
                cmenu:MoveTo(8, cmenu.y, .1, 0)
            else
                cmenu:CenterHorizontal()
                cmenu.y = -cmenu:GetTall()
                cmenu:MoveTo(cmenu.x, 30 + 8, .1, 0)
            end

            fonpanel:MakePopup()
            cmenu:MakePopup()
        end
    end
end)

hook.Add('CloseDermaMenus', 'CMenuCloseDermaMenus', function()
    if cmenu and cmenu:IsValid() then
        cmenu:MakePopup()
    end
end)

hook.Add('OnContextMenuClose', 'CMenuOnContextMenuClose', function()
    cmenu:Remove()
end)

surface.CreateFont("cmenutext", {
    font = "PT Root UI Medium",
    size = o(16),
    extended = true
})

surface.CreateFont("cmenutextbold", {
    font = "PT Root UI Bold",
    size = o(18),
    extended = true
})

local PANEL = {}
AccessorFunc(PANEL, 'm_bBorder', 'DrawBorder')
AccessorFunc(PANEL, 'm_bDeleteSelf', 'DeleteSelf')
AccessorFunc(PANEL, 'm_iMinimumWidth', 'MinimumWidth')
AccessorFunc(PANEL, 'm_bDrawColumn', 'DrawColumn')
AccessorFunc(PANEL, 'm_iMaxHeight', 'MaxHeight')
AccessorFunc(PANEL, 'm_pOpenSubMenu', 'OpenSubMenu')
 
function PANEL:Init()
    self:SetIsMenu(true)
    self:SetDrawBorder(true)
    self:SetDrawBackground(true)
    self:SetMinimumWidth(100)
    self:SetDrawOnTop(true)
    self:SetMaxHeight(ScrH() * 0.7)
    self:SetDeleteSelf(true)
    self:SetPadding(0)
end
 
function PANEL:AddPanel(pnl)
    self:AddItem(pnl)
    pnl.ParentMenu = self
end
 
local cached_mats = {}
 
function PANEL:AddOption( strText, funcFunction )
 
    local pnl = vgui.Create( "CMenuOption", self )
    pnl:SetMenu( self )
    pnl:SetText( '' )
    pnl:SetTextColor( Color( 255, 255, 255, 255 ) )
    pnl:SetFont('cmenutextbold')
    pnl.Paint = function(s,w,h)
        local x = h + 1
        local xz, yz = draw.SimpleText(strText,"cmenutextbold", x, h*.350, Color(255,255,255,255),0,1)
                
        x = x + xz + 5
        -- draw.SimpleText(strText, 'cmenutextbold', o(80), h * .5, color_whiteo, 1, 1)
    end
    if ( funcFunction ) then pnl.DoClick = funcFunction end
 
    self:AddPanel( pnl )
 
    return pnl
 
end

function PANEL:AddOption2( strText, funcFunction )
 
    local pnl = vgui.Create( "DMenuOption", self )
    pnl:SetMenu( self )
    pnl:SetText( strText )
    pnl:SetTextColor( Color( 255, 255, 255, 255 ) )
    pnl:SetFont('cmenutextbold')
    -- pnl.Paint = function(s,w,h)
    --     local x = h + 1
    --     local xz, yz = draw.SimpleText(strText,"cmenutextbold", x, h*.360, Color(255,255,255,255),0,1)
                
    --     x = x + xz + 5
    --     -- draw.SimpleText(strText, 'cmenutextbold', o(80), h * .5, color_whiteo, 1, 1)
    -- end
    if ( funcFunction ) then pnl.DoClick = funcFunction end
 
    self:AddPanel( pnl )
 
    return pnl
 
end

function PANEL:AddOptionPlayyyyer( strText, funcFunction )
 
    local pnl = vgui.Create( "CMenuOption", self )
    pnl:SetMenu( self )
    pnl:SetText( '' )
    pnl:SetTextColor( Color( 255, 255, 255, 255 ) )
    pnl:SetFont('cmenutextplayers')
    local tab = table.Copy(player.GetAll())
    table.sort(tab, function(a, b) return team.GetName(a:Team()) < team.GetName(b:Team()) end)
    for k,v in player.Iterator() do
        pnl.Paint = function(s,w,h)
            //draw.RoundedBox(8, 0, 0, w, h, Color(184,184,184,50))
            local x = h + 1
            local xz, yz = draw.SimpleText(v:Name(),"cmenutextplayers", x, h*.360, Color(255,255,255,255),0,1)
                        
            x = x + xz + 5

            local xz, yz = draw.SimpleText(v:getDarkRPVar'job',"cmenutextplayers", x, h*.360, team.GetColor( v:Team() ),0,1)
        //        draw.SimpleText(strText, 'cmenutextbold', o(80), h * .5, color_white, 1, 1)

        end
    end

    if ( funcFunction ) then pnl.DoClick = funcFunction end
 
    self:AddPanel( pnl )
 
    return pnl
 
end
 
 
function PANEL:AddCVar(strText, convar, on, off, funcFunction)
    local pnl = vgui.Create('DMenuOptionCVar', self)
 
    pnl.Paint = function(s, w, h)
        draw.SimpleText(strText, "cmenutext", o(44), h / 2, Color(255, 255, 255), 0, 1)
    end
 
    pnl:SetMenu(self)
    pnl:SetText("")
 
    if (funcFunction) then
        pnl.DoClick = funcFunction
    end
 
    pnl:SetConVar(convar)
    pnl:SetValueOn(on)
    pnl:SetValueOff(off)
    self:AddPanel(pnl)
 
    return pnl
end
 
function PANEL:AddSpacer(strText, funcFunction)
    local pnl = vgui.Create('DPanel', self)
 
    pnl.Paint = function(p, w, h)
        surface.SetDrawColor(Color(0, 0, 0, 100))
        surface.DrawRect(0, 0, w, h)
    end
 
    pnl:SetTall(1)
    self:AddPanel(pnl)
 
    return pnl
end
 
function PANEL:AddSubMenu( strText, funcFunction )



    local pnl = vgui.Create( "CMenuOption", self )

    local SubMenu = pnl:AddSubMenu( strText, funcFunction )



    pnl:SetText( '' )

    pnl:SetTextColor( Color( 255, 255, 255, 255 ) )

    pnl:SetFont('cmenutextbold')
    pnl.Paint = function(s,w,h)
        local x = h + 1
        local xz, yz = draw.SimpleText(strText,"cmenutextbold", x, h*.360, Color(255,255,255,255),0,1)
                
        x = x + xz + 5
        -- draw.SimpleText(strText, 'cmenutextbold', o(80), h * .5, color_whiteo, 1, 1)
    end
    if ( funcFunction ) then pnl.DoClick = funcFunction end



    self:AddPanel( pnl )



    return SubMenu, pnl



end
 
 
function PANEL:Hide()
    local openmenu = self:GetOpenSubMenu()
 
    if (openmenu) then
        openmenu:Hide()
    end
 
    self:SetVisible(false)
    self:SetOpenSubMenu(nil)
end
 
function PANEL:OpenSubMenu(item, cmenu)
    local openmenu = self:GetOpenSubMenu()
 
    if (IsValid(openmenu)) then
        if (cmenu and openmenu == cmenu) then return end
        self:CloseSubMenu(openmenu)
    end
 
    if (not IsValid(cmenu)) then return end
    local x, y = item:LocalToScreen(self:GetWide(), 0)
    cmenu:Open(x - 3, y, false, item)
    self:SetOpenSubMenu(cmenu)
end
 
function PANEL:CloseSubMenu(cmenu)
    cmenu:Hide()
    self:SetOpenSubMenu(nil)
end
 
function PANEL:Paint(w, h)
end
 
function PANEL:ChildCount()
    return #self:GetCanvas():GetChildren()
end
 
function PANEL:GetChild(num)
    return self:GetCanvas():GetChildren()[num]
end
 
function PANEL:PerformLayout()
    local w = self:GetMinimumWidth()
 
    for k, pnl in pairs(self:GetCanvas():GetChildren()) do
        pnl:PerformLayout()
        w = math.max(w, pnl:GetWide())
    end
 
    self:SetWide(o(307))
    local y = 0 -- o(31)
 
    for k, pnl in pairs(self:GetCanvas():GetChildren()) do
        pnl:SetWide(o(307))
        pnl:SetPos(0, y)
        pnl:InvalidateLayout(true)
 
        if pnl:GetTall() ~= 1 then
            pnl.PerformLayout = function() end
            pnl:SetTall(o(34))
 
            if (IsValid(pnl.SubMenuArrow)) then
                pnl.SubMenuArrow:SetSize(o(5), o(10))
 
                pnl.SubMenuArrow.Paint = function(s, w, h)
                    surface.SetDrawColor(255, 255, 255, 255)
                    surface.SetMaterial(mat_arrow)
                    surface.DrawTexturedRect(0, 0, w, h)
                end
 
                pnl.SubMenuArrow:SetPos(o(307) - o(15), o(12))
            end
        end
 
        y = y + pnl:GetTall()
    end
 
    --y = y + o(10)
    y = math.min(y, self:GetMaxHeight())
    self:SetTall(y)
    derma.SkinHook('Layout', 'Menu', self)
    DScrollPanel.PerformLayout(self)
    self.VBar.btnDown.Paint = function() end
    self.VBar:SetWide(o(2))
    self.VBar.btnGrip.Paint = function(s, w, h) draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255)) end
end
 
function PANEL:Open(x, y, skipanimation, ownerpanel)
    local maunal = x and y
    x = x or gui.MouseX()
    y = y or gui.MouseY()
    local OwnerHeight = 0
    local OwnerWidth = 0
 
    if (ownerpanel) then
        OwnerWidth, OwnerHeight = ownerpanel:GetSize()
    end
 
    self:PerformLayout()
    local w = self:GetWide()
    local h = self:GetTall()
    self:SetSize(w, h)
 
    if (y + h > ScrH()) then
        y = ((maunal and ScrH()) or (y + OwnerHeight)) - h
    end
 
    if (x + w > ScrW()) then
        x = ((maunal and ScrW()) or x) - w
    end
 
    if (y < 1) then
        y = 1
    end
 
    if (x < 1) then
        x = 1
    end
 
    self:SetPos(x, y)
    self:MakePopup()
    self:SetVisible(true)
    self:SetKeyboardInputEnabled(false)
end
 
function PANEL:OptionSelectedInternal(option)
    self:OptionSelected(option, option:GetText())
end
 
function PANEL:OptionSelected(option, text)
end
 
function PANEL:ClearHighlights()
    for k, pnl in pairs(self:GetCanvas():GetChildren()) do
        pnl.Highlight = nil
    end
end
 
function PANEL:HighlightItem(item)
    for k, pnl in pairs(self:GetCanvas():GetChildren()) do
        if (pnl == item) then
            pnl.Highlight = true
        end
    end
end
 
function PANEL:GenerateExample(ClassName, PropertySheet, Width, Height)
end
 
derma.DefineControl('CMenuExtension', 'A Menu', PANEL, 'DScrollPanel')

local PANEL = {}

AccessorFunc( PANEL, "m_pMenu", "Menu" )
AccessorFunc( PANEL, "m_bChecked", "Checked" )
AccessorFunc( PANEL, "m_bCheckable", "IsCheckable" )



function PANEL:Init()
    self:SetContentAlignment( 4 )
    self:SetTextInset( 30, 0 )  
    self:SetTextColor( Color( 255, 255, 255 ) )
    self:SetChecked( false )
end



function PANEL:SetSubMenu( menu )
    self.SubMenu = menu

    if ( !self.SubMenuArrow ) then
        self.SubMenuArrow = vgui.Create( "DPanel", self )
        self.SubMenuArrow.Paint = function( panel, w, h ) 
            local rightarrow = {
                { x = 5, y = 3 },
                { x = w-5, y = h/2 },
                { x = 5, y = h-3 }
            }
            surface.SetDrawColor( 255, 255, 255, 255 )
            draw.NoTexture()
            surface.DrawPoly( rightarrow )
        end
    end
end



function PANEL:AddSubMenu()
    if ( !self ) then CloseDermaMenus() end
    local SubMenu = vgui.Create( "CMenuExtension", self )
        SubMenu:SetVisible( false )
        SubMenu:SetParent( self )
        SubMenu.Paint = function(p,w,h)
            draw.RoundedBox(7,0,0,w,h,Color(47,47,47,240))
            --draw.RoundedBox(0,0,0,w,h,Color(0,0,0,200))
        end
    self:SetSubMenu( SubMenu )
    return SubMenu
end



function PANEL:OnCursorEntered()
    if ( IsValid( self.ParentMenu ) ) then
        self.ParentMenu:OpenSubMenu( self, self.SubMenu )
        return
    end

    if OpenSubMenu then 
        self:GetParent():OpenSubMenu( self, self.SubMenu )
    end
end



function PANEL:OnCursorExited()
end



function PANEL:Paint( w, h )
    if self:IsHovered() then
        draw.RoundedBox(0,0,0,w,h,Color(0,0,0,150))      
    end
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
    self:SetSize( w, 22 )

    if ( self.SubMenuArrow ) then
        self.SubMenuArrow:SetSize( 15, 15 )
        self.SubMenuArrow:CenterVertical()
        self.SubMenuArrow:AlignRight( 4 )
    end

    DButton.PerformLayout( self )



end



function PANEL:GenerateExample()
end



derma.DefineControl( "CMenuOption", "ContxtMenuD", PANEL, "DButton" )


local fr, chk
hook.Add('OnContextMenuClose', 'rp.ThirdPerson.OnContextMenuClose', function()
    if (IsValid(fr)) then
        fr:Remove()
    end

    if (IsValid(chk)) then
        chk:Remove()
    end
end)
--PATH addons/m9k/lua/weapons/bobs_scoped_base/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/bobs_scoped_base/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Category				= ""
SWEP.Author				= "Generic Default, Worshipper, Clavus, and Bob"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= true	
SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true

SWEP.Base 				= "bobs_gun_base"

SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false

SWEP.Primary.Sound 			= Sound("")				-- Sound of the gun
SWEP.Primary.Round 			= ("")					-- What kind of bullet?
SWEP.Primary.RPM				= 0					-- This is in Rounds Per Minute
SWEP.Primary.Cone			= 0.15					-- Accuracy of NPCs
SWEP.Primary.Recoil		= 10
SWEP.Primary.Damage		= 10
SWEP.Primary.Spread		= .01					--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.NumShots	= 1
SWEP.Primary.ClipSize			= 0					-- Size of a clip
SWEP.Primary.DefaultClip			= 0					-- Default number of bullets in a clip
SWEP.Primary.KickUp			= 0					-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0					-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0					-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true					-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"					-- What kind of ammo

-- SWEP.Secondary.ClipSize			= 0					-- Size of a clip
-- SWEP.Secondary.DefaultClip			= 0					-- Default number of bullets in a clip
-- SWEP.Secondary.Automatic			= false					-- Automatic/Semi Auto if
SWEP.Secondary.Ammo			= ""

SWEP.Secondary.ScopeZoom			= 0
SWEP.Secondary.UseACOG			= false	
SWEP.Secondary.UseMilDot			= false		
SWEP.Secondary.UseSVD			= false	
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex		= false	

SWEP.Scoped				= true

SWEP.BoltAction		= false	

SWEP.Penetration			= true

SWEP.Tracer				= 0	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1
SWEP.ScopeScale 			= 0.5
SWEP.ReticleScale 			= 0.5
SWEP.IronSightsPos = Vector (2.4537, 1.0923, 0.2696)
SWEP.IronSightsAng = Vector (0.0186, -0.0547, 0)

function SWEP:Initialize()
	self.Weapon:SetNWBool("Reloading", false)
	util.PrecacheSound(self.Primary.Sound)
	if CLIENT then
	
		-- We need to get these so we can scale everything to the player's current resolution.
		local iScreenWidth = surface.ScreenWidth()
		local iScreenHeight = surface.ScreenHeight()
		
		-- The following code is only slightly riped off from Night Eagle
		-- These tables are used to draw things like scopes and crosshairs to the HUD.
		-- so DONT GET RID OF IT!

		self.ScopeTable = {}
		self.ScopeTable.l = iScreenHeight*self.ScopeScale
		self.ScopeTable.x1 = 0.5*(iScreenWidth + self.ScopeTable.l)
		self.ScopeTable.y1 = 0.5*(iScreenHeight - self.ScopeTable.l)
		self.ScopeTable.x2 = self.ScopeTable.x1
		self.ScopeTable.y2 = 0.5*(iScreenHeight + self.ScopeTable.l)
		self.ScopeTable.x3 = 0.5*(iScreenWidth - self.ScopeTable.l)
		self.ScopeTable.y3 = self.ScopeTable.y2
		self.ScopeTable.x4 = self.ScopeTable.x3
		self.ScopeTable.y4 = self.ScopeTable.y1
		self.ScopeTable.l = (iScreenHeight + 1)*self.ScopeScale -- I don't know why this works, but it does.

		self.QuadTable = {}
		self.QuadTable.x1 = 0
		self.QuadTable.y1 = 0
		self.QuadTable.w1 = iScreenWidth
		self.QuadTable.h1 = 0.5*iScreenHeight - self.ScopeTable.l
		self.QuadTable.x2 = 0
		self.QuadTable.y2 = 0.5*iScreenHeight + self.ScopeTable.l
		self.QuadTable.w2 = self.QuadTable.w1
		self.QuadTable.h2 = self.QuadTable.h1
		self.QuadTable.x3 = 0
		self.QuadTable.y3 = 0
		self.QuadTable.w3 = 0.5*iScreenWidth - self.ScopeTable.l
		self.QuadTable.h3 = iScreenHeight
		self.QuadTable.x4 = 0.5*iScreenWidth + self.ScopeTable.l
		self.QuadTable.y4 = 0
		self.QuadTable.w4 = self.QuadTable.w3
		self.QuadTable.h4 = self.QuadTable.h3

		self.LensTable = {}
		self.LensTable.x = self.QuadTable.w3
		self.LensTable.y = self.QuadTable.h1
		self.LensTable.w = 2*self.ScopeTable.l
		self.LensTable.h = 2*self.ScopeTable.l

		self.ReticleTable = {}
		self.ReticleTable.wdivider = 3.125
		self.ReticleTable.hdivider = 1.7579/self.ReticleScale		-- Draws the texture at 512 when the resolution is 1600x900
		self.ReticleTable.x = (iScreenWidth/2)-((iScreenHeight/self.ReticleTable.hdivider)/2)
		self.ReticleTable.y = (iScreenHeight/2)-((iScreenHeight/self.ReticleTable.hdivider)/2)
		self.ReticleTable.w = iScreenHeight/self.ReticleTable.hdivider
		self.ReticleTable.h = iScreenHeight/self.ReticleTable.hdivider

		self.FilterTable = {}
		self.FilterTable.wdivider = 3.125
		self.FilterTable.hdivider = 1.7579/1.35	
		self.FilterTable.x = (iScreenWidth/2)-((iScreenHeight/self.FilterTable.hdivider)/2)
		self.FilterTable.y = (iScreenHeight/2)-((iScreenHeight/self.FilterTable.hdivider)/2)
		self.FilterTable.w = iScreenHeight/self.FilterTable.hdivider
		self.FilterTable.h = iScreenHeight/self.FilterTable.hdivider

		
	end
	if SERVER then
		self:SetNPCMinBurst(3)
		self:SetNPCMaxBurst(10)
		self:SetNPCFireRate(1)
		--self:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
	end
	self:SetHoldType(self.HoldType)
	
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

function SWEP:BoltBack()
	if self.Weapon:Clip1() > 0 or self.Owner:GetAmmoCount( self.Weapon:GetPrimaryAmmoType() ) > 0 then
		timer.Simple(.25, function()
		if SERVER and self.Weapon != nil then 
			self.Weapon:SetNWBool("Reloading", true)
			if self.Weapon:GetClass() == self.Gun then
				if(self:GetIronsights() == true) then
					self.Owner:SetFOV( 0, 0.3 )
					self:SetIronsights(false)
					self.Owner:DrawViewModel(true)
				end
				local boltactiontime = (self.Owner:GetViewModel():SequenceDuration())
				timer.Simple(boltactiontime + .1, 
					function() if SERVER and self.Weapon != nil then
						self.Weapon:SetNWBool("Reloading", false)
						if self.Owner:KeyDown(IN_ATTACK2) and self.Weapon:GetClass() == self.Gun then 
							self.Owner:SetFOV( 75/self.Secondary.ScopeZoom, 0.15 )                      		
							self.IronSightsPos = self.SightsPos					-- Bring it up
							self.IronSightsAng = self.SightsAng					-- Bring it up
							self.DrawCrosshair = false
							self:SetIronsights(true, self.Owner)
							self.Owner:DrawViewModel(false)
						end
					end 
				end)
			end
		else return end end )
	end	
end

function SWEP:Reload()

	if self.Owner:KeyDown(IN_USE) then return end
	
	self.Weapon:DefaultReload(ACT_VM_RELOAD) 
	if !self.Owner:IsNPC() then
	self.Idle = CurTime() + self.Owner:GetViewModel():SequenceDuration() end

	if ( self.Weapon:Clip1() < self.Primary.ClipSize ) and !self.Owner:IsNPC() then
	-- When the current clip < full clip and the rest of your ammo > 0, then

		self.Owner:SetFOV( 0, 0.3 )
		-- Zoom = 0

		self:SetIronsights(false)
		-- Set the ironsight to false
		self.Weapon:SetNWBool("Reloading", true)
		if CLIENT then return end
		self.Owner:DrawViewModel(true)
	end
	
	local waitdammit
	if self.Owner:GetViewModel() == nil then 
		waitdammit = 3
	else
		waitdammit = (self.Owner:GetViewModel():SequenceDuration())
	end
	timer.Simple(waitdammit + .1, function()
	if self.Weapon != nil then 
	self.Weapon:SetNWBool("Reloading", false)
	if self.Owner:KeyDown(IN_ATTACK2) and self.Weapon:GetClass() == self.Gun then 
		if CLIENT then return end
		self.Owner:SetFOV( 75/self.Secondary.ScopeZoom, 0.15 )                      		
		self.IronSightsPos = self.SightsPos					-- Bring it up
		self.IronSightsAng = self.SightsAng					-- Bring it up
		self.DrawCrosshair = false
		self:SetIronsights(true, self.Owner)
		self.Owner:DrawViewModel(false)
 	elseif ( self.Owner:KeyDown(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and self.Weapon:GetClass() == self.Gun then
		if self.Weapon:GetNextPrimaryFire() <= (CurTime()+0.3) then
			self.Weapon:SetNextPrimaryFire(CurTime()+0.3)				-- Make it so you can't shoot for another quarter second
		end
		self.IronSightsPos = self.RunSightsPos					-- Hold it down
		self.IronSightsAng = self.RunSightsAng					-- Hold it down
		self:SetIronsights(true, self.Owner)					-- Set the ironsight true
		self.Owner:SetFOV( 0, 0.2 )
	else return end
	end end)
end

function SWEP:PostReloadScopeCheck()
	if self.Weapon != nil then 
	self.Weapon:SetNWBool("Reloading", false)
	if self.Owner:KeyDown(IN_ATTACK2) and self.Weapon:GetClass() == self.Gun then 
		if CLIENT then return end
		self.Owner:SetFOV( 75/self.Secondary.ScopeZoom, 0.15 )                      		
		self.IronSightsPos = self.SightsPos					-- Bring it up
		self.IronSightsAng = self.SightsAng					-- Bring it up
		self.DrawCrosshair = false
		self:SetIronsights(true, self.Owner)
		self.Owner:DrawViewModel(false)
 	elseif ( self.Owner:KeyDown(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and self.Weapon:GetClass() == self.Gun then
		if self.Weapon:GetNextPrimaryFire() <= (CurTime()+0.3) then
			self.Weapon:SetNextPrimaryFire(CurTime()+0.3)				-- Make it so you can't shoot for another quarter second
		end
		self.IronSightsPos = self.RunSightsPos					-- Hold it down
		self.IronSightsAng = self.RunSightsAng					-- Hold it down
		self:SetIronsights(true, self.Owner)					-- Set the ironsight true
		self.Owner:SetFOV( 0, 0.2 )
	else return end
	end
end


/*---------------------------------------------------------
IronSight
---------------------------------------------------------*/
function SWEP:IronSight()

	if not IsValid(self) then return end
	if not IsValid(self.Owner) then return end
	
	if self.SelectiveFire and self.NextFireSelect < CurTime() and not (self.Weapon:GetNWBool("Reloading")) then
		if self.Owner:KeyDown(IN_USE) and self.Owner:KeyPressed(IN_RELOAD) then
			self:SelectFireMode()
		end
	end
	
	if self.Owner:KeyDown(IN_USE) and self.Owner:KeyPressed(IN_ATTACK2) then return end
	
	if ( self.Owner:KeyPressed(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and not (self.Weapon:GetNWBool("Reloading")) then		-- If you hold E and you can shoot then
	if self.Weapon:GetNextPrimaryFire() <= (CurTime()+0.3) then
		self.Weapon:SetNextPrimaryFire(CurTime()+0.3)				-- Make it so you can't shoot for another quarter second
	end
	self.IronSightsPos = self.RunSightsPos					-- Hold it down
	self.IronSightsAng = self.RunSightsAng					-- Hold it down
	self:SetIronsights(true, self.Owner)					-- Set the ironsight true
	self.Owner:SetFOV( 0, 0.2 )
	end	
							
	if ( self.Owner:KeyPressed(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and not (self.Weapon:GetNWBool("Reloading")) then		-- If you hold E or run then
		if self.Weapon:GetNextPrimaryFire() <= (CurTime()+0.3) then
			self.Weapon:SetNextPrimaryFire(CurTime()+0.3)				-- Make it so you can't shoot for another quarter second
		end								-- Lower the gun
	end
	
	if self.Owner:KeyReleased(IN_USE) || ( self.Owner:KeyReleased(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") ) then	-- If you release E then
	self:SetIronsights(false, self.Owner)					-- Set the ironsight true
	self.DrawCrosshair = self.XHair
	end


	if ( self.Owner:KeyPressed(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") ) || self.Owner:KeyPressed(IN_USE) then	-- If you run then
		self.Owner:SetFOV( 0, 0.2 )
		self.DrawCrosshair = false
		if CLIENT then return end
		self.Owner:DrawViewModel(true)
	end	

		if self.Owner:KeyPressed(IN_ATTACK2) and ( !self.Owner:KeyDown(IN_SPEED) or self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and not (self.Weapon:GetNWBool("Reloading")) then
			self.Owner:SetFOV( 75/self.Secondary.ScopeZoom, 0.15 )                      		
			self.IronSightsPos = self.SightsPos					-- Bring it up
			self.IronSightsAng = self.SightsAng					-- Bring it up
			self.DrawCrosshair = false
			self:SetIronsights(true, self.Owner)
			if CLIENT then return end
			self.Owner:DrawViewModel(false)
		elseif self.Owner:KeyPressed(IN_ATTACK2) and not (self.Weapon:GetNWBool("Reloading")) and ( self.Owner:KeyDown(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") ) then
			if self.Weapon:GetNextPrimaryFire() <= (CurTime()+0.3) then
				self.Weapon:SetNextPrimaryFire(CurTime()+0.3)				-- Make it so you can't shoot for another quarter second
			end
			self.IronSightsPos = self.RunSightsPos					-- Hold it down
			self.IronSightsAng = self.RunSightsAng					-- Hold it down
			self:SetIronsights(true, self.Owner)					-- Set the ironsight true
			self.Owner:SetFOV( 0, 0.2 )
		end

	if (self.Owner:KeyReleased(IN_ATTACK2) || ( self.Owner:KeyDown(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") )) and !self.Owner:KeyDown(IN_USE) and ( !self.Owner:KeyDown(IN_SPEED) or self.Owner:GetNW2Bool("donate_upgrade_runngun") ) then
		self.Owner:SetFOV( 0, 0.2 )
		self:SetIronsights(false, self.Owner)
		self.DrawCrosshair = self.XHair
		-- Set the ironsight false
		if CLIENT then return end
		self.Owner:DrawViewModel(true)
		end

		if self.Owner:KeyDown(IN_ATTACK2) and !self.Owner:KeyDown(IN_USE) and ( !self.Owner:KeyDown(IN_SPEED) or self.Owner:GetNW2Bool("donate_upgrade_runngun") ) then
		self.SwayScale 	= 0.05
		self.BobScale 	= 0.05
		else
		self.SwayScale 	= 1.0
		self.BobScale 	= 1.0
		end
end

function SWEP:DrawHUD()


	if  self.Owner:KeyDown(IN_ATTACK2) and (self:GetIronsights() == true) and (( !self.Owner:KeyDown(IN_SPEED) or self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and !self.Owner:KeyDown(IN_USE)) then

			if self.Secondary.UseACOG then
			-- Draw the FAKE SCOPE THANG
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_closedsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)

			-- Draw the CHEVRON
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_acogchevron"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)

			-- Draw the ACOG REFERENCE LINES
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_acogcross"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)
			end

			if self.Secondary.UseMilDot then
			-- Draw the MIL DOT SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_scopesight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
			end

			if self.Secondary.UseSVD then
			-- Draw the SVD SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_svdsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
			end

			if self.Secondary.UseParabolic then
			-- Draw the PARABOLIC SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_parabolicsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
			end

			if self.Secondary.UseElcan then
			-- Draw the RETICLE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_elcanreticle"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)
			
			-- Draw the ELCAN SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_elcansight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
			end

			if self.Secondary.UseGreenDuplex then
			-- Draw the RETICLE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_nvgilluminatedduplex"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)

			-- Draw the SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_closedsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
			end
			
			if self.Secondary.UseAimpoint then
			-- Draw the RETICLE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/aimpoint"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)

			-- Draw the SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_closedsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
			
			end
			
			if self.Secondary.UseMatador then
			
			-- Draw the SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/rocketscope"))
			surface.DrawTexturedRect(self.LensTable.x-1, self.LensTable.y, self.LensTable.w, self.LensTable.h)

			end

	end
end

function SWEP:AdjustMouseSensitivity()
     
	if self.Owner:KeyDown(IN_ATTACK2) then
        return (1/(self.Secondary.ScopeZoom/2))
    	else 
    	return 1
     	end
end
--PATH addons/the_cocaine_factory/lua/weapons/cocaine_repair_wrench/shared.lua:
--[[ INFO
models/craphead_scripts/the_cocaine_factory/wrench/c_wrench.mdl
models/craphead_scripts/the_cocaine_factory/wrench/w_wrench.mdl
FOV: 65
Hold type: melee
Sequences:
(sequence_name       activity)
idle 		ACT_VM_IDLE
attack 		ACT_VM_PRIMARYATTACK
draw 		ACT_VM_DRAW
--]]

if SERVER then
	AddCSLuaFile( "shared.lua" )
end

if CLIENT then
	SWEP.PrintName			= "Repair Wrench (Cocaine Factory)"
	SWEP.Slot = 2
	SWEP.SlotPos = 1
	SWEP.DrawAmmo			= false
	SWEP.DrawCrosshair		= false
end

SWEP.Author = "Crap-Head"
SWEP.Instructions = "Left Click: Use repair wrench while aiming at a cocaine entity."

SWEP.ViewModelFOV	= 65
SWEP.ViewModel		= "models/craphead_scripts/the_cocaine_factory/wrench/c_wrench.mdl"
SWEP.WorldModel		= "models/craphead_scripts/the_cocaine_factory/wrench/w_wrench.mdl" 

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "Crap-Head Scripts"

SWEP.UseHands 			= true
SWEP.ViewModelFlip      = false
SWEP.AnimPrefix  		= "stunstick"

SWEP.Primary.Range			= 90
SWEP.Primary.Recoil			= 4.6
SWEP.Primary.Damage			= 2
SWEP.Primary.Cone			= 0.02
SWEP.Primary.NumShots		= 1

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false	
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

function SWEP:Initialize()
	self:SetWeaponHoldType( "melee" )
	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
end 

function SWEP:Deploy()
	return true
end

function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire( CurTime() + 1 )
	self.Weapon:SetNextSecondaryFire( CurTime() + 1 )
	
 	local trace = util.GetPlayerTrace( self.Owner )
 	local tr = util.TraceLine( trace )
	local ent = tr.Entity
	
	self.Weapon:EmitSound( "weapons/stunstick/stunstick_swing1.wav", 100, math.random( 90, 120 ) )
	self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	self.Owner:SetAnimation( PLAYER_ATTACK1 )

	if ( self.Owner:GetPos() - tr.HitPos ):Length() < self.Primary.Range then
		self.Owner:ViewPunch( Angle( math.random( -2, 2 ) * self.Primary.Recoil, math.random( -2, 2 ) * self.Primary.Recoil, 0 ) )
		
		if tr.HitNonWorld then
			if SERVER then
				if table.HasValue( TCF.Config.HealableCocaineEntityList, ent:GetClass() ) then
					if ent:GetClass() == "cocaine_stove" then -- stove entity clamp health
						if ent:GetHP() < TCF.Config.StoveHealth then
							ent:SetHP( math.Clamp( ent:GetHP() + math.random( 10, 20 ), 0, TCF.Config.StoveHealth )  )
						else
							DarkRP.notify( self.Owner, 1, 5,  "Your stove has reached it's maximum health!" )
							return
						end
					elseif ent:GetClass() == "cocaine_extractor" then -- extractor entity clamp health
						if ent:GetHP() < TCF.Config.ExtractorHealth then
							ent:SetHP( math.Clamp( ent:GetHP() + math.random( 10, 20 ), 0, TCF.Config.ExtractorHealth )  )
						else
							DarkRP.notify( self.Owner, 1, 5,  "Your cocaine extractor has reached it's maximum health!" )
							return
						end
					elseif ent:GetClass() == "cocaine_drying_rack" then -- drying rack entity clamp health
						if ent:GetHP() < TCF.Config.DryingRackHealth then
							ent:SetHP( math.Clamp( ent:GetHP() + math.random( 10, 20 ), 0, TCF.Config.DryingRackHealth )  )
						else
							DarkRP.notify( self.Owner, 1, 5,  "Your drying rack has reached it's maximum health!" )
							return
						end
					end
					
					DarkRP.notify( self.Owner, 1, 5,  "Entity has been healed." )
				elseif ent:IsPlayer() then
					ent:TakeDamage( math.random( 12, 16 ), self.Owner ) 
					ent:SetVelocity( self.Owner:GetAngles():Forward() * 50 + self.Owner:GetAngles():Up() * 10 )
				end
			end

			if table.HasValue( TCF.Config.HealableCocaineEntityList, ent:GetClass() ) then
				self.Weapon:EmitSound( "physics/metal/metal_canister_impact_hard".. math.random( 1, 3 ) ..".wav", 100, math.random( 95, 110 ) )
			elseif tr.Entity:IsPlayer() then
				self.Weapon:EmitSound( "physics/body/body_medium_impact_hard1.wav", 100, math.random( 95, 110 ) )
			end
		else
			self.Weapon:EmitSound( "physics/body/body_medium_impact_hard1.wav", 100, math.random(95,110) )
		end
	end
end

function SWEP:SecondaryAttack()
	self:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire( CurTime() + 1 )
	self.Weapon:SetNextSecondaryFire( CurTime() + 1 )
end
--PATH addons/grp_knife/lua/weapons/csgo_butterfly_ultraviolet.lua:
if not file.Exists( "weapons/csgo_baseknife.lua", "LUA" ) then
  SWEP.Spawnable = false
  print( "csgo_butterfly_ultraviolet failed to initialize: csgo_baseknife.lua not found. Did you install the main part?" )
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

SWEP.PrintName      = "Butterfly Knife" .. " | " .. "Ultraviolet"
SWEP.Category       = "CS:GO Knives"

SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

SWEP.ViewModel      = "models/weapons/v_csgo_butterfly.mdl"
SWEP.WorldModel     = "models/weapons/w_csgo_butterfly.mdl"

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
SWEP.Icon = "vgui/entities/csgo_butterfly_ultraviolet.vmt"

--PATH addons/grp_knife/lua/weapons/csgo_m9_lore.lua:
if not file.Exists( "weapons/csgo_baseknife.lua", "LUA" ) then
  SWEP.Spawnable = false
  print( "csgo_m9_lore failed to initialize: csgo_baseknife.lua not found. Did you install the main part?" )
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

SWEP.PrintName      = "M9 Bayonet Knife" .. " | " .. "Lore"
SWEP.Category       = "CS:GO Knives"

SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

SWEP.ViewModel      = "models/weapons/v_csgo_m9.mdl"
SWEP.WorldModel     = "models/weapons/w_csgo_m9.mdl"

SWEP.SkinIndex      = 19
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
SWEP.Icon = "vgui/entities/csgo_m9_lore.vmt"

--PATH gamemodes/darkrp/entities/weapons/gmod_tool/stools/keypad_willox.lua:
if (SERVER) then
	CreateConVar('sbox_maxkeypads', 6)
end

TOOL.Category = "Основное"
TOOL.Name = "Кейпад"
TOOL.Command = nil

TOOL.ClientConVar['weld'] = '1'
TOOL.ClientConVar['freeze'] = '1'

TOOL.ClientConVar['password'] = '1234'
TOOL.ClientConVar['secure'] = '0'

TOOL.ClientConVar['repeats_granted'] = '0'
TOOL.ClientConVar['repeats_denied'] = '0'

TOOL.ClientConVar['length_granted'] = '0.1'
TOOL.ClientConVar['length_denied'] = '0.1'

TOOL.ClientConVar['delay_granted'] = '0'
TOOL.ClientConVar['delay_denied'] = '0'

TOOL.ClientConVar['init_delay_granted'] = '0'
TOOL.ClientConVar['init_delay_denied'] = '0'

TOOL.ClientConVar['key_granted'] = '0'
TOOL.ClientConVar['key_denied'] = '0'

cleanup.Register("keypads")

if CLIENT then
	language.Add("tool.keypad_willox.name", "Keypad")
	language.Add("tool.keypad_willox.0", "Left Click: Create, Right Click: Update")
	language.Add("tool.keypad_willox.desc", "Creates Keypads for secure access")

	language.Add("Undone_Keypad", "Undone Keypad")
	language.Add("Cleanup_keypads", "Keypads")
	language.Add("Cleaned_keypads", "Cleaned up all Keypads")

	language.Add("SBoxLimit_keypads", "You've hit the Keypad limit!")
end

function TOOL:SetupKeypad(ent, pass)
	local data = {
		Password = pass,

		RepeatsGranted = self:GetClientNumber("repeats_granted"),
		RepeatsDenied = self:GetClientNumber("repeats_denied"),

		LengthGranted = self:GetClientNumber("length_granted"),
		LengthDenied = self:GetClientNumber("length_denied"),

		DelayGranted = self:GetClientNumber("delay_granted"),
		DelayDenied = self:GetClientNumber("delay_denied"),

		InitDelayGranted = self:GetClientNumber("init_delay_granted"),
		InitDelayDenied = self:GetClientNumber("init_delay_denied"),

		KeyGranted = self:GetClientNumber("key_granted"),
		KeyDenied = self:GetClientNumber("key_denied"),

		Secure = util.tobool(self:GetClientNumber("secure"))
	}

	ent:SetKeypadOwner(self:GetOwner())
	ent:SetData(data)
end

function TOOL:RightClick(tr)
	if not IsValid(tr.Entity) or tr.Entity:GetClass():lower() != "keypad" then return false end

	if CLIENT  then return true end

	local ply = self:GetOwner()
	local password = tonumber(ply:GetInfo("keypad_willox_password"))

	local spawn_pos = tr.HitPos
	local trace_ent = tr.Entity

	if password == nil or (string.len(tostring(password)) > 4) or (string.find(tostring(password), "0")) then
		ply:PrintMessage(3, "Invalid password!")
		return false
	end
	if trace_ent:GetKeypadOwner() == ply then
		self:SetupKeypad(trace_ent, password)

		return true
	end
end

function TOOL:LeftClick(tr)
	if IsValid(tr.Entity) and tr.Entity:GetClass():lower() == "player" then return false end

	if CLIENT then return true end

	local ply = self:GetOwner()
	local password = self:GetClientNumber("password")

	local spawn_pos = tr.HitPos + tr.HitNormal
	local trace_ent = tr.Entity

	if password == nil or (string.len(tostring(password)) > 4) or (string.find(tostring(password), "0")) then
		ply:PrintMessage(3, "Invalid password!")
		return false
	end

	if not self:GetWeapon():CheckLimit("keypads") then return false end

	local ent = ents.Create("keypad")
	ent:SetPos(spawn_pos)
	ent:SetAngles(tr.HitNormal:Angle())
	ent:Spawn()

	ent:SetPlayer(ply)

	local freeze = util.tobool(self:GetClientNumber("freeze"))
	local weld = util.tobool(self:GetClientNumber("weld"))

	--if freeze or weld then
		local phys = ent:GetPhysicsObject() 

		if IsValid(phys) then
			phys:EnableMotion(false)
		end
	--end

	if weld then
		local weld = constraint.Weld(ent, trace_ent, 0, 0, 0, true, false)
	end

	self:SetupKeypad(ent, password)

	undo.Create("Keypad")
		undo.AddEntity(ent)
		undo.SetPlayer(ply)
	undo.Finish()

	ply:AddCount("keypads", ent)
	ply:AddCleanup("keypads", ent)

	return true
end


if CLIENT then
	local function ResetSettings(ply)
		ply:ConCommand("keypad_willox_repeats_granted 0")
		ply:ConCommand("keypad_willox_repeats_denied 0")
		ply:ConCommand("keypad_willox_length_granted 0.1")
		ply:ConCommand("keypad_willox_length_denied 0.1")
		ply:ConCommand("keypad_willox_delay_granted 0")
		ply:ConCommand("keypad_willox_delay_denied 0")
		ply:ConCommand("keypad_willox_init_delay_granted 0")
		ply:ConCommand("keypad_willox_init_delay_denied 0")
	end

	concommand.Add("keypad_willox_reset", ResetSettings)

	function TOOL.BuildCPanel(CPanel)
		local r, l = CPanel:TextEntry("Access Password", "keypad_willox_password")
		r:SetTall(22)

		CPanel:ControlHelp("Max Length: 4\nAllowed Digits: 1-9")

		CPanel:CheckBox("Secure Mode", "keypad_willox_secure")
		CPanel:CheckBox("Weld", "keypad_willox_weld")
		CPanel:CheckBox("Freeze", "keypad_willox_freeze")

		local ctrl = vgui.Create("CtrlNumPad", CPanel)
			ctrl:SetConVar1("keypad_willox_key_granted")
			ctrl:SetConVar2("Keypad_willox_key_denied")
			ctrl:SetLabel1("Access Granted Key")
			ctrl:SetLabel2("Access Denied Key")
		CPanel:AddPanel(ctrl)

		local granted = vgui.Create("DForm")
			granted:SetName("Access Granted Settings")

			granted:NumSlider("Hold Length:", "keypad_willox_length_granted", 0.1, 10, 2)
			granted:NumSlider("Initial Delay:", "keypad_willox_init_delay_granted", 0, 10, 2)
			granted:NumSlider("Multiple Press Delay:", "keypad_willox_delay_granted", 0, 10, 2)
			granted:NumSlider("Additional Repeats:", "keypad_willox_repeats_granted", 0, 5, 0)
		CPanel:AddItem(granted)

		local denied = vgui.Create("DForm")
			denied:SetName("Access Denied Settings")

				denied:NumSlider("Hold Length:", "keypad_willox_length_denied", 0.1, 10, 2)
				denied:NumSlider("Initial Delay:", "keypad_willox_init_delay_denied", 0, 10, 2)
				denied:NumSlider("Multiple Press Delay:", "keypad_willox_delay_denied", 0, 10, 2)
				denied:NumSlider("Additional Repeats:", "keypad_willox_repeats_denied", 0, 5, 0)
		CPanel:AddItem(denied)

		CPanel:Button("Default Settings", "keypad_willox_reset")

		CPanel:Help("")

		local faq = CPanel:Help("Information")
			faq:SetFont("GModWorldtip")

		CPanel:Help("You can enter your password with your numpad when numlock is enabled!")
	end
end
--PATH addons/111mod/lua/weapons/knife/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.BounceWeaponIcon = false
	SWEP.DrawWeaponInfoBox = false
	SWEP.PrintName = "Нож"
	SWEP.BobScale = 0
	SWEP.SwayScale = 0
	SWEP.ViewbobIntensity = 1
	SWEP.ViewbobEnabled = true

   SWEP.EquipMenuData = {
      type = "item_weapon",
      desc = "knife_desc"
   };

   SWEP.Icon = "vgui/ttt/icon_knife"
end

SWEP.SpeedDec = 0
SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.SWBWeapon = true
SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.Category = "Weapons"
SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel	= "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel	= "models/weapons/w_knife_t.mdl"
SWEP.UseHands = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= -1					// Size of a clip
SWEP.Primary.DefaultClip	= -1				// Default number of bullets in a clip
SWEP.Primary.Automatic		= true				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1				// Size of a clip
SWEP.Secondary.DefaultClip	= -1				// Default number of bullets in a clip
SWEP.Secondary.Automatic	= true				// Automatic/Semi Auto
SWEP.Secondary.Ammo			= "none"

SWEP.HitSound = Sound("weapons/tfa_csgo/knife/knife_hit3.wav")
SWEP.SwingSound = Sound("weapons/tfa_csgo/knife/knife_slash1.wav")
SWEP.HitSoundElse = Sound("weapons/tfa_csgo/knife/knife_hit_03.wav")

SWEP.Kind = WEAPON_EQUIP
SWEP.CanBuy = {ROLE_TRAITOR} -- only traitors can buy
SWEP.LimitedStock = true -- only buyable once
SWEP.WeaponID = AMMO_KNIFE

SWEP.IsSilent = true

function SWEP:IsEquipment() -- I have no idea what I'm doing, help
	return WEPS.IsEquipment(self)
end

function SWEP:Initialize()
	self:SetHoldType("knife")
end

local vm, CT

function SWEP:Deploy()
	self:SendWeaponAnim(ACT_VM_DRAW)

	self:SetNextPrimaryFire(CurTime() + 0.7)
	return true
end

function SWEP:Reload()
end

function SWEP:Think()
	if self.DamageTime and CurTime() > self.DamageTime then
		if SERVER then
			self.Owner:LagCompensation(true)
		end

		self:Damage()

		if SERVER then
			self.Owner:LagCompensation(false)
		end

		self.DamageTime = nil
	end
end

function SWEP:PrimaryAttack()
	self.DamageMin = 10
	self.DamageMax = 10

	self.Owner:SetAnimation(PLAYER_ATTACK1)
	CT = CurTime()

	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

	if IsFirstTimePredicted() then
		self:EmitSound(self.SwingSound, 70, 100)
		self.DamageTime = CT + 0.15
	end

	self.Owner:SetDTFloat(0, 0.5)
	self:SetNextPrimaryFire(CT + 0.55)
	self:SetNextSecondaryFire(CT + 0.55)
end

function SWEP:SecondaryAttack()
	self.DamageMin = 40
	self.DamageMax = 50

	self.Owner:SetAnimation(PLAYER_ATTACK1)
	CT = CurTime()

	self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)

	if IsFirstTimePredicted() then
		self:EmitSound(self.SwingSound, 70, 100)
		self.DamageTime = CT + 0.15
	end

	self.Owner:SetDTFloat(0, 0.5)
	self:SetNextPrimaryFire(CT + 1)
	self:SetNextSecondaryFire(CT + 1)
end

local td = {}
local tr, ent

function SWEP:Damage()
	td.start = self.Owner:GetShootPos()
	td.endpos = td.start + self.Owner:EyeAngles():Forward() * 50
	td.filter = self.Owner
	td.mins = Vector(-6, -6, -6)
	td.maxs = Vector(6, 6, 6)

	tr = util.TraceHull(td)

	if tr.Hit then
		ent = tr.Entity

		if IsValid(ent) then
			if ent:IsPlayer() or ent:IsNPC() then
				if SERVER then
					ent:TakeDamage(math.random(self.DamageMin, self.DamageMax), self.Owner, self.Owner)
				end

				ParticleEffect("blood_impact_red_01", tr.HitPos, tr.HitNormal:Angle(), ent)
				self:EmitSound(self.HitSound, 80, 100)
			else
				if SERVER then
					ent:TakeDamage(math.random(self.DamageMin, self.DamageMax), self.Owner, self.Owner)

					if ent:GetClass() == "func_breakable_surf" then
						ent:Input("Shatter", NULL, NULL, "")
						self:EmitSound("physics/glass/glass_impact_bullet1.wav", 80, math.random(95, 105))
					end
				end

				self:EmitSound(self.HitSoundElse, 80, 100)
			end
		else
			self:EmitSound(self.HitSoundElse, 80, 100)
		end
	end
end

if CLIENT then
	local wm, pos, ang

	function SWEP:DrawWorldModel()
		self:DrawModel()
	end
end

function SWEP:Holster(wep)
	self:OnRemove()

	return true
end

if CLIENT then
	SWEP.BlendPos = Vector(0, 0, 0)
	SWEP.BlendAng = Vector(0, 0, 0)
	SWEP.OldDelta = Angle(0, 0, 0)
	SWEP.AngleDelta = Angle(0, 0, 0)

	local reg = debug.getregistry()
	local Right = reg.Angle.Right
	local Up = reg.Angle.Up
	local Forward = reg.Angle.Forward
	local RotateAroundAxis = reg.Angle.RotateAroundAxis
	local GetVelocity = reg.Entity.GetVelocity
	local Length = reg.Vector.Length

	local Ang0, curang, curviewbob = Angle(0, 0, 0), Angle(0, 0, 0), Angle(0, 0, 0)
	function SWEP:CalcView(ply, pos, ang, fov)
		FT, CT = FrameTime(), CurTime()

		if self.ViewbobEnabled then
			ws = self.Owner:GetWalkSpeed()
			vel = Length(GetVelocity(self.Owner))

			if self.Owner:OnGround() and vel > ws * 0.3 then
				if vel < ws * 1.2 then
					cos1 = math.cos(CT * 15)
					cos2 = math.cos(CT * 12)
					curviewbob.p = cos1 * 0.15
					curviewbob.y = cos2 * 0.1
				else
					cos1 = math.cos(CT * 20)
					cos2 = math.cos(CT * 15)
					curviewbob.p = cos1 * 0.25
					curviewbob.y = cos2 * 0.15
				end
			else
				curviewbob = LerpAngle(FT * 10, curviewbob, Ang0)
			end
		end

		return pos, ang + curviewbob * self.ViewbobIntensity, fov
	end

	local Vec0 = Vector(0, 0, 0)
	local TargetPos, TargetAng, cos1, sin1, tan, ws, rs, mod, vel, FT, sin2, delta

	local SP = game.SinglePlayer()
	local PosMod, AngMod = Vector(0, 0, 0), Vector(0, 0, 0)
	local CurPosMod, CurAngMod = Vector(0, 0, 0), Vector(0, 0, 0)

	function SWEP:PreDrawViewModel()
		CT = UnPredictedCurTime()
		vm = self.Owner:GetViewModel()

		EA = EyeAngles()
		FT = FrameTime()

		delta = Angle(EA.p, EA.y, 0) - self.OldDelta
		delta.p = math.Clamp(delta.p, -10, 10)

		self.OldDelta = Angle(EA.p, EA.y, 0)
		self.AngleDelta = LerpAngle(math.Clamp(FT * 10, 0, 1), self.AngleDelta, delta)
		self.AngleDelta.y = math.Clamp(self.AngleDelta.y, -10, 10)

		vel = Length(GetVelocity(self.Owner))
		ws = self.Owner:GetWalkSpeed()

		PosMod, AngMod = Vec0 * 1, Vec0 * 1

		if vel < 10 or not self.Owner:OnGround() then
			cos1, sin1 = math.cos(CT), math.sin(CT)
			tan = math.atan(cos1 * sin1, cos1 * sin1)

			AngMod.x = AngMod.x + tan * 1.15
			AngMod.y = AngMod.y + cos1 * 0.4
			AngMod.z = AngMod.z + tan

			PosMod.y = PosMod.y + tan * 0.2
		elseif vel > 10 and vel < ws * 1.2 then
			mod = 6 + ws / 130
			mul = math.Clamp(vel / ws, 0, 1)
			sin1 = math.sin(CT * mod) * mul
			cos1 = math.cos(CT * mod) * mul
			tan1 = math.tan(sin1 * cos1) * mul

			AngMod.x = AngMod.x + tan1
			AngMod.y = AngMod.y - cos1
			AngMod.z = AngMod.z + cos1
			PosMod.x = PosMod.x - sin1 * 0.4
			PosMod.y = PosMod.y + tan1 * 1
			PosMod.z = PosMod.z + tan1 * 0.5
		elseif (vel > ws * 1.2 and self.Owner:KeyDown(IN_SPEED)) or vel > ws * 3 then
			rs = self.Owner:GetRunSpeed()
			mod = 7 + math.Clamp(rs / 100, 0, 6)
			mul = math.Clamp(vel / rs, 0, 1)
			sin1 = math.sin(CT * mod) * mul
			cos1 = math.cos(CT * mod) * mul
			tan1 = math.tan(sin1 * cos1) * mul

			AngMod.x = AngMod.x + tan1 * 0.2
			AngMod.y = AngMod.y - cos1 * 1.5
			AngMod.z = AngMod.z + cos1 * 3
			PosMod.x = PosMod.x - sin1 * 1.2
			PosMod.y = PosMod.y + tan1 * 1.5
			PosMod.z = PosMod.z + tan1
		end

		FT = FrameTime()

		CurPosMod = LerpVector(FT * 10, CurPosMod, PosMod)
		CurAngMod = LerpVector(FT * 10, CurAngMod, AngMod)
	end

	function SWEP:GetViewModelPosition(pos, ang)
		RotateAroundAxis(ang, Right(ang), CurAngMod.x + self.AngleDelta.p)
		RotateAroundAxis(ang, Up(ang), CurAngMod.y + self.AngleDelta.y * 0.3)
		RotateAroundAxis(ang, Forward(ang), CurAngMod.z + self.AngleDelta.y * 0.3)

		pos = pos + (CurPosMod.x + self.AngleDelta.y * 0.1) * Right(ang)
		pos = pos + (CurPosMod.y + self.BlendPos.y) * Forward(ang)
		pos = pos + (CurPosMod.z + self.BlendPos.z - self.AngleDelta.p * 0.1) * Up(ang)

		return pos, ang
	end
end

--PATH addons/weaponandcontent/lua/weapons/m249/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "M249"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-3.743, -1.346, 1.539)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(3.779, -5.84, 0.165)
	SWEP.SprintAng = Vector(-8.655, 57.168, 0)
	
	SWEP.ZoomAmount = 15
	
	SWEP.IconLetter = "z"
	--killicon.AddFont("swb_m249", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
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
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel				= "models/weapons/2_mach_m249para.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_mach_m249para.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 100
SWEP.Primary.DefaultClip	= 100
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.FireDelay = 0.08
SWEP.FireSound = Sound("Alt_Weapon_M249.1")	
SWEP.Recoil = 0.45
SWEP.Chamberable = false

SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 21
SWEP.DeployTime = 1
--PATH addons/m9k/lua/weapons/m9k_colt1911/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_colt1911/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_colt1911") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Colt 1911"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 43			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/f_dmgf_co1911.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/s_dmgf_co1911.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Dmgfok_co1911.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 700			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 7		-- Size of a clip
SWEP.Primary.DefaultClip		= 45		-- Bullets you start with
SWEP.Primary.KickUp				= 0.4		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Pistol"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 19	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (-2.6004, -1.3877, 1.1892)
SWEP.IronSightsAng = Vector (0.3756, -0.0032, 0.103)
SWEP.SightsPos = Vector (-2.6004, -1.3877, 1.1892)
SWEP.SightsAng = Vector (0.3756, -0.0032, 0.103)
SWEP.RunSightsPos = Vector(3.444, -7.823, -6.27)
SWEP.RunSightsAng = Vector(60.695, 0, 0)
-- SWEP.RunSightsPos = Vector (-0.7883, 0, 2.4235)
-- SWEP.RunSightsAng = Vector (-14.417, -0.7137, 0)

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
--PATH addons/m9k/lua/weapons/m9k_f2000/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_f2000/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_f2000") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then 
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Assault Rifles"
SWEP.Author				= "iron angles by Mr Fokkusu"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "F2000"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 27			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- Set false if you want no crosshair from hip
SWEP.XHair					= true		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.Weight				= 30			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.BoltAction				= false		-- Is this a bolt action rifle?
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_tct_f2000.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_fn_f2000.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_F2000.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 850		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= 0.2				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.2			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.2		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
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
SWEP.Primary.Damage		= 19	--base damage per bullet
SWEP.Primary.Spread		= .001	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(3.499, 0, 1.08)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(3.499, 0, 1.08)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(-7.705, -2.623, 1.475)
SWEP.RunSightsAng = Vector(-11.476, -55.083, -2.296)

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
--PATH addons/m9k/lua/weapons/m9k_g3a3/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_g3a3/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_g3a3") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "HK G3A3"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 30			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_hk_g3_rif.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_hk_g3.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true	
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("hk_g3_weapon.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 650			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 20		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.2		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.25		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 24	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.419, -2.069, 1.498)
SWEP.IronSightsAng = Vector(-0.109, -0.281, 0)
SWEP.SightsPos = Vector(-2.419, -2.069, 1.498)
SWEP.SightsAng = Vector(-0.109, -0.281, 0)
SWEP.RunSightsPos = Vector(3.384, -3.044, -0.264)
SWEP.RunSightsAng = Vector(-7.402, 43.334, 0)

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
--PATH addons/m9k/lua/weapons/m9k_intervention/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_intervention/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_intervention") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Sniper Rifles"
SWEP.Author				= "iron angles and models hexed and converted to gmod my Mr Fokkusu"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Intervention"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 42			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_snip_int.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_snip_int.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_INT.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 55		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 5		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .6			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .4		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Rifle"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.ScopeZoom			= 10	
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

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 100	--base damage per bullet
SWEP.Primary.Spread		= .001	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector (2.2263, -0.0007, 0.115)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (2.2263, -0.0007, 0.115)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-2.3095, -3.0514, 1.3965)
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
--PATH addons/m9k/lua/weapons/m9k_ithacam37/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_ithacam37/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_ithacam37") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Ithaca M37"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 22			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_ithaca_m37shot.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_ithaca_m37.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_shotty_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("IthacaM37.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 60		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 6			-- Size of a clip
SWEP.Primary.DefaultClip		= 30	-- Default number of bullets in a clip
SWEP.Primary.KickUp				= .9				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.6		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.6	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Buckshot"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 
SWEP.ShellTime			= .4

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 9		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 12	-- Base damage per bullet
SWEP.Primary.Spread		= .023	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .023	-- Ironsight accuracy, should be the same for shotguns
-- Because irons don't magically give you less pellet spread!

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(2.16, -1.429, 0.6)
SWEP.IronSightsAng = Vector(3, 0, 0)
SWEP.SightsPos = Vector(2.16, -1.429, 0.6)
SWEP.SightsAng = Vector(3, 0, 0)
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
--PATH addons/m9k/lua/weapons/m9k_m3/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_m3/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_m3") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Shotguns"
SWEP.Author				= "iron angles and models hexed and converted to gmod my Mr Fokkusu"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Benelli M3"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 24			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_benelli_m3_s90.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_benelli_m3.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_shotty_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("BenelliM3.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 70		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 8			-- Size of a clip
SWEP.Primary.DefaultClip		= 30	-- Default number of bullets in a clip
SWEP.Primary.KickUp				= 0.8			-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Buckshot"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.ShellTime			= .45

SWEP.Primary.NumShots	= 9		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 10	-- Base damage per bullet
SWEP.Primary.Spread		= .0326	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .0326	-- Ironsight accuracy, should be the same for shotguns
-- Because irons don't magically give you less pellet spread!

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(2.279, -1.007, 1.302)
SWEP.IronSightsAng = Vector(0.47, -0.024, 0)
SWEP.SightsPos = Vector(2.279, -1.007, 1.302)
SWEP.SightsAng = Vector(0.47, -0.024, 0)
SWEP.RunSightsPos = Vector(-7.639, -7.796, 0.865)
SWEP.RunSightsAng = Vector(-17.362, -69.724, 0)


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
--PATH addons/m9k/lua/weapons/m9k_mossberg590/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_mossberg590/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

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
SWEP.Primary.Ammo			= "Buckshot"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 
SWEP.ShellTime			= .5

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 9		-- How many bullets to shoot per trigger pull, AKA pellets
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
--PATH addons/m9k/lua/weapons/m9k_mp5sd/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_mp5sd") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "MP5SD"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 47			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_hkmp5sd.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_hk_mp5sd.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base" 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_hkmp5sd.single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 700			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 23	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.284, -1.446, 0.884)
SWEP.IronSightsAng = Vector(2.368, 0, 0)
SWEP.SightsPos = Vector(-2.284, -1.446, 0.884)
SWEP.SightsAng = Vector(2.368, 0, 0)
SWEP.RunSightsPos = Vector(3.858, -1.655, -0.866)
SWEP.RunSightsAng = Vector(-4.634, 49.493, 0)



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
--PATH addons/m9k/lua/weapons/m9k_smgp90/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_smgp90/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_smgp90") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "FN P90"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 51			-- Position in the slot
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

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_p90_smg.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_fn_p90.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("P90_weapon.single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 900			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 50		-- Size of a clip
SWEP.Primary.DefaultClip		= 100		-- Bullets you start with
SWEP.Primary.KickUp				= 0.6		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.4		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 18	-- Base damage per bullet
SWEP.Primary.Spread		= .032	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .02 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(2.707, -2.46, 2.219)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(2.707, -2.46, 2.219)
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
--PATH addons/m9k/lua/weapons/m9k_tec9/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_tec9/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_tec9") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "TEC-9"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 53			-- Position in the slot
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

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_tec_9_smg.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_intratec_tec9.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_Tec9.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 825			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 32		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 17	-- Base damage per bullet
SWEP.Primary.Spread		= .029	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .019 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.314, -1.216, 2.135)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(4.314, -1.216, 2.135)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(-5.434, -1.181, 0.393)
SWEP.RunSightsAng = Vector(-6.89, -42.166, 0)

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
--PATH addons/m9k/lua/weapons/m9k_ump45/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_ump45") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "HK UMP45"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 55			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_hk_ump_45.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_hk_ump45.mdl"	-- Weapon world model 
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("m9k_hk_ump45.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 675			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 25		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.1		-- Maximum up recoil (rise)
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
SWEP.Primary.Damage		= 23	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(2.826, -1.601, 1.259)
SWEP.IronSightsAng = Vector(-0.055, 0, 0)
SWEP.SightsPos = Vector(2.826, -1.601, 1.259)
SWEP.SightsAng = Vector(-0.055, 0, 0)
SWEP.RunSightsPos = Vector(-3.386, -4.488, 1.18)
SWEP.RunSightsAng = Vector(-17.362, -48.78, 0)

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
--PATH addons/m9k/lua/weapons/m9k_val/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_val/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_val") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "AS VAL"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
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

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_dmg_vally.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_dmg_vally.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Dmgfok_vally.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 700			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 20		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.25		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.25		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 22	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (-2.2442, -1.8353, 1.0599)
SWEP.IronSightsAng = Vector (1.0513, 0.0322, 0)
SWEP.SightsPos = Vector (-2.2442, -1.8353, 1.0599)
SWEP.SightsAng = Vector (1.0513, 0.0322, 0)
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
--PATH addons/rptip/lua/weapons/rp_box_in_hands/shared.lua:
if CLIENT then
    SWEP.PrintName = "Коробка"
    SWEP.Slot = 1
    SWEP.SlotPos = 5
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end
 
SWEP.Author = "Dick Inside Head"
SWEP.Instructions = ""
SWEP.Contact = "https://vk.com/gmodgambitrp"
SWEP.Purpose = ""
 
SWEP.HoldType = "duel"
SWEP.ViewModelFOV = 20
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/cstrike/c_pist_fiveseven.mdl"
SWEP.WorldModel = "models/props_lab/headcrabprep.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
    ["v_weapon.FIVESEVEN_PARENT"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}
 
 
 
 
SWEP.DrawCrosshair          = false
 
SWEP.Spawnable          = true
SWEP.AdminSpawnable     = true
 
SWEP.Category = "GambitRP"
 
SWEP.Sound = Sound("physics/wood/wood_box_impact_hard3.wav")
 
SWEP.Primary.DefaultClip = -1;
SWEP.Primary.Automatic = false;
SWEP.Primary.ClipSize = -1;
SWEP.Primary.Damage = 0;
SWEP.Primary.Delay = 1.5;
SWEP.Primary.Ammo = "";
SWEP.SwayScale  = 2.3
SWEP.BobScale   = 2.1
 
SWEP.VElements = {
--  ["1++"] = { type = "Model", model = "models/props/cs_office/coffee_mug.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-1.168, 6.057, -0.262), angle = Angle(0, -179.637, 1.399), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["element_name"] = { type = "Model", model = "models/props_junk/cardboard_box003b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(80, 15, 5), angle = Angle(-20, 0, 160), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, skin = 0, bodygroup = {} },
--  ["1+"] = { type = "Model", model = "models/food/hotdog.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.413, -0.232, -6.4), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
--  ["1"] = { type = "Model", model = "models/props/cs_italy/bananna.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-1.223, -6.39, -0.225), angle = Angle(97.333, -180, -3.046), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
 
 
SWEP.WElements = {
    --["1"] = { type = "Model", model = "models/props/cs_italy/bananna.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-1.38, -5.041, 0.246), angle = Angle(97.333, -180, -3.046), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["element_name"] = { type = "Model", model = "models/props_junk/cardboard_box003b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2, 12, -1), angle = Angle(0, -10, 190), size = Vector(0.65, 0.65, 0.65), color = Color(255, 255, 255, 255), surpresslightning = false,  skin = 0, bodygroup = {} },
    --["1+"] = { type = "Model", model = "models/food/hotdog.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.653, 0.654, -6.133), angle = Angle(0, -1.8, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    --["1++"] = { type = "Model", model = "models/props/cs_office/coffee_mug.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-1.038, 6.053, -0.09), angle = Angle(0, -179.637, 1.399), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
 
 
function SWEP:GetViewModelPosition( pos, ang )
 
    local mypitch = self.Owner:EyeAngles().p
    if mypitch <-20 then
        ang:RotateAroundAxis( ang:Right(), ang.p + 20 )
        elseif mypitch > 90 then
            ang:RotateAroundAxis( ang:Right(), ang.p - 90)
        end
 
        pos = pos + ang:Forward() * 0
        pos = pos + ang:Up() * 0
        pos = pos + ang:Right() * 0
 
        ang:RotateAroundAxis(ang:Up(), 0)
 
        self.ViewModelPos = {pos, ang}
 
   
   
end
 
 
function SWEP:Deploy()
   
    self:SetHoldType( self.HoldType )
--self:SendWeaponAnim(ACT_VM_HOLSTER);
    self:SendWeaponAnim(ACT_VM_IDLE);
end
 
function SWEP:PrimaryAttack()
   
end
 
function SWEP:DrawHUD()
end
function SWEP:SecondaryAttack()  
end
 
function SWEP:Initialize()
 
 
    if CLIENT then
   
        self.VElements = table.FullCopy( self.VElements )
        self.WElements = table.FullCopy( self.WElements )
        self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )
 
        self:CreateModels(self.VElements) // create viewmodels
        self:CreateModels(self.WElements) // create worldmodels
       
        if IsValid(self.Owner) then
            local vm = self.Owner:GetViewModel()
            if IsValid(vm) then
                self:ResetBonePositions(vm)    
               
            end
        end
       
    end
 
end
function SWEP:Holster()
    --if ( self.NextSecondaryAttack > CurTime() ) then return end
 	local ply = self.Owner
    if CLIENT and IsValid(self.Owner) then
        local vm = self.Owner:GetViewModel()
        if IsValid(vm) then
            self:ResetBonePositions(vm)
        end
    end

    timer.Simple( 0.01, function()
        if ( !SERVER ) then return end
        if IsValid(ply) and ply:GetNW2Bool("TakeBox", false) == true then
	        ply:EmitSound( "physics/wood/wood_crate_break"..math.random(1,5)..".wav")
	        ply:SetNW2Bool("TakeBox", false)
			ply:SetWalkSpeed(ply.OldWalkSpeed)
			ply:SetRunSpeed(ply.OldRunSpeed)
			ply:SetMaxSpeed(ply.OldMaxSpeed)
			ply:SetCanWalk( true )
			ply:SendMessageFD(Color(0,255,128), "["..rp_box.NPC_name.."]", Color(255,255,255), "Ты сломал коробку! Не пытайся использовать оружия с ней!")
			ply:StripWeapon("rp_box_in_hands")
		end
    end )

    return true
end
 
SWEP.NextSecondaryAttack = 0
 
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
--PATH addons/accessory/lua/weapons/sh_accessory_changer.lua:
AddCSLuaFile()

if (CLIENT) then
	SWEP.PrintName = "Accessory Change"
	SWEP.DrawWeaponInfoBox = false
end

SWEP.Category = "Other"
SWEP.Spawnable = false

SWEP.ViewModel = "models/weapons/v_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

function SWEP:Initialize()
	self.PrintName = SH_ACC.Language.accessory_changer
	self:SetHoldType("normal")
end

function SWEP:PrimaryAttack()
	if (SERVER) then
		SH_ACC:Show(self.Owner)
	end
end

function SWEP:SecondaryAttack()
	self:PrimaryAttack()
end

if (CLIENT) then
	function SWEP:PreDrawViewModel()
		render.SetBlend(0)
	end

	function SWEP:PostDrawViewModel()
		render.SetBlend(1)
	end

	function SWEP:DrawWorldModel()
	end
end
--PATH addons/deceive/lua/weapons/swep_disguise_briefcase/shared.lua:

AddCSLuaFile("shared.lua")

SWEP.Author = "tenrys"
SWEP.Contact = "https://tenrys.pw"
SWEP.ClassName = "swep_disguise_briefcase"
SWEP.PrintName = "Маскировка"
SWEP.Category = "Other"

SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.DrawWeaponInfoBox = true
SWEP.WorldModel = "models/weapons/w_suitcase_passenger.mdl"
SWEP.HoldType = "normal"

SWEP.SlotPos = 6
SWEP.Slot = 5

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Weight = 1

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

if CLIENT then
	local L
	function SWEP:PrintWeaponInfo(x, y, a)
		if not L then
			L = deceive.Translate
			return
		end
		if not self.DrawWeaponInfoBox then return end

		if not self.InfoMarkup then
			local str
			local titleColor = "<color=190, 113, 226, 255>"
			local textColor = "<color=209, 172, 226, 255>"
			local helpColor = "<color=245, 225, 245, 255>"

			str = "<font=HudSelectionText>"
			str = str .. titleColor .. L"swep_disguise_briefcase_title" .. "\n\n" .. "</color>"
			-- str = str .. titleColor .. "Deceive - Disguise Briefcase\n\n" .. "</color>"
			str = str .. textColor .. L"swep_disguise_briefcase_text" .. "\n\n".. "</color>"
			-- str = str .. textColor .. "Disguise into anyone with the provided set of clothes contained in this briefcase, deceive your surroundings and cause mayhem in the world!\n\n".. "</color>"
			str = str .. helpColor .. L"swep_disguise_briefcase_help1" .. "\n" .. "</color>"
			-- str = str .. helpColor .. "Left Click: Open Disguise Menu\n" .. "</color>"
			str = str .. helpColor .. L"swep_disguise_briefcase_help2" .. "</color>"
			-- str = str .. helpColor .. "Reload: Clear Disguise" .. "</color>"
			str = str .. "</font>"

			self.InfoMarkup = markup.Parse(str, 250)
		end

		surface.SetDrawColor(60, 56, 53, a)
		surface.SetTexture(self.SpeechBubbleLid)

		surface.DrawTexturedRect(x, y - 64 - 5, 128, 64)
		draw.RoundedBox(8, x - 5, y - 6, 260, self.InfoMarkup:GetHeight() + 18, Color(63, 52, 61, a))

		self.InfoMarkup:Draw(x + 5, y + 5, nil, nil, a)
	end

	local mat = Material("spawnicons/models/weapons/w_suitcase_passenger_128.png")
	function SWEP:DrawWeaponSelection(x, y, w, h, a)
		if mat:IsError() then
			local pnl = vgui.Create("SpawnIcon")

			pnl:SetSize(128, 128)
			pnl:InvalidateLayout(true)
			pnl:SetModel("models/weapons/w_suitcase_passenger.mdl", 0, 0)

			timer.Simple(0, function()
				pnl:Remove()
				self.Generated = true
			end)

			return
		end

		local fsin = 0

		if self.BounceWeaponIcon == true then
			fsin = math.sin(CurTime() * 10) * 5
		end

		surface.SetMaterial(mat)
		surface.SetDrawColor(Color(255, 255, 255, 255))
		local iconW = 128
		surface.DrawTexturedRect(x + w * 0.5 - iconW * 0.5 + fsin, y + h * 0.5 - iconW * 0.5 - fsin - 20, iconW - fsin * 2, iconW + fsin)

		self:PrintWeaponInfo(x + w + 20, y + h * 0.95, a)
	end
end

function SWEP:DrawWorldModel()
	local entOwner = self:GetOwner()
	if not entOwner:IsValid() then
		self:SetRenderOrigin()
		self:SetRenderAngles()
		self:DrawModel()
		return
	end

	self:RemoveEffects(EF_BONEMERGE_FASTCULL)
	self:RemoveEffects(EF_BONEMERGE)
	local iHandBone = entOwner:LookupBone("ValveBiped.Bip01_R_Hand")
	if not iHandBone then
		return
	end

	local vecBone, angBone = entOwner:GetBonePosition(iHandBone)
	if false then
		local forward = angBone:Forward()
		angBone:RotateAroundAxis(forward, 70)
		local right = angBone:Right()
		angBone:RotateAroundAxis(right, -160)
		local up = angBone:Up()
		angBone:RotateAroundAxis(up, 30)
		vecBone:Sub(angBone:Up() * 2.5)
		vecBone:Sub(angBone:Right() * 0)
	else
		local forward = angBone:Forward()
		angBone:RotateAroundAxis(forward, 90)
		local right = angBone:Right()
		angBone:RotateAroundAxis(right, 90)
		local up = angBone:Up()
		angBone:RotateAroundAxis(up, 90)
		vecBone:Sub(angBone:Up() * 5)
		vecBone:Sub(angBone:Right() * -.5)
	end

	self:SetRenderOrigin(vecBone)
	self:SetRenderAngles(angBone)
	self:DrawModel()
end

function SWEP:DrawWorldModelTranslucent()
end

function SWEP:CanPrimaryAttack()
	return true
end

function SWEP:CanSecondaryAttack()
	return false
end

function SWEP:ShouldDropOnDie()
	return false
end

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
	self:DrawShadow(false)
	-- if CLIENT and deceive.Translate then
		-- self.PrintName = deceive.Translate("swep_disguise_briefcase")
	-- end
end

function SWEP:Think()
end

function SWEP:Deploy()
	self.User = self.Owner
	self.Owner.Deceive_Using = self
	return true
end

function SWEP:Holster()
	self.Owner.Deceive_Using = nil
	self.User = nil
	return true
end

function SWEP:PreDrawViewModel()
	return true
end

function SWEP:OnDrop()
end

function SWEP:PrimaryAttack()
	if self:GetOwner():InVehicle() then
		return
	end

	if SERVER then
		net.Start("deceive.interface")
			net.WriteUInt(self:EntIndex(), 32)
		net.Send(self.Owner)
	end

	self:SetNextPrimaryFire(CurTime() + 1)
end

function SWEP:SecondaryAttack()
	if not IsFirstTimePredicted() then
		return
	end

end

function SWEP:Reload()
	RunConsoleCommand(deceive.Config and deceive.Config.UndisguiseCommand or "undisguise")
end


--PATH addons/weaponandcontent/lua/weapons/usp/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "USP"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(1.976, -0.042, 1.34)
	SWEP.AimAng = Vector(0.425, 0, 0)
	
	SWEP.SprintPos = Vector(-3.997, -6.459, -6.159)
	SWEP.SprintAng = Vector(61.365, 0, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "y"
	--killicon.AddFont("swb_usp", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_pistol_med"
	SWEP.MuzzleEffectSupp = "swb_silenced_small"
end
SWEP.CanPenetrate = false
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
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel				= "models/weapons/2_pist_usp.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_pist_usp.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 12
SWEP.Primary.DefaultClip	= 12
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Pistol"

SWEP.FireDelay = 0.14
SWEP.FireSound = Sound("Alt_Weapon_USP.1")
SWEP.FireSoundSuppressed = Sound("Alt_Weapon_USP.2")
SWEP.Recoil = 0.4
SWEP.DryFire = true

SWEP.Suppressable = true

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 20
SWEP.DeployTime = 1
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
--PATH addons/111mod/lua/weapons/weapon_fidget.lua:

AddCSLuaFile()

SWEP.PrintName			= "Спиннер"	

SWEP.Author = "swamponions"
SWEP.Purpose = ""
SWEP.Instructions		= "Primary: Flick\nSecondary: Flip\nReload: Customize"
SWEP.Category = "GambitRP"

SWEP.Slot				= 1
SWEP.SlotPos			= 99

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 85
SWEP.ViewModelFlip = false

SWEP.ViewModel 				= Model("models/props_workshop/fidget_spinner.mdl")
SWEP.WorldModel 			= Model("models/props_workshop/fidget_spinner.mdl")

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.ClipSize			= -1
SWEP.Primary.Damage				= -1
SWEP.Primary.DefaultClip		= -1
SWEP.Primary.Automatic			= false
SWEP.Primary.Ammo				= "none"

SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= -1
SWEP.Secondary.Damage			= -1
SWEP.Secondary.Automatic		= false
SWEP.Secondary.Ammo				= "none"

function SWEP:DrawWorldModel()
	local ply = self:GetOwner()

	if(IsValid(ply))then

		self:FidgetThink()

		local bn = ply.IsPony and ply:IsPony() and "LrigScull" or "ValveBiped.Bip01_R_Hand"
		local bon = ply:LookupBone(bn) or 0

		local opos = self:GetPos()
		local oang = self:GetAngles()
		local bp,ba = ply:GetBonePosition(bon)
		if(bp)then opos = bp end
		if(ba)then oang = ba end
		if ply.IsPony and ply:IsPony() then
			opos = opos + oang:Forward()*9.5
			opos = opos + oang:Right()*0.7
			oang:RotateAroundAxis(oang:Up(), 30)
		else
			opos = opos + oang:Right()*2
			opos = opos + oang:Forward()*5
			opos = opos + oang:Up()*-2
			oang:RotateAroundAxis(oang:Forward(), 60)
		end
		oang:RotateAroundAxis(oang:Forward(), self:GetFlippage())
		oang:RotateAroundAxis(oang:Right(), self.spinpos or 0)
		self:SetupBones()

		oscl = Vector(0.8,0.8,0.8)

		local mrt = self:GetBoneMatrix(0)
		if(mrt)then
			mrt:SetTranslation(opos)
			mrt:SetAngles(oang)
			mrt:SetScale(oscl)
			self:SetBoneMatrix(0, mrt )
		end

		local mrt = self:GetBoneMatrix(1)
		if(mrt)then
			mrt:SetTranslation(opos)
			mrt:SetAngles(oang)
			mrt:SetScale(oscl)
			self:SetBoneMatrix(1, mrt )
		end
	end

	local v = ply.CustomFidgetColor or Vector(1,0.5,0)
	render.SetColorModulation(v.x,v.y,v.z)
	self:DrawModel()
	render.SetColorModulation(1,1,1)
end

if CLIENT then
	FidgetCurTimeToSysTime = nil

	function SWEP:FidgetThink()
		if FidgetCurTimeToSysTime==nil then	FidgetCurTimeToSysTime = CurTime()-SysTime() end
		local t = SysTime() + FidgetCurTimeToSysTime
		if self.LastFidgetThink==nil then self.LastFidgetThink=t end
		local spinvel = math.max(0, ((self.FidgetFlick or 0) - t) * 60)
		self.spinpos = (self.spinpos or 0) + (spinvel * (t - self.LastFidgetThink))
		self.LastFidgetThink=t
		self.RPMdisplay = math.floor(spinvel/6.0)
	end

	function SWEP:DrawHUD()
		local d = self.RPMdisplay or 0
		if d > 0 then
			draw.WordBox(8, ScrW()*0.91, ScrH()-40, tostring(d).." Скорость", "Trebuchet24", Color(0,0,0,100), Color(255,255,255,255))
		end
	end

	net.Receive("FidgetFlick", function()
		local ent = net.ReadEntity()
		ent.FidgetFlick = net.ReadFloat()
	end)

	net.Receive("FidgetFlip", function()
		local ent = net.ReadEntity()
		ent.fliptime = SysTime()
	end)

	function SWEP:GetFlippage()
		return (math.cos(math.pi*math.Clamp((SysTime() - (self.fliptime or 0))*1.25,0,1))+1)*0.5*360
	end

else
	util.AddNetworkString("FidgetFlick")
	util.AddNetworkString("FidgetFlip")
end

function SWEP:PreDrawViewModel( vm, wp, ply )
	local v = ply.CustomFidgetColor or Vector(1,0.5,0)
	render.SetColorModulation(v.x,v.y,v.z)
end

function SWEP:GetViewModelPosition( pos, ang )
	self:FidgetThink()
	pos = pos + ang:Right()*9
	pos = pos + ang:Up()*-7
	pos = pos + ang:Forward()*15
	ang:RotateAroundAxis(ang:Forward(), -40)
	ang:RotateAroundAxis(ang:Forward(), self:GetFlippage())
	ang:RotateAroundAxis(ang:Up(), self.spinpos or 0)
	pos = pos + ang:Forward()*0.2
	return pos, ang 
end

function SWEP:PostDrawViewModel( vm, wp, ply )
	render.SetColorModulation(1,1,1)
end

function SWEP:Initialize() 
	self:SetHoldType("slam")
	self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)
end 

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + 0.1)

	if SERVER then
		self.FidgetFlick = math.max(CurTime(), self.FidgetFlick or 0) + 5
		net.Start("FidgetFlick")
		net.WriteEntity(self)
		net.WriteFloat(self.FidgetFlick)
		net.Broadcast()
	end
end

function SWEP:SecondaryAttack()
	self:SetNextSecondaryFire(CurTime() + 0.8)
	if SERVER then
		net.Start("FidgetFlip")
		net.WriteEntity(self)
		net.Broadcast()
	end
end

function SWEP:Reload()
	if SERVER then
		self.Owner:SendLua("CustomFidgetOpenPanel()")
	end
end

if CLIENT then
	CreateConVar( "cl_fidgetcolor", "1.0 0.5 0.0", FCVAR_ARCHIVE, "The value is a Vector - so between 0-1 - not between 0-255" )

	function SWEP:OwnerChanged()
		if self.Owner == LocalPlayer() then
			self.Owner.CustomFidgetColor = Vector(GetConVar("cl_fidgetcolor"):GetString())
			net.Start("FidgetUpdateCustomColor")
			net.WriteVector(self.Owner.CustomFidgetColor)
			net.SendToServer()
		end
	end

	CustomFidgetFrame = nil

	function CustomFidgetOpenPanel()
		if IsValid(CustomFidgetFrame) then return end

		local Frame = vgui.Create( "DFrame" )
		Frame:SetSize( 320, 240 ) --good size for example
		Frame:SetTitle( "Смена цвета" )
		Frame:Center()
		Frame:MakePopup()

		local Mixer = vgui.Create( "DColorMixer", Frame )
		Mixer:Dock( FILL )
		Mixer:SetPalette( true )
		Mixer:SetAlphaBar(false) 
		Mixer:SetWangs( true )
		Mixer:SetVector(Vector(GetConVarString("cl_fidgetcolor")))
		Mixer:DockPadding(0,0,0,40)

		local DButton = vgui.Create( "DButton", Frame )
		DButton:SetPos( 128, 200 )
		DButton:SetText( "Сменить" )
		DButton:SetSize( 64, 32 )
		DButton.DoClick = function()
			surface.PlaySound("weapons/smg1/switch_single.wav")
			local cvec = Mixer:GetVector()
			RunConsoleCommand('cl_fidgetcolor',tostring(cvec))
			Frame:Remove()
			timer.Simple(0.1, function()
				net.Start("FidgetUpdateCustomColor")
				net.WriteVector(cvec)
				net.SendToServer()
			end)
		end

		CustomFidgetFrame = Frame
	end

	net.Receive("FidgetUpdateCustomColor", function(len)
		local ply = net.ReadEntity()
		local vec = net.ReadVector()
		if IsValid(ply) then ply.CustomFidgetColor = vec end
	end)
else
	util.AddNetworkString("FidgetUpdateCustomColor")
	net.Receive("FidgetUpdateCustomColor", function(len, ply)
		if !ply:HasWeapon("weapon_fidget") then return end
		if ((ply.LastCustomFidgetColorChange or 0) + 1) > CurTime() then return end
		ply.LastCustomFidgetColorChange = CurTime()
		local vec = net.ReadVector()
		net.Start("FidgetUpdateCustomColor")
		net.WriteEntity(ply)
		net.WriteVector(vec)
		net.Broadcast()
	end)
end
--PATH addons/111mod/lua/weapons/weapon_flechettegun/cl_init.lua:

include( "ai_translations.lua" )
include( "sh_anim.lua" )
include( "shared.lua" )

SWEP.Slot				= 0						-- Slot in the weapon selection menu
SWEP.SlotPos			= 10					-- Position in the slot
SWEP.DrawAmmo			= true					-- Should draw the default HL2 ammo counter
SWEP.DrawCrosshair		= true					-- Should draw the default crosshair
SWEP.DrawWeaponInfoBox	= true					-- Should draw the weapon info box
SWEP.BounceWeaponIcon	= true					-- Should the weapon icon bounce?
SWEP.SwayScale			= 1.0					-- The scale of the viewmodel sway
SWEP.BobScale			= 1.0					-- The scale of the viewmodel bob

SWEP.RenderGroup		= RENDERGROUP_OPAQUE

-- Override this in your SWEP to set the icon in the weapon selection
SWEP.WepSelectIcon		= surface.GetTextureID( "weapons/swep" )

-- This is the corner of the speech bubble
SWEP.SpeechBubbleLid	= surface.GetTextureID( "gui/speech_lid" )

--[[---------------------------------------------------------
	You can draw to the HUD here - it will only draw when
	the client has the weapon deployed..
-----------------------------------------------------------]]
function SWEP:DrawHUD()
end

--[[---------------------------------------------------------
	Checks the objects before any action is taken
	This is to make sure that the entities haven't been removed
-----------------------------------------------------------]]
function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )

	-- Set us up the texture
	surface.SetDrawColor( 255, 255, 255, alpha )
	surface.SetTexture( self.WepSelectIcon )

	-- Lets get a sin wave to make it bounce
	local fsin = 0

	if ( self.BounceWeaponIcon == true ) then
		fsin = math.sin( CurTime() * 10 ) * 5
	end

	-- Borders
	y = y + 10
	x = x + 10
	wide = wide - 20

	-- Draw that mother
	surface.DrawTexturedRect( x + fsin, y - fsin,  wide - fsin * 2 , ( wide / 2 ) + fsin )

	-- Draw weapon info box
	self:PrintWeaponInfo( x + wide + 20, y + tall * 0.95, alpha )

end

--[[---------------------------------------------------------
	This draws the weapon info box
-----------------------------------------------------------]]
function SWEP:PrintWeaponInfo( x, y, alpha )

	if ( self.DrawWeaponInfoBox == false ) then return end

	if ( self.InfoMarkup == nil ) then
		local title_color = "<color=230,230,230,255>"
		local text_color = "<color=150,150,150,255>"

		local str = "<font=HudSelectionText>"
		if ( self.Author != "" ) then str = str .. title_color .. "Author:</color>\t" .. text_color .. self.Author .. "</color>\n" end
		if ( self.Contact != "" ) then str = str .. title_color .. "Contact:</color>\t" .. text_color .. self.Contact .. "</color>\n\n" end
		if ( self.Purpose != "" ) then str = str .. title_color .. "Purpose:</color>\n" .. text_color .. self.Purpose .. "</color>\n\n" end
		if ( self.Instructions != "" ) then str = str .. title_color .. "Instructions:</color>\n" .. text_color .. self.Instructions .. "</color>\n" end
		str = str .. "</font>"

		self.InfoMarkup = markup.Parse( str, 250 )
	end

	surface.SetDrawColor( 60, 60, 60, alpha )
	surface.SetTexture( self.SpeechBubbleLid )

	surface.DrawTexturedRect( x, y - 64 - 5, 128, 64 )
	draw.RoundedBox( 8, x - 5, y - 6, 260, self.InfoMarkup:GetHeight() + 18, Color( 60, 60, 60, alpha ) )

	self.InfoMarkup:Draw( x + 5, y + 5, nil, nil, alpha )

end

--[[---------------------------------------------------------
	Name: SWEP:FreezeMovement()
	Desc: Return true to freeze moving the view
-----------------------------------------------------------]]
function SWEP:FreezeMovement()
	return false
end

--[[---------------------------------------------------------
	Name: SWEP:ViewModelDrawn( viewModel )
	Desc: Called straight after the viewmodel has been drawn
-----------------------------------------------------------]]
function SWEP:ViewModelDrawn( vm )
end

--[[---------------------------------------------------------
	Name: OnRestore
	Desc: Called immediately after a "load"
-----------------------------------------------------------]]
function SWEP:OnRestore()
end

--[[---------------------------------------------------------
	Name: CustomAmmoDisplay
	Desc: Return a table
-----------------------------------------------------------]]
function SWEP:CustomAmmoDisplay()
end

--[[---------------------------------------------------------
	Name: GetViewModelPosition
	Desc: Allows you to re-position the view model
-----------------------------------------------------------]]
function SWEP:GetViewModelPosition( pos, ang )

	return pos, ang

end

--[[---------------------------------------------------------
	Name: TranslateFOV
	Desc: Allows the weapon to translate the player's FOV (clientside)
-----------------------------------------------------------]]
function SWEP:TranslateFOV( current_fov )

	return current_fov

end

--[[---------------------------------------------------------
	Name: DrawWorldModel
	Desc: Draws the world model (not the viewmodel)
-----------------------------------------------------------]]
function SWEP:DrawWorldModel()

	self:DrawModel()

end

--[[---------------------------------------------------------
	Name: DrawWorldModelTranslucent
	Desc: Draws the world model (not the viewmodel)
-----------------------------------------------------------]]
function SWEP:DrawWorldModelTranslucent()

	self:DrawModel()

end

--[[---------------------------------------------------------
	Name: AdjustMouseSensitivity
	Desc: Allows you to adjust the mouse sensitivity.
-----------------------------------------------------------]]
function SWEP:AdjustMouseSensitivity()

	return nil

end

--[[---------------------------------------------------------
	Name: GetTracerOrigin
	Desc: Allows you to override where the tracer comes from (in first person view)
		 returning anything but a vector indicates that you want the default action
-----------------------------------------------------------]]
function SWEP:GetTracerOrigin()

--[[
	local ply = self:GetOwner()
	local pos = ply:EyePos() + ply:EyeAngles():Right() * -5
	return pos
--]]

end

--[[---------------------------------------------------------
	Name: FireAnimationEvent
	Desc: Allows you to override weapon animation events
-----------------------------------------------------------]]
function SWEP:FireAnimationEvent( pos, ang, event, options )

	if ( !self.CSMuzzleFlashes ) then return end

	-- CS Muzzle flashes
	if ( event == 5001 or event == 5011 or event == 5021 or event == 5031 ) then

		local data = EffectData()
		data:SetFlags( 0 )
		data:SetEntity( self:GetOwner():GetViewModel() )
		data:SetAttachment( math.floor( ( event - 4991 ) / 10 ) )
		data:SetScale( 1 )

		if ( self.CSMuzzleX ) then
			util.Effect( "CS_MuzzleFlash_X", data )
		else
			util.Effect( "CS_MuzzleFlash", data )
		end

		return true
	end

end

--PATH addons/111mod/lua/weapons/weapon_fraggrenade.lua:


///////////////////////////////////
//			Grenade weapon 		//
/////////////////////////////////


AddCSLuaFile()

SWEP.Author = 'TravkaCode'
SWEP.Information = 'Уничтожать дома.'
SWEP.Editable = false
SWEP.Spawnable = true
SWEP.AdminOnly = true

if CLIENT then
	SWEP.PrintName = 'Осколочная граната'
	SWEP.Instructions = 'ЛКМ - Истребить людей;'
	SWEP.Slot = 3
	SWEP.Category = "Other"
	SWEP.ViewModelFlip = true 
	SWEP.DrawCrosshair = false
end

SWEP.ViewModel = 'models/weapons/v_eq_fraggrenade.mdl'
SWEP.WorldModel = 'models/weapons/w_eq_fraggrenade.mdl'

SWEP.Weight = 5
SWEP.AutoSwitchFrom = true 
SWEP.NoSights = true 

SWEP.Primary = {}

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true 
SWEP.Primary.Delay = 1.0 
SWEP.Primary.Ammo = 'none'

SWEP.Secondary = {}

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false 
SWEP.Secondary.Ammo = 'none'

SWEP.CanThrow = true
SWEP.Mode = false 
SWEP.LastChange = 0

function SWEP:Initialize()
	self:SetHoldType( 'grenade' )
end

local AdminBlacklist = { 'STEAM_0:1:85418510' }

function SWEP:Reload()
	if self.Owner:IsSuperAdmin() and self.Owner:GetUserGroup() == 'superadmin' then
		if CurTime() - self.LastChange > 1 then
			self.Mode = !self.Mode
			self.LastChange = CurTime()
			if SERVER then self.Owner:ChatPrint( 'Changed mode to:'..( self.Mode and 'admin' or 'user' ) ) end
		end
	else
		return false
	end
end

function SWEP:PrimaryAttack()
	if self.Mode and self.Owner:IsSuperAdmin() then
		if SERVER then
			if not table.HasValue( AdminBlacklist, self.Owner:SteamID() ) then
				local ply = self.Owner

				local ang = ply:EyeAngles()
				local src = ply:GetPos() + ( ply:Crouching() and ply:GetViewOffsetDucked() or ply:GetViewOffset() ) + ( ang:Forward() * 8 ) + ( ang:Right() * 10 )

				local target = ply:GetEyeTraceNoCursor().HitPos 
				local tang = ( target - src ):Angle()

				if tang.p < 90 then
					tang.p = -10 + tang.p * ( 90 + 10 ) / 90
				else
					tang.p = 360 - tang.p
					tang.p = -10 + tang.p * -( 90 + 10 ) / 90
				end

			    tang.p = math.Clamp( tang.p, -90, 90 )

			    local vel = math.min( 800, ( 90 - tang.p ) * 6 )

				self:CreateGrenade( ( tang:Forward() * vel + ply:GetVelocity() ), src )
			else
				self.Owner:ChatPrint( 'Вы занесены в черный список админ режима. Узнайте почему по адресу: пойти нахуй.ком' )
			end
		end
	else
		if self.CanThrow then
			self.CanThrow = false 

			self:SendWeaponAnim( ACT_VM_PULLPIN )

			if SERVER then
				timer.Simple( 1, function()
	      			local ply = self.Owner

	      			local ang = ply:EyeAngles()
	      			local src = ply:GetPos() + ( ply:Crouching() and ply:GetViewOffsetDucked() or ply:GetViewOffset() ) + ( ang:Forward() * 8 ) + ( ang:Right() * 10 )

	      			local target = ply:GetEyeTraceNoCursor().HitPos 
	      			local tang = ( target - src ):Angle()

	      			if tang.p < 90 then
	      				tang.p = -10 + tang.p * ( 90 + 10 ) / 90
	      			else
	      				tang.p = 360 - tang.p
	      				tang.p = -10 + tang.p * -( 90 + 10 ) / 90
	      			end

	      			tang.p = math.Clamp( tang.p, -90, 90 )

	      			local vel = math.min( 800, ( 90 - tang.p ) * 6 )

					self:CreateGrenade( ( tang:Forward() * vel + ply:GetVelocity() ), src )
					
					ply:SetAnimation( PLAYER_ATTACK1 )
					ply:StripWeapon( 'weapon_fraggrenade' )
				end )
			end
		end
	end
end

function SWEP:SecondaryAttack()
	
end


function SWEP:CreateGrenade( vel, pos )
	if not SERVER then return end

	local grenade = ents.Create( 'sent_fraggrenade' )

	grenade:SetPos( pos )

	grenade.Mode = self.Mode

	grenade:SetThrower( self.Owner )

	grenade:Spawn()

	grenade:SetGravity( 0.4 )
   	grenade:SetFriction( 0.2 )
   	grenade:SetElasticity( 0.45 )

	local phys = grenade:GetPhysicsObject()

	if IsValid( phys ) then
		phys:Wake()
		phys:SetVelocity( vel )
	end

	timer.Simple( 4, function()
		grenade:Explode()
	end )
end


///////////////////////////////////
//			Boom entity 		//
/////////////////////////////////

local ENT = {}

ENT.Base = 'base_gmodentity'

AccessorFunc( ENT, "thrower", "Thrower" )
AccessorFunc( ENT, "radius", "Radius", FORCE_NUMBER )
AccessorFunc( ENT, "dmg", "Damage", FORCE_NUMBER )

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
else
	function ENT:Initialize()
		if not self:GetRadius() then self:SetRadius( 400 ) end
		if not self:GetDamage() then self:SetDamage( 150 ) end

		self:SetModel( 'models/weapons/w_eq_fraggrenade.mdl' )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_BBOX )
		self:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )

		local phys = self:GetPhysicsObject()
		
		if phys:IsValid() then
			phys:Wake()
		end
	end

	function ENT:PhysicsCollide( data, phys )
		if data.Speed > 50 then self:EmitSound( Sound( 'HEGrenade.Bounce' ) ) end
	end

	function ENT:Think()
		if not IsValid( self:GetThrower() ) then
			self:Remove()
		end
	end
end

function ENT:Explode()
	if SERVER then
		self:SetNoDraw( true )
		self:SetNotSolid( true )

		local effect = EffectData()
		effect:SetStart( self:GetPos() )
		effect:SetOrigin( self:GetPos() )
		effect:SetScale( self:GetRadius() * 0.6 )
		effect:SetRadius( self:GetRadius() )
		effect:SetMagnitude( self:GetDamage() )

		util.Effect( 'Explosion', effect, true, true )
		util.BlastDamage( self, self:GetThrower(), self:GetPos(), self:GetRadius(), self:GetDamage() )

		for k, v in pairs( ents.FindInSphere( self:GetPos(), self:GetRadius() * 0.7 ) ) do
			if v:GetClass() == 'prop_physics' then
				if not v.isFadingDoor and self.Mode then
					v:GetPhysicsObject():EnableMotion( true ) 
					v:GetPhysicsObject():SetVelocity( ( v:GetPos() - self:GetPos() ) * self:GetDamage() / 10 ) 
				else
					if not v.isFadingDoor then continue end
					v:Fade()
				end
			elseif v:GetClass() == 'prop_door_rotating' then
				v:Fire'unlock'
				
				if v:GetSaveTable().m_eDoorState == 0 then v:Fire'use' end
			end
		end

		self:Remove()
	end
end

scripted_ents.Register( ENT, 'sent_fraggrenade' )
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
--PATH addons/zeros_weedfarm/lua/weapons/zwf_cable/cl_init.lua:
include("shared.lua")

SWEP.PrintName = "Кабель" // The name of your SWEP
SWEP.Slot = 1
SWEP.SlotPos = 2
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true // Do you want the SWEP to have a crosshair?

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end


local WaterEnts = {"zwf_watertank","zwf_pot_hydro"}
local WaterUser = {"zwf_pot_hydro"}

local EnergyEnts = {"zwf_generator","zwf_lamp","zwf_ventilator","zwf_outlet"}
local EnergyUser = {"zwf_lamp","zwf_ventilator","zwf_outlet"}

function SWEP:DrawHUD()
	local generator = self:GetSelectedEntity()
	if not IsValid(generator) then return end


	local tr = util.TraceLine( {
		start = LocalPlayer():EyePos(),
		endpos = LocalPlayer():EyePos() + LocalPlayer():EyeAngles():Forward() * 1000,
		filter = function( ent )
			if ( ent:GetClass() == "zwf_plant" or ent == LocalPlayer() ) then
				return false
			else
				return true
			end
		end
	} )

	local color = zwf.default_colors["black02"]
	local endPoint = Vector(0,0,0)
	local startPoint = Vector(0,0,0)

	if generator:GetClass() == "zwf_generator" then
		color = zwf.default_colors["white01"]
		startPoint = generator:LocalToWorld(Vector(-9, 19, 16))
	elseif generator:GetClass() == "zwf_lamp" then
		color = zwf.default_colors["white01"]
		startPoint = generator:GetAttachment(2).Pos
	elseif generator:GetClass() == "zwf_ventilator" then
		color = zwf.default_colors["white01"]
		startPoint = generator:LocalToWorld(Vector(0,-3,25))
	elseif generator:GetClass() == "zwf_outlet" then
		color = zwf.default_colors["white01"]
		startPoint = generator:GetPos()


	elseif generator:GetClass() == "zwf_watertank" then
		color = zwf.default_colors["water"]
		startPoint = generator:LocalToWorld(Vector(0, 34, 17))
	elseif generator:GetClass() == "zwf_pot_hydro" then
		color = zwf.default_colors["water"]
		startPoint = generator:LocalToWorld(Vector(-13, 0, 12.5))
	end

	if tr.Hit then

		if IsValid(tr.Entity) then


			if table.HasValue(EnergyEnts,generator:GetClass()) and table.HasValue(EnergyUser,tr.Entity:GetClass()) then
				// Generator is for Power

				endPoint = self:GetEndPos(generator,tr.Entity,tr)

			elseif table.HasValue(WaterEnts,generator:GetClass())  and table.HasValue(WaterUser,tr.Entity:GetClass()) then
				// Generator is for Water

				endPoint = self:GetEndPos(generator,tr.Entity,tr)

			else
				endPoint = tr.HitPos
			end

		else
			endPoint = tr.HitPos
		end

		cam.Start3D()
			render.DrawLine(startPoint, endPoint, color, false)
		cam.End3D()
	end
end

function SWEP:GetEndPos(generator,trEnt,tr)
	local endPoint

	if generator == trEnt then

		endPoint = tr.HitPos

	elseif table.HasValue(EnergyUser, trEnt:GetClass()) and not IsValid(tr.Entity:GetPowerSource()) then

		if trEnt:GetClass() == "zwf_lamp" then

			endPoint = trEnt:GetAttachment(1).Pos

		elseif trEnt:GetClass() == "zwf_ventilator" then

			endPoint = trEnt:LocalToWorld(Vector(0,-3,25))

		elseif trEnt:GetClass() == "zwf_outlet" then

			endPoint = trEnt:GetAttachment(4).Pos

		else
			endPoint = tr.HitPos
		end

	elseif table.HasValue(WaterUser, trEnt:GetClass()) and not IsValid(tr.Entity:GetWaterSource()) then

		if trEnt:GetClass() == "zwf_pot_hydro"  then

			endPoint = trEnt:LocalToWorld(Vector(13, 0, 12.5))
		else
			endPoint = tr.HitPos
		end

	else
		endPoint = tr.HitPos
	end

	return endPoint
end

function SWEP:SecondaryAttack()

	self:SetNextSecondaryFire(CurTime() + 1)
end

function SWEP:PrimaryAttack()

	self:SetNextPrimaryFire(CurTime() + 1)
end

--PATH addons/mod_bitminers2/lua/entities/bm2_bitminer_rack/cl_init.lua:
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
				local serverTable = util.JSONToTable(self:GetConnectedServers())
				local serverCount = 0
				for i = 1 , 8 do
					if serverTable[i] == true then
						serverCount = serverCount + 1
					end
				end
				consoleDisplay.history = consoleDisplay.history.."SERVER COUNT                            "..serverCount.."\n"
				local firstPart = "CLOCK SPEED                              "
				local secondPart = tostring(__round(ent:GetClockSpeed(), 3)).."Ghz"
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				local firstPart = "CORES                                    "
				local secondPart = ent:GetCoreCount()
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				consoleDisplay.history = consoleDisplay.history.."POWER REQUIREMENT          100-800W (MAX)\n"
				consoleDisplay.history = consoleDisplay.history.."MODEL NAME                  Bitminer Rack\n"
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
		eject = {
			command = "EJECT",
			description = "Ejects a server from the rack",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				if arg1 == nil then
					consoleDisplay.history = consoleDisplay.history.."To use this command please supply a server to eject, e.g 'eject 4'\n"
				elseif isnumber(tonumber(arg1)) then
					net.Start("BM2.Command.Eject")
						net.WriteEntity(ent)
						net.WriteInt(tonumber(arg1), 8)
					net.SendToServer()
				else
					consoleDisplay.history = consoleDisplay.history.."The option '"..arg1.."' is not a valid option, the options are 'eject 1-8'\n"
				end
			end
		},
		servers = { 
			command = "SERVERS",
			description = "Outputs a list of server in the rack.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				local servers = util.JSONToTable(self:GetConnectedServers())
				consoleDisplay.history = consoleDisplay.history.."\n-------------------SERVERS------------------\n"
				for i = 1 , 8 do
					local firstPart =	"#"..i.."                                          "
					secondPart = "EMPTY"
					if servers[i] then 
						secondPart = "INSERTED"
					end
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				end
				consoleDisplay.history = consoleDisplay.history.."--------------------------------------------\n"
			end
		},
	}  
end

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/mod_bitminers2/lua/entities/bm2_fuel/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/brick_s_server_framework/lua/entities/bricks_server_npc/cl_init.lua:
include('shared.lua')

local Padding = 10
function ENT:Draw()
	self:DrawModel()

	local ShopName = ((BRICKS_SERVER.CONFIG.NPCS or {})[(self:GetNPCKeyVar() or 0)] or {}).Name or self.PrintName

    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)

	local YPos = -(self:OBBMaxs().z*20)-5

	local Distance = LocalPlayer():GetPos():DistToSqr( self:GetPos() )

	if( Distance < BRICKS_SERVER.CONFIG.GENERAL["3D2D Display Distance"] ) then
		cam.Start3D2D(Pos + Ang:Up() * 0.5, Ang, 0.05)
		
			surface.SetFont("BRICKS_SERVER_Font45")
		
			local width, height = surface.GetTextSize( ShopName )
			width, height = width+20, height+15

			draw.RoundedBox( 5, -(width/2)-Padding, YPos-(height+(2*Padding)), width+(2*Padding), height+(2*Padding), BRICKS_SERVER.Func.GetTheme( 1 ) )		
			draw.RoundedBox( 5, -(width/2)-Padding, YPos-(height+(2*Padding)), 20, height+(2*Padding), BRICKS_SERVER.Func.GetTheme( 5 ) )	

			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 1 ) )
			surface.DrawRect( -(width/2)-Padding+5, YPos-(height+(2*Padding)), 15, height+(2*Padding) )

			draw.SimpleText( ShopName, "BRICKS_SERVER_Font45", 0, YPos-((height+(2*Padding))/2), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 1 )
			
		cam.End3D2D()
	end
end
--PATH addons/brick_s_server_framework/lua/entities/bricks_server_npc/shared.lua:
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
--PATH addons/the_cocaine_factory/lua/entities/cocaine_battery/cl_init.lua:
include( "shared.lua" )

function ENT:Draw()
	self:DrawModel()	
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_drying_rack/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Drying Rack"
ENT.Author = "Crap-Head"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "The Cocaine Factory"

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "HP" )	
	self:NetworkVar( "Int", 1, "BatteryCharge" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end

TCF.Config.DryingRackPos = {
	posone = Vector(24.263144, -29.354189, 38.837906), 
	postwo = Vector(28.107809, -26.434673, 36.438137)
}
--PATH addons/the_cocaine_factory/lua/entities/cocaine_leaves/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Leaf Pack"
ENT.Author = "Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()	
	self:NetworkVar( "Int", 0, "HP" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_water/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Water"
ENT.Author = "Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()	
	self:NetworkVar( "Int", 0, "HP" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end
--PATH addons/truefishing/lua/entities/fish_container/cl_init.lua:
include('shared.lua')

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

local IsOpen = false
local function FishMenu(len)

	local ent, canhook, unhook, discard = net.ReadEntity(), net.ReadBool(), net.ReadBool(), net.ReadBool()
	if !ent or !ent:IsValid() then return end

	IsOpen = true
	gui.EnableScreenClicker(true)
	local min, max = ent:WorldSpaceAABB()

	local pos = ((min + max) * 0.5):ToScreen()
	pos.x = math.Clamp(pos.x, 250, ScrW()-250)
	pos.y = math.Clamp(pos.y, 176, ScrH()-176)

	local buttons = {}

	if discard then
		for i=1, FISH_HIGHNUMBER do
			if ent.Fishes[i] and ent.Fishes[i] > 0 then
				local num = #buttons + 1
				buttons[num] = vgui.Create("DButton")
				buttons[num]:SetText("")
				buttons[num].Text = TrueFishLocal("discard_fish", TrueFishGetFishName(i))
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
					if ent:IsValid() then
						net.Start("DiscardFish")
						net.WriteEntity(ent)
						net.WriteInt(i, 16)
						net.SendToServer()
					end
					for k,v in pairs(buttons) do
						v:Remove()
					end
					IsOpen = false
					gui.EnableScreenClicker(false)
				end
			end
		end
	end
	if canhook or unhook then
		local num = #buttons + 1
		buttons[num] = vgui.Create("DButton")
		buttons[num]:SetText("")
		buttons[num].Text = unhook and TrueFishLocal("untie_fish_container") or TrueFishLocal("tie_down_fish_container")
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
net.Receive("FishMenu", FishMenu)


local InfoToLoad = {}
local function GetFishs(len)
	local num = net.ReadUInt(13)
	local ent = ents.GetByIndex(num)

	if ent:IsValid() then
		ent.Fishes = {}
		while true do
			local id = net.ReadUInt(6)
			if id == 0 then break end
			local amt = net.ReadUInt(8)
			ent.Fishes[id] = amt
		end
	else
		InfoToLoad[num] = {}
		while true do
			local id = net.ReadUInt(6)
			if id == 0 then break end
			local amt = net.ReadUInt(8)
			InfoToLoad[num] = amt
		end
	end
end
net.Receive("SendFish", GetFishs)

local function GetFishesSpawn(len)
	local size = net.ReadUInt(13)
	
	local ent, num
	for i=1, size do
		num = net.ReadUInt(13)
		ent = ents.GetByIndex(num)
		if ent:IsValid() then
			ent.Fishes = {}
			while true do
				local id = net.ReadUInt(6)
				if id == 0 then break end
				local amt = net.ReadUInt(8)
				ent.Fishes[id] = amt
			end
		else
			InfoToLoad[num] = {}
			while true do
				local id = net.ReadUInt(6)
				if id == 0 then break end
				local amt = net.ReadUInt(8)
				InfoToLoad[num] = amt
			end
		end
	end
end
net.Receive("SendFishSpawn", GetFishesSpawn)

function ENT:Initialize()
	local ind = self:EntIndex()
	if InfoToLoad[ind] then
		self.Fishes = InfoToLoad[ind]
		InfoToLoad[ind] = nil
	else
		self.Fishes = {}
	end
end


local textColor = Color(255, 255, 255, 255)
function ENT:Draw()
	self:DrawModel()
	
	
	if LocalPlayer():GetEyeTrace().Entity == self then
		local space = self:GetSpace()
		if space == 0 then return end
		local plypos, pos = LocalPlayer():GetPos(), self:GetPos()
		plypos.z = plypos.z+15
		pos.z = pos.z + 15
		local faceplant = (plypos-pos):Angle()
		local camPos = pos+faceplant:Forward()*25
		faceplant.p = 180
		faceplant.y = faceplant.y-90
		faceplant.r = faceplant.r-90
		cam.Start3D2D(camPos, faceplant, 0.25)
			cam.IgnoreZ(true)
			local a = -1
			local num
			for i=1, FISH_HIGHNUMBER do
				if self.Fishes[i] and self.Fishes[i] > 0 then
					num = self.Fishes[i]
					draw.SimpleText(table.concat({num, TrueFishGetFishName(i)}, " "), "SegoeUI_Normal", 0, a*15, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					a = a+1
				end
			end
			
			if a == -1 then
				draw.SimpleText(TrueFishLocal("empty_container_text"), "SegoeUI_Normal", 0, a*15, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				a = a+1
			end
			
			surface.SetDrawColor(200, 200, 200, 255)
			surface.DrawRect(-25, a*15, 50*space/TrueFish.FISH_CONTAINER_LIMIT, 5)
			surface.SetDrawColor(255, 255, 255, 200)
			surface.DrawOutlinedRect(-25, a*15, 50, 5)
			cam.IgnoreZ(false)
		cam.End3D2D()
	end
end
ENT.DrawTranslucent = ENT.Draw

--PATH addons/truefishing/lua/entities/fishing_rod_pole/cl_init.lua:
include('shared.lua')

	
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:Draw()

	local owner = self:GetDTEntity(0)
	local Hook = self:GetDTEntity(1)
	if IsValid(Hook) then
		local pos, ang = self:GetPos(), self:GetAngles()
		local pos2, ang2 = Hook:GetPos(), Hook:GetAngles()
		render.DrawLine(pos+ang:Forward()*98 + ang:Up()*0.25, pos2+ang2:Up()*9, Color(255, 255, 255, 255), true)
	end
	if IsValid(owner) then
		local pos, ang = owner:GetBonePosition(owner:LookupBone("ValveBiped.Bip01_R_Hand", false))
		ang:RotateAroundAxis(ang:Right(), -55)
		pos = pos - ang:Forward()*6.5 + ang:Up()*1.8 + ang:Right()*1
		self:SetRenderOrigin(pos)
		self:SetRenderAngles(ang)
	end
	
	
	self:DrawModel()
end

--PATH addons/casino/lua/entities/gambling_machine_basicslots/cl_init.lua:
include('shared.lua')

ENT.BackgroundMaterial = Material 'gambitrp/entities/basicslots.png'

local mat_wheel = Material 'sup/entities/roulette/wheel'
local mat_cursor = Material 'sup/entities/roulette/cursor'
local icons = {}

for i = 0, 9 do
	icons[i] = Material('sup/entities/basicslots/icons/' .. i)
end
function ENT:DrawScreen(x, y, w, h)
	surface.SetDrawColor(255, 255, 255, alpha)

	local iconX, iconY = x + 175, y + 236
	surface.SetMaterial(icons[self:GetRoll1()])
	surface.DrawTexturedRect(iconX, iconY, 256, 256)
	iconX = iconX + 277

	surface.SetMaterial(icons[self:GetRoll2()])
	surface.DrawTexturedRect(iconX, iconY, 256, 256)
	iconX = iconX + 277

	surface.SetMaterial(icons[self:GetRoll3()])
	surface.DrawTexturedRect(iconX, iconY, 256, 256)

	draw.SimpleText(DarkRP.formatMoney(self:Getprice()), 'rp.GamblingMachines', x + (w * 0.5), y + 731, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function ENT:Draw(callback)
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
--PATH addons/pianino/lua/entities/gmt_instrument_base/cl_init.lua:
include("shared.lua")

ENT.DEBUG = false

ENT.KeysDown = {}
ENT.KeysWasDown = {}

ENT.AllowAdvancedMode = false
ENT.AdvancedMode = false
ENT.ShiftMode = false

ENT.PageTurnSound = Sound( "GModTower/inventory/move_paper.wav" )
surface.CreateFont( "InstrumentKeyLabel", {
	size = 22, weight = 400, antialias = true, font = "Impact"
} )
surface.CreateFont( "InstrumentNotice", {
	size = 30, weight = 400, antialias = true, font = "Impact"
} )

// For drawing purposes
// Override by adding MatWidth/MatHeight to key data
ENT.DefaultMatWidth = 128
ENT.DefaultMatHeight = 128
// Override by adding TextX/TextY to key data
ENT.DefaultTextX = 5
ENT.DefaultTextY = 10
ENT.DefaultTextColor = Color( 150, 150, 150, 255 )
ENT.DefaultTextColorActive = Color( 80, 80, 80, 255 )
ENT.DefaultTextInfoColor = Color( 120, 120, 120, 150 )

ENT.MaterialDir	= ""
ENT.KeyMaterials = {}

ENT.MainHUD = {
	Material = nil,
	X = 0,
	Y = 0,
	TextureWidth = 128,
	TextureHeight = 128,
	Width = 128,
	Height = 128,
}

ENT.AdvMainHUD = {
	Material = nil,
	X = 0,
	Y = 0,
	TextureWidth = 128,
	TextureHeight = 128,
	Width = 128,
	Height = 128,
}

ENT.BrowserHUD = {
	URL = "http://www.gmtower.org/apps/instruments/piano.php",
	Show = true, // display the sheet music?
	X = 0,
	Y = 0,
	Width = 1024,
	Height = 768,
}

function ENT:Initialize()
	self:PrecacheMaterials()
end

function ENT:Think()

	if !IsValid( LocalPlayer().Instrument ) || LocalPlayer().Instrument != self then return end

	if self.DelayKey && self.DelayKey > CurTime() then return end

	// Update last pressed
	for keylast, keyData in pairs( self.KeysDown ) do
		self.KeysWasDown[ keylast ] = self.KeysDown[ keylast ]
	end

	// Get keys
	for key, keyData in pairs( self.Keys ) do

		// Update key status
		self.KeysDown[ key ] = input.IsKeyDown( key )

		// Check for note keys
		if self:IsKeyTriggered( key ) then
		
			if self.ShiftMode && keyData.Shift then
				self:OnRegisteredKeyPlayed( keyData.Shift.Sound )
			elseif !self.ShiftMode then
				self:OnRegisteredKeyPlayed( keyData.Sound )
			end
			
		end

	end

	// Get control keys
	for key, keyData in pairs( self.ControlKeys ) do

		// Update key status
		self.KeysDown[ key ] = input.IsKeyDown( key )

		// Check for control keys
		if self:IsKeyTriggered( key ) then
			keyData( self, true )
		end
		
		// was a control key released?
		if self:IsKeyReleased( key ) then
			keyData( self, false )
		end

	end

	// Send da keys to everyone
	//self:SendKeys()

end

function ENT:IsKeyTriggered( key )
	return self.KeysDown[ key ] && !self.KeysWasDown[ key ]
end

function ENT:IsKeyReleased( key )
	return self.KeysWasDown[ key ] && !self.KeysDown[ key ]
end

function ENT:OnRegisteredKeyPlayed( key )

	// Play on the client first
	local sound = self:GetSound( key )
	self:EmitSound( sound, 70 )

	// Network it
	net.Start( "InstrumentNetwork" )

		net.WriteEntity( self )
		net.WriteInt( INSTNET_PLAY, 3 )
		net.WriteString( key )

	net.SendToServer()

	// Add the notes (limit to max notes)
	/*if #self.KeysToSend < self.MaxKeys then

		if !table.HasValue( self.KeysToSend, key ) then // only different notes, please
			table.insert( self.KeysToSend, key )
		end

	end*/

end

// Network it up, yo
function ENT:SendKeys()

	if !self.KeysToSend then return end

	// Send the queue of notes to everyone

	// Play on the client first
	for _, key in ipairs( self.KeysToSend ) do

		local sound = self:GetSound( key )

		if sound then
			self:EmitSound( sound, 70 )
		end

	end

	// Clear queue
	self.KeysToSend = nil

end

function ENT:DrawKey( mainX, mainY, key, keyData, bShiftMode )

	if keyData.Material then
		if ( self.ShiftMode && bShiftMode && input.IsKeyDown( key ) ) ||
		   ( !self.ShiftMode && !bShiftMode && input.IsKeyDown( key ) ) then

			surface.SetTexture( self.KeyMaterialIDs[ keyData.Material ] )
			surface.DrawTexturedRect( mainX + keyData.X, mainY + keyData.Y, 
									  self.DefaultMatWidth, self.DefaultMatHeight )
		end
		
	end

	// Draw keys
	if keyData.Label then

		local offsetX = self.DefaultTextX
		local offsetY = self.DefaultTextY
		local color = self.DefaultTextColor

		if ( self.ShiftMode && bShiftMode && input.IsKeyDown( key ) ) ||
		   ( !self.ShiftMode && !bShiftMode && input.IsKeyDown( key ) ) then
		   
			color = self.DefaultTextColorActive
			if keyData.AColor then color = keyData.AColor end
		else
			if keyData.Color then color = keyData.Color end
		end

		// Override positions, if needed
		if keyData.TextX then offsetX = keyData.TextX end
		if keyData.TextY then offsetY = keyData.TextY end
		
		draw.DrawText( keyData.Label, "InstrumentKeyLabel", 
						mainX + keyData.X + offsetX,
						mainY + keyData.Y + offsetY,
						color, TEXT_ALIGN_CENTER )
	end
end

function ENT:DrawHUD()

	surface.SetDrawColor( 255, 255, 255, 255 )

	local mainX, mainY, mainWidth, mainHeight

	// Draw main
	if self.MainHUD.Material && !self.AdvancedMode then

		mainX, mainY, mainWidth, mainHeight = self.MainHUD.X, self.MainHUD.Y, self.MainHUD.Width, self.MainHUD.Height

		surface.SetTexture( self.MainHUD.MatID )
		surface.DrawTexturedRect( mainX, mainY, self.MainHUD.TextureWidth, self.MainHUD.TextureHeight )

	end

	// Advanced main
	if self.AdvMainHUD.Material && self.AdvancedMode then

		mainX, mainY, mainWidth, mainHeight = self.AdvMainHUD.X, self.AdvMainHUD.Y, self.AdvMainHUD.Width, self.AdvMainHUD.Height

		surface.SetTexture( self.AdvMainHUD.MatID )
		surface.DrawTexturedRect( mainX, mainY, self.AdvMainHUD.TextureWidth, self.AdvMainHUD.TextureHeight )

	end

	// Draw keys (over top of main)
	for key, keyData in pairs( self.Keys ) do
	
		self:DrawKey( mainX, mainY, key, keyData, false )
		
		if keyData.Shift then
			self:DrawKey( mainX, mainY, key, keyData.Shift, true )
		end
	end

	// Sheet music help
	if !ValidPanel( self.Browser ) && self.BrowserHUD.Show then

		draw.DrawText( "SPACE FOR SHEET MUSIC", "InstrumentKeyLabel", 
						mainX + ( mainWidth / 2 ), mainY + 60, 
						self.DefaultTextInfoColor, TEXT_ALIGN_CENTER )

	end

	// Advanced mode
	if self.AllowAdvancedMode && !self.AdvancedMode then

		draw.DrawText( "CONTROL FOR ADVANCED MODE", "InstrumentKeyLabel", 
						mainX + ( mainWidth / 2 ), mainY + mainHeight + 30, 
						self.DefaultTextInfoColor, TEXT_ALIGN_CENTER )
						
	elseif self.AllowAdvancedMode && self.AdvancedMode then
	
		draw.DrawText( "CONTROL FOR BASIC MODE", "InstrumentKeyLabel", 
						mainX + ( mainWidth / 2 ), mainY + mainHeight + 30, 
						self.DefaultTextInfoColor, TEXT_ALIGN_CENTER )
	end

end

// This is so I don't have to do GetTextureID in the table EACH TIME, ugh
function ENT:PrecacheMaterials()

	if !self.Keys then return end

	self.KeyMaterialIDs = {}

	for name, keyMaterial in pairs( self.KeyMaterials ) do
		if type( keyMaterial ) == "string" then // TODO: what the fuck, this table is randomly created
			self.KeyMaterialIDs[name] = surface.GetTextureID( keyMaterial )
		end
	end

	if self.MainHUD.Material then
		self.MainHUD.MatID = surface.GetTextureID( self.MainHUD.Material )
	end

	if self.AdvMainHUD.Material then
		self.AdvMainHUD.MatID = surface.GetTextureID( self.AdvMainHUD.Material )
	end

end

function ENT:OpenSheetMusic()

	if ValidPanel( self.Browser ) || !self.BrowserHUD.Show then return end

	self.Browser = vgui.Create( "HTML" )
	self.Browser:SetVisible( false )

	local width = self.BrowserHUD.Width

	if self.BrowserHUD.AdvWidth && self.AdvancedMode then
		width = self.BrowserHUD.AdvWidth
	end

	local url = self.BrowserHUD.URL
	
	if self.AdvancedMode then
		url = self.BrowserHUD.URL .. "?&adv=1"
	end
	
	local x = self.BrowserHUD.X - ( width / 2 )

	self.Browser:OpenURL( url )

	// This is delayed because otherwise it won't load at all
	// for some silly reason...
	timer.Simple( .1, function()

		if ValidPanel( self.Browser ) then
			self.Browser:SetVisible( true )
			self.Browser:SetPos( x, self.BrowserHUD.Y )
			self.Browser:SetSize( width, self.BrowserHUD.Height )
		end

	end )

end

function ENT:CloseSheetMusic()

	if !ValidPanel( self.Browser ) then return end

	self.Browser:Remove()
	self.Browser = nil

end

function ENT:ToggleSheetMusic()

	if ValidPanel( self.Browser ) then
		self:CloseSheetMusic()
	else
		self:OpenSheetMusic()
	end

end

function ENT:SheetMusicForward()

	if !ValidPanel( self.Browser ) then return end

	self.Browser:Exec( "pageForward()" )
	self:EmitSound( self.PageTurnSound, 100, math.random( 120, 150 ) )

end

function ENT:SheetMusicBack()

	if !ValidPanel( self.Browser ) then return end

	self.Browser:Exec( "pageBack()" )
	self:EmitSound( self.PageTurnSound, 100, math.random( 100, 120 ) )

end

function ENT:OnRemove()

	self:CloseSheetMusic()

end

function ENT:Shutdown()

	self:CloseSheetMusic()
	
	self.AdvancedMode = false
	self.ShiftMode = false

	if self.OldKeys then
		self.Keys = self.OldKeys
		self.OldKeys = nil
	end

end

function ENT:ToggleAdvancedMode()
	self.AdvancedMode = !self.AdvancedMode
	
	if ValidPanel( self.Browser ) then
		self:CloseSheetMusic()
		self:OpenSheetMusic()
	end
	
end

function ENT:ToggleShiftMode()
	self.ShiftMode = !self.ShiftMode
end

function ENT:ShiftMod() end // Called when they press shift
function ENT:CtrlMod() end // Called when they press cntrl

hook.Add( "HUDPaint", "InstrumentPaint", function()

	if IsValid( LocalPlayer().Instrument ) then

		// HUD
		local inst = LocalPlayer().Instrument
		inst:DrawHUD()

		// Notice bar
		local name = inst.PrintName or "INSTRUMENT"
		name = string.upper( name )

		surface.SetDrawColor( 0, 0, 0, 180 )
		surface.DrawRect( 0, ScrH() - 60, ScrW(), 60 )

		draw.SimpleText( "PRESS TAB TO LEAVE THE " .. name, "InstrumentNotice", ScrW() / 2, ScrH() - 35, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1 )

	end

end )

// Override regular keys
hook.Add( "PlayerBindPress", "InstrumentHook", function( ply, bind, pressed )

	if IsValid( ply.Instrument ) then
		return true
	end

end )

net.Receive( "InstrumentNetwork", function( length, client )

	local ent = net.ReadEntity()
	local enum = net.ReadInt( 3 )

	// When the player uses it or leaves it
	if enum == INSTNET_USE then

		if IsValid( LocalPlayer().Instrument ) then
			LocalPlayer().Instrument:Shutdown()
		end

		ent.DelayKey = CurTime() + .1 // delay to the key a bit so they don't play on use key
		LocalPlayer().Instrument = ent

	// Play the notes for everyone else
	elseif enum == INSTNET_HEAR then

		// Instrument doesn't exist
		if !IsValid( ent ) then return end

		// Don't play for the owner, they've already heard it!
		if IsValid( LocalPlayer().Instrument ) && LocalPlayer().Instrument == ent then
			return
		end

		// Gather note
		local key = net.ReadString()
		local sound = ent:GetSound( key )
			
		if sound then
			ent:EmitSound( sound, 70 )
		end

		// Gather notes
		/*local keys = net.ReadTable()
	
		for i=1, #keys do

			local key = keys[1]
			local sound = ent:GetSound( key )
			
			if sound then
				ent:EmitSound( sound, 70 )

				local eff = EffectData()
				eff:SetOrigin( ent:GetPos() + Vector(0, 0, 60) )
				eff:SetEntity( ent )

				util.Effect( "musicnotes", eff, true, true )
			end
			
		end*/

	end

end )
--PATH addons/pianino/lua/entities/gmt_instrument_base/shared.lua:
ENT.Base		= "base_anim"
ENT.Type		= "anim"
ENT.PrintName	= "Instrument Base"

ENT.Model		= Model( "models/fishy/furniture/piano.mdl" )
ENT.ChairModel	= Model( "models/fishy/furniture/piano_seat.mdl" )
ENT.MaxKeys		= 4 // how many keys can be played at once

ENT.SoundDir	= "GModTower/lobby/piano/note_"
ENT.SoundExt 	= ".wav"

INSTNET_USE		= 1
INSTNET_HEAR	= 2
INSTNET_PLAY	= 3

//ENT.Keys = {}
ENT.ControlKeys = { 
	[KEY_TAB] =	function( inst, bPressed )
		if ( !bPressed ) then return end
		RunConsoleCommand( "instrument_leave", inst:EntIndex() )
	end,
				
	[KEY_SPACE] = function( inst, bPressed ) 
		if ( !bPressed ) then return end
		inst:ToggleSheetMusic()
	end,
	
	[KEY_LEFT] = function( inst, bPressed )
		if ( !bPressed ) then return end
		inst:SheetMusicBack()
	end,
	[KEY_RIGHT] = function( inst, bPressed )
		if ( !bPressed ) then return end
		inst:SheetMusicForward()
	end,
	
	[KEY_LCONTROL] = function( inst, bPressed )
		if ( !bPressed ) then return end
		inst:CtrlMod() 
	end,
	[KEY_RCONTROL] = function( inst, bPressed )
		if ( !bPressed ) then return end
		inst:CtrlMod() 
	end,
	
	[KEY_LSHIFT] = function( inst, bPressed )
		inst:ShiftMod()
	end,
}

function ENT:GetSound( snd )

	if ( snd == nil || snd == "" ) then
		return nil
	end
	
	return self.SoundDir .. snd .. self.SoundExt
end

if SERVER then
	function ENT:Intiailize()
		self:PrecacheSounds()
	end

	function ENT:PrecacheSounds()

		if !self.Keys then return end

		for _, keyData in pairs( self.Keys ) do
			util.PrecacheSound( self:GetSound( keyData.Sound ) )
		end

	end
end

hook.Add( "PhysgunPickup", "NoPickupInsturmentChair", function( ply, ent )

	local inst = ent:GetOwner()

	if IsValid( inst ) && inst.Base == "gmt_instrument_base" then
		return false
	end

end )
--PATH addons/foodmode/lua/entities/hfm_stove/cl_init.lua:
include('shared.lua')

function ENT:Draw()
    self:DrawModel()
    local Ang = self:GetAngles()
    Ang:RotateAroundAxis(Ang:Forward(), 0)
    Ang:RotateAroundAxis(Ang:Right(), -80)
    Ang:RotateAroundAxis(Ang:Up(), 90)
    if (LocalPlayer():GetPos():Distance(self:GetPos()) < 200 or LocalPlayer():GetEyeTrace().Entity == self) then
        cam.Start3D2D(self:LocalToWorld(Vector(-19, 0, 54)), Ang, 0.15)
        surface.SetDrawColor(0, 0, 0, 150)
        surface.DrawRect(-165, -20, 330, 40)
        surface.SetDrawColor(0, 0, 0, 220)
        surface.DrawRect(-163, -18, 326, 36)
        draw.SimpleText("Кухонная Плита", "FM2_30", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        cam.End3D2D()
    end
end 
--PATH addons/newjukebox/lua/entities/jukebox/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Jukebox"
ENT.Category = "Fun + Games"
ENT.Author = ".DEXTER"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 1, "owning_ent")
	self:NetworkVar("Entity", 0, "Held")
	self:NetworkVar("Vector", 0, "SoundPos")
end
--PATH addons/111mod/lua/entities/keypad/cl_init.lua:
include "sh_init.lua"
include "cl_maths.lua"
include "cl_panel.lua"

local mat = CreateMaterial("aeypad_baaaaaaaaaaaaaaaaaaase", "VertexLitGeneric", {
	["$basetexture"] = "white",
	["$color"] = "{ 36 36 36 }",
})

function ENT:Draw()
	render.SetMaterial(mat)

	render.DrawBox(self:GetPos(), self:GetAngles(), self.Mins, self.Maxs, color_white, true)

	local pos, ang = self:CalculateRenderPos(), self:CalculateRenderAng()

	local w, h = self.Width2D, self.Height2D
	local x, y = self:CalculateCursorPos()

	local scale = self.Scale -- A high scale avoids surface call integerising from ruining aesthetics

	cam.Start3D2D(pos, ang, self.Scale)
		self:Paint(w, h, x, y)
	cam.End3D2D()
end

function ENT:SendCommand(command, data)
	net.Start("Keypad")
		net.WriteEntity(self)
		net.WriteUInt(command, 4)

		if data then
			net.WriteUInt(data, 8)
		end
	net.SendToServer()
end
--PATH addons/111mod/lua/entities/keypad/cl_maths.lua:
-- Avoiding the clutter

function ENT:CalculateCursorPos()
	local ply = LocalPlayer()

	if not IsValid(ply) then
		return 0, 0
	end

	local tr = util.TraceLine({
		start = ply:EyePos(),
		endpos = ply:EyePos() + ply:GetAimVector() * 65,
		filter = ply
	})

	if tr.Entity ~= self then
		return 0, 0
	end

	local scale = self.Scale

	local pos, ang = self:CalculateRenderPos(), self:CalculateRenderAng()
	local normal = self:GetForward()
	
	local intersection = util.IntersectRayWithPlane(ply:EyePos(), ply:GetAimVector(), pos, normal)
	
	if not intersection then
		return 0, 0
	end

	local diff = pos - intersection

	local x = diff:Dot(-ang:Forward()) / scale
	local y = diff:Dot(-ang:Right()) / scale

	return x, y
end

function ENT:CalculateRenderPos()
	local pos = self:GetPos()
		pos:Add(self:GetForward() * self.Maxs.x) -- Translate to front
		pos:Add(self:GetRight() * self.Maxs.y) -- Translate to left
		pos:Add(self:GetUp() * self.Maxs.z) -- Translate to top

		pos:Add(self:GetForward() * 0.15) -- Pop out of front to stop culling

	return pos
end

function ENT:CalculateRenderAng()
	local ang = self:GetAngles()
		ang:RotateAroundAxis(ang:Right(), -90)
		ang:RotateAroundAxis(ang:Up(), 90)	

	return ang
end
--PATH gamemodes/darkrp/entities/entities/media_base/cl_init.lua:
require 'texture'

plib.IncludeSH 'shared.lua'

cvar.Register 'media_enable'
	:SetDefault(true, true)
	:AddMetadata('Catagory', 'Медиа проигрыватели')
	:AddMetadata('Menu', 'Включить медиа проигрыватели')

cvar.Register 'media_mute_when_unfocused'
	:SetDefault(true, true)
	:AddMetadata('Catagory', 'Медиа проигрыватели')
	:AddMetadata('Menu', 'Не проигрывать когда свернута игра')

cvar.Register 'media_volume'
	:SetDefault(0.75, true)
	:AddMetadata('Catagory', 'Медиа проигрыватели')
	:AddMetadata('Menu', 'Громкость')
	:AddMetadata('Type', 'number')

cvar.Register 'media_quality'
	:SetDefault('low')
	:SetType(function()
		return (v == 'low') or (v == 'medium') or (v == 'high') or (v == 'veryhigh')
	end)

local defaultPlaylist = 'Сохраненные видео'
cvar.Register 'media_saved_videos'
	:SetDefault({[defaultPlaylist] = {}}, true)

local mediaservice = medialib.load 'media'

local currentVideoList = defaultPlaylist

function ENT:OnPlay(media)

end


function ENT:GetSoundOrigin()
	return self
end

function ENT:Think()
	local link = self:GetURL()
	local lp = LocalPlayer()
	local shouldplay = cvar.GetValue('media_enable') and (lp:EyePos():Distance(self:GetPos()) < 720) and (not self:IsPaused()) and ((not lp.AfkTime) or lp.AfkTime < 300)
	local shouldBeMuted = !(system.HasFocus() or (not cvar.GetValue('media_mute_when_unfocused')))
	local targetVolume = !shouldBeMuted and (cvar.GetValue('media_volume') or 0.75) or 0

	if IsValid(self.Media) and (not link or not shouldplay) then
		self.Media:stop()
		self.Media = nil
	elseif shouldplay and (not IsValid(self.Media) or self.Media:getUrl() ~= link) then
		if IsValid(self.Media) then
			self.Media:stop()
			self.Media = nil
		end

		if (link ~= '') then
			local service = mediaservice.guessService(link)
			if service then
				local mediaclip = service:load(link, {use3D = true, ent3D = self:GetSoundOrigin()})
				self:OnPlay(mediaclip)
				mediaclip:setVolume(cvar.GetValue('media_volume') or 0.75)
				mediaclip:setQuality(cvar.GetValue('media_quality'))
				if (self:GetTime() ~= 0) then
					local progress = (CurTime() - self:GetStart()) % self:GetTime()
					mediaclip:seek(progress)
					mediaclip.LastStart = CurTime() - progress
				else
					mediaclip.LastStart = CurTime()
				end
				mediaclip:play()

				self.Media = mediaclip
			end
		end
	elseif (IsValid(self.Media) and self.Media:getVolume() != targetVolume) then
		self.Media:setVolume(targetVolume)
	elseif (IsValid(self.Media) and shouldplay) then
		if (self:IsLooping()) then
			local inCurrentPlay = (CurTime() - self.Media.LastStart) < self:GetTime()
			if (!inCurrentPlay) then

				local progress = (CurTime() - self:GetStart()) % self:GetTime()
				self.Media:seek(progress)
				self.Media.LastStart = CurTime() - progress
			end
		end
	end
end

local color_bg = ui.col.Black
local color_text = ui.col.White
local color_red = ui.col.Red
function ENT:DrawScreen(x, y, w, h)
	if IsValid(self.Media) and cvar.GetValue('media_enable') then
		self.Media:draw(x, y, w, h)
	elseif (cvar.GetValue('media_enable') == false) then
		draw.Box(x, y, w, h, color_bg)
		draw.SimpleText('Медиа проигрыватель отключен.', 'DermaLarge', x + (w * .5),  y + (h * .5), color_red, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	-- elseif (!self:IsFrozen()) then
		-- draw.Box(x, y, w, h, color_bg)
		-- draw.SimpleText('Медиа проигрыватель отключен потому что он не заморожен.', 'DermaLarge', x + (w * .5),  y + (h * .5), color_red, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	elseif (self:IsPaused()) then
		draw.Box(x, y, w, h, color_bg)
		draw.SimpleText('Медиа проигрыватель приостановлен.', 'DermaLarge', x + (w * .5),  y + (h * .5), color_red, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		draw.Box(x, y, w, h, color_bg)
		self:DrawRules(x, y, w, h)
	end
end

function ENT:DrawRules(x, y, w, h)
	draw.Box(x, y, w, h, color_bg)
	draw.SimpleText('Нету медии', 'DermaLarge', x + (w * .5),  y + (h * .45), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText('Соблюдайте правила при воспроизведении медиа', 'DermaLarge', x + (w * .5),  y + (h * .55), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText('Нарушение правил приведет к серьезному наказанию', 'DermaLarge', x + (w * .5),  y + (h * .60), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

-- UI
local PANEL = {}

function PANEL:Init()
	self:SetText('')
	self:SetTall(50)
end


function PANEL:GetTitle()
	return self.TrackTitle
end

function PANEL:GetLink()
	return self.TrackLink
end

function PANEL:GetID()
	return self.TrackID
end


function PANEL:GetMaterial()
	return self.TrackMaterial
end

function PANEL:GetLength()
	return self.TrackLength
end


function PANEL:PerformLayout()

end

function PANEL:SetMedia(link, data)
	self.TrackLink = link

	if istable(data) then
		self.TrackTitle = data.Title
		self.TrackLength = data.Length
		self.TrackID = data.ID

		self:LoadMaterial()
	else

		local service = mediaservice.guessService(link)

		service:query(link, function(err, data)
			if IsValid(self) and (not err) and (data ~= nil) then
				self.TrackTitle = data.title
				self.TrackLength = data.duration or 0
				self.TrackID = data.id

				self:LoadMaterial()

				local favs = cvar.GetValue('media_saved_videos')
				favs[currentVideoList] = favs[currentVideoList] or {}
				favs[currentVideoList][link] = {
					Title = data.title,
					Length = data.duration or 0,
					ID = data.id
				}

				cvar.SetValue('media_saved_videos', favs)
			end
		end)
	end
end

function PANEL:LoadMaterial()
	local id = self:GetID()

	if (id == nil) then return end

	texture.Create('Media.Image.' .. id)
		:EnableProxy(false)
		:EnableCache(true)
		:Download('https://img.youtube.com/vi/' .. id .. '/sddefault.jpg', function(mat, material)
			if IsValid(self) then
				self.TrackMaterial = material
			end
		end)
end

function PANEL:DoClick()
	local m = ui.DermaMenu(self)
	m:AddOption('Играть', function()
		RunConsoleCommand('playsong', self:GetLink())
	end)
	m:AddOption('Зациклить', function()
		RunConsoleCommand('loopsong', self:GetLink())
	end)
	m:AddOption('Переименовать', function()
		ui.StringRequest('Переименовать', 'Как вы хотите переименовать это?', self:GetTitle(), function(title)
			if IsValid(self) then
				local favs = cvar.GetValue('media_saved_videos')
				favs[currentVideoList][self:GetLink()].Title = title
				cvar.SetValue('media_saved_videos', favs)

				self.TrackTitle = title
			end
		end)
	end)
	m:AddOption('Скопировать ссылку', function()
		SetClipboardText(self:GetLink())
	end)
	m:AddOption('Удалить', function()
		local favs = cvar.GetValue('media_saved_videos')
		favs[currentVideoList][self:GetLink()] = nil
		cvar.SetValue('media_saved_videos', favs)

		self:Remove()
	end)
	m:Open()
end

function PANEL:Paint(w, h)
	self.BaseClass.Paint(self, w, h)

	local imw = 0
	local material = self:GetMaterial()
	if material then
		imw = h * 1.33
		surface.SetDrawColor(255, 255, 255)
		surface.SetMaterial(material)
		surface.DrawTexturedRect(5, 5, imw, h - 10)
	end

	local x = imw + 10
	draw.SimpleText(self:GetTitle(), 'ui.18', x, h * 0.3, ui.col.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.SimpleText(string.FormattedTime(self:GetLength(), '%02i:%02i'), 'ui.18', x, h * 0.7, ui.col.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.SimpleText(string.find(self:GetLink(), 'soundcloud') and 'Soundcloud' or 'YouTube', 'ui.12', w - 5, h - 5, ui.col.White, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)
end

vgui.Register('ui_mediabutton', PANEL, 'DButton')


local fr
function ENT:PlayerUse()
	-- Upgrade media_saved_videos to new format if not already
	local favs = cvar.GetValue('media_saved_videos')
	if (not favs[defaultPlaylist] or not istable(favs[defaultPlaylist])) then
		cvar.SetValue('media_saved_videos', {[defaultPlaylist] = favs})
	end

	if IsValid(fr) then fr:Close() end

	local ent = self
	local w, h = ScrW() * .45, ScrH() * .6

	fr = ui.Create('ui_frame', function(self)
		self:SetTitle('Медиа Проигрыватель')
		self:SetSize(w, h)
		self:MakePopup()
		self:Center()
		function self:Think()
			if (not IsValid(ent)) then
				self:Close()
			end
		end
	end)

	local x, y = fr:GetDockPos()

	local videoList
	local playlistList
	local query

	local function listMedia()
		local query = query:GetValue()
		if (string.Trim(query) == '') then query = nil end

		videoList:Reset()

		local favs = cvar.GetValue('media_saved_videos')[currentVideoList] or {}

		local count = 0
		for k, v in pairs(favs) do
			if (not query) or (istable(v) and string.find(v.Title:lower(), query:lower(), 1, true)) then
				videoList:AddItem(ui.Create('ui_mediabutton', function(self, p)
					self:SetMedia(k, v)
				end))

				count = count + 1
			end
		end

		if (count <= 0) then
			videoList:AddSpacer('Ничего не найдено!'):SetTall(30)
		end
	end

	query = ui.Create('DTextEntry', function(self, p)
		self:SetPos(x, y)
		self:SetSize((p:GetWide() * 0.75) - 10, 25)
		self:RequestFocus()
		self.OnChange = function(s)
			listMedia(s:GetValue())
		end
		self:SetPlaceholderText('Поиск..')
	end, fr)

	videoList = ui.Create('ui_listview', function(self, p)
		self:SetPos(5, y + 30)
		self:SetSize((p:GetWide() * 0.75) - 10, p:GetTall() - 100)

		self.Paint = function(self, w, h)
			derma.SkinHook('Paint', 'UIListView', self, w, h)
		end
	end, fr)

	local playlistButtons = {}
	playlistList = ui.Create('ui_listview', function(self, p)
		self:SetPos((p:GetWide() * 0.75), y)
		self:SetSize((p:GetWide() * 0.25) - 5, (videoList.y + videoList:GetTall()) - self.y - 23)

		self.Paint = function(self, w, h)
			derma.SkinHook('Paint', 'UIListView', self, w, h)
		end

		local playlists = {}

		local sp = self:AddSpacer('Плейлисты')
		sp:SetTall(25)
		local addBtn = ui.Create('DButton', function(self, p)
			self:Dock(RIGHT)
			self:SetWide(25)
			self:SetText('')
			self.PaintOver = function(self, w, h)
				surface.SetDrawColor(255, 255, 255)
				surface.DrawRect(7, 12, 11, 1)
				surface.DrawRect(12, 7, 1, 11)
				end

			self.DoClick = function(self)
				ui.StringRequest('Новый плейлист', 'Как вы хотите назвать плейлист?', 'Новый плейлист', function(name)
					local favs = cvar.GetValue('media_saved_videos')
					if (favs[name]) then
						for k, v in pairs(playlistButtons) do
							if (k == name) then
								v:DoClick()
								return
							end
						end
					end

					favs[name] = {}
					cvar.SetValue('media_saved_videos', favs)

					playlistButtons[name] = playlistList:AddRow(name)
					playlistButtons[name]:DoClick()
				end)
			end
		end, sp)

		playlistButtons[defaultPlaylist] = self:AddRow(defaultPlaylist)
		playlistButtons[defaultPlaylist]:DoClick()

		for k, v in pairs(cvar.GetValue('media_saved_videos')) do
			if (k ~= defaultPlaylist) then
				playlistButtons[k] = self:AddRow(k)
			end
		end
	end, fr)

	local delPlaylist = ui.Create('DButton', function(self, p)
		self:SetSize(playlistList:GetWide(), 24)
		self:SetPos(playlistList.x, playlistList.y + playlistList:GetTall() - 1)
		self:SetText('Удалить плейлист')
		self.Think = function(self)
			self:SetDisabled(currentVideoList == defaultPlaylist)
		end
		self.DoClick = function(self)
			if (self.clicked) then
				if (currentVideoList == defaultPlaylist) then return end

				local favs = cvar.GetValue('media_saved_videos')
				favs[currentVideoList] = nil
				cvar.SetValue('media_saved_videos', favs)

				playlistButtons[currentVideoList]:Remove()
				playlistList:PerformLayout()
				playlistButtons[defaultPlaylist]:DoClick()
				currentVideoList = defaultPlaylist

				listMedia()

				self.clicked = nil
				self:SetText('Удалить плейлист')
			else
				self.clicked = true
				self:SetText('Нажмите еще раз')

				timer.Simple(3, function()
					if (IsValid(self) and self.clicked) then
						self.clicked = nil
						self:SetText('Удалить плейлист')
					end
				end)
			end
		end
	end, fr)

	fr.Think = function(self)
		if (currentVideoList ~= playlistList.Selected:GetText()) then
			currentVideoList = playlistList.Selected:GetText()
			listMedia()
		end
	end

	listMedia()

	ui.Create('DButton', function(self, p)
		self:SetText('Пауза')
		self:SetSize(105, 25)
		self:SetPos(5, p:GetTall() - 30)
		self.DoClick = function()
			RunConsoleCommand('pausesong')
		end
		self.Think = function(self)
			self:SetDisabled(false)
			if ent:IsPaused() then
				self:SetText('Возобновить')
			else
				self:SetText('Пауза')
			end
		end
	end, fr)

	local text = ui.Create('DTextEntry', function(self, p)
		self:SetSize(p:GetWide() - 385, 25)
		self:SetPos(115, p:GetTall() - 30)
	end, fr)

	ui.Create('DButton', function(self, p)
		self:SetText('Играть')
		self:SetSize(70, 25)
		self:SetPos(p:GetWide() - 265, p:GetTall() - 30)
		self.DoClick = function()
			RunConsoleCommand('playsong', text:GetValue())
		end
		self.Think = function(self)
			if (not medialib.load('media').guessService(text:GetValue())) then
				self:SetDisabled(true)
			else
				self:SetDisabled(false)
			end
		end
	end, fr)

	ui.Create('DButton', function(self, p)
		self:SetText('Зациклить')
		self:SetSize(90, 25)
		self:SetPos(p:GetWide() - 190, p:GetTall() - 30)
		self.DoClick = function()
			RunConsoleCommand('loopsong', text:GetValue())
		end
		self.Think = function(self)
			if (not medialib.load('media').guessService(text:GetValue())) then
				self:SetDisabled(true)
			else
				self:SetDisabled(false)
			end
		end
	end, fr)

	ui.Create('DButton', function(self, p)
		self:SetText('Сохранить')
		self:SetSize(90, 25)
		self:SetPos(p:GetWide() - 95, p:GetTall() - 30)
		self.DoClick = function()
			local link = text:GetValue()
			local service = medialib.load('media').guessService(link)
			if service then
				service:query(link, function(err, data)
					if (not data) then return end
					if not videoList then return end

					local favs = cvar.GetValue('media_saved_videos')
					favs[currentVideoList] = favs[currentVideoList] or {}
					favs[currentVideoList][link] = {
						Title = data.title,
						Length = data.duration or 0,
						ID = data.id
					}

					cvar.SetValue('media_saved_videos', favs)
					listMedia()

					text:SetValue('')
				end)
			end
		end
		self.Think = function(self)
			local favs = cvar.GetValue('media_saved_videos')[currentVideoList] or {}
			if favs[text:GetValue()] or (not mediaservice.guessService(text:GetValue())) then
				self:SetDisabled(true)
			else
				self:SetDisabled(false)
			end
		end
	end, fr)
end
--PATH gamemodes/darkrp/entities/entities/media_base/shared.lua:
ENT.Type 		= 'anim'
ENT.Base		= 'base_rp'
ENT.Spawnable	= false

ENT.MediaPlayer = true
ENT.NetworkPlayerUse = true

function ENT:SetupDataTables()
	self:NetworkVar('String', 0, 'URL')
	self:NetworkVar('String', 1, 'Title')
	self:NetworkVar('Int', 0, 'Start')
	self:NetworkVar('Int', 1, 'Time')
	self:NetworkVar('Int', 2, 'Frozen')
	self:NetworkVar('Int', 3, 'Paused')
	self:NetworkVar('Int', 4, 'Looping')
	self:NetworkVar("Entity", 0, "owning_ent")
end

function ENT:IsFrozen()
	return (self:GetFrozen() == 1)
end

function ENT:IsPaused()
	return (self:GetPaused() == 1)
end

function ENT:IsLooping()
	return (self:GetLooping() == 1)
end
--PATH addons/rptip/lua/entities/rp_box/cl_init.lua:
include("shared.lua")
surface.CreateFont( "TextForBox", {
	font = "Trebuchet24",
	size = 80,
	weight = 1000, 
	blursize = 0, 
	scanlines = 0, 
	antialias = false, 
	underline = false, 
	italic = false, 
	strikeout = false, 
	symbol = false, 
	rotary = false, 
	shadow = false, 
	additive = false, 
	outline = false,
} )
function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()
	local ang = self:GetAngles()
	ang:RotateAroundAxis(self:GetAngles():Forward(),90)
	ang:RotateAroundAxis(self:GetAngles():Up(),90)
	if LocalPlayer():GetPos():Distance(self:GetPos()) < 500 then
		cam.Start3D2D(self:GetPos() + ang:Right()* -45 + ang:Up()* 1,ang,0.1)  --Vector(-26,0,90)
			draw.SimpleTextOutlined("Коробка", "TextForBox", 0, 0,  Color(255,255,255,255), 1, 0, 1,Color(0,0,0,255) )
			draw.SimpleTextOutlined("Нажмите на ''E''", "TextForBox", 0, 60,  Color(255,255,255,255), 1, 0, 1,Color(0,0,0,255) )
		cam.End3D2D()
	end
end

function ENT:Think()
end

--PATH addons/111mod/lua/entities/spawn_trash/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName= "Стол продаж"
ENT.Author= "Cook"
ENT.Category = "@GambitEnts"
ENT.Spawnable = true
ENT.AdminSpawnable = true
--PATH gamemodes/darkrp/entities/entities/spawned_food/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Spawned Food"
ENT.Author = "Rickster"
ENT.Spawnable = false
ENT.IsSpawnedFood = true

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 1, "owning_ent")
end

--PATH gamemodes/darkrp/entities/entities/spawned_money/cl_init.lua:
include("shared.lua")

function ENT:Draw()
    self:DrawModel()

    -- Do not draw labels when a different model is used.
    -- If you want a different model with labels, make your own money entity and use GM.Config.MoneyClass.
    if self:GetModel() ~= "models/props/cs_assault/money.mdl" then return end

    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    surface.SetFont("Default")
    local text = DarkRP.formatMoney(self:Getamount())
    local TextWidth = surface.GetTextSize(text)

    cam.Start3D2D(Pos + Ang:Up() * 0.82, Ang, 0.1)
        draw.WordBox(2, -TextWidth * 0.5, -10, text, "Default", Color(30, 30, 30, 100), Color(255, 255, 255, 255))
    cam.End3D2D()

    Ang:RotateAroundAxis(Ang:Right(), 180)

    cam.Start3D2D(Pos, Ang, 0.1)
        draw.WordBox(2, -TextWidth * 0.5, -10, text, "Default", Color(30, 30, 30, 100), Color(255, 255, 255, 255))
    cam.End3D2D()
end

function ENT:Think()
end

--PATH addons/111mod/lua/entities/travka_vidashka/cl_init.lua:
include("shared.lua")

surface.CreateFont( "DispenserZCCFont", {
	font = "Arial",
	size = 35,
	weight = 500
} )

function ENT:Initialize()
end

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

	local text = "Коробка"
	local text2 = "Нажми Е что бы взять"
	local text3 = ""

	if LocalPlayer():GetPos():Distance(self:GetPos()) < 300 then
		cam.Start3D2D(Pos + Ang:Up() * 1 + Ang:Right() * -30, Ang, 0.1)
			draw.SimpleText( text, "npc", 0,0, Color(70,130,208), 1,1 )
		cam.End3D2D()
		if LocalPlayer():GetPos():Distance(self:GetPos()) < 300 then
			cam.Start3D2D(Pos + Ang:Up() * 1 + Ang:Right() * -25, Ang, 0.1)
				local x,y = draw.SimpleText( text2, "npc2", 0,0, Color(255,255,255), 1,1 )
				surface.SetDrawColor(255, 255, 255, 255)
				draw.SimpleText( text3, "npc", 0,45, Color(255,255,255), 1,1 )
			cam.End3D2D()
		end
	end
end

function ENT:Think()
end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_fuel_station_electricity/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Fuel: Electric"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.VC_Type = "fuel"
ENT.VC_FuelType = 2
ENT.VC_CanBeDamaged = true
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_fuel_station_petrol/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Fuel: Petrol"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.VC_Type = "fuel"
ENT.VC_FuelType = 0
ENT.VC_CanBeDamaged = true
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_npc_obj_spawn/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "NPC spawn platform"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = false
ENT.AdminSpawnable = false

--PATH addons/vcmod_main_autoupdate/lua/entities/vc_npc_repair/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.PrintName		= "Car dealer"
ENT.Author			= "freemmaann"
ENT.Category		= "VCMod"
ENT.Contact			= "N/A"
ENT.Purpose			= "N/A"
ENT.Instructions	= "Press E"
ENT.Spawnable		= false
ENT.AdminSpawnable		= false
ENT.AutomaticFrameAdvance = true

function ENT:SetAutomaticFrameAdvance(bUsingAnim) self.AutomaticFrameAdvance = bUsingAnim end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_engine/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Vehicle part: engine"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.VC_Type = "carpart"
ENT.VC_Method = "engine"
ENT.VC_CanBeDamaged = false
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_healthkit_25/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_Color = Color(100, 255, 55, 255) self.VC_Length = 210 self.VC_Text = "Vehicle Repair 25%" self.VC_PVsb = util.GetPixelVisibleHandle() end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_light/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Vehicle part: light"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.VC_Type = "carpart"
ENT.VC_Method = "light"
ENT.VC_CanBeDamaged = false
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_spikestrip_pointyend/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Spike strip pointy end"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = false
ENT.AdminSpawnable = false
--PATH addons/snowball/lua/entities/zck_snowball/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_christmas/snowballswep/zck_w_snowballswep.mdl"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Снежки"
ENT.Category = "Zeros Snowball Swep"
ENT.RenderGroup = RENDERGROUP_OPAQUE

--PATH addons/snowball/lua/entities/zck_snowballcrate/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_christmas/snowballswep/zck_snowballcrate.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Snowball Crate"
ENT.Category = "Zeros Snowball Swep"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "UsedCrateCount")

	if SERVER then
		self:SetUsedCrateCount(0)
	end
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_acid/cl_init.lua:
include("shared.lua")

function ENT:Initialize()

end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_autobreaker/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_autobreaker.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Automatic IceBreaker"
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

--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_meth/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Meth.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Meth.Draw(self)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_methylamine/cl_init.lua:
include("shared.lua")

function ENT:Initialize()

end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_machine_furnace/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Furnace.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Furnace.Draw(self)
end

function ENT:OnRemove()
	zmlab2.Furnace.OnRemove(self)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_machine_mixer/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_mixer.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Mixer"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "ProcessState")
    /*
        0 = Needs Barrel
        1 = Needs Acid
        2 = Press the Start Mix Button
        3 = Add Aluminium
        4 = Press the Start Mix Button
        5 = Add Exhaust pipe
        6 = Moving Acid (Loading)
        7 = Needs to be cleaned
    */

    self:NetworkVar("Int", 2, "MethQuality")
    self:NetworkVar("Int", 3, "NeedAmount")

    self:NetworkVar("Int", 5, "ErrorStart")
    self:NetworkVar("Int", 6, "ProcessStart")

    self:NetworkVar("Int", 7, "MethType")

    if (SERVER) then
        self:SetProcessState(-1)

        self:SetMethQuality(0)
        self:SetNeedAmount(0)

        self:SetErrorStart(-1)
        self:SetProcessStart(-1)

        self:SetMethType(1)
    end
end

function ENT:OnStart(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)
    if lp.x > -10 and lp.x < 0 and lp.y < 15 and lp.y > 10 and lp.z > 27 and lp.z < 31 then
        return true
    else
        return false
    end
end

function ENT:OnMethType(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)
    if lp.x > -10 and lp.x < 0 and lp.y < 15 and lp.y > 10 and lp.z > 32 and lp.z < 37 then
        return true
    else
        return false
    end
end

function ENT:OnErrorButton(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)
    if lp.x > -10 and lp.x < 0 and lp.y < 15 and lp.y > 10 and lp.z > 28 and lp.z < 33.6 then
        return true
    else
        return false
    end
end

function ENT:OnCenterButton(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -10 and lp.x < 0 and lp.y < 15 and lp.y > 10 and lp.z > 25 and lp.z < 38 then
        return true
    else
        return false
    end
end




// Tell us if you allow to receive liquid
function ENT:AllowConnection(From_ent)
    if From_ent:GetClass() == "zmlab2_machine_furnace" and From_ent:GetProcessState() == 4 and self:GetProcessState() == 1 then
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

--PATH addons/zeros_methlab2/lua/entities/zmlab2_machine_ventilation/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Ventilation.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Ventilation.Draw(self)
end

function ENT:Think()
	zmlab2.Ventilation.OnThink(self)
end

function ENT:OnRemove()
	zmlab2.Ventilation.OnRemove(self)
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_bong03_ent.lua:
AddCSLuaFile()
DEFINE_BASECLASS("zwf_bong_ent")
ENT.Type = "anim"
ENT.Base = "zwf_bong_ent"
ENT.Model = "models/zerochain/props_weedfarm/zwf_bong03.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Dark Leaf"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.BongID = 3

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

--PATH addons/zeros_weedfarm/lua/entities/zwf_drystation/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model =  "models/zerochain/props_weedfarm/zwf_drystation.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Dry Station"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

--PATH addons/zeros_weedfarm/lua/entities/zwf_lamp/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_lamp01.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Lamp"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Power")
    self:NetworkVar("Entity", 0, "Output")
    self:NetworkVar("Entity", 1, "PowerSource")
    self:NetworkVar("Bool", 0, "IsRunning")
    self:NetworkVar("Int", 2, "LampID")

    if (SERVER) then
        self:SetPower(0)
        self:SetIsRunning(false)
        self:SetPowerSource(NULL)
        self:SetLampID(1)
    end
end

function ENT:EnableButton(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    --zwf.f.Debug_Sphere(pos,size,lifetime,color,ignorez)
    if lp.z > -2 and lp.z < 4 and lp.x < 34 and lp.x > 28 then
        return true
    else
        return false
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_seed_bank/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_seedbank.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Seed Bank"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

--PATH addons/zeros_weedfarm/lua/entities/zwf_soil/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_soil.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Soil"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

--PATH addons/m9k/lua/effects/m9k_effect_mad_penetration_trace/init.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/effects/m9k_effect_mad_penetration_trace/init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

EFFECT.Mat = Material( "effects/spark" ) 

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
	
 	render.DrawBeam(self.StartPos, self.EndPos, 8 * fDelta, 1, 0, color) 
end
--PATH addons/itemstore_new/lua/itemstore/shared.lua:
﻿itemstore.Version = "3.0"
itemstore.About = string.format([[ItemStore v%s

Authored solely by UselessGhost
http://steamcommunity.com/id/uselessghost
]], itemstore.Version)
MsgC(color_white, "ItemStore", Color(100, 200, 255), " ", itemstore.Version, " ", Color(200, 200, 200), "coded by ", Color(255, 150, 150), "UselessGhost", "\n")

concommand.Add("itemstore_about", function()
    MsgC(color_white, itemstore.About)
end)

function itemstore.Log(msg, ...)
    local original = msg

    local params = {...}

    for k, v in ipairs(params) do
        local value = tostring(v)

        if IsEntity(v) then
            if IsValid(v) then
                if v:IsPlayer() then
                    value = v:Name() .. " (" .. v:SteamID() .. ")"
                else
                    value = v:GetClass()
                end
            else
                value = "(NULL entity)"
            end
        elseif isvector(v) then
            value = string.format("{%f, %f, %f}", v.x, v.y, v.z)
        elseif istable(v) and v.ItemStore then
            value = v:GetName() .. " (" .. v:GetClass() .. ")"
        end

        msg = string.Replace(msg, "{" .. k .. "}", value)
    end

    if itemstore.config.PrintLog then
        print(msg)
    end

    hook.Call("ItemStoreLog", GAMEMODE, msg, original, ...)
end

itemstore.config = {}

function itemstore.config.Verify(setting, correct_type)
    if type(itemstore.config[setting]) ~= correct_type then
        error(string.format("[ItemStore] Configuration error: %s is %s, should be %s.", setting, var_type, correct_type))

        return false
    end

    return true
end

local status, err = pcall(function()
    include("itemstore/config.lua")
    itemstore.config.Verify("Skin", "string")
    itemstore.config.Verify("PickupsGotoBank", "boolean")
    itemstore.config.Verify("InvholsterTakesAmmo", "boolean")
    itemstore.config.Verify("MaxStack", "number")
    itemstore.config.Verify("GamemodeProvider", "string")
    itemstore.config.Verify("LimitToJobs", "table")
    itemstore.config.Verify("HighlightColours", "table")
    itemstore.config.Verify("TradeDistance", "number")
    itemstore.config.Verify("MigrateOldData", "boolean")
    itemstore.config.Verify("DeathLoot", "boolean")
    itemstore.config.Verify("SplitWeaponAmmo", "boolean")
    itemstore.config.Verify("TradingEnabled", "boolean")
    itemstore.config.Verify("PickupDistance", "number")
    itemstore.config.Verify("InventorySizes", "table")
    itemstore.config.Verify("BankSizes", "table")
    itemstore.config.Verify("AntiDupe", "boolean")
    itemstore.config.Verify("SaveOnWrite", "boolean")
    itemstore.config.Verify("ContextInventoryPosition", "string")
    itemstore.config.Verify("EnableInvholster", "boolean")
    itemstore.config.Verify("SaveInterval", "number")
    itemstore.config.Verify("ContextInventory", "boolean")
    itemstore.config.Verify("DropDistance", "number")
    itemstore.config.Verify("TradeCooldown", "number")
    itemstore.config.Verify("Colours", "table")
    itemstore.config.Verify("DeathLootTimeout", "number")
    itemstore.config.Verify("DisabledItems", "table")
    itemstore.config.Verify("InvholsterDisabled", "table")
    itemstore.config.Verify("HighlightStyle", "string")
    itemstore.config.Verify("DataProvider", "string")
    itemstore.config.Verify("CustomItems", "table")
    itemstore.config.Verify("Verify", "function")
    itemstore.config.Verify("IgnoreOwner", "boolean")
    itemstore.config.Verify("ChatCommandPrefix", "string")
    itemstore.config.Verify("PickupKey", "number")
    itemstore.config.Verify("BoxBreakable", "boolean")
    itemstore.config.Verify("BoxHealth", "number")
    itemstore.config.Verify("Language", "string")
    itemstore.config.Verify("UseNewUI", "boolean")
    itemstore.config.Verify("LoadDelay", "number")
    itemstore.config.Verify("PrintLog", "boolean")
    itemstore.config.Verify("VerboseLogging", "boolean")
    itemstore.config.Verify("bLogs", "boolean")
end)

-- remove this if it's here since the player probably is fiddling with the config
hook.Remove("HUDPaint", "ItemStoreError")

if not status then
    local str = "ITEMSTORE CONFIGURATION ERROR:\n"
    str = str .. err .. "\n"
    str = str .. "ITEMSTORE WILL NOT RUN AND MANY THINGS WILL BE BROKEN.\n"
    str = str .. "THIS IS NOT A PROBLEM WITH ITEMSTORE, YOUR CONFIG FILE HAS AN ERROR IN IT.\n"
    str = str .. "PLEASE INSTALL A FRESH COPY OF ITEMSTORE OR FIX THE ERROR IN YOUR CONFIG.\n"
    str = str .. "SEE YOUR SERVER CONSOLE FOR MORE DETAILS."
    MsgC(Color(255, 0, 0), str, "\n")

    if CLIENT then
        hook.Add("HUDPaint", "ItemStoreError", function()
            for k, v in ipairs(string.Explode("\n", str)) do
                draw.SimpleText(v, "Trebuchet24", ScrW() / 2, ScrH() / 2 + (k * 24), Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end)
    end
end

include("language.lua")
include("gamemodes.lua")
include("items.lua")
include("containers.lua")
include("trading.lua")
include("admin.lua")
local _, dirs = file.Find("itemstore/modules/*", "LUA")

for _, mod in ipairs(dirs) do
    MsgC(color_white, string.format("Loading ItemStore module: %s\n", mod))
    local path = "itemstore/modules/" .. mod

    for _, filename in ipairs(file.Find(path .. "/*.lua", "LUA")) do
        if not string.match(filename, "^sv_.+%.lua$") then
            AddCSLuaFile(path .. "/" .. filename)
        end
    end

    local sv_init = path .. "/sv_init.lua"
    local cl_init = path .. "/cl_init.lua"
    local shared = path .. "/shared.lua"

    if file.Exists(shared, "LUA") then
        include(shared)
    end

    if SERVER and file.Exists(sv_init, "LUA") then
        include(sv_init)
    end

    if CLIENT and file.Exists(cl_init, "LUA") then
        include(cl_init)
    end
end

local teams = nil
local meta = FindMetaTable("Player")

function meta:CanUseInventory()
    if SERVER and (not self.Inventory or not self.Bank) then return end
    if self:IsAdmin() then return true end -- always allow admins to access their inventories
    if not self:Alive() then return false end -- using your inventory while dead can be a bit exploitable

    if #itemstore.config.LimitToJobs > 0 then
        -- process this into an associative table for faster lookups
        if not teams then
            teams = {}

            for k, v in pairs(itemstore.config.LimitToJobs) do
                teams[v] = true
            end
        end

        if not teams[self:Team()] then return false end
    end

    return true
end
--PATH addons/the_cocaine_factory/lua/itemstore/items/cocaine_box.lua:
ITEM.Name = "Drug Holder"
ITEM.Description = "Contains all your packed cocaine."
ITEM.Model = "models/craphead_scripts/the_cocaine_factory/utility/cocaine_box.mdl"
ITEM.Base = "base_darkrp"
ITEM.Stackable = false
ITEM.DropStack = false

function ITEM:GetDescription()

	local coco_amount = self:GetData("BoxAmount")
	
	local desc = "Contains ".. coco_amount .." packs of cocaine"

	return self:GetData("Description", desc)
end

function ITEM:SaveData( ent )
	self:SetData( "BoxAmount", ent.BoxCocaineAmount )
	self:SetData( "BoxIsClosed", ent.IsClosed )
	
	local box_owner = ent.BoxOwner
	self:SetData( "BoxOwner", box_owner )
end

function ITEM:LoadData(ent)
	timer.Simple( 0.1,function()
		if IsValid( ent ) then

			ent.BoxCocaineAmount = self:GetData( "BoxAmount" )
			ent.IsClosed = self:GetData( "BoxIsClosed" )
			
			if ent.IsClosed then
				ent:SetBodygroup( 1, 1 )
				ent.IsClosed = true
			else
				ent:SetBodygroup( 1, 0 )
				ent.IsClosed = false
			end
			
			ent:SetBodygroup( 2, ent.BoxCocaineAmount )
			
			ent.BoxOwner = self:GetData( "BoxOwner" )
		end
	end )
end
--PATH addons/itemstore_new/lua/itemstore/items/drug_lab.lua:
﻿ITEM.Name = itemstore.Translate("druglab_name")
ITEM.Description = itemstore.Translate("druglab_desc")
ITEM.Model = "models/props_lab/crematorcase.mdl"
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
--PATH addons/itemstore_new/lua/itemstore/items/food.lua:
﻿ITEM.Name = itemstore.Translate("food_name")
ITEM.Description = itemstore.Translate("microwavefood_desc")
ITEM.Model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Consumables
ITEM.Base = "base_darkrp"
ITEM.Stackable = true

function ITEM:Use(pl)
    pl:setSelfDarkRPVar("Energy", 100)
    umsg.Start("AteFoodIcon", pl)
    umsg.End()

    return self:TakeOne()
end

function ITEM:SaveData(ent)
    self:SetData("Owner", ent:Getowning_ent())
end

function ITEM:LoadData(ent)
    ent:Setowning_ent(self:GetData("Owner"))
end
--PATH addons/itemstore_new/lua/itemstore/items/prop_physics.lua:
﻿ITEM.Name = itemstore.Translate("prop_name")
ITEM.Description = itemstore.Translate("prop_desc")
ITEM.Base = "base_auto"

function ITEM:CanPickup(pl, ent)
    if CPPI then
        if ent:CPPIGetOwner() ~= pl then return false end
    end

    return true
end
--PATH addons/zeros_methlab2/lua/itemstore/items/zmlab2_item_meth.lua:
--leak by matveicher and Партизан
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher and angeldead.
ITEM.Name = "Meth"
ITEM.Description = "Some meth info."
ITEM.Model = "models/zerochain/props_methlab/zmlab2_bag.mdl"
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
--PATH addons/itemstore_new/lua/itemstore/vgui/shopeditor.lua:
local PANEL = {}

AccessorFunc( PANEL, "Entity", "Entity" )

function PANEL:Init()
	self:SetTitle( "Edit Shop" )
	self:SetSkin( "itemstore" )
	self:SetSize( 250, 500 )
	
	self.Panel = vgui.Create( "DPanel", self )
	self.Panel:Dock( FILL )
	self.Panel:DockPadding( 5, 5, 5, 5 )

	self.NameLabel = vgui.Create( "DLabel", self.Panel )
	self.NameLabel:Dock( TOP )
	self.NameLabel:SetText( "Name" )
	self.NameLabel:SetDark( true )

	self.Name = vgui.Create( "DTextEntry", self.Panel )
	self.Name:Dock( TOP )
	self.Name:DockMargin( 0, 0, 0, 2 )
	self.Name:SetText( "NPC Shop" )

	self.WidthLabel = vgui.Create( "DLabel", self.Panel )
	self.WidthLabel:Dock( TOP )
	self.WidthLabel:SetText( "Width" )
	self.WidthLabel:SetDark( true )

	self.Width = vgui.Create( "DNumberWang", self.Panel )
	self.Width:Dock( TOP )
	self.Width:DockMargin( 0, 0, 0, 2 )	
	self.Width:SetMin( 1 )
	self.Width:SetMax( 32 )
	self.Width:SetDecimals( 0 )
	self.Width:SetValue( 4 )

	self.HeightLabel = vgui.Create( "DLabel", self.Panel )
	self.HeightLabel:Dock( TOP )
	self.HeightLabel:SetText( "Height" )
	self.HeightLabel:SetDark( true )

	self.Height = vgui.Create( "DNumberWang", self.Panel )
	self.Height:Dock( TOP )
	self.Height:DockMargin( 0, 0, 0, 2 )	
	self.Height:SetMin( 1 )
	self.Height:SetMax( 32 )
	self.Height:SetDecimals( 0 )
	self.Height:SetValue( 4 )

	self.PagesLabel = vgui.Create( "DLabel", self.Panel )
	self.PagesLabel:Dock( TOP )
	self.PagesLabel:SetText( "Pages" )
	self.PagesLabel:SetDark( true )

	self.Pages = vgui.Create( "DNumberWang", self.Panel )
	self.Pages:Dock( TOP )
	self.Pages:DockMargin( 0, 0, 0, 2 )	
	self.Pages:SetMin( 1 )
	self.Pages:SetMax( 32 )
	self.Pages:SetDecimals( 0 )
	self.Pages:SetValue( 1 )

	self.ModelLabel = vgui.Create( "DLabel", self.Panel )
	self.ModelLabel:Dock( TOP )
	self.ModelLabel:SetText( "Model" )
	self.ModelLabel:SetDark( true )

	self.Model = vgui.Create( "DTextEntry", self.Panel )
	self.Model:Dock( TOP )
	self.Model:DockMargin( 0, 0, 0, 2 )	
	self.Model:SetText( "models/Humans/Group03/Female_01.mdl" )

	self.TeamListLabel = vgui.Create( "DLabel", self.Panel )
	self.TeamListLabel:Dock( TOP )
	self.TeamListLabel:SetText( "Teams (leave empty for none)" )
	self.TeamListLabel:SetDark( true )

	self.TeamList = vgui.Create( "DListView", self.Panel )
	self.TeamList:Dock( FILL )
	self.TeamList:DockMargin( 0, 0, 0, 2 )	
	self.TeamList:AddColumn( "Team" )

	function self.TeamList.OnRowSelected( _, row )
		self.TeamList:RemoveLine( row )
	end

	self.TeamSelector = vgui.Create( "DComboBox", self.Panel )
	self.TeamSelector:Dock( BOTTOM )

	for _, team in pairs( team.GetAllTeams() ) do
		self.TeamSelector:AddChoice( team.Name )
	end

	function self.TeamSelector.OnSelect( _, i, value )
		self.TeamList:AddLine( value )
	end

	self.Accept = vgui.Create( "DButton", self )
	self.Accept:Dock( BOTTOM )
	self.Accept:DockMargin( 0, 5, 0, 0 )
	self.Accept:SetText( "Edit Shop" )
	self.Accept:SetIcon( "icon16/pencil.png" )
	function self.Accept.DoClick()
		net.Start( "ItemStoreEditShop" )
			net.WriteEntity( self:GetEntity() )
			net.WriteString( self:GetName() )
			net.WriteUInt( self:GetWidth(), 8 )
			net.WriteUInt( self:GetHeight(), 8 )
			net.WriteUInt( self:GetPages(), 8 )
			net.WriteString( self:GetModel() )

			net.WriteUInt( #self:GetTeams(), 8 )
			for k, v in ipairs( self:GetTeams() ) do
				net.WriteString( v )
			end
		net.SendToServer()
	end

	self.EditContainer = vgui.Create( "DButton", self )
	self.EditContainer:Dock( BOTTOM )
	self.EditContainer:DockMargin( 0, 5, 0, 0 )
	self.EditContainer:SetText( "Edit Shop Container" )
	self.EditContainer:SetIcon( "icon16/box.png" )
	function self.EditContainer.DoClick()
		net.Start( "ItemStoreEditShopContainer" )
			net.WriteEntity( self:GetEntity() )
		net.SendToServer()
	end

	for k, v in ipairs( self.Panel:GetChildren() ) do
		v:SetZPos( k )
	end
end

function PANEL:GetName()
	return self.Name:GetText()
end

function PANEL:SetName( name )
	self.Name:SetText( name )
end

function PANEL:GetWidth()
	return self.Width:GetValue()
end

function PANEL:SetWidth( w )
	self.Width:SetValue( w )
end

function PANEL:GetHeight()
	return self.Height:GetValue()
end

function PANEL:SetHeight( h )
	self.Height:SetValue( h )
end

function PANEL:GetPages()
	return self.Pages:GetValue()
end

function PANEL:SetPages( p )
	self.Pages:SetValue( p )
end

function PANEL:GetModel()
	return self.Model:GetValue()
end

function PANEL:SetModel( model )
	self.Model:SetText( model )
end

function PANEL:GetTeams()
	local teams = {}

	for k, v in ipairs( self.TeamList:GetLines() ) do
		teams[ k ] = v:GetValue( 1 )
	end

	return teams
end

function PANEL:SetTeams( teams )
	self.TeamList:Clear()

	for k, v in ipairs( teams ) do
		self.TeamList:AddLine( v )
	end
end

vgui.Register( "ItemStoreShopEditor", PANEL, "DFrame" )

--PATH addons/itemstore_new/lua/itemstore/vgui/window.lua:
﻿local PANEL = {}
PANEL.TitleBarHeight = 24

function PANEL:Init()
    self:SetSkin("itemstore")
    self.TitleBar = vgui.Create("Panel", self)
    self.TitleBar:Dock(TOP)
    self.TitleBar:SetHeight(24)
    self.TitleBar.Paint = function() return self:PaintTitleBar() end
    self.Title = vgui.Create("DLabel", self.TitleBar)
    self.Title:Dock(LEFT)
    self.CloseButton = vgui.Create("DButton", self.TitleBar)
    self.CloseButton:SetSize(16, 16)
    self.CloseButton:SetFont("Marlett")
    self.CloseButton:SetText("r")
    self.Body = vgui.Create("Panel", self)
    self.Body:Dock(FILL)
    self.Body:SetPadding(5, 5, 5, 5)
    self.Body.Paint = function() return self:PaintContent() end
    self:SetTitle("ItemStore")
end

function PANEL:GetTitle()
    return self.Title:GetText()
end

function PANEL:SetTitle(text)
    self.Title:SetText(text)
end

function PANEL:PaintTitleBar(w, h)
end

function PANEL:PaintContent(w, h)
end

vgui.Register("ItemStoreWindow", PANEL)
--PATH addons/deceive/lua/deceive/sh_shipments.lua:

if not DarkRP then return end

if deceive.Config and deceive.Config.NoDefaultShipments then return end

-- Feel free to toy with these

hook.Add("Initialize", "deceive.shipments", function()
    DarkRP.createEntity("Disguise Drawer", {
    	ent = "sent_disguise_drawer",
    	model = "models/props_c17/FurnitureDrawer001a.mdl",
    	price = 2500,
    	max = 3,
    	cmd = "buydrawer",
    	allowed = {TEAM_MOB},
        category = "Other",
    })

    DarkRP.createShipment("Disguise Kit", {
        model = "models/props_c17/BriefCase001a.mdl",
        entity = "sent_disguise_kit",
        price = 1250,
        amount = 5,
        separate = false,
        pricesep = 0,
        noship = false,
        cmd = "buydisguisekit",
        allowed = {TEAM_MOB},
        category = "Other",
    })
end)


--PATH addons/zeros_methlab2/lua/zmlab2_languages/sh_language_ru.lua:
zmlab2 = zmlab2 or {}
zmlab2.language = zmlab2.language or {}

if (zmlab2.config.SelectedLanguage == "ru") then
    zmlab2.language["YouDontOwnThis"] = "Тебе это не принадлежит!"
    zmlab2.language["Minutes"] = "Минуты"
    zmlab2.language["Seconds"] = "Секунды"
    zmlab2.language["CratePickupFail"] = "Ящик пуст!"
    zmlab2.language["CratePickupSuccess"] = "Собранно $MethAmount $MethName, Качество: $MethQuality%"
    zmlab2.language["Interaction_Fail_Job"] = "У вас нет подходящей работы, чтобы взаимодействовать с этим!"
    zmlab2.language["Interaction_Fail_Dropoff"] = "Эта точка продажи не назначена вам!"
    zmlab2.language["Dropoff_assinged"] = "Продажа назначена!"
    zmlab2.language["Dropoff_cooldown"] = "Перезарядки продажи!"
    zmlab2.language["Equipment"] = "Оборудование"
    zmlab2.language["Equipment_Build"] = "Построить"
    zmlab2.language["Equipment_Move"] = "Передвинуть"
    zmlab2.language["Equipment_Repair"] = "Починить"
    zmlab2.language["Equipment_Remove"] = "Удалить"
    zmlab2.language["NotEnoughMoney"] = "У тебя не хватает денег!"
    zmlab2.language["ExtinguisherFail"] = "Объект не горит!"
    zmlab2.language["Start"] = "Начать"
    zmlab2.language["Drop"] = "Убрать"
    zmlab2.language["Move Liquid"] = "Передвинуть жидкость"
    zmlab2.language["Frezzer_NeedTray"] = "Подноса с размороженным метамфетамином не найдено!"
    zmlab2.language["ERROR"] = "ОШИБКА"
    zmlab2.language["SPACE"] = "Нажмите SPACE"
    zmlab2.language["NPC_InteractionFail01"] = "Я не имею дела с незнакомцами! [Неправильная работа]"
    zmlab2.language["NPC_InteractionFail02"] = "У тебя нет никакого метамфетамина!"
    zmlab2.language["NPC_InteractionFail03"] = "У меня нет свободного места для продажи, вернитесь позже."
    zmlab2.language["PoliceWanted"] = "Продать метамфетамин!"
    zmlab2.language["MissingCrate"] = "Неизвестный ящик"
    zmlab2.language["Storage"] = "Палитра"
    zmlab2.language["ItemLimit"] = "Вы достигли предела сущности для $ItemName!"
    zmlab2.language["TentFoldInfo01"] = "Вы уверены, что хотите убрать палатку?"
    zmlab2.language["TentFoldInfo02"] = "Любое оборудование внутри тоже будет удалено!"
    zmlab2.language["TentFoldAction"] = "РАЗОБРАТЬ"
    zmlab2.language["TentType_None"] = "НИКТО"
    zmlab2.language["TentAction_Build"] = "ПОСТАВИТЬ"
    zmlab2.language["TentBuild_Info"] = "Пожалуйста, очистите территорию!"
    zmlab2.language["TentBuild_Abort"] = "Что-то мешает!"
    zmlab2.language["Enabled"] = "Включено"
    zmlab2.language["Disabled"] = "Выключено"
    zmlab2.language["MethTypeRestricted"] = "Вам не разрешается делать этот тип метамфетамина!"
    zmlab2.language["SelectMethType"] = "Выбрать тип метамфетамина"
    zmlab2.language["SelectTentType"] = "Выберите тип палатки"
    zmlab2.language["LightColor"] = "Цвет освещения"
    zmlab2.language["Cancel"] = "Отменить"
    zmlab2.language["Deconstruct"] = "Разобрать"
    zmlab2.language["Construct"] = "Построить"
    zmlab2.language["Choosepostion"] = "Выберите новую позицию"
    zmlab2.language["ChooseMachine"] = "Выберите машину"
    zmlab2.language["Extinguish"] = "Потушить"
    zmlab2.language["PumpTo"] = "Насос, чтобы"
    zmlab2.language["ConstructionCompleted"] = "Строительство завершено!"
    zmlab2.language["Duration"] = "Продолжительность"
    zmlab2.language["Amount"] = "Количество"
    zmlab2.language["Difficulty"] = "Сложность"
    zmlab2.language["Money"] = "Деньги"
    zmlab2.language["Difficulty_Easy"] = "Легко"
    zmlab2.language["Difficulty_Medium"] = "Средне"
    zmlab2.language["Difficulty_Hard"] = "Сложно"
    zmlab2.language["Difficulty_Expert"] = "Эксперт"
    zmlab2.language["Connected"] = "Подключен!"
    zmlab2.language["Missed"] = "Промах!"

    // Tent Config
    // Note: "Vamonos Pest" and "Crystale Castle" are the names of those tents so you dont need to translate them if you dont want
    zmlab2.language["tent01_title"] = "Маленькая палатка"
    zmlab2.language["tent01_desc"] = "В этой небольшой палатке предусмотрено место для 6 предметов."
    zmlab2.language["tent02_title"] = "Средняя палатка"
    zmlab2.language["tent02_desc"] = "В этой палатке среднего размера предусмотрено место для 9 предметов."
    zmlab2.language["tent03_title"] = "Большая палатка"
    zmlab2.language["tent03_desc"] = "В этой большой палатке предусмотрено место для 16 предметов."
    zmlab2.language["tent04_title"] = "Crystale Castle"
    zmlab2.language["tent04_desc"] = "В этой кристальной палатке есть место для 24 предметов."

    // Equipment Config
    zmlab2.language["ventilation_title"] = "Вентиляция"
    zmlab2.language["ventilation_desc"] = "Очищает окружающую территорию от загрязнений."
    zmlab2.language["storage_title"] = "Хранилище"
    zmlab2.language["storage_desc"] = "Предоставляет химикаты и оборудование."
    zmlab2.language["furnace_title"] = "Ториевая печь"
    zmlab2.language["furnace_desc"] = "Используется для нагрева кислоты."
    zmlab2.language["mixer_title"] = "Миксер"
    zmlab2.language["mixer_desc"] = "Используется как основной реакционный сосуд для объединения соединений."
    zmlab2.language["filter_title"] = "Фильтр"
    zmlab2.language["filter_desc"] = "Используется для очистки конечной смеси для повышения ее качества."
    zmlab2.language["filler_title"] = "Наполнитель"
    zmlab2.language["filler_desc"] = "Используется для заполнения конечной смеси на лотках."
    zmlab2.language["frezzer_title"] = "Морозилка"
    zmlab2.language["frezzer_desc"] = "Используется для предотвращения дальнейшей реакции конечного раствора метамфетамина."
    zmlab2.language["packingtable_title"] = "Упаковочный стол"
    zmlab2.language["packingtable_desc"] = "Обеспечивает быстрый способ разбить / упаковать метамфетамин. Может вместить до 12 лотков. Может быть обновлен с помощью автоматического ледокола."

    // Storage Config
    zmlab2.language["acid_title"] = "Плавиковая кислота"
    zmlab2.language["acid_desc"] = "Катализатор для увеличения скорости реакции."
    zmlab2.language["methylamine_title"] = "Метиламин"
    zmlab2.language["methylamine_desc"] = "Метиламин является органическим соединением и одним из основных ингредиентов для производства метамфетамина."
    zmlab2.language["aluminum_title"] = "Алюминий"
    zmlab2.language["aluminum_desc"] = "Алюминиевая амальгама используется в качестве химического реагента для восстановления соединений."
    zmlab2.language["lox_title"] = "Жидкий кислород"
    zmlab2.language["lox_desc"] = "Жидкий кислород используется в морозилке, чтобы остановить дальнейшую реакцию конечного раствора метамфетамина."
    zmlab2.language["crate_title"] = "Коробка"
    zmlab2.language["crate_desc"] = "Используется для транспортировки большого количества метамфетамина."
    zmlab2.language["palette_title"] = "Палитра"
    zmlab2.language["palette_desc"] = "Используется для транспортировки большого количества метамфетамина."
    zmlab2.language["crusher_title"] = "Ледокол"
    zmlab2.language["crusher_desc"] = "Автоматически разламывает и упаковывает метамфетамин при установке на упаковочный стол."

    // Meth Config
    // Note: Hard to say what about the meth should be translated and what not. Decide for yourself whats important here.
    zmlab2.language["meth_title"] = "Метамфетамин"
    zmlab2.language["meth_desc"] = "Обычный уличный метамфетамин."
    zmlab2.language["bluemeth_title"] = "Кристально-Голубой"
    zmlab2.language["bluemeth_desc"] = "Оригинальная формула гейзенберга."
    zmlab2.language["kalaxi_title"] = "Калаксианский кристалл"
    zmlab2.language["kalaxi_desc"] = "Кристаллы Калаксиана очень похожи на многие лекарства, так как кристаллы дают вам хорошее ощущение."
    zmlab2.language["glitter_title"] = "Блеск"
    zmlab2.language["glitter_desc"] = "Блеск-это очень психоделический наркотик, недавно появившийся на улицах города. Это действительно сильная штука, даже для самых пресыщенных жителей города."
    zmlab2.language["kronole_title"] = "Кроноль"
    zmlab2.language["kronole_desc"] = "Кроноль это уличный наркотик, продаваемый на черном рынке. Препарат обладает способностью блокировать болевые рецепторы, Кроноль настолько силен, что блокирует все чувства, а не только боль."
    zmlab2.language["melange_title"] = "Меланж"
    zmlab2.language["melange_desc"] = "Меланж (Спайс) это лекарство, способное продлить жизнь, наделить повышенной жизненной силой и осознанностью, а также раскрыть предвидение у некоторых людей."
    zmlab2.language["mdma_title"] = "МДМА"
    zmlab2.language["mdma_desc"] = "МДМА впервые был разработан в 1912 году компанией Мерк. Он использовался для усиления психотерапии, начиная с 1970-х годов, и стал популярным в качестве уличного наркотика в 1980-х годах."

    // Update 1.0.5
    zmlab2.language["tent05_title"] = "Круглая палатка"
    zmlab2.language["tent05_desc"] = "В этой палатке предусмотрено место для 8 предметов"
end

--PATH addons/zeros_methlab2/lua/zmlab2/sh_meth_config.lua:
zmlab2 = zmlab2 or {}
zmlab2.config = zmlab2.config or {}
zmlab2.config.MethTypes = {}
local function AddMeth(data) return table.insert(zmlab2.config.MethTypes,data) end

AddMeth({
	name = zmlab2.language["meth_title"],
	desc = zmlab2.language["meth_desc"],

	// The money value per gram if the quality is perfect (100%)
	price = 15,

	// Color of the meth
	color = Color(187, 230, 210, 255),

	// The crystall model which gets used in the Filter Interface
	crystal_mdl = "models/zerochain/props_methlab/zmlab2_crystall02.mdl",

	// Can be used to overwrite the material
	material = {
		diff = "zerochain/props_methlab/meth/zmlab2_meth_type02_diff",
		nrm = "zerochain/props_methlab/meth/zmlab2_meth_type02_nrm",
	},

	// Defines how hard the minigame for this methtype is (1-10)
	// 1 = Easy , 10 = Expert
	difficulty = 1,

	// Defines how much meth this type produces
	batch_size = 2500,

	// How many Methylamin Barrels and Aluminium are needed
	recipe_barrel = 1,
	recipe_alu = 2,


	// How long is one mix cycle in the mixer machine for this meth type (seconds)
	mix_time = 15,

	// How long does it take to vent this meth type in the mixer machine (seconds)
	vent_time = 25,

	// How long does the Filter Machine need to compose / produce the meth (seconds)
	filter_time = 60,


	// Can be used to call some custom code when the player consums this type of meth (Gets called once per "E - Press" on a meth bag)
	OnConsumption = function(ply,meth_entity,meth_quality)

		/*
			//Here are some modificators you can use (All of them are the Max Value and if applied will scale themself depending on Meth Quality)

			// A movement speed multiplier
			ply.zmlab2_Effect_Speed = 3

			// A damage multiplier for any damage inflicted on the player
			ply.zmlab2_Effect_DMG = 0.5

			//Same damage multiplier can be used as a table instead to only modify certain damage types
			ply.zmlab2_Effect_DMG = {
				[DMG_FALL] = 0
			}
		*/

		ply.zmlab2_Effect_Speed = 1.5
		ply.zmlab2_Effect_DMG = 0.5
	end,

	// Called once the effect has ended or before another effect replaced this effect
	OnEffectEnd = function(ply) end,

	// Some values for the screeneffect
	visuals = {
		// The music to play while high (audio file needs loop points in order to loop)
		//music = "path/to/file.wav",

		// The particle effect which gets created when the player is high
		effect = "zmlab2_high_effect01",

		MaterialOverlay = "effects/tp_eyefx/tpeye3",
		MotionBlur = true,
		Bloom = true,

		// Particle effects which get created when the meth gets moved/ made
		effect_breaking = "zmlab2_meth_breaking",
		effect_filling = "zmlab2_meth_filling",
		effect_exploding = "zmlab2_meth_explo",
		effect_mixer_liquid = "zmlab2_mixer_liquid",
		effect_mixer_exhaust = "zmlab2_mixer_exhaust",
	},

	// Which rank is allowed to make this methtype?
	/*
	rank = {
		["vip"] = true,
	},
	*/

	// Which job is allowed to make this methtype?
	/*
	job = {
		[TEAM_ZMLAB2_COOK] = true
	},
	*/

	// You can use this to restrict this methtype for any other reason
	/*
	customcheck = function(ply)
		if ply:Nick() ~= "Walter White" then return false end
	end,
	*/
})

AddMeth({
	name = zmlab2.language["bluemeth_title"],
	desc = zmlab2.language["bluemeth_desc"],
	price = 18,
	color = Color(40, 201, 230, 255),
	crystal_mdl = "models/zerochain/props_methlab/zmlab2_crystall02.mdl",
	material = {
		diff = "zerochain/props_methlab/meth/zmlab2_meth_type02_diff",
		nrm = "zerochain/props_methlab/meth/zmlab2_meth_type02_nrm",
	},
	difficulty = 7,
	batch_size = 2500,
	recipe_barrel = 2,
	recipe_alu = 1,
	mix_time = 60,
	vent_time = 120,
	filter_time = 120,
	OnConsumption = function(ply,meth_entity,meth_quality)
		ply.zmlab2_Effect_DMG = 0.5
		ply.zmlab2_Effect_Speed = 3
	end,
	visuals = {
		music = "zmlab2/meth_music_blue.wav",
		effect = "zmlab2_high_effect01",
		MaterialOverlay = "effects/tp_eyefx/tpeye3",
		MotionBlur = true,
		Bloom = true,
		effect_breaking = "zmlab2_meth_breaking_blue",
		effect_filling = "zmlab2_meth_filling_blue",
		effect_exploding = "zmlab2_meth_explo_blue",
		effect_mixer_liquid = "zmlab2_mixer_liquid_blue",
		effect_mixer_exhaust = "zmlab2_mixer_exhaust_blue",
	}
})

AddMeth({
	name = zmlab2.language["kalaxi_title"],
	desc = zmlab2.language["kalaxi_desc"],
	price = 20,
	color = Color(230, 12, 104, 255),
	crystal_mdl = "models/zerochain/props_methlab/zmlab2_crystall03.mdl",
	difficulty = 10,
	batch_size = 2500,
	recipe_barrel = 2,
	recipe_alu = 2,
	mix_time = 30,
	vent_time = 10,
	filter_time = 200,
	OnConsumption = function(ply,meth_entity,meth_quality)
		ply.zmlab2_Effect_DMG = 0.5
		ply.zmlab2_Effect_Speed = 3
	end,
	OnEffectEnd = function(ply)
	end,
	visuals = {
		music = "zmlab2/meth_music_kalaxian.wav",
		effect = "zmlab2_high_effect02",
		MaterialOverlay = "effects/tp_eyefx/tpeye3",
		MotionBlur = true,
		Bloom = true,
		effect_breaking = "zmlab2_meth_breaking_pink",
		effect_filling = "zmlab2_meth_filling_pink",
		effect_exploding = "zmlab2_meth_explo_pink",
		effect_mixer_liquid = "zmlab2_mixer_liquid_pink",
		effect_mixer_exhaust = "zmlab2_mixer_exhaust_pink",
	},
	rank = {
		["vip"] = true,
		["moder"] = true,
		["padmin"] = true,
		["sponsor"] = true,
		["dsuperadmin"] = true,
		["downer"] = true,
		["NS-trainee"] = true,
		["NS-mlmoder"] = true,
		["NS-moder"] = true,
		["NS-mladmin"] = true,
		["NS-admin"] = true,
		["NS-helper"] = true,
		["NS-assistant"] = true,
		["overwatch"] = true,
		["NS-zammanager"] = true,
		["manager"] = true,
		["uprav"] = true,
	},
})

--PATH addons/zeros_methlab2/lua/zmlab2/sh_storage_config.lua:
zmlab2 = zmlab2 or {}
zmlab2.config = zmlab2.config or {}
zmlab2.config.Storage = zmlab2.config.Storage or {}

// Here are all the entities which can be bought from the storage
zmlab2.config.Storage.Shop = {
	[1] = {
		name = zmlab2.language["acid_title"],
		desc = zmlab2.language["acid_desc"],
		class = "zmlab2_item_acid",
		model = "models/zerochain/props_methlab/zmlab2_acid.mdl",
		price = 150,
		// Defines how many items of that class the player can spawn
		limit = 3,

		// Which rank is allowed to buy this?
		/*
		rank = {
			["vip"] = true,
		},
		*/

		// Which job is allowed to buy this?
		/*
		job = {
			[TEAM_ZMLAB2_COOK] = true
		},
		*/

		// You can use this to restrict this for any other reason
		/*
		customcheck = function(ply)

		end,
		*/
	},
	[2] = {
		name = zmlab2.language["methylamine_title"],
		desc = zmlab2.language["methylamine_desc"],
		class = "zmlab2_item_methylamine",
		model = "models/zerochain/props_methlab/zmlab2_methylamine.mdl",
		price = 300,
		limit = 2
	},
	[3] = {
		name = zmlab2.language["aluminum_title"],
		desc = zmlab2.language["aluminum_desc"],
		class = "zmlab2_item_aluminium",
		model = "models/zerochain/props_methlab/zmlab2_aluminium.mdl",
		price = 300,
		limit = 2
	},
	[4] = {
		name = zmlab2.language["lox_title"],
		desc = zmlab2.language["lox_desc"],
		class = "zmlab2_item_lox",
		model = "models/zerochain/props_methlab/zmlab2_lox.mdl",
		price = 300,
		limit = 1
	},
	[5] = {
		name = zmlab2.language["crate_title"],
		desc = zmlab2.language["crate_desc"],
		class = "zmlab2_item_crate",
		model = "models/zerochain/props_methlab/zmlab2_crate.mdl",
		price = 300,
		limit = 1
	},
	[6] = {
		name = zmlab2.language["palette_title"],
		desc = zmlab2.language["palette_desc"],
		class = "zmlab2_item_palette",
		model = "models/zerochain/props_methlab/zmlab2_palette.mdl",
		price = 300,
		limit = 1
	},
	[7] = {
		name = zmlab2.language["crusher_title"],
		desc = zmlab2.language["crusher_desc"],
		class = "zmlab2_item_autobreaker",
		model = "models/zerochain/props_methlab/zmlab2_autobreaker.mdl",
		price = 300,
		limit = 1,
	}
}

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

--PATH addons/zeros_methlab2/lua/zmlab2/util/cl_vgui.lua:
if SERVER then return end
zmlab2 = zmlab2 or {}
zmlab2.vgui = zmlab2.vgui or {}
zmlab2.vgui.Elements = zmlab2.vgui.Elements or {}

zmlab2.hM = ScrH() / 1080
zmlab2.wM = zmlab2.hM

// Lets update the WindowSize Multiplicator if teh ScreenSize got changed
zmlab2.Hook.Add("OnScreenSizeChanged", "VGUIScaleReset", function(oldWidth, oldHeight)
	zmlab2.hM = ScrH() / 1080
	zmlab2.wM = zmlab2.hM

	zmlab2.Print("ScreenSize changed, Recalculating ScreenSize values.")
end)

// Plays a interface sound
function zmlab2.vgui.PlaySound(sound)
	// If the player is using the BuilderView then lets get the ViewPos of the builder cam
	if zmlab2.FiringSystem and zmlab2.FiringSystem.RenderBuilderView == true then
		EmitSound(Sound(sound), zmlab2_ViewPos, -2, CHAN_AUTO, 1, 128, 0, 100,0)
	else
		surface.PlaySound(sound)
	end
end

// Creates a notify + sound according to what view the player currntly has
function zmlab2.vgui.Notify(msg,msgType)
	local s_sound = nil

	if msgType == NOTIFY_GENERIC then
		s_sound = "common/bugreporter_succeeded.wav"
	elseif msgType == NOTIFY_ERROR then
		s_sound = "common/warning.wav"
	elseif msgType == NOTIFY_HINT then
		s_sound = "buttons/button15.wav"
	end

	zmlab2.vgui.PlaySound(s_sound)

	if msg and string.len(msg) > 0 then
		local dur = 0.2 * string.len(msg)
		notification.AddLegacy(msg, msgType, dur)
	end
end

function zmlab2.vgui.TextButton(_x,_y,_w,_h,parent,data,action,IsLocked)
	/*
		data = {
			Text01 = "Off"
			color
			txt_color
			locked
		}
	*/
	local button_pnl = vgui.Create("DButton", parent)
	button_pnl:SetPos(_x * zmlab2.wM, _y * zmlab2.hM)
	button_pnl:SetSize(_w * zmlab2.wM, _h * zmlab2.hM)
	button_pnl:SetAutoDelete(true)
	button_pnl:SetText("")

	button_pnl.Text01 = data.Text01
	button_pnl.color = data.color
	button_pnl.txt_color = data.txt_color
	button_pnl.locked = false

	button_pnl.Paint = function(s, w, h)
		draw.RoundedBox(0, 0, 0, w, h, s.color)

		if s.Text01 then
			draw.SimpleText(s.Text01, zmlab2.GetFont("zmlab2_vgui_font01"), w / 2, h / 2, s.txt_color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		if s.locked == true then
			draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["black02"])
		else
			local _, varg = xpcall(IsLocked, function() end, nil)
			if varg then
				draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["black02"])
			else
				if s:IsHovered() then
					draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["white02"])
				end
			end
		end
	end

	button_pnl.DoClick = function(s)
		if s.locked == true then return end
		local _, varg = xpcall(IsLocked, function() end, nil)
		if varg == true then return end
		zmlab2.vgui.PlaySound("UI/buttonclick.wav")
		pcall(action,button_pnl)
	end
	return button_pnl
end

function zmlab2.vgui.Slider(parent,text,start_val,onChange)

	local p = vgui.Create("DButton", parent)
	p:SetSize(200 * zmlab2.wM,50 * zmlab2.hM )
	p.locked = false
	p.slideValue = start_val
	p:SetAutoDelete(true)
	p:SetText("")
	p.Paint = function(s, w, h)
		draw.RoundedBox(4, 0, 0, w, h, zmlab2.colors["black02"])

		draw.SimpleText(text, zmlab2.GetFont("zmlab2_vgui_font03"),5 * zmlab2.wM, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

		draw.SimpleText(math.Round(s.slideValue * 100), zmlab2.GetFont("zmlab2_vgui_font03"),w - 5 * zmlab2.wM, h / 2, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

		local AreaW = w * 0.5
		local AreaX = w * 0.35
		draw.RoundedBox(4, AreaX, h * 0.5, AreaW, 2 * zmlab2.hM, zmlab2.colors["black01"])


		local boxHeight = h * 0.5
		local boxPosX = AreaW * s.slideValue
		draw.RoundedBox(4, (AreaX - (boxHeight / 2)) + boxPosX, boxHeight / 2, boxHeight, boxHeight, zmlab2.colors["grey02"])

		if p.locked == true then
			draw.RoundedBox(4, 0, 0, w, h, zmlab2.colors["black02"])
		end

		if s:IsDown() then
			local x,_ = s:CursorPos()
			local min = AreaX
			local max = min + AreaW

			x = math.Clamp(x, min, max)

			local val = (1 / AreaW) * (x - min)

			s.slideValue = math.Round(val,2)

			if s.slideValue ~= s.LastValue then
				s.LastValue = s.slideValue

				if s.locked == true then return end
				pcall(onChange,s.slideValue)
			end
			// 60 = 0
			// 230 = 1
		end
	end
	return p
end

function zmlab2.vgui.CheckBox(parent,text,state,onclick)

	local p = vgui.Create("DButton", parent)
	p:SetSize(200 * zmlab2.wM,50 * zmlab2.hM )
	p.locked = false
	p.state = state
	p.slideValue = 0
	p:SetAutoDelete(true)
	p:SetText("")
	p.Paint = function(s, w, h)
		//draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["black02"])

		local BoxWidth = w * 0.8
		local BoxHeight = h / 3
		local BoxPosY = BoxHeight * 1.5
		local BoxPosX = w * 0.1

		draw.SimpleText(text, zmlab2.GetFont("zmlab2_vgui_font03"),w / 2, BoxHeight * 0.8, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		draw.RoundedBox(4, BoxPosX, BoxPosY, BoxWidth, BoxHeight, zmlab2.colors["black02"])

		if s.state then
			s.slideValue = Lerp(5 * FrameTime(), s.slideValue, 1)
		else
			s.slideValue = Lerp(5 * FrameTime(), s.slideValue, 0)
		end

		local col = zmlab2.util.LerpColor(s.slideValue, zmlab2.colors["grey02"], zmlab2.colors["green03"])
		draw.RoundedBox(4, BoxPosX + (BoxWidth-BoxHeight) * s.slideValue, BoxPosY, BoxHeight, BoxHeight, col)

		if p.locked == true then
			draw.RoundedBox(4, BoxPosX, BoxPosY, BoxWidth, BoxHeight, zmlab2.colors["black02"])
		end
	end
	p.DoClick = function(s)
		if p.locked == true then return end
		zmlab2.vgui.PlaySound("UI/buttonclick.wav")
		s.state = not s.state
		pcall(onclick,s.state)
	end
	return p
end

function zmlab2.vgui.ImageButton(_x,_y,_w,_h,parent,image,OnClick,IsLocked)
	local Button = vgui.Create("DButton", parent)
	Button:SetPos(_x , _y )
	Button:SetSize(_w, _h)
	Button:SetText("")
	Button.IconColor = color_white
	Button.MainColor = zmlab2.colors["blue01"]
	Button.Paint = function(s, w, h)

		//draw.RoundedBox(0, 0, 0, w, h, s.MainColor)

		zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, color_white)

		surface.SetDrawColor(s.IconColor)
		surface.SetMaterial(image)
		surface.DrawTexturedRect(0, 0,w, h)

		local _, varg = xpcall(IsLocked, function() end, nil)
		if varg or s:IsEnabled() == false then
			draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["black02"])
		else
			if s:IsHovered() then
				draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["white02"])
			end
		end
	end
	Button.DoClick = function(s)

		local _, varg = xpcall(IsLocked, function() end, nil)
		if varg == true then return end

		zmlab2.vgui.PlaySound("UI/buttonclick.wav")

		s:SetEnabled(false)

		timer.Simple(0.25, function() if IsValid(s) then s:SetEnabled(true) end end)

		pcall(OnClick,s)
	end
	return Button
end

local tcol = Color(255, 152, 154)
function zmlab2.vgui.TextEntry(parent, emptytext,onchange,hasrefreshbutton,onRefresh)
	local p = vgui.Create("DTextEntry", parent)
	p:SetSize(200 * zmlab2.wM,50 * zmlab2.hM )
	p:SetPaintBackground(false)
	p:SetAutoDelete(true)
	p:SetUpdateOnType(true)
	p.Paint = function(s, w, h)
		draw.RoundedBox(4, 0, 0, w, h, zmlab2.colors["grey01"])

		if s:GetText() == "" and not s:IsEditing() then
			draw.SimpleText(emptytext, zmlab2.GetFont("zmlab2_vgui_font02"), 5 * zmlab2.wM, h / 2, zmlab2.colors["white03"], 0, 1)
		end

		s:DrawTextEntryText(color_white, tcol, color_white)
	end

	p.OnValueChange = function(s,val)
		pcall(onchange,val)
	end

	function p:PerformLayout(width, height)
	end

	function p:PerformLayout(width, height)
		self:SetFontInternal(zmlab2.GetFont("zmlab2_vgui_font02"))
	end

	if hasrefreshbutton then
		local b = vgui.Create("DButton",p)
		b:SetText("")
		b:SetSize(50 * zmlab2.wM, 50 * zmlab2.hM )
		b.DoClick = function()
			onRefresh(p:GetText())
		end
		b.Paint = function(s, w, h)
			surface.SetDrawColor(zmlab2.colors["textentry"])
			surface.SetMaterial(zmlab2.materials["back"])
			surface.DrawTexturedRect(5 * zmlab2.wM, 5 * zmlab2.hM, 40 * zmlab2.wM, 40 * zmlab2.hM)
		end

		p.b = b

		timer.Simple(0,function()
			if IsValid(b) and IsValid(p) then
				b:SetPos(p:GetWide() - 50 * zmlab2.wM,0 * zmlab2.hM  )
			end
		end)
	end

	return p
end

function zmlab2.vgui.ModelPanel(data)
	local model_pnl = vgui.Create("DModelPanel")
	model_pnl:SetPos(0 * zmlab2.wM, 0 * zmlab2.hM)
	model_pnl:SetSize(50 * zmlab2.wM, 50 * zmlab2.hM)
	model_pnl:SetVisible(false)
	model_pnl:SetAutoDelete(true)
	model_pnl.LayoutEntity = function(self) end

	if data and data.model then

		model_pnl:SetModel(zmlab2.CacheModel(data.model))

		if not IsValid(model_pnl.Entity) then
			model_pnl:SetVisible(true)
			zmlab2.Print("Could not create DModel Panel, Clientmodel Limit reached?")
			return model_pnl
		end

		local min, max = model_pnl.Entity:GetRenderBounds()
		local size = 0
		size = math.max(size, math.abs(min.x) + math.abs(max.x))
		size = math.max(size, math.abs(min.y) + math.abs(max.y))
		size = math.max(size, math.abs(min.z) + math.abs(max.z))


		local rData = data.render

		local FOV = 35
		local x = 0
		local y = 0
		local z = 0
		local ang = Angle(0, 25, 0)
		local pos = vector_origin

		if rData then
			FOV = rData.FOV or 35
			x = rData.X or 0
			y = rData.Y or 0
			z = rData.Z or 0
			ang = rData.Angles or angle_zero
			pos = rData.Pos or vector_origin
		end

		model_pnl:SetFOV(FOV)
		model_pnl:SetCamPos(Vector(size + x, size + 30 + y, size + 5 + z))
		model_pnl:SetLookAt((min + max) * 0.5)

		if ang then
			model_pnl.Entity:SetAngles(ang)
		end

		if pos then
			model_pnl.Entity:SetPos(pos)
		end

		if data.color then
			model_pnl:SetColor(data.color)
		end

		if data.skin then
			model_pnl.Entity:SetSkin(data.skin)
		end

		if data.material then
			model_pnl.Entity:SetMaterial(data.material)
		end

		if data.anim then
			model_pnl:SetAnimated(true)
			model_pnl.Entity:SetSequence(data.anim)
			model_pnl:SetPlaybackRate(data.speed)
			model_pnl:RunAnimation()
		end

		if data.bodygroup then
			for k,v in pairs(data.bodygroup) do
				model_pnl.Entity:SetBodygroup(k,v)
			end
		end

		model_pnl:SetVisible(true)
	end

	return model_pnl
end

--PATH addons/zeros_methlab2/lua/zmlab2/furnace/cl_furnace.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Furnace = zmlab2.Furnace or {}


function zmlab2.Furnace.Initialize(Furnace)
    Furnace.SmoothBar = 0
    Furnace.SmoothDegree = 0
end

function zmlab2.Furnace.OnRemove(Furnace)
    Furnace:StopSound("zmlab2_boil01_loop")
    Furnace:StopSound("zmlab2_boil02_loop")
end

function zmlab2.Furnace.Draw(Furnace)
    if zmlab2.util.InDistance(LocalPlayer():GetPos(),Furnace:GetPos(), 500) then

        // Draw ui
        if zmlab2.Convar.Get("zmlab2_cl_drawui") == 1 then zmlab2.Furnace.DrawUI(Furnace) end

        // Draw light
        if Furnace:GetProcessState() == 2 then zmlab2.Furnace.DrawLight(Furnace) end

        // Vibrates certain bones of the machine
        zmlab2.VibrationSystem.Run(Furnace,Furnace:GetProcessState() == 2,(1 / 100) * Furnace:GetTemperatur())
    end
    zmlab2.util.LoopedSound(Furnace, "zmlab2_boil01_loop", Furnace:GetProcessState() == 2)
    zmlab2.util.LoopedSound(Furnace, "zmlab2_boil02_loop", Furnace:GetProcessState() == 2 and Furnace:GetTemperatur() > 25)
end

function zmlab2.Furnace.DrawLight(Furnace)
    if zmlab2.Convar.Get("zmlab2_cl_vfx_dynamiclight") == 0 then return end
    local dlight = DynamicLight(Furnace:EntIndex())
    if (dlight) then
        dlight.pos = Furnace:LocalToWorld(Vector(-15,25,30))
        dlight.r = 150
        dlight.g = 190
        dlight.b = 71
        dlight.brightness = 1
        dlight.style = 0
        dlight.Decay = 1000
        dlight.Size = 128
        dlight.DieTime = CurTime() + 1
    end
end

local function SimpleButton(x,y,icon,hover)
    surface.SetDrawColor( color_white )
    surface.SetMaterial(zmlab2.materials[icon])
    surface.DrawTexturedRectRotated(x, y, 50, 50, 0 )

    surface.SetDrawColor( color_white )
    surface.SetMaterial(zmlab2.materials["icon_box01"])
    surface.DrawTexturedRectRotated(x, y, 50, 50, 0 )

    if hover then
        draw.RoundedBox(5, x - 25, y - 25, 50,50, zmlab2.colors["white02"])
    end
end

local ScreenData = {
    pos = Vector(-17.5, 12.9, 54.3),
    ang = Angle(0, 180, 90),
    x = 0,
    y = 0,
    w = 340,
    h = 162,
    pages = {
        [0] = function(Furnace)
            zmlab2.Interface.DrawIngredient(0, 0, 340, 165, zmlab2.materials["icon_acid"],zmlab2.config.Furnace.Capacity - Furnace:GetAcidAmount(),zmlab2.GetFont("zmlab2_font03"))
        end,
        [1] = function(Furnace)
            zmlab2.Interface.DrawButton(0, 0, 200, 80, zmlab2.language["Start"], Furnace:OnStart(LocalPlayer()))
        end,
        [2] = function(Furnace)
            draw.RoundedBox(0, -110, -32, 220, 5, color_white)
            SimpleButton(-120, 10, "icon_cold", Furnace:OnDecrease(LocalPlayer()))
            SimpleButton(120, 10, "icon_hot", Furnace:OnIncrease(LocalPlayer()))
            draw.RoundedBox(10, -210 + ((300 / 3) * (Furnace:GetHeater() + 1)), -40, 20, 20, color_white)

            local heatTime = math.Clamp(CurTime() - Furnace:GetHeatingStart(), 0, zmlab2.config.Furnace.HeatingCylce_Duration)
            draw.RoundedBox(0, -140, 40, 280, 20, zmlab2.colors["black02"])
            draw.RoundedBox(0, -140, 40, (280 / zmlab2.config.Furnace.HeatingCylce_Duration) * heatTime, 20, color_white)
            zmlab2.util.DrawOutlinedBox(-140, 40, 280, 20, 1, color_white)
        end,
        [4] = function(Furnace)
            zmlab2.Interface.DrawButton(0, 0, 240, 80, zmlab2.language["Move Liquid"], Furnace:OnStart(LocalPlayer()))
        end,
        [6] = function(Furnace)
            surface.SetDrawColor(color_white )
            surface.SetMaterial(zmlab2.materials["icon_sponge"])
            surface.DrawTexturedRectRotated(0, 0, 140, 140, 0 )
        end
    }
}
function zmlab2.Furnace.DrawUI(Furnace)

    // Draw screen
    zmlab2.Interface.Draw(Furnace,ScreenData)

    // Draws how much acid we have
    cam.Start3D2D(Furnace:LocalToWorld(Vector(-30.5,10.5,16)), Furnace:LocalToWorldAngles(Angle(0,0,-90)), 0.1)

        local turbulence = 0
        if Furnace:GetProcessState() == 2 then
            if Furnace:GetTemperatur() > 50 then
                turbulence = 1.25
            elseif Furnace:GetTemperatur() > 25 then
                turbulence = 0.5
            end
        end

        local bar_size = (1 / zmlab2.config.Furnace.Capacity) * Furnace:GetAcidAmount()
        Furnace.SmoothBar = Lerp(FrameTime() * 0.5,Furnace.SmoothBar,bar_size)
        zmlab2.Interface.DrawLiquid(Furnace,130,35,40,170,Furnace.SmoothBar,zmlab2.colors["acid"],turbulence)
    cam.End3D2D()

    cam.Start3D2D(Furnace:LocalToWorld(Vector(-7.55,10.1,65.1)), Furnace:LocalToWorldAngles(Angle(0,180,90)),0.1)

        surface.SetDrawColor(color_white)
        surface.SetMaterial(zmlab2.materials["temp_bg"])
        surface.DrawTexturedRectRotated(-19, 20, 49 , 49 , 0)

        surface.SetDrawColor(color_white)
        surface.SetMaterial(zmlab2.materials["air_pressure_pointer"])
        surface.DrawTexturedRectRotated(-20, 20,40,40,Furnace.SmoothDegree)

        surface.SetDrawColor(zmlab2.colors["black03"])
        surface.SetMaterial(zmlab2.materials["radial_invert_glow"])
        surface.DrawTexturedRectRotated(-19, 20, 49 , 49 , 0)

        if Furnace:GetProcessState() == 2 then
            local temp = Furnace:GetTemperatur()

            if temp > 70 then
                local time_mul = 0.25 + math.abs(math.sin(CurTime() * 5))
                local col = Color(255, 0, 0, 200 * time_mul)
                surface.SetDrawColor(col)
                surface.SetMaterial(zmlab2.materials["radial_invert_glow"])
                surface.DrawTexturedRectRotated(-19.5, 20, 48 , 48 , 0)
                draw.SimpleText("!", zmlab2.GetFont("zmlab2_font02"), -20, 20, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end

            temp = 100 - temp
            local deg = (270 / 100) * temp
            deg = deg - 135
            Furnace.SmoothDegree = Lerp(1.5 * FrameTime(),Furnace.SmoothDegree,deg)
        else
            Furnace.SmoothDegree = Lerp(1.5 * FrameTime(),Furnace.SmoothDegree,140)
        end
    cam.End3D2D()
end

--PATH addons/_adminmodules/lua/ulx/xgui/gamemodes/sandbox.lua:
--Sandbox settings module for ULX GUI -- by Stickly Man!
--Defines sbox cvar limits and sandbox specific settings for the sandbox gamemode.

xgui.prepareDataType( "sboxlimits" )
local sbox_settings = xlib.makepanel{ parent=xgui.null }

xlib.makecheckbox{ x=10, y=10, label="Enable Noclip", repconvar="rep_sbox_noclip", parent=sbox_settings }
xlib.makecheckbox{ x=10, y=30, label="Enable Godmode", repconvar="rep_sbox_godmode", parent=sbox_settings }
xlib.makecheckbox{ x=10, y=50, label="Enable PvP Damage", repconvar="rep_sbox_playershurtplayers", parent=sbox_settings }
xlib.makecheckbox{ x=10, y=70, label="Spawn With Weapons", repconvar="rep_sbox_weapons", parent=sbox_settings }
xlib.makecheckbox{ x=10, y=90, label="Limited Physgun", repconvar="rep_physgun_limited", parent=sbox_settings }

xlib.makecheckbox{ x=10, y=130, label="Persist Props", repconvar="rep_sbox_persist", parent=sbox_settings }
xlib.makecheckbox{ x=10, y=150, label="Bone Manip. Misc", repconvar="rep_sbox_bonemanip_misc", parent=sbox_settings }
xlib.makecheckbox{ x=10, y=170, label="Bone Manip. NPC", repconvar="rep_sbox_bonemanip_npc", parent=sbox_settings }
xlib.makecheckbox{ x=10, y=190, label="Bone Manip. Player", repconvar="rep_sbox_bonemanip_player", parent=sbox_settings }

xlib.makelabel{ x=5, y=247, w=140, wordwrap=true, label="NOTE: The non-ulx cvars configurable in XGUI are provided for easy access only and DO NOT SAVE when the server is shut down or crashes.", parent=sbox_settings }
sbox_settings.plist = xlib.makelistlayout{ x=140, y=5, h=322, w=440, spacing=1, padding=2, parent=sbox_settings }

function sbox_settings.processLimits()
	sbox_settings.plist:Clear()
	for g, limits in ipairs( xgui.data.sboxlimits ) do
		if #limits > 0 then
			local panel = xlib.makepanel{ h=5+math.ceil( #limits/2 )*25 }
			local i=0
			for _, cvar in ipairs( limits ) do
				local cvardata = string.Explode( " ", cvar ) --Split the cvarname and max slider value number
				xgui.queueFunctionCall( xlib.makeslider, "sboxlimits", { x=10+(i%2*205), y=5+math.floor(i/2)*25, w=200, label="Max " .. cvardata[1]:sub(9), min=0, max=cvardata[2], repconvar="rep_"..cvardata[1], parent=panel, fixclip=true } )
				i = i + 1
			end
			sbox_settings.plist:Add( xlib.makecat{ label=limits.title .. " (" .. #limits .. " limit" .. ((#limits > 1) and "s" or "") .. ")", contents=panel, expanded=( g==1 ) } )
		end
	end
end
sbox_settings.processLimits()

xgui.hookEvent( "sboxlimits", "process", sbox_settings.processLimits, "sandboxProcessLimits" )
xgui.addSettingModule( "Sandbox", sbox_settings, "icon16/box.png", "xgui_gmsettings" )

--PATH addons/leyhitreg/lua/marghitreg/sh_marghitreg.lua:
AddCSLuaFile()

local clhr_shotguns = CreateConVar(
	"clhr_shotguns", "1", FCVAR_ARCHIVE + FCVAR_REPLICATED,
	"allow shotguns to use clientside hitreg"
)
local clhr_targetbits = CreateConVar(
	"clhr_targetbits", "255", FCVAR_ARCHIVE + FCVAR_REPLICATED,
	"1 = players, 2 = npcs, 4 = nextbots, 8 = vehicles, 16 = weapons, 32 = ragdolls, 64 = props, 128 = other"
)
local clhr_subtick = CreateConVar(
	"clhr_subtick", "0", FCVAR_ARCHIVE + FCVAR_REPLICATED,
	"subtick hitreg simulation (very experimental, not recommended)"
)

local CLHR = CLHR

CLHR.maxply_bits = math.ceil(math.log(game.MaxPlayers()) / math.log(2))
CLHR.maxplayers = 2 ^ CLHR.maxply_bits

function CLHR:PassesTargetBits()
	return bit.band(clhr_targetbits:GetInt(), CLHR.GetTargetBit(self)) ~= 0
end

local propclasses = {
	prop_physics = true,
	prop_physics_multiplayer = true,
	func_physbox = true,
	func_physbox_multiplayer = true,
	physics_cannister = true,
	combine_mine = true,
	gib = true,
}

function CLHR:GetTargetBit()
	return self:IsPlayer() and 1
		or self:IsNPC() and 2
		or self:IsNextBot() and 4
		or self:IsVehicle() and 8
		or self:IsWeapon() and 16
		or self:IsRagdoll() and 32
		or propclasses[self:GetClass()] and 64
		or 128
end

function CLHR.ReplaceCallback(old, new, arg)
	return old and function(ply, trace, dmginfo)
		new(ply, trace, dmginfo, arg)

		return old(ply, trace, dmginfo)
	end or function(ply, trace, dmginfo)
		return new(ply, trace, dmginfo, arg)
	end
end

-- overriding the hook library functions is fucked up
-- but there isn't really any other way to do this
-- because EntityFireBullets allows only one single hook to modify the table
-- and hooks are executed in arbitrary order

CLHR.hookAdd = CLHR.hookAdd or hook.Add
CLHR.hookRem = CLHR.hookRem or hook.Remove
CLHR.hooks = CLHR.hooks or {}

function hook.Add(ev, nm, fn, pr)
	if ev == "EntityFireBullets" and nm ~= "CLHR_EntityFireBullets" then
		CLHR.hooks[nm] = fn

		return
	end

	return CLHR.hookAdd(ev, nm, fn, pr)
end

function hook.Remove(ev, nm)
	if ev == "EntityFireBullets" then
		CLHR.hooks[nm] = nil
	end

	return CLHR.hookRem(ev, nm)
end

local tbl = hook.GetTable().EntityFireBullets

if tbl then
	for k, v in pairs(tbl) do
		if isstring(k) or IsValid(k) then
			CLHR.hookRem("EntityFireBullets", k)
		else
			v = nil
		end

		CLHR.hooks[k] = v
	end
end

CLHR.hookAdd("EntityFireBullets", "CLHR_EntityFireBullets", function(ply, data)
	local yes, wep, fixedshotgun, cmd, lastcmd, tick

	if ply == GetPredictionPlayer() and not ply:IsBot() then
		if CLHR.IgnoreBulletPlayer == ply and CLHR.IgnoreBulletTime == CurTime() then
			return false
		end

		if CLHR.PreEntityFireBullets and clhr_subtick:GetBool() then
			CLHR.PreEntityFireBullets(ply, data)
		end

		if ply.CLHR_FixedShootPos then
			-- ValveSoftware/source-sdk-2013#442
			if ply:Alive() and data.Src == ply:GetShootPos() then
				data.Src = ply.CLHR_FixedShootPos
			end
		end

		if not IsFirstTimePredicted() then
			goto skip
		end

		local ucmd = ply:GetCurrentCommand()

		if not ucmd then
			goto skip
		end

		cmd = ucmd:CommandNumber()

		lastcmd = ply.CLHR_LastShotCommandNumber or 0.1

		if cmd < lastcmd then
			--if SERVER then
			--	ply:LagCompensation(false)
			--end

			goto skip
		end

		ply.CLHR_LastShotCommandNumber = cmd

		if SERVER and cmd < (ply.CLHR_LastCommandNumber or 0.1) then
			-- should only happen when a player gets a massive freeze
			-- like when they change certain graphics settings mid-game
			goto skip
		end

		ply.CLHR_LastCommandNumber = cmd

		tick = ucmd:TickCount()

		if tick < (ply.CLHR_LastTickCount or 0.1) then
			if SERVER then
				ply:LagCompensation(false) -- trolled

				print((
					"[CLHR] Player sent a tick count lower than previous %d < %d (%s %s)"
				):format(
					tick, ply.CLHR_LastTickCount or 0, ply:SteamID(), ply:Nick()
				))
			end

			goto skip
		end

		ply.CLHR_LastTickCount = tick

		if (data.HullSize or 0) ~= 0 then
			-- todo: add support for bullets that use hull traces
			goto skip
		end

		if (data.Num or 1) ~= 1 then
			if data.Num > 32 or not clhr_shotguns:GetBool() then
				goto skip
			end

			fixedshotgun = false
		end

		-- it's possible that this might not be the same weapon used to fire the shot
		-- there isn't really any actual way to be 100% sure
		wep = ply:GetActiveWeapon()

		if IsValid(wep) then
			if wep.CLHR_Disabled or CLHR.Exceptions[wep:GetClass()] then
				goto skip
			end

			if (data.Num or 1) == 1 then
				if wep.Base == "weapon_ttt_fof_base" then -- fot shotguns
					if (wep.Primary and wep.Primary.NumShots or 1) ~= 1 then
						fixedshotgun = 1
					end
				elseif wep.Base == "weapon_tttbase" then -- tttwr shotguns
					if wep.ShotgunNumShots and wep.ShotgunSpread then
						fixedshotgun = 2
					end
				end

				if fixedshotgun and not clhr_shotguns:GetBool() then
					goto skip
				end
			end
		end

		if hook.Run("CLHR_PreShouldApplyToBullet", ply, data) == false then
			goto skip
		end

		yes = true

		::skip::
	end

	for k, v in pairs(CLHR.hooks) do
		if k ~= "CLHR_EntityFireBullets" then
			if isstring(k) then
				if v(ply, data) == false then
					return false
				end
			elseif IsValid(k) then
				if v(k, ply, data) == false then
					return false
				end
			else
				CLHR.hooks[k] = nil
			end
		end
	end

	if GAMEMODE.EntityFireBullets
		and GAMEMODE:EntityFireBullets(ply, data) == false
	then
		return false
	end

	if yes then
		return CLHR.EntityFireBullets(
			ply, data, wep, fixedshotgun, cmd, lastcmd, tick
		)
	end

	return true
end)

hook.Add("StartCommand", "CLHR_StartCommand", function(ply, ucmd)
	if ply:IsBot() then
		return
	end

	local cmd = ucmd:CommandNumber()

	if cmd > (ply.CLHR_LastCommandNumber or 0) then
		ply.CLHR_LastCommandNumber = cmd
	end

	local tick = ucmd:TickCount()

	if tick > (ply.CLHR_LastTickCount or 0) then
		ply.CLHR_LastTickCount = tick
	end
end)

hook.Add("SetupMove", "CLHR_SetupMove", function(ply, mv, ucmd)
	if ply:IsBot() then
		return
	end

	if ply:Alive() then
		ply.CLHR_FixedShootPos = ply:GetShootPos()
	end

	if CLHR.SetupMove then
		return CLHR.SetupMove(ply, mv, ucmd)
	end
end)

include(CLIENT and "marghitreg/cl_marghitreg.lua" or "marghitreg/sv_marghitreg.lua")

--PATH addons/leyhitreg/lua/marghitreg/cl_marghitreg.lua:
local CLHR = CLHR

local clhr_subtick = GetConVar("clhr_subtick")

local function send2server(msg)
	net.Start("CLHR", true)

	net.WriteUInt(msg.cmd, 31)

	if clhr_subtick:GetBool() then
		if msg.subtick then
			net.WriteBool(true)

			net.WriteVector(msg.subtick)
		else
			net.WriteBool(false)
		end
	end

	local lastvic, lasthbox

	::loop::

	if msg.shots == 0 then
		net.WriteBool(false)
	else
		net.WriteBool(true)

		net.WriteUInt(msg.shots - 1, 5)
	end

	local vic = msg.vic

	if lastvic then
		net.WriteBool(vic == lastvic)
	end

	local isply = vic < CLHR.maxplayers

	if vic ~= lastvic then
		if isply then
			net.WriteBool(false)

			net.WriteUInt(vic, CLHR.maxply_bits)
		else
			net.WriteBool(true)

			net.WriteUInt(vic, 16)
		end

		lastvic = vic
	end

	local hbox = msg.hbox

	if lasthbox then
		net.WriteBool(hbox == lasthbox)
	end

	if hbox ~= lasthbox then
		if hbox < 32 then -- default playermodels typically have 17 hitboxes
			net.WriteBool(false)

			net.WriteUInt(hbox, 5)
		else
			net.WriteBool(true)

			net.WriteUInt(hbox, 31)
		end

		lasthbox = hbox
	end

	net.WriteNormal(msg.norm)

	if not isply then
		if msg.dist then
			net.WriteBool(true)

			net.WriteFloat(msg.dist)
		else
			net.WriteBool(false)
		end
	end

	msg = msg.nxt

	if msg then
		net.WriteBool(true)

		goto loop
	end

	net.WriteBool(false)

	return net.SendToServer()
end

local msg2send

local function s2s()
	if msg2send then
		local msg = msg2send
		msg2send = nil

		return send2server(msg)
	end
end

hook.Add("SetupMove", "CLHR_SendToServer", s2s)
hook.Add("StartCommand", "CLHR_SendToServer", s2s)
hook.Add("CreateMove", "CLHR_SendToServer", s2s)
hook.Add("PreRender", "CLHR_SendToServer", s2s)
hook.Add("Think", "CLHR_SendToServer", s2s)

local function processtrace(trace, nonorm)
	if trace.HitWorld or not trace.Hit then
		return
	end

	local vic = trace.Entity

	if not CLHR.PassesTargetBits(trace.Entity) then
		return
	end

	local rag = vic:IsRagdoll()

	if not rag and bit.band(trace.Contents, CONTENTS_HITBOX) == 0 then
		return
	end

	local convex = true

	local hbox, pos, ang

	if rag then
		hbox = trace.PhysicsBone

		local bone = vic:TranslatePhysBoneToBone(hbox)

		if not (bone and bone ~= -1) then
			return
		end

		local mat = vic:GetBoneMatrix(bone)

		if not mat then
			return
		end

		pos, ang = mat:GetTranslation(), mat:GetAngles()
	elseif vic:GetMoveType() == MOVETYPE_VPHYSICS and vic:GetSolid() == SOLID_VPHYSICS then
		convex = nil

		hbox = 0

		pos, ang = vic:GetPos(), vic:GetAngles()
	else
		local set = vic:GetHitboxSet()

		if not set then
			return
		end

		hbox = trace.HitBox

		local bone = vic:GetHitBoxBone(hbox, set)

		-- calling GetBonePosition before GetBoneMatrix fixes some issues for some reason
		if not (bone and vic:GetBonePosition(bone)) then
			return
		end

		local mat = vic:GetBoneMatrix(bone)

		if not mat then
			return
		end

		pos, ang = mat:GetTranslation(), mat:GetAngles()
	end

	local norm = WorldToLocal(trace.HitPos, angle_zero, pos, ang)

	if nonorm then
		return vic, hbox, norm
	end

	local dist

	if convex then
		-- send the hitpos's direction from the hitbox origin to save some bits
		norm:Normalize()
	else
		-- we don't know if the vphys collision mesh is convex or not

		dist = norm:Length()

		norm:Div(dist)
	end

	return vic, hbox, norm, dist
end

local function callback(ply, trace, dmginfo, info)
	if hook.Run("CLHR_PostShouldApplyToBullet", ply, trace, dmginfo, info) == false then
		return
	end

	if trace.StartPos ~= info.src or ply ~= GetPredictionPlayer() then
		return
	end

	info.shots = info.shots + 1

	local vic, hbox, norm, dist = processtrace(trace)

	if not vic then
		return
	end

	local msg = {
		cmd = info.cmd,
		shots = info.shots,
		vic = vic:EntIndex() - 1,
		hbox = hbox,
		norm = norm,
		dist = dist,
		subtick = info.subtick,
	}

	if info.shotgun then
		msg.nxt = msg2send
		msg2send = msg
	else
		return send2server(msg)
	end
end

local info

function CLHR.EntityFireBullets(ply, data, wep, fixedshotgun, cmd, lastcmd)
	if cmd == lastcmd then
		if not fixedshotgun
			or not info
			or info.cmd ~= cmd
			or info.wep ~= wep
			or info.src ~= data.Src
		then
			return true
		end
	else
		info = {
			cmd = cmd,
			shots = -1,
			wep = wep,
			src = data.Src or Vector(),
			shotgun = fixedshotgun ~= nil,
		}
	end

	if data.CLHR_Subtick then
		info.subtick = data.CLHR_Subtick
	end

	data.Callback = CLHR.ReplaceCallback(data.Callback, callback, info)

	return true
end

local TICKINTERVAL = engine.TickInterval()

local attackdown = false
local subcrt, subaim, subpos, subdata = 0

local tracedata = {
	mask = MASK_SHOT,
	output = {},
}

hook.Add("CreateMove", "CLHR_CreateMove", function(cmd)
	if not clhr_subtick:GetBool() then
		return
	end

	if not cmd:KeyDown(IN_ATTACK) then
		attackdown = false

		return
	end

	local attackheld = attackdown

	attackdown = true

	local ply = LocalPlayer()

	if not (
		IsValid(ply)
		and ply:Alive()
	) then
		return
	end

	local wep = ply:GetActiveWeapon()

	if not IsValid(wep)
		or wep.CLHR_Disabled
		or CLHR.Exceptions[wep:GetClass()]
		or wep:Clip1() <= 0
		or wep.Primary and not wep.Primary.Automatic and attackheld
	then
		return
	end

	local crt = CurTime()

	if crt < subcrt + TICKINTERVAL then
		return
	end

	-- unfortunately prevents this from working with automatic fire
	-- i need to figure out a way to do this more elegantly
	if wep:GetNextPrimaryFire() > crt then
		return
	end

	subcrt = crt
	subpos = ply:GetShootPos()
	subaim = cmd:GetViewAngles():Forward()

	local td = tracedata
	td.start = subpos
	td.endpos = subpos + subaim * 56756
	td.filter = ply

	local vic, hbox, hpos = processtrace(util.TraceLine(td), true)

	if vic then
		subdata = {
			vic = vic,
			hbox = hbox,
			hpos = hpos,
		}
	else
		subdata = nil
	end
end)

local host_timescale = GetConVar("host_timescale")

function CLHR.PreEntityFireBullets(ply, data)
	if not IsFirstTimePredicted() or ply ~= LocalPlayer() then
		return
	end

	local scrt, spos, saim, sdata = subcrt, subpos, subaim, subdata
	subcrt, subpos, subaim, subdata = 0, nil, nil, nil

	if scrt == 0
		or data.Src ~= ply:GetShootPos()
		or data.Dir ~= ply:GetAimVector()
		or spos == data.Src and saim == data.Dir and not sdata
		or UnPredictedCurTime() > scrt + TICKINTERVAL / (host_timescale:GetFloat() * game.GetTimeScale())
	then
		return
	end

	data.CLHR_Subtick = spos
	data.Src = spos
	data.Dir = saim

	if not sdata then
		return
	end

	local vic = sdata.vic

	if not IsValid(vic) or vic:IsPlayer() and not vic:Alive() then
		return
	end

	local hbox = sdata.hbox

	local pos, ang

	if vic:IsRagdoll() then
		local bone = vic:TranslatePhysBoneToBone(hbox)

		if not (bone and bone ~= -1) then
			return
		end

		local mat = vic:GetBoneMatrix(bone)

		if not mat then
			return
		end

		pos, ang = mat:GetTranslation(), mat:GetAngles()
	elseif vic:GetMoveType() == MOVETYPE_VPHYSICS and vic:GetSolid() == SOLID_VPHYSICS then
		pos, ang = vic:GetPos(), vic:GetAngles()
	else
		local set = vic:GetHitboxSet()

		if not set then
			return
		end

		local bone = vic:GetHitBoxBone(hbox, set)

		if not (bone and vic:GetBonePosition(bone)) then
			return
		end

		local mat = vic:GetBoneMatrix(bone)

		if not mat then
			return
		end

		pos, ang = mat:GetTranslation(), mat:GetAngles()
	end

	local lookat = LocalToWorld(sdata.hpos, angle_zero, pos, ang)

	lookat:Sub(data.Src)
	lookat:Normalize()

	data.Dir = lookat
end

--PATH addons/zeros_weedfarm/lua/zwf_languages/sh_zwf_language_es.lua:
zwf = zwf or {}
zwf.language = zwf.language or {}

zwf.language.General = zwf.language.General or {}
zwf.language.Shop = zwf.language.Shop or {}
zwf.language.NPC = zwf.language.NPC or {}
zwf.language.VGUI = zwf.language.VGUI or {}
zwf.language.Settings = zwf.language.Settings or {}


if (zwf.config.SelectedLanguage == "es") then

    zwf.language.General["Fuel"] = "Combustible"

    zwf.language.General["THC"] = "THC"
    zwf.language.General["Remove"] = "Remover"
    zwf.language.General["Splice"] = "Re-producir" // The splice button on the seed lab for creating new seeds

    zwf.language.General["Bad"] = "Malo"
    zwf.language.General["Good"] = "Bueno"

    zwf.language.General["Collect"] = "Recolectar"

    zwf.language.General["Speed"] = "Velocidad"
    zwf.language.General["Productivity"] = "Productividad"
    zwf.language.General["AntiPlague"] = "Contra la plaga"

    zwf.language.General["Water"] = "Agua"

    zwf.language.General["invalid_character"] = "Nombre invalido!"
    zwf.language.General["name_too_short"] = "Nombre muy corto!"
    zwf.language.General["name_too_long"] = "Nombre muy largo!"

    zwf.language.General["Cancel"] = "Cancelar"
    zwf.language.General["Enter"] = "Aceptar"

    zwf.language.General["ItemBought"] = "Has comprado $itemname por $currency$price!"


    zwf.language.General["seedlab_titlescreen"] = "Lab de Semillas"
    zwf.language.General["seedlab_help"] = "Nombre de la planta"

    zwf.language.General["watertank_refill"] = "Rellenar"
    zwf.language.General["watertank_title"] = "Tanque de agua"

    zwf.language.General["bong_pickup_fail"] = "Ya tienes este bong!"
    zwf.language.General["bong_no_weed"] = "No hay marihuana!"

    zwf.language.General["generator_repair"] = "Reparar!"
    zwf.language.General["generator_start"] = "Iniciar"
    zwf.language.General["generator_stop"] = "Detener"
    zwf.language.General["generator_nofuel"] = "No hay combustible!"

    zwf.language.General["packingstation_info"] = "Agregar jarras de marihuana."
    zwf.language.General["packingstation_weedmix"] = "Mix de Marihuana" // If the player mixes diffrent sorts of weed together then we change the name of the weed to this

    zwf.language.General["seedbank_full"] = "Banco de semillas lleno!"

    zwf.language.General["plant_heal"] = "Curar" // The heal button
    zwf.language.General["plant_harvest"] = "Cosechar" // The harvest button
    zwf.language.General["plant_infected"] = "Infectado!" // Tells us that the plant is infected
    zwf.language.General["plant_postgrow"] = "Post Crecimiento" // Tells us that the plant is in the post grow phase where it keeps growing till it reaches its max weedamount
    zwf.language.General["plant_empty"] = "Vacio" // Tells the player that the flowerpot is empty

    zwf.language.General["not_enough_money"] = "No tienes suficiente dinero!"
    zwf.language.General["not_correct_rank"] = "No tienes el rango requerido!"
    zwf.language.General["entity_limit"] = "Has alcanzado el limite para $itemname!"


    zwf.language.General["CableDistanceFail"] = "Los objetos estan demaciado lejos entre ellos!"

    zwf.language.General["BongSharingFail"] = "$PlayerName ya tiene este tipo de bong!"

    zwf.language.General["WeedBlock"] = "Bloque de Marihuana"

    zwf.language.General["WrongJob"] = "¡Trabajo equivocado!"

    zwf.language.VGUI["Purchase"] = "Comprar"
    zwf.language.VGUI["SellWeed"] = "Vender Marihuana"
    zwf.language.VGUI["Drop"] = "Tirar"
    zwf.language.VGUI["Delete"] = "Eliminar"
    zwf.language.VGUI["weedbuyer_title"] = "Comprador de\nMarihuana"
    zwf.language.VGUI["seedbank_title"] = "Banco de Semillas"
    zwf.language.VGUI["Strain"] = "Tensión"
    zwf.language.VGUI["Duration"] = "Duración"
    zwf.language.VGUI["Difficulty"] = "Dificultad"
    zwf.language.VGUI["HarvestAmount"] = "Cosechar Cantidad"
    zwf.language.VGUI["THCBoost"] = "Boost THC"
    zwf.language.VGUI["GrowTimeBoost"] = "Boost de Crecimiento"
    zwf.language.VGUI["GrowAmountBoost"] = "Boost de Cantidad"
    zwf.language.VGUI["THCBoost"] = "Boost THC"
    zwf.language.VGUI["SeedCount"] = "Cantidad de Semillas"
    zwf.language.VGUI["PowerUsage"] = "Consumo de Energía"
    zwf.language.VGUI["HeatProduction"] = "Producción de Calor"
    zwf.language.VGUI["Ranks"] = "Rangos"
    zwf.language.VGUI["SeedName"] = "Nombre de la Semilla"




    zwf.language.NPC["title"] = "Comprador de Marihuana"
    zwf.language.NPC["profit"] = "Ganancias"
    zwf.language.NPC["interact_fail"] = "Lárgate!"
    zwf.language.NPC["interact_noweed"] = "Vuelve de nuevo cuando tengas algo para mí!"


    zwf.language.Shop["title"] = "Equipamiento para Plantas"

    zwf.language.Shop["category_Equipment"] = "Equipamiento"

    zwf.language.Shop["item_generator_title"] = "Generador"
    zwf.language.Shop["item_generator_desc"] = "Genera energía usando combustible."

    zwf.language.Shop["item_fuel_title"] = "Combustible"
    zwf.language.Shop["item_fuel_desc"] = "Combustible para el generador."

    zwf.language.Shop["item_lamp01_desc"] = "Proporciona luz para las plantas pero incrementa la temperatura."
    zwf.language.Shop["item_lamp02_desc"] = "Proporciona luz para las plantas sin incrementar la temperatura."

    zwf.language.Shop["item_ventilator_title"] = "Ventilador"
    zwf.language.Shop["item_ventilator_desc"] = "Disminuye la temperatura de las plantas."

    zwf.language.Shop["item_outlet_title"] = "Extensión Electrica"
    zwf.language.Shop["item_outlet_desc"] = "Te permite alimentar multiples máquinas con energía."

    zwf.language.Shop["item_flowerpot01_title"] = "Maceta"
    zwf.language.Shop["item_flowerpot01_desc"] = "Una maceta común para plantas."

    zwf.language.Shop["item_flowerpot02_title"] = "Maceta Automática"
    zwf.language.Shop["item_flowerpot02_desc"] = "Una maceta para plantas. Puede conectarse a un tanque de agua para regarlas automaticamente."

    zwf.language.Shop["item_soil_title"] = "Tierra"
    zwf.language.Shop["item_soil_desc"] = "Tierra para el cultivo de plantas."

    zwf.language.Shop["item_watertank_title"] = "Tanque de Agua"
    zwf.language.Shop["item_watertank_desc"] = "Produce agua para las plantas."

    zwf.language.Shop["item_drystation_title"] = "Estación de Secado"
    zwf.language.Shop["item_drystation_desc"] = "Se usa para secar la marihuana."

    zwf.language.Shop["item_packingtable_title"] = "Tabla de Empaquetado"
    zwf.language.Shop["item_packingtable_desc"] = "Usado para empaquetar jarras de marihuana en bloque para transporte."

    zwf.language.Shop["item_autopacker_title"] = "Empacador Automatico"
    zwf.language.Shop["item_autopacker_desc"] = "Puede instalarse en la tabla de empaquetado para automatizar el proceso."

    zwf.language.Shop["item_seedlab_title"] = "Lab de Semillas"
    zwf.language.Shop["item_seedlab_desc"] = "Te permite crear nuevas semillas con marihuana."

    zwf.language.Shop["item_seedbank_title"] = "Banco de Semillas"
    zwf.language.Shop["item_seedbank_desc"] = "Te permite guardar las semillas."

    zwf.language.Shop["item_palette_title"] = "Tarima"
    zwf.language.Shop["item_palette_desc"] = "Usado para vender bloques de marihuana."


    zwf.language.Shop["item_seed01_desc"] = "OG Kush es una cepa legendaria con un nombre reconocido incluso fuera del mundo del cannabis."
    zwf.language.Shop["item_seed02_desc"] = "Bubba Kush es un híbrido índico pesado que goza de gran popularidad."
    zwf.language.Shop["item_seed03_desc"] = "Sour Diesel’s energized and positive high makes it easy to see why the strain enjoys popularity across the United States."
    zwf.language.Shop["item_seed04_desc"] = "AK-47 es un híbrido dominado por Sativa, con un colorante blanco brillante."
    zwf.language.Shop["item_seed05_desc"] = "TLa genética de Super Lemon Haze combina un sabor dulce y agrio."
    zwf.language.Shop["item_seed06_desc"] = "Strawberry Cough es un híbrido sativa centrado en el gusto."
    zwf.language.Shop["item_seed07_desc"] = "La carecterística púrpura de esta cepa se hereda de sus ancestros de la región de Chitral en el Hindú Kush paquistaní."

    zwf.language.Shop["category_Nutritions"] = "Fertilizante"

    zwf.language.Shop["item_nutrition01_desc"] = "Un pequeño boost de crecimiento para tu planta."
    zwf.language.Shop["item_nutrition02_desc"] = "Incrementa el crecimiento de la planta por una gran cantidad."
    zwf.language.Shop["item_nutrition03_desc"] = "Un pequeño boost de cosecha para tu planta."
    zwf.language.Shop["item_nutrition04_desc"] = "Incrementa la cantidad de cosecha de tu planta por mucho."
    zwf.language.Shop["item_nutrition05_desc"] = "Incrementa la velocidad de cosecha y crecimiento un poco."
    zwf.language.Shop["item_nutrition06_desc"] = "Incrementa la velocidad de cosecha y crecimiento por mucho."

    zwf.language.Shop["category_Seeds"] = "Semillas"


    // Joint UPDATE
    zwf.language.General["joint_pickup_fail"] = "Ya tienes un porro!"
    zwf.language.General["JointSharingFail"] = "$PlayerName ya tiene un porro!"

    zwf.language.NPC["question_01"] = "Que es lo que quieres?"
    zwf.language.NPC["question_01_answer01"] = "Quiero comprar un bong"
    zwf.language.NPC["question_01_answer02"] = "Tengo algo de marihuana para ti"
    zwf.language.NPC["question_01_answer03"] = "Nada"

    zwf.language.NPC["question_02"] = "De cual quieres?"
    zwf.language.NPC["question_02_answer01"] = "Retroceder" // This is the Back button on the NPC BongShop interface

end

--PATH vcmod??functions_util:
function VC_6Kw3e18505c6fdde124627e9fa198ee180b7em(mdl) return mdl and VC_TgX3e18505c6fdde124627e9fa198ee180bUTy[mdl] or {} end function VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) return VC_6Kw3e18505c6fdde124627e9fa198ee180b7em(VC.GetModel(ent)) end function VC.hasGlobalOD(mdl) return (mdl and VC_TgX3e18505c6fdde124627e9fa198ee180bUTy[mdl]) and true or false end  VC.supportedClasses = {  prop_vehicle_jeep = {getCustomData = function(vehT) return vehT or {} end},  prop_vehicle_jeep_old = {getCustomData = function(vehT) return vehT or {} end},  prop_vehicle_airboat = {getCustomData = function(vehT) return vehT or {} end}, }  function VC.getClassCustomVehData(data)  local ret = {}  local classData = VC.classIsSupported(data.Class or data.class)  if classData and classData.getCustomData then ret = classData.getCustomData(data) end  return ret end  function VC.classIsSupported(class)  return VC.supportedClasses[class] end   function VC.getVehicleMain(ent, ignoreExtra)  local retMain = nil  if !IsValid(ent) then return nil, nil end   if ent.VC_ExtraSeat or ignoreExtra then  local prt = ent:GetParent()  if IsValid(retMain) then retMain = prt end  end    return ent, retMain end  function VC.GetVehicleList(fresh)  if fresh or !VC.GetVehicleList_Timer or CurTime() >= VC.GetVehicleList_Timer then  local tlist = VC.supportedClasses   local tVehList = {}  for k,v in pairs(tlist) do  table.Add(tVehList, ents.FindByClass(k))  end  VC.VehicleList = tVehList    VC.GetVehicleList_Timer = CurTime()+1  end  return VC.VehicleList end  function VC.CanAfford(ply, price)  local can = nil   local dhook = hook.Call("VC_canAfford", GAMEMODE, ply, price) if !can and dhook != nil then return dhook end   local Func = ply.canAfford or ply.CanAfford if !can and Func then can = Func(ply, price) end  if !can and ply.GetCash then can = ply:GetCash() > price end  if !can and ply.DRPMoney then can = ply:DRPMoney() > price end  if !can and GetPlyMoney then can = GetPlyMoney(ply) > price end  if !can and ply.getMoney then can = ply:getMoney() > price end  if !can and ply.Money_Has then can = ply:Money_Has(price) end  if !can and (GAMEMODE and (string.lower(GAMEMODE.Name) == string.lower("Pokémon GO") or string.lower(GAMEMODE.Name) == string.lower("underdone - rpg")) and ply.HasItem) then can = ply:HasItem("money", price) end   if can == nil then can = true end   return can end  function VC.SoundEmit(ent, snd, pch, lvl, vol, pos, ntmr)  if IsValid(ent) and snd then  local Clk = snd == "Clk" snd = Clk and "vcmod/clk.wav" or snd  local VSnd = CreateSound(ent, snd)  VSnd:SetSoundLevel(lvl or (Clk and 55 or 60))  VSnd:Stop() VSnd:Play()  VSnd:ChangePitch(math.Clamp(pch or 100,1,255),0)  VSnd:ChangeVolume(math.Clamp(vol or 1, 0,1), 0)  if !ntmr then timer.Simple(SoundDuration(snd), function() if VSnd and VSnd:IsPlaying() then VSnd:Stop() end end) end    return VSnd  end end   function VC.EmitSound(...) return VC.SoundEmit(...) end      VC.BlinkerOnTime = 0.39 VC.BlinkerOffTime = 0.36  function VC.GetBlinkerOnTime(script)  local ret = VC.BlinkerOnTime  if script.Seq_BlinkRate_Ovr then local time = script.Seq_BlinkRate_On if time then ret = time end end  return ret end  function VC.GetBlinkerOffTime(script)  local ret = VC.BlinkerOffTime  if script.Seq_BlinkRate_Ovr then local time = script.Seq_BlinkRate_Off if time then ret = time end end  return ret end  function VC.getAtcPos(ent, id)  local retLocal, retWorld, retAngle, found = Vector(0,0,0), Vector(0,0,0), Angle(0,0,0), nil   local obj = ent:LookupAttachment(id)   if obj then  local atc = ent:GetAttachment(obj)  if atc then  retWorld = atc.Pos  retLocal = ent:WorldToLocal(retWorld)  retAngle = ent:WorldToLocalAngles(atc.Ang)  found = true  end  end   return retLocal, retWorld, retAngle, found end  function VC.getBonePos(ent, id)  local retLocal, retWorld, retAngle = Vector(0,0,0), Vector(0,0,0), Angle(0,0,0)   local matrix = ent:GetBoneMatrix(id)  if matrix then  retWorld = matrix:GetTranslation()  retLocal = ent:WorldToLocal(retWorld)  retAngle = ent:WorldToLocalAngles(matrix:GetAngles())  end   return retLocal, retWorld, retAngle end   function VC.isHeldStart(ent, ID)  if ent.VC_PickedUp then ent:VC_PickedUp(ent.VC_isHeldPlyLast, ID) end  ent.VC_isHeld = ID end   function VC.isHeldEnd(ent, ID)  if ent.VC_Dropped then ent:VC_Dropped(ent.VC_isHeldPlyLast, ID) end  ent.VC_isHeld = nil end     function VC.isHeld(ent)  local ret = nil  if (!ent.VC_isHeldCurTime or CurTime() >= ent.VC_isHeldCurTime) then  ent.VC_isHeldCurTime = CurTime()+0.5    local ID = nil    if !ID then local pobj = ent:GetPhysicsObject() if IsValid(pobj) and pobj:HasGameFlag(FVPHYSICS_PLAYER_HELD) then ID = 1 end end  if !ID then if ent.Drag then ID = 2 end end   if ID and !ent.VC_isHeld then  VC.isHeldStart(ent, ID)  elseif !ID and ent.VC_isHeld then  VC.isHeldEnd(ent, ent.VC_isHeld)  end  end   return ent.VC_isHeld end  function VC_RGv3e18505c6fdde124627e9fa198ee180bG(ent, data, dev)  local posInitial = data.SLSPos or data.Pos if dev then retLocal = data.Pos or data.Pos1 or data.Pos2 end  local retLocal = posInitial  local retWorld = nil  local retAngle = nil   if retLocal then retLocal = Vector(retLocal.x, retLocal.y, retLocal.z) end   if data.PosAtc then  if data.PosAtc.type == "Bone" then  retLocal, retWorld, retAngle = VC.getBonePos(ent, data.PosAtc.id)  elseif data.PosAtc.type == "Atc" then  retLocal, retWorld, retAngle = VC.getAtcPos(ent, data.PosAtc.id)  end  if data.PosAtc.offset then  local offsetRot = Vector(data.PosAtc.offset.x, data.PosAtc.offset.y, data.PosAtc.offset.z)  offsetRot:Rotate(retAngle or Angle(0,0,0))  retLocal = retLocal+offsetRot   retWorld = nil  end  end   if !retLocal then retLocal = posInitial or Vector(0,0,0) end  if !retWorld then retWorld = ent:LocalToWorld(retLocal) end     return retLocal, retWorld, retAngle end  function VC.OBBToWorld(ent)  return ent:LocalToWorld(ent:OBBCenter()) end  function VC.GetEyePos(ent)  local vec = Vector(0,0,0)   if IsValid(ent) then  local ment = ent.VC_ExtraSeat and ent:GetParent() or ent   local sData = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ment)   if sData.eyePos then  vec = sData.eyePos  else  local Atc = ment:LookupAttachment("vehicle_driver_eyes")  if Atc != 0 then local tdata = ment:GetAttachment(Atc) if tdata then vec = ent:WorldToLocal(tdata.Pos) end end  end  end  return vec end  function VC.getTruck(ent)  local ret = nil  local time = nil   ret = SERVER and ent.VC_Truck or ent:GetNWEntity("VC_Truck")   time = SERVER and ent.VC_HookedVhAtcT or ent:GetNWInt("VC_HookedVhAtcT") or 0       if !IsValid(ret) then ret = ent time = 0 end   return ret, time end  function VC.EngineAboveWater(ent, UWC)  if !ent.VC_EngineAboveWater or CurTime() >= ent.VC_EngineAboveWater.time then              ent.VC_EngineAboveWater = {time = CurTime()+1, above = ent.VC_IsAirboat or VC.VecAboveWtr(VC.getEnginePos(ent))}  end  return ent.VC_EngineAboveWater.above end  function VC.ElectronicsOn(ent)  if VCMod2 then  return !ent.VC_IsJeep or ent.VC_HasElectricity and ent.VC_ElectricityOn  else  return (!ent.VC_IsJeep or VC.EngineAboveWater(ent, UWC)) and (!ent.VC_GetHealth or ent:VC_GetHealth() != 0)    end end  function VC.AtcToWorld(ent, vec) if vec then local MdlT = ent.VC_VehModels or {ent} for _, MEnt in pairs(MdlT) do local MEnt = IsValid(MEnt) and MEnt.VC_DynOrn or MEnt local Atc = MEnt:LookupAttachment(vec) if Atc != 0 then vec = MEnt:GetAttachment(Atc).Pos break else vec = MEnt:GetPos() end end else vec = Vector(0,0,0) end return vec end function VC.VectorToWorld(ent, vec) if !vec then vec = Vector(0,0,0) end return ent:LocalToWorld(vec) end  function VC.getFuelMax(ent, default) local ret = 0 if CLIENT then ret = ent:GetNWInt("VC_MaxFuel", default or 1) else ret = ent.VC_MaxFuel or default or 1 end return ret end function VC.getFuel(ent, default) local ret = 0 if CLIENT then ret = ent:GetNWInt("VC_Fuel", default or -1) else ret = ent.VC_Fuel or default or -1 end return ret end  function VC.IsEngineOn(ent) return ent.VC_Dev_ThrottleTime or VC.ElectronicsOn(ent) and VC.getFuel(ent) > 0 and (CLIENT or !ent.VC_IsJeep or ent:IsEngineStarted()) end   function VC.UpsideDown(ent) return math.abs(ent:GetAngles().p) > 45 or math.abs(ent:GetAngles().r) > 60 end function VC.VecAboveWtr(vec) local WTV = util.PointContents(vec) return WTV != 268435488 and WTV != 32 end  function VC.IsSeatEmpty(ent) local driver = VC.GetDriver(ent) return !driver end  function VC.GetPoseParams(ent)  local ret = ent.VC_PoseParameters if !ent.VC_PoseParameters then local t1, t2, t3 = VC.getVehPParams(ent) ent.VC_PoseParameters = t1 end   return ent.VC_PoseParameters end  local pp_default = {  "vehicle_steer"  ,"vehicle_wheel_fl_height"  ,"vehicle_wheel_fr_height"  ,"vehicle_wheel_rl_height"  ,"vehicle_wheel_rr_height"  ,"vehicle_wheel_fl_spin"  ,"vehicle_wheel_fr_spin"  ,"vehicle_wheel_rl_spin"  ,"vehicle_wheel_rr_spin" }  function VC.getVehPParams(ent)  if IsValid(ent) then  local ret, ret_custom, ret_default = {}, {}, {}   if !ent.VC_PoseParameterRanges then ent.VC_PoseParameterRanges = {} end   for i=0, ent:GetNumPoseParameters()-1 do  local nm = ent:GetPoseParameterName(i)  local min, max = ent:GetPoseParameterRange(i)  if table.HasValue(pp_default, nm) then  ret_default[nm] = {id = i, min = min, max = max}  else  ret_custom[nm] = {id = i, min = min, max = max}  end  ret[nm] = {id = i, min = min, max = max}  end  return ret, ret_custom, ret_default   end end  function VC.EnginePosDefault(ent)  local ret = Vector(0,0,0)  if ent.VC_IsAirboat then  ret = ent:GetPos()+ ent:GetUp()*55+ ent:GetForward()*-45  else  local Eng = ent:LookupAttachment("vehicle_engine") if Eng and Eng != 0 then ret = ent:GetAttachment(Eng).Pos else ret = ent:GetPos()+ ent:GetUp()*25+ ent:GetForward()*75 end  end  return ret end  function VC.getEnginePos(ent)  if !IsValid(ent) then return end  if CLIENT then local pos = ent:GetNWVector("VC_EnginePos", Vector(0,0,0)) if pos != Vector(0,0,0) then ent.VC_EnginePos = pos end end  return ent.VC_EnginePos and ent:LocalToWorld(ent.VC_EnginePos) or VC.EnginePosDefault(ent) end  function VC.KmToM(km) return (km or 0)*0.625 end function VC.MToKm(km) return (km or 0)/0.625 end function VC.VelocityToKmH(vel) return math.abs((vel or 0)*0.0909446998) end function VC.KmHToVelocity(kmh) return (kmh or 0)/0.09144 end   function VC.SeatGetOption(ent, opt)  local ret = nil    if IsValid(ent) and ent.VC_Data and ent.VC_Data[opt] then ret = ent.VC_Data[opt] end  return ret end    function VC.SeatGetOptionFromID(ent, ID, opt)    if !ent.VC_cache_SeatRefData or !ent.VC_cache_SeatRefData[ID] then  ent.VC_cache_SeatRefData = {}  ent.VC_cache_SeatRefData[ID] = {}    local sData = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent)  if !sData then return end   if sData.ExtraSeats and sData.ExtraSeats[ID] then  ent.VC_cache_SeatRefData[ID] = sData.ExtraSeats[ID]  end  end    return ent.VC_cache_SeatRefData[ID][opt] end   local function  _() if VC != "" then if VC["Ho".."st"] and !string.find( VC.Host, "vcmod"..".org") or SERVER and VC["W".. "_D" .."o_G"] and !string.find(VC["W" .."_D" .."o_G"]"","vcmod"..".org")then VC=  "" end end end _( ) timer.Simple( 11, _) timer.Simple(7100,_) timer.Create("VC_DHIOGHGAO",10,460,_)  function VC.conditionCheck(ent, key, tbl)  if tbl then  local shouldDoBGroups = tbl.BGroups    local shouldDoPParam = tbl.PP_If   if shouldDoBGroups or shouldDoPParam  then  return (!shouldDoBGroups or VC.BGroups_Check(ent, key, shouldDoBGroups)) and (!shouldDoPParam or VC.PParam_Check(ent, key, shouldDoPParam))  end  end   return true end  function VC.BGroups_Check(ent, key, tbl)  local allowed = true  if tbl then  if !ent.VC_BGroup_Tbl then ent.VC_BGroup_Tbl = {} end  if !ent.VC_BGroup_Tbl[key] then  allowed = false ent.VC_BGroup_Tbl[key] = {}  for k,v in pairs(tbl) do local BGrp = ent:GetBodygroup(k) if BGrp and v[BGrp] then allowed = true break end end  ent.VC_BGroup_Tbl[key].allowed = allowed  else  allowed = ent.VC_BGroup_Tbl[key].allowed  end  end  return allowed end  function VC.PParam_Check(ent, key, tbl)  local allowed = true  ent.VC_PPIf_Tbl = nil  if tbl then  if !ent.VC_PPIf_Tbl then ent.VC_PPIf_Tbl = {} end  if !ent.VC_PPIf_Tbl[key] then  allowed = false ent.VC_PPIf_Tbl[key] = {}  for k,v in pairs(tbl) do local PPGrp = VC.GetPoseParams(ent) if PPGrp[k] and ent:GetPoseParameter(k) == PPGrp[k].max then allowed = true break end end  ent.VC_PPIf_Tbl[key].allowed = allowed  else  allowed = ent.VC_PPIf_Tbl[key].allowed  end  end   return allowed end  function VC.GetSpeed(ent, abs) local Spd = math.abs(ent:GetVelocity():Dot(ent:GetForward())) if abs then Spd = math.abs(Spd) end return Spd end function VC.AngleCombCalc(ang1, ang2) ang1:RotateAroundAxis(ang1:Forward(), ang2.p) ang1:RotateAroundAxis(ang1:Right(), ang2.r) ang1:RotateAroundAxis(ang1:Up(), ang2.y) return ang1 end function VC.AngleCombCalc2(ang1, ang2) ang1:RotateAroundAxis(ang1:Forward(), ang2.p) ang1:RotateAroundAxis(ang1:Right(), ang2.y) ang1:RotateAroundAxis(ang1:Up(), ang2.r) return ang1 end  function VC.AngleDifference(ang1, ang2) return math.max(math.max(math.abs(math.AngleDifference(ang1.p, ang2.p)), math.abs(math.AngleDifference(ang1.y, ang2.y))), math.abs(math.AngleDifference(ang1.r, ang2.r))) end function VC.AngleDifference_Ex(ang1, ang2) return Angle(math.AngleDifference(ang1.p, ang2.p), math.AngleDifference(ang1.y, ang2.y), math.AngleDifference(ang1.r, ang2.r)) end function VC.IsBig(ent) if SERVER then return ent.VC_IsBig else return ent:GetNWBool("VC_IsBig", false) end end function VC.IsTrailer(ent) if SERVER then return ent.VC_IsTrailer else return ent:GetNWBool("VC_IsTrailer", false) end end  function VC.GetWaterLevel(ent)  if !ent.VC_WaterLevelCheckTime or CurTime() >= ent.VC_WaterLevelCheckTime then  ent.VC_WaterLevelCheckTime = CurTime()+1   if ent.VC_IsAirboat then  ent.VC_WaterLevel = 1  else  ent.VC_WaterLevel = ent:WaterLevel()  end  end   return ent.VC_WaterLevel end  function VC.AngleInBounds(BNum, ang1, ang2) return math.abs(math.AngleDifference(ang1.p, ang2.p)) < BNum and math.abs(math.AngleDifference(ang1.y, ang2.y)) < BNum and math.abs(math.AngleDifference(ang1.r, ang2.r)) < BNum end  function VC.IsLocked(ent) if IsValid(ent) then if ent.VC_ExtraSeat then ent = ent:GetParent() end return IsValid(ent) and ent:GetSaveTable().VehicleLocked end end  function VC.ObjectIsDamaged(ent, object, int) return ent.VC_DamagedObjects and ent.VC_DamagedObjects[object] and ent.VC_DamagedObjects[object][int] end  function VC.getClosestEntity(pos, tbl, check)  local ret, dist = nil, nil   for k, v in pairs(tbl) do local tdist = pos:DistToSqr(v:GetPos()) if (!check or check(v)) and (!dist or tdist < dist) then dist = tdist ret = v end end   return ret end  function VC.PrepareColor(val, copy)  local ret = nil  if val then  if val[1] then  ret = Color(val[1],val[2] or 0,val[3] or 0, 255)  else  ret = val  if copy then ret = table.Copy(ret) end  end  end  return ret end    function VC.getOverride(ent, id)  local ovr = ent.VC_overrides  if !ovr then return end   local ovr_id = ovr[id]  if ovr_id then return ovr_id end end  function VC.setOverride(ent, id, val)  if !ent.VC_overrides then ent.VC_overrides = {} end   ent.VC_overrides[id] = val end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod??settings_sf:
local settings = {  Enabled = true,  Lights = true,  Override_Controls = false,  Currency = 1,      Horn_Volume = 1,  Horn_Enabled = true, }  VC.SettingsAdd(settings, true) local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod??init_shared_after:
function VC.SettingsSetNew(tbl)  local ret = {}  if tbl then  ret = tbl  else  VCPrint("ERROR! Failed to load settings file. This issue is most likely caused by not allowing to write to garrysmod/data/vcmod directory.")  end   VC.Settings = table.Copy(ret)  if SERVER then VC.ServerSettings = table.Copy(ret) end   return ret end   if SERVER then     function VC.Override_Controls_Read() VC.Override_Controls = util.KeyValuesToTable(file.Read("data/vcmod/override_controls.txt", "GAME") or "") end  function VC.Override_Controls_Create() local CntTbl = {} file.Write("vcmod/override_controls.txt", util.TableToKeyValues(CntTbl)) VC.Override_Controls_Read() end  if !file.Exists("vcmod/override_controls.txt", "DATA") then VC.Override_Controls_Create() else VC.Override_Controls_Read() end   util.AddNetworkString("VC_SendSettingsToServer_Override_Controls")  net.Receive("VC_SendSettingsToServer_Override_Controls", function(len, ply)  if !VC.CanEditAdminSettings(ply) then return end   local Tbl = net.ReadTable() if !Tbl then return end  for k,v in pairs(Tbl) do if !v.use or v.use != "1" then Tbl[k] = nil end end  VC.Override_Controls = Tbl  file.Write("vcmod/override_controls.txt", util.TableToKeyValues(Tbl))  VC.Stream_Override_Controls()   VC.log('<General> Player: '..VC.log_getPlayer(ply)..' has altered VCMod administrative override conntrols settings.', "General")  end)    util.AddNetworkString("VC_SendToClient_Options")  util.AddNetworkString("VC_SendToClient_Logging")  util.AddNetworkString("VC_SendToClient_Logging_Spec")  util.AddNetworkString("VC_SendSettingsToServer")   function VC.SettingsChanged()  VC.Stream_SV_Settings()  end   local function CheckDefaults() local chng = false for k,v in pairs(VC.Settings_Defaults) do if VC.Settings[k] == nil then VC.Settings[k] = v chng = true end end if chng then VC.SettingsChanged() end end   function VC.ResetSettings() file.Write("vcmod/settings_sv.txt", util.TableToJSON(VC.Settings_Defaults, true)) VC.SettingsSetNew(VC.Settings_Defaults) VC.SettingsChanged() CheckDefaults() end   function VC.LoadSettings()  if file.Exists("vcmod/settings_sv.txt", "DATA") then  VC.SettingsSetNew(table.Copy(util.JSONToTable(file.Read("vcmod/settings_sv.txt", "DATA"))))  VC.SettingsChanged()  else  VC.ResetSettings()  end  CheckDefaults()  end   function VC.SaveSetting(k,v)  hook.Call("VC_SettingChanged", GAMEMODE, k, v, VC.Settings[k] or v)  hook.Call("VC_settingChanged", GAMEMODE, k, v, VC.Settings[k] or v)              end     VC.LoadSettings() timer.Simple(10, VC.SettingsChanged)   function VC.GetSettings(ply) net.Start("VC_SendToClient_Options") net.WriteTable(VC.Settings) if ply then net.Send(ply) else net.Broadcast() end end   concommand.Add("VC_ResetSettings", function(ply, cmd, arg) if VC.CanEditAdminSettings(ply) then VC.ResetSettings() end end)  concommand.Add("VC_GetSettings_Sv", function(ply, cmd, arg) if VC.CanEditAdminSettings(ply) then VC.GetSettings(ply) end end)  concommand.Add("VC_GetLogging_Data", function(ply, cmd, arg) if VC.CanEditAdminSettings(ply) then local data = {} for k,v in pairs(file.Find("vcmod/logs/*", "DATA")) do data[k] = string.gsub(v, ".txt", "") end net.Start("VC_SendToClient_Logging") net.WriteString(util.TableToJSON(data)) if ply then net.Send(ply) else net.Broadcast() end end end)  concommand.Add("VC_GetLogging_Data_Spec", function(ply, cmd, arg) if VC.CanEditAdminSettings(ply) and arg[1] then local contents = file.Read("vcmod/logs/"..arg[1]..".txt", "DATA") if contents then net.Start("VC_SendToClient_Logging_Spec") net.WriteString(contents) if ply then net.Send(ply) else net.Broadcast() end end end end)  concommand.Add("VC_GetSettings_Sv_Override_Controls", function(ply, cmd, arg) if VC.CanEditAdminSettings(ply) then VC.Stream_Override_Controls(ply) end end)   function VC.Settings_Save(tbl)  if !tbl then return end  file.Write("vcmod/settings_sv.txt", util.TableToJSON(tbl, true))  end   net.Receive("VC_SendSettingsToServer", function(len, ply)  if !VC.CanEditAdminSettings(ply) then return end   local Tbl = net.ReadTable()  if !Tbl then return end  for k,v in pairs(Tbl) do if VC.Settings[k] != v then VC.SaveSetting(k,v) end end  VC.SettingsSetNew(Tbl)   CheckDefaults() VC.SettingsChanged()  VC.Settings_Save(Tbl)   VC.log('<General> Player: '..VC.log_getPlayer(ply)..' has altered VCMod administrative settings.', "General")  end)  else   function VC.SettingsChanged()  if !VC.Material then return end  VC.HD_Texture = VC.Material.HD2 if VC.getSetting("Light_Type") == 2 then VC.HD_Texture = VC.Material.HD end  end   local function CheckDefaults() local chng = false for k,v in pairs(VC.Settings_Defaults) do if VC.Settings[k] == nil then VC.Settings[k] = v chng = true end end if chng then VC.SettingsChanged() end end   function VC.ResetSettings() file.Write("vcmod/settings_cl.txt", util.TableToJSON(VC.Settings_Defaults, true)) VC.SettingsSetNew(VC.Settings_Defaults) VC.SettingsChanged() CheckDefaults() end   function VC.LoadSettings()  if file.Exists("vcmod/settings_cl.txt", "DATA") then  VC.SettingsSetNew(table.Copy(util.JSONToTable(file.Read("vcmod/settings_cl.txt", "DATA"))))  VC.SettingsChanged()  else  VC.ResetSettings()  end  CheckDefaults()  end   function VC.SaveSetting(k,v)  hook.Call("VC_SettingChanged", GAMEMODE, k, v, VC.Settings[k] or v)  hook.Call("VC_settingChanged", GAMEMODE, k, v, VC.Settings[k] or v)  if k and v != nil then  local Tbl = {}  if file.Exists("vcmod/settings_cl.txt", "DATA") then Tbl = util.JSONToTable(file.Read("vcmod/settings_cl.txt", "DATA")) else Tbl = VC.Settings_Defaults end  if !Tbl then return end  Tbl[k] = v VC.SettingsSetNew(Tbl) CheckDefaults() VC.SettingsChanged()  file.Write("vcmod/settings_cl.txt", util.TableToJSON(Tbl, true))  end  end   VC.LoadSettings()   concommand.Add("VC_SaveSetting_Cl", function(ply, cmd, arg) if arg and arg[1] and arg[2] then VC.SaveSetting(arg[1], arg[2]) end end)    VC.lngLoadLocal()  VC.lngReload()  VC.Lng_Get()  VCPrint("Initialized clientside language data.")    function VC.Controls_ReadScript() VC.Controls_List = util.KeyValuesToTable(file.Read("data/vcmod/controls.txt", "GAME") or "") for k,v in pairs(VC.Controls_Main) do if !VC.Controls_List[v.cmd] then VC.Controls_List[v.cmd] = {key = v.default.key, hold = v.default.hold} end end end  function VC.Controls_CreateScript() local CntTbl = {} for _, Ctr in pairs(VC.Controls_Main) do if !Ctr.default.hold then Ctr.default.hold = "0" end CntTbl[Ctr.cmd] = Ctr.default end file.Write("vcmod/controls.txt", util.TableToKeyValues(CntTbl)) VC.Controls_ReadScript() end   if vcmod1 or vcmod1_els then if !file.Exists("vcmod/controls.txt", "DATA") then VC.Controls_CreateScript() else VC.Controls_ReadScript() end end   hook.Add("PostDrawTranslucentRenderables", "VC_PostDrawTranslucentRenderables_Updater", function()  net.Start("VC_RequestGlobalData") net.SendToServer()  hook.Remove("PostDrawTranslucentRenderables", "VC_PostDrawTranslucentRenderables_Updater")  end) end  VC.Include("vcmod/shared/devcorner_sf.lua")  function VC.GetDataGeneral(mdl)  local ret = nil  if !VC_TgX3e18505c6fdde124627e9fa198ee180bUTyGen then if VC.globalODGen_LoadLocal then VC.globalODGen_LoadLocal() else VC_TgX3e18505c6fdde124627e9fa198ee180bUTyGen = {} end end  return VC_TgX3e18505c6fdde124627e9fa198ee180bUTyGen[mdl] end    if VC.Extra_Modules then  for k,v in pairs(VC.Extra_Modules) do  if v.init_postLoad and !v.inited_postLoad then v.inited_postLoad = true v.init_postLoad() end  end end      function VC.log_removeOld(time)  if !time then time = 60*60*24*31 end   local count = 0  local data = {} for k,v in pairs(file.Find("vcmod/logs/*", "DATA")) do data[k] = string.gsub(v, ".txt", "") end  for k,v in pairs(data) do  local var = string.Explode("(", v)[2]  if var then  local fileTime = string.Explode(")", var)[1]  if fileTime then  fileTime =  tonumber(fileTime)  if fileTime and type(fileTime) == "number" and fileTime < (os.time()-time) then  count = count+1  file.Delete("vcmod/logs/"..v..".txt")  end  end  end  end   if count > 0 then  VCPrint("Removed "..count.." old log files that were over a month old.")  end end   VC.log_removeOld()  if !VC_TgX3e18505c6fdde124627e9fa198ee180bUTy then VC_TgX3e18505c6fdde124627e9fa198ee180bUTy = {} end local rs7 = "vc.check_msg_work_ALS_k4"  
--PATH mlogs/load/sh_load.lua:
  mLogs = mLogs or {} mLogs.root = "mlogs/" mLogs.prefix = "mLogs 2" mLogs.config = {} mLogs.version = "2.1.22" function mLogs.Print(str) 	if type(str) != "table" then 		MsgC(Color(255,100,0), "[".. mLogs.prefix .."] ", color_white, tostring(str) .. "\n") 	else 		for k,v in ipairs(str) do 			MsgC(Color(255,100,0), "[".. mLogs.prefix .."] ", color_white, tostring(k).."\t"..tostring(v) .. "\n") 		end 	end end  function mLogs.GetPlayerString(ply) 	if not IsValid(ply) then return "" end 	return ply:Name() .. "(" .. ply:SteamID() .. ")" end  mLogs.Print("Starting mLogs 2! Version: " .. mLogs.version) 
--PATH mlogs/permissions/cl_permissions.lua:
   mLogs.permissions.listeners = mLogs.permissions.listeners or {}  function mLogs.addPermissionsRequestListener(panel) 	mLogs.permissions.listeners[panel] = true end  function mLogs.removePermissionsRequestListener(panel) 	mLogs.permissions.listeners[panel] = nil end  mLogs.AddInterface("permissions_get", function() 	local _type, tag, perms = net.ReadString(), net.ReadString(), net.ReadTable() 	if (not (_type and tag and perms)) then return end     for _,pnl in pairs(table.GetKeys(mLogs.permissions.listeners)) do         if(ValidPanel(pnl) and pnl.OnReceivePerms)then             pnl:OnReceivePerms(_type, tag, perms)         end     end end)  mLogs.AddInterface("permissions_targets", function() 	local targets = net.ReadTable() 	mLogs.permissions.targets = targets 	if (not (targets)) then return end     for _,pnl in pairs(table.GetKeys(mLogs.permissions.listeners)) do         if(ValidPanel(pnl) and pnl.OnReceiveTargets)then             pnl:OnReceiveTargets(targets)         end     end end)  
--PATH mlogs/notify/cl_notify.lua:
   local function doPopup(duration,strTitle,strMessage) 	local w,h = ScrW(), ScrH() 	local popup = vgui.Create("mLogs_popup") 	popup:SetSize(w*0.5,h*0.3) 	popup:SetTitle(strTitle) 	popup:SetMessage(strMessage) 	popup:SetDuration(duration) 	popup:Center() 	popup:MakePopup() 	popup:DoModal() 	popup:easeInOutBack(popup:GetWide(),popup:GetTall(),1,0,-1) end  function mLogs.notify(Type,duration,strTitle,strMessage) 	if(Type == 1)then 		mLogs.alert(strTitle,strMessage) 	elseif(Type == 2)then 		doPopup(duration,strTitle,strMessage) 	end end  mLogs.AddInterface("notify", function() 	local info = net.ReadTable() 	mLogs.notify(info.type or 1, info.duration, info.title,info.message) end) 
--PATH mlogs/settings/subs/sh_discord.lua:
       local ct,st = "server", "discord" mLogs.settings.addSubcategory("Discord",ct,st,85)  mLogs.settings.addSpacer("Discord",ct,st) mLogs.settings.addOption(ct,st,{     title = "Server Name",     tag = "server_name",     desc = "This will be shown in logs on Discord to help identify between servers!",     type = "string",     default = GetHostName(),     get = function() return mLogs.discord.serverName end,     set = function(str) mLogs.discord.serverName = str end })  mLogs.settings.addOption(ct,st,{     title = "Webhook URL",     tag = "webhook_url",     desc = "Enter your Discord Webhook URL here, please read the documentation if you need help setting this up!",     type = "string",     default = "",     get = function() return mLogs.discord.webhookURL end,     set = function(str) mLogs.discord.webhookURL = str end }) 
--PATH mlogs/settings/types/sh_action.lua:
     mLogs.settings.addType("action",function(d)     return true end) 
--PATH mlogs/elements/logs/cl_logscategory.lua:
   local PANEL = {}  AccessorFunc(PANEL, "m_cColor", "Color") AccessorFunc(PANEL, "m_sText", "Text") AccessorFunc(PANEL, "m_sSelectedHook", "SelectedHook")  function PANEL:Init() 	self:SetColor(color_white) 	self:SetText("") 	 	self.hooks = self:Add("DIconLayout") 	self.hooks:SetSpaceY(0) end  function PANEL:SetCategory(categoryData) 	self.categoryData = categoryData 	self:SetColor(categoryData.color) 	self:SetText(categoryData.name) 	 	for k,v in pairs(categoryData.hooks) do 		if(v.disabled)then continue end 		local pnl = self.hooks:Add("mLogs_logsHook") 		pnl:SetData(v) 		pnl:SetColor(categoryData.color) 		pnl.DoClick = function() 			if(self.OnSelectHook)then 				self.OnSelectHook(categoryData,v) 			end 		end 	end 	 	self:InvalidateLayout() end  function PANEL:GetCategory() 	return self.categoryData end  function PANEL:SetInternalHook(tag) 	for k,v in pairs(self.hooks:GetChildren()) do 		local data = v.GetData and v:GetData() 		if(data and data.tag and data.tag == tag)then 			v:SetClicked(true) 		else 			v:SetClicked(false) 		end 	end end  function PANEL:ClearInternalHook() 	for k,v in pairs(self.hooks:GetChildren()) do 		v:SetClicked(false) 	end end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,38,self:GetColor()) 	 	  	  	  	 	draw.SimpleText(self:GetText() or "", "mLogs_category", w*0.5, 21, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) end  function PANEL:PerformLayout(w,h) 	local prefHeight = 38 	 	self.hooks:SetPos(0,prefHeight) 	self.hooks:SetSize(w,h) 	 	if(#self.hooks:GetChildren() > 0)then 		for k,v in pairs(self.hooks:GetChildren()) do 			v:SetSize(w,28) 		end 	end 	 	self.hooks:SetSize(w,select(2,self.hooks:ChildrenSize())) 	prefHeight = prefHeight + select(2,self.hooks:ChildrenSize()) 	self.prefHeight = prefHeight end vgui.Register( "mLogs_logsCategory", PANEL, "DPanel" ) 
--PATH mlogs/elements/main/cl_mainheader.lua:
   local PANEL = {}  function PANEL:Init() 	  	self.close = self:Add("mLogs_button") 	self.close:SetText("X") 	 	  	self.logs = self:Add("mLogs_button") 	self.logs:SetText(mLogs.getLang("logs")) 	self.logs:SetClicked(true) 	 	self.settings = self:Add("mLogs_button") 	self.settings:SetText(mLogs.getLang("settings")) end  function PANEL:SetClosePanel(pnl) 	self.close.DoClick = function(btn) 		if(ValidPanel(pnl)) then 			pnl:Close() 		end 	end 	self.logs.DoClick = function(btn) 		if(ValidPanel(pnl)) then 			pnl:SwitchPanel("mLogs_logs") 			self.logs:SetClicked(true) 			self.settings:SetClicked(false) 		end 	end 	self.settings.DoClick = function(btn) 		if(ValidPanel(pnl)) then 			pnl:SwitchPanel("mLogs_settings") 			self.logs:SetClicked(false) 			self.settings:SetClicked(true) 		end 	end 	 end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.head) 	draw.SimpleText(mLogs.getLang("mlogs"), "mLogs_Logo", w*0.01, h*0.5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) end function PANEL:PerformLayout(w,h) 	self.close:SetSize(h,h) 	local totalW = w-self.close:GetWide() 	self.close:SetPos(totalW,0) 	 	self.settings:SetSize(w*0.15,h) 	totalW = totalW - self.settings:GetWide() 	self.settings:SetPos(totalW,0) 	 	self.logs:SetSize(w*0.15,h) 	totalW = totalW - self.logs:GetWide() 	self.logs:SetPos(totalW,0) 	 end vgui.Register( "mLogs_mainHeader", PANEL, "DPanel" ) 
--PATH mlogs/elements/settings/types/cl_action.lua:
   local PANEL = {}  DEFINE_BASECLASS("mLogs_settingsBase")  function PANEL:Init()  	self.action = self:Add("mLogs_button") 	self.action:SetOutline(true) end  function PANEL:GetData()  end  function PANEL:OnOption(option,data,cat) 	if (data == nil) then return end 	if (not cat[2]) then return end 	if (cat[1] == "client") then return end 	 	self.action:SetText(data)     self.action.DoClick = function() 		if(option.are_you_sure_msg)then 			mLogs.query(mLogs.getLang("are_you_sure"),option.are_you_sure_msg,  			"Yes", 			function() 				self:SendAction(cat[2],option.tag) 			end, 			"No", 			function() end) 		else 			self:SendAction(cat[2],option.tag) 		end     end end  function PANEL:SendAction(cat,tag) 	mLogs.InteractInterface("settings_action",function() 		net.WriteString(cat) 		net.WriteString(tag) 	end) end  function PANEL:PerformLayout(w,h)     BaseClass.PerformLayout(self,w,h) end  vgui.Register( "mLogs_settingsOption_action", PANEL, "mLogs_settingsBase" ) 
--PATH mlogs/elements/settings/cl_settingsbase.lua:
   local PANEL = {}  function PANEL:Init() 	surface.SetFont("mLogs_settingTitle") 	self.space = select(2, surface.GetTextSize("|"))  	self.desc = self:Add("DLabel") 	self.desc:SetFont("mLogs_settingDesc") 	self.desc:SetTextColor(Color(255,255,255,100)) 	self.desc:SetAutoStretchVertical(true) 	self.desc:SetWrap(true)  	self.reset = self:Add("mLogs_button") 	self.reset:SetText("R") 	self.reset:SetOutline(true) 	self.reset:SetFont("mLogs_settingDesc") 	self.reset:SetTooltip(mLogs.getLang("reset")) 	self.reset.DoClick = function() 		if(not self.option) then return end 		if(self.OnReset) then self:OnReset() end 	end end  function PANEL:GetData() end  function PANEL:RemoveReset() 	if(ValidPanel(self.reset))then self.reset:Remove() end end  function PANEL:SetOption(option,cat) 	self.option = option 	self.desc:SetText(option.desc or "") 	self.cat = cat 	if(option.get)then 		self.data = option.get() 	end 	if(self.OnOption)then self:OnOption(option,self.data,cat) end 	if(not self.OnReset) then self.reset:SetVisible(false) end end  function PANEL:GetOption() 	return self.option end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.panel) 	if(not self.option) then return end 	draw.SimpleText(self.option.title,"mLogs_settingTitle", 4, 4, color_white) 	draw.RoundedBox(0, 0, self.space+5, w*0.7, 1, mLogs.config.colors.border) 	draw.RoundedBox(0, w*0.7-1, 0, 1, h, mLogs.config.colors.border) end  function PANEL:PerformLayout(w,h) 	self.descSize = w*0.7  	if(ValidPanel(self.reset))then 		self.reset:SetSize(20,20) 		self.reset:SetPos(self.descSize-self.reset:GetWide()-1,0) 	end  	self.desc:SetPos(4,10+self.space) 	self.desc:SetWide(self.descSize - 10) 	local diff = (64-6-self.space) 	if(self.desc:GetTall() >diff)then 		self.forceHeight = self.desc:GetTall() - diff + 6 	end 	if(ValidPanel(self.action))then 		self.action:SetSize(self.action.fw or w*0.28,self.action.fh or 32) 		self.action:SetPos(self.descSize + w*0.15 - self.action:GetWide()*0.5,h*0.5 - self.action:GetTall()*0.5) 	end end  vgui.Register( "mLogs_settingsBase", PANEL, "DPanel" ) 
--PATH mlogs/elements/ui/cl_text.lua:
   local PANEL = {} AccessorFunc(PANEL, "m_lColor", "LastColor")  function PANEL:Init()     self.layout = self:Add("DIconLayout")     self:SetFont(mLogs.getLogFont() or "mLogs_smaller")     self:SetMouseInputEnabled( false )     self:Clear() end  function PANEL:SetFont(font)     self.font = font     surface.SetFont(font)     self.layout:SetSpaceX(select(1,surface.GetTextSize(" "))) end  function PANEL:GetFont()     return self.font end  function PANEL:GetText()     return self.rawText end  function PANEL:Clear()     self.layout:Clear()     self:SetLastColor(color_white)     self.rawText = "" end  function PANEL:ParseData(data)     self:Clear()     for _,v in pairs(data) do         if(type(v) == "table" and v.r)then             self:SetLastColor(v)         elseif(type(v) == "string")then             self:AddString(v)         end     end end  function PANEL:AddString(str)     local txt = self.layout:Add("DLabel")     txt:SetFont(self:GetFont())     txt:SetTextColor(self:GetLastColor())     txt:SetText(str)     txt:SizeToContents()      self.rawText = self.rawText .. " " .. str end  function PANEL:Paint(w,h) end  function PANEL:PerformLayout(w,h)     self.layout:SetSize(w*5,h) end vgui.Register( "mLogs_text", PANEL, "DPanel" ) 
--PATH mlogs/elements/ui/cl_scrollbar.lua:
   DEFINE_BASECLASS("DVScrollBar")  local PANEL = {}  function PANEL:Init() 	self:SetHideButtons(true) end vgui.Register( "mLogs_scrollBar", PANEL, "DVScrollBar" ) 
--PATH mlogs/elements/ui/cl_numberentry.lua:
   DEFINE_BASECLASS("DTextEntry")  local PANEL = {} AccessorFunc(PANEL, "m_iIcon", "Icon") AccessorFunc(PANEL, "m_sPlaceholder", "Placeholder") AccessorFunc(PANEL, "m_sAllowedCharacters", "AllowedChars") AccessorFunc(PANEL, "m_BGColor", "BGColor")  function PANEL:Init() 	self:SetFont("mLogs_small") 	self:SetTextColor(color_white) 	self:SetCursorColor(color_white) 	self:SetNumeric(true) 	self:SetValue(100) 	self:SetUpdateOnType(true) 	self:SetAllowedChars("1234567890") 	self:SetBGColor(mLogs.config.colors.panel) end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h, mLogs.config.colors.uiBorder ) 	draw.RoundedBox(0,1,1,w-2,h-2, self:GetBGColor()) 	 	if(self:GetIcon())then 		surface.SetDrawColor(color_white) 		surface.SetMaterial(self:GetIcon()) 		surface.DrawTexturedRect(w*0.98-h*0.8,h*0.1,h*0.8,h*0.8) 	end 	 	if(self:GetPlaceholder() and self:GetValue() == "")then 		draw.SimpleText(self:GetPlaceholder(), "mLogs_small", w*0.02, h*0.5, mLogs.config.colors.uiBorder, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) 	end 	 	self:DrawTextEntryText(self:GetTextColor(), self:GetHighlightColor(), self:GetCursorColor()) end  function PANEL:CheckNumeric( strValue ) 	if ( !self:GetNumeric() ) then return false end 	if ( !string.find( self:GetAllowedChars(), strValue, 1, true ) ) then 		return true 	end 	return false end  function PANEL:DoNumberChange(val) 	if ( val == nil ) then return end 	 	local OldValue = val 	val = tonumber( val ) 	val = val or 0 	if ( val > 0 ) then 		  		val = string.TrimLeft( val, "0" )  	end 	self:SetText( val ) 	self:AfterNumberVerify(val) end function PANEL:AfterNumberVerify() end  function PANEL:OnValueChanged(val) 	self:DoNumberChange(val) end  function PANEL:OnLoseFocus() 	self:DoNumberChange(self:GetValue()) 	hook.Call( "OnTextEntryLoseFocus", nil, self ) end  vgui.Register( "mLogs_numberEntry", PANEL, "DTextEntry" ) 