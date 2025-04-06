--Stealed clientside server code by exechack.cc
--Hostname: !💠⇛SuperiorServers.co - CWRP - UPDATED MAP & CONTENT! - Part 9/12 - 06/04/2025


--PATH addons/gpakr_out/lua/gpakr/me3fix-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/me3fix-3400179048.bsp',FileName='me3fix',CRC='3714341732',Len=29249995,ShouldLoad=true}
--addons/!lpakr_out/lua/dash/extensions/client/player.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/extensions/client/string.lua:
local a=' 'local b='\n'local function c(d,e,f,g)local h=#d;local i;for j=1,h do if j==h then if i then local k=surface.GetTextSize(d)if k>f then table.insert(g,string.sub(d,1,i))table.insert(g,string.sub(d,i+1))else table.insert(g,d)end else table.insert(g,d)end elseif d[j]==a then local l=string.sub(d,1,j)local k=surface.GetTextSize(l)if k>f then local m=i&&i||j;local n=string.sub(d,1,m)table.insert(g,n)m=m+1;if h!=m then c(string.sub(d,m),e,f,g)end;break end;i=j end end end;function string.Wrap(d,e,f)surface.SetFont(e)local g={}local o=1;for j=1,#d do if d[j]==b then local p=string.sub(d,o,j-1)local q=surface.GetTextSize(p)if q>f then c(p,e,f,g)else table.insert(g,p)end;o=j+1 end end;c(string.sub(d,o),e,f,g)return g end
--addons/!lpakr_out/lua/areatrigger/init_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/libraries/client/texture.lua:
require'hash'texture={}local a={__tostring=function(self)return self.Name end}a.__index=a;a.__concat=a.__tostring;RegisterMetaTable('Texture',a)local b={}local c='https://YOUR_SITE.COM/?url=%s&width=%i&height=%i&format=%s'if!file.IsDir('texture','DATA')then file.CreateDir'texture'else local d=file.Find('texture/*','DATA')if#d>1000 then for e,f in ipairs(d)do file.Delete('texture/'..f)end end end;function texture.Create(g)local h=setmetatable({Name=g,URL='',Width=1000,Height=1000,Busy=false,Cache=true,Proxy=true,Format='jpg',PngParameters='smooth'},a)b[g]=h;return h end;function texture.Get(g)if b[g]then return b[g]:GetMaterial()end end;function texture.Delete(g)b[g]=nil end;function texture.SetProxy(i)c=i end;function a:SetSize(j,k)self.Width,self.Height=j,k;return self end;function a:SetFormat(l)self.Format=l;return self end;function a:SetPngParameters(m)self.PngParameters=m;return self end;function a:EnableCache(n)self.Cache=n;return self end;function a:EnableProxy(n)self.Proxy=n;return self end;function a:GetName()return self.Name end;function a:GetUID(o)if!self.UID||o then self.UID=hash.MD5(self.Name..self.URL..self.Width..self.Height..self.Format)end;return self.UID end;function a:GetSize()return self.Width,self.Height end;function a:GetFormat()return self.Format end;function a:GetURL()return self.URL end;function a:GetFile()return self.File end;function a:GetMaterial()return self.IMaterial end;function a:GetError()return self.Error end;function a:IsBusy()return self.Busy==true end;function a:Download(i,p,q)if self.Name==nil then self.Name='Web Material: '..i end;self.URL=i;self.File='texture/'..self:GetUID()..'.png'if self.Cache&&file.Exists(self.File,'DATA')then self.IMaterial=Material('data/'..self.File,self.PngParameters)if p then p(self,self.IMaterial)end else self.Busy=true;http.Fetch(self.Proxy&&string.format(c,i:URLEncode(),self.Width,self.Height,self.Format)||i,function(r,s,t,u)if self.Cache then file.Write(self.File,r)self.IMaterial=Material('data/'..self.File,self.PngParameters)else local v='texture/tmp_'..os.time()..'_'..self:GetUID()..'.png'file.Write(v,r)self.IMaterial=Material('data/'..v,self.PngParameters)timer.Simple(1,function()file.Delete(v)end)end;if p then p(self,self.IMaterial)end;self.Busy=false end,function(w)self.Error=w;if q then q(self,self.Error)end;self.Busy=false end)end;return self end;function a:RenderManual(x,y)local z='texture/'..self:GetUID()..'-render.png'if self.Cache&&file.Exists(z,'DATA')then self.File=z;self.IMaterial=Material('data/'..self.File,self.PngParameters)if y then y(self,self.IMaterial)end else local j,k=self.Width,self.Height;local A='texture.PostRender'..self:GetUID()hook.Add('PostRender',A,function()if gui.IsGameUIVisible()then return end;hook.Remove('PostRender',A)local B=GetRenderTarget(self:GetName(),j,k,true)render.PushRenderTarget(B,0,0,j,k)render.OverrideAlphaWriteEnable(true,true)surface.DisableClipping(true)render.ClearDepth()render.Clear(0,0,0,0)cam.Start2D()x(self,j,k)cam.End2D()if self.Cache then self.File='texture/'..self:GetUID()..'-render.png'file.Write(self.File,render.Capture({format='png',quality=100,x=0,y=0,h=k,w=j}))end;surface.DisableClipping(false)render.OverrideAlphaWriteEnable(false)render.PopRenderTarget()if self.Cache then self.IMaterial=Material('data/'..self.File)end;if y then y(self,self.IMaterial)end end)end;return self end;function a:Render(x,y)return self:RenderManual(function(self,j,k)cam.Start2D()x(self,j,k)cam.End2D()end,y)end
--addons/!lpakr_out/lua/ui/util.lua:
surface.CreateFont('ui.74',{font='roboto',size=60,weight=700})surface.CreateFont('ui.72',{font='roboto',size=60,weight=700})surface.CreateFont('ui.60',{font='roboto',size=60,weight=700})surface.CreateFont('ui.46',{font='roboto',size=40,weight=600})surface.CreateFont('ui.40',{font='roboto',size=40,weight=500})surface.CreateFont('ui.39',{font='roboto',size=39,weight=500})surface.CreateFont('ui.38',{font='roboto',size=38,weight=500})surface.CreateFont('ui.37',{font='roboto',size=37,weight=500})surface.CreateFont('ui.36',{font='roboto',size=36,weight=500})surface.CreateFont('ui.35',{font='roboto',size=35,weight=500})surface.CreateFont('ui.34',{font='roboto',size=34,weight=500})surface.CreateFont('ui.33',{font='roboto',size=33,weight=500})surface.CreateFont('ui.32',{font='roboto',size=32,weight=500})surface.CreateFont('ui.31',{font='roboto',size=31,weight=500})surface.CreateFont('ui.30',{font='roboto',size=30,weight=500})surface.CreateFont('ui.29',{font='roboto',size=29,weight=500})surface.CreateFont('ui.28',{font='roboto',size=28,weight=500})surface.CreateFont('ui.27',{font='roboto',size=27,weight=400})surface.CreateFont('ui.26',{font='roboto',size=26,weight=400})surface.CreateFont('ui.25',{font='roboto',size=25,weight=400})surface.CreateFont('ui.24',{font='roboto',size=24,weight=400})surface.CreateFont('ui.23',{font='roboto',size=23,weight=400})surface.CreateFont('ui.22',{font='roboto',size=22,weight=400})surface.CreateFont('ui.20',{font='roboto',size=20,weight=400})surface.CreateFont('ui.19',{font='roboto',size=19,weight=400})surface.CreateFont('ui.18',{font='roboto',size=18,weight=400})surface.CreateFont('ui.17',{font='roboto',size=17,weight=550})surface.CreateFont('ui.16',{font='roboto',size=16,weight=550})surface.CreateFont('ui.15',{font='roboto',size=15,weight=550})surface.CreateFont('ui.14',{font='roboto',size=14,weight=550})surface.CreateFont('ui.12',{font='roboto',size=12,weight=550})surface.CreateFont('ui.10',{font='roboto',size=10,weight=550})surface.CreateFont('ui.5percent',{font='Roboto',size=math.ceil(ScrH()*0.05),weight=500,antialias=true})surface.CreateFont('ForkAwesome',{font='forkawesome',size=18,extended=true,symbol=true})surface.CreateFont('ForkAwesome.12',{font='forkawesome',size=12,extended=true,symbol=true})surface.CreateFont('ForkAwesome.24',{font='forkawesome',size=24,extended=true,symbol=true})local a={['DTextEntry']=function(self,b)self:SetFont('ui.20')end,['DNumberWang']=function(self,b)self:SetFont('ui.20')end,['DLabel']=function(self,b)self:SetFont('ui.22')self:SetColor(ui.col.White)end,['DComboBox']=function(self,b)self:SetFont('ui.22')end}function ui.Create(c,d,b)local e;if!isfunction(d)&&d!=nil then e=d elseif!isfunction(b)&&b!=nil then e=b end;local f=vgui.Create(c,e)f:SetSkin('SUP')f.pnlTooltipPanelOverride='ui_tooltip'if a[c]then a[c](f,e)end;if isfunction(d)then d(f,e)elseif isfunction(b)then b(f,d)end;return f end;function ui.Label(g,h,i,j,e)return ui.Create('DLabel',function(self,b)self:SetText(g)self:SetFont(h)self:SetTextColor(ui.col.White)self:SetPos(i,j)self:SizeToContents()self:SetWrap(true)self:SetAutoStretchVertical(true)end,e)end;function ui.DermaMenu(k,e)if!k then CloseDermaMenus()end;return ui.Create("DMenu",function(self)self:SetTall(30)end,e)end;function ui.BoolRequest(l,n,o)local m=ui.Create('ui_frame',function(self)self:SetTitle(l)self:ShowCloseButton(false)self:SetWide(ScrW()*.2)self:MakePopup()end)local g=string.Wrap(n,'ui.18',m:GetWide()-10)local j=m:GetTitleHeight()for p,f in ipairs(g)do local q=ui.Create('DLabel',function(self,b)self:SetText(f)self:SetFont('ui.18')self:SizeToContents()self:SetPos((b:GetWide()-self:GetWide())/2,j)j=j+self:GetTall()+5 end,m)end;local r=ui.Create('ui_button',function(self,b)self:SetText('Yes')self:SetPos(5,j)self:SetSize(b:GetWide()/2-7.5,25)self.DoClick=function(s)b:Close()o(true)end end,m)local t=ui.Create('ui_button',function(self,b)self:SetText('No')self:SetPos(r:GetWide()+10,j)self:SetSize(r:GetWide(),25)self:RequestFocus()self.DoClick=function(s)b:Close()o(false)end;j=j+self:GetTall()+5 end,m)m:SetTall(j)m:Center()m:Focus()return m end;function ui.StringRequest(l,n,u,o)local m=ui.Create('ui_frame',function(self)self:SetTitle(l)self:ShowCloseButton(false)self:SetWide(ScrW()*.3)self:MakePopup()end)local g=string.Wrap(n,'ui.18',m:GetWide()-10)local j=m:GetTitleHeight()for p,f in ipairs(g)do local q=ui.Create('DLabel',function(self,b)self:SetText(f)self:SetFont('ui.18')self:SizeToContents()self:SetPos((b:GetWide()-self:GetWide())/2,j)j=j+self:GetTall()end,m)end;local v=ui.Create('DTextEntry',function(self,b)self:SetPos(5,j+5)self:SetSize(b:GetWide()-10,25)self:SetValue(u||'')j=j+self:GetTall()+10;self.OnEnter=function(s)b:Close()o(self:GetValue())end end,m)local r=ui.Create('ui_button',function(self,b)self:SetText('Okay')self:SetPos(5,j)self:SetSize(b:GetWide()/2-7.5,25)self.DoClick=function(s)b:Close()o(v:GetValue())end end,m)local t=ui.Create('ui_button',function(self,b)self:SetText('Cancel')self:SetPos(r:GetWide()+10,j)self:SetSize(r:GetWide(),25)self:RequestFocus()self.DoClick=function(s)m:Close()end;j=j+self:GetTall()+5 end,m)m:SetTall(j)m:Center()m:Focus()return m end;function ui.PlayerRequest(w,o)if isfunction(w)then o=w;w=nil end;local x=ui.Create('ui_frame',function(self)self:SetTitle('Choose a player')self:SetSize(.2,.3)self:Center()self:MakePopup()end)ui.Create('ui_playerrequest',function(self,b)self:DockToFrame()if w then self:SetPlayers(w)else self:ShowAllPlayers()end;self.OnSelection=function(self,y,z)x:Close()o(z)end end,x)x:Focus()return m end;function ui.ListRequest(l,A,o)local x=ui.Create('ui_frame',function(self)self:SetTitle(l)self:SetSize(.2,.3)self:Center()self:MakePopup()end)ui.Create('ui_listrequest',function(self,b)self:DockToFrame()self:SetOptions(A)self.OnSelection=function(self,y,B)x:Close()o(B)end end,x)x:Focus()return x end;function ui.NumberRequest(l,n,u,C,D,o)local m=ui.Create('ui_frame',function(self)self:SetTitle(l)self:ShowCloseButton(false)self:SetWide(ScrW()*.3)self:MakePopup()end)local g=string.Wrap(n,'ui.18',m:GetWide()-10)local j=m:GetTitleHeight()for p,f in ipairs(g)do local q=ui.Create('DLabel',function(self,b)self:SetText(f)self:SetFont('ui.18')self:SizeToContents()self:SetPos((b:GetWide()-self:GetWide())/2,j)j=j+self:GetTall()end,m)end;local v=ui.Create('DNumberWang',function(self,b)self:SetTall(25)self:SizeToContentsX()surface.SetFont(self:GetFont())local E,F=surface.GetTextSize(D)self:SetWide(math.min(self:GetWide()+E,b:GetWide()-10))self:SetPos(b:GetWide()*0.5-self:GetWide()*0.5,j+5)self:SetMinMax(C,D)self:SetValue(u)j=j+self:GetTall()+10;self.OnEnter=function(s)b:Close()o(math.Clamp(tonumber(self:GetValue()),C,D))end end,m)local r=ui.Create('ui_button',function(self,b)self:SetText('Okay')self:SetPos(5,j)self:SetSize(b:GetWide()/2-7.5,25)self.DoClick=function(s)b:Close()o(math.Clamp(tonumber(v:GetValue()),C,D))end end,m)local t=ui.Create('ui_button',function(self,b)self:SetText('Cancel')self:SetPos(r:GetWide()+10,j)self:SetSize(r:GetWide(),25)self:RequestFocus()self.DoClick=function(s)m:Close()end;j=j+self:GetTall()+5 end,m)m:SetTall(j)m:Center()m:Focus()return m end;function ui.ColorRequest(l,n,G,H,o)local m=ui.Create('ui_frame',function(self)self:SetTitle(l)self:ShowCloseButton(false)self:SetWide(ScrW()*.3)self:MakePopup()end)local g=string.Wrap(n,'ui.18',m:GetWide()-10)local j=m:GetTitleHeight()for p,f in ipairs(g)do local q=ui.Create('DLabel',function(self,b)self:SetText(f)self:SetFont('ui.18')self:SizeToContents()self:SetPos((b:GetWide()-self:GetWide())/2,j)j=j+self:GetTall()end,m)end;local I=ui.Create('DColorMixer',function(self,b)self:SetSize(b:GetWide()-10,300)self:SetPos(b:GetWide()*0.5-self:GetWide()*0.5,j+5)self:SetColor(G)self:SetAlphaBar(H)j=j+self:GetTall()+10 end,m)local r=ui.Create('ui_button',function(self,b)self:SetText('Okay')self:SetPos(5,j)self:SetSize(b:GetWide()/2-7.5,25)self.DoClick=function(s)b:Close()o(setmetatable(I:GetColor(),COLOR))end end,m)local t=ui.Create('ui_button',function(self,b)self:SetText('Cancel')self:SetPos(r:GetWide()+10,j)self:SetSize(r:GetWide(),25)self:RequestFocus()self.DoClick=function(s)m:Close()end;j=j+self:GetTall()+5 end,m)m:SetTall(j)m:Center()m:Focus()end;function ui.OpenURL(J,l)local E,K=ScrW()*.9,ScrH()*.9;local x=ui.Create('ui_frame',function(self)self:SetSize(E,K)self:SetTitle(J)self:Center()self:MakePopup()end)ui.Create('HTML',function(self)self:SetPos(5,32)self:SetSize(E-10,K-37)self:OpenURL(J)end,x)return x end
--addons/!lpakr_out/lua/ui/controls/imagebutton.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/core/util/string_sh.lua:
ba.str=ba.str||{}function ba.str.Quotify(a)return'"'..a..'"'end;function ba.str.FormatTime(b)if!b then return'N/A'end;local c=math.floor(b/3600)local d=math.floor(b%3600/60)local e=math.floor(b-c*3600-d*60)if d<10 then d='0'..d end;if e<10 then e='0'..e end;return c..':'..d..':'..e end
--addons/!lpakr_out/lua/badmin/core/ranks/auth_sh.lua:
term.Add('AdminPasswordTooShort','The reset key must be at least # characters long.')term.Add('AdminPasswordReset','# has reset #\'s admin password')term.Add('AdminPasswordRequest','Please enter your password.')term.Add('AdminPasswordResetRequest','Please set a new password.')term.Add('AdminPasswordIsReset','Your password has been reset.')term.Add('AdminPasswordSet','Your password has been set.')term.Add('AdminNowAuthenticated','You\'re now authenticated.')term.Add('AdminPasswordIncorrect','That password was incorrect.')term.Add('AdminPasswordResetCodeIncorrect','That reset code was incorrect.')
--addons/!lpakr_out/lua/badmin/core/ui/vgui/ba_player.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/chatbox2/_module.lua:
ba.Module'Chatbox 2.0':Author'aStonedPenguin':CustomCheck(function()return info&&info.Dev==true end):Include{'init_cl.lua','emotes_cl.lua','vgui/chatline_cl.lua'}
--addons/!lpakr_out/lua/badmin/modules/player_blocking/_module.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/rewards/_module.lua:
ba.Module'Player Rewards':Author'aStonedPenguin & KingofBeast':Include{'init_cl.lua','init_sv.lua'}
--addons/!lpakr_out/lua/drgbase/nextbots.lua:
function DrGBase.AddNextbot(a)local b=string.Replace(a.Folder,"entities/","")if a.PrintName==nil||a.Category==nil then return false end;for c,d in ipairs(a.Models||{})do if!isstring(d)then continue end;util.PrecacheModel(d)end;for c,e in ipairs({a.OnSpawnSounds,a.OnIdleSounds,a.OnDamageSounds,a.OnDeathSounds})do if!istable(e)then continue end;for f,g in ipairs(e)do if!isstring(g)then continue end;util.PrecacheSound(g)end end;if CLIENT then language.Add(b,a.PrintName)a.Killicon=a.Killicon||{icon="HUD/killicons/default",color=Color(255,80,0,255)}killicon.Add(b,a.Killicon.icon,a.Killicon.color)else for c,h in ipairs(ents.FindByClass(b))do if!h.IsDrGNextbot then continue end;h:Timer(0,function()if isfunction(a.OnTraceAttack)then h:DrG_AddListener("OnTraceAttack",h._HandleTraceAttack)end;if isfunction(a.OnNavAreaChanged)then h:DrG_AddListener("OnNavAreaChanged",h._HandleNavAreaChanged)end;if isfunction(a.OnLeaveGround)then h:DrG_AddListener("OnLeaveGround",h._HandleLeaveGround)end;if isfunction(a.OnLandOnGround)then h:DrG_AddListener("OnLandOnGround",h._HandleLandOnGround)end end)end end;local i={Name=a.PrintName,Class=b,Category=a.Category}if a.Spawnable!=false then list.Set("NPC",b,i)list.Set("DrGBaseNextbots",b,i)end;DrGBase.Print("Nextbot '"..b.."': loaded.")return true end;DrGBase._SpawnedNextbots=DrGBase._SpawnedNextbots||{}function DrGBase.GetNextbots()return DrGBase._SpawnedNextbots end;DrGBase.DefaultFootsteps={[MAT_ANTLION]={"physics/flesh/flesh_impact_hard1.wav","physics/flesh/flesh_impact_hard2.wav","physics/flesh/flesh_impact_hard3.wav","physics/flesh/flesh_impact_hard4.wav","physics/flesh/flesh_impact_hard5.wav","physics/flesh/flesh_impact_hard6.wav"},[MAT_BLOODYFLESH]={"physics/flesh/flesh_squishy_impact_hard1.wav","physics/flesh/flesh_squishy_impact_hard2.wav","physics/flesh/flesh_squishy_impact_hard3.wav","physics/flesh/flesh_squishy_impact_hard4.wav"},[MAT_CONCRETE]={"player/footsteps/concrete1.wav","player/footsteps/concrete2.wav","player/footsteps/concrete3.wav","player/footsteps/concrete4.wav"},[MAT_DIRT]={"player/footsteps/dirt1.wav","player/footsteps/dirt2.wav","player/footsteps/dirt3.wav","player/footsteps/dirt4.wav"},[MAT_EGGSHELL]={"physics/flesh/flesh_impact_hard1.wav","physics/flesh/flesh_impact_hard2.wav","physics/flesh/flesh_impact_hard3.wav","physics/flesh/flesh_impact_hard4.wav","physics/flesh/flesh_impact_hard5.wav","physics/flesh/flesh_impact_hard6.wav"},[MAT_FLESH]={"physics/flesh/flesh_impact_hard1.wav","physics/flesh/flesh_impact_hard2.wav","physics/flesh/flesh_impact_hard3.wav","physics/flesh/flesh_impact_hard4.wav","physics/flesh/flesh_impact_hard5.wav","physics/flesh/flesh_impact_hard6.wav"},[MAT_GRATE]={"player/footsteps/chainlink1.wav","player/footsteps/chainlink2.wav","player/footsteps/chainlink3.wav","player/footsteps/chainlink4.wav"},[MAT_ALIENFLESH]={"physics/flesh/flesh_impact_hard1.wav","physics/flesh/flesh_impact_hard2.wav","physics/flesh/flesh_impact_hard3.wav","physics/flesh/flesh_impact_hard4.wav","physics/flesh/flesh_impact_hard5.wav","physics/flesh/flesh_impact_hard6.wav"},[MAT_SNOW]={"player/footsteps/grass1.wav","player/footsteps/grass2.wav","player/footsteps/grass3.wav","player/footsteps/grass4.wav"},[MAT_PLASTIC]={"physics/plastic/plastic_box_impact_soft1.wav","physics/plastic/plastic_box_impact_soft2.wav","physics/plastic/plastic_box_impact_soft3.wav","physics/plastic/plastic_box_impact_soft4.wav"},[MAT_METAL]={"player/footsteps/metal1.wav","player/footsteps/metal2.wav","player/footsteps/metal3.wav","player/footsteps/metal4.wav"},[MAT_SAND]={"player/footsteps/sand1.wav","player/footsteps/sand2.wav","player/footsteps/sand3.wav","player/footsteps/sand4.wav"},[MAT_FOLIAGE]={"player/footsteps/grass1.wav","player/footsteps/grass2.wav","player/footsteps/grass3.wav","player/footsteps/grass4.wav"},[MAT_COMPUTER]={"player/footsteps/metal1.wav","player/footsteps/metal2.wav","player/footsteps/metal3.wav","player/footsteps/metal4.wav"},[MAT_SLOSH]={"player/footsteps/slosh1.wav","player/footsteps/slosh2.wav","player/footsteps/slosh3.wav","player/footsteps/slosh4.wav"},[MAT_TILE]={"player/footsteps/tile1.wav","player/footsteps/tile2.wav","player/footsteps/tile3.wav","player/footsteps/tile4.wav"},[MAT_GRASS]={"player/footsteps/grass1.wav","player/footsteps/grass2.wav","player/footsteps/grass3.wav","player/footsteps/grass4.wav"},[MAT_VENT]={"player/footsteps/duct1.wav","player/footsteps/duct2.wav","player/footsteps/duct3.wav","player/footsteps/duct4.wav"},[MAT_WOOD]={"player/footsteps/wood1.wav","player/footsteps/wood2.wav","player/footsteps/wood3.wav","player/footsteps/wood4.wav"},[MAT_DEFAULT]={"player/footsteps/concrete1.wav","player/footsteps/concrete2.wav","player/footsteps/concrete3.wav","player/footsteps/concrete4.wav"},[MAT_GLASS]={"physics/glass/glass_sheet_step1.wav","physics/glass/glass_sheet_step2.wav","physics/glass/glass_sheet_step3.wav","physics/glass/glass_sheet_step4.wav"},[MAT_WARPSHIELD]={"physics/glass/glass_sheet_step1.wav","physics/glass/glass_sheet_step2.wav","physics/glass/glass_sheet_step3.wav","physics/glass/glass_sheet_step4.wav"}}
--addons/!lpakr_out/lua/drgbase/meta/entity.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/meta/vector.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/modules/util.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/receiver.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/receiver.lua:
if SERVER then else net.Receive("dronesrewrite_updcam",function()DRONES_REWRITE.UpdateCamera()end)net.Receive("dronesrewrite_playsound",function()local a=net.ReadString()surface.PlaySound(a)end)net.Receive("dronesrewrite_doprecache",function()DRONES_REWRITE.DoPrecache()end)net.Receive("dronesrewrite_closeconsole",function()local b=net.ReadEntity()if!IsValid(b)then return end;b:CloseWindow()end)net.Receive("dronesrewrite_opencontroller",function()local b=net.ReadEntity()if!IsValid(b)then return end;b:OpenMenu()end)net.Receive("dronesrewrite_clearconsole",function()local b=net.ReadEntity()if!IsValid(b)then return end;b.Cache={}end)net.Receive("dronesrewrite_openconsole",function()local b=net.ReadEntity()if!IsValid(b)then return end;b:OpenConsole()end)net.Receive("dronesrewrite_addline",function()local b=net.ReadEntity()local c=net.ReadString()local d=net.ReadColor()if!IsValid(b)then return end;if!b.AddLine then return end;b:AddLine(c,d)end)net.Receive("dronesrewrite_removehook",function()local e=net.ReadEntity()local f=net.ReadString()local a=net.ReadString()if!IsValid(e)then return end;e:RemoveHook(f,a)end)net.Receive("dronesrewrite_addhook",function()local e=net.ReadEntity()local f=net.ReadString()local a=net.ReadString()local g=net.ReadString()if!IsValid(e)then return end;if!e.AddHook then return end;e:AddHook(f,a,g)end)end
--addons/!lpakr_out/lua/dronesrewrite/properties.lua:
properties.Add("drr-openupgr",{MenuLabel="Upgrades and Modules",MenuIcon="icon16/cog.png",Filter=function(self,a,b)return a.IS_DRR end,Action=function(self,a)a:OpenUpgradesMenu()end})properties.Add("drr-openweps",{MenuLabel="Add / Remove weapons",MenuIcon="icon16/add.png",Filter=function(self,a,b)return a.IS_DRR end,Action=function(self,a)a:CallWeaponsMenu()end})properties.Add("drr-openbinds",{MenuLabel="Add additional weapons' keys",MenuIcon="icon16/key_add.png",Filter=function(self,a,b)return a.IS_DRR end,Action=function(self,a)a:CallBindMenu()end})properties.Add("drr-openguide",{MenuLabel="Drones Help",MenuIcon="icon16/book.png",Filter=function(self,a,b)return a.IS_DRR end,Action=function(self,a)DRONES_REWRITE.ShowHelpWindow("F.A.Q.")end})
--addons/!lpakr_out/lua/dronesrewrite/client/vgui.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/client/overlay/scifi.lua:
DRONES_REWRITE.Overlay["Sci Fi"]=function(a)local b={["$pp_colour_addr"]=0,["$pp_colour_addg"]=0.1,["$pp_colour_addb"]=0.1,["$pp_colour_brightness"]=-0.25,["$pp_colour_contrast"]=1.2,["$pp_colour_colour"]=0.25,["$pp_colour_mulr"]=0,["$pp_colour_mulg"]=0,["$pp_colour_mulb"]=0}DrawColorModify(b)DrawBloom(0.5,1,1,1,1,1,1,1,1)DrawSharpen(2,0.5)end
--addons/!lpakr_out/lua/autorun/firework_color_proxy.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/gs_sh_player.lua:
return lpakr()()
--addons/!lpakr_out/lua/vgui/stackercontrolpresets.lua:
return lpakr()()
--addons/ssrp_lfs/lua/lvs_framework/autorun/sh_pod.lua:

local meta = FindMetaTable( "Vehicle" )

if CLIENT then
	function meta:GetCameraHeight()
		if not self._lvsCamHeight then
			self._lvsCamHeight = 0

			net.Start("lvs_camera")
				net.WriteEntity( self )
			net.SendToServer()
		end

		return self._lvsCamHeight
	end

	function meta:SetCameraHeight( newheight )
		self._lvsCamHeight = newheight
	end

	function meta:lvsGetWeapon()
		if self._lvsWeaponEntChecked then
			return self._lvsWeaponEnt
		end

		local found = false

		for _, ent in ipairs( self:GetChildren() ) do
			if not ent.LVS_GUNNER then continue end

			self._lvsWeaponEntChecked = true
			self._lvsWeaponEnt = ent

			found = true

			break
		end

		return found and self._lvsWeaponEnt or NULL
	end

	net.Receive( "lvs_select_weapon", function( length)
		local ply = LocalPlayer()
		local vehicle = ply:lvsGetVehicle()

		if not IsValid( vehicle ) or vehicle:GetDriver() ~= ply then return end

		vehicle._SelectActiveTime = CurTime() + 2
	end)

	net.Receive( "lvs_camera", function( length, ply )
		local pod = net.ReadEntity()

		if not IsValid( pod ) then return end

		pod:SetCameraHeight( net.ReadFloat() )
	end)

	return
end

function meta:GetCameraHeight()
	return (self._lvsCamHeight or 0)
end

util.AddNetworkString( "lvs_select_weapon" )
util.AddNetworkString( "lvs_camera" )

net.Receive( "lvs_select_weapon", function( length, ply )
	if not IsValid( ply ) then return end

	local ID = net.ReadInt( 5 )
	local Increment = net.ReadBool()

	local base = ply:lvsGetWeaponHandler()

	if not IsValid( base ) then return end

	if Increment then
		base:SelectWeapon( base:GetSelectedWeapon() + ID )
	else
		base:SelectWeapon( ID )
	end
end, false)

net.Receive( "lvs_camera", function( length, ply )
	if not IsValid( ply ) then return end

	local pod = net.ReadEntity()

	if not IsValid( pod ) then return end

	net.Start("lvs_camera")
		net.WriteEntity( pod )
		net.WriteFloat( pod:GetCameraHeight() )
	net.Send( ply )
end)

function meta:SetCameraHeight( newheight )
	self._lvsCamHeight = newheight

	net.Start("lvs_camera")
		net.WriteEntity( self )
		net.WriteFloat( newheight )
	net.Broadcast()
end

function meta:lvsAddWeapon( ID )
	if IsValid( self._lvsWeaponEnt ) then
		return self._lvsWeaponEnt
	end

	local weapon = ents.Create( "lvs_base_gunner" )

	if not IsValid( weapon ) then return NULL end

	weapon:SetPos( self:LocalToWorld( Vector(0,0,33.182617) ) ) -- location exactly where ply:GetShootPos() is. This will make AI-Tracing easier.
	weapon:SetAngles( self:LocalToWorldAngles( Angle(0,90,0) ) )
	weapon:SetOwner( self )
	weapon:Spawn()
	weapon:Activate()
	weapon:SetParent( self )
	weapon:SetPodIndex( ID )
	weapon:SetDriverSeat( self )

	self._lvsWeaponEnt = weapon

	weapon:SetSelectedWeapon( 1 )

	return weapon
end

function meta:lvsGetWeapon()
	return self._lvsWeaponEnt
end
--addons/!lpakr_out/lua/autorun/pac_core_init.lua:
if CLIENT&&pac&&!VLL_CURR_FILE&&!VLL2_FILEDEF then return end;if CLIENT then if pac&&pac.Panic then ProtectedCall(pac.Panic)end;include("pac3/core/client/init.lua")end
--addons/!lpakr_out/lua/pac3/core/client/class.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/class.lua:
local ipairs=ipairs;local a=table.insert;local isnumber=isnumber;local tonumber=tonumber;local isstring=isstring;local tostring=tostring;local b=table.Merge;local istable=istable;local pac=pac;local setmetatable=setmetatable;pac.PartTemplates=pac.PartTemplates||{}pac.VariableOrder={}pac.GroupOrder=pac.GroupOrder||{}do local c={}c.__index=c;function c:StartStorableVars()self.store=true;self.group=nil;return self end;function c:EndStorableVars()self.store=false;self.group=nil;return self end;function c:GetPropData(d)return self.PropertyUserdata&&self.PropertyUserdata[d]||nil end;function c:PropData(d)self.PropertyUserdata=self.PropertyUserdata||{}self.PropertyUserdata[d]=self.PropertyUserdata[d]||{}return self.PropertyUserdata[d]end;function c:StoreProp(d)self.PART.StorableVars=self.PART.StorableVars||{}self.PART.StorableVars[d]=d end;function c:RemoveProp(d)self.PropertyUserdata=self.PropertyUserdata||{}self.PropertyUserdata[d]=nil;self.PART.StorableVars=self.PART.StorableVars||{}self.PART.StorableVars[d]=nil end;local function e(f,d)for g,h in ipairs(f)do if h==d then return end end;a(f,d)end;function c:SetPropertyGroup(i)local f=self.PART;self.group=i;if f then pac.GroupOrder[f.ClassName]=pac.GroupOrder[f.ClassName]||{}e(pac.GroupOrder[f.ClassName],i)end;pac.GroupOrder.none=pac.GroupOrder.none||{}e(pac.GroupOrder.none,i)return self end;function c:PropertyOrder(d)local f=self.PART;pac.VariableOrder[f.ClassName]=pac.VariableOrder[f.ClassName]||{}e(pac.VariableOrder[f.ClassName],d)if self.group then self:PropData(d).group=self.group end;return self end;function c:GetSet(d,j,k)local f=self.PART;pac.VariableOrder[f.ClassName]=pac.VariableOrder[f.ClassName]||{}e(pac.VariableOrder[f.ClassName],d)if isnumber(j)then f["Set"..d]=f["Set"..d]||function(self,l)self[d]=tonumber(l)end;f["Get"..d]=f["Get"..d]||function(self)return tonumber(self[d])end elseif isstring(j)then f["Set"..d]=f["Set"..d]||function(self,l)self[d]=tostring(l)end;f["Get"..d]=f["Get"..d]||function(self)return tostring(self[d])end else f["Set"..d]=f["Set"..d]||function(self,l)self[d]=l end;f["Get"..d]=f["Get"..d]||function(self)return self[d]end end;f[d]=j;if k then b(self:PropData(d),k)end;if self.store then self:StoreProp(d)end;if self.group then self:PropData(d).group=self.group end;return self end;function c:GetSetPart(d,k)k=k||{}k.editor_panel=k.editor_panel||"part"k.part_key=d;local m=self.PART;self:GetSet(d.."UID","",k)m["Set"..d.."UID"]=function(self,n)if n==""||!n then self["Set"..d](self,NULL)self[d.."UID"]=""return end;if istable(n)then n=n.UniqueID end;self[d.."UID"]=n;local o=self:GetPlayerOwnerId()local p=pac.GetPartFromUniqueID(o,n)if p:IsValid()then if p==self then p=NULL;self[d.."UID"]=""end;self["Set"..d](self,p)elseif n!=""then self.unresolved_uid_parts=self.unresolved_uid_parts||{}self.unresolved_uid_parts[o]=self.unresolved_uid_parts[o]||{}self.unresolved_uid_parts[o][n]=self.unresolved_uid_parts[o][n]||{}self.unresolved_uid_parts[o][n][d]=d end end;m["Set"..d]=m["Set"..d]||function(self,l)self[d]=l;if l&&l:IsValid()then self[d.."UID"]=l:GetUniqueID()else self[d.."UID"]=""end end;m["Get"..d]=m["Get"..d]||function(self)return self[d]end;m[d]=NULL;m.PartReferenceKeys=m.PartReferenceKeys||{}m.PartReferenceKeys[d]=d;return self end;function c:RemoveProperty(d)self.PART["Set"..d]=nil;self.PART["Get"..d]=nil;self.PART["Is"..d]=nil;self.PART[d]=nil;self:RemoveProp(d)return self end;function c:Register()pac.PartTemplates[self.PART.ClassName]=self;pac.RegisterPart(self.PART)return self end;function pac.PartTemplate(i)local q;if i&&pac.PartTemplates[i]then q=pac.CopyValue(pac.PartTemplates[i])else q={PART={}}q.PART.Builder=q end;return setmetatable(q,c),q.PART end;function pac.GetTemplate(i)return pac.PartTemplates[i]end end;function pac.GetPropertyUserdata(r,d)return pac.PartTemplates[r.ClassName]&&pac.PartTemplates[r.ClassName]:GetPropData(d)||{}end
--addons/!lpakr_out/lua/pac3/libraries/luadata.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/libraries/urltex.lua:
local a={}a.TextureSize=1024;a.ActivePanel=a.ActivePanel||NULL;a.Queue=a.Queue||{}a.Cache=a.Cache||{}concommand.Add("pac_urltex_clear_cache",function()a.Cache={}a.Queue={}end)if a.ActivePanel:IsValid()then a.ActivePanel:Remove()end;local b=CreateClientConVar("pac_enable_urltex","1",true)local c=function()end;local function d(e,f)local g,h=e:find(f)if!g then return e,false end;if e:sub(h+1,h+1)==' '||e:sub(g-1,g-1)==' 'then e=e:gsub(' ?'..f..' ?','')return e,true end;return e,false end;function a.GetMaterialFromURL(e,i,j,k,l,m,n)if m==nil then m=true end;n=n||{}k=k||"VertexLitGeneric"if!b:GetBool()then return end;local o,p,q;e,o=d(e,'noclamps')e,q=d(e,'noclampt')e,p=d(e,'noclamp')local r=e;local s=e;if p then s=s..' noclamp'elseif o then s=s..' noclampS'elseif q then s=s..' noclampT'end;p=p||o&&q;local t=o||p||q;if isfunction(i)&&!j&&a.Cache[s]then local u=a.Cache[s]local v=CreateMaterial("pac3_urltex_"..pac.Hash(),k,n)v:SetTexture("$basetexture",u)i(v,u)return end;i=i||c;if a.Queue[s]then table.insert(a.Queue[s].callbacks,i)else a.Queue[s]={url=r,urlIndex=s,callbacks={i},tries=0,size=l,size_hack=m,shader=k,noclampS=o,noclampT=q,noclamp=p,rt=t,additionalData=n}end end;function a.Think()if!pac.IsEnabled()then return end;if table.Count(a.Queue)>0 then for e,w in pairs(a.Queue)do if!a.ActivePanel:IsValid()then a.StartDownload(w.url,w)end end;a.Busy=true else a.Busy=false end end;timer.Create("urltex_queue",0.1,0,a.Think)function a.StartDownload(e,w)if a.ActivePanel:IsValid()then a.ActivePanel:Remove()end;e=pac.FixUrl(e)local l=tonumber(w.size||a.TextureSize)local x="urltex_download_"..e;local y;local z=0;local function A()y=vgui.Create("DHTML")y:SetVisible(false)y:SetSize(l,l)y:SetHTML([[<html>
				<head>
				<style type="text/css">
					html
					{
						overflow:hidden;
						]]..(w.size_hack&&"margin: -8px -8px;"||"margin: 0px 0px;")..[[
					}
				</style>
				<script>
					window.onload = function() {
						setInterval(function() {
							console.log('REAL_FRAME_PASSED');
						}, 50);
					};
				</script>
				</head>

				<body>
					<img src="]]..e..[[" alt="" width="]]..l..[[" height="]]..l..[[" />
				</body>
			</html>]])y:Refresh()function y:ConsoleMessage(B)if B=='REAL_FRAME_PASSED'then z=z+1 end end;a.ActivePanel=y end;local C=false;local D=0;local E=0;local F;local function G()E=E+1;if IsValid(y)then y:Remove()end;if E<5 then pac.dprint("material download %q timed out.. trying again for the %ith time",e,E)C=false;D=0;A()else pac.dprint("material download %q timed out for good",e,E)pac.RemoveHook("Think",x)timer.Remove(x)a.Queue[w.urlIndex]=nil end end;function F()if!y:IsValid()then G()return end;if!C&&!y:IsLoading()then D=pac.RealTime+1;C=true end;if C&&D<pac.RealTime&&z>20 then y:UpdateHTMLTexture()local H=y:GetHTMLMaterial()if H then local I=pac.Hash()local J=CreateMaterial("pac3_urltex_"..I,w.shader,w.additionalData)local u=H:GetTexture("$basetexture")u:Download()J:SetTexture("$basetexture",u)a.Cache[w.urlIndex]=u;pac.RemoveHook("Think",x)timer.Remove(x)a.Queue[w.urlIndex]=nil;local K;if w.rt then local L=0;L=L+4;L=L+8;L=L+16;L=L+256;L=L+32768;if w.noclamp then L=L-4;L=L-8 elseif w.noclampS then L=L-4 elseif w.noclampT then L=L-8 end;local M=CreateMaterial("pac3_urltex_"..I..'_hack','UnlitGeneric',w.additionalData)M:SetTexture("$basetexture",u)K=GetRenderTargetEx("pac3_urltex_"..I,l,l,RT_SIZE_NO_CHANGE,MATERIAL_RT_DEPTH_NONE,L,CREATERENDERTARGETFLAGS_UNFILTERABLE_OK,IMAGE_FORMAT_RGB888)render.PushRenderTarget(K)render.Clear(0,0,0,255,false,false)cam.Start2D()surface.SetMaterial(M)surface.SetDrawColor(255,255,255)surface.DrawTexturedRect(0,0,l,l)cam.End2D()render.PopRenderTarget()J:SetTexture('$basetexture',K)a.Cache[w.urlIndex]=K end;timer.Simple(0,function()y:Remove()end)if w.callbacks then for N,i in pairs(w.callbacks)do i(J,K||u)end end end end end;pac.AddHook("Think",x,F)timer.Create(x,5,5,G)A()end;return a
--addons/!lpakr_out/lua/pac3/core/client/ear_grab_animation.lua:
hook.Add("PostGamemodeLoaded","pac_ear_grab_animation",function()if GAMEMODE.GrabEarAnimation then local a=GAMEMODE.GrabEarAnimation;GAMEMODE.GrabEarAnimation=function(b,c)if c.pac_disable_ear_grab then return end;return a(b,c)end end end)
--addons/!lpakr_out/lua/pac3/core/client/base_part.lua:
local a=string.format;local tostring=tostring;local pace=pace;local assert=assert;local b=debug.traceback;local c=math.random;local xpcall=xpcall;local pac=pac;local pairs=pairs;local ipairs=ipairs;local table=table;local Color=Color;local NULL=NULL;local d=table.insert;local e,f=pac.PartTemplate()f.ClassName="base"f.BaseName=f.ClassName;function f:__tostring()return a("part[%s][%s][%i]",self.ClassName,self:GetName(),self.Id)end;e:GetSet("PlayerOwner",NULL):GetSet("Owner",NULL):GetSet("Enabled",true)e:StartStorableVars():SetPropertyGroup("generic"):GetSet("Name",""):GetSet("Hide",false):GetSet("EditorExpand",false,{hidden=true}):GetSet("UniqueID","",{hidden=true}):GetSetPart("Parent"):GetSetPart("TargetEntity",{description="allows you to change which entity this part targets"}):GetSet("DrawOrder",0):GetSet("IsDisturbing",false,{editor_friendly="IsExplicit",description="Marks this content as NSFW, and makes it hidden for most of players who have pac_hide_disturbing set to 1"}):EndStorableVars()f.is_valid=true;function f:IsValid()return self.is_valid end;function f:PreInitialize()self.Children={}self.ChildrenMap={}self.modifiers={}self.RootPart=NULL;self.DrawOrder=0;self.hide_disturbing=false;self.active_events={}self.active_events_ref_count=0;local g="pac_enable_"..string.Replace(self.ClassName," ","_"):lower()if!GetConVar(g):GetBool()then self:SetWarning("This part class is disabled! Enable it with "..g.." 1")end end;function f:Initialize()end;function f:OnRemove()end;function f:GetNiceName()return self.ClassName end;function f:GetPrintUniqueID()if!self.UniqueID then return'00000000'end;return self.UniqueID:sub(1,8)end;function f:GetName()if self.Name==""then if self.last_nice_name_frame&&self.last_nice_name_frame==pac.FrameNumber then return self.last_nice_name end;self.last_nice_name_frame=pac.FrameNumber;local h=self:GetNiceName()local i;local j=0;if self:HasParent()then for k,l in ipairs(self:GetParent():GetChildren())do if l:GetNiceName()==h then j=j+1;if l==self then i=j end end end end;if i&&j>1&&i>1 then h=h:Trim().." ("..i-1 ..")"end;self.last_nice_name=h;return h end;return self.Name end;function f:SetUniqueID(m)if m then local n=pac.GetPartFromUniqueID(self:GetPlayerOwnerId(),m)if n:IsValid()then pac.Message(Color(255,50,50),"unique id collision between ",self," and ",n)m=nil end end;m=m||pac.Hash()local o=self:GetPlayerOwnerId()if o then pac.RemoveUniqueIDPart(o,self.UniqueID)end;self.UniqueID=m;if o then pac.SetUniqueIDPart(o,m,self)end end;local function p(q,r)if!q then return nil end;local q=tostring(q)return{message=q,type=r||1}end;function f:SetInfo(s)self.Info=p(s,1)end;function f:SetWarning(s)self.Info=p(s,2)end;function f:SetError(s)self.Info=p(s,3)end;do function f:SetPlayerOwner(t)local o=self:GetPlayerOwnerId()self.PlayerOwner=t;if t&&t:IsValid()then self.PlayerOwnerHash=pac.Hash(t)else self.PlayerOwnerHash=nil end;if o then pac.RemoveUniqueIDPart(o,self.UniqueID)end;local o=self:GetPlayerOwnerId()if o then pac.SetUniqueIDPart(o,self.UniqueID,self)end end;function f:GetPlayerOwner()return self:GetRootPart().PlayerOwner end;function f:GetPlayerOwnerId()return self:GetRootPart().PlayerOwnerHash end;function f:SetRootOwnerDeprecated(u)if u then self:SetTargetEntity(self:GetRootPart())self.RootOwner=false;if pace then pace.Call("VariableChanged",self,"TargetEntityUID",self:GetTargetEntityUID(),0.25)end end end;function f:GetParentOwner()if self.TargetEntity:IsValid()&&self.TargetEntity!=self then return self.TargetEntity:GetOwner()end;for k,v in ipairs(self:GetParentList())do if v.ClassName=="event"&&!v.RootOwner then local v=v:GetParent()if v:IsValid()then local v=v:GetParent()if v:IsValid()then return v:GetOwner()end end end;if v!=self then local w=v:GetOwner()if w:IsValid()then return w end end end;return NULL end;function f:GetOwner()if self.Owner:IsValid()then return self.Owner end;return self:GetParentOwner()end end;do function f:OnParent()end;function f:OnChildAdd()end;function f:OnUnParent()end;function f:OnOtherPartCreated(x)local o=x:GetPlayerOwnerId()if!o then return end;for k,y in pairs(self.PartReferenceKeys)do if self[y]&&self[y].UniqueID==x.UniqueID then self["Set"..y](self,x)end end;do if!self.unresolved_uid_parts then return end;if!self.unresolved_uid_parts[o]then return end;local z=self.unresolved_uid_parts[o][x.UniqueID]if!z then return end;for k,y in pairs(z)do self["Set"..y](self,x)end end end;function f:CreatePart(A)local x=pac.CreatePart(A,self:GetPlayerOwner())if!x then return end;x:SetParent(self)return x end;function f:SetDrawOrder(i)self.DrawOrder=i;if self:HasParent()then self:GetParent():SortChildren()end end;do function f:GetChildren()return self.Children end;local function B(x,C,D)local E=x.Children;for F=1,#E do C[D]=E[F]D=D+1;D=B(E[F],C,D)end;return D end;function f:GetChildrenList()if!self.children_list then local C={}B(self,C,1)self.children_list=C end;return self.children_list end;function f:InvalidateChildrenList()self.children_list=nil;for k,v in ipairs(self:GetParentList())do v.children_list=nil end end end;do function f:SetParent(x)if!x||!x:IsValid()then self:UnParent()return false else return x:AddChild(self)end end;local function G(H)local I={}for F=1,#H do I[F+1]=H[F]end;return I end;function f:GetParentList()if!self.parent_list then if self.Parent&&self.Parent:IsValid()then self.parent_list=G(self.Parent:GetParentList())self.parent_list[1]=self.Parent else self.parent_list={}end end;return self.parent_list end;function f:InvalidateParentList()self.parent_list=nil;for k,J in ipairs(self:GetChildrenList())do J.parent_list=nil end end;function f:InvalidateParentListPartial(K,v)self.parent_list=G(K)self.parent_list[1]=v;for k,J in ipairs(self:GetChildren())do J:InvalidateParentListPartial(self.parent_list,self)end end end;function f:AddChild(x,L)if!x||!x:IsValid()then self:UnParent()return end;if self==x||x:HasChild(self)then return false end;if x:HasParent()then x:UnParent()end;x.Parent=self;if!x:HasChild(self)then self.ChildrenMap[x]=x;d(self.Children,x)end;self:InvalidateChildrenList()x.ParentUID=self:GetUniqueID()x:OnParent(self)self:OnChildAdd(x)if self:HasParent()then self:GetParent():SortChildren()end;x:SortChildren()self:SortChildren()x:InvalidateParentListPartial(self:GetParentList(),self)if self:GetPlayerOwner()==pac.LocalPlayer then pac.CallHook("OnPartParent",self,x)end;if!L then x:CallRecursive("CalcShowHide",true)end;return x.Id end;do local function M(N,u)return N.DrawOrder<u.DrawOrder end;function f:SortChildren()table.sort(self.Children,M)self:InvalidateChildrenList()end end;function f:HasParent()return self.Parent:IsValid()end;function f:HasChildren()return self.Children[1]!=nil end;function f:HasChild(x)return self.ChildrenMap[x]!=nil end;function f:RemoveChild(x)self.ChildrenMap[x]=nil;for F,l in ipairs(self:GetChildren())do if l==x then self:InvalidateChildrenList()table.remove(self.Children,F)x:OnUnParent(self)break end end end;function f:GetRootPart()local O=self:GetParentList()if O[1]then return O[#O]end;return self end;function f:CallRecursive(P,N,u,Q)assert(Q==nil,"EXTEND ME")if self[P]then self[P](self,N,u,Q)end;for k,J in ipairs(self:GetChildrenList())do if J[P]then J[P](J,N,u,Q)end end end;function f:CallRecursiveOnClassName(R,P,N,u,Q)assert(Q==nil,"EXTEND ME")if self[P]&&self.ClassName==R then self[P](self,N,u,Q)end;for k,J in ipairs(self:GetChildrenList())do if J[P]&&self.ClassName==R then J[P](J,N,u,Q)end end end;function f:SetKeyValueRecursive(y,l)self[y]=l;for k,J in ipairs(self:GetChildrenList())do J[y]=l end end;function f:RemoveChildren()self:InvalidateChildrenList()for F,x in ipairs(self:GetChildren())do x:Remove(true)self.Children[F]=nil;self.ChildrenMap[x]=nil end end;function f:UnParent()local v=self:GetParent()if v:IsValid()then v:RemoveChild(self)end;self:OnUnParent(v)self.Parent=NULL;self.ParentUID=""self:CallRecursive("OnHide")end;function f:Remove(S)self:Deattach()if!S&&self:HasParent()then self:GetParent():RemoveChild(self)end;self:RemoveChildren()end;function f:Deattach()if!self.is_valid||self.is_deattached then return end;self.is_deattached=true;self.PlayerOwner_=self.PlayerOwner;if self:GetPlayerOwner()==pac.LocalPlayer then pac.CallHook("OnPartRemove",self)end;self:CallRecursive("OnHide")self:CallRecursive("OnRemove")local o=self:GetPlayerOwnerId()if o then pac.RemoveUniqueIDPart(o,self.UniqueID)end;pac.RemovePart(self)self.is_valid=false;self:InvalidateChildrenList()for k,x in ipairs(self:GetChildren())do local o=x:GetPlayerOwnerId()if o then pac.RemoveUniqueIDPart(o,x.UniqueID)end;pac.RemovePart(x)end end end;do local T=CreateClientConVar("pac_hide_disturbing","1",true,true,"Hide parts which outfit creators marked as 'nsfw' (e.g. gore or explicit content)")function f:SetIsDisturbing(l)self.IsDisturbing=l;self.hide_disturbing=T:GetBool()&&l;self:CallRecursive("CalcShowHide",true)end;function f:UpdateIsDisturbing()local U=T:GetBool()&&self.IsDisturbing;if U==self.hide_disturbing then return end;self.hide_disturbing=U;self:CallRecursive("CalcShowHide",true)end;function f:OnHide()end;function f:OnShow()end;function f:SetEnabled(l)self.Enabled=l;if l then self:ShowFromRendering()else self:HideFromRendering()end end;function f:SetHide(l)self.Hide=l;self:SetKeyValueRecursive("last_hidden",l)if l then self:CallRecursive("OnHide",true)else self:CallRecursive("OnShow",true)end;self:CallRecursive("CalcShowHide",true)end;function f:IsDrawHidden()return self.draw_hidden end;function f:SetDrawHidden(u)self.draw_hidden=u end;function f:ShowFromRendering()self:SetDrawHidden(false)if!self:IsHidden()then self:OnShow(true)end;for k,J in ipairs(self:GetChildrenList())do J:SetDrawHidden(false)if!J:IsHidden()then J:OnShow(true)end end end;function f:HideFromRendering()self:SetDrawHidden(true)self:CallRecursive("OnHide",true)end;local function V(x)if x.active_events_ref_count>0 then return true end;return x.Hide||x.hide_disturbing end;function f:IsHidden()if V(self)then return true end;for k,v in ipairs(self:GetParentList())do if V(v)then return true end end;return false end;function f:SetEventTrigger(W,X)if X then if!self.active_events[W]then self.active_events[W]=W;self.active_events_ref_count=self.active_events_ref_count+1;self:CallRecursive("CalcShowHide",false)end else if self.active_events[W]then self.active_events[W]=nil;self.active_events_ref_count=self.active_events_ref_count-1;self:CallRecursive("CalcShowHide",false)end end end;function f:GetReasonHidden()local Y={}for x in pairs(self.active_events)do d(Y,tostring(x).." is event hiding")end;if Y[1]then return table.concat(Y,"\n")end;if self.Hide then return"hide enabled"end;if self.hide_disturbing then return"pac_hide_disturbing is set to 1"end;return""end;function f:CalcShowHide(Z)local u=self:IsHidden()if u!=self.last_hidden then if u then self:OnHide(Z)else self:OnShow(Z)end end;self.last_hidden=u end;function f:IsHiddenCached()return self.last_hidden end;function f:BuildBonePositions()if!self.Enabled then return end;if!self:IsHiddenCached()then self:OnBuildBonePositions()end end;function f:OnBuildBonePositions()end end;f.show_in_editor=true;function f:GetShowInEditor()return self:GetRootPart().show_in_editor==true end;function f:SetShowInEditor(u)self:GetRootPart().show_in_editor=u end;do function f:AddStorableVar(_)self.StorableVars=self.StorableVars||{}self.StorableVars[_]=_ end;function f:GetStorableVars()self.StorableVars=self.StorableVars||{}return self.StorableVars end;function f:Clear()self:RemoveChildren()end;function f:OnWorn()end;function f:OnOutfitLoaded()end;function f:PostApplyFixes()end;do function f:GetProperty(A)local l=self["Get"..A]if l==nil then if self.GetDynamicProperties then local a0=self:GetDynamicProperties()if a0&&a0[A]then return a0[A].get()end end else return l(self)end end;function f:SetProperty(y,l)if self["Set"..y]!=nil then if self["Get"..y](self)!=l then self["Set"..y](self,l)end elseif self.GetDynamicProperties then local a0=self:GetDynamicProperties()[y]if a0&&a0 then a0.set(l)end end end;function f:GetProperties()local a1={}for k,y in pairs(self:GetStorableVars())do if self.PropertyWhitelist&&!self.PropertyWhitelist[y]then goto a2 end;d(a1,{key=y,set=function(a3)self["Set"..y](self,a3)end,get=function()return self["Get"..y](self)end,udata=pac.GetPropertyUserdata(self,y)||{}})::a2::end;if self.GetDynamicProperties then local a4=self:GetDynamicProperties()if a4 then for k,a0 in pairs(a4)do if!self.PropertyWhitelist||self.PropertyWhitelist[a0.key]then d(a1,a0)end end end end;local a5={}local a6={}for k,y in ipairs({"Name","Hide"})do for k,a7 in ipairs(a1)do if y==a7.key then if!a6[y]then d(a5,a7)a6[y]=true;break end end end end;if pac.VariableOrder[self.ClassName]then for k,y in ipairs(pac.VariableOrder[self.ClassName])do for k,a7 in ipairs(a1)do if y==a7.key then if!a6[y]then d(a5,a7)a6[y]=true;break end end end end end;for k,a8 in pairs(pac.VariableOrder)do for k,y in ipairs(a8)do for k,a7 in ipairs(a1)do if y==a7.key then if!a6[y]then d(a5,a7)a6[y]=true;break end end end end end;for k,a7 in ipairs(a1)do if!a6[a7.key]then d(a5,a7)end end;return a5 end end;local function a9(q)ErrorNoHalt(b(q))end;do local function aa(self,C,ab)self:SetUniqueID(C.self.UniqueID)self.delayed_variables=self.delayed_variables||{}for y,ac in next,C.self do if y=="UniqueID"then goto a2 end;if self["Set"..y]then if y=="Material"then d(self.delayed_variables,{key=y,val=ac})end;self["Set"..y](self,ac)elseif y!="ClassName"then pac.dprint("settable: unhandled key [%q] = %q",y,tostring(ac))end::a2::end;for k,ac in pairs(C.children)do local x=pac.CreatePart(ac.self.ClassName,self:GetPlayerOwner(),ac,nil,ab+1)self:AddChild(x,true)end end;local function ad(C,ae,af)if ae==true then ae=tostring(c())..tostring(c())end;af=af||{}C.self.UniqueID=pac.Hash(C.self.UniqueID..ae)af[tostring(C.self.UniqueID)]=C.self;for k,J in ipairs(C.children)do ad(J,ae,af)end;return C,ae,af end;local function ag(af,ae)for ah,x in pairs(af)do for y,l in pairs(x)do if y:sub(-3)=="UID"then local ai=pac.Hash(l..ae)if af[tostring(ai)]then x[y]=ai end end end end end;function f:SetTable(C,aj,ab)ab=ab||0;if aj then local ae,af;C,ae,af=ad(table.Copy(C),aj)ag(af,ae)end;local ak,al=xpcall(aa,a9,self,C,ab)if!ak then pac.Message(Color(255,50,50),"SetTable failed: ",al)end;if ab==0 then self:CallRecursive("CalcShowHide",true)end end end;function f:ToTable()local C={self={ClassName=self.ClassName},children={}}for k,y in pairs(self:GetStorableVars())do local _=self[y]&&self["Get"..y](self)||self[y]_=pac.CopyValue(_)||_;if make_copy_name&&_!=""&&(y=="UniqueID"||y:sub(-3)=="UID")then _=pac.Hash(_.._)end;if y=="Name"&&self[y]==""then _=""end;if y!="ParentUID"&&_!=self.DefaultVars[y]then C.self[y]=_ end end;for k,x in ipairs(self:GetChildren())do if!self.is_valid||self.is_deattached then else d(C.children,x:ToTable())end end;return C end;function f:ToSaveTable()if self:GetPlayerOwner()!=pac.LocalPlayer then return end;local C={self={ClassName=self.ClassName},children={}}for k,y in pairs(self:GetStorableVars())do local _=self[y]&&self["Get"..y](self)||self[y]_=pac.CopyValue(_)||_;if y=="Name"&&self[y]==""then _=""end;if y!="ParentUID"then C.self[y]=_ end end;for k,x in ipairs(self:GetChildren())do if!self.is_valid||self.is_deattached then else d(C.children,x:ToSaveTable())end end;return C end;do do local function aa(self,C)self:SetUniqueID(C.self.UniqueID)self.delayed_variables=self.delayed_variables||{}for y,ac in pairs(C.self)do if y=="UniqueID"then goto a2 end;if self["Set"..y]then if y=="Material"then d(self.delayed_variables,{key=y,val=ac})end;self["Set"..y](self,ac)elseif y!="ClassName"then pac.dprint("settable: unhandled key [%q] = %q",y,tostring(ac))end::a2::end;for k,ac in pairs(C.children)do local x=pac.CreatePart(ac.self.ClassName,self:GetPlayerOwner())x:SetUndoTable(ac)x:SetParent(self)end end;function f:SetUndoTable(C)local ak,al=xpcall(aa,a9,self,C)if!ak then pac.Message(Color(255,50,50),"SetUndoTable failed: ",al)end end end;function f:ToUndoTable()if self:GetPlayerOwner()!=pac.LocalPlayer then return end;local C={self={ClassName=self.ClassName},children={}}for k,y in pairs(self:GetStorableVars())do if y=="Name"&&self.Name==""then goto a2 end;C.self[y]=pac.CopyValue(self["Get"..y](self))::a2::end;for k,x in ipairs(self:GetChildren())do if!self.is_valid||self.is_deattached then else d(C.children,x:ToUndoTable())end end;return C end end;function f:GetVars()local C={}for k,y in pairs(self:GetStorableVars())do C[y]=pac.CopyValue(self[y])end;return C end;function f:Clone()local x=pac.CreatePart(self.ClassName,self:GetPlayerOwner())if!x then return end;if self:GetOwner()==self:GetPlayerOwner()then x:SetOwner(self:GetOwner())end;x:SetTable(self:ToTable(),true)if self:GetParent():IsValid()then x:SetParent(self:GetParent())end;return x end end;do function f:Think()if!self.Enabled then return end;if self.ThinkTime!=0&&self.last_think&&self.last_think>pac.RealTime then return end;if!self.AlwaysThink&&self:IsHiddenCached()then self:AlwaysOnThink()return end;if self.delayed_variables then for k,am in ipairs(self.delayed_variables)do self["Set"..am.key](self,am.val)end;self.delayed_variables=nil end;self:AlwaysOnThink()self:OnThink()end;function f:OnThink()end;function f:AlwaysOnThink()end end;e:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/camera.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/censor.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/fog.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/fog.lua:
local MATERIAL_FOG_NONE=MATERIAL_FOG_NONE;local MATERIAL_FOG_LINEAR=MATERIAL_FOG_LINEAR;local MATERIAL_FOG_LINEAR_BELOW_FOG_Z=MATERIAL_FOG_LINEAR_BELOW_FOG_Z;local a=render.FogStart;local b=render.FogEnd;local c=render.FogMaxDensity;local d=render.SetFogZ;local e=render.FogMode;local f,g=pac.PartTemplate("base_drawable")g.ClassName="fog"g.Group='modifiers'g.Icon='icon16/weather_clouds.png'f:StartStorableVars()f:GetSet("Color",Vector(255,255,255),{editor_panel="color"})f:GetSet("Start",0)f:GetSet("End",10)f:GetSet("Alpha",1,{editor_sensitivity=0.25,editor_clamp={0,1}})f:GetSet("Height",0)f:EndStorableVars()function g:GetNiceName()local h=pac.ColorToNames(self:GetColor())return h.." fog"end;function g:SetColor(i)self.Color=i;self.clr={i.r,i.g,i.b}end;function g:OnParent(j)if j.AddModifier then j:AddModifier(self)end end;function g:OnUnParent(j)if!j:IsValid()then return end;if j.RemoveModifier then j:RemoveModifier(self)end end;function g:PreOnDraw()a(self.Start*100)b(self.End*100)c(self.Alpha)if self.clr then render.FogColor(self.clr[1],self.clr[2],self.clr[3])end;if self.Height>0 then e(MATERIAL_FOG_LINEAR_BELOW_FOG_Z)d(self:GetWorldPosition().z+self.Height*10)else e(MATERIAL_FOG_LINEAR)end end;function g:PostOnDraw()render.FogMode(MATERIAL_FOG_NONE)end;f:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/info.lua:
local a,b=pac.PartTemplate("base")b.ClassName="info"b.Group=''b.Icon='icon16/help.png'a:StartStorableVars()a:GetSet("SpawnEntity","")a:GetSet("UserData","")a:EndStorableVars()
--addons/!lpakr_out/lua/pac3/core/client/parts/model.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/movement.lua:
local a,b=pac.PartTemplate("base")b.ClassName="player_movement"b.Group="entity"b.Icon="icon16/user_go.png"local c={}local d={}local function e(b,f,g,...)a:GetSet(f,g,...)c[f]=g;b["Set"..f]=function(self,h)self[f]=h;local i=self:GetRootPart():GetOwner()if i==pac.LocalPlayer then if self:IsHidden()then return end;local j=GetConVarNumber("pac_free_movement")if j==1||j==-1&&hook.Run("PlayerNoClip",i,true)then i.pac_movement=i.pac_movement||table.Copy(c)if i.pac_movement[f]!=h then net.Start("pac_modify_movement",true)net.WriteString(f)net.WriteType(h)net.SendToServer()end;i.pac_movement[f]=h end end end;table.insert(d,function(k)b["Set"..f](k,b["Get"..f](k))end)end;a:StartStorableVars()a:SetPropertyGroup("generic")e(b,"Noclip",false)e(b,"Gravity",Vector(0,0,-600))a:SetPropertyGroup("movement")e(b,"SprintSpeed",400)e(b,"RunSpeed",200)e(b,"WalkSpeed",100)e(b,"DuckSpeed",25)a:SetPropertyGroup("ground")e(b,"JumpHeight",200,{editor_clamp={0,10000}})e(b,"MaxGroundSpeed",750)e(b,"StickToGround",true)e(b,"GroundFriction",0.12,{editor_clamp={0,1},editor_sensitivity=0.1})a:SetPropertyGroup("air")e(b,"AllowZVelocity",false)e(b,"AirFriction",0.01,{editor_clamp={0,1},editor_sensitivity=0.1})e(b,"MaxAirSpeed",1)a:SetPropertyGroup("view angles")e(b,"ReversePitch",false)e(b,"UnlockPitch",false)e(b,"VelocityToViewAngles",0,{editor_clamp={0,1},editor_sensitivity=0.1})e(b,"RollAmount",0,{editor_sensitivity=0.25})a:SetPropertyGroup("fin")e(b,"FinEfficiency",0)e(b,"FinLiftMode","normal",{enums={normal="normal",none="none"}})e(b,"FinCline",false)a:EndStorableVars()function b:GetNiceName()local l=self:GetRootPart():GetOwner()local m=self.ClassName;if l:IsValid()then if l:IsPlayer()then m=l:Nick()else m=language.GetPhrase(l:GetClass())end end;return m.."'s movement"end;function b:OnShow()local l=self:GetRootPart():GetOwner()if l:IsValid()then l.last_movement_part=self:GetUniqueID()for n,o in ipairs(d)do o(self)end end end;function b:OnHide()local l=self:GetRootPart():GetOwner()if l==pac.LocalPlayer&&l.last_movement_part==self:GetUniqueID()then net.Start("pac_modify_movement",true)net.WriteString("disable")net.SendToServer()l.pac_movement=nil end end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/physics.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/shake.lua:
local a,b=pac.PartTemplate("base_movable")b.ClassName="shake"b.Group='effects'b.Icon='icon16/transmit.png'a:StartStorableVars()a:SetPropertyGroup("generic")a:SetPropertyGroup("shake")a:GetSet("Amplitude",1)a:GetSet("Falloff",false)a:GetSet("Frequency",1)a:GetSet("Duration",0.5)a:GetSet("Radius",100)a:EndStorableVars()function b:OnShow(c)if!c then local d=self:GetDrawPosition()local e=d:Distance(pac.EyePos)local f=math.Clamp(self.Radius,0.0001,500)if e<f then local g=self.Amplitude;if self.Falloff then g=g*(1-e/f)end;util.ScreenShake(d,g,self.Frequency,math.Clamp(self.Duration,0.0001,2),0)end end end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/sprite.lua:
local a=render.SetMaterial;local b=render.DrawSprite;local Color=Color;local Vector=Vector;local c=cam.IgnoreZ;local d,e=pac.PartTemplate("base_drawable")e.ClassName="sprite"e.Group='effects'e.Icon='icon16/layers.png'd:StartStorableVars()d:SetPropertyGroup("generic")d:GetSet("IgnoreZ",false)d:GetSet("SizeX",1,{editor_sensitivity=0.25})d:GetSet("SizeY",1,{editor_sensitivity=0.25})d:GetSet("SpritePath","sprites/grip",{editor_panel="material"})d:SetPropertyGroup("orientation")d:GetSet("Size",1,{editor_sensitivity=0.25})d:SetPropertyGroup("appearance")d:GetSet("Color",Vector(255,255,255),{editor_panel="color"})d:GetSet("Alpha",1,{editor_sensitivity=0.25,editor_clamp={0,1}})d:GetSet("Translucent",true)d:EndStorableVars()function e:GetNiceName()if!self:GetSpritePath()then return"error"end;local f=pac.PrettifyName("/"..self:GetSpritePath()):match(".+/(.+)")return f&&f:gsub("%..+","")||"error"end;function e:SetColor(g)self.ColorC=self.ColorC||Color(255,255,255,255)self.ColorC.r=g.r;self.ColorC.g=g.g;self.ColorC.b=g.b;self.Color=g end;function e:SetAlpha(h)self.ColorC=self.ColorC||Color(255,255,255,255)self.ColorC.a=h*255;self.Alpha=h end;function e:Initialize()self:SetSpritePath(self.SpritePath)end;function e:SetSpritePath(i)self:SetMaterial(i)end;function e:FixMaterial()local j=self.Materialm;if!j then return end;local k=j:GetShader()if k=="VertexLitGeneric"||k=="Cable"then local l=j:GetTexture("$basetexture")if l then local m={}m["$basetexture"]=l:GetName()m["$vertexcolor"]=1;m["$vertexalpha"]=1;self.Materialm=CreateMaterial("pac_fixmat_"..os.clock(),"UnlitGeneric",m)self.Materialm:SetTexture("$basetexture",l)end end end;function e:SetMaterial(i)i=i||""if!pac.Handleurltex(self,i,nil,"UnlitGeneric",{["$translucent"]="1"})then if isstring(i)then self.Materialm=pac.Material(i,self)self:CallRecursive("OnMaterialChanged")elseif type(i)=="IMaterial"then self.Materialm=i;self:CallRecursive("OnMaterialChanged")end end;self:FixMaterial()self.SpritePath=i end;function e:OnDraw()local j=self.MaterialOverride||self.Materialm;if j then if self.IgnoreZ then c(true)end;local n;if pac.drawing_motionblur_alpha then if!self.ColorC then self:SetColor(self:GetColor())end;n=self.ColorC.a;self.ColorC.a=pac.drawing_motionblur_alpha*255 end;local o=self:GetDrawPosition()a(j)b(o,self.SizeX*self.Size,self.SizeY*self.Size,self.ColorC)if self.IgnoreZ then c(false)end;if pac.drawing_motionblur_alpha then self.ColorC.a=n end end end;d:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/bone2.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/bone2.lua:
local NULL=NULL;local pairs=pairs;for a,b in pairs(ents.GetAll())do b.pac_bone_setup_data=nil end;local c,d=pac.PartTemplate("base_movable")d.FriendlyName="legacy experimental bone"d.ClassName="bone2"d.Group="legacy"d.Icon='icon16/connect.png'd.is_bone_part=true;c:StartStorableVars()c:SetPropertyGroup("generic")c:PropertyOrder("Name")c:PropertyOrder("Hide")c:PropertyOrder("ParentName")c:GetSet("Jiggle",false)c:GetSet("ScaleChildren",false)c:GetSet("AlternativeBones",false)c:GetSet("MoveChildrenToOrigin",false)c:GetSet("FollowAnglesOnly",false)c:GetSet("HideMesh",false)c:GetSet("InvertHideMesh",false)c:GetSetPart("FollowPart")c:SetPropertyGroup("orientation")c:PropertyOrder("AimPartName")c:PropertyOrder("Bone")c:PropertyOrder("Position")c:PropertyOrder("Angles")c:PropertyOrder("EyeAngles")c:GetSet("Size",1,{editor_sensitivity=0.25})c:GetSet("Scale",Vector(1,1,1),{editor_sensitivity=0.25})c:PropertyOrder("PositionOffset")c:PropertyOrder("AngleOffset")c:SetPropertyGroup("appearance")c:SetPropertyGroup("other")c:PropertyOrder("DrawOrder")c:EndStorableVars()c:RemoveProperty("Translucent")c:RemoveProperty("IgnoreZ")c:RemoveProperty("BlendMode")c:RemoveProperty("NoTextureFiltering")function d:GetNiceName()return self:GetBone()end;d.ThinkTime=0;function d:OnShow()self:SetBone(self:GetBone())end;d.OnParent=d.OnShow;function d:OnThink()if!self.first_getbpos&&self:GetOwner():IsValid()then self:GetBonePosition()self.first_getbpos=true end end;function d:OnHide()local e=self:GetOwner()if e:IsValid()then e.pac_bone_setup_data=e.pac_bone_setup_data||{}e.pac_bone_setup_data[self.UniqueID]=nil end end;function d:GetBonePosition()local e=self:GetOwner()return pac.GetBonePosAng(e,self.Bone,true)end;local function f(g,h,i,j)if j.AlternativeBones then g.pac_bone_setup_data[j.UniqueID].pos=j.Position+j.PositionOffset else g:ManipulateBonePosition(h,g:GetManipulateBonePosition(h)+i)j.modified_bones=true end end;local function k(g,h,l,j)if j.AlternativeBones then g.pac_bone_setup_data[j.UniqueID].ang=j.Angles+j.AngleOffset else g:ManipulateBoneAngles(h,g:GetManipulateBoneAngles(h)+l)j.modified_bones=true end end;local m=Vector(math.huge,math.huge,math.huge)local function n(g,h,o,j)if j&&j.AlternativeBones then g.pac_bone_setup_data[j.UniqueID].scale=o else g:ManipulateBoneScale(h,g:GetManipulateBoneScale(h)*o)j.modified_bones=true end end;local function p(e,h,o,q,r)local s=e:GetBoneCount()r=r||e.pac3_Scale||1;if s==0||s<h then return end;for t=0,s-1 do if e:GetBoneParent(t)!=h then goto u end;local v=e:GetBoneMatrix(t)if v then if q then v:SetTranslation(q)end;v:Scale(v:GetScale()*o/r)e:SetBoneMatrix(t,v)end;p(e,t,o,q,r)::u::end end;function pac.build_bone_callback(g)if g.pac_matrixhack then pac.LegacyScale(g)end;if g.pac_bone_setup_data then for w,x in pairs(g.pac_bone_setup_data)do local j=x.part||NULL;if j:IsValid()then local v=g:GetBoneMatrix(x.bone)if v then if j.FollowPart:IsValid()&&j.FollowPart.GetWorldPosition then v:SetAngles(j.FollowPart:GetWorldAngles())if!j.FollowAnglesOnly then v:SetTranslation(j.FollowPart:GetWorldPosition())end else if x.pos then v:Translate(x.pos)end;if x.ang then v:Rotate(x.ang)end end;if x.scale then v:Scale(v:GetScale()*x.scale)end;if j.ScaleChildren then local o=j.Scale*j.Size;p(g,x.bone,o,x.origin)end;g:SetBoneMatrix(x.bone,v)end else g.pac_bone_setup_data[w]=nil end end end end;function d:OnBuildBonePositions()local e=self:GetOwner()if!e:IsValid()then return end;local y=self:GetModelBoneIndex()if!y then return end;e.pac_bone_setup_data=e.pac_bone_setup_data||{}if self.AlternativeBones||self.ScaleChildren||self.FollowPart:IsValid()then e.pac_bone_setup_data[self.UniqueID]=e.pac_bone_setup_data[self.UniqueID]||{}e.pac_bone_setup_data[self.UniqueID].bone=y;e.pac_bone_setup_data[self.UniqueID].part=self else e.pac_bone_setup_data[self.UniqueID]=nil end;local l=self:CalcAngles(self.Angles)||self.Angles;if!e.pac_follow_bones_function then e.pac_follow_bones_function=pac.build_bone_callback;local h;h=e:AddCallback("BuildBonePositions",function(g)if pac&&pac.build_bone_callback then pac.build_bone_callback(g)else e:RemoveCallback("BuildBonePositions",h)end end)end;if!self.FollowPart:IsValid()then if self.EyeAngles||self.AimPart:IsValid()then l.r=l.y;l.y=-l.p end;local z,A=self.Position+self.PositionOffset,l+self.AngleOffset;local B=self:GetParent()if B&&B:IsValid()&&B.ClassName=='jiggle'then local C,D=B.Position,B.Angles;if B.pos then z=z+B.pos-C end;if B.ang then A=A+B.ang-D end end;f(e,y,z,self)k(e,y,A,self)end;if e.pac_bone_setup_data[self.UniqueID]then if self.MoveChildrenToOrigin then e.pac_bone_setup_data[self.UniqueID].origin=self:GetBonePosition()else e.pac_bone_setup_data[self.UniqueID].origin=nil end end;e:ManipulateBoneJiggle(y,isnumber(self.Jiggle)&&self.Jiggle||(self.Jiggle&&1||0))local o;if self.HideMesh then o=m;e.pac_inf_scale=true;if self.InvertHideMesh then local s=e:GetBoneCount()for t=0,s-1 do if t!=y then n(e,t,m,self)end end;return end else e.pac_inf_scale=false;o=self.Scale*self.Size end;n(e,y,o,self)e.needs_setupbones_from_legacy_bone_parts=true end;c:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/model.lua:
local pac=pac;local a=math.max;local b=math.min;local c=table.insert;local d=table.remove;local Matrix=Matrix;local Vector=Vector;local e=cam.PushModelMatrix;local f=cam.PopModelMatrix;local render=render;local g=render.CullMode;local h=render.SetColorModulation;local i=render.SetBlend;local j=render.SetMaterial;local k=render.MaterialOverride;local l=render.ModelMaterialOverride;local m=render.PopFilterMag;local n=render.PopFilterMin;local o=render.PopFlashlightMode;local p=render.PushFilterMag;local q=render.PushFilterMin;local r=render.PushFlashlightMode;local s=render.SuppressEngineLighting;local t=FindMetaTable("IMaterial").GetFloat;local u=FindMetaTable("IMaterial").GetVector;local v=FindMetaTable("IMaterial").SetFloat;local w=FindMetaTable("IMaterial").SetVector;local EF_BONEMERGE=EF_BONEMERGE;local MATERIAL_CULLMODE_CW=MATERIAL_CULLMODE_CW;local MATERIAL_CULLMODE_CCW=MATERIAL_CULLMODE_CCW;local TEXFILTER=TEXFILTER;local NULL=NULL;local Color=Color;pac.DisableColoring=false;pac.DisableDoubleFace=false;local x,y=pac.PartTemplate("base_drawable")y.FriendlyName="legacy model"y.ClassName="model"y.Category="model"y.ManualDraw=true;y.HandleModifiersManually=true;y.Icon='icon16/shape_square.png'y.Group="legacy"y.ThinkTime=0.5;y.is_model_part=true;x:StartStorableVars()x:SetPropertyGroup("generic")x:PropertyOrder("Name")x:PropertyOrder("Hide")x:PropertyOrder("ParentName")x:GetSet("Model","models/dav0r/hoverball.mdl",{editor_panel="model"})x:GetSet("Material","",{editor_panel="material"})x:GetSet("UseLegacyScale",false)x:SetPropertyGroup("orientation")x:PropertyOrder("AimPartName")x:PropertyOrder("Bone")x:GetSet("BoneMerge",false)x:PropertyOrder("Position")x:PropertyOrder("Angles")x:PropertyOrder("EyeAngles")x:GetSet("Size",1,{editor_sensitivity=0.25})x:GetSet("Scale",Vector(1,1,1))x:PropertyOrder("PositionOffset")x:PropertyOrder("AngleOffset")x:GetSet("AlternativeScaling",false)x:SetPropertyGroup("appearance")x:GetSet("Color",Vector(255,255,255),{editor_panel="color"})x:GetSet("Brightness",1)x:GetSet("Alpha",1,{editor_sensitivity=0.25,editor_clamp={0,1}})x:GetSet("Fullbright",false)x:GetSet("CellShade",0,{editor_sensitivity=0.1})x:PropertyOrder("Translucent")x:GetSet("Invert",false)x:GetSet("DoubleFace",false)x:GetSet("Skin",0,{editor_onchange=function(self,z)return math.Round(math.max(tonumber(z),0))end})x:GetSet("LodOverride",-1)x:GetSet("Passes",1)x:GetSet("TintColor",Vector(0,0,0),{editor_panel="color"})x:GetSet("LightBlend",1)x:GetSet("ModelFallback","",{editor_panel="model"})x:GetSet("TextureFilter",3)x:GetSet("BlurLength",0)x:GetSet("BlurSpacing",0)x:GetSet("UsePlayerColor",false)x:GetSet("UseWeaponColor",false)x:SetPropertyGroup("other")x:PropertyOrder("DrawOrder")x:GetSet("OwnerEntity",false)x:EndStorableVars()function y:GetNiceName()local A=pac.PrettifyName(("/"..self:GetModel()):match(".+/(.-)%."))return A&&A:gsub("%d","")||"error"end;function y:Reset()self:Initialize(self.is_obj)for B,C in pairs(self:GetStorableVars())do if y[C]then self["Set"..C](self,self["Get"..C](self))end end end;function y:SetUseLegacyScale(D)self.UseLegacyScale=D;if!D then self.requires_bone_model_scale=false end end;function y:SetTextureFilter(z)self.TextureFilter=z;self.texfilter_enum=math.Clamp(math.Round(z),0,3)end;function y:Initialize(E)self.Owner=pac.CreateEntity(self:GetModel(),E)if!self.Owner:IsValid()then pac.Message("pac3 failed to create entity!")return end;self.Owner:SetNoDraw(true)self.Owner.PACPart=self;self.is_obj=E end;function y:OnBecomePhysics()local F=self:GetOwner()if!F:IsValid()then return end;F:PhysicsInit(SOLID_NONE)F:SetMoveType(MOVETYPE_NONE)F:SetNoDraw(true)F.RenderOverride=nil;self.skip_orient=false end;function y:OnShow()local G=self:GetParentOwner()local F=self:GetOwner()if F:IsValid()&&G:IsValid()&&G!=F then F:SetPos(G:EyePos())if self.OwnerEntity then self:SetOwnerEntity(self.OwnerEntity)end end;if self.BlurLength>0 then self.blur_history={}self.blur_last_add=0 end end;do function y:OnThink()pac.SetModelScale(self:GetOwner(),self.Scale*self.Size,nil,self.UseLegacyScale)self:CheckScale()self:CheckBoneMerge()local F=self:GetOwner()if F:IsValid()then F.pac_matproxies=F.pac_matproxies||{}F.pac_matproxies.ItemTintColor=self.TintColor/255 end end;do local NULL=NULL;local function H(I,J)local K="Set"..J;matproxy.Add({name=I,init=function(self,L,M)self.result=M.resultvar end,bind=function(self,L,F)F=F||NULL;if F:IsValid()then if F.pac_matproxies&&F.pac_matproxies[I]then L[K](L,self.result,F.pac_matproxies[I])end end end})end;H("ItemTintColor","Vector")end end;function y:SetOwnerEntity(D)local F=self:GetParentOwner()if F:IsValid()then if D then self.Owner=F;function F.RenderOverride()if self:IsValid()then if!self.HideEntity then self:PreEntityDraw(F,F:GetPos(),F:GetAngles())F:DrawModel()self:PostEntityDraw(F,F:GetPos(),F:GetAngles())end else F.RenderOverride=nil end end elseif self.OwnerEntity then self.Owner=NULL;F.RenderOverride=nil;pac.SetModelScale(F,Vector(1,1,1),nil,self.UseLegacyScale)self:Initialize()end end;self.OwnerEntity=D end;function y:PreEntityDraw(F,N,O)if!F:IsPlayer()&&N&&O then if!self.skip_orient then F:SetPos(N)F:SetAngles(O)end end;if self.Alpha!=0&&self.Size!=0 then self:ModifiersPreEvent("OnDraw")if!pac.DisableDoubleFace&&(self.DoubleFace||self.Invert)then g(MATERIAL_CULLMODE_CW)end;if!pac.DisableColoring then if!self.Colorf then self:SetColor(self:GetColor())end;if self.UseWeaponColor||self.UsePlayerColor then local P=self:GetPlayerOwner()if P:IsValid()then local Q;Q=P:GetPlayerColor()if Q!=self.last_playercolor then self:SetColor(self:GetColor())self.last_playercolor=Q end;Q=P:GetWeaponColor()if Q!=self.last_weaponcolor then self:SetColor(self:GetColor())self.last_weaponcolor=Q end end end;if self.Materialm then self.OriginalMaterialColor=self.OriginalMaterialColor||u(self.Materialm,"$color")self.OriginalMaterialAlpha=self.OriginalMaterialAlpha||t(self.Materialm,"$alpha")end;local R,S,D=self.Colorf[1],self.Colorf[2],self.Colorf[3]if self.LightBlend!=1 then local T=render.GetLightColor(N)R=R*T.r*self.LightBlend;S=S*T.g*self.LightBlend;D=D*T.b*self.LightBlend;T=render.GetAmbientLightColor(N)R=R*T.r*self.LightBlend;S=S*T.g*self.LightBlend;D=D*T.b*self.LightBlend end;h(R,S,D)i(self.Alpha)end;if self.Fullbright then s(true)end end end;local U=Vector(1,1,1)local V=Material("models/debug/debugwhite")function y:PostEntityDraw(F,N,O)if self.Alpha!=0&&self.Size!=0 then if!pac.DisableDoubleFace then if self.DoubleFace then g(MATERIAL_CULLMODE_CCW)self:DrawModel(F,N,O)elseif self.Invert then g(MATERIAL_CULLMODE_CCW)end end;if self.Fullbright then s(false)end;if self.CellShade>0 then self:CheckScale()self:CheckBoneMerge()pac.SetModelScale(F,self.Scale*self.Size*(1+self.CellShade),nil,self.UseLegacyScale)g(MATERIAL_CULLMODE_CW)h(0,0,0)s(true)l(V)self:DrawModel(F,N,O)l()s(false)g(MATERIAL_CULLMODE_CCW)pac.SetModelScale(F,self.Scale*self.Size,nil,self.UseLegacyScale)end;if self.Materialm then w(self.Materialm,"$color",self.OriginalMaterialColor||U)v(self.Materialm,"$alpha",self.OriginalMaterialAlpha||1)self.OriginalMaterialColor=nil;self.OriginalMaterialAlpha=nil end;self:ModifiersPostEvent("OnDraw")end end;function y:OnDraw()local F=self:GetOwner()if!F:IsValid()then self:Reset()F=self:GetOwner()if!F:IsValid()then pac.Message("WTF",F,self:GetOwner())return end end;local N,O=self:GetDrawPosition()self:PreEntityDraw(F,N,O)self:DrawModel(F,N,O)self:PostEntityDraw(F,N,O)pac.SetupBones(F)pac.ResetBones(F)if F.pac_can_legacy_scale!=false then F.pac_can_legacy_scale=!!F.pac_can_legacy_scale end end;surface.CreateFont("pac_urlobj_loading",{font="Arial",size=20,weight=10,antialias=true,outline=true})local function W(self,F,N,O)if self.Mesh then F:SetModelScale(0,0)F:DrawModel()local X=Matrix()X:SetAngles(O)X:SetTranslation(N)if F.pac_model_scale then X:Scale(F.pac_model_scale)else X:Scale(self.Scale*self.Size)end;e(X)self.Mesh:Draw()f()else F:DrawModel()end end;do local Y,Z,_,a0;local a1=false;local function a2()W(Y,Z,_,a0)end;local function a3()local L=Y.MaterialOverride||Y.Materialm;l(L)if L then j(L)end;pac.render_material=L;local a4=a(1,Y.Passes)if Y.Alpha>=1 then a4=b(a4,1)end;for B=1,a4 do local a5=ProtectedCall(a2)if!a5 then a1=false;return end end;r(true)ProtectedCall(a2)o()a1=true end;function y:DrawModel(F,N,O)if self.Alpha==0||self.Size==0 then return end;if self.loading_obj then self:DrawLoadingText(F,N,O)end;if self.loading_obj&&!self.Mesh then return end;local a6=self.texfilter_enum||TEXFILTER.ANISOTROPIC;local a7=a6!=TEXFILTER.ANISOTROPIC||self.Mesh;if a7 then q(a6)p(a6)end;Y,Z,_,a0=self,F,N,O;ProtectedCall(a3)if a7 then m()n()end;if self.BlurLength>0&&a1 then self:DrawBlur(F,N,O)end;l()end end;function y:DrawLoadingText(F,N,O)cam.Start2D()cam.IgnoreZ(true)local a8=N:ToScreen()surface.SetFont("pac_urlobj_loading")surface.SetTextColor(255,255,255,255)local A=self.loading_obj..string.rep(".",pac.RealTime*3%3)local a9,aa=surface.GetTextSize(self.loading_obj.."...")surface.SetTextPos(a8.x-a9/2,a8.y-aa/2)surface.DrawText(A)cam.IgnoreZ(false)cam.End2D()end;function y:DrawBlur(F,N,O)if pac.drawing_motionblur_alpha then return end;self.blur_history=self.blur_history||{}local ab=self.BlurSpacing;if!self.blur_last_add||ab==0||self.blur_last_add<pac.RealTime then c(self.blur_history,{N,O})self.blur_last_add=pac.RealTime+ab/1000 end;local ac=#self.blur_history;for ad=1,ac do N,O=self.blur_history[ad][1],self.blur_history[ad][2]i(self.Alpha*ad/ac)F:SetPos(N)F:SetAngles(O)pac.SetupBones(F)W(self,F,N,O)end;local ae=math.min(self.BlurLength,20)while#self.blur_history>=ae do d(self.blur_history,1)end end;local function af(ag,ah)local G=ag:GetOwner()ag.Mesh=ah;pac.ResetBoneCache(G)if!ag.Materialm then ag.Materialm=Material("error")end;function G.pacDrawModel(F,ai)if ai then W(ag,F,F:GetPos(),F:GetAngles())else ag:ModifiersPreEvent("OnDraw")ag:DrawModel(F,F:GetPos(),F:GetAngles())ag:ModifiersPostEvent("OnDraw")end end;G:SetRenderBounds(Vector(1,1,1)*-300,Vector(1,1,1)*300)end;do pac.urlobj=include("pac3/libraries/urlobj/urlobj.lua")function y:SetModel(aj)if aj:find("^mdlhttp")then self.Model=aj;aj=aj:gsub("^mdl","")pac.DownloadMDL(aj,function(ak)if self:IsValid()&&self:GetOwner():IsValid()then local F=self:GetOwner()self.loading=nil;pac.ResetBoneCache(F)F:SetModel(ak)end end,function(al)pac.Message(al)if self:IsValid()&&self:GetOwner():IsValid()then local F=self:GetOwner()self.loading=nil;pac.ResetBoneCache(F)F:SetModel("models/error.mdl")end end,self:GetPlayerOwner())return end;if aj&&aj:find("http")&&pac.urlobj then self.loading_obj="downloading"if!self.is_obj then self:Initialize(true)end;pac.urlobj.GetObjFromURL(aj,false,false,function(am,al)if!self:IsValid()then return end;self.loading_obj=false;if!am&&al then self:GetOwner():SetModel("models/error.mdl")self.Mesh=nil;return end;if table.Count(am)==1 then af(self,select(2,next(am)))else for C,ah in pairs(am)do local ag=pac.CreatePart("model",self:GetParentOwnerName())ag:SetName(C)ag:SetParent(self)ag:SetMaterial(self:GetMaterial())af(ag,ah)end;self:SetAlpha(0)end end,function(an,ao)if an then self.loading_obj=nil else self.loading_obj=ao end end)self.Model=aj;return end;if self.is_obj||!self.Owner:IsValid()then self:Initialize(false)end;self.Mesh=nil;local ap=aj;local aq=hook.Run("pac_model:SetModel",self,aj,self.ModelFallback)if aq==nil then ap=pac.FilterInvalidModel(ap,self.ModelFallback)else aj=aq||aj;ap=aj;ap=pac.FilterInvalidModel(ap,self.ModelFallback)end;self.Model=aj;pac.ResetBoneCache(self.Owner)self.Owner:SetModel(ap)if!self:IsHidden()&&!self:IsDrawHidden()then self:ShowFromRendering()end end end;local ar=Vector(1,1,1)function y:CheckScale()if(self.UseLegacyScale||self.BoneMerge)&&self.Owner:IsValid()&&self.Owner:GetBoneCount()&&self.Owner:GetBoneCount()>1 then if self.Scale*self.Size!=ar then if!self.requires_bone_model_scale then self.requires_bone_model_scale=true end;return true end;self.requires_bone_model_scale=false end end;function y:SetAlternativeScaling(D)self.AlternativeScaling=D;self:SetScale(self.Scale)end;function y:SetScale(as)as=as||Vector(1,1,1)self.Scale=as;if self.AlternativeScaling then if!self:CheckScale()then pac.SetModelScale(self.Owner,self.Scale,nil,self.UseLegacyScale)self.used_alt_scale=true end else if self.used_alt_scale then pac.SetModelScale(self.Owner,nil,1,self.UseLegacyScale)self.used_alt_scale=false end;if!self:CheckScale()then pac.SetModelScale(self.Owner,self.Scale*self.Size,nil,self.UseLegacyScale)end end end;function y:SetSize(as)as=as||1;self.Size=as;if self.AlternativeScaling then pac.SetModelScale(self.Owner,nil,self.Size,self.UseLegacyScale)self.used_alt_scale=true else if self.used_alt_scale then pac.SetModelScale(self.Owner,nil,1,self.UseLegacyScale)self.used_alt_scale=false end;if!self:CheckScale()then pac.SetModelScale(self.Owner,self.Scale*self.Size,nil,self.UseLegacyScale)end end end;function y:SetBrightness(z)self.Brightness=z;self:SetColor(self:GetColor())end;function y:SetColor(as)self.Color=as;local G=self:GetPlayerOwner()if self.UsePlayerColor&&G:IsValid()then local Q=G:GetPlayerColor()*self.Brightness;self.Colorf={Q.x,Q.y,Q.z}elseif self.UseWeaponColor&&G:IsValid()then local Q=G:GetWeaponColor()*self.Brightness;self.Colorf={Q.x,Q.y,Q.z}else self.Colorf={as.r/255*self.Brightness,as.g/255*self.Brightness,as.b/255*self.Brightness}end end;function y:SetUseWeaponColor(D)self.UseWeaponColor=D;self:SetColor(self:GetColor())end;function y:SetUsePlayerColor(D)self.UsePlayerColor=D;self:SetColor(self:GetColor())end;function y:FixMaterial()local L=self.Materialm;if!L then return end;local at=L:GetShader()if at=="UnlitGeneric"then local au=L:GetString("$basetexture")if au then local av={}av["$basetexture"]=au;av["$vertexcolor"]=1;av["$additive"]=1;self.Materialm=pac.CreateMaterial(pac.uid"pac_fixmat_","VertexLitGeneric",av)end end end;function y:SetMaterial(as)as=as||""if!pac.Handleurltex(self,as)then if as==""then self.Materialm=nil else self.Materialm=pac.Material(as,self)self:FixMaterial()self:CallRecursive("OnMaterialChanged")end end;self.Material=as end;function y:SetSkin(as)as=as||0;self.Skin=as;self.Owner:SetSkin(as)end;function y:OnRemove()if!self.OwnerEntity then timer.Simple(0,function()SafeRemoveEntity(self.Owner)end)end end;function y:SetLodOverride(z)local F=self.Owner;if F:IsValid()then F:SetLOD(z)self.LodOverride=z end end;function y:CheckBoneMerge()local F=self.Owner;if self.skip_orient then return end;if F:IsValid()&&!F:IsPlayer()then if self.BoneMerge then local G=self:GetParentOwner()if F:GetParent()!=G then F:SetParent(G)if!F:IsEffectActive(EF_BONEMERGE)then F:AddEffects(EF_BONEMERGE)end end else if F:GetParent():IsValid()then F:SetParent(NULL)if F:IsEffectActive(EF_BONEMERGE)then F:RemoveEffects(EF_BONEMERGE)end;self.requires_bone_model_scale=false end end end end;local aw=Vector(1,1,1)function y:OnBuildBonePositions()if self.AlternativeScaling then return end;local F=self:GetOwner()local G=self:GetParentOwner()if!F:IsValid()||!G:IsValid()||!F:GetBoneCount()||F:GetBoneCount()<1 then return end;if self.requires_bone_model_scale then local ax=self.Scale*self.Size;for ad=0,F:GetBoneCount()-1 do if ad==0 then F:ManipulateBoneScale(ad,F:GetManipulateBoneScale(ad)*Vector(ax.x^0.25,ax.y^0.25,ax.z^0.25))else F:ManipulateBonePosition(ad,F:GetManipulateBonePosition(ad)+Vector((ax.x-1)^4,0,0))F:ManipulateBoneScale(ad,F:GetManipulateBoneScale(ad)*ax)end end end end;x:Register()
--addons/!lpakr_out/lua/pac3/libraries/webaudio/streams.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/select.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/view.lua:
local a=pace.LanguageString;local b=function(c,d)pace["View"..c]=d;pace["SetView"..c]=function(e)pace["View"..c]=e end;pace["GetView"..c]=function()return pace["View"..c]||d end end;b("Entity",NULL)b("Pos",Vector(5,5,5))b("Angles",Angle(0,0,0))b("FOV",75)function pace.GetViewEntity()return pace.ViewEntity:IsValid()&&pace.ViewEntity||pac.LocalPlayer end;function pace.ResetView()if pace.Focused then local f=pace.GetViewEntity()if!f:IsValid()then local g,h=next(pac.GetLocalParts())if h then f=h:GetOwner()end end;if f:IsValid()then local i=f.EyeAngles&&f:EyeAngles()||f:GetAngles()if f==pac.LocalPlayer&&f:GetVehicle():IsValid()then local j=f:GetVehicle():GetAngles()i=i+j end;i=i:Forward()i.z=0;pace.ViewPos=f:EyePos()+i*128;pace.ViewAngles=(f:EyePos()-pace.ViewPos):Angle()pace.ViewAngles:Normalize()end end end;function pace.SetZoom(k,l)if l then pace.ViewFOV=Lerp(FrameTime()*10,pace.ViewFOV,math.Clamp(k,1,100))else pace.ViewFOV=math.Clamp(k,1,100)end end;function pace.ResetZoom()pace.zoom_reset=75 end;local m=vgui.GetWorldPanel()function m.OnMouseWheeled(self,n)if IsValid(pace.Editor)then local o=GetConVar("pac_zoom_mousewheel")if o:GetInt()==1 then local p=10;if input.IsKeyDown(KEY_LSHIFT)then p=50 end;if input.IsKeyDown(KEY_LCONTROL)then p=1 end;if vgui.GetHoveredPanel()==m then pace.Editor.zoomslider:SetValue(pace.ViewFOV-n*p)end end end end;local q=Angle(0,0,0)local r=Vector(0,0,0)local s,t,u;function pace.GUIMousePressed(v)if pace.mctrl.GUIMousePressed(v)then return end;if v==MOUSE_LEFT&&!pace.editing_viewmodel then q=pace.ViewAngles*1;r=Vector(input.GetCursorPos())end;if v==MOUSE_RIGHT then pace.Call("OpenMenu")end;t=vgui.GetHoveredPanel()if IsValid(t)then t:SetCursor('sizeall')end;s=v;u=true end;function pace.GUIMouseReleased(v)u=false;if IsValid(t)then t:SetCursor('arrow')t=nil end;if pace.mctrl.GUIMouseReleased(v)then return end;if pace.editing_viewmodel||pace.editing_hands then return end;s=nil;if!GetConVar("pac_enable_editor_view"):GetBool()then pace.EnableView(true)else pac.RemoveHook("CalcView","camera_part")pac.AddHook("GUIMousePressed","editor",pace.GUIMousePressed)pac.AddHook("GUIMouseReleased","editor",pace.GUIMouseReleased)pac.AddHook("ShouldDrawLocalPlayer","editor",pace.ShouldDrawLocalPlayer,DLib&&-4||ULib&&-1||nil)pac.AddHook("CalcView","editor",pace.CalcView,DLib&&-4||ULib&&-1||nil)pac.AddHook("HUDPaint","editor",pace.HUDPaint)pac.AddHook("HUDShouldDraw","editor",pace.HUDShouldDraw)pac.AddHook("PostRenderVGUI","editor",pace.PostRenderVGUI)end end;local function w(x,y)input.SetCursorPos(x,y)q=pace.ViewAngles*1;r=Vector(x,y)return r*1 end;local z=Vector(0,0,0)local function A()if pace.BusyWithProperties:IsValid()||pace.ActiveSpecialPanel:IsValid()||pace.editing_viewmodel||pace.editing_hands||pace.properties.search:HasFocus()then return end;local B=vgui.GetKeyboardFocus()if B&&B:IsValid()&&B:GetName():lower():find('textentry')then return end;if!system.HasFocus()then r=Vector(input.GetCursorPos())end;local C=FrameTime()*50;local D=5;if input.IsKeyDown(KEY_LCONTROL)||input.IsKeyDown(KEY_RCONTROL)then D=0.1 end;local E;local h=pace.current_part||NULL;if!h:IsValid()then return end;local F=h:GetRootPart():GetOwner()if!F:IsValid()then F=pac.LocalPlayer end;E=F:GetPos()if F==pac.WorldEntity then if h:HasChildren()then for c,G in ipairs(h:GetChildren())do if G.GetDrawPosition then h=G;break end end end end;if h.GetDrawPosition then E=h:GetDrawPosition()end;if!E||E==z then E=pac.LocalPlayer:GetPos()end;D=D*math.min(E:Distance(pace.ViewPos)/200,3)if input.IsKeyDown(KEY_LSHIFT)then D=D+5 end;if!pace.IsSelecting then if s==MOUSE_LEFT then local H=Vector(input.GetCursorPos())if H.x>=ScrW()-1 then H=w(1,gui.MouseY())elseif H.x<1 then H=w(ScrW()-2,gui.MouseY())end;if H.y>=ScrH()-1 then H=w(gui.MouseX(),1)elseif H.y<1 then H=w(gui.MouseX(),ScrH()-2)end;local I=(r-H)/5*math.rad(pace.ViewFOV)pace.ViewAngles.p=math.Clamp(q.p-I.y,-90,90)pace.ViewAngles.y=q.y+I.x end end;if input.IsKeyDown(KEY_W)then pace.ViewPos=pace.ViewPos+pace.ViewAngles:Forward()*D*C elseif input.IsKeyDown(KEY_S)then pace.ViewPos=pace.ViewPos-pace.ViewAngles:Forward()*D*C end;if input.IsKeyDown(KEY_D)then pace.ViewPos=pace.ViewPos+pace.ViewAngles:Right()*D*C elseif input.IsKeyDown(KEY_A)then pace.ViewPos=pace.ViewPos-pace.ViewAngles:Right()*D*C end;if input.IsKeyDown(KEY_SPACE)then if!IsValid(pace.timeline.frame)then pace.ViewPos=pace.ViewPos+pace.ViewAngles:Up()*D*C end end end;local J=CreateClientConVar("pac_camera_follow_entity","0",true)local K=CreateClientConVar("pac_enable_editor_view","1",true)local L;function pace.CalcView(M,N,j,k)if pace.editing_viewmodel||pace.editing_hands then pace.ViewPos=N;pace.ViewAngles=j;pace.ViewFOV=k;return end;if J:GetBool()then local f=pace.GetViewEntity()local N=f:GetPos()L=L||N;pace.ViewPos=pace.ViewPos+N-L;L=N else L=nil end;local N,j,k=pac.CallHook("EditorCalcView",pace.ViewPos,pace.ViewAngles,pace.ViewFOV)if N then pace.ViewPos=N end;if j then pace.ViewAngles=j end;if k then pace.ViewFOV=k end;return{origin=pace.ViewPos,angles=pace.ViewAngles,fov=pace.ViewFOV}end;function pace.ShouldDrawLocalPlayer()if!pace.editing_viewmodel&&!pace.editing_hands then return true end end;local O;local P,Q=0,0;function pace.FlashNotification(R,S)S=S||math.Clamp(#R/6,1,8)P=RealTime()+S;Q=RealTime()+S*1.1;O=R end;function pace.PostRenderVGUI()if!pace.mctrl then return end;local T=RealTime()if Q>T then if P>T then surface.SetTextColor(color_white)else surface.SetTextColor(255,255,255,255*(Q-RealTime())/(Q-P))end;surface.SetFont('Trebuchet18')local U=surface.GetTextSize(O)surface.SetTextPos(ScrW()/2-U/2,30)surface.DrawText(O)end;if!u then return end;if pace.mctrl.LastThinkCall!=FrameNumber()then surface.SetFont('Trebuchet18')surface.SetTextColor(color_white)local R=a'You are currently holding the camera, movement is disabled'local U=surface.GetTextSize(R)surface.SetTextPos(ScrW()/2-U/2,10)surface.DrawText(R)end end;function pace.EnableView(V)if V then pac.AddHook("GUIMousePressed","editor",pace.GUIMousePressed)pac.AddHook("GUIMouseReleased","editor",pace.GUIMouseReleased)pac.AddHook("ShouldDrawLocalPlayer","editor",pace.ShouldDrawLocalPlayer,DLib&&-4||ULib&&-1||nil)pac.AddHook("CalcView","editor",pace.CalcView,DLib&&-4||ULib&&-1||nil)pac.RemoveHook("CalcView","camera_part")pac.AddHook("HUDPaint","editor",pace.HUDPaint)pac.AddHook("HUDShouldDraw","editor",pace.HUDShouldDraw)pac.AddHook("PostRenderVGUI","editor",pace.PostRenderVGUI)pace.Focused=true;pace.ResetView()else L=nil;pac.RemoveHook("GUIMousePressed","editor")pac.RemoveHook("GUIMouseReleased","editor")pac.RemoveHook("ShouldDrawLocalPlayer","editor")pac.RemoveHook("CalcView","editor")pac.RemoveHook("CalcView","camera_part")pac.RemoveHook("HUDPaint","editor")pac.RemoveHook("HUDShouldDraw","editor")pac.RemoveHook("PostRenderVGUI","editor")pace.SetTPose(false)end;if!K:GetBool()then local M=LocalPlayer()pac.RemoveHook("CalcView","editor")pac.AddHook("CalcView","camera_part",function(M,N,j,k,W,X)for g,h in pairs(pac.GetLocalParts())do if h:IsValid()&&h.ClassName=="camera"then h:CalcShowHide()local Y={}if!h:IsHidden()then N,j,k,W,X=h:CalcView(g,g,M:EyeAngles())Y.origin=N;Y.angles=j;Y.fov=k;Y.znear=W;Y.zfar=X;Y.drawviewer=!h.DrawViewModel;return Y end end end end)end end;local function Z(f)if f.SetEyeAngles then f:SetEyeAngles(Angle(0,0,0))end end;local _={"body_rot_z","spine_rot_z","head_rot_z","head_rot_y","head_rot_x","walking","running","swimming","rhand","lhand","rfoot","lfoot","move_yaw","aim_yaw","aim_pitch","breathing","vertical_velocity","vehicle_steer","body_yaw","spine_yaw","head_yaw","head_pitch","head_roll"}function pace.GetTPose()return pace.tposed end;function pace.SetViewPart(h,a0)pace.SetViewEntity(h:GetRootPart():GetOwner())if a0 then pace.ResetView()end end;function pace.HUDPaint()if s&&!input.IsMouseDown(s)then s=nil end;local f=pace.GetViewEntity()if pace.IsFocused()then A()if f:IsValid()then pace.Call("Draw",ScrW(),ScrH())end end end;function pace.HUDShouldDraw(a1)if a1=="CHudEPOE"||a1=="CHudCrosshair"&&(pace.editing_viewmodel||pace.editing_hands)then return false end end;function pace.OnToggleFocus(a2)if pace.Focused then pace.KillFocus(a2)else pace.GainFocus(a2)end end;function pace.SetTPose(V)local M=pac.LocalPlayer;if V then M.pace_tpose_last_sequence=M:GetSequence()M.pace_tpose_last_layer_sequence={}for a3=0,16 do M.pace_tpose_last_layer_sequence[a3]=M:GetLayerSequence(a3)end;local function a4(M)local j=M:EyeAngles()j.p=0;M:SetEyeAngles(j)M:SetRenderAngles(j)M:SetAngles(j)end;local function a5(M)local a6=M:LookupSequence("reference")local a7=M:LookupSequence("ragdoll")return a6!=-1&&a6||a7!=-1&&a7||0 end;pac.AddHook("PrePlayerDraw","pace_tpose",function(M)if M!=pac.LocalPlayer then return end;for a3=0,16 do M:SetLayerSequence(a3,0)end;M:SetSequence(a5(M))a4(M)end)pac.AddHook("UpdateAnimation","pace_tpose",function()local M=pac.LocalPlayer;M:ClearPoseParameters()a4(M)for a3=0,M:GetNumPoseParameters()-1 do local a8=M:GetPoseParameterName(a3)if a8 then M:SetPoseParameter(a8,0)end end end)pac.AddHook("CalcMainActivity","pace_tpose",function(M)if M==pac.LocalPlayer then for a3=0,16 do M:SetLayerSequence(a3,0)end;local a9=a5(M)return a9,a9 end end)else pac.RemoveHook("PrePlayerDraw","pace_tpose")pac.RemoveHook("UpdateAnimation","pace_tpose")pac.RemoveHook("CalcMainActivity","pace_tpose")if M.pace_tpose_last_sequence then M:SetSequence(M.pace_tpose_last_sequence)M.pace_tpose_last_sequence=nil end;if M.pace_tpose_last_layer_sequence then for a3,aa in ipairs(M.pace_tpose_last_layer_sequence)do M:SetLayerSequence(a3,aa)end;M.pace_tpose_last_layer_sequence=nil end end;pace.tposed=V end;pace.SetTPose(pace.tposed)function pace.ToggleCameraFollow()local ab=GetConVar("pac_camera_follow_entity")RunConsoleCommand("pac_camera_follow_entity",ab:GetBool()&&"0"||"1")end;function pace.GetBreathing()return pace.breathing end;function pace.ResetEyeAngles()local f=pace.GetViewEntity()if f:IsValid()then if f:IsPlayer()then RunConsoleCommand("+forward")timer.Simple(0,function()RunConsoleCommand("-forward")timer.Simple(0.1,function()RunConsoleCommand("+back")timer.Simple(0.015,function()RunConsoleCommand("-back")end)end)end)f:SetEyeAngles(Angle(0,0,0))else f:SetAngles(Angle(0,0,0))end;pac.SetupBones(f)end end
--addons/!lpakr_out/lua/pac3/editor/client/animation_timeline.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/panels/list.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/pac_extra_init.lua:
if CLIENT&&pac&&pace&&pacx&&!VLL_CURR_FILE&&!VLL2_FILEDEF then return end;if!pace then include("autorun/pac_editor_init.lua")end;if!pace then error("pac extra requires the pac editor")end;if CLIENT then include("pac3/extra/client/init.lua")end
--addons/!lpakr_out/lua/pac3/extra/shared/projectiles.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/prone_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/rb655_make_animatable.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/rb655_make_animatable.lua:
if CLIENT then return end;local a={['prop_animatable']=true,['func_door']=true,['func_button']=true,['func_brush']=true}concommand.Add('srp_animate',function(b)local c=b:GetEyeTraceNoCursor().Entity;if!IsValid(c)then return end;if a[c:GetClass()]||c:IsPlayer()then return end;local d=ents.Create'prop_animatable'd:SetModel(c:GetModel())d:SetPos(c:GetPos())d:SetAngles(c:GetAngles())d:SetSkin(c:GetSkin())d:SetFlexScale(c:GetFlexScale())for e=0,c:GetFlexNum()-1 do d:SetFlexWeight(e,c:GetFlexWeight(e))end;for e=0,c:GetNumBodyGroups()-1 do d:SetBodygroup(e,c:GetBodygroup(e))end;for e=0,c:GetBoneCount()do d:ManipulateBoneScale(e,c:GetManipulateBoneScale(e))d:ManipulateBoneAngles(e,c:GetManipulateBoneAngles(e))d:ManipulateBonePosition(e,c:GetManipulateBonePosition(e))d:ManipulateBoneJiggle(e,c:GetManipulateBoneJiggle(e))end;d:Spawn()d:Activate()d.EntityMods=c.EntityMods;d.BoneMods=c.BoneMods;duplicator.ApplyEntityModifiers(nil,d)duplicator.ApplyBoneModifiers(nil,d)if string.find(c:GetClass(),"prop_ragdoll")||c:IsNPC()then d:FixRagdoll()end;undo.ReplaceEntity(c,d)cleanup.ReplaceEntity(c,d)constraint.RemoveAll(c)c:Remove()end)
--addons/!lpakr_out/lua/autorun/sh_witcherdoorutil.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/sh_zladder.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/anim_extension/loader/loader.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/anim_extension/loader/loader.lua:
wOS=wOS||{}wOS.AnimExtension=wOS.AnimExtension||{}wOS.AnimExtension.Mounted=wOS.AnimExtension.Mounted||{}local string=string;local file=file;local function a(b)end;local function c(d,b)if d then include(b)end end;function wOS.AnimExtension:Autoloader()for e,f in pairs(file.Find("wos/anim_extension/extensions/*","LUA"),true)do local b="wos/anim_extension/extensions/"..f;a(b)c(SERVER,b)c(CLIENT,b)end;a("wos/anim_extension/vgui/wiltos_anim_viewer.lua")c(CLIENT,"wos/anim_extension/vgui/wiltos_anim_viewer.lua")a("wos/anim_extension/core/sh_metatable.lua")c(SERVER,"wos/anim_extension/core/sh_metatable.lua")c(CLIENT,"wos/anim_extension/core/sh_metatable.lua")a("wos/anim_extension/core/sh_holdtypes.lua")c(SERVER,"wos/anim_extension/core/sh_holdtypes.lua")c(CLIENT,"wos/anim_extension/core/sh_holdtypes.lua")a("wos/anim_extension/core/sh_prone_support.lua")c(SERVER,"wos/anim_extension/core/sh_prone_support.lua")c(CLIENT,"wos/anim_extension/core/sh_prone_support.lua")for e,f in pairs(file.Find("wos/anim_extension/holdtypes/*","LUA"),true)do local b="wos/anim_extension/holdtypes/"..f;a(b)c(SERVER,b)c(CLIENT,b)end end;wOS.AnimExtension:Autoloader()
--addons/!lpakr_out/lua/wos/anim_extension/vgui/wiltos_anim_viewer.lua:
wOS=wOS||{}local a,b=ScrW(),ScrH()surface.CreateFont("wOS.Anim.TitleFont",{font="Roboto Cn",extended=false,size=24*b/1200,weight=1000,blursize=0,scanlines=0,antialias=true,underline=false,italic=false,strikeout=false,symbol=false,rotary=false,shadow=false,additive=false,outline=false})surface.CreateFont("wOS.Anim.DescFont",{font="Roboto Cn",extended=false,size=18*b/1200,weight=500,blursize=0,scanlines=0,antialias=true,underline=false,italic=false,strikeout=false,symbol=false,rotary=false,shadow=false,additive=false,outline=false})function wOS:OpenAnimationMenu()if self.OverFrame then self.OverFrame:Remove()self.OverFrame=nil;gui.EnableScreenClicker(false)return end;self.OverFrame=vgui.Create("DFrame")self.OverFrame:SetSize(a,b)self.OverFrame:Center()self.OverFrame.Paint=function()end;self.OverFrame:SetTitle("")self.OverFrame:ShowCloseButton(false)self.OverFrame:SetDraggable(false)gui.EnableScreenClicker(true)self.AnimMenu=vgui.Create("DFrame",self.OverFrame)self.AnimMenu:SetSize(a*0.5,b*0.5)self.AnimMenu:Center()self.AnimMenu.Display=LocalPlayer():GetModel()self.AnimMenu:MakePopup()self.AnimMenu:SetTitle("")self.AnimMenu:ShowCloseButton(false)self.AnimMenu:SetDraggable(false)local c,d=self.AnimMenu:GetSize()local e=d*0.025;local f=e;local g=vgui.Create("DAdjustableModelPanel",self.AnimMenu)g:SetPos(e,f)g:SetSize(c/2-e-e/2,d-2*f)g.LayoutEntity=function()local h=g:GetEntity()h:SetEyeTarget(g:GetCamPos())h:FrameAdvance(FrameTime())end;self.AnimMenu.Paint=function(i,j,k)if!vgui.CursorVisible()then gui.EnableScreenClicker(true)end;draw.RoundedBox(3,0,0,j,k,Color(25,25,25,245))surface.SetDrawColor(Color(0,155,155,255))surface.DrawOutlinedRect(e,f,g:GetWide(),g:GetTall())end;local l=vgui.Create("DListView",self.AnimMenu)l:SetPos(c/2+e/2,f)l:SetSize(c/2-e-e/2,d*0.77-f)l:AddColumn("Name")l:SetMultiSelect(false)l:SetHideHeaders(true)l.Pages={}l.CurrentPage=1;function l:Think()if wOS.AnimMenu.Display!=g:GetModel()then g:RebuildModel()end end;function l:RebuildCache(h)l:Clear()l.BasePages={}l.Pages={}l.CurrentPage=1;local m=500;local n=0;local o=1;for p,q in SortedPairsByValue(h:GetSequenceList())do if!l.BasePages[o]then l.BasePages[o]={}end;if n<m then table.insert(l.BasePages[o],string.lower(q))if o==1 then local r=l:AddLine(string.lower(q))r.OnSelect=function()h:ResetSequence(q)h:SetCycle(0)end end;n=n+1 else o=o+1;n=0 end end;l.Pages=l.BasePages end;function l:RebuildToLines(h,s)l:Clear()l.Pages={}l.CurrentPage=1;local m=500;local n=0;local o=1;for p,q in SortedPairsByValue(s)do if!l.Pages[o]then l.Pages[o]={}end;if n<m then table.insert(l.Pages[o],string.lower(q))if o==1 then local r=l:AddLine(string.lower(q))r.OnSelect=function()h:ResetSequence(q)h:SetCycle(0)end end;n=n+1 else o=o+1;n=0 end end end;function l:ChangePage(t)l:Clear()if!t then return end;if!l.Pages[t]then return end;local h=g:GetEntity()for p,q in pairs(l.Pages[t])do local r=l:AddLine(string.lower(q))r.OnSelect=function()h:ResetSequence(q)h:SetCycle(0)end end;l:SelectFirstItem()end;function g:RebuildModel()g:SetModel(wOS.AnimMenu.Display)local h=g:GetEntity()local u=h:GetPos()local v=u+Vector(-150,0,0)g:SetCamPos(v)g:SetFOV(45)g:SetLookAng((v*-1):Angle())l:RebuildCache(g:GetEntity())end;local w=vgui.Create("DButton",self.AnimMenu)w:SetSize(c*0.15,d*0.05)w:SetPos(c*0.85-e,d*0.95-f*1.5-w:GetTall())w:SetText("")w.Paint=function(i,j,k)draw.RoundedBox(5,0,0,j,k,i:IsDown()&&Color(0,55,155,155)||Color(155,155,155,155))draw.SimpleText("NEXT PAGE","wOS.Anim.DescFont",j/2,k/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;w.DoClick=function(i)l.CurrentPage=math.Clamp(l.CurrentPage+1,1,#l.Pages)l:ChangePage(l.CurrentPage)end;local x=vgui.Create("DLabel",self.AnimMenu)x:SetSize(c*0.15,d*0.05)x:SetPos(c/2+e/2,d*0.95-f*2-w:GetTall()-x:GetTall())x:SetText("")x.Paint=function(i,j,k)draw.RoundedBox(5,0,0,j,k,Color(155,155,155,155))draw.SimpleText("PAGE: "..l.CurrentPage.."/"..#l.Pages,"wOS.Anim.DescFont",j/2,k/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;local y=vgui.Create("DTextEntry",self.AnimMenu)y:SetSize(c*0.15*1.5,d*0.05*0.8)y:SetPos(c*0.85-e+c*0.15-y:GetWide(),d*0.95-f*2-w:GetTall()-d*0.05/2-y:GetTall()/2)y:SetFont("wOS.Anim.DescFont")y:SetText("")local z=vgui.Create("DButton",self.AnimMenu)z:SetSize(c*0.15*0.5,d*0.05)z:SetPos(c/2+e/2+c*0.15+e,d*0.95-f*2-w:GetTall()-z:GetTall())z:SetText("")z.Paint=function(i,j,k)draw.RoundedBox(5,0,0,j,k,i:IsDown()&&Color(0,55,155,155)||Color(155,155,155,155))draw.SimpleText("SEARCH","wOS.Anim.DescFont",j/2,k/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;z.DoClick=function(i)local A=string.lower(y:GetValue())local t=1;local r=0;if A==""then l.Pages=l.BasePages;l:ChangePage(t)else local B={}for C=1,#l.BasePages do for D,q in ipairs(l.BasePages[C])do if string.find(q,A)then table.insert(B,q)end end end;l:RebuildToLines(g:GetEntity(),B)end end;local E=vgui.Create("DButton",self.AnimMenu)E:SetSize(c*0.15,d*0.05)E:SetPos(c/2+e/2,d*0.95-f*1.5-E:GetTall())E:SetText("")E.Paint=function(i,j,k)draw.RoundedBox(5,0,0,j,k,i:IsDown()&&Color(0,55,155,155)||Color(155,155,155,155))draw.SimpleText("PREVIOUS PAGE","wOS.Anim.DescFont",j/2,k/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;E.DoClick=function(i)l.CurrentPage=math.Clamp(l.CurrentPage-1,1,#l.Pages)l:ChangePage(l.CurrentPage)end;local F=vgui.Create("DButton",self.AnimMenu)F:SetSize(c*0.15,d*0.05)F:SetPos(c/2+e/2+F:GetWide()+e,d*0.95-f*1.5-F:GetTall())F:SetText("")F.Paint=function(i,j,k)draw.RoundedBox(5,0,0,j,k,i:IsDown()&&Color(0,55,155,155)||Color(155,155,155,155))draw.SimpleText("REPLAY SELECTION","wOS.Anim.DescFont",j/2,k/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;F.DoClick=function(i)local G=l:GetSelectedLine()if!G then return end;local h=g:GetEntity()h:ResetSequence(l:GetLines()[G]:GetValue(1))h:SetCycle(0)end;local H=vgui.Create("DButton",self.AnimMenu)H:SetSize(c*0.3,d*0.05)H:SetPos(c/2+c*0.1,d*0.95-f)H:SetText("")H.Paint=function(i,j,k)draw.RoundedBox(5,0,0,j,k,i:IsDown()&&Color(0,55,155,155)||Color(155,155,155,155))draw.SimpleText("CLOSE MENU","wOS.Anim.DescFont",j/2,k/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;H.DoClick=function(i)wOS:OpenAnimationMenu()end;local I,J=g:GetSize()local K=vgui.Create("DPanel",g)K:SetSize(I,J*0.2)K:SetPos(0,J*0.8)K.Paint=function(i,j,k)if!l:GetLines()[l:GetSelectedLine()]then return end;local L=l:GetLines()[l:GetSelectedLine()]:GetValue(1)local h=g:GetEntity()local M=h:LookupSequence(L)draw.SimpleText("SEQUENCE: "..L,"wOS.Anim.DescFont",j/2,k*0.25,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)if M then local N=h:GetSequenceActivityName(M)M=h:GetSequenceActivity(M)if!M then draw.SimpleText("ACT ID: NONE","wOS.Anim.DescFont",j/2,k*0.5,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)else draw.SimpleText("ACT ID: "..M,"wOS.Anim.DescFont",j/2,k*0.5,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;if!N then draw.SimpleText("ACT NAME: N/A","wOS.Anim.DescFont",j/2,k*0.75,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)else draw.SimpleText("ACT NAME: "..N,"wOS.Anim.DescFont",j/2,k*0.75,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end end;local O=vgui.Create("DFrame",self.OverFrame)O:SetSize(c*0.3,d*0.1)O:SetPos(c*1.5+c*0.01,d-d/2)O:SetText("")O:SetTitle("")O:ShowCloseButton(false)O:SetDraggable(false)O.Paint=function(i,j,k)draw.RoundedBox(3,0,0,j,k,Color(25,25,25,245))end;O.Think=function(i)local P=d*0.1;if i.Expand then P=d end;i:SetTall(math.Approach(i:GetTall(),P,15))end;O.Expand=false;O:MakePopup()local Q,R=O:GetSize()local S=vgui.Create("DButton",O)S:SetSize(Q*0.9,d*0.05)S:SetPos(Q*0.05,R-d*0.075)S:SetText("")S.Paint=function(i,j,k)draw.RoundedBox(5,0,0,j,k,i:IsDown()&&Color(0,55,155,155)||Color(155,155,155,155))draw.SimpleText(O.Expand&&"Close Holdtype Creator"||"Open Holdtype Creator","wOS.Anim.DescFont",j/2,k/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;local T={["Idle Standing"]="ACT_MP_STAND_IDLE",["Slow Walk"]="ACT_MP_WALK",["Running"]="ACT_MP_RUN",["Sprinting"]="ACT_MP_SPRINT",["Idle Crouching"]="ACT_MP_CROUCH_IDLE",["Walk Crouching"]="ACT_MP_CROUCHWALK",["Attack Standing"]="ACT_MP_ATTACK_STAND_PRIMARYFIRE",["Attack Crouching"]="ACT_MP_ATTACK_CROUCH_PRIMARYFIRE",["Reload Standing"]="ACT_MP_RELOAD_STAND",["Reload Crouching"]="ACT_MP_RELOAD_CROUCH",["Swimming"]="ACT_MP_SWIM",["Jumping"]="ACT_MP_JUMP",["Landing"]="ACT_LAND"}local L=vgui.Create("DLabel",O)L:SetSize(Q*0.8,d*0.05)L:SetPos(Q*0.05,R)L:SetText("Base Holdtype:")L:SetFont("wOS.Anim.TitleFont")local U=vgui.Create("DTextEntry",O)U:SetSize(Q*0.8,d*0.03)U:SetPos(Q*0.05,R+d*0.05)local V=vgui.Create("DImageButton",O)V:SetSize(d*0.03,d*0.03)V:SetPos(Q*0.86,R+d*0.05)V:SetImage("icon16/application_view_list.png")V.DoClick=function(i)if i.ItemIconOptions then i.ItemIconOptions:Remove()i.ItemIconOptions=nil end;i.ItemIconOptions=DermaMenu(V)i.ItemIconOptions:MakePopup()i.ItemIconOptions:SetPos(gui.MouseX(),gui.MouseY())i.ItemIconOptions.Think=function(self)if!i then self:Remove()end end;local W={"pistol","smg","grenade","ar2","shotgun","rpg","physgun","crossbow","melee","slam","normal","fist","melee2","passive","knife","duel","camera","magic","revolver"}for X,D in pairs(wOS.AnimExtension.TranslateHoldType)do table.insert(W,X)end;for D,Y in ipairs(W)do i.ItemIconOptions:AddOption(Y,function(self)U:SetText(Y)self:Remove()end)end end;local L=vgui.Create("DLabel",O)L:SetSize(Q*0.9,d*0.05)L:SetPos(Q*0.05,R+d*0.09)L:SetText("Holdtype Name:")L:SetFont("wOS.Anim.TitleFont")local Z=vgui.Create("DTextEntry",O)Z:SetSize(Q*0.9,d*0.03)Z:SetPos(Q*0.05,R+d*0.15)local L=vgui.Create("DLabel",O)L:SetSize(Q*0.9,d*0.05)L:SetPos(Q*0.05,R+d*0.19)L:SetText("Holdtype Code:")L:SetFont("wOS.Anim.TitleFont")local _=vgui.Create("DTextEntry",O)_:SetSize(Q*0.9,d*0.03)_:SetPos(Q*0.05,R+d*0.25)_:SetText("wos-custom-xxx")local a0=vgui.Create("DLabel",O)a0:SetSize(Q*0.9,d*0.05)a0:SetPos(Q*0.05,R+d*0.29)a0:SetText("Current Action:")a0:SetFont("wOS.Anim.TitleFont")local a1=vgui.Create("DComboBox",O)a1:SetSize(Q*0.9,d*0.03)a1:SetPos(Q*0.05,R+d*0.35)a1:SetValue("Idle Standing")for M,D in pairs(T)do a1:AddChoice(M)end;local a2=vgui.Create("DButton",O)a2:SetSize(Q*0.9,d*0.05)a2:SetPos(Q*0.05,d*0.515)a2:SetText("")a2.Paint=function(i,j,k)draw.RoundedBox(5,0,0,j,k,i:IsDown()&&Color(0,55,155,155)||Color(155,155,155,155))draw.SimpleText("Add Selected Sequence","wOS.Anim.DescFont",j/2,k/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;local a3=vgui.Create("DListView",O)a3:SetSize(Q*0.9,d*0.3)a3:SetPos(Q*0.05,d*0.6)a3:SetMultiSelect(false)a3:AddColumn("Animation")a3:AddColumn("Weight")a3.OnRowRightClick=function(i,a4,r)if i.ItemIconOptions then i.ItemIconOptions:Remove()i.ItemIconOptions=nil end;i.ItemIconOptions=DermaMenu(a3)i.ItemIconOptions:MakePopup()i.ItemIconOptions:SetPos(gui.MouseX(),gui.MouseY())i.ItemIconOptions.Think=function(self)if!i then self:Remove()end end;i.ItemIconOptions:AddOption("Change Weight",function(self)local a5=vgui.Create("DNumberScratch",O:GetParent())a5:SetSize(1,1)a5:Center()a5:MakePopup()a5:SetValue(i.Selections[i.ActSelect][r:GetValue(1)]*100||100)a5:SetMin(0)a5:SetMax(100)a5.OnMousePressed=function()end;a5.OnMouseReleased=function()end;a5.OnValueChanged=function(a6)i.Selections[i.ActSelect][r:GetValue(1)]=math.Round(a6:GetFloatValue())/100 end;a5.Think=function(a6)if input.IsMouseDown(MOUSE_LEFT)||input.IsMouseDown(MOUSE_RIGHT)then a6:Remove()a3:ReloadAll()return end;a6:SetActive(true)a6:MouseCapture(true)a6:LockCursor()if!system.IsLinux()then a6:SetCursor("none")end;a6:SetShouldDrawScreen(true)end;hook.Add("DrawOverlay","wOS.AnimExtension.ReallyFuckedUpWorkAround",function()if!IsValid(a5)then hook.Remove("DrawOverlay","wOS.AnimExtension.ReallyFuckedUpWorkAround")return end;a5:PaintScratchWindow()end)self:Remove()end)i.ItemIconOptions:AddOption("Remove",function(self)i.Selections[i.ActSelect][r:GetValue(1)]=nil;i:RemoveLine(a4)self:Remove()end)end;a3.Selections={}a3.ActSelect=a1:GetValue()a3.ReloadAll=function(i)i:Clear()if i.Selections[i.ActSelect]then for a7,a8 in pairs(i.Selections[i.ActSelect])do i:AddLine(a7,a8*100 .."%")end end end;a3:ReloadAll()a2.DoClick=function(i)local a9=l:GetSelected()[1]if a9 then a3:AddLine(a9:GetValue(1),"100%")if!a3.Selections[a3.ActSelect]then a3.Selections[a3.ActSelect]={}end;a3.Selections[a3.ActSelect][a9:GetValue(1)]=1 end end;a1.OnSelect=function(aa,ab,ac)a3.ActSelect=ac;a3:ReloadAll()end;S.DoClick=function(i)O.Expand=!O.Expand;if!O.Expand then U:SetText("")Z:SetText("")_:SetText("wos-custom-xxx")a1:SetValue("Idle Standing")a3.ActSelect="Idle Standing"a3.Selections={}a3:ReloadAll()end end;local ad=vgui.Create("DButton",O)ad:SetSize(Q*0.9,d*0.05)ad:SetPos(Q*0.05,d*0.925)ad:SetText("")ad.Paint=function(i,j,k)draw.RoundedBox(5,0,0,j,k,i:IsDown()&&Color(0,55,155,155)||Color(155,155,155,155))draw.SimpleText("Print Holdtype ( Console )","wOS.Anim.DescFont",j/2,k/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;ad.DoClick=function(i)chat.AddText(color_white,"[",Color(0,175,255),"wOS",color_white,"] The Holdtype code has been printed into console!")local X=Z:GetText():len()>0&&Z:GetText()||"Rename Me"local ae=_:GetText():len()>0&&_:GetText()||"wos-custom-xxx"local af=U:GetText():len()>0&&U:GetText()||"normal"print([[--=====================================================================]])print([[/*		My Custom Holdtype
			Created by ]]..LocalPlayer():Nick()..[[( ]]..LocalPlayer():SteamID()..[[ )*/]])print([[
local DATA = {}
DATA.Name = "]]..X..[["
DATA.HoldType = "]]..ae..[["
DATA.BaseHoldType = "]]..af..[["
DATA.Translations = {} 
]])for ag,ah in pairs(a3.Selections)do if table.Count(ah)>0 then print([[DATA.Translations[ ]]..T[ag]..[[ ] = {]])for ai,a8 in pairs(ah)do print([[	{ Sequence = "]]..ai..[[", Weight = ]]..a8 ..[[ },]])end;print([[}]])print("")end end;print([[wOS.AnimExtension:RegisterHoldtype( DATA )]])print([[--=====================================================================]])end end;concommand.Add('wos_animationlist',function()wOS:OpenAnimationMenu()end)
--addons/!lpakr_out/lua/wos/anim_extension/core/sh_metatable.lua:
wOS=wOS||{}wOS.AnimExtension.HoldTypeMeta=wOS.AnimExtension.HoldTypeMeta||{}local a={}a.GetName=function(self)return self.Name||nil end;a.GetID=function(self)return self.HoldType||"wos-custom"end;a.GetActivityList=function(self)local b=wOS.AnimExtension.ActIndex[self:GetBaseHoldType()]return{[ACT_MP_STAND_IDLE]=b,[ACT_MP_WALK]=b+1,[ACT_MP_RUN]=b+2,[ACT_MP_CROUCH_IDLE]=b+3,[ACT_MP_CROUCHWALK]=b+4,[ACT_MP_ATTACK_STAND_PRIMARYFIRE]=b+5,[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]=b+5,[ACT_MP_RELOAD_STAND]=b+6,[ACT_MP_RELOAD_CROUCH]=b+6,[ACT_MP_JUMP]=b+7,[ACT_RANGE_ATTACK1]=b+8,[ACT_MP_SWIM]=b+9}end;a.GetBaseHoldType=function(self)return self.BaseHoldType||"normal"end;a.SetBaseHoldType=function(self,c)self.BaseHoldType=c end;a.GetActData=function(self,d)local e=self.Translations[d]local f;if e then f={}if istable(e)then if e.Sequence then f.Sequence=e.Sequence;f.Weight=e.Weight||1 else local g=game.SinglePlayer()&&math.random(1,#e)||util.SharedRandom("wOS.AnimExtension."..self:GetName().."["..d.."]",1,#e)local h=math.Round(g)local i=e[h]if istable(i)then f=i elseif isstring(i)then f.Sequence=i;f.Weight=1 end end elseif isstring(e)then f.Sequence=e end end;return f end;a.__index=a;function wOS.AnimExtension.HoldTypeMeta:CreateMetaType(f)setmetatable(f,a)end
--addons/!lpakr_out/lua/autorun/wire_load.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/sh_modelplug.lua:
ModelPlug=ModelPlug||{}local a=list.Set;function ModelPlug.ListAddModels(b,c,d)d=d||{}for e,f in ipairs(c)do a(b,f,d)end end;function ModelPlug.ListAddGenerics(b,g)for e,f in pairs(g)do a(b,e,f)end end;ModelPlug.ListAddGenerics("Wire_Socket_Models",{["models/bull/various/usb_socket.mdl"]={ang=Angle(0,0,0),plug="models/bull/various/usb_stick.mdl",pos=Vector(8,0,0)},["models/hammy/pci_slot.mdl"]={ang=Angle(90,0,0),plug="models/hammy/pci_card.mdl",pos=Vector(0,0,0)},["models/props_lab/tpplugholder_single.mdl"]={ang=Angle(0,0,0),plug="models/props_lab/tpplug.mdl",pos=Vector(5,13,10)},["models/wingf0x/altisasocket.mdl"]={ang=Angle(90,0,0),plug="models/wingf0x/isaplug.mdl",pos=Vector(0,0,2.6)},["models/wingf0x/ethernetsocket.mdl"]={ang=Angle(90,0,0),plug="models/wingf0x/ethernetplug.mdl",pos=Vector(0,0,0)},["models/wingf0x/hdmisocket.mdl"]={ang=Angle(90,0,0),plug="models/wingf0x/hdmiplug.mdl",pos=Vector(0,0,0)},["models/wingf0x/isasocket.mdl"]={ang=Angle(90,0,0),plug="models/wingf0x/isaplug.mdl",pos=Vector(0,0,0)},["models/fasteroid/plugs/usb_c_socket.mdl"]={ang=Angle(90,0,0),plug="models/fasteroid/plugs/usb_c_plug.mdl",pos=Vector(0,0,0)},["models/fasteroid/plugs/sd_card_socket.mdl"]={ang=Angle(90,0,0),plug="models/fasteroid/plugs/sd_card.mdl",pos=Vector(0,0,0)},["models/fasteroid/plugs/microusb_socket.mdl"]={ang=Angle(90,0,0),plug="models/fasteroid/plugs/microusb_plug.mdl",pos=Vector(0,0,0)}})hook.Run("ModelPlugLuaRefresh")
--addons/!lpakr_out/lua/wire/wireshared.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/bitwise.lua:
GateActions("Bitwise")GateActions["bnot"]={name="Not",inputs={"A"},output=function(a,b)return bit.bnot(b)end,label=function(c,b)return"not "..b.." = "..c end}GateActions["bor"]={name="Or",inputs={"A","B"},output=function(a,b,d)return bit.bor(b,d)end,label=function(c,b,d)return b.." or "..d.." = "..c end}GateActions["band"]={name="And",inputs={"A","B"},output=function(a,b,d)return bit.band(b,d)end,label=function(c,b,d)return b.." and "..d.." = "..c end}GateActions["bxor"]={name="Xor",inputs={"A","B"},output=function(a,b,d)return bit.bxor(b,d)end,label=function(c,b,d)return b.." xor "..d.." = "..c end}GateActions["bshr"]={name="Bit shift right",inputs={"A","B"},output=function(a,b,d)return bit.rshift(b,d)end,label=function(c,b,d)return b.." >> "..d.." = "..c end}GateActions["bshl"]={name="Bit shift left",inputs={"A","B"},output=function(a,b,d)return bit.lshift(b,d)end,label=function(c,b,d)return b.." << "..d.." = "..c end}GateActions()
--addons/!lpakr_out/lua/wire/gates/entity.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/highspeed.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/selection.lua:
GateActions("Selection")GateActions["min"]={name="Minimum (Smallest)",description="Outputs the least of 8 values.",inputs={"A","B","C","D","E","F","G","H"},compact_inputs=2,output=function(a,...)return math.min(unpack({...}))end,label=function(b,...)local c="min("for d,e in ipairs({...})do if e then c=c..e..", "end end;return string.sub(c,1,-3)..") = "..b end}GateActions["max"]={name="Maximum (Largest)",description="Outputs the greatest of 8 values.",inputs={"A","B","C","D","E","F","G","H"},compact_inputs=2,output=function(a,...)return math.max(unpack({...}))end,label=function(b,...)local c="max("for d,e in ipairs({...})do if e then c=c..e..", "end end;return string.sub(c,1,-3)..") = "..b end}GateActions["minmax"]={name="Value Range",description="Clamps the value to between Min and Max.",inputs={"Min","Max","Value"},output=function(a,f,g,h)local i=f;if f>g then f=g;g=i end;if h<f then return f end;if h>g then return g end;return h end,label=function(b,f,g,h)local i=f;if f>g then f=g;g=i end;return"Min: "..f.."  Max: "..g.."  Value: "..h.." = "..b end}GateActions["if"]={name="If Then Else",inputs={"A","B","C"},output=function(a,j,k,l)if j&&j>0 then return k end;return l end,label=function(b,j,k,l)return"if "..j.." then "..k.." else "..l.." = "..b end}GateActions["select"]={name="Select (Choice)",inputs={"Choice","A","B","C","D","E","F","G","H"},output=function(a,m,...)local n=math.floor(m)if n>0&&n<=8 then return({...})[n]end;return 0 end,label=function(b,m)return"Select Choice:"..m.." Out:"..b end}GateActions["router"]={name="Router",description="Outputs the Data to the desired index (Path).",inputs={"Path","Data"},outputs={"A","B","C","D","E","F","G","H"},output=function(a,o,p)local q={0,0,0,0,0,0,0,0}local n=math.floor(o)if n>0&&n<=8 then q[n]=p end;return unpack(q)end,label=function(b,o,p)return"Router Path:"..o.." Data:"..p end}local r={None={0,0,0,0,0,0,0},[0]={1,1,1,1,1,1,0},[1]={0,1,1,0,0,0,0},[2]={1,1,0,1,1,0,1},[3]={1,1,1,1,0,0,1},[4]={0,1,1,0,0,1,1},[5]={1,0,1,1,0,1,1},[6]={1,0,1,1,1,1,1},[7]={1,1,1,0,0,0,0},[8]={1,1,1,1,1,1,1},[9]={1,1,1,1,0,1,1}}GateActions["7seg"]={name="7 Segment Decoder",description="Converts a number to a 7-segment representation.",inputs={"A","Clear"},outputs={"A","B","C","D","E","F","G"},output=function(a,j,s)if s>0 then return unpack(r.None)end;local n=math.fmod(math.abs(math.floor(j)),10)if n>#r then return unpack(r.None)end;return unpack(r[n])end,label=function(b,j)return"7-Seg In:"..j.." Out:"..b.A..b.B..b.C..b.D..b.E..b.F..b.G end}GateActions["timedec"]={name="Time/Date decoder",description="Converts a Time in seconds and a Date in years a human-readable format.",inputs={"Time","Date"},outputs={"Hours","Minutes","Seconds","Year","Day"},output=function(a,t,u)return math.floor(t/3600),math.floor(t/60)%60,math.floor(t)%60,math.floor(u/366),math.floor(u)%366 end,label=function(b,j)return"Date decoder"end}GateActions()
--addons/!lpakr_out/lua/wire/gates/string.lua:
local a=64*1024;GateActions("String")GateActions["string_ceq"]={name="Equal",inputs={"A","B"},inputtypes={"STRING","STRING"},output=function(b,c,d)if c==d then return 1 else return 0 end end,label=function(e,c,d)return string.format("(%s == %s) = %d",c,d,e)end}GateActions["string_cineq"]={name="Inequal",inputs={"A","B"},inputtypes={"STRING","STRING"},output=function(b,c,d)if c!=d then return 1 else return 0 end end,label=function(e,c,d)return string.format("(%s != %s) = %d",c,d,e)end}GateActions["string_index"]={name="Index",description="Gets the character at the index.",inputs={"A","Index"},inputtypes={"STRING","NORMAL"},outputtypes={"STRING"},output=function(b,c,d)if!c then c=""end;if!d then d=0 end;return string.sub(c,d,d)end,label=function(e,c,d)return string.format("index(%s , %s) = %q",c,d,e)end}GateActions["string_length"]={name="Length",inputs={"A"},inputtypes={"STRING"},output=function(b,c)if!c then c=""end;return#c end,label=function(e,c)return string.format("length(%s) = %d",c,e)end}GateActions["string_upper"]={name="Uppercase",inputs={"A"},inputtypes={"STRING"},outputtypes={"STRING"},output=function(b,c)if!c then c=""end;return string.upper(c)end,label=function(e,c)return string.format("upper(%s) = %q",c,e)end}GateActions["string_lower"]={name="Lowercase",inputs={"A"},inputtypes={"STRING"},outputtypes={"STRING"},output=function(b,c)if!c then c=""end;return string.lower(c)end,label=function(e,c)return string.format("lower(%s) = %q",c,e)end}GateActions["string_sub"]={name="Substring",description="Gets a part of the string between the start and end indices (inclusive).",inputs={"A","Start","End"},inputtypes={"STRING","NORMAL","NORMAL"},outputtypes={"STRING"},output=function(b,c,d,f)if!c then c=""end;if!d then d=1 end;if!f then f=-1 end;return string.sub(c,d,f)end,label=function(e,c,d,f)return string.format("%s:sub(%s , %s) = %q",c,d,f,e)end}GateActions["string_explode"]={name="Explode",description="Splits a string into an array by the separator pattern.",inputs={"A","Separator"},inputtypes={"STRING","STRING"},outputtypes={"ARRAY"},output=function(b,c,d)if!c then c=""end;if!d then d=""end;return string.Explode(d,c)end,label=function(e,c,d)return string.format("explode(%s , %s)",c,d)end}GateActions["string_find"]={name="Find",description="Finds a substring within the string and outputs the position it begins.",inputs={"A","B","StartIndex"},inputtypes={"STRING","STRING"},outputtypes={"NORMAL"},outputs={"Out"},output=function(b,c,d,g)local h,i=string.find(c,d,g,true)return h||0 end,label=function(e,c,d)if istable(e)then e=e.Out end;return string.format("find(%s , %s) = %d",c,d,e)end}GateActions["string_concat"]={name="Concatenate",description="Combines multiple strings together into one string.",inputs={"A","B","C","D","E","F","G","H"},inputtypes={"STRING","STRING","STRING","STRING","STRING","STRING","STRING","STRING"},outputtypes={"STRING"},output=function(b,c,d,f,j,k,l,m,n)if(c&&#c||0)+(d&&#d||0)+(f&&#f||0)+(j&&#j||0)+(k&&#k||0)+(l&&#l||0)+(m&&#m||0)+(n&&#n||0)>a then return false end;local o={c,d,f,j,k,l,m,n}return table.concat(o)end,label=function(e)return string.format("concat = %q",e)end}GateActions["string_trim"]={name="Trim",description="Removes trailing and leading whitespace from the string.",inputs={"A"},inputtypes={"STRING"},outputtypes={"STRING"},output=function(b,c)if!c then c=""end;return string.Trim(c)end,label=function(e,c)return string.format("trim(%s) = %q",c,e)end}GateActions["string_replace"]={name="Replace",description="Replaces each occurance of the ToBeReplaced pattern with the Replacer pattern.",inputs={"String","ToBeReplaced","Replacer"},inputtypes={"STRING","STRING","STRING"},outputtypes={"STRING"},output=function(b,c,d,f)if!c then c=""end;if!d then d=""end;if!f then f=""end;if#c+#d+#f>a then return false end;if!pcall(WireLib.CheckRegex,c,d)then return false end;return string.gsub(c,d,f)end,label=function(e,c,d,f)return string.format("%s:replace(%s , %s) = %q",c,d,f,e)end}GateActions["string_reverse"]={name="Reverse",inputs={"A"},inputtypes={"STRING"},outputtypes={"STRING"},output=function(b,c)if!c then c=""end;return string.reverse(c)end,label=function(e,c)return string.format("reverse(%s) = %q",c,e)end}GateActions["string_tonum"]={name="To Number",description="Tries to convert the string to a number.",inputs={"A"},inputtypes={"STRING"},outputtypes={"NORMAL"},output=function(b,c)if!c then c=""end;return tonumber(c)end,label=function(e,c)return string.format("tonumber(%s) = %d",c,e)end}GateActions["string_tostr"]={name="Number to String",description="Converts the number to a string.",inputs={"A"},inputtypes={"NORMAL"},outputtypes={"STRING"},output=function(b,c)if!c then c=0 end;return tostring(c)end,label=function(e,c)return string.format("tostring(%s) = %q",c,e)end}GateActions["string_tobyte"]={name="To Byte",description="Converts a character to a number representation.",inputs={"A"},inputtypes={"STRING"},outputtypes={"NORMAL"},output=function(b,c)if!c then c=""end;return string.byte(c)end,label=function(e,c)return string.format("tobyte(%s) = %d",c,e)end}GateActions["string_tochar"]={name="To Character",description="Tries to convert a number to a character.",inputs={"A"},inputtypes={"NORMAL"},outputtypes={"STRING"},output=function(b,c)if!c||c<0||c>255 then c=0 end;return string.char(c)end,label=function(e,c)return string.format("tochar(%s) = %q",c,e)end}GateActions["string_repeat"]={name="Repeat",description="Repeats a string by Num times.",inputs={"A","Num"},inputtypes={"STRING","NORMAL"},outputtypes={"STRING"},output=function(b,c,d)if!c then c=""end;if!d||d<0 then d=0 end;if d*#c>a then return false end;return string.rep(c,d)end,label=function(e,c)return string.format("repeat(%s) = %q",c,e)end}GateActions["string_ident"]={name="Identity",inputs={"A"},inputtypes={"STRING"},outputtypes={"STRING"},output=function(b,c)return c end,label=function(e,c)return string.format("%s = %s",c,e)end}GateActions["string_select"]={name="Select",inputs={"Choice","A","B","C","D","E","F","G","H"},inputtypes={"NORMAL","STRING","STRING","STRING","STRING","STRING","STRING","STRING","STRING"},outputtypes={"STRING"},output=function(b,p,...)return({...})[math.Clamp(p,1,8)]end,label=function(e,p)return string.format("select(%s) = %s",p,e)end}GateActions["string_to_memory"]={name="String => Memory",inputs={"A"},inputtypes={"STRING"},outputs={"Memory"},reset=function(b)b.stringQueued=false;b.stringChanged=false;b.currentString=""end,output=function(b,c)if c!=b.currentString then if!b.stringChanged then b.stringChanged=true;b.currentString=c;b.stringQueued=false else b.stringQueued=true end end;return b.Outputs["Memory"].Value end,ReadCell=function(self,b,q)if q==0 then if b.stringChanged then return 1 else return 0 end elseif q==1 then return#b.currentString else local r=q-1;if r>#b.currentString then return 0 else return string.byte(b.currentString,r)end end end,WriteCell=function(self,b,q,s)if q==0&&s==0 then b.stringChanged=false;if b.stringQueued then b.stringQueued=false;b.currentString=b.Inputs["A"].Value;b.stringChanged=true end;return true else return false end end}GateActions["string_from_memory"]={name="Memory => String",inputs={},outputs={"Out","Memory"},outputtypes={"STRING","NORMAL"},reset=function(b)b.memory={}b.stringLength=0;b.currentString=""b.ready=true end,output=function(b)return b.currentString,b.Outputs["Memory"].Value end,ReadCell=function(self,b,t)if t==0 then return 0 elseif t==1 then return b.stringLength else return b.memory[t-1]||0 end end,WriteCell=function(self,b,t,s)if s>=0 then if t==0&&s==1 then local u=b.stringLength;for v=1,b.stringLength,1 do if!b.memory[v]then u=v-1;break end end;b.currentString=string.char(unpack(b.memory,1,u))b:CalcOutput()return true elseif t==1 then b.stringLength=math.floor(s)return true elseif t>1 then b.memory[t-1]=math.floor(s)return true end end;return false end}GateActions()
--addons/!lpakr_out/lua/wire/wiremonitors.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/cl_wirelib.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/wire_soundpropertylist.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/sound_browser.lua:
local a=200;local b=110;local c=Color(140,140,140,255)local d=nil;local e=nil;local f=nil;local g=nil;local h=nil;local i=nil;local j=nil;local k=nil;local l={[CHAN_REPLACE]="CHAN_REPLACE",[CHAN_AUTO]="CHAN_AUTO",[CHAN_WEAPON]="CHAN_WEAPON",[CHAN_VOICE]="CHAN_VOICE",[CHAN_ITEM]="CHAN_ITEM",[CHAN_BODY]="CHAN_BODY",[CHAN_STREAM]="CHAN_STREAM",[CHAN_STATIC]="CHAN_STATIC",[CHAN_VOICE2]="CHAN_VOICE2",[CHAN_VOICE_BASE]="CHAN_VOICE_BASE",[CHAN_USER_BASE]="CHAN_USER_BASE"}local function m(n)if!isstring(n)||n==""then return end;local o=tonumber(file.Size("sound/"..n,"GAME")||"-1")local p=string.lower(string.GetExtensionFromFilename(n)||"n/a")return o,p end;local function q(r)if!isstring(r)||r==""then return end;if!string.match(r,"/")then return end;if r:sub(1,5)=="sound"then r=string.gsub(r,"^sound/%W*","sound/")end;if file.Exists(r,"MOD")then return"garrysmod","game","Garry's Mod"end;for s,t in ipairs(engine.GetGames())do if t.mounted then local game,u=t.folder,t.title;if file.Exists(r,game)then return game,"game",u end end end;local s,v=file.Find("garrysmod/addons/*","BASE_PATH")for s,w in ipairs(v)do if file.Exists("garrysmod/addons/"..w.."/"..r,"BASE_PATH")then return w,"legacy"end end;for s,t in ipairs(engine.GetAddons())do if t.mounted then local x=t.title;if file.Exists(r,x)then return x,"workshop"end end end;if file.Exists(r,"DOWNLOAD")then return"Server Download","download"end;if file.Exists(r,"BSP")then return"Current Map ("..game.GetMap()..")","bspfile"end end;local function y(o)if!o then return end;if o<0 then return end;return o,string.NiceSize(o)end;local function z(A)if!A then return end;if A<0 then return end;local B=math.floor(A/60)local C=math.floor(A%60)local D=A%1*1000;return A,string.format("%01d",B)..":"..string.format("%02d",C).."."..string.format("%03d",D)end;local function E(n)local o,p,A=m(n)local F,G,H=q("sound/"..n)if!o then return end;A=SoundDuration(n)if A then A=math.Round(A*1000)/1000 end;local A,I=z(A,o)local J,K=y(o)local L={}local M=sound.GetProperties(n)if M then L=M else L.Path={n,F||"n/a",G,H}L.Duration={I||"n/a",A&&A.." sec"}L.Size={K||"n/a",J&&J.." Bytes"}L.Format=p end;return L,!M end;local N;local function O(n,P,Q)if N==n&&n then return end;N=n;local R,S=E(n)if!IsValid(P)then if IsValid(i)then i:Remove()end end;if!R then return end;local T=""if Q then T=" ("..Q..")"end;if S then local U=""local V=nil;local W=nil;local subnode=nil;if IsValid(P)then W=P:AddNode("Sound File"..T,"icon16/sound.png")else W=h:AddNode("Sound File","icon16/sound.png")i=W end;do U="Path"V=W:AddNode(U,"icon16/link.png")subnode=V:AddNode(R[U][1],"icon16/page.png")subnode.IsDataNode=true;subnode.IsSoundNode=true;subnode=V:AddNode(R[U][3]=="game"&&R[U][4]||R[U][2],R[U][3]=="game"&&"games/16/"..R[U][2]..".png"||R[U][3]=="legacy"&&"icon16/folder_brick.png"||R[U][3]=="workshop"&&"games/16/all.png"||R[U][3]=="download"&&"icon16/transmit.png"||R[U][3]=="bspfile"&&"icon16/world.png"||"icon16/folder_link.png")end;do U="Duration"V=W:AddNode(U,"icon16/time.png")for X,t in pairs(R[U])do subnode=V:AddNode(t,"icon16/page.png")subnode.IsDataNode=true end end;do U="Size"V=W:AddNode(U,"icon16/disk.png")for X,t in pairs(R[U])do subnode=V:AddNode(t,"icon16/page.png")subnode.IsDataNode=true end end;do U="Format"V=W:AddNode(U,"icon16/page_white_key.png")subnode=V:AddNode(R[U],"icon16/page.png")subnode.IsDataNode=true end else local V=nil;local W=nil;if IsValid(P)then W=P:AddNode("Sound Property"..T,"icon16/table_gear.png")else W=h:AddNode("Sound Property","icon16/table_gear.png")i=W end;do V=W:AddNode("Name","icon16/sound.png")subnode=V:AddNode(R["name"],"icon16/page.png")subnode.IsSoundNode=true;subnode.IsDataNode=true end;do local Y=R["channel"]||0;if istable(Y)then V=W:AddNode("Channel","icon16/page_white_gear.png")for X,t in pairs(Y)do subnode=V:AddNode(t,"icon16/page.png")subnode.IsDataNode=true;subnode=V:AddNode(l[t]||l[CHAN_USER_BASE],"icon16/page.png")subnode.IsDataNode=true end else V=W:AddNode("Channel","icon16/page_white_gear.png")subnode=V:AddNode(Y,"icon16/page.png")subnode.IsDataNode=true;subnode=V:AddNode(l[Y]||l[CHAN_USER_BASE],"icon16/page.png")subnode.IsDataNode=true end end;do local Z=R["level"]||0;if istable(Z)then V=W:AddNode("Level","icon16/page_white_gear.png")for X,t in pairs(Z)do subnode=V:AddNode(t,"icon16/page.png")subnode.IsDataNode=true;subnode=V:AddNode(t,"icon16/page.png")subnode.IsDataNode=true end else V=W:AddNode("Level","icon16/page_white_gear.png")subnode=V:AddNode(Z,"icon16/page.png")subnode.IsDataNode=true end end;do local _=R["volume"]||0;if istable(_)then V=W:AddNode("Volume","icon16/page_white_gear.png")for X,t in pairs(_)do subnode=V:AddNode(t,"icon16/page.png")subnode.IsDataNode=true end else V=W:AddNode("Volume","icon16/page_white_gear.png")subnode=V:AddNode(_,"icon16/page.png")subnode.IsDataNode=true end end;do local _=R["pitch"]||0;if istable(_)then V=W:AddNode("Pitch","icon16/page_white_gear.png")for X,t in pairs(_)do subnode=V:AddNode(t,"icon16/page.png")subnode.IsDataNode=true end else V=W:AddNode("Pitch","icon16/page_white_gear.png")subnode=V:AddNode(_,"icon16/page.png")subnode.IsDataNode=true end end;do local a0=R["sound"]||""if istable(a0)then V=W:AddNode("Sounds","icon16/table_multiple.png")else V=W:AddNode("Sound","icon16/table.png")end;V.SubData=a0;V.BackNode=W;V.Expander.DoClick=function(self)if!IsValid(h)then return end;if!IsValid(V)then return end;V:SetExpanded(false)h:SetSelectedItem(V)end;V:AddNode("Dummy")end end;if IsValid(P)then return end;if IsValid(i)then i:SetExpanded(true)end end;local function a1(a2)if!j then return end;j:ChangeVolume(tonumber(a2)||1,0.1)end;local function a3(a4)if!j then return end;j:ChangePitch(tonumber(a4)||100,0.1)end;local function a5(file,a2,a4)if j then j:Stop()j=nil end;if!file||file==""then return end;local a6=LocalPlayer()if!IsValid(a6)then return end;j=CreateSound(a6,file)if j then j:PlayEx(tonumber(a2)||1,tonumber(a4)||100)end end;local function a7(file)if k then k:Stop()k=nil end;if!file||file==""then return end;local a6=LocalPlayer()if!IsValid(a6)then return end;k=CreateSound(a6,file)if k then k:PlayEx(1,100)end end;local function a8(a9)RunConsoleCommand("wire_soundemitter_sound",a9)spawnmenu.ActivateTool("wire_soundemitter")end;local function aa(a9)SetClipboardText(a9)end;local function ab(a9,SoundEmitter,ac,ad)if!isstring(a9)then return end;if a9==""then return end;local ae=DermaMenu()local MenuItem=nil;if SoundEmitter then MenuItem=ae:AddOption("Setup soundemitter",function()a8(a9)end)MenuItem:SetImage("icon16/sound.png")MenuItem=ae:AddOption("Setup soundemitter and close",function()a8(a9)d:Close()end)MenuItem:SetImage("icon16/sound.png")MenuItem=ae:AddOption("Copy to clipboard",function()aa(a9)end)MenuItem:SetImage("icon16/page_paste.png")MenuItem=ae:AddOption("Copy to clipboard and close",function()aa(a9)d:Close()end)MenuItem:SetImage("icon16/page_paste.png")else MenuItem=ae:AddOption("Copy to clipboard",function()aa(a9)end)MenuItem:SetImage("icon16/page_paste.png")MenuItem=ae:AddOption("Copy to clipboard and close",function()aa(a9)d:Close()end)MenuItem:SetImage("icon16/page_paste.png")MenuItem=ae:AddOption("Setup soundemitter",function()a8(a9)end)MenuItem:SetImage("icon16/sound.png")MenuItem=ae:AddOption("Setup soundemitter and close",function()a8(a9)d:Close()end)MenuItem:SetImage("icon16/sound.png")end;ae:AddSpacer()if IsValid(g)then if g:ItemInList(a9)then MenuItem=ae:AddOption("Remove from favourites",function()g:RemoveItem(a9)end)MenuItem:SetImage("icon16/bin_closed.png")else MenuItem=ae:AddOption("Add to favourites",function()g:AddItem(a9,sound.GetProperties(a9)&&"property"||"file")end)MenuItem:SetImage("icon16/star.png")local af=g:GetMaxItems()local Q=g.TabfileCount;if Q>=af then MenuItem:SetTextColor(c)MenuItem.DoClick=function()end;MenuItem:SetToolTip("The favourites list is Full! It can't hold more than "..af.." items!")end end end;ae:AddSpacer()MenuItem=ae:AddOption("Print to console",function()local a6=LocalPlayer()if!IsValid(a6)then return end;a6:PrintMessage(HUD_PRINTTALK,a9)end)MenuItem:SetImage("icon16/monitor_go.png")MenuItem=ae:AddOption("Print to Chat",function()RunConsoleCommand("say",a9)end)MenuItem:SetImage("icon16/group_go.png")local ag=#a9;if ag>b then MenuItem:SetTextColor(c)MenuItem.DoClick=function()end;MenuItem:SetToolTip("The filepath ("..ag.." chars) is too long to print in chat. It should be shorter than "..b.." chars!")end;ae:AddSpacer()MenuItem=ae:AddOption("Play",function()a5(a9,ac,ad,strtype)a7()end)MenuItem:SetImage("icon16/control_play.png")MenuItem=ae:AddOption("Play without effects",function()a5()a7(a9,strtype)end)MenuItem:SetImage("icon16/control_play_blue.png")ae:Open()end;local function ah(ai,V,SoundEmitter,ac,ad)if!IsValid(V)then return end;if!V.IsDataNode then return end;local aj=V:GetText()local ak=V.IsSoundNode;if ak then ab(aj,SoundEmitter,ac,ad)return end;local ae=DermaMenu()MenuItem=ae:AddOption("Copy to clipboard",function()aa(aj)end)MenuItem:SetImage("icon16/page_paste.png")MenuItem=ae:AddOption("Print to console",function()local a6=LocalPlayer()if!IsValid(a6)then return end;a6:PrintMessage(HUD_PRINTTALK,aj)end)MenuItem:SetImage("icon16/monitor_go.png")MenuItem=ae:AddOption("Print to Chat",function()RunConsoleCommand("say",aj)end)MenuItem:SetImage("icon16/group_go.png")local ag=#aj;if ag>b then MenuItem:SetTextColor(c)MenuItem.DoClick=function()end;MenuItem:SetToolTip("The filepath ("..ag.." chars) is too long to print in chat. It should be shorter than "..b.." chars!")end;ae:Open()end;local function al(am,file)if!IsValid(am)then return end;if am.Soundemitter then return end;am:SetCookie("wire_soundfile",file)end;local function an(ao,ap)local aq=false;if isstring(ao)&&ao!=""then aq=true;if tonumber(ap)!=1 then aq=false end end;if tonumber(ap)==1 then aq=true end;local a9=""local ac=1;local ad=100;if IsValid(d)then d:Remove()end;if IsValid(e)then e:Remove()end;if IsValid(f)then f:Remove()end;if IsValid(g)then g:Remove()end;if IsValid(h)then h:Remove()end;if IsValid(i)then i:Remove()end;d=vgui.Create("DFrame")d:SetPos(50,25)d:SetSize(750,500)d:SetMinWidth(700)d:SetMinHeight(400)d:SetSizable(true)d:SetDeleteOnClose(false)d:SetTitle("Sound Browser")d:SetVisible(false)d:SetCookieName("wire_sound_browser")e=vgui.Create("wire_filebrowser")f=vgui.Create("wire_soundpropertylist")g=vgui.Create("wire_listeditor")e:SetListSpeed(6)e:SetMaxItemsPerPage(200)f:SetListSpeed(100)f:SetMaxItems(400)g:SetListSpeed(40)g:SetMaxItems(512)local ar=vgui.Create("DPropertySheet")ar:DockMargin(5,5,5,5)ar:AddSheet("File Browser",e,"icon16/folder.png",false,false,"Browse your sound folder.")ar:AddSheet("Sound Property Browser",f,"icon16/table_gear.png",false,false,"Browse the sound properties.")ar:AddSheet("Favourites",g,"icon16/star.png",false,false,"View your favourites.")h=vgui.Create("DTree")h:SetClickOnDragHover(false)local as=CurTime()h.DoClick=function(ai,V)if!IsValid(ai)then return end;if!IsValid(V)then return end;ai:SetSelectedItem(V)local at=CurTime()if at-as>0.3 then as=at;return end;as=at;if!V.IsSoundNode then return end;local file=V:GetText()a5(file,ac,ad)a7()end;h.DoRightClick=function(ai,V)if!IsValid(ai)then return end;if!IsValid(V)then return end;ai:SetSelectedItem(V)ah(ai,V,SoundEmitter,ac,ad)end;h.OnNodeSelected=function(ai,V)if!IsValid(ai)then return end;if!IsValid(V)then return end;local P=V.BackNode;if!IsValid(V.BackNode)then V:SetExpanded(!V.m_bExpanded)return end;local a0=V.SubData;if!a0 then V:SetExpanded(!V.m_bExpanded)return end;V:SetExpanded(false)V:Remove()if istable(a0)then V=P:AddNode("Sounds","icon16/table_multiple.png")for X,t in pairs(a0)do O(t,V,X)end else V=P:AddNode("Sound","icon16/table.png")O(a0,V)end;V:SetExpanded(false)ai:SetSelectedItem(V)V:SetExpanded(!V.m_bExpanded)end;local au=d:Add("DHorizontalDivider")au:Dock(FILL)au:SetLeft(ar)au:SetRight(h)au:SetLeftWidth(570)au:SetLeftMin(500)au:SetRightMin(150)au:SetDividerWidth(3)e:SetRootName("sound")e:SetRootPath("sound")e:SetWildCard("GAME")e:SetFileTyps({"*.mp3","*.wav","*.ogg"})local av=e:AddColumns("Format","Size")av[1]:SetFixedWidth(70)av[1]:SetWide(70)av[2]:SetFixedWidth(70)av[2]:SetWide(70)e.LineData=function(self,aw,n,...)if#n>a then return nil,true end;local o,p,A=m(n)if!o then return end;local J,K=y(o,A)local A,I=z(A,o)return{p,K||"n/a"}end;e.OnLineAdded=function(self,aw,ax,n,...)end;e.DoClick=function(ai,file)al(d,file)a9=file;O(file)end;e.DoDoubleClick=function(ai,file)a5(file,ac,ad)a7()al(d,file)a9=file end;e.DoRightClick=function(ai,file)ab(file,d.Soundemitter,ac,ad)al(d,file)a9=file;O(file)end;f.DoClick=function(ai,ay)al(d,ay)a9=ay;O(ay)end;f.DoDoubleClick=function(ai,ay)a5(ay,ac,ad)a7()al(d,ay)a9=ay end;f.DoRightClick=function(ai,ay)ab(ay,d.Soundemitter,ac,ad)al(d,ay)a9=ay;O(ay)end;file.CreateDir("soundlists")g:SetRootPath("soundlists")g.DoClick=function(ai,az,aA)if file.Exists("sound/"..az,"GAME")then e:SetOpenFile(az)end;a9=az;O(az)end;g.DoDoubleClick=function(ai,az,aA)if file.Exists("sound/"..az,"GAME")then e:SetOpenFile(az)end;a5(az,ac,ad)a7()a9=az end;g.DoRightClick=function(ai,az,aA)if file.Exists("sound/"..az,"GAME")then e:SetOpenFile(az)end;ab(az,d.Soundemitter,ac,ad)a9=az;O(az)end;local aB=d:Add("DPanel")aB:DockMargin(0,5,0,0)aB:Dock(BOTTOM)aB:SetTall(60)aB:SetDrawBackground(false)local aC=aB:Add("DPanel")aC:DockMargin(4,0,0,0)aC:Dock(RIGHT)aC:SetWide(250)aC:SetDrawBackground(false)local aD=aB:Add("DPanel")aD:DockMargin(0,4,0,0)aD:Dock(LEFT)aD:SetWide(350)aD:SetDrawBackground(false)local aE=aD:Add("DNumSlider")aE:DockMargin(2,0,0,0)aE:Dock(TOP)aE:SetText("Volume")aE:SetDecimals(0)aE:SetMinMax(0,100)aE:SetValue(100)aE.Label:SetWide(40)aE.OnValueChanged=function(self,aF)ac=aF/100;a1(ac)end;local aG=aD:Add("DNumSlider")aG:DockMargin(2,0,0,0)aG:Dock(BOTTOM)aG:SetText("Pitch")aG:SetDecimals(0)aG:SetMinMax(0,255)aG:SetValue(100)aG.Label:SetWide(40)aG.OnValueChanged=function(self,aF)ad=aF;a3(ad)end;local aH=aC:Add("DPanel")aH:DockMargin(0,0,0,2)aH:Dock(TOP)aH:SetDrawBackground(false)local aI=aH:Add("DButton")aI:SetText("Play")aI:Dock(LEFT)aI:SetWide(aH:GetWide()/2-2)aI.DoClick=function()a5(a9,ac,ad)a7()end;local aJ=aH:Add("DButton")aJ:SetText("Stop")aJ:Dock(RIGHT)aJ:SetWide(aI:GetWide())aJ.DoClick=function()a5()a7()end;local aK=aC:Add("DButton")aK:SetText("Send to soundemitter")aK:DockMargin(0,2,0,0)aK:Dock(FILL)aK:SetVisible(false)aK.DoClick=function(aL)a8(a9)end;local aM=aC:Add("DButton")aM:SetText("Copy to clipboard")aM:DockMargin(0,2,0,0)aM:Dock(FILL)aM:SetVisible(false)aM.DoClick=function(aL)aa(a9)end;local aN,aO=d:GetSize()d.PerformLayout=function(self,...)aK:SetVisible(self.Soundemitter)aM:SetVisible(!self.Soundemitter)local aP=self:GetWide()local aQ=au:GetLeftWidth()+aP-aN;if aQ<au:GetLeftMin()then aQ=au:GetLeftMin()end;au:SetLeftWidth(aQ)local aR=aP-au:GetRightMin()+au:GetDividerWidth()if au:GetLeftWidth()>aR then au:SetLeftWidth(aR)end;aH:SetTall(aB:GetTall()/2-2)aI:SetWide(aH:GetWide()/2-2)aJ:SetWide(aI:GetWide())if self.Soundemitter then aK:SetTall(aH:GetTall()-2)else aM:SetTall(aH:GetTall()-2)end;aN,aO=self:GetSize()DFrame.PerformLayout(self,...)end;d.OnClose=function()ac=1;ad=100;aE:SetValue(ac*100)aG:SetValue(ad)vgui.GetWorldPanel():SetWorldClicker(false)a5()a7()end;d:InvalidateLayout(true)end;local function aS(aT,aU,aV)local ao=aV[1]local ap=aV[2]if!IsValid(d)then an(ao,ap)end;d:SetVisible(true)d:MakePopup()d:InvalidateLayout(true)vgui.GetWorldPanel():SetWorldClicker(true)if!IsValid(e)then return end;WireLib.Timedcall(function(d,e,ao,ap)if!IsValid(d)then return end;if!IsValid(e)then return end;local aq=false;if isstring(ao)&&ao!=""then aq=true end;local aq=false;if isstring(ao)&&ao!=""then aq=true;if tonumber(ap)!=1 then aq=false end end;if tonumber(ap)==1 then aq=true end;d.Soundemitter=aq;d:InvalidateLayout(true)if!aq then ao=d:GetCookie("wire_soundfile","")end;e:SetOpenFile(ao)end,d,e,ao,ap)end;concommand.Add("wire_sound_browser_open",aS)
--addons/!lpakr_out/lua/wire/client/thrusterlib.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/rendertarget_fix.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/loader/loader.lua:
wOS=wOS||{}wOS.Lightsaber=wOS.Lightsaber||{}include("wos/advswl/config/sh_serverwos.lua")include("wos/advswl/config/sh_hiltwos.lua")include("wos/advswl/robot-boy/sh_rb655_lightsaber_presets.lua")include("wos/advswl/core/sh_core.lua")include("wos/advswl/anim/sh_forcesequence.lua")if SERVER then else include("wos/advswl/robot-boy/cl_rb655_lightsaber.lua")include("wos/advswl/core/cl_core.lua")include("wos/advswl/core/cl_net.lua")include("wos/advswl/anim/cl_forcesequence.lua")include("wos/advswl/combat/cl_dualsaber.lua")include("wos/advswl/combat/cl_saberbase_hook.lua")include("wos/advswl/forcepowers/wos_forcematerialbuilding.lua")include("wos/advswl/forcepowers/sh_forcepowers.lua")include("wos/advswl/devestators/wos_devmaterialbuilding.lua")include("wos/advswl/devestators/sh_devestators.lua")include("wos/advswl/forms/cl_forms.lua")end
--addons/!lpakr_out/lua/wos/advswl/config/sh_serverwos.lua:
wOS=wOS||{}wOS.ForceSelectMenu=false;wOS.DisableForceIcons=false;wOS.AdvertTime=false;wOS.AlwaysFirstPerson=true;wOS.EnableZhromExtension=false
--addons/!lpakr_out/lua/wos/advswl/forcepowers/wos_forcematerialbuilding.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/forcepowers/wos_forcematerialbuilding.lua:
wOS=wOS||{}wOS.ForceIcons={}wOS.ForceIcons["Leap"]=Material("wos_edit/forceicons/leap.png","unlitgeneric")wOS.ForceIcons["Absorb"]=Material("wos_edit/forceicons/absorb.png","unlitgeneric")wOS.ForceIcons["Heal"]=Material("wos_edit/forceicons/heal.png","unlitgeneric")wOS.ForceIcons["G-Heal"]=Material("wos_edit/forceicons/group_heal.png","unlitgeneric")wOS.ForceIcons["Adv Cloak"]=Material("wos_edit/forceicons/advanced_cloak.png","unlitgeneric")wOS.ForceIcons["Charge"]=Material("wos_edit/forceicons/charge.png","unlitgeneric")wOS.ForceIcons["Speed"]=Material("wos_edit/forceicons/charge.png","unlitgeneric")wOS.ForceIcons["Cloak"]=Material("wos_edit/forceicons/cloak.png","unlitgeneric")wOS.ForceIcons["Shock"]=Material("wos_edit/forceicons/lightning.png","unlitgeneric")wOS.ForceIcons["Lightning"]=Material("wos_edit/forceicons/lightning_strike.png","unlitgeneric")wOS.ForceIcons["Reflect"]=Material("wos_edit/forceicons/reflect.png","unlitgeneric")wOS.ForceIcons["Strike"]=Material("wos_edit/forceicons/shadow_strike.png","unlitgeneric")wOS.ForceIcons["Throw"]=Material("wos_edit/forceicons/throw.png","unlitgeneric")wOS.ForceIcons["Repulse"]=Material("wos_edit/forceicons/repulse.png","unlitgeneric")wOS.ForceIcons["Combust"]=Material("wos_edit/forceicons/combust.png","unlitgeneric")wOS.ForceIcons["Rage"]=Material("wos_edit/forceicons/rage.png","unlitgeneric")wOS.ForceIcons["Storm"]=Material("wos_edit/forceicons/storm.png","unlitgeneric")wOS.ForceIcons["Med"]=Material("wos_edit/forceicons/meditate.png","unlitgeneric")wOS.ForceIcons["Push"]=Material("wos_edit/forceicons/push.png","unlitgeneric")wOS.ForceIcons["Pull"]=Material("wos_edit/forceicons/pull.png","unlitgeneric")wOS.ForceIcons["Hatred"]=Material("wos_edit/forceicons/channel_hatred.png","unlitgeneric")wOS.ForceIcons["Resurrect"]=Material("wos_edit/forceicons/heal.png","unlitgeneric")
--addons/!lpakr_out/lua/autorun/client/advdupe2_cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/color_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/filters_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/icongenerator_cl.lua:
srp.icon=srp.icon||{}local a=info.DataFolder..'/icons/'file.CreateDir(a)local b={}local c='32355245r'local d='models/error.mdl'local e=Material'models/debug/debugwhite'local function f(g)local h=ClientsideModel(g)h:SetNoDraw(true)h.DoNotRemove=true;return h end;function srp.icon.RenderIconTexture(i,g,j)j=j||{}j.Imgw=j.Imgw||1024;j.Imgh=j.Imgh||522;j.ignorecache=info.Dev&&true||j.ignorecache;i=i..'_'..j.Imgw..'x'..j.Imgh;local k=a..i..'.png'if!j.ignorecache&&(b[i]||file.Exists('data/'..k,'GAME'))then b[i]={mat=Material('data/'..k,'smooth noclamp nomips'),rendering=false}return b[i]end;b[i]={rendering=true}local h=f(g)if!IsValid(h)then return end;h:SetPos(j.IconRenderPos||Vector())h:SetAngles(j.IconRenderAngle||Angle(30,90,0))h:SetModelScale(j.IconRenderScale||1,0)if j.color then h:SetColor(j.color)end;local l=GetRenderTargetEx(i..c,j.Imgw,j.Imgh,RT_SIZE_NO_CHANGE,8,MATERIAL_RT_DEPTH_SHARED,CREATERENDERTARGETFLAGS_AUTOMIPMAP,IMAGE_FORMAT_RGBA8888)local m=CreateMaterial(i..c,'UnlitGeneric',{['$basetexture']=l:GetName(),['$ignorez']=1,['$vertexcolor']=1,['$vertexalpha']=1,['$nolod']=1,['$translucent']=1})surface.SetAlphaMultiplier(1)surface.SetDrawColor(255,255,255,255)render.PushRenderTarget(l)render.SetStencilWriteMask(0xFF)render.SetStencilTestMask(0xFF)render.SetStencilReferenceValue(0)render.SetStencilCompareFunction(STENCIL_ALWAYS)render.SetStencilPassOperation(STENCIL_KEEP)render.SetStencilFailOperation(STENCIL_KEEP)render.SetStencilZFailOperation(STENCIL_KEEP)render.ClearStencil()render.SetStencilEnable(true)render.Clear(0,0,0,0,true,true)render.PushFilterMag(TEXFILTER.ANISOTROPIC)render.PushFilterMin(TEXFILTER.ANISOTROPIC)render.ResetModelLighting(1,1,1)render.SetColorModulation(1,1,1)render.SuppressEngineLighting(true)if!j.UseMaterial then render.SetBlend(.99)render.SetStencilReferenceValue(1)render.SetStencilFailOperation(STENCIL_REPLACE)render.SetStencilCompareFunction(STENCIL_EQUAL)render.MaterialOverride(e)else render.SetBlend(1)end;local n,o,p,q=j.RenderIconX&&j.RenderIconX>0&&j.RenderIconX||0,j.RenderIconY&&j.RenderIconY>0&&j.RenderIconY||0,j.Imgw-16,j.Imgh-16;if j.Paint then j.Paint(j,n-p/2,o-q/2,p,q)end;cam.Start3D(Vector(0,0,0),Angle(0,0,0),30,n,o,p,q)h:DrawModel()cam.End3D()if!j.UseMaterial then render.ClearBuffersObeyStencil(255,255,255,255,false)end;render.SetStencilEnable(false)render.PopFilterMag()render.PopFilterMin()render.MaterialOverride()render.SuppressEngineLighting(false)render.PopRenderTarget()local l=GetRenderTargetEx(i..c..3,j.Imgw,j.Imgh,RT_SIZE_NO_CHANGE,8,MATERIAL_RT_DEPTH_SHARED,CREATERENDERTARGETFLAGS_AUTOMIPMAP,IMAGE_FORMAT_RGB888)render.PushRenderTarget(l)render.Clear(0,0,0,0,true)cam.Start2D()surface.SetMaterial(m)surface.DrawTexturedRect(j.RenderIconX&&j.RenderIconX<0&&j.RenderIconX||0,j.RenderIconY&&rf.Y<0&&j.RenderIconY||0,j.Imgw,j.Imgh)cam.End2D()if!j.ignorecache then file.Write(k,render.Capture({format='png',quality=90,x=0,y=0,h=j.Imgh,w=j.Imgw}))end;render.PopRenderTarget()h:Remove()b[i]={mat=j.ignorecache&&m||Material('data/'..k,'smooth noclamp nomips'),rendering=false}return b[i]end;function srp.icon.GetRenderedIcon(g,r,s,t,u,v)local i=table.GetLastValue(string.Explode('/',g,false)):Replace('.mdl','')local w=!info.Dev&&b[i]||nil;if w&&cach.mat then return w.mat elseif!w||!w.rendering then local x=srp.icon.RenderIconTexture(i,g,{IconRenderPos=r,IconRenderAngle=s,IconRenderScale=t,Imgw=u,Imgh=v})return x.mat end end;function srp.icon.GetRenderedIconEx(g,j,y)local i=j.id||table.GetLastValue(string.Explode('/',g,false)):Replace('.mdl','')local w=!info.Dev&&b[i]||nil;if y then w=nil end;if w&&w.mat then return w.mat elseif!w||!w.rendering then local x=srp.icon.RenderIconTexture(i,g,j)return x.mat end end;local z=FindMetaTable'Weapon'function z:GetRenderedIcon()if!self.RenderDynamicIcon then return else local m=srp.icon.GetRenderedIconEx(self:GetModel(),self)self.IconRendered=m;return m end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/net_sh.lua:
function net.WriteCharacterData(a)net.WriteUInt(a.characterid,32)net.WriteString(a.name)net.WriteString(a.steamid)net.WriteString(a.biography||'')net.WriteString(a.allegiance)net.WriteUInt(a.preset,6)net.WriteUInt(a.money,32)net.WriteUInt(a.playtime,32)net.WriteUInt(a.created,32)net.WriteUInt(a.updated,32)net.WriteBool(a.ironman==1||false)net.WriteUInt(a.xp||0,32)net.WriteBool(a.groupid!=nil)if a.groupid then net.WriteString(a.groupid)net.WriteString(a.rid)net.WriteBool(a.class!=nil)if a.class then net.WriteString(a.class)end;net.WriteBool(a.lorename!=nil)if a.lorename then net.WriteString(a.lorename)end end end;function net.ReadCharacterData()local a={}a.characterid=net.ReadUInt(32)a.name=net.ReadString()a.steamid=net.ReadString()a.biography=net.ReadString()a.allegiance=net.ReadString()a.preset=net.ReadUInt(6)a.money=net.ReadUInt(32)a.playtime=net.ReadUInt(32)a.created=net.ReadUInt(32)a.updated=net.ReadUInt(32)a.ironman=net.ReadBool()a.xp=net.ReadUInt(32)if net.ReadBool()then a.groupid=net.ReadString()a.rid=net.ReadString()if net.ReadBool()then a.class=net.ReadString()end;if net.ReadBool()then a.lorename=net.ReadString()end end;return a end;function net.ReadItem()return srp.items.Get(net.ReadString())end;function net.WriteItem(b)net.WriteString(istable(b)&&b.id||b)end;function net.ReadCosmetic(c)if c then return cosmetics.Get(net.ReadUInt(12),true)else return net.ReadUInt(12)end end;function net.WriteCosmetic(b)net.WriteUInt(istable(b)&&b.id||b,12)end;function net.WriteAllegiance(d)net.WriteUInt(d.internal,4)end;function net.WriteAllegianceID(e,f)if f then net.WriteUInt(e,4)else net.WriteString(e)end end;function net.ReadAllegiance(f)return srp.allegiance.Get(net.ReadUInt(4),f||true)end;function net.WriteGroup(g)net.WriteUInt(g.internal,5)end;function net.WriteGroupID(e,f)if f then net.WriteUInt(e,5)else net.WriteString(e)end end;function net.ReadGroup(f)if interal then return srp.groups.Get(net.ReadString(),false)else return srp.groups.Get(net.ReadUInt(5),true)end end;function net.WriteGroupRank(h)net.WriteUInt(h.internal,10)end;function net.ReadGroupRank()return srp.granks.Get(net.ReadUInt(10),true)end;function net.WriteAttachment(i)net.WriteUInt(i.internalid,10)end;function net.ReadAttachment()return srp.WeaponAttachments.Get(net.ReadUInt(10),true)end;function net.WriteTriumph(j)net.WriteUInt(j.internal,10)end;function net.ReadTriumph()return srp.triumphs.Get(net.ReadUInt(10),true)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/string_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/player_extension_sh.lua:
function PLAYER:GetTool(a)local b=self:GetWeapon'gmod_tool'if!IsValid(b)||!b.GetToolObject then return nil end;local c=b:GetToolObject(a)if!c then return nil end;return c end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/search_models_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/contextmenu_cl.lua:
local a={}AccessorFunc(a,"m_bHangOpen","HangOpen")function a:Init()self:SetWorldClicker(true)self.Canvas=vgui.Create("DCategoryList",self)self.m_bHangOpen=false end;function a:Open()self:SetHangOpen(false)if g_SpawnMenu:IsVisible()then g_SpawnMenu:Close(true)end;if self:IsVisible()then return end;CloseDermaMenus()self:MakePopup()self:SetVisible(true)self:SetKeyboardInputEnabled(false)self:SetMouseInputEnabled(true)RestoreCursorPosition()local b=true;if b&&IsValid(spawnmenu.ActiveControlPanel())then self.OldParent=spawnmenu.ActiveControlPanel():GetParent()self.OldPosX,self.OldPosY=spawnmenu.ActiveControlPanel():GetPos()spawnmenu.ActiveControlPanel():SetParent(self)self.Canvas:Clear()self.Canvas:AddItem(spawnmenu.ActiveControlPanel())self.Canvas:Rebuild()self.Canvas:SetVisible(true)else self.Canvas:SetVisible(false)end;self:InvalidateLayout(true)end;function a:Close(c)if self:GetHangOpen()then self:SetHangOpen(false)return end;RememberCursorPosition()CloseDermaMenus()self:SetKeyboardInputEnabled(false)self:SetMouseInputEnabled(false)self:SetAlpha(255)self:SetVisible(false)self:RestoreControlPanel()end;function a:PerformLayout()self:SetPos(0,0)self:SetSize(ScrW(),ScrH())self.Canvas:SetWide(311)self.Canvas:SetPos(ScrW()-self.Canvas:GetWide()-225,self.y)if IsValid(spawnmenu.ActiveControlPanel())then spawnmenu.ActiveControlPanel():InvalidateLayout(true)local d=spawnmenu.ActiveControlPanel():GetTall()+10;local e=ScrH()*0.8;if d>e then d=e end;self.Canvas:SetTall(d)self.Canvas.y=ScrH()-50-d end;self.Canvas:InvalidateLayout(true)end;function a:StartKeyFocus(f)self:SetKeyboardInputEnabled(true)self:SetHangOpen(true)end;function a:EndKeyFocus(f)self:SetKeyboardInputEnabled(false)end;function a:RestoreControlPanel()if!spawnmenu.ActiveControlPanel()then return end;if!self.OldParent then return end;spawnmenu.ActiveControlPanel():SetParent(self.OldParent)spawnmenu.ActiveControlPanel():SetPos(self.OldPosX,self.OldPosY)self.OldParent=nil end;vgui.Register("ContextMenu",a,"EditablePanel")function CreateContextMenu()if IsValid(g_ContextMenu)then g_ContextMenu:Remove()g_ContextMenu=nil end;g_ContextMenu=vgui.Create("ContextMenu")g_ContextMenu:SetVisible(false)g_ContextMenu.OnMousePressed=function(g,h)hook.Run("GUIMousePressed",h,gui.ScreenToVector(gui.MousePos()))end;g_ContextMenu.OnMouseReleased=function(g,h)hook.Run("GUIMouseReleased",h,gui.ScreenToVector(gui.MousePos()))end;hook.Run("ContextMenuCreated",g_ContextMenu)end;function GM:OnContextMenuOpen()if!hook.Call("ContextMenuOpen",GAMEMODE)then return end;if IsValid(g_ContextMenu)&&!g_ContextMenu:IsVisible()then g_ContextMenu:Open()end;hook.Call('ContextMenuOpened',GAMEMODE)end;function GM:OnContextMenuClose()if IsValid(g_ContextMenu)then g_ContextMenu:Close()end;hook.Call('ContextMenuClosed',GAMEMODE)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/spawnmenu_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/toolpanel_cl.lua:
local a={}AccessorFunc(a,"m_TabID","TabID")function a:Init()self.HorizontalDivider=vgui.Create("DHorizontalDivider",self)self.HorizontalDivider:Dock(FILL)self.HorizontalDivider:SetLeftWidth(130)self.HorizontalDivider:SetLeftMin(130)self.HorizontalDivider:SetRightMin(200)if ScrW()>=1024 then self.HorizontalDivider:SetRightMin(256)end;self.HorizontalDivider:SetDividerWidth(6)self.HorizontalDivider:SetCookieName("SpawnMenuToolMenuDiv")local b=vgui.Create("Panel",self.HorizontalDivider)self.SearchBar=vgui.Create("DTextEntry",b)self.SearchBar:SetWidth(130)self.SearchBar:SetPlaceholderText("#spawnmenu.quick_filter")self.SearchBar:DockMargin(0,0,0,5)self.SearchBar:Dock(TOP)self.SearchBar:SetUpdateOnType(true)self.SearchBar.OnValueChange=function(c,d)local d=d:Trim():lower()for e,f in pairs(self.List.pnlCanvas:GetChildren())do local g=0;local h=false;if string.find(f.Header:GetText():lower(),d,nil,true)then h=true end;for e,i in pairs(f:GetChildren())do if i==f.Header then continue end;local j=i.Text;if j:StartWith("#")then j=j:sub(2)end;j=language.GetPhrase(j)if!h&&!string.find(j:lower(),d,nil,true)then i:SetVisible(false)else i:SetVisible(true)g=g+1 end;i:InvalidateLayout()end;if g<1&&!h then f:SetVisible(false)else f:SetVisible(true)if d==""then if f._preSearchState!=nil then f:SetExpanded(f._preSearchState)f._preSearchState=nil end else if f._preSearchState==nil then f._preSearchState=f:GetExpanded()end;f:SetExpanded(true)end end;f:InvalidateLayout()end;self.List.pnlCanvas:InvalidateLayout()self.List:InvalidateLayout()end;self.List=vgui.Create("DCategoryList",b)self.List:SetWidth(130)self.List:Dock(FILL)self.HorizontalDivider:SetLeft(b)self.Content=vgui.Create("DCategoryList",self.HorizontalDivider)self.HorizontalDivider:SetRight(self.Content)end;function a:LoadToolsFromTable(k)local k=table.Copy(k)for l,m in pairs(k)do if istable(m)then local n=m.ItemName;local o=m.Text;m.ItemName=nil;m.Text=nil;self:AddCategory(n,o,m)end end end;function a:AddCategory(p,q,r)local s=self.List:Add(q)s:SetCookieName("ToolMenu."..tostring(self:GetTabID()).."."..tostring(p))local t={}for l,m in pairs(r)do local j=m.Text;if j:StartWith("#")then j=j:sub(2)end;t[language.GetPhrase(j)]=m end;local u=GetConVarString("gmod_toolmode")for l,m in SortedPairs(t)do local i=s:Add(m.Text)i.DoClick=function(v)spawnmenu.ActivateTool(v.Name)end;i.DoRightClick=function(v)spawnmenu.ShowQuickToolMenuSettings(v)end;i.ControlPanelBuildFunction=m.CPanelFunction;i.Command=m.Command;i.Name=m.ItemName;i.Controls=m.Controls;i.Text=m.Text;if u==m.ItemName then timer.Simple(0,function()g_SpawnMenu.StartupTool=i end)end end;self:InvalidateLayout()end;function a:SetActiveToolText(j)for e,f in pairs(self.List.pnlCanvas:GetChildren())do for e,i in pairs(f:GetChildren())do if i==f.Header then continue end;if i.Name==j then self.List:UnselectAll()i:SetSelected(true)return end end end end;function a:SetActive(w)local x=self.Content:GetCanvas():GetChildren()for l,m in pairs(x)do m:SetVisible(false)end;self.Content:AddItem(w)w:SetVisible(true)w:Dock(TOP)end;vgui.Register("ToolPanel",a,"Panel")
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/utilitiesmenu_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contentheader_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/checkbox_ui.lua:
local a={}local b=Color(0,0,0,200)function a:Init()self.speed=480;self.optiondata={}self.position=1;self.SelectionBackground=b;self:AddPanel('srp_button_rounded',function(c)c:SetText''c:DockMargin(0,0,0,0)c:SetBackgroundColor(b)c:SetHoverColor(col.red_dark)c:LeftClick(function()self:TogglePosition()end)self.option1=c end)self:AddPanel('srp_button_rounded',function(c)c:SetText''c:DockMargin(0,0,0,0)c:SetBackgroundColor(b)c:SetHoverColor(col.green_dark)c:LeftClick(function()self:TogglePosition()end)self.option2=c end)end;function a:SetColor(col)self.SelectionBackground=col end;function a:GetColor()return self.SelectionBackground end;function a:SetSelectionBackground(col)self.selectionbackground=col end;function a:SetSpeed(d)self.speed=d end;function a:SetFont(e,f)self.option1:SetFont(e)self.option2:SetFont(e)self.IsIcon=f end;function a:SetDisabled(g,h)self.option1:SetDisabled(g,h)self.option2:SetDisabled(g,h)return self end;function a:SetHoverColor(col)self.option1:SetHoverColor(col)self.option2:SetHoverColor(col)return self end;function a:SetOptions(i,j)i=istable(i)&&i||{name=i}j=istable(j)&&j||{name=j}self.optiondata[1]=i;self.optiondata[2]=j;self.option1:SetText(i.name,self.IsIcon)self.option2:SetText(j.name,self.IsIcon)self.option1:SetHoverColor(i.hover||col.red_dark)self.option2:SetHoverColor(j.hover||col.green_dark)self.option1:SetSelectedBackgroundColor(i.background||i.green_dark)self.option2:SetSelectedBackgroundColor(j.background||col.green_dark)self:SetPosition(j.select&&2||1,true)return self end;function a:SetValue(k)self:SetPosition(k)return self end;function a:GetValue()return self.optiondata[self.position||1].value end;function a:SetPosition(k,l,m)local n=self.optiondata[1].background||col.red_dark;local o=self.optiondata[2].background||col.green_dark;self.position=math.Clamp(k,0,2)self.option1:Select(k==1)self.option2:Select(k==2)self.option1:ColorTo(k==1&&n||col.grey,.1,0)self.option2:ColorTo(k==2&&o||col.grey,.1,0)if!m then self:_OnValueChanged(k,self.optiondata[k])end;if l then self.SelectionPosition=k end;return self end;function a:GetPosition()return self.position end;function a:TogglePosition()self:SetPosition(self.position==1&&2||1)end;function a:OnValueChanged(p)self._OnValueChanged=p;return self end;function a:_OnValueChanged(q,r)end;function a:PerformLayout(s,t)local u,v=self:GetDockPadding()local w=s/2-u*2;local x=t-v*2;self.option1:SetSize(w,x)self.option1:SetPos(u,v)self.option2:SetSize(w,x)self.option2:SetPos(s/2+u,v)end;function a:Paint(s,t)end;vgui.Register('srp_checkbox',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/numberinput_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/presents_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/rating_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/search_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/triviasettings_ui.lua:
local a={}function a:Init()self:SetTitle'Trivia'self:SetSize(600,400)self:Center()self:MakePopup()self:SetBackgroundColor(col.white_dark)self.Types={1}self.QuestionCount=10;self:AddPanel('srp_label',function(b)b:Dock(TOP)b:SetText'Question Count'end)self:AddPanel('srp_grid',function(c)c:Dock(TOP)c:SetAutoHeight(true)self:AddQuestionCount(c,10)self:AddQuestionCount(c,25)self:AddQuestionCount(c,50)self.CountGrid=c end)self:AddPanel('srp_label',function(b)b:Dock(TOP)b:SetText'Question Types'end)self:AddPanel('srp_grid',function(c)c:Dock(TOP)c:SetAutoHeight(true)self:AddQuestionTypes(c)self.TypeGrid=c end)end;function a:AddQuestionTypes(c)for d,e in pairs(srp.trivia.categories)do self:AddPanel('srp_button_rounded',function(f)btn.dataid=d;btn.data=e;btn:SetSize(128,128)btn:SetBackgroundColor(col.white)btn:SetHoverColor(col.white_dark)btn:SetSelectedBackground(col.blue_light)btn:SetText(e.name)btn:SetFont'ui_header.rb'btn:LeftClick(function(g)if!g:IsSelected()then self:SelectQuestionType(g)else self:DeselectQuestionType(g)end end)c:AddItem(btn)end)end end;function a:DeselectQuestionType(g)g:SetSelected(false)if self.Types[g.dataid]then self.Types[g.dataid]=nil end end;function a:SelectQuestionType(g)g:SetSelected(true)self.Types[g.dataid]=g end;function a:AddQuestionCount(c,h)self:AddPanel('srp_button_rounded',function(f)btn:SetSize(128,128)btn:SetBackgroundColor(col.white)btn:SetHoverColor(col.white_dark)btn:SetText(h)btn:SetFont'ui_header.rb'btn:LeftClick(function(g)self:SetQuestionCount(h,g)end)c:AddItem(btn)end)end;function a:SetQuestionCount(h,g)self.QuestionCount=h;for i,j in ipairs(self.CountGrid:GetChildren())do j:SetSelected(j==g)end end;vgui.Register('srp_trivia',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/visualnodes/visualnode_ui.lua:
local a=[[
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Superior Dialogue</title>
	<script type="module" src="http://r2-cdn.superiorservers.co/ssrp/webdialogue/index-DLSRl9bP.js"></script>
	<link rel="stylesheet" href="http://r2-cdn.superiorservers.co/ssrp/webdialogue/index-BzeEUfKk.css">
</head>

<body id="app">
</body>

</html>
]]concommand.Add('srp_test',function()local b,c=math.min(1400,ScrW()),math.min(ScrH(),720)srp.ui.Create('srp_window',function(d)d:SetTitle'Dialogue Trees'd:SetBackgroundColor(col.midnight_dark)d:SetSize(b,c)d:Center()d:MakePopup()d:AddPanel('DHTML',function(e)e:Dock(FILL)e:SetPos(0,0)e:SetAllowLua(true)e:SetHTML(a)end)end)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/battlepass_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buffs/buffs_cl.lua:
srp.buffs=srp.buffs||{}srp.buffs.buffui=srp.buffs.buffui;local function a()if IsValid(srp.buffs.buffui)then return end;srp.ui.Create('srp_buffbar',function(b)srp.buffs.buffui=b end)end;function srp.buffs.AddUI(c,d,e)a()srp.buffs.buffui:AddBuff(d,e)end;function srp.buffs.RemoveUI(c,d)if IsValid(srp.buffs.buffui)then srp.buffs.buffui:RemoveBuff(d.id)end end;hook('OnBuffAdded',srp.buffs.AddUI)hook('OnBuffRemoved',srp.buffs.RemoveUI)local f={}net('srp.buffs.Add',function()local g=net.ReadUInt(8)local h=net.ReadBool()srp.buffs.Add(LocalPlayer(),g,h&&net.ReadUInt(32),true)f[g]=CurTime()end)net('srp.buffs.Remove',function()srp.buffs.Remove(LocalPlayer(),net.ReadUInt(8),true)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cards/ui/cardcreate_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cards/ui/cardcreate_ui.lua:
local a={}function a:Init()self:SetTitle'Create a Card'self:SetSize(1280,720)self:Center()self:MakePopup()self:SetBackgroundColor(col.midnight_light)self:SetDraggable(false)self:AddPanel('srp_modelcard',function(b)b:Dock(RIGHT)b:SetWide(1000)b:Populate(1,'Receiver Name','Text','Sender Name')b.IsPreview=true;self.card=b end)self:AddPanel('srp_panel',function(c)c:DockMargin(0,0,0,0)c:SetBackgroundColor(col.transparent)c:SetSize(302,720)c:SetPos(20,50)c:DockPadding(0,0,0,0)c:AddPanel('srp_label',function(d)d:Dock(TOP)d:SetText'Receiver'd:SetTextColor(col.white)end)c:AddPanel('srp_search',function(c)c:DockMargin(4,4,4,4)c:Dock(TOP)c:SetPlayerSearch()c:SetBackgroundColor(col.midnight_dark)c:SetTextColor(col.white)c:SetMinSearchWidth(290)c:OnFilterResults(function(e,f)local g={}local h=LocalPlayer():SteamID()for i,j in pairs(f)do if j.steamid==h then end;local k=player.GetBySteamID(j.steamid)if IsValid(k)&&k:CharacterID()==j.characterid then j.tag='Online Now'end;table.insert(g,j)end;return g end)c:OnSelected(function(e,l)self.ReceiverName:SetText(l.name)self.ReceiverSteamID=l.steamid;self.card:SetToText(l.name)e:SetText(l.name..' ('..l.steamid..')')end)end)c:AddPanel('srp_label',function(d)d:Dock(TOP)d:SetText'Receiver Name'd:SetTextColor(col.white)end)c:AddPanel('srp_textinput',function(d)d:SetPos(40,60)d:Dock(TOP)d:SetText''d:SetBackgroundColor(col.midnight_dark)d:SetTextColor(col.white)d:OnValid(function(m)self.card:SetToText(m:GetValue())end)self.ReceiverName=d end)c:AddPanel('srp_label',function(d)d:Dock(TOP)d:SetText'Sender Name'd:SetTextColor(col.white)end)c:AddPanel('srp_textinput',function(d)d:Dock(TOP)d:SetText(LocalPlayer():Nick())d:SetBackgroundColor(col.midnight_dark)d:SetTextColor(col.white)d:OnValid(function(m)self.card:SetFromText(m:GetValue())end)self.SenderName=d end)c:AddPanel('srp_label',function(d)d:Dock(TOP)d:SetText'Theme'd:SetTextColor(col.white)end)c:AddPanel('srp_dropdown',function(n)n:Dock(TOP)n:SetBackgroundColor(col.midnight_dark)n:OnSelect(function(e,o,p)self.card:SetThemeID(p.id)self.ThemeID=p.id end)for q,p in ipairs(srp.cards.cardthemes)do n:AddOption(p.name,{id=q},nil,q==1)end;self.Themes=n end)c:AddPanel('srp_label',function(d)d:Dock(TOP)d:SetText'Message'd:SetTextColor(col.white)end)c:AddPanel('srp_textinput',function(d)d:Dock(TOP)d:SetTall(340)d:SetText''d:SetMultiline(true)d:SetBackgroundColor(col.midnight_dark)d:SetTextColor(col.white)d:OnValid(function(m)self.card:SetBodyText(m:GetValue())end)self.Body=d end)c:AddPanel('srp_button_rounded',function(r)r:Dock(TOP)r:SetText('Send for '..srp.cards.cost..'RC')r:SetBackgroundColor(col.midnight)r:SetHoverColor(col.midnight_dark)r:SetTextColor(col.white)r:LeftClick(function()r:SetDisabled(true)srp.cards.AddCard(self.ThemeID||1,self.SenderName:GetValue(),self.ReceiverName:GetValue(),self.ReceiverSteamID,self.Body:GetValue(),0)timer.Simple(1,function()if IsValid(r)then r:SetDisabled(false)end end)end)end)end)end;vgui.Register('srp_cardcreate',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cards/ui/cardmodelview_ui.lua:
local a={}a.Envelope=Model'models/galactic/seasonal/envelope/envelope.mdl'a.Card=Model'models/galactic/seasonal/card/card.mdl'a.Steps={{NextClick=.25,Transform={envelope={ang={5,Angle(0,0,0)},pos={5,Vector()}},card={ang={5,Angle(-180,0,0)},pos={5,Vector(0,-100,0)}}},UIOffset=Vector(25,0,-.1),UIAngle=Angle(180,0,0),UIOffsetPreview=Vector(0,0,-.1),UIAnglePreview=Angle(180,0,0),UIScale=.1,PostDrawModel=function(b,c,d,e)if!d.IsEnvelope||!b.To then return end;local f=b.IsPreview&&c.UIOffsetPreview||c.UIOffset;local g=d:LocalToWorld(f+e)cam.Start3D2D(g,d:LocalToWorldAngles(c.UIAngle),c.UIScale)DisableClipping(true)draw.DrawText(b.To,'ui_header.l',0,1,col.grey_dark,TEXT_ALIGN_LEFT)DisableClipping(false)cam.End3D2D()end},{Transform={envelope={ang={5,Angle(180,0,0)},pos={5,Vector()}}},UIOffset=Vector(0,15,.1),UIAngle=Angle(0,0,0),UIOffsetPreview=Vector(26,15,.1),UIAnglePreview=Angle(0,0,0),UIScale=.1,PostDrawModel=function(b,c,d,e)if!d.IsEnvelope||!b.From then return end;local f=b.IsPreview&&c.UIOffsetPreview||c.UIOffset;local g=d:LocalToWorld(f+Vector(-e.x,e.y,0))cam.Start3D2D(g,d:LocalToWorldAngles(c.UIAngle),c.UIScale)DisableClipping(true)draw.DrawText('If unwanted return to '..b.From,'ui_label.xl',0,0,col.grey_light,TEXT_ALIGN_CENTER)draw.DrawText('superiorservers.co','ui_label.xl',0,340,col.grey_light,TEXT_ALIGN_CENTER)DisableClipping(false)cam.End3D2D()end},{NextClick=.5,UIScale=1,Transform={envelope={pos={5,Vector(0,0,100)}},card={pos={5,Vector()}}}},{NextClick=1,Transform={card={ang={5,Angle(0,0,0)}}},UIOffset=Vector(25,18,0),UIAngle=Angle(180,0,0),UIOffsetPreview=Vector(0,18,0),UIAnglePreview=Angle(180,0,0),UIScale=.1,PostDrawModel=function(b,c,d,e)if!d.IsCard||!b.Body||!istable(b.Body)then return end;local h,i=10,25;local f=b.IsPreview&&c.UIOffsetPreview||c.UIOffset;local g=d:LocalToWorld(f+e)cam.Start3D2D(g,d:LocalToWorldAngles(c.UIAngle),c.UIScale)DisableClipping(true)for j=1,#b.Body do if j>30 then break end;draw.DrawText(b.Body[j],'ui_label.xl',h,i+20*j,col.grey_light,TEXT_ALIGN_LEFT)end;DisableClipping(false)cam.End3D2D()end}}function a:Init()self:SetFOV(80)self:SetCamPos(Vector(0,0,-100))self:SetCamAngle(Angle(-90,-90,0))end;function a:Populate(k,l,m,n)self.To=l;self.From=n;self:SetBodyText(m)self.Step=1;local o=self:AddModel(self.Envelope,Vector(),Angle(0,0,0))o.IsEnvelope=true;local p=self:AddModel(self.Card,Vector(0,-100,0),Angle(180,0,0))p.IsCard=true;self.Models={card=p,envelope=o}self:SetThemeID(k)end;function a:SetToText(q)self.To=q end;function a:SetFromText(q)self.From=q end;function a:SetBodyText(q)local r='ui_label.xl'local s={}local t=string.Explode('\\n',q)for j=1,#t do local u=string.Wrap(t[j],r,500)for v=1,#u do table.insert(s,u[v])end end;self.Body=s end;function a:SetThemeID(w)local x=srp.cards.cardthemes[w]if x then self.Models.card:SetSubMaterial(0,x.icon)end end;function a:PostDrawModel(d)local c=self.Steps[self.Step]if!c then return end;local y,z=self:LocalToScreen(self:GetPos())local e=Vector(y,z,0)*c.UIScale;if c.PostDrawModel then c.PostDrawModel(self,c,d,e)end end;function a:PreDrawModel(d)local c=self.Steps[self.Step]if!c then return end;if c.PreDrawModel then c.PreDrawModel(self,c,d)end end;function a:OnStepChanged(w)end;function a:OnMousePressed(A)if self.NextClick&&self.NextClick>CurTime()then return end;if self.OnEnd then self:OnEnd()end;self.Step=self.Step%#self.Steps+1;local c=self.Steps[self.Step]self:OnStepChanged(c)if c.OnStart then c.OnStart(self,c)end;if c.Transform then for w,B in pairs(c.Transform)do local d=self.Models[w]if!IsValid(d)then continue end;if B.ang then self:SetEntAngLerp(d,B.ang[1],B.ang[2])end;if B.pos then self:SetEntPosLerp(d,B.pos[1],B.pos[2])end end end;self.NextClick=CurTime()+(c.NextClick||2)self.OnEnd=c.OnEnd;self.Think=c.Think end;vgui.Register('srp_modelcard',a,'srp_modelpanel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/characterinfo_ui.lua:
local a={}local b='ssrp/'..info.WebID..'/profile/'local c=40000;local d=Material'gui/noicon.png'a.UIPosition=Vector(0,0,50)a.UIAngles=Angle(0,90,90)local e={}local f={casino_losses={Icon=Material'materials/galactic/ui/triumphs/dealer.png',GetName=function(self,g)return'Casino Losses'end,GetValue=function(self,h)return string.Comma(h||0)..' RC'end},casino_wins={Icon=Material'materials/galactic/ui/triumphs/gambling.png',GetName=function(self,g)return'Casino Winnings'end,GetValue=function(self,h)return string.Comma(h||0)..' RC'end},pallets={Icon=Material'materials/galactic/ui/triumphs/package.png',GetName=function(self,g)return'Deliveries'end},patrols={Icon=Material'materials/galactic/ui/triumphs/patrol.png',GetName=function(self,g)return'Patrols'end},npc_kills={Icon=Material'materials/galactic/ui/triumphs/robot.png',GetName=function(self,g)return'Kills: NPC'end},pvp_kills={Icon=Material'materials/galactic/ui/triumphs/target.png',GetName=function(self,g)return'Kills: Player'end},weapon={GetValue=function(self,h)return string.Comma(h||0)..' Kills'end,GetWeapon=function(self,g)return weapons.GetStored(g)end}}function a:Init()self:DockPadding(10,10,10,10)self:SetVisible(false)self:SetSize(400,0)self:SetKeyBoardInputEnabled(false)self:SetMouseInputEnabled(false)self:SizeTo(-1,0,0.2,15,-1,function()if IsValid(self)then self:Remove()end end)end;function a:SetPlayer(i)if!IsValid(i)then self:Remove()return end;self.Player=i;self.Scale=0.05;self.PlayerSet=true;self:UpdateTransform()self:Start3D()self:LoadPlayer(i)self:AddPanel('srp_panel',function(j)j:SetBackgroundColor(Color(0,0,0,1))j:DockMargin(2,2,2,10)j:DockPadding(15,15,15,15)j:SetTall(80)j:Dock(TOP)j:AddPanel('srp_panel',function(j)j:Dock(FILL)j:DockMargin(0,0,0,0)j:DockPadding(0,0,0,0)j:SetBackgroundColor(col.transparent)j:AddPanel('srp_label',function(k)k:Dock(TOP)k:SetContentAlignment(4)k:SetFont'ui_header.l'k:SetText'Profile'self.Name=k end)j:AddPanel('srp_label',function(k)k:Dock(FILL)k:SetContentAlignment(7)k:SetFont'ui_header.r'k:SetText'Loading.. please wait!'self.Biography=k end)end)j:AddPanel('srp_label',function(k)k:Dock(RIGHT)k:SetContentAlignment(5)k:SetFont'ui_header.l'k:SetText'0'k:SetWide(80)k:SetBackgroundColor(col.grey_dark)k:SetVisible(false)self.Points=k end)self.Title=j end)self:AddPanel('srp_panel_rounded',function(j)j:Dock(TOP)j:SetTall(128)j:SetVisible(false)j:AddPanel('srp_label',function(k)k:Dock(FILL)k:SetText''k:SetFont'ui_header.l'self.WeaponName=k end)j:AddPanel('srp_label',function(k)k:Dock(RIGHT)k:SetWide(150)k:SetText''k:SetContentAlignment(6)k:SetFont'ui_header.l'self.WeaponValue=k end)self.Weapon=j end)end;function a:LoadPlayer(i)local l=math.max(1,i:CharacterID())self.isSearching=true;self:SetVisible(true)self:SizeTo(-1,104,.3,0,-1)timer.Simple(.1,function()if IsValid(self)then self:Refresh(l)end end)end;function a:Refresh(l)ba.http.FetchJson(b..l,function(m)if!IsValid(self)then return end;if!IsValid(self.Player)then self:DoRemove()return end;self:Populate(m)end,function()if IsValid(self)then self:Error'Unkown Error'end end)end;function a:Populate(m)self.isSearching=false;self:SizeTo(-1,550,.4,0,-1)self.Name:SetText(self.Player:Nick())self.Biography:SetText(m.biography||'')local n=self.Player:GetAltChatColor():Copy()n.a=55;self.Title:SetBackgroundColor(n)self.Points:SetVisible(true)self.Points:SetText(m.triumphs||0)if m.statistics then self:AddStat('casino_wins',m.statistics.casino_wins)self:AddStat('casino_losses',m.statistics.casino_losses)self:AddStat('pallets',m.statistics.pallets)self:AddStat('patrols',m.statistics.patrols)self:AddStat('pvp_kills',m.statistics.pvp_kills)self:AddStat('npc_kills',m.statistics.npc_kills)if m.statistics.weapon then local o=f.weapon:GetWeapon(m.statistics.weapon.class)if o then self.Weapon:SetVisible(true)self.WeaponValue:SetText(string.Comma(m.statistics.weapon.value||0)..' Kills')self.WeaponName:SetText(o.PrintName||o.Class||m.statistics.weapon.class)end end end end;function a:AddStat(p,m)if!m then return end;local info=f[p]if!info then return end;self:AddPanel('srp_panel_rounded',function(j)j:SetTall(40)j:DockPadding(2,2,2,2)j:DockMargin(5,5,5,5)j:Dock(TOP)j:SetBackgroundColor(col.grey_dark)local q=info.Icon||info.GetIcon&&info:GetIcon(m.class||m.key)||d;j:AddPanel('DImage',function(r)r:Dock(LEFT)r:SetWide(36)if q then r:SetMaterial(q)end end)j:AddPanel('srp_label',function(k)k:Dock(FILL)k:SetContentAlignment(4)k:SetFont'ui_header.r'k:SetText(info:GetName(m.class||m.key))end)j:AddPanel('srp_label',function(k)k:Dock(RIGHT)k:SetWide(190)k:SetContentAlignment(6)k:SetFont'ui_header.r'k:SetText(info.GetValue&&info:GetValue(m.value)||string.Comma(m.value))end)end)end;function a:SetColor(col)self.m_bgColor=col end;function a:GetColor()return self.m_bgColor||col.black end;function a:Error(g)self.Name:SetText'Erorr'self.Biography:SetText(g:sub(1,45))self.Title:ColorTo(col.red_dark,1,0)self:DoRemove(1.5)end;function a:IsLookingAt()local s=LocalPlayer():GetAimVector()local t=(self.Player:GetPos()-LocalPlayer():GetShootPos()):GetNormalized()local u=s:Dot(t)return u>0.35 end;function a:DoRemove(v)self.Think=function()end;v=v||0;self:SizeTo(-1,0,.4,v,1)self:AlphaTo(0,0.4,v,function()if IsValid(self)then self:Remove()end end)end;function a:UpdateTransform()local i;local w=isThirdPerson()if w then i=LocalPlayer()else i=self.Player end;local x=i:GetShootPos()local y=LocalPlayer():GetRealView()y.z=x.z;local z=y-x;local A=x+z:GetNormalized()*30;local B=z:Angle()B.y=B.y+90;B.r=B.r+90;if w then B:RotateAroundAxis(B:Forward(),-15)A.z=A.z+20 end;A=A+B:Forward()*-(self:GetWide()*.025)self.Position=A;self.Angles=B end;function a:Paint(C,D)derma.SkinHook('Paint','RoundedPanel',self,C,D)if!self.PlayerSet then return end;if!IsValid(self.Player)||!self:IsLookingAt()||LocalPlayer():GetPos():DistToSqr(self.Player:GetPos())>c then self:DoRemove()return end;self:UpdateTransform()end;function a:Start3D()self.IsThreeDimensional=true;hook.Add('PostDrawTranslucentRenderables',self,function()vgui.Start3D2D(self.Position,self.Angles,self.Scale)self:Paint3D2D()vgui.End3D2D()end)end;vgui.Register('srp_characterpanel',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/selectionpanels/purchase_ui.lua:
local a={bordercolor=Color(255,255,255,25),background=Color(255,255,255,15)}local b=Color(200,200,200,15)local c=Material('materials/galactic/ui/menu/money-4.png','smooth noclamp')function a:Init()self:DockMargin(0,0,0,3)self:DockPadding(1,1,1,1)self:SetCursor('hand')self:SetTall(34)self:SetText''self:SetFont'ui_label.r'self:SetContentAlignment(4)self:AddPanel('srp_button_tag_rounded',function(d)d:Dock(LEFT)d:SetContentAlignment(5)d:SetText'0 Credits'd:DockMargin(0,0,4,0)d:SetMouseInputEnabled(false)d:SetMaterial(c)d:SetMaterialBackground(self.bordercolor)d:SetBackgroundColor(self.bordercolor)d:SetWide(102)d:SetBorderColor(col.transparent)self.cost=d end)end;function a:Populate(e,f,g)if LocalPlayer():HasUpgrade(f)&&!g then self:Remove()return end;self:SetText(e)self.text=e;self.stacking=g;self.upgradeid=f;self.upgrade=srp.shop.GetByUID(self.upgradeid)self.cost:SetText(string.Comma(self.upgrade.Price)..' Credits')self:LeftClick(function(h)if self.LastClicked&&CurTime()-self.LastClicked<=2 then timer.Remove('characterselect_purchase_'..f)self.LastClicked=nil;self:PurchaseUpgrade()else self:SetDisabled(true,0.2)self.LastClicked=CurTime()self:SetText'Click to confirm.'timer.Create('characterselect_purchase_'..f,2,1,function()if IsValid(self)then self:SetText(self.text)end end)end end)end;function a:PurchaseUpgrade()local i=LocalPlayer():GetCredits()-self.upgrade.Price;if i>=0 then cmd.Run('buyupgrade',self.upgrade.ID)else ba.ui.OpenAuthLink('/'..info.WebID..'/credits/'..LocalPlayer():SteamID()..'/'..math.abs(i))end;self:UpdateButton(i>=0)end;function a:UpdateButton(j)if j then self:SetDisabled(true)self:SetText'Purchased, Thank you!'self.completed=true;self:_Unlocked()if self.stacking then self:SetDisabled(true,2,function()self.completed=false;self:SetText(self.text)end)else self:AlphaTo(0,1,1,function()if IsValid(self)then self:Remove()end end)end;hook.Run('OnCharacterUpgradeComplete',self.upgrade)else self:SetText'Insufficient funds.'self.warning=true;self:SetDisabled(true,2,function()self.warning=false;self:SetText(self.text)end)end end;function a:OnUnlocked(k)self._Unlocked=k end;function a:_Unlocked()end;local l=Color(255,215,0,120)local m=Color(255,50,50,120)local n=Color(50,255,50,120)local b=Color(255,255,255,15)function a:Paint(o,p)if self.completed then self.cost:SetBackgroundColor(n)elseif self.warning then self.cost:SetBackgroundColor(m)elseif self:IsHovered()then self:SetTextColor(l)self.cost:SetBackgroundColor(l)else self:SetTextColor(col.white)self.cost:SetBackgroundColor(b)end;draw.RoundedBox(4,0,0,o,p,b)end;vgui.Register('srp_character_button_purchase',a,'srp_button')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/construction/construction_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_displaycallingcard_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_presetcontroller_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmeticvehicle_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/crafting/ui/craftingitem_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/crowdfunders_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/ui/menu_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/defcon/defcon_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/eventrewards/eventrewards_sh.lua:
srp.gmrewards=srp.gmrewards||{}nw.Register'srp.gmrewards.points':Write(net.WriteUInt,16):Read(net.ReadUInt,16):SetLocalPlayer():SetHook'OnGameMasterPointsReceived'nw.Register'srp.gmrewards.maxpoints':Write(net.WriteUInt,16):Read(net.ReadUInt,16):SetLocalPlayer():SetHook'OnGameMasterMaxPointsReceived'local a={}local b='materials/icon16/shield.png'local c={['Droid Spawner']={Id='title10',Name='Droid Spawner',Points=10},['Grinder']={Id='title31',Name='Grinder',Points=31},['Event Spammer']={Id='title50',Name='Event Spammer',Points=50},['Megamind']={Id='title61',Name='Megamind',Points=61}}srp.gmrewards.Rewards={{{Id='money',Repeat=true,Values={15000}}},{{}},{{Id='callingcard',Repeat=false,Values={'callingcard_error'}}},{{Id='money',Repeat=true,Values={15000}}},{{Id='credits',Repeat=false,Values={50}}},{{Id='xmas_token',Repeat=true,Values={10}}},{{}},{{Id='xp',Repeat=false,Values={5000}}},{{Id='money',Repeat=true,Values={15000}}},{{}},{{Id='xp',Repeat=true,Values={5000}}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='credits',Repeat=false,Values={25}}},{{Id='xmas_token',Repeat=true,Values={15}}},{{Id='storetickets',Repeat=true,Values={3}}},{{Id='item',Repeat=false,Values={'SALETOKEN_5',1}}},{{Id='money',Repeat=true,Values={15000}}},{{Id='credits',Repeat=false,Values={25}}},{{}},{{Id='arenatickets',Repeat=true,Values={3}}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='xp',Repeat=true,Values={5000}}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='credits',Repeat=false,Values={100}}},{{}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='credits',Repeat=false,Values={75}}},{{Id='storetickets',Repeat=true,Values={3}}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{}},{{Id='item',Repeat=false,Values={'SALETOKEN_10',1}}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='credits',Repeat=false,Values={50}}},{{}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='credits',Repeat=false,Values={50}}},{{}},{{Id='arenatickets',Repeat=true,Values={3}}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='credits',Repeat=false,Values={25}}},{{Id='xp',Repeat=true,Values={5000}}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='credits',Repeat=false,Values={25}}},{{}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='credits',Repeat=false,Values={75}}},{{}},{{Id='storetickets',Repeat=true,Values={3}}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='xp',Repeat=true,Values={5000}}},{{}},{{Id='item',Repeat=false,Values={'SALETOKEN_25',1}}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{}},{{}},{{Id='arenatickets',Repeat=true,Values={3}}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='xp',Repeat=true,Values={10000}}},{{}},{{Id='arenatickets',Repeat=true,Values={3}}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{}},{{Id='arenatickets',Repeat=true,Values={10}}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{Id='xp',Repeat=true,Values={15000}}},{{Id='credits',Repeat=false,Values={250}}},{{}},{{}},{{Id='money',Repeat=true,Values={15000}}},{{}},{{Id='item',Repeat=false,Values={'SALETOKEN_75',1}}},{{Id='xp',Repeat=true,Values={25000}}},{{Id='money',Repeat=false,Values={250000}}},{{Id='storeknife',Repeat=false,Values={1}}}}local d=function(self,...)local e,f=0,{...}return self.Description:gsub('#',function()e=e+1;return f[e]end)end;local g=function(self,...)local e,f=0,{...}return self.Name:gsub('#',function()e=e+1;return f[e]end)end;local h=function(self)return self.Icon end;function srp.gmrewards.RegisterRewardType(i,j)local k=table.Merge({Id=i,PassiveId=j.PassiveId,Unlock=j.Unlock,GetName=j.GetName||g,GetIcon=j.GetIcon||h,GetDescription=d},j)a[i]=k end;function srp.gmrewards.GetRewardType(i)return a[i]end;function srp.gmrewards.GetAll(l)return a end;function PLAYER:SetGameMasterPoints(m,n)self:SetNetVar('srp.gmrewards.points',m)if n then self:SetNetVar('srp.gmrewards.maxpoints',n)end end;function PLAYER:GetGameMasterPoints()return self:GetNetVar('srp.gmrewards.points')||0,self:GetNetVar('srp.gmrewards.maxpoints')||0 end;local o=col.ui_outline:Copy()local function p(self,q,i)local r=cosmetics.Get(i)local s=r:GetMaterial()q.PaintExtra=function(t,u,v)if s then surface.SetMaterial(s)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect((u-300)/2,(v-75)/2,300,75)end;surface.SetDrawColor(self.m_bdrColor||o)surface.DrawOutlinedRect(0,0,u,v,2)end end;srp.gmrewards.RegisterRewardType('callingcard',{Icon=Material'galactic/ui/menu/cap.png',GetName=function(self,i)return cosmetics.Get(i):GetName()..' Card'end,GetDescription=function(self,i)return cosmetics.Get(i):GetDescription()end,SetupPanel=function(self,q,i)p(self,q,i)end,Unlock=function(self,w,m,i)cosmetics.Give(w,cosmetics.Get(i).name)end})srp.gmrewards.RegisterRewardType('money',{Name='# RC',Description='Received # RC',Icon=Material('galactic/ui/menu/money-3.png','smooth noclamp'),Unlock=function(self,w,m,x)w:AddMoney(x,true)end})srp.gmrewards.RegisterRewardType('xp',{Name='# XP',Icon=Material'galactic/ui/battlepass/xp.png',Description='',Unlock=function(self,w,m,y,i)w:AddTalentXP(y,i)end})srp.gmrewards.RegisterRewardType('credits',{Name='# Credits',Icon=Material('galactic/ui/currency.png','smooth noclamp'),Description='',Unlock=function(self,w,m,y)w:AddCredits(y,'GM Reward Credits')end})srp.gmrewards.RegisterRewardType('storeknife',{Name='Store Knife',Icon=Material'galactic/ui/triumphs/melee.png',Background=col.yellow,Border=col.black,Description='',Unlock=function(self,w,m,z)srp.gmrewards.RandomKnife(w)end})local A={'SERVERTOKEN_CRAFTING','SERVERTOKEN_PACKAGE','SERVERTOKEN_PATROLS'}local B={'TOKEN_REDLIGHT','TOKEN_SPLEEF','TOKEN_MK','TOKEN_FAILSAFE','TOKEN_SAFELANDING'}local C=function(w,y)for e=1,y do local i=A[math.random(1,#A)]w:AddInventoryItem(i,1)end end;local D=function(w,y)for e=1,y do local i=B[math.random(1,#B)]w:AddInventoryItem(i,1)end end;srp.gmrewards.RegisterRewardType('storetickets',{Name='#x Store Tickets',Icon=Material'materials/galactic/ui/inventory/security.png',Background=Color(130,249,112,150),Border=Color(234,247,232,150),Description='',Unlock=function(self,w,m,E)C(w,E)end})srp.gmrewards.RegisterRewardType('item',{Name='#',Icon=Material'materials/galactic/ui/inventory/security.png',GetIcon=function(self,i,E)return srp.items.Get(i).icon end,GetName=function(self,i,E)return srp.items.Get(i).name..(E>1&&' x'..E||'')end,Background=Color(111,212,245,164),Border=Color(124,188,239,150),Description='',Unlock=function(self,w,m,i,E)w:AddInventoryItem(i,E)end})srp.gmrewards.RegisterRewardType('arenatickets',{Name='#x Arena Tickets',Icon=Material'materials/galactic/ui/inventory/security.png',Background=Color(233,112,249,125),Border=Color(255,200,224,125),Description='',Unlock=function(self,w,m,E)D(w,E)end})srp.gmrewards.RegisterRewardType('xmas_token',{Name='# Xmas Tokens',Icon=Material'materials/galactic/ui/inventory/security.png',Background=Color(248,65,77,125),Border=Color(6,144,18,125),Description='',Unlock=function(self,w,m,E)w:AddInventoryItem('TOKEN_XMAS',E,nil,true)end})hook('OnLoaderCompleted','srp.gmrewards.LoadTitles',function(i)local F=function(self,w)local m,G=w:GetGameMasterPoints()return G>=c[self.Name].Points end;for i,H in pairs(c)do srp.titles.Register(i,{CanAccess=F,Icon=b})srp.gmrewards.Rewards[H.Points]={{Id='title_'..H.Id,Repeat=false,Values={i}}}srp.gmrewards.RegisterRewardType('title_'..H.Id,{Name='#',Icon=Material'galactic/ui/battlepass/badge.png',Background=H.Background,Border=H.Border,Description='',Unlock=function()end})end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/eventrewards/ui/eventrewards_ui.lua:
local a={}local b,c=ScrW(),ScrH()local d,e,f=ScreenScale(40),ScreenScale(15),ScreenScale(20)local g=Color(255,255,255,120)local h=Color(92,144,184)local i=Color(0,0,0,100)local j=Color(0,0,0,126)local k=Material'gui/gradient_up'local l=Material'galactic/sup_starfield.png'local m={['gmrewards_title']={font='Calibri',scale=30,weight=900},['gmrewards_subtitle']={font='Calibri',scale=8,weight=200}}surface.CreateFont('gmrewards_points',{font='Calibri',size=22,weight=700})function a:Init()b,c=ScrW(),ScrH()d,e,f=ScreenScale(20),ScreenScale(15),ScreenScale(20)self:SetSize(b,c)self:DockPadding(d,e,d,f)self:Center()self:MakePopup()self:SetBackgroundColor(col.white_dark)self:SetBorderColor(col.black)self:SetAlpha(0)self:AlphaTo(255,.1)self:CreateFonts()self.Rewards={}self:AddPanel('srp_panel',function(n)local o=m.gmrewards_title.height+m.gmrewards_subtitle.height+20;n:Dock(TOP)n:SetBackgroundColor(col.transparent)n:SetTall(o)n:DockMargin(0,0,0,0)n:SetMouseInputEnabled(false)n:AddPanel('srp_label',function(p)p:Dock(TOP)p:SetFont'gmrewards_title'p:SetText'Gamemaster Rewards'p:SetTall(m.gmrewards_title.height+20)p:DockMargin(0,0,0,0)p:SetContentAlignment(1)self.Name=p end)n:AddPanel('srp_label',function(p)p:Dock(FILL)p:SetFont'gmrewards_subtitle'p:SetText'Earn points by completing events and unlock rewards!'p:SetTall(m.gmrewards_subtitle.height+20)p:SetContentAlignment(7)p:DockMargin(5,-10,0,0)p:SetTextInset(0,0)self.Description=p end)end)self:AddPanel('srp_panel',function(n)n:Dock(FILL)n:DockPadding(0,20,0,0)n:SetBackgroundColor(col.transparent)n:AddPanel('srp_eventreward_overview',function(n)n:Dock(LEFT)n:SetWide(b*.2)self.Overview=n end)n:AddPanel('ui_scrollpanel',function(q)q:Dock(FILL)srp.ui.Create('srp_grid',function(r)r:Dock(TOP)r:SetSpacing(5,5)r:SetAutoHeight(true)self.Grid=r;q:AddItem(r)end)self.Scroll=q end)end)self:AddPanel('srp_button_rounded',function(s)local t=ScreenScale(25)s:SetPos(b-t-5,5)s:SetSize(t,t)s:SetText(0xf00d,true)s:SetFont'SSRPForkAwesomeLarge's:SetTextColor(col.blue)s:SetBackgroundColor(g)s:SetHoverColor(g)s:SetBorderColor(col.transparent)s:LeftClick(function()self:Remove()end)end)end;function a:CreateFonts()for u,v in pairs(m)do v.size=ScreenScale(v.scale)surface.CreateFont(u,v)surface.SetFont(u)v.width,v.height=surface.GetTextSize('AQqyYzZRLpP')end end;function a:Populate()local w,x=LocalPlayer():GetGameMasterPoints()local y=self:GetPointHistory(w,x)self:PopulateRewardList(w,x,y)self:UpdateRewards(y)self.Overview:Populate(w,x)end;function a:GetPointHistory(w,x)if!srp.gmrewards.History then srp.gmrewards.History={Points=w,MaxPoints=x}end;srp.gmrewards.History.NextPoints=w;srp.gmrewards.History.NextMaxPoints=x;return srp.gmrewards.History end;function a:NextAnimation()if!self.AnimationLevel then return end;if self.AnimationLevel>self.AnimationTargetLevel then self.AnimationLevel=nil;self.AnimationTargetLevel=nil;self:OnRewardsClaimed()return end;local z=self.Rewards[self.AnimationLevel]if IsValid(z)then self.AnimationLevel=self.AnimationLevel+1;z:DoLevelUp(self,srp.gmrewards.History)end end;function a:UpdateRewards(y)local A=y.Points;local B=y.NextPoints;if A==B then return end;self.AnimationLevel=math.max(A,1)self.AnimationTargetLevel=math.Clamp(B+1,1,100)timer.Simple(.75,function()if IsValid(self)then self:NextAnimation()end end)end;function a:PopulateRewardList(w,x,y)for C,D in ipairs(srp.gmrewards.Rewards)do for E,F in ipairs(D)do local G=srp.gmrewards.GetRewardType(F.Id)srp.ui.Create('srp_eventreward',function(n)n:Populate(C,G,F,y)self.Grid:AddItem(n)table.insert(self.Rewards,n)end)end end;self.Scroll:GetCanvas():InvalidateLayout(true)end;function a:OnRewardsClaimed()srp.gmrewards.CompleteHistory()end;function a:OnRemove()srp.gmrewards.CompleteHistory()end;function a:Paint(t,H)draw.Box(0,0,t,H,h)surface.SetDrawColor(j)surface.SetMaterial(k)surface.DrawTexturedRect(0,0,t,H)surface.SetDrawColor(255,255,255,25)surface.SetMaterial(l)surface.DrawTexturedRect(0,0,t,H)end;vgui.Register('srp_eventrewards',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/ui/levelplate_ui.lua:
local a={}local b=80;local c=b*4;local d=col.blue:Copy()local e=col.blue:Copy()local f=Color(255,255,255,0)function a:Init()self:SetSize(c,50)self:SetPos((ScrW()-c)/2,120)self:SetBackgroundColor(d)self:SetAlpha(0)self.uy=-100;self.by=100 end;function a:Populate(g,h,i)self.name=g;self.subname=h;self:AlphaTo(255,0.5,0)if i then self.timeout=CurTime()+(i||4)end end;function a:Think()if self.timeout&&self.timeout<CurTime()then self.timeout=nil;self.outro=true;self:AlphaTo(0,0.5,0,function()if IsValid(self)then self:Remove()end end)end end;function a:Paint(j,k)if!self.name then return end;local l=math.Round(j/b,1)DisableClipping(true)local m=self:GetAlpha()e.a=250*m/255;d.a=250*m/255;f.a=m;if self.outro then self.uy=Lerp(RealFrameTime()*5,self.uy,-100)self.by=Lerp(RealFrameTime()*5,self.by,100)else self.uy=Lerp(RealFrameTime()*5,self.uy,0)self.by=Lerp(RealFrameTime()*5,self.by,0)end;for n=0,b-1 do draw.Box(n*l,n%2==0&&self.uy||self.by,l,k,n%2==0&&e||d)end;if math.Round(self.by,0)==0 then surface.SetDrawColor(100,100,100,255)surface.DrawOutlinedRect(0,0,j,k)end;local o=self.subname&&-20||-13;draw.DrawText(self.name,'ui_header.r',j/2,k/2+o,f,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)if self.subname then draw.DrawText(self.subname,'ui_header.s',j/2,k/2+o+18,f,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;DisableClipping(false)end;vgui.Register('srp_levelplate',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/friendship/ui/friendships_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/methods_sh.lua:
nw.Register'srp.gamemaster.building':Write(net.WriteBool):Read(net.ReadBool):SetLocalPlayer():SetHook('OnGamemasterBuilding')nw.Register'srp.gamemaster.building_zone':Write(net.WriteEntity):Read(net.ReadEntity):SetLocalPlayer()nw.Register'srp.hud.hidden':Write(net.WriteBool):Read(net.ReadBool):SetPlayer():SetHook('OnNameplateHidden')function PLAYER:IsNoClip()return self:GetMoveType()==MOVETYPE_NOCLIP end;function PLAYER:IsNoTarget()return self:IsFlagSet(FL_NOTARGET)end;function PLAYER:SetBuilding(a,b)self:SetNetVar('srp.gamemaster.building',a)self:SetNetVar('srp.gamemaster.building_zone',b)end;function PLAYER:IsBuilding()return self:GetNetVar('srp.gamemaster.building')end;function PLAYER:GetBuildingZone()return self:GetNetVar('srp.gamemaster.building_zone')end;function PLAYER:InBuildZone()local b=self:GetNetVar('srp.gamemaster.building_zone')if IsValid(b)then return b:InZone(self)end end;function PLAYER:SetGhosted(a)self.ghosted=a;self:DrawShadow(!a)self:DrawWorldModel(!a)self:SetRenderMode(a&&RENDERMODE_NONE||RENDERMODE_NORMAL)self:SetCollisionGroup(a&&COLLISION_GROUP_WORLD||COLLISION_GROUP_PLAYER)end;function PLAYER:ToggleGhost()self:SetGhosted(!self.ghosted)end;function PLAYER:IsGhosted()return self:GetRenderMode()==RENDERMODE_NONE end;function PLAYER:AddGMLWeapons()self:Give'weapon_physgun'self:Give'gmod_tool'end;function PLAYER:StripGMLWeapons()if!self:HasFlag'A'&&!self:IsTrialGamemaster()then self:StripWeapon'weapon_physgun'self:StripWeapon'gmod_tool'end end;hook.Add('CanRemoveGamemaster','ba.gamemaster.CanRemoveGamemaster',function(c,d,e,f)return c:IsVeteranGamemaster()end)hook.Add('CanSetGamemaster','ba.gamemaster.CanSetGamemaster',function(c,d,f)return c:IsVeteranGamemaster()&&(c:GetGamemasterID()||0)>f.internal end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/bossbars/bossbar_sh.lua:
srp.AddCommand('gmaddbossbar',function(a,b)local c=a:GetEyeTraceNoCursor().Entity;if IsValid(c)&&(c:IsNPC()||c:IsPlayer())then srp.bossbar.Add(a,c,b)end end):AddParam(cmd.STRING):SetGM():SetInfoSection('Gamemaster'):SetInfo('Adds an NPC or player you\'re aiming at as a boss bar. Uses the NPCs current health as its max health. Max 5.'):SetInfoArgs({'Name - The name to display on the boss bar'})srp.AddCommand('gmremovebossbar',function(a,b)if b then srp.bossbar.RemoveByName(a,b)return end;local c=a:GetEyeTraceNoCursor().Entity;if IsValid(c)&&(c:IsNPC()||c:IsPlayer())then srp.bossbar.Remove(a,c)end end):AddParam(cmd.STRING,cmd.OPT_OPTIONAL):SetGM():SetInfoSection('Gamemaster'):SetInfo('Removes the NPC/Player from the boss bars. If no name arg is supplied then it will remove the NPC or Player that you are currently aiming at.'):SetInfoArgs({'Name (optional) - The name to remove from the bossbar'})
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/containers/containers_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/containers/ui/container_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/domination/ui/dominationzones_ui.lua:
local a={}local b=112;local c=Color(0,0,0,150)function a:Init()self:SetTall(48)self:DockPadding(0,0,0,0)self:SetBackgroundColor(col.transparent)self.Items={}end;function a:AddItem(d)if self.Items[d]then return end;self:AddPanel('srp_capturepoint',function(e)e:Dock(LEFT)e:SetWidth(48)e:Populate(d)e:DockMargin(0,0,4,0)e.OnInfoChanged=function(f)self:Order()end;self.Items[d]=e end)self:Resize()self:Order()end;function a:RemoveItem(d)if IsValid(d)&&IsValid(self.Items[d])then self.Items[d]:Remove()self.Items[d]=nil;self:Resize()end end;function a:Order()local g=self:GetChildren()table.sort(g,function(h,i)return h:GetText():upper()<i:GetText():upper()end)for j=1,#g do g[j]:SetParent(nil)end;for j=1,#g do g[j]:SetParent(self)g[j]:Dock(LEFT)end end;function a:Resize()local k=table.Count(self.Items)*48+4*table.Count(self.Items)self:SetWide(k)self:SetPos((ScrW()-k)/2,64)end;vgui.Register('srp_dominationzones',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/eventmode/mode_sh.lua:
EVENTCHARACTERMODE=EVENTCHARACTERMODE||false;srp.gamemaster=srp.gamemaster||{}srp.gamemaster.Servers={['All']=true,['CW 1']=true,['CW 2']=true}if info.Dev then srp.gamemaster.Servers['CW Dev']=true end;function net.WriteGameMasterType(a)net.WriteUInt(a.ID,24)net.WriteString(a.Name)net.WriteColor(a.Color)net.WriteUInt(a.Points,4)net.WriteUInt(a.AssistPoints,4)net.WriteBool(a.Ratings)net.WriteBool(a.Spectators)net.WriteBool(a.Battalions)net.WriteBool(a.MinimumRank)net.WriteBool(a.Permissions)net.WriteBool(a.SubType)end;function net.ReadGameMasterType()return{ID=net.ReadUInt(24),Name=net.ReadString(),Color=net.ReadColor(),Points=net.ReadUInt(4),AssistPoints=net.ReadUInt(4),Ratings=net.ReadBool(),Spectators=net.ReadBool(),Battalions=net.ReadBool(),MinimumRank=net.ReadBool(),Permissions=net.ReadBool(),SubType=net.ReadBool()}end;function net.WriteGameMasterTypes(a)local b=table.Count(a||{})net.WriteUInt(b,24)for c,d in pairs(a)do net.WriteGameMasterType(d)end end;function net.ReadGameMasterTypes()local e={}local b=net.ReadUInt(24)for f=1,b do table.insert(e,net.ReadGameMasterType())end;return e end;function net.WriteGameMasterEvent(a)net.WriteUInt(a.id||0,24)net.WriteUInt(a.Type,24)net.WriteString(a.Name)net.WriteString(a.Description)net.WriteUInt(#a.SubTypes,5)for f=1,#a.SubTypes do net.WriteUInt(a.SubTypes[f],24)end;net.WriteBool(a.Battalions!=nil)if a.Battalions then net.WriteUInt(#a.Battalions,5)for c,g in pairs(a.Battalions)do net.WriteGroupID(g,true)end end;net.WriteBool(a.Permissions!=nil)if a.Permissions then net.WriteString(a.Permissions)end;net.WriteBool(a.Ratings!=nil)if a.Ratings then net.WriteUInt(a.Ratings,4)end;net.WriteBool(a.Assistants!=nil)if a.Assistants then net.WriteUInt(#a.Assistants,5)for c,h in pairs(a.Assistants)do net.WriteString(h)end end;net.WriteBool(a.Spectators!=nil)if a.Spectators then net.WriteUInt(#a.Spectators,5)for c,h in pairs(a.Spectators)do net.WriteString(h)end end;net.WriteBool(a.AnnounceDiscord)end;function net.ReadGameMasterEvent()local a={id=net.ReadUInt(24),Type=net.ReadUInt(24),Name=net.ReadString(),Description=net.ReadString(),SubTypes={}}local b=net.ReadUInt(5)for f=1,b do table.insert(a.SubTypes,net.ReadUInt(24))end;local i=net.ReadBool()if i then a.Battalions={}local b=net.ReadUInt(5)for f=1,b do table.insert(a.Battalions,net.ReadGroup())end end;local j=net.ReadBool()if j then a.Permissions=net.ReadString()end;local k=net.ReadBool()if k then a.Ratings=net.ReadUInt(4)end;local l=net.ReadBool()if l then a.Assistants={}local b=net.ReadUInt(5)for f=1,b do table.insert(a.Assistants,net.ReadString())end end;local m=net.ReadBool()if m then a.Spectators={}local b=net.ReadUInt(5)for f=1,b do table.insert(a.Spectators,net.ReadString())end end;a.AnnounceDiscord=net.ReadBool()return a end;srp.AddCommand('startevent',function(n)srp.gamemaster.OpenEventMenu(n)end):SetGM():AddAlias('eventstart'):SetInfoSection('Gamemaster'):SetInfo('Starts an event ticket for tracking events.')srp.AddCommand('endevent',function(n)srp.gamemaster.OpenEventMenuEnd(n)end):SetGM():AddAlias('eventend'):SetInfoSection('Gamemaster'):SetInfo('Stops an event and gives you an end event ticket.')srp.AddCommand('eventtypes',function(n)if n:IsHeadGamemaster()then srp.gamemaster.OpenTypeEditor(n)end end):AddAlias('types'):SetInfoSection('Gamemaster'):SetInfo('Type & sub-type editor for GM events.'):SetGM()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/fog/fov_cl.lua:
srp.fog=srp.fog||{}srp.fog.menu=nil;net('srp.fog.RequestControllers',function()local a=net.ReadUInt(6)local b={}for c=1,a do local d=net.ReadString()b[d]=d:Replace('fog_',''):Replace('_',' ')end;hook.Run('OnFogControllersFound',b)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/objectives/ui/objectiveoverview_ui.lua:
local a={}local b=Color(0,0,0,100)function a:Init()self:SetAlpha(0)self:SetSize(800,800)local c,d=(ScrW()-800)*.5,ScrH()self:SetPos(c,d*.4)self:MoveTo(c,d*.2,1,0,5)self:AlphaTo(255,2,0)self:SetMouseInputEnabled(false)self:AddPanel('srp_label',function(e)e:Dock(TOP)e:SetTall(64)e:SetContentAlignment(2)e:SetFont'SSRPForkAwesomeLarge'self.icon=e end)self:AddPanel('srp_label',function(e)e:SetContentAlignment(2)e:SetFont'ui_header.xl'e:SetText'Objective Name'e:Dock(TOP)e:SetTall(60)self.name=e end)self:AddPanel('srp_label',function(e)e:SetContentAlignment(8)e:SetFont'ui_header.r'e:SetText'Objective Sub text'e:Dock(TOP)e:Dock(FILL)self.description=e end)self:AlphaTo(0,1,5,function(f,g)if IsValid(g)then g:Remove()end end)end;function a:Populate(h)if h.gid!=0&&h.gid!=LocalPlayer():GetGroupID()then self:Remove()return end;local i=h.gid!=0&&LocalPlayer():GetChatColor()||color_white;self.name:SetText(h.name:upper())self.name:SetTextColor(i)self.description:SetText(h.description)self.icon:SetText(h.status.icon,true)self.icon:SetTextColor(h.status.color||color_white)end;function a:Paint()end;vgui.Register('srp_objectiveoverview',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/ui/recipeitems_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/group_cl.lua:
srp.groups=srp.groups||{}srp.groups.logurl='ssrp/'..info.WebID..'/grouplogs/'srp.groups.apiUrl='ssrp/'..info.WebID..'/groupinfo/'srp.groups.GroupTags={attack={Name='Attack',Icon=Material('materials/galactic/ui/triumphs/attack.png','smooth noclamp')},breach={Name='Breach',Icon=Material('materials/galactic/ui/talents/wepsprint.png','smooth noclamp')},eod={Name='EOD',Icon=Material('materials/galactic/ui/triumphs/dynamite.png','smooth noclamp')},explosive={Name='Demolitions',Icon=Material('materials/galactic/ui/triumphs/explosion.png','smooth noclamp')},shield={Name='Defensive',Icon=Material('materials/galactic/ui/hud/armor.png','smooth noclamp')},roaming={Name='Roaming',Icon=Material('materials/galactic/ui/triumphs/patrol.png','smooth noclamp')},cuffs={Name='Law Enforcement',Icon=Material('materials/galactic/ui/hud/cuff.png','smooth noclamp')},jetpack={Name='Jetpacks',Icon=Material('materials/galactic/ui/talents/jetpack.png','smooth noclamp')},stealth={Name='Cloaking',Icon=Material('materials/galactic/ui/inventory/cloaking.png','smooth noclamp')},at={Name='Anti-Vehicle',Icon=Material('materials/galactic/ui/talents/missile.png','smooth noclamp')},gl={Name='Grenade Launcher',Icon=Material('materials/galactic/ui/inventory/grenadelauncher.png','smooth noclamp')},repairs={Name='Engineering',Icon=Material('materials/galactic/ui/triumphs/crafting.png','noclamp')},tank={Name='Heavy Armour',Icon=Material('materials/galactic/ui/talents/tank.png','noclamp')},ships={Name='Aircraft',Icon=Material('materials/galactic/ui/triumphs/ship.png','noclamp')},building={Name='Building',Icon=Material('materials/galactic/ui/triumphs/building.png','noclamp')},boarding={Name='Boarding',Icon=Material('materials/galactic/ui/menu/talentlevel.png','noclamp')},interrogation={Name='Interrogation',Icon=Material('materials/galactic/ui/hud/wanted.png','noclamp')},planetary={Name='Planetary Assault',Icon=Material('materials/galactic/ui/triumphs/offworld.png','noclamp')},diplomacy={Name='Diplomacy',Icon=Material('materials/galactic/ui/talents/creditsonkill.png','smooth noclamp')},siege={Name='Siege Support',Icon=Material('materials/galactic/ui/triumphs/combat.png','smooth noclamp')},negotiations={Name='Hostage Negotiations',Icon=Material('materials/galactic/ui/triumphs/teacher.png','smooth noclamp')},xenology={Name='Xenology',Icon=Material('materials/galactic/ui/menu/monkey.png','smooth noclamp')}}local a=cvar.Register'group_agendahistory'a:SetDefault(0)local b;function srp.groups.LoadGroupFromHTTP(c,d)local e=c.id;local f=c:GetParent(true)ba.http.FetchJson(srp.groups.apiUrl..e..'/'..f.id,function(g)if!g.players then c:SetLoaded(false)d(true)hook.Run('OnGroupRosterFailed',c)return end;c:AddCharacters(g.players)if g.info then c:SetAgenda(g.info.agenda)c:LoadTags(g.info.tags)c:SetDiscord(g.info.discord)c:LoadBlacklist(g.info.blacklist)c:SetMoney(g.info.money||0)c:SetUpgrades(g.info.upgrades)end;c:SetLoaded(true)d(true,g)hook.Run('OnGroupCharactersUpdated',c)end,function()d(false)hook.Run('OnGroupRosterFailed',c)end)end;function srp.groups.GetWebhooks()net.Start'srp.groups.GetWebhooks'net.SendToServer()end;function srp.groups.GetSettings(c)net.Start'srp.groups.GetSettings'net.WriteGroup(c)net.SendToServer()end;function srp.groups.GetRecruitment()net.Start'srp.groups.GetRecruitment'net.SendToServer()end;net('srp.groups.GetRecruitment',function()local h={}while true do local e=net.ReadUInt(5)if e==0 then break end;local c=srp.groups.Get(e,true)if!c then continue end;local i=net.ReadBool()local j=net.ReadString()local k=net.ReadBool()local l;if k then l=net.ReadEntity()end;h[c.id]={Open=i,Tryout=k,TryoutEntity=l,Message=j}end;hook.Run('OnGroupRecruitmentSynced',h)end)function srp.groups.OpenTrainingMenu(m)if IsValid(srp.groups.TrainingMenu)then srp.groups.TrainingMenu:Remove()end;srp.ui.Create('srp_group_recruitment',function(n)srp.groups.TrainingMenu=n end)end;net('srp.groups.Upgrade',function()local c=net.ReadGroup()local o=net.ReadUInt(4)local p=net.ReadUInt(6)local q=srp.groups.GetUpgrade(o,true)if q then hook.Run('OnGroupUpgraded',c,q,p)end end)net('srp.groups.SetLOA',function()local c=net.ReadGroup()local cid=net.ReadUInt(32)local r=net.ReadBool()local s=c:IsInGroup(cid)if s then s.loa=r;hook.Run('OnGroupCharacterLOA',c,cid,r)end end)net('srp.groups.SendBlacklist',function()local c=net.ReadGroup()local t=net.ReadString()local u=net.ReadString()local v=net.ReadString()c:AddBlacklist({blacklister=t,blacklisted=u,reason=v,time=os.time()})hook.Run('OnGroupBlacklistUpated',c,t,u,v,time)end)net('srp.groups.RemoveBlacklist',function()local c=net.ReadGroup()local t=net.ReadString()local u=net.ReadString()c:RemoveBlacklist(u)hook.Run('OnGroupBlacklistUpated',c,t,u)end)net('srp.groups.UpdateMoney',function(w)local c,x=net.ReadGroup(),net.ReadUInt(32)c:SetMoney(x)hook.Run('OnGroupMoneyUpdated',c,x)end)net('srp.groups.PlayerJoined',function(w)local m=net.ReadPlayer()local c=net.ReadGroup()local y=net.ReadGroupRank()if c&&y then c:AddCharacter(m:CharacterID(),y.id,{name=m:Nick(),steamid=m:SteamID()})hook.Run('OnPlayerJoinedGroup',m,c,y)end end)net('srp.groups.PlayerLeft',function(w)local z=net.ReadUInt(32)local c=net.ReadGroupRank()if c then c:RemoveCharacter(z)hook.Run('OnPlayerLeftGroup',z,c)end end)net('srp.groups.PlayerChangedRank',function(w)local z=net.ReadUInt(32)local c=net.ReadGroup()local y=net.ReadGroupRank()if c&&y then c:AddCharacter(z,y.id)hook.Run('OnPlayerRankChanged',z,y)end end)net('srp.groups.SetPlayerClass',function(w)local z=net.ReadUInt(32)local c=net.ReadGroup()local A=net.ReadGroupRank()if c&&A then local B=c:GetCharacterClass(cid)if B then B:RemoveCharacter(cid)else c:SetClass(z,A.id)end;hook.Run('OnPlayerClassChanged',z,A,B)end end)net('srp.groups.SetPlayerLoreName',function(w)local z=net.ReadUInt(32)local c=net.ReadGroup()local C=net.ReadGroupRank()if c&&C then local D=c:GetCharacterLoreName(cid)if D then D:RemoveCharacter(cid)else c:SetLoreName(z,C.id)end;hook.Run('OnPlayerLoreNameChanged',z,C,D)end end)net('srp.groups.RemovePlayerLoreName',function(w)local z=net.ReadUInt(32)local c=net.ReadGroup()if c then c:RemoveCharacterLoreName(z)hook.Run('OnPlayerLeaveLoreName',z)end end)net('srp.groups.RemovePlayerClass',function(w)local z=net.ReadUInt(32)local c=net.ReadGroup()if c then c:RemoveCharacterClass(z)hook.Run('OnPlayerLeaveClass',z)end end)net('srp.groups.AgendaChanged',function()local c=net.ReadGroup()local E=net.ReadString()local F=net.ReadBool()if c then if F then local G=util.CRC(E)local H=a:GetMetadata(c.id)||0;a:AddMetadata(c.id,G)a:Save()if G!=H then chat.AddText(c.color,Format('%s\'s private agenda has been updated!',c:GetName()))end;c:SetPrivateAgenda(E)else c:SetAgenda(E)chat.AddText(c.color,Format('%s\'s public agenda has been updated!',c:GetName()))end;hook.Run('OnAgendaUpdated',c,E,F)end end)net('srp.groups.Invite',function()if IsValid(b)then b:Remove()end;srp.ui.Create('srp_groupinvite',function(n)n:Populate()b=n end)end)net('srp.groups.SendNote',function()hook.Run('OnPlayerNoteLoaded',net.ReadUInt(32),net.ReadString())end)net('srp.groups.AddTag',function()local c=net.ReadGroup()local e=net.ReadUInt(16)local I=net.ReadString()local J=net.ReadColor()c:AddTag(e,I,J)hook.Run('OnGroupTagAdded',c,e,I,J)end)net('srp.groups.RemoveTag',function()local c=net.ReadGroup()local e=net.ReadUInt(16)c:RemoveTag(e)hook.Run('OnGroupTagRemoved',c,e)end)net('srp.groups.AddCharacterTag',function()local c=net.ReadGroup()local K=net.ReadUInt(32)local L=net.ReadUInt(16)local s=c:IsInGroup(K)if s&&s.tags then table.insert(s.tags,L)end;hook.Run('OnGroupCharacterAddTag',c,K,L)end)net('srp.groups.RemoveCharacterTag',function()local c=net.ReadGroup()local K=net.ReadUInt(32)local L=net.ReadUInt(16)local s=c:IsInGroup(K)if s&&s.tags then table.RemoveByValue(s.tags,L)end;hook.Run('OnGroupCharacterRemoveTag',c,K,L)end)net('srp.groups.GetWebhooks',function()local M={}local N=net.ReadUInt(4)for O=1,N do local P=net.ReadString()local Q=net.ReadString()local R=net.ReadUInt(28)M[Q]={url=Q,identifier=P,mask=R,settings=net.ReadBool()&&net.ReadTable()||nil}end;hook.Run('OnGroupWebhooksReceived',M)end)function srp.groups.SetSettings(h)net.Start'srp.groups.SetSettings'net.WriteUInt(table.Count(h),5)for S,T in pairs(h)do net.WriteString(S)local U=srp.groups.GetSettingConfig(S)if U then U:Write(T)end end;net.SendToServer()end;net('srp.groups.GetSettings',function()local c=net.ReadGroup()local V={}for O=1,net.ReadUInt(5)do local S=net.ReadString()local U=srp.groups.GetSettingConfig(S)if U then V[S]=U:Read()end end;c:SetSettings(V)hook.Run('OnGroupSettingsUpdated',c,V)end)net('srp.groups.SetWebhook',function()hook.Run('OnGroupWebhookSet',net.ReadString(),net.ReadString(),net.ReadUInt(28),net.ReadBool()&&net.ReadTable()||nil)end)net('srp.groups.ClearWebhook',function()hook.Run('OnGroupWebhookRemoved',net.ReadString())end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ranks_sh.lua:
srp.granks={}nw.Register'srp.groups.rid':Write(net.WriteUInt,10):Read(net.ReadUInt,10):SetPlayer():SetHook'OnPlayerGroupRankChanged'nw.Register'srp.groups.cid':Write(net.WriteUInt,10):Read(net.ReadUInt,10):SetPlayer():SetHook'OnPlayerGroupClassChanged'nw.Register'srp.groups.lid':Write(net.WriteUInt,10):Read(net.ReadUInt,10):SetPlayer():SetHook'OnPlayerGroupLoreNameChanged'local a={}a.__index=a;function a:Init()self.color=Color(255,255,255)self.desc=nil;self.model=nil;self.vip=false;self.permissions=0;self.metainfo={}self.classes={}self.noutility=false;self.characters={}self.temprank=false;self.PlayerLoaded=function()end;self.PlayerUnloaded=function()end end;function a:SetSteamID(b)self.steamid=b;if self.model then util.AddBlacklistModel(self.model,b)end;return self end;function a:HasSteamID(c)if!self.steamid then return true elseif!IsValid(c)then return false else return self.steamid==c:SteamID()end end;function a:SetUpgrade(d)self.upgrade=d;return self end;function a:HasUpgrade(c)if!self.upgrade then return true end;if!IsValid(c)then return false end;if istable(self.upgrade)then for e,d in ipairs(self.upgrade)do if c:HasUpgrade(d)then return true end end else return c:HasUpgrade(self.upgrade)end end;function a:SetIcon(f)self.icon=f;return self end;function a:GetIcon()return self.icon end;function a:Clear()self.characters={}end;function a:SetGroup(g)self.group=g;self.groupid=g.id;return self end;function a:GetGroup()return self.group end;function a:SetName(h,i)self.name=h;if i then self:SetCharacterName(h)end;return self end;function a:GetName()return self.name end;function a:SetCharacterName(j)self.character_name=j;return self end;function a:GetCharacterName()return self.character_name end;function a:SetDescription(j)self.desc=j;return self end;function a:GetDescription()return self.desc end;function a:SetTag(j,k)self.tag=j;self.displayrank=k;return self end;function a:GetTag()return self.tag end;function a:ShouldDisplayRank()return self.displayrank end;function a:SetColor(l)self.color=l;return self end;function a:GetColor()return self.color end;function a:SetClass(k)self.is_class=k;self.maxcharacters=k&&1||self.maxcharacters;return self end;function a:IsClass()return self.is_class end;function a:GetModel()if istable(self.model)then local m=self.model[self.groupid]||self.model.default;if istable(m)then return m[1],m[2],m[3]else return m end elseif self.model then return self.model,self.bodygroups elseif!self:IsClass()then local n=self.group&&self.group:GetMeta('mode_id')||self.groupid:lower()local o=self:GetMeta('model_category')||'trooper'if istable(o)then return srp.groups.modelpath..n..'/'..(o[self.groupid]||o.default||'trooper')..'.mdl'else return srp.groups.modelpath..n..'/'..o..'.mdl'end end end;function a:SetModel(p)self.model=p;return self end;function a:GetBodyGroups()local e,q=self:GetModel()return q||self.bodygroups end;function a:SetBodyGroups(q)self.bodygroups=q;return self end;function a:GetSkin()local e,e,r=self:GetModel()return r||self.skin end;function a:SetSkin(n)self.skin=n;return self end;function a:SetVIP(k)self.vip=k==nil&&true||k;return self end;function a:IsVIP()return self.vip end;function a:SetLoadout(s,t,u)self.loadout=s;self.loadoutonly=t;self.noutility=u;return self end;function a:SetUtility(s)self.utility=s;return self end;function a:GetUtility()return self.utility end;function a:GetLoadout()return self.loadout end;function a:SetMeta(v,w)self.metainfo[v]=w;return self end;function a:GetMeta(v)return self.metainfo[v]end;function a:SetStat(v,w)self.metainfo[v]=w;return self end;function a:GetStat(v,x)local y=self.metainfo[v]if istable(y)then return self.groupid&&y[self.groupid]||y.default||x else return y||x end end;function a:SetHidden(k)self.hidden=k==nil&&true||k;return self end;function a:GetHidden()return self.hidden end;function a:SetPriority(z)self.priority=z;return self end;function a:GetPriority()return self.priority end;function a:HasPriority(A)return A:GetPriority()>self:GetPriority()end;function a:SetPermissions(...)for e,w in ipairs({...})do self.permissions=bit.bor(self.permissions,w)end;return self end;function a:GetPermissions()return self.permissions end;function a:AddPermissions(n)if!self:HasPermission(n)then self.permissions=bit.bor(self.permissions,srp.permissions[n])end;return self end;function a:HasPermission(n)local B=srp.permissions[n]return B&&bit.band(self.permissions,B)==B end;function a:SetStats(C)self.stats=C;return self end;function a:RunStats(c)if self.stats then self.stats(self,c)end end;function a:IsInGroup(n)return self.characters[n]!=nil end;function a:AddCharacter(D,m)self.characters[D]=m||{}return self end;function a:RemoveCharacter(D)self.characters[D]=nil;return self end;function a:GetCharacters()return self.characters end;function a:SetMaxCharacters(z)self.maxcharacters=z;return self end;function a:SetLinkedCharacterSlots(n)local A=srp.granks.Get(n)if A then A.linkedmaxcharacters=self.id;self.linkedmaxcharacters=n end;return self end;function a:GetMaxCharacters()if istable(self.maxcharacters)then return self.maxcharacters[self.group.id]||self.maxcharacters.default||1 else return self.maxcharacters end end;function a:OnPlayerLoaded(E)self.PlayerLoaded=E end;function a:OnPlayerUnloaded(E)self.PlayerUnloaded=E end;function a:GetCharacterCount(F)if!F&&self.linkedmaxcharacters then local G=self.group:GetClass(self.linkedmaxcharacters)if!G then return table.Count(self.characters||{})else return table.Count(G.characters||{})+table.Count(self.characters||{})end else return table.Count(self.characters||{})end end;function a:IsFull()local H=self:GetMaxCharacters()if!H then return false else return self:GetCharacterCount()>=H end end;local I={}local J={}local K={}local L={}function srp.granks.Create(n,M)local N={internal=-1,id=n}setmetatable(N,a)N:Init()N:SetName(n)N:SetClass(M)N.internal=table.insert(J,N)N:SetPriority(N.internal)I[n]=N;return N end;function srp.granks.Get(n,O)return O&&J[n]||I[n]end;function srp.granks.GetAll(P)return P&&J||I end;function srp.granks.GetByName(h)for e,Q in pairs(I)do if Q&&string.lower(Q.name)==string.lower(h)then return Q end end end;function srp.granks.CreateGroup(n,I)I.internal=table.insert(K,I)K[n]=I;L[I.internal]=I end;function srp.granks.GetGroup(n,O)return O&&L[n]||K[n]end;function PLAYER:HasPermission(n,g)g=g||self:GetGroup()if!g then return false end;if g:HasPermission(n)then return true end;local A=self:GetGroupRank(g)if A&&A:HasPermission(n)then return true end;local R=self:GetGroupClass(g)if R&&R:HasPermission(n)then return true end;local S=self:GetGroupLoreName(g)if S&&S:HasPermission(n)then return true end;return false end;function PLAYER:GetGroupRank(g)g=g||self:GetGroup()if!g then return end;local n=self:GetNetVar'srp.groups.rid'if n then return g:GetRank(n,true)end end;function PLAYER:GetGroupClass(g)g=g||self:GetGroup()if!g then return end;local n=self:GetNetVar'srp.groups.cid'if n then return g:GetClass(n,true)end end;function PLAYER:GetGroupLoreName(g)g=g||self:GetGroup()if!g then return end;local n=self:GetNetVar'srp.groups.lid'if n then return g:GetLoreName(n,true)end end;function PLAYER:GetGroupRankID()return self:GetNetVar('srp.groups.rid')end;function PLAYER:GetGroupClassID()return self:GetNetVar('srp.groups.cid')end;function PLAYER:GetGroupLoreNameID()return self:GetNetVar('srp.groups.lid')end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupcharacter_ui.lua:
local a={}local b=604800;local c=b*2;local d=col.midnight_dark:Copy()function a:Init()self:DockMargin(0,0,0,0)self:DockPadding(6,0,0,0)self:SetBackgroundColor(d)self:AddPanel('srp_label',function(e)e:SetText'Unknown'e:Dock(LEFT)e:SetContentAlignment(4)e:SetTextColor(col.white_dark)e:SetWide(250)self.name=e end)self:AddPanel('srp_panel',function(f)f:SetBackgroundColor(col.transparent)f:SetWide(160)f:Dock(RIGHT)f:SetVisible(false)f:AddPanel('srp_label',function(e)e:SetFont'SSRPForkAwesome'e:SetText(0xf06e,true)e:SetWide(22)e:DockPadding(0,0,0,0)e:SetTextColor(col.white_dark)e:SetContentAlignment(4)e:Dock(LEFT)self.eyeicon=e end)f:AddPanel('srp_label',function(e)e:SetText'0 minutes ago'e:Dock(FILL)e:DockPadding(0,0,0,0)e:DockMargin(0,0,0,0)e:SetTextColor(col.white_dark)e:SetContentAlignment(4)self.lastseen=e end)self.seenlabel=f end)self:AddPanel('srp_button',function(g)g:SetSize(22,40)g:SetFont'SSRPForkAwesome'g:SetText(0xf02c,true)g:SetTextColor(col.white_dark)g:SetBackgroundColor(col.transparent)g:SetHoverColor(col.transparent)g:SetBorderColor(col.transparent)g:SetVisible(false)g:LeftClick(function(h)local i=self.group.tags;if!i then return end;if IsValid(self.menu)then self.menu:Remove()end;self.menu=DermaMenu(false)self.menu:SetSkin'SRP_SUP'for j,k in pairs(i)do local l=self.menu:AddOption(k.name,function()if self.character&&k.id then cmd.Run('gaddchartag',self.group.id,self.character.characterid,k.id)end end)l:SetTextColor(k.color)end;local m,n=g:LocalToScreen(0,g:GetTall())self.menu:Open(m,n,false,g)end)self.settags=g end)self:AddPanel('srp_button',function(g)g:SetSize(22,40)g:SetFont'SSRPForkAwesome'g:SetText(0xf2c3,true)g:SetTextColor(col.white_dark)g:SetBackgroundColor(col.transparent)g:SetHoverColor(col.transparent)g:SetBorderColor(col.transparent)g:LeftClick(function(h)if self.character&&self.controller then self.controller:ShowCharacter(self.group,self.character)end end)self.view=g end)hook('OnGroupCharacterAddTag',self,function(f,o,p,q)if IsValid(self.tags)&&o.id==self.group.id&&p==self.character.characterid&&self.group.tags[q]then srp.ui.Create('srp_grouptaglabel',function(f)f:Populate(self.group.tags[q],self.group.id,self.character.characterid)self.tags:AddItem(f)end)end end)hook('OnGroupCharacterLOA',self,function(f,o,p,state)if IsValid(self.tags)&&o.id==self.group.id&&p==self.character.characterid then self:SetAway(state)end end)end;function a:SetAway(r)if state then srp.ui.Create('srp_grouptaglabel',function(f)f:Populate({id='loa',name='LOA',color=Color(200,200,200)},self.group.id,self.character.characterid)self.tags:AddItem(f)self.Away=f end)elseif IsValid(self.Away)then self.Away:Remove()end end;function a:OnRemove()hook.Remove('OnGroupCharacterLOA',self)hook.Remove('OnGroupCharacterAddTag',self)end;function a:Setup(s,o,t)self.group=o;self.character=t;self.controller=s;if!t.name then return end;local u=isnumber(t.lastseen)&&t.lastseen||string.ToTime(t.lastseen)||0;local v=os.time()-u;if v>=c then self.settags:SetTextColor(col.red_dark)self.view:SetTextColor(col.red_dark)self.eyeicon:SetTextColor(col.red_dark)self.name:SetTextColor(col.red_dark)self.lastseen:SetTextColor(col.red_dark)elseif v>=b then self.settags:SetTextColor(col.orange)self.view:SetTextColor(col.orange)self.eyeicon:SetTextColor(col.orange)self.name:SetTextColor(col.orange)self.lastseen:SetTextColor(col.orange)end;self.name:SetText(t.name)self.lastseen:SetText(string.NiceTime(v)..' ago')self:SetAway(t.loa==true||t.loa=='1')local w=self:GetWide()self.view:SetPos(w-30,1)if w>250 then self.settags:SetPos(w-54,1)self.settags:SetVisible(true)self.seenlabel:SetVisible(true)self:AddPanel('srp_grid',function(x)x:SetPos(w-800,2)x:SetWide(600)x:SetAutoHeight(true)for j,y in pairs(t.tags)do local k=self.group.tags[y]if!k then continue end;srp.ui.Create('srp_grouptaglabel',function(f)f:Populate(k,o.id,t.characterid)x:AddItem(f)end)end;self.tags=x end)end end;vgui.Register('srp_groupcharacter',a,'srp_panel')local a={}function a:Init()self:DockPadding(0,0,0,0)self:DockMargin(0,0,1,0)self:SetContentAlignment(4)self:SetBackgroundColor(col.grey_light)self:SetSize(140,16)self:AddPanel('srp_labelawesome',function(e)e:Dock(FILL)e:SetIcon(0xf02b,true)e:SetIconColor(col.white_dark)e:SetContentAlignment(4)e:SetTextColor(col.white_dark)self.name=e end)self:AddPanel('srp_button',function(g)g:Dock(RIGHT)g:SetBorderColor(col.transparent)g:SetBackgroundColor(col.transparent)g:SetHoverColor(col.transparent)g:SetTextColor(col.white_dark)g:SetFont'ui_button_close'g:SetText(0xf00d,true)g:SetWide(16)g:DockMargin(1,1,1,1)g:LeftClick(function()if self.groupid&&self.tag then cmd.Run('gremovechartag',self.groupid,self.characterid,self.tag.id)end end)self.remove=g end)hook('OnGroupCharacterRemoveTag',self,function(f,o,p,q)if o.id==self.groupid&&p==self.characterid&&self.tag.id==q then f:Remove()end end)end;function a:SetText(z)self.name:SetText(z)end;function a:Populate(k,A,B)self.tag=k;self.groupid=A;self.characterid=B;local C=k.color:Copy()C.a=150;local D=k.color:InverseLight(col.white,true)self:SetBackgroundColor(C)self.name:SetTextColor(D)self:SetText(k.name)end;function a:OnRemove()hook.Remove('OnGroupCharacterRemoveTag',self)end;vgui.Register('srp_grouptaglabel',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupnote_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/webhooks/webhooklist_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hangars/hangar_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hangars/ui/hangar_ui.lua:
local a={}local b=Vector()local c=Angle()local d=col.midnight:Copy()local a={}function a:Init()self.selected=1;self:SetBackgroundColor(d)self:SetBorderColor(col.grey_dark)self:DockPadding(1,1,1,1)self:DockMargin(0,0,0,0)self.OldEntities={}self:AddPanel('srp_panel',function(e)e:Dock(FILL)e:SetBackgroundColor(col.transparent)e:AddPanel('srp_modelpanel',function(f)f:Dock(FILL)f:SetFOV(40)self.mdl=f end)self.mdlcontainer=e end)self:AddPanel('srp_panel',function(e)e:Dock(BOTTOM)e:SetTall(25)e:SetBackgroundColor(col.transparent)e:DockPadding(1,1,1,1)e:DockMargin(0,0,0,0)e:AddPanel('srp_button',function(g)g:Dock(FILL)g:DockPadding(5,0,0,0)g:DockMargin(0,0,0,0)g:SetHoverColor(col.green)g:SetBackgroundColor(col.green_dark)g:SetBorderColor(col.transparent)g:SetContentAlignment(4)g:LeftClick(function()if!self.reserved&&self.hid then net.Start'srp.hangar.RequestVehicle'net.WriteString(self.hid)net.WriteShort(self.id)net.WriteShort(self.selected)net.SendToServer()self:GetParent():Remove()end end)self.name=g end)e:AddPanel('srp_button',function(g)g:Dock(RIGHT)g:SetWide(30)g:SetText'>'g:SetHoverColor(col.transparent)g:SetBackgroundColor(col.transparent)g:SetBorderColor(col.transparent)g:DockPadding(0,0,0,0)g:DockMargin(0,0,0,0)g:LeftClick(function()self:Next()end)self.next=g end)self.namecontainer=e end)end;function a:SetSpawn(h,i)self.hid=h;self.id=i;self.hangar=srp.hangar.spawns[self.hid]self.selected=1;self:Display()end;function a:Next()self.selected=self.selected+1>#self.hangar.vehicles&&1||self.selected+1;self:Display()end;function a:Display()local j=self.hangar.hangars[self.id]local k=IsValid(j.vehicle)local l=k&&self.hangar.vehicles[j.vehicle.vehicle_id]||self.hangar.vehicles[self.selected]self.name:SetText(l.name)self.reserved=k;if k then self.mdlcontainer:SetBorderColor(col.red)self.namecontainer:SetBackgroundColor(col.red_dark)self.name:SetHoverColor(col.transparent)self.name:SetBackgroundColor(col.transparent)self.next:SetVisible(false)else self.name:SetHoverColor(col.green)self.name:SetBackgroundColor(col.transparent)self.mdlcontainer:SetBorderColor(col.green)self.namecontainer:SetBackgroundColor(col.green_dark)self.next:SetVisible(true)end;self:DisplayModel()end;function a:SpawnAttachments(m)if!m then return end;for n,o in pairs(m)do local f=o.model||o.mdl;if!f then continue end;local p=ClientsideModel(f)p:SetMoveType(MOVETYPE_NONE)p:SetParent(self.preview)p:SetLocalPos(o.pos)p:Spawn()table.insert(self.OldEntities,p)if IsValid(self.pnlent)then local p=self.mdl:AddModel(f)p:SetMoveType(MOVETYPE_NONE)p:SetParent(self.pnlent)p:SetLocalPos(o.pos)p:SetLocalAngles(Angle())p:Spawn()table.insert(self.OldEntities,p)end end end;function a:RemoveAttachments()for n,p in ipairs(self.OldEntities)do if IsValid(p)then p:Remove()end end end;function a:DisplayModel()local j=self.hangar.hangars[self.id]local k=j&&IsValid(j.vehicle)local l=k&&self.hangar.vehicles[j.vehicle.vehicle_id]||self.hangar.vehicles[self.selected]local q=l.simfphys&&list.Get('simfphys_vehicles')[l.class]||scripted_ents.Get(l.class)if!q then return end;local r=q.MDL||q.EntModel||q.Model||q.model;local s=l.previewPos||Vector()local t=l.previewAng||Angle()s=s+Vector(300,-80,20)self:RemoveAttachments()if IsValid(self.pnlent)then self.pnlent:SetModel(r)self.pnlent:SetPos(s)self.pnlent:SetAngles(t)else self.pnlent=self.mdl:AddModel(r,s,t)end;self.preview=IsValid(self.preview)&&self.preview||ClientsideModel('models/error.mdl')if IsValid(self.preview)then self.preview:SetModel(r)self.preview:SetPos(j.pos+(q.LVS&&Vector(0,0,70)||Vector()))self.preview:SetAngles(j.ang)self.preview:Spawn()self:SpawnAttachments(q.Wheels)self:SpawnAttachments({q.TopRotor,q.TopRotor2,q.BackRotor})end end;function a:OnRemove()if IsValid(self.preview)then self.preview:Remove()self:RemoveAttachments()end end;vgui.Register('srp_hangar_vehicles',a,'srp_panel')local a={}function a:Init()self:SetSize(150,200)self:SetPos(0,(ScrH()-200)*.5)self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self:MakePopup(true)EnableThirdPerson(false)self.camPos=LocalPlayer():EyePos()self.camAng=LocalPlayer():EyeAngles()self.camTargetPos=self.camPos;self.camTargetAng=self.camAng;self:AddPanel('srp_panel',function(e)e:Dock(TOP)e:SetTall(25)e:DockPadding(0,0,0,0)e:DockMargin(0,0,0,0)e:SetBackgroundColor(col.grey)e:AddPanel('srp_button',function(g)g:Dock(LEFT)g:SetWide(30)g:SetText'X'g:SetBackgroundColor(col.red)g:SetBorderColor(col.transparent)g:SetHoverColor(col.red_dark)g:DockPadding(0,0,0,0)g:DockMargin(0,0,0,0)g:LeftClick(function()self:Remove()end)end)e:AddPanel('srp_label',function(u)u:Dock(FILL)u:SetText'Hangar Z'u:DockPadding(0,0,0,0)u:DockMargin(0,0,0,0)u:SetContentAlignment(5)self.title=u end)e:AddPanel('srp_button',function(g)g:Dock(RIGHT)g:SetWide(30)g:SetText'>'g:SetHoverColor(col.blue_dark)g:SetBorderColor(col.transparent)g:SetBackgroundColor(col.blue)g:DockPadding(0,0,0,0)g:DockMargin(0,0,0,0)g:LeftClick(function()self:Next()end)end)end)end;function a:PreviewHangar(v,w,x,y,z,A)self.camPos=LerpVector(1.5*FrameTime(),self.camPos,self.camTargetPos)self.camAng=LerpAngle(2*FrameTime(),self.camAng,self.camTargetAng)return{origin=self.camPos,angles=self.camAng,znear=50}end;function a:Populate(h)self.hid=h;self.spawns=srp.hangar.spawns[h]self.selected=1;self.camTargetPos=self.spawns.hangars[1].camdata.pos;self.camTargetAng=self.spawns.hangars[1].camdata.ang;self:Display()hook('CalcView',self,self.PreviewHangar)end;function a:Next()self.selected=self.selected+1>#self.spawns.hangars&&1||self.selected+1;self:Display()end;function a:Display()local j=srp.hangar.spawns[self.hid].hangars[self.selected]if!j then return end;self.camTargetPos=j.camdata.pos;self.camTargetAng=j.camdata.ang;self.title:SetText(j.display.name)self:VehiclePreview()end;function a:VehiclePreview()if IsValid(self.preview)then self.preview:Remove()end;self:AddPanel('srp_hangar_vehicles',function(e)e:Dock(FILL)e:SetSpawn(self.hid,self.selected)self.preview=e end)end;function a:OnRemove()EnableThirdPerson(true)hook.Remove('CalcView',self)end;vgui.Register('srp_hangar',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/camera_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/compass_cl.lua:
srp.hud=srp.hud||{}local a=math.floor;local b=surface.SetMaterial;local c=surface.SetDrawColor;local d=surface.DrawTexturedRectUV;local e=surface.DrawTexturedRect;local f=math.min;local g=draw.DrawText;local h=math.abs;local Format,ScrW,ScrH=Format,ScrW,ScrH;local i=Material('materials/galactic/ui/compass.png','noclamp')local j,k,l=Color(255,255,255,255),1516,36;local m=Color(255,255,255,0)local n=32000;local o,p=0,0;local q,r=400,30;local s={}function srp.hud.RegisterMarker(t,u)s[t]={icon=u.icon,data=u,distance=u.distance&&u.distance^2||nil,pos=isvector(u.pos)&&u.pos||nil,GetPos=isfunction(u.pos)&&u.pos||nil}end;function srp.hud.RemoveMarker(t)s[t]=nil end;function srp.hud.DrawCompass(v,w,x,y,z,A,B)local C=z:EyePos()local D=z:EyeAngles()o,p=h(D.y-180),h(D.p)local E=o/360;A=A||j;c(A)b(i)render.SetScissorRect((ScrW()-q)/2,0,(ScrW()+q)/2,ScrH(),true)d(-(k/2)+v,w,k,l,E,0,1+E,1)draw.Box(v-1,w+20,2,10,A)if!B then g(Format('[%03i]',o),'ui_header.xs',v-188,w-5,A,TEXT_ALIGN_CENTER)g(Format('%s %02i',D.p>0&&'▼'||'▲',p),'ui_header.xs',v-160,w-5,A,TEXT_ALIGN_CENTER)end;for F,G in pairs(s)do local H=G.GetPos&&G:GetPos()||G.pos;if!H then continue end;local I=C:DistToSqr(H)if G.distance&&I>G.distance then continue end;local J=string.GetMetres(math.sqrt(I))local K,L=WorldToLocal(C,D,C,(H-C):Angle())local M=-L.y/180;local I=f(1,H:DistToSqr(C)/n)local j=G.data.color||m;j.a=255*I;local N=v-k/2*M;c(j)b(G.icon)e(N-6,w-6,24,24)draw.SimpleText(J..'m','ui_label.s',N+4,w-12,j,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;render.SetScissorRect(0,0,0,0,false)end;function PLAYER:GetHeading()return o,p end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/hitmarker_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/emotes/emote_cl.lua:
srp.emotes=srp.emotes||{}local a=nil;local b=nil;local c=Color(10,10,10,150)local d=col.midnight;local e,f=190,384;local g=col.green:Copy()g.a=200;local h=col.blue:Copy()h.a=200;local i=col.red:Copy()i.a=200;local j=col.pink:Copy()j.a=200;local k=col.orange:Copy()k.a=200;local l=col.yellow:Copy()l.a=200;local m=col.blue_light:Copy()m.a=200;local n=col.purple:Copy()n.a=200;hook('OnSSRPContextMenuOpenedBottom','srp.emotes',function(o,p,q)p:AddPanel('srp_panel',function(r)r:SetBackgroundColor(col.transparent)r:Dock(TOP)r:SetTall(300)r:SetMouseInputEnabled(true)r:DockPadding(0,0,0,0)r:DockMargin(0,0,0,0)r.Paint=function()end;r:AddPanel('srp_button_tag_rounded',function(r)r:Dock(TOP)r:SetText'Store'r:SetTall(32)r:SetMouseInputEnabled(true)r:DockPadding(0,0,0,0)r:DockMargin(0,1,0,0)r:SetMaterialMargin(1,1,10,1)r:SetBackgroundColor(d)r:SetHoverColor(g)r:SetTextColor(col.white)r:SetMaterial(Material('materials/galactic/ui/menu/usd.png','noclamp nomips smooth'))r:LeftClick(function()srp.menu.Open('Store',true)end)end)r:AddPanel('srp_button_tag_rounded',function(r)r:Dock(TOP)r:SetText'Change Character'r:SetTall(32)r:SetMouseInputEnabled(true)r:DockPadding(0,0,0,0)r:DockMargin(0,1,0,0)r:SetMaterialMargin(1,1,10,1)r:SetBackgroundColor(d)r:SetHoverColor(h)r:SetMaterial(Material('materials/galactic/ui/menu/player.png','noclamp nomips smooth'))r:LeftClick(function()cmd.Run'changecharacter'end)end)r:AddPanel('srp_button_tag_rounded',function(r)r:Dock(TOP)r:SetText'Cosmetics'r:SetTall(32)r:SetMouseInputEnabled(true)r:DockPadding(0,0,0,0)r:DockMargin(0,1,0,0)r:SetMaterialMargin(1,1,10,1)r:SetBackgroundColor(d)r:SetHoverColor(i)r:SetMaterial(Material('materials/galactic/ui/menu/cap.png','noclamp nomips smooth'))r:LeftClick(function()srp.menu.Open('Cosmetics',true)end)end)r:AddPanel('srp_button_tag_rounded',function(r)r:Dock(TOP)r:SetText'Talents'r:SetTall(32)r:SetMouseInputEnabled(true)r:DockPadding(0,0,0,0)r:DockMargin(0,1,0,0)r:SetMaterialMargin(1,1,10,1)r:SetBackgroundColor(d)r:SetHoverColor(j)r:SetMaterial(Material('materials/galactic/ui/menu/talentlevel.png','nomips noclamp'))r:LeftClick(function()srp.menu.Open('Talents',true)end)end)r:AddPanel('srp_button_tag_rounded',function(r)r:Dock(TOP)r:SetText'Achievements'r:SetTall(32)r:SetMouseInputEnabled(true)r:DockPadding(0,0,0,0)r:DockMargin(0,1,0,0)r:SetMaterialMargin(1,1,10,1)r:SetBackgroundColor(d)r:SetHoverColor(l)r:SetMaterial(Material('materials/galactic/ui/battlepass/badge.png','nomips noclamp'))r:LeftClick(function()srp.triumphs.OpenMenu()end)end)r:AddPanel('srp_button_tag_rounded',function(r)r:Dock(TOP)r:SetText'Gamemaster Rewards'r:SetTall(32)r:SetMouseInputEnabled(true)r:DockPadding(0,0,0,0)r:DockMargin(0,1,0,0)r:SetMaterialMargin(1,1,10,1)r:SetBackgroundColor(d)r:SetHoverColor(m)r:SetMaterial(Material('materials/galactic/ui/menu/purchased.png','nomips noclamp'))r:LeftClick(function()srp.ui.Create('srp_eventrewards',function(r)r:Populate()end)end)end)if srp.battlepass.IsRunning()then for s,t in ipairs(srp.battlepass.season)do local u=srp.battlepass.Get(t)r:AddPanel('srp_button_tag_rounded',function(r)r:Dock(TOP)r:SetText(u.name)r:SetTall(32)r:SetMouseInputEnabled(true)r:DockPadding(0,0,0,0)r:DockMargin(0,1,0,0)r:SetMaterialMargin(1,1,10,1)r:SetBackgroundColor(d)r:SetMaterial(u.icon)r:SetHoverColor(u.color)r:LeftClick(function()srp.battlepass.OpenMenu(t)end)end)end end;r:AddPanel('srp_button_tag_rounded',function(r)r:Dock(TOP)r:SetText'Weapon Organiser (BETA)'r:SetTall(32)r:SetMouseInputEnabled(true)r:DockPadding(0,0,0,0)r:DockMargin(0,1,0,0)r:SetMaterialMargin(1,1,10,1)r:SetBackgroundColor(d)r:SetHoverColor(m)r:SetMaterial(Material('materials/galactic/ui/talents/missile.png','nomips noclamp'))r:LeftClick(function()cmd.Run('weporganiser')end)end)r:SetTall(#r:GetChildren()*33)end)p:AddPanel('srp_panel',function(v)v:Dock(TOP)v:SetMouseInputEnabled(true)v:SetBackgroundColor(col.transparent)v:DockPadding(0,0,0,0)v:DockMargin(0,10,0,0)v:AddPanel('ui_scrollpanel',function(w)w:Dock(FILL)w:SetMouseInputEnabled(true)local x=0;for s,y in pairs(srp.emotes.commands)do if!y.lookup then continue end;if y.CanUse&&!y:CanUse(o)then continue end;local z=srp.emotes.GetValidEmotes(o,y.lookup)if!z then continue end;srp.ui.Create('srp_button_rounded',function(r)r:Dock(TOP)r:SetTall(32)r:SetMouseInputEnabled(true)r:SetText(y.name)r:SetContentAlignment(4)r:DockPadding(0,0,0,0)r:DockMargin(0,0,0,0)r:SetBackgroundColor(d)r:SetHoverColor(y.color||col.blue)r:SetBorderColor(d)r:AddPanel('srp_panel_rounded',function(A)A:SetWide(36)A:Dock(LEFT)A:DockMargin(2,2,4,2)A:DockPadding(0,0,0,0)A:SetBackgroundColor(y.color||col.blue)A:AddPanel('srp_label',function(B)B:Dock(FILL)B:SetContentAlignment(5)B:SetText(Format('%02i',y.id))B:SetFont'ui_label.r'end)end)r.emote=y.id;r.pretty=y.name;r:LeftClick(function(C)cmd.Run('emote',C.emote)end)w:AddItem(r)end)x=x+1 end;v:SetTall(257)w:InvalidateLayout(true)end)b=v end)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/emotes/emote_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/scoreboard/frame_ui.lua:
local a={}local b=Material'materials/galactic/sup_bg.jpg'local c=Material('materials/galactic/ui/menu/usd.png','smooth noclamp nomips')local d=Material('materials/galactic/ui/menu/forums.png','smooth noclamp nomips')local e=Material('materials/galactic/ui/menu/trello.png','smooth noclamp nomips')local f=Material('materials/galactic/ui/menu/discord.png','smooth noclamp nomips')local g=Color(0,0,0,150)local h=Material('materials/galactic/sup_logo.png','smooth')local i=h:Height()/h:Width()local j=1;local k={{'Filter Everyone','FilterAll'},{'Filter Battalion','FilterGroup'},{'Filter Gamemasters','FilterGM'},{'Filter Staff','FilterStaff'},{'Filter Self','FilterSelf'}}function a:Init()self:DockPadding(1,1,1,1)self:SetVisible(false)self:SetZPos(32766)if ScrW()<=1600 then self:SetSize(ScrW()*0.9,ScrH()*0.70)else self:SetSize(ScrW()*0.8,ScrH()*0.70)end;self:Center()self:SetAlpha(0)self:FadeIn(1)self.containers={}self:AddPanel('srp_panel',function(l)l:Dock(TOP)l:SetTall(70)l:DockPadding(5,5,0,5)function l:Paint(m,n)surface.SetMaterial(b)surface.SetDrawColor(255,255,255)surface.DrawTexturedRect(0,0,m,200)surface.SetMaterial(h)surface.DrawTexturedRect(10,2,164,164*i)end;l:AddPanel('srp_button_rounded',function(o)o:SetFont'ui_label.rb'o:SetText(k[1][1])o:Dock(RIGHT)o:SetWide(140)o:SetHoverColor(g)o:DockMargin(2,12,4,12)o:LeftClick(function()j=j>=#k&&1||j+1;o:SetText(k[j][1])self:Update()end)end)l:AddPanel('srp_button_tag_rounded',function(o)o:SetFont'ui_label.rb'o:SetText'Forums'o:SetMaterial(d)o:Dock(RIGHT)o:SetWide(128)o:DockMargin(2,12,2,12)o:SetContentAlignment(5)o:SetBackgroundColor(g)o:SetHoverColor(g)o:LeftClick(function()gui.OpenURL('https://forum.superiorservers.co')end)end)l:AddPanel('srp_button_tag_rounded',function(o)o:SetText'Discord'o:SetFont'ui_label.rb'o:SetMaterial(f)o:Dock(RIGHT)o:SetWide(128)o:DockMargin(2,12,2,12)o:SetContentAlignment(5)o:SetBackgroundColor(g)o:SetHoverColor(g)o:LeftClick(function()gui.OpenURL(info.Discord)end)end)l:AddPanel('srp_button_tag_rounded',function(o)o:SetText'Buy Credits'o:SetFont'ui_label.rb'o:SetMaterial(c)o:Dock(RIGHT)o:SetWide(128)o:DockMargin(2,12,2,12)o:SetContentAlignment(5)o:SetBackgroundColor(g)o:SetHoverColor(g)o:LeftClick(function()ba.ui.OpenAuthLink('/'..info.WebID..'/credits/')end)end)if info.Trello then l:AddPanel('srp_button_tag_rounded',function(o)o:SetFont'ui_label.rb'o:SetText'Trello'o:SetContentAlignment(5)o:SetMaterial(e)o:Dock(RIGHT)o:SetWide(128)o:DockMargin(2,12,2,12)o:SetBackgroundColor(g)o:SetHoverColor(g)o:LeftClick(function()gui.OpenURL(info.Trello)end)end)end end)self:AddPanel('ui_scrollpanel',function(l)l:Dock(FILL)self.scroll=l end)self:AddPanel('srp_panel',function(l)l:Dock(BOTTOM)l:SetTall(20)l:DockPadding(2,2,2,2)l:DockMargin(0,0,0,0)l:SetBackgroundColor(col.transparent)l:AddPanel('srp_button_rounded',function(o)o:SetText('NA Timezone')o:Dock(LEFT)o:DockMargin(2,0,0,0)o:SetWide(120)o:SetBackgroundColor(g)o:SetHoverColor(g)o.Paint=function(p,m,n)draw.RoundedBox(6,0,0,m,n,p.m_bgColor)if p.Percent then draw.RoundedBox(6,0,0,m*p.Percent,n,p.m_bgColor)draw.RoundedBox(6,0,n-2,m*p.Percent,2,p.m_bgColor)end end;self.timezoneDisp=o end)l:AddPanel('srp_button_rounded',function(o)o:SetText('00:00:00:00 Uptime')o:Dock(LEFT)o:DockMargin(2,0,0,0)o:SetWide(120)o:SetBackgroundColor(g)o:SetHoverColor(g)o:LeftClick(function()cmd.Run('voterestart')end)self.uptimeDisp=o end)l:AddPanel('srp_button_rounded',function(o)o:SetText('0/0 Staff Online')o:Dock(RIGHT)o:DockMargin(2,0,0,0)o:SetWide(120)o:SetBackgroundColor(g)o:SetHoverColor(g)o:LeftClick(function()cmd.Run('viewstaff')end)self.staffDisp=o end)l:AddPanel('srp_button_rounded',function(o)o:SetText('Staff News')o:Dock(RIGHT)o:DockMargin(2,0,0,0)o:SetWide(120)o:SetBackgroundColor(g)o:SetHoverColor(g)o:LeftClick(function()cmd.Run('staffnews')end)self.news=o end)l:AddPanel('srp_button_rounded',function(o)o:SetText('0/0 GameMasters Online')o:Dock(RIGHT)o:DockMargin(2,0,0,0)o:SetWide(120)o:SetBackgroundColor(g)o:SetHoverColor(g)o:LeftClick(function()cmd.Run('viewgms')end)self.gmDisp=o end)l:AddPanel('srp_button_rounded',function(o)o:SetText('0/128 Players Online')o:Dock(RIGHT)o:DockMargin(2,0,0,0)o:SetWide(120)o:SetBackgroundColor(g)o:SetHoverColor(g)self.playerDisp=o end)end)self.DoNextThink=0;self.AllegianceOrder={'LOADING'}self.GroupOrder={'TRAINED'}self.OrderStructure={LOADING={TRAINED={}}}for q,r in ipairs(srp.allegiance.GetAll(true))do table.insert(self.AllegianceOrder,r.id)self.OrderStructure[r.id]={TRAINED={}}end;for q,r in ipairs(srp.groups.GetAll(true))do table.insert(self.GroupOrder,r.id)self.OrderStructure[r.allegiance||'REPUBLIC'][r.id]={}end;self:Update()end;function a:Update()local s=self[k[j][2]](self,LocalPlayer())local t=self.scroll:GetCanvas()if!s||#s==0 then t:Clear()return end;for u,l in pairs(self.containers)do if!IsValid(l.pl)then l:Remove()self.containers[u]=nil;continue end;if!table.HasValue(s,l.pl)then l:Remove()self.containers[u]=nil else l:Update()end end;for v,w in ipairs(s)do if!IsValid(w)then continue end;local u=w:IsBot()&&w:EntIndex()||w:SteamID()if IsValid(self.containers[u])then continue else srp.ui.Create('srp_scoreboard_pl',function(l)l:SetPlayer(w)self.containers[u]=l end)end end;local n=0;for v,l in ipairs(self:OrderPanels(self.containers))do l:Dock(NODOCK)l:SetParent(nil)l:SetParent(t)l:Dock(TOP)n=n+l:GetTall()end;t:SetTall(n)end;local function x(r)table.sort(r,function(y,z)local A,B=y.pl:GetGroupRank(),z.pl:GetGroupRank()local C=A&&A.internal||0;local D=B&&B.internal||0;if A==B then return y.pl:Nick():upper()<z.pl:Nick():upper()else return C<D end end)end;function a:OrderPanels(E)local F=table.ClearKeys(E)local G={}local H=table.Copy(self.OrderStructure)for I=1,#F do local l=F[I]if!IsValid(l)||!IsValid(l.pl)then continue end;local w=l.pl;local J=w:GetAllegianceID()||'LOADING'if!H[J]then continue end;local K=w:GetGroup()&&w:GetGroup().id||'TRAINED'if H[J][K]then table.insert(H[J][K],l)end end;local L={}for I=1,#self.AllegianceOrder do local J=self.AllegianceOrder[I]if!H[J]then continue end;for M=1,#self.GroupOrder do local N=self.GroupOrder[M]if H[J][N]then x(H[J][N])for O=1,#H[J][N]do table.insert(L,H[J][N][O])end end end end;return L end;function a:UpdateStats()self.playerDisp:SetText(Format('%02i/128 Players',player.GetCount()))local P=0;local Q=0;for v,w in player.Iterator()do if w:IsAdmin()then P=P+1 end;if w:IsTrialGamemaster(true)then Q=Q+1 end end;local R=math.floor(CurTime()/3600)local S=math.floor(CurTime()%3600/60)local T=math.floor(CurTime()-R*3600-S*60)if S<10 then S='0'..S end;if T<10 then T='0'..T end;local U=R..':'..S..':'..T..' Uptime'local V,W=srp.time.GetTimezone()if V then self.timezoneDisp:SetText(V.Short..' Timezone')self.timezoneDisp:SetBackgroundColor(V.color)self.timezoneDisp:SetHoverColor(V.color)self.timezoneDisp.Percent=W||0 end;self.staffDisp:SetText(Format('%02i Staff',P))self.gmDisp:SetText(Format('%02i GameMasters',Q))self.uptimeDisp:SetText(U)end;function a:FilterAll(w)local X=w:GetAllegiance()if X:IsEvent()then return player.GetAll()else local s={}for v,w in player.Iterator()do if w:IsBot()then s[#s+1]=w else local Y=w:GetAllegiance()if Y&&!Y:IsEvent()then s[#s+1]=w end end end;return s end end;function a:FilterGroup(w)local Z=w:GetGroup()if Z then return filter.GetGroup(Z.id,true)else return filter.GetNoGroup()end end;function a:FilterGM()return filter.GetGM(true)end;function a:FilterStaff()return filter.GetStaff()end;function a:FilterSelf()return{LocalPlayer()}end;function a:Open()self:SetVisible(true)self:FadeIn(0.2)end;function a:Close(_)self:FadeOut(0.2,function()self:SetVisible(false)if _ then _()end end)end;function a:OnRemove()end;function a:FadeIn(a0,_)self.animation=Derma_Anim('Fade Panel',self,function(a1,a2,a3,a4)a1:SetAlpha(a3*255)if a2.Finished then self.animation=nil;if _ then _()end end end)if self.animation then self.animation:Start(a0)end end;function a:FadeOut(a0,_)self.animation=Derma_Anim('Fade Panel',self,function(a1,a2,a3,a4)a1:SetAlpha(255-a3*255)if a2.Finished then self.animation=nil;if _ then _()end end end)if self.animation then self.animation:Start(a0)end end;function a:Think()if!self.nextcheck||self.nextcheck<CurTime()then self.nextcheck=CurTime()+1;self:Update()self:UpdateStats()end;if self.animation then self.animation:Run()end end;local a5=Color(25,25,25,225)function a:Paint(m,n)draw.Box(0,0,m,n,a5)surface.SetMaterial(b)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(0,0,1,n)surface.DrawTexturedRect(m-1,0,1,n)surface.DrawTexturedRect(0,n-1,m,1)end;vgui.Register('srp_scoreboard',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/weaponswitch/ui/weporganiser_wep_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/jails_sh.lua:
srp.jail=srp.jail||{}local a={}local b={}local c={}local d={}nw.Register'srp.jail.status':Write(net.WriteUInt,2):Read(net.ReadUInt,2):SetPlayer():SetHook('OnJailStatusChanged')nw.Register'srp.jail.release':Write(net.WriteUInt,32):Read(net.ReadUInt,32):SetPlayer()function PLAYER:SetJailed(e,f,g,h)self:SetNetVar('srp.jail.status',f&&1||0)self:SetNetVar('srp.jail.release',g)self.BailAmount=h end;function PLAYER:SetWanted(i,f)self:SetNetVar('srp.jail.status',f&&2||0)end;function PLAYER:GetJailStatus()return self:GetNetVar('srp.jail.status')end;function PLAYER:IsArrested()return self:GetNetVar('srp.jail.status')==1 end;PLAYER.IsJailed=PLAYER.IsArrested;function PLAYER:IsWanted()return self:GetNetVar('srp.jail.status')==2 end;function PLAYER:IsOppressed()return self:IsJailed()||self:IsCuffed()end;function PLAYER:GetJailRelease()return self:GetNetVar('srp.jail.release')||0 end;function PLAYER:GetJailTime()return(self:GetNetVar("srp.jail.release")||0)-os.time()end;function PLAYER:IsEnforcement(j,k,l,m)local j=j||self:GetGroup()local k=k||self:GetGroupRank()local n=self:GetGroupClass()local o=j&&j:HasPermission('jail')||k&&k:HasPermission('jail')||n&&n:HasPermission('jail')if l then return o&&k:HasPermission('officer')||!m&&self:HasFlag('D')||false else return o||!m&&self:HasFlag('A')||false end end;function srp.jail.CanBail(p,q)if p:IsJailed()then return false end;local r=p:GetGroupRank()if!r||!r:HasPermission'bail'then return false end;if p:GetGroup().id=='SENATOR'then return true end;local s=q:GetGroupRank()if!s then return true end;if!s:HasPermission'bail'then return true end;local t=r:HasPermission'commander'if!r:HasPriority(s)&&!t then return false end;if s:HasPermission'bail'&&r:HasPermission'officer'then return true end;if s:HasPermission'officer'&&r:HasPermission'highofficer'then return true end;if s:HasPermission'highofficer'&&t then return true end;return false end;function srp.jail.AddReason(u,v,w,x)local y={rid=u,sev=w,name=c[w].name..' | '..v,sevdata=c[w]}y.id=table.insert(b,y)a[u]=y end;function srp.jail.GetReason(u,z)return z&&b[u]||a[u]end;function srp.jail.GetReasons()return b end;function srp.jail.AddSeverity(A,x)x.sid=A;x.id=table.insert(d,x)c[A]=x end;function srp.jail.GetSeverity(u,z)return z&&d[u]||c[u]end;local B='Bail has been set at %s.'local C='Bail has not been set.'chat.Register'GUARDTICKET':Write(function(self,p,q,D,E)net.WritePlayer(p)net.WritePlayer(q)net.WriteUInt(D,6)net.WriteBool(E)end):Read(function(self)local p=net.ReadPlayer()local F=net.ReadPlayer()if!IsValid(p)||!IsValid(F)then return end;local G=net.ReadUInt(6)local H=net.ReadBool()local E=H&&'UNCOOPERATIVE'||'COOPERATIVE'local y=srp.jail.GetReason(G,true)if!y then return end;chat.SetTab('CG')return col.red,'[GUARDS] ',p,col.white,' issued a ticket to ',F,col.white,' for ',y.sevdata.color,y.name,' - ',H&&col.red||col.blue_light,E,col.white,'.'end):Filter(function()return filter.GetEnforcement()end)chat.Register'GUARD_INFO':Write(function(self,p,I,J,K,L,M)net.WritePlayer(p)net.WritePlayer(I)net.WriteUInt(J,32)net.WriteUInt(K,6)net.WriteBool(L)if L then net.WriteUInt(M,32)end end):Read(function(self)local p=net.ReadPlayer()local F=net.ReadPlayer()if!IsValid(p)||!IsValid(F)then return end;local J=net.ReadUInt(32)local D=net.ReadUInt(6)local h=net.ReadBool()local N=h&&net.ReadUInt(32)||nil;local h=!h&&C||Format(B,N)local y=srp.jail.GetReason(D,true)if!y then return end;chat.SetTab('CG')return col.red,'[GUARDS] ',F,col.white,' has been arrested by ',p,col.white,' for ',y.sevdata.color,y.name,col.white,'. ',h end)srp.AddCommand('tickets',function(e,O)net.Start'srp.jail.OpenTickets'net.WriteBool(O!=nil)if O then net.WriteString(ba.InfoTo32(O))end;net.Send(e)end):AddParam(cmd.PLAYER_STEAMID32,cmd.OPT_OPTIONAL)srp.AddCommand('ticket',function(e,q)srp.jail.SendTicketInfo(e,q:SteamID(),q:CharacterID())end):AddParam(cmd.PLAYER_ENTITY):SetEnforcement():SetCooldown(2):SetInfoSection('Enforcement'):SetInfo('Issue a ticket to a player'):SetInfoArgs({'Target - The SteamID/Name of the player'})srp.AddCommand('ticketoffline',function(e,O,P)if IsEntity(O)&&O:CharacterID()==P then srp.jail.SendTicketInfo(e,O:SteamID(),P)else O=IsEntity(O)&&O:SteamID()||O;srp.jail.IsValid(O,P,function(x)if x&&x[1]then srp.jail.SendTicketInfo(e,O,P)end end)end end):AddParam(cmd.PLAYER_STEAMID32):AddParam(cmd.UINT):SetEnforcement():SetCooldown(5)srp.AddCommand('ticketdelete',function(e,Q)if e:IsEnforcement(nil,nil,true)then srp.jail.SetTicketStatus(e,Q,4)else get_ticket(Q,function(x)local R=x&&x[1]if!R then return end;if R.issuerid==e:CharacterID()then srp.jail.SetTicketStatus(e,Q,4)end end)end end):AddParam(cmd.UINT):SetEnforcement():SetCooldown(2)srp.AddCommand('want',function(e,q,y)srp.jail.Want(e,q,y)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING):SetInfoSection('Enforcement'):SetInfo('Wants the provided player along with a reason for doing so.'):SetInfoArgs({'Target - The SteamID/Name of the player','Reason - the reason for wanting'}):SetEnforcement()srp.AddCommand('unwant',function(e,q,y)srp.jail.Unwant(e,q,y)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING):SetInfoSection('Enforcement'):SetInfo('Unwants the provided player along with a reason for doing so.'):SetInfoArgs({'Target - The SteamID/Name of the player','Reason - the reason for unwanting'}):SetEnforcement()srp.AddCommand('location',function(p,S)if!S:IsWanted()&&!S:IsJailed()then srp.notif.Neutral(p,1,term.Get('CitationLocationNotWanted'),S)return end;local j=p:GetGroup()if!j then return end;local T=S:GetLocation()local v=T.name||'Unknown Location'if S:GetAllegianceID()=='REPUBLIC'then j:SendMessage('IGetLocation',p:Nick(),S:Nick(),T.name)end end):AddParam(cmd.PLAYER_ENTITY):SetInfoSection('Enforcement'):SetInfo('Provides the location of the given player.\nThe player must be wanted or considered jailed.'):SetInfoArgs({'Target - The SteamID/Name of the player'}):SetAlive():SetEnforcement()srp.AddCommand('jail',function(p,S)srp.jail.Arrest(p,S)end):AddParam(cmd.PLAYER_ENTITY):SetInfoSection('Enforcement'):SetInfo('Jails the given player. This should only be used for sit room situations and/or when no CG are online.'):SetInfoArgs({'Target - The steamid/name of the player'}):SetFlag'M'srp.AddCommand('unjail',function(p,S)local U=S:IsJailed()if!U then srp.notif.Warning(p,4,term.Get('TheyreNotJailed'))else srp.jail.Release(p,S,'Force unwanted')srp.notif.Success(p,4,term.Get('PlayerForceReleased'),S:Nick(),S:SteamID())end end):AddParam(cmd.PLAYER_ENTITY):SetInfoSection('Enforcement'):SetInfo('Unjails the given player. This should only be made after a sit has been made for false arrest and/or no CG are online.'):SetInfoArgs({'Target - The steamid/name of the player'}):SetFlag'M'srp.jail.AddSeverity(0,{name='Sev 0',color=col.white:Copy(),mintime=1,maxtime=2})srp.jail.AddSeverity(1,{name='Sev 1',color=col.blue_light:Copy(),mintime=5,maxtime=5,bail=4000,defaultTime=5,defaultBail=4000})srp.jail.AddSeverity(2,{name='Sev 2',color=col.yellow:Copy(),mintime=5,maxtime=10,bail=6000,defaultTime=10,defaultBail=6000})srp.jail.AddSeverity(3,{name='Sev 3',color=col.orange:Copy(),mintime=5,maxtime=15,bail=10000,defaultTime=15,defaultBail=10000})srp.jail.AddSeverity(4,{name='Sev 4',color=col.red:Copy(),mintime=5,maxtime=20,defaultTime=20})srp.jail.AddSeverity(5,{name='Sev 5',color=col.red:Copy(),mintime=5,maxtime=25})srp.jail.AddReason('train','Training Citation',0)srp.jail.AddReason('weppoint','Weapon Pointed',1)srp.jail.AddReason('jumping','Jumping on Rails',1)srp.jail.AddReason('pts','Breaking PTS',1)srp.jail.AddReason('spam','Mic / Chat Spam',2)srp.jail.AddReason('hopping','Bunny Hopping',2)srp.jail.AddReason('forceabuse','Abuse of Force Powers (Minor)',2)srp.jail.AddReason('failrp','Minging/FailRP',3)srp.jail.AddReason('repeat','Repeat Offender',3)srp.jail.AddReason('aosviol','AOS Area Violation',3)srp.jail.AddReason('refofc','Refusing Officer / CG Orders',3)srp.jail.AddReason('dbviolation','DB Violation',2)srp.jail.AddReason('abufpwr','Abuse of Force Powers (Major)',4)srp.jail.AddReason('bbc','Breaking Brotherhood Code',4)srp.jail.AddReason('batdis','Disrespect to Battalion or Superior',4)srp.jail.AddReason('riot','Partaking in Riot / Insigating Riot',4)srp.jail.AddReason('comms','Misuse of military communications',3)srp.jail.AddReason('equipment','Misuse of Equipment',3)srp.jail.AddReason('staffarrest','Staff Arrest',3)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/ui/bail_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/ui/bail_ui.lua:
local a={}local b=col.white:Copy()b.a=50;function a:Init()self:SetBackgroundColor(col.white_dark)self:SetSize(600,590)self:Center()self:MakePopup(true)self:DockPadding(10,35,10,2)self:SetTitle'Bail Center'self.Players={}self:AddPanel('srp_textinput',function(c)c:SetBackgroundColor(b)c:DockMargin(0,5,0,5)c:SetTextColor(col.grey_light)c:Dock(TOP)c:OnValid(function(d)local e=d:GetValue()self:Search(e==''&&nil||e)end)self.textbox=c end)self:AddPanel('ui_scrollpanel',function(f)f:Dock(FILL)f.Padding=0;self.Scroll=f end)srp.jail.GetBailables()hook('OnBailablesLoaded',self,self.Populate)end;function a:Search(e)e=e:lower()for g,f in ipairs(self.Players)do if IsValid(f)&&string.find(f.Name:GetText():lower(),e)then f:SetVisible(true)else f:SetVisible(false)end end end;function a:Populate(h)if#h==0 then self:AddPanel('srp_label',function(i)i:Dock(FILL)i:SetContentAlignment(5)i:SetFont'ui_header.r'i:SetText'No one is currently awaiting bail. Check back later.'i:SetTextColor(col.grey_light)end)return end;local j=LocalPlayer()for g,k in ipairs(h)do if!IsValid(k.Player)then continue end;srp.ui.Create('srp_bailrow',function(f)f:Populate(k)self.Scroll:AddItem(f)table.insert(self.Players,f)end)end end;function a:OnRemove()hook.Remove('OnBailablesLoaded',self)end;vgui.Register('srp_bail',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loadouts/ui/loadoutitem_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loginrewards/loginrewards_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loginrewards/ui/loginrewardmilestone_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/doors/doors_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/patrols/patrols_sh.lua:
srp.patrols=srp.patrols||{}local a={}function srp.patrols.AddRoutes(b,c)if info.Map==b then a=c;for d,e in pairs(a)do for f,g in ipairs(e)do if info.Dev then local h={}for i=1,3 do h[i]=g[i]h[i].id=i end;e[f]=h;g=h end;for i,j in ipairs(g)do j.id=i end;srp.leaderboard.RegisterPatrol(f)end end end end;function srp.patrols.GetRandomRoute()if info.Dev then return 3,a.REPUBLIC[3]end;local k=math.random(1,#a.REPUBLIC)return k,a.REPUBLIC[k]end;srp.AddCommand('grequestpatrol',function(l)srp.patrols.RequestRoute(l)end):AddAlias('patrol'):SetInfoSection('Battalion'):SetInfo('Requests or joins a patrol')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/flashlight_sh.lua:
nw.Register'srp.player.flashlight':Write(net.WriteBool):Read(net.ReadBool):SetPlayer():SetHook('OnFlashlightToggled')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/thirdperson_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/animations/boneanim_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/binds/binds_sh.lua:
srp.binds=srp.binds||{}local a=FindMetaTable'Keybind'function a:SetCustom(b)self.Custom=b;return self end;function a:IsCustom()return self.Custom end;function a:SetDefaultKey(c)self.DefaultKey=c;return self end;function a:GetDefaultKey()return self.DefaultKey end;srp.binds.TooltipBinds=srp.binds.TooltipBinds||{}function a:EnableTooltip(d)table.Filter(srp.binds.TooltipBinds,function(e)return e!=self end)if d then srp.binds.TooltipBinds[#srp.binds.TooltipBinds+1]=self end;return self end;srp.binds.EntityTooltipBinds=srp.binds.EntityTooltipBinds||{}function a:EnableEntityTooltip(d)table.Filter(srp.binds.EntityTooltipBinds,function(e)return e!=self end)if d then srp.binds.EntityTooltipBinds[#srp.binds.EntityTooltipBinds+1]=self end;return self end;function a:ShouldDrawTooltip(f)return true end;function a:SetShouldDrawTooltip(g)self.ShouldDrawTooltip=g;return self end;function a:SetTooltipText(h)self.TooltipText=h;return self end;function a:GetTooltipText(f)return self.TooltipText end;function a:SetGetTooltipText(g)self.GetTooltipText=g;return self end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/binds/ui/binds_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/polling/ui/pollcontainer_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/polling/ui/polloption_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/questobjective_sh.lua:
srp.quests=srp.quests||{}local a={}local b={}local c={}local d={}d.__index=d;function d:Init()self.Description=''self.Goal=1;self.Cost=5000;self.RewardIncreaseScale=0;self.hooks={}end;function d:SetDescription(e)self.Description=e;return self end;function d:GetDescription()return self.Description end;function d:SetPoints(f)self.Points=f;return self end;function d:SetGoal(f)return self:SetPoints(f)end;function d:GetPoints()if istable(self.Points)then return math.random(self.Points.min,self.Points.max)else return self.Points end end;function d:GetGoal()return self:GetPoints()end;function d:SetCost(f)self.Cost=f;return self end;function d:GetCost(g)return self.Cost*math.Clamp(math.Remap(g||1,1,5000,1,0),0,1)end;function d:OnGetCost(h)self.GetCost=h;return self end;function d:SetFilter(h)self.Filter=h;return self end;function d:OnRewardScale()return self:GetRewardScale()end;function d:GetRewardScale()return self.RewardIncreaseScale end;function d:AddHook(i,j,h)local k=h&&j||nil;local l=h||j;self.hooks[i]={func=l,target=k}return self end;function srp.quests.CreateObjective(i,m,n)m=m||'all'local o={id=i,cat=m,filterCat=n}setmetatable(o,d)o.internal=table.insert(b,o)a[i]=o;c[m]=c[m]||{}table.insert(c[m],o)o:Init()return o end;function srp.quests.GetObjective(i,p)return p&&b[i]||a[i]end;function srp.quests.GetObjectives(p)return p&&b||a end;function srp.quests.GetObjectvesByCategory(i)return c[i||'all']end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/ui/invasionplate_ui.lua:
local a={}a.DefaultSound='sound/galactic/radio/voip_end_transmit_beep_01.wav'a.DefaultSoundEnd='sound/galactic/radio/voip_end_transmit_beep_02.wav'local b=0;local c=Color(55,55,55,150)local d=Color(25,25,25,250)local e=Color(0,0,0,200)function a:Init()self:DockPadding(2,2,2,2)self:SetTall(100)self:SetAlpha(0)self.TimeoutColor=e;self.PlateBackground=d;self:AddPanel('srp_panel_rounded',function(f)f:Dock(LEFT)f:SetWide(100)f:DockMargin(0,0,0,0)f:DockPadding(4,4,4,4)f:SetBackgroundColor(c)f:AddPanel('srp_modelpanel',function(g)g:SetPos(0,0)g:Dock(FILL)g:SetFOV(70)g:SetVisible(false)self.model=g end)self.modelcontainer=f end)self:AddPanel('srp_panel_rounded',function(f)f:Dock(FILL)f:DockMargin(0,0,0,0)f:DockPadding(4,4,4,4)f:SetBackgroundColor(col.transparent)f:AddPanel('srp_label',function(h)h:Dock(TOP)h:SetTextColor(col.white)h:SetFont'ui_header.r'h:SetText''h:SetContentAlignment(4)h:SetTall(25)self.title=h end)f:AddPanel('srp_label',function(h)h:Dock(FILL)h:SetWrap(true)h:SetContentAlignment(7)h:SetTextColor(col.white_dark)h:SetFont'ui_label.l'h:SetText''self.text=h end)end)end;function a:Populate(i,j)self:AlphaTo(255,0.3,0)self.TimeoutColor=j.Color||e;self.PlateBackground=j.PlateBackground||d;self:SetWide(i:GetWide())self.title:SetText(j.Title)self.text:SetText(j.Text)if j.Model then self:SetupModel(j.Model)else self.model:SetVisible(false)end;if IsValid(self.Playing)then self.Playing:Stop()end;local k=j.Audio||self.DefaultSound;if k&&k!=self.LastAudio then sound.PlayFile(j.Audio||self.DefaultSound,'stereo',function(l)if IsValid(self)&&l then l:SetVolume(0.2)self.Playing=l end end)self.LastAudio=k end;self.Duration=j.Duration;self.Timeout=CurTime()+j.Duration;timer.Create('srp.invasion.Animator_'..j.id,self.Duration+.5,1,function()if IsValid(self)then self:FadeOut()end end)end;function a:FadeOut()self:AlphaTo(0,.25,0,function()if IsValid(self)then self:Remove()end end)end;function a:OnRemove()sound.PlayFile(self.DefaultSoundEnd,'stereo',function(l)if l then l:SetVolume(0.2)end end)end;function a:SetupModel(m)local n=self.model:AddModel(m,Vector(),Angle())local o=n:LookupBone('ValveBiped.Bip01_Head1')||0;local p,q=n:GetBonePosition(o)if o==0 then p=Vector(0,0,30)end;self.model:SetVisible(true)self.model:SetCamPos(p+Vector(20,0,0))self.model:SetLookAt(p)end;function a:MoveMe(r)self.MovingTo=r end;function a:Think()if self.MovingTo then self.Position=Lerp(RealFrameTime()/1*15,self.Position||500,self.MovingTo)self:SetPos(0,self.Position)end end;function a:Paint(s,t)draw.RoundedBox(6,0,0,s,t,self.PlateBackground)if self.Timeout then local u=math.max((self.Timeout-CurTime())/self.Duration,0)draw.RoundedBox(6,0,0,104*u,t,self.TimeoutColor)end end;vgui.Register('srp_invasionplate',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/ui/quest_dailies_ui.lua:
local a={}local function b()end;function a:Init()self:SetSize(700,520)self:Center()self:MakePopup()self:SetTitle'Daily Quest Board'self:SetBackgroundColor(col.midnight)self.Instances={}self:AddPanel('ui_scrollpanel',function(c)c:Dock(FILL)srp.ui.Create('srp_grid',function(d)d:Dock(TOP)d:SetAutoHeight(true)self.Dailies=d;c:AddItem(d)end)end)srp.quests.RequestDailies()hook.Add('OnQuestDailiesBoardReceived',self,self.Populate)hook.Add('OnQuestDailiesBoardRemove',self,self.RemoveDaily)end;function a:Populate(e)for f,g in ipairs(e)do srp.ui.Create('srp_quests_daily',function(d)d:SetSize(673,80)d:Populate(g)self.Instances[g.dailiesListinstanceId]=d;self.Dailies:AddItem(d)end)end end;function a:RemoveDaily(h)if self.Instances[h]then self.Instances[h]:Remove()end end;vgui.Register('srp_quests_dailies',a,'srp_window')local a={}local i=Material'materials/galactic/ui/menu/money-3.png'local j=135;function a:Init()self:DockPadding(10,10,10,10)self:SetBackgroundColor(col.midnight_dark)self:AddPanel('srp_panel',function(d)d:Dock(FILL)d:DockPadding(0,0,0,0)d:SetBackgroundColor(col.transparent)d:AddPanel('srp_label',function(k)k:SetText'???????'k:Dock(TOP)k:SetFont'ui_header.r'self.Name=k end)d:AddPanel('srp_panel',function(d)d:Dock(FILL)d:DockMargin(0,0,0,0)d:DockPadding(0,0,0,0)d:SetBackgroundColor(col.transparent)self.Objectives=d end)end)self:AddPanel('srp_panel',function(d)d:Dock(RIGHT)d:DockPadding(0,0,0,0)d:DockMargin(0,0,0,0)d:SetBackgroundColor(col.transparent)self.RewardContainer=d;d:AddPanel('srp_panel',function(d)d:Dock(TOP)d:SetTall(36)d:DockMargin(0,12,0,0)d:DockPadding(0,0,0,0)d:SetBackgroundColor(col.transparent)d:AddPanel('srp_button_tag',function(l)l:SetSize(j,36)l:Dock(RIGHT)l:DockMargin(2,0,0,0)l:SetText'CLAIM'l:SetContentAlignment(6)l:SetBackgroundColor(col.green)l:SetHoverColor(col.green_dark)l:SetMaterial(i)l:DockMaterial(RIGHT)l:SetMaterialBackground(col.transparent)l:LeftClick(function(m)m:SetDisabled(true,5)srp.quests.ClaimDaily(self.Index)end)self.Claim=l end)self.Rewards=d end)end)end;function a:Populate(g)self.Index=g.dailiesListinstanceId;self.Daily=g;self.Name:SetText(g.name||'??_@!1##1!!?245')local n=g.cost||0;n=n-n*LocalPlayer():GetImprintValue('questcheaper',0)self.Claim:SetText(string.Comma(n||0)..' CLAIM')if n>500000 then self.Claim:SetBackgroundColor(col.purple)self.Claim:SetHoverColor(col.purple_dark)elseif n>200000 then self.Claim:SetBackgroundColor(col.orange_dark)self.Claim:SetHoverColor(col.orange)end;self:AddObjectives(g.objectives)self:AddRewards(g.rewards)end;function a:AddObjectives(o)local p=#o;for f,q in ipairs(o)do self.Objectives:AddPanel('srp_label',function(d)d:SetTall(20)d:SetText(q.name)d:SetTextColor(col.white)d:SetFont'ui_header.s'd:SetTextInset(12,0)d:Dock(TOP)d:DockMargin(0,0,0,1)d.Paint=b end)end;local r=45+p*22;self:SetTall(r)self.Rewards:DockMargin(0,(r-56)/2,0,0)end;function a:AddRewards(s)self.RewardContainer:SetWide(40*#s+j)for f,g in ipairs(s)do self.Rewards:AddPanel('srp_quests_reward',function(d)d:SetSize(36,36)d:Dock(RIGHT)d:DockMargin(2,0,0,0)d:Populate(unpack(g))end)end end;vgui.Register('srp_quests_daily',a,'srp_panel')local a={}function a:Init()self:DockPadding(4,4,4,4)self:SetBackgroundColor(col.blue)end;function a:Populate(t,u,...)local v=srp.battlepass.GetUnlockType(t)local w=v:GetModel(u,...)local x=v:GetIcon(u,...)local y=v.GetName&&v:GetName(u,...)||v.name;self:SetTooltip(y)if w then self:AddPanel('srp_modelpanel',function(z)z:Dock(FILL)z:SetMouseInputEnabled(false)z:TryCenter(z:AddModel(w))end)elseif x then self:AddPanel('DImage',function(A)A:DockMargin(0,0,0,0)A:Dock(FILL)A:SetMaterial(x)A:SetMouseInputEnabled(false)end)end end;function a:SetLarge()self:DockPadding(12,12,12,12)end;vgui.Register('srp_quests_reward',a,'srp_panel')concommand.AddDev('srp_quests_dailies',function()srp.ui.Create('srp_quests_dailies')end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/enums_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/meta_sh.lua:
srp.rts=srp.rts||{}local a={}local b={}local c={}RTSACTION={}RTSACTION.__index=RTSACTION;function RTSACTION:Init(d)self.name='Action'self.description='Action Description'self.cooldown=.2;self.keyvalues={}self.DoClearData=true;self.datadefinition={}self.datadefinitionkeys={}end;function RTSACTION:SetContextual(e)self.contextual=true;self.contextualclass=e;self:SetDataDefinition('context1','')self:SetDataDefinition('context2','')return self end;function RTSACTION:SetKey(f)self.key=f;return self end;function RTSACTION:SetSelectionRequired(g)self.RequiresSelection=g;return self end;function RTSACTION:IsSelectionRequired()return self.RequiresSelection end;function RTSACTION:SetSelectionClass(e)self.selectionclass=e;return self end;function RTSACTION:CanUseOnClass(e)if!self.selectionclass then return true end;if istable(self.selectionclass)then return table.HasValue(self.selectionclass,e)else return self.selectionclass==e end end;function RTSACTION:IsContextual()return self.contextual end;function RTSACTION:SetUnit()self.Unit=true;return self end;function RTSACTION:IsUnit()return self.Unit end;function RTSACTION:Validate(h)return true end;function RTSACTION:OnValidate(i)self.Validate=i;return self end;function RTSACTION:SetConfigPanel(j)self.ConfigPanel=j;return self end;function RTSACTION:GetConfigPanel()return self.ConfigPanel end;function RTSACTION:CanUseContext(e,k)if srp.rts.ClassBlacklist[e]then return false elseif!self.contextualclass then return true elseif isfunction(self.contextualclass)then return self:contextualclass(e,k)elseif istable(self.contextualclass)then return table.HasValue(self.contextualclass,e)else return self.contextualclass==e end end;function RTSACTION:SetSubContexts(i)self.contextualextras=i;return self end;function RTSACTION:GetSubContexts()return self.contextualextras end;function RTSACTION:SetClientsideAction()self.clientside=true;self.serverside=false;return self end;function RTSACTION:SetServersideAction()self.clientside=false;self.serverside=true;return self end;function RTSACTION:SetSharedAction()self.clientside=true;self.serverside=true;return self end;function RTSACTION:IsServerside()return self.serverside end;function RTSACTION:IsClientside()return self.clientside end;function RTSACTION:IsShared()return self.clientside==self.serverside end;function RTSACTION:SetWorldClick()self.worldfirst=true;return self end;function RTSACTION:IsWorldClick()return self.worldfirst end;function RTSACTION:DeselectOnUse()self.deselectuse=true;return self end;function RTSACTION:IsDeselectOnUse()return self.deselectuse end;function RTSACTION:SetName(j)self.name=j;return self end;function RTSACTION:GetName()return self.name end;function RTSACTION:SetDescription(j)self.description=j;return self end;function RTSACTION:GetDescription()return self.description end;function RTSACTION:SetIcon(l)self.icon=l;return self end;function RTSACTION:GetIcon(h)if isfunction(self.icon)then return self:icon(h)else return self.icon end end;function RTSACTION:OnGetIcon(i)self.icon=i;return self end;function RTSACTION:OnWorldClick(m)self._OnWorldClick=m;return self end;function RTSACTION:OnSelected(m)self._OnSelected=m;return self end;function RTSACTION:OnDeselected(m)self._OnDeselected=m;return self end;function RTSACTION:OnRead(m)self.Read=m;return self end;function RTSACTION:OnWrite(m)self.Write=m;return self end;function RTSACTION:ReadInternal(n)for o,h in ipairs(self.datadefinition)do self:SetData(n,h.key,h.read(unpack(h.args)))end end;function RTSACTION:WriteInternal()for o,h in ipairs(self.datadefinition)do local p=self.keyvalues[h.key]||h.default;h.write(p,unpack(h.args))end end;function RTSACTION:Read(n,q)if q&&#self.datadefinition>0 then self:ReadInternal(n)end end;function RTSACTION:Write(q)if#self.datadefinition>0 then self:WriteInternal()end end;function RTSACTION:SetDataDefinition(f,r,s,t,...)local u={key=f,default=r||'',read=s||net.ReadString,write=t||net.WriteString,args={...}}self.datadefinition[#self.datadefinition+1]=u;self.datadefinitionkeys[f]=u;return self end;function RTSACTION:SetData(n,f,p)if CLIENT then self.keyvalues[n]=f else self.keyvalues[n]=self.keyvalues[n]||{}self.keyvalues[n][f]=p end;return self end;function RTSACTION:GetData(n,f)if CLIENT then local p=self.keyvalues[n]local v=self.datadefinitionkeys[n]&&self.datadefinitionkeys[n].default;return p||v else local p=self.keyvalues[n][f]local v=self.datadefinitionkeys[f]&&self.datadefinitionkeys[f].default;return p||v end end;function RTSACTION:GetAllData(n)if CLIENT then return self.keyvalues else return self.keyvalues[n]end end;function RTSACTION:KeepData()self.DoClearData=false;return self end;function RTSACTION:ShouldClearData()return self.DoClearData end;function RTSACTION:ClearData(n)if CLIENT then self.keyvalues={}else self.keyvalues[n]={}end end;function RTSACTION:_OnWorldClick(n,w,x)end;function RTSACTION:_OnSelected(n,w)end;function RTSACTION:_OnDeselected(n)end;function srp.rts.Register(y)local z={id=y}setmetatable(z,RTSACTION)z.internal=table.insert(b,z)a[y]=z;z:Init()return z end;function srp.rts.Get(y,A)return A&&b[y]||a[y]end;function srp.rts.GetAll()return b end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/ui/rtsactions_ui.lua:
local a={}local b=Material'gui/gradient_up'local c=Material'gui_gradient_up'local d=Material'materials/galactic/ui/character_orb.png'local e=Material'materials/galactic/ui/character_orb_inner.png'local f={[KEY_0]=10,[KEY_1]=1,[KEY_2]=2,[KEY_3]=3,[KEY_4]=4,[KEY_5]=5,[KEY_6]=6,[KEY_7]=7,[KEY_8]=8,[KEY_9]=9}function a:Init()self.IsSmallMode=false;self.ActionButtons={}self:DockMargin(0,0,0,0)self:DockPadding(4,4,2,4)self:AddPanel('srp_grid',function(g)g:Dock(FILL)g:SetSpacing(6,6,true)self.actions=g end)end;function a:SetSmallMode(h)self.IsSmallMode=h;self.actions:SetSpacing(3,3,true)end;function a:OnRemove()hook.Remove('PlayerBindPress',self)end;function a:SetTitle(i)self.title:SetText(i)end;function a:SetMode(j,k)self.ActionMode=j;self.AltMode=k;local l=self:_OnFilter(j)if!l||#l==0 then return end;self:SetSmallMode(k)self:AddActions(l)local m=self.actions:GetChildren()[1]if IsValid(m)&&m.ActionID!=self.SelectAction then self:DeselectAction(self.SelectedAction)self:_OnActionRequested(m.ActionID,m,true)end;self:_OnActionModeChanged(self.ActionMode,self.SelectedAction)end;function a:TryOpenConfig()local m=self.SelectedAction&&self.ActionButtons[self.SelectedAction]if IsValid(m)&&m.Config then m.Config:ForceLeftClick()end end;function a:TrySelectSlot(n,o)if self.AltMode&&(f[n]&&!o)then return false end;local p=f[n]||n;for q,m in ipairs(self.actions:GetChildren())do if m:IsVisible()&&(m:GetActionKey()==p||m.ActionIndex==p)then self:_OnActionRequested(m.ActionID,m)return true end end end;function a:SetSelected(p)self.selectedid=p;for q,m in pairs(self.actions:GetChildren())do if m.ActionID==p then m:SetBorderColor(col.blue_light)m:SetTextColor(col.blue_light)else m:SetBorderColor(col.grey)m:SetTextColor(col.white_dark)end end end;function a:AddActions(l)self.actions:Clear()self.ActionButtons={}local r=0;for s,t in ipairs(l)do local u=t:GetIcon()||c;local v=t:GetConfigPanel()local w=!t.selectionclass&&!t:IsSelectionRequired()local x=self.IsSmallMode&&32||64;srp.ui.Create('srp_rtsaction',function(m)m:SetSize(x,x)m:Populate(self:GetParent(),t,self.AltMode)m:LeftClick(function(y)if self.selectedid==y.ActionID then return end;self:_OnActionRequested(y.ActionID,y)y:SetTextColor(col.black)y:SetDisabled(true,y.ActionCooldown,function()y:SetTextColor(col.white_dark)end)end)m:OnConfigSelected(function(z,t,A)self:SelectActionConfig(t,A)end)m:SetVisible(w)if w then r=r+1;m:SetIndex(r)else m:SetIndex(0)end;self.ActionButtons[t.id]=m;self.actions:AddItem(m)end)end;if IsValid(self.Controller)&&self.Controller.EntitySelection then self:FilterActions(self.Controller.EntitySelection)end end;function a:Populate(B)self.Controller=B end;function a:FilterActions(selectedEntities)if!self.actions then return end;local r=0;for p,m in pairs(self.actions:GetChildren())do local C=false;if selectedEntities then for q,D in pairs(selectedEntities)do if!IsValid(D)then continue end;if!m.Action:CanUseOnClass(D:GetClass())then C=true;break end end elseif m.Action.selectionclass||m.Action:IsSelectionRequired()then C=true end;m:SetVisible(!C)if!C then r=r+1;m:SetIndex(r)else m:SetIndex(0)end end;self.actions:InvalidateLayout(true)end;function a:SelectActionConfig(t,A)if t:IsClientside()||t:IsShared()then self:SelectAction(t,true,selectedEntities,A.data)end end;function a:SelectAction(p,E,selectedEntities,...)local t=istable(p)&&p||srp.rts.Get(p)local F=t:IsWorldClick()||t:IsUnit()if F then self:DeselectAction(self.SelectedAction)end;self.SelectedAction=F&&t.id||self.SelectedAction;if F then self:SetSelected(self.SelectedAction)end;if t:IsClientside()||t:IsShared()then if t:_OnSelected(LocalPlayer(),selectedEntities,...)then E=true end end;if!E&&(t:IsServerside()||t:IsShared())then srp.rts.RequestAction(t.internal,selectedEntities)end end;function a:DeselectAction(p,E)if!p then return end;local t=srp.rts.Get(p)if t:IsClientside()||t:IsShared()then t:_OnDeselected(LocalPlayer())end;if!E&&(t:IsServerside()||t:IsShared())then srp.rts.RequestDeselect(t.internal)end end;function a:DoAction(G,H,selectedEntities)if!self.SelectedAction then return end;local I=LocalPlayer()local J=srp.rts.GetDroneTrace(I,G,H)local t=srp.rts.Get(self.SelectedAction)if t:IsClientside()||t:IsShared()then t:_OnWorldClick(I,selectedEntities,J.HitPos)end;if t:IsDeselectOnUse()then self:DeselectAction(t.id,true)self.Controls:SetSelected(nil)end;if t:IsServerside()||t:IsShared()then srp.rts.RequestAction(t.internal,selectedEntities,J.HitPos)end;if t:ShouldClearData()then t:ClearData()end end;function a:OnFilter(K)self._OnFilter=K end;function a:_OnFilter()end;function a:OnActionRequested(L)self._OnActionRequested=L;return self end;function a:_OnActionRequested(p)end;function a:OnActionModeChanged(L)self._OnActionModeChanged=L;return self end;function a:_OnActionModeChanged()end;function a:Paint(M,N)draw.Box(0,0,M,N,srp.rts.Style.background)surface.SetMaterial(b)surface.SetDrawColor(srp.rts.Style.gradient)surface.DrawTexturedRect(0,0,M,N)surface.SetDrawColor(101,101,101,114)surface.DrawOutlinedRect(5,5,M-10,N-10,1)end;vgui.Register('srp_rtsactions',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/optimize/sounds_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/restart/restart_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/statistics/statcapture_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/simroom/simroom_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingbattalion_ui.lua:
local a={}local b=Color(0,0,0,222)local c=Color(50,50,200,200)function a:SetupPanels()self:AddPanel('srp_label',function(d)d:SetContentAlignment(5)d:SetSize(ScrW(),60)d:SetFont'ui_header.xl'self.title=d end)self:AddPanel('srp_label',function(d)d:SetContentAlignment(5)d:SetSize(ScrW(),80)d:SetFont'ui_label.l'self.text=d end)self:AddPanel('srp_grid',function(e)e:SetSize(95,190)e:SetAutoHeight(true)self.grid=e end)end;function a:Populate(f)self.step=f;self.title:SetText(f.title)self.text:SetText(f.text)self:CreateButton()self:DisplayBattalions()end;function a:DisplayBattalions()local g=LocalPlayer():GetAllegianceID()if!g then return end;local h=0;local i={}for j,k in ipairs(srp.groups.GetAll(true))do if h>5 then break end;if k.allegiance!=g then continue end;if k:GetHidden()||k:GetParent()then continue end;srp.ui.Create('srp_panel_rounded',function(l)l:DockPadding(0,0,0,0)l:DockMargin(0,0,0,0)l:SetSize(95,160)l:SetBackgroundColor(col.midnight)l:AddPanel('srp_groupplate',function(m)m:Dock(FILL)m:SetGroup(l,k,true)m.inspect:SetText''m.inspect:LeftClick(function()end)end)self.grid:AddItem(l)end)h=h+1 end;self.grid:SetWide(100*h)self.grid:SetPos((ScrW()-98*h)*.5,ScrH()*.35)end;function a:PerformLayout(n,o)self.title:SetPos(0,o*.2)self.text:SetPos(0,o*.6)end;vgui.Register('srp_training_battalions',a,'srp_training_base')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingcitations_ui.lua:
local a={}local b=Color(0,0,0,222)local c=Color(50,50,200,200)function a:SetupPanels()self:AddPanel('srp_label',function(d)d:SetContentAlignment(5)d:SetTall(60)d:SetFont'ui_header.xl'd:Dock(TOP)self.title=d end)self:AddPanel('srp_label',function(d)d:SetContentAlignment(5)d:SetTall(120)d:SetFont'ui_label.l'd:Dock(TOP)self.text=d end)self:AddPanel('srp_panel',function(e)e:Dock(FILL)e:DockPadding(ScrW()*.05,50,ScrW()*.05,80)e:SetBackgroundColor(col.transparent)e:AddPanel('ui_scrollpanel',function(f)f:Dock(FILL)self.scroll=f end)end)end;function a:Populate(g)self.step=g;self.title:SetText(g.title)self.text:SetText(g.text)self:CreateButton()self:DisplayCitations()end;function a:DisplayCitations()local h=self.scroll:GetCanvas()local i=srp.jail.GetReasons()for j,k in pairs(i)do self:AddCitation(k)end end;local l=Color(222,222,222,200)function a:AddCitation(m)local n=m.sevdata.color:Copy()n.a=200;srp.ui.Create('srp_panel',function(e)e:SetParent(self.scroll:GetCanvas())e:SetTall(50)e:Dock(TOP)e:DockMargin(0,0,0,0)e:DockPadding(10,5,5,5)e:AddPanel('srp_label',function(d)d:SetText(m.name)d:SetTextColor(col.black)d:SetFont'ui_header.s'd:Dock(FILL)end)e.Paint=function(o,p,q)draw.Box(0,1,p,q-2,l)draw.Box(0,1,4,q-2,n)end end)end;vgui.Register('srp_training_citations',a,'srp_training_base')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingcontainer_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingwelcome_ui.lua:
local a={}function a:SetupPanels()self:AddPanel('srp_label',function(b)b:SetContentAlignment(5)b:SetSize(ScrW(),80)b:SetFont'ui_header.xl'self.title=b end)self:AddPanel('srp_label',function(b)b:SetContentAlignment(5)b:SetSize(ScrW(),60)b:SetFont'ui_label.l'self.text=b end)end;function a:Populate(c)self.title:SetText(c.title)self.text:SetText(c.text)end;function a:PerformLayout(d,e)self.title:SetPos(0,e/2-80)self.text:SetPos(0,e/2-15)end;vgui.Register('srp_training_welcome',a,'srp_training_base')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/ui/triumph_ui.lua:
local a={}local b=Color(255,255,255,100)function a:Init()self.objectives={}self:DockPadding(10,5,10,0)self:SetMouseInputEnabled(false)self:SetBackgroundColor(col.grey_dark)self:AddPanel('srp_panel',function(c)c:DockMargin(0,0,0,5)c:DockPadding(0,0,0,0)c:SetBackgroundColor(col.transparent)c:Dock(TOP)c:SetTall(55)c:AddPanel('srp_panel',function(c)c:SetBackgroundColor(col.transparent)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:Dock(TOP)c:SetTall(32)c:AddPanel('DImage',function(d)d:SetSize(32,32)d:Dock(LEFT)d:SetMaterial(mat)d:SetMouseInputEnabled(false)d:DockMargin(1,1,10,1)self.icon=d end)c:AddPanel('srp_label',function(e)e:Dock(FILL)e:SetTextColor(col.white_dark)e:SetFont'ui_header.s'e:SetText'Achievement'e:SetContentAlignment(7)e:DockMargin(0,0,0,0)self.name=e end)end)c:AddPanel('srp_label',function(e)e:Dock(TOP)e:SetTextColor(col.white_dark)e:SetFont'ui_header.s'e:SetText'Achievement Description'e:SetContentAlignment(7)e:SetTall(18)e:DockMargin(0,0,0,0)e:SetWrap(true)self.description=e end)end)self:AddPanel('ui_scrollpanel',function(f)f:Dock(FILL)f:SetMouseInputEnabled(true)self.scroll=f end)end;function a:Populate(g)self.triumph=g;self.name:SetText(g:GetName())self.description:SetText(g:GetDescription()||'')self.completed=g:IsCompleted()self.outline=g.outline||col.black;if g.color then self.triumphcolor=g.color:Copy()self.triumphcolor.a=150 end;local h=g:GetMaterial()if h then self.icon:SetMaterial(h)end;self:PopulateObjectives()end;function a:PopulateObjectives()local g=self.triumph;local i=self.scroll:GetCanvas()local j=g:GetObjectives()||{}for k,l in pairs(j)do srp.ui.Create('srp_triumphobj',function(c)c:SetParent(i)c:Dock(TOP)c:Populate(g,k,l,self.triumphcolor)self.objectives[k]=c end)end end;local m=Color(100,100,255,100)local b=Color(0,0,0,100)local n=Color(0,0,0,255)local o=24;function a:Paint(p,q)draw.RoundedBox(4,0,0,p,q,b)draw.RoundedBox(4,2,2,p-4,q-4,b)draw.Box(1,o-4,p-2,8,self.outline||n)draw.RoundedBox(4,1,1,p-2,o,n)end;vgui.Register('srp_triumph',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/ui/triumphtitlepreview_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/ui/triumphwindow_ui.lua:
local a={}local b=Material('materials/galactic/ui/triumphs/background.png','smooth noclamp')local c=Color(255,255,255,150)local d={Default={color=Color(255,255,255,150),material=Material('galactic/ui/triumphs/pvpcombat.png','smooth noclamp')},Minigames={color=Color(255,255,255,150),material=Material('galactic/ui/talents/chance.png','smooth noclamp')},Gamemaster={color=Color(255,0,0,150),material=Material('galactic/ui/rts/protection.png','smooth noclamp')},['PvP Combat']={color=Color(255,255,255,150),material=Material('galactic/ui/triumphs/pvpcombat.png','smooth noclamp')},['PvE Combat']={color=Color(255,255,255,150),material=Material('galactic/ui/triumphs/pvecombat.png','smooth noclamp')},Combat={color=Color(255,255,255,150),material=Material('galactic/ui/triumphs/combat.png','smooth noclamp')},Battlepass={color=Color(150,150,255,150),material=Material('galactic/ui/triumphs/package.png','smooth noclamp')},Events={color=Color(255,255,255,150),material=background},Utility={color=Color(255,255,255,150),material=background},Halloween={color=col.orange:Copy(),material=Material('galactic/seasonal/halloween/ghost.png','smooth noclamp')},Christmas={color=col.green:Copy(),material=Material('galactic/seasonal/christmas/santa.png','smooth noclamp')},Seasonal={color=Color(255,255,255,150),material=Material('galactic/seasonal/valentines/triumph.png','smooth noclamp')},Collectables={material=Material('materials/galactic/ui/menu/monkey.png','smooth noclamp')},Miscellaneous={color=Color(255,255,255,150),material=Material('galactic/ui/triumphs/miscellaneous.png','smooth noclamp')}}local background=Material'materials/galactic/sup_bg.jpg'local e=Material'materials/galactic/sup_logo.png'local f=Material'gui/gradient'function a:Init()self:SetTitle'Achievements'self:SetSize(1153,600)self:Center()self:MakePopup()self:SetBackgroundColor(col.midnight_dark)self:DockPadding(1,30,1,1)self:AddPanel('ui_scrollpanel',function(g)g:Dock(FILL)g:SetAlpha(0)g:AlphaTo(255,.5,0)self.scroll=g;self:DisplayShowcase()srp.ui.Create('srp_grid',function(h)h:Dock(TOP)h:SetAutoHeight(true)h:DockPadding(2,2,2,2)h:SetSpacing(12,10)h.OnComplete=function(i,j)i:SetTall(j+20)self.scroll:InvalidateLayout(true)end;g:AddItem(h)self.grid=h end)end)self:AddPanel('srp_panel',function(k)k:Dock(LEFT)k:SetWide(175)k:SetBackgroundColor(col.midnight)k:DockMargin(0,0,0,0)self.filters=k end)self:AddFilter'All'self:DisplayFilters()self:Refresh()end;function a:DisplayShowcase()local l=srp.triumphs.GetSection'spotlight'local m=l&&l[1]if!m then return end;local n=ui.col.SUP:Copy()n.a=100;local o=m:GetNextObjective()local p=m:GetObjective(o)||0;local q=m:GetLocalData(o)||0;local r=m:GetObjectiveDescription(o)local s=m:GetSpotlightTextColor()local t,u=m:GetSpotlightColor()local v=m:GetSpotlightCompletedColor()||Color(120,120,120,100)local w=m:GetSpotlightTextColor()||col.white;t=t||Color(0,0,0,100)u=u||Color(0,0,0,100)self.spotlightTargetVal=p;self.spotlight=m;self:AddPanel('srp_panel_rounded',function(k)k:Dock(TOP)k:SetTall(150)k:DockMargin(0,0,0,0)k:DockPadding(20,0,20,0)k.Paint=function(x,y,j)surface.SetDrawColor(255,255,255,255)surface.SetMaterial(background)surface.DrawTexturedRect(-(3840/2),-(2160/2),3840,2160)surface.SetDrawColor(u)surface.DrawRect(0,0,y,j)if self.spotlightvalue>=self.spotlightTargetVal then surface.SetDrawColor(v)else surface.SetDrawColor(t)end;surface.SetMaterial(f)surface.DrawTexturedRect(0,0,y,j)draw.SimpleText('Special Event!','ui_label.r',180,35,w,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)end;k.PaintOver=function(x,y,j)if self.spotlightvalue>=self.spotlightTargetVal then surface.SetDrawColor(v)else surface.SetDrawColor(50,50,50,140)end;surface.DrawOutlinedRect(0,0,y,j,1)end;k:AddPanel('srp_image',function(z)z:SetSize(200,200)z:SetPos(-25,(150-200)/2)z:SetMaterial(m.material,true)z:SetMouseInputEnabled(false)end)k:AddPanel('srp_panel',function(k)k:Dock(RIGHT)k:SetWide(250)k:SetBackgroundColor(col.white_dark)k:DockMargin(0,0,25,0)k.Paint=function()end;k:AddPanel('srp_label',function(A)A:Dock(TOP)A:SetFont'ui_header.l'A:SetText(string.Comma(q)..' of '..string.Comma(p))A:SetContentAlignment(3)A:DockPadding(0,20,0,0)A:DockMargin(0,0,0,0)A:SetTall(75)A:SetTextColor(w)self.spotlightvalue=q;self.spotlightLbl=A end)k:AddPanel('srp_label',function(A)A:Dock(FILL)A:SetFont'ui_label.l'A:SetTextColor(w)A:SetText(r)A:SetContentAlignment(9)A:DockPadding(0,0,0,0)A:DockMargin(0,0,0,0)end)end)k:AddPanel('srp_label',function(A)A:Dock(TOP)A:SetFont'ui_header.l'A:SetText(m:GetName())A:SetTextColor(w)A:SetContentAlignment(1)A:SetTall(80)A:DockMargin(160,0,0,0)A:DockPadding(0,0,0,0)end)k:AddPanel('srp_label',function(A)A:Dock(FILL)A:SetFont'ui_header.r'A:SetText(m:GetDescription())A:SetTextColor(w)A:SetContentAlignment(7)A:SetTall(90)A:DockMargin(160,0,0,0)A:DockPadding(0,0,0,0)end)end)hook('OnTriumphUpdated',self,function(x,m)if x==self&&m.id==x.spotlight then local o=m:GetNextObjective()local p=m:GetObjective(o)local q=m:GetLocalData(o)||0;x.spotlightvalue=q;x.spotlightLbl:SetText(string.Comma(q)..' of '..string.Comma(p))end end)end;function a:OnRemove()hook.Remove('OnTriumphUpdated',self)end;function a:Refresh()self.grid:Clear()self:SetLoading(true)srp.triumphs.GetProgress(function(B)self:SetLoading(false)if B then self:AddTriumphs()else self:DisplayError()end end)end;function a:DisplayFilters()local C=srp.triumphs.GetSectionNames()for D=1,#C do local E=C[D]if E=='spotlight'then continue end;self:AddFilter(E)end end;function a:Filter(F)local G=!F||F=='All'self.completed=0;self.maxPoints=0;self.points=0;for H,k in ipairs(self.grid:GetChildren())do if k&&k.Section then k:SetVisible(G||k.Section==F||false)if k.Triumph then self:TrackStats(k.Triumph)end end end;self:DisplayStats()end;local I=Color(50,50,50,255)function a:AddFilter(J)local K=d[J]||d.Default;self.filters:AddPanel('srp_button_tag_rounded',function(L)L:Dock(TOP)L:SetTall(48)L:SetText(J)L:SetFont'ui_label.rb'L:SetTextColor(col.white)L:SetBackgroundColor(col.midnight_dark)L:SetHoverColor(col.midnight_light)L:DockMargin(2,2,2,2)L:SetMaterial(K.material)L:SetMaterialBackground(I)L:LeftClick(function()self:Filter(J)end)end)end;function a:AddSectionHeader(M)local K=d[M]||d.Default;srp.ui.Create('srp_button_tag_rounded',function(L)L:SetSize(945,50)L:SetText(M)L:SetFont'ui_label.xl'L:SetTextColor(col.white)L:SetBackgroundColor(col.transparent)L:SetHoverColor(col.transparent)L:DockMargin(2,2,2,2)L:SetMaterial(K.material)L:SetMaterialBackground(col.transparent)L.Section=M;L:SetDisabled(true)self.grid:AddItem(L)end)end;function a:AddTriumph(m,N)srp.ui.Create('srp_triumph',function(k)k:SetAlpha(0)k:SetSize(945,150)k:Populate(m)k:AlphaTo(255,.05,.01*N)k.Triumph=m;k.Section=m:GetMenuSection()self.grid:AddItem(k)end)self:TrackStats(m)end;function a:TrackStats(m)self.completed=self.completed+(m:IsCompleted()&&1||0)self.maxPoints=self.maxPoints+m:GetPoints()self.points=self.points+(m:IsCompleted()&&m:GetPoints()||0)end;function a:DisplayStats()self:InvalidateLayout(true)self.grid:InvalidateLayout(true)end;function a:AddTriumphs()local C=srp.triumphs.GetSectionNames()self.completed=0;self.maxPoints=0;self.points=0;for D=1,#C do local E=C[D]if E=='spotlight'then continue end;self:AddSectionHeader(E)local O=srp.triumphs.GetSection(E)for H,m in ipairs(O)do self:AddTriumph(m,m.internal)end end;self:DisplayStats()end;function a:DisplayError()chat.AddText(col.red,'ERROR')end;vgui.Register('srp_triumphwindow',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trivia/trivia_cl.lua:
srp.trivia=srp.trivia||{}net.Receive('srp.trivia.Create',function()local a=net.ReadEntity()if IsValid(a)then a:DisplayCreationMenu()end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/tutorial/tutorial_cl.lua:
srp.tutorial=srp.tutorial||{}srp.tutorial.tips={}function srp.tutorial.ShowTip(a)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/attachmentmeta_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/weapons_cl.lua:
srp.weapons=srp.weapons||{}local a=ScrW()local b=ScrH()local c=Color(255,255,255,150)local d=Color(255,255,255,150)function srp.weapons.DrawCrosshair(e,f,g,h)if!cvar.GetValue('weapon_crosshair')then return end;e=e||a*.5;f=f||b*.5;if cvar.GetValue('sup_crosshair')then crosshair.DrawCustomCrosshair(e,f,g,h)return end;c.a=g;surface.SetDrawColor(c)surface.DrawRect(e-12,f,10,1)surface.DrawRect(e+4,f,10,1)surface.DrawRect(e,f-12,1,10)surface.DrawRect(e,f+4,1,10)end;function srp.weapons.DrawCircleCrosshair(e,f)if!cvar.GetValue('weapon_crosshair')then return end;e=e||a*.5;f=f||b*.5;draw.RoundedBox(12,e-3,f-3,6,6,d)end;crosshair=crosshair||{}local i=20;local j=100;local k=10;local l=0;local m=col.green:Copy()local n=function(o,p,q)timer.Simple(0,function()crosshair.Update()end)end;local r=cvar.Register('sup_crosshair'):SetDefault(false,true):AddMetadata('Menu','Enable Custom Crosshair'):AddMetadata('Category','Crosshair'):SetDescription('Enables the custom crosshair.'):AddCallback(n)local r=cvar.Register('sup_crosshaircircle'):SetDefault(true,true):AddMetadata('Menu','Crosshair Circle'):AddMetadata('Category','Crosshair'):SetDescription('Enable a circle in the centre of your crosshair.'):AddCallback(n)local s=cvar.Register('sup_crosshairalpha'):SetDefault(.85,true):AddMetadata('Menu','Crosshair Alpha'):AddMetadata('Category','Crosshair'):SetDescription('Set the Crosshair\'s alpha.'):AddMetadata('Type','number'):AddMetadata('Min',.25):AddMetadata('Max',1):AddMetadata('Value',true):AddCallback(n)local s=cvar.Register('sup_crosshairanim'):SetDefault(true,true):AddMetadata('Menu','Crosshair Animation'):AddMetadata('Category','Crosshair'):SetDescription('Animate the crosshair when the weapon fires.'):AddCallback(n)local t=cvar.Register('sup_crosshairsize'):SetDefault(.08,true):AddMetadata('Menu','Crosshair Size'):AddMetadata('Category','Crosshair'):SetDescription('The size of the crosshair bars.'):AddMetadata('Type','number'):AddMetadata('Min',0):AddMetadata('Max',1):AddMetadata('Value',true):AddCallback(n)local u=cvar.Register('sup_crosshairthickness'):SetDefault(.10,true):AddMetadata('Menu','Crosshair Thickness'):AddMetadata('Category','Crosshair'):SetDescription('The thickness of the crosshair bars.'):AddMetadata('Type','number'):AddMetadata('Min',0):AddMetadata('Max',1):AddMetadata('Value',true):AddCallback(n)local v=cvar.Register('sup_crosshairgap'):SetDefault(0.3,true):AddMetadata('Menu','Crosshair Gap'):AddMetadata('Category','Crosshair'):SetDescription('The gap between each crosshair bar.'):AddMetadata('Type','number'):AddMetadata('Min',-1):AddMetadata('Max',1):AddMetadata('Value',true):AddCallback(n)local w={}local function x(y)return math.Round(y*i)end;local function z(A)return math.Round(A*j)end;local function B(C)return math.Round(C*k+l)end;local function D(E,F,G)return{pos=E,size=F,color=G}end;function crosshair.Update()w={}local A=z(cvar.GetValue('sup_crosshairsize')||1)local y=x(cvar.GetValue('sup_crosshairthickness')||1)local C=B(cvar.GetValue('sup_crosshairgap')||1)local H=cvar.GetValue('sup_crosshairalpha')||1;local m=Color(255,255,255,H)if cvar.GetValue('sup_crosshaircircle')then table.insert(w,D({circle=true,x=-1,y=-1},{w=2,h=2},m))end;table.insert(w,D({x=-y/2,y=-A-C,animx=0,animy=-1},{w=y,h=A},m))table.insert(w,D({x=-y/2,y=C,animx=0,animy=1},{w=y,h=A},m))table.insert(w,D({x=-A-C,y=-y/2,animx=-1,animy=0},{w=A,h=y},m))table.insert(w,D({x=C,y=-y/2,animx=1,animy=0},{w=A,h=y},m))end;function crosshair.DrawCustomCrosshair(e,f,g,h)local H=cvar.GetValue('sup_crosshairalpha')||1;if!cvar.GetValue('sup_crosshairanim')then h=0 else h=math.max(0,h)end;render.PushFilterMag(TEXFILTER.ANISOTROPIC)render.PushFilterMin(TEXFILTER.ANISOTROPIC)draw.NoTexture()for I,J in ipairs(w)do local col=J.color;col.a=H*g;if J.pos.circle then draw.RoundedBox(6,e+J.pos.x,f+J.pos.y,J.size.w,J.size.h,col)else draw.Box(e+J.pos.x+J.pos.animx*h,f+J.pos.y+J.pos.animy*h,J.size.w,J.size.h,col)end end;render.PopFilterMag()render.PopFilterMin()end;concommand.Add('srp_crosshair',function(K)srp.ui.Create('srp_window',function(L)L:SetSize(800,400)L:Center()L:MakePopup()L:CenterVertical(0.75)L:SetBackgroundColor(col.white_dark)L:AddPanel('srp_setting_container',function(M)M:SetTall(60)M:Populate(cvar.Get('sup_crosshaircircle'))M:Dock(TOP)end)L:AddPanel('srp_setting_container',function(M)M:SetTall(60)M:Populate(cvar.Get('sup_crosshairalpha'))M:Dock(TOP)end)L:AddPanel('srp_setting_container',function(M)M:SetTall(60)M:Populate(cvar.Get('sup_crosshairsize'))M:Dock(TOP)end)L:AddPanel('srp_setting_container',function(M)M:SetTall(60)M:Populate(cvar.Get('sup_crosshairthickness'))M:Dock(TOP)end)L:AddPanel('srp_setting_container',function(M)M:SetTall(60)M:Populate(cvar.Get('sup_crosshairgap'))M:Dock(TOP)end)end)end)crosshair.Update()hook('OnScreenSizeChanged',function(N,O,P,Q)a=P;b=Q end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/ui/attachmentmenu_ui.lua:
local a={}function a:Init()self:SetTitle'Weapon Attachments'self:SetSize(1200,700)self:DockPadding(1,30,1,1)self:SetBorderColor(col.grey_light)self:Center()self:MakePopup()self.attachmentents={}self.attachmentinfo={}self:AddPanel('srp_panel',function(b)b:SetWide(280)b:Dock(LEFT)b:SetBackgroundColor(col.grey_light)b:SetBorderColor(col.grey)b:DockMargin(0,0,0,0)b:DockPadding(0,0,0,0)b:AddPanel('srp_label',function(c)c:SetText' Attachments'c:SetFont'ui_header.r'c:DockMargin(0,0,0,5)c:DockPadding(0,0,0,0)c:Dock(TOP)c:SetTall(40)c.Paint=function(d,e,f)surface.SetDrawColor(col.grey_dark)surface.DrawRect(0,0,e,f)surface.SetDrawColor(0,0,0,255)surface.DrawLine(0,f-1,e,f-1)end end)b:AddPanel('srp_dropdown',function(g)g:Dock(TOP)g:DockMargin(5,0,5,5)g:OnSelect(function(d,h,i)self:PopulateAttachments(i.classid,i.weapon)self.selectedweapon=i.classid end)self.dropdown=g end)b:AddPanel('ui_scrollpanel',function(j)j:Dock(FILL)self.attachmentlist=j end)end)self:AddPanel('srp_panel',function(b)b:Dock(FILL)b:SetBackgroundColor(col.grey_light)b:DockMargin(0,0,0,0)b:DockPadding(0,0,0,0)b:AddPanel('srp_modelpanel',function(j)j:Dock(FILL)self.overview=j end)b:AddPanel('srp_grid',function(k)k:DockMargin(0,0,0,0)k:SetPos(5,5)k:SetSize(910,200)self.top=k end)b:AddPanel('srp_grid',function(k)k:DockMargin(0,0,0,0)k:SetPos(5,495)k:SetSize(910,200)self.bottom=k end)end)hook('OnAttachmenMenuRequestPreview',self,self.DisplayAttachment)end;function a:OnRemove()hook.Remove('OnAttachmenMenuRequestPreview',self)end;function a:Populate()local l=LocalPlayer():GetActiveWeapon()local m=IsValid(l)&&l:GetClass()||''local n=srp.WeaponAttachments.GetAllClasses()for o,p in ipairs(n)do local q=weapons.GetStored(p)if q then local r=srp.WeaponAttachments.GetAllByWeapon(p)if r&&table.Count(r)>0 then self.dropdown:AddOption(q.PrintName||p,{classid=p,weapon=q},nil,m==p)end end end end;function a:PopulateAttachments(p,q)local s=self.attachmentlist:GetCanvas()s:Clear()self:ClearAttachments()local r=srp.WeaponAttachments.GetAllByWeapon(p)if!r||table.Count(r)==0 then return end;local t={}for o,u in pairs(r)do for v=1,#u.slot do t[u.slot[v]]=t[u.slot[v]]||{}table.insert(t[u.slot[v]],u)end end;self.classid=p;if!self.weaponmodel then self.weaponmodel=self.overview:AddModel(q.ViewModel,q.UIViewPosOffset||Vector(-30,-2,10),q.UIViewAngOffset||Angle(0,90,0))else self.weaponmodel:SetModel(q.ViewModel)self.weaponmodel:SetPos(q.UIViewPosOffset||Vector(-30,-2,10))self.weaponmodel:SetAngles(q.UIViewAngOffset||Angle(0,90,0))end;for w,x in pairs(t)do local y=srp.WeaponAttachments.Slots[w]if!y then continue end;srp.ui.Create('srp_attachmentslot',function(z)z:SetParent(s)z:Dock(TOP)z:SetTall(120)z:Populate(p,q,y,x)end)end end;function a:DisplayAttachment(y,u,A)self:RemoveAttachment(y.Id)local B=self.overview:AddModel(u.ViewModel)B:SetParent(self.weaponmodel)B:AddEffects(EF_BONEMERGE)B.slot=y;B.attachment=u;self.attachmentents[y.Id]=B;self:DisplayAttachmentInfo(y,u)if!A then cmd.Run('setattachment',self.classid,y.Id,u.internalid)end end;function a:RemoveAttachment(w)if!IsValid(self.attachmentents[w])then return end;self:RemovettachmentInfo(w)self.attachmentents[w]:Remove()self.attachmentents[w]=nil end;function a:DisplayAttachmentInfo(y,u)if IsValid(self.attachmentinfo[y.Id])then self.attachmentinfo[y.Id]:Populate(y,u)else srp.ui.Create('srp_attachmentinfo',function(b)self.attachmentinfo[y.Id]=b;b:Populate(y,u)if#self.top:GetChildren()<4 then self.top:AddItem(b)else self.bottom:AddItem(b)end end)end end;function a:RemovettachmentInfo(y)if IsValid(self.attachmentinfo[y])then self.attachmentinfo[y]:Remove()end end;function a:ClearAttachments()for w,B in pairs(self.attachmentents)do if IsValid(B)then B:Remove()end end;for C,b in pairs(self.attachmentinfo)do if IsValid(b)then b:Remove()end end;self.attachmentinfo={}self.attachmentents={}end;vgui.Register('srp_attachments',a,'srp_window')
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/starmap/ui/starmap_ui.lua:
local a={}function a:Init()local b,c=ScrW(),ScrH()self:SetTitle'The Starmap'self:DockPadding(1,32,1,1)self:SetSize(b*.8,c*.8)self:SetBackgroundColor(col.midnight_dark)self:Center()self:MakePopup()self:AddPanel('srp_starmap_list',function(d)d:Dock(LEFT)self.List=d end)self:AddPanel('srp_starmap_view',function(d)d:Dock(FILL)self.View=d end)self:AddPanel('srp_starmap_edit',function(d)local e=b*.2;d:SetSize(e,c-36)d:SetPos(b-e-1,33)self.Edit=d end)srp.starmap.RequestMapInfo()hook('OnStarmapListReceived',self,self.Populate)end;function a:Populate(f)self.List:Populate(f)end;function a:PerformLayout(b,c)self.BaseClass.PerformLayout(self,b,c)if IsValid(self.List)then self.List:SetWide(b*.2)end end;vgui.Register('srp_starmap',a,'srp_window')concommand.Add('srp_starmap',function()if IsValid(srp.starmap.ui)then srp.starmap.ui:Remove()end;srp.ui.Create('srp_starmap',function(d)srp.starmap.ui=d end)end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/map/busmanager/busses_cl.lua:
srp.bus=srp.bus||{}function srp.bus.OpenLoadingScreen()if IsValid(srp.bus.LoadingScreen)then srp.bus.LoadingScreen:Remove()end;srp.ui.Create('srp_bustravel',function(a)srp.bus.LoadingScreen=a end)end;function srp.bus.CloseLoadingScreen()if!IsValid(srp.bus.LoadingScreen)then return else srp.bus.LoadingScreen:AlphaTo(0,2,0,function()srp.bus.LoadingScreen:Remove()end)end end
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/activities/defcon_sh.lua:
srp.defcon=srp.defcon||{}srp.defcon.data={{name='Defcon 1',sub='Evacuate the ship!',col=col.red_dark,hookimage='triumphs/explosion.png'},{name='Defcon 2',sub='Defend integral parts of the ship!',col=col.red},{name='Defcon 3',sub='Man your battlestations!',col=col.orange},{name='Defcon 4',sub='Sweep the ship for tangos!',col=col.orange_light},{name='Defcon 5',sub='High Alert!',col=col.yellow},{name='Defcon 6',sub='At Ease.',col=col.green,close=true,hookimage='talents/meditate.png'},{name='Defcon Cow',sub='The Secret Cow Level.',col=col.pink,close=true},{name='Defcon Smirk',sub='Eggplant.',col=col.purple,close=true},{name='Defcon Chef',sub='Where\'s the lamb sauce?',col=col.green_light,close=true}}
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/credits/knives_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/events/failsafe_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/gamemaster/realtimestrategy/npcs_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/hangars_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/hud/emotes_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/hud/emotes_sh.lua:
local a={'models/player/jedi/knight/naturals_model.mdl','models/tfa/comm/gg/pm_sw_aayala.mdl','models/player/zhidus/jedi/twilek/twilek.mdl','models/galactic/twilek_female/twilek_female.mdl','models/player/sample/natrual/natrual/model.mdl','models/dannio/pm/left4lag/veritas.mdl'}srp.emotes.Register({Name='Salute',Me='salutes.',MeWith='salutes {name}.',Material=Material('galactic/emotes/salute_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/galactic/r2d2/r2d2.mdl'},sounds={Sound('galactic/emotes/r2d2/salute.mp3')},animations={ACT_GMOD_GESTURE_DISAGREE}},{type=EMOTE_ALL,args={},sounds={},animations={ACT_GMOD_TAUNT_SALUTE}}}})srp.emotes.Register({Name='Bow',Me='bows.',MeWith='bows to {name}.',Material=Material('galactic/emotes/wave_64.png','smooth noclamp'),Lookup={{type=EMOTE_PERMISSION,args='jedi',sounds={},animations={ACT_GMOD_GESTURE_BOW}}}})srp.emotes.Register({Name='Agree',Me='agrees.',MeWith='agrees with {name}.',Material=Material('galactic/emotes/agree_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/b4p/b4p_jawa.mdl'},sounds={Sound('galactic/emotes/jawa/agree.mp3')},animations={ACT_GMOD_GESTURE_AGREE}},{type=EMOTE_MODEL,args={'models/player/chewie.mdl'},sounds={Sound('galactic/emotes/wookiee/agree.mp3')},animations={ACT_GMOD_GESTURE_AGREE}},{type=EMOTE_MODEL,args={'models/galactic/r2d2/r2d2.mdl'},sounds={Sound('galactic/emotes/r2d2/agree.mp3')},animations={ACT_GMOD_GESTURE_DISAGREE}},{type=EMOTE_MODEL,args=a,sounds={Sound('galactic/emotes/twilek/agree.mp3')},animations={ACT_GMOD_GESTURE_AGREE}},{type=EMOTE_MODEL,args={'models/player/emperor_palpatine.mdl'},sounds={Sound('galactic/emotes/emperor/agree.mp3')},animations={ACT_GMOD_GESTURE_AGREE}},{type=EMOTE_ALIGNMENT,args={'CIVILIAN'},sounds={Sound('vo/npc/male01/ok01.wav'),Sound('vo/npc/male01/ok02.wav'),Sound('vo/npc/male01/yeah02.wav')},animations={ACT_GMOD_GESTURE_AGREE}},{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/yessir.wav'),Sound('galactic/characters/clone/emotes/rightaway.wav')},animations={ACT_GMOD_GESTURE_AGREE}}}})srp.emotes.Register({Name='Disagree',Me='disagrees.',MeWith='disagrees with {name}.',Material=Material('galactic/emotes/disagree_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/b4p/b4p_jawa.mdl'},sounds={Sound('galactic/emotes/jawa/disagree.mp3')},animations={ACT_GMOD_GESTURE_DISAGREE}},{type=EMOTE_MODEL,args={'models/player/chewie.mdl'},sounds={Sound('galactic/emotes/wookiee/disagree.mp3')},animations={ACT_GMOD_GESTURE_DISAGREE}},{type=EMOTE_MODEL,args={'models/galactic/r2d2/r2d2.mdl'},sounds={Sound('galactic/emotes/r2d2/disagree.mp3')},animations={ACT_GMOD_GESTURE_DISAGREE}},{type=EMOTE_MODEL,args=a,sounds={Sound('galactic/emotes/twilek/disagree.mp3')},animations={ACT_GMOD_GESTURE_DISAGREE}},{type=EMOTE_MODEL,args={'models/player/emperor_palpatine.mdl','models/nate159/swbf2015/playermodels/stormtrooper.mdl','models/nate159/swbf2015/playermodels/sandtrooper.mdl','models/kriegsyntax/starwars/admiral_playermodel.mdl','models/kriegsyntax/starwars/captain_playermodel.mdl','models/kriegsyntax/starwars/colonel_playermodel.mdl','models/kriegsyntax/starwars/commodore_playermodel.mdl','models/kriegsyntax/starwars/ensign_playermodel.mdl','models/kriegsyntax/starwars/general_playermodel.mdl','models/kriegsyntax/starwars/grandadmiral_playermodel.mdl','models/kriegsyntax/starwars/isbofficer_playermodel.mdl','models/kriegsyntax/starwars/lieutenant_playermodel.mdl','models/kriegsyntax/starwars/nco_playermodel.mdl','models/porky-da-corgi/starwars/mandalorians/bountyhunter.mdl'},sounds={},animations={ACT_GMOD_GESTURE_DISAGREE}},{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/negative.wav')},animations={ACT_GMOD_GESTURE_DISAGREE}}}})srp.emotes.Register({Name='Wisps',Me='does something suspicious.',MeWith='does something suspicious towards {name}.',Material=Material('galactic/seasonal/summer/wave.png','smooth noclamp'),Color=col.red:Copy(),CanUse=function(self,b)if b:GetLocation().emotes==false then return false else return b:HasUpgrade('newyear23_bundle')end end,Lookup={{type=EMOTE_ALL,args={},sounds={},animations={},use=function(self,b)srp.effect.Run(b,'Emote',{Emote='wisps'})end}}})srp.emotes.Register({Name='Glitterbomb',Me='Glitters for all.',MeWith='glitters for {name}.',Material=Material('galactic/seasonal/summer/wave.png','smooth noclamp'),Color=col.red:Copy(),CanUse=function(self,b)if b:GetLocation().emotes==false then return false else return b:HasUpgrade('newyear23_bundle')end end,Lookup={{type=EMOTE_ALL,args={},sounds={},animations={},use=function(self,b)srp.effect.Run(b,'Emote',{Emote='glitter'})end}}})srp.emotes.Register({Name='Lightbeam',Me='Shines bright',MeWith='Shines bright next to {name}.',Material=Material('galactic/seasonal/summer/wave.png','smooth noclamp'),Color=col.red:Copy(),CanUse=function(self,b)if b:GetLocation().emotes==false then return false else return b:HasUpgrade('newyear23_bundle')end end,Lookup={{type=EMOTE_ALL,args={},sounds={},animations={},use=function(self,b)srp.effect.Run(b,'Emote',{Emote='lightbeam'})end}}})srp.emotes.Register({Name='Storm',Me='freezes.',MeWith='Freezes next to {name}.',Material=Material('galactic/seasonal/summer/wave.png','smooth noclamp'),Color=col.red:Copy(),CanUse=function(self,b)if b:GetLocation().emotes==false then return false else return b:HasUpgrade('newyear23_bundle')end end,Lookup={{type=EMOTE_ALL,args={},sounds={},animations={},use=function(self,b)srp.effect.Run(b,'Emote',{Emote='storm'})end}}})srp.emotes.Register({Name='Blizzard',Me='freezes.',MeWith='Freezes next to {name}.',Material=Material('galactic/seasonal/summer/wave.png','smooth noclamp'),Color=col.red:Copy(),CanUse=function(self,b)if b:GetLocation().emotes==false then return false else return b:HasUpgrade('newyear23_bundle')end end,Lookup={{type=EMOTE_ALL,args={},sounds={},animations={},use=function(self,b)srp.effect.Run(b,'Emote',{Emote='blizzard'})end}}})srp.emotes.Register({Name='Santa Racer',Me='spots santa!',MeWith='spots santa!',Material=Material('galactic/seasonal/christmas/santa.png','smooth noclamp'),Color=col.purple:Copy(),CanUse=function(self,b)if b:GetLocation().emotes==false then return false end;if b:HasUpgrade('bp_winter2024')then if(b:GetTalentLevel('bp_winter2024')||0)>=34 then return true else return false end else return false end end,Lookup={{type=EMOTE_ALL,args={},sounds={},use=function(self,b)srp.effect.Run(b,'Emote',{Emote='SantaRacer'})end}}})srp.emotes.Register({Name='Spooky Scary Skeletons',Me='has turned into  a spooky skeleton.',MeWith='has turned into  a spooky skeleton.',Material=Material('galactic/seasonal/halloween/monster.png','smooth noclamp'),Color=col.purple:Copy(),CanUse=function(self,b)if b:GetLocation().emotes==false then return false end;if b:HasUpgrade('bp_halloween2024')then if(b:GetTalentLevel('bp_halloween2024')||0)>=40 then return true else return false end else return false end end,Lookup={{type=EMOTE_ALL,args={},sounds={},use=function(self,b)srp.effect.Run(b,'Emote',{Emote='SpookyScarySkeletons'})end}}})srp.emotes.Register({Name='Jaws',Me='is scared.',MeWith='is scared and looks at {name} for comfort.',Material=Material('galactic/seasonal/summer/shark.png','smooth noclamp'),Color=col.blue_light:Copy(),CanUse=function(self,b)if b:GetLocation().emotes==false then return false end;if b:HasUpgrade('bp_seasonthree2024')then if(b:GetTalentLevel('bp_seasonthree2024')||0)>=42 then return true else return false end else return false end end,Lookup={{type=EMOTE_ALL,args={},sounds={},use=function(self,b)srp.effect.Run(b,'Emote',{Emote='jaws'})end}}})srp.emotes.Register({Name='AMERICA',Me='shows their affection for America!',MeWith='shows their affection for America with {name}!',Material=Material('galactic/seasonal/summer/wave.png','smooth noclamp'),Color=col.red:Copy(),CanUse=function(self,b)if b:GetLocation().emotes==false then return false end;if b:HasUpgrade('summer2024_bundle')then return true else return false end end,Lookup={{type=EMOTE_ALL,args={},sounds={},animations={ACT_GMOD_TAUNT_CHEER},use=function(self,b)srp.effect.Run(b,'Emote',{Emote='america'})end}}})srp.emotes.Register({Name='Ocean Man',Me='sings the song of their people.',MeWith='sings the song of their people to {name}.',Material=Material('galactic/seasonal/summer/wave.png','smooth noclamp'),Color=col.blue_light:Copy(),CanUse=function(self,b)if b:GetLocation().emotes==false then return false end;if b:HasUpgrade('bp_seasontwo2023')then if(b:GetTalentLevel('bp_seasontwo2023')||0)>=39 then return true else return false end else return false end end,Lookup={{type=EMOTE_ALL,args={},sounds={},animations={ACT_GMOD_TAUNT_DANCE},use=function(self,b)srp.effect.Run(b,'Emote',{Emote='OceanMan'})end}}})srp.emotes.Register({Name='Show Gratitude',Me='shows gratitude.',MeWith='shows gratitude towards {name}.',Material=Material('galactic/emotes/salute_64.png','smooth noclamp'),Color=col.red_dark:Copy(),CanUse=function(self,b)if b:HasUpgrade('valentine_bundle')then return true else return false end end,Lookup={{type=EMOTE_ALL,args={},sounds={},animations={ACT_GMOD_TAUNT_SALUTE},use=function(self,b)local c=EffectData()c:SetScale(4)c:SetOrigin(b:GetPos()+Vector(0,0,50)+b:GetForward()*15)c:SetNormal(b:GetForward())util.Effect('effect_kiss',c)end}}})srp.emotes.Register({Name='Engaging',Me='engages the target.',MeWith='engages {name}.',Material=Material('galactic/emotes/halt_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/engaging.wav')},animations={ACT_GMOD_GESTURE_POINT}}}})srp.emotes.Register({Name='Objective Acquired',Me='has found the objective.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/objective.wav')},animations={ACT_SIGNAL_FORWARD}}}})srp.emotes.Register({Name='Hold',Me='signals to hold position.',MeWith='signals {name} to hold position.',Material=Material('galactic/emotes/halt_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/holdon.wav')},animations={ACT_SIGNAL_HALT}}}})srp.emotes.Register({Name='Move Out',Me='says to move out.',MeWith='tells {name} to move out.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/moveout.wav'),Sound('galactic/characters/clone/emotes/letsgo.wav')},animations={ACT_SIGNAL_FORWARD}}}})srp.emotes.Register({Name='Move Out - Urgent',Me='tells everyone to go.',MeWith='tells {name} to go.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/movemovemove.wav'),Sound('galactic/characters/clone/emotes/gogogo.wav')},animations={ACT_SIGNAL_FORWARD}}}})srp.emotes.Register({Name='Lets Go',Me='signals {name} to go',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/letsgo.wav')}}}})srp.emotes.Register({Name='Move Along',Me='says to move along.',MeWith='tells {name} to move along.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/emotes/stormtrooper/movealong.mp3')}}}})srp.emotes.Register({Name='Halt',Me='signals to halt.',MeWith='signals {name} to halt.',Material=Material('galactic/emotes/halt_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/emotes/stormtrooper/holdit.mp3')},animations={ACT_GMOD_GESTURE_POINT}}}})srp.emotes.Register({Name='Spread Out',Me='tells everyone to spread out.',MeWith='tells {name} to spread out.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/spreadout.wav')},animations={ACT_SIGNAL_HALT}}}})srp.emotes.Register({Name='Retreat',Me='signals to retreat.',MeWith='signals {name} to retreat.',Material=Material('galactic/emotes/wave_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/emotes/stormtrooper/retreat.wav')},animations={ACT_GMOD_GESTURE_BECON,ACT_SIGNAL_TAKECOVER}}}})srp.emotes.Register({Name='Blast Them',Me='yells to fire.',MeWith='yells to blast {name}.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/galactic/r2d2/r2d2.mdl'},sounds={Sound('galactic/emotes/r2d2/blastthem.mp3')}},{type=EMOTE_ALL,sounds={Sound('garrysmodgalactic/emotes/stormtrooper/blastthem.mp3'),Sound('galactic/emotes/stormtrooper/itsthemblastthem.mp3')}}}})srp.emotes.Register({Name='At ease',Me='is at ease.',MeWith='is at ease for {name}',Material=Material('galactic/emotes/agree_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALIGNMENT,args={'REPUBLIC'},boneanimation='atease'},{type=EMOTE_ALIGNMENT,args={'CIVILIAN'},boneanimation='atease'}}})srp.emotes.Register({Name='Bye',Me='waves goodbye.',MeWith='waves goodbye to {name}.',Material=Material('galactic/emotes/wave_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,args={},sounds={},animations={ACT_GMOD_GESTURE_WAVE}}}})srp.emotes.Register({Name='Cheer',Me='cheers in excitement.',MeWith='cheers at {name}.',Material=Material('galactic/emotes/cheer_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/b4p/b4p_jawa.mdl'},sounds={Sound('galactic/emotes/jawa/cheer.mp3')},animations={ACT_GMOD_TAUNT_CHEER}},{type=EMOTE_MODEL,args={'models/player/chewie.mdl'},sounds={Sound('galactic/emotes/wookiee/cheer.mp3')},animations={ACT_GMOD_TAUNT_CHEER}},{type=EMOTE_MODEL,args={'models/galactic/r2d2/r2d2.mdl'},sounds={Sound('galactic/emotes/r2d2/cheer.mp3')},animations={ACT_GMOD_TAUNT_CHEER}},{type=EMOTE_ALL,args={},sounds={Sound('vo/coast/odessa/male01/nlo_cheer01.wav'),Sound('vo/coast/odessa/male01/nlo_cheer02.wav')},animations={ACT_GMOD_TAUNT_CHEER}}}})srp.emotes.Register({Name='Vehicle - Stop',Me='yells to stop the vehicle.',MeWith='yells at {name} to stop the vehicle.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/stopvehicle.wav')},animations={ACT_SIGNAL_HALT}}}})srp.emotes.Register({Name='Vehicle - Bail Out',Me='tells everyone to bail out.',MeWith='tells {name} to bail out.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/bailout.wav'),Sound('galactic/characters/clone/emotes/getout.wav')},animations={ACT_SIGNAL_GROUP}}}})srp.emotes.Register({Name='Vehicle - Get In',Me='tells everyone to board the vehicle.',MeWith='tells {name} to board the vehicle.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/characters/clone/emotes/getaboard.wav')},animations={ACT_SIGNAL_GROUP}}}})srp.emotes.Register({Name='Taunt - Utini',Me='taunts to come closer.',MeWith='taunts {name} to come closer.',Material=Material('galactic/emotes/flamingo_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/b4p/b4p_jawa.mdl'},sounds={Sound('galactic/emotes/jawa/utini.mp3')},animations={ACT_GMOD_TAUNT_CHEER}}}})srp.emotes.Register({Name='Taunt - Come here',Me='taunts to come closer.',MeWith='taunts {name} to come closer.',Material=Material('galactic/emotes/flamingo_64.png','smooth noclamp'),Lookup={{type=EMOTE_PERMISSION,args='jedi',animations='taunt_reverse'}}})srp.emotes.Register({Name='Taunt - Victory',Me='signals for Victory.',MeWith='signals towards {name} for Victory.',Material=Material('galactic/emotes/flamingo_64.png','smooth noclamp'),Lookup={{type=EMOTE_PERMISSION,args='jedi',animations='taunt_heavy'}}})srp.emotes.Register({Name='Pose',Me='strikes a fierce pose.',MeWith='strikes a fierce pose at {name}.',Material=Material('galactic/emotes/flamingo_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={},animations={ACT_GMOD_TAUNT_PERSISTENCE}}}})srp.emotes.Register({Name='Follow Me',Me='says to follow.',MeWith='tell {name} to follow.',Material=Material('galactic/emotes/becon_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/b4p/b4p_jawa.mdl'},sounds={Sound('galactic/emotes/jawa/group.mp3')},animations={ACT_GMOD_GESTURE_WAVE}},{type=EMOTE_MODEL,args={'models/player/chewie.mdl'},sounds={Sound('galactic/emotes/wookiee/group.mp3')},animations={ACT_GMOD_GESTURE_WAVE}},{type=EMOTE_MODEL,args={'models/galactic/r2d2/r2d2.mdl'},sounds={Sound('galactic/emotes/r2d2/follow.mp3')},animations={ACT_GMOD_GESTURE_WAVE}},{type=EMOTE_ALL,sounds={Sound('galactic/emotes/stormtrooper/followme.mp3')},animations={ACT_GMOD_GESTURE_BECON}}}})srp.emotes.Register({Name='Move Forward',Me='signals to move forward.',MeWith='signals {name} to move forward.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/b4p/b4p_jawa.mdl'},sounds={Sound('galactic/emotes/jawa/forward.mp3')},animations={ACT_SIGNAL_FORWARD}},{type=EMOTE_MODEL,args={'models/player/chewie.mdl'},sounds={Sound('galactic/emotes/wookiee/forward.mp3')},animations={ACT_SIGNAL_FORWARD}},{type=EMOTE_MODEL,args=a,sounds={Sound('galactic/emotes/twilek/forward.mp3')},animations={ACT_SIGNAL_FORWARD}},{type=EMOTE_ALIGNMENT,args={'CIVILIAN'},sounds={Sound('vo/npc/male01/squad_follow02.wav'),Sound('vo/npc/Barney/squad_follow03.wav')},animations={ACT_SIGNAL_FORWARD}}}})srp.emotes.Register({Name='Work Finished',Me='says \'Your work here is finished my friend.\'',MeWith='tells {name} their work here is finished.',Material=Material('galactic/emotes/agree_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/emperor_palpatine.mdl'},sounds={Sound('galactic/emotes/emperor/workfinished.mp3')}}}})srp.emotes.Register({Name='You There',Me='directs their attention.',MeWith='directs their attention to {name}.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/emotes/stormtrooper/heyyouthere.mp3')}}}})srp.emotes.Register({Name='Spotted',Me='spots them.',MeWith='spots {name}.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/emotes/stormtrooper/thereisone.mp3')}}}})srp.emotes.Register({Name='Throw Item',Me='throws an item.',MeWith='throws an item towards {name}.',Material=Material('galactic/emotes/halt_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,animations={ACT_GMOD_GESTURE_ITEM_THROW}}}})srp.emotes.Register({Name='Give Item',Me='gives an item.',MeWith='gives an item to {name}.',Material=Material('galactic/emotes/halt_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,animations={ACT_GMOD_GESTURE_ITEM_GIVE}}}})srp.emotes.Register({Name='Stand Guard',Me='says to stand guard.',MeWith='tells {name} to stand guard.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/emotes/stormtrooper/standguard.mp3')}}}})srp.emotes.Register({Name='Wave',Me='waves hello.',MeWith='waves hello to {name}.',Material=Material('galactic/emotes/wave_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/b4p/b4p_jawa.mdl'},sounds={Sound('galactic/emotes/jawa/hey.mp3')},animations={ACT_GMOD_GESTURE_WAVE}},{type=EMOTE_MODEL,args={'models/player/chewie.mdl'},sounds={Sound('galactic/emotes/wookiee/hello.mp3')},animations={ACT_GMOD_GESTURE_WAVE}},{type=EMOTE_MODEL,args=a,sounds={Sound('galactic/emotes/twilek/hello.mp3')},animations={ACT_GMOD_GESTURE_WAVE}},{type=EMOTE_ALL,sounds={},animations={ACT_GMOD_GESTURE_WAVE}}}})srp.emotes.Register({Name='Scream',Me='flails their arms and screams.',MeWith='flails their arms and screams at {name}.',Material=Material('galactic/emotes/zombie_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/b4p/b4p_jawa.mdl'},sounds={Sound('galactic/emotes/jawa/scream.mp3')},animations={ACT_GMOD_GESTURE_TAUNT_ZOMBIE}},{type=EMOTE_MODEL,args={'models/player/chewie.mdl'},sounds={Sound('galactic/emotes/wookiee/scream.mp3')},animations={ACT_GMOD_GESTURE_TAUNT_ZOMBIE}},{type=EMOTE_MODEL,args=a,sounds={Sound('galactic/emotes/twilek/scream.mp3')},animations={ACT_GMOD_GESTURE_TAUNT_ZOMBIE}}}})srp.emotes.Register({Name='Set for Stun',Me='says to set for stun.',MeWith='tells {name} to set for stun.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/emotes/stormtrooper/setforstun.mp3')}}}})srp.emotes.Register({Name='Look Sir',Me='signals to look.',MeWith='signals {name} to look.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/emotes/stormtrooper/looksir.mp3'),Sound('galactic/emotes/stormtrooper/lookthere.mp3')},animations={ACT_SIGNAL_FORWARD}}}})srp.emotes.Register({Name='I Know',Me='knows.',MeWith='tells {name} that they know.',Material=Material('galactic/emotes/agree_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/emperor_palpatine.mdl'},sounds={Sound('galactic/emotes/emperor/iknow.mp3')}}}})srp.emotes.Register({Name='Check Identification',Me='demands to see some identifcation.',MeWith='demands to see {name}\'s identification.',Material=Material('galactic/emotes/forward_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,sounds={Sound('galactic/emotes/stormtrooper/identification.mp3')}}}})srp.emotes.Register({Name='Hands On Head',Me='puts their hands on their head',MeWith='Puts there hands on their head for {name}',Material=Material('galactic/emotes/agree_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,boneanimation='handsonhead'}}})srp.emotes.Register({Name='Hands Up',Me='puts their hands up',MeWith='Puts there hands up for {name}',Material=Material('galactic/emotes/agree_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,boneanimation='handsup'}}})srp.emotes.Register({Name='Crossed Arms',Me='puts their hands up',MeWith='Puts there hands up for {name}',Material=Material('galactic/emotes/agree_64.png','smooth noclamp'),Lookup={{type=EMOTE_ALL,boneanimation='crossedarms'}}})srp.emotes.Register({Name='Beckon',Me='Beckon everyone to come over.',MeWith='Beckons {name} to come over.',Material=Material('galactic/emotes/becon_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/b4p/b4p_jawa.mdl'},sounds={Sound('galactic/emotes/jawa/becon.mp3')},animations={ACT_GMOD_GESTURE_BECON}},{type=EMOTE_MODEL,args={'models/player/chewie.mdl'},sounds={Sound('galactic/emotes/wookiee/becon.mp3')},animations={}},{type=EMOTE_MODEL,args=a,sounds={Sound('galactic/emotes/twilek/becon.mp3')},animations={ACT_GMOD_GESTURE_BECON}},{type=EMOTE_ALL,args={},sounds={Sound('vo/npc/male01/overhere01.wav')},animations={ACT_GMOD_GESTURE_BECON}}}})srp.emotes.Register({Name='Laugh',Me='laughs.',MeWith='laughs at {name}.',Material=Material('galactic/emotes/laugh_64.png','smooth noclamp'),Lookup={{type=EMOTE_MODEL,args={'models/player/b4p/b4p_jawa.mdl'},sounds={Sound('galactic/emotes/jawa/laugh.mp3')},animations={ACT_GMOD_TAUNT_LAUGH}},{type=EMOTE_MODEL,args={'models/player/chewie.mdl'},sounds={Sound('galactic/emotes/wookiee/laugh.mp3')},animations={ACT_GMOD_TAUNT_LAUGH}},{type=EMOTE_MODEL,args=a,sounds={Sound('galactic/emotes/twilek/laugh.mp3'),Sound('galactic/emotes/twilek/laugh2.mp3')},animations={ACT_GMOD_TAUNT_LAUGH}},{type=EMOTE_MODEL,args={'models/player/emperor_palpatine.mdl'},sounds={Sound('galactic/emotes/emperor/laugh.mp3')},animations={ACT_GMOD_TAUNT_LAUGH}},{type=EMOTE_ALIGNMENT,args={'CIVILIAN'},sounds={Sound('vo/npc/barney/ba_laugh01.wav'),Sound('vo/npc/barney/ba_laugh02.wav'),Sound('vo/npc/barney/ba_laugh04.wav')},animations={ACT_GMOD_TAUNT_LAUGH}}}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/dailies_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/food_drink_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/modules_sh.lua:
srp.items.RegisterBase('MODULES',{name="Core Module",icon='materials/galactic/ui/foods/package.png',model=Model'models/galactic/me3fix/containerkitchen03.mdl',price=100,gui_position=Vector(0,0,10),weight=0,interaction={OnPickup={label='Pickup',callback=function(self,a,b,c,d,e)return b:AddItem(self,d)end}},CanEquip=function(self,a)if a:TakeInventoryItems(self.id)then return true end end})srp.items.Register('Modules','MODULE_DAMAGE',{base='MODULES',name='Power Booster',description='Increases weapon damage by 15%',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/powerup.png',rarity='common',scrap='METAL_SCRAP',scrapcount=5,affixlist={affixrange={min=1,max=1},affixes={wepdamage_add={min=10,max=25},wepdamage_multi={min=0.05,max=0.15}}}})srp.items.Register('Modules','MODULE_ACCURACY',{base='MODULES',name='Recoil Reducer',description='Improves weapon accuracy',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/accuracy.png',rarity='uncommon',scrap='METAL_SCRAP',scrapcount=5})srp.items.Register('Modules','MODULE_AMMO',{base='MODULES',name='Ammo Booster',description='Increases ammo capacity',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/extraammo.png',rarity='common',scrap='METAL_SCRAP',scrapcount=5})srp.items.Register('Modules','MODULE_SPREAD',{base='MODULES',name='Spread Reducer',description='Reduces the spread on shotguns',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/spread.png',rarity='rare'})srp.items.Register('Modules','MODULE_GLRANGE',{base='MODULES',name='Round Velocity',description='Increases the velocity on grenade launcher rounds.',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/triumphs/explosion.png',rarity='rare'})srp.items.Register('Modules','MODULE_GLDAMAGE',{base='MODULES',name='Damage Increase',description='Increases the damage on grenade launcher rounds.',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/triumphs/explosion.png',rarity='rare'})srp.items.Register('Modules','MODULE_GRENADERANGE',{base='MODULES',name='Blast Radius',description='Increases the blast radius on grenades.',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/triumphs/explosion.png',rarity='rare'})srp.items.Register('Modules','MODULE_GRENADEIMPACT',{base='MODULES',name='Impact Modifier',description='Turns grenades into impact grenades.',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/triumphs/target.png',rarity='rare'})srp.items.Register('Modules','MODULE_GRENADEDAMAGE',{base='MODULES',name='Damage Increase',description='Increased grenade damage',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/triumphs/attack.png',rarity='rare'})srp.items.Register('Modules','MODULE_ORANGEINFUSER',{base='MODULES',name='Orange Infuser',color=col.orange:Copy(),description='Makes your ammo glow orange',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/infuserorange.png',rarity='rare'})srp.items.Register('Modules','MODULE_ICEBLASTINFUSER',{base='MODULES',name='Iceblast Infuser',color=col.blue:Copy(),trade='TOKEN_XMAS',tradeamount=150,tradecolor=col.blue_light:Copy(),description='Makes your ammo glow iceyblasty',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/infuser.png',rarity='rare',cantrade=false,nodrop=true})srp.items.Register('Modules','MODULE_ICEBLUEINFUSER',{base='MODULES',name='Iceblue Infuser',color=col.blue_light:Copy(),trade='TOKEN_XMAS',tradeamount=150,tradecolor=col.blue:Copy(),description='Makes your ammo glow icey',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/infuser.png',rarity='rare',cantrade=false,nodrop=true})srp.items.Register('Modules','MODULE_XMASINFUSER',{base='MODULES',name='Christmas Infuser',color=col.red:Copy(),trade='TOKEN_XMAS',tradeamount=150,tradecolor=col.red_dark:Copy(),description='Makes your ammo glow christmasy',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/infuser.png',rarity='rare',cantrade=false,nodrop=true})srp.items.Register('Modules','MODULE_MAROONINFUSER',{base='MODULES',name='Maroon Infuser',color=col.maroon:Copy(),description='Makes your ammo glow maroon',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/infuserorange.png',rarity='rare',store='STORE_TRADER',trade='TRADERCOIN',tradeamount=info.Dev&&1||50})srp.items.Register('Modules','MODULE_ORANGEINFUSER',{base='MODULES',name='Orange Infuser',color=col.orange:Copy(),description='Makes your ammo glow orange',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/infuserorange.png',rarity='rare'})srp.items.Register('Modules','MODULE_GREENINFUSER',{base='MODULES',name='Green Infuser',color=col.green:Copy(),description='Makes your ammo glow green',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/infusergreen.png',rarity='rare'})srp.items.Register('Modules','MODULE_PURPLEINFUSER',{base='MODULES',name='Purple Infuser',color=col.purple:Copy(),description='Makes your ammo glow purple',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/infuserpurple.png',rarity='rare'})srp.items.Register('Modules','MODULE_VALENTINEINFUSER',{base='MODULES',name='Valentine Infuser',color=col.pink:Copy(),description='Makes your ammo glow pink for valentines',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/infuserpurple.png',rarity='rare',trade='VALENTINE_PETALS',tradeamount=500,buycount=2,CanUse=function(self,a)local f=srp.triumphs.Get('valentines_monster')f:LoadClient()return f:IsCompleted()==true end})srp.items.Register('Modules','MODULE_INFUSER_YELLOW_WASHED',{base='MODULES',name='Washed Yellow',color=col.yellow:Copy(),description='',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/infuser.png',rarity='rare',trade='TRADERCOIN',tradeamount=50,buycount=2,tradedisabled=true,nodrop=true,store='STORE_TRADER'})srp.items.Register('Modules','MODULE_INFUSER_GREEN_LIME',{base='MODULES',name='Lime Green Infuser',color=col.green_light:Copy(),description='',model=Model'models/galactic/me3fix/containerkitchen03.mdl',icon='materials/galactic/ui/inventory/infusergreen.png',rarity='rare',trade='TRADERCOIN',tradeamount=50,buycount=2,tradedisabled=true,nodrop=true,store='STORE_TRADER'})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/resources/food_sh.lua:
local function a(b,c,d)c=c||Vector()d=d||Angle()return{{model=b,pos=Vector(28,-4,17.5)+c,ang=Angle(0,0,0)+d}}end;local function e(f,b,g,h,i)local j={}g=g||Vector()h=h||Angle()i=i||10;for k=1,f do j[#j+1]={model=b,pos=g+Vector(i*k,k%2==0&&5||-5,0),ang=h+Angle(math.random(-20,20),math.random(-20,20),math.random(-20,20))}end;return j end;srp.collectables.Add('eggplant',{Name='Eggplant',Model='models/props_foliage/urban_bigplant01.mdl',Item='FOOD_EGGPLANT',ItemCount=1,Count=5,RespawnCooldown=60,InteractionName='Forage Eggplant',InteractionRange=150,InteractionColor=col.pink,InteractionDuration=5,InteractionBoxSize={mins=Vector(-10,-10,0),maxs=Vector(10,10,50)},VisibleResources=a(Model('models/tsbb/vegetables/eggplant.mdl')),CollectItem=srp.collectables.CollectInventoryItem,CanUse=function(self,l,m)return true end})srp.collectables.Add('squash',{Name='Squash',Model='models/props_foliage/urban_bigplant01.mdl',Item='FOOD_SQUASH',ItemCount=1,Count=5,RespawnCooldown=60,InteractionName='Forage Squash',InteractionRange=150,InteractionColor=col.pink,InteractionDuration=5,InteractionBoxSize={mins=Vector(-10,-10,0),maxs=Vector(10,10,50)},VisibleResources=a(Model('models/tsbb/vegetables/squash.mdl')),CollectItem=srp.collectables.CollectInventoryItem,CanUse=function(self,l,m)return true end})srp.collectables.Add('greenbean',{Name='Green Bean',Model='models/props_foliage/urban_bigplant01.mdl',Item='FOOD_BEAN',ItemCount=1,Count=5,RespawnCooldown=60,InteractionName='Forage Green Bean',InteractionRange=150,InteractionColor=col.pink,InteractionDuration=5,InteractionBoxSize={mins=Vector(-10,-10,0),maxs=Vector(10,10,50)},VisibleResources=a(Model('models/tsbb/vegetables/green_bean.mdl')),CollectItem=srp.collectables.CollectInventoryItem,CanUse=function(self,l,m)return true end})srp.collectables.Add('cucumber',{Name='Cucumber',Model='models/props_foliage/urban_bigplant01.mdl',Item='FOOD_CUCUMBER',ItemCount=1,Count=5,RespawnCooldown=60,InteractionName='Forage Cucumber',InteractionRange=150,InteractionColor=col.pink,InteractionDuration=5,InteractionBoxSize={mins=Vector(-10,-10,0),maxs=Vector(10,10,50)},VisibleResources=a(Model('models/tsbb/vegetables/cucumber.mdl'),Vector(0,0,5),Angle(90,0,0)),CollectItem=srp.collectables.CollectInventoryItem,CanUse=function(self,l,m)return true end})srp.collectables.Add('chilipepper',{Name='Chili Pepper',Model='models/props_foliage/urban_bigplant01.mdl',Item='FOOD_CHILI',ItemCount=1,Count=5,RespawnCooldown=60,InteractionName='Pick Chili Pepper',InteractionRange=150,InteractionColor=col.pink,InteractionDuration=5,InteractionBoxSize={mins=Vector(-10,-10,0),maxs=Vector(10,10,50)},VisibleResources=a(Model('models/tsbb/vegetables/chili_pepper.mdl'),Vector(0,0,5)),CollectItem=srp.collectables.CollectInventoryItem,CanUse=function(self,l,m)return true end})srp.collectables.Add('bellpepper',{Name='Bell Pepper',Model='models/props_foliage/urban_bigplant01.mdl',Item='FOOD_BELLPEPPER',ItemCount=1,Count=5,RespawnCooldown=60,InteractionName='Pick Bell Pepper',InteractionRange=150,InteractionColor=col.pink,InteractionDuration=5,InteractionBoxSize={mins=Vector(-10,-10,0),maxs=Vector(10,10,50)},VisibleResources=a(Model('models/tsbb/vegetables/bell_pepper.mdl'),Vector(0,0,5)),CollectItem=srp.collectables.CollectInventoryItem,CanUse=function(self,l,m)return true end})srp.collectables.Add('artichoke',{Name='Artichoke',Model='models/props_foliage/grass_cluster01a.mdl',Item='FOOD_ARTICHOKE',ItemCount=1,Count=5,RespawnCooldown=60,InteractionName='Pick Artichoke',InteractionRange=150,InteractionColor=col.pink,InteractionDuration=5,InteractionBoxSize={mins=Vector(-15,-15,0),maxs=Vector(15,15,30)},VisibleResources=e(5,Model('models/tsbb/vegetables/artichoke.mdl'),Vector(-25,0,-4)),CollectItem=srp.collectables.CollectInventoryItem,CanUse=function(self,l,m)return true end})srp.collectables.Add('onion',{Name='Onion',Model='models/props_foliage/grass_cluster01a.mdl',Item='FOOD_ONION',ItemCount=1,Count=5,RespawnCooldown=60,InteractionName='Pick Onion',InteractionRange=150,InteractionColor=col.pink,InteractionDuration=5,InteractionBoxSize={mins=Vector(-15,-15,0),maxs=Vector(15,15,30)},VisibleResources=e(5,Model('models/tsbb/vegetables/onion.mdl'),Vector(-25,0,-4)),CollectItem=srp.collectables.CollectInventoryItem,CanUse=function(self,l,m)return true end})srp.collectables.Add('pumpkin',{Name='Pumpkin Patch',Model='models/tsbb/vegetables/pumpkin.mdl',Item='FOOD_PUMPKIN',ItemCount=1,Count=5,RespawnCooldown=60,InteractionName='Carry Pumpkin',InteractionRange=150,InteractionColor=col.orange,InteractionDuration=4,InteractionBoxSize={mins=Vector(-15,-15,0),maxs=Vector(15,15,30)},VisibleResources=e(5,Model('models/tsbb/vegetables/pumpkin.mdl'),Vector(-25,0,-4)),CollectItem=srp.collectables.CollectInventoryItem,CanUse=function(self,l,m)return true end})srp.collectables.Add('candycane',{Name='Pumpkin Patch',Model='models/christmas/candycane_small.mdl',Item='FOOD_CANDYCANE',ItemCount=4,Count=5,RespawnCooldown=60,InteractionName='Lick Candycane',InteractionRange=150,InteractionColor=col.orange,InteractionDuration=4,InteractionBoxSize={mins=Vector(-15,-15,0),maxs=Vector(15,15,30)},VisibleResources=e(5,Model('models/christmas/candycane_small.mdl'),Vector(-25,0,-4)),CollectItem=srp.collectables.CollectInventoryItem,CanUse=function(self,l,m)return true end})srp.collectables.Add('turnip',{Name='Turnip',Model='models/props_foliage/grass_cluster01a.mdl',Item='FOOD_TURNIP',ItemCount=1,Count=5,RespawnCooldown=60,InteractionName='Pick Turnip',InteractionRange=150,InteractionColor=col.pink,InteractionDuration=5,InteractionBoxSize={mins=Vector(-15,-15,0),maxs=Vector(15,15,30)},VisibleResources=e(5,Model('models/tsbb/vegetables/turnip.mdl'),Vector(-25,0,-6)),CollectItem=srp.collectables.CollectInventoryItem,CanUse=function(self,l,m)return true end})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/loadouts/base_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/yuka_sh.lua:
srp.spawn.AddSpawnPoints('rp_yuka_kr',{jail={{Vector(4706,392,236),Angle(0,0,0)}},groups={},default={pos=Vector(-124,-2247,39),ang=Angle(0,85,0)}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/talents/battlepass_sh.lua:
local a=os.time()+604800;local b=Material('materials/galactic/ui/foods/pumpkin.png')local c=Material('materials/galactic/seasonal/halloween/spider.png')local d=Material('materials/galactic/seasonal/halloween/monster.png')local e=Material('materials/galactic/seasonal/halloween/ghost.png')local f=Material('materials/galactic/seasonal/halloween/zombie.png')local g={b,c,d,e,f}local h=Material('materials/galactic/seasonal/christmas/snowman.png','smooth noclamp')local i=Material('materials/galactic/seasonal/christmas/santa.png','smooth noclamp')local j=Material('materials/galactic/seasonal/christmas/gingerbread man.png','smooth noclamp')local k=Material('materials/galactic/seasonal/christmas/deer.png','smooth noclamp')local l={h,i,j,k}srp.talents.AddXPTable('battlepass30',function()local m=0;local n={}n[0]=0;for o=1,30 do m=m+10000;n[#n+1]=m end;return n end)srp.talents.AddXPTable('battlepass50',function()local m=0;local n={}n[0]=0;for o=1,50 do m=m+10000;n[#n+1]=m end;return n end)srp.talents.AddXPTable('battlepass60',function()local m=0;local n={}n[0]=0;for o=1,60 do m=m+10000;n[#n+1]=m end;return n end)srp.talents.AddXPTable('battlepass51',function()local m=0;local n={}n[0]=0;for o=1,60 do m=m+10000;n[#n+1]=m end;return n end)srp.talents.AddXPTable('battlepass_winter24',function()local m=0;local n={}n[0]=0;for o=1,35 do m=m+4000*o;n[#n+1]=math.floor(m/2)end;return n end)srp.battlepass.Add('bp_halloween2022',{name='Halloween 2022',icon=Material('materials/galactic/seasonal/halloween/ghost.png','smooth noclamp'),icons=g,description='Gain XP and unlock an assortment of skins, XP, RC and titles.',shopdescription=[[
This is a battlepass. Earn cosmetics, XP, RC and other rewards via level unlocks. This battle pass has 30 levels.
Please check the battlepass menu (hold C or /battlepass) to see more.
	]],starttime=0,endtime=a,levels=30,cost=srp.seasonal.Halloween&&900||1050,color=col.orange,freemium={[2]={{'randcosmetic',1}},[5]={{'cosmetic','charm_clonehelm'}},[8]={{'money',10000}},[9]={{'xp',10000}},[11]={{'money',20000}},[13]={{'arenatickets',3}},[15]={{'achievement','hwn22mid'}},[18]={{'xp',20000}},[22]={{'storetickets',2}},[24]={{'cosmetic','halloween_accursedapparition'}},[27]={{'xp',35000}},[30]={{'achievement','hwn22complete'}}},premium={{{'cosmetic','halloween_paws'}},{},{{'money',10000}},{{'cosmetic','halloween_holyhunter'}},{},{{'randcosmetic',1}},{{'cosmetic','hallowen_garlicflank'}},{},{},{{'cosmetic','hallowen_forgottenking'}},{},{{'cosmetic','halloween_hoodedhaunter'}},{},{{'cosmetic','halloween_spellbinder'}},{},{{'cosmetic','halloween_cephalopod'}},{{'cosmetic','halloween_trepanabotomizer'}},{},{{'cosmetic','halloween_headhunter'}},{{'randcosmetic',1}},{{'cosmetic','halloween_creatureheap'}},{},{{'cosmetic','halloween_balloon'}},{},{{'money',35000}},{{'store','character_slots'}},{},{{'store','perma_ammo250'}},{{'cosmetic','halloween_monkeynaut'}}}})srp.battlepass.Add('bp_seasonone2022',{name='Season 1',xpid='battlepass51',icon=Material('materials/galactic/seasonal/christmas/snowman.png','smooth noclamp'),icons=l,description='Jump into the new years with fresh cosmetics and charms!',shopdescription=[[
		51 Tiers to collect 55 rewards!
		Includes an assortment of Charms, Apparel, RC and other goodies.

		You may also buy the cosmetics seperately but it will NOT reduce the price of the battlepass!
	]],starttime=0,endtime=a,levels=51,cost=1250,color=col.red_dark,freemium={[2]={{'randcosmetic',1}},[5]={{'cosmetic','charm_501cdr'}},[8]={{'money',15000}},[9]={{'xp',10000}},[11]={{'money',25000}},[13]={{'arenatickets',3}},[14]={{'achievement','bps1_warrior'}},[16]={{'achievement','bps1_mid'}},[20]={{'xp',25000}},[22]={{'money',35000}},[24]={{'storetickets',2}},[29]={{'xp',35000}},[36]={{'store','skill_bst_5'}},[39]={{'randcosmetic',1}},[40]={{'arenatickets',5}},[43]={{'money',50000}},[46]={{'xp',40000}},[51]={{'achievement','bps1_complete'}}},premium={{{'cosmetic','cadbane_hat'}},{},{{'xp',30000}},{{'cosmetic','cadbane_vest'}},{},{{'cosmetic','charm_wookiehead'}},{{'cosmeticset',{Name='Cadbane Arms',Cosmetics={'cadbane_arm_l','cadbane_arm_r'}}}},{},{},{{'cosmetic','charm_yodahead'}},{},{{'cosmetic','charm_twilekhead'}},{},{},{{'xp',60000}},{},{{'cosmetic','engineerhead'}},{{'cosmetic','engineervest'}},{{'money',60000}},{},{{'store','character_slots'}},{},{{'cosmetic','charm_r2d2'}},{},{{'cosmetic','flametrooperback'}},{{'cosmetic','charm_c3po'}},{{'cosmeticset',{Name='Eye Scars',Cosmetics={'heavyback','righteyescar1'}}}},{{'cosmeticset',{Name='Heavy Leg Plates',Cosmetics={'heavy_leg_r','heavy_leg_l'}}}},{},{{'xp',60000}},{{'cosmetic','charm_cgcdr'}},{{'cosmetic','charm_rchead'}},{{'money',60000}},{{'cosmetic','charm_navyhead'}},{{'xp',60000}},{},{{'cosmeticset',{Name='Previzsla Arms',Cosmetics={'previzsla_arm_l','previzsla_arm_r','previzsla_leg_l','previzsla_leg_r'}}}},{{'cosmetic','previzsla_jetpack'}},{},{},{{'store','perma_ammo250'}},{{'cosmetic','rex_jetpack'}},{},{{'money',60000}},{{'cosmetic','charm_arfcdr'}},{},{{'cosmetic','charm_blingbling'}},{{'store','character_slots'}},{{'achievement','bps1_levelgrinder'}},{{'cosmetic','capbreaker_arm_r'}}}})srp.battlepass.Add('bp_seasontwo2023',{name='Summer 2023',xpid='battlepass51',icon=Material('materials/galactic/seasonal/summer/pheonix.png','smooth noclamp'),description='Fresh cosmetics for Summer along with new calling cards!',shopdescription=[[
		43 Tiers!
		Includes an assortment of Callingcards, Apparel, RC and other goodies.

		You may also buy the cosmetics seperately but it will NOT reduce the price of the battlepass!
	]],starttime=0,endtime=a,levels=44,cost=1250,color=col.yellow,freemium={[1]={{'money',25000},{'xp',10000}},[7]={{'title_effect','Star Fish'}},[11]={{'money',35000},{'xp',35000}},[15]={{'callingcard','callingcard_beachcamping'}},[17]={{'xp',40000},{'store','skill_weight'}},[27]={{'item','FOOD_BURGER',60},{'item','FOOD_HOTDOG',60},{'item','FOOD_ICECREAM',50},{'item','FOOD_ICECREAMPOT',50},{'item','FOOD_FRESHDRINK',30}},[33]={{'cosmetic','summer_koolboy'}},[37]={{'title_effect','Pheonix'}},[44]={{'achievement','bps2_completed'}}},premium={{},{{'cosmetic','summer_spacehamster'}},{{'callingcard','callingcard_sandyshore'}},{{'money',40000}},{{'title','Sunshine'},{'credits',250}},{{'store','perma_ammo250'}},{},{{'callingcard','callingcard_warning'}},{{'randcosmetic',1}},{{'callingcard','callingcard_badbatch'}},{},{{'xp',45000}},{{'money',45000}},{{'cosmetic','summer_croakinghazard'}},{},{{'cosmetic','summer_cameleon'}},{},{{'storetickets',5}},{{'randcosmetic',1}},{{'title_effect','Crab'}},{{'title','Ocean Man'},{'xp',45000}},{{'cosmetic','summer_decoratedvet'}},{{'money',45000}},{{'cosmetic','summer_hawaiianhunter'}},{{'storetickets',5}},{{'cosmetic','summer_undercoverbrolly'}},{},{{'randcosmetic',1}},{{'callingcard','callingcard_apocsummer'}},{{'credits',250}},{{'store','skill_weight'}},{{'storetickets',5}},{},{{'callingcard','callingcard_cyberbase'}},{{'callingcard','callingcard_sandyshore'}},{{'title_effect','Sea Turtle'},{'xp',50000}},{},{{'arenatickets',5}},{{'randcosmetic',1},{'store','skill_weight'}},{{'callingcard','callingcard_explorer'}},{{'xp',100000}},{{'emote','Ocean Man'},{'money',60000}},{{'store','skill_bst_5'},{'store','skill_bst_5'}},{}}})local p=Material('materials/galactic/seasonal/summer/shark.png','smooth noclamp')local q=Material('materials/galactic/seasonal/summer/octopus.png','smooth noclamp')local r=Material('materials/galactic/seasonal/summer/jaws2.png','smooth noclamp')srp.battlepass.Add('bp_seasonthree2024',{name='Summer 2024',xpid='battlepass51',icon=Material('materials/galactic/seasonal/summer/pheonix.png','smooth noclamp'),icons={p,q,r},description='Fresh cosmetics for summer along with new calling cards!',shopdescription=[[
		43 Tiers!
		Unlock the railgun early!
		Includes an assortment of callingcards, apparel, RC and other goodies.

		You may also buy the cosmetics seperately but it will NOT reduce the price of the battlepass!
	]],starttime=0,endtime=a,levels=47,cost=1250,color=col.yellow,freemium={[2]={{'money',25000},{'xp',10000}},[8]={{'title','Heatwave'}},[12]={{'money',35000},{'xp',35000}},[16]={{'callingcard','callingcard_s2honeybees'}},[18]={{'xp',40000},{'store','skill_weight'}},[28]={{'item','FOOD_BURGER',60},{'item','FOOD_HOTDOG',60},{'item','FOOD_ICECREAM',50},{'item','FOOD_ICECREAMPOT',50},{'item','FOOD_FRESHDRINK',30}},[34]={{'cosmetic','waist_c_pickaxe'},{'title','Beach Buddy'},{'title','Beach Body'}},[38]={{'title_effect','gasmask'}},[47]={{'achievement','bps3_completed'}}},premium={{{'armouryitem','WEAPON_RIFLE_CHAINGUN'}},{},{{'cosmetic','summer_summerpack'}},{{'callingcard','callingcard_s2apocalyptic'}},{{'money',45000}},{{'title','Beach Boy'},{'credits',250}},{{'store','perma_ammo250'}},{},{{'callingcard','callingcard_s2beachsunset'}},{{'cosmetic','summer_nightvisiongawkers'}},{{'callingcard','callingcard_s2beachviewvibes'}},{},{{'xp',50000}},{{'title_effect','umberella'},{'money',50000}},{{'cosmetic','summer_medicalemergency'}},{},{{'cosmetic','waist_marketgardener'}},{},{{'storetickets',5}},{{'randcosmetic','summer_breachandbomb'}},{{'title_effect','octopus'}},{{'title','Sand Castle Engineer'},{'title','Lifeguard'},{'xp',50000}},{{'cosmetic','summer_headbanger'}},{{'money',50000}},{{'cosmetic','summer_fastfood'}},{{'storetickets',5}},{{'cosmetic','summer_reelflyhat'}},{},{{'randcosmetic',1}},{{'callingcard','callingcard_s2nukes'}},{{'credits',250}},{{'store','skill_weight'}},{{'storetickets',5}},{},{{'callingcard','callingcard_s2stinky'}},{{'callingcard','callingcard_s2summerplanetview'}},{{'title_effect','shark'},{'xp',50000}},{},{{'arenatickets',5}},{{'cosmetic','summer_fullmetalhelmet'},{'store','skill_weight'}},{{'callingcard','callingcard_s2zombipocalypts'}},{{'xp',100000}},{{'emote','Jaws'},{'money',60000}},{{'store','skill_bst_5'},{'store','skill_bst_5'}},{{'cosmetic','summer_paratrooperpack'}},{{'cosmetic','summer_birdseyeviewer'}},{}}})srp.battlepass.Add('bp_halloween2024',{name='Halloween 2024',icon=Material('materials/galactic/seasonal/halloween/zombie.png','smooth noclamp'),icons=g,xpid='battlepass51',description='Gain XP and unlock an assortment of skins, XP, RC and titles.',shopdescription=[[
This is a battlepass. Earn cosmetics, XP, RC and other rewards via level unlocks. This battle pass has 41 levels.

Please check the battlepass menu (hold C or /battlepass) to see more.
	]],starttime=0,endtime=a,levels=41,cost=1450,color=col.orange,freemium={[1]={{'achievement','bphw24_start'}},[2]={{'cosmetic','halloween_witch_book'}},[11]={{'callingcard','callingcard_hween_retropumpkins'}},[20]={{'store','skill_weight'}},[26]={{'money',50000},{'xp',100000}},[36]={{'cosmetic','halloween_badlandsbandido'}},[41]={{'achievement','bphw24_end'}}},premium={{},{},{{'money',20000},{'xp',50000}},{{'callingcard','callingcard_hween_bats'}},{{'credits',100}},{{'cosmetic','halloween_carryall'}},{{'cosmetic','halloween_witch_book'}},{{'title','Lazy Bones'}},{{'cosmetic','hallowen_defaced'}},{{'storetickets',5}},{},{{'cosmetic','halloween_triboniophorus'}},{{'money',50000}},{{'store','skill_weight'}},{{'cosmetic','halloween_rocko'}},{{'cosmetic','halloween_suckerslug'}},{{'title','Mummy of the year'}},{{'credits',150}},{{'cosmetic','halloween_piratehat'}},{},{{'cosmetic','halloween_spaceoddity'}},{{'storetickets',5},{'arenatickets',5}},{{'cosmetic','halloween_hellishoverlord'}},{{'title','Boo-tiful'}},{{'cosmetic','halloween_witch_set'}},{},{{'cosmetic','halloween_witch_ball'}},{{'callingcard','callingcard_hween_skullnbones'}},{{'cosmetic','halloween_witch_bottle'}},{{'money',100000}},{{'storetickets',5}},{{'cosmetic','hallowen_gruesomegourd'}},{{'title','Creepin\' it real'}},{{'cosmetic','halloween_zombieparrot'}},{{'title','Basic witch'}},{},{{'credits',250}},{{'storetickets',5}},{{'callingcard','callingcard_hween_spoookyhouses'}},{{'emote','Spooky Scary Skeletons'}},{}}})srp.battlepass.Add('bp_winter2024',{name='Winter 2024',icon=Material('materials/galactic/seasonal/christmas/snowman.png','smooth noclamp'),icons=l,xpid='battlepass_winter24',description='Gain XP and unlock an assortment of skins, XP, RC and titles.',shopdescription=[[
This is a battlepass. Earn cosmetics, XP, RC and other rewards via level unlocks. This battle pass has 36 levels.

Please check the battlepass menu (hold C or /battlepass) to see more.
	]],starttime=0,endtime=a,levels=35,cost=1450,color=col.orange,freemium={[1]={{'achievement','bpw24_start'}},[6]={{'title','Snowflake'},{'title','Winter Wonderland'}},[11]={{'callingcard','callingcard_snowfall'}},[16]={{'store','skill_weight'}},[21]={{'money',50000},{'xp',100000}},[30]={{'randcosmetic',1},{'title','Turkey Gobbler'}},[35]={{'achievement','bpw24_end'}}},premium={{},{{'money',20000},{'xp',50000}},{{'callingcard','callingcard_planet'}},{{'credits',100}},{{'randcosmetic',1}},{},{{'storetickets',5}},{{'cosmetic','winter_pouchpal'}},{{'money',50000}},{{'store','skill_weight'}},{},{{'randcosmetic',1}},{{'title','Scrooge'},{'title','Gingerbread Trooper'}},{{'credits',150}},{{'cosmetic','winter_necroprancer'}},{},{{'storetickets',5},{'arenatickets',5}},{{'randcosmetic',1}},{{'title','Naughty List'},{'title','Nice List'}},{{'cosmetic','winter_lairefilteure'}},{},{{'cosmetic','winter_hotspaniel'}},{{'callingcard','callingcard_outoffocustree'}},{{'money',100000}},{{'storetickets',5}},{{'cosmetic','winter_snowmanhead'}},{{'title','Snowball Sniper'}},{{'cosmetic','backpack_jiggled'}},{{'title','Frostbite'},{'title','Chimney Crawler'}},{},{{'credits',250}},{{'storetickets',5}},{{'callingcard','callingcard_younglings'}},{{'emote','Santa Racer'}},{}}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/training_cl.lua:
srp.training.AddStep({pnl='srp_training_welcome',title='SUPERIOR SERVERS CLONEWARS',text=[[
		                                            	    We will take you through our automated training. This will take you less than 4 minutes
	    This is a new system so details may be left out. Please ask in-game if you require further assistance with the /h or /ooc command.
	]],camera={default={pos=Vector(-3046,-8025,8051),ang=Angle(40,60,0),ease=true},rp_rishimoon_crimson_s={pos=Vector(-6817,-8784,1173),ang=Angle(27,-150,0)}}})srp.training.AddStep({pnl='srp_training_overview',title='Getting Started',text=[[This training is intended to give you a brief glimpse at some of the important parts of the ship. It is not intended to give a full overview.

The ship is easy to navigate. It has 3 main levels each connected by ramps. Upon completion of this training you will spawn in the "Training Room".
From there you may make your way to the Engine Room Lobby which can be found towards the aft (south/back) of the ship. This is where most people gather.

You can click on the locations shown to see what they look like.
	]],camera={default={pos=Vector(-3046,-8025,8051),ang=Angle(40,60,0),ease=true},rp_rishimoon_crimson_s={pos=Vector(-6817,-8784,1173),ang=Angle(27,-150,0)}}})srp.training.AddStep({pnl='srp_training_modules',title='Onboard Activities',text=[[
		We have various activities to keep you busy when events are not running. You may craft and trade items at the trading terminal
		while collecting resources and helping the ship.
	]],modules={{model=Model'models/galactic/supnpc/shopdroid/shopdroid.mdl',center=true,name='Vendor Droids',description=[[
				These droids will sell you ammo, foods and cosmetics during festive events.
				They have limited supplies and restock every 24 minutes (an in-game day cycle).
			]],pos=Vector(0,0,0),ang=Angle(0,0,0),fov=40,scale=0.8},{model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/items/harvesting/scavenge/scavenge_chassis_component.mdl',name='Collectable Items',description=[[
				Scrap metals, batteries, fuels, weapon parts you name it! These are spread around the map and some event maps.
			]],center=true,pos=Vector(),ang=Angle(90,55,0),fov=40},{model=Model'models/props/swcraftingstation.mdl',name='Crafting',description=[[
				Crafting tables can be found in the armoury. You are able to craft items using raw materials you have collected such as security devices, armour and ammo.
			]],center=true,pos=Vector(),ang=Angle(0,55,0),fov=40},{name='Achievement',description=[[
				Achievements are objectives and milestones that you can progress towards. Each unlock rewards you with XP and achievement points.
			]],icon=Material('materials/galactic/ui/triumphs/package.png'),pos=Vector(),ang=Angle(0,0,0)},{model=Model'models/props/campcratebig.mdl',name='Patrols and Packages',description=[[
				Group with your battalion or friends and complete patrols. Patrols send you on patrol routes and once completed reward you with XP and cash.
			]],center=true,pos=Vector(),ang=Angle(90,0,-40),fov=40},{model=Model'models/galactic/cosmetics/phase1cosmetics/phase1trooperbackpack1.mdl',name='Cosmetics',description=[[
				Purchase cosmetics for your character, ship or weapons. Cosmetics can be disabled in the F4 Setting tab.
			]],center=true,pos=Vector(),ang=Angle(0,120,0),fov=40}},camera={default={pos=Vector(5290,-43,-445),ang=Angle(20,170,0),ease=false},rp_rishimoon_crimson_s={pos=Vector(-7637,-13553,121),ang=Angle(20,-32,0)}}})srp.training.AddStep({pnl='srp_training_loadouts',title='LOADOUTS & TALENTS',text=[[
These are some of the loadouts, items and talents you may have access to as you play.
Loadout items can be accessed via the loadout points as seen infront of you.
	]],talents=[[

Doing most activities ingame will allow you to level up and earn passive and some active talents.
Below is a brief list of some talents you may unlock along the way.
	]],camera={default={pos=Vector(5194,45,-449),ang=Angle(17,-65,0),ease=true},rp_rishimoon_crimson_s={pos=Vector(-7553,-4568,115),ang=Angle(20,-32,0)}},weapons={WEAPON_RIFLE_DC15S={pos=Vector(90,-90,22),ang=Angle(),scale=3.5},WEAPON_SHOTGUN_DC17={pos=Vector(130,-100,25),ang=Angle(0,90,0),scale=3.5},WEAPON_UTILITY_RAT={pos=Vector(130,-170,20),ang=Angle(0,90,0),scale=3.5},WEAPON_UTILITY_JETPACK={pos=Vector(70,-100,19),ang=Angle(0,-90,0),scale=1.3},WEAPON_GRENADE_FLASH={pos=Vector(40,-100,12),ang=Angle(120,0,90),scale=2,model='models/weapons/w_eq_flashbang.mdl'},WEAPON_UTILITY_SHIELD={pos=Vector(175,-100,35),ang=Angle(0,-90,0),scale=1.5},WEAPON_UTILITY_STUNGUN={pos=Vector(90,-110,22),ang=Angle(),scale=3.5},ALCOHOL_VODKA={pos=Vector(25,-100,15),ang=Angle(15,0,0),scale=1},AMMO_PULSE={pos=Vector(0,0,10),ang=Angle(0,90,0),center=true,scale=1.2},MODULE_ACCURACY={pos=Vector(70,-100,19),ang=Angle(80,0,0),scale=2}}})srp.training.AddStep({pnl='srp_training_battalions',title='BATTALIONS',text=[[
			The Republic is the main faction that you be playing for most of your stay. Once you have been trained you may join a battalion by joining one of their tryouts which are often advertised over broadcast in the chat.
			                                                                                                    Join a battalion once you've completed this training to unlock items and gain ranks along with roleplaying in events and scenarios.
	]],camera={default={pos=Vector(5290,-43,-445),ang=Angle(20,170,0),ease=false},rp_rishimoon_crimson_s={pos=Vector(-8182,-4505,214),ang=Angle(20,180,0),ease=true}}})srp.training.AddStep({pnl='srp_training_defconinfo',title='DEFCON & COMMAND STRUCTURE',text=[[
	    Navy and High Officers for each battalion can set different defcon levels. Depending on the defcon level you may be required to enter or leave certain areas or be on the look out for enemies.
	    Please consult the CG for more information.

	    Each battalion is made up of rank sets. Most ranks are grouped together by permission levels and may also have the authority to enter some restricted areas
	    Be sure to follow higher ranking commands an respect your fellow gamers.
	]],groupid='CG',camera={default={pos=Vector(5290,-43,-445),ang=Angle(20,170,0),ease=true},rp_rishimoon_crimson_s={pos=Vector(-8453,-11203,203),ang=Angle(20,-37,0),ease=false}}})srp.training.AddStep({pnl='srp_training_citations',title=' CITATIONS AND ARRESTS',text=[[
		Breaking server rules or laws created in roleplay are punished by the in-game roleplay battalion named Coruscant Guard (CG).
		A member of this battalion can jail you for 15 to 45 minutes depending on the severity of the rule or law broken. Some laws or rules broken might be AOS (arrest on sight).
		Banning is used as a last resort or for repeat offenders. All arrests can be viewed along with their notes if you are an officer in any battalion or part of the CG.

		You can scroll down to get an idea of the different punishments given. Lower severity offences are often issued with a warning first.
	]],camera={default={pos=Vector(3788,235,301),ang=Angle(16,-20,0),ease=false},rp_rishimoon_crimson_s={pos=Vector(-8453,-11203,203),ang=Angle(20,-37,0),ease=true}}})srp.training.AddStep({pnl='srp_training_modules',title='Ship & Security Modules',text=[[
		Ship modules are control modules around the ship that can affect the gameplay when destroyed or turned off. They are maintained by
		104th via the repair tool and must be kept safe from the enemy at all times.

		Security Modules control the ships internal door locks and bridge controls. If they've been comprimised you will need a security device to
		secure them again by completing minigames.

		Intentionally destroying modules is against the rules and may result in a ban. Please do not do this.
	]],modules={{model=Model'models/props/wallpanel1.mdl',name='Turret Monitor',description=[[
				Each turret has a turret monitor that is situated in the right bridge of the ship.
			]],pos=Vector(80,-95,-30),ang=Angle(0,-80,0)},{model=Model'models/props/swdish.mdl',name='Communications Dish',description=[[
				Situated on the outside of the ship under the bridge. When destroyed it stops the use of all global communications.
			]],pos=Vector(800,0,-200),ang=Angle(0,-160,0),fov=50,scale=.3},{model=Model'models/props/console1.mdl',name='Gravity Generator',description=[[
				The gravity generator is located in the center of the ship. Once destroyed there will be little to no gravity around you.
			]],pos=Vector(240,-100,-50),ang=Angle(0,-170,0),fov=50},{model=Model'models/props/console4.mdl',name='Life Support',description=[[
				This controls the oxygen. Located in the Engine Room Lobby. If destroyed your oxygen will slowly deplete and you die. You must keep monitoring your oxygen level and equipping your oxygen tanks to survive.
			]],pos=Vector(240,-100,-50),ang=Angle(0,-170,0),fov=50},{model=Model'models/props/console3.mdl',name='Shield Monitor',description=[[
				Keeps the shields online. Turning the shields off will result in hull explosions across the entire ship.
			]],pos=Vector(340,-100,-50),ang=Angle(0,-175,0),fov=50},{model=Model'models/props/terminal2.mdl',name='Hull Monitor',description=[[
				Located around vital walls and pipes around the ship. If a pipe or wall breaks these will need to be repaired. Open walls can release prisoners and burst pipes can turn the areas around it toxic.
			]],pos=Vector(110,-100,-50),ang=Angle(0,-175,0)},{model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/props/imperial/imp_holo_console.mdl',name='Status Monitor',description=[[
				Located in Right Bridge. Shows the status of all modules on the ship.
			]],pos=Vector(120,-100,-50),ang=Angle(0,-90,0)}},security={'They keep controls around the ship secure.','Hyperspace Controls','MHB Central Ray Field','Sim Room Security'},camera={default={pos=Vector(8296,8904,5261),ang=Angle(27,-114,0),ease=true},rp_rishimoon_crimson_s={pos=Vector(-7961,-8712,1300),ang=Angle(12,41,0)}}})srp.training.AddStep({pnl='srp_training_basic',title='Gamemasters & Events',text=[[
		Gamemasters are players that have access to a plethora of models, weapons and entities to create storyline events for players to enjoy. You will usually be tasked to fight enemies that are AI and also players who have access to event characters.

		They are provided with tools, commands such as stat changes and spawnable interactive items like hacking minigames to provide you with gameplay that satisfies you. You may apply when applications are open to show your creative side to the community.

		While participating in events you will be able to gain more XP via interactions such as killing players, NPCs and securing objectives.
	]],modules={{name='Containers',description='Create profiles containing different stats for NPCs, weapons and players.',icon=Material('materials/galactic/training/container.png')},{name='Objectives',description='Give clear instructions to everyone or battalions to complete missions.',icon=Material('materials/galactic/training/objectives.png')},{name='Deployment',description='Deploy to different maps and servers to complete objectives. Deploy to Coruscant and roleplay as civilians.',icon=Material('materials/galactic/training/triggers.png')},{name='Enemies',description='Play as the opposing faction to defeat your clone friends with along with AI in events.',icon=Material('materials/galactic/training/droideka.png')},{name='OOC',description='When there are no events going on you may play in arena minigames and use your hard earned ingame cash to gamble.',icon=Material('materials/galactic/training/ooc.png')}},camera={default={pos=Vector(8296,8904,5261),ang=Angle(27,-114,0),ease=true},rp_rishimoon_crimson_s={pos=Vector(-7961,-8712,1300),ang=Angle(12,41,0)}}})srp.training.AddStep({pnl='srp_training_basic',title='Enjoy your stay',text=[[
Thank you for reading and deciding to try the server. If you need help then you can request it by typing /h <message> or talking to staff with @ <message> in chat. When you hit finish you will be set as a trained CR (Clone Recruit). After 15 minutes you will be given the rank of CT (Clone Trooper). You can skip this if you join a battalion earlier.

To help you along the way here is some important information. Anything in brackets are the default binds that you can put in console.
	]],sections={[[
			Keybinds:
			C		- Context Menu (+contextmenu)
			F 		- Toggle Flashlight (+flashlight)
			E 		- Use/Interact (+use)
			R 		- Reload (+reload)
			ALT 	- Walk slower (+walk)
			Shift 	- Sprint (+sprint)
			Scroll	- Change Weapon
			F1		- Rules (gm_showhelp)
			F2		- Inventory (gm_showteam)
			F3		- Display cursor (gm_showspare1)
			F4		- Display main intraction menu (gm_showspare2)
		]],[[
			Commands:
			/h		- Ask for help as a new player
			//		- Talk in global out-of-character chat
			/y		- Yell. People will see your chat from further away
			/c		- Communications. Global messages for roleplay purposes
			/w		- Whisper. Only people near you will see this message
			/pm		- PM a player
			/g		- Type in battalion chat
		]],[[
			Abbreviations:
			RDM 	- Random Deathmatch
			ARDM 	- Attempted Random Deathmatch
			MRDM 	- Mass RDM
			AOS 	- Arrest On Sight
			KOS		- Kill On Sight
			OOC		- Out of Character
			IC 		- In Character
		]],[[
			Tips:
			Look at an edge and press ALT + E to sit down on most things
			Shift E + R puts most weapons on safety
			E + R changes weapon fire mode
			Officers may call an AOS on players who break the server and in-character rules
			You can run emotes and open menus quickly by opening the context menu when holding C
		]]},buttons={{'Trello','materials/galactic/ui/scoreboard/trello.png','https://trello.com/b/tCdmsn2g'},{'Forums','materials/galactic/ui/scoreboard/trello.png','https://superiorservers.co/'},{'Discord','materials/galactic/ui/scoreboard/trello.png','https://discord.gg/SuperiorServers'},{'https://ts.superiorservers.co/','materials/galactic/ui/scoreboard/trello.png','https://superiorservers.co/'}},camera={default={pos=Vector(8296,8904,5261),ang=Angle(27,-114,0),ease=true},rp_rishimoon_crimson_s={pos=Vector(-7961,-8712,1300),ang=Angle(12,41,0)}}})
--addons/!lpakr_out/lua/weapons/cw_css_base/cl_init.lua:
include'css_convert.lua'include'shared.lua'
--addons/!lpakr_out/lua/weapons/drgbase_possessor.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/drgbase_weapon/misc.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/button.lua:
TOOL.Category="Construction"TOOL.Name="#tool.button.name"local a="models/maxofs2d/button_05.mdl"TOOL.ClientConVar["model"]=a;TOOL.ClientConVar["keygroup"]="37"TOOL.ClientConVar["description"]=""TOOL.ClientConVar["toggle"]="1"TOOL.Information={{name="left"},{name="right"}}cleanup.Register("buttons")function TOOL:RightClick(b)if IsValid(b.Entity)&&b.Entity:IsPlayer()then return false end;if CLIENT then return true end;if!util.IsValidPhysicsObject(b.Entity,b.PhysicsBone)then return false end;local c=self:GetOwner()local d=self:GetClientInfo("model")local e=self:GetClientNumber("keygroup")||37;local f=self:GetClientNumber("toggle")==1;if IsValid(b.Entity)&&b.Entity:GetClass()=="gmod_button"&&b.Entity:GetPlayer()==c then b.Entity:SetKey(e)b.Entity.Toggled=f;return true,NULL,true end;if!self:GetSWEP():CheckLimit("buttons")then return false end;local g=b.HitNormal:Angle()g.pitch=g.pitch+90;local h=MakeButton(c,d,g,b.HitPos,e,description,f)if!h then return false end;local i=h:OBBMins()h:SetPos(b.HitPos-b.HitNormal*i.z)undo.Create("Button")undo.AddEntity(h)undo.SetPlayer(c)undo.Finish()c:AddCleanup("buttons",h)return true,h end;function TOOL:LeftClick(b)local j,h,k=self:RightClick(b,true)if CLIENT then return j end;if k then return true end;if!IsValid(h)then return false end;if!IsValid(b.Entity)&&!b.Entity:IsWorld()then return false end;local l=constraint.Weld(h,b.Entity,0,b.PhysicsBone,0,0,true)b.Entity:DeleteOnRemove(l)h:DeleteOnRemove(l)h:GetPhysicsObject():EnableCollisions(false)h.nocollide=true;return true end;function TOOL:UpdateGhostButton(m,n)if!IsValid(m)then return end;local o=util.GetPlayerTrace(n)local b=util.TraceLine(o)if!b.Hit then return end;if b.Entity&&b.Entity:GetClass()=="gmod_button"||b.Entity:IsPlayer()then m:SetNoDraw(true)return end;local g=b.HitNormal:Angle()g.pitch=g.pitch+90;local i=m:OBBMins()m:SetPos(b.HitPos-b.HitNormal*i.z)m:SetAngles(g)m:SetNoDraw(false)end;function TOOL:Think()if!IsValid(self.GhostEntity)||self.GhostEntity:GetModel()!=self:GetClientInfo("model")then self:MakeGhostEntity(self:GetClientInfo("model"),Vector(0,0,0),Angle(0,0,0))end;self:UpdateGhostButton(self.GhostEntity,self:GetOwner())end;local p=TOOL:BuildConVarList()function TOOL.BuildCPanel(q)q:AddControl("Header",{Description="#tool.button.desc"})q:AddControl("ComboBox",{MenuButton=1,Folder="button",Options={["#preset.default"]=p},CVars=table.GetKeys(p)})q:AddControl("Numpad",{Label="#tool.button.key",Command="button_keygroup"})q:AddControl("CheckBox",{Label="#tool.button.toggle",Command="button_toggle",Help=true})q:AddControl("PropSelect",{Label="#tool.button.model",ConVar="button_model",Height=4,Models=list.Get("ButtonModels")})end;list.Set("ButtonModels","models/maxofs2d/button_01.mdl",{})list.Set("ButtonModels","models/maxofs2d/button_02.mdl",{})list.Set("ButtonModels","models/maxofs2d/button_03.mdl",{})list.Set("ButtonModels","models/maxofs2d/button_04.mdl",{})list.Set("ButtonModels","models/maxofs2d/button_05.mdl",{})list.Set("ButtonModels","models/maxofs2d/button_06.mdl",{})list.Set("ButtonModels","models/maxofs2d/button_slider.mdl",{})
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/fading_door.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/paint.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/rb655_lightsaber_dual.lua:
TOOL.Category="Robotboy655"TOOL.Name="Dual Lightsaber"TOOL.ClientConVar["model"]="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"TOOL.ClientConVar["red"]="0"TOOL.ClientConVar["green"]="127"TOOL.ClientConVar["blue"]="255"TOOL.ClientConVar["bladew"]="2"TOOL.ClientConVar["bladel"]="42"TOOL.ClientConVar["model_single"]="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"TOOL.ClientConVar["red_single"]="0"TOOL.ClientConVar["green_single"]="127"TOOL.ClientConVar["blue_single"]="255"TOOL.ClientConVar["dark_single"]="0"TOOL.ClientConVar["bladew_single"]="2"TOOL.ClientConVar["bladel_single"]="42"TOOL.ClientConVar["dark"]="0"TOOL.ClientConVar["humsound"]="lightsaber/saber_loop1.wav"TOOL.ClientConVar["swingsound"]="lightsaber/saber_swing1.wav"TOOL.ClientConVar["onsound"]="lightsaber/saber_on1.wav"TOOL.ClientConVar["offsound"]="lightsaber/saber_off1.wav"function TOOL:SetupInfo(a)local b=Color(self:GetClientNumber('red_single')||255,self:GetClientNumber('green_single')||255,self:GetClientNumber('blue_single')||255)local c=Color(self:GetClientNumber('red')||255,self:GetClientNumber('green')||255,self:GetClientNumber('blue')||255)local d=self:GetClientInfo'humsound'local e=self:GetClientInfo'swingsound'local f=self:GetClientInfo'onsound'local g=self:GetClientInfo'offsound'local h=self:GetClientNumber'dark_single'local i=self:GetClientNumber'dark'local j=math.Clamp(self:GetClientNumber('bladew_single'),2,3)local k=math.Clamp(self:GetClientNumber('bladel_single'),20,50)local l=math.Clamp(self:GetClientNumber('bladew'),2,3)local m=math.Clamp(self:GetClientNumber('bladel'),20,50)local n=a:GetInfo'rb655_lightsaber_dual_model'local o=a:GetInfo'rb655_lightsaber_dual_model_single'if!file.Exists(n,'GAME')||!file.Exists(o,'GAME')then return false end;a:StripWeapon'weapon_lightsaber_wos_dual'local p=a:Give'weapon_lightsaber_wos_dual'if!IsValid(p)then return false end;p:SetModel(n)p:SetWorldModel(n)p:SetSecWorldModel(o)table.Merge(p:GetTable(),{Owner=a,LoopSound=LoopSound,SwingSound=SwingSound,OnSound=OnSound,OffSound=OffSound,model=n,Model=n,UseHilt=n,UseColor=b,UseLoopSound=d,UseSwingSound=e,UseOnSound=f,UseOffSound=g,UseDarkInner=h,UseLength=k,UseWidth=j,UseSecColor=c,UseSecLength=m,UseSecWidth=l,UseSecDarkInner=i,UseSecHilt=o})timer.Simple(0.2,function()if IsValid(a)then a:SelectWeapon'weapon_lightsaber_wos_dual'end end)end;function TOOL:LeftClick(q)if CLIENT then return true end;if!q||!IsValid(q.Entity)||!q.Entity:IsPlayer()then return end;self:SetupInfo(q.Entity)return true end;function TOOL:RightClick(q)if CLIENT then return true end;self:SetupInfo(self:GetOwner())return true end;function TOOL:Deploy()end;list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.1",{rb655_lightsaber_humsound="lightsaber/saber_loop1.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.2",{rb655_lightsaber_humsound="lightsaber/saber_loop2.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.3",{rb655_lightsaber_humsound="lightsaber/saber_loop3.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.4",{rb655_lightsaber_humsound="lightsaber/saber_loop4.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.5",{rb655_lightsaber_humsound="lightsaber/saber_loop5.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.6",{rb655_lightsaber_humsound="lightsaber/saber_loop6.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.7",{rb655_lightsaber_humsound="lightsaber/saber_loop7.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.hum.8",{rb655_lightsaber_humsound="lightsaber/saber_loop8.wav"})list.Set("rb655_LightsaberHumSounds","#tool.rb655_lightsaber.dark",{rb655_lightsaber_humsound="lightsaber/darksaber_loop.wav"})list.Set("rb655_LightsaberSwingSounds","#tool.rb655_lightsaber.jedi",{rb655_lightsaber_swingsound="lightsaber/saber_swing1.wav"})list.Set("rb655_LightsaberSwingSounds","#tool.rb655_lightsaber.sith",{rb655_lightsaber_swingsound="lightsaber/saber_swing2.wav"})list.Set("rb655_LightsaberSwingSounds","#tool.rb655_lightsaber.dark",{rb655_lightsaber_swingsound="lightsaber/darksaber_swing.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.jedi",{rb655_lightsaber_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_offsound="lightsaber/saber_off1.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.jedi_fast",{rb655_lightsaber_onsound="lightsaber/saber_on1_fast.wav",rb655_lightsaber_offsound="lightsaber/saber_off1_fast.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.sith",{rb655_lightsaber_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_offsound="lightsaber/saber_off2.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.sith_fast",{rb655_lightsaber_onsound="lightsaber/saber_on2_fast.wav",rb655_lightsaber_offsound="lightsaber/saber_off2_fast.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.heavy",{rb655_lightsaber_onsound="lightsaber/saber_on3.wav",rb655_lightsaber_offsound="lightsaber/saber_off3.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.heavy_fast",{rb655_lightsaber_onsound="lightsaber/saber_on3_fast.wav",rb655_lightsaber_offsound="lightsaber/saber_off3_fast.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.jedi2",{rb655_lightsaber_onsound="lightsaber/saber_on4.wav",rb655_lightsaber_offsound="lightsaber/saber_off4.mp3"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.jedi2_fast",{rb655_lightsaber_onsound="lightsaber/saber_on4_fast.wav",rb655_lightsaber_offsound="lightsaber/saber_off4_fast.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.dark",{rb655_lightsaber_onsound="lightsaber/darksaber_on.wav",rb655_lightsaber_offsound="lightsaber/darksaber_off.wav"})list.Set("rb655_LightsaberIgniteSounds","#tool.rb655_lightsaber.kylo",{rb655_lightsaber_onsound="lightsaber/saber_on_kylo.wav",rb655_lightsaber_offsound="lightsaber/saber_off_kylo.wav"})TOOL.Information={{name="left"},{name="right"}}language.Add("tool.rb655_lightsaber_dual","Lightsabers")language.Add("tool.rb655_lightsaber_dual.name","Lightsabers")language.Add("tool.rb655_lightsaber_dual.desc","Spawn customized lightsabers")language.Add("tool.rb655_lightsaber_dual.0","Right click to give yourself a Lightsaber")language.Add("tool.rb655_lightsaber_dual.right","Give yourself a Lightsaber Weapon")language.Add("tool.rb655_lightsaber_dual.model","Hilt")language.Add("tool.rb655_lightsaber_dual.color","Crystal Color")language.Add("tool.rb655_lightsaber_dual.take","Take this lightsaber")language.Add("tool.rb655_lightsaber_dual.DarkInner","Dark inner blade")language.Add("tool.rb655_lightsaber_dual.StartEnabled","Enabled on spawn")language.Add("tool.rb655_lightsaber_dual.HumSound","Hum Sound")language.Add("tool.rb655_lightsaber_dual.SwingSound","Swing Sound")language.Add("tool.rb655_lightsaber_dual.IgniteSound","Ignition Sound")language.Add("tool.rb655_lightsaber_dual.HudBlur","Enable HUD Blur ( may reduce performance )")language.Add("tool.rb655_lightsaber_dual.bladew","Blade Width")language.Add("tool.rb655_lightsaber_dual.bladel","Blade Length")language.Add("tool.rb655_lightsaber_dual.jedi","Jedi")language.Add("tool.rb655_lightsaber_dual.jedi_fast","Jedi - Fast")language.Add("tool.rb655_lightsaber_dual.sith","Sith")language.Add("tool.rb655_lightsaber_dual.sith_fast","Sith - Fast")language.Add("tool.rb655_lightsaber_dual.heavy","Heavy")language.Add("tool.rb655_lightsaber_dual.heavy_fast","Heavy - Fast")language.Add("tool.rb655_lightsaber_dual.jedi2","Jedi - Original")language.Add("tool.rb655_lightsaber_dual.jedi2_fast","Jedi - Original Fast")language.Add("tool.rb655_lightsaber_dual.dark","Dark Saber")language.Add("tool.rb655_lightsaber_dual.kylo","Kylo Ren")language.Add("tool.rb655_lightsaber_dual.hum.1","Default")language.Add("tool.rb655_lightsaber_dual.hum.2","Sith Heavy")language.Add("tool.rb655_lightsaber_dual.hum.3","Medium")language.Add("tool.rb655_lightsaber_dual.hum.4","Heavish")language.Add("tool.rb655_lightsaber_dual.hum.5","Sith Assassin Light")language.Add("tool.rb655_lightsaber_dual.hum.6","Darth Vader")language.Add("tool.rb655_lightsaber_dual.hum.7","Heavy")language.Add("tool.rb655_lightsaber_dual.hum.8","Dooku")language.Add("Cleanup_ent_lightsabers","Lightsabers")language.Add("Cleaned_ent_lightsabers","Cleaned up all Lightsabers")language.Add("SBoxLimit_ent_lightsabers","You've hit the Lightsaber limit!")language.Add("Undone_ent_lightsaber","Lightsaber undone")language.Add("max_ent_lightsabers","Max Lightsabers")language.Add("tool.rb655_lightsaber_dual.preset1","Darth Maul's Saberstaff")language.Add("tool.rb655_lightsaber_dual.preset2","Darth Maul's Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset3","Darth Tyrannus's Lightsaber (Count Dooku)")language.Add("tool.rb655_lightsaber_dual.preset4","Darth Sidious's Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset5","Darth Vader's Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset6","Master Yoda's Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset7","Qui-Gon Jinn's Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset8","Mace Windu's Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset9","[EP3] Obi-Wan Kenobi's Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset10","[EP1] Obi-Wan Kenobi's Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset11","[EP6] Luke Skywalker's Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset12","[EP2] Anakin Skywalker's Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset13","[EP3] Anakin Skywalker's Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset14","Common Jedi Lightsaber")language.Add("tool.rb655_lightsaber_dual.preset15","Dark Saber")language.Add("tool.rb655_lightsaber_dual.preset_kylo","Kylo Ren's Crossguard Lightsaber")local r=TOOL:BuildConVarList()local s={["#preset.default"]=r,["#tool.rb655_lightsaber_dual.preset1"]={rb655_lightsaber_dual_model="models/weapons/starwars/w_maul_saber_staff_hilt.mdl",rb655_lightsaber_dual_red="255",rb655_lightsaber_dual_green="0",rb655_lightsaber_dual_blue="0",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.4",rb655_lightsaber_dual_bladel="45",rb655_lightsaber_dual_humsound="lightsaber/saber_loop7.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing2.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off2.wav"},["#tool.rb655_lightsaber_dual.preset2"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_maul_saber_half_hilt.mdl",rb655_lightsaber_dual_red="255",rb655_lightsaber_dual_green="0",rb655_lightsaber_dual_blue="0",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.4",rb655_lightsaber_dual_bladel="45",rb655_lightsaber_dual_humsound="lightsaber/saber_loop7.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing2.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off2.wav"},["#tool.rb655_lightsaber_dual.preset3"]={rb655_lightsaber_dual_model="models/weapons/starwars/w_dooku_saber_hilt.mdl",rb655_lightsaber_dual_red="255",rb655_lightsaber_dual_green="0",rb655_lightsaber_dual_blue="0",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2",rb655_lightsaber_dual_bladel="42",rb655_lightsaber_dual_humsound="lightsaber/saber_loop8.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing2.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off2.wav"},["#tool.rb655_lightsaber_dual.preset4"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_sidious_saber_hilt.mdl",rb655_lightsaber_dual_red="255",rb655_lightsaber_dual_green="0",rb655_lightsaber_dual_blue="0",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.2",rb655_lightsaber_dual_bladel="43",rb655_lightsaber_dual_humsound="lightsaber/saber_loop5.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing2.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off2.wav"},["#tool.rb655_lightsaber_dual.preset5"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_vader_saber_hilt.mdl",rb655_lightsaber_dual_red="255",rb655_lightsaber_dual_green="0",rb655_lightsaber_dual_blue="0",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.25",rb655_lightsaber_dual_bladel="43",rb655_lightsaber_dual_humsound="lightsaber/saber_loop6.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing2.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on2.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off2.wav"},["#tool.rb655_lightsaber_dual.preset6"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_yoda_saber_hilt.mdl",rb655_lightsaber_dual_red="64",rb655_lightsaber_dual_green="255",rb655_lightsaber_dual_blue="64",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.3",rb655_lightsaber_dual_bladel="40",rb655_lightsaber_dual_humsound="lightsaber/saber_loop3.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber_dual.preset7"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_quigon_gin_saber_hilt.mdl",rb655_lightsaber_dual_red="32",rb655_lightsaber_dual_green="255",rb655_lightsaber_dual_blue="32",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.2",rb655_lightsaber_dual_bladel="42",rb655_lightsaber_dual_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber_dual.preset8"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_mace_windu_saber_hilt.mdl",rb655_lightsaber_dual_red="127",rb655_lightsaber_dual_green="0",rb655_lightsaber_dual_blue="255",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2",rb655_lightsaber_dual_bladel="42",rb655_lightsaber_dual_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber_dual.preset9"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_obiwan_ep3_saber_hilt.mdl",rb655_lightsaber_dual_red="48",rb655_lightsaber_dual_green="48",rb655_lightsaber_dual_blue="255",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.1",rb655_lightsaber_dual_bladel="42",rb655_lightsaber_dual_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber_dual.preset10"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_obiwan_ep1_saber_hilt.mdl",rb655_lightsaber_dual_red="48",rb655_lightsaber_dual_green="48",rb655_lightsaber_dual_blue="255",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.1",rb655_lightsaber_dual_bladel="42",rb655_lightsaber_dual_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber_dual.preset11"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_luke_ep6_saber_hilt.mdl",rb655_lightsaber_dual_red="32",rb655_lightsaber_dual_green="255",rb655_lightsaber_dual_blue="32",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.1",rb655_lightsaber_dual_bladel="42",rb655_lightsaber_dual_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber_dual.preset12"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl",rb655_lightsaber_dual_red="0",rb655_lightsaber_dual_green="100",rb655_lightsaber_dual_blue="255",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.1",rb655_lightsaber_dual_bladel="42",rb655_lightsaber_dual_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber_dual.preset13"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl",rb655_lightsaber_dual_red="0",rb655_lightsaber_dual_green="100",rb655_lightsaber_dual_blue="255",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.1",rb655_lightsaber_dual_bladel="42",rb655_lightsaber_dual_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber_dual.preset14"]={rb655_lightsaber_dual_model="models/sgg/starwars/weapons/w_common_jedi_saber_hilt.mdl",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.2",rb655_lightsaber_dual_bladel="42",rb655_lightsaber_dual_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on1.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off1.wav"},["#tool.rb655_lightsaber_dual.preset_kylo"]={rb655_lightsaber_dual_model="models/weapons/starwars/w_kr_hilt.mdl",rb655_lightsaber_dual_red="255",rb655_lightsaber_dual_green="0",rb655_lightsaber_dual_blue="0",rb655_lightsaber_dual_dark="0",rb655_lightsaber_dual_bladew="2.1",rb655_lightsaber_dual_bladel="40",rb655_lightsaber_dual_humsound="lightsaber/saber_loop1.wav",rb655_lightsaber_dual_swingsound="lightsaber/saber_swing1.wav",rb655_lightsaber_dual_onsound="lightsaber/saber_on_kylo.wav",rb655_lightsaber_dual_offsound="lightsaber/saber_off_kylo.wav"},["#tool.rb655_lightsaber_dual.preset15"]={rb655_lightsaber_dual_red="255",rb655_lightsaber_dual_green="255",rb655_lightsaber_dual_blue="255",rb655_lightsaber_dual_dark="1",rb655_lightsaber_dual_humsound="lightsaber/darksaber_loop.wav",rb655_lightsaber_dual_swingsound="lightsaber/darksaber_swing.wav",rb655_lightsaber_dual_onsound="lightsaber/darksaber_on.wav",rb655_lightsaber_dual_offsound="lightsaber/darksaber_off.wav"}}function TOOL.BuildCPanel(t)t:AddControl("ComboBox",{MenuButton=1,Folder="rb655_lightsabers",Options=s,CVars=table.GetKeys(r)})t:AddControl("PropSelect",{Label="#tool.rb655_lightsaber_dual.model",Height=4,ConVar="rb655_lightsaber_dual_model_single",Models=list.Get("LightsaberModels")})t:AddControl("PropSelect",{Label="Second Saber Hilt",Height=4,ConVar="rb655_lightsaber_dual_model",Models=list.Get("LightsaberModels")})t:AddControl("Color",{Label="#tool.rb655_lightsaber_dual.color",Red="rb655_lightsaber_dual_red_single",Green="rb655_lightsaber_dual_green_single",Blue="rb655_lightsaber_dual_blue_single",ShowAlpha="0",ShowHSV="1",ShowRGB="1"})t:AddControl("Color",{Label="Second Saber Color",Red="rb655_lightsaber_dual_red",Green="rb655_lightsaber_dual_green",Blue="rb655_lightsaber_dual_blue",ShowAlpha="0",ShowHSV="1",ShowRGB="1"})t:AddControl("Checkbox",{Label="#tool.rb655_lightsaber_dual.DarkInner",Command="rb655_lightsaber_dual_dark_single"})t:AddControl("Checkbox",{Label="Second Dark Inner",Command="rb655_lightsaber_dual_dark"})t:AddControl("Slider",{Label="#tool.rb655_lightsaber_dual.bladeW",Type="Float",Min=2,Max=4,Command="rb655_lightsaber_dual_bladew_single"})t:AddControl("Slider",{Label="#tool.rb655_lightsaber_dual.bladeL",Type="Float",Min=32,Max=64,Command="rb655_lightsaber_dual_bladel_single"})t:AddControl("Slider",{Label="Second Blade Width",Type="Float",Min=2,Max=4,Command="rb655_lightsaber_dual_bladew"})t:AddControl("Slider",{Label="Second Blade Length",Type="Float",Min=32,Max=64,Command="rb655_lightsaber_dual_bladel"})t:AddControl("ListBox",{Label="#tool.rb655_lightsaber_dual.HumSound",Options=list.Get("rb655_LightsaberHumSounds")})t:AddControl("ListBox",{Label="#tool.rb655_lightsaber_dual.SwingSound",Options=list.Get("rb655_LightsaberSwingSounds")})t:AddControl("ListBox",{Label="#tool.rb655_lightsaber_dual.IgniteSound",Options=list.Get("rb655_LightsaberIgniteSounds")})t:AddControl("Checkbox",{Label="#tool.rb655_lightsaber_dual.HudBlur",Command="rb655_lightsaber_hud_blur"})t.Think=function(u)if LocalPlayer().wOSRefresh then u:Clear()u:AddControl("ComboBox",{MenuButton=1,Folder="rb655_lightsabers",Options=s,CVars=table.GetKeys(r)})u:AddControl("PropSelect",{Label="#tool.rb655_lightsaber_dual.model",Height=4,ConVar="rb655_lightsaber_dual_model_single",Models=list.Get("LightsaberModels")})u:AddControl("PropSelect",{Label="Second Saber Hilt",Height=4,ConVar="rb655_lightsaber_dual_model",Models=list.Get("LightsaberModels")})u:AddControl("Color",{Label="#tool.rb655_lightsaber_dual.color",Red="rb655_lightsaber_dual_red_single",Green="rb655_lightsaber_dual_green_single",Blue="rb655_lightsaber_dual_blue_single",ShowAlpha="0",ShowHSV="1",ShowRGB="1"})u:AddControl("Color",{Label="Second Saber Color",Red="rb655_lightsaber_dual_red",Green="rb655_lightsaber_dual_green",Blue="rb655_lightsaber_dual_blue",ShowAlpha="0",ShowHSV="1",ShowRGB="1"})u:AddControl("Checkbox",{Label="#tool.rb655_lightsaber_dual.DarkInner",Command="rb655_lightsaber_dual_dark_single"})u:AddControl("Checkbox",{Label="Second Dark Inner",Command="rb655_lightsaber_dual_dark"})u:AddControl("Slider",{Label="#tool.rb655_lightsaber_dual.bladeW",Type="Float",Min=2,Max=4,Command="rb655_lightsaber_dual_bladew_single"})u:AddControl("Slider",{Label="#tool.rb655_lightsaber_dual.bladeL",Type="Float",Min=32,Max=64,Command="rb655_lightsaber_dual_bladel_single"})u:AddControl("Slider",{Label="Second Blade Width",Type="Float",Min=2,Max=4,Command="rb655_lightsaber_dual_bladew"})u:AddControl("Slider",{Label="Second Blade Length",Type="Float",Min=32,Max=64,Command="rb655_lightsaber_dual_bladel"})u:AddControl("ListBox",{Label="#tool.rb655_lightsaber_dual.HumSound",Options=list.Get("rb655_LightsaberHumSounds")})u:AddControl("ListBox",{Label="#tool.rb655_lightsaber_dual.SwingSound",Options=list.Get("rb655_LightsaberSwingSounds")})u:AddControl("ListBox",{Label="#tool.rb655_lightsaber_dual.IgniteSound",Options=list.Get("rb655_LightsaberIgniteSounds")})u:AddControl("Checkbox",{Label="#tool.rb655_lightsaber_dual.HudBlur",Command="rb655_lightsaber_hud_blur"})LocalPlayer().wOSRefresh=false end end end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/remover.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/textscreen.lua:
TOOL.Category='Roleplay'TOOL.Name='#Textscreen'TOOL.Command=nil;TOOL.ConfigName=''srp.TextScreenFonts={"Tahoma","Helvetica","Trebuchet MS","Comic Sans MS","Segoe UI","Impact","Webdings","Old English Text MT","Stencil","SF Distant Galaxy"}local a=500;local b={}local function c(d)if!b[d]then local e={font=d,size=20,weight=1500,shadow=true,antialias=true,symbol=d=='Webdings'}surface.CreateFont('textscreen.preview.'..d,e)b[d]=true end;return'textscreen.preview.'..d end;TOOL.ClientConVar['font']=srp.TextScreenFonts[1]TOOL.ClientConVar['text']='No text!'TOOL.ClientConVar['size']=20;TOOL.ClientConVar['r']=255;TOOL.ClientConVar['g']=255;TOOL.ClientConVar['b']=255;cleanup.Register('textscreens')if CLIENT then language.Add('Tool.textscreen.name','Textscreen')language.Add('Tool.textscreen.desc','Left click to create a textscreen, right click to update one')language.Add('Tool.textscreen.0','Left Click: Spawn a textscreen Right Click: Update textscreen with settings')language.Add('Tool_textscreen_0','Left Click: Spawn a textscreen Right Click: Update textscreen with settings')language.Add('Undone.textscreens','Undone textscreen')language.Add('Undone_textscreens','Undone textscreen')language.Add('Cleanup.textscreens','Textscreens')language.Add('Cleanup_textscreens','Textscreens')language.Add('Cleaned.textscreens','Cleaned up all textscreens')language.Add('Cleaned_textscreens','Cleaned up all textscreens')language.Add('SBoxLimit.textscreens','You\'ve hit the textscreen limit!')language.Add('SBoxLimit_textscreens','You\'ve hit the textscreen limit!')end;function TOOL:GetFont()local f=1;for g,h in ipairs(srp.TextScreenFonts)do if h==self:GetClientInfo('font')then f=g;break end end;return f end;function TOOL:LeftClick(i)if CLIENT then return true end;local j=self:GetOwner()if!j:CheckLimit('textscreens')then return false end;local k=i.HitPos;local l=i.HitNormal:Angle()l:RotateAroundAxis(i.HitNormal:Angle():Right(),-90)l:RotateAroundAxis(i.HitNormal:Angle():Forward(),90)local m=ents.Create('ent_textscreen')m:SetPos(k)m:SetAngles(l)m:Spawn()m:Activate()m:SetPropOwner(self:GetOwner())local n=self:GetClientInfo('text'):Replace('\\n','\n'):sub(1,a)m:UpdateInfo(n,self:GetFont(),tonumber(self:GetClientInfo('size')),tonumber(self:GetClientInfo('r')),tonumber(self:GetClientInfo('g')),tonumber(self:GetClientInfo('b')))undo.Create('textscreens')undo.AddEntity(m)undo.SetPlayer(j)undo.Finish()j:AddCount('textscreens',m)j:AddCleanup('textscreens',m)return true end;function TOOL:RightClick(i)if!IsValid(i.Entity)||i.Entity:GetClass()!='ent_textscreen'then return false end;if CLIENT then return true end;i.Entity:UpdateInfo(self:GetClientInfo('text'),self:GetFont(),tonumber(self:GetClientInfo('size')),tonumber(self:GetClientInfo('r')),tonumber(self:GetClientInfo('g')),tonumber(self:GetClientInfo('b')))return true end;local o=Color(248,248,248,255)local p=Color(150,150,150,255)function TOOL.BuildCPanel(q)q:AddControl('Header',{Text='#Tool.textscreen.name',Description='#Tool.textscreen.desc'})local r;local s;local t;local u;local v;local w=vgui.Create('DButton',resetbuttons)w:SetSize(100,25)w:SetText('Reset')w.DoClick=function()local x=DermaMenu()x:AddOption('Font',function()RunConsoleCommand('textscreen_font','Tahoma')end)x:AddOption('Color',function()RunConsoleCommand('textscreen_r',255)RunConsoleCommand('textscreen_g',255)RunConsoleCommand('textscreen_b',255)end)x:AddOption('Size',function()RunConsoleCommand('textscreen_size',50)u:SetValue(50)end)x:AddOption('Textbox',function()RunConsoleCommand('textscreen_text','')v:SetValue('')end)x:AddOption('Everything',function()RunConsoleCommand('textscreen_r',255)RunConsoleCommand('textscreen_g',255)RunConsoleCommand('textscreen_b',255)RunConsoleCommand('textscreen_size',50)u:SetValue(50)RunConsoleCommand('textscreen_text','')v:SetValue('')end)x:Open()end;q:AddItem(w)local y=srp.TextScreenFonts[1]r=q:AddControl('Label',{Text='Preview'})r.Paint=function(z,A,B)DisableClipping(true)draw.Box(-5,-5,A+10,B+10,z.Dark&&p||o)DisableClipping(false)end;local C=21;r.Update=function(z,D)z:SetText(D)local E=select(2,string.gsub(D,'\n',''))+1;z:SetTall(E*C)end;r.Think=function(z)local F=Color(GetConVarNumber('textscreen_r'),GetConVarNumber('textscreen_g'),GetConVarNumber('textscreen_b'))z:SetColor(F)z.Dark=F:IsLight()end;r:SetFont(c(y))s=q:AddControl('Color',{Label='Text Color',Red='textscreen_r',Green='textscreen_g',Blue='textscreen_b',ShowHSV=1,ShowRGB=1,Multiplier=255})t=vgui.Create('DComboBox')t:ChooseOption(y)t.OnSelect=function(G,H,I)RunConsoleCommand('textscreen_font',I)r:SetFont(c(I))end;for g,h in ipairs(srp.TextScreenFonts)do t:AddChoice(h)end;q:AddItem(t)u=vgui.Create('DNumSlider')u:SetText('Size (doesn\'t show in preview)')u:SetMinMax(20,100)u:SetDecimals(0)u:SetValue(50)u:SetConVar('textscreen_size')u.Label:SetTextColor(col.black)q:AddItem(u)local J=GetConVar('textscreen_text')local K=J:GetString():Replace('\\n','\n')v=vgui.Create('DTextEntry')v:SetUpdateOnType(true)v:SetEnterAllowed(true)v:SetText(K)r:Update(K)v.OnTextChanged=function()local I=v:GetValue():sub(1,a)r:Update(I)v:SetValue(GetValue)J:SetString(string.Replace(I,'\n','\\n'))end;v:SetTall(100)v:SetMultiline(true)q:AddItem(v)end
--addons/!lpakr_out/lua/improvedweight/improvedweight.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/addressbus.lua:
WireToolSetup.setCategory("Advanced")WireToolSetup.open("addressbus","Data - Address Bus","gmod_wire_addressbus",nil,"Address Buses")if CLIENT then language.Add("Tool.wire_addressbus.name","Address bus tool (Wire)")language.Add("Tool.wire_addressbus.desc","Spawns an address bus. Address spaces may overlap!")TOOL.Information={{name="left",text="Create/Update address bus"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar["model"]="models/jaanus/wiretool/wiretool_gate.mdl"TOOL.ClientConVar["addrspace1sz"]=0;TOOL.ClientConVar["addrspace2sz"]=0;TOOL.ClientConVar["addrspace3sz"]=0;TOOL.ClientConVar["addrspace4sz"]=0;TOOL.ClientConVar["addrspace1st"]=0;TOOL.ClientConVar["addrspace2st"]=0;TOOL.ClientConVar["addrspace3st"]=0;TOOL.ClientConVar["addrspace4st"]=0;TOOL.ClientConVar["addrspace1rw"]=0;TOOL.ClientConVar["addrspace2rw"]=0;TOOL.ClientConVar["addrspace3rw"]=0;TOOL.ClientConVar["addrspace4rw"]=0;function TOOL:RightClick(a)if a.Entity:IsPlayer()then return false end;if CLIENT then return true end;local b=self:GetOwner()if a.Entity:IsValid()&&a.Entity:GetClass()=="gmod_wire_addressbus"then b:ConCommand("wire_addressbus_addrspace1sz "..a.Entity.MemEnd[1]-a.Entity.MemStart[1]+1)b:ConCommand("wire_addressbus_addrspace1st "..a.Entity.MemStart[1])b:ConCommand("wire_addressbus_addrspace2sz "..a.Entity.MemEnd[2]-a.Entity.MemStart[2]+1)b:ConCommand("wire_addressbus_addrspace2st "..a.Entity.MemStart[2])b:ConCommand("wire_addressbus_addrspace3sz "..a.Entity.MemEnd[3]-a.Entity.MemStart[3]+1)b:ConCommand("wire_addressbus_addrspace3st "..a.Entity.MemStart[3])b:ConCommand("wire_addressbus_addrspace4sz "..a.Entity.MemEnd[4]-a.Entity.MemStart[4]+1)b:ConCommand("wire_addressbus_addrspace4st "..a.Entity.MemStart[4])end;return true end;function TOOL.BuildCPanel(c)WireToolHelpers.MakePresetControl(c,"wire_addressbus")ModelPlug_AddToCPanel(c,"gate","wire_addressbus",nil,4)c:NumSlider("1 internal offset","wire_addressbus_addrspace1st",0,16777216,0)c:NumSlider("1 size","wire_addressbus_addrspace1sz",0,16777216,0)c:NumSlider("1 external offset","wire_addressbus_addrspace1rw",0,16777216,0)c:NumSlider("2 internal offset","wire_addressbus_addrspace2st",0,16777216,0)c:NumSlider("2 size","wire_addressbus_addrspace2sz",0,16777216,0)c:NumSlider("2 external offset","wire_addressbus_addrspace2rw",0,16777216,0)c:NumSlider("3 internal offset","wire_addressbus_addrspace3st",0,16777216,0)c:NumSlider("3 size","wire_addressbus_addrspace3sz",0,16777216,0)c:NumSlider("3 external offset","wire_addressbus_addrspace3rw",0,16777216,0)c:NumSlider("4 internal offset","wire_addressbus_addrspace4st",0,16777216,0)c:NumSlider("4 size","wire_addressbus_addrspace4sz",0,16777216,0)c:NumSlider("4 external offset","wire_addressbus_addrspace4rw",0,16777216,0)end
--addons/!lpakr_out/lua/wire/stools/button.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/damage_detector.lua:
WireToolSetup.setCategory("Detection")WireToolSetup.open("damage_detector","Damage Detector","gmod_wire_damage_detector",nil,"Damage Detectors")if CLIENT then language.Add("Tool.wire_damage_detector.name","Damage Detector Tool (Wire)")language.Add("Tool.wire_damage_detector.desc","Spawns a damage detector for use with the wire system")language.Add("Tool.wire_damage_detector.includeconstrained","Include Constrained Props")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(10)TOOL.ClientConVar={model="models/jaanus/wiretool/wiretool_siren.mdl",includeconstrained=0}WireToolSetup.SetupLinking()function TOOL.BuildCPanel(a)ModelPlug_AddToCPanel(a,"Misc_Tools","wire_damage_detector")a:CheckBox("#Tool.wire_damage_detector.includeconstrained","wire_damage_detector_includeconstrained")end
--addons/!lpakr_out/lua/wire/stools/data_transferer.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/data_transferer.lua:
WireToolSetup.setCategory("Memory")WireToolSetup.open("data_transferer","Transferer","gmod_wire_data_transferer",nil,"Transferers")if CLIENT then language.Add("Tool.wire_data_transferer.name","Data Transferer Tool (Wire)")language.Add("Tool.wire_data_transferer.desc","Spawns a data transferer.")language.Add("WireDataTransfererTool_data_transferer","Data Transferer:")language.Add("WireDataTransfererTool_Range","Max Range:")language.Add("WireDataTransfererTool_DefaultZero","Default To Zero")language.Add("WireDataTransfererTool_IgnoreZero","Ignore Zero")language.Add("WireDataTransfererTool_Model","Choose a Model:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={Model="models/jaanus/wiretool/wiretool_siren.mdl",Range="25000",DefaultZero=0,IgnoreZero=0}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_data_transferer")ModelPlug_AddToCPanel(a,"Laser_Tools","wire_data_transferer")a:NumSlider("#WireDataTransfererTool_Range","wire_data_transferer_Range",1,30000,0)a:CheckBox("#WireDataTransfererTool_DefaultZero","wire_data_transferer_DefaultZero")a:CheckBox("#WireDataTransfererTool_IgnoreZero","wire_data_transferer_IgnoreZero")end
--addons/!lpakr_out/lua/wire/stools/fx_emitter.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/graphics_tablet.lua:
WireToolSetup.setCategory("Input, Output/Mouse Interaction")WireToolSetup.open("graphics_tablet","Graphics Tablet","gmod_wire_graphics_tablet",nil,"Graphics Tablet")if CLIENT then language.Add("Tool.wire_graphics_tablet.name","Graphics Tablet Tool (Wire)")language.Add("Tool.wire_graphics_tablet.desc","Spawns a graphics tablet, which outputs cursor coordinates")language.Add("Tool_wire_graphics_tablet_mode","Output mode: -1 to 1 (ticked), 0 to 1 (unticked)")language.Add("Tool_wire_graphics_tablet_draw_background","Draw background")language.Add("Tool_wire_graphics_tablet_createflat","Create flat to surface")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/kobilica/wiremonitorbig.mdl",outmode=0,createflat=1,draw_background=1}function TOOL.BuildCPanel(a)a:AddControl("Header",{Text="#Tool.wire_graphics_tablet.name",Description="#Tool.wire_graphics_tablet.desc"})WireDermaExts.ModelSelect(a,"wire_graphics_tablet_model",list.Get("WireScreenModels"),5)a:CheckBox("#Tool_wire_graphics_tablet_mode","wire_graphics_tablet_outmode")a:CheckBox("#Tool_wire_graphics_tablet_draw_background","wire_graphics_tablet_draw_background")a:CheckBox("#Tool_wire_graphics_tablet_createflat","wire_graphics_tablet_createflat")end
--addons/!lpakr_out/lua/wire/stools/holoemitter.lua:
WireToolSetup.setCategory("Visuals/Holographic")WireToolSetup.open("holoemitter","HoloEmitter","gmod_wire_holoemitter",nil,"HoloEmitters")if CLIENT then language.Add("tool.wire_holoemitter.name","Holographic Emitter Tool (Wire)")language.Add("tool.wire_holoemitter.desc","The emitter required for holographic projections")language.Add("Tool.wire_holoemitter.fadetime","Max fade time")language.Add("Tool.wire_holoemitter.fadetime.description","Client side max fade time. Set to 0 to never fade (WARNING: May cause FPS issues if set to 0 or too high).")language.Add("Tool.wire_holoemitter.keeplatestdot","Keep latest dot indefinitely (prevent fading).")TOOL.Information={{name="left_0",stage=0,text="Create emitter"},{name="right_0",stage=0,text="Link emitter to any entity (makes it draw local to that entity instead)"},{name="right_1",stage=1,text="Link to entity (click the same holoemitter again to unlink it)"},{name="reload",stage=1,text="Cancel linking"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(10)TOOL.ClientConVar={model="models/jaanus/wiretool/wiretool_range.mdl"}function TOOL:RightClick(a)if CLIENT then return true end;local b=a.Entity;if self:GetStage()==0 then if b:GetClass()=="gmod_wire_holoemitter"then self.Target=b;self:SetStage(1)else self:GetOwner():ChatPrint("That's not a holoemitter.")return false end else if self.Target==b||b:IsWorld()then self:GetOwner():ChatPrint("Holoemitter unlinked.")self.Target:UnLink()self:SetStage(0)return true end;self.Target:Link(b)self:SetStage(0)self:GetOwner():ChatPrint("Holoemitter linked to entity ("..tostring(b)..")")end;return true end;function TOOL:Reload()if self:GetStage()==1 then self:SetStage(0)self.Linked=nil;return false end end;function TOOL.BuildCPanel(c)WireToolHelpers.MakePresetControl(c,"wire_holoemitter")WireDermaExts.ModelSelect(c,"wire_holoemitter_model",list.Get("Wire_Misc_Tools_Models"),1)c:NumSlider("#Tool.wire_holoemitter.fadetime","cl_wire_holoemitter_maxfadetime",0,100,1)c:Help("#Tool.wire_holoemitter.fadetime.description")c:CheckBox("#Tool.wire_holoemitter.keeplatestdot","wire_holoemitter_keeplatestdot")end
--addons/!lpakr_out/lua/wire/stools/hologrid.lua:
WireToolSetup.setCategory("Visuals/Holographic")WireToolSetup.open("hologrid","HoloGrid","gmod_wire_hologrid",nil,"HoloGrids")if CLIENT then language.Add("tool.wire_hologrid.name","Holographic Grid Tool (Wire)")language.Add("tool.wire_hologrid.desc","The grid to aid in holographic projections")TOOL.Information={{name="left_0",stage=0,text="Create grid"},{name="right_0",stage=0,text="Link HoloGrid with HoloEmitter or reference entity"},{name="reload_0",stage=0,text="Unlink HoloEmitter or HoloGrid"},{name="right_1",stage=1,text="Select the HoloGrid to link to"}}language.Add("Tool_wire_hologrid_usegps","Use GPS coordinates")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/jaanus/wiretool/wiretool_siren.mdl",usegps=0}function TOOL:RightClick(a)if CLIENT then return true end;local b=a.Entity;if self:GetStage()==0 then if b:GetClass()=="gmod_wire_holoemitter"then self.Target=b;self:SetStage(1)else self:GetOwner():ChatPrint("That's not a holoemitter.")return false end else if self.Target==b||b:IsWorld()then self:GetOwner():ChatPrint("Holoemitter unlinked.")self.Target:UnLink()self:SetStage(0)return true end;self.Target:Link(b)self:SetStage(0)self:GetOwner():ChatPrint("Holoemitter linked to entity ("..tostring(b)..")")end;return true end;function TOOL.Reload(a)self.Linked=nil;self:SetStage(0)if IsValid(a.Entity)&&a.Entity:GetClass()=="gmod_wire_hologrid"then self.Linked:TriggerInput("Reference",nil)return true end end;function TOOL.BuildCPanel(c)WireDermaExts.ModelSelect(c,"wire_hologrid_model",list.Get("Wire_Misc_Tools_Models"),1)c:CheckBox("#Tool_wire_hologrid_usegps","wire_hologrid_usegps")end
--addons/!lpakr_out/lua/wire/stools/igniter.lua:
WireToolSetup.setCategory("Physics")WireToolSetup.open("igniter","Igniter","gmod_wire_igniter",nil,"Igniters")if CLIENT then language.Add("tool.wire_igniter.name","Igniter Tool (Wire)")language.Add("tool.wire_igniter.desc","Spawns a constant igniter prop for use with the wire system.")language.Add("WireIgniterTool_trgply","Allow Player Igniting")language.Add("WireIgniterTool_Range","Max Range:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={trgply=0,range=2048,model="models/jaanus/wiretool/wiretool_siren.mdl"}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_igniter")WireDermaExts.ModelSelect(a,"wire_igniter_Model",list.Get("Wire_Laser_Tools_Models"),1,true)a:CheckBox("#WireIgniterTool_trgply","wire_igniter_trgply")a:NumSlider("#WireIgniterTool_Range","wire_igniter_range",1,10000,0)end
--addons/!lpakr_out/lua/wire/stools/input.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/nailer.lua:
WireToolSetup.setCategory("Physics/Constraints")WireToolSetup.open("nailer","Nailer","gmod_wire_nailer",nil,"Nailers")if CLIENT then language.Add("Tool.wire_nailer.name","Nailer Tool (Wire)")language.Add("Tool.wire_nailer.desc","Spawns a constant nailer prop for use with the wire system.")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/jaanus/wiretool/wiretool_siren.mdl",forcelim="0",range=100,beam=1}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_nailer")ModelPlug_AddToCPanel(a,"Laser_Tools","wire_nailer",true)a:NumSlider("#Force Limit","wire_nailer_forcelim",0,10000,0)a:NumSlider("Range","wire_nailer_range",1,2048,0)a:CheckBox("Show Beam","wire_nailer_beam")end
--addons/!lpakr_out/lua/wire/stools/plug.lua:
WireToolSetup.setCategory("Input, Output/Data Transfer")WireToolSetup.open("plug","Plug","gmod_wire_socket",nil,"Plugs")if SERVER then else language.Add("Tool.wire_plug.name","Plug & Socket Tool (Wire)")language.Add("Tool.wire_plug.desc","Spawns plugs and sockets for use with the wire system.")language.Add("sboxlimit_wire_plugs","You've hit the Wire Plugs limit!")language.Add("sboxlimit_wire_sockets","You've hit the Wire Sockets limit!")language.Add("undone_wireplug","Undone Wire Plug")language.Add("undone_wiresocket","Undone Wire Socket")language.Add("Tool_wire_plug_freeze","Freeze the socket.")language.Add("Tool_wire_plug_array","Use array inputs/outputs instead.")language.Add("Tool_wire_plug_weldforce","Plug weld force:")language.Add("Tool_wire_plug_attachrange","Plug attachment detection range:")language.Add("Tool_wire_plug_drawoutline","Draw the white outline on plugs and sockets.")language.Add("Tool_wire_plug_drawoutline_tooltip","Disabling this helps you see inside the USB plug model when you set its material to wireframe.")language.Add("Tool_wire_plug_angleoffset","Spawn angle offset")TOOL.Information={{name="left",text="Create/Update Socket"},{name="right",text="Create/Update "..TOOL.Name},{name="reload",text="Increase angle offset by 45 degrees"}}end;WireToolSetup.BaseLang()TOOL.ClientConVar["model"]="models/props_lab/tpplugholder_single.mdl"TOOL.ClientConVar["array"]=0;TOOL.ClientConVar["weldforce"]=5000;TOOL.ClientConVar["attachrange"]=5;TOOL.ClientConVar["drawoutline"]=1;TOOL.ClientConVar["angleoffset"]=0;local a=list.Get("Wire_Socket_Models")hook.Add("ModelPlugLuaRefresh","wire_plug_updatemodels",function()a=list.Get("Wire_Socket_Models")end)cleanup.Register("wire_plugs")function TOOL:GetModel()local b=self:GetClientInfo("model")if!util.IsValidModel(b)||!util.IsValidProp(b)||!a[b]then return"models/props_lab/tpplugholder_single.mdl"end;return b end;function TOOL:GetAngle(c)local d;if math.abs(c.HitNormal.x)<0.001&&math.abs(c.HitNormal.y)<0.001 then d=Vector(0,0,c.HitNormal.z):Angle()+(a[self:GetModel()].ang||Angle(0,0,0))else d=c.HitNormal:Angle()+(a[self:GetModel()].ang||Angle(0,0,0))end;d:RotateAroundAxis(c.HitNormal,self:GetClientNumber("angleoffset"))return d end;function TOOL:RightClick(c)if!c then return false end;if c.Entity then if c.Entity:IsPlayer()then return false end;if c.Entity:GetClass()=="gmod_wire_plug"then if CLIENT then return true end;c.Entity:Setup(self:GetClientNumber("array")!=0)return true end end;if CLIENT then return true end;if!util.IsValidPhysicsObject(c.Entity,c.PhysicsBone)then return false end;local e=self:GetOwner()local f=a[self:GetModel()].plug;local g=WireLib.MakeWireEnt(e,{Class="gmod_wire_plug",Pos=c.HitPos,Angle=self:GetAngle(c),Model=f},self:GetClientNumber("array")!=0)if!IsValid(g)then return false end;g:SetPos(c.HitPos-c.HitNormal*g:OBBMins().x)undo.Create("wireplug")undo.AddEntity(g)undo.SetPlayer(e)undo.Finish()e:AddCleanup("wire_plugs",g)return true end;function TOOL:Reload(c)if game.SinglePlayer()&&SERVER then self:GetOwner():ConCommand("wire_plug_angleoffset "..(self:GetClientNumber("angleoffset")+45)%360)elseif CLIENT then RunConsoleCommand("wire_plug_angleoffset",(self:GetClientNumber("angleoffset")+45)%360)end;return false end;function TOOL.BuildCPanel(h)WireToolHelpers.MakePresetControl(h,"wire_plug")ModelPlug_AddToCPanel(h,"Socket","wire_plug")h:CheckBox("#Tool_wire_plug_array","wire_plug_array")h:NumSlider("#Tool_wire_plug_weldforce","wire_plug_weldforce",0,100000)h:NumSlider("#Tool_wire_plug_attachrange","wire_plug_attachrange",1,100)h:CheckBox("#Tool_wire_plug_drawoutline","wire_plug_drawoutline")h:NumSlider("#Tool_wire_plug_angleoffset","wire_plug_angleoffset",0,360,0)end
--addons/!lpakr_out/lua/wire/stools/radio.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/textreceiver.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/thruster.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/trail.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/cl_viewscreen.lua:
local a=Material("models/weapons/v_toolgun/screen")local b=surface.GetTextureID("models/weapons/v_toolgun/screen_bg")local c=GetRenderTarget("GModToolgunScreen",256,256)surface.CreateFont("GModToolScreen",{font="Helvetica",size=60,weight=900})local function d(e,f,g)local h,i=surface.GetTextSize(e)h=h+64;f=f-i/2;local j=RealTime()*250%h*-1;while j<g do surface.SetTextColor(0,0,0,255)surface.SetTextPos(j+3,f+3)surface.DrawText(e)surface.SetTextColor(255,255,255,255)surface.SetTextPos(j,f)surface.DrawText(e)j=j+h end end;function SWEP:RenderScreen()local k=256;local l=GetConVarString("gmod_toolmode")local m=ScrW()local n=ScrH()a:SetTexture("$basetexture",c)local o=render.GetRenderTarget()render.SetRenderTarget(c)render.SetViewPort(0,0,k,k)cam.Start2D()surface.SetDrawColor(255,255,255,255)surface.SetTexture(b)surface.DrawTexturedRect(0,0,k,k)if self:GetToolObject()&&self:GetToolObject().DrawToolScreen then self:GetToolObject():DrawToolScreen(k,k)else surface.SetFont("GModToolScreen")d("#tool."..l..".name",104,k)end;cam.End2D()render.SetRenderTarget(o)render.SetViewPort(0,0,m,n)end
--addons/!lpakr_out/lua/weapons/sup_b2cannon.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(6,6,-4)SWEP.RestAng=Vector(0,0,0)SWEP.AimPos=Vector(6,6,-4)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(6,10,-4)SWEP.SprintAng=Vector(-5,0,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;SWEP.PrintName='B2 Arm Cannon'SWEP.Projectile='b2_rocket'SWEP.Tracer=1;SWEP.TracerName='sup_laser_red'SWEP.Primary.Tracer=1;SWEP.Primary.TracerName='sup_laser_red'SWEP.DisplayAmmo=false;SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(10,2,6)SWEP.ViewModelFlip=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='pistol'SWEP.RunHoldType='normal'SWEP.FireModes={'auto','semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/tfa/comm/gg/droid_b2_fp_hand.mdl'SWEP.WorldModel=''SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=3;SWEP.FireSound=Sound'blaster.fire'SWEP.Recoil=0;SWEP.HipSpread=0;SWEP.AimSpread=0;SWEP.VelocitySensitivity=0;SWEP.MaxSpreadInc=0.001;SWEP.SpreadPerShot=0.001;SWEP.SpreadCooldown=0.5;SWEP.Shots=1;SWEP.Damage=60;SWEP.DeployTime=1;SWEP.ShowHands=false;SWEP.NPCMinShots=1;SWEP.NPCMaxShots=1;SWEP.NPCFireDelay=5;SWEP.NPCRestTimeMin=5;SWEP.NPCRestTimeMax=10
--addons/!lpakr_out/lua/weapons/sup_beck.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,0,-0.5)SWEP.AimPos=Vector(-3.75,1,0.5)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(5,0,-4)SWEP.SprintAng=Vector(-15,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='Swifteye'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto','semi'}SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc15s.mdl'SWEP.WorldModel='models/galactic/weapons/wmodels/supdc15sworld.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=80;SWEP.Primary.DefaultClip=80;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.14;SWEP.FireSound=Sound'blaster.fire_smg'SWEP.ReloadSound=Sound'blaster.reload_smg'SWEP.Recoil=.4;SWEP.RecoilAngle=Angle(-.5,0,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.01;SWEP.AimSpread=.01;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=50;SWEP.DeployTime=0;SWEP.ShowHands=false;SWEP.FadeCrosshairOnAim=false;SWEP.FireDistance=15000;SWEP.FireDistanceDegrade=5000;SWEP.FireDistanceDegradeMulti=2;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,90,0)SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'function SWEP:OnFireModeChanged(a)if a=='auto'then self.Damage=50;SWEP.FireDelay=0.14 else self.Damage=75;SWEP.FireDelay=0.20 end end
--addons/!lpakr_out/lua/weapons/sup_dc17_creep.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dc17_creep.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(-.5,-2,.5)SWEP.AimPos=Vector(0,-3,.5)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-3,1)SWEP.SprintAng=Vector(-25,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;SWEP.PrintName='Creep\'s DC-17 Duals'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='duel'SWEP.RunHoldType='normal'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc17dual.mdl'SWEP.WorldModel='models/galactic/weapons/wmodels/supdc17sdualworld.mdl'SWEP.Akimbo=true;SWEP.AmmoOffset=Vector(20,-3,-2)SWEP.AmmoOffsetAng=Angle(-20,-90,90)SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=60;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.14;SWEP.FireSound=Sound'blaster.fire_pistol'SWEP.Recoil=.2;SWEP.RecoilAngle=Angle(-1.0,-.2,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.03;SWEP.AimSpread=.03;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=50;SWEP.DeployTime=0;SWEP.ShowHands=true;SWEP.FadeCrosshairOnAim=false;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,180,0)SWEP.SprintingEnabled=true;SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'
--addons/!lpakr_out/lua/weapons/sup_dc17m_sniper.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(-.5,-4.5,0.5)SWEP.AimPos=Vector(-5.44,-6.2,1.358)SWEP.AimAng=Vector(-.5,0,0)SWEP.SprintPos=Vector(0,-3,1)SWEP.SprintAng=Vector(-25,40,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.DelayedZoom=true end;SWEP.PrintName='DC-17m Sniper'SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(16,-1.5,-4)SWEP.CanPenetrate=true;SWEP.PlayBackRate=5;SWEP.PlayBackRateSV=5;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.HasScope=true;SWEP.FadeCrosshairOnAim=true;SWEP.PreventQuickScoping=true;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'bolt'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc17m.mdl'SWEP.WorldModel='models/weapons/w_dc17m_sn.mdl'SWEP.Bodygroups='010'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=10;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=false;SWEP.FireDelay=2;SWEP.FireSound=Sound'blaster.fire_sniper'SWEP.ReloadSound=Sound'blaster.reload_dc17m'SWEP.Recoil=2.5;SWEP.RecoilAngle=Angle(-2.5,0,0)SWEP.HipDivRecoil=Vector(.05,.05,.05)SWEP.HipSpread=0.08;SWEP.AimSpread=0;SWEP.VelocitySensitivity=0;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.007;SWEP.SpreadCooldown=0.13;SWEP.Shots=1;SWEP.Damage=230;SWEP.DeployTime=3.5;SWEP.ShowHands=true;SWEP.RecoilSpeed=10;function SWEP:AdjustMouseSensitivity()if self.dt.State==SWB_AIMING then local a=math.Clamp(cvar.GetValue('weapon_aimsense_sniper')||1,0,1)return a>0&&a||.7 end end
--addons/!lpakr_out/lua/weapons/sup_dl44.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_flamethrower/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_grapple.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_ichigo.lua:
AddCSLuaFile()SWEP.PrintName='Scavenger Rifle'SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,-3,0)SWEP.AimPos=Vector(-5.01,-5.5,2.88)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,0,1)SWEP.SprintAng=Vector(-15,5,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Event Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/tobester/weapons/v_ichigo_blaster.mdl'SWEP.WorldModel='models/tobester/weapons/w_ichigo_blaster.mdl'SWEP.UIPosition=Vector(15,0,0)SWEP.UIAngle=Angle()SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=80;SWEP.Primary.DefaultClip=80;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.14;SWEP.FireSound=Sound'blaster.fire_smg'SWEP.ReloadSound=Sound'blaster.reload_smg'SWEP.Recoil=.4;SWEP.RecoilAngle=Angle(-.5,0,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.01;SWEP.AimSpread=.01;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=50;SWEP.DeployTime=0;SWEP.ShowHands=false;SWEP.FadeCrosshairOnAim=true;SWEP.TracerName='sup_laser_blue'SWEP.Primary.TracerName='sup_laser_blue'SWEP.ImpactEffectColor=Vector(50,50,255)SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'SWEP.HasScope=true;SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=false;SWEP.ZoomAmount=15;SWEP.AdjustableZoom=true;SWEP.MinZoom=1;SWEP.MaxZoom=35;SWEP.ZoomSteps=5;SWEP.ScopeOverrideMaterialIndex=1;SWEP.ScopeFOV=10;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=false;SWEP.ScopedBlur=false;SWEP.ScopeRotate=0
--addons/!lpakr_out/lua/weapons/sup_remotesatchel/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_repshotgun.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_repsniper.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_stimkit.lua:
SWEP.Gun='sup_stimkit'SWEP.Category='SUP Starwars Weapons'SWEP.PrintName='Stimkit'SWEP.Slot=3;SWEP.SlotPos=1;SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.DrawAmmo=false;SWEP.Primary.Sound=Sound'weapons/DC17M_BR_fire.wav'SWEP.Primary.ReloadSound=Sound'weapons/DC17M_BR_reload.wav'SWEP.ViewModel='models/weapons/v_stimkit.mdl'SWEP.WorldModel='models/weapons/w_stimkit.mdl'SWEP.VMPos=Vector(4,-3.5,3)SWEP.ShowViewModel=true;SWEP.ShowWorldModel=false;SWEP.UseHands=true;SWEP.heal=400;SWEP.cooldown=25;SWEP.HoldType='pistol'SWEP.Primary.Automatic=false;SWEP.Primary.Ammo='none'SWEP.Secondary.Automatic=false;SWEP.Secondary.Ammo='none'SWEP.UIPosition=Vector(-2,-80,0)SWEP.UIAngle=Angle(0,-90,0)SWEP.Modes={{Name='Burst Heal',Heal=400,Cooldown=25},{Name='Rapid Heal',Heal=250,Cooldown=15}}function SWEP:SetupDataTables()self:NetworkVar('Int',0,'ModeID')end;function SWEP:GetMode()return self:GetModeID()+1 end;function SWEP:Reload()if CLIENT then return end;if self.ModeChangeCooldown&&self.ModeChangeCooldown>CurTime()then return end;self.ModeChangeCooldown=CurTime()+1;local a=self:GetOwner()if!self:IsRM(a)then return end;local b=((self:GetModeID()||0)+1)%#self.Modes;self:SetModeID(b)local c=self.Modes[self:GetMode()]||self.Modes[1]if self.fcooldown&&c.NextUse&&c.NextUse>self.fcooldown then self.fcooldown=c.NextUse end;srp.notif.Neutral(a,2,c.Name..' selected.')end;function SWEP:PrimaryAttack()if CLIENT then return true end;local c=self.Modes[self:GetMode()]if self.fcooldown&&self.fcooldown>CurTime()then return false end;local a=self:GetOwner()local d=self:IsRM(a)if self:Heal(c,d&&a||nil,false)then local e=d&&c.Cooldown*.5||c.Cooldown;self.fcooldown=CurTime()+e;c.NextUse=self.fcooldown;srp.buffs.Add(a,'stimkit_l',e)return true end end;function SWEP:Heal(c,d,f)local a=f==true&&self:GetOwner()||self:GetOwner():GetEyeTrace().Entity;if!IsValid(a)||!a:IsPlayer()then return false end;if a:IsRobot()then return false end;if!f&&a:GetPos():DistToSqr(self:GetOwner():GetPos())>40000 then return false end;if a:GetAllegianceID()!='REPUBLIC'then return false end;if!f&&a:Health()<a:GetMaxHealth()-50 then self:GetOwner():AddTalentXP(15)end;self:EmitSound'weapons/medkit/use_bacta.wav'self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)if d then local g=1+d:GetTalentValue('rmincrhealing')/100;local h=1+d:GetTalentValue('rmincroverstim')local i=self.heal*2*g;if f&&IsValid(a:GetJetpack())&&!a:IsOnGround()then i=i*.25 end;a:Heal(i,true,f&&0||200*h)else a:Heal(self.heal,true)end;return true end;function SWEP:IsRM(a)if info.Dev then return true end;local j=a:GetGroupClass()if j then return j:HasPermission'medic'end end;function SWEP:SecondaryAttack()if CLIENT then return true end;local c=self.Modes[self:GetMode()]if self.scooldown&&self.scooldown>CurTime()then return false end;local d=self:GetOwner()if!self:IsRM(d)then return false end;if self:Heal(c,d,true)then local e=d&&c.Cooldown*.75||c.Cooldown;self.scooldown=CurTime()+e;c.NextUse=self.scooldown;srp.buffs.Add(d,'stimkit_r',e)return true end end
--addons/!lpakr_out/lua/weapons/sup_vulkan.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.AimPos=Vector(-4.8754,-4.5,.745)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,0,2.5)SWEP.SprintAng=Vector(-20,15,0)SWEP.ViewModelMovementScale=.75;SWEP.IconLetter='b'SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=false;SWEP.ZoomAmount=15;SWEP.AdjustableZoom=true;SWEP.MinZoom=1;SWEP.MaxZoom=35;SWEP.ZoomSteps=5;SWEP.ScopeOverrideMaterialIndex=0;SWEP.ScopeFOV=10;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=true;SWEP.ScopedBlur=false;SWEP.PrintName='Vulkan'SWEP.ScopeRotate=0;SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(15,-2.5,-4)SWEP.AmmoOffsetAng=Angle(0,-95,90)SWEP.CanPenetrate=false;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto','semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/tobester/weapons/v_hotson_blaster.mdl'SWEP.WorldModel='models/tobester/weapons/w_hotson_blaster.mdl'SWEP.Spawnable=true;SWEP.Primary.ClipSize=50;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.15;SWEP.FireSound=Sound'blaster.hotson_rifle'SWEP.RecoilAngle=Angle(-1.4,0,0)SWEP.HipSpread=.02;SWEP.AimSpread=.002;SWEP.VelocitySensitivity=0;SWEP.MaxSpreadInc=0;SWEP.SpreadPerShot=0;SWEP.SpreadCooldown=0;SWEP.Shots=1;SWEP.Damage=62;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.BulletDiameter=0;SWEP.CaseLength=0;SWEP.HasScope=true;SWEP.FadeCrosshairOnAim=true;SWEP.PreventQuickScoping=true;SWEP.UIPosition=Vector(0,-45,0)SWEP.UIAngle=Angle(0,-90,0)sound.Add({name='blaster.hotson_rifle',channel=CHAN_WEAPON,volume=.35,level=90,pitch={95,105},sound='weapons/hotson_rifle.wav'})
--addons/!lpakr_out/lua/weapons/swb_base/shared.lua:
AddCSLuaFile()AddCSLuaFile("cl_rendericon.lua")AddCSLuaFile("sh_attachments.lua")AddCSLuaFile("sh_bullets.lua")AddCSLuaFile("cl_model.lua")AddCSLuaFile("cl_hud.lua")AddCSLuaFile("sh_bonemods.lua")AddCSLuaFile("cl_calcview.lua")AddCSLuaFile("sh_move.lua")AddCSLuaFile("sh_sounds.lua")AddCSLuaFile("sh_cosmetics.lua")AddCSLuaFile("cl_playerbindpress.lua")AddCSLuaFile("sh_projectile.lua")include("sh_bonemods.lua")include("sh_projectile.lua")include("sh_bullets.lua")include("sh_move.lua")include("sh_sounds.lua")include("sh_cosmetics.lua")include("sh_attachments.lua")game.AddParticles("particles/swb_muzzle.pcf")PrecacheParticleSystem("swb_pistol_large")PrecacheParticleSystem("swb_pistol_med")PrecacheParticleSystem("swb_pistol_small")PrecacheParticleSystem("swb_rifle_large")PrecacheParticleSystem("swb_rifle_med")PrecacheParticleSystem("swb_rifle_small")PrecacheParticleSystem("swb_shotgun")PrecacheParticleSystem("swb_silenced")PrecacheParticleSystem("swb_silenced_small")PrecacheParticleSystem("swb_sniper")if SERVER then else include("cl_rendericon.lua")include("cl_calcview.lua")include("cl_playerbindpress.lua")include("cl_model.lua")include("cl_hud.lua")SWEP.DrawCrosshair=false;SWEP.BounceWeaponIcon=false;SWEP.DrawWeaponInfoBox=false;SWEP.CurFOVMod=0;SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.FadeCrosshairOnAim=true;SWEP.DrawAmmo=true;SWEP.DrawTraditionalWorldModel=false;SWEP.CrosshairEnabled=true;SWEP.ViewbobEnabled=true;SWEP.ViewbobIntensity=1;SWEP.ReloadViewBobEnabled=true;SWEP.RVBPitchMod=.5;SWEP.RVBYawMod=.5;SWEP.RVBRollMod=.5;SWEP.BulletDisplay=0;SWEP.Shell="mainshell"SWEP.ShellScale=1;SWEP.CSMuzzleFlashes=true;SWEP.ZoomWait=0;SWEP.FireModeDisplayPos="middle"SWEP.SwimPos=Vector(0,0,-2.461)SWEP.SwimAng=Vector(-26.57,0,0)SWEP.ZoomAmount=15;SWEP.RecoilSpeed=.8 end;SWEP.NPCNormalHoldType='smg'SWEP.WepDamageBoost=1;SWEP.WepDamageSideBoost=0;SWEP.ReloadState={NONE=0,START=1,TWO=2}SWEP.FadeCrosshairOnAim=true;SWEP.AimMobilitySpreadMod=0.5;SWEP.PenMod=1;SWEP.AmmoPerShot=1;SWEP.SWBWeapon=true;SWEP.Author="Spy"SWEP.Contact=""SWEP.Purpose=""SWEP.Instructions=""SWEP.ViewModelFOV=100;SWEP.ViewModelFlip=false;SWEP.ViewModel=""SWEP.WorldModel=""SWEP.AnimPrefix="fist"SWEP.Spawnable=false;SWEP.AdminSpawnable=false;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PlayBackRateHip=1;SWEP.PlayBackRate=1;SWEP.ReloadSpeed=1;SWEP.Chamberable=true;SWEP.UseHands=true;SWEP.CanPenetrate=false;SWEP.CanRicochet=false;SWEP.AddSafeMode=true;SWEP.SprintingEnabled=true;SWEP.HolsterUnderwater=true;SWEP.HolsterOnLadder=true;SWEP.BurstCooldownMul=1.75;SWEP.BurstSpreadIncMul=0.5;SWEP.BurstRecoilMul=0.85;SWEP.DeployTime=2;SWEP.Shots=1;SWEP.FromActionToNormalWait=0;SWEP.RecoilOnAim=.33;SWB_IDLE=0;SWB_RUNNING=1;SWB_AIMING=2;SWB_ACTION=3;SWEP.FireModeNames={["auto"]={display="FULL-AUTO",auto=true,burstamt=0,buldis=5},["direct"]={display="DIRECT",auto=true,burstamt=0,buldis=5},["semi"]={display="SEMI-AUTO",auto=false,burstamt=0,buldis=1},["tri"]={display="TRi-SHOT",auto=false,burstamt=3,buldis=1},["triup"]={display="TRi-VERT",auto=false,burstamt=3,buldis=1},["double"]={display="DOUBLE-ACTION",auto=false,burstamt=0,buldis=1},["bolt"]={display="BOLT-ACTION",auto=false,burstamt=0,buldis=1},["pump"]={display="PUMP-ACTION",auto=false,burstamt=0,buldis=1},["break"]={display="BREAK-ACTION",auto=false,burstamt=0,buldis=1},["2burst"]={display="2-ROUND BURST",auto=true,burstamt=2,buldis=2},["3burst"]={display="3-ROUND BURST",auto=true,burstamt=3,buldis=3},["safe"]={display="SAFE",auto=false,burstamt=0,buldis=0},["overcharge"]={display="OVERCHARGE",auto=false,burstamt=0,buldis=1},["laser"]={display="LASER",auto=false,burstamt=0,buldis=1}}local math=math;function SWEP:IsEquipment()return WEPS.IsEquipment(self)end;function SWEP:CalculateEffectiveRange()self.EffectiveRange=600;self.EffectiveRange=self.EffectiveRange*39.37;self.EffectiveRange=self.EffectiveRange*0.25;self.PenStr=200;self.PenetrativeRange=self.EffectiveRange*0.5 end;function SWEP:Initialize()self:SetHoldType(self.NormalHoldType)self:CalculateEffectiveRange()self.CHoldType=self.NormalHoldType;if self.Bodygroup then self:SetBodyGroups(self.Bodygroup)end;if self.AddSafeMode then table.insert(self.FireModes,#self.FireModes+1,"safe")end;t=self.FireModes[1]self.FireMode=t;t=self.FireModeNames[t]self.Primary.Auto=t.auto;self.BurstAmount=t.burstamt;self.ClipSize_Orig=self.Primary.ClipSize;self.Attachments={}self.OriginalStats={}if CLIENT then self.ViewModelFOV_Orig=self.ViewModelFOV;self.BulletDisplay=t.buldis;self.FireModeDisplay=t.display;if self.WM then self.WMEnt=ClientsideModel(self.WM,RENDERGROUP_BOTH)self.WMEnt:SetNoDraw(true)end;if self.LoadSkins then self:LoadSkins()end end;self:InitBoneMods()timer.Simple(1,function()if IsValid(self)then self:SetupAttachments()if IsValid(self:GetOwner())&&self:GetOwner():IsNPC()&&self.NPCNormalHoldType then self:SetHoldType(self.NPCNormalHoldType)end end end)self:SetReloadDelay(-1)self:OnInitialize()end;function SWEP:OnInitialize()end;function SWEP:OnHolster()end;function SWEP:OnDeploy()end;function SWEP:GetCurrentViewAffinity(a)local b=math.Clamp(self:GetViewAffinity(a)-(self.ShotgunReload&&0.13||0.18)*(CurTime()-self:GetViewAffinityTime())/self.FireDelay,0,2)return b end;function SWEP:SetupDataTables()self:DTVar("Int",0,"State")self:DTVar("Int",1,"Shots")self:DTVar("Bool",0,"Safe")self:NetworkVar("Bool",1,"Suppressed")self:NetworkVar("Int",2,"CustomReloadState")self:NetworkVar("Int",3,"BoneAnimationSetID")self:NetworkVar("Float",2,"ReloadDelay")self:NetworkVar("Float",3,"ReloadWait")self:NetworkVarNotify('BoneAnimationSetID',function(c,d,e,f)c.LastBoneAnimationID=e;c.AnimResetBones=true;if CLIENT then c:ResetBones()end end)if CLIENT then self:NetworkVarNotify('State',function(c,d,e,f)if c:GetOwner()!=LocalPlayer()||c.ThirdPerson then return end;if f==SWB_AIMING then EnableThirdPerson(!cvar.GetValue('srp_weapon_tp_ads'))else EnableThirdPerson(true)end end)end;if self.OnSetupDataTables then self:OnSetupDataTables()end end;local g,h,i;function SWEP:Deploy()self:SendWeaponAnim(self.AlreadyDrawn&&ACT_VM_DRAW||ACT_VM_READY)self.AlreadyDrawn=true;self.dt.State=SWB_IDLE;self.NPCOwned=self:GetOwner():IsNPC()local h=CurTime()self:SetNextSecondaryFire(h+.25)self:SetNextPrimaryFire(h+.25)if IsFirstTimePredicted()then self:SetDeployTime(self.DeployTime)end;if self.StartSafety then self:Safety()end;self:OnDeploy()return true end;function SWEP:SetDeployTime(j)self.DeployDuration=j;self.DeployingTime=CurTime()+j end;function SWEP:IsDeploying()return self.DeployingTime&&self.DeployingTime>CurTime()end;function SWEP:GetDeployTime()return self.DeployingTime end;function SWEP:GetDeployPercent()if!self.DeployingTime||self.DeployingTime<CurTime()then return 1 end;return(self.DeployingTime-CurTime())/self.DeployDuration end;function SWEP:Holster()self.TargetAnglesCur=nil;self.TargetAnglesFinish=nil;if CLIENT then self:ResetBones()if self:GetOwner()==LocalPlayer()then EnableThirdPerson(true)end end;if self:GetReloadDelay()!=-1 then return false end;self:SetCustomReloadState(self.ReloadState.NONE)self:SetReloadDelay(-1)self:OnHolster()self.dt.State=SWB_IDLE;return true end;local k;function SWEP:Reload()local h=CurTime()if self:GetReloadDelay()!=-1||h<self:GetReloadWait()||self.dt.State==SWB_ACTION||self:GetCustomReloadState()!=0 then return end;local l=self:GetOwner()if l:KeyDown(IN_SPEED)&&l:KeyDown(IN_USE)&&self.dt.State!=SWB_RUNNING then self:Safety()return end;if l:KeyDown(IN_USE)&&self.dt.State!=SWB_RUNNING then self:CycleFiremodes()return end;k=self:Clip1()if self.Chamberable&&k>=self.Primary.ClipSize||!self.Chamberable&&k>=self.Primary.ClipSize||l:GetAmmoCount(self.Primary.Ammo)==0 then return end;if self.dt.State!=SWB_RUNNING then self.dt.State=SWB_IDLE end;if self.ShotgunReload then self:SetCustomReloadState(self.ReloadState.START)self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)self:SetReloadDelay(h+self.ReloadStartWait)else if self.Chamberable then if k==0 then self.Primary.ClipSize=self.ClipSize_Orig else self.Primary.ClipSize=self.ClipSize_Orig+1 end end;local g=l:GetViewModel()if self.ReloadSegmented then self:SendWeaponAnim(ACT_VM_RELOAD)self:SetCustomReloadState(self.ReloadState.START)self:SetReloadDelay(h+(self.ReloadStartWait||1))if self.ReloadSegmentedFirst then if isnumber(self.ReloadSegmentedFirst)then g:SendViewModelMatchingSequence(self.ReloadSegmentedFirst)else g:SendViewModelMatchingSequence(g:LookupSequence(self.ReloadSegmentedFirst))end end else if self.ReloadWait then self:SetReloadDelay(h+self.ReloadWait)self:SetCustomReloadState(2)end;self:DefaultReload(ACT_VM_RELOAD)if self.ViewModelReload then if isnumber(self.ViewModelReload)then g:SendViewModelMatchingSequence(self.ViewModelReload)else g:SendViewModelMatchingSequence(g:LookupSequence(self.ViewModelReload))end end end;if self.OnReload then self:OnReload()end;l:SetAnimation(PLAYER_RELOAD)end end;function SWEP:CycleFiremodes()local m=self.FireModes;m.last=!m.last&&1||m.last>=#m-1&&1||m.last+1;if self.FireMode!=self.FireModes[m.last]&&self.FireModes[m.last]then h=CurTime()self:SelectFiremode(self.FireModes[m.last])self:SetNextPrimaryFire(h+0.25)self:SetNextSecondaryFire(h+0.25)self:SetReloadWait(h+0.25)self:OnFireModeChanged(self.FireMode)end end;function SWEP:OnFireModeChanged()end;function SWEP:OnSafety(n)end;function SWEP:Safety()h=CurTime()local n=self.FireMode&&self.FireMode=='safe'&&self.FireModes[self.FireModes.last||1]||'safe'self:SelectFiremode(n)self:SetNextSecondaryFire(h+25)self:SetNextPrimaryFire(h+.25)self:SetReloadWait(h+0.25)self:OnSafety(n)end;function SWEP:SelectFiremode(o)if CLIENT then return end;local t=self.FireModeNames[o]self.Primary.Automatic=t.auto;self.FireMode=o;self.BurstAmount=t.burstamt;if self.FireMode=="safe"then self.dt.Safe=true else self.dt.Safe=false end;net.Start("SWB_FIREMODE")net.WriteEntity(self:GetOwner())net.WriteString(o)net.Broadcast()end;local p=debug.getregistry()local q=p.Entity.GetVelocity;local r=p.Vector.Length;local s=p.Player.GetAimVector;local u=p.Player.GetCurrentCommand;local v=p.CUserCmd.CommandNumber;local w=game.SinglePlayer()local k,x;function SWEP:HasJetpack(l,y)if info.MRP then return false end;if y then return l:IsPlayer()&&!l:IsOnGround()&&IsValid(l:GetJetpack())else return l:IsPlayer()&&IsValid(l:GetJetpack())end end;function SWEP:ThirdPersonCamCheck(l)if(w&&SERVER||!w)&&self.dt.State==SWB_AIMING then if r(q(l))>=l:GetWalkSpeed()*1.35&&!self:HasJetpack(l,true)||self:GetOwner():GetInfoNum('srp_weapon_ads_toggle',0)==0&&!l:KeyDown(IN_ATTACK2)then h=CurTime()self.dt.State=SWB_IDLE;self:SetNextSecondaryFire(h+0.2)return end end end;local z,A;function SWEP:Think()local h=CurTime()local l=self:GetOwner()if!IsValid(l)then return end;self:ThirdPersonCamCheck(l)if self.IndividualThink then self:IndividualThink(l)end;local B=r(q(l))i=B;z=l:WaterLevel()local C=self:GetCustomReloadState()if l:OnGround()then if z>=3&&self.HolsterUnderwater then if C==self.ReloadState.START then self:SetCustomReloadState(2)end;self.dt.State=SWB_ACTION;self.FromActionToNormalWait=h+0.3 else A=l:GetWalkSpeed()if(i>A*1.2&&l:KeyDown(IN_SPEED)||i>A*3||self.ForceRunStateVelocity&&i>self.ForceRunStateVelocity)&&self.SprintingEnabled then self.dt.State=SWB_RUNNING elseif self.dt.State!=SWB_AIMING&&h>self.FromActionToNormalWait&&self.dt.State!=SWB_IDLE then self.dt.State=SWB_IDLE;self:SetNextPrimaryFire(self:GetNextPrimaryFire()+0.03)self:SetNextSecondaryFire(self:GetNextSecondaryFire()+0.03)self:SetReloadWait(h+0.3)end end else if z>1&&self.HolsterUnderwater||l:GetMoveType()==MOVETYPE_LADDER&&self.HolsterOnLadder then if C==self.ReloadState.START then self:SetCustomReloadState(2)end;self.dt.State=SWB_ACTION;self.FromActionToNormalWait=h+0.3 else if h>self.FromActionToNormalWait then if self.dt.State!=SWB_IDLE then self.dt.State=SWB_IDLE;self:SetNextPrimaryFire(self:GetNextPrimaryFire()+0.03)self:SetNextSecondaryFire(self:GetNextSecondaryFire()+0.03)self:SetReloadWait(h+0.3)end end end end;if self.dt.Shots>0 then if!l:KeyDown(IN_ATTACK)then if self.BurstAmount&&self.BurstAmount>0 then self.dt.Shots=0;self:SetNextPrimaryFire(h+self.FireDelay*self.BurstCooldownMul)self:SetReloadWait(h+self.FireDelay*self.BurstCooldownMul)end end end;if C==self.ReloadState.START then if self.CanCancelReload!=false&&l:KeyPressed(IN_ATTACK)then self:SetCustomReloadState(2)end;if h>self:GetReloadDelay()then self:SendWeaponAnim(self.ReloadSegmented&&ACT_VM_RELOAD_INSERT||ACT_VM_RELOAD)local D=self.ReloadAmmoCount||1;k,x=self:Clip1(),l:GetAmmoCount(self.Primary.Ammo)self:SetClip1(k+D)l:SetAmmo(x-D,self.Primary.Ammo)self:SetReloadDelay(h+(self.ReloadInsertWait||1))self:SetNextPrimaryFire(h+(self.ReloadInsertWait||1))self:SetNextSecondaryFire(h+(self.ReloadInsertWait||1))if k+D>=self.Primary.ClipSize||x<1 then self:SetCustomReloadState(2)end end elseif C==2 then if h>self:GetReloadDelay()then self:SendWeaponAnim(self.ReloadSegmented&&(self.ReloadSegmentedFinish||ACT_VM_RELOAD_END)||ACT_SHOTGUN_RELOAD_FINISH)self:SetCustomReloadState(self.ReloadState.NONE)self:SetNextPrimaryFire(h+(self.ReloadFinishWait||1))self:SetNextSecondaryFire(h+(self.ReloadFinishWait||1))self:SetReloadWait(h+(self.ReloadFinishWait||1))self:SetReloadDelay(-1)end end;if self.dt.Safe then if self.CHoldType!=self.RunHoldType then self:SetHoldType(self.RunHoldType)self.CHoldType=self.RunHoldType end else if self.dt.State==SWB_AIMING&&self.AimHoldType then if self.CHoldType!=self.AimHoldType then self:SetHoldType(self.AimHoldType)self.CHoldType=self.AimHoldType end elseif self.dt.State==SWB_RUNNING||self.dt.State==SWB_ACTION then if self.CHoldType!=self.RunHoldType then self:SetHoldType(self.RunHoldType)self.CHoldType=self.RunHoldType end else if self.CHoldType!=self.NormalHoldType then self:SetHoldType(self.NormalHoldType)self.CHoldType=self.NormalHoldType end end end;if self.OnAutoFireCompleteCooldown&&self.OnAutoFireCompleteCooldown<CurTime()then self.OnAutoFireCompleteCooldown=nil;self:OnShotCooldownPassed()end end;local E;function SWEP:PrimaryAttack()local h=CurTime()self:SetNextPrimaryFire(h+self.FireDelay)self:SetNextSecondaryFire(h+self.FireDelay)if self:IsDeploying()then return end;if self:GetCustomReloadState()!=self.ReloadState.NONE then return end;if self:GetReloadDelay()!=-1 then return end;if self.dt.Safe then self:EmitSound('SWB_Empty',100,100)return end;k=self:Clip1()if k==0 then self:EmitSound('SWB_Empty',100,100)self:SetNextPrimaryFire(h+0.25)return end;if self.dt.State==SWB_RUNNING||self.dt.State==SWB_ACTION then return end;if self.BurstAmount&&self.BurstAmount>0 then if self.dt.Shots>=self.BurstAmount then return end;self.dt.Shots=self.dt.Shots+1 end;local l=self:GetOwner()if self.FireAnimFunc then self:FireAnimFunc()else if l:IsPlayer()&&!l:IsProne()then l:SetAnimation(PLAYER_ATTACK1)end end;if self.FireAnimFunc then else if self.dt.State==SWB_AIMING then if k-self.AmmoPerShot<=0&&self.DryFire then if self:GetSuppressed()then self:SendWeaponAnim(ACT_VM_DRYFIRE_SILENCED)else self:SendWeaponAnim(ACT_VM_DRYFIRE)end else if self:GetSuppressed()then self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED)else self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_2)end end;if self.FadeCrosshairOnAim then l:GetViewModel():SetPlaybackRate(self.PlayBackRateSV||1)end else if k-self.AmmoPerShot<=0&&self.DryFire then if self:GetSuppressed()then self:SendWeaponAnim(ACT_VM_DRYFIRE_SILENCED)else self:SendWeaponAnim(ACT_VM_DRYFIRE)end else if self:GetSuppressed()then self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED)else self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)end end;if self.FadeCrosshairOnAim&&!(l:IsNPC()||l:IsNextBot())then l:GetViewModel():SetPlaybackRate(self.PlayBackRateHip||1)end end end;if IsFirstTimePredicted()then if self.FireSoundDynamic then elseif self.DoCustomFireSound&&self:DoCustomFireSound()then elseif self:GetSuppressed()then self:EmitSound(CLIENT&&self.FireSoundSuppressedFP||self.FireSoundSuppressed,105,100)else self:EmitSound(CLIENT&&self.FireSoundFP||self.FireSound,105,100)end end;local F=self:GetCurrentCone()if self.Projectile then self:FireProjectile(self.Damage)else if!self:DoCustomFire(self.Damage,F,self.Shots)then self:FireBullet(self.Damage,F,self.Shots)end end;if CLIENT&&IsFirstTimePredicted()then if self.dt.State==SWB_AIMING then self.FireMove=1 else self.FireMove=0.4 end end;self:OnFired()self:MakeRecoil(F)if self.Primary.ClipSize>0 then self:TakePrimaryAmmo(math.min(k,self.AmmoPerShot))end;self:SetReloadWait(h+(self.WaitForReloadAfterFiring&&self.WaitForReloadAfterFiring||self.FireDelay))self.OnAutoFireCompleteCooldown=h+(self.ShotCooldown||.2)end;function SWEP:OnFired()end;function SWEP:DoCustomFire()end;function SWEP:OnShotCooldownPassed()end;local G=Angle()function SWEP:GetCurrentCone()local l=self:GetOwner()local H=l:IsPlayer()&&l:IsProne()||false;local I=l:IsPlayer()&&l:Crouching()||false;local J=I&&self.RecoilCrouchAngleSpread||H&&self.RecoilProneAngleSpread||self.RecoilAngleSpread||G;local F=I&&self.RecoilCrouchAngle||H&&self.RecoilProneAngle||self.RecoilAngle||Angle(-self.Recoil,0,0)F=Angle(F.p+math.random(-J.p,J.p),F.y+math.random(-J.y,J.y),F.r+math.random(-J.r,J.r))return self.dt.State!=SWB_AIMING&&F*self.RecoilOnAim||F end;function SWEP:DoWeaponKick(l,K)math.randomseed(v(u(l)))l:ViewPunchReset(10)l:ViewPunch(K*.1)return K end;function SWEP:MakeRecoil(F)local l=self:GetOwner()if IsFirstTimePredicted()&&l:IsPlayer()then self:DoWeaponKick(l,F)if CLIENT then self:SetTargetEyeAngles(F)end end end;function SWEP:Equip()self.TargetAnglesCur=nil;self.TargetAnglesFinish=nil end;function SWEP:SetTargetEyeAngles(L)self.TargetAnglesCur=Angle()self.TargetAnglesFinish=L end;function SWEP:SecondaryAttack()if self.NoAiming then return end;if self:GetCustomReloadState()!=self.ReloadState.NONE then return end;if self:GetReloadDelay()!=-1 then return end;if self.dt.Safe then return end;if self.dt.State==SWB_RUNNING||self.dt.State==SWB_ACTION then return end;h=CurTime()local M=self:GetOwner():GetInfoNum('srp_weapon_ads_toggle',0)==1;local l=self:GetOwner()if l:IsPlayer()&&!l:GetJetpack()&&r(q(l))>=l:GetWalkSpeed()*1.2 then return end;local N=l:KeyDownLast(IN_ATTACK2)if M&&!N then self.dt.State=self.dt.State==SWB_AIMING&&SWB_IDLE||SWB_AIMING;self:SetNextSecondaryFire(h+.2)elseif!M then self.dt.State=SWB_AIMING;self:SetNextSecondaryFire(h+.1)end;if IsFirstTimePredicted()&&self.dt.State!=SWB_AIMING then self.AimTime=CurTime()+.2 end end;if CLIENT then local O,P,Q;function SWEP:ViewModelDrawn(g)O,P,Q=EyePos(),EyeAngles(),FrameTime()if IsValid(self.Hands)then self.Hands:SetRenderOrigin(O)self.Hands:SetRenderAngles(P)self.Hands:FrameAdvance(Q)self.Hands:SetupBones()self.Hands:SetParent(self:GetOwner():GetViewModel())self.Hands:DrawModel()end;self:DrawAttachments(g)self:DoViewModelBoneAnimation(g)end;local R,S,T;local U=debug.getregistry().Entity.GetBonePosition;local function V()local W=net.ReadEntity()local X=net.ReadString()if IsValid(W)then local Y=W:GetActiveWeapon()Y.FireMode=X;if IsValid(W)&&IsValid(Y)&&Y.SWBWeapon then if Y.FireModeNames then local t=Y.FireModeNames[X]Y.Primary.Automatic=t.auto;Y.BurstAmount=t.burstamt;Y.FireModeDisplay=t.display;Y.BulletDisplay=t.buldis;Y.CheckTime=CurTime()+2;Y:OnFireModeChanged(X)if W==LocalPlayer()then W:EmitSound("weapons/smg1/switch_single.wav",70,math.random(92,112))end end end end end;net('SWB_FIREMODE',V)local Z=.8;hook.Add('PlayerTick',function(_)local a0=_:GetActiveWeapon()if!IsValid(a0)||!a0.TargetAnglesCur||!a0.TargetAnglesFinish then return end;local a1=a0.RecoilSpeed||Z;if IsFirstTimePredicted()&&a0.TargetAnglesCur!=a0.TargetAnglesFinish then if!a0.TargetAnglesCur then a0.TargetAnglesCur=Angle()end;local a2=Angle()a2.p=math.Approach(a0.TargetAnglesCur.p,a0.TargetAnglesFinish.p,a1)a2.y=math.Approach(a0.TargetAnglesCur.y,a0.TargetAnglesFinish.y,a1)local a3=a2-a0.TargetAnglesCur;a0.TargetAnglesCur=a2;_:SetEyeAngles(_:EyeAngles()+a3)if _.camera_ang then _.camera_ang.p=math.Clamp(math.NormalizeAngle(_.camera_ang.p+a3.p*1.2),-90,90)_.camera_ang.y=math.NormalizeAngle(_.camera_ang.y+a3.y/50)end end end)end
--addons/!lpakr_out/lua/weapons/swb_base/sh_move.lua:
local function a(b,c)if b:IsProne()then return end;local d=b:GetCustomBoneAnimTable()if d&&d.MovementSpeed then return end;local e=b:GetActiveWeapon()if IsValid(e)&&b:IsSprinting()&&e.SWBWeapon&&e.SpeedDec then local f=b:GetRunSpeed()-e.SpeedDec;c:SetMaxClientSpeed(f)c:SetMaxSpeed(f)end end;hook.Add('Move','SWB_SpeedMove',a)
--addons/!lpakr_out/lua/weapons/swb_base/sh_attachments.lua:
if CLIENT then function SWEP:OnRemove()self:RemoveAttachments()end end
--addons/!lpakr_out/lua/weapons/weapon_base/sh_anim.lua:
local a={["pistol"]=ACT_HL2MP_IDLE_PISTOL,["smg"]=ACT_HL2MP_IDLE_SMG1,["grenade"]=ACT_HL2MP_IDLE_GRENADE,["ar2"]=ACT_HL2MP_IDLE_AR2,["shotgun"]=ACT_HL2MP_IDLE_SHOTGUN,["rpg"]=ACT_HL2MP_IDLE_RPG,["physgun"]=ACT_HL2MP_IDLE_PHYSGUN,["crossbow"]=ACT_HL2MP_IDLE_CROSSBOW,["melee"]=ACT_HL2MP_IDLE_MELEE,["slam"]=ACT_HL2MP_IDLE_SLAM,["normal"]=ACT_HL2MP_IDLE,["fist"]=ACT_HL2MP_IDLE_FIST,["melee2"]=ACT_HL2MP_IDLE_MELEE2,["passive"]=ACT_HL2MP_IDLE_PASSIVE,["knife"]=ACT_HL2MP_IDLE_KNIFE,["duel"]=ACT_HL2MP_IDLE_DUEL,["camera"]=ACT_HL2MP_IDLE_CAMERA,["magic"]=ACT_HL2MP_IDLE_MAGIC,["revolver"]=ACT_HL2MP_IDLE_REVOLVER}function SWEP:SetWeaponHoldType(b)b=string.lower(b)local c=a[b]if c==nil&&!wOS.AnimExtension.TranslateHoldType[b]then Msg("SWEP:SetWeaponHoldType - ActIndex[ \""..b.."\" ] isn't set! (defaulting to normal)\n")b="normal"c=a[b]end;if wOS.AnimExtension.TranslateHoldType[b]then self.ActivityTranslate=table.Copy(wOS.AnimExtension.TranslateHoldType[b]:GetActivityList())else self.ActivityTranslate={}self.ActivityTranslate[ACT_MP_STAND_IDLE]=c;self.ActivityTranslate[ACT_MP_WALK]=c+1;self.ActivityTranslate[ACT_MP_RUN]=c+2;self.ActivityTranslate[ACT_MP_CROUCH_IDLE]=c+3;self.ActivityTranslate[ACT_MP_CROUCHWALK]=c+4;self.ActivityTranslate[ACT_MP_ATTACK_STAND_PRIMARYFIRE]=c+5;self.ActivityTranslate[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]=c+5;self.ActivityTranslate[ACT_MP_RELOAD_STAND]=c+6;self.ActivityTranslate[ACT_MP_RELOAD_CROUCH]=c+6;self.ActivityTranslate[ACT_MP_JUMP]=c+7;self.ActivityTranslate[ACT_RANGE_ATTACK1]=c+8;self.ActivityTranslate[ACT_MP_SWIM]=c+9 end;if b=="normal"then self.ActivityTranslate[ACT_MP_JUMP]=ACT_HL2MP_JUMP_SLAM end;self:SetupWeaponHoldTypeForAI(b)end;SWEP:SetWeaponHoldType("pistol")function SWEP:TranslateActivity(d)if self.Owner:IsNPC()then if self.ActivityTranslateAI[d]then return self.ActivityTranslateAI[d]end;return-1 end;if self.ActivityTranslate[d]!=nil then return self.ActivityTranslate[d]end;return-1 end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_baton.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_bowcaster.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.PrintName='Bowcaster'SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0.5,-5,0)SWEP.AimPos=Vector(-3.7,0,0)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(5,-4,-2)SWEP.SprintAng=Vector(-15,0,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'local a=Sound'weapons/BOWCASTER_fire.wav'local b=Sound'weapons/BOWCASTER_reload.wav'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Event Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/weapons/v_BOWCASTER.mdl'SWEP.WorldModel='models/weapons/w_BOWCASTER.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=50;SWEP.Primary.DefaultClip=5;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.75;SWEP.FireSound=a;SWEP.ReloadSound=b;SWEP.RecoilAngle=Angle(-.5,0,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.01;SWEP.AimSpread=.01;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=175;SWEP.DeployTime=0;SWEP.ShowHands=false;SWEP.FadeCrosshairOnAim=false;SWEP.TracerName='sup_laser_green'SWEP.Primary.TracerName='sup_laser_green'SWEP.ImpactEffectColor=Vector(0,250,0)SWEP.FireModes={'auto','tri','triup'}SWEP.AmmoPerShot=1;SWEP.NoAiming=true;SWEP.UIPosition=Vector(0,-50,0)SWEP.UIAngle=Angle(0,90,0)function SWEP:OnFireModeChanged(c)if c=='tri'||c=='triup'then self.AmmoPerShot=3;self.Damage=100;self.HipSpread=0;self.AimSpread=0;self.RecoilAngle=Angle(-3,0,0)else self.AmmoPerShot=1;self.Damage=150;self.HipSpread=.02;self.AimSpread=.02;self.RecoilAngle=Angle(-.5,0,0)end end;local d=Vector()function SWEP:DoCustomFire(e,f,g)if self.FireMode=='tri'then self:FireBullet(e,d,1,offsetPos)self:FireBullet(e,d,1,-Vector(0,25,0))self:FireBullet(e,d,1,Vector(0,25,0))return true elseif self.FireMode=='triup'then self:FireBullet(e,d,1,offsetPos)self:FireBullet(e,d,1,-Vector(0,0,25))self:FireBullet(e,d,1,Vector(0,0,25))return true end end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/weapons/weapon_datapad.lua:
AddCSLuaFile()SWEP.PrintName='Datapad'SWEP.Author='Goldermor'SWEP.Contact=''SWEP.Purpose='Datapad'SWEP.Instructions='Datapad'SWEP.Category='SUP Weapons'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.AdminOnly=false;SWEP.Slot=1;SWEP.SlotPos=1;SWEP.DrawAmmo=false;SWEP.HoldType="slam"SWEP.ViewModelFOV=50;SWEP.ViewModel='models/swcw_items/sw_datapad_v.mdl'SWEP.WorldModel='models/swcw_items/sw_datapad.mdl'SWEP.ViewModelFlip=false;SWEP.AutoSwitchTo=true;SWEP.AutoSwitchFrom=false;SWEP.UseHands=true;SWEP.HoldType='slam'SWEP.DrawCrosshair=true;SWEP.DrawAmmo=false;SWEP.Base="weapon_base"SWEP.Primary.Damage=0;SWEP.Primary.ClipSize=-1;SWEP.Primary.Delay=0;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Damage=0;SWEP.Secondary.Automatic=false;SWEP.Secondary.Ammo="none"function SWEP:Initialize()self:SetWeaponHoldType'slam'end;function SWEP:PrimaryAttack()end;function SWEP:SecondaryAttack()end;function SWEP:Reload()end
--addons/!lpakr_out/lua/weapons/weapon_grenadebase/shared.lua:
game.AddDecal('grenade_blast_1','materials/grenades/blast_1')SWEP.Base='weapon_base'SWEP.Category='SUP Weapons'SWEP.PrintName='Base Grenade'SWEP.Author='Scott'SWEP.Purpose='It\'s a grenade'SWEP.Spawnable=false;SWEP.Slot=3;SWEP.SlotPos=0;SWEP.DrawCrosshair=false;SWEP.IsGrenade=true;SWEP.ViewModelFOV=55;SWEP.DrawAmmo=true;SWEP.DrawAmmoGlobal=true;SWEP.DrawAmmoEmptyText='NO GRENADES!'SWEP.Ammo3D=false;SWEP.UseHands=true;SWEP.HoldType='grenade'SWEP.Cooldown=20;SWEP.AmmoType='grenade'SWEP.Primary.Ammo='grenade'SWEP.Primary.ClipSize=1;SWEP.Primary.DefaultClip=1;SWEP.Primary.Automatic=false;SWEP.Secondary.Ammo='grenade'SWEP.Secondary.ClipSize=1;SWEP.Secondary.DefaultClip=1;SWEP.Secondary.Automatic=false;SWEP.ViewModel='models/weapons/c_grenade.mdl'SWEP.WorldModel='models/weapons/w_grenade.mdl'SWEP.WorldMaterial='models/weapons/v_models/grenades/bacta_grenade'SWEP.ViewMaterial='models/weapons/v_models/grenades/bacta_grenade'SWEP.GrenadeEnt='rp_grenade_health'SWEP.HasTalentStats=true;SWEP.UIPosition=Vector(0,-65,-5)SWEP.UIAngle=Angle(0,-45,0)SWEP.SoundRoll='WeaponFrag.Roll'SWEP.Impact=false;SWEP.Range=175;SWEP.Damage=500;GRENADE_PAUSED_NO=0;GRENADE_PAUSED_PRIMARY=1;GRENADE_PAUSED_SECONDARY=2;function SWEP:Initialize()self.Thrown=0;self.Attachments={}self.OriginalStats={}self.AttackPaused=GRENADE_PAUSED_NO;self.DrawbackFinished=false;self:SetHoldType(self.HoldType)if self.WorldMaterial then self:SetMaterial(self.WorldMaterial)end end;function SWEP:SetupAttack(a,b,c)if self.m_bRedraw then return end;if!self:HasRequiredAmmo()then return false end;self.Thrown=self.Thrown+1;self.AttackPaused=c;local d=self:GetOwner()d:SetAnimation(b)self:SendWeaponAnim(a)end;function SWEP:PrimaryAttack()self:SetupAttack(ACT_VM_PULLBACK_HIGH,PLAYER_ATTACK1,GRENADE_PAUSED_PRIMARY)self:SetNextPrimaryFire(math.huge)end;function SWEP:SecondaryAttack()self:SetupAttack(ACT_VM_PULLBACK_LOW,PLAYER_ATTACK1,GRENADE_PAUSED_SECONDARY)self:SetNextSecondaryFire(math.huge)end;function SWEP:Deploy()self.m_bRedraw=false;self.DrawbackFinished=false;self:SendWeaponAnim(ACT_VM_DRAW)return true end;function SWEP:Holster()self.m_bRedraw=false;self.DrawbackFinished=false;self:SendWeaponAnim(ACT_VM_HOLSTER)return true end;function SWEP:HasRequiredAmmo()return self:Clip1()>0||self:GetOwner():GetAmmoCount(self.Primary.Ammo)>0 end;function SWEP:Reload()if!self:HasRequiredAmmo()then return false end;local e=CurTime()if self.m_bRedraw&&self:GetNextPrimaryFire()<=e&&self:GetNextSecondaryFire()<=e then self:SendWeaponAnim(ACT_VM_DRAW)local f=self:SequenceDuration(ACT_VM_DRAW)self:SetNextPrimaryFire(e+f)self:SetNextSecondaryFire(e+f)self.m_bRedraw=false end;return true end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_cleaver.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category='SUP Custom Weapons'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/galactic/weapons/weeb_cleaver/weeb_cleaver.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Weeb Cleaver"SWEP.Class="weapon_lightsaber_cleaver"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=200;SWEP.SaberBurnDamage=10;SWEP.MaxForce=250;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.DamageType=DMG_DISSOLVE;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb","Force Heal","Force Pull","Saber Throw","Force Repulse","Force Push"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=false;SWEP.NoGlow=true;SWEP.UseHilt="models/galactic/weapons/weeb_cleaver/weeb_cleaver.mdl"SWEP.UseLength=20;SWEP.UseWidth=.5;SWEP.UseDarkInner=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;sound.Add({name='weeb_loop',channel=CHAN_STATIC,volume=1.0,level=95,pitch={95,110},sound='lightsaber/saber_loop7.wav'})SWEP.UseLoopSound='weeb_loop'SWEP.UseSwingSound=Sound'lightsaber/darksaber_swing.wav'SWEP.UseOnSound=Sound'lightsaber/saber_on_kylo.wav'SWEP.UseOffSound=Sound'lightsaber/saber_off_kylo.wav'SWEP.Base="wos_adv_single_lightsaber_base"SWEP.HolsterBone='forward'function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*-14+c:Up()*-7.5;c:RotateAroundAxis(c:Up(),75)c:RotateAroundAxis(c:Forward(),75)return b,c end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dreadsk2.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dual_sentinel.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Dual Sentinel Lightsabers"SWEP.Class="weapon_lightsaber_dual_sentinel"SWEP.DualWielded=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_dual_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_falcon.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_lamit.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_moe.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David + Scott"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/galactic/weapons/saberpike/saberpike.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Moe's Pike"SWEP.Class="weapon_lightsaber_moe"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.IgnoreHiltCosmetic=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=false;SWEP.NoGlow=true;SWEP.UseHilt="models/tobester/weapons/moe/moe_staff.mdl"SWEP.UseLength=50;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"SWEP.HolsterBone='forward'SWEP.DamageType=DMG_DISSOLVE;function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*-10+c:Up()*-6;c:RotateAroundAxis(c:Up(),45)return b,c end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_saberpike.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_saberpike.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David + Scott"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/galactic/weapons/saberpike/saberpike.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Saber Pike"SWEP.Class="weapon_lightsaber_saberpike"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.IgnoreHiltCosmetic=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=false;SWEP.NoGlow=true;SWEP.UseHilt="models/galactic/weapons/saberpike/saberpike.mdl"SWEP.UseLength=50;SWEP.UseWidth=false;SWEP.UseColor=Color(255,50,255)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"SWEP.HolsterBone='forward'function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*-10+c:Up()*-6;c:RotateAroundAxis(c:Up(),45)return b,c end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_scott.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_wos.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=false;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Lightsaber"SWEP.Class="weapon_lightsaber_wos"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=false;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.MaxForce=150;SWEP.RegenSpeed=1;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Force Leap","Force Absorb","Force Heal","Group Heal","Cloak","Charge","Force Lightning","Force Repulse"}SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_se14c.lua:
if CLIENT then SWEP.Author="Syntax_Error752"SWEP.ViewModelFOV=70;SWEP.Slot=1;SWEP.SlotPos=5;SWEP.WepSelectIcon=surface.GetTextureID("HUD/killicons/SE14C")killicon.Add("weapon_se14c","HUD/killicons/se14c",Color(255,80,0,255))end;SWEP.PrintName="SE-14C"SWEP.HoldType="pistol"SWEP.Base="swsft_base"SWEP.Category='SUP Event Weapons'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.ViewModel="models/weapons/v_se14c.mdl"SWEP.WorldModel="models/weapons/w_se14c.mdl"local a=Sound("weapons/SE14C_fire.wav")local b=Sound("weapons/SE14C_reload.wav")SWEP.Weight=5;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.Primary.Recoil=0.5;SWEP.Primary.Damage=60;SWEP.Primary.NumShots=1;SWEP.Primary.Cone=0.04;SWEP.Primary.ClipSize=25;SWEP.Primary.Delay=0.2;SWEP.Primary.DefaultClip=25;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="ammo_blaster"SWEP.Primary.Tracer="sup_laser_red"SWEP.ImpactEffectColor=Vector(255,0,0)SWEP.Secondary.Automatic=false;SWEP.Secondary.Ammo="none"SWEP.IronSightsPos=Vector(-3.7,-9,1)function SWEP:PrimaryAttack()self.Weapon:SetNextSecondaryFire(CurTime()+self.Primary.Delay)self.Weapon:SetNextPrimaryFire(CurTime()+self.Primary.Delay)if!self:CanPrimaryAttack()then return end;self.Weapon:EmitSound(a)self:CSShootBullet(self.Primary.Damage,self.Primary.NumShots,self.Primary.Cone)self:TakePrimaryAmmo(1)end;function SWEP:CSShootBullet(c,d,e)d=d||1;e=e||0.01;local f=self:GetOwner()local g={}g.Num=d;g.Src=f:GetShootPos()g.Dir=f:GetAimVector()g.Spread=Vector(e,e,0)g.Tracer=1;g.TracerName=self.Primary.Tracer;g.Force=5;g.Damage=c;f:FireBullets(g)self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)f:MuzzleFlash()f:SetAnimation(PLAYER_ATTACK1)end;function SWEP:Reload()local f=self:GetOwner()if self:GetNWBool("Scoped")then self.Weapon:SetNWBool("Scoped",false)f:GetViewModel():SetNoDraw(false)f:SetFOV(0,0.25)self:AdjustMouseSensitivity()end;if self.Weapon:Clip1()<self.Primary.ClipSize then if f:GetAmmoCount(self.Primary.Ammo)>0 then self.Weapon:EmitSound(b)end;self.Weapon:DefaultReload(ACT_VM_RELOAD_EMPTY)self:SetIronsights(false)end end;function SWEP:SecondaryAttack()if!self.IronSightsPos then return end;if self.NextSecondaryAttack>CurTime()then return end;local h=!self.Weapon:GetNetworkedBool("Ironsights",false)self:SetIronsights(h)self.NextSecondaryAttack=CurTime()+0.3;local f=self:GetOwner()if self:GetNWBool("Scoped")then self.Weapon:SetNWBool("Scoped",false)f:GetViewModel():SetNoDraw(false)f:SetFOV(0,0.25)self:AdjustMouseSensitivity()elseif!self:GetNWBool("Scoped")then self.Weapon:SetNWBool("Scoped",true)f:GetViewModel():SetNoDraw(true)f:SetFOV(40,0.25)self:AdjustMouseSensitivity()self.Weapon:EmitSound("weapons/scope_zoom_sw752.wav")end end;function SWEP:AdjustMouseSensitivity()if self:GetNWBool("Scoped")then return 0.1 else if!self:GetNWBool("Scoped")then return-1 end end end;function SWEP:DrawHUD()if CLIENT then if!self:GetNWBool("Scoped")then local f=self:GetOwner()local i,j;if f==LocalPlayer()&&f:ShouldDrawLocalPlayer()then local k=util.GetPlayerTrace(f)local l=util.TraceLine(k)local m=l.HitPos:ToScreen()i,j=m.x,m.y else i,j=ScrW()/2.0,ScrH()/2.0 end;local n=10*self.Primary.Cone;local o=self.Weapon:GetNetworkedFloat("LastShootTime",0)n=n*(2-math.Clamp((CurTime()-o)*5,0.0,1.0))surface.SetDrawColor(255,0,0,255)local p=40*n;local q=p+20*n;surface.DrawLine(i-q,j,i-p,j)surface.DrawLine(i+q,j,i+p,j)surface.DrawLine(i,j-q,i,j-p)surface.DrawLine(i,j+q,i,j+p)return end;local r=ScrH()/480;local s,t=320*r,240*r;local u,v=ScrW()/2,ScrH()/2;local w=surface.GetTextureID("hud/scopes/752/scope_synsw_lr")local x=surface.GetTextureID("hud/scopes/752/scope_synsw_ll")local y=surface.GetTextureID("hud/scopes/752/scope_synsw_ul")local z=surface.GetTextureID("hud/scopes/752/scope_synsw_ur")local A=-0.75;local B=-2.782;local C=0.4;local i=ScrW()/2.0;local j=ScrH()/2.0;surface.SetDrawColor(0,0,0,255)local p=0;local q=p+9999;surface.SetDrawColor(0,0,0,255)render.UpdateRefractTexture()surface.SetDrawColor(255,255,255,255)surface.SetTexture(w)surface.DrawTexturedRect(u,v,s,t)surface.SetTexture(x)surface.DrawTexturedRect(u-s,v,s,t)surface.SetTexture(y)surface.DrawTexturedRect(u-s,v-t,s,t)surface.SetTexture(z)surface.DrawTexturedRect(u,v-t,s,t)surface.SetDrawColor(0,0,0,255)if u-s>0 then surface.DrawRect(0,0,u-s,ScrH())surface.DrawRect(u+s,0,u-s,ScrH())end end end
--addons/!lpakr_out/lua/weapons/wos_adv_dual_lightsaber_base/cl_init.lua:
include("shared.lua")local a=Material("lightsaber/selection.png")local b=96;local c={col.red,col.blue,col.purple,col.pink,col.white}local d={function(e,f)return Vector()end,function(e,f)return e:Up()*f end,function(e,f)return-e:Up()*f end,function(e,f)return e:Right()*f end,function(e,f)return-e:Right()*f end,function(e,f)return e:Up()*f*4 end,function(e,f)return-e:Up()*f*4 end,function(e,f)return e:Right()*f*4 end,function(e,f)return-e:Right()*f*4 end}local function g(self,h,i,j)local k,e;if j then k,e=self:GetSaberSecPosAng(i)else k,e=self:GetSaberPosAng(i)end;local l=self:GetBladeLength()-1;local f=self:GetNextPrimaryFire()<CurTime()&&2||8;local m=e:Angle()for n=1,9 do local o=k+d[n](m,f)debugoverlay.Line(o,o+e*l,4,c[n],true)end end;function SWEP:DrawWeaponSelection(p,q,r,s,t)surface.SetDrawColor(255,255,255,t)surface.SetMaterial(a)render.PushFilterMag(TEXFILTER.ANISOTROPIC)render.PushFilterMin(TEXFILTER.ANISOTROPIC)surface.DrawTexturedRect(p+(r-b)/2,q+(s-b)/2.5,b,b)render.PopFilterMag()render.PopFilterMin()end;function SWEP:DrawWorldModel()self:DrawWorldModelTranslucent()end;local u={'blade1','blade2','blade3'}function SWEP:DrawWorldModelTranslucent()self.WorldModel=self:GetWorldModel()self:SetModel(self:GetWorldModel())local h=self:GetOwner()if!IsValid(h)||h:IsCloaked()then return end;self:DrawModel()if self.NoBlade then return end;local v=self:GetCrystalColor()local w=self.Blade||wOS.GetBlade(self:GetBladeID()||1,true)local x=false;local y=-1;for n=1,#u do if self:LookupAttachment(u[n])>0 then y=y+1;rb655_RenderBladeExtended(self,n,v,false,y,w)x=true end end;if!x then rb655_RenderBladeExtended(self,0,v,false,0,w)end end;surface.CreateFont("SelectedForceType",{font="Roboto Cn",size=ScreenScale(16),weight=600})surface.CreateFont("SelectedForceHUD",{font="Roboto Cn",size=ScreenScale(6)})local z=CreateClientConVar("rb655_lightsaber_hud_blur","0")local A=Material("gui/gradient_up")local B=Color(0,0,0,200)local C=Color(0,128,255,4)local function D(p,q,r,s,E,F)p=math.floor(p)q=math.floor(q)r=math.floor(r)s=math.floor(s)draw.NoTexture()surface.SetDrawColor(B)surface.DrawTexturedRect(p,q,r,s)surface.SetDrawColor(B)surface.DrawRect(p,q,r,s)if F then surface.SetMaterial(A)surface.SetDrawColor(C)surface.DrawTexturedRect(p,q,r,s)end;if E then surface.SetDrawColor(255,255,255,100)surface.SetMaterial(E)surface.DrawTexturedRect(p,q,r,s)end end;local G=16;function SWEP:DrawHUDTargetSelection()local H=self:GetActiveForcePowerType(self:GetForceType())if!H then return end;local I=H.target;local J=H.distance;if I then local K=self:SelectTargets(I,J,H.targetnpcs,H.targetclass)for n,L in ipairs(K)do if IsValid(L)then local M=L:OBBMaxs()local N=L:GetPos()N.z=N.z+M.z;local k=N:ToScreen()local p,q=k.x,k.y-50;local O=L.Health&&L:Health()||0;draw.DrawText(O..' HP','ui_label.s',p,q,col.white,TEXT_ALIGN_CENTER)surface.SetDrawColor(n==1&&col.orange||col.green)draw.NoTexture()surface.DrawPoly({{x=p-G,y=q-G},{x=p+G,y=q-G},{x=p,y=q}})end end end end;local P=0;local Q=100;local R=0;function SWEP:DrawHUD()local h=self:GetOwner()if!IsValid(h)||h:GetViewEntity()!=h||h:InVehicle()then return end;srp.weapons.DrawCircleCrosshair()local S=self:GetActiveForcePowers()local T=#S<1;if T&&!self.ShowForceBar then GAMEMODE:DrawCompassTop(h)self:DrawHUDTargetSelection()return end;local U=52;local V=5;local W=4;local X=16;P=Lerp(0.1,P,math.Clamp(self:GetForce()/self.MaxForce,0,1))R=math.min(100,Lerp(0.1,R,math.floor(self:GetDevEnergy())))local r=#S*U+(#S-1)*V;if wOS.ForceSelectMenu then r=9*U+8*V end;local s=X;local p=math.floor(ScrW()/2-r/2)local q=ScrH()-V-X;D(p,q,r,s)local Y=math.ceil(r*P)if self:GetForce()<=1&&Y<=1 then Y=0 end;draw.RoundedBox(0,p,q,Y,s,self.ForceSelectEnabled&&col.red||col.blue_light)local Z=math.ceil(r*R/100)if self:GetDevEnergy()<=1&&Z<=1 then Z=0 end;draw.RoundedBox(0,p,q,Z,s,self.ForceSelectEnabled&&col.red_dark||col.blue)draw.SimpleText(math.floor(self:GetForce()),"SelectedForceHUD",p+r/2,q+s/2+1,col.white,1,1)local _=self:GetStance()local a0=self:GetForm()local a1=wOS.Form.LocalizedForms[a0]if a1 then draw.SimpleText(a1 ..' ('.._..')',"SelectedForceHUDSmall",p+10,q+s/2,col.white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)end;if T then GAMEMODE:DrawCompassTop(h)self:DrawHUDTargetSelection()return end;local a2=cvar.GetValue('lightsaber_simpleability')if!wOS.ForceSelectMenu then q=q-U-V;s=U;for i,a3 in pairs(S)do local p=p+(i-1)*(s+V)local a4=math.floor(p+U/2)D(p,q,s,s,wOS.ForceIcons[a3.name],self:GetForceType()==i,a2)if self.ForceSelectEnabled then surface.SetDrawColor(col.red)surface.DrawOutlinedRect(p,q,s,s)end;if self.ForceSelectEnabled||a2 then draw.SimpleText(i,'ui_label.rb',a4,q+s*.5,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)draw.SimpleText(a3.name||'',"ui_label.rb",a4,q+s-15,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)else draw.SimpleText(i,'ui_label.rb',a4,q+s*.5,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)draw.SimpleText(a2&&a3.name||a3.icon,'ui_label.rb',a4,q+s-15,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;if self:GetForceType()==i then draw.RoundedBox(0,p,q+U-W,s,W,self.ForceSelectEnabled&&col.red||col.blue_light)end end end;local a5=math.Round(nw.GetGlobal('WOS_DamageScaling')||1,2)if a5!=1 then draw.SimpleText(a5*100 ..'% Damage Scale Enabled',"ui_label.l",p+r/2,q-15,col.yellow,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;GAMEMODE:DrawCompassTop(h)self:DrawHUDTargetSelection()end
--addons/!lpakr_out/lua/weapons/wos_adv_single_lightsaber_base/cl_init.lua:
include("shared.lua")local a=Material("lightsaber/selection.png")local b=96;local c={col.red,col.blue,col.purple,col.pink,col.white}local d={function(e,f)return Vector()end,function(e,f)return e:Up()*f end,function(e,f)return-e:Up()*f end,function(e,f)return e:Right()*f end,function(e,f)return-e:Right()*f end,function(e,f)return e:Up()*f*2 end,function(e,f)return-e:Up()*f*2 end,function(e,f)return e:Right()*f*2 end,function(e,f)return-e:Right()*f*2 end}local function g(self,h,i)local j,e=self:GetSaberPosAng(i)local k=self:GetBladeLength()local f=self:GetNextPrimaryFire()<CurTime()&&2||8;local l=e:Angle()for m=1,9 do local n=j+d[m](l,f)debugoverlay.Line(n,n+e*k,.2,c[m],true)end end;function SWEP:DrawWeaponSelection(o,p,q,r,s)surface.SetDrawColor(255,255,255,s)surface.SetMaterial(a)render.PushFilterMag(TEXFILTER.ANISOTROPIC)render.PushFilterMin(TEXFILTER.ANISOTROPIC)surface.DrawTexturedRect(o+(q-b)/2,p+(r-b)/2.5,b,b)render.PopFilterMag()render.PopFilterMin()end;function SWEP:DrawWorldModel()self:DrawWorldModelTranslucent()end;local t={'blade1','blade2','blade3'}function SWEP:DrawWorldModelTranslucent()self.WorldModel=self:GetWorldModel()self:SetModel(self:GetWorldModel())local h=self:GetOwner()if!IsValid(h)then return end;if h:IsCloaked()&&h:GetVelocity():Length()<130 then return end;self:DrawModel()if self.NoBlade then return end;local u=self:GetCrystalColor()local v=false;local w=0;local x=self.Blade||wOS.GetBlade(self:GetBladeID()||1,true)local y=self.Blade2||wOS.GetBlade(self:GetBladeID2()||2,true)local z=false;for m=1,#t do if self:LookupAttachment(t[m])>0 then w=w+1;rb655_RenderBladeExtended(self,m,w==1&&u||(self:GetSecCrystalColor()||u),false,w,w==1&&x||y)z=true end end;if!z then for m=1,#t do local A=self:LookupBone(t[m])if A&&A>0 then w=w+1;rb655_RenderBladeExtended(self,m,w==1&&u||(self:GetSecCrystalColor()||u),false,w,w==1&&x||y,nil,A)z=true end end end;if!z then rb655_RenderBladeExtended(self,bladeNum||0,u,false,0,x)end end;surface.CreateFont("SelectedForceType",{font="Roboto Cn",size=ScreenScale(16),weight=600})surface.CreateFont("SelectedForceHUD",{font="Roboto Cn",size=ScreenScale(6)})surface.CreateFont("SelectedForceHUDSmall",{font="Roboto Cn",size=12})local B=CreateClientConVar("rb655_lightsaber_hud_blur","0")local C=Material("gui/gradient_up")local D=Color(0,0,0,200)local E=Color(0,128,255,4)local function F(o,p,q,r,G,H,I)o=math.floor(o)p=math.floor(p)q=math.floor(q)r=math.floor(r)draw.NoTexture()surface.SetDrawColor(D)surface.DrawTexturedRect(o,p,q,r)surface.SetDrawColor(D)surface.DrawRect(o,p,q,r)if H then surface.SetMaterial(C)surface.SetDrawColor(E)surface.DrawTexturedRect(o,p,q,r)end;if!I&&G then surface.SetDrawColor(255,255,255,100)surface.SetMaterial(G)surface.DrawTexturedRect(o,p,q,r)end end;local J=16;function SWEP:DrawHUDTargetSelection()local K=self:GetActiveForcePowerType(self:GetForceType())if!K then return end;local L=K.target;local M=K.distance;if L then local N=self:SelectTargets(L,M,K.targetnpcs,K.targetclass)for m,O in ipairs(N)do if IsValid(O)then local P=O:OBBMaxs()local Q=O:GetPos()Q.z=Q.z+P.z;local j=Q:ToScreen()local o,p=j.x,j.y-50;local R=O.Health&&O:Health()||0;draw.DrawText(R..' HP','ui_label.s',o,p,col.white,TEXT_ALIGN_CENTER)surface.SetDrawColor(m==1&&col.orange||col.green)draw.NoTexture()surface.DrawPoly({{x=o-J,y=p-J},{x=o+J,y=p-J},{x=o,y=p}})end end end end;local S=0;local T=100;local U=0;function SWEP:DrawHUD()local h=self:GetOwner()if!IsValid(h)||h:GetViewEntity()!=h||h:InVehicle()then return end;srp.weapons.DrawCircleCrosshair()local V=self:GetActiveForcePowers()local W=#V<1;if W&&!self.ShowForceBar then GAMEMODE:DrawCompassTop(h)self:DrawHUDTargetSelection()return end;local X=52;local Y=5;local Z=4;local _=16;S=Lerp(0.1,S,math.Clamp(self:GetForce()/self.MaxForce,0,1))U=math.min(100,Lerp(0.1,U,math.floor(self:GetDevEnergy())))local q=#V*X+(#V-1)*Y;if wOS.ForceSelectMenu then q=9*X+8*Y end;local r=_;local o=math.floor(ScrW()/2-q/2)local p=ScrH()-Y-_;F(o,p,q,r)local a0=math.ceil(q*S)if self:GetForce()<=1&&a0<=1 then a0=0 end;draw.RoundedBox(0,o,p,a0,r,self.ForceSelectEnabled&&col.red||col.blue_light)local a1=math.ceil(q*U/100)if self:GetDevEnergy()<=1&&a1<=1 then a1=0 end;draw.RoundedBox(0,o,p,a1,r,self.ForceSelectEnabled&&col.red_dark||col.blue)draw.SimpleText(math.floor(self:GetForce()),"SelectedForceHUD",o+q/2,p+r/2+1,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)local a2=self:GetStance()local a3=self:GetForm()local a4=wOS.Form.LocalizedForms[a3]if a4 then draw.SimpleText(a4 ..' ('..a2 ..')',"SelectedForceHUDSmall",o+10,p+r/2,col.white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)end;if W then GAMEMODE:DrawCompassTop(h)self:DrawHUDTargetSelection()return end;local I=cvar.GetValue('lightsaber_simpleability')if!wOS.ForceSelectMenu then p=p-X-Y;r=X;for i,a5 in pairs(V)do local o=o+(i-1)*(r+Y)local a6=math.floor(o+X/2)F(o,p,r,r,wOS.ForceIcons[a5.name],self:GetForceType()==i,I)if self.ForceSelectEnabled then surface.SetDrawColor(col.red)surface.DrawOutlinedRect(o,p,r,r)end;if self.ForceSelectEnabled||I then draw.SimpleText(i,'ui_label.rb',a6,p+r*.5,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)draw.SimpleText(a5.name||'',"ui_label.rb",a6,p+r-15,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)else draw.SimpleText(i,'ui_label.rb',a6,p+r*.5,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)draw.SimpleText(I&&a5.name||a5.icon,'ui_label.rb',a6,p+r-15,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;if self:GetForceType()==i then draw.RoundedBox(0,o,p+X-Z,r,Z,self.ForceSelectEnabled&&col.red||col.blue_light)end end end;local a7=math.Round(nw.GetGlobal('WOS_DamageScaling')||1,2)if a7!=1 then draw.SimpleText(a7*100 ..'% Damage Scale Enabled',"ui_label.l",o+q/2,p-15,col.yellow,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;GAMEMODE:DrawCompassTop(h)self:DrawHUDTargetSelection()end
--addons/!lpakr_out/lua/entities/b2_rocket/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/base_srp/cl_init.lua:
dash.IncludeSH'shared.lua'ENT.Draw=ENTITY.DrawModel;local a=ui.col.White:Copy()local b=ui.col.Black:Copy()local c=Angle(0,0,90)function ENT:DrawIcon3d2d(d,e,f,g,h,i)local j,k=self:InDistance(150000)if!j then return j,k end;e:RotateAroundAxis(e:Right(),(e-LocalPlayer():EyeAngles()).y+90)local l=255-k/590;a.a=l;b.a=l;local m=math.sin(CurTime()*math.pi)*30;cam.Start3D2D(d,e,f)surface.SetDrawColor(255,255,255,l)surface.SetMaterial(g)surface.DrawTexturedRect(-64,-246+m,128,128)draw.SimpleTextOutlined(h,'3d2d',0,m,a,TEXT_ALIGN_CENTER,TEXT_ALIGN_BOTTOM,1,b)if i then draw.SimpleTextOutlined(i,'3d2d',0,m+110,a,TEXT_ALIGN_CENTER,TEXT_ALIGN_BOTTOM,1,b)end;cam.End3D2D()return j,k end;function ENT:SendPlayerUse(n)net.Start'srp.EntityUse'net.WriteEntity(self)net.WriteBool(n==true)self:WritePlayerUse()net.SendToServer()end;function ENT:WritePlayerUse()end;function ENT:ReadPlayerUse()end;net('srp.EntityUse',function()local o=net.ReadEntity()if o.ClientPlayerUse then o:ClientPlayerUse(o:ReadPlayerUse())elseif o.PlayerUse then o:PlayerUse(o:ReadPlayerUse())end end,false)
--addons/!lpakr_out/lua/entities/base_wire_entity.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot/ai.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot/weapons.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/entity_helpers.lua:
if!istable(ENT)then return end;function ENT:PrintPoseParameters()for a=0,self:GetNumPoseParameters()-1 do local b,c=self:GetPoseParameterRange(a)print(self:GetPoseParameterName(a).." "..b.." / "..c)end end;function ENT:PrintAnimations()for a,d in pairs(self:GetSequenceList())do local e=self:GetSequenceActivity(a)if e!=-1 then print(a.." => "..d.." / "..e.." => "..self:GetSequenceActivityName(a))else print(a.." => "..d.." / -1")end end end;function ENT:PrintBones()for a=0,self:GetBoneCount()-1 do local f=self:GetBoneName(a)if f==nil then continue end;print(a.." => "..f)end end;function ENT:PrintAttachments()for a,g in ipairs(self:GetAttachments())do print(g.id.." => "..g.name)end end;function ENT:PrintBodygroups()for a,h in ipairs(self:GetBodyGroups())do print(h.id.." => "..h.name.." ("..h.num.." subgroups)")end end;function ENT:Timer(...)return self:DrG_Timer(...)end;function ENT:LoopTimer(...)return self:DrG_LoopTimer(...)end;function ENT:TraceLine(i,j)return self:DrG_TraceLine(i,j)end;function ENT:TraceHull(i,j)return self:DrG_TraceHull(i,j)end;function ENT:TraceLineRadial(k,l,j)return self:DrG_TraceLineRadial(k,l,j)end;function ENT:TraceHullRadial(k,l,j)return self:DrG_TraceHullRadial(k,l,j)end;function ENT:ScreenShake(m,n,o,p)return util.ScreenShake(self:GetPos(),m,n,o,p)end;function ENT:GetCooldown(q)local r=self:GetNW2Float("DrGBaseCooldowns/"..tostring(q),false)if r!=false then return math.Clamp(r-CurTime(),0,math.huge)else return 0 end end;function ENT:NetMessage(q,...)return net.DrG_Send("DrGBaseEntMessage",q,self,...)end;function ENT:_HandleNetMessage()end;function ENT:OnNetMessage()end;if SERVER then else local function s(q,self,...)if!IsValid(self)then return end;if isfunction(self._HandleNetMessage)&&isfunction(self.OnNetMessage)then if q=="DrGBaseCallOnClient"then local t,u=table.DrG_Pack(...)local v=table.remove(t,1)if isfunction(self[v])then self[v](self,table.DrG_Unpack(t,u-1))end elseif!self:_HandleNetMessage(q,...)then self:OnNetMessage(q,...)end else timer.DrG_Simple(engine.TickInterval(),s,q,self,...)end end;net.DrG_Receive("DrGBaseEntMessage",s)function ENT:NetCallback(q,w,...)if!isfunction(w)then return end;return net.DrG_UseCallback(q,function(...)if IsValid(self)then w(self,...)end end,self,...)end;function ENT:DynamicLight(x,p,y,z,A)return self:DrG_DynamicLight(x,p,y,z,A)end end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/behaviours.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot_droidbase/shared.lua:
ENT.Base="drgbase_nextbot"ENT.IsDrGNextbotHuman=true;ENT.CWRP=true;ENT.BehaviourType=AI_BEHAV_HUMAN;ENT.RangeAttackRange=1500;ENT.MeleeAttackRange=0;ENT.ReachEnemyRange=1000;ENT.AvoidEnemyRange=750;ENT.AvoidAfraidOfRange=200;ENT.WatchAfraidOfRange=500;ENT.RagdollOnDeath=true;ENT.Spawnable=true;DrGBase.IncludeFile'animations.lua'DrGBase.IncludeFile'movements.lua'ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbSpeed=60;ENT.ClimbUpAnimation=ACT_ZOMBIE_CLIMB_UP;ENT.ClimbOffset=Vector(-14,0,0)ENT.EyeBone="ValveBiped.Bip01_Head1"ENT.EyeOffset=Vector(5,0,2.5)ENT.UseWeapons=true;ENT.Weapons={'weapon_e5'}ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=true;ENT.PossessionEnabled=false;ENT.PossessionPrompt=false;ENT.PossessionCrosshair=false;ENT.PossessionMovement=POSSESSION_MOVE_8DIR;ENT.PossessionViews={{offset=Vector(0,30,20),distance=100},{offset=Vector(7.5,0,2.5),distance=0,eyepos=true}}ENT.PossessionBinds={[IN_DUCK]={{coroutine=false,onkeypressed=function(self)self:SetCrouching(!self:IsCrouching())end}},[IN_ATTACK]={{coroutine=true,onkeydown=function(self)self:PrimaryFire()end}},[IN_ATTACK2]={{coroutine=true,onkeydown=function(self)self:SecondaryFire()end}},[IN_RELOAD]={{coroutine=true,onkeydown=function(self)self:Reload()end}}}ENT.Factions={FACTION_COMBINE}ENT.UseWalkframes=true;ENT.WeaponAccuracy=0.75
--addons/!lpakr_out/lua/entities/drgbase_nextbot_human/animations.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot_human/movements.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/dronesrewrite_republic/shared.lua:
ENT.Base='dronesrewrite_base'ENT.Type='anim'ENT.PrintName='Republic Drone'ENT.Spawnable=false;ENT.AdminSpawnable=false;ENT.Category='Drones Rewrite'ENT.UNIT='CAM'ENT.Model='models/props_phx/cannonball_solid.mdl'ENT.FirstPersonCam_pos=Vector(4.5,0,-3.6)ENT.ThirdPersonCam_distance=30;ENT.DoExplosionEffect='splode_drone_sparks'ENT.AngOffset=4;ENT.Alignment=0.5;ENT.HealthAmount=300;ENT.DefaultHealth=300;ENT.Speed=1000;ENT.SprintCoefficient=1.7;ENT.RotateSpeed=4;ENT.Fuel=40;ENT.MaxFuel=40;ENT.HUD_hudName='Camera'ENT.OverlayName='No Overlay'ENT.UseNightVision=false;ENT.UseFlashlight=false;ENT.KeysFuncs=DRONES_REWRITE.DefaultKeys()ENT.AllowYawRestrictions=false;ENT.YawMin=-55;ENT.YawMax=55;ENT.PitchMin=-15;ENT.RenderCam=false;ENT.Slots={['Camera']=1}ENT.Sounds={PropellerSound={Name='drones/ardr.wav',Pitch=5,Level=45,PitchCoef=0.01,Volume=0.02},ExplosionSound={Name='ambient/energy/spark3.wav',Level=100,Pitch=150}}ENT.NoPropellers=true;ENT.Propellers={Damage=1,Health=10,HitRange=7,HitPitch=255,HitLevel=60,RandomHitSounds={'physics/metal/metal_box_impact_bullet2.wav','physics/metal/metal_box_impact_bullet2.wav','physics/metal/metal_box_impact_bullet2.wav'},RandomLoseSounds={'physics/glass/glass_cup_break1.wav','physics/glass/glass_cup_break2.wav'},LosePitch=255,LoseLevel=65,Info={Vector(6.4,9.15,1.5),Vector(-6.4,-9.15,1.5),Vector(-6.4,9.15,1.5),Vector(6.4,-9.15,1.5)}}ENT.Weapons={['Camera']={Name='Camera'}}ENT.Modules={}
--addons/!lpakr_out/lua/entities/e60r_rocket/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/furniture_wardrobe.lua:
AddCSLuaFile()ENT.PrintName='Furniture - Wardrobe'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Type='anim'ENT.Base='base_srp'ENT.Contact=''ENT.Purpose=''ENT.Instructions=''ENT.Spawnable=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Model='models/props_wasteland/controlroom_storagecloset001a.mdl'ENT.Interactive=true;ENT.InteractionName='Wardrobe'ENT.NetworkPlayerUse=true;function ENT:Initialize()end;function ENT:ClientPlayerUse()srp.menu.Open('Cosmetics',true)end;local a=20;function ENT:DrawInteraction(b,c,d)surface.SetFont'ui_header.s'surface.SetDrawColor(255,255,255,255)surface.SetMaterial(b.OnPickup)surface.SetTextColor(255,255,255,255)local e=self.InteractionName||''local f,g=surface.GetTextSize(e)f=f+a+4;local h,i=d.x,d.y;surface.DrawTexturedRect(h,i,a,a)surface.SetTextPos(h+a+2,i-2)surface.DrawText(e)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gmod_cameraprop.lua:
AddCSLuaFile()if CLIENT then CreateConVar("cl_drawcameras","1",0,"Should the cameras be visible?")end;ENT.Type="anim"ENT.PrintName="Camera"local a=Model("models/dav0r/camera.mdl")function ENT:SetupDataTables()self:NetworkVar("Int",0,"Key")self:NetworkVar("Bool",0,"On")self:NetworkVar("Vector",0,"vecTrack")self:NetworkVar("Entity",0,"entTrack")self:NetworkVar("Entity",1,"Player")end;function ENT:Initialize()end;function ENT:SetTracking(b,c)if IsValid(b)then self:SetMoveType(MOVETYPE_NONE)self:SetSolid(SOLID_BBOX)else self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)end;self:NextThink(CurTime())self:SetvecTrack(c)self:SetentTrack(b)end;function ENT:SetLocked(d)if d==1 then self.PhysgunDisabled=true;self:SetMoveType(MOVETYPE_NONE)self:SetSolid(SOLID_BBOX)self:SetCollisionGroup(COLLISION_GROUP_WORLD)else self.PhysgunDisabled=false end;self.locked=d end;function ENT:OnTakeDamage(e)if self.locked then return end;self:TakePhysicsDamage(e)end;function ENT:OnRemove()if IsValid(self.UsingPlayer)then self.UsingPlayer:SetViewEntity(self.UsingPlayer)end end;function ENT:Think()if CLIENT then self:TrackEntity(self:GetentTrack(),self:GetvecTrack())end end;function ENT:TrackEntity(f,g)if!IsValid(f)then return end;local h=f:LocalToWorld(g)if f:IsPlayer()then h=h+f:GetViewOffset()*0.85 end;local i=self:GetPos()local j=h-i;j=j:Angle()self:SetAngles(j)end;function ENT:CanTool(k,l,m)if self:GetMoveType()==MOVETYPE_NONE then return false end;return true end;function ENT:Draw(n)if GetConVarNumber("cl_drawcameras")==0 then return end;local o=LocalPlayer():GetActiveWeapon()if IsValid(o)&&o:GetClass()=="gmod_camera"then return end;self:DrawModel(n)end
--addons/!lpakr_out/lua/entities/gmod_contr_spawner/cl_init.lua:
include("shared.lua")function ENT:Draw()self.BaseClass.Draw(self)self.Entity:DrawModel()end
--addons/!lpakr_out/lua/entities/gmod_wire_colorer.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Colorer"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WireDebugName="Colorer"function ENT:SetupDataTables()self:NetworkVar("Float",0,"BeamLength")end;if CLIENT then local a=64;function ENT:GetWorldTipBodySize()local b,c=surface.GetTextSize("Input color:\n255,255,255,255")b=math.max(b,a)local d,e=surface.GetTextSize("Target color:\n255,255,255,255")b=b+18+math.max(d,a)c=math.max(c,e)c=c+18+a+18/2;return b,c end;local f=Color(255,255,255,255)local g=Color(0,0,0,255)local function h(i,j,k)surface.SetDrawColor(i.r,i.g,i.b,i.a)surface.DrawRect(j,k,a,a)local l=a;surface.SetDrawColor(0,0,0)surface.DrawLine(j,k,j+l,k)surface.DrawLine(j+l,k,j+l,k+l)surface.DrawLine(j+l,k+l,j,k+l)surface.DrawLine(j,k+l,j,k)end;function ENT:DrawWorldTipBody(m)local n=self:GetOverlayData()local o=Color(n.r||255,n.g||255,n.b||255,n.a||255)local p=util.TraceLine({start=self:GetPos(),endpos=self:GetPos()+self:GetUp()*self:GetBeamLength(),filter={self}})local q=Color(255,255,255,255)if IsValid(p.Entity)then q=p.Entity:GetColor()end;local r=string.format("Input color:\n%d,%d,%d,%d",o.r,o.g,o.b,o.a)local d,e=surface.GetTextSize(r)draw.DrawText(r,"GModWorldtip",m.min.x+m.edgesize+d/2,m.min.y+m.edgesize,f,TEXT_ALIGN_CENTER)local r=string.format("Target color:\n%d,%d,%d,%d",q.r,q.g,q.b,q.a)local s,t=surface.GetTextSize(r)draw.DrawText(r,"GModWorldtip",m.max.x-d/2-m.edgesize,m.min.y+m.edgesize,f,TEXT_ALIGN_CENTER)local e=math.max(e,t)local j=m.min.x+m.edgesize+d/2-a/2;local k=m.min.y+m.edgesize*1.5+e;h(o,j,k)local j=m.max.x-m.edgesize-d/2-a/2;local k=m.min.y+m.edgesize*1.5+e;h(q,j,k)end;return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=WireLib.CreateSpecialInputs(self,{"Fire","R","G","B","A","RGB"},{"NORMAL","NORMAL","NORMAL","NORMAL","NORMAL","VECTOR"})self.Outputs=WireLib.CreateOutputs(self,{"Out"})self.InColor=Color(255,255,255,255)self:SetBeamLength(2048)self:ShowOutput()end;function ENT:Setup(u,v)if u then self.outColor=u;WireLib.AdjustOutputs(self,{"R","G","B","A"})else WireLib.AdjustOutputs(self,{"Out"})end;if v then self:SetBeamLength(v)end;self:ShowOutput()end;function ENT:TriggerInput(w,x)if w=="Fire"&&x!=0 then local y=self:GetPos()local z=self:GetUp()local p=util.TraceLine{start=y,endpos=y+z*self:GetBeamLength(),filter={self}}if!IsValid(p.Entity)then return end;if!WireLib.CanTool(self:GetPlayer(),p.Entity,"colour")then return end;if p.Entity:IsPlayer()then p.Entity:SetColor(Color(self.InColor.r,self.InColor.g,self.InColor.b,255))else WireLib.SetColor(p.Entity,Color(self.InColor.r,self.InColor.g,self.InColor.b,self.InColor.a))end elseif w=="R"then self.InColor.r=math.Clamp(x,0,255)self:ShowOutput()elseif w=="G"then self.InColor.g=math.Clamp(x,0,255)self:ShowOutput()elseif w=="B"then self.InColor.b=math.Clamp(x,0,255)self:ShowOutput()elseif w=="A"then self.InColor.a=math.Clamp(x,0,255)self:ShowOutput()elseif w=="RGB"then self.InColor=Color(x.x,x.y,x.z,self.InColor.a)self:ShowOutput()end end;function ENT:ShowOutput()self:SetOverlayData({r=self.InColor.r,g=self.InColor.g,b=self.InColor.b,a=self.InColor.a})end;function ENT:Think()BaseClass.Think(self)if self.outColor then local y=self:GetPos()local z=self:GetUp()local p={}p.start=y;p.endpos=y+z*self:GetBeamLength()p.filter={self}local p=util.TraceLine(p)if!IsValid(p.Entity)then WireLib.TriggerOutput(self,"R",255)WireLib.TriggerOutput(self,"G",255)WireLib.TriggerOutput(self,"B",255)WireLib.TriggerOutput(self,"A",255)else local A=p.Entity:GetColor()WireLib.TriggerOutput(self,"R",A.r)WireLib.TriggerOutput(self,"G",A.g)WireLib.TriggerOutput(self,"B",A.b)WireLib.TriggerOutput(self,"A",A.a)end end;self:NextThink(CurTime()+0.1)return true end;duplicator.RegisterEntityClass("gmod_wire_colorer",WireLib.MakeWireEnt,"Data","outColor","Range")
--addons/!lpakr_out/lua/entities/gmod_wire_damage_detector.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Damage Detector"ENT.Author="Jimlad"ENT.WireDebugName="Damage Detector"if CLIENT then return end;local a={n={},ntypes={},s={},stypes={},size=0}local b={}local function c(d,e,f,g,h)if g>0 then for i,j in pairs(b)do local k=i;if IsValid(k)then if k.on then if!k.updated then k:UpdateLinkedEnts()k.updated=true;k:NextThink(CurTime())end;if k.key_ents[d]then k:UpdateDamage(h,d)end end else b[i]=nil end end end end;hook.Add("EntityTakeDamage","CheckWireDamageDetectors",function(d,h)if!next(b)then return end;c(d,h:GetInflictor(),h:GetAttacker(),h:GetDamage(),h)end)function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Outputs=WireLib.CreateSpecialOutputs(self,{"Clk","Damage","Attacker","Victim","Victims","Position","Force","Type"},{"NORMAL","NORMAL","ENTITY","ENTITY","TABLE","VECTOR","VECTOR","STRING"})self.Inputs=WireLib.CreateInputs(self,{"On","Entity (This entity will be added whenever this input changes to a valid entity) [ENTITY]","Entities (These entities will be added whenever this input changes.\nCan be changed at most once per second.) [ARRAY]","Reset"})self.on=false;self.updated=false;self.hit=false;self.firsthit_dmginfo={}self.linked_entities={}self.linked_entities_lookup={}self:LinkEnt(self)self.count=0;self.key_ents={}self.victims=table.Copy(a)WireLib.TriggerOutput(self,"Victims",self.victims)self.damage=0;b[self]=true end;function ENT:OnRemove()b[self]=nil;Wire_Remove(self)self:ClearEntities()end;function ENT:ShowOutput()local l=#self.linked_entities;self:SetOverlayText(string.format("(%s)\nLinked to %s entities%s",self.includeconstrained==0&&"Individual Props"||"Constrained Props",l,l==1&&self.linked_entities[1]==self&&"\nLinked only to self"||""))end;function ENT:Setup(m)self.includeconstrained=m;self:ShowOutput()end;function ENT:LinkEnt(d,n)if!d||!d:IsValid()then return end;if self.linked_entities_lookup[d]then return false end;self.linked_entities_lookup[d]=true;self.linked_entities[#self.linked_entities+1]=d;d:CallOnRemove("DDetector.Unlink",function(d)if IsValid(self)then self:UnlinkEnt(d)end end)if!n then self:ShowOutput()end;WireLib.SendMarks(self,self.linked_entities)return true end;function ENT:UnlinkEnt(d)if!self.linked_entities_lookup[d]then return false end;self.linked_entities_lookup[d]=nil;for o=1,#self.linked_entities do if self.linked_entities[o]==d then table.remove(self.linked_entities,o)break end end;d:RemoveCallOnRemove("DDetector.Unlink")self:ShowOutput()WireLib.SendMarks(self,self.linked_entities)return true end;function ENT:ClearEntities()for o=1,#self.linked_entities do if IsValid(self.linked_entities[o])then self.linked_entities[o]:RemoveCallOnRemove("DDetector.Unlink")end end;self.linked_entities={}self.linked_entities_lookup={}self:ShowOutput()WireLib.SendMarks(self,self.linked_entities)return true end;function ENT:TriggerInput(p,q)if p=="On"then self.on=q!=0 elseif p=="Entities"then if q then if self.arrayInputNextChange&&self.arrayInputNextChange>CurTime()then return end;self:ClearEntities()for j,r in pairs(q)do if IsValid(r)then self:LinkEnt(r,true)end end;self.arrayInputNextChange=CurTime()+1;self:ShowOutput()end elseif p=="Entity"then if IsValid(q)then self:LinkEnt(q)end elseif p=="Reset"then if q then self.count=0;self.firsthit_dmginfo={}self.victims=table.Copy(a)self.damage=0;self:TriggerOutput()end end end;function ENT:TriggerOutput()local f=self.firsthit_dmginfo[1]WireLib.TriggerOutput(self,"Attacker",IsValid(f)&&f||NULL)local s=self.firsthit_dmginfo[2]WireLib.TriggerOutput(self,"Victim",IsValid(s)&&s||NULL)self.victims.size=table.Count(self.victims.s)WireLib.TriggerOutput(self,"Victims",self.victims||table.Copy(a))WireLib.TriggerOutput(self,"Position",self.firsthit_dmginfo[3]||Vector(0,0,0))WireLib.TriggerOutput(self,"Force",self.firsthit_dmginfo[4]||Vector(0,0,0))WireLib.TriggerOutput(self,"Type",self.firsthit_dmginfo[5]||"")WireLib.TriggerOutput(self,"Damage",self.damage||0)WireLib.TriggerOutput(self,"Clk",self.count)end;function ENT:UpdateLinkedEnts()if#self.linked_entities==0 then return end;self.key_ents={}for o=1,#self.linked_entities do local d=self.linked_entities[o]if IsValid(d)then if self.includeconstrained==1 then self:UpdateConstrainedEnts(d)end;self.key_ents[d]=true else self.linked_entities[d]=nil end end end;function ENT:UpdateConstrainedEnts(d)local t=constraint.GetAllConstrainedEntities(d)for j,r in pairs(t)do self.key_ents[r]=true end end;local u={[DMG_GENERIC]="Generic",[DMG_CRUSH]="Crush",[DMG_BULLET]="Bullet",[DMG_SLASH]="Slash",[DMG_BURN]="Burn",[DMG_VEHICLE]="Vehicle",[DMG_FALL]="Fall",[DMG_BLAST]="Explosive",[DMG_CLUB]="Club",[DMG_SHOCK]="Shock",[DMG_SONIC]="Sonic",[DMG_ENERGYBEAM]="Laser",[DMG_DROWN]="Drown",[DMG_PARALYZE]="Poison",[DMG_POISON]="Poison",[DMG_NERVEGAS]="Neurotoxin",[DMG_RADIATION]="Radiation",[DMG_ACID]="Toxic",[DMG_PHYSGUN]="Gravgun",[DMG_PLASMA]="Plasma",[DMG_AIRBOAT]="AirboatGun",[DMG_ENERGYBEAM]="Laser",[DMG_DIRECT]="Direct"}function ENT:UpdateDamage(h,d)local v=h:GetDamage()if!self.hit then self.firsthit_dmginfo={h:GetAttacker(),d,h:GetDamagePosition(),h:GetDamageForce()}self.dmgtype=u[h:GetDamageType()]||"Other"self.victims=table.Copy(a)self.firsthit_dmginfo[5]=self.dmgtype;self.hit=true end;if self.dmgtype=="Explosive"then if self.damage<v then self.damage=v;self.firsthit_dmginfo[2]=d end else self.damage=self.damage+v end;local w=tostring(d:EntIndex())self.victims.s[w]=(self.victims[w]||0)+v;self.victims.stypes[w]="n"self.count=self.count+1;if self.count==math.huge then self.count=0 end end;function ENT:Think()self.updated=false;self.hit=false;if self.damage>0 then self:TriggerOutput()self.damage=0 end;return true end;duplicator.RegisterEntityClass("gmod_wire_damage_detector",WireLib.MakeWireEnt,"Data","includeconstrained")function ENT:BuildDupeInfo()local x=BaseClass.BuildDupeInfo(self)||{}if#self.linked_entities>0 then x.linked_entities={}for o=1,#self.linked_entities do if IsValid(self.linked_entities[o])then x.linked_entities[o]=self.linked_entities[o]:EntIndex()else self.linked_entities[o]=nil end end end;return x end;function ENT:ApplyDupeInfo(y,d,x,z)BaseClass.ApplyDupeInfo(self,y,d,x,z)if x.linked_entities then if type(x.linked_entities)=="number"then self:LinkEnt(z(x.linked_entities))else for o=1,#x.linked_entities do self:LinkEnt(z(x.linked_entities[o]))end end end;self:ShowOutput()timer.Simple(0.1,function()if IsValid(self)then WireLib.SendMarks(self,self.linked_entities)end end)end
--addons/!lpakr_out/lua/entities/gmod_wire_dataplug.lua:
AddCSLuaFile()DEFINE_BASECLASS("gmod_wire_plug")ENT.PrintName="Wire Plug"ENT.WireDebugName="DataPlug"function ENT:GetSocketClass()return"gmod_wire_datasocket"end;if CLIENT then function ENT:DrawEntityOutline()end;return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Memory=nil;self.Inputs=WireLib.CreateInputs(self,{"Memory"})self.Outputs=WireLib.CreateOutputs(self,{"Connected"})WireLib.TriggerOutput(self,"Connected",0)end;function ENT:Setup()end;function ENT:ResendValues()WireLib.TriggerOutput(self,"Connected",1)end;function ENT:ResetValues()WireLib.TriggerOutput(self,"Connected",0)end;function ENT:ReadCell(a,b)b=b||0;if b>50 then return end;a=math.floor(a)if IsValid(self.Socket)&&self.Socket.OwnMemory&&self.Socket.OwnMemory.ReadCell then return self.Socket.OwnMemory:ReadCell(a,b+1)end;return nil end;function ENT:WriteCell(a,c,b)b=b||0;if b>50 then return end;a=math.floor(a)if IsValid(self.Socket)&&self.Socket.OwnMemory&&self.Socket.OwnMemory.WriteCell then return self.Socket.OwnMemory:WriteCell(a,c,b+1)end;return false end;function ENT:TriggerInput(d,c,e)if d=="Memory"then self.Memory=self.Inputs.Memory.Src;if IsValid(self.Socket)then self.Socket:SetMemory(self.Memory)end end end;duplicator.RegisterEntityClass("gmod_wire_dataplug",WireLib.MakeWireEnt,"Data")
--addons/!lpakr_out/lua/entities/gmod_wire_dhdd.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Dupeable Hard Drive"ENT.Author="Divran"ENT.WireDebugName="Dupeable HDD"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Outputs=WireLib.CreateOutputs(self,{"Memory [ARRAY]","Size"})self.Inputs=WireLib.CreateInputs(self,{"Data [ARRAY]","Clear","AllowWrite"})self.Memory={}self.Size=0;self.ROM=false;self.AllowWrite=true;self:SetOverlayText("DHDD")end;function ENT:ReadCell(a)if a<0||a>=262144 then return 0 end;a=math.floor(a)local b=self.Memory[a||0]||0;return isnumber(b)&&b||0 end;function ENT:WriteCell(a,c)if a<0||a>=262144 then return false end;a=math.floor(a)if self.AllowWrite then self.Memory[a]=c!=0&&c||nil;self.Size=math.max(self.Size,a+1)end;self.WantsUpdate=true;return true end;function ENT:Think()self.BaseClass.Think(self)if self.WantsUpdate then self.WantsUpdate=nil;self:ShowOutputs()end end;function ENT:ShowOutputs()WireLib.TriggerOutput(self,"Memory",self.Memory)WireLib.TriggerOutput(self,"Size",self.Size)if!self.ROM then self:SetOverlayText("DHDD\nSize: "..self.Size.." bytes")else self:SetOverlayText("ROM\nSize: "..self.Size.." bytes")end end;function ENT:TriggerInput(d,c)if d=="Data"then if!c then return end;if!self.AllowWrite then return end;self.Memory=c;local e=table.maxn(c)if e!=0||c[0]!=nil then e=e+1 end;self.Size=e;self.WantsUpdate=true elseif d=="Clear"then if c!=0 then self.Memory={}self.Size=0;self.WantsUpdate=true end elseif d=="AllowWrite"then self.AllowWrite=c>=1 end end;function ENT:BuildDupeInfo()local f=BaseClass.BuildDupeInfo(self)||{}f.DHDD={}f.ROM=self.ROM;local g=0;f.DHDD.Memory={}for h,i in pairs(self.Memory)do g=g+1;if g>512*512 then break end;f.DHDD.Memory[h]=i end;f.DHDD.AllowWrite=self.AllowWrite;return f end;function ENT:ApplyDupeInfo(j,k,f,l)if f.DHDD then k.Memory=f.DHDD.Memory||{}local e=table.maxn(k.Memory)if e!=0||k.Memory[0]!=nil then e=e+1 end;self.Size=e;if f.DHDD.AllowWrite!=nil then k.AllowWrite=f.DHDD.AllowWrite end;self:ShowOutputs()end;self.ROM=f.ROM||false;BaseClass.ApplyDupeInfo(self,j,k,f,l)end;duplicator.RegisterEntityClass("gmod_wire_dhdd",WireLib.MakeWireEnt,"Data")
--addons/!lpakr_out/lua/entities/gmod_wire_explosive.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Explosive"ENT.WireDebugName="Explosive"if CLIENT then return end;local a=CreateConVar("wire_explosive_delay",0.2,FCVAR_ARCHIVE)local b=CreateConVar("wire_explosive_range",512,FCVAR_ARCHIVE)function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)local c=self:GetPhysicsObject()if c:IsValid()then c:Wake()end;self.exploding=false;self.reloading=false;self.NormInfo=""self.count=0;self.ExplodeTime=0;self.ReloadTime=0;self.CountTime=0;self.Inputs=Wire_CreateInputs(self,{"Detonate","ResetHealth"})self:SetMaxHealth(100)self:SetHealth(100)self.Outputs=Wire_CreateOutputs(self,{"Health"})end;function ENT:TriggerInput(d,e)if d=="Detonate"then if!self.exploding&&!self.reloading then if math.abs(e)==self.key then self:Trigger()end end elseif d=="ResetHealth"then self:ResetHealth()end end;function ENT:Setup(f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v)self.key=f;self.Damage=math.Clamp(g,0,1500)self.Delaytime=h;self.Removeafter=i;self.Radius=math.Clamp(j,1,b:GetFloat())self.Affectother=k;self.Notaffected=l;self.Delayreloadtime=m;self.BulletProof=o;self.ExplosionProof=p;self.FallProof=q;self.ExplodeAtZero=r;self.ResetAtExplode=s;self.FireEffect=t;self.ColorEffect=u;self.InvisibleAtZero=v;self:SetMaxHealth(n)self:ResetHealth()self.NormInfo=""if self.Damage>0 then self.NormInfo=self.NormInfo.."Damage: "..self.Damage end;if self.Radius>0||self.Delaytime>0 then self.NormInfo=self.NormInfo.."\n"end;if self.Radius>0 then self.NormInfo=self.NormInfo.." Rad: "..self.Radius end;if self.Delaytime>0 then self.NormInfo=self.NormInfo.." Delay: "..self.Delaytime end;self:ShowOutput()local w={key=f,damage=g,removeafter=i,delaytime=h,radius=j,affectother=k,notaffected=l,delayreloadtime=m,maxhealth=n,bulletproof=o,explosionproof=p,fallproof=q,explodeatzero=r,resetatexplode=s,fireeffect=t,coloreffect=u,invisibleatzero=v}table.Merge(self:GetTable(),w)end;function ENT:ResetHealth()self:SetHealth(self:GetMaxHealth())Wire_TriggerOutput(self,"Health",self:GetMaxHealth())self.exploding=false;self.reloading=false;self.count=0;self:Extinguish()if self.ColorEffect then self:SetColor(Color(255,255,255,255))end;self:SetNoDraw(false)self:ShowOutput()end;function ENT:OnTakeDamage(x)if x:GetInflictor():GetClass()=="gmod_wire_explosive"&&!self.Affectother then return end;if!self.Notaffected then self:TakePhysicsDamage(x)end;if x:IsBulletDamage()&&self.BulletProof||x:IsExplosionDamage()&&self.ExplosionProof||x:IsFallDamage()&&self.FallProof then return end;if self:Health()>0 then local y=x:GetDamage()local z=self:Health()-y;if z<0 then z=0 end;self:SetHealth(z)Wire_TriggerOutput(self,"Health",z)self:ShowOutput()if self.ColorEffect then local A=z==0&&0||255*z/self:GetMaxHealth()self:SetColor(Color(255,A,A,255))end;if z==0 then if self.ExplodeAtZero then self:Trigger()end end end end;function ENT:Trigger()if self.Delaytime>0 then self.ExplodeTime=CurTime()+self.Delaytime;if self.FireEffect then self:Ignite(self.Delaytime+3,0)end end;self.exploding=true;self.CountTime=0 end;function ENT:Think()BaseClass.Think(self)if self.exploding then if self.ExplodeTime<CurTime()then self:Explode()end elseif self.reloading then if self.ReloadTime<CurTime()then self.reloading=false;if self.ResetAtExplode then self:ResetHealth()else self:ShowOutput()end end end;if(self.CountTime||0)<CurTime()then local B=0;if self.exploding then B=self.ExplodeTime elseif self.reloading then B=self.ReloadTime end;if B>0 then self.count=math.ceil(B-CurTime())self:ShowOutput()end;self.CountTime=CurTime()+1 end;self:NextThink(CurTime()+0.05)return true end;function ENT:Explode()if!self:IsValid()then return end;self:Extinguish()if!self.exploding then return end;local C=self:GetPlayer()if!IsValid(C)then C=self end;if self.InvisibleAtZero then self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)self:SetNoDraw(true)self:SetColor(Color(255,255,255,0))end;if self.Damage>0 then util.BlastDamage(self,C,self:GetPos(),self.Radius,self.Damage)end;local D=EffectData()D:SetOrigin(self:GetPos())util.Effect("Explosion",D,true,true)if self.Removeafter then self:Remove()return end;self.exploding=false;self.reloading=true;self.ReloadTime=CurTime()+math.max(a:GetFloat(),self.Delayreloadtime)self.CountTime=0;self:ShowOutput()end;function ENT:ShowOutput()local E=""if self.reloading&&self.Delayreloadtime>0 then E="Rearming... "..self.count;if self.ColorEffect&&!self.InvisibleAtZero then local A=255*(self.Delayreloadtime-self.count)/self.Delayreloadtime;self:SetColor(Color(255,A,A,255))end;if self.InvisibleAtZero then self:SetNoDraw(false)self:SetColor(Color(255,255,255,255*(self.Delayreloadtime-self.count)/self.Delayreloadtime))self:SetRenderMode(RENDERMODE_TRANSALPHA)end elseif self.exploding then E="Triggered... "..self.count else E=self.NormInfo.."\nHealth: "..self:Health().."/"..self:GetMaxHealth()end;self:SetOverlayText(E)end;duplicator.RegisterEntityClass("gmod_wire_explosive",WireLib.MakeWireEnt,"Data","key","damage","delaytime","removeafter","radius","affectother","notaffected","delayreloadtime","maxhealth","bulletproof","explosionproof","fallproof","explodeatzero","resetatexplode","fireeffect","coloreffect","invisibleatzero")
--addons/!lpakr_out/lua/entities/gmod_wire_gimbal.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Gimbal"ENT.WireDebugName="Gimbal"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self:GetPhysicsObject():EnableGravity(false)self.Inputs=WireLib.CreateInputs(self,{"On","X","Y","Z","Target [VECTOR]","Direction [VECTOR]","Angle [ANGLE]","AngleOffset [ANGLE]"})self.XYZ=Vector()self.TargetAngOffset=Matrix()self.TargetAngOffset:SetAngles(Angle(90,0,0))end;function ENT:TriggerInput(a,b)if a=="On"then self.On=b!=0 else self.TargetPos=nil;self.TargetDir=nil;self.TargetAng=nil;if a=="X"then self.XYZ.x=b;self.TargetPos=self.XYZ elseif a=="Y"then self.XYZ.y=b;self.TargetPos=self.XYZ elseif a=="Z"then self.XYZ.z=b;self.TargetPos=self.XYZ elseif a=="Target"then self.XYZ=Vector(b.x,b.y,b.z)self.TargetPos=self.XYZ elseif a=="Direction"then self.TargetDir=b elseif a=="Angle"then self.TargetAng=b elseif a=="AngleOffset"then self.TargetAngOffset=Matrix()self.TargetAngOffset:SetAngles(b)end end;self:ShowOutput()return true end;function ENT:Think()if self.On then local c;if self.TargetPos then c=(self.TargetPos-self:GetPos()):Angle()elseif self.TargetDir then c=self.TargetDir:Angle()elseif self.TargetAng then c=self.TargetAng end;if c then local d=Matrix()d:SetAngles(c)d=d*self.TargetAngOffset;self:SetAngles(d:GetAngles())end;self:GetPhysicsObject():Wake()end;self:NextThink(CurTime())return true end;function ENT:ShowOutput()if!self.On then self:SetOverlayText("Off")elseif self.TargetPos then self:SetOverlayText(string.format("Aiming towards (%.2f, %.2f, %.2f)",self.XYZ.x,self.XYZ.y,self.XYZ.z))elseif self.TargetDir then self:SetOverlayText(string.format("Aiming (%.4f, %.4f, %.4f)",self.TargetDir.x,self.TargetDir.y,self.TargetDir.z))elseif self.TargetAng then self:SetOverlayText(string.format("Aiming (%.1f, %.1f, %.1f)",self.TargetAng.pitch,self.TargetAng.yaw,self.TargetAng.roll))end end;duplicator.RegisterEntityClass("gmod_wire_gimbal",WireLib.MakeWireEnt,"Data")
--addons/!lpakr_out/lua/entities/gmod_wire_gyroscope.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_gyroscope.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Gyroscope"ENT.WireDebugName="Gyroscope"function ENT:SetupDataTables()self:NetworkVar("Bool",0,"Out180")end;if CLIENT then function ENT:Think()BaseClass.Think(self)if self:GetModel()=="models/bull/various/gyroscope.mdl"then local a=self:WorldToLocal((Vector(0,0,1):Cross(self:GetUp())):GetNormal()+self:GetPos())self:SetPoseParameter("rot_yaw",math.deg(math.atan2(a[2],a[1])))self:SetPoseParameter("rot_roll",-math.deg(math.acos(self:GetUp():DotProduct(Vector(0,0,1)))||0))end;local b=self:GetAngles()if b.p<0&&!self:GetOut180()then b.p=b.p+360 end;if b.y<0&&!self:GetOut180()then b.y=b.y+360 end;if b.r<0&&!self:GetOut180()then b.r=b.r+360 elseif b.r>180&&self:GetOut180()then b.r=b.r-360 end;self:ShowOutput(b.p,b.y,b.r)self:NextThink(CurTime()+0.04)return true end;function ENT:ShowOutput(c,d,e)self:SetOverlayText(string.format("Angles = %.3f, %.3f, %.3f",c,d,e))end;return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Outputs=WireLib.CreateSpecialOutputs(self,{"Pitch","Yaw","Roll","Angle"},{"NORMAL","NORMAL","NORMAL","ANGLE"})end;function ENT:Setup(f)if f!=nil then self:SetOut180(f)end;Wire_TriggerOutput(self,"Pitch",0)Wire_TriggerOutput(self,"Yaw",0)Wire_TriggerOutput(self,"Roll",0)WireLib.TriggerOutput(self,"Angle",Angle(0,0,0))end;function ENT:Think()BaseClass.Think(self)local b=self:GetAngles()if b.p<0&&!self:GetOut180()then b.p=b.p+360 end;if b.y<0&&!self:GetOut180()then b.y=b.y+360 end;if b.r<0&&!self:GetOut180()then b.r=b.r+360 elseif b.r>180&&self:GetOut180()then b.r=b.r-360 end;Wire_TriggerOutput(self,"Pitch",b.p)Wire_TriggerOutput(self,"Yaw",b.y)Wire_TriggerOutput(self,"Roll",b.r)Wire_TriggerOutput(self,"Angle",Angle(b.p,b.y,b.r))self:NextThink(CurTime()+0.04)return true end;duplicator.RegisterEntityClass("gmod_wire_gyroscope",WireLib.MakeWireEnt,"Data","out180")
--addons/!lpakr_out/lua/entities/gmod_wire_igniter.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_keyboard/shared.lua:
ENT.Type="anim"ENT.Base="base_wire_entity"ENT.PrintName="Wire Keyboard"ENT.Author="Divran"ENT.Contact="www.wiremod.com"ENT.Purpose="Send key input to the server."ENT.Instructions="Click Use on it to activate it."ENT.Spawnable=false
--addons/!lpakr_out/lua/entities/gmod_wire_keypad.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_keypad.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Keypad"if CLIENT then local a=-50;local b=-100;local c=100;local d=200;local e={{a+5,b+100,25,25,-2.2,3.45,1.3,0},{a+37.5,b+100,25,25,-0.6,1.85,1.3,0},{a+70,b+100,25,25,1.0,0.25,1.3,0},{a+5,b+132.5,25,25,-2.2,3.45,2.9,-1.6},{a+37.5,b+132.5,25,25,-0.6,1.85,2.9,-1.6},{a+70,b+132.5,25,25,1.0,0.25,2.9,-1.6},{a+5,b+165,25,25,-2.2,3.45,4.55,-3.3},{a+37.5,b+165,25,25,-0.6,1.85,4.55,-3.3},{a+70,b+165,25,25,1.0,0.25,4.55,-3.3},{a+5,b+67.5,40,25,-2.2,4.25,-0.3,1.6},{a+55,b+67.5,40,25,0.3,1.65,-0.3,1.6}}local f={font="Trebuchet MS",weight=400,antialias=true,additive=false}f.size=34;surface.CreateFont("Trebuchet34",f)f.size=24;surface.CreateFont("Trebuchet24",f)local g,h;function ENT:Draw()self:DrawModel()local i=LocalPlayer()if(i:GetShootPos()-self:GetPos()):Length()>750 then return end;local j=self:GetPos()+self:GetForward()*1.1;local k=self:GetAngles()local l=Vector(-90,90,0)k:RotateAroundAxis(k:Right(),l.x)k:RotateAroundAxis(k:Up(),l.y)k:RotateAroundAxis(k:Forward(),l.z)cam.Start3D2D(j,k,0.05)local m=i:GetEyeTrace()local j=self:WorldToLocal(m.HitPos)surface.SetDrawColor(0,0,0,255)surface.DrawRect(a-5,b-5,c+10,d+10)surface.SetDrawColor(50,75,50,255)surface.DrawRect(a+5,b+5,90,50)for n,o in pairs(e)do local p=n;local q=o[1]+9;local r=o[2]+4;local s=(j.y-o[5])/(o[5]+o[6])local t=1-(j.z+o[7])/(o[7]+o[8])local u=g==n&&h>=CurTime()if n==10 then p="ABORT"q=o[1]+2;r=o[2]+4;surface.SetDrawColor(150,25,25,255)elseif n==11 then p="OK"q=o[1]+12;r=o[2]+5;surface.SetDrawColor(25,150,25,255)else surface.SetDrawColor(150,150,150,255)end;if u||m.Entity==self&&s>=0&&t>=0&&s<=1&&t<=1 then if n<=9 then surface.SetDrawColor(200,200,200,255)elseif n==10 then surface.SetDrawColor(200,50,50,255)elseif n==11 then surface.SetDrawColor(50,200,50,255)end;if i:KeyDown(IN_USE)&&!i.KeyOnce&&!u then net.Start("wire_keypad")net.WriteEntity(self)net.WriteUInt(n,4)net.SendToServer()i.KeyOnce=true end end;surface.DrawRect(o[1],o[2],o[3],o[4])draw.DrawText(p,"Trebuchet18",q,r,Color(0,0,0,255))end;local v=self:GetNWString("keypad_display","")if v=="y"then draw.DrawText("ACCESS","Trebuchet24",a+17,b+7,Color(0,255,0,255))draw.DrawText("GRANTED","Trebuchet24",a+7,b+27,Color(0,255,0,255))elseif v=="n"then draw.DrawText("ACCESS","Trebuchet24",a+17,b+7,Color(255,0,0,255))draw.DrawText("DENIED","Trebuchet24",a+19,b+27,Color(255,0,0,255))else draw.DrawText(v,"Trebuchet34",a+17,b+10,Color(255,255,255,255))end;cam.End3D2D()end;hook.Add("KeyRelease","Keypad_KeyReleased",function(i,w)i.KeyOnce=false end)local x={["+gm_special 1"]=1,["+gm_special 2"]=2,["+gm_special 3"]=3,["+gm_special 4"]=4,["+gm_special 5"]=5,["+gm_special 6"]=6,["+gm_special 7"]=7,["+gm_special 8"]=8,["+gm_special 9"]=9,["+gm_special 11"]=11,["+gm_special 12"]=10}hook.Add("PlayerBindPress","keypad_PlayerBindPress",function(y,z,A)if!A then return end;local B=x[z]if!B then return end;local m=y:GetEyeTraceNoCursor()local C=m.Entity;if!IsValid(C)then return end;if C:GetClass()!="gmod_wire_keypad"then return end;net.Start("wire_keypad")net.WriteEntity(C)net.WriteUInt(B,4)net.SendToServer()g,h=B,CurTime()+0.5;return true end)return end;util.PrecacheSound("buttons/button8.wav")util.PrecacheSound("buttons/button9.wav")util.PrecacheSound("buttons/button14.wav")util.PrecacheSound("buttons/button15.wav")function ENT:Initialize()BaseClass.Initialize(self)self.Outputs=WireLib.CreateOutputs(self,{"Valid","Invalid"})self.CurrentNum=0 end;function ENT:Setup(D,E)self.Password=D;self.Secure=E end;util.AddNetworkString("wire_keypad")net.Receive("wire_keypad",function(F,y)local C=net.ReadEntity()if!IsValid(C)||!C.Password then return end;if C.CurrentNum==-1 then return end;if(y:GetShootPos()-C:GetPos()):Length()>50 then return end;local w=net.ReadUInt(4)if w==10 then C:SetNWString("keypad_display","")C:EmitSound("buttons/button14.wav")C.CurrentNum=0 elseif w==11||C.CurrentNum>999 then local G=C.Password==util.CRC(C.CurrentNum)if G then C:SetNWString("keypad_display","y")Wire_TriggerOutput(C,"Valid",1)C:EmitSound("buttons/button9.wav")else C:SetNWString("keypad_display","n")Wire_TriggerOutput(C,"Invalid",1)C:EmitSound("buttons/button8.wav")end;C.CurrentNum=-1;timer.Create("wire_keypad_"..C:EntIndex().."_"..tostring(G),2,1,function()if IsValid(C)then C:SetNWString("keypad_display","")C.CurrentNum=0;if G then Wire_TriggerOutput(C,"Valid",0)else Wire_TriggerOutput(C,"Invalid",0)end end end)else C.CurrentNum=C.CurrentNum*10+w;if C.Secure then C:SetNWString("keypad_display",string.rep("*",string.len(C.CurrentNum)))else C:SetNWString("keypad_display",tostring(C.CurrentNum))end;C:EmitSound("buttons/button15.wav")end end)duplicator.RegisterEntityClass("sent_keypad",WireLib.MakeWireEnt,"Data","Pass","secure")duplicator.RegisterEntityClass("gmod_wire_keypad",WireLib.MakeWireEnt,"Data","Password","Secure")scripted_ents.Alias("sent_keypad","gmod_wire_keypad")
--addons/!lpakr_out/lua/entities/gmod_wire_plug.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_radio.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_ranger.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_target_finder.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_teleporter.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_turret.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_watersensor.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Water Sensor"ENT.WireDebugName="Water Sensor"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Outputs=Wire_CreateOutputs(self,{"Out"})end;function ENT:ShowOutput()self:SetOverlayText(self:WaterLevel()>0&&"Submerged"||"Above Water")end;function ENT:Think()BaseClass.Think(self)if self:WaterLevel()>0 then Wire_TriggerOutput(self,"Out",1)else Wire_TriggerOutput(self,"Out",0)end;self:ShowOutput()self:NextThink(CurTime()+0.125)end;duplicator.RegisterEntityClass("gmod_wire_watersensor",WireLib.MakeWireEnt,"Data")
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/keypad/cl_init.lua:
return lpakr()()
--addons/ssrp_lfs/lua/entities/lvs_base/cl_init.lua:
include("shared.lua")
include( "sh_weapons.lua" )
include( "cl_effects.lua" )
include( "cl_hud.lua" )
include( "cl_seatswitcher.lua" )
include( "cl_trailsystem.lua" )
include( "cl_planescript_module.lua" )

function ENT:LVSCalcView( ply, pos, angles, fov, pod )
	return LVS:CalcView( self, ply, pos, angles, fov, pod )
end

function ENT:PreDraw()
	return true
end

function ENT:PreDrawTranslucent()
	return false
end

function ENT:PostDraw()
end

function ENT:PostDrawTranslucent()
end

function ENT:Draw()

	if self:PreDraw() then
		self:DrawModel()
	end

	self:PostDraw(self:GetModelScale())
end

function ENT:DrawTranslucent()
	self:DrawTrail()

	if self:PreDrawTranslucent() then
		self:DrawModel()
	end

	self:PostDrawTranslucent()
end

function ENT:Initialize()
	self:OnSpawn()
end

function ENT:OnSpawn()
end

function ENT:OnFrameActive()
end

function ENT:OnFrame()
end

function ENT:OnEngineActiveChanged( Active )
end

function ENT:OnActiveChanged( Active )
end

ENT._oldActive = false
ENT._oldEnActive = false

function ENT:HandleActive()
	local Active = self:GetActive()
	local EngineActive = self:GetEngineActive()
	local ActiveChanged = false

	if self._oldActive ~= Active then
		self._oldActive = Active
		self:OnActiveChanged( Active )
		ActiveChanged = true
	end

	if self._oldEnActive ~= EngineActive then
		self._oldEnActive = EngineActive
		self:OnEngineActiveChanged( EngineActive )
		ActiveChanged = true
	end

	if ActiveChanged then
		if Active or EngineActive then
			self:StartWindSounds()
		else
			self:StopWindSounds()
		end
	end

	if Active or EngineActive then
		self:DoVehicleFX()
	end

	self:FlyByThink()

	return EngineActive
end

function ENT:Think()
	if not self:IsInitialized() then return end

	if self:HandleActive() then
		self:OnFrameActive()
	end

	self:HandleTrail()
	self:OnFrame()
end

function ENT:OnRemove()
	self:StopEmitter()
	self:StopWindSounds()
	self:StopFlyBy()
	self:StopDeathSound()

	self:OnRemoved()
end

function ENT:OnRemoved()
end

function ENT:CalcDoppler( Ent )
	if not IsValid( Ent ) then return 1 end

	if Ent:IsPlayer() then
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

function ENT:GetCrosshairFilterEnts()
	if not self:IsInitialized() then return { self } end -- wait for the server to be ready

	if not istable( self.CrosshairFilterEnts ) then
		self.CrosshairFilterEnts = {self}

		-- lets ask the server to build the filter for us because it has access to constraint.GetAllConstrainedEntities()
		net.Start( "lvs_player_request_filter" )
			net.WriteEntity( self )
		net.SendToServer()
	end

	return self.CrosshairFilterEnts
end

function ENT:OnDestroyed()
end

net.Receive( "lvs_vehicle_destroy", function( len )
	local ent = net.ReadEntity()

	if not IsValid( ent ) then return end

	ent:OnDestroyed()
end )

--addons/ssrp_lfs/lua/entities/lvs_base_fakehover/cl_hud.lua:
local black = Color(0,0,0,255)
ENT.IconEngine = Material( "lvs/engine.png" )

function ENT:LVSHudPaintInfoText( X, Y, W, H, ScrX, ScrY, ply )
	local kmh = math.Round(self:GetVelocity():Length() * 0.09144,0)
	draw.DrawText( "km/h ", "LVS_FONT", X + 72, Y + 35, color_white, TEXT_ALIGN_RIGHT )
	draw.DrawText( kmh, "LVS_FONT_HUD_LARGE", X + 72, Y + 20, color_white, TEXT_ALIGN_LEFT )

	if ply ~= self:GetDriver() then return end

	local hX = X + W - H * 0.5
	local hY = Y + H * 0.25 + H * 0.25

	surface.SetMaterial( self.IconEngine )
	surface.SetDrawColor( 0, 0, 0, 200 )
	surface.DrawTexturedRectRotated( hX + 4, hY + 1, H * 0.5, H * 0.5, 0 )
	surface.SetDrawColor( color_white )
	surface.DrawTexturedRectRotated( hX + 2, hY - 1, H * 0.5, H * 0.5, 0 )

	if not self:GetEngineActive() then
		draw.SimpleText( "X" , "LVS_FONT",  hX, hY, black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	else
		self:LVSDrawCircle( hX, hY, H * 0.35, self:GetThrottle() )
	end
end

function ENT:LVSPreHudPaint( X, Y, ply )
	return true
end

local zoom = 0
local zoom_mat = Material( "vgui/zoom" )

function ENT:PaintZoom( X, Y, ply )
	local TargetZoom = ply:lvsKeyDown( "ZOOM" ) and 1 or 0

	zoom = zoom + (TargetZoom - zoom) * RealFrameTime() * 10

	surface.SetDrawColor( Color(255,255,255,255 * zoom) )
	surface.SetMaterial(zoom_mat )
	surface.DrawTexturedRectRotated( X + X * 0.5, Y * 0.5, X, Y, 0 )
	surface.DrawTexturedRectRotated( X + X * 0.5, Y + Y * 0.5, Y, X, 270 )
	surface.DrawTexturedRectRotated( X * 0.5, Y * 0.5, Y, X, 90 )
	surface.DrawTexturedRectRotated( X * 0.5, Y + Y * 0.5, X, Y, 180 )
end

function ENT:LVSHudPaint( X, Y, ply )
	if not self:LVSPreHudPaint( X, Y, ply ) then return end

	self:PaintZoom( X, Y, ply )
end

--addons/ssrp_lfs/lua/entities/lvs_base_fighterplane/shared.lua:

ENT.Base = "lvs_base"

ENT.PrintName = "[LVS] Base Fighter Plane"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS]"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.MaxVelocity = 2500
ENT.MaxPerfVelocity = 1500
ENT.MaxThrust = 250

ENT.ThrottleRateUp = 0.6
ENT.ThrottleRateDown = 0.3

ENT.TurnRatePitch = 1
ENT.TurnRateYaw = 1
ENT.TurnRateRoll = 1

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.MaxSlipAnglePitch = 20
ENT.MaxSlipAngleYaw = 10

ENT.StallVelocity = 150
ENT.StallForceMultiplier = 1
ENT.StallForceMax = 15

function ENT:SetupDataTables()
	self:CreateBaseDT()

	self:AddDT( "Vector", "Steer" )
	self:AddDT( "Vector", "AIAimVector" )
	self:AddDT( "Float", "NWThrottle" )
	self:AddDT( "Float", "MaxThrottle" )
	self:AddDT( "Float", "LandingGear" )

	if SERVER then
		self:SetLandingGear( 1 )
		self:SetMaxThrottle( 1 )
	end
end

function ENT:PlayerDirectInput( ply, cmd )
	local Pod = self:GetDriverSeat()

	local Delta = FrameTime()

	local KeyLeft = ply:lvsKeyDown( "-ROLL" )
	local KeyRight = ply:lvsKeyDown( "+ROLL" )
	local KeyPitchUp = ply:lvsKeyDown( "+PITCH" )
	local KeyPitchDown = ply:lvsKeyDown( "-PITCH" )

	local MouseX = cmd:GetMouseX()
	local MouseY = cmd:GetMouseY()

	if ply:lvsKeyDown( "FREELOOK" ) and not Pod:GetThirdPersonMode() then
		MouseX = 0
		MouseY = 0
	else
		ply:SetEyeAngles( Angle(0,90,0) )
	end

	local SensX, SensY, ReturnDelta = ply:lvsMouseSensitivity()

	if KeyPitchDown then MouseY = 10 * ReturnDelta end
	if KeyPitchUp then MouseY = -10 * ReturnDelta end

	local Input = Vector( MouseX * 0.4 * SensX, MouseY * SensY, 0 )

	local Cur = self:GetSteer()

	local Rate = Delta * 3 * ReturnDelta

	local New = Vector(Cur.x, Cur.y, 0) - Vector( math.Clamp(Cur.x * Delta * 5 * ReturnDelta,-Rate,Rate), math.Clamp(Cur.y * Delta * 5 * ReturnDelta,-Rate,Rate), 0)

	local Target = New + Input * Delta * 0.8

	local Fx = math.Clamp( Target.x, -1, 1 )
	local Fy = math.Clamp( Target.y, -1, 1 )

	local TargetFz = (KeyLeft and 1 or 0) - (KeyRight and 1 or 0)
	local Fz = Cur.z + math.Clamp(TargetFz - Cur.z,-Rate * 3,Rate * 3)

	local F = Cur + (Vector( Fx, Fy, Fz ) - Cur) * math.min(Delta * 100,1)

	self:SetSteer( F )
end

function ENT:PlayerMouseAim( ply, cmd )
	if CLIENT then return end

	local Pod = self:GetDriverSeat()

	local PitchUp = ply:lvsKeyDown( "+PITCH" )
	local PitchDown = ply:lvsKeyDown( "-PITCH" )
	local YawRight = ply:lvsKeyDown( "+YAW" )
	local YawLeft = ply:lvsKeyDown( "-YAW" )
	local RollRight = ply:lvsKeyDown( "+ROLL" )
	local RollLeft = ply:lvsKeyDown( "-ROLL" )

	local FreeLook = ply:lvsKeyDown( "FREELOOK" )

	local EyeAngles = Pod:WorldToLocalAngles( ply:EyeAngles() )

	if FreeLook then
		if isangle( self.StoredEyeAngles ) then
			EyeAngles = self.StoredEyeAngles
		end
	else
		self.StoredEyeAngles = EyeAngles
	end

	local OverridePitch = 0
	local OverrideYaw = 0
	local OverrideRoll = (RollRight and 1 or 0) - (RollLeft and 1 or 0)

	if PitchUp or PitchDown then
		EyeAngles = self:GetAngles()

		self.StoredEyeAngles = Angle(EyeAngles.p,EyeAngles.y,0)

		OverridePitch = (PitchUp and 1 or 0) - (PitchDown and 1 or 0)
	end

	if YawRight or YawLeft then
		EyeAngles = self:GetAngles()

		self.StoredEyeAngles = Angle(EyeAngles.p,EyeAngles.y,0)

		OverrideYaw = (YawRight and 1 or 0) - (YawLeft and 1 or 0) 
	end

	self:ApproachTargetAngle( EyeAngles, OverridePitch, OverrideYaw, OverrideRoll, FreeLook )
end

function ENT:CalcThrottle( ply, cmd )
	if CLIENT then return end

	local Delta = FrameTime()

	local ThrottleUp =  ply:lvsKeyDown( "+THROTTLE" ) and self.ThrottleRateUp or 0
	local ThrottleDown = ply:lvsKeyDown( "-THROTTLE" ) and -self.ThrottleRateDown or 0

	local Throttle = (ThrottleUp + ThrottleDown) * Delta

	self:SetThrottle( self:GetThrottle() + Throttle )
end

function ENT:SetThrottle( NewThrottle )
	if self:GetEngineActive() then
		self:SetNWThrottle( math.Clamp(NewThrottle,0,self:GetMaxThrottle()) )
	else
		self:SetNWThrottle( 0 )
	end
end

function ENT:GetThrottle()
	if self:GetEngineActive() then
		return self:GetNWThrottle()
	else
		return 0
	end
end

function ENT:StartCommand( ply, cmd )
	if self:GetDriver() ~= ply then return end

	if SERVER and not self.WheelAutoRetract then
		local KeyJump = ply:lvsKeyDown( "VSPEC" )

		if self._lvsOldKeyJump ~= KeyJump then
			self._lvsOldKeyJump = KeyJump
			if KeyJump then
				self:ToggleLandingGear()
				self:PhysWake()
			end
		end
	end

	if ply:lvsMouseAim() then
		self:PlayerMouseAim( ply, cmd )
	else
		self:PlayerDirectInput( ply, cmd )
	end

	self:CalcThrottle( ply, cmd )
end

function ENT:FreezeStability()
	self._StabilityFrozen = CurTime() + 2
end

function ENT:GetStability()
	if (self._StabilityFrozen or 0) > CurTime() then
		return 1, 0, self.MaxPerfVelocity
	end

	local ForwardVelocity = self:WorldToLocal( self:GetPos() + self:GetVelocity() ).x

	local Stability = math.Clamp(ForwardVelocity / self.MaxPerfVelocity,0,1) ^ 2
	local InvStability = 1 - Stability

	return Stability, InvStability, ForwardVelocity
end

function ENT:GetThrustStrenght()
	local ForwardVelocity = self:WorldToLocal( self:GetPos() + self:GetVelocity() ).x

	return (self.MaxVelocity - ForwardVelocity) * self:GetThrottle() / self.MaxVelocity
end

--addons/ssrp_lfs/lua/entities/lvs_base_fighterplane/cl_camera.lua:

ENT._lvsSmoothFreeLook = 0

function ENT:CalcViewDirectInput( ply, pos, angles, fov, pod )
	local ViewPosL = pod:WorldToLocal( pos )

	local view = {}
	view.fov = fov
	view.drawviewer = true
	view.angles = self:GetAngles()

	local FreeLook = ply:lvsKeyDown( "FREELOOK" )
	local Zoom = ply:lvsKeyDown( "ZOOM" )

	if not pod:GetThirdPersonMode() then

		if FreeLook then
			view.angles = pod:LocalToWorldAngles( ply:EyeAngles() )
		end

		local velL = self:WorldToLocal( self:GetPos() + self:GetVelocity() )

		local Dividor = math.abs( velL.x )
		local SideForce = math.Clamp( velL.y / Dividor, -1, 1)
		local UpForce = math.Clamp( velL.z / Dividor, -1, 1)

		local ViewPunch = Vector(0,math.Clamp(SideForce * 10,-1,1),math.Clamp(UpForce * 10,-1,1))
		if Zoom then
			ViewPunch = Vector(0,0,0)
		end

		pod._lerpPosOffset = pod._lerpPosOffset and pod._lerpPosOffset + (ViewPunch - pod._lerpPosOffset) * RealFrameTime() * 5 or Vector(0,0,0)
		pod._lerpPos = pos

		view.origin = pos + pod:GetForward() *  -pod._lerpPosOffset.y * 0.5 + pod:GetUp() *  pod._lerpPosOffset.z * 0.5
		view.angles.p = view.angles.p - pod._lerpPosOffset.z * 0.1
		view.angles.y = view.angles.y + pod._lerpPosOffset.y * 0.1
		view.drawviewer = false

		return view
	end

	pod._lerpPos = pod._lerpPos or self:GetPos()

	local radius = 550
	radius = radius + radius * pod:GetCameraDistance()

	if FreeLook then
		local velL = self:WorldToLocal( self:GetPos() + self:GetVelocity() )

		local SideForce = math.Clamp(velL.y / 10,-250,250)
		local UpForce = math.Clamp(velL.z / 10,-250,250)

		pod._lerpPosL = pod._lerpPosL and (pod._lerpPosL + (Vector(radius, SideForce,150 + radius * 0.1 + UpForce) - pod._lerpPosL) * RealFrameTime() * 12) or Vector(0,0,0)
		pod._lerpPos = self:LocalToWorld( pod._lerpPosL )

		view.origin = pod._lerpPos
		view.angles = self:LocalToWorldAngles( Angle(0,180,0) )
	else
		local TargetPos = self:LocalToWorld( Vector(500,0,150 + radius * 0.1) )

		local Sub = TargetPos - pod._lerpPos
		local Dir = Sub:GetNormalized()
		local Dist = Sub:Length()

		local DesiredPos = TargetPos - self:GetForward() * (300 + radius) - Dir * 100

		pod._lerpPos = pod._lerpPos + (DesiredPos - pod._lerpPos) * RealFrameTime() * (Zoom and 30 or 12)
		pod._lerpPosL = self:WorldToLocal( pod._lerpPos )

		local vel = self:GetVelocity()

		view.origin = pod._lerpPos
		view.angles = self:GetAngles()
	end

	view.origin = view.origin + ViewPosL

	return view
end

function ENT:CalcViewMouseAim( ply, pos, angles, fov, pod )
	local cvarFocus = math.Clamp( LVS.cvarCamFocus:GetFloat() , -1, 1 )

	self._lvsSmoothFreeLook = self._lvsSmoothFreeLook + ((ply:lvsKeyDown( "FREELOOK" ) and 0 or 1) - self._lvsSmoothFreeLook) * RealFrameTime() * 10

	local view = {}
	view.origin = pos
	view.fov = fov
	view.drawviewer = true
	view.angles = (self:GetForward() * (1 + cvarFocus) * self._lvsSmoothFreeLook * 0.8 + ply:EyeAngles():Forward() * math.max(1 - cvarFocus, 1 - self._lvsSmoothFreeLook)):Angle()

	if cvarFocus >= 1 then
		view.angles = LerpAngle( self._lvsSmoothFreeLook, ply:EyeAngles(), self:GetAngles() )
	else
		view.angles.r = 0
	end

	if not pod:GetThirdPersonMode() then

		view.drawviewer = false

		return view
	end

	local radius = 550
	radius = radius + radius * pod:GetCameraDistance()

	local TargetOrigin = view.origin - view.angles:Forward() * radius  + view.angles:Up() * radius * 0.2
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

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	return pos, angles, fov
end

function ENT:CalcViewDriver( ply, pos, angles, fov, pod )
	if ply:lvsMouseAim() then
		return self:CalcViewMouseAim( ply, pos, angles, fov, pod )
	else
		return self:CalcViewDirectInput( ply, pos, angles, fov, pod )
	end
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
--addons/ssrp_lfs/lua/entities/lvs_base_gunner/cl_init.lua:
include("shared.lua")

function ENT:Think()
end

function ENT:OnRemove()
end

function ENT:Draw()
end

function ENT:DrawTranslucent()
end

function ENT:GetAimVector()
	if self:GetAI() then
		return self:GetNWAimVector()
	end

	local Driver = self:GetDriver()

	if IsValid( Driver ) then
		return Driver:GetAimVector()
	else
		return self:GetForward()
	end
end
--addons/ssrp_lfs/lua/entities/lvs_base_turret/sh_camera_eyetrace.lua:

function ENT:GetEyeTrace( trace_forward )
	local startpos = self:LocalToWorld( self:OBBCenter() )

	local pod = self:GetDriverSeat()

	if IsValid( pod ) then
		startpos = pod:LocalToWorld( pod:OBBCenter() )
	end

	local AimVector = trace_forward and self:GetForward() or self:GetAimVector()

	local data = {
		start = startpos,
		endpos = (startpos + AimVector * 50000),
		filter = self:GetCrosshairFilterEnts(),
	}

	local trace = util.TraceLine( data )

	return trace
end

function ENT:GetAimVector()
	if self:GetAI() then
		return self:GetAIAimVector()
	end

	local Driver = self:GetDriver()

	if not IsValid( Driver ) then return self:GetForward() end

	if not Driver:lvsMouseAim() then
		if Driver:lvsKeyDown( "FREELOOK" ) then
			local pod = self:GetDriverSeat()

			if not IsValid( pod ) then return Driver:EyeAngles():Forward() end

			if pod:GetThirdPersonMode() then
				return -self:GetForward()
			else
				return Driver:GetAimVector()
			end
		else
			return self:GetForward()
		end
	end

	if SERVER then
		local pod = self:GetDriverSeat()

		if not IsValid( pod ) then return Driver:EyeAngles():Forward() end

		return pod:WorldToLocalAngles( Driver:EyeAngles() ):Forward()
	else
		return Driver:EyeAngles():Forward()
	end
end

--addons/ssrp_lfs/lua/entities/lvs_fakehover_aat/sh_turret.lua:

function ENT:SetPoseParameterTurret( weapon )
	if self:GetIsCarried() then
		self:SetPoseParameter("turret_pitch", 0 )
		self:SetPoseParameter("turret_yaw",  0 )

		if self.TurretWasSet then
			self.TurretWasSet = nil

			self:SetTurretPitch( 0 )
			self:SetTurretYaw( 0 )
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

	self:SetPoseParameter("turret_pitch", self:GetTurretPitch() )
	self:SetPoseParameter("turret_yaw", self:GetTurretYaw() )
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

function ENT:InitTurret()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Ammo = -1
	weapon.Delay = 0.3
	weapon.HeatRateUp = 1.25
	weapon.HeatRateDown = 0.2
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/vehicles/aat/overheat.mp3")
	end
	weapon.Attack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if base:GetIsCarried() then return true end

		local ID = base:LookupAttachment( "muzzle" )
		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= Muzzle.Ang:Up()
		bullet.Spread 	= Vector(0,0,0)
		bullet.TracerName = "lvs_laser_red_aat"
		bullet.Force	= 10
		bullet.HullSize 	= 30
		bullet.Damage	= 500
		bullet.SplashDamage = 250
		bullet.SplashDamageRadius = 250
		bullet.Velocity = 6000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetOrigin( tr.HitPos )
			util.Effect( "lvs_laser_explosion_aat", effectdata )
		end
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetStart( Vector(255,50,50) )
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( Muzzle.Ang:Up() )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle_colorable", effectdata )

		ent:TakeAmmo()

		base:PlayAnimation( "fire" )

		local PhysObj = base:GetPhysicsObject()
		if IsValid( PhysObj ) then
			PhysObj:ApplyForceOffset( -Muzzle.Ang:Up() * 25000, Muzzle.Pos )
		end

		if not IsValid( base.SNDTurret ) then return end

		base.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		base:SetPoseParameterTurret( ent )
	end
	weapon.CalcView = function( ent, ply, pos, angles, fov, pod )
		local base = ent:GetVehicle()

		local view = {}
		view.origin = pos
		view.angles = angles
		view.fov = fov
		view.drawviewer = false

		if not IsValid( base ) then return view end

		local ID = base:LookupAttachment( "turret_view" )
		local Att = base:GetAttachment( ID )

		if Att then
			local Pos,_= LocalToWorld( Vector(0,12,30), Angle(0,0,0), Att.Pos, Att.Ang )
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

		local StartPos = self:LocalToWorld( Vector(-75,0,140) )
		local EndPos = StartPos - clamped_angles:Forward() * radius + clamped_angles:Up() * radius * 0.2

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

		local Pos2D = base:TraceTurret().HitPos:ToScreen()

		base:PaintCrosshairCenter( Pos2D, color_white )
		base:PaintCrosshairOuter( Pos2D, color_white )
		base:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon, 2 )
end

--addons/ssrp_lfs/lua/entities/lvs_repulsorlift_dropship/cl_init.lua:
include("shared.lua")

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	if pod == self:GetDriverSeat() then

		if pod:GetThirdPersonMode() then
			pos = pos + self:GetUp() * 200, angles, fov
		end

		return pos, angles, fov
	end

	return pos, angles, fov
end

function ENT:OnSpawn()
end

function ENT:OnFrame()
	local HeldEntity = self:GetHeldEntity()

	local IsHeld = IsValid( HeldEntity )

	if IsHeld ~= self._oldHeldEntity then
		self._oldHeldEntity = IsHeld

		if IsHeld then
			self:BuildFilter()
		else
			self:ResetFilters()
		end
	end
end

function ENT:OnStartBoost()
	self:EmitSound( "^lvs/vehicles/laat/boost_"..math.random(1,2)..".wav", 85 )
end

function ENT:OnStopBoost()
end

--addons/ssrp_lfs/lua/entities/lvs_starfighter_engine.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.Spawnable       = false
ENT.AdminSpawnable  = false
ENT.DoNotDuplicate = true

ENT._LVS = true

function ENT:SetupDataTables()
	self:NetworkVar( "Entity",0, "Base" )
	self:NetworkVar( "Float",0, "DamageEffectsTime" )
end

if SERVER then
	function ENT:Initialize()
		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_NONE )
		self:DrawShadow( false )
	end

	function ENT:Think()
		local T = CurTime()
		local vehicle = self:GetBase()

		if not IsValid( vehicle ) or not vehicle:GetEngineActive() or self:GetDamageEffectsTime() < T then self:NextThink( T + 1 ) return true end

		if vehicle:GetHP() >= vehicle:GetMaxHP() then
			self:SetDamageEffectsTime( 0 )

			self:NextThink( T + 1 )

			return true
		end

		local PhysObj = vehicle:GetPhysicsObject()

		local Pos = self:GetPos()
		local Len = vehicle:WorldToLocal( Pos ):Length()

		PhysObj:ApplyForceOffset( -vehicle:GetVelocity() * (PhysObj:GetMass() / Len) * FrameTime() * 50, Pos )

		self:NextThink( T )

		return true
	end

	function ENT:OnTakeDamage( dmginfo )
		local vehicle = self:GetBase()

		if not IsValid( vehicle ) then return end

		local TimeBork = 2 + (vehicle:GetHP() / vehicle:GetMaxHP()) * 123

		self:SetDamageEffectsTime( CurTime() + TimeBork )
	end

	function ENT:UpdateTransmitState()
		return TRANSMIT_ALWAYS
	end

	return
end

function ENT:Initialize()
end

function ENT:Think()
	local vehicle = self:GetBase()

	if not IsValid( vehicle ) then return end

	self:DamageFX( vehicle )
end

function ENT:OnRemove()
end

function ENT:Draw()
end

function ENT:DrawTranslucent()
end

function ENT:DamageFX( vehicle )
	local T = CurTime()
	local HP = vehicle:GetHP()
	local MaxHP = vehicle:GetMaxHP()

	if (self.nextDFX or 0) > T then return end

	if self:GetDamageEffectsTime() < T then
		if HP <= 0 or HP > MaxHP * 0.5 then return end
	end

	self.nextDFX = T + 0.05

	local effectdata = EffectData()
		effectdata:SetOrigin( self:GetPos() )
		effectdata:SetEntity( vehicle )
	util.Effect( "lvs_engine_blacksmoke", effectdata )

	if HP < MaxHP * 0.5 and self:GetDamageEffectsTime() > T then
		local effectdata = EffectData()
			effectdata:SetOrigin( self:GetPos() )
			effectdata:SetNormal( -self:GetForward() )
			effectdata:SetMagnitude( 2 )
			effectdata:SetEntity( vehicle )
		util.Effect( "lvs_exhaust_fire", effectdata )
	end
end

--addons/ssrp_lfs/lua/entities/lvs_starfighter_ywing_bomber/shared.lua:
ENT.Base = "lvs_base_starfighter"

ENT.PrintName = "Y-Wing Bomber"
ENT.Author = "Digger"
ENT.Information = ""
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL =  "models/ywing_costum/ywing_btlb_test.mdl"
ENT.GibModels = {
	"models/DiggerThings/AWing/gib1.mdl",
	"models/DiggerThings/AWing/gib2.mdl",
	"models/DiggerThings/AWing/gib3.mdl",
	"models/DiggerThings/AWing/gib4.mdl",
	"models/DiggerThings/AWing/gib5.mdl",
	"models/DiggerThings/AWing/gib6.mdl"
}

ENT.AITEAM = 1

ENT.MaxVelocity = 2150
ENT.MaxThrust = 30000

ENT.ThrustVtol = 55
ENT.ThrustRateVtol = 3

ENT.TurnRatePitch = 1
ENT.TurnRateYaw = 1
ENT.TurnRateRoll = 1

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.MaxHealth = 1600
ENT.MaxShield = 600

ENT.UIPosition = Vector(1000, -100, -30)
ENT.UIAngle = Angle(25, 155, 0)

local blueLight = Vector(100, 100, 255)

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "GunnerSeat" )
	self:AddDT( "Float", "TurretPitch" )
	self:AddDT( "Float", "TurretYaw" )
end

function ENT:InitWeapons()
	self.FirePositions = { Vector(450,-22,47),Vector(450,22,47) }

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/mg.png")
	weapon.Ammo = 1200
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.25
	weapon.HeatRateDown = 1
	weapon.Attack = function( ent )
		ent.NumPrim = ent.NumPrim and ent.NumPrim + 1 or 1
		if ent.NumPrim > #ent.FirePositions then ent.NumPrim = 1 end

		local pod = ent:GetDriverSeat()

		if not IsValid( pod ) then return end

		local startpos = pod:LocalToWorld( pod:OBBCenter() )
		local trace = util.TraceHull( {
			start = startpos,
			endpos = (startpos + ent:GetForward() * 50000),
			mins = Vector( -10, -10, -10 ),
			maxs = Vector( 10, 10, 10 ),
			filter = ent:GetCrosshairFilterEnts()
		} )

		local bullet = {}
		bullet.Src 	= ent:LocalToWorld( ent.FirePositions[ent.NumPrim] )
		bullet.Dir 	= (trace.HitPos - bullet.Src):GetNormalized()
		bullet.Spread 	= Vector( 0.02,  0.02, 0 )
		bullet.TracerName = "lvs_laser_blue"
		bullet.Force	= 10
		bullet.HullSize 	= 40
		bullet.Damage	= 10
		bullet.Velocity = 60000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( blueLight )
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_impact", effectdata )
		end

		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetStart( blueLight )
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( ent:GetForward() )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle_colorable", effectdata )

		ent:TakeAmmo()

		ent.PrimarySND:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )

	local weapon = {}
	weapon.Icon = Material 'lvs/weapons/protontorpedo.png'
	weapon.Ammo = 15
	weapon.Delay = 10
	weapon.Attack = function(ent)
		local T = CurTime()

		if (ent._nextMissle or 0) > T then return end
		ent._nextMissle = T + 5

		local Driver = ent:GetDriver()
		local projectile = ents.Create 'lvs_cannonblast'
		projectile:SetPos(ent:LocalToWorld(Vector(0, 0, -200)))
		projectile:SetAngles(ent:GetAngles())
		projectile:Spawn()
		projectile:Activate()
		projectile:Prepare(self, 0.5)

		ent._ProtonBomb = projectile
		ent:SetNextAttack(CurTime() + 0.1)
	end
	weapon.FinishAttack = function( ent )
	end
	weapon.OnSelect = function( ent ) 
		ent:EmitSound("physics/metal/weapon_impact_soft3.wav") 
	end
	weapon.OnOverheat = function( ent ) 
		ent:EmitSound("lvs/overheat.wav") 
	end
	self:AddWeapon(weapon)

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/protontorpedo.png")
	weapon.Ammo = 20
	weapon.Delay = 0 -- this will turn weapon.Attack to a somewhat think function
	weapon.HeatRateUp = -0.5 -- cool down when attack key is held. This system fires on key-release.
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		local T = CurTime()

		if IsValid( ent._ProtonTorpedo ) then
			if (ent._nextMissleTracking or 0) > T then return end

			ent._nextMissleTracking = T + 0.1 -- 0.1 second interval because those find functions can be expensive

			ent._ProtonTorpedo:FindTarget( ent:GetPos(), ent:GetForward(), 30, 7500 )

			return
		end

		local T = CurTime()

		if (ent._nextMissle or 0) > T then return end

		ent._nextMissle = T + 0.5

		local Driver = ent:GetDriver()

		local projectile = ents.Create( "lvs_protontorpedo" )
		projectile:SetPos( ent:LocalToWorld( Vector(147.82,0,39.52) ) )
		projectile:SetAngles( ent:GetAngles() )
		projectile:SetParent( ent )
		projectile:Spawn()
		projectile:Activate()
		projectile:SetAttacker( IsValid( Driver ) and Driver or self )
		projectile:SetEntityFilter( ent:GetCrosshairFilterEnts() )
		projectile:SetSpeed( ent:GetVelocity():Length() + 4000 )

		ent._ProtonTorpedo = projectile

		ent:SetNextAttack( CurTime() + 0.1 ) -- wait 0.1 second before starting to track
	end
	weapon.FinishAttack = function( ent )
		if not IsValid( ent._ProtonTorpedo ) then return end

		local projectile = ent._ProtonTorpedo

		projectile:Enable()
		projectile:EmitSound( "lvs/vehicles/naboo_n1_starfighter/proton_fire.mp3", 125 )
		ent:TakeAmmo()

		ent._ProtonTorpedo = nil

		local NewHeat = ent:GetHeat() + 0.75

		ent:SetHeat( NewHeat )
		if NewHeat >= 1 then
			ent:SetOverheated( true )
		end
	end
	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )

	local COLOR_RED = Color(255,0,0,255)
	local COLOR_WHITE = Color(255,255,255,255)

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Delay = 0.15
	weapon.Attack = function( ent )
		local pod = ent:GetDriverSeat()
		if not IsValid( pod ) then return end

		local trace = ent:GetEyeTrace()
		local fp = { Vector(-100,25,0),Vector(-100,-25,0)  }
		ent.SwapTopBottom = ent.SwapTopBottom == 1 and 2 or 1

		local veh = ent:GetVehicle()
		veh.SNDTail:PlayOnce( 100 + math.Rand(-3,3), 1 )

		local bullet = {}
		bullet.Src = self.Gun:LocalToWorld(fp[ent.SwapTopBottom])
		bullet.Dir = (trace.HitPos - bullet.Src):GetNormalized()
		bullet.Spread = Vector( 0.03,  0.03, 0.03 )
		bullet.TracerName = "lvs_laser_blue"
		bullet.Force	= 10
		bullet.HullSize = 25
		bullet.Damage	= 45
		bullet.Velocity = 30000
		bullet.Attacker = ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( blueLight )
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_impact", effectdata )
		end
		ent:LVSFireBullet( bullet )
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("physics/metal/weapon_impact_soft3.wav")
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/overheat.wav")
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		base:SetPoseParameterTurret( ent )
	end
	weapon.CalcView = function( ent, ply, pos, angles, fov, pod )
		local base = ent:GetVehicle()

		if not IsValid( base ) then
			return LVS:CalcView( ent, ply, pos, angles, fov, pod )
		end

		if pod:GetThirdPersonMode() then
			pos = pos + base:GetUp() * 100
		end

		return LVS:CalcView( base, ply, pos, angles, fov, pod )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen()
		local base = ent:GetVehicle()

		base:PaintCrosshairCenter( Pos2D, COLOR_WHITE )
		base:PaintCrosshairOuter( Pos2D, COLOR_WHITE )
		base:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon, 2 )
end

ENT.TurretTurnRate = 3
ENT.TurretPitch = Angle()
ENT.TurretYaw = Angle()

local emptyAngle = Angle()

function ENT:SetPoseParameterTurret( weapon )
	if not IsValid(self.Turret) or not IsValid(weapon:GetDriver()) then
		self.Turret:SetLocalAngles(emptyAngle)
		return
	end

	local ang = weapon:WorldToLocalAngles( weapon:GetDriver():EyeAngles() )

	self.Turret:SetLocalAngles(Angle(0, 180 + ang.y, 0))
	self.Gun:SetLocalAngles(Angle(-1 * ang.p, 0, 0))
end

sound.Add( {
	name = "LVS.VULTURE.FLYBY",
	sound = {"lvs/vehicles/vulturedroid/flyby.wav","lvs/vehicles/vulturedroid/flyby_a.wav","lvs/vehicles/vulturedroid/flyby_b.wav","lvs/vehicles/vulturedroid/flyby_c.wav"}
} )

ENT.FlyByAdvance = 0.5
ENT.FlyBySound = "lvs/vehicles/vwing/flyby.wav"
ENT.DeathSound = "lvs/vehicles/generic_starfighter/crash.wav"

ENT.EngineSounds = {
	{
		sound = "vanilla/btlbywing/vanilla_ywing_dist.wav",
		Pitch = 80,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 40,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
	},
	{
		sound = "^lvs/vehicles/vulturedroid/dist.wav",
		Pitch = 80,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 40,
		FadeIn = 0.35,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
		VolumeMin = 0,
		VolumeMax = 1,
		SoundLevel = 100,
	},
}
--addons/ssrp_lfs/lua/entities/lvs_turbotank/cl_init.lua:
include("shared.lua")



ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.LightGlow = Material( "sprites/light_glow02_add" )
ENT.LightMaterial = Material( "effects/lvs/laat_spotlight" )
ENT.Red = Color( 255, 0, 0, 255)
ENT.SignalSprite = Material( "sprites/light_glow02_add" )
ENT.Spotlight = Material( "effects/lvs/spotlight_projectorbeam" )

function ENT:Initialize()
	self.weelpos = 0
end

function ENT:OnFrame()

	self:AnimDrive()

end

function ENT:AnimDrive()
    if not self:GetEngineActive() then return end
	local driver = self:GetDriver()
	local speed = self:GetThrottle() * 12
	if IsValid(self:GetDriver()) then
		if self:GetAI() == false then
			if driver:KeyDown( 16 ) == true then 
				speed = speed * -1
			end
		end
	end
	self.weelpos = self.weelpos + speed
	if self.weelpos >= 360 then
		self.weelpos = 0
	end
	if self.weelpos <= -360 then
		self.weelpos = 0
	end

    local angl = Angle(self.weelpos, 0, 0)

	if self:GetThrottle() > 0.2 then 
		self:ManipulateBoneAngles(self:LookupBone("wheel_1_R"), angl)
		self:ManipulateBoneAngles(self:LookupBone("wheel_2_R"), angl)
		self:ManipulateBoneAngles(self:LookupBone("wheel_3_R"), angl)
		self:ManipulateBoneAngles(self:LookupBone("wheel_4_R"), angl)
		self:ManipulateBoneAngles(self:LookupBone("wheel_5_R"), angl)
	
		self:ManipulateBoneAngles(self:LookupBone("wheel_1_L"), -angl)
		self:ManipulateBoneAngles(self:LookupBone("wheel_2_L"), -angl)
		self:ManipulateBoneAngles(self:LookupBone("wheel_3_L"), -angl)
		self:ManipulateBoneAngles(self:LookupBone("wheel_4_L"), -angl)
		self:ManipulateBoneAngles(self:LookupBone("wheel_5_L"), -angl)
	end
end

function ENT:RemoveLight()
	if IsValid( self.projector ) then
		self.projector:Remove()
		self.projector = nil
	end

	if IsValid( self.frojector ) then
		self.frojector:Remove()
		self.frojector = nil
	end
end

ENT.LightMaterial = Material( "effects/lvs/laat_spotlight" )
ENT.GlowMaterial = Material( "sprites/light_glow02_add" )

ENT.LightMaterial = Material( "effects/lvs/laat_spotlight" )
ENT.GlowMaterial = Material( "sprites/light_glow02_add" )

function ENT:PreDrawTranslucent()
	if self:GetSpotlightToggle() == false then 
		self:RemoveLight()
		return false
	end

	if not IsValid( self.projector ) then
		local thelamp = ProjectedTexture()
		thelamp:SetBrightness( 35 ) 
		thelamp:SetTexture( "effects/flashlight/soft" )
		thelamp:SetColor( Color(255,255,255) ) 
		thelamp:SetEnableShadows( false ) 
		thelamp:SetFarZ( 10000 ) 
		thelamp:SetNearZ( 1 ) 
		thelamp:SetFOV( 100 )
		self.projector = thelamp
	end


	local Start1 = self:LocalToWorld( Vector(275,-125,150) )
	local Start2 = self:LocalToWorld( Vector(275,125,150) )

	local Dir1 = self:LocalToWorldAngles( Angle(0,5,0) ):Forward()
	local Dir2 = self:LocalToWorldAngles( Angle(0,-5,0) ):Forward()

	render.SetMaterial( self.GlowMaterial )
	render.DrawSprite( Start1, 32, 32, Color( 100, 100, 100, 255) )
	render.DrawSprite( Start2, 32, 32, Color( 100, 100, 100, 255) )

	render.SetMaterial( self.LightMaterial )
	render.DrawBeam( Start1,  Start1 + Dir1 * 400, 150, 0, 0.99, Color( 100, 100, 100, 5) ) 
	render.DrawBeam( Start2,  Start2 + Dir2 * 400, 150, 0, 0.99, Color( 100, 100, 100, 5) ) 

	if IsValid( self.projector ) then
		self.projector:SetPos( self:LocalToWorld( Vector(60,0,10.5) ) )
		self.projector:SetAngles( self:LocalToWorldAngles( Angle(15,0,0) ) )
		self.projector:Update()
	end

	return false
end

local COLOR_RED = Color(255,0,0,255)
local COLOR_WHITE = Color(255,255,255,255)


function ENT:CalcEngineSound( RPM, Pitch, Doppler )
	if self.ENG then
		self.ENG:ChangePitch(  math.Clamp(math.Clamp(  60 + Pitch * 50, 80,255) + Doppler,0,255) )
		self.ENG:ChangeVolume( math.Clamp( -1 + Pitch * 6, 0.5,1) )
	end
	
	if self.DIST then
		self.DIST:ChangePitch(  math.Clamp(math.Clamp(  50 + Pitch * 60, 50,255) + Doppler,0,255) )
		self.DIST:ChangeVolume( math.Clamp( -1 + Pitch * 6, 0,1) )
	end
end

function ENT:OnRemove()
	self:SoundStop()
	self:RemoveLight()
end

function ENT:SoundStop()
	if self.DIST then
		self.DIST:Stop()
	end
	
	if self.ENG then
		self.ENG:Stop()
	end
end

--addons/ssrp_lfs/lua/entities/lvs_turret_aa/cl_init.lua:
include("shared.lua")

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )

	if self:GetGunnerSeat() == ply:GetVehicle() then
		if pod:GetThirdPersonMode() then
			return pos + self:GetUp() * 100, angles, fov
		end
	end

	return pos, angles, fov
end

function ENT:OnSpawn()
end

function ENT:OnFrame()
end

function ENT:PostDrawTranslucent()
end

function ENT:EngineEffects()
end

function ENT:AnimGunner()
end

function ENT:AnimAstromech()
end

function ENT:AnimCockpit()
end

function ENT:OnStartBoost()
end

function ENT:OnStopBoost()
end

--addons/ssrp_lfs/lua/entities/lvs_vehicle_spammer.lua:

AddCSLuaFile()

ENT.Type            = "anim"

ENT.PrintName = "AI Vehicle Spammer"
ENT.Author = "Luna"
ENT.Information = "AI Vehicle Spawner. Spammer in the hands of a Minge."
ENT.Category = "[LVS]"

ENT.Spawnable		= false
ENT.AdminOnly		= true
ENT.Editable = true

local white = Color(255, 255, 255, 255)

function ENT:SetupDataTables()
	local AllSents = scripted_ents.GetList()
	local SpawnOptions = {}

	for _, v in pairs( AllSents ) do
		if not v or not istable( v.t ) or not v.t.Spawnable then continue end

		if v.t.lvsShowInSpawner or (v.t.Base and (string.StartWith( v.t.Base:lower(), "lvs_base" ) or string.StartWith( v.t.Base:lower(), "lunasflightschool" ))) then
			if v.t.Category and v.t.PrintName then
				local nicename = v.t.Category.." - "..v.t.PrintName
				if not table.HasValue( SpawnOptions, nicename ) then
					SpawnOptions[nicename] = v.t.ClassName
				end
			end
		end
	end

	self:NetworkVar( "String",0, "Type",	{ KeyName = "Vehicle Type",Edit = { type = "Combo",	order = 1,values = SpawnOptions,category = "Vehicle-Options"} } )
	self:NetworkVar( "Int",3, "TeamOverride", { KeyName = "AI Team", Edit = { type = "Int", order = 4,min = -1, max = 3, category = "Vehicle-Options"} } )
	self:NetworkVar( "Int",4, "RespawnTime", { KeyName = "spawntime", Edit = { type = "Int", order = 5,min = 1, max = 120, category = "Vehicle-Options"} } )
	self:NetworkVar( "Int",5, "Amount", { KeyName = "amount", Edit = { type = "Int", order = 6,min = 1, max = 10, category = "Vehicle-Options"} } )
	self:NetworkVar( "Int",6, "SpawnWithSkin", { KeyName = "spawnwithskin", Edit = { type = "Int", order = 8,min = 0, max = 16, category = "Vehicle-Options"} } )
	self:NetworkVar( "Int",7, "SpawnWithHealth", { KeyName = "spawnwithhealth", Edit = { type = "Int", order = 9,min = 0, max = 50000, category = "Vehicle-Options"} } )
	self:NetworkVar( "Int",8, "SpawnWithShield", { KeyName = "spawnwithshield", Edit = { type = "Int", order = 10,min = 0, max = 50000, category = "Vehicle-Options"} } )

	self:NetworkVar( "Int",10, "SelfDestructAfterAmount", { KeyName = "selfdestructafteramount", Edit = { type = "Int", order = 22,min = 0, max = 100, category = "Spawner-Options"} } )
	self:NetworkVar( "Bool",2, "MasterSwitch" )

	if SERVER then
		self:NetworkVarNotify( "Type", self.OnTypeChanged )

		self:SetRespawnTime( 2 )
		self:SetAmount( 1 )
		self:SetSelfDestructAfterAmount( 0 )
		self:SetSpawnWithHealth( 0 )
		self:SetSpawnWithShield( 0 )
		self:SetTeamOverride( -1 )
	end
end

if SERVER then
	function ENT:SpawnFunction( ply, tr, ClassName )
		if not tr.Hit then return end

		local ent = ents.Create( ClassName )
		ent:SetPos( tr.HitPos + tr.HitNormal * 1 )
		ent:Spawn()
		ent:Activate()

		return ent

	end

	function ENT:OnTakeDamage( dmginfo )
	end

	function ENT:Initialize()
		self:SetModel( "models/hunter/plates/plate8x8.mdl" )

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )
		self:DrawShadow( false )

		self:SetCollisionGroup( COLLISION_GROUP_WORLD )

		self.NextSpawn = 0
	end

	function ENT:Use( ply )
		if not IsValid( ply ) then return end

		if not IsValid( self.Defusor ) then
			self.Defusor = ply
			self.DefuseTime = CurTime()
		end
	end

	function ENT:Think()
		if IsValid( self.Defusor ) and isnumber( self.DefuseTime ) then
			if self.Defusor:KeyDown( IN_USE ) then
				if CurTime() - self.DefuseTime > 1 then
					self:SetMasterSwitch( not self:GetMasterSwitch() )

					for k, v in pairs( ents.FindByClass( "lvs_vehicle_spammer" ) ) do
						if v ~= self and IsValid( v ) then
							v:SetMasterSwitch( self:GetMasterSwitch() )
						end
					end

					if self:GetMasterSwitch() then
						self.Defusor:PrintMessage( HUD_PRINTTALK, "ALL AI-Spawners Enabled")
					else
						self.Defusor:PrintMessage( HUD_PRINTTALK, "ALL AI-Spawners Disabled")
					end

					self.Defusor = nil
				end
			else
				self:SetMasterSwitch( not self:GetMasterSwitch() )

				if self:GetMasterSwitch() then
					self.Defusor:PrintMessage( HUD_PRINTTALK, "AI-Spawner Enabled")
				else
					self.Defusor:PrintMessage( HUD_PRINTTALK, "AI-Spawner Disabled")
				end

				self.Defusor = nil
			end
		end

		if not self:GetMasterSwitch() then return end

		self.spawnedvehicles = self.spawnedvehicles or {}

		if self.ShouldSpawn then
			if self.NextSpawn < CurTime() then

				self.ShouldSpawn = false

				local pos = self:LocalToWorld( Vector( 0, 0, 150 ) )
				local ang = self:LocalToWorldAngles( Angle( 0, 90, 0 ) )

				local Type = self:GetType()

				if Type ~= "" then
					local spawnedvehicle = ents.Create( Type )

					if IsValid( spawnedvehicle ) then
						if spawnedvehicle.SpawnNormalOffsetSpawner then
							spawnedvehicle:SetPos( self:LocalToWorld( Vector(0,0,spawnedvehicle.SpawnNormalOffsetSpawner) ) )
						else
							spawnedvehicle:SetPos( pos + Vector(0,0,spawnedvehicle.SpawnNormalOffset or 0) )
						end
						spawnedvehicle:SetAngles( ang )
						spawnedvehicle:Spawn()
						spawnedvehicle:Activate()
						spawnedvehicle:SetAI( true )
						spawnedvehicle:SetSkin( self:GetSpawnWithSkin() )

						if self:GetTeamOverride() >= 0 then
							spawnedvehicle:SetAITEAM( self:GetTeamOverride() )
						end

						if self:GetSpawnWithHealth() > 0 then
							spawnedvehicle.MaxHealth = self:GetSpawnWithHealth()
							spawnedvehicle:SetHP( self:GetSpawnWithHealth() )
						end

						if self:GetSpawnWithShield() > 0 then
							spawnedvehicle.MaxShield = self:GetSpawnWithShield()
							spawnedvehicle:SetShield( self:GetSpawnWithShield() )
						end

						if spawnedvehicle.LFS and not spawnedvehicle.DontPushMePlease then
							local PhysObj = spawnedvehicle:GetPhysicsObject()

							if IsValid( PhysObj ) then
								PhysObj:SetVelocityInstantaneous( -self:GetRight() * 1000 )
							end
						end

						table.insert( self.spawnedvehicles, spawnedvehicle )

						if self:GetSelfDestructAfterAmount() > 0 then
							self.RemoverCount = isnumber( self.RemoverCount ) and self.RemoverCount + 1 or 1

							if self.RemoverCount >= self:GetSelfDestructAfterAmount() then
								self:Remove()
							end
						end
					end
				end
			end
		else
			local AmountSpawned = 0
			for k,v in pairs( self.spawnedvehicles ) do
				if IsValid( v ) then
					AmountSpawned = AmountSpawned + 1
				else
					self.spawnedvehicles[k] = nil
				end
			end

			if AmountSpawned < self:GetAmount() then
				self.ShouldSpawn = true
				self.NextSpawn = CurTime() + self:GetRespawnTime()
			end
		end

		self:NextThink( CurTime() )

		return true
	end
end

if CLIENT then
	local WhiteList = {
		["weapon_physgun"] = true,
		["weapon_physcannon"] = true,
		["gmod_tool"] = true,
	}

	local TutorialDone = false
	local mat = Material( "models/wireframe" )
	local FrameMat = Material( "lvs/3d2dmats/frame.png" )
	local ArrowMat = Material( "lvs/3d2dmats/arrow.png" )

	function ENT:Draw()
		local ply = LocalPlayer()

		if not IsValid( ply ) then return end

		if TutorialDone then
			if GetConVarNumber( "cl_draweffectrings" ) == 0 then return end

			local wep = ply:GetActiveWeapon()

			if not IsValid( wep ) then return end

			local weapon_name = wep:GetClass()

			if not WhiteList[ weapon_name ] then
				return
			end
		else
			local wep = ply:GetActiveWeapon()

			if not IsValid( wep ) then return end

			local weapon_name = wep:GetClass()

			if not WhiteList[ weapon_name ] then
				if weapon_name == "gmod_camera" then return end

				local Trace = ply:GetEyeTrace()
				if Trace.Entity ~= self or (ply:GetShootPos() - Trace.HitPos):Length() > 800 then return end
			end
		end

		local Pos = self:GetPos()
		local R = 190
		render.SetMaterial( mat )
		render.DrawBox( Pos, self:GetAngles(), Vector(-R,-R,0), Vector(R,R,200), color_white )

		for i = 0, 180, 180 do
			cam.Start3D2D( Pos, self:LocalToWorldAngles( Angle(i,0,0) ), 0.185 )
				if self:GetMasterSwitch() then
					local T4 = CurTime() * 4

					local OY = math.cos( T4 )
					local A = math.max( math.sin( T4 ), 0 )

					surface.SetMaterial( ArrowMat )

					if self:GetType() == "" then
						surface.SetDrawColor( 255, 0, 0, A * 255 )
						surface.DrawTexturedRect( -512, -512 + OY * 512, 1024, 1024 )

						surface.SetDrawColor( 255, 0, 0, math.abs( math.cos( T4 ) ) ^ 2 * 255  )
					else
						surface.SetDrawColor( 0, 127, 255, A * 255 )
						surface.DrawTexturedRect( -512, -512 + OY * 512, 1024, 1024 )

						surface.SetDrawColor( 0, 127, 255, 255 )
					end
				else
					surface.SetDrawColor( 255, 0, 0, 255 )

					surface.SetMaterial( ArrowMat )
					surface.DrawTexturedRect( -512, -512, 1024, 1024 )
				end

				surface.SetMaterial( FrameMat )
				surface.DrawTexturedRect( -1024, -1024, 2048, 2048 )
			cam.End3D2D()
		end
	end

	hook.Add( "HUDPaint", "!!!!!!!11111lvsvehiclespammer_tutorial", function()
		if TutorialDone then
			hook.Remove( "HUDPaint", "!!!!!!!11111lvsvehiclespammer_tutorial" )
		end

		local ply = LocalPlayer()

		if ply:InVehicle() then return end

		local trace = ply:GetEyeTrace()
		local Dist = (ply:GetShootPos() - trace.HitPos):Length()

		if Dist > 800 then return end

		local Ent = trace.Entity

		if not IsValid( Ent ) then return end

		if Ent:GetClass() ~= "lvs_vehicle_spammer" then return end

		local pos = Ent:GetPos()
		local scr = pos:ToScreen()

		if Ent:GetType() == "" then
			draw.SimpleText( "Hold C => Right Click on me => Edit Properties => Choose a Type", "LVS_FONT", scr.x, scr.y - 10, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		else
			if not Ent:GetMasterSwitch() then
				local Key = input.LookupBinding( "+use" )
				if not isstring( Key ) then Key = "+use is not bound to a key" end

				draw.SimpleText( "Now press ["..Key.."] to enable!", "LVS_FONT", scr.x, scr.y - 10, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				draw.SimpleText( "or hold ["..Key.."] to enable globally!", "LVS_FONT", scr.x, scr.y + 10, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			else
				TutorialDone = true
			end
		end
	end )
end
--addons/ssrp_lfs/lua/entities/lvs_walker_atte/cl_ikfunctions.lua:

function ENT:OnRemoved()
	self:LegClearAll()
end

local debugred = Color(255,0,0,255)
local debugblue = Color(0,0,255,255)
local debuggreen = Color(0,255,0,255)

function ENT:LegClearAll()
	if istable( self.IK_Joints ) then
		for _, tab in pairs( self.IK_Joints ) do
			for _,prop in pairs( tab ) do
				if IsValid( prop ) then
					prop:Remove()
				end
			end
		end

		self.IK_Joints = nil
	end
end

function ENT:GetLegEnts( index, L1, L2, JOINTANG, STARTPOS, ENDPOS, ATTACHMENTS )
	if not istable( self.IK_Joints ) then self.IK_Joints = {} end

	if self.IK_Joints[ index ] then
		if IsValid( self.IK_Joints[ index ].LegBaseRot ) and IsValid( self.IK_Joints[ index ].LegRotCalc ) then
			if (self.IK_Joints[ index ].LegBaseRot:GetPos() - STARTPOS):Length() > 1 or (self.IK_Joints[ index ].LegRotCalc:GetPos() - STARTPOS):Length() > 1 then
				for k, v in pairs( self.IK_Joints[ index ] ) do
					if IsValid( v ) then
						v:Remove()
					end
				end
				self.IK_Joints[ index ] = nil
			end
		end
	end

	if not self.IK_Joints[ index ] then
		self.IK_Joints[ index ] = {}

		local BaseProp = ents.CreateClientProp()
		BaseProp:SetPos( STARTPOS )
		BaseProp:SetAngles( JOINTANG )
		BaseProp:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
		BaseProp:SetParent( self )
		BaseProp:Spawn()

		local LegRotCalc = ents.CreateClientProp()
		LegRotCalc:SetPos( STARTPOS )
		LegRotCalc:SetAngles( JOINTANG )
		LegRotCalc:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
		LegRotCalc:SetParent( self )
		LegRotCalc:Spawn()

		local prop1 = ents.CreateClientProp()
		prop1:SetPos( BaseProp:LocalToWorld( Vector(0,0,L1 * 0.5) ) )
		prop1:SetAngles( JOINTANG )
		prop1:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
		prop1:SetParent( self )
		prop1:Spawn()

		local prop2 = ents.CreateClientProp()
		prop2:SetPos( BaseProp:LocalToWorld( Vector(0,0,L1 + L2) ) )
		prop2:SetAngles( JOINTANG )
		prop2:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
		prop2:SetParent( self )
		prop2:Spawn()

		local prop3 = ents.CreateClientProp()
		prop3:SetPos( STARTPOS )
		prop3:SetAngles( JOINTANG )
		prop3:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
		prop3:SetParent( LegRotCalc )
		prop1:SetParent( prop3 )
		prop3:Spawn()

		local prop4 = ents.CreateClientProp()
		prop4:SetPos( BaseProp:LocalToWorld( Vector(0,0,L1) ) )
		prop4:SetAngles( JOINTANG )
		prop4:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
		prop4:SetParent( prop1 )
		prop2:SetParent( prop4 )
		prop4:Spawn()

		self.IK_Joints[ index ].LegBaseRot = BaseProp
		self.IK_Joints[ index ].LegRotCalc = LegRotCalc
		self.IK_Joints[ index ].LegEnt1 = prop1
		self.IK_Joints[ index ].LegEnt2 = prop2
		self.IK_Joints[ index ].LegEnt3 = prop3
		self.IK_Joints[ index ].LegEnt4 = prop4

		for _, v in pairs( self.IK_Joints[ index ] ) do
			v:SetColor( Color( 0, 0, 0, 0 ) )
			v:SetRenderMode( RENDERMODE_TRANSALPHA )
		end

		if ATTACHMENTS then
			if ATTACHMENTS.Leg1 then
				local prop = ents.CreateClientProp()
				prop:SetPos( prop3:LocalToWorld( ATTACHMENTS.Leg1.Pos ) )
				prop:SetAngles( prop3:LocalToWorldAngles( ATTACHMENTS.Leg1.Ang ) )
				prop:SetModel( ATTACHMENTS.Leg1.MDL )
				prop:SetParent( prop3 )
				prop:Spawn()
				self.IK_Joints[ index ].Attachment1 = prop
			end
			if ATTACHMENTS.Leg2 then
				local prop = ents.CreateClientProp()
				prop:SetPos( prop4:LocalToWorld( ATTACHMENTS.Leg2.Pos ) )
				prop:SetAngles( prop4:LocalToWorldAngles( ATTACHMENTS.Leg2.Ang ) )
				prop:SetModel( ATTACHMENTS.Leg2.MDL )
				prop:SetParent( prop4 )
				prop:Spawn()
				self.IK_Joints[ index ].Attachment2 = prop
			end
			if ATTACHMENTS.Foot then
				local prop = ents.CreateClientProp()
				prop:SetModel( ATTACHMENTS.Foot.MDL )
				prop:SetParent( prop2 )
				prop:Spawn()
				self.IK_Joints[ index ].Attachment3 = prop
			end
		end
	end

	if not IsValid( self.IK_Joints[ index ].LegRotCalc ) or not IsValid( self.IK_Joints[ index ].LegBaseRot ) or not IsValid( self.IK_Joints[ index ].LegEnt1 ) or not IsValid( self.IK_Joints[ index ].LegEnt2 ) or not IsValid( self.IK_Joints[ index ].LegEnt3 ) or not IsValid( self.IK_Joints[ index ].LegEnt4 ) then
		self:LegClearAll()

		return
	end

	self.IK_Joints[ index ].LegRotCalc:SetAngles(self.IK_Joints[ index ].LegBaseRot:LocalToWorldAngles( self.IK_Joints[ index ].LegBaseRot:WorldToLocal( ENDPOS ):Angle() ) )

	local LegRotCalcPos = self.IK_Joints[ index ].LegRotCalc:GetPos()

	local Dist = math.min( (LegRotCalcPos - ENDPOS ):Length(), L1 + L2)
	local Angle1 = 90 - math.deg( math.acos( (Dist ^ 2 + L1 ^ 2 - L2 ^ 2) / (2 * Dist * L1) ) )
	local Angle2 = math.deg( math.acos( (Dist ^ 2 + L2 ^ 2 - L1 ^ 2) / (2 * Dist * L2) ) ) + 90

	self.IK_Joints[ index ].LegEnt3:SetAngles( self.IK_Joints[ index ].LegRotCalc:LocalToWorldAngles( Angle(Angle1,180,180) ) )
	self.IK_Joints[ index ].LegEnt4:SetAngles( self.IK_Joints[ index ].LegRotCalc:LocalToWorldAngles( Angle(Angle2,180,180) ) )

	if self.IK_Joints[ index ].Attachment3 then
		self.IK_Joints[ index ].Attachment3:SetAngles( self:LocalToWorldAngles( ATTACHMENTS.Foot.Ang ) )
		self.IK_Joints[ index ].Attachment3:SetPos(self.IK_Joints[ index ].LegEnt2:GetPos() + self:GetForward() * ATTACHMENTS.Foot.Pos.x  + self:GetRight() * ATTACHMENTS.Foot.Pos.y + self:GetUp() * ATTACHMENTS.Foot.Pos.z )
	end
end

--addons/ssrp_lfs/lua/entities/lvs_walker_hsd/sh_weapons.lua:

function ENT:AimTurretSecondary()
	local trace = self:GetEyeTrace()

	local AimAngles = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld( Vector(0,0,100)) ):GetNormalized():Angle() )

	self:SetPoseParameter("turret_secondary_pitch", -AimAngles.p )
	self:SetPoseParameter("turret_secondary_yaw", AimAngles.y )
end

function ENT:AimTurretPrimary()
	local trace = self:GetEyeTrace()

	local AimAngles = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld( Vector(0,0,342)) ):GetNormalized():Angle() )

	self:SetPoseParameter("turret_primary_pitch", -AimAngles.p )
	self:SetPoseParameter("turret_primary_yaw", AimAngles.y )
end

function ENT:WeaponsInRange()
	local Forward = self:GetForward()
	local AimForward = self:GetAimVector()

	return self:AngleBetweenNormal( Forward, AimForward ) < 45
end

function ENT:TraceProjectorBeam()
	local ID = self:LookupAttachment( "muzzle_primary" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return end

	local dir = -Muzzle.Ang:Right()
	local pos = Muzzle.Pos

	local trace = util.TraceLine( {
		start = pos,
		endpos = (pos + dir * 50000),
	} )

	return trace
end

function ENT:StopProjector()
	if not self:GetProjectorBeam() then return end

	self:SetProjectorBeam( false )

	self.SNDProjector:Stop()
end

function ENT:StartProjector()
	if not IsValid( self.SNDProjector ) then return end

	if self:GetProjectorBeam() then return end

	self:SetProjectorBeam( true )

	self.SNDProjector:Play()
end

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/laserbeam.png")
	weapon.Ammo = -1
	weapon.Delay = 2
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0.5
	weapon.OnThink = function( ent, active )
		ent:AimTurretPrimary()

		if not ent:GetProjectorBeam() then return end

		local trace = ent:TraceProjectorBeam()

		ent:ProjectorBeamDamage( trace.Entity, ent:GetDriver(), trace.HitPos, (trace.HitPos - ent:GetPos()):GetNormalized() )

		if not active then return end

		ent:SetHeat( ent:GetHeat() + FrameTime() * 10 )
	end
	weapon.Attack = function( ent )
		if ent:GetProjectorBeam() then return true end

		if not ent:WeaponsInRange() then return true end

		ent:StartProjector()

		timer.Simple( 1.25, function()
			if not IsValid( ent ) then return end

			ent:StopProjector()
		end )
	end
	self:AddWeapon( weapon )


	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Ammo = 100
	weapon.Delay = 0.5
	weapon.HeatRateUp = 0.5
	weapon.HeatRateDown = 0.4
	weapon.OnOverheat = function( ent )
		timer.Simple( 0.4, function()
			if not IsValid( ent ) then return end

			ent:EmitSound("lvs/overheat.wav")
		end )
	end
	weapon.Attack = function( ent )
		if not ent:WeaponsInRange() then return true end

		local effectdata = EffectData()
		effectdata:SetOrigin( ent:LocalToWorld( Vector(0,0,200) ) )
		effectdata:SetEntity( ent )
		effectdata:SetAttachment( ent:LookupAttachment( "muzzle_secondary" ) )
		util.Effect( "lvs_laser_charge", effectdata )

		timer.Simple( 0.4, function()
			if not IsValid( ent ) then return end

			local ID = ent:LookupAttachment( "muzzle_secondary" )
			local Muzzle = ent:GetAttachment( ID )

			if not Muzzle then return end

			local bullet = {}
			bullet.Src 	= Muzzle.Pos
			bullet.Dir 	= ent:WeaponsInRange() and (ent:GetEyeTrace().HitPos - Muzzle.Pos):GetNormalized() or -Muzzle.Ang:Right()
			bullet.Spread 	= Vector(0,0,0)
			bullet.TracerName = "lvs_laser_red_aat"
			bullet.Force	= 10
			bullet.HullSize 	= 1
			bullet.Damage	= 200
			bullet.SplashDamage = 300
			bullet.SplashDamageRadius = 250
			bullet.Velocity = 10000
			bullet.Attacker 	= ent:GetDriver()
			bullet.Callback = function(att, tr, dmginfo)
				local effectdata = EffectData()
					effectdata:SetOrigin( tr.HitPos )
				util.Effect( "lvs_laser_explosion_aat", effectdata )
			end
			ent:LVSFireBullet( bullet )

			local effectdata = EffectData()
			effectdata:SetStart( Vector(255,50,50) )
			effectdata:SetOrigin( bullet.Src )
			effectdata:SetNormal( Muzzle.Ang:Up() )
			effectdata:SetEntity( ent )
			util.Effect( "lvs_muzzle_colorable", effectdata )

			ent:TakeAmmo()

			if not IsValid( ent.SNDTurret ) then return end

			ent.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
		end )
	end
	weapon.OnThink = function( ent, active )
		ent:AimTurretSecondary()
	end
	self:AddWeapon( weapon )
end
--MediaLib_DynFile_webradio.lua:
local oop = medialib.load("oop")
local WebRadioService = oop.class("WebRadioService", "BASSService")
WebRadioService.identifier = "webradio"

local all_patterns = {
	"^https?://(.*)%.pls",
	"^https?://(.*)%.m3u"
}

function WebRadioService:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local id = string.match(url, pattern)
		if id then
			return {id = id}
		end
	end
end

function WebRadioService:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

function WebRadioService:resolveUrl(url, callback)
	callback(url, {})
end

function WebRadioService:directQuery(url, callback)
	callback(nil, {
		title = url:match("([^/]+)$") -- the filename is the best we can get (unless we parse pls?)
	})
end

return WebRadioService
--MediaLib_DynFile_mp4.lua:
local oop = medialib.load("oop")

local Mp4Service = oop.class("Mp4Service", "HTMLService")
Mp4Service.identifier = "mp4"

local all_patterns = {"^https?://.*%.mp4"}

function Mp4Service:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local id = string.match(url, pattern)
		if id then
			return {id = id}
		end
	end
end

function Mp4Service:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

local player_url = "https://wyozi.github.io/gmod-medialib/mp4.html?id=%s"
function Mp4Service:resolveUrl(url, callback)
	local urlData = self:parseUrl(url)
	local playerUrl = string.format(player_url, urlData.id)

	callback(playerUrl, {start = urlData.start})
end

function Mp4Service:directQuery(url, callback)
	callback(nil, {
		title = url:match("([^/]+)$")
	})
end

function Mp4Service:hasReliablePlaybackEvents()
	return true
end

return Mp4Service
--MediaLib_DynFile_twitch.lua:
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

local function metaQuery(name, callback)
	http.Fetch("https://gmod-api.superiorservers.co/api/mediaplayer/twitch/" .. name, function(b)
		local obj = util.JSONToTable(b)
		if not obj or not obj.response or not obj.success then
			callback(obj and obj.message or 'Channel not found')
			print(b)
			return
		end

		callback(nil, obj.response)
	end, function()
		callback("failed HTTP request")
	end)
end

function TwitchService:directQuery(url, callback)
	local urlData = self:parseUrl(url)

	metaQuery(urlData.id, function(metaErr, meta)
		if metaErr then
			callback(metaErr)
			return
		end

		local data = {}
		data.id = meta.broadcaster_login	
		data.title = meta.title:sub(1, 256)
		data.icon = meta.icon
		data.raw = meta

		callback(nil, data)
	end)
end

return TwitchService
--addons/!lpakr_out/lua/dash/thirdparty/medialib.core/ext/volume3d.lua:
local function a(b)if b.fadeMax3D then b.chan:Set3DFadeDistance(0,b.fadeMax3D)end;if b.pos3D then b.chan:SetPos(b.pos3D)elseif b.ent3D then local c="MediaLib.3DThink."..b:hashCode()hook.Add("Think",c,function()if!b:isValid()then hook.Remove("Think",c)return end;if!IsValid(b.ent3D)then b:stop()return end;b.chan:SetPos(b.ent3D:GetPos())end)end end;local d=CreateConVar("medialib_vol3d_debugobstacle","0")local e,f={},{}e.output=f;e.mask=MASK_SOLID_BRUSHONLY;local function g(h)local i=LocalPlayer():EyePos()local j=d:GetBool()local k=(i-h):GetNormalized()local l=k:Cross(Vector(0,0,1))local m=-k:Cross(l)local n=8;local o=0;local p=20;for q=1,n do local r=math.pi*2*q/n;local s=h+math.cos(r)*p*l+math.sin(r)*p*m;e.start=s;e.endpos=i;local t=util.TraceLine(e)if t.Hit then o=o+1 end;if j then debugoverlay.Line(s,i,0.1,t.Hit&&Color(255,0,0)||Color(255,127,0))end end;local u=o/n;return math.Remap(1-u,0,1,0.3,1),u==1&&1.2||1 end;local function v(b)local c="MediaLib.3DThink."..b:hashCode()hook.Add("Think",c,function()if!b:isValid()then hook.Remove("Think",c)return end;local h;if b.pos3D then h=b.pos3D elseif b.ent3D then if!IsValid(b.ent3D)then b:stop()return end;h=b.ent3D:GetPos()end;if!h then return end;local w=LocalPlayer():EyePos()local x=w:Distance(h)local y=b.fadeMax3D||1024;local z=x/y;local A=0;if z<1 then local B,C=g(h)if b.attenuationType=="linear"then A=1-z else A=1/(z+1)^7 end;A=A*B;A=math.Clamp(A,0,1)end;b.internalVolume=math.Approach(b.internalVolume||0,A,FrameTime()*2)b:applyVolume()end)end;local function D(b)if b:getBaseService()=="bass"then a(b)elseif b:getBaseService()=="html"then v(b)end end;hook.Add("Medialib_ProcessOpts","Medialib_Volume3d",function(E,F)if!F.use3D then return end;E.is3D=true;if E:getBaseService()=="bass"then table.insert(E.bassPlayOptions,"3d")end;function E:set3DPos(h)self.pos3D=h;self.ent3D=nil end;function E:set3DEnt(G)self.pos3D=nil;self.ent3D=G end;function E:set3DFadeMax(H)self.fadeMax3D=H;if IsValid(self.chan)&&self:getBaseService()=="bass"then self.chan:Set3DFadeDistance(0,H)end end;function E:set3DAttenuationType(I)self.attenuationType=I end;if F.pos3D then E:set3DPos(F.pos3D)end;if F.ent3D then E:set3DEnt(F.ent3D)end;if F.attenuationType then E:set3DAttenuationType(F.attenuationType)end;E:runCommand(function()D(E)end)end)
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_projector.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_screen.lua:
AddCSLuaFile()ENT.Base='media_base'ENT.PrintName='Screen'ENT.Category='RP Media'ENT.Spawnable=info.Dev;ENT.MediaPlayer=true;ENT.Model='models/props_building_details/storefront_template001a_bars.mdl'if CLIENT then function ENT:Draw()end;hook('PostDrawOpaqueRenderables','screens.PostDrawOpaqueRenderables',function()for a,b in ipairs(ents.FindByClass('media_screen'))do if LocalPlayer():GetPos():Distance(b:GetPos())<450 then local c=b:GetAngles()c:RotateAroundAxis(c:Right(),90)cam.Start3D2D(b:GetPos(),c,0.065)b:DrawScreen(-950,-560,1900,1120)cam.End3D2D()end end end)end
--addons/!lpakr_out/lua/entities/nbot_sw_snow_droid_commando.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/nbot_sw_superbattle_droid.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_dewback.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_rancordragon.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Rancor-dragon"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/rancordragon_a01.mdl"}ENT.Skins={0}ENT.ModelScale=1;ENT.CollisionBounds=Vector(100,100,100)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=1000;ENT.HealthRegen=5;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;ENT.OnSpawnSounds={}ENT.OnIdleSounds={"fallenlogic/rancor/breath_loop.wav"}ENT.IdleSoundDelay=2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={}ENT.OnDownedSounds={}ENT.Footsteps={}ENT.Omniscient=false;ENT.SpotDuration=30;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=80;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.Frightening=true;ENT.AllyDamageTolerance=0.33;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.33;ENT.Acceleration=1000;ENT.Deceleration=1000;ENT.JumpHeight=50;ENT.StepHeight=20;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;ENT.WalkAnimation=ACT_IDLE;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_IDLE;ENT.RunAnimRate=1;ENT.IdleAnimation=ACT_IDLE;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_IDLE;ENT.JumpAnimRate=1;ENT.UseWalkframes=false;ENT.WalkSpeed=100;ENT.RunSpeed=200;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=60;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(0,0,0)ENT.EyeBone="R_Eyelid"ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.UseWeapons=false;ENT.Weapons={}ENT.WeaponAccuracy=1;ENT.WeaponAttachment=""ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=false;ENT.PossessionEnabled=false;ENT.PossessionPrompt=true;ENT.PossessionCrosshair=false;ENT.PossessionMovement=POSSESSION_MOVE_1DIR;ENT.PossessionViews={}ENT.PossessionBinds={}if SERVER then else function ENT:CustomInitialize()end;function ENT:CustomThink()end;function ENT:CustomDraw()end end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_vardosian_acklay.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_wampa.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Wampa"ENT.Category="[Valkyrie] Humanoid NPCs"ENT.Models={"models/jediacad/wampa.mdl"}ENT.CollisionBounds=Vector(20,20,80)ENT.BloodColor=BLOOD_COLOR_RED;ENT.Skins={1}ENT.ModelScale=2;ENT.OnDamageSounds={"fallenlogic/rakghoul/rakghoul_growl.mp3"}ENT.OnDeathSounds={}ENT.SpawnHealth=250;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=50;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ZOMBIES}ENT.UseWalkframes=false;ENT.RunSpeed=50;ENT.WalkSpeed=35;ENT.RunAnimation=ACT_WALK;ENT.EyeBone="head"ENT.EyeOffset=Vector(7.5,0,5)AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_womprat.lua:
if!DrGBase then return end;ENT.Base='drgbase_nextbot'ENT.CWRP=true;ENT.PrintName='Womp rat'ENT.Category='[Valkyrie] Creature NPCs'ENT.Models={'models/swtor/npcs/womprat_a01.mdl'}ENT.Skins={0}ENT.ModelScale=1;ENT.CollisionBounds=Vector(45,66,43)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=200;ENT.HealthRegen=0;ENT.MinPhysDamage=20;ENT.MinFallDamage=5;ENT.AttackDamage=15;ENT.OnSpawnSounds={'fallenlogic/nexu/nexu_growl.mp3'}ENT.OnIdleSounds={}ENT.IdleSoundDelay=2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={}ENT.OnDownedSounds={}ENT.Footsteps={}ENT.Omniscient=false;ENT.SpotDuration=30;ENT.RangeAttackRange=65;ENT.MeleeAttackRange=65;ENT.ReachEnemyRange=65;ENT.AvoidEnemyRange=0;ENT.FollowPlayers=true;ENT.Factions={FACTION_ANTLIONS}ENT.Frightening=true;ENT.AllyDamageTolerance=0.33;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.33;ENT.Acceleration=800;ENT.Deceleration=800;ENT.JumpHeight=50;ENT.StepHeight=10;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;ENT.WalkAnimation=ACT_WALK;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_WALK;ENT.RunAnimRate=1.5;ENT.IdleAnimation=ACT_IDLE;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_JUMP;ENT.JumpAnimRate=1;ENT.UseWalkframes=false;ENT.WalkSpeed=35;ENT.RunSpeed=53;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=80;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(-12,0,0)ENT.EyeBone='Camera'ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.UseWeapons=false;ENT.Weapons={}ENT.WeaponAccuracy=1;ENT.WeaponAttachment=''ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=false;ENT.PossessionEnabled=true;ENT.PossessionCrosshair=true;ENT.PossessionViews={{offset=Vector(-200,0,150),distance=0},{offset=Vector(45,0,0),distance=-325,eyepos=true}}ENT.PossessionBinds={[IN_ATTACK]={{coroutine=true,onkeydown=function(self)self:PlaySequenceAndMove('default_attack',1,self.PossessionFaceForward)local a=ents.FindInSphere(self:GetPos(),300)for b,c in ipairs(a)do c:TakeDamage(25,self,self)end;self:PlaySequenceAndMove('default_attack2',1,self.PossessionFaceForward)end}}}if SERVER then else function ENT:CustomInitialize()end;function ENT:CustomThink()end;function ENT:CustomDraw()end end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/particlecontroller_tracer.lua:
AddCSLuaFile()ENT.Base="base_gmodentity"ENT.PrintName="Particle Controller - Tracer"ENT.Author=""ENT.Spawnable=false;ENT.AdminSpawnable=false;ENT.RenderGroup=RENDERGROUP_NONE;function ENT:SetupDataTables()self:NetworkVar("Entity",0,"TargetEnt")self:NetworkVar("String",0,"EffectName")self:NetworkVar("String",1,"NumpadState")self:NetworkVar("String",2,"Impact_EffectName")self:NetworkVar("Float",0,"RepeatRate")self:NetworkVar("Float",1,"TracerSpread")self:NetworkVar("Float",2,"EffectLifetime")self:NetworkVar("Int",0,"AttachNum")self:NetworkVar("Int",1,"NumpadKey")self:NetworkVar("Int",2,"TracerCount")self:NetworkVar("Bool",0,"Active")self:NetworkVar("Bool",1,"Toggle")self:NetworkVar("Bool",2,"LeaveBulletHoles")self:NetworkVar("Vector",0,"Impact_UtilEffectInfo")self:NetworkVar("Vector",1,"Impact_ColorInfo")end;function ENT:Initialize()local a=self:GetTargetEnt()if SERVER then else if!string.StartWith(self:GetEffectName(),"!UTILEFFECT!")then local b=nil;if self:GetColor().r==0&&self:GetColor().g==0&&self:GetColor().b==0 then else if self:GetColor().a==1 then b={position=Vector(self:GetColor().r/255,self:GetColor().g/255,self:GetColor().b/255)}else b={position=Vector(self:GetColor().r,self:GetColor().g,self:GetColor().b)}end end;self.cpointtable={}self.cpointtable[1]={entity=a,attachtype=PATTACH_ABSORIGIN_FOLLOW}self.cpointtable[2]=true;for c=3,64 do if b then self.cpointtable[c]=b else self.cpointtable[c]=self.cpointtable[1]end end;PrecacheParticleSystem(self:GetEffectName())end end;self:SetModel("models/hunter/plates/plate.mdl")self:SetNoDraw(true)if self:GetRepeatRate()>0 then self.NextRepeat=0 else if self:GetActive()then self:AttachParticle()end end end;function ENT:Think()if self:GetNumpadState()=="off"then self:SetNumpadState("")end;if self:GetNumpadState()=="on"then self:SetNumpadState("")if self:GetRepeatRate()>0 then self.NextRepeat=0 else if self:GetActive()then self:AttachParticle()end end end;if self:GetActive()==true&&self:GetRepeatRate()>0 then if!(self.NextRepeat>CurTime())then self:AttachParticle()self.NextRepeat=CurTime()+self:GetRepeatRate()end end;self:NextThink(CurTime())return true end;function ENT:AttachParticle()local a=self:GetTargetEnt()local d=self:GetEffectName()local e=math.Clamp(self:GetTracerSpread(),0,4)local f=self:GetTracerCount()local g=self:GetLeaveBulletHoles()local h=math.Clamp(self:GetEffectLifetime(),0.5,5)local i=self:GetImpact_EffectName()if d==nil||!a:IsValid()then return end;for c=1,f do local j={}if self:GetParent()!=NULL then j.filter={self:GetParent(),self:GetParent():GetParent()}end;local k=a:GetPos()local l=a:GetAngles()local m=AngleRand()l:RotateAroundAxis(l:Forward(),m.r)l:RotateAroundAxis(l:Right(),m.p*e/2)l:RotateAroundAxis(l:Up(),m.y*e/4)j.start=k;j.endpos=k+l:Forward()*20000;local n=util.TraceLine(j)local o=ClientsideModel("models/hunter/plates/plate.mdl",RENDERGROUP_OTHER)o:SetNoDraw(true)o:SetPos(n.HitPos)o:SetAngles(n.HitNormal:Angle())timer.Simple(h,function()if IsValid(o)then o:Remove()end end)o:Spawn()o:Activate()if self.cpointtable then self.cpointtable[2]={entity=o,attachtype=PATTACH_ABSORIGIN_FOLLOW}end;if g==true then local p=EffectData()p:SetStart(k)p:SetOrigin(n.HitPos)p:SetNormal(n.HitNormal)p:SetEntity(n.Entity)p:SetSurfaceProp(n.SurfaceProps)p:SetHitBox(n.HitBox)util.Effect("Impact",p)end;if string.StartWith(d,"!UTILEFFECT!")then local q=EffectData()q:SetEntity(o)q:SetScale(5000)q:SetFlags(0)if string.EndsWith(d,"!")then if string.find(d,"!FLAG1!")then q:SetFlags(1)d=string.Replace(d,"!FLAG1!","")end;if string.find(d,"!FLAG2!")then q:SetFlags(2)d=string.Replace(d,"!FLAG2!","")end;if string.find(d,"!FLAG3!")then q:SetFlags(3)d=string.Replace(d,"!FLAG3!","")end;if string.find(d,"!FLAG4!")then q:SetFlags(4)d=string.Replace(d,"!FLAG4!","")end;if string.find(d,"!FLAG5!")then q:SetFlags(5)d=string.Replace(d,"!FLAG5!","")end;if string.find(d,"!FLAG6!")then q:SetFlags(6)d=string.Replace(d,"!FLAG6!","")end;if string.find(d,"!FLAG7!")then q:SetFlags(7)d=string.Replace(d,"!FLAG7!","")end;if string.find(d,"!FLAG8!")then q:SetFlags(8)d=string.Replace(d,"!FLAG8!","")end;if string.find(d,"!FLAG9!")then q:SetFlags(9)d=string.Replace(d,"!FLAG9!","")end end;q:SetColor(0)if string.EndsWith(d,"!")then if string.find(d,"!COLOR1!")then q:SetColor(1)d=string.Replace(d,"!COLOR1!","")end;if string.find(d,"!COLOR2!")then q:SetColor(2)d=string.Replace(d,"!COLOR2!","")end;if string.find(d,"!COLOR3!")then q:SetColor(3)d=string.Replace(d,"!COLOR3!","")end;if string.find(d,"!COLOR4!")then q:SetColor(4)d=string.Replace(d,"!COLOR4!","")end;if string.find(d,"!COLOR5!")then q:SetColor(5)d=string.Replace(d,"!COLOR5!","")end;if string.find(d,"!COLOR6!")then q:SetColor(6)d=string.Replace(d,"!COLOR6!","")end;if string.find(d,"!COLOR7!")then q:SetColor(7)d=string.Replace(d,"!COLOR7!","")end;if string.find(d,"!COLOR8!")then q:SetColor(8)d=string.Replace(d,"!COLOR8!","")end;if string.find(d,"!COLOR9!")then q:SetColor(9)d=string.Replace(d,"!COLOR9!","")end end;q:SetOrigin(n.HitPos)q:SetStart(k)q:SetNormal(n.HitNormal:Angle():Forward())util.Effect(string.Replace(d,"!UTILEFFECT!",""),q)else o:CreateParticleEffect(d,self.cpointtable)end;if i!=""then if string.StartWith(i,"!UTILEFFECT!")then local r=self:GetImpact_UtilEffectInfo().x;local s=self:GetImpact_UtilEffectInfo().y;local t=self:GetImpact_UtilEffectInfo().z;local p=EffectData()p:SetEntity(o)if string.find(i,"Tracer",0,true)!=nil then p:SetScale(5000)else p:SetScale(r)end;p:SetMagnitude(s)p:SetRadius(t)p:SetFlags(0)if string.EndsWith(i,"!")then if string.find(i,"!FLAG1!")then p:SetFlags(1)i=string.Replace(i,"!FLAG1!","")end;if string.find(i,"!FLAG2!")then p:SetFlags(2)i=string.Replace(i,"!FLAG2!","")end;if string.find(i,"!FLAG3!")then p:SetFlags(3)i=string.Replace(i,"!FLAG3!","")end;if string.find(i,"!FLAG4!")then p:SetFlags(4)i=string.Replace(i,"!FLAG4!","")end;if string.find(i,"!FLAG5!")then p:SetFlags(5)i=string.Replace(i,"!FLAG5!","")end;if string.find(i,"!FLAG6!")then p:SetFlags(6)i=string.Replace(i,"!FLAG6!","")end;if string.find(i,"!FLAG7!")then p:SetFlags(7)i=string.Replace(i,"!FLAG7!","")end;if string.find(i,"!FLAG8!")then p:SetFlags(8)i=string.Replace(i,"!FLAG8!","")end;if string.find(i,"!FLAG9!")then p:SetFlags(9)i=string.Replace(i,"!FLAG9!","")end end;p:SetColor(0)if string.EndsWith(i,"!")then if string.find(i,"!COLOR1!")then p:SetColor(1)i=string.Replace(i,"!COLOR1!","")end;if string.find(i,"!COLOR2!")then p:SetColor(2)i=string.Replace(i,"!COLOR2!","")end;if string.find(i,"!COLOR3!")then p:SetColor(3)i=string.Replace(i,"!COLOR3!","")end;if string.find(i,"!COLOR4!")then p:SetColor(4)i=string.Replace(i,"!COLOR4!","")end;if string.find(i,"!COLOR5!")then p:SetColor(5)i=string.Replace(i,"!COLOR5!","")end;if string.find(i,"!COLOR6!")then p:SetColor(6)i=string.Replace(i,"!COLOR6!","")end;if string.find(i,"!COLOR7!")then p:SetColor(7)i=string.Replace(i,"!COLOR7!","")end;if string.find(i,"!COLOR8!")then p:SetColor(8)i=string.Replace(i,"!COLOR8!","")end;if string.find(i,"!COLOR9!")then p:SetColor(9)i=string.Replace(i,"!COLOR9!","")end end;if string.find(string.lower(i),"shakeropes")then p:SetMagnitude(s*20)end;if string.find(string.lower(i),"thumperdust")then p:SetScale(r*50)end;if string.find(string.lower(i),"bloodspray")then p:SetScale(r*4)end;p:SetStart(o:GetPos())p:SetOrigin(o:GetPos())p:SetAngles(o:GetAngles())p:SetNormal(n.HitNormal)util.Effect(string.Replace(i,"!UTILEFFECT!",""),p)else local b=nil;if self:GetImpact_ColorInfo()==Vector(0,0,0)then else b={position=self:GetImpact_ColorInfo()}end;local u={}u[1]={entity=o,attachtype=PATTACH_ABSORIGIN_FOLLOW}for c=2,64 do if b then u[c]=b else u[c]=u[1]end end;o:CreateParticleEffect(i,u)end end end end;duplicator.RegisterEntityClass("particlecontroller_tracer",function(v,w)end,"Data")
--addons/!lpakr_out/lua/entities/pfx1_04.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_08_.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_08_~_l.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_08_~_l.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Large Fire [Yellow]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]_large_campfire_yellow"
--addons/!lpakr_out/lua/entities/pfx1_0b.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_0e.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx2_02_s.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Gushing Blood"ENT.Category="PPE: Other"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[2]gushing_blood"
--addons/!lpakr_out/lua/entities/pfx4_00_s~.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_01.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Blue Jet"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_b"
--addons/!lpakr_out/lua/entities/pfx4_01_s~.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_01~.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_02_s.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_03.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_04.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="PFX:Purple Jet"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_v"
--addons/!lpakr_out/lua/entities/pfx6_02.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx6_02.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Bullet Tracer"ENT.Category="PPE: Weapons"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[6]bullet_tracer_generic"
--addons/!lpakr_out/lua/entities/pfx7_02.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx7_02.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Snow"ENT.Category="PPE: Weather"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[7]snow"
--addons/!lpakr_out/lua/entities/pfx7_03.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Fog 1"ENT.Category="PPE: Weather"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[7]areal_fog_s"
--addons/!lpakr_out/lua/entities/pfxcom.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/point_drg_ragdoll.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/point_drg_ragdoll.lua:
ENT.Type="point"ENT.Base="base_entity"ENT.PrintName="Ragdoll Attachment"ENT.Category='GM Hostile Nextbots'function ENT:SetupDataTables()self:NetworkVar("Entity",0,"Ragdoll")self:NetworkVar("Int",0,"Bone")end;if SERVER then else local a=CreateClientConVar("drgbase_adjust_ragdoll_attachments","0")function ENT:Think()if!a:GetBool()then return end;local b=self:GetRagdoll()if IsValid(b)then local c=b:GetBonePosition(self:GetBone())local d=c:DrG_Direction(self:GetPos())for e=0,b:GetBoneCount()-1 do if b:GetBoneName(e)=="__INVALIDBONE__"then continue end;local f,g=b:GetBonePosition(e)b:SetBonePosition(e,f+d,g)end end end end
--addons/!lpakr_out/lua/entities/proj_drg_default/meta.lua:
local a=FindMetaTable("Entity")
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_artilleryshell/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_aura/cl_init.lua:
include'shared.lua'function ENT:Draw()local a,b=self:GetRenderBounds()local c=b.x;render.DrawWireframeSphere(self:GetPos(),c,12,12,col.red,true)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_aura/shared.lua:
ENT.Type='anim'ENT.Base='base_anim'ENT.PrintName='SUP Aua'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Editable=false;ENT.Spawnable=info.Dev;ENT.AdminOnly=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.DoNotDuplicate=true;ENT.IgnoreGoCheck=true
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_aura_explosion.lua:
AddCSLuaFile()ENT.Base='rp_aura'ENT.PrintName='Explosion Aura'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.DoNotDuplicate=true;ENT.buffid='explosion'function ENT:CanBuff(a)return a:IsPlayer()&&!a.InEvent end;function ENT:OnZoneEntered(b)b.ResistDamage=(b.ResistDamage||0)+1;if b.ResistDamage==1 then srp.buffs.Add(b,self.buffid)end end;function ENT:OnZoneExit(b)b.ResistDamage=(b.ResistDamage||1)-1;if b.ResistDamage<=0 then srp.buffs.Remove(b,self.buffid)end end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_beacon/shared.lua:
ENT.Type='anim'ENT.Base='base_srp'ENT.PrintName='Player Beacon'ENT.Author="Scott"ENT.Contact='superiorservers.co'ENT.Purpose='A beacon that will display to everyone.'ENT.Spawnable=true;ENT.RenderGroup=RENDERGROUP_OPAQUE;ENT.Category='SUP'ENT.NetworkPlayerUse=true;ENT.DoNotDuplicate=true;ENT.Colors={{name='Red',col=col.red},{name='Red Dark',col=col.red_dark},{name='Red Light',col=col.red_light},{name='Green',col=col.green},{name='Green Dark',col=col.green_dark},{name='Green Light',col=col.green_light},{name='Blue',col=col.blue},{name='Blue Dark',col=col.blue_dark},{name='Blue Light',col=col.blue_light},{name='White',col=col.white},{name='White Dark',col=col.white_dark},{name='Grey',col=col.grey},{name='Grey Dark',col=col.grey_dark},{name='Grey Light',col=col.grey_light},{name='Yellow',col=col.yellow},{name='Pink',col=col.pink},{name='Orange',col=col.orange}}function ENT:SetupDataTables()self:NetworkVar('Int',0,'BeaconColor')self:NetworkVar('String',0,'BeaconName')end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_busstation.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='base_anim'ENT.Category='SUP'ENT.PrintName='Bus Station'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Spawnable=info.Dev;ENT.Model=Model'models/props_street/bus_stop.mdl'ENT.DoNotDuplicate=true;ENT.DontSit=true;ENT.NamePosition=Vector(-108,35,114.3)ENT.NameAngle=Angle(0,-90,90)ENT.SoundArriving=Sound'galactic/busstation/arriving.mp3'ENT.SoundArrivingSoon='Station.ArrivingSoon'ENT.ExitPoint=Vector(0,-10,0)sound.Add({name='Station.ArrivingSoon',sound=Sound('galactic/busstation/arriving.mp3'),pitch=80,volume=1,level=64})function ENT:SetupDataTables()self:NetworkVar('String',0,'StationName')end;function ENT:Initialize()self:SetModel(self.Model)end;function ENT:SetExitPoint(a)self.ExitPoint=a end;function ENT:GetExitPoint()return self.ExitPoint end;function ENT:SetStationID(b)self.StationID=b end;function ENT:GetStationID()return self.StationID end;function ENT:SetNextStation(c)self.NextStation=c end;function ENT:SetPrevStation(c)self.PrevStation=c end;function ENT:SetPathing(d)self.Entrance=d end;function ENT:SetWaitTime(e)self.WaitTime=e end;function ENT:ArrivingSoon()self:EmitSound(self.SoundArrivingSoon)end;function ENT:Arrived()self:EmitSound(self.SoundArriving)end;local f=Color(40,39,107)local g=Color(44,101,244)function ENT:Draw(h)self:DrawModel(h)local i=self:GetStationName()local j=self:LocalToWorld(self.NamePosition)local k=self:LocalToWorldAngles(self.NameAngle)if info.Dev then local l=self:LocalToWorld(self.ExitPoint)render.DrawWireframeBox(l,self:GetAngles(),Vector(-10,-10,0),Vector(10,10,10),col.blue,true)end;cam.Start3D2D(j,k,0.1)draw.RoundedBox(24,0,0,700,50,f)draw.RoundedBox(24,5,5,80,40,g)draw.SimpleText(i,'ui_header.l',100,25,col.white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)draw.SimpleText(srp.time.GetTimeStamp(),'ui_header.l',670,25,col.white,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)cam.End3D2D()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_button/shared.lua:
ENT.PrintName='Button'ENT.Category='SUP'ENT.Author='Scott'ENT.Contact='STEAM_0:1:26675200'ENT.Type='anim'ENT.Base='base_anim'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Spawnable=info.Dev;ENT.Model=Model'models/maxofs2d/button_03.mdl'ENT.Pressed=Sound'buttons/lever7.wav'ENT.Released=Sound'buttons/button4.wav'ENT.UIPosition=Vector(-1,4,6)ENT.UIAngle=Angle(0,90,0)function ENT:SetupDataTables()self:NetworkVar('String',0,'Title')self:NetworkVar('Bool',0,'On')self:NetworkVar('Bool',1,'DisplayAll')end;function ENT:Initialize()self:SetModel(self.Model)self.WaitTime=1;self.ResetTime=2;self.NextUse=0 end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_camera/cl_init.lua:
include'shared.lua'
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_capturezone.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_crafting/shared.lua:
DEFINE_BASECLASS'base_anim'ENT.PrintName='RP Crafting'ENT.Author='Scott'ENT.Contact=''ENT.Purpose=''ENT.Instructions=''ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.DoNotDuplicate=true;ENT.Crafting=true;ENT.Model='models/props/swcraftingstation.mdl'ENT.Interactive=true;ENT.LocalSpawnPos=Vector(0,12,38)ENT.AnimationCrafting='craftingactive'ENT.AnimationIdle='idle01'ENT.EffectCrafting=Material'galactic/supcraftingstation/hologram.vmt'ENT.RepairItemID='METAL_REFINED_METAL'ENT.MaxHealth=2000;sound.Add({name='Crafting.Running',channel=CHAN_STATIC,volume=1.0,level=60,pitch={95,110},sound='ambient/machines/spin_loop.wav'})ENT.EngineStart=Sound'ambient/machines/spinup.wav'ENT.EngineStop=Sound'ambient/machines/spindown.wav'ENT.EngineLoop='Crafting.Running'ENT.SoundCompleted=Sound'galactic/craftingcomplete.mp3'function ENT:SetupDataTables()self:NetworkVar('Bool',0,'Activated')self:NetworkVar('Bool',1,'Running')self:NetworkVar('Entity',0,'Crafter')self:NetworkVar('String',0,'Recipe')self:NetworkVar('Int',0,'ItemCount')self:NetworkVarNotify('Recipe',self.OnItemChanged)self:NetworkVarNotify('ItemCount',self.OnItemChanged)end;function ENT:ResetTiming()self.Recipe=nil;self.RecipeTime=nil;self.RecipeEndTime=nil end;function ENT:OnItemChanged(a,b,c)if!CLIENT then return end;if c==''||isnumber(c)&&c<=0 then self:ResetTiming()return end;local d=srp.crafting.Get(isstring(c)&&c||self:GetRecipe())if!d then self:ResetTiming()return end;local e=d.time||5;self.Recipe=d;self.RecipeTime=srp.shop.EventRunning('crafting')&&e/2||e;self.RecipeEndTime=CurTime()+self.RecipeTime end;function ENT:GetCraftingPos()return self:LocalToWorld(self.LocalSpawnPos)end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_crafting_civilian.lua:
AddCSLuaFile()DEFINE_BASECLASS'rp_crafting'ENT.PrintName='RP Jedi Crafting'ENT.Author='Scott'ENT.Contact=''ENT.Purpose=''ENT.Instructions=''ENT.Spawnable=true;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Category='SUP'ENT.Model='models/hunter/blocks/cube4x4x4.mdl'ENT.Interactive=true;ENT.InteractionDistance=30000;ENT.LocalSpawnPos=Vector(0,0,42)ENT.AnimationIdle='saberidle'ENT.AnimationCrafting='sabercreate'function ENT:CanUse(a)return true end;function ENT:Draw()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_easteregg.lua:
AddCSLuaFile()ENT.Base='base_anim'ENT.Type='anim'ENT.Spawnable=info.Dev;ENT.Category='SUP Development'ENT.PrintName='Easter Egg'ENT.Model=Model'models/easteregg/easteregg.mdl'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.DoNotDuplicate=true;ENT.UIPosition=Vector(0,0,0)ENT.UIAngle=Angle(0,0,90)local a=Vector(10,30,15)local b={Color(255,50,50),Color(255,255,50),Color(255,50,255),Color(50,255,255),Color(50,50,255),Color(50,255,50)}function ENT:Initialize()end;function ENT:UpdateTransmitState()return TRANSMIT_PVS end;function ENT:Use(c)if self.Removing||self.InEvent then return end;hook.Run('OnEasterEggClaimed',self,c)self.Removing=true;self:Remove()end;function ENT:StartTouch(c)if self.Touched||!self.InEvent then return end;if!IsValid(c)||!c:IsPlayer()||!c.InEvent then return end;hook.Run('OnEasterEggClaimed',self,c)self.Touched=true;self:Remove()end;function ENT:Think()if CLIENT then local d=self:GetColor()local e=DynamicLight(self:EntIndex())if e then e.pos=self:GetPos()+a;e.r=d.r;e.g=d.g;e.b=d.b;e.brightness=3;e.Decay=1;e.Size=500;e.DieTime=CurTime()+.01 end end end;function ENT:OnRemove()local d=self:GetColor()local f=EffectData()f:SetOrigin(self:GetPos())f:SetNormal(Vector(0,0,1))f:SetScale(10)f:SetStart(Vector(d.r/255,d.g/255,d.b/255))util.Effect('balloon_pop',f)end;ENT.Draw=ENTITY.DrawModel
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_eventplatform/cl_init.lua:
include'shared.lua'function ENT:Initialize()self:SetMaterial(self.Material)self:SetColor(self.Colors[math.random(1,#self.Colors)])end;ENT.Draw=ENTITY.DrawModel
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_fish/cl_init.lua:
include'shared.lua'
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_floatingpumpkin/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_medical.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_hyperspace/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_laserbolt/cl_init.lua:
include'shared.lua'function ENT:Think()local a=DynamicLight(self:EntIndex(),true)if a then a.pos=self:GetPos()a.r=50;a.g=50;a.b=255;a.brightness=5;a.Decay=1;a.Size=1000;a.DieTime=CurTime()+.05 end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_mortar.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='rp_turret'ENT.PrintName='Mortar'ENT.Category='SUP'ENT.Spawnable=true;ENT.DoNotDuplicate=true;ENT.DontFreeze=true;ENT.IsTurret=true;ENT.ModuleModel=false;ENT.Model='models/gredwitch/m1_mortar/m1_mortar_bipod.mdl'ENT.GunModel='models/gredwitch/m1_mortar/m1_mortar.mdl'ENT.HasSeat=true;ENT.SeatOffset=Vector(-10,-40,-40)ENT.SeatOffsetAngle=Angle(0,-90,0)ENT.SeatParent=true;ENT.SeatNoDraw=true;ENT.ViewLocalPlayer=true;ENT.AnimationOverride=ACT_HL2MP_IDLE_CROUCH_KNIFE;ENT.PrimaryAmmoClip=1;ENT.PrimaryAmmoCapacity=1;ENT.PrimaryFireDelay=5;ENT.SecondaryFireDelay=5;ENT.MaxUpPitch=0;ENT.MaxDownPitch=25;ENT.SpawnOffset=Vector(0,0,35)ENT.GunOffset=Vector(0,0,2)ENT.GunAngleOffset=Angle(0,0,0)ENT.ViewOffset=Vector(-75,0,20)ENT.ViewAngleOffset=Angle(0,0,0)ENT.MaxFiringDistance=4500;ENT.TurretFireSound='Mortar.FireClose'ENT.MortarShell='rp_artilleryshell'ENT.IsArtillery=true;ENT.CanImpound=true;sound.Add({name='Mortar.FireClose',sound=Sound'galactic/weapons/mortar/fire.wav',pitch={95,105},channel=CHAN_WEAPON,volume=1,level=100})sound.Add({name='Moratar.Loaded',sound=Sound'galactic/weapons/mortar/loaded.mp3',pitch={95,105},channel=CHAN_WEAPON,volume=1,level=8575})local a=Color(50,255,50,200)local b,c=.05,Color(5,5,5,200)local function d(e,f,g)surface.SetDrawColor(g)draw.NoTexture()surface.DrawPoly({{x=e-14,y=f+14},{x=e-14,y=f-14},{x=e,y=f}})surface.SetDrawColor(255,255,255,255)surface.DrawPoly({{x=e-10,y=f+10},{x=e-10,y=f-10},{x=e,y=f}})end;local function h(e,f,i,j,k,g)draw.Box(e-i+10,f,i+2,44,c)surface.SetDrawColor(g)surface.DrawOutlinedRect(e-i+10,f,i+2,44)draw.DrawText(j,'ui_header.s',e+5,f+2,a,TEXT_ALIGN_RIGHT)draw.DrawText(k,'ui_label.xl',e+5,f+18,a,TEXT_ALIGN_RIGHT)end;local function l(e,f,m,n,o,p,q)surface.SetDrawColor(col.green_dark)surface.DrawRect(e,f,3,m)local r=m*b;local s=m/r-1;for t=1,s do local u=f+t*r;surface.DrawLine(e,u,e+10,u)end;local v=f+m-(1+m*p)d(e-5,v,q)local w=string.GetMetres(n)h(e-40,v-46,100,'Distance',w,q)h(e-40,v+2,100,'Heading',math.Round(o,2),c)end;function ENT:OnInitialize()self:SetUseType(SIMPLE_USE)self:SetTrigger(true)end;function ENT:Use(x)if x:Crouching()then self:DoPrimaryAttack(x)elseif self.Building then srp.build.OpenInteractionMenu(x,self)end end;function ENT:GetFiringDistance(y,z)y=y||self:GetPitchPercent()return math.Round(self.MaxFiringDistance*y,z||2)end;function ENT:GetPitchPercent()local A=self:GetGun():GetLocalAngles().p;local B=math.abs(self.MaxDownPitch-self.MaxUpPitch)return math.Clamp(A/B,0,1)end;function ENT:CalcView(C,D,E,F,G,H)local I=self:LocalToWorld(self.ViewOffset)local J=self:LocalToWorldAngles(self.ViewAngleOffset)return{origin=I,angles=J,fov=100,drawviewer=true}end;function ENT:FireBullet(C)local K=self:GetGun()local L=K:GetForward()local I,M=self:GetShootInfo()local N=EffectData()N:SetEntity(self)N:SetOrigin(I)N:SetStart(M)N:SetNormal(M)N:SetAttachment(0)N:SetScale(1)util.Effect('muzzle_emplacement',N,true,true)local n=self:GetFiringDistance(nil,4)local x=ents.Create(self.MortarShell)x:Setup(self,I,M,n,C)x:Spawn()self:SetClip1(0)self:DoAOEEffect()return true end;function ENT:DoAOEEffect()util.ScreenShake(self:GetPos(),5,50,.5,500)end;function ENT:GetShootInfo()local K=self:GetGun()if IsValid(K)then return K:LocalToWorld(Vector(-1.7,0,50)),K:GetUp()end end;function ENT:StartTouch(x)if self:GetClip1()==1 then return end;if!IsValid(x)||!x.item||!x.item.shellclass then return end;x:Remove()self:EmitSound'Moratar.Loaded'self:SetClip1(1)self:SetNextPrimaryFire(CurTime()+1)self.MortarShell=x.item.shellclass end;local O=function()end;function ENT:Salvage(C,P)if!self.Building then return end;P=P||O;local Q=C:GetGroup()if C!=self:GetPropOwner()&&!(Q&&(Q:HasAttribute('building')||C:HasPermission('nco')))then return end;srp.interaction.Start(C,'Salvaging',col.blue,math.random(5,10),500,function(R,C,S)if!S||!IsValid(self)then return end;P(true)self:Remove()end)end;function ENT:DrawHUD()if!self.UIOverlay then return end;local K=self:GetGun()if!IsValid(K)then return end;local y=self:GetPitchPercent()||0;local n=self:GetFiringDistance(y,1)local g=n<400&&col.red||n<1000&&col.yellow||col.green;l(ScrW()*.35,(ScrH()-400)*.5,400,n,LocalPlayer():GetHeading(),y,g)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_note/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_npc/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_npc_ent/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_pallet/cl_init.lua:
include'shared.lua'function ENT:Draw()self:DrawModel()local a=table.Count(self:GetChildren())if self.MaxBoxes>a then if!IsValid(self.CSVisual)then self.CSVisual=ClientsideModel('models/props/campcratebig.mdl')self.CSVisual:SetModelScale(0.35)self.CSVisual:SetMaterial(self.PalletMaterial)self.CSVisual:Spawn()end;local b=self:LocalToWorld(Vector(0,0,self.PalletHeight+a*self.BoxOffset))local c=render.GetBlend()render.SetBlend(0.01)render.Model({model=self.StorageModel,pos=b,ang=Angle()},self.CSVisual)render.SetBlend(c||1)end end;function ENT:OnRemove()if IsValid(self.CSVisual)then self.CSVisual:Remove()end end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_present.lua:
AddCSLuaFile()DEFINE_BASECLASS'base_anim'ENT.Type='anim'ENT.Category='SUP'ENT.PrintName='Gift Machine'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Spawnable=info.Dev;ENT.Model=Model'models/griim/christmas/present_colourable.mdl'ENT.DoNotDuplicate=true;ENT.Interactive=true;ENT.UIPosition=Vector(0,-11,12)ENT.UIAngle=Angle(0,0,90)ENT.UIScale=.1;ENT.UITitle='Your Gift'ENT.CashRewards={{name='10,000 RC',amount=10000,chance=1},{name='15,000 RC',amount=15000,chance=.2},{name='65,000 RC',amount=65000,chance=.025}}ENT.XPRewards={{name='XP',other={'jediforce','luck'},amount=10000,scalePassive=.5,chance=1},{name='XP',other={'jediforce','luck'},amount=20000,scalePassive=.5,chance=.2},{name='XP',other={'jediforce','luck'},amount=50000,scalePassive=.5,chance=.05}}local a='Claim'local b=Material'materials/galactic/seasonal/christmas/present.png'local c=20;local d='Daily rewards'local e=Angle(0,0,0)local f=Vector(0,3,175)function ENT:GetRandomCosmetic(g)local h=cosmetics.Random(g,true)return h end;function ENT:Initialize()self:SetModel(self.Model)end;function ENT:UpdateTransmitState()return TRANSMIT_ALWAYS end;function ENT:RandomWithChance(i)for j=#i,1,-1 do if math.random()<=i[j].chance then return i[j]end end;return i[1]end;function ENT:GetPrizes(g)local k=self:RandomWithChance(self.CashRewards)local l=self:RandomWithChance(self.XPRewards)local m=self:GetRandomCosmetic(g)local n=k.amount;if m then cosmetics.Give(g,m.name)else n=n+5000 end;local o=l.amount;local p='Battalion'local q;if math.random()>0.7 then q=l.other[math.random(1,#l.other)]o=o*(l.scalePassive||1)p=srp.talents.Get(q).name end;g:AddMoney(n,true)g:AddTalentXP(o,q,nil,true)net.Start'srp.seasonal.presents'net.WriteString(k.name)net.WriteString(string.Comma(o)..' '..p..' XP')if m then net.WriteBool(true)net.WriteCosmetic(m.id)else net.WriteBool(false)end;net.Send(g)end;function ENT:Use(r,g)if!IsValid(g)||!g:IsPlayer()then return end;local s=g:SteamID64()if self.Waiting[s]then return end;local t='presents:'..s;self.Waiting[s]=true;local u=g:HasUpgrade('newyear22_bundle')&&43200||86400;srp.Redis:Get(t,function(v,w)if!IsValid(g)then self.Waiting[s]=nil;return end;if!w then srp.Redis:SetEx(t,u,os.time()+u)self:GetPrizes(g)else local w=string.NiceTime((tonumber(w)||0)-os.time())srp.notif.Warning(g,5,term.Get('PrizeAlreadyClaimed'),w)end;self.Waiting[s]=nil end)end;function ENT:DrawInteraction(x)surface.SetFont('ui_label_inventory.itemheader')surface.SetDrawColor(255,255,255,255)surface.SetTextColor(255,255,255,255)local y,z=surface.GetTextSize(a)y=y+c+4;local A,B=(ScrW()-c)/2,(ScrH()-(c+20))/2;surface.SetMaterial(x.OnPickup)surface.DrawTexturedRect(A,B,c,c)surface.DrawTexturedRect(A,B,c,c)surface.SetTextPos(A+c+2,B)surface.DrawText(a)surface.SetMaterial(b)surface.DrawTexturedRect(A,ScrH()/2-50,c,c)surface.SetTextPos(A+c+2,B-30)surface.DrawText(d)end;function ENT:SetAvailable(C)self.Active=C;if C then self:AddActiveEffects()else self:RemoveActiveEffects()end end;function ENT:AddActiveEffects()self:RemoveActiveEffects()local D=ents.CreateClientProp'models/effects/vol_light64x256.mdl'D:SetMoveType(MOVETYPE_NONE)D:SetPos((self.Origin||self:GetPos())+f)D:SetAngles(e)D:SetModelScale(0.65,0)D:SetRenderMode(RENDERMODE_TRANSADDFRAMEBLEND)D:Spawn()self.LightVolume=D end;function ENT:RemoveActiveEffects()if IsValid(self.LightVolume)then self.LightVolume:Remove()end end;local E=Angle()function ENT:Draw()self:DrawModel()self.Origin=self.Origin||self:GetPos()self.OriginAngle=self.OriginAngle||self:GetAngles()if self.Active then self:SetRenderOrigin(self.Origin+Vector(0,0,4+math.sin(CurTime()*1)*4))local E=self:GetAngles()E:RotateAroundAxis(Vector(0,0,1),RealFrameTime()/1*10)self:SetRenderAngles(E)else self:SetRenderOrigin(self.Origin)self:SetRenderAngles(self.OriginAngle)end;self.RainbowID=(self.RainbowID||0)+RealFrameTime()/.5;self:SetColor(HSVToColor(360%self.RainbowID,.5,1))end;function ENT:OnRemove()self:RemoveActiveEffects()end;if CLIENT then net('srp.seasonal.presents',function()local i={net.ReadString(),net.ReadString()}if net.ReadBool()then table.insert(i,net.ReadCosmetic(true))else table.insert(i,'5,000 RC')end;srp.ui.Create('srp_present',function(F)F:Populate(i)F:MakePopup()end)if IsValid(ents.FindByClass('rp_present')[1])then ents.FindByClass('rp_present')[1]:SetAvailable(false)end end)end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_roominfo_armoury.lua:
AddCSLuaFile()ENT.Base='rp_roominfo'ENT.Type='anim'ENT.Category='SUP'ENT.PrintName='Room Info Armoury'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Spawnable=info.Dev;ENT.Model=Model'models/lt_c/holo_wall_unit.mdl'ENT.ClaimableBoard=true;ENT.DoNotDuplicate=true;ENT.NetworkPlayerUse=true;ENT.RequiredPermission='train'function ENT:GetTypes()return{{Name='UNCLAIMED',Color=col.grey_dark},{Name='EOD Training',Color=col.red}}end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_routebeacon/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_routebeacon/shared.lua:
ENT.PrintName='Patrol Point'ENT.Author='Scott'ENT.Contact='STEAM_0:1:26675200'ENT.Type='anim'ENT.Base='base_anim'ENT.Model=Model'models/hunter/blocks/cube3x3x05.mdl'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Spawnable=info.Dev;ENT.DoNotDuplicate=true;ENT.DontFreeze=true;ENT.DontSit=true;function ENT:SetupDataTables()self:NetworkVar('Int',0,'GroupID')end;function ENT:Initialize()self:SetModel(self.Model)if SERVER then else self:SetRenderBounds(Vector(-500,-500,0),Vector(500,500,500))end end;function ENT:UpdateTransmitState()return TRANSMIT_ALWAYS end;function ENT:InGroup(a)local b=a:GetGroup()if!b then return end;if CLIENT then local c=srp.groups.Get(self:GetGroupID(),true)if c:IsConnected(b)then return true end else if self.group:IsConnected(b)then return true end end end
--addons/!lpakr_out/lua/entities/rp_satchel/cl_init.lua:
include'shared.lua'include'cl_frequenceui.lua'function ENT:Initialize()self:SetSolid(SOLID_BBOX)self:SetCollisionBounds(self.Min,self.Max)end;function ENT:Think()local a=LocalPlayer()local b=self:GetPos()local c=self:GetPos():Distance(a:GetPos())if IsValid(self.FrequencyPanel)&&c>300 then self.FrequencyPanel:Remove()return end;if!IsValid(self.FrequencyPanel)&&c<=300&&a:HasWeapon('sup_remotesatchel')then srp.ui.Create('srp_satchel_frequencies',function(d)d:Populate(self)self.FrequencyPanel=d end)end end
--addons/!lpakr_out/lua/entities/rp_satchel/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_scrapmachine/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_shielddome/cl_init.lua:
include'shared.lua'local a=col.blue:Copy()a.a=25;local b=CreateMaterial('NadeShieldGlow15','VertexLitGeneric',{['$basetexture']='galactic/supcraftingstation/holog1',['$detail']='galactic/supcraftingstation/holog1',['$nocull']='1',['$selfillum']='1',['$translucent']='1',['$additive']='1',['$vertexcolor']='1',['$vertexalpha']='1',['$opacity']='0.5',['Proxies']={['AnimatedTexture']={['animatedtexturevar']='$basetexture',['animatedtextureframenumvar']="$frame",['animatedtextureframerate']=60},['TextureScroll']={['texturescrollvar']='$detailTextureTransform',['texturescrollrate']=.2,['texturescrollangle']=-90},['TextureScroll']={['texturescrollvar']='$detailTextureTransform',['texturescrollrate']=.1,['texturescrollangle']=-90}}})function ENT:Initialize()self.duration=.5;self.start=CurTime()self.DisplayColor=col.blue_light;self.ran=true;local c=self:GetPos()local d=EffectData()d:SetStart(c)d:SetOrigin(c)d:SetNormal(self:GetUp())d:SetScale(500)d:SetMagnitude(5)util.Effect('ThumperDust',d,true,true)timer.Simple(self.duration/2,function()if IsValid(self)then self:EmitSound('weapons/underwater_explode3.wav',75,100,1,CHAN_AUTO)end end)self:SetCustomCollisionCheck(true)end;function ENT:Think()if!self.ran then self:Initialize()self.Think=function()end end end;function ENT:Draw()local e=self:GetHP()/self.MaxHealth;self.DisplayColor=e>0.8&&col.blue_light||e>0.5&&col.blue||e>.2&&col.orange||col.red;self:DrawBeamLine()self:DrawShieldsModel()end;function ENT:DrawBeamLine()local c=self:GetPos()local f=self:GetUp()render.SetMaterial(self.BeamMaterial)render.DrawBeam(c+f*10,c+f*180,25,math.cos(RealTime()),math.tan(RealTime()),col.blue_light)local g=EffectData()g:SetNormal(f)g:SetOrigin(c+f*180)g:SetScale(50)util.Effect('AR2Impact',g)end;function ENT:DrawShieldsModel()if!self.start then return end;local h=self:GetUp()local i,j=self:OBBMins(),self:OBBMaxs()local k=math.Clamp((CurTime()-self.start)/(self.duration||0),0,1)local c=self:LocalToWorld(Vector(0,0,math.abs(i.z)+(j.z>0&&j.z||self.offset)+5)*(1-k))local l=h:Dot(c)local m=render.EnableClipping(true)render.PushCustomClipPlane(h,l)self:DrawModel()render.ModelMaterialOverride(b)self:DrawModel()render.ModelMaterialOverride()render.PopCustomClipPlane()render.EnableClipping(m)local n=DynamicLight(self:EntIndex())if n then n.pos=self:GetPos()+Vector(0,0,50)n.r=self.DisplayColor.r;n.g=self.DisplayColor.g;n.b=self.DisplayColor.b;n.brightness=1*k;n.Decay=2;n.Size=500;n.DieTime=CurTime()+1 end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_tradingterminal.lua:
AddCSLuaFile()ENT.PrintName='Trading Terminal'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Spawnable=info.Dev;ENT.AdminOnly=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Category='SUP'ENT.Type='anim'ENT.Base='base_srp'ENT.NetworkPlayerUse=true;ENT.DontSit=true;ENT.DontFreeze=true;local a=20;local b=Material('galactic/ui/store_anim.vtf','smooth nomip')ENT.Model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/props/vendor/vendor_bank.mdl'ENT.UIPosition=Vector(-14,0,100)ENT.UIAngle=Angle(0,90,90)ENT.Interactive=true;ENT.InteractionName='Start Trading'function ENT:Initialize()self:SetModel(self.Model)end;function ENT:ClientPlayerUse(c)srp.trading.OpenMenu(c)end;function ENT:Draw()self:DrawModel()cam.Start3D2D(self:LocalToWorld(self.UIPosition),self:LocalToWorldAngles(self.UIAngle),.1)surface.SetMaterial(b)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(-128,-180,256,256)draw.DrawText('Trading Terminal','ui_header.l',0,80,col.yellow,TEXT_ALIGN_CENTER)cam.End3D2D()end;function ENT:DrawInteraction(d,e,f)if self:GetNoDraw()then return end;surface.SetFont'ui_header.s'surface.SetDrawColor(255,255,255,255)surface.SetMaterial(d.OnPickup)surface.SetTextColor(255,255,255,255)local g=self.InteractionName||''local h,i=surface.GetTextSize(g)h=h+a+4;local j,k=f.x,f.y;surface.DrawTexturedRect(j,k,a,a)surface.SetTextPos(j+a+2,k-2)surface.DrawText(g)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_trainingpoint.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_turret/shared.lua:
ENT.Type='anim'ENT.Base='base_anim'ENT.PrintName='Turret'ENT.Category='SUP'ENT.Author='Scott'ENT.Contact=''ENT.Purpose=''ENT.Instructions=''ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.DoNotDuplicate=true;ENT.DontFreeze=true;ENT.CanImpound=true;ENT.IsTurret=true;ENT.IsGimbal=true;ENT.AnalogueMove=true;ENT.Model=Model'models/kingpommes/starwars/venator/turbolaser_base.mdl'ENT.GunModel=Model'models/kingpommes/starwars/venator/turbolaser_barrel.mdl'ENT.ModuleModel=Model'models/props/wallpanel1.mdl'ENT.MaxUpPitch=-80;ENT.MaxDownPitch=10;ENT.CanDamage=true;ENT.MaxHealth=3000;ENT.Barrels={1,3}ENT.PitchSpeed=5;ENT.YawSpeed=5;ENT.GunPitchAxis='p'ENT.ViewLocalPlayer=false;ENT.ViewOffset=Vector(120,0,0)ENT.ViewAngleOffset=Angle()ENT.SeatOffset=Vector(-300,0,5)ENT.SeatOffsetAngle=Angle(0,-90,0)ENT.PrimaryFireDelay=.5;ENT.PrimaryAmmoClip=10;ENT.PrimaryAmmoCapacity=-1;ENT.SecondaryFireDelay=.4;ENT.SecondaryAmmoClip=10;ENT.SecondaryAmmoCapacity=-1;ENT.TurnXSound='Turret.MoveX'ENT.TurnYSound='Turret.MoveY'ENT.TurretFireSound='Turret.Fire'ENT.TurnStopSound='Turret.Stop'ENT.UIOverlay=true;ENT.UIScale=.25;ENT.UIDrawColor=Color(220,220,220,255)ENT.UIBarColor=Color(10,10,10,255)ENT.UIPosition=Vector(-223,0,211)ENT.UIAngle=Angle(0,-90,00)ENT.UIAmmoBoxColor=Color(0,0,0,225)ENT.CanOverheat=true;ENT.MaxOverheatTime=5;ENT.TurretType=TURRET_CONTROL_SIMULATED;ENT.TurretTypes={[TURRET_CONTROL_SIMULATED]={SetupMove='SetupMove'},[TURRET_CONTROL_STANDING]={SetupMove='StandingSetupMove'}}sound.Add({name='Turret.Stop',channel=CHAN_STATIC,volume=.2,level=50,pitch=60,sound=Sound('plats/crane/vertical_stop.wav'),loop=false})sound.Add({name='Turret.MoveX',channel=CHAN_STATIC,volume=.2,level=50,pitch=60,sound=Sound('plats/heavymove1.wav'),loop=true})sound.Add({name='Turret.MoveY',channel=CHAN_STATIC,volume=.5,level=50,pitch=60,sound=Sound('npc/turret_wall/turret_loop1.wav'),loop=true})sound.Add({name='Turret.Fire',channel=CHAN_ITEM,volume=1,level=150,pitch={40,43},sound=Sound('weapons/DC15S_fire.wav')})function ENT:SetupDataTables()self:NetworkVar('Int',0,'HP')self:NetworkVar('Int',1,'Clip1')self:NetworkVar('Int',2,'Clip2')self:NetworkVar('Float',0,'OverheatTime')self:NetworkVar('Entity',0,'Module')end;function ENT:GetGun()return self.gun end;function ENT:HasPrimaryAmmo()return self:GetClip1()>0 end;function ENT:HasSecondaryAmmo()return self:GetClip2()>0 end;function ENT:TakePrimaryAmmo(a)self:SetClip1(math.max(self:GetClip1()-a,0))end;function ENT:TakeSecondaryAmmo(a)self:SetClip2(math.max(self:GetClip1()-a,0))end;function ENT:SetNextPrimaryFire(b)self.nextprimary=b end;function ENT:SetNextSecondaryFire(b)self.nextsecondary=b end;function ENT:CanPrimaryAttack()return(self.nextprimary==nil||CurTime()>self.nextprimary)&&(self:HasPrimaryAmmo()||self.PrimaryAmmoCapacity==-1)end;function ENT:CanSecondaryAttack()return(self.nextsecondary==nil||CurTime()>self.nextsecondary)&&(self:HasSecondaryAmmo()||self.SecondaryAmmoCapacity==-1)end;function ENT:IsOverheating()if!self.CanOverheat then return false else return self:GetOverheatTime()>0 end end;function ENT:GetOverheatPercent()if!self.CanOverheat then return 0 else return math.Min(self:GetOverheatTime(),self.MaxOverheatTime)/self.MaxOverheatTime end end;function PLAYER:GetTurret()return self.turret end;function PLAYER:SetTurret(c)self.turret=c end;hook('HandlePlayerDrivingAnimation','srp.Turret',function(d,e)local f=d:GetTurret()if IsValid(f)&&f.AnimationOverride then d:SetPos(d:GetVehicle():GetPos())return ACT_STAND,d:LookupSequence('idle_dual')end end)
--addons/!lpakr_out/lua/entities/sent_deployableballoons.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/sent_deployableballoons.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Balloon Deployer"ENT.Author="LuaPinapple"ENT.Contact="evilpineapple@cox.net"ENT.Purpose="It Deploys Balloons."ENT.Instructions="Use wire."ENT.Category="Wiremod"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.WireDebugName="Balloon Deployer"cleanup.Register("wire_deployers")if CLIENT then language.Add("Cleanup_wire_deployers","Balloon Deployers")language.Add("Cleaned_wire_deployers","Cleaned up Balloon Deployers")language.Add("SBoxLimit_wire_deployers","You have hit the Balloon Deployers limit!")return end;local a="cable/rope"local b={Model("models/MaxOfS2D/balloon_classic.mdl"),Model("models/balloons/balloon_classicheart.mdl"),Model("models/balloons/balloon_dog.mdl"),Model("models/balloons/balloon_star.mdl")}CreateConVar("sbox_maxwire_deployers",2)local c;local function d()if IsValid(c)then return end;c=ents.Create("filter_activator_name")c:SetKeyValue("targetname","DmgFilter")c:SetKeyValue("negated","1")c:Spawn()end;hook.Add("InitPostEntity","CreateDamageFilter",d)local function e(pl,f)if IsValid(pl)&&!pl:CheckLimit("wire_deployers")then return nil end;if f.Model&&!WireLib.CanModel(pl,f.Model,f.Skin)then return false end;local g=ents.Create("sent_deployableballoons")if!g:IsValid()then return end;duplicator.DoGeneric(g,f)g:SetPlayer(pl)g:Spawn()g:Activate()duplicator.DoGenericPhysics(g,pl,f)if IsValid(pl)then pl:AddCount("wire_deployers",g)pl:AddCleanup("wire_deployers",g)end;return g end;duplicator.RegisterEntityClass("sent_deployableballoons",e,"Data")scripted_ents.Alias("gmod_iballoon","gmod_balloon")WireLib.AddInputAlias("Lenght","Length")function ENT:SpawnFunction(h,i)if!i.Hit then return end;local j=i.HitPos+i.HitNormal*16;local g=e(h,{Pos=j})return g end;function ENT:Initialize()self:SetModel("models/props_junk/PropaneCanister001a.mdl")self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Deployed=0;self.Balloon=nil;self.Constraints={}self.force=500;self.weld=false;self.popable=true;self.rl=64;if WireAddon then self.Inputs=Wire_CreateInputs(self,{"Force","Length","Weld?","Popable?","BalloonType","Deploy"})self.Outputs=WireLib.CreateSpecialOutputs(self,{"Deployed","BalloonEntity"},{"NORMAL","ENTITY"})Wire_TriggerOutput(self,"Deployed",self.Deployed)end;local k=self:GetPhysicsObject()if k:IsValid()then k:SetMass(250)k:Wake()end;self:UpdateOverlay()end;function ENT:TriggerInput(l,m)if l=="Deploy"then if m!=0 then if self.Deployed==0&&(self.nextDeploy||0)<CurTime()then self.nextDeploy=CurTime()+0.5;self:DeployBalloons()self.Deployed=1 end;Wire_TriggerOutput(self,"Deployed",self.Deployed)else if self.Deployed!=0 then self:RetractBalloons()self.Deployed=0 end;Wire_TriggerOutput(self,"Deployed",self.Deployed)end elseif l=="Force"then self.force=math.Clamp(m,-1000000,1000000)if self.Deployed!=0 then self.Balloon:SetForce(m)end elseif l=="Length"then self.rl=m elseif l=="Weld?"then self.weld=m!=0 elseif l=="Popable?"then self.popable=m!=0;self:UpdatePopable()elseif l=="BalloonType"then self.balloonType=m+1 end;self:UpdateOverlay()end;local n={}hook.Add("EntityRemoved","balloon_deployer",function(g)local o=n[g]if IsValid(o)&&o.TriggerInput then o.Deployed=0;o:TriggerInput("Deploy",0)end end)function ENT:UpdatePopable()local p=self.Balloon;if p!=nil&&p:IsValid()then if!self.popable then p:Fire("setdamagefilter","DmgFilter",0)else p:Fire("setdamagefilter","",0)end end end;function ENT:DeployBalloons()local p=ents.Create("gmod_balloon")local q=b[self.balloonType]if q==nil then q=b[1]end;p:SetModel(q)p:Spawn()p:SetColor(Color(math.random(0,255),math.random(0,255),math.random(0,255),255))p:SetForce(self.force)p:SetMaterial("models/balloon/balloon")p:SetPlayer(self:GetPlayer())duplicator.DoGeneric(p,{Pos=self:GetPos()+self:GetUp()*25})duplicator.DoGenericPhysics(p,pl,{Pos=Pos})local r=p:GetPos()local s=self;local t=self:LocalToWorld(Vector(0,0,self:OBBMaxs().z))local u=(t-r):GetNormalized()*250;local v=util.QuickTrace(p:GetPos(),u,p)if constraint.CanConstrain(v.Entity,v.PhysicsBone)then local k=v.Entity:GetPhysicsObjectNum(v.PhysicsBone)if IsValid(k)then s=v.Entity;t=v.HitPos end end;if self.weld then local constraint=constraint.Weld(p,s,0,v.PhysicsBone,0)p:DeleteOnRemove(constraint)else r=p:WorldToLocal(r)t=s:WorldToLocal(t)local constraint,w=constraint.Rope(p,s,0,v.PhysicsBone,r,t,0,self.rl,0,1.5,a,false)if constraint then p:DeleteOnRemove(constraint)p:DeleteOnRemove(w)end end;self:DeleteOnRemove(p)self.Balloon=p;self:UpdatePopable()n[p]=self;Wire_TriggerOutput(self,"BalloonEntity",self.Balloon)end;function ENT:OnRemove()if self.Balloon then n[self.Balloon]=nil end;Wire_Remove(self)end;function ENT:RetractBalloons()if self.Balloon:IsValid()then local x=self.Balloon:GetColor()local y=EffectData()y:SetOrigin(self.Balloon:GetPos())y:SetStart(Vector(x.r,x.g,x.b))util.Effect("balloon_pop",y)self.Balloon:Remove()else self.Balloon=nil end end;function ENT:UpdateOverlay()self:SetOverlayText("Deployed = "..(self.Deployed!=0&&"yes"||"no"))end
--addons/!lpakr_out/lua/entities/sup_areatrigger/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/sup_usetrigger/shared.lua:
ENT.Base='sup_areatrigger'ENT.PrintName='Use Trigger'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Editable=false;ENT.Spawnable=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.IsAreaTrigger=true;ENT.UIPosition=Vector(0,0,10)function ENT:SetupDataTables()self:NetworkVar('String',0,'ActionID')self:NetworkVar('String',1,'DisplayName')self:NetworkVar('Entity',0,'GMOwner')end
--addons/!lpakr_out/lua/entities/witcher_gateway/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/anzati_swtor4/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/cwbase_laser_red.lua:
TRACER_FLAG_USEATTACHMENT=0x0002;SOUND_FROM_WORLD=0;CHAN_STATIC=6;local a='models/mechanics/robotics/a3.mdl'local b=CreateMaterial('blaster_mat','VertexLitGeneric',{['$basetexture']='color/red',['$model']=1,['$color']='255 0 255',['$color2']='255 0 255',['$glow']=1})EFFECT.Speed=20000;EFFECT.Length=25;EFFECT.UseModel=false;local c=Vector()local d=Material'effects/sw_laser_red_main'local e=Material'effects/sw_laser_red_front'function EFFECT:CreateBolt(f,g)local bolt=ClientsideModel(a,RENDERGROUP_BOTH)if IsValid(bolt)then bolt:SetModel(a)bolt:SetPos(f||Vector())bolt:SetAngles(g||Angle())bolt:SetModelScale(.25)bolt:SetNoDraw(true)bolt:SetMaterial('!blaster_mat')return bolt end end;function EFFECT:GetTracerOrigin(h)local i=h:GetStart()local j=h:GetEntity()if!IsValid(j)||j:IsDormant()then return c end;local k=j:GetOwner()if!IsValid(k)||k:IsDormant()then return c end;if bit.band(h:GetFlags(),TRACER_FLAG_USEATTACHMENT)==TRACER_FLAG_USEATTACHMENT then local l=LocalPlayer()if j:IsWeapon()&&(j.IsCarriedByLocalPlayer&&j:IsCarriedByLocalPlayer())&&!l:ShouldDrawLocalPlayer()&&MuzzlePosition then self.LocalPlayer=true;local f=j.Akimbo&&(j.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition;return f+j:GetForward()*1 else local m=j.Akimbo&&(j.AkimboLeftFire&&1||2)||h:GetAttachment()local n=j:GetAttachment(m)||{Pos=j:GetPos()}if n then return n.Pos else return i end end end;self.DeleteMe=true;return i end;function EFFECT:Init(h)self.StartPos=self:GetTracerOrigin(h)self.EndPos=h:GetOrigin()self.MinimalMode=cvar.GetValue('srp_minimal')if!self.StartPos||self.StartPos==c then self.DeleteMe=true;return end;if self.UseModel then self.bolt=self:CreateBolt(self.StartPos)end;local o=self.EndPos-self.StartPos;self.Normal=o:GetNormal()self.StartTime=0;self.LifeTime=(o:Length()+self.Length)/self.Speed end;function EFFECT:Think()if!self.StartPos||!self.LifeTime||!self.StartTime then return false end;self.LifeTime=self.LifeTime-FrameTime()self.StartTime=self.StartTime+FrameTime()if self.DeleteMe||self.LifeTime<=0&&IsValid(bolt)then bolt:Remove()end;return!(self.DeleteMe||self.LifeTime<0)end;function EFFECT:Render()if!self.StartPos||!self.Speed||!self.StartTime then self.DeleteMe=true;return end;local p=math.max(0,self.Speed*self.StartTime)local q=math.max(0,p-self.Length)local r=self.StartPos+self.Normal*q;local s=self.StartPos+self.Normal*(math.random(5,10)+p)if!IsValid(self.bolt)then render.SetMaterial(e)render.DrawSprite(s,20,20,col.red_light)render.SetMaterial(d)render.DrawBeam(r,s,20,0,1,col.red_light)else self.bolt:SetPos(s)self.bolt:SetAngles(self.Normal:Angle())self.bolt:DrawModel()end;if srp.nvg.IsEnabled()then return end;if!self.MinimalMode then self.dlight=DynamicLight(self:EntIndex())if self.dlight then self.dlight.pos=s;self.dlight.r=255;self.dlight.g=10;self.dlight.b=10;self.dlight.brightness=2;self.dlight.Decay=2000;self.dlight.Size=600;self.dlight.DieTime=CurTime()+.1 end end end
--addons/ssrp_lfs/lua/effects/lfs_laser_purple.lua:
--DO NOT EDIT OR REUPLOAD THIS FILE

EFFECT.Mat = Material( "effects/spark" )
EFFECT.Mat2 = Material( "sprites/light_glow02_add" )

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

	self.StartPos = data:GetStart()
	self.EndPos = data:GetOrigin()
	
	self.Dir = self.EndPos - self.StartPos

	self:SetRenderBoundsWS( self.StartPos, self.EndPos )

	self.TracerTime = math.min( 1, self.StartPos:Distance( self.EndPos ) / 15000 ) * 0.5
	self.Length = math.Rand( 0.4, 0.45 )

	-- Die when it reaches its target
	self.DieTime = CurTime() + self.TracerTime
	
	local Dir = self.Dir:GetNormalized()
	
	local emitter = ParticleEmitter( self.StartPos, false )
	
	for i = 0, 12 do
		local Pos = self.StartPos + Dir * i * 0.7 * math.random(1,2) * 0.5
		
		local particle = emitter:Add( "effects/muzzleflash2", Pos )
		local Size = 2
		
		if particle then
			particle:SetVelocity( Dir * 800 )
			particle:SetDieTime( 0.05 )
			particle:SetStartAlpha( 255 * Size )
			particle:SetStartSize( math.max( math.random(10,24) - i * 0.5,0.1 ) * Size )
			particle:SetEndSize( 0 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetColor( 255,0,255 )
			particle:SetCollide( false )
		end
		
		
	end
	
	for i = 0,20 do
		local particle = emitter:Add( Materials[math.random(1,table.Count( Materials ))],self.StartPos )
		
		local rCol = 255
		
		if particle then
			particle:SetVelocity( Dir * math.Rand(1000,3000) + VectorRand() * math.Rand(0,10) )
			particle:SetDieTime( math.Rand(0.05,0.2) )
			particle:SetAirResistance( math.Rand(50,100) ) 
			particle:SetStartAlpha( 20 )
			particle:SetStartSize( 2 )
			particle:SetEndSize( math.Rand(5,10) )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( rCol,rCol,rCol )
			particle:SetGravity( VectorRand() * 200 + Vector(0,0,200) )
			particle:SetCollide( false )
		end
	end
	
	emitter:Finish()
	
end

function EFFECT:Think()

	if CurTime() > self.DieTime then
		return false
	end

	return true

end

function EFFECT:Render()

	local fDelta = ( self.DieTime - CurTime() ) / self.TracerTime
	fDelta = math.Clamp( fDelta, 0, 1 ) ^ 2 -- lasers are faster than bullets...

	local sinWave = math.sin( fDelta * math.pi )
	
	local Pos1 = self.EndPos - self.Dir * ( fDelta - sinWave * self.Length )
	
	render.SetMaterial( self.Mat )
	render.DrawBeam( Pos1,
		self.EndPos - self.Dir * ( fDelta + sinWave * self.Length ),
		45, 1, 0, Color(255,0,255,255) )
		
	render.DrawBeam( Pos1,
		self.EndPos - self.Dir * ( fDelta + sinWave * self.Length ),
		15, 1, 0, Color(255,255,255,255) )
		
	--render.SetMaterial( self.Mat2 ) 
	--render.DrawSprite( Pos1, 80, 80, Color(0,255,0,255) ) 
end
--addons/ssrp_lfs/lua/effects/lvs_laser_charge.lua:

EFFECT.HeatWaveMat = Material( "particle/warp1_warp" )
EFFECT.GlowMat = Material( "sprites/light_glow02_add" )

function EFFECT:Init( data )
	self.Ent = data:GetEntity()
	self.ID = data:GetAttachment()

	if not IsValid( self.Ent ) then return end

	
	local att = self.Ent:GetAttachment( self.ID )

	if not att then return end

	local Pos = att.Pos

	self.LifeTime = 0.35
	self.DieTime = CurTime() + self.LifeTime

	self.Emitter = ParticleEmitter( Pos, false )
	self.Particles = {}
end

function EFFECT:Think()
	if (self.DieTime or 0) < CurTime() or not IsValid( self.Ent ) then 
		if IsValid( self.Emitter ) then
			self.Emitter:Finish()
		end

		return false
	end

	self:DoSpark()

	return true
end

function EFFECT:DoSpark()
	local T = CurTime()

	if (self._Next or 0) > T then return end

	self._Next = T + 0.01

	if not IsValid( self.Emitter ) then return end

	if not IsValid( self.Ent ) or not self.ID then return end

	local att = self.Ent:GetAttachment( self.ID )

	if not att then return end

	local Pos = att.Pos
	local Dir = VectorRand() * 25

	for id, particle in pairs( self.Particles ) do
		if not particle then
			self.Particles[ id ] = nil

			continue
		end

		particle:SetGravity( (Pos - particle:GetPos()) * 50 )
	end

	local particle = self.Emitter:Add( "sprites/rico1", Pos + Dir )

	if not particle then return end

	particle:SetDieTime( 0.25 )
	particle:SetStartAlpha( 255 )
	particle:SetEndAlpha( 0 )
	particle:SetStartSize( math.Rand( 1, 5 ) )
	particle:SetEndSize( 0 )
	particle:SetColor( 255, 0, 0 )
	particle:SetAirResistance( 0 )
	particle:SetRoll( math.Rand(-10,10) )
	particle:SetRollDelta( math.Rand(-10,10) )

	table.insert( self.Particles, particle )
end

function EFFECT:Render()
	if not IsValid( self.Ent ) or not self.ID then return end

	local att = self.Ent:GetAttachment( self.ID )

	if not att then return end

	local Scale = (self.DieTime - CurTime()) / self.LifeTime

	if Scale <= 0 then return end

	local rnd = VectorRand() * math.Rand(0,0.5)

	render.SetMaterial( self.HeatWaveMat )
	render.DrawSprite( att.Pos, 30 *(1 - Scale), 30 * (1 - Scale), Color( 255, 255, 255, 255) )

	render.SetMaterial( self.GlowMat ) 
	render.DrawSprite( att.Pos + rnd, 120 *  (1 - Scale), 120 * (1 - Scale), Color(255,0,0,255) ) 
end
	

--addons/ssrp_lfs/lua/effects/lvs_muzzle_colorable.lua:

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

--addons/ssrp_lfs/lua/effects/lvs_proton_explosion.lua:
local blue = Color( 0, 127, 255, 255)
local white = Color( 255, 255, 255, 255 )

local GlowMat = Material( "sprites/light_glow02_add" )
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
	self.Pos = data:GetOrigin()

	self.LifeTime = 0.4
	self.DieTime = CurTime() + self.LifeTime

	local emitter = ParticleEmitter( self.Pos, false )

	if not IsValid( emitter ) then return end

	for i = 0,30 do
		local particle = emitter:Add(  Materials[ math.random(1, #Materials ) ], self.Pos )

		if particle then
			particle:SetVelocity( VectorRand(-1,1) * 800 )
			particle:SetDieTime( math.Rand(4,6) )
			particle:SetAirResistance( math.Rand(200,600) )
			particle:SetStartAlpha( 100 )
			particle:SetStartSize( math.Rand(30,60) )
			particle:SetEndSize( math.Rand(100,150) )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 50,50,50 )
			particle:SetGravity( Vector( 0, 0, 100 ) )
			particle:SetCollide( false )
		end
	end

	for i = 0, 20 do
		local particle = emitter:Add( "sprites/light_glow02_add", self.Pos )

		local vel = VectorRand() * 400

		if particle then
			particle:SetVelocity( vel )
			particle:SetAngles( vel:Angle() + Angle(0,90,0) )
			particle:SetDieTime( math.Rand(0.4,0.8) )
			particle:SetStartAlpha( 255 )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( math.Rand(24,48) )
			particle:SetEndSize( 0 )
			particle:SetRoll( math.Rand(-100,100) )
			particle:SetRollDelta( math.Rand(-100,100) )
			particle:SetColor( 0,127,255 )
			particle:SetGravity( Vector(0,0,-600) )

			particle:SetAirResistance( 0 )

			particle:SetCollide( true )
			particle:SetBounce( 0.5 )
		end
	end

	for i = 0, 40 do
		local particle = emitter:Add( "sprites/flamelet"..math.random(1,5), self.Pos )

		if particle then
			particle:SetVelocity( VectorRand(-1,1) * 500 )
			particle:SetDieTime( 0.14 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 10 )
			particle:SetEndSize( math.Rand(30,60) )
			particle:SetEndAlpha( 100 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetColor( 200,150,150 )
			particle:SetCollide( false )
		end
	end

	emitter:Finish()

	local Pos = self.Pos
	local ply = LocalPlayer():GetViewEntity()
	if IsValid( ply ) then
		local delay = (Pos - ply:GetPos()):Length() / 13503.9
		if delay <= 0.11 then
			sound.Play( "ambient/explosions/explode_9.wav", Pos, 85, 100, 1 - delay * 8 )
		end

		timer.Simple( delay, function()
			sound.Play( "LVS.MISSILE_EXPLOSION", Pos )
		end )
	else
		sound.Play( "LVS.MISSILE_EXPLOSION", Pos )
	end
end

function EFFECT:Think()
	if self.DieTime < CurTime() then return false end

	return true
end

function EFFECT:Render()
	local Scale = (self.DieTime - CurTime()) / self.LifeTime
	render.SetMaterial( GlowMat )
	render.DrawSprite( self.Pos, 400 * Scale, 400 * Scale, blue )
	render.DrawSprite( self.Pos, 100 * Scale, 100 * Scale, white )
end

--addons/!lpakr_out/lua/effects/nrg_tracer_drr.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/fxbase.lua:
AddCSLuaFile()if CLIENT then TRACER_FLAG_USEATTACHMENT=0x0002 end;EFFECT.Speed=6500;EFFECT.Length=64;function EFFECT:GetTracerOrigin(a)if CLIENT then local b=a:GetStart()if bit.band(a:GetFlags(),TRACER_FLAG_USEATTACHMENT)==TRACER_FLAG_USEATTACHMENT then local c=a:GetEntity()if!IsValid(c)then return b end;if!game.SinglePlayer()&&c:IsEFlagSet(EFL_DORMANT)then return b end;if c:IsWeapon()&&c:IsCarriedByLocalPlayer()then local d=c:GetOwner()if IsValid(d)then local e=d:GetViewModel()if IsValid(e)&&!LocalPlayer():ShouldDrawLocalPlayer()then c=e else if c.WorldModel then c:SetModel(c.WorldModel)end end end end;local f=c:GetAttachment(a:GetAttachment())if f then b=f.Pos end end;return b end end;function EFFECT:Init(a)self.StartPos=self:GetTracerOrigin(a)self.EndPos=a:GetOrigin()self.Parent=a:GetEntity()self.Entity:SetRenderBoundsWS(self.StartPos,self.EndPos)local g=self.EndPos-self.StartPos;self.Normal=g:GetNormal()self.StartTime=0;self.LifeTime=(g:Length()+self.Length)/self.Speed end;function EFFECT:Think()self.LifeTime=self.LifeTime-FrameTime()self.StartTime=self.StartTime+FrameTime()return self.LifeTime>0 end;function EFFECT:Render()local h=self.Speed*self.StartTime;local i=h-self.Length;i=math.max(0,i)h=math.max(0,h)local j=self.StartPos+self.Normal*i;local k=self.StartPos+self.Normal*h end
--addons/!lpakr_out/lua/effects/sup_laser_pink.lua:
local a=Material('galactic/seasonal/valentines/heart.png')function EFFECT:Init(b)local c=b:GetStart()local d=b:GetOrigin()local e=(d-c):GetNormalized()local f=ParticleEmitter(c)if!f then return end;local g=b:GetEntity()local h=g:GetAttachment(b:GetAttachment())if h then c=h.Pos end;if IsValid(g)&&g:GetOwner()==LocalPlayer()&&!LocalPlayer():ShouldDrawLocalPlayer()then c=g.Akimbo&&(g.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition end;for i=1,math.random(2,6)do local j=f:Add(a,c+Vector(math.random(-2,2),math.random(-2,2),0))if j then j:SetCollide(true)j:SetDieTime(2)j:SetGravity(Vector(0,0,0))j:SetVelocity(e*math.random(1000,2000))j:SetVelocityScale(true)j:SetAirResistance(100)j:SetStartSize(math.random(0,4))j:SetEndSize(math.random(4,6))j:SetStartAlpha(50)j:SetEndAlpha(200)j:SetColor(255,255,255)j:SetBounce(5)j:SetRoll(math.random(-.5,.5))local k=false;j:SetCollideCallback(function(l,m,n)l:SetDieTime(0)end)end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/sup_laser_yellow.lua:
EFFECT.Speed=20000;EFFECT.Length=50;EFFECT.UseModel=false;local a=Material'effects/sw_laser_yellow_main'local b=Material'effects/sw_laser_yellow_front'local c=Vector()function EFFECT:Init(d)self.StartPos=d:GetStart()self.EndPos=d:GetOrigin()local e=d:GetEntity()if!self.StartPos||!self.EndPos||!IsValid(e)then self.DieTime=0;return end;local f=d:GetAttachment()if IsValid(e)&&f>0 then if e.Owner==LocalPlayer()&&LocalPlayer():GetViewModel()!=LocalPlayer()&&!LocalPlayer():ShouldDrawLocalPlayer()then local g=e.Sequence&&(e.Sequence:find('right')&&MuzzlePosition2||MuzzlePosition)||nil;g=g||e.Akimbo&&(e.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition;self.StartPos=g||self.StartPos else local h=e.Akimbo&&(e.AkimboLeftFire&&f||f+1)||f;local f=e:GetAttachment(h)if f&&f.Pos then self.StartPos=f.Pos else self.DieTime=0;return end end end;if self.StartPos==c||self.EndPos==c then self.DieTime=0;return end;self.Dir=(self.EndPos-self.StartPos):GetNormalized()self:SetRenderBoundsWS(self.StartPos+self.Dir,self.EndPos)self.StartTime=CurTime()self.Distance=self.StartPos:Distance(self.EndPos)self.TracerTime=self.Distance/self.Speed;self.DieTime=self.StartTime+self.TracerTime;local i=EffectData()i:SetOrigin(self.StartPos+self.Dir*10)i:SetNormal(self.Dir)i:SetMagnitude(0)i:SetScale(1)util.Effect('StriderMuzzleFlash',i)end;function EFFECT:Think()if CurTime()>self.DieTime then return false end;return true end;function EFFECT:Render()if CurTime()>=self.DieTime then return end;local j=(CurTime()-self.StartTime)/self.TracerTime;if j<0 then return end;local k=self.StartPos+self.Dir*self.Distance*j;local l=k+self.Dir*self.Length;if a then render.SetMaterial(a)render.DrawBeam(k,l,15,0,1,col.yellow)end;if b then render.SetMaterial(b)render.DrawSprite(l,15,15,col.yellow)end;if srp.nvg.IsEnabled()then return end;self.dlight=DynamicLight(self:EntIndex())if self.dlight then self.dlight.pos=l;self.dlight.r=255;self.dlight.g=215;self.dlight.b=0;self.dlight.brightness=2;self.dlight.Decay=2000;self.dlight.Size=200;self.dlight.DieTime=CurTime()+.1 end end
--addons/!lpakr_out/lua/badmin/modules/chatbox/tags/tags_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/chatbox/tags/tags_sh.lua:
nw.Register'ChatTag':Write(net.WriteString):Read(net.ReadString):SetPlayer()term.Add('ChatTagCleared','Your chat tag was cleared.')term.Add('ChatTagUpdated','Your chat tag was updated.')function PLAYER:GetChatTag()local a=hook.Call('PlayerOverrideChatTag',nil,self)||self:GetNetVar('ChatTag')||hook.Call('PlayerGetChatTag',nil,self)if a&&ba.chatEmotes[a]&&(SERVER||!cvar.GetValue('DisableEmotes'))then return a..' 'end;return''end
--addons/!lpakr_out/lua/badmin/modules/rewards/init_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/screengrab/vgui_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/sitrequests/init_sh.lua:
ba.sits=ba.sits||{}ba.sits.BannedReasons={['admin to me']=true,['help']=true,['admin']=true,['rdm']=true,['rda']=true,['failrp']=true}term.Add('StaffReqSent','Staff request sent: #')term.Add('StaffReqPend','You already have a pending staff request!')term.Add('StaffReqLonger','Please be descriptive (<10+ characters)!')term.Add('StaffReqBadReason','Please be more descriptive of your issue!')term.Add('AdminTookPlayersRequest','# took #\'s staff request.')term.Add('AdminTookYourRequest','# took your staff request, they\'ll be with you shortly.')term.Add('AdminClosedPlayersRequest','# closed #\'s staff request.')term.Add('AdminClosedYourRequest','# closed your staff request.')ba.AddCommand('Treq',function(a,b)if b:HasStaffRequest()then if info.ChatPrefix then ba.sits.LogTakenSit:Run(info.ChatPrefix,a:SteamID64(),b:SteamID64(),b:GetBVar('StaffRequestReason'))end;ba.notify_staff(term.Get('AdminTookPlayersRequest'),a,b)ba.notify(b,term.Get('AdminTookYourRequest'),a)hook.Call("PlayerSitRequestTaken",GAMEMODE,b,a)end;ba.sits.Remove(b)end):AddParam(cmd.PLAYER_ENTITY):SetFlag'M':SetHelp'Takes an admin request':SetAuthRequired(false)ba.AddCommand('Rreq',function(a,b)if b:HasStaffRequest()then ba.notify_staff(term.Get('AdminClosedPlayersRequest'),a,b)ba.notify(b,term.Get('AdminClosedYourRequest'),a)hook.Call("PlayerSitRequestClosed",GAMEMODE,b,a)end;ba.sits.Remove(b)end):AddParam(cmd.PLAYER_ENTITY):SetFlag'M':SetHelp'Removes an admin request':SetAuthRequired(false)ba.AddCommand('Report',function(a,c)ba.sits.Send(a,c)end):AddParam(cmd.STRING):SetHelp('Opens a staff ticket')
--addons/!lpakr_out/lua/badmin/modules/sitrequests/vgui_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/ssrp/logs/misc_sh.lua:
local a=ba.logs.Term;ba.logs.AddTerm('CharacterSwitched','#(#) switch to characterid # from #',{'Name','SteamID','CharacterID'})ba.logs.Get('Connections'):Hook('OnCharacterUnloaded',function(self,b,c,d)self:PlayerLog(b,a('CharacterSwitched'),b,c,d)end)ba.logs.AddTerm('Damage','#(#) did # damage to #(#) with # over # seconds at #',{'Attacker Name','Attacker SteamID','Damage','Victim Name','Victim SteamID','Weapon','Duration','Location'})ba.logs.AddTerm('Grenade','#(#) thrown a # in #',{'Name','SteamID','Grenade','Location'})local e={}local function f(self,g)local h=e[g]if!h then return end;local i=h.endtime||CurTime()self:Log(a('Damage'),h.attackerName,h.attackerSteamID,h.damage,h.victimName,h.victimSteamID,h.weapon,math.floor(i-h.start),h.position)e[g]=nil;timer.Remove('ba.logs.StackDamage_'..g)end;ba.logs.Create'Damage':Hook('OnGrenadeThrown',function(self,b,j)self:PlayerLog(b,a('Grenade'),b,util.GetPrintName(j)||'unknown',b:GetPos())end):Hook('EntityTakeDamage',function(self,j,k)if j:IsPlayer()&&k:GetAttacker():IsPlayer()then local l=math.ceil(k:GetDamage())local m=k:GetAttacker()local n=m:Name()local g=m:SteamID()local o=j:Name()local p=j:SteamID()local q=m:GetActiveWeapon()if q&&q:IsValid()then wep=q:GetClass()elseif IsValid(k:GetInflictor())then wep=k:GetInflictor():GetClass()else wep='none'end;local h=e[g]if!h then e[g]={attackerName=n,attackerSteamID=g,victimName=o,victimSteamID=p,damage=l,weapon=wep,position=j:GetPos(),start=CurTime()}elseif h.weapon!=wep||h.victimSteamID!=p then f(self,h.attackerSteamID)e[g]={attackerName=n,attackerSteamID=g,victimName=o,victimSteamID=p,damage=l,weapon=wep,position=j:GetPos(),start=CurTime()}else h.damage=h.damage+l;h.endtime=CurTime()end;timer.Create('ba.logs.StackDamage_'..g,2,1,function()f(self,g)end)end end)ba.logs.AddTerm('VoiceStart','#(#) started talking in #',{'Name','SteamID','Location'})ba.logs.AddTerm('VoiceEnd','#(#) finished talking',{'Name','SteamID'})ba.logs.Create'Voice':Hook('PlayerStartVoice',function(self,b)self:PlayerLog(b,a('VoiceStart'),b:Name(),b:SteamID(),b:GetPos())end):Hook('PlayerEndVoice',function(self,b)self:Log(a('VoiceEnd'),b:Name(),b:SteamID())end)ba.logs.AddTerm('Loadout_Purchased','#(#) purchased # in slot #',{'Name','SteamID','Item','Slot'})ba.logs.AddTerm('Loadout_Equipped','#(#) equipped # in slot #',{'Name','SteamID','Item','Slot'})ba.logs.Create'Loadouts':Hook('OnLoadoutPurchased',function(self,b,r,s)self:PlayerLog(b,a('Loadout_Purchased'),b:Name(),b:SteamID(),r,s)end):Hook('OnLoadoutEquipt',function(self,b,r,s)self:PlayerLog(b,a('Loadout_Equipped'),b:Name(),b:SteamID(),r,s)end)ba.logs.AddTerm('RunRPCommand','#(#) ran ssrp # #',{'Name','SteamID','Command','Arguments'})local function t(u)if isplayer(u)&&IsValid(u)then return u:Name()end;return tostring(u)end;local function v(w)local x;for y,u in pairs(w)do x=(x&&x..' '||' ')..t(u)end;return x||''end;ba.logs.Create'RP Commands':Hook('cmd.OnCommandRun',function(self,b,z,w)if z:GetConCommand()=='ssrp'then self:PlayerLog(b,a('RunRPCommand'),b:Nick(),b:SteamID(),z:GetName(),v(w))end end)ba.logs.AddTerm('GaveMoney','#(#) gave #(#) # (New wallets: # and $#)',{'Name','SteamID','Receiver Name','Receiver SteamID','Amount','Sender New Money','Receiver New Money','Location'})ba.logs.Create'Money':Hook('OnPlayerGaveMoney',function(self,b,A,B)local C=string.Comma(b:GetMoney())local D=string.Comma(A:GetMoney())self:PlayerLog({b,A},a('GaveMoney'),b:Name(),b:SteamID(),A:Name(),A:SteamID(),C,D,b:GetPos())end)ba.logs.AddTerm('HangarSpawns','#(#) spawned # at #',{'Name','SteamID','Ship Name','Hangar Location'})ba.logs.AddTerm('PlayerEnteredVehicle','#(#) entered a # at #',{'Name','SteamID','Vehicle','Location'})ba.logs.AddTerm('PlayerExitVehicle','#(#) exited a # at #',{'Name','SteamID','Vehicle','Location'})ba.logs.Create('Hangar',false):Hook('OnHangarVehicleSpawned',function(self,b,E,s,F,G)self:PlayerLog(b,a('HangarSpawns'),b,G,s)end):Hook('PlayerEnteredVehicle',function(self,b,H)local I=H:GetParent()local J=H;if I:IsVehicle()||I.LVS then J=I elseif IsValid(H.turret)then J=H.turret end;local K=util.GetPrintName(J)||J:GetClass()self:PlayerLog(b,a('PlayerEnteredVehicle'),b,K,b:GetPos())end):Hook('PlayerLeaveVehicle',function(self,b,H)local I=H:GetParent()local J=H;if I:IsVehicle()||I.LVS then J=I elseif IsValid(H.turret)then J=H.turret end;local K=util.GetPrintName(J)||J:GetClass()self:PlayerLog(b,a('PlayerExitVehicle'),b,K,b:GetPos())end)ba.logs.AddTerm('PickedUpEntity','#(#) picked up # at #',{'Name','SteamID','Item','Location'})ba.logs.AddTerm('PickedUpDropped','#(#) dropped # at #',{'Name','SteamID','Item','Location'})ba.logs.Create('Pickups',false):Hook('OnEntityPickedup',function(self,b,j)local L=util.GetPrintName(j)||j:GetClass()self:PlayerLog(b,a('PickedUpEntity'),b,L,j:GetPos())end):Hook('OnEntityDropped',function(self,b,j)if!IsValid(j)then self:PlayerLog(b,a('PickedUpDropped'),b,'Removed Item',b:GetPos())return end;local L=util.GetPrintName(j)||j:GetClass()self:PlayerLog(b,a('PickedUpDropped'),b,L,b:GetPos())end)ba.logs.Create('Pickups',false):Hook('OnEntityPickedup',function(self,b,j)local L=util.GetPrintName(j)||j:GetClass()self:PlayerLog(b,a('PickedUpEntity'),b,L,b:GetPos())end):Hook('OnEntityDropped',function(self,b,j)if!IsValid(j)then self:PlayerLog(b,a('PickedUpDropped'),b,'Removed Item',b:GetPos())return end;local L=util.GetPrintName(j)||j:GetClass()self:PlayerLog(b,a('PickedUpDropped'),b,L,b:GetPos())end)ba.logs.AddTerm('GamblingWon','#(#) used # machine and won # (prev wallet: #, new wallet: #)',{'Name','SteamID','Machine','Winnings','PrevWallet','NewWallet'})ba.logs.AddTerm('GamblingLost','#(#) used # machine and lost # (prev wallet: #, new wallet: #)',{'Name','SteamID','Machine','Losses','PrevWallet','NewWallet'})ba.logs.Create('Gambling',false):Hook('PlayerGamble',function(self,b,j,M,N,O)local P=j.PrintName||'UNKNOWN'local Q=string.Comma(N)local R=string.Comma(M)local S=string.Comma(b:GetMoney())if O then self:PlayerLog(b,a('GamblingWon'),b,P,Q,R,S)else self:PlayerLog(b,a('GamblingLost'),b,P,Q,R,S)end end)ba.logs.AddTerm('ClaimableRoom','#(#) has set a claimable room in # to #',{'Name','SteamID','BoardLocation','ClaimType'})ba.logs.Create('Battalions',false):Hook('OnPlayerClaimedRoom',function(self,T,b,U,V)local W=U.Name;local X=T:GetLocationName()self:PlayerLog(b,a('ClaimableRoom'),b,X,W)end)
--addons/!lpakr_out/lua/badmin/modules/sync/init_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/prone/config.lua:
return lpakr()()