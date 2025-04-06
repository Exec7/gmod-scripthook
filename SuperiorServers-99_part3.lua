--Stealed clientside server code by exechack.cc
--Hostname: !💠⇛SuperiorServers.co - CWRP - UPDATED MAP & CONTENT! - Part 3/12 - 06/04/2025


--PATH addons/gpakr_out/lua/gpakr/cosmetics-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/cosmetics-2255054637.bsp',FileName='cosmetics',CRC='2255054637',Len=82763675,ShouldLoad=true}
--addons/gpakr_out/lua/gpakr/miscellaneous-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/miscellaneous-2800647085.bsp',FileName='miscellaneous',CRC='2800647085',Len=87787694,ShouldLoad=true}
--addons/gpakr_out/lua/gpakr/seasonal-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/seasonal-441306292.bsp',FileName='seasonal',CRC='1729444771',Len=52494280,ShouldLoad=true}
--addons/badmin/lua/dash/preload/badmodules_example.lua:
-- This folder has total load priority over everything
-- This can be used to kill modules you dont use on your server
-- require 'example'  will now silently ignore this module
dash.BadModules['example'] = true
--addons/badmin/lua/includes/_init.lua:
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
--addons/!lpakr_out/lua/dash/extensions/color.lua:
local tonumber=tonumber;local a=string.format;local b=string.match;local c=bit.band;local d=bit.rshift;local Lerp=Lerp;COLOR=FindMetaTable'Color'function Color(e,f,g,h)return setmetatable({r=tonumber(e)||255,g=tonumber(f)||255,b=tonumber(g)||255,a=tonumber(h)||255},COLOR)end;function COLOR:Copy()return Color(self.r,self.g,self.b,self.a)end;function COLOR:SetHex(i)local e,f,g=b(i,'#(..)(..)(..)')self.r,self.g,self.b=tonumber(e,16),tonumber(f,16),tonumber(g,16)end;function COLOR:ToHex()return a('#%02X%02X%02X',self.r,self.g,self.b)end;function COLOR:SetEncodedRGB(j)self.r,self.g,self.b=c(d(j,16),0xFF),c(d(j,8),0xFF),c(j,0xFF)end;function COLOR:ToEncodedRGB()return(self.r*0x100+self.g)*0x100+self.b end;function COLOR:SetEncodedRGBA(j)self.r,self.g,self.b,self.a=c(d(j,16),0xFF),c(d(j,8),0xFF),c(j,0xFF),c(d(j,24),0xFF)end;function COLOR:ToEncodedRGBA()return((self.a*0x100+self.r)*0x100+self.g)*0x100+self.b end;function COLOR:LerpFromTo(k,l,m)self.r,self.g,self.b=Lerp(k,l.r,m.r),Lerp(k,l.g,m.g),Lerp(k,l.b,m.b),Lerp(k,l.a,m.a)end;function COLOR:IsLight()local n,n,o=ColorToHSL(self)return o>=.5 end;function COLOR:InverseLight(p,q)p=p||color_white;local n,n,o=ColorToHSL(self)local r,s,n=ColorToHSL(p)return HSLToColor(r,s,q&&math.Round(1-o)||1-o)end
--addons/!lpakr_out/lua/dash/extensions/player.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/areatrigger_init.lua:
AddCSLuaFile()areatrigger=areatrigger||{}dash.IncludeCL'areatrigger/init_cl.lua'dash.IncludeCL'areatrigger/ui/dropdown_ui.lua'dash.IncludeCL'areatrigger/ui/preview_ui.lua'dash.IncludeCL'areatrigger/ui/trigger_ui.lua'dash.IncludeCL'areatrigger/ui/menu_ui.lua'dash.IncludeSH'areatrigger/init_sh.lua'dash.IncludeSV'areatrigger/init_sv.lua'
--addons/!lpakr_out/lua/areatrigger/ui/preview_ui.lua:
local a={}local b=Color(240,240,240)local c=Color(199,199,199)local d=Color(45,111,0)local e=Color(255,100,100)Derma_Hook(a,'Paint','Paint','ComboBox')function a:Init()self:DockPadding(5,2,2,2)self:SetTall(45)self:SetCursor('hand')local f=vgui.Create('DLabel',self)f:Dock(TOP)f:SetFont'ui.12'f:SetTextColor(color_black)f:SetContentAlignment(1)self.Name=f;local g=vgui.Create('DLabel',self)g:Dock(FILL)g:SetFont'ui.12'g:SetTextColor(color_black)g:SetContentAlignment(7)self.ID=g;local h=vgui.Create('DLabel',self)h:SetSize(64,64)h:SetFont'ForkAwesome'h:SetText(utf8.char(0xf204))h:DockMargin(1,0,1,0)h:SetTextColor(e)self.Active=h;hook.Add('OnTriggerConfigActivated',self,self.OnTriggerConfigActivated)hook.Add('OnTriggerConfigDeactivated',self,self.OnTriggerConfigDeactivated)end;function a:PerformLayout(i,j)if IsValid(self.Active)then self.Active:CenterVertical()self.Active:SetPos(i-36,self.Active.y)end end;function a:OnRemove()hook.Remove('OnTriggerConfigActivated',self)hook.Remove('OnTriggerConfigDeactivated',self)end;function a:UpdateActive(k)self.Active:SetText(k&&utf8.char(0xf205)||utf8.char(0xf204))self.Active:SetTextColor(k&&d||e)end;function a:OnTriggerConfigActivated(g)if self.Trigger&&self.Trigger.id==g then self:UpdateActive(true)end end;function a:OnTriggerConfigDeactivated(g)if self.Trigger&&self.Trigger.id==g then self:UpdateActive(false)end end;function a:Populate(l)self.Trigger=l;self.ID:SetText(l.id||'N/A')self.Name:SetText(l.name)if areatrigger.Activated[l.id]then self:UpdateActive(true)end end;function a:OnMousePressed(m)if m==MOUSE_LEFT then self:DoClick()end end;function a:DoClick()end;function a:GetTextColor()return color_black end;function a:GetHighlightColor()return color_black end;function a:IsMenuOpen()return false end;vgui.Register('trigger_preview',a,'DPanel')
--addons/!lpakr_out/lua/autorun/badmin_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/theme.lua:
ui.SpacerHeight=35;ui.ButtonHeight=30;local a={PrintName='SUP',Author='aStonedPenguin'}local b=ui.col.SUP;local c=ui.col.Gradient;local d=ui.col.Header;local e=ui.col.Background;local f=ui.col.Outline;local g=ui.col.Hover;local h=ui.col.Button;local i=ui.col.ButtonHover;local j=ui.col.Close;local k=ui.col.CloseBackground;local l=ui.col.CloseHovered;local m=ui.col.OffWhite;local n=ui.col.FlatBlack;local o=ui.col.Black;local p=ui.col.White;local q=ui.col.Red;local r=ui.col.Green;local s=Material'gui/gradient_down'local t=Material'sup/ui/check.png'local u=Material'sup/ui/x.png'function a:PaintFrame(self,v,w)if self.Blur!=false then draw.Blur(self)end;draw.RoundedBoxEx(5,0,0,v,30,d,true,true,false,false)if self.Accent then draw.RoundedBox(5,0,0,3,30,b)end;draw.RoundedBox(5,0,0,v,w,e)end;function a:PaintFrameLoading(self,v,w)if self.ShowIsLoadingAnim then draw.RoundedBox(5,0,27,v,w-27,e)local x=SysTime()*5;draw.NoTexture()surface.SetDrawColor(255,255,255)surface.DrawArc(v*0.5,w*0.5,41,46,x*80,x*80+180,20)end end;function a:PaintFrameTitleAnim(self,v,w)local y=self.TitleAnimDelta;local z=b.a;b.a=y*255;draw.RoundedBox(5,0,0,3,30,b)b.a=z;if y==1 then self.Accent=true end end;function a:PaintPanel(self,v,w)draw.RoundedBox(5,0,0,v,w,self.BackgroundColor||e)end;function a:PaintShadow()end;function a:PaintButton(self,v,w)if!self.m_bBackground then return end;if self:GetDisabled()then if self.Corners then draw.RoundedBoxEx(5,0,0,v,w,self.BackgroundDisabledColor||self.BackgroundColor||ui.col.FlatBlack,unpack(self.Corners))else draw.RoundedBox(5,0,0,v,w,self.BackgroundDisabledColor||self.BackgroundColor||ui.col.FlatBlack)end else if self.Corners then draw.RoundedBoxEx(5,0,0,v,w,self.BackgroundColor||ui.col.Button,unpack(self.Corners))else draw.RoundedBox(5,0,0,v,w,self.BackgroundColor||ui.col.Button)end;if self:IsHovered()||self.Active then if self.Corners then draw.RoundedBoxEx(5,0,0,v,w,self.BackgroundHoverColor||ui.col.Hover,unpack(self.Corners))else draw.RoundedBox(5,0,0,v,w,self.BackgroundHoverColor||ui.col.Hover)end end end;if self.FontIcon then draw.SimpleText(self.FontIcon,'ForkAwesome',w*0.5,w*0.5,self:GetTextColor(),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end;local function A(B,C,D,E,F)local G=C+B*1-C;local H=D+B*1-D;local I=64;local J=2*math.pi/I;local K={}X,Y=E-B,F-B;for L=0,I-1 do local M=J*L%I;local N=X+B*math.cos(M)local O=Y+B*math.sin(M)if L==I/4-1 then X,Y=C+B,F-B;table.insert(K,{x=X,y=Y,u=G,v=H})elseif L==I/2-1 then X,Y=C,B;table.insert(K,{x=X,y=Y,u=G,v=H})X=C+B elseif L==3*I/4-1 then X,Y=E-B,0;table.insert(K,{x=X,y=Y,u=G,v=H})Y=B end;table.insert(K,{x=N,y=O,u=G,v=H})end;return K end;local P=Material("effects/flashlight001")function a:PaintImageButton(self,v,w)if!self.Poly||(self.LastW!=v||self.LastH!=w)then self.Poly=A(5,0,0,v,w)self.LastW=v;self.LastH=w end;render.ClearStencil()render.SetStencilEnable(true)render.SetStencilWriteMask(1)render.SetStencilTestMask(1)render.SetStencilFailOperation(STENCILOPERATION_REPLACE)render.SetStencilPassOperation(STENCILOPERATION_ZERO)render.SetStencilZFailOperation(STENCILOPERATION_ZERO)render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)render.SetStencilReferenceValue(1)draw.NoTexture()surface.SetMaterial(P)surface.SetDrawColor(o)surface.DrawPoly(self.Poly)render.SetStencilFailOperation(STENCILOPERATION_ZERO)render.SetStencilPassOperation(STENCILOPERATION_REPLACE)render.SetStencilZFailOperation(STENCILOPERATION_ZERO)render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)render.SetStencilReferenceValue(1)if self.Material then surface.SetDrawColor(255,255,255)surface.SetMaterial(self.Material)surface.DrawTexturedRect(0,0,v,w)end;if IsValid(self.AvatarImage)then self.AvatarImage:SetPaintedManually(false)self.AvatarImage:PaintManual()self.AvatarImage:SetPaintedManually(true)end;render.SetStencilEnable(false)render.ClearStencil()if self.Hovered&&self:IsEnabled()then draw.RoundedBox(5,0,0,v,w,g)end end;function a:PaintImageRow(self,v,w)if self.Active then draw.RoundedBox(5,0,0,v,w,n)return else draw.RoundedBox(5,0,0,v,w,self.BackgroundColor||e)end;if self:IsHovered()then draw.RoundedBox(5,0,0,v,w,g)end end;local Q=utf8.char(0xf00d)function a:PaintWindowCloseButton(R,v,w)if!R.m_bBackground then return end;draw.RoundedBoxEx(5,0,0,v,w,R.Hovered&&l||k,false,true,false,false)draw.SimpleText(Q,'ForkAwesome',v*0.5,w*0.5,ui.col.White,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;function a:PaintTransparentWindowCloseButton(R,v,w)if!R.m_bBackground then return end;surface.SetDrawColor(R.Hovered&&l||j)local S=math.floor(v/2-5)local T=math.floor(w/2-5)render.PushFilterMin(3)render.PushFilterMag(3)surface.DrawLine(S,T,S+10,T+10)surface.DrawLine(S,T+10,S+10,T)render.PopFilterMag()render.PopFilterMin()end;function a:PaintVScrollBar(self,v,w)end;function a:PaintButtonUp(self,v,w)end;function a:PaintButtonDown(self,v,w)end;function a:PaintButtonLeft(self,v,w)end;function a:PaintButtonRight(self,v,w)end;local U=ui.col.SUP:Copy()U.a=180;function a:PaintScrollBarGrip(self,v,w)draw.RoundedBox(5,0,0,v,w,U)end;function a:PaintScrollPanel(self,v,w)draw.RoundedBox(5,0,0,v,w,e)end;function a:PaintUIScrollBar(self,v,w)local N=self.scrollButton.x;draw.RoundedBox(5,N,0,v-N-N,w,ui.col.FlatBlack)draw.RoundedBox(5,N,self.scrollButton.y,v-N-N,self.height,U)end;function a:PaintUISlider(self,v,w)a:PaintPanel(self,v,w)draw.RoundedBox(5,1,1,v-2,w-2,n)if self.Vertical then draw.RoundedBox(5,1,self:GetValue()*w,v-2,w-self:GetValue()*w,b)else draw.RoundedBox(5,41,1,self:GetValue()*(v-40)-self:GetValue()*16,w-2,b)draw.SimpleText(math.ceil(self:GetValue()*100)..'%','ui.18',20,w*0.5,p,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end;function a:PaintSliderButton(self,v,w)draw.RoundedBox(5,0,0,v,w,self:IsHovered()&&i||m)end;function a:PaintTextEntry(self,v,w)draw.RoundedBox(5,0,0,v,w,m)if self.GetPlaceholderText&&self.GetPlaceholderColor&&self:GetPlaceholderText()&&self:GetPlaceholderText():Trim()!=""&&self:GetPlaceholderColor()&&(!self:GetText()||self:GetText()=="")then local V=self:GetText()local W=self:GetPlaceholderText()if W:StartWith("#")then W=W:sub(2)end;W=language.GetPhrase(W)self:SetText(W)self:DrawTextEntryText(self:GetPlaceholderColor(),self:GetHighlightColor(),self:GetCursorColor())self:SetText(V)return end;self:DrawTextEntryText(o,b,o)end;function a:PaintUIListView(self,v,w)if self.Corners then draw.RoundedBoxEx(5,0,0,v,w,ui.col.Background,unpack(self.Corners))else draw.RoundedBox(5,0,0,v,w,ui.col.Background)end end;function a:PaintListView(self,v,w)end;function a:PaintListViewLine(self,v,w)if self.m_bAlt then draw.Box(0,0,v,w,(self:IsSelected()||self:IsHovered())&&b||g)else draw.Box(0,0,v,w,(self:IsSelected()||self:IsHovered())&&b||e)end;for Z,_ in ipairs(self.Columns)do if self:IsSelected()||self:IsHovered()then _:SetTextColor(o)_:SetFont('ui.20')else _:SetTextColor(p)_:SetFont('ui.15')end end end;function a:PaintCheckBox(self,v,w)local a0=self:GetChecked()draw.RoundedBox(5,0,0,v,w,ui.col.FlatBlack)draw.RoundedBox(5,a0&&v*0.5||1,1,v*0.5-1,w-2,a0&&b||ui.col.OffWhite)if self:IsHovered()then draw.RoundedBox(5,0,0,v,w,ui.col.Hover)end end;local a1=b:Copy()a1.a=50;function a:PaintTabButton(self,v,w)draw.RoundedBox(5,0,0,v,w,ui.col.ButtonBlack)if self:IsHovered()then draw.RoundedBox(5,0,0,v,w,ui.col.Hover)end;if self.Active then draw.RoundedBox(5,0,0,v,w,a1)end end;function a:PaintTabListPanel(self,v,w)draw.RoundedBoxEx(5,160,0,v-160,w,e,false,true,false,true)end;function a:PaintComboBox(self,v,w)if IsValid(self.Menu)&&!self.Menu.SkinSet then self.Menu:SetSkin('SUP')self.Menu.SkinSet=true end;if!self.ColorSet then self:SetTextColor(ui.col.White)self.ColorSet=true end;draw.RoundedBox(5,0,0,v,w,self.BackgroundColor||ui.col.Button)if self:IsHovered()then draw.RoundedBox(5,0,0,v,w,ui.col.Hover)end end;local a2=utf8.char(0xf107)function a:PaintComboDownArrow(self,v,w)draw.SimpleText(a2,'ForkAwesome',v*0.5,w*0.5,self.ComboBox:IsMenuOpen()&&ui.col.OffWhite||ui.col.White,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;function a:PaintMenu(self,v,w)draw.RoundedBox(5,0,0,v,w,ui.col.Black)end;function a:PaintMenuOption(self,v,w)if!self.FontSet then self:SetTextInset(0,0)self:SetFont('ui.16')self:PerformLayout()self.ParentMenu:PerformLayout()self.FontSet=true end;self:SetTextColor(p)local a3=self:IsEnabled()draw.RoundedBox(5,1,1,v-2,w-2,a3&&ui.col.Button||ui.col.FlatBlack)if self.m_bBackground&&(self.Hovered||self.Highlight)&&a3 then draw.RoundedBox(5,1,1,v-2,w-2,ui.col.Hover)end end;function a:PaintMenuRightArrow(R,v,w)surface.SetDrawColor(ui.col.White)draw.NoTexture()surface.DrawPoly({{x=3,y=3},{x=v,y=w*0.5+3},{x=3,y=w}})end;local a4=Color(200,200,200)local a5=ui.col.ButtonHover;local a6=Color(b.r,b.g,b.b-20)function a:PaintPropertySheet(self,v,w)local a7=self:GetActiveTab()if IsValid(a7)then if!self.Dark then draw.Box(0,a7:GetTall(),v,w-a7:GetTall(),a4)end end end;function a:PaintTab(self,v,w)local a8=self:GetPropertySheet():GetActiveTab()==self;if a8 then self:SetTextColor(a6)if!self:GetPropertySheet().Dark then draw.Box(0,0,v,w,a4)else draw.Box(0,0,v,w,e)surface.SetDrawColor(f)surface.DrawOutlinedRect(0,0,v,w+1)end elseif self:IsHovered()then self:SetTextColor(a5)else self:SetTextColor(a4)end end;function a:PaintTooltip(self,v,w)draw.RoundedBox(4,0,0,v,w,ui.col.Outline)draw.RoundedBox(4,1,1,v-2,w-2,ui.col.Background)end;derma.DefineSkin('SUP','SUP\'s derma skin',a)
--addons/!lpakr_out/lua/ui/controls/checkbox.lua:
local a={}function a:SetText(b)self.Label=self.Label||ui.Create('DLabel',self)self.Label:SetFont('ui.18')self.Label:SetText(b)end;function a:PerformLayout()end;function a:SetConVar(c)self.Button.DoClick=function()self.Button:Toggle()cvar.SetValue(c,!cvar.GetValue(c))end;self.Label:SetMouseInputEnabled(true)self.Label.OnMousePressed=self.Button.DoClick;self:SetValue(cvar.GetValue(c)&&1||0)self:SetTextColor(ui.col.White)end;function a:SizeToContents()local d,e=40,20;self.Button:SetSize(d,e)if self.Label then self.Label:SizeToContents()e=math.max(e,self.Label:GetTall())self.Label:SetPos(d+5,(e-self.Label:GetTall())*0.5-1)d=d+10+self.Label:GetWide()end;self:SetSize(d,e)end;vgui.Register('ui_checkbox',a,'DCheckBoxLabel')
--addons/!lpakr_out/lua/ui/controls/playerbutton.lua:
local a={}function a:Init()self.ImageButton=ui.Create('ui_imagebutton',self)self:SetText('')self:SetFont('ui.22')self:SetTextColor(ui.col.White)self:SetTall(30)end;function a:PerformLayout()self.ImageButton:SetPos(2,2)self.ImageButton:SetSize(26,26)end;function a:SetPlayer(b,c)local d=isplayer(b)&&b||player.Find(c)if isplayer(d)then self.Player=d;self:SetColor((d.GetJobColor&&d:GetJobColor()||team.GetColor(d:Team())):Copy())self:SetText(d:Name())self.ImageButton:SetPlayer(d)else self:SetText(b)self:SetColor(team.GetColor(1):Copy())if c then self.ImageButton:SetSteamID64(c)else self.ImageButton:SetVisible(false)end end end;function a:SetMaterial(e)self.ImageButton:SetMaterial(e)end;function a:SetColor(f)self.BackgroundColor=f end;function a:GetPlayer()return self.Player end;function a:DoClick()end;function a:Paint(g,h)derma.SkinHook('Paint','ImageRow',self,g,h)end;vgui.Register('ui_imagerow',a,'ui_button')
--addons/!lpakr_out/lua/badmin/core/util/notifications/terms_sh.lua:
local function a(...)for b,c in ipairs({...})do local d=type(c)if d=='Player'then net.WriteUInt(0,2)net.WritePlayer(c)elseif d=='Entity'then net.WriteUInt(1,2)elseif d=='Number'&&c%1==0 then net.WriteUInt(2,2)net.WriteUInt(c,32)else net.WriteUInt(3,2)net.WriteString(tostring(c))end end end;local e=Color(255,0,0)local f=Color(235,235,235)local g=Color(200,200,200)local h=Color(175,255,175)local i=Color(190,190,190)local function j(k)local d=net.ReadUInt(2)if d==0 then local c=net.ReadPlayer()if IsValid(c)then table.insert(k,c)table.insert(k,i)table.insert(k,'('..c:SteamID()..')')table.insert(k,f)else table.insert(k,g)table.insert(k,'Unknown')table.insert(k,f)end elseif d==1 then local c=net.ReadEntity()table.insert(k,g)if isentity(c)&&c:IsWorld()then table.insert(k,'(Console)')else table.insert(k,IsValid(c)&&util.GetPrintName(c)||'Unknown Entity')end;table.insert(k,f)else local l=d==2&&tostring(net.ReadUInt(32))||net.ReadString()table.insert(k,h)table.insert(k,l)table.insert(k,f)end end;local m='#'local function n(o)local p={f}local q,r,s,t=1,1,1,true;if o:sub(1,1)==m then j(p)r=r+1;s=r end;while true do r=r+1;q,r=o:find(m,r)if r==nil then if!t then j(p)end;if o:sub(s):Trim()!=''then table.insert(p,o:sub(s))end;break end;if!t then j(p)end;table.insert(p,o:sub(s,r-1))s=r+1;t=false end;return p end;function ba.ReadTerm()return n(term.GetString(net.ReadUInt(10)))end;function ba.WriteMsg(o,...)net.WriteString(o)a(...)end;function ba.ReadMsg()return n(net.ReadString())end
--addons/!lpakr_out/lua/badmin/core/ui/vgui/ba_passwordentry.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/core/ui/vgui/ba_player.lua:
PANEL={}function PANEL:Init()self.Avatar=ui.Create('ui_imagebutton',self)self.Name=ui.Create('DLabel',self)self.Name:SetTextColor(ui.col.ButtonText)self.Copy=ui.Create('ui_button',self)self.Copy:SetText('Copy SteamID')self.Copy.DoClick=function()SetClipboardText(self.SteamID)end end;function PANEL:PerformLayout()self.Avatar:Dock(LEFT)self.Avatar:SetWide(32)self.Avatar:DockMargin(2,2,2,2)self.Name:Dock(LEFT)self.Name:DockMargin(2,2,2,2)self.Name:SizeToContents()self.Copy:Dock(RIGHT)self.Copy:SetWide(115)self.Copy:DockMargin(7.5,7.5,7.5,7.5)end;function PANEL:GetValue()return self.SteamID end;function PANEL:SetPlayer(a)self.Player=a;self.SteamID=a:SteamID()self.Avatar:SetPlayer(a)self.Name:SetText(a:NameID())end;vgui.Register('ba_menu_playerlabel',PANEL,'ui_panel')PANEL={}function PANEL:Init()self.Selected=false;self.Avatar=ui.Create('ui_imagebutton',self)self.Name=ui.Create('DLabel',self)self.Name:SetFont('ui.22')self.Name:SetTextColor(ui.col.ButtonText)self.Checkbox=ui.Create('ui_button',self)self.Checkbox:SetText('')self.Checkbox.DoClick=function()if Menu.Player!=self then if Menu.Player!=nil then Menu.Player.Selected=false end;Menu.Player=self;self.Selected=true;Menu:SetStage(2)else if Menu.CMD!=nil then Menu.CMD.Selected=false end;Menu.Player=nil;self.Selected=false;Menu:SetStage(1)end end;self.Checkbox.GetChecked=function()return self.Selected end;self.Checkbox.Paint=function(self,b,c)derma.SkinHook('Paint','CheckBox',self,b,c)end;self:SetTall(34)end;function PANEL:PerformLayout()self.Avatar:Dock(LEFT)self.Avatar:SetWide(32)self.Avatar:DockMargin(2,2,2,2)self.Name:Dock(LEFT)self.Name:DockMargin(2,2,2,2)self.Name:SizeToContents()self.Checkbox:Dock(RIGHT)self.Checkbox:SetWide(22.5)self.Checkbox:DockMargin(7.5,7.5,7.5,7.5)end;function PANEL:SetPlayer(a)self.Player=a;self.SteamID=a:SteamID()self.Avatar:SetPlayer(a)self.Name:SetText(self.Player:Name())end;function PANEL:SetStartTime(d)self.StartTime=d end;function PANEL:Think()if self.StartTime then local e=CurTime()-self.StartTime;local f=math.floor(e/60)local g=math.floor(e%60)self.PlayerName=IsValid(self.Player)&&self.Player:Name()||self.PlayerName;self.Name:SetText(Format("(%d:%02d) %s",f,g,self.PlayerName))end end;vgui.Register('ba_menu_player',PANEL,'ui_panel')
--addons/!lpakr_out/lua/badmin/modules/sync/_module.lua:
ba.Module'Sync':Author'aStonedPenguin':Include{'init_sh.lua','init_cl.lua','init_sv.lua'}
--addons/!lpakr_out/lua/badmin/plugins/abuse_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/plugins/abuse_sh.lua:
term.Add('AbusePlayerNotAlive','# is not alive!')term.Add('AbuseAdminSlainPlayer','# has slain #.')ba.AddCommand('Slay',function(a,b)if!b:Alive()then return ba.NOTIFY_ERROR,term.Get('AbusePlayerNotAlive'),b end;b:SetVelocity(Vector(0,0,2048))timer.Simple(0.2,function()local c=EffectData()c:SetOrigin(b:GetPos())c:SetMagnitude(512)c:SetScale(128)util.Effect('Explosion',c)b:Kill()end)return ba.NOTIFY_STAFF,term.Get('AbuseAdminSlainPlayer'),a,b end):AddParam(cmd.PLAYER_ENTITY):SetFlag'S':SetHelp'Kills your target'
--addons/!lpakr_out/lua/badmin/plugins/core_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/dpanels.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/possession.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/meta/phys.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/modules/net.lua:
local function a(b)if!isentity(b)then return false end;if!IsValid(b)then return false end;if!b:IsPlayer()then return false end;return true end;function net.DrG_WriteMessage(...)local c,d=table.DrG_Pack(...)d=math.min(d,63)net.WriteUInt(d,6)for e=1,d do net.WriteType(c[e])end end;function net.DrG_ReadMessage()local d=math.min(net.ReadUInt(6),63)local c={}for e=1,d do c[e]=net.ReadType()end;return c,d end;local f={}function net.DrG_Receive(g,h)if isfunction(h)then f[g]=h else f[g]=nil end end;function net.DrG_Send(g,...)if!isstring(g)then return false end;net.Start("DrGBaseNetMessage")net.WriteString(g)net.DrG_WriteMessage(...)if SERVER then else net.SendToServer()end;return true end;net.Receive("DrGBaseNetMessage",function(i,ply)local g=net.ReadString()if!isfunction(f[g])then return end;local c,d=net.DrG_ReadMessage()if SERVER then else f[g](table.DrG_Unpack(c,d))end end)local j=0;local k={}function net.DrG_DefineCallback(g,h)if!isstring(g)then return end;if isfunction(h)then k[g]=h else k[g]=nil end end;function net.DrG_RemoveCallback(g)return net.DrG_DefineCallback(g,nil)end;local l={}net.Receive("DrGBaseNetCallbackRes",function()local m=net.ReadUInt(6)if!isfunction(l[m])then return end;local c,d=net.DrG_ReadMessage()l[m](table.DrG_Unpack(c,d))l[m]=nil end)function net.DrG_UseCallback(g,h,...)if!isstring(g)then return false end;local c,d;local m=j;j=j+1;l[m]=h;net.Start("DrGBaseNetCallbackReq")net.WriteUInt(m,6)net.WriteString(g)if SERVER then else net.DrG_WriteMessage(...)net.SendToServer()end;return true end;net.Receive("DrGBaseNetCallbackReq",function(i,ply)local m=net.ReadUInt(6)local g=net.ReadString()if!isfunction(k[g])then return end;local c,d=net.DrG_ReadMessage()net.Start("DrGBaseNetCallbackRes")net.WriteUInt(m,6)net.DrG_WriteMessage(k[g](table.DrG_Unpack(c,d)))if SERVER then else net.SendToServer()end end)
--addons/!lpakr_out/lua/dronesrewrite/render_screen.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/render_screen.lua:
if CLIENT then hook.Add("RenderScene","dronesrewrite_renderscreen",function(a,b)if DRONES_REWRITE.ClientCVars.NoScreen:GetBool()then return end;local c={}table.Add(c,ents.FindByClass("dronesrewrite_controller"))table.Add(c,ents.FindByClass("dronesrewrite_console"))for d,e in pairs(c)do if LocalPlayer():GetAimVector():Dot((e:GetPos()-a):GetNormal())<0.3 then continue end;if e:GetUp():Dot((e:GetPos()-a):GetNormal())>0 then continue end;if!e.Rt then continue end;local f=e:GetNWEntity("DronesRewriteDrone")if!IsValid(f)then continue end;local g=f:GetCamera()if!IsValid(g)then continue end;local a=g:GetPos()local b=g:GetAngles()local h=render.GetRenderTarget()render.SetRenderTarget(e.Rt)render.Clear(0,0,0,255)render.ClearDepth()render.ClearStencil()render.RenderView({x=0,y=0,w=1024,h=1024,fov=70,origin=a,angles=b,drawpostprocess=true,drawhud=false,drawmonitors=false,drawviewmodel=false})render.SetRenderTarget(h)end end)end
--addons/!lpakr_out/lua/dronesrewrite/client/hud.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/weapons/camera.lua:
DRONES_REWRITE.Weapons["Camera"]={Initialize=function(self)return DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)end,Think=function(self,a)DRONES_REWRITE.Weapons["Template"].Think(self,a)end,Attack=function(self,a)if self:WasKeyPressed("Fire1")then if IsValid(self:GetDriver())then local b=util.TraceLine({start=a:GetPos(),endpos=a:GetPos()+a:GetForward()*256,filter=self})if self:GetNWBool("camera_flashen",true)then local c=EffectData()c:SetOrigin(b.HitPos)util.Effect("camera_flash",c,true)end;a:EmitSound("drones/camerawep.wav",80,100,1,CHAN_WEAPON)self:GetDriver():ConCommand("jpeg")end end end,Attack2=function(self,a)if self:WasKeyPressed("Fire2")then self:SetNWBool("camera_flashen",!self:GetNWBool("camera_flashen",true))end end}
--addons/!lpakr_out/lua/dronesrewrite/weapons/empty.lua:
DRONES_REWRITE.Weapons["Empty"]={Initialize=function(self,a,b)return DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)end}
--addons/!lpakr_out/lua/autorun/grapple_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/grapple/cl_init.lua:
gGrap=gGrap||{}net('sGrap.StartGrapple',function()local a=net.ReadEntity()local b=net.ReadEntity()if IsValid(a)&&IsValid(b)then b.Grapple=a end end)net('sGrap.StopGrapple',function()local b=net.ReadEntity()if IsValid(b)then b.Grapple=nil end end)
--addons/ssrp_lfs/lua/lvs_framework/autorun/cl_menu.lua:

local icon_load_version = Material("gui/html/refresh")
local bgMat = Material( "lvs/controlpanel_bg.png" )
local adminMat = Material( "icon16/shield.png" )
local gradient_mat = Material( "gui/gradient" )

local FrameSizeX = 600
local FrameSizeY = 400

local function ClientSettings( Canvas )

	local TopPanel = vgui.Create( "DPanel", Canvas )
	TopPanel:SetSize( FrameSizeX, FrameSizeY * 0.5 )
	TopPanel.Paint = function( self, w, h )
		surface.SetDrawColor( 80, 80, 80, 255 )
		surface.SetMaterial( gradient_mat )
		surface.DrawTexturedRect( 1, 0, w, 1 )

		draw.DrawText( "Mouse Settings", "LVS_FONT", 4, 4, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
	end
	TopPanel:Dock( BOTTOM )

	local RightPanel = vgui.Create( "DPanel", Canvas )
	RightPanel:SetSize( FrameSizeX * 0.5, FrameSizeY )
	RightPanel.Paint = function() end
	RightPanel:Dock( RIGHT )

	local LeftPanel = vgui.Create( "DPanel", Canvas )
	LeftPanel:SetSize( FrameSizeX * 0.5, FrameSizeY )
	LeftPanel.Paint = function() end
	LeftPanel:Dock( LEFT )

	local CheckBox = vgui.Create( "DCheckBoxLabel", TopPanel )
	CheckBox:DockMargin( 16, 36, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Use Mouse-Aim Steering" )
	CheckBox:SetConVar("lvs_mouseaim")
	CheckBox.OnChange = function( self, bVal )
		if not isbool( self.first ) then self.first = true return end
		timer.Simple(0.1, function() LVS:OpenMenu( true ) end )
	end

	if GetConVar( "lvs_mouseaim" ):GetInt() == 0 then
		local slider = vgui.Create( "DNumSlider", TopPanel )
		slider:DockMargin( 16, 4, 16, 4 )
		slider:Dock( TOP )
		slider:SetText( "X Sensitivity" )
		slider:SetMin( 0 )
		slider:SetMax( 10 )
		slider:SetDecimals( 3 )
		slider:SetConVar( "lvs_sensitivity_x" )

		local slider = vgui.Create( "DNumSlider", TopPanel )
		slider:DockMargin( 16, 4, 16, 4 )
		slider:Dock( TOP )
		slider:SetText( "Y Sensitivity" )
		slider:SetMin( 0 )
		slider:SetMax( 10 )
		slider:SetDecimals( 3 )
		slider:SetConVar( "lvs_sensitivity_y" )

		local slider = vgui.Create( "DNumSlider", TopPanel )
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

	local CheckBox = vgui.Create( "DCheckBoxLabel", LeftPanel )
	CheckBox:DockMargin( 16, 34, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Enable Context Menu HUD Editor" )
	CheckBox:SetConVar("lvs_edit_hud")

	local CheckBox = vgui.Create( "DCheckBoxLabel", RightPanel )
	CheckBox:DockMargin( 16, 34, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Show Vehicle Team Identifier" )
	CheckBox:SetConVar("lvs_show_identifier")

	local CheckBox = vgui.Create( "DCheckBoxLabel", RightPanel )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Show Hit/Kill Marker" )
	CheckBox:SetConVar("lvs_hitmarker")
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

function LVS:OpenClientSettings()
	if not IsValid( LVS.Frame ) then return end

	local BasePanel = LVS.Frame:CreatePanel()

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

	local Canvas = vgui.Create( "DPanel", BasePanel )
	Canvas.Paint = function(self, w, h ) end
	Canvas:DockMargin( 0, 0, 0, 0 )
	Canvas:SetSize( FrameSizeX, 25 )
	Canvas:Dock( FILL )
end

function LVS:OpenMenu( keep_position )
	local xPos
	local yPos

	if IsValid( LVS.Frame ) then
		if keep_position then
			xPos = LVS.Frame:GetX()
			yPos = LVS.Frame:GetY()
		end

		LVS.Frame:Close()
		LVS.Frame = nil
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
			else
				local Current = LVS:GetVersion()
				local Latest = LVS.VERSION_GITHUB

				local Pref = "v"

				if Current >= Latest then
					Col = Color(0,255,0,255)
				else
					Col = Color(255,0,0,255)
					Pref = "OUTDATED v"
				end

				draw.SimpleText( Pref..LVS:GetVersion()..LVS.VERSION_TYPE, "LVS_VERSION", w - 7, h - 14, Col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
			end
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
--addons/ssrp_lfs/lua/lvs_framework/autorun/lvs_convar.lua:
-- 2022 and i still havent bothered creating a system that does this automatically
if SERVER then
	return
end

CreateClientConVar( "lvs_edit_hud", 1, true, false)
CreateClientConVar( "lvs_mouseaim", 0, true, true)
CreateClientConVar( "lvs_sensitivity_x", 1, true, true)
CreateClientConVar( "lvs_sensitivity_y", 1, true, true)
CreateClientConVar( "lvs_return_delta", 1, true, true)

LVS.cvarCamFocus = CreateClientConVar( "lvs_camerafocus", 0, true, false)

local cvarShowIdent = CreateClientConVar( "lvs_show_identifier", 1, true, false)
LVS.ShowIdent = cvarShowIdent and cvarShowIdent:GetBool() or true
cvars.AddChangeCallback( "lvs_show_identifier", function( convar, oldValue, newValue )
	LVS.ShowIdent = tonumber( newValue ) ~=0
end)

local cvarHitMarker = CreateClientConVar( "lvs_hitmarker", 1, true, false)
LVS.ShowHitMarker = cvarHitMarker and cvarHitMarker:GetBool() or false
cvars.AddChangeCallback( "lvs_hitmarker", function( convar, oldValue, newValue )
	LVS.ShowHitMarker = tonumber( newValue ) ~=0
end)

--addons/ssrp_lfs/lua/lvs_framework/autorun/lvs_defaultweapons.lua:
LVS:AddWeaponPreset( "LMG", {
	Icon = Material("lvs/weapons/mg.png"),
	Ammo = 1000,
	Delay = 0.1,
	Attack = function( ent )
		ent.MirrorPrimary = not ent.MirrorPrimary

		local Mirror = ent.MirrorPrimary and -1 or 1

		local Pos = ent:LocalToWorld( ent.PosLMG and Vector(ent.PosLMG.x,ent.PosLMG.y * Mirror,ent.PosLMG.z) or Vector(0,0,0) )
		local Dir = ent.DirLMG or 0

		local effectdata = EffectData()
		effectdata:SetOrigin( Pos )
		effectdata:SetNormal( ent:GetForward() )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		local bullet = {}
		bullet.Src =  Pos
		bullet.Dir = ent:LocalToWorldAngles( Angle(0,-Dir * Mirror,0) ):Forward()
		bullet.Spread 	= Vector( 0.015,  0.015, 0 )
		bullet.TracerName = "lvs_tracer_white"
		bullet.Force	= 10
		bullet.HullSize 	= 50
		bullet.Damage	= 10
		bullet.Velocity = 30000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo) end
		ent:LVSFireBullet( bullet )

		ent:TakeAmmo()
	end,
	StartAttack = function( ent )
		if not IsValid( ent.SoundEmitter1 ) then
			ent.SoundEmitter1 = ent:AddSoundEmitter( Vector(109.29,0,92.85), "lvs/weapons/mg_light_loop.wav", "lvs/weapons/mg_light_loop_interior.wav" )
			ent.SoundEmitter1:SetSoundLevel( 95 )
		end

		ent.SoundEmitter1:Play()
	end,
	FinishAttack = function( ent )
		if IsValid( ent.SoundEmitter1 ) then
			ent.SoundEmitter1:Stop()
		end
	end,
	OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end,
	OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end,
} )

LVS:AddWeaponPreset( "TABLE_POINT_MG", {
	Icon = Material("lvs/weapons/bullet.png"),
	Ammo = 2000,
	Delay = 0.1,
	Attack = function( ent )
		if not ent.PosTPMG or not ent.DirTPMG then return end

		for i = 1, 2 do
			ent._NumTPMG = ent._NumTPMG and ent._NumTPMG + 1 or 1

			if ent._NumTPMG > #ent.PosTPMG then ent._NumTPMG = 1 end

			local Pos = ent:LocalToWorld( ent.PosTPMG[ ent._NumTPMG ] )
			local Dir = ent.DirTPMG[ ent._NumTPMG ]

			local effectdata = EffectData()
			effectdata:SetOrigin( Pos )
			effectdata:SetNormal( ent:GetForward() )
			effectdata:SetEntity( ent )
			util.Effect( "lvs_muzzle", effectdata )

			local bullet = {}
			bullet.Src = Pos
			bullet.Dir = ent:LocalToWorldAngles( Angle(0,-Dir,0) ):Forward()
			bullet.Spread 	= Vector( 0.035,  0.035, 0 )
			bullet.TracerName = "lvs_tracer_yellow"
			bullet.Force	= 10
			bullet.HullSize 	= 25
			bullet.Damage	= 10
			bullet.Velocity = 40000
			bullet.Attacker 	= ent:GetDriver()
			bullet.Callback = function(att, tr, dmginfo) end
			ent:LVSFireBullet( bullet )
		end

		ent:TakeAmmo( 2 )
	end,
	StartAttack = function( ent )
		if not IsValid( ent.SoundEmitter1 ) then
			ent.SoundEmitter1 = ent:AddSoundEmitter( Vector(109.29,0,92.85), "lvs/weapons/mg_light_loop.wav", "lvs/weapons/mg_light_loop_interior.wav" )
			ent.SoundEmitter1:SetSoundLevel( 95 )
		end

		ent.SoundEmitter1:Play()
	end,
	FinishAttack = function( ent )
		if IsValid( ent.SoundEmitter1 ) then
			ent.SoundEmitter1:Stop()
		end
	end,
	OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end,
	OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end,
} )

LVS:AddWeaponPreset( "HMG", {
	Icon = Material("lvs/weapons/hmg.png"),
	Ammo = 300,
	Delay = 0.14,
	Attack = function( ent )
		ent.MirrorSecondary = not ent.MirrorSecondary

		local Mirror = ent.MirrorSecondary and -1 or 1

		local Pos = ent:LocalToWorld( ent.PosHMG and Vector(ent.PosHMG.x,ent.PosHMG.y * Mirror,ent.PosHMG.z) or Vector(0,0,0) )
		local Dir = ent.DirHMG or 0.5

		local effectdata = EffectData()
		effectdata:SetOrigin( Pos )
		effectdata:SetNormal( ent:GetForward() )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		local bullet = {}
		bullet.Src = Pos
		bullet.Dir = ent:LocalToWorldAngles( Angle(0,-Dir * Mirror,0) ):Forward()
		bullet.Spread 	= Vector( 0.04,  0.04, 0 )
		bullet.TracerName = "lvs_tracer_orange"
		bullet.Force	= 50
		bullet.HullSize 	= 15
		bullet.Damage	= 25
		bullet.SplashDamage = 75
		bullet.SplashDamageRadius = 200
		bullet.Velocity = 12000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
		end
		ent:LVSFireBullet( bullet )

		ent:TakeAmmo()
	end,
	StartAttack = function( ent )
		if not IsValid( ent.SoundEmitter2 ) then
			ent.SoundEmitter2 = ent:AddSoundEmitter( Vector(109.29,0,92.85), "lvs/weapons/mg_heavy_loop.wav", "lvs/weapons/mg_heavy_loop.wav" )
			ent.SoundEmitter2:SetSoundLevel( 95 )
		end

		ent.SoundEmitter2:Play()
	end,
	FinishAttack = function( ent )
		if IsValid( ent.SoundEmitter2 ) then
			ent.SoundEmitter2:Stop()
		end
		ent:EmitSound("lvs/weapons/mg_heavy_lastshot.wav", 95 )
	end,
	OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft2.wav") end,
	OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end,
} )

LVS:AddWeaponPreset( "TURBO", {
	Icon = Material("lvs/weapons/nos.png"),
	HeatRateUp = 0.1,
	HeatRateDown = 0.1,
	UseableByAI = false,
	Attack = function( ent )
		local PhysObj = ent:GetPhysicsObject()
		if not IsValid( PhysObj ) then return end
		local THR = ent:GetThrottle()
		local FT = FrameTime()

		local Vel = ent:GetVelocity():Length()

		PhysObj:ApplyForceCenter( ent:GetForward() * math.Clamp(ent.MaxVelocity + 500 - Vel,0,1) * PhysObj:GetMass() * THR * FT * 150 ) -- increase speed
		PhysObj:AddAngleVelocity( PhysObj:GetAngleVelocity() * FT * 0.5 * THR ) -- increase turn rate
	end,
	StartAttack = function( ent )
		ent.TargetThrottle = 1.3
		ent:EmitSound("lvs/vehicles/generic/boost.wav")
	end,
	FinishAttack = function( ent )
		ent.TargetThrottle = 1
	end,
	OnSelect = function( ent )
		ent:EmitSound("buttons/lever5.wav")
	end,
	OnThink = function( ent, active )
		if not ent.TargetThrottle then return end

		local Rate = FrameTime() * 0.5

		ent:SetMaxThrottle( ent:GetMaxThrottle() + math.Clamp(ent.TargetThrottle - ent:GetMaxThrottle(),-Rate,Rate) )

		local MaxThrottle = ent:GetMaxThrottle()

		ent:SetThrottle( MaxThrottle )

		if MaxThrottle == ent.TargetThrottle then
			ent.TargetThrottle = nil
		end
	end,
	OnOverheat = function( ent ) ent:EmitSound("lvs/overheat_boost.wav") end,
} )
--addons/!lpakr_out/lua/pac3/libraries/resource.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/libraries/animations.lua:
local a=pac.animations||{}a.playing={}a.playing=a.playing||{}a.registered=a.registered||{}do local b={[0]="gesture",[1]="posture",[2]="stance",[3]="sequence"}local c={[0]="linear",[1]="cosine",[1]="cubic"}function a.ConvertOldData(d)if tonumber(d.Type)then d.Type=tonumber(d.Type)end;if tonumber(d.Interpolation)then d.Interpolation=tonumber(d.Interpolation)end;if isnumber(d.Type)then d.Type=b[d.Type]end;if isnumber(d.Interpolation)then d.Interpolation=c[d.Interpolation]end;d.Type=d.Type||"sequence"d.Interpolation=d.Interpolation||"cosine"end end;a.eases={}local e=a.eases;do local f=1.70158;local g=f+1;local h=f*1.525;local i=2*math.pi/3;local j=2*math.pi/4.5;local k=7.5625;local l=2.75;local m=math.pi;local n=math.cos;local o=math.sin;local p=math.sqrt;e.InSine=function(q)return 1-n(q*m/2)end;e.OutSine=function(q)return o(q*m/2)end;e.InOutSine=function(q)return-(n(m*q)-1)/2 end;e.InQuad=function(q)return q^2 end;e.OutQuad=function(q)return 1-(1-q)*(1-q)end;e.InOutQuad=function(q)return q<0.5&&2*q^2||1-(-2*q+2)^2/2 end;e.InCubic=function(q)return q^3 end;e.OutCubic=function(q)return 1-(1-q)^3 end;e.InOutCubic=function(q)return q<0.5&&4*q^3||1-(-2*q+2)^3/2 end;e.InQuart=function(q)return q^4 end;e.OutQuart=function(q)return 1-(1-q)^4 end;e.InOutQuart=function(q)return q<0.5&&8*q^4||1-(-2*q+2)^4/2 end;e.InQuint=function(q)return q^5 end;e.OutQuint=function(q)return 1-(1-q)^5 end;e.InOutQuint=function(q)return q<0.5&&16*q^5||1-(-2*q+2)^5/2 end;e.InExpo=function(q)return q==0&&0||2^(10*q-10)end;e.OutExpo=function(q)return q==1&&1||1-2^(-10*q)end;e.InOutExpo=function(q)return q==0&&0||q==1&&1||q<0.5&&2^(20*q-10)/2||(2-2^(-20*q+10))/2 end;e.InCirc=function(q)return 1-p(1-q^2)end;e.OutCirc=function(q)return p(1-(q-1)^2)end;e.InOutCirc=function(q)return q<0.5&&(1-p(1-(2*q)^2))/2||(p(1-(-2*q+2)^2)+1)/2 end;e.InBack=function(q)return g*q^3-f*q^2 end;e.OutBack=function(q)return 1+g*(q-1)^3+f*(q-1)^2 end;e.InOutBack=function(q)return q<0.5&&(2*q)^2*((h+1)*2*q-h)/2||((2*q-2)^2*((h+1)*(q*2-2)+h)+2)/2 end;e.InElastic=function(q)return q==0&&0||q==1&&1||-2^(10*q-10)*o((q*10-10.75)*i)end;e.OutElastic=function(q)return q==0&&0||q==1&&1||2^(-10*q)*o((q*10-0.75)*i)+1 end;e.InOutElastic=function(q)return q==0&&0||q==1&&1||q<0.5&&-(2^(20*q-10)*o((20*q-11.125)*j))/2||2^(-20*q+10)*o((20*q-11.125)*j)/2+1 end;e.InBounce=function(q)return 1-e.OutBounce(1-q)end;e.OutBounce=function(q)if q<1/l then return k*q^2 elseif q<2/l then q=q-1.5/l;return k*q^2+0.75 elseif q<2.5/l then q=q-2.25/l;return k*q^2+0.9375 else q=q-2.625/l;return k*q^2+0.984375 end end;e.InOutBounce=function(q)return q<0.5&&(1-e.OutBounce(1-2*q))/2||(1+e.OutBounce(2*q-1))/2 end end;function a.GetRegisteredAnimations()return a.registered end;function a.RegisterAnimation(r,s)if s&&s.FrameData then local t={}for u,v in ipairs(s.FrameData)do for w,x in pairs(v.BoneInfo)do t[w]=(t[w]||0)+1;x.MU=x.MU||0;x.MF=x.MF||0;x.MR=x.MR||0;x.RU=x.RU||0;x.RF=x.RF||0;x.RR=x.RR||0 end end;if#s.FrameData>1 then for y in pairs(t)do for u,v in ipairs(s.FrameData)do if!v.BoneInfo[y]then v.BoneInfo[y]={MU=0,MF=0,MR=0,RU=0,RF=0,RR=0}end end end end end;a.registered[r]=s;do return end;for u,z in ipairs(a.playing)do if z.pac_animations&&z.pac_animations[r]then local A,B=a.GetEntityAnimationFrame(z,r)a.ResetEntityAnimation(z,r)a.SetEntityAnimationFrame(z,r,A,B)end end end;local function C(D,E)if D.Paused then return end;if D.TimeScale==0 then local F=#D.FrameData;local G=D.Offset;local H=D.RestartFrame||1;G=Lerp(G%1,H,F+1)D.Frame=math.floor(G)D.FrameDelta=G%1;return true end;D.FrameDelta=D.FrameDelta+FrameTime()*E.FrameRate*D.TimeScale;if D.FrameDelta>1 then D.Frame=D.Frame+1;D.FrameDelta=math.min(1,D.FrameDelta-1)if D.Frame>#D.FrameData then D.Frame=math.min(D.RestartFrame||1,#D.FrameData)return true end end;return false end;local function I(J,K,L)local M=(1-math.cos(L*math.pi))/2;return J*(1-M)+K*M end;local function N(O,J,K,P,L)local M=L*L;local Q=P-K-O+J;return Q*L*M+(O-J-Q)*M+(K-O)*L+J end;local R={MU=0,MR=0,MF=0,RU=0,RR=0,RF=0}local function S(z,D,T,w)local U=D.FrameData[T]if U then return U.BoneInfo[w]||U.BoneInfo[z:GetBoneName(w)]||R end;return R end;local function V(z)for r,W in pairs(z.pac_animations)do local A=W.Frame;local X=W.FrameData[A]local Y=W.FrameDelta;local Z=W.DieTime;local _=W.Power;if Z&&Z-0.125<=CurTime()then _=_*(Z-CurTime())/0.125 end;if Z&&Z<=CurTime()then a.StopEntityAnimation(z,r)elseif!W.PreCallback||!W.PreCallback(z,r,W,A,X,Y)then if W.ShouldPlay&&!W.ShouldPlay(z,r,W,A,X,Y,_)then a.StopEntityAnimation(z,r,0.2)end;if W.Type=="gesture"then if C(W,X)then a.StopEntityAnimation(z,r)end elseif W.Type=="posture"then if Y<1&&W.TimeToArrive then Y=math.min(1,Y+FrameTime()*1/W.TimeToArrive)W.FrameDelta=Y end else C(W,X)end end end;a.ResetEntityBoneMatrix(z)if!z.pac_animations then return end;local a0={}for u,W in pairs(z.pac_animations)do local a1=W.Frame;local E=W.FrameData[a1]local a2=W.FrameDelta;local a3=W.DieTime;local a4=W.Power;if a3&&a3-0.125<=CurTime()then a4=a4*(a3-CurTime())/0.125 end;local a5=a4*a2;for w,a6 in pairs(E.BoneInfo)do if!isnumber(w)then w=z:LookupBone(w)end;if!w then goto a7 end;if!a0[w]then a0[w]=Matrix()end;local a8=a0[w]local a9,aa=a8:GetTranslation(),a8:GetAngles()if!a6.Callback||!a6.Callback(z,a8,w,a9,aa,a2,a4)then local ab=aa:Up()local ac=aa:Right()local ad=aa:Forward()local ae=W.Interpolation;if ae=="linear"then if W.Type=="posture"then a8:Translate((a6.MU*ab+a6.MR*ac+a6.MF*ad)*a5)a8:Rotate(Angle(a6.RR,a6.RU,a6.RF)*a5)else local af=S(z,W,a1-1,w)if E["EaseStyle"]then local ag=E["EaseStyle"]a8:Translate(LerpVector(e[ag](a2),af.MU*ab+af.MR*ac+af.MF*ad,a6.MU*ab+a6.MR*ac+a6.MF*ad)*a4)a8:Rotate(LerpAngle(e[ag](a2),Angle(af.RR,af.RU,af.RF),Angle(a6.RR,a6.RU,a6.RF))*a4)else a8:Translate(LerpVector(a2,af.MU*ab+af.MR*ac+af.MF*ad,a6.MU*ab+a6.MR*ac+a6.MF*ad)*a4)a8:Rotate(LerpAngle(a2,Angle(af.RR,af.RU,af.RF),Angle(a6.RR,a6.RU,a6.RF))*a4)end end elseif ae=="cubic"&&W.FrameData[a1-2]&&W.FrameData[a1+1]then local ah=S(z,W,a1-2,w)local af=S(z,W,a1-1,w)local ai=S(z,W,a1+1,w)a8:Translate(I(af.MU*ab+af.MR*ac+af.MF*ad,a6.MU*ab+a6.MR*ac+a6.MF*ad,a2)*a4)a8:Rotate(N(Angle(ah.RR,ah.RU,ah.RF),Angle(af.RR,af.RU,af.RF),Angle(a6.RR,a6.RU,a6.RF),Angle(ai.RR,ai.RU,ai.RF),a2)*a4)elseif ae=="none"then a8:Translate(a6.MU*ab+a6.MR*ac+a6.MF*ad)a8:Rotate(Angle(a6.RR,a6.RU,a6.RF))else local af=S(z,W,a1-1,w)a8:Translate(I(af.MU*ab+af.MR*ac+af.MF*ad,a6.MU*ab+a6.MR*ac+a6.MF*ad,a2)*a4)a8:Rotate(I(Angle(af.RR,af.RU,af.RF),Angle(a6.RR,a6.RU,a6.RF),a2)*a4)end end::a7::end end;for w,aj in pairs(a0)do pac.SetEntityBoneMatrix(z,w,aj)end end;function a.ResetEntityBoneMatrix(z)for ak=0,z:GetBoneCount()-1 do pac.ResetEntityBoneMatrix(z,ak)end end;function a.ResetEntityAnimation(z,r,a3,a4,al)local am=a.registered[r]if am then z.pac_animations=z.pac_animations||{}local an=0;if am.Type=="posture"&&!am.TimeToArrive then an=1 end;z.pac_animations[r]={Frame=am.StartFrame||1,Offset=0,FrameDelta=an,FrameData=am.FrameData,TimeScale=al||am.TimeScale||1,Type=am.Type,RestartFrame=am.RestartFrame,TimeToArrive=am.TimeToArrive,ShouldPlay=am.ShouldPlay,Power=a4||am.Power||1,DieTime=a3||am.DieTime,Group=am.Group,UseReferencePose=am.UseReferencePose,Interpolation=am.Interpolation}a.ResetEntityAnimationProperties(z)for ak,ao in ipairs(a.playing)do if ao==z then table.remove(a.playing,ak)break end end;z:CallOnRemove("pac_animations",function()for ak,ao in ipairs(a.playing)do if ao==z then table.remove(a.playing,ak)break end end end)table.insert(a.playing,z)end end;function a.SetEntityAnimation(z,r,a3,a4,al)if z.pac_animations&&z.pac_animations[r]then return end;a.ResetEntityAnimation(z,r,a3,a4,al)end;function a.GetEntityAnimation(z,r)if z.pac_animations&&z.pac_animations[r]then return z.pac_animations[r]end end;function a.SetEntityAnimationFrame(z,r,ap,B)if z.pac_animations&&z.pac_animations[r]then local d=z.pac_animations[r]ap=math.ceil(ap)ap=math.Clamp(ap,1,#d.FrameData)d.Frame=ap;d.FrameDelta=B&&math.Clamp(B,0,1)||0 end end;function a.GetEntityAnimationFrame(z,r)if z.pac_animations&&z.pac_animations[r]then local d=z.pac_animations[r]return d.Frame,d.FrameDelta end end;function a.SetEntityAnimationCycle(z,r,ap)if z.pac_animations&&z.pac_animations[r]then local d=z.pac_animations[r]local aq=a.GetAnimationDuration(z,r)ap=ap%1;ap=ap*aq;local ar=0;for ak=1,#d.FrameData do local as=1/d.FrameData[ak].FrameRate;if ar+as>=ap then d.Frame=ak;d.FrameDelta=math.Clamp((ap-ar)/as,0,1)break end;ar=ar+as end end end;function a.GetEntityAnimationCycle(z,r)if z.pac_animations&&z.pac_animations[r]then local d=z.pac_animations[r]local ar=0;for ak=1,d.Frame-1 do local as=1/d.FrameData[ak].FrameRate;ar=ar+as end;ar=Lerp(d.FrameDelta,ar,ar+1/d.FrameData[d.Frame].FrameRate)return ar/a.GetAnimationDuration(z,r)end end;function a.GetAnimationDuration(z,r)if z.pac_animations&&z.pac_animations[r]then local at=0;for ak=1,#z.pac_animations[r].FrameData do local ao=z.pac_animations[r].FrameData[ak]at=at+1/(ao.FrameRate||1)end;return at end;return 0 end;local function au(z)if z.pac_animations then for u,W in pairs(z.pac_animations)do if W.Type=="sequence"&&(!W.DieTime||CurTime()<W.DieTime-0.125)||W.UseReferencePose then z.pac_animations_insequence=true;return end end;z.pac_animations_insequence=nil end end;pac.AddHook("CalcMainActivity","animations_reset_sequence",function(z)if z.pac_animations_insequence then au(z)return 0,0 end end)function a.ResetEntityAnimationProperties(z)local av=z.pac_animations;if av&&table.Count(av)>0 then z:SetIK(false)au(z)else z.pac_animations=nil;z.pac_animations_insequence=nil;z:RemoveCallOnRemove("pac_animations")for ak,ao in ipairs(a.playing)do if ao==z then table.remove(a.playing,ak)end end end end;function a.StopEntityAnimation(z,r,aw)local av=z.pac_animations;if av&&av[r]then if aw then if av[r].DieTime then av[r].DieTime=math.min(av[r].DieTime,CurTime()+aw)else av[r].DieTime=CurTime()+aw end else av[r]=nil end;a.ResetEntityAnimationProperties(z)end end;function a.StopAllEntityAnimations(z,aw)if z.pac_animations then for r in pairs(z.pac_animations)do a.StopEntityAnimation(z,r,aw)end end end;hook.Add("Think","pac_custom_animations",function()for ak,ao in ipairs(a.playing)do if ao.pac_animations then V(ao)end end end)return a
--addons/!lpakr_out/lua/pac3/core/shared/init.lua:
include("util.lua")include("footsteps_fix.lua")include("http.lua")include("movement.lua")include("entity_mutator.lua")include("hash.lua")pac.StringStream=include("pac3/libraries/string_stream.lua")CreateConVar("pac_sv_draw_distance",0,CLIENT&&FCVAR_REPLICATED||bit.bor(FCVAR_REPLICATED,FCVAR_ARCHIVE))do local a={'weapon_unusual_isotope.pcf','blood_fx.pcf','boomer_fx.pcf','charger_fx.pcf','default.pcf','electrical_fx.pcf','environmental_fx.pcf','fire_01l4d.pcf','fire_fx.pcf','fire_infected_fx.pcf','firework_crate_fx.pcf','fireworks_fx.pcf','footstep_fx.pcf','gen_dest_fx.pcf','hunter_fx.pcf','infected_fx.pcf','insect_fx.pcf','item_fx.pcf','locator_fx.pcf','military_artillery_impacts.pcf','rain_fx.pcf','rain_storm_fx.pcf','rope_fx.pcf','screen_fx.pcf','smoker_fx.pcf','speechbubbles.pcf','spitter_fx.pcf','steam_fx.pcf','steamworks.pcf','survivor_fx.pcf','tank_fx.pcf','tanker_explosion.pcf','test_collision.pcf','test_distancealpha.pcf','ui_fx.pcf','vehicle_fx.pcf','water_fx.pcf','weapon_fx.pcf','witch_fx.pcf'}pac.BlacklistedParticleSystems={}for b,c in ipairs(a)do pac.BlacklistedParticleSystems[c]=true end end
--addons/!lpakr_out/lua/pac3/core/shared/entity_mutators/model.lua:
local a={}a.ClassName="model"a.UpdateRate=0.25;function a:WriteArguments(b)assert(isstring(b),"path must be a string")net.WriteString(b)end;function a:ReadArguments()return net.ReadString()end;function a:Update(c)if!self.actual_model||!IsValid(self.Entity)then return end;if self.Entity:GetModel():lower()!=self.actual_model:lower()then self.Entity:SetModel(self.actual_model)end end;function a:StoreState()return self.Entity:GetModel()end;function a:Mutate(b)if b:find("^http")then if SERVER&&pac.debug then if self.Owner:IsPlayer()then pac.Message(self.Owner," wants to use ",b," as model on ",ent)end end;local d=tostring(self.Entity)pac.DownloadMDL(b,function(e)if!self.Entity:IsValid()then pac.Message("cannot set model ",e," on ",d,': entity became invalid')return end;if SERVER&&pac.debug then pac.Message(e," downloaded for ",ent,': ',b)end;self.Entity:SetModel(e)self.actual_model=e end,function(f)pac.Message(f)end,self.Owner)else if b:EndsWith(".mdl")then self.Entity:SetModel(b)if self.Owner:IsPlayer()&&b:lower()!=self.Entity:GetModel():lower()then self.Owner:ChatPrint('[PAC3] ERROR: '..b.." is not a valid model on the server.")else self.actual_model=b end else local g=player_manager.TranslatePlayerModel(b)self.Entity:SetModel(g)self.actual_model=g end end end;pac.emut.Register(a)
--addons/!lpakr_out/lua/pac3/core/shared/entity_mutators/size.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/hooks.lua:
local pairs=pairs;local IsEntity=IsEntity;local next=next;pac.AddHook("RenderScene","eyeangles_eyepos",function(a,b)pac.EyePos=a;pac.EyeAng=b end)pac.AddHook("DrawPhysgunBeam","physgun_event",function(c,d,e,f,g,h)if e then c.pac_drawphysgun_event={c,d,e,f,g,h}else c.pac_drawphysgun_event=nil end;local i=c.pac_drawphysgun_event_part;if i then for j in pairs(i)do if j:IsValid()then j:OnThink()else i[j]=nil end end end;if c.pac_hide_physgun_beam then return false end end)do pac.AddHook("UpdateAnimation","event_part",function(c)if!IsEntity(c)||!c:IsValid()then return end;if c.pac_death_physics_parts&&c:Alive()&&c.pac_physics_died then pac.CallRecursiveOnOwnedParts(c,"OnBecomePhysics")c.pac_physics_died=false end;do local k=c.pac_pose_params;if k then for l,m in pairs(k)do c:SetPoseParameter(m.key,m.val)end end end;local n=1;if c.pac_global_animation_rate&&c.pac_global_animation_rate!=1 then if c.pac_global_animation_rate==0 then n=c:GetModelScale()*2 elseif c.pac_global_animation_rate!=1 then c:SetCycle(pac.RealTime*c.pac_global_animation_rate%1)n=c.pac_global_animation_rate end end;if c.pac_animation_sequences then local o,p=next(c.pac_animation_sequences)if o&&o:IsValid()then if o.OwnerCycle then if o.Rate==0 then n=1;c:SetCycle(o.Offset%1)else n=n*o.Rate end end elseif o&&!o:IsValid()then c.pac_animation_sequences[o]=nil end end;if n!=1 then c:SetCycle(pac.RealTime*n%1)return true end;if c.pac_holdtype_alternative_animation_rate then local q=c:GetVelocity():Dot(c:EyeAngles():Forward())>0&&1||-1;local r=c:GetModelScale()*2;if r!=0 then c:SetCycle(pac.RealTime/r*q)else c:SetCycle(0)end;return true end;local s=c:GetVehicle()if c.pac_last_vehicle!=s then if c.pac_last_vehicle!=nil then pac.CallRecursiveOnAllParts("OnVehicleChanged",c,s)end;c.pac_last_vehicle=s end end)end;local MOVETYPE_NOCLIP=MOVETYPE_NOCLIP;pac.AddHook("TranslateActivity","events",function(c,t)if IsEntity(c)&&c:IsValid()then if c.pac_animation_sequences&&next(c.pac_animation_sequences)then return end;if c.pac_animation_holdtypes then local u,v=next(c.pac_animation_holdtypes)if u then if!v.part:IsValid()then c.pac_animation_holdtypes[u]=nil else return v[t]end end end;if c.pac_holdtypes then local u,w=next(c.pac_holdtypes)if u then if!w.part:IsValid()then c.pac_holdtypes[u]=nil else if w[t]&&w[t]!=-1 then return w[t]end;if c:GetVehicle():IsValid()&&c:GetVehicle():GetClass()=="prop_vehicle_prisoner_pod"then return w.sitting end;if w.noclip!=-1&&c:GetMoveType()==MOVETYPE_NOCLIP then return w.noclip end;if w.air!=-1&&c:GetMoveType()!=MOVETYPE_NOCLIP&&!c:IsOnGround()then return w.air end;if w.fallback!=-1 then return w.fallback end end end end end end)pac.AddHook("CalcMainActivity","events",function(c,t)if IsEntity(c)&&c:IsValid()&&c.pac_animation_sequences then local u,v=next(c.pac_animation_sequences)if!u then return end;if!v.part:IsValid()then c.pac_animation_sequences[u]=nil;return end;return v.seq,v.seq end end)pac.AddHook("pac_PlayerFootstep","events",function(c,a,x,y)c.pac_last_footstep_pos=a;if c.pac_footstep_override then for l,o in pairs(c.pac_footstep_override)do if!o:IsHidden()then o:PlaySound(x,y)end end end;if c.pac_mute_footsteps then return true end end)net.Receive("pac_effect_precached",function()local z=net.ReadString()pac.CallHook("EffectPrecached",z)end)
--addons/!lpakr_out/lua/pac3/core/client/parts/link.lua:
local a,b=pac.PartTemplate("base")b.ClassName="link"b.Group='advanced'b.Icon='icon16/weather_clouds.png'local function c(d)if!d:IsValid()then return end;local e={}for f,g in pairs(d:GetProperties())do if g.key=="UniqueID"then goto h end;local i=type(g.get())if i=="number"||i=="Vector"||i=="Angle"||i=="boolean"then e[g.key]=g.key end::h::end;return e end;a:StartStorableVars()a:GetSetPart("From")a:GetSetPart("To")a:GetSet("Type","from -> to",{enums={"from -> to","to -< from","from <-> to"}})a:GetSet("FromVariableName","",{enums=function(self)return c(self:GetFrom())end})a:GetSet("ToVariableName","",{enums=function(self)return c(self:GetTo())end})a:EndStorableVars()local function j(k,l,m,n,o)if!k["Get"..m]||!k["Set"..m]then return end;if!l["Get"..n]||!l["Set"..n]then return end end;function b:SetFrom(p)self.From=p;if self.FromVariableName==""then return end;if!p:IsValid()then return end;if!p["Set"..self.FromVariableName]then return end;local q=p["Set"..self.FromVariableName]local r=p["Get"..self.FromVariableName]p["Set"..self.FromVariableName]=function(s,t)q(s,t)local u=self:GetTo()if self.ToVariableName==""then return end;if!u:IsValid()then return end;local v=u["Set"..self.FromVariableName]if!v then return end;v(u,r(p))end end;a:Register()
--addons/!lpakr_out/lua/pac3/libraries/shader_params.lua:
return{shaders={eyerefract={generic={lightwarptexture={type="texture",friendly="LightWarpTexture",description="1D ramp texture for tinting scalar diffuse term"},warpparam={type="float",default=0,friendly="WarpParam",description="animation param between 0 and 1"},entityorigin={type="vec3",default=Vector(0,0,0),friendly="EntityOrigin",description="center if the model in world space"},corneatexture={type="texture",description="cornea texture",default="Engine/eye-cornea"},ambientoccltexture={type="texture",description="reflection texture",default="Engine/eye-extra"},ambientocclcolor={type="vec3",description="Ambient occlusion color",default=Vector(0.33,0.33,0.33)}},eye={intro={friendly="Episode1Intro",description="center if the model in world space",type="bool",default=false},eyeballradius={type="float",description="Requires $raytracesphere 1. Radius of the eyeball. Should be the diameter of the eyeball divided by 2.",default=0.5,friendly="EyeballRadius"},raytracesphere={type="bool",description="Enables sphere raytracing. Each pixel is raytraced to allow sharper angles to look more accurate.",default=true,friendly="RayTraceSphere"},spheretexkillcombo={type="bool",description="Requires $raytracesphere 1. Causes pixels which don't hit the raytraced sphere to be transparent",default=false,friendly="SphereTexkillCombo"},eyeorigin={type="vec3",description="origin for the eyes",default=Vector(0,0,0),friendly="EyeOrigin"},iris={type="texture",description="iris texture",default="engine/eye-iris-green",friendly="Iris"},irisframe={type="integer",description="frame for the iris texture",default=0,friendly="IrisFrame",linked="iris"},dilation={type="float",description="Pupil dilation (0 is none, 1 is maximal)",default=0.5,friendly="Dilation"},irisu={type="vec4",description="U projection vector for the iris",default="[0 1 0 0 ]",friendly="IrisU"},irisv={type="vec4",description="V projection vector for the iris",default="[0 0 1 0]",friendly="IrisV"},parallaxstrength={type="float",description="Parallax strength",default=0.25,friendly="ParallaxStrength"},corneabumpstrength={type="float",description="Cornea strength",default=1,friendly="CorneaBumpStrength"},halflambert={type="bool",description="Enables half-lambertian lighting.",default=1,friendly="HalfLambert"},glossiness={type="float",description="The opacity of the cubemap reflection.",default=0.5,friendly="Glossiness"}},cloak={cloakpassenabled={friendly="Enable",type="bool",description="Enables cloak render in a second pass",default=false},cloakfactor={friendly="Factor",type="float",description="",default=0},cloakcolortint={friendly="ColorTint",type="color",description="Cloak color tint",default=Vector(1,1,1)},refractamount={type="float",friendly="RefractAmount",default=0.5,description="How strong the refraction effect should be when the material is partially cloaked (default = 2)."}},["environment map"]={envmap={type="texture",friendly="Envmap",description="Enables cubemap reflections.",default="Engine/eye-reflection-cubemap-",partial_hdr=true}}},vertexlitgeneric={wrinkle={compress={type="texture",friendly="Compress",description="compression wrinklemap"},bumpcompress={type="texture",friendly="BumpCompress",description="compression bump map"},bumpstretch={type="texture",friendly="BumpStretch",description="expansion bump map"},stretch={type="texture",friendly="Stretch",description="expansion wrinklemap"}},["sheen map"]={sheenmapmaskoffsetx={type="float",description="X Offset of the mask relative to model space coords of target",default=0,friendly="MaskOffsetX"},sheenindex={type="integer",description="Index of the Effect Type (Color Additive, Override etc...)",default=0,friendly="Index"},sheenmaptint={type="color",description="sheenmap tint",friendly="Tint"},sheenmapmaskoffsety={type="float",description="Y Offset of the mask relative to model space coords of target",default=0,friendly="MaskOffsetY"},sheenpassenabled={type="bool",description="Enables weapon sheen render in a second pass",default=false,friendly="Enable"},sheenmapmask={type="texture",description="sheenmap mask",friendly="Mask"},sheenmapmaskscalex={type="float",description="X Scale the size of the map mask to the size of the target",default=1,friendly="MaskScaleX"},sheenmapmaskscaley={type="float",description="Y Scale the size of the map mask to the size of the target",default=1,friendly="MaskScaleY"},sheenmap={type="texture",description="sheenmap"},sheenmapmaskframe={type="integer",description="",default=0,friendly="MaskFrame",linked="sheenmap"},sheenmapmaskdirection={type="integer",description="The direction the sheen should move (length direction of weapon) XYZ, 0,1,2",default=0,friendly="Direction"}},["rim lighting"]={rimlightboost={type="float",friendly="Boost",default=0,description="Boost for rim lights"},rimmask={type="bool",friendly="ExponentAlphaMask",default=false,description="Indicates whether or not to use alpha channel of exponent texture to mask the rim term"},rimlight={type="bool",default=false,description="enables rim lighting",friendly="Enable"},rimlightexponent={type="float",friendly="Exponent",default=0,description="Exponent for rim lights"}},phong={albedo={type="texture",friendly="Albedo",description="albedo (Base texture with no baked lighting)"},basemapalphaphongmask={type="bool",friendly="BaseMapAlphaPhongMask",default=false,description="indicates that there is no normal map and that the phong mask is in base alpha"},invertphongmask={type="bool",friendly="InvertPhongMask",default=false,description="invert the phong mask (0=full phong, 1=no phong)"},phongexponenttexture={type="texture",friendly="Exponent",description="Phong Exponent map"},phongwarptexture={type="texture",friendly="Warp",description="warp the specular term"}},flesh={fleshcubetexture={type="texture",friendly="CubeTexture",description="Flesh cubemap texture"},flesheffectcenterradius3={type="vec4",friendly="EffectCenterRadius3",default="[ 0 0 0 0 ]",description="Flesh effect center and radius"},fleshglossbrightness={type="float",friendly="GlossBrightness",default=0,description="Flesh gloss brightness"},fleshsubsurfacetint={type="color",friendly="SubsurfaceTint",default=Vector(1,1,1),description="Subsurface Color"},fleshbordersoftness={type="float",friendly="BorderSoftness",default=0,description="Flesh border softness (> 0.0 && <= 0.5)"},fleshdebugforcefleshon={type="bool",friendly="DebugForceFleshOn",default=false,description="Flesh Debug full flesh"},fleshbordertexture1d={type="texture",friendly="BorderTexture1D",description="Flesh border 1D texture"},flesheffectcenterradius1={type="vec4",friendly="EffectCenterRadius1",default="[ 0 0 0 0 ]",description="Flesh effect center and radius"},flesheffectcenterradius4={type="vec4",friendly="EffectCenterRadius4",default="[ 0 0 0 0 ]",description="Flesh effect center and radius"},fleshinteriorenabled={friendly="InteriorEnabled",type="bool",description="Enable Flesh interior blend pass",default=false},fleshbordernoisescale={type="float",friendly="BorderNoiseScale",default=0,description="Flesh Noise UV scalar for border"},fleshsubsurfacetexture={type="texture",friendly="SubsurfaceTexture",description="Flesh subsurface texture"},fleshglobalopacity={type="float",friendly="GlobalOpacity",default=0,description="Flesh global opacity"},fleshinteriortexture={type="texture",friendly="Texture",description="Flesh color texture"},fleshborderwidth={type="float",friendly="BorderWidth",default=0,description="Flesh border"},fleshbordertint={type="color",friendly="BorderTint",default=Vector(1,1,1),description="Flesh border Color"},fleshscrollspeed={type="float",friendly="ScrollSpeed",default=0,description="Flesh scroll speed"},flesheffectcenterradius2={type="vec4",friendly="EffectCenterRadius2",default="[ 0 0 0 0 ]",description="Flesh effect center and radius"},fleshinteriornoisetexture={type="texture",friendly="NoiseTexture",description="Flesh noise texture"},fleshnormaltexture={type="texture",friendly="NormalTexture",description="Flesh normal texture"}},["self illumination"]={selfillumfresnel={type="bool",friendly="Fresnel",default=false,description="Self illum fresnel"},selfillum_envmapmask_alpha={type="float",friendly="EnvMapMaskAlpha",default=0,description="defines that self illum value comes from env map mask alpha"},selfillumfresnelminmaxexp={type="vec4",friendly="FresnelMinMaxExp",default="[ 0 0 0 0 ]",description="Self illum fresnel min, max, exp"},selfillum={is_flag=true,type="integer",default=false,description="flag"},selfillummask={type="texture",friendly="Mask",description="If we bind a texture here, it overrides base alpha (if any) for self illum"},selfillumtint={type="color",friendly="Tint",default=Vector(1,1,1),description="Self-illumination tint"}},generic={color2={type="color",friendly="Color2",default=Vector(1,1,1),description="color2"},opaquetexture={is_flag=true,type="integer",friendly="OpaqueTexture",default=false,description="flag"},noalphamod={is_flag=true,type="integer",friendly="NoAlphaMod",default=false,description="flag"},znearer={is_flag=true,type="integer",friendly="Znearer",default=false,description="flag"},additive={is_flag=true,type="integer",friendly="Additive",default=false,description="flag"},nocull={is_flag=true,type="integer",friendly="NoCull",default=false,description="flag"},ignore_alpha_modulation={is_flag=true,type="integer",friendly="IgnoreAlphaModulation",default=false,description="flag"},color={type="color",friendly="Color",default=Vector(1,1,1),description="color"},no_draw={is_flag=true,type="integer",friendly="NoDraw",default=false,description="flag"},suppress_decals={is_flag=true,type="integer",friendly="SuppressDecals",default=false,description="flag"},lightwarptexture={type="texture",friendly="LightWarpTexture",description="1D ramp texture for tinting scalar diffuse term"},use_in_fillrate_mode={is_flag=true,type="integer",friendly="UseInFillrateMode",default=false,description="flag"},halflambert={is_flag=true,type="bool",friendly="HalfLambert",default=false,description="flag"},ambientonly={type="bool",friendly="AmbientOnly",default=false,description="Control drawing of non-ambient light ()"},ignorez={is_flag=true,type="integer",friendly="Ignorez",default=false,description="flag"},nofog={is_flag=true,type="integer",friendly="Nofog",default=false,description="flag"},nolod={type="bool",default=false,description="flag",friendly="NoLod"},decal={is_flag=true,type="integer",friendly="Decal",default=false,description="flag"},allowalphatocoverage={is_flag=true,type="integer",friendly="AllowAlphaToCoverage",default=false,description="flag"},model={is_flag=true,type="integer",friendly="Model",default=false,description="flag"},multipass={is_flag=true,type="integer",friendly="Multipass",default=false,description="flag"},debug={is_flag=true,type="integer",friendly="Debug",default=false,description="flag"},wireframe={is_flag=true,type="integer",friendly="Wireframe",default=false,description="flag"},translucent={is_flag=true,type="integer",friendly="Translucent",default=false,description="flag"},flat={is_flag=true,type="integer",friendly="Flat",default=false,description="flag"}},["bump map"]={bumpmap={type="texture",friendly="BumpMap",description="bump map",default="null-bumpmap"},bumpframe={type="integer",friendly="Frame",default=0,description="The frame to start an animated bump map on.",linked="bumpmap"},bumptransform={type="matrix",friendly="Transform",description="Transforms the bump map texture."},nodiffusebumplighting={type="bool",friendly="NoDiffuseLighting",default=false,description="Stops the bump map affecting the lighting of the material's albedo, which help combat overdraw. Does not affect the specular map."}},seamless={seamless_scale={type="float",friendly="Scale",default=0,description="the scale for the seamless mapping. # of repetions of texture per inch."},seamless_detail={type="bool",friendly="Detail",default=false,description="where to apply seamless mapping to the detail texture."},seamless_base={type="bool",friendly="Base",default=false,description="whether to apply seamless mapping to the base texture. requires a smooth model."}},cloak={cloakpassenabled={friendly="Enable",type="bool",description="Enables cloak render in a second pass",default=false},cloakfactor={friendly="Factor",type="float",description="",default=0},cloakcolortint={friendly="ColorTint",type="color",description="Cloak color tint",default=Vector(1,1,1)},refractamount={type="float",friendly="RefractAmount",default=0.5,description="How strong the refraction effect should be when the material is partially cloaked (default = 2)."}},blend={blendtintbybasealpha={type="bool",friendly="TintByBaseAlpha",default=false,description="Use the base alpha to blend in the $color modulation"},blendtintcoloroverbase={friendly="TintColorOverBase",type="float",description="blend between tint acting as a multiplication versus a replace",default=0}},detail={detail={type="texture",description="detail texture"},detailtint={type="color",friendly="Tint",default=Vector(1,1,1),description="detail texture tint"}},["emissive blend"]={emissiveblendstrength={type="float",friendly="Strength",default=0,description="Emissive blend strength"},emissiveblendbasetexture={type="texture",friendly="BaseTexture",description="self-illumination map"},emissiveblendenabled={friendly="Enabled",type="bool",description="Enable emissive blend pass",default=false},emissiveblendtexture={type="texture",friendly="Texture",description="self-illumination map"},emissiveblendflowtexture={type="texture",friendly="FlowTexture",description="flow map"},emissiveblendtint={type="color",friendly="Tint",default=Vector(1,1,1),description="Self-illumination tint"},emissiveblendscrollvector={type="vec2",friendly="ScrollVector",description="Emissive scroll vec",default=Vector(0,0)}}},unlitgeneric={outline={outlineend1={type="float",friendly="End1",default=0,description="outer end value for outline"},outline={type="bool",default=false,description="Enable outline for distance coded textures."},outlineend0={type="float",friendly="End0",default=0,description="inner end value for outline"},outlinestart1={type="float",friendly="Start1",default=0,description="inner start value for outline"},outlinecolor={type="color",friendly="Color",default=Vector(1,1,1),description="color of outline for distance coded images."},outlinestart0={type="float",friendly="Start0",default=0,description="outer start value for outline"},outlinealpha={type="float",friendly="Alpha",default=1,description="alpha value for outline"}},glow={glowstart={type="float",friendly="Start",default=0,description="start value for glow/shadow"},glow={type="bool",default=false,description="Enable glow/shadow for distance coded textures."},glowcolor={type="color",friendly="Color",default=Vector(1,1,1),description="color of outter glow for distance coded line art."},glowalpha={type="float",friendly="Alpha",default=1,description="Base glow alpha amount for glows/shadows with distance alpha."},glowx={type="float",friendly="X",default=0,description="texture offset x for glow mask."},glowend={type="float",friendly="End",default=0,description="end value for glow/shadow"},glowy={type="float",friendly="Y",default=0,description="texture offset y for glow mask."}},generic={nofog={is_flag=true,type="integer",friendly="NoFog",default=false,description="flag"},opaquetexture={is_flag=true,type="integer",friendly="OpaqueTexture",default=false,description="flag"},nolod={type="bool",default=false,description="flag",friendly="nolod"},ignorez={is_flag=true,type="integer",friendly="Ignorez",default=false,description="flag"},texture={type="texture",description="base texture",friendly="texture"},noalphamod={is_flag=true,type="integer",friendly="NoAlphaMod",default=false,description="flag"},znearer={is_flag=true,type="integer",friendly="Znearer",default=false,description="flag"},additive={is_flag=true,type="integer",friendly="Additive",default=false,description="flag"},nocull={is_flag=true,type="integer",friendly="NoCull",default=false,description="flag"},hdrcolorscale={type="float",friendly="HDRColorScale",default=1,description="hdr color scale"},softedges={type="bool",friendly="SoftEdges",default=false,description="Enable soft edges to distance coded textures."},ignore_alpha_modulation={is_flag=true,type="integer",friendly="IgnoreAlphaModulation",default=false,description="flag"},color={type="color",friendly="Color",default=Vector(1,1,1),description="color"},no_draw={is_flag=true,type="integer",friendly="NoDraw",default=false,description="flag"},suppress_decals={is_flag=true,type="integer",friendly="SuppressDecals",default=false,description="flag"},alpha={type="float",friendly="Alpha",default=1,description="alpha"},use_in_fillrate_mode={is_flag=true,type="integer",friendly="UseInFillrateMode",default=false,description="flag"},halflambert={is_flag=true,type="bool",friendly="HalfLambert",default=false,description="flag"},no_debug_override={is_flag=true,type="integer",friendly="NoDebugOverride",default=false,description="flag"},decal={is_flag=true,type="integer",friendly="Decal",default=false,description="flag"},allowalphatocoverage={is_flag=true,type="integer",friendly="AllowAlphaToCoverage",default=false,description="flag"},color2={type="color",friendly="Color2",default=Vector(1,1,1),description="color2"},multipass={is_flag=true,type="integer",friendly="Multipass",default=false,description="flag"},lightwarptexture={type="texture",friendly="DiffuseWarpTexture",description="1D ramp texture for tinting scalar diffuse term"},model={is_flag=true,type="integer",friendly="Model",default=false,description="flag"},wireframe={is_flag=true,type="integer",friendly="Wireframe",default=false,description="flag"},translucent={is_flag=true,type="integer",friendly="Translucent",default=false,description="flag"},flat={is_flag=true,type="integer",friendly="Flat",default=false,description="flag"}},["base texture"]={basetexturetransform={type="matrix",friendly="Transform",description="Base Texture Texcoord Transform"},basetexture={type="texture",description="Base Texture with lighting built in",default="models/debug/debugwhite"},frame={type="integer",friendly="Frame",default=0,description="Animation Frame",linked="basetexture"}},["self illumination"]={selfillum={is_flag=true,type="integer",default=false,description="flag"},selfillummask={type="texture",friendly="Mask",description="If we bind a texture here, it overrides base alpha (if any) for self illum"}},srgb={gammacolorread={type="integer",friendly="GammaColorRead",default=0,description="Disables SRGB conversion of color texture read."},srgbtint={type="color",friendly="Tint",default=Vector(1,1,1),description="tint value to be applied when running on new-style srgb parts"}},edge={edgesoftnessend={type="float",friendly="SoftnessEnd",default=0,description="End value for soft edges for distancealpha."},edgesoftnessstart={type="float",friendly="SoftnessStart",default=0,description="Start value for soft edges for distancealpha."}},vertex={vertexcolor={is_flag=true,type="bool",friendly="Color",default=false,description="flag"},vertexalphatest={type="bool",friendly="AlphaTest",default=false,description=""},vertexalpha={is_flag=true,type="bool",friendly="Alpha",default=false,description="flag"}},distance={distancealpha={type="bool",friendly="Alpha",default=false,description="Use distance-coded alpha generated from hi-res texture by vtex."},distancealphafromdetail={type="bool",friendly="AlphaFromDetail",default=false,description="Take the distance-coded alpha mask from the detail texture."}},scale={scaleoutlinesoftnessbasedonscreenres={type="bool",friendly="OutlineSoftnessBasedOnScreenRes",default=false,description="Scale the size of the soft part of the outline based upon resolution. 1024x768 = nominal."},scaleedgesoftnessbasedonscreenres={type="bool",friendly="EdgeSoftnessBasedOnScreenRes",default=false,description="Scale the size of the soft edges based upon resolution. 1024x768 = nominal."}},phong={phongwarptexture={type="texture",friendly="WarpTexture",description="2D map for warping specular"},phongexponenttexture={type="texture",friendly="ExponentTexture",description="Phong Exponent map"},albedo={type="texture",friendly="Albedo",description="albedo (Base texture with no baked lighting)"}}},refract={["base texture"]={basetexture={type="texture",description="Use a texture instead of rendering the view for the source of the distorted pixels.",default=""}},["local"]={localrefract={type="bool",default=false,description="Uses alpha channel of base texture to create a parallax effect.",friendly="Refract"},localrefractdepth={type="float",default=0,description="Depth of the parallax effect in units.",friendly="RefractDepth"}},force={forcealphawrite={type="bool",friendly="AlphaWrite",default=false},forcerefract={type="bool",default=false,friendly="Refract",description="Forces the shader to be used for cards with poor fill rate (DX8 only)."}},refract={refracttinttexture={type="texture",friendly="TintTexture",description="Tints the colour of the refraction either uniformly or per-texel."},refracttinttextureframe={type="integer",friendly="TintTextureFrame",description="Frame to start an animated tint texture on.",default=0,linked="refracttinttexture"},refracttint={type="color",friendly="Tint",default=Vector(1,1,1),description="Tint color of the refraction."},refractamount={type="float",friendly="RefractAmount",default=0.5,description="How strong the refraction effect should be when the material is partially cloaked (default = 2)."}},generic={vertexcolormodulate={type="bool",default=false,friendly="VertexColorModulate",recompute=true},bluramount={type="integer",friendly="BlurAmount",default=0,description="Adds a blur effect. Valid values are 0, 1 and 2 (0 and 1 for DX8-).",recompute=true},masked={type="bool",default=false,friendly="Masked",description="To do: mask using dest alpha"},fresnelreflection={type="float",default=1,friendly="FresnelReflection",description="Broken - Not implemented despite the parameter existing."},opaquetexture={is_flag=true,type="integer",friendly="OpaqueTexture",default=false,description="flag"},fadeoutonsilhouette={type="bool",friendly="FadeOutOnSilhouette",description="0 for no fade out on silhouette, 1 for fade out on sillhouette",default=false},nocull={is_flag=true,type="integer",friendly="NoCull",default=false,description="flag"},translucent={is_flag=true,type="integer",friendly="Translucent",default=false,description="flag"},model={is_flag=true,type="integer",friendly="Model",default=true,description="flag"}},normal={dudvmap={type="texture",friendly="DudvMap",description="The pattern of refraction is defined by a normal map (DX9+) or DUDV map (DX8-). May be animated.",default="dev/water_dudv"},normalmap={type="texture",friendly="NormalMap",description="The pattern of refraction is defined by a normal map (DX9+) or DUDV map (DX8-). May be animated.",default="dev/water_normal"},normalmap2={type="texture",friendly="SecondNormalMap",description="If a second normal map is specified, it will be blended with the first one."},bumpframe={type="int",default=0,friendly="BumpFrame",description="The frame to start the first animated bump map on.",linked="normalmap"},bumpframe2={type="int",default=0,friendly="SecondBumpFrame",description="The frame to start the second animated bump map on.",linked="normalmap2"},bumptransform={type="matrix",friendly="Transform",description="Transform of the first bump map."},bumptransform2={type="matrix",friendly="Second Transform",description="Transform of the second bump map."}}}},base={["base texture"]={basetexture={type="texture",description="Base Texture with lighting built in",default="models/debug/debugwhite"},basetexturetransform={type="matrix",friendly="Transform",description="Base Texture Texcoord Transform"},frame={type="integer",friendly="Frame",default=0,description="Base Texture Animation Frame",linked="basetexture"}},detail={detail={type="texture",friendly="Texture",description="detail texture"},detailblendfactor={type="float",friendly="BlendFactor",default=1,description="blend amount for detail texture."},detailframe={type="integer",friendly="Frame",default=0,description="frame number for $detail",linked="detail"},detailblendmode={recompute=true,type="integer",friendly="BlendMode",default=0,description="mode for combining detail texture with base."..[[
0 = original mode
1 = ADDITIVE base.rgb+detail.rgb*fblend
2 = alpha blend detail over base
3 = straight fade between base and detail.
4 = use base alpha for blend over detail
5 = add detail color post lighting
6 = TCOMBINE_RGB_ADDITIVE_SELFILLUM_THRESHOLD_FADE 6
7 = use alpha channel of base to select between mod2x channels in r+a of detail
8 = multiply
9 = use alpha channel of detail to mask base
10 = use detail to modulate lighting as an ssbump
11 = detail is an ssbump but use it as an albedo. shader does the magic here - no user needs to specify mode 11
12 = there is no detail texture
]]},detailscale={type="float",friendly="SimpleScale",default=1,description="scale of the detail texture"},detailtexturetransform={type="matrix",friendly="Transform",description="$detail texcoord transform"}},["depth blend"]={depthblendscale={friendly="Scale",type="float",description="Amplify or reduce DEPTHBLEND fading. Lower values make harder edges.",default=50},depthblend={type="float",description="fade at intersection boundaries",default=0,friendly="Blend"}},generic={separatedetailuvs={type="bool",friendly="SeparateDetailUv",default=false,description="Use texcoord1 for detail texture"},alpha={type="float",friendly="Alpha",default=1,description="alpha"}},srgb={linearwrite={type="bool",friendly="LinearWrite",default=false,description="Disables SRGB conversion of shader results."},srgbtint={type="color",friendly="Tint",default=Vector(1,1,1),description="tint value to be applied when running on new-style srgb parts"}},phong={phongtint={type="color",friendly="Tint",description="Phong tint for local specular lights"},phongfresnelranges={type="vec3",friendly="FresnelRanges",description="Parameters for remapping fresnel output",default=Vector(0.05,0.5,1)},phongalbedotint={type="bool",friendly="AlbedoTint",default=false,description="Apply tint by albedo (controlled by spec exponent texture"},phongexponent={type="float",friendly="Exponent",default=5,description="Phong exponent for local specular lights"},phong={type="bool",default=false,friendly="Enable",description="enables phong lighting"},phongboost={type="float",friendly="Boost",default=1,description="Phong overbrightening factor (specular mask channel should be authored to account for this)"}},flashlight={flashlighttexture={type="texture",friendly="Texture",description="flashlight spotlight shape texture"},flashlightnolambert={type="bool",friendly="NoLambert",default=false,description="Flashlight pass sets N.L=1.0"},flashlighttextureframe={type="integer",friendly="Frame",default=0,description="Animation Frame for $flashlight",linked="flashlighttexture"},receiveflashlight={type="bool",friendly="ReceiveFlashlight",default=false,description="Forces this material to receive flashlights."}},["alpha test"]={alphatest={is_flag=true,type="integer",friendly="AlphaTest",default=false,description="flag"},alphatestreference={recompute=true,type="float",friendly="Reference",default=0.7,description=""}},["environment map"]={envmapmasktransform={type="matrix",friendly="MaskTransform",description="$envmapmask texcoord transform"},envmapsaturation={type="float",friendly="Saturation",default=1,description="saturation 0 == greyscale 1 == normal"},envmapcontrast={type="float",friendly="Contrast",default=0,description="contrast 0 == normal 1 == color*color"},envmapmask={type="texture",friendly="Mask",description="envmap mask"},envmapmaskframe={type="integer",friendly="MaskFrame",default=0,description="Frame of the animated mask.",linked="envmapmask"},envmapcameraspace={is_flag=true,type="integer",friendly="CameraSpace",default=false,description="flag"},envmap={type="texture",friendly="Envmap",description="envmap. won't work if hdr is enabled",default="",partial_hdr=true},envmapframe={type="integer",friendly="Frame",default=0,description="envmap frame number",linked="envmap"},envmapmode={is_flag=true,type="integer",friendly="Mode",default=false,description="flag"},envmaptint={type="color",friendly="Tint",default=Vector(1,1,1),description="envmap tint"},envmapsphere={is_flag=true,type="integer",friendly="Sphere",default=false,description="flag"},normalmapalphaenvmapmask={is_flag=true,type="integer",friendly="NormalmapAlphaMask",default=false,description="flag"},basealphaenvmapmask={is_flag=true,type="integer",friendly="BaseAlphaMask",default=false,description="flag"}},vertex={vertexalpha={is_flag=true,type="bool",friendly="Alpha",default=false,description="flag"},vertexcolor={is_flag=true,type="bool",friendly="Color",default=false,description="flag"}}}}
--addons/!lpakr_out/lua/pac3/core/client/parts/projected_texture.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/proxy.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/sunbeams.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/bone.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/clip.lua:
local a=render.EnableClipping;local b=render.PushCustomClipPlane;local LocalToWorld=LocalToWorld;local IsEntity=IsEntity;local c,d=pac.PartTemplate("base_drawable")d.FriendlyName="legacy clip"d.ClassName="clip"d.Group="legacy"d.Icon='icon16/cut.png'c:SetPropertyGroup("generic")c:PropertyOrder("Name")c:PropertyOrder("Hide")c:PropertyOrder("ParentName")c:RemoveProperty("IgnoreZ")c:RemoveProperty("BlendMode")c:RemoveProperty("NoTextureFiltering")function d:OnParent(e)if!e.AddModifier then return end;e:AddModifier(self)local f=self:GetOwner()if f:IsValid()then function f.pacDrawModel(f)self:PreOnDraw()f:DrawModel()self:PostOnDraw()end end end;function d:OnUnParent(e)if!e:IsValid()then return end;if!e.RemoveModifier then return end;e:RemoveModifier(self)end;do local g;function d:PreOnDraw()g=a(true)local h,i=LocalToWorld(self.Position+self.PositionOffset,self:CalcAngles(self.Angles+self.AngleOffset),self:GetBonePosition())local j=i:Forward()b(j,j:Dot(h+j))end;local k=render.PopCustomClipPlane;function d:PostOnDraw()k()a(g)end end;c:Register()
--addons/!lpakr_out/lua/pac3/libraries/webaudio/urlogg.lua:
pac.webaudio=pac.webaudio||{}local a=pac.webaudio;a.Debug=0;a.SampleRate=nil;a.SpeedOfSound=340.29;function a.DebugPrint(b,...)if a.Debug==0 then return end;if a.Debug>=1 then if epoe then epoe.MsgC(Color(0,255,0),"[WebAudio] ")epoe.MsgC(Color(255,255,255),b)epoe.Print("")end;pac.Message(Color(0,255,0),"[WebAudio] ",Color(255,255,255),b,...)end;if a.Debug>=2 then if easylua then easylua.PrintOnServer("[WebAudio] "..b..' '..table.concat({...},', '))end end end;function a.GetSampleRate()return a.SampleRate end;local c=GetConVar("volume")local d=GetConVar("snd_mute_losefocus")pac.AddHook("Think","webaudio",function()if!a.Browser.IsInitialized()then if!a.Browser.IsInitializing()then a.Browser.Initialize()end;return end;if!system.HasFocus()&&d:GetBool()then a.Browser.SetVolume(0)else a.Browser.SetVolume(c:GetFloat())end;a.Streams.Think()a.Browser.Think()end)
--addons/!lpakr_out/lua/pac3/libraries/webaudio/stream.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/render_scores.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/extra/client/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/extra/shared/init.lua:
include("hands.lua")include("pac_weapon.lua")include("projectiles.lua")local a=CreateConVar("pac_restrictions","0",FCVAR_REPLICATED)if CLIENT then pac.AddHook("pac_EditorCalcView","pac_restrictions",function()if a:GetInt()>0&&!pac.LocalPlayer:IsAdmin()then local b=pace.GetViewEntity()local c=pace.ViewPos-b:EyePos()local d=b:BoundingRadius()*b:GetModelScale()*4;local e=player.GetAll()table.insert(e,b)if c:Length()>d then pace.ViewPos=b:EyePos()+c:GetNormalized()*d end;local f=util.TraceHull({start=b:EyePos(),endpos=pace.ViewPos,filter=e,mins=Vector(1,1,1)*-8,maxs=Vector(1,1,1)*8})if f.Hit then return f.HitPos end end end)end
--addons/!lpakr_out/lua/autorun/particlecontrol_autorun.lua:
return lpakr()()
--addons/!lpakr_out/lua/casino/cfg_sh.lua:
casino.MaxWager=1000000;casino.MaxWagerBits=20;casino.STATUS_ENDED=0;casino.STATUS_PLAYING=1;casino.PLAYER_SYNC=2;casino.PLAYER_DESYNC=3;casino.PLAYER_READY=4;casino.PLAYER_UNREADY=5;casino.PLAYER_WON=6;casino.PLAYER_LOST=7;casino.PLAYER_TURN=8;casino.PLAYER_CARDS=9;casino.PLAYER_WAGER=10;casino.StatusString={[casino.STATUS_PLAYING]='Playing',[casino.STATUS_ENDED]='Ended',[casino.PLAYER_SYNC]='PlayerSync',[casino.PLAYER_DESYNC]='PlayerDesync',[casino.PLAYER_READY]='PlayerReady',[casino.PLAYER_UNREADY]='PlayerUnready',[casino.PLAYER_WON]='PlayerWon',[casino.PLAYER_LOST]='PlayerLost',[casino.PLAYER_TURN]='PlayerTurn',[casino.PLAYER_CARDS]='SendPlayerCards'}casino.Sounds={Card=Sound('galactic/casino/card_give.wav'),CardHouse=Sound('galactic/casino/card_house.wav'),CardShuffle=Sound('galactic/casino/shuffle.wav'),Loss=Sound('galactic/casino/loss_coins.wav'),Win=Sound('galactic/casino/win_coins.wav'),Wager=Sound('galactic/casino/wager_coins.wav')}casino.Col={}casino.Col.midnight_light=Color(56,56,63)casino.Col.midnight=Color(45,45,51)casino.Col.midnight_dark=Color(33,33,37)casino.Col.green=Color(39,174,96)casino.Col.green_dark=Color(32,131,73)casino.Col.red=Color(231,76,60)casino.Col.red_dark=Color(192,57,43)casino.Col.orange=Color(230,126,34)casino.Col.blue=Color(12,75,150)casino.Col.blue_light=Color(52,152,219)casino.Col.transparent=Color(0,0,0,0)function casino.HasStoreEvent(a)if info.CWRP then return srp.shop.EventRunning(a)else return false end end;function casino.GetOwner(self)if info.CWRP then return self:GetPropOwner()else return self:Getowning_ent()end end;function casino.SetOwner(self,b)if info.CWRP then self:SetPropOwner(b)else self:CPPISetOwner(b)end end;function casino.AddMoney(c,d)print('Add Wager',c:SteamID(),d)if info.CWRP then c:AddMoney(d,true)else c:AddMoney(d)end end;function casino.TakeMoney(c,d)print('Take Wager',c:SteamID(),d)c:TakeMoney(d)end;function casino.HasMoney(c,d)print('Has Wager',c:SteamID(),d)if info.CWRP then return c:HasMoney(d)else return c:CanAfford(d)end end
--addons/!lpakr_out/lua/autorun/wire_load.lua:
if VERSION<140403&&VERSION>5 then ErrorNoHalt("WireMod: This branch of wiremod only supports Gmod13+.\n")return end;include("wire/sh_modelplug.lua")include("wire/wireshared.lua")include("wire/wirenet.lua")include("wire/wire_paths.lua")include("wire/wiregates.lua")include("wire/wiremonitors.lua")include("wire/gpulib.lua")include("wire/timedpairs.lua")include("wire/flir.lua")include("wire/von.lua")if CLIENT then include("wire/client/cl_wirelib.lua")include("wire/client/cl_modelplug.lua")include("wire/client/cl_wire_map_interface.lua")include("wire/client/wiredermaexts.lua")include("wire/client/wiremenus.lua")include("wire/client/wire_expression2_browser.lua")include("wire/client/wire_filebrowser.lua")include("wire/client/wire_listeditor.lua")include("wire/client/wire_soundpropertylist.lua")include("wire/client/gmod_tool_auto.lua")include("wire/client/sound_browser.lua")include("wire/client/thrusterlib.lua")include("wire/client/rendertarget_fix.lua")include("wire/client/customspawnmenu.lua")end
--addons/!lpakr_out/lua/wire/sh_modelplug.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/wireshared.lua:
WireLib=WireLib||{}local pairs=pairs;local setmetatable=setmetatable;local rawget=rawget;local next=next;local IsValid=IsValid;local LocalPlayer=LocalPlayer;local Entity=Entity;local string=string;local a=string.gsub;local b=string.char;local c=string.match;local d=string.sub;local e=utf8.char;local hook=hook;function table.MakeNonIterable(f)return setmetatable({},{__index=f,__setindex=f})end;function table.Compact(f,g,h)h=h||#f;local i=1;for j=1,h do if g(f[j])then f[i]=f[j]i=i+1 end end;while i<=h do f[i]=nil;i=i+1 end end;function table.RemoveFastByValue(f,k)for j,l in ipairs(f)do if l==k then f[j]=f[#f]f[#f]=nil;return j end end end;function string.GetNormalizedFilepath(m)local n=string.find(m,"\x00",1,true)if n then m=string.sub(m,1,n-1)end;local f=string.Explode("[/\\]+",m,true)local j=1;while j<=#f do if f[j]=="."||f[j]==""then table.remove(f,j)elseif f[j]==".."then table.remove(f,j)if j>1 then j=j-1;table.remove(f,j)end else j=j+1 end end;return table.concat(f,"/")end;function pairs_sortkeys(f,o)local p={}for q,r in pairs(f)do table.insert(p,q)end;table.sort(p,o)local s,t,u,q=ipairs(p)return function()u,q=s(t,u)if u==nil then return nil end;return q,f[q]end end;function pairs_sortvalues(f,o)local v=o&&function(w,x)return o(f[w],f[x])end||function(w,x)return f[w]<f[x]end;local p={}f=f||{}for q,r in pairs(f)do table.insert(p,q)end;table.sort(p,v)local s,t,u,q=ipairs(p)return function()u,q=s(t,u)if u==nil then return nil end;return q,f[q]end end;function pairs_consume(table)return function()local q,l=next(table)if q then table[q]=nil;return q,l end end end;function ipairs_map(f,y)local s,t,q=ipairs(f)return function(t,q)local l;q,l=s(t,q)if q==nil then return nil end;return q,y(l)end,t,q end;function pairs_map(f,y)local s,t,q=pairs(f)return function(t,q)local l;q,l=s(t,q)if q==nil then return nil end;return q,y(l)end,t,q end;local table=table;local pairs_sortvalues=pairs_sortvalues;local ipairs_map=ipairs_map;do local function z(A,...)local f={}setmetatable(f,A)local B=A.Initialize;if B then B(f,...)end;return f end;local function C(D)local E={new=z}E.__index=E;WireLib.containers[D]=E;return E end;WireLib.containers={new=z,newclass=C}do local F=C("autocleanup")function F:Initialize(G,H,I)rawset(self,"depth",G||0)rawset(self,"parent",H)rawset(self,"parentindex",I)rawset(self,"data",{})end;function F:__index(u)local J=rawget(self,"data")local K=J[u]if K then return K end;local G=rawget(self,"depth")if G==0 then return nil end;K=z(F,G-1,self,u)return K end;function F:__newindex(u,k)local J=rawget(self,"data")local H=rawget(self,"parent")local I=rawget(self,"parentindex")if k!=nil&&!next(J)&&H then H[I]=self end;J[u]=k;if k==nil&&!next(J)&&H then H[I]=nil end end;function F:__pairs()local J=rawget(self,"data")return pairs(J)end;pairs_ac=F.__pairs end end;do NOTIFYSOUND_NONE=0;NOTIFYSOUND_DRIP1=1;NOTIFYSOUND_DRIP2=2;NOTIFYSOUND_DRIP3=3;NOTIFYSOUND_DRIP4=4;NOTIFYSOUND_DRIP5=5;NOTIFYSOUND_ERROR1=6;NOTIFYSOUND_CONFIRM1=7;NOTIFYSOUND_CONFIRM2=8;NOTIFYSOUND_CONFIRM3=9;NOTIFYSOUND_CONFIRM4=10;if CLIENT then local L={[NOTIFYSOUND_DRIP1]="ambient/water/drip1.wav",[NOTIFYSOUND_DRIP2]="ambient/water/drip2.wav",[NOTIFYSOUND_DRIP3]="ambient/water/drip3.wav",[NOTIFYSOUND_DRIP4]="ambient/water/drip4.wav",[NOTIFYSOUND_DRIP5]="ambient/water/drip5.wav",[NOTIFYSOUND_ERROR1]="buttons/button10.wav",[NOTIFYSOUND_CONFIRM1]="buttons/button3.wav",[NOTIFYSOUND_CONFIRM2]="buttons/button14.wav",[NOTIFYSOUND_CONFIRM3]="buttons/button15.wav",[NOTIFYSOUND_CONFIRM4]="buttons/button17.wav"}function WireLib.AddNotify(M,N,O,P,Q)if isstring(M)then N,O,P,Q=M,N,O,P elseif M!=LocalPlayer()then return end;GAMEMODE:AddNotify(N,O,P)if Q&&L[Q]then surface.PlaySound(L[Q])end end;net.Receive("wire_addnotify",function(R)local N=net.ReadString()local O=net.ReadUInt(8)local P=net.ReadFloat()local Q=net.ReadUInt(8)WireLib.AddNotify(LocalPlayer(),N,O,P,Q)end)elseif SERVER then NOTIFY_GENERIC=0;NOTIFY_ERROR=1;NOTIFY_UNDO=2;NOTIFY_HINT=3;NOTIFY_CLEANUP=4;util.AddNetworkString("wire_addnotify")function WireLib.AddNotify(M,N,O,P,Q)if isstring(M)then M,N,O,P,Q=nil,M,N,O,P end;if M&&!M:IsValid()then return end;net.Start("wire_addnotify")net.WriteString(N)net.WriteUInt(O||0,8)net.WriteFloat(P)net.WriteUInt(Q||0,8)if M then net.Send(M)else net.Broadcast()end end end end;if CLIENT then net.Receive("wire_clienterror",function(R)local S=net.ReadString()print("sv: "..S)local T=string.Explode("\n",S)for j,U in ipairs(T)do if j==1 then WireLib.AddNotify(U,NOTIFY_ERROR,7,NOTIFYSOUND_ERROR1)else WireLib.AddNotify(U,NOTIFY_ERROR,7)end end end)elseif SERVER then util.AddNetworkString("wire_clienterror")function WireLib.ClientError(S,M)net.Start("wire_clienterror")net.WriteString(S)net.Send(M)end end;function WireLib.ErrorNoHalt(S)for j=1,#S,511 do ErrorNoHalt(S:sub(j,j+510))end end;function WireLib.GenerateUUID()local V={}for j=1,16 do V[j]=math.random(0,0xFF)end;V[7]=bit.bor(0x40,bit.band(V[7],0x0F))V[9]=bit.bor(0x80,bit.band(V[7],0x3F))return string.format("%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",unpack(V))end;local W="WireLib.GetServerUUID"if SERVER then else local X;net.Receive(W,function()X=net.ReadString()end)function WireLib.GetServerUUID()return X end end;if SERVER then elseif CLIENT then function WireLib.netRegister(self)net.Start("wire_netmsg_register")net.WriteEntity(self)net.SendToServer()end;net.Receive("wire_netmsg_registered",function(R)local self=net.ReadEntity()if IsValid(self)&&self.Receive then self:Receive()end end)end;function WireLib.HasPorts(Y)local Z=Y:GetTable()if Z.IsWire then return true end;if Z.Base=="base_wire_entity"then return true end;local _,a0=WireLib.GetPorts(Y)if _&&(Z.Inputs||CLIENT)then return true end;if a0&&(Z.Outputs||CLIENT)then return true end;return false end;if SERVER then elseif CLIENT then local a1={}local a2={}net.Receive("wire_ports",function(R)local a3=0;local a4={}while true do local a5=net.ReadInt(8)if a5==0 then break elseif a5==-1 then a1[a3]=nil elseif a5==-2 then a2[a3]=nil elseif a5==-3 then a3=net.ReadUInt(16)elseif a5==-4 then a4[#a4+1]={a3,net.ReadUInt(8),net.ReadBit()!=0}elseif a5>0 then local a6;local a7=net.ReadUInt(8)if net.ReadBit()!=0 then a6=a2[a3]if!a6 then a6={}a2[a3]=a6 end else a6=a1[a3]if!a6 then a6={}a1[a3]=a6 end end;local a8=a5+a7-1;for j=a5,a8 do a6[j]={net.ReadString(),net.ReadString(),net.ReadString()}end end end;for j=1,#a4 do local a3,a9,t=unpack(a4[j])local a6=a1[a3]if!a6 then a6={}a1[a3]=a6 elseif a6[a9]then a6[a9][4]=t end end end)function WireLib.GetPorts(Y)local a3=Y:EntIndex()return a1[a3],a2[a3]end;function WireLib._RemoveWire(a3)a1[a3]=nil;a2[a3]=nil end;local aa=false;function WireLib.TestPorts()aa=!aa;if aa then local ab=0;hook.Add("HUDPaint","wire_ports_test",function()local Y=LocalPlayer():GetEyeTraceNoCursor().Entity;local a3=IsValid(Y)&&Y:EntIndex()||ab;ab=a3;local ac="ID "..a3 .."\nInputs:\n"for r,ad,ae,af,ag in ipairs_map(a1[a3]||{},unpack)do ac=ac..(ag&&"-"||" ")ac=ac..string.format("%s (%s) [%s]\n",ad,ae,af)end;ac=ac.."\nOutputs:\n"for r,ad,ae,af in ipairs_map(a2[a3]||{},unpack)do ac=ac..string.format("%s (%s) [%s]\n",ad,ae,af)end;draw.DrawText(ac,"Trebuchet24",10,300,Color(255,255,255,255),0)end)else hook.Remove("HUDPaint","wire_ports_test")end end end;function WireLib.levenshtein(ah,ai)local aj,ak,al={},#ah,#ai;local am,an=string.byte,math.min;for j=0,ak do aj[j*al]=j end;for ao=0,al do aj[ao]=ao end;for j=1,ak do local ap=am(ah,j)for ao=1,al do aj[j*al+ao]=an(aj[(j-1)*al+ao]+1,aj[j*al+ao-1]+1,aj[(j-1)*al+ao-1]+(ap==am(ai,ao)&&0||1))end end;return aj[#aj]end;WireLib.nicenumber={}local aq=WireLib.nicenumber;local ar={{name="septillion",short="sep",symbol="Y",prefix="yotta",zeroes=10^24},{name="sextillion",short="sex",symbol="Z",prefix="zetta",zeroes=10^21},{name="quintillion",short="quint",symbol="E",prefix="exa",zeroes=10^18},{name="quadrillion",short="quad",symbol="P",prefix="peta",zeroes=10^15},{name="trillion",short="T",symbol="T",prefix="tera",zeroes=10^12},{name="billion",short="B",symbol="B",prefix="giga",zeroes=10^9},{name="million",short="M",symbol="M",prefix="mega",zeroes=10^6},{name="thousand",short="K",symbol="K",prefix="kilo",zeroes=10^3}}local as={name="ones",short="",symbol="",prefix="",zeroes=1}local at=math.floor;function aq.info(h,au)if!h||h<0 then return{}end;if h>10^300 then h=10^300 end;local ai={}au=au||#ar;local av=true;local aw=0;for j=1,#ar do local ax=ar[j].zeroes;local ay=at(h/ax)if ay>0 then aw=aw+1;if aw>au then break end;ai[#ai+1]=setmetatable({value=ay},{__index=ar[j]})h=h%ar[j].zeroes;av=false end end;if h>=0&&av then ai[#ai+1]=setmetatable({value=h},{__index=as})end;return ai end;local az=string.sub;function aq.format(h,au)local ai=aq.info(h,au)au=au||#ar;local aA=""for j=1,#ai do if j>au then break end;aA=aA..ai[j].value..ai[j].symbol.." "end;return az(aA,1,-2)end;local aB=math.Round;function aq.formatDecimal(h,aC)local ai=aq.info(h,1)aC=aC||2;local aD=ai[1]if aD then h=h/aD.zeroes;return aB(h,aC)..aD.symbol else return"0"end end;local aE={{"y",31556926},{"mon",2629743.83},{"w",604800},{"d",86400},{"h",3600},{"m",60},{"s",1}}function aq.nicetime(h)h=math.abs(h)if h==0 then return"0s"end;local aF=""local aG=0;for j=1,#aE do local ad=aE[j][1]local a9=aE[j][2]local aH=at(h/a9)if aH>0||aF!=""then if aF!=""then return aG..aF.." "..aH..ad else aF=ad;aG=aH;h=h%a9 end end end;if aF!=""then return aG..aF else return"0s"end end;function WireLib.isnan(h)return h!=h end;local aI=WireLib.isnan;local aJ,aK,aL=-16384,-16384,-16384;local aM,aN,aO=16384,16384,16384;local aP=math.Clamp;function WireLib.clampPos(aQ)aQ=Vector(aQ)aQ.x=aP(aQ.x,aJ,aM)aQ.y=aP(aQ.y,aK,aN)aQ.z=aP(aQ.z,aL,aO)return aQ end;function WireLib.setPos(Y,aQ)if aI(aQ.x)||aI(aQ.y)||aI(aQ.z)then return end;return Y:SetPos(WireLib.clampPos(aQ))end;function WireLib.setLocalPos(Y,aQ)if aI(aQ.x)||aI(aQ.y)||aI(aQ.z)then return end;return Y:SetLocalPos(WireLib.clampPos(aQ))end;function WireLib.setAng(Y,aR)if aI(aR.pitch)||aI(aR.yaw)||aI(aR.roll)then return end;return Y:SetAngles(aR)end;function WireLib.setLocalAng(Y,aR)if aI(aR.pitch)||aI(aR.yaw)||aI(aR.roll)then return end;return Y:SetLocalAngles(aR)end;local aS={n="\n",r="\r",t="\t",["\\"]="\\",["'"]="'",["\""]="\"",a="\a",b="\b",f="\f",v="\v"}function WireLib.ParseEscapes(aA)aA=a(aA,"\\(.?)([^\\]?[^\\]?[^\\]?[^\\]?[^\\]?[^\\]?[^\\]?}?)",function(j,aT)if aS[j]then return aS[j]..aT elseif j=="x"then local a9=c(aT,"^(%x%x)")if!a9 then return false end;return b(tonumber(a9,16))..d(aT,#a9+1)elseif j>="0"&&j<="9"then local a9=c(aT,"^(%d?%d?)")if!a9 then return false end;local aU=tonumber(j..a9)return aU<256&&b(aU)..d(aT,#a9+1)elseif j=="u"then local a9=c(aT,"^{(%x%x?%x?%x?%x?%x?)}")if!a9 then return false end;local aU=tonumber(a9,16)return aU<=0x10ffff&&e(aU)..d(aT,#a9+3)else return false end end)return aA end;local aV,aW;hook.Add("InitPostEntity","WireForceLimit",function()timer.Simple(0,function()aV=100000*physenv.GetPerformanceSettings().MaxVelocity;aW=-aV end)end)function WireLib.clampForce(l)return Vector(l[1]==l[1]&&math.Clamp(l[1],aW,aV)||0,l[2]==l[2]&&math.Clamp(l[2],aW,aV)||0,l[3]==l[3]&&math.Clamp(l[3],aW,aV)||0)end;local aX={prop_vehicle=true,prop_vehicle_airboat=true,prop_vehicle_apc=true,prop_vehicle_cannon=true,prop_vehicle_choreo_generic=true,prop_vehicle_crane=true,prop_vehicle_driveable=true,prop_vehicle_jeep=true,prop_vehicle_prisoner_pod=true}local function aY(aZ)return aX[aZ:GetClass()]end;local function a_(Y,b0,b1)for r,b2 in pairs(Y.Constraints||{})do if IsValid(b2)then for j=1,6 do local b3=b2["Ent"..j]if b3&&!b0[b3]then b0[b3]=true;b1(b3)a_(b3,b0,b1)end end end end end;function WireLib.GetClosestRealVehicle(b4,b5,b6)if!IsValid(b4)then return b4 end;if!b5 then b5=b4:GetPos()end;if IsValid(b4)&&!aY(b4)then local b7=math.huge;a_(b4,{[b4]=true},function(Y)if aY(Y)then local b8=b5:DistToSqr(Y:GetPos())if b8<b7 then b7=b8;b4=Y end end end)if aY(b4)&&IsValid(b6)&&b6:IsPlayer()then WireLib.AddNotify(b6,"That wasn't a vehicle!\n".."The contraption has been scanned and this entity has instead been linked to the closest vehicle in this contraption.\n".."Hover your cursor over the controller to view the yellow line, which indicates the selected vehicle.",NOTIFY_GENERIC,14,NOTIFYSOUND_DRIP1)end end;if!aY(b4)&&IsValid(b6)&&b6:IsPlayer()then WireLib.AddNotify(b6,"The entity you linked to is not a 'real' vehicle, ".."and we were unable to find any 'real' vehicles attached to it. This controller might not work.",NOTIFY_GENERIC,14,NOTIFYSOUND_DRIP1)end;return b4 end;do local b9="WireLib.SyncBinds"local ba={"invprev","invnext","impulse 100","attack","jump","noclip","duck","forward","back","use","left","right","moveleft","moveright","attack2","reload","alt1","alt2","showscores","speed","walk","zoom","grenade1","grenade2"}local bb={}for q,l in pairs(ba)do bb[l]=q end;if CLIENT then hook.Add("InitPostEntity",b9,function()local J={}for bc=BUTTON_CODE_NONE,BUTTON_CODE_LAST do local bd=input.LookupKeyBinding(bc)if bd!=nil then if string.sub(bd,1,1)=="+"then bd=string.sub(bd,2)end;local be=bb[bd]if be!=nil then table.insert(J,{Button=bc,BindingIndex=be})end end end;if BUTTON_CODE_COUNT>=65536 then ErrorNoHalt("ERROR! BUTTON_CODE_COUNT exceeds 65536!")end;if#ba>=32 then ErrorNoHalt("ERROR! Interesting binds exceeds 32!")end;net.Start(b9)net.WriteUInt(#J,8)for r,bf in pairs(J)do net.WriteUInt(bf.Button,16)net.WriteUInt(bf.BindingIndex,5)end;net.SendToServer()end)elseif SERVER then util.AddNetworkString(b9)net.Receive(b9,function(r,bg)bg.SyncedBindings={}local bh=net.ReadUInt(8)for r=1,bh do local bc=net.ReadUInt(16)local be=net.ReadUInt(5)if bc>BUTTON_CODE_NONE&&bc<=BUTTON_CODE_LAST then local bd=ba[be]bg.SyncedBindings[bc]=bd end end end)hook.Add("PlayerButtonDown",b9,function(bg,bc)if!bg.SyncedBindings then return end;local bd=bg.SyncedBindings[bc]hook.Run("PlayerBindDown",bg,bd,bc)end)hook.Add("PlayerButtonUp",b9,function(bg,bc)if!bg.SyncedBindings then return end;local bd=bg.SyncedBindings[bc]hook.Run("PlayerBindUp",bg,bd,bc)end)end end;WireLib.PlayerTables=setmetatable({},{__mode="kv"})function WireLib.RegisterPlayerTable(f)f=f||{}WireLib.PlayerTables[f]=f;return f end;hook.Add("PlayerDisconnected","WireLib_PlayerDisconnect",function(M)for r,f in pairs(WireLib.PlayerTables)do f[M]=nil end end)local bi=FindMetaTable("Entity")local bj=bi.GetPos;local bk=bi.GetAngles;function WireLib.GetComputeIfEntityTransformDirty(bl)return setmetatable({},{__index=function(ai,Y)local bm={Vector(math.huge),Angle()}ai[Y]=bm;return bm end,__call=function(ai,Y)local J=ai[Y]local aQ,aR=bj(Y),bk(Y)if aQ!=J[1]||aR!=J[2]then J[1]=aQ;J[2]=aR;J[3]=bl(Y)end;return J[3]end})end;local bn={[0]=color_white,[1]=color_white,[2]=Color(255,88,1),[3]=Color(255,32,0)}local bo=Color(1,168,255)local bp={[0]={""},[1]={bo,"[Wiremod]: "},[2]={bo,"[Wiremod ",bn[2],"WARNING",bo,"]: "},[3]={bo,"[Wiremod ",bn[3],"ERROR",bo,"]: "}}function WireLib.NotifyBuilder(bq,br,bs)local bt={}for q,l in ipairs(bp[br])do bt[q]=l end;local h=#bt;bt[h+1]=bs||bn[br]bt[h+2]=bq;return bt end;local bu={[TYPE_NONE]="none",[TYPE_NIL]="nil",[TYPE_BOOL]="boolean",[TYPE_LIGHTUSERDATA]="lightuserdata",[TYPE_NUMBER]="number",[TYPE_STRING]="string",[TYPE_TABLE]="table",[TYPE_FUNCTION]="function",[TYPE_USERDATA]="userdata",[TYPE_THREAD]="thread",[TYPE_ENTITY]="entity",[TYPE_VECTOR]="vector",[TYPE_ANGLE]="angle",[TYPE_PHYSOBJ]="physobj",[TYPE_SAVE]="save",[TYPE_RESTORE]="restore",[TYPE_DAMAGEINFO]="damageinfo",[TYPE_EFFECTDATA]="effectdata",[TYPE_MOVEDATA]="movedata",[TYPE_RECIPIENTFILTER]="recipientfilter",[TYPE_USERCMD]="usercmd",[TYPE_SCRIPTEDVEHICLE]="scriptedvehicle",[TYPE_MATERIAL]="material",[TYPE_PANEL]="panel",[TYPE_PARTICLE]="particle",[TYPE_PARTICLEEMITTER]="particleemitter",[TYPE_TEXTURE]="texture",[TYPE_USERMSG]="usermsg",[TYPE_CONVAR]="convar",[TYPE_IMESH]="imesh",[TYPE_MATERIAL]="matrix",[TYPE_SOUND]="sound",[TYPE_PIXELVISHANDLE]="pixelvishandle",[TYPE_DLIGHT]="dlight",[TYPE_VIDEO]="video",[TYPE_FILE]="file",[TYPE_LOCOMOTION]="locomotion",[TYPE_PATH]="path",[TYPE_NAVAREA]="navarea",[TYPE_SOUNDHANDLE]="soundhandle",[TYPE_NAVLADDER]="navladder",[TYPE_PARTICLESYSTEM]="particlesystem",[TYPE_PROJECTEDTEXTURE]="projectedtexture",[TYPE_PHYSCOLLIDE]="physcollide",[TYPE_SURFACEINFO]="surfaceinfo",[TYPE_COUNT]="count",[TYPE_COLOR]="color"}function WireLib.typeIDToString(bv)return bu[bv]||"unregistered type"end
--addons/!lpakr_out/lua/wire/wirenet.lua:
local a=WireLib.Net||{}WireLib.Net=a;a.Trivial={}local b=10;local c={}local d;if SERVER then else d=function(e,f)local g=c[e]if!g then c[e]=f else c[g]=f end end;local function h(i,j,k,l)local m,n=1,1;for o=i,j do local p=k[m]local e=string.sub(l,n,n+p-1)c[o]=c[e]c[e]=o;m=m+1;n=n+p end end;local function q()local i=net.ReadUInt(b)local j=net.ReadUInt(b)local k={}for o=1,j-i+1 do k[o]=net.ReadUInt(8)end;if net.ReadBool()then net.ReadStream(nil,function(r)h(i,j,k,r)end)else h(i,j,k,util.Decompress(net.ReadData(net.ReadUInt(12))))end end;c[0]=q;function a.Trivial.Start(e,s)e=e:lower()local t=c[e]if!t then error("WireLib.Net.Trivial trying to send message on client that isn't registered.")end;net.Start("wirelib_net_message",s)net.WriteUInt(t,b)end end;function a.Trivial.Receive(e,f)d(e:lower(),f)end;local function u(p,v)local w=c[net.ReadUInt(b)]if w then w(p,v)else error("WireLib.Net.Trivial tried to receive message that is not registered.")end end;net.Receive("wirelib_net_message",u)a.Receivers=c
--addons/!lpakr_out/lua/wire/gates/entity.lua:
GateActions("Entity")local a=WireLib.clampForce;local function b(c,d)if!IsValid(d)then return false end;if d:IsPlayer()then return false end;if!IsValid(c:GetPlayer())then return false end;return hook.Run("PhysgunPickup",c:GetPlayer(),d)!=false end;GateActions["entity_applyf"]={name="Apply Force",inputs={"Ent","Vec"},inputtypes={"ENTITY","VECTOR"},timed=true,output=function(c,d,e)if!b(c,d)then return end;local f=d:GetPhysicsObject()if!IsValid(f)then return end;if!isvector(e)then e=Vector(0,0,0)end;e=a(e)if e.x==0&&e.y==0&&e.z==0 then return end;f:ApplyForceCenter(e)end,label=function(g,d,e)return string.format("(%s):applyForce(%s)",d,e)end}GateActions["entity_applyof"]={name="Apply Offset Force",inputs={"Ent","Vec","Offset"},inputtypes={"ENTITY","VECTOR","VECTOR"},timed=true,output=function(c,d,e,offset)if!b(c,d)then return end;local f=d:GetPhysicsObject()if!IsValid(f)then return end;if!isvector(e)then e=Vector(0,0,0)end;if!isvector(offset)then offset=Vector(0,0,0)end;e=a(e)offset=a(offset)if e.x==0&&e.y==0&&e.z==0 then return end;f:ApplyForceOffset(e,offset)end,label=function(g,d,e,offset)return string.format("(%s):applyForceOffset(%s,%s)",d,e,offset)end}GateActions["entity_applyaf"]={name="Apply Angular Force",inputs={"Ent","Ang"},inputtypes={"ENTITY","ANGLE"},timed=true,output=function(c,d,h)if!b(c,d)then return end;local f=d:GetPhysicsObject()if!IsValid(f)then return end;local i=a(h)if i.x==0&&i.y==0&&i.z==0 then return end;local j=d:GetUp()local k=d:GetRight()*-1;local l=d:GetForward()if i.x!=0 then local m=j*i.x*0.5;f:ApplyForceOffset(l,m)f:ApplyForceOffset(l*-1,m*-1)end;if i.y!=0 then local n=l*i.y*0.5;f:ApplyForceOffset(k,n)f:ApplyForceOffset(k*-1,n*-1)end;if i.z!=0 then local o=k*i.z*0.5;f:ApplyForceOffset(j,o)f:ApplyForceOffset(j*-1,o*-1)end end,label=function(p,d,h)return string.format("(%s):applyAngForce(%s)",d,h)end}local q=math.abs;GateActions["entity_applytorq"]={name="Apply Torque",inputs={"Ent","Vec"},inputtypes={"ENTITY","VECTOR"},timed=true,output=function(c,d,e)if!b(c,d)then return end;local f=d:GetPhysicsObject()if!IsValid(f)then return end;if!isvector(e)then e=Vector(0,0,0)end;if!isvector(offset)then offset=Vector(0,0,0)end;e=a(e)offset=a(offset)if e.x==0&&e.y==0&&e.z==0 then return end;local r=e;local s=r:Length()r=f:LocalToWorld(r)-f:GetPos()local t;if q(r.x)>s*0.1||q(r.z)>s*0.1 then t=Vector(-r.z,0,r.x)else t=Vector(-r.y,r.x,0)end;t=t:GetNormal()*s*0.5;local u=(r:Cross(t)):GetNormal()u=a(u)t=a(t)f:ApplyForceOffset(u,t)f:ApplyForceOffset(u*-1,t*-1)end,label=function(g,d,e)return string.format("(%s):applyTorque(%s)",d,e)end}GateActions["entity_class"]={name="Class",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"STRING"},output=function(c,Ent)if!Ent:IsValid()then return""else return Ent:GetClass()end end,label=function(p)return string.format("Class = %q",p)end}GateActions["entity_entid"]={name="Entity ID",inputs={"A"},inputtypes={"ENTITY"},output=function(c,v)if v&&v:IsValid()then return v:EntIndex()end;return 0 end,label=function(p,v)return string.format("entID(%s) = %d",v,p)end}GateActions["entity_id2ent"]={name="ID to Entity",inputs={"A"},outputtypes={"ENTITY"},output=function(c,v)local Ent=Entity(v)if!Ent:IsValid()then return NULL end;return Ent end,label=function(p,v)return string.format("Entity(%s) = %s",v,tostring(p))end}GateActions["entity_model"]={name="Model",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"STRING"},output=function(c,Ent)if!Ent:IsValid()then return""else return Ent:GetModel()end end,label=function(p)return string.format("Model = %q",p)end}GateActions["entity_steamid"]={name="SteamID",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"STRING"},output=function(c,Ent)if!Ent:IsValid()||!Ent:IsPlayer()then return""else return Ent:SteamID()end end,label=function(p)return string.format("SteamID = %q",p)end}GateActions["entity_pos"]={name="Position",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return Vector(0,0,0)else return Ent:GetPos()end end,label=function(p)return string.format("Position = (%d,%d,%d)",p.x,p.y,p.z)end}GateActions["entity_fruvecs"]={name="Direction - (forward, right, up)",inputs={"Ent"},inputtypes={"ENTITY"},outputs={"Forward","Right","Up"},outputtypes={"VECTOR","VECTOR","VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return Vector(0,0,0),Vector(0,0,0),Vector(0,0,0)else return Ent:GetForward(),Ent:GetRight(),Ent:GetUp()end end,label=function(p)return string.format("Forward = (%f , %f , %f)\nUp = (%f , %f , %f)\nRight = (%f , %f , %f)",p.Forward.x,p.Forward.y,p.Forward.z,p.Up.x,p.Up.y,p.Up.z,p.Right.x,p.Right.y,p.Right.z)end}GateActions["entity_isvalid"]={name="Is Valid",inputs={"A"},inputtypes={"ENTITY"},timed=true,output=function(c,v)if v&&IsEntity(v)&&v:IsValid()then return 1 end;return 0 end,label=function(p,v)return string.format("isValid(%s) = %s",v,p)end}GateActions["entity_vell"]={name="Velocity (local)",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return Vector(0,0,0)else return Ent:WorldToLocal(Ent:GetVelocity()+Ent:GetPos())end end,label=function(p)return string.format("Velocity (local) = (%f , %f , %f)",p.x,p.y,p.z)end}GateActions["entity_vel"]={name="Velocity",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return Vector(0,0,0)else return Ent:GetVelocity()end end,label=function(p)return string.format("Velocity = (%f , %f , %f)",p.x,p.y,p.z)end}GateActions["entity_angvel"]={name="Angular Velocity",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"ANGLE"},timed=true,output=function(c,Ent)local w;if!Ent:IsValid()||!Ent:GetPhysicsObject():IsValid()then w=Vector(0,0,0)else w=Ent:GetPhysicsObject():GetAngleVelocity()end;return Angle(w.y,w.z,w.x)end,label=function(p)return string.format("Angular Velocity = (%f , %f , %f)",p.p,p.y,p.r)end}GateActions["entity_angvelvec"]={name="Angular Velocity (vector)",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return Vector(0,0,0)end;local f=Ent:GetPhysicsObject()if!f:IsValid()then return Vector(0,0,0)end;return f:GetAngleVelocity()end,label=function(p)return string.format("Angular Velocity = (%f , %f , %f)",p.x,p.y,p.z)end}GateActions["entity_wor2loc"]={name="World To Local (vector)",inputs={"Ent","Vec"},inputtypes={"ENTITY","VECTOR"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent,w)if Ent:IsValid()&&isvector(w)then return Ent:WorldToLocal(w)else return Vector(0,0,0)end end,label=function(p)return string.format("World To Local = (%f , %f , %f)",p.x,p.y,p.z)end}GateActions["entity_loc2wor"]={name="Local To World (Vector)",inputs={"Ent","Vec"},inputtypes={"ENTITY","VECTOR"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent,w)if Ent:IsValid()&&isvector(w)then return Ent:LocalToWorld(w)else return Vector(0,0,0)end end,label=function(p)return string.format("Local To World Vector = (%f , %f , %f)",p.x,p.y,p.z)end}GateActions["entity_wor2loc"]={name="World To Local (Vector)",inputs={"Ent","Vec"},inputtypes={"ENTITY","VECTOR"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent,w)if Ent:IsValid()&&isvector(w)then return Ent:WorldToLocal(w)else return Vector(0,0,0)end end,label=function(p)return string.format("World To Local Vector = (%f , %f , %f)",p.x,p.y,p.z)end}GateActions["entity_loc2worang"]={name="Local To World (Angle)",inputs={"Ent","Ang"},inputtypes={"ENTITY","ANGLE"},outputtypes={"ANGLE"},timed=true,output=function(c,Ent,x)if Ent:IsValid()&&x then return Ent:LocalToWorldAngles(x)else return Angle(0,0,0)end end,label=function(p)return string.format("Local To World Angles = (%d,%d,%d)",p.p,p.y,p.r)end}GateActions["entity_wor2locang"]={name="World To Local (Angle)",inputs={"Ent","Ang"},inputtypes={"ENTITY","ANGLE"},outputtypes={"ANGLE"},timed=true,output=function(c,Ent,x)if Ent:IsValid()&&x then return Ent:WorldToLocalAngles(x)else return Angle(0,0,0)end end,label=function(p)return string.format("World To Local Angles = (%d,%d,%d)",p.p,p.y,p.r)end}GateActions["entity_health"]={name="Health",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 else return Ent:Health()end end,label=function(p)return string.format("Health = %d",p)end}GateActions["entity_radius"]={name="Radius",description="Gets the widest radius of the entity's bounding box.",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 else return Ent:BoundingRadius()end end,label=function(p)return string.format("Radius = %d",p)end}GateActions["entity_mass"]={name="Mass",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()||!Ent:GetPhysicsObject():IsValid()then return 0 else return Ent:GetPhysicsObject():GetMass()end end,label=function(p)return string.format("Mass = %d",p)end}GateActions["entity_masscenter"]={name="Mass Center",description="Gets the entity's center of mass.",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()||!Ent:GetPhysicsObject():IsValid()then return Vector(0,0,0)else return Ent:LocalToWorld(Ent:GetPhysicsObject():GetMassCenter())end end,label=function(p)return string.format("Mass Center = (%d,%d,%d)",p.x,p.y,p.z)end}GateActions["entity_masscenterlocal"]={name="Mass Center (local)",description="Gets the entity's center of mass relative to itself.",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()||!Ent:GetPhysicsObject():IsValid()then return Vector(0,0,0)else return Ent:GetPhysicsObject():GetMassCenter()end end,label=function(p)return string.format("Mass Center (local) = (%d,%d,%d)",p.x,p.y,p.z)end}GateActions["entity_isplayer"]={name="Is Player",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 end;if Ent:IsPlayer()then return 1 else return 0 end end,label=function(p)return string.format("Is Player = %d",p)end}GateActions["entity_isnpc"]={name="Is NPC",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 end;if Ent:IsNPC()then return 1 else return 0 end end,label=function(p)return string.format("Is NPC = %d",p)end}GateActions["entity_isvehicle"]={name="Is Vehicle",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 end;if Ent:IsVehicle()then return 1 else return 0 end end,label=function(p)return string.format("Is Vehicle = %d",p)end}GateActions["entity_isworld"]={name="Is World",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 end;if Ent:IsWorld()then return 1 else return 0 end end,label=function(p)return string.format("Is World = %d",p)end}GateActions["entity_isongrnd"]={name="Is On Ground",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 end;if Ent:IsOnGround()then return 1 else return 0 end end,label=function(p)return string.format("Is On Ground = %d",p)end}GateActions["entity_isunderwater"]={name="Is Under Water",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 end;if Ent:WaterLevel()>0 then return 1 else return 0 end end,label=function(p)return string.format("Is Under Water = %d",p)end}GateActions["entity_angles"]={name="Angles",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"ANGLE"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return Angle(0,0,0)else return Ent:GetAngles()end end,label=function(p)return string.format("Angles = (%d,%d,%d)",p.p,p.y,p.r)end}GateActions["entity_material"]={name="Material",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"STRING"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return""else return Ent:GetMaterial()end end,label=function(p)return string.format("Material = %q",p)end}GateActions["entity_owner"]={name="Owner",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"ENTITY"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return WireLib.GetOwner(c)end;return WireLib.GetOwner(Ent)end,label=function(p,Ent)return string.format("owner(%s) = %s",Ent,tostring(p))end}GateActions["entity_isheld"]={name="Is Player Holding",description="Outputs 1 if a player is holding the object with the physgun, gravgun, or use key.",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 end;if Ent:IsPlayerHolding()then return 1 else return 0 end end,label=function(p)return string.format("Is Player Holding = %d",p)end}GateActions["entity_isonfire"]={name="Is On Fire",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 end;if Ent:IsOnFire()then return 1 else return 0 end end,label=function(p)return string.format("Is On Fire = %d",p)end}GateActions["entity_isweapon"]={name="Is Weapon",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 end;if Ent:IsWeapon()then return 1 else return 0 end end,label=function(p)return string.format("Is Weapon = %d",p)end}GateActions["player_invehicle"]={name="Is In Vehicle",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 end;if Ent:IsPlayer()&&Ent:InVehicle()then return 1 else return 0 end end,label=function(p)return string.format("Is In Vehicle = %d",p)end}GateActions["player_connected"]={name="Time Connected",description="Outputs the duration the player has been in the server in seconds.",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"NORMAL"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return 0 end;if Ent:IsPlayer()then return Ent:TimeConnected()else return 0 end end,label=function(p)return string.format("Time Connected = %d",p)end}GateActions["entity_aimentity"]={name="AimEntity",description="Gets the entity that the player is looking at.",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"ENTITY"},timed=true,output=function(c,Ent)if!Ent:IsValid()||!Ent:IsPlayer()then return NULL end;return Ent:GetEyeTraceNoCursor().Entity end,label=function(p)return string.format("Aim Entity = %s",tostring(p))end}GateActions["entity_aimenormal"]={name="AimNormal",description="Gets the aim direction of an entity.",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return Vector(0,0,0)end;if Ent:IsPlayer()then return Ent:GetAimVector()else return Ent:GetForward()end end,label=function(p,v)return string.format("Aim Normal (%s) = (%d,%d,%d)",v,p.x,p.y,p.z)end}GateActions["entity_aimedirection"]={name="AimDirection",description="Gets the aim direction of a player.",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()||!Ent:IsPlayer()then return Vector(0,0,0)end;return Ent:GetEyeTraceNoCursor().Normal end,label=function(p,v)return string.format("Aim Direction (%s) = (%d,%d,%d)",v,p.x,p.y,p.z)end}GateActions["entity_inertia"]={name="Inertia",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()||!Ent:GetPhysicsObject():IsValid()then return Vector(0,0,0)end;return Ent:GetPhysicsObject():GetInertia()end,label=function(p,v)return string.format("inertia(%s) = (%d,%d,%d)",Ent,p.x,p.y,p.z)end}GateActions["entity_setmass"]={name="Set Mass",inputs={"Ent","Val"},inputtypes={"ENTITY","NORMAL"},output=function(c,Ent,y)if!Ent:IsValid()then return end;if!Ent:GetPhysicsObject():IsValid()then return end;if!WireLib.CanTool(WireLib.GetOwner(c),Ent,"weight")then return end;if!y then y=Ent:GetPhysicsObject():GetMass()end;y=math.Clamp(y,0.001,50000)Ent:GetPhysicsObject():SetMass(y)end,label=function(p,Ent,y)return string.format("setMass(%s , %s)",Ent,y)end}GateActions["entity_equal"]={name="Equal",inputs={"A","B"},inputtypes={"ENTITY","ENTITY"},output=function(c,v,z)if v==z then return 1 else return 0 end end,label=function(p,v,z)return string.format("(%s  = =  %s) = %d",v,z,p)end}GateActions["entity_inequal"]={name="Inequal",inputs={"A","B"},inputtypes={"ENTITY","ENTITY"},output=function(c,v,z)if v!=z then return 1 else return 0 end end,label=function(p,v,z)return string.format("(%s  ! =  %s) = %d",v,z,p)end}GateActions["entity_setcol"]={name="Set Color",inputs={"Ent","Col"},inputtypes={"ENTITY","VECTOR"},output=function(c,Ent,A)if!Ent:IsValid()then return end;if!WireLib.CanTool(WireLib.GetOwner(c),Ent,"color")then return end;if!isvector(A)then A=Vector(255,255,255)end;Ent:SetColor(Color(A.x,A.y,A.z,255))end,label=function(p,Ent,A)if!isvector(A)then A=Vector(0,0,0)end;return string.format("setColor(%s ,(%d,%d,%d) )",Ent,A.x,A.y,A.z)end}GateActions["entity_driver"]={name="Driver",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"ENTITY"},timed=true,output=function(c,Ent)if!Ent:IsValid()||!Ent:IsVehicle()then return NULL end;return Ent:GetDriver()end,label=function(p,v)local B="NULL"if p:IsValid()then B=p:Nick()end;return string.format("Driver: %s",B)end}GateActions["entity_clr"]={name="Color",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()then return Vector(0,0,0)end;local C=Ent:GetColor()return Vector(C.r,C.g,C.b)end,label=function(p,Ent)return string.format("color(%s) = (%d,%d,%d)",Ent,p.x,p.y,p.z)end}GateActions["entity_name"]={name="Name",description="Gets the name of a player.",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"STRING"},timed=true,output=function(c,Ent)if!Ent:IsValid()||!Ent:IsPlayer()then return""else return Ent:Nick()end end,label=function(p,Ent)return string.format("name(%s) = %s",Ent,p)end}GateActions["entity_aimpos"]={name="AimPosition",description="Gets the position that the player is looking at.",inputs={"Ent"},inputtypes={"ENTITY"},outputtypes={"VECTOR"},timed=true,output=function(c,Ent)if!Ent:IsValid()||!Ent:IsPlayer()then return Vector(0,0,0)end;return Ent:GetEyeTraceNoCursor().HitPos end,label=function(p)return string.format("Aim Position = (%f , %f , %f)",p.x,p.y,p.z)end}GateActions["entity_select"]={name="Select",inputs={"Choice","A","B","C","D","E","F","G","H"},inputtypes={"NORMAL","ENTITY","ENTITY","ENTITY","ENTITY","ENTITY","ENTITY","ENTITY","ENTITY"},outputtypes={"ENTITY"},output=function(c,D,...)math.Clamp(D,1,8)return({...})[D]end,label=function(p,D)return string.format("select(%s) = %s",D,p)end}GateActions["entity_bearing"]={name="Bearing",description="Gets the angle along the X, Y plane from the entity to the position.",inputs={"Entity","Position"},inputtypes={"ENTITY","VECTOR"},outputtypes={"NORMAL"},timed=true,output=function(c,Entity,E)if!Entity:IsValid()then return 0 end;E=Entity:WorldToLocal(E)return 180/math.pi*math.atan2(E.y,E.x)end,label=function(p,Entity,E)return Entity..":Bearing("..E..") = "..p end}GateActions["entity_elevation"]={name="Elevation",description="Gets the difference in elevation from the entity to the position.",inputs={"Entity","Position"},inputtypes={"ENTITY","VECTOR"},outputtypes={"NORMAL"},timed=true,output=function(c,Entity,E)if!Entity:IsValid()then return 0 end;E=Entity:WorldToLocal(E)local F=E:Length()return 180/math.pi*math.asin(E.z/F)end,label=function(p,Entity,E)return Entity..":Elevation("..E..") = "..p end}GateActions["entity_heading"]={name="Heading",description="Gets the elevation and bearing from the entity to the position.",inputs={"Entity","Position"},inputtypes={"ENTITY","VECTOR"},outputs={"Bearing","Elevation","Heading"},outputtypes={"NORMAL","NORMAL","ANGLE"},timed=true,output=function(c,Entity,E)if!Entity:IsValid()then return 0,0,Angle(0,0,0)end;E=Entity:WorldToLocal(E)local G=180/math.pi*math.atan2(E.y,E.x)local F=E:Length()elevation=180/math.pi*math.asin(E.z/F)return G,elevation,Angle(G,elevation,0)end,label=function(p,Entity,E)return Entity..":Heading("..E..") = "..tostring(p.Heading)end}GateActions()
--addons/!lpakr_out/lua/wire/client/wire_filebrowser.lua:
local a={}AccessorFunc(a,"m_strRootName","RootName")AccessorFunc(a,"m_strRootPath","RootPath")AccessorFunc(a,"m_strWildCard","WildCard")AccessorFunc(a,"m_tFilter","FileTyps")AccessorFunc(a,"m_strOpenPath","OpenPath")AccessorFunc(a,"m_strOpenFile","OpenFile")AccessorFunc(a,"m_strOpenFilename","OpenFilename")AccessorFunc(a,"m_nListSpeed","ListSpeed")AccessorFunc(a,"m_nMaxItemsPerPage","MaxItemsPerPage")AccessorFunc(a,"m_nPage","Page")local b={["\n"]="",["\r"]="",["\\"]="/",["//"]="/"}local function c(d,e)local f=""if isstring(d)&&d!=""then f=d;if isstring(e)&&e!=""then f=d.."/"..e end else if isstring(e)&&e!=""then f=e end end;return f end;local function g(h,i,j)if!isstring(h)||h==""then return end;local k=h;for l,m in pairs(b)do for n=1,#string.Explode(l,k)do if!string.match(k,l)then break end;k=string.gsub(k,l,m)end end;k=string.Trim(k)k=string.Trim(k,"/")if IsValid(i)then i:SetText(k)end;local o=#string.Explode("/",k)for n=1,o do if!file.IsDir(c(j,k),"GAME")then k=string.GetPathFromFilename(k)k=string.Trim(k,"/")end end;k=string.Trim(k,"/")if k==""then return end;return k end;local function p(q,r)q:SetEnabled(r)q:SetMouseInputEnabled(r)end;local function s(f,t,u)local v={}if istable(t)then for l,m in ipairs(t)do table.Add(v,file.Find(c(f,m),u||"GAME"))end else table.Add(v,file.Find(c(f,tostring(t)),u||"GAME"))end;table.sort(v)return v end;local function w(self,f)if!IsValid(self)then return end;f=c(self.m_strRootPath,f)local x=self.Tree:Root()if!IsValid(x)then return end;if!IsValid(x.ChildNodes)then return end;local y=x.ChildNodes:GetChildren()local z=nil;local A=""self.NotUserPressed=true;local B=string.Explode("/",f)for l,m in ipairs(B)do if A==""then A=string.lower(m)else A=A.."/"..string.lower(m)if!IsValid(z)then continue end;if!IsValid(z.ChildNodes)then continue end;y=z.ChildNodes:GetChildren()end;local C=false;for D,E in pairs(y)do if!IsValid(E)then continue end;local f=string.lower(E.m_strFolder)if A==""then break end;if f!=A||C then E:SetExpanded(false)continue end;if l==#B then self.Tree:SetSelectedItem(E)end;E:SetExpanded(true)z=E;C=true end end;self.NotUserPressed=false end;local function F(self,f)if!IsValid(self)then return end;self.m_strOpenPath=f;f=c(self.m_strRootPath,f)self.oldpage=nil;self.Files=s(f,self.m_tFilter,self.m_strWildCard)self.m_nPage=0;self.m_nPageCount=math.ceil(#self.Files/self.m_nMaxItemsPerPage)self.PageMode=self.m_nPageCount>1;self.PageChoosePanel:SetVisible(self.PageMode)if self.m_nPageCount<=0||!self.PageMode then self.m_nPageCount=1;self:SetPage(1)return end;self.PageChooseNumbers:Clear(true)self.PageChooseNumbers.Buttons={}for n=1,self.m_nPageCount do self.PageChooseNumbers.Buttons[n]=self.PageChooseNumbers:Add("DButton")local q=self.PageChooseNumbers.Buttons[n]q:SetWide(self.PageButtonSize)q:Dock(LEFT)q:SetText(tostring(n))q:SetVisible(false)q:SetToolTip("Page "..n.." of "..self.m_nPageCount)q.DoClick=function(G)self:SetPage(n)self:LayoutPages(true)end end;self:SetPage(1)end;function a:Init()self.TimedpairsName="wire_filebrowser_items_"..tostring({})self.PageButtonSize=20;self:SetListSpeed(6)self:SetMaxItemsPerPage(200)self.m_nPageCount=1;self.m_strOpenPath=nil;self.m_strOpenFile=nil;self.m_strOpenFilename=nil;self:SetDrawBackground(false)self.FolderPathPanel=self:Add("DPanel")self.FolderPathPanel:DockMargin(0,0,0,3)self.FolderPathPanel:SetTall(20)self.FolderPathPanel:Dock(TOP)self.FolderPathPanel:SetDrawBackground(false)self.FolderPathText=self.FolderPathPanel:Add("DTextEntry")self.FolderPathText:DockMargin(0,0,3,0)self.FolderPathText:Dock(FILL)self.FolderPathText.OnEnter=function(G)self:SetOpenPath(G:GetValue())end;self.RefreshIcon=self.FolderPathPanel:Add("DImageButton")self.RefreshIcon:SetImage("icon16/arrow_refresh.png")self.RefreshIcon:SetWide(20)self.RefreshIcon:Dock(RIGHT)self.RefreshIcon:SetToolTip("Refresh")self.RefreshIcon:SetStretchToFit(false)self.RefreshIcon.DoClick=function()self:Refresh()end;self.FolderPathIcon=self.FolderPathPanel:Add("DImageButton")self.FolderPathIcon:SetImage("icon16/folder_explore.png")self.FolderPathIcon:SetWide(20)self.FolderPathIcon:Dock(RIGHT)self.FolderPathIcon:SetToolTip("Open Folder")self.FolderPathIcon:SetStretchToFit(false)self.FolderPathIcon.DoClick=function()self.FolderPathText:OnEnter()end;self.NotUserPressed=false;self.Tree=vgui.Create("DTree")self.Tree:SetClickOnDragHover(false)self.Tree.OnNodeSelected=function(H,E)local f=E.m_strFolder;if!f then return end;f=string.sub(f,#self.m_strRootPath+1)f=string.Trim(f,"/")if!self.NotUserPressed then self.FolderPathText:SetText(f)end;if self.m_strOpenPath==f then return end;F(self,f)end;self.PagePanel=vgui.Create("DPanel")self.PagePanel:SetDrawBackground(false)self.PageChoosePanel=self.PagePanel:Add("DPanel")self.PageChoosePanel:DockMargin(0,0,0,0)self.PageChoosePanel:SetTall(self.PageButtonSize)self.PageChoosePanel:Dock(BOTTOM)self.PageChoosePanel:SetDrawBackground(false)self.PageChoosePanel:SetVisible(false)self.PageLastLeftButton=self.PageChoosePanel:Add("DButton")self.PageLastLeftButton:SetWide(self.PageButtonSize)self.PageLastLeftButton:Dock(LEFT)self.PageLastLeftButton:SetText("<<")self.PageLastLeftButton.DoClick=function(G)self:SetPage(1)end;self.PageLastRightButton=self.PageChoosePanel:Add("DButton")self.PageLastRightButton:SetWide(self.PageButtonSize)self.PageLastRightButton:Dock(RIGHT)self.PageLastRightButton:SetText(">>")self.PageLastRightButton.DoClick=function(G)self:SetPage(self.m_nPageCount)end;self.PageLeftButton=self.PageChoosePanel:Add("DButton")self.PageLeftButton:SetWide(self.PageButtonSize)self.PageLeftButton:Dock(LEFT)self.PageLeftButton:SetText("<")self.PageLeftButton.DoClick=function(G)if self.m_nPage<=1||!self.PageMode then self.m_nPage=1;return end;self:SetPage(self.m_nPage-1)end;self.PageRightButton=self.PageChoosePanel:Add("DButton")self.PageRightButton:SetWide(self.PageButtonSize)self.PageRightButton:Dock(RIGHT)self.PageRightButton:SetText(">")self.PageRightButton.DoClick=function(G)if self.m_nPage>=self.m_nPageCount||!self.PageMode then self.m_nPage=self.m_nPageCount;return end;self:SetPage(self.m_nPage+1)end;self.PageChooseNumbers=self.PageChoosePanel:Add("DPanel")self.PageChooseNumbers:DockMargin(0,0,0,0)self.PageChooseNumbers:SetSize(self.PageChoosePanel:GetWide()-60,self.PageChoosePanel:GetTall())self.PageChooseNumbers:Center()self.PageChooseNumbers:SetDrawBackground(false)self.PageLoadingProgress=self.PagePanel:Add("DProgress")self.PageLoadingProgress:DockMargin(0,0,0,0)self.PageLoadingProgress:SetTall(self.PageButtonSize)self.PageLoadingProgress:Dock(BOTTOM)self.PageLoadingProgress:SetVisible(false)self.PageLoadingLabel=self.PageLoadingProgress:Add("DLabel")self.PageLoadingLabel:SizeToContents()self.PageLoadingLabel:Center()self.PageLoadingLabel:SetText("")self.PageLoadingLabel:SetPaintBackground(false)self.PageLoadingLabel:SetDark(true)self.List=self.PagePanel:Add("DListView")self.List:Dock(FILL)self.List:SetMultiSelect(false)local I=self.List:AddColumn("Name")I:SetMinWidth(150)I:SetWide(200)self.List.OnRowSelected=function(H,J,K)local L=K.m_strFilename;local f=K.m_strPath;local file=K.m_strFile;self.m_strOpenFilename=L;self.m_strOpenFile=file;self:DoClick(file,f,L,H,K)end;self.List.DoDoubleClick=function(H,J,K)local L=K.m_strFilename;local f=K.m_strPath;local file=K.m_strFile;self.m_strOpenFilename=L;self.m_strOpenFile=file;self:DoDoubleClick(file,f,L,H,K)end;self.List.OnRowRightClick=function(H,J,K)local L=K.m_strFilename;local f=K.m_strPath;local file=K.m_strFile;self.m_strOpenFilename=L;self.m_strOpenFile=file;self:DoRightClick(file,f,L,H,K)end;self.SplitPanel=self:Add("DHorizontalDivider")self.SplitPanel:Dock(FILL)self.SplitPanel:SetLeft(self.Tree)self.SplitPanel:SetRight(self.PagePanel)self.SplitPanel:SetLeftWidth(200)self.SplitPanel:SetLeftMin(150)self.SplitPanel:SetRightMin(300)self.SplitPanel:SetDividerWidth(3)end;function a:Refresh()local file=self:GetOpenFile()local M=self:GetPage()self.bSetup=self:Setup()self:SetOpenFile(file)self:SetPage(M)end;function a:UpdatePageToolTips()self.PageLeftButton:SetToolTip("Previous Page ("..self.m_nPage-1 .." of "..self.m_nPageCount..")")self.PageRightButton:SetToolTip("Next Page ("..self.m_nPage+1 .." of "..self.m_nPageCount..")")self.PageLastRightButton:SetToolTip("Last Page ("..self.m_nPageCount.." of "..self.m_nPageCount..")")self.PageLastLeftButton:SetToolTip("First Page (1 of "..self.m_nPageCount..")")end;function a:LayoutPages(N)if!self.PageChoosePanel:IsVisible()then self.oldpage=nil;return end;local O,P=self.PageRightButton:GetPos()local Q=O-self.PageLeftButton:GetWide()-40;if Q<=0||N then self.oldpage=nil;self:InvalidateLayout()return end;if self.oldpage==self.m_nPage&&self.oldpage&&self.m_nPage then return end;self.oldpage=self.m_nPage;if self.m_nPage>=self.m_nPageCount then p(self.PageLeftButton,true)p(self.PageRightButton,false)p(self.PageLastLeftButton,true)p(self.PageLastRightButton,false)elseif self.m_nPage<=1 then p(self.PageLeftButton,false)p(self.PageRightButton,true)p(self.PageLastLeftButton,false)p(self.PageLastRightButton,true)else p(self.PageLeftButton,true)p(self.PageRightButton,true)p(self.PageLastLeftButton,true)p(self.PageLastRightButton,true)end;local R=math.ceil(math.floor(Q/self.PageButtonSize)/2)local S=math.Clamp(self.m_nPage,R,self.m_nPageCount-R+1)local T=0;for n=1,self.m_nPageCount do local q=self.PageChooseNumbers.Buttons[n]if!IsValid(q)then continue end;if S<n+R&&S>=n-R+1 then q:SetVisible(true)p(q,true)T=T+1 else q:SetVisible(false)p(q,false)end;q.Depressed=false end;local U=self.PageChooseNumbers.Buttons[self.m_nPage]if IsValid(U)then U.Depressed=true;U:SetMouseInputEnabled(false)end;self.PageChooseNumbers:SetWide(T*self.PageButtonSize)self.PageChooseNumbers:Center()end;function a:AddColumns(...)local I={}for l,m in ipairs({...})do I[l]=self.List:AddColumn(m)end;return I end;function a:Think()if self.SplitPanel:GetDragging()then self.oldpage=nil;self:InvalidateLayout()end;if!self.bSetup then self.bSetup=self:Setup()end end;function a:PerformLayout()self:LayoutPages()self.Tree:InvalidateLayout()self.List:InvalidateLayout()local V=self:GetWide()-self.SplitPanel:GetRightMin()-self.SplitPanel:GetDividerWidth()local W=self.SplitPanel:GetLeftWidth(V)if W>V then self.SplitPanel:SetLeftWidth(V)end;self.Tree:OnMouseWheeled(0)self.List:OnMouseWheeled(0)if!self.PageLoadingProgress:IsVisible()then return end;self.PageLoadingLabel:SizeToContents()self.PageLoadingLabel:Center()end;function a:Setup()if!self.m_strRootName then return false end;if!self.m_strRootPath then return false end;WireLib.TimedpairsStop(self.TimedpairsName)self.m_strOpenPath=nil;self.m_strOpenFile=nil;self.m_strOpenFilename=nil;self.oldpage=nil;self.Tree:Clear(true)if IsValid(self.Root)then self.Root:Remove()end;self.Root=self.Tree.RootNode:AddFolder(self.m_strRootName,self.m_strRootPath,self.m_strWildCard||"GAME",false)return true end;function a:SetOpenFilename(X)if!isstring(X)then X=""end;self.m_strOpenFilename=X;self.m_strOpenFile=c(self.m_strOpenPath,self.m_strOpenFilename)end;function a:SetOpenPath(f)self.Root:SetExpanded(true)f=g(f,self.FolderPathText,self.m_strRootPath)||""if self.m_strOpenPath==f then return end;self.oldpage=nil;w(self,f)self.m_strOpenPath=f;self.m_strOpenFile=c(self.m_strOpenPath,self.m_strOpenFilename)end;function a:SetOpenFile(file)if!isstring(file)then file=""end;self:SetOpenPath(string.GetPathFromFilename(file))self:SetOpenFilename(string.GetFileFromFilename("/"..file))end;function a:SetPage(M)if M<1 then return end;if M>self.m_nPageCount then return end;if M==self.m_nPage then return end;WireLib.TimedpairsStop(self.TimedpairsName)self.List:Clear(true)self.m_nPage=M;self:UpdatePageToolTips()local Y;if self.PageMode then Y={}for n=1,self.m_nMaxItemsPerPage do local Z=n+self.m_nMaxItemsPerPage*(M-1)local _=self.Files[Z]if!_ then break end;Y[n]=_ end else Y=self.Files end;local a0=0;local a1=#Y;local a2=a1>self.m_nListSpeed*5;self.PageLoadingProgress:SetVisible(a2)if a1<=0 then self.PageLoadingProgress:SetVisible(false)return end;self.PageLoadingProgress:SetFraction(a0)self.PageLoadingLabel:SetText("0 of "..a1 .." files found.")self.PageLoadingLabel:SizeToContents()self.PageLoadingLabel:Center()self:InvalidateLayout()WireLib.Timedpairs(self.TimedpairsName,Y,self.m_nListSpeed,function(J,L,self)if!IsValid(self)then return false end;if!IsValid(self.List)then return false end;local file=c(self.m_strOpenPath,L)local a3,a4,a5=self:LineData(J,file,self.m_strOpenPath,L)if a4 then return end;if a5 then return false end;local K=self.List:AddLine(L,unpack(a3||{}))if!IsValid(K)then return end;K.m_strPath=self.m_strOpenPath;K.m_strFilename=L;K.m_strFile=file;if self.m_strOpenFile==file then self.List:SelectItem(K)end;self:OnLineAdded(J,K,file,self.m_strOpenPath,L)a0=J/a1;if!IsValid(self.PageLoadingProgress)then return end;if!a2 then return end;self.PageLoadingProgress:SetFraction(a0)self.PageLoadingLabel:SetText(J.." of "..a1 .." files found.")self.PageLoadingLabel:SizeToContents()self.PageLoadingLabel:Center()end,function(J,L,self)if!IsValid(self)then return end;a0=1;if!IsValid(self.PageLoadingProgress)then return end;if!a2 then return end;self.PageLoadingProgress:SetFraction(a0)self.PageLoadingLabel:SetText(J.." of "..a1 .." files found.")self.PageLoadingLabel:SizeToContents()self.PageLoadingLabel:Center()self.PageLoadingProgress:SetVisible(false)self:InvalidateLayout()end,self)end;function a:DoClick(file,f,L)end;function a:DoDoubleClick(file,f,L)end;function a:DoRightClick(file,f,L)end;function a:LineData(J,file,f,L)return end;function a:OnLineAdded(J,K,file,f,L)return end;vgui.Register("wire_filebrowser",a,"DPanel")
--addons/!lpakr_out/lua/wire/client/gmod_tool_auto.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/customspawnmenu.lua:
local a={}AccessorFunc(a,"m_TabID","TabID")local b=CreateConVar("wire_tool_menu_expand_all",0,{FCVAR_ARCHIVE})local c=CreateConVar("wire_tool_menu_separate_wire_extras",1,{FCVAR_ARCHIVE})local d=CreateConVar("wire_tool_menu_hide_duplicates",0,{FCVAR_ARCHIVE})local e=CreateConVar("wire_tool_menu_custom_menu_for_all_tabs",0,{FCVAR_ARCHIVE})local f=CreateConVar("wire_tool_menu_tab_width",-1,{FCVAR_ARCHIVE})local g=CreateConVar("wire_tool_menu_horizontal_divider_width",0.28,{FCVAR_ARCHIVE})local h=CreateConVar("wire_tool_menu_custom_icons",1,{FCVAR_ARCHIVE})local i=CreateConVar("wire_tool_menu_autocollapse",0,{FCVAR_ARCHIVE})local function j(k,l)for m=1,#l do if l[m].m_bExpanded!=k then l[m]:SetExpanded(k)if l[m].WireCookieText then cookie.Set(l[m].WireCookieText,k&&1||0)end end;if l[m].ChildNodes then j(k,l[m].ChildNodes:GetChildren())end end end;local function n(l)for m=1,#l do local o=cookie.GetNumber(l[m].WireCookieText)if o&&o==1 then l[m]:SetExpanded(o&&o==1)if l[m].ChildNodes then n(l[m].ChildNodes:GetChildren())end else l[m]:SetExpanded(false)end end end;function a:Init()self.Divider=vgui.Create("DHorizontalDivider",self)self.Divider:Dock(FILL)self.Divider:SetDividerWidth(6)local p=f:GetInt()local q=g:GetFloat()if p>ScrW()*0.6 then p=ScrW()*0.6 elseif p==-1 then p=390;if ScrW()>1600 then p=548 elseif ScrW()>1280 then p=460 end elseif p<390 then p=390 end;if p!=f:GetInt()then q=0.28;RunConsoleCommand("wire_tool_menu_tab_width",p)RunConsoleCommand("wire_tool_menu_horizontal_divider_width",q)end;self:SetWide(p)self.Divider:SetLeftWidth(p*q)local r=self.Divider.OnMouseReleased;function self.Divider.OnMouseReleased(...)local s=math.Round(self.Divider:GetLeftWidth()/self:GetWide(),2)RunConsoleCommand("wire_tool_menu_horizontal_divider_width",s)r(...)end;local t=vgui.Create("DPanel")self.Divider:SetLeft(t)local u=vgui.Create("DPanel",t)u:SetTall(44)u:DockPadding(2,2,2,2)u:Dock(TOP)self.SearchBox=vgui.Create("DTextEntry",u)self.SearchBox:DockMargin(2,2,2,0)self.SearchBox:Dock(TOP)self:SetupSearchbox()local v=vgui.Create("DCheckBoxLabel",u)self.List=vgui.Create("DTree",t)v:SetText("Expand All")v:SetConVar("wire_tool_menu_expand_all")v:DockMargin(4,4,0,0)v:Dock(BOTTOM)local w=true;local x=self;local y;function v:OnChange(z)if y==z then return end;y=z;local A=x.List:Root().ChildNodes:GetChildren()if w then w=false;n(A)else j(z,A)end end;v.Label:SetDark(true)self.List:Dock(FILL)self.SearchList=vgui.Create("DListView",t)local B,C=self.List:GetPos()local D,E=self.List:GetSize()self.SearchList:SetPos(B+D,160)self.SearchList:SetSize(D,E)self.SearchList:SetVisible(false)self.SearchList:AddColumn("Name")self.SearchList:AddColumn("Category")self.SearchList:SetMultiSelect(false)function self.SearchList:OnClickLine(F)local G=self:GetSelected()if G&&next(G)then G[1]:SetSelected(false)end;F:SetSelected(true)spawnmenu.ActivateTool(F.Name)end;self.Content=vgui.Create("DCategoryList")self.Divider:SetRight(self.Content)local H=self.SearchList;function t:PerformLayout()H:SetWide(self:GetWide())end;self.ToolTable={}self.OriginalToolTable={}self.CategoryLookup={}end;function a:ReloadEverything()self.List:Root():Remove()self.List:Init()self.SearchList:Clear()self.SearchBox:SetValue("")self.SearchBox:OnTextChanged()self.CategoryLookup={}self.ToolTable={}self:LoadToolsFromTable(self.OriginalToolTable)n(self.List:Root().ChildNodes:GetChildren())end;function a:SetupSearchbox()local I=vgui.Create("DImageButton",self.SearchBox)I:SetMaterial("icon16/cross.png")local J=self.SearchBox;function I:DoClick()J:SetValue("")J:OnTextChanged()J:SetValue("Search...")end;I:DockMargin(2,2,4,2)I:Dock(RIGHT)I:SetSize(14,10)I:SetVisible(false)self.SearchBox.clearsearch=I;local x=self;function self.SearchBox:OnEnter(K)local L=#x.SearchList:GetLines()if L>0 then local F=x.SearchList:GetSelectedLine()||0;if K then if L>F then x.SearchList:OnClickLine(x.SearchList:GetLine(F+1))else x.SearchList:OnClickLine(x.SearchList:GetLine(1))end elseif F==0 then x.SearchList:OnClickLine(x.SearchList:GetLine(1))end end end;local r=self.SearchBox.OnGetFocus;function self.SearchBox:OnGetFocus()if self:GetValue()=="Search..."then self:SetValue("")end;r(self)end;local r=self.SearchBox.OnLoseFocus;function self.SearchBox:OnLoseFocus()if self.Tabbed then self:RequestFocus()self.Tabbed=nil else if self:GetValue()==""then timer.Simple(0,function()self:SetValue("Search...")end)end;r(self)end end;local r=self.SearchBox.OnKeyCodeTyped;function self.SearchBox:OnKeyCodeTyped(M)if M==67 then self:OnEnter(true)self.Tabbed=true else r(self,M)end end;self.SearchBox:SetValue("Search...")local N;function self.SearchBox:OnTextChanged()timer.Remove("wire_customspawnmenu_hidesearchbox")local O=self:GetValue()if O!=""then if!N then N=true;local B,C=x.List:GetPos()local D,E=x.List:GetSize()x.SearchList:SetPos(B+D,C)x.SearchList:MoveTo(B,C,0.1,0,1)x.SearchList:SetSize(D,E)x.SearchList:SetVisible(true)self.clearsearch:SetVisible(true)end;local P=x:Search(O)x.SearchList:Clear()for m=1,#P do local Q=P[m]local F=x.SearchList:AddLine(Q.item.Text,Q.item.Category)F.Name=Q.item.ItemName;F.WireFavouritesCookieText=Q.item.WireFavouritesCookieText;function F:OnRightClick()x.SearchList:RequestFocus()local R=DermaMenu()local o=cookie.GetNumber(self.WireFavouritesCookieText)if o&&o==1 then R:AddOption("Remove from favourites",function()cookie.Set(self.WireFavouritesCookieText,0)x:ReloadEverything()end)else R:AddOption("Add to favourites",function()cookie.Set(self.WireFavouritesCookieText,1)x:ReloadEverything()end)end;R:Open()return true end end else if N then N=false;local B,C=x.List:GetPos()local D,E=x.List:GetSize()x.SearchList:SetPos(B,C)x.SearchList:MoveTo(B+D,C,0.1,0,1)x.SearchList:SetSize(D,E)timer.Create("wire_customspawnmenu_hidesearchbox",0.1,1,function()if IsValid(x)then x.SearchList:SetVisible(false)end end)self.clearsearch:SetVisible(false)end;x.SearchList:Clear()end end end;local S=string.find;local T=table.SortByMember;local U=string.lower;local V=language.GetPhrase;local W=string.gsub;function a:Search(O)O=U(O)local P={}for X,Y in pairs(self.ToolTable)do for Z,_ in pairs(Y)do local a0=V(W(_.Text,"^#",""))local a1=U(a0)if S(a1,O,1,true)&&!S(a1,"(legacy)",1,true)&&!_.Alias then P[#P+1]={item=_,dist=WireLib.levenshtein(O,a1)}end end end;T(P,"dist",true)return P end;local function a2(a3,O,a4,a5)local a6=a3:AddNode(O,a4)a6.Label:SetFont("DermaDefaultBold")a5="ToolMenu.Wire."..a5;a6.WireCookieText=a5;function a6:DoClick()if i:GetBool()then local x=a3.RootNode&&a3.RootNode.ChildNodes:GetChildren()||a3.ChildNodes:GetChildren()j(false,x)end;local o=!self.m_bExpanded;self:SetExpanded(o)cookie.Set(a5,o&&1||0)end;a6.Expander.DoClick=function()a6:DoClick()end;function a6:DoRightClick()local R=DermaMenu()local o=self.m_bExpanded;if o then R:AddOption("Collapse all",function()self:SetExpanded(false)j(false,self.ChildNodes:GetChildren())end)else R:AddOption("Expand all",function()self:SetExpanded(true)j(true,self.ChildNodes:GetChildren())end)end;R:Open()return true end;return a6 end;function a:CreateCategories()for a7,_ in pairs(self.ToolTable)do if istable(_)then local a8=_.ItemName;local a9=string.Explode("/",a8)if!c:GetBool()&&a9[1]=="Wire Extras"then table.remove(a9,1)_.ItemName=string.gsub(_.ItemName,"Wire Extras/","")_.Text=string.gsub(_.Text,"Wire Extras/","")a8=_.ItemName end;if#a9==1 then if!self.CategoryLookup[a8]then local a6=a2(self.List,_.Text,_.Icon,a8)self.CategoryLookup[a8]=a6 end else local a8=a9[1]if!self.CategoryLookup[a8]then local a6=a2(self.List,a8,nil,a8)self.CategoryLookup[a8]=a6 end;for m=2,#a9 do local aa=a9[m]local ab=table.concat(a9,"/",1,m)if!self.CategoryLookup[ab]then local a6=a2(self.CategoryLookup[table.concat(a9,"/",1,m-1)],aa,nil,ab)self.CategoryLookup[ab]=a6 end end end end end end;function a:AddToolToCategories(ac,Y)for m=1,#Y do local ad=Y[m]local ae=false;local af=table.Copy(ac)af.Alias=true;for Z,a8 in pairs(self.ToolTable)do if a8.ItemName==ad then ae=true;a8[#a8+1]=af;T(a8,"Text",true)end end;if!ae then local ag={ItemName=ad,Text=ad}ag[1]=af;self.ToolTable[#self.ToolTable+1]=ag end end end;function a:FixWireCategories()local G=table.Copy(self.ToolTable)for Z,a8 in pairs(G)do if istable(a8)then for Z,ac in pairs(a8)do if istable(ac)then local ah=cookie.GetNumber("ToolMenu.Wire.Favourites."..ac.ItemName)if ah&&ah==1 then self:AddToolToCategories(ac,{"Favourites"})end;if!d:GetBool()then local ai=weapons.Get("gmod_tool").Tool[ac.ItemName]if ai then if ai.Wire_MultiCategories then self:AddToolToCategories(ac,ai.Wire_MultiCategories)end end end end end end end end;function a:LoadToolsFromTable(aj)self.OriginalToolTable=table.Copy(aj)self.ToolTable=table.Copy(aj)if self.ToolTable[1].ItemName!="Favourites"then table.insert(self.ToolTable,1,{ItemName="Favourites",Text="Favourites",Icon="icon16/star.png"})elseif self.ToolTable[1].ItemName=="Favourites"then self.ToolTable[1].Icon="icon16/star.png"end;self:FixWireCategories()self:CreateCategories()for a7,_ in pairs(self.ToolTable)do if istable(_)then local ak=_.ItemName;local al=_.Text;_.ItemName=nil;_.Text=nil;_.Icon=nil;self:AddCategory(ak,al,_)end end end;function a:AddCategory(ak,al,am,an)local ao=self.CategoryLookup[ak]if!ao then return end;for a7,_ in pairs(am)do _.Category=al;_.CategoryID=an;local a4="icon16/wrench.png"if h:GetBool()then local ai=weapons.Get("gmod_tool").Tool[_.ItemName]if ai then if ai.Wire_ToolMenuIcon then a4=ai.Wire_ToolMenuIcon end end end;local ap=ao:AddNode(_.Text,a4)function ap:DoClick()spawnmenu.ActivateTool(self.Name)end;local x=self;function ap:DoRightClick()local R=DermaMenu()local o=cookie.GetNumber(self.WireFavouritesCookieText)if o&&o==1 then R:AddOption("Remove from favourites",function()cookie.Set(self.WireFavouritesCookieText,0)x:ReloadEverything()end)else R:AddOption("Add to favourites",function()cookie.Set(self.WireFavouritesCookieText,1)x:ReloadEverything()end)end;R:Open()return true end;ap.WireFavouritesCookieText="ToolMenu.Wire.Favourites.".._.ItemName;_.WireFavouritesCookieText=ap.WireFavouritesCookieText;ap.ControlPanelBuildFunction=_.CPanelFunction;ap.Command=_.Command;ap.Name=_.ItemName;ap.Controls=_.Controls;ap.Text=_.Text end;self:InvalidateLayout()end;function a:SetActive(aq)local ar=self.Content:GetCanvas():GetChildren()for a7,_ in pairs(ar)do _:SetVisible(false)end;self.Content:AddItem(aq)aq:SetVisible(true)aq:Dock(TOP)end;vgui.Register("WireToolPanel",a,"Panel")local as;local at={}local function au(av)av.first=true;function av:OnChange(z)if self.oldval==z then return end;self.oldval=z;if self.first then self.first=false;return end;timer.Simple(0.1,function()if IsValid(as)then as:ReloadEverything()end end)end end;local function aw(ax)local av=ax:CheckBox("Use wire's custom tool menu for all tabs","wire_tool_menu_custom_menu_for_all_tabs")av:SetToolTip("Requires rejoin to take effect")if WireLib.WireExtrasInstalled then local ay=ax:CheckBox("Separate Wire Extras","wire_tool_menu_separate_wire_extras")ay:SetToolTip("Whether or not to separate wire extras tools into its own category.")au(ay)end;local az=ax:CheckBox("Hide tool duplicates","wire_tool_menu_hide_duplicates")au(az)ax:Help("It makes sense to have certain tools in multiple categories at once. However, if you don't want this, you can disable it here. The tools will then only appear in their primary category.")local aA=ax:CheckBox("Use custom icons","wire_tool_menu_custom_icons")au(aA)aA:SetToolTip("If disabled, all tools will use the 'wrench' icon.")local aB=ax:CheckBox("Autocollapse","wire_tool_menu_autocollapse")aB:SetToolTip("If enabled, opening a category will collapse other categories.")local aC=ax:NumSlider("Tab width","wire_tool_menu_tab_width",300,3000,0)ax:Help([[Set the width of all tabs.
Defaults:
Screen width > 1600px: 548px,
Screen width > 1280px: 460px,
Screen width < 1280px: 390px.
Note:
Can't be smaller than the width of any non-custom tab, and can't be greater than screenwidth * 0.6.
Changes will take effect 3 seconds after you edit the value.]])function aC:ValueChanged(z)timer.Remove("wire_tab_width_changed")timer.Create("wire_tab_width_changed",3,1,function()at[1]:GetParent():SetWide(390)for m=1,#at do at[m]:SetWidth(math.Clamp(z,390,ScrW()*0.6))end;at[1]:GetParent():PerformLayout()end)end end;local aD={}function WireLib.registerTabForCustomMenu(aE)aD[aE]=true end;WireLib.registerTabForCustomMenu("Wire")local r;hook.Add("PopulateToolMenu","Wire_CustomSpawnMenu",function()spawnmenu.AddToolMenuOption("Wire","Options","Custom Tool Menu Options","Custom Tool Menu Options","","",aw)local aF=vgui.GetControlTable("ToolMenu")r=aF.AddToolPanel;function aF:AddToolPanel(ak,aG)if aD[aG.Name]||e:GetBool()==true then local aH=vgui.Create("WireToolPanel")if aG.Name=="Wire"then as=aH end;at[#at+1]=aH;aH:SetTabID(ak)aH:LoadToolsFromTable(aG.Items)self:AddSheet(aG.Label,aH,aG.Icon)self.ToolPanels[ak]=aH else return r(self,ak,aG)end end end)hook.Add("PostReloadToolsMenu","Wire_CustomSpawnMenu",function()local aF=vgui.GetControlTable("ToolMenu")aF.AddToolPanel=r;r=nil end)
--addons/!lpakr_out/lua/wos/advswl/core/sh_core.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/combat/cl_dualsaber.lua:
wOS=wOS||{}hook.Add("PostPlayerDraw","wOS.DualSaberFixed",function(a)local b=a:GetActiveWeapon()if!IsValid(b)||!b.IsDualLightsaber then return end;if!a.DualWielded||!IsValid(a.DualWielded)then a.DualWielded=ClientsideModel(b:GetSecWorldModel(),RENDERGROUP_BOTH)if!IsValid(a.DualWielded)then return end;a.DualWielded:SetNoDraw(true)end;a.DualWielded:SetModel(b:GetSecWorldModel())local c=a:LookupBone("ValveBiped.Bip01_L_Hand")if!c||c==-1 then return end;local d,e=a:GetBonePosition(c)if d==a:GetPos()then local f=a:GetBoneMatrix(16)if f then d=f:GetTranslation()e=f:GetAngles()end end;e:RotateAroundAxis(e:Forward(),180)e:RotateAroundAxis(e:Up(),30)e:RotateAroundAxis(e:Forward(),-5.7)e:RotateAroundAxis(e:Right(),92)if b.OffsetDualWield then d=d+e:Up()*b.OffsetDualWield.z+e:Right()*b.OffsetDualWield.x+e:Forward()*b.OffsetDualWield.y else d=d+e:Up()*-3.3+e:Right()*0.4+e:Forward()*-7 end;a.DualWielded:SetPos(d)a.DualWielded:SetAngles(e)local g=b:GetSecCrystalColorVector()g=Color(g.x,g.y,g.z)local h=a.DualWielded;a.DualWielded:DrawModel()if b.SecNoBlade then return end;local i=b.Blade2||wOS.GetBlade(b:GetBladeID2()||1,true)local j=10;local k=false;for l,m in pairs(h:GetAttachments())do if!string.match(m.name,"blade(%d+)")then continue end;local n=string.match(m.name,"blade(%d+)")if n&&h:LookupAttachment("blade"..n)>0 then j=j+1;k=true;rb655_RenderBladeExtended(b,n,g,false,j,i,h)end end;if!k then rb655_RenderBladeExtended(b,0,g,false,2,i,h)end end)
--addons/!lpakr_out/lua/wos/advswl/devestators/wos_devmaterialbuilding.lua:
return lpakr()()
--addons/!lpakr_out/lua/advdupe2/sh_codec.lua:
return lpakr()()
--addons/!lpakr_out/lua/advdupe2/cl_file.lua:
return lpakr()()
--addons/!lpakr_out/lua/advdupe2/cl_file.lua:
local function a(b,c)local d=net.ReadUInt(8)==1;net.ReadStream(nil,function(e)AdvDupe2.RemoveProgressBar()if!e then AdvDupe2.Notify("File was not saved!",NOTIFY_ERROR,5)return end;local f;if d then if LocalPlayer():GetInfo("advdupe2_auto_save_overwrite")!="0"then f=AdvDupe2.GetFilename(AdvDupe2.AutoSavePath,true)else f=AdvDupe2.GetFilename(AdvDupe2.AutoSavePath)end else f=AdvDupe2.GetFilename(AdvDupe2.SavePath)end;local g=file.Open(f,"wb","DATA")if!g then AdvDupe2.Notify("File was not saved!",NOTIFY_ERROR,5)return end;g:Write(e)g:Close()local h=false;if LocalPlayer():GetInfo("advdupe2_debug_openfile")=="1"then if!file.Exists(f,"DATA")then AdvDupe2.Notify("File does not exist",NOTIFY_ERROR)return end;local i=file.Open(f,"rb","DATA")if!i then AdvDupe2.Notify("File could not be read",NOTIFY_ERROR)return end;local j=i:Read(i:Size())i:Close()local k,l,m,n=AdvDupe2.Decode(j)if k then AdvDupe2.Notify("DEBUG CHECK: File successfully opens. No EOF errors.")else AdvDupe2.Notify("DEBUG CHECK: "..l,NOTIFY_ERROR)h=true end end;local o=string.StripExtension(string.GetFileFromFilename(f))if d then if IsValid(AdvDupe2.FileBrowser.AutoSaveNode)then local p=true;for q=1,#AdvDupe2.FileBrowser.AutoSaveNode.Files do if o==AdvDupe2.FileBrowser.AutoSaveNode.Files[q].Label:GetText()then p=false;break end end;if p then AdvDupe2.FileBrowser.AutoSaveNode:AddFile(o)AdvDupe2.FileBrowser.Browser.pnlCanvas:Sort(AdvDupe2.FileBrowser.AutoSaveNode)end end else AdvDupe2.FileBrowser.Browser.pnlCanvas.ActionNode:AddFile(o)AdvDupe2.FileBrowser.Browser.pnlCanvas:Sort(AdvDupe2.FileBrowser.Browser.pnlCanvas.ActionNode)end;if!h then AdvDupe2.Notify("File successfully saved!",NOTIFY_GENERIC,5)end end)end;net.Receive("AdvDupe2_ReceiveFile",a)local r=nil;function AdvDupe2.UploadFile(s,t)if r then AdvDupe2.Notify("Already opening file, please wait.",NOTIFY_ERROR)return end;if t==0 then s=AdvDupe2.DataFolder.."/"..s..".txt"elseif t==1 then s=AdvDupe2.DataFolder.."/-Public-/"..s..".txt"else s="adv_duplicator/"..s..".txt"end;if!file.Exists(s,"DATA")then AdvDupe2.Notify("File does not exist",NOTIFY_ERROR)return end;local u=file.Read(s)if!u then AdvDupe2.Notify("File could not be read",NOTIFY_ERROR)return end;local v=string.Explode("/",s)v=v[#v]v=string.sub(v,1,#v-4)local k,l,m,n=AdvDupe2.Decode(u)if k then net.Start("AdvDupe2_ReceiveFile")net.WriteString(v)r=net.WriteStream(u,function()r=nil;AdvDupe2.File=nil;AdvDupe2.RemoveProgressBar()end)net.SendToServer()AdvDupe2.LoadGhosts(l,m,n,v)else AdvDupe2.Notify("File could not be decoded. ("..l..") Upload Canceled.",NOTIFY_ERROR)end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/cl_init.lua:
srp=srp||{}include'shared.lua'include'cl_cvar.lua'require'outline'require'texture'texture.SetProxy'https://gmod-api.superiorservers.co/api/imageproxy/?url=%s&width=%i&height=%i&format=%s'
--addons/!lpakr_out/gamemodes/srp_base/gamemode/cl_cvar.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/table_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/util_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/controls/control_presets_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contenttypes/weapons_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/commrose_ui.lua:
local a={}DEFINE_BASECLASS'srp_window'function a:Init()self:MakePopup()self:SetSize(500,500)self:Center()self:AddPanel('srp_label',function(b)b:SetText'Comms Rose'b:Dock(FILL)b:SetFont'ui_header.r'b:SetContentAlignment(5)b:SetAlpha(0)b:AlphaTo(255,.5,0)self.name=b end)self.distance=150;self.options={}self.mapped_options={}end;function a:SetText(c)self.name:SetText(c:upper())return self end;local d=Color(0,0,0,200)local e=Color(50,50,50,150)local f=col.white:Copy()function a:AddOption(g,h)return self:AddPanel('srp_button_rounded',function(i)i:SetDisabled(true,.5)i:SetAlpha(0)i:Center()i:SetText(h.name&&h.name:upper()||g:upper())i:SetTextColor(h.background||f)i:SetBackgroundColor(d)i:SetHoverColor(e)i:SetSize(100,40)i:LeftClick(function(j)if j.data.click then j.data.click(j,self)end end)i.data=h;self.last_x=0;self.last_y=0;self.mapped_ids={}self.options[g]=i;table.insert(self.mapped_options,i)end)end;function a:AddSpacer()local g='spacer_'..os.clock()return self:AddPanel('srp_panel',function(i)i:SetSize(100,40)i:SetVisible(false)i.Spacer=true;i.SpacerID=g;self.mapped_ids={}self.options[g]=i;table.insert(self.mapped_options,i)end)end;function a:Complete(k,l,m)self:PositionOptions(k,l,m)return self end;function a:RemoveOption(g)if self.options[g]then self.options[g]:Remove()end end;function a:PositionOptions(k,l,m)if!k&&!l then k,l=self:GetSize()end;local n=table.Count(self.options)local m=m||0;for o,p in ipairs(self.mapped_options)do if IsValid(p)then local q=math.rad(360*(o-m-1)/n)local r,s=self.distance*math.cos(q),self.distance*math.sin(q)p:MoveTo((k-100)*.5+r,(l-40)*.5+s,.2,0)p:AlphaTo(255,.5,0)self.mapped_ids[o]=p;p.id=o end end end;function a:Close()local k,l=self:GetSize()for o,p in ipairs(self.mapped_options)do if IsValid(p)then p:AlphaTo(0,.2,0)p:MoveTo((k-100)*.5,(l-40)*.5,.3,0)end end;self:SetMouseInputEnabled(false)self.name:AlphaTo(0,.2,0)timer.Simple(0.4,function()if IsValid(self)then self:Remove()end end)end;function a:Paint(k,l)end;vgui.Register('srp_commrose',table.Copy(a),'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/labelgroup_ui.lua:
local a={}local b=Color(0,0,0,150)function a:Init()self:DockMargin(0,0,0,0)self:DockPadding(1,1,1,1)self:SetBackgroundColor(b)self:SetBorderColor(col.transparent)self:AddPanel('srp_label',function(c)c:Dock(TOP)c:SetFont'ui_label.b'c:SetText'Title'c:SetContentAlignment(1)self.title=c end)self:AddPanel('srp_label',function(c)c:Dock(FILL)c:SetFont'ui_label.r'c:SetText'Subtext'c:SetContentAlignment(7)self.subtitle=c end)end;function a:SetTitle(d)self.title:SetText(d)end;function a:SetText(d)self.subtitle:SetText(d)end;vgui.Register('srp_labelgroup',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/pagination_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/selection_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/slider_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/ui/battlepass_items_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/ui/battlepass_purchase_ui.lua:
local a={}local b=Material'materials/galactic/ui/foods/pumpkin.png'local c=Color(30,92,163,125)function a:Init()self:SetBorderColor(col.grey_light)self:SetBackgroundColor(c)self:SetVisible(false)self:SetSize(500,140)self:AddPanel('DImage',function(d)d:Dock(LEFT)d:SetWide(100)d:DockMargin(15,15,15,15)d.Think=function(e)if!self.Icons then return end;if!e.NextThinking||e.NextThinking<CurTime()then e:SetMaterial(self.Icons[math.random(1,#self.Icons)])e.NextThinking=CurTime()+2 end end end)self:AddPanel('srp_panel',function(f)f:Dock(FILL)f:SetBackgroundColor(col.transparent)f:AddPanel('srp_label',function(d)d:Dock(TOP)d:SetText'Unlock Goodies'd:SetFont'ui_header.l'd:SetTall(40)end)f:AddPanel('srp_label',function(d)d:Dock(TOP)d:SetText'Purchase this pass now to receive all premium benefits!'d:SetFont'ui_label.l'd:SetWrap(true)d:SetTall(35)d:SetContentAlignment(7)self.info=d end)f:AddPanel('srp_button_rounded',function(g)g:Dock(RIGHT)g:SetWide(100)g:SetFont'SSRPForkAwesome'g:SetText(0xf09c,true)g:SetBackgroundColor(col.green)g:SetHoverColor(col.orange)g:SetBorderColor(col.green_dark)g:SetTextColor(col.white)g:DockMargin(0,0,0,0)g:LeftClick(function(e)e:SetDisabled(true,5)srp.notif.Confirm({title='Confirm',sub_text='Are you sure you want to purchase this?',header_color=col.red_dark,callback=function(h)if IsValid(self)then self:PurchaseUpgrade()end end})end)end)end)hook('OnStoreItemPurchased',self,self.CheckUpgrade)end;function a:Populate(i)self.battlepass=i;self.Icons=i.icons end;function a:OnPurchased(j)self._OnPurchased=j end;function a:_OnPurchased()end;function a:CheckUpgrade(h)if!self.battlepass then return end;if h&&h.Upgrade.UID!=self.battlepass.id then return end;self.upgrade=srp.shop.GetByUID(self.battlepass.id)self.upgraded=LocalPlayer():HasUpgrade(self.battlepass.id)self.upgradecost=self.battlepass.cost||1500;self:SetVisible(!self.upgraded)if h&&self.upgraded then self:_OnPurchased()end end;function a:PurchaseUpgrade()local k=LocalPlayer():GetCredits()-self.upgradecost;if k>=0 then cmd.Run('buyupgrade',self.upgrade.ID)else ba.ui.OpenAuthLink('/'..info.WebID..'/credits/'..LocalPlayer():SteamID()..'/'..math.abs(k))end end;function a:Paint(l,m)derma.SkinHook('Paint','RoundedPanel',self,l,m)end;vgui.Register('srp_battlepass_purchase',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buffs/ui/buffbox_ui.lua:
local a={}local b=col.grey_dark:Copy()b.a=200;function a:Init()self.m_bgColor=b;self.m_bdrColor=Color(250,250,250,100)self:SetAlpha(0)self:SetSize(64,64)self:DockPadding(10,5,10,15)self:DockMargin(1,0,1,0)self:AddPanel('DImage',function(c)c:Dock(FILL)self.img=c end)self:AddPanel('srp_label',function(d)d:SetPos(0,0)d:SetSize(64,60)d:SetContentAlignment(2)d:DockPadding(0,0,0,0)d:DockMargin(0,0,0,0)d:SetFont'ui_label.s'd:SetText'Buff Name'self.name=d end)end;function a:Populate(e,f)if e.name then self.name:SetText(e.name)end;if e.icon then self.img:SetMaterial(e.icon)end;if e.color then self.m_bdrColor=e.color end;if e.fill then self:DockPadding(1,1,1,1)self.name:SetVisible(false)self.PaintOver=self.PaintPercentage;self.fill=true end;self.duration=f.duration;self.endtime=f.endtime;self:Stop()self:AlphaTo(255,1,0)end;function a:Paint(g,h)surface.SetDrawColor(self.m_bgColor)surface.DrawRect(0,0,g,h)surface.SetDrawColor(self.m_bdrColor)surface.DrawOutlinedRect(0,0,g,h)self:PaintPercentage(g,h)end;local i=Color(255,255,255,150)function a:PaintPercentage(g,h)if!self.endtime||!self.duration then return end;draw.NoTexture()surface.SetDrawColor(255,255,255,15)local j=math.Clamp((self.endtime-CurTime())/self.duration,0,1)surface.DrawArc(g*0.5,h*0.5,0,g*2,0,360*(1-j),60)if self.fill then local k=math.max(self.endtime-CurTime(),0)draw.DrawText(math.Round(k),'ui_header.l',g/2,h/2-20,i,TEXT_ALIGN_CENTER)end end;function a:DoRemove()self:AlphaTo(0,1,0,function()if IsValid(self)then self:Remove()end end)end;vgui.Register('srp_buffbox',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buybacks/buyback_cl.lua:
srp.buyback=srp.buyback||{}srp.buyback.ui=srp.buyback.ui;function srp.buyback.Open()if IsValid(srp.buyback.ui)then srp.buyback.ui:Remove()end;srp.ui.Create('srp_buybacks',function(a)srp.buyback.ui=a end)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buybacks/buyback_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buybacks/ui/buyback_ui.lua:
local a={}local b=Material('galactic/ui/currency.png','smooth')function a:Init()self:DockMargin(0,0,0,0)self:SetTall(100)self:SetBackgroundColor(col.midnight_dark)self:AddPanel('srp_button_tag',function(c)c:Dock(LEFT)c:SetWide(225)c:SetBackgroundColor(col.transparent)c:SetHoverColor(col.transparent)c:SetBorderColor(col.transparent)c:SetFont'ui_header.r'c:SetContentAlignment(5)c:DockMargin(1,1,1,1)c.lbl:DockMargin(1,1,1,8)srp.ui.Create('srp_label',function(d)d:Dock(BOTTOM)d:SetContentAlignment(8)d:SetText'x0'd:SetParent(c.lbl)d:SetTall(30)self.ItemAmount=d end)self.Item=c end)self:AddPanel('srp_button_tag',function(c)c:Dock(LEFT)c:SetWide(225)c:SetBackgroundColor(col.transparent)c:SetHoverColor(col.transparent)c:SetBorderColor(col.transparent)c:SetFont'ui_header.r'c:SetContentAlignment(5)c:DockMargin(1,1,1,1)c.lbl:DockMargin(1,1,1,8)c:SetMaterial(b)c:SetText'Cashback'srp.ui.Create('srp_label',function(d)d:Dock(BOTTOM)d:SetContentAlignment(8)d:SetText'0RC'd:SetParent(c.lbl)d:SetTall(30)self.CashAmount=d end)self.Cashback=c end)self:AddPanel('srp_panel',function(c)c:Dock(FILL)c:SetBackgroundColor(col.transparent)c:DockMargin(10,10,10,10)c:AddPanel('srp_textinput_rounded',function(c)c:Dock(FILL)c:DockMargin(2,10,2,10)c:DisplayWangs(true,1)c:SetMinMax(1,100)c:OnChanged(function(e,f)self:SetMultiplier(f)end)self.Number=c end)c:AddPanel('srp_button_rounded',function(c)c:Dock(RIGHT)c:SetWide(52)c:SetText'Cashout'c:LeftClick(function()self:Send()end)end)end)end;function a:Populate(g)local h=srp.items.Get(g.itemid)self.itemid=g.itemid;self.buybackid=g.internal;self.itemcount=g.amount;self.cashback=g.cashback;self.inventorycount=LocalPlayer():GetInventoryItemCount(g.itemid)||1;self.maxMultiplier=math.floor(self.inventorycount/self.itemcount)self.Number:SetText'1'self.Number:SetMinMax(1,self.maxMultiplier)self.Item:SetMaterial(h.icon)self.Item:SetText(h.name||'')self:SetMultiplier(1)end;function a:Reset()self.inventorycount=LocalPlayer():GetInventoryItemCount(self.itemid)||1;self.maxMultiplier=math.floor(self.inventorycount/self.itemcount)self.Number:SetMinMax(1,self.maxMultiplier)self:SetMultiplier(self.multiplier)self.Number:SetText(self.multiplier)end;function a:SetMultiplier(i)self.multiplier=math.Clamp(i,1,self.maxMultiplier)local j=self.itemcount*self.multiplier;local k=self.cashback*self.multiplier;self.ItemAmount:SetText(string.Comma(j))self.CashAmount:SetText(string.Comma(k)..' RC')end;function a:Send()local j=self.itemcount*self.multiplier;local k=self.cashback*self.multiplier;net.Start'srp.buyback.Request'net.WriteUInt(self.buybackid,5)net.WriteUInt(self.multiplier,18)net.SendToServer()timer.Simple(0.2,function()if IsValid(self:Reset())then self:Reset()end end)end;vgui.Register('srp_buyback',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cards/cards_sh.lua:
srp.cards=srp.cards||{}srp.cards.cost=750;srp.cards.cardthemes={{name='Simple Card',icon='galactic/seasonal/card/cardfront'},{name='Sexy Body Builder',icon='galactic/seasonal/card/cardbuilder'},{name='Cool Dog',icon='galactic/seasonal/card/cardcooldog'},{name='Santa Pointing',icon='galactic/seasonal/card/cardcoolpoint'},{name='Cool Santa',icon='galactic/seasonal/card/cardcoolsanta'},{name='Coronaman',icon='galactic/seasonal/card/cardcorona'},{name='Doggo',icon='galactic/seasonal/card/carddoggo'},{name='Dog Shake Hand',icon='galactic/seasonal/card/carddoghand'},{name='Gamer',icon='galactic/seasonal/card/cardfat'},{name='Homies',icon='galactic/seasonal/card/cardgay'},{name='Money Man',icon='galactic/seasonal/card/cardmoneyman'},{name='Monke',icon='galactic/seasonal/card/cardmonkeyman'},{name='Santas Fat Sack',icon='galactic/seasonal/card/cardsantasack'},{name='Science',icon='galactic/seasonal/card/cardsciencethumb'},{name='Simp',icon='galactic/seasonal/card/cardsimp'},{name='Yellow Santa',icon='galactic/seasonal/card/cardyellowsanta'},{name='Dark Halloween',icon='galactic/seasonal/card/halloweendark'},{name='Boo',icon='galactic/seasonal/card/boo'},{name='Dabbing Ghost',icon='galactic/seasonal/card/dabbingghost'},{name='Haunted House',icon='galactic/seasonal/card/halloweenhouse'},{name='Haunted Mansion',icon='galactic/seasonal/card/halloweenmansion'},{name='Zombie Hand',icon='galactic/seasonal/card/risinghand'},{name='Grabbing Hands',icon='galactic/seasonal/card/grabbinghands'},{name='Valentine Bee',icon='galactic/seasonal/card/valentinesbee',valentines=true},{name='Valentine Hearts',icon='galactic/seasonal/card/valentineshearts',valentines=true}}function srp.cards.Get(a)return srp.cards.cardthemes[a]end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/selectionpanels/plate_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/cosmetics_cl.lua:
cosmetics=cosmetics||{}cosmetics.owned=cosmetics.owned||{}cosmetics.equipped=cosmetics.equipped||{}cosmetics.heart=utf8.char(0xf004)cosmetics.global=utf8.char(0xf0ac)local a={}function cosmetics.Clear()net.Start'cosmetics.Clear'net.SendToServer()end;function cosmetics.OnEquip(pl,b)if!IsValid(pl)||pl:IsBlocked()then return end;local c=cosmetics.Get(b,true)if!c then return end;if c:IsSeasonal()&&!cvar.GetValue('srp_cosmeticsseasons')then return end;if c:GetEffect()&&!cvar.GetValue('srp_cosmeticeffects')then return end;local d=c:GetEquipped(pl)if d then d:RemovePlayer(pl)hook.Run('OnCosmeticRemoved',pl,d,c)end;c:AddPlayer(pl)hook.Run('OnCosmeticEquipped',pl,c,d)end;function cosmetics.OnRemoved(pl,b)if!IsValid(pl)then return end;local c=cosmetics.Get(b,true)if!c then return end;c:RemovePlayer(pl)hook.Run('OnCosmeticRemoved',pl,c)end;function cosmetics.RegisterCallingCard(e,f)a[e]=f end;function cosmetics.GetCallingCard(e)return a[e]end;function PLAYER:GetCosmetics(e,g)g=g||'player'return cosmetics.equipped[pl]&&cosmetics.equipped[pl][e]&&cosmetics.equipped[pl][e][g]end;local h=col.white:Copy()local i={[TEXT_ALIGN_LEFT]=0,[TEXT_ALIGN_RIGHT]=1,[TEXT_ALIGN_CENTER]=0.5,[TEXT_ALIGN_TOP]=0,[TEXT_ALIGN_BOTTOM]=1}local j={}local k=col.black:Copy()local function l(m,n,o,p,q,r,s,t,u,v,w,x,y)surface.SetFont(p)local z,A=surface.GetTextSize(o)local B=i[v]||0;local C=i[w]||0;local D=z*B;local E=A*C;q=(q<1&&(m-D*2)*q||q-D)+s;r=(r<1&&(n-E)*r||r-E)+t;if x then draw.Box(q-y,r-y,z+y*2,A+y*2,x)end;surface.SetTextColor(u)surface.SetTextPos(q,r)surface.DrawText(o)end;local function F(self,m,n,G)local H=G:GetMeta('callingcard_overlay',nil)if!H then return end;surface.SetDrawColor(255,255,255,255)surface.SetMaterial(H)surface.DrawTexturedRect(0,0,m,n)end;cosmetics.RegisterCallingCard('default',function(self,m,n,G)local u=G:GetMeta('callingcard_textcolor',h)local I=G:GetMeta('callingcard_namepos',j)local J=G:GetMeta('callingcard_tagpos',j)local K=self.Player:GetTag()..' '..self.Player:Nick()F(self,m,n,G)l(m,n,K,I.font||'ui_header.rb',I.x||10,I.y||0.5,I.offsetx||0,I.offsety||-2,I.colour||u,TEXT_ALIGN_LEFT,TEXT_ALIGN_BOTTOM,I.blocky,I.blockpadding||4)if self.Tag then l(m,n,self.Tag,J.font||'ui_header.s',J.x||10,J.y||0.5,J.offsetx||0,J.offsety||2,J.colour||u,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP,J.blocky,J.blockpadding||4)end end)cosmetics.RegisterCallingCard('right',function(self,m,n,G)local u=G:GetMeta('callingcard_textcolor',h)local I=G:GetMeta('callingcard_namepos',j)local J=G:GetMeta('callingcard_tagpos',j)local K=self.Player:GetTag()..' '..self.Player:Nick()F(self,m,n,G)l(m,n,K,I.font||'ui_header.rb',m-10,I.y||0.5,I.offsetx||0,I.offsety||-2,I.colour||u,TEXT_ALIGN_RIGHT,TEXT_ALIGN_BOTTOM,I.blocky,I.blockpadding||4)if self.Tag then l(m,n,self.Tag,J.font||'ui_header.s',m-10,J.y||0.5,J.offsetx||0,J.offsety||2,J.colour||u,TEXT_ALIGN_RIGHT,TEXT_ALIGN_TOP,J.blocky,J.blockpadding||4)end end)cosmetics.RegisterCallingCard('centered',function(self,m,n,G)local u=G:GetMeta('callingcard_textcolor',h)local I=G:GetMeta('callingcard_namepos',j)local J=G:GetMeta('callingcard_tagpos',j)local K=self.Player:GetTag()..' '..self.Player:Nick()F(self,m,n,G)l(m,n,K,I.font||'ui_header.rb',I.x||0.5,I.y||0.5,I.offsetx||0,I.offsety||-2,I.colour||u,TEXT_ALIGN_CENTER,TEXT_ALIGN_BOTTOM,I.blocky,I.blockpadding||4)if self.Tag then l(m,n,self.Tag,J.font||'ui_header.s',J.x||0.5,J.y||0.5,J.offsetx||0,J.offsety||2,J.colour||u,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP,J.blocky,J.blockpadding||4)end end)local L='class C_BaseFlex'timer.Create('cosmetics.ApparelFix',1,0,function()for M,N in ipairs(ents.FindByClass('Class C_PhysPropClientside'))do if!IsValid(N)||!N.cosmetic then continue end;if!IsValid(N.pl)||N.preview then N:Remove()continue end;local pl=N.pl;local c=N.item;local O=c:GetBone()local P=O&&pl:LookupAttachment(c:GetBone())if P then N:SetParent(pl,P)N:SetLocalPos(c:GetPos())N:SetLocalAngles(c:GetAngles())else N:SetParent(pl)N:AddEffects(EF_BONEMERGE)end;if pl:GetClass()==L then N:SetNoDraw(true)elseif pl:IsPlayer()&&pl:IsBlocked()||pl==LocalPlayer()&&hook.Run('CanViewCosmeticItem',pl,c)==false then N:SetNoDraw(true)elseif c:CanView(pl)==false||pl.IsCloaked&&pl:IsCloaked()||pl.IsGhosted&&pl:IsGhosted()then N:SetNoDraw(true)elseif LocalPlayer():GetPos():Distance(N:GetPos())>1000||pl:IsPlayer()&&(!pl:Alive()||pl:GetObserverMode()!=OBS_MODE_NONE)then N:SetNoDraw(true)elseif IsValid(pl:GetVehicle())&&pl:GetVehicle().NoCosmetics then N:SetNoDraw(true)else N:SetNoDraw(false)end end end)matproxy.Add({name='CosmeticColor',init=function(self,Q,R)self.ResultTo=R.resultvar end,bind=function(self,Q,N)if!IsValid(N)then return end;local S=N:GetOwner()if!IsValid(S)||!S:IsPlayer()then return end;local col=S:GetWeaponColor()if!isvector(col)then return end;local T=(1+math.sin(CurTime()*5))*0.25;Q:SetVector(self.ResultTo,col+col*T)end})hook('CanViewCosmeticItem',function(pl,c)return isThirdPerson()&&pl:GetObserverMode()==OBS_MODE_NONE||pl:GetViewEntity()!=pl end)net('cosmetics.ClearItems',function()local c=net.ReadCosmetic(true)if c then c:ClearPlayers()c:SetOwned(false)hook.Run('OnCosmeticRemoved',LocalPlayer(),c)end end)net('cosmetics.SyncOwned',function()local U=net.ReadUInt(12)for V=1,U do local c=net.ReadCosmetic(true)if c then c:SetOwned(true)end end;hook.Run('OnLocalCosmeticsLoaded')end)net('cosmetics.SyncAll',function()if!cvar.GetValue('srp_cosmetics')then return end;for V=1,net.ReadUInt(12)do local c=net.ReadCosmetic(true)local W=net.ReadUInt(8)for X=1,W do local pl=net.ReadPlayer()if c&&IsValid(pl)&&pl:IsPlayer()then cosmetics.OnEquip(pl,c)end end end end)net('cosmetics.Equip',function()if cvar.GetValue('srp_cosmetics')then cosmetics.OnEquip(net.ReadPlayer(),net.ReadCosmetic())end end)net('cosmetics.Unequip',function()cosmetics.OnRemoved(net.ReadPlayer(),net.ReadCosmetic())end)local function Y(c)c:SetOwned(true)hook.Run('OnCosmeticPurchased',c)if c:GetMeta('Item')then srp.notif.FlashItemDrop(c:GetMeta('Item'),0)end end;net('cosmetics.Purchase',function()local e=net.ReadCosmetic()local c=cosmetics.Get(e,true)if!c then return end;if c.parentid then Y(cosmetics.Get(c.parentid,true))end;Y(c)end)net('cosmetics.Clear',function()local pl=net.ReadPlayer()if IsValid(pl)&&pl.cents then for M,Z in pairs(pl.cents)do if IsValid(Z)&&Z.item then Z.item:RemovePlayer(pl)end end end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/cosmetics_preset_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_colourizer_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_colourizer_ui.lua:
local a={}function a:Init()self:SetTitle'Change Colour'self:SetVisible(false)self:SetMouseInputEnabled(true)self:SetBackgroundColor(col.midnight)self:SetDraggable(false)self:AddPanel('DColorMixer',function(b)b:Dock(FILL)b:SetAlphaBar(false)b.ValueChanged=function(c,col)if!c.Updated then c.Updated=true;return end;timer.Create('colourchange.'..self.NetMessage,0.1,1,function()if IsValid(self)then self:Send()end end)end;self.color=b end)end;function a:Populate(d,e,f,g,h)self.NetMessage=g;local i,j=d:GetPos()j=j+d:GetTall()+2;self:SetVisible(true)self:SetPos(i,j)self:MoveToFront()self:SizeTo(e,f,.2,0)local k=LocalPlayer()[h](LocalPlayer())self.color:SetColor(Color(k.x*255,k.y*255,k.z*255))end;function a:Send()local l=self.color:GetColor()net.Start(self.NetMessage)net.WriteUInt(l.r,8)net.WriteUInt(l.g,8)net.WriteUInt(l.b,8)net.SendToServer()end;function a:FadeOut()self:SizeTo(0,0,.5,0,0,function()if IsValid(self)then self:Remove()end end)end;vgui.Register('srp_cosmetic_colourize',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_displayitem_ui.lua:
local a={}local b=Color(255,25,222,255)local c=Color(120,120,120,255)function a:Init()self.ContainingSlots={}self:SetBackgroundColor(col.midnight_dark)self:AddPanel('srp_panel',function(d)d:Dock(LEFT)d:SetBackgroundColor(col.transparent)d:SetWide(500)d:AddPanel('srp_button_tagtext_rounded',function(e)e:Dock(TOP)e:SetText''e:DockMargin(4,4,24,4)e:SetTagFont'SSRPForkAwesome'e:SetTagText(0xf053,true)e:SetTextColor(col.white)e:SetTall(35)e:SetBorderColor(col.transparent)e:SetBackgroundColor(col.midnight_light)e:SetTagBackground(col.transparent)e:SetHoverColor(col.midnight_light)e:LeftClick(function()self:Remove()end)self.Back=e end)d:AddPanel('ui_scrollpanel',function(d)d:Dock(FILL)self.Scroll=d end)self.Controls=d end)hook('OnCosmeticPresetItemAdded',self,self.OnItemAdded)hook('OnCosmeticEquipped',self,function(f,g,h)if g==LocalPlayer()then f:OnItemAdded(h)end end)hook('OnCosmeticPresetItemRemoved',self,self.OnItemRemoved)hook('OnCosmeticRemoved',self,function(f,g,h)if g==LocalPlayer()then f:OnItemRemoved(h)end end)hook('OnPlayerGroupChanged',self,function(f)timer.Simple(0,function()f:OnPlayerStateChanged()end)end)hook('OnCharacterSelected',self,function(f)timer.Simple(0,function()f:OnPlayerStateChanged()end)end)hook('OnPlayerLeftGroup',self,function(f,i)timer.Simple(0,function()if LocalPlayer():CharacterID()==i then f:OnPlayerStateChanged()end end)end)end;function a:OnRemove()hook.Remove('OnCosmeticEquipped',self)hook.Remove('OnPlayerGroupChanged',self)hook.Remove('OnCharacterSelected',self)hook.Remove('OnPlayerLeftGroup',self)hook.Remove('OnCosmeticPresetItemAdded',self)if self.OnDeselected then self:OnDeselected()end end;function a:Populate(j,k)local l=istable(j.selector.slot)&&j.selector.slot||{{name=j.name,id=j.selector.slot}}self.IgnoreClass=j.selector.noclass;self.Class=j.selector.class||k;self.ItemType=j.selector.type;self.Slots=l;self.PanelClass=j.selector.panel||'srp_cosmetic_itempnl'self.Back:SetText(j.name)self:SetupPreview()for m=1,#l do self.ContainingSlots[l[m].id]=true;self:DisplayItems(m,l[m],#l)end end;function a:DisplayItems(m,n,o)local p;if!self.IgnoreClass&&self.Class&&self.Class!='player'then p=cosmetics.GetClassTable(self.Class,self.ItemType,n.id)else p=cosmetics.GetSlotTable(self.ItemType,n.id)end;if!p||table.Count(p)==0 then return end;srp.ui.Create('srp_grid',function(q)q:Dock(TOP)q:SetBackgroundColor(col.transparent)q:SetSpacing(6,6,true)q:SetAutoHeight(true)if o>1 then srp.ui.Create('srp_label',function(r)r:SetSize(460,35)r:SetText('    '..n.name)r:SetTextColor(col.white)r:SetBackgroundColor(col.midnight_light)q:AddItem(r)end)end;local s=0;for i,h in pairs(p)do if!h:IsOwned()&&!cosmetics.CanPurchase(LocalPlayer(),h)then continue end;if!cosmetics.CanEquip(LocalPlayer(),h)then continue end;srp.ui.Create(self.PanelClass,function(d)d.Container=self;d:SetSize(110,110)d:Populate(h,self.Class)if h:IsInPreset()then self:AddCosmetic(h)end;q:AddItem(d)end)s=s+1 end;if s==0 then srp.ui.Create('srp_label',function(r)r:SetSize(460,32)r:SetText('  You do not have access to any cosmetics here :(')r:SetContentAlignment(4)r:SetTextColor(col.white)r:SetBackgroundColor(col.red_dark)q:AddItem(r)end)end;self.Scroll:AddItem(q)end)end;function a:SetupPreview()self:AddPanel('srp_modelpanel',function(d)d:Dock(FILL)d:MoveToBack()d:SetCanControl(true)self.PreviewPanel=d end)self:DisplayPreviewEntity()end;function a:DisplayPreviewEntity()if!IsValid(self.PreviewEntity)then self.PreviewEntity=self.PreviewPanel:AddModel(LocalPlayer():GetModel())self.PreviewEntity.cents={}end;self.PreviewEntity:SetAngles(Angle(0,-90,0))self.PreviewEntity:SetSkin(LocalPlayer():GetSkin())for m=0,self.PreviewEntity:GetNumBodyGroups()-1 do self.PreviewEntity:SetBodygroup(m,LocalPlayer():GetBodygroup(m)||0)end;self.PreviewPanel:TryCenter(self.PreviewEntity,nil,.65)self.PreviewPanel:SetCamPos(self.PreviewPanel:GetCamPos()+Vector(0,-20,-20))self.PreviewPanel:SetFOV(60)end;function a:AddCosmetic(h)local t=h:GetEquipped(self.PreviewEntity)if t then t:RemovePlayer(self.PreviewEntity)end;local u=h:AddPlayer(self.PreviewEntity)self.PreviewPanel:AddEntity(u)end;function a:RemoveCosmetic(h)h:RemovePlayer(self.PreviewEntity)end;function a:OnPlayerStateChanged()self.Scroll:Reset()self:DisplayPreviewEntity()for m=1,#self.Slots do self:DisplayItems(m,self.Slots[m],#self.Slots)end end;function a:OnItemAdded(h)if self.ContainingSlots[h:GetSlot()]then self:AddCosmetic(h)end end;function a:OnItemRemoved(h)if self.ContainingSlots[h:GetSlot()]then self:RemoveCosmetic(h)end end;function a:PaintOver(v,w)draw.DrawText(cosmetics.heart,'SSRPForkAwesome',v-205,w-25,b,TEXT_ALIGN_LEFT)draw.DrawText('Middle Mouse to add to preset!','ui_header.s',v-185,w-30,c,TEXT_ALIGN_LEFT)end;vgui.Register('srp_cosmetic_displayitem',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_purchase_ui.lua:
local a={}local b=col.midnight_dark:Copy()local c=col.black:Copy()function a:Init()self:SetTitle'Purchase'self:DockMargin(0,0,0,0)self.m_bgHeaderColor=c;self:SetBackgroundColor(b)self.close:SetBackgroundColor(b)self.close:SetHoverColor(b)self:AddPanel('srp_button_image',function(d)d:Dock(LEFT)d:SetWide(190)d:DockMargin(5,5,15,5)d:SetBackgroundColor(col.transparent)d:SetHoverColor(col.transparent)d:SetMaterial'materials/galactic/ui/menu/usd.png'd:SetBorderColor(col.transparent)d:AddPanel('srp_label',function(e)e:SetText'0 Credits'e:SetFont'ui_header.s'e:SetMouseInputEnabled(false)e:Dock(BOTTOM)e:SetBackgroundColor(col.transparent)e:SetTextColor(col.yellow)e:DockMargin(0,0,0,0)e:SetContentAlignment(8)e:SetTall(35)self.credits=e end)d:LeftClick(function(f)self:Purchase(true)self:Remove()end)self.creditsImg=d end)self:AddPanel('srp_button_image',function(d)d:Dock(RIGHT)d:SetWide(190)d:DockMargin(5,5,15,5)d:SetBackgroundColor(col.transparent)d:SetHoverColor(col.transparent)d:SetMaterial'materials/galactic/ui/foods/package.png'd:SetBorderColor(col.transparent)d:AddPanel('srp_label',function(e)e:SetText'$0'e:SetFont'ui_header.s'e:SetMouseInputEnabled(false)e:Dock(BOTTOM)e:SetBackgroundColor(col.transparent)e:SetTextColor(col.red)e:DockMargin(0,0,0,0)e:SetContentAlignment(8)e:SetTall(35)self.rc=e end)d:LeftClick(function(f)self:Purchase(false)self:Remove()end)self.rcImg=d end)end;function a:Setup(g)self.item=g;local h=g:GetCost()local i=g:GetCredits()self:SetTitle(g:GetName())self.credits:SetText(string.Comma(i)..' Credits')if h then h=h||0;local j=LocalPlayer():GetCurrency()local k=LocalPlayer():GetMoney()self.rc:SetText(string.Comma(h)..j)self.rc:SetTextColor(h<=k&&col.white||col.red)end;if g.creditsOnly then self.rc:Remove()self.rcImg:Remove()self.credits:SetTextColor(col.yellow)self.credits:SetContentAlignment(4)self.creditsImg:SetTextColor(col.yellow)self.creditsImg:Dock(FILL)self.creditsImg.img:SetSize(72,72)self.creditsImg:SetMaterialPos(20,10)self.m_bgHeaderColor=col.yellow;self.close:SetTextColor(col.black)self.close:SetBackgroundColor(col.yellow)self.close:SetHoverColor(col.yellow)self.title:SetTextColor(col.black)self:SetBorderColor(col.yellow)self.credits:SetText('      '..string.Comma(i)..' Credits')self.premium=true end end;function a:Purchase(l)local h=(l||self.item.creditsOnly)&&self.item:GetCredits()||self.item:GetCost()local m=l&&'credit'||LocalPlayer():GetCurrency()if!h then return end;srp.notif.Confirm({title='Confirm '..m..' Purchase',sub_text=Format('Are you sure you want to purchase the %q for %i %s',self.item.prettyname,h,m),item=self.item,callback=function(n)cmd.Run('cosmeticpurchase',n.item.id,l&&1||0)end})end;function a:PaintOver(o,p)if!self.premium then draw.SimpleText('OR','ui_header.l',o/2,p*.6,col.white_dark,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)else local q=math.abs(math.cos(UnPredictedCurTime()*2)*(o-5))surface.SetDrawColor(col.yellow)surface.DrawLine(q,p-1,q+5,p-1)draw.DrawText('PREMIUM','ui_header.l',o*.35,p*.40,col.yellow,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)draw.DrawText('This is premium credit only content!','ui_header.s',o*.35,p*.57,col.yellow,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)end end;function a:Think()self:MoveToFront()end;vgui.Register('srp_cosmetic_purchase',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmeticpanel_ui.lua:
local a={}local b,c=1219,800;local d=Color(255,25,222,255)local e=Color(120,120,120,255)function a:Init()self:DockMargin(0,0,0,0)self:DockPadding(0,0,0,0)self:SetBackgroundColor(col.midnight_dark)self.Controls={}self.LinkedClasses={}self:AddPanel('srp_cosmetic_presetcontroller',function(f)f:SetSize(400,40)self.Preset=f end)self:AddPanel('srp_dropdown',function(f)f:SetSize(200,36)f:SetVisible(false)f:SetBorderColor(col.transparent)f:SetBackgroundColor(col.midnight_light)f:SetHoverColor(col.midnight_light)f:OnSelect(function(g,h,i)self:OnClassSelected(i)end)self.ClassSelector=f end)self:AddPanel('srp_button_tagtext_rounded',function(f)f:SetSize(160,36)f:SetTagWidth(36)f:SetTagFont('SSRPForkAwesome')f:SetTagText(0xf004,true)f:SetTagBackground(col.transparent)f:SetBackgroundColor(col.midnight_light)f:SetHoverColor(col.midnight)f:SetBorderColor(col.transparent)f:OnSelected(function(g)g:SetText'Displaying Presets'g:SetTagTextColor(d)self.PresetPreview=true;self:OnDisplayModeChanged()end)f:OnDeselected(function(g)g:SetText'Displaying Equipped'g:SetTagTextColor(e)self.PresetPreview=false;self:OnDisplayModeChanged()end)f:LeftClick(function(g)local j=!g:IsSelected()g:Select(j)end)f:Select(true)self.PreviewMode=f end)hook('OnCharacterSelected',self,self.PlayerStateChanged)hook('OnPlayerGroupLoreNameChanged',self,self.PlayerStateChanged)hook('OnPlayerGroupClassChanged',self,self.PlayerStateChanged)hook('OnPlayerGroupRankChanged',self,self.PlayerStateChanged)hook('OnCosmeticEquipped',self,function(g,k,l)if k==LocalPlayer()&&g:IsRelatedItem(l)then g:AddEquipped(l)end end)hook('OnCosmeticRemoved',self,function(g,k,l)local m=l:GetClass()if k==LocalPlayer()&&g:IsRelatedItem(l)then g:RemoveEquipped(l)end end)hook('OnCosmeticPresetItemAdded',self,function(g,l)if g:IsRelatedItem(l)then g:AddPreview(l)end end)hook('OnCosmeticPresetItemRemoved',self,function(g,l)if g:IsRelatedItem(l)then g:RemovePreview(l)end end)hook('OnCosmeticPresetCleared',self,function(g,m)if g:IsRelatedItem(m)then g:RemovePreviews()end end)hook('OnCosmeticPresetLoaded',self,function(g,m)if g:IsRelatedItem(m)then g:AddPreviews()end end)end;function a:OnRemove()hook.Remove('OnCharacterSelected',self)hook.Remove('OnPlayerGroupLoreNameChanged',self)hook.Remove('OnPlayerGroupClassChanged',self)hook.Remove('OnPlayerGroupRankChanged',self)hook.Remove('OnCosmeticEquipped',self)hook.Remove('OnCosmeticRemoved',self)hook.Remove('OnCosmeticPresetItemAdded',self)hook.Remove('OnCosmeticPresetItemRemoved',self)hook.Remove('OnCosmeticPresetCleared',self)hook.Remove('OnCosmeticPresetLoaded',self)end;function a:IsRelatedItem(l)local m=isstring(l)&&l||l:GetClass()return table.HasValue(self.LinkedClasses,m)||m==self.SelectedClass end;function a:PlayerStateChanged(k)if k!=LocalPlayer()then return end;timer.Create('cosmetics.ApparelPlayerStateChanged',.25,1,function()if IsValid(self)then self:OnPlayerStateChanged()end end)end;function a:OnClassSelected(i)if!i.class||self.SelectedClass==i.class then return end;self.SelectedClass=i.class;self.Preset:Populate(i.class)self:PopulateControls()self:OnClassChanged(i.class)end;function a:SetupClasses()self:PopulateClassList()self.ClassSelector:SetVisible(true)end;function a:SetClass(n)self.SelectedClass=n;self.Preset:Populate(n)end;function a:SetControls(o,p,q)self.ControlLayout=o.Controls;self.LinkedClasses=o.LinkedClasses||{}self.DisplayPanel=p||'srp_cosmetic_displayitem'if q!=false then self:PopulateControls()end end;function a:PopulateControls()for r,f in ipairs(self.Controls)do f:Remove()end;self.Controls={}for s,t in ipairs(self.ControlLayout)do self:SetupControl(s,t)end end;function a:SetupControl(s,u)self:AddPanel('srp_cosmetic_slotpreview',function(f)f:SetSize(u.size.w,u.size.h)f:SetPos((b-u.size.w)*u.pos.x+(u.pos.offsetx||0),(c-u.size.h)*u.pos.y+(u.pos.offsety||0))f:Populate(u,self.SelectedClass)f:LeftClick(function(g)self:DisplayInformation(u)end)table.insert(self.Controls,f)end)end;function a:DisplayInformation(u)self:OnControlSelected(u)self:AddPanel(u.display||self.DisplayPanel,function(f)f.Container=self;f:SetSize(self:GetSize())f:SetPos(0,0)f:MoveToFront()f:Populate(u,self.SelectedClass)f.OnDeselected=function(g)self:OnControlDeselected(g)end end)end;function a:OnControlSelected(u)end;function a:OnControlDeselected(u)end;function a:OnPlayerStateChanged()end;function a:OnClassChanged(m)end;function a:PopulateClassList()end;function a:AddCosmetic(l)end;function a:RemoveCosmetic(l)end;function a:ClearItems()end;function a:OnDisplayModeChanged()local v=self.PresetPreview;if v then self:AddPreviews()else self:AddAllEquipped()end end;function a:AddEquipped(l)if!self.PresetPreview then self:AddCosmetic(l)end end;function a:RemoveEquipped(l)if!self.PresetPreview then self:RemoveCosmetic(l)end end;function a:AddPreview(l)if self.PresetPreview then self:AddCosmetic(l)end end;function a:RemovePreview(l)if self.PresetPreview then self:RemoveCosmetic(l)end end;function a:RemovePreviews()if self.PresetPreview then self:ClearItems()end end;function a:AddAllEquipped()if!self.PresetPreview then self:ClearItems()self:AddItems()end end;function a:AddPreviews()if self.PresetPreview then self:ClearItems()self:AddItems()end end;function a:AddItems()local i=cosmetics.GetClassTable(self.SelectedClass)if!i then return end;for w,x in pairs(i)do for y,z in pairs(x)do for r,l in pairs(z)do if self.PresetPreview&&l:IsInPreset()||!self.PresetPreview&&l:IsEquipped()then self:AddCosmetic(l)end end end end end;function a:PerformLayout(b,c)if IsValid(self.Preset)then self.Preset:SetPos(b-405,5)end;if IsValid(self.ClassSelector)then self.ClassSelector:SetPos(5,7)end;if IsValid(self.PreviewMode)then self.PreviewMode:SetPos(b-self.PreviewMode:GetWide()-5,c-self.PreviewMode:GetTall()-5)end end;vgui.Register('srp_cosmeticpanel',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetics_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetics_ui.lua:
local a={}function a:Init()self:SetSize(900,560)self:DockPadding(2,2,2,0)self:SetBackgroundColor(col.midnight_dark)self:AddPanel('srp_tabs',function(b)b:Dock(FILL)self.tab=b end)end;function a:SelectItemByName(c)self.tab:SelectItemByName(c)end;function a:AddPage(c,d)self.tab:AddPage(c,d)end;function a:OnSelected(e,f)local g=f:GetParent()local h=math.min(ScrW(),1400)local i=math.min(ScrH(),820)g:SizeTo(h,i,.1,0)g:MoveTo((ScrW()-h)/2,(ScrH()-i)/2,.1,0)end;function a:OnDeselected(e,f)local g=f:GetParent()g:SizeTo(1220,630,.1,0)g:MoveTo((ScrW()-1220)/2,(ScrH()-630)/2,.1,0)end;vgui.Register('srp_cosmetics',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmeticsaber_ui.lua:
local a={}local b=Vector(0,0,0)local c=Angle(180,0,0)local d=Model'models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl'local e={Controls={{name='Hilt',global=true,pos={x=.55,y=.85,offsetx=-180},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.SABER,slot=cosmetics.SLOT.SABER.HILT}},{name='Hilt 2',global=true,pos={x=.55,y=.85,offsetx=-90},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.SABER,slot=cosmetics.SLOT.SABER.HILT2}},{name='Crystal',global=true,pos={x=.55,y=.85},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.SABER,slot=cosmetics.SLOT.SABER.COLOR}},{name='Crystal 2',global=true,pos={x=.55,y=.85,offsetx=90},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.SABER,slot=cosmetics.SLOT.SABER.COLOR2}}}}function a:Init()self:SetClass'saber'self:SetControls(e,'srp_cosmetic_displaysaber')self:AddPanel('srp_modelpanel',function(f)f:Dock(FILL)f:MoveToBack()f:SetCanControl(false)f.IsIgnited=false;f.IgnitionLength=0;function f:TranslateCamTurn(g,h,i)h:RotateAroundAxis(g:GetForward(),-i)g:SetAngles(h)end;function f:PreDrawModel(g)self.IgnitionLength=math.Approach(self.IgnitionLength,self.IsIgnited&&28||0,RealFrameTime()/1*60)if IsValid(g)then local j=g:GetPos()+g:GetForward()*1+g:GetRight()*.6-g:GetUp()*.3;local k=-g:GetForward()local col=self.CrystalColor||col.white;rb655_RenderBlade(j,k,self.IgnitionLength,48,1.4,col,false,g:EntIndex(),false,nil,nil,false)end end;self.PreviewPanel=f end)self:AddPanel('srp_button_tagtext_rounded',function(f)f:SetSize(200,28)f:SetPos(5,10)f:SetTagWidth(30)f:SetTagFont('SSRPForkAwesome')f:SetTagText(0xf219,true)f:SetTagBackground(col.transparent)f:SetBackgroundColor(col.midnight_light)f:SetHoverColor(col.midnight)f:SetBorderColor(col.transparent)f:SetTagTextColor(col.white)f:SetText'Toggle Ignition'f:LeftClick(function(l)self:ToggleIgnite()end)end)self:DisplayPreviewEntity()end;function a:OnControlSelected()if IsValid(self.PreviewPanel)then self.PreviewPanel:SetVisible(false)end end;function a:OnControlDeselected()if IsValid(self.PreviewPanel)then self.PreviewPanel:SetVisible(true)end end;function a:ToggleIgnite()self.PreviewPanel.IsIgnited=!self.PreviewPanel.IsIgnited end;function a:DisplayPreviewEntity(m)if!IsValid(self.PreviewEntity)then self.PreviewEntity=self.PreviewPanel:AddModel(d,b,c)self.PreviewEntity.cents={}end;if!IsValid(self.PreviewEntity2)then self.PreviewEntity2=self.PreviewPanel:AddModel(d,b,c)self.PreviewEntity2.cents={}self.PreviewEntity2:SetNoDraw(true)end;self.PreviewPanel:TryCenter(self.PreviewEntity,nil,1.6)self.PreviewPanel:SetFOV(75)self.PreviewEntity:SetPos(self.PreviewEntity:GetPos()+Vector(-14,10,12))self.PreviewEntity2:SetPos(self.PreviewEntity:GetPos()+Vector(-14,10,14))end;function a:AddCosmetic(n)if n:GetSlot()==cosmetics.SLOT.SABER.HILT then self.PreviewEntity:SetModel(n:GetModel())return end;if n:GetSlot()==cosmetics.SLOT.SABER.HILT2 then self.PreviewEntity2:SetModel(n:GetModel())self.PreviewEntity2:SetNoDraw(false)return end;if n:GetSlot()==cosmetics.SLOT.SABER.COLOR||n:GetSlot()==cosmetics.SLOT.SABER.COLOR2 then self.PreviewPanel.CrystalColor=n:GetColor()end end;function a:RemoveCosmetic(n)if!n then self.PreviewEntity:SetModel(d)self.PreviewPanel.CrystalColor=nil;return end;local o=n:GetSlot()if o==cosmetics.SLOT.SABER.HILT then self.PreviewEntity:SetModel(d)end;if o==cosmetics.SLOT.SABER.HILT2 then self.PreviewEntity2:SetModel(d)self.PreviewEntity2:SetNoDraw(true)end;if o==cosmetics.SLOT.SABER.COLOR||o==cosmetics.SLOT.SABER.COLOR2 then self.PreviewPanel.CrystalColor=nil end end;function a:ClearItems()self:RemoveCosmetic()end;vgui.Register('srp_cosmeticsabers',a,'srp_cosmeticpanel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetictooltip_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmeticvehicle_ui.lua:
local a={}local b=Vector(40,0,0)local c=Angle(35,0,0)local d={Controls={{name='Skin',pos={x=.5,y=.85},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.VEHICLE,slot=cosmetics.SLOT.VEHICLE.SKIN}}}}function a:Init()self:SetupClasses()self:SetControls(d,'srp_cosmetic_displayvehicle',false)self:AddPanel('srp_modelpanel',function(e)e:Dock(FILL)e:MoveToBack()e:SetCanControl(true)self.PreviewPanel=e end)end;function a:OnControlSelected()if IsValid(self.PreviewPanel)then self.PreviewPanel:SetVisible(false)end end;function a:OnControlDeselected()if IsValid(self.PreviewPanel)then self.PreviewPanel:SetVisible(true)end end;function a:PopulateClassList()local f=table.GetKeys(cosmetics.GetClassTables())local d={}for f,g in pairs(cosmetics.GetClassTables())do local h=scripted_ents.Get(f)if!h then continue end;local i=h.PrintName||h.PrettyName||h.Name||f;table.insert(d,{name=i,class=f})end;for j,k in SortedPairsByMemberValue(d,'name')do self.ClassSelector:AddOption(k.name,k,nil,false)end end;function a:OnClassChanged(f)self:DisplayPreviewEntity(f)self:OnDisplayModeChanged()end;function a:DisplayPreviewEntity(f)local l=scripted_ents.Get(f)if!l then return end;local m=l.Model||l.WorldModel||l.MDL;if!m then return end;if IsValid(self.PreviewEntity)then self.PreviewEntity:SetModel(m)self:ClearItems()else self.PreviewEntity=self.PreviewPanel:AddModel(m)end;local n=l.UIPosition||b;local o=l.UIAngle||c;self.PreviewEntity:SetPos(n)self.PreviewEntity:SetAngles(o)self.PreviewPanel:SetCamPos(Vector(0,-100,0))self.PreviewPanel:SetFOV(75)end;function a:AddCosmetic(p)local q=p:GetMaterial()if q then self.PreviewEntity:SetMaterial(q)end;self.PreviewEntity:SetBodygroup(1,1)local r=p:GetSkin()if r then self.PreviewEntity:SetSkin(r)end;local s=p:GetSubMaterials()if s then self.submaterials=s;for t,q in pairs(s)do self.PreviewEntity:SetSubMaterial(t-1,q)end end end;function a:RemoveCosmetic(p)if IsValid(self.PreviewEntity)then self.PreviewEntity:SetSubMaterial()self.PreviewEntity:SetMaterial''self.PreviewEntity:SetSkin(0)end end;function a:ClearItems()self:RemoveCosmetic()end;vgui.Register('srp_cosmeticvehicles',a,'srp_cosmeticpanel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/effects/effects_sh.lua:
srp.effect=srp.effect||{}srp.effect.effects={}local a=function(...)end;local b=col.purple:Copy()local c=Vector(0,0,-1)local d={Sound'galactic/effects/burp1.mp3',Sound'galactic/effects/burp2.wav'}PrecacheParticleSystem'utaunt_snowfall_parent'PrecacheParticleSystem'unusual_storm'PrecacheParticleSystem'utaunt_spotlight_parent'PrecacheParticleSystem'xms_ornament_glitter'PrecacheParticleSystem'utaunt_wispyworks_purpleblue_parent'PrecacheParticleSystem'utaunt_wispyworks_yellowpurple_parent'PrecacheParticleSystem'utaunt_wispyworks_orangegreen_parent'function srp.effect.Add(e,f)srp.effect.effects[e]=table.Merge(f,{id=e,Duration=f.Duration,Network=f.nw==nil&&true||f.nw,Networked={},OnRun=f.OnRun,OnRunCL=f.OnRunCL,Draw=f.Draw})return e end;local g;local h=CLIENT&&Material||function()end;if CLIENT then function h(i)local j='http://r2-cdn.superiorservers.co/ssrp/emotes/'..i;return texture.Create(j):SetSize(512,512):SetFormat'png':SetPngParameters'smooth nocull':EnableCache(true):EnableProxy(false):Download(j)end;g=function(k,f)local l=k==LocalPlayer()&&k:GetAngles()||k:GetAimVector():Angle()f.Forward=l:Forward()f.Up=l:Up()f.Right=l:Right()f.Ang=l;f.AngFlip=Angle(l)f.Ang:RotateAroundAxis(f.Up,90)f.Ang:RotateAroundAxis(f.Right,-90)f.AngFlip:RotateAroundAxis(f.Up,-90)f.AngFlip:RotateAroundAxis(f.Right,90)end end;local m={}m.default={Material=Material('galactic/seasonal/valentines/heart.png'),OnStart=function(self,k,f)g(k,f)f.Pos=k:EyePos()+f.Forward*25 end,Draw=function(self,k,f)local n=f.WebMaterial&&f.Material:GetMaterial()||f.Material;local o=SysTime()-f.StartTime;local p=math.min(o/.5,1)-math.Clamp((o-2)/0.5,0,1)p=math.sin(p*math.pi*0.5)local q=math.max((o-.5)/2,0)q=math.cos(q)local r=1-math.max((o-2)/.5,0)f.Pos=f.Pos+f.Forward*3*q*FrameTime()cam.Start3D2D(f.Pos,f.Ang,p)surface.SetDrawColor(255,255,255,r*255)surface.SetMaterial(n)surface.DrawTexturedRect(-12,-12,24,24)cam.End3D2D()end}m.heart={Material=Material'galactic/seasonal/valentines/heart.png'}local s=0;local t=Material'galactic/seasonal/summer/sun.png'local u=Material'galactic/seasonal/summer/sea-turtle.png'local v=Material'galactic/seasonal/summer/starfish.png'local w=Material'galactic/seasonal/summer/wave.png'local x=Material'galactic/seasonal/summer/crab.png'local y=Material'galactic/seasonal/summer/jaws1.png'local z=Material'galactic/seasonal/summer/jaws2.png'local A=Material'galactic/seasonal/summer/jaws3.png'local B=Material'galactic/seasonal/summer/jaws4.png'local C=Material'galactic/seasonal/christmas/santa.png'local D=45;local E=45;sound.Add({name='emote.oceanman',channel=CHAN_STATIC,volume=.75,level=70,pitch={95,105},sound='galactic/seasonal/summer/oceanman.mp3'})sound.Add({name='emote.skeletons',channel=CHAN_STATIC,volume=.75,level=70,pitch={95,105},sound={'halloween/spooky_jingle.mp3','halloween/spooky_skeletons.mp3'}})sound.Add({name='emote.america',channel=CHAN_STATIC,volume=.75,level=70,pitch={95,105},sound={'galactic/seasonal/july4th/america1.wav','galactic/seasonal/july4th/america2.wav','galactic/seasonal/july4th/america3.wav'}})sound.Add({name='emote.americaeagle',channel=CHAN_STATIC,volume=.75,level=70,pitch={95,105},sound='galactic/seasonal/july4th/eaglescreach.mp3'})sound.Add({name='emote.jaws',channel=CHAN_STATIC,volume=.75,level=70,pitch={95,105},sound='galactic/seasonal/summer/jaws.mp3'})sound.Add({name='emote.blizzard',channel=CHAN_STATIC,volume=.75,level=70,pitch={95,105},sound='galactic/seasonal/winter/blizzard.wav'})sound.Add({name='emote.glitter',channel=CHAN_STATIC,volume=.75,level=70,pitch={95,105},sound='galactic/seasonal/winter/glitter.mp3'})sound.Add({name='emote.storm',channel=CHAN_STATIC,volume=.75,level=70,pitch={95,105},sound='galactic/seasonal/winter/thunder.mp3'})sound.Add({name='emote.beam',channel=CHAN_STATIC,volume=.75,level=70,pitch={95,105},sound='galactic/seasonal/winter/beam.wav'})m.wisps={effects={'utaunt_wispyworks_purpleblue_parent','utaunt_wispyworks_yellowpurple_parent','utaunt_wispyworks_orangegreen_parent'},OnRun=function(self,k,f)k:SetCustomBoneAnim'slowwalk'end,OnStart=function(self,k,f)k:StopAndDestroyParticles()ParticleEffectAttach(self.effects[math.random(1,#self.effects)],PATTACH_POINT_FOLLOW,k,0)end,Draw=function(self,k,f)end}m.blizzard={Sound='emote.blizzard',OnRun=function(self,k,f)k:SetCustomBoneAnim'wait'end,OnStart=function(self,k,f)k:StopAndDestroyParticles()ParticleEffectAttach('utaunt_snowfall_parent',PATTACH_POINT_FOLLOW,k,0)end,Draw=function(self,k,f)end}m.glitter={Sound='emote.glitter',OnRun=function(self,k,f)end,OnStart=function(self,k,f)ParticleEffectAttach('xms_ornament_glitter',PATTACH_POINT_FOLLOW,k,boneid||k:LookupAttachment('anim_attachment_head')||k:LookupAttachment('eyes'))end,Draw=function(self,k,f)end}m.storm={Sound='emote.storm',OnRun=function(self,k,f)k:SetCustomBoneAnim'slowwalk'end,OnStart=function(self,k,f)k:StopAndDestroyParticles()ParticleEffectAttach('unusual_storm',PATTACH_POINT_FOLLOW,k,boneid||k:LookupAttachment('anim_attachment_head')||k:LookupAttachment('eyes'))end,Draw=function(self,k,f)end}m.lightbeam={Sound='emote.beam',OnRun=function(self,k,f)k:SetCustomBoneAnim'slowwalk'end,OnStart=function(self,k,f)k:StopAndDestroyParticles()ParticleEffectAttach('utaunt_spotlight_parent',PATTACH_POINT_FOLLOW,k,0)end,Draw=function(self,k,f)end}local function F(G,H)local I=EffectData()I:SetColor(0)I:SetScale(6)I:SetFlags(3)I:SetOrigin(G)I:SetEntity(H)util.Effect('BloodImpact',I,true,true)end;local function J(G,H)local I=EffectData()I:SetOrigin(G)I:SetEntity(H)util.Effect('effect_bats',I,true,true)end;local function K(G,L)local H=ents.CreateClientProp(L)if!IsValid(H)then return end;H:SetPos(G)H:SetCollisionGroup(COLLISION_GROUP_DEBRIS)H:Spawn()local M=H:GetPhysicsObject()if!IsValid(M)then H:Remove()return end;local N=Vector(math.random(-.2,.3),math.random(-.2,.2),1)N:Normalize()M:SetVelocity(N*math.random(200,400))F(G,H)for O=1,3 do F(G+VectorRand(-50,50),H)end;timer.Simple(5,function()if IsValid(H)then H:Remove()end end)end;local function P(H)H:SetModel('models/player/skeleton.mdl')H:SetSkin(1)H:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE)timer.Simple(7,function()if IsValid(H)then F(H:GetPos(),H)H:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE)end end)timer.Simple(11.25,function()if!IsValid(H)then return end;H:DoAnimationEvent(ACT_GMOD_TAUNT_PERSISTENCE)local Q=H:GetGroup()if Q then Q:SetModel(H)elseif H:GetAllegiance()then H:GetAllegiance():SetModel(H)end end)end;local R='models/heracles421/galactica_vehicles/barc.mdl'local S='models/player/christmas/santa.mdl'local function T(k,U,V)local W=k==LocalPlayer()local G=k:EyePos()+k:GetForward()*50;local X=ents.CreateClientside'base_anim'X:SetModel(R)X:SetPos(G)X:SetMoveType(MOVETYPE_NONE)X:SetSolid(SOLID_NONE)X:SetModelScale(0.15)X:Spawn()X.Think=function(self)self:SetNextClientThink(CurTime())if!IsValid(k)then return end;local Y=CurTime()+5;local Z=45*V;local _=self:GetPos()local G=k:GetPos()+Vector(0,0,U)+Vector(math.sin(Y)*Z,math.cos(Y)*Z,0)G.z=G.z+math.sin(Z)*12;self:SetPos(G)local l=(G-_):Angle()l.r=l.r+math.cos(Z)*10;l.p=l.p+math.sin(Z)*10;local l=LerpAngle(.1,self:GetAngles(),l)self:SetAngles(l)if W&&(!self.NextRepulse||self.NextRepulse<CurTime())then local a0=EffectData()a0:SetOrigin(self:GetPos()-self:GetForward()*6+self:GetUp()*4)a0:SetRadius(25)util.Effect('rb655_force_repulse_out',a0,true,true)self.NextRepulse=CurTime()+.15 end;return true end;local C=ents.CreateClientside'base_anim'C.AutomaticFrameAdvance=true;C.Think=function(self)self:SetNextClientThink(CurTime())if IsValid(C)then C:ResetSequence('drive_airboat')end;return true end;C:SetParent(X)C:SetModel(S)C:SetPos(G)C:SetLocalPos(Vector(-4.5,0,6.5))C:SetLocalAngles(Angle())C:SetMoveType(MOVETYPE_NONE)C:SetSolid(SOLID_NONE)C:SetModelScale(0.15)C:Spawn()k.SantaEmote=k.SantaEmote||{}table.insert(k.SantaEmote,X)table.insert(k.SantaEmote,C)end;m.SantaRacer={Duration=45,Sound='emote.skeletons',Material={C},OnRun=function(self,k)end,OnStart=function(self,k,f)if k.SantaEmote then self.OnEnd(self,k,f)end;T(k,50,1)T(k,35,-1)end,OnEnd=function(self,k,f)if k.SantaEmote then for a1,H in pairs(k.SantaEmote)do if IsValid(H)then H:Remove()end end;k.SantaEmote={}end end,Draw=function(self,k,f)end}m.SpookyScarySkeletons={Gibs={'models/gibs/agibs.mdl','models/gibs/hgibs_spine.mdl','models/gibs/hgibs_rib.mdl'},Duration=18,Sound='emote.skeletons',SoundScream=Sound('vo/k_lab/kl_ahhhh.wav'),Material={y,z,A,B},OnRun=function(self,k)if util.IsHalloween()then for a1,H in ipairs(ents.FindInSphere(k:GetPos(),500))do if IsValid(H)&&H:IsPlayer()&&H:Alive()then P(H)end end else P(k)end end,OnStart=function(self,k,f)g(k,f)f.Pos=k:EyePos()+f.Forward*25;if s<CurTime()then k:EmitSound(self.Sound)s=CurTime()+5 end;F(f.Pos,k)J(f.Pos,k)for O=1,math.random(4,8)do K(f.Pos,self.Gibs[math.random(1,#self.Gibs)])end;timer.Simple(11.25,function()if IsValid(k)then F(f.Pos,k)EmitSound(self.SoundScream,f.Pos,0,CHAN_AUTO,1,65,nil,100,1)for O=1,math.random(4,8)do K(f.Pos,self.Gibs[math.random(1,#self.Gibs)])end end end)end,Draw=function(self,k,f)end}m.jaws={Gibs={'models/gibs/agibs.mdl','models/gibs/hgibs_spine.mdl','models/gibs/hgibs_rib.mdl'},Duration=18,Sound='emote.jaws',SoundScream=Sound('vo/k_lab/kl_ahhhh.wav'),Material={y,z,A,B},OnRun=function(self,k)k:PlayAnimation('idle_all_cower')end,OnStart=function(self,k,f)g(k,f)f.Pos=k:EyePos()+f.Forward*25;if s<CurTime()then k:EmitSound(self.Sound)s=CurTime()+5 end;local G=f.Pos;timer.Simple(14,function()for O=1,math.random(4,8)do K(G,self.Gibs[math.random(1,#self.Gibs)])end;F(G,k)EmitSound(self.SoundScream,G,0,CHAN_AUTO,1,65,nil,100,1)if IsValid(k)then k:PlayAnimation('sit_zen')k:DoAnimationEvent(ACT_GMOD_TAUNT_PERSISTENCE)end end)end,Draw=function(self,k,f)local o=SysTime()-f.StartTime;local p=math.min(o/.5,1)-math.Clamp((o-self.Duration)/0.5,0,1)p=math.sin(p*math.pi*0.5)local q=math.max((o-.5)/self.Duration,0)q=math.cos(q)local r=1-math.max((o-self.Duration)/.5,0)f.Pos=f.Pos+f.Forward*3*q*FrameTime()local n=z;if o>14 then n=B elseif o>13 then n=A elseif o>11 then n=y else n=z end;cam.Start3D2D(f.Pos,f.Ang,p)surface.SetDrawColor(255,255,255,r*255)surface.SetMaterial(n)surface.DrawTexturedRect(-18,-18,36,36)cam.End3D2D()end}local a2=Material'materials/galactic/seasonal/july4th/americaflag.png'local a3=Material'materials/galactic/seasonal/july4th/eagle_america.png'local a4=Material'materials/galactic/seasonal/july4th/eagle_flying.png'm.america={Sound='emote.america',Material={a3,a4},OnStart=function(self,k,f)g(k,f)f.Pos=k:EyePos()+f.Forward*25;if s<CurTime()then k:EmitSound(self.Sound)k:EmitSound('emote.americaeagle')s=CurTime()+10 end end,Draw=function(self,k,f)local o=SysTime()-f.StartTime;local p=math.min(o/.5,1)-math.Clamp((o-10)/0.5,0,1)p=math.sin(p*math.pi*0.5)local q=math.max((o-.5)/10,0)q=math.cos(q)local r=1-math.max((o-10)/.5,0)f.Pos=f.Pos+f.Forward*3*q*FrameTime()local a5=#f.Material;cam.Start3D2D(f.Pos,f.Ang,p)surface.SetDrawColor(255,255,255,r*255)surface.SetMaterial(a2)surface.DrawTexturedRect(-18,-18,36,36)for O,a6 in ipairs(f.Material)do local a7=math.rad(360*(O-1)/a5)local a8,a9=E*math.cos(a7),E*math.sin(a7)surface.SetMaterial(a6)surface.DrawTexturedRect(-9+a8,-9+a9,18,18)end;cam.End3D2D()end}m.OceanMan={Sound='emote.oceanman',Material={u,v,t,x},OnStart=function(self,k,f)g(k,f)f.Pos=k:EyePos()+f.Forward*25;if s<CurTime()then k:EmitSound(self.Sound)s=CurTime()+10 end end,Draw=function(self,k,f)local o=SysTime()-f.StartTime;local p=math.min(o/.5,1)-math.Clamp((o-10)/0.5,0,1)p=math.sin(p*math.pi*0.5)local q=math.max((o-.5)/10,0)q=math.cos(q)local r=1-math.max((o-10)/.5,0)f.Pos=f.Pos+f.Forward*3*q*FrameTime()local a5=#f.Material;cam.Start3D2D(f.Pos,f.Ang,p)surface.SetDrawColor(255,255,255,r*255)surface.SetMaterial(w)surface.DrawTexturedRect(-18,-18,36,36)for O,a6 in ipairs(f.Material)do local a7=math.rad(360*(O-1)/a5)local a8,a9=D*math.cos(a7),D*math.sin(a7)surface.SetMaterial(a6)surface.DrawTexturedRect(-9+a8,-9+a9,18,18)end;cam.End3D2D()end}srp.effect.Add('Emote',{Duration=12,Emotes=m,OnRun=function(self,k,f)local aa=self.Emotes[f.Emote]self.Duration=aa.Duration||12;if aa.OnRun then aa:OnRun(k,f)end;return filter.InPVS(k)end,OnRunCL=function(self,k,f)f.StartTime=SysTime()local aa=self.Emotes[f.Emote]||self.Emotes.default;self.Duration=aa.Duration||12;f.Duration=aa.Duration||12;f.WebMaterial=aa.WebMaterial;f.Material=aa.Material||self.Emotes.default.Material;f.Draw=aa.Draw||self.Emotes.default.Draw;local ab=aa.OnStart||self.Emotes.default.OnStart;if ab then ab(aa,k,f)end end,OnStopCL=function(self,k,f)local aa=self.Emotes[f.Emote]||self.Emotes.default;if aa&&aa.OnEnd then aa.OnEnd(aa,k,f)end end,Draw=function(self,k,f)if!f.WebMaterial||f.Material:GetMaterial()then f.Draw(self,k,f)end end})srp.effect.Add('Puke',{OnRun=function(self,k)return filter.InPVS(k)end,OnRunCL=function(self,k)local ac=k:EyePos()+k:GetForward()*2-k:GetUp()*5;local ad=ParticleEmitter(ac)for O=1,30 do timer.Simple(O/100,function()if!IsValid(k)then return end;local ae=ad:Add('sprites/orangecore2',ac)if ae then ae:SetVelocity(k:GetAimVector()*500+Vector(math.random(-50,50),math.random(-50,50),0))ae:SetDieTime(15)ae:SetLifeTime(1)ae:SetStartSize(20)ae:SetAirResistance(100)ae:SetRoll(math.Rand(0,360))ae:SetRollDelta(math.Rand(-200,200))ae:SetGravity(c)ae:SetCollideCallback(a)ae:SetCollide(true)ae:SetEndSize(0)end end)end;k:EmitSound(d[math.random(1,#d)])end})srp.effect.Add('FlashBang_Halloween',{OnRun=function(self,k,f)return filter.InRange(f.Pos,f.Range)end,OnRunCL=function(self,k,f)local af=LocalPlayer():GetAimVector()local ag=(f.Pos-LocalPlayer():GetShootPos()):GetNormalized()local ah=af:Dot(ag)local ai=f.Duration||10;LocalPlayer():ScreenFade(SCREENFADE.IN,b,2,ai-2)hook('EntityEmitSound','srp.effect.flash_halloween',function(aj)aj.DSP=117;aj.pitch=200;return true end)timer.Simple(1,function()LocalPlayer():SetDSP(37)end)timer.Simple(ai,function()hook.Remove('EntityEmitSound','srp.effect.flash_halloween')end)end})srp.effect.Add('Suppression',{OnRun=function(self,k,f)return filter.InRange(f.Pos,f.Range)end,OnRunCL=function(self,k,f)srp.effect.ApplySuppression(f.Duration)end})srp.effect.Add('FlashBang',{OnRun=function(self,k,f)return filter.InRange(f.Pos,f.Range)end,OnRunCL=function(self,k,f)if k:IsSpectatingPlayer()then return end;local ak=util.TraceLine({start=LocalPlayer():GetRealView(),endpos=f.Pos,filter=LocalPlayer()})if!f.force&&(ak.Fraction&&ak.Fraction<.75)then return end;local af=LocalPlayer():GetAimVector()local ag=(f.Pos-LocalPlayer():GetRealView()):GetNormalized()local ah=af:Dot(ag)local ai=f.Duration||10;if force||ah>.60 then LocalPlayer():ScreenFade(SCREENFADE.IN,Color(150,150,150),2,ai-2)hook('EntityEmitSound','srp.effect.flash',function(aj)aj.DSP=117;aj.pitch=200;return true end)timer.Simple(1,function()LocalPlayer():SetDSP(37)end)timer.Create('srp.effect.flash',ai,1,function()hook.Remove('EntityEmitSound','srp.effect.flash')end)end end})srp.effect.Add('AreaProjection',{OnRun=function(self,k)return player.GetAll()end,OnRunCL=function(self,k,f)srp.effect.AddProjection(f.Pos,f.Normal,f.Size,f.Color,f.Duration,f.WaitTime,f.ShowReference)end})
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/effects/explosive_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/events_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/ui/fragboard_line_ui.lua:
local a={}local b={col.green,col.orange_dark,col.orange,col.midnight_dark}function a:Init()self:SetBackgroundColor(col.midnight_light)self:DockPadding(5,5,5,5)self:SetPos(5,0)self:SetAlpha(0)self:AlphaTo(255,.2,0)self:AddPanel('srp_panel_rounded',function(c)c:Dock(LEFT)c:SetWide(30)c:AddPanel('srp_label',function(d)d:Dock(FILL)d:SetFont'ui_header.r'd:SetText'?'d:SetContentAlignment(5)self.Position=d end)self.PositionPanel=c end)self:AddPanel('srp_label',function(d)d:SetText'Name'd:SetFont'ui_header.r'd:SetContentAlignment(4)d:Dock(FILL)self.name=d end)self:AddPanel('srp_label',function(d)d:Dock(RIGHT)d:SetFont'ui_header.r'd:SetText'0'd:SetContentAlignment(5)d:SetWide(50)self.Frag=d end)end;function a:SetText(e)self.name:SetText(e)end;function a:Populate(f,g)self.Player=f;self.name:SetText(f:Nick())self:SetIndex(g)end;function a:Think()if!self.NextThinking||self.NextThinking>CurTime()then self.NextThinking=CurTime()+1;if!IsValid(self.Player)then self:Remove()end end end;function a:SetFrags(h)if!self.LastFrag||self.LastFrag!=h then self.Frag:SetText(h)if self.LastFrag then self:ColorTo(col.red:Copy(),0.15,0,function()if IsValid(self)then self:ColorTo(col.midnight:Copy(),0.15,0)end end)end;self.LastFrag=h end end;function a:SetIndex(g)if!self.LastIndex||self.LastIndex!=g then local i=4+(g-1)*40+(g-1)*4;self:MoveTo(5,i,.25)self.LastIndex=g;local j=b[g]||b[4]self.Position:SetText(g)self.PositionPanel:SetBackgroundColor(j)self:ColorTo(j,0.15,0,function()if IsValid(self)then self:ColorTo(col.midnight:Copy(),0.15,0)end end)end end;vgui.Register('srp_fragboard_line',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/firingrange/ui/firingrange_ui.lua:
print''
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/translate_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/blacklist/blacklist_sh.lua:
srp.gamemaster=srp.gamemaster||{}srp.AddCommand('gmaddblacklist',function(a,b,c)srp.gamemaster.BlacklistAdd(a,b,c)end):AddParam(cmd.WORD):AddParam(cmd.STRING):SetInfoSection('Gamemaster'):SetInfo('Blacklists a person from event characters.'):SetInfoArgs({'Steamid - The players steamid to blacklist'}):SetGM()srp.AddCommand('gmremoveblacklist',function(a,b)srp.gamemaster.BlacklistRemove(a,b)end):AddParam(cmd.WORD):SetInfoSection('Gamemaster'):SetInfo('Removes a blacklisted person from event characters.'):SetInfoArgs({'Steamid - The players steamid to blacklist'}):SetGM()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/containers/containers_sh.lua:
srp.containers=srp.containers||{}local a={}local b={}local c={}local d={}local e=function()end;function srp.containers.AddType(f,g)g=table.Merge(g||{},{Name=g.Name||f,Set=g.Set,Reset=g.Reset,PanelName=g.PanelName,PanelCreated=g.PanelCreated,Validation=g.Validation||srp.containers.ValidateType})if!g.internal then g.internal=table.insert(d,g)end;c[f]=g end;function srp.containers.GetType(f,h)return h&&d[f]||c[f]end;function srp.containers.ValidateType(i,j,k)local l=j:GetGamemasterTag()if i.Bounds then local m=tonumber(k)local n=i.Bounds.Min||0;local o=i.Bounds[l]||i.Bounds.Max||n;if!m then if(isstring(k)||istable(k))&&(#k>=n&&#k<=o)then return k else return false end else return math.Clamp(m,n,o)end elseif i.Validate then local p=i:Validate(j,k)if p then return p!=true&&p||k end end end;function srp.containers.AddGroup(f,g)if!g.ValidTypes then return end;g.id=f;g.Name=g.Name||f;g.internal=table.insert(b,g)a[f]=g end;function srp.containers.Get(f,h)return h&&b[f]||a[f]end;function srp.containers.GetAll(h)return h&&b||a end;srp.containers.AddType('avatar',{Name='Avatar',PanelName='srp_dropdown',Bounds={Min=3,Max=25,SGM=25,HGM=25},MethodManual=function(j,q,k)end,PanelCreated=function(self,r)for s,t in ipairs(srp.invasion.GetAvatars(true))do r:AddOption(t.id:Capitalize(),{value=t.id},{font='ui_header.xs'})end end,Validate=function(self,j,k)return srp.invasion.GetAvatar(k)!=nil end})srp.containers.AddType('title',{Name='Title',MethodManual=function(j,q,k)end,PanelName='srp_textinput_rounded',Bounds={Min=5,Max=128,SGM=128,HGM=128}})srp.containers.AddType('description',{Name='Description',MethodManual=function(j,q,k)end,PanelName='srp_textinput_rounded',Bounds={Min=5,Max=256,SGM=256,HGM=256}})srp.containers.AddType('health',{Name='Health',MethodManual=function(j,q,k)q:SetMaxHealth(k)q:SetHealth(k)end,PanelName='srp_numberinput_rounded',Bounds={Min=0,Max=15000,SGM=9999999,HGM=9999999}})srp.containers.AddType('armour',{Name='Armour',Method='SetArmor',PanelName='srp_numberinput_rounded',Bounds={Min=0,Max=15000,SGM=9999999,HGM=9999999}})srp.containers.AddType('damage',{Name='Damage',PanelName='srp_numberinput_rounded',Bounds={Min=0,Max=15000}})srp.containers.AddType('weapon_burst_min',{Name='Burst Min',PanelName='srp_numberinput_rounded',MethodManual=function(j,q,k)q.NPCMinShots=k;q.NPCMaxShots=math.max(q.NPCMaxShots||1,q.NPCMinShots+1)end,Bounds={Min=1,Max=300}})srp.containers.AddType('weapon_burst_max',{Name='Burst Max',PanelName='srp_numberinput_rounded',MethodManual=function(j,q,k)q.NPCMaxShots=k;q.NPCMinShots=math.min(q.NPCMinShots||1,q.NPCMaxShots)end,Bounds={Min=1,Max=300}})srp.containers.AddType('weapon_spread',{Name='Spread',PanelName='srp_numberinput_rounded',MethodManual=function(j,q,k)q.NPCSpread=k end,Bounds={Min=1,Max=180}})srp.containers.AddType('weapon_cooldown_min',{Name='Cooldown Min',PanelName='srp_numberinput_rounded',MethodManual=function(j,q,k)q.NPCRestTimeMin=k;q.NPCRestTimeMax=math.max(q.NPCRestTimeMax||1,q.NPCRestTimeMin+1)end,Bounds={Min=1,Max=300}})srp.containers.AddType('weapon_cooldown_max',{Name='Cooldown Max',PanelName='srp_numberinput_rounded',MethodManual=function(j,q,k)q.NPCRestTimeMax=k;q.NPCRestTimeMin=math.min(q.NPCRestTimeMin||1,q.NPCRestTimeMax-1)end,Bounds={Min=2,Max=300}})srp.containers.AddType('weapon',{Name='Weapon',PanelName='srp_dropdown',PanelCreated=function(self,r)for s,u in SortedPairsByMemberValue(list.Get('Weapon'),'PrintName')do if!u.PrintName||u.PrintName==''then continue end;r:AddOption(u.PrintName,{value=u.ClassName},{font='ui_header.s'})end end,MethodManual=function(j,q,k)if k!=''then q:Give(k,true)end end,Validate=function(self,j,k)if k==''then return true else for s,v in pairs(list.Get('Weapon'))do if v.ClassName==k then return true end end end end})srp.containers.AddType('model',{Name='Model',PanelName='srp_textinput_rounded',MethodManual=function(j,q,k)if k!=''then q:SetModel(k,true)end end,Validate=function(self,j,k)return util.ValidModel(k)end})srp.containers.AddType('material',{Name='Material',PanelName='srp_textinput_rounded',MethodManual=function(j,q,k)if k!=''then q:SetMaterial(k)end end,Validate=function(self,j,k)return k==''||!Material(k):IsError()end})srp.containers.AddType('weaponmaterial',{Name='Weapon Material',PanelName='srp_textinput_rounded',MethodManual=function(j,q,k)if k!=''then local w=q:GetActiveWeapon()if IsValid(w)then w:SetMaterial(k)end end end,Validate=function(self,j,k)return k==''||!Material(k):IsError()end})local x='icon16/user_green.png'local y='icon16/user_red.png'local z=function(r,v,A)for B,u in SortedPairsByMemberValue(v,'Name',false)do local C=(B:find('drg')||B:find('nbot'))&&' (Nextbot)'||''r:AddOption(u.Name..C,{value=B},{font='ui_header.s',icon=A&&x||y})end end;srp.containers.AddGroup('NPC',{PopulateClasses=function(self,r)local A=table.FilterTable(list.Get('NPC'),function(D)return D.Friendly||D.Class:find('citizen')||IsFriendEntityName(D.Class)end)local E=table.FilterTable(list.Get('NPC'),function(D)return!D.Friendly||IsEnemyEntityName(D.Class)end)z(r,A,true)z(r,E)end,TranslateClass=function(self,q)return q.ListClass||q:GetClass()end,Validate=function(self,j,F)return list.Get('NPC')[F]!=nil end,GetOwnedClasses=function(self,j,F)return table.Filter(ents.GetAll(),function(q)return(q.ListClass==F||q:GetClass()==F)&&(q:GetOwner()==j||q:GetPropOwner()==j)end)end,ValidTypes={'weapon','health','damage','material','weaponmaterial'}})srp.containers.AddGroup('WEAPON',{PopulateClasses=function(self,r)local G={}for s,u in SortedPairsByMemberValue(list.Get('NPCUsableWeapons'),'title',false)do if G[u.title]then continue end;r:AddOption(u.title,{value=u.class},{font='ui_header.s'})G[u.title]=true end end,TranslateEntity=function(self,q)local w=q:GetActiveWeapon()return IsValid(w)&&w||false end,TranslateClass=function(self,q)return q:GetClass()end,Validate=function(self,j,F)for s,v in pairs(list.Get('NPCUsableWeapons'))do if v.class==F then return true end end end,ValidTypes={'weapon_burst_min','weapon_burst_max','weapon_cooldown_min','weapon_cooldown_max','weapon_spread'}})srp.containers.AddGroup('PLAYER',{PopulateClasses=function(self,r)local H=player.GetHumans()table.sort(H,function(I,J)return I:Nick()<J:Nick()end)for s,j in ipairs(H)do r:AddOption(Format('%s (%s)',j:Nick(),j:SteamID()),{value=j:SteamID()},{font='ui_header.xs'})end end,TranslateClass=function(self,q)return q:SteamID()end,Validate=function(self,j,K)return ba.InfoTo32(K)!=nil end,ValidTypes={'weapon','model','health','armour','material'}})srp.containers.AddGroup('GROUP',{PopulateClasses=function(self,r)for s,L in ipairs(srp.groups.GetAll(true))do r:AddOption(L.name,{value=L.id},{font='ui_header.xs'})end end,TranslateClass=function(self,q)return srp.groups.Get(q:GetGroupID(),true).id end,Validate=function(self,j,M)return srp.groups.Get(M)!=nil end,ValidTypes={'weapon','model','health','armour'}})srp.containers.AddGroup('AVATAR',{Apply=false,CustomPanel='srp_textinput',Validate=function(self,j,f)return#f>=1&&#f<=128&&!f:find(' ')end,ValidTypes={'avatar','title','description'}})
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/eventmode/ui/eventratinginfo_ui.lua:
local a={}local b={{text=0xf165,background=Color(255,50,50,150),hovercolor=Color(255,25,25,200),selectcolor=Color(255,50,50,255),rating=1,waittime=2},{text=0xf146,background=Color(50,50,255,150),hovercolor=Color(25,25,255,200),selectcolor=Color(50,50,255,255),rating=2,waittime=2},{text=0xf164,background=Color(50,255,50,150),hovercolor=Color(50,255,25,200),selectcolor=Color(50,255,50,255),rating=3,waittime=5}}function a:Init()self:SetTall(65)self:DockPadding(2,2,2,2)self:AddPanel('srp_button_rounded',function(c)c:Dock(LEFT)c:SetWide(53)c:SetFont'SSRPForkAwesome'c:SetBorderColor(col.transparent)c:DockMargin(0,0,0,0)self.Icon=c end)self:AddPanel('srp_label',function(d)d:Dock(TOP)d:SetText''d:SetFont'ui_label.rb'd:SetTall(25)d:SetContentAlignment(1)self.name=d end)self:AddPanel('srp_label',function(d)d:Dock(FILL)d:SetText''d:SetContentAlignment(7)self.description=d end)end;function a:Populate(e,f,g,h,i)self:SetWide(e:GetWide())local j=(!IsValid(f)||i)&&'Anonymous'||f:GetTag()..' '..f:Nick()self.name:SetText(j)self.description:SetText(h)local k=b[g||2]||b[2]self.Icon:SetText(k.text,true)self.Icon:SetSelectedBackgroundColor(k.selectcolor)self.Icon:SetBackgroundColor(k.background)self.Icon:SetHoverColor(k.hovercolor)self:AlphaTo(0,k.waittime,k.waittime,function()if IsValid(self)then self:Remove()end end)end;function a:MoveMe(l)self.MovingTo=l end;function a:Think()if self.MovingTo then self.Position=Lerp(RealFrameTime()/1*15,self.Position||500,self.MovingTo)self:SetPos(0,self.Position)end end;vgui.Register('srp_ratinginfo',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/eventmode/ui/eventreviews_ui.lua:
local a={}function a:Init()self:SetTitle'Event Reviews'self:SetSize(800,600)self:Center()self:MakePopup()end;vgui.Register('srp_eventreviews',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/eventmode/ui/eventviewer_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/objectives/objectives_sh.lua:
srp.objectives=srp.objectives||{}local a=5;local b={}local c={}local d={}function srp.objectives.AddStatus(e,f)f.id=e;f.internal=table.insert(c,f)d[e]=f end;function srp.objectives.RemoveAll()b={}if SERVER then else if IsValid(srp.objectives.ui)then srp.objectives.ui:Remove()end end end;function srp.objectives.Set(f)b=f;hook.Run'OnGMObjectivesAdded'end;function srp.objectives.GetStatus(g,h)return h&&c[g]||d[g]end;function srp.objectives.Add(i,j,g,k,l)if!d[g]then return end;b[i]=b[i]||{}if table.Count(b[i])>=a then return end;local m={gid=i,name=k,description=string.sub(l,0,50),statusid=d[g].internal,status=d[g]}j=math.Clamp(j,1,#b[i]+1)table.insert(b[i],j,m)hook.Run('OnGMObjectiveAdded',j,m)end;function srp.objectives.Remove(i,j)if!b[i]||!b[i][j]then return end;j=math.Clamp(j,1,a)local m=table.remove(b[i],j)if!m then return end;hook.Run('OnGMObjectiveRemoved',j,m)end;function srp.objectives.Update(i,j,g)if!b[i]||!b[i][j]||!d[g]then return end;j=math.Clamp(j,1,a)b[i][j].statusid=d[g].internal;b[i][j].status=d[g]hook.Run('OnGMObjectiveUpdated',j,b[i][j])end;function srp.objectives.GetAll(i)return i&&b[i]||b end;srp.objectives.AddStatus('inactive',{name='Inactive',color=col.grey,icon=0xf2d3})srp.objectives.AddStatus('failed',{name='Failed',color=col.red,icon=0xf071})srp.objectives.AddStatus('active',{name='Active',color=col.blue,icon=0xf1ce})srp.objectives.AddStatus('complete',{name='Completed',color=col.green,icon=0xf00c})srp.AddCommand('gobjectiveadd',function(n,j,o,k,l)srp.objectives.Add(0,j,o,k:Replace('_',' '),l)end):AddParam(cmd.UINT):AddParam(cmd.WORD):AddParam(cmd.WORD):AddParam(cmd.STRING):SetInfoSection('Objectives'):SetInfo('Adds an objective for specific players to see.\nProvide a position and then the status, name, description seperated by spaces. Names with spaces must use _ instead\n\nFor Example:\n/gobjectiveadd 1 active My_Name This is a description'):SetInfoArgs({'Position - The order priority for this objective.','Status - active|inactive|completed|failed','Name - Name of the objective','Description - Short description'}):SetGM()srp.AddCommand('gobjectiveupdate',function(n,j,o)srp.objectives.Update(0,j,o)end):AddParam(cmd.UINT):AddParam(cmd.STRING):SetInfoSection('Objectives'):SetInfo('Updates an objective\'s status by the given position.\n\nFor Example:\n/gobjectiveupdate 2 failed\nThis sets the status of the second objective to failed.'):SetInfoArgs({'Position - The visible position'}):SetGM()srp.AddCommand('gobjectiveremove',function(n,j)srp.objectives.Remove(0,j)end):AddParam(cmd.UINT):SetInfoSection('Objectives'):SetInfo('Removes an objective at the given position.'):SetInfoArgs({'Position - The visible position'}):SetGM()srp.AddCommand('gobjectiveremoveall',function(n)srp.objectives.RemoveAll()end):SetCooldown(5):SetInfoSection('Objectives'):SetInfo('Removes all objectives.'):SetGM()srp.AddCommand('gobjectivegroupadd',function(n,j,p,o,k,l)local q=srp.groups.Get(p)if q then srp.objectives.Add(q.internal,j,o,k:Replace('_',' '),l)end end):AddParam(cmd.UINT):AddParam(cmd.WORD):AddParam(cmd.WORD):AddParam(cmd.WORD):AddParam(cmd.STRING):SetInfoSection('Objectives'):SetInfo('Adds an objective for the specified group to see.\nProvide a position and then the status, name, description seperated by space. Names with spaces must use _ instead.\n\nFor Example:\n/gobjectivegroupadd 1 501st active my_name this is a descrpiton'):SetInfoArgs({'Position - The order priority for this objective.','Ticker - The Group ID','Status - active|inactive|completed|failed','Name - Name of the objective','Description - Short description'}):SetGM()srp.AddCommand('gobjectivegroupupdate',function(n,j,p,o)local q=srp.groups.Get(p)if q then srp.objectives.Update(q.internal,j,o)end end):AddParam(cmd.UINT):AddParam(cmd.WORD):AddParam(cmd.WORD):SetInfoSection('Objectives'):SetInfo('Updates an objective\'s status by the given position and group ticker id.\n\nFor Example:\n/gobjectiveupdate 2 104th failed\nThis sets the status of the second objective to failed.'):SetInfoArgs({'Position - The visible position','Ticker - The GroupID','Status - active|inactive|completed|failed'}):SetGM()srp.AddCommand('gobjectivegroupremove',function(n,j,p)local q=srp.groups.Get(p)if q then srp.objectives.Remove(q.internal,j)end end):AddParam(cmd.UINT):AddParam(cmd.STRING):SetInfoSection('Objectives'):SetInfo('Removes an objective by a given position and ticker'):SetInfoArgs({'Position - The visible position','Ticker - The GroupID'}):SetGM()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gifts/gifts_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ranks_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/orgs/orgs_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/orgs/ui/orgcreation_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/grouplogs_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupnote_ui.lua:
local a={}function a:Init()self:SetTitle'Player Note'self:SetSize(600,800)self:Center()self:MakePopup()self:MoveToFront()self:SetZPos(30000)self:AddPanel('srp_textinput',function(b)b:Dock(FILL)b:SetMultiline(true)b:SetMinMax(0,1024)self.note=b end)self:AddPanel('srp_button',function(c)c:SetText'Update'c:Dock(BOTTOM)c:SetTall(25)c:SetBackgroundColor(col.blue)c:SetHoverColor(col.blue_light)c:LeftClick(function()if self.note:GetText()&&self.note:GetText()!=''&&self.gid&&self.characterid then cmd.Run('gsetplayernoteid',self.characterid,self.gid,self.note:GetText())end end)self.apply=c end)hook('OnPlayerNoteLoaded',self,self.NoteLoaded)end;function a:NoteLoaded(d,e)if d==self.characterid then self.note:SetText(e)end end;function a:Populate(f,g,e)self.characterid=g.characterid;self.gid=f.internal;self.note:SetText(e)end;function a:OnRemove()hook.Remove('OnPlayerNoteLoaded',self)end;vgui.Register('srp_groupnote',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupupgrades_ui.lua:
local a={}function a:Init()self:DockPadding(0,0,0,0)self:SetBackgroundColor(col.transparent)self:AddPanel('ui_scrollpanel',function(b)b:Dock(FILL)srp.ui.Create('srp_grid',function(c)c:Dock(TOP)c:SetAutoHeight(true)c:SetSpacing(10,10)srp.ui.Create('srp_group_money',function(d)d:SetSize(330,64)self.Money=d;c:AddItem(d)end)b:AddItem(c)self.Grid=c end)end)hook('OnUpgradePurchased',self,self.OnUpgradePurchased)end;function a:Setup(e)self.group=e;self.Money:Populate(e)local f=srp.groups.GetUpgrades(true)for g,h in ipairs(f)do if h.groups&&!(table.HasValue(h.groups,e.id)||e.parent&&table.HasValue(h.groups,e.parent))then continue end;srp.ui.Create('srp_group_upgrade',function(d)d:SetSize(330,64)d:Populate(self.group,h)self.Grid:AddItem(d)end)end end;vgui.Register('srp_group_upgrades',a,'srp_panel')local a={}function a:Init()self:DockPadding(0,0,0,0)self.lbl:Remove()self:LeftClick(function(i)if i.CanEdit then net.Start'srp.groups.UnlockUpgrade'net.WriteUInt(i.Upgrade.internal,4)net.SendToServer()end end)self:AddPanel('srp_panel',function(d)d:Dock(LEFT)d:SetWide(64)d:SetMouseInputEnabled(false)d:SetBackgroundColor(col.transparent)d:AddPanel('DImage',function(j)j:Dock(FILL)self.icon=j end)end)self:AddPanel('srp_panel',function(d)d:Dock(FILL)d:SetMouseInputEnabled(false)d:SetBackgroundColor(col.transparent)d:AddPanel('srp_label',function(k)k:Dock(TOP)k:SetContentAlignment(1)k:SetTall(22)k:SetFont'ui_header.r'k:SetMouseInputEnabled(false)self.name=k end)d:AddPanel('srp_label',function(k)k:Dock(FILL)k:SetContentAlignment(7)k:SetMouseInputEnabled(false)k:SetWrap(true)k:SetFont'ui_label.s'self.description=k end)end)self:AddPanel('srp_panel_rounded',function(d)d:Dock(RIGHT)d:SetWide(70)d:SetMouseInputEnabled(false)d:SetBackgroundColor(col.transparent)d:AddPanel('srp_label',function(k)k:Dock(TOP)k:SetContentAlignment(2)k:SetTall(30)k:SetFont'ui_header.rb'k:SetText'0/0'k:SetMouseInputEnabled(false)k:DockMargin(0,0,0,0)self.level=k end)d:AddPanel('srp_label',function(k)k:Dock(FILL)k:SetContentAlignment(8)k:SetMouseInputEnabled(false)k:DockMargin(0,0,0,0)k:SetText'1 Gold'self.money=k end)self.info=d end)hook('OnGroupUpgraded',self,self.OnUpgradePurchased)end;function a:OnUpgradePurchased(e,h,l)if e.id==self.Group.id&&h.id==self.Upgrade.id then self:UpdateCount(l)end end;function a:OnRemove()hook.Remove('OnGroupUpgraded',self)end;function a:Populate(e,h)self.Group=e;self.Upgrade=h;self.info:SetBackgroundColor(e:GetColor())self:SetBackgroundColor(e:GetAltColor())self:SetHoverColor(e:GetAltColor())self.icon:SetMaterial(h.icon)self.name:SetText(h.name)self.description:SetText(h.description||'')self.money:SetText(h.cost..' Gold')local m=e:GetUpgrade(h.id)||0;self:UpdateCount(m)local n=LocalPlayer():GetGroup()local o=LocalPlayer():GetGroupRank()if n&&n.id==e.id then self.CanEdit=o:HasPermission'edit'end end;function a:UpdateCount(p)self.level:SetText(p..'/'..self.Upgrade.max)end;vgui.Register('srp_group_upgrade',a,'srp_button_rounded')local a={}local q=Material'materials/galactic/ui/menu/usd.png'function a:Init()self:DockPadding(0,0,0,0)self:SetBackgroundColor(col.gold)self:SetHoverColor(col.gold)self.lbl:Remove()self:AddPanel('srp_panel',function(d)d:Dock(LEFT)d:SetWide(64)d:SetMouseInputEnabled(false)d:SetBackgroundColor(col.transparent)d:AddPanel('DImage',function(j)j:Dock(FILL)j:SetMaterial(q)self.icon=j end)end)self:AddPanel('srp_panel',function(d)d:Dock(FILL)d:SetMouseInputEnabled(false)d:SetBackgroundColor(col.transparent)d:AddPanel('srp_label',function(k)k:Dock(TOP)k:SetContentAlignment(1)k:SetTall(28)k:SetFont'ui_header.r'k:SetText'0 Gold'k:SetMouseInputEnabled(false)self.money=k end)d:AddPanel('srp_label',function(k)k:Dock(FILL)k:SetContentAlignment(7)k:SetMouseInputEnabled(false)k:SetText'Contribute to the group and earn gold.'self.desc=k end)end)hook('OnGroupMoneyUpdated',self,self.OnGroupMoneyUpdated)end;function a:OnGroupMoneyUpdated(e,r)if self.Group.id==e.id then self.money:SetText(r..' Gold')end end;function a:OnRemove()hook.Remove('OnGroupMoneyUpdated',self)end;function a:Populate(e)self.Group=e;self.money:SetText(e:GetMoney()..' Gold')end;vgui.Register('srp_group_money',a,'srp_button_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/hacking_cl.lua:
srp.hacking=srp.hacking||{}if IsValid(srp.hacking.menu)then srp.hacking.menu:Remove()end;function srp.hacking.OpenInjectionMenu(a)srp.ui.Create('srp_hackinginstallpanel',function(b)b:Populate(a)end)end;function srp.hacking.RequestInput(c)net.Start'srp.hacking.RequestInput'c:WriteInput()net.SendToServer()end;function srp.hacking.RequestInject(a,d)net.Start'srp.hacking.RequestInject'net.WriteEntity(a)net.WriteString(d.id)net.SendToServer()end;net('srp.hacking.RequestInject',function()hook.Run('OnHackingDeviceInjectionStatusReceived',net.ReadEntity(),net.ReadBool())end)net('srp.hacking.Start',function()if IsValid(srp.hacking.menu)then srp.hacking.menu:Remove()end;local e=net.ReadUInt(3)local f={}for g=1,e do f[g]=srp.hacking.Get(net.ReadString())end;if f[1]then local h=net.ReadTable()srp.ui.Create('srp_hacking',function(b)b:SetGameQueue(e,f,h)srp.hacking.menu=b end)hook.Run('OnHackStarted',f,h)end end)net('srp.hacking.Next',function()hook.Run('OnHackNext',net.ReadUInt(3),net.ReadTable())end)net('srp.hacking.Stop',function()hook.Run('OnHackStopped',net.ReadUInt(2))end)net('srp.hacking.FailAttempt',function()util.ScreenShake(LocalPlayer():GetShootPos(),20,40,0.25,200)hook.Run('OnHackFailedAttempt',net.ReadUInt(3))end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/ui/hackingstep_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/ui/hackingstep_ui.lua:
local a={}function a:Init()self:DockPadding(15,5,5,5)self:AddPanel('srp_label',function(b)b:Dock(FILL)b:SetFont'ui_label.rb'b:SetContentAlignment(5)self.name=b end)end;function a:SetText(c)self.name:SetText(c)end;function a:SetSelected(d)self.selected=d;self:SetBackgroundColor(d&&col.orange||col.grey_dark)end;function a:Paint(e,f)draw.NoTexture()surface.SetDrawColor(col.grey)surface.DrawRect(0,0,e,f)surface.SetDrawColor(self.m_bgColor)surface.DrawRect(0,f-2,e,2)end;vgui.Register('srp_hackstep',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/notifications/ui/newsticker_ui.lua:
local a={}function a:Init()self:SetBackgroundColor(col.grey_light)self:SetSize(400,40)self:SetPos((ScrW()-400)*.5,40)self:SetTitle''self:DockPadding(0,0,0,0)self:SetBorderColor(col.red)self.close:SetBackgroundColor(col.red)self.close:Dock(RIGHT)self.close:DockMargin(0,0,0,0)self.font='ui_header.r'self.color=Color(255,255,255)self.mx=400 end;function a:Populate(b)if self.text==b.message then return end;self.color=b.color&&Color(b.color[1],b.color[2],b.color[3])||self.color;self.text=b.message;self.from=b.from||0;self.font=b.font||'ui_label.l'self.til=b.to||0;self.close:SetBackgroundColor(self.color)self.close:SetHoverColor(self.color)surface.PlaySound'npc/turret_floor/ping.wav'surface.SetFont(self.font)self.width,self.height=surface.GetTextSize(self.text)self:SetHeight(self.height+10)self:AlphaTo(255,1,0)end;function a:Think()if!self.text||!self.til||self.til==0 then return end;if self.til<os.time()then self:Remove()end end;function a:Paint(c,d)if!self.text||!self.width then return end;self.mx=self.mx<-self.width&&c+5||self.mx-100*FrameTime()surface.SetDrawColor(col.grey)surface.DrawRect(0,0,c,d)surface.SetTextColor(255,255,255,255)surface.SetFont(self.font)surface.SetTextPos(self.mx,(d-self.height)*.5)surface.DrawText(self.text)surface.SetDrawColor(self.color)surface.DrawRect(1,1,5,d)surface.SetDrawColor(self.color)surface.DrawOutlinedRect(0,0,c,d)end;vgui.Register('srp_newsticker',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/ui/menu_ui.lua:
local a={}local b=Color(200,200,200)local c=Color(44,44,44)local d=Color(col.orange.r*.75,col.orange.g*.75,col.orange.b*.75)function a:Init()self:SetTitle'THE CORE'self:SetTitleFont'ui_label.l'self:SetTitleColor(b)self:DockPadding(1,31,1,1)self:SetBorderColor(col.grey_light)self:SetDeleteOnClose(false)self:SetCloseCode(KEY_F4)self:SetBackgroundColor(col.midnight_dark)self:SetPopupStayAtBack(true)self:AddPanel('srp_tabs_icon',function(e)e:Dock(FILL)e:SetBackgroundColor(col.midnight_dark)e:SetStripBackgroundColor(col.midnight_light)e:SetButtonSelectedTextColor(col.white)e:SetButtonDeselectedTextColor(col.white_dark)e:SetButtonBackgroundColor(col.midnight)e:SetButtonHoverColor(col.midnight_dark)e:SetButtonSelectedBackgroundColor(col.midnight_dark)e.strip:DockPadding(4,4,4,4)self.tab=e end)end;function a:AddPage(...)self.tab:AddPage(...)end;function a:SelectItemByName(f)return self.tab:SelectItemByName(f)end;function a:SelectItem(g)self.tab:SelectItem(g)end;function a:OnRemove()end;function a:Paint(h,i)derma.SkinHook('Paint','RoundedPanel',self,h,i)end;vgui.Register('srp_f4menu',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/imprints/ui/imprint_ui.lua:
local a={}local function b(c,d)local e={}for f=1,d do e[f-1]=Material('materials/galactic/ui/imprints/'..c..'/'..f..'.png')end;return e end;local g={white=b('white',8),green=b('green',8),red=b('red',8),blue=b('blue',8)}local h={white=col.midnight,green=col.midnight,red=Color(100,25,25,100),blue=col.midnight}function a:Init()self.Tier=0;self.ImprintType='white'self.ImprintColor=h.white end;function a:Populate(i)self.Imprint=i;self.ImprintType=i.Type||'white'self.Description=i.Description||''end;function a:SetLevel(j)if!self.Imprint then return end;self.Tier=j;self.TierMaterial=g[self.ImprintType][j]||g[self.ImprintType][#g[self.ImprintType]]end;function a:Paint(k,l)if!self.TierMaterial then return end;local m=k>l&&l||k;surface.SetMaterial(self.TierMaterial)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect((k-m)/2,(l-m)/2,m,m)draw.SimpleText(self.Tier||0,'ui_header.l',k/2,l/2,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;vgui.Register('srp_imprint_embed',a,'srp_panel')local a={}function a:Init()self:SetText'Imprint name'self:SetBackgroundColor(col.midnight_light)self:SetHoverColor(col.midnight)self.UnlockPercent=0.2;self.TierColor=h.white;self:LeftClick(function(n)net.Start'srp.imprint.Upgrade'net.WriteUInt(self.Imprint.internal,7)net.SendToServer()end)self:AddPanel('srp_imprint_embed',function(o)o:Dock(LEFT)o:DockMargin(4,4,4,4)o:SetKeyboardInputEnabled(false)o:SetMouseInputEnabled(false)self.Embed=o end)self:AddPanel('srp_panel',function(o)o:Dock(FILL)o:SetMouseInputEnabled(false)o:SetBackgroundColor(col.transparent)self.lbl:SetFont'ui_header.r'self.lbl:DockMargin(3,1,1,1)self.lbl:SetContentAlignment(7)self.lbl:SetParent(o)self.lbl:Dock(TOP)self.lbl:SetTall(23)o:AddPanel('srp_label',function(p)p:SetText''p:Dock(FILL)p:SetContentAlignment(7)p:SetKeyboardInputEnabled(false)p:SetMouseInputEnabled(false)p:SetWrap(true)p:SetTextColor(col.white_dark)self.Description=p end)o:AddPanel('srp_panel',function(o)o:Dock(BOTTOM)o:DockMargin(0,0,0,0)o:DockPadding(0,0,0,0)o:SetBackgroundColor(col.transparent)o:AddPanel('srp_label',function(p)p:SetText'0%'p:Dock(LEFT)p:SetContentAlignment(4)p:SetWide(35)self.CurrentValue=p end)o:AddPanel('srp_label',function(p)p:SetFont'SSRPForkAwesome'p:SetText(0xf0a9,true)p:Dock(LEFT)p:SetVisible(false)p:SetContentAlignment(5)p:SetWide(14)self.ValueArrow=p end)o:AddPanel('srp_label',function(p)p:SetText'0%'p:Dock(FILL)p:SetVisible(false)p:SetContentAlignment(4)p:SetWide(35)p:SetTextColor(col.green)self.NextValue=p end)end)end)end;function a:Populate(i,j)self.Imprint=i;self.TierColor=h[i.Type||'white']||h.white;self.Embed:Populate(i)self:SetLevel(j)self:SetText(i.Name)self.Description:SetText(i.Description)end;function a:SetLevel(j)self.Tier=j;self.Embed:SetLevel(j)self.UnlockPercent=0;local q,r=self.Imprint:GetStats(LocalPlayer())self.CurrentValue:SetText(math.Round(q*100,2)..'%')self.CurrentValue:SizeToContentsX()if r then local s=self.Imprint:GetPrice(LocalPlayer())self.ValueArrow:SetVisible(true)self.NextValue:SetVisible(true)self.NextValue:SetText(math.Round(r*100,2)..'% ('..string.Comma(math.Round(s,0))..' RC)')else self.ValueArrow:SetVisible(false)self.NextValue:SetVisible(false)end;if self.Tier>=#self.Imprint.Tiers then self.CurrentValue:SetTextColor(col.green)end end;function a:PerformLayout(k,l)if IsValid(self.Embed)then self.Embed:SetWide(l-8)end end;function a:Paint(k,l)draw.NoTexture()surface.SetDrawColor(40,40,40,168)surface.DrawTexturedRect(0,0,k,l)surface.SetDrawColor(self.TierColor)surface.DrawArc(k*0.6,l*0.2,0,125,0,360,60)self.UnlockPercent=Lerp(RealFrameTime()/.5,self.UnlockPercent||0,1)surface.SetDrawColor(72,72,72,168)surface.DrawArc(k*0.3,l*0.1,0,400*self.UnlockPercent,0,360,60)surface.SetDrawColor(40,40,40,168)surface.DrawArc(k*0.6,l*0.2,0,400*self.UnlockPercent,0,360,60)if self.UnlockPercent>.5 then surface.SetDrawColor(self.TierColor)surface.DrawArc(k*0.6,l*0.2,0,250*(self.UnlockPercent-0.5),0,360,60)end;if self.UnlockPercent<=0.6 then surface.SetDrawColor(50,50,50)surface.DrawOutlinedRect(0,0,k,l)else surface.SetDrawColor(55,55,55,255)surface.DrawOutlinedRect(0,0,k,l)end end;vgui.Register('srp_imprint',a,'srp_button_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/imprints/ui/imprints_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/imprints/ui/imprints_ui.lua:
local a={}local b=Material('materials/galactic/ui/menu/imprints.png','smooth')local c=Material('materials/galactic/ui/menu/usd.png','smooth noclamp nomips')function a:Init()self:SetBackgroundColor(col.transparent)self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self.Imprints={}self:AddPanel('srp_label',function(d)d:SetFont'ui_header.l'd:SetText'Genome Imprints'd:Dock(TOP)d:SetTall(30)d:DockMargin(15,15,15,1)end)self:AddPanel('srp_label',function(d)d:SetFont'ui_header.s'd:SetText'Genome editing gives you stat changes for all characters at the cost of RC.'d:Dock(TOP)d:DockMargin(16,1,15,5)end)self:AddPanel('srp_grid',function(e)e:Dock(FILL)e:SetSpacing(15,15)self.Grid=e end)self:AddPanel('srp_button_tag_rounded',function(f)f:SetText'Purchase All Imprints'f:SetFont'ui_label.rb'f:SetWide(230)f:SetMaterial(c)f:SetBackgroundColor(col.midnight_dark)f:SetHoverColor(col.midnight)f:SetBorderColor(col.gold)f:SetMaterialBackground(col.transparent)f:SetVisible(false)f:LeftClick(function(g)if!g.Cost||g.Cost<=0 then return end;srp.ui.Create('srp_purchase',function(h)h:SetText'Imprints'h:SetDescription('Unlock the remaining tiers of your imprints.\n\nThe cost scales based on how many imprints you have already purchased.')h:SetCredits(g.Cost)h:SetMaterial(b)h:OnAccept(function(i)if IsValid(g)then g:SetDisabled(true,2)end;srp.imprint.UpgradeAll()end)end)end)self.Purchase=f end)self:UpdateTierPurchase()hook.Add('OnImprintsSynced',self,self.UpdateTiers)hook.Add('OnImprintUpgraded',self,self.UpdateTier)end;function a:PerformLayout(j,k)self.Purchase:SetPos(j-268,25)end;function a:OnRemove()hook.Remove('OnImprintsSynced',self)hook.Remove('OnImprintUpgraded',self)end;function a:UpdateTier(l,m,n)local h=self.Imprints[l]if IsValid(h)then h:SetLevel(n)end;self:UpdateTierPurchase()end;function a:UpdateTierPurchase()local o=srp.imprint.GetAll(true)local p=srp.imprint.GetRemainingPriceTotal(LocalPlayer(),o,true)if!p||p<=0 then self.Purchase:SetVisible(false)return end;self.Purchase.Cost=p;self.Purchase:SetVisible(true)self.Purchase:SetText('Purchase all for '..string.Comma(p)..' Credits')end;function a:UpdateTiers(o)for l,n in pairs(o)do self:UpdateTier(l,nil,n)end;self:UpdateTierPurchase()end;function a:Populate()for l,m in pairs(srp.imprint.GetAll(true))do srp.ui.Create('srp_imprint',function(h)h:Populate(m,LocalPlayer():GetImprintTier(m.id))h:SetSize(320,90)self.Grid:AddItem(h)self.Imprints[m.id]=h end)end end;vgui.Register('srp_imprints',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/items/resources/resources_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/items/ui/itemtooltip_ui.lua:
local a={}local b=col.white_dark:Copy()local c=Color(66,66,66,200)local d=col.midnight_light:Copy()local e=col.midnight_dark:Copy()local f=Material'gui/gradient_up'local g=Material'gui/gradient_down'local h=Material('gui/lmb.png','noclamp')local i=Material('gui/rmb.png','noclamp')function a:Init()self:SetSkin'SRP_SUP'self:SetSize(300,175)self:SetText'Tooltip Test'self:SetBackgroundColor(b)self:SetBorderColor(c)self:SetDrawOnTop(true)self:AddPanel('srp_panel_rounded',function(j)j:Dock(TOP)j:SetBackgroundColor(col.midnight_dark)j:DockMargin(0,0,0,0)j:SetTall(30)j:AddPanel('srp_label',function(k)k:Dock(FILL)k:SetContentAlignment(5)k:SetFont'ui_header.s'self.Title=k end)end)local l=140;local m=(l-60)/2-10;self:AddPanel('srp_panel',function(j)j:Dock(FILL)j:SetBackgroundColor(col.transparent)j:DockMargin(0,4,0,0)j:DockPadding(0,0,0,0)j:AddPanel('srp_panel_rounded',function(j)j:Dock(LEFT)j:SetWide(64)j:DockPadding(2,2,2,2)j:DockMargin(0,0,10,0)j:SetBackgroundColor(col.midnight_dark)j:AddPanel('DImage',function(n)n:SetSize(58,58)self.Image=n end)j:AddPanel('srp_label',function(k)k:Dock(BOTTOM)k:SetContentAlignment(5)k:SetFont'ui_label.r'k:SetText'feather'self.Weight=k end)self.ImageBackground=j end)j:AddPanel('srp_label',function(k)k:Dock(TOP)k:SetContentAlignment(4)k:SetTextColor(col.grey_dark)k:SetFont'ui_label.xl'k:SetTall(35)self.Count=k end)j:AddPanel('srp_label',function(k)k:Dock(TOP)k:SetContentAlignment(7)k:SetTextColor(col.grey_dark)k:SetFont'ui_label.r'self.Description=k end)j:AddPanel('srp_panel',function(j)j:Dock(BOTTOM)j:SetTall(28)j:SetBackgroundColor(col.transparent)j:DockPadding(0,0,0,0)self.interactive=j end)self.MainContainer=j end)end;function a:SetText(o)if o&&istable(o)then self:Populate(o)end end;function a:Populate(o)local p,q=o.item,o.count;local r=o.containerMode;self.Title:SetText(p.name||'NO_ID')if p.icon then self.Image:SetMaterial(p.icon)self.Image:SetImageColor(col.white)if p.color then self.Image:SetImageColor(p.color)end else self.Image:SetVisible(false)end;self.Count:SetText(q||0)self:WriteWrapped(p.description||'NO_DESCRIPTION')local s=o.cell&&o.cell.meta;if s then self:BuildMeta(p,s)end;if p.weight&&p.weight>0 then self.Weight:SetFont'ui_label.r'if p.weight>=100 then self.Weight:SetText(math.Round(p.weight/1000,2)..'kg')else self.Weight:SetText(p.weight..'g')end else self.Weight:SetFont'SSRPForkAwesome'self.Weight:SetText(0xf0c2,true)end;if o.mouse2 then self:AddInteractive(i,60,o.mouse2)end;if o.mouse1 then self:AddInteractive(h,140,o.mouse1,o.mouse1icon)end;if p.tradecolor then local t=p.tradecolor;local u,v,w=ColorToHSL(t)local x=HSLToColor(u,v,w*1.1)self.ImageBackground.Paint=function(v,y,u)draw.RoundedBox(6,0,0,y,u,e)if t then surface.SetDrawColor(x)surface.SetMaterial(g)surface.DrawTexturedRect(2,2,y-4,u-4)surface.SetDrawColor(t)surface.SetMaterial(f)surface.DrawTexturedRect(2,2,y-4,u-4)end end end;if info.Dev then self.DevString=p.id..'  -  '..(o.cell&&o.cell.hash||0)end end;function a:WriteWrapped(z)local A=string.Wrap(z,'ui_label.r',200)z=table.concat(A,'\n')self.Description:SetText(z)self.Description:SetTall(20*#A)end;function a:AddInteractive(B,C,z,D)surface.SetFont'ui_label.r'local E,F=surface.GetTextSize(z)if D then self.interactive:AddPanel('DImage',function(n)n:Dock(RIGHT)n:SetWide(24)n:DockMargin(0,4,0,4)n:SetMaterial(D)end)end;self.interactive:AddPanel('srp_button_tag',function(j)j:Dock(RIGHT)j:DockMargin(0,0,0,0)j:SetBackgroundColor(col.transparent)j:SetMaterialBackground(col.midnight_light)j:SetHoverColor(col.transparent)j:SetBorderColor(col.transparent)j:SetTextColor(col.grey_dark)j:SetText(z..' ')j:SetMaterial(B)j:DockMaterial(RIGHT)j:SetContentAlignment(6)j:SetWide(34+E)end)self.interactive:SetVisible(true)end;function a:AddStat(G,H)local I=' ('..(H>0&&'+'||'-')local J=(math.Clamp(H,-1,1)==H&&'%'||'')..')'if H==1 then I=''J=''H=''end;self:SetTall(self:GetTall()+30)self.MainContainer:AddPanel('srp_label',function(j)j:SetTextColor(col.grey_dark)j:SetText(G:Capitalize()..I..H..J)j:Dock(TOP)end)end;function a:PositionTooltip()if!IsValid(self.TargetPanel)then self:Close()return end;self:InvalidateLayout(true)local K,L=self.TargetPanel:LocalToScreen(0,0)local M,N=self.TargetPanel:GetSize()self:SetPos(K+M+4,L-1)end;function a:BuildMeta(p,s)if p.CustomDisplayOverride then local O=p:CustomDisplayOverride(self.MainContainer,s)if O then self:SetTall(self:GetTall()+O)end;return end;local P=p.DisplayMetaInfo&&p:DisplayMetaInfo(self,s)||s;for G,Q in pairs(P)do if isstring(Q)||isnumber(Q)then self:AddStat(G,Q)end end end;function a:OpenForPanel(R)self.TargetPanel=R;self:PositionTooltip()end;function a:PerformLayout(y,u)self.Image:Center()end;function a:Show()self:SetVisible(true)end;function a:Close()self:Remove()end;function a:Paint(y,u)self:PositionTooltip()derma.SkinHook('Paint','Panel',self,y,u)end;function a:PaintOver(y,u)if self.DevString then surface.SetFont('ui.10')local E,S=surface.GetTextSize(self.DevString)draw.RoundedBox(6,(y-E-10)/2,33-5,E+10,10,col.midnight_dark)draw.SimpleText(self.DevString,'ui.10',y/2,33,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end;vgui.Register('srp_itemtip',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/cuffs_sh.lua:
nw.Register'srp.jail.cuffed':Write(net.WriteBool):Read(net.ReadBool):SetPlayer():SetHook('OnPlayerCuffed')nw.Register'srp.jail.cuffedlegs':Write(net.WriteBool):Read(net.ReadBool):SetPlayer():SetHook('OnPlayerLegsCuffed')function PLAYER:IsCuffed()return self:GetNetVar('srp.jail.cuffed')end;function PLAYER:SetCuffedLegs(a)self:SetNetVar('srp.jail.cuffedlegs',a)end;function PLAYER:IsCuffedLegs()return self:GetNetVar('srp.jail.cuffedlegs')end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/jails_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/leaderboard/ui/leaderboard_ui.lua:
local a={}local b=300;local c=320;function a:Init()self:SetBackgroundColor(col.midnight)self:AddPanel('srp_label',function(d)d:SetText'Leaderboard'd:Dock(TOP)d:SetTall(40)d:SetFont'ui.20'd:SetContentAlignment(5)d:SetBackgroundColor(col.black)self.Title=d end)self:AddPanel('ui_scrollpanel',function(e)e:Dock(FILL)srp.ui.Create('srp_grid',function(f)f:Dock(TOP)f:SetAutoHeight(true)self.Grid=f;e:AddItem(f)end)end)end;function a:Populate(g)local h=srp.leaderboard.Get(g.ID)if!h then self:Remove()return end;self.Title:SetText(h.Name)for i,j in ipairs(g.Results)do if i>h.MaxCount&&i==#g.Results then srp.ui.Create('srp_panel',function(k)k:SetTall(4)k:SetBackgroundColor(col.black)self.Grid:AddItem(k,true)end)end;srp.ui.Create('srp_leaderboard_line',function(k)k:Populate(h,j,i==g.Position)self.Grid:AddItem(k,true)end)end;self:Start(#g.Results)end;function a:Start(l)c=60+l*44;local m=(ScrH()-c)*.5;self:SetSize(b,c)self:SetPos(-b-2,m)self:MoveTo(2,m,.5,0)self:SetAlpha(0)self:AlphaTo(255,.25,0,function()if!IsValid(self)then return end;self:MoveTo(-b,m,.5,10)self:AlphaTo(0,.25,10,function()if IsValid(self)then self:Remove()end end)end)end;vgui.Register('srp_leaderboard',a,'srp_panel_rounded')local a={}function a:Init()self:SetTall(40)self:SetBackgroundColor(col.midnight_dark)self:AddPanel('srp_label',function(d)d:Dock(LEFT)d:SetContentAlignment(5)d:SetWide(35)d:SetFont'ui.16'self.Rank=d end)self:AddPanel('srp_label',function(d)d:Dock(FILL)d:SetContentAlignment(4)d:SetFont'ui.16'self.Display=d end)self:AddPanel('srp_label',function(d)d:Dock(RIGHT)d:SetContentAlignment(5)d:SetWide(50)d:SetFont'ui.16'self.Value=d end)end;function a:Populate(h,n,o)self.Rank:SetText('##'..n.rank)self.Display:SetText(n.display)self.Value:SetText(h.GetValue&&h:GetValue(n.value)||n.value)if o then self:SetBackgroundColor(col.blue_light)if n.rank<=3 then cmd.Run('emotename','cheer',1)end end end;vgui.Register('srp_leaderboard_line',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loadouts/loadout_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loginrewards/loginrewards_cl.lua:
srp.loginrewards=srp.loginrewards||{}local a;net('srp.loginrewards.Send',function()if IsValid(a)then a:Remove()end;local b,c=net.ReadUInt(16),net.ReadUInt(4)local d={}for e=1,c do table.insert(d,{itemid=net.ReadString(),count=net.ReadUInt(8),chance=net.ReadUInt(7)})end;local f,g;if net.ReadBool()then local h=net.ReadUInt(12)f=srp.loginrewards.GetMilestone(h,true)g=f:Read(pl)end;srp.ui.Create('srp_loginrewards',function(i)i:Populate(b,d,f,g)a=i end)end)net('srp.loginrewards.Select',function()hook.Run('OnDailRewardClaimed',net.ReadUInt(4))end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loginrewards/ui/loginrewardmilestone_ui.lua:
local a={}local b=Color(150,150,150,222)local function c(self,d,e)surface.DisableClipping(true)surface.SetDrawColor(self.SkewColor||b)local f,g=self:GetDockPadding()local h=self.skew||-15;self.poly=self.poly||{{x=-h-f,y=-g},{x=d+f-h,y=-g},{x=d+f+h,y=e+g},{x=h-f,y=e+g}}draw.NoTexture()surface.DrawPoly(self.poly)surface.DisableClipping(false)end;function a:Init()self:DockPadding(2,2,2,2)self:DockMargin(0,0,0,0)self:AddPanel('srp_label',function(i)i:SetText'Your Daily Milestone'i:SetFont'ui_header.r'i:SetContentAlignment(5)i:DockPadding(10,-10,-10,-10)i:SetSize(150,45)i.Paint=c;i.skew=-5;self.title=i end)self.lbl:Remove()self:LeftClick(function()self.Milestone=nil;self:SetDays(self.days)end)end;function a:PerformLayout(d,e)if IsValid(self.title)then self.title:SetPos((d-150)/2,0)end end;function a:SetDays(j)self.days=j||1;self.NextMilestone,day=srp.loginrewards.GetNextMilestone(j)if self.NextMilestone then self.DaysLeft=day-j;self.NextMilestonePercent=j/day end end;function a:SetMilestone(k,l)if k then self.Milestone=k;self.MilestoneData=l||{}self.DaysLeft=0;self.NextMilestonePercent=1 end end;local m=Color(222,222,222,150)local n=Color(50,255,50,200)local o=Color(75,255,75,150)local p=128;function a:Paint(d,e)local q=e*.35;local r=self.Milestone!=nil;if self.Milestone then surface.SetDrawColor(255,255,255,255)surface.SetMaterial(self.Milestone.icon)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect((d-(q+10))/2,(e-(q+10))/2-20,q+10,q+10)elseif self.NextMilestone then surface.SetDrawColor(255,255,255,15)surface.SetMaterial(self.NextMilestone.icon)surface.DrawTexturedRect((d-(q+10))/2,(e-(q+10))/2,q+10,q+10)end;self.ArcPercentage=math.Approach(self.ArcPercentage||0,self.NextMilestonePercent||0,RealFrameTime()/1*2)render.PushFilterMag(TEXFILTER.ANISOTROPIC)render.PushFilterMin(TEXFILTER.ANISOTROPIC)draw.NoTexture()surface.SetDrawColor(r&&(self:IsHovered()&&o||n)||m)if r then self.unlockedPercent=(self.unlockedPercent||0)+RealFrameTime()/1*3;local s=self.unlockedPercent%1;surface.DrawArc(d*0.5,e*0.5,q+10*s-4,q+10*s,0,360,361)end;surface.DrawArc(d*0.5,e*0.5,q-8,q,0,360*(self.ArcPercentage||1),361)render.PopFilterMag()render.PopFilterMin()local t=r&&e*.70||e/2;draw.SimpleText('Day '..(self.days||1),'ui_header.l',d/2,t-10,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)if self.Milestone then draw.SimpleText(self.MilestoneData.prettyname||self.MilestoneData.name||self.Milestone.name||self.Milestone.id,'ui_label.r',d/2,t+8,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)elseif self.DaysLeft then draw.SimpleText((self.DaysLeft||0)..' Days left until next milestone item','ui_label.r',d/2,t+8,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)end end;vgui.Register('srp_loginrewardmilestone',a,'srp_button')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/doors/ui/agent_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/doors/ui/agentheader_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/doors/ui/agentheader_ui.lua:
local a={}local b=Material('materials/galactic/ui/agency.png','noclamp smooth')local c=b:Height()/b:Width()function a:Init()self:DockPadding(70,100,70,200)self:DockMargin(0,0,0,0)self:AddPanel('srp_panel_rounded',function(d)d:SetBackgroundColor(Color(0,0,0,50))d:Dock(BOTTOM)d:DockPadding(0,0,0,0)d:DockMargin(0,0,0,0)d:SetTall(50)d:AddPanel('srp_label',function(e)e:SetTextColor(col.red)e:SetFont'ui_label.rb'e:SetText'A one time purchase is required for a property. You can only have one property at a time.\n  Please only buy a business property if you plan to roleplay as a public-facing business.'e:SetContentAlignment(5)e:Dock(FILL)end)end)end;function a:Paint(f,g)local h=g*.24-math.sin(CurTime()*2)*10;draw.DrawText('R','SSRPForkAwesomeExtraLarge',f/2,h,col.grey_light,TEXT_ALIGN_CENTER)draw.DrawText('THE AGENCY','ui_header.l',f/2,g*.40,col.grey_light,TEXT_ALIGN_CENTER)draw.DrawText('Helping you find your dream home','ui_header.r',f/2,g*.45,col.grey_light,TEXT_ALIGN_CENTER)end;vgui.Register('srp_agentheader',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/funcmodules/funcmodule_cl.lua:
srp.funcmodules=srp.funcmodules||{}srp.funcmodules.ui=srp.funcmodules.ui;local a={}function PLAYER:GetGravity()return self:GetNetVar('Gravity')||0 end;function srp.funcmodules.RegisterDisplay(b,c,d,e)a[b]={id=b,text=c,icon=d,click=e}end;function srp.funcmodules.DisplayWarning(b,c)local f=a[b]if IsValid(srp.funcmodules.ui)then srp.funcmodules.ui:AddWarning(b,f||c)return end;srp.ui.Create('srp_funcmodulearea',function(g)g:AddWarning(b,f||c)srp.funcmodules.ui=g end)end;function srp.funcmodules.RemoveWarning(b)if IsValid(srp.funcmodules.ui)then srp.funcmodules.ui:RemoveWarning(b)end end;hook('SetupMove',function(h)if h:GetGravity()>0 then h:SetGravity(h:GetGravity())end end)net('srp.funcmodules.DisplayWarning',function()local b=net.ReadString()local c=net.ReadBool()&&net.ReadString()srp.funcmodules.DisplayWarning(b,c)end)net('srp.funcmodules.RemoveWarning',function()srp.funcmodules.RemoveWarning(net.ReadString())end)srp.funcmodules.RegisterDisplay('medical','The Bacta Tank Controller has been damaged!',Material('materials/galactic/ui/talents/hackfailure.png'))srp.funcmodules.RegisterDisplay('explosions','Shields are down. Be careful!',Material('materials/galactic/ui/rts/fire.png'))srp.funcmodules.RegisterDisplay('gravity','Gravity generators have failed. Hold on!',Material('materials/galactic/ui/talents/falldamage.png'))srp.funcmodules.RegisterDisplay('oxygen','Oxygen generators are down. Equip oxygen now!',Material('materials/galactic/ui/inventory/oxygen.png'),function(self)LocalPlayer():GetInventory():ClientUse('UTILITY_OXYGEN',1)end)srp.funcmodules.RegisterDisplay('fuse','The engine room fusebox exploded!',Material('materials/galactic/ui/rts/fire.png'))
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/funcmodules/oxygen_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/mapchange/mapchange_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/npc/dialogues/ui/dialogue_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/npc/dialogues/ui/dialogue_ui.lua:
local a={}local b=Color(0,0,0,220)local c=Color(0,0,0,235)local d=Color(25,25,25,255)function a:Init()self:SetTitle'Dialogue Box'self:DockPadding(0,0,0,0)self:SetPos((ScrW()-600)*.5,ScrH())self:SetBackgroundColor(col.transparent)self:SetBorderColor(col.transparent)self.close:Remove()self:MakePopup()self:AddPanel('srp_panel',function(e)e:Dock(TOP)e:SetTall(110)e:SetBackgroundColor(d)e:SetBorderColor(d)e:DockPadding(8,10,8,0)self.title:SetParent(e)self.title:Dock(TOP)self.title:DockMargin(0,0,0,10)e:AddPanel('srp_label',function(f)f:Dock(FILL)f:SetFont('ui_label.l')f:SetContentAlignment(7)f:DockMargin(0,0,0,0)self.speech=f end)self.container=e end)self:AddPanel('srp_panel',function(e)e:Dock(FILL)e:SetBackgroundColor(col.transparent)e:DockPadding(0,0,0,0)self.buttons=e end)end;function a:SetDialogue(g)self.dialogue=srp.dialogue.data[g]||nil;if!self.dialogue then return end;if self.dialogue.UseCamera&&IsValid(self.npc)then srp.camera.SetPos(self.npc:LocalToWorld(self.dialogue.UICameraOffset),self.npc:LocalToWorldAngles(self.dialogue.UICameraAngle),0.1,true)end;self:SetTitle(self.dialogue.name)if self.dialogue.StartTree then self:DisplayTree(self.dialogue.StartTree)elseif self.dialogue.GetStartTree then local h=self.dialogue:GetStartTree()||1;if!self.dialogue.tree[h]then self:Remove()return end;self:DisplayTree(h)else self:DisplayTree(1)end;return self end;function a:DisplayTree(h)if!self.dialogue||!self.dialogue.tree then return end;local i=self.dialogue.tree[h]if!i then return end;self.buttons:Clear()self.treeid=h;local j=self.dialogue.color;local k,l,m=ColorToHSV(j)local n=HSVToColor(k,math.max(0,l-.4),m)n.a=150;local o=string.RPFormat(LocalPlayer(),i.speech||"{Missing Speech}")self.speech:SetText(o)self.title:SetTextColor(j)if i.sound then if IsValid(self.npc)then self.npc:EmitSound(i.sound,SNDLVL_IDLE,100,1,CHAN_VOICE)else surface.PlaySound(i.sound)end end;local p=i.options||{}local q=0;for r=1,#p do local s=p[r]if s.CanView&&!s:CanView(self.dialogue,i,LocalPlayer())then continue end;srp.ui.Create('srp_button_rounded',function(t)t.id=r;t.option=s;t.controller=self;t:SetFont'ui_label.l't:SetText(s.text)t:DockPadding(10,5,5,5)t:DockMargin(0,4,0,0)t:SetParent(self.buttons)t:Dock(TOP)t:SetTall(45)t:SetTextColor(col.white)t:SetContentAlignment(4)t:SetBackgroundColor(b)local u=Color(b.r,b.g,b.b)t:SetHoverColor(u)t:LeftClick(self.ProcessRequest)end)q=q+1 end;self:SetTall(q*45+q*4+115)self:MoveTo((ScrW()-600)*.5,ScrH()-self:GetTall()-70,.5,0,.5)return self end;function a:ProcessRequest()local v=self.controller;local w=v.dialogue;local h=v.treeid;if!w||!h then return end;local s=self.option;local x=s.close;local y=s.OnClick;local z=s.moveto;if y then local A=y(w,LocalPlayer(),self.npc,h,s)z=z||A;if A==true then x=true end;srp.dialogue.SendOnClick(w.id,h,self.id,v.npc)end;if x then v:MoveTo((ScrW()-600)*.5,ScrH(),.5,0,.5,function()v:Remove()end)elseif z then v:DisplayTree(z)end end;function a:Close()self:MoveTo((ScrW()-600)*.5,ScrH(),.5,0,.5,function()self:Remove()end)end;function a:OnRemove()if self.dialogue.UseCamera then srp.camera.Stop(true)end end;vgui.Register('srp_dialogue',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/patrols/ui/routepath_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/binds/binds_cl.lua:
local function a()local b=LocalPlayer():GetEyeTraceNoCursor().Entity;if!IsValid(b)||!b:IsPlayer()then return nil,'You are not currently aiming at a player.'end;if b:GetPos():DistToSqr(LocalPlayer():GetPos())>180000 then return nil,'You are too far away from that player.'end;return b end;srp.binds=srp.binds||{}srp.binds.TYPE_CHAT=1;srp.binds.TYPE_COMMAND=2;srp.binds.TYPE_GAME=3;srp.binds.Macros={['{my.Name}']={GetValue=function()return LocalPlayer():Name()end,Description='Your Name'},['{my.SteamID}']={GetValue=function()return LocalPlayer():SteamID()end,Description='Your SteamID'},['{my.Money}']={GetValue=function()return string.Comma(LocalPlayer():GetMoney())end,Description='Your Money'},['{my.Oxygen}']={GetValue=function()return string.Comma(LocalPlayer():GetOxygen())end,Description='Your Oxygen'},['{my.Fuel}']={GetValue=function()return string.Comma(LocalPlayer():GetFuel())end,Description='Your Fuel'},['{my.Allegiance}']={GetValue=function()return LocalPlayer():GetAllegiance().name end,Description='Your Allegiance'},['{my.Battalion}']={GetValue=function()local c=LocalPlayer():GetGroup()if!c then return LocalPlayer():GetAllegianceID()else return c:GetName()end end,Description='Your Battalion'},['{my.BattalionTag}']={GetValue=function()local c=LocalPlayer():GetGroup()if!c then return LocalPlayer():GetAllegianceID()else return c:GetTag()end end,Description='Your Battalion Tag'},['{my.CT}']={GetValue=function()return LocalPlayer():CharacterID()end,Description='Your CT Number'},['{my.Weapon}']={GetValue=function()return util.GetPrintName(LocalPlayer():GetActiveWeapon())end,Description='Your current weapon'},['{my.Health}']={GetValue=function()return string.Comma(LocalPlayer():Health())end,Description='Your Health'},['{my.Armor}']={GetValue=function()return string.Comma(LocalPlayer():Armor())end,Description='Your Armor'},['{my.Location}']={GetValue=function()return LocalPlayer():GetLocationName()end,Description='Your Location'},['{aimPlayer.Name}']={GetValue=function()local b,d=a()if b==nil then return nil,d end;return b:Name(true)end,Description='Target\'s Name'},['{aimPlayer.SteamID}']={GetValue=function()local b,d=a()if b==nil then return nil,d end;return b:SteamID()end,Description='Target\'s  SteamID'},['{aimPlayer.Fuel}']={GetValue=function()local b,d=a()if b==nil then return nil,d end;return string.Comma(b:GetFuel())end,Description='Target\'s Fuel'},['{aimPlayer.Allegiance}']={GetValue=function()local b,d=a()if b==nil then return nil,d end;return b:GetAllegiance().name end,Description='Target\'s Allegiance'},['{aimPlayer.Battalion}']={GetValue=function()local b,d=a()if b==nil then return nil,d end;local c=b:GetGroup()if!c then return b:GetAllegiance().name else return c:GetName()end end,Description='Target\'s Battalion'},['{aimPlayer.BattalionTag}']={GetValue=function()local b,d=a()if b==nil then return nil,d end;local c=b:GetGroup()if!c then return b:GetAllegiance().name else return c:GetTag()end end,Description='Target\'s Battalion Tag'},['{aimPlayer.CT}']={GetValue=function()local b,d=a()if b==nil then return nil,d end;return b:CharacterID()end,Description='Target\'s CT Number'},['{aimPlayer.Weapon}']={GetValue=function()local b,d=a()if b==nil then return nil,d end;return util.GetPrintName(b:GetActiveWeapon())end,Description='Target\'s current weapon'},['{aimPlayer.Health}']={GetValue=function()local b,d=a()if b==nil then return nil,d end;return string.Comma(b:Health())end,Description='Target\'s Health'},['{aimPlayer.Armor}']={GetValue=function()local b,d=a()if b==nil then return nil,d end;return string.Comma(b:Armor())end,Description='Target\'s Armor'},['{aimPlayer.Location}']={GetValue=function()local b,d=a()if b==nil then return nil,d end;return b:GetLocationName()end,Description='Target\'s Location'}}srp.binds.Conditions={['Always On']=function(e)return true end,['Is Enforcement']=function(e)return LocalPlayer():IsEnforcement()end,['Is Jedi']=function(e)return LocalPlayer():HasPermission('jedi')end,['Adminmode On']=function(e)return LocalPlayer():IsAdminMode()end}srp.binds.DefaultProfile={Default1={Key=KEY_L,Command='/yell My name is {my.Name}, I have {my.Money} RC, {my.Oxygen} Oxygen and my allegiance is the {my.Allegiance}!',Type=srp.binds.TYPE_CHAT},Default2={Key=KEY_H,Command='ssrp yell {aimPlayer.CT} {aimPlayer.Name}, you have 10 seconds to leave this area',Type=srp.binds.TYPE_COMMAND},Default3={Key=KEY_O,Command='net_graph 0',Type=srp.binds.TYPE_COMMAND},Default4={Key=KEY_P,Command='net_graph 1',Type=srp.binds.TYPE_COMMAND}}local f={'ban','kick','perma','want','unban','jail'}local function g(h)local i=h;for j,k in pairs(srp.binds.Macros)do if string.find(i,j)then for l,m in ipairs(f)do if i:Contains(m)then srp.notif.Warning(10,'You cannot use macros with this command!')return end end;local n,d=k.GetValue()if n==nil then if k.Optional then n=''else srp.notif.Warning(10,d..' (Macro: '..j..')')return end end;i=string.Replace(i,j,n)end end;return i end;local function o(p,q,r,h,s,e)keybind.Add(p,q,function(self,t)local u=srp.binds.Conditions[s]if!u||u(e)then if r==srp.binds.TYPE_CHAT then local i=g(h)if i then chat.Say(i,false)end elseif r==srp.binds.TYPE_COMMAND then local i=g(h)if i then LocalPlayer():ConCommand(i)end end end end):SetClientSide(true):SetCustom(true)end;local function v()for l,w in pairs(keybind.GetTable())do if w:IsCustom()then w:Remove()end;if w:GetDefaultKey()then w:SetKey(w:GetDefaultKey())end end end;local function x(k)srp.binds.HasInit=true;v()local y=k.Profiles[k.ActiveProfile]if!y then return end;for p,z in pairs(y)do if z.Key then if z.Type==srp.binds.TYPE_GAME then local w=keybind.Get(p)if w then if!w:GetDefaultKey()then w:SetDefaultKey(w:GetKey())end;w:SetKey(z.Key)end else o(p,z.Key,z.Type,z.Command,z.Condition,z.Metadata)end end end end;cvar.Register'srp_custom_binds':SetDefault{ActiveProfile='Default',Profiles={Default=srp.binds.DefaultProfile}}:SetEncrypted():AddInitCallback(function(self)x(self:GetValue())end):AddCallback(function(self,k)x(k)end)if srp.binds.HasInit then x(cvar.GetValue('srp_custom_binds'))end;function srp.binds.ReMap(p,A)local B=cvar.GetValue('srp_custom_binds')B.Profiles[srp.binds.GetActiveProfileName()][p]={Key=A,Type=srp.binds.TYPE_GAME}cvar.SetValue('srp_custom_binds',B)end;function srp.binds.Add(q,r,h,s,e)local B=cvar.GetValue('srp_custom_binds')h=h||''s=s||'Always On'local p=hash.SHA256(q..r..h..s..os.time())B.Profiles[srp.binds.GetActiveProfileName()][p]={Key=q,Type=r,Command=h,Condition=s,Metadata=e}cvar.SetValue('srp_custom_binds',B)return p end;function srp.binds.Remove(p)local B=cvar.GetValue('srp_custom_binds')B.Profiles[srp.binds.GetActiveProfileName()][p]=nil;cvar.SetValue('srp_custom_binds',B)end;function srp.binds.GetProfiles()return cvar.GetValue('srp_custom_binds').Profiles end;function srp.binds.GetActiveProfile()local C=srp.binds.GetProfiles()return C[srp.binds.GetActiveProfileName()]||C.Default end;function srp.binds.GetActiveProfileName()return cvar.GetValue('srp_custom_binds').ActiveProfile end;function srp.binds.ProfileExists(D)return srp.binds.GetProfiles()[D]!=nil end;function srp.binds.SetActiveProfile(D)local B=cvar.GetValue('srp_custom_binds')B.ActiveProfile=D;cvar.SetValue('srp_custom_binds',B)end;function srp.binds.AddProfile(D)local B=cvar.GetValue('srp_custom_binds')B.Profiles[D]=srp.binds.DefaultProfile;srp.binds.SetActiveProfile(D)end;function srp.binds.RemoveActiveProfile()local C=srp.binds.GetProfiles()C[srp.binds.GetActiveProfileName()]=nil;srp.binds.SetActiveProfile('Default')end;function srp.binds.RenameActiveProfile(D)local C=srp.binds.GetProfiles()local E=srp.binds.GetActiveProfileName()C[D]=C[E]C[E]=nil;srp.binds.SetActiveProfile(D)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/util/animations_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/queststeps_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/ui/quest_stats_ui.lua:
local a={}local b={'idle_all_01'}local function c(d,e,f)if!IsValid(d)then return end;if d:LookupSequence(e)==-1 then e='gesture_wave_original'f=true end;if IsValid(d)then timer.Remove('ResetAnim.'..d:GetModel())if f then local g,h=d:LookupSequence(e)timer.Create('ResetAnim.'..d:GetModel(),h+0.1,1,function()c(d,'idle_all_01')end)end;d.AutomaticFrameAdvance=true;d:ResetSequence(e)d:SetCycle(0)end end;function a:Init()self:SetSize(ScrW(),ScrH())self:SetPos(0,-ScrH())self:SetAlpha(0)self:SlideIn()self:DockMargin(0,0,0,0)self:DockPadding(0,0,0,0)self:SetBackgroundColor(col.transparent)self:SetMouseInputEnabled(false)self:SetKeyBoardInputEnabled(false)self.Stats={}self:AddPanel('srp_label',function(i)i:DockPadding(10,10,10,10)i:DockMargin(0,0,0,50)i:SetFont'ui_header.l'i:SetSize(400,50)i:SetText'Test'i:SetContentAlignment(5)i:CenterHorizontal()i:CenterVertical(.3)self.QuestName=i end)self:AddPanel('srp_panel',function(j)j:DockPadding(0,0,0,0)j:DockMargin(0,0,0,0)j:SetBackgroundColor(col.transparent)j:SetTall(350)self.StatsPanel=j end)self:AddPanel('srp_panel',function(j)j:SetBackgroundColor(col.transparent)j:DockPadding(0,0,0,0)j:DockMargin(0,0,0,0)j:SetSize(225,64)j:SetVisible(false)self.Rewards=j end)end;function a:Populate(k,l)self.Daily=k:GetType()==srp.quests.TYPE_DAILY;if self.Daily then self.QuestName:SetText(k:GetName()..' Daily')else self.QuestName:SetText(k:GetName())end;for m=1,table.Count(l||{})do if m>4 then continue end;local n=l[m]local o=n.id;local p=n.steamid!=nil&&LocalPlayer()||player.GetBySteamID(n.steamid)if IsValid(p)&&p:CharacterID()then self:AddStat({Name=srp.statcapture.GetType(o).Name,Player=p,Value=n.value})end end;self.StatsPanel:SetWide(#self.Stats*234)self.StatsPanel:CenterHorizontal()self.StatsPanel:CenterVertical(.5)if self.Daily then self:AddRewards(k.rewards)end;self:SlideOut()end;function a:AddRewards(q)for m,r in ipairs(q)do self:AddReward(r)end;self.Rewards:SetVisible(#q>0)self.Rewards:CenterHorizontal()self.Rewards:CenterVertical(.35)self.Rewards:SetTall(#q*42)end;function a:AddReward(r)self.Rewards:AddPanel('srp_quest_stat_reward',function(j)j:SetTall(40)j:Dock(TOP)j:Populate(unpack(r))end)end;function a:AddStat(r)self.StatsPanel:AddPanel('srp_quest_stat',function(j)j:Dock(LEFT)j:Populate(r)table.insert(self.Stats,j)end)end;function a:SlideOut()self:MoveTo(0,ScrH(),.75,7)self:AlphaTo(0,.5,7,function()if IsValid(self)then self:Remove()end end)end;function a:SlideIn()self:AlphaTo(255,.5,0)self:MoveTo(0,0,.75,0)end;function a:OnChildAdded(j)if j.Stat then self:SetWide(j:GetWide()+4)self:Center()end end;vgui.Register('srp_quest_stats',a,'srp_panel')local a={}local s=col.midnight:Copy()s.a=245;function a:Init()self.Stat=true;self:SetSize(230,350)self:DockMargin(2,0,2,0)self:SetBackgroundColor(s)self:AddPanel('srp_label',function(i)i:Dock(TOP)i:SetFont'ui_header.r'i:SetText''i:SetContentAlignment(5)self.StatName=i end)self:AddPanel('srp_label',function(i)i:Dock(TOP)i:SetFont'ui_header.r'i:SetText''i:SetContentAlignment(5)self.StatValue=i end)self:AddPanel('srp_modelpanel',function(t)t:Dock(FILL)t:SetFOV(50)self.model=t end)self:AddPanel('srp_label',function(i)i:Dock(BOTTOM)i:SetFont'ui_header.r'i:SetText''i:SetContentAlignment(5)self.PlayerName=i end)end;function a:Populate(l)local d=self.model:AddModel(l.Player:GetModel(),Vector(),Angle())local u=d:LookupBone('ValveBiped.Bip01_Spine')||0;local v,w=d:GetBonePosition(u)c(d,b[math.random(1,#b)])if u==0 then v=Vector(0,0,30)end;self.model:SetVisible(true)self.model:SetCamPos(v+Vector(80,0,10))self.model:SetLookAt(v)self.PlayerName:SetText(l.Player:Nick())self.StatName:SetText(l.Name)self.StatValue:SetText(l.Value)end;vgui.Register('srp_quest_stat',a,'srp_panel_rounded')local a={}function a:Init()self:DockPadding(8,8,8,8)self:DockMargin(0,1,0,1)self:SetBackgroundColor(col.midnight_light)self:AddPanel('srp_label',function(i)i:Dock(FILL)i:SetText''i:SetFont'ui_header.r'i:SetContentAlignment(5)self.Name=i end)end;function a:Populate(o,x,...)local y=srp.battlepass.GetUnlockType(o)local z=y:GetModel(x,...)local A=y:GetIcon(x,...)local e=y.GetName&&y:GetName(x,...)||y.name;self:SetTooltip(e)self.Name:SetText(e)if z then self:AddPanel('srp_modelpanel',function(t)t:Dock(LEFT)t:SetMouseInputEnabled(false)t:TryCenter(t:AddModel(z))self.Display=t end)elseif A then self:AddPanel('DImage',function(B)B:DockMargin(0,0,0,0)B:Dock(LEFT)B:SetMaterial(A)B:SetMouseInputEnabled(false)self.Display=B end)end end;function a:PerformLayout(C,D)if IsValid(self.Display)then self.Display:SetWide(D-16)end end;vgui.Register('srp_quest_stat_reward',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/ui/quest_step_voting_ui.lua:
local a={}local b=col.midnight_dark:Copy()b.a=240;function a:Init()self.Votes={}self:SetAlpha(0)self:DockPadding(5,5,5,5)self:SetBackgroundColor(col.transparent)self:AddPanel('srp_panel',function(c)c:Dock(FILL)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:SetBackgroundColor(col.transparent)self.VoteContainer=c end)hook('OnQuestStepVotingStarted',self,self.OnVoteStarted)hook('OnQuestStepVotingEnded',self,self.OnVoteEnded)hook('OnQuestStepVote',self,self.OnVote)end;function a:OnRemove()hook.Remove('OnQuestStepVotingStarted',self)hook.Remove('OnQuestStepVotingEnded',self)hook.Remove('OnQuestStepVote',self)self.StepUI:UpdateHeight(-self:GetTall())end;function a:Populate(d,e,f)self.Quest=e;self.Step=f;self.StepUI=d;if f.VoteInfo then self.VoteContainer:Clear()self:OnVoteStarted(e,f)end end;function a:OnVoteStarted(e,f)if e.instanceid!=self.Quest.instanceid||f.stepid!=self.Step.stepid then return end;self.VoteContainer:AddPanel('srp_label',function(g)g:SetText'Press F3 and hover over the % to vote!'g:Dock(TOP)end)for h,i in ipairs(f.VoteInfo)do self.VoteContainer:AddPanel('srp_queststep_vote',function(c)c:SetText(i.Question)c:Populate(self.Quest,self.Step,h)self.Votes[h]=c end)end;local j=#f.VoteInfo*34;self:SetTall(j+10+15)self.StepUI:UpdateHeight(j+10+15)self:SetVisible(true)self:AlphaTo(255,1,0)self:UpdateSyncedVotes(self.Step)end;function a:OnVoteEnded(e,f,k)if e.instanceid!=self.Quest.instanceid then return end;self:SizeTo(-1,0,1,0,-1)self:AlphaTo(0,1,0)end;function a:UpdateSyncedVotes(f)local l=0;local m;local n;for o,c in pairs(self.Votes)do if IsValid(c)then l=l+c.Votes;c:SetWinning(false)if!m||m<c.Votes then m=c.Votes;n=c end end end;for o,c in pairs(self.Votes)do c:SetPercent(math.Clamp(c.Votes/l,0,1))end;if IsValid(n)then n:SetWinning(true)end end;function a:OnVote(e,f,p,q,r)if e.instanceid!=self.Quest.instanceid||f.stepid!=self.Step.stepid then return end;if self.Votes[q]then self.Votes[q].Votes=r end;self:UpdateSyncedVotes(f)end;vgui.Register('srp_queststep_voting',a,'srp_panel_rounded')local a={}local s=col.grey:Copy()local t=col.blue_light:Copy()t.a=150;local u=col.green:Copy()u.a=150;function a:Init()self:Dock(TOP)self:DockPadding(2,2,2,2)self:DockMargin(1,1,1,1)self:SetTall(30)self:SetBackgroundColor(b)self.Percent=0;self.SmoothPercent=0;self.Votes=0;self:AddPanel('srp_label',function(g)g:SetText'Question'g:Dock(FILL)g:SetTextColor(col.white_dark)self.Name=g end)self:AddPanel('srp_button_rounded',function(c)c:Dock(RIGHT)c:SetWide(40)c:DockMargin(0,0,0,0)c:SetContentAlignment(5)c:SetTextColor(col.white_dark)c:LeftClick(function(v)if!self.Quest then return end;v:SetDisabled(true,2)net.Start'srp.quests.Vote'net.WriteUInt(self.Quest.instanceid,16)net.WriteUInt(self.Step.stepid,4)net.WriteUInt(self.VoteId,4)net.SendToServer()end)self.PercentLabel=c end)end;function a:Populate(e,f,h)self.Quest=e;self.Step=f;self.VoteId=h end;function a:SetText(w)self.Name:SetText(w)self.PercentLabel:SetText('0%')end;function a:SetPercent(x)self.Percent=x||0;self.PercentLabel:SetText(math.Round((x||0)*100,1)..'%')end;function a:SetWinning(y)self.VoteWinning=y end;function a:Think()self.SmoothPercent=math.Approach(self.SmoothPercent||0,self.Percent,0.005)end;function a:Paint(z,j)local A=z*self.SmoothPercent;draw.RoundedBox(4,0,0,z,j,b)draw.RoundedBox(4,0,0,A,j,self.VoteWinning&&u||t)end;vgui.Register('srp_queststep_vote',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/ui/shiptimer_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/seasonal/weather_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/optimize/optimize_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/sounds/sounds_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/staffnews/news_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/talents/entity_sh.lua:
function ENTITY:SetupStatTalents(a,b)if!IsValid(a)||!a:IsPlayer()then return end;self.HasTalentStats=true;self.OriginalStats=self.OriginalStats||{}self:SyncStatTalents(a,b)end;function ENTITY:SyncStatTalents(a,b)local c=srp.talents.GetTalentsWithKey(b)if!c then return end;for d,e in pairs(c)do a:ApplyTalent(d,true,self)end end;function ENTITY:GetOriginalStat(d)return self.OriginalStats&&self.OriginalStats[d]||self[d]end;function ENTITY:AddTalentPercent(f,g,h)local i=self:GetOriginalStat(f)if i then self:AddStat(f,i*(1+g),h)end end;function ENTITY:RemoveTalentPercent(f,g,h)local i=self:GetOriginalStat(f)if i then self:AddStat(f,i-i*g,h)end end;function ENTITY:AddTalentStat(f,g,h)local i=self:GetOriginalStat(f)if i then self:AddStat(f,i+g,h)end end;function ENTITY:AddStat(d,j,h)self.OriginalStats=self.OriginalStats||{}if!self.OriginalStats[d]then local k=self['Get'..d]self.OriginalStats[d]=isfunction(k)&&k(self)||self[d]end;local k=self['Set'..d]if isfunction(k)then self[d]=k(self,j)else self[d]=j end;if SERVER&&h then net.Start'srp.talents.AddEntityStat'net.WriteEntity(self)net.WriteString(d)net.WriteType(j)net.Send(self:GetOwner())end end;function ENTITY:RemoveStat(d)local j=self.OriginalStats[d]if!j then return end;local k=self['Set'..d]if isfunction(k)then k(self,j)else self[d]=j end end;function ENTITY:ResetStatTalents()for d,j in pairs(self.OriginalStats)do local k=self['Set'..d]if isfunction(k)then k(self,j)else self[d]=j end end;if SERVER&&IsValid(self:GetOwner())then net.Start'srp.talents.RemoveEntityStats'net.WriteEntity(self)net.Send(self:GetOwner())end end;if CLIENT then net('srp.talents.AddEntityStat',function()local l=net.ReadEntity()if IsValid(l)then l:AddStat(net.ReadString(),net.ReadType())end end)net('srp.talents.RemoveEntityStats',function()local l=net.ReadEntity()if IsValid(l)then l:ResetWeaponStats()end end)net('srp.talents.RemoveEntityStat',function()local l=net.ReadEntity()if IsValid(l)then l:RemoveStat(net.ReadString())end end)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/time/time_sh.lua:
srp.time=srp.time||{}srp.time.scale=60;srp.time.offset=1970-4;srp.time.curtime=0;srp.time.percentofday=0;local a;local b={{PlayerCount=70,Hours=9,Short='NA',Long='North American',TimeFrame={0,9},color=Color(146,38,38,100)},{PlayerCount=50,Hours=5,Short='AU',Long='Australian',TimeFrame={9,14},color=Color(211,184,31,100)},{PlayerCount=70,Hours=10,Short='EU',Long='European',TimeFrame={14,24},color=Color(34,96,195,100)}}function srp.time.GetTimezone()local c=tonumber(os.date('!%H'))local d=b[1]for e,f in ipairs(b)do if c>=f.TimeFrame[1]&&(c==0&&24||c)<f.TimeFrame[2]then d=f;break end end;local g=(c-d.TimeFrame[1])/(d.TimeFrame[2]-d.TimeFrame[1])return d,g end;function srp.time.Hour()return tonumber(os.date('!%H'))end;if info.Main&&!info.Training&&!info.Dev then timer.Create('TimeZoneChange',30,0,function()local d=srp.time.GetTimezone()if!a then a=d;return end;if d.Short!=a.Short then a=d;hook.Run('OnTimezoneChanged',d)end end)end;function srp.time.AdvanceTime()local h=os.date('!*t',srp.time.curtime)srp.time.curtime=srp.time.curtime+srp.time.scale;local i=os.date('!*t',srp.time.curtime)hook.Run('OnMinuteChanged',srp.time.curtime,i.hour,i.min)if h.min==0 then hook.Run('OnHourChanged',srp.time.curtime,i.day,i.hour)end;if h.day!=i.day then hook.Run('OnDayChanged',srp.time.curtime)end end;timer.Create('srp.time.AdvanceTime',1,0,srp.time.AdvanceTime)function srp.time.GetTime()return srp.time.curtime end;function srp.time.GetTable()return os.date('!*t',srp.time.curtime)end;function srp.time.GetStarwarsString(j)local k=srp.time.GetTable().year;return os.date('!%a %d of %B :adjusted: %H:%M',srp.time.curtime):Replace(':adjusted:',tostring(k-srp.time.offset))end;function srp.time.GetTimeStamp()return os.date('%m/%d %H:%M',srp.time.curtime)end;function srp.time.GetString()return os.date('!%a %d %B %Y %H:%M:%S',srp.time.curtime)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/time/timer_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/ui/tradinghistory_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/ui/tradinghistory_ui.lua:
local a={}function a:Init()self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self:SetBackgroundColor(col.midnight)self:AddPanel('srp_panel_rounded',function(b)b:Dock(TOP)b:SetTall(35)b:DockMargin(2,2,2,2)b:SetBackgroundColor(col.midnight_light)b:AddPanel('srp_button_rounded',function(c)c:Dock(RIGHT)c:SetBackgroundColor(col.blue)c:SetHoverColor(col.blue_light)c:SetText'Refresh'c:DockMargin(1,1,1,1)c:LeftClick(function(d)d:SetDisabled(true,5)self:Refresh()end)end)end)self:AddPanel('ui_scrollpanel',function(e)e:Dock(FILL)srp.ui.Create('srp_grid',function(b)b:SetAutoHeight(true)b:Dock(TOP)e:AddItem(b)self.itemGrid=b end)self.itemList=e end)hook('OnTradingHistoryLoaded',self,self.Populate)self:Refresh()end;function a:Refresh()srp.trading.GetHistory()end;function a:Populate(f)self.itemGrid:Clear()for g,h in ipairs(f)do local i=srp.items.Get(h.itemid)if!i then continue end;srp.ui.Create('srp_tradinghistoryline',function(b)b:SetTall(40)b:Populate(i,h)self.itemGrid:AddItem(b,true)end)end end;function a:OnRemove()hook.Remove('OnTradingHistoryLoaded',self)end;vgui.Register('srp_tradinghistory',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/ui/tradinglines_ui.lua:
local a={}function a:Init()self:DockPadding(4,4,4,4)self:DockMargin(0,4,0,4)self:SetBackgroundColor(col.midnight_dark)self:AddPanel('DImage',function(b)b:DockPadding(0,0,0,0)b:DockMargin(0,0,0,0)b:Dock(LEFT)b:SetWide(32)b:SetMouseInputEnabled(false)self.icon=b end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(5,0,0,0)c:Dock(FILL)c:SetTextColor(col.white)c:SetFont'ui_label.l'c:SetMouseInputEnabled(false)self.name=c end)self:AddPanel('srp_button_rounded',function(d)d:SetFont'SSRPForkAwesome'd:SetText(0xf0d6,true)d:SetWide(30)d:Dock(RIGHT)d:DockMargin(5,5,5,5)d:DockPadding(0,0,0,0)d:SetBackgroundColor(col.green)d:SetHoverColor(col.green)d:SetBorderColor(col.green)d:LeftClick(function(d)if self.item&&self.rowinfo then hook.Run('OnTradingPurchaseSelected',self.item,self.rowinfo)end end)end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:Dock(RIGHT)c:SetWide(150)c:SetTextColor(col.white)c:SetFont'ui_label.l'c:SetMouseInputEnabled(false)c:SetContentAlignment(6)self.price=c end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:Dock(RIGHT)c:SetWide(150)c:SetTextColor(col.white)c:SetFont'ui_label.l'c:SetMouseInputEnabled(false)c:SetContentAlignment(6)self.count=c end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:Dock(RIGHT)c:SetWide(150)c:SetTextColor(col.white)c:SetFont'ui_label.l'c:SetMouseInputEnabled(false)c:SetContentAlignment(6)self.remaining=c end)hook('OnTradingPurchased',self,self.UpdateInfo)end;function a:Populate(e,f)self.item=e;self.rowinfo=f;self.icon:SetMaterial(e.icon)self.icon:SetImageColor(e.color||col.white)self.name:SetText(e.name)self.count:SetText(string.Comma(f.count))self.remaining:SetText(string.Comma(f.remaining))local g=LocalPlayer():GetCurrency()self.price:SetText(string.Comma(f.price)..' '..g)end;function a:UpdateInfo(h,i,j,k,l)if self.rowinfo.id!=h then return end;if k==0 then self:Remove()else self.remaining:SetText(string.Comma(k))end end;vgui.Register('srp_tradingline',a,'srp_panel_rounded')local a={}function a:Init()self:DockPadding(8,4,8,4)self:DockMargin(0,4,0,4)self:SetBackgroundColor(col.midnight_dark)self:AddPanel('DImage',function(b)b:DockPadding(0,0,0,0)b:DockMargin(0,0,0,0)b:Dock(LEFT)b:SetWide(32)self.icon=b end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(5,0,0,0)c:Dock(FILL)c:SetTextColor(col.white)c:SetFont'ui_label.l'self.name=c end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:Dock(RIGHT)c:SetWide(250)c:SetTextColor(col.white)c:SetFont'ui_label.l'c:SetContentAlignment(6)self.added=c end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:Dock(RIGHT)c:SetWide(150)c:SetTextColor(col.white)c:SetFont'ui_label.l'c:SetContentAlignment(6)self.price=c end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:Dock(RIGHT)c:SetWide(150)c:SetTextColor(col.white)c:SetFont'ui_label.l'c:SetContentAlignment(6)self.count=c end)end;function a:Populate(e,f)self.item=e;self.rowinfo=f;self.rowinfo.id=tonumber(f.id)self.icon:SetMaterial(e.icon)self.icon:SetImageColor(e.color||col.white)self.name:SetText(e.name)self.count:SetText(string.Comma(f.count))local g=LocalPlayer():GetCurrency()self.price:SetText(string.Comma(f.price)..' '..g)local m=tonumber(f.added||0)local n=os.time()-m;self.added:SetText(string.NiceTime(n)..' ago')self.added:SetTooltip(os.date('!%c',m))end;vgui.Register('srp_tradinghistoryline',a,'srp_panel_rounded')local a={}function a:Init()self:DockPadding(4,4,4,4)self:DockMargin(0,4,0,4)self:SetBackgroundColor(col.midnight_dark)self:AddPanel('DImage',function(b)b:DockPadding(0,0,0,0)b:DockMargin(0,0,0,0)b:Dock(LEFT)b:SetWide(32)b:SetMouseInputEnabled(false)self.icon=b end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(5,0,0,0)c:Dock(FILL)c:SetTextColor(col.white)c:SetFont'ui_label.l'c:SetMouseInputEnabled(false)self.name=c end)self:AddPanel('srp_button_rounded',function(d)d:SetFont'SSRPForkAwesome'd:SetText(0xf00d,true)d:SetWide(30)d:Dock(RIGHT)d:DockMargin(5,5,5,5)d:DockPadding(0,0,0,0)d:SetBackgroundColor(col.red)d:SetHoverColor(col.red_dark)d:SetBorderColor(col.transparent)d:LeftClick(function(d)if self.item&&self.rowinfo then srp.trading.RemoveItem(self.rowinfo.id)end end)end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:Dock(RIGHT)c:SetWide(150)c:SetTextColor(col.white)c:SetFont'ui_label.l'c:SetMouseInputEnabled(false)c:SetContentAlignment(6)self.price=c end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:Dock(RIGHT)c:SetWide(150)c:SetTextColor(col.white)c:SetFont'ui_label.l'c:SetMouseInputEnabled(false)c:SetContentAlignment(6)self.count=c end)self:AddPanel('srp_label',function(c)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:Dock(RIGHT)c:SetWide(150)c:SetTextColor(col.white)c:SetFont'ui_label.l'c:SetMouseInputEnabled(false)c:SetContentAlignment(6)self.remaining=c end)hook('OnTradingRemoved',self,self.RemoveItem)end;function a:Populate(e,f)self.item=e;self.rowinfo=f;self.rowinfo.id=tonumber(f.id)self.icon:SetMaterial(e.icon)self.icon:SetImageColor(e.color||col.white)self.name:SetText(e.name)self.count:SetText(string.Comma(f.count))self.remaining:SetText(string.Comma(f.remaining))local g=LocalPlayer():GetCurrency()self.price:SetText(string.Comma(f.price)..' '..g)end;function a:RemoveItem(h)if self.rowinfo.id==h then self:Remove()end end;function a:OnRemove()hook.Remove('OnTradingRemoved',self)end;vgui.Register('srp_tradingsellline',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingbattalion_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingcitations_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingmodules_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingwelcome_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/tutorial/tips_cl.lua:
srp.tutorial=srp.tutorial||{}srp.tutorial.tips={'Items purchased from your loadouts are bound to that character forever.','Do not use Jetpacks when the ship is at Defcon 6.','Jumping into the moonpool sounds like a good idea. But it will get you jailed.','If you think what you\'re doing isn\'t allowed, it probably isn\'t.','If a vehicle isn\'t yours then do not take it.','To enter a LAAT as a passanger press your WALK (default: L-ALT) and USE (default: E) keys','Your inventory (default: F2) is used for storing and using items such as Ammo.','Some areas of the ship are restricted. Be on the lookout for the warning signs.','Need help? You can contact staff by typing @ followed by your message in chat.','When the shield generator breaks it will send explosions around the ship. Try to get to wide open areas to avoid death!','The CT rank is only temporary, join a battalion to do something more engaging!','Join us @ ts3.superiorservers.co','Join us @ superiorservers.co','If you\'re not sure about something then feel free to ask!','The most useful menus can be found by pressing F4','You can use emotes by holding the context key (default: C).','Jedi requires VIP to play. This is the only content locked feature.','See a bug? Report it! It\'s not magically going to get fixed otherwise.','Want to suggest something, visit our forums and make a suggestion thread.','Not following the rules will result in a lengthy arrest. Be careful!','You can put a gun on safety by pressing SHIFT, E and R.','Falling is often fatal. Be careful when walking near edges.','Talent XP is earned through various gameplay mechanics like building, jetpacking, killing and training.','Battalions are (nearly) autonomous and are ran by the players themselves.','Training is handled by other community members. Want to become a trainer? Ask a staff member for help.','There is a hidden session based XP and RC booster that will increase to 100% over a playtime of 10 hours.','Need to join another server? press the context menu (default: C) to connect to one.','The armoury has several crafting benches that you can use to craft refined metals.','You can sit on props and corners by look down at their edges and press ALT+E.','You can prone by double tapping the prone key (default: LCTRL).','Sometimes the ship breaks down. Notify someone if you see it happen.','Some battalions have unique weapons or items to them.','You may have multiple characters in different battalions.','The battalion limit is 500 players. Many battalions prune inactive players.'}
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/voice/voice_cl.lua:
local a=0;local b=player.GetAll;local IsValid=IsValid;local c=PLAYER.GetShootPos;local d=FindMetaTable('Vector').DistToSqr;local e={Sound('galactic/radio/voip_end_transmit_beep_01.wav'),Sound('galactic/radio/voip_end_transmit_beep_02.wav'),Sound('galactic/radio/voip_end_transmit_beep_03.wav'),Sound('galactic/radio/voip_end_transmit_beep_04.wav')}local function f(g)if a<CurTime()then surface.PlaySound(e[math.random(#e)])a=CurTime()+2 end end;function GM:PlayerStartVoice(g)if g==LocalPlayer()then net.Ping'srp.StartVoice'if cvar.GetValue('srp_radioeffects')then f(g)end end end;function GM:PlayerEndVoice(g)if g==LocalPlayer()then net.Ping'srp.EndVoice'if cvar.GetValue('srp_radioeffects')then f(g)end end end;hook('PlayerGetVoiceData','srp.voice.info',function(g)return{Name=g:Nick(),Info=g:GetTag()}end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/attachments_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/webhooks/webhooks_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/webhooks/webhooks_sh.lua:
webhook=webhook||{}webhook.type={all=0}webhook.BaseUrl='https://discord.com/api/webhooks/'webhook.Pattern="^https://discord%.com/api/webhooks/(%d+/[A-z0-9_%-]+)$"local a={}function webhook.AddTypes(b)local c=table.Count(webhook.type)-1;for d,e in ipairs(b)do local f=bit.lshift(1,c)webhook.type[e.ID]=f;a[e.ID]=e;c=c+1 end end;function webhook.GetTypeInfo(g)return g&&a[g]||a end;function webhook.HasType(h,g)local i=isnumber(g)&&g||webhook.type[g]return i&&bit.band(h,i)==i end;function webhook.GetEndpoint(j)return j:match(webhook.Pattern)end;function webhook.AddToMask(h,...)return bit.bor(h,...)end;webhook.AddTypes({{Group='Events',ID='defcon'},{Group='Events',ID='eventlog'},{Group='Events',ID='hyperspace'},{Group='Server',ID='timezone'},{Group='Server',ID='mapchange'},{Group='Server',ID='jail'},{Group='Gamemaster',ID='gmrank'},{Group='Battalion',ID='grouplog',Description='All group logs'},{Group='Server',ID='status'},{Group='Server',ID='storevent'},{Group='Battalion',ID='invite',Description='Sends information on invites.'},{Group='Events',ID='eventlog_internal',Hide=true}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/jedi/ui/powers_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/jetpack/jetpack_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/jetpack/jetpack_cl.lua:
local a=Color(255,255,255,150)local function b()local c,d=ScrW(),ScrH()draw.RoundedBox(16,c/2-4,d/2-4,8,8,a)end;hook('OnJetpackChanged','srp.jetpack.ShowJetpackHUD',function(e,f)hook.Run('OnJetpackStatusChanged',e,f)if!IsValid(f)then hook.Remove('HUDPaint','srp.jetpack.Reticle')return end;if info.Dev||LocalPlayer():IsTalentPassiveSelected('jetpackmissile')then hook.Add('HUDPaint','srp.jetpack.Reticle',b)end end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/starmap/ui/starmap_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/hud/hud_ui.lua:
local a={}local b=Material('galactic/ui/hud/health.png','nomips noclamp smooth')local c=Material('galactic/ui/hud/armor.png','nomips noclamp smooth')local d=Material('galactic/ui/hud/bubbles.png','nomips noclamp smooth')local e=Material('galactic/ui/currency.png')local f=Color(255,255,255,100)local g={{temp=-15,color=col.pink},{temp=-5,color=col.purple},{temp=0,color=col.blue_dark},{temp=20,color=col.blue_light},{temp=25,color=col.orange},{temp=30,color=col.red},{temp=35,color=col.red_dark},{temp=40,color=col.purple}}local function h(i,j,k)for l=#g,1,-1 do local m=g[l]if srp.WeatherTemp>=m.temp then return m.color end end;return g[1].color end;function a:DisplayWeather()if!(srp.seasonal.Summer||srp.seasonal.Christmas)then return end;self:AddStatRight('WEATHER',80,nil,nil,h,function()return math.Round(srp.WeatherTemp||0)..' C',1 end)end;function a:Populate()local n=LocalPlayer()self:AddStatLeft('HEALTH',100,b,col.white,Color(255,60,60,80),function()local o=n:lvsGetVehicle()if IsValid(o)then return math.floor(o:GetHP()),o:GetMaxHP()||100 end;return n:Health(),n:GetMaxHealth()end)self:AddStatLeft('ARMOR',100,c,nil,Color(247,255,25,80),function()return n:Armor(),100 end)self:AddStatButtonLeft('OXYGEN',115,d,nil,function(p,q,r)return q<11&&col.red||col.blue_light end,function()return n:GetOxygen(),100 end,function()srp.ui.Create('srp_simpleinfo'):SetHeader('',true):AddInfoSegment('Oxygen','During special events or when the ships life support is down\nyour oxygen will depleat. When you have 0 oxygen you will\ndie.',130):AddInfoSegment('Stockpile','You can purchase oxygen from the armoury.\nRemember to use them from you inventory.',130):Center()end)self:AddStatLeft('WEALTH',140,e,nil,nil,function()return string.Comma(n:GetMoney()||0)..' '..(n:GetCurrency()||'')end)self:OnJailStatusChanged(n,n:GetJailStatus())self:DisplayAdvert()self:DisplayTime()self:OnXPBoost()self:DisplayWeather()self:OnJetpackStatusChanged(n,n:GetJetpack())self:OnNightVisionStatusChanged(n,n:HasNVG())self:OnCloakStatusChanged(n,n:HasCloak())self:DisplayBatteryStatus()srp.ui.Create('srp_captureinfo',function(i)self.PatrolPointHUD=i end)end;function a:OnRemoved()if IsValid(self.PatrolPointHUD)then self.PatrolPointHUD:Remove()end end;vgui.Register('srp_hud',a,'srp_hudbase')
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/events/ffa_sh.lua:
local a={'weapon_crowbar','knife_bayonet_night','weapon_combo_fists','sup_dc15s','sup_dc17_dual','sup_z6','sup_dc17m_shotgun','sup_repsniper','sup_grenade_impact','weapon_lightsaber_trainer','weapon_lightsaber_master','weapon_lightsaber_consular','weapon_lightsaber_dual_guardian'}srp.events.Register('MTK','Mortal Kombat',20):SetArenaEvent(true):SetMaxPlaytime(720):SetRequiresVote(true,4,25):SetDescription([[
		Free For All. Use your weapon and fight for greatness!
	]]):SetTagLines({default='Fight to the death!'}):OnStart(function(self)if CLIENT then return end;local b=self:GetPlayers()self:DisplayDeathCounter(#b)local c=a[math.random(1,#a)]srp.events.SpawnInRoom(b,0,function(d)d:SetMaxHealth(500)d:SetHealth(250)d:SetArmor(0)d:SetRunSpeed(190)d:StripWeapons()d:Freeze(true)timer.Simple(1,function()if IsValid(d)then d:Give(c)d:SelectWeapon(c)d:GiveAmmo(2000,'ammo_blaster')d:Freeze(false)end end)end)end):OnPlayerRemoved(function(self,d)local b=self:GetPlayers()if IsValid(d)then self:DisplayDeathCounter(#b,d:Nick())d:SetCharacterStatisticAverage('minigame_losses',1)d:SetCharacterStatisticAverage('minigame_wins',0)else self:DisplayDeathCounter(#b)end;if#b<=1 then self:End(srp.events.END,b[1])end end):OnWriteEndData(function(self,d)net.WritePlayer(d)end):OnReadEndData(function(self,d)return net.ReadPlayer(d)end):OnEnd(function(self,e,d)local f=e==srp.events.TIMEOUT_END;if CLIENT then return end;if!IsValid(d)||!IsEntity(d)then return end;d:StripWeapons()d:SetCharacterStatisticAverage('minigame_wins',1)srp.notif.SuccessAll(5,d:Nick()..' has won the FFA.')timer.Simple(5,function()if IsValid(d)then d:Spawn()end end)end):AddHook('PlayerDeath',function(self,d)self:RemovePlayer(d)end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/gamemaster/realtimestrategy/core_sh.lua:
srp.rts.Register'ctx_teleport':SetName'Teleport To':SetIcon('icon16/world_go.png'):SetContextual():SetServersideAction():OnSelected(function(self,a,b,c)local d=a:GetRTSDrone()if#b==1&&IsValid(b[1])then d:SetPos(b[1]:GetPos()-d:GetForward()*250+d:GetUp()*75)else local e=Vector()local f=0;for g,h in ipairs(b)do if IsValid(h)then e=e+h:GetPos()f=f+1 end end;if f>1 then d:SetPos(e/f-d:GetForward()*250+d:GetUp()*75)end end end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/gamemaster/realtimestrategy/props_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/groups_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/modules_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/permaprops_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/rishimoon_sh.lua:
srp.spawn.AddSpawnPoints('rp_rishimoon_crimson_s',{jails={REPUBLIC={{pos=Vector(-8541,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8411,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8281,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8151,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8021,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-7891,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-7761,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-7631,-11401,100),ang=Angle(0,90,0)}},CIS={{pos=Vector(-8541,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8411,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8281,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8151,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8021,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-7891,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-7761,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-7631,-11401,100),ang=Angle(0,90,0)}},SITH={{pos=Vector(-8541,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8411,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8281,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8151,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-8021,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-7891,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-7761,-11401,100),ang=Angle(0,90,0)},{pos=Vector(-7631,-11401,100),ang=Angle(0,90,0)}}},groups={["NAVY"]={pos=Vector(-9074,-9247,680),ang=Angle(0,-180,0),dir=Vector(-1,1,0)},["CG"]={pos=Vector(-8556,-10847,130),ang=Angle(0,-180,0),dir=Vector(-1,-1,0)},["RC"]={pos=Vector(-9226,-4227,5),ang=Angle(0,-180,0),dir=Vector(-1,1,0)},["41st"]={pos=Vector(-10363,-4807,5),dir=Vector(1,-1,0),ang=Angle(0,-180,0)},["41SB"]={pos=Vector(-10363,-4807,5),dir=Vector(1,-1,0),ang=Angle(0,-180,0)},["104th"]={pos=Vector(-11223,-4807,5),dir=Vector(1,-1,0),ang=Angle(0,-180,0)},["327th"]={pos=Vector(-10070,-4227,5),ang=Angle(0,-180,0),dir=Vector(-1,1,0)},["327KC"]={pos=Vector(-10070,-4227,5),ang=Angle(0,-180,0),dir=Vector(-1,1,0)},["GM"]={pos=Vector(-12928,-4807,5),dir=Vector(1,-1,0),ang=Angle(0,-180,0)},["501st"]={pos=Vector(-8370,-4227,5),ang=Angle(0,-180,0),dir=Vector(-1,1,0)},["332nd"]={pos=Vector(-8370,-4227,5),ang=Angle(0,-180,0),dir=Vector(-1,1,0)},["ARC"]={pos=Vector(-9520,-4807,5),dir=Vector(1,-1,0),ang=Angle(0,-180,0)},["187th"]={pos=Vector(-11771,-4227,5),ang=Angle(0,-180,0),dir=Vector(-1,1,0)},["212th"]={pos=Vector(-10921,-4227,5),ang=Angle(0,-180,0),dir=Vector(-1,1,0)},["212AB"]={pos=Vector(-10921,-4227,5),ang=Angle(0,-180,0),dir=Vector(-1,1,0)},["RP"]={pos=Vector(-6057,-7513,5),dir=Vector(-1,1,0),ang=Angle(0,-180,0)},["RM"]={pos=Vector(-6509,-4456,9),ang=Angle(0,-45,0),dir=Vector(1,-1,0)},["GM"]={pos=Vector(-12612,-4227,5),ang=Angle(0,-180,0),dir=Vector(-1,1,0)},["JEDI"]={pos=Vector(-10844,11561,2264),ang=Angle(0,-60,0),dir=Vector(1,-1,0)}},allegiances={['CIS']={pos=Vector(14121,28,2315),ang=Angle(9,-111,0)}},default={pos=Vector(-8806,-12163,10),ang=Angle(0,-45,0),dir=Vector(1,-1,0)}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/npc/npcs_sh.lua:
srp.npc.Register({ID='MUNITIONS',Name='Munitions',Class='rp_npc_ent',Icon=Material'galactic/ui/store_anim.vtf',Dialogue='MUNITIONS',Color=col.blue:Copy(),TurnToPlayer=false,Quotes={},Models={'models/galactic/supnpc/shopdroid/shopdroid.mdl'},Transforms={rp_liberator_sup_training_b2={{Vector(-2746,-785,-610),Angle(0,0,0)},{Vector(-2746,785,-610),Angle(0,0,0)}},rp_coruscantbelow={{Vector(7470,-3360,20),Angle(0,-140,0)},{Vector(4681,-7078,16),Angle(0,-140,0)},{Vector(7972,5009,225),Angle(0,-140,0)}},rp_kamino_extensive={{Vector(4458,164,-11903),Angle(0,180,0)},{Vector(6076,-6976,-11900),Angle(0,100,0)},{Vector(-4112,2769,-11933),Angle(0,0,0)},{Vector(-2221,-6002,8048),Angle(0,0,0)}},rp_liberator_sup_b8at={{Vector(5689,375,-200),Angle(0,0,0)},{Vector(-180,480,-767),Angle(0,160,0)},{Vector(5395,525,-700),Angle(0,-130,0)}},rp_rishimoon_crimson_s={{Vector(-8079,-12084,10),Angle(0,-45,0)},{Vector(-7609,-4675,10),Angle(0,90,0)},{Vector(-5092,-9219,-1377),Angle(0,150,0)}},rp_monsglacia_crimson={{Vector(-9054,-11364,0),Angle(0,0,0)},{Vector(-9771,-13242,768),Angle(0,0,0)},{Vector(-10270,-12270,-1055),Angle(0,0,0)},{Vector(-10463,-11304,-2047),Angle(0,0,0)}},rp_anaxes={{Vector(-8016,5959,136),Angle(0,117,0)},{Vector(-8538,-2648,68),Angle(0,26,0)},{Vector(-6726,4833,892),Angle(0,133,0)},{Vector(-8650,11569,544),Angle(0,1,0)},{Vector(-6049,10085,544),Angle(0,133,0)},{Vector(-4555,14145,-256),Angle(0,-152,0)},{Vector(-7874,12340,100),Angle(0,-101,0)},{Vector(-10036,11164,672),Angle(0,1,0)}},rp_dantooine_united_v1={{Vector(-5878.090000,-13534.910000,-7620.970000),Angle(0,-90,0)},{Vector(-1544.430000,915.590000,8108.030000),Angle(0,-90,0)},{Vector(1240.890000,172.350000,-15612.970000),Angle()}}}})srp.npc.Register({ID='AGENCY',Name='Estate Agent',Class='rp_npc',Icon=Material'galactic/ui/store.vtf',Dialogue='AGENCY',Color=col.pink:Copy(),TurnToPlayer=false,Quotes={},Models={'models/player/valley/lgn/quarren/quarren.mdl'},IdleAnimation={'idle_all_02'},DropToFloor=false,Transforms={rp_coruscantbelow={{Vector(9415,3740,208),Angle(0,90,0)}}}})srp.npc.Register({ID='STORE_CONSTRUCTION',Name='EyeKeya',Class='rp_npc',Icon=Material'galactic/ui/store.vtf',Dialogue='STORE_CONSTRUCTION',Color=col.pink:Copy(),TurnToPlayer=false,Quotes={},Models={'models/player/lgn/h_npc_shop_keeper.mdl'},IdleAnimation={'Lean_Back'},DropToFloor=false,Transforms={rp_coruscantbelow={{Vector(9333,3710,208),Angle(0,90,0)}}}})srp.npc.Register({ID='DRINKS',Name='Bartender',Class='rp_npc',Icon=Material'galactic/ui/store.vtf',Dialogue='DRINKS',Color=col.blue:Copy(),TurnToPlayer=false,Quotes={},Models={'models/galactic/c3po/c3po.mdl'},IdleAnimation={'idle_all_02'},DropToFloor=false,Transforms={rp_coruscantbelow={{Vector(9223,718,-32),Angle(0,90,0)},{Vector(9223,328,-32),Angle(0,-88,0)},{Vector(9416,515,-32),Angle(0,0,0)},{Vector(9015,510,-32),Angle(0,180,0)}}}})srp.npc.Register({ID='STORE_TRADER',Name='Trader',Class='rp_npc',Icon=Material'galactic/ui/store.vtf',Dialogue='STORE_TRADER',Color=col.red:Copy(),TurnToPlayer=false,Quotes={},Models={'models/hgn/swrp/swrp/droid_hk-47.mdl'},IdleAnimation={'idle_all_02'},DropToFloor=false,Transforms={rp_liberator_sup_b8at={{Vector(-5380,-615,33),Angle(0,100,0)}}}})srp.npc.Register({ID='HANGAR_MHB',Name='Hangar Manager',Class='rp_npc_ent',Icon=Material'galactic/ui/ship.png',Dialogue='MHB_PILOT',Color=col.orange:Copy(),TurnToPlayer=false,Quotes={},Models={'models/galactic/supnpc/shopdroid/shopdroid.mdl'},Transforms={rp_dantooine_united_v1={{Vector(-3636,799,8108),Angle(0,-90,0)},{Vector(-3636,-799,8108),Angle(0,-90,0)}},rp_liberator_sup_b8at={{Vector(-373,475,66),Angle(0,-90,0)},{Vector(-5062,475,66),Angle(0,-50,0)}},rp_rishimoon_crimson_s={{Vector(-2967,-5760,8),Angle(0,-180,0)},{Vector(-2967,-8825,8),Angle(0,-180,0)}},rp_monsglacia_crimson={{Vector(-10559,-10040,0),Angle(0,-60,0)},{Vector(-9156,-8295,0),Angle(0,-100,0)}},rp_anaxes={{Vector(-8493,-688,68),Angle(0,50,0)}}}})srp.npc.Register({ID='HANGAR_MHB_LV',Name='Land Vehicle Operator',Class='rp_npc',Icon=Material'galactic/ui/ship.png',Dialogue='MHB_PILOT_LV',Color=col.green:Copy(),TurnToPlayer=false,IdleAnimation={'Idle_Relaxed_AR2_1'},Weapon='sup_z6',Quotes={},Models={'models/galactic/c3po/c3po.mdl'},Transforms={rp_dantooine_united_v1={{Vector(-6875,-13590,-7620),Angle(0,90,0)}},rp_coruscantbelow={{Vector(2460,-6008,80),Angle(0,45,0)}},rp_monsglacia_crimson={{Vector(-8756,-10201,0),Angle(0,-130,0)}},rp_rishimoon_crimson_s={{Vector(-5668,-7429,64),Angle(0,0,0)}},rp_anaxes={{Vector(-8785,803,100),Angle(0,-90,0)}}}})srp.npc.Register({ID='HANGAR_SIDES',Name='Hangar Manager',Class='rp_npc_ent',Icon=Material'galactic/ui/ship.png',Dialogue='HANGAR_PILOT',Color=col.orange:Copy(),TurnToPlayer=false,Quotes={},Models={'models/galactic/supnpc/shopdroid/shopdroid.mdl'},Transforms={rp_liberator_sup_b8at={{Vector(3900,2210,-101),Angle(0,-44,0)},{Vector(3900,-2210,-101),Angle(0,44,0)}}}})srp.npc.Register({ID='TRIUMPH',Name='Achievement Man',Class='rp_npc_ent',Icon=Material'galactic/ui/ship.png',Dialogue='TRIUMPHS',Color=Color(128,0,32),TurnToPlayer=false,Quotes={},Models={'models/galactic/supnpc/shopdroid/shopdroid.mdl'},Transforms={rp_liberator_sup_b8at={{Vector(6329,451,-235),Angle(0,-130,0)}},rp_dantooine_united_v1={{Vector(1685.250000,892.050000,-15628.970000),Angle(0,-140,0)}}}})srp.npc.Register({ID='HRBOT',Name='Human Resources',Class='rp_npc_ent',Icon=Material('galactic/skills/melee.png'),Dialogue='HRBOT',Color=Color(128,0,32),GUIOffset=Vector(0,0,50),TurnToPlayer=false,DropToFloor=false,Quotes={},Models={'models/galactic/citizendroid1/citizendroid1.mdl','models/galactic/citizendroid2/citizendroid2.mdl','models/galactic/r2d2/r2d2.mdl'},Transforms={rp_liberator_sup_b8at={{Vector(5689,-375,-240),Angle(0,0,0)}},rp_monsglacia_crimson={{Vector(-9716,-11565,-511),Angle(0,130,0)}},rp_dantooine_united_v1={{Vector(1678.090000,357.790000,-15628.970000),Angle(0,135,0)}}}})srp.npc.Register({ID='BAILBOT',Name='Guard Secretary',Class='rp_npc',Icon=Material('galactic/skills/melee.png'),Dialogue='BAILBOT',Color=Color(170,20,20),TurnToPlayer=false,DropToFloor=false,IdleAnimation={'Idle1'},Weapon='sup_dc15s',Quotes={},Models={'models/player/valley/policedroid/h_npc_policedroid.mdl'},Transforms={rp_liberator_sup_b8at={{Vector(5712,224,16),Angle(0,-90,0)}},rp_dantooine_united_v1={{Vector(2801,556,-15033),Angle(0,145,0)}}}})srp.npc.Register({ID='GIFTCARDS',Name='Mail',Class='rp_npc',Icon=Material('materials/galactic/ui/mail.png'),Dialogue='GIFTCARDS',Color=Color(255,255,255),TurnToPlayer=false,DropToFloor=false,IdleAnimation={'sit_passive'},Quotes={},Models={'models/player/trooper/cctrooper.mdl'},Weapon='sup_dc15s',Transforms={rp_liberator_sup_b8at={{Vector(5966,-213,-225),Angle(0,0,0)}},rp_dantooine_united_v1={{Vector(1701.830000,399.040000,-15628.970000),Angle(0,145,0)}}}})if srp.seasonal.Summer then srp.npc.Register({ID='SUMMERFOOD',Name='Summer Store',Class='rp_npc',IdleAnimation={'idle_all_01'},Icon=Material('galactic/seasonal/summer/summer4.png'),Dialogue='STORE_SUMMERFOOD',Color=col.white:Copy(),TurnToPlayer=false,DropToFloor=false,Quotes={},Models={'models/player/trooper/cctrooper.mdl'},Transforms={rp_liberator_sup_b8at={{Vector(5858,-260,-240),Angle(0,190,0)}}},OnSpawned=function(self,a)a:AttachItem('models/galactic/cosmetics/phase1cosmetics/ribbonsuit.mdl',Vector(),Angle(),true)end})end;srp.npc.Register({ID='CIVILIAN_PACKAGE',Name='Civilian',Class='rp_npc',Icon=Material('galactic/skills/melee.png'),Dialogue='CIVILIAN',Color=Color(128,0,32),TurnToPlayer=true,DropToFloor=false,Quotes={},Models={'models/Humans/Group01/male_06.mdl','models/Humans/Group01/Female_01.mdl','models/Humans/Group01/Female_06.mdl','models/Humans/Group01/Male_01.mdl','models/Humans/Group01/male_02.mdl','models/Humans/Group01/Male_05.mdl','models/Humans/Group01/male_07.mdl','models/Humans/Group01/male_08.mdl','models/Humans/Group02/Female_02.mdl','models/Humans/Group02/Female_04.mdl','models/Humans/Group02/male_02.mdl','models/Humans/Group02/Male_04.mdl','models/Humans/Group02/male_07.mdl','models/Humans/Group03/Male_01.mdl','models/Humans/Group03/male_03.mdl','models/Humans/Group03/Male_05.mdl','models/Humans/Group03/male_07.mdl','models/Humans/Group03m/Female_04.mdl','models/Humans/Group03m/male_06.mdl'},IdleAnimation={'idle_subtle'},Transforms={rp_coruscantbelow={{Vector(3072,-4209,64),Angle(0,140,0)},{Vector(3051,-4154,64),Angle(0,-125,0)},{Vector(402,-2289,64),Angle(0,-50,0)},{Vector(8114,-2472,0),Angle(0,-65,0)}}},OnSpawned=function(self,a)local b=a:LookupBone('ValveBiped.Bip01_R_Wrist')if!b then return end;local c=a:WorldToLocal(a:GetBonePosition(b))a:AttachItem('models/weapons/w_package.mdl',c,Angle(-20,0,0),false)end})srp.npc.Register({ID='BUYBACK',Name='Shady Clone',Class='rp_npc',Icon=Material('galactic/ui/currency.png','smooth noclamp'),Dialogue='BUYBACK',Color=Color(75,200,33),TurnToPlayer=false,DropToFloor=false,Quotes={},Models={'models/player/trooper/cctrooper.mdl'},IdleAnimation={'s_idle'},Transforms={}})srp.npc.Register({ID='CIVILIAN',Name='Civilian',Class='rp_npc',Icon=Material('galactic/skills/melee.png'),Dialogue='CIVILIAN',Color=Color(128,0,32),TurnToPlayer=true,DropToFloor=false,Quotes={},Models={'models/Humans/Group01/male_06.mdl','models/Humans/Group01/Female_01.mdl','models/Humans/Group01/Female_06.mdl','models/Humans/Group01/Male_01.mdl','models/Humans/Group01/male_02.mdl','models/Humans/Group01/Male_05.mdl','models/Humans/Group01/male_07.mdl','models/Humans/Group01/male_08.mdl','models/Humans/Group01/Male_Cheaple.mdl','models/Humans/Group02/Female_02.mdl','models/Humans/Group02/Female_04.mdl','models/Humans/Group02/male_02.mdl','models/Humans/Group02/Male_04.mdl','models/Humans/Group02/male_07.mdl','models/Humans/Group03/Male_01.mdl','models/Humans/Group03/male_03.mdl','models/Humans/Group03/Male_05.mdl','models/Humans/Group03/male_07.mdl','models/Humans/Group03m/Female_04.mdl','models/Humans/Group03m/male_06.mdl','models/gman_high.mdl'},IdleAnimation={'idle_subtle'},Transforms={rp_coruscantbelow={{Vector(2362,1970,-63),Angle(0,108,0)},{Vector(2310,2015,-63),Angle(0,-34,0)},{Vector(2400,2024,-63),Angle(0,-174,0)}}}})local d={}local function e(f,g,h,i,j,k,l)local m=k&&k.LateModel==true&&h||k&&k.LateModel;local n=k&&k.NoDrop;local o={Name=g,Class=k&&k.Class||'npc_combine_s',Category='GM Hostile',Friendly=false,Model=h,LateModel=m,NoDrop=n,Offset=k&&k.Offset,Bleeding=i,KeyValues=k,Server=j,Weapons=l}d[f]=o;list.Set('NPC',f,o)end;local function p(f,g,h,i,j,k)local m=k&&k.LateModel==true&&h||k&&k.LateModel;local n=k&&k.NoDrop;list.Set('NPC',f,{Name=g,Class=k&&k.Class||'npc_citizen',Category='GM Friendly',Friendly=true,Model=h,LateModel=m,NoDrop=n,Offset=k&&k.Offset,Bleeding=i,KeyValues={citizentype=CT_UNIQUE},Server=j})end;timer.Simple(5,function()local q={IsDroid=true}p('npc_sw_droid_b1v2_f','B1 Battle Droid V2','models/cac/gm/b1_droid_npc.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_droid_b1v2_h','B1 Battle Droid V2','models/cac/gm/b1_droid_npc.mdl',BLOOD_COLOR_MECH,q)p('npc_sw_droid_b2v2_f','B2 Super Battle Droid V2','models/cac/gm/b2_droid_npc.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_droid_b2v2_h','B2 Super Battle Droid V2','models/cac/gm/b2_droid_npc.mdl',BLOOD_COLOR_MECH,q)p('npc_sw_droid_commando_f','Commando Droid V2','models/cac/gm/cmdo_droid_npc.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_droid_commando_h','Commando Droid V2','models/cac/gm/cmdo_droid_npc.mdl',BLOOD_COLOR_MECH,q)p('npc_gm_trooper_f','GM Trooper','models/cac/gm/gm_trooper.mdl',BLOOD_COLOR_MECH)e('npc_gm_trooper_h','GM Trooper','models/cac/gm/gm_trooper.mdl',BLOOD_COLOR_MECH)p('npc_gm_fungaltrooper_f','Fungal Trooper','models/cac/gm/fungal_clone_npc.mdl',nil,nil,{NoDrop=true})e('npc_gm_fungaltrooper_h','Fungal Trooper','models/cac/gm/fungal_clone_npc.mdl',nil,nil,{NoDrop=true,Class='npc_zombie',LateModel='models/cac/gm/fungal_clone_npc.mdl'})e('npc_gm_zombietrooper_h','Zombie Trooper','models/cac/gm/zombie_clone_npc.mdl',nil,nil,{NoDrop=true,Class='npc_zombie',LateModel='models/cac/gm/zombie_clone_npc.mdl'})p('npc_sw_snow_droid_commandof','Snow Droid Commando','models/tfa/comm/gg/npc_sw_snow_droid_commando.mdl',DONT_BLEED,q)p('npc_sw_snow_droid_b1f','B1 Snow Droid','models/tfa/comm/gg/npc_sw_snow_droid_b1.mdl',DONT_BLEED,q)p('npc_snowdroidb2f','B2 Snow Droid','models/tfa/comm/gg/npc_sw_snow_droid_b2.mdl',DONT_BLEED,q)p('npc_sw_droid_b2_f_gv','B2 Battle Droid w/ Cannon Arm','models/tfa/comm/gg/npc_cit_sw_droid_b2_gunvariant.mdl',BLOOD_COLOR_MECH,q)p('npc_sw_droid_b2_f','B2 Battle Droid','models/tfa/comm/gg/npc_cit_sw_droid_b2.mdl',BLOOD_COLOR_MECH,q)p('npc_sw_magnag_trainer_f','Magna Guard Trainer','models/tfa/comm/gg/npc_reb_magna_guard_trainer.mdl',BLOOD_COLOR_MECH,q)p('npc_sw_magnag_combined_f','Magna Guard','models/tfa/comm/gg/npc_reb_magna_guard_combined.mdl',BLOOD_COLOR_MECH,q)p('npc_sw_magnag_season4_f','Magna Guard (Season4)','models/tfa/comm/gg/npc_reb_magna_guard_season4.mdl',BLOOD_COLOR_MECH,q)p('npc_aquaddroid_friendly','Aqua Droid','models/player/droid/aqua_droid_npc.mdl',BLOOD_COLOR_MECH,q)p('npc_ithorian','Ithorian','models/galactic/ithorian/f_npc_ithorian.mdl')p('npc_pantoranciv','Pantoran','models/galactic/pantoranciv/f_npc_pantoranciv.mdl',DONT_BLEED)p('npc_randybhf','Randy','models/galactic/randybh/f_npc_randybh.mdl',DONT_BLEED)p('npc_twilekf','Twilek','models/galactic/twilek_female/f_npc_twilek_female.mdl',DONT_BLEED)p('npc_wookiee','Wookiee','models/player/f_npc_chewie.mdl',DONT_BLEED)p('npc_quarrenf','Quarren','models/player/lgn/f_npc_quarren.mdl',DONT_BLEED)p('npc_cctrooperf','CC Trooper','models/player/trooper/f_npc_cctrooper.mdl',DONT_BLEED)p('npc_shopkeeperf','Shop Keeper','models/player/lgn/f_npc_shop_keeper.mdl',DONT_BLEED)p('npc_talzf','Talz','models/player/valley/talz/f_npc_talz.mdl',DONT_BLEED)p('npc_orphne','Orphne','models/player/valley/orphne/f_npc_orphne.mdl',DONT_BLEED)p('npc_policedroidf','Police Droid','models/player/valley/policedroid/f_npc_policedroid.mdl',DONT_BLEED)p('npc_gotal','Gotal','models/player/valley/gotal/f_npc_gotal.mdl',DONT_BLEED)p('npc_karkarodonf','Karkarodon','models/player/valley/karkarodon/f_npc_karkarodon.mdl',DONT_BLEED)p('npc_supertrooper','Super Trooper','models/tfa/comm/gg/f_npc_sw_super_trooper.mdl',DONT_BLEED)p('npc_senateguard','Senate Guard','models/tobester/senateguard/f_npc_senateguard.mdl',DONT_BLEED)p('npc_trooper','Trooper','models/galactic/trooper2/trooper2cit.mdl',DONT_BLEED)p('npc_citizendroid1','CitizenDroid1','models/galactic/citizendroid1/citizendroid1.mdl',BLOOD_COLOR_MECH)p('npc_sw_tbh_v1s1f','Trandoshan 1','models/tfa/comm/gg/npc_cit_sw_trandoshan_bounty_hunter_v1.mdl')p('npc_sw_tbh_v1s2f','Trandoshan 2','models/tfa/comm/gg/npc_cit_sw_trandoshan_bounty_hunter_v1_skin2.mdl')p('npc_sw_tbh_v2s1f','Trandoshan 3','models/tfa/comm/gg/npc_cit_sw_trandoshan_bounty_hunter_v2.mdl')p('npc_sw_tbh_v2s2f','Trandoshan 4','models/tfa/comm/gg/npc_cit_sw_trandoshan_bounty_hunter_v2_skin2.mdl')p('npc_mando_fdw_friendly','Mando Female DW','models/tobester/mando/f_dw_mando_npc.mdl')p('npc_mando_mdw_friendly','Mando Male DW','models/tobester/mando/m_dw_mando_npc.mdl')p('npc_maul_fm_friendly','Mando Female Maul','models/tobester/mando/f_maul_mando_npc.mdl')p('npc_maul_mm_friendly','Mando Male Maul','models/tobester/mando/m_maul_mando_npc.mdl')p('npc_coruscant_police','Coruscant Police','models/police/npc_coruscant_police_f.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_snow_droid_commando','Snow Droid Commando','models/tfa/comm/gg/npc_sw_snow_droid_commando.mdl',DONT_BLEED,q)e('npc_sw_snow_droid_b1','B1 Snow Droid','models/tfa/comm/gg/npc_sw_snow_droid_b1.mdl',DONT_BLEED,q)e('npc_snowdroidb2','B2 Snow Droid','models/tfa/comm/gg/npc_sw_snow_droid_b2.mdl',DONT_BLEED,q)e('npc_aquaddroid_hostile','Aqua Droid','models/player/droid/aqua_droid_npc.mdl',BLOOD_COLOR_MECH,q)e('npc_policedroidh','Police Droid','models/player/valley/policedroid/f_npc_policedroid.mdl',DONT_BLEED,q)e('npc_sw_g_droid_b1_h','B1 Geonosis Droid','models/tfa/comm/gg/npc_comb_sw_g_droid_b1.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_t_droid_b1_h','B1 Training Droid','models/tfa/comm/gg/npc_comb_sw_t_droid_b1.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_t_droid_b2','B2 Training Droid','models/tfa/comm/gg/npc_sw_t_droid_b2.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_t_droid_commando','Commando Training Droid','models/tfa/comm/gg/npc_sw_t_droid_commando.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_droid_b1_h','B1 Battle Droid','models/tfa/comm/gg/npc_comb_sw_droid_b1.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_droid_commander_h','Droid Commander','models/tfa/comm/gg/npc_comb_sw_droid_commander.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_droid_commando_h','Commando Droid','models/tfa/comm/gg/npc_comb_sw_droid_commando.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_droid_tactical_h','Tactical Droid','models/tfa/comm/gg/npc_comb_sw_droid_tactical.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_droid_b2_h','B2 Super Battle Droid','models/tfa/comm/gg/npc_comb_sw_droid_b2.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_droid_b2_h_gv','B2 Super Battle Droid w/ Cannon Arm','models/tfa/comm/gg/npc_comb_sw_droid_b2_gunvariant.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_magnag_trainer_h','Magna Trainer','models/tfa/comm/gg/npc_comb_magna_guard_trainer.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_magnag_combined_h','Magna Guard','models/tfa/comm/gg/npc_comb_magna_guard_combined.mdl',BLOOD_COLOR_MECH,q)e('npc_sw_magnag_season4_h','Magna Guard (Season4)','models/tfa/comm/gg/npc_comb_magna_guard_season4.mdl',BLOOD_COLOR_MECH,q)e('pm_sw_droid_b2','Super Battle Droid','models/tfa/comm/gg/pm_sw_droid_b2.mdl',BLOOD_COLOR_MECH,q)e('npc_bhalien','Gran Alien','models/galactic/brownbh/h_npc_brownbhalien.mdl',DONT_BLEED)e('npc_ghost','Ghost','models/galactic/ghosttmodel/h_npc_ghosttmodel.mdl',DONT_BLEED)e('npc_khemval','Khemval','models/galactic/khemval/h_npc_khemval.mdl',DONT_BLEED)e('npc_randybhh','Randy','models/galactic/randybh/h_npc_randybh.mdl',DONT_BLEED)e('npc_sand1','Tusken Raider','models/galactic/sand1/h_npc_sand1.mdl',DONT_BLEED)e('npc_quarrenh','Quarren','models/player/lgn/h_npc_quarren.mdl',DONT_BLEED)e('npc_shopkeeperh','Shop Keeper','models/player/lgn/h_npc_shop_keeper.mdl',DONT_BLEED)e('npc_cctrooperh','CC Trooper','models/player/trooper/h_npc_cctrooper.mdl',DONT_BLEED)e('npc_karkarodonh','Karkarodon','models/player/valley/karkarodon/h_npc_karkarodon.mdl',DONT_BLEED)e('npc_talzh','Talz','models/player/valley/talz/h_npc_talz.mdl')e('npc_mando','Mando ','models/galactic/brownbh/brownbhcomb.mdl')e('npc_geonosian1comb','Geonosian','models/galactic/geonosian1/geonosian1comb.mdl')e('npc_sw_tbh_v1s1h','Trandoshan 1','models/tfa/comm/gg/npc_comb_sw_trandoshan_bounty_hunter_v1.mdl')e('npc_sw_tbh_v1s2h','Trandoshan 2','models/tfa/comm/gg/npc_comb_sw_trandoshan_bounty_hunter_v1_skin2.mdl')e('npc_sw_tbh_v2s1h','Trandoshan 3','models/tfa/comm/gg/npc_comb_sw_trandoshan_bounty_hunter_v2.mdl')e('npc_sw_tbh_v2s2h','Trandoshan 4','models/tfa/comm/gg/npc_comb_sw_trandoshan_bounty_hunter_v2_skin2.mdl')e('npc_mando_fdw_hostile','Mando Female DW','models/tobester/mando/f_dw_mando_npc.mdl')e('npc_mando_mdw_hostile','Mando Male DW','models/tobester/mando/m_dw_mando_npc.mdl')e('npc_maul_fm_hostile','Mando Female Maul','models/tobester/mando/f_maul_mando_npc.mdl')e('npc_maul_mm_hostile','Mando Male Maul','models/tobester/mando/m_maul_mando_npc.mdl')e('npc_rakghoul','Rakghoul','models/galactic/swtorrhak/swtorrhak.mdl',nil,nil,{Class='npc_fastzombie',LateModel='models/galactic/swtorrhak/swtorrhak.mdl'})e('npc_buzz_droid','Buzz Droid','models/loic_buzzdroid/buzzdroid.mdl',BLOOD_COLOR_MECH,q,{Class='npc_manhack'})e('npc_coruscant_police','Coruscant Police','models/police/npc_coruscant_police_h.mdl',BLOOD_COLOR_MECH,q)e('npc_combine_sniper','Combine Sniper','models/combine_soldier.mdl',nil,nil,{Class='npc_sniper'})e('npc_droidtac_sniper','Tactical Droid Sniper','models/tfa/comm/gg/npc_comb_sw_droid_tactical.mdl',nil,nil,{Class='npc_sniper'})e('npc_droidt_sniper','Droid Sniper','models/tfa/comm/gg/npc_comb_sw_droid_commando.mdl',nil,nil,{Class='npc_sniper'})e('npc_clone_sniper','Trooper Sniper','models/player/trooper/h_npc_cctrooper.mdl',DONT_BLEED)e('combine_sniper','Combine Sniper v2','models/combine_sniper_2.mdl',nil,nil,{Class='npc_combine_s'})local r={Collision=true,LateModel=true,Offset=90}local s={Collision=true,LateModel=true,Offset=90}e('npc_metropolice_arctic2','Arctic','models/DPFilms/Metropolice/arctic_police.mdl',nil,nil,r)e('npc_metropolice_badass','Badass','models/DPFilms/Metropolice/badass_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_specops','Spec Ops','models/DPFilms/Metropolice/biopolice.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_c08police','City 08 Police','models/DPFilms/Metropolice/c08cop.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_civilmedic','Civil Medic','models/DPFilms/Metropolice/civil_medic.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_blackpolice','Black Metro Police','models/DPFilms/Metropolice/blacop.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_skullsquad','Skull Squad','models/DPFilms/Metropolice/blacop.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_beta','Beta Metro Police','models/DPFilms/Metropolice/hl2beta_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_blueeye','Blue eyed Metro Police','models/DPFilms/Metropolice/hl2concept.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_hdmetro','HD Metro Police','models/DPFilms/Metropolice/HDpolice.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_hunter','Hunter Squad','models/DPFilms/Metropolice/hunter_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_phoenixmetro','Phoenix Metro Police','models/DPFilms/Metropolice/phoenix_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_breen','Breen Troops','models/DPFilms/Metropolice/police_bt.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_eliteshock','Elite Shock Unit','models/DPFilms/Metropolice/elite_police.mdl',nil,nil,s,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_concepttrenchcoat','Concept Trenchcoat','models/DPFilms/Metropolice/rtb_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_f','Female Metro Police','models/DPFilms/Metropolice/female_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_fragger','Fragger Police','models/DPFilms/Metropolice/police_fragger.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_trenchcoat','Trenchcoat Metro Police','models/DPFilms/Metropolice/policetrench.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_rogue','Rogue Police','models/DPFilms/Metropolice/rogue_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_citizen_resistance','Resistance Police','models/DPFilms/Metropolice/resistance_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_retro','Retro Police','models/DPFilms/Metropolice/retrocop.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_steampunk','Steampunk Police','models/DPFilms/Metropolice/steampunk_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_tf_red','TF2 RED Police','models/DPFilms/Metropolice/tf2_metrocop.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_tribal','Tribal Police','models/DPFilms/Metropolice/tribal_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_tron_blue','Tron Styled Blue','models/DPFilms/Metropolice/tron_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_urban','Urban Camo','models/DPFilms/Metropolice/urban_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})r.Skin=1;e('npc_barney_hd','HD Barney','models/DPFilms/Metropolice/HD_Barney.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_barney_hdep1','HD Barney ep1','models/DPFilms/Metropolice/HD_Barney.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})e('npc_metropolice_tron_orange','Tron Styled Orange','models/DPFilms/Metropolice/tron_police.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})r.Skin=2;e('npc_metropolice_tf_blu','TF2 BLU Police','models/DPFilms/Metropolice/tf2_metrocop.mdl',nil,nil,r,{'weapon_smg1','weapon_pistol'})list.Set('NPC','npc_buzz_droid',{Name='Buzz Droid',Class='npc_manhack',Weapons={''},Model='models/loic_buzzdroid/buzzdroid.mdl',LateModel='models/loic_buzzdroid/buzzdroid.mdl',Health='25',Numgrenades='0',Category='GM Hostile'})list.Set('SpawnableEntities','combine_mine_civilian',{PrintName='Anti-Combine Mine',ClassName='combine_mine',Category='Half-Life 2',NormalOffset=32,DropToFloor=true,KeyValues={modification=1}})list.Set('SpawnableEntities','item_item_crate',{PrintName='Dynamic Item Crate',ClassName='item_item_crate',Category='Half-Life 2',NormalOffset=32,DropToFloor=true,KeyValues={itemclass='item_dynamic_resupply',itemcount=1}})list.Set('SpawnableEntities','sup_crate_ar2',{PrintName='Item Crate - Pulse Ammo',ClassName='item_item_crate',Category='Half-Life 2',NormalOffset=32,DropToFloor=true,KeyValues={itemclass='item_ammo_ar2_large',itemcount=2}})list.Set('SpawnableEntities','sup_crate_health',{PrintName='Item Crate - Health',ClassName='item_item_crate',Category='Half-Life 2',NormalOffset=32,DropToFloor=true,KeyValues={itemclass='item_healthkit',itemcount=2}})list.Set('SpawnableEntities','sup_crate_nade',{PrintName='Item Crate - Grenade',ClassName='item_item_crate',Category='Half-Life 2',NormalOffset=32,DropToFloor=true,KeyValues={itemclass='npc_grenade_frag',itemcount=1}})end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/player/tips_cl.lua:
srp.tips.Set({'Jumping in moonpool is not a good idea but it is refreshing','To get into an LAAT with no pilot press ALT+E','If the shield generator goes down, avoid tight corridors!','Tired of being an ordinary clone trooper? Join a battalion!','The only good droid is a dead one.','A credit saved is a credit earned.','Han shot first','In this galaxy nothing can be said to be certain, except death and taxes.','Don\'t engage anyone if the jedi are already fighting them.','Always assume CG are watching you... follow the rules.','It is estimated that Yoda is at least over 900 years old.\nClones have a estimated lifespan of only 40-50 years due to their increased aging speed','Thank you for playing and supporting the community <3','Thank you for playing and supporting the community <3','Thank you for playing and supporting the community <3','Thank you for playing and supporting the community <3','Thank you for playing and supporting the community <3','Thank you for playing and supporting the community <3','Thank you for playing and supporting the community <3','Thank you for playing and supporting the community <3','<3','Phase Two is out tomorrow','Phase Two is not out tomorrow','Please check the Trello to keep up to date with progress.\nYou could just keep asking the same questions at the community meetings as well.','Remember to stay hydrated!','If you are lost on a planetary mission, stick with the first batallion you find.\nAn extra set of hands is always usefull!','Fall damage is deadly. Be careful!','One armor point takes double the hit points compared to health, but there is no way to get it back once it is lost!','Experience or XP can be used to level up your character, resulting in perks such as extra credits on kill or health and armor!','If you are on the server for 10 hours you recieve a 100% XP boost!','Tell people before you place explosives or throw grenades. It\'ll save lives.','Remember to take all things in moderation. Even Garry\'s Mod!','If you\'re looking for a tryout pay attention to broadcasts!','If an accidental weapon discharge takes place, please do not run away or act suspiciously, simply own up to it.','Make other characters to try out other battalions.','If you minge during PTS or promotions you can be arrested','The one with the high ground always wins','Respect others and get respected','If you die and a medic is nearby please don\'t respawn immediately, they can revive you.','If you aren\'t sure about something just ask.','Do not break the golden rule! Never shoot another brother.','Contact Staff by using @ before your message','Certain areas of the map may have restricted access. Be sure to check the doors first!','Loadout items are permanently unlocked for that Character','If you think what you\'re doing is against the rules then it most likely is','The best way to roleplay successfully is to know what you\'re talking about','F2 opens your inventory. This is permanent for that characater until an item is used.','Ammunition stored in your gun is temporary. Do not over use inventry ammo!'})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/quests/_templates_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/quests/dailies_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/cw_base.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stool_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/advdupe2.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/drgbase_tool_mover.lua:
TOOL.Tab="DrGBase"TOOL.Category="Tools"TOOL.Name="#tool.drgbase_tool_mover.name"TOOL.BuildCPanel=function(a)a:Help("#tool.drgbase_tool_mover.desc")a:Help("#tool.drgbase_tool_mover.0")end;function TOOL:LeftClick(b)if!IsValid(b.Entity)then return false end;if!b.Entity.IsDrGNextbot then return false end;if CLIENT then return true end;self:GetOwner():DrG_CleverEntitySelect(b.Entity)return true end;function TOOL:RightClick(b)if CLIENT then return true end;for c in self:GetOwner():DrG_SelectedEntities()do c._DrGBaseMoverTool=true;c:CallInCoroutine(function(c,d)c._DrGBaseMoverTool=false;c:GoTo(b.HitPos,nil,function()if c._DrGBaseMoverTool then return false end end)end)end;return true end;function TOOL:Reload(b)if CLIENT then return true end;self:GetOwner():DrG_ClearSelectedEntities()return true end;if CLIENT then language.Add("tool.drgbase_tool_mover.name","Nextbot Mover")language.Add("tool.drgbase_tool_mover.desc","Force nextbots to move to a different position.")language.Add("tool.drgbase_tool_mover.0","Left click to select/deselect a nextbot (hold shift to select multiple nextbots), right click to set the position to go to and reload to clear the list of selected nextbots.")hook.Add("PreDrawHalos","DrGBaseToolMoverHalos",function()local e=LocalPlayer()local f=e:GetActiveWeapon()if!IsValid(f)||f:GetClass()!="gmod_tool"then return end;local g=e:GetTool()if g==nil||g.Mode!="drgbase_tool_mover"then return end;halo.Add(e:DrG_GetSelectedEntities(),DrGBase.CLR_CYAN,nil,nil,nil,nil,true)end)end
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/rb655_lightsaber.lua:
TOOL.Category="Robotboy655"TOOL.Name="#tool.rb655_lightsaber"TOOL.ClientConVar["model"]="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"TOOL.ClientConVar["red"]="0"TOOL.ClientConVar["green"]="127"TOOL.ClientConVar["blue"]="255"TOOL.ClientConVar["bladew"]="2"TOOL.ClientConVar["bladel"]="42"TOOL.ClientConVar["dark"]="0"TOOL.ClientConVar["humsound"]="lightsaber/saber_loop1.wav"TOOL.ClientConVar["swingsound"]="lightsaber/saber_swing1.wav"TOOL.ClientConVar["onsound"]="lightsaber/saber_on1.wav"TOOL.ClientConVar["offsound"]="lightsaber/saber_off1.wav"TOOL.Information={{name="left"},{name="right"}}cleanup.Register'ent_lightsabers'function TOOL:SetupInfo(a)local b=self:GetClientNumber'red'local c=self:GetClientNumber'green'local d=self:GetClientNumber'blue'local e=Color(b,c,d)local f=self:GetClientInfo'humsound'local g=self:GetClientInfo'swingsound'local h=self:GetClientInfo'onsound'local i=self:GetClientInfo'offsound'local j=self:GetClientNumber'dark'local k=math.Clamp(self:GetClientNumber('bladew'),2,3)local l=math.Clamp(self:GetClientNumber('bladel'),20,50)local m=a:GetInfo'rb655_lightsaber_model'if!file.Exists(m,'GAME')then return false end;a:StripWeapon'weapon_lightsaber_wos'local n=a:Give'weapon_lightsaber_wos'if!IsValid(n)then return false end;n:SetModel(m)n:SetWorldModel(m)table.Merge(n:GetTable(),{Owner=a,LoopSound=LoopSound,SwingSound=SwingSound,OnSound=OnSound,OffSound=OffSound,model=m,Model=m,UseHilt=m,UseColor=e,UseLoopSound=f,UseSwingSound=g,UseOnSound=h,UseOffSound=i,UseDarkInner=j,UseLength=l,UseWidth=k})timer.Simple(0.2,function()if IsValid(a)then a:SelectWeapon'weapon_lightsaber_wos'end end)end;function TOOL:LeftClick(o)if CLIENT then return true end;if!o||!IsValid(o.Entity)||!o.Entity:IsPlayer()then return end;self:SetupInfo(o.Entity)return true end;function TOOL:RightClick(o)if CLIENT then return true end;self:SetupInfo(self:GetOwner())return true end;function TOOL:Deploy()end;list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.1",{rb655_lightsaber_humsound="lightsaber/saber_loop1.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.1",{rb655_lightsaber_humsound="lightsaber/saber_loop1.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.2",{rb655_lightsaber_humsound="lightsaber/saber_loop2.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.3",{rb655_lightsaber_humsound="lightsaber/saber_loop3.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.4",{rb655_lightsaber_humsound="lightsaber/saber_loop4.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.5",{rb655_lightsaber_humsound="lightsaber/saber_loop5.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.6",{rb655_lightsaber_humsound="lightsaber/saber_loop6.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.7",{rb655_lightsaber_humsound="lightsaber/saber_loop7.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.8",{rb655_lightsaber_humsound="lightsaber/saber_loop8.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.dark",{rb655_lightsaber_humsound="lightsaber/darksaber_loop.wav"})list.Set("rb655_LightsaberSwingSounds","#tool.rb655_lightsaber.jedi",{rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav"})list.Set("rb655_LightsaberSwingSounds","#tool.rb655_lightsaber.sith",{rb655_lightsaber_swingsound="lightsaber/saber_swing2.wav"})list.Set("rb655_LightsaberSwingSounds","#tool.rb655_lightsaber.dark",{rb655_lightsaber_swingsound="lightsaber/darksaber_swing.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.jedi",{rb655_lightsaber_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_offsound="lightsaber/saber_off1.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.jedi_fast",{rb655_lightsaber_onsound="lightsaber/saber_on1_fast.wav",rb655_lightsaber_offsound="lightsaber/saber_off1_fast.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.sith",{rb655_lightsaber_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_offsound="lightsaber/saber_off2.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.sith_fast",{rb655_lightsaber_onsound="lightsaber/saber_on2_fast.wav",rb655_lightsaber_offsound="lightsaber/saber_off2_fast.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.heavy",{rb655_lightsaber_onsound="lightsaber/saber_on3.wav",rb655_lightsaber_offsound="lightsaber/saber_off3.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.heavy_fast",{rb655_lightsaber_onsound="lightsaber/saber_on3_fast.wav",rb655_lightsaber_offsound="lightsaber/saber_off3_fast.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.jedi2",{rb655_lightsaber_onsound="lightsaber/saber_on4.wav",rb655_lightsaber_offsound="lightsaber/saber_off4.mp3"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.jedi2_fast",{rb655_lightsaber_onsound="lightsaber/saber_on4_fast.wav",rb655_lightsaber_offsound="lightsaber/saber_off4_fast.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.dark",{rb655_lightsaber_onsound="lightsaber/darksaber_on.wav",rb655_lightsaber_offsound="lightsaber/darksaber_off.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.kylo",{rb655_lightsaber_onsound="lightsaber/saber_on_kylo.wav",rb655_lightsaber_offsound="lightsaber/saber_off_kylo.wav"})language.Add("tool.rb655_lightsaber","Lightsabers")language.Add("tool.rb655_lightsaber.name","Lightsabers")language.Add("tool.rb655_lightsaber.desc","Spawn customized lightsabers")language.Add("tool.rb655_lightsaber.0","Left click to spawn a Lightsaber. Right click to give yourself a Lightsaber")language.Add("tool.rb655_lightsaber.left","Spawn a Lightsaber Entity")language.Add("tool.rb655_lightsaber.right","Give yourself a Lightsaber Weapon")language.Add("tool.rb655_lightsaber.model","Hilt")language.Add("tool.rb655_lightsaber.color","Crystal Color")language.Add("tool.rb655_lightsaber.take","Take this lightsaber")language.Add("tool.rb655_lightsaber.DarkInner","Dark inner blade")language.Add("tool.rb655_lightsaber.StartEnabled","Enabled on spawn")language.Add("tool.rb655_lightsaber.HumSound","Hum Sound")language.Add("tool.rb655_lightsaber.SwingSound","Swing Sound")language.Add("tool.rb655_lightsaber.IgniteSound","Ignition Sound")language.Add("tool.rb655_lightsaber.HudBlur","Enable HUD Blur ( may reduce performance )")language.Add("tool.rb655_lightsaber.bladew","Blade Width")language.Add("tool.rb655_lightsaber.bladel","Blade Length")language.Add("tool.rb655_lightsaber.jedi","Jedi")language.Add("tool.rb655_lightsaber.jedi_fast","Jedi - Fast")language.Add("tool.rb655_lightsaber.sith","Sith")language.Add("tool.rb655_lightsaber.sith_fast","Sith - Fast")language.Add("tool.rb655_lightsaber.heavy","Heavy")language.Add("tool.rb655_lightsaber.heavy_fast","Heavy - Fast")language.Add("tool.rb655_lightsaber.jedi2","Jedi - Original")language.Add("tool.rb655_lightsaber.jedi2_fast","Jedi - Original Fast")language.Add("tool.rb655_lightsaber.dark","Dark Saber")language.Add("tool.rb655_lightsaber.kylo","Kylo Ren")language.Add("tool.rb655_lightsaber.hum.1","Default")language.Add("tool.rb655_lightsaber.hum.2","Sith Heavy")language.Add("tool.rb655_lightsaber.hum.3","Medium")language.Add("tool.rb655_lightsaber.hum.4","Heavish")language.Add("tool.rb655_lightsaber.hum.5","Sith Assassin Light")language.Add("tool.rb655_lightsaber.hum.6","Darth Vader")language.Add("tool.rb655_lightsaber.hum.7","Heavy")language.Add("tool.rb655_lightsaber.hum.8","Dooku")language.Add("Cleanup_ent_lightsabers","Lightsabers")language.Add("Cleaned_ent_lightsabers","Cleaned up all Lightsabers")language.Add("SBoxLimit_ent_lightsabers","You've hit the Lightsaber limit!")language.Add("Undone_ent_lightsaber","Lightsaber undone")language.Add("max_ent_lightsabers","Max Lightsabers")language.Add("tool.rb655_lightsaber.preset1","Darth Maul's Saberstaff")language.Add("tool.rb655_lightsaber.preset2","Darth Maul's Lightsaber")language.Add("tool.rb655_lightsaber.preset3","Darth Tyrannus's Lightsaber (Count Dooku)")language.Add("tool.rb655_lightsaber.preset4","Darth Sidious's Lightsaber")language.Add("tool.rb655_lightsaber.preset5","Darth Vader's Lightsaber")language.Add("tool.rb655_lightsaber.preset6","Master Yoda's Lightsaber")language.Add("tool.rb655_lightsaber.preset7","Qui-Gon Jinn's Lightsaber")language.Add("tool.rb655_lightsaber.preset8","Mace Windu's Lightsaber")language.Add("tool.rb655_lightsaber.preset9","[EP3] Obi-Wan Kenobi's Lightsaber")language.Add("tool.rb655_lightsaber.preset10","[EP1] Obi-Wan Kenobi's Lightsaber")language.Add("tool.rb655_lightsaber.preset11","[EP6] Luke Skywalker's Lightsaber")language.Add("tool.rb655_lightsaber.preset12","[EP2] Anakin Skywalker's Lightsaber")language.Add("tool.rb655_lightsaber.preset13","[EP3] Anakin Skywalker's Lightsaber")language.Add("tool.rb655_lightsaber.preset14","Common Jedi Lightsaber")language.Add("tool.rb655_lightsaber.preset15","Dark Saber")language.Add("tool.rb655_lightsaber.preset_kylo","Kylo Ren's Crossguard Lightsaber")local p=TOOL:BuildConVarList()local q={["#preset.default"]=p,["#tool.rb655_lightsaber.preset1"]={rb655_lightsaber_model="models/weapons/starwars/w_maul_saber_staff_hilt.mdl",rb655_lightsaber_red="255",rb655_lightsaber_green="0",rb655_lightsaber_blue="0",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.4",rb655_lightsaber_bladel="45",rb655_lightsaber_humsound="lightsaber/saber_loop7.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing2.wav",rb655_lightsaber_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_offsound="lightsaber/saber_off2.wav"},["#tool.rb655_lightsaber.preset2"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_maul_saber_half_hilt.mdl",rb655_lightsaber_red="255",rb655_lightsaber_green="0",rb655_lightsaber_blue="0",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.4",rb655_lightsaber_bladel="45",rb655_lightsaber_humsound="lightsaber/saber_loop7.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing2.wav",rb655_lightsaber_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_offsound="lightsaber/saber_off2.wav"},["#tool.rb655_lightsaber.preset3"]={rb655_lightsaber_model="models/weapons/starwars/w_dooku_saber_hilt.mdl",rb655_lightsaber_red="255",rb655_lightsaber_green="0",rb655_lightsaber_blue="0",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2",rb655_lightsaber_bladel="42",rb655_lightsaber_humsound="lightsaber/saber_loop8.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing2.wav",rb655_lightsaber_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_offsound="lightsaber/saber_off2.wav"},["#tool.rb655_lightsaber.preset4"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_sidious_saber_hilt.mdl",rb655_lightsaber_red="255",rb655_lightsaber_green="0",rb655_lightsaber_blue="0",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.2",rb655_lightsaber_bladel="43",rb655_lightsaber_humsound="lightsaber/saber_loop5.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing2.wav",rb655_lightsaber_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_offsound="lightsaber/saber_off2.wav"},["#tool.rb655_lightsaber.preset5"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_vader_saber_hilt.mdl",rb655_lightsaber_red="255",rb655_lightsaber_green="0",rb655_lightsaber_blue="0",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.25",rb655_lightsaber_bladel="43",rb655_lightsaber_humsound="lightsaber/saber_loop6.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing2.wav",rb655_lightsaber_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_offsound="lightsaber/saber_off2.wav"},["#tool.rb655_lightsaber.preset6"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_yoda_saber_hilt.mdl",rb655_lightsaber_red="64",rb655_lightsaber_green="255",rb655_lightsaber_blue="64",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.3",rb655_lightsaber_bladel="40",rb655_lightsaber_humsound="lightsaber/saber_loop3.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber.preset7"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_quigon_gin_saber_hilt.mdl",rb655_lightsaber_red="32",rb655_lightsaber_green="255",rb655_lightsaber_blue="32",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.2",rb655_lightsaber_bladel="42",rb655_lightsaber_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber.preset8"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_mace_windu_saber_hilt.mdl",rb655_lightsaber_red="127",rb655_lightsaber_green="0",rb655_lightsaber_blue="255",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2",rb655_lightsaber_bladel="42",rb655_lightsaber_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber.preset9"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_obiwan_ep3_saber_hilt.mdl",rb655_lightsaber_red="48",rb655_lightsaber_green="48",rb655_lightsaber_blue="255",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.1",rb655_lightsaber_bladel="42",rb655_lightsaber_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber.preset10"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_obiwan_ep1_saber_hilt.mdl",rb655_lightsaber_red="48",rb655_lightsaber_green="48",rb655_lightsaber_blue="255",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.1",rb655_lightsaber_bladel="42",rb655_lightsaber_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber.preset11"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_luke_ep6_saber_hilt.mdl",rb655_lightsaber_red="32",rb655_lightsaber_green="255",rb655_lightsaber_blue="32",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.1",rb655_lightsaber_bladel="42",rb655_lightsaber_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber.preset12"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl",rb655_lightsaber_red="0",rb655_lightsaber_green="100",rb655_lightsaber_blue="255",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.1",rb655_lightsaber_bladel="42",rb655_lightsaber_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber.preset13"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl",rb655_lightsaber_red="0",rb655_lightsaber_green="100",rb655_lightsaber_blue="255",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.1",rb655_lightsaber_bladel="42",rb655_lightsaber_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber.preset14"]={rb655_lightsaber_model="models/sgg/starwars/weapons/w_common_jedi_saber_hilt.mdl",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.2",rb655_lightsaber_bladel="42",rb655_lightsaber_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber.preset_kylo"]={rb655_lightsaber_model="models/weapons/starwars/w_kr_hilt.mdl",rb655_lightsaber_red="255",rb655_lightsaber_green="0",rb655_lightsaber_blue="0",rb655_lightsaber_dark="0",rb655_lightsaber_bladew="2.1",rb655_lightsaber_bladel="40",rb655_lightsaber_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_onsound="lightsaber/saber_on_kylo.wav",rb655_lightsaber_offsound="lightsaber/saber_off_kylo.wav"},["#tool.rb655_lightsaber.preset15"]={rb655_lightsaber_red="255",rb655_lightsaber_green="255",rb655_lightsaber_blue="255",rb655_lightsaber_dark="1",rb655_lightsaber_humsound="lightsaber/darksaber_loop.wav",rb655_lightsaber_swingsound="lightsaber/darksaber_swing.wav",rb655_lightsaber_onsound="lightsaber/darksaber_on.wav",rb655_lightsaber_offsound="lightsaber/darksaber_off.wav"}}function TOOL.BuildCPanel(r)r:AddControl("ComboBox",{MenuButton=1,Folder="rb655_lightsabers",Options=q,CVars=table.GetKeys(p)})r:AddControl("PropSelect",{Label="#tool.rb655_lightsaber.model",Height=4,ConVar="rb655_lightsaber_model",Models=list.Get("LightsaberModels")})r:AddControl("Color",{Label="#tool.rb655_lightsaber.color",Red="rb655_lightsaber_red",Green="rb655_lightsaber_green",Blue="rb655_lightsaber_blue",ShowAlpha="0",ShowHSV="1",ShowRGB="1"})r:AddControl("Checkbox",{Label="#tool.rb655_lightsaber.DarkInner",Command="rb655_lightsaber_dark"})r:AddControl("Slider",{Label="#tool.rb655_lightsaber.bladeW",Type="Float",Min=2,Max=4,Command="rb655_lightsaber_bladew"})r:AddControl("Slider",{Label="#tool.rb655_lightsaber.bladeL",Type="Float",Min=32,Max=64,Command="rb655_lightsaber_bladel"})r:AddControl("ListBox",{Label="#tool.rb655_lightsaber.HumSound",Options=list.Get("rb655_LightsaberHumSounds")})r:AddControl("ListBox",{Label="#tool.rb655_lightsaber.SwingSound",Options=list.Get("rb655_LightsaberSwingSounds")})r:AddControl("ListBox",{Label="#tool.rb655_lightsaber.IgniteSound",Options=list.Get("rb655_LightsaberIgniteSounds")})r:AddControl("Checkbox",{Label="#tool.rb655_lightsaber.HudBlur",Command="rb655_lightsaber_hud_blur"})r.Think=function(s)if LocalPlayer().wOSRefresh then s:Clear()s:AddControl("ComboBox",{MenuButton=1,Folder="rb655_lightsabers",Options=q,CVars=table.GetKeys(p)})s:AddControl("PropSelect",{Label="#tool.rb655_lightsaber.model",Height=4,ConVar="rb655_lightsaber_model",Models=list.Get("LightsaberModels")})s:AddControl("Color",{Label="#tool.rb655_lightsaber.color",Red="rb655_lightsaber_red",Green="rb655_lightsaber_green",Blue="rb655_lightsaber_blue",ShowAlpha="0",ShowHSV="1",ShowRGB="1"})s:AddControl("Checkbox",{Label="#tool.rb655_lightsaber.DarkInner",Command="rb655_lightsaber_dark"})s:AddControl("Slider",{Label="#tool.rb655_lightsaber.bladeW",Type="Float",Min=2,Max=4,Command="rb655_lightsaber_bladew"})s:AddControl("Slider",{Label="#tool.rb655_lightsaber.bladeL",Type="Float",Min=32,Max=64,Command="rb655_lightsaber_bladel"})s:AddControl("ListBox",{Label="#tool.rb655_lightsaber.HumSound",Options=list.Get("rb655_LightsaberHumSounds")})s:AddControl("ListBox",{Label="#tool.rb655_lightsaber.SwingSound",Options=list.Get("rb655_LightsaberSwingSounds")})s:AddControl("ListBox",{Label="#tool.rb655_lightsaber.IgniteSound",Options=list.Get("rb655_LightsaberIgniteSounds")})s:AddControl("Checkbox",{Label="#tool.rb655_lightsaber.HudBlur",Command="rb655_lightsaber_hud_blur"})LocalPlayer().wOSRefresh=false end end end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/resizer.lua:
TOOL.Category='Superior Tools'TOOL.Name='Resizer'TOOL.LeftClickAutomatic=true;TOOL.RightClickAutomatic=true;if CLIENT then language.Add('Tool.resizer.name','Model Resizer')language.Add('Tool.resizer.left','Increase scale')language.Add('Tool.resizer.right','Decrease scale')language.Add('Tool.resizer.reload','Reset scale')language.Add('Tool.resizer.desc','Resizes a model')end;TOOL.Information={{name='left'},{name='right'},{name='reload'}}local function a(b,c)if b:IsRagdoll()then return end;local d=b:GetModelScale()b:SetModelScale(math.Clamp(d+c,0.5,10))end;function TOOL:LeftClick(e)if SERVER&&IsValid(e.Entity)&&e.Entity:GetClass()=='prop_physics'then a(e.Entity,.1)end end;function TOOL:RightClick(e)if SERVER&&IsValid(e.Entity)&&e.Entity:GetClass()=='prop_physics'then a(e.Entity,-.1)end end;function TOOL:Reload(e)if SERVER&&IsValid(e.Entity)&&e.Entity:GetClass()=='prop_physics'then e.Entity:SetModelScale(1)end end;function TOOL.BuildCPanel(f)end;local g;local h=0;function TOOL:DrawHUD()if LocalPlayer():KeyDown(IN_ATTACK)then g=LocalPlayer():GetEyeTrace().Entity;h=CurTime()+2 end;if h>CurTime()&&IsValid(g)then local i,j=g:GetRenderBounds()cam.Start3D()render.DrawWireframeBox(g:GetPos(),g:GetAngles(),i,j,col.red)cam.End3D()end end
--addons/!lpakr_out/lua/improvedstacker/improvedstacker.lua:
return lpakr()()
--addons/!lpakr_out/lua/improvedweight/localization.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/wheel.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/digitalscreen.lua:
WireToolSetup.setCategory("Visuals/Screens")WireToolSetup.open("digitalscreen","Digital Screen","gmod_wire_digitalscreen",nil,"Digital Screens")if CLIENT then language.Add("tool.wire_digitalscreen.name","Digital Screen Tool (Wire)")language.Add("tool.wire_digitalscreen.desc","Spawns a digital screen, which can be used to draw pixel by pixel.")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/props_lab/monitor01b.mdl",width=32,height=32,createflat=0}function TOOL.BuildCPanel(a)WireDermaExts.ModelSelect(a,"wire_digitalscreen_model",list.Get("WireScreenModels"),5)a:NumSlider("Width","wire_digitalscreen_width",1,512,0)a:NumSlider("Height","wire_digitalscreen_height",1,512,0)a:CheckBox("#Create Flat to Surface","wire_digitalscreen_createflat")end
--addons/!lpakr_out/lua/wire/stools/forcer.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/forcer.lua:
WireToolSetup.setCategory("Physics/Force")WireToolSetup.open("forcer","Forcer","gmod_wire_forcer",nil,"Forcers")if CLIENT then language.Add("tool.wire_forcer.name","Forcer Tool (Wire)")language.Add("tool.wire_forcer.desc","Spawns a forcer prop for use with the wire system.")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={multiplier=1,length=100,beam=1,reaction=0,model="models/jaanus/wiretool/wiretool_siren.mdl"}function TOOL:GetGhostMin(a,b)if self:GetModel()=="models/jaanus/wiretool/wiretool_grabber_forcer.mdl"then return a.z+20 else return a.z end end;function TOOL.BuildCPanel(c)WireToolHelpers.MakePresetControl(c,"wire_forcer")ModelPlug_AddToCPanel(c,"Forcer","wire_forcer",true,1)c:NumSlider("Force multiplier","wire_forcer_multiplier",1,10000,0)c:NumSlider("Force distance","wire_forcer_length",1,2048,0)c:CheckBox("Show beam","wire_forcer_beam")c:CheckBox("Apply reaction force","wire_forcer_reaction")end
--addons/!lpakr_out/lua/wire/stools/hdd.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/hologrid.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/igniter.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/indicator.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/keypad.lua:
WireToolSetup.setCategory("Input, Output")WireToolSetup.open("keypad","Keypad","gmod_wire_keypad",nil,"Keypads")if CLIENT then language.Add("tool."..TOOL.Mode..".name",TOOL.Name.." Tool (Wire)")language.Add("tool."..TOOL.Mode..".desc","Spawns a "..TOOL.Name)language.Add("tool."..TOOL.Mode..".password","Password: ")language.Add("tool."..TOOL.Mode..".secure","Display Asterisks: ")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(10)TOOL.ClientConVar={model="models/props_lab/keypad.mdl",password="",secure="0",createflat="1"}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_keypad")a:TextEntry("#tool.wire_keypad.password","wire_keypad_password"):SetNumeric(true)a:CheckBox("#tool.wire_keypad.secure","wire_keypad_secure")end
--addons/!lpakr_out/lua/wire/stools/rt_screen.lua:
WireToolSetup.setCategory("Visuals")WireToolSetup.open("rt_screen","RT Screen","gmod_wire_rt_screen",nil,"RT Screens")if CLIENT then language.Add("tool.wire_rt_screen.name","Render-Target Screen")language.Add("tool.wire_rt_screen.desc","Places Render Target screens")language.Add("tool.wire_rt_screen.0","Create or update RT Screen")language.Add("tool.wire_rt_screen.settings.hint_serverside","Following settings are server-side, they are stored during duplication and changes to them are visible to all clients")language.Add("tool.wire_rt_screen.settings.screenmaterial","Screen effect")language.Add("tool.wire_rt_screen.settings.hint_clientside","Following settings are client-side, they are player-specific, not stored via duplication and not visible by other players")language.Add("tool.wire_rt_screen.settings.cl_renderdistance","Render range")WireToolSetup.setToolMenuIcon("icon16/camera.png")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/kobilica/wiremonitorbig.mdl",screenmaterial="normal"}function TOOL.BuildCPanel(a)a:Help("#tool.wire_rt_screen.settings.hint_serverside")WireDermaExts.ModelSelect(a,"wire_rt_screen_model",list.Get("WireScreenModels"),5)local b=a:ComboBox("#tool.wire_rt_screen.settings.screenmaterial","wire_rt_screen_screenmaterial")local c=file.Find("materials/improvedrt_screen/monitor_*.vmt","GAME")for d,e in ipairs(c)do local f=e:match("monitor_(.+)%.vmt")if f!=nil then b:AddChoice(f)end end;a:Help("#tool.wire_rt_screen.settings.hint_clientside")a:NumSlider("#tool.wire_rt_screen.settings.cl_renderdistance","wire_rt_screen_renderdistance",0,999999,0)end
--addons/!lpakr_out/lua/wire/stools/sensor.lua:
WireToolSetup.setCategory("Detection/Beacon")WireToolSetup.open("sensor","Beacon Sensor","gmod_wire_sensor",nil,"Beacon Sensors")if CLIENT then language.Add("Tool.wire_sensor.name","Beacon Sensor Tool (Wire)")language.Add("Tool.wire_sensor.desc","Returns distance and/or bearing to a beacon")language.Add("WireSensorTool_outdist","Output distance")language.Add("WireSensorTool_outbrng","Output bearing")language.Add("WireSensorTool_xyz_mode","Output local position, relative to beacon")language.Add("WireSensorTool_gpscord","Output world position ('split XYZ')")language.Add("WireSensorTool_direction_vector","Output direction Vector")language.Add("WireSensorTool_direction_normalized","Normalize direction Vector")language.Add("WireSensorTool_target_velocity","Output target's velocity")language.Add("WireSensorTool_velocity_normalized","Normalize velocity")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar["xyz_mode"]="0"TOOL.ClientConVar["outdist"]="1"TOOL.ClientConVar["outbrng"]="0"TOOL.ClientConVar["gpscord"]="0"TOOL.ClientConVar["direction_vector"]="0"TOOL.ClientConVar["direction_normalized"]="0"TOOL.ClientConVar["target_velocity"]="0"TOOL.ClientConVar["velocity_normalized"]="0"TOOL.Model="models/props_lab/huladoll.mdl"WireToolSetup.SetupLinking(true,"beacon")function TOOL.BuildCPanel(a)a:CheckBox("#WireSensorTool_outdist","wire_sensor_outdist")a:CheckBox("#WireSensorTool_outbrng","wire_sensor_outbrng")a:CheckBox("#WireSensorTool_xyz_mode","wire_sensor_xyz_mode")a:CheckBox("#WireSensorTool_gpscord","wire_sensor_gpscord")a:CheckBox("#WireSensorTool_direction_vector","wire_sensor_direction_vector")a:CheckBox("#WireSensorTool_direction_normalized","wire_sensor_direction_normalized")a:CheckBox("#WireSensorTool_target_velocity","wire_sensor_target_velocity")a:CheckBox("#WireSensorTool_velocity_normalized","wire_sensor_velocity_normalized")end
--addons/!lpakr_out/lua/wire/stools/trigger.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/turret.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/twoway_radio.lua:
WireToolSetup.setCategory("Input, Output/Data Transfer")WireToolSetup.open("twoway_radio","Two-way Radio","gmod_wire_twoway_radio",nil,"Two-way Radios")if CLIENT then language.Add("Tool.wire_twoway_radio.name","Two-Way Radio Tool (Wire)")language.Add("Tool.wire_twoway_radio.desc","Spawns a two-way radio for use with the wire system.")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar["model"]="models/props_lab/binderblue.mdl"WireToolSetup.SetupLinking(true,"two-way radio")function TOOL.BuildCPanel(a)WireDermaExts.ModelSelect(a,"wire_twoway_radio_model",list.Get("Wire_radio_Models"),2,true)end
--addons/!lpakr_out/lua/wire/stools/vehicle.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/laserpointer/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_a280.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,-7,0.5)SWEP.AimPos=Vector(0,-5,0.5)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-4,0)SWEP.SprintAng=Vector(-35,30,-20)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;SWEP.PrintName='A280'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.Akimbo=true;SWEP.AmmoOffset=Vector(30,-2,-5)SWEP.AmmoOffsetAng=Angle(0,-90,90)SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.SprintingEnabled=false;SWEP.NormalHoldType='duel'SWEP.RunHoldType='normal'SWEP.FireModes={'semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=2;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/weapons/synbf3/c_a280.mdl'SWEP.WorldModel='models/weapons/synbf3/w_a280.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=100;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.2;SWEP.FireSound=Sound'blaster.fire'SWEP.RecoilAngle=Angle(-1.2,0,0)SWEP.HipSpread=0.03;SWEP.AimSpread=0.015;SWEP.VelocitySensitivity=10;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.007;SWEP.SpreadCooldown=0.13;SWEP.Shots=1;SWEP.Damage=44;SWEP.DeployTime=1;SWEP.FadeCrosshairOnAim=false;SWEP.UIPosition=Vector(-5,-40,0)SWEP.UIAngle=Angle(0,90,0)SWEP.ShowHands=false
--addons/!lpakr_out/lua/weapons/sup_arm5.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(-.2,-.8,0)SWEP.AimPos=Vector(-4.695,-4,1.02)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,-3,2.5)SWEP.SprintAng=Vector(-20,20,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=true;SWEP.ZoomAmount=15;SWEP.AdjustableZoom=true;SWEP.MinZoom=1;SWEP.MaxZoom=35;SWEP.ZoomSteps=5;SWEP.ScopeOverrideMaterialIndex=0;SWEP.ScopeFOV=10;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=false;SWEP.ScopedBlur=false;SWEP.PrintName='Westar-M5R'SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(25,-2,-2.5)SWEP.SkinSlotId=1;SWEP.CanPenetrate=false;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto','semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supwestarm5.mdl'SWEP.WorldModel='models/weapons/w_alphablaster.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=50;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.19;SWEP.FireSound=Sound'westarm5.fire'SWEP.RecoilAngle=Angle(-1.4,0,0)SWEP.HipSpread=.02;SWEP.AimSpread=.002;SWEP.VelocitySensitivity=0;SWEP.MaxSpreadInc=0;SWEP.SpreadPerShot=0;SWEP.SpreadCooldown=0;SWEP.Shots=1;SWEP.Damage=60;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.BulletDiameter=0;SWEP.CaseLength=0;SWEP.HasScope=true;SWEP.FadeCrosshairOnAim=true;SWEP.PreventQuickScoping=true;SWEP.UIPosition=Vector(0,-50,0)SWEP.UIAngle=Angle(0,90,0)
--addons/!lpakr_out/lua/weapons/sup_chaingun.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(0,0,0)SWEP.AimPos=Vector(0,0,0)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,0,0)SWEP.SprintAng=Vector(-40,0,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.Tracer=1;SWEP.TracerName='sup_laser_blue'SWEP.PrintName='Chaingun'SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(18,-4,-4)SWEP.SpeedDec=60;SWEP.PlayBackRate=1;SWEP.PlayBackRateSV=1;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='rpg'SWEP.RunHoldType='rpg'SWEP.NPCNormalHoldType='rpg'SWEP.StartSafety=false;SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/v_chaingun.mdl'SWEP.WorldModel='models/galactic/weapons/wmodels/w_chaingun.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=175;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.085;SWEP.FireSound=Sound'blaster.z6_fire'SWEP.ReloadSound=Sound'blaster.reload_pistol'SWEP.HipSpread=5;SWEP.AimSpread=5;SWEP.VelocitySensitivity=25;SWEP.MaxSpreadInc=0.1;SWEP.SpreadPerShot=0.01;SWEP.SpreadCooldown=0.05;SWEP.Shots=1;SWEP.Damage=45;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.NPCMinShots=15;SWEP.NPCMaxShots=50;SWEP.NPCRestTimeMin=5;SWEP.NPCRestTimeMax=10;SWEP.NPCSpread=2;SWEP.ShotCooldown=.5;SWEP.SprintingEnabled=false;SWEP.ReloadWait=5;SWEP.UIPosition=Vector(10,-20,-20)SWEP.UIAngle=Angle(70,50,0)SWEP.RecoilOnAim=1;SWEP.Recoil=Angle(2,0,0)SWEP.RecoilAngleSpread=Angle(.2,.2,.2)SWEP.RecoilCrouchAngleSpread=Angle(0,0,0)SWEP.RecoilCrouchAngle=Angle(0,0,0)SWEP.HipDivCrouchRecoil=Vector(.0125,.0125,.0125)SWEP.SpreadOnAim=true
--addons/!lpakr_out/lua/weapons/sup_cr2_jay.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dc17_dual.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_ford.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,0,-0.5)SWEP.AimPos=Vector(0,1,0.5)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,-15,-10)SWEP.SprintAng=Vector(35,0,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='DC-15s Duals'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='duel'SWEP.RunHoldType='normal'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/tobester/weapons/v_ford_blaster.mdl'SWEP.WorldModel='models/tobester/weapons/w_ford_blaster.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=75;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.085;SWEP.FireSound=Sound'blaster.fire_smg'SWEP.ReloadSound=Sound'blaster.reload_smg'SWEP.Recoil=.4;SWEP.RecoilAngle=Angle(-1.3,-.2,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.03;SWEP.AimSpread=.02;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=33;SWEP.DeployTime=0;SWEP.ShowHands=true;SWEP.FadeCrosshairOnAim=true;SWEP.FireDistance=15000;SWEP.FireDistanceDegrade=5000;SWEP.FireDistanceDegradeMulti=2;SWEP.Akimbo=true;SWEP.AmmoOffset=Vector(20,-3,-2)SWEP.AmmoOffsetAng=Angle(-20,-90,90)SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'
--addons/!lpakr_out/lua/weapons/sup_grenade_flash.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_grenade_frag.lua:
AddCSLuaFile()SWEP.Base='weapon_grenadebase'SWEP.PrintName='Frag Grenade'SWEP.Author='Scott'SWEP.Purpose='It\'s a Frag grenade'SWEP.Spawnable=true;SWEP.Category='SUP Weapons'SWEP.GrenadeEnt='rp_grenade_frag'SWEP.HoldType='grenade'SWEP.WorldMaterial='models/weapons/v_models/grenades/virus_grenade'SWEP.ViewMaterial='models/weapons/v_models/grenades/virus_grenade'SWEP.Impact=false;SWEP.Range=250;SWEP.Damage=400
--addons/!lpakr_out/lua/weapons/sup_grenade_shield.lua:
AddCSLuaFile()SWEP.Base='weapon_grenadebase'SWEP.PrintName='Shield Grenade'SWEP.Author='Scott'SWEP.Purpose='It\'s a shield grenade'SWEP.Category='SUP Weapons'SWEP.Spawnable=true;SWEP.HoldType='grenade'SWEP.GrenadeEnt='rp_grenade_shield'SWEP.WorldMaterial='models/weapons/v_models/grenades/virus_grenade'SWEP.ViewMaterial='models/weapons/v_models/grenades/virus_grenade'SWEP.Cooldown=90
--addons/!lpakr_out/lua/weapons/sup_repat.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_storyz.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,0,-0.5)SWEP.AimPos=Vector(-3.75,1,0.5)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(5,0,-4)SWEP.SprintAng=Vector(-15,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='Subaru'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc15s.mdl'SWEP.WorldModel='models/galactic/weapons/wmodels/supdc15sworld.mdl'SWEP.AmmoOffset=Vector(20,0,-4)SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=60;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.14;SWEP.FireSound=Sound'blaster.fire_smg'SWEP.ReloadSound=Sound'blaster.reload_smg'SWEP.Recoil=.4;SWEP.RecoilAngle=Angle(-.5,0,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.03;SWEP.AimSpread=.03;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=50;SWEP.DeployTime=0;SWEP.ShowHands=true;SWEP.FadeCrosshairOnAim=false;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,90,0)SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'
--addons/!lpakr_out/lua/weapons/swb_base/sh_move.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swb_base/cl_playerbindpress.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swb_base/cl_playerbindpress.lua:
local a,b;local function c(d,e,f,g)local h=math.tan(math.rad(d/2))local i=math.tan(math.rad(e/2))local j=1-f/g;local k=h+(i-h)*j;local l=math.deg(math.atan(k))*2;return l end;local function c(d,e,f,g)local j=1-f/(g-1)return d+(e-d)*j end;local m={invprev=1,invnext=-1}function SWEP.PlayerBindPress(n,o,p)if!o||!m[o]then return end;a=n:GetActiveWeapon()if!IsValid(a)||!a.SWBWeapon||!a.dt||a.dt.State!=SWB_AIMING||!a.AdjustableZoom then return end;if!a._ZoomStep&&a.ZoomSteps then a._ZoomStep=0 end;b=CurTime()if a.ZoomWait&&b<a.ZoomWait then return end;a._ZoomStep=(a._ZoomStep+m[o])%a.ZoomSteps;a.ScopeZoomAmount=c(a.MinZoom,a.MaxZoom,a._ZoomStep,a.ZoomSteps)surface.PlaySound'weapons/zoom.wav'a.ZoomWait=b+0.15 end;hook.Add("PlayerBindPress","SWEP.PlayerBindPress (SWB)",SWEP.PlayerBindPress)
--addons/!lpakr_out/lua/weapons/weapon_drg_ar2/shared.lua:
if!DrGBase then return end;SWEP.Base="drgbase_weapon"SWEP.PrintName="AR2"SWEP.Class="weapon_drg_ar2"SWEP.Category="DrG - Half Life 2"SWEP.Author="Dragoteryx"SWEP.Contact=""SWEP.Purpose=""SWEP.Instructions=""SWEP.Spawnable=true;SWEP.AdminOnly=false;SWEP.Slot=2;SWEP.SlotPos=0;SWEP.HoldType="ar2"SWEP.ViewModelFOV=54;SWEP.ViewModelFlip=false;SWEP.ViewModelOffset=Vector(0,0,0)SWEP.ViewModelAngle=Angle(0,0,0)SWEP.UseHands=true;SWEP.ViewModel="models/weapons/c_irifle.mdl"SWEP.WorldModel="models/weapons/w_irifle.mdl"SWEP.CSMuzzleFlashes=false;SWEP.CSMuzzleX=false;SWEP.Primary.Damage=10;SWEP.Primary.Bullets=1;SWEP.Primary.Spread=0.02;SWEP.Primary.Automatic=true;SWEP.Primary.Delay=0.1;SWEP.Primary.Recoil=0.5;SWEP.Primary.Ammo="AR2"SWEP.Primary.Cost=1;SWEP.Primary.ClipSize=30;SWEP.Primary.DefaultClip=90;SWEP.Primary.Sound="Weapon_AR2.Single"SWEP.Primary.EmptySound="Weapon_AR2.Empty"AddCSLuaFile()DrGBase.AddWeapon(SWEP)
--addons/!lpakr_out/lua/weapons/weapon_grenadebase/cl_init.lua:
include'shared.lua'local a=Color(255,255,255,150)local b,c=8,8;function SWEP:PreDrawViewModel(d)if self.ViewMaterial then d:SetMaterial(self.ViewMaterial)end end;function SWEP:PostDrawViewModel(d)d:SetMaterial''end;function SWEP:DrawWorldModel()self:DrawModel()if self.ViewMaterial then self:SetMaterial(self.ViewMaterial)end end;function SWEP:DrawHUD()draw.RoundedBox(32,(ScrW()-b)/2,(ScrH()-c)/2,b,c,a)end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_lamit.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="King Slayer"SWEP.Class="weapon_lightsaber_dual_lamit"SWEP.DualWielded=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_dual_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_renji.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_saberpike_storyz.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David + Scott"SWEP.Category='SUP Custom Weapons'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/swtor/arsenic/lightsabers/vigorousbattlerdualsaber.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Gan'yu"SWEP.Class="weapon_lightsaber_saberpike_storyz"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=300;SWEP.SaberBurnDamage=10;SWEP.MaxForce=250;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb","Force Heal","Force Pull","Saber Throw","Force Repulse","Force Push"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=false;SWEP.NoGlow=true;SWEP.UseHilt="models/swtor/arsenic/lightsabers/vigorousbattlerdualsaber.mdl"SWEP.UseLength=50;SWEP.UseWidth=false;SWEP.UseColor=Color(255,50,255)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.DamageType=DMG_DISSOLVE;SWEP.UseOnSound='lightsaber/saber_on_kylo.wav'SWEP.UseOffSound='lightsaber/saber_off_kylo.wav'SWEP.Base='wos_adv_single_lightsaber_base'
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_sentinel_nexu.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category='SUP Custom Weapons'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/tobester/weapons/nexu/nexu_saber.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.MirrorDualWield=false;SWEP.OffsetDualWield=Vector(0,0,-4)SWEP.PrintName="Centurion Sabers"SWEP.Class="weapon_lightsaber_sentinel_nexu"SWEP.DualWielded=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound="lightsaber/saber_loop1.wav"SWEP.UseSwingSound="lightsaber/darksaber_swing.wav"SWEP.UseOnSound="lightsaber/saber_on_kylo.wav"SWEP.UseOffSound="lightsaber/saber_off_kylo.wav"SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.DamageType=DMG_DISSOLVE;SWEP.Base="wos_adv_dual_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_wos.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_revive.lua:
AddCSLuaFile()SWEP.PrintName='Medical Gloves'SWEP.Author='Scott'SWEP.DrawAmmo=false;SWEP.Category='SUP Weapons'SWEP.HoldType='pistol'SWEP.UseHands=true;SWEP.Slot=3;SWEP.SlotPos=5;SWEP.Spawnable=true;SWEP.WorldModel='models/weapons/custom/w_defib.mdl'SWEP.ViewModel='models/weapons/custom/v_defib.mdl'SWEP.Primary.Damage=0;SWEP.Primary.NumShots=0;SWEP.Primary.Cone=0;SWEP.Primary.Delay=0;SWEP.Primary.ClipSize=0;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.Primary.Ammo='none'SWEP.Primary.TakeAmmo=0;SWEP.Primary.Tracer=0;SWEP.Primary.TracerName='none'SWEP.Secondary.Ammo='none'SWEP.ViewModelFlip=false;SWEP.DrawCrosshair=false;SWEP.AnimPrefix='slam'SWEP.ViewModelFOV=50;SWEP.UIPosition=Vector(0,-50,0)SWEP.UIAngle=Angle(0,90,0)function SWEP:Initialize()self:SetHoldType(self.HoldType)end;function SWEP:PrimaryAttack()if CLIENT then return end;local a=self:GetOwner()if!IsValid(a)||!a:IsPlayer()then return end;local b=a:GetEyeTrace().Entity;if!IsValid(b)||b:GetPos():Distance(a:GetPos())>500 then return end;if IsValid(b)&&b:GetClass()=='rp_ragdoll'&&b:GetPlayer()!=pl then srp.revive.OpenMenu(a,b)self:SetNextPrimaryFire(CurTime()+5)return true end end;function SWEP:SecondaryAttack()end;function SWEP:Deploy()self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)end;function SWEP:DrawHUD(c,d)srp.weapons.DrawCrosshair(nil,nil,200,0)end
--addons/!lpakr_out/lua/weapons/weapon_snowball.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/entity_helpers.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot/misc.lua:
local a=CreateConVar("drgbase_possession_targetall","1",{FCVAR_ARCHIVE,FCVAR_NOTIFY,FCVAR_REPLICATED})function ENT:IsInRange(b,c)return self:GetHullRangeSquaredTo(b)<=(c*self:GetScale())^2 end;function ENT:GetHullRangeTo(b)if isentity(b)then b=b:NearestPoint(self:GetPos())end;return self:NearestPoint(b):Distance(b)end;function ENT:GetHullRangeSquaredTo(b)if isentity(b)then b=b:NearestPoint(self:GetPos())end;return self:NearestPoint(b):DistToSqr(b)end;function ENT:IsAttack(d)if isstring(d)then d=self:LookupSequence(d)elseif!isnumber(d)then return false end;if d==-1 then return false end;if self:GetNW2Bool("DrGBaseAnimAttack/"..tostring(d))then return true elseif string.find(string.lower(self:GetSequenceName(d)),"attack")then return true elseif string.find(self:GetSequenceActivityName(d),"ATTACK")then return true else return false end end;function ENT:EmitSlotSound(e,f,g,h,i,j,k)local l=self._DrGBaseSlotSounds[e]if l==nil||CurTime()>l then self._DrGBaseSlotSounds[e]=CurTime()+f;self:EmitSound(g,h,i,j,k)return true else return false end end;function ENT:EmitStep(h,i,j,k)if!self:OnGround()then return end;local m=util.TraceLine({start=self:GetPos(),endpos=self:GetPos()-self:GetUp()*999,filter=self})local n=self.Footsteps[m.MatType]||DrGBase.DefaultFootsteps[m.MatType]if!istable(n)||#n==0 then n=self.Footsteps[MAT_DEFAULT]end;if!istable(n)||#n==0 then return false end;return self:EmitSound(n[math.random(#n)],h,i,j,k||CHAN_BODY)end;function ENT:EmitFootstep(...)return self:EmitStep(...)end;function ENT:CalcPosDirection(b,o)local p="N"if o then local q=math.AngleDifference(self:GetAngles().y+202.5,(b-self:GetPos()):Angle().y)+180;if q>45&&q<=90 then p="NE"elseif q>90&&q<=135 then p="E"elseif q>135&&q<=180 then p="SE"elseif q>180&&q<=225 then p="S"elseif q>225&&q<=270 then p="SW"elseif q>270&&q<=315 then p="W"elseif q>315&&q<=360 then p="NW"end;return p,q else local q=math.AngleDifference(self:GetAngles().y+225,(b-self:GetPos()):Angle().y)+180;if q>90&&q<=180 then p="E"elseif q>180&&q<=270 then p="S"elseif q>270&&q<=360 then p="W"end;return p,q end end;function ENT:CalcFlinchProbability(r)local s=math.Clamp(r:GetDamage()/self:Health()*100,0,100)return math.random(100)<s end;function ENT:CalcOffset(t)return self:GetForward()*t.x+self:GetRight()*t.y+self:GetUp()*t.z end;function ENT:Height()local u,v=self:GetCollisionBounds()return math.max(u.z,v.z)end;function ENT:Length()local u,v=self:GetCollisionBounds()u.z,v.z=0,0;return u:Distance(v)end;function ENT:RandomizeBodygroup(w)self:SetBodygroup(w,math.random(0,self:GetBodygroupCount(w)-1))end;function ENT:RandomizeBodygroups()for x,y in ipairs(self:GetBodyGroups())do self:RandomizeBodygroup(y.id)end end;function ENT:OnAngleChange()end;function ENT:OnFireBullets()end;function ENT:_InitMisc()self._DrGBaseSlotSounds={}self:AddCallback("OnAngleChange",function(self,z)if self:OnAngleChange(z)then return end;if!CLIENT then self:SetAngles(Angle(0,z.y,0))end end)end;hook.Add("PhysgunDrop","DrGBaseNextbotPhysgunDrop",function(A,B)if B.IsDrGNextbot then B:Timer(0,B.SetVelocity,Vector(0,0,0))end end)hook.Add("EntityFireBullets","DrGBaseNextbotFireBullets",function(B,C)if B.IsDrGNextbot then B:OnFireBullets(C)end end)local D=FindMetaTable("Entity")local E=D.EyePos;function D:EyePos()if self.IsDrGNextbot then local u,v=self:GetCollisionBounds()local F=self:GetPos()+(u+v)/2;local G;if isstring(self.EyeBone)then G=self:LookupBone(self.EyeBone)end;if G!=nil then F=self:GetBonePosition(G)end;F=F+self:CalcOffset(self.EyeOffset)return F else return E(self)end end;local H=D.EyeAngles;function D:EyeAngles()if self.IsDrGNextbot then return self:GetAngles()+self.EyeAngle else return H(self)end end;if SERVER then else function ENT:GetRangeTo(b)if isentity(b)then b=b:GetPos()end;return self:GetPos():Distance(b)end;function ENT:GetRangeSquaredTo(b)if isentity(b)then b=b:GetPos()end;return self:GetPos():DistToSqr(b)end;function ENT:RenderOffset(I,J,K,L)if!isvector(I)then return end;J=isvector(J)&&J||self:GetPos()local t=self:CalcOffset(I)render.DrawLine(J,J+t,K,L)render.DrawWireframeSphere(J+t,2*self:GetScale(),4,4,K,L)end;local D=FindMetaTable("Entity")local M=D.__tostring;function D:__tostring()if self.IsDrGNextbot then return"NextBot ["..self:EntIndex().."]["..self:GetClass().."]"else return M(self)end end end
--addons/!lpakr_out/lua/entities/drgbase_nextbot_droidbase/movements.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/ent_draughts_board.lua:
ENT.Type='anim'ENT.Model=Model'models/weapons/w_slam.mdl'ENT.Base='ent_chess_board'ENT.Models={['board']=Model('models/props_phx/games/chess/board.mdl'),['hl2table']=Model('models/props_c17/furnituretable001a.mdl'),['dama']=Model('models/props_phx/games/chess/white_pawn.mdl'),['WhiteMan']=Model('models/props_phx/games/chess/white_dama.mdl'),['BlackMan']=Model('models/props_phx/games/chess/black_dama.mdl'),['WhiteKing']=Model('models/props_phx/games/chess/white_dama.mdl'),['BlackKing']=Model('models/props_phx/games/chess/black_dama.mdl')}if info.CWRP then ENT.Models["table"]=Model('models/props/swdecortable.mdl')ENT.BoardHeight=Vector(0,0,34)ENT.TableOffset=Vector(0,0,0)else ENT.Models["table"]=Model('models/props_c17/furnituretable001a.mdl')ENT.BoardHeight=Vector(0,0,18)ENT.TableOffset=Vector(0,0,18)end;ENT.Characters={['WhiteMan']='⛀',['BlackMan']='⛂',['WhiteKing']='⛁',['BlackKing']='⛃'}ENT.DrawDouble={['King']=true}ENT.PrintName='Draughts/Checkers'ENT.Author='my_hat_stinks'ENT.Information='A draughts (checkers) board'ENT.Category='Game boards'ENT.Game="Draughts"ENT.Spawnable=true;ENT.AdminOnly=true;ENT.StartState=Chess.CHESS_BLACKMOVE;function ENT:SetupDataTables()self:NetworkVar('Int',2,'ChessState')self:NetworkVar('Bool',0,'Playing')self:NetworkVar('Int',3,'DrawOffer')self:NetworkVar('Float',0,'WhiteWager')self:NetworkVar('Float',1,'BlackWager')self:NetworkVar('Entity',0,'WhitePlayer')self:NetworkVar('Entity',1,'BlackPlayer')self:NetworkVar('Entity',2,'TableEnt')self:NetworkVar('Float',2,'WhiteTime')self:NetworkVar('Float',3,'BlackTime')self:NetworkVar('Bool',1,'JumpMove')self:NetworkVar('Int',0,'JumpLet')self:NetworkVar('Int',1,'JumpNum')end;function ENT:Initialize()self.ChessDerived=true;self.IsDraughts=true;return self.BaseClass.Initialize(self)end;function ENT:GetManMoves(a,b,c,d)local e=false;local f=c+(d&&1||-1)local g=Chess.NumToLetter[b]+1;if f<=8&&f>=1&&g<=8&&g>=1 then local h=self:GetSquare(Chess.NumToLetter[g],f)if h then if self:SquareTeam(h)=="White"!=d then local i=f+(d&&1||-1)local j=g+1;if i<=8&&i>=1&&j<=8&&j>=1 then local h=self:GetSquare(Chess.NumToLetter[j],i)if!h then a[Chess.NumToLetter[j]][i]={"CAPTURE",Chess.NumToLetter[g],f}e=true end end end else a[Chess.NumToLetter[g]][f]=true end end;local f=c+(d&&1||-1)local g=Chess.NumToLetter[b]-1;if f<=8&&f>=1&&g<=8&&g>=1 then local h=self:GetSquare(Chess.NumToLetter[g],f)if h then if self:SquareTeam(h)=="White"!=d then local i=f+(d&&1||-1)local j=g-1;if i<=8&&i>=1&&j<=8&&j>=1 then local h=self:GetSquare(Chess.NumToLetter[j],i)if!h then a[Chess.NumToLetter[j]][i]={"CAPTURE",Chess.NumToLetter[g],f}e=true end end end else a[Chess.NumToLetter[g]][f]=true end end;return e end;function ENT:GetKingMoves(a,b,c,d)local e=self:GetManMoves(a,b,c,d)local f=c+(d&&-1||1)local g=Chess.NumToLetter[b]+1;if f<=8&&f>=1&&g<=8&&g>=1 then local h=self:GetSquare(Chess.NumToLetter[g],f)if h then if self:SquareTeam(h)=="White"!=d then local i=f+(d&&-1||1)local j=g+1;if i<=8&&i>=1&&j<=8&&j>=1 then local h=self:GetSquare(Chess.NumToLetter[j],i)if!h then a[Chess.NumToLetter[j]][i]={"CAPTURE",Chess.NumToLetter[g],f}e=true end end end else a[Chess.NumToLetter[g]][f]=true end end;local f=c+(d&&-1||1)local g=Chess.NumToLetter[b]-1;if f<=8&&f>=1&&g<=8&&g>=1 then local h=self:GetSquare(Chess.NumToLetter[g],f)if h then if self:SquareTeam(h)=="White"!=d then local i=f+(d&&-1||1)local j=g-1;if i<=8&&i>=1&&j<=8&&j>=1 then local h=self:GetSquare(Chess.NumToLetter[j],i)if!h then a[Chess.NumToLetter[j]][i]={"CAPTURE",Chess.NumToLetter[g],f}e=true end end end else a[Chess.NumToLetter[g]][f]=true end end;return e end;function ENT:GetMove(b,c,k)if!(b&&c)then return{}end;if!Chess.NumToLetter[b]then return{}end;if Chess.NumToLetter[b]<1||Chess.NumToLetter[b]>8 then return{}end;if c<1||c>8 then return{}end;local l=self:GetSquare(b,c)if!l then return{}end;local m=l.Class||IsValid(l.Ent)&&l.Ent:GetRole()if!m then return{}end;if self:GetJumpMove()&&self:GetJumpLet()!=0&&self:GetJumpNum()!=0&&(Chess.NumToLetter[b]!=self:GetJumpLet()||c!=self:GetJumpNum())then return{}end;local d=self:SquareTeam(l)=="White"local n=self:SquareMoved(l)local o=k||self:CanCapture(d)local a={["a"]={},["b"]={},["c"]={},["d"]={},["e"]={},["f"]={},["g"]={},["h"]={}}if m=="King"then self:GetKingMoves(a,b,c,d)else self:GetManMoves(a,b,c,d)end;if o then for p,q in pairs(a)do for r,s in pairs(q)do if s==true then a[p][r]=nil end end end end;return a end;function ENT:ResetBoard()self:RefreshSquares()if self.Pieces then for t,q in pairs(self.Pieces)do for t,u in pairs(q)do if IsValid(u.Ent)then u.Ent:SetGridNum(-1)u.Ent:Remove()end end end end;self.Pieces={["a"]={[1]={Team="White",Class="Man",Moved=false},[3]={Team="White",Class="Man",Moved=false},[7]={Team="Black",Class="Man",Moved=false}},["b"]={[2]={Team="White",Class="Man",Moved=false},[6]={Team="Black",Class="Man",Moved=false},[8]={Team="Black",Class="Man",Moved=false}},["c"]={[1]={Team="White",Class="Man",Moved=false},[3]={Team="White",Class="Man",Moved=false},[7]={Team="Black",Class="Man",Moved=false}},["d"]={[2]={Team="White",Class="Man",Moved=false},[6]={Team="Black",Class="Man",Moved=false},[8]={Team="Black",Class="Man",Moved=false}},["e"]={[1]={Team="White",Class="Man",Moved=false},[3]={Team="White",Class="Man",Moved=false},[7]={Team="Black",Class="Man",Moved=false}},["f"]={[2]={Team="White",Class="Man",Moved=false},[6]={Team="Black",Class="Man",Moved=false},[8]={Team="Black",Class="Man",Moved=false}},["g"]={[1]={Team="White",Class="Man",Moved=false},[3]={Team="White",Class="Man",Moved=false},[7]={Team="Black",Class="Man",Moved=false}},["h"]={[2]={Team="White",Class="Man",Moved=false},[6]={Team="Black",Class="Man",Moved=false},[8]={Team="Black",Class="Man",Moved=false}},[Chess.CHESS_WCAP1]={},[Chess.CHESS_WCAP2]={},[Chess.CHESS_BCAP1]={},[Chess.CHESS_BCAP2]={}}self:Update()end;function ENT:CanCapture(v)for w,x in pairs(self.Pieces)do for y,l in pairs(x)do if l.Team==(v&&'White'||'Black')then local z=self:GetMove(w,y,true)for t,x in pairs(z)do for t,A in pairs(x)do if type(A)=='table'&&A[1]=='CAPTURE'then return true end end end end end end;return false end;function ENT:CanMove(v)for w,x in pairs(self.Pieces)do for y,l in pairs(x)do if l.Team==(v&&'White'||'Black')then local z=self:GetMove(w,y)for t,x in pairs(z)do for t,A in pairs(x)do if A then return true end end end end end end;return false end;function ENT:NoMaterialCheck()local B={}local C={}for b,q in pairs(self.Pieces)do if b==Chess.CHESS_WCAP1||b==Chess.CHESS_WCAP2||b==Chess.CHESS_BCAP1||b==Chess.CHESS_BCAP2 then continue end;for c,l in pairs(q)do if l then local d=self:SquareTeam(l)=='White'if d then table.insert(C,{Square=l,Class=Class,GridLet=b,GridNum=c})else table.insert(B,{square=l,Class=Class,GridLet=b,GridNum=c})end end end end;if#B+#C==0 then self:EndGame()return false end;if#C==0 then self:EndGame'Black'return false end;if#B==0 then self:EndGame'White'return false end;return true end;function ENT:DoCapture(l,D,E)if!l then return end;local m=l.Class;local F=false;local G,H;if l.Team=='White'then for I=Chess.CHESS_BCAP1,Chess.CHESS_BCAP2 do for J=1,8 do local K=self:GetSquare(I,J)if!K then self.Pieces[I][J]={Team='White',Class=m,Moved=false}K=self.Pieces[I][J]F=true;G,H=I,J;break end end;if F then break end end else for I=Chess.CHESS_WCAP1,Chess.CHESS_WCAP2 do for J=1,8 do local K=self:GetSquare(I,J)if!K then self.Pieces[I][J]={Team='Black',Class=m,Moved=false}K=self.Pieces[I][J]F=true;G,H=I,J;break end end;if F then break end end end;return{From={D,E},To={G,H}}end;function ENT:DoMove(L,M,D,E)if CLIENT then return end;if!(L&&D&&M&&E)then return end;if L==D&&M==E then return end;local N=self:GetSquare(L,M)if!N then return end;local O=self:GetMove(L,M)if!O[D][E]then return end;local P=O[D][E]local e;if type(P)=='table'then if P[1]=='CAPTURE'then local G,H=P[2],P[3]local l=self:GetSquare(G,H)if G&&H then e=self:DoCapture(l,G,H)self.Pieces[G][H]=nil end end end;local Q=self:GetSquare(D,E)if!Q then self.Pieces[D]=self.Pieces[D]||{}self.Pieces[D][E]=self.Pieces[D][E]||{}Q=self.Pieces[D][E]end;Q.Team=N.Team;Q.Class=N.Class;Q.Moved=true;self.Pieces[L][M]=nil;local R=self:GetPlayer(Q.Team)if(E==1||E==8)&&Q.Class=='Man'then Q.Class='King'end;if type(P)=='table'&&P[1]=='CAPTURE'then self:SetJumpMove(false)if self:CanCapture(Q.Team=='White')then local S=self:GetMove(D,E)local T=false;for t,x in pairs(S)do for t,A in pairs(x)do if A&&A!=true then T=true end end end;if T then self:SetJumpMove(true)self:SetJumpLet(Chess.NumToLetter[D])self:SetJumpNum(E)else self:SetChessState(Q.Team=='White'&&Chess.CHESS_BLACKMOVE||Chess.CHESS_WHITEMOVE)self:SetJumpMove(false)self:SetJumpLet(0)self:SetJumpNum(0)end else self:SetChessState(Q.Team=='White'&&Chess.CHESS_BLACKMOVE||Chess.CHESS_WHITEMOVE)self:SetJumpMove(false)self:SetJumpLet(0)self:SetJumpNum(0)end else self:SetChessState(Q.Team=='White'&&Chess.CHESS_BLACKMOVE||Chess.CHESS_WHITEMOVE)self:SetJumpMove(false)self:SetJumpLet(0)self:SetJumpNum(0)end;local A={From={L,M},To={D,E}}self:Update(A,e)self:NoMaterialCheck()if self:GetChessState()==Chess.CHESS_BLACKMOVE&&!self:CanMove(false)then self:EndGame'White'end;if self:GetChessState()==Chess.CHESS_WHITEMOVE&&!self:CanMove(true)then self:EndGame'Black'end;return A end
--addons/!lpakr_out/lua/entities/ent_lightsaber_thrown.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="base_anim"ENT.PrintName="Lightsaber"ENT.Category="Robotboy655's Entities"ENT.Editable=true;ENT.Spawnable=false;ENT.RenderGroup=RENDERGROUP_TRANSLUCENT;ENT.Blade=wOS.GetBlade'default'ENT.WepDamageBoost=0;function ENT:SetupDataTables()self:NetworkVar("Float",0,"BladeLength")self:NetworkVar("Float",1,"BladeWidth",{KeyName="BladeWidth",Edit={type="Float",category="Blade",min=2,max=4,order=1}})self:NetworkVar("Float",2,"MaxLength",{KeyName="MaxLength",Edit={type="Float",category="Blade",min=32,max=64,order=2}})self:NetworkVar("Bool",0,"Enabled")self:NetworkVar("Bool",1,"DarkInner",{KeyName="DarkInner",Edit={type="Boolean",category="Blade",order=3}})self:NetworkVar("Vector",0,"CrystalColorVector",{KeyName="CrystalColorVector",Edit={type="VectorColor",category="Hilt",order=4}})self:NetworkVar("Vector",1,"EndPos")self:NetworkVar("Int",0,"Stage")self:NetworkVar("Int",1,"BladeID")self:NetworkVar("Int",2,"BladeID2")self:NetworkVarNotify('BladeID',function(a,b,c,d)self.Blade=wOS.GetBlade(d||1,true)end)self:NetworkVarNotify('BladeID2',function(a,b,c,d)self.Blade=wOS.GetBlade(d||1,true)end)self:NetworkVarNotify('CrystalColorVector',function(a,b,c,d)self.primaryCrystalColor=Color(d.x,d.y,d.z)end)end;function ENT:GetCrystalColor()if self.primaryCrystalColor then return self.primaryCrystalColor else local e=self:GetCrystalColorVector()return Color(e.x,e.y,e.z)end end;function ENT:Initialize()if SERVER then else self:SetRenderBounds(Vector(-self:GetBladeLength(),-128,-128),Vector(self:GetBladeLength(),128,128))language.Add(self.ClassName,self.PrintName)end;self:StartMotionController()end;function ENT:OnRemove()if CLIENT then rb655_SaberClean(self:EntIndex())return end;if self.SoundLoop then self.SoundLoop:Stop()self.SoundLoop=nil end;if self.SoundSwing then self.SoundSwing:Stop()self.SoundSwing=nil end;if self.SoundHit then self.SoundHit:Stop()self.SoundHit=nil end;if self:GetEnabled()then self:EmitSound(self.OffSound)end end;function ENT:GetSaberPosAng(f)f=f||1;local g=self:LookupAttachment("blade"..f)if g>0 then local h=self:GetAttachment(g)return h.Pos,h.Ang:Forward()end;return self:LocalToWorld(Vector(1,-0.58,-0.25)),-self:GetAngles():Forward()end;function ENT:Draw()if!self.Blade then return end;self:DrawModel()local i=self:GetCrystalColor()local j,k=self:GetSaberPosAng()rb655_RenderBladeExtended(self,0,i,false,0,self.Blade)if self:LookupAttachment("blade2")>0 then rb655_RenderBladeExtended(self,2,i,false,0,self.Blade2||self.Blade)end end;local l={}l.secondstoarrive=0.0001;l.dampfactor=0.9999;l.teleportdistance=0;l.maxangular=800000;l.maxangulardamp=9000;l.maxspeed=100000;l.maxspeeddamp=l.maxangulardamp;function ENT:PhysicsSimulate(m,n)local o=self:GetOwner()if!IsValid(o)then return end;m:Wake()local p=CurTime()if!self.StartTime then self.StartTime=p;self.EndTime=p+self.FlightDuration end;local e=LerpVector(math.abs((p-self.StartTime)/(self.EndTime-self.StartTime)),self:GetPos(),self:GetEndPos())l.deltatime=n;local k=(self:GetEndPos()-e):Angle()k:RotateAroundAxis(k:Up(),p*720%360)l.angle=k;if self:LookupAttachment("blade2")>0 then l.pos=e else l.pos=e+k:Forward()*40 end;m:ComputeShadowControl(l)end;if CLIENT then return end;function ENT:OnTakeDamage(q)self:TakePhysicsDamage(q)end;function ENT:Think()if!IsValid(self:GetOwner())then self:Remove()return end;if!self:GetOwner():Alive()then self:Remove()return end;local o=self:GetOwner()local r=o:GetActiveWeapon()if!IsValid(r)then self:Remove()return end;if!r.IsLightsaber then self:Remove()return end;if self.EndTime then if self.EndTime<CurTime()then o:DrawWorldModel(true)r:SetNextAttack(0.25)r:SetEnabled(true)r:SetBladeLength(self:GetBladeLength())if!(wOS.EnablewiltOSProneMod&&o:IsProne())then r:SetEnabled(true)r:SetBladeLength(self:GetBladeLength())end;self:Remove()return end end;if self:GetPos():DistToSqr(self:GetEndPos())<=(self:GetStage()==1&&75^2||10^2)then if self:GetStage()==0 then self:SetStage(1)self.EndTime=CurTime()+CurTime()-self.StartTime;self.StartTime=CurTime()else o:DrawWorldModel(true)r:SetNextAttack(0.25)if!(wOS.EnablewiltOSProneMod&&o:IsProne())then r:SetEnabled(true)r:SetBladeLength(self:GetBladeLength())end;self:Remove()return end else r:SetNextAttack(1)end;if self:GetStage()==1 then self:SetEndPos(r:GetSaberPosAng()+(r:GetSaberPosAng()-self:GetPos()):GetNormal()*20)else local s={}s.start=self:GetPos()s.endpos=s.start+(self:GetEndPos()-self:GetPos()):GetNormal()*20;s.filter={self,o}local t=util.TraceLine(s)if t.Hit&&!(IsValid(t.Entity)&&(t.Entity:IsNextBot()||t.Entity:IsNPC()||t.Entity:IsPlayer()))then self:SetStage(1)self.EndTime=CurTime()+CurTime()-self.StartTime;self.StartTime=CurTime()end end;if!self:GetEnabled()&&self:GetBladeLength()!=0 then self:SetBladeLength(math.Approach(self:GetBladeLength(),0,2))elseif self:GetEnabled()&&self:GetBladeLength()!=self:GetMaxLength()then self:SetBladeLength(math.Approach(self:GetBladeLength(),self:GetMaxLength(),8))end;if self:GetBladeLength()<=0 then if self.SoundSwing then self.SoundSwing:ChangeVolume(0,0)end;if self.SoundLoop then self.SoundLoop:ChangeVolume(0,0)end;if self.SoundHit then self.SoundHit:ChangeVolume(0,0)end;return end;local j,k=self:GetSaberPosAng()local u=self:BladeThink(j,k)if self:LookupAttachment("blade2")>0 then local v,w=self:GetSaberPosAng(2)local x=self:BladeThink(v,w)u=u||x end;if self.SoundHit then if u then self.SoundHit:ChangeVolume(math.Rand(0.1,0.5),0)else self.SoundHit:ChangeVolume(0,0)end end;if self.SoundSwing then if self.LastAng!=k then self.LastAng=self.LastAng||k;self.SoundSwing:ChangeVolume(math.Clamp(k:Distance(self.LastAng)/2,0,1),0)end;self.LastAng=k end;if self.SoundLoop then local j=j+k*self:GetBladeLength()if self.LastPos!=j then self.LastPos=self.LastPos||j;self.SoundLoop:ChangeVolume(0.1+math.Clamp(j:Distance(self.LastPos)/32,0,0.2),0)end;self.LastPos=j end;self:NextThink(CurTime())return true end;function ENT:DrawHitEffects(t,y)if self:GetBladeLength()<=0 then return end;if t.Hit then rb655_DrawHit(t.HitPos,t.HitNormal)end;if y&&y.Hit then rb655_DrawHit(y.HitPos,y.HitNormal)end end;function ENT:BladeThink(z,A)local B=self:GetBladeLength()-2;local t=util.TraceHull({start=z,endpos=z+A*B,mins=Vector(0,-5,-5),maxs=Vector(B,5,5),filter=self})if t.Hit&&!(IsValid(t.Entity)&&t.Entity==self:GetOwner())then rb655_DrawHit(t.HitPos,t.HitNormal)rb655_LS_DoThrowDamage(t,self)return t.Hit end;local C=self:GetOwner()local j,k=z,A;local t=util.TraceHull({start=j,endpos=j+k*B,filter={self,C},mins=Vector(-2,-2,-2),maxs=Vector(2,2,2)})local y=util.TraceHull({start=j+k*B,endpos=j,filter={self,C},mins=Vector(-2,-2,-2),maxs=Vector(2,2,2)})self.LastEndPos=t.endpos;if t.HitSky||t.StartSolid then t.Hit=false end;if y.HitSky||y.StartSolid then y.Hit=false end;self:DrawHitEffects(t,y)isTrace1Hit=t.Hit||y.Hit;if y.Entity==t.Entity&&IsValid(t.Entity)then y.Hit=false end;local D=t.Hit&&IsValid(t.Entity)&&t.Entity;if!IsValid(D)&&y.Hit then D=IsValid(y.Entity)&&y.Entity end;if t.Hit then rb655_LS_DoThrowDamage(t,self)end;if y.Hit then rb655_LS_DoThrowDamage(y,self)end;if self.LastEndPos then local C=self:GetOwner()local E=util.TraceHull({start=j+k*B,endpos=self.LastEndPos,filter={self,C},mins=Vector(-2,-2,-2),maxs=Vector(2,2,2)})if E.Hit&&(IsValid(E.Entity)&&(!IsValid(D)||E.Entity!=D))then rb655_LS_DoThrowDamage(E,self)D=E.Entity end;util.TraceHull({start=j,endpos=self.LastEndPos,filter={self,C},mins=Vector(-2,-2,-2),maxs=Vector(2,2,2),output=E})if E.Hit&&(IsValid(E.Entity)&&(!IsValid(D)||E.Entity!=D))then rb655_LS_DoThrowDamage(E,self)return true end end;return t.Hit||y.Hit end;function ENT:Use(F,G,H,I)if!IsValid(F)||!F:KeyPressed(IN_USE)then return end;if self:GetEnabled()then self:EmitSound(self.OffSound)else self:EmitSound(self.OnSound)end;self:SetEnabled(!self:GetEnabled())end;function ENT:SpawnFunction(o,s)if!s.Hit||!o:CheckLimit("ent_lightsabers")then return end;local J=o:GetInfo("rb655_lightsaber_model")if!file.Exists(J,"GAME")then return end;local D=ents.Create(ClassName)D:SetPos(s.HitPos+s.HitNormal*2)local k=o:EyeAngles()k.p=0;k:RotateAroundAxis(k:Right(),180)D:SetAngles(k)D:SetMaxLength(math.Clamp(o:GetInfoNum("rb655_lightsaber_bladel",42),32,64))D:SetDarkInner(o:GetInfo("rb655_lightsaber_dark")=="1")D:SetModel(J)D:SetBladeWidth(math.Clamp(o:GetInfoNum("rb655_lightsaber_bladew",2),2,4))D.LoopSound=o:GetInfo("rb655_lightsaber_humsound")D.SwingSound=o:GetInfo("rb655_lightsaber_swingsound")D.OnSound=o:GetInfo("rb655_lightsaber_onsound")D.OffSound=o:GetInfo("rb655_lightsaber_offsound")D:Spawn()D:Activate()D:GetOwner(o)D.Color=D:GetColor()local m=D:GetPhysicsObject()if IsValid(m)then m:Wake()end;if IsValid(o)then o:AddCount("ent_lightsabers",D)o:AddCleanup("ent_lightsabers",D)end;return D end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/furniture_clock.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/furniture_lamp.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gambling_machine_base/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gambling_machine_fiftyfifty/shared.lua:
ENT.Type='anim'ENT.Base='gambling_machine_base'ENT.PrintName='FiftyFifty'ENT.Spawnable=false;ENT.Category='RP Machines'ENT.DoNotDuplicate=true;function ENT:SetupDataTables()self.BaseClass.SetupDataTables(self)self:NetworkVar('Int',1,'PlayerRoll')self:NetworkVar('Int',2,'HouseRoll')end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gambling_machine_roulette/shared.lua:
ENT.Type='anim'ENT.Base='gambling_machine_base'ENT.PrintName='Roulette'ENT.Spawnable=info.Dev;ENT.Category='RP Machines'ENT.MenuBased=true;ENT.DoNotDuplicate=true;function ENT:SetupDataTables()self.BaseClass.SetupDataTables(self)self:NetworkVar('Int',1,'Roll')self:NetworkVar('Int',2,'RollOffset')self:NetworkVar('Int',3,'Bet')self:NetworkVarNotify('RollOffset',self.RollOffsetChanged)end;function ENT:RollOffsetChanged(a,b,c)self.RollOffset=0 end;function ENT:WritePlayerUse(d)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gambling_machine_spinwheel/cl_init.lua:
dash.IncludeSH'shared.lua'ENT.BackgroundColor=Color(65,31,90)local a=Material'galactic/casino/spinwheel_background.png'local b=Material'galactic/casino/spinwheel_wheel.png'local c=col.white;function ENT:DrawScreen()local d=self:GetRollOffset()+1;d=d==0&&1||d;self.RollOffset=Lerp(RealFrameTime()/1*3,self.RollOffset||0,d)d=d*self.RollOffset/d;surface.SetDrawColor(255,255,255,255)surface.SetMaterial(b)surface.DrawTexturedRectRotated(-30,-1292,1595,1003,360*d/8)surface.SetMaterial(a)surface.DrawTexturedRect(-835,-1790,1595,1003)draw.SimpleText(string.Comma(self:Getprice()),'3d2d',450,-895,c,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end
--addons/!lpakr_out/lua/entities/gmod_contr_spawner/shared.lua:
ENT.Type="anim"ENT.Base=WireLib&&"base_wire_entity"||"base_gmodentity"ENT.PrintName="Contraption Spawner"ENT.Author="TB"ENT.Contact=""ENT.Purpose=""ENT.Instructions=""ENT.Spawnable=false;ENT.AdminSpawnable=false
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gmod_light.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_gmodentity")ENT.Spawnable=false;ENT.RenderGroup=RENDERGROUP_BOTH;local a=Material("sprites/light_ignorez")local b=Model("models/MaxOfS2D/light_tubular.mdl")function ENT:SetupDataTables()self:NetworkVar("Bool",0,"On")self:NetworkVar("Bool",1,"Toggle")self:NetworkVar("Float",1,"LightSize")self:NetworkVar("Float",2,"Brightness")end;function ENT:Initialize()if CLIENT then self.PixVis=util.GetPixelVisibleHandle()end end;function ENT:Draw()BaseClass.Draw(self)end;function ENT:Think()self.BaseClass.Think(self)if CLIENT then if!self:GetOn()then return end;local c=DynamicLight(self:EntIndex())if c then local d=self:GetColor()c.Pos=self:GetPos()c.r=d.r;c.g=d.g;c.b=d.b;c.Brightness=self:GetBrightness()c.Decay=self:GetLightSize()*5;c.Size=self:GetLightSize()c.DieTime=CurTime()+1 end end end;function ENT:DrawTranslucent()BaseClass.DrawTranslucent(self)local e=self:GetAngles():Up()local f=self:GetPos()render.SetMaterial(a)local g=self:GetPos()-EyePos()local h=g:Length()g:Normalize()local i=util.PixelVisible(f,4,self.PixVis)if!i||i<0.1 then return end;if!self:GetOn()then return end;local d=self:GetColor()local j=255*i;render.DrawSprite(f-e*2,8,8,Color(255,255,255,j),i)render.DrawSprite(f-e*4,8,8,Color(255,255,255,j),i)render.DrawSprite(f-e*6,8,8,Color(255,255,255,j),i)render.DrawSprite(f-e*5,64,64,Color(d.r,d.g,d.b,64),i)end;function ENT:GetOverlayText()return self:GetPlayerName()end;function ENT:OnTakeDamage(k)self:TakePhysicsDamage(k)end;function ENT:Toggle()self:SetOn(!self:GetOn())end
--addons/!lpakr_out/lua/entities/gmod_wire_button.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Button"ENT.WireDebugName="Button"function ENT:SetupDataTables()self:NetworkVar("Bool",0,"On")end;if CLIENT then local a,b;function ENT:Initialize()self.PosePosition=0.0 end;function ENT:Think()baseclass.Get("gmod_button").UpdateLever(self)end;function ENT:Draw()self:DoNormalDraw(true,false)if LocalPlayer():GetEyeTrace().Entity==self&&EyePos():DistToSqr(self:GetPos())<512^2&&GetConVarNumber("wire_drawoutline")!=0 then if self:GetOn()then a=self;b=4+math.sin(CurTime()*20)*2 else self:DrawEntityOutline()end end;Wire_Render(self)end;local c=Color(255,100,100)hook.Add("PreDrawHalos","Wiremod_button_overlay_halos",function()if a then outline.Add(a,c,outline.MODE_BOTH)a=nil end end)return end;ENT.OutputEntID=false;ENT.EntToOutput=NULL;local d={["models/props/switch001.mdl"]={2,1},["models/props_combine/combinebutton.mdl"]={3,2},["models/props_mining/control_lever01.mdl"]={1,4},["models/props_mining/freightelevatorbutton01.mdl"]={1,2},["models/props_mining/freightelevatorbutton02.mdl"]={1,2},["models/props_mining/switch01.mdl"]={1,2},["models/bull/buttons/rocker_switch.mdl"]={1,2},["models/bull/buttons/toggle_switch.mdl"]={1,2},["models/bull/buttons/key_switch.mdl"]={1,2},["models/props_mining/switch_updown01.mdl"]={2,3}}function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self:SetUseType(SIMPLE_USE)WireLib.CreateOutputs(self,{"Out"})WireLib.CreateInputs(self,{"Set"})local e=d[self:GetModel()]if e then self:SetSequence(e[2])end end;function ENT:TriggerInput(f,g)if f=="Set"then if self.toggle then self:Switch(g!=0)self.PrevUser=nil;self.podpress=nil end end end;function ENT:Use(h,i)if!h:IsPlayer()then return end;if self.PrevUser&&self.PrevUser:IsValid()then return end;if self.OutputEntID then self.EntToOutput=h end;if self:GetOn()then if self.toggle then self:Switch(false)end;return end;if IsValid(i)&&i:GetClass()=="gmod_wire_pod"then self.podpress=true end;self:Switch(true)self.PrevUser=h end;function ENT:Think()BaseClass.Think(self)if self:GetOn()then if!self.PrevUser||!self.PrevUser:IsValid()||!self.podpress&&!self.PrevUser:KeyDown(IN_USE)||self.podpress&&!self.PrevUser:KeyDown(IN_ATTACK)then if!self.toggle then self:Switch(false)end;self.PrevUser=nil;self.podpress=nil end;self:NextThink(CurTime()+0.05)return true end end;function ENT:Setup(j,k,l,m,n)self.toggle=j;self.value_off=k;self.value_on=l;self.entityout=n;if n then WireLib.AdjustOutputs(self,{"Out (The button's main output) [NORMAL]","EntID (The entity ID of the player who pressed the button) [NORMAL]","Entity (The player who pressed the button) [ENTITY]"})Wire_TriggerOutput(self,"EntID",0)Wire_TriggerOutput(self,"Entity",nil)self.OutputEntID=true else Wire_AdjustOutputs(self,{"Out"})self.OutputEntID=false end;if j then Wire_AdjustInputs(self,{"Set"})else Wire_AdjustInputs(self,{})end;self:Switch(self:GetOn())end;function ENT:Switch(o)if!self:IsValid()then return end;self:SetOn(o)if o then self:ShowOutput(self.value_on)self.Value=self.value_on;local e=d[self:GetModel()]if e then self:SetSequence(e[1])end else self:ShowOutput(self.value_off)self.Value=self.value_off;local e=d[self:GetModel()]if e then self:SetSequence(e[2])end;if self.OutputEntID then self.EntToOutput=NULL end end;Wire_TriggerOutput(self,"Out",self.Value)if self.OutputEntID then Wire_TriggerOutput(self,"EntID",self.EntToOutput:EntIndex())Wire_TriggerOutput(self,"Entity",self.EntToOutput)end;return true end;function ENT:ShowOutput(g)self:SetOverlayText("("..self.value_off.." - "..self.value_on..") = "..g)end;duplicator.RegisterEntityClass("gmod_wire_button",WireLib.MakeWireEnt,"Data","toggle","value_off","value_on","description","entityout")
--addons/!lpakr_out/lua/entities/gmod_wire_consolescreen/shared.lua:
ENT.Type="anim"ENT.Base="base_wire_entity"ENT.PrintName="Wire Console Screen"ENT.Author=""ENT.Contact=""ENT.Purpose=""ENT.Instructions=""ENT.Spawnable=false;ENT.RenderGroup=RENDERGROUP_BOTH
--addons/!lpakr_out/lua/entities/gmod_wire_freezer.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_gate.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_gimbal.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_hoverball.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Hoverball"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WireDebugName="Hoverball"function ENT:IsOn()return self:GetNWBool("On",false)end;if CLIENT then function ENT:GetZTarget()return self:GetNWFloat("ZTarget",0)end;local a=CreateConVar("cl_drawhoverballs","1")local b=Material("sprites/light_glow02_add")function ENT:DrawTranslucent()if!a:GetBool()then return end;if self:IsOn()then local c=self:GetPos()local d=(c-LocalPlayer():EyePos()):GetNormalized()local e=Color(70,180,255,255)render.SetMaterial(b)render.DrawSprite(c-d*2,22,22,e)local f=math.Clamp(math.abs((self:GetZTarget()-c.z)*math.sin(RealTime()*20))*0.05,0,1)e.r=e.r*f;e.g=e.g*f;e.b=e.b*f;render.DrawSprite(c+d*4,48,48,e)render.DrawSprite(c+d*4,52,52,e)end end;return end;function ENT:GetZTarget()return self.ztarget end;function ENT:SetZTarget(g)self.ztarget=g;self:SetNWFloat("ZTarget",g)end;function ENT:GetZVelocity()return self.zvelocity end;function ENT:SetZVelocity(g)self.zvelocity=g*FrameTime()*5000;if g!=0 then local h=self:GetPhysicsObject()if IsValid(h)then h:Wake()end end end;function ENT:GetSpeed()return self.speed end;function ENT:SetSpeed(i)if!game.SinglePlayer()then i=math.Clamp(i,0,10)end;self.speed=i end;function ENT:SetOn(j)self:SetNWBool("On",j)end;function ENT:GetAirResistance()return self.resistance end;function ENT:SetAirResistance(k)self.resistance=k end;function ENT:GetSpeed()return self.speed end;function ENT:SetSpeed(i)self.speed=i end;function ENT:SetStrength(i)self.strength=i;local h=self:GetPhysicsObject()if h:IsValid()then h:SetMass(150*i)end end;function ENT:GetStrength()return self.strength end;function ENT:Initialize()self:PhysicsInitSphere(6,"metal_bouncy")self:StartMotionController()self:SetZVelocity(0)self:SetZTarget(self:GetPos().z)self:SetSpeed(1)self:SetStrength(1)self:SetAirResistance(1)self:SetZTarget(self:GetPos().z)self.Inputs=WireLib.CreateInputs(self,{"On","ZVelocity (If non-zero, causes the hoverball to attempt to fly up, or down if the value is negative.\nThe speed is based on the magnitude of the number multiplied by the speed configured in the context menu.)","ZTarget (Causes the hoverball to attempt to fly to the specified Z coordinate and stay there.)"})self.Outputs=WireLib.CreateOutputs(self,{"Position [VECTOR]","X","Y","Z","Distance (How far away the hoverball's Z coordinate is from its target)"})end;WireLib.AddInputAlias("A: ZVelocity","ZVelocity")WireLib.AddInputAlias("B: HoverMode","On")WireLib.AddInputAlias("C: SetZTarget","ZTarget")WireLib.AddOutputAlias("A: Zpos","Z")WireLib.AddOutputAlias("B: Xpos","X")WireLib.AddOutputAlias("C: Ypos","Y")function ENT:Setup(l,m,n,o)self:SetSpeed(l)self:SetStrength(n)self:SetAirResistance(m)if o then self:Enable()else self:Disable()end;self.starton=o end;function ENT:TriggerInput(p,q)if p=="On"then q=q!=0;if q!=self:IsOn()then if q then self:Enable()else self:Disable()end end elseif p=="ZVelocity"then self:SetZVelocity(q)elseif p=="ZTarget"then self:SetZTarget(q)end end;function ENT:Enable()self:SetOn(true)self:SetStrength(self.strength)local h=self:GetPhysicsObject()if IsValid(h)then h:EnableGravity(false)h:Wake()end end;function ENT:Disable()self:SetOn(false)local h=self:GetPhysicsObject()if IsValid(h)then h:SetMass(1)h:EnableGravity(true)end end;function ENT:Think()BaseClass.Think(self)local r=self:IsOn()&&"\nActivated"||"\nDeactivated"local s=self:GetPos()local f=self:GetZTarget()-s.z;self:SetOverlayText(string.format("Speed: %i\nResistance: %.2f\nStrength: %.2f\nDistance to ZTarget: %.2f%s",self:GetSpeed(),self:GetAirResistance(),self:GetStrength(),f,r))WireLib.TriggerOutput(self,"Position",s)WireLib.TriggerOutput(self,"X",s.x)WireLib.TriggerOutput(self,"Y",s.y)WireLib.TriggerOutput(self,"Z",s.z)WireLib.TriggerOutput(self,"Distance",f)end;function ENT:PhysicsSimulate(h,t)if self:IsOn()then local c=h:GetPos()if self:GetZVelocity()!=0 then self:SetZTarget(self:GetZTarget()+self:GetZVelocity()*t*self:GetSpeed())end;h:Wake()local u=h:GetVelocity()local f=self:GetZTarget()-c.z;local v=self:GetAirResistance()if f==0 then return end;local w=f^2;if f<0 then w=w*-1 end;w=w*t*300;local x=h:GetVelocity()local y=x.z;w=w-y*t*600*(v+1)w=math.Clamp(w,-5000,5000)local z=Vector(0,0,0)local A=Vector(0,0,0)z.z=w;if v>0 then z.y=x.y*-v;z.x=x.x*-v end;return A,z,SIM_GLOBAL_ACCELERATION else return SIM_GLOBAL_FORCE end end;function ENT:BuildDupeInfo()local B=BaseClass.BuildDupeInfo(self)||{}B.OnState=self:IsOn()&&1||0;return B end;function ENT:ApplyDupeInfo(C,D,B,E)BaseClass.ApplyDupeInfo(self,C,D,B,E)if B&&B.OnState&&B.OnState==1 then self:Enable()end end;function ENT:OnRestore()self.ZVelocity=0;BaseClass.OnRestore(self)end;duplicator.RegisterEntityClass("gmod_wire_hoverball",WireLib.MakeWireEnt,"Data","speed","resistance","strength","starton")
--addons/!lpakr_out/lua/entities/gmod_wire_input.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Numpad Input"ENT.WireDebugName="Numpad Input"if CLIENT then return end;local a={"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","KP_INS","KP_END","KP_DOWNARROW","KP_PGDN","KP_LEFTARROW","KP_5","KP_RIGHTARROW","KP_HOME","KP_UPARROW","KP_PGUP","KP_SLASH","KP_MULTIPLY","KP_MINUS","KP_PLUS","KP_ENTER","KP_DEL","[","]","SEMICOLON","'","`",",",".","/","\\","-","=","ENTER","SPACE","BACKSPACE","TAB","CAPSLOCK","NUMLOCK","ESCAPE","SCROLLLOCK","INS","DEL","HOME","END","PGUP","PGDN","PAUSE","SHIFT","RSHIFT","ALT","RALT","CTRL","RCTRL","LWIN","RWIN","APP","UPARROW","LEFTARROW","DOWNARROW","RIGHTARROW","F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12","CAPSLOCKTOGGLE","NUMLOCKTOGGLE","SCROLLLOCKTOGGLE"}local function b(c)return a[c]||""end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.OnUpImpulse=nil;self.OnDownImpulse=nil;self.Outputs=Wire_CreateOutputs(self,{"Out"})end;function ENT:Setup(c,d,e,f)self.keygroup=c;self.toggle=d==1||d==true;self.value_off=e;self.value_on=f;self.Value=e;if self.OnUpImpulse then numpad.Remove(self.OnUpImpulse)numpad.Remove(self.OnDownImpulse)end;local g=self:GetPlayer()self.OnDownImpulse=numpad.OnDown(g,c,"WireInput_On",self,1)self.OnUpImpulse=numpad.OnUp(g,c,"WireInput_Off",self,1)self:ShowOutput(self.value_off)Wire_TriggerOutput(self,"Out",self.value_off)end;function ENT:InputActivate(h)if self.toggle then return self:Switch(!self.On,h)end;return self:Switch(true,h)end;function ENT:InputDeactivate(h)if self.toggle then return true end;return self:Switch(false,h)end;function ENT:Switch(i,h)if!self:IsValid()then return false end;self.On=i;if i then self:ShowOutput(self.value_on)self.Value=self.value_on else self:ShowOutput(self.value_off)self.Value=self.value_off end;Wire_TriggerOutput(self,"Out",self.Value)return true end;function ENT:ShowOutput(j)self:SetOverlayText("("..b(self.keygroup)..")\n("..tostring(self.value_off).." - "..tostring(self.value_on)..") = "..tostring(j))end;local function k(g,l,h)if!l:IsValid()then return false end;if!gamemode.Call("PlayerUse",g,l)then return end;return l:InputActivate(h)end;local function m(g,l,h)if!l:IsValid()then return false end;if!gamemode.Call("PlayerUse",g,l)then return end;return l:InputDeactivate(h)end;numpad.Register("WireInput_On",k)numpad.Register("WireInput_Off",m)duplicator.RegisterEntityClass("gmod_wire_input",WireLib.MakeWireEnt,"Data","keygroup","toggle","value_off","value_on")
--addons/!lpakr_out/lua/entities/gmod_wire_keyboard/remap.lua:
Wire_Keyboard_Remap={}local a={}a.normal={}a[KEY_LSHIFT]={}a[KEY_RSHIFT]=a[KEY_LSHIFT]local b=a.normal;b[KEY_NONE]=""b[KEY_0]="0"b[KEY_1]="1"b[KEY_2]="2"b[KEY_3]="3"b[KEY_4]="4"b[KEY_5]="5"b[KEY_6]="6"b[KEY_7]="7"b[KEY_8]="8"b[KEY_9]="9"b[KEY_A]="a"b[KEY_B]="b"b[KEY_C]="c"b[KEY_D]="d"b[KEY_E]="e"b[KEY_F]="f"b[KEY_G]="g"b[KEY_H]="h"b[KEY_I]="i"b[KEY_J]="j"b[KEY_K]="k"b[KEY_L]="l"b[KEY_M]="m"b[KEY_N]="n"b[KEY_O]="o"b[KEY_P]="p"b[KEY_Q]="q"b[KEY_R]="r"b[KEY_S]="s"b[KEY_T]="t"b[KEY_U]="u"b[KEY_V]="v"b[KEY_W]="w"b[KEY_X]="x"b[KEY_Y]="y"b[KEY_Z]="z"b[KEY_PAD_0]=128;b[KEY_PAD_1]=129;b[KEY_PAD_2]=130;b[KEY_PAD_3]=131;b[KEY_PAD_4]=132;b[KEY_PAD_5]=133;b[KEY_PAD_6]=134;b[KEY_PAD_7]=135;b[KEY_PAD_8]=136;b[KEY_PAD_9]=137;b[KEY_PAD_DIVIDE]=138;b[KEY_PAD_MULTIPLY]=139;b[KEY_PAD_MINUS]=140;b[KEY_PAD_PLUS]=141;b[KEY_PAD_ENTER]=142;b[KEY_PAD_DECIMAL]=143;b[KEY_ENTER]=10;b[KEY_SPACE]=" "b[KEY_BACKSPACE]=127;b[KEY_TAB]=9;b[KEY_CAPSLOCK]=144;b[KEY_NUMLOCK]=145;b[KEY_SCROLLLOCK]=146;b[KEY_INSERT]=147;b[KEY_DELETE]=148;b[KEY_HOME]=149;b[KEY_END]=150;b[KEY_PAGEUP]=151;b[KEY_PAGEDOWN]=152;b[KEY_BREAK]=153;b[KEY_LSHIFT]=154;b[KEY_RSHIFT]=155;b[KEY_LALT]=156;b[KEY_RALT]=157;b[KEY_LCONTROL]=158;b[KEY_RCONTROL]=159;b[KEY_LWIN]=160;b[KEY_RWIN]=161;b[KEY_APP]=162;b[KEY_UP]=17;b[KEY_LEFT]=19;b[KEY_DOWN]=18;b[KEY_RIGHT]=20;b[KEY_F1]=163;b[KEY_F2]=164;b[KEY_F3]=165;b[KEY_F4]=166;b[KEY_F5]=167;b[KEY_F6]=168;b[KEY_F7]=169;b[KEY_F8]=170;b[KEY_F9]=171;b[KEY_F10]=172;b[KEY_F11]=173;b[KEY_F12]=174;b[KEY_CAPSLOCKTOGGLE]=175;b[KEY_NUMLOCKTOGGLE]=176;b[KEY_SCROLLLOCKTOGGLE]=177;b=a[KEY_LSHIFT]b[KEY_A]="A"b[KEY_B]="B"b[KEY_C]="C"b[KEY_D]="D"b[KEY_E]="E"b[KEY_F]="F"b[KEY_G]="G"b[KEY_H]="H"b[KEY_I]="I"b[KEY_J]="J"b[KEY_K]="K"b[KEY_L]="L"b[KEY_M]="M"b[KEY_N]="N"b[KEY_O]="O"b[KEY_P]="P"b[KEY_Q]="Q"b[KEY_R]="R"b[KEY_S]="S"b[KEY_T]="T"b[KEY_U]="U"b[KEY_V]="V"b[KEY_W]="W"b[KEY_X]="X"b[KEY_Y]="Y"b[KEY_Z]="Z"Wire_Keyboard_Remap.American={}Wire_Keyboard_Remap.American=table.Copy(a)Wire_Keyboard_Remap.American[KEY_RSHIFT]=Wire_Keyboard_Remap.American[KEY_LSHIFT]b=Wire_Keyboard_Remap.American.normal;b[KEY_LBRACKET]="["b[KEY_RBRACKET]="]"b[KEY_SEMICOLON]=";"b[KEY_APOSTROPHE]="'"b[KEY_BACKQUOTE]="`"b[KEY_COMMA]=","b[KEY_PERIOD]="."b[KEY_SLASH]="/"b[KEY_BACKSLASH]="\\"b[KEY_MINUS]="-"b[KEY_EQUAL]="="b=Wire_Keyboard_Remap.American[KEY_LSHIFT]b[KEY_0]=")"b[KEY_1]="!"b[KEY_2]="@"b[KEY_3]="#"b[KEY_4]="$"b[KEY_5]="%"b[KEY_6]="^"b[KEY_7]="&"b[KEY_8]="*"b[KEY_9]="("b[KEY_LBRACKET]="{"b[KEY_RBRACKET]="}"b[KEY_SEMICOLON]=":"b[KEY_APOSTROPHE]='"'b[KEY_COMMA]="<"b[KEY_PERIOD]=">"b[KEY_SLASH]="?"b[KEY_BACKSLASH]="|"b[KEY_MINUS]="_"b[KEY_EQUAL]="+"Wire_Keyboard_Remap.British={}Wire_Keyboard_Remap.British=table.Copy(Wire_Keyboard_Remap.American)Wire_Keyboard_Remap.British[KEY_LCONTROL]={}Wire_Keyboard_Remap.British[KEY_RSHIFT]=Wire_Keyboard_Remap.British[KEY_LSHIFT]b=Wire_Keyboard_Remap.British.normal;b[KEY_BACKQUOTE]="`"b[KEY_BACKSLASH]="#"b=Wire_Keyboard_Remap.British[KEY_LSHIFT]b[KEY_2]='"'b[KEY_3]="£"b[KEY_APOSTROPHE]="@"b[KEY_BACKQUOTE]="¬"b[KEY_BACKSLASH]="~"b=Wire_Keyboard_Remap.British[KEY_LCONTROL]b[KEY_4]="€"b[KEY_A]="á"b[KEY_E]="é"b[KEY_I]="í"b[KEY_O]="ó"b[KEY_U]="ú"Wire_Keyboard_Remap.Russian={}Wire_Keyboard_Remap.Russian=table.Copy(a)Wire_Keyboard_Remap.Russian[KEY_RSHIFT]=Wire_Keyboard_Remap.Russian[KEY_LSHIFT]b=Wire_Keyboard_Remap.Russian.normal;b[KEY_LBRACKET]="х"b[KEY_RBRACKET]="ъ"b[KEY_SEMICOLON]="ж"b[KEY_APOSTROPHE]="э"b[KEY_BACKQUOTE]="ё"b[KEY_COMMA]="б"b[KEY_PERIOD]="ю"b[KEY_SLASH]="."b[KEY_BACKSLASH]="\\"b[KEY_MINUS]="-"b[KEY_EQUAL]="="b=Wire_Keyboard_Remap.Russian.normal;b[KEY_A]="ф"b[KEY_B]="и"b[KEY_C]="с"b[KEY_D]="в"b[KEY_E]="у"b[KEY_F]="а"b[KEY_G]="п"b[KEY_H]="р"b[KEY_I]="ш"b[KEY_J]="о"b[KEY_K]="л"b[KEY_L]="д"b[KEY_M]="ь"b[KEY_N]="т"b[KEY_O]="щ"b[KEY_P]="з"b[KEY_Q]="й"b[KEY_R]="к"b[KEY_S]="ы"b[KEY_T]="е"b[KEY_U]="г"b[KEY_V]="м"b[KEY_W]="ц"b[KEY_X]="ч"b[KEY_Y]="н"b[KEY_Z]="я"b=Wire_Keyboard_Remap.Russian[KEY_LSHIFT]b[KEY_A]="Ф"b[KEY_B]="И"b[KEY_C]="С"b[KEY_D]="В"b[KEY_E]="У"b[KEY_F]="А"b[KEY_G]="П"b[KEY_H]="Р"b[KEY_I]="Ш"b[KEY_J]="О"b[KEY_K]="Л"b[KEY_L]="Д"b[KEY_M]="Ь"b[KEY_N]="Т"b[KEY_O]="Щ"b[KEY_P]="З"b[KEY_Q]="Й"b[KEY_R]="К"b[KEY_S]="Ы"b[KEY_T]="Е"b[KEY_U]="Г"b[KEY_V]="М"b[KEY_W]="Ц"b[KEY_X]="Ч"b[KEY_Y]="Н"b[KEY_Z]="Я"b[KEY_1]='!'b[KEY_2]='"'b[KEY_3]="№"b[KEY_5]='%'b[KEY_4]=";"b[KEY_6]=":"b[KEY_7]="?"b[KEY_8]="*"b[KEY_9]="("b[KEY_0]=")"b[KEY_MINUS]="_"b[KEY_EQUAL]="+"b[KEY_BACKSLASH]="/"b[KEY_LBRACKET]="Х"b[KEY_RBRACKET]="Ъ"b[KEY_SEMICOLON]="Ж"b[KEY_APOSTROPHE]="Э"b[KEY_BACKQUOTE]="Ё"b[KEY_COMMA]="Б"b[KEY_PERIOD]="Ю"b[KEY_SLASH]=","Wire_Keyboard_Remap.Swedish={}Wire_Keyboard_Remap.Swedish=table.Copy(a)Wire_Keyboard_Remap.Swedish[KEY_LCONTROL]={}Wire_Keyboard_Remap.Swedish[KEY_RSHIFT]=Wire_Keyboard_Remap.Swedish[KEY_LSHIFT]b=Wire_Keyboard_Remap.Swedish.normal;b[KEY_LBRACKET]="´"b[KEY_RBRACKET]="å"b[KEY_BACKQUOTE]="¨"b[KEY_APOSTROPHE]="ä"b[KEY_SEMICOLON]="ö"b[KEY_COMMA]=","b[KEY_PERIOD]="."b[KEY_SLASH]="'"b[KEY_BACKSLASH]="§"b[KEY_MINUS]="-"b[KEY_EQUAL]="+"b=Wire_Keyboard_Remap.Swedish[KEY_LSHIFT]b[KEY_0]="="b[KEY_1]="!"b[KEY_2]='"'b[KEY_3]="#"b[KEY_4]="¤"b[KEY_5]="%"b[KEY_6]="&"b[KEY_7]="/"b[KEY_8]="("b[KEY_9]=")"b[KEY_LBRACKET]="`"b[KEY_RBRACKET]="Å"b[KEY_SEMICOLON]=214;b[KEY_BACKQUOTE]="^"b[KEY_APOSTROPHE]="Ä"b[KEY_COMMA]=";"b[KEY_PERIOD]=":"b[KEY_SLASH]="*"b[KEY_BACKSLASH]="½"b[KEY_MINUS]="_"b[KEY_EQUAL]="?"b=Wire_Keyboard_Remap.Swedish[KEY_LCONTROL]b[KEY_2]="@"b[KEY_3]="£"b[KEY_4]="$"b[KEY_7]="{"b[KEY_8]="["b[KEY_9]="]"b[KEY_0]="}"b[KEY_EQUAL]="\\"b[KEY_SEMICOLON]="~"b[KEY_E]="€"Wire_Keyboard_Remap.Norwegian={}Wire_Keyboard_Remap.Norwegian=table.Copy(Wire_Keyboard_Remap.Swedish)Wire_Keyboard_Remap.Norwegian[KEY_RSHIFT]=Wire_Keyboard_Remap.Norwegian[KEY_LSHIFT]b=Wire_Keyboard_Remap.Norwegian.normal;b[KEY_BACKQUOTE]="ø"b[KEY_APOSTROPHE]="æ"b[KEY_BACKSLASH]="|"b[KEY_LBRACKET]="\\"b=Wire_Keyboard_Remap.Norwegian[KEY_LSHIFT]b[KEY_BACKQUOTE]="Ø"b[KEY_APOSTROPHE]="Æ"b[KEY_BACKSLASH]="§"b=Wire_Keyboard_Remap.Norwegian[KEY_LCONTROL]b[KEY_EQUAL]=nil;b[KEY_M]="µ"b[KEY_LBRACKET]="´"Wire_Keyboard_Remap.German={}Wire_Keyboard_Remap.German=table.Copy(a)Wire_Keyboard_Remap.German[KEY_LCONTROL]={}Wire_Keyboard_Remap.German[KEY_RSHIFT]=Wire_Keyboard_Remap.German[KEY_LSHIFT]b=Wire_Keyboard_Remap.German.normal;b[KEY_LBRACKET]="ß"b[KEY_RBRACKET]="´"b[KEY_SEMICOLON]="ü"b[KEY_APOSTROPHE]="ä"b[KEY_BACKQUOTE]="ö"b[KEY_COMMA]=","b[KEY_PERIOD]="."b[KEY_SLASH]="#"b[KEY_BACKSLASH]="^"b[KEY_MINUS]="-"b[KEY_EQUAL]="+"b=Wire_Keyboard_Remap.German[KEY_LSHIFT]b[KEY_0]="="b[KEY_1]="!"b[KEY_2]='"'b[KEY_3]="§"b[KEY_4]="$"b[KEY_5]="%"b[KEY_6]="&"b[KEY_7]="/"b[KEY_8]="("b[KEY_9]=")"b[KEY_LBRACKET]="?"b[KEY_RBRACKET]="`"b[KEY_SEMICOLON]="Ü"b[KEY_APOSTROPHE]='Ä'b[KEY_BACKQUOTE]="Ö"b[KEY_COMMA]=";"b[KEY_PERIOD]=":"b[KEY_SLASH]="'"b[KEY_BACKSLASH]="°"b[KEY_MINUS]="_"b[KEY_EQUAL]="*"b=Wire_Keyboard_Remap.German[KEY_LCONTROL]b[KEY_0]="}"b[KEY_2]='²'b[KEY_3]="³"b[KEY_7]="{"b[KEY_8]="["b[KEY_9]="]"b[KEY_E]="€"b[KEY_M]="µ"b[KEY_Q]="@"b[KEY_LBRACKET]='\\'b[KEY_EQUAL]="~"b[KEY_COMMA]="<"b[KEY_PERIOD]=">"b[KEY_MINUS]="|"
--addons/!lpakr_out/lua/entities/gmod_wire_oscilloscope.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Oscilloscope"ENT.WireDebugName="Oscilloscope"if CLIENT then function ENT:Initialize()self.GPU=WireGPU(self)self.Nodes={}end;function ENT:OnRemove()self.GPU:Finalize()end;function ENT:GetNodeList()return self.Nodes end;function ENT:AddNode(a,b)self.Nodes[#self.Nodes+1]={X=a,Y=b}if#self.Nodes>self:GetNWFloat("Length",50)then for c=#self.Nodes,self:GetNWFloat("Length",50),-1 do table.remove(self.Nodes,1)end end end;net.Receive("wire_oscilloscope_send_node",function(d)local e=net.ReadEntity()local a=net.ReadFloat()local b=net.ReadFloat()if IsValid(e)&&e.AddNode then e:AddNode(a,b)end end)function ENT:Draw()self:DrawModel()local d=self:GetNWFloat("Length",50)local f,g,h=self:GetNWFloat("R"),self:GetNWFloat("G"),self:GetNWFloat("B")if f==0&&g==0&&h==0 then g=200 end;self.GPU:RenderToGPU(function()surface.SetDrawColor(10,20,5,255)surface.DrawRect(0,0,1024,1024)local i=self:GetNodeList()for c=1,d do local j=c+1;if!i[j]then continue end;local k=i[c].X*512+512;local l=-i[c].Y*512+512;local m=i[j].X*512+512;local n=-i[j].Y*512+512;if(k-m)*(k-m)+(l-n)*(l-n)<512*512 then local o=math.max(1,3.75-3*c/d)^1.33;local p=math.max(1,o/2)for c=-3,3 do surface.SetDrawColor(f/o,g/o,h/o,255)surface.DrawLine(k,l+c,m,n+c)surface.SetDrawColor(f/o,g/o,h/o,255)surface.DrawLine(k+c,l,m+c,n)end;surface.SetDrawColor(f/p,g/p,h/p,255)surface.DrawLine(k,l,m,n)end end;surface.SetDrawColor(30,120,10,255)surface.DrawLine(0,256,1024,256)surface.DrawLine(0,768,1024,768)surface.DrawLine(256,0,256,1024)surface.DrawLine(768,0,768,1024)surface.SetDrawColor(180,200,10,255)surface.DrawLine(0,512,1024,512)surface.DrawLine(512,0,512,1024)end)self.GPU:Render()Wire_Render(self)end;return end;local q=CreateConVar("wire_oscilloscope_maxlength",100,{FCVAR_ARCHIVE},"Maximum number of nodes")util.AddNetworkString("wire_oscilloscope_send_node")function ENT:SetNextNode(a,b)net.Start("wire_oscilloscope_send_node")net.WriteEntity(self)net.WriteFloat(a)net.WriteFloat(b)net.SendPVS(self:GetPos())end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=WireLib.CreateInputs(self,{"X","Y","R","G","B","Pause","Length","Update Frequency"})end;function ENT:Think()if self.Inputs.Pause.Value==0 then BaseClass.Think(self)local a=math.max(-1,math.min(self.Inputs.X.Value||0,1))local b=math.max(-1,math.min(self.Inputs.Y.Value||0,1))self:SetNextNode(a,b)self:NextThink(CurTime()+(self.updaterate||0.08))return true end end;function ENT:TriggerInput(r,s)if r=="R"then self:SetNWFloat("R",math.Clamp(s,0,255))elseif r=="G"then self:SetNWFloat("G",math.Clamp(s,0,255))elseif r=="B"then self:SetNWFloat("B",math.Clamp(s,0,255))elseif r=="Length"then if s==0 then s=50 end;self:SetNWFloat("Length",math.Clamp(s,1,q:GetInt()))elseif r=="Update Frequency"then if s<=0 then s=0.08 end;self.updaterate=s end end;local t={nil,nil,"R","G","B","Length","Update Frequency"}function ENT:WriteCell(u,s)u=math.floor(u)u=u+1;if u==1 then self.Inputs.X.Value=s elseif u==2 then self.Inputs.Y.Value=s elseif t[u]then self:TriggerInput(t[u],s)end end;function ENT:ReadCell(u)u=math.floor(u)u=u+1;if u==1 then return self.Inputs.X.Value elseif u==2 then return self.Inputs.Y.Value elseif u==4 then return self.updaterate elseif t[u]then return self:GetNWFloat(t[u])end;return 0 end;duplicator.RegisterEntityClass("gmod_wire_oscilloscope",WireLib.MakeWireEnt,"Data")
--addons/!lpakr_out/lua/entities/gmod_wire_rt_camera.lua:
AddCSLuaFile()ENT.Base="base_wire_entity"ENT.Type="anim"ENT.PrintName="Improved RT Camera"ENT.WireDebugName="Improved RT Camera"function ENT:Initialize()self.IsObserved=false;if CLIENT&&self:GetActive()then self:ActiveChanged(nil,nil,true)end end;function ENT:Setup(a)self:SetCamFOV(a||80)end;function ENT:SetupDataTables()self:NetworkVar("Int",0,"CamFOV")self:NetworkVar("Bool",0,"Active")if CLIENT then self:NetworkVarNotify("Active",self.ActiveChanged)end end;function ENT:TriggerInput(b,c)if b=="FOV"then self:SetCamFOV(math.Clamp(c,10,120))elseif b=="Active"then self:SetActive(c!=0)end end;if CLIENT then local d=CreateClientConVar("wire_rt_camera_resolution_h","512",true,nil,nil,128)local e=CreateClientConVar("wire_rt_camera_resolution_w","512",true,nil,nil,128)local f=CreateClientConVar("wire_rt_camera_filtering","2",true,nil,nil,0,2)local g=CreateClientConVar("wire_rt_camera_hdr","1",true,nil,nil,0,1)WireLib.__RTCameras_Active=WireLib.__RTCameras_Active||{}local h=WireLib.__RTCameras_Active;WireLib.__RTCameras_Observed=WireLib.__RTCameras_Observed||{}local i=WireLib.__RTCameras_Observed;concommand.Add("wire_rt_camera_recreate",function()for j,cam in ipairs(i)do cam:InitRTTexture()end end)local function k(l,m)if m then if!table.HasValue(h,l)then table.insert(h,l)end else if l.SetIsObserved then l:SetIsObserved(false)end;table.RemoveByValue(h,l)end end;function ENT:ActiveChanged(j,j,m)k(self,m)end;function ENT:OnRemove(n)if!n then k(self,false)end end;function ENT:SetIsObserved(o)assert(isbool(o))if o==self.IsObserved then return end;self.IsObserved=o;if o then self.ObservedCamerasIndex=table.insert(i,self)self:InitRTTexture()else self.RenderTarget=nil;local p=table.RemoveFastByValue(i,self)if p==nil then return end;self.ObservedCamerasIndex=nil;local q=i[p]if IsValid(q)then q.ObservedCamerasIndex=p end end end;local function r(s)return"improvedrtcamera_rt_"..tostring(s).."_"..f:GetString().."_"..d:GetString().."x"..e:GetString()..(g:GetInt()&&"_hdr"||"_ldr")end;function ENT:InitRTTexture()local s=self.ObservedCamerasIndex;local t=1;if f:GetInt()==1 then t=2 elseif f:GetInt()==2 then t=16 end;local u=g:GetInt()!=0;local v=GetRenderTargetEx(r(s),e:GetInt(),d:GetInt(),RT_SIZE_LITERAL,MATERIAL_RT_DEPTH_SEPARATE,t+256+32768,u&&CREATERENDERTARGETFLAGS_HDR||0,u&&IMAGE_FORMAT_RGBA16161616||IMAGE_FORMAT_RGB888)v:Download()assert(v)self.RenderTarget=v end;local w=false;hook.Add("ShouldDrawLocalPlayer","ImprovedRTCamera",function(x)if w then return true end end)hook.Add("ShouldDrawHalos","ImprovedRTCamera",function()if w then return false end end)local function y()local u=g:GetInt()!=0;local z=d:GetInt()local A=e:GetInt()local B=0;for j,C in ipairs(h)do if!IsValid(C)||!C.IsObserved then goto D end;B=B+1;render.PushRenderTarget(C.RenderTarget)local E=C:GetNoDraw()C:SetNoDraw(true)w=true;cam.Start2D()render.OverrideAlphaWriteEnable(true,true)render.RenderView({origin=C:GetPos(),angles=C:GetAngles(),x=0,y=0,h=z,w=A,drawmonitors=true,drawviewmodel=false,fov=C:GetCamFOV(),bloomtone=u})cam.End2D()w=false;C:SetNoDraw(E)render.PopRenderTarget()::D::end;return B end;local F=CreateClientConVar("wire_rt_camera_skip_frame_per_camera",0.8,true,nil,nil,0)local G=0;hook.Add("PreRender","ImprovedRTCamera",function()G=G-1;if G<=0 then local H=y()G=math.ceil(H*F:GetFloat())end end)end;duplicator.RegisterEntityClass("improvedrt_camera",WireLib.MakeWireEnt,"Data","CamFOV")duplicator.RegisterEntityClass("gmod_wire_rt_camera",WireLib.MakeWireEnt,"Data","CamFOV")
--addons/!lpakr_out/lua/entities/gmod_wire_textentry.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Text Entry (Wire)"ENT.WireDebugName="Text Entry"function ENT:SetupDataTables()self:NetworkVar("Float",0,"Hold")self:NetworkVar("Bool",0,"DisableUse")end;if CLIENT then local a;net.Receive("wire_textentry_show",function()local self=net.ReadEntity()if!IsValid(self)then return end;a=Derma_StringRequestNoBlur("Wire Text Entry","Enter text below","",function(b)net.Start("wire_textentry_action")net.WriteEntity(self)net.WriteBool(true)net.WriteString(b)net.SendToServer()end,function()net.Start("wire_textentry_action")net.WriteEntity(self)net.WriteBool(false)net.WriteString("")net.SendToServer()end,"Enter","Cancel")end)net.Receive("wire_textentry_kick",function()if IsValid(a)then a:Remove()end end)return end;function ENT:GetHoldClamped()return math.max(self:GetHold(),0)end;function ENT:GetHoldTimerName()return"wire_textentry_"..self:EntIndex()end;function ENT:RemoveHoldTimer()timer.Remove(self:GetHoldTimerName())end;function ENT:UpdateOverlay()local c=math.Round(self:GetHoldClamped(),1)local d="Hold Length: "..(c>0&&c||"Forever")if self.BlockInput then d=d.."\nBlocking Input"elseif IsValid(self.User)then d=d.."\nIn use by: "..self.User:Nick()end;if self:GetDisableUse()then d=d.."\nUse disabled"end;self:SetOverlayText(d)end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetUseType(SIMPLE_USE)self.Inputs=WireLib.CreateInputs(self,{"Block Input (When set to a non-zero value, blocks any further inputs.)","Prompt (When set to a non-zero value, opens the prompt popup for the driver of the linked vehicle.\n".."If no vehicle is linked, opens the prompt for the owner of this entity instead.)"})self.Outputs=WireLib.CreateOutputs(self,{"In Use","Text [STRING]","User [ENTITY]","Entered (Set to 1 for a bit when text is successfully entered)"})self.BlockInput=false;self.NextPrompt=0;self:UpdateOverlay()end;function ENT:TriggerInput(e,f)if e=="Block Input"then self.BlockInput=f!=0;self:UpdateOverlay()if IsValid(self.User)then self:Unprompt(true)end elseif e=="Prompt"then if f!=0 then self:Prompt()end end end;function ENT:UnlinkEnt(g)if!IsValid(g)then return false,"Invalid entity specified"end;if IsValid(self.Vehicle)then self.Vehicle:RemoveCallOnRemove("wire_textentry_onremove")self.Vehicle.WireTextEntry=nil end;self.Vehicle=nil;WireLib.SendMarks(self,{})return true end;function ENT:LinkEnt(g)if!IsValid(g)then return false,"Invalid entity specified"end;if!g:IsVehicle()then return false,"Entity must be a vehicle"end;if IsValid(self.Vehicle)then self.Vehicle:RemoveCallOnRemove("wire_textentry_onremove")self.Vehicle.WireTextEntry=nil end;self.Vehicle=g;self.Vehicle.WireTextEntry=self;self.Vehicle:CallOnRemove("wire_textentry_onremove",function()self:UnlinkEnt(g)end)WireLib.SendMarks(self,{g})return true end;function ENT:ClearEntities()self:UnlinkEnt(self.Vehicle)end;function ENT:OnRemove()if IsValid(self.Vehicle)then self.Vehicle:RemoveCallOnRemove("wire_textentry_onremove")self.Vehicle.WireTextEntry=nil end;self:RemoveHoldTimer()self:Unprompt(true)end;util.AddNetworkString("wire_textentry_action")net.Receive("wire_textentry_action",function(h,i)local self=net.ReadEntity()if!IsValid(self)||!IsValid(i)||i!=self.User then return end;local j=net.ReadBool()local b=net.ReadString()self:Unprompt()if j&&!self.BlockInput then self:OnTextEntered(b)end;self:UpdateOverlay()end)function ENT:OnTextEntered(b)WireLib.TriggerOutput(self,"Text",b)WireLib.TriggerOutput(self,"Entered",1)WireLib.TriggerOutput(self,"Entered",0)local k=self:GetHoldTimerName()timer.Remove(k)if self:GetHoldClamped()>0 then timer.Create(k,self:GetHoldClamped(),1,function()if!self:IsValid()then return end;WireLib.TriggerOutput(self,"User",nil)WireLib.TriggerOutput(self,"Text","")end)end end;util.AddNetworkString("wire_textentry_show")function ENT:Prompt(i)if i then if CurTime()<self.NextPrompt then return end;self.NextPrompt=CurTime()+0.1;if self.BlockInput||IsValid(self.User)then WireLib.AddNotify(i,"That text entry is not accepting input right now!",NOTIFY_ERROR,5,6)return end;self.User=i;WireLib.TriggerOutput(self,"User",i)WireLib.TriggerOutput(self,"In Use",1)self:RemoveHoldTimer()net.Start("wire_textentry_show")net.WriteEntity(self)net.Send(i)self:UpdateOverlay()elseif IsValid(self.Vehicle)&&IsValid(self.Vehicle:GetDriver())then self:Prompt(self.Vehicle:GetDriver())else self:Prompt(self:GetPlayer())end end;util.AddNetworkString("wire_textentry_kick")function ENT:Unprompt(l)if IsValid(self.User)&&l then net.Start("wire_textentry_kick")net.Send(self.User)end;self:RemoveHoldTimer()self.User=nil;WireLib.TriggerOutput(self,"In Use",0)self:UpdateOverlay()end;hook.Add("PlayerLeaveVehicle","wire_textentry_leave_vehicle",function(i,m)if m.WireTextEntry&&IsValid(m.WireTextEntry)&&IsValid(m.WireTextEntry.User)&&m.WireTextEntry.User==i then m.WireTextEntry:Unprompt(true)end end)function ENT:Use(i)if self:GetDisableUse()||!IsValid(i)then return end;self:Prompt(i)end;function ENT:Setup(c,n)c=tonumber(c)if c then self:SetHold(math.max(c,0))end;n=tobool(n)if n!=nil then self:SetDisableUse(n)end;self:UpdateOverlay()end;duplicator.RegisterEntityClass("gmod_wire_textentry",WireLib.MakeWireEnt,"Data")
--addons/!lpakr_out/lua/entities/gmod_wire_textreceiver.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Text Receiver"ENT.WireDebugName="Text Receiver"if CLIENT then return end;local a={}local function b(c)a[c]=true end;local function d(c)a[c]=nil end;hook.Add("PlayerSay","Wire Text receiver PlayerSay",function(e,f)for c,g in pairs(a)do if!c||!c:IsValid()then d(c)else c:PlayerSpoke(e,f)end end end)function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)b(self)self.Outputs=WireLib.CreateOutputs(self,{"Message [STRING]","Player [ENTITY]","Clk (Will output 1 for a single tick after both 'Message' and 'Player' have been updated.)"})self.UseLuaPatterns=false;self.CaseInsensitive=true;self.Matches={}end;function ENT:Setup(h,i,j)local k={"Message","Player","Clk (Will output 1 for a single tick after both 'Message' and 'Player' have been updated.)"}local l={"STRING","ENTITY","NORMAL"}if h then k[#k+1]="PatternError (If there are any errors in your Lua patterns, this string will contain a list of each error message.)"l[#l+1]="STRING"end;if#i>0 then local f="Matches:"for m=1,#i do k[#k+1]="Match "..m;l[#l+1]="NORMAL"f=f.."\n"..i[m]if h then k[#k+1]="Matches "..m;l[#l+1]="ARRAY"end end;self:SetOverlayText(f)end;self.Outputs=WireLib.AdjustSpecialOutputs(self,k,l)self:PlayerSpoke(nil,"")self.UseLuaPatterns=h;self.Matches=i;self.CaseInsensitive=j end;function ENT:OnRemove()d(self)end;local n=string.find;local o=string.lower;local p=string.match;function ENT:PcallFind(q,r)if self.UseLuaPatterns then local s,t=pcall(function()WireLib.CheckRegex(q,r)end)if!s then self.PatternError=t;return false end end;local s,u=pcall(n,q,r,1,!self.UseLuaPatterns)if s==true then return u!=nil else return false end end;function ENT:AddError(t,v)self.PatternError=self.PatternError..t.." at match nr "..v.."\n"end;function ENT:PcallMatch(q,r,v)local s,t=pcall(function()WireLib.CheckRegex(q,r)end)if!s then self:AddError(t,v)return{}end;local u={pcall(p,q,r)}if u[1]==true then table.remove(u,1)return u else self:AddError(u[2],v)return{}end end;function ENT:PlayerSpoke(e,q)WireLib.TriggerOutput(self,"Message",q)WireLib.TriggerOutput(self,"Player",e)WireLib.TriggerOutput(self,"Clk",1)timer.Simple(0,function()if self&&self:IsValid()then WireLib.TriggerOutput(self,"Clk",0)end end)if self.CaseInsensitive then q=o(q)end;if self.UseLuaPatterns then self.PatternError=""WireLib.TriggerOutput(self,"PatternError",self.PatternError)end;for m=1,#self.Matches do local r=self.Matches[m]if self.CaseInsensitive then r=o(r)end;if self:PcallFind(q,r)then WireLib.TriggerOutput(self,"Match "..m,1)else WireLib.TriggerOutput(self,"Match "..m,0)end;if self.UseLuaPatterns then WireLib.TriggerOutput(self,"Matches "..m,self:PcallMatch(q,r,m))end end;if self.UseLuaPatterns then WireLib.TriggerOutput(self,"PatternError",string.sub(self.PatternError,1,-2))end end;duplicator.RegisterEntityClass("gmod_wire_textreceiver",WireLib.MakeWireEnt,"Data","UseLuaPatterns","Matches","CaseInsensitive")
--addons/!lpakr_out/lua/entities/gmod_wire_vehicle.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Vehicle Controller"ENT.WireDebugName="Vehicle Controller"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=Wire_CreateInputs(self,{"Throttle","Steering","Handbrake","Engine","Lock","Vehicle [ENTITY]"})self.Outputs=Wire_CreateOutputs(self,{"Vehicle [ENTITY]"})end;function ENT:LinkEnt(a)a=WireLib.GetClosestRealVehicle(a,self:GetPos(),self:GetPlayer())if!IsValid(a)||!a:IsVehicle()then return false,"Must link to a vehicle"end;if!WireLib.CanTool(self:GetPlayer(),a,"wire_vehicle")then return false,"You do not have permission to access this vehicle"end;self.Vehicle=a;WireLib.SendMarks(self,{a})WireLib.TriggerOutput(self,"Vehicle",a)return true end;function ENT:UnlinkEnt()self.Vehicle=nil;WireLib.SendMarks(self,{})WireLib.TriggerOutput(self,"Vehicle",NULL)return true end;function ENT:TriggerInput(b,c)if b=="Throttle"then self.Throttle=c elseif b=="Steering"then self.Steering=c elseif b=="Vehicle"then self:LinkEnt(c)elseif!IsValid(self.Vehicle)then return elseif b=="Handbrake"then self.Vehicle:Fire("handbrake"..(c!=0&&"on"||"off"),1,0)elseif b=="Engine"then self.Vehicle:Fire("turn"..(c!=0&&"on"||"off"),1,0)if c!=0 then self.Vehicle:Fire("handbrakeoff",1,0)end elseif b=="Lock"then self.Vehicle:Fire((c!=0&&""||"un").."lock",1,0)end end;function ENT:Think()if IsValid(self.Vehicle)then local d=CurTime()%1/1000;if self.Steering then self.Vehicle:Fire("steer",self.Steering+d,0)end;if self.Throttle then self.Vehicle:Fire("throttle",self.Throttle+d,0)end end;self:NextThink(CurTime())return true end;function ENT:BuildDupeInfo()local e=BaseClass.BuildDupeInfo(self)||{}if self.Vehicle&&self.Vehicle:IsValid()then e.Vehicle=self.Vehicle:EntIndex()end;return e end;function ENT:ApplyDupeInfo(f,g,e,h)BaseClass.ApplyDupeInfo(self,f,g,e,h)self.Vehicle=h(e.Vehicle)end;duplicator.RegisterEntityClass("gmod_wire_vehicle",WireLib.MakeWireEnt,"Data")
--addons/ssrp_lfs/lua/entities/lvs_base_fakehover/cl_camera.lua:

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	return pos, angles, fov
end

function ENT:CalcViewDriver( ply, pos, angles, fov, pod )
	local view = {}
	view.origin = pos
	view.fov = fov
	view.drawviewer = true
	view.angles = ply:EyeAngles()

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
--addons/ssrp_lfs/lua/entities/lvs_base_starfighter/cl_init.lua:
include("shared.lua")
include("cl_camera.lua")
include("sh_camera_eyetrace.lua")
include("cl_hud.lua")
include("cl_flyby.lua")
include("cl_deathsound.lua")

ENT.TrailAlpha = 25

DEFINE_BASECLASS( "lvs_base" )

function ENT:Think()
	BaseClass.Think( self )

	self.EFxScale = self.EFxScale and (self.EFxScale - self.EFxScale * RealFrameTime()) or 0

	self:CalcOnThrottle()
end

function ENT:CalcOnThrottle()
	if not self:GetEngineActive() then 
		self._oldOnTHR = nil

		return
	end

	local Throttle = self:GetThrottle()

	if self._oldOnTHR ~= Throttle then
		if self._oldOnTHR == 0 and Throttle > 0 then
			self._IsAccelerating = true
		end

		if Throttle > (self._oldOnTHR or 0) then
			self._IsAccelerating = true
		else
			self._IsAccelerating = false
		end

		if self._oldOnTHR == 1 then
			self:StopBoost()
		end

		self._oldOnTHR = Throttle
	end

	if self._oldAccelerating ~= self._IsAccelerating then
		self._oldAccelerating = self._IsAccelerating

		if not self._IsAccelerating then return end

		self:StartBoost()
	end
end

function ENT:StartBoost()
	local T = CurTime()

	if (self._NextSND or 0) > T then return end

	self._NextSND = T + 1

	self.EFxScale = 100

	self:OnStartBoost()
end

function ENT:StopBoost()
	local T = CurTime()

	if (self._NextSND or 0) > T then return end

	self._NextSND = T + 1

	self:OnStopBoost()
end

function ENT:GetBoost()
	return (self.EFxScale or 0)
end

function ENT:OnStartBoost()
end

function ENT:OnStopBoost()
end
--addons/ssrp_lfs/lua/entities/lvs_escapepod/cl_init.lua:
include("shared.lua")

ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EngineFXColor = Color( 255, 240, 150)
ENT.EngineFxPos = {
	Vector( -144.79, 54.55, 62.55 ),
	Vector( -144.79, 54.55, -46 ),
	Vector( -144.79, -54.55, 62.55 ),
	Vector( -144.79, -54.55, -46 )
}

function ENT:OnSpawn()
	for _, pos in ipairs(self.EngineFxPos) do
		self:RegisterTrail( pos, 0, 20, 2, 1000, 150 )
	end
end

function ENT:OnFrame()
end

function ENT:PostDraw()
end

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 30 + self:GetThrottle() * 15 + self:GetBoost() * 0.4

	render.SetMaterial( self.EngineGlow )

	for _, v in pairs( self.EngineFxPos ) do
		local pos = self:LocalToWorld( v )
		render.DrawSprite( pos, Size, Size, self.EngineFXColor )
	end
end

function ENT:OnStartBoost()
	self:EmitSound( "lvs/vehicles/vulturedroid/boost.wav", 85 )
end

function ENT:OnStopBoost()
	self:EmitSound( "lvs/vehicles/vulturedroid/brake.wav", 85 )
end

--addons/ssrp_lfs/lua/entities/lvs_fakehover_aat/cl_prediction.lua:

function ENT:PredictPoseParamaters()
	local pod = self:GetGunnerSeat()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if ply ~= plyL then return end

	self:SetPoseParameterTurret( pod:lvsGetWeapon() )

	self:InvalidateBoneCache()
end
--addons/ssrp_lfs/lua/entities/lvs_fakehover_soundemitter.lua:
AddCSLuaFile()

ENT.Base = "lvs_starfighter_soundemitter"

if SERVER then return end

function ENT:HandleEngineSounds( vehicle )
	local ply = LocalPlayer()
	local pod = ply:GetVehicle()
	local Throttle = vehicle:GetThrottle()
	local Doppler = vehicle:CalcDoppler( ply )

	local DrivingMe = ply:lvsGetVehicle() == vehicle

	local VolumeSetNow = false

	local FirstPerson = false
	if IsValid( pod ) then
		local ThirdPerson = pod:GetThirdPersonMode()

		if ThirdPerson ~= self._lvsoldTP then
			self._lvsoldTP = ThirdPerson
			VolumeSetNow = DrivingMe
		end

		FirstPerson = DrivingMe and not ThirdPerson
	end

	if DrivingMe ~= self._lvsoldDrivingMe then
		VolumeSetNow = true
		self._lvsoldDrivingMe = DrivingMe
	end

	for id, sound in pairs( self._ActiveSounds ) do
		if not sound then continue end

		local data = self.EngineSounds[ id ]

		local Pitch = math.Clamp( data.Pitch + Throttle * data.PitchMul, data.PitchMin, data.PitchMax )
		local PitchMul = data.UseDoppler and Doppler or 1

		local InActive = Throttle > data.FadeOut or Throttle < data.FadeIn
		if data.FadeOut >= 1 and Throttle > 1 then
			InActive = false
		end

		local Volume = InActive and 0 or LVS:GetVolume()

		if data.VolumeMin and data.VolumeMax and not InActive then
			Volume = math.max(Throttle - data.VolumeMin,0) / (1 - data.VolumeMin) * data.VolumeMax * LVS:GetVolume()
		end

		if istable( sound ) then
			sound.ext:ChangePitch( math.Clamp( Pitch * PitchMul, 0, 255 ), 0.2 )
			if sound.int then sound.int:ChangePitch( math.Clamp( Pitch, 0, 255 ), 0.2 ) end

			local fadespeed = VolumeSetNow and 0 or data.FadeSpeed

			if FirstPerson then
				sound.ext:ChangeVolume( 0, 0 )
				if sound.int then sound.int:ChangeVolume( Volume, fadespeed ) end
			else
				sound.ext:ChangeVolume( Volume, fadespeed )
				if sound.int then sound.int:ChangeVolume( 0, 0 ) end
			end
		else
			sound:ChangePitch( math.Clamp( Pitch * PitchMul, 0, 255 ), 0.2 )
			sound:ChangeVolume( Volume, data.FadeSpeed )
		end
	end
end

--addons/ssrp_lfs/lua/entities/lvs_nushuttle/cl_init.lua:
include("shared.lua")

ENT.EngineColor = Color( 25, 200, 255, 255)
ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EnginePos = {
	Vector(-450,35.5,180),
	Vector(-450,35.5,250),
	Vector(-450,-35.5,250),
	Vector(-450,-35.5,180),
	Vector(-490,-124,180),
	Vector(-490,124,180),
	Vector(-490,160,160),
	Vector(-490,-160,160),
	Vector(-490,206,140),
	Vector(-490,-206,140),
}

function ENT:OnSpawn()
	for _, pos in ipairs(self.EnginePos) do
		self:RegisterTrail( pos, 0, 20, 2, 1000, 150 )
	end
end

function ENT:OnFrame()
	self:AnimWings()
	self:AnimateDoors()
end

function ENT:AnimWings()
	self._sm_wing = self._sm_wing or 1

	local target_wing = self:GetFoils() and 0 or 1
	local RFT = RealFrameTime() * (0.5 + math.abs( math.sin( self._sm_wing * math.pi ) ) * 0.5)

	local Rate = RFT * 0.5

	self._sm_wing = self._sm_wing + math.Clamp(target_wing - self._sm_wing,-Rate,Rate)

	local DoneMoving = self._sm_wing == 1 or self._sm_wing == 0
	if self._oldDoneMoving ~= DoneMoving then
		self._oldDoneMoving = DoneMoving

		if not DoneMoving then
			self:EmitSound("lvs/vehicles/arc170/sfoils.wav")
		end
	end

	local Ang = (1 - self._sm_wing) * 116
	self:ManipulateBoneAngles( 7, Angle(0,Ang,0) )
	self:ManipulateBoneAngles( 8, Angle(0,-Ang,0) )

	local Ang = (1 - self._sm_wing) * 175
	self:ManipulateBoneAngles( 2, Angle(0, 0, -Ang) )

	self:InvalidateBoneCache()
end

function ENT:AnimateDoors()
	self._sm_door = self._sm_door or 1

	local target_wing = self:GetDoors() and 0 or 1
	local RFT = RealFrameTime() * (0.5 + math.abs( math.sin( self._sm_door * math.pi ) ) * 0.5)
	local Rate = RFT * 0.5

	self._sm_door = self._sm_door + math.Clamp(target_wing - self._sm_door,-Rate,Rate)

	local DoneMoving = self._sm_door == 1 or self._sm_door == 0
	if self._oldDoneMoving ~= DoneMoving then
		self._oldDoneMoving = DoneMoving
	end

	local Ang = (1 - self._sm_door) * 90
	self:ManipulateBoneAngles( 1, Angle(0,0,-Ang) )

	Ang = (1 - self._sm_door) * 175
	self:ManipulateBoneAngles( 2, Angle(0, 0, -Ang) )
	self:InvalidateBoneCache()
end


function ENT:OnLandingGearToggled( IsDeployed )

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
	self:EmitSound( "lvs/vehicles/arc170/boost.wav", 85 )
end

function ENT:OnStopBoost()
	self:EmitSound( "lvs/vehicles/arc170/brake.wav", 85 )
end
--addons/ssrp_lfs/lua/entities/lvs_turret_ai/shared.lua:
ENT.Base = "lvs_base_turret"

ENT.PrintName = "Anti-Infantry Turret AI"
ENT.Author = "Luna"
ENT.Information = "Infantry Problem? Rotary laser cannon says 'Not Anymore.'"
ENT.Category = "[LVS] - Turrets (Republic)"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/antiinfantryturret/Anti-InfantryTurret.mdl"

ENT.AITEAM = 1

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

ENT.MaxHealth = 3000

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
		bullet.SplashDamage	= 20
		bullet.SplashDamageRadius	= 120
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
--addons/ssrp_lfs/lua/entities/lvs_walker_atte/sh_turret.lua:

function ENT:SetPosTurret()
	local Turret = self:GetTurretSeat()

	if not IsValid( Turret ) then return end

	local ID = self:LookupAttachment( "driver_turret" )
	local Att = self:GetAttachment( ID )

	if not Att then return end

	local PosL = self:WorldToLocal( Att.Pos + Att.Ang:Right() * 20 - Att.Ang:Up() * 5 )
	Turret:SetLocalPos( PosL )
end

function ENT:SetPoseParameterTurret( weapon )
	if self:GetIsCarried() then
		self:SetPoseParameter("cannon_pitch", 0 )
		self:SetPoseParameter("cannon_yaw", 180 )

		if self.TurretWasSet then
			self.TurretWasSet = nil

			self:SetTurretPitch( 0 )
			self:SetTurretYaw( 180 )
		end

		return
	end

	self.TurretWasSet = true

	if not IsValid( weapon:GetDriver() ) and not weapon:GetAI() then return end

	local AimAng = weapon:WorldToLocal( weapon:GetPos() + weapon:GetAimVector() ):Angle()
	AimAng:Normalize()

	local AimRate = self.TurretTurnRate * FrameTime()

	self:SetTurretPitch( math.ApproachAngle( self:GetTurretPitch(), AimAng.p, AimRate ) )
	self:SetTurretYaw( math.ApproachAngle( self:GetTurretYaw(), AimAng.y, AimRate ) )

	self:SetPoseParameter("cannon_pitch", self:GetTurretPitch() )
	self:SetPoseParameter("cannon_yaw", self:GetTurretYaw() )
end

function ENT:InitTurret()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/protontorpedo.png")
	weapon.Ammo = 40
	weapon.Delay = 0.5
	weapon.HeatRateUp = 0.6
	weapon.HeatRateDown = 0.25
	weapon.OnOverheat = function( ent ) end
	weapon.Attack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if base:GetIsCarried() then ent:SetHeat( 0 ) return true end

		base:PlayAnimation( "fire_turret" )

		local ID = base:LookupAttachment( "muzzle_cannon" )
		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local Driver = ent:GetDriver()

		local projectile = ents.Create( "lvs_protontorpedo" )
		projectile:SetPos( Muzzle.Pos )
		projectile:SetAngles( Muzzle.Ang:Up():Angle() )
		projectile:SetParent( ent )
		projectile:Spawn()
		projectile:Activate()
		projectile:SetAttacker( IsValid( Driver ) and Driver or self )
		projectile:SetEntityFilter( ent:GetCrosshairFilterEnts() )
		projectile:SetSpeed( 4000 )
		projectile:Enable()

		if not IsValid( base.SNDTurret ) then return end

		base.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		base:SetPoseParameterTurret( ent )
		base:SetPosTurret()
	end
	weapon.CalcView = function( ent, ply, pos, angles, fov, pod )
		local base = ent:GetVehicle()

		local view = {}
		view.origin = pos
		view.angles = angles
		view.fov = fov
		view.drawviewer = false

		if not IsValid( base ) then return view end

		local ID = base:LookupAttachment( "driver_turret" )
		local Att = base:GetAttachment( ID )

		if Att then
			local Pos,_= LocalToWorld( Vector(0,25,110), Angle(0,0,0), Att.Pos, Att.Ang )
			view.origin = Pos
		end

		if not pod:GetThirdPersonMode() then
			return view
		end

		local mn = self:OBBMins()
		local mx = self:OBBMaxs()
		local radius = ( mn - mx ):Length()
		local radius = radius + radius * pod:GetCameraDistance()

		local clamped_angles = pod:WorldToLocalAngles( angles )
		clamped_angles.p = math.max( clamped_angles.p, -20 )
		clamped_angles = pod:LocalToWorldAngles( clamped_angles )

		local StartPos = self:LocalToWorld( Vector(95,0,280) )
		local EndPos = StartPos - clamped_angles:Forward() * radius + clamped_angles:Up() * (radius * 0.2 + radius * pod:GetCameraHeight())

		local WallOffset = 4

		local tr = util.TraceHull( {
			start = StartPos,
			endpos = EndPos,
			filter = function( e )
				local c = e:GetClass()
				local collide = not c:StartWith( "prop_physics" ) and not c:StartWith( "prop_dynamic" ) and not c:StartWith( "prop_ragdoll" ) and not e:IsVehicle() and not c:StartWith( "gmod_" ) and not c:StartWith( "lvs_" ) and not c:StartWith( "player" ) and not e.LVS

				return collide
			end,
			mins = Vector( -WallOffset, -WallOffset, -WallOffset ),
			maxs = Vector( WallOffset, WallOffset, WallOffset ),
		} )

		view.angles = angles + Angle(5,0,0)
		view.origin = tr.HitPos

		if tr.Hit and  not tr.StartSolid then
			view.origin = view.origin + tr.HitNormal * WallOffset
		end

		return view
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if base:GetIsCarried() then return end

		local ID = base:LookupAttachment( "muzzle_cannon" )
		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local dir = Muzzle.Ang:Up()
		local pos = Muzzle.Pos

		local trace = util.TraceLine( {
			start = pos,
			endpos = (pos + dir * 50000),
			filter = function( entity )
				if base:GetCrosshairFilterLookup()[ entity:EntIndex() ] or entity:GetClass():StartWith( "lvs_protontorpedo" ) then
					return false
				end

				return true
			end,
		} )

		local Pos2D = trace.HitPos:ToScreen()

		self:PaintCrosshairCenter( Pos2D )
		self:PaintCrosshairOuter( Pos2D )
		self:LVSPaintHitMarker( Pos2D )
	end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/vehicles/atte/overheat.mp3", 85) end
	self:AddWeapon( weapon, 2 )
end
--addons/ssrp_lfs/lua/entities/lvs_walker_atte/sh_gunner.lua:

function ENT:GetGunnerAimAng( ent, base, RearEnt )
	local trace = ent:GetEyeTrace()

	local Pos = RearEnt:LocalToWorld( Vector(-208,0,170) )
	local wAng = (trace.HitPos - Pos):GetNormalized():Angle()

	local _, Ang = WorldToLocal( Pos, wAng, Pos, RearEnt:LocalToWorldAngles( Angle(0,180,0) ) )

	return Ang, trace.HitPos, (Ang.p < 30 and Ang.p > -10 and math.abs( Ang.y ) < 60)
end

local white = Color(255,255,255,255)
local red = Color(255,0,0,255)

function ENT:InitGunner()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Ammo = 400
	weapon.Delay = 0.3
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.2
	weapon.OnOverheat = function( ent ) end
	weapon.Attack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if base:GetIsCarried() then base:SetHeat( 0 ) return true end

		local RearEnt = base:GetRearEntity()

		if not IsValid( RearEnt ) then return end

		local _, AimPos, InRange = base:GetGunnerAimAng( ent, base, RearEnt )

		if not InRange then return true end

		local ID1 = RearEnt:LookupAttachment( "muzzle_right" )
		local ID2 = RearEnt:LookupAttachment( "muzzle_left" )

		local Muzzle1 = RearEnt:GetAttachment( ID1 )
		local Muzzle2 = RearEnt:GetAttachment( ID2 )

		if not Muzzle1 or not Muzzle2 then return end

		local FirePos = {
			[1] = Muzzle1,
			[2] = Muzzle2
		}

		ent.FireIndex = ent.FireIndex and ent.FireIndex + 1 or 1

		if ent.FireIndex > #FirePos then
			ent.FireIndex = 1
		end

		local Pos = FirePos[ent.FireIndex].Pos
		local Dir = (AimPos - Pos):GetNormalized()

		local bullet = {}
		bullet.Src 	= Pos
		bullet.Dir 	= Dir
		bullet.Spread 	= Vector( 0.01,  0.01, 0 )
		bullet.TracerName = "lvs_laser_green_short"
		bullet.Force	= 10
		bullet.HullSize 	= 30
		bullet.Damage	= 100
		bullet.SplashDamage = 200
		bullet.SplashDamageRadius = 200
		bullet.Velocity = 8000
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
		effectdata:SetNormal( Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle_colorable", effectdata )

		ent:TakeAmmo()

		base.SNDRear:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if base:GetIsCarried() then return end

		local RearEnt = base:GetRearEntity()

		if not IsValid( RearEnt ) then return end

		local Ang, HitPos, InRange = base:GetGunnerAimAng( ent, base, RearEnt )

		RearEnt:SetPoseParameter("gun_pitch", math.Clamp(Ang.p,-10,30) )
		RearEnt:SetPoseParameter("gun_yaw", Ang.y )
	end
	weapon.CalcView = function( ent, ply, pos, angles, fov, pod )
		local view = {}
		view.origin = pos
		view.angles = angles
		view.fov = fov
		view.drawviewer = false

		local mn = self:OBBMins()
		local mx = self:OBBMaxs()
		local radius = ( mn - mx ):Length()
		local radius = radius + radius * pod:GetCameraDistance()

		local clamped_angles = pod:WorldToLocalAngles( angles )
		clamped_angles.p = math.max( clamped_angles.p, -20 )
		clamped_angles = pod:LocalToWorldAngles( clamped_angles )

		local StartPos = self:LocalToWorld( Vector(-150,0,150) ) + clamped_angles:Up() * 150
		local EndPos = StartPos - clamped_angles:Forward() * radius + clamped_angles:Up() * (radius * 0.2 + radius * pod:GetCameraHeight())

		local WallOffset = 4

		local tr = util.TraceHull( {
			start = StartPos,
			endpos = EndPos,
			filter = function( e )
				local c = e:GetClass()
				local collide = not c:StartWith( "prop_physics" ) and not c:StartWith( "prop_dynamic" ) and not c:StartWith( "prop_ragdoll" ) and not e:IsVehicle() and not c:StartWith( "gmod_" ) and not c:StartWith( "lvs_" ) and not c:StartWith( "player" ) and not e.LVS

				return collide
			end,
			mins = Vector( -WallOffset, -WallOffset, -WallOffset ),
			maxs = Vector( WallOffset, WallOffset, WallOffset ),
		} )

		view.angles = angles + Angle(5,0,0)
		view.origin = tr.HitPos
		view.drawviewer = true

		if tr.Hit and  not tr.StartSolid then
			view.origin = view.origin + tr.HitNormal * WallOffset
		end

		return view
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if base:GetIsCarried() then return end

		local RearEnt = base:GetRearEntity()

		if not IsValid( RearEnt ) then return end

		local _,AimPos, InRange = base:GetGunnerAimAng( ent, base, RearEnt )

		local Pos2D = AimPos:ToScreen()

		local Col = InRange and white or red

		self:PaintCrosshairCenter( Pos2D, Col )
		self:PaintCrosshairOuter( Pos2D, Col )
		self:LVSPaintHitMarker( Pos2D )
	end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end

	self:AddWeapon( weapon, 3 )
end
--addons/ssrp_lfs/lua/entities/lvs_walker_atte_hoverscript/shared.lua:

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


--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_base/shared.lua:
ENT.Type='anim'ENT.Base='base_srp'ENT.Spawnable=info.Dev;ENT.MediaPlayer=true;ENT.NetworkPlayerUse=true;ENT.DoNotDuplicate=true;ENT.Is3D=true;medialib=medialib||require'medialib.core'medialib.TWITCH_API_KEY='t7c6s4d54ej8gwp25gvsyv48twb1zb'medialib.YOUTUBE_API_KEY='AIzaSyBDOTL_v6MmE1GBRkjquJ2NUwDGmjyCGUI'medialib.DEBUG=info.Dev;require'medialib.service.volume3d'require'medialib.service.youtubeplaylist'function ENT:SetupDataTables()self:NetworkVar('String',0,'URL')self:NetworkVar('String',1,'Title')self:NetworkVar('String',2,'Room')self:NetworkVar('Int',0,'Start')self:NetworkVar('Int',1,'Time')self:NetworkVar('Int',2,'Paused')self:NetworkVar('Int',3,'Looping')end;function ENT:IsPaused()return self:GetPaused()==1 end;function ENT:IsLooping()return self:GetLooping()==1 end
--addons/!lpakr_out/lua/dash/thirdparty/medialib.core/medialib.core.lua:
return lpakr()()
--MediaLib_DynFile_webm.lua:
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
--addons/!lpakr_out/lua/dash/thirdparty/medialib.core/ext/volume3d.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_radio.lua:
AddCSLuaFile()ENT.Base='media_base'ENT.PrintName='Radio'ENT.Category='RP Media'ENT.Spawnable=true;ENT.AdminSpawnable=true;ENT.MediaPlayer=true;ENT.Model='models/props_lab/citizenradio.mdl'function ENT:CanUse(a)return a:IsTrialGamemaster()end
--addons/!lpakr_out/lua/entities/nbot_sw_commando_droid.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='Commando Droid'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/tfa/comm/gg/npc_comb_sw_droid_commando.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_droid_commando.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/nbot_sw_geonosis_droid_b1.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='B1 Geonosis Droid'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/tfa/comm/gg/npc_comb_sw_g_droid_b1.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_g_droid_b1.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/nbot_sw_superbattle_droid_b2.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='B2 Super Battle Droid'ENT.Category='GM Hostile Nextbots'ENT.Weapons={'sup_b2'}ENT.RagdollModel='models/tfa/comm/gg/npc_comb_sw_droid_b2.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_droid_b2.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_acklay.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Acklay"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/acklay_a01.mdl"}ENT.ModelScale=2;ENT.BloodColor=BLOOD_COLOR_GREEN;ENT.OnDamageSounds={}ENT.OnDeathSounds={"fallenlogic/acklay/screech01.mp3"}ENT.OnSpawnSounds={}ENT.SpawnHealth=1500;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=120;ENT.ReachEnemyRange=100;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.UseWalkframes=false;ENT.WalkAnimation=ACT_WALK;ENT.RunAnimation=ACT_RUN;ENT.IdleAnimation=ACT_IDLE;ENT.WalkSpeed=30;ENT.RunSpeed=120;ENT.EyeBone="EyelidTop"AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_dewback.lua:
ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Dewback"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/dewback_dewback_a01_v01.mdl"}ENT.Skins={0}ENT.ModelScale=1;ENT.CollisionBounds=Vector(40,72,40)ENT.BloodColor=BLOOD_COLOR_GREEN;ENT.RagdollOnDeath=false;ENT.SpawnHealth=500;ENT.HealthRegen=0;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;ENT.OnSpawnSounds={"fallenlogic/dewback/dewback_spawn.wav"}ENT.OnIdleSounds={}ENT.IdleSoundDelay=2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={}ENT.OnDownedSounds={}ENT.Footsteps={}ENT.Omniscient=false;ENT.SpotDuration=30;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=50;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.Frightening=false;ENT.AllyDamageTolerance=0.33;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.33;ENT.Acceleration=800;ENT.Deceleration=800;ENT.JumpHeight=50;ENT.StepHeight=10;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;ENT.WalkAnimation=ACT_WALK;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_RUN;ENT.RunAnimRate=1;ENT.IdleAnimation=ACT_IDLE;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_JUMP;ENT.JumpAnimRate=1;ENT.UseWalkframes=false;ENT.WalkSpeed=50;ENT.RunSpeed=70;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=60;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(0,0,0)ENT.EyeBone="Head"ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.UseWeapons=false;ENT.Weapons={}ENT.WeaponAccuracy=1;ENT.WeaponAttachment=""ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=true;ENT.PossessionEnabled=true;ENT.PossessionCrosshair=true;ENT.PossessionViews={{offset=Vector(-200,0,150),distance=0},{offset=Vector(45,0,0),distance=-325,eyepos=true}}ENT.PossessionBinds={}if SERVER then else function ENT:CustomInitialize()end;function ENT:CustomThink()end;function ENT:CustomDraw()end end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_irradiated_rancor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_irradiated_rancor.lua:
if!DrGBase then return end;ENT.Base="npc_drg_rancor"ENT.CWRP=true;ENT.PrintName="Irradiated Rancor"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/rancor_a01.mdl"}ENT.Skins={6}ENT.ModelScale=1;ENT.CollisionBounds=Vector(100,100,100)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=1200;ENT.HealthRegen=5;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_juvenile_rancor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_krykna_spider.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Krykna"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/jediacad/npcs/krykna.mdl"}ENT.Skins={0}ENT.ModelScale=1;ENT.CollisionBounds=Vector(72,72,100)ENT.BloodColor=DONT_BLEED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=1000;ENT.HealthRegen=0;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;ENT.OnSpawnSounds={""}ENT.OnIdleSounds={"Zombie.FootstepLeft","Zombie.FootstepRight"}ENT.IdleSoundDelay=0.2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={}ENT.OnDownedSounds={}ENT.Footsteps={}ENT.Omniscient=false;ENT.SpotDuration=10;ENT.RangeAttackRange=300;ENT.MeleeAttackRange=50;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.Frightening=false;ENT.AllyDamageTolerance=0.33;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.33;ENT.Acceleration=800;ENT.Deceleration=800;ENT.JumpHeight=50;ENT.StepHeight=10;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;ENT.WalkAnimation=ACT_WALK;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_WALK;ENT.RunAnimRate=1.5;ENT.IdleAnimation=ACT_WALK;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_JUMP;ENT.JumpAnimRate=1;ENT.UseWalkframes=false;ENT.WalkSpeed=100;ENT.RunSpeed=150;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=80;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(0,0,0)ENT.EyeBone="mouth_translate"ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.UseWeapons=false;ENT.Weapons={}ENT.WeaponAccuracy=1;ENT.WeaponAttachment=""ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=true;ENT.PossessionEnabled=true;ENT.PossessionCrosshair=true;ENT.PossessionViews={{offset=Vector(-200,0,150),distance=0},{offset=Vector(45,0,0),distance=-325,eyepos=true}}ENT.PossessionBinds={}if SERVER then else function ENT:CustomInitialize()end;function ENT:CustomThink()end;function ENT:CustomDraw()end end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_nexu.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_nightmarebeast.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_nocturnal_rancor.lua:
if!DrGBase then return end;ENT.Base="npc_drg_rancor"ENT.CWRP=true;ENT.PrintName="Nocturnal Rancor"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/rancor_a01.mdl"}ENT.Skins={4}ENT.ModelScale=1;ENT.CollisionBounds=Vector(100,100,100)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=1000;ENT.HealthRegen=5;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_rancor_egg.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_06.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Flamethrower 1"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]flamethrower_basic"
--addons/!lpakr_out/lua/entities/pfx1_07.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Black Smoke Cloud"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]big_smoke"
--addons/!lpakr_out/lua/entities/pfx1_0d.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx2_02_a.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Gushing Blood [Alien, Large]"ENT.Category="PPE: Other"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[2]gushing_blood_alien*"
--addons/!lpakr_out/lua/entities/pfx2_02_a_s.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_03_s~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Smaller Green Jet [Smokeless]"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_g_s*"
--addons/!lpakr_out/lua/entities/pfx4_04.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_08.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx6_00.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Basic Gunfire"ENT.Category="PPE: Weapons"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[6]gunfire_generic"
--addons/!lpakr_out/lua/entities/pfxcom.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="PFXCOM"ENT.Category="PPE: Water"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[com]jet"
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_artilleryshell/shared.lua:
ENT.PrintName='Artillery Shell'ENT.Author='Scott'ENT.Contact='STEAM_0:1:2665200'ENT.Purpose=''ENT.Instructions=''ENT.Type='anim'ENT.Base='base_anim'ENT.Category='SUP Development'ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Model=Model'models/gredwitch/bombs/75mm_shell.mdl'ENT.DoNotDuplicate=true;ENT.MortarShell=true;ENT.Speed=5000;ENT.LandingSpeed=3000;ENT.Deviation=450;ENT.Damage=1000;ENT.DamageAOE=500;ENT.DamageRadius=500;ENT.IncomingSound='Mortar.Incoming'ENT.PrimaryAmmoClip=0;sound.Add({name='Mortar.Incoming',sound={'galactic/weapons/mortar/incoming1.mp3','galactic/weapons/mortar/incoming2.mp3','galactic/weapons/mortar/incoming3.mp3'},pitch={90,105},channel=CHAN_AUTO,volume=2,level=100})
--addons/!lpakr_out/lua/entities/rp_baccarat.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_beacon/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_bomb_base/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bomb_normal.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='rp_bomb_base'ENT.PrintName='Normal Bomb'ENT.Category='SUP Hackables'ENT.Spawnable=true;ENT.Models={Model('models/props_phx/ww2bomb.mdl'),Model('models/props/starwars/tech/proton_shell.mdl'),Model('models/lt_c/sci_fi/dm_container.mdl'),Model('models/lt_c/sci_fi/am_container.mdl')}
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bubbleshield/shared.lua:
ENT.PrintName='Bubble Shield'ENT.Author='Scott'ENT.Contact='STEAM_0:1:2665200'ENT.Purpose=''ENT.Instructions=''ENT.Type='anim'ENT.Base='base_anim'ENT.Category='SUP Development'ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Model=Model'models/hunter/misc/sphere2x2.mdl'ENT.IsShieldDome=true;ENT.MaxHealth=80000;ENT.Offset=Vector(0,0,35)ENT.ShieldOn=Sound'galactic/droideka/droideka_shield_on.mp3'ENT.ShieldOff=Sound'galactic/droideka/droideka_shield_off.mp3'function ENT:SetupDataTables()self:NetworkVar('Int',0,'HP')self:NetworkVar('Bool',0,'Enabled')self:NetworkVarNotify('Enabled',self.OnEnabledStateChanged)end;function ENT:OnEnabledStateChanged(a,b,c)if c then self:SetModelScale(1.3,.25)self:EmitSound(self.ShieldOn)else self:SetModelScale(0,1)self:EmitSound(self.ShieldOff)end;if CLIENT&&self:GetOwner()==LocalPlayer()then hook('HUDPaint',self,self.DisplayShieldInfo)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_building/shared.lua:
ENT.PrintName='RP Building'ENT.Author='Scott'ENT.Contact=''ENT.Purpose=''ENT.Instructions=''ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Type='anim'ENT.Base='base_srp'ENT.Model='models/props_c17/concrete_barrier001a.mdl'ENT.DoNotDuplicate=true;ENT.Interactive=true;ENT.BuildEffect=Sound''ENT.NetworkPlayerUse=true;ENT.UIPosition=Vector(0,0,55)ENT.UIAngle=Angle(0,90,90)ENT.Building=true;function ENT:SetupDataTables()self:NetworkVar('String',0,'ID')self:NetworkVar('Bool',0,'Building')self:NetworkVar('Bool',1,'RequiresConstruction')end;function ENT:GetBuildingData()if self.BuildingData then return self.BuildingData end;local a=self:GetID()if!a||a==''then return end;local b=srp.build.Get(a)if b then self.BuildingData=b;return b end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_buildzone/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_buildzone/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_collectable/shared.lua:
DEFINE_BASECLASS'base_anim'ENT.Type='anim'ENT.Spawnable=true;ENT.PrintName='Collectable'ENT.Category='SUP'ENT.Author='Scott'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Interactive=true;ENT.DoNotDuplicate=true;function ENT:SetupDataTables()self:NetworkVar('String',0,'ID')self:NetworkVar('Int',0,'Count')self:NetworkVar('Int',1,'MaxCount')self:NetworkVar('Int',2,'Chance')end;function ENT:SetupCollectable(a)local b=srp.collectables.Get(a)if!b then return end;self.collectable=b;self:SetModel(istable(b.Model)&&b.Model[math.random(1,#b.Model)]||b.Model)self:SetSolid(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_NONE)self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)self.InteractionName=b.InteractionName;self.InteractionRange=b.InteractionRange||40;self.InteractionDuration=b.InteractionDuration||5;self.InteractionColor=b.InteractionColor||col.blue;self.RespawnCooldown=b.RespawnCooldown||120;self._RespawnCooldown=self.RespawnCooldown;self.VisibleResources=b.VisibleResources;self.InteractionInstant=b.InteractionInstant;if b.InteractionBoxSize then self:PhysicsInitBox(b.InteractionBoxSize.mins,b.InteractionBoxSize.maxs)self:SetMoveType(MOVETYPE_NONE)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_crafting/cl_init.lua:
include'shared.lua'local a='Start Crafting'local b='Repairs Needed'local c=20;local d=Material('materials/galactic/ui/tools.png','noclamp smooth')local e=Material('materials/galactic/ui/utility.png','noclamp smooth')local f=Material('materials/galactic/ui/warning.png','noclamp smooth')local g=256;ENT.UIPosition=Vector(-4,12,45)ENT.UIAngle=Angle(0,-90,90)ENT.UIScale=.04;ENT.UIIcon=d;function ENT:SetCrafting(h,i,j)if!h then return end;self.crafting=true;self.offset=h.craftingOffset||12;self.model=h.model;self.start=i;self.duration=j;self.sound=self:StartLoopingSound(self.SoundCrafting)self:ResetSequence(self.AnimationCrafting)end;function ENT:DrawCrafting()if!self.crafting then return end;if!IsValid(self.mdl)then local k=ClientsideModel(self.model)if!IsValid(k)then return end;k:SetPos(self:GetCraftingPos()+Vector(0,0,k:OBBMins().z))k:SetAngles(self:GetAngles())k:SetParent(self)k:SetNoDraw(true)k:SetRenderMode(RENDERMODE_TRANSALPHA)k:SetColor(Color(255,255,255,25))self.mdl=k end;if!IsValid(self.mdl)then return end;local l,m=self.mdl:OBBMins(),self.mdl:OBBMaxs()local n=math.Clamp((CurTime()-self.start)/(self.duration||0),0,1)local o=-self.mdl:GetUp()local p=self.mdl:LocalToWorld(Vector(0,0,math.abs(l.z)+(m.z>0&&m.z||self.offset)+5)*n)local q=o:Dot(p)local r=render.EnableClipping(true)render.PushCustomClipPlane(o,q)render.ModelMaterialOverride(self.EffectCrafting)self.mdl:DrawModel()render.ModelMaterialOverride()render.PopCustomClipPlane()render.EnableClipping(r)if n==1 then self:StopCrafting()end end;function ENT:StopCrafting()self.crafting=false;self:EmitSound(self.SoundCompleted,60)self:StopLoopingSound(self.sound)self:ResetSequence(self.AnimationIdle)if IsValid(self.mdl)then self.mdl:Remove()end end;function ENT:OnRemove()if self.sound then self:StopLoopingSound(self.sound)end;if IsValid(self.mdl)then self.mdl:Remove()end end;function ENT:Draw()self:DrawModel()self:DrawCrafting()self:DrawActive()end;function ENT:DrawActive()if self:GetActivated()then return end;cam.Start3D2D(self:LocalToWorld(self.UIPosition),self:LocalToWorldAngles(self.UIAngle),self.UIScale)surface.SetMaterial(e)surface.SetDrawColor(col.red)surface.DrawTexturedRect(-g/2,-g,g,g)draw.SimpleText(b,'ui_header.xl',0,20,col.red,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)cam.End3D2D()local s=DynamicLight(self:EntIndex(),true)if s then s.pos=self:GetPos()+Vector(0,0,100)s.r=255;s.g=15;s.b=15;s.brightness=4;s.Decay=500;s.Size=50+math.cos(RealTime()/1)*250;s.DieTime=CurTime()+.5 end end;function ENT:DrawInteraction(t)surface.SetFont('ui_label_inventory.itemheader')surface.SetDrawColor(255,255,255,255)surface.SetMaterial(t.OnPickup)surface.SetTextColor(255,255,255,255)local u,v=surface.GetTextSize(a)u=u+c+4;local w,x=(ScrW()-c)/2,(ScrH()-(c+20))/2;surface.DrawTexturedRect(w,x,c,c)surface.SetTextPos(w+c+2,x)surface.DrawText(a)end;function ENT:GetRepairInfo(y)local h=srp.items.Get(self.RepairItemID)if!h then return end;return h.name,2,self:GetActivated()&&1||0,h.icon end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_firingrange/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_gravity.lua:
AddCSLuaFile()ENT.Base="rp_funcmodule"ENT.Type="anim"ENT.Spawnable=info.Dev;ENT.Category='SUP'ENT.PrintName="Gravity Generator"ENT.DisplayName="Gravity\nGenerator"ENT.MaxHealth=2000;ENT.Model=Model'models/props/console1.mdl'ENT.Activated=true;ENT.UIPosition=Vector(-10,10,50)ENT.UIAngle=Angle(0,90,70)ENT.UIScale=.025;ENT.InteractionRange=200;ENT.CanDisable=true;function ENT:OnStartup()self:CheckGravity()end;function ENT:OnStarupFailure()end;function ENT:OnShutdown()self:CheckGravity()end;function ENT:OnSystemFailure()self:CheckGravity()end;function ENT:CheckGravity()if self:GetActivated()then self:StartGravity()else self:EndGravity()end end;function ENT:StartGravity()srp.events.TurnOn('module_gravitygen',true)srp.funcmodules.RemoveWarning('gravity')srp.funcmodules.SetGravity(Vector(0,0,-600),1)end;function ENT:EndGravity()srp.events.TurnOn('module_gravitygen',false)srp.funcmodules.DisplayWarning('gravity')srp.funcmodules.SetGravity(Vector(0,0,20),.1)end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_training.lua:
AddCSLuaFile()ENT.Base="rp_funcmodule"ENT.Type="anim"ENT.Spawnable=info.Dev;ENT.Category='SUP'ENT.PrintName="Training Module"ENT.DisplayName="Training\nModule"ENT.MaxHealth=1000;ENT.Model=Model'models/props/console3.mdl'ENT.Activated=true;ENT.UIBackground=Color(0,0,0,250)ENT.UIPosition=Vector(-10,0,60)ENT.UIAngle=Angle(0,90,90)ENT.UIScale=.05;ENT.InteractionRange=200;ENT.CanDisable=true;function ENT:OnStartup()end;function ENT:OnShutdown()end;function ENT:OnSystemFailure()timer.Create('trainingModuleRepair',8,0,function()if IsValid(self)&&self:GetActivated()==false then self:RepairTrainingModule()end end)end;function ENT:RepairTrainingModule()self:SetHP(self.MaxHealth)self:Startup()end;function ENT:Repair(a,b,c)c(false)end
--addons/!lpakr_out/lua/entities/rp_grenade/shared.lua:
ENT.Type="anim"DEFINE_BASECLASS'base_anim'ENT.PrintName="Base Grenade"ENT.Author="Scott"ENT.Contact='Scott (STEAM_0:1:26675200)'ENT.Purpose='Base Grenade Entity'ENT.Instructions='There are none.'ENT.WorldModel='models/weapons/w_grenade.mdl'ENT.WorldMaterial='models/weapons/v_models/grenades/bacta_grenade'ENT.Interactive=true;ENT.ExplosionTime=8;ENT.FreezeMotion=false;ENT.HitSound=Sound'Flashbang.Bounce'function ENT:SetupDataTables()self:NetworkVar('Bool',0,'Exploded')self:NetworkVar('Bool',1,'Sticking')end;function ENT:DoStickySetup(a,b)end;local c=0.5;function ENT:PhysicsUpdate(d)if self:GetSticking()then return end;BaseClass.PhysicsUpdate(self,d)local e=d:GetVelocity()local f=e:GetNormalized()local g=d:GetAngleVelocity()local h=self:GetPos()local i=util.TraceLine({start=h,endpos=h+f*15,mask=MASK_SHOT,filter=self})if i.StartSolid then if!self.m_inSolid then e=e*-c;d:SetVelocity(e)end;self.m_inSolid=true;return end;self.m_inSolid=false;if i.Hit then local j=DamageInfo()j:SetDamage(0.1)j:SetAttacker(self)j:SetInflictor(self:GetOwner())j:SetDamageType(DMG_CRUSH)j:SetDamageForce(d:GetMass()*e)i.Entity:TakeDamageInfo(j)e=-0.2*i.Normal*e:Dot(i.Normal)+e;e=e*c;g=g*-0.5;d:SetVelocity(e)d:AddAngleVelocity(g)end end
--addons/!lpakr_out/lua/entities/rp_grenade_gl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_hackable_lock/shared.lua:
ENT.PrintName='Hackable Lock'ENT.PrettyPrint='Hyperspace Controls'ENT.Author='Scott'ENT.Contact='STEAM_0:1:2665200'ENT.Purpose=''ENT.Instructions=''ENT.Type='anim'ENT.Base='base_anim'ENT.Category='SUP Hackables'ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_TRANSLUCENT;ENT.Model=Model'models/hunter/plates/plate1x1.mdl'ENT.IsSecurityDevice=true;function ENT:SetupDataTables()self:NetworkVar('Bool',0,'Locked')self:NetworkVar('String',0,'FuncName')end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_hologram_temple.lua:
AddCSLuaFile()ENT.Base='rp_hologram'ENT.PrintName='Temple Hologram'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.TargetSolo=true;ENT.TargetAimAtViewer=true;ENT.DoNotDuplicate=true;ENT.Model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/props/nar_shadda/nar_holo_bench.mdl'ENT.ModelScale=.75;ENT.TargetRadius=1;ENT.TargetScale=1;ENT.TargetOffset=Vector(0,0,42)ENT.PVSZoneOffset=Vector(0,0,0)ENT.UIPosition=Vector(15,48,25)ENT.UIAngle=Angle(180,0,-90)ENT.UIPositionOther=Vector(-15,-48,25)ENT.UIAngleOther=Angle(180,180,-90)ENT.UIPositionBack=false;ENT.UIPositionBackOther=false;ENT.CollisionGroup=COLLISION_GROUP_DEBRIS_TRIGGER
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_item/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_laat_teleport.lua:
AddCSLuaFile()ENT.Base='base_anim'ENT.Type='anim'ENT.Spawnable=info.Dev;ENT.Category='SUP'ENT.PrintName='LAAT Transport'ENT.MaxHealth=3000;ENT.Model=Model'models/blu/laat.mdl'ENT.IgnoreNoGrav=true;ENT.Interactive=true;ENT.DoNotDuplicate=true;ENT.InteractionDistance=50000;function ENT:SetupDataTables()self:NetworkVar('String',0,'TeleportName')end;function ENT:Initialize()self.TeleportIDUsed=0;self:SetModel(self.Model)end;function ENT:Use(a)if a:IsJEDI()||a:HasPermission('jedi')||a:IsRoot()then self:Teleport(a)end end;function ENT:SetupTeleport(b)self.TeleportTo=b end;function ENT:SetupTransform(c,d)self.Origin=c;self.OriginAngles=d;self:SetPos(c)self:SetAngles(d)end;function ENT:Teleport(a)if!self.TeleportTo then return end;local e=ents.FindByName(self.TeleportTo)if!e||#e==0 then return end;self.TeleportIDUsed=(self.TeleportIDUsed+1)%#e;local f=e[self.TeleportIDUsed+1]if IsValid(f)then a:SetPos(f:GetPos())a:SetEyeAngles(f:GetAngles())end end;function ENT:AnimateShip()if self.Origin then self:SetPos(self.Origin+Vector(math.cos(RealTime()*1)*3,math.sin(RealTime()*1)*1.5,math.cos(RealTime()*1)*1.5))self:SetAngles(self.OriginAngles+Angle(math.cos(RealTime()*.2)*2,math.cos(RealTime()*.2)*1.5,0))end end;local g=22;function ENT:DrawInteraction(h,i,j)local k=self:GetTeleportName()if!k||k==''then return end;surface.SetFont'ui_header.r'surface.SetDrawColor(255,255,255,255)surface.SetMaterial(h.OnPickup)surface.SetTextColor(255,255,255,255)local l,m=surface.GetTextSize(k)l=l+g+4;local n,o=ScrW()/2-l/2,ScrH()*.8;surface.DrawTexturedRect(n,o,g,g)surface.SetTextPos(n+g+2,o-2)surface.DrawText(k)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_npc/cl_init.lua:
include'shared.lua'ENT.Interactive=true;ENT.InteractiveMaterialSize=20;function ENT:Initialize()self.Init=true;timer.Simple(2,function()if IsValid(self)then self:OnDataReceived(_,_,self:GetNPCID())end end)end;function ENT:DrawInteraction(a,b,c)if self:GetNoDraw()then return end;surface.SetFont'ui_header.s'surface.SetDrawColor(255,255,255,255)surface.SetMaterial(a.OnPickup)surface.SetTextColor(255,255,255,255)local d=self:GetNPCTitle()if!d then return end;local e,f=surface.GetTextSize(d)e=e+self.InteractiveMaterialSize+4;local g,h=c.x,c.y;surface.DrawTexturedRect(g,h,self.InteractiveMaterialSize,self.InteractiveMaterialSize)surface.SetTextPos(g+self.InteractiveMaterialSize+2,h-2)surface.DrawText(d)end;function ENT:Draw()self:DrawModel()if!self.Init then self:Initialize()end end;function ENT:DrawTranslucent()self:DrawModel()end;function ENT:Think()local i=self:GetAnimationString()if i then self:SetSequence(i)self:ResetSequence(i)else self:ResetSequence('idle_all_02')end;local j=self:GetData()if j.ClientThink&&(!self.NextSecondThink||self.NextSecondThink<CurTime())then j.ClientThink(self)self.NextSecondThink=CurTime()+1 end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_pallet/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_roominfo_db.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_simroom_waves/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_simroom_waves/cl_init.lua:
include'shared.lua'function ENT:Initialize()self:SetRenderBounds(Vector(-575,-575,-100),Vector(575,575,100))end;function ENT:ReadPlayerUse()self.Data=srp.simroom.ReadFromServer()end;function ENT:PlayerUse()srp.ui.Create('srp_simroom',function(a)a:Populate(self,self.Data)end)end;ENT.DisplayPositions={csr={UIPosition=Vector(-3,0,28),UIAngles=Angle(0,90,90),UIPositionBig=Vector(-20,133,400),UIPositionAnglesBig=Angle(0,-90,90),Scale=1,DisplayName='Simulation Room',DisplayNameOffsetX=0,DisplayNameOffsetY=0},esr={UIPosition=Vector(-1,0,28),UIAngles=Angle(0,90,90),UIPositionBig=Vector(840,-445,500),UIPositionAnglesBig=Angle(0,0,90),Scale=1,DisplayName='Empty Simulation Room',DisplayNameOffsetX=0,DisplayNameOffsetY=0}}function ENT:Draw()self:DrawModel()local b=self:GetSimRoom()local c=srp.simroom.Get(b,true)if!c then return end;local d=self.DisplayPositions[c.id]if!d then return end;local e=self:GetRunning()local f=e&&'Active'||'Inactive'local g=e&&col.green||col.red;local h=self:GetWaves()local i=self:GetWave()cam.Start3D2D(self:LocalToWorld(d.UIPosition),self:LocalToWorldAngles(d.UIAngles),0.1)draw.SimpleText('Room Manager','ui_starwars.l',0,0,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)draw.SimpleText(f,'ui_starwars.l',0,30,g,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)if e then draw.SimpleText('Wave '..i..' of '..h,'ui_starwars.r',0,65,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;cam.End3D2D()if e||d.DisplayName then cam.Start3D2D(self:LocalToWorld(d.UIPositionBig),self:LocalToWorldAngles(d.UIPositionAnglesBig),d.Scale||0.25)if d.DisplayName then draw.SimpleText(d.DisplayName,'ui_starwars.xxl',d.DisplayNameOffsetX,d.DisplayNameOffsetY,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;if e then draw.SimpleText('W A V E    '..i..'    O F    '..h,'ui_starwars.xxl',0,65,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;cam.End3D2D()end end;function ENT:DrawInteraction(j,k,l)surface.SetFont'ui_header.s'surface.SetDrawColor(255,255,255,255)surface.SetMaterial(j.OnPickup)surface.SetTextColor(255,255,255,255)local m,n=surface.GetTextSize(self.InteractionName)m=m+self.InteractiveMaterialSize+4;local o,p=l.x,l.y;surface.DrawTexturedRect(o,p,self.InteractiveMaterialSize,self.InteractiveMaterialSize)surface.SetTextPos(o+self.InteractiveMaterialSize+2,p-2)surface.DrawText(self.InteractionName)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_statue/cl_init.lua:
include'shared.lua'function ENT:PlayerUse(a)srp.ui.Create('srp_statuemodel',function(b)b:Populate(self)end)end;function ENT:GetCSModel(c)if IsValid(self.ModelEnt)then if!c then self.ModelEnt:SetParent(self)self.ModelEnt:SetLocalPos(Vector())end;return self.ModelEnt else local d=ents.CreateClientProp()d:SetParent(self)d:SetLocalPos(Vector())d:SetLocalAngles(Angle())self.ModelEnt=d;return d end end;function ENT:UpdateModel(e)if!e then if IsValid(self.ModelEnt)then self.ModelEnt:Remove()end;return end;local d=self:GetCSModel()if!IsValid(d)then return end;d:SetModel(e)self.Looping=self:GetLooping()self.AnimIndex=self:GetAnimationIndex()self.AnimCycle=self:GetAnimationCycle()end;function ENT:Think()if!self.AnimIndex then return end;local d=self:GetCSModel(true)if!IsValid(d)then return end;d:ResetSequence(self.AnimIndex)if self.AnimCycle>0 then d:SetCycle(self.AnimCycle)end end;function ENT:OnModelChanged(f,g,h)timer.Simple(.2,function()if IsValid(self)then self:UpdateModel(g)end end)end;function ENT:Draw()if self:GetStatueOwner()==LocalPlayer()then self:DrawModel()end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_statue/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_storagecrate/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_trader_ship.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_trivia/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_trivia/shared.lua:
ENT.PrintName='Trivia Panel'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Type='anim'ENT.Base='base_anim'ENT.Contact=''ENT.Purpose=''ENT.Instructions=''ENT.Spawnable=true;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/props/imperial/imp_holo_console.mdl'ENT.UIPosition=Vector(-56.8,-2,102)ENT.UIAngles=Angle(0,0,90)ENT.UIScale=0.1;ENT.UIWidth=1110;ENT.UIHeight=560;ENT.SeatPosition=Vector(-98,-155,30)ENT.SeatOffset=40;ENT.SeatCount=4;ENT.Stages={{Name='WAITING'},{Name='PLAYING'},{Name='ENDING'}}function ENT:SetupDataTables()self:NetworkVar('Int',0,'StageID')self:NetworkVar('Int',1,'Question')self:NetworkVar('Int',2,'MaxQuestions')self:NetworkVar('String',0,'Winner')self:NetworkVarNotify('StageID',function(a,b,c,d)if a.Stages[d]then a:SetStage(d)end end)end;function ENT:OnStatusChanged(b,c,d)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_turret/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/spwn_drg_default.lua:
ENT.Base="base_entity"ENT.Type="point"ENT.IsDrGSpawner=true;ENT.Spawnable=false;ENT.PrintName="Spawner"ENT.Category='GM Hostile Nextbots'ENT.ToSpawn={}ENT.AutoRemove=true;ENT.Radius=0;ENT.Quantity=0;ENT.Delay=0
--addons/!lpakr_out/lua/entities/sup_targettrigger.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/wos_kyber_slam/shared.lua:
ENT.Type="anim"ENT.Base="base_anim"
--addons/!lpakr_out/lua/effects/anzati_swtor3/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=1;if!f then return end;for h=0,d/g do local i=b+c*(d-h*g)local j=f:Add("wos/lightsabers/effects/anzati/swtor3",i)if j then j:SetLifeTime(0)j:SetDieTime(0.3)j:SetGravity(Vector(0,0,math.random(32,128)))j:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(math.random(100,200))j:SetEndAlpha(0)j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/anzati_swtor8/init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/effects/balloon_pop.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetStart()local d=a:GetScale()||32;local e=ParticleEmitter(b,true)for f=0,d do local g=Vector(math.Rand(-1,1),math.Rand(-1,1),math.Rand(-1,1))local h=e:Add("particles/balloon_bit",b+g*8)if h then h:SetVelocity(g*500)h:SetLifeTime(0)h:SetDieTime(10)h:SetStartAlpha(255)h:SetEndAlpha(255)local i=math.Rand(1,3)h:SetStartSize(i)h:SetEndSize(0)h:SetRoll(math.Rand(0,360))h:SetRollDelta(math.Rand(-2,2))h:SetAirResistance(100)h:SetGravity(Vector(0,0,-300))local j=math.Rand(0.8,1.0)h:SetColor(c.x*j,c.y*j,c.z*j)h:SetCollide(true)h:SetAngleVelocity(Angle(math.Rand(-160,160),math.Rand(-160,160),math.Rand(-160,160)))h:SetBounce(1)h:SetLighting(true)end end;e:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/dronesrewrite_explosionsmall.lua:
AddCSLuaFile()function EFFECT:Init(a)self.Start=a:GetOrigin()self.Emitter=ParticleEmitter(self.Start)for b=1,30 do local c=VectorRand()local d=self.Emitter:Add("effects/fleck_cement"..math.random(1,2),self.Start)d:SetDieTime(math.random(1,6))d:SetStartAlpha(math.random(50,150))d:SetEndAlpha(0)d:SetStartSize(math.random(1,2))d:SetRoll(math.Rand(-10,10))d:SetRollDelta(math.Rand(-10,10))d:SetEndSize(0)d:SetVelocity(c*200)d:SetGravity(Vector(0,0,-100))d:SetColor(0,0,0)end;for b=1,10 do local c=VectorRand()local d=self.Emitter:Add("particle/smokesprites_000"..math.random(1,3),self.Start+c*10)d:SetDieTime(math.random(1,2))d:SetStartAlpha(math.random(50,150))d:SetEndAlpha(0)d:SetStartSize(10)d:SetEndSize(70)d:SetVelocity(c*10)d:SetGravity(Vector(0,0,40))d:SetCollide(true)d:SetColor(50,50,20)end;for b=1,20 do local c=VectorRand()local d=self.Emitter:Add("particles/fir21",self.Start+c*2)d:SetDieTime(0.2)d:SetStartAlpha(20)d:SetEndAlpha(0)d:SetStartSize(5)d:SetRoll(math.Rand(-10,10))d:SetRollDelta(math.Rand(-4,4))d:SetEndSize(10)d:SetVelocity(c*50)d:SetAirResistance(40)end;self.Emitter:Finish()end;function EFFECT:Think()return false end
--addons/!lpakr_out/lua/effects/firework_stars.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/fireworks_halloween.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/fireworks_valentine.lua:
return lpakr()()
--addons/ssrp_lfs/lua/effects/lvs_exhaust.lua:

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
	local Pos = data:GetOrigin()
	local Dir = data:GetNormal()
	local Ent = data:GetEntity()
	local Scale = data:GetMagnitude()

	if not IsValid( Ent ) then return end

	local Vel = Ent:GetVelocity()

	local emitter = Ent:GetParticleEmitter( Pos )

	if not IsValid( emitter ) then return end

	local particle = emitter:Add( Materials[ math.random(1, #Materials ) ], Pos )

	if not particle then return end

	local Col = 100 - 60 * Scale

	particle:SetVelocity( Vel + Dir * (100 + 50 * Scale) )
	particle:SetDieTime( 0.4 - 0.3 * Scale )
	particle:SetAirResistance( 400 ) 
	particle:SetStartAlpha( 80 )
	particle:SetStartSize( 2 )
	particle:SetEndSize( 10 + 20 * Scale )
	particle:SetRoll( math.Rand( -1, 1 ) )
	particle:SetRollDelta( math.Rand( -1, 1 ) * 2 )
	particle:SetColor( Col, Col, Col )
	particle:SetGravity( Vector( 0, 0, 10 ) )
	particle:SetCollide( false )
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

--addons/ssrp_lfs/lua/effects/lvs_exhaust_fire.lua:

function EFFECT:Init( data )
	local Pos = data:GetOrigin()
	local Dir = data:GetNormal()
	local Ent = data:GetEntity()
	local Scale = data:GetMagnitude()

	if not IsValid( Ent ) then return end

	local emitter = Ent:GetParticleEmitter( Pos )

	if not IsValid( emitter ) then return end

	local particle = emitter:Add( "particles/fire1", Pos )

	if particle then
		particle:SetVelocity( Dir * 70 )
		particle:SetDieTime( 0.2 )
		particle:SetAirResistance( 0 ) 
		particle:SetStartAlpha( 255 )
		particle:SetStartSize( 10 + 18 * Scale )
		particle:SetEndSize( 0 )
		particle:SetRoll( math.Rand(-1,1) * 180 )
		particle:SetColor( 255,255,255 )
		particle:SetGravity( Vector( 0, 0, 100 ) )
		particle:SetCollide( false )
	end
	
	for i = 1, 3 do
		local particle = emitter:Add( "particles/flamelet"..math.random(1,5), Pos )
		
		if particle then
			particle:SetVelocity( Dir * 40 * i )
			particle:SetDieTime( 0.2 )
			particle:SetAirResistance( 0 ) 
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( (5 + 5 * Scale) - i )
			particle:SetEndSize( 0 )
			particle:SetRoll( math.Rand(-1,1) * 180 )
			particle:SetColor( 255,255,255 )
			particle:SetGravity( Vector( 0, 0, 100 ) )
			particle:SetCollide( false )
		end
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

--addons/ssrp_lfs/lua/effects/lvs_firetrail.lua:

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
	self.Entity = data:GetEntity()
	self.Scale = data:GetScale()
	self.DieTime = CurTime() + data:GetMagnitude()
	self.Pos = data:GetStart()
	
	if not IsValid( self.Entity ) then return end

	self.Emitter = ParticleEmitter( self.Entity:LocalToWorld( self.Pos ), false )
end


function EFFECT:Think()
	if IsValid( self.Entity ) then
		local Pos = self.Entity:LocalToWorld( self.Pos )

		local T = CurTime()

		if (self.nextDFX or 0) < T then
			self.nextDFX = T + 0.05

			if self.Emitter then
				local particle = self.Emitter:Add( Materials[ math.random(1, #Materials ) ], Pos )

				if particle then
					particle:SetVelocity( VectorRand() * 100 * self.Scale )
					particle:SetDieTime( 3 )
					particle:SetAirResistance( 0 )
					particle:SetStartAlpha( 150 )
					particle:SetStartSize( 150 * self.Scale )
					particle:SetEndSize( math.Rand(200,300) * self.Scale )
					particle:SetRoll( math.Rand(-1,1) * 100 )
					particle:SetColor( 40,40,40 )
					particle:SetGravity( Vector( 0, 0, 0 ) )
					particle:SetCollide( false )
				end

				local particle = self.Emitter:Add( "particles/fire1", Pos )

				if particle then
					particle:SetVelocity( VectorRand() * 100 * self.Scale )
					particle:SetDieTime( math.random(40,80) / 100 )
					particle:SetAirResistance( 0 ) 
					particle:SetStartAlpha( 255 )
					particle:SetStartSize( 130 * self.Scale )
					particle:SetEndSize( math.Rand(50,100) * self.Scale )
					particle:SetRoll( math.Rand(-1,1) * 180 )
					particle:SetColor( 255,255,255 )
					particle:SetGravity( Vector( 0, 0, 70 ) )
					particle:SetCollide( false )
				end

				for i = 0,3 do
					local particle = self.Emitter:Add( "particles/flamelet"..math.random(1,5), Pos + VectorRand() * 100 * self.Scale )

					if particle then
						particle:SetVelocity( VectorRand() * 100 * self.Scale )
						particle:SetDieTime( math.random(30,60) / 100 )
						particle:SetAirResistance( 0 ) 
						particle:SetStartAlpha( 255 )
						particle:SetStartSize( 70 * self.Scale )
						particle:SetEndSize( math.Rand(25,80) * self.Scale )
						particle:SetRoll( math.Rand(-1,1) * 180 )
						particle:SetColor( 255,255,255 )
						particle:SetGravity( Vector( 0, 0, 40 ) )
						particle:SetCollide( false )
					end
				end
			end
		end

		if self.DieTime < CurTime() then 
			if self.Emitter then
				self.Emitter:Finish()
			end

			return false
		end

		return true
	end

	if self.Emitter then
		self.Emitter:Finish()
	end

	return false
end

function EFFECT:Render()
end

--addons/ssrp_lfs/lua/effects/lvs_laser_blue_short.lua:
local blue = Color( 0, 0, 255, 255 )
local white = Color( 255, 255, 255, 255 )

EFFECT.MatBeam = Material( "effects/spark" )
EFFECT.MatSprite = Material( "sprites/light_glow02_add" )

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

	local len = 300 * bullet:GetLength()

	render.SetMaterial( self.MatSprite )
	render.DrawBeam( endpos - dir * len * 2, endpos + dir * len * 2, 200, 1, 0, blue )

	render.SetMaterial( self.MatBeam )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 45, 1, 0, blue )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 15, 1, 0, white )
end

--addons/ssrp_lfs/lua/effects/lvs_laser_impact.lua:
local white = Color( 255, 255, 255, 255)
EFFECT.GlowMat = Material( "sprites/light_glow02_add" )

function EFFECT:Init( data )
	self.Pos = data:GetOrigin()
	self.Dir = data:GetNormal()
	self.Col = data:GetStart() or Vector(255,100,0)
	self.Color = Color( self.Col.x, self.Col.y, self.Col.z, 255 )

	self.LifeTime = 0.2
	self.DieTime = CurTime() + self.LifeTime

	local trace = util.TraceLine( {
		start = self.Pos - self.Dir,
		endpos = self.Pos + self.Dir,
		mask = MASK_SOLID_BRUSHONLY,
	} )

	self.Flat = trace.Hit and not trace.HitSky

	local Col = self.Col
	local Pos = self.Pos

	local emitter = ParticleEmitter( Pos, false )

	for i = 0, 10 do
		local particle = emitter:Add( "sprites/light_glow02_add", Pos )

		local vel = VectorRand() * 200 + self.Dir  * 80

		if not particle then continue end

		particle:SetVelocity( vel )
		particle:SetAngles( vel:Angle() + Angle(0,90,0) )
		particle:SetDieTime( math.Rand(0.2,0.4) )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(12,24) )
		particle:SetEndSize( 0 )
		particle:SetRoll( math.Rand(-100,100) )
		particle:SetRollDelta( math.Rand(-100,100) )
		particle:SetColor( Col.x,Col.y,Col.z )
		particle:SetGravity( Vector(0,0,-600) )

		particle:SetAirResistance( 0 )

		particle:SetCollide( true )
		particle:SetBounce( 0.5 )
	end

	emitter:Finish()
end

function EFFECT:Think()
	if self.DieTime < CurTime() then return false end

	return true
end

function EFFECT:Render()
	if not self.Color then return end
	local Scale = (self.DieTime - CurTime()) / self.LifeTime

	local S1 = 200 * Scale
	local S2 = 50 * Scale

	if self.Flat then
		cam.Start3D2D( self.Pos + self.Dir, self.Dir:Angle() + Angle(90,0,0), 1 )
			surface.SetMaterial( self.GlowMat )
			surface.SetDrawColor( self.Col.x, self.Col.y, self.Col.z, 255 )
			surface.DrawTexturedRectRotated( 0, 0, S1 , S1 , 0 )

			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.DrawTexturedRectRotated( 0, 0, S2 , S2 , 0 )
		cam.End3D2D()
	end

	render.SetMaterial( self.GlowMat )
	render.DrawSprite( self.Pos + self.Dir, S1, S1, self.Color )
	render.DrawSprite( self.Pos + self.Dir, S2, S2, white )
end

--addons/ssrp_lfs/lua/effects/lvs_physics_dust.lua:
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

local MatDebris = {
	"particle/particle_debris_01",
	"particle/particle_debris_02",
}

function EFFECT:Init( data )
	local Pos = data:GetOrigin()
	local Ent = data:GetEntity()

	if not IsValid( Ent ) then return end

	local Dir = Ent:GetForward()

	local emitter = Ent:GetParticleEmitter( Ent:GetPos() )

	local VecCol = render.GetLightColor( Pos + Vector(0,0,10) ) * 0.5 + Vector(0.3,0.25,0.15)

	if emitter and emitter.Add then
		for i = 1, 3 do
			local particle = emitter:Add( MatDebris[math.random(1,#MatDebris)], Pos + VectorRand(-10,10) )
			if particle then
				particle:SetVelocity( Vector(0,0,150) - Dir * 150 )
				particle:SetDieTime( 0.2 )
				particle:SetAirResistance( 60 ) 
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 255 )
				particle:SetStartSize( 15 )
				particle:SetEndSize( 50 )
				particle:SetRoll( math.Rand(-1,1) * 100 )
				particle:SetColor( VecCol.x * 130,VecCol.y * 100,VecCol.z * 60 )
				particle:SetGravity( Vector( 0, 0, -600 ) )
				particle:SetCollide( false )
			end
		end

		local Right = Ent:GetRight() 
		Right.z = 0
		Right:Normalize()

		for i = -1,1,2 do
			local particle = emitter:Add( Materials[math.random(1,#Materials)], Pos + Vector(0,0,10)  )
			if particle then
				particle:SetVelocity( -Dir * 400 + Right * 150 * i )
				particle:SetDieTime( math.Rand(0.5,1) )
				particle:SetAirResistance( 150 ) 
				particle:SetStartAlpha( 50 )
				particle:SetStartSize( -80 )
				particle:SetEndSize( 400 )
				particle:SetColor( VecCol.x * 255,VecCol.y * 255,VecCol.z * 255 )
				particle:SetGravity( Vector( 0, 0, 100 ) )
				particle:SetCollide( false )
			end
		end
	end
end


function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
--addons/ssrp_lfs/lua/effects/lvs_physics_impact.lua:

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
	local pos  = data:GetOrigin()

	local emitter = ParticleEmitter( pos, false )

	for i = 0,4 do
		local particle = emitter:Add( Materials[ math.random(1, #Materials ) ], pos )
		
		local vel = VectorRand() * 200
		
		if particle then			
			particle:SetVelocity( vel )
			particle:SetDieTime( math.Rand(2.5,5) )
			particle:SetAirResistance( 100 ) 
			particle:SetStartAlpha( 50 )
			particle:SetStartSize( 50 )
			particle:SetEndSize( 200 )
			particle:SetRoll( math.Rand(-5,5) )
			particle:SetColor( 30,30,20 )
			particle:SetGravity( Vector(0,0,20) )
			particle:SetCollide( false )
		end
	end
	
	emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

--addons/ssrp_lfs/lua/effects/lvs_shield_impact.lua:
local blue = Color( 0, 127, 255, 255)
local white = Color( 255, 255, 255, 255 )

function EFFECT:Init( data )
	self.Ent = data:GetEntity()
	self.Pos = data:GetOrigin()

	self.mat = Material( "sprites/light_glow02_add" )

	self.LifeTime = 0.2
	self.DieTime = CurTime() + self.LifeTime

	sound.Play( "lvs/shield_deflect.ogg", self.Pos, 120, 100, 1 )

	self:Spark( self.Pos )

	if IsValid( self.Ent ) then
		self.Model = ClientsideModel( self.Ent:GetModel(), RENDERMODE_TRANSCOLOR )
		self.Model:SetMaterial("models/alyx/emptool_glow")
		self.Model:SetColor( Color(200,220,255,255) )
		self.Model:SetParent( self.Ent, 0 )
		self.Model:SetMoveType( MOVETYPE_NONE )
		self.Model:SetLocalPos( Vector( 0, 0, 0 ) )
		self.Model:SetLocalAngles( Angle( 0, 0, 0 ) )
		self.Model:AddEffects( EF_BONEMERGE )
	end
end

function EFFECT:Spark( pos )
	local emitter = ParticleEmitter( pos, false )

	for i = 0, 20 do
		local particle = emitter:Add( "sprites/rico1", pos )

		local vel = VectorRand() * 500

		if not particle then continue end

		particle:SetVelocity( vel )
		particle:SetAngles( vel:Angle() + Angle(0,90,0) )
		particle:SetDieTime( math.Rand(0.2,0.4) )
		particle:SetStartAlpha( math.Rand( 200, 255 ) )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(10,20) )
		particle:SetEndSize( 0 )
		particle:SetRoll( math.Rand(-100,100) )
		particle:SetRollDelta( math.Rand(-100,100) )
		particle:SetColor( 0, 127, 255 )

		particle:SetAirResistance( 0 )
	end

	emitter:Finish()
end

function EFFECT:Think()
	if not IsValid( self.Ent ) then
		if IsValid( self.Model ) then
			self.Model:Remove()
		end
	end

	if self.DieTime < CurTime() then
		if IsValid( self.Model ) then
			self.Model:Remove()
		end

		return false
	end

	return true
end

function EFFECT:Render()
	local Scale = (self.DieTime - CurTime()) / self.LifeTime
	render.SetMaterial( self.mat )
	render.DrawSprite( self.Pos, 800 * Scale, 800 * Scale, blue )
	render.DrawSprite( self.Pos, 200 * Scale, 200 * Scale, white )
end

--addons/!lpakr_out/lua/effects/rb655_force_heal.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/sup_gradient_discharge/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/sup_gradient_discharge/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=Angle(116,168,166)local f=ParticleEmitter(b)local g=a:GetEntity()self.frame=(self.frame||0)+1;if!f then return end;for h=0,d,2 do local i=b+c*(d-h)local j=f:Add('particle/snow',i)if j then local k=i-b;local l=k:Angle()j:SetLifeTime(0)j:SetDieTime(0.1)j:SetGravity(Vector(0,0,25))j:SetVelocity(k)j:SetStartSize(3)j:SetEndSize(2+math.abs(math.cos(CurTime()*2))*2)j:SetStartAlpha(15)j:SetEndAlpha(0)e.p=e.p+d*20;e.y=e.y+d*20;j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(l)end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/sup_laser_christmas.lua:
EFFECT.Speed=15000;EFFECT.Length=50;EFFECT.UseModel=false;local a=Color(100,25,25)EFFECT.Colors={Color(161,37,23),Color(40,116,31),Color(54,31,116)}local b=Material'effects/sw_laser_red_main'local c=Material'effects/sw_laser_red_front'local d=Vector()function EFFECT:Init(e)self.StartPos=e:GetStart()self.EndPos=e:GetOrigin()local f=e:GetEntity()if!self.StartPos||!self.EndPos||!IsValid(f)then self.DieTime=0;return end;local g=cvar.GetValue('srp_cosmeticsweapondecals')!=true;f.ChristmasIndex=((f.ChristmasIndex||0)+1)%#self.Colors;self.Color=g&&a||self.Colors[f.ChristmasIndex+1]local h=e:GetAttachment()if IsValid(f)&&h>0 then if f.Owner==LocalPlayer()&&LocalPlayer():GetViewModel()!=LocalPlayer()&&!LocalPlayer():ShouldDrawLocalPlayer()then local i=f.Sequence&&(f.Sequence:find('right')&&MuzzlePosition2||MuzzlePosition)||nil;i=i||f.Akimbo&&(f.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition;self.StartPos=i||self.StartPos else local j=f.Akimbo&&(f.AkimboLeftFire&&h||h+1)||h;local h=f:GetAttachment(j)if h&&h.Pos then self.StartPos=h.Pos else self.DieTime=0;return end end end;if self.StartPos==d||self.EndPos==d then self.DieTime=0;return end;self.Dir=(self.EndPos-self.StartPos):GetNormalized()self:SetRenderBoundsWS(self.StartPos+self.Dir,self.EndPos)self.StartTime=CurTime()self.Distance=self.StartPos:Distance(self.EndPos)self.TracerTime=self.Distance/self.Speed;self.DieTime=self.StartTime+self.TracerTime;local k=EffectData()k:SetOrigin(self.StartPos+self.Dir*10)k:SetNormal(self.Dir)k:SetMagnitude(0)k:SetScale(1)util.Effect('StriderMuzzleFlash',k)end;function EFFECT:Think()if CurTime()>(self.DieTime||0)then return false end;return true end;function EFFECT:Render()if CurTime()>=(self.DieTime||0)then return end;local l=(CurTime()-self.StartTime)/self.TracerTime;if l<0 then return end;if srp.nvg.IsEnabled()then return end;local m=self.StartPos+self.Dir*self.Distance*l;local n=m+self.Dir*(math.random(-10,20)+self.Length)if b then render.SetMaterial(b)render.DrawBeam(m,n,24,0,1,self.Color)end;if c then render.SetMaterial(c)render.DrawSprite(n,24,24,self.Color)end;self.dlight=DynamicLight(self:EntIndex())if self.dlight then self.dlight.pos=n;self.dlight.r=self.Color.r;self.dlight.g=self.Color.g;self.dlight.b=self.Color.b;self.dlight.brightness=2;self.dlight.Decay=2000;self.dlight.Size=700;self.dlight.DieTime=CurTime()+.1 end end
--addons/!lpakr_out/lua/effects/sup_laser_green.lua:
EFFECT.Speed=20000;EFFECT.Length=50;EFFECT.UseModel=false;local a=Material'effects/sw_laser_green_main'local b=Material'effects/sw_laser_green_front'local c=Vector()function EFFECT:Init(d)self.StartPos=d:GetStart()self.EndPos=d:GetOrigin()self.Scale=d:GetScale()if self.Scale==0 then self.Scale=1 end;local e=d:GetEntity()if!self.StartPos||!self.EndPos||!IsValid(e)then self.DieTime=0;return end;local f=d:GetAttachment()if IsValid(e)then if e.Owner==LocalPlayer()&&LocalPlayer():GetViewModel()!=LocalPlayer()&&!LocalPlayer():ShouldDrawLocalPlayer()then local g=e.Sequence&&(e.Sequence:find('right')&&MuzzlePosition2||MuzzlePosition)||nil;g=g||e.Akimbo&&(e.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition;self.StartPos=g||self.StartPos else local h=e.Akimbo&&(e.AkimboLeftFire&&f||f+1)||f;local f=e:GetAttachment(h)if f&&f.Pos then self.StartPos=f.Pos else self.DieTime=0;return end end end;if self.StartPos==c||self.EndPos==c then self.DieTime=0;return end;self.Dir=(self.EndPos-self.StartPos):GetNormalized()self:SetRenderBoundsWS(self.StartPos+self.Dir,self.EndPos)self.StartTime=CurTime()self.Distance=self.StartPos:Distance(self.EndPos)self.TracerTime=self.Distance/(self.Scale*self.Speed)self.DieTime=self.StartTime+self.TracerTime;local i=EffectData()i:SetOrigin(self.StartPos+self.Dir*10)i:SetNormal(self.Dir)i:SetMagnitude(0)i:SetScale(1)util.Effect('StriderMuzzleFlash',i)end;function EFFECT:Think()if CurTime()>self.DieTime then return false end;return true end;function EFFECT:Render()if CurTime()>=self.DieTime then return end;if srp.nvg.IsEnabled()then return end;local j=self.Scale||1;local k=(CurTime()-self.StartTime)/self.TracerTime;if k<0 then return end;local l=self.StartPos+self.Dir*self.Distance*k;local m=l+self.Dir*self.Length*j;if a then render.SetMaterial(a)render.DrawBeam(l,m,j*15,0,1,col.green_dark)end;if b then render.SetMaterial(b)render.DrawSprite(m,j*15,j*15,col.green_dark)end;self.dlight=DynamicLight(self:EntIndex())if self.dlight then self.dlight.pos=m;self.dlight.r=10;self.dlight.g=200;self.dlight.b=10;self.dlight.brightness=2;self.dlight.Decay=2000;self.dlight.Size=500;self.dlight.DieTime=CurTime()+.1 end end
--addons/!lpakr_out/lua/effects/sup_laser_yellow_washed.lua:
EFFECT.Speed=20000;EFFECT.Length=50;EFFECT.UseModel=false;local a=Material'effects/sw_laser_yellow_main'local b=Material'effects/sw_laser_yellow_front'local c=Vector()function EFFECT:Init(d)self.StartPos=d:GetStart()self.EndPos=d:GetOrigin()local e=d:GetEntity()if!self.StartPos||!self.EndPos||!IsValid(e)then self.DieTime=0;return end;local f=d:GetAttachment()if IsValid(e)&&f>0 then if e.Owner==LocalPlayer()&&LocalPlayer():GetViewModel()!=LocalPlayer()&&!LocalPlayer():ShouldDrawLocalPlayer()then local g=e.Sequence&&(e.Sequence:find('right')&&MuzzlePosition2||MuzzlePosition)||nil;g=g||e.Akimbo&&(e.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition;self.StartPos=g||self.StartPos else local h=e.Akimbo&&(e.AkimboLeftFire&&f||f+1)||f;local f=e:GetAttachment(h)if f&&f.Pos then self.StartPos=f.Pos else self.DieTime=0;return end end end;if self.StartPos==c||self.EndPos==c then self.DieTime=0;return end;self.Dir=(self.EndPos-self.StartPos):GetNormalized()self:SetRenderBoundsWS(self.StartPos+self.Dir,self.EndPos)self.StartTime=CurTime()self.Distance=self.StartPos:Distance(self.EndPos)self.TracerTime=self.Distance/self.Speed;self.DieTime=self.StartTime+self.TracerTime;local i=EffectData()i:SetOrigin(self.StartPos+self.Dir*10)i:SetNormal(self.Dir)i:SetMagnitude(0)i:SetScale(1)util.Effect('StriderMuzzleFlash',i)end;function EFFECT:Think()if CurTime()>self.DieTime then return false end;return true end;function EFFECT:Render()if CurTime()>=self.DieTime then return end;local j=(CurTime()-self.StartTime)/self.TracerTime;if j<0 then return end;local k=self.StartPos+self.Dir*self.Distance*j;local l=k+self.Dir*self.Length;if a then render.SetMaterial(a)render.DrawBeam(k,l,15,0,1,col.yellow)end;if b then render.SetMaterial(b)render.DrawSprite(l,15,15,col.yellow)end;if srp.nvg.IsEnabled()then return end;self.dlight=DynamicLight(self:EntIndex())if self.dlight then self.dlight.pos=l;self.dlight.r=255;self.dlight.g=215;self.dlight.b=0;self.dlight.brightness=2;self.dlight.Decay=2000;self.dlight.Size=200;self.dlight.DieTime=CurTime()+.1 end end
--addons/!lpakr_out/lua/effects/wos_corrupted_burn/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/wos_unstable_discharge_alt/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/chatbox/vgui/emotelist_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/notifications/notifications_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/sitrequests/sitsync_sh.lua:
ba.sitsync=ba.sitsync||{}ba.sitsync.Cache=ba.sitsync.Cache||{}ba.sitsync.ServerNetRef={}ba.sitsync.ServerNetNum={}ba.sitsync.Servers={{"Danktown","rp.superiorservers.co"},{"C18","rp2.superiorservers.co"},{"Clonewars","cwrp.superiorservers.co"},{"Clonewars 2","cwrp2.superiorservers.co"},{"Clonewars 3","cwrp3.superiorservers.co"}}for a,b in ipairs(ba.sitsync.Servers)do b.ID=b[1]b.IP=b[2]b.Name=b[3]||b[1]ba.sitsync.ServerNetRef[a-1]=b;ba.sitsync.ServerNetNum[b.ID]=a-1 end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/ui/menu_ui.lua:
--