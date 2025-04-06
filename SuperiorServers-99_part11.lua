--Stealed clientside server code by exechack.cc
--Hostname: !💠⇛SuperiorServers.co - CWRP - UPDATED MAP & CONTENT! - Part 11/12 - 06/04/2025


--PATH addons/gpakr_out/lua/gpakr/csgo-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/csgo-3995375344.bsp',FileName='csgo',CRC='1069526611',Len=3287356,ShouldLoad=true}
--addons/gpakr_out/lua/gpakr/ui-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/ui-2416615634.bsp',FileName='ui',CRC='2416615634',Len=122788635,ShouldLoad=true}
--addons/!lpakr_out/lua/dash/extensions/entity.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/extensions/chat.lua:
chat=chat||{}local a={}local b={}b.__index=b;RegisterMetaTable('Chat',b)local c=net.Start;local d=net.Send;local e=net.Broadcast;local f=ents.FindInSphere;chat.DefaultLimit=126;function chat.Register(g)local h={NetworkString='chat_'..g,SendFunc=net.Broadcast,KeyValues={}}a[g]=h;if SERVER then else net.Receive(h.NetworkString,function()if IsValid(LocalPlayer())then local i={h:ReadFunc()}if#i>0 then chat.AddText(unpack(i))end end end)end;return setmetatable(h,b)end;function chat.Send(g,...)local j=a[g]c(j.NetworkString)j:WriteFunc(...)j.SendFunc(...)end;function b:Write(k)self.WriteFunc=k;return self end;function b:Read(k)self.ReadFunc=k;return self end;function b:Set(l,m)self.KeyValues[l]=m;return self end;function b:Get(l)return self.KeyValues[l]end;function b:Filter(k)self.SendFunc=function(...)d(k(...))end;return self end;function b:SetLocal(n)self.SendFunc=function(o)d(table.Filter(f(o:EyePos(),n),function(p)return p:IsPlayer()end))end end
--addons/!lpakr_out/lua/dash/extensions/file.lua:
local a=512*1024;local b=0.1;local c={}local function d(e)if timer.Exists('file.DoStaggered')then return end;if c[1]then local f=table.remove(c,1)timer.Create('file.DoStaggered',b,0,function()if f()then timer.Remove('file.DoStaggered')d()end end)else timer.Remove('file.DoStaggered')end end;function file.ReadStaggered(g,h)local i=file.Open(g,'rb','DATA')if!i then error('failed to open file '..g..'.')end;do local j={}local function k()local l=i:Read(a)if!l||l:len()==0 then i:Close()h(table.concat(j))return true else j[#j+1]=l;return false end end;table.insert(c,k)end;d()end;function file.WriteStaggered(g,m,h)local i=file.Open(g,'wb','DATA')if!i then error('failed to open file '..g..'.')end;do local n=m:len()local o=0;local function p()local q=string.sub(m,o*a,(o+1)*a)i:Write(q)o=o+1;if o*a>n then i:Close()h(g)return true end end;table.insert(c,p)end;d()end
--addons/!lpakr_out/lua/dash/extensions/client/vgui.lua:
return lpakr()()
--addons/!lpakr_out/lua/areatrigger/ui/dropdown_ui.lua:
local a={}Derma_Hook(a,'Paint','Paint','ComboBox')Derma_Install_Convar_Functions(a)AccessorFunc(a,'m_bDoSort','SortItems',FORCE_BOOL)function a:Init()self.DropButton=vgui.Create('DPanel',self)self.DropButton.Paint=function(b,w,h)derma.SkinHook('Paint','ComboDownArrow',b,w,h)end;self.DropButton:SetMouseInputEnabled(false)self.DropButton.ComboBox=self;self:SetTall(22)self:Clear()self:SetContentAlignment(4)self:SetTextInset(8,0)self:SetIsMenu(true)self:SetSortItems(true)end;function a:Clear()self:SetText''self.Options={}self.Spacers={}self.Selected=nil;if self.Menu then self.Menu:Remove()self.Menu=nil end end;function a:ChooseOption(c)if self.Menu then self.Menu:Remove()self.Menu=nil end;local d=self.Options[c]if!d then return end;self.Selected=c;self.SelectedSub=nil;self:SetText(d.value)self:OnSelect(c,d.value,d.data)end;function a:ChooseSubOption(e,f)if self.Menu then self.Menu:Remove()self.Menu=nil end;local d=self.Options[e]&&self.Options[e].SubOptions[f]if!d then return end;self.Selected=e;self.SelectedSub=f;self:SetText(d.value)self:OnSelect(f,d.value,d.data,e)end;function a:GetOptionText(e,f)if f then return self.Options[e]&&self.Options[e].SubOptions&&self.Options[e].SubOptions[f].value else return self.Options[e]&&self.Options[e].value end end;function a:GetOptionData(e,f)if f then return self.Options[e]&&self.Options[e].SubOptions&&self.Options[e].SubOptions[f].data else return self.Options[e]&&self.Options[e].data end end;function a:ChooseOptionID(e,f)if f then self:ChooseSubOption(e,f)else self:ChooseOption(e)end end;function a:GetSelectedID()return self.Selected,self.SelectedSub end;function a:GetSelected()if!self.Selected then return end;return self:GetOptionText(self.Selected,self.SelectedSub),self:GetOptionData(self.Selected,self.SelectedSub)end;function a:IsMenuOpen()return IsValid(self.Menu)&&self.Menu:IsVisible()end;function a:OpenMenu(g)if g&&g==self.TextEntry then return end;if#self.Options==0 then return end;if IsValid(self.Menu)then self.Menu:Remove()self.Menu=nil end;local i=self;while IsValid(i)&&!i:IsModal()do i=i:GetParent()end;if!IsValid(i)then i=self end;self.Menu=DermaMenu(false,i)for j,k in pairs(self.Options)do if k.SubOptions then local l=self.Menu:AddSubMenu(k.value)for m,n in pairs(k.SubOptions)do l:AddOption(n.value,function()self:ChooseSubOption(n.parentid,m)end)end else self.Menu:AddOption(k.value,function()self:ChooseOption(j)end)end;if self.Spacers[j]then self.Menu:AddSpacer()end end;local o,p=self:LocalToScreen(0,self:GetTall())self.Menu:SetMinimumWidth(self:GetWide())self.Menu:Open(o,p,false,self)self:OnMenuOpened(self.Menu)end;function a:CloseMenu()if IsValid(self.Menu)then self.Menu:Remove()self.Menu=nil end end;function a:AddSpacer()self.Spacers[#self.Options]=true end;function a:AddChoice(q,k,r,s)local l={value=q,data=k,icon=s}l.id=table.insert(self.Options,l)if r then self:ChooseOption(l.id)end;return l.id end;function a:AddSubChoice(t,q,k,r,s)if self.Options[t]then if!self.Options[t].SubOptions then self.Options[t].SubOptions={}end;local m=#self.Options[t].SubOptions+1;self.Options[t].SubOptions[m]={parentid=t,id=m,value=q,icon=s,data=k}if r then self:ChooseSubOption(m)end;return m end end;function a:DoClick()if self:IsMenuOpen()then return self:CloseMenu()end;self:OpenMenu()end;function a:OnSelect(c,q,k,u)end;function a:OnMenuOpened(v)end;function a:PerformLayout()self.DropButton:SetSize(15,15)self.DropButton:AlignRight(4)self.DropButton:CenterVertical()DButton.PerformLayout(self,w,h)end;vgui.Register('DComboBox2',a,'DButton')
--addons/!lpakr_out/lua/dash/thirdparty/pon/pon.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/frame.lua:
local a={}AccessorFunc(a,'m_bIsMenuComponent','IsMenu',FORCE_BOOL)AccessorFunc(a,'m_bDraggable','Draggable',FORCE_BOOL)AccessorFunc(a,'m_bSizable','Sizable',FORCE_BOOL)AccessorFunc(a,'m_bScreenLock','ScreenLock',FORCE_BOOL)AccessorFunc(a,'m_bDeleteOnClose','DeleteOnClose',FORCE_BOOL)AccessorFunc(a,'m_bPaintShadow','PaintShadow',FORCE_BOOL)AccessorFunc(a,'m_iMinWidth','MinWidth')AccessorFunc(a,'m_iMinHeight','MinHeight')AccessorFunc(a,'m_bBackgroundBlur','BackgroundBlur',FORCE_BOOL)function a:Init()self:SetFocusTopLevel(true)self.btnClose=ui.Create('ui_button',self)self.btnClose:SetText('')self.btnClose.DoClick=function(b)surface.PlaySound('sup/ui/beep.ogg')self:Close()end;self.btnClose.Paint=function(c,d,e)derma.SkinHook('Paint','WindowCloseButton',c,d,e)end;self.lblTitle=ui.Create('DLabel',self)self.lblTitle:SetColor(ui.col.White)self.lblTitle:SetFont('ui.22')self:SetDraggable(true)self:SetSizable(false)self:SetScreenLock(false)self:SetDeleteOnClose(true)self:SetTitle('Window')self:SetSkin('SUP')self:SetMinWidth(50)self:SetMinHeight(50)self:SetPaintBackgroundEnabled(false)self:SetPaintBorderEnabled(false)self.m_fCreateTime=SysTime()self:DockPadding(5,35,5,5)self:SetAlpha(0)self:FadeIn(0.2)hook('Think',self,function()if self.HandleMovement then self:HandleMovement()end;if self.Anim then self.Anim:Run()end end)if self.InitDerived then self:InitDerived()end end;function a:Focus()local f={}self:SetBackgroundBlur(true)for g,h in ipairs(vgui.GetWorldPanel():GetChildren())do if(h:IsVisible()||IsValid(h.FocusPanel))&&h!=self then f[#f+1]=h;h:SetVisible(false)h.FocusPanel=self end end;self._OnRemove=self._OnRemove;self.OnRemove=function(self)for i,h in ipairs(f)do if IsValid(h)&&h.FocusPanel==self then h:SetVisible(true)h.FocusPanel=nil end end;if self._OnRemove then self:_OnRemove()end end end;function a:ShowCloseButton(j)self.btnClose:SetVisible(j)end;function a:SetTitle(k)self.lblTitle:SetText(k)end;function a:GetTitleHeight()return 35 end;function a:GetDockPos()return 5,self:GetTitleHeight()end;function a:Center()self:InvalidateLayout(true)self:SetPos(ScrW()/2-self:GetWide()/2,ScrH()/2-self:GetTall()/2)end;function a:AddPanel(l,m)if ispanel(l)then l:SetParent(self)return l else return ui.Create(l,m,self)end end;function a:Close(n)if self:GetDeleteOnClose()then self.Think=function()end end;self:FadeOut(0.2,function()if self:GetDeleteOnClose()then self:Remove()else self:SetVisible(false)end;if n then n()end end)self:OnClose()end;function a:OnClose()end;function a:Think()end;function a:IsActive()if self:HasFocus()then return true end;if vgui.FocusedHasParent(self)then return true end;return false end;function a:HandleMovement()local o=math.Clamp(gui.MouseX(),1,ScrW()-1)local p=math.Clamp(gui.MouseY(),1,ScrH()-1)if self.Dragging then local q=o-self.Dragging[1]local r=p-self.Dragging[2]if self:GetScreenLock()then q=math.Clamp(q,0,ScrW()-self:GetWide())r=math.Clamp(r,0,ScrH()-self:GetTall())end;self:SetPos(q,r)end;if self.Sizing then local q=o-self.Sizing[1]local r=p-self.Sizing[2]local s,t=self:GetPos()if q<self.m_iMinWidth then q=self.m_iMinWidth elseif q>ScrW()-s&&self:GetScreenLock()then q=ScrW()-s end;if r<self.m_iMinHeight then r=self.m_iMinHeight elseif r>ScrH()-t&&self:GetScreenLock()then r=ScrH()-t end;self:SetSize(q,r)self:SetCursor('sizenwse')return end;if self.Hovered&&self.m_bSizable&&o>self.x+self:GetWide()-20&&p>self.y+self:GetTall()-20 then self:SetCursor('sizenwse')return end;if self.Hovered&&self:GetDraggable()&&p<self.y+24 then self:SetCursor('sizeall')return end;self:SetCursor('arrow')if self.y<0 then self:SetPos(self.x,0)end end;function a:Paint(d,e)if self.m_bBackgroundBlur then Derma_DrawBackgroundBlur(self,self.m_fCreateTime)end;derma.SkinHook('Paint','Frame',self,d,e)if self.TitleAnim then local u=math.Clamp((RealTime()-self.TitleAnim)/0.7,0,1)self.TitleAnimDelta=u;derma.SkinHook('Paint','FrameTitleAnim',self,d,e)if u==2 then self.TitleAnim=nil;self.TitleAnimDelta=nil end end;return true end;function a:PaintOver(d,e)derma.SkinHook('Paint','FrameLoading',self,d,e)end;function a:OnMousePressed()if self.m_bSizable then if gui.MouseX()>self.x+self:GetWide()-20&&gui.MouseY()>self.y+self:GetTall()-20 then self.Sizing={gui.MouseX()-self:GetWide(),gui.MouseY()-self:GetTall()}self:MouseCapture(true)return end end;if self:GetDraggable()&&gui.MouseY()<self.y+24 then self.Dragging={gui.MouseX()-self.x,gui.MouseY()-self.y}self:MouseCapture(true)return end end;function a:OnMouseReleased()self.Dragging=nil;self.Sizing=nil;self:MouseCapture(false)end;function a:FadeIn(v,n)self.Anim=Derma_Anim('Fade Panel',self,function(c,w,u,x)c:SetAlpha(u*255)if w.Finished then self.Anim=nil;self.TitleAnim=RealTime()+0.25;if n then n()end end end)if self.Anim then self.Anim:Start(v)end end;function a:FadeOut(v,n)self.Anim=Derma_Anim('Fade Panel',self,function(c,w,u,x)c:SetAlpha(255-u*255)if w.Finished then self.Anim=nil;if n then n()end end end)if self.Anim then self.Anim:Start(v)end end;function a:SetLoading(y)self.ShowIsLoadingAnim=y end;function a:PerformLayout()self.lblTitle:SizeToContents()self.lblTitle:SetPos(8,4)self.btnClose:SetPos(self:GetWide()-30,0)self.btnClose:SetSize(30,30)end;vgui.Register('ui_frame',a,'EditablePanel')a=vgui.GetControlTable('ui_frame')local z=a.SetSize;a.SetSize=function(self,d,e)if d<=1 then d=d*ScrW()end;if e<=1 then e=e*ScrH()end;z(self,d,e)end;local A=a.SetWide;a.SetWide=function(self,d)if d<=1 then d=d*ScrH()end;A(self,d)end;local B=a.SetTall;a.SetTall=function(self,e)if e<=1 then e=e*ScrH()end;B(self,e)end
--addons/!lpakr_out/lua/ui/controls/imagebutton.lua:
function PLAYER:ShowProfile()gui.OpenURL('https://superiorservers.co/profile/'..self:SteamID64())end;local a={}function a:Init()self.Enabled=true;self:SetText''self.Button=ui.Create('ui_button',self)self.Button:Dock(FILL)self.Button:SetText''self.Button.DoClick=function()self:DoClick()end;self.Button.OnCursorEntered=function()self.Hovered=true end;self.Button.OnCursorExited=function()self.Hovered=false end;self.Button.PaintOver=function(b,c,d)end;self.Button.Paint=function()end end;function a:DoClick()self:ShowProfile()end;function a:ShowProfile()local e=self:GetPlayer()if IsValid(e)then e:ShowProfile()elseif self:GetSteamID64()then gui.OpenURL('https://superiorservers.co/profile/'..self.SteamID64)end end;function a:SetPlayer(e,f)self.AvatarImage=ui.Create('AvatarImage',self)self.AvatarImage:Dock(FILL)self.AvatarImage:SetPlayer(e,f)self.AvatarImage:SetPaintedManually(true)self.Button:SetParent(self.AvatarImage)self.Player=e;self.SteamID64=e:SteamID64()end;local g={}function a:SetSteamID64(h,f)self.AvatarImage=ui.Create('AvatarImage',self)self.AvatarImage:Dock(FILL)self.AvatarImage:SetSteamID(h,f)self.AvatarImage:SetPaintedManually(true)self.Button:SetParent(self.AvatarImage)self.SteamID64=h end;local i={}function a:SetURL(j,k)self.Url=j;if i[j]then self.Material=i[j]else texture.Delete('ImageButton_'..j)texture.Create('ImageButton_'..j):EnableProxy(k):EnableCache(false):Download(j,function(l,m)if IsValid(self)then self.Material=m;i[j]=m end end)end end;function a:SetMaterial(n)self.Material=n end;function a:SetIcon(o)self:SetMaterial(Material(o))end;function a:GetPlayer()return self.Player end;function a:GetSteamID64()return self.SteamID64 end;function a:GetURL()return self.Url end;function a:Paint(c,d)derma.SkinHook('Paint','ImageButton',self,c,d)end;vgui.Register('ui_imagebutton',a,'Panel')
--addons/!lpakr_out/lua/ui/controls/listrequest.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/listview.lua:
local a={}Derma_Hook(a,'Paint','Paint','UIListView')function a:Init()self.Rows={}self.SearchResults={}self.HideInvisible=true;self.RowHeight=ui.ButtonHeight;self:SetSpacing(1)end;function a:SetRowHeight(b)self.RowHeight=b end;function a:AddCustomRow(c,d)self:AddItem(c)self.Rows[#self.Rows+1]=c;self.SearchResults[#self.SearchResults+1]=c;return c end;function a:AddRow(e,d)local c=ui.Create('ui_button',function(f)f:SetText(tostring(e))f:SetTall(self.RowHeight)if d==true then f:SetDisabled(true)end end)function c.SetActive()if IsValid(self.Selected)then self.Selected.Active=false end;c.Active=true;self.Selected=c end;self:AddItem(c)self.Rows[#self.Rows+1]=c;self.SearchResults[#self.SearchResults+1]=c;c.DoClick=function(f)if c.Active then return end;f:SetActive()self:OnSelected(c)end;return c end;function a:AddImageRow()local g=ui.Create('ui_imagerow')self.Rows[#self.Rows+1]=g;function g.SetActive()if IsValid(self.Selected)then self.Selected.Active=false end;g.Active=true;self.Selected=g end;g.DoClick=function(f)if g.Active then return end;f:SetActive()self:OnSelected(g)end;self:AddItem(g)return g end;function a:AddPlayer(h,i)local g=self:AddImageRow()g:SetPlayer(h,i)return g end;function a:AddSpacer(e)local c=self:AddRow(e,true)c:SetTall(ui.SpacerHeight)c:SetFont('ui.20')return c end;function a:GetSelected()return self.Selected end;function a:OnSelected(c)end;function a:Search(e)self.SearchResults={}if!e||e==''then for j,k in ipairs(self.Rows)do if IsValid(k)then k:SetVisible(true)self.SearchResults[#self.SearchResults+1]=k end end;if IsValid(self.NoResultsSpacer)then self.NoResultsSpacer:Remove()end;self:PerformLayout()else local l=0;for j,k in ipairs(self.Rows)do if!IsValid(k)then continue end;if self:FilterSearchResult(k,e)then l=l+1;k:SetVisible(true)self.SearchResults[#self.SearchResults+1]=k else k:SetVisible(false)end end;if l==0 then if IsValid(self.NoResultsSpacer)then self.NoResultsSpacer:SetVisible(true)else self.NoResultsSpacer=self:AddSpacer(self.NoResultsMessage||'No results found!')end elseif IsValid(self.NoResultsSpacer)then self.NoResultsSpacer:SetVisible(false)end;self:PerformLayout()end end;function a:SetNoResultsMessage(m)self.NoResultsMessage=m end;function a:GetSearchResults()return self.SearchResults end;function a:FilterSearchResult(c,e)return string.find(c:GetText():lower(),e:lower(),1,true)!=nil end;function a:PaintOver(n,o)if self.PlaceholderMessage&&self:ShouldDrawPlaceholder()then draw.RoundedBox(5,0,0,n,o,ui.col.Background)draw.SimpleText(self.PlaceholderMessage,'ui.24',n*0.5,o*0.5,ui.col.White,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end;function a:SetPlaceholderText(m)self.PlaceholderMessage=m end;function a:ShouldDrawPlaceholder()return#self.Rows==0 end;vgui.Register('ui_listview',a,'ui_scrollpanel')
--addons/!lpakr_out/lua/ui/controls/propertysheet.lua:
local a={}function a:Paint(b,c)derma.SkinHook('Paint','PropertySheet',self,b,c)end;function a:DockToFrame()local d=self:GetParent()local e,f=d:GetDockPos()self:SetPos(e,f-5)self:SetSize(d:GetWide()-10,d:GetTall()-f)end;vgui.Register('ui_propertysheet',a,'DPropertySheet')
--addons/!lpakr_out/lua/ui/controls/scrollpanel_horizontal.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/table_row.lua:
local a={}function a:AddData()end;vgui.Register('ba_table_row',a,'Panel')
--addons/!lpakr_out/lua/ui/controls/tablist.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/tablist_horizontal.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/core/util/notifications/notify_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/core/terms_sh.lua:
term.Add('PlayerFirstConnect','# has connected for the first time.')term.Add('PlayerConnect','# has connected last seen on #.')term.Add('PlayerDisconnect','# has disconnected.')term.Add('RankExpired','Your rank has expired to #.')term.Add('InvalidCommand','# is not a valid command!')term.Add('NeedFlagToUseCommand','You need flag "#" in order to use command #')term.Add('MissingArg','Missing command argument: #')term.Add('FatalError','Fatal error while running command.')term.Add('TriedToRunCommand','# tried to run # on you!')term.Add('SameWeight','This player\'s rank is equal or greater weight than yours!')term.Add('InvalidTimeUnit','Invalid unit of time. Please use number of units followed by unit type (mi, h, d, w, mo)')term.Add('InsufficientImmunity','Your rank is not high enough to perform actions including #.')term.Add('GamemasterSetRank','You have added # to gamemaster!')term.Add('GamemasterRemoveRank','You have removed # from gamemaster!')
--addons/!lpakr_out/lua/badmin/core/logging/logs_sh.lua:
ba.logs=ba.logs||{Stored={},Maping={},Data={},RecallData={},PlayerEvents={},MaxEntries=500}ba.log_mt=ba.log_mt||{}ba.log_mt.__index=ba.log_mt;local a=ba.log_mt;local b={}if!file.IsDir('badmin/logs','data')then file.CreateDir('badmin/logs')end;local c=0;function ba.logs.Create(d)local e;if ba.logs.Stored[d]then e=ba.logs.Stored[d].ID else e=c;c=c+1 end;local f=setmetatable({Name=d,ID=c},ba.log_mt)ba.logs.Stored[f.Name]=f;ba.logs.Maping[f.ID]=f.Name;ba.logs.Data[f.Name]={}return f end;ba.logs.Terms=ba.logs.Terms||{}ba.logs.TermsMap=ba.logs.TermsMap||{}ba.logs.TermsStore=ba.logs.TermsStore||{}function ba.logs.AddTerm(d,g,h)local i=ba.logs.TermsMap[d]||#ba.logs.TermsStore+1;local j={Name=d,Message=g,Copy=h}ba.logs.Terms[i]=j;ba.logs.TermsStore[i]=j;ba.logs.TermsMap[j.Name]=i end;function ba.logs.Term(d)return ba.logs.TermsMap[d]end;function ba.logs.GetTerm(e)return ba.logs.Terms[e]end;function ba.logs.GetTermName(e)return ba.logs.TermsStore[e].Name end;function ba.logs.GetTable()return ba.logs.Stored end;function ba.logs.Get(d)return ba.logs.Stored[d]end;function ba.logs.GetByID(e)return ba.logs.Get(ba.logs.Maping[e])end;function ba.logs.Encode(k)return util.Compress(pon.encode(k))end;function ba.logs.Decode(k)return pon.decode(util.Decompress(k))end;function ba.logs.GetSaves()local l=file.Find('badmin/logs/*.dat','DATA','datedesc')for m,n in ipairs(l)do l[m]={Name=string.StripExtension(n),Date=os.date('[ %m/%d/%Y - %I:%M:%S] ',file.Time('badmin/logs/'..n,'DATA'))}end;return l end;function ba.logs.OpenSave(d)return ba.logs.Decode(file.Read('badmin/logs/'..d..'.dat','DATA'))end;function ba.logs.DeleteSave(d)file.Delete('badmin/logs/'..d..'.dat')end;function ba.logs.SaveExists(d)return file.Exists('badmin/logs/'..string.Trim(d)..'.dat','DATA')end;function ba.logs.SaveLog(d,o)file.Write('badmin/logs/'..string.Trim(d)..'.dat',ba.logs.Encode(o))end;local p={}function ba.logs.Converter(e)return p[e]end;function ba.logs.RegisterConverter(e,q)p[e]=q end;function a:SetColor(r)self.Color=r;return self end;function a:Hide()self.Hidden=true;return self end;function a:Hook(d,s)return self end;function a:GetName()return self.Name end;function a:GetColor()return self.Color end;function a:GetID()return self.ID end;function a:ShouldShow()return!self.Hidden end;ba.AddCommand('Logs'):RunOnClient(function(t)ui.Create('ba_logs_menu'):SelectLogByName(t)end):AddParam(cmd.STRING,cmd.OPT_OPTIONAL):SetFlag'M':SetHelp'Shows you the logs'ba.AddCommand('PlayerEvents'):RunOnClient(function(u)ui.Create('ba_logs_menu',function(self)self:SetPlayerEventMode(ba.InfoTo32(u))end)end):AddParam(cmd.PLAYER_STEAMID32):SetFlag'M':SetHelp'Shows you the logs for a specified player':AddAlias'pe':SetIgnoreImmunity(true)ba.AddCommand'AltSearch':RunOnClient(function(u)ba.ui.OpenAuthLink('/admin/altsearch/'..ba.InfoTo32(u))end):AddParam(cmd.PLAYER_STEAMID32):SetFlag'S':SetHelp'List\'s a players alt accounts'local v=ba.logs.Term;ba.logs.AddTerm('PlayerConnectedFirstTime','#(#) connected for the first time',{'Name','SteamID'})ba.logs.AddTerm('PlayerConnectedLastSeen','#(#) connected last seen on #',{'Name','SteamID'})ba.logs.AddTerm('PlayerDisconnected','#(#) disconnected after playing #',{'Name','SteamID'})ba.logs.Create'Connections':Hook('BadminPlayerDataLoaded',function(self,w,k)if k.lastseen then self:PlayerLog(w,v('PlayerConnectedLastSeen'),w:Name(),w:SteamID(),os.date("%m/%d/%Y",k.lastseen))else self:PlayerLog(w,v('ConnectedFirstTime'),w:Name(),w:SteamID())end end):Hook('PlayerDisconnected',function(self,w)self:PlayerLog(w,v('PlayerDisconnected'),w:Name(),w:SteamID(),string.FormatTime(w:TimeConnected()))end)local x;local function y(n)if istable(n)then return x(n)end;if isplayer(n)&&IsValid(n)then return n:Name()end;return tostring(n)end;function x(z)local A;for m,n in pairs(z)do A=((A||'')..' ')..y(n)end;return A||''end;ba.logs.AddTerm('RunCommand','#(#) ran # #',{'Name','SteamID','Command'})ba.logs.Create'Commands':Hook('cmd.OnCommandRun',function(self,w,B,C,...)if isplayer(w)&&B:GetConCommand()=='ba'then local z=B:GetPreventSendArgs()&&""||x(C)if B:GetLogFilterFlag()&&w:HasFlag(B:GetLogFilterFlag())then return end;self:PlayerLog(w,v('RunCommand'),w:Name(),w:SteamID(),B:GetName(),z)end end)ba.logs.AddTerm('Chat','#(#) said "#"',{'Name','SteamID'})ba.logs.Create'Chat':Hook('PlayerSay',function(self,w,D)if D!=''&&D[1]!='!'&&D[1]!='/'then self:PlayerLog(w,v('Chat'),w:Name(),w:SteamID(),D)end end)ba.logs.AddTerm('SitRequest','#(#) opened a Staff Request: # (# non-AFK staff)',{'Name','SteamID'})ba.logs.AddTerm('SitRequestTaken','#(#) has taken #(#)\'s Staff Request',{'Admin Name','Admin SteamID','Name','SteamID'})ba.logs.AddTerm('SitRequestClosed','#(#) has closed #(#)\'s Staff Request',{'Admin Name','Admin SteamID','Name','SteamID'})ba.logs.Create'Sit':Hook('PlayerSitRequestOpened',function(self,w,E)local F=0;for G,n in player.Iterator()do if n:IsAdmin()&&!n:IsAFK()then F=F+1 end end;self:PlayerLog(w,v('SitRequest'),w:Name(),w:SteamID(),E,F)end):Hook('PlayerSitRequestTaken',function(self,w,H)self:PlayerLog({w,H},v('SitRequestTaken'),H:Name(),H:SteamID(),w:Name(),w:SteamID())end):Hook('PlayerSitRequestClosed',function(self,w,H)self:PlayerLog({w,H},v('SitRequestClosed'),H:Name(),H:SteamID(),w:Name(),w:SteamID())end)ba.logs.AddTerm('PlayerTeleportedOther','#(#) has teleported #(#)',{'Admin Name','Admin SteamID','Name','SteamID'})ba.logs.Create'_MiscPlayerEventsAggregator':Hide():Hook('PlayerTeleportedOthers',function(self,w,I)local J={w}for m,n in ipairs(I)do local J=J;if w==n then J=w else J[2]=n end;self:PlayerLog(J,v('PlayerTeleportedOther'),w:Name(),w:SteamID(),n:Name(),n:SteamID())end end)
--addons/!lpakr_out/lua/badmin/modules/chatbox/_module.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/chatbox/_module.lua:
ba.Module'Chatbox':Author'KingOfBeast, Updated by aStonedPenguin':Include{'emotes_cl.lua','tags/tags_sh.lua','tags/tags_sv.lua','tags/tags_cl.lua','vgui/chatbox_cl.lua','vgui/emotelist_cl.lua','init_cl.lua','init_sh.lua','detour_sv.lua'}
--addons/!lpakr_out/lua/badmin/plugins/viewstaff_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/nodegraph.lua:
local a={}local b={}local c={}c.__index=c;function c:New(d,e,f)local g={}g._id=d;g._type=e;g._pos=f;g._links={}setmetatable(g,self)return g end;function c:GetID()return self._id end;function c:GetType()return self._type end;function c:GetPos()return self._pos end;function c:__tostring()return"Node["..self:GetID().."]"end;function c:Link(g)self._links[g:GetID()]=true;g._links[self:GetID()]=true end;function c:Unlink(g)self._links[g:GetID()]=false;g._links[self:GetID()]=false end;function c:IsLinked(g)return self._links[g:GetID()]||false end;function c:GetLinked()local h={}for d,i in pairs(self._links)do if!i then continue end;table.insert(h,a[d])end;return h end;function c:Distance(f)if!isvector(f)then f=f:GetPos()end;return self:GetPos():Distance(f)end;function c:DistToSqr(f)if!isvector(f)then f=f:GetPos()end;return self:GetPos():DistToSqr(f)end;function DrGBase.GetNodegraph()return a end;function DrGBase.ClosestNode(f)local j;local k=math.huge;for d,g in ipairs(a)do if g:DistToSqr(f)>=k then continue end;k=g:DistToSqr(f)j=g end;return j end;function DrGBase.NodegraphAstar(f,j,l)local m=DrGBase.ClosestNode(f)local n=DrGBase.ClosestNode(j)local o,p=DrGBase.Astar(m:GetPos(),n:GetPos(),{neighbours=function(f)local g=b[tostring(f)]if g then local q=1;local i=g:GetLinked()return function()local r=i[q]q=q+1;if r then return r:GetPos()end end else return function()end end end},isfunction(l)&&function(s,t,...)return l(b[tostring(s)],b[tostring(t)],...)end)table.remove(o,#o)table.insert(o,j)return o,p end
--addons/!lpakr_out/lua/drgbase/particles.lua:
function DrGBase.AddParticles(a,b)if!isstring(a)then return end;game.AddParticles("particles/"..a)if!istable(b)then b={b}end;for c,d in ipairs(b)do if!isstring(d)then continue end;PrecacheParticleSystem(d)end end;DrGBase.AddParticles("drgbase.pcf",{"drg_plasma_ball","drg_smokescreen"})PrecacheParticleSystem("blood_impact_red_01_goop")PrecacheParticleSystem("blood_impact_yellow_01")PrecacheParticleSystem("blood_impact_green_01")PrecacheParticleSystem("blood_impact_antlion_01")PrecacheParticleSystem("blood_impact_zombie_01")PrecacheParticleSystem("blood_impact_antlion_worker_01")
--addons/!lpakr_out/lua/drgbase/modules/table.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/client/overlay/blackandwhite.lua:
DRONES_REWRITE.Overlay["Black and white"]=function(a)local b={["$pp_colour_addr"]=0,["$pp_colour_addg"]=0,["$pp_colour_addb"]=0,["$pp_colour_brightness"]=0,["$pp_colour_contrast"]=1,["$pp_colour_colour"]=0,["$pp_colour_mulr"]=0,["$pp_colour_mulg"]=0,["$pp_colour_mulb"]=0}DrawColorModify(b)end
--addons/!lpakr_out/lua/dronesrewrite/client/overlay/drones1.lua:
DRONES_REWRITE.Overlay["Drones 1"]=function(a)local b={["$pp_colour_addr"]=0,["$pp_colour_addg"]=0,["$pp_colour_addb"]=0,["$pp_colour_brightness"]=0,["$pp_colour_contrast"]=1,["$pp_colour_colour"]=1,["$pp_colour_mulr"]=0,["$pp_colour_mulg"]=0,["$pp_colour_mulb"]=0}DrawColorModify(b)DrawMaterialOverlay("effects/combine_binocoverlay.vmt",0)end
--addons/!lpakr_out/lua/autorun/gs_sh_player.lua:
local a=debug.getregistry()function a.Player:GetStickDist()return 0 end;a.Player.Animations={["attack"]=PLAYER_ATTACK1,["reload"]=PLAYER_RELOAD}a.Player.AnimEvents={["primary"]=PLAYERANIMEVENT_ATTACK_PRIMARY,["secondary"]=PLAYERANIMEVENT_ATTACK_SECONDARY}function a.Player:LookupAnimation(b)return self.Animations[b:lower()]||-1 end;function a.Player:LookupAnimEvent(c)return self.AnimEvents[c:lower()]||-1 end
--addons/!lpakr_out/lua/autorun/init_improvedstacker.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/init_improvedstacker.lua:
if SERVER then else include("vgui/stackercontrolpresets.lua")include("vgui/stackerdnumslider.lua")include("vgui/stackerpreseteditor.lua")end
--addons/ssrp_lfs/lua/lvs_framework/init.lua:

for _, filename in pairs( file.Find("lvs_framework/autorun/*.lua", "LUA") ) do
	if string.StartWith( filename, "sv_") then -- sv_ prefix only load serverside
		if SERVER then
			include("lvs_framework/autorun/"..filename)
		end

		continue
	end

	if string.StartWith( filename, "cl_") then -- cl_ prefix only load clientside
		if SERVER then
			AddCSLuaFile("lvs_framework/autorun/"..filename)
		else
			include("lvs_framework/autorun/"..filename)
		end

		continue
	end

	-- everything else is shared
	if SERVER then
		AddCSLuaFile("lvs_framework/autorun/"..filename)
	end
	include("lvs_framework/autorun/"..filename)
end

hook.Run( "LVS:Initialize" )

if CLIENT then
	return
end

function LVS:FixVelocity()
	local tbl = physenv.GetPerformanceSettings()

	if tbl.MaxVelocity < 4000 then
		local OldVel = tbl.MaxVelocity

		tbl.MaxVelocity = 4000
		physenv.SetPerformanceSettings(tbl)

		print("[LVS] Low MaxVelocity detected! Increasing! "..OldVel.." => 4000")
	end

	if tbl.MaxAngularVelocity < 7272 then
		local OldAngVel = tbl.MaxAngularVelocity

		tbl.MaxAngularVelocity = 7272
		physenv.SetPerformanceSettings(tbl)

		print("[LVS] Low MaxAngularVelocity detected! Increasing! "..OldAngVel.." => 7272")
	end
end
--addons/ssrp_lfs/lua/lvs_framework/autorun/lvs_entitytracker.lua:
LVS.VehiclesStored = LVS.VehiclesStored or {}
LVS.NPCsStored = LVS.NPCsStored or {}

function LVS:GetNPCs()
	for index, ent in pairs( LVS.NPCsStored ) do
		if not IsValid( ent ) then
			LVS.NPCsStored[ index ] = nil
		end
	end

	return LVS.NPCsStored
end

function LVS:GetVehicles()
	for index, ent in pairs( LVS.VehiclesStored ) do
		if not IsValid( ent ) then
			LVS.VehiclesStored[ index ] = nil
		end
	end

	return LVS.VehiclesStored
end

local Teams = {
	["npc_breen"] = 2,
	["npc_combine_s"] = 2,
	["npc_combinedropship"] = 2,
	["npc_combinegunship"] = 2,
	["npc_crabsynth"] = 2,
	["npc_cscanner"] = 2,
	["npc_helicopter"] = 2,
	["npc_manhack"] = 2,
	["npc_metropolice"] = 2,
	["npc_mortarsynth"] = 2,
	["npc_sniper"] = 2,
	["npc_stalker"] = 2,
	["npc_strider"] = 2,
	["monster_human_grunt"] = 2,
	["monster_human_assassin"] = 2,
	["monster_sentry"] = 2,

	["npc_kleiner"] = 1,
	["npc_monk"] = 1,
	["npc_mossman"] = 1,
	["npc_vortigaunt"] = 1,
	["npc_alyx"] = 1,
	["npc_barney"] = 1,
	["npc_citizen"] = 1,
	["npc_dog"] = 1,
	["npc_eli"] = 1,
	["monster_scientist"] = 1,
	["monster_barney"] = 1,

	["npc_fastzombie"] = 3,
	["npc_headcrab"] = 3,
	["npc_headcrab_black"] = 3,
	["npc_headcrab_fast"] = 3,
	["npc_antlion"] = 3,
	["npc_antlionguard"] = 3,
	["npc_zombie"] = 3,
	["npc_zombie_torso"] = 3,
	["npc_poisonzombie"] = 3,
	["monster_alien_grunt"] = 3,
	["monster_alien_slave"] = 3,
	["monster_gargantua"] = 3,
	["monster_bullchicken"] = 3,
	["monster_headcrab"] = 3,
	["monster_babycrab"] = 3,
	["monster_zombie"] = 3,
	["monster_houndeye"] = 3,
	["monster_nihilanth"] = 3,
	["monster_bigmomma"] = 3,
	["monster_babycrab"] = 3,
}
function LVS:GetNPCRelationship( npc_class )
	return Teams[ npc_class ] or 0
end

hook.Add( "OnEntityCreated", "!!!!lvsEntitySorter", function( ent )
	timer.Simple( FrameTime() * 2, function()
		if not IsValid( ent ) then return end

		if isfunction( ent.IsNPC ) and ent:IsNPC() then
			table.insert( LVS.NPCsStored, ent )
		end

		if ent.LVS then
			if CLIENT and ent.PrintName then
				language.Add( ent:GetClass(), ent.PrintName)
			end

			table.insert( LVS.VehiclesStored, ent )
		end

		if ent.LFS then
			table.insert( LVS.VehiclesStored, ent )
		end

		if SERVER then
			LVS:FixVelocity()
		end
	end )
end )
--addons/!lpakr_out/lua/pac3/core/client/integration_tools.lua:
local Angle=Angle;local RealTime=RealTime;local NULL=NULL;function pac.GenerateNewUniqueID(a,b)local a=table.Copy(a)b=b||tostring(a)local function c(d)for e,f in pairs(d.self)do if f!=""&&(e=="UniqueID"||e:sub(-3)=="UID")then d.self[e]=pac.Hash(b..f)end end;for g,d in pairs(d.children)do c(d)end end;return a end;do local h=false;hook.Add("ShouldDrawLocalPlayer","pac_draw_2d_entity",function()if h==true then return true end end)function pac.DrawEntity2D(i,j,k,l,m,n,o,p,q,r)pac.ShowEntityParts(i)pac.ForceRendering(true)i=i||pac.LocalPlayer;j=j||0;k=k||0;l=l||64;m=m||64;o=o||Angle(0,RealTime()*25,0)n=n||i:LocalToWorld(i:OBBCenter())-o:Forward()*i:BoundingRadius()*2;p=p||90;pac.SetupBones(i)cam.Start2D()cam.Start3D(n,o,p,j,k,l,m,q||5,r||4096)pac.FlashlightDisable(true)h=true;i:DrawModel()pac.RenderOverride(i,"opaque")pac.RenderOverride(i,"translucent")h=false;pac.FlashlightDisable(false)cam.End3D()cam.End2D()pac.ForceRendering(false)end end;function pac.SetupENT(s,t)s.pac_owner=s.pac_owner||t||"self"local function u(v,w)for g,d in ipairs(v:GetChildren())do if d:GetName():lower():find(w)then return d end;local d=u(d,w)if d then return d end end end;function s:FindPACPart(x,w)w=w:lower()if!x.self then for g,f in pairs(x)do local d=self:FindPACPart(f,w)if d:IsValid()then return d end end;return NULL end;self.pac_part_find_cache=self.pac_part_find_cache||{}local d=self.pac_outfits[x.self.UniqueID]||NULL;if d:IsValid()then local y=self.pac_part_find_cache[w]||NULL;if y:IsValid()then return y end;d=u(d,w)if d then self.pac_part_find_cache[w]=d;return d end end;return NULL end;function s:AttachPACPart(x,t,z)if!x.self then return self:AttachPACSession(x,t)end;if(x.self.OwnerName=="viewmodel"||x.self.OwnerName=="hands")&&self:IsWeapon()&&self.Owner:IsValid()&&self.Owner:IsPlayer()&&self.Owner!=pac.LocalPlayer then return end;if!z then x=pac.GenerateNewUniqueID(x,self:EntIndex())end;t=t||self.pac_owner||self.Owner;if self.pac_owner=="self"then t=self elseif self[self.pac_owner]then t=self[self.pac_owner]end;self.pac_outfits=self.pac_outfits||{}local d=self.pac_outfits[x.self.UniqueID]||NULL;if d:IsValid()then d:Remove()end;d=pac.CreatePart(x.self.ClassName,t,x)self.pac_outfits[x.self.UniqueID]=d;self.pac_part_find_cache={}if self.pac_show_in_editor==nil then self:SetShowPACPartsInEditor(false)self.pac_show_in_editor=nil end;return d end;function s:RemovePACPart(x,z)if!x.self then return self:RemovePACSession(x)end;if!z then x=pac.GenerateNewUniqueID(x,self:EntIndex())end;self.pac_outfits=self.pac_outfits||{}local d=self.pac_outfits[x.self.UniqueID]||NULL;if d:IsValid()then d:Remove()end;self.pac_part_find_cache={}end;function s:GetPACPartPosAng(x,w)local d=self:FindPACPart(x,w)if d:IsValid()&&d.GetWorldPosition then return d:GetWorldPosition(),d:GetWorldAngles()end end;function s:AttachPACSession(A)for g,d in pairs(A)do self:AttachPACPart(d)end end;function s:RemovePACSession(A)for g,d in pairs(A)do self:RemovePACPart(d)end end;function s:SetPACDrawDistance(B)self.pac_draw_distance=B end;function s:GetPACDrawDistance()return self.pac_draw_distance end;function s:SetShowPACPartsInEditor(C)self.pac_outfits=self.pac_outfits||{}for g,d in pairs(self.pac_outfits)do d:SetShowInEditor(C)end;self.pac_show_in_editor=C end;function s:GetShowPACPartsInEditor()return self.pac_show_in_editor end end;function pac.SetupSWEP(D,t)D.pac_owner=t||"Owner"pac.SetupENT(D,t)end;function pac.AddEntityClassListener(E,A,F,G)if A.self then A={A}end;G=0;F=F||function(i)return i:GetClass()==E end;local H="pac_auto_attach_"..E;local I={}local function J()for g,i in pairs(I)do if i:IsValid()then if i.Owner&&i.Owner:IsValid()then if!i.AttachPACSession then pac.SetupSWEP(i)end;if i.Owner:GetActiveWeapon()==i then if!i.pac_deployed then i:AttachPACSession(A)i.pac_deployed=true end;i.pac_last_owner=i.Owner else if i.pac_deployed then i:RemovePACSession(A)i.pac_deployed=false end end elseif(i.pac_last_owner||NULL):IsValid()&&!i.pac_last_owner:Alive()then if i.pac_deployed then i:RemovePACSession(A)i.pac_deployed=false end end end end end;local function K(i)if i:IsValid()&&F(i)then if i:IsWeapon()then I[i:EntIndex()]=i;hook.Add("Think",H,J)else pac.SetupENT(i)i:AttachPACSession(A)i:SetPACDrawDistance(G)end end end;local function L(i)if i:IsValid()&&F(i)&&i.pac_outfits then i:RemovePACSession(A)I[i:EntIndex()]=nil end end;for g,i in pairs(ents.GetAll())do K(i)end;hook.Add("EntityRemoved",H,L)hook.Add("OnEntityCreated",H,K)end;function pac.RemoveEntityClassListener(E,A,F)if A.self then A={A}end;F=F||function(i)return i:GetClass()==E end;for g,i in pairs(ents.GetAll())do if F(i)&&i.pac_outfits then i:RemovePACSession(A)end end;local H="pac_auto_attach_"..E;hook.Remove("Think",H)hook.Remove("EntityRemoved",H)hook.Remove("OnEntityCreated",H)end;timer.Simple(0,function()if easylua&&luadev then function easylua.PACSetClassListener(M,w,C)if C==nil then C=true end;luadev.RunOnClients(("pac.%s(%q, {%s})"):format(C&&"AddEntityClassListener"||"RemoveEntityClassListener",M,file.Read("pac3/"..w..".txt","DATA")))end end end)
--addons/!lpakr_out/lua/pac3/core/client/parts/beam.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/bone.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/custom_animation.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/decal.lua:
local a,b=pac.PartTemplate("base_movable")b.ClassName="decal"b.Group='effects'b.Icon='icon16/paintbrush.png'a:StartStorableVars()a:GetSet("Color",Vector(255,255,255),{editor_panel="color"})a:GetSet("Alpha",1,{editor_sensitivity=0.25,editor_clamp={0,1}})a:GetSet("Material","")a:GetSet("IgnoreOwner",true)a:EndStorableVars()function b:SetMaterial(c)self.Material=c;if!pac.Handleurltex(self,c)then self.Materialm=pac.Material(c,self)self:CallRecursive("OnMaterialChanged")end end;function b:OnShow()local d,e=self:GetDrawPosition()if self.Materialm then local f;if self.IgnoreOwner then f=ents.FindInSphere(d,100)end;local g=util.TraceLine({start=d,endpos=d+e:Forward()*1000,filter=f})if g.Hit then util.DecalEx(self.Materialm,g.Entity:IsValid()&&g.Entity||Entity(0),g.HitPos+g.Normal,-g.HitNormal,Color(self.Color.x,self.Color.y,self.Color.z,self.Alpha*255),1,1)end end end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/event.lua:
local FrameTime=FrameTime;local CurTime=CurTime;local NULL=NULL;local Vector=Vector;local util=util;local SysTime=SysTime;local a,b=pac.PartTemplate("base")b.ClassName="event"b.ThinkTime=0;b.AlwaysThink=true;b.Icon='icon16/clock.png'a:StartStorableVars()a:GetSet("Event","",{enums=function(c)local d={}for e,f in pairs(c.Events)do if!f.IsAvailable||f:IsAvailable(c)then d[e]=f end end;return d end})a:GetSet("Operator","find simple",{enums=function(c)local g={}for e,h in ipairs(c.Operators)do g[h]=h end;return g end})a:GetSet("Arguments","",{hidden=true})a:GetSet("Invert",true)a:GetSet("RootOwner",true)a:GetSet("AffectChildrenOnly",false)a:GetSet("ZeroEyePitch",false)a:GetSetPart("TargetPart")a:EndStorableVars()function b:SetEvent(f)local i=self.Arguments==""||self.Arguments!=""&&self.Event!=""&&self.Event!=f;self.Event=f;self:SetWarning()self:GetDynamicProperties(i)end;local function j(k)if k=="string"then return""elseif k=="number"then return 0 elseif k=="boolean"then return false end end;local function l(k,m)if k=="number"then return tonumber(m)||0 elseif k=="boolean"then return tobool(m)||false end;return m end;local function n(k,m)if m==nil then m=j(k)end;return l(k,m)end;function b:GetDynamicProperties(o)local p=self.Events[self.Event]if!p then return end;local g={}for q,r in ipairs(p:GetArguments())do local s,k,t=unpack(r)t=t||{}t.group=t.group||"arguments"g[s]={key=s,get=function()local u={self:GetParsedArguments(p)}return n(k,u[q])end,set=function(m)local u={self:GetParsedArguments(p)}u[q]=m;self:ParseArguments(unpack(u))end,udata=t}local r=g[s]if r.get()==nil||o then if t.default then r.set(t.default)else r.set(nil)end end end;return g end;local function v(self,w)if self.ZeroEyePitch then w.p=0 end;return w end;local function x(c)if!c.GetWorldPosition then return vector_origin end;local y=c:GetWorldPosition()-(c.last_pos||Vector(0,0,0))c.last_pos=c:GetWorldPosition()c.last_vel_smooth=c.last_vel_smooth||Vector(0,0,0)c.last_vel_smooth=c.last_vel_smooth+(c:GetWorldPosition()-c.last_vel_smooth)*FrameTime()*4;return c.last_vel_smooth end;local function z(A)return A==pac.LocalViewModel&&pac.LocalPlayer||A end;local function B(self)if self.RootOwner then return z(self:GetRootPart():GetOwner())else return z(self:GetOwner())end end;local C={}for D,h in pairs(_G)do if isstring(D)&&isnumber(h)&&D:sub(0,9)=="MOVETYPE_"then C[h]=D:sub(10):lower()end end;b.Events={}b.OldEvents={random={arguments={{compare="number"}},callback=function(self,A,E)return self:NumberOperator(math.random(),E)end},randint={arguments={{compare="number"},{min="number"},{max="number"}},callback=function(self,A,E,F,G)F=F||0;G=G||1;if F>G then return 0 end;return self:NumberOperator(math.random(F,G),E)end},random_timer={arguments={{min="number"},{max="number"},{holdtime="number"}},callback=function(self,A,F,G,H)H=H||0.1;F=F||0;G=G||1;if F>G then return false end;if self.RndTime==nil then self.RndTime=0 end;if!self.SetRandom then self.RndTime=CurTime()+math.random(F,G)self.SetRandom=true elseif self.SetRandom then if CurTime()>self.RndTime then if CurTime()<self.RndTime+H then return true end;self.SetRandom=false;return false end end;return false end},timerx={arguments={{seconds="number"},{reset_on_hide="boolean"},{synced_time="boolean"}},nice=function(self,A,I)return"timerx: "..("%.2f"):format(self.number||0,2).." "..self:GetOperator().." "..I.." seconds?"end,callback=function(self,A,I,J,K)local L=K&&CurTime()||RealTime()self.time=self.time||L;self.timerx_reset=J;if self.AffectChildrenOnly&&self:IsHiddenBySomethingElse()then return false end;self.number=L-self.time;return self:NumberOperator(self.number,I)end},timersys={arguments={{seconds="number"},{reset_on_hide="boolean"}},callback=function(self,A,I,J)local L=SysTime()self.time=self.time||L;self.timerx_reset=J;if self.AffectChildrenOnly&&self:IsHiddenBySomethingElse()then return false end;return self:NumberOperator(L-self.time,I)end},map_name={arguments={{find="string"}},callback=function(self,A,M)return self:StringOperator(game.GetMap(),M)end},fov={arguments={{fov="number"}},callback=function(self,A,N)A=z(A)if A.GetFOV then return self:NumberOperator(A:GetFOV(),N)end;return 0 end},health_lost={arguments={{amount="number"}},callback=function(self,A,O)A=z(A)if A.Health then local P=self.pac_lastdamage||0;if self.dmgCD==nil then self.dmgCD=0 end;if!self.pac_wasdmg then local Q=P-A:Health()self.pac_lastdamage=A:Health()if Q==0 then return false end;if self:NumberOperator(Q,O)then self.pac_wasdmg=true;self.dmgCD=pac.RealTime+0.2 end else if self.pac_wasdmg&&pac.RealTime>self.dmgCD then self.pac_wasdmg=false end end;return self.pac_wasdmg end;return false end},holdtype={arguments={{find="string"}},callback=function(self,A,M)A=z(A)local R=A.GetActiveWeapon&&A:GetActiveWeapon()||NULL;if R:IsValid()&&self:StringOperator(R:GetHoldType(),M)then return true end end},is_crouching={callback=function(self,A)A=z(A)return A.Crouching&&A:Crouching()end},is_typing={callback=function(self,A)A=self:GetPlayerOwner()return A.IsTyping&&A:IsTyping()end},using_physgun={callback=function(self,A)A=self:GetPlayerOwner()local S=A.pac_drawphysgun_event_part;if!S then S={}A.pac_drawphysgun_event_part=S end;S[self]=true;return A.pac_drawphysgun_event!=nil end},eyetrace_entity_class={arguments={{class="string"}},callback=function(self,A,M)if A.GetEyeTrace then A=A:GetEyeTrace().Entity;if self:StringOperator(A:GetClass(),M)then return true end end end},owner_health={arguments={{health="number"}},callback=function(self,A,T)A=z(A)if A.Health then return self:NumberOperator(A:Health(),T)end;return 0 end},owner_max_health={arguments={{health="number"}},callback=function(self,A,T)A=z(A)if A.GetMaxHealth then return self:NumberOperator(A:GetMaxHealth(),T)end;return 0 end},owner_alive={callback=function(self,A)A=z(A)if A.Alive then return A:Alive()end;return 0 end},owner_armor={arguments={{armor="number"}},callback=function(self,A,T)A=z(A)if A.Armor then return self:NumberOperator(A:Armor(),T)end;return 0 end},owner_scale_x={arguments={{scale="number"}},callback=function(self,A,T)A=z(A)return self:NumberOperator(A.pac_model_scale&&A.pac_model_scale.x||A.GetModelScale&&A:GetModelScale()||1,T)end},owner_scale_y={arguments={{scale="number"}},callback=function(self,A,T)A=z(A)return self:NumberOperator(A.pac_model_scale&&A.pac_model_scale.y||A.GetModelScale&&A:GetModelScale()||1,T)end},owner_scale_z={arguments={{scale="number"}},callback=function(self,A,T)A=z(A)return self:NumberOperator(A.pac_model_scale&&A.pac_model_scale.z||A.GetModelScale&&A:GetModelScale()||1,T)end},pose_parameter={arguments={{name="string"},{num="number"}},callback=function(self,A,U,T)A=z(A)return self:NumberOperator(A:GetPoseParameter(U),T)end},speed={arguments={{speed="number"}},callback=function(self,A,T)A=z(A)return self:NumberOperator(A:GetVelocity():Length(),T)end},is_under_water={arguments={{level="number"}},callback=function(self,A,T)A=z(A)return self:NumberOperator(A:WaterLevel(),T)end},is_on_fire={callback=function(self,A)A=z(A)return A:IsOnFire()end},client_spawned={arguments={{time="number"}},callback=function(self,A,L)L=L||0.1;A=z(A)if A.pac_playerspawn&&A.pac_playerspawn+L>pac.RealTime then return true end end},is_client={callback=function(self,A)A=z(A)return self:GetPlayerOwner()==A end},is_flashlight_on={callback=function(self,A)A=z(A)return A.FlashlightIsOn&&A:FlashlightIsOn()end},collide={callback=function(self,A)A.pac_event_collide_callback=A.pac_event_collide_callback||A:AddCallback("PhysicsCollide",function(A,p)A.pac_event_collision_data=p end)if A.pac_event_collision_data then local p=A.pac_event_collision_data;A.pac_event_collision_data=nil;return true end;return false end},ranger={arguments={{distance="number"},{compare="number"},{npcs_and_players_only="boolean"}},userdata={{editor_panel="ranger",ranger_property="distance"},{editor_panel="ranger",ranger_property="compare"}},callback=function(self,A,V,E,W)local X=self:GetParentEx()if X:IsValid()&&X.GetWorldPosition then self:SetWarning()V=V||1;E=E||0;local Y=util.TraceLine({start=X:GetWorldPosition(),endpos=X:GetWorldPosition()+X:GetWorldAngles():Forward()*V,filter=A})if W&&(!Y.Entity:IsPlayer()&&!Y.Entity:IsNPC())then return false end;return self:NumberOperator(Y.Fraction*V,E)else local Z=X:GetNiceName()local U=X:GetName()self:SetWarning(("ranger doesn't work on [%s] %s"):format(Z,Z!=U&&"("..U..")"||""))end end},is_on_ground={arguments={{exclude_noclip="boolean"}},callback=function(self,A,_)A=z(A)if _&&A:GetMoveType()==MOVETYPE_NOCLIP then return false end;local a0=A:BoundingRadius()/2;local a1=2;for a2=-a1,a1 do for a3=-a1,a1 do local a4=Vector(a2/a1,a3/a1,0)*a0;local Y=util.TraceLine({start=A:GetPos()+a4+Vector(0,0,2.5),endpos=A:GetPos()+a4/1.25+Vector(0,0,-10),filter=A})if Y.Hit&&math.abs(Y.HitNormal.z)>0.70 then return true end end end;return false end},is_touching={arguments={{extra_radius="number"}},userdata={{editor_panel="is_touching",is_touching_property="extra_radius"}},callback=function(self,A,a5)a5=a5||0;local a6=A:BoundingRadius()if a6==0&&IsValid(A.pac_projectile)then a6=A.pac_projectile:GetRadius()end;a6=math.max(a6+a5+1,1)local a7=Vector(-1,-1,-1)local a8=Vector(1,1,1)local a9=A:WorldSpaceCenter()a7=a7*a6;a8=a8*a6;local aa=util.TraceHull({start=a9,endpos=a9,maxs=a8,mins=a7,filter=A})return aa.Hit end},is_in_noclip={callback=function(self,A)A=z(A)return A:GetMoveType()==MOVETYPE_NOCLIP&&(!A.GetVehicle||!A:GetVehicle():IsValid())end},is_voice_chatting={callback=function(self,A)A=z(A)return A.IsSpeaking&&A:IsSpeaking()end},ammo={arguments={{primary="boolean"},{amount="number"}},userdata={{editor_onchange=function(c,T)return math.Round(T)end}},callback=function(self,A,ab,O)A=z(A)A=A.GetActiveWeapon&&A:GetActiveWeapon()||A;if A:IsValid()then return self:NumberOperator(A.Clip1&&(ab&&A:Clip1()||A:Clip2())||0,O)end end},total_ammo={arguments={{ammo_id="string"},{amount="number"}},callback=function(self,A,ac,O)if A.GetAmmoCount then ac=tonumber(ac)||ac:lower()if ac=="primary"then local R=A.GetActiveWeapon&&A:GetActiveWeapon()||NULL;return self:NumberOperator(R:IsValid()&&A:GetAmmoCount(R:GetPrimaryAmmoType())||0,O)elseif ac=="secondary"then local R=A.GetActiveWeapon&&A:GetActiveWeapon()||NULL;return self:NumberOperator(R:IsValid()&&A:GetAmmoCount(R:GetSecondaryAmmoType())||0,O)else return self:NumberOperator(A:GetAmmoCount(ac),O)end end end},clipsize={arguments={{primary="boolean"},{amount="number"}},callback=function(self,A,ab,O)A=z(A)A=A.GetActiveWeapon&&A:GetActiveWeapon()||A;if A:IsValid()then return self:NumberOperator(A.GetMaxClip1&&(ab&&A:GetMaxClip1()||A:GetMaxClip2())||0,O)end end},vehicle_class={arguments={{find="string"}},callback=function(self,A,M)A=z(A)A=A.GetVehicle&&A:GetVehicle()||NULL;if A:IsValid()then return self:StringOperator(A:GetClass(),M)end end},vehicle_model={arguments={{find="string"}},callback=function(self,A,M)A=z(A)A=A.GetVehicle&&A:GetVehicle()||NULL;if A:IsValid()&&A:GetModel()then return self:StringOperator(A:GetModel():lower(),M)end end},driver_name={arguments={{find="string"}},callback=function(self,A,M)A=A.GetDriver&&A:GetDriver()||NULL;if A:IsValid()then return self:StringOperator(A:GetName(),M)end end},entity_class={arguments={{find="string"}},callback=function(self,A,M)return self:StringOperator(A:GetClass(),M)end},weapon_class={arguments={{find="string"},{hide="boolean"}},callback=function(self,A,M,ad)A=z(A)local R=A.GetActiveWeapon&&A:GetActiveWeapon()||NULL;if R:IsValid()then local ae=R:GetClass()local af=self:StringOperator(ae,M)if ae=="hands"&&!af then af=self:StringOperator("none",M)end;if af then R:SetNoDraw(ad)R.pac_weapon_class=true;return true end end end},has_weapon={arguments={{find="string"}},callback=function(self,A,M)A=z(A)local g=A.GetWeapons&&A:GetWeapons()if g then for ag,m in pairs(g)do m=m:GetClass()if self:StringOperator(m,M)then return true end end end end},model_name={arguments={{find="string"}},callback=function(self,A,M)return self:StringOperator(A:GetModel(),M)end},sequence_name={arguments={{find="string"}},nice=function(self,A)return self.sequence_name||"invalid sequence"end,callback=function(self,A,M)A=B(self)self.sequence_name=A:GetSequenceName(A:GetSequence())return self:StringOperator(self.sequence_name,M)end},timer={arguments={{interval="number"},{offset="number"}},callback=function(self,A,ah,ai)ah=ah||1;ai=ai||0;if ah==0||ah<FrameTime()then self.timer_hack=!self.timer_hack;return self.timer_hack end;return(CurTime()+ai)%ah>ah/2 end},animation_event={arguments={{find="string"},{time="number"}},nice=function(self)return self.anim_name||""end,callback=function(self,A,M,L)L=L||0.1;A=B(self)local p=A.pac_anim_event;local aj=false;if p&&(self:StringOperator(p.name,M)&&(L==0||p.time+L>pac.RealTime))then p.reset=false;aj=true end;if aj then self.anim_name=p.name else self.anim_name=nil end;return aj end},fire_bullets={arguments={{find_ammo="string"},{time="number"}},callback=function(self,A,M,L)L=L||0.1;A=z(A)local p=A.pac_fire_bullets;local aj=false;if p&&(self:StringOperator(p.name,M)&&(L==0||p.time+L>pac.RealTime))then p.reset=false;aj=true end;return aj end},emit_sound={arguments={{find_sound="string"},{time="number"},{mute="boolean"}},callback=function(self,A,M,L,ak)L=L||0.1;A=z(A)local p=A.pac_emit_sound;local aj=false;if p&&(self:StringOperator(p.name,M)&&(L==0||p.time+L>pac.RealTime))then p.reset=false;aj=true;if ak then p.mute_me=true end end;return aj end},command={arguments={{find="string"},{time="number"},{hide_in_eventwheel="boolean"}},userdata={{default="change_me",editor_friendly="CommandName"},{default=0.1,editor_friendly="EventDuration"},{default=false,group="event wheel",editor_friendly="HideInEventWheel"}},nice=function(self,A,M,L)M=M||"?"L=L||"?"return"command: "..M.." | ".."duration: "..L end,callback=function(self,A,M,L)L=L||0.1;local al=self:GetPlayerOwner()local am=al.pac_command_events;if am then local af=nil;for ag,p in pairs(am)do if self:StringOperator(p.name,M)then if p.on>0 then af=p.on==1 elseif p.time+L>pac.RealTime then af=true end end end;return af end end},say={arguments={{find="string"},{time="number"},{all_players="boolean"}},callback=function(self,A,M,L,an)L=L||0.1;A=z(A)if an then for ag,al in ipairs(player.GetAll())do local p=al.pac_say_event;if p&&self:StringOperator(p.str,M)&&p.time+L>pac.RealTime then return true end end else local owner=self:GetRootPart():GetOwner()if owner:IsValid()then local p=owner.pac_say_event;if p&&self:StringOperator(p.str,M)&&p.time+L>pac.RealTime then return true end end end end},owner_velocity_length={arguments={{speed="number"}},callback=function(self,A,ao)local X=self:GetParentEx()A=z(A)if X:IsValid()&&A:IsValid()then return self:NumberOperator(B(X):GetVelocity():Length(),ao)end;return 0 end},owner_velocity_forward={arguments={{speed="number"}},callback=function(self,A,ao)A=z(A)if A:IsValid()then return self:NumberOperator(v(self,A:EyeAngles()):Forward():Dot(A:GetVelocity()),ao)end;return 0 end},owner_velocity_right={arguments={{speed="number"}},callback=function(self,A,ao)A=z(A)if A:IsValid()then return self:NumberOperator(v(self,A:EyeAngles()):Right():Dot(A:GetVelocity()),ao)end;return 0 end},owner_velocity_up={arguments={{speed="number"}},callback=function(self,A,ao)A=z(A)if A:IsValid()then return self:NumberOperator(v(self,A:EyeAngles()):Up():Dot(A:GetVelocity()),ao)end;return 0 end},owner_velocity_world_forward={arguments={{speed="number"}},callback=function(self,A,ao)A=z(A)if owner:IsValid()then return self:NumberOperator(A:GetVelocity()[1],ao)end;return 0 end},owner_velocity_world_right={arguments={{speed="number"}},callback=function(self,A,ao)A=z(A)if A:IsValid()then return self:NumberOperator(A:GetVelocity()[2],ao)end;return 0 end},owner_velocity_world_up={arguments={{speed="number"}},callback=function(self,A,ao)A=z(A)if A:IsValid()then return self:NumberOperator(A:GetVelocity()[3],ao)end;return 0 end},parent_velocity_length={arguments={{speed="number"}},callback=function(self,A,ao)local X=self:GetParentEx()if!self.TargetPart:IsValid()&&X:HasParent()then X=X:GetParent()end;if X:IsValid()then return self:NumberOperator(x(X):Length(),ao)end;return 0 end},parent_velocity_forward={arguments={{speed="number"}},callback=function(self,A,ao)local X=self:GetParentEx()if!self.TargetPart:IsValid()&&X:HasParent()then X=X:GetParent()end;if X:IsValid()&&X.GetWorldAngles then return self:NumberOperator(X:GetWorldAngles():Forward():Dot(x(X)),ao)end;return 0 end},parent_velocity_right={arguments={{speed="number"}},callback=function(self,A,ao)local X=self:GetParentEx()if!self.TargetPart:IsValid()&&X:HasParent()then X=X:GetParent()end;if X:IsValid()&&X.GetWorldAngles then return self:NumberOperator(X:GetWorldAngles():Right():Dot(x(X)),ao)end;return 0 end},parent_velocity_up={arguments={{speed="number"}},callback=function(self,A,ao)local X=self:GetParentEx()if!self.TargetPart:IsValid()&&X:HasParent()then X=X:GetParent()end;if X:IsValid()&&X.GetWorldAngles then return self:NumberOperator(X:GetWorldAngles():Up():Dot(x(X)),ao)end;return 0 end},parent_scale_x={arguments={{scale="number"}},callback=function(self,A,T)local X=self:GetParentEx()if!self.TargetPart:IsValid()&&X:HasParent()then X=X:GetParent()end;if X:IsValid()then return self:NumberOperator(X.Type=="part"&&X.Scale&&X.Scale.x*X.Size||X.pac_model_scale&&X.pac_model_scale.x||X.GetModelScale&&X:GetModelScale()||1,T)end;return 1 end},parent_scale_y={arguments={{scale="number"}},callback=function(self,A,T)local X=self:GetParentEx()if!self.TargetPart:IsValid()&&X:HasParent()then X=X:GetParent()end;if X:IsValid()then return self:NumberOperator(X.Type=="part"&&X.Scale&&X.Scale.y*X.Size||X.pac_model_scale&&X.pac_model_scale.y||X.GetModelScale&&X:GetModelScale()||1,T)end;return 1 end},parent_scale_z={arguments={{scale="number"}},callback=function(self,A,T)local X=self:GetParentEx()if!self.TargetPart:IsValid()&&X:HasParent()then X=X:GetParent()end;if X:IsValid()then return self:NumberOperator(X.Type=="part"&&X.Scale&&X.Scale.z*X.Size||X.pac_model_scale&&X.pac_model_scale.z||X.GetModelScale&&X:GetModelScale()||1,T)end;return 1 end},gravitygun_punt={arguments={{time="number"}},callback=function(self,A,L)L=L||0.1;A=z(A)local ap=A.pac_gravgun_punt;if ap&&ap+L>pac.RealTime then return true end end},movetype={arguments={{find="string"}},callback=function(self,A,M)local aq=A:GetMoveType()if C[aq]then return self:StringOperator(C[aq],M)end end},dot_forward={arguments={{normal="number"}},callback=function(self,A,ar)local owner=self:GetRootPart():GetOwner()if owner:IsValid()then local w=owner:EyeAngles()w.p=0;return self:NumberOperator(pac.EyeAng:Forward():Dot(w:Forward()),ar)end;return 0 end},dot_right={arguments={{normal="number"}},callback=function(self,A,ar)local owner=self:GetRootPart():GetOwner()if owner:IsValid()then local w=owner:EyeAngles()w.p=0;return self:NumberOperator(pac.EyeAng:Right():Dot(w:Forward()),ar)end;return 0 end},flat_dot_forward={arguments={{normal="number"}},callback=function(self,A,ar)local owner=self:GetRootPart():GetOwner()if owner:IsValid()then local w=owner:EyeAngles()w.p=0;w.r=0;local as=pac.EyePos-owner:EyePos()as[3]=0;as:Normalize()return self:NumberOperator(as:Dot(w:Forward()),ar)end;return 0 end},flat_dot_right={arguments={{normal="number"}},callback=function(self,A,ar)local owner=self:GetRootPart():GetOwner()if owner:IsValid()then local w=owner:EyeAngles()w.p=0;w.r=0;local as=pac.EyePos-owner:EyePos()as[3]=0;as:Normalize()return self:NumberOperator(as:Dot(w:Right()),ar)end;return 0 end}}do local at={}local au={}for s,m in pairs(_G)do if isstring(s)&&isnumber(m)then if s:sub(0,4)=="KEY_"&&!s:find("_LAST$")&&!s:find("_FIRST$")&&!s:find("_COUNT$")then at[m]=s:sub(5):lower()au[at[m]]=m elseif(s:sub(0,6)=="MOUSE_"||s:sub(0,9)=="JOYSTICK_")&&!s:find("_LAST$")&&!s:find("_FIRST$")&&!s:find("_COUNT$")then at[m]=s:lower()au[at[m]]=m end end end;pac.key_enums=at;net.Receive("pac.BroadcastPlayerButton",function()local al=net.ReadEntity()if!al:IsValid()then return end;if al==pac.LocalPlayer&&(pace&&pace.IsFocused()||gui.IsConsoleVisible())then return end;local s=net.ReadUInt(8)local av=net.ReadBool()s=pac.key_enums[s]||s;al.pac_buttons=al.pac_buttons||{}al.pac_buttons[s]=av end)b.OldEvents.button={arguments={{button="string"}},userdata={{enums=function()return at end}},nice=function(self,A,aw)local al=self:GetPlayerOwner()local ax={}if al.pac_buttons then for D,h in pairs(al.pac_buttons)do if h then table.insert(ax,"\""..tostring(D).."\"")end end end;ax=table.concat(ax," or ")if ax==""then ax="-"end;return self:GetOperator().." \""..aw.."\"".." in ("..ax..")"end,callback=function(self,A,aw)local al=self:GetPlayerOwner()if al==pac.LocalPlayer then al.pac_broadcast_buttons=al.pac_broadcast_buttons||{}if!al.pac_broadcast_buttons[aw]then local m=au[aw:lower()]if m then net.Start("pac.AllowPlayerButtons")net.WriteUInt(m,8)net.SendToServer()end;al.pac_broadcast_buttons[aw]=true end end;local ay=al.pac_buttons;if ay then return ay[aw]end end}end;do local az={}az.__name='undefined'AccessorFunc(az,'__name','Name')AccessorFunc(az,'__name','EventName')AccessorFunc(az,'__name','Nick')function az:IsValid(f)return true end;function az:IsAvailable(aA)return true end;function az:GetArguments()self.__registeredArguments=self.__registeredArguments||{}return self.__registeredArguments end;function az:AppendArgument(aB,aC,aD)self.__registeredArguments=self.__registeredArguments||{}if!aC then error('No Type of argument was specified!')end;if aC!='number'&&aC!='string'&&aC!='boolean'then error('Invalid Type of argument was passed. Valids are number, string or boolean')end;for e,p in ipairs(self.__registeredArguments)do if p[1]==aB then error('Argument with key '..aB..' already exists!')end end;self.__registeredArguments=self.__registeredArguments||{}table.insert(self.__registeredArguments,{aB,aC,aD})end;function az:PopArgument(aB)for e,p in ipairs(self.__registeredArguments)do if p[1]==aB then return true,e,table.remove(self.__registeredArguments,e)end end;return false end;az.RemoveArgument=az.PopArgument;az.SpliceArgument=az.PopArgument;function az:GetClass()return self.__classname end;function az:Think(f,A,...)return false end;function az:GetNiceName(c,A)if self.extra_nice_name then return self.extra_nice_name(c,A,c:GetParsedArgumentsForObject(self))end;local aE=c:GetEvent()if c:GetArguments()!=""then local u=c:GetArguments():gsub(";"," or ")if!tonumber(u)then u=[["]]..u..[["]]end;aE=aE.." "..c:GetOperator().." "..u end;return pac.PrettifyName(aE)end;local aF={__index=function(self,s)if s=='__class'||s=='__classname'then return rawget(getmetatable(self),'__classname')end;if rawget(self,s)!=nil then return rawget(self,s)end;return az[s]end,__call=function(self)local aG=pac.CreateEvent(self:GetClass())for D,h in pairs(self)do if!istable(h)then aG[D]=h else aG[D]=table.Copy(h)end end;return aG end}function pac.GetEventMetatable()return az end;function pac.CreateEvent(aH,aI)if!aH then error('No classname was specified!')end;local aG=setmetatable({},{__index=aF.__index,__call=aF.__call,__classname=aH})aG.__registeredArguments={}aG:SetName(aH)if aI then for e,p in pairs(aI)do aG:AppendArgument(p[1],p[2],p[3])end end;return aG end;function pac.RegisterEvent(aJ)local Z=aJ:GetClass()if b.Events[Z]then pac.Message('WARN: Registering event with already existing classname!: '..Z)end;b.Events[Z]=aJ end;for Z,p in pairs(b.OldEvents)do local aK=p.arguments;local aL=p.callback;local aM=pac.CreateEvent(Z)if aK then for e,aN in ipairs(aK)do local s,aO=next(aN)aM:AppendArgument(s,aO,p.userdata&&p.userdata[e]||nil)end end;aM.extra_nice_name=p.nice;function aM:Think(f,A,...)return aL(f,A,...)end;pac.RegisterEvent(aM)end;timer.Simple(0,function()hook.Call('PAC3RegisterEvents',nil,pac.CreateEvent,pac.RegisterEvent)end)end;do local aP=pac.animations;local f={name="custom_animation_frame",nice=function(self,A,aQ)if aQ==""then self:SetWarning("no animation selected")return"no animation"end;local c=pac.GetLocalPart(aQ)if!IsValid(c)then self:SetError("invalid animation selected")return"invalid animation"end;self:SetWarning()return c:GetName()end,args={{"animation","string",{enums=function(c)local d={}local aR=pac.GetLocalParts()for e,c in pairs(aR)do if c.ClassName=="custom_animation"then d[e]=c end end;return d end}},{"frame_start","number",{editor_onchange=function(self,T)local aS=pace.current_part:GetProperty("animation")if aS!=""then local c=pac.GetLocalPart(aS)local p=util.JSONToTable(c:GetData())return math.Clamp(math.ceil(T),1,#p.FrameData)end end}},{"frame_end","number",{editor_onchange=function(self,T)local aS=pace.current_part:GetProperty("animation")local aT=pace.current_part:GetProperty("frame_start")if aS!=""then local c=pac.GetLocalPart(aS)local p=util.JSONToTable(c:GetData())return math.Clamp(math.ceil(T),aT,#p.FrameData)end end}}},available=function(self,aA)return next(aP.registered)&&true||false end,func=function(self,aA,A,aQ,aU,aV)local aU=aU||1;local aV=aV||1;if!aQ||aQ==""then return end;if!IsValid(A)then return end;if!next(aP.playing)then return end;for e,h in ipairs(aP.playing)do if h==A then local c=pac.GetPartFromUniqueID(pac.Hash(A),aQ)if!IsValid(c)then return end;local aW,aX=aP.GetEntityAnimationFrame(A,c:GetAnimID())if!aW||!aX then return end;return aW>=aU&&aW<=aV end end end}local aM=pac.CreateEvent(f.name,f.args)aM.Think=f.func;aM.IsAvailable=f.available;aM.extra_nice_name=f.nice;pac.RegisterEvent(aM)end;do local aY=FindMetaTable('Player')local aZ=engine.ActiveGamemode;local a_=function()return aZ()=='darkrp'end;local am={{name='is_arrested',args={},available=function()return aY.isArrested!=nil end,func=function(self,aA,A)A=z(A)return A.isArrested&&A:isArrested()||false end},{name='is_wanted',args={},available=function()return aY.isWanted!=nil end,func=function(self,aA,A)A=z(A)return A.isWanted&&A:isWanted()||false end},{name='is_police',args={},available=function()return aY.isCP!=nil end,func=function(self,aA,A)A=z(A)return A.isCP&&A:isCP()||false end},{name='wanted_reason',args={{'find','string'}},available=function()return aY.getWantedReason!=nil&&aY.isWanted!=nil end,func=function(self,aA,A,M)A=z(A)return aA:StringOperator(A.isWanted&&A.getWantedReason&&A:isWanted()&&A:getWantedReason()||'',M)end},{name='is_cook',args={},available=function()return aY.isCook!=nil end,func=function(self,aA,A)A=z(A)return A.isCook&&A:isCook()||false end},{name='is_hitman',args={},available=function()return aY.isHitman!=nil end,func=function(self,aA,A)A=z(A)return A.isHitman&&A:isHitman()||false end},{name='has_hit',args={},available=function()return aY.hasHit!=nil end,func=function(self,aA,A)A=z(A)return A.hasHit&&A:hasHit()||false end},{name='hit_price',args={{'amount','number'}},available=function()return aY.getHitPrice!=nil end,func=function(self,aA,A,O)A=z(A)return aA:NumberOperator(A.getHitPrice&&A:getHitPrice()||0,O)end}}for D,h in ipairs(am)do local b0=h.available;local aM=pac.CreateEvent(h.name,h.args)aM.Think=h.func;function aM:IsAvailable()return a_()&&b0()end;pac.RegisterEvent(aM)end end;function b:GetParentEx()local X=self:GetTargetPart()if X:IsValid()then return X end;return self:GetParent()end;function b:GetNiceName()local b1=self:GetEvent()if!b.Events[b1]then return"unknown event"end;return b.Events[b1]:GetNiceName(self,B(self))end;local function b2(c,b3)if c.active_events_ref_count>0&&!c.active_events[b3]then return true end;return c.Hide end;function b:IsHiddenBySomethingElse(b4)if b2(self,self)then return true end;if b4 then return false end;for ag,X in ipairs(self:GetParentList())do if b2(X,self)then return true end end;return false end;local function b5(self,A,aM)if!aM:IsAvailable(self)then return true end;local aj=false;if aM.ParseArguments then aj=aM:Think(self,A,aM:ParseArguments(self))||false else aj=aM:Think(self,A,self:GetParsedArgumentsForObject(aM))||false end;if self.Invert then aj=!aj end;if b2(self,self)then aj=self.Invert end;self.is_active=aj;return aj end;b.last_event_triggered=false;function b:OnThink()local A=B(self)if!A:IsValid()then return end;local p=b.Events[self.Event]if!p then return end;self:TriggerEvent(b5(self,A,p))if pace&&pace.IsActive()&&self.Name==""then if self.pace_properties&&self.pace_properties["Name"]&&self.pace_properties["Name"]:IsValid()then self.pace_properties["Name"]:SetText(self:GetNiceName())end end end;function b:TriggerEvent(aj)self.event_triggered=aj;if self.AffectChildrenOnly then for ag,b6 in ipairs(self:GetChildren())do b6:SetEventTrigger(self,aj)end else local X=self:GetParent()if X:IsValid()then X:SetEventTrigger(self,aj)end end end;b.Operators={"equal","not equal","above","equal or above","below","equal or below","find","find simple","maybe"}pac.EventArgumentCache={}function b:ParseArguments(...)local aE=""local u={...}for s,m in pairs(u)do local b7=type(m)if b7=="boolean"then m=m&&"1"||"0"elseif b7=="string"then m=tostring(m)||""elseif b7=="number"then m=tostring(m)||"0"end;if s==#u then aE=aE..m else aE=aE..m.."@@"end end;self.Arguments=aE end;function b:GetParsedArguments(aM)if!aM then return end;if aM.ParseArguments then return aM:ParseArguments(self)end;return self:GetParsedArgumentsForObject(aM)end;function b:GetParsedArgumentsForObject(aM)if!aM then return end;local b8=self.Arguments;local b9=b8 ..tostring(aM)if pac.EventArgumentCache[b9]then return unpack(pac.EventArgumentCache[b9])end;local u=b8:Split("@@")for e,ba in pairs(aM:GetArguments())do local k=ba[2]if u[e]!=nil then if k=="boolean"then u[e]=tonumber(u[e])!=0 elseif k=="number"then u[e]=tonumber(u[e])||0 elseif k=="string"then u[e]=tostring(u[e])||""end end end;pac.EventArgumentCache[b9]=u;return unpack(u)end;local bb={}local function bc(bd,be,bf,...)for ag,aj in pairs(be)do if bf(bd,aj,...)then return true end end;return false end;function b:StringOperator(bd,aj)local u=bb[aj]if!u then u=aj:Split(";")bb[aj]=u end;if!self.Operator||!bd||!aj then return false elseif self.Operator=="equal"then return bc(bd,u,function(a2,a3)return a2==a3 end)elseif self.Operator=="not equal"then return bc(bd,u,function(a2,a3)return a2!=a3 end)elseif self.Operator=="find"then return bc(bd,u,pac.StringFind)elseif self.Operator=="find simple"then return bc(bd,u,pac.StringFind,true)elseif self.Operator=="changed"then if bd!=self.changed_last_a then self.changed_last_a=bd;return true end elseif self.Operator=="maybe"then return math.random()>0.5 end end;function b:NumberOperator(bd,aj)if!self.Operator||!bd||!aj then return false elseif self.Operator=="equal"then return bd==aj elseif self.Operator=="not equal"then return bd!=aj elseif self.Operator=="above"then return bd>aj elseif self.Operator=="equal or above"then return bd>=aj elseif self.Operator=="below"then return bd<aj elseif self.Operator=="equal or below"then return bd<=aj elseif self.Operator=="maybe"then return math.random()>0.5 end end;function b:OnHide()if self.timerx_reset then self.time=nil;self.number=0 end;if self.Event=="weapon_class"then local A=self:GetOwner()if A:IsValid()then A=A.GetActiveWeapon&&A:GetActiveWeapon()||NULL;if A:IsValid()then A.pac_weapon_class=nil;A:SetNoDraw(false)end end end end;function b:OnShow()if self.timerx_reset then self.time=nil;self.number=0 end end;function b:OnAnimationEvent(A)if self.Event=="animation_event"then self:GetParent():CallRecursive("Think")end end;function b:OnFireBullets()if self.Event=="fire_bullets"then self:GetParent():CallRecursive("Think")end end;function b:OnEmitSound(A)if self.Event=="emit_sound"then self:GetParent():CallRecursive("Think")if A.pac_emit_sound.mute_me then return false end end end;a:Register()do local at={}for s,m in pairs(_G)do if isstring(s)&&s:find("PLAYERANIMEVENT_",nil,true)then at[m]=s:gsub("PLAYERANIMEVENT_",""):gsub("_"," "):lower()end end;pac.AddHook("DoAnimationEvent","animation_events",function(al,f,p)if al.pac_has_parts then al.pac_anim_event={name=at[f],time=pac.RealTime,reset=true}pac.CallRecursiveOnAllParts("OnAnimationEvent")end end)end;pac.AddHook("EntityEmitSound","emit_sound",function(p)if pac.playing_sound then return end;local A=p.Entity;if!A:IsValid()||!A.pac_has_parts then return end;A.pac_emit_sound={name=p.SoundName,time=pac.RealTime,reset=true,mute_me=A.pac_emit_sound&&A.pac_emit_sound.mute_me||false}if pac.CallRecursiveOnAllParts("OnEmitSound",A)==false then return false end;if A.pac_mute_sounds then return false end end)pac.AddHook("EntityFireBullets","firebullets",function(A,p)if!A:IsValid()||!A.pac_has_parts then return end;A.pac_fire_bullets={name=p.AmmoType,time=pac.RealTime,reset=true}pac.CallRecursiveOnAllParts("OnFireBullets")if A.pac_hide_bullets then return false end end)net.Receive("pac_event",function(bg)local al=net.ReadEntity()local aE=net.ReadString()local bh=net.ReadInt(8)if aE:find("^",0,true)then al.pac_command_events={}end;if al:IsValid()then al.pac_command_events=al.pac_command_events||{}al.pac_command_events[aE]={name=aE,time=pac.RealTime,on=bh}end end)pac.AddHook("OnPlayerChat","say_event",function(al,aE)if al:IsValid()then al.pac_say_event={str=aE,time=pac.RealTime}end end)pac.AddHook("GravGunOnPickedUp","gravgun_event",function(al,A)if al:IsValid()then al.pac_gravgun_ent=A end end)pac.AddHook("GravGunOnDropped","gravgun_event",function(al,A)if al:IsValid()then al.pac_gravgun_ent=A end end)pac.AddHook("GravGunPunt","gravgun_event",function(al,A)if al:IsValid()then al.pac_gravgun_ent=A;al.pac_gravgun_punt=pac.RealTime end end)do local function bi()local b0={}for D,h in pairs(pac.GetLocalParts())do if h.ClassName=="event"then local bj=h:GetEvent()if bj=="command"then local bk,L,ad=h:GetParsedArgumentsForObject(h.Events.command)if ad then continue end;b0[bk]={type=bj,time=L}end end end;local bl={}for D,h in pairs(b0)do h.trigger=D;table.insert(bl,h)end;table.sort(bl,function(bd,aj)return bd.trigger>aj.trigger end)return bl end;local bm=Material("sgm/playercircle")local bn;function pac.openEventSelectionWheel()gui.EnableScreenClicker(true)local bo,bp=ScrW(),ScrH()local bq,br=bo*0.5,bp*0.5;local bs=Color(255,0,0)local bt=48;local am=bi()local bu=#am;local bv=math.pi*2/bu;local bw=math.cos(bv*0.5)local a6;if bu<3 then a6=bt else a6=bt/math.cos((bu-2)*math.pi*0.5/bu)end;local bx;if a6+bt>br then bx=br/(a6+bt)else bx=1 end;local by={}for D,h in ipairs(am)do local bz=(D-1)*bv;by[D]={grow=0,name=h.trigger,event=h,x=math.sin(bz),y=-math.cos(bz)}end;local function bA(self,a2,a3)local bB=self.x*a2+self.y*a3;local bC;if bB>bw then bn=self;bC=0.1 else bC=0 end;self.grow=self.grow*0.9+bC;local bD=bx*(1+self.grow*0.2)local bE=Matrix()bE:SetTranslation(Vector(bq,br,0))bE:Scale(Vector(bD,bD,bD))cam.PushModelMatrix(bE)local a2,a3=self.x*a6,self.y*a6;local al=pac.LocalPlayer;local p=al.pac_command_events&&al.pac_command_events[self.event.trigger]&&al.pac_command_events[self.event.trigger]if p then local bF=self.event.time&&self.event.time>0;if bF then local bG=(pac.RealTime-p.time)/self.event.time;local bH=Lerp(math.Clamp(bG,0,1),1,0)local h=Lerp(math.Clamp(bG,0,1),0.55,0.15)surface.SetDrawColor(HSVToColor(210,bH,h))else if p.on==1 then surface.SetDrawColor(HSVToColor(210,1,0.55))else surface.SetDrawColor(HSVToColor(210,0,0.15))end end else surface.SetDrawColor(HSVToColor(210,0,0.15))end;surface.DrawTexturedRect(a2-48,a3-48,96,96)draw.SimpleText(self.name,"DermaDefault",a2,a3,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)cam.PopModelMatrix()end;pac.AddHook("HUDPaint","custom_event_selector",function()if input.IsButtonDown(MOUSE_RIGHT)then pac.closeEventSelectionWheel(true)return end;local a2,a3=input.GetCursorPos()a2=a2-bq;a3=a3-br;if a2==0&&a3==0 then a2=1;a3=0 else local bI=math.sqrt(a2^2+a3^2)a2=a2/bI;a3=a3/bI end;DisableClipping(true)render.PushFilterMag(TEXFILTER.ANISOTROPIC)render.PushFilterMin(TEXFILTER.ANISOTROPIC)surface.SetMaterial(bm)draw.SimpleText("Right click to cancel","DermaDefault",bq,br+a6+bt,bs,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)for ag,h in ipairs(by)do bA(h,a2,a3)end;render.PopFilterMag()render.PopFilterMin()DisableClipping(false)end)end;function pac.closeEventSelectionWheel(bJ)gui.EnableScreenClicker(false)pac.RemoveHook("HUDPaint","custom_event_selector")if bn&&bJ!=true then if!bn.event.time then RunConsoleCommand("pac_event",bn.event.trigger,"toggle")elseif bn.event.time>0 then RunConsoleCommand("pac_event",bn.event.trigger)else local al=pac.LocalPlayer;if al.pac_command_events&&al.pac_command_events[bn.event.trigger]&&al.pac_command_events[bn.event.trigger].on==1 then RunConsoleCommand("pac_event",bn.event.trigger,"0")else RunConsoleCommand("pac_event",bn.event.trigger,"1")end end end;bn=nil end;concommand.Add("+pac_events",pac.openEventSelectionWheel)concommand.Add("-pac_events",pac.closeEventSelectionWheel)end
--addons/!lpakr_out/lua/pac3/core/client/parts/flex.lua:
local a,b=pac.PartTemplate("base")b.ClassName="flex"b.Icon='icon16/emoticon_smile.png'b.Group='entity'a:StartStorableVars()a:GetSet("Flex","",{enums=function(c)local d={}for e,f in pairs(pac.GetFlexMap(c:GetOwner()))do d[f.name]=f.name end;return d end})a:GetSet("Weight",0)a:GetSet("Additive",false)a:GetSet("RootOwner",false,{hide_in_editor=true})a:EndStorableVars()function b:SetRootOwner(g)self:SetRootOwnerDeprecated(g)end;function b:GetNiceName()return self:GetFlex()!=""&&self:GetFlex()||"no flex"end;function b:GetFlexID()local h=self:GetOwner()if!h:IsValid()||!h.GetFlexNum||h:GetFlexNum()==0 then return end;local i=pac.GetFlexMap(h)local j=i[self.Flex:lower()]return j&&j.i,h end;function b:OnBuildBonePositions()local k,h=self:GetFlexID()if!k then return end;local l=self.Weight;if self.Additive then l=l+h:GetFlexWeight(k)end;h:SetFlexWeight(k,l)h.pac_touching_flexes=h.pac_touching_flexes||{}h.pac_touching_flexes[k]=pac.RealTime+0.1 end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/player_config.lua:
local a,b=pac.PartTemplate("base")b.ClassName="player_config"b.Group="entity"b.Icon='icon16/brick.png'local c={dont_bleed=_G.DONT_BLEED,red=_G.BLOOD_COLOR_RED,yellow=_G.BLOOD_COLOR_YELLOW,green=_G.BLOOD_COLOR_GREEN,mech=_G.BLOOD_COLOR_MECH,antlion=_G.BLOOD_COLOR_ANTLION,zombie=_G.BLOOD_COLOR_ZOMBIE,antlion_worker=_G.BLOOD_COLOR_ANTLION_WORKER}a:StartStorableVars()a:SetPropertyGroup("generic")a:GetSet("MuteSounds",false)a:GetSet("AllowOggWhenMuted",false)a:GetSet("HideBullets",false)a:GetSet("HidePhysgunBeam",false)a:GetSet("UseLegacyScale",false)a:GetSet("GrabEarAnimation",true)a:GetSet("BloodColor","red",{enums=c})a:SetPropertyGroup("behavior")a:GetSet("MuteFootsteps",false)a:SetPropertyGroup("death")a:GetSet("FallApartOnDeath",false)a:GetSet("DeathRagdollizeParent",true)a:GetSet("DrawPlayerOnDeath",false)a:GetSet("HideRagdollOnDeath",false)a:EndStorableVars()local d={}function a:EntityField(e,f)f="pac_"..f;d[f]=e;self.PART["Set"..e]=function(self,g)self[e]=g;local h=self:GetActualOwner()if h:IsValid()then h[f]=g end end end;a:EntityField("InverseKinematics","enable_ik")a:EntityField("MuteFootsteps","mute_footsteps")a:EntityField("AnimationRate","global_animation_rate")a:EntityField("FallApartOnDeath","death_physics_parts")a:EntityField("DeathRagdollizeParent","death_ragdollize")a:EntityField("HideRagdollOnDeath","death_hide_ragdoll")a:EntityField("DrawPlayerOnDeath","draw_player_on_death")a:EntityField("HidePhysgunBeam","hide_physgun_beam")a:EntityField("MuteSounds","mute_sounds")a:EntityField("AllowOggWhenMuted","allow_ogg_sounds")a:EntityField("HideBullets","hide_bullets")function b:GetActualOwner()local h=self:GetOwner()if h:IsValid()&&h:GetRagdollOwner():IsPlayer()then return h:GetRagdollOwner()end;return h end;function b:GetNiceName()local i=self:GetActualOwner()if i:IsValid()then if i:IsPlayer()then return i:Nick()else return language.GetPhrase(i:GetClass())end end;return self.ClassName end;function b:OnShow()local i=self:GetActualOwner()if i:IsValid()then pac.emut.MutateEntity(self:GetPlayerOwner(),"blood_color",i,c[self.BloodColor==""&&"red"||self.BloodColor])end;if i:IsValid()then for j,f in pairs(d)do self["Set"..f](self,self[f])end end end;function b:OnThink()local i=self:GetActualOwner()if i:IsValid()then i.pac_mute_footsteps=self.MuteFootsteps end end;function b:OnHide()local i=self:GetActualOwner()if i:IsValid()then local k=self:GetPlayerOwner()pac.emut.RestoreMutations(k,"blood_color",i)for l in pairs(d)do i[l]=nil end end end;function b:SetBloodColor(m)self.BloodColor=m;local i=self:GetActualOwner()if i:IsValid()then pac.emut.MutateEntity(self:GetPlayerOwner(),"blood_color",i,c[self.BloodColor==""&&"red"||self.BloodColor])end end;function b:SetGrabEarAnimation(n)self.GrabEarAnimation=n;local i=self:GetActualOwner()if i:IsValid()then i.pac_disable_ear_grab=!n end end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/projected_texture.lua:
local a,b=pac.PartTemplate("base_drawable")b.ClassName="projected_texture"b.Group="effects"b.Icon='icon16/lightbulb.png'b.ProperColorRange=true;a:StartStorableVars()a:GetSet("Shadows",true)a:GetSet("Orthographic",false)a:GetSet("NearZ",1)a:GetSet("FarZ",2048)a:GetSet("FOV",90)a:GetSet("HorizontalFOV",90)a:GetSet("VerticalFOV",90)a:GetSet("Texture","effects/flashlight/hard",{editor_panel="textures"})a:GetSet("TextureFrame",0)a:SetPropertyGroup("appearance")a:GetSet("Brightness",8)a:GetSet("Color",Vector(1,1,1),{editor_panel="color2"})a:EndStorableVars()function b:GetProjectedTexture()if!self.ptex then self.ptex=ProjectedTexture()end;return self.ptex end;function b:GetNiceName()local c=pac.ColorToNames(self:GetColor())return c.." projected texture"end;local d={"Shadows","NearZ","FarZ","FOV","HorizontalFOV","VerticalFOV","Orthographic","Texture","TextureFrame","Brightness","Color"}function b:OnShow()for e,f in ipairs(d)do self["Set"..f](self,self["Get"..f](self))end end;function b:OnDraw()local g,h=self:GetDrawPosition()local i=self:GetProjectedTexture()i:SetPos(g)i:SetAngles(h)i:Update()end;function b:SetColor(j)self.Color=j;self:GetProjectedTexture():SetColor(Color(j.x*255,j.y*255,j.z*255,1))end;function b:SetBrightness(j)self.Brightness=j;self:GetProjectedTexture():SetBrightness(j)end;function b:SetOrthographic(j)self.Orthographic=j;self:GetProjectedTexture():SetOrthographic(j)end;function b:SetVerticalFOV(j)self.VerticalFOV=j;self:GetProjectedTexture():SetVerticalFOV(j)end;function b:SetHorizontalFOV(j)self.HorizontalFOV=j;self:GetProjectedTexture():SetHorizontalFOV(j)end;function b:SetFOV(j)self.FOV=j;self:GetProjectedTexture():SetFOV(j)end;function b:SetNearZ(j)self.NearZ=j;self:GetProjectedTexture():SetNearZ(j)end;function b:SetFarZ(j)self.FarZ=j;self:GetProjectedTexture():SetFarZ(j)end;function b:SetShadows(j)self.Shadows=j;self:GetProjectedTexture():SetEnableShadows(j)end;function b:SetTextureFrame(j)self.TextureFrame=j;if self.vtf_frame_limit then self:GetProjectedTexture():SetTextureFrame(math.abs(j)%self.vtf_frame_limit)else self:GetProjectedTexture():SetTextureFrame(math.abs(j))end end;function b:SetTexture(j)if!j then return end;self.Texture=j;if!pac.resource.DownloadTexture(j,function(k,l)if l then self.vtf_frame_limit=l end;self:GetProjectedTexture():SetTexture(k)end,self:GetPlayerOwner())then self:GetProjectedTexture():SetTexture(j)end end;function b:OnHide()local k=self:GetProjectedTexture()k:SetBrightness(0)k:Update()timer.Simple(0,function()if k:IsValid()then k:Remove()end end)self.ptex=nil end;function b:OnRemove()self:OnHide()end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/sound.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/libraries/webaudio.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/ogg.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/libraries/webaudio/streams.lua:
pac.webaudio=pac.webaudio||{}local a=pac.webaudio;a.Streams=a.Streams||{}a.Streams.LastStreamId=0;a.Streams.Streams={}function a.Streams.CreateStream(b)if!b:find("http",1,true)then b="asset://garrysmod/sound/"..b end;local c=setmetatable({},a.Streams.STREAM)a.Streams.LastStreamId=a.Streams.LastStreamId+1;c:SetId(a.Streams.LastStreamId)c:SetUrl(b)a.Streams.Streams[c:GetId()]=c;a.Browser.QueueJavascript(string.format("createStream(%q, %d)",c:GetUrl(),c:GetId()))return c end;function a.Streams.GetStream(d)return a.Streams.Streams[d]end;function a.Streams.StreamExists(d)return a.Streams.Streams[d]!=nil end;function a.Streams.Think()for d,c in pairs(a.Streams.Streams)do if c:IsValid()then c:Think()else c:Stop()a.Streams.Streams[d]=nil;a.Browser.QueueJavascript(string.format("destroyStream(%i)",c:GetId()))setmetatable(c,getmetatable(NULL))end end end
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/sound.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/trail.lua:
local Lerp=Lerp;local tonumber=tonumber;local a=table.insert;local b=table.remove;local c=math.ceil;local d=math.abs;local e=render.StartBeam;local f=cam.IgnoreZ;local g=render.EndBeam;local h=render.AddBeam;local i=render.SetMaterial;local j,k=pac.PartTemplate("base_drawable")k.FriendlyName="legacy trail"k.ClassName="trail"k.Group="legacy"k.Icon='icon16/arrow_undo.png'j:StartStorableVars()j:SetPropertyGroup("generic")j:PropertyOrder("Name")j:PropertyOrder("Hide")j:PropertyOrder("ParentName")j:GetSet("TrailPath","trails/laser",{editor_panel="material"})j:GetSet("StartSize",3)j:GetSet("EndSize",0)j:GetSet("Length",100)j:GetSet("Spacing",1)j:SetPropertyGroup("orientation")j:SetPropertyGroup("appearance")j:GetSet("StartColor",Vector(255,255,255),{editor_panel="color"})j:GetSet("EndColor",Vector(255,255,255),{editor_panel="color"})j:GetSet("StartAlpha",1)j:GetSet("EndAlpha",1)j:PropertyOrder("Translucent")j:GetSet("Stretch",false)j:SetPropertyGroup("other")j:PropertyOrder("DrawOrder")j:EndStorableVars()function k:GetNiceName()local l=pac.PrettifyName("/"..self:GetTrailPath())local m=l&&l:match(".+/(.+)")return m&&m:gsub("%..+","")||"error"end;k.LastAdd=0;function k:Initialize()self:SetTrailPath(self.TrailPath)self.StartColorC=Color(255,255,255,255)self.EndColorC=Color(255,255,255,255)end;function k:SetStartColor(n)self.StartColorC=self.StartColorC||Color(255,255,255,255)self.StartColorC.r=n.r;self.StartColorC.g=n.g;self.StartColorC.b=n.b;self.StartColor=n end;function k:SetEndColor(n)self.EndColorC=self.EndColorC||Color(255,255,255,255)self.EndColorC.r=n.r;self.EndColorC.g=n.g;self.EndColorC.b=n.b;self.EndColor=n end;function k:SetStartAlpha(o)self.StartColorC=self.StartColorC||Color(255,255,255,255)self.StartColorC.a=o*255;self.StartAlpha=o end;function k:SetEndAlpha(o)self.EndColorC=self.EndColorC||Color(255,255,255,255)self.EndColorC.a=o*255;self.EndAlpha=o end;function k:SetTrailPath(p)self.TrailPath=p;self:SetMaterial(p)end;function k:SetMaterial(p)p=p||""if!pac.Handleurltex(self,p)then if isstring(p)then self.Materialm=pac.Material(p,self)self:CallRecursive("OnMaterialChanged")elseif type(p)=="IMaterial"then self.Materialm=p;self:CallRecursive("OnMaterialChanged")end end;if self.Materialm then local q=self.Materialm:GetShader()if q=="VertexLitGeneric"||q=="Cable"||q=="LightmappedGeneric"then self.Materialm=pac.MakeMaterialUnlitGeneric(self.Materialm,self.Id)end end end;function k:OnShow()self.points={}end;function k:OnHide()self.points={}end;local r=Color(255,255,255)function k:OnDraw()local s=self.MaterialOverride||self.Materialm;if s&&self.StartColorC&&self.EndColorC then self.points=self.points||{}local t=tonumber(self.Length)local u=tonumber(self.Spacing)local v,w=self:GetDrawPosition()if u==0||self.LastAdd<pac.RealTime then a(self.points,v)self.LastAdd=pac.RealTime+u/1000 end;local x=#self.points;if u>0 then t=c(d(t-u))end;i(s)e(x)for y,n in pairs(self.points)do local z=y/(t/self.StartSize)local A=1/x*(y-1)r.r=Lerp(A,self.EndColorC.r,self.StartColorC.r)r.g=Lerp(A,self.EndColorC.g,self.StartColorC.g)r.b=Lerp(A,self.EndColorC.b,self.StartColorC.b)r.a=Lerp(A,self.EndColorC.a,self.StartColorC.a)h(y==x&&v||n,z+self.EndSize,self.Stretch&&A||z,r)end;g()if x>=t then b(self.points,1)end end end;j:Register()
--addons/!lpakr_out/lua/pac3/editor/client/language.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/wear.lua:
local a=pace.LanguageString;function pace.IsPartSendable(b)if b:HasParent()then return false end;if!b:GetShowInEditor()then return false end;return true end;function pace.WearOnServer(c)local d={}for e,b in pairs(pac.GetLocalParts())do if pace.IsPartSendable(b)then table.insert(d,b)end end;local f=math.random(1,0x7FFFFFFF)for g,b in ipairs(d)do pace.SendPartToServer(b,{partID=g,totalParts=#d,transmissionID=f,temp_wear_filter=c})end end;function pace.ClearParts()pace.ClearUndo()pac.RemoveAllParts(true,true)pace.RefreshTree()timer.Simple(0.1,function()if!pace.Editor:IsValid()then return end;if table.Count(pac.GetLocalParts())==0 then pace.Call("CreatePart","group",a"my outfit")end;pace.TrySelectPart()end)end;do local function h(i)local j=pac.StringStream()j:writeTable(i)local k=j:getString()local l,m=pcall(net.WriteStream,k)if!l then return l,m end;return#k end;function pace.SendPartToServer(b,n)local o,p=pac.CallHook("CanWearParts",pac.LocalPlayer)if o==false then pac.Message(p||"the server doesn't want you to wear parts for some reason")return false end;if!pace.IsPartSendable(b)then return false end;local k={part=b:ToTable()}if n then table.Merge(k,n)end;k.owner=b:GetPlayerOwner()k.wear_filter=pace.CreateWearFilter()net.Start("pac_submit")local q,m=h(k)if!q then pace.Notify(false,"unable to transfer data to server: "..tostring(m||"too big"),pace.pac_show_uniqueid:GetBool()&&string.format("%s (%s)",b:GetName(),b:GetPrintUniqueID())||b:GetName())return false end;net.SendToServer()pac.Message(('Transmitting outfit %q to server (%s)'):format(b.Name||b.ClassName||'<unknown>',string.NiceSize(q)))return true end;function pace.RemovePartOnServer(r,s,c)local k={part=r,server_only=s,filter=c}if r=="__ALL__"then pace.CallHook("RemoveOutfit",pac.LocalPlayer)end;net.Start("pac_submit")local t,m=h(k)if t==nil then pace.Notify(false,"unable to transfer data to server: "..tostring(m||"too big"),r)return false end;net.SendToServer()return true end end;do function pace.WearPartFromServer(u,v,k,w)pac.dprint("received outfit %q from %s with %i number of children to set on %s",v.self.Name||"",tostring(u),table.Count(v.children),v.self.OwnerName||"")if pace.CallHook("WearPartFromServer",u,v,k)==false then return end;local x=pac.GetPartFromUniqueID(k.player_uid,v.self.UniqueID)if x:IsValid()then pac.dprint("removing part %q to be replaced with the part previously received",x.Name)x:Remove()end;local y;if k.is_dupe then local z=tonumber(v.self.OwnerName)y=Entity(z||-1)if!y:IsValid()then return end end;local function A()if y&&!y:IsValid()then return end;x=pac.GetPartFromUniqueID(k.player_uid,v.self.UniqueID)if x:IsValid()then pac.dprint("removing part %q to be replaced with the part previously received ON callback call",x.Name)x:Remove()end;u.pac_render_time_exceeded=false;local b=pac.CreatePart(v.self.ClassName,u,v,false,1)if k.is_dupe then b.dupe_remove=true end;if u==pac.LocalPlayer then pace.CallHook("OnWoreOutfit",b)end;b:CallRecursive('OnWorn')b:CallRecursive('PostApplyFixes')if b.UpdateOwnerName then b:UpdateOwnerName(true)b:CallRecursive("CalcShowHide",true)end;u.pac_fix_show_from_render=SysTime()+1 end;if w then A()end;return A end;function pace.RemovePartFromServer(u,B,k)pac.dprint("%s removed %q",tostring(u),B)if B=="__ALL__"then pac.RemovePartsFromUniqueID(k.player_uid)pace.CallHook("RemoveOutfit",u)pac.CleanupEntityIgnoreBound(u)else local b=pac.GetPartFromUniqueID(k.player_uid,B)if b:IsValid()then b:Remove()end end end end;function pace.HandleReceiveData(k,C)local D=type(k.part)if D=="table"then return pace.WearPartFromServer(k.owner,k.part,k,C)elseif D=="string"then return pace.RemovePartFromServer(k.owner,k.part,k)else ErrorNoHalt("PAC: Unhandled "..D..'!?\n')end end;net.Receive("pac_submit",function()if!pac.IsEnabled()then return end;net.ReadStream(ply,function(k)if!k then pac.Message("message from server timed out")return end;local j=pac.StringStream(k)local k=j:readTable()if type(k.owner)!="Player"||!k.owner:IsValid()then pac.Message("received message from server but owner is not valid!? typeof "..type(k.owner)..' || ',k.owner)return end;if pac.IsPacOnUseOnly()&&k.owner!=pac.LocalPlayer then pace.HandleOnUseReceivedData(k)else pace.HandleReceiveData(k,true)end end)end)function pace.Notify(o,p,r)r=r||"???"if o==true then pac.Message(string.format('Your part %q has been applied',r))else chat.AddText(Color(255,255,0),"[PAC3] ",Color(255,0,0),string.format('The server rejected applying your part (%q) - %s',r,p))end end;net.Receive("pac_submit_acknowledged",function(E)pace.Notify(net.ReadBool(),net.ReadString(),net.ReadString())end)do local function F()if next(pac.GetLocalParts())then pac.Message("not wearing autoload outfit, already wearing something")elseif pace.IsActive()then pac.Message("not wearing autoload outfit, editor is open")else local G="autoload"local H=hook.Run("PAC3Autoload",G)if H!=false then if isstring(H)then G=H end;pac.Message("Wearing "..G.."...")pace.LoadParts(G)pace.WearParts()end end;pac.RemoveHook("Think","pac_request_outfits")pac.Message("Requesting outfits in 8 seconds...")timer.Simple(8,function()pac.Message("Requesting outfits...")RunConsoleCommand("pac_request_outfits")end)end;local function I()pac.RemoveHook("KeyRelease","pac_request_outfits")if!pac.LocalPlayer:IsValid()then return end;if!pac.IsEnabled()then pac.RemoveHook("Think","pac_request_outfits")pace.NeverLoaded=true;return end;F()end;hook.Add("pac_Enable","pac_LoadUpDefault",function()if!pace.NeverLoaded then return end;pace.NeverLoaded=nil;F()end)local J=0;pac.AddHook("Think","pac_request_outfits",function()if RealFrameTime()>0.2 then return end;J=J+1;if J>400 then if!xpcall(I,ErrorNoHalt)then pac.RemoveHook("Think","pac_request_outfits")pace.NeverLoaded=true end end end)pac.AddHook("KeyRelease","pac_request_outfits",function()local K=pac.LocalPlayer;if K:IsValid()&&K:GetVelocity():Length()>50 then J=J+200;if J>400 then I()end end end)end
--addons/!lpakr_out/lua/pac3/editor/client/saved_parts.lua:
local a=pace.LanguageString;local function b(c,d)local e=c.OnCursorEntered;c.OnCursorEntered=function(...)d()c.OnCursorEntered=e;return e(...)end end;file.CreateDir("pac3")file.CreateDir("pac3/__backup/")file.CreateDir("pac3/__backup_save/")function pace.SaveParts(f,g,h,i)if!f||g then Derma_StringRequest(a"save parts",a"filename:",g||pace.LastSaveName||"autoload",function(f)pace.LastSaveName=f;pace.SaveParts(f,nil,h,i)pace.RefreshFiles()end)return end;pac.dprint("saving parts %s",f)local j={}if!i then if pace.use_current_part_for_saveload&&pace.current_part:IsValid()then h=pace.current_part end;if h then j=h:ToSaveTable()end elseif h then table.insert(j,h:ToSaveTable())h=nil end;if#j==0 then for k,l in pairs(pac.GetLocalParts())do if!l:HasParent()&&l:GetShowInEditor()then table.insert(j,l:ToSaveTable())end end end;j=hook.Run("pac_pace.SaveParts",j)||j;if!h&&#file.Find("pac3/sessions/*","DATA")>0&&!f:find("/")then pace.luadata.WriteFile("pac3/sessions/"..f..".txt",j)else if file.Exists("pac3/"..f..".txt","DATA")then local m=os.date("%y-%m-%d-%H_%M_%S")local n=file.Read("pac3/"..f..".txt","DATA")file.Write("pac3/__backup_save/"..f.."_"..m..".txt",n)local o,p=file.Find("pac3/__backup_save/*","DATA")if#o>30 then local q={}for r,s in ipairs(o)do local t=file.Time("pac3/__backup_save/"..s,"DATA")table.insert(q,{"pac3/__backup_save/"..s,t})end;table.sort(q,function(u,v)return u[2]>v[2]end)for r=31,#o do file.Delete(q[r][1])end end end;pace.luadata.WriteFile("pac3/"..f..".txt",j)end;pace.Backup(j,f)end;local w;local x=CreateConVar("pac_backup_limit","100",{FCVAR_ARCHIVE},"Maximal amount of backups")function pace.Backup(j,f)f=f||""if!j then j={}for k,l in pairs(pac.GetLocalParts())do if!l:HasParent()&&l:GetShowInEditor()then table.insert(j,l:ToSaveTable())end end end;if#j>0 then local o,p=file.Find("pac3/__backup/*","DATA")if#o>x:GetInt()then local y={}for k,f in pairs(o)do local t=file.Time("pac3/__backup/"..f,"DATA")table.insert(y,{path="pac3/__backup/"..f,time=t})end;table.sort(y,function(u,v)return u.time>v.time end)for r=x:GetInt()+1,#o do file.Delete(y[r].path,"DATA")end end;local m=os.date("%y-%m-%d-%H_%M_%S")local z=pace.luadata.Encode(j)if z!=w then file.Write("pac3/__backup/"..(f==""&&f||f..'_')..m..".txt",z)w=z end end end;function pace.LoadParts(f,A,h)if!f then local B=vgui.Create("DFrame")B:SetTitle(a"parts")local c=pace.CreatePanel("browser",B)c.OnLoad=function(C)pace.LoadParts(C.FileName,A,h)end;if#file.Find("pac3/sessions/*","DATA")>0 then c:SetDir("sessions/")else c:SetDir("")end;c:Dock(FILL)B:SetSize(300,500)B:MakePopup()B:Center()local D=vgui.Create("DButton",B)D:Dock(BOTTOM)D:SetText(a"load from url")D.DoClick=function()Derma_StringRequest(a"load part",a"pastebin urls also work!","",function(f)pace.LoadParts(f,A,h)end)end else if hook.Run("PrePACLoadOutfit",f)==false then return end;pac.dprint("loading Parts %s",f)if f:find("https?://")then local function d(z)if string.find(z,"<!DOCTYPE html>")then pace.MessagePrompt("Invalid URL, the website returned a HTML file. If you're using Github then use the RAW option.","URL Failed","OK")return end;local j,E=pace.luadata.Decode(z)if!j then local F=string.format("URL fail: %s : %s\n",f,E)pace.MessagePrompt(F,"URL Failed","OK")return end;pace.LoadPartsFromTable(j,A,h)end;pac.HTTPGet(f,d,function(E)pace.MessagePrompt(E,"HTTP Request Failed for "..f,"OK")end)else f=f:gsub("%.txt","")local j,E=pace.luadata.ReadFile("pac3/"..f..".txt")if f=="autoload"&&(!j||!next(j))then local E;j,E=pace.luadata.ReadFile("pac3/sessions/"..f..".txt",nil,true)if!j then if E then ErrorNoHalt(("Autoload failed: %s\n"):format(E))end;return end elseif!j then ErrorNoHalt(("Decoding %s failed: %s\n"):format(f,E))return end;pace.LoadPartsFromTable(j,A,h)end end end;concommand.Add('pac_load_url',function(G,H,I)if!I[1]then return print('[PAC3] No URL specified')end;local J=I[1]:Trim()if!J:find("https?://")then return print('[PAC3] Invalid URL specified')end;pac.Message('Loading specified URL')if I[2]==nil then I[2]='1'end;pace.LoadParts(J,tobool(I[2]))end)function pace.LoadPartsFromTable(j,A,h)if pace.use_current_part_for_saveload&&pace.current_part:IsValid()then h=pace.current_part end;if A then pace.ClearParts()pace.ClearUndo()else end;local K={}local L=tostring(j)if j.self then local l;if h then l=h;l:SetTable(j)else l=h||pac.CreatePart(j.self.ClassName,nil,j,pac.GetPartFromUniqueID(pac.Hash(pac.LocalPlayer),j.self.UniqueID):IsValid()&&L)end;table.insert(K,l)else j=pace.FixBadGrouping(j)j=pace.FixUniqueIDs(j)for k,M in pairs(j)do local l=pac.CreatePart(M.self.ClassName,nil,M,pac.GetPartFromUniqueID(pac.Hash(pac.LocalPlayer),M.self.UniqueID):IsValid()&&L)table.insert(K,l)end end;pace.RefreshTree(true)for r,l in ipairs(K)do l:CallRecursive('OnOutfitLoaded')l:CallRecursive('PostApplyFixes')end;pac.LocalPlayer.pac_fix_show_from_render=SysTime()+1;pace.RecordUndoHistory()end;local function N(M,O)local o,p=file.Find("pac3/"..O.."/*","DATA")if p then for k,P in pairs(p)do if P=="__backup"||P=="objcache"||P=="__animations"||P=="__backup_save"then goto Q end;M[P]={}N(M[P],O.."/"..P)::Q::end end;if o then for r,f in pairs(o)do if f:find("%.txt")then local R="pac3/"..O.."/"..f;if file.Exists(R,"DATA")then local j={}j.Name=f:gsub("%.txt","")j.FileName=f;j.Size=string.NiceSize(file.Size(R,"DATA"))local t=file.Time(R,"DATA")j.LastModified=os.date("%m/%d/%Y %H:%M",t)j.Time=file.Time(R,"DATA")j.Path=R;j.RelativePath=(O.."/"..j.Name):sub(2)local S,E=pace.luadata.ReadFile(R)j.Content=S;if S then table.insert(M,j)else pac.dprint(("Decoding %s failed: %s\n"):format(R,E))chat.AddText(("Could not load: %s\n"):format(R))end end end end end;table.sort(M,function(u,v)if u.Time&&v.Time then return u.Name<v.Name end;return true end)end;function pace.GetSavedParts(O)if pace.CachedFiles then return pace.CachedFiles end;local T={}N(T,O||"")pace.CachedFiles=T;return T end;local function U(V,l,h,A)local f=l.self.Name||""if f==""then f=l.self.ClassName.." (no name)"end;if#l.children>0 then local V,c=V:AddSubMenu(f,function()pace.LoadPartsFromTable(l,nil,h)end)c:SetImage(l.self.Icon)V.GetDeleteSelf=function()return false end;local e=V.Open;V.Open=function(...)if!V.pac_opened then for k,l in pairs(l.children)do U(V,l,h,A)end;V.pac_opened=true end;return e(...)end else V:AddOption(f,function()pace.LoadPartsFromTable(l,A,h)end):SetImage(l.self.Icon)end end;local function W(V,M,h,A)for k,j in pairs(M)do if!j.Path then local V,c=V:AddSubMenu(k,function()end,j)c:SetImage(pace.MiscIcons.load)V.GetDeleteSelf=function()return false end;local e=V.Open;V.Open=function(...)if!V.pac_opened then W(V,j,h,A)V.pac_opened=true end;return e(...)end else local X=pace.MiscIcons.outfit;local Y=j.Content;if Y.self then X=Y.self.Icon;Y={Y}end;local Z,c=V:AddSubMenu(j.Name,function()pace.LoadParts(j.RelativePath,A,h)end)c:SetImage(X)Z.GetDeleteSelf=function()return false end;local e=Z.Open;Z.Open=function(...)if!Z.pac_opened then for k,l in pairs(Y)do U(Z,l,h,A)end;Z.pac_opened=true end;return e(...)end end end end;function pace.AddSavedPartsToMenu(V,A,h)V.GetDeleteSelf=function()return false end;V:AddOption(a"load from url",function()Derma_StringRequest(a"load parts",a"Some indirect urls from on pastebin, dropbox, github, etc are handled automatically. Pasting the outfit's file contents into the input field will also work.","",function(f)pace.LoadParts(f,A,h)end)end):SetImage(pace.MiscIcons.url)V:AddOption(a"load from clipboard",function()pace.MultilineStringRequest(a"load parts from clipboard",a"Paste the outfits content here.","",function(f)local j,E=pace.luadata.Decode(f)if j then pace.LoadPartsFromTable(j,A,h)end end)end):SetImage(pace.MiscIcons.paste)if!h&&pace.example_outfits then local _,c=V:AddSubMenu(a"examples")c:SetImage(pace.MiscIcons.help)_.GetDeleteSelf=function()return false end;local a0={}for a1,a2 in pairs(pace.example_outfits)do a0[#a0+1]={k=a1,v=a2}end;table.sort(a0,function(u,v)return u.k<v.k end)for a3,j in pairs(a0)do _:AddOption(j.k,function()pace.LoadPartsFromTable(j.v)end):SetImage(pace.MiscIcons.outfit)end end;V:AddSpacer()local M=pace.GetSavedParts()W(V,M,h,A)V:AddSpacer()local a4,c=V:AddSubMenu(a"backups")c:SetImage(pace.MiscIcons.clone)a4.GetDeleteSelf=function()return false end;b(c,function()local o=file.Find("pac3/__backup/*","DATA")local a5={}for r,s in ipairs(o)do table.insert(a5,{s,file.Time("pac3/__backup/"..s,"DATA")})end;table.sort(a5,function(u,v)return u[2]>v[2]end)for a3,j in pairs(a5)do local f=j[1]local a6="pac3/__backup/"..f;local a7=os.date("%m/%d/%Y %H:%M:%S ",file.Time(a6,"DATA"))..string.NiceSize(file.Size(a6,"DATA"))a4:AddOption(a7,function()pace.LoadParts("__backup/"..f,true)end):SetImage(pace.MiscIcons.outfit)end end)local a4,c=V:AddSubMenu(a"outfit backups")c:SetImage(pace.MiscIcons.clone)a4.GetDeleteSelf=function()return false end;b(c,function()local o=file.Find("pac3/__backup_save/*","DATA")local a5={}for r,s in ipairs(o)do table.insert(a5,{s,file.Time("pac3/__backup_save/"..s,"DATA")})end;table.sort(a5,function(u,v)return u[2]>v[2]end)for a3,j in pairs(a5)do local f=j[1]local a8=j[2]local a9=f;local m=os.date("_%y-%m-%d-%H_%M_%S",a8)if a9:find(m,1,true)then a9=a9:Replace(m,os.date(" %m/%d/%Y %H:%M:%S",a8))end;a4:AddOption(a9:Replace(".txt","").." ("..string.NiceSize(file.Size("pac3/__backup_save/"..f,"DATA"))..")",function()pace.LoadParts("__backup_save/"..f,true)end):SetImage(pace.MiscIcons.outfit)end end)end;local function W(V,M,O,h)O=O||""V:AddOption(a"new file",function()pace.SaveParts(nil,O.."/",h)end):SetImage("icon16/page_add.png")V:AddOption(a"new directory",function()Derma_StringRequest(a"new directory",a"name:","",function(f)file.CreateDir("pac3/"..O.."/"..f)pace.RefreshFiles()end)end):SetImage("icon16/folder_add.png")V:AddOption(a"to clipboard",function()local j={}for k,l in pairs(pac.GetLocalParts())do if!l:HasParent()&&l:GetShowInEditor()then table.insert(j,l:ToSaveTable())end end;SetClipboardText(pace.luadata.Encode(j):sub(1,-1))end):SetImage(pace.MiscIcons.copy)V:AddSpacer()for k,j in pairs(M)do if!j.Path then local V,c=V:AddSubMenu(k,function()end,j)c:SetImage(pace.MiscIcons.load)V.GetDeleteSelf=function()return false end;W(V,j,O.."/"..k,h)else local Y=j.Content;if Y[1]then local V,c=V:AddSubMenu(j.Name,function()pace.SaveParts(nil,j.RelativePath,h)end)V.GetDeleteSelf=function()return false end;c:SetImage(pace.MiscIcons.outfit)V:AddOption(a"delete",function()file.Delete("pac3/"..j.RelativePath..".txt","DATA")pace.RefreshFiles()end):SetImage(pace.MiscIcons.clear)c:SetImage(pace.MiscIcons.outfit)elseif Y.self then V:AddOption(j.Name,function()pace.SaveParts(nil,j.RelativePath,h)end):SetImage(Y.self.Icon)end end end;if O!=""then V:AddSpacer()V:AddOption(a"delete directory",function()Derma_Query(a"Are you sure you want to delete data/pac3"..O.."/* and all its files?\nThis cannot be undone!",a"delete directory",a"yes",function()local function aa(O)local o,p=file.Find(O.."*","DATA")for a1,a2 in ipairs(o)do file.Delete(O..a2)end;for a1,a2 in ipairs(p)do aa(O..a2 .."/")end;if file.Find(O.."*","DATA")[1]then Derma_Message("Cannot remove the directory.\nMaybe it contains hidden files?","unable to remove directory",a"ok")else file.Delete(O)end end;aa("pac3/"..O.."/")pace.RefreshFiles()end,a"no",function()end)end):SetImage("icon16/folder_delete.png")end end;function pace.AddSaveMenuToMenu(V,h)V.GetDeleteSelf=function()return false end;if!h then V:AddOption(a"auto load (your spawn outfit)",function()pace.SaveParts("autoload",nil,h)pace.RefreshFiles()end):SetImage(pace.MiscIcons.autoload)V:AddSpacer()end;local M=pace.GetSavedParts()W(V,M,nil,h)end;function pace.FixUniqueIDs(j)local ab={}local function ac(l)ab[l.self.UniqueID]=ab[l.self.UniqueID]||{}table.insert(ab[l.self.UniqueID],l)for k,l in pairs(l.children)do ac(l)end end;for k,l in pairs(j)do ac(l)end;for k,ad in pairs(ab)do if#ad>1 then for k,l in pairs(ad)do pac.dprint("Part (%s using model %s) named %q has %i other parts with the same unique id. Fixing!",l.self.ClassName,l.self.Name,l.self.Model||"",#ad)l.self.UniqueID=pac.Hash()end end end;return j end;function pace.FixBadGrouping(j)local Y={}local ae={}for k,l in pairs(j)do if l.self.ClassName!="group"then table.insert(Y,l)else table.insert(ae,l)end end;if#Y>0 then local T={{["self"]={["EditorExpand"]=true,["ClassName"]="group",["UniqueID"]=pac.Hash(),["Name"]="automatic group"},["children"]=Y}}for a1,a2 in pairs(ae)do table.insert(T,a2)end;return T end;return j end
--addons/!lpakr_out/lua/pac3/editor/client/shortcuts.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/shortcuts.lua:
function pace.OnShortcutSave()if!IsValid(pace.current_part)then return end;local a=pace.current_part:GetRootPart()surface.PlaySound("buttons/button9.wav")pace.SaveParts(nil,"part "..(a:GetName()||"my outfit"),a,true)end;function pace.OnShortcutWear()if!IsValid(pace.current_part)then return end;local a=pace.current_part:GetRootPart()surface.PlaySound("buttons/button9.wav")pace.SendPartToServer(a)pace.FlashNotification('Wearing group: '..a:GetName())end;local b=0;function pace.CheckShortcuts()if gui.IsConsoleVisible()then return end;if!pace.Editor||!pace.Editor:IsValid()then return end;if b>RealTime()||input.IsMouseDown(MOUSE_LEFT)then return end;if input.IsKeyDown(KEY_LALT)&&input.IsKeyDown(KEY_E)then pace.Call("ToggleFocus",true)b=RealTime()+0.2 end;if input.IsKeyDown(KEY_LCONTROL)&&input.IsKeyDown(KEY_E)then pace.Call("ToggleFocus")b=RealTime()+0.2 end;if input.IsKeyDown(KEY_LALT)&&input.IsKeyDown(KEY_LCONTROL)&&input.IsKeyDown(KEY_P)then RunConsoleCommand("pac_restart")end;if pace.IsFocused()then if input.IsKeyDown(KEY_LCONTROL)&&input.IsKeyDown(KEY_S)then pace.Call("ShortcutSave")b=RealTime()+0.2 end;if input.IsKeyDown(KEY_LCONTROL)&&input.IsKeyDown(KEY_N)then pace.Call("ShortcutWear")b=RealTime()+0.2 end;if input.IsKeyDown(KEY_LCONTROL)&&input.IsKeyDown(KEY_T)then pace.SetTPose(!pace.GetTPose())b=RealTime()+0.2 end;if input.IsKeyDown(KEY_LCONTROL)&&input.IsKeyDown(KEY_F)then pace.properties.search:SetVisible(true)pace.properties.search:RequestFocus()pace.properties.search:SetEnabled(true)pace.property_searching=true;b=RealTime()+0.2 end end end;pac.AddHook("Think","pace_shortcuts",pace.CheckShortcuts)do local c=false;local b=0;local function d()if!input.IsKeyDown(KEY_Z)&&!input.IsKeyDown(KEY_Y)then c=false end;if c then return end;if input.IsControlDown()&&(input.IsKeyDown(KEY_LSHIFT)&&input.IsKeyDown(KEY_Z)||input.IsKeyDown(KEY_Y))then pace.Redo()c=true elseif input.IsControlDown()&&input.IsKeyDown(KEY_Z)then pace.Undo()c=true end end;local c=false;local function e()if!input.IsKeyDown(KEY_C)then c=false end;if c||!(input.IsControlDown()&&input.IsKeyDown(KEY_C))then return end;c=true;local a=pace.current_part;if!a||!a:IsValid()then pace.FlashNotification('No part selected to copy')return end;pace.Copy(a)surface.PlaySound("buttons/button9.wav")end;local c=false;local function f()if!input.IsKeyDown(KEY_X)then c=false end;if c||!(input.IsControlDown()&&input.IsKeyDown(KEY_X))then return end;c=true;local a=pace.current_part;if!a||!a:IsValid()then pace.FlashNotification('No part selected to cut')return end;pace.Cut(a)surface.PlaySound("buttons/button9.wav")end;local c=false;local function g()if!input.IsKeyDown(KEY_DELETE)then c=false end;if c||!input.IsKeyDown(KEY_DELETE)then return end;c=true;local a=pace.current_part;if!a||!a:IsValid()then pace.FlashNotification('No part to delete')return end;pace.RemovePart(a)surface.PlaySound("buttons/button9.wav")end;local h=CreateConVar('pac_reverse_collapse','1',{FCVAR_ARCHIVE},'Reverse Collapse/Expand hotkeys')local c=false;local function i()if!input.IsKeyDown(KEY_LALT)&&!input.IsKeyDown(KEY_RALT)&&!input.IsKeyDown(KEY_0)then c=false end;if c||!input.IsShiftDown()||!input.IsKeyDown(KEY_LALT)&&!input.IsKeyDown(KEY_RALT)||!input.IsKeyDown(KEY_0)then return end;c=true;local a=pace.current_part;if!a||!a:IsValid()then pace.FlashNotification('No part to expand')return end;a:CallRecursive('SetEditorExpand',!h:GetBool())surface.PlaySound("buttons/button9.wav")pace.RefreshTree(true)end;local c=false;local function j()if!input.IsKeyDown(KEY_LALT)&&!input.IsKeyDown(KEY_RALT)&&!input.IsKeyDown(KEY_0)then c=false end;if c||input.IsShiftDown()||!input.IsKeyDown(KEY_LALT)&&!input.IsKeyDown(KEY_RALT)||!input.IsKeyDown(KEY_0)then return end;c=true;local a=pace.current_part;if!a||!a:IsValid()then pace.FlashNotification('No part to collapse')return end;a:CallRecursive('SetEditorExpand',h:GetBool())surface.PlaySound("buttons/button9.wav")pace.RefreshTree(true)end;local c=false;local function k()if!input.IsKeyDown(KEY_V)then c=false end;if c||!(input.IsControlDown()&&input.IsKeyDown(KEY_V))then return end;c=true;local a=pace.Clipboard;if!a then pace.FlashNotification('No part is stored in clipboard')return end;local l;if a==pace.current_part then l=a:GetParent()if!l||!l:IsValid()then l=a end elseif pace.current_part&&pace.current_part:IsValid()then l=pace.current_part else pace.RecordUndoHistory()l=pace.Call("CreatePart","group",L"paste data")pace.RecordUndoHistory()end;pace.Paste(l)surface.PlaySound("buttons/button9.wav")end;pac.AddHook("Think","pace_keyboard_shortcuts",function()if!pace.IsActive()then return end;if!pace.Focused then return end;if IsValid(vgui.GetKeyboardFocus())&&vgui.GetKeyboardFocus():GetClassName():find('Text')then return end;if gui.IsConsoleVisible()then return end;d()e()k()f()g()i()j()end)end
--addons/!lpakr_out/lua/pac3/editor/client/panels.lua:
pace.RegisteredPanels={}local a=false;function pace.RegisterPanel(b)pace.RegisteredPanels[b.ClassName]=b;vgui.Register("pace_"..b.ClassName,b,b.Base)end;function pace.PanelExists(c)return pace.GetRegisteredPanel(c)!=nil end;function pace.GetRegisteredPanel(c)return pace.RegisteredPanels[c]end;function pace.CreatePanel(c,d)local e=vgui.Create("pace_"..c,d)table.insert(pace.ActivePanels,e)if a&&c!='editor'then local f=debug.traceback()timer.Simple(0,function()if!IsValid(e)then return end;local d=e:GetParent()if!IsValid(d)||d:GetClassName()=='CGModBase'then pac.Message('Panel was created without valid parent! '..c)pac.Message(f)end end)end;return e end;function pace.RegisterPanels()local g;if file.FindInLua then g=file.FindInLua("pac3/editor/client/panels/*.lua")else g=file.Find("pac3/editor/client/panels/*.lua","LUA")end;for h,i in pairs(g)do include("pac3/editor/client/panels/"..i)end end
--addons/!lpakr_out/lua/pac3/editor/client/spawnmenu.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/about.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/extra/client/contraption.lua:
local a=pace.LanguageString;pace.AddTool(a"spawn as props",function(b)local c=pacx.PartToContraptionData(b)net.Start("pac_to_contraption")net.WriteTable(c)net.SendToServer()end)function pacx.PartToContraptionData(b,d)d=d||{}if b.is_model_part then local c={}local e=b:GetColor()local f=b:GetAlpha()if b.ProperColorRange then c.clr=Color(e.r*255,e.g*255,e.b*255,f*255)else c.clr=Color(e.r,e.g,e.b,f*255)end;c.ang=b:GetOwner():GetAngles()c.pos=b:GetOwner():GetPos()c.mat=b:GetMaterial()c.mdl=b:GetModel()c.skn=b:GetSkin()local g=b:GetSize()c.scale=b:GetScale()*g;c.id=b.UniqueID;table.insert(d,c)end;for h,b in ipairs(b:GetChildren())do if b.is_model_part then pacx.PartToContraptionData(b,d)end end;return d end
--addons/!lpakr_out/lua/casino/games_sh.lua:
local a=Color(255,50,50)local b=Color(50,255,50)casino.CreateGame('Blackjack'):AddActions({'Stick','Hit'}):SetDescription('Get closest to 21'):SetWager(true):OnSolveHandValue(function(c)local d=0;local e=0;for f,g in ipairs(c.hand)do d=d+g.value end;if d>21 then for f,g in ipairs(c.hand)do if g.specialValue then d=d-g.value;d=d+g.specialValue;if d<=21 then break end end end end;c.value=d;return c.value end):OnUIUpdate(function(self,h,i,j)if!j then return end;local k=self._SolveHandValue({hand=j,value=0})if!i.Visual then ui.Create('DButton',function(l)l:SetText(k||0)l:SetTextColor(color_white)l:Dock(FILL)l:DockMargin(5,0,5,0)l.DoClick=function()end;l.Paint=function(m,n,o)draw.RoundedBox(4,0,0,n,o,casino.Col.midnight)end;i.Visual=l end,i)end;i.Visual:SetText(k||0)if k==21 then i.Visual:SetTextColor(b)elseif k>21 then i.Visual:SetTextColor(a)else i.Visual:SetTextColor(color_white)end end):OnRoundStarted(function(self,p)for f,c in pairs(self.playing)do c:AddRandomCardToHand(2)end;p:AddRandomCardToHand()end):OnHouseTurn(function(self,p)local d=p:AddRandomCardToHand()if d<17 then for q=1,8 do if p:AddRandomCardToHand()>=17 then break end end end;self:FinishRound()end):OnPlayerRequestAction(function(self,c,r)c:SetCooldown(2)if r=='Stick'then self:Next(c)elseif r=='Hit'then local d=c:AddRandomCardToHand()if d>=21 then self:Next(c)end else self:Next(c)end end):OnRoundFinished(function(self)local s=self.House:GetValue()for f,c in pairs(self.playing)do if!IsValid(c.entity)then continue end;local d=c:GetValue()if d==s&&d<=21&&(d<21||#self.House.hand>2&&#c.hand>2)then self:SetPush(c)elseif d>21 then self:SetLoser(c)elseif d==21 then self:SetWinner(c,casino.HasStoreEvent('blackjack')&&4/2||3/2)elseif d>s||s>21 then self:SetWinner(c,1)else self:SetLoser(c)end end end)casino.CreateGame('Baccarat'):SetDescription('Bet closest hand to 9'):AddActions({'Bet Player','Bet Banker'}):SetWager(false):OnSolveHandValue(function(c)local d=0;for f,g in ipairs(c.hand)do d=d+(g.specialValue||g.value>10&&0||g.value)end;c.value=d;return c.value end):OnPlayerReady(function(self,c)return true end):OnUIUpdate(function(self,h,i,j)if!j then return end;if i.nudgeLeft then return end;h.WagerVal=1000;h:OnWagerUpdated(1000)i:AddPanel('DButton',function(l)l:Dock(RIGHT)l:DockMargin(2,0,4,0)l:SetWide(42)l:SetText'+ WAGER'l:SetFont'ui.10'l:SetTextColor(color_white)l.BgColor=casino.Col.green_dark;l.Paint=h.DrawButton;l.OnMousePressed=function(m,t)local u=t==MOUSE_LEFT&&(input.IsKeyDown(KEY_LSHIFT)&&10000||1000)||(input.IsKeyDown(KEY_LSHIFT)&&100000||50000)m:SetDisabled(true,.05)h.WagerVal=math.Clamp(h.WagerVal+u,0,casino.MaxWager)h:OnWagerUpdated(h.WagerVal)end;i.nudgeRight=l end)i:AddPanel('DButton',function(l)l:Dock(FILL)l:DockMargin(4,0,2,0)l:SetText'- WAGER'l:SetFont'ui.10'l:SetTextColor(color_white)l.BgColor=casino.Col.red_dark;l.Paint=h.DrawButton;l.OnMousePressed=function(m,t)local v=t==MOUSE_LEFT&&(input.IsKeyDown(KEY_LSHIFT)&&10000||1000)||(input.IsKeyDown(KEY_LSHIFT)&&50000||100000)m:SetDisabled(true,.05)h.WagerVal=math.Clamp(h.WagerVal-v,0,casino.MaxWager)h:OnWagerUpdated(h.WagerVal)end;i.nudgeLeft=l end)end):OnUIActionInput(function(self,h,i,w,x,q)return{h.WagerVal||1000}end):OnRoundStarted(function(self,p)end):OnHouseTurn(function(self,p)p:AddRandomCardToHand(2)self:FinishRound()end):OnPlayerRequestAction(function(self,c,r,y)c:SetCooldown(1)local z=math.max(0,tonumber(y[1])||0)if z>0&&!casino.HasMoney(c.entity,z)then self:Next(c)return end;if z>0 then casino.TakeMoney(c.entity,z)c:SetWager(z)else c:SetWager(0)end;c.betAction=r;c:AddRandomCardToHand(2)self:Next(c)end):OnRoundFinished(function(self)local s=self.House:GetValue()for f,c in pairs(self.playing)do if!IsValid(c.entity)then continue end;local d=c:GetValue()local A=c.betAction||'Bet Player'if s==d then self:SetPush(c)continue end;if A=='Bet Player'then if d>0&&(d==9||math.abs(9-d)<math.abs(9-s))then self:SetWinner(c,1/1)else self:SetLoser(c)end end;if A=='Bet Banker'then if d>0&&(d==9||math.abs(9-d)>math.abs(9-s))then self:SetWinner(c,1/1)else self:SetLoser(c)end end end end)
--addons/!lpakr_out/lua/autorun/sh_chess.lua:
return lpakr()()
--addons/!lpakr_out/lua/chess/ui/cl_dermaboard.lua:
local a={Main=Color(0,0,0,200),Hover=Color(0,255,0,50),Selected=Color(150,50,50,170),Move=Color(10,25,150,150),HasMoved=Color(50,50,50,100),Text=Color(0,0,0,255),GridWhite=Color(255,248,220),GridBlack=Color(210,180,140),White=Color(180,180,180),Black=Color(0,0,0)}surface.CreateFont('ChessPieces',{font='Arial',size=64,weight=300})local function b(c,d,e)if d.Squares then for f,g in pairs(d.Squares)do for f,h in pairs(g)do h:Remove()end end end;for i=0,7 do d.Squares[i]={}for j=0,7 do local h=vgui.Create('DModelPanel',d)d.Squares[i][j]=h;h:SetPos((e&&7-i||i)*90,(e&&7-j||j)*90)h:SetSize(90,90)h.GridCol=(i+j)%2==1&&a.GridBlack||a.GridWhite;h.GridPos={i,j}h.oPaint=h.Paint;h.Paint=function(k,l,m)surface.SetDrawColor(k.GridCol)surface.DrawRect(0,0,l,m)if!IsValid(c)then return end;if k:IsHovered()then surface.SetDrawColor(a.Hover)surface.DrawRect(0,0,l,m)end;if c.Selected&&c.Selected[1]==k.GridPos[1]&&c.Selected[2]==k.GridPos[2]then surface.SetDrawColor(a.Selected)surface.DrawRect(0,0,l,m)end;if c:GetTableGrid(c.Moves,k.GridPos[1],k.GridPos[2])then surface.SetDrawColor(a.Move)surface.DrawRect(0,0,l,m)end;local n,o=c.Pieces[Chess.NumToLetter[k.GridPos[1]+1]]if n then o=n[8-k.GridPos[2]]if o then if!(o.Team&&o.Class)then return end;if o.Moving then surface.SetDrawColor(a.HasMoved)surface.DrawRect(0,0,l,m)end;if c.Characters then draw.SimpleText(c.Characters[o.Team..o.Class],'ChessPieces',l/2,m/2,a.Text,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)else k:SetModel(c.Models[o.Team..o.Class])return k.oPaint(k,l,m)end end end;if cvars.Bool('chess_gridletters')then local p=(Chess.NumToLetter[i+1]..tostring(8-j)):upper()draw.SimpleText(p,'ui.16',5,m-20,a.Black)end end;h.DoClick=function(k)if!IsValid(c)then return end;if c.Selected&&c:GetTableGrid(c.Moves,h.GridPos[1],h.GridPos[2])then c:RequestMove(c.Selected[1],c.Selected[2],h.GridPos[1],h.GridPos[2])c:ResetHighlights()elseif c.Selected&&c.Selected[1]==k.GridPos[1]&&c.Selected[2]==k.GridPos[2]then c:ResetHighlights()else c:ResetHighlights()c.Selected={k.GridPos[1],k.GridPos[2]}c.Moves=c:GetMove(Chess.NumToLetter[k.GridPos[1]+1],8-k.GridPos[2])end end;h.LayoutEntity=function(k,q)q:SetPos(Vector(20,20,20))q:SetAngles(Angle(0,-50,0))end;h:SetModel(c.Models.WhitePawn)end end end;function Chess.Open2DBoard(c)if!IsValid(c)then return end;if IsValid(Chess.TwoDDermaPanel)then Chess.TwoDDermaPanel:Remove()end;Chess.TwoDDermaPanel=ui.Create('ui_frame',function(self)self:SetTitle'2D Game Board'self:SetSize(740,760)self:SetPos(ScrW()/2-370,ScrH()/2-380)self:SetMouseInputEnabled(true)end)local r=Chess.TwoDDermaPanel;r.Think=function(k,l,m)if!IsValid(c)then k:Remove()end end;local d=ui.Create('ui_panel',function(self)self:SetSize(720,720)self:SetPos(10,30)self.Squares={}self.Paint=function()end end,Chess.TwoDDermaPanel)local s=vgui.Create('DButton',r)s:SetImage'icon16/arrow_rotate_clockwise.png's:SetSize(18,18)s:SetPos(690,6)s:SetText''s.DoClick=function(k)k.Swapped=!k.Swapped;b(c,d,k.Swapped)end;s.Paint=function()end;local t=vgui.Create('DCheckBox',r)t:SetImage'icon16/font.png't:SetSize(18,18)t:SetPos(670,6)t:SetText''t:SetConVar'chess_gridletters't.OnChange=function(k,u)k:SetAlpha(k:GetChecked()&&255||100)end;t.Paint=function()end;t.PerformLayout=function(k)if IsValid(k.m_Image)then k.m_Image:SetPos(4,(k:GetTall()-k.m_Image:GetTall())*0.5)k:SetTextInset(k.m_Image:GetWide()+16,0)end;DLabel.PerformLayout(k)end;s.Swapped=false;b(c,d,s.Swapped)end
--addons/!lpakr_out/lua/wos/anim_extension/extensions/wos_l4d.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/anim_extension/extensions/wos_riddick.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/anim_extension/vgui/wiltos_anim_viewer.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/angle.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/rangerdata.lua:
GateActions("Ranger")GateActions["rd_trace"]={name="Trace",description="Traces a line between two positions and outputs a ranger data.",inputs={"Startpos","Endpos"},inputtypes={"VECTOR","VECTOR"},outputtypes={"RANGER"},timed=true,output=function(a,b,c)if!isvector(b)then b=Vector(0,0,0)end;if!isvector(c)then c=Vector(0,0,0)end;local d={}d.start=b;d.endpos=c;return util.TraceLine(d)end,label=function(e,b,c)return string.format("trace(%s , %s)",b,c)end}GateActions["rd_hitpos"]={name="Hit Position",description="Outputs the hit position of the ranger.",inputs={"A"},inputtypes={"RANGER"},outputtypes={"VECTOR"},timed=true,output=function(a,f)if!f then return Vector(0,0,0)end;if f.StartSolid then return f.StartPos end;return f.HitPos end,label=function(e,f)return string.format("hitpos(%s) = (%d,%d,%d)",f,e.x,e.y,e.z)end}GateActions["rd_hitnorm"]={name="Hit Normal",description="Outputs the direction of the hit surface.",inputs={"A"},inputtypes={"RANGER"},outputtypes={"VECTOR"},timed=true,output=function(a,f)if!f then return Vector(0,0,0)end;return f.HitNormal end,label=function(e,f)return string.format("hitnormal(%s) = (%d,%d,%d)",f,e.x,e.y,e.z)end}GateActions["rd_entity"]={name="Entity",description="Outputs the entity that the ranger hit, if it did.",inputs={"A"},inputtypes={"RANGER"},outputtypes={"ENTITY"},timed=true,output=function(a,f)if!f then return NULL end;return f.Entity end,label=function(e,f)return string.format("hitentity(%s) = %s",f,tostring(e))end}GateActions["rd_hitworld"]={name="Hit World",description="Outputs 1 if the ranger hit the world.",inputs={"A"},inputtypes={"RANGER"},outputtypes={"NORMAL"},timed=true,output=function(a,f)if!f then return 0 end;return f.HitWorld&&1||0 end,label=function(e,f)return string.format("hitworld(%s) = %d",f,e&&1||0)end}GateActions["rd_hit"]={name="Hit",description="Outputs 1 if the ranger hit anything.",inputs={"A"},inputtypes={"RANGER"},outputtypes={"NORMAL"},timed=true,output=function(a,f)if!f then return 0 end;return f.Hit&&1||0 end,label=function(e,f)return string.format("hit(%s) = %d",f,e&&1||0)end}GateActions["rd_distance"]={name="Distance",description="Outputs the distance of the ranger hit.",inputs={"A"},inputtypes={"RANGER"},outputtypes={"NORMAL"},timed=true,output=function(a,f)if!f then return 0 end;if f.StartSolid then return f.StartPos:Distance(f.HitPos)*(1/(1-f.FractionLeftSolid)-1)end;return f.StartPos:Distance(f.HitPos)end,label=function(e,f)return string.format("distance(%s) = %d",f,e)end}GateActions()
--addons/!lpakr_out/lua/wire/timedpairs.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/wire_expression2_browser.lua:
local a={}local b={["*"]="",["?"]="",[">"]="",["<"]="",["|"]="",["\\"]="",['"']="",[" "]="_"}local function c(d)return string.match(d,"[/\\]?([^/\\]*)$")end;local e=string.find;local f=string.lower;function a:Search(g,h,i,j,k)if!self.SearchFolders[i]then self.SearchFolders[i]=(self.SearchFolders[j]||self.Folders):AddNode(h)local l,m=file.Find(i.."/*","DATA")local n=self.SearchFolders[i]if i==self.startfolder then self.Root=n end;n.Icon:SetImage("icon16/arrow_refresh.png")n:SetExpanded(true)local o=0;for p=1,#l do if e(f(l[p]),g,1,true)!=nil then local q=n:AddNode(l[p],"icon16/page_white.png")q:SetFileName(i.."/"..l[p])o=o+1 end;coroutine.yield()end;if#m==0 then if o==0 then if n!=self.Root then n:Remove()end;if k then coroutine.yield(false,o)else return false,o end end;n.Icon:SetImage("icon16/folder.png")if k then coroutine.yield(true,o)else return true,o end else for p=1,#m do local r,s=self:Search(g,m[p],i.."/"..m[p],i)if r then o=o+s end;coroutine.yield()end;if o>0 then n.Icon:SetImage("icon16/folder.png")if k then coroutine.yield(true,o)else return true,o end else if n!=self.Root then n:Remove()end;if k then coroutine.yield(false,o)else return false,o end end end end;if k then coroutine.yield(false,0)else return false,0 end end;function a:CheckSearchResults(t,u,v)if u!=nil&&v!=nil then if v==0 then local n=self.Root:AddNode("No results")n.Icon:SetImage("icon16/exclamation.png")self.Root.Icon:SetImage("icon16/folder.png")end;timer.Remove("wire_expression2_search")return true elseif!t then timer.Remove("wire_expression2_search")return true end end;function a:StartSearch(g)self:UpdateFolders(true)self.SearchFolders={}local w=coroutine.create(self.Search)local t,u,v=coroutine.resume(w,self,g,self.startfolder,self.startfolder,"",true)self:CheckSearchResults(t,u,v)timer.Create("wire_expression2_search",0,0,function()for p=1,100 do local t,u,v=coroutine.resume(w)if self:CheckSearchResults(t,u,v)then return end end end)end;function a:Init()self:SetPaintBackground(false)self.SearchBox=vgui.Create("DTextEntry",self)self.SearchBox:Dock(TOP)self.SearchBox:DockMargin(0,0,0,0)self.SearchBox:SetPlaceholderText("Search...")local x=vgui.Create("DImageButton",self.SearchBox)x:SetMaterial("icon16/cross.png")local y=self.SearchBox;function x:DoClick()y:SetValue("")y:OnEnter()end;x:DockMargin(2,2,4,2)x:Dock(RIGHT)x:SetSize(14,10)x:SetVisible(false)function self.SearchBox.OnEnter()local g=self.SearchBox:GetValue()if g!=""then self:StartSearch(string.Replace(string.lower(g)," ","_"))x:SetVisible(true)else timer.Remove("wire_expression2_search")self:UpdateFolders()x:SetVisible(false)end end;self.Update=vgui.Create("DButton",self)self.Update:SetTall(20)self.Update:Dock(BOTTOM)self.Update:DockMargin(0,0,0,0)self.Update:SetText("Update")self.Update.DoClick=function(z)self:UpdateFolders()end;self.Folders=vgui.Create("DTree",self)self.Folders:Dock(FILL)self.Folders:DockMargin(0,0,0,0)self.panelmenu={}self.filemenu={}self.foldermenu={}self.lastClick=CurTime()self:AddRightClick(self.filemenu,nil,"Open",function()self:OnFileOpen(self.File:GetFileName(),false)end)self:AddRightClick(self.filemenu,nil,"Open in New Tab",function()self:OnFileOpen(self.File:GetFileName(),true)end)self:AddRightClick(self.filemenu,nil,"*SPACER*")self:AddRightClick(self.filemenu,nil,"Rename to..",function()local A=string.StripExtension(c(self.File:GetFileName()))Derma_StringRequestNoBlur("Rename File \""..A.."\"","Rename file "..A,A,function(B)B=string.gsub(B,".",b)..".txt"local C=string.GetPathFromFilename(self.File:GetFileName()).."/"..B;if file.Exists(C,"DATA")then WireLib.AddNotify("File already exists ("..B..")",NOTIFY_ERROR,7,NOTIFYSOUND_ERROR1)elseif!file.Rename(self.File:GetFileName(),C)then WireLib.AddNotify("Rename was not successful",NOTIFY_ERROR,7,NOTIFYSOUND_ERROR1)end;self:UpdateFolders()end)end)self:AddRightClick(self.filemenu,nil,"Copy to..",function()local A=string.StripExtension(c(self.File:GetFileName()))Derma_StringRequestNoBlur("Copy File \""..A.."\"","Copy File to...",A,function(B)B=string.gsub(B,".",b)file.Write(string.GetPathFromFilename(self.File:GetFileName()).."/"..B..".txt",file.Read(self.File:GetFileName()))self:UpdateFolders()end)end)self:AddRightClick(self.filemenu,nil,"*SPACER*")self:AddRightClick(self.filemenu,nil,"New File",function()Derma_StringRequestNoBlur("New File in \""..string.GetPathFromFilename(self.File:GetFileName()).."\"","Create new file","",function(B)B=string.gsub(B,".",b)file.Write(string.GetPathFromFilename(self.File:GetFileName()).."/"..B..".txt","")self:UpdateFolders()end)end)self:AddRightClick(self.filemenu,nil,"Delete",function()local D=self.File:GetFileName()Derma_Query("Delete this file?\n\n"..c(D),"Delete","Delete",function()if file.Exists(D,"DATA")then file.Delete(D)self:UpdateFolders()end end,"Cancel")end)self:AddRightClick(self.foldermenu,nil,"New File..",function()Derma_StringRequestNoBlur("New File in \""..self.File:GetFolder().."\"","Create new file","",function(B)B=string.gsub(B,".",b)file.Write(self.File:GetFolder().."/"..B..".txt","")self:UpdateFolders()end)end)self:AddRightClick(self.foldermenu,nil,"New Folder..",function()Derma_StringRequestNoBlur("new folder in \""..self.File:GetFolder().."\"","Create new folder","",function(B)B=string.gsub(B,".",b)file.CreateDir(self.File:GetFolder().."/"..B)self:UpdateFolders()end)end)self:AddRightClick(self.foldermenu,nil,"Rename to..",function()local i=string.Split(self.File:GetFolder(),"/")local E=table.remove(i)Derma_StringRequestNoBlur("Rename folder \""..self.File:GetFolder().."\"","Rename Folder",E,function(B)B=string.gsub(B,".",b)if#i==0||#B==0 then return end;local F=table.concat(i,"/").."/"..B;if file.Exists(F,"DATA")then WireLib.AddNotify("Folder already exists ("..B..")",NOTIFY_ERROR,7,NOTIFYSOUND_ERROR1)elseif!file.Rename(self.File:GetFolder(),F)then WireLib.AddNotify("Rename was not successful",NOTIFY_ERROR,7,NOTIFYSOUND_ERROR1)end;self:UpdateFolders()end)end)self:AddRightClick(self.panelmenu,nil,"New File..",function()Derma_StringRequestNoBlur("New File in \""..self.File:GetFolder().."\"","Create new file","",function(B)B=string.gsub(B,".",b)file.Write(self.File:GetFolder().."/"..B..".txt","")self:UpdateFolders()end)end)self:AddRightClick(self.panelmenu,nil,"New Folder..",function()Derma_StringRequestNoBlur("new folder in \""..self.File:GetFolder().."\"","Create new folder","",function(B)B=string.gsub(B,".",b)file.CreateDir(self.File:GetFolder().."/"..B)self:UpdateFolders()end)end)end;function a:OnFileOpen(d,G)error("Please override wire_expression2_browser:OnFileOpen(filepath, newtab)",0)end;function a:UpdateFolders(H)self.Folders:Clear(true)if IsValid(self.Root)then self.Root:Remove()end;if!H then self.Root=self.Folders.RootNode:AddFolder(self.startfolder,self.startfolder,"DATA",true)self.Root:SetExpanded(true)end;self.Folders.DoClick=function(I,n)if self.File==n&&CurTime()<=self.lastClick+0.5 then self:OnFileOpen(n:GetFileName())elseif self.OpenOnSingleClick then self.OpenOnSingleClick:LoadFile(n:GetFileName())end;self.File=n;self.lastClick=CurTime()return true end;self.Folders.DoRightClick=function(I,n)self.File=n;if n:GetFileName()then self:OpenMenu(self.filemenu)else self:OpenMenu(self.foldermenu)end;return true end;self:OnFolderUpdate(self.startfolder)end;function a:GetFileName()if!IsValid(self.File)then return end;return self.File:GetFileName()end;function a:GetFileNode()return self.File end;function a:OpenMenu(J)if!J||!IsValid(self.Folders)then return end;if#J<1 then return end;self.Menu=vgui.Create("DMenu",self.Folders)for K,L in pairs(J)do local M,N=L[1],L[2]if M=="*SPACER*"then self.Menu:AddSpacer()else self.Menu:AddOption(M,N)end end;self.Menu:Open()end;function a:AddRightClick(J,O,M,N)if!J then J={}end;if!O then O=#J+1 end;if J[O]then table.insert(J,O,{M,N})return end;J[O]={M,N}end;function a:RemoveRightClick(M)for K,L in pairs(self.filemenu)do if L[1]==M then self.filemenu[K]=nil;break end end end;function a:Setup(P)self.startfolder=P;self:UpdateFolders()end;function a:OnFolderUpdate(P)end;a.Refresh=a.UpdateFolders;vgui.Register("wire_expression2_browser",a,"DPanel")
--addons/!lpakr_out/lua/wire/client/thrusterlib.lua:
CreateConVar("cl_drawthrusterseffects","1")local a=Material("sprites/heatwave")local b=Material("effects/fire_cloud1")local c=Material("effects/strider_muzzle")local d=Material("effects/bloodstream")local e=ParticleEmitter(Vector(0,0,0))WireLib.ThrusterEffectThink={}WireLib.ThrusterEffectDraw={}local function f(g,h)return function(self)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()local k=CurTime()*-10;render.SetMaterial(g)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,0,255,128))render.AddBeam(i+j*60,32,k+1,Color(255,255,255,128))render.AddBeam(i+j*148,32,k+3,Color(255,255,255,0))render.EndBeam()k=k*0.5;render.UpdateRefractTexture()render.SetMaterial(h)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,0,255,128))render.AddBeam(i+j*32,32,k+2,Color(255,255,255,255))render.AddBeam(i+j*128,48,k+5,Color(0,0,0,0))render.EndBeam()k=k*1.3;render.SetMaterial(g)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,0,255,128))render.AddBeam(i+j*60,16,k+1,Color(255,255,255,128))render.AddBeam(i+j*148,16,k+3,Color(255,255,255,0))render.EndBeam()end end;WireLib.ThrusterEffectDraw.fire=f(b,a)WireLib.ThrusterEffectDraw.heatwave=f(a,a)WireLib.ThrusterEffectDraw.color=function(self)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()local k=CurTime()*-10;render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(255,0,0,128))render.AddBeam(i+j*60,32,k+1,Color(255,255,255,128))render.AddBeam(i+j*148,32,k+3,Color(255,255,255,0))render.EndBeam()k=k*0.5;render.UpdateRefractTexture()render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,255,0,128))render.AddBeam(i+j*32,32,k+2,Color(255,255,255,255))render.AddBeam(i+j*128,48,k+5,Color(0,0,0,0))render.EndBeam()k=k*1.3;render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,0,255,128))render.AddBeam(i+j*60,16,k+1,Color(255,255,255,128))render.AddBeam(i+j*148,16,k+3,Color(255,255,255,0))render.EndBeam()end;WireLib.ThrusterEffectDraw.color_random=function(self)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()local k=CurTime()*-10;render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(255,0,0,128))render.AddBeam(i+j*60,32,k+1,Color(math.random(0,255),math.random(0,255),math.random(0,255),128))render.AddBeam(i+j*148,32,k+3,Color(math.random(0,255),math.random(0,255),math.random(0,255),0))render.EndBeam()k=k*0.5;render.UpdateRefractTexture()render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,255,0,128))render.AddBeam(i+j*32,32,k+2,Color(math.random(0,255),math.random(0,255),math.random(0,255),255))render.AddBeam(i+j*128,48,k+5,Color(0,0,0,0))render.EndBeam()k=k*1.3;render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,0,255,128))render.AddBeam(i+j*60,16,k+1,Color(math.random(0,255),math.random(0,255),math.random(0,255),128))render.AddBeam(i+j*148,16,k+3,Color(math.random(0,255),math.random(0,255),math.random(0,255),0))render.EndBeam()end;WireLib.ThrusterEffectDraw.color_diy=function(self)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()local l=self:GetColor()local k=CurTime()*-10;render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(255,0,0,128))render.AddBeam(i+j*60,32,k+1,Color(l.r,l.g,l.g,128))render.AddBeam(i+j*148,32,k+3,Color(l.r,l.g,l.b,0))render.EndBeam()k=k*0.5;render.UpdateRefractTexture()render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,255,0,128))render.AddBeam(i+j*32,32,k+2,Color(l.r,l.g,l.g,255))render.AddBeam(i+j*128,48,k+5,Color(0,0,0,0))render.EndBeam()k=k*1.3;render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,0,255,128))render.AddBeam(i+j*60,16,k+1,Color(l.r,l.g,l.g,128))render.AddBeam(i+j*148,16,k+3,Color(255,255,255,0))render.EndBeam()end;WireLib.ThrusterEffectDraw.plasma=function(self)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()local k=CurTime()*-20;render.SetMaterial(c)k=k*0.9;render.StartBeam(3)render.AddBeam(i,16,k,Color(0,255,255,255))render.AddBeam(i+j*8,16,k+0.01,Color(255,255,255,255))render.AddBeam(i+j*64,16,k+0.02,Color(0,255,255,0))render.EndBeam()k=k*0.9;render.StartBeam(3)render.AddBeam(i,16,k,Color(0,255,255,255))render.AddBeam(i+j*8,16,k+0.01,Color(255,255,255,255))render.AddBeam(i+j*64,16,k+0.02,Color(0,255,255,0))render.EndBeam()k=k*0.9;render.StartBeam(3)render.AddBeam(i,16,k,Color(0,255,255,255))render.AddBeam(i+j*8,16,k+0.01,Color(255,255,255,255))render.AddBeam(i+j*64,16,k+0.02,Color(0,255,255,0))render.EndBeam()end;WireLib.ThrusterEffectDraw.fire_smoke=function(self)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()self.EffectAvg=(self.EffectAvg*29+math.min(self:GetNWFloat("Thrust")/100000,100))/30;local m=self.EffectAvg;local k=CurTime()*-10;render.SetMaterial(b)render.StartBeam(3)render.AddBeam(i,m/6,k,Color(0,0,255,128))render.AddBeam(i+j*m,m/2,k+1,Color(255,255,255,128))render.AddBeam(i+j*m*2,m/2,k+3,Color(255,255,255,0))render.EndBeam()k=k*0.5;render.UpdateRefractTexture()render.SetMaterial(a)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,0,255,128))render.AddBeam(i+j*m,32,k+2,Color(255,255,255,255))render.AddBeam(i+j*m*2,48,k+5,Color(0,0,0,0))render.EndBeam()k=k*1.3;render.SetMaterial(b)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,0,255,128))render.AddBeam(i+j*m,16,k+1,Color(255,255,255,128))render.AddBeam(i+j*m*2,16,k+3,Color(255,255,255,0))render.EndBeam()self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+0.015;local n=Vector(j.z,j.x,j.y)n=(n-j*j:Dot(n)):GetNormalized()local o=j:Cross(n)local p=e:Add("particles/smokey",i)p:SetVelocity(j*math.Rand(m*19,m*20)+n*math.Rand(-50,50)+o*math.Rand(-50,50))p:SetAirResistance(60)p:SetDieTime(2.0)p:SetStartAlpha(math.Rand(0,10))p:SetEndAlpha(200)p:SetStartSize(math.Rand(16,24))p:SetEndSize(math.Rand(10+m/2,30+m/2))p:SetRoll(math.Rand(-0.2,0.2))p:SetColor(200,200,210)end;WireLib.ThrusterEffectDraw.fire_smoke_big=function(self)self.RingTimer=self.RingTimer||0;if self.RingTimer>CurTime()then return end;self.RingTimer=CurTime()+0.005;local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()local q=EffectData()q:SetOrigin(i)q:SetNormal(j)q:SetRadius(5)q:SetScale(3)util.Effect("HelicopterMegaBomb",q)i=self:LocalToWorld(self:GetOffset())+Vector(math.Rand(-3,3),math.Rand(-3,3),math.Rand(-3,3))j=self:CalcNormal()local p=e:Add("particles/smokey",i)p:SetVelocity(j*math.Rand(10,20))p:SetDieTime(3.0)p:SetStartAlpha(math.Rand(150,255))p:SetStartSize(math.Rand(64,128))p:SetEndSize(math.Rand(256,128))p:SetRoll(math.Rand(-0.2,0.2))p:SetColor(200,200,210)q=EffectData()q:SetOrigin(i)q:SetNormal(j)util.Effect("ThumperDust ",q)end;local function r(s)return function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+0.015;local i=self:LocalToWorld(self:GetOffset())+Vector(math.Rand(-3,3),math.Rand(-3,3),math.Rand(-3,3))local j=self:CalcNormal()local p=e:Add("particles/smokey",i)p:SetVelocity(j*math.Rand(10,30))p:SetDieTime(2.0)p:SetStartAlpha(math.Rand(50,150))p:SetStartSize(math.Rand(16,32))p:SetEndSize(math.Rand(64,128))p:SetRoll(math.Rand(-0.2,0.2))p:SetColor(s(self))end end;WireLib.ThrusterEffectThink.smoke=r(function()return 200,200,210 end)WireLib.ThrusterEffectThink.smoke_firecolors=r(function()return math.random(220,255),math.random(110,220),0 end)WireLib.ThrusterEffectThink.smoke_random=r(function()return math.random(100,255),math.random(100,255),math.random(100,255)end)WireLib.ThrusterEffectThink.smoke_diy=r(function(self)local l=self:GetColor()return l.r,l.g,l.b end)WireLib.ThrusterEffectDraw.color_magic=function(self)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()local k=CurTime()*-10;render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(255,0,0,128))render.AddBeam(i+j*60,32,k+1,Color(255,255,255,128))render.AddBeam(i+j*148,32,k+3,Color(255,255,255,0))render.EndBeam()k=k*0.5;render.UpdateRefractTexture()render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,255,0,128))render.AddBeam(i+j*32,32,k+2,Color(255,255,255,255))render.AddBeam(i+j*128,48,k+5,Color(0,0,0,0))render.EndBeam()k=k*1.3;render.SetMaterial(d)render.StartBeam(3)render.AddBeam(i,8,k,Color(0,0,255,128))render.AddBeam(i+j*60,16,k+1,Color(255,255,255,128))render.AddBeam(i+j*148,16,k+3,Color(255,255,255,0))render.EndBeam()self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+0.00005;i=self:LocalToWorld(self:GetOffset())j=self:CalcNormal()i=i+VectorRand()*5;local p=e:Add("sprites/gmdm_pickups/light",i)p:SetVelocity(j*math.Rand(50,80))p:SetDieTime(1)p:SetStartAlpha(255)p:SetEndAlpha(255)p:SetStartSize(math.Rand(1,3))p:SetEndSize(0)p:SetRoll(math.Rand(-0.2,0.2))end;WireLib.ThrusterEffectThink.money=function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+math.random(0.005,0.00005)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()i=i+VectorRand()*20;local p=e:Add("thrusteraddon/money"..math.floor(math.random(1,3)).."",i)p:SetVelocity(j*math.Rand(0,70))p:SetDieTime(math.Rand(3,5))p:SetStartAlpha(255)p:SetEndAlpha(0)p:SetStartSize(5)p:SetEndSize(5)p:SetRoll(math.Rand(-90,90))end;local function t(u)return function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+0.05;local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()local p=e:Add("decals/cross",i)p:SetVelocity(j*0)p:SetDieTime(u)p:SetStartAlpha(255)p:SetEndAlpha(255)p:SetColor(0,255,0)p:SetStartSize(5)p:SetEndSize(math.Rand(7,10))p:SetRoll(0)end end;WireLib.ThrusterEffectThink.debug_10=t(10)WireLib.ThrusterEffectThink.debug_30=t(30)WireLib.ThrusterEffectThink.debug_60=t(60)WireLib.ThrusterEffectThink.souls=function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+0.05;local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()i=i+VectorRand()*20;local p=e:Add("sprites/soul",i)p:SetVelocity(j*math.Rand(0,50))p:SetDieTime(math.Rand(3,5))p:SetStartAlpha(255)p:SetEndAlpha(0)p:SetColor(255,255,255)p:SetStartSize(0)p:SetEndSize(math.Rand(7,10))p:SetRoll(math.Rand(-90,90))end;WireLib.ThrusterEffectThink.sperm=function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+math.random(0.005,0.00005)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()i=i+VectorRand()*5;local p=e:Add("thrusteraddon/sperm",i)p:SetVelocity(j*math.Rand(0,70))p:SetDieTime(math.Rand(3,5))p:SetStartAlpha(255)p:SetEndAlpha(200)p:SetStartSize(10)p:SetEndSize(1)p:SetRoll(math.random(-180,180))local v=e:Add("thrusteraddon/goo",i)v:SetVelocity(j*0.5)v:SetDieTime(math.Rand(3,5))v:SetStartAlpha(100)v:SetEndAlpha(5)v:SetColor(255,255,255)v:SetStartSize(5)v:SetEndSize(1)v:SetRoll(math.random(-180,180))local w=e:Add("thrusteraddon/goo2",i)w:SetVelocity(j*0.5)w:SetDieTime(math.Rand(3,5))w:SetStartAlpha(100)w:SetEndAlpha(5)w:SetColor(255,255,255)w:SetStartSize(5)w:SetEndSize(1)w:SetRoll(math.random(-180,180))end;WireLib.ThrusterEffectThink.feather=function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+math.random(0.005,0.00005)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()i=i+VectorRand()*30;local p=e:Add("thrusteraddon/feather"..math.floor(math.random(2,4)).."",i)p:SetVelocity(j*math.Rand(0,50))p:SetDieTime(math.Rand(5,7))p:SetStartAlpha(120)p:SetEndAlpha(0)p:SetStartSize(5)p:SetEndSize(5)p:SetRoll(math.Rand(-90,90))end;WireLib.ThrusterEffectThink.goldstar=function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+math.random(0.005,0.00005)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()i=i+VectorRand()*10;local p=e:Add("thrusteraddon/Goldstar",i)p:SetVelocity(j*math.Rand(150,200))p:SetDieTime(math.Rand(0,1))p:SetStartAlpha(120)p:SetEndAlpha(0)p:SetStartSize(5)p:SetEndSize(5)p:SetRoll(math.Rand(-90,90))end;WireLib.ThrusterEffectThink.candy_cane=function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+math.random(0.005,0.00005)local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()i=i+VectorRand()*5;local p=e:Add("thrusteraddon/candy",i)p:SetVelocity(j*math.Rand(0,20))p:SetDieTime(math.Rand(5,7))p:SetStartAlpha(120)p:SetEndAlpha(0)p:SetStartSize(5)p:SetEndSize(5)p:SetRoll(math.Rand(-90,90))end;local function x(s)return function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+0.0000005;local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()local y=math.Rand(90,252)local z=math.Rand(-90,90)local p=e:Add("particle/fire",i)p:SetVelocity(j*y)p:SetDieTime(0.3)p:SetStartAlpha(255)p:SetEndAlpha(150)p:SetStartSize(15.8)p:SetEndSize(9)p:SetColor(s(self))p:SetRoll(z)local w=e:Add("sprites/heatwave",i)w:SetVelocity(j*y)w:SetDieTime(0.7)w:SetStartAlpha(255)w:SetEndAlpha(255)w:SetStartSize(16)w:SetEndSize(18)w:SetColor(255,255,255)w:SetRoll(z)local v=e:Add("particle/fire",i)v:SetVelocity(j*y)v:SetDieTime(0.2)v:SetStartAlpha(200)v:SetEndAlpha(50)v:SetStartSize(8.8)v:SetEndSize(5)v:SetColor(200,200,200)v:SetRoll(z)end end;WireLib.ThrusterEffectThink.jetflame=x(function()return math.Rand(220,255),math.Rand(180,220),55 end)WireLib.ThrusterEffectThink.jetflame_purple=x(function()return math.Rand(220,255),55,math.Rand(180,220)end)WireLib.ThrusterEffectThink.jetflame_red=x(function()return math.Rand(220,255),55,55 end)WireLib.ThrusterEffectThink.jetflame_blue=x(function()return 55,55,math.Rand(220,255)end)WireLib.ThrusterEffectThink.jetflame_diy=x(function(self)local l=self:GetColor()return l.r,l.g,l.b end)local function A(s)return function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+0.025;local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()i=i+VectorRand()*2;local p=e:Add("sprites/sent_ball",i)p:SetVelocity(j*80)p:SetDieTime(1)p:SetStartAlpha(255)p:SetEndAlpha(255)p:SetColor(s(self))p:SetStartSize(4)p:SetEndSize(0)p:SetRoll(0)end end;WireLib.ThrusterEffectThink.balls_firecolors=A(function()return math.random(220,255),math.random(100,200),0 end)WireLib.ThrusterEffectThink.balls_random=A(function()return math.random(0,255),math.random(0,255),math.random(0,255)end)WireLib.ThrusterEffectThink.balls=A(function(self)local s=self:GetColor()return s.r,s.g,s.b end)WireLib.ThrusterEffectThink.plasma_rings=function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+0.00005;local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()i=i+VectorRand()*5;local p=e:Add("sprites/magic",i)p:SetVelocity(j*math.Rand(50,80))p:SetDieTime(1)p:SetStartAlpha(255)p:SetEndAlpha(255)p:SetStartSize(math.Rand(3,5))p:SetEndSize(0)p:SetRoll(math.Rand(-0.2,0.2))end;local function B(s)return function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+0.00005;local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()i=i+VectorRand()*5;local p=e:Add("sprites/gmdm_pickups/light",i)p:SetVelocity(j*math.Rand(50,80))p:SetDieTime(1)p:SetStartAlpha(255)p:SetEndAlpha(255)p:SetColor(s(self))p:SetStartSize(math.Rand(1,3))p:SetEndSize(0)p:SetRoll(math.Rand(-0.2,0.2))end end;WireLib.ThrusterEffectThink.magic_firecolors=B(function()return math.random(220,255),math.random(100,200),0 end)WireLib.ThrusterEffectThink.magic=B(function()return 255,255,255 end)WireLib.ThrusterEffectThink.magic_diy=B(function(self)local l=self:GetColor()return l.r,l.g,l.b end)WireLib.ThrusterEffectThink.magic_color=B(function()return math.random(0,255),math.random(0,255),math.random(0,255)end)local function C(D,E,F,G)G=G||0;return function(self)self.RingTimer=self.RingTimer||0;if self.RingTimer>CurTime()then return end;self.RingTimer=CurTime()+E;local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()local q=EffectData()q:SetOrigin(i)q:SetNormal(j)q:SetRadius(F)q:SetScale(F)q:SetMagnitude(G)util.Effect(D,q)end end;WireLib.ThrusterEffectDraw.rings=C("thruster_ring",0.00005,1)WireLib.ThrusterEffectDraw.tesla=C("TeslaZap",0.00005,1)WireLib.ThrusterEffectDraw.blood=C("BloodImpact",0.00005,1)WireLib.ThrusterEffectDraw.some_sparks=C("StunstickImpact",0.00005,1)WireLib.ThrusterEffectDraw.spark_fountain=C("ManhackSparks",0.00005,1)WireLib.ThrusterEffectDraw.more_sparks=C("cball_explode",0.00005,1)WireLib.ThrusterEffectDraw.water_small=C("watersplash",0.05,2)WireLib.ThrusterEffectDraw.water_medium=C("watersplash",0.05,6)WireLib.ThrusterEffectDraw.water_big=C("watersplash",0.05,10)WireLib.ThrusterEffectDraw.water_huge=C("watersplash",0.05,18)WireLib.ThrusterEffectDraw.striderblood_small=C("StriderBlood",0.05,0.1)WireLib.ThrusterEffectDraw.striderblood_medium=C("StriderBlood",0.05,0.7)WireLib.ThrusterEffectDraw.striderblood_big=C("StriderBlood",0.05,1.15)WireLib.ThrusterEffectDraw.striderblood_huge=C("StriderBlood",0.05,2)WireLib.ThrusterEffectDraw.rings_grow=C("thruster_ring",0.00005,1,0.08)WireLib.ThrusterEffectDraw.rings_grow_rings=function(self)self.RingTimer=self.RingTimer||0;if self.RingTimer>CurTime()then return end;self.RingTimer=CurTime()+0.00005;local q=EffectData()q:SetOrigin(self:LocalToWorld(self:GetOffset()))q:SetNormal(self:CalcNormal())q:SetMagnitude(0.08)util.Effect("thruster_ring",q)q:SetMagnitude(0.06)util.Effect("thruster_ring",q)q:SetMagnitude(0.04)util.Effect("thruster_ring",q)q:SetMagnitude(0.02)util.Effect("thruster_ring",q)q:SetMagnitude(0)util.Effect("thruster_ring",q)end;WireLib.ThrusterEffectDraw.rings_shrink=C("thruster_ring",0.00005,1,-0.02)WireLib.ThrusterEffectThink.bubble=function(self)self.SmokeTimer=self.SmokeTimer||0;if self.SmokeTimer>CurTime()then return end;self.SmokeTimer=CurTime()+0.005;local i=self:LocalToWorld(self:GetOffset())local j=self:CalcNormal()i=i+VectorRand()*5;local p=e:Add("effects/bubble",i)j.x=j.x*0.7;j.y=j.y*0.7;j.z=(j.z+1)*20;p:SetVelocity(j)p:SetDieTime(2)p:SetStartAlpha(125)p:SetEndAlpha(125)p:SetColor(255,255,255)p:SetStartSize(7)p:SetEndSize(0)p:SetRoll(0)end
--addons/!lpakr_out/lua/wos/advswl/robot-boy/sh_rb655_lightsaber_presets.lua:
AddCSLuaFile()local a={["lightsaber/darksaberloop.wav"]="lightsaber/darksaber_loop.wav",["lightsaber/darksaberoff.wav"]="lightsaber/darksaber_on.wav",["lightsaber/darksaberon.wav"]="lightsaber/darksaber_off.wav",["lightsaber/darksaberswing.wav"]="lightsaber/darksaber_swing.wav",["lightsaber/forceleap.wav"]="lightsaber/force_leap.wav",["lightsaber/forcerepulse.wav"]="lightsaber/force_repulse.wav",["lightsaber/forcelightning1.wav"]="lightsaber/force_lightning1.wav",["lightsaber/forcelightning2.wav"]="lightsaber/force_lightning2.wav",["lightsaber/saberhit.wav"]="lightsaber/saber_hit.wav",["lightsaber/saberhitlaser1.wav"]="lightsaber/saber_hit_laser1.wav",["lightsaber/saberhitlaser2.wav"]="lightsaber/saber_hit_laser2.wav",["lightsaber/saberhitlaser3.wav"]="lightsaber/saber_hit_laser3.wav",["lightsaber/saberhitlaser4.wav"]="lightsaber/saber_hit_laser4.wav",["lightsaber/saberhitlaser5.wav"]="lightsaber/saber_hit_laser5.wav",["lightsaber/saberswing1.wav"]="lightsaber/saber_swing1.wav",["lightsaber/saberswing2.wav"]="lightsaber/saber_swing2.wav",["lightsaber/saberloop1.wav"]="lightsaber/saber_loop1.wav",["lightsaber/saberloop2.wav"]="lightsaber/saber_loop2.wav",["lightsaber/saberloop3.wav"]="lightsaber/saber_loop3.wav",["lightsaber/saberloop4.wav"]="lightsaber/saber_loop4.wav",["lightsaber/saberloop5.wav"]="lightsaber/saber_loop5.wav",["lightsaber/saberloop6.wav"]="lightsaber/saber_loop6.wav",["lightsaber/saberloop7.wav"]="lightsaber/saber_loop7.wav",["lightsaber/saberloop8.wav"]="lightsaber/saber_loop8.wav",["lightsaber/saberon1.wav"]="lightsaber/saber_on1.wav",["lightsaber/saberon1_fast.wav"]="lightsaber/saber_on1_fast.wav",["lightsaber/saberoff1.wav"]="lightsaber/saber_off1.wav",["lightsaber/saberoff1_fast.wav"]="lightsaber/saber_off1_fast.wav",["lightsaber/saberon2.wav"]="lightsaber/saber_on2.wav",["lightsaber/saberon2_fast.wav"]="lightsaber/saber_on2_fast.wav",["lightsaber/saberoff2.wav"]="lightsaber/saber_off2.wav",["lightsaber/saberoff2_fast.wav"]="lightsaber/saber_off2_fast.wav",["lightsaber/saberon3.wav"]="lightsaber/saber_on3.wav",["lightsaber/saberon3_fast.wav"]="lightsaber/saber_on3_fast.wav",["lightsaber/saberoff3.wav"]="lightsaber/saber_off3.wav",["lightsaber/saberoff3_fast.wav"]="lightsaber/saber_off3_fast.wav",["lightsaber/saberon4.wav"]="lightsaber/saber_on4.wav",["lightsaber/saberon4_fast.wav"]="lightsaber/saber_on4_fast.wav",["lightsaber/saberoff4.wav"]="lightsaber/saber_off4.wav",["lightsaber/saberoff4_fast.wav"]="lightsaber/saber_off4_fast.wav",["lightsaber/saberon4.mp3"]="lightsaber/saber_on4.wav",["lightsaber/saberoff4.mp3"]="lightsaber/saber_off4.wav"}local b={"rb655_lightsaber_model","rb655_lightsaber_humsound","rb655_lightsaber_swingsound","rb655_lightsaber_onsound","rb655_lightsaber_offsound"}hook.Add("Initialize","rb655_fix_convars_wOS",function()if!GetConVar("rb655_lightsaber_model")then return end;for c,cvar in pairs(b)do if a[GetConVar(cvar):GetString():lower()]then RunConsoleCommand(cvar,a[GetConVar(cvar):GetString():lower()])end end end)local d=Material("lightsaber/hard_light")local e=Material("lightsaber/hard_light_inner")local f=Material("lightsaber/hard_light_trail")local g=Material("lightsaber/hard_light_trail_inner")local h=Material("lightsaber/hard_light_trail_end")local i=Material("lightsaber/hard_light_trail_end_inner")local j=Material("wos/lightsabers/blades/pulse")local k=Color(0,0,0)local l={}local m=5;local n=1;function rb655_RenderBlade(o,p,q,r,s,t,u,v,w,x,y,z)x=x||false;y=y||1;if x then q=rb655_CalculateQuillonLength(q,r)r=rb655_CalculateQuillonMaxLength(r)end;if q<=0 then rb655_SaberClean(v,y)return end;local A=color_white;if u then A=Color(0,0,0)end;if!z then render.SetMaterial(d)render.DrawBeam(o,o+p*q,s*1.3,1,0.01,t)end;render.SetMaterial(e)render.DrawBeam(o,o+p*q,s*1.2,1,0.01,A)if!x&&y==1&&!srp.nvg.IsEnabled()then local B=math.Clamp(cvar.GetValue('lightsaber_brightness')||0,0,1)local C=n*B;local D=DynamicLight(v)if D then D.Pos=o+p*q*1.5;D.Dir=p;D.InnerAngle=0;D.OuterAngle=1;D.r=t.r;D.g=t.g;D.b=t.b;D.Brightness=.5+.5*B;D.Size=176*q/r+C*600;D.Decay=1;D.DieTime=CurTime()+.2;D.Style='m'end;local D=DynamicLight(v+1)if D then D.Pos=o+p*q*1.5;D.r=t.r;D.g=t.g;D.b=t.b;D.Brightness=.5+.5*B;D.Size=176*q/r+C*600;D.Decay=1;D.DieTime=CurTime()+.2;D.Style='m'end end;local E=o;local F=o+p*q;rb655_ProcessBlade(v,o,p,q,y)for c,G in ipairs(l[v][y])do local H=G.pos;local I=G.pos+G.dir*G.len;if c==m then h:SetVector("$color",Vector(t.r/255,t.g/255,t.b/255))render.SetMaterial(h)else f:SetVector("$color",Vector(t.r/255,t.g/255,t.b/255))render.SetMaterial(f)end;render.DrawQuad(H,E,F,I)if c==m then i:SetVector("$color",Vector(A.r/255,A.g/255,A.b/255))render.SetMaterial(i)else g:SetVector("$color",Vector(A.r/255,A.g/255,A.b/255))render.SetMaterial(g)end;render.DrawQuad(H,E,F,I)E=G.pos;F=G.pos+G.dir*G.len end end;local J=color_white:Copy()function rb655_RenderBladeExtended(self,K,t,x,y,L,M,N)local o,p;if!t then t=J end;if!L then L={}end;if M then o,p=self:GetSaberSecPosAng(K,x,M,N)else o,p=self:GetSaberPosAng(K,nil,N)end;local q=self:GetBladeLength()local r=self:GetMaxLength()local s=self:GetBladeWidth()local u=self:GetDarkInner()local v=self:EntIndex()local z=self.NoGlow;x=x||false;y=y||1;if x then q=rb655_CalculateQuillonLength(q,r)r=rb655_CalculateQuillonMaxLength(r)end;if q<=0 then rb655_SaberClean(v,y)return end;local A=color_white;if u then A=k end;if cvar.GetValue('lightsaber_effects')then if x&&L.QuillonParticle then local O=EffectData()O:SetOrigin(o)O:SetNormal(p)O:SetRadius(q)O:SetAngles(Angle(t.r,t.g,t.b))util.Effect(L.QuillonParticle,O)elseif L.UseParticle then local O=EffectData()O:SetOrigin(o)O:SetNormal(p)O:SetRadius(q)O:SetEntity(self)O:SetAngles(Angle(t.r,t.g,t.b))util.Effect(L.UseParticle,O)end end;if!z&&!L.NoGlow then if x&&L.QuillonEnvelopeMaterial then render.SetMaterial(L.QuillonEnvelopeMaterial)render.DrawBeam(o,o+p*q,s*1.3,1,0.01,t)elseif L.EnvelopeMaterial then render.SetMaterial(L.EnvelopeMaterial)render.DrawBeam(o,o+p*q,s*1.3,1,0.01,t)end end;if x&&L.QuillonInnerMaterial then render.SetMaterial(L.QuillonInnerMaterial)render.DrawBeam(o,o+p*q,s*1.2,1,0.01,A)elseif L.InnerMaterial then render.SetMaterial(L.InnerMaterial)render.DrawBeam(o,o+p*q,s*1.2,1,0.01,A)end;if!x&&y==0&&!srp.nvg.IsEnabled()then local B=math.Clamp(cvar.GetValue('lightsaber_brightness')||0,0,1)local C=n*B;local D=DynamicLight(v)if D then D.Pos=o+p*q*1.5;D.Dir=p;D.InnerAngle=0;D.OuterAngle=1;D.r=t.r;D.g=t.g;D.b=t.b;D.Brightness=.5+.5*B;D.Size=176*q/r+C*600;D.Decay=1;D.DieTime=CurTime()+.1;D.Style='m'end;local D=DynamicLight(v+1)if D then D.Pos=o+p*q*1.5;D.r=t.r;D.g=t.g;D.b=t.b;D.Brightness=.5+.5*B;D.Size=176*q/r+C*600;D.Decay=1;D.DieTime=CurTime()+.1;D.Style='m'end end;if self.NoTrail||L.NoTrail then return end;local E=o;local F=o+p*q;rb655_ProcessBlade(v,o,p,q,y)for c,G in ipairs(l[v][y])do local H=G.pos;local I=G.pos+G.dir*G.len;if c==m then h:SetVector("$color",Vector(t.r/255,t.g/255,t.b/255))render.SetMaterial(h)else f:SetVector("$color",Vector(t.r/255,t.g/255,t.b/255))render.SetMaterial(f)end;render.DrawQuad(H,E,F,I)if c==m then i:SetVector("$color",Vector(A.r/255,A.g/255,A.b/255))render.SetMaterial(i)else g:SetVector("$color",Vector(A.r/255,A.g/255,A.b/255))render.SetMaterial(g)end;render.DrawQuad(H,E,F,I)E=G.pos;F=G.pos+G.dir*G.len end end;function rb655_SaberClean(v,y)if!y then l[v]=nil;return end;if l[v]then l[v][y]=nil end end;function rb655_ProcessBlade(v,o,p,q,y)if!l[v]then l[v]={}end;if!l[v][y]then l[v][y]={}end;local P=l[v][y]for Q=0,m-1 do P[m-Q]=P[m-Q-1]if m-Q==1 then P[1]={dir=p,len=q-1.5,pos=o}end end end;function rb655_CalculateQuillonMaxLength(R)return R/7 end;function rb655_CalculateQuillonLength(S,R)local q=rb655_CalculateQuillonMaxLength(S)local T=rb655_CalculateQuillonMaxLength(R)return math.Clamp(T-(R-S),0,q)end;function rb655_ProcessLightsaberEntity(U)local V=false;local W=0;for c,X in pairs(U:GetAttachments())do if!string.match(X.name,"blade(%d+)")&&!string.match(X.name,"quillon(%d+)")then continue end;local y=string.match(X.name,"blade(%d+)")local Y=string.match(X.name,"quillon(%d+)")if y&&U:LookupAttachment("blade"..y)>0 then W=W+1;local o,Z=U:GetSaberPosAng(y)rb655_ProcessBlade(U:EntIndex(),o,Z,U:GetBladeLength(),W)V=true end;if Y&&U:LookupAttachment("quillon"..Y)>0 then W=W+1;local o,Z=U:GetSaberPosAng(Y,true)rb655_ProcessBlade(U:EntIndex(),o,Z,rb655_CalculateQuillonLength(U:GetBladeLength(),U:GetMaxLength()),W)end end;if!V then local o,Z=U:GetSaberPosAng()rb655_ProcessBlade(U:EntIndex(),o,Z,U:GetBladeLength(),1)end end
--addons/!lpakr_out/lua/wos/advswl/core/sh_core.lua:
wOS=wOS||{}wOS.Blades=wOS.Blades||{}local a={}PrecacheParticleSystem'har_explosion_a'PrecacheParticleSystem'har_explosion_b'PrecacheParticleSystem'har_explosion_c'PrecacheParticleSystem'har_explosion_a_air'PrecacheParticleSystem'har_explosion_b_air'PrecacheParticleSystem'har_explosion_c_air'if CLIENT then game.AddParticles'particles/harry_explosion.pcf'end;nw.Register'WOS_WeaponHilt':Write(net.WriteEntity):Read(net.ReadEntity):SetHook('OnSaberHiltChanged')nw.Register'WOS_DamageScaling':Write(net.WriteFloat):Read(net.ReadFloat):SetGlobal():SetHook('OnDamageScalingChanged')local b=Material'lightsaber/hard_light_inner'local c=Material'lightsaber/hard_light'function wOS.RegisterBlade(d,e,f,g)g=g||{}g.ID=d;g.EnvelopeMaterial=f||c;g.InnerMaterial=e||b;g.internal=table.insert(a,g)wOS.Blades[d]=g end;function wOS.GetBlade(d,h)return h&&a[d]||wOS.Blades[d]end;hook.Add('OnPlayerHitGround','wOS.RestartAnimationOnLand',function(i,j,k,l)local m=i:GetActiveWeapon()if!IsValid(m)||!m.IsLightsaber then return end;if i:GetNWFloat('wOS.DevestatorTime',0)>=CurTime()then return end;if m.AerialLand then m.AerialLand=false;return end;i.wOS_DoubleJump=false;i:SetSequenceOverride()end)wOS.RegisterBlade('default',Material'lightsaber/hard_light_inner',Material'lightsaber/hard_light',{})wOS.RegisterBlade('unstable',Material'lightsaber/hard_light_inner',Material'lightsaber/hard_light',{UseParticle='wos_unstable_discharge'})wOS.RegisterBlade('unstable_alt',Material'lightsaber/hard_light_inner',Material'lightsaber/hard_light',{UseParticle='wos_unstable_discharge_alt'})wOS.RegisterBlade('infused',Material'lightsaber/hard_light_inner',Material'lightsaber/hard_light',{UseParticle='wos_corrupted_burn'})wOS.RegisterBlade('infused_alt',Material'lightsaber/hard_light_inner',Material'lightsaber/hard_light',{UseParticle='wos_corrupted_burn_alt'})wOS.RegisterBlade('fire',Material'lightsaber/hard_light_inner',Material'lightsaber/hard_light',{UseParticle='fire'})wOS.RegisterBlade('scott',Material'wos/lightsabers/blades/cult',Material'wos/lightsabers/blades/cult_glow',{UseParticle='sup_gradient_discharge'})wOS.RegisterBlade('diamond',Material'wos/lightsabers/blades/cult',Material'wos/lightsabers/blades/cult_glow',{UseParticle='sup_gradient_discharge'})
--addons/!lpakr_out/lua/wos/advswl/core/cl_net.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/combat/cl_dualsaber.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/combat/cl_saberbase_hook.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/client/advdupe2_cl_init.lua:
AdvDupe2={Version="1.1.0",Revision=51,InfoText={},DataFolder="advdupe2",FileRenameTryLimit=256,ProgressBar={}}if!file.Exists(AdvDupe2.DataFolder,"DATA")then file.CreateDir(AdvDupe2.DataFolder)end;include"advdupe2/file_browser.lua"include"advdupe2/sh_codec.lua"include"advdupe2/cl_file.lua"include"advdupe2/cl_ghost.lua"function AdvDupe2.Notify(a,b,c)surface.PlaySound(b==1&&"buttons/button10.wav"||"ambient/water/drip1.wav")GAMEMODE:AddNotify(a,b||NOTIFY_GENERIC,c||5)print("[AdvDupe2Notify]\t"..a)end;net.Receive("AdvDupe2Notify",function()AdvDupe2.Notify(net.ReadString(),net.ReadUInt(8),net.ReadFloat())end)
--addons/!lpakr_out/lua/advdupe2/file_browser.lua:
return lpakr()()
--addons/!lpakr_out/lua/advdupe2/file_browser.lua:
local a={}local b={}local c=true;local d=0;local function e(f)f=string.lower(f)local g=f[1]local h;for i=1,#a do h=a[i][1]if g==h then if a[i]==f then return end elseif g<h then break end end;table.insert(a,f)table.sort(a,function(j,k)return j<k end)end;local function l(f,m)f=string.lower(f)local n={}if m<=#f&&m!=0&&#f!=1 then for i=1,#b do if b[i][m+1]==f[m+1]then table.insert(n,b[i])elseif b[i][m+1]!=''then break end end else local g=f[1]local h;for i=1,#a do h=a[i][1]if g==h then if#f>1 then for o=2,#f do if f[o]!=a[i][o]then break end;if o==#f then table.insert(n,a[i])end end else table.insert(n,a[i])end elseif g<h then break end end end;b=n end;local function p(q)for o,r in ipairs(q)do q[o]={string.lower(r.Label:GetText()),r}end;table.sort(q,function(j,k)return j[1]<k[1]end)for o,r in ipairs(q)do q[o]=r[2]end end;local s={}AccessorFunc(s,"m_bBackground","PaintBackground",FORCE_BOOL)AccessorFunc(s,"m_bgColor","BackgroundColor")Derma_Hook(s,"Paint","Paint","Panel")Derma_Hook(s,"PerformLayout","Layout","Panel")local t;local function u(self,v,w)t(self,v,w)self.pnlCanvas:SetWide(v)self.pnlCanvas.VBar:SetUp(w,self.pnlCanvas:GetTall())end;function s:Init()t=self.SetSize;self.SetSize=u;self.pnlCanvas=vgui.Create("advdupe2_browser_tree",self)self:SetPaintBackground(true)self:SetPaintBackgroundEnabled(false)self:SetPaintBorderEnabled(false)self:SetBackgroundColor(self:GetSkin().text_bright)end;function s:OnVScroll(x)self.pnlCanvas:SetPos(0,x)end;derma.DefineControl("advdupe2_browser_panel","AD2 File Browser",s,"Panel")local y={}AccessorFunc(y,"m_pSelectedItem","SelectedItem")Derma_Hook(y,"Paint","Paint","Panel")local z;local function A(self,B)z(self,B)self.VBar:SetUp(self:GetParent():GetTall(),self:GetTall())end;function y:Init()self:SetTall(0)z=self.SetTall;self.SetTall=A;self.VBar=vgui.Create("DVScrollBar",self:GetParent())self.VBar:Dock(RIGHT)self.Nodes=0;self.ChildrenExpanded={}self.ChildList=self;self.m_bExpanded=true;self.Folders={}self.Files={}self.LastClick=CurTime()end;local function C(D)local E=D.Label:GetText()local F=0;local G=""D=D.ParentNode;if!D.ParentNode then if E=="-Public-"then F=1 elseif E=="-Advanced Duplicator 1-"then F=2 end;return"",F end;while true do G=D.Label:GetText()if G=="-Advanced Duplicator 2-"then break elseif G=="-Public-"then F=1;break elseif G=="-Advanced Duplicator 1-"then F=2;break end;E=G.."/"..E;D=D.ParentNode end;return E,F end;function y:DoNodeLeftClick(D)if self.m_pSelectedItem==D&&CurTime()-self.LastClick<=0.25 then if D.Derma.ClassName=="advdupe2_browser_folder"then if D.Expander then D:SetExpanded()end else AdvDupe2.UploadFile(C(D))end else self:SetSelected(D)end;self.LastClick=CurTime()end;local function H(D)local I=D.Control:GetParent():GetParent()local G=I.FileName:GetValue()local J=string.match(G,"[^%w_ ]")if J then AdvDupe2.Notify("Name contains invalid character ("..J..")!",NOTIFY_ERROR)I.FileName:SelectAllOnFocus(true)I.FileName:OnGetFocus()I.FileName:RequestFocus()return end;if G==""||G=="Folder_Name..."then AdvDupe2.Notify("Name is blank!",NOTIFY_ERROR)I.FileName:SelectAllOnFocus(true)I.FileName:OnGetFocus()I.FileName:RequestFocus()return end;local E,F=C(D)if F==0 then E=AdvDupe2.DataFolder.."/"..E.."/"..G elseif F==1 then E=AdvDupe2.DataFolder.."/=Public=/"..E.."/"..G else E="adv_duplicator/"..E.."/"..G end;if file.IsDir(E,"DATA")then AdvDupe2.Notify("Folder name already exists.",NOTIFY_ERROR)I.FileName:SelectAllOnFocus(true)I.FileName:OnGetFocus()I.FileName:RequestFocus()return end;file.CreateDir(E)local K=D:AddFolder(G)D.Control:Sort(D)if!D.m_bExpanded then D:SetExpanded()end;D.Control:SetSelected(K)if I.Expanded then AdvDupe2.FileBrowser:Slide(false)end end;local function L(D)D.m_bExpanded=false;if D.Expander then D.Expander:SetExpanded(false)D.ChildList:SetTall(0)for i=1,#D.ChildrenExpanded do L(D.ChildrenExpanded[i])end;D.ChildrenExpanded={}end end;local function M(D)if!D.ParentNode.ParentNode then D:SetExpanded(false)return end;M(D.ParentNode)end;function AdvDupe2.GetFilename(E,N)if!N&&file.Exists(E..".txt","DATA")then for i=1,AdvDupe2.FileRenameTryLimit do local O=string.format("%s_%03d.txt",E,i)if!file.Exists(O,"DATA")then return O end end;return false end;return E..".txt"end;local function P(D)local E,F=C(D)if F==0 then E=AdvDupe2.DataFolder.."/"..E.."/"elseif F==1 then else E="adv_duplicator/"..E.."/"end;return E end;local function Q(D)local R;while true do if!D.ParentNode.ParentNode then R=D;break end;D=D.ParentNode end;return R end;local function S(D,G)local E,F=C(D)local T,U,V="","",""if F==0 then V=AdvDupe2.DataFolder.."/"..E elseif F==1 then V=AdvDupe2.DataFolder.."/=Public=/"..E elseif F==2 then V="adv_duplicator/"..E end;T=file.Read(V..".txt")U=AdvDupe2.GetFilename(string.sub(V,1,#V-#D.Label:GetText())..G)if!U then AdvDupe2.Notify("Rename limit exceeded, could not rename.",NOTIFY_ERROR)return end;file.Write(U,T)if file.Exists(U,"DATA")then file.Delete(V..".txt")local W=string.Explode("/",U)W=string.sub(W[#W],1,-5)D.Label:SetText(W)D.Label:SizeToContents()AdvDupe2.Notify("File renamed to "..W)else AdvDupe2.Notify("File was not renamed.",NOTIFY_ERROR)end;D.Control:Sort(D.ParentNode)end;local function X(D)if!D then AdvDupe2.Notify("Select a folder to move the file to.",NOTIFY_ERROR)return end;if D.Derma.ClassName=="advdupe2_browser_file"then AdvDupe2.Notify("You muse select a folder as a destination.",NOTIFY_ERROR)return end;local Y=AdvDupe2.DataFolder;local Z;local _=D.Control.ActionNode;local E,F=C(_)local a0,a1=C(D)if F!=a1||E==a0 then AdvDupe2.Notify("Cannot move files between these directories.",NOTIFY_ERROR)return end;if F==2 then Y="adv_duplicator"end;local a2=AdvDupe2.GetFilename(Y.."/"..a0 .."/".._.Label:GetText())local a3=Y.."/"..E..".txt"local a4=file.Read(a3)file.Write(a2,a4)file.Delete(a3)local a5=string.Explode("/",a2)a5=string.sub(a5[#a5],1,-5)_.Control:RemoveNode(_)_=D:AddFile(a5)_.Control:Sort(D)AdvDupe2.FileBrowser:Slide(false)AdvDupe2.FileBrowser.Info:SetVisible(false)end;local function a6(E)local a7,a8=file.Find(E.."*","DATA")for o,r in pairs(a7)do file.Delete(E..r)end;for o,r in pairs(a8)do a6(E..r.."/")end;file.Delete(E)end;local function a9(D,G)local aa={}for o,r in pairs(D.Files)do if string.find(string.lower(r.Label:GetText()),G)then table.insert(aa,r)end end;for o,r in pairs(D.Folders)do for i,ab in pairs(a9(r,G))do table.insert(aa,ab)end end;return aa end;local function ac(D,G)local ad=AdvDupe2.FileBrowser;ad.Search=vgui.Create("advdupe2_browser_panel",ad)ad.Search:SetPos(ad.Browser:GetPos())ad.Search:SetSize(ad.Browser:GetSize())ad.Search.pnlCanvas.Search=true;ad.Browser:SetVisible(false)local ae=a9(D,G)p(ae)for o,r in pairs(ae)do ad.Search.pnlCanvas:AddFile(r.Label:GetText()).Ref=r end end;function y:DoNodeRightClick(D)self:SetSelected(D)local af=self:GetParent():GetParent()af.FileName:KillFocus()af.Desc:KillFocus()local ag=DermaMenu()local ah=Q(D).Label:GetText()if D.Derma.ClassName=="advdupe2_browser_file"then if D.Control.Search then ag:AddOption("Open",function()AdvDupe2.UploadFile(C(D.Ref))end)ag:AddOption("Preview",function()local ai,aj=C(D.Ref)if aj==0 then ai=AdvDupe2.DataFolder.."/"..ai..".txt"elseif aj==1 then ai=AdvDupe2.DataFolder.."/-Public-/"..ai..".txt"else ai="adv_duplicator/"..ai..".txt"end;if!file.Exists(ai,"DATA")then AdvDupe2.Notify("File does not exist",NOTIFY_ERROR)return end;local ak=file.Read(ai)local G=string.Explode("/",ai)G=G[#G]G=string.sub(G,1,#G-4)local al,am,an,ao=AdvDupe2.Decode(ak)if al then AdvDupe2.LoadGhosts(am,an,ao,G,true)end end)else ag:AddOption("Open",function()AdvDupe2.UploadFile(C(D))end)ag:AddOption("Preview",function()local ai,aj=C(D)if aj==0 then ai=AdvDupe2.DataFolder.."/"..ai..".txt"elseif aj==1 then ai=AdvDupe2.DataFolder.."/-Public-/"..ai..".txt"else ai="adv_duplicator/"..ai..".txt"end;if!file.Exists(ai,"DATA")then AdvDupe2.Notify("File does not exist",NOTIFY_ERROR)return end;local ak=file.Read(ai)local G=string.Explode("/",ai)G=G[#G]G=string.sub(G,1,#G-4)local al,am,an,ao=AdvDupe2.Decode(ak)if al then AdvDupe2.LoadGhosts(am,an,ao,G,true)end end)ag:AddSpacer()ag:AddOption("Rename",function()if af.Expanding then return end;af.Submit:SetMaterial("icon16/page_edit.png")af.Submit:SetTooltip("Rename File")af.Desc:SetVisible(false)af.Info:SetVisible(false)af.FileName.FirstChar=true;af.FileName.PrevText=af.FileName:GetValue()af.FileName:SetVisible(true)af.FileName:SetText(D.Label:GetText())af.FileName:SelectAllOnFocus(true)af.FileName:OnMousePressed()af.FileName:RequestFocus()af.Expanding=true;AdvDupe2.FileBrowser:Slide(true)af.Submit.DoClick=function()local G=af.FileName:GetValue()if G==""then AdvDupe2.Notify("Name field is blank.",NOTIFY_ERROR)af.FileName:SelectAllOnFocus(true)af.FileName:OnGetFocus()af.FileName:RequestFocus()return end;e(G)S(D,G)AdvDupe2.FileBrowser:Slide(false)end;af.FileName.OnEnter=af.Submit.DoClick end)ag:AddOption("Move File",function()af.Submit:SetMaterial("icon16/page_paste.png")af.Submit:SetTooltip("Move File")af.FileName:SetVisible(false)af.Desc:SetVisible(false)af.Info:SetText("Select the folder you want to move \nthe File to.")af.Info:SizeToContents()af.Info:SetVisible(true)AdvDupe2.FileBrowser:Slide(true)D.Control.ActionNode=D;af.Submit.DoClick=function()X(D.Control.m_pSelectedItem)end end)ag:AddOption("Delete",function()af.Submit:SetMaterial("icon16/bin_empty.png")af.Submit:SetTooltip("Delete File")af.FileName:SetVisible(false)af.Desc:SetVisible(false)if#D.Label:GetText()>22 then af.Info:SetText('Are you sure that you want to delete \nthe FILE, "'..D.Label:GetText()..'" \nfrom your CLIENT?')else af.Info:SetText('Are you sure that you want to delete \nthe FILE, "'..D.Label:GetText()..'" from your CLIENT?')end;af.Info:SizeToContents()af.Info:SetVisible(true)AdvDupe2.FileBrowser:Slide(true)af.Submit.DoClick=function()local E,F=C(D)if F==1 then E="-Public-/"..E end;if F==2 then E="adv_duplicator/"..E..".txt"else E=AdvDupe2.DataFolder.."/"..E..".txt"end;D.Control:RemoveNode(D)file.Delete(E)AdvDupe2.FileBrowser:Slide(false)end end)end else if ah!="-Advanced Duplicator 1-"then ag:AddOption("Save",function()if af.Expanding then return end;af.Submit:SetMaterial("icon16/page_save.png")af.Submit:SetTooltip("Save Duplication")if af.FileName:GetValue()=="Folder_Name..."then af.FileName:SetText("File_Name...")end;af.Desc:SetVisible(true)af.Info:SetVisible(false)af.FileName.FirstChar=true;af.FileName.PrevText=af.FileName:GetValue()af.FileName:SetVisible(true)af.FileName:SelectAllOnFocus(true)af.FileName:OnMousePressed()af.FileName:RequestFocus()D.Control.ActionNode=D;af.Expanding=true;AdvDupe2.FileBrowser:Slide(true)af.Submit.DoClick=function()local G=af.FileName:GetValue()if G==""||G=="File_Name..."then AdvDupe2.Notify("Name field is blank.",NOTIFY_ERROR)af.FileName:SelectAllOnFocus(true)af.FileName:OnGetFocus()af.FileName:RequestFocus()return end;local ap=af.Desc:GetValue()if ap=="Description..."then ap=""end;AdvDupe2.SavePath=P(D)..G;e(G)if game.SinglePlayer()then RunConsoleCommand("AdvDupe2_SaveFile",G,ap,C(D))else RunConsoleCommand("AdvDupe2_SaveFile",G)end;AdvDupe2.FileBrowser:Slide(false)end;af.FileName.OnEnter=function()af.FileName:KillFocus()af.Desc:SelectAllOnFocus(true)af.Desc.OnMousePressed()af.Desc:RequestFocus()end;af.Desc.OnEnter=af.Submit.DoClick end)end;ag:AddOption("New Folder",function()if af.Expanding then return end;af.Submit:SetMaterial("icon16/folder_add.png")af.Submit:SetTooltip("Add new folder")if af.FileName:GetValue()=="File_Name..."then af.FileName:SetText("Folder_Name...")end;af.Desc:SetVisible(false)af.Info:SetVisible(false)af.FileName.FirstChar=true;af.FileName.PrevText=af.FileName:GetValue()af.FileName:SetVisible(true)af.FileName:SelectAllOnFocus(true)af.FileName:OnMousePressed()af.FileName:RequestFocus()af.Expanding=true;AdvDupe2.FileBrowser:Slide(true)af.Submit.DoClick=function()H(D)end;af.FileName.OnEnter=af.Submit.DoClick end)ag:AddOption("Search",function()af.Submit:SetMaterial("icon16/find.png")af.Submit:SetTooltip("Search Files")if af.FileName:GetValue()=="Folder_Name..."then af.FileName:SetText("File_Name...")end;af.Desc:SetVisible(false)af.Info:SetVisible(false)af.FileName.FirstChar=true;af.FileName.PrevText=af.FileName:GetValue()af.FileName:SetVisible(true)af.FileName:SelectAllOnFocus(true)af.FileName:OnMousePressed()af.FileName:RequestFocus()af.Expanding=true;AdvDupe2.FileBrowser:Slide(true)af.Submit.DoClick=function()ac(D,string.lower(af.FileName:GetValue()))e(af.FileName:GetValue())af.FileName:SetVisible(false)af.Submit:SetMaterial("icon16/arrow_undo.png")af.Submit:SetTooltip("Return to Browser")af.Info:SetVisible(true)af.Info:SetText(#af.Search.pnlCanvas.Files..' files found searching for, "'..af.FileName:GetValue()..'"')af.Info:SizeToContents()af.Submit.DoClick=function()af.Search:Remove()af.Search=nil;af.Browser:SetVisible(true)AdvDupe2.FileBrowser:Slide(false)af.Cancel:SetVisible(true)end;af.Cancel:SetVisible(false)end;af.FileName.OnEnter=af.Submit.DoClick end)if D.Label:GetText()[1]!="-"then ag:AddOption("Delete",function()af.Submit:SetMaterial("icon16/bin_empty.png")af.Submit:SetTooltip("Delete Folder")af.FileName:SetVisible(false)af.Desc:SetVisible(false)if#D.Label:GetText()>22 then af.Info:SetText('Are you sure that you want to delete \nthe FOLDER, "'..D.Label:GetText()..'" \nfrom your CLIENT?')else af.Info:SetText('Are you sure that you want to delete \nthe FOLDER, "'..D.Label:GetText()..'" from your CLIENT?')end;af.Info:SizeToContents()af.Info:SetVisible(true)AdvDupe2.FileBrowser:Slide(true)af.Submit.DoClick=function()local E,F=C(D)if F==1 then E="-Public-/"..E end;if F==2 then E="adv_duplicator/"..E.."/"else E=AdvDupe2.DataFolder.."/"..E.."/"end;D.Control:RemoveNode(D)a6(E)AdvDupe2.FileBrowser:Slide(false)end end)end end;if!D.Control.Search then ag:AddSpacer()ag:AddOption("Collapse Folder",function()if D.ParentNode.ParentNode then D.ParentNode:SetExpanded(false)end end)ag:AddOption("Collapse Root",function()M(D)end)if af.Expanded then ag:AddOption("Cancel Action",function()af.Cancel:DoClick()end)end end;ag:Open()end;local function aq(D,B)if!D then return end;D.ChildList:SetTall(D.ChildList:GetTall()-B)aq(D.ParentNode,B)end;function y:RemoveNode(D)local af=D.ParentNode;af.Nodes=af.Nodes-1;if D.IsFolder then if D.m_bExpanded then aq(af,D.ChildList:GetTall()+20)for i=1,#af.ChildrenExpanded do if D==af.ChildrenExpanded[i]then table.remove(af.ChildrenExpanded,i)break end end elseif af.m_bExpanded then aq(af,20)end;for i=1,#af.Folders do if D==af.Folders[i]then table.remove(af.Folders,i)end end;D.ChildList:Remove()D:Remove()else for i=1,#af.Files do if D==af.Files[i]then table.remove(af.Files,i)end end;aq(af,20)D:Remove()if#af.Files==0&&#af.Folders==0 then af.Expander:Remove()af.Expander=nil;af.m_bExpanded=false end end;if self.VBar.Scroll>self.VBar.CanvasSize then self.VBar:SetScroll(self.VBar.Scroll)end;if self.m_pSelectedItem then self.m_pSelectedItem=nil end end;function y:OnMouseWheeled(ar)return self.VBar:OnMouseWheeled(ar)end;function y:AddFolder(as)local D=vgui.Create("advdupe2_browser_folder",self)D.Control=self;D.Offset=0;D.ChildrenExpanded={}D.Icon:SetPos(18,1)D.Label:SetPos(44,0)D.Label:SetText(as)D.Label:SizeToContents()D.ParentNode=self;D.IsFolder=true;self.Nodes=self.Nodes+1;D.Folders={}D.Files={}table.insert(self.Folders,D)self:SetTall(self:GetTall()+20)return D end;function y:AddFile(as)local D=vgui.Create("advdupe2_browser_file",self)D.Control=self;D.Offset=0;D.Icon:SetPos(18,1)D.Label:SetPos(44,0)D.Label:SetText(as)D.Label:SizeToContents()D.ParentNode=self;self.Nodes=self.Nodes+1;table.insert(self.Files,D)self:SetTall(self:GetTall()+20)return D end;function y:Sort(D)p(D.Folders)p(D.Files)for i=1,#D.Folders do D.Folders[i]:SetParent(nil)D.Folders[i]:SetParent(D.ChildList)D.Folders[i].ChildList:SetParent(nil)D.Folders[i].ChildList:SetParent(D.ChildList)end;for i=1,#D.Files do D.Files[i]:SetParent(nil)D.Files[i]:SetParent(D.ChildList)end end;function y:SetSelected(D)if IsValid(self.m_pSelectedItem)then self.m_pSelectedItem:SetSelected(false)end;self.m_pSelectedItem=D;if D then D:SetSelected(true)end end;local function at(D,B)if!D then return end;D.ChildList:SetTall(D.ChildList:GetTall()+B)at(D.ParentNode,B)end;function y:Expand(D)D.ChildList:SetTall(D.Nodes*20)table.insert(D.ParentNode.ChildrenExpanded,D)at(D.ParentNode,D.Nodes*20)end;local function au(D)if!D then return end;D.ChildList:SetTall(D.ChildList:GetTall()+20)au(D.ParentNode)end;function y:Extend(D)D.ChildList:SetTall(D.ChildList:GetTall()+20)au(D.ParentNode)end;function y:Collapse(D)aq(D.ParentNode,D.ChildList:GetTall())for i=1,#D.ParentNode.ChildrenExpanded do if D.ParentNode.ChildrenExpanded[i]==D then table.remove(D.ParentNode.ChildrenExpanded,i)break end end;L(D)end;function y:RenameNode(G)self.ActionNode.Label:SetText(G)self.ActionNode.Label:SizeToContents()self:Sort(self.ActionNode.ParentNode)end;function y:MoveNode(G)self:RemoveNode(self.ActionNode)self.ActionNode2:AddFile(G)self:Sort(self.ActionNode2)end;function y:DeleteNode()self:RemoveNode(self.ActionNode)end;derma.DefineControl("advdupe2_browser_tree","AD2 File Browser",y,"Panel")local av={}AccessorFunc(av,"m_bBackground","PaintBackground",FORCE_BOOL)AccessorFunc(av,"m_bgColor","BackgroundColor")Derma_Hook(av,"Paint","Paint","Panel")function av:Init()self:SetMouseInputEnabled(true)self:SetTall(20)self:SetPaintBackground(true)self:SetPaintBackgroundEnabled(false)self:SetPaintBorderEnabled(false)self:SetBackgroundColor(Color(0,0,0,0))self.Icon=vgui.Create("DImage",self)self.Icon:SetImage("icon16/folder.png")self.Icon:SizeToContents()self.Label=vgui.Create("DLabel",self)self.Label:SetDark(true)self.m_bExpanded=false;self.Nodes=0;self.ChildrenExpanded={}self:Dock(TOP)self.ChildList=vgui.Create("Panel",self:GetParent())self.ChildList:Dock(TOP)self.ChildList:SetTall(0)end;local function aw(self)self:GetParent():SetExpanded()end;function av:AddFolder(as)if self.Nodes==0 then self.Expander=vgui.Create("DExpandButton",self)self.Expander.DoClick=aw;self.Expander:SetPos(self.Offset,2)end;local D=vgui.Create("advdupe2_browser_folder",self.ChildList)D.Control=self.Control;D.Offset=self.Offset+20;D.Icon:SetPos(18+D.Offset,1)D.Label:SetPos(44+D.Offset,0)D.Label:SetText(as)D.Label:SizeToContents()D.Label:SetDark(true)D.ParentNode=self;D.IsFolder=true;D.Folders={}D.Files={}self.Nodes=self.Nodes+1;table.insert(self.Folders,D)if self.m_bExpanded then self.Control:Extend(self)end;return D end;function av:AddFile(as)if self.Nodes==0 then self.Expander=vgui.Create("DExpandButton",self)self.Expander.DoClick=aw;self.Expander:SetPos(self.Offset,2)end;local D=vgui.Create("advdupe2_browser_file",self.ChildList)D.Control=self.Control;D.Offset=self.Offset+20;D.Icon:SetPos(18+D.Offset,1)D.Label:SetPos(44+D.Offset,0)D.Label:SetText(as)D.Label:SizeToContents()D.Label:SetDark(true)D.ParentNode=self;self.Nodes=self.Nodes+1;table.insert(self.Files,D)if self.m_bExpanded then self.Control:Extend(self)end;return D end;function av:SetExpanded(ax)if!self.Expander then return end;if ax==nil then self.m_bExpanded=!self.m_bExpanded else self.m_bExpanded=ax end;self.Expander:SetExpanded(self.m_bExpanded)if self.m_bExpanded then self.Control:Expand(self)else self.Control:Collapse(self)end end;function av:SetSelected(ax)if ax then self:SetBackgroundColor(self:GetSkin().bg_color_bright)else self:SetBackgroundColor(Color(0,0,0,0))end end;function av:OnMousePressed(ay)if ay==107 then self.Control:DoNodeLeftClick(self)elseif ay==108 then self.Control:DoNodeRightClick(self)end end;derma.DefineControl("advdupe2_browser_folder","AD2 Browser Folder node",av,"Panel")local az={}AccessorFunc(az,"m_bBackground","PaintBackground",FORCE_BOOL)AccessorFunc(az,"m_bgColor","BackgroundColor")Derma_Hook(az,"Paint","Paint","Panel")function az:Init()self:SetMouseInputEnabled(true)self:SetTall(20)self:SetPaintBackground(true)self:SetPaintBackgroundEnabled(false)self:SetPaintBorderEnabled(false)self:SetBackgroundColor(Color(0,0,0,0))self.Icon=vgui.Create("DImage",self)self.Icon:SetImage("icon16/page.png")self.Icon:SizeToContents()self.Label=vgui.Create("DLabel",self)self.Label:SetDark(true)self:Dock(TOP)end;function az:SetSelected(ax)if ax then self:SetBackgroundColor(self:GetSkin().bg_color_bright)else self:SetBackgroundColor(Color(0,0,0,0))end end;function az:OnMousePressed(ay)if ay==107 then self.Control:DoNodeLeftClick(self)elseif ay==108 then self.Control:DoNodeRightClick(self)end end;derma.DefineControl("advdupe2_browser_file","AD2 Browser File node",az,"Panel")local aA={}AccessorFunc(aA,"m_bBackground","PaintBackground",FORCE_BOOL)AccessorFunc(aA,"m_bgColor","BackgroundColor")Derma_Hook(aA,"Paint","Paint","Panel")Derma_Hook(aA,"PerformLayout","Layout","Panel")function aA:PerformLayout()if self:GetWide()==self.LastX then return end;local v=self:GetWide()if self.Search then self.Search:SetWide(v)end;self.Browser:SetWide(v)local aB,aC=self.Browser:GetPos()local aD=v-self.Help:GetWide()-5;self.Help:SetPos(aD,3)aD=aD-self.Refresh:GetWide()-5;self.Refresh:SetPos(aD,3)aD=v-self.Submit:GetWide()-15;self.Cancel:SetPos(aD,self.Browser:GetTall()+20)aD=aD-self.Submit:GetWide()-5;self.Submit:SetPos(aD,self.Browser:GetTall()+20)self.FileName:SetWide(aD-10)self.FileName:SetPos(5,self.Browser:GetTall()+20)self.Desc:SetWide(v-10)self.Desc:SetPos(5,self.Browser:GetTall()+39)self.Info:SetPos(5,self.Browser:GetTall()+20)self.LastX=v end;local aE;local function aF(self,v,w)if!self.LaidOut then aE(self,v,w)self.Browser:SetSize(v,w-20)self.Browser:SetPos(0,20)if self.Search then self.Search:SetSize(v,w-20)self.Search:SetPos(0,20)end;self.LaidOut=true else aE(self,v,w)end end;local function aG(E,aH)local a7,aI=file.Find(E.."*","DATA")if aI then for o,r in pairs(aI)do aH=aH:AddFolder(r)aG(E..r.."/",aH)aH=aH.ParentNode end end;if a7 then for o,r in pairs(a7)do aH:AddFile(string.sub(r,1,#r-4))end end end;local function aJ()local aK=AdvDupe2.FileBrowser.Browser.pnlCanvas;for i=1,2 do if aK.Folders[1]then aK:RemoveNode(aK.Folders[1])end end;aG("advdupe2/",aK:AddFolder("-Advanced Duplicator 2-"))aG("adv_duplicator/",aK:AddFolder("-Advanced Duplicator 1-"))if aK.Folders[2]then if#aK.Folders[2].Folders==0&&#aK.Folders[2].Files==0 then aK:RemoveNode(aK.Folders[2])end;aK.Folders[1]:SetParent(nil)aK.Folders[1]:SetParent(aK.ChildList)aK.Folders[1].ChildList:SetParent(nil)aK.Folders[1].ChildList:SetParent(aK.ChildList)end end;function aA:Init()AdvDupe2.FileBrowser=self;self.Expanded=false;self.Expanding=false;self.LastX=0;self.LastY=0;aE=self.SetSize;self.SetSize=aF;self:SetPaintBackground(true)self:SetPaintBackgroundEnabled(false)self:SetBackgroundColor(self:GetSkin().bg_color_bright)self.Browser=vgui.Create("advdupe2_browser_panel",self)aJ()self.Refresh=vgui.Create("DImageButton",self)self.Refresh:SetMaterial("icon16/arrow_refresh.png")self.Refresh:SizeToContents()self.Refresh:SetTooltip("Refresh Files")self.Refresh.DoClick=function(aL)aJ()end;self.Help=vgui.Create("DImageButton",self)self.Help:SetMaterial("icon16/help.png")self.Help:SizeToContents()self.Help:SetTooltip("Help Section")self.Help.DoClick=function(aM)local ag=DermaMenu()ag:AddOption("Bug Reporting",function()gui.OpenURL("https://github.com/wiremod/advdupe2/issues")end)ag:AddOption("Controls",function()gui.OpenURL("https://github.com/wiremod/advdupe2/wiki/Controls")end)ag:AddOption("Commands",function()gui.OpenURL("https://github.com/wiremod/advdupe2/wiki/Server-settings")end)ag:Open()end;self.Submit=vgui.Create("DImageButton",self)self.Submit:SetMaterial("icon16/page_save.png")self.Submit:SizeToContents()self.Submit:SetTooltip("Confirm Action")self.Submit.DoClick=function()self.Expanding=true;AdvDupe2.FileBrowser:Slide(false)end;self.Cancel=vgui.Create("DImageButton",self)self.Cancel:SetMaterial("icon16/cross.png")self.Cancel:SizeToContents()self.Cancel:SetTooltip("Cancel Action")self.Cancel.DoClick=function()self.Expanding=true;AdvDupe2.FileBrowser:Slide(false)end;self.FileName=vgui.Create("DTextEntry",self)self.FileName:SetAllowNonAsciiCharacters(true)self.FileName:SetText("File_Name...")self.FileName.Last=0;self.FileName.OnEnter=function()self.FileName:KillFocus()self.Desc:SelectAllOnFocus(true)self.Desc.OnMousePressed()self.Desc:RequestFocus()end;self.FileName.OnMousePressed=function()self.FileName:OnGetFocus()if self.FileName:GetValue()=="File_Name..."||self.FileName:GetValue()=="Folder_Name..."then self.FileName:SelectAllOnFocus(true)end end;self.FileName:SetUpdateOnType(true)self.FileName.OnTextChanged=function()if self.FileName.FirstChar then if string.lower(self.FileName:GetValue()[1]||"")==string.lower(input.LookupBinding("menu"))then self.FileName:SetText(self.FileName.PrevText)self.FileName:SelectAll()self.FileName.FirstChar=false else self.FileName.FirstChar=false end end;local aN,aO=self.FileName:GetValue():gsub("[^%w_ ]","")if aO>0 then self.FileName:SetText(aN)self.FileName:SetCaretPos(#aN)end;if#self.FileName:GetValue()>0 then l(self.FileName:GetValue(),self.FileName.Last)local aP={}if#b>4 then for i=1,4 do table.insert(aP,b[i])end else aP=b end;if#aP!=0&&#self.FileName:GetValue()!=0 then self.FileName.HistoryPos=0;self.FileName:OpenAutoComplete(aP)self.FileName.Menu.Attempts=1;if#b>4 then self.FileName.Menu:AddOption("...",function()end)end elseif IsValid(self.FileName.Menu)then self.FileName.Menu:Remove()end end;self.FileName.Last=#self.FileName:GetValue()end;self.FileName.OnKeyCodeTyped=function(aQ,ay)aQ:OnKeyCode(ay)if ay==KEY_ENTER&&!aQ:IsMultiline()&&aQ:GetEnterAllowed()then if aQ.HistoryPos==5&&aQ.Menu:ChildCount()==5 then if(aQ.Menu.Attempts+1)*4<#b then for i=1,4 do aQ.Menu:GetChild(i):SetText(b[i+aQ.Menu.Attempts*4])end else aQ.Menu:GetChild(5):Remove()for i=4,(aQ.Menu.Attempts*4-#b)*-1+1,-1 do aQ.Menu:GetChild(i):Remove()end;for i=1,#b-aQ.Menu.Attempts*4 do aQ.Menu:GetChild(i):SetText(b[i+aQ.Menu.Attempts*4])end end;aQ.Menu:ClearHighlights()aQ.Menu:HighlightItem(aQ.Menu:GetChild(1))aQ.HistoryPos=1;aQ.Menu.Attempts=aQ.Menu.Attempts+1;return true end;if IsValid(aQ.Menu)then aQ.Menu:Remove()end;aQ:FocusNext()aQ:OnEnter()aQ.HistoryPos=0 end;if aQ.m_bHistory||IsValid(aQ.Menu)then if ay==KEY_UP then aQ.HistoryPos=aQ.HistoryPos-1;if aQ.HistoryPos!=-1||aQ.Menu:ChildCount()!=5 then aQ:UpdateFromHistory()else aQ.Menu:ClearHighlights()aQ.Menu:HighlightItem(aQ.Menu:GetChild(5))aQ.HistoryPos=5 end end;if ay==KEY_DOWN||ay==KEY_TAB then aQ.HistoryPos=aQ.HistoryPos+1;if aQ.HistoryPos!=5||aQ.Menu:ChildCount()!=5 then aQ:UpdateFromHistory()else aQ.Menu:ClearHighlights()aQ.Menu:HighlightItem(aQ.Menu:GetChild(5))end end end end;self.FileName.OnValueChange=function()if self.FileName:GetValue()!="File_Name..."&&self.FileName:GetValue()!="Folder_Name..."then local aN,aO=self.FileName:GetValue():gsub("[^%w_ ]","")if aO>0 then self.FileName:SetText(aN)self.FileName:SetCaretPos(#aN)end end end;self.Desc=vgui.Create("DTextEntry",self)self.Desc.OnEnter=self.Submit.DoClick;self.Desc:SetText("Description...")self.Desc.OnMousePressed=function()self.Desc:OnGetFocus()if self.Desc:GetValue()=="Description..."then self.Desc:SelectAllOnFocus(true)end end;self.Info=vgui.Create("DLabel",self)self.Info:SetVisible(false)end;function aA:Slide(aR)if aR then if self.Expanded then self:SetTall(self:GetTall()-40)self.Expanded=false else self:SetTall(self:GetTall()+5)end else if!self.Expanded then self:SetTall(self:GetTall()+40)self.Expanded=true else self:SetTall(self:GetTall()-5)end end;d=d+1;if d<9 then timer.Simple(0.01,function()self:Slide(aR)end)else if aR then self.Expanded=true else self.Expanded=false end;self.Expanding=false;d=0 end end;function aA:GetFullPath(D)return P(D)end;function aA:GetNodePath(D)return C(D)end;if game.SinglePlayer()then net.Receive("AdvDupe2_AddFile",function()local aS=AdvDupe2.FileBrowser.AutoSaveNode;local aT=AdvDupe2.FileBrowser.Browser.pnlCanvas.ActionNode;if net.ReadBool()then if IsValid(aS)then local G=net.ReadString()for aU=1,#aS.Files do if G==aS.Files[i]then return end end;aS:AddFile(G)aS.Control:Sort(aS)end else aT:AddFile(net.ReadString())aT.Control:Sort(aT)end end)end;vgui.Register("advdupe2_browser",aA,"Panel")
--lua/autorun/client/clpatch.lua:
print ''
--addons/!lpakr_out/gamemodes/srp_base/gamemode/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/shared.lua:
DeriveGamemode'base'GM.Author='Scott'GM.Website='superiorservers.co'include'loader.lua'include'terms.lua'require'cvar'require'nw'require'cmd'require'term'require'keybind'PLAYER=FindMetaTable'Player'ENTITY=FindMetaTable'Entity'VECTOR=FindMetaTable'Vector'WEAPON=FindMetaTable'Weapon'TURRET_CONTROL_SIMULATED=1;TURRET_CONTROL_STANDING=2;TURRET_CONTROL_SMOOTHAIM=3;util.PrecacheSound'shield.hit'util.PrecacheSound'Weapon_StunStick.Swing'util.PrecacheSound'Weapon_StunStick.Melee_Hit'util.PrecacheSound'Weapon_StunStick.Melee_HitWorld'util.PrecacheSound'weapons/stunstick/alyx_stunner1.wav'team.SetUp(1,'Player',Color(255,255,255),false)function srp.HasActivePlayers(a)return info.Dev||player.GetCount()>=(a||info.PlayersNeeded)end;function concommand.AddDev(...)if info.Dev then concommand.Add(...)end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/init_sh.lua:
cleanup.Register("props")cleanup.Register("npcs")cleanup.Register("constraints")cleanup.Register("sents")cleanup.Register("vehicles")function GM:OnUndo(a,b)notification.AddLegacy(b&&b||"#Undone_"..a,NOTIFY_UNDO,2)surface.PlaySound("buttons/button15.wav")end;function GM:OnCleanup(a)notification.AddLegacy("#Cleaned_"..a,NOTIFY_CLEANUP,5)surface.PlaySound("buttons/button15.wav")end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/worldtips_cl.lua:
surface.CreateFont('GModWorldtip',{font='Helvetica',size=20,weight=700})local a=nil;local b=col.white_dark:Copy()local c=col.midnight:Copy()local d=col.midnight_light:Copy()function AddWorldTip(e,f,g,h,i)a={}a.dietime=SysTime()+0.05;a.text=f;a.pos=h;a.ent=i end;local function j(k)local h=k.pos:ToScreen()local l=0;local m=0;local n=10;local o=50;surface.SetFont'GModWorldtip'local p,q=surface.GetTextSize(k.text)l=h.x-p;m=h.y-q;l=l-o;m=m-o;draw.RoundedBox(8,l-n-2,m-n-2,p+n*2+4,q+n*2+4,c)draw.RoundedBox(8,l-n,m-n,p+n*2,q+n*2,d)draw.DrawText(k.text,"GModWorldtip",l+p/2,m,b,TEXT_ALIGN_CENTER)end;hook('HUDPaint','WorldTips',function()if a&&a.dietime>SysTime()then j(a)end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/toolquickswitch_cl.lua:
local a=info.DataFolder..'quicktool.dat'local b={}local c={}local d=10;local function e(f)return c[f]end;local function g()file.Write(a,util.TableToJSON(b))hook.Run('OnQuickToolsSaved',b)end;local function h(f)table.remove(c,f)table.remove(b,f)g()end;local function i(f,j)local tool=GetToolInfo(j)if tool then b[f]=j;c[j]=tool.Name[1]=='#'&&language.GetPhrase(tool.Name:sub(1))||tool.Name;g()end end;local function k()if file.Exists(a,'DATA')then b=util.JSONToTable(file.Read(a,'DATA'))for l=1,#b do local tool=GetToolInfo(b[l])if tool then c[b[l]]=tool.Name[1]=='#'&&language.GetPhrase(tool.Name:sub(1))||tool.Name end end end end;concommand.Add('srp_quicktool_refresh',k)hook('PostReloadToolsMenu',function()k()end)function spawnmenu.ShowQuickToolMenuSettings(m)local n=DermaMenu()local sub=n:AddSubMenu'Quick Selection'local o=m.Name;for l=1,#b do local j=b[l]if!j then continue end;local p=e(j)if!p then continue end;sub:AddOption(l..'. Replace '..p,function()i(l,o)end)end;if#b<d then sub:AddOption('Add New Slot',function()i(#b+1,o)end)end;n:AddSpacer()n:AddOption'Close'n:Open()end;function spawnmenu.ShowQuickToolMenuSelection(q)local n=DermaMenu()for l=1,#b do local j=b[l]if!j then continue end;local p=e(j)if!p then continue end;sub:AddOption(p,function()RunConsoleCommand('gmod_toolmode',tool)end)end;n:AddSpacer()n:AddOption'Close'n:Open()end;hook('PlayerBindPress',function(r,s)local t=r:GetActiveWeapon()if!IsValid(t)||t:GetClass()!='gmod_tool'||!input.IsKeyDown(KEY_LSHIFT)||string.sub(s,1,4)!='slot'then return end;local u=tonumber(string.sub(s,-1))u=u==0&&10||u;u=u<1&&10||u>10&&1||u;if b[u]then RunConsoleCommand('gmod_toolmode',b[u])return true end end)local v=50;local w=Color(0,0,0,200)local x=Color(39,131,237,200)hook('HUDPaint',function()local t=LocalPlayer():GetActiveWeapon()if!IsValid(t)||t:GetClass()!='gmod_tool'||#b==0 then return end;local y=LocalPlayer():GetInfo'gmod_toolmode'local z,A=#b,0;local B,C=ScrW(),ScrH()local D=0;surface.SetFont'ui_label.r'for l=1,z do local j=b[l]local p=e(j)if p then local E,F=surface.GetTextSize('10. '..p)if E>D then D=E end end end;D=D+20;local G=B-D-4;local H=C-z*27;for l=1,z do local j=b[l]local p=e(j)if!p then continue end;local I=H+A*27;draw.RoundedBox(6,G,I,D,25,y==j&&x||w)draw.DrawText(Format('%02i',A+1)..' '..p,'ui_label.r',G+5,I+4,col.white,TEXT_ALIGN_LEFT)A=A+1 end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/utilitiesmenu_cl.lua:
local function a(b)end;local function c(b)end;local function d(b)b:AddControl("Header",{Description="#utilities.physgunsettings"})local e={physgun_drawbeams="1",gm_snapgrid="0",gm_snapangles="45",physgun_rotation_sensitivity="0.05",physgun_wheelspeed="10"}b:AddControl("ComboBox",{MenuButton=1,Folder="util_physgun",Options={["#preset.default"]=e},CVars=table.GetKeys(e)})b:AddControl("CheckBox",{Label="#utilities.physgun_drawbeams",Command="physgun_drawbeams"})b:AddControl("Slider",{Label="#utilities.gm_snapgrid",Type="Integer",Command="gm_snapgrid",Min="0",Max="128"})b:AddControl("Slider",{Label="#utilities.gm_snapangles",Type="Integer",Command="gm_snapangles",Min="5",Max="90"})b:AddControl("Slider",{Label="#utilities.physgun_rotation_sensitivity",Type="Float",Command="physgun_rotation_sensitivity",Min="0.01",Max="1"})b:AddControl("Slider",{Label="#utilities.physgun_wheelspeed",Type="Integer",Command="physgun_wheelspeed",Min="0",Max="50"})end;hook.Add("PopulateToolMenu","PopulateUtilityMenus",function()spawnmenu.AddToolMenuOption("Utilities","User","User_Cleanup","#spawnmenu.utilities.cleanup","","",c)spawnmenu.AddToolMenuOption("Utilities","User","Undo","#spawnmenu.utilities.undo","","",a)spawnmenu.AddToolMenuOption("Utilities","User","PhysgunSettings","#spawnmenu.utilities.physgunsettings","","",d)if LocalPlayer():IsRoot()then spawnmenu.AddToolMenuOption("Utilities","Admin","Admin_Cleanup","#spawnmenu.utilities.cleanup","","",c)end end)hook.Add("AddToolMenuCategories","CreateUtilitiesCategories",function()spawnmenu.AddToolCategory("Utilities","User","#spawnmenu.utilities.user")if LocalPlayer():IsRoot()then spawnmenu.AddToolCategory("Utilities","Admin","#spawnmenu.utilities.admin")end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/controls/preset_editor_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/controls/ropematerial_cl.lua:
list.Set("RopeMaterials","#ropematerial.rope","cable/rope")list.Set("RopeMaterials","#ropematerial.cable","cable/cable2")list.Set("RopeMaterials","#ropematerial.xbeam","cable/xbeam")list.Set("RopeMaterials","#ropematerial.laser","cable/redlaser")list.Set("RopeMaterials","#ropematerial.electric","cable/blue_elec")list.Set("RopeMaterials","#ropematerial.physbeam","cable/physbeam")list.Set("RopeMaterials","#ropematerial.hydra","cable/hydra")local a={}function a:Init()self:SetItemWidth(0.14)self:SetItemHeight(0.3)self:SetAutoHeight(true)local b=list.Get("RopeMaterials")for c,d in pairs(b)do self:AddMaterial(c,d)end end;function a:Paint(e,f)draw.RoundedBox(4,0,0,e,f,Color(128,128,128,255))end;vgui.Register("RopeMaterial",a,"MatSelect")
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contenttypes/addonprops_cl.lua:
local function a(b,c,d,e)local f,g=file.Find(c.."*",d)if!f then MsgN("Warning! Not opening '"..c.."' because we cannot search in it!")return false end;local h=false;for i,j in pairs(f)do if!string.EndsWith(j,".mdl")then continue end;local k=spawnmenu.GetContentType("model")if k then k(b,{model=c..j})h=true end end;for i,j in pairs(g)do local l=a(b,c..j.."/",d,e)h=h||l end;return h end;local function m(self)if!IsValid(self)||!self.wsid||self.wsid=="0"then return end;local n=DermaMenu()n:AddOption("#spawnmenu.openaddononworkshop",function()steamworks.ViewFile(self.wsid)end):SetIcon("icon16/link_go.png")n:Open()end;local function o(p)local q=p.ViewPanel;for r,s in SortedPairsByMemberValue(engine.GetAddons(),"title")do if!s.downloaded||!s.mounted then continue end;if s.models<=0 then continue end;local t=p:AddNode(s.title.." ("..s.models..")","icon16/bricks.png")t.DoClick=function()q:Clear(true)local u=a(q,"models/",s.title,"*.mdl")if!u then local k=spawnmenu.GetContentType("header")if k then k(q,{text="#spawnmenu.failedtofindmodels"})end;local k=spawnmenu.GetContentType("header")if k then k(q,{text=tostring(s.title).." (ID: "..tostring(s.wsid)..")"})end end;p.pnlContent:SwitchPanel(q)end;t.DoRightClick=m;t.wsid=s.wsid end end;local v;hook.Add("PopulateContent","AddonProps",function(w,x,y)local z=vgui.Create("ContentContainer",w)z:SetVisible(false)z.IconList:SetReadOnly(true)v=y:AddNode("#spawnmenu.category.addons","icon16/folder_database.png")v.ViewPanel=z;v.pnlContent=w;o(v)end)hook.Add("GameContentChanged","RefreshSpawnmenuAddons",function()if!IsValid(v)then return end;v:Clear()v.ViewPanel:Clear(true)o(v)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contenttypes/npcs_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/core_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/labelgroup_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/modelpanel_ui.lua:
local a={}a.background=Material('materials/galactic/ui/starscape_bw.png','smooth noclamp')local b=Vector()local c=Angle()local d={['jiggle_base']=true,['bird_wingtips']=true,['bird_wingmids']=true,['ValveBiped.Bip01_Spine4']=true}function a:Init()self:SetCamPos(Vector(0,-100,10))self.aLookAngle=c;self:SetFOV(100)self:SetCursor'arrow'self.Entities={}self.CanControl=false;self.colAmbientLight=col.white;self.lerpFactor=0.1;self.RotatePoint=Vector(0,0,1)end;function a:AddPanel(e,f,g)local h=srp.ui.Create(e,nil,g)if!IsValid(h)then return self end;h:SetParent(self)if self.stacked then h:Dock(TOP)h:InvalidateLayout(true)end;if isfunction(f)then f(h,self)else return f&&self||h end end;function a:SetCanControl(f)self.CanControl=f;self:SetCursor(f&&'hand'||'arrow')return end;function a:PreDrawLights()end;function a:PostDrawLights()end;function a:SetCamPosLerp(i,j)self.lerpFactor=i;self.camposlerp=j end;function a:SetEntAngLerp(k,i,j)k.entlerpangFactor=i;k.entanglerp=j end;function a:SetEntPosLerp(k,i,j)k.entlerpFactor=i;k.entposlerp=j end;function a:SetEntScaleLerp(k,i,j)k.entlerpscaleFactor=i;k.entscalelerp=j end;function a:SetCamAngLerp(i,j)self.lerpangFactor=i;self.camanglerp=j end;function a:SetLookAt(l)self.aLookAngle=(l-(self.camposlerp&&self.camposlerp!=self.vCamPos&&self.camposlerp||self.vCamPos)):Angle()end;function a:SetCamAngle(m)self.aLookAngle=m end;function a:RotateAroundPoint(m)self.RotatePoint=m end;function a:OnMousePressed(n)self.MoveX,_=input.GetCursorPos()end;function a:Think()if!self.CanControl then return end;local k=self.Entities[1]if!IsValid(k)||!input.IsMouseDown(MOUSE_LEFT)||!self:IsHovered()then return end;if self.MoveX then local m=k:GetAngles()local o,p=input.GetCursorPos()local q=self.MoveX-o;local r,s=self:LocalToScreen(0,0)local t,u=self:GetWide(),self:GetTall()if o<r||o>r+t||p<s||p>s+u then return end;if q!=0 then self:TranslateCamTurn(k,m,q)end;self.MoveX=o end end;function a:TranslateCamTurn(k,m,q)m:RotateAroundAxis(self.RotatePoint,-q)k:SetAngles(m)end;function a:TryCenter(k,v,w)if!IsValid(k)then return end;local x=Vector(0,0,0)local y=0;local z=k:GetAttachments()w=w||2;k:SetupBones()local A=v&&(isnumber(v)&&v||k:LookupBone(v))if A then x=k:GetBonePosition(A)y=1;if x==k:GetPos()then x=k:GetBoneMatrix(A):GetTranslation()end elseif#z>0 then for n,B in pairs(z)do y=y+1;local C=k:GetAttachment(n).Pos;if!C then return end;x=Vector(x.x+C.x,x.y+C.y,x.z+C.z)end else if k:GetBoneCount()>1 then for n=0,k:GetBoneCount()-1 do if n==0 then continue end;if d[k:GetBoneName(n)]then continue end;y=y+1;local D=k:GetBonePosition(n)if!D then continue end;if D==k:GetPos()then D=k:GetBoneMatrix(n):GetTranslation()end;x=Vector(x.x+D.x,x.y+D.y,x.z+D.z)end else x=k:GetBonePosition(0)||x;y=1;if x==k:GetPos()then local E=k:GetBoneMatrix(0)x=E&&E:GetTranslation()||x end end end;local F,G=k:GetRenderBounds()local H=(G-F):Length()x=x/y;if A then k:SetPos(-x)self:SetCamPos(-x*w*.25)self:SetLookAt(x)else self:SetCamPos(x-Vector(0,H*w,5))self:SetLookAt(x+Vector(0,0,5))end end;function a:Paint(I,J)if self:IsVisible()then self:DrawScene(I,J)end end;function a:DrawScene(I,J)if!self.Entities||#self.Entities==0 then return end;local K,L=self:LocalToScreen(0,0)if self.camposlerp&&self.vCamPos!=self.camposlerp then local M=LerpVector(self.lerpFactor*FrameTime(),self.vCamPos,self.camposlerp)self.vCamPos=M end;if self.camanglerp&&self.aLookAngle!=self.camanglerp then local N=LerpAngle(self.lerpangFactor*FrameTime(),self.aLookAngle,self.camanglerp)self.aLookAngle=N end;for _,k in ipairs(self.Entities)do if k.entanglerp&&k:GetAngles()!=k.entanglerp then local N=LerpAngle(k.entlerpangFactor*FrameTime(),k:GetAngles(),k.entanglerp)k:SetAngles(N)end;if k.entposlerp&&k:GetPos()!=k.entposlerp then local M=LerpVector(k.entlerpFactor*FrameTime(),k:GetPos(),k.entposlerp)k:SetPos(M)end;if k.entscalelerp&&k:GetModelScale()!=k.entscalelerp then local w=LerpVector(k.entlerpscaleFactor*FrameTime(),k:GetPos(),k.entscalelerp)k:SetModelScale(w)end end;local O=self:GetParent():GetAlpha()||255;cam.Start3D(self.vCamPos,self.aLookAngle,self.fFOV,K,L,I,J,1,25000)self:PreDrawLights()render.SuppressEngineLighting(true)render.SetLightingOrigin(Vector(0,0,150))render.ResetModelLighting(self.colAmbientLight.r/255,self.colAmbientLight.g/255,self.colAmbientLight.b/255)render.SetColorModulation(self.colColor.r/255,self.colColor.g/255,self.colColor.b/255)render.SetBlend(O/255*self.colColor.a/255)for n=0,6 do local col=self.DirectionalLight[n]if col then render.SetModelLighting(n,col.r/255,col.g/255,col.b/255)end end;self:PostDrawLights()local P=self;local Q=self:GetWide()local R=0;local S=0;local T=self:GetTall()local U=P;while P:GetParent()!=nil do P=P:GetParent()local K,L=U:GetPos()S=math.Max(L,S+L)R=math.Max(K,R+K)T=math.Min(L+U:GetTall(),T+L)Q=math.Min(K+U:GetWide(),Q+K)U=P end;render.SetScissorRect(R,S,Q,T,true)local V,W=ScrW(),ScrH()for _,k in pairs(self.Entities)do if!IsValid(k)then continue end;local h=self:PreDrawModel(k,self.vCamPos,K,L,I,J)if h!=false then render.PushFilterMag(TEXFILTER.ANISOTROPIC)render.PushFilterMin(TEXFILTER.ANISOTROPIC)k:DrawModel()self:PostDrawModel(k,self.vCamPos,K,L,I,J)render.PopFilterMag()render.PopFilterMin()end end;render.SetScissorRect(0,0,0,0,false)render.SuppressEngineLighting(false)cam.End3D()self.LastPaint=RealTime()end;function a:RunAnimation()for _,k in pairs(self.Entities)do if!IsValid(k)then continue end;k:FrameAdvance((RealTime()-self.LastPaint)*self.m_fAnimSpeed)end end;function a:AddModel(X,l,Y,Z,a0,a1)l=l||b;Y=Y||c;local k=ClientsideModel(X,RENDERGROUP_BOTH)if!IsValid(k)then return end;k:SetAngles(Y)k:SetNoDraw(true)k:SetIK(false)k:SetPos(l)k:SetModelScale(Z||1)k:Spawn()k.ModelPanel=self;local a2=k:LookupSequence(a0||'walk_all')if a2>0 then k.AutomaticFrameAdvance=true;k:ResetSequence(a2)k:SetCycle(0)end;local a3=table.insert(self.Entities,k)if a1 then return k,a3 end;return k end;function a:AddModels(a4)local a5={}for _,a6 in ipairs(a4)do if!a6.model then continue end;a5[#a5+1]=self:AddModel(a6.model,a6.pos,a6.ang,a6.scale)end;return a5 end;function a:AddEntity(k,a0)if!IsValid(k)then return end;k:SetNoDraw(true)k:SetIK(false)k:Spawn()k.ModelPanel=self;local a2=k:LookupSequence(a0||'walk_all')if a2>0 then k:ResetSequence(a2)end;return k,table.insert(self.Entities,k)end;function a:GetEntity(a3)local k=self.Entities[a3]if IsValid(k)then return k else return nil end end;function a:RemoveEntity(a3)local k=self.Entities[a3]if IsValid(k)then table.remove(self.Entities,a3):Remove()return true end;return false end;function a:RunAnimation(k)k:FrameAdvance((RealTime()-self.LastPaint)*self.m_fAnimSpeed)end;function a:Clear()for _,k in pairs(self.Entities)do if IsValid(k)then k:Remove()end end end;function a:OnRemove()self:Clear()end;vgui.Register('srp_modelpanel',a,'DModelPanel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/modelwheel_ui.lua:
local a={SelectionOffsets={},Paint=function(b)end}local c='common/talk.wav'local d=Material'materials/galactic/ui/character_orb.png'local e=Material'materials/galactic/ui/character_orb_inner.png'local f=Color(255,255,255,20)function a:Init()self.ents={}self.selected=1;self.Distance=100;self.lerp_pos=0;self.selected_lerpto=0;self.UIRingPosition=Vector(-15,30,0)self.UINamePosition=Vector(-10,-9,90)self.UINamePositionOffset=Vector(0,0,9)self.UIScale=0.2;self:AddPanel('srp_modelpanel',function(g)self.mdl=g;g:Dock(FILL)g:SetCamPos(Vector(240,0,60))g:SetLookAt(Vector(0,0,60))g.PreDrawModel=function(b,h)local i,j=b:LocalToScreen(b:GetPos())local k=Vector(i,j,0)*self.UIScale;self:PreDrawModel(b,h,k)end;g.PostDrawModel=function(b,h)local i,j=b:LocalToScreen(b:GetPos())local k=Vector(i,j,0)*self.UIScale;self:PostDrawModel(b,h,k)end end)self:AddPanel('srp_button',function(l)l:SetFont'ui_button_direction'l:SetText'S'l:SetSize(40,40)l:SetVisible(false)l:SetBackgroundColor(col.transparent)l:SetHoverColor(col.transparent)l:SetBorderColor(col.transparent)l:LeftClick(function()surface.PlaySound(c)self:Previous()end)self.previous=l end)self:AddPanel('srp_button',function(l)l:SetFont'ui_button_direction'l:SetText'T'l:SetSize(40,40)l:SetVisible(false)l:SetBackgroundColor(col.transparent)l:SetHoverColor(col.transparent)l:SetBorderColor(col.transparent)l:LeftClick(function()surface.PlaySound(c)self:Next()end)self.next=l end)end;function a:PreDrawModel(m,h,n)if!IsValid(h)||!h.data||!d||!e then return end;local o=self.selected==h.id;h.cur_spin=(h.cur_spin||math.random(0,100))+FrameTime()/1*(o&&100||20)m:RunAnimation(h)local p=h:LocalToWorld(n+self.UIRingPosition)cam.Start3D2D(p,Angle(),1)DisableClipping(true)surface.SetDrawColor(col.white)surface.SetMaterial(d)surface.DrawTexturedRectRotatedPoint(0,0,32,32,h.cur_spin,0,0)surface.SetDrawColor(col.white)surface.SetMaterial(e)surface.DrawTexturedRect(-16,-16,32,32)DisableClipping(false)cam.End3D2D()end;function a:PostDrawModel(m,h,n)if!IsValid(h)||!h.data||!h.data.name then return end;local o=self.selected==h.id;local col=o&&col.white||f;self.SelectionOffsets[h]=math.Approach(self.SelectionOffsets[h]||(o&&0||1),o&&1||0,RealFrameTime()/1*2)local p=h:LocalToWorld(n+self.UINamePosition+self.UINamePositionOffset*self.SelectionOffsets[h])cam.Start3D2D(p,Angle(0,90,90),.2)DisableClipping(true)draw.DrawText(h.data.name,'ui_header.l',0,0,col,TEXT_ALIGN_CENTER)DisableClipping(false)cam.End3D2D()end;function a:Clear()for q=1,#self.ents do if IsValid(self.ents[q])then self.ents[q]:Remove()end end;self.ents={}self.selected=1;self.selected_lerpto=0;self.lerp_pos=0 end;function a:SetDistance(r)self.Distance=r end;function a:AddModel(g,s,t)local h=self.mdl:AddModel(g)local u=table.insert(self.ents,h)h:SetTransmitWithParent(true)h:SetMoveType(MOVETYPE_NONE)h.data=s;h.id=u;self.previous:SetVisible(true)self.next:SetVisible(true)if t||u==1 then self:Select(u-1)else self:UpdateCircle(self.lerp_pos)end;return h end;function a:RemoveModel(u)local h=table.remove(self.ents,u)if!IsValid(h)then return end;h:Remove()self:Select(0)end;function a:Select(u)local v=#self.ents;local w=math.abs(u)%(v==0&&1||v)self.selected_lerpto=u;self.selected=(w==0&&0||w)+1;if u<0 then local u=math.abs(self.selected-v-2)self.selected=u>#self.ents&&1||u end;if self.ents[self.selected]then self.json=string.Replace(util.TableToJSON(self.ents[self.selected].data||{}),',',',\n')end;self:OnSelected(self.selected,self.ents[self.selected])return self end;function a:Change(x)if#self.ents<2 then return end;local u=(self.selected_lerpto||0)+x;self:Select(u)return self end;function a:Next()self:Change(1)return self end;function a:Previous()self:Change(-1)return self end;function a:OnSelected(u,h)end;function a:Think()if!self.mdl then return end;if self.lerp_pos!=self.selected_lerpto then self.lerp_pos=Lerp(FrameTime()/1*3,self.lerp_pos,self.selected_lerpto)self:UpdateCircle(self.lerp_pos)end end;function a:UpdateCircle(y)y=y||0;local z=#self.ents;for q=1,z do local h=self.ents[q]if IsValid(h)then local A=math.rad(360*(q-y-1)/z)local B,C=self.Distance*math.cos(A),self.Distance*math.sin(A)h:SetPos(Vector(B,C,0))end end end;function a:PerformLayout(D,E)if self.previous then self.previous:SetPos(D*.2,E*.5)end;if self.next then self.next:SetPos(D*.8,E*.5)end end;vgui.Register('srp_modelwheel',table.Copy(a),'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/purchase_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/screenspace_ui.lua:
local a={}local b={['$pp_colour_mulr']=0,['$pp_colour_mulb']=0,['$pp_colour_mulg']=0,['$pp_colour_brightness']=0,['$pp_colour_colour']=1,['$pp_colour_addr']=0,['$pp_colour_addb']=0,['$pp_colour_addg']=0,['$pp_colour_contrast']=1}local c=table.Copy(b)local d={'$pp_colour_brightness','$pp_colour_contrast','$pp_colour_colour','$pp_colour_addr','$pp_colour_addg','$pp_colour_addb','$pp_colour_mulr','$pp_colour_mulg','$pp_colour_mulb'}local e='Default'local f={}local g={}local function h(i,j)g[i]=j;f[#f+1]=i end;h('Default',table.Copy(b))h('Dead Effect',{['$pp_colour_mulr']=1,['$pp_colour_mulb']=0,['$pp_colour_mulg']=0,['$pp_colour_brightness']=0,['$pp_colour_colour']=0,['$pp_colour_addr']=0.25714285714286,['$pp_colour_addb']=0,['$pp_colour_addg']=0,['$pp_colour_contrast']=0.55})function a:Init()self:SetTitle'Screenspace Test'self.panels={}self:AddPanel('srp_dropdown',function(k)k:SetBackgroundColor(background)k:DockMargin(0,0,0,10)k:Dock(TOP)k:OnSelect(function(l,m,n)e=n.id;self:Reset(g[n.id])end)for o,p in pairs(f)do k:AddOption(p,{id=p},nil,p==e)end end)for o,i in pairs(d)do local q=c[i]ui.Create('DPanel',function(r)r:SetParent(self)r:Dock(TOP)r:SetTall(40)r.Paint=function()end;ui.Create('DLabel',function(s)s:SetParent(r)s:SetFont'ui.18's:SetColor(col.white)s:SetText(i)s:SizeToContents()s:SetTall(14)s:SetPos(5,0)end)ui.Create('ui_slider',function(t)t.ssid=i;t:SetParent(r)t:SetWide(200)t:SetValue(q)t:SetPos(5,18)t.OnChange=function(l,u)c[l.ssid]=u end;self.panels[i]=t end)end)end;self:AddPanel('srp_button_rounded',function(v)v:Dock(TOP)v:SetText'Copy'v:SetBackgroundColor(col.blue)v:DockMargin(4,2,4,1)v:LeftClick(function(l)local w='{\n'for i,u in pairs(c)do w=w..'\t[\''..i..'\'] = '..u..',\n'end;w=w..'\n}'print(w)SetClipboardText(w)end)end)self:AddPanel('srp_button_rounded',function(v)v:Dock(TOP)v:SetText'Reset'v:SetBackgroundColor(col.red)v:DockMargin(4,1,4,1)v:LeftClick(function(l)self:Reset()end)end)hook('RenderScreenspaceEffects','srp_screenspacetest',function()draw.ColorModify(c)end)end;function a:Reset(j)c=table.Copy(j||b)for i,t in pairs(self.panels)do t:SetValue(j&&j[i]||c[i])end end;vgui.Register('srp_screenspacetest',a,'srp_window')concommand.Add('srp_screenspace',function(x)srp.ui.Create('srp_screenspacetest',function(t)t:SetSize(222,515)t:MakePopup()t:Center()end)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/tip_ui.lua:
local a={}local b,c,d=600,50,2;local e=Material('materials/galactic/ui/warning.png','smooth noclamp')local f=Color(222,222,222)local g=60;local h={Sound('galactic/radio/voip_end_transmit_beep_01.wav'),Sound('galactic/radio/voip_end_transmit_beep_02.wav'),Sound('galactic/radio/voip_end_transmit_beep_03.wav'),Sound('galactic/radio/voip_end_transmit_beep_04.wav')}function a:Init()self:DockPadding(d+g+5,d+2,d+2,d+2)self:SetSize(b,c)self:SetAlpha(0)self:SetPos((ScrW()-b)*.5,45)self:SetVisible(false)self:AddPanel('srp_label',function(i)i:Dock(TOP)i:SetContentAlignment(4)i:SetMouseInputEnabled(false)i:DockPadding(0,0,0,0)i:DockMargin(0,0,0,0)i:SetFont('ui_label.xl')i:SetTextColor(f)self.title=i end)self:AddPanel('srp_label',function(i)i:Dock(FILL)i:SetContentAlignment(4)i:SetMouseInputEnabled(false)i:SetWrap(true)i:SetAutoStretchVertical(true)i:DockPadding(0,0,0,0)i:DockMargin(0,0,0,0)i:SetFont('ui_label.l')i:SetTextColor(f)self.info=i end)end;function a:SetMaterial(j)self.IconMaterial=j;return self end;function a:SetInfo(k,l)self.title:SetText(k)self.info:SetText(l)self:SetVisible(true)self:AlphaTo(255,1,0,function()if!IsValid(self)then return end;surface.PlaySound(h[math.random(#h)])self:MoveTo(2,45,1,4,-21,function()if IsValid(self)then self:MoveTo(-b-50,45,1,4,10,function()if IsValid(self)then self:Remove()end end)end end)end)end;function a:Paint(m,n)surface.SetDrawColor(0,0,0,200)surface.DrawRect(0,0,m,n)surface.SetDrawColor(col.blue)surface.DrawRect(0,0,g,n)surface.SetDrawColor(0,0,0,255)surface.DrawOutlinedRect(0,0,m,n)surface.SetMaterial(self.IconMaterial||e)surface.SetDrawColor(col.white)surface.DrawTexturedRect((g-32)*.5,(n-32)*.5,32,32)end;vgui.Register('srp_tip',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/tooltip_ui.lua:
local a={}function a:Init()self:SetSize(250,42)self:DockPadding(1,1,1,1)self:SetMouseInputEnabled(false)self:SetBackgroundColor(col.grey_dark)self:AddPanel('srp_label',function(b)b:Dock(FILL)b:SetContentAlignment(4)b:SetMouseInputEnabled(false)b:SetTextColor(Color(200,200,200))b:SetFont'ui_label.r'b:SetWrap(true)b:SetAutoStretchVertical(true)self.txt=b end)self:SetAlpha(0)end;function a:SetText(c)surface.SetFont(self.txt:GetFont())self.txt:SetText(c)self:AlphaTo(255,.05,0)end;function a:SetTextColor(col)self.txt:SetTextColor(col)end;function a:Think()if self.Removing then return end;self:MoveToFront()local d,e=gui.MousePos()if IsValid(self.parent)&&self.parent:IsVisible()then local f,g=self.parent:LocalToScreen(0,0)local h,i=self.parent:GetWide()+f,self.parent:GetTall()+g;if d<f||d>h||e<g||e>i then self:DoRemove()return end else self:DoRemove()return end;self:SetPos(d+25,e-self:GetTall()/2)end;function a:DoRemove()self.Removing=true;self:AlphaTo(0,.05,0,function()if IsValid(self)then self:Remove()end end)end;function a:Paint(j,k)draw.RoundedBox(6,0,0,j,k,col.grey_light)draw.RoundedBox(6,1,1,j-2,k-2,self.m_bgColor)end;vgui.Register('srp_tooltip',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/ui/battlepass_item_ui.lua:
local a={}local b=Color(255,255,255,100)local c=col.blue;local d=col.orange;local e=col.blue_dark;local f=col.orange_dark;local g={[srp.battlepass.COMMON]={BackgroundColor=Color(28,180,214),BackgroundImage=nil,BorderColor=nil}}function a:Init()self:SetWide(120)self:DockMargin(0,0,0,0)self:DockPadding(2,2,2,2)self:SetBackgroundColor(col.transparent)self:SetHoverColor(col.transparent)self:SetBorderColor(col.transparent)self:SetText''self.Percent=0;self:AddPanel('srp_button_rounded',function(h)h:Dock(TOP)h:DockMargin(0,0,0,0)h:SetBackgroundColor(col.black)h:SetHoverColor(col.black)h:SetSelectedBackgroundColor(col.blue)h:SetTall(22)h:SetMouseInputEnabled(false)h:SetFont'ui.14'self.Status=h end)self:AddPanel('srp_panel',function(h)h:Dock(FILL)h:DockMargin(0,4,0,4)h:SetBackgroundColor(b)h:SetMouseInputEnabled(false)h.Paint=function(i,j,k)draw.Box(0,0,j,k,i.m_bgColor)if i.BackgroundMaterial then surface.SetDrawColor(255,255,255,255)surface.SetMaterial(i.BackgroundMaterial)surface.DrawTexturedRect(0,0,j,k)end;if i.RareColor then draw.RoundedBox(6,0,k-10,j,k,i.RareColor)end end;self.Container=h end)self:AddPanel('srp_button_rounded',function(h)h:Dock(BOTTOM)h:DockMargin(0,0,0,0)h:SetTall(22)h:SetBackgroundColor(col.white)h:SetText''h:SetFont'ui.14'h:SetContentAlignment(4)h:SetTextColor(col.white)h:SetMouseInputEnabled(false)h:DockPadding(5,0,0,0)h.Paint=function(i,j,k)draw.RoundedBox(6,0,0,j,k,col.grey_dark)draw.RoundedBox(4,0,0,j*self.Percent,k,self.Percent==1&&col.orange||self.Percent==0&&col.grey_light||col.grey)if i.NextExperience then draw.SimpleText(i.NextExperience,'ui.14',j-5,k/2,col.white,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)end end;self.Progress=h end)end;function a:Populate(l,m,n,o,p)self.ItemLevel=l;self.Items=o;self.Free=p;self.Status:SetBackgroundColor(p&&c||d)self.Status:SetText(p&&'FREE'||'PREMIUM')self.Progress:SetText(l)local q=srp.talents.GetXPTable(m.id)||{}local r,s,t=q[l-1]||0,q[l],q[l+1]||q[l]if n.LastExperience>s then self.Percent=1;self.Progress:SetFont'SSRPForkAwesome'self.Progress:SetText(0xf00c,true)elseif n.LastExperience>r&&n.LastExperience<s then self.Percent=1-(s-n.LastExperience)/(t-s)else self.Container:SetAlpha(180)end;self.Progress.NextExperience=s&&string.Comma(s)..'XP'||nil;if o&&o[1]then self:SetupPreview(o[1])if#o>1||o[1][1]=='cosmeticset'then self.Status:SetText(self.Status:GetText()..' BUNDLE!')end else self:SetAlpha(50)self.Status:SetText''self.Empty=true end end;function a:DoLevelUp(u,n,q)self.Parent=u;local s,t=q[self.ItemLevel],q[self.ItemLevel+1]||q[self.ItemLevel]if n.CurrentExperience>s then self.TargetPercent=1 else self.TargetPercent=1-(s-n.CurrentExperience)/(t-s)end end;function a:OnAnimationCompleted()if self.Percent==1 then self.Container:AlphaTo(255,0.2,0)surface.PlaySound('misc/rd_finale_beep01.wav')self.Progress:SetFont'SSRPForkAwesome'self.Progress:SetText(0xf00c,true)for v,w in ipairs(self.Items)do local x=srp.battlepass.GetUnlockType(w[1])hook.Run('OnBattlepassRewardClaimed',x,w,self.Style)end end end;function a:Select(y)if y then self.Status:SetBackgroundColor(self.Free&&c||d)else self.Status:SetBackgroundColor(self.Free&&e||f)end end;function a:Think()if self.TargetPercent then self.Percent=math.Approach(self.Percent,self.TargetPercent,0.02)if!self.NextChime||self.NextChime<CurTime()then chat.PlaySound()self.NextChime=CurTime()+0.1 end;if self.Percent==self.TargetPercent then self.NextAnimationTime=CurTime()+.25;self.TargetPercent=nil;self:OnAnimationCompleted()end end;if self.NextAnimationTime&&self.NextAnimationTime<CurTime()then self.Parent:NextAnimation()self.NextAnimationTime=nil end end;function a:SetupPreview(w)local z=w[1]local x=srp.battlepass.GetUnlockType(z)if!x then return end;local A=x:HasPreview()local B=x:HasCustomPanel()local C=x:GetModel(unpack(w,2))local D=x:GetIcon(unpack(w,2))if B then x:SetupPanel(self.Container,unpack(w,2),true)elseif A||C then self.Container:AddPanel('srp_modelpanel',function(E)E:Dock(FILL)E:DockMargin(0,0,0,0)E:SetMouseInputEnabled(true)if A then x:SetupPreview(E,unpack(w,2),true)else E:TryCenter(E:AddModel(C),0)end end)elseif D then self.Container:AddPanel('DImage',function(F)F:SetSize(64,64)F:SetPos((116-64)/2,(134-64)/2)F:SetMaterial(D)F:SetMouseInputEnabled(false)end)end;local G=g[x.Rarity||1]||g[1]self.Style=G;if G.BackgroundColor then self.Container.RareColor=G.BackgroundColor end;if G.BackgroundMaterial then self.Container.BackgroundMaterial=G.BackgroundMaterial end;if G.BorderColor then self.Container:SetBorderColor(G.BorderColor)end end;vgui.Register('srp_battlepassitem',a,'srp_button_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/ui/battlepass_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/ui/battlepasspreviews_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buffs/buffs_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/building/ui/building_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buybacks/ui/buybacks_ui.lua:
local a={}function a:Init()self:SetTitle'The Shady Clone'self:SetBackgroundColor(col.midnight)self:SetSize(700,500)self:Center()self:MakePopup()self:DockPadding(6,30,6,6)local b=self:AddHeader('Buybacks','I\'ve been ordered to buy back some of your materials. Got any of the good stuff for me?')b:DockMargin(0,5,0,5)b:SetTall(80)self:AddPanel('ui_scrollpanel',function(c)c:Dock(FILL)self.Scroll=c end)self:Populate()end;function a:Populate()for d,e in ipairs(srp.buyback.GetAll())do self:AddBuyback(e)end end;function a:AddBuyback(e)srp.ui.Create('srp_buyback',function(f)f:Populate(e)self.Scroll:AddItem(f)end)end;vgui.Register('srp_buybacks',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/character_sh.lua:
srp.character=srp.character||{}srp.character.data=srp.character.data||{}srp.character.maxcharacters=2;local a={}local b={}nw.Register'srp.character.id':Write(net.WriteUInt,32):Read(net.ReadUInt,32):SetPlayer():SetHook('OnCharacterChanged')nw.Register'srp.character.preset':Write(net.WriteUInt,6):Read(net.ReadUInt,6):SetLocalPlayer()nw.Register'srp.character.name':Write(net.WriteString):Read(net.ReadString):SetPlayer()nw.Register'srp.character.money':Write(net.WriteInt,32):Read(net.ReadInt,32):SetLocalPlayer():SetHook('OnMoneyChanged')nw.Register'srp.character.tag':Write(net.WriteString):Read(net.ReadString):SetPlayer()nw.Register'srp.character.title':Write(net.WriteString):Read(net.ReadString):SetPlayer()nw.Register'srp.character.ironman':Write(net.WriteBool):Read(net.ReadBool):SetLocalPlayer()local c={['astonedpenguin']=true,['kingofbeast']=true,['scott']=true,['tobester']=true,['stiffy']=true}local d={['models/mrpounder1/player/massif.mdl']=true,['models/galactic/r2d2/r2d2.mdl']=true,['models/player/c3po.mdl']=true,['models/galactic/whitedroid/whitedroid.mdl']=true,['models/galactic/reddroid/reddroid.mdl']=true,['models/galactic/bluedroid/bluedroid.mdl']=true,['models/star_wars_battlefront/sides/cis/droideka.mdl']=true}function PLAYER:IsRobot()return d[self:GetModel()]end;function PLAYER:GetMaxCharacters()local e=self:GetUpgradeCount('character_slots')*3;if self:IsVIPPlus()then return srp.character.maxcharacters+e+7 elseif self:IsVIP()then return srp.character.maxcharacters+e+4 else return srp.character.maxcharacters+e end end;function PLAYER:CanUseEventCharacters()return self:HasUpgrade('event_character')||self:IsVIP()end;function srp.character.IsValid(f,g)return SERVER&&srp.character.data[f][g]!=nil||CLIENT&&srp.character.me[g]!=nil||false end;function srp.character.IsValidName(h)if h:len()>25||h:len()<3 then return false,term.Get("NameLengthRequired")end;local i=h:lower()local j=string.match(h,"^[a-zA-Zа-яА-Я0-9%-%[%] ']+$")if!j||c[i]||!srp.chat.IsBlacklistFree(i)then return false,term.Get("InvalidCharacters")end;return true end;function srp.character.IsValidBiography(h)if h:len()>256||h:len()<2 then return false,term.Get("BiographyLengthRequired")end;local i=h:lower()local j=string.match(h,"^[a-zA-Zа-яА-Я0-9%-%[%]%.%,%!%:%(%)' ]+$")if!j then return false,term.Get("InvalidCharacters")end;return true end;function srp.character.GetPlayer(k)local l=player.GetAll()for m=1,#l do local f=l[m]if IsValid(f)&&f:CharacterID()==k then return f end end end;function srp.character.Select(k,n)net.Start(n&&'srp.character.RequestChange'||'srp.character.SelectCharacter')net.WriteUInt(k,32)net.SendToServer()end;srp.AddCommand('changecharacter',function(f)net.Start'srp.character.Menu'net.WriteBool(true)net.Send(f)end):AddAlias('cc'):SetChatCommand():SetInfoSection('Character'):SetInfo('Displays the character menu. Some characters are restricted and you will have to have high health to change.')srp.AddCommand('forceunloadcharacter',function(f,o)if o:CharacterID()then srp.character.UnloadPlayer(o)hook.Run('OnCharacterForceUnloaded',f,o)end end):AddParam(cmd.PLAYER_ENTITY):SetFlag('*')srp.AddCommand('setcustomtitle',function(f,p)srp.character.SaveCustomTitle(f,p)end):AddParam(cmd.STRING,cmd.OPT_OPTIONAL):SetInfoSection('Character'):SetInfo('Sets a custom title to show in the scoreboard if you are VIP Plus'):SetInfoArgs({'Title => The custom title to set (max 60 characters)'})srp.AddCommand('cleartitle',function(f,o)srp.character.SaveCustomTitle(o,'Ive been a bad boy')end):AddParam(cmd.PLAYER_ENTITY):SetFlag('D'):SetInfoSection('Character'):SetInfo('Clears the targets title. Only to be used if the title breaks the rules'):SetInfoArgs({'Target => Name or SteamID of the person you want to clear the title of'})srp.AddCommand('clearbiography',function(f,o)srp.character.SetBiography(o,'Staff Reset',function(q,r)if IsValid(f)then srp.notif.Warning(f,3,r)end end)end):AddParam(cmd.PLAYER_ENTITY):SetFlag('D'):SetInfoSection('Character'):SetInfo('Clears a biography'):SetInfoArgs({'Target => Name or SteamID of the person you want to clear the title of'})srp.AddClientCommand('stats',function()if IsValid(srp.character.playerView)then srp.character.playerView:Remove()end;srp.ui.Create('srp_characterpanel',function(s)s:SetPlayer(LocalPlayer())srp.character.playerView=s end)end):SetInfoSection('Character'):SetInfo('View your own charcter stats')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/selectionpanels/info_ui.lua:
local a={}local b=Color(200,200,200,15)local c=Material('materials/galactic/ui/menu/talentlevel.png','smooth noclamp')local d=Material('materials/galactic/ui/menu/money-4.png','smooth noclamp')local e=Material('materials/galactic/ui/talents/created.png','smooth noclamp')local f=Material('materials/galactic/ui/talents/lastseen.png','smooth noclamp')local g=Material('materials/galactic/ui/hud/clock.png','smooth noclamp')function a:Init()self:DockPadding(4,4,4,4)self:AddPanel('srp_button_rounded',function(h)h:Dock(TOP)h:DockMargin(0,0,2,4)h:SetBackgroundColor(b)h:SetHoverColor(b)h:SetTextColor(col.white)h:SetContentAlignment(5)h:SetText'Allegiance'h:SetTall(35)self.allegiance=h end)self:AddPanel('srp_button_tag_rounded',function(h)h:Dock(TOP)h:DockMargin(0,0,2,4)h:SetBackgroundColor(b)h:SetHoverColor(b)h:SetMaterial(d)h:SetTextColor(col.white)h:SetContentAlignment(4)h:SetText'Money'h:SetTall(35)self.money=h end)self:AddPanel('srp_button_tag_rounded',function(h)h:Dock(TOP)h:DockMargin(0,0,2,4)h:SetBackgroundColor(b)h:SetHoverColor(b)h:SetMaterial(c)h:SetTextColor(col.white)h:SetContentAlignment(4)h:SetText'Level'h:SetTall(35)self.level=h end)self:AddPanel('srp_button_tag_rounded',function(h)h:Dock(TOP)h:DockMargin(0,0,2,4)h:SetBackgroundColor(b)h:SetHoverColor(b)h:SetMaterial(e)h:SetTextColor(col.white)h:SetContentAlignment(4)h:SetText'Created'h:SetTall(35)self.created=h end)self:AddPanel('srp_button_tag_rounded',function(h)h:Dock(TOP)h:DockMargin(0,0,2,4)h:SetBackgroundColor(b)h:SetHoverColor(b)h:SetMaterial(f)h:SetTextColor(col.white)h:SetContentAlignment(4)h:SetText'Last Seen'h:SetTall(35)self.updated=h end)self:AddPanel('srp_button_tag_rounded',function(h)h:Dock(TOP)h:DockMargin(0,0,2,4)h:SetBackgroundColor(b)h:SetHoverColor(b)h:SetMaterial(g)h:SetTextColor(col.white)h:SetContentAlignment(4)h:SetText'Time Played'h:SetTall(35)self.playtime=h end)self:AddPanel('srp_button_rounded',function(i)i:Dock(BOTTOM)i:SetText'DELETE'i:SetFont'ui_header.s'i:SetBackgroundColor(b)i:SetHoverColor(col.red_dark)i:SetBorderColor(col.white)i:DockMargin(0,4,0,0)i:SetTall(40)i:LeftClick(function()if self.character then srp.notif.Confirm({title='Confirm Deletion',sub_text=Format('Are you sure you want to permanently delete %q?',self.character.name),charid=self.character.characterid,callback=function(j)srp.notif.Confirm({title='Confirm Deletion x2',sub_text=Format('Are you REALLY sure you want to permanently delete %q?\nThis cannot be undone.',self.character.name),charid=self.character.characterid,callback=function(j)net.Start'srp.character.RequestDeletion'net.WriteUInt(j.charid,32)net.SendToServer()self:OnDeleted()end})end})end end)local k=Color(255,0,0,100)local l=Color(255,0,0,50)i.Paint=function(m,n,o)if m:IsHovered()then draw.RoundedBox(8,0,0,n,o,k)else draw.RoundedBox(8,0,0,n,o,l)end end;self.delete=i end)self:AddPanel('srp_button_rounded',function(i)i:Dock(BOTTOM)i:SetText'SPAWN'i:SetFont'ui_header.s'i:SetBackgroundColor(b)i:SetHoverColor(col.blue_dark)i:SetBorderColor(col.white)i:DockMargin(0,0,0,10)i:SetTall(40)i:LeftClick(function()if self.character then i:SetDisabled(true,3)local p=self.character.allegianceTbl;if p&&p:IsEvent()then srp.notif.Confirm({title='Event Character',sub_text='This is an event character. You must only use this if you have been asked to do so. Follow the GM rules outlines for VIPs. Are you sure you want to use this?',char_id=self.character.characterid,callback=function(j)if self.Select then self:Select()end end})else self:Select()end end end)local q=Color(0,0,255,50)local r=Color(0,0,255,150)i.Paint=function(m,n,o)if m:IsHovered()then draw.RoundedBox(8,0,0,n,o,q)else draw.RoundedBox(8,0,0,n,o,r)end end;self.spawn=i end)end;function a:Populate(s)local t=LocalPlayer():GetCurrency()||'RC'local u=s.allegianceTbl.color:Copy()u.a=50;local v=s.allegianceTbl.name;local w=s.groupid&&srp.groups.Get(s.groupid)if w then v=v..'\'s '..w.name end;self.Switching=LocalPlayer().character!=nil;self.character=s;self.allegiance:SetText(v)self.allegiance:SetBackgroundColor(u)self.allegiance:SetHoverColor(u)self.money:SetText(' Money: '..string.Comma(s.money||0)..' '..t)self.level:SetText(' Level: '..srp.talents.GetLevelFromXP(s.xp||0)||0)self.created:SetText(' Created: '..os.date('%m/%d/%Y',s.created||0))self.updated:SetText(' Updated: '..os.date('%m/%d/%Y',s.updated||0))self.playtime:SetText(' Played: '..ba.str.FormatTime(s.playtime||0))self.delete:SetVisible(LocalPlayer():CharacterID()!=s.characterid)self.spawn:SetVisible(LocalPlayer():CharacterID()!=s.characterid)self.spawn:SetText(self.Switching&&'SELECT'||'SPAWN')end;function a:Select()srp.character.Select(self.character.characterid,self.Switching)end;function a:OnDeleted()if self.character then hook.Run('OnCharacterDeleted',self.character)end end;function a:Paint()end;vgui.Register('srp_character_info',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/selectionpanels/purchase_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/chat/ui/commands_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_callingcard_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_displaymodel_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_displaysaber_ui.lua:
local a={}local b=Vector(0,0,0)local c=Angle(90,0,0)local d=Model'models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl'local e=Model'models/props/kybercrystal.mdl'local f=Vector()local g=Angle()function a:SetupPreview()local h=self.Slots[1].id==cosmetics.SLOT.SABER.HILT||self.Slots[1].id==cosmetics.SLOT.SABER.HILT2;self.DisplayModel=h&&d||e;self.DisplayPosition=h&&b||f;self.DisplayAngle=h&&c||g;self:AddPanel('srp_modelpanel',function(i)i:Dock(FILL)i:MoveToBack()i:SetCanControl(h)i.CrystalColor=color_white;function i:PreDrawModel(j)render.SetColorModulation(self.CrystalColor.r/255,self.CrystalColor.g/255,self.CrystalColor.b/255)end;self.PreviewPanel=i end)self:DisplayPreviewEntity()end;function a:DisplayPreviewEntity()if!IsValid(self.PreviewEntity)then self.PreviewEntity=self.PreviewPanel:AddModel(self.DisplayModel,self.DisplayPosition,self.DisplayAngle)self.PreviewEntity:SetRenderMode(RENDERMODE_TRANSALPHA)self.PreviewEntity.cents={}end;self.PreviewPanel:TryCenter(self.PreviewEntity,nil,1.6)self.PreviewPanel:SetFOV(75)end;function a:AddCosmetic(k)if k:GetSlot()==cosmetics.SLOT.SABER.HILT||k:GetSlot()==cosmetics.SLOT.SABER.HILT2 then self.PreviewEntity:SetModel(k:GetModel())return end;if k:GetSlot()==cosmetics.SLOT.SABER.COLOR||k:GetSlot()==cosmetics.SLOT.SABER.COLOR2 then self.PreviewPanel.CrystalColor=k:GetColor()end end;function a:RemoveCosmetic(k)if k:GetSlot()==cosmetics.SLOT.SABER.HILT||k:GetSlot()==cosmetics.SLOT.SABER.HILT2 then self.PreviewEntity:SetModel(self.DisplayModel)end;self.PreviewPanel.CrystalColor=color_white end;vgui.Register('srp_cosmetic_displaysaber',a,'srp_cosmetic_displayitem')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_presetcontroller_ui.lua:
local a={}function a:Init()self:SetBackgroundColor(col.midnight)self:SetBorderColor(col.transparent)self:DockPadding(0,0,0,0)self:AddPanel('srp_dropdown',function(b)b:Dock(FILL)b:DockMargin(4,4,2,4)b:SetBackgroundColor(col.midnight_light)b:SetBorderColor(col.transparent)b:SetHoverColor(col.midnight_light)b:OnSelect(function(c,d,e)if!e.id then self.LoadedPreset=nil;return end;if cosmetics.LoadPreset(self.Class,e.id)then self.LoadedPreset=e.id else self.LoadedPreset=nil;c:Deselect()end end)self.Dropdown=b end)self:AddPanel('srp_button_rounded',function(f)f:Dock(RIGHT)f:DockMargin(2,4,4,4)f:SetFont'SSRPForkAwesome'f:SetTooltip'Refresh Presets'f:SetText(0xf021,true)f:SetHoverColor(col.blue)f:LeftClick(function(c)c:SetDisabled(true,1)if self.Class then cosmetics.ClearPreset(self.Class)self.LoadedPreset=nil;self:LoadPresets()end end)self.Refresh=f end)self:AddPanel('srp_button_rounded',function(f)f:Dock(RIGHT)f:DockMargin(2,4,2,4)f:SetFont'SSRPForkAwesome'f:SetTooltip'Clear Selected Cosmetics'f:SetText(0xf12d,true)f:SetHoverColor(col.red)f:LeftClick(function(c)cosmetics.Clear()end)self.ClearAll=f end)self:AddPanel('srp_button_rounded',function(f)f:Dock(RIGHT)f:DockMargin(2,4,2,4)f:SetFont'SSRPForkAwesome'f:SetTooltip('Delete Preset')f:SetText(0xf1f8,true)f:SetHoverColor(col.red)f:LeftClick(function(c)c:SetDisabled(true,1)local e=self.Dropdown:GetSelected()if self.Class&&e then cosmetics.RemovePreset(self.Class,e.name)self.LoadedPreset=nil;self:LoadPresets()end end)self.Delete=f end)self:AddPanel('srp_button_rounded',function(f)f:Dock(RIGHT)f:DockMargin(2,4,2,4)f:SetFont'SSRPForkAwesome'f:SetTooltip'Save Preset'f:SetText(0xf0c7,true)f:SetHoverColor(col.green)f:LeftClick(function(c)if!self.Class then return end;if self.LoadedPreset then self:SavePreset(self.LoadedPreset)else srp.ui.Create('srp_requestvalue',function(g)g:SetTitle'Preset Name'g:SetText'Set a preset name.'g:OnSubmit(function(c,h)h=h:Replace(' ','_'):Replace('.','_'):sub(0,128)if IsValid(self)then self:SavePreset(h,true)c:Remove()end end)end)end end)self.Save=f end)self:AddPanel('srp_button_rounded',function(f)f:Dock(RIGHT)f:DockMargin(2,4,2,4)f:SetFont'SSRPForkAwesome'f:SetText(0xf067,true)f:SetBackgroundColor(col.green_dark)f:SetHoverColor(col.green)f:SetBorderColor(col.transparent)f:LeftClick(function()if self.Class then cosmetics.ApplyPreset(self.Class,self.LoadedPreset)end end)self.Apply=f end)end;function a:SavePreset(h,i)if cosmetics.SavePreset(self.Class,h)&&i then self.Dropdown:AddOption(h,{id=h})self.Dropdown:Select(h,true)end end;function a:Populate(j)self.Class=j;self.LoadedPreset=nil;self:LoadPresets()end;function a:PerformLayout(k,l)self.ClearAll:SetWide(l-8)self.Save:SetWide(l-8)self.Delete:SetWide(l-8)self.Refresh:SetWide(l-8)self.Apply:SetWide(l-8)end;function a:LoadPresets()local m=cosmetics.GetPresetNames(self.Class)self.Dropdown:Clear()self.Dropdown:AddOption('New Preset',{})for n,o in ipairs(m)do local p=string.Replace(o,'.dat')self.Dropdown:AddOption(p,{id=p})end end;vgui.Register('srp_cosmetic_presetcontroller',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmeticadjuster_ui.lua:
local a={}local b='cosmeticadjuster.Animate'local c={cosmetics.SLOT.APPAREL.HAIR,cosmetics.SLOT.APPAREL.HAIR_BEARD,cosmetics.SLOT.APPAREL.HEAD,cosmetics.SLOT.APPAREL.FACE,cosmetics.SLOT.APPAREL.FACE2,cosmetics.SLOT.APPAREL.NECK,cosmetics.SLOT.APPAREL.SHOULDERS,cosmetics.SLOT.APPAREL.SHOULDERS2,cosmetics.SLOT.APPAREL.PATCH,cosmetics.SLOT.APPAREL.CHEST,cosmetics.SLOT.APPAREL.CHEST_LEFT,cosmetics.SLOT.APPAREL.CHEST_RIGHT,cosmetics.SLOT.APPAREL.BACK,cosmetics.SLOT.APPAREL.LEFT_ARM,cosmetics.SLOT.APPAREL.RIGHT_ARM,cosmetics.SLOT.APPAREL.LEFT_HAND,cosmetics.SLOT.APPAREL.RIGHT_HAND,cosmetics.SLOT.APPAREL.WAIST,cosmetics.SLOT.APPAREL.LEFT_LEG,cosmetics.SLOT.APPAREL.RIGHT_LEG,cosmetics.SLOT.APPAREL.LEFT_KNEE,cosmetics.SLOT.APPAREL.RIGHT_KNEE,cosmetics.SLOT.APPAREL.LEFT_FOOT,cosmetics.SLOT.APPAREL.RIGHT_FOOT,cosmetics.SLOT.APPAREL.FEET}function a:Init()self:SetTitle'Cosmetic Model Adjuster'self:SetSize(ScrW(),ScrH())self:MakePopup()self:Center()self:SetBackgroundColor(col.grey)self.Items={}self.Options={}self.Settings={}local d=ScrW()*.8;self:AddPanel('srp_panel_rounded',function(e)e:Dock(LEFT)e:SetWide(d)e:DockMargin(10,10,10,10)e:SetBackgroundColor(col.grey_light)e:AddPanel('srp_modelpanel',function(f)f:Dock(FILL)f:SetCamPos(Vector(0,-50,50))f:SetLookAt(Vector(0,0,40))f:SetCanControl(true)self.Player=f:AddModel(LocalPlayer():GetModel(),Vector(0,15,0),Angle(0,-50,0))self.Model=f end)e:AddPanel('srp_panel_rounded',function(e)e:SetSize(370,600)e:SetPos(d-375,10)e:SetBackgroundColor(col.transparent)e:AddPanel('srp_panel_rounded',function(e)e:DockMargin(5,5,5,2)e:SetBackgroundColor(col.black)e:Dock(TOP)e:SetTall(50)e:AddPanel('DImage',function(g)g:Dock(LEFT)g:SetWide(40)self.PreviewImage=g end)e:AddPanel('srp_label',function(h)h:SetContentAlignment(5)h:SetFont'ui_label.xl'h:Dock(FILL)h:SetTextColor(col.white)h:SetText'Select a cosmetic!'self.PreviewName=h end)end)e:AddPanel('srp_panel_rounded',function(e)e:DockMargin(5,5,5,2)e:SetBackgroundColor(col.black)e:Dock(TOP)e:SetTall(60)e:SetVisible(false)e:AddPanel('srp_dropdown',function(i)i:SetContentAlignment(5)i:Dock(LEFT)i:SetWide(170)i:SetTextColor(col.white)i:SetBackgroundColor(col.grey)i:SetHoverColor(col.grey)i:OnSelect(function(j,k,l)self:SetModel(l.model)end)self.PreviewModel=i end)e:AddPanel('srp_button_rounded',function(m)m:Dock(RIGHT)m:SetWide(50)m:DockMargin(3,12,0,12)m:SetFont'SSRPForkAwesome'm:SetText(0xf1c9,true)m:SetTextColor(col.blue_light)m:SetToolTip('Save the Lua to clipboard to send to Scott!')m:LeftClick(function(j)self:DoLua()end)self.Lua=m end)e:AddPanel('srp_button_rounded',function(m)m:Dock(RIGHT)m:SetWide(50)m:DockMargin(3,12,0,12)m:SetFont'SSRPForkAwesome'm:SetText(0xf07c,true)m:SetTextColor(col.yellow)m:SetToolTip('Load item info for this model')m:LeftClick(function(j)self:DoLoad()end)self.Load=m end)e:AddPanel('srp_button_rounded',function(m)m:Dock(RIGHT)m:SetWide(50)m:DockMargin(0,12,0,12)m:SetFont'SSRPForkAwesome'm:SetText(0xf0c7,true)m:SetTextColor(col.white)m:SetToolTip('Save to a file for later editing')m:LeftClick(function(j)self:DoSave()end)self.Save=m end)self.ModelSelect=e end)e:AddPanel('srp_panel_rounded',function(e)e:DockMargin(5,5,5,2)e:SetBackgroundColor(col.black)e:Dock(TOP)e:SetTall(100)e:SetVisible(false)e:AddPanel('srp_dropdown',function(i)i:SetContentAlignment(5)i:Dock(TOP)i:SetTall(30)i:SetTextColor(col.white)i:SetBackgroundColor(col.grey)i:SetHoverColor(col.grey)i:OnSelect(function(j,k,l)self.AttachmentId=l.attachment;self:SetupAttachment()end)self.Attachment=i end)e:AddPanel('srp_dropdown',function(i)i:SetContentAlignment(5)i:Dock(TOP)i:SetTall(30)i:SetTextColor(col.white)i:SetBackgroundColor(col.grey)i:SetHoverColor(col.grey)i:OnSelect(function(j,k,l)self:SetupAnimations(l.id)end)self.Animations=i end)self.ModelOffsets=e end)end)end)self:AddPanel('srp_panel_rounded',function(e)e:Dock(FILL)e:DockMargin(10,10,10,10)e:AddPanel('srp_textinput',function(e)e:DockMargin(5,5,5,5)e:Dock(TOP)e:OnValid(function(n)timer.Create('srp.cosmetics.adjuster',0.2,1,function()if IsValid(self)then local o=(n:GetValue()||''):lower()self:Search(o)end end)end)end)e:AddPanel('ui_scrollpanel',function(p)p:Dock(FILL)p:SetSpacing(8,8)srp.ui.Create('srp_grid',function(q)q:Dock(TOP)q:SetAutoHeight(true)p:AddItem(q)self.Grid=q end)end)end)self:Populate()self:SetID(cosmetics.APPAREL)end;function a:SetupAnimations(k)if!IsValid(self.Player)then return end;local r=self.Player;local s=self.Player:SequenceDuration(k)r.AutomaticFrameAdvance=true;r:SetSequence(k)r:ResetSequence(k)r:SetCycle(0)if k==0 then timer.Remove(b)elseif s>0 then timer.Create(b,s+0.2,0,function()if IsValid(self)then self:SetupAnimations(k)end end)end end;function a:SetupAttachment()local t=self.Player:LookupAttachment(self.AttachmentId)self.Apparel:SetParent(nil)self.Apparel:SetParent(self.Player,t)self.Apparel:RemoveEffects(EF_BONEMERGE)self.Player:SetupBones()self:Reset()end;function a:SetModel(f)self.Player:SetModel(f)self.Player:SetupBones()self.Attachment:Clear()self.Attachment:AddOption('NONE',{attachment=0})for u,v in pairs(self.Player:GetAttachments())do self.Attachment:AddOption(v.name,{attachment=v.name})end;self.Animations:Clear()for k,w in ipairs(self.Player:GetSequenceList())do if!(w:find('aimlayer')||w:find('proportions'))then self.Animations:AddOption(w,{id=k,animationName=w})end end;self:Reset()end;function a:Populate()local x={}local y={}for u,z in pairs(srp.groups.GetAll(true))do for u,A in pairs(z:GetRanks())do local B=A:GetModel(LocalPlayer())if!B||x[B]then continue end;if A:HasPermission'jedi'then table.insert(y,A)x[B]=true end end;for u,A in pairs(z:GetClasses())do local B=A:GetModel(LocalPlayer())if!B||x[B]then continue end;if A:HasPermission'jedi'then table.insert(y,A)x[B]=true end end end;local C=LocalPlayer():GetModel()for D,A in SortedPairsByMemberValue(y,'name')do local B=A:GetModel(LocalPlayer())if!B then continue end;self.PreviewModel:AddOption(A:GetName(),{model=A:GetModel(LocalPlayer())},{},D==1||B==C)end;self:AddOption('Scale',1,.2,5)self:AddOption('X',0,-250,250)self:AddOption('Y',0,-250,250)self:AddOption('Z',0,-250,250)self:AddOption('Pitch',0,-180,180)self:AddOption('Yaw',0,-180,180)self:AddOption('Roll',0,-180,180)end;function a:SetID(k)local E=cosmetics.GetTypeTable(k)if!E then return end;local F=ScrW()*.2-75;for u,G in ipairs(c)do local H=E[G]if!H||table.Count(H)==0 then continue end;srp.ui.Create('srp_label',function(h)h:SetBackgroundColor(col.black)h:SetSize(F,50)h:SetText(G)h:SetContentAlignment(5)h:SetFont'ui_header.r'self.Grid:AddItem(h)end)for u,I in SortedPairsByMemberValue(H,'prettyname')do srp.ui.Create('srp_button_tag',function(m)m.item=I;m:DockMargin(0,0,0,0)m:SetSize(F,40)m:SetMaterial(I:GetIcon())m:SetText(I:GetName())m:SetMaterialBackground(col.grey_light)m:LeftClick(function(j)self:OnSelected(j.item)end)table.insert(self.Items,m)self.Grid:AddItem(m)end)end end;self.cosmeticid=k;return self end;function a:Search(J)for u,e in ipairs(self.Items)do if J==''||string.find(e.item.prettyname:lower(),J)then e:SetVisible(true)else e:SetVisible(false)end end end;function a:AddOption(K,L,M,N,O)self.ModelOffsets:AddPanel('srp_label',function(h)h:Dock(TOP)h:SetTall(50)h:DockPadding(150,0,0,0)h:SetText(K)srp.ui.Create('srp_slider',function(P)P:SetParent(h)P:Dock(FILL)P:DockMargin(0,4,0,4)P:SetLiveUpdate(true)P.DefaultValue=L;P:SetValue(L,M,N)P:SetInterval(4)P:OnValueChanged(function(j,Q,R)self:OnValueUpdated(K,Q,R)end)self.Options[K]=P end)end)self.ModelOffsets:SetTall(table.Count(self.Options)*55+35)end;function a:Reset()for K,e in pairs(self.Options)do e:SetValue(e.DefaultValue)self:OnValueUpdated(K,e.DefaultValue,e.Percent)end;if IsValid(self.Apparel)then self.Player:DrawModel()self.Apparel:DrawModel()self.Apparel:InvalidateBoneCache()end end;function a:OnValueUpdated(K,Q,R)self.Settings[K]={value=Q,percent=R}self:UpdateVisuals()end;function a:UpdateVisuals()if!IsValid(self.Apparel)then return end;local P=math.Clamp(self.Settings.Scale&&self.Settings.Scale.value||0,0.2,5)local S=math.Clamp(self.Settings.X&&self.Settings.X.value||0,-250,250)local T=math.Clamp(self.Settings.Y&&self.Settings.Y.value||0,-250,250)local U=math.Clamp(self.Settings.Z&&self.Settings.Z.value||0,-250,250)local V=math.Clamp(self.Settings.Pitch&&self.Settings.Pitch.value||0,-180,180)local W=math.Clamp(self.Settings.Yaw&&self.Settings.Yaw.value||0,-180,180)local X=math.Clamp(self.Settings.Roll&&self.Settings.Roll.value||0,-180,180)self.Apparel:SetLocalPos(Vector(S,T,U))self.Apparel:SetLocalAngles(Angle(V,W,X))self.Apparel:SetModelScale(P)self.Apparel:ManipulateBoneScale(0,Vector(P,P,P))end;function a:OnSelected(I)if IsValid(self.Apparel)then self.Apparel:Remove()end;self.Item=I;self.PreviewName:SetText(I:GetName())self.PreviewImage:SetMaterial(I:GetIcon())self.Save:SetVisible(true)self.Load:SetVisible(true)self.ModelSelect:SetVisible(true)self.ModelOffsets:SetVisible(true)local r=self.Model:AddModel(I:GetModel(LocalPlayer()))if I:GetMaterial()then r:SetMaterial(I:GetMaterial())end;r:SetParent(self.Player)r:SetLocalPos(Vector())r:SetLocalAngles(Angle())r:Spawn()r:SetupBones()self.Apparel=r;return true end;function a:GetData()local Y=self.Apparel:GetLocalPos()local Z=self.Apparel:GetLocalAngles()local _,a0,a1=Y.x,Y.y,Y.z;local a2,a3,a4=Z.p,Z.y,Z.r;return{time=os.time(),steamid=LocalPlayer():SteamID(),itemid=self.Item.name,model=self.Player:GetModel(),attachment=self.AttachmentId,X=_,Y=a0,Z=a1,Pitch=a2,Yaw=a3,Roll=a4,Scale=self.Apparel:GetModelScale()}end;function a:DoLua()if!IsValid(self.Player)||!IsValid(self.Apparel)then return end;local l=self:GetData()local a5=string.GetFileFromFilename(l.model):Replace('.mdl','')..'.dat'local a6=Format([[
/********************
	%s
	Model:	%s
	Item:	%s
	Player:	%s (%s)
*/

[%q] = {
	Attachment = %q,
	Model = %q,
	Scale = %f,
	Position = Vector(%f, %f, %f),
	Angle = Angle(%f, %f, %f),
	SteamID = %q
},
]],os.date(),l.model,l.itemid,LocalPlayer():Nick(),LocalPlayer():SteamID(),l.model,self.AttachmentId,l.model,l.Scale,l.X,l.Y,l.Z,l.Pitch,l.Yaw,l.Roll,l.steamid)SetClipboardText(a6)end;function a:DoSave()if!IsValid(self.Player)||!IsValid(self.Apparel)then return end;local l=self:GetData()local a7=util.TableToJSON(l,true)local K=string.GetFileFromFilename(l.model):Replace('.mdl','')..'.dat'file.Write(cosmetics.basePath..K,util.Compress(a7))SetClipboardText(a7)srp.notif.Success(5,K..' was saved!')end;function a:DoLoad()if!IsValid(self.Player)||!IsValid(self.Apparel)then return end;local a8=self.Player:GetModel()local K=string.GetFileFromFilename(a8):Replace('.mdl','')..'.dat'local a9=self.Item.name;local aa=file.Read(cosmetics.basePath..K,'DATA')if!aa then srp.notif.Warning(5,'Corrupt or empty file!')return end;local l=util.JSONToTable(util.Decompress(aa))if!l||!l.itemid||l.itemid!=a9||l.model!=a8 then srp.notif.Warning(5,'Invalid file contents!')return end;if l.attachment then self.Attachment:Select(l.attachment)end;for k,Q in pairs(l)do local e=self.Options[k]if!IsValid(e)then continue end;e:SetValue(Q)self:OnValueUpdated(k,Q,e.Percent)end;srp.notif.Success(5,K..' was loaded!')end;vgui.Register('srp_cosmeticadjuster',a,'srp_window')concommand.Add('srp_adjuster',function()srp.ui.Create('srp_cosmeticadjuster')end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/init_sh.lua:
srp.shop=srp.shop||{}srp.shop.Stored=srp.shop.Stored||{}srp.shop.Weapons=srp.shop.Weapons||{}srp.shop.Mapping=srp.shop.Mapping||{}local a={}a.__index=a;local b=1;function srp.shop.Add(c,d)local e={Name=c,UID=d:lower(),ID=b,Stackable=true,StoreCooldowns={}}setmetatable(e,a)srp.shop.Stored[e.ID]=e;srp.shop.Mapping[e.UID]=e;b=b+1;return e end;function srp.shop.Get(f)return srp.shop.Stored[f]end;function srp.shop.GetByUID(d)return srp.shop.Mapping[d]end;function srp.shop.GetTable()return srp.shop.Stored end;function a:SetLinked(f)self.Linked=f;return self end;function a:GetLinked()return self.Linked end;function a:SetCooldown(g)self.cooldown=g;return self end;function a:SetPlayerCooldown(h)self.StoreCooldowns[h:SteamID()]=CurTime()+self.cooldown end;function a:HasCooldown(h)if!self.cooldown then return false else local i=h:SteamID()return self.StoreCooldowns[i]&&self.StoreCooldowns[i]>CurTime()end end;function a:GetCooldown()return self.cooldown end;function a:SetStackable(j)self.Stackable=j;return self end;function a:SetCat(k)self.Cat=k;if CLIENT then local l=srp.shop.GetCategory(k)if!l then srp.shop.AddCategory(k)end end;return self end;function a:SetDesc(m)self.Desc=m;return self end;function a:SetIcon(n)self.Icon=n;return self end;function a:SetImage(o,p)self.ImageMaterial=o;return self end;function a:SetDisplayInit(q)self.DisplayInit=q;return self end;function a:DisplayInit(r)end;function a:SetDisplayPainter(q)self.PaintDisplay=q;return self end;function a:PaintDisplay(r,s,t)end;function a:SetBackgroundColor(u)self.BackgroundColor=u;return self end;function a:SetImageColor(u)self.ImageColor=u;return self end;function a:SetPrice(v)self.Price=v;return self end;function a:SetGetPrice(q)self._GetPrice=q;return self end;function a:SetCanBuy(q)self._CanBuy=q;return self end;function a:SetCanSee(q)self._CanSee=q;return self end;function a:SetOnBuy(q)self._OnBuy=q;return self end;function a:SetGetCustomPurchaseNote(q)self._GetCustomPurchaseNote=q;return self end;function a:SetMinimumLTV(w,x)self._MinimumLTV=w;self._IsSpecial=x;if x then self:SetCat('Special')end;return self end;function a:GetMinimumLTV()return self._MinimumLTV||0 end;function a:GetIsSpecial()return self._IsSpecial end;function a:SetWeapon(y)srp.shop.Weapons[self:GetUID()]=y;self.Weapon=y;self:SetDesc('You will always spawn with a '..self:GetName()..'.')self:SetStackable(false)self:SetOnBuy(function(self,h)local z=h:GetVar('PermaWeapons')z[#z+1]=y;h:SetVar('PermaWeapons',z)end)return self end;function a:AddHook(c,q)local d=self:GetUID()hook(c,'srp.upgrade.'..d,function(h,...)if h:HasUpgrade(d)then q(h,...)end end)return self end;function a:SetNetworked(A,B)self.Networked=A;local A=nw.Register('Upgrade_'..self:GetUID()):Write(net.WriteInt,32):Read(net.ReadInt,32)if B then A:SetPlayer()else A:SetLocalPlayer()end;return self end;function a:SetTimeStamps(C,D)self.TimeStamps={C,os.time()+999999}return self end;function a:SetHidden(E)self.Hidden=E;return self end;function a:GetName()return self.Name end;function a:GetCat()return self.Cat end;function a:GetDesc()return self.Desc end;function a:GetIcon()return self.Icon end;function a:GetImage()return self.ImageMaterial end;function a:GetBackgroundColor()return self.BackgroundColor end;function a:GetImageColor(u)return self.ImageColor end;function a:GetUID()return self.UID end;function a:GetID()return self.ID end;function a:GetWeapon()return self.Weapon end;function a:GetPrice(h)if self._GetPrice then return self:_GetPrice(h)end;return self.Price end;function a:IsStackable()return self.Stackable==true end;function a:IsNetworked()return self.Networked==true end;function a:IsHidden()return self.Hidden==true end;function a:IsInTimeLimit()if self.TimeStamps then local F=os.time()return F>=self.TimeStamps[1]&&F<=self.TimeStamps[2]end;return true end;function a:CanSee(h)if self:IsHidden()||!self:IsInTimeLimit()then return false end;if(h:GetVar('LTV')||0)<self:GetMinimumLTV()&&!h:IsRoot()then return false end;if self._CanSee&&!self:_CanSee(h)then return false end;return true end;function a:CanBuy(h,G)local H,I=true,nil;if self._CanBuy then H,I=self:_CanBuy(h,G)end;if self:HasCooldown(h)then return false,'Cooldown'elseif!self:CanSee(h)then return false,'How can you even see this?'elseif!H then return H,I elseif!self:IsStackable()&&h:HasUpgrade(self:GetUID())then return false,'You have already purchased this upgrade!'elseif!h:CanAffordCredits(G||self:GetPrice(h))then return false,'You cannot afford this upgrade!'end;return true end;function a:OnBuy(h)if self:GetCooldown()!=nil then self:SetPlayerCooldown(h)end;if self._OnBuy then self:_OnBuy(h)end;if self:IsNetworked()then h:SetNetVar('Upgrade_'..self:GetUID(),h:GetUpgradeCount(self:GetUID()))end;if self:GetWeapon()!=nil then h:Give(self:GetWeapon())end end;function a:GetCustomPurchaseNote(h)if self._GetCustomPurchaseNote then return' '..self:_GetCustomPurchaseNote(h)end;return''end;nw.Register'Credits':Write(net.WriteInt,32):Read(net.ReadInt,32):SetLocalPlayer():SetHook('OnCreditsChanged')function PLAYER:IsVIPPlus()return self:HasUpgrade('vip_plus')||self:IsDA()end;function PLAYER:GetCredits()return self:GetNetVar('Credits')||0 end;function PLAYER:CanAffordCredits(J)if SERVER&&!self:CharacterID()then return false end;return self:GetCredits()>=J end;if CLIENT then function PLAYER:HasUpgrade(d)return self:GetNetVar('Upgrade_'..d)!=nil end;function PLAYER:GetUpgradeCount(d)return self:GetNetVar('Upgrade_'..d)||0 end end;srp.AddClientCommand('store',function()srp.menu.Open('Store',true)end):SetInfoSection('Store'):SetInfo('Opens the store')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/ui/item_ui.lua:
local a={}local b=Color(54,57,62)local c=col.midnight_dark;local d=Color(160,160,160,160)local e=Color(124,218,92,222)local f=Color(218,162,92,222)local g=Color(222,222,222,222)local h=Color(112,200,247,222)local i=Color(247,112,112,222)local j=Material('materials/galactic/ui/menu/purchased.png','smooth noclamp nomips')local k=Material('materials/galactic/ui/menu/canbuy.png','smooth noclamp nomips')local l=Material('materials/galactic/ui/menu/usd.png','smooth noclamp nomips')local m=Material('materials/galactic/ui/menu/info.png','smooth noclamp nomips')local n={'WEAPON SKINS','XP BOOSTS','UNIQUE COSMETICS','SILVER MEDAL','CUSTOM ANIMATIONS'}function a:Init()self:SetText''self:SetBackgroundColor(b)self:SetHoverColor(d)self:DockPadding(0,10,0,10)self:SetSize(330,350)self:AddPanel('srp_panel_rounded',function(o)o:Dock(TOP)o:SetTall(50)o:DockPadding(0,0,0,0)o:SetBackgroundColor(c)o:AddPanel('srp_label',function(p)p:Dock(FILL)p:SetFont'ui_header.r'p:SetText''p:SetTextColor(col.white)p:SetContentAlignment(4)self.name=p end)o.Paint=function(q,r,s)draw.RoundedBox(6,0,0,r,s,c)draw.Box(0,0,r,2,c)draw.RoundedBox(6,0,0,4,s,q.m_bgColor)end;self.header=o end)self:AddPanel('srp_panel',function(o)o:Dock(FILL)o:SetBackgroundColor(col.transparent)o:DockPadding(15,15,15,15)o:DockMargin(15,15,15,15)self.container=o end)self:AddPanel('srp_panel',function(o)o:SetBackgroundColor(col.transparent)o:DockPadding(5,5,5,5)o:DockMargin(0,0,0,0)o:Dock(BOTTOM)o:SetTall(45)o:AddPanel('srp_button',function(t)t:Dock(LEFT)t:SetWide(20)t:DockMargin(0,0,0,0)t:SetBackgroundColor(col.transparent)t:SetHoverColor(col.transparent)t:SetBorderColor(col.transparent)t:SetDisabledColor(col.transparent)t:SetFont'SSRPForkAwesome't:SetText(0xf021,true)t:SetTextColor(col.white_dark)t:SetVisible(false)t:LeftClick(function(q)q:SetDisabled(true,5)self:RequestRefresh()end)self.Refresh=t end)o:AddPanel('srp_button',function(t)t:Dock(RIGHT)t:SetWide(20)t:DockMargin(5,0,0,0)t:SetBackgroundColor(col.transparent)t:SetHoverColor(col.transparent)t:SetBorderColor(col.transparent)t:SetDisabledColor(col.transparent)t:SetFont'SSRPForkAwesome't:SetText(0xf07a,true)t.Think=function(q)if q.Confirmed&&q.ResetConfirm<=CurTime()then q.Confirmed=nil;self:UpdateStatus()end end;t.PaintOver=function(q,r,s)if self.Cooldown then DisableClipping(true)local u=(self.CooldownEnd||0)-CurTime()local v=math.max(u/self.CooldownTime,0)draw.NoTexture()surface.SetDrawColor(255,120,120,150)surface.DrawArc(r*0.5,s*0.5-1,s*.25,s*.3,0,360*v,60)DisableClipping(false)end end;t:LeftClick(function(q)local w=self.SalePrice||self.Upgrade:GetPrice(LocalPlayer())if!LocalPlayer():CanAffordCredits(w)then ui.BoolRequest('Cannot afford','You need more credits to buy this. Would you like to buy credits?',function(x)if x==true then ba.ui.OpenAuthLink('/'..info.WebID..'/credits/'..w)end end)return end;if!q.Confirmed then q.ResetConfirm=CurTime()+2;q:SetText(0xf00c,true)q:SetTextColor(col.orange)self.ItemPriceText:SetText('CLICK AGAIN TO CONFIRM!')q.Confirmed=true;return end;q.Confirmed=nil;q:SetText(0xf110,true)q:SetDisabled(true)self.ItemPriceText:SetText('PROCESSING')cmd.Run('buyupgrade',tostring(self.Upgrade:GetID()),self.TokenCell)end)self.ItemInteract=t end)o:AddPanel('srp_label',function(p)p:Dock(TOP)p:SetFont'ui_label.rb'p:SetText'N/A'p:SetTextColor(col.white_dark)p:SetContentAlignment(6)p:DockMargin(4,0,0,0)self.ItemPrice=p end)o:AddPanel('srp_label',function(p)p:Dock(BOTTOM)p:SetFont'ui_label.rb'p:SetText'Credits'p:SetTextColor(col.white_dark)p:SetContentAlignment(6)p:DockMargin(4,0,0,0)self.ItemPriceText=p end)self.PricePanel=o end)end;function a:RequestRefresh()net.Start'srp.shop.SyncSingle'net.WriteUInt(self.Upgrade.ID,9)net.SendToServer()end;function a:SetPurchased()self.ItemPriceText:SetText'PURCHASED'end;function a:FormatDisplayBox(y,z,A,B)self:AddPanel('srp_modelpanel',function(C)C:SetCamPos(Vector(120,80,32))C:SetLookAt(Vector(0,80,32))C:SetMouseInputEnabled(false)C.PreDrawModel=function(q,D)q:RunAnimation(D)if D.StartPos&&D:GetPos().z<-150 then D:SetPos(D.StartPos+Vector(0,math.random(-25,25),0))D:SetAngles(Angle(math.random(-180,180),math.random(-180,180),math.random(-180,180)))D:PhysWake()end end;local E=0;local F=y||n;local G=1;local H=0;local I=col.white:Copy()I.a=0;local J=B||0.5;C.Paint=function(q,r,s)q:DrawScene(r,s)H=math.Approach(H,G<0&&0||500,120*RealFrameTime())G=H==0&&1||H==500&&-1||G;if H==0 then E=(E+1)%#F end;I.a=math.Min(H,255)local K=F[E+1]local L,M=surface.GetTextSize(K)draw.DrawText(F[E+1],'ui_header.lbo',r/2,s*J-20,I,TEXT_ALIGN_CENTER)end;self:MoveToBack()self.model=C end)end;function a:SetUpgrade(N,O)self.Parent=O;self.Upgrade=N;self.Cat=N:GetCat()self.LTV=N:GetMinimumLTV()local P=N:GetName()local Q,R=P:find('| ')if R then P=string.sub(P,R)end;self.name:SetText(P:MaxCharacters(30,false))self.name:SetTextColor(N:GetImageColor()||col.white)if N:GetBackgroundColor()then self.header:SetBackgroundColor(N:GetBackgroundColor())end;if IsValid(self.image)then self.image:Remove()end;if N:GetIcon()then elseif N:GetImage()then self.header:AddPanel('DImage',function(S)S:Dock(LEFT)S:SetWide(44)S:DockPadding(0,0,0,0)S:DockMargin(5,5,5,5)S:SetMaterial(N:GetImage(),true)self.image=S end)end;N:DisplayInit(self)local T=srp.shop.GetCategory(N:GetCat())T.Display(N,self,self.container)self:UpdateStatus()end;function a:UpdateStatus()self.BorderColor=g;self.ItemPrice:SetTextColor(col.white_dark)self.ItemPrice:SetText(string.Comma(self.Price))self.ItemPriceText:SetTextColor(col.white_dark)self.ItemInteract:SetTextColor(col.white_dark)self.ItemInteract:SetDisabled(true)self.Refresh:SetVisible(false)local w=self.SalePrice||self.Price;local U=self.CanBuyReason&&(self.CanBuyReason:StartWith('You\'re already')||self.CanBuyReason:StartWith('You own'))if self.SalePrice then self.ItemPrice:SetText(string.Comma(self.SalePrice)..' (SALE!)')if self.CanBuyReason&&self.CanBuyReason:StartWith('You cannot afford')&&LocalPlayer():CanAffordCredits(w)then self.CanBuyReason=nil end end;if(U||self.HasPurchased)&&!self.Upgrade:IsStackable()then self.ItemPriceText:SetText'PURCHASED'self.ItemInteract:SetText(0xf00c,true)self.ItemPrice:SetTextColor(h)self.ItemInteract:SetTextColor(h)else if self.CanBuyReason then self.ItemPriceText:SetText(self.CanBuyReason:upper())self.ItemPriceText:SetTextColor(i)self.ItemPrice:SetTextColor(i)self.ItemInteract:SetTextColor(i)self.ItemInteract:SetText(0xf12a,true)self.Refresh:SetVisible(!self.Cooldown)elseif LocalPlayer():CanAffordCredits(w)then self.CanPurchase=true;self.ItemPriceText:SetText'PURCHASE'self.ItemPrice:SetTextColor(e)self.ItemInteract:SetTextColor(e)self.ItemInteract:SetDisabled(false)self.ItemInteract:SetText(0xf07a,true)end end end;function a:PerformLayout(r,s)if IsValid(self.model)then self.model:SetSize(r,s)self.model:SetPos(0,0)end end;function a:Paint(r,s)draw.RoundedBox(6,0,10,r,s-20,selected&&self.m_bghColor||self.m_bgColor)if self.Upgrade then self.Upgrade:PaintDisplay(self,r,s)end end;function a:PaintOver(r,s)end;vgui.Register('srp_creditshop_item',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/defcon/ui/defcon_ui.lua:
local a={}local b=Material('materials/galactic/ui/warning.png','smooth noclamp nomips')local c=col.midnight:Copy()c.a=222;local d=col.midnight_dark:Copy()c.a=222;function a:Init()self:SetAlpha(0)self:AlphaTo(255,1.5,0)self:DockPadding(4,4,4,4)self:SetBackgroundColor(c)self:SetBorderColor(d)self.AlertColour=c;self.AlertColour2=c;self:AddPanel('DImage',function(e)e:Dock(LEFT)e:SetWide(44)e:SetMaterial(b)e:DockMargin(0,0,0,0)self.img=e end)self:AddPanel('srp_label',function(f)f:Dock(LEFT)f:SetFont('ui_label.rb')f:SetText('Con 6')f:SetTextColor(col.white)f:SetContentAlignment(4)f:SetWide(80)f:DockMargin(4,0,0,0)self.defcon=f end)self:AddPanel('srp_label',function(g)g:Dock(FILL)g:SetText('Yeah...')g:SetTextColor(col.white)g:SetFont('ui_label.b')g:SetContentAlignment(4)g:DockMargin(0,0,0,0)g:SetWrap(true)self.desc=g end)end;function a:SetDefcon(h,i)if!srp.defcon.data[h]then return end;self:AlphaTo(100,.2,0,function(j)self.id=h;self.data=srp.defcon.data[h]self.AlertColour=(self.data.col||d):Copy()self.AlertColour.a=50;self.AlertColour2=self.AlertColour:Copy()self.AlertColour2.a=100;i=i||self.data.sub||'I forgot to put something here...'self.desc:SetText(i)self.defcon:SetText((srp.defcon.name||'')..(self.data.name||h||'6'):upper())self:AlphaTo(255,.5,0)if#srp.defcon.data==h||self.data.close then timer.Simple(5,function()if IsValid(self)&&(self.id==#srp.defcon.data||self.data.close)then self:AlphaTo(0,1,0,function()self:Remove()end)end end)end end)end;function a:Paint(k,l)derma.SkinHook('Paint','RoundedPanel',self,k,l)draw.NoTexture()surface.SetDrawColor(self.AlertColour2)surface.DrawRect(0,0,k,l)if math.sin(CurTime()*2)<0 then surface.SetDrawColor(0,0,0,255)else surface.SetDrawColor(self.AlertColour)end;surface.DrawOutlinedRect(1,1,k-2,l-2,1)surface.SetDrawColor(0,0,0,255)surface.DrawOutlinedRect(0,0,k,l,1)surface.SetDrawColor(self.AlertColour)surface.DrawArc(0,l/2,0,112,0,360,361)end;vgui.Register('srp_defcon',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/eventrewards/eventrewards_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/eventrewards/eventrewards_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/eventrewards/ui/eventreward_overview_ui.lua:
local a={}local b=Color(174,70,70)function a:Init()self:DockPadding(10,10,10,10)self:DockMargin(10,10,10,10)self:SetBackgroundColor(col.transparent)self:AddPanel('srp_eventreward_level',function(c)c:Dock(TOP)c:SetTall(200)self.Level=c end)self:AddPanel('srp_eventreward_info',function(c)c:Dock(TOP)c:Populate('NEW!!',[[
There is a 5x multiplier on Server 1 event points!

Rewards now last twice as long. Every other month they will reset!
		]],b)end)self:AddPanel('srp_eventreward_info',function(c)c:Dock(TOP)c:Populate('Event Points',[[
Complete events to gain points and unlock rewards. Points earned are different for each event. Some events give 0 points.

Yellow rewards cannot be repeated.
Points are reset at the start of each even month. (Feb, April etc)
		]])end)end;function a:Populate(d,e)self.Points=d;self.MaxPoints=e;self.MaxTotalPoints=#srp.gmrewards.Rewards;self.Level:Populate(self.Points,self.MaxPoints,self.MaxTotalPoints)end;vgui.Register('srp_eventreward_overview',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/eventrewards/ui/eventrewards_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/events_cl.lua:
srp.events=srp.events||{}function srp.events.ShowLeaderboards(a)if IsValid(srp.events.fragboard)then srp.events.fragboard:Remove()end;srp.ui.Create('srp_fragboard',function(b)b:Populate(a)srp.events.fragboard=b end)end;function srp.events.StartNotificationTerm(c,d)srp.ui.Create('srp_tip',function(b)b:SetInfo(c,d)end)end;function srp.events.StartTitle(c,e)if IsValid(srp.events.TitleUI)&&!srp.events.TitleUI.Removing then srp.events.TitleUI:Populate(c,nil,e)return end;srp.ui.Create('srp_eventtitle',function(b)b:Populate(c,nil,e)srp.events.TitleUI=b end)end;net('srp.events.PlayerRemoved',function()local f=net.ReadPlayer()local g=net.ReadBool()local h=srp.events.Get(srp.events.active)if f==LocalPlayer()&&h then h:RemoveClientHooks()end;hook.Run('OnAutoEventPlayerRemoved',f,g)end)net('srp.events.Start',function()local h=srp.events.Get(net.ReadString())local a=net.ReadTable()if h then h:Start()h:LoadClientHooks()if h.IsLeaderboard then srp.events.ShowLeaderboards(a)end end end)net('srp.events.End',function()local h=srp.events.Get(srp.events.active)if h then h:End(net.ReadUInt(4),h:ReadEndData())h:RemoveClientHooks()if IsValid(srp.events.fragboard)then srp.events.fragboard:Remove()end end end)net('srp.events.NotificationTerms',function()local i,d=net.ReadString(),net.ReadTerm()local h=srp.events.Get(i)if h then srp.events.StartNotificationTerm(h.name,d)end end)net('srp.events.Notification',function()local c,j=net.ReadString(),net.ReadString()srp.events.StartNotificationTerm(c,j)end)net('srp.events.Title',function()local c=net.ReadString()local k=net.ReadBool()srp.events.StartTitle(c,k&&net.ReadString())end)net('srp.events.DeathCounter',function()local l=net.ReadUInt(8)local m=net.ReadBool()local n=l..' PLAYERS REMAIN'local d=m&&net.ReadString():upper()..' DIED'||nil;srp.ui.Create('srp_levelplate',function(b)b:Populate(n,d,4)end)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/ui/fragboard_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/ui/fragboard_ui.lua:
local a={}local b=col.midnight_light:Copy()b.a=100;function a:Init()self:SetSize(220,50)self:SetPos(10,ScrH()*.1)self:DockPadding(5,5,5,5)self:SetBackgroundColor(b)self.Players={}self.PlayerPanels={}end;function a:Populate(c)self.Players=c;local d=table.Count(c)self:SizeTo(220,5+d*40+d*5,.2,0,-1)end;function a:UpdatePanel(e,f,g)if IsValid(self.PlayerPanels[e])then self.PlayerPanels[e]:SetIndex(f)self.PlayerPanels[e]:SetFrags(g)else self:AddPanel('srp_fragboard_line',function(h)h:SetSize(210,40)h:Populate(e,f)self.PlayerPanels[e]=h end)end end;function a:UpdateView()local c={}for i,e in ipairs(self.Players)do if IsValid(e)then c[#c+1]=e end end;table.sort(c,function(j,k)return j:Frags()>k:Frags()||j:Nick()>k:Nick()end)for l,e in ipairs(c)do self:UpdatePanel(e,l,e:Frags())end;self.Players=c end;function a:Think()if!self.NextThinking||self.NextThinking>CurTime()then self:UpdateView()self.NextThinking=CurTime()+1 end end;vgui.Register('srp_fragboard',a,'srp_panel_rounded')if IsValid(TESTPANEL)then TESTPANEL:Remove()end;concommand.AddDev('srp_fragtest',function(e)if IsValid(TESTPANEL)then TESTPANEL:Remove()end;srp.ui.Create('srp_fragboard',function(h)h:Populate(player.GetAll())TESTPANEL=h end)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/firingrange/firingrange_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/translate_sh.lua:
srp.gamemaster=srp.gamemaster||{}function srp.gamemaster.Translate(a,b)if!a then return''end;local c=os.date('!*t')local d=b&&(c.hour%2!=0&&-c.day||c.day)||(c.hour%2==0&&-c.day||c.day)local e=''local f=a:len()for g=1,f do local h=a[g]if b&&math.random()<.95 then e=e..h elseif h==' 'then e=e..' 'else e=e..string.char(math.Clamp(h:byte()+d,32,126))end end;return e end;srp.AddCommand('togglelanguage',function(i,j)if j:IsEventCharacter()||info.EventMode then j.language=!j.language end end):AddParam(cmd.PLAYER_ENTITY):AddAlias('toggletranslate'):AddAlias('togglereadable'):SetInfoSection('Gamemaster'):SetInfo('Toggles between normal typing and scrambled, translatable typing.'):SetInfoArgs({'Target - The SteamID/Name'}):SetGM()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/containers/ui/containers_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/domination/ui/domination_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/eventmode/stats_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/eventmode/ui/eventstats_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/schedules/ui/calendar_ui.lua:
local a={}local function b(c,d)return c==2&&is_leap_year(d)&&29||("\31\28\31\30\31\30\31\31\30\31\30\31"):byte(c)end;function a:Init()self:SetTitle'Calendar'self:SetBackgroundColor(col.midnight_dark)self:MakePopup()self:SetSize(800,600)self:Center()self:AddPanel('srp_panel',function(e)e:Dock(FILL)self.Container=e end)self.Events={}self:SelectMonth(1,2024)end;function a:SetEvents(f)self.Events=f end;function a:SelectMonth(g)self.Container:Clear()self.Container:AddPanel('srp_calendar_month',function(c)c:Dock(FILL)c:Populate(g,self.Events[g])end)end;vgui.Register('srp_calendar',a,'srp_window')local a={}function a:Init()self:SetBackgroundColor(col.midnight)self:AddPanel('srp_grid',function(h)h:Dock(FILL)self.Grid=h end)self.Events={}end;function a:Populate(c,d,i)self.Month=c;self.Events=i;c=math.Clamp(c,1,12)local j=b(c,d)local k=os.date'*t'end;vgui.Register('srp_calendar_month',a,'srp_panel_rounded')concommand.Add('srp_calendar',function()srp.ui.Create('srp_calendar')end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/ui/gamemaster_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/ui/gamemaster_ui.lua:
local a={}function a:Init()self:DockPadding(4,4,4,4)self:SetBackgroundColor(col.midnight)self.StatusButtons={}if LocalPlayer():IsRoot()then self:AddPanel('srp_label',function(b)b:SetText'Collectable Item'b:SetTextColor(col.white)b:Dock(TOP)end)self:AddPanel('srp_dropdown',function(c)c:SetFont'ui_header.s'c:SetTextColor(col.white_dark)c:Dock(TOP)for d,e in pairs(srp.collectables.GetAll(true))do c:AddOption(e.Name,{id=e.id},{font='ui_header.s'})end;c:OnSelect(function(f,g,h)RunConsoleCommand('srp_setcollectable',h.id)end)end)end;self:AddPanel('srp_label',function(b)b:SetText'Default NPC Weapon'b:SetTextColor(col.white)b:Dock(TOP)end)self:AddPanel('srp_dropdown',function(c)c:SetFont'ui_header.s'c:SetTextColor(col.white_dark)c:Dock(TOP)local i=GetConVar('gmod_npcweapon')&&GetConVar('gmod_npcweapon'):GetString()for d,j in SortedPairsByMemberValue(list.Get('NPCUsableWeapons'),'title')do c:AddOption(Format('%s',j.title,j.class),j,{font='ui_header.s'},i==j.class)end;c:OnSelect(function(f,g,h)RunConsoleCommand('gmod_npcweapon',h.class)end)end)self:AddPanel('srp_button_rounded',function(k)k:Dock(TOP)k:SetText'Open Pac3'k:DockMargin(4,5,4,5)k:LeftClick(function()srp.gamemaster.CloseMenu()pace.OpenEditor()end)end)self:AddPanel('srp_label',function(b)b:SetText'Toggles'b:SetTextColor(col.white)b:Dock(TOP)end)self:AddPanel('srp_grid',function(l)l:Dock(TOP)l:SetTall(150)l:DockMargin(4,5,4,5)for m,h in pairs(srp.gmt)do srp.ui.Create('srp_button_rounded',function(k)k:SetText(h.name)k:SetSize(100,40)k:SetBackgroundColor(h.status&&col.green||col.midnight_dark)k:SetHoverColor(h.status&&col.green_dark||col.midnight_light)k:LeftClick(function()cmd.Run('gmtoggle',m)end)self.StatusButtons[m]=k;l:AddItem(k)end)end end)hook('OnGMToggle',self,self.OnGamemasterTogglesUpdated)end;function a:OnGamemasterTogglesUpdated(m,n)if self.StatusButtons[m]then self.StatusButtons[m]:SetBackgroundColor(n&&col.green||col.midnight_dark)self.StatusButtons[m]:SetHoverColor(n&&col.green_dark||col.midnight_light)end end;function a:AddToggle(f,o,p)f:AddPanel('srp_panel',function(c)c:Dock(TOP)c:SetTall(40)c:DockMargin(4,0,4,4)c:DockPadding(0,0,0,0)c:AddPanel('srp_label',function(b)b:Dock(FILL)b:DockMargin(0,0,0,0)b:SetText(o)end)end)f:SetTall(f:GetTall()+50)end;vgui.Register('srp_gmsettings',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/ui/gmmodels_ui.lua:
local a={}local b=Color(0,0,0,120)local c=col.midnight_dark:Copy()local d=col.midnight:Copy()function a:Init()self.categories={}self:SetBackgroundColor(col.midnight)self:DockPadding(10,10,10,10)self:AddPanel('ui_scrollpanel',function(e)e:Dock(FILL)local f=self:CreateHeader('Models','Automatically populated Battalion and Allegiance models.\nYou can left click to set the model on yourself or right click to copy to clipboard.')e:AddItem(f)self.scroll=e end)self:AddAllegiances()self:AddSciFiModels()self:AddRegisteredModels()self:AddGroups()end;function a:AddCategory(g,h,i,j)srp.ui.Create('srp_panel',function(e)e:SetBackgroundColor(col.transparent)e:DockPadding(0,5,0,5)e:DockMargin(0,0,0,0)e:SetParent(self.scroll:GetCanvas())e:Dock(TOP)e:AddPanel('srp_panel_rounded',function(e)e:Dock(TOP)e:SetTall(35)e:DockMargin(4,0,4,0)e:DockPadding(5,0,0,0)e:SetBackgroundColor(col.midnight)e:SetBorderColor(col.transparent)e:AddPanel('srp_label',function(k)k:Dock(FILL)k:SetTextColor(col.white_dark)k:SetText(h)k:SetFont'ui_label.l'end)end)e:AddPanel('srp_grid',function(l)l:Dock(FILL)l:SetAutoHeight(true)l:SetSpacing(4,4)l.OnComplete=function(m,n)m:GetParent():SetTall(n+40)end;self.grid=l end)e.AddModel=function(m,mdl,h)srp.ui.Create('srp_button_rounded',function(e)e:SetSize(98,98)e:DockPadding(2,0,2,2)e:SetBackgroundColor(c)e:SetBorderColor(c)e:SetHoverColor(d)e:SetText''e:AddPanel('SpawnIcon',function(o)o:SetMouseInputEnabled(false)o:SetPos((98-64)/2,(98-64)/2+5)o:SetSize(64,64)o:SetModel(mdl)self.icon=o end)e:AddPanel('srp_label',function(k)local p=string.Explode('/',mdl,false)p=p[#p]:Replace('_',' '):Replace('.mdl','')local h=mdl!=h&&h||p;local q=h:Explode('(')[1]if q!='('then h=q end;k:SetText(h)k:SetFont'ui_label.r'k:SetSize(94,35)k:SetPos(2,2)k:SetTextColor(col.white_dark)k:SetContentAlignment(8)end)e:LeftClick(function()cmd.Run('setmodel',LocalPlayer():SteamID(),mdl)end)e:RightClick(function()local r=DermaMenu()r:AddOption('Copy Path',function()SetClipboardText(mdl||'')srp.notif.Neutral(3,'Saved model to clipboard.')end)local s=r:AddSubMenu('Set Player')local t=player.GetHumans()table.sort(t,function(u,v)return u:Nick()<v:Nick()end)for w,x in ipairs(t)do s:AddOption(x:Nick()..' ('..x:SteamID()..')',function()if IsValid(x)then cmd.Run('setmodel',x:SteamID(),mdl)end end)end;r:Open()end)self.grid:AddItem(e)end)end;j(e)self.categories[g]=e end)end;function a:AddModelList(g,h,y)local z={}self:AddCategory(g,h,col.grey_light,function(g)for A=1,#y do local mdl=y[mdl]if!z[mdl]then g:AddModel(mdl,mdl)z[mdl]=true end end end)end;function a:AddRegisteredModels()local y=srp.gamemaster.GetRegisteredModels()for g,B in pairs(y)do self:AddCategory(g,B.Name||g,B.Color||col.red_dark,function(g)for w,mdl in ipairs(B.Models)do if util.ValidModel(mdl)then g:AddModel(mdl,mdl)end end end)end end;local C='models/player/'function a:AddSciFiModels()local D=file.Find(C..'scifi_*.mdl','GAME')if!D||#D==0 then return end;self:AddCategory('scifi','Sifi Players',col.blue_dark,function(g)for w,E in ipairs(D)do local mdl=C..E;if util.ValidModel(mdl)then g:AddModel(mdl,mdl)end end end)end;function a:AddAllegiances()local F=srp.allegiance.GetAll()for w,G in pairs(F)do local H=G.presets;if!H then continue end;local z={}self:AddCategory(G.id,G:GetName(),G.color,function(g)local I={}for w,J in ipairs(H)do local mdl=J.model;if mdl&&!z[mdl]&&util.ValidModel(mdl)&&!J.upgrade then g:AddModel(mdl,J.name)z[mdl]=true end end end)end end;function a:AddGroups()local K=srp.groups.GetAll()for w,L in pairs(K)do if L:GetHidden()then continue end;local M=L:GetRanks(true)if!M then continue end;local N=L:GetClasses(true)self:AddCategory(L.id,L:GetName(),L.color,function(g)local z={}for w,O in ipairs(M)do local mdl=O:GetModel()if mdl&&!z[mdl]&&util.ValidModel(mdl)then g:AddModel(mdl,O:GetName())z[mdl]=true end end;if N then for w,P in ipairs(N)do if P:HasPermission'jedi'&&L.id!='JEDI'then continue end;local mdl=P:GetModel()if mdl&&!z[mdl]&&util.ValidModel(mdl)then g:AddModel(mdl,P:GetName())z[mdl]=true end end end end)end end;vgui.Register('srp_gmmodels',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gifts/gifts_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupcharacteroverv_ui.lua:
local a={}local b='https://superiorservers.co/ssrp/'..info.WebID..'/characters/'function a:Init()self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self:AddPanel('srp_panel',function(c)c:Dock(TOP)c:SetTall(30)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:SetBackgroundColor(col.transparent)c:AddPanel('srp_label',function(d)d:SetText'MISSING_NAME'd:SetFont'ui_button.l'd:Dock(FILL)d:DockMargin(5,0,5,0)self.name=d end)c:AddPanel('srp_button',function(e)e:SetFont'SSRPForkAwesome'e:SetText(0xf104,true)e:SetWide(35)e:Dock(LEFT)e:DockMargin(0,0,0,0)e:DockPadding(0,0,0,0)e:SetBackgroundColor(col.grey_dark)e:SetHoverColor(col.transparent)e:SetBorderColor(col.transparent)e:LeftClick(function(e)self.container:Remove()end)end)c:AddPanel('srp_button',function(e)e:Dock(RIGHT)e:SetWide(130)e:SetText'CHARACTERS'e:DockMargin(0,0,0,0)e:DockPadding(0,0,0,0)e.Paint=function(f,g,h)surface.SetDrawColor(0,0,0,200)surface.DrawRect(0,h-2,g,2)end;e:LeftClick(function(f)gui.OpenURL(b..self.steamid)end)end)c:AddPanel('srp_button',function(e)e:Dock(RIGHT)e:SetWide(60)e:SetText'STEAMID'e:DockMargin(0,0,0,0)e:DockPadding(0,0,0,0)e.Paint=function(f,g,h)surface.SetDrawColor(0,0,0,255)surface.DrawRect(0,h-2,g,2)end;e:LeftClick(function(f)SetClipboardText(self.steamid)srp.notif.Neutral(3,'Steamid copied to clipboard')end)end)c:AddPanel('srp_button',function(e)e:Dock(RIGHT)e:SetWide(60)e:SetText'NOTE'e:DockMargin(0,0,0,0)e:DockPadding(0,0,0,0)e.Paint=function(f,g,h)surface.SetDrawColor(20,20,100,255)surface.DrawRect(0,h-2,g,2)end;e:LeftClick(function()if self.group then srp.ui.Create('srp_groupnote',function(c)c:Center()c:Populate(self.group,self.character,self.note:GetText())end)end end)end)self.controller=c end)self:AddPanel('srp_panel',function(c)c:DockPadding(4,4,4,4)c:DockMargin(0,0,0,0)c:SetTall(100)c:Dock(TOP)c:AddPanel('srp_label',function(c)c:SetVisible(false)c:Dock(FILL)c:SetText'Player Note'c:SetContentAlignment(7)c:SetWrap(true)self.note=c end)c:AddPanel('srp_panel',function(c)c:Dock(RIGHT)c:SetWide(300)c:SetBackgroundColor(col.transparent)self.info=c end)self.overview=c end)hook('OnPlayerNoteLoaded',self,self.DisplayNote)end;function a:DisplayNote(i,j)if self.character&&self.character.characterid==i then self.note:SetVisible(true)self.note:SetText(j||'')end end;function a:Setup(k,l,m)self.container=k;self.group=l;self.character=m;local col=l:GetColor()local h,f,n=ColorToHSV(col)local o=HSVToColor(h,f,math.Max(n*.8,0))self.controller:SetBackgroundColor(col)self.overview:SetBackgroundColor(col)self.container:SetBackgroundColor(o)self.steamid=m.steamid;self.name:SetText(Format('CT %03i %s',m.characterid,m.name))if m.added then self:AddOverview(0xf067,m.added)end;if m.ridupdated then self:AddOverview(0xf005,m.ridupdated..' ('..(m.promoter||'')..')')end;if m.prevrid then local p=srp.granks.Get(m.prevrid)self:AddOverview(0xf006,p&&p:GetName()||'Unknown')end;local q=isnumber(m.lastseen)&&m.lastseen||string.ToTime(m.lastseen)||0;local r=os.time()-q;self:AddOverview(0xf06e,string.NiceTime(r)..' ago')self:DisplayControls()end;function a:AddOverview(s,t)self.info:AddPanel('srp_panel',function(c)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:SetTall(20)c:Dock(TOP)c:SetBackgroundColor(col.transparent)c:AddPanel('srp_label',function(d)d:Dock(FILL)d:SetContentAlignment(6)d:SetText(t)end)c:AddPanel('srp_label',function(d)d:Dock(RIGHT)d:SetWide(20)d:SetFont'SSRPForkAwesome'd:SetContentAlignment(5)d:SetText(s,true)end)end)end;function a:DisplayControls()local l=LocalPlayer():GetGroup()local p=LocalPlayer():GetGroupRank()local u=l&&l:IsConnected(self.group)&&p&&p:HasPermission('officer')if u&&self.character.note then self.note:SetText(self.character.note)end;self:AddPanel('srp_grouprank',function(c)c:Dock(FILL)c:Setup(self.container,self.group,self.character,false,u)end)if u then net.Start'srp.groups.SendNote'net.WriteUInt(self.character.characterid,32)net.WriteGroup(self.group)net.SendToServer()end end;function a:OnRemove()hook.Remove('OnPlayerNoteLoaded',self)end;function a:Paint(g,h)derma.SkinHook('Paint','GroupOverview',self,g,h)end;vgui.Register('srp_groupcharacteroverv',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupinvite_ui.lua:
local a={}function a:Init()self:SetTitle'Group Invites'self:SetSize(400,235)self:Center()self:MakePopup()self:SetBackgroundColor(col.grey_light)self:AddPanel('srp_dropdown',function(b)b:Dock(TOP)b:OnSelect(function(c,d,e)self.selectedCharacter=e.cid end)self.players=b end)self:AddPanel('srp_dropdown',function(b)b:Dock(TOP)b:OnSelect(function(c,d,f)self.selectedGroup=f;self:PopulateRanks()end)self.groups=b end)self:AddPanel('srp_dropdown',function(b)b:Dock(TOP)b:OnSelect(function(c,d,g)self.selectedRank=g end)self.ranks=b end)self:AddPanel('srp_button',function(h)h:Dock(TOP)h:SetText'INVITE'h:SetBackgroundColor(col.blue)h:LeftClick(function()if self.selectedRank then cmd.Run('ginviteid',self.selectedCharacter,self.selectedGroup.internal,self.selectedRank.internal)end end)end)end;function a:PopulatePlayers()self.players:Clear()local i=player.GetAll()table.sort(i,function(j,k)return j:Nick():lower()>k:Nick():lower()end)local l=LocalPlayer():GetAllegianceID()for m=1,#i do local n=i[m]if n==LocalPlayer()||n:GetGroup()then continue end;if l!=n:GetAllegianceID()then continue end;if IsValid(n)&&n:CharacterID()!=nil then self.players:AddOption(n:Nick()..' - '..n:SteamID(),{cid=n:CharacterID()},{},m==1)end end end;function a:PopulateGroups()local f=LocalPlayer():GetGroup()local o=f:GetChildren(true)||{}self.groups:Clear()self.groups:AddOption(f:GetName(),f,{},true)local p=f:GetParent()if p then self.groups:AddOption(p:GetName(),p)end;for q,r in pairs(o)do self.groups:AddOption(r:GetName(),r)end end;function a:PopulateRanks()if!self.selectedGroup then return end;self.ranks:Clear()local s=LocalPlayer():GetGroupRank()if!s then return end;local t=self.selectedGroup:GetRanks(true)||{}for m,g in pairs(t)do if s:HasPriority(g)then self.ranks:AddOption(Format('%s - %s',g.id,g:GetName()),g,{},g.id=='PVT')end end end;function a:Populate()self:PopulatePlayers()self:PopulateGroups()end;vgui.Register('srp_groupinvite',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupplate_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/hacking_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/hacking_sh.lua:
srp.hacking=srp.hacking||{}srp.hacking.CLOSING=0;srp.hacking.FAILED=1;srp.hacking.COMPLETED=2;local a={}local b={}local c={}local d={}srp.hacking.Injections={['UTILITY_HACKINGFALLOVER']=function(e,f,g)g.FailAttempts=(g.FailAttempts||0)+1 end,['UTILITY_HACKINGDELAY']=function(e,f,g)if g.Countdown then g.Countdown=g.Countdown+math.min(5,g.Countdown*.3)end end}function srp.hacking.RandPerc(h,i)return math.random(h,i)/100 end;function srp.hacking.RegisterGame(j,k)if!k.Init||!k.Start||!k.Stop then ErrorNoHalt'Missing minigame required functions.'return end;k.id=j;k.internal=table.insert(b,k)a[j]=k;if k.Active!=false then c[j]=k;table.insert(d,k)end end;function srp.hacking.Get(j)return table.Copy(a[j])end;function srp.hacking.GenerateGameList(l,m,n,o,p)l=istable(l)&&l||{l}local q=math.random(m,m)local r=o&&d||b;local s={}for t=1,q do s[t]={id=r[math.random(1,#r)].id,difficulty=l[math.random(1,#l)],upgrade=p}end;return s end;function srp.hacking.GetAll(u)return u&&c||a end;function srp.hacking.GenerateSettings(f,v,l)if!l||!v.Difficulties||!v.Difficulties[l]then l='normal'end;local w=v.Difficulties&&v.Difficulties[l]if!w then return end;local x={}for y,z in pairs(w.Settings)do if istable(z)then if z.gen then if z.args then x[y]=z.gen(z.args[1],z.args[2],z.args[3])else x[y]=z.gen()end elseif z.val then x[y]=z.val end elseif isfunction(z)then x[y]=z(v,f)else x[y]=z end end;x.mode=l;return x end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/z_typing_sh.lua:
local a={Name='Date Input',Active=false}local b='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'local c=#b;a.Difficulties={easy={Name='Easy',Color=col.green,Settings={Countdown=10,Letters=5}},normal={Name='Normal',Color=col.orange,Settings={Countdown=10,Letters=5}},hard={Name='Hard',Color=col.red,Settings={Countdown=10,Letters=5}},hardcore={Name='Hardcore',Color=col.purple,Settings={Countdown=10,Letters=5}}}function a:Init(d)self.Countdown=8;self.Letters=5 end;function a:GetInputs(e)local f={}for g=1,e do f[g]=b[math.random(1,c)]end;return f end;function a:GenerateSettings()return{Countdown=8,Letters=5,FailAttempts=2}end;function a:Start(h)self.X=h.X;self.W=h.W;self.Countdown=h.Countdown;self.Letters=h.Letters;self.Characters=self:GetInputs(h.Letters)self.StartTime=h.Start;self.EndTime=h.Start+self.Countdown;self.Settings=h||{}self.Cursor=1;return self.EndTime end;function a:Stop(i)self.Playing=false;if i==srp.hacking.COMPLETED then self:OnSuccess()else self:OnLost()end end;function a:OnFailedAttempt(j,k)end;function a:SetupDisplay(d)for g=1,self.Letters do srp.ui.Create('srp_panel',function(d)d:SetSize(80,120)d:Dock(LEFT)d:SetBackgroundColor(col.midnight)d:AddPanel('srp_label',function(l)l:Dock(TOP)l:SetFont'ui_header.l'l:SetText(self.Characters[g])end)d:AddPanel('srp_label',function(l)l:Dock(BOTTOM)l:SetFont'ui_header.l'l:SetText''end)end)end end;function a:WriteInput()net.WriteBool(self.Status)end;function a:ReadInput()return net.ReadBool()end;function a:IsValidInput(m,n)return n end;function a:OnSuccess()end;function a:OnLost()end;function a:KeyPressed(d,o)if o==KEY_SPACE then srp.hacking.RequestInput(self)end end;function a:KeyReleased(d,p)end;function a:Think(d)end;if info.Dev then srp.hacking.RegisterGame('datainput',a)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/ui/hackingtime_ui.lua:
local a={}sound.Add({name='hacking.timer',sound='galactic/ui/hacking/ticking.wav',loop=true})function a:Init()self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)end;function a:Populate(b,c)self.Countdown=c;self.EndTime=b+c;self.LastTime=c;self:StopLooping()self.LoopingID=LocalPlayer():StartLoopingSound('hacking.timer')end;function a:StopLooping()if self.LoopingID then local d=LocalPlayer()d:StopLoopingSound(self.LoopingID)end end;function a:OnRemove()self:StopLooping()end;function a:Paint(e,f)local g=self.EndTime-CurTime()local h=math.Round(g,1)local i=math.Clamp(g/self.Countdown,0,1)local j=HSVToColor(0,1*i,1)surface.SetDrawColor(180,180,180,200)surface.DrawRect(0,0,e,f)surface.SetDrawColor(200,200,200,200)surface.DrawRect(0,0,e*i,f)self.LastTime=h;draw.DrawText(h,'ui_header.rb',e/2,-3,j,TEXT_ALIGN_CENTER)end;vgui.Register('srp_hackingtime',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/fkeys_cl.lua:
local a=false;local b={['gm_showhelp']='F1',['gm_showteam']='F2',['gm_showspare1']='F3',['gm_showspare2']='F4',['jpeg']='F5'}function GM:PlayerBindPress(c,d,e)if d&&b[d]&&e then hook.Call(b[d],GAMEMODE)return true end end;local f,g=ScrW()/2,ScrH()/2;function srp.EnableMouse(h,i)a=h;if!a then f,g=gui.MousePos()end;if i then gui.SetMousePos(f,g)end;gui.EnableScreenClicker(h)end;function srp.IsMouseEnabled()return a end;function GM:F1()ba.OpenMoTD()end;function GM:F2()srp.inventory.Open()end;function GM:F3()srp.EnableMouse(!a,true)end;function GM:F4()srp.menu.Open(nil,nil,info.Dev)end;function GM:F5()if LocalPlayer():IsTrialGamemaster(true)||LocalPlayer():IsDA(true)then srp.gamemaster.OpenMenu(info.Dev)end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/nameplate_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/location/locations_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/marker/markers_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/notifications/ui/flashconfirm_ui.lua:
local a={}local b=Color(5,5,5,150)local c=Color(255,255,255,10)function a:Init()self.outline=true;self:SetDraggable(false)self:SetTitle'Flash Confirm'self:DockMargin(0,0,0,5)self:SetAlpha(0)self:SetHeaderColor(c)self:SetBackgroundColor(b)self:AddPanel('srp_label',function(d)d:SetWrap(true)d:Dock(FILL)d:SetContentAlignment(7)self.text=d end)self:AddPanel('srp_button_rounded',function(e)e:SetText'Confirm'e:SetFont'ui_label.s'e:SetSize(80,20)e:SetTextColor(col.white_dark)e:SetHoverColor(col.black)e:SetBackgroundColor(col.grey_dark)e:LeftClick(function(f)if self.OnConfirm then self:OnConfirm()end;self:Remove()end)self.confirm=e end)self:AlphaTo(255,.5)surface.PlaySound('garrysmod/content_downloaded.wav')end;function a:OnConfirm()end;function a:SetTimeout(g)self.end_time=CurTime()+g;self.duration=g;timer.Simple(g,function()if!IsValid(self)then return end;local h,i=self:GetPos()self:MoveTo(ScrW()+200,i,2)self:AlphaTo(0,1,0,function(j,f)if IsValid(f)then f:Remove()end end)end)end;function a:SetText(g)self.text:SetText(g)self:SetTall(75+self.text:GetTall())return self end;function a:SetButtonText(g)self.confirm:SetText(g)return self end;function a:SetButtonBackgroundColor(k)self.confirm:SetBackgroundColor(k)return self end;function a:SetButtonHighlightColor(k)self.confirm:SetBackgroundColor(k)return self end;function a:LeftClick(l)self.OnConfirm=l end;function a:PerformLayout(m,n)self.BaseClass.PerformLayout(self,m,n)if IsValid(self.confirm)then self.confirm:SetPos(m-85,n-25)end end;function a:Paint(m,n)derma.SkinHook('Paint','FlashConfirmationFrame',self,m,n)end;vgui.Register('srp_flashconfirm',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/scoreboard/init_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/scoreboard/init_sh.lua:
return lpakr()()
--gamemodes/srp_base/gamemode/modules/hud/weaponswitch/wepswitch_cl.lua:
srp.weaponswitcher = srp.weaponswitcher or {}

local color_white = col.white:Copy()
local color_flatblack = col.black:Copy()

local weaponBackground = Color(28, 28, 31)
local weaponBackgroundSelected = Color(71, 71, 80)

srp.hud = srp.hud or {}
srp.hud.showTime = 0
srp.hud.fadeTime = 0
srp.hud.WeaponsByOrder = {}
srp.hud.SelectedWeapon = -1
srp.hud.CanWeaponSwitch = true
srp.hud.WeaponDisplay = srp.hud.WeaponDisplay or {Weapons = {}}

local lastwep
local lastSnd = 0
local wepsCache = {}
local weaponsByCategory = {}

function srp.hud.EnsureWeapons(diff)
	local lp = LocalPlayer()
	local weps = lp:GetWeapons()

	if (#weps != #wepsCache) then
		diff = true
	else
		for k, v in pairs(weps) do
			if (!IsValid(v)) then diff = true break end

			if (wepsCache[k] != v) then
				diff = true
				break
			end
		end

		if (!diff) then
			for k, v in pairs(wepsCache) do
				if (!IsValid(v)) then diff = true break end

				if (weps[k] != v) then
					diff = true
					break
				end
			end
		end
	end

	if (diff) then
		wepsCache = weps
		srp.hud.WeaponDisplay = srp.weporganiser.Build(lp, wepsCache)
	end
end

local w, h = 200, 40
local weppadding = 4
local wepimgw, wepimgh = 150, 75
local wepbg = Color(0, 0, 0, 240)
local wepbgselc = Color(44, 44, 44, 240)

local wepborderbg = Color(25, 25, 25, 255)
local weptextcol = Color(200, 200, 200)
local weptextcolselc = Color(255, 255, 255)

local function switchWeapon(ent)
	if not ent and srp.hud.SelectedWeapon then
		ent = srp.hud.WeaponDisplay.Weapons[srp.hud.SelectedWeapon] and srp.hud.WeaponDisplay.Weapons[srp.hud.SelectedWeapon].Ent
	end

	if not IsValid(ent) then
		return
	end

	local active = LocalPlayer():GetActiveWeapon()
	if not IsValid(active) or active ~= ent then
		lastwep = IsValid(active) and active:GetClass() or nil
	    input.SelectWeapon(ent)
	else
		return
	end

	surface.PlaySound('buttons/lightswitch2.wav')
	return true
end

local function drawSelection(x, y, name, selected)
	if not IsValid(ent) then
		return
	end

	render.SetScissorRect(x, y, x+w, y+h, true)
		draw.RoundedBox(4, x, y, w, h, selected and weaponBackground or wepbg)
		draw.RoundedBox(6, x+w-9, y+1, 8, h-2, selected and weaponBackgroundSelected or wepborderbg)

		draw.SimpleText(name or '', 'ui_weapon.r', x+35, y+h/2, selected and weptextcolselc or weptextcol, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.SimpleText(1, 'ui_weapon.s', x+15,  y+h/2, selected and weptextcolselc or weptextcol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	render.SetScissorRect(0, 0, 0, 0, false)
end

function srp.weaponswitcher.IsVisible()
	return srp.hud.showTime + .25 > SysTime()
end

function GM:DrawClassicWeaponSwitch()
	local st = SysTime()
	local w, h = 170, 35
	local x, y = (ScrW() - #srp.hud.WeaponDisplay * (w + 3)) * 0.5, 5

	if srp.hud.showTime + 0.25 <= st then
		return
	end

	srp.hud.EnsureWeapons()

	local i = 0

	for slotid, data in ipairs(srp.hud.WeaponDisplay) do
		if not data.Weapons or not data.Weapons[1] then
			continue
		end

		i = i + 1
		local x, y = x + ((i - 1) * (w + 3)), y

		draw.RoundedBox(8, x, y, w, h, color_flatblack)
		draw.SimpleText(data.Name, 'ui.22', x + (w * 0.5), y + (h * 0.5), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		for i, wep in ipairs(data.Weapons) do
			local y = y + (i * (h + 3))
			draw.RoundedBox(8, x, y, w, h, weaponBackground)

			if (wep.SlotPos == srp.hud.SelectedWeapon) then
				draw.RoundedBox(8, x, y, w, h, weaponBackgroundSelected)
				draw.SimpleText(wep.Name, 'ui.18', x + (w * 0.5), y + (h * 0.5), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText(wep.Name, 'ui.18', x + (w * 0.5), y + (h * 0.5), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
	end
end

function GM:DrawWeaponSwitchList()
	local st = SysTime()
	local x, y = ScrW()-w-1, ScrH() - (table.Count(srp.hud.WeaponsByOrder) * (h+weppadding))
	if (srp.hud.showTime + 0.25 <= st) then
		return
	end

	srp.hud.EnsureWeapons()

	local i = 0
	for k, wep in ipairs(srp.hud.WeaponDisplay.Weapons) do
		drawSelection(x, y + ((h+weppadding)*i), wep.Name, wep.Ent, wep.ID == srp.hud.SelectedWeapon)
		i = i + 1
	end
end

function GM:DrawWepSwitch()
	self:DrawClassicWeaponSwitch()
end

hook('PlayerBindPress', 'srp.wepswitch.PlayerBindPress', function(pl, bind, pressed)
	if not pressed then
	    return
	end

	local lp = LocalPlayer()
	if not lp:Alive() or lp:InVehicle() or lp:IsJailed() or lp:IsCuffed() then
	    return
	end

	if not srp.hud.CanWeaponSwitch then
		return
	end

	local switch_now = cvar.GetValue('srp_quickswitch')
	local wep = LocalPlayer():GetActiveWeapon()

	if not switch_now and not cvar.GetValue('weapon_switchui_remember') and srp.hud.showTime < SysTime() then
		srp.hud.SelectedWeapon = 0
	end

	if IsValid(wep) then
		if wep.SWBWeapon and wep.dt and wep.dt.State == SWB_AIMING then
			return
		elseif wep.IsLightsaber and wep.ForceSelectEnabled then
			return
		end
	end

	if ((bind == 'invprev') or (bind == 'invnext') or (string.sub(bind, 1, 4) == 'slot')) and (!pl:KeyDown(IN_ATTACK)) then
		if #pl:GetWeapons() == 0 then
			return
		end

		if (string.sub(bind, 1, 3) == 'inv') then
			local scroll = (bind == 'invprev') and -1 or 1
			srp.hud.SelectedWeapon = srp.hud.SelectedWeapon + scroll

			if not srp.hud.WeaponDisplay.Weapons[srp.hud.SelectedWeapon] then
				srp.hud.SelectedWeapon = (scroll == 1 and 1) or #srp.hud.WeaponDisplay.Weapons
			end

			if switch_now then
				switchWeapon()
			end
		else
			if IsValid(wep) and wep:GetClass() == 'gmod_tool' and input.IsKeyDown(KEY_LSHIFT) then
				return
			end

			-- using number keys
			if (srp.hud.showTime < SysTime()) then
				srp.hud.fadeTime = SysTime()
				srp.hud.EnsureWeapons()
			end

			local slot = tonumber(string.sub(bind, -1))
			if (!srp.hud.WeaponDisplay[slot]) then return end

			local weps = srp.hud.WeaponDisplay[slot].Weapons

			if (weps[1]) then
				local found = false
				for k, v in pairs(weps) do
					if (v.SlotPos == srp.hud.SelectedWeapon) then
						found = true

						if (weps[k + 1]) then
							srp.hud.SelectedWeapon = v.SlotPos + 1
						else
							srp.hud.SelectedWeapon = weps[1].SlotPos
						end

						break
					end
				end

				if (!found) then
					srp.hud.SelectedWeapon = weps[1].SlotPos
				end

	            if switch_now then
	                switchWeapon()
	            end
			end
		end

		srp.hud.showTime = SysTime() + (switch_now and .1 or 2)

		if (lastSnd < SysTime() - 0.05) then
			surface.PlaySound('garrysmod/ui_hover.wav')
			lastSnd = SysTime()
		end
	elseif (srp.hud.showTime > SysTime() and bind == '+attack') then
		srp.hud.showTime = 2
		return switchWeapon()
	end
end)

concommand.Add('hud_lastwep', function(pl)
	if lastwep and LocalPlayer():HasWeapon(lastwep) then
	    switchWeapon(LocalPlayer():GetWeapon(lastwep))
	end
end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/imprints/imprint_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/imprints/imprint_sh.lua:
srp.imprint=srp.imprint||{}local a={}local b={}local function c()end;function srp.imprint.Get(d,e)return e&&b[d]||a[d]end;function srp.imprint.GetAll(e)return e&&b||a end;function srp.imprint.GetRemainingPriceTotal(f,a,g)local h=0;for i,j in ipairs(a)do if j.IgnoreInPricing then continue end;local k=f:GetImprintTier(j.id)if k>=#j.Tiers then continue end;for l=k,#j.Tiers do local m=j.Price*j.PriceMultiplier^l;h=m+h end end;if h==0 then return 0 end;if g then return math.ceil(h*0.013/35)else return math.ceil(h)end end;local function n(self,f)local k=math.min(#self.Tiers,f:GetImprintTier(self.id))return self.Tiers[k]||0,self.Tiers[k+1]end;local function o(self,f)local k=f:GetImprintTier(self.id)return self.Price*self.PriceMultiplier^(k+1)end;function srp.imprint.Register(d,p)p.id=d;p.internal=table.insert(b,p)p.Tier=p.Tier||{}p.GetStats=n;p.GetPrice=o;p.OnLoaded=p.OnLoaded||c;p.OnUpgraded=p.OnUpgraded||c;a[d]=p end;function PLAYER:GetImprintTier(d,q)return self.Imprints&&self.Imprints[d]||q||0 end;function PLAYER:GetImprintValue(d,q)return self.ImprintValues&&self.ImprintValues[d]||q||0 end;srp.imprint.Register('salaryincr',{Name='The Negotiator',Type='blue',Description=[[
You've made it! Negotiated extra pay in your daily cheque!
	]],Price=2500,PriceMultiplier=1.8,Tiers={.05,.1,.15,.2,.25,.3,.4,.5,.6,.75}})srp.imprint.Register('rcincr',{Name='Bread Winner',Type='blue',Description=[[
Promote yourself, treat yourself and earn more cash.
	]],Price=700,PriceMultiplier=2.5,Tiers={.025,.03,.045,.05,.055,.06,.065,.07,.075,.08}})srp.imprint.Register('xpincr',{Name='Extra Training',Type='blue',Description='Complete training and receive extra experience!',Price=3000,PriceMultiplier=3.5,Tiers={.025,.05,.1,.15,.20,.25}})srp.imprint.Register('barter',{Name='Bartering',Type='white',Description='Reduces the price of most vendored items.',Price=250000,PriceMultiplier=4,Tiers={.1}})srp.imprint.Register('breather',{Name='Professional Breather',Type='white',Description='You\'ve learned to hold your breath for longer.',Price=500,PriceMultiplier=4,Tiers={0.1,0.15,0.2,0.25,0.3}})srp.imprint.Register('unique_scrapincrease',{Name='Hoarder',Type='white',Description='When scrapping items you have a chance to retain more scrap.',Price=10,PriceMultiplier=4,Tiers={.025,.05,.075,.1,.125,.15,.175,.2}})srp.imprint.Register('unique_dropincrease',{Name='Lucky Man',Type='white',Description='You\'re in luck, your chance of good loot has increased!',Price=500,PriceMultiplier=2.2,Tiers={.025,.05,.075,.1,.125,.15,.175,.2}})srp.imprint.Register('unique_propertycost',{Name='The Foreigner',Type='red',Description='Properties on Coruscant cost half a much!',Price=100000,PriceMultiplier=1,Tiers={.5}})srp.imprint.Register('unique_mystery',{Name='Mystery',Type='green',Description='It does something, but what?',Price=4500,PriceMultiplier=1.8,IgnoreInPricing=true,Tiers={0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1}})srp.imprint.Register('couchpotatovet',{Name='Couch Potato Veteran',Type='red',Description='You have mastered the art of doing nothing. Gain extra XP and RC while AFK.',Price=7000,PriceMultiplier=2,Tiers={.025,.05,.075,.1,.125,.15,.175,.2}})srp.imprint.Register('questcheaper',{Name='Loyalty Card',Type='white',Description='Pay in and receive permanent reduction in quest buy-in costs!',Price=5000,PriceMultiplier=2,Tiers={.05,.1,.15,.2,.25}})
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/inventory/inventory_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/items/item_cl.lua:
srp.items=srp.items||{}local a={}local function b()a=cvar.GetValue('srp_item_faves')||{}hook.Run('OnItemFavouritesLoaded',a)end;cvar.Register'srp_item_faves':SetDefault({},true):AddInitCallback(b):SetEncrypted()function srp.items.ToggleFavourite(c)local d=!a[c.id]a[c.id]=d==true||nil;cvar.SetValue('srp_item_faves',a)hook.Run('OnItemFavourited',c,d)end;function srp.items.IsFavourite(c)return a[c.id]end;function srp.items.GetFavourites()return a end;net('srp.items.TempItemSync',function()for e=1,net.ReadUInt(8)do local f=srp.items.ReadTempItem()local c=srp.items.Register('Temp Items',f.id,f,true)srp.items.tempitems[c.id]=c;hook.Run('OnItemTempCreated',c)end;for e=1,net.ReadUInt(8)do local g=srp.items.ReadTempRecipeItem()srp.items.temprecipes[g.id]=g;hook.Run('OnItemTempRecipeCreated',g)end end)net('srp.items.TempItemCreate',function()local f=srp.items.ReadTempItem()local c=srp.items.Register('Temp Items',f.id,f)srp.items.tempitems[c.id]=c;hook.Run('OnItemTempCreated',c)end)net('srp.items.TempItemRemove',function()local h=net.ReadString()srp.items.tempitems[h]=nil;hook.Run('OnItemTempRemoved',h)end)net('srp.items.TempRecipeItemCreate',function()local g=srp.items.ReadTempRecipeItem()srp.items.temprecipes[g.id]=g;hook.Run('OnItemTempRecipeCreated',g)end)net('srp.items.TempRecipeItemRemove',function()local h=net.ReadString()srp.items.temprecipes[h]=nil;hook.Run('OnItemTempRecipeRemoved',h)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/items/item_sh.lua:
srp.items=srp.items||{}srp.items.base={}srp.items.data={}srp.items.categories={}srp.items.tempitems={}srp.items.temprecipes={}srp.items.tempRecipesLookup={}srp.items.classes={}srp.items.TempItemIcon='materials/galactic/ui/triumphs/package.png'local function a(b,c)if!SERVER then return end;timer.Simple(0,function()srp.inventory.shop.STORE_TRADER.items[b]=100;local d=srp.inventory.Get(c)d:AddItem(b,10)end)end;function srp.items.WriteTempItem(e)net.WriteString(e.id)net.WriteString(e.author)net.WriteString(e.name)net.WriteString(e.description)net.WriteString(e.model)end;function srp.items.WriteTempRecipeItem(f)net.WriteString(f.items[1])net.WriteString(f.items[2])net.WriteString(f.id)net.WriteString(f.model)end;function srp.items.CreateTempItem(b,g,h,i)net.Start'srp.items.TempItemCreate'net.WriteString(b)net.WriteString(g)net.WriteString(h)net.WriteString(i)net.SendToServer()end;function srp.items.CreateTempRecipeItem(j,k,l)net.Start'srp.items.TempRecipeItemCreate'net.WriteString(j)net.WriteString(k)net.WriteString(l)net.SendToServer()end;function srp.items.RemoveTempRecipeItem(l)net.Start'srp.items.TempRecipeItemRemove'net.WriteString(l)net.SendToServer()end;function srp.items.RemoveTempItem(b)net.Start'srp.items.TempItemRemove'net.WriteString(b)net.SendToServer()end;function srp.items.ReadTempItem()local b,m,g,h,i=net.ReadString(),net.ReadString(),net.ReadString(),net.ReadString(),Model(net.ReadString())return{id=b,name=g,description=h,model=i,icon=srp.items.TempItemIcon,author=m,temp=true,cantrade=false}end;function srp.items.ReadTempRecipeItem()local j=net.ReadString()local k=net.ReadString()local l=net.ReadString()local i=net.ReadString()return{id=l,model=i,creator=nil,items={j,k},j,k}end;function srp.items.RegisterBase(b,n)n.id=b;srp.items.base[b]=n end;function srp.items.Get(b)return srp.items.data[b]end;function srp.items.GetFromClass(o)return srp.items.classes[o]end;function srp.items.Register(p,b,n,q)local r=n.base&&srp.items.base[n.base]local e=r&&table.merge(r,n)||n;e.id=b;e.category=p;e.price=e.price||-1;e.maxstack=e.maxstack||1;e.icon=CLIENT&&Material(e.icon,e.iconsettings)||e.icon;if e.GenerateStats then e.stats=e.GenerateStats(e)end;srp.items.data[e.id]=e;srp.items.categories[p]=srp.items.categories[p]||{}if e.class_name then srp.items.classes[e.class_name]=e end;table.insert(srp.items.categories[p],e)if n.store then a(b,n.store)end;return e end;function srp.items.RenderIcon(e,s)if!e.RenderIcon||e.RenderedIcon then return end;if e.class_name then local t=weapons.GetStored(e.class_name)local r=t.Base&&weapons.GetStored(t.Base)if t then e.icon=srp.icon.GetRenderedIconEx(t.WorldModel,{id='icon_'..e.class_name,IconRenderPos=(r&&(r.IconRenderThumbnailPos||r.IconRenderPos)||(t.IconRenderThumbnailPos||t.IconRenderPos)||Vector())+Vector(-18,-2,0),IconRenderAngle=r&&r.IconRenderAngle||t.IconRenderAngle,IconRenderScale=r&&r.IconRenderScale||t.IconRenderScale,Imgw=1024,Imgh=1024},s)end;return end;if e.model||e.RenderSettings&&e.RenderSettings.IconRenderModel then local u=table.Merge({id='icon_'..e.id,IconRenderModel=e.model,IconRenderPos=Vector(-18,-2,0),IconRenderAngle=Angle(),IconRenderScale=1,Imgw=1024,Imgh=1024,Color=e.color},e.RenderSettings||{})e.icon=srp.icon.GetRenderedIconEx(u.IconRenderModel,u,s)end;e.RenderedIcon=true end;srp.AddCommand('tempitem',function(v,b,w)w=math.Clamp(w,1,100)local e=srp.items.tempitems[b]if!e then return end;local x=ents.Create'rp_item'x:SetPropOwner(v)x:SetPos(v:GetPos()+v:GetForward()*100+Vector(0,0,20))x:GenerateItem(e,w)x:Spawn()end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetChatCommand():SetInfoSection('Gamemaster'):SetInfo('Spawns a temp item.'):SetInfoArgs({'id - The item id from the F5 menu.'},{'count - The amount to spawn with.'}):SetAlive()hook('Initialize',function()game.AddAmmoType({name='ammo_blaster',dmgtype=DMG_BULLET,tracer=TRACER_LINE_AND_WHIZ,plydmg=0,npcdmg=0,force=100,minsplash=10,maxsplash=20,maxcarry=-2,flags=0})game.AddAmmoType({name='ammo_fuel',dmgtype=DMG_BURN,tracer=TRACER_NONE,plydmg=0,npcdmg=0,force=100,minsplash=10,maxsplash=20,maxcarry=-2,flags=0})game.AddAmmoType({name='dissolve',dmgtype=DMG_DISSOLVE,tracer=TRACER_LINE,plydmg=0,npcdmg=0,force=100,minsplash=5,maxsplash=20,maxcarry=-2,flags=0})end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/jails_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/ui/bailrow_ui.lua:
local a={}local b=col.grey_light:Copy()b.a=75;function a:Init()self:SetTall(50)self:SetBackgroundColor(b)self:DockPadding(5,5,5,5)self:AddPanel('srp_label',function(c)c:Dock(FILL)c:SetText''c:SetFont'ui_header.r'c:SetTextColor(col.grey_dark)self.Name=c end)self:AddPanel('srp_button',function(d)d:Dock(RIGHT)d:SetText'Bail'd:DockMargin(0,0,0,0)d:SetContentAlignment(5)d:SetDisabledColor(col.red_dark)d:SetWide(50)d:SetBackgroundColor(col.blue)d:SetHoverColor(col.orange)d:LeftClick(function()net.Start'srp.jail.Bail'net.WritePlayer(self.BailInfo.Player)net.SendToServer()end)self.Bail=d end)self:AddPanel('srp_label',function(c)c:Dock(RIGHT)c:SetText''c:SetContentAlignment(5)c:SetTextColor(col.grey_dark)self.Cost=c end)hook.Add('OnPlayerBailed',self,function(e,f)if f==self.BailInfo.Player then self:Remove()end end)end;function a:Populate(g)local h=LocalPlayer()self.BailInfo=g;self.CanBail=srp.jail.CanBail(h,g.Player)local i=h:HasMoney(g.Amount)local j=h:GetCurrency()self.Name:SetText(g.Player:GetTag()..' '..g.Player:Nick())self.Cost:SetText(string.Comma(g.Amount)..j)self.Cost:SetBackgroundColor(i&&col.white_dark||col.red)self.Bail:SetDisabled(!(i||self.CanBail))end;vgui.Register('srp_bailrow',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loadouts/loadout_sh.lua:
srp.loadouts=srp.loadouts||{}srp.loadouts.data=srp.loadouts.data||{}srp.loadouts.p_owned=srp.loadouts.p_owned||{}srp.loadouts.p_equipped=srp.loadouts.p_equipped||{}srp.loadouts.base={}function srp.loadouts.Owned(a,b)if!IsValid(a)then return false end;if a:HasUpgrade('weapon_unlock')then return true end;local c=SERVER&&srp.loadouts.p_owned[a:SteamID()]||srp.loadouts.p_owned;if!c then return false end;if c[b]then return true end;return false end;function srp.loadouts.CanOwn(a,d,e,f)if!istable(d)then return true end;if a:IsRoot()then return true end;if d.level&&a:GetTalentLevel()<d.level then return false end;if d.CanPurchase&&!d:CanPurchase(a)then return false end;e=e||a:GetGroup()f=f||a:GetGroupClass()if d.whitelist then if d.whitelist.talent&&a:IsTalentSelected(d.whitelist.talent)then return true end;if d.whitelist.preset&&table.HasValue(d.whitelist.preset,a:GetPreset().name)then return true end;if d.whitelist.steamid&&d.whitelist.steamid[a:SteamID()]then return true end;if e&&d.whitelist&&d.whitelist.group&&table.HasValue(d.whitelist.group,e.id)then return true end;local g=a:GetGroupRank()if g&&d.whitelist.rank then for h,i in ipairs(d.whitelist.rank)do if i==g.id then return true end end end;if f&&d.whitelist.class then for h,i in ipairs(d.whitelist.class)do if i==f.id then return true end end end;if d.whitelist.permission then for h,i in ipairs(d.whitelist.permission)do if g&&g:HasPermission(i)then return true elseif f&&f:HasPermission(i)then return true elseif e&&e:HasPermission(i)then return true end end end else return true end;return false end;function srp.loadouts.GetGroupLoadout(a)if CLIENT&&!a then a=LocalPlayer()end;local e=a:GetGroup()return e&&srp.loadouts.data[e.id]||srp.loadouts.base[a:GetAllegianceID()]end;function srp.loadouts.RegisterBase(j,k)k.items_mapped={}for l,m in pairs(k)do if!m.items then continue end;if m.multiselect then for n=1,m.multiselect do local i=l..'_'..n;local o=table.Copy(m)o.name=m.name..' '..n;o.multiselect=nil;o.parentid=l;k[i]=o end end;for i,p in pairs(m.items)do k.items_mapped[i]=p end end;k.GetItem=function(self,i)return self.items_mapped[i]end;srp.loadouts.base[j]=k end;function srp.loadouts.Register(i,j,k)k.items_mapped={}k.baseid=i;k.id=i;for l,m in pairs(k)do if!m.items then continue end;local q=srp.loadouts.base[j][l]&&srp.loadouts.base[j][l].multiselect||m.multiselect;if q then for n=1,q do local i=l..'_'..n;k[i]=table.Copy(m)end;k[l]=nil end;for i,p in pairs(m.items)do k.items_mapped[i]=p end end;k.GetItem=function(self,i)return self.items_mapped[i]end;srp.loadouts.data[i]=table.merge(srp.loadouts.base[j],k)end;srp.AddCommand('lforceclear',function(a,r)end):SetInfoSection('Loadout'):SetInfo('Force remove a players loadout'):SetInfoArgs({'Target - The players steamid'}):AddAlias('loadoutforceclear'):AddAlias('lfc'):AddAlias('forceloadoutclear'):AddParam(cmd.PLAYER_ENTITY):SetFlag('D')srp.AddCommand('loadoutclear',function(a)srp.loadouts.Unload(a,true)end):SetInfoSection('Loadout'):SetInfo('Clear your own loadout')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loadouts/ui/loadoutslots_ui.lua:
local a={}local b=Color(0,0,0,240)function a:Init()self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self:SetBackgroundColor(col.transparent)self:AddPanel('srp_panel',function(c)c:Dock(TOP)c:SetTall(20)c:SetBackgroundColor(b)c:DockMargin(0,0,0,2)c:DockPadding(0,0,0,0)c:AddPanel('srp_label',function(d)d:SetFont'ui_label.rb'd:Dock(FILL)self.title=d end)end)self:AddPanel('srp_grid',function(e)e:Dock(FILL)e:SetAutoHeight(true)e.OnComplete=function(f,g)self:SetTall(30+g)end;self.grid=e end)hook('OnLoadedUnequipped',self,self.UpdateItems)hook('OnLoadoutEquip',self,self.UpdateItems)hook('OnLoadoutPurchased',self,self.UpdateItems)end;function a:OnRemove()hook.Remove('OnLoadoutEquip',self)hook.Remove('OnLoadoutPurchased',self)end;function a:SetTitle(h)self.title:SetText(h)return self end;function a:UpdateItems(i)if self.slotid!=i then return end;for j,k in pairs(self.grid:GetChildren())do k:UpdateState()end end;function a:GetItem(l,m)if!l then return end;local n;local o;if!l.jedi&&self.jedi then return end;if istable(m)then if!srp.loadouts.CanOwn(LocalPlayer(),m)then return else n=m.cost;o=m.whitelist end else n=m end;return n,o end;function a:Populate(i,p)local q=LocalPlayer():GetGroupClass()self.jedi=LocalPlayer().IsJedi&&LocalPlayer():IsJEDI()||q&&q:HasPermission('jedi')self.slotid=i;self.items=p.items;for r,m in pairs(self.items)do local l=srp.items.Get(r)local n,o=self:GetItem(l,m)if!n then continue end;srp.ui.Create('srp_loadout_item',function(s)s.parentid=p.parentid;s:SetSize(50,50)s:SetItem(i,l,n,o)self.grid:AddItem(s)end)end;return self end;function a:Paint(t,g)end;vgui.Register('srp_loadout_slots',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/doors/doors_cl.lua:
srp.doors=srp.doors||{}local IsValid=IsValid;local ipairs=ipairs;local LocalPlayer=LocalPlayer;local Angle=Angle;local Vector=Vector;local a=ents.FindInSphere;local b=draw.SimpleTextOutlined;local c=team.GetColor;local d=team.GetName;local e=cam.Start3D2D;local f=cam.End3D2D;local g=surface.SetDrawColor;local h=surface.SetMaterial;local i=surface.DrawTexturedRect;local j=surface.GetTextSize;local k=surface.SetFont;local l=draw.DrawText;srp.doors.color_white=col.white:Copy()srp.doors.color_black=col.black:Copy()srp.doors.color_green=col.green:Copy()srp.doors.color_red=col.red:Copy()srp.doors.color_blue=col.blue_light:Copy()local m={}local n={}timer.Create('srp.RefreshDoorCache',.5,0,function()if IsValid(LocalPlayer())then local o=0;local p=0;m={}n={}local q=LocalPlayer():GetPos()for r,s in ipairs(a(q,1200))do if IsValid(s)&&s:IsPropertyOwnable()then o=o+1;m[o]=s end end;for t,u in pairs(srp.doors.InfoPanels)do if u.Pos:DistToSqr(q)<360000 then p=p+1;n[p]=u end end end end)function srp.doors.SetOwner(v,t)local u=srp.doors.GetGroup(t)if u then u.Owner=v;u.Access={}v.DoorGroup=t;hook.Run('OnDoorOwned',v,t)end end;function srp.doors.SetNotOwned(t)local u=srp.doors.GetGroup(t)if u then if IsValid(u.Owner)then u.Owner.DoorGroup=nil end;u.Owner=nil;u.Access={}hook.Run('OnDoorUnowned',t)end end;function srp.doors.AddDoorOwners(w)net.Start'srp.doors.AddAccess'net.WriteUInt(#w,7)for x,y in ipairs(w)do net.WriteString(y)end;net.SendToServer()end;function srp.doors.RemoveDoorOwners(w)net.Start'srp.doors.RemoveAccess'net.WriteUInt(#w,7)for x,y in ipairs(w)do net.WriteString(y)end;net.SendToServer()end;local z,A=0;local B=255;local C=col.black:Copy()function srp.doors.DrawText(D,E,F,G,H,I,J)A=I||A;G=G||'ui_header.xl'k(G)local K,L=j(D)if J then draw.NoTexture()K=K+80;C.a=math.Clamp(B,0,200)g(C)surface.DrawTexturedRect(-K/2,A,K,L)end;l(D,G,-4,A-4,srp.doors.color_black,F||TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)l(D,G,0,A,E,F||TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)A=A+L+(H||0)end;function srp.doors.DrawDefault(s,B,F)if s:IsBusiness()then srp.doors.DrawText('Business Property',srp.doors.color_red,F,'ui_header.l',25)end;if s:GetPropertyName()!=nil then local E=s:GetPropertyColor()E.a=B;srp.doors.DrawText(s:GetPropertyName(),E,F)end;if!IsValid(s:GetDoorOwner())then srp.doors.DrawText('Estate Agent Wants',srp.doors.color_green,F)srp.doors.DrawText(s:GetPropertyPrettyPrice()..'RC',srp.doors.color_green,F)else local M=s:GetDoorOwner()if IsValid(M)then local N=M:GetOrgName()srp.doors.DrawText(M:GetTag()..' '..M:Name(),srp.doors.color_green,F)if N then srp.doors.DrawText(N,M:GetChatColor(),F)end end end end;hook('PostDrawTranslucentRenderables','srp.doors.PostDrawTranslucentRenderables',function(O,P)if P then return end;local q=LocalPlayer():GetPos()for x,s in ipairs(m)do if!IsValid(s)then continue end;local Q=s:GetPos():DistToSqr(q)B=(255500-Q)/1200;A=0;z=0;srp.doors.color_white.a=B;srp.doors.color_blue.a=B;srp.doors.color_green.a=B;srp.doors.color_black.a=B;srp.doors.color_red.a=B;local R=s:DrawDoor()||s:GetModel()local S=srp.doors.DrawPanels[R]||{}if!S then continue end;local T=S.GetPosition||srp.doors.DrawPanels.default.GetPosition;local U,q,V=T(s)if!U then continue end;local W=S&&S.DrawPanel||srp.doors.DrawPanels.default.DrawPanel;e(q,V,.08)W(s,B,z,A)f()end;for x,u in ipairs(n)do local Q=u.Pos:DistToSqr(q)B=math.max((360000-Q)/600,0)A=0;z=0;srp.doors.color_white.a=B;srp.doors.color_blue.a=B;srp.doors.color_green.a=B;srp.doors.color_black.a=B;srp.doors.color_red.a=B;e(u.Pos,u.Ang,.08)u.DrawPanel(u,B,z,A)f()end end)net('srp.doors.OpenMenu',function()if IsValid(srp.doors.menu)then srp.doors.menu:Remove()end;srp.ui.Create('srp_agent',function(X)srp.doors.menu=X end)end)net('srp.doors.AddAccess',function()local t=net.ReadUInt(6)local Y=net.ReadUInt(7)local Z=srp.doors.GetGroup(t)if!Z then return end;local _=os.time()for a0=1,Y do local y=net.ReadString()Z.Access[y]=_;hook.Run('OnDoorAccessAdded',t,y,_)end end)net('srp.doors.RemoveAccess',function()local t=net.ReadUInt(6)local Y=net.ReadUInt(7)local Z=srp.doors.GetGroup(t)if!Z then return end;local _=os.time()for a0=1,Y do local y=net.ReadString()Z.Access[y]=nil;hook.Run('OnDoorAccessRemoved',t,y,_)end end)hook('OnCharacterSelected',function(v,x,x,a1)if!a1 then srp.doors.PopulateGroups()end end)net('srp.doors.Sync',function()local a2=srp.doors.GetGroups()local a3={}local a4=0;for a0=1,net.ReadUInt(6)do local t=net.ReadUInt(6)local v=net.ReadPlayer()srp.doors.SetOwner(v,t)end end)net('srp.doors.SetOwner',function()srp.doors.SetOwner(net.ReadPlayer(),net.ReadUInt(6))end)net('srp.doors.RemoveOwner',function()srp.doors.SetNotOwned(net.ReadUInt(6))end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/doors/ui/agentacces_ui.lua:
local a={}function a:Init()self:SetTitle'Door Access Panel'self:SetSize(500,400)self:Center()self:MakePopup(true)self:SetBackgroundColor(col.white_dark)self:AddPanel('ui_scrollpanel',function(b)b:Dock(FILL)self.scroll=b end)self:AddPanel('srp_button',function(c)c:Dock(BOTTOM)c:SetText'Update Access'c:LeftClick(function()self:UpdatePlayerList()end)end)self.PlayerPanels={}self.PlayerPanelsMapped={}hook('OnDoorAccessAdded',self,self.DoorAdded)hook('OnDoorAccessRemoved',self,self.DoorRemoved)end;function a:DoorAdded(d,e)if self.DoorID==d&&IsValid(self.PlayerPanelsMapped[e])then local c=self.PlayerPanelsMapped[e]c.HasAccess=true;c:SetBackgroundColor(col.green)c:SetHoverColor(col.green_dark)end end;function a:DoorRemoved(d,e)if self.DoorID==d&&IsValid(self.PlayerPanelsMapped[e])then local c=self.PlayerPanelsMapped[e]c.HasAccess=false;c:SetBackgroundColor(col.red)c:SetHoverColor(col.red_dark)end end;function a:Populate(f)self.DoorID=f:GetDoorID()for g,h in player.Iterator()do if!h:GetAllegiance()then continue end;if h==LocalPlayer()then continue end;srp.ui.Create('srp_button_tagtext',function(c)self.scroll:AddItem(c)c.steamid=h:SteamID()c.HasAccess=f:HasDoorAccess(h)c:SetText(h:GetTag()..' '..h:Nick())c:SetTagText(c.HasAccess&&0xf00c||0xf00d,true)c:SetBackgroundColor(c.HasAccess&&col.green||col.red)c:SetHoverColor(c.HasAccess&&col.green_dark||col.red_dark)c:SetTagFont('SSRPForkAwesome')c:SetTagBackground(c.HasAccess&&col.green||col.red)c:SetContentAlignment(4)c:LeftClick(function(i)i.HasAccess=!i.HasAccess;i:SetBackgroundColor(c.HasAccess&&col.green||col.red)i:SetHoverColor(c.HasAccess&&col.green_dark||col.red_dark)i:SetTagBackground(c.HasAccess&&col.green||col.red)i:SetTagText(i.HasAccess&&0xf00c||0xf00d,true)i.Changed=true end)self.PlayerPanelsMapped[c.steamid]=c;table.insert(self.PlayerPanels,c)end)end;self.scroll:GetCanvas():InvalidateLayout(true)self.scroll:InvalidateLayout(true)end;function a:UpdatePlayerList()local j,k={},{}for g,b in ipairs(self.PlayerPanels)do if b.Changed then if b.HasAccess then table.insert(j,b.steamid)else table.insert(k,b.steamid)end end end;if#j>0 then srp.doors.AddDoorOwners(j)end;if#k>0 then srp.doors.RemoveDoorOwners(k)end end;vgui.Register('srp_agentaccess',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/flashlight_cl.lua:
local a={}local b=3;local c=1;local d=6;local e={[IN_ALT1]=-1,[IN_ALT2]=1}function PLAYER:GetFlashlightPos()if!isThirdPerson()&&self==LocalPlayer()then return end;local f=self:GetActiveWeapon()if!IsValid(f)||!f.SWBWeapon||f.Akimbo then return end;local g=f:GetAttachment(1)if g then local h=g.Pos+f:GetForward()*50;local i=g.Ang;return h,i end end;function PLAYER:FlashLight(j)if j&&!IsValid(self.flashlight)then local k=ProjectedTexture()k:SetTexture('effects/flashlight001')k:SetFarZ(1000)k:SetFOV(50)k:SetBrightness(b*.7)k:SetEnableShadows(true)k:SetLinearAttenuation(150)k:Update()self.flashlightang=self:EyeAngles()self.flashlight=k;a[k]=self elseif!j&&IsValid(self.flashlight)then self.flashlight:Remove()end end;function PLAYER:UpdateFlashLight()if!IsValid(self.flashlight)then if self:GetNetVar('srp.player.flashlight')then self:FlashLight(true)end;return end;local i=self:EyeAngles()local h=self:EyePos()+self:GetAimVector()*30;local l,m=self:GetFlashlightPos()if l then h=l;i=m end;self.flashlightang=LerpAngle(FrameTime()*15,self.flashlightang||i,i)self.flashlight:SetPos(h)self.flashlight:SetAngles(self.flashlightang)self.flashlight:Update()end;timer.Create('srp.FlashlightCheck',1,0,function()for k,n in pairs(a)do if!IsValid(k)then continue end;if!IsValid(n)||!n.IsCurrentlyVisible then k:Remove()return end end end)hook('PostPlayerDraw',function(n)n:UpdateFlashLight()end)hook('PostDrawTranslucentRenderables',function()if!isThirdPerson()then LocalPlayer():UpdateFlashLight()end end)hook('OnFlashlightToggled',function(n,j)if IsValid(n)&&n.FlashLight then n:FlashLight(j)end end)hook('KeyPress','srp.flashlight.Brightness',function(n,o)if(!BrightnessNextChange||BrightnessNextChange<CurTime())&&e[o]then b=math.Clamp(b-e[o],c,d)if IsValid(n.flashlight)then n.flashlight:SetBrightness(b*.7)n.flashlight:Update()end;BrightnessNextChange=CurTime()+.1 end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/binds/binds_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/binds/binds_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/binds/ui/binds_ui.lua:
local a={}local b=utf8.char(0xf067)local c=utf8.char(0xf1f8)local d=utf8.char(0xf11c)local function e(f)if string.IsNilOrEmpty(f)then f='New Profile'end;if!srp.binds.ProfileExists(f)then return f end;f=f..'#'local g=2;while srp.binds.ProfileExists(f..g)do g=g+1 end;return f..g end;function a:Init()self:DockPadding(0,0,0,5)self:SetBackgroundColor(col.midnight)self:AddPanel('srp_panel',function(h)h:Dock(LEFT)h:SetBackgroundColor(col.transparent)self.LeftCont=h;h:AddPanel('srp_button_rounded',function(i)i:SetText'Profiles'i:SetEnabled(false)i:Dock(TOP)i:SetDisabled(true)i:AddPanel('srp_button_rounded',function(i)i:SetFont'ForkAwesome'i:SetContentAlignment(5)i:SetTextInset(9,2)i:SetText(b)i:SetTooltip'Add Profile'i:DockMargin(2.5,2.5,2.5,2.5)i:Dock(RIGHT)i:SetWide(40)i:LeftClick(function()ui.StringRequest('Add Profile','What would you like to name this bind profile?',e(),function(j)local k=e(j)srp.binds.AddProfile(k)if IsValid(self)then self:AddProfile(k,srp.binds.GetActiveProfile())end end)end)end)i:AddPanel('srp_button_rounded',function(i)i:SetFont'ForkAwesome'i:SetContentAlignment(5)i:SetTextInset(9,2)i:SetText(d)i:SetTooltip'Rename Profile'i:DockMargin(2.5,2.5,2.5,2.5)i:Dock(RIGHT)i:SetWide(40)i:LeftClick(function()ui.StringRequest('Re-name Profile','What would you like to name this bind profile?',e(),function(j)local k=e(j)srp.binds.RenameActiveProfile(k)if IsValid(self)then self.ProfileList:GetSelected():SetText(k)end end)end)i.Think=function(l)l:SetDisabled(srp.binds.GetActiveProfileName()=='Default')end end)i:AddPanel('srp_button_rounded',function(i)i:SetFont'ForkAwesome'i:SetContentAlignment(5)i:SetTextInset(9,2)i:SetText(c)i:SetTooltip'Remove Profile'i:DockMargin(2.5,2.5,2.5,2.5)i:Dock(RIGHT)i:SetWide(40)i:LeftClick(function()ui.BoolRequest('Remove Profile','Are you sure you\'d like to remove '..srp.binds.GetActiveProfileName()..'?',function(m)if m then srp.binds.RemoveActiveProfile()if IsValid(self)then self.ProfileList:GetSelected():Remove()self.DefaultProfileRow:ForceLeftClick()end end end)end)i.Think=function(l)l:SetDisabled(srp.binds.GetActiveProfileName()=='Default')end end)self.ProfileLabel=i end)h:AddPanel('ui_listview',function(h)h:Dock(FILL)h:DockMargin(5,5,5,5)h.OnSelected=function(l,n)srp.binds.SetActiveProfile(n.ProfileName)self:SetProfile(srp.binds.GetActiveProfile())end;self.ProfileList=h end)end)self:AddPanel('srp_panel',function(h)h:Dock(FILL)h:SetBackgroundColor(col.transparent)self.RightCont=h;h:AddPanel('srp_button_rounded',function(i)i:Dock(TOP)i:SetText'Binds'i:SetDisabled(true)i:AddPanel('srp_button_rounded',function(i)i:Dock(RIGHT)i:SetContentAlignment(5)i:SetWide(40)i:SetFont'ForkAwesome'i:SetTooltip'Add Bind'i:SetText(b)i:SetTextInset(9,2)i:DockMargin(2.5,2.5,2.5,2.5)i:LeftClick(function()local o=ui.Create('srp_settings_binder')o:SetBind({Type=srp.binds.TYPE_CHAT,Command='Hello!'})self.BindList:AddItem(o)end)end)end)h:AddPanel('ui_listview',function(h)h:Dock(FILL)h:DockMargin(5,5,5,5)self.BindList=h end)end)for k,p in pairs(srp.binds.GetProfiles())do self:AddProfile(k,p)end end;function a:AddProfile(k,p)local q=k==srp.binds.GetActiveProfileName()srp.ui.Create('srp_button_rounded',function(i)local r=self.ProfileList;i:SetBackgroundColor(col.midnight_dark)i:SetHoverColor(col.midnight_light)i:SetText(k)i.ProfileName=k;function i.SetActive()if IsValid(self.Selected)then r.Selected.Active=false end;i.Active=true;r.Selected=i end;i:LeftClick(function(l)if l.Selected then return end;l:SetActive()r:OnSelected(l)end)if q then i:SetActive()self:SetProfile(p)end;if k=='Default'then self.DefaultProfileRow=i end;i:SetTall(r.RowHeight)r:AddItem(i)end)end;function a:SetProfile(p)self.BindList:Reset()local s={}for t,u in SortedPairsByMemberValue(p,'Key',true)do local o=ui.Create('srp_settings_binder')o:SetBind(u,t)self.BindList:AddItem(o)s[t]=true end;for f,u in SortedPairsByMemberValue(keybind.GetTable(),'Key',true)do if u:IsCustom()then continue end;if s[f]then continue end;local o=ui.Create('srp_settings_binder')o:SetBind({Type=srp.binds.TYPE_GAME,IsDefault=true},f)self.BindList:AddItem(o)end end;function a:PerformLayout(v,w)self.LeftCont:SetWide((v-2.5)*0.25)end;vgui.Register('srp_settings_binds',a,'srp_panel')srp.AddCommand('Cycle Binds',function(x)end):RunOnClient(function(y)local z=srp.binds.GetProfiles()if y==nil then local A=srp.binds.GetActiveProfileName()local B=table.GetKeys(z)local C=1;for D,E in ipairs(B)do if E==A then C=D+1;break end end;if C>#B then C=1 end;y=B[C]end;if z.Contains[y]then srp.binds.SetActiveProfile(y)else return false,'Could not find keybind profile '+y end end):AddParam(cmd.STRING,cmd.OPT_OPTIONAL)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/death/death_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/questobjective_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/rts_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/rts_cl.lua:
srp.rts=srp.rts||{}srp.rts.directory=info.DataFolder..'rts/'srp.rts.menu=srp.rts.menu;srp.rts.groups=srp.rts.groups||{}srp.rts.Style={background=col.grey,gradient=col.grey_dark}local a=Color(255,255,255,255)local b=Material'materials/galactic/ui/character_orb.png'local c=Material'materials/galactic/ui/character_orb_inner.png'local d=Material'materials/galactic/ui/rts/health.png'local e={[-1]={name=''},[SCHED_NONE]={name=''},[SCHED_IDLE_STAND]={icon=Material('materials/galactic/ui/rts/waiting.png','smooth noclamp')},[SCHED_FORCED_GO_RUN]={icon=Material('materials/galactic/ui/rts/move.png','smooth noclamp')},[SCHED_RUN_RANDOM]={icon=Material('materials/galactic/ui/rts/move.png','smooth noclamp')},[SCHED_IDLE_WANDER]={icon=Material('materials/galactic/ui/rts/patrol.png','smooth noclamp')},[SCHED_COMBAT_PATROL]={icon=Material('materials/galactic/ui/rts/patrol.png','smooth noclamp')},[SCHED_PATROL_WALK]={icon=Material('materials/galactic/ui/rts/patrol.png','smooth noclamp')},[SCHED_PATROL_RUN]={icon=Material('materials/galactic/ui/rts/patrol.png','smooth noclamp')},[SCHED_AMBUSH]={icon=Material('materials/galactic/ui/rts/guard.png','smooth noclamp')},[SCHED_TAKE_COVER_FROM_ORIGIN]={icon=Material('materials/galactic/ui/rts/protection.png','smooth noclamp')},[SCHED_MOVE_AWAY]={icon=Material('materials/galactic/ui/rts/return.png','smooth noclamp')},[SCHED_MOVE_AWAY_END]={icon=Material('materials/galactic/ui/rts/waiting.png','smooth noclamp')},[SCHED_SLEEP]={icon=Material('materials/galactic/ui/rts/waiting.png','smooth noclamp')},[SCHED_FAIL]={icon=Material('materials/galactic/ui/rts/what.png','smooth noclamp')},[SCHED_ALERT_STAND]={icon=Material('materials/galactic/ui/rts/question.png','smooth noclamp')},[SCHED_ALERT_SCAN]={icon=Material('materials/galactic/ui/rts/question.png','smooth noclamp')},[SCHED_ALERT_FACE_BESTSOUND]={icon=Material('materials/galactic/ui/rts/exclamation.png','smooth noclamp')},[SCHED_ALERT_WALK]={icon=Material('materials/galactic/ui/rts/exclamation.png','smooth noclamp')},[SCHED_COMBAT_FACE]={icon=Material('materials/galactic/ui/rts/exclamation.png','smooth noclamp')},[SCHED_COMBAT_PATROL]={icon=Material('materials/galactic/ui/rts/exclamation.png','smooth noclamp')},[SCHED_COMBAT_STAND]={icon=Material('materials/galactic/ui/rts/exclamation.png','smooth noclamp')},[SCHED_COMBAT_SWEEP]={icon=Material('materials/galactic/ui/rts/exclamation.png','smooth noclamp')},[SCHED_COMBAT_WALK]={icon=Material('materials/galactic/ui/rts/exclamation.png','smooth noclamp')}}file.CreateDir(srp.rts.directory)function srp.rts.DisplayMenu(f)if IsValid(srp.rts.menu)then srp.rts.menu:Remove()end;if f then srp.ui.Create('srp_rtsframe',function(g)srp.rts.menu=g end)end end;function srp.rts.RequestAction(h,i,j)local k=srp.rts.Get(h,true)local l=k:IsWorldClick()||k:IsUnit()i=i||{}if k:IsContextual()then i=table.Filter(i,function(m)return IsValid(m)&&k:CanUseContext(m:GetClass(),m)end)else i=table.Filter(i,function(m)return IsValid(m)&&(m:IsNPC()||m.RTSSelectable)end)end;net.Start'srp.rts.SetAction'net.WriteUInt(k.internal,6)net.WriteUInt(#i,8)for n,m in ipairs(i)do net.WriteEntity(m)end;k:Write(false)net.WriteBool(l&&j)if l&&j then net.WriteVector(j)end;net.SendToServer()end;function srp.rts.RequestDeselect(h)local k=srp.rts.Get(h,true)net.Start'srp.rts.DeselectAction'net.WriteUInt(k.internal,6)net.SendToServer()end;local function o(p,q,r)if!p.visible then return end;return p.x>=q.x&&p.x<=r.x&&(p.y>=q.y&&p.y<=r.y)end;function srp.rts.GetEntitySelection(s,t,u)local v=s:GetRTSDrone()if!IsValid(v)then return end;local i={}local w=0;for n,m in ents.Iterator()do if!IsValid(m)then continue end;if!(m.IsNPC&&m:IsNPC())&&!(m.RTSSelectable||srp.rts.ClassWhitelist[m:GetClass()])then continue end;local x=m:GetPos()if o(x:ToScreen(),t,u)||o((x+m:OBBMins()):ToScreen(),t,u)||o((x+m:OBBMaxs()):ToScreen(),t,u)then w=w+1;i[#i+1]=m;if w>50 then break end end end;return w>0&&i||nil end;function srp.rts.CreateGroup(idx,i)if!idx||!i||#i==0 then return end;if srp.rts.groups[idx]then for n,m in pairs(srp.rts.groups[idx])do if IsValid(m)then m.RTSGroup=nil end end;srp.rts.groups[idx]=nil end;srp.rts.groups[idx]={}for n,m in ipairs(i)do if!IsValid(m)||!(m:IsNPC()||m:IsNextBot())then continue end;m.RTSGroup=idx;table.insert(srp.rts.groups[idx],m)end;hook.Run('OnRTSGroupCreated',idx,srp.rts.groups[idx])end;function srp.rts.RemoveEntity(m)if!m.RTSGroup then return end;if srp.rts.groups[m.RTSGroup]then table.RemoveByValue(srp.rts.groups[m.RTSGroup],m)hook.Run('OnRTSGroupNPCRemoved',idx,srp.rts.groups[m.RTSGroup])end end;function srp.rts.RemoveGroup(idx)if!srp.rts.groups[idx]then return end;for n,m in pairs(srp.rts.groups[idx])do if IsValid(m)then m.RTSGroup=nil end end;srp.rts.groups[idx]=nil;hook.Run('OnRTSGroupRemoved',idx)end;function srp.rts.GetGroup(idx)return srp.rts.groups[idx]end;function srp.rts.SelectGroup(idx)if srp.rts.groups[idx]then hook.Run('OnRTSGroupSelectRequest',idx,srp.rts.groups[idx])end end;hook('PostDrawTranslucentRenderables','srp.rts.DrawNPC',function(y,z)if y||z then return end;local i=ents.FindByClass'npc_*'if#i==0 then return end;local v=LocalPlayer():GetRTSDrone()if!IsValid(v)then return end;local A=v:GetSmoothPos()for n,B in ipairs(i)do if!IsValid(B)then continue end;local C=B:GetSchedule()local D=e[C]||B.LastScheduleData;if!D then continue end;local E=B:GetPos()local F=A:DistToSqr(E)if F>1600000 then continue end;local G=E+Vector(0,0,85)local H=(E-A):Angle()H.p=0;H.y=H.y+-90;H.r=H.r+90;local I=D.name||B.LastScheduleData&&B.LastScheduleData.name;local J=D.icon;local K=B:Health()<100&&d;cam.Start3D2D(G,H,.5)render.SuppressEngineLighting(true)if I then draw.SimpleText(I,'ui_header.r',0,0,a,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;if J then surface.SetMaterial(J)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(-16,-48,32,32)end;if K then surface.SetMaterial(K)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(-8,-80,16,16)end;render.SuppressEngineLighting(false)cam.End3D2D()B.LastScheduleData=D end end)hook('OnPlayerRTSDrone','srp.rts.drone',function(s,L,M)local v=s:GetRTSDrone()if IsValid(v)then v:SetPlayer(s)end end)hook('OnPlayerRTSMode',function(s,N)srp.rts.DisplayMenu(N)if N then hook.Add('ShouldDrawLocalPlayer','srp.rts.viewself',function()return true end)else hook.Remove('ShouldDrawLocalPlayer','srp.rts.viewself')end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/ui/rtsframe_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/ui/rtsgroups_ui.lua:
local a={}function a:Init()self:SetPos(ScrW()-5,ScrH()-70)self:SetSize(64,64)self:DockPadding(0,0,0,0)self:IsMouseInputEnabled(false)self.Groups={}for b,c in pairs(srp.rts.groups)do if table.Count(c)>0 then self:AddGroup(b,c)else srp.rts.RemoveGroup(b)end end;hook.Add('OnRTSGroupCreated',self,self.AddGroup)hook.Add('OnRTSGroupRemoved',self,self.RemoveGroup)end;function a:OnRemove()hook.Remove('OnRTSGroupCreated',self)hook.Remove('OnRTSGroupRemoved',self)end;function a:AddGroup(b,c)local d=false;for e,c in pairs(srp.rts.groups)do if self.Groups[e]then self.Groups[e]:Update(c)if e==b then d=true end end end;if d then return end;self:AddPanel('srp_rtsgroup',function(f)f:Dock(LEFT)f:SetSize(48,64)f:Populate(b,c)self.Groups[b]=f end)local g=table.Count(self.Groups)*48;self:SetWide(g)self:SetPos(ScrW()-g-5,ScrH()-70)end;function a:RemoveGroup(b)if IsValid(self.Groups[b])then self.Groups[b]:Remove()end end;function a:SelectGroup(b)for e,f in pairs(self.Groups)do f:SetSelected(e==b)end end;function a:Paint(h,i)end;vgui.Register('srp_rtsgroups',a,'srp_panel_rounded')local a={}local j=Material('materials/galactic/ui/rts/group.png','smooth noclamp')function a:Init()end;function a:Populate(b,c)self.GroupID=b;self:Update(c)end;function a:Update(c)self.Entities=c;self.EntityCount=table.Count(c||{})end;function a:OnMousePressed(k)if k==MOUSE_LEFT then srp.rts.SelectGroup(self.GroupID)else srp.rts.RemoveGroup(self.GroupID)end end;function a:SetSelected(l)self.Selected=l end;function a:Paint(h,i)local m=self.Selected&&72||64;if self.Selected then local n=m+6;surface.SetDrawColor(0,98,255)surface.SetMaterial(j)surface.DrawTexturedRect((h-n)/2,(i-n)/2,n,n)end;surface.SetDrawColor(255,255,255,255)surface.SetMaterial(j)surface.DrawTexturedRect((h-m)/2,(i-m)/2,m,m)if self.GroupID then draw.SimpleText(self.GroupID,self.Selected&&'ui.20'||'ui.18',h/2-1,i/2-8,col.black,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;if self.EntityCount then draw.SimpleText(self.EntityCount,'ui.18',h-8,i-2,col.white,TEXT_ALIGN_RIGHT,TEXT_ALIGN_BOTTOM)end end;vgui.Register('srp_rtsgroup',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/seasonal/seasonal_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/seasonal/seasonal_cl.lua:
srp.seasonal=srp.seasonal||{}srp.seasonal.EventName=nil;srp.seasonal.Time='2nd Nov. TF2 is required to see decorations.'srp.seasonal.PlayerModelDefault=Model'models/galactic/clones/spookyclone.mdl'srp.seasonal.StaticModelDefault=Model'models/props_halloween/pumpkin_01.mdl'local a={}local b={}local c={}local d={}local e=1;function srp.seasonal.SpawnPlayerModel(f)local g=ClientsideModel(f.model||srp.seasonal.PlayerModelDefault)if!IsValid(g)then return end;local h=g:LookupSequence(f.anim[math.random(1,#f.anim)])g:Spawn()g:SetPos(f.pos)g:SetAngles(f.ang)if f.effect then g:SetRenderFX(f.effect)end;if f.material then g:SetMaterial(f.material)end;if f.color then if f.color[1]then g:SetColor(f.color[math.random(1,#f.color)])else g:SetColor(f.color)end end;if f.scale then g:SetModelScale(f.scale)end;g.AutomaticFrameAdvance=true;g:ResetSequence(h)g:ResetSequenceInfo()g:SetCycle(f.animframe||0)g:SetPlaybackRate(1)g:SetSequence(h)g.seasonal=true;f.ent=g end;function srp.seasonal.SpawnPlayerModels(i)if!a[i]then return end;for j,f in pairs(a[i])do srp.seasonal.SpawnPlayerModel(f)end;hook.Add('Think','srp.seasonal.Animate',srp.seasonal.AnimatePlayerModels)end;function srp.seasonal.SpawnStaticModels(i)if!b[i]then return end;lighting_active={}for j,f in pairs(b[i])do if IsValid(f.ent)then f.ent:Remove()end;local g=ClientsideModel(f.model||srp.seasonal.StaticModelDefault)if!IsValid(g)then continue end;g:SetPos(f[1])g:SetAngles(f[2]+Angle(0,math.random(-180,180),0))g:Spawn()g.seasonal=true;f.ent=g end;lighting_active=c[i]||{}hook('Think','srp.seasonal.Lighting',srp.seasonal.DisplayLight)end;function srp.seasonal.AnimatePlayerModels()local k=LocalPlayer()for l=1,#d do local f=d[l]if IsValid(f.ent)then if!f.animframe then f.ent:FrameAdvance(e)end;if f.think then f.think(f.ent,k)end end end end;function srp.seasonal.DisplayLight()if!lighting_active then return end;for l,f in pairs(lighting_active)do local m=DynamicLight(l)if m then m.pos=f[1]m.r=255;m.g=150;m.b=0;m.brightness=3;m.style=12;m.Decay=22;m.Size=f[2]||400;m.DieTime=CurTime()+1 end end end;local n={}local o={}local function p()for j,g in ipairs(o)do if IsValid(g)then g:Remove()end end;o={}end;local function q(f)if!f.effectname then return end;if f.game&&!IsMounted(f.game)then return end;local g=ClientsideModel'models/hunter/blocks/cube025x025x025.mdl'g.seasonal=true;g.DoNotRemove=true;g:SetMoveType(MOVETYPE_NONE)g:SetCollisionGroup(COLLISION_GROUP_DEBRIS)g:Spawn()g:SetNoDraw(true)g:SetPos(f.pos)g:SetAngles(f.ang||Angle())g.effect=srp.seasonal.CreateParticle(g,f)local r='srp.particles.Timer_'..g:EntIndex()g:CallOnRemove(r,function(s)timer.Remove(r)end)if f.loop then timer.Create(r,f.loop,0,function()g.effect=srp.seasonal.CreateParticle(g,f)end)end;return g,g.effect end;function srp.seasonal.SpawnParticleBeams(t)p()for j,f in ipairs(n)do if t!=f.room then continue end;local u,v=q(f)table.insert(o,u)if!IsValid(v)||!f.connections then continue end;for l,w in ipairs(f.connections)do v:SetControlPoint(l,w.pos)end end end;function srp.seasonal.CreateParticle(g,f)return g:CreateParticleEffect(f.effectname,f.attachmentid||0,{entity=g,position=f.position})end;local x={}function srp.seasonal.SpawnSounds(t)for j,f in ipairs(x)do if t!=f.room then continue end;sound.PlayFile(f.snd,'3d noplay',function(y)if IsValid(y)then y:SetPos(f.pos)y:Play()end end)end end;function srp.seasonal.RegisterSound(i,z,f)f.room=i;f.snd=z;table.insert(x,f)end;function srp.seasonal.RegisterSounds(f)x=f end;function srp.seasonal.RegisterParticle(i,A,f)f.room=i;f.effectname=A;table.insert(n,f)end;function srp.seasonal.RegisterParticles(f)n=f end;function srp.seasonal.RegisterPlayerModel(i,f)a[i]=a[i]||{}table.insert(a[i],f)table.insert(d,f)end;function srp.seasonal.RegisterStaticModel(i,B,C)b[i]=b[i]||{}table.insert(b[i],{B,C})end;function srp.seasonal.RegisterLighting(i,B,D,E)c[i]=c[i]||{}table.insert(c[i],{B,D,E})end;local function F(G)hook.Remove('Think','srp.seasonal.Lighting')hook.Remove('Think','srp.seasonal.Animate')lighting={}for j,g in pairs(ents.FindByClass('class C_BaseFlex'))do if IsValid(g)&&g.seasonal then g:Remove()end end end;local H;hook('OnLocationChanged',function(k,I,l)if k!=LocalPlayer()then return end;if!srp.seasonal.EventName then return end;if!H||H!=I.name then F(I.name)if!cvar.GetValue('event_visuals')then return end;srp.seasonal.SpawnStaticModels(I.name)srp.seasonal.SpawnPlayerModels(I.name)srp.seasonal.SpawnParticleBeams(I.name)srp.seasonal.SpawnSounds(I.name)hook.Run('OnSeasonalRoomChanged',I.name)end;H=I.name end)hook('InitPostEntity',function()if srp.seasonal.EventName then srp.notif.FlashConfirm(srp.seasonal.EventName,srp.seasonal.EventName,'Content running until '..srp.seasonal.Time,120,'Close')end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/restart/restart_sh.lua:
srp.AddCommand('requestrestart',function(a)srp.restart.RequestRestart(a)end):AddAlias('voterestart'):SetInfoSection('Restart'):SetInfo('Request a restart on the server. Can only be requested at 50+ hours uptime and if the vote fails you must wait another hour.\n\nRequires 70% yes votes from players active within the last 10 minutes.').CanRun=function(self,a)if info.CWRP then return a:IsVeteranGamemaster()||a:IsAdmin(true)else return a:GetGroup()!=nil end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/staffnews/news_sh.lua:
srp.AddCommand('staffnews',function(a)net.Start'srp.staffnews.OpenMenu'net.WriteBool(true)net.Send(a)end):AddAlias('news'):SetInfoSection('Staff'):SetInfo('Creates a new article for all staff to read.').CanRun=function(b,a)return(a:IsAdmin()||a:IsTrialGamemaster())&&true||false end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/staffnews/ui/staffnewsedit_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/talents/ui/talenttrees_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/time/timer_sh.lua:
srp.timer=srp.timer||{}local a={}local b={}function srp.timer.Start(c,d,e,f,g,h)a[d]={id=d,name=e,player=c,targets=g,duration=f,endtime=CurTime()+f,sync=h}if h then b[d]=a[d]end;hook.Run('OnTimerStarted',a[d])timer.Create(d,f,1,function()srp.timer.End(d)end)end;function srp.timer.End(d)local i=a[d]if!i then return end;timer.Remove(d)hook.Run('OnTimerEnded',a[d])b[d]=nil;a[d]=nil end;function srp.timer.GetAll(j)return j&&b||a end;function srp.timer.Get(d)return a[d]end;srp.AddCommand('timer',function(c,k,f)local l=string.Explode(' ',k)local d=l[1]local e=table.concat(l,' ',2)srp.timer.Start(c,d,e,f,{c})end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Timers'):SetInfo('Creates a timer with the specified name and duration.'):SetInfoArgs({'Name - Time name','Duration - Countdown in seconds'})srp.AddCommand('timergroup',function(c,k,f)local l=string.Explode(' ',k)local m=l[1]local e=table.concat(l,' ',2)local n=srp.groups.Get(m)if n&&(n==c:GetGroup()||c:IsTrialGamemaster())then srp.timer.Start(c,m,e,f,n:GetPlayers(true))end end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Timers'):SetInfo('Creates a timer with the specified name and duration for the given group.'):SetInfoArgs({'GroupID - The Group Ticker','Name - Time name','Duration - Countdown in seconds'})srp.AddCommand('timerevent',function(c,k,f)local l=string.Explode(' ',k)local d=l[1]local e=table.concat(l,' ',2)srp.timer.Start(c,d,e,f,filter.GetEvent())end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Timers'):SetInfo('Creates an event timer with the specified name and duration with a given reference id.'):SetInfoArgs({'ID - Reference ID','Name - Time name','Duration - Countdown in seconds'}):SetGM()srp.AddCommand('timerall',function(c,k,f)local l=string.Explode(' ',k)local d=l[1]local e=table.concat(l,' ',2)srp.timer.Start(c,d,e,f,player.GetAll(),true)end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Timers'):SetInfo('Creates a timer for everyone with the specified name and duration for the given reference id.'):SetInfoArgs({'ID - Reference ID','Name - Time name','Duration - Countdown in seconds'}):SetGM()srp.AddCommand('timerremove',function(c,d)d=c:SteamID()..'_'..d:Replace(' ','_')srp.timer.End(d)end):AddParam(cmd.STRING):SetInfoSection('Timers'):SetInfo('Removes a timer that has the specified reference id. This may be a custom ID supplied with the various help commands and also group tickers and steamids.'):SetInfoArgs({'ID - Reference ID'})
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/time/ui/timer_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/ui/inventoryselect_list_ui.lua:
local a={}function a:Init()self:SetBackgroundColor(col.midnight_dark)self:SetBorderColor(col.grey_light)self:DockPadding(5,5,5,5)self:SetTall(80)self:MakePopup()self:AddPanel('ui_scrollpanel',function(b)b:Dock(FILL)srp.ui.Create('srp_grid',function(c)b:AddItem(c)c:Dock(TOP)c:SetAutoHeight(true)self.grid=c end)end)hook('VGUIMousePressed',self,self.OnVGUIMousePressed)end;function a:OnFilterItem(d)self._OnFilterItem=d end;function a:_OnFilterItem(e)return true end;function a:OnVGUIMousePressed(f,g)if!self:IsOurChild(f)||f!=self then self:Remove()end end;function a:OnSelectItems(d)self._OnSelectItems=d end;function a:AddItems(h,i)local j=0;for k,l in pairs(i)do local e=srp.items.Get(l.itemid)if!e then continue end;if!self:_OnFilterItem(e)then continue end;srp.ui.Create('srp_inventoryselect_item',function(f)f:SetSize(64,64)f:Populate(h,e,l)self.grid:AddItem(f)end)j=j+1 end;return j end;function a:Populate(h)local j=0;if self._OnSelectItems then j=self:AddItems(h,self:_OnSelectItems())else local m=LocalPlayer():GetInventory()j=self:AddItems(h,m.items)end;self:SetTall(math.max(76,10+64*j/6+4*j/6))self:InvalidateLayout(true)if j==0 then self:Remove()end end;function a:OnRemove()hook.Remove('VGUIMousePressed',self)end;vgui.Register('srp_inventoryselect_list',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/ui/trading_ui.lua:
local a={}local b=Material('galactic/ui/wallet.png','smooth')local c=Material('galactic/ui/box_money.png','smooth')local d=Material('galactic/ui/box_random.png','smooth')function a:Init()self:SetSize(1200,700)self:Center()self:MakePopup()self:SetBackgroundColor(col.midnight)self:SetTitle'Trading Terminal'self:AddPanel('srp_tabs_icon',function(e)e:Dock(FILL)e:SetMode(TOP,120)e:SetStripBackgroundColor(col.transparent)e:AddPage('BUY',b,srp.ui.Create('srp_tradingview'))e:AddPage('SELL',c,srp.ui.Create('srp_tradingsell'))e:AddPage('HISTORY',d,srp.ui.Create('srp_tradinghistory'))self.tabs=e end)end;vgui.Register('srp_trading',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/ui/tradingsell_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/steps_cl.lua:
srp.training=srp.training||{}srp.training.enabled=false;local a;local b={}local c=0;local d=col.red:Copy()d.a=100;local e=col.green:Copy()e.a=100;local f=col.blue:Copy()f.a=100;local g=col.pink:Copy()g.a=100;local h=col.orange:Copy()h.a=100;local i=col.white:Copy()i.a=100;local j={d,e,g,i,f,h}function srp.training.Start()if srp.training.enabled||#b==0 then return end;c=0;srp.training.enabled=true;srp.camera.SetPos(LocalPlayer():EyePos(),LocalPlayer():EyeAngles(),false)if!IsValid(srp.training.uicontainer)then srp.ui.Create('srp_training_container',function(k)k:SetSize(ScrW(),ScrH())k:SetPos(0,0)k:MakePopup()srp.training.uicontainer=k end)end;hook.Run('OnTrainingStarted')srp.training.NextStep()end;function srp.training.AddStep(l)l.id=table.insert(b,l)l.last=true;if b[l.id-1]then b[l.id-1].last=nil end;return l end;function srp.training.GetStep(m)return b[m]end;function srp.training.CurStep()return b[c]end;function srp.training.NextStep()timer.Remove('srp.training.NextStep')c=c+1;if c>#b then srp.training.End()return end;local n=b[c]local o,p,q=Vector(),Angle(),true;local r=info.Map;if isfunction(n.camera)then o,p,q=n.camera(n,r)else local s=n.camera[r]||n.camera.default;o,p,q=s.pos,s.ang,s.ease end;net.Start'srp.training.SetMode'net.WriteVector(o)net.SendToServer()srp.camera.SetPos(o,p,q)srp.training.uicontainer:SetStep(n)srp.training.uicontainer:MakePopup()a=n;if n.timing then timer.Create('srp.training.NextStep',n.timing,1,function()local t=srp.training.CurStep()if t&&t.id==n.id then srp.training.NextStep()end end)end end;function srp.training.PreviousStep()c=c-2;srp.training.NextStep()end;function srp.training.End()timer.Remove('srp.training.NextStep')local c=srp.training.CurStep()if c then if IsValid(c.panel)then c.panel:Remove()end;a=nil end;srp.camera.Stop()srp.training.enabled=false;if IsValid(srp.training.uicontainer)then srp.training.uicontainer:Remove()end;hook.Run('OnTrainingEnded')hook.Run('OnPlayerTrained')end;local function u()local v=srp.loc.GetAll()if v then render.SetColorMaterial()for w,l in ipairs(v)do if!l.training then continue end;local x=(l.min+l.max)/2;local y=l.color||j[w%#j+1]local z=math.abs(l.min.x-l.max.x)/2;local A=math.abs(l.min.y-l.max.y)/2;local B=math.abs(l.min.z-l.max.z)/2;cam.IgnoreZ(true)render.DrawBox(x,Angle(),Vector(-z,-A,-B),Vector(z,A,B),y,true)cam.IgnoreZ(false)end end end;function srp.training.DisplayAreas()hook.Add('PostDrawTranslucentRenderables','srp.training.DisplayAreas',u)end;function srp.training.RemoveDisplayAreas()hook.Remove('PostDrawTranslucentRenderables','srp.training.DisplayAreas')end;net('srp.training.Finish',function()local C=net.ReadPlayer()if!IsValid(C)then return end;if C==LocalPlayer()then srp.training.End()elseif cvar.GetValue('srp_trainingnotif')then srp.notif.Neutral(3,Format('%s (%s) has completed training!',C:Nick(),C:SteamID()))end end)net('srp.training.Rate',function()local D=net.ReadBool()srp.notif.Success(3,'Thank you for your input!')hook.Run('OnTrainingRated',D)end)net('srp.training.Start',function()srp.training.Start()end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingbase_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/traininghangars_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/traininginteractives_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingmodules_ui.lua:
local a={}function a:SetupPanels()self:AddPanel('srp_label',function(b)b:SetTall(70)b:Dock(TOP)b:SetFont'ui_header.xl'self.name=b end)self:AddPanel('srp_label',function(b)b:Dock(TOP)b:SetTall(140)b:SetText''b:SetFont'ui_label.l'self.info=b end)self:AddPanel('ui_scrollpanel',function(c)c:Dock(FILL)c:DockMargin(0,0,0,0)self:AddPanel('srp_grid',function(d)d:SetAutoHeight(true)c:AddItem(d)self.grid=d end)end)end;function a:Populate(e)self.name:SetText(e.title)self.info:SetText(e.text)self:CreateButton()self:CreateModules(e.modules)if e.security then self:CreateSecurityOverview(e.security)end end;function a:CreateModules(f)for g,h in pairs(f)do self:AddPanel('srp_training_module',function(i)i:DockMargin(0,0,0,0)i:Populate(h)i:SetSize((ScrW()-self.padding*2)*.25-10,270)self.grid:AddItem(i)end)end end;function a:CreateSecurityOverview(h)self:AddPanel('srp_training_security',function(i)i:DockMargin(0,0,0,0)i:Populate(h)i:SetSize((ScrW()-self.padding*2)*.25-10,270)self.grid:AddItem(i)end)end;vgui.Register('srp_training_modules',a,'srp_training_base')local a={}function a:Init()self:SetBackgroundColor(col.white_dark)self:DockPadding(5,5,5,5)self:AddPanel('srp_label',function(b)b:Dock(TOP)b:SetContentAlignment(7)b:SetText'Module Name'b:SetFont'ui_label.xl'b:SetTextColor(col.grey_dark)self.name=b end)self:AddPanel('srp_label',function(b)b:Dock(FILL)b:SetContentAlignment(7)b:SetText'Description'b:SetFont'ui_label.l'b:SetWrap(true)b:SetTextColor(col.grey_dark)self.description=b end)self.description:MoveToFront()end;function a:Populate(h)self.name:SetText(h.name)self.description:SetText(h.description)if h.icon then self:AddPanel('srp_image',function(j)j:SetMaterial(h.icon,true)j:SetSize(224,224)j:MoveToBack()self.icon=j end)elseif h.model then self:AddPanel('srp_modelpanel',function(k)k:Dock(FILL)if h.fov then k:SetFOV(h.fov,0)end;local l=k:AddModel(h.model,h.pos,h.ang,h.scale||1)if h.center then k:TryCenter(l)end;self.model=k end)end end;function a:PerformLayout(m,n)if IsValid(self.icon)then local o,p=self.icon:GetWide(),self.icon:GetTall()self.icon:SetPos((m-o)/2,n-p+20)end end;vgui.Register('srp_training_module',a,'srp_panel')local a={}function a:Init()self:SetBackgroundColor(col.white_dark)self:DockPadding(5,5,5,5)self:AddPanel('srp_label',function(b)b:Dock(TOP)b:SetContentAlignment(7)b:SetText'Security Modules'b:SetFont'ui_label.xl'b:SetTextColor(col.grey_dark)b:DockMargin(2,2,2,10)self.name=b end)self:AddPanel('srp_modelpanel',function(k)k:Dock(FILL)k:AddModel('models/props/swdatapad.mdl',Vector(-30,0,0),Angle(0,175,0))self.model=k end)end;local q=Color(255,255,255,100)function a:Populate(h)for g,r in ipairs(h)do self:AddPanel('srp_panel',function(i)i:Dock(TOP)i:SetBackgroundColor(q)i:DockPadding(2,2,2,2)i:DockMargin(2,2,2,2)i:AddPanel('srp_label',function(b)b:Dock(FILL)b:SetText(r)b:SetFont'ui_label.l'b:SetTextColor(col.grey_light)end)end)end end;vgui.Register('srp_training_security',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/voice/voice_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/waterpuddle/water_sh.lua:
srp.activities=srp.activities||{}nw.Register'srp.waterpuddle':Write(net.WriteEntity):Read(net.ReadEntity):SetLocalPlayer():SetHook('OnPlayerPuddle')function PLAYER:SetPuddle(a)self:SetNetVar('srp.waterpuddle',a)end;function PLAYER:GetPuddle()return self:GetNetVar'srp.waterpuddle'end;hook('PlayerTick','srp.activities.FootstepsSlowWater',function(b,c)if IsValid(b:GetPuddle())&&b:GetPuddle():GetClass()=='rp_water'then c:SetMaxSpeed(b:GetRunSpeed()*.6)c:SetMaxClientSpeed(b:GetRunSpeed()*.6)return true end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/ui/attachmentslot_ui.lua:
local a={}function a:Init()self:SetDraggable(false)self.close:SetVisible(false)self:SetTitle'Missing Slot Name'self:DockMargin(0,0,0,0)self:SetTitle''self:SetBackgroundColor(Color(255,255,255,5))end;function a:IsDefault(b,c)local d=weapons.GetStored(b)return d&&d.PresetAttachments&&table.HasValue(d.PresetAttachments,c)end;function a:Populate(b,e,f,g,h)self:SetTitle(f.Name)local h=LocalPlayer():GetActiveWeapon()local i=IsValid(h)&&h.Attachments||{}local j=0;for k,l in ipairs(g)do if l.Hidden then continue end;local m=i[l.slot]&&i[l.slot].id==l.id||self:IsDefault(b,l.id)self:AddPanel('srp_attachmentitem',function(n)n:Dock(TOP)n:Populate(b,e,f,l,m)j=j+1 end)end;self:SetTall(40+j*25)if j==0 then self:Remove()end end;vgui.Register('srp_attachmentslot',a,'srp_window')
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/jedi/ui/powers_ui.lua:
local a={}local b=Color(0,0,0,150)local function c(d,e)return d*(e.UpgradeMultiplier||srp.ForcePowers.UpdatePointsPerLevel)end;function a:Init()self:SetBackgroundColor(col.midnight)self:SetSize(800,400)self:Center()self:MakePopup()self:SetAlpha(0)self:AlphaTo(255,.15,0)self:SetTitle''self.title:SetContentAlignment(5)self.title:Dock(TOP)self.Points=0;self.Powers={}self:AddPanel('srp_grid',function(f)f:Dock(TOP)f:SetTall(150)f:SetSpacing(2,2,true)f:DockMargin(65,10,65,0)f:SetAdjusted(false)self.Grid=f end)self:AddPanel('srp_forcepower_display',function(g)g:Dock(FILL)g:DockMargin(15,15,15,15)self.PowerDisplay=g end)hook('OnForcePowerUpgraded',self,self.OnPowerUpgraded)hook('OnForcePowerPointsChanged',self,function(h,i)self.Points=i end)self:Populate()end;function a:OnRemove()hook.Remove('OnForcePowerUpgraded',self)hook.Remove('OnForcePowerPointsChanged',self)end;function a:OnPowerUpgraded(i,e,d)self.Points=i;if IsValid(self.Powers[id])then self.Powers[id]:Update(d)end end;function a:Populate()local j=true;for id,e in pairs(wOS.AvailablePowers)do if!e.Upgrades then continue end;srp.ui.Create('srp_forcepower',function(g)g:SetSize(48,48)g:Populate(id,e)g:LeftClick(function(h)h:SetDisabled(true,1)self:DisplayPower(h.PowerID,h.Power)end)self.Grid:AddItem(g)self.Powers[id]=g end)if j then j=false;self:DisplayPower(id,e)end end;self.Points=LocalPlayer():GetForcePoints()end;function a:DisplayPower(id,e)self.PowerDisplay:Populate(id,e)end;local k=Material'galactic/ui/scoreboard/header.png'local l=Color(150,50,50,178)local m=Color(14,15,16,222)function a:PaintOver(n,o)local p=350/2000;local q=n*.8;local r=q*p;local s=190;local t=26;local u=(n-s)/2;local v=36;DisableClipping(true)draw.NoTexture()surface.SetDrawColor(m)draw.RoundedBox(6,u,v,s,t,m)surface.SetDrawColor(l)draw.RoundedBox(2,u,v+4,s-40,t-8,l)draw.SimpleText('AVAILABLE FORCE POINTS','ui_label.r',u+(s-40)/2,v+t/2,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)draw.SimpleText(self.Points,'ui_header.r',u+s-20,v+t/2,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)surface.SetDrawColor(255,255,255,255)surface.SetMaterial(k)surface.DrawTexturedRect((n-q)/2,-r/2-10,q,r)DisableClipping(false)end;vgui.Register('srp_forcelevels',a,'srp_window')local a={}function a:Init()self:SetBackgroundColor(col.midnight)self.lbl:Dock(FILL)self:SetContentAlignment(2)self:SetTextColor(col.white)self:SetFont'ui_label.so'self.lbl:DockMargin(0,0,0,3)self:AddPanel('srp_label',function(w)w:Dock(FILL)w:SetContentAlignment(5)w:SetFont'ui_header.rb'w:SetText'0'w:SetMouseInputEnabled(false)w:DockMargin(0,0,0,3)self.LevelLbl=w end)self:AddPanel('DImage',function(x)x:SetVisible(false)x:SetMouseInputEnabled(false)x:SetAlpha(75)self.Image=x end)self.lbl:MoveToFront()hook('OnForcePowerUpgraded',self,self.OnPowerUpgraded)end;function a:OnRemove()hook.Remove('OnForcePowerUpgraded',self)end;function a:Populate(id,e)self.PowerID=id;self.Power=e;local y=e.name;local z=wOS.ForceIcons[e.name]if z then self.Image:SetMaterial(z)self.Image:SetVisible(true)else self:SetBackgroundColor(col.blue_dark)end;self:SetText(e.name:upper())self:UpdatePowerLevel()end;function a:OnPowerUpgraded(i,A,d)if A==self.PowerID then self:Update(d)end end;function a:Update(d)self.Level=d;self.LevelLbl:SetText(d)end;function a:UpdatePowerLevel()self.Level=LocalPlayer():GetForceLevel(self.PowerID)self.LevelLbl:SetText(self.Level)end;function a:PerformLayout(n,o)self.Image:SetSize(n+11,o+11)self.Image:SetPos(-5,-5)end;function a:PaintOver(n,o)if self:IsHovered()then draw.Box(0,0,n,o,b)end end;vgui.Register('srp_forcepower',a,'srp_button')local a={}function a:Init()self:SetBackgroundColor(col.midnight_light)self:AddPanel('srp_panel_rounded',function(g)g:Dock(FILL)g:SetBackgroundColor(col.transparent)g:DockPadding(1,1,1,1)self.Left=g end)self:AddPanel('srp_panel_rounded',function(g)g:Dock(RIGHT)g:SetWide(265)g:SetBackgroundColor(col.midnight)g:DockPadding(2,2,2,2)g.Paint=function(h,n,o)if self.Background then surface.SetDrawColor(255,255,255,5)surface.SetMaterial(self.Background)surface.DrawTexturedRect(0,0,n,o)end end;g:AddPanel('srp_panel_rounded',function(g)g:SetTall(22)g:Dock(TOP)g:SetBackgroundColor(background)g:DockPadding(2,2,2,5)g:AddPanel('srp_label',function(g)g:Dock(FILL)g:SetContentAlignment(4)g:SetFont'ui_label.l'g:SetText'Stats'end)g:AddPanel('srp_label',function(g)g:Dock(RIGHT)g:SetContentAlignment(6)g:SetFont'ui_label.l'g:SetText'0/3'self.Level=g end)end)g:AddPanel('srp_panel_rounded',function(g)g:Dock(FILL)g:DockMargin(0,4,0,0)g:DockPadding(0,0,0,0)g:SetBackgroundColor(col.transparent)self.StatPanel=g end)g:AddPanel('srp_panel',function(g)g:SetTall(22)g:Dock(BOTTOM)g:DockMargin(1,1,1,1)g:DockPadding(0,0,0,0)g:SetBackgroundColor(col.transparent)g:AddPanel('srp_button_rounded',function(B)B:Dock(RIGHT)B:DockMargin(1,1,1,1)B:SetText'LEVEL UP!'B:SetBackgroundColor(l)B:SetHoverColor(m)B:LeftClick(function(h)h:SetDisabled(true,1)self.RefundBtn:SetDisabled(true,1)srp.ForcePowers.RequestUpgrade(self.PowerID)end)self.LevelUpBtn=B end)g:AddPanel('srp_button_rounded',function(B)B:Dock(RIGHT)B:DockMargin(1,1,1,1)B:SetText'REFUND'B:SetBackgroundColor(l)B:SetHoverColor(m)B:SetVisible(false)B:LeftClick(function(h)h:SetDisabled(true,1)self.LevelUpBtn:SetDisabled(true,1)srp.ForcePowers.RequestRefund(self.PowerID)end)self.RefundBtn=B end)end)self.Right=g end)self.Left:AddPanel('srp_panel_rounded',function(g)g:SetTall(50)g:Dock(TOP)g:SetBackgroundColor(col.midnight)g:DockMargin(0,0,4,0)g.Paint=function(h,n,o)if self.Background then surface.SetDrawColor(255,255,255,25)surface.SetMaterial(self.Background)surface.DrawTexturedRect(-n*.25,-n*.25,n*1.5,n*1.5)end end;g:AddPanel('DImage',function(x)x:Dock(LEFT)x:SetWide(42)x:SetMouseInputEnabled(false)self.Image=x end)g:AddPanel('srp_label',function(g)g:Dock(FILL)g:SetContentAlignment(4)g:SetFont'ui_label.xl'self.Name=g end)end)self.Left:AddPanel('srp_label',function(g)g:Dock(FILL)g:SetContentAlignment(7)g:DockMargin(10,10,10,10)g:SetWrap(true)g:SetFont'ui_label.l'self.Description=g end)hook('OnForcePowerUpgraded',self,self.OnPowerUpgraded)end;function a:OnRemove()hook.Remove('OnForcePowerUpgraded',self)end;function a:Populate(id,e)self.PowerID=id;self.Power=e;self.Name:SetText(e.name)local z=wOS.ForceIcons[e.name]local C=e.description||'no description'self.Description:SetText(C)if z then self.Image:SetMaterial(z)self.Image:SetVisible(true)self.Background=z else self.Image:SetVisible(false)self.Background=nil end;self:UpdateStats(0)end;local background=Color(0,0,0,75)function a:DisplayStats(D,E)local F=self.StatPanel:AddPanel('srp_panel_rounded',function(g)g:Dock(E&&RIGHT||LEFT)g:SetWide(125)g:SetBackgroundColor(col.transparent)g:DockMargin(0,0,1,0)g:DockPadding(0,0,0,0)if E then g.PaintOver=function(h,n,o)DisableClipping(true)surface.SetDrawColor(75,75,75,255)surface.DrawLine(-5,0,-5,o)DisableClipping(false)end end end)for id,G in pairs(D)do local y=id:gsub('%u',function(H)return' '..H end)F:AddPanel('srp_panel_rounded',function(g)g:Dock(TOP)g:DockMargin(0,1,0,1)g:DockPadding(0,0,0,0)g:SetBackgroundColor(background)g:AddPanel('srp_label',function(w)w:Dock(FILL)w:DockMargin(0,0,0,0)w:SetText(y)end)local I=tostring(G)local J=false;if isnumber(G)then local K=G>-0.99&&G<10&&(math.Round(G,0)!=G||G==1)I=K&&G*100||G;if K then I=I..'%'elseif I>0 then I='+'..I end elseif G==true then J=true;I=0xf00c elseif G==false then J=true;I=0xf00d end;g:AddPanel('srp_label',function(w)w:Dock(RIGHT)w:SetWide(40)w:DockMargin(0,0,0,0)w:SetBackgroundColor(E&&col.blue||col.black)w:SetContentAlignment(5)w:SetText(I,J)if J then w:SetFont'SSRPForkAwesome'end end)end)end;return F end;function a:OnPowerUpgraded(i,e,d)self:UpdateStats()end;function a:UpdateStats()self.StatPanel:Clear()if!self.Power.Upgrades then self.RefundBtn:SetVisible(false)self.LevelUpBtn:SetVisible(false)return end;local d=(LocalPlayer():GetForceLevel(self.PowerID)||0)+1;local L=self.Power.Upgrades&&#self.Power.Upgrades||0;local M=d>=L;self.Level:SetText(d-1 ..'/'..L-1)local N=self.Power.Upgrades[d]||self.Power.Upgrades[#self.Power.Upgrades]local O;if N then O=self:DisplayStats(N,false)end;local P=!M&&self.Power.Upgrades[d+1]if P then self:DisplayStats(P,true)elseif IsValid(O)then O:Dock(FILL)end;local Q=LocalPlayer()local R=Q:GetForcePoints()local S=c(d,self.Power)if M then self.LevelUpBtn:SetDisabled(true)self.LevelUpBtn:SetText'MAX LEVEL'else self.LevelUpBtn:SetDisabled(R<S)self.LevelUpBtn:SetText('SPEND '..S..' POINTS')end;self.LevelUpBtn:SetVisible(true)self.RefundBtn:SetVisible(d>1)end;vgui.Register('srp_forcepower_display',a,'srp_panel_rounded')local a={}function a:Init()self:SetText'Force Levels'self:Dock(RIGHT)self:SetWide(100)self:LeftClick(function(h)srp.ui.Create'srp_forcelevels'end)end;function a:Populate()end;vgui.Register('srp_forcepower_button',a,'srp_button_rounded')concommand.AddDev('srp_forcepowers',function()srp.ui.Create'srp_forcelevels'end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/jetpack/ui/jetpack_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/jetpack/ui/jetpack_ui.lua:
local a={}function a:Init()self.outline=col.black;self:SetSize(330,40)self:DockPadding(0,0,0,0)self:AddPanel('srp_button',function(b)b:DockMargin(0,0,0,0)b:Dock(LEFT)b:SetWide(100)b:SetText'Disable Jetpack'b:SetTextColor(col.red)b:SetBackgroundColor(col.transparent)b:LeftClick(function(c)local d=self:GetJetpack()if!IsValid(d)then return end;local e=!d:GetEnabled()RunConsoleCommand('srp_jetpack')if e then c:SetText'Disable Jetpack'c:SetTextColor(col.red)else c:SetText'Enable Jetpack'c:SetTextColor(col.blue)end end)end)self:AddPanel('srp_button',function(b)b:SetText'Fuel: 0%'b:DockMargin(0,0,0,0)b:Dock(RIGHT)b:SetWide(120)b:SetTextColor(col.grey)self.fuel=b end)self:SetPos(630,1)end;function a:Think()if!self.fuel then return end;local f=LocalPlayer():GetFuel()||0;self.fuel:SetText('Jetpack Fuel: '..f)self.fuel:SetBackgroundColor(Color(255-255*f/100,255*f/100,0,100))end;function a:GetJetpack()return LocalPlayer():GetJetpack()end;local g=Color(0,0,0,200)local h=Color(10,10,10)function a:Paint(i,j)surface.SetDrawColor(g)surface.DrawRect(0,0,i,j)surface.SetDrawColor(h)surface.DrawOutlinedRect(0,0,i,j)end;vgui.Register('srp_jetpack',table.Copy(a),'srp_panel')
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/cosmetics/apparel_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/cosmetics/sabers_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/credits/knives_sh.lua:
function SWB_RegisterSound(a,b,c,d,e)local f={channel=CHAN_STATIC,volume=1,level=c,name=a,sound=b,pitchstart=d,pitchend=e}sound.Add(f)end;SWB_RegisterSound("SWB_Empty","weapons/shotgun/shotgun_empty.wav",60,95,112)SWB_RegisterSound("SWB_Knife_Hit",{"weapons/knife/knife_hit1.wav","weapons/knife/knife_hit2.wav","weapons/knife/knife_hit3.wav","weapons/knife/knife_hit4.wav"},70,92,122)SWB_RegisterSound("SWB_Knife_HitElse","weapons/knife/knife_hitwall1.wav",70,92,122)SWB_RegisterSound("SWB_Knife_Swing",{"weapons/knife/knife_slash1.wav","weapons/knife/knife_slash2.wav"},65,92,122)local g={{'perma_knife_bayonet_knife_|_night','Bayonet | Night','knife_bayonet_night','models/weapons/w_csgo_bayonet.mdl','models/csgo_knife/knife_bayonet_night.vmt',7},{'perma_knife_shadow_daggers_|_fade','Shadow | Fade','knife_daggers_fade','models/weapons/w_csgo_push.mdl','models/csgo_knife/knife_push_fade.vmt',5},{'perma_knife_butterfly_knife_|_slaughter','Butterfly | Slaughter','knife_butterfly_slaughter','models/weapons/w_csgo_butterfly.mdl','models/csgo_knife/knife_butterfly_slaughter.vmt',8},{'perma_knife_huntsman_knife_|_tiger_tooth','Huntsman | Tiger Tooth','knife_huntsman_tiger','models/weapons/w_csgo_tactical.mdl','models/csgo_knife/knife_tactical_tiger.vmt',9},{'perma_knife_huntsman_knife_|_boreal_forest','Huntsman | Boreal Forest','knife_huntsman_boreal','models/weapons/w_csgo_tactical.mdl','models/csgo_knife/knife_tactical_boreal.vmt',1},{'perma_knife_gut_knife_|_case_hardened','Gut | Case Hardened','knife_gut_case','models/weapons/w_csgo_gut.mdl','models/csgo_knife/knife_gut_case.vmt',2},{'perma_knife_bowie_knife','Bowie Knife','knife_bowie','models/weapons/w_csgo_bowie.mdl'},{'perma_knife_falchion_knife_|_crimson_webs','Falchion | Crimson Webs','knife_falchion_crimsonwebs','models/weapons/w_csgo_falchion.mdl','models/csgo_knife/knife_falchion_crimsonwebs.vmt',3},{'perma_knife_flip_knife_|_fade','Flip | Fade','knife_flip_fade','models/weapons/w_csgo_flip.mdl','models/csgo_knife/knife_flip_fade.vmt',6},{'perma_knife_bayonet_knife_|_slaughter','Bayonet | Slaughter','knife_bayonet_slaughter','models/weapons/w_csgo_bayonet.mdl','models/csgo_knife/knife_bayonet_slaughter.vmt',8},{'perma_knife_bowie_knife_|_forest_ddpat','Bowie | Forest','knife_bowie_ddpat','models/weapons/w_csgo_bowie.mdl','models/csgo_knife/knife_survival_ddpat.vmt',4},{'perma_knife_butterfly_knife_|_night','Butterfly | Night','knife_butterfly_night','models/weapons/w_csgo_butterfly.mdl','models/csgo_knife/knife_butterfly_night.vmt',7},{'perma_knife_default_t_knife_|_golden','Default T | Golden','knife_default_t_golden','models/weapons/w_csgo_default_t.mdl','models/csgo_knife/knife_t_golden.vmt',1},{'perma_knife_falchion_knife_|_tiger_tooth','Falchion | Tiger Tooth','knife_falchion_tiger','models/weapons/w_csgo_falchion.mdl','models/csgo_knife/knife_falchion_tiger.vmt',9},{'perma_knife_flip_knife_|_crimson_webs','Flip | Crimson Webs','knife_flip_crimsonwebs','models/weapons/w_csgo_flip.mdl','models/csgo_knife/knife_flip_crimsonweb.vmt',3},{'perma_knife_gut_knife','Gut Knife','knife_gut','models/weapons/w_csgo_gut.mdl'},{'perma_knife_karambit_knife_|_fade','Karambit | Fade','knife_karambit_fade','models/weapons/w_csgo_karambit.mdl','models/csgo_knife/karam_fade.vmt',6},{'perma_knife_m9_bayonet_knife_|_ultraviolet','Bayonet | Ultraviolet','knife_m9_ultraviolet','models/weapons/w_csgo_m9.mdl','models/csgo_knife/knife_m9_ultraviolet.vmt',10},{'perma_knife_shadow_daggers_|_damascus_steel','Shadow | Damascus','knife_daggers_damascus','models/weapons/w_csgo_push.mdl','models/csgo_knife/knife_push_damascus.vmt',3},{'perma_knife_karambit_lore','Karambit | Lore','knife_karambit_lore','models/weapons/w_csgo_karambit.mdl','models/csgo_knife/karam_lore.vmt',19},{'perma_knife_bayonet_fade','Bayonet | Fade','knife_bayonet_fade','models/weapons/w_csgo_bayonet.mdl','models/csgo_knife/knife_bayonet_fade.vmt',6},{'perma_knife_butterfly_crimsonweb','Butterfly | Crimsonweb','knife_butterfly_crimsonweb','models/weapons/w_csgo_butterfly.mdl','models/csgo_knife/knife_butterfly_crimsonweb.vmt',3},{'perma_knife_butterfly_damascus','Butterfly | Damascus','knife_butterfly_damascus','models/weapons/w_csgo_butterfly.mdl','models/csgo_knife/knife_butterfly_dam.vmt',4},{'perma_knife_falchion_freehand','Falchion | Freehand','knife_falchion_freehand','models/weapons/w_csgo_falchion.mdl','models/csgo_knife/knife_falchion_freehand.vmt',17},{'perma_knife_flip_autotronic','Flip | Autotronic','knife_flip_autotronic','models/weapons/w_csgo_flip.mdl','models/csgo_knife/knife_flip_autotronic.vmt',14},{'perma_knife_gut_laminate','Gut | Black Laminate','knife_gut_laminate','models/weapons/w_csgo_gut.mdl','models/csgo_knife/knife_gut_black_laminate.vmt',15},{'perma_knife_gut_lore_vladdy','Gut | Lore Vladdy','knife_gut_lore_vladdy','models/weapons/w_csgo_gut.mdl','models/csgo_knife/knife_gut_lore.vmt',19},{'perma_knife_m9_bayonet_lore','M9 Bayonet | Lore','knife_m9_bayonet_lore','models/weapons/w_csgo_m9.mdl','models/csgo_knife/knife_m9_lore.vmt',19},{'perma_knife_shadow_default','Shadow | Default','knife_shadow_default','models/weapons/w_csgo_push.mdl','models/csgo_knife/knife_push.vmt',0},{'perma_knife_shadow_freehand','Shadow | Freehand','knife_shadow_freehand','models/weapons/w_csgo_push.mdl','models/csgo_knife/knife_push_freehand.vmt',18},{'perma_knife_huntsman_marble_fade','Huntsman | Marble Fade','knife_huntsman_marble_fade','models/weapons/w_csgo_tactical.mdl','models/csgo_knife/knife_tactical_marblefade.vmt',13},{'perma_knife_bowie_rust_coat','Bowie | Rust Coat','knife_bowie_rust_coat','models/weapons/w_csgo_bowie.mdl','models/csgo_knife/knife_survival_rustcoat.vmt',12,true}}local h=srp.shop.Add('Basic Knife','perma_knife'):SetCat('Knives'):SetPrice(500):SetWeapon('swb_knife'):SetDesc('Default Knife'):SetIcon('models/weapons/w_knife_t.mdl'):SetStackable(false)h.SWEP='swb_knife'for i,j in ipairs(g)do weapons.Register({Weight=5,AutoSwitchTo=false,AutoSwitchFrom=false,PrintName=j[2],DrawAmmo=false,DrawCrosshair=true,ViewModelFOV=65,ViewModelFlip=false,CSMuzzleFlashes=true,UseHands=true,Slot=3,SlotPos=0,Base='baseknife',Category='SUP Weapons',Spawnable=j[7]||false,AdminSpawnable=false,ViewModel=string.Replace(j[4],'/w_','/v_'),WorldModel=j[4],DrawWeaponInfoBox=false,Weight=5,AutoSwitchTo=false,AutoSwitchFrom=false,Skin=j[5],SkinIndex=j[6]||0,IsKnife=true},j[3])local h=srp.shop.Add(j[2],j[1]):SetCat('Knives'):SetPrice(700):SetIcon(j[4]):SetStackable(false):SetDesc(j[2]):SetWeapon(j[3])h.Skin=j[5]h.SkinIndex=j[6]||0;h.SWEP=j[3]end;srp.shop.Add('ALL Knives','ltv_all_knives'):SetDesc('Gives you ALL of the permanent knives at a discount.\nPrice is automatically discounted for knives you already own.'):SetImage('knife-block2.png'):SetMinimumLTV(100,true):SetPrice(0):SetStackable(true):SetGetPrice(function(self,k)local l=0;if!k:HasUpgrade('perma_knife')then l=l+srp.shop.GetByUID('perma_knife'):GetPrice(k)*0.9 end;for i,j in ipairs(g)do if!k:HasUpgrade(j[1])then l=l+srp.shop.GetByUID(j[1]):GetPrice(k)*0.9 end end;return l end):SetOnBuy(function(self,k)for i,j in ipairs(g)do local m=j[1]if!k:HasUpgrade(m)then srp.shop.AddUpgrade(k,m,function()if IsValid(k)then srp.shop.GetByUID(m):OnBuy(k)end end)end end;if!k:HasUpgrade('perma_knife')then srp.shop.AddUpgrade(k,'perma_knife',function()if IsValid(k)then srp.shop.GetByUID('perma_knife'):OnBuy(k)end end)end end):SetCanBuy(function(self,k,n)if!k:HasUpgrade('perma_knife')then return true end;for i,j in ipairs(g)do if!k:HasUpgrade(j[1])then return true end end;return false,'You already own all the knives!'end):SetCanSee(function(self,k)return self:GetPrice(k)>0 end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/gamemaster/realtimestrategy/npcs_sh.lua:
local a=FindMetaTable'NPC'local b={{name='Fear',func=a.FearSound},{name='Alert',func=a.AlertSound},{name='Found Enemy',func=a.FoundEnemySound},{name='Lost Enemy',func=a.LostEnemySound},{name='Idle',func=a.IdleSound}}local c={{name='Start',key='Resume'},{name='Stop',key='Stop'}}function L(d)for e,f in ipairs(ents.FindByClass'npc_*')do local g=f:GetPos()+Vector(math.random(-215,215),math.random(-215,215),0)f:NavSetGoalPos(g)f:SendSchedule(d)end end;srp.rts.Register'move':SetName'Move':SetDescription'Move unit(s) to position':SetIcon(Material('materials/galactic/ui/rts/move.png','smooth noclamp')):SetKey(KEY_M):SetWorldClick():SetServersideAction():SetSelectionRequired(true):OnWorldClick(function(self,h,i,j)local k=h:KeyDown(IN_SPEED)local l=#i==1;for e,m in ipairs(i)do m:MarkEnemyAsEluded()m:SetSaveValue('m_bShouldPatrol',false)local n=(m:GetPos()-j):GetNormalized()*math.random(30,50)local g=l&&j||j+n;m:SetSaveValue('m_vecLastPosition',g)m:SendSchedule(k&&SCHED_FORCED_GO||SCHED_FORCED_GO_RUN)end end)srp.rts.Register'guard':SetName'Guard':SetDescription'Change to another target if one is better':SetIcon(Material('materials/galactic/ui/rts/guard.png','smooth noclamp')):SetKey(KEY_G):SetServersideAction():SetSelectionRequired(true):OnSelected(function(self,h,i,j)for e,m in ipairs(i)do m:MarkEnemyAsEluded()m:SetSaveValue('m_bShouldPatrol',false)m:SendSchedule(SCHED_AMBUSH)end end)srp.rts.Register'wander':SetName'Wander':SetKey(KEY_X):SetDescription'Wander in a random area':SetIcon(Material('materials/galactic/ui/rts/patrol.png','smooth noclamp')):SetServersideAction():SetSelectionRequired(true):OnSelected(function(self,h,i)for e,m in ipairs(i)do m:MarkEnemyAsEluded()m:ClearSchedule()m:SetSaveValue('m_bShouldPatrol',true)end end)srp.rts.Register'cover':SetName'Covering':SetKey(KEY_K):SetDescription'Try to find the best position to attack':SetIcon(Material('materials/galactic/ui/rts/cover.png','smooth noclamp')):SetServersideAction():SetSelectionRequired(true):OnSelected(function(self,h,i,j)for e,m in ipairs(i)do m:MarkEnemyAsEluded()m:SetSaveValue('m_bShouldPatrol',false)m:SendSchedule(SCHED_TAKE_COVER_FROM_ORIGIN)end end)srp.rts.Register'stop':SetName'Stop':SetKey(KEY_R):SetDescription'Stops what you\'re doing.':SetIcon(Material('materials/galactic/ui/rts/waiting.png','smooth noclamp')):SetServersideAction():SetSelectionRequired(true):OnSelected(function(self,h,i,j)for e,m in ipairs(i)do m:MarkEnemyAsEluded()m:SetSaveValue('m_bShouldPatrol',false)m:ClearSchedule()m:SendSchedule(SCHED_FAIL)end end)srp.rts.Register'runaway':SetName'Run Away':SetDescription'Stop and run off.':SetIcon(Material('materials/galactic/ui/rts/return.png','smooth noclamp')):SetServersideAction():SetSelectionRequired(true):OnSelected(function(self,h,i,j)for e,m in ipairs(i)do m:MarkEnemyAsEluded()m:SetSaveValue('m_bShouldPatrol',false)m:SendSchedule(SCHED_RUN_FROM_ENEMY_FALLBACK)end end)srp.rts.Register'ignite':SetName'Ignite':SetKey(KEY_I):SetDescription'Kills the selected unit(s)':SetIcon(Material('materials/galactic/ui/rts/fire.png','smooth noclamp')):SetServersideAction():SetSelectionRequired(true):OnSelected(function(self,h,i,j)for e,m in ipairs(i)do m:Ignite(5)end end)srp.rts.Register'die':SetName'Die':SetKey(KEY_DELETE):SetDescription'Kills the selected unit(s)':SetIcon(Material('materials/galactic/ui/rts/die.png','smooth noclamp')):SetServersideAction():SetSelectionRequired(true):OnSelected(function(self,h,i,j)for e,m in ipairs(i)do m:TakeDamage(m:Health()+1)end end)local o=Material('materials/galactic/ui/rts/interact.png','smooth noclamp')srp.rts.Register'unit_npc':SetName'NPC':SetDescription'Interacts with a target':SetConfigPanel'srp_rtscfg_npc':SetUnit():KeepData():SetSharedAction():SetDataDefinition('health',100,net.ReadUInt,net.WriteUInt,10):SetDataDefinition('class','npc_snowdroidb2f'):SetDataDefinition('weapon','weapon_e5'):OnValidate(function(self,p)return p.class&&p.weapon&&p.health end):OnGetIcon(function(self,p)if!p then return o end;local q=list.Get('NPC')[p.class]if q.Model then return q.Model else return o end end):OnSelected(function(self,h,i,r)if CLIENT&&r then self:SetData('class',r.class||'npc_snowdroidb2f')self:SetData('weapon',r.weapon||'weapon_e5')self:SetData('health',r.health||100)end;return true end):OnWorldClick(function(self,h,i,j)if CLIENT then return end;local s=self:GetData(h,'class')local m=srp.npc.Spawn(s,j,self:GetData(h,'weapon'),h)m:SetHealth(self:GetData(h,'health'))m:SetMaxHealth(self:GetData(h,'health'))end)srp.rts.Register'ctx_npc_sounds':SetName'Sounds':SetIcon('icon16/sound.png'):SetServersideAction():SetContextual():SetSubContexts(function(self,i,t)local m=i[1]if!IsValid(m)||!m:IsNPC()then return end;local u={}for v,p in ipairs(b)do table.insert(u,{name=p.name,value=v})end;return u end):OnSelected(function(self,h,i,t)local v=self:GetData(h,'context1')v=tonumber(v)local w=b[v]||b[1]if!w then return end;for e,m in ipairs(i)do if m:IsNPC()then w.func(m)end end end)srp.rts.Register'ctx_npc_dropweapon':SetName'Drop Weapon':SetIcon('icon16/bin.png'):SetServersideAction():SetContextual(function(x,s,m)return m:IsNPC()end):OnSelected(function(self,h,i,t,j)for e,m in ipairs(i)do if m:IsNPC()then m:DropWeapon(nil,m:GetShootPos()+m:GetAimVector()*10,Vector(0,0,50))end end end)if!info.Main then srp.rts.Register'ctx_npc_train':SetName'Train':SetIcon('icon16/car.png'):SetServersideAction():SetContextual({'func_tracktrain'}):SetSubContexts(function(self,i,t)local m=i[1]if!IsValid(m)then return end;local u={}for v,p in ipairs(c)do table.insert(u,{name=p.name,value=v})end;return u end):OnSelected(function(self,h,i,t)local v=self:GetData(h,'context1')v=tonumber(v)local w=c[v]||c[1]if!w then return end;for e,m in ipairs(i)do m:Fire(w.key,'1')end end)end
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/cosmetic_sh.lua:
srp.items.RegisterBase('COSMETIC',{name='Cosmetic',icon='materials/galactic/logo_white_128.png',model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/items/harvesting/slicing/slicing_footlocker_panel.mdl',maxstack=5,gui_position=Vector(0,0,40),interaction={Use={label='Use',count=1,callback=function(self,a,b,c,d)if istable(self.cosmetic)then for e,f in ipairs(self.cosmetic)do cosmetics.Give(a,f,nil,e>1)end;return true else return cosmetics.Give(a,self.cosmetic)end;return false end},OnPickup={label='Pickup',callback=function(self,a,b,c,d,g)local h=b:AddItem(self,d)if h then g:EmitSound('items/ammocrate_close.wav')return true else return false end end}}})local i='materials/galactic/seasonal/christmas/winter hat.png'srp.items.Register('Cosmetics','COSMETIC_BONKBEANIE',{base='COSMETIC',name='Bonk Beanie',cosmetic='winter_beanie',maxstack=5,description='A cosy bonk beanie for yourself!',icon=i,tradedisabled=true,nodrop=true,trade='TOKEN_XMAS',tradeamount=200,tradecolor=col.blue_light:Copy()})srp.items.Register('Cosmetics','COSMETIC_BONKBEANIE2',{base='COSMETIC',name='Bonk Beanie 2',cosmetic='winter_beanie2',maxstack=5,description='A cosy bonk beanie alternative for yourself!',icon=i,tradedisabled=true,nodrop=true,trade='TOKEN_XMAS',tradeamount=200,tradecolor=col.blue_light:Copy()})srp.items.Register('Cosmetics','COSMETIC_WONDERWOOL',{base='COSMETIC',name='Wanderers Wool',cosmetic='winter_wandererswool',maxstack=5,description='Wooly wonderful wonderland',icon=i,tradedisabled=true,nodrop=true,trade='TOKEN_XMAS',tradeamount=200,tradecolor=col.blue_light:Copy()})srp.items.Register('Cosmetics','COSMETIC_NIGHTCAP',{base='COSMETIC',name='Nightcap',cosmetic='winter_nightcap',maxstack=5,description='Sleepy time',icon=i,tradedisabled=true,nodrop=true,trade='TOKEN_XMAS',tradeamount=200,tradecolor=col.blue_light:Copy()})srp.items.Register('Cosmetics','COSMETIC_SUNRISE',{base='COSMETIC',name='Sunrise',cosmetic='effect_sunrise',maxstack=5,description='Suns up',icon='materials/galactic/seasonal/christmas/sunrise.png',tradedisabled=true,nodrop=true,trade='TOKEN_XMAS',tradeamount=300,tradecolor=col.blue_light:Copy()})srp.items.Register('Cosmetics','COSMETIC_SUNSET',{base='COSMETIC',name='Sunset',cosmetic='effect_sunset',maxstack=5,description='Suns down',icon='materials/galactic/seasonal/christmas/sunset.png',tradedisabled=true,nodrop=true,trade='TOKEN_XMAS',tradeamount=300,tradecolor=col.blue_light:Copy()})local j='materials/galactic/ui/inventory/crystal.png'local k='materials/galactic/ui/inventory/hilt.png'local function l(self,a)local m=a:GetGroupClass()if!m||m.id!='JEDISA'&&m.id!='JEDIMASTERSA'then return info.Dev,"Requires Saber Artisan"else return true end end;local n={'models/swtor/arsenic/lightsabers/zakuulan\'smk-2polesaber.mdl','models/swtor/arsenic/lightsabers/zakuulan\'smk-1polesaber.mdl','models/swtor/arsenic/lightsabers/warmaster\'sdoublebladedlightsaber.mdl','models/swtor/arsenic/lightsabers/vindicator\'ssaberstaff.mdl','models/swtor/arsenic/lightsabers/vigorousbattlerdualsaber.mdl','models/swtor/arsenic/lightsabers/vengeance\'sunsealedsaberstaff.mdl','models/swtor/arsenic/lightsabers/vengeance\'sunsealedlightsaber.mdl','models/swtor/arsenic/lightsabers/unstablepeacemaker\'sdualsaber.mdl','models/swtor/arsenic/lightsabers/unstablearbiter\'slightsaber.mdl','models/swtor/arsenic/lightsabers/unstablearbiter\'sdualsaber.mdl','models/swtor/arsenic/lightsabers/unrelentingaggressordualsaber.mdl','models/swtor/arsenic/lightsabers/tythianlightsaber.mdl','models/swtor/arsenic/lightsabers/temptedapprentice\'sdualsaber.mdl','models/swtor/arsenic/lightsabers/strongholddefender\'ssaberstaff.mdl','models/swtor/arsenic/lightsabers/strongholddefender\'slightsaber.mdl','models/swtor/arsenic/lightsabers/serenity\'sunsealedsaberstaff.mdl','models/swtor/arsenic/lightsabers/senyatirall\'slightsaber-cartel.mdl','models/swtor/arsenic/lightsabers/sateleshan\'sdualsaber.mdl','models/swtor/arsenic/lightsabers/rishi\'smk-1polesaber.mdl','models/swtor/arsenic/lightsabers/revanite\'smk-2polesaber.mdl','models/swtor/arsenic/lightsabers/revanite\'smk-1polesaber.mdl','models/swtor/arsenic/lightsabers/retribution\'sexposedsaberstaff.mdl','models/swtor/arsenic/lightsabers/retribution\'sexposedlightsaber.mdl','models/swtor/arsenic/lightsabers/redeemer\'sstarforgeddualsaber.mdl','models/swtor/arsenic/lightsabers/reckoning\'sexposedsaberstaff.mdl','models/swtor/arsenic/lightsabers/prophet\'sstarforgeddualsaber.mdl','models/swtor/arsenic/lightsabers/pitilessraiderlightsaber.mdl','models/swtor/arsenic/lightsabers/outlanderpolesaber2.mdl','models/swtor/arsenic/lightsabers/outlanderpolesaber.mdl','models/swtor/arsenic/lightsabers/occultists\'polesabermk1.mdl','models/swtor/arsenic/lightsabers/mytaglightsaber.mdl','models/swtor/arsenic/lightsabers/iokathmk-4saberstaff.mdl','models/swtor/arsenic/lightsabers/inscrutabledualsaber.mdl','models/swtor/arsenic/lightsabers/indomitablevanquisher\'ssaberstaff.mdl','models/swtor/arsenic/lightsabers/ice-jewellightsaber.mdl','models/swtor/arsenic/lightsabers/hiridusaberstaff.mdl','models/swtor/arsenic/lightsabers/hermit\'spolesaber.mdl','models/swtor/arsenic/lightsabers/herald\'spolesaber.mdl','models/swtor/arsenic/lightsabers/grantekf11-ddualsaber.mdl'}for e=1,#n do local o=n[e]local f='JEDI_QHILT_'..e;cosmetics.RegisterItem('ls_qhilt'..e):SetName('Quest Hilt '..e):SetType(cosmetics.SABER):SetSlot(cosmetics.SLOT.SABER.HILT):SetClass('saber'):SetIcon(icon):SetModel(o):SetDrawModel(true)srp.items.Register('The Order',f,{base='COSMETIC',name='Jedi Quest Hilt '..e,cosmetic='ls_qhilt'..e,maxstack=5,description='A hilt unlocked through quests.',model=o,icon=k,craftingOffset=5,RenderIcon=true,tradedisabled=true,RenderSettings={UseMaterial=true,IconRenderModel='models/swtor/arsenic/lightsabers/ice-jewellightsaber.mdl',IconRenderPos=Vector(200.000000,-9.488582,28.326429),IconRenderAngle=Angle(60.843586,68.573265,39.690990),IconRenderScale=5.398292,Imgw=1024,Imgh=1024}})srp.crafting.Register('Hilts',f,{name='Jedi Quest Hilt '..e,description='Refines metal and crystals into a hilt to be used in the cosmetics window. Can be crafted once every 2 days.',icon=Material'materials/galactic/ui/inventory/hilt.png',creates=f,count=1,cost=500,time=30,CanView=l,items={JEDI_CRYSTAL=2,METAL_REFINED_METAL=15}})end;local function p(self,a,d)srp.groups.Get('JEDI'):AddLog('GroupLogCrystal',a,self.name,d)end;local function q(self,a,d)srp.groups.Get('JEDI'):AddLog('OnItemPickedUp',a,self.name,d||1)end;local function r(self,a,d)srp.groups.Get('JEDI'):AddLog('OnItemDropped',a,self.name,d||1)end;local s=Material'materials/galactic/ui/inventory/crystal.png'local t={['Dark Orange']={color=Color(160,53,0),blades={'unstable','infused'}},['Pink Red']={color=Color(212,39,134),blades={'unstable','infused'}},['Maroon']={color=Color(125,0,0),blades={'unstable','infused'}},['Royal Purple']={color=Color(114,0,255),blades={'unstable','infused'}},['Cloud Blue']={color=Color(127,159,255),blades={'unstable','infused'},steamid='STEAM_0:0:33122264',craft=false},['Ichigo']={color=Color(127,159,255),blades={'unstable','infused'},steamid='STEAM_0:0:147454548',craft=false},['Qixoni']={color=Color(178,33,71),blades={'unstable','infused'},steamid='STEAM_0:1:192973846',craft=false},['JAX1']={color=Color(45,55,90),blades={'diamond'},steamid='STEAM_0:1:192973846',craft=false},['SCOTT1']={color=Color(45,55,90),blades={'diamond'},steamid='STEAM_0:1:26675200',craft=false},['MOE1']={color=Color(191,127,255),blades={'unstable','infused'},steamid='STEAM_0:0:157640372',craft=false},['MOE2']={color=Color(63,79,127),blades={'unstable','infused'},steamid='STEAM_0:0:157640372',craft=false},['DEXTER1']={color=Color(69,236,236),blades={'unstable','infused'},steamid='STEAM_0:0:67643484',craft=false},['DEXTER2']={color=Color(255,0,191),blades={'unstable','infused'},steamid='STEAM_0:0:67643484',craft=false},['LEO1']={color=Color(223,10,238),blades={'unstable','infused'},steamid='STEAM_0:1:461535996',craft=false},['LEO2']={color=Color(109,0,234),blades={'unstable','infused'},steamid='STEAM_0:1:461535996',craft=false},['NEXU1']={color=Color(50,0,108),blades={'unstable_alt','infused'},steamid='STEAM_0:1:218906012',craft=false},['NEXU2']={color=Color(133,45,0),blades={'unstable_alt','infused'},steamid='STEAM_0:1:218906012',craft=false},['SHIRO1']={color=Color(210,75,66),blades={'unstable_alt','infused_alt'},steamid='STEAM_0:1:112569531',craft=false},['SHIRO2']={color=Color(56,135,219),blades={'unstable_alt','infused_alt'},steamid='STEAM_0:1:112569531',craft=false},['SINNER1']={color=Color(0,0,100),blades={'unstable','infused'},steamid='STEAM_0:0:512600350',craft=false},['SINNER2']={color=Color(191,127,255),blades={'unstable','infused'},steamid='STEAM_0:0:512600350',craft=false},['LIGHTNINGFIELD1']={color=Color(250,250,250),blades={'unstable','infused'},steamid='STEAM_0:0:133230972',craft=false},['LIGHTNINGFIELD2']={color=Color(5,5,195),blades={'unstable','infused'},steamid='STEAM_0:0:133230972',craft=false},['DREADSK1']={color=Color(247,101,101),blades={'unstable','infused'},steamid='STEAM_0:0:467347655',craft=false},['DREADSK2']={color=Color(255,255,255),blades={'unstable_alt','infused_alt'},steamid='STEAM_0:0:467347655',craft=false},['LAMIT1']={color=Color(10,65,115),blades={'unstable','infused'},steamid='STEAM_0:0:160269717',craft=false},['LAMIT2']={color=Color(103,110,27),blades={'unstable_alt','infused_alt'},steamid='STEAM_0:0:160269717',craft=false},['FREYA1']={color=Color(75,0,130),blades={'unstable','infused'},steamid='STEAM_0:0:173809331',craft=false},['FREYA2']={color=Color(15,15,175),blades={'unstable_alt','infused_alt'},steamid='STEAM_0:0:173809331',craft=false},['AEDIUS1']={color=Color(172,119,27),blades={'unstable','infused'},steamid='STEAM_0:1:61544172',craft=false},['AEDIUS2']={color=Color(68,15,132),blades={'unstable','infused'},steamid='STEAM_0:1:61544172',craft=false},['BARRETT1']={color=Color(0,255,8),blades={'unstable_alt','infused'},steamid='STEAM_0:0:83032611',craft=false},['BARRETT2']={color=Color(0,0,205),blades={'unstable_alt','infused'},steamid='STEAM_0:0:83032611',craft=false},['RENJI1']={color=Color(113,54,191),blades={'unstable_alt','infused'},steamid='STEAM_0:0:110895033',craft=false},['RENJI2']={color=Color(186,47,91),blades={'unstable_alt','infused'},steamid='STEAM_0:0:110895033',craft=false},['TEBANU1']={color=Color(102,0,204),blades={'unstable_alt','infused_alt'},steamid='STEAM_0:1:59251549',craft=false},['TEBANU2']={color=Color(0,204,0),blades={'unstable_alt','infused_alt'},steamid='STEAM_0:1:59251549',craft=false},['GonnjA']={color=Color(118,161,255),blades={'unstable','infused'},steamid='STEAM_0:1:156153628',craft=false},['GonnjB']={color=Color(122,155,255),blades={'unstable','infused'},steamid='STEAM_0:1:156153628',craft=false},['CRAFTER']={color=Color(150,15,20),blades={'unstable_alt','infused_alt'},steamid='STEAM_0:0:518257103',craft=false},['STORYZ']={color=Color(191,255,127),blades={'unstable_alt','infused_alt'},steamid='STEAM_0:0:565471658',craft=false},['OTTERGREEN']={color=Color(60,179,113),blades={'unstable_alt','infused_alt'},steamid='STEAM_0:1:48720363',craft=false},['OTTER']={color=Color(0,255,255),blades={'unstable_alt','infused_alt'},steamid='STEAM_0:1:48720363',craft=false},['Pink']=Color(255,105,180),['Orange']=Color(255,76,0),['Burgundy']=Color(75,47,47),['Ice']=Color(0,123,255),['Purified White']=Color(52,56,58),['Cyan']=Color(0,255,249),['Hurricane Green']=Color(44,153,58),['Brown Yellow']=Color(144,109,11),['Light Navy Blue']=Color(11,84,110),['Steel Blue']=Color(70,130,180),['Dark Green']=Color(36,64,30),['Gold']=Color(105,109,69),['Dark Gold']=Color(184,132,11),['Grass Green']=Color(7,74,24),['Lime Green']=Color(0,255,0),['Sea Green']=Color(60,179,113),['Dark Purple']=Color(68,15,132),['Guardian Blue']=Color(0,0,205),['Consular Green']=Color(127,255,0),['Sentinel Yellow']=Color(255,255,51)}cosmetics.RegisterItem('ls_c_scott'):SetName('Scott Crystal'):SetType(cosmetics.SABER):SetSlot(cosmetics.SLOT.SABER.COLOR):SetClass('saber'):SetIcon(s):SetColor(Color(127,255,0)):SetMeta('Blade','scott')for u,v in pairs(t)do local w=cosmetics.RegisterItem('ls_c'..u):SetName(u):SetType(cosmetics.SABER):SetSlot(cosmetics.SLOT.SABER.COLOR):SetClass('saber'):SetIcon(s):SetColor(v.color||v):SetMeta('BladeList',v.blades)if v.steamid then w:SetRequiredSteamID(v.steamid)end;local x={'ls_c'..u}if v.blades then for e,y in ipairs(v.blades)do local z='ls_c'..u..'_'..y;local A=cosmetics.RegisterItem(z):SetName(u..' ('..y..')'):SetType(cosmetics.SABER):SetSlot(cosmetics.SLOT.SABER.COLOR):SetClass('saber'):SetIcon(s):SetColor(v.color):SetMeta('Blade',y)if v.steamid then A:SetRequiredSteamID(v.steamid)end;table.insert(x,z)end end;local B={}for e,C in ipairs(x)do local f='JEDI_CRYSTAL_'..C:upper():Replace('ls_c',''):Replace(' ','_')local D=cosmetics.Get(C)local u=D.prettyname;D:SetMeta('Item',f)table.insert(B,f)srp.items.Register('The Order',f,{base='COSMETIC',name=u,cosmetic=C,maxstack=100,description='A '..u..' Crystal unlocked through quests.',icon=j,color=v.color||v,craftingOffset=5,OnPickedUp=LogPickedUp,OnDropped=LogDropped,tradedisabled=true})end;if v.craft!=false then srp.crafting.Register('Crystals','JEDI_CRYSTAL_'..u:upper():Replace(' ','_'),{name=u..' Crystal',description='Refines crystals into a '..u..' Crystal for use with lightsabers.',icon=j,color=v.color||v,creates=B,count=1,cost=1000,time=30,CanView=l,OnCraft=p,items={JEDI_CRYSTAL=4}})end end
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/crafting/crafting_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/monsglacia_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/yuka_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/quests/halloweenboss_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/triumphs_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/baseknife.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/drgbase_weapon/secondary.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/ghostentity.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/button.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/camera.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/drgbase_tool_notarget.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/fireworks.lua:
AddCSLuaFile()TOOL.Category='Render'TOOL.Name='#Fireworks'TOOL.Command=nil;TOOL.ConfigName=nil;if CLIENT then language.Add('tool.fireworks.name','Fireworks')language.Add('tool.fireworks.desc','Create fireworks')language.Add('tool.fireworks.0','Click to spawn a firework')language.Add('Undone_Firework','Undone Firework')language.Add('Cleanup_fireworks','Fireworks')language.Add('Cleaned_fireworks','Cleaned up all Fireworks')language.Add('SBoxLimit_fireworks','You\'ve reached the Firework limit!')else CreateConVar('sbox_maxfireworks',5)numpad.Register('StartFuseFirework',function(a,b)if!IsValid(b)then return end;b:StartFuse()end)end;cleanup.Register('fireworks')TOOL.ClientConVar['rand']=0;TOOL.ClientConVar['r']=0;TOOL.ClientConVar['g']=255;TOOL.ClientConVar['b']=0;TOOL.ClientConVar['flame_r']=255;TOOL.ClientConVar['flame_g']=165;TOOL.ClientConVar['flame_b']=0;TOOL.ClientConVar['fusetime']=2;TOOL.ClientConVar['scale']=1;TOOL.ClientConVar['autounfreeze']=1;TOOL.ClientConVar['explodetime']=0;TOOL.ClientConVar['collisionexplode']=1;TOOL.ClientConVar['trajectoryrand']=5;TOOL.ClientConVar['key']=65;TOOL.ClientConVar['lightonuse']=1;local function c(d,e,f,g,h,i,j,k,l,m,n,o,p)if!d:CheckLimit('fireworks')then return false end;local q=ents.Create('sent_firework')if!q:IsValid()then return false end;q:SetAngles(e)q:SetPos(f)q:SetupData(g,l)q.pl=d;q:Spawn()local r=q:GetPhysicsObject()if r:IsValid()then r:EnableMotion(false)end;numpad.OnDown(d,o,"StartFuseFirework",q)d:AddCount('fireworks',q)d:AddCleanup('fireworks',q)return q end;duplicator.RegisterEntityClass('sent_firework',c,'Ang','Pos','Col','FuseTime','FWScale','AutoUnfreeze','ExplodeTime','FlameColor','CollisionExplode','TrajectoryRand','Key','LightOnUse')function TOOL:LeftClick(s)if s.Entity&&s.Entity:IsPlayer()then return false end;if CLIENT then return true end;local a=self:GetOwner()local e=s.HitNormal:Angle()+Angle(90,0,0)local t=self:GetClientNumber('rand',0)==1;local u=self:GetClientNumber('r',255)local v=self:GetClientNumber('g',0)local w=self:GetClientNumber('b',0)local x=self:GetClientNumber('flame_r',255)local y=self:GetClientNumber('flame_g',165)local z=self:GetClientNumber('flame_b',0)if t then local A=HSVToColor(math.Rand(0,360),math.Rand(0.9,1),math.Rand(0.75,1))u=A.r;v=A.g;w=A.b;local B=HSVToColor(math.Rand(0,360),math.Rand(0.9,1),math.Rand(0.75,1))x=B.r;y=B.g;z=B.b end;local C=self:GetClientNumber("key")local h=self:GetClientNumber('fusetime',2)local k=self:GetClientNumber('explodetime',0)local D=math.Clamp(self:GetClientNumber('scale',1),0.1,3)local g=Color(u,v,w)local l=Vector(x,y,z)local j=self:GetClientNumber('autounfreeze')==1;local m=self:GetClientNumber('collisionexplode')==1;local n=math.Clamp(self:GetClientNumber('trajectoryrand',10),0,30)local p=self:GetClientNumber('lightonuse')==1;if s.Entity:IsValid()&&s.Entity:GetClass()=='sent_firework'&&s.Entity.pl==a then s.Entity:SetupData(g,l)return true end;if!self:GetSWEP():CheckLimit('fireworks')then return false end;local q=c(a,e,s.HitPos+s.HitNormal,g,h,D,j,k,l,m,n,C,p)undo.Create('Firework')undo.AddEntity(q)undo.SetPlayer(a)undo.Finish()return true end;function TOOL.BuildCPanel(E)E:AddControl('Header',{Text='#tool.fireworks.name',Description='#tool.fireworks.desc'})local F={Label='#Presets',MenuButton=1,Folder='fireworks',Options={},CVars={}}F.Options.default={fireworks_rand='0',fireworks_r='0',fireworks_g='255',fireworks_b='0',fireworks_fusetime='2',fireworks_explodetime='0',fireworks_trajectoryrand='5',fireworks_scale='1',fireworks_autounfreeze='1',fireworks_collisionexplode='1',fireworks_flame_r='255',fireworks_flame_g='165',fireworks_flame_b='0'}F.Options.Bomb={fireworks_rand='0',fireworks_r='255',fireworks_g='0',fireworks_b='0',fireworks_fusetime='0',fireworks_explodetime='0.5',fireworks_trajectoryrand='0',fireworks_scale='2',fireworks_autounfreeze='0',fireworks_collisionexplode='0',fireworks_flame_r='255',fireworks_flame_g='165',fireworks_flame_b='0'}F.Options.Faulty={fireworks_rand='0',fireworks_r='0',fireworks_g='0',fireworks_b='255',fireworks_fusetime='2',fireworks_explodetime='0',fireworks_trajectoryrand='30',fireworks_scale='0.75',fireworks_autounfreeze='1',fireworks_collisionexplode='0',fireworks_flame_r='255',fireworks_flame_g='0',fireworks_flame_b='0'}F.Options['Generic Red']={fireworks_rand='0',fireworks_r='255',fireworks_g='0',fireworks_b='0',fireworks_fusetime='2',fireworks_explodetime='0',fireworks_trajectoryrand='5',fireworks_scale='1',fireworks_autounfreeze='1',fireworks_collisionexplode='1',fireworks_flame_r='255',fireworks_flame_g='0',fireworks_flame_b='0'}F.Options['Generic Green']={fireworks_rand='0',fireworks_r='0',fireworks_g='255',fireworks_b='0',fireworks_fusetime='2',fireworks_explodetime='0',fireworks_trajectoryrand='5',fireworks_scale='1',fireworks_autounfreeze='1',fireworks_collisionexplode='1',fireworks_flame_r='0',fireworks_flame_g='255',fireworks_flame_b='0'}F.Options['Generic Blue']={fireworks_rand='0',fireworks_r='0',fireworks_g='195',fireworks_b='255',fireworks_fusetime='2',fireworks_explodetime='0',fireworks_trajectoryrand='5',fireworks_scale='1',fireworks_autounfreeze='1',fireworks_collisionexplode='1',fireworks_flame_r='0',fireworks_flame_g='125',fireworks_flame_b='255'}F.Options['Generic Purple']={fireworks_rand='0',fireworks_r='255',fireworks_g='0',fireworks_b='255',fireworks_fusetime='2',fireworks_explodetime='0',fireworks_trajectoryrand='5',fireworks_scale='1',fireworks_autounfreeze='1',fireworks_collisionexplode='1',fireworks_flame_r='255',fireworks_flame_g='0',fireworks_flame_b='255'}F.Options['Generic Yellow']={fireworks_rand='0',fireworks_r='255',fireworks_g='255',fireworks_b='0',fireworks_fusetime='2',fireworks_explodetime='0',fireworks_trajectoryrand='5',fireworks_scale='1',fireworks_autounfreeze='1',fireworks_collisionexplode='1',fireworks_flame_r='255',fireworks_flame_g='165',fireworks_flame_b='0'}table.insert(F.CVars,'fireworks_rand')table.insert(F.CVars,'fireworks_r')table.insert(F.CVars,'fireworks_g')table.insert(F.CVars,'fireworks_b')table.insert(F.CVars,'fireworks_fusetime')table.insert(F.CVars,'fireworks_explodetime')table.insert(F.CVars,'fireworks_trajectoryrand')table.insert(F.CVars,'fireworks_scale')table.insert(F.CVars,'fireworks_autounfreeze')table.insert(F.CVars,'fireworks_collisionexplode')table.insert(F.CVars,'fireworks_flame_r')table.insert(F.CVars,'fireworks_flame_g')table.insert(F.CVars,'fireworks_flame_b')table.insert(F.CVars,'fireworks_keys')table.insert(F.CVars,'fireworks_lightonuse')E:AddControl('ComboBox',F)E:AddControl('Checkbox',{Label='Randomize Colors',Command='fireworks_rand'})E:AddControl('Color',{Label='Explosion Color',Red='fireworks_r',Green='fireworks_g',Blue='fireworks_b',ShowAlpha=0,ShowHSV=1,ShowRGB=1,Multiplier=255})E:NumSlider('Fuse Time','fireworks_fusetime',0,15,2)E:NumSlider('Explode Time (0 to disable)','fireworks_explodetime',0,30,2)E:NumSlider('Instability (0 to disable)','fireworks_trajectoryrand',0,30,0)E:NumSlider('Scale','fireworks_scale',0.1,3,1)E:AddControl('Checkbox',{Label='Auto unfreeze',Command='fireworks_autounfreeze'})E:AddControl('Checkbox',{Label='Explode on collision',Command='fireworks_collisionexplode'})E:AddControl("Checkbox",{Label="Start Fuse when used",Command="fireworks_lightonuse"})E:AddControl("Numpad",{Label="Start Fuse Key",Command="fireworks_key"})E:AddControl('Color',{Label='Trail Color',Red='fireworks_flame_r',Green='fireworks_flame_g',Blue='fireworks_flame_b',ShowAlpha=0,ShowHSV=1,ShowRGB=1,Multiplier=255})E:AddControl('Label',{Text='Client Options (Affects all fireworks):',Description='Hey'})E:NumSlider('Flash Brightness Multiplier','fireworks_brightness',0.1,3,2)E:AddControl('Checkbox',{Label='Show flash',Command='fireworks_glow'})E:AddControl('Checkbox',{Label='Show smoke',Command='fireworks_smoke'})E:AddControl('Checkbox',{Label='Show explosion smoke',Command='fireworks_smokeexplosion'})E:AddControl('Checkbox',{Label='Show flames',Command='fireworks_flame'})end
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/ladder.lua:
return lpakr()()
--addons/ssrp_tools_npc/lua/weapons/gmod_tool/stools/npc_spawner.lua:
TOOL.Category = 'Superior Tools'
TOOL.Name     = '#tool.npc_spawner.name'

if CLIENT then
    language.Add( 'tool.npc_spawner.enabled', 'Start Enabled' )
    language.Add( 'tool.npc_spawner.droppodenb', 'Spawn as Drop Pod' )
    language.Add( 'tool.npc_spawner.droppodhealth', 'Drop pod health' )
    language.Add( 'tool.npc_spawner.droppodhealth.help', 'Damage needed to destroy the drop pod' )
    language.Add( 'tool.npc_spawner.name', 'NPC Spawner' )
    language.Add( 'tool.npc_spawner.desc', 'The Superior NPC Spawner.. It spawns npcs duh.' )
    language.Add( 'tool.npc_spawner.left', 'Spawns an NPC Spawner' )
    language.Add( 'tool.npc_spawner.right', 'Updates an NPC Spawner' )
    language.Add( 'tool.npc_spawner.npc', 'NPC Class' )
    language.Add( 'tool.npc_spawner.npc.help', 'Spawns the selected NPC Class' )
    language.Add( 'tool.npc_spawner.toggle', 'Toggle the spawner On/Off' )
    language.Add( 'tool.npc_spawner.weapon', 'Spawned Weapon' )
    language.Add( 'tool.npc_spawner.weapon.help', 'The weapon the NPC should spawn with' )
    language.Add( 'tool.npc_spawner.waves', 'Wave Count' )
    language.Add( 'tool.npc_spawner.waves.help', 'The amount of waves that the spawner will create' )
    language.Add( 'tool.npc_spawner.wave_delay', 'Wave Delay' )
    language.Add( 'tool.npc_spawner.wave_delay.help', 'The delay between waves. Does not include the first wave. (Instant unless the spawner is default disabled)' )
    language.Add( 'tool.npc_spawner.wave_amount', 'Wave Amount' )
    language.Add( 'tool.npc_spawner.wave_amount.help', 'The amount of NPCs to spawn per wave' )
    language.Add( 'tool.npc_spawner.wave_range', 'Wave Range' )
    language.Add( 'tool.npc_spawner.wave_range.help', 'The range point for finding a random spawn location per-npc' )
    language.Add( 'tool.npc_spawner.proficiency', 'Weapon Proficiency' )
    language.Add( 'tool.npc_spawner.proficiency.help', 'The NPC\'s weapon proficiency for the current spawned weapon.' )
    language.Add( 'tool.npc_spawner.health', 'Health' )
    language.Add( 'tool.npc_spawner.health.help', 'Thes starting health of each NPC' )
else
	numpad.Register( 'SpawnerToggle', function(pl, ent)
        if not IsValid(ent) then
            return
        end
        ent:Reset(not ent.enabled, false)
        return true
	end)
end

TOOL.Information = {
	{ name = 'left' },
	{ name = 'right' },
}

local ranges = {
    { id = 'enabled', min = 0, max = 1, list = false },
    { id = 'droppod', min = 0, max = 1, list = false},
    { id = 'droppodhealth', min = 100, max = 64000},
    { id = 'waves', min = 1, max = 20 },
    { id = 'wave_amount', min = 1, max = 15 },
    { id = 'wave_delay', min = 20, max = 300 },
    { id = 'wave_range', min = 50, max = 400 },
    { id = 'proficiency', min = 0, max = 4, list = false },
    { id = 'health', min = 50, max = 64000 },
}

TOOL.Spawner = 'npc_spawner'
TOOL.DroppodSpawner = 'npc_droppodspawner'
TOOL.ClientConVar['enabled'] = 1
TOOL.ClientConVar['droppod'] = 1
TOOL.ClientConVar['droppodhealth'] = 200

TOOL.ClientConVar['npc'] = 'npc_zombie'
TOOL.ClientConVar['waves'] = 1
TOOL.ClientConVar['wave_delay']  = 5
TOOL.ClientConVar['wave_amount'] = 1
TOOL.ClientConVar['wave_range'] = 200
TOOL.ClientConVar['weapon'] = 'none'
TOOL.ClientConVar['proficiency'] = WEAPON_PROFICIENCY_AVERAGE
TOOL.ClientConVar['health'] = 100
TOOL.ClientConVar['toggle'] = '-1'

 -- Lol yuck
function TOOL.Clamp(self, name)
    local copy = table.Copy(ranges)
    local range = table.Filter(copy, function(t)
        return t.id == name
    end)[1]

    local min, max = range.min, range.max
    local value = self:GetClientNumber(name)
    return math.Clamp(value, min, max)
end

function TOOL.GetListID(self, selection, list_str, key, fallback)
	local selected = self:GetClientInfo(selection)
	local tbl = list.Get(list_str)

	for id, tab in pairs(tbl) do
		if (key and tab[key] == selected) or selected == id then
			tab.id = id
			return id, tab
		end
	end
    return fallback
end

function TOOL.GetSafeSettings(self)
	local settings = {
		enabled = self:Clamp('enabled'),
        droppod = self:Clamp('droppod'),
		waves = self:Clamp('waves'),
		wave_delay = self:Clamp('wave_delay'),
		wave_amount = self:Clamp('wave_amount'),
		wave_range = self:Clamp('wave_range'),
		proficiency = self:Clamp('proficiency'),
		health = self:Clamp('health'),
        droppodhealth = self:Clamp('droppodhealth')
	}

	local wep_id, tbl = self:GetListID('weapon', 'NPCUsableWeapons', 'class', 'none')
	settings.weapon = tbl and tbl.class or wep_id

	local npc_id, tbl = self:GetListID('npc', 'NPC', nil, 'npc_zombie')
	settings.npc = npc_id

	return settings
end

function TOOL:LeftClick(trace)
	if CLIENT or not IsFirstTimePredicted() then
		return false
	end

	local owner = self:GetOwner()
	if not owner:IsGamemaster() then
		return false
	end

    local settings = self:GetSafeSettings()
    local classid = settings.droppod == 1 and self.DroppodSpawner or self.Spawner

	if hook.Run('PlayerSpawnSENT', owner, classid) == false then
		return false
	end

	local spawner  = ents.Create(classid)
	if not IsValid(spawner) then
		return false
	end

	numpad.OnDown(owner, self:GetClientNumber('toggle'), 'SpawnerToggle', spawner, 1)

	spawner:SetNetVar('npc_spawner.enabled', settings.enabled == 1)
	spawner:SetNetVar('npc_spawner.npc', settings.npc)
	spawner:SetNetVar('npc_spawner.weapon', settings.weapon)
	spawner:SetNetVar('npc_spawner.waves', settings.waves)
	spawner:SetNetVar('npc_spawner.wave_delay', settings.wave_delay)
	spawner:SetNetVar('npc_spawner.wave_amount', settings.wave_amount)
	spawner:SetNetVar('npc_spawner.proficiency', settings.proficiency)
	spawner:SetNetVar('npc_spawner.wave_range', settings.wave_range)
	spawner:SetNetVar('npc_spawner.health', settings.health)
	spawner:SetNetVar('npc_spawner.owner', owner)
	spawner.CanDamage = settings.health > 0

    if settings.droppod then
        spawner:SetNetVar('npc_spawner.podhealth', settings.droppodhealth)
		spawner:SetNetVar('npc_spawner.podmaxhealth', settings.droppodhealth)
    end

	spawner.PropOwner = owner

	spawner:SetPos(trace.HitPos)
	spawner:SetAngles(Angle(0, 0, 0))
	spawner:Spawn()
	spawner:Activate()

	undo.Create('npc_spawner')
		undo.SetPlayer(owner)
		undo.AddEntity(spawner)
		undo.SetCustomUndoText('Removed NPC Spawner and all its NPCs')
		undo.AddFunction(function(tab, ent)
			if IsValid(ent) and ent.RemoveNpcs then
				ent:RemoveNpcs()
			end
		end, spawner)
	undo.Finish()

	hook.Run('PlayerSpawnedSENT', owner, spawner)
	return true
end

function TOOL:RightClick(trace)
	return false
end

function TOOL:Reload(trace)
	return false
end

function TOOL.BuildCPanel(CPanel)
	local selectable_npcs = {}
	local selectable_weapons = {['No Weapon'] = { npc_spawner_weapon = 'none'}}

	local npcs = list.Get('NPC')
	for id, npc in pairs(npcs) do
		selectable_npcs[npc.Name] = {npc_spawner_npc = id}
	end

	local weps = list.Get('NPCUsableWeapons')
	for i = 1, #weps do
		local wep = weps[i]
		selectable_weapons[wep.title] = {npc_spawner_weapon = wep.class}
	end

    CPanel:AddControl('Checkbox', {Label = '#tool.npc_spawner.enabled', Command = 'npc_spawner_enabled'})
    CPanel:AddControl('Checkbox', {Label = '#tool.npc_spawner.droppodenb', Command = 'npc_spawner_droppod'})
	CPanel:AddControl('ListBox', {Label = '#tool.npc_spawner.npc', help = true,  Options = selectable_npcs})

	for _, data in pairs(ranges) do
		if data.list == false then
			continue
		end
		CPanel:AddControl('Slider', {Label = '#tool.npc_spawner.' .. data.id, Command = 'npc_spawner_' .. data.id, Min = data.min, Max = data.max, help = true})
	end

	CPanel:AddControl('ListBox', {Label = '#tool.npc_spawner.weapon', Options = selectable_weapons})
	CPanel:AddControl('ListBox', {Label = '#tool.npc_spawner.proficiency', help = true, Options = {
		POOR            = { npc_spawner_proficiency = 0 },
		AVERAGE         = { npc_spawner_proficiency = 1 },
		GOOD            = { npc_spawner_proficiency = 2 },
		['VERY GOOD']   = { npc_spawner_proficiency = 3 },
		PERFECT         = { npc_spawner_proficiency = 4 },
	}})

	CPanel:AddControl('Numpad', {Label = '#tool.npc_spawner.toggle', Command = 'npc_spawner_toggle'})
end

--addons/!lpakr_out/lua/weapons/gmod_tool/stools/particlecontrol_tracer.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/rb655_easy_animation.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/rb655_easy_bodygroup.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/rb655_easy_bodygroup.lua:
TOOL.Category="Robotboy655"TOOL.Name="#tool.rb655_easy_bodygroup.name"local a=NULL;local b=72;TOOL.ClientConVar["noglow"]="0"TOOL.ClientConVar["skin"]="0"for c=0,b do TOOL.ClientConVar["group"..c]="1"end;local function d(e)local f={}for g,h in pairs(string.Explode("_",e))do if string.len(h)==1 then table.insert(f,string.upper(h))continue end;table.insert(f,string.upper(string.Left(h,1))..string.Right(h,string.len(h)-1))end;return string.Implode(" ",f)end;local function i(j)if!IsValid(j)||j:IsWorld()then return false end;if(j:SkinCount()||0)>1 then return true end;if(j:GetNumBodyGroups()||0)>1 then return true end;if(j:GetBodygroupCount(0)||0)>1 then return true end;if j:IsPlayer()&&j:GetAllegiance()=='REPUBLIC'then return false end;return false end;local function k(g,j,l)j:SetBodygroup(l.group,l.id)end;for c=0,b do duplicator.RegisterEntityModifier("bodygroup"..c,k)end;function TOOL:GetSelecetedEntity()return self:GetWeapon():GetNWEntity("rb655_bodygroup_entity")end;function TOOL:SetSelecetedEntity(j)if IsValid(j)&&j:GetClass()=="prop_effect"then j=j.AttachedEntity end;if!IsValid(j)then j=NULL end;if self:GetSelecetedEntity()==j then return end;self:GetWeapon():SetNWEntity("rb655_bodygroup_entity",j)end;function TOOL:Think()local j=self:GetSelecetedEntity()if!IsValid(j)then self:SetSelecetedEntity(NULL)end;if CLIENT then if j:EntIndex()==a then return end;a=j:EntIndex()self:UpdateControlPanel()return end;if!i(j)then return end;if self.Ready==0 then return end;if self.Ready>0&&self.Ready<50 then self.Ready=self.Ready+1;return end;if j:SkinCount()>1 then j:SetSkin(self:GetClientNumber("skin"))end;for c=0,j:GetNumBodyGroups()-1 do if j:GetBodygroupCount(c)<=1 then continue end;if j:GetBodygroup(c)==self:GetClientNumber("group"..c)then continue end;k(nil,j,{group=c,id=self:GetClientNumber("group"..c)})end end;function TOOL:LeftClick(m)if SERVER&&m.Entity!=self:GetSelecetedEntity()then self.Ready=0;self:SetSelecetedEntity(m.Entity)end;return true end;function TOOL:RightClick(m)return self:LeftClick(m)end;function TOOL:Reload()return true end;TOOL.Information={{name="info",stage=1},{name="left"},{name="reload"}}language.Add("tool.rb655_easy_bodygroup.left","Select an object to edit")language.Add("tool.rb655_easy_bodygroup.reload","Select yourself")language.Add("tool.rb655_easy_bodygroup.name","Easy Bodygroup Tool")language.Add("tool.rb655_easy_bodygroup.desc","Eases change of bodygroups and skins")language.Add("tool.rb655_easy_bodygroup.1","Use context menu to edit bodygroups or skins")language.Add("tool.rb655_easy_bodygroup.noglow","Don't render glow/halo around models")language.Add("tool.rb655_easy_bodygroup.skin","Skin")language.Add("tool.rb655_easy_bodygroup.badent","This entity does not have any skins or bodygroups.")language.Add("tool.rb655_easy_bodygroup.noent","No entity selected.")function TOOL:GetStage()if IsValid(self:GetSelecetedEntity())then return 1 end;return 0 end;function TOOL:UpdateControlPanel(n)local o=controlpanel.Get("rb655_easy_bodygroup")if!o then MsgN("Couldn't find rb655_easy_bodygroup panel!")return end;o:ClearControls()self.BuildCPanel(o,self:GetSelecetedEntity())end;local p={}p["rb655_easy_bodygroup_skin"]=0;for c=0,b do p["rb655_easy_bodygroup_group"..c]=0 end;function TOOL.BuildCPanel(o,j)o:AddControl("Checkbox",{Label="#tool.rb655_easy_bodygroup.noglow",Command="rb655_easy_bodygroup_noglow"})if!IsValid(j)then o:AddControl("Label",{Text="#tool.rb655_easy_bodygroup.noent"})return end;if!i(j)then o:AddControl("Label",{Text="#tool.rb655_easy_bodygroup.badent"})return end;o:AddControl("ComboBox",{MenuButton=1,Folder="rb655_ez_bg_"..j:GetModel():lower():Replace("/","_"):StripExtension():sub(8),Options={["#preset.default"]=p},CVars=table.GetKeys(p)})if j:SkinCount()>1 then LocalPlayer():ConCommand("rb655_easy_bodygroup_skin "..j:GetSkin())o:AddControl("Slider",{Label="#tool.rb655_easy_bodygroup.skin",Max=j:SkinCount()-1,Command="rb655_easy_bodygroup_skin"})end;for q=0,j:GetNumBodyGroups()-1 do if j:GetBodygroupCount(q)<=1 then continue end;LocalPlayer():ConCommand("rb655_easy_bodygroup_group"..q.." "..j:GetBodygroup(q))o:AddControl("Slider",{Label=d(j:GetBodygroupName(q)),Max=j:GetBodygroupCount(q)-1,Command="rb655_easy_bodygroup_group"..q})end;net.Start("rb655_easy_bodygroup_ready")net.WriteEntity(j)net.SendToServer()end;function TOOL:DrawHUD()local j=self:GetSelecetedEntity()if!IsValid(j)||tobool(self:GetClientNumber("noglow"))then return end;local l={j}if j.GetActiveWeapon then table.insert(l,j:GetActiveWeapon())end;halo.Add(l,HSVToColor(CurTime()*3%360,math.abs(math.sin(CurTime()/2)),1),2,2,1)end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/smartweld.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/stacker.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/stacker_improved.lua:
local a=TOOL.Mode;include("improvedstacker/localify.lua")localify.LoadSharedFile("improvedstacker/localization.lua")local b=localify.Localize;local c="#tool."..a.."."include("improvedstacker/improvedstacker.lua")improvedstacker.Initialize(a)local bit=bit;local cam=cam;local net=net;local util=util;local math=math;local undo=undo;local halo=halo;local game=game;local ents=ents;local draw=draw;local hook=hook;local list=list;local pairs=pairs;local table=table;local Angle=Angle;local Color=Color;local render=render;local Vector=Vector;local tobool=tobool;local CurTime=CurTime;local surface=surface;local IsValid=IsValid;local localify=localify;local language=language;local tonumber=tonumber;local GetConVar=GetConVar;local construct=construct;local duplicator=duplicator;local constraint=constraint;local concommand=concommand;local LocalPlayer=LocalPlayer;local CreateConVar=CreateConVar;local improvedstacker=improvedstacker;local GetConVarNumber=GetConVarNumber;local RunConsoleCommand=RunConsoleCommand;local IN_USE=IN_USE;local NOTIFY_ERROR=NOTIFY_ERROR||1;local MOVETYPE_NONE=MOVETYPE_NONE;local SOLID_VPHYSICS=SOLID_VPHYSICS;local RENDERMODE_TRANSALPHA=RENDERMODE_TRANSALPHA;local d=Color(255,255,255,150)local e=3;local f=5;local g=180;local h=false;TOOL.Category="Construction"TOOL.Name=b(c.."name")TOOL.Information={"left","right",{name="shift_left",icon2="gui/e.png",icon="gui/lmb.png"},{name="shift_right",icon2="gui/e.png",icon="gui/rmb.png"},"reload"}if CLIENT then TOOL.ClientConVar["mode"]=improvedstacker.MODE_PROP;TOOL.ClientConVar["direction"]=improvedstacker.DIRECTION_UP;TOOL.ClientConVar["count"]="1"TOOL.ClientConVar["freeze"]="1"TOOL.ClientConVar["weld"]="1"TOOL.ClientConVar["nocollide"]="1"TOOL.ClientConVar["ghostall"]="1"TOOL.ClientConVar["material"]="1"TOOL.ClientConVar["physprop"]="1"TOOL.ClientConVar["color"]="1"TOOL.ClientConVar["offsetx"]="0"TOOL.ClientConVar["offsety"]="0"TOOL.ClientConVar["offsetz"]="0"TOOL.ClientConVar["pitch"]="0"TOOL.ClientConVar["yaw"]="0"TOOL.ClientConVar["roll"]="0"TOOL.ClientConVar["relative"]="1"TOOL.ClientConVar["draw_halos"]="0"TOOL.ClientConVar["halo_r"]="255"TOOL.ClientConVar["halo_g"]="0"TOOL.ClientConVar["halo_b"]="0"TOOL.ClientConVar["halo_a"]="255"TOOL.ClientConVar["draw_axis"]="1"TOOL.ClientConVar["axis_labels"]="1"TOOL.ClientConVar["axis_angles"]="0"TOOL.ClientConVar["opacity"]="100"TOOL.ClientConVar["use_shift_key"]="0"language.Add("tool."..a..".name",b(c.."name"))language.Add("tool."..a..".desc",b(c.."desc"))language.Add("tool."..a..".left",b(c.."left"))language.Add("tool."..a..".shift_left",b(c.."shift_left"))language.Add("tool."..a..".right",b(c.."right"))language.Add("tool."..a..".shift_right",b(c.."shift_right"))language.Add("tool."..a..".reload",b(c.."reload"))language.Add("Undone_"..a,b("Undone_"..a))end;local i,j;if SERVER then elseif CLIENT then i=bit.bor(FCVAR_REPLICATED,FCVAR_SERVER_CAN_EXECUTE,FCVAR_ARCHIVE)cvarFlagsNotif=bit.bor(i,FCVAR_NOTIFY)end;local k=CreateConVar("stacker_max_total",-1,cvarFlagsNotif,"Defines the max amount of props that a player can have spawned from stacker")local l=CreateConVar("stacker_max_count",15,cvarFlagsNotif,"Defines the max amount of props that can be stacked at a time")local m=CreateConVar("stacker_delay",0.5,cvarFlagsNotif,"Determines the amount of time that must pass before a player can use stacker again")local n=CreateConVar("stacker_max_offsetx",200,cvarFlagsNotif,"Defines the max distance on the x plane that stacked props can be offset (for individual control)")local o=CreateConVar("stacker_max_offsety",200,cvarFlagsNotif,"Defines the max distance on the y plane that stacked props can be offset (for individual control)")local p=CreateConVar("stacker_max_offsetz",200,cvarFlagsNotif,"Defines the max distance on the z plane that stacked props can be offset (for individual control)")local q=CreateConVar("stacker_force_freeze",0,cvarFlagsNotif,"Determines whether props should be forced to spawn frozen or not")local r=CreateConVar("stacker_force_weld",0,cvarFlagsNotif,"Determines whether props should be forced to spawn welded or not")local s=CreateConVar("stacker_force_nocollide",0,cvarFlagsNotif,"Determines whether props should be forced to spawn nocollided or not")local t=CreateConVar("stacker_stayinworld",1,cvarFlagsNotif,"Determines whether props should be restricted to spawning inside the world or not (addresses possible crashes)")local u=CreateConVar(a.."_max_per_player",k:GetInt(),i,"Defines the max amount of props that a player can have spawned from stacker")local v=CreateConVar(a.."_max_per_stack",l:GetInt(),i,"Defines the max amount of props that can be stacked at a time")local w=CreateConVar(a.."_delay",m:GetFloat(),i,"Determines the amount of time that must pass before a player can use stacker again")local x=CreateConVar(a.."_max_offsetx",n:GetFloat(),i,"Defines the max distance on the x plane that stacked props can be offset (for individual control)")local y=CreateConVar(a.."_max_offsety",o:GetFloat(),i,"Defines the max distance on the y plane that stacked props can be offset (for individual control)")local z=CreateConVar(a.."_max_offsetz",p:GetFloat(),i,"Defines the max distance on the z plane that stacked props can be offset (for individual control)")local A=CreateConVar(a.."_force_freeze",q:GetInt(),cvarFlagsNotif,"Determines whether props should be forced to spawn frozen or not")local B=CreateConVar(a.."_force_weld",r:GetInt(),cvarFlagsNotif,"Determines whether props should be forced to spawn welded or not")local C=CreateConVar(a.."_force_nocollide",s:GetInt(),cvarFlagsNotif,"Determines whether props should be forced to spawn nocollided or not")local D=CreateConVar(a.."_force_nocollide_all",0,i,"(EXPERIMENTAL, DISABLED) Determines whether props should be nocollide with everything except players, vehicles, and npcs")local E=CreateConVar(a.."_force_stayinworld",t:GetInt(),cvarFlagsNotif,"Determines whether props should be restricted to spawning inside the world or not (addresses possible crashes)")if CLIENT then concommand.Add(a.."_reset_offsets",function(F,G,H)RunConsoleCommand(a.."_offsetx","0.00")RunConsoleCommand(a.."_offsety","0.00")RunConsoleCommand(a.."_offsetz","0.00")end)concommand.Add(a.."_reset_angles",function(F,G,H)RunConsoleCommand(a.."_pitch","0.00")RunConsoleCommand(a.."_yaw","0.00")RunConsoleCommand(a.."_roll","0.00")end)concommand.Add(a.."_reset_admin",function(F,G,H)for G,I in pairs(improvedstacker.SETTINGS_DEFAULT)do RunConsoleCommand(G,I)end end)elseif SERVER then local function J(F,G,K)local L,M=hook.Run("StackerConVar",F,G,K)if IsValid(F)&&L!=true then if L==false then F:PrintMessage(HUD_PRINTTALK,b(c.."error_blocked_by_server",localify.GetLocale(F))..(isstring(M)&&": "..M||""))return false end;if L==nil&&!F:IsAdmin()then F:PrintMessage(HUD_PRINTTALK,b(c.."error_not_admin",localify.GetLocale(F))..": "..G)return false end end;if!tonumber(K)then F:PrintMessage(HUD_PRINTTALK,b(c.."error_invalid_argument",localify.GetLocale(F)))return false end;return true end;concommand.Add(a.."_set_max_per_player",function(F,G,H)if!J(F,a.."_set_max_per_player",H[1])then return false end;RunConsoleCommand(a.."_max_per_player",H[1])end)concommand.Add(a.."_set_max_per_stack",function(F,G,H)if!J(F,a.."_set_max_per_stack",H[1])then return false end;RunConsoleCommand(a.."_max_per_stack",H[1])end)concommand.Add(a.."_set_max_offset",function(F,G,H)if!J(F,a.."_set_max_offset",H[1])then return false end;RunConsoleCommand(a.."_max_offsetx",H[1])RunConsoleCommand(a.."_max_offsety",H[1])RunConsoleCommand(a.."_max_offsetz",H[1])end)concommand.Add(a.."_set_max_offsetx",function(F,G,H)if!J(F,a.."_set_max_offsetx",H[1])then return false end;RunConsoleCommand(a.."_max_offsetx",H[1])end)concommand.Add(a.."_set_max_offsety",function(F,G,H)if!J(F,a.."_set_max_offsety",H[1])then return false end;RunConsoleCommand(a.."_max_offsety",H[1])end)concommand.Add(a.."_set_max_offsetz",function(F,G,H)if!J(F,a.."_set_max_offsetz",H[1])then return false end;RunConsoleCommand(a.."_max_offsetz",H[1])end)concommand.Add(a.."_set_force_stayinworld",function(F,G,H)if!J(F,a.."_set_force_stayinworld",H[1])then return false end;RunConsoleCommand(a.."_force_stayinworld",tobool(H[1])&&"1"||"0")end)concommand.Add(a.."_set_force_freeze",function(F,G,H)if!J(F,a.."_set_force_freeze",H[1])then return false end;RunConsoleCommand(a.."_force_freeze",tobool(H[1])&&"1"||"0")end)concommand.Add(a.."_set_force_weld",function(F,G,H)if!J(F,a.."_set_force_weld",H[1])then return false end;RunConsoleCommand(a.."_force_weld",tobool(H[1])&&"1"||"0")end)concommand.Add(a.."_set_force_nocollide",function(F,G,H)if!J(F,a.."_set_force_nocollide",H[1])then return false end;RunConsoleCommand(a.."_force_nocollide",tobool(H[1])&&"1"||"0")end)concommand.Add(a.."_set_force_nocollide_all",function(F,G,H)if!J(F,a.."_set_force_nocollide_all",H[1])then return false end;RunConsoleCommand(a.."_force_nocollide_all",tobool(H[1])&&"1"||"0")end)concommand.Add(a.."_set_delay",function(F,G,H)if!J(F,a.."_set_delay",H[1])then return false end;RunConsoleCommand(a.."_delay",H[1])end)util.AddNetworkString(a.."_error")function TOOL:SendError(N)net.Start(a.."_error")net.WriteString(N)net.WriteUInt(NOTIFY_ERROR,e)net.Send(self:GetOwner())end end;function TOOL:GetMaxPerPlayer()return u:GetInt()end;function TOOL:GetNumberPlayerEnts()return improvedstacker.GetEntCount(self:GetOwner(),0)end;function TOOL:GetStackSize()return self:GetClientNumber("count")end;function TOOL:GetMaxPerStack()return v:GetInt()end;function TOOL:GetDirection()local O=self:GetClientNumber("direction")return improvedstacker.Directions[O]&&O||improvedstacker.DIRECTION_FRONT end;function TOOL:GetStackerMode()local P=self:GetClientNumber("mode")return improvedstacker.Modes[P]&&P||improvedstacker.MODE_PROP end;function TOOL:GetOffsetX()return math.Clamp(self:GetClientNumber("offsetx"),-x:GetFloat(),x:GetFloat())end;function TOOL:GetOffsetY()return math.Clamp(self:GetClientNumber("offsety"),-y:GetFloat(),y:GetFloat())end;function TOOL:GetOffsetZ()return math.Clamp(self:GetClientNumber("offsetz"),-z:GetFloat(),z:GetFloat())end;function TOOL:GetOffsetVector()return Vector(self:GetOffsetX(),self:GetOffsetY(),self:GetOffsetZ())end;function TOOL:GetRotateP()return math.Clamp(self:GetClientNumber("pitch"),-g,g)end;function TOOL:GetRotateY()return math.Clamp(self:GetClientNumber("yaw"),-g,g)end;function TOOL:GetRotateR()return math.Clamp(self:GetClientNumber("roll"),-g,g)end;function TOOL:GetRotationAngle()return Angle(self:GetRotateP(),self:GetRotateY(),self:GetRotateR())end;function TOOL:ShouldApplyFreeze()return self:GetClientNumber("freeze")==1 end;function TOOL:ShouldForceFreeze()return A:GetBool()end;function TOOL:ShouldApplyWeld()return self:GetClientNumber("weld")==1 end;function TOOL:ShouldForceWeld()return B:GetBool()end;function TOOL:ShouldApplyNoCollide()return self:GetClientNumber("nocollide")==1 end;function TOOL:ShouldForceNoCollide()return C:GetBool()end;function TOOL:ShouldStackRelative()return self:GetClientNumber("relative")==1 end;function TOOL:ShouldGhostAll()return self:GetClientNumber("ghostall")==1 end;function TOOL:ShouldAddHalos()return self:GetClientNumber("draw_halos")==1 end;function TOOL:GetHaloR()return math.Clamp(self:GetClientNumber("halo_r"),0,255)end;function TOOL:GetHaloG()return math.Clamp(self:GetClientNumber("halo_g"),0,255)end;function TOOL:GetHaloB()return math.Clamp(self:GetClientNumber("halo_b"),0,255)end;function TOOL:GetHaloA()return math.Clamp(self:GetClientNumber("halo_a"),0,255)end;function TOOL:GetHaloColor()return Color(self:GetHaloR(),self:GetHaloG(),self:GetHaloB(),self:GetHaloA())end;function TOOL:ShouldApplyMaterial()return self:GetClientNumber("material")==1 end;function TOOL:ShouldApplyColor()return self:GetClientNumber("color")==1 end;function TOOL:ShouldApplyPhysicalProperties()return self:GetClientNumber("physprop")==1 end;function TOOL:GetDelay()return w:GetFloat()end;function TOOL:GetOpacity()return self:GetClientNumber("opacity")end;function TOOL:GetUseShiftKey()return self:GetClientNumber("use_shift_key")==1 end;function TOOL:LeftClick(Q,R)local F=self:GetOwner()if F:KeyDown(IN_USE)||self:GetUseShiftKey()&&F:KeyDown(IN_SPEED)then if CLIENT then return false end;local S=self:GetStackSize()>=self:GetMaxPerStack()&&self:GetMaxPerStack()||self:GetStackSize()+1;F:ConCommand(a.."_count "..S)return false end;if!IsValid(Q.Entity)||Q.Entity:GetClass()!="prop_physics"then return false end;if CLIENT then return true end;local T=R&&1||self:GetStackSize()local U=hook.Run("StackerMaxPerStack",F,T,R)||self:GetMaxPerStack()if U>=0 then if T>U then self:SendError(b(c.."error_max_per_stack",localify.GetLocale(self:GetOwner()))..U)end;T=math.Clamp(T,0,U)end;local V=improvedstacker.GetLastStackTime(F,0)local W=hook.Run("StackerDelay",F,V)||self:GetDelay()if V+W>CurTime()then self:SendError(b(c.."error_too_quick",localify.GetLocale(self:GetOwner())))return false end;improvedstacker.SetLastStackTime(F,CurTime())local X=self:GetDirection()local P=self:GetStackerMode()local Y=self:GetOffsetVector()local Z=self:GetRotationAngle()local _=self:ShouldStackRelative()local a0=E:GetBool()local a1=Q.Entity;local a2=a1:GetPos()local a3=a1:GetAngles()local a4=a1:GetModel()local a5=a1:GetSkin()local a6=a1:GetMaterial()local a7=a1:GetPhysicsObject():GetMaterial()local a8=a1:GetPhysicsObject():IsGravityEnabled()local a9={Color=a1:GetColor(),RenderMode=a1:GetRenderMode(),RenderFX=a1:GetRenderFX()}local aa;local ab={a1}local ac=a1;local O,ad;local ae=improvedstacker.GetDistance(P,X,a1)undo.Create(a)local af=hook.Run("StackerMaxPerPlayer",F,self:GetNumberPlayerEnts())||self:GetMaxPerPlayer()for ag=1,T do local ah=self:GetNumberPlayerEnts()if af>=0&&ah>=af then self:SendError(("%s (%s)"):format(b(c.."error_max_per_player",localify.GetLocale(self:GetOwner())),af))break end;if!self:GetSWEP():CheckLimit("props")then break end;if hook.Run("PlayerSpawnProp",F,a4)==false then break end;if ag==1||P==improvedstacker.MODE_PROP&&_ then O=improvedstacker.GetDirection(P,X,a3)ad=improvedstacker.GetOffset(P,X,a3,Y)end;a2=a2+O*ae+ad;improvedstacker.RotateAngle(P,X,a3,Z)if a0&&!util.IsInWorld(a2)then self:SendError(b(c.."error_not_in_world",localify.GetLocale(self:GetOwner())))break end;aa=ents.Create("prop_physics")aa:SetModel(a4)aa:SetPos(a2)aa:SetAngles(a3)aa:SetSkin(a5)aa:Spawn()if!IsValid(aa)||hook.Run("StackerEntity",aa,F)!=nil then break end;if!IsValid(aa)||hook.Run("PlayerSpawnedProp",F,a4,aa)!=nil then break end;improvedstacker.IncrementEntCount(F)aa:CallOnRemove("UpdateStackerTotal",function(a1,F)if!IsValid(F)then return end;improvedstacker.DecrementEntCount(F)end,F)self:ApplyMaterial(aa,a6)self:ApplyColor(aa,a9)self:ApplyFreeze(F,aa)if!self:ApplyNoCollide(ac,aa)then aa:Remove()break end;if!self:ApplyWeld(ac,aa)then aa:Remove()break end;self:ApplyPhysicalProperties(a1,aa,Q.PhysicsBone,{GravityToggle=a8,Material=a7})ac=aa;table.insert(ab,aa)undo.AddEntity(aa)F:AddCleanup("props",aa)end;ab=nil;undo.SetPlayer(F)undo.Finish()return true end;function TOOL:RightClick(Q)local F=self:GetOwner()if F:KeyDown(IN_USE)||self:GetUseShiftKey()&&F:KeyDown(IN_SPEED)then if CLIENT then return false end;local T=self:GetStackSize()local S=T<=1&&1||T-1;F:ConCommand(a.."_count "..S)return false else return self:LeftClick(Q,true)end end;function TOOL:Reload()if CLIENT then return false end;local F=self:GetOwner()local O=self:GetDirection()if O==improvedstacker.DIRECTION_DOWN then O=improvedstacker.DIRECTION_FRONT else O=O+1 end;F:ConCommand(a.."_direction "..O)return false end;function TOOL:ApplyMaterial(a1,ai)if!self:ShouldApplyMaterial()then a1:SetMaterial("")return end;if!game.SinglePlayer()&&!list.Contains("OverrideMaterials",ai)&&ai!=""then return end;a1:SetMaterial(ai)duplicator.StoreEntityModifier(a1,"material",{MaterialOverride=ai})end;function TOOL:ApplyColor(a1,aj)if!self:ShouldApplyColor()then return end;a1:SetColor(aj.Color)a1:SetRenderMode(aj.RenderMode)a1:SetRenderFX(aj.RenderFX)duplicator.StoreEntityModifier(a1,"colour",table.Copy(aj))end;function TOOL:ApplyFreeze(F,a1)if self:ShouldForceFreeze()||self:ShouldApplyFreeze()then a1:GetPhysicsObject():EnableMotion(false)else a1:GetPhysicsObject():Wake()end end;function TOOL:ApplyWeld(ac,aa)if!self:ShouldForceWeld()&&!self:ShouldApplyWeld()then return true end;local ak=0;local al=self:ShouldForceNoCollide()||self:ShouldApplyNoCollide()local am=false;local an,ao=pcall(constraint.Weld,ac,aa,0,0,ak,al,am)if!an then print(a..": "..b(c.."error_max_constraints").." (error: "..ao..")")self:SendError(a..": "..b(c.."error_max_constraints",localify.GetLocale(self:GetOwner())))end;return an end;function TOOL:ApplyNoCollide(ac,aa)if!self:ShouldForceNoCollide()&&!self:ShouldApplyNoCollide()then return true end;if self:ShouldForceWeld()||self:ShouldApplyWeld()then return true end;local an,ao=pcall(constraint.NoCollide,ac,aa,0,0)if!an then print(a..": "..b(c.."error_max_constraints").." (error: "..ao..")")self:SendError(a..": "..b(c.."error_max_constraints",localify.GetLocale(self:GetOwner())))end;return an end;function TOOL:ApplyPhysicalProperties(ap,aa,aq,ar)if!self:ShouldApplyPhysicalProperties()then return end;if aq then construct.SetPhysProp(nil,aa,aq,nil,ar)end;aa:GetPhysicsObject():SetMass(ap:GetPhysicsObject():GetMass())end;if CLIENT then local as=GetConVar("gmod_toolmode")local at=GetConVar(a.."_count")local au=GetConVar(a.."_mode")local av=GetConVar(a.."_direction")local aw=GetConVar(a.."_offsetx")local ax=GetConVar(a.."_offsety")local ay=GetConVar(a.."_offsetz")local az=GetConVar(a.."_pitch")local aA=GetConVar(a.."_yaw")local aB=GetConVar(a.."_roll")local aC=GetConVar(a.."_relative")local aD=GetConVar(a.."_material")local aE=GetConVar(a.."_color")local aF=GetConVar(a.."_ghostall")local aG=GetConVar(a.."_opacity")local aH=GetConVar(a.."_draw_halos")local aI=GetConVar(a.."_halo_r")local aJ=GetConVar(a.."_halo_g")local aK=GetConVar(a.."_halo_b")local aL=GetConVar(a.."_halo_a")local aH=GetConVar(a.."_draw_halos")local aM=GetConVar(a.."_draw_axis")local aN=GetConVar(a.."_axis_labels")local aO=GetConVar(a.."_axis_angles")local aP=Vector(0,0,0.05)local aQ=Vector(0,0,-0.05)local aR=Vector(0.05,0,0)local aS=Vector(-0.05,0,0)local aT=2.5;local aU=Color(255,50,50)local aV=Color(0,255,0)local aW=Color(50,150,255)local aX=Color(0,0,0)surface.CreateFont(a.."_direction",{font="Arial",size=24,weight=700,antialias=true})local function aY()return at:GetInt()end;local function aZ()return v:GetInt()end;local function a_()return au:GetInt()end;local function b0()return av:GetInt()end;local function b1()return aG:GetInt()end;local function b2()return aF:GetBool()end;local function b3()return aC:GetBool()end;local function b4()return aD:GetBool()end;local function b5()return aE:GetBool()end;local function b6()return aH:GetBool()end;local function b7()return Vector(math.Clamp(aw:GetFloat(),-x:GetFloat(),x:GetFloat()),math.Clamp(ax:GetFloat(),-y:GetFloat(),y:GetFloat()),math.Clamp(ay:GetFloat(),-z:GetFloat(),z:GetFloat()))end;local function b8()return Angle(math.Clamp(az:GetFloat(),-g,g),math.Clamp(aA:GetFloat(),-g,g),math.Clamp(aB:GetFloat(),-g,g))end;local function b9()return Color(aI:GetInt(),aJ:GetInt(),aK:GetInt(),aL:GetInt())end;function TOOL:Init()as=GetConVar("gmod_toolmode")at=GetConVar(a.."_count")au=GetConVar(a.."_mode")av=GetConVar(a.."_direction")aw=GetConVar(a.."_offsetx")ax=GetConVar(a.."_offsety")ay=GetConVar(a.."_offsetz")az=GetConVar(a.."_pitch")aA=GetConVar(a.."_yaw")aB=GetConVar(a.."_roll")aC=GetConVar(a.."_relative")aD=GetConVar(a.."_material")aE=GetConVar(a.."_color")aF=GetConVar(a.."_ghostall")aG=GetConVar(a.."_opacity")aH=GetConVar(a.."_draw_halos")aI=GetConVar(a.."_halo_r")aJ=GetConVar(a.."_halo_g")aK=GetConVar(a.."_halo_b")aL=GetConVar(a.."_halo_a")aH=GetConVar(a.."_draw_halos")aM=GetConVar(a.."_draw_axis")aN=GetConVar(a.."_axis_labels")aO=GetConVar(a.."_axis_angles")end;local function ba(a1)if improvedstacker.GetGhosts()then improvedstacker.ReleaseGhosts()end;local T=aY()local U=aZ()if!b2()&&T!=0 then T=1 end;if U>=0&&T>U then T=U end;local a4=a1:GetModel()local a5=a1:GetSkin()local bb={}local bc;for ag=1,T do bc=ClientsideModel(a4)if!IsValid(bc)then continue end;bc:SetModel(a4)bc:SetSkin(a5)bc:Spawn()bc:SetRenderMode(RENDERMODE_TRANSALPHA)table.insert(bb,bc)end;improvedstacker.SetGhosts(bb)return true end;local function bd()local bb=improvedstacker.GetGhosts()if!bb then return false end;for ag=1,#bb do if!IsValid(bb[ag])then return false end end;local T=aY()local U=aZ()if U>=0&&T>U then T=U end;if#bb!=T&&b2()then return false elseif#bb!=1&&!b2()then return false end;return true end;local function be(a1)local P=a_()local X=b0()local Y=b7()local Z=b8()local _=b3()local bf=b4()local bg=b5()local ac=a1;local a2=a1:GetPos()local a3=a1:GetAngles()local a6=a1:GetMaterial()local bh=a1:GetColor()bh.a=b1()local O,ad;local ae=improvedstacker.GetDistance(P,X,a1)local bc;local bb=improvedstacker.GetGhosts()for ag=1,#bb do if ag==1||P==improvedstacker.MODE_PROP&&_ then O=improvedstacker.GetDirection(P,X,a3)ad=improvedstacker.GetOffset(P,X,a3,Y)end;a2=a2+O*ae+ad;improvedstacker.RotateAngle(P,X,a3,Z)local bc=bb[ag]bc:SetPos(a2)bc:SetAngles(a3)bc:SetMaterial(bf&&a6||"")bc:SetColor(bg&&bh||d)bc:SetNoDraw(false)ac=bc end end;hook.Add("PreDrawHalos",a.."_predrawhalos",function()local F=LocalPlayer()if!IsValid(F)then return end;local bi=F:GetEyeTrace().Entity;if!(IsValid(bi)&&bi:GetClass()=="prop_physics")then improvedstacker.ReleaseGhosts()improvedstacker.SetLookedAt(nil)return end;local bj=F:GetActiveWeapon()if!(IsValid(bj)&&bj:GetClass()=="gmod_tool"&&as&&as:GetString()==a)then improvedstacker.ReleaseGhosts()improvedstacker.SetLookedAt(nil)return end;improvedstacker.SetLookingAt(bi)local bk=improvedstacker.GetLookedAt()if bi==bk then if bd()then be(bi)else improvedstacker.ReleaseGhosts()improvedstacker.SetLookedAt(nil)return end else if ba(bi)then improvedstacker.SetLookedAt(bi)end end;if!b6()then return end;local bb=improvedstacker.GetGhosts()if!bb||#bb<=0 then return end;halo.Add(bb,b9())end)hook.Add("PostDrawTranslucentRenderables",a.."_directions",function(bl,bm)if bm then return end;local F=LocalPlayer()if!IsValid(F)then return end;if!(aM&&aM:GetBool())then return end;local a1=F:GetEyeTrace().Entity;if!IsValid(a1)then return end;local bj=F:GetActiveWeapon()if!(IsValid(bj)&&bj:GetClass()=="gmod_tool"&&as&&as:GetString()==a)then return end;local bn=a1:GetPos()local bo=a1:GetForward()local bp=a1:GetRight()local bq=a1:GetUp()render.DrawLine(bn,bn+bo*50,aU,false)render.DrawLine(bn+bo*50-bo*aT+Vector(0,0,aT),bn+bo*50,aU,false)render.DrawLine(bn+bo*50-bo*aT-Vector(0,0,aT),bn+bo*50,aU,false)render.DrawLine(bn+aP,bn+bo*50+aP,aU,false)render.DrawLine(bn+aQ,bn+bo*50+aQ,aU,false)render.DrawLine(bn,bn+bp*50,aV,false)render.DrawLine(bn+bp*50-bp*aT+bo*aT,bn+bp*50,aV,false)render.DrawLine(bn+bp*50-bp*aT-bo*aT,bn+bp*50,aV,false)render.DrawLine(bn+aP,bn+bp*50+aP,aV,false)render.DrawLine(bn+aQ,bn+bp*50+aQ,aV,false)render.DrawLine(bn,bn+bq*50,aW,false)render.DrawLine(bn+bq*50-bq*aT+bp*aT,bn+bq*50,aW,false)render.DrawLine(bn+bq*50-bq*aT-bp*aT,bn+bq*50,aW,false)render.DrawLine(bn+aR,bn+bq*50+aR,aW,false)render.DrawLine(bn+aS,bn+bq*50+aS,aW,false)if!(aN&&aO)then return end;if!(aN:GetBool()||aO:GetBool())then return end;local br=(bn+bo*50-bq*5):ToScreen()local bs=(bn+bp*50-bq*5):ToScreen()local bt=(bn+bq*55):ToScreen()local bu=a1:GetAngles()local bv=("%s%s"):format(aN:GetBool()&&b(c.."hud_front").." "||"",aO:GetBool()&&"("..bu.x..")"||"")local bw=("%s%s"):format(aN:GetBool()&&b(c.."hud_right").." "||"",aO:GetBool()&&"("..bu.y..")"||"")local bx=("%s%s"):format(aN:GetBool()&&b(c.."hud_up").." "||"",aO:GetBool()&&"("..bu.z..")"||"")cam.Start2D()draw.SimpleTextOutlined(bv,a.."_direction",br.x,br.y,aU,0,0,1,aX)draw.SimpleTextOutlined(bw,a.."_direction",bs.x,bs.y,aV,0,0,1,aX)draw.SimpleTextOutlined(bx,a.."_direction",bt.x,bt.y,aW,1,0,1,aX)cam.End2D()end)end;if CLIENT then local function by(bz)local bA={Label="Presets",MenuButton=1,Folder=a,Options={[b(c.."combobox_default")]={[a.."_mode"]=tostring(improvedstacker.MODE_PROP),[a.."_direction"]=tostring(improvedstacker.DIRECTION_UP),[a.."_count"]="1",[a.."_freeze"]="1",[a.."_weld"]="1",[a.."_nocollide"]="1",[a.."_ghostall"]="1",[a.."_material"]="1",[a.."_physprop"]="1",[a.."_color"]="1",[a.."_offsetx"]="0",[a.."_offsety"]="0",[a.."_offsetz"]="0",[a.."_pitch"]="0",[a.."_yaw"]="0",[a.."_roll"]="0",[a.."_relative"]="1",[a.."_draw_halos"]="0",[a.."_halo_r"]="255",[a.."_halo_g"]="0",[a.."_halo_b"]="0",[a.."_halo_a"]="255",[a.."_draw_axis"]="1",[a.."_axis_labels"]="1",[a.."_axis_angles"]="0"}},CVars={a.."_mode",a.."_direction",a.."_count",a.."_freeze",a.."_weld",a.."_nocollide",a.."_ghostall",a.."_material",a.."_physprop",a.."_color",a.."_offsetx",a.."_offsety",a.."_offsetz",a.."_pitch",a.."_yaw",a.."_roll",a.."_relative",a.."_draw_halos",a.."_halo_r",a.."_halo_g",a.."_halo_b",a.."_halo_a",a.."_draw_axis",a.."_axis_labels",a.."_axis_angles"}}local bB={[b(c.."combobox_world")]={[a.."_mode"]=improvedstacker.MODE_WORLD},[b(c.."combobox_prop")]={[a.."_mode"]=improvedstacker.MODE_PROP}}local bC={Label=b(c.."label_relative"),MenuButton="0",Options=bB}local bD={["1 - "..b(c.."combobox_direction_front")]={[a.."_direction"]=improvedstacker.DIRECTION_FRONT},["2 - "..b(c.."combobox_direction_back")]={[a.."_direction"]=improvedstacker.DIRECTION_BACK},["3 - "..b(c.."combobox_direction_right")]={[a.."_direction"]=improvedstacker.DIRECTION_RIGHT},["4 - "..b(c.."combobox_direction_left")]={[a.."_direction"]=improvedstacker.DIRECTION_LEFT},["5 - "..b(c.."combobox_direction_up")]={[a.."_direction"]=improvedstacker.DIRECTION_UP},["6 - "..b(c.."combobox_direction_down")]={[a.."_direction"]=improvedstacker.DIRECTION_DOWN}}local bE={Label=b(c.."label_direction"),MenuButton="0",Options=bD}local bF={}for bG,bH in pairs(localify.GetLocalizations())do if!b(c.."language_"..bG,bG)then continue end;bF[b(c.."language_"..bG,bG)]={localify_language=bG}end;local bI={Label=b(c.."label_language"),MenuButton=0,Options=bF}bz:AddControl("ComboBox",bI)bz:ControlHelp("\n"..b(c.."label_credits"))bz:AddControl("Label",{Text=b(c.."label_presets")})bz:AddControl("ComboBox",bA)bz:AddControl("Checkbox",{Label=b(c.."checkbox_freeze"),Command=a.."_freeze"})bz:AddControl("Checkbox",{Label=b(c.."checkbox_weld"),Command=a.."_weld"})bz:AddControl("Checkbox",{Label=b(c.."checkbox_nocollide"),Command=a.."_nocollide"})bz:AddControl("ComboBox",bC)bz:AddControl("ComboBox",bE)bz:AddControl("Slider",{Label=b(c.."label_count"),Min=1,Max=v:GetInt(),Command=a.."_count",Description="How many props to create in each stack"})bz:AddControl("Button",{Label=b(c.."label_reset_offsets"),Command=a.."_reset_offsets"})bz:AddControl("Slider",{Label=b(c.."label_x"),Type="Float",Min=-x:GetInt(),Max=x:GetInt(),Value=0,Command=a.."_offsetx"})bz:AddControl("Slider",{Label=b(c.."label_y"),Type="Float",Min=-y:GetInt(),Max=y:GetInt(),Value=0,Command=a.."_offsety"})bz:AddControl("Slider",{Label=b(c.."label_z"),Type="Float",Min=-z:GetInt(),Max=z:GetInt(),Value=0,Command=a.."_offsetz"})bz:AddControl("Button",{Label=b(c.."label_reset_angles"),Command=a.."_reset_angles"})bz:AddControl("Slider",{Label=b(c.."label_pitch"),Type="Float",Min=-g,Max=g,Value=0,Command=a.."_pitch"})bz:AddControl("Slider",{Label=b(c.."label_yaw"),Type="Float",Min=-g,Max=g,Value=0,Command=a.."_yaw"})bz:AddControl("Slider",{Label=b(c.."label_roll"),Type="Float",Min=-g,Max=g,Value=0,Command=a.."_roll"})bz:AddControl("Button",{Label=b(c.."label_"..(h&&"hide"||"show").."_settings"),Command=a.."_show_settings"})if h then bz:AddControl("Checkbox",{Label=b(c.."checkbox_use_shift_key"),Command=a.."_use_shift_key",Description="Toggles the ability to hold SHIFT and click the left and right mouse buttons to change stack size"})bz:AddControl("Checkbox",{Label=b(c.."checkbox_relative"),Command=a.."_relative",Description="Stacks each prop relative to the prop right before it. This allows you to create curved stacks"})bz:AddControl("Checkbox",{Label=b(c.."checkbox_material"),Command=a.."_material",Description="Applies the material of the original prop to all stacked props"})bz:AddControl("Checkbox",{Label=b(c.."checkbox_color"),Command=a.."_color",Description="Applies the color of the original prop to all stacked props"})bz:AddControl("Checkbox",{Label=b(c.."checkbox_physprop"),Command=a.."_physprop",Description="Applies the physical properties of the original prop to all stacked props"})bz:AddControl("Checkbox",{Label=b(c.."checkbox_ghost"),Command=a.."_ghostall",Description="Creates every ghost prop in the stack instead of just the first ghost prop"})bz:AddControl("Checkbox",{Label=b(c.."checkbox_axis"),Command=a.."_draw_axis"})bz:AddControl("Checkbox",{Label=b(c.."checkbox_axis_labels"),Command=a.."_axis_labels"})bz:AddControl("Checkbox",{Label=b(c.."checkbox_axis_angles"),Command=a.."_axis_angles"})bz:AddControl("Checkbox",{Label=b(c.."checkbox_halo"),Command=a.."_draw_halos",Description="Gives halos to all of the props in to ghosted stack"})bz:AddControl("Slider",{Label=b(c.."label_opacity"),Type="Integer",Min=0,Max=255,Command=a.."_opacity"})bz:AddControl("Color",{Label=b(c.."checkbox_halo_color"),Red=a.."_halo_r",Green=a.."_halo_g",Blue=a.."_halo_b",Alpha=a.."_halo_a"})end end;concommand.Add(a.."_show_settings",function(F,G,H)local bz=controlpanel.Get(a)if!IsValid(bz)then return end;h=!h;bz:ClearControls()by(bz)end)cvars.AddChangeCallback("localify_language",function(bJ,bK,bL)local bz=controlpanel.Get(a)if!IsValid(bz)then return end;bz:ClearControls()by(bz)end,"improvedstacker")TOOL.BuildCPanel=by;hook.Add("PopulateToolMenu",a.."AdminUtilities",function()spawnmenu.AddToolMenuOption("Utilities","Admin",a.."_utils",b(c.."name"),"","",function(bz)local bA={label="Presets",menubutton=1,folder=a.."_admin",options={[b(c.."combobox_default")]=improvedstacker.SETTINGS_DEFAULT,[b(c.."combobox_sandbox")]=improvedstacker.SETTINGS_SANDBOX,[b(c.."combobox_darkrp")]=improvedstacker.SETTINGS_DARKRP,[b(c.."combobox_singleplayer")]=improvedstacker.SETTINGS_SINGLEPLAYER},cvars={{CVar=a.."_max_per_player",CCmd=a.."_set_max_per_player"},{CVar=a.."_max_per_stack",CCmd=a.."_set_max_per_stack"},{CVar=a.."_delay",CCmd=a.."_set_delay"},{CVar=a.."_max_offsetx",CCmd=a.."_set_max_offsetx"},{CVar=a.."_max_offsety",CCmd=a.."_set_max_offsety"},{CVar=a.."_max_offsetz",CCmd=a.."_set_max_offsetz"},{CVar=a.."_force_freeze",CCmd=a.."_set_force_freeze"},{CVar=a.."_force_weld",CCmd=a.."_set_force_weld"},{CVar=a.."_force_nocollide",CCmd=a.."_set_force_nocollide"},{CVar=a.."_force_stayinworld",CCmd=a.."_set_force_stayinworld"}}}local bM=vgui.Create("StackerControlPresets",bz)bM:SetPreset(bA.folder)for bN,bO in pairs(bA.options)do bM:AddOption(bN,bO)end;for bN,bO in pairs(bA.cvars)do bM:AddConVar(bO)end;bz:AddItem(bM)local bP=Color(210,210,210)||Color(179,216,255)local bQ=Color(240,240,240)||Color(229,242,255)local bR={{String="max_per_player",Min=-1,Max=2048,Decimals=0},{String="max_per_stack",Min=1,Max=100,Decimals=0},{String="delay",Min=0,Max=5},{String="max_offsetx",Min=0,Max=10000},{String="max_offsety",Min=0,Max=10000},{String="max_offsetz",Min=0,Max=10000}}local bS=vgui.Create("DListLayout",bz)bS:DockPadding(3,1,3,3)bS:SetPaintBackground(true)function bS:Paint(bT,bU)draw.RoundedBox(0,0,0,bT,bU,bP)end;bz:AddItem(bS)for bN,aj in pairs(bR)do local list=vgui.Create("DListLayout",bS)list:DockPadding(5,0,5,5)list:DockMargin(0,2,0,0)list:SetPaintBackground(true)function list:Paint(bT,bU)draw.RoundedBox(0,0,0,bT,bU,bQ)end;local bV=aj.Decimals||2;local bW=vgui.Create("StackerDNumSlider",list)bW:SetText(b(c.."label_"..aj.String))bW.Label:SetFont("DermaDefaultBold")bW:SetMinMax(aj.Min,aj.Max)bW:SetDark(true)bW:SizeToContents()bW:SetDecimals(bV)bW:SetValue(bV==0&&GetConVar(a.."_"..aj.String):GetInt()||GetConVar(a.."_"..aj.String):GetFloat(),true)local G=a.."_set_"..aj.String;function bW:OnValueChanged(bX)bX=math.Round(bX,bV)RunConsoleCommand(G,bX)end;if b(c.."help_"..aj.String)then local bY=vgui.Create("DLabel",list)bY:SetText(b(c.."help_"..aj.String))bY:DockMargin(10,0,5,0)bY:SetWrap(true)bY:SetDark(true)bY:SetAutoStretchVertical(true)bY:SetFont("DermaDefault")end;if b(c.."warning_"..aj.String)then local bY=vgui.Create("DLabel",list)bY:SetText(b(c.."warning_"..aj.String))bY:DockMargin(10,0,5,0)bY:SetWrap(true)bY:SetDark(true)bY:SetAutoStretchVertical(true)bY:SetFont("DermaDefault")bY:SetTextColor(Color(200,0,0))end;cvars.AddChangeCallback(a.."_"..aj.String,function(bJ,bK,bL)if!IsValid(bW)then return end;bW:SetValue(GetConVar(a.."_"..aj.String):GetFloat(),true)end,a.."_"..aj.String.."_utilities")end;local bZ={"freeze","weld","nocollide","nocollide_all","stayinworld"}local b_=vgui.Create("DListLayout",bz)b_:DockPadding(3,1,3,3)b_:SetPaintBackground(true)function b_:Paint(bT,bU)draw.RoundedBox(0,0,0,bT,bU,bP)end;bz:AddItem(b_)for bN,aj in pairs(bZ)do local list=vgui.Create("DListLayout",b_)list:DockPadding(5,5,5,5)list:DockMargin(0,2,0,0)list:SetPaintBackground(true)function list:Paint(bT,bU)draw.RoundedBox(0,0,0,bT,bU,bQ)end;local c0=vgui.Create("DCheckBoxLabel",list)c0:SetText(b(c.."checkbox_"..aj))c0:SetChecked(GetConVar(a.."_force_"..aj):GetBool())c0.Label:SetFont("DermaDefaultBold")c0:SizeToContents()c0:SetDark(true)if aj=="nocollide_all"then c0:SetDisabled(true)end;function c0:OnChange(c1)RunConsoleCommand(a.."_set_force_"..aj,c1&&"1"||"0")end;cvars.AddChangeCallback(a.."_force_"..aj,function(bJ,bK,bL)if!IsValid(c0)then return end;c0:SetChecked(tobool(bL))end,a.."_"..aj.."_utilities")if b(c.."help_"..aj)then local bY=vgui.Create("DLabel",list)bY:SetText(b(c.."help_"..aj))bY:DockMargin(25,5,5,0)bY:SetWrap(true)bY:SetDark(true)bY:SetAutoStretchVertical(true)bY:SetFont("DermaDefault")end;if b(c.."warning_"..aj)then local bY=vgui.Create("DLabel",list)bY:SetText(b(c.."warning_"..aj))bY:DockMargin(25,5,5,0)bY:SetWrap(true)bY:SetDark(true)bY:SetAutoStretchVertical(true)bY:SetFont("DermaDefault")bY:SetTextColor(Color(200,0,0))end end end)end)end;if CLIENT then net.Receive(a.."_error",function(c2)surface.PlaySound("buttons/button10.wav")notification.AddLegacy(net.ReadString(),net.ReadUInt(e),f)end)end
--addons/!lpakr_out/lua/improvedweight/improvedweight.lua:
module("improvedweight",package.seeall)if SERVER then elseif CLIENT then function GetOriginalWeight(a,b)return a:GetNWFloat("OriginalWeight",b)end;function GetModifiedWeight(a,b)return a:GetNWFloat("ModifiedWeight",b)end end
--addons/!lpakr_out/lua/wire/stools/dataport.lua:
WireToolSetup.setCategory("Advanced")WireToolSetup.open("dataport","Data - Port","gmod_wire_dataport",nil,"Data Ports")if CLIENT then language.Add("Tool.wire_dataport.name","Data port tool (Wire)")language.Add("Tool.wire_dataport.desc","Spawns data port consisting of 8 ports")TOOL.Information={{name="left",text="Create/Update data port"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar["model"]="models/jaanus/wiretool/wiretool_gate.mdl"function TOOL.BuildCPanel(a)ModelPlug_AddToCPanel(a,"gate","wire_dataport",nil,4)end
--addons/!lpakr_out/lua/wire/stools/exit_point.lua:
WireToolSetup.setCategory("Vehicle Control")WireToolSetup.open("exit_point","Vehicle Exit Point","gmod_wire_exit_point",nil,"Exit Points")if CLIENT then language.Add("tool."..TOOL.Mode..".name",TOOL.Name.." Tool (Wire)")language.Add("tool."..TOOL.Mode..".desc","Spawns a "..TOOL.Name)WireToolSetup.setToolMenuIcon("icon16/door_out.png")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(6)TOOL.ClientConVar={model="models/jaanus/wiretool/wiretool_range.mdl"}WireToolSetup.SetupLinking(false,"vehicle")function TOOL.BuildCPanel(a)ModelPlug_AddToCPanel(a,"Misc_Tools","wire_exit_point",true)end
--addons/!lpakr_out/lua/wire/stools/explosive.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/extbus.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/hoverball.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/pod.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/soundemitter.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/textscreen.lua:
WireToolSetup.setCategory("Visuals/Screens")WireToolSetup.open("textscreen","Text Screen","gmod_wire_textscreen",nil,"Text Screens")if CLIENT then language.Add("tool.wire_textscreen.name","Text Screen Tool (Wire)")language.Add("tool.wire_textscreen.desc","Spawns a screen that displays text.")language.Add("Tool_wire_textscreen_tsize","Text size:")language.Add("Tool_wire_textscreen_tjust","Horizontal alignment:")language.Add("Tool_wire_textscreen_valign","Vertical alignment:")language.Add("Tool_wire_textscreen_tfont","Text font:")language.Add("Tool_wire_textscreen_colour","Text colour:")language.Add("Tool_wire_textscreen_bgcolour","Background colour:")language.Add("Tool_wire_textscreen_createflat","Create flat to surface")language.Add("Tool_wire_textscreen_text","Default text:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name},{name="right",text="Copy settings"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/kobilica/wiremonitorbig.mdl",tsize=10,tjust=1,valign=0,tfont="Arial",tred=255,tblue=255,tgreen=255,tbgred=0,tbgblue=0,tbggreen=0,ninputs=3,createflat=1,text=""}function TOOL:RightClick(a)if!a.HitPos then return false end;local b=a.Entity;if b:IsPlayer()then return false end;if CLIENT then return true end;local c=self:GetOwner()if b:IsValid()&&b:GetClass()=="gmod_wire_textscreen"then c:ConCommand('wire_textscreen_text "'..b.text..'"')c:ConCommand('wire_textscreen_model "'..b:GetModel()..'"')c:ConCommand('wire_textscreen_tsize "'..16-b.chrPerLine..'"')c:ConCommand('wire_textscreen_tjust "'..b.textJust..'"')c:ConCommand('wire_textscreen_valign "'..b.valign..'"')c:ConCommand('wire_textscreen_tfont "'..b.tfont..'"')c:ConCommand('wire_textscreen_tred "'..b.fgcolor.r..'"')c:ConCommand('wire_textscreen_tgreen "'..b.fgcolor.g..'"')c:ConCommand('wire_textscreen_tblue "'..b.fgcolor.b..'"')c:ConCommand('wire_textscreen_tbgred "'..b.bgcolor.r..'"')c:ConCommand('wire_textscreen_tbggreen "'..b.bgcolor.g..'"')c:ConCommand('wire_textscreen_tbgblue "'..b.bgcolor.b..'"')return true end end;function TOOL.BuildCPanel(d)local e={"WireGPU_ConsoleFont","Coolvetica","Arial","Lucida Console","Trebuchet","Courier New","Times New Roman","ChatFont","Marlett","Verdana","Tahoma","HalfLife2","HL2cross","Trebuchet MS","HL2MP"}local f={}for g,h in ipairs(e)do f[h]={wire_textscreen_tfont=h}end;WireToolHelpers.MakePresetControl(d,"wire_textscreen")d:TextEntry("#Tool_wire_textscreen_text","wire_textscreen_text")d:NumSlider("#Tool_wire_textscreen_tsize","wire_textscreen_tsize",1,15,0)d:NumSlider("#Tool_wire_textscreen_tjust","wire_textscreen_tjust",0,2,0)d:NumSlider("#Tool_wire_textscreen_valign","wire_textscreen_valign",0,2,0)d:AddControl("ComboBox",{Label="#Tool_wire_textscreen_tfont",Options=f})d:CheckBox("#Tool_wire_textscreen_createflat","wire_textscreen_createflat")d:AddControl("Color",{Label="#Tool_wire_textscreen_colour",Red="wire_textscreen_tred",Green="wire_textscreen_tgreen",Blue="wire_textscreen_tblue",ShowAlpha="0",ShowHSV="1",ShowRGB="1",Multiplier="255"})d:AddControl("Color",{Label="#Tool_wire_textscreen_bgcolour",Red="wire_textscreen_tbgred",Green="wire_textscreen_tbggreen",Blue="wire_textscreen_tbgblue",ShowAlpha="0",ShowHSV="1",ShowRGB="1",Multiplier="255"})WireDermaExts.ModelSelect(d,"wire_textscreen_model",list.Get("WireScreenModels"),5)end
--addons/!lpakr_out/lua/wire/stools/twoway_radio.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/watersensor.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/remotecontroller.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_arm5.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_bo.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(0,-3.5,.3)SWEP.AimPos=Vector(0,-3.5,.3)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-7,2)SWEP.SprintAng=Vector(-25,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='BO Shotgun'SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(20,-2,-3)SWEP.IsShotgun=true;SWEP.PlayBackRate=1;SWEP.PlayBackRateSV=1;SWEP.BulletDiameter=5;SWEP.CaseLength=10;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/bf/v_bo.mdl'SWEP.WorldModel='models/galactic/weapons/bf/w_bo.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=8;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=.4;SWEP.FireSound=Sound'blaster.fire'SWEP.Recoil=4;SWEP.RecoilAngle=Angle(-1,0,0)SWEP.RecoilAngleSpread=Angle(.4,0,0)SWEP.ShotgunReload=false;SWEP.ReloadStartWait=0.6;SWEP.ReloadFinishWait=1.1;SWEP.ReloadShellInsertWait=0.6;SWEP.Chamberable=false;SWEP.HipSpread=0;SWEP.AimSpread=0;SWEP.ClumpSpread=.04;SWEP.VelocitySensitivity=2.2;SWEP.MaxSpreadInc=0.01;SWEP.SpreadPerShot=0.01;SWEP.SpreadCooldown=1.03;SWEP.Shots=4;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.Damage=35;SWEP.FireDistance=1000;SWEP.FireDistanceDegrade=25;SWEP.FireDistanceDegradeMulti=5;SWEP.FadeCrosshairOnAim=false;SWEP.UIPosition=Vector(-2,-60,0)SWEP.UIAngle=Angle(0,90,0)
--addons/!lpakr_out/lua/weapons/sup_cr2.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,0,-0.5)SWEP.AimPos=Vector(-4.971,-1.55,-1.142)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(5,0,-4)SWEP.SprintAng=Vector(-15,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;SWEP.PrintName='CR-2'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/bf/v_cr2.mdl'SWEP.WorldModel='models/galactic/weapons/bf/w_cr2.mdl'SWEP.UIPosition=Vector(-10,2,0)SWEP.UIAngle=Angle()SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=75;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.055;SWEP.FireSound=Sound'blaster.fire_smg'SWEP.ReloadSound=Sound'blaster.reload_smg'SWEP.Recoil=.4;SWEP.RecoilAngle=Angle(-1.3,0.1,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.025;SWEP.AimSpread=.03;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=28;SWEP.DeployTime=0;SWEP.ShowHands=true;SWEP.FadeCrosshairOnAim=true;SWEP.FireDistance=3000;SWEP.FireDistanceDegrade=300;SWEP.FireDistanceDegradeMulti=2;SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=true;SWEP.ZoomAmount=15;SWEP.AdjustableZoom=true;SWEP.MinZoom=1;SWEP.MaxZoom=35;SWEP.ZoomSteps=5;SWEP.ScopeOverrideMaterialIndex=5;SWEP.ScopeFOV=15;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=false;SWEP.ScopedBlur=false;SWEP.HasScope=true;SWEP.PreventQuickScoping=true;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,90,0)
--addons/!lpakr_out/lua/weapons/sup_dc15le.lua:
debug.Trace()
--addons/!lpakr_out/lua/weapons/sup_dc17_dual.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.AimPos=Vector(0,-5,0)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,-12,-10)SWEP.SprintAng=Vector(50,0,5)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='DC-17 Dual Side Arms'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.Akimbo=true;SWEP.AmmoOffset=Vector(20,-3,-2)SWEP.AmmoOffsetAng=Angle(-20,-90,90)SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.SprintingEnabled=false;SWEP.NormalHoldType='duel'SWEP.RunHoldType='normal'SWEP.FireModes={'semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=2;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc17dual.mdl'SWEP.WorldModel='models/galactic/weapons/wmodels/supdc17sdualworld.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=50;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=false;SWEP.FireDelay=.2;SWEP.FireSound=Sound'blaster.fire_pistol'SWEP.Recoil=1;SWEP.RecoilAngle=Angle(-1,0,0)SWEP.HipSpread=0.05;SWEP.AimSpread=0.005;SWEP.VelocitySensitivity=5;SWEP.MaxSpreadInc=0;SWEP.SpreadPerShot=0;SWEP.SpreadCooldown=0;SWEP.Shots=1;SWEP.Damage=55;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,180,0)
--addons/!lpakr_out/lua/weapons/sup_dc17mbr_s.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_detonator/cl_init.lua:
include'shared.lua'
--addons/!lpakr_out/lua/weapons/sup_flamethrower/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_flamethrower/shared.lua:
SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(-.2,-.8,0)SWEP.AimPos=Vector(0,0,0)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,-3,2.5)SWEP.SprintAng=Vector(-20,20,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='DC-15A Flamethrower'SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=1;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(24,-0.3,-4.5)SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='crossbow'SWEP.RunHoldType='passive'SWEP.NPCNormalHoldType='ar2'SWEP.FireModes={'auto','semi','direct'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/cac/weapons/v_flamethrower.mdl'SWEP.WorldModel='models/cac/weapons/flamethrower.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.Ammo='ammo_fuel'SWEP.Primary.ClipSize=100;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.15;SWEP.FireSound=Sound'blaster.fire'SWEP.RecoilAngle=Angle(-.3,0,0)SWEP.HipSpread=0.03;SWEP.AimSpread=0.015;SWEP.VelocitySensitivity=10;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.007;SWEP.SpreadCooldown=0.13;SWEP.Shots=1;SWEP.Damage=60;SWEP.DamageDirect=40;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.UIPosition=Vector(-5,-40,0)SWEP.UIAngle=Angle(0,90,0)SWEP.Flamethrower=true;SWEP.FlameThrowerInterval=1;SWEP.FlameThrowerEffect='[1]flamethrower_basic'SWEP.FireSoundLoop='flamethrower.fire'SWEP.FireDistance=400;SWEP.ThirdPerson=true;SWEP.OffsetEntityModel=Model'models/hunter/blocks/cube025x025x025.mdl'SWEP.MaxTypes={flame_small=20,flame_large=10,fire_ground_large=5,flame_spit=5,fireball_nomerge=10}SWEP.CharModel='models/player/charple.mdl'SWEP.CharMap={'models/monk.mdl'}game.AddParticles'particles/pfx_redux.pcf'PrecacheParticleSystem'[1]flamethrower_basic'sound.Add({name='flamethrower.fire',channel=CHAN_WEAPON,volume=.35,level=90,pitch=85,sound='thrusters/rocket00.wav'})function SWEP:OnSetupDataTables()self:NetworkVar('Float',4,'FireTimeout')self:NetworkVarNotify('FireTimeout',function(a,b,c,d)a:OnFlameStatusChanged(d)end)end;function SWEP:DoCustomFire(e,f,g)if CLIENT then return true end;self:TurnOnFlame()return true end;function SWEP:FireAnimFunc()end;function SWEP:DoCustomFireSound()return true end
--addons/!lpakr_out/lua/weapons/sup_gaz.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(-.5,-2,.5)SWEP.AimPos=Vector(-4.522,-3,0.484)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-3,1)SWEP.SprintAng=Vector(-25,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='DT-57 Gaz'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/tobester/weapons/v_gaz_blaster.mdl'SWEP.WorldModel='models/tobester/weapons/w_gaz_blaster.mdl'SWEP.AmmoOffset=Vector(20,0,-4)SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=60;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.125;SWEP.FireSound=Sound'blaster.fire_glaz'SWEP.ReloadSound=Sound'blaster.reload_smg'SWEP.Recoil=.2;SWEP.RecoilAngle=Angle(-1.0,-.2,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.03;SWEP.AimSpread=.03;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.HipRecoilSprintStep=-1;SWEP.Shots=1;SWEP.Damage=42;SWEP.DeployTime=0;SWEP.ShowHands=true;SWEP.UIPosition=Vector(0,-55,0)SWEP.UIAngle=Angle(0,-90,0)SWEP.SprintingEnabled=true;SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'SWEP.HasScope=true;SWEP.FadeCrosshairOnAim=true;SWEP.PreventQuickScoping=true;SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=true;SWEP.ZoomAmount=15;SWEP.AdjustableZoom=true;SWEP.MinZoom=1;SWEP.MaxZoom=35;SWEP.ZoomSteps=5;SWEP.ScopeOverrideMaterialIndex=1;SWEP.ScopeFOV=10;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=false;SWEP.ScopedBlur=false;SWEP.VelocitySensitivity=1.1;sound.Add({name='blaster.fire_glaz',channel=CHAN_WEAPON,volume=.35,level=90,pitch={95,100},sound={'weapons/gaz_fire_1.wav','weapons/gaz_fire_2.wav','weapons/gaz_fire_3.wav'}})
--addons/!lpakr_out/lua/weapons/sup_hotsonsniper.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.PrintName='Crimson'SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(0,-2,0)SWEP.AimPos=Vector(-4.806,-3,1.27)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,-10,-1)SWEP.SprintAng=Vector(-15,40,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.SkinSlotId=1;SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=false;SWEP.ZoomAmount=15;SWEP.AdjustableZoom=true;SWEP.MinZoom=1;SWEP.MaxZoom=35;SWEP.ZoomSteps=5;SWEP.ScopeOverrideMaterialIndex=3;SWEP.ScopeFOV=10;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=false;SWEP.ScopedBlur=false;SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(20,-1,-3)SWEP.PlayBackRate=5;SWEP.PlayBackRateSV=5;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.CanPenetrate=true;SWEP.HasScope=true;SWEP.FadeCrosshairOnAim=true;SWEP.PreventQuickScoping=true;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'bolt'}SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/tobester/weapons/v_hotson_blaster2.mdl'SWEP.WorldModel='models/tobester/weapons/w_hotson_blaster2.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=10;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=false;SWEP.FireDelay=2;SWEP.FireSound=Sound'hotson.fire_sniper'SWEP.Recoil=2.5;SWEP.RecoilAngle=Angle(-3.5,0,0)SWEP.HipDivRecoil=Vector(.05,.05,.05)SWEP.RecoilSpeed=10;SWEP.HipSpread=0.08;SWEP.AimSpread=0;SWEP.VelocitySensitivity=0;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.007;SWEP.SpreadCooldown=0.13;SWEP.Shots=1;SWEP.Damage=230;SWEP.DeployTime=3.5;SWEP.ShowHands=true;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,90,0)function SWEP:AdjustMouseSensitivity()if self.dt.State==SWB_AIMING then local a=math.Clamp(cvar.GetValue('weapon_aimsense_sniper')||1,0,1)return a>0&&a||.7 end end;sound.Add({name='hotson.fire_sniper',channel=CHAN_WEAPON,volume=.35,level=90,pitch={80,90},sound='weapons/hotson_snip_fire.mp3'})
--addons/!lpakr_out/lua/weapons/sup_se14r.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_vulkan.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_z6.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.AimPos=Vector(-5.08,-8,.02)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(-2,-10,2)SWEP.SprintAng=Vector(50,0,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.Tracer=1;SWEP.TracerName='sup_laser_blue'end;SWEP.PrintName='Z6'SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(18,-4,-4)SWEP.SpeedDec=75;SWEP.PlayBackRate=1;SWEP.PlayBackRateSV=1;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='crossbow'SWEP.RunHoldType='passive'SWEP.NPCNormalHoldType='ar2'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supz6.mdl'SWEP.WorldModel='models/galactic/weapons/wmodels/supz6world.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=250;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.085;SWEP.FireSound=Sound'blaster.z6_fire'SWEP.ReloadSound=Sound'blaster.reload_pistol'SWEP.Recoil=1.7;SWEP.HipSpread=0.05;SWEP.AimSpread=0.005;SWEP.VelocitySensitivity=25;SWEP.MaxSpreadInc=0.04;SWEP.SpreadPerShot=0.002;SWEP.SpreadCooldown=0.1;SWEP.Shots=1;SWEP.Damage=38;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.NPCMinShots=15;SWEP.NPCMaxShots=50;SWEP.NPCRestTimeMin=5;SWEP.NPCRestTimeMax=10;SWEP.NPCSpread=2;SWEP.ShotCooldown=.5;SWEP.FadeCrosshairOnAim=false;SWEP.UIPosition=Vector(-22,-45,-4)SWEP.UIAngle=Angle(180,-90,0)
--addons/!lpakr_out/lua/weapons/swb_base/cl_hud.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swsft_base.lua:
AddCSLuaFile()SWEP.Weight=5;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawAmmo=true;SWEP.DrawCrosshair=false;SWEP.ViewModelFlip=false;SWEP.CSMuzzleFlashes=false;SWEP.BounceWeaponIcon=false;SWEP.Author="Syntax_Error752"SWEP.Contact=""SWEP.Purpose="To eradicate the disease that is our enemy"SWEP.Instructions=""SWEP.Spawnable=false;SWEP.AdminSpawnable=false;SWEP.Primary.Recoil=0.5;SWEP.Primary.Damage=50;SWEP.Primary.NumShots=1;SWEP.Primary.Cone=0.0125;SWEP.Primary.Delay=0.175;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Primary.Tracer="sup_laser_red"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=false;SWEP.Secondary.Ammo="none"SWEP.ImpactEffectColor=Vector(255,255,255)function SWEP:Initialize()self:SetHoldType(self.HoldType)self:SetNetworkedBool("Ironsights",false)local a=self:GetOwner()if SERVER&&IsValid(a)&&a:IsNPC()then a:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)end end;function SWEP:Think()end;function SWEP:SetIronsights(b)self:SetNetworkedBool("Ironsights",b)end;SWEP.NextSecondaryAttack=0;function SWEP:SecondaryAttack()if!self.IronSightsPos then return end;if self.NextSecondaryAttack>CurTime()then return end;local c=!self:GetNetworkedBool("Ironsights",false)self:SetIronsights(c)self.NextSecondaryAttack=CurTime()+0.3 end;function SWEP:DrawHUD()if self:GetNetworkedBool("Ironsights")then return end;local d,e;if self:GetOwner()==LocalPlayer()&&self:GetOwner():ShouldDrawLocalPlayer()then local f=util.GetPlayerTrace(self:GetOwner())local g=util.TraceLine(f)local h=g.HitPos:ToScreen()d,e=h.x,h.y else d,e=ScrW()/2.0,ScrH()/2.0 end;local i=10*self.Primary.Cone;local j=self:GetNetworkedFloat("LastShootTime",0)i=i*(2-math.Clamp((CurTime()-j)*5,0.0,1.0))surface.SetDrawColor(255,255,255,255)local k=55*i;local l=k+60*i;surface.DrawLine(d-l,e,d-k,e)surface.DrawLine(d+l,e,d+k,e)surface.DrawLine(d,e-l,d,e-k)surface.DrawLine(d,e+l,d,e+k)end;function SWEP:OnRestore()self.NextSecondaryAttack=0;self:SetIronsights(false)end;function SWEP:DoImpactEffect(f,m)if f.HitSky then return true end;util.Decal('fadingscorch',f.HitPos+f.HitNormal,f.HitPos-f.HitNormal)local n=EffectData()n:SetStart(self.ImpactEffectColor)n:SetOrigin(f.HitPos)n:SetNormal(f.HitNormal)util.Effect('cwbase_impact',n)return true end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/weapons/weapon_claw_damage.lua:
AddCSLuaFile()SWEP.PrintName='Claw Attack+'SWEP.Author='Scott'SWEP.HoldType='normal'SWEP.Category='SUP Weapons'SWEP.UseHands=false;SWEP.Slot=1;SWEP.SlotPos=1;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.WorldModel=''SWEP.Primary.Damage=0;SWEP.Primary.NumShots=0;SWEP.Primary.Cone=0;SWEP.Primary.Delay=0;SWEP.Primary.ClipSize=0;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.Primary.Ammo='none'SWEP.Primary.TakeAmmo=0;SWEP.Primary.Tracer=0;SWEP.Primary.TracerName='none'SWEP.Secondary.Ammo='none'SWEP.ViewModelFlip=false;SWEP.AnimPrefix='rpg'SWEP.DrawCrosshair=false;function SWEP:Deploy()end;function SWEP:Initialize()self:SetHoldType(self.HoldType)end;function SWEP:PrimaryAttack()if CLIENT then return true end;self:SetNextPrimaryFire(CurTime()+2)self:GetOwner():PlayAnimation('zombie_attack_0'..math.random(1,7))self:DoAttack()end;function SWEP:SecondaryAttack()if CLIENT then return true end;self:SetNextSecondaryFire(CurTime()+10)self:GetOwner():PlayAnimation('zombie_attack_frenzy')self:DoAttack(true)end;function SWEP:DoAttack(a)local b=self.Weapon;local c=self:GetOwner()local d=a&&48||64;local e=c:GetAimVector()local f=c:EyePos()local g=f+e*d;local h;local i;local j;local k;c:LagCompensation(true)local l={}l.start=f;l.endpos=g;l.filter=c;l.mask=MASK_SOLID;l.mins=Vector(-16,-16,-18)l.maxs=Vector(16,16,18)local m=util.TraceLine(l)local n=util.TraceHull(l)local o=IsValid(n.Entity)&&n||m;c:LagCompensation(false)local p=o.Hit&&!o.HitSky;local q=o.Entity;local r=q&&(q:IsPlayer()||q:IsNPC())&&IsValid(q)if p then if q&&IsValid(q)then j=r&&self:EntityFaceBack(q)k=a&&(j&&160||80)||j&&100||math.random(0,5)==3&&70||50;local s=DamageInfo()s:SetAttacker(c)s:SetInflictor(self)s:SetDamage(k)s:SetDamageType(bit.bor(DMG_BULLET,DMG_NEVERGIB))s:SetDamageForce(e*1000)s:SetDamagePosition(g)q:DispatchTraceAttack(s,o,e)else util.Decal("ManhackCut",o.HitPos+o.HitNormal,o.HitPos-o.HitNormal)end end;local t=a&&1.0||p&&0.5||0.4;b:SetNextPrimaryFire(CurTime()+t)b:SetNextSecondaryFire(CurTime()+t)c:SetAnimation(PLAYER_ATTACK1)h=p&&(a&&(j&&ACT_VM_SWINGHARD||ACT_VM_HITCENTER2)||(j&&ACT_VM_SWINGHIT||ACT_VM_HITCENTER))||(a&&ACT_VM_MISSCENTER2||ACT_VM_MISSCENTER)if h then b:SendWeaponAnim(h)end;if r then c:EmitSound('npc/zombie/claw_strike'..math.random(3)..'.wav',SNDLVL_30dB,100,volume)else c:EmitSound('npc/zombie/claw_miss'..math.random(2)..'.wav',SNDLVL_30dB,100,volume)end;return true end;function SWEP:EntityFaceBack(u)local v=self:GetOwner():GetAngles().y-u:GetAngles().y;if v<-180 then v=360+v end;if v<=90&&v>=-90 then return true end;return false end;function SWEP:Holster()if!SERVER then return true end;self:GetOwner():DrawViewModel(true)self:GetOwner():DrawWorldModel(true)return true end;function SWEP:Reload()if CLIENT then return end;if self.NextReload&&self.NextReload>CurTime()then return end;local w=self:GetOwner()if w:KeyDown(IN_SPEED)then self:GetOwner():EmitSound('npc/zombie/zombie_voice_idle'..math.random(14)..'.wav',SNDLVL_30dB,100,volume)else self:GetOwner():EmitSound('npc/zombie/zombie_alert'..math.random(3)..'.wav',SNDLVL_30dB,100,volume)end;self.NextReload=CurTime()+5 end;function SWEP:DrawWorldModel()end;function SWEP:PreDrawViewModel(x)return true end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_cisvibrosword.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_consular_leo.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dreadsk2.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Katen Kyokotsu"SWEP.Class="weapon_lightsaber_dreadsk2"SWEP.DualWielded=true;SWEP.SaberDamage=285;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=200;SWEP.RegenSpeed=.75;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.UseLoopSound="dread_loop"SWEP.UseSwingSound="dread_swing"SWEP.UseOnSound="dread_soundon"SWEP.UseOffSound="dread_soundoff"SWEP.DamageType=DMG_DISSOLVE;SWEP.Base="wos_adv_dual_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dual_guardian.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Dual Guardian Lightsabers"SWEP.Class="weapon_lightsaber_dual_guardian"SWEP.DualWielded=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=225;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Force Leap","Force Repulse","Force Push","Force Pull","Saber Throw"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_dual_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_electrostaff_master.lua:
AddCSLuaFile()SWEP.Author='Robotboy655 + King David + Scott'SWEP.Category='Lightsabers'SWEP.Contact=''SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=2;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel='models/weapons/v_crowbar.mdl'SWEP.WorldModel='models/galactic/weapons/electrostaff/electrostaff.mdl'SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo='none'SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo='none'SWEP.PrintName='Master Electrostaff'SWEP.Class='weapon_lightsaber_electrostaff_master'SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=300;SWEP.SaberBurnDamage=20;SWEP.MaxForce=250;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.IgnoreHiltCosmetic=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb","Force Heal","Saber Throw","Force Repulse","Force Pull","Force Push"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=true;SWEP.NoGlow=true;SWEP.UseHilt='models/galactic/weapons/electrostaff/electrostaff.mdl'SWEP.UseLength=40;SWEP.UseWidth=false;SWEP.UseColor=Color(255,50,255)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base='wos_adv_single_lightsaber_base'SWEP.HolsterBone='forward'function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*-10+c:Up()*-6;c:RotateAroundAxis(c:Up(),45)return b,c end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_event_dual.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=false;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Event Dual Lightsaber"SWEP.Class="weapon_lightsaber_event_dual"SWEP.DualWielded=true;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=300;SWEP.SaberBurnDamage=10;SWEP.MaxForce=250;SWEP.RegenSpeed=2;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb","Saber Throw","Lightning Coil","Cloak"}SWEP.DevestatorList={}SWEP.UseHilt="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=Color(255,20,20)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_dual_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_master.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Master Lightsaber"SWEP.Class="weapon_lightsaber_master"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=300;SWEP.SaberBurnDamage=10;SWEP.MaxForce=250;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb","Force Heal","Force Pull","Saber Throw","Force Repulse","Force Push"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.UseHilt="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_renji.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/wos/lct/weapons/lightsabers/kingsaber2.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Renji\'s Sentinels"SWEP.Class="weapon_lightsaber_renji"SWEP.DualWielded=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_dual_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_sentinel.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Sentinel Lightsaber"SWEP.Class="weapon_lightsaber_sentinel"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=10;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.UseForms={["Agile"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Strike","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.UseHilt="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=Color(255,255,51)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_sentinel_shiro.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="SUP Custom Weapons"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Gojo's Hollow Technique"SWEP.Class="weapon_lightsaber_sentinel_shiro"SWEP.DualWielded=true;SWEP.SaberDamage=285;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=200;SWEP.RegenSpeed=.75;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.DamageType=DMG_DISSOLVE;SWEP.Base="wos_adv_dual_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_vibrosword.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_vibrosword.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David + Scott"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/galactic/weapons/vibrosword/brownvibrosword.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Vibro Sword"SWEP.Class="weapon_lightsaber_vibrosword"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.MaxForce=175;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Repulse","Force Push","Force Pull","Saber Throw"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=true;SWEP.NoGlow=true;SWEP.UseHilt="models/galactic/weapons/vibrosword/brownvibrosword.mdl"SWEP.UseLength=42;SWEP.UseWidth=false;SWEP.UseColor=Color(255,50,255)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.Base="wos_adv_single_lightsaber_base"SWEP.HolsterBone='ValveBiped.Bip01_Spine'function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*2+c:Forward()*15;c:RotateAroundAxis(c:Up(),5)c:RotateAroundAxis(c:Forward(),15)return b,c end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_wos_dual.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_repairtool/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_revive.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_shield.lua:
AddCSLuaFile()SWEP.shieldDamage=10;SWEP.bashReloadTime=2;SWEP.stunTime=1;SWEP.canBeDestroyedByDamage=true;SWEP.onlyExplosionDamage=true;SWEP.defaultHealth=500;SWEP.BashSound=Sound'Flesh.ImpactHard'SWEP.Slot=3;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.Author='Drover'SWEP.Contact=''SWEP.Purpose=''SWEP.IconLetter=''SWEP.PrintName='Shield'SWEP.ViewModelFOV=62;SWEP.ViewModelFlip=false;SWEP.AnimPrefix='physgun'SWEP.HoldType='physgun'SWEP.Spawnable=true;SWEP.AdminOnly=false;SWEP.Category='SUP Weapons'SWEP.ViewModel=Model('models/drover/shield.mdl')SWEP.WorldModel=Model('models/drover/w_shield.mdl')SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo=''SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=0;SWEP.Secondary.Automatic=false;SWEP.Secondary.Ammo=''SWEP.SkinSlotId=0;SWEP.UIPosition=Vector(0,-5,2)SWEP.UIAngle=Angle(0,0,0)function SWEP:Initialize()self:SetHoldType'physgun'end;function SWEP:SetupShield()if CLIENT then return end;local a=self:GetOwner()self.shield=ents.Create'prop_physics'self.shield:SetModel'models/drover/2w_shield.mdl'self.shield:Spawn()self.shield:SetModelScale(0,0)self:SetPropOwner(a,true)local b=self.shield:GetPhysicsObject()if!IsValid(b)then return end;b:SetMass(5000)local c=false;local d=a:LookupAttachment'anim_attachment_RH'if d==nil||d==0 then d=a:LookupAttachment'forward'c=true;if d==nil||d==0 then return end end;local e=c&&-20||3;local f=c&&17||11;local g=c&&0||20;local h=c&&90||70;local i=0;local j=a:GetAttachment(d)self.shield:SetPos(j.Pos+j.Ang:Up()*e+j.Ang:Forward()*f+j.Ang:Right()*i)j.Ang:RotateAroundAxis(j.Ang:Forward(),g)j.Ang:RotateAroundAxis(j.Ang:Up(),h)self.shield:SetAngles(j.Ang)self.shield:SetCollisionGroup(COLLISION_GROUP_WORLD)self.shield:SetParent(a,d)timer.Simple(0.2,function()if IsValid(self)&&IsValid(self.shield)then self.shield:SetModelScale(1,0)net.Start'shield.nodraw'net.WriteEntity(self)net.WriteEntity(self.shield)net.Send(a)end end)end;function SWEP:FreezeEnemy(k)k:Freeze(true)timer.Create('unfreezemeswep'..k:EntIndex(),self.stunTime,3,function()if IsValid(k)then k:Freeze(false)end end)end;function SWEP:FindEnemy()local a=self:GetOwner()local l=Vector(-10,-10,-3)local m=Vector(10,10,40)local n=a:GetPos()+a:GetForward()*35+Vector(0,0,40)local o=util.TraceHull({start=n,endpos=n+Vector(0,0,5),mins=l,maxs=m,filter={a,self.shield,Entity(0)}})if o.Hit then if o.Entity:IsPlayer()then return o.Entity end;return false end;return false end;function SWEP:ShieldBash()local p=self:FindEnemy()if p==false then return end;local a=self:GetOwner()p:TakeDamage(self.shieldDamage,a,self)self:FreezeEnemy(p)a:EmitSound(self.BashSound)end;function SWEP:PrimaryAttack()self:SetNextPrimaryFire(CurTime()+self.bashReloadTime)self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)if CLIENT then return end;net.Start'shield.bash'net.WriteEntity(self:GetOwner())net.Broadcast()self:ShieldBash()end;function SWEP:SecondaryAttack()end;function SWEP:PlaceShield()local a=self:GetOwner()local q=a:GetAngles()q.p=0;q.r=0;local r,n,s=srp.build.GetTransform(a,80,50)if!r then return end;local t=ents.Create'shield't:SetPos(n)t:SetAngles(Angle(0,a:EyeAngles().y,0))t:SetPropOwner(a,true)t:Spawn()t:GetPhysicsObject():EnableMotion(false)t:SetOwnerName(a:Nick())t:SetShieldOwner(a)if a:IsTalentSelected'shieldbuff'then t:CreateAura()end;self:Remove()end;function SWEP:ViewModelDrawn(u)if IsValid(self.shield)&&!self.shield:GetNoDraw()then self.shield:SetNoDraw(true)end;if IsValid(self.shield)&&self.SubMaterials then for v,w in pairs(self.SubMaterials)do self.shield:SetSubMaterial(v,w)end end end;function SWEP:DrawWorldModel()if IsValid(self.shield)&&self.shield:GetNoDraw()then self.shield:SetNoDraw(false)end end;function SWEP:Reload()end;function SWEP:Deploy()self:SetHoldType'physgun'self:SetupShield()return true end;function SWEP:RemoveShields()if SERVER&&IsValid(self.shield)then self.shield:Remove()end end;function SWEP:Holster()self:RemoveShields()return true end;function SWEP:OnDrop()self:RemoveShields()end;function SWEP:OnRemove()self:RemoveShields()end;function SWEP:LoadSkins()local x=cosmetics.GetEquipped(self:GetOwner(),self:GetClass(),cosmetics.WEAPON,cosmetics.SLOT.WEAPON.SKIN)if x then self:SetCosmetics(x)end end;function SWEP:SetCosmetics(x)local k=self:GetOwner()if!IsValid(k)then return end;if x:GetSlot()==cosmetics.SLOT.WEAPON.SKIN then if x:GetMaterial()then self.SubMaterials={[self.SkinSlotId]=x:GetMaterial():GetName()}elseif x:GetSubMaterials()then self.SubMaterials=x:GetSubMaterials()end end end;function SWEP:RemoveCosmetics(x)self:SetSubMaterial()self.Draw=self.O_Draw;if x:GetSlot()==cosmetics.SLOT.WEAPON.SKIN then self.SubMaterials=nil end end;if SERVER then else net('shield.nodraw',function()local y=net.ReadEntity()local t=net.ReadEntity()if IsValid(t)then t:SetNoDraw(true)if IsValid(y)then y.shield=t end end end)net('shield.bash',function()local k=net.ReadEntity()if IsValid(k)&&k:IsPlayer()&&k:Alive()then k:AnimRestartGesture(GESTURE_SLOT_GRENADE,ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND,true)end end)end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/shared.lua:
ENT.Base="base_nextbot"ENT.Type="nextbot"ENT.IsDrGEntity=true;ENT.IsDrGNextbot=true;ENT.PrintName="Template"ENT.Category="Other"ENT.Models={"models/player/kleiner.mdl"}ENT.Skins={0}ENT.ModelScale=1;ENT.CollisionBounds=Vector(10,10,72)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=true;DrGBase.IncludeFile'status.lua'ENT.SpawnHealth=100;ENT.HealthRegen=0;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;DrGBase.IncludeFile'ai.lua'DrGBase.IncludeFile'patrol.lua'ENT.BehaviourType=AI_BEHAV_BASE;ENT.Omniscient=false;ENT.SpotDuration=30;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=50;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.AvoidAfraidOfRange=500;ENT.WatchAfraidOfRange=750;DrGBase.IncludeFile'relationships.lua'ENT.DefaultRelationship=D_NU;ENT.Factions={}ENT.Frightening=false;ENT.AllyDamageTolerance=0.33;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.33;DrGBase.IncludeFile'awareness.lua'DrGBase.IncludeFile'detection.lua'ENT.EyeBone=""ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.Spawnable=true;DrGBase.IncludeFile'locomotion.lua'DrGBase.IncludeFile'path.lua'ENT.Acceleration=1000;ENT.Deceleration=1000;ENT.JumpHeight=50;ENT.StepHeight=20;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;DrGBase.IncludeFile'movements.lua'ENT.UseWalkframes=false;ENT.WalkSpeed=100;ENT.RunSpeed=200;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=60;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(0,0,0)DrGBase.IncludeFile'animations.lua'ENT.WalkAnimation=ACT_WALK;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_RUN;ENT.RunAnimRate=1;ENT.IdleAnimation=ACT_IDLE;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_JUMP;ENT.JumpAnimRate=1;ENT.OnSpawnSounds={}ENT.OnIdleSounds={}ENT.IdleSoundDelay=2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={}ENT.OnDownedSounds={}ENT.Footsteps={}DrGBase.IncludeFile'weapons.lua'ENT.UseWeapons=false;ENT.Weapons={}ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=true;DrGBase.IncludeFile'possession.lua'ENT.PossessionEnabled=false;ENT.PossessionPrompt=true;ENT.PossessionCrosshair=false;ENT.PossessionMovement=POSSESSION_MOVE_1DIR;ENT.PossessionViews={}ENT.PossessionBinds={}DrGBase.IncludeFile'drgbase/entity_helpers.lua'DrGBase.IncludeFile'behaviours.lua'DrGBase.IncludeFile'hooks.lua'DrGBase.IncludeFile'misc.lua'local a=CreateConVar("drgbase_nextbot_tickrate","-1",{FCVAR_ARCHIVE,FCVAR_NOTIFY,FCVAR_REPLICATED})local b=CreateConVar("drgbase_ai_patrol","1",{FCVAR_ARCHIVE,FCVAR_NOTIFY,FCVAR_REPLICATED})function ENT:Initialize()if SERVER then else self:SetIK(true)end;self:AddFlags(FL_OBJECT+FL_NPC)self._DrGBaseBaseThinkDelay=0;self._DrGBaseCustomThinkDelay=0;self._DrGBasePossessionThinkDelay=0;self._DrGBaseThinkDelayLong=0;self._DrGBaseThinkDelayMedium=0;self._DrGBaseThinkDelayShort=0;self:_InitModules()table.insert(DrGBase._SpawnedNextbots,self)self:CallOnRemove("DrGBaseCallOnRemove",function(self)table.RemoveByValue(DrGBase._SpawnedNextbots,self)if isstring(self._DrGBaseIdleSound)then self:StopSound(self._DrGBaseIdleSound)end;if SERVER&&self:IsPossessed()then self:Dispossess()end end)self:_BaseInitialize()self:CustomInitialize()if CLIENT then return end end;function ENT:_BaseInitialize()end;function ENT:CustomInitialize()end;function ENT:_InitModules()self:_InitHooks()self:_InitMisc()self:_InitAnimations()self:_InitMovements()self:_InitWeapons()self:_InitPossession()self:_InitRelationships()self:_InitAwareness()self:_InitDetection()self:_InitPatrol()self:_InitAI()end;function ENT:Think()self:_HandleAnimations()self:_HandleMovements()if#self.OnIdleSounds>0 then if SERVER&&!self.ClientIdleSounds||CLIENT&&self.ClientIdleSounds then local c=self.OnIdleSounds[math.random(#self.OnIdleSounds)]if self:EmitSlotSound("DrGBaseIdleSounds",SoundDuration(c)+self.IdleSoundDelay,c)then self._DrGBaseIdleSound=c end end end;if CurTime()>self._DrGBaseBaseThinkDelay then local d=self:_BaseThink()||0;self._DrGBaseBaseThinkDelay=CurTime()+d end;if CurTime()>self._DrGBaseCustomThinkDelay then local d=self:CustomThink()||0;self._DrGBaseCustomThinkDelay=CurTime()+d end;if self:IsPossessed()&&(SERVER||self:IsPossessedByLocalPlayer())then local e=self:GetPossessor()e:SetKeyValue("waterlevel",self:WaterLevel())self:_HandlePossession(false)if CurTime()>self._DrGBasePossessionThinkDelay then local d=self:PossessionThink(e)||0;self._DrGBasePossessionThinkDelay=CurTime()+d end end;if CLIENT then return end;local f=a:GetFloat()if f>0 then self:NextThink(CurTime()+1/f)return true end end;function ENT:_BaseThink()end;function ENT:CustomThink()end;function ENT:PossessionThink()end;if SERVER then else local g=CreateClientConVar("drgbase_navmesh_error","1",true,true)function ENT:_HandleNetMessage(h,...)local i,j=table.DrG_Pack(...)if h=="DrGBasePickupWeapon"then local k=i[1]if!IsValid(k)then return end;self._DrGBaseWeapons[k:GetClass()]=k;self:OnPickupWeapon(k,k:GetClass())return true elseif h=="DrGBaseDropWeapon"then local l=i[1]self._DrGBaseWeapons[l]=nil;self:OnDropWeapon(NULL,l)return true end end;local m=CreateClientConVar("drgbase_display_collisions","0")local n=CreateClientConVar("drgbase_display_sight","0")function ENT:Draw()if DrGBase.INFO_TOOL.Viewcam then local o=LocalPlayer():DrG_GetSelectedEntities()[1]if o==self then return end end;if self:ShouldDraw()then self:DrawModel()self:_BaseDraw()self:CustomDraw()end;self:_DrawDebug()if self:IsPossessedByLocalPlayer()then self:PossessionDraw()end end;function ENT:_BaseDraw()end;function ENT:CustomDraw()end;function ENT:PossessionDraw()end;function ENT:ShouldDraw()return true end;function ENT:_DrawDebug()if!GetConVar("developer"):GetBool()then return end;if m:GetBool()then local p,q=self:GetCollisionBounds()local r=self:GetPos()+self:OBBCenter()render.DrawWireframeBox(self:GetPos(),Angle(0,0,0),p,q,DrGBase.CLR_WHITE,false)render.DrawLine(r,r+self:GetVelocity(),DrGBase.CLR_ORANGE,false)render.DrawWireframeSphere(r,2*self:GetScale(),4,4,DrGBase.CLR_ORANGE,false)end;if n:GetBool()then local s=self:EyePos()local t=self:WasInSight(LocalPlayer())&&DrGBase.CLR_GREEN||DrGBase.CLR_RED;if self:IsPossessedByLocalPlayer()then t=DrGBase.CLR_ORANGE end;render.DrawWireframeSphere(s,2*self:GetScale(),4,4,t,false)render.DrawLine(s,s+self:EyeAngles():Forward()*15,t,false)end end end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/patrol.lua:
function ENT:_InitPatrol()if CLIENT then return end;self._DrGBaseAddedPatrols={}end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/path.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot_droidbase/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/dronesrewrite_controller/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/e60r_rocket/cl_init.lua:
include('shared.lua')function ENT:Draw()self:DrawModel()end;function ENT:Initialize()self.emitter=ParticleEmitter(self:GetPos())end;function ENT:Think()if!IsValid(self.emitter)then return end;local a=self:GetPos()local b=self:GetForward()for c=0,10 do local d=self.emitter:Add("particle/smokesprites_000"..math.random(1,9),a+b*-100*c)if d then d:SetVelocity(b*-2000)d:SetDieTime(math.Rand(1.5,3))d:SetStartAlpha(math.Rand(5,8))d:SetEndAlpha(0)d:SetStartSize(math.Rand(40,50))d:SetEndSize(math.Rand(130,150))d:SetRoll(math.Rand(0,360))d:SetRollDelta(math.Rand(-1,1))d:SetColor(200,200,200)d:SetAirResistance(200)d:SetGravity(Vector(100,0,0))end end end;function ENT:OnRemove()if IsValid(self.emitter)then self.emitter:Finish()end end
--addons/!lpakr_out/lua/entities/ent_flame_hotspot.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='base_anim'ENT.PrintName='Candle flame'ENT.Category='PPE: Fire & Smoke'ENT.Spawnable=true;ENT.AdminOnly=false;ENT.Model=Model'models/hunter/blocks/cube025x025x025.mdl'ENT.IgnoreNoGrav=true;ENT.IsFlame=true;ENT.Types={flame_small={particle='[1]groundflame1',duration=15,CanUpgrade=true,UpgradeRange=150,UpgradeCount=3,UpgradeTo='fire_ground_large',damage=10,sound='flame_small'},flame_large={particle='[1]campfire1',duration=25,damage=10},fire_ground_large={particle='[1]ground_fire_1',duration=35,damage=50,sound='flame_big',CollisionSize={Vector(-100,-100,0),Vector(100,100,100)}},fireball={particle='[1]fireplace_default',duration=15,gravity=true,sound='flame_small',CanUpgrade=true,UpgradeRange=100,UpgradeCount=5,UpgradeTo='fire_ground_large',UpgradeIgnoreGround=true},fireball_nomerge={particle='[1]fireplace_default',duration=5,gravity=true,sound='flame_small'}}sound.Add({name='flame_small',channel=CHAN_STATIC,volume=.4,level=70,pitch={98,102},sound={'ambient/fire/fire_small_loop1.wav','ambient/fire/fire_small_loop2.wav'}})sound.Add({name='flame_big',channel=CHAN_STATIC,volume=.35,level=65,pitch={98,102},sound='ambient/fire/fire_big_loop1.wav'})sound.Add({name='fire_emitted',channel=CHAN_STATIC,volume=.5,level=70,pitch={70,100},sound={'ambient/materials/rock1.wav','ambient/materials/rock2.wav','ambient/materials/rock3.wav','ambient/materials/rock4.wav','ambient/materials/rock5.wav'}})PrecacheParticleSystem'[1]campfire1'PrecacheParticleSystem'[1]groundflame1'PrecacheParticleSystem'[1]fireplace_default'PrecacheParticleSystem'[1]ground_fire_1'local a=Vector(0,0,1)local b,c=Vector(-10,-10,0),Vector(10,10,10)function ENT:CreateBiggerFlame(d)if!d.UpgradeIgnoreGround&&self:GetForward():Dot(a)!=1 then return end;local e=self:GetPos()local f=Vector()local g=0;local h={}for i,j in ents.Iterator()do if j==self then continue end;local k=j:GetPos()if j.IsFlame&&j.ParticleInfo.CanUpgrade&&k:Distance(e)<=d.UpgradeRange then f=f+k;g=g+1;table.insert(h,j)if g>=d.UpgradeCount then break end end end;if g<d.UpgradeCount then return end;for i,j in ipairs(h)do j:Remove()end;self:SetPos(f/g)self:DropToFloor()return self:SetFlameType(d.UpgradeTo)end;function ENT:SetFlameType(l,m)local d=self.Types[l]if!d then return end;if d.CanUpgrade then local n=self:CreateBiggerFlame(d)if n then return n end end;self.ParticleID=l;self.ParticleInfo=d;self.Damage=d.damage||nil;self.IsUpsideDown=math.Round(self:GetForward():Dot(a),0)==-1;if d.gravity then self.Gravity=true;self:SetGravity(0.1)self:SetMoveType(MOVETYPE_FLYGRAVITY)timer.Simple(0.5,function()if IsValid(self)then self:SetGravity(0.3)end end)end;if!m&&d.CollisionSize then self:SetCollisionBounds(d.CollisionSize[1],d.CollisionSize[2])self:Activate()end;if d.startsound then self:EmitSound(d.startsound)end;if d.sound then self.LoopingSound=self:StartLoopingSound(d.sound)end;timer.Simple(.4,function()if IsValid(self)&&d.particle then ParticleEffectAttach(d.particle,PATTACH_POINT_FOLLOW,self,0)end end)timer.Simple(d.duration,function()if IsValid(self)then self:Remove()end end)return l end;function ENT:Touch(j)if j==game.GetWorld()&&self.Gravity then self:SetMoveType(MOVETYPE_NONE)self.Gravity=false;return end;if!self.Damage then return end;if!(j:IsPlayer()||j:IsNPC())then return end;j.FlameThrowerTick=(j.FlameThrowerTick||0)+1;if j.FlameThrowerTick%10==0 then local o=DamageInfo()o:SetInflictor(self)o:SetAttacker(self)o:SetDamageType(DMG_BURN)o:SetDamage(self.Damage)j:TakeDamageInfo(o)j:Ignite(1,0)end end;function ENT:Think()if!self.IsUpsideDown||self.NextFireBall&&self.NextFireBall>CurTime()then return end;local j=ents.Create'ent_flame_hotspot'if!IsValid(j)then return end;j:SetPos(self:GetPos()-a*12)j:Spawn()j:SetFlameType('fireball',true)local p=-a:Angle()p:RotateAroundAxis(j:GetRight(),math.random(-35,35))p:RotateAroundAxis(j:GetForward(),math.random(-35,35))j:SetAngles(p)j:SetVelocity(j:GetForward()*50)j:EmitSound('fire_emitted')self.NextFireBall=CurTime()+2 end;function ENT:OnRemove()if self.LoopingSound then self:StopLoopingSound(self.LoopingSound)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/ent_textscreen/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/furniture_coffee.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gmod_cameraprop.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_addressbus.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_button.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_cd_disk.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire CD Disk"ENT.WireDebugName="CD"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.DiskMemory={}self.Precision=1;self.IRadius=12;self:Setup()end;function ENT:BuildDupeInfo()local a=BaseClass.BuildDupeInfo(self)||{}a.Precision=self.Precision;a.IRadius=self.IRadius;a.Skin=self:GetSkin()a["DiskMemory"]={}local b=0;for c,d in pairs(self.DiskMemory)do a["DiskMemory"][c]=b;a["DiskData"..b]={}for e,f in pairs(self.DiskMemory[c])do a["DiskData"..b][e]=isnumber(f)&&f||0 end;b=b+1 end;return a end;function ENT:ApplyDupeInfo(g,h,a,i)BaseClass.ApplyDupeInfo(self,g,h,a,i)self.Precision=a.Precision;self.IRadius=a.IRadius;self:SetSkin(a.Skin||0)self.DiskMemory={}for c,d in pairs(a["DiskMemory"])do local b=a["DiskMemory"][c]self.DiskMemory[c]={}for e,f in pairs(a["DiskData"..b])do self.DiskMemory[c][e]=isnumber(f)&&f||0 end end;self:Setup()end;function ENT:Setup(j,k,l)local m=self:OBBMins()local n=self:OBBMaxs()if j then self.Precision=math.floor(math.Clamp(j,1,64))end;if k then self.IRadius=math.max(k,0)end;if l then self.Skin=l;self:SetSkin(l)end;self.StackStartHeight=-m.z;self.DiskStacks=math.max(1,math.floor((n.z-m.z)/self.Precision)+1)self.DiskTracks=math.floor(0.5*math.min(n.x-m.x,n.y-m.y)/self.Precision)self.DiskSectors=0;self.TrackSectors={}self.FirstTrack=math.floor(self.IRadius/self.Precision)for o=self.FirstTrack,self.DiskTracks-1 do self.TrackSectors[o]=self.DiskSectors;self.DiskSectors=self.DiskSectors+math.floor(2*3.1415926*o)+1 end;self.DiskVolume=self.DiskSectors*self.DiskStacks;self.BytesPerBlock=512;self.DiskSize=self.DiskSectors*self.BytesPerBlock;self:ShowOutput()end;function ENT:ShowOutput()self:SetOverlayText("Effective size (per stack): "..self.DiskSize.." bytes ("..math.floor(self.DiskSize/1024).." kb)\n".."Tracks: "..self.DiskTracks.."\nSectors: "..self.DiskSectors.."\nStacks: "..self.DiskStacks)end;duplicator.RegisterEntityClass("gmod_wire_cd_disk",WireLib.MakeWireEnt,"Data","Precision","IRadius","Skin")
--addons/!lpakr_out/lua/entities/gmod_wire_cd_lock.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_cd_ray.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire CD Ray"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WireDebugName="CD Ray"function ENT:SetupDataTables()self:NetworkVar("Float",0,"BeamLength")end;if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=Wire_CreateInputs(self,{"Write","Read","Value","Range"})self.Outputs=Wire_CreateOutputs(self,{"Data","Sector","LocalSector","Track","Stack","Address"})self.Command={}self.Command[0]=0;self.Command[1]=0;self.Command[2]=0;self.Command[3]=0;self.Command[4]=0;self.Command[5]=0;self.Command[6]=0;self.Command[7]=0;self.Command[8]=0;self.Command[9]=0;self.Command[10]=0;self.Command[11]=0;self.Command[12]=0;self.Command[13]=0;self.Command[14]=0;self.Command[21]=0;self.Command[22]=0;self.Command[23]=0;self.Command[24]=0;self.Command[25]=0;self.Command[26]=0;self.Command[27]=0;self.Command[28]=0;self.Command[29]=0;self.Command[30]=0;self.Command[31]=0;self.Command[32]=0;self.WriteBuffer={}self.PrevDiskEnt=nil;self:SetBeamLength(64)end;function ENT:ReadCell(a)a=math.floor(a)if a>=0&&a<512 then if self.Command[a]then return self.Command[a]else return 0 end end;if a>=512&&a<1024 then if self.WriteBuffer[a-512]then return self.WriteBuffer[a-512]else return 0 end end;return nil end;function ENT:WriteCell(a,b)a=math.floor(a)if a>=0&&a<512 then self.Command[a]=b;if a==8 then self:DoJob()end;return true end;if a>=512&&a<1024 then if b!=0 then self.WriteBuffer[a-512]=b else self.WriteBuffer[a-512]=nil end;return true end;return false end;function ENT:Setup(c,d)self.DefaultZero=d;if c then self:SetBeamLength(c)end end;function ENT:TriggerInput(e,b)if e=="Write"then self.Command[0]=b;self.Command[8]=1;self.Command[9]=1 elseif e=="Read"then self.Command[1]=b;self.Command[8]=1;self.Command[9]=1 elseif e=="Value"then self.Command[8]=1;self.Command[9]=1;self.WriteBuffer[0]=b elseif e=="Range"then self:SetBeamLength(math.Clamp(b,0,32000))end end;function ENT:DoJob()if!self.Disk then return end;local f=self.Disk;if self.Command[8]!=0 then local g=true;if self.Command[10]!=0 then if self.Command[11]!=self.Command[7]then g=false end end;if self.Command[12]!=0 then if self.Command[13]!=self.Command[3]||self.Command[14]!=self.Command[4]then g=false end end;if g then if self.Command[9]==0 then self.Command[8]=0 end;local h=self.Sector.."."..self.Track.."."..self.Stack;if self.Command[0]!=0 then f.DiskMemory[h]=table.Copy(self.WriteBuffer)else self.WriteBuffer=table.Copy(f.DiskMemory[h])||{[0]=0}end end end end;function ENT:Think()local i=self:GetPos()local j=self:GetUp()local k={}k.start=i;k.endpos=i+j*self:GetBeamLength()k.filter={self}local k=util.TraceLine(k)if self.Command[0]!=0||self.Command[1]!=0 then if self.Command[0]==1 then self:SetColor(Color(0,0,255,255))else self:SetColor(Color(255,0,0,255))end else self:SetColor(Color(255,255,255,255))end;if k.Entity&&k.Entity:IsValid()&&k.Entity:GetClass()=="gmod_wire_cd_disk"then local l=k.HitPos;local f=k.Entity;local m=f:WorldToLocal(l)local n=f.Entity:GetPhysicsObject():GetAngleVelocity().z;local o=(m.x^2+m.y^2)^0.5;local p=math.fmod(3.1415926+math.atan2(m.x,m.y),2*3.1415926)local q=m.z-f.StackStartHeight;local r=math.floor(o/f.Precision)local s=math.floor(p*r)local t=math.floor(q/f.Precision)if f.DiskStacks==1 then t=0 end;if self.PrevDiskEnt!=f then self.PrevDiskEnt=f;self.Command[25]=f.Precision;self.Command[26]=f.DiskSectors;self.Command[27]=f.DiskTracks;self.Command[28]=f.FirstTrack;self.Command[29]=f.BytesPerBlock;self.Command[30]=f.DiskSize;self.Command[31]=f.DiskVolume;self.Command[32]=f.Entity:EntIndex()end;if r>=f.FirstTrack&&t>=0&&s>=0&&t<f.DiskStacks then self.Command[21]=n;self.Command[22]=p;self.Command[23]=o;self.Command[24]=q;if!f.TrackSectors[r]then f.TrackSectors[r]=0 end;self.Command[2]=f.DiskSectors*t+f.TrackSectors[r]+s;self.Command[3]=s;self.Command[4]=r;self.Command[5]=t;self.Command[6]=self.Command[2]*f.BytesPerBlock;self.Command[7]=(f.TrackSectors[r]+s)*f.BytesPerBlock;if self.Command[0]!=0||self.Command[1]!=0 then self.Sector=s;self.Track=r;self.Stack=t;self.Disk=f;self:DoJob()end else self.Command[21]=0;self.Command[22]=0;self.Command[23]=0;self.Command[24]=0;self.Command[2]=0;self.Command[3]=0;self.Command[4]=0;self.Command[5]=0;self.Command[6]=0;self.Command[7]=0 end else self.PrevDiskEnt=nil;self.Disk=nil;self.Command[2]=0;self.Command[3]=0;self.Command[4]=0;self.Command[5]=0;self.Command[6]=0;self.Command[7]=0;self.Command[21]=0;self.Command[22]=0;self.Command[23]=0;self.Command[24]=0;self.Command[25]=0;self.Command[26]=0;self.Command[27]=0;self.Command[28]=0;self.Command[29]=0;self.Command[30]=0;self.Command[31]=0;self.Command[32]=0 end;if self.WriteBuffer[0]then Wire_TriggerOutput(self,"Data",self.WriteBuffer[0])else Wire_TriggerOutput(self,"Data",0)end;Wire_TriggerOutput(self,"Sector",self.Command[2])Wire_TriggerOutput(self,"LocalSector",self.Command[3])Wire_TriggerOutput(self,"Track",self.Command[4])Wire_TriggerOutput(self,"Stack",self.Command[5])Wire_TriggerOutput(self,"Address",self.Command[6])self:NextThink(CurTime()+0.01)return true end;duplicator.RegisterEntityClass("gmod_wire_cd_ray",WireLib.MakeWireEnt,"Data","Range","DefaultZero")
--addons/!lpakr_out/lua/entities/gmod_wire_characterlcd/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_detonator.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_eyepod.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Eye Pod"ENT.Purpose="To control the player's view in a pod and output their mouse movements"ENT.WireDebugName="Eye Pod"if CLIENT then local a=false;local b=false;local c=true;local d=true;local e=false;usermessage.Hook("UpdateEyePodState",function(f)if!f then return end;local g=f:ReadAngle()a=f:ReadBool()b=f:ReadBool()c=f:ReadBool()&&g.p;d=f:ReadBool()&&g.y end)hook.Add("CreateMove","WireEyePodEyeControl",function(h)if a then currentAng=h:GetViewAngles()if c then currentAng.p=c end;if d then currentAng.y=d end;currentAng.r=0;h:SetViewAngles(currentAng)e=true elseif e then if b then h:SetViewAngles(Angle(0,90,0))else h:SetViewAngles(Angle(0,0,0))end;e=false end end)return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self:SetCollisionGroup(COLLISION_GROUP_WORLD)self:DrawShadow(false)self.Inputs=WireLib.CreateSpecialInputs(self,{"Enable","SetPitch","SetYaw","SetViewAngle","UnfreezePitch","UnfreezeYaw"},{"NORMAL","NORMAL","NORMAL","ANGLE","NORMAL","NORMAL"})self.Outputs=WireLib.CreateSpecialOutputs(self,{"X","Y","XY"},{"NORMAL","NORMAL","VECTOR2"})self.driver=nil;self.X=0;self.Y=0;self.enabled=false;self.pod=nil;self.eyeAng=Angle(0,0,0)self.rotate90=false;self.DefaultToZero=1;self.ShowRateOfChange=0;self.LastUpdateTime=CurTime()self.ClampXMin=0;self.ClampXMax=0;self.ClampYMin=0;self.ClampYMax=0;self.ClampX=0;self.ClampY=0;self.freezePitch=true;self.freezeYaw=true;local i=self:GetPhysicsObject()if i:IsValid()then i:Wake()end;self:ColorByLinkStatus(self.LINK_STATUS_UNLINKED)end;function ENT:UpdateOverlay()self:SetOverlayText(string.format("Default to Zero: %s\nCumulative: %s\nMin: %s,%s\nMax: %s,%s\n%s\n\nActivated: %s%s",self.DefaultToZero==1&&"Yes"||"No",self.ShowRateOfChange==0&&"Yes"||"No",self.ClampXMin,self.ClampYMin,self.ClampXMax,self.ClampYMax,IsValid(self.pod)&&"Linked to: "..self.pod:GetModel()||"Not linked",self.enabled&&"Yes"||"No",self.enabled==true&&IsValid(self.driver)&&"\nIn use by: "..self.driver:Nick()||""))end;function ENT:Setup(j,k,l,m,n,o,p,q)self.DefaultToZero=j;self.ShowRateOfChange=k;self.ClampXMin=l;self.ClampXMax=m;self.ClampYMin=n;self.ClampYMax=o;self.ClampX=p;self.ClampY=q;self:UpdateOverlay()end;local r={["models/props_c17/furniturechair001a.mdl"]=true,["models/airboat.mdl"]=true,["models/props_c17/chair_office01a.mdl"]=true,["models/nova/chair_office02.mdl"]=true,["models/nova/chair_office01.mdl"]=true,["models/props_combine/breenchair.mdl"]=true,["models/nova/chair_wood01.mdl"]=true,["models/nova/airboat_seat.mdl"]=true,["models/nova/chair_plastic01.mdl"]=true,["models/nova/jeep_seat.mdl"]=true,["models/props_phx/carseat.mdl"]=true,["models/props_phx/carseat2.mdl"]=true,["models/props_phx/carseat3.mdl"]=true,["models/buggy.mdl"]=true,["models/vehicle.mdl"]=true,["models/chairs_playerstart/airboatpose.mdl"]=true,["models/chairs_playerstart/jeeppose.mdl"]=true,["models/chairs_playerstart/sitposealt.mdl"]=true,["models/chairs_playerstart/pronepose.mdl"]=true,["models/chairs_playerstart/sitpose.mdl	"]=true,["models/chairs_playerstart/standingpose.mdl"]=true,["models/vehicles/pilot_seat.mdl"]=true}function ENT:PodLink(s)return self:LinkEnt(s)end;function ENT:LinkEnt(s)s=WireLib.GetClosestRealVehicle(s,self:GetPos(),self:GetPlayer())if!IsValid(s)||!s:IsVehicle()then if IsValid(self.pod)then self.pod.AttachedWireEyePod=nil end;self.pod=nil;self:UpdateOverlay()return false,"Must link to a vehicle"end;self.pod=s;s:CallOnRemove("wire_eyepod_remove",function()self:UnlinkEnt(s)end)self.rotate90=false;self.eyeAng=Angle(0,0,0)if IsValid(s)&&s:IsVehicle()then if r[string.lower(s:GetModel())]then self.rotate90=true;self.eyeAng=Angle(0,90,0)end end;s.AttachedWireEyePod=self;self:UpdateOverlay()WireLib.SendMarks(self,{s})self:ColorByLinkStatus(IsValid(s)&&self.LINK_STATUS_LINKED||self.LINK_STATUS_UNLINKED)return true end;function ENT:UnlinkEnt()if IsValid(self.pod)then self.pod.AttachedWireEyePod=nil;self.pod:RemoveCallOnRemove("wire_eyepod_remove")end;self.pod=nil;if IsValid(self.driver)then self:updateEyePodState(false)self.driver=nil end;WireLib.SendMarks(self,{})self:UpdateOverlay()self:ColorByLinkStatus(self.LINK_STATUS_UNLINKED)return true end;function ENT:updateEyePodState(a)self:ColorByLinkStatus(a&&self.LINK_STATUS_ACTIVE||self.LINK_STATUS_LINKED)umsg.Start("UpdateEyePodState",self.driver)umsg.Angle(self.eyeAng)umsg.Bool(a)umsg.Bool(self.rotate90)umsg.Bool(self.freezePitch)umsg.Bool(self.freezeYaw)umsg.End()end;hook.Add("PlayerEnteredVehicle","gmod_wire_eyepod_entervehicle",function(t,s)local u=s.AttachedWireEyePod;if u!=nil then if IsValid(u)then u.driver=s:GetDriver()u:updateEyePodState(u.enabled)u:UpdateOverlay()else s.AttachedWireEyePod=nil end end end)hook.Add("PlayerLeaveVehicle","gmod_wire_eyepod_leavevehicle",function(t,s)local u=s.AttachedWireEyePod;if u!=nil then if IsValid(u)then u:updateEyePodState(false)u.driver=nil;if(u.X!=0||u.Y!=0)&&u.DefaultToZero==1 then u.X=0;u.Y=0;WireLib.TriggerOutput(u,"X",0)WireLib.TriggerOutput(u,"Y",0)WireLib.TriggerOutput(u,"XY",{0,0})end;u:UpdateOverlay()else s.AttachedWireEyePod=nil end end end)function ENT:OnRemove()self:UnlinkEnt()end;local function v(w)return(w+180)%360-180 end;local function x(w)return(w+90)%180-90 end;function ENT:TriggerInput(y,z)if y=="Enable"then self.enabled=z!=0;if self.enabled==false&&self.DefaultToZero==1&&(self.X!=0||self.Y!=0)then self.X=0;self.Y=0;WireLib.TriggerOutput(self,"X",0)WireLib.TriggerOutput(self,"Y",0)WireLib.TriggerOutput(self,"XY",{0,0})end;self:UpdateOverlay()elseif y=="SetPitch"then self.eyeAng=Angle(x(z),self.eyeAng.y,self.eyeAng.r)elseif y=="SetYaw"then if self.rotate90==true then self.eyeAng=Angle(x(self.eyeAng.p),v(z+90),self.eyeAng.r)else self.eyeAng=Angle(x(self.eyeAng.p),v(z),self.eyeAng.r)end elseif y=="SetViewAngle"then if self.rotate90==true then self.eyeAng=Angle(x(z.p),v(z.y+90),0)else self.eyeAng=Angle(x(z.p),v(z.y),0)end elseif y=="UnfreezePitch"then self.freezePitch=z==0 elseif y=="UnfreezeYaw"then self.freezeYaw=z==0 end;if IsValid(self.pod)&&IsValid(self.driver)then self:updateEyePodState(self.enabled)end end;hook.Add("SetupMove","WireEyePodMouseControl",function(t,A)if!t then return end;if!t:InVehicle()then return end;local s=t:GetVehicle()if!IsValid(s)then return end;local B=s.AttachedWireEyePod;if!IsValid(B)then return end;if B.enabled then local C=t:GetCurrentCommand()local D=B.X;local E=B.Y;if B.ShowRateOfChange==1 then B.X=0;B.Y=0 end;B.X=C:GetMouseX()/10+B.X;B.Y=-C:GetMouseY()/10+B.Y;if B.ClampX==1 then B.X=math.Clamp(B.X,B.ClampXMin,B.ClampXMax)end;if B.ClampY==1 then B.Y=math.Clamp(B.Y,B.ClampYMin,B.ClampYMax)end;if D!=B.X||E!=B.Y then WireLib.TriggerOutput(B,"X",B.X)WireLib.TriggerOutput(B,"Y",B.Y)local F={B.X,B.Y}WireLib.TriggerOutput(B,"XY",F)end;C:SetMouseX(0)C:SetMouseY(0)end end)function ENT:BuildDupeInfo()local G=BaseClass.BuildDupeInfo(self)||{}if IsValid(self.pod)then G.pod=self.pod:EntIndex()end;return G end;function ENT:ApplyDupeInfo(t,H,G,I)BaseClass.ApplyDupeInfo(self,t,H,G,I)self:PodLink(I(G.pod))end;duplicator.RegisterEntityClass("gmod_wire_eyepod",WireLib.MakeWireEnt,"Data","DefaultToZero","ShowRateOfChange","ClampXMin","ClampXMax","ClampYMin","ClampYMax","ClampX","ClampY")
--addons/!lpakr_out/lua/entities/gmod_wire_fx_emitter.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/fx_emitter_default.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_hdd.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_holoemitter.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_keyboard/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_numpad.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_pixel.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_relay.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Relay"ENT.WireDebugName="Relay"ENT.Author="tad2020"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Value={}self.Last={}self.Inputs=Wire_CreateInputs(self,{"1A","2A","Switch"})self.Outputs=Wire_CreateOutputs(self,{"A"})end;function ENT:Setup(a,b,c,d,e,f,g,h,i,j,k)local l={"A","B","C","D","E","F","G","H"}j=j>10&&10||j;i=i>#l&&#l||i;local m={}self.outputs={}self.keygroup1=a;self.keygroup2=b;self.keygroup3=c;self.keygroup4=d;self.keygroup5=e;self.keygroupoff=f;self.toggle=g;self.normclose=h||0;self.selinput=h||0;self.poles=i;self.throws=j;self.nokey=k;for n=1,self.poles do self.outputs[n]=l[n]self.Value[n]=self.Value[n]||0;for o=1,self.throws do table.insert(m,o..l[n])self.Last[o..l[n]]=self.Last[o..l[n]]||0 end end;table.insert(m,"Switch")Wire_AdjustInputs(self,m)Wire_AdjustOutputs(self,self.outputs)self:Switch(h)if!k then local p=self:GetPlayer()if f then numpad.OnDown(p,f,"WireRelay_On",self,0)numpad.OnUp(p,f,"WireRelay_Off",self,0)end;if a then numpad.OnDown(p,a,"WireRelay_On",self,1)numpad.OnUp(p,a,"WireRelay_Off",self,1)end;if b then numpad.OnDown(p,b,"WireRelay_On",self,2)numpad.OnUp(p,b,"WireRelay_Off",self,2)end;if c then numpad.OnDown(p,c,"WireRelay_On",self,3)numpad.OnUp(p,c,"WireRelay_Off",self,3)end;if d then numpad.OnDown(p,d,"WireRelay_On",self,4)numpad.OnUp(p,d,"WireRelay_Off",self,4)end;if e then numpad.OnDown(p,e,"WireRelay_On",self,5)numpad.OnUp(p,e,"WireRelay_Off",self,5)end end end;function ENT:TriggerInput(q,r)if q=="Switch"then if math.abs(r)>=0&&math.abs(r)<=self.throws then self:Switch(math.abs(r))end elseif q then self.Last[q]=r||0;self:Switch(self.selinput)end end;function ENT:Switch(s)if!self:IsValid()then return false end;self.selinput=s;for n,t in ipairs(self.outputs)do self.Value[n]=self.Last[s..t]||0;Wire_TriggerOutput(self,t,self.Value[n])end;self:ShowOutput()return true end;function ENT:ShowOutput()local u=self.poles.."P"..self.throws.."T "if self.selinput==0 then u=u.."Sel: off"else u=u.."Sel: "..self.selinput end;for n,t in ipairs(self.outputs)do u=u.."\n"..t..": "..self.Value[n]end;self:SetOverlayText(u)end;function ENT:InputActivate(s)if self.toggle&&self.selinput==s then return self:Switch(self.normclose)else return self:Switch(s)end end;function ENT:InputDeactivate(s)if self.toggle then return true end;return self:Switch(self.normclose)end;local function v(p,w,s)if!w:IsValid()then return false end;return w:InputActivate(s)end;local function x(p,w,s)if!w:IsValid()then return false end;return w:InputDeactivate(s)end;numpad.Register("WireRelay_On",v)numpad.Register("WireRelay_Off",x)duplicator.RegisterEntityClass("gmod_wire_relay",WireLib.MakeWireEnt,"Data","keygroup1","keygroup2","keygroup3","keygroup4","keygroup5","keygroupoff","toggle","normclose","poles","throws","nokey")
--addons/!lpakr_out/lua/entities/gmod_wire_sensor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_soundemitter.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Sound Emitter"ENT.WireDebugName="Sound Emitter"if CLIENT then return end;local a={"synth/square.wav","synth/saw.wav","synth/tri.wav","synth/sine.wav"}function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=WireLib.CreateInputs(self,{"A","Toggle","Volume","Play","Stop","PitchRelative","Sample","SampleName [STRING]","Level"})self.Outputs=WireLib.CreateOutputs(self,{"Duration","Property Sound","Properties [ARRAY]","Memory"})self.Samples=table.Copy(a)self.Active=false;self.Volume=100;self.Level=80;self.Pitch=100;self.sound=self.Samples[1]self.NeedsRefresh=true;hook.Add("PlayerConnect",self:GetClass()..self:EntIndex(),function()self.NeedsRefresh=true end)end;function ENT:OnRemove()hook.Remove("PlayerConnect",self:GetClass()..self:EntIndex())self:StopSounds()BaseClass.OnRemove(self)end;function ENT:ReadCell(b)b=math.floor(b)if b==0 then return self.Active&&1||0 elseif b==1 then return self.Volume/100 elseif b==2 then return self.Pitch/100 elseif b==3 then return self.Outputs.Duration.Value elseif b==6 then return self.Level end end;local c={[0]="A",[1]="Volume",[2]="PitchRelative",[3]="Sample",[4]="Play",[5]="Stop",[6]="Level"}function ENT:WriteCell(b,d)b=math.floor(b)if c[b]then self:TriggerInput(c[b],d)return true else return false end end;function ENT:TriggerInput(e,d)if e=="Toggle"&&d!=0 then self:TriggerInput("A",!self.Active)elseif e=="A"then if d!=0 then self:TriggerInput("Play",1)else self:TriggerInput("Stop",1)end elseif e=="Play"&&d!=0 then if self.SoundProperties then self.NeedsRefresh=true;WireLib.TriggerOutput(self,"Duration",SoundDuration(self.sound))end;self.Active=true;self:StartSounds()elseif e=="Stop"&&d!=0 then self.Active=false;self:StopSounds()elseif e=="Volume"then self.Volume=math.Clamp(math.floor(d*100),0.0,100.0)elseif e=="Level"then self.Level=math.Clamp(d,55.0,165.0)elseif e=="PitchRelative"then self.Pitch=math.Clamp(math.floor(d*100),0,255)elseif e=="Sample"then self:TriggerInput("SampleName",self.Samples[d]||self.Samples[1])elseif e=="SampleName"then self:SetSound(d)end;self:UpdateSound()end;function ENT:UpdateSound()if self.NeedsRefresh||self.sound!=self.ActiveSample then self.NeedsRefresh=nil;local f=RecipientFilter()f:AddAllPlayers()if self.SoundObj then self.SoundObj:Stop()self.SoundObj=nil end;self.SoundObj=CreateSound(self,self.sound,f)self.ActiveSample=self.sound;self.SoundProperties=sound.GetProperties(self.sound)if self.SoundProperties then WireLib.TriggerOutput(self,"Duration",SoundDuration(self.sound))WireLib.TriggerOutput(self,"Property Sound",1)WireLib.TriggerOutput(self,"Properties",self.SoundProperties)else WireLib.TriggerOutput(self,"Property Sound",0)WireLib.TriggerOutput(self,"Properties",{})end;if self.Active then self:StartSounds()end end;self.SoundObj:ChangePitch(self.Pitch,0)self.SoundObj:ChangeVolume(self.Volume/100.0,0)self.SoundObj:SetSoundLevel(self.Level)end;function ENT:SetSound(g)self:StopSounds()g=WireLib.SoundExists(g)if!g then return end;self.sound=g;self.SoundProperties=sound.GetProperties(g)if self.SoundProperties then WireLib.TriggerOutput(self,"Duration",SoundDuration(g))WireLib.TriggerOutput(self,"Property Sound",1)WireLib.TriggerOutput(self,"Properties",self.SoundProperties)else WireLib.TriggerOutput(self,"Property Sound",0)WireLib.TriggerOutput(self,"Properties",{})end;self:SetOverlayText(g)end;function ENT:StartSounds()if self.NeedsRefresh then self:UpdateSound()end;if self.SoundObj then self.SoundObj:Play()end end;function ENT:StopSounds()if self.SoundObj then self.SoundObj:Stop()end end;function ENT:Setup(h)self:SetSound(h)end;duplicator.RegisterEntityClass("gmod_wire_soundemitter",WireLib.MakeWireEnt,"Data","sound")
--addons/!lpakr_out/lua/entities/gmod_wire_thruster.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_watersensor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_wheel.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/ladder_small4/shared.lua:
return lpakr()()
--addons/ssrp_lfs/lua/entities/lvs_atrt/shared.lua:
ENT.Base = "lvs_walker_atte_hoverscript"

ENT.PrintName = "AT-RT"
ENT.Author = "Deno"
ENT.Information = "Test"
ENT.Category = "[LVS] - Deno"

ENT.Spawnable		= true
ENT.AdminSpawnable	= false

ENT.MDL = "models/KingPommes/starwars/atrt/main.mdl"
ENT.GibModels = {
	"models/KingPommes/starwars/atrt/main.mdl"
}

ENT.AITEAM = 1

ENT.MaxHealth = 2700

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.HoverHeight = 73
ENT.HoverTraceLength = 400
ENT.HoverHullRadius = 5

ENT.JumpDelay = 1
ENT.JumpForce = 3000000
ENT.JumpChargeTime = 2 -- how long it takes to max charge a jump

ENT.MaxLandingUpVelocity = 1500
ENT.MaxLandingSideVelocity = 2500

ENT.LAATC_PICKUPABLE = true
ENT.LAATC_DROP_IN_AIR = true
ENT.LAATC_PICKUP_POS = Vector(-220,0,0)
ENT.LAATC_PICKUP_Angle = Angle(0,0,0)

ENT.CanMoveOn = {
	["func_door"] = true,
	["func_movelinear"] = true,
	["prop_physics"] = true,
}

ENT.lvsShowInSpawner = true

function ENT:OnSetupDataTables()
	self:AddDT( "Float", "Move" )
	self:AddDT( "Bool", "IsMoving" )
	self:AddDT( "Bool", "IsCarried" )
	self:AddDT( "Bool", "IsRagdoll" )
	self:AddDT( "Bool", "IsJumping" )
	self:AddDT( "Bool", "ProperJump" )
	self:AddDT( "Bool", "IsChargingJump" )
	self:AddDT( "Int", "LastJump")
	self:AddDT( "Vector", "AIAimVector" )

	if SERVER then
		self:NetworkVarNotify( "IsCarried", self.OnIsCarried )
	end
end

function ENT:GetContraption()
	return {self}
end

function ENT:GetEyeTrace()
	local startpos = self:GetPos()

	local pod = self:GetDriverSeat()

	if IsValid( pod ) then
		startpos = pod:LocalToWorld( Vector(0,0,60) )
	end

	local trace = util.TraceLine( {
		start = startpos,
		endpos = (startpos + self:GetAimVector() * 50000),
		filter = self:GetCrosshairFilterEnts()
	} )

	return trace
end

function ENT:GetAimVector()
	if self:GetAI() then
		return self:GetAIAimVector()
	end

	local Driver = self:GetDriver()

	if IsValid( Driver ) then
		return Driver:GetAimVector()
	else
		return self:GetForward()
	end
end

function ENT:GetMainAimAngles()
	local trace = self:GetEyeTrace()

	local AimAngles = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld( Vector(0,0,100)) ):GetNormalized():Angle() )

	local ID = self:LookupAttachment( "turret" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return AimAngles, trace.HitPos, false end

	local DirAng = self:WorldToLocalAngles( (trace.HitPos - self:GetDriverSeat():LocalToWorld( Vector(0,0,33) ) ):Angle() )

	return AimAngles, trace.HitPos, (math.abs( DirAng.p ) < 30) and math.abs( DirAng.y ) < 80
end

function ENT:ShootTurret(ent)
	local muzzle = self:GetAttachment( self:LookupAttachment( "turret" ) )

	if not muzzle then return end

	local AimAngles, AimPos, InRange = self:GetMainAimAngles()

	local Pos = muzzle.Pos
	local Dir = (AimPos - Pos):GetNormalized()

	if not InRange then return true end

	local bullet = {}
	bullet.Src 	= Pos
	bullet.Dir 	= Dir
	bullet.Spread 	= Vector( 0.01,  0.01, 0 )
	bullet.TracerName = "lvs_laser_green_short"
	bullet.Force	= 10
	bullet.HullSize 	= 30
	bullet.Damage	= 80
	bullet.SplashDamage = 40
	bullet.SplashDamageRadius = 100
	bullet.Velocity = 8000
	bullet.Attacker 	= ent:GetDriver()
	bullet.Callback = function(att, tr, dmginfo)
		local effectdata = EffectData()
			effectdata:SetStart( Vector(50,255,50) ) 
			effectdata:SetOrigin( tr.HitPos )
			effectdata:SetNormal( tr.HitNormal )
		util.Effect( "lvs_laser_impact", effectdata )
	end
	ent:LVSFireBullet( bullet )

	local effectdata = EffectData()
	effectdata:SetStart( Vector(50,255,50) )
	effectdata:SetOrigin( bullet.Src )
	effectdata:SetNormal( Dir )
	effectdata:SetEntity( ent )
	util.Effect( "lvs_muzzle_colorable", effectdata )

	ent:TakeAmmo()

	if not IsValid( ent.SNDPrimary ) then return end

	ent.SNDPrimary:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
end

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Ammo = 400
	weapon.Delay = 0.3

	weapon.Attack = function( ent )
		if ent:GetIsCarried() then return true end
		if self.Ammo == 0 then return false end

		return self:ShootTurret(ent)
	end

	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if IsValid( base ) and base:GetIsCarried() then return end

		local AimAngles = ent:GetMainAimAngles()

		local p = math.Clamp(AimAngles.p, -25, 35)
		local y = math.Clamp(AimAngles.y, -78, 78)

		ent:ManipulateBoneAngles(2, Angle(0,0,p))
		ent:ManipulateBoneAngles(1, Angle(y,0,0))
	end
	self:AddWeapon( weapon )
end
--addons/ssrp_lfs/lua/entities/lvs_base/shared.lua:
ENT.Type            = "anim"

ENT.PrintName = "LBaseEntity"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS]"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.AutomaticFrameAdvance = true
ENT.RenderGroup = RENDERGROUP_BOTH

ENT.Editable = true

ENT.CanChangeView = true
ENT.LVS = true

ENT.MDL = "models/props_c17/trappropeller_engine.mdl"

ENT.AITEAM = 2

ENT.MaxHealth = 100
ENT.MaxShield = 0

ENT.SpawnNormalOffset = 15
ENT.HitGroundLength = 10

function ENT:AddDT( type, name, data )
	if not self.DTlist then self.DTlist = {} end

	if self.DTlist[ type ] then
		self.DTlist[ type ] = self.DTlist[ type ] + 1
	else
		self.DTlist[ type ] = 0
	end

	self:NetworkVar( type, self.DTlist[ type ], name, data )
end

function ENT:CreateBaseDT()
	local InitWeaponsSuccess, ErrorMsg = pcall( function() self:InitWeapons() end )

	if not InitWeaponsSuccess then
		ErrorNoHalt( ErrorMsg.."\n" )
	end

	self:AddDT( "Entity", "Driver" )
	self:AddDT( "Entity", "DriverSeat" )

	self:AddDT( "Bool", "Active" )
	self:AddDT( "Bool", "EngineActive" )
	self:AddDT( "Bool", "AI",	{ KeyName = "aicontrolled",	Edit = { type = "Boolean",	order = 1,	category = "AI"} } )
	self:AddDT( "Bool", "lvsLockedStatus" )
	self:AddDT( "Bool", "lvsReady" )

	self:AddDT( "Int", "AITEAM", { KeyName = "aiteam", Edit = { type = "Int", order = 2, min = 0, max = 2, category = "AI"} } )
	self:AddDT( "Int", "SelectedWeapon" )
	self:AddDT( "Int", "NWAmmo" )

	self:AddDT( "Float", "HP", { KeyName = "health", Edit = { type = "Float", order = 2,min = 0, max = self.MaxHealth, category = "Misc"} } )
	self:AddDT( "Float", "Shield" )
	self:AddDT( "Float", "NWHeat" )

	if SERVER then
		self:NetworkVarNotify( "AI", self.OnToggleAI )
		self:NetworkVarNotify( "SelectedWeapon", self.OnWeaponChanged )

		self:SetAITEAM( self.AITEAM )
		self:SetHP( self.MaxHealth )
		self:SetShield( self.MaxShield )
		self:SetSelectedWeapon( 1 )
	end

	self:OnSetupDataTables()
end

function ENT:SetupDataTables()
	self:CreateBaseDT()
end

function ENT:OnSetupDataTables()
end

function ENT:CalcMainActivity( ply )
end

function ENT:UpdateAnimation( ply, velocity, maxseqgroundspeed )
	ply:SetPlaybackRate( 1 )

	if CLIENT then
		GAMEMODE:GrabEarAnimation( ply )
		GAMEMODE:MouthMoveAnimation( ply )
	end

	return false
end

function ENT:StartCommand( ply, cmd )
end

function ENT:HitGround()
	local trace = util.TraceLine( {
		start = self:LocalToWorld( self:OBBCenter() ),
		endpos = self:LocalToWorld( Vector(0,0,self:OBBMins().z - self.HitGroundLength) ),
		filter = self:GetCrosshairFilterEnts()
	} )

	return trace.Hit
end

function ENT:Sign( n )
	if n > 0 then return 1 end

	if n < 0 then return -1 end

	return 0
end

function ENT:VectorSubtractNormal( Normal, Velocity )
	local VelForward = Velocity:GetNormalized()

	local Ax = math.acos( math.Clamp( Normal:Dot( VelForward ) ,-1,1) )

	local Fx = math.cos( Ax ) * Velocity:Length()

	local NewVelocity = Velocity - Normal * math.abs( Fx )

	return NewVelocity
end

function ENT:AngleBetweenNormal( Dir1, Dir2 )
	return math.deg( math.acos( math.Clamp( Dir1:Dot( Dir2 ) ,-1,1) ) )
end

function ENT:GetMaxShield()
	return self.MaxShield
end

function ENT:GetShieldPercent()
	return self:GetShield() / self:GetMaxShield()
end

function ENT:GetMaxHP()
	return self.MaxHealth
end

function ENT:IsInitialized()
	if not self.GetlvsReady then return false end
	return self:GetlvsReady()
end

function ENT:GetPassengerSeats()
	if not self:IsInitialized() then return {} end

	if not istable( self.pSeats ) then
		self.pSeats = {}

		local DriverSeat = self:GetDriverSeat()

		for _, v in pairs( self:GetChildren() ) do
			if v ~= DriverSeat and v:GetClass():lower() == "prop_vehicle_prisoner_pod" then
				table.insert( self.pSeats, v )
			end
		end
	end

	return self.pSeats
end

function ENT:HasActiveSoundEmitters()
	local active = false

	for _, emitter in ipairs( self:GetChildren() ) do
		if emitter:GetClass() ~= "lvs_soundemitter" then continue end

		if not IsValid( emitter ) or not emitter.GetActive or not emitter.GetActiveVisible then continue end

		if emitter:GetActive() and emitter:GetActiveVisible() then
			active = true

			break
		end
	end

	return active
end

function ENT:GetPassenger( num )
	if num == 1 then
		return self:GetDriver()
	else
		for _, Pod in pairs( self:GetPassengerSeats() ) do
			local id = Pod:GetNWInt( "pPodIndex", -1 )
			if id == -1 then continue end

			if id == num then
				return Pod:GetDriver()
			end
		end

		return NULL
	end
end

function ENT:GetEveryone()
	local plys = {}

	local Pilot = self:GetDriver()
	if IsValid( Pilot ) then
		table.insert( plys, Pilot )
	end

	for _, Pod in pairs( self:GetPassengerSeats() ) do
		if not IsValid( Pod ) then continue end

		local ply = Pod:GetDriver()

		if not IsValid( ply ) then continue end

		table.insert( plys, ply )
	end

	return plys
end

function ENT:GetPodIndex()
	return 1
end

function ENT:PlayAnimation( animation, playbackrate )
	playbackrate = playbackrate or 1

	local sequence = self:LookupSequence( animation )

	self:ResetSequence( sequence )
	self:SetPlaybackRate( playbackrate )
	self:SetSequence( sequence )
end

function ENT:GetVehicle()
	return self
end

function ENT:GetRepairInfo(weapon)
	local item = srp.items.Get('METAL_REFINED_METAL')
	if not item then
		return
	end

	local percent = self:GetHP() / self.MaxHealth
	local count = math.ceil(4 * (1-percent))

	return item.name, count, percent, item.icon
end
--addons/ssrp_lfs/lua/entities/lvs_base_fakehover/shared.lua:

ENT.Base = "lvs_base"

ENT.PrintName = "[LVS] Generic Fake Hover"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS]"

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.ForceLinearMultiplier = 1
ENT.ForceLinearRate = 1

ENT.MaxVelocityX = 300
ENT.MaxVelocityY = 300

ENT.MaxTurnRate = 1

ENT.BoostAddVelocityX = 200
ENT.BoostAddVelocityY = 200

ENT.GroundTraceHitWater = true
ENT.GroundTraceLength = 50
ENT.GroundTraceHull = 100

function ENT:SetupDataTables()
	self:CreateBaseDT()

	self:AddDT( "Vector", "AIAimVector" )
	self:AddDT( "Bool", "Disabled" )

	if SERVER then
		self:NetworkVarNotify( "Disabled", self.OnDisabled )
	end
end

function ENT:HitGround()
	local data = {
		start = self:LocalToWorld( self:OBBCenter() ),
		endpos = self:LocalToWorld( Vector(0,0,self:OBBMins().z - self.GroundTraceLength) ),
		mins = Vector( -self.GroundTraceHull, -self.GroundTraceHull, 0 ),
		maxs = Vector( self.GroundTraceHull, self.GroundTraceHull, 0 ),
		filter = self:GetCrosshairFilterEnts()
	}

	local trace = util.TraceHull( data )

	data.mask = MASK_WATER

	local traceWater = util.TraceHull( data )

	return ((trace.Hit or (traceWater.Hit and self.GroundTraceHitWater)) and not trace.HitSky)
end

function ENT:GetThrottle()
	return math.min( self:GetVelocity():Length() / math.abs( self.MaxVelocityX + self.BoostAddVelocityX, self.MaxVelocityY + self.BoostAddVelocityY ), 1 )
end

function ENT:GetMaxThrottle()
	return 1
end

function ENT:GetThrustStrenght()
	return 0
end
--addons/ssrp_lfs/lua/entities/lvs_base_fighterplane/cl_flyby.lua:

ENT.FlyByAdvance = 0

function ENT:FlyByThink()
	local ply = LocalPlayer()

	if not IsValid( ply ) then return end

	if ply:lvsGetVehicle() == self then self.OldApproaching = false return end

	local ViewEnt = ply:GetViewEntity()

	if not IsValid( ViewEnt ) then return end

	local Time = CurTime()

	if (self._nextflyby or 0) > Time then return end

	self._nextflyby = Time + 0.1

	local Vel = self:GetVelocity()

	if self:GetThrottle() <= 0.75 or Vel:Length() <= self.MaxVelocity * 0.75 then return end

	local Sub = ViewEnt:GetPos() - self:GetPos() - Vel * self.FlyByAdvance
	local ToPlayer = Sub:GetNormalized()
	local VelDir = Vel:GetNormalized()

	local ApproachAngle = math.deg( math.acos( math.Clamp( ToPlayer:Dot( VelDir ) ,-1,1) ) )

	local Approaching = ApproachAngle < 80

	if Approaching ~= self.OldApproaching then
		self.OldApproaching = Approaching

		if Approaching then
			self:StopFlyBy()
		else
			self:OnFlyBy( 60 + 80 * math.min(ApproachAngle / 140,1) )
		end
	end
end

function ENT:OnFlyBy( Pitch )
	if not self.FlyBySound then return end

	self.flybysnd = CreateSound( self, self.FlyBySound )
	self.flybysnd:SetSoundLevel( 95 )
	self.flybysnd:PlayEx( 1, Pitch )
end

function ENT:StopFlyBy()
	if self.flybysnd then
		self.flybysnd:Stop()
		self.flybysnd = nil
	end
end
--addons/ssrp_lfs/lua/entities/lvs_base_starfighter/cl_hud.lua:
local black = Color(0,0,0,255)
ENT.IconEngine = Material( "lvs/engine.png" )

function ENT:LVSHudPaintInfoText( X, Y, W, H, ScrX, ScrY, ply )
	local kmh = math.Round(self:GetVelocity():Length() * 0.09144,0)
	draw.DrawText( "km/h ", "LVS_FONT", X + 72, Y + 35, color_white, TEXT_ALIGN_RIGHT )
	draw.DrawText( kmh, "LVS_FONT_HUD_LARGE", X + 72, Y + 20, color_white, TEXT_ALIGN_LEFT )

	if ply ~= self:GetDriver() then return end

	local Throttle = self:GetThrottle()
	local Col = Throttle <= 1 and color_white or black
	local hX = X + W - H * 0.5
	local hY = Y + H * 0.25 + H * 0.25

	surface.SetMaterial( self.IconEngine )
	surface.SetDrawColor( 0, 0, 0, 200 )
	surface.DrawTexturedRectRotated( hX + 4, hY + 1, H * 0.5, H * 0.5, 0 )
	surface.SetDrawColor( color_white )
	surface.DrawTexturedRectRotated( hX + 2, hY - 1, H * 0.5, H * 0.5, 0 )

	if not self:GetEngineActive() then
		draw.SimpleText( "X" , "LVS_FONT",  hX, hY, black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	self:LVSDrawCircle( hX, hY, H * 0.35, math.min( Throttle, 1 ) )

	if Throttle > 1 then
		draw.SimpleText( "+"..math.Round((Throttle - 1) * 100,0).."%" , "LVS_FONT",  hX, hY, Col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
end

function ENT:LVSPreHudPaint( X, Y, ply )
	return true
end

function ENT:LVSHudPaint( X, Y, ply )
	if not self:LVSPreHudPaint( X, Y, ply ) then return end

	if ply ~= self:GetDriver() then return end

	local HitPlane = self:GetEyeTrace( true ).HitPos:ToScreen()
	local HitPilot = self:GetEyeTrace().HitPos:ToScreen()

	self:PaintCrosshairCenter( HitPlane )
	self:PaintCrosshairOuter( HitPilot )

	if ply:lvsMouseAim() and not ply:lvsKeyDown( "FREELOOK" ) then
		self:LVSHudPaintMouseAim( HitPlane, HitPilot )
	end

	self:LVSPaintHitMarker( HitPlane )
end

function ENT:LVSHudPaintDirectInput( Pos2D )
	self:PaintCrosshairCenter( Pos2D )
	self:PaintCrosshairOuter( Pos2D )
end

function ENT:LVSHudPaintMouseAim( HitPlane, HitPilot )
	local Sub = Vector(HitPilot.x,HitPilot.y,0) - Vector(HitPlane.x,HitPlane.y,0)
	local Len = Sub:Length()
	local Dir = Sub:GetNormalized()

	surface.SetDrawColor( 255, 255, 255, 100 )
	if Len > 20 then
		surface.DrawLine( HitPlane.x + Dir.x * 5, HitPlane.y + Dir.y * 5, HitPilot.x - Dir.x * 20, HitPilot.y- Dir.y * 20 )

		-- shadow
		surface.SetDrawColor( 0, 0, 0, 50 )
		surface.DrawLine( HitPlane.x + Dir.x * 5 + 1, HitPlane.y + Dir.y * 5 + 1, HitPilot.x - Dir.x * 20+ 1, HitPilot.y- Dir.y * 20 + 1 )
	end
end

--addons/ssrp_lfs/lua/entities/lvs_base_turret/shared.lua:

ENT.Base = "lvs_base"

ENT.PrintName = "[LVS] Base Starfighter"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS]"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.MaxVelocity = 3000
ENT.MaxThrust = 3000

ENT.ThrustVtol = 55
ENT.ThrustRateVtol = 3

ENT.ThrottleRateUp = 0.6
ENT.ThrottleRateDown = 0.6

ENT.TurnRatePitch = 1
ENT.TurnRateYaw = 1
ENT.TurnRateRoll = 1

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

function ENT:SetupDataTables()
	self:CreateBaseDT()

	self:AddDT( "Vector", "Steer" )
	self:AddDT( "Vector", "AIAimVector" )
	self:AddDT( "Vector", "NWVtolMove" )
	self:AddDT( "Float", "NWThrottle" )
	self:AddDT( "Float", "MaxThrottle" )

	if SERVER then
		self:SetMaxThrottle( 1 )
	end
end

function ENT:PlayerDirectInput( ply, cmd )--[[
	local Pod = self:GetDriverSeat()

	local Delta = FrameTime()

	local KeyLeft = ply:lvsKeyDown( "-ROLL_SF" )
	local KeyRight = ply:lvsKeyDown( "+ROLL_SF" )
	local KeyPitchUp = ply:lvsKeyDown( "+PITCH_SF" )
	local KeyPitchDown = ply:lvsKeyDown( "-PITCH_SF" )

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

	self:SetSteer( F )]]
end

function ENT:PlayerMouseAim( ply, cmd )--[[
	if CLIENT then return end

	local Pod = self:GetDriverSeat()

	local PitchUp = ply:lvsKeyDown( "+PITCH_SF" )
	local PitchDown = ply:lvsKeyDown( "-PITCH_SF" )
	local YawRight = ply:lvsKeyDown( "+YAW_SF" )
	local YawLeft = ply:lvsKeyDown( "-YAW_SF" )
	local RollRight = ply:lvsKeyDown( "+ROLL_SF" )
	local RollLeft = ply:lvsKeyDown( "-ROLL_SF" )

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

	self:ApproachTargetAngle( EyeAngles, OverridePitch, OverrideYaw, OverrideRoll, FreeLook )]]
end

function ENT:CalcThrottle( ply, cmd )--[[
	if CLIENT then return end

	local Delta = FrameTime()

	local ThrottleUp =  ply:lvsKeyDown( "+THRUST_SF" ) and self.ThrottleRateUp or 0
	local ThrottleDown = ply:lvsKeyDown( "-THRUST_SF" ) and -self.ThrottleRateDown or 0

	local Throttle = (ThrottleUp + ThrottleDown) * Delta

	self:SetThrottle( self:GetThrottle() + Throttle )]]
end

function ENT:CalcVtolThrottle( ply, cmd )--[[
	local Delta = FrameTime()

	local ThrottleZero = self:GetThrottle() <= 0

	local VtolX = ThrottleZero and (ply:lvsKeyDown( "-VTOL_X_SF" ) and -1 or 0) or 0
	local VtolY = ((ply:lvsKeyDown( "+VTOL_Y_SF" ) and 1 or 0) - (ply:lvsKeyDown( "-VTOL_Y_SF" ) and 1 or 0))
	local VtolZ = ((ply:lvsKeyDown( "+VTOL_Z_SF" ) and 1 or 0) - (ply:lvsKeyDown( "-VTOL_Z_SF" ) and 1 or 0))

	local DesiredVtol = Vector(VtolX,VtolY,VtolZ)
	local NewVtolMove = self:GetNWVtolMove() + (DesiredVtol - self:GetNWVtolMove()) * self.ThrustRateVtol * Delta

	if not ThrottleZero or self:WorldToLocal( self:GetPos() + self:GetVelocity() ).x > 100 then
		NewVtolMove.x = 0
	end

	self:SetVtolMove( NewVtolMove )]]
end

function ENT:SetVtolMove( NewMove )--[[
	if self:GetEngineActive() then
		self:SetNWVtolMove( NewMove )
	else
		self:SetNWVtolMove( Vector(0,0,0) )
	end]]
end

function ENT:SetThrottle( NewThrottle )--[[
	if self:GetEngineActive() then
		self:SetNWThrottle( math.Clamp(NewThrottle,0,self:GetMaxThrottle()) )
	else
		self:SetNWThrottle( 0 )
	end]]
end

function ENT:GetThrottle()--[[
	if self:GetEngineActive() then
		return self:GetNWThrottle()
	else
		return 0
	end]]
end

function ENT:GetVtolMove()--[[
	if self:GetEngineActive() and not self:GetAI() then
		return self:GetNWVtolMove() * self.ThrustVtol * (1 - math.min( self:GetThrottle(), 1 ))
	else
		return Vector(0,0,0)
	end]]
end

function ENT:StartCommand( ply, cmd )--[[
	if self:GetDriver() ~= ply then return end

	if SERVER then
		local KeyJump = ply:lvsKeyDown( "VSPEC" )

		if self._lvsOldKeyJump ~= KeyJump then
			self._lvsOldKeyJump = KeyJump

			if KeyJump then
				self:ToggleVehicleSpecific()
			end
		end
	end

	if ply:lvsMouseAim() then
		self:PlayerMouseAim( ply, cmd )
	else
		self:PlayerDirectInput( ply, cmd )
	end

	self:CalcThrottle( ply, cmd )
	self:CalcVtolThrottle( ply, cmd )]]
end

function ENT:GetThrustStrenght()--[[
	local ForwardVelocity = self:WorldToLocal( self:GetPos() + self:GetVelocity() ).x

	return (self.MaxVelocity * self:GetThrottle() - ForwardVelocity) / self.MaxVelocity]]
end

--addons/ssrp_lfs/lua/entities/lvs_base_turret/cl_camera.lua:

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
--addons/ssrp_lfs/lua/entities/lvs_fakehover_iftx/cl_init.lua:
include("shared.lua")
include( "sh_turret.lua" )
include( "cl_prediction.lua" )

local darkGrey = Color( 100, 100, 100, 5)
local grey = Color( 100, 100, 100, 255)
local white = Color(255,255,255)
local red = Color(255,0,0,255)

function ENT:DamageFX()
	self.nextDFX = self.nextDFX or 0

	if self.nextDFX < CurTime() then
		self.nextDFX = CurTime() + 0.05

		local HP = self:GetHP()
		local MaxHP = self:GetMaxHP()

		if HP > MaxHP * 0.5 then return end

		local effectdata = EffectData()
			effectdata:SetOrigin( self:LocalToWorld( Vector(-30,0,43) ) )
			effectdata:SetEntity( self )
		util.Effect( "lvs_engine_blacksmoke", effectdata )

		if HP <= MaxHP * 0.25 then
			local effectdata = EffectData()
				effectdata:SetOrigin( self:LocalToWorld( Vector(-85,65,14) ) )
				effectdata:SetNormal( self:GetUp() )
				effectdata:SetMagnitude( math.Rand(0.5,1.5) )
				effectdata:SetEntity( self )
			util.Effect( "lvs_exhaust_fire", effectdata )

			local effectdata = EffectData()
				effectdata:SetOrigin( self:LocalToWorld( Vector(-85,-65,14) ) )
				effectdata:SetNormal( self:GetUp() )
				effectdata:SetMagnitude( math.Rand(0.5,1.5) )
				effectdata:SetEntity( self )
			util.Effect( "lvs_exhaust_fire", effectdata )
		end
	end
end

function ENT:OnFrame()
	self:BTLProjector()
	self:PredictPoseParamaters()
	self:DamageFX()
end

function ENT:BTLProjector()
	local Fire = self:GetBTLFire()

	if Fire == self.OldFireBTL then return end

	self.OldFireBTL = Fire

	if Fire then
		local effectdata = EffectData()
		effectdata:SetEntity( self )
		util.Effect( "lvs_laat_left_projector", effectdata )
	end
end

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	if ply == self:GetDriver() and not pod:GetThirdPersonMode() then
		return pos + self:GetForward() * 40 - self:GetUp() * 20, angles, fov
	end

	local GunnerPod = self:GetGunnerSeat()

	if pod == GunnerPod and pod:GetThirdPersonMode() then
		return GunnerPod:LocalToWorld( Vector(0,0,60) ), angles + Angle(6,0,0), fov
	end

	return pos, angles, fov
end

function ENT:RemoveLight()
	if IsValid( self.projector ) then
		self.projector:Remove()
		self.projector = nil
	end
end

function ENT:OnRemoved()
	self:RemoveLight()
end

function ENT:PreDraw()
	self:DrawDriverBTL()

	return true
end

ENT.LightMaterial = Material( "effects/lvs/laat_spotlight" )
ENT.GlowMaterial = Material( "sprites/light_glow02_add" )

function ENT:PreDrawTranslucent()
	if self:GetBodygroup( 2 ) ~= 1 then
		self:RemoveLight()
		return false
	end

	if not IsValid( self.projector ) then
		local thelamp = ProjectedTexture()
		thelamp:SetBrightness( 10 )
		thelamp:SetTexture( "effects/flashlight/soft" )
		thelamp:SetColor( white )
		thelamp:SetEnableShadows( true )
		thelamp:SetFarZ( 2500 )
		thelamp:SetNearZ( 75 )
		thelamp:SetFOV( 60 )
		self.projector = thelamp
	end

	local Start1 = self:LocalToWorld( Vector(64,6,10.5) )
	local Start2 = self:LocalToWorld( Vector(64,-6,10.5) )

	local Dir1 = self:LocalToWorldAngles( Angle(0,5,0) ):Forward()
	local Dir2 = self:LocalToWorldAngles( Angle(0,-5,0) ):Forward()

	render.SetMaterial( self.GlowMaterial )
	render.DrawSprite( Start1, 32, 32, grey )
	render.DrawSprite( Start2, 32, 32, grey )

	render.SetMaterial( self.LightMaterial )
	render.DrawBeam( Start1,  Start1 + Dir1 * 400, 150, 0, 0.99, darkGrey )
	render.DrawBeam( Start2,  Start2 + Dir2 * 400, 150, 0, 0.99, darkGrey )

	if IsValid( self.projector ) then
		self.projector:SetPos( self:LocalToWorld( Vector(60,0,10.5) ) )
		self.projector:SetAngles( self:LocalToWorldAngles( Angle(15,0,0) ) )
		self.projector:Update()
	end

	return false
end

function ENT:LVSPreHudPaint( X, Y, ply )
	if self:GetIsCarried() then return false end

	if ply == self:GetDriver() then
		local Col = self:WeaponsInRange() and white or red

		local Pos2D = self:GetEyeTrace().HitPos:ToScreen()

		self:PaintCrosshairCenter( Pos2D, Col )
		self:PaintCrosshairOuter( Pos2D, Col )
		self:LVSPaintHitMarker( Pos2D )
	end

	return true
end

function ENT:DrawDriverBTL()
	local pod = self:GetGunnerSeat()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and plyL:GetViewEntity() == plyL and not pod:GetThirdPersonMode()) then return end

	if self:GetBodygroup(1) == 2 then
		ply:SetSequence( "sit_rollercoaster" )
		ply:SetRenderAngles( self:GetAngles() )
		ply:DrawModel()

		return
	end

	local ID = self:LookupAttachment( "muzzle_ballturret_left" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return end

	local _,Ang = LocalToWorld( Vector(0,0,0), Angle(-90,0,-90), Muzzle.Pos, Muzzle.Ang )

	local LAng = self:WorldToLocalAngles( Ang )
	LAng.p = 0
	LAng.r = 0

	ply:SetSequence( "sit_rollercoaster" )
	ply:SetRenderAngles( self:LocalToWorldAngles( LAng ) )
	ply:DrawModel()
end

--addons/ssrp_lfs/lua/entities/lvs_fakehover_x34/cl_init.lua:
include("shared.lua")

ENT.EngineColor = Color( 169, 169, 169)
ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EnginePos = {
	Vector(-135,0,47),
	Vector(-92,-63,18),
	Vector(-92,63,18),
}

function ENT:OnSpawn()
	for _, pos in ipairs(self.EnginePos) do
		self:RegisterTrail( pos, 0, 20, 2, 1000, 150 )
	end
end

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 5 + self:GetThrottle() * 120

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

function ENT:DamageFX()
	self.nextDFX = self.nextDFX or 0

	if self.nextDFX < CurTime() then
		self.nextDFX = CurTime() + 0.05

		local HP = self:GetHP()
		local MaxHP = self:GetMaxHP()

		if HP > MaxHP * 0.5 then return end

		local effectdata = EffectData()
		effectdata:SetOrigin( self:LocalToWorld( Vector(11,0,46) ) )
		effectdata:SetEntity( self )
		util.Effect( "lvs_engine_blacksmoke", effectdata )

		if HP <= MaxHP * 0.25 then
			local effectdata = EffectData()
				effectdata:SetOrigin( self:LocalToWorld( Vector(11,40,46) ) )
				effectdata:SetNormal( self:GetUp() )
				effectdata:SetMagnitude( math.Rand(0.5,1.5) )
				effectdata:SetEntity( self )
			util.Effect( "lvs_exhaust_fire", effectdata )

			local effectdata = EffectData()
				effectdata:SetOrigin( self:LocalToWorld( Vector(11,-40,46) ) )
				effectdata:SetNormal( self:GetUp() )
				effectdata:SetMagnitude( math.Rand(0.5,1.5) )
				effectdata:SetEntity( self )
			util.Effect( "lvs_exhaust_fire", effectdata )
		end
	end
end

function ENT:OnFrame()
	self:DamageFX()
end

--addons/ssrp_lfs/lua/entities/lvs_repulsorlift_dropship/shared.lua:

ENT.Base = "lvs_base_repulsorlift"

ENT.PrintName = "LAAT/c"
ENT.Author = "Luna"
ENT.Information = "Tank Carrier of the Galactic Republic"
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/blu/laat_c.mdl"
ENT.GibModels = {
	"models/gibs/helicopter_brokenpiece_01.mdl",
	"models/gibs/helicopter_brokenpiece_02.mdl",
	"models/gibs/helicopter_brokenpiece_03.mdl",
	"models/combine_apc_destroyed_gib02.mdl",
	"models/combine_apc_destroyed_gib04.mdl",
	"models/combine_apc_destroyed_gib05.mdl",
	"models/props_c17/trappropeller_engine.mdl",
	"models/gibs/airboat_broken_engine.mdl",
}

ENT.AITEAM = 1

ENT.MaxVelocity = 2400
ENT.MaxThrust = 2400

ENT.MaxPitch = 40

ENT.ThrustVtol = 50
ENT.ThrustRateVtol = 2

ENT.TurnRatePitch = 0.7
ENT.TurnRateYaw = 0.7
ENT.TurnRateRoll = 0.7

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.MaxHealth = 4000

ENT.UIPosition = Vector(-1100, 0, -150)
ENT.UIAngle = Angle(20, 45, 10)

ENT.AutomaticFrameAdvance = true

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "GunnerSeat" )
	self:AddDT( "Entity", "HeldEntity" )
end

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/dual_mg.png")
	weapon.Ammo = 600
	weapon.Delay = 0.25
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 1
	weapon.Attack = function( ent )
		if math.abs( ent.frontgunYaw ) > 100 then return end

		local ID_L = self:LookupAttachment( "muzzle_frontgun_left" )
		local ID_R = self:LookupAttachment( "muzzle_frontgun_right" )
		local Muzzle = {
			[1] = self:GetAttachment( ID_L ),
			[2] = self:GetAttachment( ID_R ),
		}

		local NewHeat = ent:GetHeat()

		for id = 1, 2 do
			if id == 1 and ent.frontgunYaw > 5 then continue end
			if id == 2 and ent.frontgunYaw < -5 then continue end

			local att = Muzzle[ id ]

			local bullet = {}
			bullet.Src 	= att.Pos
			bullet.Dir 	= att.Ang:Up()
			bullet.Spread 	= Vector( 0.015,  0.015, 0 )
			bullet.TracerName = "lvs_laser_green"
			bullet.Force	= 10
			bullet.HullSize 	= 25
			bullet.Damage	= 40
			bullet.Velocity = 60000
			bullet.Attacker 	= ent:GetDriver()
			bullet.Callback = function(att, tr, dmginfo)
				local effectdata = EffectData()
					effectdata:SetStart( Vector(50,255,50) )
					effectdata:SetOrigin( tr.HitPos )
					effectdata:SetNormal( tr.HitNormal )
				util.Effect( "lvs_laser_impact", effectdata )
			end

			ent:LVSFireBullet( bullet )
			ent:TakeAmmo()

			NewHeat = NewHeat + 0.075
		end

		ent:SetHeat( NewHeat )

		if NewHeat >= 1 then
			ent:SetOverheated( true )
		end

		ent.PrimarySND:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	weapon.OnThink = function( ent, active )
		local trace = ent:GetEyeTrace()

		local AimAngles = ent:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld(  Vector(256,0,36) ) ):GetNormalized():Angle() )

		ent.frontgunYaw = -AimAngles.y

		if math.abs( ent.frontgunYaw ) > 100 then
			ent:SetPoseParameter("frontgun_pitch", 0 )
			ent:SetPoseParameter("frontgun_yaw", 0 )

			return
		end

		ent:SetPoseParameter("frontgun_pitch", -AimAngles.p )
		ent:SetPoseParameter("frontgun_yaw", -AimAngles.y )
	end
	self:AddWeapon( weapon )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/dropship_grabber.png")
	weapon.Ammo = -1
	weapon.Delay = 1
	weapon.HeatRateUp = 10
	weapon.HeatRateDown = 1
	weapon.StartAttack = function( ent )
		ent:ToggleGrabber()
	end
	self:AddWeapon( weapon )



	local COLOR_RED = Color(255,0,0,255)
	local COLOR_WHITE = Color(255,255,255,255)
	self.RearGunAngleRange = 35

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Ammo = -1
	weapon.Delay = 0.3
	weapon.HeatRateUp = 0.4
	weapon.HeatRateDown = 0.4
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	weapon.Attack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if ent:AngleBetweenNormal( ent:GetAimVector(), ent:GetForward() ) > base.RearGunAngleRange then return true end

		local trace = ent:GetEyeTrace()

		local Pos,Ang = WorldToLocal( Vector(0,0,0), (trace.HitPos - self:LocalToWorld( Vector(-400,0,158.5)) ):GetNormalized():Angle(), Vector(0,0,0), self:LocalToWorldAngles( Angle(0,180,0) ) )

		local ID = self:LookupAttachment( "muzzle_reargun" )
		local Muzzle = self:GetAttachment( ID )

		if not Muzzle then return true end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= (trace.HitPos - Muzzle.Pos):GetNormalized()
		bullet.Spread 	= Vector( 0.03,  0.03, 0.03 )
		bullet.TracerName = "lvs_laser_green"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 65
		bullet.Velocity = 30000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(50,255,50) )
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_impact", effectdata )
		end
		ent:LVSFireBullet( bullet )

		if not IsValid( self.SNDTail ) then return end

		self.SNDTail:PlayOnce( 100 + math.Rand(-3,3), 1 )
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if ent:AngleBetweenNormal( ent:GetAimVector(), ent:GetForward() ) > base.RearGunAngleRange then base:SetPoseParameter("reargun_yaw", 0 ) return end

		local trace = ent:GetEyeTrace()

		local _,Ang = WorldToLocal( Vector(0,0,0), (trace.HitPos - self:LocalToWorld( Vector(-400,0,158.5)) ):GetNormalized():Angle(), Vector(0,0,0), self:LocalToWorldAngles( Angle(0,180,0) ) )

		base:SetPoseParameter("reargun_pitch", -Ang.p )
		base:SetPoseParameter("reargun_yaw", -Ang.y )

	end
	weapon.CalcView = function( ent, ply, pos, angles, fov, pod )
		local base = ent:GetVehicle()

		local view = {}
		view.origin = pos
		view.angles = angles
		view.fov = fov
		view.drawviewer = false

		if not IsValid( base ) then return view end

		local radius = 800
		radius = radius + radius * pod:GetCameraDistance()

		local StartPos = pod:LocalToWorld( pod:OBBCenter() ) + angles :Up() * (250 + radius * pod:GetCameraHeight())
		local EndPos = StartPos - angles:Forward() * radius

		local WallOffset = 4

		local tr = util.TraceHull( {
			start = StartPos,
			endpos = EndPos,
			filter = function( e )
				local c = e:GetClass()
				local collide = not c:StartWith( "prop_physics" ) and not c:StartWith( "prop_dynamic" ) and not c:StartWith( "prop_ragdoll" ) and not e:IsVehicle() and not c:StartWith( "gmod_" ) and not c:StartWith( "player" ) and not e.LVS

				return collide
			end,
			mins = Vector( -WallOffset, -WallOffset, -WallOffset ),
			maxs = Vector( WallOffset, WallOffset, WallOffset ),
		} )

		view.drawviewer = true
		view.origin = tr.HitPos

		if tr.Hit and not tr.StartSolid then
			view.origin = view.origin + tr.HitNormal * WallOffset
		end

		return view
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		local RearGunInRange = ent:AngleBetweenNormal( ent:GetAimVector(), ent:GetForward() ) > base.RearGunAngleRange

		local Col = RearGunInRange and COLOR_RED or COLOR_WHITE

		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen()

		base:PaintCrosshairCenter( Pos2D, Col )
		base:PaintCrosshairOuter( Pos2D, Col )
		base:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon, 2 )
end

sound.Add( {
	name = "LVS.LAAT.GRABBER",
	channel = CHAN_ITEM,
	volume = 1.0,
	level = 90,
	pitch = 100,
	sound = "lvs/vehicles/laat/door_large_open.wav"
} )

sound.Add( {
	name = "LVS.LAAT.GRABBER_CANTDROP",
	channel = CHAN_ITEM,
	volume = 1.0,
	level = 90,
	pitch = 100,
	sound = "buttons/button8.wav"
} )

ENT.FlyByAdvance = 1
ENT.FlyBySound = "LVS.LAAT.FLYBY"
ENT.DeathSound = "lvs/vehicles/generic_starfighter/crash.wav"

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/laat/loop.wav",
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
		sound = "^lvs/vehicles/laat/dist.wav",
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
		SoundLevel = 110,
	},
}

function ENT:ResetFilters()
	-- clear the filters, so they can be rebuild
	self.CrosshairFilterEnts = nil
end

function ENT:BuildFilter()
	if not istable( self.CrosshairFilterEnts ) then
		self:GetCrosshairFilterEnts()
	end

	local HeldEnt = self:GetHeldEntity()

	if not IsValid( HeldEnt ) then return end

	if HeldEnt.GetCrosshairFilterEnts then
		for _, ent in pairs( HeldEnt:GetCrosshairFilterEnts() ) do
			table.insert( self.CrosshairFilterEnts, ent )
		end
	else
		table.insert( self.CrosshairFilterEnts , HeldEnt )
	end
end

--addons/ssrp_lfs/lua/entities/lvs_turret_ai/cl_init.lua:
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

--addons/ssrp_lfs/lua/entities/lvs_turret_ai_red/cl_init.lua:
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

--addons/ssrp_lfs/lua/entities/lvs_walker_hsd/cl_init.lua:
include("shared.lua")
include("cl_camera.lua")
include("cl_prediction.lua")
include("sh_weapons.lua")

function ENT:OnFrame()
	self:PredictPoseParamaters()
	self:ProjectorBeam()
	self:DamageFX()
end

function ENT:ProjectorBeam()
	local ProjectorBeam = self:GetProjectorBeam()

	if ProjectorBeam == self.OldProjectorBeam then return end

	self.OldProjectorBeam = ProjectorBeam

	if not ProjectorBeam then return end

	local effectdata = EffectData()
	effectdata:SetEntity( self )
	util.Effect( "lvs_hsd_dish_projector", effectdata )
end
	
function ENT:DamageFX()
	self.nextDFX = self.nextDFX or 0

	if self.nextDFX < CurTime() then
		self.nextDFX = CurTime() + 0.05

		if self:GetIsRagdoll() then
			if math.random(0,45) < 3 then
				if math.random(1,2) == 1 then
					local Pos = self:LocalToWorld( Vector(0,0,250) + VectorRand() * 80 )
					local effectdata = EffectData()
						effectdata:SetOrigin( Pos )
					util.Effect( "cball_explode", effectdata, true, true )
					
					sound.Play( "lvs/vehicles/atte/spark"..math.random(1,4)..".ogg", Pos, 75 )
				end
			end
		end

		local HP = self:GetHP()
		local MaxHP = self:GetMaxHP()

		if HP > MaxHP * 0.5 then return end

		local effectdata = EffectData()
			effectdata:SetOrigin( self:LocalToWorld( Vector(0,0,260) + VectorRand() * 80 ) )
			effectdata:SetEntity( self )
		util.Effect( "lvs_engine_blacksmoke", effectdata )

		if HP <= MaxHP * 0.25 then
			local effectdata = EffectData()
				effectdata:SetOrigin( self:LocalToWorld( Vector(0,90,210) ) )
				effectdata:SetNormal( self:GetUp() )
				effectdata:SetMagnitude( math.Rand(1,3) )
				effectdata:SetEntity( self )
			util.Effect( "lvs_exhaust_fire", effectdata )

			local effectdata = EffectData()
				effectdata:SetOrigin( self:LocalToWorld( Vector(0,-90,210) ) )
				effectdata:SetNormal( self:GetUp() )
				effectdata:SetMagnitude( math.Rand(1,3) )
				effectdata:SetEntity( self )
			util.Effect( "lvs_exhaust_fire", effectdata )
		end
	end
end

ENT.GlowPos1 = Vector(46,-2.89,294.88)
ENT.GlowPos2 = Vector(41.15,5.82,295.63)
ENT.GlowColor = Color( 255, 0, 0, 255)
ENT.GlowMaterial = Material( "sprites/light_glow02_add" )

function ENT:PreDrawTranslucent()

	if self:GetIsRagdoll() then return false end

	render.SetMaterial( self.GlowMaterial )
	render.DrawSprite( self:LocalToWorld( self.GlowPos1 ), 32, 32, self.GlowColor )
	render.DrawSprite( self:LocalToWorld( self.GlowPos2 ), 16, 16, self.GlowColor )

	return false
end

local zoom = 0
local zoom_mat = Material( "vgui/zoom" )

local white = Color(255,255,255,255)
local red = Color(255,0,0,255)

function ENT:PaintZoom( X, Y, ply )
	local TargetZoom = ply:lvsKeyDown( "ZOOM" ) and 1 or 0

	zoom = zoom + (TargetZoom - zoom) * RealFrameTime() * 10

	X = X * 0.5
	Y = Y * 0.5

	surface.SetDrawColor( Color(255,255,255,255 * zoom) )
	surface.SetMaterial(zoom_mat ) 
	surface.DrawTexturedRectRotated( X + X * 0.5, Y * 0.5, X, Y, 0 )
	surface.DrawTexturedRectRotated( X + X * 0.5, Y + Y * 0.5, Y, X, 270 )
	surface.DrawTexturedRectRotated( X * 0.5, Y * 0.5, Y, X, 90 )
	surface.DrawTexturedRectRotated( X * 0.5, Y + Y * 0.5, X, Y, 180 )
end

local COLOR_RED = Color(255,0,0,255)
local COLOR_WHITE = Color(255,255,255,255)

function ENT:LVSHudPaint( X, Y, ply )
	if ply ~= self:GetDriver() then
		return
	end

	local Col = self:WeaponsInRange() and COLOR_WHITE or COLOR_RED

	local Pos2D = self:GetEyeTrace().HitPos:ToScreen() 

	self:PaintCrosshairCenter( Pos2D, Col )
	self:PaintCrosshairOuter( Pos2D, Col )
	self:LVSPaintHitMarker( Pos2D )

	self:PaintZoom( X, Y, ply )
end

ENT.IconEngine = Material( "lvs/engine.png" )

function ENT:LVSHudPaintInfoText( X, Y, W, H, ScrX, ScrY, ply )
	local Vel = self:GetVelocity():Length()
	local kmh = math.Round(Vel * 0.09144,0)

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
		draw.SimpleText( "X" , "LVS_FONT",  hX, hY, Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	else
		local Throttle = Vel / 150
		self:LVSDrawCircle( hX, hY, H * 0.35, math.min( Throttle, 1 ) )
	end
end

--addons/ssrp_lfs/lua/entities/lvs_walker_hsd/shared.lua:

ENT.Base = "lvs_walker_atte_hoverscript"

ENT.PrintName = "Homing Spider Droid"
ENT.Author = "Luna"
ENT.Information = "OG-9 Separatist Walker Droid"
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable		= true
ENT.AdminSpawnable	= false

ENT.MDL = "models/blu/hsd.mdl"
ENT.GibModels = {
	"models/blu/hsd_gib.mdl",
	"models/blu/hsd_foot.mdl",
	"models/blu/hsd_leg_1.mdl",
	"models/blu/hsd_leg_2.mdl",
	"models/blu/hsd_leg_3.mdl",
	"models/blu/hsd_leg_4.mdl",
}

ENT.AITEAM = 2

ENT.MaxHealth = 6000

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.HoverHeight = 250
ENT.HoverTraceLength = 300
ENT.HoverHullRadius = 50

ENT.TurretTurnRate = 100

ENT.CanMoveOn = {
	["func_door"] = true,
	["func_movelinear"] = true,
	["prop_physics"] = true,
}

ENT.lvsShowInSpawner = true

function ENT:OnSetupDataTables()
	self:AddDT( "Int", "UpdateLeg" )
	self:AddDT( "Bool", "IsRagdoll" )
	self:AddDT( "Bool", "IsMoving" )
	self:AddDT( "Bool", "NWGround" )
	self:AddDT( "Bool", "ProjectorBeam" )
	self:AddDT( "Vector", "AIAimVector" )
end

function ENT:GetEyeTrace()
	local startpos = self:GetPos()

	local pod = self:GetDriverSeat()

	if IsValid( pod ) then
		startpos = pod:LocalToWorld( Vector(0,0,33) )
	end

	local trace = util.TraceLine( {
		start = startpos,
		endpos = (startpos + self:GetAimVector() * 50000),
		filter = self:GetCrosshairFilterEnts()
	} )

	return trace
end

function ENT:GetAimVector()
	if self:GetAI() then
		return self:GetAIAimVector()
	end

	local Driver = self:GetDriver()

	if IsValid( Driver ) then
		return Driver:GetAimVector()
	else
		return self:GetForward()
	end
end

function ENT:HitGround()
	return self:GetNWGround()
end

--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_base/cl_init.lua:
return lpakr()()
--MediaLib_DynFile_youtube.lua:
local oop = medialib.load("oop")

local YoutubeService = oop.class("YoutubeService", "HTMLService")
YoutubeService.identifier = "youtube"

local raw_patterns = {
	"^https?://[A-Za-z0-9%.%-]*%.?youtu%.be/([A-Za-z0-9_%-]+)",
	"^https?://[A-Za-z0-9%.%-]*%.?youtube%.com/watch%?.*v=([A-Za-z0-9_%-]+)",
	"^https?://[A-Za-z0-9%.%-]*%.?youtube%.com/v/([A-Za-z0-9_%-]+)",
	"^https?://[A-Za-z0-9%.%-]*%.?youtube%-nocookie%.com/embed/([A-Za-z0-9_%-]+)"
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

local player_url = "https://gmod-api.superiorservers.co/static/gmod-medialib/youtube.html?id=%s"
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

		local jsontbl = util.JSONToTable(result)
		if not jsontbl or not jsontbl.items then
			callback(result)
			return
		end

		local item = jsontbl.items[1]
		if not item then
			callback("No video id found")
			return
		end

		local response = self:BuildResponse(item, urlData)
		response.raw = jsontbl

		callback(nil, response)
	end, function(err) callback("HTTP: " .. err) end)
end

function YoutubeService:BuildResponse(item, urlData)
	local live = item.snippet.liveBroadcastContent == "live"
	local id = urlData.id

	return {
		id = id,
		title = item.snippet.title,
		live = live,
		duration = not live and tonumber(PTToSeconds(item.contentDetails.duration)),
		icon = 'https://img.youtube.com/vi/' .. id .. '/sddefault.jpg',
	}
end

function YoutubeService:hasReliablePlaybackEvents()
	return true
end

return YoutubeService

--MediaLib_DynFile_gdrive.lua:
local oop = medialib.load("oop")

local GDriveService = oop.class("GDriveService", "HTMLService")
GDriveService.identifier = "GDrive"

local all_patterns = {"^https?://drive.google.com/file/d/([^/]*)/edit"}

function GDriveService:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local id = string.match(url, pattern)
		if id then
			return {id = id}
		end
	end
end

function GDriveService:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

local function urlencode(str)
   if (str) then
      str = string.gsub (str, "\n", "\r\n")
      str = string.gsub (str, "([^%w ])",
         function (c) return string.format ("%%%02X", string.byte(c)) end)
      str = string.gsub (str, " ", "+")
   end
   return str
end

local player_url = "https://wyozi.github.io/gmod-medialib/mp4.html?id=%s"
local gdrive_stream_url = "https://drive.google.com/uc?export=download&confirm=yTib&id=%s"
function GDriveService:resolveUrl(url, callback)
	local urlData = self:parseUrl(url)
	local playerUrl = string.format(player_url, urlencode(string.format(gdrive_stream_url, urlData.id)))

	callback(playerUrl, {start = urlData.start})
end

function GDriveService:directQuery(url, callback)
	callback(nil, {
		title = url:match("([^/]+)$")
	})
end

function GDriveService:hasReliablePlaybackEvents()
	return true
end

return GDriveService
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_pvsradio.lua:
AddCSLuaFile()ENT.Base='media_base'ENT.PrintName='PVS Radio'ENT.Category='RP Media'ENT.Spawnable=true;ENT.AdminSpawnable=true;ENT.MediaPlayer=true;ENT.Model='models/props_lab/citizenradio.mdl'ENT.Is3D=false;function ENT:CanUse(a)if a:IsVeteranGamemaster()then return true elseif a:IsTrialGamemaster()then return!info.Main||a:IsEventCharacter()end end;function ENT:ShouldPlay(b)return!self:IsDormant()&&(!b.AfkTime||b.AfkTime<600)end
--addons/!lpakr_out/lua/entities/nbot_sw_commander_droid.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/nbot_sw_magnaguard.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='Magna Guard'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/tfa/comm/gg/npc_comb_magna_guard_combined.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_magna_guard_combined.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/nbot_sw_superbattle_droid.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='B2 Super Battle Droid Cannon'ENT.Category='GM Hostile Nextbots'ENT.Spawnable=true;ENT.Weapons={'sup_b2cannon'}ENT.RagdollModel='models/tfa/comm/gg/pm_sw_droid_b2.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_droid_b2.mdl'}ENT.OverrideRange=true;ENT.ReachEnemyRange=1500;DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_massassi.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Massassi Guardian"ENT.Category="[Valkyrie] Humanoid NPCs"ENT.Models={"models/swtor/npcs/massassi_a01.mdl"}ENT.CollisionBounds=Vector(20,20,80)ENT.BloodColor=BLOOD_COLOR_RED;ENT.ModelScale=1;ENT.OnDamageSounds={}ENT.OnDeathSounds={}ENT.SpawnHealth=700;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=50;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ZOMBIES}ENT.UseWalkframes=false;ENT.RunSpeed=50;ENT.WalkSpeed=35;ENT.RunAnimation=ACT_WALK;ENT.EyeBone="head"ENT.EyeOffset=Vector(7.5,0,5)AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_mecharancor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_mountain_rancor.lua:
if!DrGBase then return end;ENT.Base="npc_drg_rancor"ENT.CWRP=true;ENT.PrintName="Mountain Rancor"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/rancor_a01.mdl"}ENT.Skins={3}ENT.ModelScale=1;ENT.CollisionBounds=Vector(100,100,100)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=1000;ENT.HealthRegen=5;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;ENT.WalkSpeed=120;ENT.RunSpeed=220;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_simulated_rancor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_strong_rakghoul.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_tauntaun.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_war_rancor.lua:
if!DrGBase then return end;ENT.Base="npc_drg_rancor"ENT.CWRP=true;ENT.PrintName="War Rancor"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/rancor_a01.mdl"}ENT.Skins={9}ENT.ModelScale=1;ENT.CollisionBounds=Vector(100,100,100)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=1000;ENT.HealthRegen=5;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_sw_droid_tactical.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/particlecontroller_proj.lua:
AddCSLuaFile()ENT.Base="base_gmodentity"ENT.PrintName="Particle Controller - Projectile"ENT.Author=""ENT.Spawnable=false;ENT.AdminSpawnable=false;ENT.RenderGroup=RENDERGROUP_NONE;function ENT:SetupDataTables()self:NetworkVar("Entity",0,"TargetEnt")self:NetworkVar("String",0,"ProjFX_EffectName")self:NetworkVar("Vector",0,"ProjFX_UtilEffectInfo")self:NetworkVar("Vector",1,"ProjFX_ColorInfo")self:NetworkVar("String",1,"ImpactFX_EffectName")self:NetworkVar("Vector",2,"ImpactFX_UtilEffectInfo")self:NetworkVar("Vector",3,"ImpactFX_ColorInfo")self:NetworkVar("Int",0,"AttachNum")self:NetworkVar("Float",0,"RepeatRate")self:NetworkVar("String",2,"ProjModel")self:NetworkVar("Int",1,"ProjModel_AttachNum")self:NetworkVar("Bool",0,"ProjModel_Invis")self:NetworkVar("Float",1,"ImpactFX_EffectLifetime")self:NetworkVar("Float",2,"ProjEnt_Spread")self:NetworkVar("Int",2,"ProjEnt_Velocity")self:NetworkVar("Bool",1,"ProjEnt_Gravity")self:NetworkVar("Int",3,"ProjEnt_Angle")self:NetworkVar("Int",4,"ProjEnt_Spin")self:NetworkVar("Bool",2,"ProjEnt_DemomanFix")self:NetworkVar("Float",3,"ProjEnt_Lifetime_PreHit")self:NetworkVar("Float",4,"ProjEnt_Lifetime_PostHit")self:NetworkVar("Bool",3,"ProjEnt_Serverside")self:NetworkVar("Bool",4,"Active")self:NetworkVar("Bool",5,"Toggle")self:NetworkVar("Int",5,"NumpadKey")self:NetworkVar("String",3,"NumpadState")end;function ENT:Initialize()util.PrecacheModel(self:GetProjModel())local a=self:GetTargetEnt()if SERVER then else local b=self:GetProjFX_EffectName()if b!=""&&!string.StartWith(b,"!UTILEFFECT!")then PrecacheParticleSystem(b)end;local c=self:GetImpactFX_EffectName()if c!=""&&!string.StartWith(c,"!UTILEFFECT!")then PrecacheParticleSystem(c)end end;self:SetModel("models/hunter/plates/plate.mdl")self:SetNoDraw(true)if self:GetRepeatRate()>0&&self:GetRepeatRate()<0.1 then self:SetRepeatRate(0.1)end;if self:GetRepeatRate()>0 then self.NextRepeat=0 else if self:GetActive()then self:AttachParticle()end end end;function ENT:Think()if self:GetProjEnt_Serverside()then if CLIENT then return end else end;if self:GetNumpadState()=="off"then self:SetNumpadState("")end;if self:GetNumpadState()=="on"then self:SetNumpadState("")if self:GetRepeatRate()>0 then self.NextRepeat=0 else if self:GetActive()then self:AttachParticle()end end end;if self:GetActive()==true&&self:GetRepeatRate()>0 then if!(self.NextRepeat>CurTime())then self:AttachParticle()self.NextRepeat=CurTime()+self:GetRepeatRate()end end;self:NextThink(CurTime())return true end;function ENT:AttachParticle()if!self then return end;if self:GetProjEnt_Serverside()then if CLIENT then return end else end;local d=math.Clamp(self:GetProjEnt_Spread(),0,4)local e=self:GetProjEnt_Velocity()local f=self:GetProjEnt_Gravity()local g=self:GetProjEnt_Angle()local h=self:GetProjEnt_Spin()local i=self:GetProjEnt_DemomanFix()local j=math.Clamp(self:GetProjEnt_Lifetime_PreHit(),0,10)local k=math.Clamp(self:GetProjEnt_Lifetime_PostHit(),0,10)local b=self:GetProjFX_EffectName()local l=self:GetProjModel_AttachNum()local c=self:GetImpactFX_EffectName()local m=math.Clamp(self:GetImpactFX_EffectLifetime(),0,10)local n=self:GetImpactFX_UtilEffectInfo()local o=self:GetImpactFX_ColorInfo()local p=nil;if CLIENT then p=ClientsideModel(self:GetProjModel())end;if!util.IsValidProp(self:GetProjModel())then p:PhysicsInitBox(p:GetModelBounds())else p:PhysicsInit(SOLID_VPHYSICS)end;p:GetPhysicsObject():Wake()p:SetNoDraw(self:GetProjModel_Invis())p:SetSkin(self:GetSkin())p:SetMaterial(self:GetMaterial())p:SetPos(self:GetPos())p:Spawn()p:Activate()local q=p:GetPhysicsObject()local r=self:GetAngles()if self:GetParent()!=NULL then if self:GetParent():GetAttachment(self:GetAttachNum())then local s,t=WorldToLocal(self:GetPos(),r,self:GetParent():GetPos(),self:GetParent():GetAngles())r=Angle(r.p,r.y,r.r-t.r)end end;if i==true then r:RotateAroundAxis(r:Up(),-90)end;local u=Angle(r.p,r.y,r.r)local v=AngleRand()u:RotateAroundAxis(u:Forward(),v.r)u:RotateAroundAxis(u:Right(),v.p*d/2)u:RotateAroundAxis(u:Up(),v.y*d/4)q:SetVelocity(u:Forward()*e)u:RotateAroundAxis(u:Forward(),-v.r)local w=Angle(0,0,0)if g==1 then u:RotateAroundAxis(u:Up(),90)w=Angle(0,-90,0)elseif g==2 then u:RotateAroundAxis(u:Up(),-90)w=Angle(0,90,0)elseif g==3 then u:RotateAroundAxis(u:Right(),90)w=Angle(90,0,0)elseif g==4 then u:RotateAroundAxis(u:Right(),-90)w=Angle(-90,0,0)elseif g==5 then u:RotateAroundAxis(u:Up(),180)w=Angle(0,180,0)end;p:SetAngles(u)if h==1 then q:AddAngleVelocity(w:Right()*-350)elseif h==2 then q:AddAngleVelocity(w:Forward()*350)elseif h==3 then q:AddAngleVelocity(w:Up()*-350)elseif h==4 then q:AddAngleVelocity(VectorRand()*-350)end;q:EnableGravity(f)q:SetMaterial("gmod_silent")p:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)p:SetOwner(self:GetParent())if b!=""then local x=p;if CLIENT then if string.StartWith(b,"!UTILEFFECT!")then local y=self:GetProjFX_UtilEffectInfo().x;local z=self:GetProjFX_UtilEffectInfo().y;local A=self:GetProjFX_UtilEffectInfo().z;local B=EffectData()B:SetEntity(x)B:SetScale(y)B:SetMagnitude(z)B:SetRadius(A)B:SetFlags(0)if string.EndsWith(b,"!")then if string.find(b,"!FLAG1!")then B:SetFlags(1)b=string.Replace(b,"!FLAG1!","")end;if string.find(b,"!FLAG2!")then B:SetFlags(2)b=string.Replace(b,"!FLAG2!","")end;if string.find(b,"!FLAG3!")then B:SetFlags(3)b=string.Replace(b,"!FLAG3!","")end;if string.find(b,"!FLAG4!")then B:SetFlags(4)b=string.Replace(b,"!FLAG4!","")end;if string.find(b,"!FLAG5!")then B:SetFlags(5)b=string.Replace(b,"!FLAG5!","")end;if string.find(b,"!FLAG6!")then B:SetFlags(6)b=string.Replace(b,"!FLAG6!","")end;if string.find(b,"!FLAG7!")then B:SetFlags(7)b=string.Replace(b,"!FLAG7!","")end;if string.find(b,"!FLAG8!")then B:SetFlags(8)b=string.Replace(b,"!FLAG8!","")end;if string.find(b,"!FLAG9!")then B:SetFlags(9)b=string.Replace(b,"!FLAG9!","")end end;B:SetColor(0)if string.EndsWith(b,"!")then if string.find(b,"!COLOR1!")then B:SetColor(1)b=string.Replace(b,"!COLOR1!","")end;if string.find(b,"!COLOR2!")then B:SetColor(2)b=string.Replace(b,"!COLOR2!","")end;if string.find(b,"!COLOR3!")then B:SetColor(3)b=string.Replace(b,"!COLOR3!","")end;if string.find(b,"!COLOR4!")then B:SetColor(4)b=string.Replace(b,"!COLOR4!","")end;if string.find(b,"!COLOR5!")then B:SetColor(5)b=string.Replace(b,"!COLOR5!","")end;if string.find(b,"!COLOR6!")then B:SetColor(6)b=string.Replace(b,"!COLOR6!","")end;if string.find(b,"!COLOR7!")then B:SetColor(7)b=string.Replace(b,"!COLOR7!","")end;if string.find(b,"!COLOR8!")then B:SetColor(8)b=string.Replace(b,"!COLOR8!","")end;if string.find(b,"!COLOR9!")then B:SetColor(9)b=string.Replace(b,"!COLOR9!","")end end;if string.find(string.lower(b),"shakeropes")then B:SetMagnitude(z*20)end;if string.find(string.lower(b),"thumperdust")then B:SetScale(y*50)end;if string.find(string.lower(b),"bloodspray")then B:SetScale(y*4)end;if x:GetAttachment(l)!=nil then B:SetStart(x:GetAttachment(l).Pos)B:SetOrigin(x:GetAttachment(l).Pos)B:SetAngles(x:GetAttachment(l).Ang)B:SetNormal(x:GetAttachment(l).Ang:Forward())else B:SetStart(x:GetPos())B:SetOrigin(x:GetPos())B:SetAngles(x:GetAngles())B:SetNormal(x:GetAngles():Forward())end;util.Effect(string.Replace(b,"!UTILEFFECT!",""),B)else local C=p:GetAttachment(l)if C!=nil then if CLIENT then x=ClientsideModel("models/hunter/plates/plate.mdl")end;x:SetParent(p,l-1)x:SetPos(C.Pos)x:SetAngles(C.Ang)x:SetNoDraw(true)x:Spawn()x:Activate()p:CallOnRemove("RemoveProjFX",function()if IsValid(x)then x:Remove()end end)end;local D=nil;if self:GetProjFX_ColorInfo()==Vector(0,0,0)then else D={position=self:GetProjFX_ColorInfo()}end;local E={}E[1]={entity=x,attachtype=PATTACH_ABSORIGIN_FOLLOW}for F=2,64 do if D then E[F]=D else E[F]=E[1]end end;x:CreateParticleEffect(b,E)end end end;local function G(H,I,J)if c!=""then local K=nil;if CLIENT then K=ClientsideModel("models/hunter/plates/plate.mdl")end;K:SetPos(I||p:GetPos())K:SetAngles(J||p:GetAngles())K:SetNoDraw(true)timer.Simple(m,function()if IsValid(K)then K:Remove()end end)K:Spawn()K:Activate()if CLIENT then if string.StartWith(c,"!UTILEFFECT!")then local y=n.x;local z=n.y;local A=n.z;local L=EffectData()L:SetEntity(K)L:SetScale(y)L:SetMagnitude(z)L:SetRadius(A)L:SetFlags(0)if string.EndsWith(c,"!")then if string.find(c,"!FLAG1!")then L:SetFlags(1)c=string.Replace(c,"!FLAG1!","")end;if string.find(c,"!FLAG2!")then L:SetFlags(2)c=string.Replace(c,"!FLAG2!","")end;if string.find(c,"!FLAG3!")then L:SetFlags(3)c=string.Replace(c,"!FLAG3!","")end;if string.find(c,"!FLAG4!")then L:SetFlags(4)c=string.Replace(c,"!FLAG4!","")end;if string.find(c,"!FLAG5!")then L:SetFlags(5)c=string.Replace(c,"!FLAG5!","")end;if string.find(c,"!FLAG6!")then L:SetFlags(6)c=string.Replace(c,"!FLAG6!","")end;if string.find(c,"!FLAG7!")then L:SetFlags(7)c=string.Replace(c,"!FLAG7!","")end;if string.find(c,"!FLAG8!")then L:SetFlags(8)c=string.Replace(c,"!FLAG8!","")end;if string.find(c,"!FLAG9!")then L:SetFlags(9)c=string.Replace(c,"!FLAG9!","")end end;L:SetColor(0)if string.EndsWith(c,"!")then if string.find(c,"!COLOR1!")then L:SetColor(1)c=string.Replace(c,"!COLOR1!","")end;if string.find(c,"!COLOR2!")then L:SetColor(2)c=string.Replace(c,"!COLOR2!","")end;if string.find(c,"!COLOR3!")then L:SetColor(3)c=string.Replace(c,"!COLOR3!","")end;if string.find(c,"!COLOR4!")then L:SetColor(4)c=string.Replace(c,"!COLOR4!","")end;if string.find(c,"!COLOR5!")then L:SetColor(5)c=string.Replace(c,"!COLOR5!","")end;if string.find(c,"!COLOR6!")then L:SetColor(6)c=string.Replace(c,"!COLOR6!","")end;if string.find(c,"!COLOR7!")then L:SetColor(7)c=string.Replace(c,"!COLOR7!","")end;if string.find(c,"!COLOR8!")then L:SetColor(8)c=string.Replace(c,"!COLOR8!","")end;if string.find(c,"!COLOR9!")then L:SetColor(9)c=string.Replace(c,"!COLOR9!","")end end;if string.find(string.lower(c),"shakeropes")then L:SetMagnitude(z*20)end;if string.find(string.lower(c),"thumperdust")then L:SetScale(y*50)end;if string.find(string.lower(c),"bloodspray")then L:SetScale(y*4)end;L:SetStart(K:GetPos())L:SetOrigin(K:GetPos())L:SetAngles(K:GetAngles())L:SetNormal(K:GetAngles():Forward())util.Effect(string.Replace(c,"!UTILEFFECT!",""),L)else local D=nil;if o==Vector(0,0,0)then else D={position=o}end;local M={}M[1]={entity=K,attachtype=PATTACH_ABSORIGIN_FOLLOW}for F=2,64 do if D then M[F]=D else M[F]=M[1]end end;K:CreateParticleEffect(c,M)end end end;H:Remove()end;timer.Simple(j,function()if IsValid(p)then G(p)end end)local function N(O,P)if IsValid(O)then if O.HasHitSomething then return end;O.HasHitSomething=true;if k==0 then timer.Simple(0,function()if IsValid(p)then G(p,P.HitPos,-P.HitNormal:Angle())end end)else timer.Simple(k,function()if IsValid(p)then G(p)end end)end end end;if CLIENT then p:AddCallback("PhysicsCollide",N)else p.PhysicsCollide=N end end;duplicator.RegisterEntityClass("particlecontroller_proj",function(Q,P)end,"Data")
--addons/!lpakr_out/lua/entities/pfx1_00.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Fire [v_2]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]campfire1"
--addons/!lpakr_out/lua/entities/pfx1_02.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_03~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Ember field"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]embers_~"
--addons/!lpakr_out/lua/entities/pfx1_08#.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_08.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Fire [Green]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]_campfire_green"
--addons/!lpakr_out/lua/entities/pfx1_08_l.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_09.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Gasleak flame"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]g_leak_flame"
--addons/!lpakr_out/lua/entities/pfx1_0d.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Lifting Smoke [Small]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]smoke_lifting_01"
--addons/!lpakr_out/lua/entities/pfx2_04~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Swirl 2"ENT.Category="PPE: Other"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[2]swirl_rnd"
--addons/!lpakr_out/lua/entities/pfx2_05.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx2_06~.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_00~.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_03_s.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_04_s~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Smaller Purple Jet [Smokeless]"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_v_s*"
--addons/!lpakr_out/lua/entities/pfx4_06_3.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Yellow Energy Rod"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]energy_rod_y"
--addons/!lpakr_out/lua/entities/pfx4_0b.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Matrix Sphere"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]binary_sphere"
--addons/!lpakr_out/lua/entities/pfx5_00_alt.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Alt Black Hole"ENT.Category="PPE: Cosmic"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[5]black_hole_b"
--addons/!lpakr_out/lua/entities/pfx5_00_s.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx6_02b.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="AR2 Tracer"ENT.Category="PPE: Weapons"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[6]bullet_tracer_ar2"
--addons/!lpakr_out/lua/entities/pfx7_01.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx8_03_alt.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx8_04.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx9_00.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_aimorb.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_amplifier.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_aura_rc.lua:
AddCSLuaFile()ENT.Base='rp_aura'ENT.PrintName='RC Aura'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.DoNotDuplicate=true;ENT.buffid='rc'ENT.Stackable=true;ENT.MaxStack=2;ENT.MinStack=1;function ENT:CanBuff(a)return a:IsPlayer()&&!a:IsBot()&&!a.InEvent&&a:GetMoveType()==MOVETYPE_WALK end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bus/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bustimetable.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bustimetable.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='base_anim'ENT.Category='SUP'ENT.PrintName='Bus Timetable'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Spawnable=info.Dev;ENT.Model=Model'models/props_unique/airport/airport_monitors.mdl'ENT.DoNotDuplicate=true;ENT.DontSit=true;function ENT:Initialize()self:SetModel(self.Model)end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_camera/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_camera/shared.lua:
DEFINE_BASECLASS'base_anim'ENT.PrintName='CCTV Camera'ENT.Author="Scott"ENT.Contact='superiorservers.co'ENT.Purpose='A Camera'ENT.Type='anim'ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_OPAQUE;ENT.Model=Model'models/galactic/jetpack.mdl'ENT.MaxHealth=1000;function ENT:SetupDataTables()self:NetworkVar('Bool',0,'Destroyed')self:NetworkVar('Int',0,'Health')self:NetworkVar('String',0,'CamName')end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_crafting/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_firingrange/cl_init.lua:
function ENT:PlayerUse()print'ENT.PlayerUse'end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_floatingcandycane/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_fob.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/rp_grenade/cl_init.lua:
include'shared.lua'local a=Vector(0,0,10)function ENT:Think()if!self.NextInterval||self.NextInterval<CurTime()then self:RunInterval()self.NextInterval=CurTime()+1 end;if self:GetExploded()&&!self.Exploded then self.Exploded=true;self:Explode()self.Think=function()end;return end;self:SetNextClientThink(CurTime()+.1)return true end;function ENT:RunInterval()end;function ENT:Explode()end;function ENT:Cleanup()end;function ENT:OnRemove()self:Cleanup()end;function ENT:Draw()self:DrawModel()end
--addons/!lpakr_out/lua/entities/rp_grenade_frag.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/rp_grenade_shield.lua:
AddCSLuaFile()ENT.Base='rp_grenade'ENT.PrintName='Shield Grenade'ENT.Spawnable=false;ENT.WorldModel='models/weapons/w_eq_flashbang.mdl'ENT.Impact=true;ENT.ExplosionTime=1;ENT.FreezeMotion=false;ENT.TrailColor=Color(70,137,175)ENT.TrailGlowColor='blueglow2'ENT.WorldMaterial='models/weapons/v_models/grenades/virus_grenade'ENT.ViewMaterial='models/weapons/v_models/grenades/virus_grenade'function ENT:Explode()return 0 end;function ENT:RemoveShields()local a=self:GetOwner()for b,c in ipairs(ents.FindByClass'rp_shieldray')do if IsValid(c)&&c:GetPropOwner()==a&&IsValid(c:GetShield())then c:GetShield():Explode()end end end
--addons/!lpakr_out/lua/entities/rp_grenade_sticky.lua:
AddCSLuaFile()ENT.Base='rp_grenade'ENT.PrintName='Sticky Grenade'ENT.Spawnable=false;ENT.FreezeMotion=false;ENT.WorldMaterial='models/weapons/v_models/grenades/virus_grenade'ENT.ViewMaterial='models/weapons/v_models/grenades/virus_grenade'ENT.Sticky=true;ENT.Range=150;ENT.Damage=75;ENT.ExplosionTime=5;function ENT:Explode()return 0 end;function ENT:DoStickySetup(a)if IsValid(a.HitEntity)then self:SetParent(a.HitEntity)local b=self:GetOwner()if IsValid(b)&&a.HitEntity:IsPlayer()||a.HitEntity:IsNPC()then hook.Run('OnGrenadeStuckToPlayer',self,b,a.HitEntity)end end;self:SetMoveType(MOVETYPE_NONE)self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)local c=util.TraceEntityHull({start=a.HitPos,endpos=a.HitPos+a.OurOldVelocity*a.Speed,whitelist=a.HitEntity},a.HitEntity)if c.Hit then self:SetPos(c.HitPos)else self:SetPos(a.HitPos)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_groupstorage.lua:
AddCSLuaFile()ENT.Base='rp_storage'ENT.PrintName='Group Storage'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.DoNotDuplicate=true;function ENT:AcceptInput(a,b,c)if!IsValid(b)then return end;local d=b:GetGroup()if!d then return end;d=d:GetParent(true)local e=srp.inventory.Get(d.id)if e then srp.inventory.Open(b,e.id)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_laserbolt/shared.lua:
DEFINE_BASECLASS'base_gmodentity'ENT.PrintName='Blaster Bolt'ENT.Category='SUP'ENT.Author='Scott + KingPommes Model'ENT.Contact=''ENT.Purpose=''ENT.Instructions=''ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.DoNotDuplicate=true;ENT.DontFreeze=true;ENT.Speed=80000;ENT.Damage=1500;ENT.DamageAOE=600;ENT.DamageRange=1000
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_note/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_ship_turret.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_ship_turret.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='rp_turret'ENT.PrintName='Ship Turret'ENT.Category='SUP'ENT.Spawnable=true;ENT.DoNotDuplicate=true;ENT.IsTurret=true;ENT.Model=Model'models/kingpommes/starwars/venator/turbolaser_base.mdl'ENT.GunModel=Model'models/kingpommes/starwars/venator/turbolaser_barrel.mdl'ENT.MaxUpPitch=-80;ENT.MaxDownPitch=10;ENT.MaxHealth=3000;ENT.SeatPos=Vector(-300,0,5)ENT.SeatAng=Angle(0,-90,0)ENT.PrimaryFireDelay=.5;ENT.SecondaryFireDelay=.4
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_statue/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_timer/cl_init.lua:
include'shared.lua'local a=Color(250,50,50,200)local b=CreateMaterial('timer_scanlines','UnlitGeneric',{['$basetexture']='dev/dev_scanline',['$translucent']=1,['$additive']=1,['$vertexcolor']='1',['$vertexalpha']='1',['Proxies']={['TextureScroll']={['texturescrollvar']='$baseTextureTransform',['texturescrollrate']=.1,['texturescrollangle']=-90}}})function ENT:Draw()self:DrawModel()if!self:GetPaused()then local c=string.FormattedTime(math.max(0,(self:GetFinishTime()||0)-CurTime()))if!self.LastDisplaySecond||self.LastDisplaySecond!=c.s then self:EmitSound('ui/buttonclick.wav',100,c.m==0&&c.s<10&&25||50,1,CHAN_AUTO)end;self.LastDisplaySecond=c.s||0;self.LastDisplayTime=Format('%02i:%02i:%02i',c.m||0,c.s||0,c.ms||0)end;cam.Start3D2D(self:LocalToWorld(self.UIPosition),self:LocalToWorldAngles(self.UIAngle),.35)draw.DrawText('\r'..(self.LastDisplayTime||'00:00:00'),'ui_led.xxl',-40,-75,a,TEXT_ALIGN_CENTER)surface.SetDrawColor(255,0,0,25)surface.SetMaterial(b)surface.DrawTexturedRect(-1080,-350,2150,790)cam.End3D2D()local d=LocalPlayer():GetActiveWeapon()if IsValid(d)&&d:GetClass()=='weapon_physgun'then render.DrawWireframeBox(self:GetPos(),self:GetAngles(),self.MinVec,self.MaxVec,col.white_dark,true)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_trainingpoint.lua:
AddCSLuaFile()ENT.PrintName='Training Point'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Spawnable=true;ENT.AdminOnly=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Category='SUP'ENT.Type='anim'ENT.Base='base_srp'ENT.Model=Model('models/props/terminal1.mdl')ENT.NetworkPlayerUse=true;ENT.DontSit=true;ENT.DontFreeze=true;ENT.Interactive=true;ENT.InteractionName='Review Training'ENT.UIPosition=Vector(2,2,-10)ENT.UIAngle=Angle(0,90,90)function ENT:Initialize()self:SetModel(self.Model)end;function ENT:ClientPlayerUse(a)srp.training.Start(true)end;function ENT:Draw()self:DrawModel()cam.Start3D2D(self:LocalToWorld(self.UIPosition),self:LocalToWorldAngles(self.UIAngle),.1)draw.DrawText('Training Terminal','ui_header.l',0,-5,col.yellow,TEXT_ALIGN_CENTER)cam.End3D2D()end;local b=20;function ENT:DrawInteraction(c,d,e)if self:GetNoDraw()then return end;surface.SetFont'ui_header.s'surface.SetDrawColor(255,255,255,255)surface.SetMaterial(c.OnPickup)surface.SetTextColor(255,255,255,255)local f=self.InteractionName||''local g,h=surface.GetTextSize(f)g=g+b+4;local i,j=e.x,e.y;surface.DrawTexturedRect(i,j,b,b)surface.SetTextPos(i+b+2,j-2)surface.DrawText(f)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_trivia/cl_init.lua:
include'shared.lua'function ENT:Initialize()self.Initialized=true;self.Players={}self:DisplayPanel()end;function ENT:DisplayPanel()if IsValid(self.DisplayVGUI)then self.DisplayVGUI:Remove()end;srp.ui.Create('srp_triviaview',function(a)a:Populate(self,self.UIPosition,self.UIAngles,self.UIScale,self.UIWidth,self.UIHeight)self.DisplayVGUI=a end)end;function ENT:SetStage(b)local c=self.Stages[b]if!c then return end;if c.Menu&&IsValid(self.DisplayVGUI)then self.DisplayVGUI[self.Menu](c)end end;function ENT:PlayerJoined(d,e)self.Players[e]=d end;function ENT:PlayerLeft(d,e)self.Players[e]=nil end;function ENT:Think()if!self.Initialized then self:Initialize()end end;ENT.Draw=ENTITY.DrawModel;function ENT:OnRemove()if IsValid(self.DisplayVGUI)then self.DisplayVGUI:Remove()end end;net.Receive('srp.trivia.Joined',function()local f=net.ReadEntity()local b=net.ReadUInt(3)local d=net.ReadPlayer()if IsValid(f)then f:PlayerJoined(d,b)end end)net.Receive('srp.trivia.Left',function()local f=net.ReadEntity()local b=net.ReadUInt(3)local d=net.ReadPlayer()if IsValid(f)then f:PlayerLeft(d,b)end end)
--addons/!lpakr_out/lua/entities/shield/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/spwn_drg_default.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/sup_detonate.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/wos_kyber_slam/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/wos_sonic_discharge/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/anzati_swtor10/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/anzati_swtor10/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=1;if!f then return end;for h=0,d/g do local i=b+c*(d-h*g)local j=f:Add("wos/lightsabers/effects/anzati/swtor10",i)if j then j:SetLifeTime(0)j:SetDieTime(0.3)j:SetGravity(Vector(0,0,math.random(32,128)))j:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(math.random(100,200))j:SetEndAlpha(0)j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/anzati_swtor11/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=1;if!f then return end;for h=0,d/g do local i=b+c*(d-h*g)local j=f:Add("wos/lightsabers/effects/anzati/swtor11",i)if j then j:SetLifeTime(0)j:SetDieTime(0.3)j:SetGravity(Vector(0,0,math.random(32,128)))j:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(math.random(100,200))j:SetEndAlpha(0)j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/anzati_swtor7/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=1;if!f then return end;for h=0,d/g do local i=b+c*(d-h*g)local j=f:Add("wos/lightsabers/effects/anzati/swtor7",i)if j then j:SetLifeTime(0)j:SetDieTime(0.3)j:SetGravity(Vector(0,0,math.random(32,128)))j:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(math.random(100,200))j:SetEndAlpha(0)j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/dronesrewrite_flame.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/fireworks_valentine.lua:
local a=Material('galactic/seasonal/valentines/heart.png')local b=Material('galactic/seasonal/valentines/giftbox.png')function EFFECT:Init(c)self.Origin=c:GetOrigin()self.StartTime=CurTime()local d=ParticleEmitter(self.Origin,false)for e=0,100 do local f=VectorRand():GetNormal()*math.Rand(1000,2500)local g=d:Add(a,self.Origin)if g then g:SetVelocity(f)g:SetLifeTime(0)g:SetDieTime(6)g:SetStartAlpha(math.random(220,255))g:SetEndAlpha(0)g:SetStartSize(math.random(5,10))g:SetEndSize(math.random(60,100))g:SetAirResistance(math.Rand(130,150))g:SetColor(255,255,255)g:SetCollide(false)g:SetBounce(1)end end;d:Finish()SafeRemoveEntityDelayed(self,15)end;function EFFECT:Think()return CurTime()<self.StartTime+0.5 end;function EFFECT:Render()end
--addons/ssrp_lfs/lua/effects/lvs_bullet_impact.lua:

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
	"particle/particle_debris_01",
	"particle/particle_debris_02",
}

function EFFECT:Init( data )
	local pos = data:GetOrigin()
	local dir = data:GetNormal()
	local scale = data:GetMagnitude()

	sound.Play( "physics/flesh/flesh_strider_impact_bullet"..math.random(1,3)..".wav", pos, 85, math.random(180,200) + 55 * math.max(1 - scale,0), 0.75 )
	sound.Play( "ambient/materials/rock"..math.random(1,5)..".wav", pos, 75, 180, 1 )


	local emitter = ParticleEmitter( pos, false )

	local VecCol = (render.GetLightColor( pos + dir ) * 0.5 + Vector(0.2,0.18,0.15)) * 255

	local DieTime = math.Rand(0.8,1.6)

	if dir.z > 0.85 then
		for i = 1, 10 do
			for n = 0,6 do
				local particle = emitter:Add( self.DustMat[ math.random(1,#self.DustMat) ] , pos )

				if not particle then continue end

				particle:SetVelocity( (dir * 50 * i + VectorRand() * 25) * scale )
				particle:SetDieTime( (i / 8) * DieTime )
				particle:SetAirResistance( 10 )
				particle:SetStartAlpha( 255 )
				particle:SetStartSize( 10 * scale )
				particle:SetEndSize( 20 * i * scale )
				particle:SetRollDelta( math.Rand(-1,1) )
				particle:SetColor( VecCol.r, VecCol.g, VecCol.b )
				particle:SetGravity( Vector(0,0,-600) * scale )
				particle:SetCollide( false )
			end
		end

		for i = 1, 10 do
			local particle = emitter:Add( self.SmokeMat[ math.random(1,#self.SmokeMat) ] , pos )

			if not particle then continue end

			particle:SetVelocity( (dir * 50 * i + VectorRand() * 40) * scale )
			particle:SetDieTime( (i / 8) * DieTime )
			particle:SetAirResistance( 10 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 10 * scale )
			particle:SetEndSize( 20 * i * scale )
			particle:SetRollDelta( math.Rand(-1,1) )
			particle:SetColor( VecCol.r, VecCol.g, VecCol.b )
			particle:SetGravity( Vector(0,0,-600) * scale )
			particle:SetCollide( false )
		end
	end

	for i = 1,12 do
		local particle = emitter:Add( self.SmokeMat[ math.random(1,#self.SmokeMat) ] , pos )

		if particle then
			local ang = i * 30
			local X = math.cos( math.rad(ang) )
			local Y = math.sin( math.rad(ang) )

			local Vel = Vector(X,Y,0) * math.Rand(200,1600) + Vector(0,0,50)
			Vel:Rotate( dir:Angle() + Angle(90,0,0) )

			particle:SetVelocity( Vel * scale )
			particle:SetDieTime( DieTime )
			particle:SetAirResistance( 500 )
			particle:SetStartAlpha( 100 )
			particle:SetStartSize( 40 * scale )
			particle:SetEndSize( 200 * scale )
			particle:SetRollDelta( math.Rand(-1,1) )
			particle:SetColor( VecCol.r, VecCol.g, VecCol.b )
			particle:SetGravity( Vector(0,0,60) * scale )
			particle:SetCollide( true )
		end
	end

	emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

--addons/ssrp_lfs/lua/effects/lvs_laser_red_short.lua:
local red = Color( 255, 0, 0, 255 )
local white = Color(255, 255, 255, 255)

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
	render.DrawBeam( endpos - dir * len * 2, endpos + dir * len * 2, 200, 1, 0, red )

	render.SetMaterial( self.MatBeam )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 45, 1, 0, red )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 15, 1, 0, white )
end

--addons/ssrp_lfs/lua/effects/lvs_missiletrail.lua:
EFFECT.Offset = Vector(-8,0,0)
local beige = Color( 255, 200, 150, 255 )
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
	self.Entity = data:GetEntity()

	if IsValid( self.Entity ) then
		self.OldPos = self.Entity:LocalToWorld( self.Offset )

		self.Emitter = ParticleEmitter( self.Entity:LocalToWorld( self.OldPos ), false )
	end
end

function EFFECT:doFX( pos )
	if not IsValid( self.Entity ) then return end

	if IsValid( self.Emitter ) then
		local emitter = self.Emitter

		local particle = emitter:Add( Materials[ math.random(1, #Materials ) ], pos )
		if particle then
			particle:SetGravity( Vector(0,0,100) + VectorRand() * 50 )
			particle:SetVelocity( -self.Entity:GetForward() * 200  )
			particle:SetAirResistance( 600 )
			particle:SetDieTime( math.Rand(1.5,2) )
			particle:SetStartAlpha( 50 )
			particle:SetStartSize( 20 )
			particle:SetEndSize( 60 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetRollDelta( math.Rand( -1, 1 ) )
			particle:SetColor(40,40,40)
			particle:SetCollide( false )
		end

		local particle = emitter:Add( "particles/flamelet"..math.random(1,5), pos )
		if particle then
			particle:SetVelocity( -self.Entity:GetForward() * math.Rand(250,800) + self.Entity:GetVelocity())
			particle:SetDieTime( math.Rand(0.2,0.4) )
			particle:SetAirResistance( 0 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 8 )
			particle:SetEndSize( 1 )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 255,255,255 )
			particle:SetGravity( Vector( 0, 0, 0 ) )
			particle:SetCollide( false )
		end

		local particle = emitter:Add( "particles/flamelet"..math.random(1,5), self.Entity:GetPos() )
		if particle then
			particle:SetVelocity( -self.Entity:GetForward() * 200 + VectorRand() * 50 )
			particle:SetDieTime( 0.25 )
			particle:SetAirResistance( 600 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 6 )
			particle:SetEndSize( 2 )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 255,255,255 )
			particle:SetGravity( Vector( 0, 0, 0 ) )
			particle:SetCollide( false )
		end
	end
end

function EFFECT:Think()
	if IsValid( self.Entity ) then
		self.nextDFX = self.nextDFX or 0

		if self.nextDFX < CurTime() then
			self.nextDFX = CurTime() + 0.02

			local oldpos = self.OldPos
			local newpos = self.Entity:LocalToWorld( self.Offset )
			self:SetPos( newpos )

			local Sub = (newpos - oldpos)
			local Dir = Sub:GetNormalized()
			local Len = Sub:Length()

			self.OldPos = newpos

			for i = 0, Len, 45 do
				local pos = oldpos + Dir * i

				self:doFX( pos )
			end
		end

		return true
	end

	if IsValid( self.Emitter ) then
		self.Emitter:Finish()
	end

	return false
end

function EFFECT:Render()
	local ent = self.Entity
	local pos = ent:LocalToWorld( self.Offset )

	render.SetMaterial( GlowMat )

	render.DrawSprite( pos, 100, 100, beige )
end

--addons/ssrp_lfs/lua/effects/lvs_physics_water.lua:

function EFFECT:Init( data )
	local Pos = data:GetOrigin()
	local Ent = data:GetEntity()

	if not IsValid( Ent ) then return end

	self.LifeTime = math.Rand(1.5,3)
	self.DieTime = CurTime() + self.LifeTime

	self.Splash = {
		Pos = Pos,
		Mat = Material("effects/splashwake1"),
		RandomAng = math.random(0,360),
	}

	local emitter = Ent:GetParticleEmitter( Ent:GetPos() )

	if emitter and emitter.Add then
		local particle = emitter:Add( "effects/splash4", Pos + VectorRand(-10,10) - Vector(0,0,20) )
		if particle then
			particle:SetVelocity( Vector(0,0,250) )
			particle:SetDieTime( 0.8 )
			particle:SetAirResistance( 60 ) 
			particle:SetStartAlpha( 255 )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( 50 )
			particle:SetEndSize( 100 )
			particle:SetRoll( math.Rand(-1,1) * 100 )
			particle:SetColor( 255,255,255 )
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
	if self.Splash and self.LifeTime then
		local Scale = (self.DieTime - self.LifeTime - CurTime()) / self.LifeTime
		local S = 200 - Scale * 600
		local Alpha = 100 + 100 * Scale

		cam.Start3D2D( self.Splash.Pos + Vector(0,0,1), Angle(0,0,0), 1 )
			surface.SetMaterial( self.Splash.Mat )
			surface.SetDrawColor( 255, 255, 255 , Alpha )
			surface.DrawTexturedRectRotated( 0, 0, S , S, self.Splash.RandomAng )
		cam.End3D2D()
	end
end
--addons/ssrp_lfs/lua/effects/lvs_tracer_green.lua:
local offwhite = Color( 220, 255, 220, 255 )
local yellow = Color( 255, 255, 0, 255 )
local green = Color( 110, 150, 110, 255 )

EFFECT.MatBeam = Material( "effects/lvs_base/spark" )
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

	local len = 1500 * bullet:GetLength()

	render.SetMaterial( self.MatBeam )

	render.DrawBeam( endpos - dir * len, endpos + dir * len * 0.1, 10, 1, 0, offwhite)
	render.DrawBeam( endpos - dir * len * 0.5, endpos + dir * len * 0.1, 5, 1, 0, yellow )

	render.SetMaterial( self.MatSprite )
	render.DrawSprite( endpos, 400, 400, green )
end

--addons/!lpakr_out/lua/effects/rb655_saber_underwater.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=ParticleEmitter(b)local f=4;if!e then return end;for g=0,d/f do local h=b+c*(d-g*f)local i=e:Add("effects/bubble",h+Vector(math.random(-f/2,f/2),math.random(-f/2,f/2),math.random(-f/2,f/2)))if i then i:SetLifeTime(0)i:SetDieTime(0.3)i:SetGravity(Vector(0,0,math.random(32,128)))i:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))i:SetStartSize(math.random(1,4))i:SetEndSize(math.random(1,4))i:SetStartAlpha(math.random(100,200))i:SetEndAlpha(0)i:SetColor(255,255,255)i:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;e:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/sup_laser_red.lua:
EFFECT.Speed=20000;EFFECT.Length=25;EFFECT.UseModel=false;local a=Vector()local b=Material'effects/sw_laser_red_main'local c=Material'effects/sw_laser_red_front'function EFFECT:Init(d)self.StartPos=d:GetStart()self.EndPos=d:GetOrigin()self.Scale=d:GetScale()if self.Scale==0 then self.Scale=1 end;if!self.StartPos||!self.EndPos then self.DieTime=CurTime()return end;local e=d:GetEntity()local f=d:GetAttachment()if IsValid(e)&&f>0 then if e.Owner==LocalPlayer()&&LocalPlayer():GetViewModel()!=LocalPlayer()&&!LocalPlayer():ShouldDrawLocalPlayer()then local g=e.Sequence&&(e.Sequence:find('right')&&MuzzlePosition2||MuzzlePosition)||nil;g=g||e.Akimbo&&(e.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition;self.StartPos=g||self.StartPos else local h=e.Akimbo&&(e.AkimboLeftFire&&f||f+1)||f;local f=e:GetAttachment(h)if f&&f.Pos then self.StartPos=f.Pos else self.DieTime=0;return end end end;self.Dir=(self.EndPos-self.StartPos):GetNormalized()self:SetRenderBoundsWS(self.StartPos+self.Dir*1,self.EndPos)self.StartTime=CurTime()self.Distance=self.StartPos:Distance(self.EndPos)self.TracerTime=self.Distance/(self.Scale*self.Speed)self.DieTime=self.StartTime+self.TracerTime;local i=EffectData()i:SetOrigin(self.StartPos+self.Dir*10)i:SetNormal(self.Dir)i:SetMagnitude(0)i:SetScale(1)util.Effect('StriderMuzzleFlash',i)end;function EFFECT:Think()if CurTime()>self.DieTime then return false end;return true end;function EFFECT:Render()if CurTime()>=self.DieTime then return end;local j=self.Scale||1;local k=(CurTime()-self.StartTime)/self.TracerTime;if k<0 then return end;local l=self.StartPos+self.Dir*self.Distance*k;local m=l+self.Dir*(math.random(20,30)+self.Length*j)render.SetMaterial(b)render.DrawBeam(l,m,j*20,0,1,col.red_light)render.SetMaterial(c)render.DrawSprite(m,j*20,j*20,col.red_light)if srp.nvg.IsEnabled()then return end;self.dlight=DynamicLight(self:EntIndex())if self.dlight then self.dlight.pos=m;self.dlight.r=255;self.dlight.g=0;self.dlight.b=0;self.dlight.brightness=2;self.dlight.Decay=2000;self.dlight.Size=600;self.dlight.DieTime=CurTime()+.1 end end
--addons/!lpakr_out/lua/effects/sup_laser_yellow.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/thor_storm/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/chatbox/init_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/notifications/notifications_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/sitrequests/init_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/ssrp/logs/misc_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/ssrp/logs/building_sh.lua:
return lpakr()()