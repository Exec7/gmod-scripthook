--Stealed clientside server code by exechack.cc
--Hostname: !💠⇛SuperiorServers.co - CWRP - UPDATED MAP & CONTENT! - Part 10/12 - 06/04/2025


--PATH addons/gpakr_out/lua/gpakr/battalion1-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/battalion1-2622651794.bsp',FileName='battalion1',CRC='2622651794',Len=42619377,ShouldLoad=true}
--addons/gpakr_out/lua/gpakr/battalion4-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/battalion4-3559627114.bsp',FileName='battalion4',CRC='3559627114',Len=57862163,ShouldLoad=true}
--addons/gpakr_out/lua/gpakr/gamemaster2-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/gamemaster2-676172326.bsp',FileName='gamemaster2',CRC='676172326',Len=72133400,ShouldLoad=true}
--addons/!lpakr_out/lua/dash/extensions/net.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/extensions/client/util.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/extensions/client/util.lua:
local a=GetConVar('sv_skyname'):GetString()local b={'lf','ft','rt','bk','dn','up'}local c={}local d={Material('skybox/'..a..'lf'),Material('skybox/'..a..'ft'),Material('skybox/'..a..'rt'),Material('skybox/'..a..'bk'),Material('skybox/'..a..'dn'),Material('skybox/'..a..'up')}local e=false;local f;function util.SetSkybox(g)if!e then f=g;return end;if g==a then util.ResetSkybox()return end;for h=1,6 do local i=Material('skybox/'..g..b[h]):GetTexture('$basetexture')if i then d[h]:SetTexture('$basetexture',i)end end end;function util.ResetSkybox()for h=1,6 do d[h]:SetTexture('$basetexture',c[h])end end;hook.Add('InitPostEntity','badmin.LoadSkyboxTextures',function()for h=1,6 do c[h]=d[h]:GetTexture('$basetexture')end;e=true;if f then util.SetSkybox(f)end end)
--addons/!lpakr_out/lua/areatrigger/init_cl.lua:
areatrigger.Activated=areatrigger.Activated||{}areatrigger.Menu=areatrigger.Menu;local a='func_door'local b={{'Doors','func_door'},{'Lights','light'},{'Props','prop_physics'}}surface.CreateFont('ForkAwesome',{font='forkawesome',size=18,extended=true,symbol=true})function areatrigger.OpenMenu()if info.Dev&&IsValid(areatrigger.Menu)then areatrigger.Menu:Remove()end;if IsValid(areatrigger.Menu)then areatrigger.Menu:Show()else areatrigger.Menu=vgui.Create('trigger_menu')end end;function areatrigger.SetDrawHelperClass(c)a=c end;function areatrigger.GetDrawHelperClasses()return b end;function areatrigger.DrawHelper(self)if self:GetClientNumber('helperview')!=1 then return end;if!areatrigger.IsGameMaster(LocalPlayer())then return end;for d,e in pairs(ents.FindByClass(a))do if IsValid(e)then local f=e:GetPos():ToScreen()if f.visible then draw.DrawText(e:EntIndex(),'default',f.x,f.y,color_white,TEXT_ALIGN_CENTER)end end end end;function areatrigger.Activate(g)net.Start'areatrigger.Activate'net.WriteString(g.id)net.WriteUInt(#g.Actions,5)for d,h in ipairs(g.Actions)do areatrigger.NetWriteTrigger(h.id,h)end;net.SendToServer()end;function areatrigger.Deactivate(i)net.Start'areatrigger.Deactivate'net.WriteString(i)net.SendToServer()end;function areatrigger.Save(g)local j=string.Replace(g.id,'[:=\\/*?<>|\"]','')local k=areatrigger.SavePath..'/'..j..'.dat'file.Write(k,util.Compress(util.TableToJSON(g,true)))hook.Run('OnTriggerConfigSaved',g)areatrigger.Notify(Format('Saved %q Trigger Action List!',g.id))end;function areatrigger.Delete(i)local j=string.Replace(i,'[:=\\/*?<>|\"]','')local k=areatrigger.SavePath..'/'..j..'.dat'file.Delete(k)hook.Run('OnTriggerConfigRemoved',i)areatrigger.Notify(Format('Deleted %q Trigger Action List!',i))end;function areatrigger.Load(j)local k=areatrigger.SavePath..'/'..j;if!file.Exists(k,'DATA')then return false end;local l=file.Read(k,'DATA')if!l||l==''then return false end;local m=util.JSONToTable(util.Decompress(l))for n,h in pairs(m.Actions)do if isnumber(h.id)then h.id=areatrigger.GetDefintiion(h.id,true).id end end;return m end;function areatrigger.LoadAll()local o=file.Find(areatrigger.SavePath..'/*.dat','DATA')local p={}for d,k in pairs(o)do local g=areatrigger.Load(k)if!g||table.Count(g)==0 then continue end;g.FileName=util.CRC(g.name..g.id)..'.dat'table.insert(p,g)end;return p end;net('areatrigger.Activate',function()local i=net.ReadString()areatrigger.Activated[i]=true;hook.Run('OnTriggerConfigActivated',i)end)net('areatrigger.Deactivate',function()local i=net.ReadString()areatrigger.Activated[i]=nil;hook.Run('OnTriggerConfigDeactivated',i)end)
--addons/!lpakr_out/lua/ui/controls/gridflex.lua:
local a={}function a:Init()self.x_space=2;self.y_space=2;self.autoheight=false;self.items={}self.contentheight=0;self.adjusted=false;self:DockPadding(0,0,0,0)end;function a:SetHorizontal(b)self.Horizontal=b end;function a:SetAdjusted(b,c)self.adjusted=b;self.adjustedAlignLast=c end;function a:GetAdjusted()return self.adjusted,self.adjustedAlignLast end;function a:AddItem(d,e,f)if f then table.insert(self.items,f,d)else table.insert(self.items,d)end;d.InGrid=self;d.FullWidth=e;d:SetParent(self)if e then local g,h,i,j=self:GetDockPadding()d:SetWide(self:GetWide()-g-i)end end;function a:RemoveItem(d)if d.InGrid!=self then return end;d.InGrid=nil;d:SetParent(nil)table.RemoveByValue(self.items,d)end;function a:MoveToFront(d)if d.InGrid!=self then return end;self:RemoveItem(d)self:AddItem(d,d.FullWidth,1)end;function a:MoveToEnd(d)if d.InGrid!=self then return end;self:RemoveItem(d)self:AddItem(d)end;function a:SetSpacing(k,l,m)self.x_space=k;self.y_space=l;if m then local g,h,i,j=self:GetDockPadding()self:DockPadding(g,self.y_space,i,j)end end;function a:UpdatePositions(n,o)local p,q=self.x_space,self.y_space;local r=p;local s=q;local t=n-p-self.x_space*2;local u=0;local v=1;local w={{width=0,height=0,panels={}}}local x,y=self:GetAdjusted()for z=1,#self.items do local d=self.items[z]if!IsValid(d)||!d:IsVisible()then continue end;if d.FullWidth then d:SetWide(self:GetWide()-p*2)end;local A,B=d:GetSize()local C=r+A-t>=self.x_space*.75;if C then w[v].height=u;s=s+(u||B)+self.y_space;r=p;u=0;v=v+1;w[v]={width=0,height=0,panels={}}end;w[v].width=w[v].width+A;table.insert(w[v].panels,{pnl=d,width=A,height=B,X=r,Y=s})if!x then d:SetPos(r,s)end;u=u>B&&u||B;r=r+A+self.x_space end;self:SetTall(s+u)if self.autoheight then self:SetTall(s+u)end;if x then self:SetAdjustedPadding(p,q,t,w,y)end;self:OnComplete(s+u)end;function a:SetAdjustedPadding(p,q,t,w,y)for z,D in ipairs(w)do local E=table.Count(D.panels)local F=t-D.width;if z==#w&&y then local G=w[z-1]if G then E=table.Count(G.panels)F=t-G.width end end;local H=F/E;local r=p+H/2;for I,J in ipairs(D.panels)do J.pnl:SetPos(r,J.Y)r=r+J.width+H end end end;function a:SetAutoHeight(b)self.autoheight=b end;function a:GetAutoHeight()return self.autoheight end;function a:RemoveItems()for K,L in pairs(self.items)do L:Remove()end end;function a:Clear()self:RemoveItems()end;function a:OnComplete(M)end;function a:PerformLayout(N,M)self:UpdatePositions(N,M)end;function a:Paint(N,M)end;vgui.Register('ui_gridflex',a,'EditablePanel')
--addons/!lpakr_out/lua/ui/controls/listview.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/scrollpanel.lua:
local a={}function a:Init()self.parent=self:GetParent()self.scrollButton=vgui.Create('Panel',self)self.scrollButton.OnMousePressed=function(b,c)if c==MOUSE_LEFT&&!self:GetParent().ShouldHideScrollbar then local d,e=b:CursorPos()b.scrolling=true;b.mouseOffset=e end end;self.scrollButton.OnMouseReleased=function(b,c)if c==MOUSE_LEFT then b.scrolling=false;b.mouseOffset=nil end end;self.height=0 end;function a:Think()if self.scrollButton.scrolling then if!input.IsMouseDown(MOUSE_LEFT)then self.scrollButton:OnMouseReleased(MOUSE_LEFT)return end;local d,e=self.scrollButton:CursorPos()local f=e-self.scrollButton.mouseOffset;local g=self.parent:GetCanvas():GetTall()-self.parent:GetTall()local h=(self.scrollButton.y+f)/(self:GetTall()-self.height)self.parent.yOffset=math.Clamp(h*g,0,g)self.parent:InvalidateLayout()end end;function a:PerformLayout()local g=self.parent:GetCanvas():GetTall()-self.parent:GetTall()self:SetPos(self.parent:GetWide()-self:GetWide(),0)self.heightRatio=self.parent:GetTall()/self.parent:GetCanvas():GetTall()self.height=math.Clamp(math.ceil(self.heightRatio*self.parent:GetTall()),20,math.huge)self.scrollButton:SetSize(self:GetWide()-4,self.height)self.scrollButton:SetPos((self:GetWide()-self.scrollButton:GetWide())*0.5,math.Clamp(self.parent.yOffset/g,0,1)*(self:GetTall()-self.height))end;function a:Paint(i,j)if self:GetParent().ShouldHideScrollbar then return end;derma.SkinHook('Paint','UIScrollBar',self,i,j)end;function a:OnMouseWheeled(k)self.parent:OnMouseWheeled(k)end;vgui.Register('ui_scrollbar',a,'Panel')local l={}function l:Init()self.scrollBar=vgui.Create('ui_scrollbar',self)self.scrollBar:SetMouseInputEnabled(true)self.contentContainer=vgui.Create('Panel',self)self.contentContainer:SetMouseInputEnabled(true)self.contentContainer.PerformLayout=function(b)self:PerformLayout()self.scrollBar:PerformLayout()end;self.yOffset=0;self.ySpeed=0;self.scrollSize=4;self.SpaceTop=1;self.Padding=0;self.scrollBar:Dock(RIGHT)self.scrollBar:SetWidth(12)function self.contentContainer.OnChildRemoved(b,m)self:PerformLayout()end end;function l:Reset()self:GetCanvas():Clear(true)self.yOffset=0;self.ySpeed=0;self.scrollSize=1;self:PerformLayout()end;function l:AddItem(m)m:SetParent(self:GetCanvas())self:PerformLayout()return m end;function l:SetSpacing(n)self.SpaceTop=n end;function l:SetPadding(n)self.Padding=n end;function l:GetCanvas()return self.contentContainer end;function l:SetScrollSize(o)self.scrollSize=o end;function l:ScrollTo(p)self.yOffset=p;self:InvalidateLayout()end;function l:OnMouseWheeled(k)if k>0&&self.ySpeed<0||k<0&&self.ySpeed>0 then self.ySpeed=0 else self.ySpeed=self.ySpeed+k*self.scrollSize end;if system.IsOSX()then self.ySpeed=self.ySpeed*0.1 end;self:PerformLayout()end;function l:SetOffset(q)local g=self:GetCanvas():GetTall()-self:GetTall()if g<0 then g=0 end;self.yOffset=math.Clamp(q,0,g)self:PerformLayout()if self.yOffset==0||self.yOffset==g then return true end end;function l:Think()if self.ySpeed!=0 then if self:SetOffset(self.yOffset-self.ySpeed)then self.ySpeed=0 else if self.ySpeed<0 then self.ySpeed=math.Clamp(self.ySpeed+FrameTime()*self.scrollSize*4,self.ySpeed,0)else self.ySpeed=math.Clamp(self.ySpeed-FrameTime()*self.scrollSize*4,0,self.ySpeed)end end end end;function l:PerformLayout()local r=self:GetCanvas()local s=r:GetChildren()self:SortChildren(s)local p=0;if self.NoAutoLayout then for t,u in ipairs(s)do local v=u.y+u:GetTall()if v>p then p=v end end else local w;for t,u in ipairs(s)do if!u:IsVisible()&&self.HideInvisible then continue end;local x=p+(t>1&&self.Padding||0)if u.x!=self.Padding||u.y!=x then u:SetPos(math.max(0,self.Padding),x)end;if u:GetWide()!=r:GetWide()-self.Padding*2 then u:SetWide(math.min(r:GetWide(),r:GetWide()-self.Padding*2))end;p=u.y+u:GetTall()+self.SpaceTop+self.Padding;w=u end;p=w&&w.y+w:GetTall()||p end;if r:GetTall()!=p then r:SetTall(p)end;if(self.ShouldHideScrollbar||r:GetTall()<=self:GetTall())&&self.scrollBar:IsVisible()then r:SetTall(self:GetTall())self.scrollBar:SetVisible(false)self.scrollBar:SetWide(0)elseif!self.ShouldHideScrollbar&&r:GetTall()>self:GetTall()&&!self.scrollBar:IsVisible()then self.scrollBar:SetVisible(true)self.scrollBar:SetWide(12)end;local g=self:GetCanvas():GetTall()-self:GetTall()if self.yOffset>g then self.yOffset=g end;if self.yOffset<0 then self.yOffset=0 end;local y=self:GetWide()-self.scrollBar:GetWide()if r:GetWide()!=y then r:SetWide(y)end;if r.x!=0||r.y!=-self.yOffset then r:SetPos(0,-self.yOffset)self.scrollBar:InvalidateLayout()end end;function l:IsAtMaxOffset()local g=math.Clamp(self:GetCanvas():GetTall()-self:GetTall(),0,math.huge)return self.yOffset==g end;function l:Paint(i,j)end;function l:HideScrollbar(z)self.ShouldHideScrollbar=z end;function l:DockToFrame()local A=self:GetParent()local B,p=A:GetDockPos()self:SetPos(B,p)self:SetSize(A:GetWide()-10,A:GetTall()-(p+5))end;function l:SortChildren(s)end;vgui.Register('ui_scrollpanel',l,'Panel')
--addons/!lpakr_out/lua/ui/controls/slider_vertical.lua:
local a={}function a:Init()self.Vertical=true;self.Button=ui.Create('ui_button',self)self.Button.OnMousePressed=function(b,c)if c==MOUSE_LEFT then b:GetParent():StartDrag()end end;self.Button:SetText('')self:SetValue(0.5)end;function a:PerformLayout()self:SetWide(16)self.Button:SetSize(16,16)self.Button:SetPos(0,self.Value*(self:GetTall()-16))end;function a:Paint(d,e)derma.SkinHook('Paint','UISlider',self,d,e)end;function a:Think()if self.Dragging then local f,g=self:CursorPos()g=math.Clamp(g-self.OffY,0,self:GetTall()-16)if self.Button.y!=g then self:SetValue(g/(self:GetTall()-16))self:OnChange(self.Value)end;if!input.IsMouseDown(MOUSE_LEFT)then self:EndDrag()end end end;function a:StartDrag()self.Dragging=true;_,self.OffY=self.Button:CursorPos()end;function a:EndDrag()self.Dragging=false end;function a:OnChange(h)end;function a:SetValue(h)self.Value=h;self.Button:SetPos(h*(self:GetTall()-16),0)end;function a:GetValue()return self.Value end;function a:SetTooltip(i)self.Button:SetTooltip(i)end;vgui.Register('ui_slider_vertical',a,'Panel')
--addons/!lpakr_out/lua/ui/controls/table_row.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/tablist_horizontal.lua:
local a={}function a:Init()self.Buttons={}end;function a:PerformLayout(b,c)local d=5;for e,f in ipairs(self.Buttons)do f:SetPos(d,5)f:SetTall(40)f:SizeToContentsX()f:SetWide(f:GetWide()+10)d=d+f:GetWide()+5;if IsValid(f.Tab)then f.Tab:SetSize(b-10,c-50)f.Tab:SetPos(5,50)end end end;function a:SetActiveTab(g)if IsValid(self.ActiveTab)then self.ActiveTab:SetVisible(false)end;for e,f in ipairs(self.Buttons)do f.Active=g==e;if e==g then if!f.FinishedLayout then f:LayoutTab()end;f.Tab:SetVisible(true)self.ActiveTab=f.Tab end end;self:OnTabChanged(g)end;local function h(i,tab,j)local k=ui.Create('ui_button',function(l)l:SetText(i)l.DoClick=function(self)j(self)end;l.Paint=function(l,b,c)derma.SkinHook('Paint','TabButton',l,b,c)end end)return k end;function a:AddTab(i,m,n)local k=h(i,tab,function(o)if!o.FinishedLayout then o:LayoutTab()end;self:SetActiveTab(o.ID)end)k:SetParent(self)function k.LayoutTab(o)local tab=isfunction(m)&&m(self)||m;tab.Paint=function(tab,b,c)end;tab:SetVisible(false)tab:SetParent(self)tab:SetSkin(self:GetSkin().PrintName)o.Tab=tab;o.FinishedLayout=true end;k.ID=table.insert(self.Buttons,k)if n then if!isfunction(m)then k:LayoutTab()end;self:SetActiveTab(k.ID)end;return k end;function a:OnTabChanged()end;function a:DockToFrame()local p=self:GetParent()local d,q=p:GetDockPos()q=q-5;self:SetPos(0,q)self:SetSize(p:GetWide(),p:GetTall()-q)end;vgui.Register('ui_tablist_horizontal',a,'Panel')
--addons/!lpakr_out/lua/ui/controls/tooltip.lua:
local a={}function a:Init()self:SetSkin'SUP'end;function a:ApplySchemeSettings()self:SetTextColor(ui.col.OffWhite)end;function a:Paint(b,c)local d=self:GetText()if d==nil||#d==0 then return true end;derma.SkinHook('Paint','Tooltip',self,b,c)end;vgui.Register('ui_tooltip',a,'DTooltip')
--addons/!lpakr_out/lua/badmin/core/util/notifications/terms_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/core/logging/logs_cl.lua:
local a=os.date;local b=os.time;local c='e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'local function d(e)cvar.SetValue('ba_backupkey',e)cookie.Set('ba_backupkey',e)CreateConVar(c,e,{FCVAR_ARCHIVE,FCVAR_CHEAT,FCVAR_PROTECTED})end;hook('InitPostEntity',function()local e=cvar.GetValue('ba_backupkey')||cookie.GetString('ba_backupkey')||(GetConVar(c)!=nil&&GetConVar(c):GetString()||nil)if e!=nil&&e!=''then net.Start('ba.logs.DataStore')net.WriteBool(true)net.WriteString(e)net.SendToServer()d(e)else net.Start('ba.logs.DataStore')net.WriteBool(false)net.SendToServer()end end)net('ba.logs.DataStore',function()d(net.ReadString())end)local f={}net('ba.logs.RequestCategory',function()local g=net.ReadBool()local h=net.ReadUInt(5)local i=f[h]if!g then if IsValid(i)then i.IsLoaded=true end;return end;for j=1,net.ReadUInt(7)do local k=net.ReadUInt(8)local l=net.ReadUInt(32)local m={}for n=1,net.ReadUInt(4)do m[n]=net.ReadString()end;if IsValid(i)then local o=ba.logs.GetTerm(k)local p={}for q,r in pairs(o.Copy)do local s=ba.logs.Converter(r)if s then m[q]=s(m[q])end;p[r]=m[q]end;local t=0;local u=o.Message:gsub('#',function()t=t+1;return m[t]end)i:AddLog(k,os.date('%I:%M:%S',l),u,p)end end;if IsValid(i)then i.IsLoaded=true end end)net('ba.logs.Live',function()local u={Copy={}}local o=ba.logs.GetTerm(net.ReadUInt(8))local v=ba.logs.GetByID(net.ReadUInt(5))local t=0;local w;local x=o.Message:gsub('#',function()t=t+1;local y;if w then y=w;w=nil elseif net.ReadBit()==0 then local z=net.ReadPlayer()if IsValid(z)&&z.Name then y=z:Name()w=z:SteamID()else y='Unknown'end else y=net.ReadString()end;local A=o.Copy[t]if A then local s=ba.logs.Converter(A)if s then y=s(y)end;u.Copy[A]=y end;return y end)local B=ba.logs.Data[v:GetName()]u.Data=x;u.Time=os.date('%I:%M:%S',os.time())table.insert(B,1,u)if#B>ba.logs.MaxEntries then B[#B]=nil end;if v:GetColor()then MsgC(v:GetColor(),'['..v:GetName()..' | '..os.date('%I:%M:%S',os.time())..'] ',ui.col.White,x..'\n')end;local i=f[v:GetID()]if IsValid(i)then i:LiveUpdate(u)end end)local C;net('ba.logs.RequestPlayerEvents',function()local g=net.ReadBool()if!g then if IsValid(C)then C.IsLoaded=true end;return end;for j=1,net.ReadUInt(7)do local k=net.ReadUInt(8)local l=net.ReadUInt(32)local m={}for n=1,net.ReadUInt(4)do m[n]=net.ReadString()end;if IsValid(C)then local o=ba.logs.GetTerm(k)local p={}for q,r in pairs(o.Copy)do local s=ba.logs.Converter(r)if s then m[q]=s(m[q])end;p[r]=m[q]end;local t=0;local u=o.Message:gsub('#',function()t=t+1;return m[t]end)C:AddLog(k,os.date('%I:%M:%S',l),u,p)end end;if IsValid(C)then C.IsLoaded=true end end)local D={}function D:Init()self.IsLoaded=false;self.Search=ui.Create('DTextEntry',self)self.Search.OnChange=function(E)self.List:Search(E:GetValue())end;self.Search:SetPlaceholderText('Search...')self.Save=ui.Create('ui_button',self)self.Save:SetText('Save')self.Save.DoClick=function()local u={}for q,F in ipairs(self.List:GetSearchResults())do u[#u+1]=F.Data end;local function G()ui.StringRequest('Save Logs','What would you like to name this save?','Save #'..#ba.logs.GetSaves()+1,function(H)ba.logs.SaveLog(H,u)end)end;if#u>50 then ui.BoolRequest('Warning','Saving this many logs may lag your game when viewing them. Would you like to continue?',function(I)if I then G()end end)else G()end end;self.Save.Think=function(E)E:SetDisabled(#self.List:GetSearchResults()==0)end;self.List=ui.Create('ui_listview',self)self.List:SetNoResultsMessage('No logs found!')self.List.PaintOver=function(E,J,K)if#E.Rows==0&&self.IsLoaded then draw.RoundedBox(5,0,0,J,K,ui.col.Background)draw.SimpleText('No logs!','ui.24',J*0.5,K*0.5,ui.col.White,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end end;function D:PerformLayout(J,K)self.Search:SetPos(5,5)self.Search:SetSize(J-65,25)self.Save:SetPos(J-55,5)self.Save:SetSize(50,25)self.List:SetPos(5,35)self.List:SetSize(J-10,K-40)end;function D:SetCategory(v)self.Log=v;f[v:GetID()]=self;if v:GetColor()&&ba.logs.Data[v:GetName()]&&#ba.logs.Data[v:GetName()]>=ba.logs.MaxEntries then timer.Simple(0,function()if IsValid(self)then for q,F in ipairs(ba.logs.Data[v:GetName()])do self:AddLog(F.Term,F.Time,F.Data,F.Copy)end;self.IsLoaded=true end end)return end;timer.Simple(0.1,function()net.Start'ba.logs.RequestCategory'net.WriteUInt(v:GetID(),5)net.SendToServer()end)end;function D:AddLog(k,l,u,r)local y='['..l..']  '..u;local L=self.List:AddRow(y)L:SetTooltip(y)L:SetContentAlignment(4)L:SetTextInset(5,0)L:SetWrap(true)local J,K=L:GetContentSize()if K>ui.ButtonHeight then L:SetTextInset(5,1)L:SetTall(K+6)end;L.Data={Term=k,Time=l,Data=u,Copy=r}L.DoClick=function()local M=ui.DermaMenu()M:AddOption('Copy Line',function()SetClipboardText(y)LocalPlayer():ChatPrint('Copied Line')end)for q,F in SortedPairs(r||{})do M:AddOption('Copy '..q,function()SetClipboardText(F)LocalPlayer():ChatPrint('Copied '..q)end)end;M:Open()end end;function D:LiveUpdate(u)local N,O='['..u.Time..'] '..u.Data,u;for q,F in ipairs(self.List.Rows)do if!IsValid(F)then continue end;if q>=ba.logs.MaxEntries then F:Remove()else local P,Q=F:GetText(),F.Data;F:SetText(N)F:SetTooltip(N)F.Data=O;N,O=P,Q end end;if#self.List.Rows<ba.logs.MaxEntries then self:AddLog(O.Term,O.Time,O.Data,O.Copy)end;self.List:Search(self.Search:GetValue())end;function D:PaintOver(J,K)if!self.IsLoaded then surface.SetDrawColor(0,0,0,200)surface.DrawRect(0,0,J,K)local R=SysTime()*5;draw.NoTexture()surface.SetDrawColor(255,255,255)surface.DrawArc(J*0.5,K*0.5,20,25,R*80,R*80+180,20)end end;vgui.Register('ba_logs_data_panel',D,'Panel')local D={}function D:Init()self.PlayerRequest=ui.Create('ui_playerrequest',self)self.PlayerRequest:ShowAllPlayers(true)self.PlayerRequest.OnSelection=function(E,S,z)self:Search(z:SteamID())end;self.ViewMode=ui.Create('ui_button',self)self.ViewMode:SetText('<<')self.ViewMode:Hide()self.ViewMode.DoClick=function()self:ToggleViewMode(false)end;self.Data=ui.Create('ba_logs_data_panel',self)self.Data:Hide()C=self.Data end;function D:Search(T)net.Start'ba.logs.RequestPlayerEvents'net.WriteString(T)net.SendToServer()self:ToggleViewMode(true)end;function D:ToggleViewMode(U)self.IsViewMode=U;self.Data.List.Rows={}self.Data.List.SearchResults={}self.Data.List:Reset()if U then self.PlayerRequest:Hide()self.ViewMode:Show()self.Data:Show()self.Data.IsLoaded=false else self.PlayerRequest:Show()self.ViewMode:Hide()self.Data:Hide()self.Data.IsLoaded=true end;self:PerformLayout(self:GetWide(),self:GetTall())end;function D:PerformLayout(J,K)self.PlayerRequest:SetPos(5,5)self.PlayerRequest:SetSize(J-10,K-10)self.ViewMode:SetPos(5,5)self.ViewMode:SetSize(30,K-10)self.Data:SetPos(35,0)self.Data:SetSize(J-35,K)end;vgui.Register('ba_logs_playerevents_panel',D,'Panel')local D={}function D:Init()self.Saves=ui.Create('ui_listview',self)self.Saves.PaintOver=function(E,J,K)if#E.Rows==0 then draw.RoundedBox(5,0,0,J,K,ui.col.Background)draw.SimpleText('No saved logs!','ui.24',J*0.5,K*0.5,ui.col.White,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end;self.ViewMode=ui.Create('ui_button',self)self.ViewMode:SetText('<<')self.ViewMode:Hide()self.ViewMode.DoClick=function()self:ToggleViewMode(false)end;self.Data=ui.Create('ba_logs_data_panel',self)self.Data:Hide()for q,F in ipairs(ba.logs.GetSaves())do local L=self.Saves:AddRow(F.Date..F.Name)L:SetContentAlignment(4)L:SetTextInset(5,0)L.DoClick=function()local M=ui.DermaMenu(L)M:AddOption('Open',function()self:ToggleViewMode(true)self.Data.List:Reset()for q,F in ipairs(ba.logs.OpenSave(F.Name))do self.Data:AddLog(F.Term,F.Time,F.Data,F.Copy)end end)M:AddOption('Delete',function()ui.BoolRequest('Delete log','Are you sure you want to delete: '..F.Name,function(I)if I then L:Remove()ba.logs.DeleteSave(F.Name)end end)end)M:Open()end end end;function D:ToggleViewMode(U)self.IsViewMode=U;self.Data.List.Rows={}self.Data.List.SearchResults={}self.Data.List:Reset()if U then self.Saves:Hide()self.ViewMode:Show()self.Data:Show()self.Data.IsLoaded=true else self.Saves:Show()self.ViewMode:Hide()self.Data:Hide()self.Data.IsLoaded=false end;self:PerformLayout(self:GetWide(),self:GetTall())end;function D:PerformLayout(J,K)self.Saves:SetPos(5,5)self.Saves:SetSize(J-10,K-10)self.ViewMode:SetPos(5,5)self.ViewMode:SetSize(30,K-10)self.Data:SetPos(35,0)self.Data:SetSize(J-35,K)end;vgui.Register('ba_logs_saves_panel',D,'Panel')local D={}function D:Init()self.LiveMode=ui.Create('ui_checkbox',self)self.LiveMode:SetText('Live Updates')self.LiveMode.OnChange=function(E,V)net.Start'ba.logs.UpdateSubscription'net.WriteBit(V)net.SendToServer()end;self.UnlockKeyboard=ui.Create('ui_checkbox',self)self.UnlockKeyboard:SetText('Unlock Keyboard')self.UnlockKeyboard.OnChange=function(E,V)self:SetKeyboardInputEnabled(!V)end;self.Tabs=ui.Create('ui_tablist',self)self.Tabs:AddTab('Saves',function()return ui.Create'ba_logs_saves_panel'end,true)self.Tabs:AddTab('Player Events',function()return ui.Create'ba_logs_playerevents_panel'end)for q,F in SortedPairsByMemberValue(ba.logs.Stored,'Name')do if F:ShouldShow()then self.Tabs:AddTab(F:GetName(),function()local W=ui.Create'ba_logs_data_panel'W:SetCategory(F)return W end)end end;self.ResizeGrip=vgui.Create('Panel',self)self.ResizeGrip:SetCursor('sizenwse')self.ResizeGrip.OnMousePressed=function(E,X)if X==MOUSE_LEFT then self.Resizing=true end end;self:SetTitle("Logging Suite")self:SetSize(ScrW()*0.75,ScrH()*0.75)self:Center()self:MakePopup()end;function D:SetPlayerEventMode(T)self.Tabs:SetActiveTab(2)C:GetParent():Search(T)end;function D:SelectLogByName(Y)if!Y then return end;Y=Y:lower()for Z,_ in pairs(self.Tabs.Buttons)do if _:GetText():lower()==Y then self.Tabs:SetActiveTab(_.ID)end end end;function D:OnClose()net.Start'ba.logs.UpdateSubscription'net.WriteBit(false)net.SendToServer()end;function D:PerformLayout(J,K)self.BaseClass.PerformLayout(self,J,K)self.UnlockKeyboard:SizeToContents()self.UnlockKeyboard:SetPos(J-5-self.btnClose:GetWide()-self.UnlockKeyboard:GetWide(),5)self.LiveMode:SizeToContents()self.LiveMode:SetPos(self.UnlockKeyboard.x-self.LiveMode:GetWide()-5,5)self.ResizeGrip:SetSize(10,10)self.ResizeGrip:SetPos(J-10,K-10)self.Tabs:DockToFrame()end;function D:Think()self.BaseClass.Think(self)if self.Resizing then if!input.IsMouseDown(MOUSE_LEFT)then self.Resizing=false;return end;local J=math.Clamp(gui.MouseX()-self.x,500,ScrW()-23)local K=math.Clamp(gui.MouseY()-self.y,180,ScrH()-23)if J!=self:GetWide()||K!=self:GetTall()then self:SetSize(J,K)self:InvalidateLayout(true)end end end;vgui.Register('ba_logs_menu',D,'ui_frame')
--addons/!lpakr_out/lua/badmin/modules/ssrp/_module.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/plugins/movement_sh.lua:
term.Add('AdminGoneTo','# has gone to #.')term.Add('AdminRoomUnset','The adminroom is not set!')term.Add('AdminGoneToAdminRoom','# has gone to the admin room.')term.Add('AdminRoomSet','The adminroom has been set to your current position.')term.Add('AdminReturnedSelf','# has returned themself to spawn.')ba.AddCommand('Tele',function(a,b)for c,d in ipairs(b)do if!d:Alive()then d:Spawn()end;if d:InVehicle()then d:ExitVehicle()end;d:SetBVar('ReturnPos',d:GetPos())hook.Run('PreMovementAffectingAction',d)d:SetPos(util.FindEmptyPos(a:GetEyeTrace().HitPos))end;hook.Run("PlayerTeleportedOthers",a,b)ba.notify_staff('# has teleported '..('# '):rep(#b)..'.',a,unpack(b))end):AddParam(cmd.PLAYER_ENTITY_MULTI):SetFlag'M':SetHelp'Teleports your target/s where you are looking':AddAlias'tp'ba.AddCommand('Goto',function(a,e)if!a:Alive()then a:Spawn()end;if a:InVehicle()then a:ExitVehicle()end;a:SetBVar('ReturnPos',a:GetPos())local f=util.FindEmptyPos(e:GetPos())hook.Run('PreMovementAffectingAction',a)a:SetPos(f)ba.notify_staff(term.Get('AdminGoneTo'),a,e)end):AddParam(cmd.PLAYER_ENTITY):SetFlag'M':SetHelp'Brings you to your target'ba.AddCommand('Sit',function(a)if!ba.svar.Get('adminroom')then ba.notify_err(a,term.Get('AdminRoomUnset'))return end;if!a:Alive()then a:Spawn()end;if a:InVehicle()then a:ExitVehicle()end;a:SetBVar('ReturnPos',a:GetPos())local f=util.FindEmptyPos(ba.adminRoom)hook.Run('PreMovementAffectingAction',a)a:SetPos(f)ba.notify_staff(term.Get('AdminGoneToAdminRoom'),a)end):SetFlag'M':SetHelp'Takes you to the admin room if one exists'ba.AddCommand('SetAdminRoom',function(a)ba.svar.Set('adminroom',pon.encode({a:GetPos()}))ba.notify(a,term.Get('AdminRoomSet'))end):SetFlag'*':SetHelp'Sets the adminroom to your current position'ba.AddCommand('return',function(a,b)if b==nil then if!a:Alive()then a:Spawn()end;if a:InVehicle()then a:ExitVehicle()end;local g,f=hook.Run('PlayerSelectSpawn',a)hook.Run('PreMovementAffectingAction',a)a:SetPos(f)return ba.NOTIFY_STAFF,term.Get('AdminReturnedSelf'),a end;for c,d in ipairs(b)do if!d:Alive()then d:Spawn()end;if d:InVehicle()then d:ExitVehicle()end;local g,f=hook.Run('PlayerSelectSpawn',d)hook.Run('PreMovementAffectingAction',d)d:SetPos(f)end;ba.notify_staff('# has returned '..('# '):rep(#b)..'to spawn.',a,unpack(b))end):AddParam(cmd.PLAYER_ENTITY_MULTI,cmd.OPT_OPTIONAL):SetFlag'M':SetHelp'Returns you or your tragets to spawn'term.Add('AdminFrozePlayer','# has froze #.')term.Add('AdminUnfrozePlayer','# has unfroze #.')term.Add('PlayerIsFrozen','# is already frozen!')term.Add('PlayerIsNotFrozen','# is not frozen!')ba.AddCommand('Freeze',function(a,h)h:AdminFreeze(a)end):AddParam(cmd.PLAYER_ENTITY):SetFlag'M':SetHelp'Freezes your target':AddAlias'fz'ba.AddCommand('UnFreeze',function(a,h)h:AdminUnFreeze(a)end):AddParam(cmd.PLAYER_ENTITY):SetFlag'M':SetHelp'Unfreezes your target':AddAlias'unfz'hook.Add('PlayerNoClip','ba.PlayerNoClip',function(a,i)if SERVER&&a:HasAccess('a')then local j=ba.canAdmin(a)&&a:GetBVar('CanNoclip')!=false||false;if i&&j then hook.Run('PlayerEnterNoclip',a)end;return j elseif CLIENT then return false end end)
--addons/!lpakr_out/lua/drgbase/entity_helpers.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/nextbots.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/particles.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/meta/entity.lua:
local a=FindMetaTable("Entity")function a:DrG_IsSanic()return self:IsNextBot()&&self.OnReloaded!=nil&&self.GetNearestTarget!=nil&&self.AttackNearbyTargets!=nil&&self.IsHidingSpotFull!=nil&&self.GetNearestUsableHidingSpot!=nil&&self.ClaimHidingSpot!=nil&&self.AttemptJumpAtTarget!=nil&&self.LastPathingInfraction!=nil&&self.RecomputeTargetPath!=nil&&self.UnstickFromCeiling!=nil end;local b={["prop_door_rotating"]=true,["func_door"]=true,["func_door_rotating"]=true}function a:DrG_IsDoor()return b[self:GetClass()]||false end;function a:DrG_AddListener(c,d)if!isfunction(d)then return false end;local e=self[c]if!isfunction(e)then return false end;self[c]=function(...)local f=d(...)if f!=nil then return f else return e(...)end end;return true end;function a:DrG_SearchBone(g)local h=self:LookupBone(g)if h then return h end;for i=0,self:GetBoneCount()-1 do local j=self:GetBoneName(i)if!j then return end;if j=="__INVALIDBONE__"then continue end;if string.find(string.lower(j),string.lower(g))then return i end end end;function a:DrG_TraceLine(k,l)if!isvector(k)then k=Vector(0,0,0)end;local m={}l=l||{}local n=self:OBBCenter()m.start=l.start||self:GetPos()+n;m.endpos=l.endpos||m.start+k;m.collisiongroup=l.collisiongroup||self:GetCollisionGroup()if self.IsDrGNextbot then m.filter=l.filter||{self,self:GetWeapon(),self:GetPossessor()}else m.filter=l.filter||self end;return util.DrG_TraceLine(m)end;function a:DrG_TraceHull(k,l)if!isvector(k)then k=Vector(0,0,0)end;local o,p=self:GetCollisionBounds()local q=self:GetModelScale()if q>1 then o=o*(1+0.01*q)p=p*(1+0.01*q)end;if o.z<p.z then local r=o;o=p;p=r end;local m={}l=l||{}if self.IsDrGNextbot&&l.step then p.z=self.loco:GetStepHeight()end;m.start=l.start||self:GetPos()m.endpos=l.endpos||m.start+k;m.collisiongroup=l.collisiongroup||self:GetCollisionGroup()if self.IsDrGNextbot then m.filter=l.filter||{self,self:GetWeapon(),self:GetPossessor()}else m.filter=l.filter||self end;m.maxs=l.maxs||o;m.mins=l.mins||p;return util.DrG_TraceHull(m)end;function a:DrG_TraceLineRadial(s,t,l)local u={}for v=1,t do local w=self:GetForward()*s;w:Rotate(Angle(0,v*360/t,0))table.insert(u,self:TraceLine(w,l))end;table.sort(u,function(x,y)return self:GetRangeSquaredTo(x.HitPos)<self:GetRangeSquaredTo(y.HitPos)end)return u end;function a:DrG_TraceHullRadial(s,t,l)local u={}for v=1,t do local w=self:GetForward()*s;w:Rotate(Angle(0,v*360/t,0))table.insert(u,self:TraceHull(w,l))end;table.sort(u,function(x,y)return self:GetRangeSquaredTo(x.HitPos)<self:GetRangeSquaredTo(y.HitPos)end)return u end;function a:DrG_Timer(z,d,...)timer.DrG_Simple(z,function(...)if IsValid(self)then d(self,...)end end,...)end;function a:DrG_LoopTimer(A,d,...)timer.DrG_Loop(A,function(...)if!IsValid(self)then return false end;return d(self,...)end,...)end;if SERVER then else function a:DrG_DynamicLight(B,C,D,E,F)if B==nil then B=Color(255,255,255)end;if!isnumber(C)then C=1000 end;C=math.Clamp(C,0,math.huge)if!isnumber(D)then D=1 end;D=math.Clamp(D,0,math.huge)local G=DynamicLight(self:EntIndex())G.r=B.r;G.g=B.g;G.b=B.b;G.size=C;G.brightness=D;G.style=E;G.dieTime=CurTime()+1;G.decay=100000;if F then if isstring(F)then F=self:LookupAttachment(F)end;if isnumber(F)&&F>0 then G.pos=self:GetAttachment(F).Pos else G.pos=self:GetPos()end else G.pos=self:GetPos()end;return G end end
--addons/!lpakr_out/lua/drgbase/meta/npc.lua:
local a=FindMetaTable("NPC")
--addons/!lpakr_out/lua/drgbase/meta/player.lua:
local a=FindMetaTable("Player")function a:DrG_IsPossessing()return IsValid(self:DrG_Possessing())end;function a:DrG_Possessing()return self:GetNW2Entity("DrGBasePossessing")end;function a:DrG_GetPossessing()return self:DrG_Possessing()end;hook.Add("PlayerButtonDown","DrGBasePlayerButtonDown",function(b,c)b._DrGBaseButtonsDown=b._DrGBaseButtonsDown||{}b._DrGBaseButtonsDown[c]={down=true,time=CurTime()}timer.Simple(0,function()if!IsValid(b)then return end;b._DrGBaseButtonsDown[c].time=CurTime()end)end)hook.Add("PlayerButtonUp","DrGBasePlayerButtonUp",function(b,c)b._DrGBaseButtonsDown=b._DrGBaseButtonsDown||{}b._DrGBaseButtonsDown[c]={down=false,time=CurTime()}timer.Simple(0,function()if!IsValid(b)then return end;b._DrGBaseButtonsDown[c].time=CurTime()end)end)function a:DrG_ButtonUp(c)self._DrGBaseButtonsDown=self._DrGBaseButtonsDown||{}local d=self._DrGBaseButtonsDown[c]if d==nil then return true end;return!d.down end;function a:DrG_ButtonPressed(c)self._DrGBaseButtonsDown=self._DrGBaseButtonsDown||{}local d=self._DrGBaseButtonsDown[c]if d==nil then return false end;return d.down&&d.time==CurTime()end;function a:DrG_ButtonDown(c)self._DrGBaseButtonsDown=self._DrGBaseButtonsDown||{}local d=self._DrGBaseButtonsDown[c]if d==nil then return false end;return d.down||false end;function a:DrG_ButtonReleased(c)self._DrGBaseButtonsDown=self._DrGBaseButtonsDown||{}local d=self._DrGBaseButtonsDown[c]if d==nil then return false end;return!d.down&&d.time==CurTime()end;function a:DrG_GetSelectionTable(e)self._DrGBaseSelectionTables=self._DrGBaseSelectionTables||{}if isstring(e)then self._DrGBaseSelectionTables[e]=self._DrGBaseSelectionTables[e]||{}return self._DrGBaseSelectionTables[e]else local f=self:GetTool()if f==nil then return{}else return self:DrG_GetSelectionTable(f.Mode)end end end;local function g(b,h,e)local i=next(b:DrG_GetSelectionTable(e),h)if i==nil then return nil elseif!IsValid(i)then return g(b,i,e)else return i end end;function a:DrG_SelectedEntities(e)return function(j,h)return g(self,h,e)end end;function a:DrG_GetSelectedEntities(e)local k={}for i in self:DrG_SelectedEntities(e)do table.insert(k,i)end;return k end;function a:DrG_IsEntitySelected(i,e)return self:DrG_GetSelectionTable(e)[i]||false end;if SERVER then else net.Receive("DrGBaseSelectEntity",function()local b=LocalPlayer()local i=net.ReadEntity()local e=net.ReadBool()&&net.ReadString()if IsValid(i)then b:DrG_GetSelectionTable(e)[i]=true end end)net.Receive("DrGBaseDeselectEntity",function()local b=LocalPlayer()local i=net.ReadEntity()local e=net.ReadBool()&&net.ReadString()if IsValid(i)then b:DrG_GetSelectionTable(e)[i]=nil end end)function a:DrG_Luminosity()local b=LocalPlayer()return math.min(render.GetLightColor(b:EyePos()):Length()*1/0.7,1)end end
--addons/!lpakr_out/lua/drgbase/modules/coroutine.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/modules/navmesh.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/dronesrewrite.lua:
include("dronesrewrite/main.lua")
--addons/!lpakr_out/lua/dronesrewrite/client/hud.lua:
local a=CreateMaterial('turret_camscan4',"UnlitGeneric",{["$basetexture"]='dev/dev_scanline',["$translucent"]=1,["$additive"]=1,["$vertexcolor"]="1",["$vertexalpha"]="1",["Proxies"]={["TextureScroll"]={["texturescrollvar"]="$baseTextureTransform",["texturescrollrate"]=.1,["texturescrollangle"]=-90}}})a:Recompute()hook.Add("HUDPaint","dronesrewrite_hud",function()local b=LocalPlayer()local c=IsValid(b)&&b:GetNWEntity("DronesRewriteDrone")if IsValid(c)then if c.HUD_shouldDrawHud then surface.SetDrawColor(150,255,255,10)surface.SetMaterial(a)surface.DrawTexturedRect(0,0,ScrW(),ScrH())surface.SetDrawColor(255,255,255,255)local d,e=ScrW(),ScrH()local f=(c:GetForward()*10+c:LocalToWorld(c.FirstPersonCam_pos)):ToScreen()d,e=d/2,e/2;surface.DrawRect(d-100,e-70,50,2)surface.DrawRect(d-100,e-70,2,50)surface.DrawRect(d+50,e-70,50,2)surface.DrawRect(d+100,e-70,2,50)surface.DrawRect(d-100,e+70,50,2)surface.DrawRect(d-100,e+20,2,50)surface.DrawRect(d+50,e+70,52,2)surface.DrawRect(d+100,e+20,2,50)srp.weapons.DrawCrosshair(f.x,f.y,255)end;c:CallHook("HUD")end end)
--addons/!lpakr_out/lua/dronesrewrite/client/overlay/blackandwhite.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/client/overlay/rainbow.lua:
return lpakr()()
--addons/ssrp_lfs/lua/lvs_framework/autorun/cl_circles.lua:
--[[
by SneakySquid, it's the best thing ever. 10000 times better than draw.Arc
see https://github.com/SneakySquid/Circles
]]

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

		circle:SetVertices({Count = 0})

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

		for i = 1, vertices.Count or #vertices do
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

		local vertices = {Count = 0}
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
				vertex.u = 0.5 + math.cos(a) / 2
				vertex.v = 0.5 + math.sin(a) / 2
			else
				vertex.u = 0.5 + c / 2
				vertex.v = 0.5 + s / 2
			end

			vertices.Count = vertices.Count + 1
			vertices[vertices.Count] = vertex
		end

		if end_angle - start_angle ~= 360 then
			table.insert(vertices, 1, {
				x = x, y = y,
				u = 0.5, v = 0.5,
			})

			vertices.Count = vertices.Count + 1
		else
			table.remove(vertices)
			vertices.Count = vertices.Count - 1
		end

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
		self.m_Vertices.Count >= 3 and
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

		if inner_r >= radius then
			self:SetShouldRender(false)
		else
			if inner_r >= 1 then
				inner:SetType(CIRCLE_FILLED)

				inner:SetRadius(inner_r)
				inner:SetAngles(start_angle, end_angle)

				inner:SetColor(false)
				inner:SetMaterial(false)

				inner:SetShouldRender(true)
			else
				inner:SetShouldRender(false)
			end

			self:SetShouldRender(true)
		end

		self:SetChildCircle(inner)
	elseif self.m_ChildCircle then
		self.m_ChildCircle = nil
	end

	self:SetDirty(false)
end

do
	local blur = Material("pp/blurscreen")

	function CIRCLE:__call()
		if self.m_Dirty then
			self:Calculate()
		end

		if not self.m_ShouldRender or not self:IsValid() then
			return false
		end

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
end

do
	local err_number = "bad argument #%i to 'Translate' (number expected, got %s)"

	function CIRCLE:Translate(x, y)
		assert(isnumber(x), string.format(err_number, 1, type(x)))
		assert(isnumber(y), string.format(err_number, 2, type(y)))
		if x == 0 and y == 0 then return end

		self.m_X = self.m_X + x
		self.m_Y = self.m_Y + y

		if not self:IsValid() then return end

		for i = 1, self.m_Vertices.Count do
			local vertex = self.m_Vertices[i]

			vertex.x = vertex.x + x
			vertex.y = vertex.y + y
		end

		if self.m_Type == CIRCLE_OUTLINED and self.m_ChildCircle then
			self.m_ChildCircle:Translate(x, y)
		end
	end
end

do
	local err_number = "bad argument #1 to 'Scale' (number expected, got %s)"

	function CIRCLE:Scale(scale)
		assert(isnumber(scale), string.format(err_number, type(scale)))
		if scale == 1 then return end

		self.m_Radius = self.m_Radius * scale

		if not self:IsValid() then return end

		local x, y = self.m_X, self.m_Y

		for i = 1, self.m_Vertices.Count do
			local vertex = self.m_Vertices[i]

			vertex.x = x + (vertex.x - x) * scale
			vertex.y = y + (vertex.y - y) * scale
		end

		if self.m_Type == CIRCLE_OUTLINED and self.m_ChildCircle then
			self.m_ChildCircle:Scale(scale)
		end
	end
end

do
	local err_number = "bad argument #1 to 'Rotate' (number expected, got %s)"

	function CIRCLE:Rotate(rotation)
		assert(isnumber(rotation), string.format(err_number, type(rotation)))
		if rotation == 0 then return end

		self.m_Rotation = self.m_Rotation + rotation

		if not self:IsValid() then return end

		local x, y = self.m_X, self.m_Y
		local vertices = self.m_Vertices
		local rotate_uv = self.m_RotateMaterial

		RotateVertices(vertices, x, y, rotation, rotate_uv)

		if self.m_Type == CIRCLE_OUTLINED and self.m_ChildCircle then
			self.m_ChildCircle:Rotate(rotation)
		end
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

				if isfunction(callback) then
					local new = callback(self, self[varname], value)
					value = new ~= nil and new or value
				end

				self[varname] = value
			end
		end

		CIRCLE[varname] = default
	end

	local function OffsetVerticesX(circle, old, new)
		if not circle:IsValid() then return end

		circle:Translate(new - old, 0)

		if circle.m_Type == CIRCLE_OUTLINED and circle.m_ChildCircle then
			OffsetVerticesX(circle.m_ChildCircle, old, new)
		end

		return new
	end

	local function OffsetVerticesY(circle, old, new)
		if not circle:IsValid() then return end

		circle:Translate(0, new - old)

		if circle.m_Type == CIRCLE_OUTLINED and circle.m_ChildCircle then
			OffsetVerticesY(circle.m_ChildCircle, old, new)
		end

		return new
	end

	local function UpdateRotation(circle, old, new)
		if not circle:IsValid() then return end

		local vertices = circle.m_Vertices
		local x, y = circle.m_X, circle.m_Y
		local rotation = new - old
		local rotate_uv = circle.m_RotateMaterial

		RotateVertices(vertices, x, y, rotation, rotate_uv)

		if circle.m_Type == CIRCLE_OUTLINED and circle.m_ChildCircle then
			UpdateRotation(circle.m_ChildCircle, old, new)
		end

		return new
	end

	-- These are set internally. Only use them if you know what you're doing.
	AccessorFunc("Dirty", true)
	AccessorFunc("Vertices", false)
	AccessorFunc("ChildCircle", false)
	AccessorFunc("ShouldRender", true)

	AccessorFunc("Color", false)				-- The colour you want the circle to be. If set to false then surface.SetDrawColor's can be used.
	AccessorFunc("Material", false)				-- The material you want the circle to render. If set to false then surface.SetMaterial can be used.
	AccessorFunc("RotateMaterial", true)			-- Sets whether or not the circle's UV points should be rotated with the vertices.

	AccessorFunc("Type", CIRCLE_FILLED, "m_Dirty")		-- The circle's type.
	AccessorFunc("X", 0, false, OffsetVerticesX)		-- The circle's X position relative to the top left of the screen.
	AccessorFunc("Y", 0, false, OffsetVerticesY)		-- The circle's Y position relative to the top left of the screen.
	AccessorFunc("Radius", 8, "m_Dirty")			-- The circle's radius.
	AccessorFunc("Rotation", 0, false, UpdateRotation)	-- The circle's rotation, measured in degrees.
	AccessorFunc("StartAngle", 0, "m_Dirty")		-- The circle's start angle, measured in degrees.
	AccessorFunc("EndAngle", 360, "m_Dirty")		-- The circle's end angle, measured in degrees.
	AccessorFunc("Distance", 10, "m_Dirty")			-- The maximum distance between each of the circle's vertices. Set to false to use segments instead. This should typically be used for large circles in 3D2D.

	AccessorFunc("BlurLayers", 3)				-- The circle's blur layers if Type is set to CIRCLE_BLURRED.
	AccessorFunc("BlurDensity", 2)				-- The circle's blur density if Type is set to CIRCLE_BLURRED.
	AccessorFunc("OutlineWidth", 10, "m_Dirty")		-- The circle's outline width if Type is set to CIRCLE_OUTLINED.

	function CIRCLE:SetPos(x, y)
		x = tonumber(x) or 0
		y = tonumber(y) or 0

		self:Translate(x - self.m_X, y - self.m_Y)
	end

	function CIRCLE:SetAngles(s, e)
		s = tonumber(s) or self.m_StartAngle
		e = tonumber(e) or self.m_EndAngle

		self:SetDirty(self.m_Dirty or s ~= self.m_StartAngle or e ~= self.m_EndAngle)

		self.m_StartAngle = s
		self.m_EndAngle = e
	end

	function CIRCLE:GetPos()
		return self.m_X, self.m_Y
	end

	function CIRCLE:GetAngles()
		return self.m_StartAngle, self.m_EndAngle
	end
end

_R.Circles = {
	_MT = CIRCLE,

	New = New,
	RotateVertices = RotateVertices,
	CalculateVertices = CalculateVertices,
}

return _R.Circles

--addons/ssrp_lfs/lua/lvs_framework/autorun/lvs_damagenotify.lua:

if CLIENT then 
	net.Receive( "lvs_hurtmarker", function( len )
		if not LVS.ShowHitMarker then return end

		local ply = LocalPlayer()

		local vehicle = ply:lvsGetVehicle()

		if not IsValid( vehicle ) then return end

		vehicle:HurtMarker( net.ReadFloat() )
	end )

	net.Receive( "lvs_hitmarker", function( len )
		if not LVS.ShowHitMarker then return end

		local ply = LocalPlayer()

		local vehicle = ply:lvsGetVehicle()
		if not IsValid( vehicle ) then return end

		if net.ReadBool() then
			vehicle:CritMarker()
		else
			vehicle:HitMarker()
		end
	end )

	net.Receive( "lvs_killmarker", function( len )
		if not LVS.ShowHitMarker then return end

		local ply = LocalPlayer()

		local vehicle = ply:lvsGetVehicle()

		if not IsValid( vehicle ) then return end

		vehicle:KillMarker()
	end )

	return
end

util.AddNetworkString( "lvs_hitmarker" )
util.AddNetworkString( "lvs_hurtmarker" )
util.AddNetworkString( "lvs_killmarker" )
--addons/ssrp_lfs/lua/lvs_framework/autorun/sh_starwars_keybinding.lua:

hook.Add( "LVS:Initialize", "[LVS] - Star Wars - Keys", function()
	local KEYS = {
		{
			name = "+THRUST_SF",
			category = "LVS-Starfighter",
			name_menu = "Thrust Increase",
			default = "+forward",
			cmd = "lvs_starfighter_throttle_up"
		},
		{
			name = "-THRUST_SF",
			category = "LVS-Starfighter",
			name_menu = "Thrust Decrease",
			default = "+back",
			cmd = "lvs_starfighter_throttle_down"
		},
		{
			name = "+PITCH_SF",
			category = "LVS-Starfighter",
			name_menu = "Pitch Up",
			cmd = "lvs_starfighter_pitch_up"
		},
		{
			name = "-PITCH_SF",
			category = "LVS-Starfighter",
			name_menu = "Pitch Down",
			cmd = "lvs_starfighter_pitch_down"
		},
		{
			name = "-YAW_SF",
			category = "LVS-Starfighter",
			name_menu = "Yaw Left [Roll in Direct Input]",
			cmd = "lvs_starfighter_yaw_left"
		},
		{
			name = "+YAW_SF",
			category = "LVS-Starfighter",
			name_menu = "Yaw Right [Roll in Direct Input]",
			cmd = "lvs_starfighter_yaw_right"
		},
		{
			name = "-ROLL_SF",
			category = "LVS-Starfighter",
			name_menu = "Roll Left [Yaw in Direct Input]",
			default = "+moveleft",
			cmd = "lvs_starfighter_roll_left"
		},
		{
			name = "+ROLL_SF",
			category = "LVS-Starfighter",
			name_menu = "Roll Right [Yaw in Direct Input]",
			default = "+moveright",
			cmd = "lvs_starfighter_roll_right"
		},
		{
			name = "+VTOL_Z_SF",
			category = "LVS-Starfighter",
			name_menu = "VTOL Up",
			cmd = "lvs_starfighter_vtol_up"
		},
		{
			name = "-VTOL_Z_SF",
			category = "LVS-Starfighter",
			name_menu = "VTOL Down",
			cmd = "lvs_starfighter_vtol_dn"
		},
		{
			name = "-VTOL_Y_SF",
			category = "LVS-Starfighter",
			name_menu = "VTOL Right",
			cmd = "lvs_starfighter_vtol_right"
		},
		{
			name = "+VTOL_Y_SF",
			category = "LVS-Starfighter",
			name_menu = "VTOL Left",
			cmd = "lvs_starfighter_vtol_left"
		},
		{
			name = "-VTOL_X_SF",
			category = "LVS-Starfighter",
			name_menu = "VTOL Reverse",
			default = "+back",
			cmd = "lvs_starfighter_vtol_reverse"
		},
	}

	for _, v in pairs( KEYS ) do
		LVS:AddKey( v.name, v.category, v.name_menu, v.cmd, v.default )
	end
end )
--addons/!lpakr_out/lua/pac3/core/shared/movement.lua:
local a=CreateConVar("pac_free_movement",-1,CLIENT&&{FCVAR_REPLICATED}||{FCVAR_ARCHIVE,FCVAR_REPLICATED},"allow players to modify movement. -1 apply only allow when noclip is allowed, 1 allow for all gamemodes, 0 to disable")local b={JumpHeight=200,StickToGround=true,GroundFriction=0.12,AirFriction=0.01,Gravity=Vector(0,0,-600),Noclip=false,MaxGroundSpeed=750,MaxAirSpeed=1,AllowZVelocity=false,ReversePitch=false,UnlockPitch=false,VelocityToViewAngles=0,RollAmount=0,SprintSpeed=750,RunSpeed=300,WalkSpeed=100,DuckSpeed=25,FinEfficiency=0,FinLiftMode="normal",FinCline=false}if CLIENT then local c=GetConVar("sensitivity")pac.AddHook("InputMouseApply","custom_movement",function(d,e,f,g)local h=pac.LocalPlayer;local self=h.pac_movement;if!self then return end;if h:GetMoveType()==MOVETYPE_NOCLIP then if h.pac_movement_viewang then g.r=0;d:SetViewAngles(g)h.pac_movement_viewang=nil end;return end;if self.UnlockPitch then h.pac_movement_viewang=h.pac_movement_viewang||g;g=h.pac_movement_viewang;local i=c:GetFloat()*20;e=e/i;f=f/i;if g.p>89||g.p<-89 then e=-e end;g.p=math.NormalizeAngle(g.p+f)g.y=math.NormalizeAngle(g.y+-e)end;if self.ReversePitch then g.p=-g.p end;local j=h:GetVelocity()local k=math.Clamp(j:Dot(-g:Right())*self.RollAmount,-89,89)if!j:IsZero()then if j:Dot(g:Forward())<0 then j=-j end;g=LerpAngle(self.VelocityToViewAngles,g,j:Angle())end;g.r=k;d:SetViewAngles(g)if self.UnlockPitch then return true end end)end;local function l(h)local m=h:GetMoveType()return m==MOVETYPE_OBSERVER||m==MOVETYPE_NOCLIP||m==MOVETYPE_LADDER||m==MOVETYPE_CUSTOM||m==MOVETYPE_ISOMETRIC end;local n=GetConVar("sv_friction")pac.AddHook("Move","custom_movement",function(h,o)local self=h.pac_movement;if!self then if!h.pac_custom_movement_reset then if!l(h)then h:SetGravity(1)h:SetMoveType(MOVETYPE_WALK)if h.pac_custom_movement_jump_height then h:SetJumpPower(h.pac_custom_movement_jump_height)h.pac_custom_movement_jump_height=nil end end;h.pac_custom_movement_reset=true end;return end;h.pac_custom_movement_reset=nil;h.pac_custom_movement_jump_height=h.pac_custom_movement_jump_height||h:GetJumpPower()if l(h)then return end;o:SetForwardSpeed(0)o:SetSideSpeed(0)o:SetUpSpeed(0)h:SetJumpPower(self.JumpHeight)if self.Noclip then h:SetMoveType(MOVETYPE_NONE)else h:SetMoveType(MOVETYPE_WALK)end;h:SetGravity(0.00000000000000001)local p=h:IsOnGround()if!self.StickToGround then h:SetGroundEntity(NULL)end;local q=self.RunSpeed;if o:KeyDown(IN_SPEED)then q=self.SprintSpeed end;if o:KeyDown(IN_WALK)then q=self.WalkSpeed end;if o:KeyDown(IN_DUCK)then q=self.DuckSpeed end;local g=o:GetAngles()local j=Vector()if p&&self.StickToGround then g.p=0 end;if o:KeyDown(IN_FORWARD)then j=j+g:Forward()elseif o:KeyDown(IN_BACK)then j=j-g:Forward()end;if o:KeyDown(IN_MOVERIGHT)then j=j+g:Right()elseif o:KeyDown(IN_MOVELEFT)then j=j-g:Right()end;j=j:GetNormalized()*q;if self.AllowZVelocity then if o:KeyDown(IN_JUMP)then j=j+g:Up()*q elseif o:KeyDown(IN_DUCK)then j=j-g:Up()*q end end;if!self.AllowZVelocity then j.z=0 end;local q=j;local j=o:GetVelocity()if p&&!self.Noclip&&self.StickToGround then local r=n:GetInt()if r>0 then r=1-r*15/1000;j=j/r end end;j=j+self.Gravity*0;if!p then local s=self.AirFriction;s=-s+1;j=j*s;j=j+self.Gravity*0.015;q=q:GetNormalized()*math.Clamp(q:Length(),0,self.MaxAirSpeed)j=j+q*FrameTime()*66.666*(-s+1)else local s=self.GroundFriction;s=-s+1;j=j*s;q=q:GetNormalized()*math.min(q:Length(),self.MaxGroundSpeed)j=j+q*FrameTime()*75.77*(-s+1)j=j+self.Gravity*0.015 end;if self.FinEfficiency>0 then local t=j;local u=g:Forward()local v=t;local w=u;v=v-2*v:Dot(w)*w;local x=v:Length()local y=t;local z=math.abs(u:Dot(t:GetNormalized()))local A=u:Dot(t:GetNormalized())if self.pln==1 then if A>0 then v=v+u*10 else v=v+u*-10 end;y=v:GetNormalized()*(math.pow(x,z)-1)y=y:GetNormalized()y=y*self.FinEfficiency+t end;if self.FinLiftMode!="none"then if self.FinLiftMode=="normal"then local B=1-math.abs(A)y=y+u*B*t:Length()*self.FinEfficiency/700 else local B=A/math.abs(A)-A;y=y+u*t:Length()*self.FinEfficiency*B/700 end end;y=y:GetNormalized()y=y*t:Length()if self.FinCline then local C={start=o:GetOrigin(),endpos=o:GetOrigin()+Vector(0,0,-1000000),mask=131083}local D=util.TraceLine(C)local E=D.MatType;if E==67||E==77 then local F=Vector(0,0,100)local G=(2*F:Dot(u)*u-F)*math.abs(F:Dot(u))/1000;y=y+G*self.FinEfficiency/50 end end;j=y end;o:SetVelocity(j)if self.Noclip then o:SetOrigin(o:GetOrigin()+j*0.01)end;return false end)
--addons/!lpakr_out/lua/pac3/libraries/urltex.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/owner_name.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/decal.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/event.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/material.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/init.lua:
include("autorun/pac_core_init.lua")pace=pace||{}pace.luadata=include("pac3/libraries/luadata.lua")include("language.lua")include("icons.lua")include("util.lua")include("wear.lua")include("select.lua")include("view.lua")include("parts.lua")include("saved_parts.lua")include("logic.lua")include("undo.lua")include("fonts.lua")include("settings.lua")include("shortcuts.lua")include("asset_browser.lua")include("menu_bar.lua")include("mctrl.lua")include("panels.lua")include("tools.lua")include("spawnmenu.lua")include("wiki.lua")include("examples.lua")include("about.lua")include("animation_timeline.lua")include("render_scores.lua")include("wires.lua")include("wear_filter.lua")include("show_outfit_on_use.lua")do local a={"red","orange","yellow","green","turquoise","blue","purple","magenta"}local b={"pale","","strong"}local c={"dark","","bright"}function pace.HSVToNames(d,e,f)return a[math.Round(1+d/360*#a)]||a[1],b[math.ceil(e*#b)]||b[1],c[math.ceil(f*#c)]||c[1]end;function pace.ColorToNames(g)if g.r==255&&g.g==255&&g.b==255 then return"white","","bright"end;if g.r==0&&g.g==0&&g.b==0 then return"black","","bright"end;return pace.HSVToNames(ColorToHSV(Color(g.r,g.g,g.b)))end end;function pace.CallHook(h,...)return hook.Call("pace_"..h,GAMEMODE,...)end;pace.ActivePanels=pace.ActivePanels||{}pace.Editor=NULL;local i=CreateConVar("pac_editor_remember_position","1",{FCVAR_ARCHIVE},"Remember PAC3 editor position on screen")local j=CreateConVar("pac_editor_position_mode","0",{FCVAR_ARCHIVE},"Editor position mode. 0 - Left, 1 - middle, 2 - Right. Has no effect if pac_editor_remember_position is true")local k=CreateConVar("pac_show_cameras","1",{FCVAR_ARCHIVE},"Show the PAC cameras of players using the editor")local l=CreateConVar("pac_show_in_editor","1",{FCVAR_ARCHIVE},"Show the 'In PAC3 Editor' text above players using the editor")pace.pac_show_uniqueid=CreateConVar("pac_show_uniqueid","0",{FCVAR_ARCHIVE},"Show uniqueids of parts inside editor")function pace.OpenEditor()pace.CloseEditor()if hook.Run("PrePACEditorOpen",pac.LocalPlayer)==false then return end;pac.Enable()pace.RefreshFiles()pace.SetLanguage()local m=pace.CreatePanel("editor")m:SetSize(240,ScrH())m:MakePopup()m.Close=function()pace.CloseEditor()end;pace.Editor=m;pace.Active=true;if i:GetBool()then local n=cookie.GetNumber("pac_editor_x",0)if n<0||n+240>ScrW()then n=0 end;m:SetPos(n,0)cookie.Set("pac_editor_x",tostring(n))else local o=j:GetInt()if o==1 then m:SetPos(ScrW()/2-120,0)elseif o==2 then m:SetPos(ScrW()-240,0)else m:SetPos(0,0)end end;if ctp&&ctp.Disable then ctp:Disable()end;RunConsoleCommand("pac_enable","1")RunConsoleCommand("pac_in_editor","1")pace.SetInPAC3Editor(true)pace.DisableExternalHooks()vgui.GetWorldPanel():SetWorldClicker(false)pace.Call("OpenEditor")end;function pace.CloseEditor()pace.RestoreExternalHooks()if pace.Editor:IsValid()then local n=pace.Editor:GetPos()cookie.Set("pac_editor_x",tostring(n))pace.Editor:Remove()pace.Active=false;pace.Focused=false;pace.Call("CloseEditor")if pace.timeline.IsActive()then pace.timeline.Close()end end;RunConsoleCommand("pac_in_editor","0")pace.SetInPAC3Editor(false)end;function pace.HasFocus()return pace.Editor:IsValid()&&pace.Editor:HasFocus()end;pac.AddHook("pac_Disable","pac_editor_disable",function()pace.CloseEditor()end)function pace.RefreshFiles()pace.CachedFiles=nil;if pace.Editor:IsValid()then pace.Editor:MakeBar()end;if pace.SpawnlistBrowser:IsValid()then pace.SpawnlistBrowser:PopulateFromClient()end end;function pace.Panic()pace.CloseEditor()for p,q in pairs(pace.ActivePanels)do if q:IsValid()then q:Remove()table.remove(pace.ActivePanels,p)end end;pace.SafeRemoveSpecialPanel()for r,s in ipairs(ents.GetAll())do if s:IsValid()then s.pac_onuse_only=nil;s.pac_onuse_only_check=nil;hook.Remove('pace_OnUseOnlyUpdates',s)end end end;do pace.ExternalHooks={"CalcView","ShouldDrawLocalPlayer"}function pace.DisableExternalHooks()if DLib||ULib then return end;for t,u in pairs(pace.ExternalHooks)do local v=hook.GetTable()[u]if v then pace.OldHooks=pace.OldHooks||{}pace.OldHooks[u]=pace.OldHooks[u]||{}pace.OldHooks[u]=table.Copy(v)for w in pairs(v)do if isstring(w)&&w:sub(1,4)!="pace_"then hook.Remove(u,w)end end end end end;function pace.RestoreExternalHooks()if DLib||ULib then return end;if pace.OldHooks then for u,v in pairs(pace.OldHooks)do for w,x in pairs(v)do if isstring(w)&&w:sub(1,4)!="pace_"then hook.Add(u,w,x)end end end end;pace.OldHooks=nil end end;function pace.IsActive()return pace.Active==true end;concommand.Add("pac_editor_panic",function()pace.Panic()timer.Simple(0.1,function()pace.OpenEditor()end)end)concommand.Add("pac_editor",function(t,t,y)if y[1]=="toggle"then if pace.IsActive()then pace.CloseEditor()else pace.OpenEditor()end else pace.OpenEditor()end end)concommand.Add("pac_reset_eye_angles",function()pace.ResetEyeAngles()end)concommand.Add("pac_toggle_tpose",function()pace.SetTPose(!pace.GetTPose())end)function pace.Call(h,...)if pace["On"..h]then if hook.Run("pace_On"..h,...)!=false then return pace["On"..h](...)end else ErrorNoHalt("missing function pace.On"..h.."!\n")end end;do function pace.SetInPAC3Editor(z)net.Start("pac_in_editor")net.WriteBit(z)net.SendToServer()end;local A=Vector(0,0,10000)hook.Add("HUDPaint","pac_in_editor",function()for t,B in ipairs(player.GetAll())do if B!=pac.LocalPlayer&&B:GetNW2Bool("pac_in_editor")then if k:GetInt()==1 then if B.pac_editor_cam_pos then if!IsValid(B.pac_editor_camera)then B.pac_editor_camera=ClientsideModel("models/tools/camera/camera.mdl")B.pac_editor_camera:SetModelScale(0.25,0)local s=B.pac_editor_camera;B:CallOnRemove("pac_editor_camera",function()SafeRemoveEntity(s)end)end;local s=B.pac_editor_camera;local C=math.Clamp(FrameTime()*5,0.0001,0.5)s:SetPos(LerpVector(C,s:GetPos(),B.pac_editor_cam_pos))s:SetAngles(LerpAngle(C,s:GetAngles(),B.pac_editor_cam_ang))local D=s:GetPos()local E=D:Distance(EyePos())if E>10 then local F=D:ToScreen()if F.visible then local G=math.Clamp(D:Distance(EyePos())*-1+500,0,500)/500;if G>0 then draw.DrawText(B:Nick().."'s PAC3 camera","ChatFont",F.x,F.y,Color(255,255,255,G*255),1)if!B.pac_editor_part_pos:IsZero()then surface.SetDrawColor(255,255,255,G*100)local H=B.pac_editor_part_pos:ToScreen()if H.visible then surface.DrawLine(F.x,F.y,H.x,H.y)end end end end end end else if B.pac_editor_camera then SafeRemoveEntity(B.pac_editor_camera)B.pac_editor_camera=nil end end;if l:GetInt()==1 then local D=B:NearestPoint(B:EyePos()+A)+Vector(0,0,5)local G=math.Clamp(D:Distance(EyePos())*-1+500,0,500)/500;if G>0 then local F=D:ToScreen()draw.DrawText("In PAC3 Editor","ChatFont",F.x,F.y,Color(255,255,255,G*255),1)end end else if B.pac_editor_camera then SafeRemoveEntity(B.pac_editor_camera)B.pac_editor_camera=nil end end end end)do local I,J,K;timer.Create("pac_in_editor",0.25,0,function()if!pace.Active then return end;if!pace.current_part:IsValid()then return end;local L,M=pace.GetViewPos(),pace.GetViewAngles()local N=pace.mctrl.GetWorldPosition()if!N then return end;if I==L&&J==M&&K==N then return end;I,J,K=L,M,N;net.Start("pac_in_editor_posang",true)net.WriteVector(L)net.WriteAngle(M)net.WriteVector(N)net.SendToServer()end)end;net.Receive("pac_in_editor_posang",function()local B=net.ReadEntity()if!IsValid(B)then return end;local L=net.ReadVector()local M=net.ReadAngle()local O=net.ReadVector()B.pac_editor_cam_pos=L;B.pac_editor_cam_ang=M;B.pac_editor_part_pos=O end)end;pace.RegisterPanels()
--addons/!lpakr_out/lua/pac3/editor/client/icons.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/logic.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/logic.lua:
pace.current_part=NULL;pace.properties=NULL;pace.tree=NULL;local a=pace.LanguageString;local b;function pace.PopulateProperties(c)if pace.properties:IsValid()then pace.properties:Populate(c:GetProperties())for d,e in pairs(pace.extra_populates)do e.func(e.pnl)end;pace.extra_populates={}pace.Editor:InvalidateLayout()end end;function pace.OnDraw()if!pace.editing_viewmodel&&!pace.editing_hands then pace.mctrl.HUDPaint()end end;local function f()if b then return end;if pace.editing_viewmodel&&!pace.editing_hands then cam.Start2D()b=true;pace.mctrl.HUDPaint()b=false;cam.End2D()end end;local function g()if b then return end;if!pace.editing_viewmodel&&pace.editing_hands then cam.Start2D()b=true;pace.mctrl.HUDPaint()b=false;cam.End2D()end end;function pace.OnOpenEditor()b=false;pace.SetViewPos(pac.LocalPlayer:EyePos())pace.SetViewAngles(pac.LocalPlayer:EyeAngles())pace.EnableView(true)if table.Count(pac.GetLocalParts())==0 then pace.Call("CreatePart","group",a"my outfit")end;pace.TrySelectPart()pace.ResetView()pac.AddHook("PostDrawPlayerHands","pace_viewmodel_edit",g)pac.AddHook("PostDrawViewModel","pace_viewmodel_edit",f)end;function pace.OnCloseEditor()pace.EnableView(false)pace.StopSelect()pace.SafeRemoveSpecialPanel()pac.RemoveHook("PostDrawViewModel","pace_viewmodel_edit")pac.RemoveHook("PostDrawPlayerHands","pace_viewmodel_edit")end;function pace.TrySelectPart()local c=select(2,next(pac.GetLocalParts()))local h=pac.GetPartFromUniqueID(pac.Hash(pac.LocalPlayer),pace.current_part_uid)if h:IsValid()&&h:GetPlayerOwner()==c:GetPlayerOwner()then c=h end;if c then pace.Call("PartSelected",c)end end
--addons/!lpakr_out/lua/pac3/editor/client/spawnmenu.lua:
local a=pace.LanguageString;concommand.Add("pac_wear_parts",function(b,c,c,file)if file then file=string.Trim(file)if file!=""then pace.LoadParts(string.Trim(string.Replace(file,"\"","")),true)end end;pace.WearParts()end,function(d,e)e=string.Trim(string.Replace(e,"\\","/"))local f=""local g=string.find(e,"/[^/]*$")if g then f=string.sub(e,1,g)end;local h,i=file.Find("pac3/"..e.."*","DATA")if!i then return end;for j,k in ipairs(i)do i[j]=k.."/"end;for j,k in ipairs(table.Add(i,h))do i[j]=d.." "..f..k end;return i end)concommand.Add("pac_clear_parts",function()pace.ClearParts()end)concommand.Add("pac_panic",function()pac.Panic()end)net.Receive("pac_spawn_part",function()if!pace.current_part:IsValid()then return end;local l=net.ReadString()if pace.close_spawn_menu then pace.RecordUndoHistory()pace.Call("VariableChanged",pace.current_part,"Model",l)if g_SpawnMenu:IsVisible()then g_SpawnMenu:Close()end;pace.close_spawn_menu=false elseif pace.current_part.ClassName!="model"then local m=l:match(".+/(.+)%.mdl")pace.RecordUndoHistory()pace.Call("CreatePart","model2",m,l)else pace.RecordUndoHistory()pace.Call("VariableChanged",pace.current_part,"Model",l)end end)pace.SpawnlistBrowser=NULL;function pace.ClientOptionsMenu(self)if!IsValid(self)then return end;self:Button(a"show editor","pac_editor")self:CheckBox(a"enable","pac_enable")self:Button(a"clear","pac_clear_parts")self:Button(a"wear on server","pac_wear_parts")local n=self:AddControl("pace_browser",{})n.OnLoad=function(o)pace.LoadParts(o.FileName,true)end;if#file.Find("pac3/sessions/*","DATA")>0 then n:SetDir("sessions/")else n:SetDir("")end;n:SetSize(400,480)pace.SpawnlistBrowser=n;self:Button(a"request outfits","pac_request_outfits")end;function pace.ClientSettingsMenu(self)if!IsValid(self)then return end;self:Help(a"Performance"):SetFont("DermaDefaultBold")self:CheckBox(a"Enable PAC","pac_enable")self:NumSlider(a"Draw distance:","pac_draw_distance",0,20000,0)self:NumSlider(a"Max render time: ","pac_max_render_time",0,100,0)end;local p="icon64/pac3.png"p=file.Exists("materials/"..p,'GAME')&&p||"icon64/playermodel.png"list.Set("DesktopWindows","PACEditor",{title="PAC Editor",icon=p,width=960,height=700,onewindow=true,init=function(q,r)r:Remove()RunConsoleCommand("pac_editor")end})hook.Add("PopulateToolMenu","pac_spawnmenu",function()spawnmenu.AddToolMenuOption("Utilities","PAC","PAC3",a"PAC3","","",pace.ClientOptionsMenu,{SwitchConVar="pac_enable"})spawnmenu.AddToolMenuOption("Utilities","PAC","PAC3S",a"Settings","","",pace.ClientSettingsMenu,{})end)if IsValid(g_ContextMenu)&&CreateContextMenu then CreateContextMenu()end
--addons/!lpakr_out/lua/wos/anim_extension/extensions/wos_bs.lua:
wOS.AnimExtension.Mounted["Blade Symphony"]=true
--addons/!lpakr_out/lua/wos/anim_extension/extensions/wos_l4d.lua:
wOS.AnimExtension.Mounted["Left 4 Dead"]=true
--addons/!lpakr_out/lua/wos/anim_extension/core/sh_holdtypes.lua:
wOS.AnimExtension.HoldTypes=wOS.AnimExtension.HoldTypes||{}wOS.AnimExtension.TranslateHoldType=wOS.AnimExtension.TranslateHoldType||{}wOS.AnimExtension.ActIndex={["pistol"]=ACT_HL2MP_IDLE_PISTOL,["smg"]=ACT_HL2MP_IDLE_SMG1,["grenade"]=ACT_HL2MP_IDLE_GRENADE,["ar2"]=ACT_HL2MP_IDLE_AR2,["shotgun"]=ACT_HL2MP_IDLE_SHOTGUN,["rpg"]=ACT_HL2MP_IDLE_RPG,["physgun"]=ACT_HL2MP_IDLE_PHYSGUN,["crossbow"]=ACT_HL2MP_IDLE_CROSSBOW,["melee"]=ACT_HL2MP_IDLE_MELEE,["slam"]=ACT_HL2MP_IDLE_SLAM,["normal"]=ACT_HL2MP_IDLE,["fist"]=ACT_HL2MP_IDLE_FIST,["melee2"]=ACT_HL2MP_IDLE_MELEE2,["passive"]=ACT_HL2MP_IDLE_PASSIVE,["knife"]=ACT_HL2MP_IDLE_KNIFE,["duel"]=ACT_HL2MP_IDLE_DUEL,["camera"]=ACT_HL2MP_IDLE_CAMERA,["magic"]=ACT_HL2MP_IDLE_MAGIC,["revolver"]=ACT_HL2MP_IDLE_REVOLVER}function wOS.AnimExtension:RegisterHoldtype(a)self.TranslateHoldType[a.HoldType]=a;self.HoldTypeMeta:CreateMetaType(self.TranslateHoldType[a.HoldType])if a.BaseHoldType then if prone then if prone.animations then if prone.animations.WeaponAnims then prone.animations.WeaponAnims.moving[a.HoldType]=prone.animations.WeaponAnims.moving[a.BaseHoldType]prone.animations.WeaponAnims.idle[a.HoldType]=prone.animations.WeaponAnims.idle[a.BaseHoldType]end end end end;print("[wOS] Registered new Hold Type: "..a.Name)end;local b=FindMetaTable("Player")local c=FindMetaTable("Entity")local d={[ACT_MP_ATTACK_STAND_PRIMARYFIRE]=true,[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]=true,[ACT_MP_ATTACK_STAND_SECONDARYFIRE]=true,[ACT_MP_ATTACK_CROUCH_SECONDARYFIRE]=true}local e=b.TranslateWeaponActivity;function b:TranslateWeaponActivity(f)if d[f]then local g=self:GetActiveWeapon()if IsValid(g)then local h=g:GetHoldType()if wOS.AnimExtension.TranslateHoldType[h]then local i=wOS.AnimExtension.TranslateHoldType[h]:GetActData(f)if i then local j=self:LookupSequence(i.Sequence)self:AddVCDSequenceToGestureSlot(GESTURE_SLOT_VCD,j,0,true)self:AnimSetGestureWeight(GESTURE_SLOT_VCD,i.Weight||1)end end end end;return e(self,f)end;hook.Add("DoAnimationEvent","wOS.AnimExtension.CustomTriggers",function(k,l,a)local g=k:GetActiveWeapon()if!IsValid(g)then return end;local h=g:GetHoldType()if!wOS.AnimExtension.TranslateHoldType[h]then return end;local f=9999;local m=k:Crouching()if l==PLAYERANIMEVENT_RELOAD then f=m&&ACT_MP_RELOAD_CROUCH||ACT_MP_RELOAD_STAND elseif l==PLAYERANIMEVENT_ATTACK_SECONDARY then f=m&&ACT_MP_ATTACK_CROUCH_SECONDARYFIRE||ACT_MP_ATTACK_STAND_SECONDARYFIRE end;local i=wOS.AnimExtension.TranslateHoldType[h]:GetActData(f)if!i then return end;local j=k:LookupSequence(i.Sequence)k:AddVCDSequenceToGestureSlot(GESTURE_SLOT_VCD,j,0,true)k:AnimSetGestureWeight(GESTURE_SLOT_VCD,i.Weight||1)return ACT_INVALID end)hook.Add("Initialize","wOS.AnimExtension.CustomSequenceHoldtypes",function()local n=GAMEMODE.CalcMainActivity;function GAMEMODE:CalcMainActivity(k,o)local f,p=n(self,k,o)local q=false;if prone then if k.IsProne then q=k:IsProne()end end;if!q then local g=k:GetActiveWeapon()if IsValid(g)then local h=g:GetHoldType()if wOS.AnimExtension.TranslateHoldType[h]then local i=wOS.AnimExtension.TranslateHoldType[h]:GetActData(f)if f==ACT_MP_RUN&&k:KeyDown(IN_SPEED)then i=wOS.AnimExtension.TranslateHoldType[h]:GetActData(ACT_MP_SPRINT)||i end;if i then p=k:LookupSequence(i.Sequence)end end end;if f!=k.LastAct then k:SetCycle(0)end end;k.LastAct=f;return f,p end end)concommand.Add("wos_base_help",function(k,r,s)MsgC(Color(255,255,255),"------------------ ",Color(133,173,219),"wiltOS HELP PRINT",Color(255,255,255)," ----------------------\n")MsgC(Color(255,255,255),"Addon Path Check: ")LocalPlayer():ConCommand("whereis models/m_anm.mdl")timer.Simple(0.01,function()MsgC(color_white,"\nPlease ensure the addon path above points to ",Color(0,255,0),"'[wOS] Animation Extension - Base'\n")MsgC(color_white,"If it does not, unsubscribe to the addon it does point to and get the Animation Base\n")print("\n")local p=LocalPlayer():LookupSequence("_base_wiltos_enabled_")local t=p>=0&&Color(0,255,0)||Color(255,0,0)MsgC(color_white,"Sequence Check: ",t,"\t",p,"\n")MsgC(color_white,"If the above sequence check is ",Color(255,0,0),-1,color_white," and the addon above points to the correct location,\nensure your model is a ",Color(0,255,0),"PLAYER MODEL",color_white," and not an ",Color(255,0,0),"NPC MODEL\n")MsgC(color_white,"Run this commmand again as a default GMod player model. If it still prints ",Color(255,0,0),-1,color_white," your Animation Base may be outdated\n")print("\n")MsgC(color_white,"You can find the link here: https://steamcommunity.com/sharedfiles/filedetails/?id=757604550\n")MsgC(Color(255,255,255),"-----------------------------------------------------------\n")end)end)
--addons/!lpakr_out/lua/wire/wiregates.lua:
local a={}local b;b={curcat="DEFAULT",__newindex=function(c,d,e)if!e.group then e.group=b.curcat end;rawset(a,d,e)end,__index=function(c,d)return rawget(a,d)end,__call=function(c,f)b.curcat=f||"DEFAULT"end}function LoadWireGates()GateActions={}setmetatable(GateActions,b)local g=file.Find("wire/gates/*.lua","LUA")for h,e in pairs(g)do include("gates/"..e)end;GateActions=a;WireGatesSorted={}for i,j in pairs(GateActions)do if!WireGatesSorted[j.group]then WireGatesSorted[j.group]={}end;WireGatesSorted[j.group][i]=j end end;LoadWireGates()local k=CreateConVar("wire_banned_gate_categories","",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_NOTIFY},"For multiple categories, separate them with commas. If you change this, existing gates won't be affected.")local function l(m)local n=string.Explode(",",k:GetString())for h,e in pairs(GateActions)do e.is_banned=table.HasValue(n,e.group)end;if CLIENT&&m then RunConsoleCommand("spawnmenu_reload")end end;cvars.AddChangeCallback("wire_banned_gate_categories",function()l(true)end,"UpdateBannedGates")l(false)
--addons/!lpakr_out/lua/wire/gates/array.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/memory.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/string.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/trig.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/cl_modelplug.lua:
CreateConVar("cl_showmodeltextbox","0")local a={{"WireScreenModels","models/props/cs_office/tv_plasma.mdl"},{"WireScreenModels","models/props/cs_office/computer_monitor.mdl"},{"WireScreenModels","models/props/cs_assault/Billboard.mdl"},{"WireScreenModels","models/props/cs_militia/reload_bullet_tray.mdl"},{"WireScreenModels","models/props_mining/billboard001.mdl"},{"WireScreenModels","models/props_mining/billboard002.mdl"},{"WireNoGPULibScreenModels","models/props/cs_office/tv_plasma.mdl"},{"WireNoGPULibScreenModels","models/props/cs_office/computer_monitor.mdl"},{"Wire_button_Models","models/props/switch001.mdl"},{"Wire_button_Models","models/props_mining/control_lever01.mdl"},{"Wire_button_Models","models/props_mining/freightelevatorbutton01.mdl"},{"Wire_button_Models","models/props_mining/freightelevatorbutton02.mdl"},{"Wire_button_Models","models/props_mining/switch01.mdl"},{"Wire_button_Models","models/props_mining/switch_updown01.mdl"},{"WireTeleporterModels","models/props_c17/pottery03a.mdl"},{"Wire_Keyboard_Models","models/props/kb_mouse/keyboard.mdl"}}for b,c in ipairs(a)do if file.Exists(c[2],"GAME")then list.Set(c[1],c[2],true)end end;list.Set("Wire_waypoint_Models","models/jaanus/wiretool/wiretool_waypoint.mdl")list.Set("Wire_control_Models","models/jaanus/wiretool/wiretool_controlchip.mdl")list.Set("Wire_beamcasting_Models","models/jaanus/wiretool/wiretool_beamcaster.mdl")ModelPlug.ListAddModels("WireScreenModels",{"models/props_lab/monitor01b.mdl","models/props_c17/tv_monitor01.mdl","models/blacknecro/tv_plasma_4_3.mdl","models/kobilica/wiremonitorbig.mdl","models/kobilica/wiremonitorsmall.mdl","models/cheeze/pcb/pcb0.mdl","models/cheeze/pcb/pcb1.mdl","models/cheeze/pcb/pcb2.mdl","models/cheeze/pcb/pcb3.mdl","models/cheeze/pcb/pcb4.mdl","models/cheeze/pcb/pcb6.mdl","models/cheeze/pcb/pcb5.mdl","models/cheeze/pcb/pcb7.mdl","models/cheeze/pcb/pcb8.mdl","models/cheeze/pcb2/pcb8.mdl","models/cheeze/pcb2/pcb1.mdl","models/cheeze/pcb2/pcb2.mdl","models/cheeze/pcb2/pcb3.mdl","models/cheeze/pcb2/pcb4.mdl","models/cheeze/pcb2/pcb5.mdl","models/cheeze/pcb2/pcb6.mdl","models/cheeze/pcb2/pcb7.mdl","models/props_lab/monitor01a.mdl","models/props_lab/monitor02.mdl","models/props_lab/workspace002.mdl","models/props_lab/reciever01b.mdl","models/props_c17/consolebox05a.mdl","models/props_lab/reciever01c.mdl","models/props_lab/reciever01d.mdl","models/props_c17/consolebox01a.mdl","models/props_combine/combine_interface001.mdl","models/props_c17/cashregister01a.mdl","models/props_combine/combine_monitorbay.mdl","models/props_lab/workspace001.mdl","models/props_lab/citizenradio.mdl","models/props_lab/securitybank.mdl","models/beer/wiremod/gate_e2.mdl","models/beer/wiremod/targetfinder.mdl","models/bull/gates/microcontroller1.mdl","models/bull/gates/microcontroller2.mdl","models/jaanus/wiretool/wiretool_gate.mdl","models/jaanus/wiretool/wiretool_controlchip.mdl","models/props_lab/keypad.mdl","models/weapons/w_c4_planted.mdl","models/weapons/w_toolgun.mdl","models/xqm/panel1x1.mdl","models/xqm/panel1x2.mdl","models/xqm/box5s.mdl","models/props_lab/miniteleport.mdl","models/props_lab/plotter.mdl","models/props_combine/combine_interface002.mdl","models/props_combine/combine_interface003.mdl","models/props_combine/combine_intmonitor003.mdl","models/props_combine/combine_intmonitor001.mdl","models/props_lab/workspace003.mdl","models/props_lab/workspace004.mdl","models/props_lab/servers.mdl","models/props_phx/rt_screen.mdl","models/props_wasteland/controlroom_monitor001b.mdl","models/hunter/plates/plate025.mdl","models/hunter/plates/plate025x025.mdl","models/hunter/plates/plate025x05.mdl","models/hunter/plates/plate05x075.mdl","models/hunter/plates/plate05x1.mdl","models/hunter/plates/plate1x1.mdl","models/hunter/plates/plate2x2.mdl","models/hunter/plates/plate4x4.mdl","models/hunter/plates/plate8x8.mdl","models/hunter/plates/plate05x05.mdl","models/hunter/blocks/cube1x1x1.mdl","models/props_lab/reciever01b.mdl","models/fasteroid/bull/lcd1.mdl","models/fasteroid/bull/lcd2.mdl","models/fasteroid/bull/lcd3.mdl","models/fasteroid/bull/lcd4.mdl","models/fasteroid/bull/lcd5.mdl","models/props_phx/construct/windows/window1x1.mdl"})ModelPlug.ListAddModels("WireNoGPULibScreenModels",{"models/props_lab/monitor01b.mdl","models/props/cs_office/tv_plasma.mdl","models/props/cs_office/computer_monitor.mdl","models/kobilica/wiremonitorbig.mdl","models/kobilica/wiremonitorsmall.mdl"})ModelPlug.ListAddGenerics("WireSounds",{["Warning"]="common/warning.wav",["Talk"]="common/talk.wav",["Button"]="buttons/button15.wav",["Denied"]="buttons/weapon_cant_buy.wav",["Zap"]="ambient/energy/zap2.wav",["Oh No"]="vo/npc/male01/ohno.wav",["Yeah"]="vo/npc/male01/yeah02.wav",["apc alarm"]="ambient/alarms/apc_alarm_loop1.wav",["Coast Siren"]="coast.siren_citizen",["Bunker Siren"]="coast.bunker_siren1",["Alarm Bell"]="d1_canals.Floodgate_AlarmBellLoop",["Engine Start"]="ATV_engine_start",["Engine Stop"]="ATV_engine_stop",["Zombie Breathe"]="NPC_PoisonZombie.Moan1",["Idle Zombies"]="Zombie.Idle",["Turret Alert"]="NPC_FloorTurret.Alert",["Helicopter Rotor"]="NPC_CombineGunship.RotorSound",["Heartbeat"]="k_lab.teleport_heartbeat",["Breathing"]="k_lab.teleport_breathing"})ModelPlug.ListAddModels("WheelModels",{"models/props_wasteland/wheel01a.mdl","models/props_wasteland/wheel02a.mdl","models/props_wasteland/wheel03a.mdl","models/props_wasteland/wheel03b.mdl"},{wheel_rx=90,wheel_ry=0,wheel_rz=90})ModelPlug.ListAddModels("Wire_button_Models",{"models/props_citizen_tech/Firetrap_button01a.mdl","models/props_c17/clock01.mdl","models/dav0r/buttons/switch.mdl","models/dav0r/buttons/button.mdl","models/cheeze/buttons2/air.mdl","models/cheeze/buttons2/go.mdl","models/cheeze/buttons2/3.mdl","models/cheeze/buttons2/right.mdl","models/cheeze/buttons2/alert.mdl","models/cheeze/buttons2/plus.mdl","models/cheeze/buttons2/activate.mdl","models/cheeze/buttons2/coolant.mdl","models/cheeze/buttons2/pwr_blue.mdl","models/cheeze/buttons2/6.mdl","models/cheeze/buttons2/easy.mdl","models/cheeze/buttons2/muffin.mdl","models/cheeze/buttons2/pwr_red.mdl","models/cheeze/buttons2/1.mdl","models/cheeze/buttons2/8.mdl","models/cheeze/buttons2/aim.mdl","models/cheeze/buttons2/compile.mdl","models/cheeze/buttons2/set.mdl","models/cheeze/buttons2/0.mdl","models/cheeze/buttons2/arm.mdl","models/cheeze/buttons2/test.mdl","models/cheeze/buttons2/left.mdl","models/cheeze/buttons2/pwr_green.mdl","models/cheeze/buttons2/clock.mdl","models/cheeze/buttons2/divide.mdl","models/cheeze/buttons2/fire.mdl","models/cheeze/buttons2/cake.mdl","models/cheeze/buttons2/clear.mdl","models/cheeze/buttons2/4.mdl","models/cheeze/buttons2/power.mdl","models/cheeze/buttons2/5.mdl","models/cheeze/buttons2/deactivate.mdl","models/cheeze/buttons2/down.mdl","models/cheeze/buttons2/minus.mdl","models/cheeze/buttons2/stop.mdl","models/cheeze/buttons2/energy.mdl","models/cheeze/buttons2/charge.mdl","models/cheeze/buttons2/overide.mdl","models/cheeze/buttons2/equals.mdl","models/cheeze/buttons2/up.mdl","models/cheeze/buttons2/toggle.mdl","models/cheeze/buttons2/reset.mdl","models/cheeze/buttons2/enter.mdl","models/cheeze/buttons2/2.mdl","models/cheeze/buttons2/start.mdl","models/cheeze/buttons2/multiply.mdl","models/cheeze/buttons2/7.mdl","models/cheeze/buttons2/9.mdl","models/props_combine/combinebutton.mdl","models/maxofs2d/button_01.mdl","models/maxofs2d/button_02.mdl","models/maxofs2d/button_03.mdl","models/maxofs2d/button_04.mdl","models/maxofs2d/button_05.mdl","models/maxofs2d/button_06.mdl","models/bull/buttons/toggle_switch.mdl","models/bull/buttons/rocker_switch.mdl","models/bull/buttons/key_switch.mdl"})ModelPlug.ListAddModels("ThrusterModels",{"models/props_junk/garbage_metalcan001a.mdl","models/jaanus/thruster_flat.mdl","models/fasteroid/computerfan.mdl"})ModelPlug.ListAddModels("Wire_Explosive_Models",{"models/dav0r/tnt/tnt.mdl","models/Combine_Helicopter/helicopter_bomb01.mdl","models/jaanus/thruster_flat.mdl","models/props_c17/oildrum001.mdl","models/props_c17/oildrum001_explosive.mdl","models/props_phx/cannonball.mdl","models/props_phx/facepunch_barrel.mdl","models/props_phx/oildrum001.mdl","models/props_phx/oildrum001_explosive.mdl","models/props_phx/amraam.mdl","models/props_phx/mk-82.mdl","models/props_phx/rocket1.mdl","models/props_phx/torpedo.mdl","models/props_phx/ww2bomb.mdl","models/props_junk/plasticbucket001a.mdl","models/props_junk/PropaneCanister001a.mdl","models/props_junk/propane_tank001a.mdl","models/props_junk/PopCan01a.mdl","models/props_lab/jar01a.mdl","models/props_c17/canister_propane01a.mdl","models/props_c17/canister01a.mdl","models/props_c17/canister02a.mdl","models/props_wasteland/gaspump001a.mdl","models/props_junk/cardboard_box001a.mdl","models/props_junk/cardboard_box001b.mdl","models/props_junk/cardboard_box002a.mdl","models/props_junk/cardboard_box002b.mdl","models/props_junk/cardboard_box003a.mdl","models/props_junk/cardboard_box003b.mdl","models/props_junk/cardboard_box004a.mdl","models/props_junk/CinderBlock01a.mdl","models/props_junk/gascan001a.mdl","models/props_junk/TrafficCone001a.mdl","models/props_junk/metalgascan.mdl","models/props_junk/metal_paintcan001a.mdl","models/props_junk/wood_crate001a.mdl","models/props_junk/wood_crate002a.mdl","models/props_junk/wood_pallet001a.mdl"})ModelPlug.ListAddModels("Wire_Gimbal_Models",{"models/props_c17/canister01a.mdl","models/props_interiors/Furniture_Lamp01a.mdl","models/props_c17/oildrum001.mdl","models/props_phx/misc/smallcannon.mdl","models/props_c17/fountain_01.mdl","models/fasteroid/pointer.mdl"})ModelPlug.ListAddModels("Wire_Value_Models",{"models/kobilica/value.mdl","models/bull/gates/resistor.mdl","models/bull/gates/transistor1.mdl","models/bull/gates/transistor2.mdl","models/cheeze/wires/cpu.mdl","models/cheeze/wires/ram.mdl","models/cheeze/wires/nano_value.mdl"})ModelPlug.ListAddModels("WireTeleporterModels",{"models/props_c17/utilityconducter001.mdl","models/Combine_Helicopter/helicopter_bomb01.mdl","models/props_combine/combine_interface001.mdl","models/props_combine/combine_interface002.mdl","models/props_combine/combine_interface003.mdl","models/props_combine/combine_emitter01.mdl","models/props_junk/sawblade001a.mdl","models/props_combine/health_charger001.mdl","models/props_combine/suit_charger001.mdl","models/props_lab/reciever_cart.mdl","models/props_lab/reciever01a.mdl","models/props_lab/reciever01b.mdl","models/props_lab/reciever01d.mdl","models/props_wasteland/laundry_washer003.mdl"})ModelPlug.ListAddModels("WireTurretModels",{"models/weapons/w_smg1.mdl","models/weapons/w_smg_mp5.mdl","models/weapons/w_smg_mac10.mdl","models/weapons/w_rif_m4a1.mdl","models/weapons/w_357.mdl","models/weapons/w_shot_m3super90.mdl"})ModelPlug.ListAddModels("Wire_satellitedish_Models",{"models/props_wasteland/prison_lamp001c.mdl","models/props_rooftop/satellitedish02.mdl"})ModelPlug.ListAddModels("Wire_Light_Models",{"models/jaanus/wiretool/wiretool_range.mdl","models/jaanus/wiretool/wiretool_siren.mdl","models/MaxOfS2D/light_tubular.mdl","models/fasteroid/led_mini.mdl","models/fasteroid/led_nano.mdl"})ModelPlug.ListAddModels("Wire_Keyboard_Models",{"models/beer/wiremod/keyboard.mdl","models/jaanus/wiretool/wiretool_input.mdl","models/props_c17/computer01_keyboard.mdl"})ModelPlug.ListAddModels("Wire_Hydraulic_Models",{"models/beer/wiremod/hydraulic.mdl","models/jaanus/wiretool/wiretool_siren.mdl","models/xqm/hydcontrolbox.mdl"})ModelPlug.ListAddModels("Wire_GPS_Models",{"models/beer/wiremod/gps.mdl","models/jaanus/wiretool/wiretool_speed.mdl"})ModelPlug.ListAddModels("Wire_Numpad_Models",{"models/beer/wiremod/numpad.mdl","models/jaanus/wiretool/wiretool_input.mdl","models/jaanus/wiretool/wiretool_output.mdl"})ModelPlug.ListAddModels("Wire_WaterSensor_Models",{"models/beer/wiremod/watersensor.mdl","models/jaanus/wiretool/wiretool_range.mdl"})ModelPlug.ListAddModels("Wire_TargetFinder_Models",{"models/beer/wiremod/targetfinder.mdl","models/props_lab/powerbox02d.mdl"})ModelPlug.ListAddModels("Wire_Forcer_Models",{"models/jaanus/wiretool/wiretool_grabber_forcer.mdl","models/jaanus/wiretool/wiretool_siren.mdl","models/fasteroid/computerfan.mdl"})ModelPlug.ListAddModels("Wire_Misc_Tools_Models",{"models/jaanus/wiretool/wiretool_range.mdl","models/jaanus/wiretool/wiretool_siren.mdl","models/props_lab/powerbox02d.mdl"})ModelPlug.ListAddModels("Wire_Laser_Tools_Models",{"models/jaanus/wiretool/wiretool_range.mdl","models/jaanus/wiretool/wiretool_siren.mdl","models/jaanus/wiretool/wiretool_beamcaster.mdl","models/fasteroid/led_mini.mdl"})ModelPlug.ListAddModels("Wire_button_small_Models",{"models/cheeze/buttons2/0_small.mdl","models/cheeze/buttons2/1_small.mdl","models/cheeze/buttons2/2_small.mdl","models/cheeze/buttons2/3_small.mdl","models/cheeze/buttons2/4_small.mdl","models/cheeze/buttons2/5_small.mdl","models/cheeze/buttons2/6_small.mdl","models/cheeze/buttons2/7_small.mdl","models/cheeze/buttons2/8_small.mdl","models/cheeze/buttons2/9_small.mdl","models/cheeze/buttons2/activate_small.mdl","models/cheeze/buttons2/aim_small.mdl","models/cheeze/buttons2/air_small.mdl","models/cheeze/buttons2/alert_small.mdl","models/cheeze/buttons2/arm_small.mdl","models/cheeze/buttons2/cake_small.mdl","models/cheeze/buttons2/charge_small.mdl","models/cheeze/buttons2/clear_small.mdl","models/cheeze/buttons2/clock_small.mdl","models/cheeze/buttons2/compile_small.mdl","models/cheeze/buttons2/coolant_small.mdl","models/cheeze/buttons2/deactivate_small.mdl","models/cheeze/buttons2/divide_small.mdl","models/cheeze/buttons2/down_small.mdl","models/cheeze/buttons2/easy_small.mdl","models/cheeze/buttons2/energy_small.mdl","models/cheeze/buttons2/enter_small.mdl","models/cheeze/buttons2/equals_small.mdl","models/cheeze/buttons2/fire_small.mdl","models/cheeze/buttons2/go_small.mdl","models/cheeze/buttons2/left_small.mdl","models/cheeze/buttons2/minus_small.mdl","models/cheeze/buttons2/muffin_small.mdl","models/cheeze/buttons2/multiply_small.mdl","models/cheeze/buttons2/overide_small.mdl","models/cheeze/buttons2/plus_small.mdl","models/cheeze/buttons2/power_small.mdl","models/cheeze/buttons2/pwr_blue_small.mdl","models/cheeze/buttons2/pwr_green_small.mdl","models/cheeze/buttons2/pwr_red_small.mdl","models/cheeze/buttons2/reset_small.mdl","models/cheeze/buttons2/right_small.mdl","models/cheeze/buttons2/set_small.mdl","models/cheeze/buttons2/start_small.mdl","models/cheeze/buttons2/stop_small.mdl","models/cheeze/buttons2/test_small.mdl","models/cheeze/buttons2/toggle_small.mdl","models/cheeze/buttons2/up_small.mdl"})ModelPlug.ListAddModels("Wire_chip_Models",{"models/bull/gates/capacitor.mdl","models/bull/gates/capacitor_mini.mdl","models/bull/gates/capacitor_nano.mdl","models/bull/gates/logic.mdl","models/bull/gates/logic_mini.mdl","models/bull/gates/logic_nano.mdl","models/bull/gates/microcontroller1.mdl","models/bull/gates/microcontroller1_mini.mdl","models/bull/gates/microcontroller1_nano.mdl","models/bull/gates/microcontroller2.mdl","models/bull/gates/microcontroller2_mini.mdl","models/bull/gates/microcontroller2_nano.mdl","models/bull/gates/processor.mdl","models/bull/gates/processor_mini.mdl","models/bull/gates/processor_nano.mdl","models/bull/gates/resistor.mdl","models/bull/gates/resistor_mini.mdl","models/bull/gates/resistor_nano.mdl","models/bull/gates/transistor1.mdl","models/bull/gates/transistor1_mini.mdl","models/bull/gates/transistor1_nano.mdl","models/bull/gates/transistor2.mdl","models/bull/gates/transistor2_mini.mdl","models/bull/gates/transistor2_nano.mdl","models/cheeze/wires/amd_test.mdl","models/cheeze/wires/cpu.mdl","models/cheeze/wires/cpu2.mdl","models/cheeze/wires/mini_chip.mdl","models/cheeze/wires/mini_cpu.mdl","models/cheeze/wires/nano_chip.mdl","models/cheeze/wires/nano_compare.mdl","models/cheeze/wires/nano_logic.mdl","models/cheeze/wires/nano_math.mdl","models/cheeze/wires/nano_memory.mdl","models/cheeze/wires/nano_select.mdl","models/cheeze/wires/nano_timer.mdl","models/cheeze/wires/nano_trig.mdl","models/cheeze/wires/ram.mdl","models/cyborgmatt/capacitor_large.mdl","models/cyborgmatt/capacitor_medium.mdl","models/cyborgmatt/capacitor_small.mdl","models/jaanus/wiretool/wiretool_controlchip.mdl","models/jaanus/wiretool/wiretool_gate.mdl","models/kobilica/capacatitor.mdl","models/kobilica/lowpolygate.mdl","models/kobilica/transistor.mdl","models/kobilica/transistorsmall.mdl","models/fasteroid/inductor.mdl"})ModelPlug.ListAddModels("Wire_detonator_Models",{"models/jaanus/wiretool/wiretool_detonator.mdl","models/props_combine/breenclock.mdl"})ModelPlug.ListAddModels("Wire_dynamic_button_Models",{"models/bull/dynamicbutton.mdl","models/bull/dynamicbuttonflat.mdl","models/bull/dynamicbuttonmedium.mdl","models/maxofs2d/button_05.mdl"})ModelPlug.ListAddModels("Wire_dynamic_button_small_Models",{"models/bull/dynamicbutton_small.mdl","models/bull/dynamicbuttonflat_small.mdl","models/bull/dynamicbuttonmedium_small.mdl"})ModelPlug.ListAddModels("Wire_expr2_Models",{"models/expression 2/cpu_controller.mdl","models/expression 2/cpu_expression.mdl","models/expression 2/cpu_microchip.mdl"})ModelPlug.ListAddModels("Wire_gate_Models",{"models/bull/gates/capacitor.mdl","models/bull/gates/capacitor_mini.mdl","models/bull/gates/capacitor_nano.mdl","models/bull/gates/logic.mdl","models/bull/gates/logic_mini.mdl","models/bull/gates/logic_nano.mdl","models/bull/gates/microcontroller1.mdl","models/bull/gates/microcontroller1_mini.mdl","models/bull/gates/microcontroller1_nano.mdl","models/bull/gates/microcontroller2.mdl","models/bull/gates/microcontroller2_mini.mdl","models/bull/gates/microcontroller2_nano.mdl","models/bull/gates/processor.mdl","models/bull/gates/processor_mini.mdl","models/bull/gates/processor_nano.mdl","models/bull/gates/resistor.mdl","models/bull/gates/resistor_mini.mdl","models/bull/gates/resistor_nano.mdl","models/bull/gates/transistor1.mdl","models/bull/gates/transistor1_mini.mdl","models/bull/gates/transistor1_nano.mdl","models/bull/gates/transistor2.mdl","models/bull/gates/transistor2_mini.mdl","models/bull/gates/transistor2_nano.mdl","models/cheeze/wires/amd_test.mdl","models/cheeze/wires/cpu.mdl","models/cheeze/wires/cpu2.mdl","models/cheeze/wires/mini_chip.mdl","models/cheeze/wires/mini_cpu.mdl","models/cheeze/wires/nano_chip.mdl","models/cheeze/wires/nano_compare.mdl","models/cheeze/wires/nano_logic.mdl","models/cheeze/wires/nano_math.mdl","models/cheeze/wires/nano_memory.mdl","models/cheeze/wires/nano_select.mdl","models/cheeze/wires/nano_timer.mdl","models/cheeze/wires/nano_trig.mdl","models/cheeze/wires/ram.mdl","models/cyborgmatt/capacitor_large.mdl","models/cyborgmatt/capacitor_medium.mdl","models/cyborgmatt/capacitor_small.mdl","models/jaanus/wiretool/wiretool_controlchip.mdl","models/jaanus/wiretool/wiretool_gate.mdl","models/kobilica/capacatitor.mdl","models/kobilica/lowpolygate.mdl","models/kobilica/transistor.mdl","models/kobilica/transistorsmall.mdl","models/fasteroid/inductor.mdl"})ModelPlug.ListAddModels("Wire_gyroscope_Models",{"models/bull/various/gyroscope.mdl","models/cheeze/wires/gyroscope.mdl"})ModelPlug.ListAddModels("Wire_indicator_Models",{"models/jaanus/wiretool/wiretool_pixel_lrg.mdl","models/jaanus/wiretool/wiretool_pixel_med.mdl","models/jaanus/wiretool/wiretool_pixel_sml.mdl","models/jaanus/wiretool/wiretool_range.mdl","models/jaanus/wiretool/wiretool_siren.mdl","models/led.mdl","models/led2.mdl","models/props_borealis/bluebarrel001.mdl","models/props_c17/clock01.mdl","models/props_c17/gravestone004a.mdl","models/props_junk/PopCan01a.mdl","models/props_junk/TrafficCone001a.mdl","models/props_trainstation/trainstation_clock001.mdl","models/segment.mdl","models/segment2.mdl","models/fasteroid/led_mini.mdl","models/fasteroid/led_nano.mdl"})ModelPlug.ListAddModels("Wire_pixel_Models",{"models/jaanus/wiretool/wiretool_pixel_lrg.mdl","models/jaanus/wiretool/wiretool_pixel_med.mdl","models/jaanus/wiretool/wiretool_pixel_sml.mdl","models/jaanus/wiretool/wiretool_range.mdl","models/jaanus/wiretool/wiretool_siren.mdl","models/led.mdl","models/led2.mdl","models/props_junk/PopCan01a.mdl","models/segment.mdl","models/segment2.mdl","models/fasteroid/led_mini.mdl","models/fasteroid/led_nano.mdl"})ModelPlug.ListAddModels("Wire_radio_Models",{"models/cheeze/wires/router.mdl","models/cheeze/wires/wireless_card.mdl","models/props_lab/binderblue.mdl","models/props_lab/reciever01a.mdl","models/props_lab/reciever01b.mdl","models/props_lab/reciever01c.mdl"})ModelPlug.ListAddModels("Wire_speaker_Models",{"models/bull/various/speaker.mdl","models/bull/various/subwoofer.mdl","models/cheeze/wires/speaker.mdl","models/killa-x/speakers/speaker_medium.mdl","models/killa-x/speakers/speaker_small.mdl","models/props_junk/garbage_metalcan002a.mdl","models/props_junk/garbage_metalcan002a.mdl"})ModelPlug.ListAddModels("Wire_weight_Models",{"models/props_interiors/pot01a.mdl","models/props_lab/huladoll.mdl"})ModelPlug.ListAddModels("Wire_InteractiveProp_Models",{"models/props_lab/reciever01a.mdl","models/props_lab/reciever01b.mdl","models/props_lab/keypad.mdl","models/beer/wiremod/numpad.mdl","models/props_interiors/bathtub01a.mdl","models/props_c17/furnituresink001a.mdl","models/props_interiors/sinkkitchen01a.mdl","models/props_wasteland/prison_sink001a.mdl","models/props_lab/citizenradio.mdl","models/props_c17/furniturewashingmachine001a.mdl","models/props_lab/plotter.mdl","models/props_interiors/vendingmachinesoda01a.mdl","models/props_lab/reciever01c.mdl","models/props_trainstation/payphone001a.mdl"})local d={["No Material"]="",["Clean"]="bull/dynamic_button_clean",["0"]="bull/dynamic_button_0",["1"]="bull/dynamic_button_1",["2"]="bull/dynamic_button_2",["3"]="bull/dynamic_button_3",["4"]="bull/dynamic_button_4",["5"]="bull/dynamic_button_5",["6"]="bull/dynamic_button_6",["7"]="bull/dynamic_button_7",["8"]="bull/dynamic_button_8",["9"]="bull/dynamic_button_9"}for b,c in pairs(d)do list.Set("WireDynamicButtonMaterialsOn",b,{wire_dynamic_button_material_on=c})list.Set("WireDynamicButtonMaterialsOff",b,{wire_dynamic_button_material_off=c})end;local e={"models/cheeze/buttons/button_arm.mdl","models/cheeze/buttons/button_clear.mdl","models/cheeze/buttons/button_enter.mdl","models/cheeze/buttons/button_fire.mdl","models/cheeze/buttons/button_minus.mdl","models/cheeze/buttons/button_muffin.mdl","models/cheeze/buttons/button_plus.mdl","models/cheeze/buttons/button_reset.mdl","models/cheeze/buttons/button_set.mdl","models/cheeze/buttons/button_start.mdl","models/cheeze/buttons/button_stop.mdl"}for b,c in ipairs(e)do list.Set("ButtonModels",c,{})list.Set("Wire_button_Models",c,true)end;local f={"models/cheeze/buttons/button_0.mdl","models/cheeze/buttons/button_1.mdl","models/cheeze/buttons/button_2.mdl","models/cheeze/buttons/button_3.mdl","models/cheeze/buttons/button_4.mdl","models/cheeze/buttons/button_5.mdl","models/cheeze/buttons/button_6.mdl","models/cheeze/buttons/button_7.mdl","models/cheeze/buttons/button_8.mdl","models/cheeze/buttons/button_9.mdl"}for b,c in ipairs(f)do list.Set("ButtonModels",c,{})list.Set("Wire_button_small_Models",c,true)end
--addons/!lpakr_out/lua/wire/client/cl_wire_map_interface.lua:
local a={}local function b(Entity)if!IsValid(Entity)then return end;local c=Entity:EntIndex()Entity._NextRBUpdate=nil;Entity.ppp=nil;a[c]=nil;WireLib._RemoveWire(c)for d,e in pairs(Entity._Settings_WireMapInterfaceEnt||{})do if!e||e==0||e==""then Entity[d]=nil else Entity[d]=e end end;Entity._Settings_WireMapInterfaceEnt=nil end;usermessage.Hook("WireMapInterfaceEnt",function(f)local Entity=f:ReadEntity()local g=f:ReadChar()local h=g==-1;if!WIRE_CLIENT_INSTALLED then return end;if!IsValid(Entity)then return end;if h then b(Entity)return end;Entity._Settings_WireMapInterfaceEnt={}if bit.band(g,1)>0 then Entity._Settings_WireMapInterfaceEnt.m_tblToolsAllowed=Entity.m_tblToolsAllowed||false;Entity.m_tblToolsAllowed={"wire","wire_adv","wire_debugger","wire_wirelink","gui_wiring","multi_wire"}end;if bit.band(g,2)>0 then Entity._Settings_WireMapInterfaceEnt.PhysgunDisabled=Entity.PhysgunDisabled||false;Entity.PhysgunDisabled=true end;local c=Entity:EntIndex()if bit.band(g,32)>0 then a[c]=true else a[c]=nil end end)hook.Add("Think","WireMapInterface_Think",function()for c,i in pairs(a)do local self=Entity(c)if!IsValid(self)||!WIRE_CLIENT_INSTALLED then a[c]=nil;return end;if CurTime()>=(self._NextRBUpdate||0)then self._NextRBUpdate=CurTime()+math.random(30,100)/10;Wire_UpdateRenderBounds(self)end end end)hook.Add("PostDrawOpaqueRenderables","WireMapInterface_Draw",function()for c,i in pairs(a)do local self=Entity(c)if!IsValid(self)||!WIRE_CLIENT_INSTALLED then a[c]=nil;return end;Wire_Render(self)end end)
--addons/!lpakr_out/lua/wire/client/wiremenus.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/wire_expression2_browser.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/wos_advswl_loader.lua:
wOS=wOS||{}wOS.Lightsaber=wOS.Lightsaber||{}include("wos/advswl/loader/loader.lua")
--addons/!lpakr_out/lua/wos/advswl/devestators/sh_devestators.lua:
return lpakr()()
--addons/!lpakr_out/lua/advdupe2/sh_codec_legacy.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/client/sit.lua:
return lpakr()()
--addons/!lpakr_out/lua/vgui/stackercontrolpresets.lua:
local a={}function a:OpenPresetEditor()if!self.m_strPreset then return end;self.Window=vgui.Create("StackerPresetEditor")self.Window:MakePopup()self.Window:Center()self.Window:SetType(self.m_strPreset)self.Window:SetConVars(self.ConVars)self.Window:SetPresetControl(self)end;vgui.Register("StackerControlPresets",a,"ControlPresets")
--addons/!lpakr_out/lua/vgui/stackerpreseteditor.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/info.lua:
CreateConVar('srp_gmid','cwrp',FCVAR_ARCHIVE+FCVAR_REPLICATED,'The server id for server info configuration')CreateConVar('srp_eventmode','0',FCVAR_ARCHIVE+FCVAR_REPLICATED,'The server is in deployment day mode!')local a=GetConVar('srp_gmid'):GetString()||'cwrp'local b=GetConVar('srp_eventmode'):GetBool()||false;local c={default={WebID='cwrp',DataFolder='sup/cwrp/',TeamSpeakIP='ts.superiorservers.co',Ticker='sups.gg',Website='https://superiorservers.co/',Trello='https://trello.com/b/tCdmsn2g',Discord='https://sups.gg/discord',Wiki='https://wiki.superiorservers.co',MaxSlots=115,PlayersNeeded=15,CWRP=true,Map=game.GetMap(),TrainingWhitelist={['STEAM_0:1:26675200']=true}},cwrp={Dev=false,Main=true,ChatPrefix='CW 1',ServerIP='cwrp.superiorservers.co',AltServerIP='cwrp2.superiorservers.co',Training=false,EventMode=b,VoteRestartIfSafe=true},cwrp2={Dev=false,Main=false,ChatPrefix='CW 2',ServerIP='cwrp2.superiorservers.co',AltServerIP='cwrp.superiorservers.co',Training=false,EventMode=b},cwrp3={Dev=false,Main=true,ChatPrefix='CW 3',ServerIP='cwrp3.superiorservers.co',AltServerIP='rp.superiorservers.co',Training=true,EventMode=b},dev={Dev=true,Main=true,ChatPrefix='CW Dev',ServerIP='localhost',AltServerIP='cwrp.superiorservers.co',Training=true,EventMode=b}}info=table.Merge(c.default,c[a]||c.cwrp)file.CreateDir(info.DataFolder)MsgC(Color(0,255,64),'SERVER INFO SET TO '..info.ChatPrefix..'\n')if info.Dev then require'debug'end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/color_sh.lua:
color=color||{chat={}}col=color;local a=FindMetaTable'Color'a.__newindex=function(b,c,d)if rawget(b,'Monitor')&&d!=255 then print('Col Val Changed. ',c,d)if c=='a'&&d!=255 then ErrorNoHalt('PLEASE REPORT THIS TO SCOTT ALONG WITH ALL YELOW LINES BELOW!')end;debug.Trace()end;rawset(b,c,d)end;col.transparent=Color(0,0,0,0)col.black=Color(0,0,0)col.black_light=Color(10,10,10)col.midnight_light=Color(56,56,63)col.midnight=Color(45,45,51)col.midnight_dark=Color(33,33,37)col.grey_dark=Color(20,20,20)col.grey=Color(40,40,40)col.grey_light=Color(60,60,60)col.white_muted=Color(215,215,215)col.white_dark=Color(200,200,200)col.white=Color(255,255,255)col.white.Monitor=true;col.red_dark=Color(192,57,43)col.red=Color(231,76,60)col.red_light=Color(251,96,80)col.green_dark=Color(20,150,20)col.green=Color(39,174,96)col.green_light=Color(37,224,115)col.purple=Color(113,16,132)col.purple_dark=Color(98,15,114)col.pink=Color(155,89,182)col.pink_dark=Color(128,76,148)col.yellow=Color(241,196,15)col.orange_dark=Color(169,93,11)col.orange=Color(230,126,34)col.orange_light=Color(249,172,105)col.gold=Color(204,164,0)col.gold_light=Color(234,188,6)col.tan=Color(210,180,140)col.tan_light=Color(234,197,146)col.tan_dark=Color(166,123,91)col.chat.OOC=Color(255,255,255)col.chat.GROUP=Color(50,50,200)col.chat.GROUP_ALT=Color(76,76,228)col.chat.OFFICER=Color(255,50,50)col.blue_dark=Color(10,59,124)col.blue=Color(12,75,150)col.blue_light=Color(52,152,219)col.maroon=Color(144,12,63)col.ui_SUP=col.blue;col.ui_border=col.grey;col.ui_danger=col.red;col.ui_success=col.green;col.ui_default=col.grey;col.ui_warning=col.orange;col.ui_primary=col.blue;col.ui_bg=Color(26,26,26)col.ui_header=Color(36,36,36)col.ui_accent=Color(255,132,0)col.ui_outline=col.grey:Copy()col.ui_header_color=Color(220,220,220)col.ui_close_bg=Color(192,57,43)col.ui_button_bg=Color(40,40,40)col.ui_button_text=col.white:Copy()local e=0;local f={}local g=surface.GetTextSize;for h=0,720 do f[h]=HSVToColor(e,1,0.9)e=e==360&&1||e+1 end;local i=0;local j=0;function draw.Rainbow(k,l,m)local n=math.floor(math.sin(RealTime())*35)if n==34&&j!=n then i=i==360&&0||i+1 end;j=n;for h=1,#m do local o=n*h%360;surface.SetTextColor(f[o+i])surface.SetTextPos(k,l)surface.DrawText(m[h])k=k+g(m[h])end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/surface_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/init_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/player_extension_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/controls/ctrlcolor_cl.lua:
local a={}AccessorFunc(a,"m_ConVarR","ConVarR")AccessorFunc(a,"m_ConVarG","ConVarG")AccessorFunc(a,"m_ConVarB","ConVarB")AccessorFunc(a,"m_ConVarA","ConVarA")local b=16;function a:Init()self.Mixer=vgui.Create("DColorMixer",self)self.Mixer:Dock(FILL)self:SetTall(230)end;function a:PerformLayout(c,d)self.Mixer.Palette:SetButtonSize(self:GetWide()/b)end;function a:SetLabel(e)self.Mixer:SetLabel(e)end;function a:Paint()end;function a:SetConVarR(f)self.Mixer:SetConVarR(f)end;function a:SetConVarG(f)self.Mixer:SetConVarG(f)end;function a:SetConVarB(f)self.Mixer:SetConVarB(f)end;function a:SetConVarA(f)self.Mixer:SetConVarA(f)end;vgui.Register("CtrlColor",a,"DPanel")
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contenticon_cl.lua:
AddCSLuaFile()local a={}local b=Material("gui/ContentIcon-normal.png")local c=Material("gui/ContentIcon-hovered.png")local d=Material("icon16/shield.png")local e=Material("icon16/monkey.png")local f=Material("icon16/monkey_tick.png")AccessorFunc(a,"m_Color","Color")AccessorFunc(a,"m_Type","ContentType")AccessorFunc(a,"m_SpawnName","SpawnName")AccessorFunc(a,"m_NPCWeapon","NPCWeapon")AccessorFunc(a,"m_bAdminOnly","AdminOnly")AccessorFunc(a,"m_bIsNPCWeapon","IsNPCWeapon")local function g(self)local h=DermaMenu()h:AddOption("#spawnmenu.menu.copy",function()SetClipboardText(self:GetSpawnName())end):SetIcon("icon16/page_copy.png")if isfunction(self.OpenMenuExtra)then self:OpenMenuExtra(h)end;if!IsValid(self:GetParent())||!self:GetParent().GetReadOnly||!self:GetParent():GetReadOnly()then h:AddSpacer()h:AddOption("#spawnmenu.menu.delete",function()self:Remove()hook.Run("SpawnlistContentChanged")end):SetIcon("icon16/bin_closed.png")end;h:Open()end;function a:Init()self:SetPaintBackground(false)self:SetSize(128,128)self:SetText("")self:SetDoubleClickingEnabled(false)self.Image=self:Add("DImage")self.Image:SetPos(3,3)self.Image:SetSize(128-6,128-6)self.Image:SetVisible(false)self.Label=self:Add("DLabel")self.Label:Dock(BOTTOM)self.Label:SetTall(18)self.Label:SetContentAlignment(5)self.Label:DockMargin(4,0,4,6)self.Label:SetTextColor(color_white)self.Label:SetExpensiveShadow(1,Color(0,0,0,200))self.Border=0 end;function a:SetName(i)self:SetTooltip(i)self.Label:SetText(i)self.m_NiceName=i end;function a:SetMaterial(i)self.m_MaterialName=i;local j=Material(i)if!j||j:IsError()then i=i:Replace("entities/","VGUI/entities/")i=i:Replace(".png","")j=Material(i)end;if!j||j:IsError()then return end;self.Image:SetMaterial(j)end;function a:DoRightClick()local k=self:GetSelectionCanvas()if IsValid(k)&&k:NumSelectedChildren()>0&&self:IsSelected()then return hook.Run("SpawnlistOpenGenericMenu",k)end;self:OpenMenu()end;function a:DoClick()end;function a:OpenMenu()end;function a:OnDepressionChanged(l)end;function a:Paint(m,n)if self.Depressed&&!self.Dragging then if self.Border!=8 then self.Border=8;self:OnDepressionChanged(true)end else if self.Border!=0 then self.Border=0;self:OnDepressionChanged(false)end end;render.PushFilterMag(TEXFILTER.ANISOTROPIC)render.PushFilterMin(TEXFILTER.ANISOTROPIC)self.Image:PaintAt(3+self.Border,3+self.Border,128-8-self.Border*2,128-8-self.Border*2)render.PopFilterMin()render.PopFilterMag()surface.SetDrawColor(255,255,255,255)if!dragndrop.IsDragging()&&(self:IsHovered()||self.Depressed||self:IsChildHovered())then surface.SetMaterial(c)self.Label:Hide()else surface.SetMaterial(b)self.Label:Show()end;surface.DrawTexturedRect(self.Border,self.Border,m-self.Border*2,n-self.Border*2)if self:GetAdminOnly()then surface.SetMaterial(d)surface.DrawTexturedRect(self.Border+8,self.Border+8,16,16)end;if self:GetIsNPCWeapon()then surface.SetMaterial(e)if self:GetSpawnName()==GetConVarString("gmod_npcweapon")then surface.SetMaterial(f)end;surface.DrawTexturedRect(m-self.Border-24,self.Border+8,16,16)end;self:ScanForNPCWeapons()end;function a:ScanForNPCWeapons()if self.HasScanned then return end;self.HasScanned=true;for o,p in pairs(list.Get("NPCUsableWeapons"))do if p.class==self:GetSpawnName()then self:SetIsNPCWeapon(true)break end end end;function a:PaintOver(m,n)self:DrawSelections()end;function a:ToTable(q)local r={}r.type=self:GetContentType()r.nicename=self.m_NiceName;r.material=self.m_MaterialName;r.admin=self:GetAdminOnly()r.spawnname=self:GetSpawnName()r.weapon=self:GetNPCWeapon()table.insert(q,r)end;function a:Copy()local s=vgui.Create("ContentIcon",self:GetParent())s:SetContentType(self:GetContentType())s:SetSpawnName(self:GetSpawnName())s:SetName(self.m_NiceName)s:SetMaterial(self.m_MaterialName)s:SetNPCWeapon(self:GetNPCWeapon())s:SetAdminOnly(self:GetAdminOnly())s:CopyBase(self)s.DoClick=self.DoClick;s.OpenMenu=self.OpenMenu;s.OpenMenuExtra=self.OpenMenuExtra;return s end;vgui.Register("ContentIcon",a,"DButton")spawnmenu.AddContentType("entity",function(t,u)if!u.material then return end;if!u.nicename then return end;if!u.spawnname then return end;local v=vgui.Create("ContentIcon",t)v:SetContentType("entity")v:SetSpawnName(u.spawnname)v:SetName(u.nicename)v:SetMaterial(u.material)v:SetAdminOnly(u.admin)v:SetColor(Color(205,92,92,255))v.DoClick=function()RunConsoleCommand("gm_spawnsent",u.spawnname)surface.PlaySound("ui/buttonclickrelease.wav")end;v.OpenMenuExtra=function(self,h)h:AddOption("#spawnmenu.menu.spawn_with_toolgun",function()RunConsoleCommand("gmod_tool","creator")RunConsoleCommand("creator_type","0")RunConsoleCommand("creator_name",u.spawnname)end):SetIcon("icon16/brick_add.png")end;v.OpenMenu=g;if IsValid(t)then t:Add(v)end;return v end)spawnmenu.AddContentType("vehicle",function(t,u)if!u.material then return end;if!u.nicename then return end;if!u.spawnname then return end;local v=vgui.Create("ContentIcon",t)v:SetContentType("vehicle")v:SetSpawnName(u.spawnname)v:SetName(u.nicename)v:SetMaterial(u.material)v:SetAdminOnly(u.admin)v:SetColor(Color(0,0,0,255))v.DoClick=function()RunConsoleCommand("gm_spawnvehicle",u.spawnname)surface.PlaySound("ui/buttonclickrelease.wav")end;v.OpenMenuExtra=function(self,h)h:AddOption("#spawnmenu.menu.spawn_with_toolgun",function()RunConsoleCommand("gmod_tool","creator")RunConsoleCommand("creator_type","1")RunConsoleCommand("creator_name",u.spawnname)end):SetIcon("icon16/brick_add.png")end;v.OpenMenu=g;if IsValid(t)then t:Add(v)end;return v end)local w=CreateConVar("gmod_npcweapon","",{FCVAR_ARCHIVE})spawnmenu.AddContentType("npc",function(t,u)if!u.material then return end;if!u.nicename then return end;if!u.spawnname then return end;if!u.weapon then u.weapon={}end;local v=vgui.Create("ContentIcon",t)v:SetContentType("npc")v:SetSpawnName(u.spawnname)v:SetName(u.nicename)v:SetMaterial(u.material)v:SetAdminOnly(u.admin)v:SetNPCWeapon(u.weapon)v:SetColor(Color(244,164,96,255))v.DoClick=function()local x=table.Random(u.weapon)||""if w:GetString()!=""then x=w:GetString()end;RunConsoleCommand("gmod_spawnnpc",u.spawnname,x)surface.PlaySound("ui/buttonclickrelease.wav")end;v.OpenMenuExtra=function(self,h)local x=table.Random(u.weapon)||""if w:GetString()!=""then x=w:GetString()end;h:AddOption("#spawnmenu.menu.spawn_with_toolgun",function()RunConsoleCommand("gmod_tool","creator")RunConsoleCommand("creator_type","2")RunConsoleCommand("creator_name",u.spawnname)RunConsoleCommand("creator_arg",x)end):SetIcon("icon16/brick_add.png")if table.IsEmpty(u.weapon)then return end;local y,z=h:AddSubMenu("#spawnmenu.menu.spawn_with_weapon")z:SetIcon("icon16/gun.png")y:AddOption("#menubar.npcs.noweapon",function()RunConsoleCommand("gmod_spawnnpc",u.spawnname,"")end):SetIcon("icon16/cross.png")local function A(B,C)if table.Count(C)<1 then return end;y:AddSpacer()for D,E in SortedPairs(C)do y:AddOption(D,function()RunConsoleCommand("gmod_spawnnpc",u.spawnname,E)end):SetIcon("icon16/gun.png")end end;local F={}for o,E in pairs(u.weapon)do if E==""then continue end;F[language.GetPhrase(E)]=E end;A(y,F)local F={}for o,G in pairs(list.Get("NPCUsableWeapons"))do if table.HasValue(u.weapon,G.class)then continue end;F[language.GetPhrase(G.title)]=G.class end;A(y,F)end;v.OpenMenu=g;if IsValid(t)then t:Add(v)end;return v end)spawnmenu.AddContentType("weapon",function(t,u)if!u.material then return end;if!u.nicename then return end;if!u.spawnname then return end;local v=vgui.Create("ContentIcon",t)v:SetContentType("weapon")v:SetSpawnName(u.spawnname)v:SetName(u.nicename)v:SetMaterial(u.material)v:SetAdminOnly(u.admin)v:SetColor(Color(135,206,250,255))v.DoClick=function()RunConsoleCommand("gm_giveswep",u.spawnname)surface.PlaySound("ui/buttonclickrelease.wav")end;v.DoMiddleClick=function()RunConsoleCommand("gm_spawnswep",u.spawnname)surface.PlaySound("ui/buttonclickrelease.wav")end;v.OpenMenuExtra=function(self,h)h:AddOption("#spawnmenu.menu.spawn_with_toolgun",function()RunConsoleCommand("gmod_tool","creator")RunConsoleCommand("creator_type","3")RunConsoleCommand("creator_name",u.spawnname)end):SetIcon("icon16/brick_add.png")if self:GetIsNPCWeapon()then local H=h:AddOption("#spawnmenu.menu.use_as_npc_gun",function()RunConsoleCommand("gmod_npcweapon",self:GetSpawnName())end)if self:GetSpawnName()==GetConVarString("gmod_npcweapon")then H:SetIcon("icon16/monkey_tick.png")else H:SetIcon("icon16/monkey.png")end end;h:AddSpacer()spawnmenu.AddQuickAction(h,'Give To',function(I)RunConsoleCommand('ba','gmgive',I:SteamID(),self:GetSpawnName())end)end;v.OpenMenu=g;if IsValid(t)then t:Add(v)end;return v end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contentsearch_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contenttypes/addonprops_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contenttypes/npcs_cl.lua:
hook.Add("PopulateNPCs","AddNPCContent",function(a,b,c)local d=list.Get("NPC")local e={}for f,g in pairs(d)do local h=g.Category||"Other"local i=e[h]||{}i[f]=g;e[h]=i end;for j,g in SortedPairs(e)do local c=b:AddNode(j,"icon16/monkey.png")c.DoPopulate=function(self)if self.PropPanel then return end;self.PropPanel=vgui.Create("ContentContainer",a)self.PropPanel:SetVisible(false)self.PropPanel:SetTriggerSpawnlistChange(false)for k,l in SortedPairsByMemberValue(g,"Name")do spawnmenu.CreateContentIcon(l.ScriptedEntityType||"npc",self.PropPanel,{nicename=l.Name||k,spawnname=k,material="entities/"..k..".png",weapon=l.Weapons,admin=l.AdminOnly})end end;c.DoClick=function(self)self:DoPopulate()a:SwitchPanel(self.PropPanel)end end;local m=b:Root():GetChildNode(0)if IsValid(m)then m:InternalDoClick()end end)local n={}Derma_Hook(n,"Paint","Paint","Tree")n.m_bBackground=true;function n:Init()self:SetOpenSize(75)self:DockPadding(15,10,15,10)local o=vgui.Create("DLabel",self)o:Dock(TOP)o:DockMargin(0,5,0,0)o:SetDark(true)o:SetText("#menubar.npcs.weapon")local p=vgui.Create("DComboBox",self)p:Dock(TOP)p:DockMargin(0,0,0,0)p:SetConVar("gmod_npcweapon")p:SetSortItems(false)p:AddChoice("#menubar.npcs.defaultweapon","")p:AddChoice("#menubar.npcs.noweapon","none")p:AddSpacer()local q={}for r,g in pairs(list.Get("NPCUsableWeapons"))do q[language.GetPhrase(g.title)]=g.class end;for s,t in SortedPairs(q)do p:AddChoice(s,t)end;function p:OnSelect(u,v)self:ConVarChanged(self.Data[u])end;self:Open()end;function n:PerformLayout()end;vgui.Register("SpawnmenuNPCSidebarToolbox",n,"DDrawer")spawnmenu.AddCreationTab("#spawnmenu.category.npcs",function()local w=vgui.Create("SpawnmenuContentPanel")w:EnableSearch("npcs","PopulateNPCs")w:CallPopulateHook("PopulateNPCs")local x=w.ContentNavBar;x.Options=vgui.Create("SpawnmenuNPCSidebarToolbox",x)return w end,"icon16/monkey.png",20,nil)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contenttypes/weapons_cl.lua:
hook("PopulateWeapons","AddWeaponContent",function(a,b,c)local d=list.Get("Weapon")local e={}for f,g in pairs(d)do if!g.Spawnable then continue end;e[g.Category]=e[g.Category]||{}table.insert(e[g.Category],g)end;d=nil;for h,i in SortedPairs(e)do local c=b:AddNode(h,"icon16/gun.png")c.DoPopulate=function(self)if self.PropPanel then return end;self.PropPanel=vgui.Create("ContentContainer",a)self.PropPanel:SetVisible(false)self.PropPanel:SetTriggerSpawnlistChange(false)for f,j in SortedPairsByMemberValue(i,"PrintName")do spawnmenu.CreateContentIcon(j.ScriptedEntityType||"weapon",self.PropPanel,{nicename=j.PrintName||j.ClassName,spawnname=j.ClassName,material="entities/"..j.ClassName..".png",admin=j.AdminOnly})end end;c.DoClick=function(self)self:DoPopulate()a:SwitchPanel(self.PropPanel)end end;local k=b:Root():GetChildNode(0)if IsValid(k)then k:InternalDoClick()end end)spawnmenu.AddCreationTab("#spawnmenu.category.weapons",function()local l=vgui.Create("SpawnmenuContentPanel")l:EnableSearch("weapons","PopulateWeapons")l:CallPopulateHook("PopulateWeapons")return l end,"icon16/gun.png",10)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/button_ui.lua:
local a={}function a:Init()self.OnClick={}self.OnUpClick={}self.LastClick={}self.OnClickState={}self.ClickTime=0.2;self.deleteonclose=true;self.SoundClick='garrysmod/ui_click.wav'self.SoundHover='garrysmod/ui_hover.wav'self.lbl=vgui.Create('DLabel',self)self.lbl:SetContentAlignment(5)self.lbl:SetColor(col.ui_button_text)self.lbl:SetFont'ui_button.r'self.lbl:SetText'Button'self.lbl:Dock(FILL)self:DockMargin(5,10,5,10)self:DockPadding(0,0,0,0)self:SetSize(100,30)self:SetCursor('hand')self:SetName(CurTime()+math.random())end;function a:SetNumerical(b,c)self.numberical=b;self.numberperc=c||.7;if b then self:AddPanel('srp_textinput',function(d)d:Dock(LEFT)d:SetWide(0)d:SetText'0'self.numbers=d end)elseif!b&&IsValid(self.numbers)then self.numbers:Remove()end end;function a:OnMousePressed(e)if self.disabled then return end;local f=self.LastClick[e]&&self.LastClick[e]+self.ClickTime>CurTime()||false;if self.numberical&&input.IsKeyDown(KEY_LSHIFT)&&e==MOUSE_LEFT&&IsValid(self.numbers)then self.numbers:SizeTo(self:GetWide()*self.numberperc,self:GetTall(),.5,0)return end;local g=0;if self.OnClick[e]then if IsValid(self.numbers)then self.numbers:SizeTo(0,self.numbers:GetTall(),.2,0)g=tonumber(self.numbers:GetText())end;if self.SoundClick then surface.PlaySound(self.SoundClick)end;self.OnClick[e](self,e,f,g)self.OnClickState[e]=true end;self.LastClick[e]=CurTime()end;function a:OnMouseReleased(e)if self.OnUpClick[e]&&self.OnClickState[e]then self.OnClickState[e]=nil;self.OnUpClick[e](self)end end;function a:SetContentAlignment(h)self.lbl:SetContentAlignment(h)return self end;function a:SetDoubleClickTimer(i)self.ClickTime=i;return self end;function a:LeftClick(j,k)self.OnClick[MOUSE_LEFT]=j;self.OnUpClick[MOUSE_LEFT]=k;return self end;function a:MiddleClick(j,k)self.OnClick[MOUSE_MIDDLE]=j;self.OnUpClick[MOUSE_MIDDLE]=k;return self end;function a:ForceLeftClick(l)if!l&&self.disabled then return end;self.OnClick[MOUSE_LEFT](self)return self end;function a:RightClick(j,k)self.OnClick[MOUSE_RIGHT]=j;self.OnUpClick[MOUSE_RIGHT]=k;return self end;function a:ForceRightClick(l)if!l&&self.disabled then return end;self.OnClick[MOUSE_RIGHT](self)return self end;function a:OnScroll(m)self.OnClick[MOUSE_WHEEL_DOWN]=m;self.OnClick[MOUSE_WHEEL_UP]=m;return self end;function a:SetText(n,o)if o==true then n=utf8.char(n)end;self.lbl:SetText(n)return self end;function a:GetText()return self.lbl:GetText()end;function a:SetTextColor(m)self.lbl:SetTextColor(m)return self end;function a:SetSelectedBackgroundColor(col)self.selectedbg=col;return self end;function a:OnSelected(p)self.select=p end;function a:OnDeselected(p)self.deselected=p end;function a:Select(b)self.selected=b;if b&&self.SoundSelected then surface.PlaySound(self.SoundSelected)end;if b&&self.select then self.select(self)elseif!b&&self.deselected then self.deselected(self)end end;function a:IsSelected()return self.selected end;function a:SetFont(n)self.lbl:SetFont(n)return self end;function a:SetDisabled(b,q,r)self.disabled=b;if q&&b==true then timer.Create(self:GetName(),q,1,function()if IsValid(self)then self:SetDisabled(false,nil,r)end end)else timer.Remove(self:GetName())end;if b==false&&r then r(self.id)end;return self end;function a:IsDisabled()return self.disabled end;function a:SetSoundSelected(s)self.SoundSelected=s;return self end;function a:SetSoundHover(s)self.SoundHover=s;return self end;function a:SetSoundClicked(s)self.SoundClick=s;return self end;function a:SetDeleteOnClose(b)self.deleteonclose=b;return self end;function a:GetDeleteOnClose()return self.deleteonclose end;function a:SetClose(t)self.color_bg=col.black;self:SetFont'ui_button_close'self:SetText(0xf00d,true)self:LeftClick(function(u)local v=IsValid(t)&&t||u:GetParent()local w=!v:GetDeleteOnClose()if w then v:Hide()else v:Remove()end end)return self end;function a:SetBorderColor(m)self.outline=true;self.m_bdrColor=m;return self end;function a:SetButtonRadius(x)self.ButtonRadius=x;return self end;function a:Think()if!self.disabled&&self.SoundHover&&(self:IsHovered()||self:IsChildHovered(true))&&self:IsMouseInputEnabled()then if!self.HoverSoundPlayed then self.HoverSoundPlayed=true;surface.PlaySound(self.SoundHover)end else self.HoverSoundPlayed=false end end;function a:Paint(y,z)derma.SkinHook('Paint','Button',self,y,z)end;vgui.Register('srp_button',a,'srp_base')vgui.Register('srp_button_animated',{Paint=function(self,y,z)derma.SkinHook('Paint','ButtonAnimated',self,y,z)end},'srp_button')vgui.Register('srp_button_image',{Init=function(self)self.lbl:Remove()self:AddPanel('DImage',function(A)A:SetSize(32,32)A:Center()A:SetKeyboardInputEnabled(false)A:SetMouseInputEnabled(false)self.img=A end)end,SetMaterialPos=function(self,B,C)self.MatPosX=B;self.MatPosY=C;return self end,SetMaterial=function(self,A)self.img:SetMaterial(A)end,SetTextColor=function(self,col)self.img:SetBackgroundColor(col)return self end,PerformLayout=function(self,y,z)if IsValid(self.img)then if self.MatPosX then self.img:SetPos(self.MatPosX,self.MatPosY||0)else self.img:SetPos((y-32)/2,(z-32)/2)end end end},'srp_button')vgui.Register('srp_button_rounded',{Paint=function(self,y,z)derma.SkinHook('Paint','RoundedButton',self,y,z)end},'srp_button')vgui.Register('srp_button_image_rounded',{Paint=function(self,y,z)derma.SkinHook('Paint','RoundedButton',self,y,z)end},'srp_button_image')vgui.Register('srp_button_tagtext',{PanelClass='srp_panel',Init=function(self)self.lbl:SetContentAlignment(4)self:DockPadding(1,1,1,1)self:AddPanel(self.PanelClass,function(v)v:Dock(LEFT)v:DockMargin(1,1,6,1)v:DockPadding(0,0,0,0)v:SetBackgroundColor(col.grey_light)v:SetKeyboardInputEnabled(false)v:SetMouseInputEnabled(false)v:AddPanel('srp_label',function(D)D:SetFont'ui_label.rb'D:DockMargin(0,0,0,0)D:DockPadding(0,0,0,0)D:Dock(FILL)D:SetKeyboardInputEnabled(false)D:SetMouseInputEnabled(false)D:SetContentAlignment(5)self.tag=D end)v.tag=self.tag;self.tagcontainer=v end)end,SetTagWidth=function(self,y)self.tagcontainer:SetWide(y)return self end,SetTagTextColor=function(self,col)self.tag:SetTextColor(col)return self end,SetTagText=function(self,E,F)self.tag:SetText(E,F)return self end,SetTagFont=function(self,E)self.tag:SetFont(E)return self end,SetTagBackground=function(self,col)self.tagcontainer:SetBackgroundColor(col)end,PerformLayout=function(self,y,z)if IsValid(self.img)then self.tagcontainer:SetWide(z-8)end end},'srp_button')vgui.Register('srp_button_tagtext_rounded',{PanelClass='srp_panel_rounded',Paint=function(self,y,z)derma.SkinHook('Paint','RoundedButton',self,y,z)end},'srp_button_tagtext')vgui.Register('srp_button_tag',{Init=function(self)self:AddPanel('srp_panel_rounded',function(v)v:Dock(LEFT)v:DockMargin(2,2,2,2)v:DockPadding(2,2,2,2)v:SetBackgroundColor(col.grey_light)v:SetWide(32)v:SetKeyboardInputEnabled(false)v:SetMouseInputEnabled(false)v:AddPanel('srp_image',function(A)A:DockMargin(0,0,0,0)A:DockPadding(0,0,0,0)A:Dock(FILL)A:SetKeyboardInputEnabled(false)A:SetMouseInputEnabled(false)self.img=A end)self.imgcontainer=v end)self.lbl:Dock(FILL)self.lbl:DockMargin(0,0,0,0)self.lbl:DockPadding(0,0,0,0)self.lbl:SetContentAlignment(4)end,SetMaterial=function(self,A,b)self.img:SetMaterial(A,b)end,DockMaterial=function(self,h)self.imgcontainer:Dock(h)end,SetMaterialColor=function(self,col)self.img:SetImageColor(col)return self end,SetImageColor=function(self,col)self.img:SetImageColor(col)return self end,SetMaterialBackground=function(self,col)self.imgcontainer:SetBackgroundColor(col)end,SetMaterialMargin=function(self,...)self.imgcontainer:DockMargin(...)end,PerformLayout=function(self,y,z)if IsValid(self.img)then self.imgcontainer:SetWide(z-4)end end},'srp_button')vgui.Register('srp_button_tag_rounded',{Paint=function(self,y,z)derma.SkinHook('Paint','RoundedButton',self,y,z)end},'srp_button_tag')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/dropdown_ui.lua:
local a={}Derma_Hook(a,'Paint','Paint','Dropdown')function a:Init()self.TextColor=col.white;self.TextDropdownColor=col.white;self:Clear()self:LeftClick(function(b)if self.disabled then return end;if self:IsMenuOpen()then self:CloseMenu()else self:OpenMenu()end end)self.lbl:SetContentAlignment(4)self.lbl:SetTextInset(10,0)end;function a:SetTextColor(col)self.TextColor=col;self.lbl:SetTextColor(col)return self end;function a:SetTextDropdownColor(col)self.TextDropdownColor=col;return self end;function a:AddOption(c,d,e,f)local g={data=d||{}}if!g.data.name then g.data.name=c end;if istable(e)then g.style=e end;local h=table.insert(self.options,g)self.mapped_options[c]=h;if e==true||f==true then self:ChooseOption(h)end;return self end;function a:Clear()self:SetText''self.options={}self.mapped_options={}self.spacers={}self.selected=nil;if self.menu then self.menu:Remove()self.menu=nil end end;function a:GetOption(c)return self.options[self.mapped_options[c]]end;function a:GetOptionText(c)return self.options[self.mapped_options[c]].name end;function a:GetOptionData(c)return self.options[self.mapped_options[c]].data end;function a:GetOptionTheme(c)return self.options[self.mapped_options[c]].style end;function a:GetSelected()return self.options[self.selected]&&self.options[self.selected].data end;function a:GetValue()local i=self:GetSelected()if i then return i.value else return''end end;function a:SetValue(j)for c,k in pairs(self.options)do if k.data.value&&k.data.value==j then self:ChooseOption(c)return end end end;function a:Select(c,l)local h=self.mapped_options[c]if h then self:ChooseOption(h,l)end end;function a:Deselect()self.selected=0;self:SetText''self:_OnDeselect()end;function a:GetSelectedID()return self.selected end;function a:AddSpacer(c)self.spacers[c||table.Count(self.options)]=true;return self end;function a:ChooseOption(m,l)if self.menu then self.menu:Remove()self.menu=nil end;local n=self.options[m]if!n then return end;if!self:_OnValidate(m,n.data)then return end;self.selected=m;self:SetText(n.data.name)self:SetTextColor(n.style&&n.style.text||self.TextColor)if!l then self:_OnSelect(m,n.data,n.style)end;return true end;function a:OnSelect(o)self._OnSelect=o;return self end;function a:_OnSelect()return end;function a:OnDeselect(o)self._OnDeselect=o;return self end;function a:_OnDeselect()return end;function a:OnValidate(o)self._OnValidate=o;return self end;function a:_OnValidate()return true end;function a:IsMenuOpen()return IsValid(self.menu)&&self.menu:IsVisible()end;function a:OpenMenu()if#self.options==0 then return end;if IsValid(self.menu)then self.menu:Remove()self.menu=nil end;self.menu=DermaMenu(false)self.menu:SetSkin'SRP_SUP'if self.MaxHeight then self.menu:SetMaxHeight(self.MaxHeight)end;local h=1;for c,k in ipairs(self.options)do local p=self.menu:AddOption(k.data.name,function()if!IsValid(self)then return end;self:ChooseOption(c)end)local e=k.style;p:SetFont(e&&e.font||'ui_button.r')p:SetTextColor(e&&e.text||self.TextDropdownColor)if e then p.color_bg=e.bg||nil;p.color_highlight_bg=e.highlight||nil;if e.icon then p:SetIcon(e.icon)end end;if self.spacers[h]then self.menu:AddSpacer()end;h=h+1 end;local q,r=self:LocalToScreen(0,self:GetTall())self.menu:SetMinimumWidth(self:GetWide())self.menu:Open(q,r,false,self)self:_OnMenuOpened(self.menu)timer.Simple(0,function()if IsValid(self.menu)then self.menu:RequestFocus()end end)end;function a:SetMaxHeight(h)self.MaxHeight=h;if IsValid(self.menu)then self.menu:SetMaxHeight(h)end;return self end;function a:OnMenuOpened(o)self._OnMenuOpened=o;return self end;function a:_OnMenuOpened()end;function a:OnRemove()self:CloseMenu()end;function a:CloseMenu()if IsValid(self.menu)then self.menu:Remove()end end;vgui.Register('srp_dropdown',a,'srp_button')Derma_Hook(a,'Paint','Paint','DropdownRounded')vgui.Register('srp_dropdown_rounded',a,'srp_button_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/font_ui.lua:
surface.CreateFont('ui_led.s',{font='LED Counter 7',size=16})surface.CreateFont('ui_led.r',{font='LED Counter 7',size=26})surface.CreateFont('ui_led.l',{font='LED Counter 7',size=200})surface.CreateFont('ui_led.xxl',{font='LED Counter 7',size=300})surface.CreateFont('ui_chalk.r',{font='Spydole',size=26})surface.CreateFont('ui_starwars.xs',{font='SF Distant Galaxy',size=14})surface.CreateFont('ui_starwars.s',{font='SF Distant Galaxy',size=21})surface.CreateFont('ui_starwars.r',{font='SF Distant Galaxy',size=24})surface.CreateFont('ui_starwars.l',{font='SF Distant Galaxy',size=28})surface.CreateFont('ui_starwars.xl',{font='SF Distant Galaxy',size=32})surface.CreateFont('ui_starwars.xxl',{font='SF Distant Galaxy',size=48})surface.CreateFont('ui_chalk.s',{font='Spydole',size=18})surface.CreateFont('ui_title.r',{font='Titillium Web',size=24,weight=300})surface.CreateFont('ui_header.xs',{font='Titillium Web',size=16,weight=222})surface.CreateFont('ui_header.s',{font='Titillium Web',size=21,weight=200})surface.CreateFont('ui_header.sb',{font='Titillium Web',size=21,weight=600})surface.CreateFont('ui_header.r',{font='Titillium Web',size=26,weight=300})surface.CreateFont('ui_header.rb',{font='Titillium Web',size=26,weight=600})surface.CreateFont('ui_header.l',{font='Titillium Web',size=42,weight=600})surface.CreateFont('ui_header.lo',{font='Titillium Web',size=42,weight=600,outline=true})surface.CreateFont('ui_header.lb',{font='Titillium Web',size=42,weight=800})surface.CreateFont('ui_header.lbo',{font='Titillium Web',size=42,weight=800,outline=true})surface.CreateFont('ui_header.xl',{font='Titillium Web',size=64,weight=600})surface.CreateFont('ui_header.xl2',{font='Titillium Web',size=150,weight=600})surface.CreateFont('ui_header.xxl',{font='Titillium Web',size=200,weight=600})surface.CreateFont('ui_header.xxxl',{font='Titillium Web',size=450,weight=600})surface.CreateFont('ui_label.sb',{font='Clear Sans Medium',size=16,antialias=true,weight=600})surface.CreateFont('ui_label.s',{font='Clear Sans Medium',size=14,antialias=true})surface.CreateFont('ui_label.so',{font='Clear Sans Medium',weight=600,size=12,antialias=true,outline=false})surface.CreateFont('ui_label.r',{font='Clear Sans Medium',weight=500,size=16,antialias=true})surface.CreateFont('ui_label.rb',{font='Clear Sans Medium',weight=800,size=16,antialias=true})surface.CreateFont('ui_label.l',{font='Clear Sans Medium',size=18,antialias=true})surface.CreateFont('ui_label.xl',{font='Clear Sans Medium',size=24,antialias=true})surface.CreateFont('ui_label.b',{font='Clear Sans Medium',size=16,weight=600,antialias=true})surface.CreateFont('ui_button.s',{font='Clear Sans Medium',size=12,antialias=true})surface.CreateFont('ui_button.r',{font='Clear Sans Medium',size=16,antialias=true})surface.CreateFont('ui_button.l',{font='Clear Sans Medium',size=20,antialias=true})surface.CreateFont('ui_button_close',{font='forkawesome',size=18,extended=true,symbol=true,antialias=true})surface.CreateFont('SSRPForkAwesomeSmall',{font='forkawesome',size=12,extended=true,symbol=true})surface.CreateFont('SSRPForkAwesome',{font='forkawesome',size=16,extended=true,symbol=true})surface.CreateFont('SSRPForkAwesome',{font='forkawesome',size=16,extended=true,symbol=true})surface.CreateFont('SSRPForkAwesomeLarge',{font='forkawesome',size=42,extended=true,extended=true,symbol=true})surface.CreateFont('SSRPForkAwesomeExtraLarge',{font='forkawesome',size=82,extended=true,extended=true,symbol=true})surface.CreateFont('ui_button_direction',{font='forkawesome',size=25,extended=true,extended=true,symbol=true})surface.CreateFont('ui_button.b',{font='Clear Sans Medium',size=14,weight=600,outline=true})surface.CreateFont('ui_3d2d.l',{font='Titillium Web',size=60,weight=600})surface.CreateFont('ui_label_inventory.itemcategory',{font='Titillium Web',size=24,weight=600,additive=true})surface.CreateFont('ui_label_inventory.itemheader',{font='Clear Sans Medium',size=20,weight=600,additive=true})surface.CreateFont('ui_label_inventory.itemcount',{font='Clear Sans Medium',size=20,weight=400,additive=false,outline=false})surface.CreateFont('ui_label_compass.indicator',{font='Clear Sans Medium',size=14})surface.CreateFont('ui_weapon.s',{font='Clear Sans',weight=800,size=12,antialias=true})surface.CreateFont('ui_weapon.r',{font='Clear Sans',weight=800,size=16,antialias=true})surface.CreateFont('ui_hud.npcname',{font='Clear Sans Medium',size=48,outline=true})
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/itemselector_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/requestvalue_ui.lua:
local a={}function a:Init()self:SetTitle''self:SetSize(400,150)self:SetBackgroundColor(col.midnight_light)self:Center()self:MakePopup()self:AddPanel('srp_label',function(b)b:SetTall(48)b:SetWrap(true)b:Dock(TOP)b:SetContentAlignment(7)self.text=b end)self:AddPanel('srp_button_rounded',function(c)c:Dock(BOTTOM)c:SetText'Submit'c:LeftClick(function()local d=self.input:GetValue()if d&&(!isstring(d)||d:Trim()!='')then if self:Submit(isstring(d)&&d:Trim()||d)then self:Remove()end end end)c:SetBackgroundColor(col.midnight)c:SetHoverColor(col.midnight_dark)self.SubmitButton=c end)end;function a:CreateInputPanel()if!IsValid(self.input)then self:SetInputPanel('srp_textinput_rounded')end end;function a:SetInputPanel(e)if IsValid(self.input)then return end;self:AddPanel(e,function(f)f:Dock(BOTTOM)self.input=f end)if self.InputPanelHeight then self.input:SetMultiline(true)self.input:SetHeight(self.InputPanelHeight)self:SetTall(120+self.InputPanelHeight)end;self:CustomCreated(self.input)end;function a:SetText(g)self.text:SetText(g)end;function a:SetDisabled(h,i)return self.SubmitButton:SetDisabled(h,i)end;function a:SetInputHeight(j)self:CreateInputPanel()self.InputPanelHeight=j;self.input:SetHeight(j)self.input:SetMultiline(true)self:SetTall(120+j)end;function a:Submit(k)end;function a:OnSubmit(l)self:CreateInputPanel()self.Submit=l end;function a:OnInputPanelCreated(l)self.CustomCreated=l end;function a:CustomCreated(f)end;vgui.Register('srp_requestvalue',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/tagselect_ui.lua:
local a={}local b={col.red,col.green,col.white,col.pink,col.purple,col.yellow,col.orange,col.blue}function a:Init()self:SetBackgroundColor(col.transparent)self:DockPadding(0,0,0,0)self:SetTall(60)self.selectedTags={}self:AddPanel('srp_label',function(c)c:SetFont'ui_label.l'c:DockMargin(5,5,0,0)c:Dock(TOP)self.name=c end)self:AddPanel('srp_panel',function(d)d:SetBackgroundColor(col.transparent)d:DockPadding(0,0,0,0)d:DockMargin(5,5,5,0)d:SetTall(30)d:Dock(TOP)d:AddPanel('srp_dropdown_rounded',function(e)e:Dock(FILL)e:DockMargin(0,0,0,0)e:SetBorderColor(col.transparent)e:OnSelect(function(f,g,h)self:AddTag(h)end)self.drop=e end)self.container=d end)self:AddPanel('srp_grid',function(d)d:Dock(TOP)d:SetTall(0)d:DockMargin(0,0,0,5)d:SetAutoHeight(true)d:SetSpacing(10,10)d.OnComplete=function(f,i)if i==10 then self:SetTall(60)return end;self:SetTall(60+25+i)end;self.tags=d end)end;function a:SetDisabled(j,k)if self.search then self.search:SetDisabled(j,k)else self.drop:SetDisabled(j,k)end end;function a:SetPlayerSearch()self.drop:Remove()self.container:AddPanel('srp_search_rounded',function(d)d:Dock(FILL)d:DockMargin(0,0,0,0)d:DockPadding(0,0,0,0)d:SetPlayerSearch()d:SetMinSearchWidth(290)d:OnSelected(function(f,l)local h={id=l.steamid,name=l.name,color=col.white_dark}self:AddTag(h)end)self.search=d end)end;function a:OnFilterResults(m)self.search:OnFilterResults(m)end;function a:AddTag(h)if self.selectedTags[h.id]then return end;local n=h.color||b[math.random(1,#b)]local o=n:InverseLight(col.white,true)srp.ui.Create('srp_tag',function(p)p.TagListID=h.id;p.TagData=h;p:DockPadding(4,0,2,0)p:SetText(h.name)p:SetTextColor(o)p:SetBackgroundColor(n)p:OnDelete(function(f,q)if IsValid(self)&&IsValid(self.selectedTags[f.TagListID])then self:OnDeselect(f.TagData)self.selectedTags[f.TagListID]:Remove()self.selectedTags[f.TagListID]=nil end end)self.tags:AddItem(p)self.selectedTags[h.id]=p end)self:OnSelect(h)return true end;function a:SetText(r)self.name:SetText(r)end;function a:AddOption(g,h,s,t)self.drop:AddOption(g,h,s,t)end;function a:Select(g)self.drop:Select(g)end;function a:OnSelected(m)self.OnSelect=m end;function a:OnSelect()end;function a:OnDeselected(m)self.OnDeselect=m end;function a:OnDeselect()end;function a:GetTags()return table.GetKeys(self.selectedTags)end;vgui.Register('srp_tagselect',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/visualnodes/visualnode_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/ui/battlepass_items_ui.lua:
local a={}function a:Init()self.Items={}self:SetBackgroundColor(col.transparent)self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self.StepAmount=200;self:AddPanel('srp_button_rounded',function(b)b:Dock(LEFT)b:SetWide(30)b:SetFont'SSRPForkAwesome'b:SetText(0xf053,true)b:DockMargin(1,1,1,1)b:LeftClick(function()self:Step(-1)end)self.BackBtn=b end)self:AddPanel('ui_scrollpanel_horizontal',function(c)c:Dock(FILL)c:DockMargin(1,1,1,1)c.Padding=0;c:HideScrollbar(true)self.ItemList=c end)self:AddPanel('srp_button_rounded',function(b)b:Dock(RIGHT)b:SetWide(30)b:SetFont'SSRPForkAwesome'b:SetText(0xf054,true)b:DockMargin(1,1,1,1)b:LeftClick(function()self:Step(1)end)self.FrontBtn=b end)end;function a:Step(d)local e=math.floor(self.ItemList:GetWide()/121)*121;self.ItemList:SetOffset(math.SnapTo(self.ItemList.Offset+e*d,e))end;function a:Populate(f,g)self.Battlepass=f;for h=1,f.levels do local i=f.freemium[h]||f.premium[h]srp.ui.Create('srp_battlepassitem',function(j)j:Populate(h,f,g,i,f.freemium[h]!=nil)j:LeftClick(function(k)if k.Empty then return end;self:Select(k)self:_OnLevelSelected(k.ItemLevel,k.Items)end)if h==1 then self:Select(j)self:_OnLevelSelected(j.ItemLevel,j.Items)end;table.insert(self.Items,j)self.ItemList:AddItem(j)end)end;self.ItemList:InvalidateChildren(true)self:UpdateRewards(g)end;function a:NextAnimation()if!self.AnimationLevel then return end;if self.AnimationLevel>self.AnimationTargetLevel then self.AnimationLevel=nil;self.AnimationTargetLevel=nil;self:OnRewardsClaimed()return end;local l=self.Items[self.AnimationLevel]if IsValid(l)then self.AnimationLevel=self.AnimationLevel+1;l:DoLevelUp(self,srp.battlepass.History[self.Battlepass.id],self.Levels)end end;function a:UpdateRewards(g)local f=self.Battlepass;local m=srp.talents.GetLevelFromXP(g.LastExperience,f.id)local n=srp.talents.GetLevelFromXP(g.CurrentExperience,f.id)if g.LastExperience==g.CurrentExperience then return end;self.AnimationLevel=math.Clamp(m,1,f.levels)self.AnimationTargetLevel=math.Clamp(n+1,1,f.levels)self.Levels=srp.talents.GetXPTable(f.id)||{}timer.Simple(.75,function()if IsValid(self)then self:NextAnimation()end end)end;function a:OnRewardsClaimed()srp.battlepass.CompleteHistory(self.Battlepass)self:GetParent():OnRewardsClaimed()end;function a:OnRemove()srp.battlepass.CompleteHistory(self.Battlepass)end;function a:Select(o)for p,j in ipairs(self.Items)do if j==o then j:Select(true)else j:Select(false)end end end;function a:OnLevelSelected(q)self._OnLevelSelected=q end;function a:_OnLevelSelected(m)end;vgui.Register('srp_battlepassitems',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/building/ui/buildingconstructor_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cards/ui/cardmail_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cards/ui/cards_ui.lua:
local a={}function a:Init()self:SetSize(1280,720)self:Center()self:SetBackgroundColor(col.transparent)self:MoveToFront()self:MakePopup()self:DockPadding(5,35,5,5)self:AddPanel('srp_modelcard',function(b)b:SetSize(1260,650)b:Center()self.card=b end)self:AddPanel('srp_button_rounded',function(c)c:SetText'Close Card'c:SetContentAlignment(5)c:SetBackgroundColor(col.red_dark)c:SetHoverColor(col.red)c:SetTextColor(col.white)c:SetPos(0,530)c:CenterHorizontal()c:LeftClick(function()self:ShowCards()end)end)end;function a:Setup(d,e,f,g,h)self.cards=h;self.card:Populate(d,e,f,g)end;function a:ShowCards()srp.ui.Create('srp_cardmail',function(i)i:Populate(self.cards)srp.cards.ui=i end)self:Remove()end;vgui.Register('srp_cards',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/allegiance_sh.lua:
srp.allegiance=srp.allegiance||{}nw.Register'srp.allegiance.id':Write(net.WriteUInt,4):Read(net.ReadUInt,4):SetPlayer()local a={}a.__index=a;function a:Init()self.color=Color(255,255,255)self.desc='The description for this allegiance is empty.'self.vip=false;self.hidden=false;self.event=false;self.presets={}self.hooks={}self.players={}self.currency='USD'self.currency_name='American Dollars'self.stats=100 end;function a:SetStat(b,c)self.stats[b]=c;return self end;function a:SetStats(d)self.stats=d;return self end;function a:GetStat(b)return self.stats[b]end;function a:AddPlayer(e)e:SetNetVar('srp.allegiance.id',self.internal)table.insert(self.players,e)end;function a:RemovePlayer(e)e:SetNetVar('srp.allegiance.id',nil)table.RemoveByValue(self.players,e)end;function a:GetPlayerCount(e)return table.Count(self.players)end;function a:GetPlayers(f)if f then local g={}for h,e in ipairs(self.players)do if!e:IsAFK(900)then table.insert(g,e)end end;return g else return self.players end end;function a:GetPlayersWithPerms(i,f)local g={}for h,e in ipairs(self.players)do local j=e:GetGroupRank()if j&&j:HasPermission(i)&&(!f||!e:IsAFK(900))then table.insert(g,e)end end;return g end;function a:SetIcon(k)self.icon=k;return self end;function a:GetIcon()return self.icon end;function a:SetName(l)self.name=l;self.team=self.internal+1;team.SetUp(self.team,self.name,self.color,false)return self end;function a:GetName()return self.name end;function a:SetHands(m,n)self.hands=m;self.gmodhands=n;return self end;function a:GetHands()return self.hands,self.gmodhands end;function a:GetTeam()return self.team end;function a:SetColor(o)self.color=o;return self end;function a:GetColor()return self.color end;function a:SetVIP(p)self.vip=p;return self end;function a:IsVIP()return self.vip end;function a:SetEvent(p)self.event=p;return self end;function a:IsEvent()return self.event end;function a:SetHidden(p)self.hidden=p;return self end;function a:GetHidden()return self.hidden end;function a:SetCurrency(q,l)self.currency=q;self.currency_name=l||q;return self end;function a:GetCurrency()return self.currency,self.currency_name end;function a:AddPreset(r)local s=table.Copy(self.stats)r.stats=table.Merge(s,r.stats||{})r.id=table.insert(self.presets,r)return self end;function a:GetPreset(q)return self.presets[q]end;function a:OnGiveLoadout(t)self.GiveLoadout=t;return self end;function a:SetLoadout(u)self.loadout=u;return self end;function a:GetLoadout()return self.loadout end;function a:SetFootsteps(r)self.footsteps=r;return self end;function a:GetFootstep(e)local v=self:GetPreset(e:GetPresetID())if v&&v.footstep!=nil then if v.footsteps==false then return false else return v.footsteps[math.random(#v.footsteps)]end end;if self.footsteps then return self.footsteps[math.random(#self.footsteps)]end end;function a:SetDeathSounds(r)self.deathsounds=r;return self end;function a:GetDeathSound()return self.deathsounds end;function a:GetDeathSound(e)if!self.deathsounds then return end;local v=self:GetPreset(e:GetCharacter().preset)local w=self.deathsounds;if v&&w[v]then w=w[v]elseif w[e:GetModel()]then w=w[e:GetModel()]end;return w[math.random(#w)]end;function a:GiveLoadout(e)local v=self:GetPreset(e:GetCharacter().preset)local x=v.loadout||self.loadout||{}for q,y in pairs(x)do if isstring(y)then e:Give(y,true)else e:Give(q,true)e:GiveAmmo(y[2]||1000,y[1],true)end end end;function a:OnSetTag(t)self.SetTag=t;return self end;function a:SetTag(e)local v=self:GetPreset(e:GetCharacter().preset||1)if v&&v.tag then e:SetTag(v.tag)else e:SetTag(self.id)end end;function a:OnSetModel(t)self.SetModel=t;return self end;function a:SetModel(e,v)local v=self:GetPreset(v||e:GetCharacter().preset||1)if!v then return end;if v.untrainedmodel&&!e:IsTrained()then e:SetModel(v.untrainedmodel)else if istable(v.model)then e:SetModel(v.model[math.random(#v.model)])else e:SetModel(v.model)end end;if v.bodygroups then e:SetBodygroups(v.bodygroups)end;if v.skin then e:SetSkin(v.skin)end;if v.modelscale then e:SetSize(v.modelscale)else e:SetSize(1)end end;function a:AddHook(l,z)self.hooks[l]=z;hook.Add(l,self.id..'_'..l,z)return self end;function a:RemoveHook(l)self.hooks[l]=nil;hook.Remove(l,self.id..'_'..l)end;function a:CallHook(l,...)if self.hooks[l]then self.hooks[l](self,...)end end;function a:CanUse(e)return true end;function PLAYER:IsCivilian()return self:GetAllegianceID()=='Civilian'end;function PLAYER:GetCurrency()local A=self:GetAllegiance()if A then return A:GetCurrency()end end;local B={}local C={}function srp.allegiance.Create(q,l)if B[q]then return end;local D={internal=-1,id=q}setmetatable(D,a)D.internal=table.insert(C,D)B[q]=D;D:Init()D:SetName(l||q)return D end;function srp.allegiance.Get(q,E)return E&&C[q]||B[q]end;function srp.allegiance.GetAll(E)return E&&C||B end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/characterselect_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/characterselect_ui.lua:
local a={Paint=function()end}local b={REPUBLIC='REP',CIVILIAN='CIV'}local c={cwrp={REPUBLIC={model=Model'models/blu/laat.mdl',pos=Vector(-100,600,10),ang=Angle(15,-130,-10)},CIVILIAN={model=Model'models/swbf3/vehicles/nu_attackship.mdl',pos=Vector(-100,1100,0),ang=Angle(20,-130,-10),scale=1,bodygroups='111111',animation='wings_open'},CIS={model=Model'models/blu/vulturedroid.mdl',pos=Vector(-100,450,-50),ang=Angle(20,-140,-10)},JEDI={model=Model'models/jedi2/jedi2.mdl',pos=Vector(-50,200,20),ang=Angle(15,-130,-10)}},milrp={NATO={model=Model'models/oshkosh_matv.mdl',pos=Vector(200,70,-50),ang=Angle(0,150,0),bodygroups='111111',class='sim_fphys_m-atv'},TERRORIST={model=Model'models/avx/technical_unarmed.mdl',pos=Vector(200,70,-50),ang=Angle(0,50,0),bodygroups='111111',class='avx_technical_mlrs',wheeloffset=Angle(0,145,0)},CIVILIAN={model=Model'models/blu/volga/volga.mdl',pos=Vector(150,80,-45),ang=Angle(0,140,0),bodygroups='111111',class='sim_fphys_pwvolga',wheeloffset=Angle(0,140,0),skin=4}},scprp={}}local d=Color(200,200,200,15)local e=Material('materials/galactic/ui/menu/talentlevel.png','smooth noclamp')local f=Material('materials/galactic/ui/menu/money-4.png','smooth noclamp')local g=Material('materials/galactic/ui/talents/created.png','smooth noclamp')local h=Material('materials/galactic/ui/talents/lastseen.png','smooth noclamp')local i=Material('materials/galactic/ui/hud/clock.png','smooth noclamp')local j=Material('materials/galactic/ui/jedi.png','smooth noclamp')local k={default={animations={'idle_all_scared','b_idle','menu_gman'}},['models/galactic/r2d2/r2d2.mdl']={sounds={Sound('galactic/emotes/r2d2/agree.mp3'),Sound('galactic/emotes/r2d2/disagree.mp3'),Sound('galactic/emotes/r2d2/cheer.mp3'),Sound('galactic/emotes/r2d2/salute.mp3'),Sound('galactic/emotes/r2d2/bastthem.mp3')}},['models/player/chewie.mdl']={sounds={Sound('galactic/emotes/wookiee/agree.mp3'),Sound('galactic/emotes/wookiee/becon.mp3'),Sound('galactic/emotes/wookiee/cheer.mp3'),Sound('galactic/emotes/wookiee/disagree.mp3'),Sound('galactic/emotes/wookiee/flamingo.mp3'),Sound('galactic/emotes/wookiee/forward.mp3'),Sound('galactic/emotes/wookiee/group.mp3'),Sound('galactic/emotes/wookiee/hello.mp3'),Sound('galactic/emotes/wookiee/laugh.mp3'),Sound('galactic/emotes/wookiee/scream.mp3')}}}local function l(m)if istable(m)then return m[math.random(#m)]else return m end end;local function n(o,p,q)if!IsValid(o)then return end;if o:LookupSequence(p)==-1 then p='gesture_wave_original'q=true end;if IsValid(o)then timer.Remove('ResetAnim.'..o.data.characterid)if q then local r,s=o:LookupSequence(p)timer.Create('ResetAnim.'..o.data.characterid,s+0.1,1,function()n(o,'idle_all_01')end)end;o.AutomaticFrameAdvance=true;o:ResetSequence(p)o:SetCycle(0)end end;function a:Init()self.Switching=LocalPlayer().character!=nil;self.characterpanels={}self:Dock(FILL)self:DockPadding(80,50,80,50)self:AddPanel('srp_panel_rounded',function(t)t:SetBackgroundColor(col.transparent)t:Dock(LEFT)t:SetWide(255)t:DockPadding(0,0,0,0)t:AddPanel('ui_scrollpanel',function(u)u:Dock(FILL)srp.ui.Create('srp_grid',function(v)v:Dock(TOP)v:SetAutoHeight(true)v:SetSpacing(0,3.2,true)v.OnComplete=function(w,x)self.scroll:GetCanvas():InvalidateLayout(true)self.scroll:InvalidateLayout(true)end;u:AddItem(v)self.characters=v end)self.scroll=u end)t:AddPanel('srp_button_rounded',function(y)y:SetText'Create Character'y:SetBackgroundColor(col.blue_dark)y:SetHoverColor(col.blue)y:DockMargin(5,0,5,0)y:Dock(BOTTOM)y:SetTall(50)y:LeftClick(function()self:GetParent():Select(2)end)y.Paint=function(w,z,x)surface.SetDrawColor(0,0,0,w:IsHovered()&&150||55)surface.DrawRect(0,0,z,x)surface.SetDrawColor(50,50,50,200)surface.DrawOutlinedRect(0,0,z,x,2)end;self.create=y end)end)self:AddPanel('srp_modelpanel',function(A)A:Dock(FILL)A:SetVisible(false)A:SetCamPos(Vector(0,-10,0))A:SetCanControl(true)A.PreDrawModel=function(w,o)if!o.ship&&self.ship then local B=self.ship.Offset||0;local C=o:GetUp()local D=C:Dot(o:GetPos()-o:GetUp()*30+C*100*B)o.OldClipPlane=render.EnableClipping(true)render.PushCustomClipPlane(C,D)render.PushFilterMag(TEXFILTER.ANISOTROPIC)render.PushFilterMin(TEXFILTER.ANISOTROPIC)o:DrawModel()w:PostDrawModel(o)render.PopFilterMag()render.PopFilterMin()render.PopCustomClipPlane()render.EnableClipping(o.OldClipPlane)return false end end;A.PaintOver=function(w,z,x)draw.DrawText(w.PlayerName||'',"ui_header.xl",z/2,x*.17,col.white,TEXT_ALIGN_CENTER)end;self.playerModel=A:AddModel('models/player/alyx.mdl',Vector(),Angle(0,-90,0))A:TryCenter(self.playerModel,nil,1)self.model=A end)self:AddPanel('srp_character_info',function(t)t:SetVisible(false)t:SetSize(250,385)t:SetPos(ScrW()*.80,(ScrH()-385)*.5)self.charinfo=t end)self:AddCharacters()hook('OnCharactersReceived',self,self.AddCharacters)hook('OnCharacterReceived',self,function(w,E)if IsValid(w)then w:AddCharacter(E)end end)hook('OnCharacterDeleted',self,self.OnDeleted)end;function a:AddCharacter(E)local F=srp.allegiance.Get(E.allegiance)if!F then return end;local G=E.groupid&&srp.groups.Get(E.groupid)local H=E.rid&&G&&G:GetRank(E.rid)local I=E.class&&srp.granks.Get(E.class)local J=E.lorename&&srp.granks.Get(E.lorename)local K=J&&J:GetModel()||I&&I:GetModel()||H&&H:GetModel()if!K then local L=F:GetPreset(E.preset)if!L||!L.model then return end;K=l(L.model)end;E.model=K;E.allegianceTbl=F;E.fullname=(H&&(H.abbreviation||H.id)||'')..' '..E.name;srp.ui.Create('srp_character_button',function(t)t:Dock(TOP)t:SetTall(80)t:Populate(E,self)self.characters:AddItem(t)self.characterpanels[E.characterid]=t end)end;function a:AddCharacters()local M=0;local N=0;local O=0;for r,E in pairs(srp.character.me)do self:AddCharacter(E)if E.updated&&O<E.updated then O=E.updated;N=E.characterid end;M=M+1 end;if self.Switching then self:DisplayPurchases()end;self:Select(N)self.scroll:InvalidateLayout(true)end;function a:GetRemainingSlots()return(LocalPlayer():GetMaxCharacters()||2)-table.Count(srp.character.me)end;function a:DisplayPurchases()local P=self:GetRemainingSlots()local Q=LocalPlayer():IsVIP()if!Q then srp.ui.Create('srp_character_button_purchase',function(t)t:Dock(TOP)t:Populate('Unlock VIP','vip')self.characters:AddItem(t)end)elseif self.Switching&&P<=0 then srp.ui.Create('srp_character_button_purchase',function(t)t:Dock(TOP)t:Populate('CHARACTER SLOTS','character_slots',true)t:OnUnlocked(function(w)if self:GetRemainingSlots()>0 then w.stacking=false end end)self.characters:AddItem(t)end)end;if Q&&!LocalPlayer():IsVIPPlus()then srp.ui.Create('srp_character_button_purchase',function(t)t:Dock(TOP)t:Populate('Unlock VIP','vip_plus')self.characters:AddItem(t)end)end;srp.ui.Create('srp_character_button_purchase',function(t)t:Dock(TOP)t:Populate('Unlock Droids','iconic_c3po')self.characters:AddItem(t)end)srp.ui.Create('srp_character_button_purchase',function(t)t:Dock(TOP)t:Populate('Unlock Astromechs','iconic_astromech')self.characters:AddItem(t)end)srp.ui.Create('srp_character_button_purchase',function(t)t:Dock(TOP)t:Populate('Unlock Wookiees','iconic_wookiee')self.characters:AddItem(t)end)end;function a:OnDeleted(R)if R&&IsValid(self.characterpanels[R.characterid])then self.characterpanels[R.characterid]:Remove()self.charinfo:SetVisible(false)self.model:SetVisible(false)srp.character.me[R.characterid]=nil;for r,t in pairs(self.characters:GetChildren())do if IsValid(t)&&t.character then self:Select(t.character.characterid)end end end end;function a:Select(N)local E=srp.character.me[N]if!E then return end;self.SelectedCharacter=N;for r,t in pairs(self.characters:GetChildren())do if!t.character then continue end;if t.character.characterid==N then t:Selected()else t:Deselected()end end;self.model:SetVisible(true)self.charinfo:SetVisible(true)self.charinfo:Populate(E)self.PlayerIcon=E.groupid=='JEDI'&&j||E.allegianceTbl.icon;self.model.PlayerName=E.name||'Unknown'self:UpdateModel(E)end;function a:SetupFlyby(o)o.EndLocation=o:GetPos()o.Offset=1 end;function a:Think()if IsValid(self.playerModel)then local S,T=input.GetCursorPos()local z,x=ScrW()/2,ScrH()/2;self.mx=math.Clamp((S-z)/z,-1,1)self.my=math.Clamp((T-x)/x,-1,1)self.playerModel:SetEyeTarget(self.playerModel:GetPos()+self.playerModel:GetUp()*30+self.playerModel:GetForward()*150+Vector(0,80*-self.mx,80*-self.my))end;if!IsValid(self.ship)then return end;if!self.ship.Offset||self.ship.Offset<=0 then if self.FinalLocation then self.ship.Hover=Vector(0,0,math.cos(CurTime()))self.ship:SetPos(self.FinalLocation+self.ship.Hover)end;return end;self.ship.Offset=math.Approach(self.ship.Offset||1,0,RealFrameTime()/1*4)self.FinalAngle=self.ship:GetAngles()self.FinalLocation=self.ship.EndLocation-self.ship:GetForward()*15000*self.ship.Offset;self.ship:SetPos(self.ship.EndLocation-self.ship:GetForward()*15000*self.ship.Offset)end;local U={'CustomWheelPosFL','CustomWheelPosFR','CustomWheelPosRL','CustomWheelPosRR'}function a:CreateExtras(m)self:ClearExtras()self.extras={}if!m.class then return end;local V=list.Get('simfphys_vehicles')[m.class].Members;if!V||!V.CustomWheelModel then return end;for r,M in ipairs(U)do local W=self.ship:LocalToWorld(V[M])local X=self.model:AddModel(V.CustomWheelModel)X:SetParent(self.ship)X:SetLocalPos(V[M]*(m.scale||1))X:SetAngles(m.wheeloffset||m.ang)X:SetModelScale(m.scale||1)table.insert(self.extras,X)end end;function a:ClearExtras()if!self.extras then return end;for r,o in ipairs(self.extras)do if IsValid(o)then o:Remove()end end end;function a:UpdateModel(E)self.playerModel.data=E;self.playerModel:SetModel(E.model)local Y=c[info.WebID]local m=Y[E.groupid]||Y[E.allegiance]if!m&&IsValid(self.ship)then self.ship:Remove()self:ClearExtras()elseif m&&IsValid(self.ship)then self.ship:SetModel(m.model)self.ship:SetPos(m.pos)self.ship:SetAngles(m.ang)self.ship:SetModelScale(m.scale||1)self.ship:SetBodyGroups(m.bodygroups||'000000')self.ship:SetSkin(m.skin||0)self:CreateExtras(m)if m.animation then local Z=self.ship:LookupSequence(m.animation)self.ship:ResetSequence(Z)self.ship:SetPlaybackRate(1)self.ship:SetSequence(Z)end;self:SetupFlyby(self.ship)elseif m then self.ship=self.model:AddModel(m.model,m.pos,m.ang,m.scale||1)self.ship.ship=true;self.ship:SetBodyGroups(m.bodygroups||'0000')self.ship:SetSkin(m.skin||0)self:CreateExtras(m)if m.animation then local Z=self.ship:LookupSequence(m.animation)self.ship:ResetSequence(Z)self.ship:SetPlaybackRate(1)self.ship:SetSequence(Z)end;self:SetupFlyby(self.ship)end;local _=k[E.model]||k[E.allegiance]||k.default;if _ then if _.sounds then local a0=_.sounds[math.random(#_.sounds)]LocalPlayer():EmitSound(a0,100,100,.15,CHAN_VOICE)end;local a1=k.animations||k.default.animations;if a1 then n(self.playerModel,a1[math.random(1,#a1)])end end end;function a:EventMode(a2)return self end;function a:Display(a3)if a3 then self:SetVisible(true)self:AlphaTo(255,.2,0)else self:AlphaTo(0,.2,0,function()if IsValid(self)then self:SetVisible(false)end end)end end;function a:Paint(z,x)if self.PlayerIcon then local a4=x*2.2;local a5=a4/3.5;local a6=a4/3;surface.DisableClipping(true)surface.SetMaterial(self.PlayerIcon)surface.SetDrawColor(0,0,0,80)surface.DrawTexturedRect(-a5-5*(self.mx||0),-a6-5*(self.my||0),a4,a4)surface.DisableClipping(false)end end;function a:OnRemove()hook.Remove('OnCharacterReceived',self)hook.Remove('OnCharactersReceived',self)hook.Remove('OnCharacterDeleted',self)end;vgui.Register('srp_characterselection',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/creationpanels/presets_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/chat/commands_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/construction/ui/construction_ui.lua:
local a={}local b=Color(0,0,0,220)local c=Color(255,255,255,180)local d=Color(255,50,50,180)local e=Material'gui/gradient_up'local f=855;local g;function a:Init()self:SetSize(f,212)self:SetPos(0,ScrH()*.75)self:CenterHorizontal()self:SetBackgroundColor(b)self:DockPadding(0,0,0,0)self:SetKeyboardInputEnabled(true)self.Position=Vector()self.Angles=Angle()self.TargetAngles=Angle()self.Selected=1;self.Items={}self:AddPanel('srp_panel',function(h)h:Dock(TOP)h:SetTall(30)h:AddPanel('srp_label',function(i)i:Dock(FILL)i:SetFont'ui_label.rb'i:SetText'Construction Items'end)end)self:AddPanel('ui_scrollpanel',function(j)j:Dock(FILL)j:DockMargin(10,10,10,10)srp.ui.Create('srp_grid',function(h)h:SetAutoHeight(true)j:AddItem(h)self.grid=h end)end)hook('PlayerBindPress',self,function(h,k,l,m,n)if m then return h:OnKeyCodeDown(n)end end)self:Populate()end;function a:Populate()srp.hud.CanWeaponSwitch=false;for o,p in ipairs(srp.construction.GetAll(true))do srp.ui.Create('srp_constructionitem',function(h)h.id=o;h:Populate(p,self)h:SetSize(80,80)self.grid:AddItem(h)table.insert(self.Items,h)end)end;self:Select(1)end;function a:HighlightSelected(q)for r,s in ipairs(self.Items)do if s.id==q then s.Selected=true else s.Selected=false end end end;function a:Select(q)local h=self.Items[q]if!IsValid(h)then return end;local p=h.Item;self.Position=LocalPlayer():GetEyeTraceNoCursor().HitPos;self.SelectedItem=p;self:HighlightSelected(q)if IsValid(g)then g:SetModel(p.Model)else g=ents.CreateClientProp(p.Model)g:SetPos(self.Position)g:SetAngles(self.Angles)g:SetMoveType(MOVETYPE_NONE)g:SetCollisionGroup(COLLISION_GROUP_NONE)g:SetSkin(0)g:SetBodyGroups('000000')g:SetRenderMode(RENDERMODE_TRANSCOLOR)g:SetColor(c)g:Spawn()g.DoNotRemove=true end end;function a:Next()if self.Selected==#self.Items then return end;self.Selected=self.Selected+1;self:Select(self.Selected)end;function a:Previous()if self.Selected==1 then return end;self.Selected=self.Selected-1;self:Select(self.Selected)end;function a:OnKeyCodeDown(n)if n==MOUSE_RIGHT then srp.EnableMouse(!srp.IsMouseEnabled())return true end;if n==KEY_Q then self:Previous()return true elseif n==KEY_E then self:Next()return true end;if n==MOUSE_WHEEL_DOWN then self.TargetAngles:RotateAroundAxis(Vector(0,0,1),4)return true elseif n==MOUSE_WHEEL_UP then self.TargetAngles:RotateAroundAxis(Vector(0,0,1),-4)return true end;if n==MOUSE_LEFT&&self.CanSpawn then self:RequestSpawn()return true end end;function a:RequestSpawn()if self.NextConstruction&&self.NextConstruction>CurTime()then return end;net.Start'srp.construction.Build'net.WriteConstruction(self.SelectedItem)net.WriteVector(self.Position)net.WriteFloat(self.Angles.y,8)net.SendToServer()self.NextConstruction=CurTime()+1 end;function a:Think()if self.SelectedItem&&IsValid(g)then local t,u=srp.construction.GetPlacement(g,self.SelectedItem)self.Position=LerpVector(RealFrameTime()/1*5,self.Position,u)self.Position.z=u.z;self.Angles=LerpAngle(RealFrameTime()/1*7,self.Angles,self.TargetAngles)g:SetPos(self.Position)g:SetAngles(self.Angles)if t then g:SetColor(c)self.CanSpawn=true else g:SetColor(d)self.CanSpawn=false end end end;function a:OnRemove()srp.hud.CanWeaponSwitch=true;hook.Remove('PlayerBindPress',self)if IsValid(g)then g:Remove()end end;function a:Paint(v,w)draw.Box(0,0,v,w,col.grey)surface.SetMaterial(e)surface.SetDrawColor(col.grey_dark)surface.DrawTexturedRect(0,0,v,w)end;vgui.Register('srp_construction',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/item_sh.lua:
cosmetics=cosmetics||{}game.AddParticles'particles/tfseasonals.pcf'cosmetics.PLAYER_MODEL=1;cosmetics.APPAREL=2;cosmetics.WEAPON=3;cosmetics.SABER=4;cosmetics.VEHICLE=5;cosmetics.APPEARANCE=6;cosmetics.ModelReference={}cosmetics.VideoPreview=[[
<!DOCTYPE html>
<html>
	<head>
		<style>
			*,
			body,
			html,
			video {
				padding: 0;
				margin: 0;
				background: transparent;
				width: 100px;
				overflow: hidden;
			}

			video {
				width: 100px;
			}
		</style>
	</head>
	<body>
		<video width="100px" autoplay loop muted>
			<source src="URL" type="video/webm" />
		</video>
	</body>
</html>
]]function cosmetics.GetByModel(a)return cosmetics.ModelReference[a]end;local function b()local c,d=file.Find('models/galactic/cosmetics/phase1cosmetics/*.mdl','GAME')for e,f in pairs(c)do local a='models/galactic/cosmetics/phase1cosmetics/'..f;local g=cosmetics.GetByModel(a)if!g then print('NO: ',a)end end end;concommand.Add('cosmeticcheck',b)cosmetics.SLOT={APPAREL={REWARDS='Rewards',HAIR='Hair',HAIR_BEARD='Beard',HEAD='Head',FACE='Face',FACE2='Face Alt.',NECK='Neck',SHOULDERS='Shoulders',SHOULDERS2='Shoulders Alt.',PATCH='Patch',CHEST='Chest',CHEST_LEFT='Left Chest',CHEST_RIGHT='Right Chest',WAIST='Waist',LEFT_ARM='Left Arm',RIGHT_ARM='Right Arm',LEFT_HAND='Left Hand',RIGHT_HAND='Right Hand',LEFT_LEG='Left Leg',RIGHT_LEG='Right Leg',LEFT_FOOT='Left Foot',RIGHT_FOOT='Right Foot',LEFT_KNEE='Left Knee',RIGHT_KNEE='Right Knee',FEET='Feet',BACK='Back',SKIN='Skin',ANIMATION='Animation',PET='Pet'},APPEARANCE={CORE='Core',MODEL='Player Model',CALLINGCARD='Kill Plate',EFFECTS='Effects'},WEAPON={BARREL=201,GRIP=202,RAIL_LOWER=203,RAIL_UPPER=204,TAG=205,SKIN=206,SOUND=207,CHARM=208},SABER={COLOR='Crystal Color',COLOR2='Secondary Crystal Color',HILT='Hilt',HILT2='Secondary Hilt',SOUNDLOOP='Sound',SOUNDSWING='Swing Sound',SOUNDON='Activation Sound',SOUNDOFF='Deactivation SOund'},VEHICLE={LAAT='LAAT',SKIN='Vehicle Skin'}}cosmetics.REQUIRED_CONTENT={TF2="tf",HL2="hl2",DOD="dod",CSS="cstrike",CSGO="csgo",WORKSHOP=1,GMA=2}cosmetics.LINKED={[cosmetics.SLOT.SABER.HILT]=cosmetics.SLOT.SABER.HILT2,[cosmetics.SLOT.SABER.COLOR]=cosmetics.SLOT.SABER.COLOR2}cosmetics.TIME_FRAME={CHRISTMAS={'20/12','31/12'},EASTER={'14/04','17/04'}}cosmetics.items={}cosmetics.named={}local h={}local i={}local j={}local k={}local l={}local m={}local n={}local o={}local p={}local q={}q.__index=q;debug.getregistry().Manager=q;function q:OnEquip(r)self.OnEquip=r;return self end;function q:OnRemoved(r)self.OnRemoved=r;return self end;function q:OnDraw(r)self.Draw=r;return self end;function q:OnPresetFilterValidation(r)self.OnPresetFilterValidation=r;return self end;function cosmetics.AddManager(s,t)local u={id=s,subid=t}setmetatable(u,q)if t then o[s]=o[s]||{}o[s][t]=u else o[s]=u end;return u end;function cosmetics.GetManager(s,t)return o[s][t]||o[s]end;local v={}v.__index=v;debug.getregistry().Cosmetic=v;function v:SetBone(w)self.transform.Default.Attachment=w;return self end;function v:GetBone()return self.transform.Default.Attachment end;function v:SetPos(x)self.transform.Default.Position=x;return self end;function v:GetPos()return self.transform.Default.Position end;function v:SetScale(y)self.transform.Default.Scale=y;return self end;function v:GetScale()return self.transform.Default.Scale end;function v:SetAngles(z)self.transform.Default.Angle=z;return self end;function v:GetAngles()return self.transform.Default.Angle end;function v:AddTransform(A)self.transform[A.Model]=A;return self end;function v:GetTransform(a)return self.transform[a]end;function v:GetEquipped(pl)return cosmetics.GetEquipped(pl,self.class,self.type,self.slot)end;function v:SetName(B)self.prettyname=B;return self end;function v:GetName()return self.prettyname end;function v:SetOwned(C)self.owned=C;cosmetics.owned[self.id]=C;return self end;function v:IsOwned()return self.owned end;function v:SetInPreset(C)self.InPreset=C end;function v:IsInPreset()return self.InPreset end;function v:SetEquipped(C)self.equipped=C;return self end;function v:IsEquipped()return self.equipped end;function v:GetIcon()return self.icon end;function v:SetIcon(D)self.icon=D;return self end;function v:SetUIScale(y)self.UIScale=y;return self end;function v:GetUIScale()return self.UIScale||1 end;function v:SetUIOffsetPos(E,F)self.UIOffset=E;self.UIOffsetPreview=F;return self end;function v:GetUIOffsetPos()return self.UIOffset,self.UIOffsetPreview end;function v:SetUIOffsetAng(z,G)self.UIOffsetAng=z;self.UIOffsetPreviewAng=G;return self end;function v:GetUIOffsetAng()return self.UIOffsetAng,self.UIOffsetPreviewAng end;function v:SetUIAttachment(s)self.UIAttachment=s;return self end;function v:GetUIAttachment()return self.UIAttachment end;function v:SetType(s)self.type=s;i[self.type]=i[self.type]||{}if s==cosmetics.APPAREL||s==cosmetics.APPEARANCE then self:SetClass('player')end;return self end;function v:OnPresetFilterValidation()end;function v:GetType()return self.type end;function v:SetSlot(s)if!self.type then return self end;self.slot=s;i[self.type][self.slot]=i[self.type][self.slot]||{}table.insert(i[self.type][self.slot],self)local H=cosmetics.LINKED[s]if H then table.insert(j,self.id)end;self:SetManager()return self end;function v:GetSlot()return self.slot end;local I=function()end;function v:SetManager()local J=o[self.type]local K=o[self.type][self.slot]||J;self.manager=K;if!self.manager then return end;self.OnEquip=K.OnEquip||J.OnEquip||I;self.OnPresetFilterValidation=K.OnPresetFilterValidation||J.OnPresetFilterValidation||I;self.OnRemoved=K.OnRemoved||J.OnRemoved||I;self.Draw=K.Draw||J.Draw||I end;local function L(M,N)h[N]=h[N]||{}h[N][M.type]=h[N][M.type]||{}h[N][M.type][M.slot]=h[N][M.type][M.slot]||{}table.insert(h[N][M.type][M.slot],M)end;function v:SetClass(N,O)self.class=N;L(self,N)if O then self.LinkedClass=O;L(self,O)end;return self end;function v:GetClass()return self.class end;function v:GetLinkedClass()return self.LinkedClass end;function v:GetAllegianceID()return self.allegiance end;function v:SetAllegianceID(s)self.allegiance=s;return self end;function v:HasRequiredAllegiance(pl)return!self.allegiance||self.allegiance==pl:GetAllegianceID()end;function v:SetRequiredSteamID(...)self.requiredSteamids={...}if info.Dev then end;return self end;function v:HasRequiredSteamID(pl)local P=pl:SteamID()if self.requiredSteamids then for y=1,#self.requiredSteamids do if self.requiredSteamids[y]==P then return true end end;return false else return true end end;function v:SetRequiredClasses(...)self.requiredClasses={...}return self end;function v:SetRequiredLoreNames(...)self.requiredLoreNames={...}return self end;function v:SetRequiredPermissions(...)self.requiredPermissions={...}return self end;function v:SetRequiredRanks(...)self.requiredRanks={...}return self end;function v:SetRequiredGroups(...)self.requiredGroups={...}return self end;function v:SetBlacklistedGroups(...)self.blacklistedGroups={...}return self end;function v:HasRequiredPermission(pl)if!self.requiredPermissions then return true end;local Q=pl:GetGroup()local R=pl:GetGroupRank()local S=pl:GetGroupClass()for y=1,#self.requiredPermissions do local T=self.requiredPermissions[y]if Q&&Q:HasPermission(T)||R&&R:HasPermission(T)||S&&S:HasPermission(T)then return true end end end;function v:HasRequiredGroup(pl)if!self.requiredGroups&&!self.blacklistedGroups then return true end;local Q=pl:GetGroup()if!Q then return end;if self.blacklistedGroups then for y=1,#self.blacklistedGroups do if self.blacklistedGroups[y]==Q.id then return false end end end;if self.requiredGroups then for y=1,#self.requiredGroups do if self.requiredGroups[y]==Q.id then return true end end end end;function v:HasRequiredRank(pl)if!self.requiredRanks then return true end;local R=pl:GetGroupRank()if!R then return end;for y=1,#self.requiredRanks do if self.requiredRanks[y]==R.id then return true end end end;function v:HasRequiredClass(pl)if!self.requiredClasses then return true end;local S=pl:GetGroupClass()if!S then return end;for y=1,#self.requiredClasses do if self.requiredClasses[y]==S.id then return true end end end;function v:HasRequiredLoreName(pl)if!self.requiredLoreNames then return true end;local U=pl:GetGroupLoreName()if!U then return end;for y=1,#self.requiredLoreNames do if self.requiredLoreNames[y]==U.id then return true end end end;function v:SetModel(a,V)self.valid_model=nil;self.kv_data.model=a;if V then util.AddBlacklistModel(a)end;cosmetics.ModelReference[a]=self;return self end;function v:SetModelFunc(r)self._SetModelFunc=r;return self end;function v:GetModelFunc()return self._SetModelFunc end;function v:GetModel(pl)if IsValid(pl)&&self._SetModelFunc then return self:_SetModelFunc(pl)else return self.kv_data.model end end;function v:SetEffect(W)self.kv_data.effect=W;PrecacheParticleSystem(W)return self end;function v:GetEffect()return self.kv_data.effect end;function v:SetDrawModel(C,a,X)self.drawmodelprev=C;self.drawmodelprev_mdl=a;self.drawmodelprev_offset=X;return self end;function v:GetDrawModelOffset()return self.drawmodelprev_offset end;function v:DrawModel()return self.drawmodelprev end;function v:DrawModelMdl()return self.drawmodelprev_mdl end;function v:ValidModel()if self.valid_model!=nil then return self.valid_model end;if self.kv_data.model&&util.ValidModel(self.kv_data.model)then self.valid_model=true;return true else self.valid_model=false;return false end end;function v:SetGame(s)self.game=s;return self end;function v:GetGame()return self.game end;function v:HasGame()if self.game==nil then return true end;if self._hasgame then return true end;if isnumber(self.game)then local Y=engine.GetAddons()for e,Z in pairs(Y)do if Z.wsid==self.game then self._hasgame=true;return true end end;return false else self._hasgame=IsMounted(self.game)return self._hasgame end end;function v:AddWhitelist(dat)table.insert(self.whitelist,dat)return self end;function v:SetWhitelist(A)self.whitelist=dat;return dat end;function v:AddBlacklist(dat)table.insert(self.blacklist,dat)return self end;function v:SetBlacklist(A)self.blacklist=dat;return dat end;function v:SetGroup(s)self.group=s;return self end;function v:GetGroup()return self.group end;function v:SetSeasonal(C)self.seasonal=C;return self end;function v:IsSeasonal()return self.seasonal end;function v:SetVideo()self.Video=true;return self end;function v:IsVideo()return self.Video end;function v:SetMaterial(_)self.kv_data.material=_;if _&&isstring(_)then self.kv_data.material_object=Material(_)end;return self end;function v:SetOnlineMaterial(a0)self.TextureProxy=true;self.TexturePath=a0;return self end;function v:IsOnlineTexture()return self.TextureProxy end;function v:GetOnlineTexture(a1)if self.kv_data.texture then a1(self,self.kv_data.texture)elseif self.TextureProxy then self:LoadMaterial(a1)end end;function v:GetMaterial(a2)return a2&&self.kv_data.material_object||self.kv_data.material end;function v:LoadMaterial(a1)local s='CallingCard.'..self.id..'_'..self.name;local _=texture.Get(s)if _ then self.kv_data.material_object=_;a1(self,_)return end;texture.Create(s):EnableProxy(false):EnableCache(false):Download('https://superiorservers.co/static/images/cwrp/'..self.TexturePath,function(texture,_)if IsValid(self)then self.kv_data.material_object=_;a1(self,_)end end)end;function v:SetSkin(s)self.kv_data.skin=s;return self end;function v:GetSkin()return self.kv_data.skin end;function v:SetSubMaterial(s,a3)self.kv_data.submaterials=self.kv_data.submaterials||{}self.kv_data.submaterials[s]=a3;return self end;function v:SetSubMaterials(a4)self.kv_data.submaterials=a4;return self end;function v:SetWorldSubMaterials(a4)self.kv_data.worldsubmaterials=a4;return self end;function v:GetSubMaterial(s)return self.kv_data.submaterials[s]end;function v:GetSubMaterials()return self.kv_data.submaterials end;function v:GetWorldSubMaterials()return self.kv_data.worldsubmaterials||self.kv_data.submaterials end;function v:GetTeam()return self.team end;function v:SetTeam(a5)self.team=a5;return self end;function v:SetMeta(a6,a7)self.kv_data[a6]=a7;return self end;function v:GetMeta(a6,a8)return self.kv_data[a6]||a8 end;function v:SetContentID(s,a9)self.contentid=s;self.seasonal=self.seasonal||a9;l[self.type]=l[self.type]||{}l[self.type][self.slot]=l[self.type][self.slot]||{}l[self.type][self.slot][s]=l[self.type][self.slot][s]||{}table.insert(l[self.type][self.slot][s],self)return self end;function v:GetContentID()return self.contentid end;function v:SetScale(aa)self.scale=math.Clamp(aa,.001,200)return self end;function v:SetAttachment(...)local ab={...}self.kv_data.attachment=ab[1]self.kv_data.attachment_fallbacks={}for y=2,#ab do local s=ab[y]if s then table.insert(self.kv_data.attachment_fallbacks,s)end end;return self end;function v:SetDescription(ac)self.desc=ac;return self end;function v:GetDescription()return self.desc end;function v:SetColor(col)self.kv_data.color=col;return self end;function v:GetColor()return self.kv_data.color end;function v:AddKeyValue(a6,ad)self.kv_data[a6]=ad;return self end;function v:AddHook(a6,r)if!isfunction(r)then return end;self.kv_readers[a6]=r;return self end;function v:RunHook(a6,...)if self.kv_readers[a6]then return self.kv_readers[a6](...)end end;function v:Draw(pl,...)end;function v:AddTimeFrame(ae)local af=cosmetics.TIME_FRAME[dat]||istable(ae)&&ae||nil;if af then self.kv_data.time_frame=af;k[ae]=k[ae]||{}k[ae][self]=true end;return self end;function v:SetCost(aa)if!isnumber(aa)||aa<-1 then return end;self.cost=aa;return self end;function v:GetCost()return self.cost end;function v:SetCredits(aa,ag)if!isnumber(aa)||aa<-1 then return end;self.creditsOnly=ag;self.credits=aa;return self end;function v:GetCredits()if self.credits then return self.credits elseif self.cost then return math.floor(self.cost/30)else return end end;function v:CanPurchase()return self.credits!=nil||self.cost!=nil end;function v:AddPlayer(pl,ah)if self.players[pl]then return end;self.players[pl]=true;cosmetics.equipped[pl]=cosmetics.equipped[pl]||{}cosmetics.equipped[pl][self.class]=cosmetics.equipped[pl][self.class]||{}cosmetics.equipped[pl][self.class][self.type]=cosmetics.equipped[pl][self.class][self.type]||{}cosmetics.equipped[pl][self.class][self.type][self.slot]=self;if!self.inuse&&!ah then self.inuse=true;n[self]=true end;if CLIENT&&pl==LocalPlayer()&&!ah then self:SetEquipped(true)self:SetOwned(true)end;if self:GetEffect()then p[pl]=p[pl]||{}p[pl][self.id]=self end;return self:OnEquip(pl)end;function v:RemovePlayer(pl)if self.players[pl]then cosmetics.equipped[pl][self.class][self.type][self.slot]=nil;self.players[pl]=nil;self:OnRemoved(pl)end;if table.Count(self.players)==0 then self.inuse=false;n[self]=nil end;if CLIENT&&pl==LocalPlayer()then self:SetEquipped(false)end;if p[pl]then p[pl][self.id]=nil end;return self end;function v:ClearPlayers()self.inuse=false;n[self]=nil;for pl,e in pairs(self.players)do self:OnRemoved(pl)cosmetics.equipped[pl][self.class][self.type][self.slot]=nil end;self.players={}if CLIENT&&pl==LocalPlayer()then self:SetEquipped(false)end end;function v:GetPlayers()return self.players end;function v:HasPlayer(pl)return self.players[pl]end;function v:CanView(pl)return true end;function v:SetCanView(r)self.CanView=r;return self end;function v:CanUse(pl)return true end;function v:SetCanUse(r)self.CanUse=r;return self end;function v:SetCustomDraw(r)self.CustomDraw=r;return self end;function v:IsWeaponAttachment()return self.WeaponAttachment end;function v:WeaponAttachment(ai)self.WeaponAttachment='cosmetic_'..self.name:Replace(' ','_')srp.WeaponAttachments.Register({self.class},self.WeaponAttachment,ai,{Name=self.name,ViewModel=self.kv_data.model,Icon=self.icon,Description=self.description,Cost=999999999,Stats={}})return self end;function cosmetics.RegisterItem(aj)local u={id=0,icon=Material('materials/color'),name=aj,prettyname=aj,desc='',type=cosmetics.APPAREL,slot=0,players={},kv_data={},kv_readers={},whitelist={},blacklist={},seasonal=false,OnPurchased=function()end,OnSold=function()end,OnEquip=function()end,OnRemoved=function()end,Remove=function()end,Spawn=function()end,owned=false,transform={Default={Position=Vector(),Angle=Angle(),Scale=1}}}setmetatable(u,v)cosmetics.items[aj]=u;cosmetics.named[u.name]=u;u.id=table.insert(m,u)return u end;function cosmetics.GetTable(ak)return ak&&m||cosmetics.items end;function cosmetics.Get(s,ak)return ak&&m[s]||cosmetics.items[s]end;function cosmetics.GetByName(al)return cosmetics.named[al]end;function cosmetics.GetByPrettyName(al)local al=al:lower()for e,M in pairs(cosmetics.items)do return M.prettyname:lower()==al end end;function cosmetics.GetTypeTable(s)return i[s]end;function cosmetics.GetSlotTable(s,am)return i[s]&&i[s][am]end;function cosmetics.GetClassTable(N,an,am)local ao=h[N]if!ao then return end;if!an then return ao elseif!am then return ao[an]else return ao[an]&&ao[an][am]end end;function cosmetics.GetClassTables()return h end;function cosmetics.GetContentTable(s,am,ap)return l[s]&&l[s][am]&&l[s][am][ap]end;function cosmetics.GetEquipped(pl,N,an,am)local a4=cosmetics.equipped[pl]&&cosmetics.equipped[pl][N]if!a4 then return end;if am then return a4[an]&&a4[an][am]else return a4[an]end end;function cosmetics.CanPurchase(pl,M)if!M:CanPurchase()||!M:HasRequiredSteamID(pl)||!M:HasRequiredAllegiance(pl)||!M:HasRequiredGroup(pl)||!M:HasRequiredRank(pl)||!M:HasRequiredClass(pl)||!M:HasRequiredLoreName(pl)||!M:HasRequiredPermission(pl)||!M:CanUse(pl)then return false else return true end end;function cosmetics.CanEquip(pl,M)if!M:HasRequiredSteamID(pl)||!M:HasRequiredAllegiance(pl)||!M:HasRequiredGroup(pl)||!M:HasRequiredRank(pl)||!M:HasRequiredClass(pl)||!M:HasRequiredLoreName(pl)||!M:HasRequiredPermission(pl)||!M:CanUse(pl)then return false else return true end end;function cosmetics.GetInUse()return n end;cosmetics.AddManager(cosmetics.APPAREL):OnPresetFilterValidation(function(self)return true end):OnEquip(function(self,pl)if SERVER||!IsValid(pl)then return end;local aq=ents.CreateClientProp(self:GetModel(pl))if!IsValid(aq)then return end;local ar=self.slot==cosmetics.SLOT.APPAREL.PET;if ar&&!cvar.GetValue('srp_cosmeticspets')then return end;aq.cosmetic=true;aq.color=self:GetColor()||col.white;aq:DrawShadow(false)aq:SetSolid(SOLID_NONE)aq:SetMoveType(MOVETYPE_NONE)aq:SetCollisionGroup(COLLISION_GROUP_DEBRIS)aq:SetTransmitWithParent(true)if self:GetMaterial()then aq:SetMaterial(self:GetMaterial())end;aq:SetPos(LocalPlayer():GetPos()+Vector(0,0,15))aq:SetSpawnEffect(false)aq:Spawn()if self.CustomDraw&&(!ar||cvar.GetValue('srp_cosmeticspeteffects')==true)then aq.RenderOverride=self.CustomDraw end;local as=self:GetBone()local at=self:GetTransform(pl:GetModel())if as&&!at then local w=pl:LookupAttachment(as)aq:SetParent(pl,w)aq:RemoveEffects(EF_BONEMERGE)aq:SetPos(self:GetPos())aq:SetAngles(self:GetAngles())aq:SetModelScale(self:GetScale())elseif at then local w=pl:LookupAttachment(at.Attachment||0)||0;local E=at.Position||self:GetPos()local z=at.Angle||self:GetAngles()local au=at.Scale||self:GetScale()aq:SetParent(pl,math.max(0,w))aq:RemoveEffects(EF_BONEMERGE)aq:SetPos(E)aq:SetAngles(z)aq:SetModelScale(au)else aq:SetParent(pl)aq:AddEffects(EF_BONEMERGE)aq:SetModelScale(self:GetScale())end;aq.GetPlayerColor=function(av)if IsValid(self.pl)&&pl:IsPlayer()then return pl:GetPlayerColor()end end;aq.pl=pl;aq.item=self;pl.cents=pl.cents||{}pl.cents[self.id]=aq;return aq end):OnRemoved(function(self,pl)if SERVER||!pl.cents then return end;if IsValid(pl.cents[self.id])then pl.cents[self.id]:RemoveEffects(EF_BONEMERGE)pl.cents[self.id]:Remove()end;pl.cents[self.id]=nil end)local function aw(pl)pl:StopAndDestroyParticles()pl.Effect=nil end;local function ax(pl,ay,w)aw(pl)ParticleEffectAttach(ay,PATTACH_POINT_FOLLOW,pl,w||pl:LookupAttachment('anim_attachment_head')||pl:LookupAttachment('eyes'))pl.Effect=ay end;cosmetics.AddManager(cosmetics.APPEARANCE):OnPresetFilterValidation(function(self)return true end):OnEquip(function(self,pl)if CLIENT&&self:GetEffect()then ax(pl,self:GetEffect(),self:GetBone())end;if SERVER&&self:GetModel(pl)then pl:SetModel(self:GetModel(pl))end end):OnRemoved(function(self,pl)if CLIENT then if self:GetEffect()then aw(pl)end;return end;local az=self:GetModel(pl)if az then local Q=pl:GetGroup()if Q then Q:SetModel(pl)elseif pl:GetAllegiance()then pl:GetAllegiance():SetModel(pl)end end end):OnDraw(function(self,pl)if pl.NextDrawEffect&&pl.NextDrawEffect>CurTime()then return end;if pl.Effect then ax(pl,self:GetEffect(),self:GetBone())end;pl.NextDrawEffect=CurTime()+20 end)cosmetics.AddManager(cosmetics.SABER):OnPresetFilterValidation(function(self)return true end):OnEquip(function(self,pl)if!IsValid(pl)||!pl:IsPlayer()then return end;local aA=pl:GetWeapons()for e,aB in pairs(aA)do if IsValid(aB)&&aB.SetupAppearance then aB:SetupAppearance(pl)end end end):OnRemoved(function(self,pl)end)cosmetics.AddManager(cosmetics.WEAPON):OnPresetFilterValidation(function(self)return true end):OnEquip(function(self,pl)if SERVER||!IsValid(pl)||!pl:IsPlayer()then return end;if!cvar.GetValue('srp_cosmeticsweapons')then return end;if self:IsSeasonal()&&!cvar.GetValue('srp_cosmeticsweaponseasonal')then return end;if self:GetSlot()==cosmetics.SLOT.WEAPON.CHARM then for e,aC in pairs(pl:GetWeapons())do if aC.SetCosmetics then aC:SetCosmetics(self)end end;return end;local aC=pl:GetWeapon(self:GetClass())if IsValid(aC)&&aC.SetCosmetics then aC:SetCosmetics(self)end;local aD=self:GetLinkedClass()if aD then local aC=pl:GetWeapon(aD)if IsValid(aC)&&aC.SetCosmetics then aC:SetCosmetics(self)end end end):OnRemoved(function(self,pl)if SERVER||!IsValid(pl)||!pl:IsPlayer()then return end;local aC=pl:GetWeapon(self:GetClass())if IsValid(aC)&&aC.RemoveCosmetics then aC:RemoveCosmetics(self)end end)cosmetics.AddManager(cosmetics.VEHICLE):OnPresetFilterValidation(function(self)return true end):OnEquip(function(self,pl)if!IsValid(pl)||!pl:IsPlayer()then return end;local aE=pl:lvsGetVehicle()if IsValid(aE)&&aE:GetClass()==self:GetClass()&&aE.SetCosmetics then aE:SetCosmetics(self)end end):OnRemoved(function(self,pl)if!IsValid(pl)||!pl:IsPlayer()then return end;local aE=pl:lvsGetVehicle()if IsValid(aE)&&aE:GetClass()==self:GetSlot()&&aE.RemoveCosmetics then aE:RemoveCosmetics(self)end end)hook('PostPlayerDraw','cosmetics.DrawEffectList',function(pl)if cvar.GetValue('srp_minimal')==true then return end;if!p[pl]then return end;for s,M in pairs(p[pl])do M:Draw(pl)end end)local function aF()for e,s in pairs(j)do local M=table.Copy(cosmetics.Get(s,true))M.parentid=s;M.name=M.name..'_alt'M.id=table.insert(m,M)local aG=cosmetics.LINKED[M.slot]cosmetics.items[M.name]=M;cosmetics.named[M.name]=M;M:SetSlot(aG)M:SetClass(M.class)function M:IsOwned()return cosmetics.Get(self.parentid,true):IsOwned()end end;j={}end;hook('OnReloaded','cosmetic.LoadLinked',aF)hook('Initialize','cosmetic.LoadLinked',aF)srp.AddCommand('cosmeticpurchase',function(pl,s,aH)cosmetics.Purchase(pl,s,aH==1)end):AddParam(cmd.UINT):AddParam(cmd.UINT)srp.AddCommand('cosmeticequip',function(pl,s)cosmetics.Equip(pl,s)end):AddParam(cmd.UINT)srp.AddCommand('cosmeticunequip',function(pl,s)cosmetics.Unequip(pl,s)end):AddParam(cmd.UINT)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmeticsaber_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/eventlights_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/ui/fragboard_line_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/firingrange/firingrange_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/friendship/ui/friendships_ui.lua:
local a={}local function b(c)local d={}for e,f in pairs(c)do local g=player.GetBySteamID(f.steamid)if IsValid(g)then f.tag='Online Now'table.insert(d,f)end end;return d end;function a:Init()self:SetBackgroundColor(col.midnight_dark)self:SetTitle'Friendships'self:SetSize(500,180)self:Center()self:MakePopup()self:AddPanel('srp_label',function(h)h:Dock(TOP)h:SetTall(50)h:SetText'Create a strong friendship with someone and gain extra XP and RC while you\'re both online!\nYou can only change this once every 14 days!'end)self:AddPanel('srp_search',function(i)i:Dock(TOP)i:DockMargin(5,4,5,4)i:SetBackgroundColor(col.midnight)i:SetTextColor(col.white_dark)i:SetMinSearchWidth(290)i:SetPlayerSearch()i:OnFilterResults(function(j,c)return b(c)end)i:OnSelected(function(j,k)self.name=k.name;self.steamid=k.steamid;j:SetText(k.name..' ('..k.steamid..')')end)self.search=i end)self:AddPanel('srp_button',function(l)l:Dock(TOP)l:SetText'Submit'l:LeftClick(function(j)j:SetDisabled(true,5)net.Start'srp.relationship.Request'net.WriteString(self.steamid)net.SendToServer()end)end)end;vgui.Register('srp_friendships',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/gamemaster_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/domination/ui/dominationzones_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/eventmode/stats_sh.lua:
srp.eventmode=srp.eventmode||{}srp.eventmode.StatInfo={kills={Name='Kills',Description='%name% has %value% kills!'},deaths={Name='Deaths',Description='%name% died %value% times!'}}
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/eventmode/ui/eventrating_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/objectives/ui/objectives_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/ui/tempitems_ui.lua:
local a={}function a:Init()self:SetBackgroundColor(col.midnight)self:DockPadding(10,10,10,10)self.Items={}self:AddPanel('srp_panel_rounded',function(b)b:SetBackgroundColor(col.midnight_dark)b:Dock(TOP)b:SetTall(40)b:AddPanel('srp_label',function(c)c:Dock(LEFT)c:SetContentAlignment(6)c:SetText'ID'c:SetWide(20)end)b:AddPanel('srp_textinput_rounded',function(d)d:Dock(LEFT)d:SetMinMax(1,30)d:SetWide(150)d:SetText'milk'self.ItemID=d end)b:AddPanel('srp_label',function(c)c:Dock(LEFT)c:SetContentAlignment(6)c:SetText'Name'c:SetWide(30)end)b:AddPanel('srp_textinput_rounded',function(d)d:Dock(LEFT)d:SetMinMax(1,128)d:SetWide(150)d:SetText'Milk'self.Name=d end)b:AddPanel('srp_label',function(c)c:Dock(LEFT)c:SetContentAlignment(6)c:SetText'Desc'c:SetWide(30)end)b:AddPanel('srp_textinput_rounded',function(d)d:Dock(LEFT)d:SetMinMax(5,1024)d:SetWide(225)d:SetText'Very nice milkers'self.Description=d end)b:AddPanel('srp_label',function(c)c:Dock(LEFT)c:SetContentAlignment(6)c:SetText'Model'c:SetWide(30)end)b:AddPanel('srp_textinput_rounded',function(d)d:Dock(LEFT)d:SetMinMax(5,512)d:SetWide(225)d:SetText'models/unconid/xmas/eggnog_open.mdl'self.Model=d end)b:AddPanel('srp_button_rounded',function(e)e:SetText('Create')e:Dock(FILL)e:DockMargin(1,1,1,1)e:LeftClick(function(f)f:SetDisabled(true,2)local g=self.ItemID:GetText():sub(0,30):Trim()local h=self.Name:GetText():sub(0,128)local i=self.Description:GetText():sub(0,1024)local j=self.Model:GetText():Trim()if util.ValidModel(j)then srp.items.CreateTempItem(g,h,i,j)else srp.notif.Warning(3,'Invalid model.')end end)end)end)self:AddPanel('ui_scrollpanel',function(k)k:Dock(FILL)srp.ui.Create('srp_grid',function(l)l:Dock(TOP)l:SetSpacing(5,5,true)l:SetAutoHeight(true)k:AddItem(l)self.Grid=l end)end)self:LoadItems()hook('OnItemTempCreated',self,self.CreateItem)hook('OnItemTempRemoved',self,self.RemoveItem)end;function a:LoadItems()for g,m in pairs(srp.items.tempitems)do self:CreateItem(m)end end;function a:OnRemove()hook.Remove('OnItemTempCreated',self)hook.Remove('OnItemTempRemoved',self)end;function a:CreateItem(m)if IsValid(self.Items[m.id])then self.Items[m.id]:Populate(m)return end;srp.ui.Create('srp_gamemaster_tempitem',function(b)b:Populate(m)self.Grid:AddItem(b)self.Items[m.id]=b end)end;function a:RemoveItem(g)if IsValid(self.Items[g])then self.Items[g]:Remove()self.Items[g]=nil end end;vgui.Register('srp_gamemaster_tempitems',a,'srp_panel')local a={}function a:Init()self:SetSize(150,200)self:SetBackgroundColor(col.midnight_dark)self:AddPanel('srp_modelpanel',function(n)n:Dock(FILL)self.Model=n end)self:AddPanel('srp_label',function(c)c:Dock(BOTTOM)self.Description=c end)self:AddPanel('srp_label',function(c)c:Dock(BOTTOM)self.Name=c end)self:AddPanel('srp_label',function(c)c:Dock(BOTTOM)self.ID=c end)self:AddPanel('srp_button_rounded',function(e)e:DockMargin(0,0,0,0)e:SetSize(27,27)e:SetBackgroundColor(col.black)e:SetHoverColor(col.green_dark)e:SetBorderColor(col.transparent)e:SetFont'ui_button_close'e:SetText(0xf067,true)e:LeftClick(function(f)cmd.Run('tempitem',self.ID:GetText(),1)end)self.Create=e end)self:AddPanel('srp_button_rounded',function(e)e:DockMargin(0,0,0,0)e:SetSize(27,27)e:SetBackgroundColor(col.black)e:SetHoverColor(col.red_dark)e:SetBorderColor(col.transparent)e:SetFont'ui_button_close'e:SetText(0xf00d,true)e:LeftClick(function(f)srp.items.RemoveTempItem(self.ID:GetText())end)self.Close=e end)end;function a:Populate(m)self.ID:SetText(m.id)self.Name:SetText(m.name)self.Description:SetText(m.description)if IsValid(self.PreviewModel)then self.PreviewModel:Remove()end;self.PreviewModel=self.Model:AddModel(m.model)self.Model:TryCenter(self.PreviewModel)end;function a:PerformLayout(o,p)if IsValid(self.Close)then self.Close:SetPos(o-28,1)end end;vgui.Register('srp_gamemaster_tempitem',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gifts/gifts_cl.lua:
gifts=gifts||{}function gifts.OpenMenu(a)if IsValid(gifts.UI)then gifts.UI:Remove()end;srp.ui.Create('srp_gifts',function(b)b:Populate(gifts.GetAll(true),a)gifts.UI=b end)end;net('gifts.Unlock',function()hook.Run('OnGiftUnlocked',{id=net.ReadUInt(32),Gift=gifts.ReadGift(),GifterName=net.ReadString(),GifterSteamID=net.ReadString(),Message=net.ReadString()})end)net('gifts.Get',function()local c={}for d=1,net.ReadUInt(16)do table.insert(c,{id=net.ReadUInt(32),Gift=gifts.ReadGift(),GifterName=net.ReadString(),GifterSteamID=net.ReadString(),Message=net.ReadString()})end;hook.Run('OnGiftsLoaded',c)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/group_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/orgs/ui/orgcreation_ui.lua:
local a={}function a:Init()self:SetSize(620,720)self:Center()self:SetTitle'Organisation Creation'self:MakePopup()self:SetBackgroundColor(col.white_dark)self:AddPanel('srp_label',function(b)b:SetText'Ticker'b:SetFont'ui_header.rb'b:SetTextColor(col.black)b:Dock(TOP)b:DockMargin(4,15,4,5)end)self:AddPanel('srp_label',function(b)b:SetText'This will be displayed on the scoreboard and in chat.'b:SetFont'ui_label.r'b:SetTall(10)b:SetTextColor(col.grey_light)b:Dock(TOP)b:DockMargin(4,4,4,4)end)self:AddPanel('srp_textinput',function(c)c:Dock(TOP)c:SetMinMax(3,10)c:SetBackgroundColor(col.white_dark)c:SetTextColor(col.grey_dark)self.Ticker=c end)self:AddPanel('srp_label',function(b)b:SetText'Name'b:SetFont'ui_header.rb'b:SetTextColor(col.black)b:Dock(TOP)b:DockMargin(4,15,4,5)end)self:AddPanel('srp_label',function(b)b:SetText'Displayed in the Org editing and Org preview menus'b:SetFont'ui_label.r'b:SetTall(10)b:SetTextColor(col.grey_light)b:Dock(TOP)b:DockMargin(4,4,4,4)end)self:AddPanel('srp_textinput',function(c)c:Dock(TOP)c:SetMinMax(4,50)c:SetBackgroundColor(col.white_dark)c:SetTextColor(col.grey_dark)self.Name=c end)self:AddPanel('srp_label',function(b)b:SetText'Colour'b:SetFont'ui_header.rb'b:SetTextColor(col.black)b:Dock(TOP)b:DockMargin(4,15,4,5)end)self:AddPanel('srp_label',function(b)b:SetText'The colour used in various Org related UI and chats'b:SetFont'ui_label.r'b:SetTall(10)b:SetTextColor(col.grey_light)b:Dock(TOP)b:DockMargin(4,4,4,4)end)local d=Color(math.random(50,255),math.random(50,255),math.random(50,255))self:AddPanel('srp_button',function(e)e:Dock(TOP)e:SetTall(50)e:SetBackgroundColor(d)e:SetHoverColor(d)e:DockMargin(2,2,2,2)e:SetFont'SSRPForkAwesome'e:SetText(0xf1fc,true)e:LeftClick(function()srp.ui.Create('srp_colorpicker',function(c)c:SetColor(d)c:OnSelect(function(f,col)e:SetBackgroundColor(col)e:SetHoverColor(col)self.SelectedColor=col end)self.ColourPicker=self end)end)self.Colour=e end)self:AddPanel('srp_label',function(b)b:SetText'Model'b:SetFont'ui_header.rb'b:SetTextColor(col.black)b:Dock(TOP)b:DockMargin(4,15,4,5)end)self:AddPanel('srp_label',function(b)b:SetText'The default model that members will be set to'b:SetFont'ui_label.r'b:SetTall(10)b:SetTextColor(col.grey_light)b:Dock(TOP)b:DockMargin(4,4,4,4)end)self:AddPanel('srp_grid',function(g)g:Dock(FILL)g:DockMargin(4,10,4,4)for h,i in ipairs(srp.org.Models)do srp.ui.Create('SpawnIcon',function(c)c:SetSize(64,64)c:SetModel(i.Model)c:SetTooltip(i.Name)g:AddItem(c)end)end;self.Grid=g end)self:AddPanel('srp_button',function(e)e:SetText'Submit'e:SetBackgroundColor(col.black)e:Dock(BOTTOM)e:SetHoverColor(col.blue)e:DockMargin(400,4,4,4)e:LeftClick(function()self:Submit()end)end)hook('OnOrgCreated',self,self.Remove)end;function a:Submit()end;vgui.Register('srp_orgcreation',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupcharacteroverv_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/grouptags_ui.lua:
local a={}function a:Init()self:DockPadding(0,0,0,0)self:SetBackgroundColor(col.midnight)self:AddPanel('srp_dropdown',function(b)b:Dock(TOP)b:OnSelect(function(c,d,e)self.selectGroup=e;self:UpdateDisplay()end)self.groups=b end)self:AddPanel('srp_panel',function(f)f:Dock(TOP)f:DockPadding(6,0,6,0)f:SetBackgroundColor(col.transparent)f:SetTall(30)f:AddPanel('srp_textinput',function(txt)txt:Dock(FILL)txt:DockMargin(0,0,0,0)self.newname=txt end)f:AddPanel('srp_button',function(g)g:Dock(RIGHT)g:SetFont'SSRPForkAwesome'g:SetText(0xf02b,true)g:DockMargin(0,0,0,0)g:SetBackgroundColor(col.green)g:SetHoverColor(col.green_dark)g:LeftClick(function()local h=self.selectGroup.id;local i=self.newname:GetText()local j=(self.selectedcolor||col.grey):ToHex()cmd.Run('gaddtag',h,j,i)end)self.submit=g end)f:AddPanel('srp_button',function(g)g:Dock(RIGHT)g:SetWide(50)g:SetBackgroundColor(col.transparent)g:SetHoverColor(col.transparent)g:DockMargin(0,0,0,0)g:SetFont'SSRPForkAwesome'g:SetText(0xf1fc,true)g:LeftClick(function()srp.ui.Create('srp_colorpicker',function(f)f:SetColor(col.grey)f:OnSelect(function(c,col)g:SetBackgroundColor(col)g:SetHoverColor(col)self.selectedcolor=col end)self.colorpicker=self end)end)self.color=g end)end)self:AddPanel('ui_scrollpanel',function(k)k:Dock(FILL)k:DockMargin(0,25,0,0)self.scroll=k end)hook('OnGroupTagAdded',self,self.UpdateDisplay)hook('OnGroupTagRemoved',self,self.UpdateDisplay)end;function a:OnRemove()hook.Remove('OnGroupTagAdded',self)hook.Remove('OnGroupTagRemoved',self)end;function a:Setup(e)self.group=e;self.groups:AddOption(e:GetName(),e,{},true)local l=e:GetParent()if l then self.groups:AddOption(l:GetName(),l)end;local m=e:GetChildren(true)if m then for n,o in pairs(m)do self.groups:AddOption(o:GetName(),o)end end end;function a:UpdateDisplay()local p=self.scroll:GetCanvas()p:Clear()p:Dock(FILL)for q,r in pairs(self.selectGroup.tags)do srp.ui.Create('srp_grouptag',function(f)f:SetParent(p)f:Dock(TOP)f:Populate(self.selectGroup.id,r)end)end end;vgui.Register('srp_grouptags',a,'srp_panel')local a={}function a:Init()self:SetTall(30)self:SetBackgroundColor(col.transparent)self:DockPadding(6,0,6,0)self:AddPanel('srp_textinput',function(txt)txt:SetBackgroundColor(col.transparent)txt:Dock(FILL)txt:DockMargin(0,0,0,0)self.name=txt end)self:AddPanel('srp_button',function(g)g:SetBackgroundColor(col.red)g:SetHoverColor(col.red)g:SetFont'ui_button_close'g:SetText(0xf2d3,true)g:Dock(RIGHT)g:SetWide(50)g:DockMargin(0,0,0,0)g:LeftClick(function()if self.tag then cmd.Run('gremovetag',self.groupid,self.tag.id)end end)self.btn=txt end)self:AddPanel('srp_button',function(g)g:Dock(RIGHT)g:SetWide(50)g:SetBackgroundColor(col.transparent)g:SetHoverColor(col.transparent)g:DockMargin(0,0,0,0)g:SetText''g:LeftClick(function()srp.ui.Create('srp_colorpicker',function(f)f:SetColor(self.tag.color)f:OnSelect(function(c,col)g:SetBackgroundColor(col)g:SetHoverColor(col)self.selectedcolor=col end)self.colorpicker=self end)end)self.color=g end)end;function a:OnRemove()if IsValid(self.colorpicker)then self.colorpicker:Remove()end end;function a:Populate(s,r)self.tag=r;self.groupid=s;self.name:SetText(r.name)self.color:SetBackgroundColor(r.color)self.color:SetHoverColor(r.color)end;vgui.Register('srp_grouptag',a,'srp_panel')local a={}function a:Init()self:SetTitle'Color Picker'self:SetSize(300,400)self:Center()self:MakePopup()self:AddPanel('DColorMixer',function(f)f:Dock(FILL)f:SetAlphaBar(false)self.color=f end)self:AddPanel('srp_button',function(g)g:Dock(BOTTOM)g:SetText'Apply'g:SetBackgroundColor(col.blue)g:SetHoverColor(col.blue)g:LeftClick(function()local t=self.color:GetColor()self:_OnSelect(Color(t.r,t.g,t.b))self:Remove()end)end)end;function a:SetColor(col)self.color:SetColor(col)end;function a:GetColor()return self.color:GetColor()end;function a:SetValue(col)self:SetColor(col)end;function a:GetValue()return self:GetColor()end;function a:_OnSelect(col)end;function a:OnSelect(u)self._OnSelect=u end;vgui.Register('srp_colorpicker',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/webhooks/webhookadd_ui.lua:
local a={}function a:Init()self:SetBackgroundColor(col.midnight_dark)self:DockMargin(10,10,10,10)self:DockPadding(5,2,5,5)self:AddPanel('srp_label',function(b)b:SetFont'ui_header.r'b:SetText'Create Webhook'b:Dock(TOP)b:SetTall(40)end)self:AddPanel('srp_label',function(b)b:SetFont'ui_label.l'b:SetText'Identifier'b:Dock(TOP)end)self:AddPanel('srp_textinput_rounded',function(c)c:Dock(TOP)c:DockMargin(2,5,2,2)c:SetBackgroundColor(col.midnight)c:SetBorderColor(col.transparent)c:SetMinMax(5,128)self.Identifier=c end)self:AddPanel('srp_label',function(b)b:SetFont'ui_label.l'b:SetText'Discord Endpoint'b:Dock(TOP)end)self:AddPanel('srp_textinput_rounded',function(c)c:Dock(TOP)c:DockMargin(2,5,2,2)c:SetBackgroundColor(col.midnight)c:SetBorderColor(col.transparent)c:SetErrorPosition(430,-10,TEXT_ALIGN_RIGHT)c:SetValidation(webhook.Pattern,"https://discord+.com/api/webhooks/+")self.Endpoint=c end)self:AddPanel('ui_checkbox',function(b)b:Dock(TOP)b:SetText'Mention'b:SizeToContents()b:DockMargin(5,5,5,0)self.Mention=b end)self:AddPanel('srp_label',function(b)b:SetFont'ui_label.l'b:SetText'Types'b:DockMargin(2,10,2,10)b:Dock(TOP)end)self:AddPanel('srp_mask',function(c)c:Dock(FILL)c:Populate(webhook.GetTypeInfo())self.Mask=c end)self:AddPanel('srp_button_rounded',function(c)c:Dock(BOTTOM)c:SetText'Remove'c:SetBackgroundColor(col.red_dark)c:SetHoverColor(col.red)c:DockMargin(0,5,0,5)c:SetDisabled(true)c:LeftClick(function(d)if!self.Endpoint:IsValueValid()then return end;local e=webhook.GetEndpoint(self.Endpoint:GetText())if!e then return end;net.Start'srp.groups.ClearWebhook'net.WriteString(e)net.SendToServer()end)self.Remove=c end)self:AddPanel('srp_button_rounded',function(c)c:Dock(BOTTOM)c:SetText'Submit'c:SetHoverColor(col.green_dark)c:DockMargin(0,5,0,5)c:LeftClick(function(d)if!self.Endpoint:IsValueValid()then return end;local f=self.Identifier:GetText():sub(0,128)local e=self.Endpoint:GetText()local g=self.Mask:GetMask()local h={}if self.Mention:GetChecked()then h.Mention=true end;d:SetDisabled(true,3)net.Start'srp.groups.SetWebhook'net.WriteString(f)net.WriteString(e)net.WriteUInt(g,28)if table.Count(h)>0 then net.WriteBool(true)net.WriteTable(h)else net.WriteBool(false)end;net.SendToServer()end)end)hook('OnGroupWebhookRemoved',self,self.RemoveWebhook)end;function a:Populate(f,i,g,h)self.Identifier:SetText(f)self.Endpoint:SetText(webhook.BaseUrl..i)self.Mask:SetMask(g)self.Remove:SetDisabled(false)if h then self.Mention:SetChecked(h.Mention)else self.Mention:SetChecked(false)end end;function a:RemoveWebhook(i)self.Identifier:SetText''self.Endpoint:SetText''self.Mask:SetMask(0)self.Remove:SetDisabled(true)end;vgui.Register('srp_groupwebhooks_add',a,'srp_panel_rounded')local a={}function a:Init()self:SetBackgroundColor(col.midnight)self:AddPanel('ui_scrollpanel',function(c)c:Dock(FILL)self.scroll=c end)self.Mask=0;self.categories={}self.checkboxes={}end;function a:GetCategory(j)if self.categories[j]then return self.categories[j]end;srp.ui.Create('srp_label',function(b)b:SetFont'ui_label.l'b:SetText(j)b:SetTall(35)b:Dock(TOP)self.scroll:AddItem(b)end)srp.ui.Create('srp_grid',function(k)k:Dock(TOP)k:SetAutoHeight(true)k:SetHeight(25)self.scroll:AddItem(k)self.categories[j]=k end)return self.categories[j]end;function a:Populate(l)for j,m in pairs(l)do if m.Hide||m.CanSee&&m:CanSee()==false then continue end;local n=self:GetCategory(m.Group||'Misc')srp.ui.Create('ui_checkbox',function(c)c:SetText(j:Capitalize())c:SizeToContents()c:SetSize(130,25)c.Mask=webhook.type[m.ID]c.OnChange=function(d)self:RebuildMask()end;n:AddItem(c)table.insert(self.checkboxes,c)end)end end;function a:RebuildMask()local g=0;for o,c in ipairs(self.checkboxes)do if c:GetChecked()then g=bit.bor(g,c.Mask)end end;self.Mask=g end;function a:SetMask(g)self.Mask=g;for o,c in ipairs(self.checkboxes)do c:SetChecked(webhook.HasType(g,c.Mask))end end;function a:GetMask()return self.Mask end;function a:Paint(p,q)draw.RoundedBox(8,0,0,p,q,col.midnight)if info.Dev&&self.Mask then draw.SimpleText('Mask: '..self.Mask,'ui_header.s',p-12,q-12,col.white,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)end end;vgui.Register('srp_mask',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/z_circruits_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/ui/hackinginstallpanel_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/ui/hackingtime_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hangars/ui/hangar_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/compass_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/playtime_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/playtime_sh.lua:
srp.playtime=srp.playtime||{}local a='materials/icon16/clock.png'local b=3600;local c={}local d={{hour=0,name='Test Tube'},{hour=10*b,name='Newborn'},{hour=20*b,name='Nobody'},{hour=30*b,name='Fresh Meat'},{hour=40*b,name='Learner'},{hour=50*b,name='Trainee'},{hour=60*b,name='Battalion Hopper'},{hour=70*b,name='(white)Knight'},{hour=80*b,name='sub 100h noob'},{hour=90*b,name='AOS on sight'},{hour=100*b,name='Trooper'},{hour=200*b,name='Debrief Skipper'},{hour=300*b,name='Filthy ERPer'},{hour=400*b,name='High Grounder'},{hour=500*b,name='501st minus 1'},{hour=600*b,name='Yoda Punter'},{hour=700*b,name='Thunder Cunt'},{hour=800*b,name='Bunks Murderer'},{hour=900*b,name='Ewok Handler'},{hour=1000*b,name='Smug Smuggler',TitleColor=col.red_light:Copy()},{hour=1100*b,name='needs money for a Z6'},{hour=1200*b,name='Baby GM'},{hour=1300*b,name='setnpcdamage 200'},{hour=1400*b,name='Grav Gen Bomber'},{hour=1500*b,name='Somebody? I think'},{hour=1600*b,name='Loud Recon'},{hour=1700*b,name='Bucket of Bolts'},{hour=1800*b,name='Heal God'},{hour=1900*b,name='Retired Commando'},{hour=2000*b,name='Irrelevant in Lore'},{hour=2500*b,name='Moonpool Suicide Watch'},{hour=3000*b,name='Retired Commando'},{hour=3500*b,name='Anyone doing tryouts??'},{hour=4000*b,name='Jabba dese Nuts'},{hour=4500*b,name='Jar Jar Conspirist'},{hour=5000*b,name='Inactive Senator',tag=':star:'},{hour=6000*b,name='Shaakira Shaakira',tag=':star:'},{hour=7000*b,name='that one Jedi who died',tag=':star:'},{hour=8000*b,name='e-girl + twi\'lek = ?',tag=':star:'},{hour=9000*b,name='IT\'S OVER... !!!!',tag=':star:'},{hour=10000*b,name='Chosen One',tag=':crown:'},{hour=11000*b,name='Darth Nolife',tag=':crown:'},{hour=12000*b,name='CIS Janitor',tag=':crown:'},{hour=13000*b,name='Tryout Tryhard',tag=':crown:'},{hour=14000*b,name='it\'s semi srs rp bro chill lol ',tag=':crown:'},{hour=15000*b,name='Legendary',tag=':crown:'},{hour=16000*b,name='/roll rigger',tag=':gem:'},{hour=17000*b,name='Ancient',tag=':gem:'},{hour=18000*b,name='legal on Naboo',tag=':gem:'},{hour=19000*b,name='WANTED: 10,000,000 RC',tag=':gem:'},{hour=20000*b,name='A P E X',tag=':gem:'},{hour=21000*b,name='Bounty Hunter',tag=':gem:'},{hour=22000*b,name='Power Incarnate',tag=':eggplant:'},{hour=23000*b,name='You will never reach this',tag=':eggplant:'},{hour=24000*b,name='I created CWRP',tag=':eggplant:'},{hour=25000*b,name='Battalion Slayer',tag=':eggplant:'},{hour=50000*b,name='Tsukuyomi',tag=':sharingan:'}}function PLAYER:GetPlayRewards()local e=d[1]local f=self:GetPlayTime()if!f then return e end;local g=0;for h=1,#d do local i=d[h]if i.hour<f then e=i;g=h else break end end;return e,g end;function PLAYER:GetPlayRewardString()local j=self:GetPlayRewards()return j&&j.name||''end;hook('CanPlayerSetChatTag',function(k,l)local j,m=k:GetPlayRewards()if!k:IsVIPPlus()then ba.notify_err(k,'You are not VIP+!')return false end;local n=c[l]if n&&n>m then ba.notify_err(k,'You do not have the required playtime for this tag!')return false end end)hook('PlayerGetChatTag',function(k)local j=k:GetPlayRewards()return j&&j.tag||''end)local function o()for p,i in ipairs(d)do srp.titles.Register(i.name,{Time=i.hour,Icon=a})if i.TitleColor then srp.titles.RegisterEffect('Playtime - '..i.hour/60/60 ..' hours',{Time=i.hour,Icon=a,Draw=srp.titles.DrawColor(i.TitleColor)})end;if i.tag&&!c[i.tag]then c[i.tag]=p end end end;hook('OnLoaderCompleted',function()o()srp.titles.RegisterEffect('Yellow Blink - 1000 hours',{Time=1000*b,Icon=a,Draw=srp.titles.DrawFlashing(col.yellow:Copy())})srp.titles.RegisterEffect('Orange Blink - 1250 hours',{Time=1250*b,Icon=a,Draw=srp.titles.DrawFlashing(col.orange:Copy())})srp.titles.RegisterEffect('Red Blink - 1500 hours',{Time=1500*b,Icon=a,Draw=srp.titles.DrawFlashing(col.red:Copy())})srp.titles.RegisterEffect('Green Blink - 1750 hours',{Time=1750*b,Icon=a,Draw=srp.titles.DrawFlashing(col.green:Copy())})srp.titles.RegisterEffect('Blue Blink - 2000 hours',{Time=2000*b,Icon=a,Draw=srp.titles.DrawFlashing(col.blue_light:Copy())})srp.titles.RegisterEffect('Yellow Wave - 2250 hours',{Time=2250*b,Icon=a,Draw=srp.titles.DrawWave(col.yellow:Copy(),.04)})srp.titles.RegisterEffect('Orange Wave - 2500 hours',{Time=2500*b,Icon=a,Draw=srp.titles.DrawWave(col.orange:Copy(),.04)})srp.titles.RegisterEffect('Red Wave - 2750 hours',{Time=2750*b,Icon=a,Draw=srp.titles.DrawWave(col.red:Copy(),.04)})srp.titles.RegisterEffect('Green Wave - 3000 hours',{Time=3000*b,Icon=a,Draw=srp.titles.DrawWave(col.green:Copy(),.04)})srp.titles.RegisterEffect('Blue Wave - 3250 hours',{Time=3250*b,Icon=a,Draw=srp.titles.DrawWave(col.blue_light:Copy(),.04)})local q=Material('materials/galactic/seasonal/christmas/star.png')srp.titles.RegisterEffect('Christmas Star - 5000 hours',{Time=5000*b,Icon=a,Draw=srp.titles.DrawImage(q)})srp.titles.RegisterEffect('Rainbow - 10000 hours',{Time=10000*b,Icon=a,Draw=srp.titles.DrawStaticRainbow})srp.titles.RegisterEffect('Epic - 15000 hours',{Time=15000*b,Icon=a,Draw=srp.titles.DrawGradient('epic_15000hours',270,280,1,.8)})srp.titles.RegisterEffect('Legendary - 20000 hours',{Time=20000*b,Icon=a,Draw=srp.titles.DrawGradient('legend_2000hours',1,30,1,0.7)})srp.titles.Register('Wholesome',{Icon=a,CanAccess=function(self,k)return k:HasUpgrade('valentine_bundle')end})local r=Material('galactic/seasonal/easter/eggs.png')srp.titles.RegisterEffect('Easter Egg',{Icon=a,Draw=srp.titles.DrawImage(r),CanAccess=function(k)return k:HasUpgrade('easter_bundle2')end})local s=Material('galactic/seasonal/easter/happyeaster.png')srp.titles.RegisterEffect('Happy Easter',{Icon=a,Draw=srp.titles.DrawImage(s),CanAccess=function(k)return k:HasUpgrade('easter_bundle2')end})srp.titles.RegisterEffect('Hatching',{Icon=a,Draw=srp.titles.DrawEggs(),CanAccess=function(k)return k:HasUpgrade('easter_bundle2')end})srp.titles.Register('The Eggscellen',{Icon=a,CanAccess=function(self,k)return k:HasUpgrade('easter_bundle2')end})srp.titles.Register('The Eggspert',{Icon=a,CanAccess=function(self,k)return k:HasUpgrade('easter_bundle2')end})srp.titles.RegisterEffect('Valentines Pink',{Icon=a,Draw=srp.titles.DrawGradient('valentines_pink',310,330,.5,.97,1),CanAccess=function(k)return k:HasUpgrade('valentine_bundle')end})local t=Material('galactic/seasonal/valentines/heart.png')srp.titles.RegisterEffect('Valentines Heart',{Icon=a,Draw=srp.titles.DrawImage(t),CanAccess=function(k)return k:HasUpgrade('valentine_bundle')end})local u=Material('galactic/seasonal/valentines/petals.png')srp.titles.RegisterEffect('Valentines Petals',{Icon=a,Draw=srp.titles.DrawImage(u),CanAccess=function(k)return k:HasUpgrade('valentine_bundle')end})local v=Material('galactic/seasonal/valentines/rose.png')srp.titles.RegisterEffect('Valentines Rose',{Icon=a,Draw=srp.titles.DrawImage(v),CanAccess=function(k)return k:HasUpgrade('valentine_bundle')end})local w=Material('galactic/seasonal/valentines/death.png')srp.titles.RegisterEffect('Valentines Death',{Icon=a,Draw=srp.titles.DrawImage(w),CanAccess=function(k)return k:HasUpgrade('valentine_bundle')end})srp.titles.RegisterEffect('May 4th Starwars Font',{Icon=a,Draw=srp.titles.DrawTitleEffect('ui_starwars.r',20),CanAccess=function(k)return k:HasUpgrade('bundle_may4th')end})srp.titles.Register('May The 4th Be With You',{Icon=a,CanAccess=function(self,k)return k:HasUpgrade('bundle_may4th')end})srp.titles.Register('May The Force Be With You',{Icon=a,CanAccess=function(self,k)return k:HasUpgrade('bundle_may4th')end})srp.titles.Register('#NAUGHTY',{Icon=a,CanAccess=function(self,k)return k:SteamID()=='STEAM_0:1:6954972'end})srp.titles.Register('Mandalorian',{Icon=a,CanAccess=function(self,k)return k:SteamID()=='STEAM_0:1:156968957'||k:SteamID()=='STEAM_0:0:44762202'end})srp.titles.Register('Lifeguard',{Icon=a,Battlepass='bp_seasonthree2024',BattlepassLevel=22})srp.titles.Register('Beach Body',{Icon=a,Battlepass='bp_seasonthree2024',BattlepassLevel=34})srp.titles.Register('Beach Buddy',{Icon=a,Battlepass='bp_seasonthree2024',BattlepassLevel=34})srp.titles.Register('Beach Boy',{Icon=a,Battlepass='bp_seasonthree2024',BattlepassLevel=6})srp.titles.Register('Sand Castle Engineer',{Icon=a,Battlepass='bp_seasonthree2024',BattlepassLevel=22})srp.titles.Register('Heatwave',{Icon=a,Battlepass='bp_seasonthree2024',BattlepassLevel=8})srp.titles.Register('Jaws',{Icon=a,Battlepass='bp_seasonthree2024',BattlepassLevel=42})srp.titles.Register('Ocean Man',{Icon=a,Battlepass='bp_seasontwo2023',BattlepassLevel=21})srp.titles.Register('Sunshine',{Icon=a,Battlepass='bp_seasontwo2023',BattlepassLevel=5})srp.titles.Register('Boo-tiful',{Icon=a,Battlepass='bp_halloween2024',BattlepassLevel=0})srp.titles.Register('Creepin\' it real',{Icon=a,Battlepass='bp_halloween2024',BattlepassLevel=0})srp.titles.Register('Mummy of the year',{Icon=a,Battlepass='bp_halloween2024',BattlepassLevel=0})srp.titles.Register('Basic witch',{Icon=a,Battlepass='bp_halloween2024',BattlepassLevel=0})srp.titles.Register('Lazy Bones',{Icon=a,Battlepass='bp_halloween2024',BattlepassLevel=0})srp.titles.Register('Winter Wonderland',{Icon=a,Battlepass='bp_winter2024',BattlepassLevel=6})srp.titles.Register('Scrooge',{Icon=a,Battlepass='bp_winter2024',BattlepassLevel=13})srp.titles.Register('Naughty List',{Icon=a,Battlepass='bp_winter2024',BattlepassLevel=19})srp.titles.Register('Nice List',{Icon=a,Battlepass='bp_winter2024',BattlepassLevel=19})srp.titles.Register('Snowball Sniper',{Icon=a,Battlepass='bp_winter2024',BattlepassLevel=27})srp.titles.Register('Chimney Crawler',{Icon=a,Battlepass='bp_winter2024',BattlepassLevel=29})srp.titles.Register('Frostbite',{Icon=a,Battlepass='bp_winter2024',BattlepassLevel=29})srp.titles.Register('Snowflake',{Icon=a,Battlepass='bp_winter2024',BattlepassLevel=6})srp.titles.Register('Turkey Gobbler',{Icon=a,Battlepass='bp_winter2024',BattlepassLevel=30})srp.titles.Register('Gingerbread Trooper',{Icon=a,Battlepass='bp_winter2024',BattlepassLevel=13})local x=Material('materials/galactic/seasonal/summer/summer4.png')srp.titles.RegisterEffect('umberella',{Icon=a,Draw=srp.titles.DrawImage(x),Battlepass='bp_seasonthree2024',BattlepassLevel=14})local y=Material('materials/galactic/seasonal/summer/gasmask.png')srp.titles.RegisterEffect('gasmask',{Icon=a,Draw=srp.titles.DrawImage(y),Battlepass='bp_seasonthree2024',BattlepassLevel=38})local z=Material('materials/galactic/seasonal/summer/shark.png')srp.titles.RegisterEffect('shark',{Icon=a,Draw=srp.titles.DrawImage(z),Battlepass='bp_seasonthree2024',BattlepassLevel=37})local A=Material('materials/galactic/seasonal/summer/octopus.png')srp.titles.RegisterEffect('octopus',{Icon=a,Draw=srp.titles.DrawImage(A),Battlepass='bp_seasonthree2024',BattlepassLevel=21})local B=Material('materials/galactic/seasonal/summer/crab.png')srp.titles.RegisterEffect('Crab',{Icon=a,Draw=srp.titles.DrawImage(B),Battlepass='bp_seasontwo2023',BattlepassLevel=20})local C=Material('materials/galactic/seasonal/summer/starfish.png')srp.titles.RegisterEffect('Star Fish',{Icon=a,Draw=srp.titles.DrawImage(C),Battlepass='bp_seasontwo2023',BattlepassLevel=7})local D=Material('materials/galactic/seasonal/summer/sea-turtle.png')srp.titles.RegisterEffect('Sea Turtle',{Icon=a,Draw=srp.titles.DrawImage(D),Battlepass='bp_seasontwo2023',BattlepassLevel=36})local E=Material('materials/galactic/seasonal/summer/pheonix.png')srp.titles.RegisterEffect('Pheonix',{Icon=a,Draw=srp.titles.DrawImage(E),Battlepass='bp_seasontwo2023',BattlepassLevel=37})end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/notifications/ui/bubbles_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/voting/voting_cl.lua:
srp.voting=srp.voting||{}local a={}net('srp.voting.Create',function()local b={id=net.ReadString(),Title=net.ReadString(),Question=net.ReadString(),Duration=net.ReadUInt(10),RequiredVotes=net.ReadUInt(10)}a[b.id]=b;a[b.id].Panel=srp.notif.FlashConfirm(b.id,b.Title,b.Question,b.Duration,'Vote Yes',function()if b then net.Start'srp.voting.MakeVote'net.WriteString(b.id)net.SendToServer()end end)hook.Run('OnVoteCreated',b)end)net('srp.voting.SomeoneVoted',function()local b=a[net.ReadString()]local c=net.ReadTerm()if b then srp.notif.FlashConfirm(b.id,b.Title,c,5,'Close')end end)net('srp.voting.Ended',function()a[net.ReadString()]=nil end)net('srp.voting.Remove',function()local d=net.ReadString()if a[d]&&IsValid(a[d].Panel)then a[d].Panel:Remove()a[d]=nil end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/weaponswitch/ui/weporganiser_wep_ui.lua:
local a={}a.WeaponPanel=true;function a:Init()self:SetTall(30)self:DockMargin(0,0,0,1)self:SetBackgroundColor(col.midnight_dark)self:AddPanel('srp_label',function(b)b:Dock(FILL)b:SetText''b:SetMouseInputEnabled(false)self.NameLbl=b end)end;function a:Populate(c,d)self.WepData=c;self.Data={Name=d||c.Name||util.GetPrintName(c.ClassName)||c.ClassName,Class=c.ClassName,Slot=c.Slot||1,Order=c.Order||c.SlotPos||1}self.NameLbl:SetText(self.Data.Name)self:UpdateVisual()end;function a:UpdateVisual()self.Equipped=LocalPlayer():HasWeapon(self.Data.Class)if self.Equipped then self:SetBorderColor(col.green)end end;function a:SetSlot(e)self.Data.Slot=i;self:UpdateVisual()end;function a:SetOrder(i)self.Data.Order=i;self:UpdateVisual()end;function a:GetOrder()return self.Data.Order end;function a:SetSlotPanel(f)self.slotPnl=f;self:SetBackgroundColor(col.midnight_dark)end;function a:GetSlotPanel()return self.slotPnl end;function a:Copy()local g=srp.ui.Create('srp_weaponorganizer_wep')g:Populate(self.WepData,self.Data.Name)return g end;function a:OnMousePressed(h)if h==MOUSE_LEFT then self:StartDragAndDrop()elseif h==MOUSE_RIGHT then local j=self:GetSlotPanel()if j then j:RemovePnl(self)end end end;function a:OnMouseReleased(h)if h==MOUSE_LEFT then self:StopDragAndDrop()end end;function a:ReceivedDragger(g)if!g.WeaponPanel then return end;local j=self:GetSlotPanel()if!j then return end;local k=g:GetSlotPanel()if j==k then j:Move(g,self)return end;j:Add(g:Copy(),self.Data.Order)if k then k:RemovePnl(g)end end;vgui.Register('srp_weaponorganizer_wep',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/items/scrapping/scrapping_cl.lua:
srp.scrapping=srp.scrapping||{}function srp.scrapping.Start(a,b,c)net.Start'srp.scrapping.Start'net.WriteEntity(a)net.WriteItem(b)net.WriteUInt(c,32)net.SendToServer()end;function srp.scrapping.End(a)net.Start'srp.scrapping.End'net.WriteEntity(a)net.SendToServer()end;net('srp.scrapping.Start',function()local a=net.ReadEntity()local b=net.ReadItem()hook.Run('OnScrappingStart',a,b)end)net('srp.scrapping.End',function()local a=net.ReadEntity()hook.Run('OnScrappingEnd',a)end)net('srp.scrapping.Progress',function()local a=net.ReadEntity()local d=net.ReadItem()local b=net.ReadItem()local c=net.ReadUInt(32)hook.Run('OnScrappingProgress',a,d,b,c)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/ui/playerbutton_ui.lua:
local a={}function a:Init()self:SetTall(40)self:DockPadding(4,4,4,4)self:DockMargin(0,0,0,2)self:SetBackgroundColor(col.white_dark)self:SetHoverColor(col.white)self:SetBorderColor(col.grey_light)self:SetTextColor(col.black)self:SetSelectedBackgroundColor(col.white)self:SetContentAlignment(4)self:SetFont'ui_label.r'self.lbl:DockMargin(0,0,0,10)self.tag=''self.ctid=''self:SetText'Temp Text'self:AddPanel('ui_imagebutton',function(b)b:SetSkin'SUP'b:Dock(LEFT)b:SetWide(32)b:DockMargin(0,0,10,0)self.avatar=b end)self:SetAlpha(0)self:AlphaTo(255,.2,0)end;function a:Populate(c,d)self.character=c;self.citations=d;self.ctid='#'..c.characterid;self.tag=c.steamid;self.avatar:SetSteamID64(util.SteamIDTo64(c.steamid),64)self:SetText(c.name)end;function a:PaintOver(e,f)if self.tag then draw.SimpleText(self.tag,'ui_label.s',e-10,f/2,col.grey_light,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)draw.SimpleText(self.ctid,'ui_label.s',45,f/2+6,col.grey_light,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)end end;vgui.Register('srp_jailbutton',a,'srp_button')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/leaderboard/ui/leaderboard_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loadouts/ui/loadout_ui.lua:
local a={}local b=Material('materials/gui/lmb.png','smooth noclamp')local c=col.midnight;local d=col.midnight_dark;local e={'primary','secondary','specialty','grenade_1','grenade_2','utility_1','utility_2','utility_3'}function a:Init()self:SetTitle'My Loadout'self:SetSize(1220,700)self:DockPadding(1,30,1,1)self:SetBackgroundColor(col.white_dark)self:SetBorderColor(col.grey_light)self:Center()self:MakePopup()self:AddPanel('srp_panel',function(f)f:Dock(LEFT)f:SetWide(325)f:DockPadding(0,0,0,0)f:DockMargin(0,0,0,0)f:SetBackgroundColor(d)f:AddPanel('srp_panel',function(f)f:SetTall(0)f:Dock(TOP)f:DockPadding(0,0,0,0)f:DockMargin(0,0,0,0)f:SetBackgroundColor(col.transparent)f:SetVisible(false)f:AddPanel('srp_panel',function(f)f:Dock(LEFT)f:SetWide(90)f:SetBackgroundColor(col.transparent)f:DockMargin(0,0,0,0)f:DockPadding(0,0,0,0)self.specialtyItem=f end)f:AddPanel('srp_label',function(g)g:SetFont'ui_header.rb'g:Dock(TOP)g:SetContentAlignment(1)g:SetTall(40)g:SetTextColor(col.white)g:SetText'Battalion Specialty'self.specialtyName=g end)f:AddPanel('srp_label',function(g)g:SetFont'ui_label.r'g:Dock(FILL)g:SetContentAlignment(7)g:SetTextColor(col.white)g:SetText'This is your battalion specialty item.'end)self.specialty=f end)f:AddPanel('ui_scrollpanel',function(f)f:DockPadding(0,0,0,0)f:DockMargin(0,0,0,0)f:Dock(FILL)self.scroll=f end)end)self:AddPanel('srp_loadout_overview',function(f)f:Dock(FILL)self.overview=f end)self:AddPanel('srp_button_rounded',function(h)h:SetText'Clear Loadout'h:SetBackgroundColor(col.midnight)h:SetHoverColor(col.midnight_dark)h:SetBorderColor(col.transparent)h:SetSize(120,27)h:SetPos(1220-150,3)h:LeftClick(function(i)i:SetDisabled(true,2)cmd.Run'loadoutclear'end)end)self:RefreshData()hook('OnLoadoutPreview',self,self.RefreshData)hook('OnPlayerGroupChanged',self,self.RefreshData)hook('OnCharacterSelected',self,self.RefreshData)hook('OnLoadoutCleared',self,self.RefreshData)hook('OnPlayerLeftGroup',self,function(i,j)if LocalPlayer():CharacterID()==j then i:RefreshData()end end)end;function a:OnRemove()hook.Remove('OnLoadoutPreview',self)hook.Remove('OnLoadoutCleared',self)hook.Remove('OnPlayerLeftGroup',self)hook.Remove('OnPlayerGroupChanged',self)hook.Remove('OnCharacterSelected',self)end;function a:RefreshData()local k=srp.loadouts.GetGroupLoadout()if k then self:UpdateItems(k)end end;function a:DisplaySpecialty(l,m)local n=table.Count(m.items)self.specialtyItem:Clear()self.specialty:SetVisible(n>0)self.specialty:SetTall(n>0&&100||0)local o=table.GetKeys(m.items)[1]local p=srp.items.Get(o)local q=m.items[o]local r=LocalPlayer():GetGroup()local s=r&&r.color||col.blue_light;self.specialtyItem:AddPanel('srp_loadout_item',function(t)t.parentid=m.parentid;t.selectedColor=s;t.DrawBackground=true;t:Dock(FILL)t:SetItem(l,p,istable(q)&&q.cost||q)end)end;function a:UpdateItems(k)local u=self.scroll:GetCanvas()u:Clear()local v=false;for w=1,#e do local x=e[w]local m=k[x]if!m then continue end;if m.canusemultiselect&&!m:canusemultiselect(k.id)then continue end;if x=='specialty'then if table.Count(m.items)>0 then self:DisplaySpecialty(x,m)end;continue end;srp.ui.Create('srp_loadout_slots',function(y)y:SetTitle(m.name)y:SetParent(u)y:Dock(TOP)y:Populate(x,m)end)end end;function a:UpdateOverview(k)self.overview:Populate(k)end;function a:Paint(z,A)derma.SkinHook('Paint','Frame',self,z,A)surface.SetDrawColor(col.grey_light)surface.DrawOutlinedRect(0,0,z,A)end;vgui.Register('srp_loadout',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/doors/doors_sh.lua:
srp.doors=srp.doors||{}srp.doors.DrawPanels=srp.doors.DrawPanels||{}srp.doors.InfoPanels=srp.doors.InfoPanels||{}srp.doors.Metainfo={}srp.doors.afktime=9000;local a=util.TraceLine;local b={}local c={func_door=true,func_door_rotating=true}nw.Register('door.name'):Write(net.WriteString):Read(net.ReadString)function PLAYER:GetPropertyID()return self.DoorGroup end;function PLAYER:GetProperty()local d=self.DoorGroup;return d&&srp.doors.GetGroup(d)end;function ENTITY:GetDoorMeta()return srp.doors.Metainfo[self:MapCreationID()]||{DoorInfo={}}end;function ENTITY:GetGroupInfo()return srp.doors.GetGroup(self:GetDoorMeta().GroupID)||{Access={}}end;function ENTITY:DrawDoor()return self:GetDoorMeta().DoorInfo.DrawFix end;function ENTITY:IsDoor()if!IsValid(self)then return false else return c[self:GetClass()]end end;function ENTITY:IsBusiness()return self:GetGroupInfo().Business end;function ENTITY:GetDoorID()return self:GetDoorMeta().GroupID end;function ENTITY:GetDoorButtonPos()return self:GetDoorMeta().DoorInfo.DrawPos end;function ENTITY:IsPropertyOwnable()if!self:IsDoor()then return end;local e=self:GetDoorMeta()return e.GroupID!=nil&&!e.DoorInfo.Slave end;function ENTITY:GetDoorOwner()return self:GetGroupInfo().Owner end;function ENTITY:GetPropertyName()return self:GetGroupInfo().Name end;function ENTITY:GetPropertyDescription()return self:GetGroupInfo().Description end;function ENTITY:GetPropertyPrice()return self:GetGroupInfo().Price||0 end;function ENTITY:GetPropertyPrettyPrice()return self:GetGroupInfo().PrettyPrice||'0'end;function ENTITY:GetPropertyColor()return self:GetGroupInfo().Color end;function ENTITY:IsPublic()return self:GetGroupInfo().Public end;function ENTITY:HasDoorAccess(f)local g=self:GetGroupInfo()return g.Owner==f||g.Access[f:SteamID()]end;function ENTITY:GetLinkedDoors()local h=self:GetName()return table.Filter(ents.FindByClass(self:GetClass()),function(i)return i!=self&&h==i:GetName()end)end;function srp.doors.AddDrawPanel(d,j,k,l)if isfunction(j)then srp.doors.DrawPanels[d]={id=d,GetPosition=j,DrawPanel=k}else srp.doors.InfoPanels[d]={id=d,Pos=j,Ang=k,DrawPanel=l}end end;function srp.doors.AddGroup(m)if m.Map&&m.Map!=info.Map then return end;m.Name=m.Name||'Unknown Name'm.Description=m.Description||'No Description'm.Price=m.Price||1000;m.PrettyPrice=string.Comma(m.Price)m.Doors=m.Doors||{}m.Color=(m.Color||col.white):Copy()m.Access={}m.id=table.insert(b,m)end;function srp.doors.GetGroup(d)return b[d]end;function srp.doors.GetGroups()return b end;function srp.doors.HasAccess(f,d)local g=srp.doors.GetGroup(d)if!g then return end;return g.Owner==f||g.Access[f:SteamID()]end;function srp.doors.PopulateGroups()for n,m in ipairs(b)do for o,p in ipairs(m.Doors)do srp.doors.Metainfo[p.id]={GroupID=n,DoorInfo=p}end end end;hook('InitPostEntity',srp.doors.PopulateGroups)timer.Simple(2,function()srp.doors.PopulateGroups()end)timer.Simple(5,function()end)local q={}local r=Angle(0,90,90)srp.doors.AddDrawPanel('default',function(i)local s,t;local u=i:LocalToWorld(i:OBBCenter())u.z=u.z+17.5;q.start=LocalPlayer():GetPos()+LocalPlayer():OBBCenter()q.endpos=u;q.filter=LocalPlayer()local v=a(q)local s=v.HitPos+v.HitNormal;local t=v.HitNormal:Angle()+r;if v.Entity!=i||u:DistToSqr(v.HitPos)>100 then return false end;return true,s,t end,function(i,w)srp.doors.DrawDefault(i,w)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/funcmodules/oxygen_cl.lua:
srp.funcmodules=srp.funcmodules||{}local a=0;sound.Add({name='oxygen_breath',channel=CHAN_STATIC,volume=.6,level=80,pitch=100,sound=Sound('player/breathe1.wav')})function srp.funcmodules.EnableOxygen()hook.Remove('EntityEmitSound','srp.funcmodules.oxygenEffect')timer.Simple(2,function()if srp.funcmodules.oxygen then LocalPlayer():StopLoopingSound(a)end end)end;function srp.funcmodules.DisableOxygen()a=LocalPlayer():StartLoopingSound('oxygen_breath')hook('EntityEmitSound','srp.funcmodules.oxygenEffect',function(b)b.DSP=103;b.pitch=60;return true end)end;net('srp.funcmodules.oxygen',function()if net.ReadBit()==1 then srp.funcmodules.EnableOxygen()else srp.funcmodules.DisableOxygen()end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/mapchange/mapchange_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/mapchange/ui/maprow_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/npc/npcs_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/npc/dialogues/dialoguecustom_sh.lua:
srp.dialogue=srp.dialogue||{}function srp.dialogue.ParseCustomDialogueTree(a)local b=util.JSONToTable(a)PrintTable(b)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/patrols/patrols_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/patrols/ui/routepath_ui.lua:
local a={}function a:Init()self.Points={}self.StepCount=100;self.PointCount=10;self.ProgressCount=0;self:DockPadding(0,0,0,0)self:SetSize(600,40)self:SetPos(0,4)self:CenterHorizontal()self:SetBackgroundColor(col.grey_dark)self:AddPanel('srp_button_rounded',function(b)b:Dock(LEFT)b:SetWide(98)b:DockMargin(0,0,0,0)b:SetText'Patrol Progress'b:SetFont'ui_header.s'b:LeftClick(function(c)c:SetDisabled(true,2)srp.patrols.GetPlayers()end)b.Paint=function(c,d,e)draw.Box(10,35,d*(self.PercentCount||0)-20,2,col.white)end end)end;function a:SetCount(f)self.PointCount=f end;function a:SetProgress(f)self.ProgressCount=f-1 end;local g,h=2,24;local i=Color(255,255,255,0)local j=0;function a:Paint(d,e)self.PercentCount=Lerp(RealFrameTime()/1*3,self.PercentCount||0,self.ProgressCount/self.PointCount)local k=(d-100)/self.StepCount;local l=math.Round(self.StepCount*self.PercentCount)j=j+RealFrameTime()/1*20;for m=1,self.StepCount do i.a=50+100*self.PercentCount;surface.SetDrawColor(self.PercentCount>.99&&col.pink||m==l&&col.blue||m<l&&col.green||i)local n=96+k*m;local o=m<=l&&0||4+math.cos(m+j)*8;surface.DrawRect(n-g/2,(e-(h-o))/2,g,h-o)end end;function a:FadeOut()self.ProgressCount=self.PointCount;self:AlphaTo(0,2,2,function()if IsValid(self)then self:Remove()end end)end;vgui.Register('srp_routeinfo',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/sounds_sh.lua:
if CLIENT then function GM:PlayerFootstep(a,b,c,d,e,f)if d:find('snow')||d:find('sand')||d:find('grass')||d:find('dirt')||d:find('concrete')||d:find('slosh')then return end;if IsValid(a)then local g=a:GetAllegiance()local h=g&&g:GetFootstep(a)if h then EmitSound(h,b,a:EntIndex(),CHAN_BODY,e,SNDLVL_30dB,0,100)return true elseif h==false then return true end end end else hook('PlayerDeath','srp.player.deathsound',function(a)if math.random()>.1 then return end;local g=a:GetAllegiance()local i=g&&g:GetDeathSound(a)if i then a:EmitSound(i,75,100,1,CHAN_VOICE)end end)end;function GM:PlayerDeathSound()return true end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/animations/boneanim_sh.lua:
srp.anim=srp.anim||{}local a,b=Vector(),Angle()nw.Register'srp.customboneanim.id':Write(net.WriteString):Read(net.ReadString):SetPlayer():SetHook('OnCustomBoneAnimationChanged')srp.anim.info={handsonhead={Movement=true,MovementSpeed=50,Bones={default={{name="ValveBiped.Bip01_R_Clavicle",ang=Angle(11.000000,31.000000,180.000000)},{name="ValveBiped.Bip01_R_UpperArm",ang=Angle(11.000000,4.000000,0.000000)},{name="ValveBiped.Bip01_R_Forearm",ang=Angle(-107.000000,0.000000,0.000000)},{name="ValveBiped.Bip01_R_Hand",ang=Angle(0.000000,-11.000000,0.000000)},{name="ValveBiped.Bip01_L_Clavicle",ang=Angle(-11.000000,31.000000,-180.000000)},{name="ValveBiped.Bip01_L_UpperArm",ang=Angle(0.000000,-19.000000,0.000000)},{name="ValveBiped.Bip01_L_Forearm",ang=Angle(100.000000,4.000000,-4.000000)}}}},cuffed={Movement=true,MovementSpeed=100,CanCancel=false,Bones={default={{name='ValveBiped.Bip01_R_UpperArm',ang=Angle(-19.000000,15.000000,0.000000)},{name='ValveBiped.Bip01_R_Forearm',ang=Angle(-27.000000,0.000000,0.000000)},{name='ValveBiped.Bip01_R_Hand',ang=Angle(0.000000,38.000000,0.000000)},{name='ValveBiped.Bip01_L_UpperArm',ang=Angle(19.000000,11.000000,0.000000)},{name='ValveBiped.Bip01_L_Forearm',ang=Angle(27.000000,0.000000,0.000000)},{name='ValveBiped.Bip01_L_Hand',ang=Angle(0.000000,31.000000,-54.000000)}}},OverrideSpeed=function(self,c)return c:IsCuffedLegs()&&0||self.MovementSpeed end},atease={Movement=false,MovementSpeed=0,NoJump=true,NoCrouch=true,Bones={default={{name='ValveBiped.Bip01_L_UpperArm',ang=Angle(5,20,0)},{name='ValveBiped.Bip01_L_Forearm',ang=Angle(42,-50,0)},{name='ValveBiped.Bip01_L_Hand',ang=Angle(25,0,0)},{name='ValveBiped.Bip01_R_UpperArm',ang=Angle(-5,20,0)},{name='ValveBiped.Bip01_R_Forearm',ang=Angle(-42,-30,0)},{name='ValveBiped.Bip01_R_Hand',ang=Angle(-45,0,0)},{name='ValveBiped.Bip01_R_Thigh',ang=Angle(5,0,0)},{name='ValveBiped.Bip01_L_Thigh',ang=Angle(-5,0,0)}}}},meditate={Movement=false,MovementSpeed=0,NoJump=true,NoCrouch=true,Animation='sit_zen',Bones={}},carrying={Movement=true,MovementSpeed=32,NoJump=true,NoCrouch=true,Bones={default={{name='ValveBiped.Bip01_L_UpperArm',ang=Angle(5,15,0)},{name='ValveBiped.Bip01_L_Forearm',ang=Angle(55,0,0)},{name='ValveBiped.Bip01_L_Hand',ang=Angle(180,90,200)},{name='ValveBiped.Bip01_R_UpperArm',ang=Angle(-5,15,0)},{name='ValveBiped.Bip01_R_Forearm',ang=Angle(-55,0,0)},{name='ValveBiped.Bip01_R_Hand',ang=Angle(-180,90,-200)}}},OverrideSpeed=function(self,c)local d=c:GetTalentPassive('PackageSpeed')return self.MovementSpeed*(1+d)end},carrying_mrp={Movement=true,MovementSpeed=100,NoJump=true,NoCrouch=false,Bones={default={}},OverrideSpeed=function(self,c)local d=c:GetTalentPassive('PackageSpeed')return self.MovementSpeed*(1+d)end},halloweenslow={Movement=true,MovementSpeed=140,NoJump=true,NoCrouch=false,Bones={default={}}},wait={Movement=false,MovementSpeed=140,NoJump=true,NoCrouch=true,Bones={default={}}},slowwalk={Movement=true,MovementSpeed=60,NoJump=true,NoCrouch=true,Bones={default={}}},sitting={Movement=false,MovementSpeed=0,NoJump=true,NoCrouch=true,Bones={default={{name='ValveBiped.Bip01_L_UpperArm',ang=Angle(-20,-60,40)},{name='ValveBiped.Bip01_L_Forearm',ang=Angle(0,0,0)},{name='ValveBiped.Bip01_R_UpperArm',ang=Angle(20,-55,-40)},{name='ValveBiped.Bip01_R_Forearm',ang=Angle(-42,-30,0)},{name='ValveBiped.Bip01_R_Thigh',ang=Angle(0,-90,0)},{name='ValveBiped.Bip01_L_Thigh',ang=Angle(-5,-90,0)}}}},handsup={Movement=true,MovementSpeed=15,NoJump=true,NoCrouch=true,Bones={default={{name='ValveBiped.Bip01_L_UpperArm',ang=Angle(-100,-80,-80)},{name='ValveBiped.Bip01_L_Forearm',ang=Angle(100,0,0)},{name='ValveBiped.Bip01_R_UpperArm',ang=Angle(100,-220,-50)},{name='ValveBiped.Bip01_R_Forearm',ang=Angle(-100,0,0)}}}},crossedarms={Movement=false,NoJump=true,NoCrouch=true,Bones={default={{name='ValveBiped.Bip01_R_Forearm',ang=Angle(-43.779933929443,-107.18412780762,15.918969154358)},{name='ValveBiped.Bip01_R_UpperArm',ang=Angle(20.256689071655,-57.223915100098,-6.1269416809082)},{name='ValveBiped.Bip01_L_UpperArm',ang=Angle(-28.913911819458,-59.408206939697,1.0253102779388)},{name='ValveBiped.Bip01_R_Thigh',ang=Angle(4.7250719070435,-6.0294013023376,-0.46876749396324)},{name='ValveBiped.Bip01_L_Thigh',ang=Angle(-7.6583762168884,-0.21996378898621,0.4060270190239)},{name='ValveBiped.Bip01_L_Forearm',ang=Angle(51.038677215576,-120.44165039063,-18.86986541748)},{name='ValveBiped.Bip01_R_Hand',ang=Angle(14.424224853516,-33.406204223633,-7.2624106407166)},{name='ValveBiped.Bip01_L_Hand',ang=Angle(25.959447860718,31.564517974854,-14.979378700256)}}}}}local function e(c,f,g)c.animpercent=math.Clamp(math.Approach(c.animpercent||0,f&&0||1,FrameTime()*15),0,1)if f&&!c.LastCustomAnim then c.animpercent=nil;c:InvalidateBoneCache()return end;local h=c:GetModel()local i=f&&srp.anim.info[c.LastCustomAnim]||srp.anim.info[g]local j=i.Bones&&i.Bones[h]||i.Bones.default;if j then for k=1,#j do local l=j[k]local m,n=l.name,l.ang||b;local o=c:LookupBone(m)if o&&o!=-1 then c:ManipulateBoneAngles(o,n*c.animpercent)end end end;if f&&c.animpercent<=0 then c.animpercent=nil;c:InvalidateBoneCache()end;if!f&&i.Animation then local p,q=c:LookupSequence(i.Animation)if p&&p>-1 then c:ResetSequence(p)c:ResetSequenceInfo()c:SetCycle(0)c:SetPlaybackRate(1)c:SetSequence(p)end end end;function PLAYER:SetCustomBoneAnim(g)if self:GetCustomBoneAnim()then return false end;if srp.anim.info[g]then self.animpercent=0;self:SetNetVar('srp.customboneanim.id',g)return true end end;function PLAYER:RemoveCustomBoneAnim(r)self.LastCustomAnim=self:GetNetVar'srp.customboneanim.id'if r&&r!=self.LastCustomAnim then return false else self.animpercent=1;self:SetNetVar('srp.customboneanim.id',nil)return true end end;function PLAYER:GetCustomBoneAnim()return self:GetNetVar'srp.customboneanim.id'end;function PLAYER:GetCustomBoneAnimTable()local s=self:GetNetVar'srp.customboneanim.id'if s then return srp.anim.info[s]end end;hook('PlayerShouldTaunt',function(c)if c:GetCustomBoneAnim()then return false end end)hook('StartCommand',function(c,t)if!c:GetCustomBoneAnim()then return end;local u=c:GetCustomBoneAnimTable()if!u then return end;if u.NoJump then t:RemoveKey(IN_JUMP)end;if u.NoCrouch then t:RemoveKey(IN_DUCK)end end)hook('PlayerTick','srp.boneanim.Speed',function(c,v)if!c:GetCustomBoneAnim()then return end;local u=c:GetCustomBoneAnimTable()if!u then return end;if SERVER&&u&&u.CanCancel!=false&&v:KeyDown(IN_ATTACK)&&!c:IsCarrying()then c:RemoveCustomBoneAnim()return end;if!u.Movement then v:SetMaxSpeed(0)v:SetMaxClientSpeed(0)elseif u.MovementSpeed then local w=u.OverrideSpeed&&u:OverrideSpeed(c)||u.MovementSpeed;v:SetMaxSpeed(w)v:SetMaxClientSpeed(w)return true end end)hook('PlayerSetModel',function(c)if c:GetCustomBoneAnim()then c:RemoveCustomBoneAnim()end end)hook('OnCustomBoneAnimationChanged','srp.anim.SaveOldBoneAnim',function(c,x,y)if!IsValid(c)then return end;for k=0,c:GetBoneCount()-1 do c:ManipulateBoneAngles(k,Angle())end;c.LastCustomAnim=y;if CLIENT&&!x then c:StopAndDestroyParticles()end end)hook('Think','srp.anim.UpdateBoneAnimation',function()for z,c in ipairs(player.GetVisiblePlayers())do if!IsValid(c)then continue end;local A=c:GetCustomBoneAnim()local B=c.animpercent&&c.animpercent>0;if A||B then e(c,!A&&B,A)end end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/animations/ui/boneanimplace_ui.lua:
local a={}function a:Init()self:SetSize(1200,720)self:Center()self:MakePopup()self:SetTitle'Bone Adjustments'self:SetBackgroundColor(col.midnight_light)self:AddPanel('srp_panel_rounded',function(b)b:Dock(LEFT)b:SetWide(200)b:SetBackgroundColor(col.midnight)b:AddPanel('srp_button_rounded',function(c)c:Dock(TOP)c:SetText'Get Config'c:SetBackgroundColor(col.blue)c:SetHoverColor(col.blue_dark)c:LeftClick(function()self:UpdateBone()end)end)b:AddPanel('srp_button_rounded',function(c)c:Dock(TOP)c:SetText'Reset'c:SetBackgroundColor(col.red)c:SetHoverColor(col.red_dark)c:LeftClick(function()for d,b in ipairs(self.Grid:GetChildren())do b:Reset()end end)end)b:AddPanel('ui_scrollpanel',function(e)e:Dock(FILL)srp.ui.Create('srp_grid',function(f)f:Dock(TOP)f:SetAutoHeight(true)e:AddItem(f)self.Grid=f end)end)end)self:AddPanel('srp_modelpanel',function(g)g:Dock(FILL)g:SetCamPos(Vector(200,0,0))g:SetLookAt(Vector(0,0,0))g:SetFOV(40)g:SetCanControl(true)self.MDL=g end)self:Populate()end;function a:Populate()self.Player=self.MDL:AddModel(LocalPlayer():GetModel(),Vector(0,0,-35),Angle())self.Player:SetupBones()self.Player:InvalidateBoneCache()timer.Simple(0,function()for h=1,self.Player:GetBoneCount()do self:AddBoneChanger(h-1)end end)end;function a:AddBoneChanger(i)if self.Player:GetBoneName(i):find('Finger')then return end;self:AddPanel('srp_boneanim_rotation',function(b)b:Populate(i,self.Player,self)self.Grid:AddItem(b,true)end)end;function a:UpdateBone()local j=self.Grid:GetChildren()local k={Bones={default={}}}local l=[[
{
	Bones = {]]for d,b in ipairs(j)do local m=b.BoneID;local n=b.BoneAngle;local o=self.Player:GetBoneName(m)if n==Angle()then continue end;table.insert(k.Bones.default,{id=m,name=o,ang=n})l=l..Format('\n\t{name = %q, ang = Angle(%f, %f, %f)},',o,n.p,n.y,n.r)end;l=l..'\n\t}\n}'print(l)SetClipboardText(l)return k end;function a:SelectBone(p)local q=self.HoveredBone;if q==p then return end;self.HoveredBone=p;if q then self.Player:ManipulateBoneScale(q,Vector(1,1,1))end end;local r=Vector(1,1,1)function a:Think()if!self.HoveredBone then return end;r.x=1+math.cos(CurTime()*10)*.1;r.y=r.x;r.z=r.x;self.Player:ManipulateBoneScale(self.HoveredBone,r)end;vgui.Register('srp_boneanim',a,'srp_window')local a={}function a:Init()self:SetTall(110)self:SetBackgroundColor(col.midnight_dark)self:AddPanel('srp_label',function(s)s:SetText'Rotate Bone's:Dock(TOP)s:SetTextColor(col.white_dark)self.BoneName=s end)self:AddPanel('srp_slider',function(t)t:SetMinMax(-180,180)t:Dock(TOP)t:SetText('Pitch')t:SetValue(0)t:SetLiveUpdate(true)t:OnValueChanged(function(u,v,w)self:UpdateRotation()end)self.Pitch=t end)self:AddPanel('srp_slider',function(t)t:SetMinMax(-180,180)t:Dock(TOP)t:SetText('Yaw')t:SetValue(0)t:SetLiveUpdate(true)t:OnValueChanged(function(u,v,w)self:UpdateRotation()end)self.Yaw=t end)self:AddPanel('srp_slider',function(t)t:SetMinMax(-180,180)t:Dock(TOP)t:SetText('Roll')t:SetValue(0)t:SetLiveUpdate(true)t:OnValueChanged(function(u,v,w)self:UpdateRotation()end)self.Roll=t end)end;function a:UpdateRotation()self.BoneAngle=Angle(self.Pitch:GetValue(),self.Yaw:GetValue(),self.Roll:GetValue())self.Player:ManipulateBoneAngles(self.BoneID,self.BoneAngle)end;function a:Populate(i,x,b)self.BoneID=i;self.BoneAngle=x:GetManipulateBoneAngles(i)self.BoneName:SetText(x:GetBoneName(i):Replace('ValveBiped.',''))self.Player=x;self.ParentPnl=b end;function a:Reset()self.Pitch:SetValue(0)self.Yaw:SetValue(0)self.Roll:SetValue(0)end;function a:Think()if IsValid(self.Player)&&(self:IsHovered()||self:IsChildHovered())then self.ParentPnl:SelectBone(self.BoneID)self:SetBackgroundColor(col.red_dark)else self:SetBackgroundColor(col.midnight_dark)end end;vgui.Register('srp_boneanim_rotation',a,'srp_panel_rounded')concommand.AddDev('boneanim',function()srp.ui.Create('srp_boneanim')end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/binds/ui/binder_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/death/death_cl.lua:
srp.player=srp.player||{}srp.player.deathscreen=srp.player.deathscreen;srp.player.DeathTimer=30;local a={[HITGROUP_GENERIC]='body',[HITGROUP_HEAD]='head',[HITGROUP_CHEST]='chest',[HITGROUP_STOMACH]='stomach',[HITGROUP_LEFTARM]='left arm',[HITGROUP_RIGHTARM]='right arm',[HITGROUP_RIGHTLEG]='right leg',[HITGROUP_LEFTLEG]='left leg',[HITGROUP_GEAR]='through your gear'}local b=1;local c={Sound('galactic/characters/clone/hurt/hurt_01.wav'),Sound('galactic/characters/clone/hurt/hurt_02.wav'),Sound('galactic/characters/clone/hurt/hurt_03.wav'),Sound('galactic/characters/clone/hurt/hurt_04.wav'),Sound('galactic/characters/clone/hurt/hurt_05.wav')}function PLAYER:PlayHurtSound()if!cvar.GetValue('audio_hurt')then return end;if!cvar.GetValue('audio_hurtself')&&LocalPlayer()==self then return end;if!self.NextHurtSound||self.NextHurtSound<CurTime()then self.hurtSoundId=(self.hurtSoundId||1)+math.random(1,2)if self.hurtSoundId>#c then self.hurtSoundId=1 end;self:EmitSound(c[self.hurtSoundId],45,100,.35)self.NextHurtSound=CurTime()+math.random(1.5,5)end end;hook('ScalePlayerDamage',function(d)if!d:IsRobot()then d:PlayHurtSound()end end)net('srp.player.DeathScreen',function()if IsValid(srp.player.deathscreen)then srp.player.deathscreen:Remove()end;local e=net.ReadShort()local f=net.ReadBool()local g,h,i;if net.ReadBool()then g=net.ReadPlayer()h=net.ReadCosmetic(true)i=net.ReadString()end;local j={}local k=net.ReadUInt(3)for l=1,k do table.insert(j,{net.ReadString(),net.ReadString(),a[net.ReadUInt(4)]||'body',net.ReadUInt(16)})end;srp.ui.Create('srp_deathscreen',function(m)m:SetData(e,f,j,g,h,i)srp.player.deathscreen=m end)end)net('srp.player.RemoveDeathScreen',function()if IsValid(srp.player.deathscreen)then srp.player.deathscreen:Remove()end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/death/death_sh.lua:
srp.player=srp.player||{}srp.player.deathscreen=srp.player.deathscreen;srp.player.DeathTimer=30
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/invasion_cl.lua:
srp.invasion=srp.invasion||{}local a={}local b=Color(0,0,0,200)local function c(d)if#d>3 then local e=table.remove(d,1)if IsValid(e)then e:Remove()end end;local f=srp.invasion.Avatars:GetTall()-100-2;for g=1,#d do local e=d[g]e.Index=g;e:MoveMe(f,1,0,-1)f=f-e:GetTall()-2 end end;local function h()if IsValid(srp.invasion.Avatars)then return end;local i=math.min(500,ScrW()*.25)srp.ui.Create('srp_panel',function(e)e:SetSize(i,800)e:SetPos((ScrW()-i)/2,ScrH()*.15)e:SetBackgroundColor(col.transparent)e:SetMouseInputEnabled(false)e:SetKeyBoardInputEnabled(false)e.Children={}e.OnChildAdded=function(j,e)table.insert(j.Children,e)c(j.Children)end;e.OnChildRemoved=function(j,e)table.RemoveByValue(j.Children,e)c(j.Children)end;srp.invasion.Avatars=e end)end;net('srp.invasion.DisplayDialogue',function()h()local k={id=net.ReadString(),Duration=net.ReadUInt(4),Title=net.ReadString(),Text=net.ReadString(),Color=net.ReadColor(),Model=net.ReadBool()&&net.ReadString(),Icon=net.ReadBool()&&net.ReadString(),Sound=net.ReadBool()&&net.ReadString()}if IsValid(a[k.id])then a[k.id]:Populate(srp.invasion.Avatars,k)else srp.ui.Create('srp_invasionplate',function(e)e:SetParent(srp.invasion.Avatars)e:Populate(srp.invasion.Avatars,k)a[k.id]=e end)end end)hook('OnReloaded',function()srp.invasion.GenerateGrids()end)hook('InitPostEntity',function()if info.Dev then srp.invasion.GenerateGrids()end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/invasion_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/questing_cl.lua:
srp.quests=srp.quests||{}local a={}local b=net.GetBits(10)local c=net.GetBits(500000)if IsValid(srp.quests.ui)then srp.quests.ui:Remove()end;if IsValid(srp.quests.statui)then srp.quests.statui:Remove()end;local function d()if IsValid(srp.quests.ui)then srp.quests.ui:SetVisible(true)srp.quests.ui:SetMouseInputEnabled(true)return srp.quests.ui end;local e=cvar.GetValue('srp_quests_minimized')srp.ui.Create('srp_grid',function(f)f:SetWide(355)f:SetPos(ScrW()-355,ScrH()*.18)f:SetAutoHeight(false)f.Expanded=true;f.Expand=function(g)g.Expanded=!g.Expanded;if!f.Expanded then g:SizeTo(355,38,.5,0)else g:SizeTo(355,f.Height,.5,0)end;return g.Expanded end;f.OnComplete=function(g,h)f.Height=h;if g.Expanded then g:SetTall(h)end end;srp.ui.Create('srp_panel_rounded',function(i)i:SetSize(350,36)i:DockPadding(1,1,1,1)i:SetBackgroundColor(col.transparent)i:AddPanel('srp_button_rounded',function(j)j:Dock(RIGHT)j:DockMargin(1,1,1,1)j:SetContentAlignment(5)j:SetBackgroundColor(col.midnight_light)j:SetHoverColor(col.midnight)j:SetTextColor(col.white)j:SetFont'SSRPForkAwesome'j:SetText(0xf0aa,true)j:SetWide(36)j:LeftClick(function(g)if f:Expand()then g:SetText(0xf0aa,true)else g:SetText(0xf0ab,true)end;g:SetDisabled(true,.5)end)end)f:AddItem(i)end)f.Quests={}f.OnChildAdded=function(g,f)g.Quests[f.instanceid]=f;g:SetVisible(true)g:SetMouseInputEnabled(true)end;f.OnChildRemoved=function(g,f)g.Quests[f.instanceid]=nil;if table.Count(g.Quests)==0 then g:SetVisible(true)g:SetMouseInputEnabled(true)end end;f.RemoveQuest=function(g,k)local f=g.Quests[k.instanceid]if IsValid(f)then f:Remove()end end;if e then f:Expand()end;srp.quests.ui=f end)return srp.quests.ui end;local function l(k,m)if IsValid(srp.quests.statui)then srp.quests.statui:Remove()end;srp.ui.Create('srp_quest_stats',function(f)srp.quests.statui=f;f:Populate(k,m)end)end;local function n(k,o)local p=k.instanceid;local q=d()local r=q.Quests[k.instanceid]if!o then if IsValid(r)then r:Remove()end;return end;timer.Simple(3,function()if IsValid(r)then r:Completed()end end)end;local function s(k)local p=k.instanceid;local q=d()local r=q.Quests[k.instanceid]if IsValid(r)then r:Populate(k)return end;srp.ui.Create('srp_quest',function(f)f.instanceid=p;f:Populate(k)q:AddItem(f)end)end;function srp.quests.Start(t,p,u,v,w,x,y)local z=srp.quests.GetInstance(p)if z then srp.quests.End(z,false)end;local k=istable(t)&&t||table.Copy(srp.quests.Get(t,true))k.randomSeedStep=v;k.instanceid=p;if k.typeid==srp.quests.TYPE_ALL||k.typeid==srp.quests.TYPE_SPECIAL then srp.quests.EndInstancesOfType(k.typeid)end;if u then k:SetGenerated()end;if w then k:SetName(w)end;srp.quests.SetInstance(k)k:ReadRewards()if k:IsGenerated()then while true do local A=net.ReadUInt(10)if A==0 then break end;local step=k:AddStep(A,true)step:SetGenerated()step:ReadNet()end else if step then step:ReadNet()end end;k:Start(y,x)hook.Run('OnQuestStarted',k)return k end;function srp.quests.RequestDailies()net.Start'srp.quests.RequestDailies'net.SendToServer()end;function srp.quests.ClaimDaily(t)net.Start'srp.quests.ClaimDaily'net.WriteUInt(t,c)net.SendToServer()end;hook('OnQuestStarted',function(k)s(k)end)hook('OnQuestEnded',function(k,o)n(k,o)end)net('srp.quests.Start',function()srp.quests.Start(net.ReadUInt(6),net.ReadUInt(16),net.ReadBool(),net.ReadUInt(16),net.ReadString(),net.ReadUInt(4))end)net('srp.quests.Sync',function()while true do local B=net.ReadUInt(6)if B==0 then break end;local k=srp.quests.Start(B,net.ReadUInt(16),net.ReadBool(),net.ReadUInt(16),net.ReadString(),net.ReadUInt(4))local step=k:GetStep()for C=1,net.ReadUInt(4)do step:SetObjective(net.ReadString(),net.ReadUInt(16))end;local D=net.ReadBool()if D then step:ReadVotes()hook.Run('OnQuestStepVotingStarted',k,step)end end end)net('srp.quests.Finish',function()local k=srp.quests.GetInstance(net.ReadUInt(16))if!k then return end;local o=net.ReadBool()k:ReadRewards()local m;if net.ReadBool()then m=srp.statcapture.Read()end;l(k,m)srp.quests.End(k,o)end)net('srp.quests.Step',function()local k=srp.quests.GetInstance(net.ReadUInt(16))if k then k:SetStep(net.ReadUInt(4))end end)net('srp.quests.StepObjectiveProgress',function()local k=srp.quests.GetInstance(net.ReadUInt(16))if!k then return end;local A,E,F=net.ReadUInt(4),net.ReadString(),net.ReadUInt(16)local step=k:GetStep(A)if step then step:SetObjective(E,F)end end)net('srp.quests.StepObjectiveCompleted',function()local k=srp.quests.GetInstance(net.ReadUInt(16))if!k then return end;local G,E=net.ReadUInt(4),net.ReadString()local step=k:GetStep(G)if step then step:CompleteObjective(E)end end)net('srp.quests.StartVoting',function()local k=srp.quests.GetInstance(net.ReadUInt(16))if!k then return end;local G=net.ReadUInt(4)local step=k:GetStep(G)step:ReadVotes()hook.Run('OnQuestStepVotingStarted',k,step)end)net('srp.quests.Vote',function()local k=srp.quests.GetInstance(net.ReadUInt(16))if!k then return end;local G=net.ReadUInt(4)local step=k:GetStep(G)local H,I,J=step:ReadVote()hook.Run('OnQuestStepVote',k,step,H,I,J)end)net('srp.quests.EndVoting',function()local k=srp.quests.GetInstance(net.ReadUInt(16))if!k then return end;local G=net.ReadUInt(4)local step=k:GetStep(G)local I=net.ReadUInt(4)step:ClearVoting()hook.Run('OnQuestStepVotingEnded',k,step,I)end)net('srp.quests.RequestDailies',function()local F=net.ReadUInt(b)local K={}for C=1,F do local L=net.ReadUInt(c)local w=net.ReadString()local M=net.ReadUInt(24)local N={}local O=net.ReadUInt(4)for C=1,O do local t=net.ReadString()local P=srp.battlepass.GetUnlockType(t)N[#N+1]={t,P:NetRead()}end;local Q=net.ReadUInt(4)local R={}for S=1,Q do R[S]={name=net.ReadString(),points=net.ReadUInt(32)}end;K[#K+1]={dailiesListinstanceId=L,name=w,cost=M,rewards=N,objectives=R}end;hook.Run('OnQuestDailiesBoardReceived',K)end)net('srp.quests.RemoveDailyListing',function()hook.Run('OnQuestDailiesBoardRemove',net.ReadUInt(c))end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/ui/quest_dailies_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/sky/ui/skyselection_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/sky/ui/skyselection_ui.lua:
local a={}local b=col.midnight_dark:Copy()b.a=222;function a:Init()self:SetBackgroundColor(col.midnight)self:DockPadding(10,10,10,10)local c=self:CreateHeader('Skyboxes','You can set a skybox GLOBALLY for all players. Please set the skybox back to the default after you are done.\nNot to be used for sims.')c:SetParent(self)c:Dock(TOP)srp.ui.Create('srp_panel_rounded',function(d)d:SetParent(c)d:Dock(BOTTOM)d:SetTall(40)d:SetBackgroundColor(col.midnight_dark)d:AddPanel('srp_label',function(e)e:SetText'Search'e:Dock(FILL)e:SetContentAlignment(6)end)d:AddPanel('srp_textinput_rounded',function(e)e:Dock(RIGHT)e:SetWide(220)e:OnValid(function(f)local g=f:GetValue()self:Search(g)end)end)end)self:AddPanel('ui_scrollpanel',function(h)h:Dock(FILL)h.Padding=15;srp.ui.Create('srp_grid',function(i)i:Dock(TOP)i:SetAutoHeight(true)i:SetSpacing(6,10)self.Grid=i;h:AddItem(i)end)end)srp.skybox.GetList()hook('OnSkyboxesReceived',self,self.Populate)end;function a:Search(g)for j,d in ipairs(self.Grid:GetChildren())do d:SetVisible(g==''||d.FileID:lower():find(g:lower()))end end;function a:Populate(k)self.Grid:Clear()local l=GetConVar('sv_skyname'):GetString()for j,m in pairs(k)do self:AddSkybox(m,l)end end;function a:AddSkybox(m,n)local o=m:Replace('up.vmt','')if o==n then return end;local p=Material('skybox/'..m)local q=p:GetTexture('$basetexture')if!q then return end;local q=tostring(q):Replace('Texture [',''):Replace(']','')if q=='error'then return end;local r=CreateMaterial('skyboxprevf.'..m,'UnlitGeneric',{['$basetexture']=tostring(q):Replace('Texture [',''):Replace(']','')})srp.ui.Create('srp_button_rounded',function(d)d.FileID=o;d:SetFont'ui_header.s'd:SetTextColor(col.white)d:SetBackgroundColor(col.midnight_dark)d.lbl:Dock(BOTTOM)d.lbl:DockMargin(0,0,0,10)d:SetText(o:Replace('sky_',''):Replace('_',' '):Capitalize())d:SetSize(136,150)d.Paint=function(s,t,u)derma.SkinHook('Paint','RoundedButton',s,t,u)surface.SetDrawColor(255,255,255,150)surface.SetMaterial(r)surface.DrawTexturedRect(2,2,t-4,u-4)draw.RoundedBox(6,4,u-30,t-8,24,b)end;d:LeftClick(function(s)cmd.Run('setskybox',s.FileID)end)self.Grid:AddItem(d)end)end;function a:OnRemove()hook.Remove('OnSkyboxesReceived',self)end;vgui.Register('srp_skyboxes',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/trading_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/trading_cl.lua:
srp.trading=srp.trading||{}local a='ssrp/'..info.WebID..'/trading/'local b='ssrp/'..info.WebID..'/trading/history'function srp.trading.RequestItems(c)ba.http.FetchJson(a..LocalPlayer():SteamID()..'/'..(c||''),function(d)if d.items then for e=1,#d.items do local f=d.items[e]f.id=tonumber(f.id||0)f.price=tonumber(f.price||0)f.added=tonumber(f.added||0)f.count=tonumber(f.count||0)f.remaining=tonumber(f.remaining||0)d.items[e]=f end end;hook.Run('OnTradingListLoaded',d)end,function()end)end;function srp.trading.GetHistory()ba.http.FetchJson(b,function(d)hook.Run('OnTradingHistoryLoaded',d)end,function()end)end;function srp.trading.PurchaseItems(g,h)net.Start'srp.trading.Purchase'net.WriteUInt(g,32)net.WriteUInt(h,32)net.SendToServer()end;function srp.trading.SellItem(i,j,h)net.Start'srp.trading.SellItem'net.WriteString(i)net.WriteUInt(j,32)net.WriteUInt(h,32)net.SendToServer()end;function srp.trading.RemoveItem(g)net.Start'srp.trading.Remove'net.WriteUInt(g,32)net.SendToServer()end;function srp.trading.OpenMenu()if IsValid(srp.training.men)then srp.training.men:Remove()end;srp.ui.Create('srp_trading',function(k)srp.training.menu=k end)end;net.Receive('srp.trading.Remove',function()hook.Run('OnTradingRemoved',net.ReadUInt(32))end)net.Receive('srp.trading.ItemPurchased',function()local c=net.ReadUInt(32)local l=net.ReadString()local i=net.ReadString()local m=net.ReadUInt(32)local n=net.ReadUInt(32)hook.Run('OnTradingPurchased',c,l,i,m,n)end)net.Receive('srp.trading.ItemListed',function()local g=net.ReadUInt(32)local i=net.ReadString()local h=net.ReadUInt(32)local n=net.ReadUInt(32)hook.Run('OnTradingListed',g,i,h,n)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/ui/inventoryselect_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingdefcon_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingloadouts_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/ui/triumphflash_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/ui/triumphobj_ui.lua:
local a={}local b=Color(100,200,100)local c=col.green:Copy()function a:Init()self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self:SetTall(25)self:SetMouseInputEnabled(false)self:AddPanel('srp_label',function(d)d:SetText''d:SetTextColor(col.grey)d:SetContentAlignment(4)d:Dock(FILL)self.description=d end)self.maxvalue=1;self.value=0;self.percent=0;self.TextColor=color_black;hook('OnTriumphUpdated',self,function(e,f)if e==self then e:Update(f:GetLocalData(id))end end)hook('OnTriumphObjectiveCompleted',self,function(e,f)if e==self then e:Update(f:GetLocalData(id))end end)end;function a:OnRemove()hook.Remove('OnTriumphObjectiveCompleted',self)hook.Remove('OnTriumphUpdated',self)end;function a:Populate(f,id,g,h)self.id=id;self.triumph=f;self.maxvalue=g;local col=h&&h:Copy()||c;col.a=150;self.barcolor=col;local col=h&&h:Copy()||b;col.a=255;self.barcomplete=col;self.description:SetText(f:GetObjectiveDescription(id)||id)self:Update(f:GetLocalData(id))end;function a:Update(i)if!self.triumph then return end;if self.triumph:IsCompleted()then self.percent=1;self.value=self.maxvalue;self.barcolor=self.outline||col.green else self.value=i||0;self.percent=math.Clamp(self.value/self.maxvalue,0,1)if self.value>=self.maxvalue then self.barcolor=self.outline||self.barcomplete end end;local j=self.barcolor:InverseLight(col.white,true)self.TextColor=j;self.description:SetTextColor(j)end;local k=Color(100,100,100,200)function a:Paint(l,m)draw.RoundedBox(4,0,0,l,m-1,k)draw.RoundedBox(4,0,0,l*self.percent,m-1,self.barcolor)draw.SimpleText(self.value..'/'..self.maxvalue,'ui_label.s',l-5,m/2-1,self.TextColor,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)end;vgui.Register('srp_triumphobj',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/ui/triumphtitle_ui.lua:
local a={}function a:Init()self:SetParent(self)self:Dock(FILL)self:DockMargin(0,0,0,0)self:SetBackgroundColor(col.grey_dark)self:SetHoverColor(col.grey)self:SetTextColor(col.white)self.Loading=true;self:SetValue(name)self:OnValidate(function(b,c,d)if d.id==0||self.Loading then return true else return srp.titles.HasAccess(LocalPlayer(),d.id)end end)self:OnSelect(function(b,c,d)if self.Loading then return end;cvar.SetValue(self.Cvar.Name,d.id)self.SelectedID=d.id;net.Start'srp.titles.Set'net.WriteUInt(d.id,8)net.SendToServer()end)self.SelectedID=id;hook('OnStoreItemPurchased',self,function(e,d)if string.find(d.Upgrade.UID,'bundle_')then e:SetCvar(self.Cvar)end end)end;function a:OnRemove()hook.Remove('OnStoreItemPurchased',self)end;function a:SetCvar(cvar)self:DockPadding(5,5,5,5)self:SetTall(70)self.Cvar=cvar;self:Clear()self:AddOption('No Title',{id=0},true)srp.triumphs.GetProgress(function()if!IsValid(self)then return end;local id=self.Cvar:GetValue()||0;local f=srp.titles.GetAll()local name=f[id]&&f[id].Name||'None'for g,h in ipairs(f)do local i=srp.titles.HasAccess(LocalPlayer(),g)self:AddOption(h.Name,{id=g},{text=i&&col.white||col.grey_dark,icon=h.Icon},name==h.Name)end;self.Loading=false end)end;vgui.Register('srp_triumphtitle',a,'srp_dropdown')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/voice/voice_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/voice/ui/radio_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/attachmentmeta_sh.lua:
local a=FindMetaTable'Weapon'if SERVER then else net('attachments.Add',function()local b=net.ReadEntity()if IsValid(b)&&b.AddAttachment then b:AddAttachment(net.ReadString(),net.ReadUInt(10),true)end end)net('attachments.Remove',function()local b=net.ReadEntity()if IsValid(b)&&b.RemoveAttachment then b:RemoveAttachment(net.ReadString())end end)end;function a:SyncAttachments()local c=srp.WeaponAttachments.GetEquipped(self:GetOwner(),self:GetClass())if c then for d,e in pairs(c)do self:AddAttachment(d,e)end end end;function a:SetupAttachments()if self.PresetAttachments then self.PresetAttachmentsMapped={}for d,e in pairs(self.PresetAttachments)do self.PresetAttachmentsMapped[e]=true;self:AddAttachment(d,e,nil,true)end end end;function a:AddAttachment(d,e,f,g,h)if!self.Attachments then return end;local i=srp.WeaponAttachments.GetByWeapon(h||self:GetClass(),e,f)||srp.WeaponAttachments.GetByWeapon('modules',e,f)if!i then return end;local j=self.Attachments[d]if j&&IsValid(j.ent)then j.ent:Remove()end;if!table.HasValue(i.slot,d)then return end;if i.required then local d=self.Attachments[i.required.slot]if!d||d.id!=i.required.id then return end end;local k=table.Copy(i)if k.MountMods then for d,l in pairs(k.MountMods)do self:AddAttachment(d,l)end end;self.Attachments[d]=k;self:RecalculateAttachmentStats()if SERVER&&IsValid(self:GetOwner())&&!g then net.Start'attachments.Add'net.WriteEntity(self)net.WriteString(d)net.WriteUInt(i.internalid,10)net.Send(self:GetOwner())end;if CLIENT then hook.Run('OnAttachmentAdded',self,self:GetClass(),d,i.id)end;if self.OnAttachmentAdded then self:OnAttachmentAdded(i,d,g)end;return true end;function a:RemoveAttachment(d,g)if!self.Attachments then return end;local i=self.Attachments[d]if!i then return end;if IsValid(i.ent)then i.ent:Remove()end;self.Attachments[d]=nil;if SERVER&&!g then net.Start'attachments.Remove'net.WriteEntity(self)net.WriteString(d)net.Send(self:GetOwner())end;if CLIENT then hook.Run('OnAttachmentRemoved',self,self:GetClass(),d)end;if self.OnAttachmentRemoved then self:OnAttachmentRemoved(i,d,g)end;return true end;function a:RemoveAttachments()self.removing=true;for d,i in pairs(self.Attachments||{})do if IsValid(i.ent)then i.ent:Remove()end end end;function a:GetAttachmentSlot(m)return self.Attachments&&self.Attachments[m]end;function a:RecalculateAttachmentStats()self:ResetWeaponStats()local n=self:GetOwner()local o=IsValid(n)&&n:IsTalentSelected('weaponmoduleupgrade')for d,i in pairs(self.Attachments||{})do local p=i.Stats&&(i.Stats[self:GetClass()]||i.Stats.Default)if isfunction(p)then p=p(i,self,o)end;if!p then continue end;for e,q in pairs(p)do if!self.OriginalStats[e]then local r=self['Get'..e]self.OriginalStats[e]=isfunction(r)&&r(self)||self[e]end;local r=self['Set'..e]local q=isfunction(q)&&q(i,self,o)||q;if isfunction(r)then self[e]=r(self,q)else self[e]=q end end end end;function a:ResetWeaponStats()for e,q in pairs(self.OriginalStats||{})do local r=self['Set'..e]if isfunction(r)then r(self,q)else self[e]=q end end end;function a:DrawAttachments(s)if!IsValid(s)||self.removing then return end;for d,i in pairs(self.Attachments||{})do if i&&i.ViewModel&&!IsValid(i.ent)then local t=ents.CreateClientProp(i.ViewModel)if!IsValid(t)then continue end;t:SetTransmitWithParent(true)t:SetModel(i.ViewModel)t:SetMoveType(MOVETYPE_NONE)t:SetNotSolid(true)t:Spawn()t:SetLocalPos(Vector())t:SetLocalAngles(Angle())t:SetParent(s)t:SetNoDraw(true)t:SetRenderOrigin(EyePos())t:SetRenderAngles(EyeAngles())t:AddEffects(EF_BONEMERGE)if i.Scope then self.HasScope=true;self.ScopeEntity=t;self.OpticZone=i.OpticZone||false;self.ScopeOverrideMaterialIndex=i.ScopeOverrideMaterialIndex||1;self.ScopeScale=i.ScopeScale;self.ScopeFOV=i.ScopeFOV||self.ScopeFOV||50 end;i.ent=t;t.attachment=i elseif i&&IsValid(i.ent)then i.ent:SetParent(s)i.ent:AddEffects(EF_BONEMERGE)i.ent:DrawModel()end end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/attachments_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/npcweapons_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/weapons_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/ui/attachmentitem_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/ui/attachmentmenu_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/droideka/droideka_sh.lua:
nw.Register'player.droideka':Write(net.WriteBool):Read(net.ReadBool):SetPlayer()nw.Register'player.droideka_rolling':Write(net.WriteBool):Read(net.ReadBool):SetPlayer()function PLAYER:SetDroideka(a)self:SetNetVar('player.droideka',a)end;function PLAYER:SetDroidekaRolling(a)self:SetNetVar('player.droideka_rolling',a)end;function PLAYER:IsDroideka()return self:GetNetVar'player.droideka'end;function PLAYER:IsDroidekaRolling()return self:GetNetVar'player.droideka_rolling'end;hook('StartCommand',function(b,cmd)if!b:IsDroideka()then return end;cmd:RemoveKey(IN_JUMP)cmd:RemoveKey(IN_DUCK)if!b:IsDroidekaRolling()then cmd:RemoveKey(IN_SPEED)else cmd:RemoveKey(IN_WALK)cmd:SetButtons(IN_SPEED)cmd:RemoveKey(IN_BACK)cmd:RemoveKey(IN_MOVELEFT)cmd:RemoveKey(IN_MOVERIGHT)cmd:SetSideMove(0)if cmd:GetForwardMove()<=0 then cmd:SetForwardMove(0)if b.DroidekaLooping then b:StopLoopingSound(b.DroidekaLooping)b.DroidekaLooping=nil end end end end)srp.AddCommand('droideka',function(b,c)if c:IsEventCharacter()||b:IsRoot()then c:SetModel'models/star_wars_battlefront/sides/cis/droideka.mdl'end end):AddParam(cmd.PLAYER_ENTITY):SetGM():SetInfoSection('Gamemaster'):SetInfo('Sets an event character to the Droideka.'):SetInfoArgs({'Target => The target that will be turned into a Droideka. Must be an event character.'})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/starmap/starmap_cl.lua:
srp.starmap=srp.starmap||{}function srp.starmap.RequestMapInfo()net.Start'srp.starmap.RequestMapInfo'net.SendToServer()end;net('srp.starmap.Create',function()local a=srp.starmap.ReadMap()srp.starmap.Register(a)hook.Run('OnMapCreated',a)end)net('srp.starmap.CreateSector',function()local b=srp.starmap.ReadSector()if!b||!b.MapID then return end;local a=srp.starmap.GetMap(b.MapID)if a then srp.starmap.RegisterSector(a,b)hook.Run('OnMapSectorCreated',a,b)end end)net('srp.starmap.SyncAll',function()local c=net.ReadUInt(12)for d=1,c do local a=srp.starmap.ReadMap()srp.starmap.Register(a)hook.Run('OnStarmapLoaded',a)end;hook.Run('OnStarmapsLoaded',maps)end)net('srp.starmap.Sync',function()local a=srp.starmap.ReadMap()srp.starmap.Register(a)hook.Run('OnStarmapLoaded',a)end)net('srp.starmap.Remove',function()local e=net.ReadUint(12)srp.starmap.Remove(e)hook.Run('OnStarmapRemoved',e)end)net('srp.starmap.RemoveSector',function()local e=net.ReadUInt(12)local f=net.ReadUInt(18)local a=srp.starmap.Get(e)if a then a.Sectors[f]=nil;hook.Run('OnStarmapSectorRemoved',e,f)end end)net('srp.starmap.RequestMapInfo',function()local g={}for d=1,net.ReadUInt(12)do table.insert(g,{id=net.ReadUInt(12),Name=net.ReadString()})end;hook.Run('OnStarmapListReceived',g)end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/starmap/ui/starmap_view_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/chat/chathandlers_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/chat/commands_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/activities/building_sh.lua:
srp.build.Add('fob',{name='Forward Op. Base',model='models/props/cargocrate1.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),class='rp_fob',placerange=3500,maxbuildings=2,blackzones={},offset=Vector(0,0,0),duration=15,visual=30,health=18500,construction=true,main=info.Dev,battalion={'327th','327KC'},items={SAND=5,METAL_REFINED_METAL=10},CanPlace=function(self,a,b,c)local d,e=0,a:GetAllegianceID()local f=ents.FindByClass(self.class)local g=self.blackzones[info.Map]if g then for h=1,#self.blackzones do local i=self.blackzones[h]if b:Distance(i[1])<i[2]then return false,'Inside blacklisted zone!'end end end;for j,k in ipairs(f)do if k:GetPos():Distance(b)<self.placerange then return false,'Too close to other FOBs!'end;if k.allegiance.id==e then d=d+1;if d>=self.maxbuildings then return false,'Limit reached!'end end end;return true end})srp.build.Add('mortar',{name='Mortar Station',model='models/gredwitch/m1_mortar/m1_mortar.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),class='rp_mortar',placerange=125,maxbuildings=6,blackzones={},offset=Vector(0,0,35),duration=15,visual=30,health=5000,construction=false,battalion={'41st','41SB','327th','327KC','GM'},items={METAL_REFINED_METAL=15},CanPlace=function(self,a,b,c)local d,e=0,a:GetAllegianceID()local l=ents.FindByClass(self.class)if#l>=self.maxbuildings then return false,'Limit reached!'end;local g=self.blackzones[info.Map]if g then for h=1,#self.blackzones do local i=self.blackzones[h]if b:Distance(i[1])<i[2]then return false,'Inside blacklisted zone!'end end end;for j,m in ipairs(l)do if m:GetPos():Distance(b)<self.placerange then return false,'Too close to other mortars!'end end;return true end})srp.build.Add('lvs_turret_aa',{name='Anti-Air Turret',model='models/antiairturret/rep_anti-airturret.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),class='lvs_turret_aa',placerange=200,maxbuildings=6,blackzones={},offset=Vector(0,0,2),duration=15,visual=30,health=5000,construction=false,battalion={'41st','41SB','327th','327KC','GM'},items={METAL_REFINED_METAL=45},CanPlace=function(self,a,b,c)local d,e=0,a:GetAllegianceID()local l=ents.FindByClass(self.class)if#l>=self.maxbuildings then return false,'Limit reached!'end;local g=self.blackzones[info.Map]if g then for h=1,#self.blackzones do local i=self.blackzones[h]if b:Distance(i[1])<i[2]then return false,'Inside blacklisted zone!'end end end;for j,m in ipairs(l)do if m:GetPos():Distance(b)<self.placerange then return false,'Too close to other mortars!'end end;return true end})srp.build.Add('lvs_turret_ai',{name='Anti-Infantry Turret',model='models/antiinfantryturret/Anti-InfantryTurret.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),class='lvs_turret_ai',placerange=200,maxbuildings=6,blackzones={},offset=Vector(0,0,2),duration=15,visual=30,health=5000,construction=false,battalion={'41st','41SB','327th','327KC','GM'},items={METAL_REFINED_METAL=25},CanPlace=function(self,a,b,c)local d,e=0,a:GetAllegianceID()local l=ents.FindByClass(self.class)if#l>=self.maxbuildings then return false,'Limit reached!'end;local g=self.blackzones[info.Map]if g then for h=1,#self.blackzones do local i=self.blackzones[h]if b:Distance(i[1])<i[2]then return false,'Inside blacklisted zone!'end end end;for j,m in ipairs(l)do if m:GetPos():Distance(b)<self.placerange then return false,'Too close to other mortars!'end end;return true end})srp.build.Add('lvs_turret_av',{name='Anti-Vehicle Turret',model='models/antivehicleturret/Anti-VehicleTurret.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),class='lvs_turret_av',placerange=200,maxbuildings=6,blackzones={},offset=Vector(0,0,2),duration=15,visual=30,health=5000,construction=false,battalion={'41st','41SB','327th','327KC','GM'},items={METAL_REFINED_METAL=35},CanPlace=function(self,a,b,c)local d,e=0,a:GetAllegianceID()local l=ents.FindByClass(self.class)if#l>=self.maxbuildings then return false,'Limit reached!'end;local g=self.blackzones[info.Map]if g then for h=1,#self.blackzones do local i=self.blackzones[h]if b:Distance(i[1])<i[2]then return false,'Inside blacklisted zone!'end end end;for j,m in ipairs(l)do if m:GetPos():Distance(b)<self.placerange then return false,'Too close to other mortars!'end end;return true end})srp.build.Add('barbedwire',{name='Barbed Wire',model='models/props_street/concertinawire128.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),class='rp_barbedwire',placerange=25,blackzones={},offset=Vector(0,0,15),duration=5,visual=20,health=1500,construction=false,items={METAL_REFINED_METAL=5},CanPlace=function(self,a,b,c)local d,e=0,a:GetAllegianceID()local n=ents.FindByClass(self.class)for j,o in ipairs(n)do if o:GetPos():Distance(b)<self.placerange then return false,'Too close to other barbed wires!'end end;return true end})srp.build.Add('largewall',{name='Large Wall',model='models/props/wall1.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,100),UIModelOffset=Vector(350,-150,0),duration=4,visual=44,health=10500,construction=true,battalion={'327th','327KC'},items={METAL_SCRAP=15,METAL_REFINED_METAL=12}})srp.build.Add('largecurvewall',{name='Large Curved Wall',model='models/props/wall1curve.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,0),UIModelOffset=Vector(400,0,0),duration=4,visual=44,health=10500,construction=true,items={METAL_SCRAP=11,METAL_REFINED_METAL=15}})srp.build.Add('barricadewall',{name='Standable Barricade',model='models/elitelukas/imp/barricade.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,40),UIModelOffset=Vector(150,0,0),duration=4,visual=44,health=4500,construction=true,battalion={'41st','41SB'},items={METAL_SCRAP=20,METAL_REFINED_METAL=5}})srp.build.Add('barricademoon',{name='Barricade Moon',model='models/props/starwars/furniture/kashyyyk_barricade2.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,0),UIModelOffset=Vector(150,0,0),duration=4,visual=44,health=7500,construction=true,battalion={'41st','41SB'},items={SAND=30,METAL_REFINED_METAL=8}})srp.build.Add('dragonsteeth',{name='Dragon Teeth',model='models/props_fortifications/dragonsteeth_large.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,0),UIModelOffset=Vector(100,0,0),duration=3,visual=44,health=4000,construction=false,battalion={'41st','41SB'},items={SAND=15,METAL_SCRAP=2}})srp.build.Add('xenologylab',{name='Xenology Lab',model='models/galactic/me3fix/me1colonyhut01.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,0),UIModelOffset=Vector(100,0,0),duration=3,visual=44,health=15000,construction=true,battalion={'41st','41SB'},items={METAL_SCRAP=30,METAL_REFINED_METAL=15}})srp.build.Add('critchanceamplifier',{name='Crit. Chance Amplifier',model='models/starwars/syphadias/props/sw_tor/bioware_ea/props/city/city_streetlamp_post.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),class='rp_amplifier',placerange=2000,maxbuildings=2,blackzones={},offset=Vector(0,0,2),duration=15,visual=30,health=5000,construction=false,battalion={'41st','41SB'},items={METAL_REFINED_METAL=35},CanPlace=function(self,a,b,c)local d,e=0,a:GetAllegianceID()local p=ents.FindByClass(self.class)if#p>=self.maxbuildings then return false,'Limit reached!'end;local g=self.blackzones[info.Map]if g then for h=1,#self.blackzones do local i=self.blackzones[h]if b:Distance(i[1])<i[2]then return false,'Inside blacklisted zone!'end end end;for j,q in ipairs(p)do if q:GetPos():Distance(b)<self.placerange then return false,'Too close to other towers!'end end;return true end})local r=Vector(0,100,75)local s=Vector(0,100,-80)srp.build.Add('guardtower',{name='Guard Tower',model='models/elitelukas/imp/platform_small.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,80),UIModelOffset=Vector(100,0,0),duration=3,visual=44,health=10000,construction=true,battalion={'41st','41SB'},items={METAL_SCRAP=30,METAL_REFINED_METAL=15},attachments={{Model=Model('models/props_foliage/hedge_128_128high.mdl'),Pos=Vector(45,0,-80),Ang=Angle(0,90,0),CollisionGroup=COLLISION_GROUP_DEBRIS},{Model=Model('models/props_foliage/hedge_128_128high.mdl'),Pos=Vector(-45,0,-80),Ang=Angle(0,90,0),CollisionGroup=COLLISION_GROUP_DEBRIS},{Model=Model('models/props_foliage/hedge_128.mdl'),Pos=Vector(0,-45,-85),Ang=Angle(0,0,0),CollisionGroup=COLLISION_GROUP_DEBRIS},{Class='func_useableladder',Pos=Vector(0,100,-10),Ang=Angle(0,0,0),Spawn=function(t,u)local v=u:LocalToWorld(s)local w=u:LocalToWorld(r)t:SetKeyValue('point0',tostring(w))t:SetKeyValue('point1',tostring(v))t:SetKeyValue('targetname',u:EntIndex())timer.Simple(0.5,function()if IsValid(t)then t:Activate()end end)u.Ladder=t end},{Class='info_ladder_dismount',Pos=s+Vector(0,35,10),Ang=Angle(),Spawn=function(x,u)x:SetParent(u.Ladder)x:SetKeyValue('LadderName',u:EntIndex())end},{Class='info_ladder_dismount',Pos=r+Vector(0,-35,30),Ang=Angle(),Spawn=function(x,u)x:SetParent(u.Ladder)x:SetKeyValue('LadderName',u:EntIndex())end}}})srp.build.Add('humanwall',{name='Large Protective Wall',model='models/galactic/me3fix/human_wall_01.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,0),UIModelOffset=Vector(150,0,0),duration=4,visual=44,health=8500,construction=true,main=info.Dev,battalion={'327th','327KC'},items={METAL_SCRAP=20,METAL_REFINED_METAL=5}})srp.build.Add('bridge1',{name='Bridge 1',model='models/props/piping1.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),overlap=true,canoffset=true,overlapoffset=Vector(0,0,27),offset=Vector(0,0,100),duration=4,visual=44,health=7500,construction=true,main=info.Dev,battalion={'327th','327KC'},items={SAND=10,METAL_REFINED_METAL=10}})srp.build.Add('bridge2',{name='Bridge 2',model='models/props/piping1big.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),overlap=true,canoffset=true,overlapoffset=Vector(0,0,27),offset=Vector(0,0,100),UIModelOffset=Vector(150,0,50),duration=4,visual=44,health=10000,overlap=true,construction=true,main=info.Dev,battalion={'327th','327KC'},items={SAND=15,METAL_REFINED_METAL=15}})srp.build.Add('woodenbridge',{name='Wooden Bridge',model='models/props/woodramp1.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),overlap=true,canoffset=true,overlapoffset=Vector(0,0,50),offset=Vector(0,0,75),UIModelOffset=Vector(0,0,50),UIModelAngle=Angle(-20,20,0),duration=4,visual=44,health=10000,overlap=true,construction=true,main=info.Dev,battalion={'327th','327KC'},items={SAND=5,METAL_REFINED_METAL=5}})srp.build.Add('woodenbridgelarge',{name='Large Wooden Bridge',model='models/props/woodramp1big.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),overlap=true,canoffset=true,overlapoffset=Vector(0,0,50),offset=Vector(0,0,75),UIModelOffset=Vector(120,0,55),UIModelAngle=Angle(-20,20,0),duration=4,visual=44,health=10000,overlap=true,construction=true,main=info.Dev,battalion={'327th','327KC'},items={SAND=5,METAL_REFINED_METAL=10}})srp.build.Add('sandbag',{name='Small Sandbags',model='models/props/swsandbags.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,0),duration=4,visual=44,health=3500,items={SAND=20}})srp.build.Add('sandbag2',{name='Sandbags',model='models/other/sandbags.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,0),duration=4,visual=44,health=4750,items={SAND=25}})srp.build.Add('concretebarrier',{name='Stone Barrier',model='models/props_phx/construct/concrete_barrier00.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,0),offsetangle=-90,UIPosition=Vector(5,0,45),UIAngle=Angle(0,0,90),UIModelOffset=Vector(-50,0,0),UIModelAngle=Angle(0,110,0),duration=12,visual=85,health=5000,items={SAND=50}})srp.build.Add('wallpanel',{name='Wall Panel',model='models/galactic/me3fix/wall_cover01_l.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,0),UIPosition=Vector(-5,0,55),UIAngle=Angle(0,-90,90),UIAltPosition=Vector(5,0,55),UIAltAngle=Angle(0,90,90),UIModelOffset=Vector(-100,0,-20),duration=15,visual=85,health=6000,items={METAL_REFINED_METAL=12}})srp.build.Add('barrier',{name='Metal Barrier',model='models/props/swfortification.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,0),offsetangle=180,UIModelOffset=Vector(-50,0,0),UIModelAngle=Angle(0,20,0),duration=16,visual=46,health=7500,items={METAL_REFINED_METAL=15}})srp.build.Add('bunker',{name='Sand Bunker',model='models/props/swsandbuild1.mdl',icon=Material('materials/galactic/ui/inventory/crafting.jpg','smooth noclamp'),offset=Vector(0,0,0),UIModelOffset=Vector(270,-20,-20),UIModelAngle=Angle(25,150,0),duration=90,visual=85,health=35000,items={SAND=100}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/activities/patrols_sh.lua:
srp.patrols.AddRoutes('rp_anaxes',{REPUBLIC={{{pos=Vector(-7939,3964,68),ang=Angle()},{pos=Vector(-7972,2951,64),ang=Angle()},{pos=Vector(-7952,1690,64),ang=Angle()},{pos=Vector(-7959,730,64),ang=Angle()},{pos=Vector(-7963,-405,64),ang=Angle()},{pos=Vector(-7948,-1482,64),ang=Angle()},{pos=Vector(-7932,-2603,64),ang=Angle()},{pos=Vector(-7914,-3975,64),ang=Angle()},{pos=Vector(-7938,-5070,64),ang=Angle()},{pos=Vector(-7931,-5435,64),ang=Angle()},{pos=Vector(-8531,-5595,80),ang=Angle()},{pos=Vector(-9439,-5625,100),ang=Angle()},{pos=Vector(-10754,-5663,137),ang=Angle()},{pos=Vector(-11847,-5475,116),ang=Angle()},{pos=Vector(-11898,-4253,132),ang=Angle()},{pos=Vector(-11880,-2591,110),ang=Angle()},{pos=Vector(-11819,-938,80),ang=Angle()},{pos=Vector(-11738,734,71),ang=Angle()},{pos=Vector(-11690,2270,68),ang=Angle()},{pos=Vector(-12491,2618,206),ang=Angle()},{pos=Vector(-13380,2050,551),ang=Angle()},{pos=Vector(-13079,518,526),ang=Angle()},{pos=Vector(-13437,-382,662),ang=Angle()},{pos=Vector(-13438,-1493,563),ang=Angle()},{pos=Vector(-13435,-2995,539),ang=Angle()},{pos=Vector(-12708,-3503,297),ang=Angle()},{pos=Vector(-11924,-3836,111),ang=Angle()},{pos=Vector(-11889,-5396,113),ang=Angle()},{pos=Vector(-11099,-5515,125),ang=Angle()},{pos=Vector(-9915,-5534,105),ang=Angle()},{pos=Vector(-8774,-5548,76),ang=Angle()},{pos=Vector(-7970,-5350,64),ang=Angle()},{pos=Vector(-7057,-5491,60),ang=Angle()},{pos=Vector(-6528,-5546,96),ang=Angle()},{pos=Vector(-5917,-5544,82),ang=Angle()},{pos=Vector(-4916,-5515,91),ang=Angle()},{pos=Vector(-4336,-5289,72),ang=Angle()},{pos=Vector(-4287,-4352,119),ang=Angle()},{pos=Vector(-4180,-3516,140),ang=Angle()},{pos=Vector(-4452,-2806,67),ang=Angle()},{pos=Vector(-4278,-2122,95),ang=Angle()},{pos=Vector(-4073,-1168,119),ang=Angle()},{pos=Vector(-4083,-1857,134),ang=Angle()},{pos=Vector(-4454,-2421,65),ang=Angle()},{pos=Vector(-4578,-3382,83),ang=Angle()},{pos=Vector(-4309,-4511,108),ang=Angle()},{pos=Vector(-4393,-5402,74),ang=Angle()},{pos=Vector(-5800,-5431,76),ang=Angle()},{pos=Vector(-6918,-5468,75),ang=Angle()},{pos=Vector(-7903,-5363,64),ang=Angle()},{pos=Vector(-7896,-4366,64),ang=Angle()},{pos=Vector(-7897,-3196,64),ang=Angle()},{pos=Vector(-7893,-801,64),ang=Angle()},{pos=Vector(-7936,2361,64),ang=Angle()},{pos=Vector(-7944,4016,68),ang=Angle()}},{{pos=Vector(-7934,4033,68),ang=Angle()},{pos=Vector(-7957,1992,64),ang=Angle()},{pos=Vector(-7953,889,64),ang=Angle()},{pos=Vector(-7951,-644,64),ang=Angle()},{pos=Vector(-7939,-2004,64),ang=Angle()},{pos=Vector(-7946,-3179,64),ang=Angle()},{pos=Vector(-7938,-4442,64),ang=Angle()},{pos=Vector(-7940,-5158,64),ang=Angle()},{pos=Vector(-7902,-6167,101),ang=Angle()},{pos=Vector(-7330,-6807,148),ang=Angle()},{pos=Vector(-6791,-7389,237),ang=Angle()},{pos=Vector(-5614,-7345,353),ang=Angle()},{pos=Vector(-4899,-8125,537),ang=Angle()},{pos=Vector(-3884,-8249,698),ang=Angle()},{pos=Vector(-3101,-8010,661),ang=Angle()},{pos=Vector(-2251,-7291,379),ang=Angle()},{pos=Vector(-1155,-7369,323),ang=Angle()},{pos=Vector(-140,-6622,197),ang=Angle()},{pos=Vector(-359,-5655,130),ang=Angle()},{pos=Vector(-232,-4084,129),ang=Angle()},{pos=Vector(-199,-2639,140),ang=Angle()},{pos=Vector(51,-1165,142),ang=Angle()},{pos=Vector(454,644,107),ang=Angle()},{pos=Vector(567,2202,118),ang=Angle()},{pos=Vector(729,3599,162),ang=Angle()},{pos=Vector(677,5407,-28),ang=Angle()},{pos=Vector(5,6598,-42),ang=Angle()},{pos=Vector(-75,7939,-33),ang=Angle()},{pos=Vector(772,8798,-38),ang=Angle()},{pos=Vector(1826,9498,-129),ang=Angle()},{pos=Vector(2482,9259,-280),ang=Angle()},{pos=Vector(3194,8577,-491),ang=Angle()},{pos=Vector(3661,8140,-512),ang=Angle()},{pos=Vector(4401,7991,-527),ang=Angle()},{pos=Vector(5054,7903,-536),ang=Angle()},{pos=Vector(5299,7192,-527),ang=Angle()},{pos=Vector(5241,6579,-528),ang=Angle()},{pos=Vector(4933,6278,-535),ang=Angle()},{pos=Vector(4870,6811,-532),ang=Angle()},{pos=Vector(5047,7161,-525),ang=Angle()},{pos=Vector(5302,7586,-536),ang=Angle()},{pos=Vector(4603,7845,-530),ang=Angle()},{pos=Vector(3977,7910,-512),ang=Angle()},{pos=Vector(4783,7760,-533),ang=Angle()},{pos=Vector(5150,7128,-524),ang=Angle()},{pos=Vector(5162,6439,-532),ang=Angle()},{pos=Vector(5140,7454,-533),ang=Angle()},{pos=Vector(4969,7774,-537),ang=Angle()},{pos=Vector(4375,7847,-529),ang=Angle()},{pos=Vector(3500,8090,-492),ang=Angle()},{pos=Vector(2557,9179,-304),ang=Angle()},{pos=Vector(1973,9957,-102),ang=Angle()},{pos=Vector(2285,11288,65),ang=Angle()},{pos=Vector(2160,12577,282),ang=Angle()},{pos=Vector(1817,13961,452),ang=Angle()},{pos=Vector(1119,14504,486),ang=Angle()},{pos=Vector(213,14345,477),ang=Angle()},{pos=Vector(-436,13443,333),ang=Angle()},{pos=Vector(-541,12466,200),ang=Angle()},{pos=Vector(-607,11325,74),ang=Angle()},{pos=Vector(-463,10453,33),ang=Angle()},{pos=Vector(-814,9793,99),ang=Angle()},{pos=Vector(-968,9100,98),ang=Angle()},{pos=Vector(-853,8230,67),ang=Angle()},{pos=Vector(-289,7026,-33),ang=Angle()},{pos=Vector(287,6047,-70),ang=Angle()},{pos=Vector(645,4408,29),ang=Angle()},{pos=Vector(652,2330,125),ang=Angle()},{pos=Vector(266,197,85),ang=Angle()},{pos=Vector(-52,-1342,149),ang=Angle()},{pos=Vector(-267,-3686,143),ang=Angle()},{pos=Vector(-533,-5825,154),ang=Angle()},{pos=Vector(-1960,-6157,230),ang=Angle()},{pos=Vector(-3566,-5600,109),ang=Angle()},{pos=Vector(-5160,-5539,89),ang=Angle()},{pos=Vector(-6902,-5521,77),ang=Angle()},{pos=Vector(-7919,-5309,64),ang=Angle()},{pos=Vector(-7941,-4029,64),ang=Angle()},{pos=Vector(-7908,-2782,64),ang=Angle()},{pos=Vector(-7928,-1210,64),ang=Angle()},{pos=Vector(-7954,214,64),ang=Angle()},{pos=Vector(-7974,1626,64),ang=Angle()},{pos=Vector(-7931,4113,68),ang=Angle()}},{{pos=Vector(-7930,4090,68),ang=Angle()},{pos=Vector(-7945,2877,64),ang=Angle()},{pos=Vector(-7955,1648,64),ang=Angle()},{pos=Vector(-7930,94,64),ang=Angle()},{pos=Vector(-7912,-1400,64),ang=Angle()},{pos=Vector(-7902,-2468,64),ang=Angle()},{pos=Vector(-7892,-3485,64),ang=Angle()},{pos=Vector(-7880,-4813,64),ang=Angle()},{pos=Vector(-6816,-4911,68),ang=Angle()},{pos=Vector(-5705,-5107,68),ang=Angle()},{pos=Vector(-4964,-4985,68),ang=Angle()},{pos=Vector(-5036,-3756,68),ang=Angle()},{pos=Vector(-5035,-2134,68),ang=Angle()},{pos=Vector(-4739,-1258,68),ang=Angle()},{pos=Vector(-4552,-165,68),ang=Angle()},{pos=Vector(-4572,569,68),ang=Angle()},{pos=Vector(-5180,663,68),ang=Angle()},{pos=Vector(-5968,611,68),ang=Angle()},{pos=Vector(-6888,1438,68),ang=Angle()},{pos=Vector(-8642,1423,68),ang=Angle()},{pos=Vector(-9360,807,68),ang=Angle()},{pos=Vector(-9476,-635,68),ang=Angle()},{pos=Vector(-11105,-877,68),ang=Angle()},{pos=Vector(-11228,868,68),ang=Angle()},{pos=Vector(-11171,2954,68),ang=Angle()},{pos=Vector(-9702,3369,64),ang=Angle()},{pos=Vector(-7992,3021,64),ang=Angle()},{pos=Vector(-8006,147,64),ang=Angle()},{pos=Vector(-7912,-1903,64),ang=Angle()},{pos=Vector(-7900,-4828,64),ang=Angle()},{pos=Vector(-8660,-4989,68),ang=Angle()},{pos=Vector(-9871,-5032,68),ang=Angle()},{pos=Vector(-11341,-4959,68),ang=Angle()},{pos=Vector(-11441,-2845,68),ang=Angle()},{pos=Vector(-11218,-609,68),ang=Angle()},{pos=Vector(-10213,-695,68),ang=Angle()},{pos=Vector(-8697,-781,68),ang=Angle()},{pos=Vector(-7194,-407,68),ang=Angle()},{pos=Vector(-8586,949,68),ang=Angle()},{pos=Vector(-7243,2065,68),ang=Angle()},{pos=Vector(-7966,2737,64),ang=Angle()},{pos=Vector(-7945,4097,68),ang=Angle()}},{{pos=Vector(-7941,3830,68),ang=Angle()},{pos=Vector(-7942,2897,64),ang=Angle()},{pos=Vector(-7944,1423,64),ang=Angle()},{pos=Vector(-7959,91,64),ang=Angle()},{pos=Vector(-7932,-1466,64),ang=Angle()},{pos=Vector(-7907,-3754,64),ang=Angle()},{pos=Vector(-7934,-4998,64),ang=Angle()},{pos=Vector(-6760,-7800,260),ang=Angle()},{pos=Vector(-6923,-8921,253),ang=Angle()},{pos=Vector(-6376,-10373,230),ang=Angle()},{pos=Vector(-4913,-11668,296),ang=Angle()},{pos=Vector(-4394,-12560,193),ang=Angle()},{pos=Vector(-5262,-12698,271),ang=Angle()},{pos=Vector(-6298,-12930,377),ang=Angle()},{pos=Vector(-7163,-13030,333),ang=Angle()},{pos=Vector(-8271,-13251,332),ang=Angle()},{pos=Vector(-9124,-13669,353),ang=Angle()},{pos=Vector(-9833,-13043,323),ang=Angle()},{pos=Vector(-10644,-12740,279),ang=Angle()},{pos=Vector(-11541,-13560,299),ang=Angle()},{pos=Vector(-12502,-13582,440),ang=Angle()},{pos=Vector(-12828,-12759,598),ang=Angle()},{pos=Vector(-12582,-11884,689),ang=Angle()},{pos=Vector(-13143,-11178,528),ang=Angle()},{pos=Vector(-13507,-10504,229),ang=Angle()},{pos=Vector(-13316,-9829,255),ang=Angle()},{pos=Vector(-12709,-8961,253),ang=Angle()},{pos=Vector(-12278,-8346,416),ang=Angle()},{pos=Vector(-11731,-7484,312),ang=Angle()},{pos=Vector(-11007,-7026,297),ang=Angle()},{pos=Vector(-10469,-6490,222),ang=Angle()},{pos=Vector(-10100,-5773,148),ang=Angle()},{pos=Vector(-9143,-5488,77),ang=Angle()},{pos=Vector(-7957,-5379,64),ang=Angle()},{pos=Vector(-7942,-4603,64),ang=Angle()},{pos=Vector(-7919,-3187,64),ang=Angle()},{pos=Vector(-7912,-1710,64),ang=Angle()},{pos=Vector(-7931,-359,64),ang=Angle()},{pos=Vector(-7947,846,64),ang=Angle()},{pos=Vector(-7956,2224,64),ang=Angle()},{pos=Vector(-7968,3987,68),ang=Angle()}},{{pos=Vector(-7975,3955,68),ang=Angle()},{pos=Vector(-7916,1881,64),ang=Angle()},{pos=Vector(-7948,731,64),ang=Angle()},{pos=Vector(-7996,-2614,64),ang=Angle()},{pos=Vector(-7932,-4875,64),ang=Angle()},{pos=Vector(-7166,-5620,70),ang=Angle()},{pos=Vector(-5883,-5513,80),ang=Angle()},{pos=Vector(-4661,-5518,84),ang=Angle()},{pos=Vector(-3362,-5711,103),ang=Angle()},{pos=Vector(-2306,-6066,242),ang=Angle()},{pos=Vector(-1010,-6024,206),ang=Angle()},{pos=Vector(129,-6776,204),ang=Angle()},{pos=Vector(1092,-7274,193),ang=Angle()},{pos=Vector(2972,-7313,-113),ang=Angle()},{pos=Vector(3880,-6685,-241),ang=Angle()},{pos=Vector(4625,-5892,-386),ang=Angle()},{pos=Vector(4758,-4175,-520),ang=Angle()},{pos=Vector(4719,-2776,-540),ang=Angle()},{pos=Vector(4774,-1104,-552),ang=Angle()},{pos=Vector(4934,392,-574),ang=Angle()},{pos=Vector(6463,1066,-703),ang=Angle()},{pos=Vector(8364,1049,-710),ang=Angle()},{pos=Vector(9545,125,-672),ang=Angle()},{pos=Vector(9838,-1466,-577),ang=Angle()},{pos=Vector(9886,-2797,-609),ang=Angle()},{pos=Vector(11156,-3704,-561),ang=Angle()},{pos=Vector(12106,-4296,-597),ang=Angle()},{pos=Vector(12473,-5370,-676),ang=Angle()},{pos=Vector(12341,-6998,-767),ang=Angle()},{pos=Vector(12323,-8510,-694),ang=Angle()},{pos=Vector(12382,-9903,-796),ang=Angle()},{pos=Vector(11445,-10610,-756),ang=Angle()},{pos=Vector(10633,-11170,-830),ang=Angle()},{pos=Vector(10158,-11881,-842),ang=Angle()},{pos=Vector(9338,-12610,-762),ang=Angle()},{pos=Vector(8334,-12969,-675),ang=Angle()},{pos=Vector(7981,-14255,-715),ang=Angle()},{pos=Vector(8441,-14912,-519),ang=Angle()},{pos=Vector(7522,-15402,-381),ang=Angle()},{pos=Vector(6378,-15565,-388),ang=Angle()},{pos=Vector(5533,-15428,-295),ang=Angle()},{pos=Vector(4910,-15432,-271),ang=Angle()},{pos=Vector(3903,-15565,-248),ang=Angle()},{pos=Vector(3161,-15543,-246),ang=Angle()},{pos=Vector(2042,-15158,-263),ang=Angle()},{pos=Vector(1177,-14588,-333),ang=Angle()},{pos=Vector(184,-14628,-454),ang=Angle()},{pos=Vector(-412,-14184,-448),ang=Angle()},{pos=Vector(-446,-13663,-448),ang=Angle()},{pos=Vector(-910,-13824,-464),ang=Angle()}}}})srp.patrols.AddRoutes('rp_liberator_sup_b8at',{REPUBLIC={{{pos=Vector(5918.038086,-11.098198,-239.968750),ang=Angle()},{pos=Vector(4828.145020,6.892294,-95.968750),ang=Angle()},{pos=Vector(3753.008545,4.627341,32.031250),ang=Angle()},{pos=Vector(3580.944336,-967.082825,32.031250),ang=Angle()},{pos=Vector(1035.368042,-1570.781006,32.031250),ang=Angle()},{pos=Vector(-227.760193,-1599.251099,-495.968750),ang=Angle()},{pos=Vector(-246.041748,-1350.420288,-495.968750),ang=Angle()},{pos=Vector(-920.611572,-1343.905640,-495.968750),ang=Angle()},{pos=Vector(-2404.482666,-1346.460938,-303.968750),ang=Angle()},{pos=Vector(-3701.937988,-1344.865356,-303.968750),ang=Angle()},{pos=Vector(-3724.664063,27.190536,-303.968750),ang=Angle()},{pos=Vector(-3714.862793,1356.062988,-303.968750),ang=Angle()},{pos=Vector(-3263.238525,1227.458618,-303.968750),ang=Angle()},{pos=Vector(-2724.287598,992.518860,-303.968750),ang=Angle()},{pos=Vector(-1982.492065,987.769897,32.031250),ang=Angle()},{pos=Vector(-2010.343262,34.084198,32.031250),ang=Angle()},{pos=Vector(-7366.877441,9.057798,32.031250),ang=Angle()},{pos=Vector(-7587.523926,475.762268,32.031250),ang=Angle()},{pos=Vector(-7036.919434,638.984131,-175.968750),ang=Angle()},{pos=Vector(-7039.845215,-13.694748,-239.968750),ang=Angle()},{pos=Vector(-3980.709961,3.262562,-300.841858),ang=Angle()},{pos=Vector(-3496.058350,-0.484215,-303.968750),ang=Angle()},{pos=Vector(-3203.896240,396.150726,-303.968750),ang=Angle()},{pos=Vector(-2281.786865,318.512024,-303.968750),ang=Angle()},{pos=Vector(-2328.434570,-386.806427,-303.968750),ang=Angle()},{pos=Vector(-3412.472900,-443.448273,-303.968750),ang=Angle()},{pos=Vector(-3511.915039,-1.634026,-303.968750),ang=Angle()},{pos=Vector(-3724.510986,17.292875,-303.968750),ang=Angle()},{pos=Vector(-3708.137939,-1041.177490,-303.968750),ang=Angle()},{pos=Vector(-3269.009766,-1232.681519,-303.968750),ang=Angle()},{pos=Vector(-2935.275391,-990.581726,-303.968750),ang=Angle()},{pos=Vector(-1967.745239,-993.068420,32.031250),ang=Angle()},{pos=Vector(-355.587616,-970.975891,32.031250),ang=Angle()},{pos=Vector(2370.422119,-1124.937012,32.031250),ang=Angle()},{pos=Vector(3607.558105,-0.358307,32.031265),ang=Angle()},{pos=Vector(4834.070313,4.213567,-95.968750),ang=Angle()},{pos=Vector(5765.301270,-9.040237,-239.968750),ang=Angle()},{pos=Vector(5764.267578,-1062.020630,-239.968750),ang=Angle()},{pos=Vector(5760.863281,-1408.926514,-237.218750),ang=Angle()},{pos=Vector(5760.889648,-1199.468506,560.031250),ang=Angle()},{pos=Vector(5866.697266,-591.767273,560.031250),ang=Angle()},{pos=Vector(6142.410645,61.048538,560.031250),ang=Angle()},{pos=Vector(6173.353516,1251.081299,560.031250),ang=Angle()},{pos=Vector(5975.087402,1278.351563,560.031250),ang=Angle()},{pos=Vector(5970.906738,50.826721,16.031250),ang=Angle()},{pos=Vector(6260.016602,-0.404985,16.031250),ang=Angle()},{pos=Vector(6270.136230,683.396606,16.031250),ang=Angle()},{pos=Vector(6480.624512,694.657532,-47.968750),ang=Angle()},{pos=Vector(6476.670410,267.787994,-239.968750),ang=Angle()},{pos=Vector(5964.871094,-7.230377,-239.968750),ang=Angle()},{pos=Vector(6090.535645,-42.466667,-239.968750),ang=Angle()}},{{pos=Vector(5286,0,-752),ang=Angle()},{pos=Vector(4033,5,-752),ang=Angle()},{pos=Vector(4033,-1118,-752),ang=Angle()},{pos=Vector(4038,-1343,-752),ang=Angle()},{pos=Vector(3711,-1346,-750),ang=Angle()},{pos=Vector(2791,-1345,-686),ang=Angle()},{pos=Vector(1460,-1343,-575),ang=Angle()},{pos=Vector(434,-1345,-496),ang=Angle()},{pos=Vector(-243,-1345,-496),ang=Angle()},{pos=Vector(-248,-753,-496),ang=Angle()},{pos=Vector(290,-250,-496),ang=Angle()},{pos=Vector(220,417,-496),ang=Angle()},{pos=Vector(-255,1025,-496),ang=Angle()},{pos=Vector(-290,1388,-496),ang=Angle()},{pos=Vector(-225,1618,-496),ang=Angle()},{pos=Vector(119,1598,-373),ang=Angle()},{pos=Vector(883,1599,12),ang=Angle()},{pos=Vector(1926,1590,32),ang=Angle()},{pos=Vector(3360,1466,32),ang=Angle()},{pos=Vector(3605,809,32),ang=Angle()},{pos=Vector(3609,-773,32),ang=Angle()},{pos=Vector(3201,-1181,32),ang=Angle()},{pos=Vector(2072,-1158,32),ang=Angle()},{pos=Vector(895,-1182,32),ang=Angle()},{pos=Vector(373,-637,32),ang=Angle()},{pos=Vector(-139,-102,32),ang=Angle()},{pos=Vector(-1259,940,32),ang=Angle()},{pos=Vector(-1925,968,32),ang=Angle()},{pos=Vector(-2746,989,-304),ang=Angle()},{pos=Vector(-3288,1002,-304),ang=Angle()},{pos=Vector(-3278,1351,-304),ang=Angle()},{pos=Vector(-3718,1332,-304),ang=Angle()},{pos=Vector(-3705,720,-304),ang=Angle()},{pos=Vector(-3710,-28,-304),ang=Angle()},{pos=Vector(-4188,1,-296),ang=Angle()},{pos=Vector(-5580,0,-265),ang=Angle()},{pos=Vector(-6857,1,-240),ang=Angle()},{pos=Vector(-7040,-2,-240),ang=Angle()},{pos=Vector(-7117,-677,-170),ang=Angle()},{pos=Vector(-7580,-634,32),ang=Angle()},{pos=Vector(-7672,-98,32),ang=Angle()},{pos=Vector(-7592,404,32),ang=Angle()},{pos=Vector(-6976,613,-145),ang=Angle()},{pos=Vector(-7054,635,-176),ang=Angle()},{pos=Vector(-7040,15,-240),ang=Angle()},{pos=Vector(-4682,-6,-285),ang=Angle()},{pos=Vector(-3951,1,-302),ang=Angle()},{pos=Vector(-3699,-95,-304),ang=Angle()},{pos=Vector(-3711,-1048,-304),ang=Angle()},{pos=Vector(-3565,-1315,-304),ang=Angle()},{pos=Vector(-972,-1339,-492),ang=Angle()},{pos=Vector(-265,-1241,-496),ang=Angle()},{pos=Vector(-176,-482,-496),ang=Angle()},{pos=Vector(189,-89,-496),ang=Angle()},{pos=Vector(425,13,-496),ang=Angle()},{pos=Vector(433,436,-640),ang=Angle()},{pos=Vector(62,428,-768),ang=Angle()},{pos=Vector(-194,7,-768),ang=Angle()}},{{pos=Vector(5301,397,-752),ang=Angle()},{pos=Vector(5426,4,-752),ang=Angle()},{pos=Vector(4167,2,-752),ang=Angle()},{pos=Vector(3742,-77,-743),ang=Angle()},{pos=Vector(3761,-475,-544),ang=Angle()},{pos=Vector(4046,-409,-544),ang=Angle()},{pos=Vector(4088,-8,-497),ang=Angle()},{pos=Vector(4841,-2,-544),ang=Angle()},{pos=Vector(5286,34,-544),ang=Angle()},{pos=Vector(5710,130,-544),ang=Angle()},{pos=Vector(5696,13,-517),ang=Angle()},{pos=Vector(5273,4,-376),ang=Angle()},{pos=Vector(4794,166,-234),ang=Angle()},{pos=Vector(4970,118,-240),ang=Angle()},{pos=Vector(5653,118,-240),ang=Angle()},{pos=Vector(5769,499,-240),ang=Angle()},{pos=Vector(6161,498,-240),ang=Angle()},{pos=Vector(6169,193,-240),ang=Angle()},{pos=Vector(6253,-267,-240),ang=Angle()},{pos=Vector(6472,-273,-240),ang=Angle()},{pos=Vector(6384,-711,-26),ang=Angle()},{pos=Vector(6255,-597,16),ang=Angle()},{pos=Vector(6089,-60,16),ang=Angle()},{pos=Vector(5972,-150,27),ang=Angle()},{pos=Vector(5981,-1290,560),ang=Angle()},{pos=Vector(6150,-1932,560),ang=Angle()},{pos=Vector(6245,-1311,560),ang=Angle()},{pos=Vector(6131,-705,560),ang=Angle()},{pos=Vector(6165,318,560),ang=Angle()},{pos=Vector(6147,1793,560),ang=Angle()},{pos=Vector(5907,1407,560),ang=Angle()},{pos=Vector(5965,1233,560),ang=Angle()},{pos=Vector(5979,-5,16),ang=Angle()},{pos=Vector(6292,23,16),ang=Angle()},{pos=Vector(6266,666,16),ang=Angle()},{pos=Vector(6475,686,-48),ang=Angle()},{pos=Vector(6420,271,-240),ang=Angle()},{pos=Vector(5992,239,-240),ang=Angle()},{pos=Vector(5513,-5,-218),ang=Angle()},{pos=Vector(4971,3,-116),ang=Angle()},{pos=Vector(3824,-3,32),ang=Angle()},{pos=Vector(3534,-4,32),ang=Angle()}}}})srp.patrols.AddRoutes('rp_rishimoon_crimson_s',{REPUBLIC={{{id=1,pos=Vector(-7086.730957,-9727.866211,0.031250),ang=Angle(0,0,0)},{id=2,pos=Vector(-6139.466309,-9730.140625,0.031250),ang=Angle(0,0,0)},{id=3,pos=Vector(-4814.196777,-9734.857422,0.031250),ang=Angle(0,0,0)},{id=4,pos=Vector(-3651.329102,-9707.226563,0.031219),ang=Angle(0,0,0)},{id=5,pos=Vector(-3482.437012,-8028.698730,0.031250),ang=Angle(0,0,0)},{id=6,pos=Vector(-3009.551514,-7332.868652,2.795746),ang=Angle(0,0,0),data={CaptureTickCount=.05,CaptureZoneSize=400}},{id=7,pos=Vector(-3472.973877,-6260.151855,0.031250),ang=Angle(0,0,0)},{id=8,pos=Vector(-3478.897705,-5651.258301,0.031250),ang=Angle(0,0,0)},{id=9,pos=Vector(-4748.052246,-5698.011230,0.031250),ang=Angle(0,0,0)},{id=10,pos=Vector(-5198.793945,-6496.977051,0.031250),ang=Angle(0,0,0)},{id=11,pos=Vector(-5106.490234,-7440.140137,0.031250),ang=Angle(0,0,0)},{id=12,pos=Vector(-5301.556641,-8676.941406,0.031250),ang=Angle(0,0,0)},{id=13,pos=Vector(-5277.262695,-9705.993164,0.031250),ang=Angle(0,0,0)},{id=14,pos=Vector(-8131.940918,-9720.204102,0.031250),ang=Angle(0,0,0)}},{{id=1,pos=Vector(-6710.076172,-9717.901367,0.031250),ang=Angle(0.000000,-19.951704,0.000000)},{id=2,pos=Vector(-6129.255371,-9757.959961,0.031250),ang=Angle(0.000000,-7.279703,0.000000)},{id=3,pos=Vector(-6081.706543,-10709.063477,0.031250),ang=Angle(0.000000,-85.599724,0.000000)},{id=4,pos=Vector(-5400.565430,-10767.534180,12.987976),ang=Angle(0.000000,17.984358,0.000000)},{id=5,pos=Vector(-4191.935547,-10767.089844,6.759689),ang=Angle(0.000000,4.960359,0.000000)},{id=6,pos=Vector(-2711.605469,-10781.356445,20.332642),ang=Angle(0.000000,0.912358,0.000000)},{id=7,pos=Vector(-2022.869995,-11537.635742,45.597931),ang=Angle(0.000000,-44.352699,0.000000)},{id=8,pos=Vector(-2046.179443,-13672.220703,42.849243),ang=Angle(0.000000,-83.039764,0.000000)},{id=9,pos=Vector(-5965.849609,-13685.858398,41.021606),ang=Angle(0.000000,-177.407761,0.000000)},{id=10,pos=Vector(-6096.904785,-10247.472656,0.031246),ang=Angle(0.000000,90.784538,0.000000)},{id=11,pos=Vector(-6097.561523,-9881.659180,0.031250),ang=Angle(0.000000,78.445694,0.000000)},{id=12,pos=Vector(-5375.878906,-9724.446289,0.031265),ang=Angle(0.000000,-2.479228,0.000000)},{id=13,pos=Vector(-5314.068848,-9391.202148,0.031250),ang=Angle(0.000000,87.031143,0.000000)},{id=14,pos=Vector(-5314.599121,-8327.391602,0.031250),ang=Angle(0.000000,89.696114,0.000000)},{id=15,pos=Vector(-5302.814941,-6163.107910,0.031250),ang=Angle(0.000000,90.224083,0.000000)},{id=16,pos=Vector(-6079.736328,-5694.999023,0.031281),ang=Angle(0.000000,-158.725098,0.000000)},{id=17,pos=Vector(-6897.820801,-5678.051758,0.031219),ang=Angle(0.000000,-178.607925,0.000000)},{id=18,pos=Vector(-6931.486816,-7125.934570,0.031250),ang=Angle(0.000000,-129.414581,0.000000)},{id=19,pos=Vector(-6940.719727,-8613.190430,0.031250),ang=Angle(0.000000,-95.711884,0.000000)},{id=20,pos=Vector(-6951.355469,-9751.794922,0.031250),ang=Angle(0.000000,-90.783966,0.000000)},{id=21,pos=Vector(-6952.174316,-10996.932617,0.031250),ang=Angle(0.000000,-90.931801,0.000000)},{id=22,pos=Vector(-6952.099121,-12182.287109,0.031250),ang=Angle(0.000000,-103.631798,0.000000)},{id=23,pos=Vector(-8105.069336,-12466.066406,0.031250),ang=Angle(0.000000,-177.841446,0.000000)}},{{id=1,pos=Vector(-6900.533691,-9741.821289,0.031281),ang=Angle(0.000000,64.623955,0.000000)},{id=2,pos=Vector(-5313.676270,-9644.478516,0.031128),ang=Angle(0.000000,125.607758,0.000000)},{id=3,pos=Vector(-5324.029297,-8679.403320,0.031250),ang=Angle(0.000000,97.711777,0.000000)},{id=4,pos=Vector(-5323.778320,-7844.574219,0.031250),ang=Angle(0.000000,93.311752,0.000000)},{id=5,pos=Vector(-5294.330566,-6306.205078,0.031250),ang=Angle(0.000000,88.383896,0.000000)},{id=6,pos=Vector(-5073.696777,-4604.201172,0.031250),ang=Angle(0.000000,77.471985,0.000000)},{id=7,pos=Vector(-3941.662109,-3748.809570,0.031250),ang=Angle(0.000000,34.703888,0.000000)},{id=8,pos=Vector(-2804.265137,-3667.262451,0.031281),ang=Angle(0.000000,14.815888,0.000000)},{id=9,pos=Vector(-2348,-3224,0),ang=Angle(0,0,0),class='rp_routebuttons',data={waittime=5,resettime=3,buttons={{pos=Vector(-2857,-3256,60),ang=Angle(90,0,0)},{pos=Vector(-1785,-3256,60),ang=Angle(90,180,0)}},open={1854}}},{id=10,pos=Vector(-2347.153076,-2331.408447,-11.660767),ang=Angle(0.000000,-83.743668,0.000000)},{id=11,pos=Vector(-1328.133545,-1753.321411,17.340820),ang=Angle(0.000000,-7.711660,0.000000)},{id=12,pos=Vector(-257.279724,-1227.120361,10.044678),ang=Angle(0.000000,-72.919510,0.000000)},{id=13,pos=Vector(393.036072,-430.255005,45.293091),ang=Angle(0.000000,23.088444,0.000000)},{id=14,pos=Vector(698.317993,510.173462,90.302002),ang=Angle(0.000000,58.816463,0.000000)},{id=15,pos=Vector(307.652710,1261.435303,105.691528),ang=Angle(0.000000,94.720474,0.000000)},{id=16,pos=Vector(-795.463501,1721.646851,115.376099),ang=Angle(0.000000,144.176300,0.000000)},{id=17,pos=Vector(-1931.721191,1943.929443,67.462036),ang=Angle(0.000000,160.896317,0.000000)},{id=18,pos=Vector(-3270.334473,1360.337646,19.623413),ang=Angle(0.000000,-110.047768,0.000000)},{id=19,pos=Vector(-4891.139648,1048.821411,5.265259),ang=Angle(0.000000,-153.783875,0.000000)},{id=20,pos=Vector(-5460.759277,491.495209,51.035889),ang=Angle(0.000000,-152.463730,0.000000)},{id=21,pos=Vector(-5811.052246,-300.565338,72.860962),ang=Angle(0.000000,-128.527679,0.000000)},{id=22,pos=Vector(-5704.750488,-1949.389404,6.146484),ang=Angle(0.000000,-88.575760,0.000000)},{id=23,pos=Vector(-5030.938477,-2654.144775,9.532227),ang=Angle(0.000000,0.480159,0.000000)}},{{id=1,pos=Vector(-6942.935059,-9722.319336,0.031250),ang=Angle(0.000000,-2.943927,0.000000)},{id=2,pos=Vector(-6948.266113,-10773.618164,0.031250),ang=Angle(0.000000,141.104187,0.000000)},{id=3,pos=Vector(-6938.656738,-11739.982422,0.031250),ang=Angle(0.000000,-136.351944,0.000000)},{id=4,pos=Vector(-6956.734863,-12521.194336,0.031250),ang=Angle(0.000000,-100.271912,0.000000)},{id=5,pos=Vector(-7326.898438,-13064.677734,0.031250),ang=Angle(0.000000,-111.887932,0.000000)},{id=6,pos=Vector(-7877.066406,-12920.238281,0.031250),ang=Angle(0.000000,-134.503967,0.000000)},{id=7,pos=Vector(-7898.698242,-11992.849609,0.031250),ang=Angle(0.000000,-171.375900,0.000000)},{id=8,pos=Vector(-6957.768555,-11877.207031,0.031250),ang=Angle(0.000000,-164.512070,0.000000)},{id=9,pos=Vector(-6952.205078,-10753.567383,0.031311),ang=Angle(0.000000,95.519951,0.000000)},{id=10,pos=Vector(-6944.254883,-9715.953125,0.031250),ang=Angle(0.000000,93.407982,0.000000)},{id=11,pos=Vector(-6919.739746,-7448.554688,0.031250),ang=Angle(0.000000,89.536018,0.000000)},{id=12,pos=Vector(-6927.007324,-5703.863281,0.031250),ang=Angle(0.000000,90.240028,0.000000)},{id=13,pos=Vector(-6984.385254,-4542.243164,0.031250),ang=Angle(0.000000,93.231941,0.000000)},{id=14,pos=Vector(-7686.105469,-4485.093750,0.031189),ang=Angle(0.000000,152.543762,0.000000)},{id=15,pos=Vector(-8942.022461,-4497.572266,0.031250),ang=Angle(0.000000,169.791702,0.000000)},{id=16,pos=Vector(-9830.332031,-4501.333008,0.031250),ang=Angle(0.000000,175.951660,0.000000)},{id=17,pos=Vector(-11031.174805,-4506.602539,0.031311),ang=Angle(0.000000,179.647552,0.000000)},{id=18,pos=Vector(-12376.406250,-4509.990723,0.031250),ang=Angle(0.000000,-179.472473,0.000000)},{id=19,pos=Vector(-13421.001953,-4494.957520,0.031250),ang=Angle(0.000000,179.999542,0.000000)},{id=20,pos=Vector(-14055.525391,-4496.584961,0.031250),ang=Angle(0.000000,-179.472473,0.000000)}},{{id=1,pos=Vector(-6942.725098,-9735.053711,0.031250),ang=Angle(0.000000,-9.280038,0.000000)},{id=2,pos=Vector(-5272.818848,-9732.780273,0.031250),ang=Angle(0.000000,-1.360011,0.000000)},{id=3,pos=Vector(-3600.490234,-9723.537109,0.031250),ang=Angle(0.000000,0.223989,0.000000)},{id=4,pos=Vector(-3485.646240,-8379.893555,0.031250),ang=Angle(0.000000,89.807968,0.000000)},{id=5,pos=Vector(-3102.531738,-7328.709961,2.327393),ang=Angle(0.000000,69.392036,0.000000)},{id=6,pos=Vector(-3489.899658,-6515.023926,0.031250),ang=Angle(0.000000,91.039970,0.000000)},{id=7,pos=Vector(-3515.253174,-5710.713379,0.031250),ang=Angle(0.000000,94.031990,0.000000)},{id=8,pos=Vector(-4516.562500,-5705.454102,0.031250),ang=Angle(0.000000,157.039932,0.000000)},{id=9,pos=Vector(-5157.438965,-4833.895508,0.031250),ang=Angle(0.000000,92.271721,0.000000)},{id=10,pos=Vector(-4351.350098,-3828.513184,0.031250),ang=Angle(0.000000,61.295647,0.000000)},{id=11,pos=Vector(-2872.727783,-3672.325928,0.031250),ang=Angle(0.000000,24.687637,0.000000)},{id=12,pos=Vector(-2348,-3224,0),ang=Angle(0,0,0),class='rp_routebuttons',data={waittime=5,resettime=3,buttons={{pos=Vector(-2857,-3256,60),ang=Angle(90,0,0)},{pos=Vector(-1785,-3256,60),ang=Angle(90,180,0)}},open={1854}}},{id=13,pos=Vector(-1557.681274,-2276.933105,4.013977),ang=Angle(0.000000,21.695581,0.000000)},{id=14,pos=Vector(-1201.579102,-3603.184082,10.142456),ang=Angle(0.000000,-89.184349,0.000000)},{id=15,pos=Vector(-1191.521606,-4939.919922,-7.788574),ang=Angle(0.000000,-90.328270,0.000000)},{id=16,pos=Vector(-1160.473145,-6219.747070,23.015381),ang=Angle(0.000000,-89.360298,0.000000)},{id=17,pos=Vector(-1138.044189,-7631.784668,22.494263),ang=Angle(0.000000,-89.184303,0.000000)},{id=18,pos=Vector(-1115.990601,-9180.684570,14.348999),ang=Angle(0.000000,-89.184303,0.000000)},{id=19,pos=Vector(-392.768494,-9878.042969,78.889038),ang=Angle(0.000000,-64.984360,0.000000)},{id=20,pos=Vector(1191.509766,-10437.148438,25.678955),ang=Angle(0.000000,-33.832375,0.000000)},{id=21,pos=Vector(2126.920898,-10120.271484,64.339233),ang=Angle(0.000000,-6.816353,0.000000)},{id=22,pos=Vector(3412.903320,-9265.908203,65.098999),ang=Angle(0.000000,20.463631,0.000000)},{id=23,pos=Vector(4016.950684,-7996.777344,25.363525),ang=Angle(0.000000,56.367638,0.000000)},{id=24,pos=Vector(3118.762695,-7042.939453,111.351807),ang=Angle(0.000000,118.319603,0.000000)},{id=25,pos=Vector(3028.327881,-5918.859375,98.333984),ang=Angle(0.000000,101.775696,0.000000)},{id=26,pos=Vector(2711.599854,-4819.435547,30.817017),ang=Angle(0.000000,104.679672,0.000000)},{id=27,pos=Vector(2192.700684,-3600.277344,54.130371),ang=Angle(0.000000,111.367638,0.000000)},{id=28,pos=Vector(1276.935547,-3256.657471,9.180786),ang=Angle(0.000000,155.103699,0.000000)},{id=29,pos=Vector(195.754333,-2956.744141,7.403076),ang=Angle(0.000000,156.159760,0.000000)},{id=30,pos=Vector(-2240.732178,-2532.398682,-3.037842),ang=Angle(0.000000,172.175705,0.000000)}},{{id=1,pos=Vector(-6935.768555,-9734.144531,0.031250),ang=Angle(0.000000,-15.679440,0.000000)},{id=2,pos=Vector(-6093.459473,-9762.686523,0.031250),ang=Angle(0.000000,-6.175443,0.000000)},{id=3,pos=Vector(-4891.150391,-9707.767578,0.031281),ang=Angle(0.000000,-144.511230,0.000000)},{id=4,pos=Vector(-3690.553955,-9692.046875,0.031250),ang=Angle(0.000000,-12.423247,0.000000)},{id=5,pos=Vector(-3461.928955,-9033.636719,0.031250),ang=Angle(0.000000,65.632751,0.000000)},{id=6,pos=Vector(-2546.185791,-8848.606445,4.975739),ang=Angle(0.000000,30.080774,0.000000)},{id=7,pos=Vector(-1790.032715,-9069.364258,2.469116),ang=Angle(0.000000,-9.519218,0.000000)},{id=8,pos=Vector(-1645.313232,-9076.794922,124.031265),ang=Angle(0.000000,-4.767220,0.000000)},{id=9,pos=Vector(-1648.625732,-8321.061523,124.031250),ang=Angle(0.000000,88.336899,0.000000)},{id=10,pos=Vector(-1648.127197,-7532.409180,124.031281),ang=Angle(0.000000,89.216911,0.000000)},{id=11,pos=Vector(-1650.607300,-6669.827637,124.031250),ang=Angle(0.000000,89.920891,0.000000)},{id=12,pos=Vector(-1649.332153,-5746.077637,124.031281),ang=Angle(0.000000,89.920891,0.000000)},{id=13,pos=Vector(-1645.786499,-5125.149902,124.031250),ang=Angle(0.000000,89.216911,0.000000)},{id=14,pos=Vector(-1652.550659,-4200.385742,124.031250),ang=Angle(0.000000,92.208817,0.000000)},{id=15,pos=Vector(-2313.360352,-4199.637207,124.031265),ang=Angle(0.000000,-179.087051,0.000000)},{id=16,pos=Vector(-2957.540527,-4209.570801,124.031281),ang=Angle(0.000000,-179.615036,0.000000)},{id=17,pos=Vector(-3838.856445,-4207.875977,124.031250),ang=Angle(0.000000,-179.791031,0.000000)},{id=18,pos=Vector(-3830.597412,-4931.255371,124.031219),ang=Angle(0.000000,-88.974983,0.000000)},{id=19,pos=Vector(-3829.167969,-5701.717285,148.031250),ang=Angle(0.000000,-90.206947,0.000000)},{id=20,pos=Vector(-3831.872803,-6383.462402,124.031250),ang=Angle(0.000000,-90.206993,0.000000)},{id=21,pos=Vector(-3834.169434,-6929.617188,124.031281),ang=Angle(0.000000,-90.734978,0.000000)},{id=22,pos=Vector(-3830.182617,-7592.962891,124.031250),ang=Angle(0.000000,-89.327019,0.000000)},{id=23,pos=Vector(-3831.643311,-8127.463867,124.031265),ang=Angle(0.000000,-90.558983,0.000000)},{id=24,pos=Vector(-3838.269775,-8598.008789,124.031235),ang=Angle(0.000000,-90.734978,0.000000)},{id=25,pos=Vector(-3837.439697,-9233.980469,124.031281),ang=Angle(0.000000,-89.855003,0.000000)},{id=26,pos=Vector(-4422.215332,-9234.071289,124.031250),ang=Angle(0.000000,174.929047,0.000000)},{id=27,pos=Vector(-5315.626953,-9231.452148,148.031250),ang=Angle(0.000000,178.097031,0.000000)},{id=28,pos=Vector(-6559.298828,-9223.914063,124.031265),ang=Angle(0.000000,179.504990,0.000000)},{id=29,pos=Vector(-6549.937500,-8767.418945,124.031281),ang=Angle(0.000000,95.201012,0.000000)},{id=30,pos=Vector(-6551.723145,-8311.746094,124.031235),ang=Angle(0.000000,89.041115,0.000000)},{id=31,pos=Vector(-6550.943848,-7870.136719,124.031250),ang=Angle(0.000000,90.009087,0.000000)},{id=32,pos=Vector(-6550.010742,-7376.199707,124.031250),ang=Angle(0.000000,89.745094,0.000000)},{id=33,pos=Vector(-6533.601563,-6919.301270,124.031189),ang=Angle(0.000000,-2.478876,0.000000)},{id=34,pos=Vector(-6529.827637,-6383.015625,124.031250),ang=Angle(0.000000,-1.950876,0.000000)},{id=35,pos=Vector(-6538.244629,-5695.581055,148.031250),ang=Angle(0.000000,-2.126876,0.000000)},{id=36,pos=Vector(-6526.081543,-5238.164551,124.031250),ang=Angle(0.000000,-3.358876,0.000000)},{id=37,pos=Vector(-5904.253418,-5230.235840,124.031250),ang=Angle(0.000000,0.161125,0.000000)},{id=38,pos=Vector(-5893.541016,-4782.223633,124.031219),ang=Angle(0.000000,13.713152,0.000000)},{id=39,pos=Vector(-5601.172363,-4786.549316,0.031250),ang=Angle(0.000000,132.865173,0.000000)},{id=40,pos=Vector(-5590.889648,-5340.084473,0.031250),ang=Angle(0.000000,-116.430733,0.000000)},{id=41,pos=Vector(-6177.233398,-5693.127930,0.031250),ang=Angle(0.000000,-134.206619,0.000000)},{id=42,pos=Vector(-6941.413086,-5694.840820,0.031250),ang=Angle(0.000000,-153.214630,0.000000)},{id=43,pos=Vector(-6942.785645,-6668.526855,0.031250),ang=Angle(0.000000,-94.430649,0.000000)},{id=44,pos=Vector(-6933.289063,-7591.195801,0.031250),ang=Angle(0.000000,-90.558708,0.000000)},{id=45,pos=Vector(-6940.666992,-8347.463867,0.031250),ang=Angle(0.000000,-90.558708,0.000000)},{id=46,pos=Vector(-6933.019043,-9731.805664,0.031250),ang=Angle(0.000000,-89.502739,0.000000)}}}})srp.patrols.AddRoutes('rp_coruscantbelow',{REPUBLIC={{{id=1,pos=Vector(-2454.308350,2747.611328,-31.968750),ang=Angle(0.000000,-90.856194,0.000000)},{id=2,pos=Vector(-2454.444580,1610.991699,-31.968750),ang=Angle(0.000000,-86.808296,0.000000)},{id=3,pos=Vector(-1001.690063,1642.065674,-31.968750),ang=Angle(0.000000,29.155109,0.000000)},{id=4,pos=Vector(-993.363037,3021.173828,-31.968750),ang=Angle(0.000000,75.400734,0.000000)},{id=5,pos=Vector(43.260956,3034.779541,-31.968742),ang=Angle(0.000000,-1.699589,0.000000)},{id=6,pos=Vector(1241.946045,3278.814941,-31.968765),ang=Angle(0.000000,12.983613,0.000000)},{id=7,pos=Vector(1270.046997,4287.447266,-31.968750),ang=Angle(0.000000,75.710808,0.000000)},{id=8,pos=Vector(2667.029297,4401.091309,-31.968750),ang=Angle(0.000000,12.631582,0.000000)},{id=9,pos=Vector(2814.669678,5135.471191,-31.968750),ang=Angle(0.000000,62.087517,0.000000)},{id=10,pos=Vector(2829.172607,5633.590332,-31.968746),ang=Angle(0.000000,80.447044,0.000000)},{id=11,pos=Vector(2384.796875,6314.160156,-31.968750),ang=Angle(0.000000,88.031166,0.000000)},{id=12,pos=Vector(2054.500732,7909.724609,-31.968742),ang=Angle(0.000000,104.151367,0.000000)},{id=13,pos=Vector(2071.172852,8529.469727,-31.968742),ang=Angle(0.000000,67.340485,0.000000)},{id=14,pos=Vector(2016.098267,9380.348633,-31.968750),ang=Angle(0.000000,94.556076,0.000000)},{id=15,pos=Vector(2189.303711,10383.982422,-31.968742),ang=Angle(0.000000,87.611473,0.000000)},{id=16,pos=Vector(2232.481689,11285.596680,-31.968750),ang=Angle(0.000000,86.903275,0.000000)},{id=17,pos=Vector(3573.296143,11303.367188,-31.968750),ang=Angle(0.000000,-6.552723,0.000000)},{id=18,pos=Vector(2228.596924,11310.471680,-31.968750),ang=Angle(0.000000,66.311127,0.000000)},{id=19,pos=Vector(2204.842773,9620.976563,-31.968750),ang=Angle(0.000000,-79.823906,0.000000)},{id=20,pos=Vector(3980.420166,9492.296875,-31.968735),ang=Angle(0.000000,-5.041030,0.000000)},{id=21,pos=Vector(5285.726563,9480.649414,208.031250),ang=Angle(0.000000,-2.856903,0.000000)},{id=22,pos=Vector(5291.723145,8147.266602,448.031250),ang=Angle(0.000000,-87.143089,0.000000)},{id=23,pos=Vector(5288.033691,7027.931152,448.031250),ang=Angle(0.000000,-88.203194,0.000000)}},{{id=1,pos=Vector(-2884.930420,-4617.351074,480.031250),ang=Angle(0.000000,90.246819,0.000000)},{id=2,pos=Vector(-2623.250488,-4254.313965,480.031250),ang=Angle(0.000000,0.486845,0.000000)},{id=3,pos=Vector(-2002.871338,-4254.901855,480.031250),ang=Angle(0.000000,1.475139,0.000000)},{id=4,pos=Vector(-1950.420898,-2852.844971,480.031250),ang=Angle(0.000000,89.366730,0.000000)},{id=5,pos=Vector(-1419.444580,-3931.742676,64.031250),ang=Angle(0.000000,-94.237389,0.000000)},{id=6,pos=Vector(-164.187943,-4273.811035,64.031250),ang=Angle(0.000000,2.422930,0.000000)},{id=7,pos=Vector(328.155273,-4276.348145,64.031250),ang=Angle(0.000000,176.990631,0.000000)},{id=8,pos=Vector(1099.528198,-5213.344727,64.031265),ang=Angle(0.000000,13.896429,0.000000)},{id=9,pos=Vector(2712.061768,-5099.754395,56.031250),ang=Angle(0.000000,98.281822,0.000000)},{id=10,pos=Vector(2731.671387,-3719.978271,56.031258),ang=Angle(0.000000,72.646866,0.000000)},{id=11,pos=Vector(3912.772949,-3701.797852,56.031250),ang=Angle(0.000000,-3.473119,0.000000)},{id=12,pos=Vector(5101.193359,-3705.432373,-7.968750),ang=Angle(0.000000,-0.041118,0.000000)},{id=13,pos=Vector(7210.577637,-3699.593994,-7.968750),ang=Angle(0.000000,-0.160691,0.000000)},{id=14,pos=Vector(7245.034180,-5465.066895,-103.968773),ang=Angle(0.000000,-85.194389,0.000000)},{id=15,pos=Vector(9204.318359,-5489.492188,-103.968750),ang=Angle(0.000000,0.134910,0.000000)},{id=16,pos=Vector(9210.791016,-4278.136230,-103.968750),ang=Angle(0.000000,75.462906,0.000000)},{id=17,pos=Vector(9203.076172,-3298.191162,-103.968758),ang=Angle(0.000000,87.430893,0.000000)},{id=18,pos=Vector(9209.136719,-2260.683350,-103.968750),ang=Angle(0.000000,90.422867,0.000000)},{id=19,pos=Vector(9219.662109,-1354.081421,-31.968750),ang=Angle(0.000000,90.422897,0.000000)}},{{id=1,pos=Vector(10666.198242,4571.461914,304.031250),ang=Angle(0.000000,-1.625061,0.000000)},{id=2,pos=Vector(9962.540039,5257.031250,208.031250),ang=Angle(0.000000,162.487000,0.000000)},{id=3,pos=Vector(8905.833984,5865.591797,208.031250),ang=Angle(0.000000,117.782890,0.000000)},{id=4,pos=Vector(8175.292480,6113.640625,-47.968750),ang=Angle(0.000000,-92.793129,0.000000)},{id=5,pos=Vector(8174.646484,5139.661133,-31.968746),ang=Angle(0.000000,-83.993141,0.000000)},{id=6,pos=Vector(8176.308105,3990.242676,-31.968750),ang=Angle(0.000000,-63.685326,0.000000)},{id=7,pos=Vector(9633.448242,3995.145996,-31.968750),ang=Angle(0.000000,1.014809,0.000000)},{id=8,pos=Vector(10130.509766,3994.814209,-31.968750),ang=Angle(0.000000,-1.801191,0.000000)},{id=9,pos=Vector(10132.384766,5160.323242,-31.968750),ang=Angle(0.000000,93.433960,0.000000)},{id=10,pos=Vector(10115.738281,6334.282715,-31.968750),ang=Angle(0.000000,96.670876,0.000000)},{id=11,pos=Vector(11640.470703,6293.209473,-31.968750),ang=Angle(0.000000,-6.624907,0.000000)},{id=12,pos=Vector(11642.739258,7237.693848,-31.968742),ang=Angle(0.000000,86.022682,0.000000)},{id=13,pos=Vector(11645.779297,8410.099609,-415.968750),ang=Angle(0.000000,90.193230,0.000000)},{id=14,pos=Vector(11649.465820,9171.590820,-607.968750),ang=Angle(0.000000,86.902664,0.000000)},{id=15,pos=Vector(12099.833984,9210.706055,-607.968750),ang=Angle(0.000000,-55.207932,0.000000)},{id=16,pos=Vector(12113.375977,8204.008789,-607.968750),ang=Angle(0.000000,-94.962120,0.000000)},{id=17,pos=Vector(11527.547852,7584.964844,-615.968750),ang=Angle(0.000000,170.896210,0.000000)},{id=18,pos=Vector(9946.823242,7589.708496,-607.968750),ang=Angle(0.000000,177.422134,0.000000)},{id=19,pos=Vector(8493.575195,7583.651367,-505.930054),ang=Angle(0.000000,-179.876846,0.000000)},{id=20,pos=Vector(7341.525879,7590.969727,-431.968750),ang=Angle(0.000000,-179.655212,0.000000)},{id=21,pos=Vector(6874.053711,6886.177246,-421.767517),ang=Angle(0.000000,-86.231842,0.000000)},{id=22,pos=Vector(6871.812500,5524.957031,-415.968750),ang=Angle(0.000000,-89.625618,0.000000)},{id=23,pos=Vector(6859.299316,3681.295898,-415.968750),ang=Angle(0.000000,-88.884109,0.000000)},{id=24,pos=Vector(6831.487305,2766.990723,-423.755157),ang=Angle(0.000000,-89.977455,0.000000)},{id=25,pos=Vector(7411.529297,2215.673584,-423.831787),ang=Angle(0.000000,-3.737595,0.000000)},{id=26,pos=Vector(8220.009766,2215.731934,-447.968750),ang=Angle(0.000000,1.542408,0.000000)},{id=27,pos=Vector(8891.681641,2224.193604,-423.886536),ang=Angle(0.000000,1.378086,0.000000)},{id=28,pos=Vector(9246.463867,2212.752930,-419.335083),ang=Angle(0.000000,82.044785,0.000000)},{id=29,pos=Vector(9250.368164,3103.148926,-423.615784),ang=Angle(0.000000,94.372269,0.000000)},{id=30,pos=Vector(10305.256836,3109.274170,-463.968750),ang=Angle(0.000000,5.942430,0.000000)},{id=31,pos=Vector(10600.141602,3570.008057,-31.968750),ang=Angle(0.000000,-20.230509,0.000000)},{id=32,pos=Vector(10124.924805,3989.134277,-31.968754),ang=Angle(0.000000,-176.297882,0.000000)}}}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/characters/characters_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/cosmetics/apparel_sh.lua:
local a=Material('materials/galactic/ui/foods/package.png','smooth noclamp')local b=Material('materials/galactic/seasonal/halloween/ghost.png','smooth noclamp')local c=Material('materials/galactic/seasonal/christmas/snowflake.png','smooth noclamp')local d=Material('materials/galactic/seasonal/christmas/winter hat.png','smooth noclamp')local e=Material('materials/galactic/seasonal/christmas/wreath.png','smooth noclamp')local f=Material('materials/galactic/seasonal/christmas/santa.png','smooth noclamp')local g=Material('materials/galactic/seasonal/christmas/snowman.png','smooth noclamp')local h=Material('materials/galactic/seasonal/christmas/gingerbread man.png','smooth noclamp')local i=Material('materials/galactic/seasonal/summer/summer1.png')cosmetics.RegisterItem('pet_botler'):SetName('Botler'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('newyear',true):SetIcon(a):SetModel('models/workshop/player/items/all_class/sum24_botler_2000_style1/sum24_botler_2000_style1_heavy.mdl'):SetSeasonal(true):SetBone('root'):SetPos(Vector(-20,-20,4)):SetAngles(Angle(0,0,0))cosmetics.RegisterItem('pet_reindoonicorn'):SetName('Reindoonicorn'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('newyear',true):SetIcon(a):SetModel('models/player/items/all_class/pet_reinballoonicorn.mdl'):SetSeasonal(true):SetBone('root'):SetPos(Vector(-20,-20,100)):SetAngles(Angle(0,0,0))cosmetics.RegisterItem('halloween_zombieparrot'):SetName('Zombie Parrot'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_zombie_parrot.mdl'):SetSeasonal(true)cosmetics.RegisterItem('winter_pouchpal'):SetName('Pouch Pal'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('winter',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/pouch_pal_heavy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_triboniophorus'):SetName('Triboniophorus'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn2024_triboniophorus_heavy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_rocko'):SetName('Rocko'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/sum22_rocko.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_greenparrot'):SetName('Green Parrot'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/fall17_quizzical_quetzal_heavy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_birdseyeviewer'):SetName('Birds Eye Viewer'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum20_birds_eye_viewer_style2.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_croakinghazard'):SetName('Croaking Hazard'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/fall17_croaking_hazard_heavy.mdl'):SetCredits(500,true):SetSeasonal(true)cosmetics.RegisterItem('summer_spacehamster'):SetName('Space Hammy'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/invasion_space_hamster_hammy.mdl'):SetCredits(500,true):SetSeasonal(true)cosmetics.RegisterItem('summer_cameleon'):SetName('Cameleon'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/jul13_cameleon.mdl'):SetCredits(500,true):SetSeasonal(true)cosmetics.RegisterItem('waist_marketgardener'):SetName('Market Gardener'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('waist_item'):SetIcon(a):SetModel('models/galactic/cosmetics/summer/c_market_gardener.mdl')cosmetics.RegisterItem('waist_c_pickaxe'):SetName('The Pickaxe'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('waist_item'):SetIcon(a):SetModel('models/galactic/cosmetics/summer/c_pickaxe.mdl')cosmetics.RegisterItem('backpack_jiggled'):SetName('Draped Backpack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/jigglebackpack.mdl')cosmetics.RegisterItem('summer_koolboy'):SetName('The Koolboy'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/jul13_koolboy.mdl'):SetCredits(500,true):SetSeasonal(true)cosmetics.RegisterItem('summer_paratrooperpack'):SetName('Paratrooper Pack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/c_paratrooper_pack.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_fastfood'):SetName('Fast Food Fatass'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum21_fast_food.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_medicalemergency'):SetName('Medical Emergency'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum23_medical_emergency.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_summerpack'):SetName('Summer Pack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/summer_pack.mdl'):SetSeasonal(true)cosmetics.RegisterItem('winter_snowmanhead'):SetName('Snowman Head'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('winter',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/burny_the_snowman.mdl'):SetSeasonal(true)cosmetics.RegisterItem('winter_hotspaniel'):SetName('Hot Spaniel'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('winter',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec24_hot_spaniel.mdl'):SetSeasonal(true)cosmetics.RegisterItem('winter_necroprancer'):SetName('Necroprancer'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('winter',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec24_necroprancer_style1_heavy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_suckerslug'):SetName('Sucker Slug'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/invasion_sucker_slug.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_spaceoddity'):SetName('Space Oddity'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_space_oddity.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_badlandsbandido'):SetName('Badlands Bandido'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn2024_badlands_bandido_style1.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_hellishoverlord'):SetName('Hellish Overlord'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn2024_hellish_overlord.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_piratehat'):SetName('Commander Pirate Hat'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn2024_fleet_commander_style1_heavy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_reelflyhat'):SetName('Reel Fly'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum21_reel_fly_hat.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_hongkongcone'):SetName('Hong Kong Cone'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/fall2013_hong_kong_cone_heavy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_hotdog'):SetName('Hot Dawg'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/fwk_hotdog_heavy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_duckyhat'):SetName('Ducky Hat'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/hwn2015_duckyhat_heavy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_fullmetalhelmet'):SetName('Full Metal Helmet'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum23_full_metal_helmet_heavy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_nightvisiongawkers'):SetName('Nightvision Gawkers'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum22_night_vision_gawkers.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_breachandbomb'):SetName('Breach and Bomb'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum20_breach_and_bomb.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_headbanger'):SetName('Head Banger'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum22_head_banger.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_decoratedvet'):SetName('Decorated Veteran'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum22_decorated_veteran_heavy.mdl'):SetCredits(500,true):SetSeasonal(true)cosmetics.RegisterItem('summer_hawaiianhunter'):SetName('Hawaiian Hunter'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum22_hawaiian_hunter.mdl'):SetCredits(500,true):SetSeasonal(true)cosmetics.RegisterItem('summer_undercoverbrolly'):SetName('Undercover Brolly'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum22_undercover_brolly_heavy.mdl'):SetCredits(500,true):SetSeasonal(true)cosmetics.RegisterItem('effect_sunset'):SetName('Sunset'):SetDescription('Goodbye sun :('):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.EFFECTS):SetEffect('unusual_eotl_sunset'):SetIcon(Material('materials/galactic/seasonal/christmas/sunset.png')):SetSeasonal(true)cosmetics.RegisterItem('effect_sunrise'):SetName('Sunrise'):SetDescription('Hello sun :)'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.EFFECTS):SetEffect('unusual_eotl_sunrise'):SetIcon(Material('materials/galactic/seasonal/christmas/sunrise.png')):SetSeasonal(true)cosmetics.RegisterItem('effect_frostbite'):SetName('Frostbite'):SetDescription('Frosty bites'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.EFFECTS):SetEffect('unusual_eotl_frostbite'):SetIcon(Material('materials/galactic/seasonal/christmas/snow-storm.png')):SetSeasonal(true)cosmetics.RegisterItem('effect_arrow_golden'):SetName('Golden Arrow'):SetDescription('A golden arrow that seems to have hit you :('):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.EFFECTS):SetEffect('unusual_goldarrow_parent'):SetIcon(Material('materials/galactic/seasonal/christmas/arrows.png')):SetSeasonal(true)cosmetics.RegisterItem('effect_arrow_blue'):SetName('Blue Arrow'):SetDescription('A blue arrow that seems to have hit you :('):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.EFFECTS):SetEffect('unusual_icearrow_teamcolor_blue'):SetIcon(Material('materials/galactic/seasonal/christmas/arrows.png')):SetSeasonal(true)cosmetics.RegisterItem('effect_arrow_purple'):SetName('Purple Arrow'):SetDescription('A blue arrow that seems to have hit you :('):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.EFFECTS):SetEffect('unusual_icearrow_teamcolor_red'):SetIcon(Material('materials/galactic/seasonal/christmas/arrows.png')):SetSeasonal(true)cosmetics.RegisterItem('effect_northstar_blue'):SetName('Blue Northstar'):SetDescription('Star of the north but in blue.'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.EFFECTS):SetEffect('unusual_northstar_teamcolor_blue'):SetIcon(Material('materials/galactic/seasonal/christmas/shooting star.png')):SetSeasonal(true)cosmetics.RegisterItem('effect_northstar_purple'):SetName('Purple Northstar'):SetDescription('Star of the north but in purple.'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.EFFECTS):SetEffect('unusual_northstar_parent_purple'):SetIcon(Material('materials/galactic/seasonal/christmas/shooting star.png')):SetSeasonal(true)cosmetics.RegisterItem('effect_northstar_red'):SetName('Red Northstar'):SetDescription('Star of the north but in red.'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.EFFECTS):SetEffect('unusual_northstar_teamcolor_red'):SetIcon(Material('materials/galactic/seasonal/christmas/shooting star.png')):SetSeasonal(true)cosmetics.RegisterItem('lefthip_khem'):SetName('Khem Left Hip'):SetDescription('Left hip plating. Part of the Khem set'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_KNEE):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/khemlefthip.mdl'):SetCost(10000)cosmetics.RegisterItem('righthip_khem'):SetName('Khem Right Hip'):SetDescription('Right hip plating. Part of the Khem set'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_KNEE):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/khemrighthip.mdl'):SetCost(10000)cosmetics.RegisterItem('leftwrist_khem'):SetName('Khem Left Wrist'):SetDescription('Wrist plating. Part of the Khem set'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_ARM):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/khemleftwrist.mdl'):SetCost(10000)cosmetics.RegisterItem('rightwrist_khem'):SetName('Khem Right Wrist'):SetDescription('Wrist plating. Part of the Khem set'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_ARM):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/khemrightwrist.mdl'):SetCost(10000)cosmetics.RegisterItem('leftleg_khem'):SetName('Khem Left Shinplate'):SetDescription('A shinplate. Part of the Khem set'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_LEG):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/khemleftshin.mdl'):SetCost(15000)cosmetics.RegisterItem('rightleg_khem'):SetName('Khem Right Shinplate'):SetDescription('A shinplate. Part of the Khem set'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_LEG):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/khemrightshin.mdl'):SetCost(15000)cosmetics.RegisterItem('shoulder1_khem'):SetName('Khem Left Shoulderplate'):SetDescription('A Shoulderplate. Part of the Khem set'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/khemleftshoulder.mdl'):SetCost(25000)cosmetics.RegisterItem('shoulder2_khem'):SetName('Khem Right Shoulderplate'):SetDescription('A Shoulderplate. Part of the Khem set'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS2):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/khemrightshoulder.mdl'):SetCost(25000)cosmetics.RegisterItem('christmas_demobear'):SetName('Demo Bear'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS2):SetContentID('christmas'):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec22_battle_bear_style1_demo.mdl'):SetSeasonal(true)cosmetics.RegisterItem('christmas_engibear'):SetName('Engineer Bear'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS2):SetContentID('christmas'):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec22_battle_bear_style1_engineer.mdl'):SetSeasonal(true)cosmetics.RegisterItem('christmas_heavybear'):SetName('Heavy Bear'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS2):SetContentID('christmas'):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec22_battle_bear_style1_heavy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('christmas_medicbear'):SetName('Medic Bear'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS2):SetContentID('christmas'):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec22_battle_bear_style1_medic.mdl'):SetSeasonal(true)cosmetics.RegisterItem('christmas_pyrobear'):SetName('Pyro Bear'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS2):SetContentID('christmas'):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec22_battle_bear_style1_pyro.mdl'):SetSeasonal(true)cosmetics.RegisterItem('christmas_scoutbear'):SetName('Scout Bear'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS2):SetContentID('christmas'):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec22_battle_bear_style1_scout.mdl'):SetSeasonal(true)cosmetics.RegisterItem('christmas_spybear'):SetName('Spy Bear'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS2):SetContentID('christmas'):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec22_battle_bear_style1_spy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('christmas_sniperbear'):SetName('Sniper Bear'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS2):SetContentID('christmas'):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec22_battle_bear_style1_sniper.mdl'):SetSeasonal(true)cosmetics.RegisterItem('christmas_soldierbear'):SetName('Soldier Bear'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS2):SetContentID('christmas'):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec22_battle_bear_style1_soldier.mdl'):SetSeasonal(true)cosmetics.RegisterItem('winter_beanie'):SetName('Bonk Beanie'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec23_bonk_beanie.mdl'):SetSeasonal(true)cosmetics.RegisterItem('winter_beanie2'):SetName('Bonk Beanie Style 2'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec23_bonk_beanie_style2.mdl'):SetSeasonal(true)cosmetics.RegisterItem('winter_wandererswool'):SetName('Wooly hat'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec23_wanderers_wool.mdl'):SetSeasonal(true)cosmetics.RegisterItem('winter_nightcap'):SetName('Nigthcap'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec23_nightcap.mdl'):SetSeasonal(true)cosmetics.RegisterItem('christmas_polarpal'):SetName('Polar Pal'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS2):SetContentID('christmas'):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec18_polar_pal_heavy.mdl'):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_imagundi.mdl",Scale=1.000000,Position=Vector(-3.745500,22.547300,-46.754501),Angle=Angle(-32.727299,94.909103,0.000000),SteamID="STEAM_0:1:66792387"}):SetCost(35000):SetSeasonal(true)cosmetics.RegisterItem('halloween_carryall'):SetName('Contaminated Carryall'):SetDescription('carries something spooky.'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn2024_contaminated_carryall.mdl')cosmetics.RegisterItem('backpack_khem'):SetName('Khem Backplate'):SetDescription('A backplate. Part of the Khem set'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/khemback.mdl'):SetCost(50000)cosmetics.RegisterItem('chestplate_khem'):SetName('Khem Chestplate'):SetDescription('A chestplate. Part of the Khem set'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/khemchest.mdl'):SetCost(50000)cosmetics.RegisterItem('halloween_trepanabotomizer'):SetName('Trepanabotomizer'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_quacks_cureall.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_pumpkin'):SetName('Pumpkin'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('halloween'):SetIcon(b):SetModel('models/props_halloween/pumpkin_01.mdl'):SetCost(5000):SetBone('anim_attachment_head'):SetPos(Vector(0,-3,1)):SetAngles(Angle(90,90,0)):SetScale(0.5):SetSeasonal(true):SetCanUse(function()return srp.seasonal.Halloween!=nil end)cosmetics.RegisterItem('halloween_holyhunter'):SetName('Holy Hunter'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn_sniper_hat.mdl'):AddTransform({Model="models/tobester/bardan/bardan_jusik.mdl",Scale=1.000000,Position=Vector(-0.380000,0.000000,0.000000),Angle=Angle(0.000000,90.000000,0.000000),SteamID="STEAM_0:1:183265140"}):AddTransform({Model="models/player/swtor/arsenic/shadow.mdl",Scale=0.985500,Position=Vector(-1.940000,-0.340000,-0.820000),Angle=Angle(0.000000,88.363602,0.000000),SteamID="STEAM_0:0:48139437"}):SetSeasonal(true)cosmetics.RegisterItem('halloween_bucket'):SetName('Spooky Bucket'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_HAND):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/phase1cosmetics/hweenbucket.mdl'):SetCost(5000):SetSeasonal(true)cosmetics.RegisterItem('halloween_crow'):SetName('Halloween Crow'):SetContentID('halloween'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_the_caws_of_death.mdl'):SetSeasonal(true):SetCost(100000)cosmetics.RegisterItem('halloween_bat'):SetName('Halloween Bat'):SetContentID('halloween'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_the_fire_bat_v2_demo.mdl'):SetSeasonal(true):SetCost(100000)cosmetics.RegisterItem('halloween_monkeynaut'):SetName('Monkeynaut '):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn_ghost_pj.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_balloon'):SetName('Boo Balloon'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn_pet_balloon.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_hoodedhaunter'):SetName('Hooded Haunter'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/sf14_hooded_haunter_classes_heavy.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_accursedapparition'):SetName('Accursed Apparition'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_wandering_soul_heavy.mdl'):SetSeasonal(true)local j={r=15,g=80,b=15,a=150}local k={r=80,g=15,b=15,a=150}local l=Angle(90,0,0)cosmetics.RegisterItem('halloween_intergalactic'):SetName('Intergalactic Intruder'):SetContentID('halloween'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_intergalactic_intruder.mdl'):SetSeasonal(true):SetCost(100000):SetCustomDraw(function(m)m:DrawModel()local n=m:GetParent()if!IsValid(n)||n!=LocalPlayer()then return end;if!m.Texture then local o=ProjectedTexture()o:SetTexture'effects/flashlight001'o:SetFarZ(500)o:SetFOV(50)o:SetBrightness(5)o:SetEnableShadows(false)o:SetLinearAttenuation(50)o:Update()m:CallOnRemove('RemoveCosmeticInfo',function(m)if m.Texture then m.Texture:Remove()end end)m.Texture=o else local p=m:LookupBone('eye_jiggle')local q=m:GetBonePosition(p)m.Texture:SetColor(j)m.Texture:SetPos(q+Vector(0,0,-5))m.Texture:SetAngles(l)m.Texture:Update()end end)cosmetics.RegisterItem('halloween_ivan'):SetName('Ivan The Inedible'):SetContentID('halloween'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_ivan_the_inedible.mdl'):SetCost(100000):SetSeasonal(true):SetBone('chest'):SetPos(Vector(5,-15,50)):SetAngles(Angle(60,10,0))local r={default='models/galactic/cosmetics/phase1cosmetics/chest_patch.mdl',DU='models/galactic/cosmetics/phase1cosmetics/chest_patch_du.mdl',RC='models/galactic/cosmetics/phase1cosmetics/chest_patch_rc.mdl',ARC='models/galactic/cosmetics/phase1cosmetics/chest_patch_arc.mdl'}local function s(self,t)if CLIENT then t=LocalPlayer()end;local u=t:GetGroup()&&t:GetGroup().id||'default'return r[u]||r.default end;cosmetics.RegisterItem('chestbadge_kensparrow'):SetName('Ken Sparrow'):SetDescription('Ken Sparrow\'s custom badge for coming top 5 in the DarkRP community event.'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PATCH):SetIcon(a):SetMaterial('galactic/cosmetics/badges/kensparrow'):SetModelFunc(s):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.940000,Position=Vector(1.080000,1.620000,-52.439999),Angle=Angle(-6.245500,0.000000,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/grealms/characters/jedibattlelord/jedibattlelord_03.mdl",Scale=1.000000,Position=Vector(3.765500,0.000000,0.000000),Angle=Angle(-4.952700,0.000000,0.000000),SteamID="STEAM_0:1:79442002"})cosmetics.RegisterItem('chestbadge_murdoc'):SetName('Murdoc'):SetDescription('Murdoc\'s custom badge for coming top 5 in the DarkRP community event.'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PATCH):SetIcon(a):SetMaterial('galactic/cosmetics/badges/murdoc'):SetModelFunc(s):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.940000,Position=Vector(1.080000,1.620000,-52.439999),Angle=Angle(-6.245500,0.000000,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/grealms/characters/jedibattlelord/jedibattlelord_03.mdl",Scale=1.000000,Position=Vector(3.765500,0.000000,0.000000),Angle=Angle(-4.952700,0.000000,0.000000),SteamID="STEAM_0:1:79442002"})cosmetics.RegisterItem('chestbadge_feen'):SetName('Bofa'):SetDescription('Feen\'s custom badge for coming top 5 in the DarkRP community event. Shared to everyone.'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PATCH):SetIcon(a):SetMaterial('galactic/cosmetics/badges/feen'):SetModelFunc(s):SetCost(1):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.940000,Position=Vector(1.080000,1.620000,-52.439999),Angle=Angle(-6.245500,0.000000,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/grealms/characters/jedibattlelord/jedibattlelord_03.mdl",Scale=1.000000,Position=Vector(3.765500,0.000000,0.000000),Angle=Angle(-4.952700,0.000000,0.000000),SteamID="STEAM_0:1:79442002"})cosmetics.RegisterItem('chestbadge_ruffis'):SetName('Cowboy'):SetDescription('Ruffisoak\'s custom badge for coming top 5 in the DarkRP community event. Shared to everyone who completed the challenge.'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PATCH):SetIcon(a):SetMaterial('galactic/cosmetics/badges/ruffisoak'):SetModelFunc(s):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.940000,Position=Vector(1.080000,1.620000,-52.439999),Angle=Angle(-6.245500,0.000000,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/grealms/characters/jedibattlelord/jedibattlelord_03.mdl",Scale=1.000000,Position=Vector(3.765500,0.000000,0.000000),Angle=Angle(-4.952700,0.000000,0.000000),SteamID="STEAM_0:1:79442002"})cosmetics.RegisterItem('chestbadge_brokenmachine'):SetName('Swag'):SetDescription('Broke\'s custom badge for coming top 5 in the DarkRP community event. Shared to everyone who completed the challenge.'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PATCH):SetIcon(a):SetMaterial('galactic/cosmetics/badges/brokenmachine'):SetModelFunc(s):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.940000,Position=Vector(1.080000,1.620000,-52.439999),Angle=Angle(-6.245500,0.000000,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/grealms/characters/jedibattlelord/jedibattlelord_03.mdl",Scale=1.000000,Position=Vector(3.765500,0.000000,0.000000),Angle=Angle(-4.952700,0.000000,0.000000),SteamID="STEAM_0:1:79442002"})cosmetics.RegisterItem('chestbadge_gun'):SetName('The DC15a'):SetDescription('Awarded for completing the 10 hours DarkRP communtiy event.'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PATCH):SetIcon(a):SetMaterial('galactic/cosmetics/badges/gun'):SetModelFunc(s):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.940000,Position=Vector(1.080000,1.620000,-52.439999),Angle=Angle(-6.245500,0.000000,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/grealms/characters/jedibattlelord/jedibattlelord_03.mdl",Scale=1.000000,Position=Vector(3.765500,0.000000,0.000000),Angle=Angle(-4.952700,0.000000,0.000000),SteamID="STEAM_0:1:79442002"})cosmetics.RegisterItem('chestbadge_palpatine'):SetName('Good Boy'):SetDescription('Awarded for completing the 10 hours DarkRP communtiy event.'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PATCH):SetIcon(a):SetMaterial('galactic/cosmetics/badges/palpatine'):SetModelFunc(s):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.940000,Position=Vector(1.080000,1.620000,-52.439999),Angle=Angle(-6.245500,0.000000,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/grealms/characters/jedibattlelord/jedibattlelord_03.mdl",Scale=1.000000,Position=Vector(3.765500,0.000000,0.000000),Angle=Angle(-4.952700,0.000000,0.000000),SteamID="STEAM_0:1:79442002"})cosmetics.RegisterItem('chestbadge_suplogo'):SetName('Superior Servers'):SetDescription('Awarded for completing the 10 hours DarkRP communtiy event.'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PATCH):SetIcon(a):SetMaterial('galactic/cosmetics/badges/suplogo'):SetModelFunc(s):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.940000,Position=Vector(1.080000,1.620000,-52.439999),Angle=Angle(-6.245500,0.000000,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/grealms/characters/jedibattlelord/jedibattlelord_03.mdl",Scale=1.000000,Position=Vector(3.765500,0.000000,0.000000),Angle=Angle(-4.952700,0.000000,0.000000),SteamID="STEAM_0:1:79442002"})cosmetics.RegisterItem('chestbadge_helmet'):SetName('Clone Helmet'):SetDescription('Awarded for completing the 10 hours DarkRP communtiy event.'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PATCH):SetIcon(a):SetMaterial('galactic/cosmetics/badges/helmet'):SetModelFunc(s):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.940000,Position=Vector(1.080000,1.620000,-52.439999),Angle=Angle(-6.245500,0.000000,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/grealms/characters/jedibattlelord/jedibattlelord_03.mdl",Scale=1.000000,Position=Vector(3.765500,0.000000,0.000000),Angle=Angle(-4.952700,0.000000,0.000000),SteamID="STEAM_0:1:79442002"})cosmetics.RegisterItem('chestbadge_laat'):SetName('LAAT'):SetDescription('Awarded for completing the 10 hours DarkRP communtiy event.'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PATCH):SetIcon(a):SetMaterial('galactic/cosmetics/badges/laat'):SetModelFunc(s):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.940000,Position=Vector(1.080000,1.620000,-52.439999),Angle=Angle(-6.245500,0.000000,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/grealms/characters/jedibattlelord/jedibattlelord_03.mdl",Scale=1.000000,Position=Vector(3.765500,0.000000,0.000000),Angle=Angle(-4.952700,0.000000,0.000000),SteamID="STEAM_0:1:79442002"})cosmetics.RegisterItem('party_wrap'):SetName('Christmas Wrap'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetContentID('christmas',true):SetIcon(c):SetModel('models/galactic/cosmetics/phase1cosmetics/ribbonsuit.mdl'):SetCost(15000):SetSeasonal(true)cosmetics.RegisterItem('christmas_ruffledbeard'):SetName('Ruffled Beard'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HAIR_BEARD):SetContentID('christmas',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/xms2013_ruffled_beard.mdl'):SetCost(70000):SetSeasonal(true)cosmetics.RegisterItem('halloween_spellbinder'):SetName('Spellbinder Bonnet'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_the_crit_wizard.mdl'):SetSeasonal(true)cosmetics.RegisterItem('christmas_smissmassorcerer'):SetName('Smissmas Sorcerer'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec20_smissmas_sorcerer_engineer.mdl'):SetCost(15000):SetSeasonal(true)cosmetics.RegisterItem('christmas_mooshanka'):SetName('Mooshanka'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec21_mooshanka.mdl'):SetCost(25000):SetSeasonal(true)cosmetics.RegisterItem('christmas_blitzenbowl'):SetName('Blitzen Bowl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec20_blitzen_bowl.mdl'):SetCost(30000):SetSeasonal(true)cosmetics.RegisterItem('christmas_yulehog'):SetName('Yule Hog'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec19_yule_hog_soldier.mdl'):SetCost(15000):SetSeasonal(true)cosmetics.RegisterItem('christmas_caribou'):SetName('Caribou Companion'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec17_caribou_companion_engineer.mdl'):SetCost(25000):SetSeasonal(true)cosmetics.RegisterItem('christmas_chullo'):SetName('Christmas Chill Chullo'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec15_chill_chullo_soldier.mdl'):SetCost(15000):SetSeasonal(true)cosmetics.RegisterItem('christmas_snowmann'):SetName('Snow Mann'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec16_snowmann_pyro.mdl'):SetCost(20000):SetSeasonal(true)cosmetics.RegisterItem('santa_hat'):SetName('Santa Hat'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/phase1cosmetics/xms_santa_hat.mdl'):SetCost(5000):SetSeasonal(true)cosmetics.RegisterItem('christmas_candycrown'):SetName('Candy Crown'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/winter/dec19_candy_crown_medic.mdl'):SetCost(25000):SetSeasonal(true)cosmetics.RegisterItem('xms_winter_hat'):SetName('Winter Joy Hat'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/phase1cosmetics/xms_winter_joy_hat.mdl'):AddTransform({Model="models/gonzo/saeseetiin/saeseetiin.mdl",Scale=0.980000,Position=Vector(0.000000,0.000000,0.000000),Angle=Angle(0.000000,-88.363602,0.000000),SteamID="STEAM_0:1:199958960"}):SetCost(15000):SetSeasonal(true)cosmetics.RegisterItem('xms_gift_hat'):SetName('Gift Hat'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/phase1cosmetics/xms_gift_hat.mdl'):SetCost(15000):SetSeasonal(true)cosmetics.RegisterItem('xms_furcap'):SetName('Fur Cap'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/phase1cosmetics/xms_furcap.mdl'):SetCost(15000):SetSeasonal(true)cosmetics.RegisterItem('xms_antlers'):SetName('Antlers'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas',true):SetIcon(d):SetModel('models/galactic/cosmetics/phase1cosmetics/xms_antlers.mdl'):AddTransform({Attachment="anim_attachment_head",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.980000,Position=Vector(0.000000,-46.734501,-45.574501),Angle=Angle(0.000000,0.000000,-49.090900),SteamID="STEAM_0:1:90493737"}):SetCost(15000):SetSeasonal(true)cosmetics.RegisterItem('oh_xmas_tree'):SetName('Xmas Tree'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('christmas'):SetIcon(d):SetModel('models/galactic/cosmetics/phase1cosmetics/oh_xmas_tree.mdl'):SetCost(15000):SetSeasonal(true)cosmetics.RegisterItem('party_hat'):SetName('Party Hat'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('party'):SetIcon(a):SetModel('models/galactic/cosmetics/bdayhat.mdl'):SetCost(5000):SetSeasonal(true)cosmetics.RegisterItem('christmas_garland'):SetName('Garland'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetContentID('christmas',true):SetIcon(e):SetModel('models/galactic/cosmetics/winter/dec19_glittering_garland_engineer.mdl'):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.860000,Position=Vector(-1.900000,0.220000,-48.754501),Angle=Angle(0.000000,85.090897,0.000000),SteamID="STEAM_0:1:90493737"}):SetCost(25000):SetSeasonal(true)cosmetics.RegisterItem('head_mischelm1'):SetName('Helmet Attachment 1'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/mischelm2.mdl'):SetCost(60000)cosmetics.RegisterItem('head_mischelm2'):SetName('Helmet Attachment 2'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/mischelm3.mdl'):SetCost(60000)cosmetics.RegisterItem('summer_meltedmop'):SetName('Melted Mop'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/sum19_melted_mop.mdl'):SetCost(50000):SetSeasonal(true)cosmetics.RegisterItem('summer_hat'):SetName('Summer Hat'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/summer_hat_heavy.mdl'):SetCost(40000):SetSeasonal(true)cosmetics.RegisterItem('winter_lairefilteure'):SetName('Laire Filteure'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetContentID('winter',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec24_laire_filteure.mdl'):SetSeasonal(true)cosmetics.RegisterItem('summer_deal'):SetName('Summer Deal'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/summer_deal_demo.mdl'):SetCost(20000):SetSeasonal(true)cosmetics.RegisterItem('summer_shades'):SetName('Summer Shades'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetContentID('summer',true):SetIcon(i):SetModel('models/galactic/cosmetics/summer/summer_shades.mdl'):AddTransform({Attachment="eyes",Model="models/tobester/bardan/bardan_jusik.mdl",Scale=1,Position=Vector(-0.140000,0,0.3),Angle=Angle(0,90,0),SteamID="STEAM_0:1:183265140"}):AddTransform({Model="models/gonzo/saeseetiin/saeseetiin.mdl",Scale=0.949100,Position=Vector(-0.660000,0.000000,3.485500),Angle=Angle(0.000000,91.636398,0.000000),SteamID="STEAM_0:1:199958960"}):AddTransform({Model="models/tfa/comm/gg/pm_sw_mundi.mdl",Scale=1.000000,Position=Vector(-0.820000,0.000000,-0.720000),Angle=Angle(0.000000,89.936401,0.000000),SteamID="STEAM_0:0:84399229"}):SetCost(30000):SetSeasonal(true)cosmetics.RegisterItem('summer_camping'):SetName('Camping Kit'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('summer',true):SetIcon(Material('materials/galactic/seasonal/summer/backpack.png')):SetBone('chest'):SetPos(Vector(1,0,-60)):SetAngles(Angle(0,0,0)):SetModel('models/galactic/cosmetics/summer/sum19_spawn_camper_backpack.mdl'):SetCost(80000):SetSeasonal(true)cosmetics.RegisterItem('summer_snipercommando'):SetName('Commando Backpack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('summer',true):SetIcon(Material('materials/galactic/seasonal/summer/campingbackpack.png')):SetBone('chest'):SetPos(Vector(1,0,-65)):SetAngles(Angle(0,0,0)):SetModel('models/galactic/cosmetics/summer/xms_sniper_commandobackpack.mdl'):SetCost(80000):SetSeasonal(true)cosmetics.RegisterItem('summer_pheonix'):SetName('Summer Pheonix'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.PET):SetContentID('summer',true):SetIcon(Material('materials/galactic/seasonal/summer/pheonix.png')):SetModel('models/galactic/cosmetics/summer/sum19_fiery_phoenix.mdl'):SetCredits(500,true):SetSeasonal(true)cosmetics.RegisterItem('christmas_puggyback'):SetName('Puggy Back'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('christmas',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec18_puggyback.mdl'):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_imagundi.mdl",Scale=1.000000,Position=Vector(9.090900,0.000000,0.000000),Angle=Angle(0.000000,88.363602,-9.818200),SteamID="STEAM_0:1:66792387"}):SetCredits(500,true):SetSeasonal(true)cosmetics.RegisterItem('christmas_wood'):SetName('Christmas Wood'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('christmas',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/xms2013_pyro_wood.mdl'):SetCost(50000):SetSeasonal(true)cosmetics.RegisterItem('christmas_gingerbread'):SetName('Gingerbread Mann'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('christmas',true):SetIcon(h):SetModel('models/galactic/cosmetics/winter/dec19_gingerbread_mann_s1_engineer.mdl'):SetCost(50000):SetScale(0.6):SetSeasonal(true)cosmetics.RegisterItem('christmas_stocking'):SetName('Stocking'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('christmas',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec16_stocking_pyro.mdl'):SetCost(50000):SetSeasonal(true)cosmetics.RegisterItem('christmas_snowwing'):SetName('Snow Wing'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('christmas',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec16_snowwing.mdl'):SetCost(50000):SetSeasonal(true)cosmetics.RegisterItem('christmas_sled'):SetName('Sled'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('christmas',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/xms2013_pyro_sled.mdl'):SetCost(50000):SetSeasonal(true)cosmetics.RegisterItem('halloween_creatureheap'):SetName('Creature from the Heap'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_the_creature_from_the_heap.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_headhunter'):SetName('Head Hunter'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_handhunter.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_gumbopot'):SetName('Grisly Gumbo'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_gristly_gumbo_pot.mdl'):SetCost(25000):SetBone('chest'):SetPos(Vector(0,0,-20)):SetAngles(Angle(0,0,0)):SetSeasonal(true):SetScale(0.75)cosmetics.RegisterItem('weapon_z6'):SetName('Holstered Z6'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('weapon'):SetIcon(a):SetModel('models/weapons/w_z6_rotary_blaster.mdl'):SetCost(20000):SetBone('chest'):SetPos(Vector(-10,0,-2)):SetAngles(Angle(75,0,0))cosmetics.RegisterItem('weapon_dc15a'):SetName('Holstered DC15A'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('weapon'):SetIcon(a):SetModel('models/weapons/w_dc15a_neue.mdl'):SetCost(15000):SetBone('chest'):SetPos(Vector(-9,2,0)):SetAngles(Angle(180,180,-110)):SetScale(.8)cosmetics.RegisterItem('weapon_repat'):SetName('Republic Anti-Tank Launcher'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('weapon'):SetIcon(a):SetModel('models/galactic/weapons/wmodels/supclonerocketworld.mdl'):SetCost(15000):SetBone('chest'):SetPos(Vector(-9,5,12)):SetAngles(Angle(120,90,0)):SetRequiredGroups('501st','332nd')cosmetics.RegisterItem('weapon_arm5'):SetName('Holstered Westar AR-M5'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('weapon'):SetIcon(a):SetModel('models/weapons/w_alphablaster.mdl'):SetCost(15000):SetBone('chest'):SetScale(.9):SetPos(Vector(-9,2,-4)):SetAngles(Angle(0,0,70))cosmetics.RegisterItem('weapon_dc17m'):SetName('Holstered DC-17 M'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('weapon'):SetIcon(a):SetModel('models/weapons/w_DC17M_BR.mdl'):SetCost(15000):SetBone('chest'):SetScale(1.1):SetPos(Vector(-11,1,-1)):SetAngles(Angle(0,0,70))cosmetics.RegisterItem('weapon_repsnip'):SetName('Holstered RDC-15X Sniper'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('weapon'):SetIcon(a):SetModel('models/swbf3/rep/sniperrifle.mdl'):SetCost(15000):SetBone('chest'):SetPos(Vector(-9,-4,-4)):SetAngles(Angle(75,90,0))cosmetics.RegisterItem('backpack_redback'):SetName('Radio Backpack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/redback.mdl'):SetCost(35000)cosmetics.RegisterItem('backpack_medpack'):SetName('Medical Backpack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/phase1medicbackpack1.mdl'):SetCost(35000):SetRequiredPermissions('medic')cosmetics.RegisterItem('backpack_repairpack1'):SetName('Repairman Backpack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/phase1repairbackpack1.mdl'):SetCost(35000):SetRequiredGroups('104th','104WP','RC')cosmetics.RegisterItem('backpack_trooperpack1'):SetName('Trooper Backpack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/phase1trooperbackpack1.mdl'):SetCost(35000)cosmetics.RegisterItem('backpack_survivalbackpack'):SetName('Survival Backpack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/survivalbackpack.mdl'):SetCost(35000)cosmetics.RegisterItem('backpack_survivalbackpack2'):SetName('Survival Backpack 2'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/survivalbackpack2.mdl'):SetCost(35000)cosmetics.RegisterItem('backpack_engi2back1'):SetName('Engineer Backpack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engi2back1.mdl'):SetCost(35000)cosmetics.RegisterItem('backpack_engi2back2'):SetName('Engineer Back Panel'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engi2back2.mdl'):SetCost(35000)cosmetics.RegisterItem('backpack_heavy'):SetName('Heavy Backpack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/heavybackpack.mdl'):SetCost(20000)cosmetics.RegisterItem('backpack_heavy2'):SetName('Heavy Backpack 2'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/heavybackpack2.mdl'):SetCost(20000)cosmetics.RegisterItem('backpack_heavy3'):SetName('Heavy Backpack 3'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/heavybackpack3.mdl'):SetCost(20000)cosmetics.RegisterItem('back_miscback1'):SetName('Miscellaneous Item 1'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/miscback1.mdl'):SetCost(10000)cosmetics.RegisterItem('back_radio'):SetName('Radio backpack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/miscback6.mdl'):SetCost(35000)cosmetics.RegisterItem('back_miscback3'):SetName('Miscellaneous Item 3'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/miscback3.mdl'):SetCost(40000)cosmetics.RegisterItem('back_csgoback1'):SetName('Backpack 1'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/csgoback1.mdl'):AddTransform({Model="models/gonzo/saeseetiin/saeseetiin.mdl",Scale=1.009100,Position=Vector(5.485500,0.480000,-0.440000),Angle=Angle(0.000000,91.636398,-6.545500),SteamID="STEAM_0:1:199958960"}):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.820000,Position=Vector(-1.900000,0.220000,-46.514500),Angle=Angle(0.000000,94.909103,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_imagundi.mdl",Scale=0.941800,Position=Vector(-2.360000,-0.180000,3.750900),Angle=Angle(0.000000,81.732697,0.000000),SteamID="STEAM_0:1:66792387"}):SetCost(20000)cosmetics.RegisterItem('back_csgoback2'):SetName('Backpack 2'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/csgoback2.mdl'):AddTransform({Model="models/gonzo/saeseetiin/saeseetiin.mdl",Scale=1.009100,Position=Vector(5.485500,0.480000,-0.440000),Angle=Angle(0.000000,91.636398,-6.545500),SteamID="STEAM_0:1:199958960"}):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.820000,Position=Vector(-1.900000,0.220000,-46.514500),Angle=Angle(0.000000,94.909103,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_imagundi.mdl",Scale=0.941800,Position=Vector(-2.360000,-0.180000,3.750900),Angle=Angle(0.000000,81.732697,0.000000),SteamID="STEAM_0:1:66792387"}):SetCost(20000)cosmetics.RegisterItem('back_csgoback3'):SetName('Backpack 3'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/csgoback3.mdl'):AddTransform({Model="models/gonzo/saeseetiin/saeseetiin.mdl",Scale=1.009100,Position=Vector(5.485500,0.480000,-0.440000),Angle=Angle(0.000000,91.636398,-6.545500),SteamID="STEAM_0:1:199958960"}):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.820000,Position=Vector(-1.900000,0.220000,-46.514500),Angle=Angle(0.000000,94.909103,0.000000),SteamID="STEAM_0:1:90493737"}):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_imagundi.mdl",Scale=0.941800,Position=Vector(-2.360000,-0.180000,3.750900),Angle=Angle(0.000000,81.732697,0.000000),SteamID="STEAM_0:1:66792387"}):SetCost(20000)cosmetics.RegisterItem('back_engineerbag'):SetName('Engineer\'s Bag'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engineerbag.mdl'):SetCost(45000)cosmetics.RegisterItem('back_animated1'):SetName('Animated Backpack'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetContentID('backpack'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/animatedback1.mdl'):SetCost(100000)cosmetics.RegisterItem('neck_scarf1'):SetName('Red Neck Scarf'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.NECK):SetContentID('scarf'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/scarf1.mdl'):AddTransform({Model="models/player/swtor/arsenic/shadow.mdl",Scale=0.894500,Position=Vector(-0.680000,0.000000,5.265500),Angle=Angle(0.000000,94.909103,0.000000),SteamID="STEAM_0:0:48139437"}):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_imagundi.mdl",Scale=0.760000,Position=Vector(-2.260000,0.040000,15.347300),Angle=Angle(0.000000,91.636398,0.000000),SteamID="STEAM_0:1:66792387"}):SetCost(35000)cosmetics.RegisterItem('strap_small'):SetName('Straps'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS):SetContentID('strap'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/phase1miscstrap2.mdl'):SetCost(30000)cosmetics.RegisterItem('strap_radiostrapl'):SetName('Radio Strap Left'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS):SetContentID('strap'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/radiostrapl.mdl'):SetCost(40000)cosmetics.RegisterItem('strap_radiostrapr'):SetName('Radio Strap Right'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS):SetContentID('strap'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/radiostrapr.mdl'):SetCost(40000)cosmetics.RegisterItem('strap_engineerl'):SetName('Engineer Strap Left'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS):SetContentID('strap'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engineerstrapl.mdl'):SetCost(30000)cosmetics.RegisterItem('strap_engineerr'):SetName('Engineer Strap Right'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS):SetContentID('strap'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engineerstrapr.mdl'):AddTransform({Model="models/tfa/comm/gg/pm_sw_mundi.mdl",Scale=0.800000,Position=Vector(0.060000,0.100000,11.016400),Angle=Angle(0.000000,81.818199,0.000000)}):SetCost(30000)cosmetics.RegisterItem('strap_redstrap'):SetName('Red Straps'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS):SetContentID('strap'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/redstrap.mdl'):SetCost(30000)cosmetics.RegisterItem('engineer_shoulderl'):SetName('Engineer Shoulder Left'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS):SetContentID('strap'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engineershoulderl.mdl'):SetCost(15000)cosmetics.RegisterItem('engineer_shoulderr'):SetName('Engineer Shoulder Right'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS):SetContentID('strap'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engineershoulderr.mdl'):SetCost(15000)cosmetics.RegisterItem('shoulder_normal1'):SetName('Shoulder Plate'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS):SetContentID('shoulder'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/phase1miscshoulder1.mdl'):AddTransform({Model="models/gonzo/saeseetiin/saeseetiin.mdl",Scale=0.985500,Position=Vector(-11.010900,-0.020000,1.380000),Angle=Angle(0.000000,91.636398,9.818200),SteamID="STEAM_0:1:199958960"}):SetCost(30000)cosmetics.RegisterItem('shoulder_redshoulder'):SetName('Red Shoulder'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.SHOULDERS):SetContentID('shoulder'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/redshoulder.mdl'):SetCost(15000)cosmetics.RegisterItem('chest_combo'):SetName('Chest Combination'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetContentID('chestcombo'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/bigchestcombo.mdl'):SetCost(50000)cosmetics.RegisterItem('chest_blind'):SetName('Bling Bling'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetContentID('chestcombo'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/blingbling.mdl'):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_aayala.mdl",Scale=0.86,Position=Vector(-5.086,0.06,-48.755),Angle=Angle(0,81.058,3.273),SteamID="STEAM_0:1:90493737"}):AddTransform({Model="models/tfa/comm/gg/pm_sw_mundi.mdl",Scale=1,Position=Vector(-1.7,0.06,-0.58),Angle=Angle(0,90.616,0.8),SteamID="STEAM_0:0:84399229"}):SetCost(5000000)cosmetics.RegisterItem('chest_guard'):SetName('Chest Guard'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetContentID('chest'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/chestguard.mdl'):SetCost(50000)cosmetics.RegisterItem('vest_normal1'):SetName('Plain Vest'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetContentID('vest'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/vest1.mdl'):SetCost(40000)cosmetics.RegisterItem('vest_ammo'):SetName('Ammo Vest'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetContentID('engineer'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/doubleammovest.mdl'):SetCost(40000)cosmetics.RegisterItem('chest_csgochestknife'):SetName('Knife'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetContentID('knife'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/csgochestknife.mdl'):AddTransform({Attachment="chest",Model="models/tfa/comm/gg/pm_sw_imagundi.mdl",Scale=0.810900,Position=Vector(7.145500,43.694500,39.769100),Angle=Angle(88.343597,-180.000000,-78.545502),SteamID="STEAM_0:1:66792387"}):SetCost(40000)cosmetics.RegisterItem('chest_litemsling1'):SetName('Sling Left'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/litemsling1.mdl'):SetCost(8000)cosmetics.RegisterItem('chest_ritemsling1'):SetName('Item Sling Right'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/ritemsling1.mdl'):SetCost(8000)cosmetics.RegisterItem('chest_platestrap1'):SetName('Plate Strap'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/platestrap1.mdl'):SetCost(8000)cosmetics.RegisterItem('holster_dbgholsterl'):SetName('Gun Holster'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/doublelegholsterl.mdl'):SetCost(25000)cosmetics.RegisterItem('hallowen_garlicflank'):SetName('Garlic Flank Stake'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_LEG):SetModel('models/galactic/cosmetics/halloween/hwn_sniper_misc2.mdl'):SetContentID('halloween'):SetSeasonal(true):SetIcon(b)cosmetics.RegisterItem('pouch_sidepouch'):SetName('Side Pouch'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/sidepouch.mdl'):SetCost(25000)cosmetics.RegisterItem('holster_dbgholsterr'):SetName('Gun Holster'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/doublelegholsterr.mdl'):SetCost(25000)cosmetics.RegisterItem('christmas_pocketsanta'):SetName('Pocket Santa'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('christmas',true):SetIcon(f):SetModel('models/galactic/cosmetics/winter/dec17_pocket_santa_pyro.mdl'):SetCost(25000):SetSeasonal(true)cosmetics.RegisterItem('christmas_pocketyeti'):SetName('Pocket Yeti'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('christmas',true):SetIcon(g):SetModel('models/galactic/cosmetics/winter/dec17_pocket_yeti_heavy.mdl'):SetCost(25000):SetSeasonal(true)cosmetics.RegisterItem('halloween_witch_set'):SetName('Witch\'s Tools Set'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn2024_chiromancers_style1.mdl')cosmetics.RegisterItem('halloween_witch_ball'):SetName('Witch\'s Tool Ball'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn2024_chiromancers_style1_ball.mdl')cosmetics.RegisterItem('halloween_witch_book'):SetName('Witch\'s Tool Book'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn2024_chiromancers_style1_book.mdl')cosmetics.RegisterItem('halloween_witch_bottle'):SetName('Witch\'s Tool Bottle'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('halloween'):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn2024_chiromancers_style1_bottle.mdl')cosmetics.RegisterItem('waist_beltitem1'):SetName('Belt Item'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('waist_item'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/beltitem1.mdl'):SetCost(5000)cosmetics.RegisterItem('waist_engineermisc1'):SetName('Canister Right'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('engineer'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engineermisc1.mdl'):SetCost(8000)cosmetics.RegisterItem('waist_engineermisc2'):SetName('Canister Left'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('engineer'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engineermisc2.mdl'):SetCost(8000)cosmetics.RegisterItem('waist_toolbelt'):SetName('Tool belt'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('engineer'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engineertoolbelt.mdl'):SetCost(10000)cosmetics.RegisterItem('waist_toolbag'):SetName('Engineer Bag'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.WAIST):SetContentID('engineer'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engineerwaistbag.mdl'):SetCost(10000)cosmetics.RegisterItem('waist_pouchl'):SetName('Engineer Pouch Left'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/l3pouch.mdl'):SetCost(10000)cosmetics.RegisterItem('waist_pouchr'):SetName('Engineer Pouch Right'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_LEG):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/r3pouch.mdl'):SetCost(10000)cosmetics.RegisterItem('holster_csgolegholsterr'):SetName('Gun Holster 2'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/csgolegholsterr.mdl'):SetCost(10000)cosmetics.RegisterItem('holster_csgolegholsterl'):SetName('Gun Holster 2'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/csgolegholsterl.mdl'):SetCost(10000)cosmetics.RegisterItem('holster_engi2misc3l'):SetName('Engineer Leg 3 Left'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engi2misc3l.mdl'):SetCost(10000)cosmetics.RegisterItem('holster_engi2misc3r'):SetName('Engineer Leg 3 Right'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engi2misc3r.mdl'):SetCost(10000)cosmetics.RegisterItem('holster_lde10holster'):SetName('DE10 Holster'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/lde10holster.mdl'):SetCost(10000)cosmetics.RegisterItem('holster_rde10holster'):SetName('DE10 Holster'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/rde10holster.mdl'):SetCost(10000)cosmetics.RegisterItem('holster_lholstergun'):SetName('Gun Holster'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/lholstergun.mdl'):SetCost(10000)cosmetics.RegisterItem('holster_rholstergun'):SetName('Gun Holster'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_LEG):SetContentID('pouch'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/rholstergun.mdl'):SetCost(10000)cosmetics.RegisterItem('lleg_redlegattach'):SetName('Red Leg Attachment'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_LEG):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/redlegattach.mdl'):SetCost(15000)cosmetics.RegisterItem('bicep_attachmentl'):SetName('Utilities Band'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_ARM):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/lbicepattach1.mdl'):SetCost(10000)cosmetics.RegisterItem('shoulder_lshoulderpouch'):SetName('Arm Pouch Left'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_ARM):SetContentID('shoulder'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/lshoulderpouch.mdl'):SetCost(15000)cosmetics.RegisterItem('bicep_redbicep'):SetName('Bicep Band'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_ARM):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/redbicep.mdl'):SetCost(10000)cosmetics.RegisterItem('shoulder_rshoulderpouch'):SetName('Arm Pouch Right'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_ARM):SetContentID('shoulder'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/rshoulderpouch.mdl'):SetCost(15000)cosmetics.RegisterItem('bicep_engi2arml'):SetName('Utilities Band'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_ARM):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engi2arml.mdl'):SetCost(10000)cosmetics.RegisterItem('bicep_engi2armr'):SetName('Utilities Band'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_ARM):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/engi2armr.mdl'):SetCost(10000)cosmetics.RegisterItem('bicep_attachmentr'):SetName('Utilities Band'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_ARM):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/rbicepattach1.mdl'):SetCost(10000)cosmetics.RegisterItem('hallowen_gruesomegourd'):SetName('Gruesome Gourd'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetModel('models/galactic/cosmetics/halloween/hwn2021_gruesome_gourd.mdl'):SetContentID('halloween',true):SetSeasonal(true):SetIcon(b)cosmetics.RegisterItem('hallowen_defaced'):SetName('Defaced Mask'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetModel('models/galactic/cosmetics/halloween/hwn2024_defaced_style1.mdl'):SetContentID('halloween',true):SetSeasonal(true):SetIcon(b)cosmetics.RegisterItem('hallowen_forgottenking'):SetName('Forgotten King'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetModel('models/galactic/cosmetics/halloween/sf14_deadking_head.mdl'):SetContentID('halloween',true):SetSeasonal(true):SetIcon(b)cosmetics.RegisterItem('face_gasmask'):SetName('Gas Mask'):SetDescription('Standard issue gasmask'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetContentID('halloween',true):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/glassesmask.mdl'):AddTransform({Model="models/player/swtor/arsenic/shadow.mdl",Scale=0.980000,Position=Vector(-0.740000,0.000000,-0.060000),Angle=Angle(0.000000,91.636398,0.000000),SteamID="STEAM_0:0:48139437"}):AddTransform({Model="models/tfa/comm/gg/pm_sw_mundi.mdl",Scale=1.176400,Position=Vector(-2.740000,0.000000,-12.656400),Angle=Angle(0.000000,90.556396,0.900000),SteamID="STEAM_0:0:84399229"}):AddTransform({Model="models/gonzo/saeseetiin/saeseetiin.mdl",Scale=1.005500,Position=Vector(-1.040000,0.000000,-0.180000),Angle=Angle(0.000000,91.636398,0.000000),SteamID="STEAM_0:1:199958960"}):AddTransform({Attachment="anim_attachment_head",Model="models/tfa/comm/gg/pm_sw_imagundi.mdl",Scale=1.000000,Position=Vector(-2.800000,-0.140000,-0.700000),Angle=Angle(0.000000,94.909103,0.000000),SteamID="STEAM_0:1:66792387"}):SetCost(50000)cosmetics.RegisterItem('chest_cyber1r'):SetName('Cyber Implant Right 1'):SetDescription('A cybernetic implant'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/cyber1r.mdl'):SetCost(25000)cosmetics.RegisterItem('chest_cyber1l'):SetName('Cyber Implant Left 1'):SetDescription('A cybernetic implant'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE2):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/cyber1l.mdl'):SetCost(25000)cosmetics.RegisterItem('chest_cyber2r'):SetName('Cybernetic Communications'):SetDescription('A cybernetic communication system'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/cyber2r.mdl'):SetCost(25000)cosmetics.RegisterItem('chest_cyber2l'):SetName('Cybernetic Communications'):SetDescription('A cybernetic communication system'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE2):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/cyber2l.mdl'):SetCost(25000)cosmetics.RegisterItem('face_mischelm1'):SetName('Helmet Attachment'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/mischelm1.mdl'):SetCost(60000)cosmetics.RegisterItem('face_mischelm2'):SetName('Helmet Attachment 2'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/mischelm4.mdl'):SetCost(60000)cosmetics.RegisterItem('face_mischelm3'):SetName('Helmet Attachment 3'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/mischelm5.mdl'):SetCost(60000)cosmetics.RegisterItem('face_mischelm4'):SetName('Head Band'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/mischelm7.mdl'):SetCost(60000)cosmetics.RegisterItem('knee_redkneepad'):SetName('Red Kneepad'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_KNEE):SetContentID('utility'):SetIcon(a):SetModel('models/galactic/cosmetics/phase1cosmetics/redkneepad.mdl'):SetCost(15000)cosmetics.RegisterItem('christmas_thwomps'):SetName('Flip Thwomps'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FEET):SetContentID('christmas',true):SetIcon(c):SetModel('models/galactic/cosmetics/winter/dec20_flip_thwomps_engineer.mdl'):SetCost(60000):SetSeasonal(true):SetScale(1.2)cosmetics.RegisterItem('halloween_paws'):SetName('Pickled Paws'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FEET):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hwn_demo_misc2.mdl'):SetSeasonal(true)cosmetics.RegisterItem('halloween_cephalopod'):SetName('Sprinting Cephalopod'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FEET):SetContentID('halloween',true):SetIcon(b):SetModel('models/galactic/cosmetics/halloween/hw2013_running_octopus.mdl'):SetSeasonal(true)cosmetics.RegisterItem('cadbane_arm_l'):SetName('Cadbane Part'):SetModel('models/galactic/cosmetics/phase1cosmetics/cadbane_arm_l.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_ARM):SetIcon(a):SetCredits(350,true)cosmetics.RegisterItem('cadbane_arm_r'):SetName('Cadbane Part'):SetModel('models/galactic/cosmetics/phase1cosmetics/cadbane_arm_r.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_ARM):SetIcon(a):SetCredits(350,true)cosmetics.RegisterItem('cadbane_hat'):SetName('Cadbane Hat'):SetModel('models/galactic/cosmetics/phase1cosmetics/cadbane_hat.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetIcon(a):SetCredits(500,true):AddTransform({Model="models/player/sample/jax/jax/jax2.mdl",Scale=1.020000,Position=Vector(-0.840000,0.000000,-0.740000),Angle=Angle(0.000000,0.000000,0.000000),SteamID="STEAM_0:1:192973846"})cosmetics.RegisterItem('cadbane_vest'):SetName('Cadbane Vest'):SetModel('models/galactic/cosmetics/phase1cosmetics/cadbane_vest.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetIcon(a):SetCredits(350,true)cosmetics.RegisterItem('capbreaker_arm_r'):SetName('Capbreaker Part'):SetModel('models/galactic/cosmetics/phase1cosmetics/capbreaker_arm_r.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_ARM):SetIcon(a):SetCredits(350,true)cosmetics.RegisterItem('engineerhead'):SetName('Engineer Helmet'):SetModel('models/galactic/cosmetics/phase1cosmetics/engineer_hat.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HEAD):SetIcon(a):SetCredits(500,true)cosmetics.RegisterItem('engineervest'):SetName('Engineer Vest'):SetModel('models/galactic/cosmetics/phase1cosmetics/engineer_vest.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.CHEST):SetIcon(a):SetCredits(500,true)cosmetics.RegisterItem('flametrooperback'):SetName('Flametrooper Backpack'):SetModel('models/galactic/cosmetics/phase1cosmetics/flametrooper_backpack.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetIcon(a):SetCredits(400,true)cosmetics.RegisterItem('heavyback'):SetName('Left Eye Scar'):SetModel('models/galactic/cosmetics/phase1cosmetics/lefteye1.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetIcon(a):SetCost(600000)cosmetics.RegisterItem('righteyescar1'):SetName('Right Eye Scar'):SetModel('models/galactic/cosmetics/phase1cosmetics/righteye1.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.FACE):SetIcon(a):SetCost(600000)cosmetics.RegisterItem('heavy_leg_r'):SetName('Heavy Leg'):SetModel('models/galactic/cosmetics/phase1cosmetics/heavy_leg_r.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_LEG):SetIcon(a):SetCredits(350,true)cosmetics.RegisterItem('heavy_leg_l'):SetName('Heavy Leg'):SetModel('models/galactic/cosmetics/phase1cosmetics/heavy_leg_l.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_LEG):SetIcon(a):SetCredits(350,true)cosmetics.RegisterItem('previzsla_arm_l'):SetName('Previzsla Arm'):SetModel('models/galactic/cosmetics/phase1cosmetics/previzsla_arm_l.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_ARM):SetIcon(a):SetCredits(350,true)cosmetics.RegisterItem('previzsla_arm_r'):SetName('Previzsla Arm'):SetModel('models/galactic/cosmetics/phase1cosmetics/previzsla_arm_r.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_ARM):SetIcon(a):SetCredits(350,true)cosmetics.RegisterItem('previzsla_leg_l'):SetName('Previzsla Leg'):SetModel('models/galactic/cosmetics/phase1cosmetics/previzsla_leg_l.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.LEFT_LEG):SetIcon(a):SetCredits(350,true)cosmetics.RegisterItem('previzsla_leg_r'):SetName('Previzsla Leg'):SetModel('models/galactic/cosmetics/phase1cosmetics/previzsla_leg_r.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.RIGHT_LEG):SetIcon(a):SetCredits(350,true)cosmetics.RegisterItem('previzsla_jetpack'):SetName('Previzsla Jetpack'):SetModel('models/galactic/cosmetics/phase1cosmetics/previzsla_jetpack.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetIcon(a):SetCredits(500,true)cosmetics.RegisterItem('rex_jetpack'):SetName('Rex Jetpack'):SetModel('models/galactic/cosmetics/phase1cosmetics/rex_jetpack.mdl'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.BACK):SetIcon(a):SetCredits(500,true)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/cosmetics/callingcard_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/cosmetics/vehicles_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/events/failsafe_sh.lua:
srp.events.Buttons={}local a=Vector(-5300,-3070,-13840)local b=Angle()local c=50;local d=50;local e=Vector(-5528,-2645,-13660)local f=Angle(90,0,0)local g=Sound'galactic/minigames/correct.wav'local h=Sound'galactic/minigames/incorrect.wav'local i=Sound'galactic/minigames/success1.wav'local j=Sound'galactic/minigames/failure.wav'local function k(l,m)local n=ents.Create'rp_timer'n:SetPos(e)n:SetAngles(f)n:Spawn()n:SetTimer(0)n:Pause(true)n.NoFinishSound=true;n:OnTimerFinished(function(self)hook.Run('OnEventTimerFinished',self)end)srp.events.TimerEnt=n;local o=-1;local p=0;for q=1,l do local r=ents.Create'rp_button'local s=p;p=math.ceil(q/14)-1;if s!=p then o=0 else o=o+1 end;local t=(o-1)*c+(o-1)*10;local u=p*d+p*10;r.id=q;r.EventButton=true;r:SetPos(a+Vector(u,t,0))r:SetAngles(b)r:Spawn()r:SetTitle(tostring(q))r:SetWaitTime(2)r:SetResetTime(0)r:SetDisplayAll(true)r.CanUse=function(v,w)return!IsValid(w.PressedButton)end;r.OnPressed=function(v,w)if v.PressedBy then return end;v:SetTitle'X'if v.Telling then v:EmitSound(v.Explosive&&h||g)end;v.Disabled=true;v.PressedBy=w;w.PressedButton=v;hook.Run('OnPlayerPressedIdiotButton',w,v)end;table.insert(srp.events.Buttons,r)end end;local function x(m)if IsValid(srp.events.TimerEnt)then srp.events.TimerEnt:SetTimer(m)srp.events.TimerEnt:Pause(false)end end;local function y(z)for A,r in ipairs(srp.events.Buttons)do if!IsValid(r)then continue end;if IsValid(r.PressedBy)then r.PressedBy.PressedButton=false end;r.Telling=math.random()>.7;r.PressedBy=nil;r.Disabled=false;r.Explosive=false;r:SetOn(false)r:SetTitle(r.id)r:SetColor(col.white)end;for q=1,z do local r=srp.events.Buttons[math.random(1,#srp.events.Buttons)]if IsValid(r)then r.Explosive=true end end end;local function B()for A,r in ipairs(srp.events.Buttons)do if IsValid(r)then r:Remove()end end;if IsValid(srp.events.TimerEnt)then srp.events.TimerEnt:Remove()end;srp.events.Buttons={}end;local function C(l)for q=1,l do local r=table.remove(srp.events.Buttons)if IsValid(r)then r:Remove()end end;if#srp.events.Buttons==0 then return false else return true end end;local D={function(self)self:DisplayTitle'Pick a button!'y(1)return 15,true end,function(self)self.BadPlayers={}local E={}for A,w in pairs(self:GetPlayers())do if!IsValid(w)then elseif!IsValid(w.PressedButton)||w.PressedButton.Explosive then table.insert(self.BadPlayers,w)table.insert(E,w:Nick())elseif w.PressedButton.Explosive then w.PressedButton:SetColor(col.red)table.insert(self.BadPlayers,w)table.insert(E,w:Nick())end end;if#E>0 then self:DisplayTitle(table.concat(E,', ')..' failed to pick the right button!')if IsValid(srp.events.TimerEnt)then srp.events.TimerEnt:EmitSound(j)end else self:DisplayTitle('Everyone passed!')if IsValid(srp.events.TimerEnt)then srp.events.TimerEnt:EmitSound(i)end end;return#E>0&&4||2,false end,function(self,F)for A,w in pairs(self.BadPlayers)do if IsValid(w)then w:Kill()end end;self.Round=(self.Round||1)+1;self:DisplayTitle('Get ready for round '..self.Round..'!')return 5,false end}srp.events.Register('failsafe','Failsafe',20):SetArenaEvent(true):SetMusic('sound/galactic/minigames/teaser.wav',{loop=true,AmpStart=1,AmpAmount=14}):SetMaxPlaytime(720):SetTheme('failsafe'):SetRequiresVote(true,3,15):SetDescription([[
		Pick a button each round and hope for the best.
	]]):SetTagLines({default='Pick the correct button. When will your luck run out?'}):OnStart(function(self)if CLIENT then return end;self.Round=1;local G=self:GetPlayers()self:DisplayTitle'Get Ready!'k(#G+1)self:SetTimer(5)srp.events.SpawnAroundVector(G,srp.events.Arena.Pos+Vector(0,0,-150),200,function(w)w:StripWeapons()end)end):OnPlayerRemoved(function(self,w)local G=self:GetPlayers()if IsValid(w)then w:SetCharacterStatisticAverage('minigame_losses',1)w:SetCharacterStatisticAverage('minigame_wins',0)else self:DisplayDeathCounter(#G)end;if#G<=1||!C(1)then self:End(srp.events.END,G[1])end end):OnWriteEndData(function(self,w)net.WritePlayer(w)end):OnReadEndData(function(self,w)return net.ReadPlayer(w)end):OnEnd(function(self,H,w)if CLIENT then return end;B()if!IsValid(w)||!IsEntity(w)then return end;w:SetCharacterStatisticAverage('minigame_wins',1)srp.notif.SuccessAll(5,w:Nick()..' has won Failsafe.')timer.Simple(5,function()if IsValid(w)then w:Spawn()end end)end):OnTimerFinished(function(self,F)local I=(F-1)%#D+1;local m,J=D[I](self)if m then self:SetTimer(m)if J!=false then x(m)end end end):AddHook('OnPlayerPressedIdiotButton',function(self,w,K)if K.Telling then self:DisplayTitle(K.Explosive&&'Uhoh....'||'I think you made the right choice',w)end end):AddHook('PlayerDeath',function(self,w)w.PressedButton=nil;self:RemovePlayer(w)end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/gamemaster/regmodels_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/construction/construction_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/_base_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/ammo_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/craftables_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/fireworks_sh.lua:
srp.items.RegisterBase('FIREWORKS',{name='Firework',description='Place down on the floor and ignite. Pretty, pretty basic.',description_small='A basic firework',icon='materials/galactic/ui/inventory/fireworks.png',model=Model'models/turtle/firework.mdl',maxstack=3000,class='',upgrade='',colors={Color(255,255,255),Vector(1,1,1)},CanUse=function(self,a)return a:HasUpgrade(self.upgrade)end,interaction={OnPickup={label='Pickup',callback=function(self,a,b,c,d,e)local f=b:AddItem(self,d,true)if f then e:EmitSound('items/ammocrate_close.wav')return true else return false end end},Use={label='Deploy Firework',callback=function(self,a,b,c,d)local g=scripted_ents.GetStored(self.class).t;local h=g:SpawnFunction(a,a:GetEyeTraceNoCursor())h:SetPropOwner(a)h:SetupData(self.colors[1],self.colors[2])if self.OnExplode then h.OnExplode=self.OnExplode end;return 1 end}}})local i={}local function j(k,l,m,n,o,p,q,r,s)local t='upgrd_'..k:lower()q=Vector(q.r,q.g,q.b)local u=os.time()-1;local v=u;if istable(n)then v=n[1]n=n[2]end;srp.items.Register('Fireworks',k,{id=k,base='FIREWORKS',name=m,description='A '..m..' firework',cost=5000,buycount=5,tradedisabled=true,nodrop=true,class='sent_firework',OnExplode=s,upgrade=t,colors={p,q}})srp.shop.Add(m,t):SetCat('Seasonal'):SetImage(Material'materials/galactic/ui/inventory/fireworks.png'):SetDesc([[
			Special for ]]..l..[[, you will never be able to buy this again but will be able to use it every related season and New Years!

			Allows you to buy a firework entity that can be blasted off!
			Buy the fireworks from the ammo vendor.
			Deploy it from the inventory and press E on them to fire them off!!
			Upgrade can be purchased until ]]..os.date('%Y/%m/%d %I:%M %p',n)..[[.
		]]):SetPrice(o):SetStackable(false):SetNetworked(true):SetTimeStamps(v,n)if u>=v&&u<=n then table.insert(i,{k,r||'STORE_MUNITIONS'})end end;local function w(x)local y=x:GetPos()local z=x:GetUp()local A=EffectData()A:SetOrigin(y)A:SetNormal(z)util.Effect('firework_stars',A,true,true)end;local function B(x)local y=x:GetPos()local z=x:GetUp()local A=EffectData()A:SetOrigin(y)A:SetNormal(z)util.Effect('fireworks_halloween',A,true,true)end;local function C(x)local y=x:GetPos()local z=x:GetUp()local A=EffectData()A:SetOrigin(y)A:SetNormal(z)util.Effect('fireworks_newyear',A,true,true)end;local function D(x)local y=x:GetPos()local z=x:GetUp()local A=EffectData()A:SetOrigin(y)A:SetNormal(z)util.Effect('fireworks_newyear25',A,true,true)end;local function E(x)local y=x:GetPos()local z=x:GetUp()local A=EffectData()A:SetOrigin(y)A:SetNormal(z)util.Effect('fireworks_newyear23',A,true,true)end;local function F(x)local y=x:GetPos()local z=x:GetUp()local A=EffectData()A:SetOrigin(y)A:SetNormal(z)util.Effect('fireworks_valentine',A,true,true)end;local function G(x)local y=x:GetPos()-Vector(0,0,100)local z=x:GetUp()local A=EffectData()A:SetOrigin(y)A:SetNormal(z)util.Effect('fireworks_may4th',A,true,true)local H=EffectData()H:SetOrigin(y+Vector(0,0,24))H:SetRadius(55)util.Effect('rb655_force_repulse_out',H,true,true)end;local function I(x)local y=x:GetPos()-Vector(0,0,100)local z=x:GetUp()local A=EffectData()A:SetOrigin(y)A:SetNormal(z)util.Effect('fireworks_america',A,true,true)local H=EffectData()H:SetOrigin(y+Vector(0,0,24))H:SetRadius(55)util.Effect('rb655_force_repulse_out',H,true,true)end;j('FIREWORK_INDEP_2016','4th July 2016','Independence Day 2016',1708559999,750,Color(0,0,255),Color(255,0,0))j('FIREWORK_INDEP_2017','4th July 2017','Independence Day 2017',1708559999,750,Color(255,0,0),Color(136,229,22))j('FIREWORK_INDEP_2018','4th July 2018','Independence Day 2018',1708559999,750,Color(0,255,0),Color(9,181,249))j('FIREWORK_NEWYEAR_2018','New Years 2018-2019','New Years 2018',1708559999,750,Color(0,190,250),Color(0,255,0))j('FIREWORK_NEWYEAR_2016','New Years 2016-2017','New Years 2016',1708559999,750,Color(143,79,255),Color(143,79,255))j('FIREWORK_NEWYEAR_2017','New Years 2017-2018','New Years 2017',1708559999,750,Color(244,66,215),Color(10,140,255))j('FIREWORK_NEWYEAR_2019','New Years 2019-2020','New Years 2019',1708559999,750,Color(175,0,255),Color(255,125,0))j('FIREWORK_NEWYEAR_2020','New Years 2020-2021','New Years 2020',1708559999,750,Color(255,5,5),Color(150,5,255))j('FIREWORK_NEWYEAR_2021','New Years 2021-2022','New Years 2021',1708559999,750,Color(251,255,0),Color(121,241,198))j('FIREWORK_NEWYEAR_2022','New Years 2022 - 2023','New Years 2022',1708559999,750,Color(255,155,25),Color(255,255,255),nil,C)j('FIREWORK_NEWYEAR_2023','New Years 2023 - 2024','New Years 2023',1708559999,750,Color(241,249,4),Color(255,255,255),nil,E)j('FIREWORK_NEWYEAR_2025','New Years 2024 - 2025','New Years 2025',1708559999,750,Color(33,249,4),Color(215,24,24),nil,D)j('FIREWORK_INDEP_2019','4th July 2019','Independence Day 2019',1722775648,750,Color(180,0,0),Color(9,181,249))j('FIREWORK_INDEP_2020','4th July 2020','Independence Day 2020',1722775648,750,Color(250,110,180),Color(110,240,250))j('FIREWORK_INDEP_2021','4th July 2021','Independence Day 2021',1722775648,750,Color(255,245,40),Color(255,0,0))j('FIREWORK_INDEP_2022','4th July 2022','Independence Day 2022',1722775648,750,Color(255,25,25),Color(87,133,18),nil,w)j('FIREWORK_INDEP_2024','4th July 2024','Independence Day 2024',1722775648,750,Color(255,25,25),Color(68,129,203),nil,I)j('FIREWORK_HWEEN_2022','Halloween','Halloween',1708559999,750,Color(255,155,25),Color(255,255,255),nil,B)j('FIREWORK_VALENTINES_2022','Valentine 2022','Valentine 2022',1708559999,750,Color(255,20,147),Color(255,182,193))j('FIREWORK_VALENTINES_2023','Valentine 2023','Valentine 2023',1708559999,750,Color(120,21,73),Color(2255,0,38),nil,F)j('FIREWORK_MAY4TH_2023','May 4th 2023','May 4th 2023',1722775648,300,Color(211,205,33),Color(47,95,217),nil,G)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/storetokens_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/tokens_sh.lua:
srp.items.RegisterBase('SERVEREVENTTOKEN',{name='Server Token Item',icon='materials/galactic/ui/inventory/security.png',price=999999,maxstack=9999,model=Model'models/props/cargocrate1.mdl',gui_position=Vector(0,0,20),nodrop=true,cantrade=false,eventid='vip',weight=0,interaction={Use={label='Use',count=1,callback=function(self,a,b,c,d)if!self.eventid then return false end;srp.shop.StartEvent(a,self.eventid)return 1 end}}})srp.items.Register('Tokens','SERVERTOKEN_VIP',{base='SERVEREVENTTOKEN',name='VIP Store Event Token',eventid='vip',description='Use to start the store VIP event',rarity='rare'})srp.items.Register('Tokens','SERVERTOKEN_CRAFTING',{base='SERVEREVENTTOKEN',name='Crafting Store Event Token',eventid='crafting',description='Use to start the store crafting event',rarity='rare'})srp.items.Register('Tokens','SERVERTOKEN_PACKAGE',{base='SERVEREVENTTOKEN',name='Package Store Event Token',eventid='package',description='Use to start the store package event',rarity='rare'})srp.items.Register('Tokens','SERVERTOKEN_PATROLS',{base='SERVEREVENTTOKEN',name='Patrols Store Event Token',eventid='patrols',description='Use to start the store patrols event',rarity='rare'})srp.items.RegisterBase('TOKEN',{name='Token Item',icon='materials/galactic/ui/inventory/security.png',price=999999,maxstack=9999,model=Model'models/props_borealis/bluebarrel001.mdl',gui_position=Vector(0,0,20),nodrop=true,cantrade=false,eventid='redlight',interaction={Use={label='Use',count=1,callback=function(self,a,b,c,d)local e=srp.defcon.GetStatus(a:GetAllegianceID(),6)if!self.eventid||e<5 then return false end;srp.events.StartEvent(self.eventid,false,{a},function(f)if f&&b then b:RemoveItem(self,1)end end)return false end}}})srp.items.Register('Tokens','TOKEN_REDLIGHT',{base='TOKEN',name='Redlight Event Token',eventid='redlight',description='Use to force start a red-light event.',rarity='rare'})srp.items.Register('Tokens','TOKEN_SPLEEF',{base='TOKEN',name='Spleef Event Token',eventid='spleef',description='Use to force start a spleef event.',rarity='rare'})srp.items.Register('Tokens','TOKEN_MK',{base='TOKEN',name='Mortal Kombat Event Token',eventid='MTK',description='Use to force start a Mortal Kombat event.',rarity='rare'})srp.items.Register('Tokens','TOKEN_FAILSAFE',{base='TOKEN',name='Failsafe Event Token',eventid='failsafe',description='Use to force start a Failsafe event.',rarity='rare'})srp.items.Register('Tokens','TOKEN_SAFELANDING',{base='TOKEN',name='Safelanding Event Token',eventid='failsafe',description='Use to force start a Safelanding event.',rarity='rare'})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/loadouts/battalions_sh.lua:
srp.loadouts.Register('JEDI','REPUBLIC',{utility={items={WEAPON_UTILITY_BATON={cost=5000,whitelist={jedi=true,class={'JEDIPK','JEDIHG','JEDIWARDEN'},steamid={['STEAM_0:0:36358160']=true}}}}}})srp.loadouts.Register('187th','REPUBLIC',{specialty={items={WEAPON_UTILITY_JETPACK=12000}},primary={items={WEAPON_RIFLE_RT97C={cost=50000}}}})srp.loadouts.Register('187KW','REPUBLIC',{specialty={items={WEAPON_UTILITY_JETPACK=12000}},primary={items={WEAPON_RIFLE_RT97C={cost=50000}}}})srp.loadouts.Register('ARC','REPUBLIC',{primary={items={WEAPON_RIFLE_STEALTHBLASTER={cost=8000,whitelist={class={'ARCSHADOWTROOPER','CLONEGALAK','ARCAKASHI'}}},WEAPON_RIFLE_QUADBLASTER={cost=120000,whitelist={permission={'heavy'}}}}},specialty={items={WEAPON_UTILITY_CLOAK={cost=50000}}},utility={items={WEAPON_UTILITY_DRONE_ARC=50000,WEAPON_UTILITY_JETPACK={cost=1000,whitelist={class={'ZENDO','ASTRO','RAMSEY','ARCJAX','ARCSHADOW','ARCVEN','ARCRAMSEY','ARCSQOZILLA','SEAN','HARLEM','187SIN'}}},WEAPON_UTILITY_RAT={cost=15000,whitelist={class={'CLIPS'}}}}}})srp.loadouts.Register('CG','REPUBLIC',{specialty={items={WEAPON_UTILITY_STUNGUN=12000}},utility={items={WEAPON_UTILITY_CUFFS=15000,WEAPON_UTILITY_JETPACK={cost=1000,whitelist={class={'501HADDOCK'}}}}}})srp.loadouts.Register('ORG','REPUBLIC',{specialty={items={WEAPON_UTILITY_STUNGUN=12000}},utility={items={WEAPON_UTILITY_CUFFS=15000}}})srp.loadouts.Register('212th','REPUBLIC',{specialty={items={WEAPON_UTILITY_JETPACK=12000}},grenade={items={WEAPON_GRENADE_POPPER=20000}}})srp.loadouts.Register('212AB','REPUBLIC',{specialty={items={WEAPON_UTILITY_JETPACK=12000}},grenade={items={WEAPON_GRENADE_POPPER=20000}}})srp.loadouts.Register('501st','REPUBLIC',{specialty={items={WEAPON_UTILITY_RAT=190000}},utility={items={WEAPON_UTILITY_AA=80000}}})srp.loadouts.Register('332nd','REPUBLIC',{specialty={items={WEAPON_UTILITY_RAT=190000}},utility={items={WEAPON_UTILITY_AA=80000}}})srp.loadouts.Register('RC','REPUBLIC',{primary={items={WEAPON_SNIPER_DC17M=15000,WEAPON_SHOTGUN_DC17=12000}},specialty={items={WEAPON_UTILITY_GLRC=120000}},utility={items={WEAPON_UTILITY_REPAIR=15000,WEAPON_UTILITY_JETPACK={cost=15000,whitelist={class={'TERRY','RCHOTSON2','RCSMASHY','RCHEI','RCTWELVES','RCSIN','RCKAL','RCHOTSON','STORYZ'}}},WEAPON_UTILITY_RAT={cost=15000,whitelist={class={'RCHOTSON'}}}}}})srp.loadouts.Register('104th','REPUBLIC',{specialty={items={WEAPON_UTILITY_REPAIR=15000}},secondary={items={WEAPON_RIFLE_SE14R={cost=25000}}},utility={items={WEAPON_UTILITY_JETPACK={cost=15000,whitelist={class={'104NJORD','104ENFORCER'}}}}}})srp.loadouts.Register('104WP','REPUBLIC',{specialty={items={WEAPON_UTILITY_REPAIR=15000}},secondary={items={WEAPON_RIFLE_SE14R={cost=25000}}},utility={items={WEAPON_UTILITY_SPADE={cost=15000,whitelist={class={'NEXU'}}}}}})srp.loadouts.Register('32nd','REPUBLIC',{secondary={items={WEAPON_PISTOL_BLURRG1120={cost=50000}}}})srp.loadouts.Register('327th','REPUBLIC',{specialty={items={WEAPON_UTILITY_SPADE=15000}},secondary={items={WEAPON_RIFLE_EE4={cost=50000}}},utility={items={WEAPON_UTILITY_JETPACK={cost=15000,whitelist={class={'DUWILL'}}}}}})srp.loadouts.Register('327KC','REPUBLIC',{specialty={items={WEAPON_UTILITY_SPADE=15000}},secondary={items={WEAPON_RIFLE_EE4={cost=50000}}},utility={items={WEAPON_UTILITY_JETPACK={cost=15000,whitelist={class={'327KCBEAR','HOOD'}}}}}})srp.loadouts.Register('41st','REPUBLIC',{specialty={items={WEAPON_UTILITY_SPADE=15000}}})srp.loadouts.Register('41SB','REPUBLIC',{specialty={items={WEAPON_UTILITY_SPADE=15000}},utility={items={WEAPON_UTILITY_JETPACK={cost=15000,whitelist={class={'RCHOTSON','RCHOTSON2'}}},WEAPON_UTILITY_RAT={cost=15000,whitelist={class={'RCHOTSON','RCHOTSON2'}}}}}})srp.loadouts.Register('GM','REPUBLIC',{primary={items={WEAPON_RIFLE_DC12U={cost=50000}}},secondary={items={WEAPON_UTILITY_FLAMETHROWER={cost=15000,whitelist={permission={'heavy'}}},WEAPON_KATANA={cost=15000,whitelist={steamid={['STEAM_0:1:514668327']=true}}}}},specialty={items={WEAPON_UTILITY_EODTOOLKIT=15000}},utility={items={WEAPON_UTILITY_SATCHEL=15000,WEAPON_UTILITY_SPADE=15000,WEAPON_UTILITY_JETPACK={cost=15000,whitelist={class={'SEAN'}}}}}})srp.loadouts.Register('NAVY','REPUBLIC',{utility={items={WEAPON_UTILITY_JETPACK={cost=15000,whitelist={class={'DARVO'}}}}}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/kamino_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/liberator_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/liberator_sh.lua:
srp.spawn.AddSpawnPoints('rp_liberator_sup_b8at',{adminroom={Vector(-7300,200,16016),Vector(-7300,0,16016),Vector(-7300,-200,16016),Vector(-7300,-400,16016),Vector(-7300,-600,16016),Vector(-7300,-800,16016)},jails={REPUBLIC={{pos=Vector(4565,392,236),ang=Angle(0,0,0)},{pos=Vector(4424,392,236),ang=Angle(0,0,0)},{pos=Vector(4283,392,236),ang=Angle(0,0,0)},{pos=Vector(4142,392,236),ang=Angle(0,0,0)},{pos=Vector(4001,392,236),ang=Angle(0,0,0)},{pos=Vector(3860,392,236),ang=Angle(0,0,0)},{pos=Vector(4565,-23,236),ang=Angle(0,-180,0)},{pos=Vector(4424,-23,236),ang=Angle(0,-180,0)},{pos=Vector(4283,-23,236),ang=Angle(0,-180,0)},{pos=Vector(4142,-23,236),ang=Angle(0,-180,0)},{pos=Vector(4001,-23,236),ang=Angle(0,-180,0)},{pos=Vector(3860,-23,236),ang=Angle(0,-180,0)}},CIS={{pos=Vector(4706,392,236),ang=Angle(0,0,0)},{pos=Vector(4706,-23,236),ang=Angle(0,-180,0)}},SITH={{pos=Vector(4706,392,236),ang=Angle(0,0,0)},{pos=Vector(4706,-23,236),ang=Angle(0,-180,0)}}},groups={['NAVY']={pos=Vector(7907,-616,4256)},['CG']={pos=Vector(4502,172,65),ang=Angle(0,145,0),dir=Vector(-1,1,0)},['RC']={pos=Vector(4751,-128,-509),ang=Angle(0,-150,0),dir=Vector(-1,-1,0)},['41st']={pos=Vector(4747,-126,-687),ang=Angle(0,-150,0),dir=Vector(-1,-1,0)},['41SB']={pos=Vector(4747,-126,-687),ang=Angle(0,-150,0),dir=Vector(-1,-1,0)},['104th']={pos=Vector(5513,-261,-479),ang=Angle(0,-140,0),dir=Vector(1,-1,0)},['104WP']={pos=Vector(5513,-261,-479),ang=Angle(0,-140,0),dir=Vector(1,-1,0)},['327th']={pos=Vector(4868,129,-479),ang=Angle(0,40,0)},['327KC']={pos=Vector(4868,129,-479),ang=Angle(0,40,0)},['501st']={pos=Vector(5380,-134,-687),ang=Angle(0,-150,0),dir=Vector(-1,-1,0)},['332nd']={pos=Vector(5380,-134,-687),ang=Angle(0,-150,0),dir=Vector(-1,-1,0)},['ARC']={pos=Vector(4880,-138,-479),ang=Angle(0,-140,0),dir=Vector(1,-1,0)},['187th']={pos=Vector(6030,-128,-687),ang=Angle(0,-145,0),dir=Vector(-1,-1,0)},['212th']={pos=Vector(6023,136,-687),ang=Angle(0,45,0),dir=Vector(-1,1,0)},['212AB']={pos=Vector(6023,136,-687),ang=Angle(0,45,0),dir=Vector(-1,1,0)},['32nd']={pos=Vector(5510,250,-543),ang=Angle(0,0,0),dir=Vector(1,1,0)},['RM']={pos=Vector(-1568,-1476,70),ang=Angle(0,-45,0),dir=Vector(1,-1,0)},['JEDI']={pos=Vector(571.330000,-14687.850000,-16336),ang=Angle(0,145,0),dir=Vector(1.000000,1.000000,0.000000)},['GM']={pos=Vector(4563,113,-544),ang=Angle(0,90,0),dir=Vector(-1,1,0)},erl={pos=Vector(5770,-402,-237),ang=Angle(0,0,0)}},allegiances={['CIS']={pos=Vector(1976,14174,-14130),ang=Angle(0,0,0)}},default={pos=Vector(-90,-430,-768),ang=Angle(0,0,0),dir=Vector(-1,1,0)}})local function a()if CLIENT then return(srp.defcon.status||6)>=4 else return srp.defcon.GetStatus('REPUBLIC',6)>=4||false end end;srp.spawn.AddCustomPoint('Training Room','ALL',{gridid='default',cooldown=4,permanent=true,textcolor=col.white_dark:Copy(),outline=col.white:Copy()})srp.spawn.AddCustomPoint('Jedi Temple','ALL',{gridid='JEDI',cooldown=4,permanent=true,textcolor=col.green:Copy(),outline=col.green_dark:Copy(),canuse=function(self,b)local c=b:GetGroupClass()local d=b:GetGroup()if c then return c:HasPermission'jedi'&&d.id!='JEDI'end end})srp.spawn.AddCustomPoint('Lobby','ALL',{map='rp_liberator_sup_b8at',gridid='erl',ang=Angle(0,-50,0),cooldown=30,permanent=true,textcolor=col.red:Copy(),outline=col.red_dark:Copy(),canuse=a})srp.spawn.AddCustomPoint('Mess Hall','ALL',{map='rp_liberator_sup_b8at',pos={Vector(1982,-373,-13270),Vector(1840,-519,-13270),Vector(1995,-663,-13270),Vector(2156,-515,-13270)},ang=Angle(0,-50,0),cooldown=30,permanent=true,textcolor=col.orange:Copy(),outline=col.orange:Copy(),canuse=a})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/training_sh.lua:
srp.spawn.AddSpawnPoints('rp_liberator_sup_training_b2',{jails={REPUBLIC={{pos=Vector(4706,392,236),ang=Angle(0,0,0)}},CIS={{pos=Vector(4706,392,236),ang=Angle(0,0,0)}},SITH={{pos=Vector(4706,392,236),ang=Angle(0,0,0)}}},groups={csr1={pos=Vector(-1820,-1998,-622),ang=Angle(0,90,0),dir=Vector(1,-1,0)},csr2={pos=Vector(-3749,1927,-622),ang=Angle(0,-90,0),dir=Vector(-1,1,0)},esr1={pos=Vector(-1767,1140,-622),ang=Angle(0,-90,0),dir=Vector(1,-1,0)},esr2={pos=Vector(-3740,-1140,-622),ang=Angle(0,90,0),dir=Vector(-1,-1,0)}},allegiances={['CIS']={pos=Vector(-2541,1151,-622),ang=Angle(0,0,0),dir=Vector(-1,-1,0)},['CIVILIAN']={pos=Vector(-2541,1151,-622),ang=Angle(0,0,0),dir=Vector(-1,-1,0)},['SITH']={pos=Vector(-2541,1151,-622),ang=Angle(0,0,0),dir=Vector(-1,-1,0)}},default={pos=Vector(-2541,1151,-622),ang=Angle(0,0,0),dir=Vector(-1,-1,0)}})srp.spawn.AddCustomPoint('CSR-1','ALL',{gridid='csr1',cooldown=20,permanent=true,textcolor=col.red_light,outline=col.red,map='rp_liberator_sup_training_b2'})srp.spawn.AddCustomPoint('CSR-2','ALL',{gridid='csr2',cooldown=20,permanent=true,textcolor=col.blue_light,outline=col.blue,map='rp_liberator_sup_training_b2'})srp.spawn.AddCustomPoint('ESR-1','ALL',{gridid='esr1',cooldown=20,permanent=true,textcolor=col.green_light,outline=col.green,map='rp_liberator_sup_training_b2'})srp.spawn.AddCustomPoint('ESR-2','ALL',{gridid='esr2',cooldown=20,permanent=true,textcolor=col.white,outline=col.white_dark,map='rp_liberator_sup_training_b2'})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/talents/talents_sh.lua:
local a=Material('materials/galactic/ui/talents/talent.png')srp.talents.AddTalent('FallDamage',{passive=true,name='Fall Damage Decrease',icon=Material('materials/galactic/ui/talents/falldamage.png','noclamp'),description=[[Decreases fall damage]]})srp.talents.AddTalent('PackageSpeed',{passive=true,name='Package Walk Speed',icon=Material('materials/galactic/ui/talents/packagespeed.png','noclamp'),description=[[Run faster while holding packages!]]})srp.talents.AddTalent('EpicStrength',{passive=true,name='Epic Strength',icon=Material('materials/galactic/ui/talents/strength.png','noclamp'),description=[[Do more meleee damage!]]})srp.talents.AddTalent('GrenadeThrow',{passive=true,name='Increases grenade throwing power',icon=Material('materials/galactic/ui/talents/grenade.png','smooth noclamp nomips'),description=[[Increases the power of your throw when using grenades]]})srp.talents.AddTalent('TrashRat',{passive=true,name='Trash Rat',icon=Material('materials/galactic/ui/talents/trashcan.png','noclamp'),description=[['Increased chance of finding rare items in trash cans']]})srp.talents.AddTalent('ScrapperSpeed',{passive=true,name='Scrapper Speed',icon=Material('materials/galactic/ui/talents/trashcan.png','noclamp'),description=[['Increase the speed at which you can scrap items']]})srp.talents.AddTalent('LuckyShot',{passive=true,name='Lucky Shot',icon=Material('materials/galactic/ui/talents/headshot.png','noclamp'),description=[['Increases the chance of a critical shot']]})srp.talents.AddTalent('LuckyForce',{passive=true,name='Luck of the Force',icon=Material('materials/galactic/ui/talents/chance.png','noclamp'),description=[['A chance to double dip on force power regen each tick']]})srp.talents.AddTalent('HackFailureSaver',{passive=true,name='Security Failure Recovery',icon=Material('materials/galactic/ui/talents/hackfailure.png','noclamp'),description=[[A chance to revover your security device if you fail a hack.]]})srp.talents.AddTalent('ExtraPackagePickup',{passive=true,name='Extra Package Pickup',icon=Material('materials/galactic/ui/triumphs/package.png'),description=[[Carry one more package!]]})srp.talents.AddTalent('shieldbuff',{name='Shield Buff',icon=Material('materials/galactic/ui/talents/buff.png','noclamp'),description=[[Creates a resist buff Aura. Reducing damage by %value%]]})srp.talents.AddTalent('dioxisnade',{name='Dioxis Grenade',icon=Material('materials/galactic/ui/talents/grenade.png','smooth noclamp'),description=[[Gives access to Dioxis Grenade in loadouts]]})srp.talents.AddTalent('criticaldamage',{name='Critical Damage',icon=Material('materials/galactic/ui/talents/criticalstrike.png','smooth noclamp'),description=[[Increases your critical damage by %value]]})srp.talents.AddTalent('wepdamage',{key='weapon',force=true,name='Damage',icon=Material('materials/galactic/ui/talents/damage.png','smooth noclamp'),description=[[Increase your damage by %value%.]],ApplyTalent=function(self,b,c,d)c.WepDamageBoost=d end})srp.talents.AddTalent('wepsidedamage',{key='weapon',name='Sidearm Damage',icon=Material('materials/galactic/ui/talents/damage.png','smooth noclamp'),description=[[Increase your sidearm damage by %value%.]],ApplyTalent=function(self,b,c,d)if c.Slot==2 then c.WepDamageSideBoost=d end end})srp.talents.AddTalent('criticalchance',{key='weapon',name='Critical Strike',icon=Material('materials/galactic/ui/talents/critical.png','smooth noclamp nomips'),description=[[Increases your critical chance by %value%.]],ApplyTalent=function(self,b,c,d)c.CriticalChance=d/100 end})srp.talents.AddTalent('weaponnoreadytime',{key='weapon',name='Fast Switching',icon=Material('materials/galactic/ui/talents/critical.png','smooth noclamp nomips'),description=[[Reduces the cooldown on weapon readiness when switching weapons]],ApplyTalent=function(self,b,c,d)c.DeployTime=.5 end})srp.talents.AddTalent('grenadecooldown',{name='Reduces grenade cooldown by %value%',icon=Material('materials/galactic/ui/talents/critical.png','smooth noclamp nomips'),description=[[Removes the cooldown on weapon readiness when switching weapons]]})srp.talents.AddTalent('attackspeed',{key='weapon',name='Attack Speed',icon=Material('materials/galactic/ui/talents/attackspeed.png','smooth noclamp'),description=[[Increases your attack speed by %value%.]],ApplyTalent=function(self,b,c,d,e)c:RemoveTalentPercent('FireDelay',d/100,true)end})srp.talents.AddTalent('extraatammo',{name='Double Rocket Ammo',icon=Material('materials/galactic/ui/talents/missile.png','smooth noclamp'),description=[[Doubles your rocket ammo given.]]})srp.talents.AddTalent('wepsprinting',{key='weapon',name='Weapon Sprinting',icon=Material('materials/galactic/ui/talents/wepsprint.png','smooth noclamp'),description=[[Allows you to sprint and fire your weapons]],ApplyTalent=function(self,b,c,d,e)if!c.OriginalStats||!c.OriginalStats.SprintingEnabled&&!c.SprintingEnabled then return end;d=d||1;c:AddStat('SprintingEnabled',d!=1,true)end})srp.talents.AddTalent('grenadecooldown',{key='weapon',name='Grenade Cooldown',icon=Material('materials/galactic/ui/talents/grenade.png','smooth noclamp'),description=[[Decrease grenade cooldown by %value%]],ApplyTalent=function(self,b,c,d,e)c:RemoveTalentPercent('Cooldown',d/100,true)end})srp.talents.AddTalent('grenadedouble',{key='weapon',name='Double Grenade',icon=Material('materials/galactic/ui/talents/grenade.png','smooth noclamp'),description=[[Have two grenades on hand]]})srp.talents.AddTalent('saberforcepower',{key='weapon',name='Force Power',icon=Material('materials/galactic/ui/talents/forcepower.png','smooth noclamp'),description=[[Increase force power by %value%.]],Filter=function(self,b)return table.Filter(b:GetWeapons(),function(c)return c.IsLightsaber end)end,ApplyTalent=function(self,b,c,d)c:AddTalentPercent('MaxForce',d/100,true)end})srp.talents.AddTalent('sabermeditation',{key='weapon',name='Meditation Power',icon=Material('materials/galactic/ui/talents/meditate.png','smooth noclamp'),description=[[Increase meditation to 120%.]]})srp.talents.AddTalent('saberforcerate',{key='weapon',name='Force Regeneration',icon=Material('materials/galactic/ui/talents/powerup.png','smooth noclamp'),description=[[Increase force regeneration by %value%.]],Filter=function(self,b)return table.Filter(b:GetWeapons(),function(c)return c.IsLightsaber end)end,ApplyTalent=function(self,b,c,d)c:AddTalentPercent('RegenSpeed',d/100,true)end})srp.talents.AddTalent('explosiveradius',{name='Explosive Radius',icon=Material('materials/galactic/ui/talents/explosiveradius.png','smooth noclamp'),description=[[Increase explosive radius by %value%]]})srp.talents.AddTalent('explosivedecrease',{name='Explosive Damage Decrease',icon=Material('materials/galactic/ui/talents/explosive.png','smooth noclamp'),description=[[Decrease damage taken from Explosive by 40%]]})srp.talents.AddTalent('ammoreturn',{name='Ammo Recovery',icon=Material('materials/galactic/ui/talents/ammoonkill.png','smooth noclamp'),description=[[A 10% chance to return %value ammo on kill.]]})srp.talents.AddTalent('headshotdamage',{name='Headshot Damage',icon=Material('materials/galactic/ui/talents/headshot.png','smooth noclamp'),description=[[Increases headshot damage by %value.]]})srp.talents.AddTalent('decheadshotdamage',{name='Headshot Defense',icon=Material('materials/galactic/ui/talents/helmet.png','smooth noclamp'),description=[[Decreases headshot damage by %value.]]})srp.talents.AddTalent('hponkill',{name='Health on Kill',icon=Material('materials/galactic/ui/talents/healthonkill.png','smooth noclamp'),description=[[Returns %value HP on kill.]]})srp.talents.AddTalent('rconkill',{name='Republic Credits on Kill',icon=Material('materials/galactic/ui/talents/creditsonkill.png','smooth noclamp'),description=[[Increases RC on kill by %valueRC.]]})srp.talents.AddTalent('ammoonkill',{name='Ammo on Kill',icon=Material('materials/galactic/ui/talents/ammoonkill.png','smooth noclamp'),description=[[Replenishes %value on kill.]]})srp.talents.AddTalent('healingeffects',{name='Healing Effects',icon=Material('materials/galactic/ui/talents/healingeffects.png','smooth noclamp'),description=[[Increases healing effects by %value% from all sources.]]})srp.talents.AddTalent('buildingcost',{name='Building Costs',icon=Material('materials/galactic/ui/talents/building.png','smooth noclamp'),description=[[Decreases resource costs by %value%.]]})srp.talents.AddTalent('buildingspeed',{name='Building Speed',icon=Material('materials/galactic/ui/talents/building.png','smooth noclamp'),description=[[Increase building and deconstruction speed by %value%.]]})srp.talents.AddTalent('buildinghealth',{name='Building Hit Points',icon=Material('materials/galactic/ui/talents/building.png','smooth noclamp'),description=[[Increase building hit points by %value%.]]})srp.talents.AddTalent('engineer',{name='Efficient Engineer',icon=Material('materials/galactic/ui/talents/chance.png','smooth noclamp'),description=[[Chance for extra items from collections and a chance to get free repairs.]]})srp.talents.AddTalent('weaponmoduleupgrade',{name='Weapon Module Overcharge',icon=Material('materials/galactic/ui/talents/chance.png','smooth noclamp'),description=[[Amplified weapon module!]]})srp.talents.AddTalent('health',{name='Health',icon=Material('materials/galactic/ui/talents/health.png','smooth noclamp'),description=[[Increases health points by %value%.]],ApplyTalent=function(self,b,d,e)if e then b:SetHealth(d)b:SetMaxHealth(d)else local f=b:GetPresetStats()local g=b:GetGroup()local rank=b:GetGroupRank()local h=b:GetGroupClass()local i=g&&g:GetStat('health')||f.health||200;local j=rank&&rank:GetStat('health')||0;local k=h&&h:GetStat('health')||0;local l=j>i&&j||i;l=k>l&&k||l;local m=1+d/100;local n=2*math.min(b:GetTalentLevel(),50)b:SetMaxHealth(l*m+n)b:SetHealth(l*m+n)end end})srp.talents.AddTalent('armor',{name='Armor',icon=Material('materials/galactic/ui/talents/armour.png','smooth noclamp'),description=[[Increases Armor Points by %value.]],ApplyTalent=function(self,b,d,e)if e then b:SetArmor(d)b:SetMaxArmor(d)else local f=b:GetPresetStats()local g=b:GetGroup()local rank=b:GetGroupRank()local h=b:GetGroupClass()local o=g&&g:GetStat('armor')||f.armour||0;local p=h&&h:GetStat('armor')||0;local q=rank&&rank:GetStat('armor')||0;local r=q>o&&q||o;r=p>r&&p||r;local n=math.min(b:GetTalentLevel()/2,50)b:SetArmor(r+d+n)b:SetMaxArmor(r+d+n)end end})srp.talents.AddTalent('runspeed',{name='Run Speed',icon=Material('materials/galactic/ui/talents/wepsprint.png','smooth noclamp'),description=[[Increases run speed by %value.]],ApplyTalent=function(self,b,d,e)if e then b:SetRunSpeed(d)else local g=b:GetGroup()local rank=b:GetGroupRank()local h=b:GetGroupClass()local s=h&&h:GetStat('runspeed')||g&&g:GetStat('runspeed')||rank&&rank:GetStat('runspeed')||200;b:SetRunSpeed(s+d)end end})srp.talents.AddTalent('jumpincrease',{passive=true,name='Jump Power',icon=a,description=[[Increases jump power by %value%%]]})srp.talents.AddTalent('jumppower',{name='Jump Power',icon=a,description=[[Increases jump power by %value%.]],ApplyTalent=function(self,b,d,e)if e then b:SetJumpPower(d)else local t=b:GetTalentPassive('jumpincrease')b:SetJumpPower(200*(1+t))end end})srp.talents.AddTalent('walkspeed',{name='Walk Speed',icon=a,description=[[Increases run speed by %value%.]],ApplyTalent=function(self,b,d,e)if e then b:SetWalkSpeed(d)else local g=b:GetGroup()local rank=b:GetGroupRank()local h=b:GetGroupClass()local u=h&&h:GetStat('walkspeed')||g&&g:GetStat('walkspeed')||rank&&rank:GetStat('walkspeed')||100;b:SetWalkSpeed(u)end end})srp.talents.AddTalent('scale',{name='Scale',description=[[Decreases scale points by %value%.]],ApplyTalent=function(self,b,d)local g=b:GetGroup()local rank=b:GetGroupRank()local h=b:GetGroupClass()local v=h&&h:GetStat('scale')||g&&g:GetStat('scale')||rank&&rank:GetStat('scale')||nil;if v then b:SetSize(v)end end})srp.talents.AddTalent('oxygen',{name='Oxygen',icon=a,description=[[Increases default oxygen levels by %value%.]],ApplyTalent=function(self,b,d)local g=b:GetGroup()local h=b:GetGroupClass()local w=h&&h:GetStat('oxygen')||g&&g:GetStat('oxygen')||rank&&rank:GetStat('oxygen')||50;b:SetOxygen(w)end})srp.talents.AddTalent('vehiclehealth',{key='ship',name='Vehicle Health',description=[[Increases Vehicle Health points by %value%.]],icon=Material('materials/galactic/ui/talents/vehiclehealth.png','smooth noclamp'),ApplyNow=false,ApplyTalent=function(self,b,x,d)local y=d/100;if y==0 then return end;if!x.FirstStart then x:SetHP(x:GetMaxHP()*(1+y))x.MaxHealth=x:GetHP()x.FirstStart=true end end})srp.talents.AddTalent('vehicledamagehealth',{key='ship',name='Vehicle Damage/Health',description=[[Increases Vehicle Damage and Health Points by %value%.]],icon=Material('materials/galactic/ui/talents/tank.png','smooth noclamp'),ApplyNow=false,ApplyTalent=function(self,b,x,d)local y=d/100;if y==0 then return end;if!x.FirstStart then x:SetHP(x:GetMaxHP()*(1+y))x:AddTalentPercent('WeaponDamage',y)x.FirstStart=true;return end end})srp.talents.AddTalent('vehicledamage',{key='ship',name='Vehicle Damage',description=[[Increases Vehicle Damage by %value%.]],icon=Material('materials/galactic/ui/talents/tankdamage.png','smooth noclamp'),ApplyNow=false,ApplyTalent=function(self,b,x,d)local y=d/100;x:AddTalentPercent('WeaponDamage',y)end})srp.talents.AddTalent('vehiclespeed',{key='ship',name='Vehicle Speed',description=[[Increases Vehicle Speed by %value%.]],icon=Material('materials/galactic/ui/talents/vehiclespeed.png','smooth noclamp'),ApplyNow=false,ApplyTalent=function(self,b,x,d)local y=d/100;x:AddTalentPercent('BoostSpeed',y)x:AddTalentPercent('MoveSpeed',y)end})srp.talents.AddTalent('healthperc',{name='Health Percent',icon=Material('materials/galactic/ui/talents/healthperc.png','smooth noclamp'),description=[[Increases Health Points by %value%.]]})srp.talents.AddTalent('healthregen',{name='Health Regen',icon=Material('materials/galactic/ui/talents/healthregen.png','smooth noclamp'),description=[[Gives you %value% Health Points every 5 seconds.]]})srp.talents.AddTalent('armourregen',{name='Armour Regen',icon=Material('materials/galactic/ui/talents/armour.png','smooth noclamp'),description=[[Gives you %value Armour Points every 5 seconds up to your max.]]})srp.talents.AddTalent('rmincrhealing',{name='Stimkit Healing',icon=Material('materials/galactic/ui/talents/stimkit.png','smooth noclamp'),description=[[Increases healing given by %value%]]})srp.talents.AddTalent('rmdecrrevive',{name='Revive Time',icon=Material('materials/galactic/ui/talents/revive.png','smooth noclamp'),description=[[Decreased revive time by %value seconds]]})srp.talents.AddTalent('rmincroverstim',{name='Overstim',icon=Material('materials/galactic/ui/talents/stimkit.png','smooth noclamp'),description=[[Over stim health given increased by %value%]]})srp.talents.AddTalent('jetpackfuel',{name='Jetpack Fuel',icon=Material('materials/galactic/ui/talents/fuel.png','smooth noclamp'),description=[[Increases fuel given by fuel canisters by %value]]})srp.talents.AddTalent('jetpackmissile',{name='Jetpack Missile',icon=Material('materials/galactic/ui/talents/jetpack.png','smooth noclamp'),description=[[Fire off 3 missiles by pressing the +USE button (Default: E)]]})local function z(b,h,A,B)if IsValid(b.TalentAura)then b.TalentAura:Remove()if A then return end end;timer.Simple(.1,function()if!IsValid(b)then return end;local x=ents.Create(h)x:Setup(b,Vector(),Angle(),'models/props_phx/construct/metal_dome360.mdl',B||6)x:Spawn()b.TalentAura=x end)end;srp.talents.AddTalent('aoe_rc',{name='RC Aura',description=[[Increased the runspeed and damage of nearby players]],icon=Material('materials/galactic/ui/talents/buff.png','noclamp'),ApplyTalent=function(self,b,d)z(b,'rp_aura_rc',d==0,8)end})srp.talents.AddTalent('aoe_explosion',{name='Explosion Aura',description=[[Reduces explosive damage to near by players]],icon=Material('materials/galactic/ui/talents/buff.png','noclamp'),ApplyTalent=function(self,b,d)z(b,'rp_aura_explosion',d==0,6)end})srp.talents.AddTalent('aoe_health',{name='Health Aura',description=[[Heals players near over time]],icon=Material('materials/galactic/ui/talents/buff.png','noclamp'),ApplyTalent=function(self,b,d)z(b,'rp_aura_health',d==0,6)end})srp.talents.AddTalent('aoe_armour',{name='Armour Aura',description=[[Gives armour to near by players over time]],icon=Material('materials/galactic/ui/talents/buff.png','noclamp'),ApplyTalent=function(self,b,d)z(b,'rp_aura_armour',d==0,6)end})srp.talents.AddTalent('ForceMeditation',{passive=true,name='Meditation Speed',icon=Material('wos_edit/forceicons/meditate.png','unlitgeneric'),description=[[Increases jump power by %value%%]]})srp.talents.AddTalent('ForceThrowSpeed',{passive=true,name='Saber Throw Power',icon=Material('wos_edit/forceicons/throw.png','unlitgeneric'),description=[[Increases saber throw speed by %value%%]]})srp.talents.AddTalent('ForceJumpPower',{passive=true,name='Leap Power',icon=Material('wos_edit/forceicons/leap.png','unlitgeneric'),description=[[Increases leap power by %value%%]]})srp.talents.AddTalent('ForcePullPush',{passive=true,name='Push Power',icon=Material('wos_edit/forceicons/push.png','unlitgeneric'),description=[[Increases pull/push power by %value%%]]})srp.talents.AddTalent('ForcePool',{passive=true,name='Force Pool Capacity',icon=Material('wos_edit/forceicons/lightning.png','unlitgeneric'),description=[[Increases force pool by %value%%]]})srp.talents.AddTalent('ForceHealth',{passive=true,name='Force Heal Strength',icon=Material('wos_edit/forceicons/heal.png','unlitgeneric'),description=[[Increased force heal strength by %value%%]]})srp.talents.AddTalent('ForceHealthRange',{passive=true,name='Force Group Heal Range',icon=Material('wos_edit/forceicons/heal.png','unlitgeneric'),description=[[Increased force heal range by %value%%]]})srp.talents.AddTree('default',{name='Global',global=true,color=Color(50,50,50,255),icon=Material('materials/galactic/ui/talents/battalion.png'),description=[[
		Every activity that gives XP contributes to this tree. At level 40 you may be given access to battalion specific perks.
	]],talents={{level=5,options={{talent='criticalchance',value=1.25},{talent='attackspeed',value=5},{talent='healingeffects',value=15}}},{level=10,options={{talent='ammoonkill',value=5},{talent='hponkill',value=5},{talent='rconkill',value=10}}},{level=15,options={{talent='hponkill',value=5},{talent='rconkill',value=10},{talent='ammoonkill',value=25}}},{level=20,options={{talent='criticalchance',value=1.75},{talent='attackspeed',value=10},{talent='healingeffects',value=15}}},{level=25,options={{talent='healthregen',value=.04},{talent='armor',value=25},{talent='health',value={default=20,JEDI=5,NAVAL=20}}}},{level=30,options={{talent='health',value={default=20,JEDI=5,NAVAL=20}},{talent='hponkill',value=10},{talent='wepdamage',value={default=.2,JEDI=.1}}}},{level=35,options={{talent='healthregen',value=0.06},{talent='health',value={default=25,JEDI=15}},{talent='armor',value=150}}},{level=40,battalionTalents=true,options={{cost=200,talent='aoe_explosion',value=1,battalion='NAVY'},{cost=200,talent='aoe_health',value=1,battalion='NAVY'},{cost=200,talent='aoe_armour',value=1,battalion='NAVY'},{cost=200,talent='engineer',value=1,battalion='104th'},{cost=200,talent='vehicledamagehealth',value=30,battalion='104th'},{cost=200,talent='weaponmoduleupgrade',value=1,battalion='104th'},{cost=200,talent='engineer',value=1,battalion='104WP'},{cost=200,talent='vehicledamagehealth',value=30,battalion='104WP'},{cost=200,talent='weaponmoduleupgrade',value=1,battalion='104WP'},{cost=200,talent='saberforcepower',value=15,battalion='JEDI'},{cost=200,talent='sabermeditation',value=20,battalion='JEDI'},{cost=200,talent='saberforcerate',value=250,battalion='JEDI'},{cost=200,talent='buildinghealth',value=20,battalion='327th'},{cost=200,talent='buildingcost',value=50,battalion='327th'},{cost=200,talent='health',value=15,battalion='327th'},{cost=200,talent='buildinghealth',value=20,battalion='327KC'},{cost=200,talent='buildingcost',value=50,battalion='327KC'},{cost=200,talent='health',value=15,battalion='327KC'},{cost=200,talent='vehiclehealth',value=25,battalion='32nd'},{cost=200,talent='wepsidedamage',value=.15,battalion='32nd'},{cost=200,talent='vehiclespeed',value=25,battalion='32nd'},{cost=200,talent='extraatammo',value=1,battalion='501st'},{cost=200,talent='explosiveradius',value=.2,battalion='501st'},{cost=200,talent='armor',value=50,battalion='501st'},{cost=200,talent='extraatammo',value=1,battalion='332nd'},{cost=200,talent='explosiveradius',value=.2,battalion='332nd'},{cost=200,talent='armor',value=50,battalion='332nd'},{cost=200,talent='wepsprinting',value=1,battalion='ARC'},{cost=200,talent='grenadedouble',value=1,battalion='ARC'},{cost=200,talent='runspeed',value=10,battalion='ARC'},{cost=200,talent='armourregen',value=15,battalion='RC'},{cost=200,talent='wepsprinting',value=1,battalion='RC'},{cost=200,talent='aoe_rc',value=1,battalion='RC'},{cost=200,talent='grenadecooldown',value=50,battalion='41st'},{cost=200,talent='buildingcost',value=50,battalion='41st'},{cost=200,talent='dioxisnade',value=1,battalion='41st'},{cost=200,talent='grenadecooldown',value=50,battalion='41SB'},{cost=200,talent='buildingcost',value=50,battalion='41SB'},{cost=200,talent='dioxisnade',value=1,battalion='41SB'},{cost=200,talent='runspeed',value=10,battalion='CG'},{cost=200,talent='shieldbuff',value=40,battalion='CG'},{cost=200,talent='runspeed',value=10,battalion='ORG'},{cost=200,talent='shieldbuff',value=40,battalion='ORG'},{cost=200,talent='explosivedecrease',value=1,battalion='GM'},{cost=200,talent='shieldbuff',value=40,battalion='GM'},{cost=200,talent='jetpackfuel',value=25,battalion='187th'},{cost=200,talent='jetpackfuel',value=25,battalion='187KW'},{cost=200,talent='jetpackmissile',value=25,battalion='187th'},{cost=200,talent='jetpackmissile',value=25,battalion='187KW'},{cost=200,talent='attackspeed',value=10,battalion='212th'},{cost=200,talent='weaponnoreadytime',value=1,battalion='212th'},{cost=200,talent='grenadecooldown',value=15,battalion='212th'},{cost=200,talent='attackspeed',value=10,battalion='212AB'},{cost=200,talent='weaponnoreadytime',value=1,battalion='212AB'},{cost=200,talent='grenadecooldown',value=15,battalion='212AB'}}},{level=40,classTalents=true,options={{cost=200,talent='rmdecrrevive',value=8,permission={'medic'}},{cost=200,talent='rmincrhealing',value=10,permission={'medic'}},{cost=200,talent='rmincroverstim',value=.75,permission={'medic'}}}}}})srp.talents.AddTree('agility',{name='Agility',icon=Material('materials/galactic/ui/talents/agility.png','smooth noclamp'),color=Color(25,25,25),maxlevel=40,passives={[10]={FallDamage=0.05,jumpincrease=0.1},[20]={FallDamage=0.15,PackageSpeed=0.25},[30]={jumpincrease=0.20},[35]={PackageSpeed=0.50},[40]={PackageSpeed=1}}})srp.talents.AddTree('labourer',{name='Strength',icon=Material('materials/galactic/ui/talents/strength.png','smooth noclamp'),color=Color(50,150,150),maxlevel=50,passives={[10]={EpicStrength=15},[20]={ExtraPackagePickup=1},[25]={GrenadeThrow=.05,EpicStrength=25},[35]={EpicStrength=35},[50]={GrenadeThrow=.15}}})srp.talents.AddTree('hacking',{name='Hacking & Security',icon=Material('materials/galactic/ui/talents/hacking.png','smooth noclamp'),color=Color(200,25,25),maxlevel=75,passives={[10]={HackFailureSaver=.1},[20]={HackFailureSaver=.2},[30]={HackFailureSaver=.3},[45]={HackFailureSaver=.4},[50]={HackFailureSaver=.5},[75]={HackFailureSaver=.75}}})srp.talents.AddTree('luck',{name='Lucky Prayer',icon=Material('materials/galactic/ui/talents/clover.png','smooth noclamp'),color=Color(95,138,67,226),maxlevel=55,passives={[5]={TrashRat=.05,LuckyShot=.01},[15]={TrashRat=.075,LuckyShot=.03,LuckyForce=.01},[25]={TrashRat=.1,LuckyShot=.05},[45]={LuckyForce=.03},[55]={LuckyShot=.045,LuckyForce=.045}}})srp.talents.AddTree('crafting',{name='Crafting',icon=Material('materials/galactic/ui/talents/crafting.png','smooth noclamp'),color=Color(50,50,200),maxlevel=30,passives={[10]={ScrapperSpeed=0.1},[20]={ScrapperSpeed=0.15},[30]={ScrapperSpeed=0.2}}})srp.talents.AddXPTable('forcepoints',function()local C=0;local D={}D[0]=0;for E=1,srp.talents.maxlevel do C=C+7500*E;D[#D+1]=math.floor(C/1.5)end;return D end)srp.talents.AddTree('forcepoints',{name='Force Points',xpid='forcepoints',hide=true,icon=Material('materials/galactic/ui/inventory/crystal.png','smooth noclamp'),color=Color(173,13,232,226),custompanel='srp_forcepower_tree',maxlevel=52,passives={}})srp.talents.AddTree('jediforce',{name='Force Power',icon=Material('materials/galactic/ui/inventory/crystal.png','smooth noclamp'),color=col.blue_light,maxlevel=50,addpanel='srp_forcepower_button',passives={[10]={ForcePool=.05,ForceJumpPower=.05},[20]={ForcePool=.1,ForceJumpPower=.1,ForceHealth=.20,ForceHealthRange=.05},[30]={ForcePool=.15,ForceJumpPower=.15,ForceHealth=.40,ForceHealthRange=.10,ForcePullPush=.25,ForceMeditation=.20},[40]={ForcePool=.20,ForceJumpPower=.2,ForceHealth=.80,ForceHealthRange=.15,ForcePullPush=.5,ForceMeditation=.2,ForceThrowSpeed=.2},[50]={ForcePool=.25,ForceJumpPower=.25,ForceHealth=1,ForceHealthRange=.20,ForcePullPush=.75,ForceMeditation=.30,ForceThrowSpeed=.3}}})srp.talents.AddTree('gamemaster',{name='Gamemaster',hide=true,icon=Material('materials/galactic/ui/rts/protection.png','smooth noclamp'),color=Color(119,255,29,226),maxlevel=20,passives={}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/weapons_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/cw_css_base/css_convert.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/drgbase_weapon/misc.lua:
function SWEP:ShootBullet(a,b,c)local d={}d.Num=b;d.Src=self.Owner:GetShootPos()d.Dir=self.Owner:GetAimVector()d.Spread=Vector(c,c,0)d.Tracer=1;d.Force=a/10;d.Damage=a;d.AmmoType="Pistol"d.Callback=function(e,f,g)g:SetAttacker(self.Owner)g:SetInflictor(self)end;self.Owner:FireBullets(d)self:ShootEffects()end
--addons/!lpakr_out/lua/weapons/drgbase_weapon/primary.lua:
SWEP.Primary.Damage=1;SWEP.Primary.Bullets=1;SWEP.Primary.Spread=0;SWEP.Primary.Automatic=true;SWEP.Primary.Delay=0;SWEP.Primary.Recoil=0;SWEP.Primary.Ammo="ammo_blaster"SWEP.Primary.Cost=1;SWEP.Primary.ClipSize=30;SWEP.Primary.DefaultClip=90;SWEP.Primary.Sound=""SWEP.Primary.EmptySound=""function SWEP:CanPrimaryAttack()if self:GetPrimaryAmmoType()<0 then return true end;if self.Primary.ClipSize>0 then return self.Weapon:Clip1()>=self.Primary.Cost else return self.Owner:GetAmmoCount(self.Primary.Ammo)>=self.Primary.Cost end end;function SWEP:TriedToPrimaryAttack()self:EmitSound(self.Primary.EmptySound)self:SetNextPrimaryFire(CurTime()+self.Primary.Delay)end;function SWEP:PrimaryAttack()if!self:CanPrimaryAttack()then if IsFirstTimePredicted()then self:TriedToPrimaryAttack()end;return false end;if IsFirstTimePredicted()&&self:PrePrimaryAttack()==false then return false end;if IsFirstTimePredicted()then self:FirePrimary()end;self:EmitSound(self.Primary.Sound)if IsFirstTimePredicted()then if self.Primary.Delay>=0 then local a=CurTime()+self.Primary.Delay;self:SetNextPrimaryFire(a)self:PostPrimaryAttack(a)else self:PostPrimaryAttack(CurTime())end end;return true end;function SWEP:PrePrimaryAttack()end;function SWEP:FirePrimary()self:ShootBullet(self.Primary.Damage,self.Primary.Bullets,self.Primary.Spread)end;function SWEP:PostPrimaryAttack()end
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/advdupe2.lua:
TOOL.Category="Construction"TOOL.Name="#Tool.advdupe2.name"cleanup.Register("AdvDupe2")require"controlpanel"if CLIENT then function TOOL:LeftClick(a)if a&&AdvDupe2.HeadGhost then return true end;return false end;function TOOL:RightClick(a)if self:GetOwner():KeyDown(IN_SPEED)&&!self:GetOwner():KeyDown(IN_WALK)then return false end;return true end;function TOOL:Holster()AdvDupe2.RemoveGhosts()AdvDupe2.RemoveSelectBox()if AdvDupe2.Rotation then hook.Remove("PlayerBindPress","AdvDupe2_BindPress")hook.Remove("CreateMove","AdvDupe2_MouseControl")end;return end;function TOOL:Reload(a)if a&&(AdvDupe2.HeadGhost||self:GetStage()==1)then return true end;return false end;local function b(c,d,e)if d=="invprev"then if c:GetTool("advdupe2"):GetStage()==1 then local f=math.min(tonumber(c:GetInfo("advdupe2_area_copy_size"))+25,30720)RunConsoleCommand("advdupe2_area_copy_size",f)else local g=tonumber(c:GetInfo("advdupe2_offset_z"))+5;RunConsoleCommand("advdupe2_offset_z",g)end;return true elseif d=="invnext"then if c:GetTool("advdupe2"):GetStage()==1 then local f=math.max(tonumber(c:GetInfo("advdupe2_area_copy_size"))-25,25)RunConsoleCommand("advdupe2_area_copy_size",f)else local g=tonumber(c:GetInfo("advdupe2_offset_z"))-5;RunConsoleCommand("advdupe2_offset_z",g)end;return true end;GAMEMODE:PlayerBindPress(c,d,e)end;local h=0;local i=0;local j=0;local function k(l)local m=-l:GetMouseX()/-20;local n=l:GetMouseY()/-20;local o=0;local p=0;if m!=0 then o=tonumber(LocalPlayer():GetInfo("advdupe2_offset_yaw"))if LocalPlayer():KeyDown(IN_SPEED)then h=h+m;local q=h+o;local r=math.Round(q/45)*45;if r>=225 then r=-135 elseif r<=-225 then r=135 end;if r!=j then h=0;j=r end;o=r else o=o+m;if o<-180 then o=o+360 elseif o>180 then o=o-360 end end;RunConsoleCommand("advdupe2_offset_yaw",o)end end;function TOOL:Think()if AdvDupe2.HeadGhost then AdvDupe2.UpdateGhosts()end;if LocalPlayer():KeyDown(IN_USE)then if!AdvDupe2.Rotation then hook.Add("PlayerBindPress","AdvDupe2_BindPress",b)hook.Add("CreateMove","AdvDupe2_MouseControl",k)AdvDupe2.Rotation=true end else if AdvDupe2.Rotation then AdvDupe2.Rotation=false;hook.Remove("PlayerBindPress","AdvDupe2_BindPress")hook.Remove("CreateMove","AdvDupe2_MouseControl")end;h=0;i=0;j=0;return end end;function TOOL:FreezeMovement()return AdvDupe2.Rotation end;language.Add("Tool.advdupe2.name","Advanced Duplicator 2")language.Add("Tool.advdupe2.desc","Duplicate things.")language.Add("Tool.advdupe2.0","Primary: Paste, Secondary: Copy, Secondary+World: Select/Deselect All, Secondary+Shift: Area copy.")language.Add("Tool.advdupe2.1","Primary: Paste, Secondary: Copy an area, Reload: Autosave an area, Secondary+Shift: Cancel.")language.Add("Undone.AdvDupe2","Undone AdvDupe2 paste")language.Add("Cleanup.AdvDupe2","Adv. Duplications")language.Add("Cleaned.AdvDupe2","Cleaned up all Adv. Duplications")language.Add("SBoxLimit.AdvDupe2","You've reached the Adv. Duplicator limit!")CreateClientConVar("advdupe2_offset_world",0,false,true)CreateClientConVar("advdupe2_offset_z",0,false,true)CreateClientConVar("advdupe2_offset_pitch",0,false,true)CreateClientConVar("advdupe2_offset_yaw",0,false,true)CreateClientConVar("advdupe2_offset_roll",0,false,true)CreateClientConVar("advdupe2_original_origin",0,false,true)CreateClientConVar("advdupe2_paste_constraints",0,false,true)CreateClientConVar("advdupe2_sort_constraints",1,true,true)CreateClientConVar("advdupe2_paste_parents",1,false,true)CreateClientConVar("advdupe2_paste_unfreeze",0,false,true)CreateClientConVar("advdupe2_preserve_freeze",0,false,true)CreateClientConVar("advdupe2_copy_outside",0,false,true)CreateClientConVar("advdupe2_copy_only_mine",1,false,true)CreateClientConVar("advdupe2_limit_ghost",100,false,true)CreateClientConVar("advdupe2_area_copy_size",300,false,true)CreateClientConVar("advdupe2_auto_save_contraption",0,false,true)CreateClientConVar("advdupe2_auto_save_overwrite",1,false,true)CreateClientConVar("advdupe2_auto_save_time",2,false,true)CreateClientConVar("advdupe2_contr_spawner_key",-1,false,true)CreateClientConVar("advdupe2_contr_spawner_undo_key",-1,false,true)CreateClientConVar("advdupe2_contr_spawner_delay",0,false,true)CreateClientConVar("advdupe2_contr_spawner_undo_delay",10,false,true)CreateClientConVar("advdupe2_contr_spawner_disgrav",0,false,true)CreateClientConVar("advdupe2_contr_spawner_disdrag",0,false,true)CreateClientConVar("advdupe2_contr_spawner_addvel",1,false,true)CreateClientConVar("advdupe2_contr_spawner_hideprops",0,false,true)CreateClientConVar("advdupe2_paste_disparents",0,false,true)CreateClientConVar("advdupe2_paste_protectoveride",1,false,true)CreateClientConVar("advdupe2_debug_openfile",1,false,true)local function s(t)t:ClearControls()local u=vgui.Create("advdupe2_browser")t:AddItem(u)u:SetSize(t:GetWide(),405)AdvDupe2.FileBrowser=u;local v=vgui.Create("DCheckBoxLabel")v:SetText("Paste at original position")v:SetDark(true)v:SetConVar("advdupe2_original_origin")v:SetValue(0)v:SetToolTip("Paste at the position originally copied")t:AddItem(v)v=vgui.Create("DCheckBoxLabel")v:SetText("Paste with constraints")v:SetDark(true)v:SetConVar("advdupe2_paste_constraints")v:SetValue(0)v:SetToolTip("Paste with or without constraints")t:AddItem(v)v=vgui.Create("DCheckBoxLabel")v:SetText("Paste with parenting")v:SetDark(true)v:SetConVar("advdupe2_paste_parents")v:SetValue(1)v:SetToolTip("Paste with or without parenting")t:AddItem(v)local w=vgui.Create("DCheckBoxLabel")local x=vgui.Create("DCheckBoxLabel")w:SetText("Unfreeze all after paste")w:SetDark(true)w:SetConVar("advdupe2_paste_unfreeze")w:SetValue(0)w.OnChange=function()if w:GetChecked()&&x:GetChecked()then x:SetValue(0)end end;w:SetToolTip("Unfreeze all props after pasting")t:AddItem(w)x:SetText("Preserve frozen state after paste")x:SetDark(true)x:SetConVar("advdupe2_preserve_freeze")x:SetValue(0)x.OnChange=function()if x:GetChecked()&&w:GetChecked()then w:SetValue(0)end end;x:SetToolTip("Makes props have the same frozen state as when they were copied")t:AddItem(x)v=vgui.Create("DCheckBoxLabel")v:SetText("Area copy constrained props outside of box")v:SetDark(true)v:SetConVar("advdupe2_copy_outside")v:SetValue(0)v:SetToolTip("Copy entities outside of the area copy that are constrained to entities insde")t:AddItem(v)v=vgui.Create("DCheckBoxLabel")v:SetText("World/Area copy only your own props")v:SetDark(true)v:SetConVar("advdupe2_copy_only_mine")v:SetValue(1)v:SetToolTip("Copy entities outside of the area copy that are constrained to entities insde")t:AddItem(v)v=vgui.Create("DCheckBoxLabel")v:SetText("Sort constraints by their connections")v:SetDark(true)v:SetConVar("advdupe2_sort_constraints")v:SetValue(GetConVarNumber("advdupe2_sort_constraints"))v:SetToolTip("Orders constraints so that they build a rigid constraint system.")t:AddItem(v)local y=vgui.Create("DNumSlider")y:SetText("Ghost Percentage:")y.Label:SetDark(true)y:SetMin(0)y:SetMax(100)y:SetDecimals(0)y:SetConVar("advdupe2_limit_ghost")y:SetToolTip("Change the percent of ghosts to spawn")local z=y.Slider.OnMouseReleased;y.Slider.OnMouseReleased=function(self,A)z(self,A)AdvDupe2.StartGhosting()end;local B=y.Slider.Knob.OnMouseReleased;y.Slider.Knob.OnMouseReleased=function(self,A)B(self,A)AdvDupe2.StartGhosting()end;local C=y.Wang.Panel.OnLoseFocus;y.Wang.Panel.OnLoseFocus=function(D)C(D)AdvDupe2.StartGhosting()end;t:AddItem(y)y=vgui.Create("DNumSlider")y:SetText("Area Copy Size:")y.Label:SetDark(true)y:SetMin(0)y:SetMax(30720)y:SetDecimals(0)y:SetConVar("advdupe2_area_copy_size")y:SetToolTip("Change the size of the area copy")t:AddItem(y)local E=vgui.Create("DCollapsibleCategory")t:AddItem(E)E:SetLabel("Offsets")E:SetExpanded(0)local F=u:GetParent():GetParent():GetParent():GetParent()local G=vgui.Create("DPanelList")G:SetAutoSize(true)G:SetDrawBackground(false)G:SetSpacing(1)G:SetPadding(2)G.OnMouseWheeled=function(self,H)F:OnMouseWheeled(H)end;E:SetContents(G)y=vgui.Create("DNumSlider")y:SetText("Height Offset")y.Label:SetDark(true)y:SetMin(0)y:SetMax(2500)y:SetDecimals(0)y:SetConVar("advdupe2_offset_z")y:SetToolTip("Change the Z offset of the dupe")G:AddItem(y)v=vgui.Create("DCheckBoxLabel")v:SetText("Use World Angles")v:SetDark(true)v:SetConVar("advdupe2_offset_world")v:SetValue(0)v:SetToolTip("Use world angles for the offset instead of the main entity")G:AddItem(v)y=vgui.Create("DNumSlider")y:SetText("Pitch Offset")y.Label:SetDark(true)y:SetMin(-180)y:SetMax(180)y:SetDecimals(0)y:SetConVar("advdupe2_offset_pitch")G:AddItem(y)y=vgui.Create("DNumSlider")y:SetText("Yaw Offset")y.Label:SetDark(true)y:SetMin(-180)y:SetMax(180)y:SetDecimals(0)y:SetConVar("advdupe2_offset_yaw")G:AddItem(y)y=vgui.Create("DNumSlider")y:SetText("Roll Offset")y.Label:SetDark(true)y:SetMin(-180)y:SetMax(180)y:SetDecimals(0)y:SetConVar("advdupe2_offset_roll")G:AddItem(y)local I=vgui.Create("DButton")I:SetText("Reset")I.DoClick=function()RunConsoleCommand("advdupe2_offset_z",0)RunConsoleCommand("advdupe2_offset_pitch",0)RunConsoleCommand("advdupe2_offset_yaw",0)RunConsoleCommand("advdupe2_offset_roll",0)end;G:AddItem(I)local J=vgui.Create("DCollapsibleCategory")t:AddItem(J)J:SetLabel("Dupe Information")J:SetExpanded(0)local K=vgui.Create("DPanelList")K:SetAutoSize(true)K:SetDrawBackground(false)K:SetSpacing(3)K:SetPadding(2)J:SetContents(K)K.OnMouseWheeled=function(self,H)F:OnMouseWheeled(H)end;AdvDupe2.Info={}local L=vgui.Create("DLabel")L:SetText(AdvDupe2.InfoText.File||"File: ")L:SetDark(true)K:AddItem(L)AdvDupe2.Info.File=L;L=vgui.Create("DLabel")L:SetText(AdvDupe2.InfoText.Creator||"Creator:")L:SetDark(true)K:AddItem(L)AdvDupe2.Info.Creator=L;L=vgui.Create("DLabel")L:SetText(AdvDupe2.InfoText.Date||"Date:")L:SetDark(true)K:AddItem(L)AdvDupe2.Info.Date=L;L=vgui.Create("DLabel")L:SetText(AdvDupe2.InfoText.Time||"Time:")L:SetDark(true)K:AddItem(L)AdvDupe2.Info.Time=L;L=vgui.Create("DLabel")L:SetText(AdvDupe2.InfoText.Size||"Size:")L:SetDark(true)K:AddItem(L)AdvDupe2.Info.Size=L;L=vgui.Create("DLabel")L:SetText(AdvDupe2.InfoText.Desc||"Desc:")L:SetDark(true)K:AddItem(L)AdvDupe2.Info.Desc=L;L=vgui.Create("DLabel")L:SetText(AdvDupe2.InfoText.Entities||"Entities:")L:SetDark(true)K:AddItem(L)AdvDupe2.Info.Entities=L;L=vgui.Create("DLabel")L:SetText(AdvDupe2.InfoText.Constraints||"Constraints:")L:SetDark(true)K:AddItem(L)AdvDupe2.Info.Constraints=L;local M=vgui.Create("DCollapsibleCategory")t:AddItem(M)M:SetLabel("Contraption Spawner")M:SetExpanded(0)local N=vgui.Create("DPanelList")N:SetAutoSize(true)N:SetDrawBackground(false)N:SetSpacing(3)N:SetPadding(2)M:SetContents(N)N.OnMouseWheeled=function(self,H)F:OnMouseWheeled(H)end;local O=vgui.Create("CtrlNumPad")O:SetConVar1("advdupe2_contr_spawner_key")O:SetConVar2("advdupe2_contr_spawner_undo_key")O:SetLabel1("Spawn Key")O:SetLabel2("Undo Key")N:AddItem(O)y=vgui.Create("DNumSlider")y:SetText("Spawn Delay")y.Label:SetDark(true)if game.SinglePlayer()then y:SetMin(0)else local P=tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay"))||0.2;if tonumber(LocalPlayer():GetInfo("advdupe2_contr_spawner_delay"))<P then RunConsoleCommand("advdupe2_contr_spawner_delay",tostring(P))end;y:SetMin(P)end;y:SetMax(60)y:SetDecimals(1)y:SetConVar("advdupe2_contr_spawner_delay")N:AddItem(y)y=vgui.Create("DNumSlider")y:SetText("Undo Delay")y.Label:SetDark(true)if game.SinglePlayer()then y:SetMin(0)y:SetMax(60)else local P=tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay"))||10;local Q=tonumber(GetConVarString("AdvDupe2_MaxContraptionUndoDelay"))||60;if tonumber(LocalPlayer():GetInfo("advdupe2_contr_spawner_undo_delay"))<P then RunConsoleCommand("advdupe2_contr_spawner_undo_delay",tostring(P))elseif tonumber(LocalPlayer():GetInfo("advdupe2_contr_spawner_undo_delay"))>Q then RunConsoleCommand("advdupe2_contr_spawner_undo_delay",tostring(Q))end;y:SetMin(P)y:SetMax(Q)end;y:SetDecimals(1)y:SetConVar("advdupe2_contr_spawner_undo_delay")N:AddItem(y)v=vgui.Create("DCheckBoxLabel")v:SetText("Disable gravity for all spawned props")v:SetDark(true)v:SetConVar("advdupe2_contr_spawner_disgrav")v:SetValue(0)N:AddItem(v)v=vgui.Create("DCheckBoxLabel")v:SetText("Disable drag for all spawned props")v:SetDark(true)v:SetConVar("advdupe2_contr_spawner_disdrag")v:SetValue(0)N:AddItem(v)v=vgui.Create("DCheckBoxLabel")v:SetText("Add spawner's velocity to contraption")v:SetDark(true)v:SetConVar("advdupe2_contr_spawner_addvel")v:SetValue(1)N:AddItem(v)v=vgui.Create("DCheckBoxLabel")v:SetText("Disable drawing spawner props")v:SetDark(true)v:SetConVar("advdupe2_contr_spawner_hideprops")v:SetValue(0)N:AddItem(v)local R=vgui.Create("DCollapsibleCategory")t:AddItem(R)R:SetLabel("Area Auto Save")R:SetExpanded(0)local S=vgui.Create("DPanelList")S:SetAutoSize(true)S:SetDrawBackground(false)S:SetSpacing(3)S:SetPadding(2)R:SetContents(S)S.OnMouseWheeled=function(self,H)F:OnMouseWheeled(H)end;v=vgui.Create("DCheckBoxLabel")v:SetText("Only copy contraption")v:SetDark(true)v:SetConVar("advdupe2_auto_save_contraption")v:SetValue(0)v:SetToolTip("Only copy a contraption instead of an area")S:AddItem(v)v=vgui.Create("DCheckBoxLabel")v:SetText("Overwrite File")v:SetDark(true)v:SetConVar("advdupe2_auto_save_overwrite")v:SetValue(1)v:SetToolTip("Overwrite the file instead of creating a new one everytime")S:AddItem(v)y=vgui.Create("DNumSlider")y:SetText("Minutes to Save:")y.Label:SetDark(true)y:SetMin(2)y:SetMax(30)y:SetDecimals(0)y:SetConVar("advdupe2_auto_save_time")y:SetToolTip("Interval time to save in minutes")S:AddItem(y)local T=vgui.Create("Panel")T:SetWide(t:GetWide()-40)T:SetTall(75)T:SetPos(0,50)S:AddItem(T)local U=vgui.Create("DLabel",T)U:SetText("Directory: ")U:SizeToContents()U:SetDark(true)U:SetPos(5,7)AdvDupe2.AutoSavePath=""local V=vgui.Create("DTextEntry",T)V:SetWide(T:GetWide()-100)V:SetPos(60,5)V:SetUpdateOnType(true)V.OnTextChanged=function(self)self:SetValue(AdvDupe2.AutoSavePath)end;local W=vgui.Create("DImageButton",T)local X,Y=V:GetPos()W:SetPos(X+V:GetWide()+5,7)W:SetMaterial("icon16/folder_explore.png")W:SizeToContents()W:SetToolTip("Browse")W.DoClick=function()local Z=F.VBar;Z:AnimateTo(0,1,0,0.2)u.Submit:SetMaterial("icon16/disk.png")u.Submit:SetTooltip("Directory for Area Auto Save")if u.FileName:GetValue()=="Folder_Name..."then u.FileName:SetValue("File_Name...")end;u.Desc:SetVisible(true)u.Info:SetVisible(false)u.FileName:SetVisible(true)u.FileName:SelectAllOnFocus(true)u.FileName:OnMousePressed()u.FileName:RequestFocus()u.Expanding=true;u:Slide(true)u.Submit.DoClick=function()local _=u.FileName:GetValue()if _==""||_=="File_Name..."then AdvDupe2.Notify("Name field is blank.",NOTIFY_ERROR)u.FileName:SelectAllOnFocus(true)u.FileName:OnGetFocus()u.FileName:RequestFocus()return end;local a0=u.Desc:GetValue()if a0=="Description..."then a0=""end;if!IsValid(u.Browser.pnlCanvas.m_pSelectedItem)||u.Browser.pnlCanvas.m_pSelectedItem.Derma.ClassName!="advdupe2_browser_folder"then AdvDupe2.Notify("Folder to save Area Auto Save not selected.",NOTIFY_ERROR)return end;u.AutoSaveNode=u.Browser.pnlCanvas.m_pSelectedItem;V:SetValue(u:GetFullPath(u.Browser.pnlCanvas.m_pSelectedItem).._)AdvDupe2.AutoSavePath=V:GetValue()V:SetToolTip(V:GetValue())AdvDupe2.AutoSaveDesc=a0;u:Slide(false)Z:AnimateTo(Z.CanvasSize,1,0,0.2)RunConsoleCommand("AdvDupe2_SetStage")hook.Add("HUDPaint","AdvDupe2_DrawSelectionBox",AdvDupe2.DrawSelectionBox)end;u.FileName.OnEnter=function()u.FileName:KillFocus()u.Desc:SelectAllOnFocus(true)u.Desc.OnMousePressed()u.Desc:RequestFocus()end;u.Desc.OnEnter=u.Submit.DoClick end;W=vgui.Create("DButton",T)W:SetSize(50,35)W:SetPos(T:GetWide()/4-10,30)W:SetText("Show")W.DoClick=function()if AdvDupe2.AutoSavePos then RunConsoleCommand("advdupe2_area_copy_size",AdvDupe2.AutoSaveSize)LocalPlayer():SetEyeAngles((AdvDupe2.AutoSavePos-LocalPlayer():GetShootPos()):Angle())RunConsoleCommand("AdvDupe2_SetStage")hook.Add("HUDPaint","AdvDupe2_DrawSelectionBox",AdvDupe2.DrawSelectionBox)end end;W=vgui.Create("DButton",T)W:SetSize(50,35)W:SetPos(T:GetWide()/4*3-40,30)W:SetText("Turn Off")W:SetDisabled(true)W.DoClick=function(self)RunConsoleCommand("AdvDupe2_RemoveAutoSave")self:SetDisabled(true)AdvDupe2.AutoSavePos=nil end;AdvDupe2.OffButton=W;local a1=vgui.Create("DCollapsibleCategory")t:AddItem(a1)a1:SetLabel("Experimental Section")a1:SetExpanded(0)local a2=vgui.Create("DPanelList")a2:SetAutoSize(true)a2:SetDrawBackground(false)a2:SetSpacing(3)a2:SetPadding(2)a1:SetContents(a2)a2.OnMouseWheeled=function(self,H)F:OnMouseWheeled(H)end;v=vgui.Create("DCheckBoxLabel")v:SetText("Disable parented props physics interaction")v:SetDark(true)v:SetConVar("advdupe2_paste_disparents")v:SetValue(0)a2:AddItem(v)v=vgui.Create("DCheckBoxLabel")v:SetText("Disable Dupe Spawn Protection")v:SetDark(true)v:SetConVar("advdupe2_paste_protectoveride")v:SetValue(1)v:SetToolTip("Check this if you things don't look right after pasting.")a2:AddItem(v)v=vgui.Create("DCheckBoxLabel")v:SetText("Open file after Saving")v:SetDark(true)v:SetConVar("advdupe2_debug_openfile")v:SetValue(1)v:SetToolTip("Check this if you want your files to be opened after saving them.")a2:AddItem(v)end;function TOOL.BuildCPanel(a3)a3:ClearControls()a3:AddControl("Header",{Text="Advanced Duplicator 2",Description="Duplicate stuff."})local function a4()local t=controlpanel.Get("advdupe2")if t&&t:GetWide()>16 then s(t)else timer.Simple(0.1,a4)end end;a4()end;local a5=0;local a6={r=25,g=100,b=40,a=255}local a7={r=25,g=100,b=40,a=255}local a8;surface.CreateFont("AD2Font",{font="Arial",size=40,weight=1000})surface.CreateFont("AD2TitleFont",{font="Arial",size=24,weight=1000})function TOOL:DrawToolScreen()if!AdvDupe2 then return true end;local a9="Ready"if AdvDupe2.Preview then a9="Preview"end;local a5=0;if AdvDupe2.ProgressBar.Text then a5=1;a9=AdvDupe2.ProgressBar.Text end;cam.Start2D()surface.SetDrawColor(32,32,32,255)surface.DrawRect(0,0,256,256)if a5==0 then a6={r=25,g=100,b=40,a=255}else a6={r=130,g=25,b=40,a=255}end;a8=FrameTime()*160;a7.r=math.Approach(a7.r,a6.r,a8)a7.g=math.Approach(a7.g,a6.g,a8)surface.SetDrawColor(a7)surface.DrawRect(13,13,230,230)surface.SetTextColor(255,255,255,255)draw.SimpleText("Advanced Duplicator 2","AD2TitleFont",128,50,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)draw.SimpleText(a9,"AD2Font",128,128,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)if a5!=0 then draw.RoundedBox(6,32,178,192,28,Color(255,255,255,150))draw.RoundedBox(6,36,182,188*AdvDupe2.ProgressBar.Percent/100,24,Color(0,255,0,255))elseif LocalPlayer():KeyDown(IN_USE)then draw.SimpleText("Height: "..LocalPlayer():GetInfo("advdupe2_offset_z"),"AD2TitleFont",25,160,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_BOTTOM)draw.SimpleText("Pitch: "..LocalPlayer():GetInfo("advdupe2_offset_pitch"),"AD2TitleFont",25,190,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_BOTTOM)draw.SimpleText("Yaw: "..LocalPlayer():GetInfo("advdupe2_offset_yaw"),"AD2TitleFont",25,220,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_BOTTOM)end;cam.End2D()end;local function aa(P,Q,c)local ab=ents.GetAll()local ac={}for ad,ae in pairs(ab)do local af=ae:GetPos()if af.X>=P.X&&af.X<=Q.X&&af.Y>=P.Y&&af.Y<=Q.Y&&af.Z>=P.Z&&af.Z<=Q.Z then ac[ae:EntIndex()]=ae end end;return ac end;local ag=Color(0,255,0,255)function AdvDupe2.DrawSelectionBox()local ah=util.TraceLine(util.GetPlayerTrace(LocalPlayer()))local ai=math.Clamp(tonumber(LocalPlayer():GetInfo("advdupe2_area_copy_size"))||50,0,30720)local aj=Vector(-ai,-ai,-ai)+ah.HitPos;local ak=Vector(-ai,ai,-ai)+ah.HitPos;local al=Vector(ai,ai,-ai)+ah.HitPos;local am=Vector(ai,-ai,-ai)+ah.HitPos;local an=(Vector(-ai,-ai,ai)+ah.HitPos):ToScreen()local ao=(Vector(-ai,ai,ai)+ah.HitPos):ToScreen()local ap=(Vector(ai,ai,ai)+ah.HitPos):ToScreen()local aq=(Vector(ai,-ai,ai)+ah.HitPos):ToScreen()if!AdvDupe2.LastUpdate||CurTime()>=AdvDupe2.LastUpdate then if AdvDupe2.ColorEntities then for ar,as in pairs(AdvDupe2.EntityColors)do local ae=AdvDupe2.ColorEntities[ar]if IsValid(ae)then AdvDupe2.ColorEntities[ar]:SetColor(as)end end end;local ab=aa(aj,Vector(ai,ai,ai)+ah.HitPos,LocalPlayer())AdvDupe2.ColorEntities=ab;AdvDupe2.EntityColors={}for ar,as in pairs(ab)do AdvDupe2.EntityColors[ar]=as:GetColor()as:SetColor(ag)end;AdvDupe2.LastUpdate=CurTime()+0.25 end;local at={}at.mask=MASK_NPCWORLDSTATIC;local au;at.start=aj+Vector(0,0,ai*2)at.endpos=aj;au=util.TraceLine(at)aj=au.HitPos:ToScreen()at.start=ak+Vector(0,0,ai*2)at.endpos=ak;au=util.TraceLine(at)ak=au.HitPos:ToScreen()at.start=al+Vector(0,0,ai*2)at.endpos=al;au=util.TraceLine(at)al=au.HitPos:ToScreen()at.start=am+Vector(0,0,ai*2)at.endpos=am;au=util.TraceLine(at)am=au.HitPos:ToScreen()surface.SetDrawColor(0,255,0,255)surface.DrawLine(aj.x,aj.y,an.x,an.y)surface.DrawLine(ak.x,ak.y,ao.x,ao.y)surface.DrawLine(al.x,al.y,ap.x,ap.y)surface.DrawLine(am.x,am.y,aq.x,aq.y)surface.DrawLine(aj.x,aj.y,ak.x,ak.y)surface.DrawLine(ak.x,ak.y,al.x,al.y)surface.DrawLine(al.x,al.y,am.x,am.y)surface.DrawLine(am.x,am.y,aj.x,aj.y)surface.DrawLine(an.x,an.y,ao.x,ao.y)surface.DrawLine(ao.x,ao.y,ap.x,ap.y)surface.DrawLine(ap.x,ap.y,aq.x,aq.y)surface.DrawLine(aq.x,aq.y,an.x,an.y)end;net.Receive("AdvDupe2_DrawSelectBox",function()hook.Add("HUDPaint","AdvDupe2_DrawSelectionBox",AdvDupe2.DrawSelectionBox)end)function AdvDupe2.RemoveSelectBox()hook.Remove("HUDPaint","AdvDupe2_DrawSelectionBox")if AdvDupe2.ColorEntities then for ar,as in pairs(AdvDupe2.EntityColors)do if!IsValid(AdvDupe2.ColorEntities[ar])then AdvDupe2.ColorEntities[ar]=nil else AdvDupe2.ColorEntities[ar]:SetColor(as)end end;AdvDupe2.ColorEntities={}AdvDupe2.EntityColors={}end end;net.Receive("AdvDupe2_RemoveSelectBox",function()AdvDupe2.RemoveSelectBox()end)function AdvDupe2.InitProgressBar(U)AdvDupe2.ProgressBar={}AdvDupe2.ProgressBar.Text=U;AdvDupe2.ProgressBar.Percent=0;AdvDupe2.BusyBar=true end;net.Receive("AdvDupe2_InitProgressBar",function()AdvDupe2.InitProgressBar(net.ReadString())end)net.Receive("AdvDupe2_UpdateProgressBar",function()AdvDupe2.ProgressBar.Percent=net.ReadFloat()end)function AdvDupe2.RemoveProgressBar()AdvDupe2.ProgressBar={}AdvDupe2.BusyBar=false;if AdvDupe2.Ghosting then AdvDupe2.InitProgressBar("Ghosting: ")AdvDupe2.BusyBar=false;AdvDupe2.ProgressBar.Percent=AdvDupe2.CurrentGhost/AdvDupe2.TotalGhosts*100 end end;net.Receive("AdvDupe2_RemoveProgressBar",function()AdvDupe2.RemoveProgressBar()end)net.Receive("AdvDupe2_ResetOffsets",function()RunConsoleCommand("advdupe2_original_origin","0")RunConsoleCommand("advdupe2_paste_constraints","1")RunConsoleCommand("advdupe2_offset_z","0")RunConsoleCommand("advdupe2_offset_pitch","0")RunConsoleCommand("advdupe2_offset_yaw","0")RunConsoleCommand("advdupe2_offset_roll","0")RunConsoleCommand("advdupe2_paste_parents","1")RunConsoleCommand("advdupe2_paste_disparents","0")end)net.Receive("AdvDupe2_ReportModel",function()print("Advanced Duplicator 2: Invalid Model: "..net.ReadString())end)net.Receive("AdvDupe2_ReportClass",function()print("Advanced Duplicator 2: Invalid Class: "..net.ReadString())end)net.Receive("AdvDupe2_ResetDupeInfo",function()if!AdvDupe2.Info then return end;AdvDupe2.Info.File:SetText("File:")AdvDupe2.Info.Creator:SetText("Creator:")AdvDupe2.Info.Date:SetText("Date:")AdvDupe2.Info.Time:SetText("Time:")AdvDupe2.Info.Size:SetText("Size:")AdvDupe2.Info.Desc:SetText("Desc:")AdvDupe2.Info.Entities:SetText("Entities:")AdvDupe2.Info.Constraints:SetText("Constraints:")end)net.Receive("AdvDupe2_CanAutoSave",function()if AdvDupe2.AutoSavePath!=""then AdvDupe2.AutoSavePos=net.ReadVector()AdvDupe2.AutoSaveSize=net.ReadFloat()local ae=net.ReadUInt(16)AdvDupe2.OffButton:SetDisabled(false)net.Start("AdvDupe2_CanAutoSave")net.WriteString(AdvDupe2.AutoSaveDesc)net.WriteInt(ae,16)if game.SinglePlayer()then net.WriteString(string.sub(AdvDupe2.AutoSavePath,10,#AdvDupe2.AutoSavePath))end;net.SendToServer()else AdvDupe2.Notify("Select a directory for the Area Auto Save.",NOTIFY_ERROR)end end)net.Receive("AdvDupe2_SetDupeInfo",function(av,c,aw)if AdvDupe2.Info then AdvDupe2.Info.File:SetText("File: "..net.ReadString())AdvDupe2.Info.Creator:SetText("Creator: "..net.ReadString())AdvDupe2.Info.Date:SetText("Date: "..net.ReadString())AdvDupe2.Info.Time:SetText("Time: "..net.ReadString())AdvDupe2.Info.Size:SetText("Size: "..net.ReadString())AdvDupe2.Info.Desc:SetText("Desc: "..net.ReadString())AdvDupe2.Info.Entities:SetText("Entities: "..net.ReadString())AdvDupe2.Info.Constraints:SetText("Constraints: "..net.ReadString())else AdvDupe2.InfoText.File="File: "..net.ReadString()AdvDupe2.InfoText.Creator="Creator: "..net.ReadString()AdvDupe2.InfoText.Date="Date: "..net.ReadString()AdvDupe2.InfoText.Time="Time: "..net.ReadString()AdvDupe2.InfoText.Size="Size: "..net.ReadString()AdvDupe2.InfoText.Desc="Desc: "..net.ReadString()AdvDupe2.InfoText.Entities="Entities: "..net.ReadString()AdvDupe2.InfoText.Constraints="Constraints: "..net.ReadString()end end)end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/creator.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/drgbase_tool_notarget.lua:
TOOL.Tab="DrGBase"TOOL.Category="Tools"TOOL.Name="#tool.drgbase_tool_notarget.name"TOOL.BuildCPanel=function(a)a:Help("#tool.drgbase_tool_notarget.desc")a:Help("#tool.drgbase_tool_notarget.0")end;function TOOL:LeftClick(b)if!IsValid(b.Entity)then return false end;if!b.Entity.IsDrGNextbot then return false end;if CLIENT then return true end;local c=self:GetOwner()b.Entity:SetIgnored(c,!b.Entity:IsIgnored(c))return true end;if CLIENT then language.Add("tool.drgbase_tool_notarget.name","Set Notarget")language.Add("tool.drgbase_tool_notarget.desc","Disable/enable notarget for a nextbot.")language.Add("tool.drgbase_tool_notarget.0","Left click to toggle notarget. (Green => Enabled / Red => Disabled)")end
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/drgbase_tool_relationship_simple.lua:
TOOL.Tab="DrGBase"TOOL.Category="Tools"TOOL.Name="#tool.drgbase_tool_relationship_simple.name"TOOL.ClientConVar={["disposition"]=1,["bothways"]=0}TOOL.BuildCPanel=function(a)a:Help("#tool.drgbase_tool_relationship_simple.desc")a:Help("#tool.drgbase_tool_relationship_simple.0")a:ControlHelp("\nOptions\n")local b=a:ComboBox("Relationship","drgbase_tool_relationship_simple_disposition")b:AddChoice("Like",3)b:AddChoice("Hate",1)b:AddChoice("Fear",2)b:AddChoice("Ignore",4)a:CheckBox("Both ways","drgbase_tool_relationship_simple_bothways")a:Help("If both ways, it will set the same relationship on the other entity.")end;function TOOL:LeftClick(c)if!IsValid(c.Entity)then return false end;if!c.Entity.IsDrGNextbot&&!c.Entity:IsNPC()then return false end;if CLIENT then return true end;self:GetOwner():DrG_CleverEntitySelect(c.Entity)return true end;function TOOL:RightClick(c)if!IsValid(c.Entity)&&!c.Entity:IsWorld()then return false end;if CLIENT then return true end;if c.Entity:IsWorld()then c.Entity=self:GetOwner()end;local d=self:GetClientNumber("disposition")if self:GetOwner():KeyDown(IN_SPEED)then for e in self:GetOwner():DrG_SelectedEntities()do for f in self:GetOwner():DrG_SelectedEntities()do if e==f then continue end;if e.IsDrGNextbot then e:_SetRelationship(f,d)elseif e:IsNPC()then e:DrG_SetRelationship(f,d)end end end else for e in self:GetOwner():DrG_SelectedEntities()do if e.IsDrGNextbot then e:_SetRelationship(c.Entity,d)elseif e:IsNPC()then e:DrG_SetRelationship(c.Entity,d)end end end;return true end;function TOOL:Reload(c)if CLIENT then return true end;self:GetOwner():DrG_ClearSelectedEntities()return true end;if CLIENT then language.Add("tool.drgbase_tool_relationship_simple.name","Set Relationship")language.Add("tool.drgbase_tool_relationship_simple.desc","Change relationship of a nextbot towards an entity.")language.Add("tool.drgbase_tool_relationship_simple.0","Left click to select/deselect a nextbot/NPC (hold shift to select multiple entities), right click to set the relationship towards an entity (aim at the ground to set the relationship towards yourself) and reload to clear the list of selected entities.")end
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/fireworks.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/keypad.lua:
TOOL.Category="Roleplay"TOOL.Name="Keypad"TOOL.Command=nil;TOOL.ClientConVar['weld']='1'TOOL.ClientConVar['freeze']='1'TOOL.ClientConVar['password']=''TOOL.ClientConVar['secure']='0'TOOL.ClientConVar['repeats_granted']='0'TOOL.ClientConVar['repeats_denied']='0'TOOL.ClientConVar['length_granted']='4'TOOL.ClientConVar['length_denied']='0.1'TOOL.ClientConVar['delay_granted']='0'TOOL.ClientConVar['delay_denied']='0'TOOL.ClientConVar['init_delay_granted']='0'TOOL.ClientConVar['init_delay_denied']='0'TOOL.ClientConVar['key_granted']='0'TOOL.ClientConVar['key_denied']='0'cleanup.Register("keypads")if CLIENT then language.Add("tool.keypad.name","Keypad")language.Add("tool.keypad.0","Left Click: Create, Right Click: Update")language.Add("tool.keypad.desc","Creates Keypads for secure access")language.Add("Undone_Keypad","Undone Keypad")language.Add("Cleanup_keypads","Keypads")language.Add("Cleaned_keypads","Cleaned up all Keypads")language.Add("SBoxLimit_keypads","You've hit the Keypad limit!")end;function TOOL:SetupKeypad(a,b)local c={Owner=self:GetOwner(),Password=b,Granted={Num=self:GetClientNumber("key_granted"),Hold=math.Clamp(self:GetClientNumber("length_granted"),4,10),Delay=self:GetClientNumber("init_delay_granted"),Reps=self:GetClientNumber("repeats_granted"),DelayBetween=math.Clamp(self:GetClientNumber("delay_granted"),4,10)},Denied={Num=self:GetClientNumber("key_denied"),Hold=self:GetClientNumber("length_denied"),Delay=self:GetClientNumber("init_delay_denied"),Reps=self:GetClientNumber("repeats_denied"),DelayBetween=self:GetClientNumber("delay_denied")}}a:SetData(c)end;function TOOL:RightClick(d)if IsValid(d.Entity)&&d.Entity:GetClass()!="keypad"then return false end;if CLIENT then return true end;local e=self:GetOwner()local f=tostring(tonumber(e:GetInfo("keypad_password")))local g=d.HitPos;local h=d.Entity;if f==nil||#f>4||string.find(f,"0")then srp.notif.Warning(e,term.Get('InvalidPassword'))return false end;if h:GetClass()=="keypad"&&h.Data.Owner==e then self:SetupKeypad(h,f)return true end end;function TOOL:LeftClick(d)if IsValid(d.Entity)&&d.Entity:GetClass()=="player"then return false end;if CLIENT then return true end;local e=self:GetOwner()local f=tostring(tonumber(e:GetInfo("keypad_password")))local h=d.Entity;if f==nil||#f>4||string.find(f,"0")then srp.notif.Warning(e,term.Get('InvalidPassword'))return false end;if!self:GetWeapon():CheckLimit("keypads")then return false end;local i=self:GetOwner()local a=ents.Create("keypad")a:SetPos(d.HitPos)a:SetAngles(d.HitNormal:Angle())a:Spawn()a:SetAngles(d.HitNormal:Angle())a:Activate()a:SetPropOwner(i)self:SetupKeypad(a,f)undo.Create("Keypad")a:Prepare(d.Entity,d.PhysicsBone)undo.AddEntity(a)undo.SetPlayer(e)undo.Finish()e:AddCount("keypads",a)e:AddCleanup("keypads",a)return true end;if CLIENT then local function j(e)e:ConCommand("keypad_repeats_granted 0")e:ConCommand("keypad_repeats_denied 0")e:ConCommand("keypad_length_granted 4")e:ConCommand("keypad_length_denied 0.1")e:ConCommand("keypad_delay_granted 0")e:ConCommand("keypad_delay_denied 0")e:ConCommand("keypad_init_delay_granted 0")e:ConCommand("keypad_init_delay_denied 0")end;concommand.Add("keypad_reset",j)function TOOL.BuildCPanel(k)local l,m=k:TextEntry("4 Digit Password","keypad_password")l:SetTall(22)k:ControlHelp("Allowed Digits: 1-9")k:CheckBox("Secure Mode","keypad_secure")k:CheckBox("Weld and Freeze","keypad_weld")k:CheckBox("Freeze","keypad_freeze")local n=vgui.Create("CtrlNumPad",k)n:SetConVar1("keypad_key_granted")n:SetConVar2("keypad_key_denied")n:SetLabel1("Access Granted")n:SetLabel2("Access Denied")k:AddPanel(n)k:Button("Reset Settings","keypad_reset")k:Help("")k:Help("Settings when access granted")k:NumSlider("Hold Length","keypad_length_granted",4,10,2)k:NumSlider("Initial Delay","keypad_init_delay_granted",0,10,2)k:NumSlider("Multiple Press Delay","keypad_delay_granted",0,10,2)k:NumSlider("Additional Repeats","keypad_repeats_granted",0,5,0)k:Help("")k:Help("Settings when access denied")k:NumSlider("Hold Length","keypad_length_denied",0.1,10,2)k:NumSlider("Initial Delay","keypad_init_delay_denied",0,10,2)k:NumSlider("Multiple Press Delay","keypad_delay_denied",0,10,2)k:NumSlider("Additional Repeats","keypad_repeats_denied",0,5,0)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/lamp.lua:
TOOL.Category="Render"TOOL.Name="#tool.lamp.name"local a="models/lamps/torch.mdl"TOOL.ClientConVar["r"]="255"TOOL.ClientConVar["g"]="255"TOOL.ClientConVar["b"]="255"TOOL.ClientConVar["key"]="-1"TOOL.ClientConVar["fov"]="90"TOOL.ClientConVar["distance"]="1024"TOOL.ClientConVar["brightness"]="4"TOOL.ClientConVar["texture"]="effects/flashlight001"TOOL.ClientConVar["model"]=a;TOOL.ClientConVar["toggle"]="1"TOOL.Information={{name="left"},{name="right"}}cleanup.Register("lamps")local function b(c)if util.IsValidRagdoll(c)then return a else return util.ValidModel(c)&&c||a end end;function TOOL:LeftClick(d)if IsValid(d.Entity)&&d.Entity:IsPlayer()then return false end;if CLIENT then return true end;local e=self:GetOwner()local f=d.HitPos;local g=math.Clamp(self:GetClientNumber("r"),0,255)local h=math.Clamp(self:GetClientNumber("g"),0,255)local i=math.Clamp(self:GetClientNumber("b"),0,255)local j=self:GetClientNumber("key")local k=self:GetClientInfo("texture")local c=self:GetClientInfo("model")local l=self:GetClientNumber("fov")local m=self:GetClientNumber("distance")local n=self:GetClientNumber("brightness")local o=self:GetClientNumber("toggle")!=1;local p=Material(k)local k=p:GetString("$basetexture")if IsValid(d.Entity)&&d.Entity:GetClass()=="gmod_lamp"&&d.Entity:GetPlayer()==e then d.Entity:SetColor(Color(g,h,i,255))d.Entity:SetFlashlightTexture(k)d.Entity:SetLightFOV(l)d.Entity:SetDistance(m)d.Entity:SetBrightness(n)d.Entity:SetToggle(!o)d.Entity:UpdateLight()numpad.Remove(d.Entity.NumDown)numpad.Remove(d.Entity.NumUp)d.Entity.NumDown=numpad.OnDown(e,j,"LampToggle",d.Entity,1)d.Entity.NumUp=numpad.OnUp(e,j,"LampToggle",d.Entity,0)d.Entity.Texture=k;d.Entity.fov=l;d.Entity.distance=m;d.Entity.r=g;d.Entity.g=h;d.Entity.b=i;d.Entity.brightness=n;d.Entity.KeyDown=j;return true end;if!self:GetSWEP():CheckLimit("lamps")then return false end;local q=MakeLamp(e,g,h,i,j,o,k,c,l,m,n,!o,{Pos=f,Angle=Angle(0,0,0)})local r=q:GetPos()local s=q:NearestPoint(r-d.HitNormal*512)local t=r-s;q:SetPos(d.HitPos+t)undo.Create("Lamp")undo.AddEntity(q)undo.SetPlayer(self:GetOwner())undo.Finish()return true end;function TOOL:RightClick(d)if!IsValid(d.Entity)||d.Entity:GetClass()!="gmod_lamp"then return false end;if CLIENT then return true end;local u=d.Entity;local v=self:GetOwner()v:ConCommand("lamp_fov "..u:GetLightFOV())v:ConCommand("lamp_distance "..u:GetDistance())v:ConCommand("lamp_brightness "..u:GetBrightness())v:ConCommand("lamp_texture "..u:GetFlashlightTexture())if u:GetToggle()then v:ConCommand("lamp_toggle 1")else v:ConCommand("lamp_toggle 0")end;local w=u:GetColor()v:ConCommand("lamp_r "..w.r)v:ConCommand("lamp_g "..w.g)v:ConCommand("lamp_b "..w.b)return true end;function TOOL:UpdateGhostLamp(u,x)if!IsValid(u)then return end;local y=util.GetPlayerTrace(x)local d=util.TraceLine(y)if!d.Hit then return end;if d.Entity:IsPlayer()||d.Entity:GetClass()=="gmod_lamp"then u:SetNoDraw(true)return end;local r=u:GetPos()local s=u:NearestPoint(r-d.HitNormal*512)local t=r-s;u:SetPos(d.HitPos+t)u:SetNoDraw(false)end;function TOOL:Think()if!IsValid(self.GhostEntity)||self.GhostEntity:GetModel()!=self:GetClientInfo("model")then self:MakeGhostEntity(self:GetClientInfo("model"),Vector(0,0,0),Angle(0,0,0))end;self:UpdateGhostLamp(self.GhostEntity,self:GetOwner())end;local z=TOOL:BuildConVarList()function TOOL.BuildCPanel(A)A:AddControl("Header",{Description="#tool.lamp.desc"})A:AddControl("ComboBox",{MenuButton=1,Folder="lamp",Options={["#preset.default"]=z},CVars=table.GetKeys(z)})A:AddControl("Numpad",{Label="#tool.lamp.key",Command="lamp_key"})A:AddControl("Slider",{Label="#tool.lamp.fov",Command="lamp_fov",Type="Float",Min=10,Max=170})A:AddControl("Slider",{Label="#tool.lamp.distance",Command="lamp_distance",Min=64,Max=2048})A:AddControl("Slider",{Label="#tool.lamp.brightness",Command="lamp_brightness",Type="Float",Min=0,Max=8})A:AddControl("Checkbox",{Label="#tool.lamp.toggle",Command="lamp_toggle"})local B=A:MatSelect("lamp_texture",nil,true,0.33,0.33)for C,D in pairs(list.Get("LampTextures"))do B:AddMaterial(D.Name||C,C)end;A:AddControl("Color",{Label="#tool.lamp.color",Red="lamp_r",Green="lamp_g",Blue="lamp_b"})A:AddControl("PropSelect",{Label="#tool.lamp.model",ConVar="lamp_model",Height=3,Models=list.Get("LampModels")})end;list.Set("LampTextures","effects/flashlight001",{Name="#lamptexture.default"})list.Set("LampTextures","effects/flashlight/slit",{Name="#lamptexture.slit"})list.Set("LampTextures","effects/flashlight/circles",{Name="#lamptexture.circles"})list.Set("LampTextures","effects/flashlight/window",{Name="#lamptexture.window"})list.Set("LampTextures","effects/flashlight/logo",{Name="#lamptexture.logo"})list.Set("LampTextures","effects/flashlight/gradient",{Name="#lamptexture.gradient"})list.Set("LampTextures","effects/flashlight/bars",{Name="#lamptexture.bars"})list.Set("LampTextures","effects/flashlight/tech",{Name="#lamptexture.techdemo"})list.Set("LampTextures","effects/flashlight/soft",{Name="#lamptexture.soft"})list.Set("LampTextures","effects/flashlight/hard",{Name="#lamptexture.hard"})list.Set("LampTextures","effects/flashlight/caustics",{Name="#lamptexture.caustics"})list.Set("LampTextures","effects/flashlight/square",{Name="#lamptexture.square"})list.Set("LampTextures","effects/flashlight/camera",{Name="#lamptexture.camera"})list.Set("LampTextures","effects/flashlight/view",{Name="#lamptexture.view"})list.Set("LampModels","models/lamps/torch.mdl",{})list.Set("LampModels","models/maxofs2d/lamp_flashlight.mdl",{})list.Set("LampModels","models/maxofs2d/lamp_projector.mdl",{})
--addons/ssrp_lfs/lua/weapons/gmod_tool/stools/lvsaienabler.lua:

TOOL.Category		= "LVS"
TOOL.Name			= "#AI Enabler"
TOOL.Command		= nil
TOOL.ConfigName		= ""

if CLIENT then
	language.Add( "tool.lvsaienabler.name", "AI Enabler" )
	language.Add( "tool.lvsaienabler.desc", "A tool used to enable/disable AI on LVS-Vehicles" )
	language.Add( "tool.lvsaienabler.0", "Left click on a LVS-Vehicle to enable AI, Right click to disable." )
	language.Add( "tool.lvsaienabler.1", "Left click on a LVS-Vehicle to enable AI, Right click to disable." )
end

function TOOL:LeftClick( trace )
	local ent = trace.Entity

	if not IsValid( ent ) then return false end

	if not ent.LVS and not ent.LFS then return end

	if isfunction( ent.SetAI ) then
		ent:SetAI( true )
	end

	return true
end

function TOOL:RightClick( trace )
	local ent = trace.Entity

	if not IsValid( ent ) then return false end

	if not ent.LVS and not ent.LFS then return end

	if isfunction( ent.SetAI ) then
		ent:SetAI( false )
	end

	return true
end

function TOOL:Reload( trace )
	return false
end

--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/nocollide.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/nocollide_world.lua:
TOOL.Category='Construction'TOOL.Name='#tool.nocollide_world.name'if CLIENT then language.Add('tool.nocollide_world.name','No Collide - World')language.Add('tool.nocollide_world.desc','Make a prop not collide with the world')language.Add('tool.nocollide_world.0','Left click on a prop to remove world collisions, right click to re-add them.')end;cleanup.Register'NoCollideWorld'local a;local b;local c;function TOOL:LeftClick(d)if!IsValid(d.Entity)||!d.Entity:IsProp()then return false end;if CLIENT then return true end;local e=c(d.Entity)if e then self:GetOwner():Notify(NOTIFY_GENERIC,term.Get('NoCollidedWorld'))d.Entity.OnPhysgunDrop=a end;return e!=false end;TOOL.RightClick=b;TOOL.Reload=b;function TOOL.BuildCPanel(f)f:AddControl('Header',{Description='#tool.nocollide_world.desc'})end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/paint.lua:
TOOL.Category="Render"TOOL.Name="#tool.paint.name"TOOL.LeftClickAutomatic=true;TOOL.RightClickAutomatic=true;TOOL.RequiresTraceHit=true;TOOL.ClientConVar["decal"]="Blood"TOOL.Information={{name="left"},{name="right"},{name="reload"}}local function a(b,c,d)if!IsValid(c)&&!c:IsWorld()then return end;if CLIENT then return end;local e;if d.bone&&d.bone<c:GetPhysicsObjectCount()then e=c:GetPhysicsObjectNum(d.bone)end;if!IsValid(e)then e=c:GetPhysicsObject()end;if!IsValid(e)then e=c end;util.Decal(d.decal,e:LocalToWorld(d.Pos1),e:LocalToWorld(d.Pos2),b)end;function TOOL:Reload(f)if!IsValid(f.Entity)then return false end;f.Entity:RemoveAllDecals()return true end;function TOOL:LeftClick(f)return self:RightClick(f,true)end;function TOOL:RightClick(f,g)self:GetSWEP():EmitSound("SprayCan.Paint")local h=self:GetClientInfo("decal")local i=f.HitPos+f.HitNormal;local j=f.HitPos-f.HitNormal;local k;if f.PhysicsBone&&f.PhysicsBone<f.Entity:GetPhysicsObjectCount()then k=f.Entity:GetPhysicsObjectNum(f.PhysicsBone)end;if!IsValid(k)then k=f.Entity:GetPhysicsObject()end;if!IsValid(k)then k=f.Entity end;i=k:WorldToLocal(i)j=k:WorldToLocal(j)a(self:GetOwner(),f.Entity,{Pos1=i,Pos2=j,bone=f.PhysicsBone,decal=h})if g then self:GetWeapon():SetNextPrimaryFire(CurTime()+0.5)self:GetWeapon():SetNextSecondaryFire(CurTime()+0.5)else self:GetWeapon():SetNextPrimaryFire(CurTime()+1)self:GetWeapon():SetNextSecondaryFire(CurTime()+1)end;return false end;game.AddDecal("Eye","decals/eye")game.AddDecal("Dark","decals/dark")game.AddDecal("Smile","decals/smile")game.AddDecal("Light","decals/light")game.AddDecal("Cross","decals/cross")game.AddDecal("Nought","decals/nought")game.AddDecal("Noughtsncrosses","decals/noughtsncrosses")list.Add("PaintMaterials","Eye")list.Add("PaintMaterials","Smile")list.Add("PaintMaterials","Light")list.Add("PaintMaterials","Dark")list.Add("PaintMaterials","Blood")list.Add("PaintMaterials","YellowBlood")list.Add("PaintMaterials","Impact.Metal")list.Add("PaintMaterials","Scorch")list.Add("PaintMaterials","BeerSplash")list.Add("PaintMaterials","ExplosiveGunshot")list.Add("PaintMaterials","BirdPoop")list.Add("PaintMaterials","PaintSplatPink")list.Add("PaintMaterials","PaintSplatGreen")list.Add("PaintMaterials","PaintSplatBlue")list.Add("PaintMaterials","ManhackCut")list.Add("PaintMaterials","FadingScorch")list.Add("PaintMaterials","Antlion.Splat")list.Add("PaintMaterials","Splash.Large")list.Add("PaintMaterials","BulletProof")list.Add("PaintMaterials","GlassBreak")list.Add("PaintMaterials","Impact.Sand")list.Add("PaintMaterials","Impact.BloodyFlesh")list.Add("PaintMaterials","Impact.Antlion")list.Add("PaintMaterials","Impact.Glass")list.Add("PaintMaterials","Impact.Wood")list.Add("PaintMaterials","Impact.Concrete")list.Add("PaintMaterials","Noughtsncrosses")list.Add("PaintMaterials","Nought")list.Add("PaintMaterials","Cross")function TOOL.BuildCPanel(l)local m={}for n,o in pairs(list.Get("PaintMaterials"))do if!table.HasValue(m,o)then table.insert(m,o)end end;table.sort(m)local p=l:AddControl("ListBox",{Label="#tool.paint.texture",Height=17+table.Count(m)*17})for q,h in pairs(m)do local r=p:AddLine(h)r.data={paint_decal=h}if GetConVarString("paint_decal")==tostring(h)then r:SetSelected(true)end end end
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/particlecontrol.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/rb655_easy_animation.lua:
TOOL.Category="Robotboy655"TOOL.Name="#tool.rb655_easy_animation.name"TOOL.AnimationArray={}local a=NULL;TOOL.SelecetedEntity=NULL;TOOL.ClientConVar["anim"]=""TOOL.ClientConVar["speed"]="1.0"TOOL.ClientConVar["delay"]="0"TOOL.ClientConVar["nohide"]="0"TOOL.ClientConVar["loop"]="0"TOOL.ClientConVar["noglow"]="0"local function b(c)local d={}for e,f in pairs(string.Explode("_",string.Replace(c," ","_")))do if string.len(f)==0 then continue end;if string.len(f)==1 then table.insert(d,string.upper(f))continue end;table.insert(d,string.upper(string.Left(f,1))..string.Right(f,string.len(f)-1))end;return string.Implode(" ",d)end;local function g(h)if!IsValid(h)||h:IsWorld()then return false end;if table.Count(h:GetSequenceList()||{})!=0 then return true end;return false end;local function i(h,j,k)if!IsValid(h)then return end;if h:GetClass()=="prop_dynamic"then h:Fire("SetAnimation",j)h:Fire("SetPlaybackRate",math.Clamp(tonumber(k),0.05,3.05))return end;h:ResetSequence(h:LookupSequence(j))h:ResetSequenceInfo()h:SetCycle(0)h:SetPlaybackRate(math.Clamp(tonumber(k),0.05,3.05))end;local l=0;function PlayAnimation(m,h,j,k,n,o,p)if!IsValid(h)then return end;n=tonumber(n)||0;o=tobool(o)||false;l=l+1;local q="rb655_animation_loop_"..m:UniqueID().."-"..l;if p then q="rb655_animation_loop_preview"..m:UniqueID()end;timer.Create(q,n,1,function()i(h,j,k)if o==true&&IsValid(h)then timer.Adjust(q,h:SequenceDuration()/k,0,function()if!IsValid(h)then timer.Remove(q)return end;i(h,j,k)end)end end)end;function TOOL:GetSelecetedEntity()return self:GetWeapon():GetNWEntity(1,self.SelecetedEntity)end;function TOOL:SetSelecetedEntity(h)if IsValid(h)&&h:GetClass()=="prop_effect"then h=h.AttachedEntity end;if!IsValid(h)then h=NULL end;if self:GetSelecetedEntity()==h then return end;self.SelecetedEntity=h;self:GetWeapon():SetNWEntity(1,h)end;local r=GetConVarNumber("ai_disabled")local s=GetConVarNumber("rb655_easy_animation_nohide")function TOOL:Think()local h=self:GetSelecetedEntity()if!IsValid(h)then self:SetSelecetedEntity(NULL)end;if CLIENT then if r!=GetConVarNumber("ai_disabled")||s!=GetConVarNumber("rb655_easy_animation_nohide")then r=GetConVarNumber("ai_disabled")s=GetConVarNumber("rb655_easy_animation_nohide")if g(h)&&h:IsNPC()then self:UpdateControlPanel()end end;if h:EntIndex()==a then return end;a=h:EntIndex()self:UpdateControlPanel()RunConsoleCommand("rb655_easy_animation_anim","")end end;function TOOL:RightClick(t)return true end;function TOOL:Reload(t)return true end;TOOL.Information={{name="info",stage=1},{name="left"},{name="right"},{name="reload"}}language.Add("tool.rb655_easy_animation.left","Play all animations")language.Add("tool.rb655_easy_animation.right","Select an object to play animations on")language.Add("tool.rb655_easy_animation.reload","Pause currently playing animation(s)")language.Add("tool.rb655_easy_animation.name","Easy Animation Tool")language.Add("tool.rb655_easy_animation.desc","Easy animations for everyone")language.Add("tool.rb655_easy_animation.1","Use context menu to play animations")language.Add("tool.rb655_easy_animation.animations","Animations")language.Add("tool.rb655_easy_animation.add","Add current selection")language.Add("tool.rb655_easy_animation.add.help","\nIf you want to play animations on multiple entities at one:\n1) Select entity\n2) Select animation from the list, if the entity has any.\n3) Configure sliders to your desire.\n4) Click \"Add current selection\"\n5) Do 1-4 steps as many times as you wish.\n6) Left-click\n\nYou cannot play two animations on the same entity at the same time. The last animation will cut off the first one.")language.Add("tool.rb655_easy_animation.speed","Animation Speed")language.Add("tool.rb655_easy_animation.speed.help","How fast the animation will play.")language.Add("tool.rb655_easy_animation.delay","Delay")language.Add("tool.rb655_easy_animation.delay.help","The time between you left-click and the animation is played.")language.Add("tool.rb655_easy_animation.loop","Loop Animation")language.Add("tool.rb655_easy_animation.loop.help","Play animation again when it ends.")language.Add("tool.rb655_easy_animation.nohide","Do not filter animations")language.Add("tool.rb655_easy_animation.nohide.help","Enabling this option will show you the full list of animations available for selected entity. Please note, that this list can be so long, that GMod may freeze for a few seconds.")language.Add("tool.rb655_easy_animation.ai","NPC is selected, but NPC thinking is not disabled!")language.Add("tool.rb655_easy_animation.ragdoll","Ragdolls cannot be animated! Open context menu (Hold C) > right click on ragdoll > Make Animatable")language.Add("tool.rb655_easy_animation.prop","Props cannot be animated properly! Open context menu (Hold C) > right click on entity > Make Animatable")language.Add("tool.rb655_easy_animation.badent","This entity does not have any animations.")language.Add("tool.rb655_easy_animation.noent","No entity selected.")language.Add("tool.rb655_easy_animation.noglow","Don't render glow/halo around models")language.Add("tool.rb655_easy_animation.noglow.help","Don't render glow/halo around models when they are selected, and don't draw bounding boxes below animated models. Bounding boxes are a helper for when animations make the ragdolls go outside of their bounding box making them unselectable.\n")language.Add("tool.rb655_easy_animation.property","Make Animatable")language.Add("tool.rb655_easy_animation.property_ragdoll","Make Ragdoll")language.Add("prop_animatable","Animatable Entity")function TOOL:GetStage()if IsValid(self:GetSelecetedEntity())then return 1 end;return 0 end;net.Receive("rb655_easy_animation_array",function(u)local v=LocalPlayer():GetTool("rb655_easy_animation")v.AnimationArray=net.ReadTable()if CLIENT then v:UpdateControlPanel()end end)function TOOL:UpdateControlPanel(w)local x=controlpanel.Get("rb655_easy_animation")if!x then MsgN("Couldn't find rb655_easy_animation panel!")return end;x:ClearControls()self.BuildCPanel(x,self:GetSelecetedEntity())end;function TOOL.BuildCPanel(x,h)if!IsValid(h)then h=LocalPlayer():GetTool("rb655_easy_animation"):GetSelecetedEntity()end;if!IsValid(h)then x:AddControl("Label",{Text="#tool.rb655_easy_animation.noent"})elseif g(h)then local y=true;if GetConVarNumber("ai_disabled")==0&&h:IsNPC()then x:AddControl("Label",{Text="#tool.rb655_easy_animation.ai"})y=false end;if h:GetClass()=="prop_ragdoll"then x:AddControl("Label",{Text="#tool.rb655_easy_animation.ragdoll"})y=false end;if h:GetClass()=="prop_physics"||h:GetClass()=="prop_physics_multiplayer"||h:GetClass()=="prop_physics_override"then x:AddControl("Label",{Text="#tool.rb655_easy_animation.prop"})end;local z={}local A={"g_","p_","e_","b_","bg_","hg_","tc_","aim_","turn","gest_","pose_","pose_","auto_","layer_","posture","bodyaccent","a_"}local B={"gesture","posture","_trans_","_rot_","gest","aim","bodyflex_","delta","ragdoll","spine","arms"}for C,D in SortedPairsByValue(h:GetSequenceList())do local E=false;for F,f in pairs(B)do if string.find(string.lower(D),f)!=nil then E=true;break end end;if E==true&&LocalPlayer():GetTool("rb655_easy_animation"):GetClientNumber("nohide")==0 then continue end;for F,f in pairs(A)do if f==string.Left(string.lower(D),string.len(f))then E=true;break end end;if E==true&&LocalPlayer():GetTool("rb655_easy_animation"):GetClientNumber("nohide")==0 then continue end;language.Add("rb655_anim_"..D,b(D))z["#rb655_anim_"..D]={rb655_easy_animation_anim=D,rb655_easy_animation_anim_do=D}end;if y then local G=x:AddControl("TextBox",{Label="#spawnmenu.quick_filter_tool"})G:SetUpdateOnType(true)local H=x:AddControl("ListBox",{Label="#tool.rb655_easy_animation.animations",Options=z,Height=225})function H:DataLayout()local I=0;for C,J in ipairs(self.Sorted)do if!J:IsVisible()then continue end;J:SetPos(1,I)J:SetSize(self:GetWide()-2,self.m_iDataHeight)J:DataLayout(self)J:SetAltLine(C%2==1)I=I+J:GetTall()end;return I end;G.OnValueChange=function(f,K)for L,M in pairs(H:GetCanvas():GetChildren())do if!M:GetValue(1):lower():find(K:lower())then M:SetVisible(false)else M:SetVisible(true)end end;H:SetDirty(true)H:InvalidateLayout()end end elseif!g(h)then x:AddControl("Label",{Text="#tool.rb655_easy_animation.badent"})end;local M=vgui.Create("DPanelList")M:SetHeight(225)M:EnableHorizontal(false)M:EnableVerticalScrollbar(true)M:SetSpacing(2)M:SetPadding(2)Derma_Hook(M,"Paint","Paint","Panel")local v=LocalPlayer():GetTool("rb655_easy_animation")if v&&v.AnimationArray then for F,N in pairs(v.AnimationArray)do local f=vgui.Create("RAnimEntry")f:SetInfo(F,N.ent,N.anim,N.speed,N.delay,N.loop)M:AddItem(f)end end;x:AddPanel(M)x:AddControl("Button",{Label="#tool.rb655_easy_animation.add",Command="rb655_easy_animation_add"})x:ControlHelp("#tool.rb655_easy_animation.add.help")x:AddControl("Slider",{Label="#tool.rb655_easy_animation.speed",Type="Float",Min=0.05,Max=3.05,Command="rb655_easy_animation_speed",Help=true})x:AddControl("Slider",{Label="#tool.rb655_easy_animation.delay",Type="Float",Min=0,Max=32,Command="rb655_easy_animation_delay",Help=true})x:AddControl("Checkbox",{Label="#tool.rb655_easy_animation.loop",Command="rb655_easy_animation_loop",Help=true})x:AddControl("Checkbox",{Label="#tool.rb655_easy_animation.nohide",Command="rb655_easy_animation_nohide",Help=true})x:AddControl("Checkbox",{Label="#tool.rb655_easy_animation.noglow",Command="rb655_easy_animation_noglow",Help=true})end;function TOOL:DrawHUD()local h=self:GetSelecetedEntity()if!IsValid(h)||tobool(self:GetClientNumber("noglow"))then return end;local z={h}if h.GetActiveWeapon then table.insert(z,h:GetActiveWeapon())end;halo.Add(z,HSVToColor(CurTime()*3%360,math.abs(math.sin(CurTime()/2)),1),2,2,1)end;local O={}function O:Init()self.ent=nil;self.anim="attack01"self.id=0;self.eid=0;self.speed=1;self.delay=0;self.loop=false;self.rem=vgui.Create("DImageButton",self)self.rem:SetImage("icon16/cross.png")self.rem:SetSize(16,16)self.rem:SetPos(4,4)self.rem.DoClick=function()self:RemoveFull()end end;function O:RemoveFull()self.rem:Remove()self:Remove()RunConsoleCommand("rb655_easy_animation_rid",self.id,self.eid)end;function O:Paint(P,Q)draw.RoundedBox(2,0,0,P,Q,Color(50,50,50,225))if!self.ent||!IsValid(self.ent)then self:RemoveFull()return end;surface.SetFont("DermaDefault")draw.SimpleText("#"..self.ent:GetClass(),"DermaDefault",24,0,Color(255,255,255,255))draw.SimpleText("#rb655_anim_"..self.anim,"DermaDefault",24,10,Color(255,255,255,255))local R=surface.GetTextSize("#"..self.ent:GetClass())draw.SimpleText(" #"..self.ent:EntIndex(),"DermaDefault",24+R,0,Color(255,255,255,255))local S=surface.GetTextSize("#rb655_anim_"..self.anim)local z=" [ S: "..self.speed..", D: "..self.delay;if self.loop then z=z..", Looping"end;draw.SimpleText(z.." ]","DermaDefault",24+S,10,Color(255,255,255,255))end;function O:SetInfo(L,T,U,f,N,V)self.id=L;self.eid=T:EntIndex()self.ent=T;self.anim=U;self.speed=f;self.delay=N;self.loop=tobool(V)end;vgui.Register("RAnimEntry",O,"Panel")
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/wheel.lua:
TOOL.Category="Construction"TOOL.Name="#tool.wheel.name"TOOL.ClientConVar["torque"]="3000"TOOL.ClientConVar["friction"]="1"TOOL.ClientConVar["nocollide"]="1"TOOL.ClientConVar["forcelimit"]="0"TOOL.ClientConVar["fwd"]="45"TOOL.ClientConVar["bck"]="42"TOOL.ClientConVar["toggle"]="0"TOOL.ClientConVar["model"]="models/props_vehicles/carparts_wheel01a.mdl"TOOL.ClientConVar["rx"]="90"TOOL.ClientConVar["ry"]="0"TOOL.ClientConVar["rz"]="90"TOOL.Information={{name="left"},{name="right"},{name="use"}}cleanup.Register("wheels")local function a(b)for c,d in pairs(list.Get("WheelModels"))do if c:lower()==b:lower()then return true end end;return false end;function TOOL:LeftClick(e)if e.Entity&&e.Entity:IsPlayer()then return false end;if SERVER&&!util.IsValidPhysicsObject(e.Entity,e.PhysicsBone)then return false end;if CLIENT then return true end;if!self:GetSWEP():CheckLimit("wheels")then return false end;local b=self:GetClientInfo("model")if!util.IsValidModel(b)||!util.IsValidProp(b)||!a(b)then return false end;local f=self:GetClientNumber("torque")local g=self:GetClientNumber("friction")local h=self:GetClientNumber("nocollide")local i=self:GetClientNumber("forcelimit")local j=self:GetClientNumber("toggle")!=0;local k=self:GetClientNumber("fwd")local l=self:GetClientNumber("bck")local m=self:GetOwner()self.wheelAngle=Angle(math.NormalizeAngle(self:GetClientNumber("rx")),math.NormalizeAngle(self:GetClientNumber("ry")),math.NormalizeAngle(self:GetClientNumber("rz")))local n=MakeWheel(m,e.HitPos,e.HitNormal:Angle()+self.wheelAngle,b,k,l,nil,nil,j,f)local o=n:GetPos()local p=n:NearestPoint(o-e.HitNormal*512)local q=o-p;n:SetPos(e.HitPos+q)if IsValid(n:GetPhysicsObject())then n:GetPhysicsObject():Wake()end;local r=e.Entity:GetPhysicsObjectNum(e.PhysicsBone)local s=n:GetPhysicsObject():WorldToLocal(n:GetPos()+e.HitNormal)local t=r:WorldToLocal(e.HitPos)local constraint,u=constraint.Motor(n,e.Entity,0,e.PhysicsBone,s,t,g,f,0,h,j,m,i)undo.Create("Wheel")undo.AddEntity(u)undo.AddEntity(constraint)undo.AddEntity(n)undo.SetPlayer(m)undo.Finish()m:AddCleanup("wheels",u)m:AddCleanup("wheels",constraint)n:SetMotor(constraint)n:SetDirection(constraint.direction)n:SetAxis(e.HitNormal)n:DoDirectionEffect()return true end;function TOOL:RightClick(e)if e.Entity&&e.Entity:GetClass()!="gmod_wheel"then return false end;if CLIENT then return true end;local n=e.Entity;if IsValid(n:GetPlayer())&&n:GetPlayer()!=self:GetOwner()then return false end;local f=self:GetClientNumber("torque")local j=self:GetClientNumber("toggle")!=0;local k=self:GetClientNumber("fwd")local l=self:GetClientNumber("bck")n.BaseTorque=f;n:SetTorque(f)n:SetToggle(j)n.KeyBinds=n.KeyBinds||{}n.key_f=k;n.key_r=l;numpad.Remove(n.KeyBinds[1])numpad.Remove(n.KeyBinds[2])numpad.Remove(n.KeyBinds[3])numpad.Remove(n.KeyBinds[4])n.KeyBinds[1]=numpad.OnDown(self:GetOwner(),k,"WheelForward",n,true)n.KeyBinds[2]=numpad.OnUp(self:GetOwner(),k,"WheelForward",n,false)n.KeyBinds[3]=numpad.OnDown(self:GetOwner(),l,"WheelReverse",n,true)n.KeyBinds[4]=numpad.OnUp(self:GetOwner(),l,"WheelReverse",n,false)return true end;function TOOL:UpdateGhostWheel(v,m)if!IsValid(v)then return end;local e=m:GetEyeTrace()if!e.Hit||IsValid(e.Entity)&&e.Entity:IsPlayer()then v:SetNoDraw(true)return end;local w=e.HitNormal:Angle()+self.wheelAngle;v:SetAngles(w)local o=v:GetPos()local p=v:NearestPoint(o-e.HitNormal*512)local x=o-p;v:SetPos(e.HitPos+x)v:SetNoDraw(false)end;function TOOL:Think()local c=self:GetClientInfo("model")if!a(c)then self:ReleaseGhostEntity()return end;if!IsValid(self.GhostEntity)||self.GhostEntity:GetModel()!=c then self.wheelAngle=Angle(math.NormalizeAngle(self:GetClientNumber("rx")),math.NormalizeAngle(self:GetClientNumber("ry")),math.NormalizeAngle(self:GetClientNumber("rz")))self:MakeGhostEntity(c,vector_origin,angle_zero)end;self:UpdateGhostWheel(self.GhostEntity,self:GetOwner())end;local y=TOOL:BuildConVarList()function TOOL.BuildCPanel(z)z:AddControl("Header",{Description="#tool.wheel.desc"})z:AddControl("ComboBox",{MenuButton=1,Folder="wheel",Options={["#preset.default"]=y},CVars=table.GetKeys(y)})z:AddControl("Numpad",{Label="#tool.wheel.forward",Command="wheel_fwd",Label2="#tool.wheel.reverse",Command2="wheel_bck"})z:AddControl("Slider",{Label="#tool.wheel.torque",Command="wheel_torque",Type="Float",Min=10,Max=10000})z:AddControl("Slider",{Label="#tool.wheel.forcelimit",Command="wheel_forcelimit",Type="Float",Min=0,Max=50000})z:AddControl("Slider",{Label="#tool.wheel.friction",Command="wheel_friction",Type="Float",Min=0,Max=100})z:AddControl("CheckBox",{Label="#tool.wheel.nocollide",Command="wheel_nocollide"})z:AddControl("CheckBox",{Label="#tool.wheel.toggle",Command="wheel_toggle"})z:AddControl("PropSelect",{Label="#tool.wheel.model",ConVar="wheel_model",Height=0,Models=list.Get("WheelModels")})end;local A={wheel_rx=0,wheel_ry=0,wheel_rz=0}local B={wheel_rx=90,wheel_ry=0,wheel_rz=0}local C={wheel_rx=90,wheel_ry=0,wheel_rz=90}list.Set("WheelModels","models/props_junk/sawblade001a.mdl",B)list.Set("WheelModels","models/props_vehicles/carparts_wheel01a.mdl",C)list.Set("WheelModels","models/props_vehicles/apc_tire001.mdl",A)list.Set("WheelModels","models/props_vehicles/tire001a_tractor.mdl",A)list.Set("WheelModels","models/props_vehicles/tire001b_truck.mdl",A)list.Set("WheelModels","models/props_vehicles/tire001c_car.mdl",A)list.Set("WheelModels","models/props_wasteland/controlroom_filecabinet002a.mdl",B)list.Set("WheelModels","models/props_borealis/bluebarrel001.mdl",B)list.Set("WheelModels","models/props_c17/oildrum001.mdl",B)list.Set("WheelModels","models/props_c17/playground_carousel01.mdl",B)list.Set("WheelModels","models/props_c17/chair_office01a.mdl",B)list.Set("WheelModels","models/props_c17/TrapPropeller_Blade.mdl",B)list.Set("WheelModels","models/props_wasteland/wheel01.mdl",C)list.Set("WheelModels","models/props_trainstation/trainstation_clock001.mdl",A)list.Set("WheelModels","models/props_junk/metal_paintcan001a.mdl",B)list.Set("WheelModels","models/props_c17/pulleywheels_large01.mdl",A)list.Set("WheelModels","models/props_phx/oildrum001_explosive.mdl",B)list.Set("WheelModels","models/props_phx/wheels/breakable_tire.mdl",B)list.Set("WheelModels","models/props_phx/gibs/tire1_gib.mdl",B)list.Set("WheelModels","models/props_phx/normal_tire.mdl",B)list.Set("WheelModels","models/props_phx/mechanics/medgear.mdl",B)list.Set("WheelModels","models/props_phx/mechanics/biggear.mdl",B)list.Set("WheelModels","models/props_phx/gears/bevel9.mdl",B)list.Set("WheelModels","models/props_phx/gears/bevel90_24.mdl",B)list.Set("WheelModels","models/props_phx/gears/bevel12.mdl",B)list.Set("WheelModels","models/props_phx/gears/bevel24.mdl",B)list.Set("WheelModels","models/props_phx/gears/bevel36.mdl",B)list.Set("WheelModels","models/props_phx/gears/spur9.mdl",B)list.Set("WheelModels","models/props_phx/gears/spur12.mdl",B)list.Set("WheelModels","models/props_phx/gears/spur24.mdl",B)list.Set("WheelModels","models/props_phx/gears/spur36.mdl",B)list.Set("WheelModels","models/props_phx/smallwheel.mdl",B)list.Set("WheelModels","models/props_phx/wheels/747wheel.mdl",B)list.Set("WheelModels","models/props_phx/wheels/trucktire.mdl",B)list.Set("WheelModels","models/props_phx/wheels/trucktire2.mdl",B)list.Set("WheelModels","models/props_phx/wheels/metal_wheel1.mdl",B)list.Set("WheelModels","models/props_phx/wheels/metal_wheel2.mdl",B)list.Set("WheelModels","models/props_phx/wheels/wooden_wheel1.mdl",B)list.Set("WheelModels","models/props_phx/wheels/wooden_wheel2.mdl",B)list.Set("WheelModels","models/props_phx/construct/metal_plate_curve360.mdl",B)list.Set("WheelModels","models/props_phx/construct/metal_plate_curve360x2.mdl",B)list.Set("WheelModels","models/props_phx/construct/wood/wood_curve360x1.mdl",B)list.Set("WheelModels","models/props_phx/construct/wood/wood_curve360x2.mdl",B)list.Set("WheelModels","models/props_phx/construct/windows/window_curve360x1.mdl",B)list.Set("WheelModels","models/props_phx/construct/windows/window_curve360x2.mdl",B)list.Set("WheelModels","models/props_phx/trains/wheel_medium.mdl",B)list.Set("WheelModels","models/props_phx/trains/medium_wheel_2.mdl",B)list.Set("WheelModels","models/props_phx/trains/double_wheels.mdl",B)list.Set("WheelModels","models/props_phx/trains/double_wheels2.mdl",B)list.Set("WheelModels","models/props_phx/wheels/drugster_back.mdl",B)list.Set("WheelModels","models/props_phx/wheels/drugster_front.mdl",B)list.Set("WheelModels","models/props_phx/wheels/monster_truck.mdl",B)list.Set("WheelModels","models/props_phx/misc/propeller2x_small.mdl",B)list.Set("WheelModels","models/props_phx/misc/propeller3x_small.mdl",B)list.Set("WheelModels","models/props_phx/misc/paddle_small.mdl",B)list.Set("WheelModels","models/props_phx/misc/paddle_small2.mdl",B)list.Set("WheelModels","models/props_phx/wheels/magnetic_small.mdl",B)list.Set("WheelModels","models/props_phx/wheels/magnetic_small_base.mdl",B)list.Set("WheelModels","models/props_phx/wheels/magnetic_medium.mdl",B)list.Set("WheelModels","models/props_phx/wheels/magnetic_med_base.mdl",B)list.Set("WheelModels","models/props_phx/wheels/magnetic_large.mdl",B)list.Set("WheelModels","models/props_phx/wheels/magnetic_large_base.mdl",B)list.Set("WheelModels","models/props_phx/wheels/moped_tire.mdl",B)list.Set("WheelModels","models/hunter/misc/cone1x05.mdl",B)list.Set("WheelModels","models/hunter/tubes/circle2x2.mdl",B)list.Set("WheelModels","models/hunter/tubes/circle4x4.mdl",B)list.Set("WheelModels","models/mechanics/wheels/bmw.mdl",B)list.Set("WheelModels","models/mechanics/wheels/bmwl.mdl",B)list.Set("WheelModels","models/mechanics/wheels/rim_1.mdl",B)list.Set("WheelModels","models/mechanics/wheels/tractor.mdl",B)list.Set("WheelModels","models/mechanics/wheels/wheel_2.mdl",B)list.Set("WheelModels","models/mechanics/wheels/wheel_2l.mdl",B)list.Set("WheelModels","models/mechanics/wheels/wheel_extruded_48.mdl",B)list.Set("WheelModels","models/mechanics/wheels/wheel_race.mdl",B)list.Set("WheelModels","models/mechanics/wheels/wheel_smooth2.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear12x12.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear12x12_large.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear12x12_small.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear12x24.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear12x24_large.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear12x24_small.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear12x6.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear12x6_large.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear12x6_small.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear16x12.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear16x12_large.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear16x12_small.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear16x24.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear16x24_large.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear16x24_small.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear16x6.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear16x6_large.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear16x6_small.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear24x12.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear24x12_large.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear24x12_small.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear24x24.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear24x24_large.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear24x24_small.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear24x6.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear24x6_large.mdl",B)list.Set("WheelModels","models/Mechanics/gears/gear24x6_small.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_12t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_18t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_24t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_36t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_48t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_60t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_12t2.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_18t2.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_24t2.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_36t2.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_48t2.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_60t2.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_12t3.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_18t3.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_24t3.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_36t3.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_48t3.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/gear_60t3.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/bevel_12t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/bevel_18t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/bevel_24t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/bevel_36t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/bevel_48t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/bevel_60t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/vert_12t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/vert_18t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/vert_24t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/vert_36t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/pinion_20t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/pinion_40t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/pinion_80t1.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/pinion_20t2.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/pinion_40t2.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/pinion_80t2.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/pinion_20t3.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/pinion_40t3.mdl",B)list.Set("WheelModels","models/Mechanics/gears2/pinion_80t3.mdl",B)list.Set("WheelModels","models/NatesWheel/nateswheel.mdl",A)list.Set("WheelModels","models/NatesWheel/nateswheelwide.mdl",A)list.Set("WheelModels","models/XQM/JetEnginePropeller.mdl",A)list.Set("WheelModels","models/XQM/JetEnginePropellerMedium.mdl",A)list.Set("WheelModels","models/XQM/JetEnginePropellerBig.mdl",A)list.Set("WheelModels","models/XQM/JetEnginePropellerHuge.mdl",A)list.Set("WheelModels","models/XQM/JetEnginePropellerLarge.mdl",A)list.Set("WheelModels","models/XQM/HelicopterRotor.mdl",A)list.Set("WheelModels","models/XQM/HelicopterRotorMedium.mdl",A)list.Set("WheelModels","models/XQM/HelicopterRotorBig.mdl",A)list.Set("WheelModels","models/XQM/HelicopterRotorHuge.mdl",A)list.Set("WheelModels","models/XQM/HelicopterRotorLarge.mdl",A)list.Set("WheelModels","models/XQM/Propeller1.mdl",A)list.Set("WheelModels","models/XQM/Propeller1Medium.mdl",A)list.Set("WheelModels","models/XQM/Propeller1Big.mdl",A)list.Set("WheelModels","models/XQM/Propeller1Huge.mdl",A)list.Set("WheelModels","models/XQM/Propeller1Large.mdl",A)list.Set("WheelModels","models/XQM/AirPlaneWheel1.mdl",A)list.Set("WheelModels","models/XQM/AirPlaneWheel1Medium.mdl",A)list.Set("WheelModels","models/XQM/AirPlaneWheel1Big.mdl",A)list.Set("WheelModels","models/XQM/AirPlaneWheel1Huge.mdl",A)list.Set("WheelModels","models/XQM/AirPlaneWheel1Large.mdl",A)list.Set("WheelModels","models/xeon133/offroad/Off-road-20.mdl",A)list.Set("WheelModels","models/xeon133/offroad/Off-road-30.mdl",A)list.Set("WheelModels","models/xeon133/offroad/Off-road-40.mdl",A)list.Set("WheelModels","models/xeon133/offroad/Off-road-50.mdl",A)list.Set("WheelModels","models/xeon133/offroad/Off-road-60.mdl",A)list.Set("WheelModels","models/xeon133/offroad/Off-road-70.mdl",A)list.Set("WheelModels","models/xeon133/offroad/Off-road-80.mdl",A)
--addons/!lpakr_out/lua/wire/tool_loader.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/cam.lua:
WireToolSetup.setCategory("Vehicle Control","Visuals")WireToolSetup.open("cam","Cam Controller","gmod_wire_cameracontroller",nil,"Cam Controllers")if CLIENT then language.Add("Tool.wire_cam.name","Cam Controller Tool (Wire)")language.Add("Tool.wire_cam.desc","Spawns a constant Cam Controller prop for use with the wire system.")language.Add("Tool.wire_cam.parentlocal","Coordinates local to parent")language.Add("Tool.wire_cam.freemove","Free movement")language.Add("Tool.wire_cam.automove","Client side movement")language.Add("Tool.wire_cam.localmove","Localized movement")language.Add("Tool.wire_cam.allowzoom","Client side zooming")language.Add("Tool.wire_cam.autounclip","Auto un-clip")language.Add("Tool.wire_cam.autounclip_ignorewater","Auto un-clip ignores water")language.Add("Tool.wire_cam.drawplayer","Draw player")language.Add("Tool.wire_cam.drawparent","Draw parent")language.Add("Tool.wire_cam.smooth_amount","Smooth speed (default: 18)")WireToolSetup.setToolMenuIcon("icon16/camera.png")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar["model"]="models/jaanus/wiretool/wiretool_siren.mdl"TOOL.ClientConVar["parentlocal"]="0"TOOL.ClientConVar["automove"]="0"TOOL.ClientConVar["freemove"]="0"TOOL.ClientConVar["localmove"]="0"TOOL.ClientConVar["allowzoom"]="0"TOOL.ClientConVar["autounclip"]="0"TOOL.ClientConVar["autounclip_ignorewater"]="0"TOOL.ClientConVar["drawplayer"]="1"TOOL.ClientConVar["drawparent"]="1"TOOL.ClientConVar["smooth_amount"]="18"WireToolSetup.SetupLinking(false,"pod")function TOOL.BuildCPanel(a)WireDermaExts.ModelSelect(a,"wire_cam_model",list.Get("Wire_Misc_Tools_Models"),1)a:CheckBox("#Tool.wire_cam.parentlocal","wire_cam_parentlocal")a:CheckBox("#Tool.wire_cam.automove","wire_cam_automove")a:Help("Allow the player to rotate the camera using their mouse. When active, the position input becomes the center of the camera's orbit.")a:CheckBox("#Tool.wire_cam.freemove","wire_cam_freemove")a:Help("Modifies mouse input to allow 360 degree rotation. The 'UnRoll' input can be toggled to match the parent entity's roll. (NOTE: only used if 'client side movement' is enabled)")a:CheckBox("#Tool.wire_cam.localmove","wire_cam_localmove")a:Help("Determines whether the client side movement is local to the parent or not (NOTE: only used if 'client side movement' is enabled)")a:CheckBox("#Tool.wire_cam.allowzoom","wire_cam_allowzoom")a:Help("Allow the player to move the camera in and out using the scroller on their mouse. The 'Distance' input is used as an offset for this. (NOTE: only used if 'client side movement' is enabled. NOTE: The cam controller's outputs might be wrong when this is enabled, because the server doesn't know how much they've zoomed - it only knows what the 'Distance' input is set to).")a:CheckBox("#Tool.wire_cam.autounclip","wire_cam_autounclip")a:Help("Automatically prevents the camera from clipping into walls by moving it closer to the parent entity (or cam controller if no parent is specified).")a:CheckBox("#Tool.wire_cam.autounclip_ignorewater","wire_cam_autounclip_ignorewater")a:CheckBox("#Tool.wire_cam.drawplayer","wire_cam_drawplayer")a:Help("Enable/disable the player being able to see themselves. Useful if you want to position the camera inside the player's head.")a:CheckBox("#Tool.wire_cam.drawparent","wire_cam_drawparent")a:Help("Enable/disable the rendering of the parent entity. Useful if you want to position the camera inside the parent.")a:Help("As you may have noticed, there are a lot of behaviours that change depending on which checkboxes are checked. For a detailed walk-through of everything, go to http://wiki.wiremod.com/wiki/Cam_Controller")a:NumSlider("#Tool.wire_cam.smooth_amount","wire_cam_smooth_amount",4,30,1)a:Help("Smooth speed is a client side setting, and is not saved on the cam controller entity. Changing it will immediately affect all cam controllers you use.")end
--addons/!lpakr_out/lua/wire/stools/clutch.lua:
WireToolSetup.setCategory("Physics")WireToolSetup.open("clutch","Clutch","gmod_wire_clutch",nil,"Clutchs")if CLIENT then language.Add("Tool.wire_clutch.name","Clutch Tool (Wire)")language.Add("Tool.wire_clutch.desc","Control rotational friction between props")TOOL.Information={{name="left_0",stage=0,text="Place/Select a clutch controller"},{name="right_0",stage=0,text="Select an entity to apply the clutch to"},{name="reload_0",stage=0,text="Remove clutch from entity/deselect controller"},{name="right_1",stage=1,text="Right click on the second entity you want the clutch to apply to"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(8)TOOL.ClientConVar["model"]="models/jaanus/wiretool/wiretool_siren.mdl"cleanup.Register("wire_clutch")local a;if CLIENT then local b={}local c={}local function d()table.Empty(b)local e=net.ReadUInt(8)||0;if e!=0 then for f=1,e do local g=net.ReadEntity()local h=net.ReadEntity()table.insert(b,{Ent1=g,Ent2=h})c[g]=true;c[h]=true end end end;net.Receive("wire_clutch_links",d)local function i(j)if j.x>0&&j.y>0&&j.x<ScrW()&&j.y<ScrH()then return true end;return false end;local function k(l,m)local n=math.Clamp(m:Distance(l),50,5000)local o=3000/n;local j=l:ToScreen()local p={x=j.x+o,y=j.y}local q={x=j.x-o,y=j.y}surface.DrawLine(p.x,p.y,q.x,q.y)end;local function r(l,m)local j=l:ToScreen()if i(j)then surface.DrawCircle(j.x,j.y,7,Color(255,100,100,255))end end;function TOOL:DrawHUD()local s={}local t=self:GetWeapon():GetNWEntity("WireClutchController")if!IsValid(t)then return end;local m=LocalPlayer():GetViewModel():GetPos()local u=t:LocalToWorld(t:OBBCenter())r(u,m)local v=#b;if v!=0 then surface.SetDrawColor(100,255,100,255)for w,x in pairs(b)do local y;local p,q;local z=IsValid(x.Ent1)local A=IsValid(x.Ent2)if z then p=x.Ent1:GetPos():ToScreen()end;if A then q=x.Ent2:GetPos():ToScreen()end;if!z&&!A then table.remove(b,w)elseif x.Ent1:IsWorld()then y=x.Ent2:GetPos()+Vector(0,0,-30)p=y:ToScreen()elseif x.Ent2:IsWorld()then y=x.Ent1:GetPos()+Vector(0,0,-30)q=y:ToScreen()end;if p&&q then if i(p)&&i(q)then surface.DrawLine(p.x,p.y,q.x,q.y)if!s[x.Ent1]&&z then surface.DrawCircle(p.x,p.y,5,Color(100,255,100,255))s[x.Ent1]=true end;if!s[x.Ent2]&&A then surface.DrawCircle(q.x,q.y,5,Color(100,255,100,255))s[x.Ent2]=true end;if y then k(y,m)end end end end end end end;function TOOL:RightClick(B)if CLIENT then return true end;local C=self:GetOwner()local D=self:NumObjects()if!IsValid(self.controller)then C:PrintMessage(HUD_PRINTTALK,"Select a clutch controller with left click first")return end;if!IsValid(B.Entity)&&!B.Entity:IsWorld()||B.Entity:IsPlayer()then return end;if D==0 then if B.Entity:IsWorld()then C:PrintMessage(HUD_PRINTTALK,"Select a valid entity")return end;local E=GetConVarNumber("wire_clutch_maxlinks",10)if table.Count(self.controller.clutch_ballsockets)>=E then C:PrintMessage(HUD_PRINTTALK,"A maximum of "..tostring(E).." links are allowed per clutch controller")return end;local F=B.Entity:GetPhysicsObjectNum(B.PhysicsBone)self:SetObject(1,B.Entity,B.HitPos,F,B.PhysicsBone,B.HitNormal)self:SetStage(1)else local g,h=self:GetEnt(1),B.Entity;if g==h then C:PrintMessage(HUD_PRINTTALK,"Select a different entity")return false end;if self.controller:ClutchExists(g,h)then C:PrintMessage(HUD_PRINTTALK,"Entities have already been registered to this controller!")return true end;self.controller:AddClutch(g,h)WireLib.AddNotify(C,"Entities registered with clutch controller",NOTIFY_GENERIC,7)a(C,self.controller:GetConstrainedPairs())self:ClearObjects()self:SetStage(0)end;return true end;function TOOL:Reload(B)local D=self:NumObjects()if D==1 then self:ClearObjects()self:SetStage(0)return elseif IsValid(self.controller)then if B.Entity:IsWorld()then self:ClearObjects()self:SetStage(0)self.controller=nil else for w,x in pairs(self.controller.clutch_ballsockets)do if w.Ent1==B.Entity||w.Ent2==B.Entity then self.controller:RemoveClutch(w)end end end;self:SelectController(self.controller)end;return true end;function TOOL:Holster()self:ClearObjects()self:SetStage(0)self:ReleaseGhostEntity()end;function TOOL.BuildCPanel(G)G:AddControl("Header",{Text="#Tool.wire_clutch.name",Description="#Tool.wire_clutch.desc"})WireDermaExts.ModelSelect(G,"wire_clutch_model",list.Get("Wire_Misc_Tools_Models"),1)end;if CLIENT then return end
--addons/!lpakr_out/lua/wire/stools/data_store.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/dataport.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/detonator.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/detonator.lua:
WireToolSetup.setCategory("Physics")WireToolSetup.open("detonator","Detonator","gmod_wire_detonator",nil,"Detonators")if CLIENT then language.Add("tool.wire_detonator.name","Detonator Tool (Wire)")language.Add("tool.wire_detonator.desc","Spawns a Detonator for use with the wire system.")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={damage=1,model="models/props_combine/breenclock.mdl"}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_detonator")a:NumSlider("#Damage","wire_detonator_damage",1,200,0)ModelPlug_AddToCPanel(a,"detonator","wire_detonator",true,1)end
--addons/!lpakr_out/lua/wire/stools/digitalscreen.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/dynamic_button.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/gates.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/grabber.lua:
WireToolSetup.setCategory("Physics/Constraints")WireToolSetup.open("grabber","Grabber","gmod_wire_grabber",nil,"Grabbers")if CLIENT then language.Add("tool.wire_grabber.name","Grabber Tool (Wire)")language.Add("tool.wire_grabber.desc","Spawns a constant grabber prop for use with the wire system.")language.Add("tool.wire_grabber.right_0","Link grabber to a prop that'll also be welded for stability")language.Add("WireGrabberTool_Range","Max Range:")language.Add("WireGrabberTool_Gravity","Disable Gravity")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/jaanus/wiretool/wiretool_range.mdl",Range=100,Gravity=1}WireToolSetup.SetupLinking(true,"prop")function TOOL:GetGhostMin(a)if self:GetModel()=="models/jaanus/wiretool/wiretool_grabber_forcer.mdl"then return a.z+20 end;return a.z end;function TOOL.BuildCPanel(b)WireToolHelpers.MakePresetControl(b,"wire_grabber")ModelPlug_AddToCPanel(b,"Forcer","wire_grabber",true,1)b:CheckBox("#WireGrabberTool_Gravity","wire_grabber_Gravity")b:NumSlider("#WireGrabberTool_Range","wire_grabber_Range",1,10000,0)end
--addons/!lpakr_out/lua/wire/stools/hoverball.lua:
WireToolSetup.setCategory("Physics/Force")WireToolSetup.open("hoverball","Hoverball","gmod_wire_hoverball",nil,"Hoverballs")if CLIENT then language.Add("tool.wire_hoverball.name","Wired Hoverball Tool")language.Add("tool.wire_hoverball.desc","Spawns a hoverball for use with the wire system.")language.Add("tool.wire_hoverball.starton","Create with hover mode on")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(30)TOOL.ClientConVar={model="models/dav0r/hoverball.mdl",speed=1,resistance=0,strength=1,starton=1}function TOOL:GetAngle(a)return Angle(0,0,0)end;function TOOL:GetGhostMin(b,a)if a.Entity:IsWorld()then return-8 end;return 0 end;function TOOL.BuildCPanel(c)WireToolHelpers.MakePresetControl(c,"wire_hoverball")WireDermaExts.ModelSelect(c,"wire_hoverball_model",list.Get("HoverballModels"),2,true)c:NumSlider("#Movement Speed","wire_hoverball_speed",1,10,0)c:NumSlider("#Air Resistance","wire_hoverball_resistance",1,20,0)c:NumSlider("#Strength","wire_hoverball_strength",.1,20,2)c:CheckBox("#tool.wire_hoverball.starton","wire_hoverball_starton")end
--addons/!lpakr_out/lua/wire/stools/interactiveprop.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/lever.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/lever.lua:
WireToolSetup.setCategory("Input, Output")WireToolSetup.open("lever","Lever","gmod_wire_lever",nil,"Levers")if CLIENT then language.Add("tool.wire_lever.name","Lever Tool (Wire)")language.Add("tool.wire_lever.desc","Spawns a Lever for use with the wire system.")language.Add("tool.wire_lever.minvalue","Min Value:")language.Add("tool.wire_lever.maxvalue","Max Value:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(10)function TOOL:GetModel()return"models/props_wasteland/tram_leverbase01.mdl"end;TOOL.ClientConVar={min=0,max=1}function TOOL.BuildCPanel(a)a:NumSlider("#Tool.wire_lever.minvalue","wire_lever_min",-10,10,2)a:NumSlider("#Tool.wire_lever.maxvalue","wire_lever_max",-10,10,2)end
--addons/!lpakr_out/lua/wire/stools/output.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/pixel.lua:
WireToolSetup.setCategory("Visuals/Indicators")WireToolSetup.open("pixel","Pixel","gmod_wire_pixel",nil,"Pixels")if CLIENT then language.Add("tool.wire_pixel.name","Pixel Tool (Wire)")language.Add("tool.wire_pixel.desc","Spawns a Pixel for use with the wire system.")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}WireToolSetup.setToolMenuIcon("icon16/lightbulb_add.png")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.NoLeftOnClass=true;TOOL.ClientConVar={model="models/jaanus/wiretool/wiretool_siren.mdl"}function TOOL.BuildCPanel(a)WireDermaExts.ModelSelect(a,"wire_pixel_model",list.Get("Wire_pixel_Models"),3,true)end
--addons/!lpakr_out/lua/wire/stools/user.lua:
WireToolSetup.setCategory("Other")WireToolSetup.open("user","User","gmod_wire_user",nil,"Users")if CLIENT then language.Add("Tool.wire_user.name","User Tool (Wire)")language.Add("Tool.wire_user.desc","Spawns a constant user prop for use with the wire system.")language.Add("Tool.wire_user.range","Max Range:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/jaanus/wiretool/wiretool_siren.mdl",range=200}function TOOL.BuildCPanel(a)ModelPlug_AddToCPanel(a,"Laser_Tools","wire_user",true)a:NumSlider("#tool.wire_user.range","wire_user_range",1,1000,1)end
--addons/!lpakr_out/lua/wire/stools/value.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/value.lua:
WireToolSetup.setCategory("Input, Output")WireToolSetup.open("value","Constant Value","gmod_wire_value",nil,"Constant Values")if CLIENT then language.Add("Tool.wire_value.name","Value Tool (Wire)")language.Add("Tool.wire_value.desc","Spawns a constant value for use with the wire system.")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name},{name="right",text="Copy settings"}}WireToolSetup.setToolMenuIcon("icon16/database_go.png")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)local function a(b)local c=math.Clamp(#b,0,20)net.WriteUInt(c,5)for d=1,c do local e,f=b[d].DataType,b[d].Value;net.WriteString(b[d].DataType)net.WriteString(string.sub(b[d].Value,1,3000))end end;local function g()local h={}local c=net.ReadUInt(5)for d=1,c do h[d]={DataType=net.ReadString(),Value=net.ReadString()}end;return h end;TOOL.ClientConVar={model="models/kobilica/value.mdl",modelsize="",guesstype="1"}if CLIENT then function TOOL:RightClick(i)return IsValid(i.Entity)&&i.Entity:GetClass()=="gmod_wire_value"end;local j={Number="NORMAL",String="STRING",Angle="ANGLE",Vector="VECTOR",["2D Vector"]="VECTOR2",["4D Vector"]="VECTOR4"}local k={NORMAL="Number",STRING="String",ANGLE="Angle",VECTOR="Vector",VECTOR2="2D Vector",VECTOR4="4D Vector"}local l={"Number","String","Angle","Vector","2D Vector","4D Vector"}local m={}local b={}local n={}local o;local p;local q;local r;local s;local function t(u)u=u||b;local v=cookie.GetNumber("wire_constant_value_amount",0)cookie.Set("wire_constant_value_amount",#u)if v>#u then for d=#u+1,v do cookie.Delete("wire_constant_value_value"..d)cookie.Delete("wire_constant_value_type"..d)end end;for w,x in pairs(u)do cookie.Set("wire_constant_value_value"..w,string.sub(x.Value,1,3000))cookie.Set("wire_constant_value_type"..w,x.DataType)end end;local function y(z)local A=s;s=function()end;local c=cookie.GetNumber("wire_constant_value_amount",0)o:SetValue(c)for d=1,c do local B=cookie.GetString("wire_constant_value_type"..d,"NORMAL")local C=cookie.GetString("wire_constant_value_value"..d,"0")B=k[B]||"Number"b[d].DataType=B;b[d].Value=C;n[d].valueEntry:SetValue(C)n[d].typeSelection:SetText(B)n[d].typeSelection:OnSelect(_,B)end;s=A end;function s()net.Start("wire_value_values")a(b)net.SendToServer()t()end;local D={Number=function(C)return tonumber(C)!=nil end,["2D Vector"]=function(C)local E,F=string.match(C,"^ *([^%s,]+) *, *([^%s,]+) *$")return tonumber(E)!=nil&&tonumber(F)!=nil end,Vector=function(C)local E,F,G=string.match(C,"^ *([^%s,]+) *, *([^%s,]+) *, *([^%s,]+) *$")return tonumber(E)!=nil&&tonumber(F)!=nil&&tonumber(G)!=nil end,["4D Vector"]=function(C)local E,F,G,H=string.match(C,"^ *([^%s,]+) *, *([^%s,]+) *, *([^%s,]+) *, *([%d.]+) *$")return tonumber(E)!=nil&&tonumber(F)!=nil&&tonumber(G)!=nil&&tonumber(H)!=nil end,String=function(C)return true end}D.Angle=D.Vector;local I={Number="12.34",["2D Vector"]="12.34, 12.34",Vector="12.34, 12.34, 12.34",["4D Vector"]="12.34, 12.34, 12.34, 12.34",String="Hello World",Angle="90, 180, 360"}local function J(K,B)if D[B]then return D[B](K)else return false end end;local L={{1,D.Number},{5,D["2D Vector"]},{4,D.Vector},{6,D["4D Vector"]},{2,D.String}}local function M(K,N)for d=1,#L do local O=L[d][1]local P=L[d][2]if P(K)then N:ChooseOptionID(O)return end end end;local function Q(R,S)local H=R:GetWide()b[S]={DataType="NORMAL",Value=0}local T=vgui.Create("DCollapsibleCategory",R)T:SetWide(H)T:SetLabel("Value "..S)T:Dock(TOP)T.id=S;local U=vgui.Create("DPanel",T)U.Paint=function()end;U:Dock(TOP)local _=vgui.Create("DPanel",U)_:Dock(RIGHT)_.Paint=function()end;_:SetSize(16,14)local V=vgui.Create("DImageButton",_)V:SetImage("icon16/delete.png")V:SizeToContents()V:SetPos(0,4)V:SetToolTip("Remove this value")V.DoClick=function()if#b==1 then r:DoClick()return end;local S=T.id;n[S]:Remove()table.remove(n,S)table.remove(b,S)o:SetValue(math.max(o:GetValue()-1,1))for d=S,math.Clamp(math.Round(o:GetValue()),1,20)do n[d].id=d;n[d]:SetLabel("Value "..d)end end;local N=vgui.Create("DComboBox",U)N:Dock(FILL)N:DockMargin(2,2,2,2)T.typeSelection=N;N.OnSelect=function(R,W,X)b[T.id].DataType=j[X]||"NORMAL"s()local C,B=b[T.id].Value,b[T.id].DataType;B=k[B]||"Number"if J(C,B)then T.valueEntry:SetToolTip()T.parseIcon:SetImage("icon16/accept.png")else T.valueEntry:SetToolTip("This is not a valid "..string.lower(B)..".\nExample: '"..(I[B]||"No example available for this type").."'.")T.parseIcon:SetImage("icon16/cancel.png")end end;for w,x in pairs(l)do N:AddChoice(x)end;local Y=vgui.Create("DTextEntry",T)T.valueEntry=Y;Y:Dock(TOP)Y:DockMargin(2,2,2,2)Y.OnChange=function(R)b[T.id].Value=R:GetValue()local C,B=b[T.id].Value,b[T.id].DataType;B=k[B]||"Number"if p:GetChecked()then M(C,N)else if J(C,B)then T.valueEntry:SetToolTip()T.parseIcon:SetImage("icon16/accept.png")else T.valueEntry:SetToolTip("This is not a valid "..string.lower(B)..".\nExample: '"..(I[B]||"No example available for this type").."'.")T.parseIcon:SetImage("icon16/cancel.png")end end end;local Z=Y.OnLoseFocus;Y.OnLoseFocus=function(R)b[T.id].Value=R:GetValue()s()Z(R)end;local a0=vgui.Create("DImage",Y)T.parseIcon=a0;a0:Dock(RIGHT)a0:DockMargin(2,2,2,2)a0:SetImage("icon16/accept.png")a0:SizeToContents()N:ChooseOptionID(1)return T end;net.Receive("wire_value_values",function(a1)t(g())if!IsValid(o)then return end;y()end)local function a2(a3)local u={}if isnumber(next(a3))then for d=1,#a3,2 do table.insert(u,{DataType=a3[d],Value=a3[d+1]})end else for d=1,table.Count(a3),2 do table.insert(u,{DataType=a3[tostring(d)],Value=a3[tostring(d+1)]})end end;t(u)end;function TOOL.BuildCPanel(R)local a4=vgui.Create("ControlPresets",R)a4.OnSelect=function(self,W,X,a3)if!a3 then return end;a2(a3)y()end;a4.QuickSaveInternal=function(self,a5)local a6={}for _,x in ipairs(b)do table.insert(a6,x.DataType)table.insert(a6,x.Value)end;presets.Add("wire_value",a5,a6)a4:Update()end;a4:SetPreset("wire_value")R:AddPanel(a4)WireToolHelpers.MakeModelSizer(R,"wire_value_modelsize")ModelPlug_AddToCPanel(R,"Value","wire_value",true)local a7=R:Button("Reset Values")r=a7;p=R:CheckBox("Automatically guess types","wire_value_guesstype")p:SetToolTip([[When enabled, the type dropdown will automatically be updated as you type with
guessed types. It's unable to guess angles because they look the same as vectors.

The green check you see inside the text boxes is the validator. If the value you write
is a value that can't be parsed as the selected type, the green check will turn into
a red X to indicate there's an error (You can then hover your cursor over the text box
to see what's wrong).

There will never be an error if auto type guessing is enabled (unless you manually
set the type), because it will automatically set the type to a string when all other
types fail.]])local H,_=R:GetSize()local a8=vgui.Create("DNumSlider")o=a8;R:AddItem(a8)a8:SetText("Amount:")a8:SetMin(1)a8:SetMax(20)a8:SetDark(true)a8:SetDecimals(0)local a9=0;a7.DoClick=function(R)a8:SetValue(1)for w,x in pairs(n)do x:Remove()n[w]=nil end;for w,x in pairs(b)do b[w]=nil end;a9=0;a8:OnValueChanged(1)s()end;a8.OnValueChanged=function(a8,X)local X=math.Clamp(math.Round(tonumber(X)),1,20)if X!=a9 then if X>a9 then for d=a9+1,X,1 do n[d]=Q(q,d)end elseif X<a9 then for d=X+1,a9,1 do b[d]=nil;if IsValid(n[d])then n[d]:Remove()end;n[d]=nil end end;q:SetTall(X*73)a9=X;s()end end;q=vgui.Create("DPanel")q.Paint=function()end;R:AddItem(q)q:SetTall(73)y()s()local T=vgui.Create("DPanel")R:AddItem(T)T.Paint=function()end;T:SetTall(16)local aa=vgui.Create("DImageButton",T)aa:SetImage("icon16/add.png")aa:SizeToContents()aa:SetToolTip("Add a new value")function T.PerformLayout()aa:Center()end;function aa.DoClick()o:SetValue(math.min(o:GetValue()+1,20))end end end
--addons/!lpakr_out/lua/wire/stools/vthruster.lua:
WireToolSetup.setCategory("Physics/Force")WireToolSetup.open("vthruster","Vector Thruster","gmod_wire_vectorthruster",nil,"Vector Thrusters")if CLIENT then language.Add("Tool.wire_vthruster.name","Vector Thruster Tool (Wire)")language.Add("Tool.wire_vthruster.desc","Spawns a vector thruster for use with the wire system.")language.Add("WireVThrusterTool_Mode","Mode:")language.Add("WireVThrusterTool_Angle","Use Yaw/Pitch Inputs Instead")language.Add("WireVThrusterTool_LengthIsMul","Use Vector Length for Mul")TOOL.Information={{name="left_0",stage=0,text="Create/Update "..TOOL.Name},{name="left_1",stage=1,text="Set the Angle, hold Shift to lock to 45 degrees"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(10)TOOL.ClientConVar["force"]="1500"TOOL.ClientConVar["force_min"]="0"TOOL.ClientConVar["force_max"]="10000"TOOL.ClientConVar["model"]="models/jaanus/wiretool/wiretool_speed.mdl"TOOL.ClientConVar["bidir"]="1"TOOL.ClientConVar["soundname"]=""TOOL.ClientConVar["oweffect"]="fire"TOOL.ClientConVar["uweffect"]="same"TOOL.ClientConVar["owater"]="1"TOOL.ClientConVar["uwater"]="1"TOOL.ClientConVar["mode"]="0"TOOL.ClientConVar["angleinputs"]="0"TOOL.ClientConVar["lengthismul"]="0"function TOOL:LeftClick(a)local b=self:NumObjects()local c=self:GetOwner()if b==0 then if IsValid(a.Entity)&&a.Entity:IsPlayer()then return false end;if SERVER&&!util.IsValidPhysicsObject(a.Entity,a.PhysicsBone)then return false end;if CLIENT then return true end;local d=WireToolObj.LeftClick_Make(self,a,c)if isbool(d)then return d end;if IsValid(d)then d:GetPhysicsObject():EnableMotion(false)self:ReleaseGhostEntity()self:SetObject(1,a.Entity,a.HitPos,a.Entity:GetPhysicsObjectNum(a.PhysicsBone),a.PhysicsBone,a.HitNormal)self:SetObject(2,d,a.HitPos,d:GetPhysicsObject(),0,a.HitNormal)self:SetStage(1)end else if CLIENT then return true end;local e,f=self:GetEnt(1),self:GetEnt(2)local g=self:GetBone(1)local h=WireLib.Weld(f,e,g,true,false)local i=f:GetPhysicsObject()i:EnableMotion(true)undo.Create("WireVThruster")undo.AddEntity(f)undo.AddEntity(h)undo.SetPlayer(c)undo.Finish()c:AddCleanup("wire_vthrusters",f)c:AddCleanup("wire_vthrusters",h)self:ClearObjects()end;return true end;local j=0;function TOOL:Think()if self:NumObjects()>0 then else WireToolObj.Think(self)end end;if CLIENT then function TOOL:FreezeMovement()return self:GetStage()==1 end end;function TOOL:Holster()if self:NumObjects()>0&&IsValid(self:GetEnt(2))then self:GetEnt(2):Remove()end;self:ClearObjects()end;function TOOL.BuildCPanel(k)WireToolHelpers.MakePresetControl(k,"wire_vthruster")WireDermaExts.ModelSelect(k,"wire_vthruster_model",list.Get("ThrusterModels"),4,true)local l={["#No Effects"]="none",["#Flames"]="fire",["#Plasma"]="plasma",["#Smoke"]="smoke",["#Smoke Random"]="smoke_random",["#Smoke Do it Youself"]="smoke_diy",["#Rings"]="rings",["#Rings Growing"]="rings_grow",["#Rings Shrinking"]="rings_shrink",["#Bubbles"]="bubble",["#Magic"]="magic",["#Magic Random"]="magic_color",["#Magic Do It Yourself"]="magic_diy",["#Colors"]="color",["#Colors Random"]="color_random",["#Colors Do It Yourself"]="color_diy",["#Blood"]="blood",["#Money"]="money",["#Sperms"]="sperm",["#Feathers"]="feather",["#Candy Cane"]="candy_cane",["#Goldstar"]="goldstar",["#Water Small"]="water_small",["#Water Medium"]="water_medium",["#Water Big"]="water_big",["#Water Huge"]="water_huge",["#Striderblood Small"]="striderblood_small",["#Striderblood Medium"]="striderblood_medium",["#Striderblood Big"]="striderblood_big",["#Striderblood Huge"]="striderblood_huge",["#More Sparks"]="more_sparks",["#Spark Fountain"]="spark_fountain",["#Jetflame"]="jetflame",["#Jetflame Do It Yourself"]="jetflame_diy",["#Jetflame Blue"]="jetflame_blue",["#Jetflame Red"]="jetflame_red",["#Jetflame Purple"]="jetflame_purple",["#Comic Balls"]="balls",["#Comic Balls Random"]="balls_random",["#Comic Balls Fire Colors"]="balls_firecolors",["#Souls"]="souls",["#Fire and Smoke"]="fire_smoke",["#Fire and Smoke Huge"]="fire_smoke_big",["#5 Growing Rings"]="rings_grow_rings",["#Color and Magic"]="color_magic"}local m=vgui.Create("DCollapsibleCategory")m:SetSize(0,50)m:SetExpanded(0)m:SetLabel("Overwater Effect List")local n=vgui.Create("MatSelect",m)n:SetItemWidth(128)n:SetItemHeight(128)n:SetConVar("wire_vthruster_oweffect")for o,p in pairs(l)do n:AddMaterialEx(o,"gui/thrustereffects/"..p,p,{wire_vthruster_oweffect=p})end;m:SetContents(n)k:AddItem(m)l["#Same as over water"]="same"local q=vgui.Create("DCollapsibleCategory")q:SetSize(0,50)q:SetExpanded(0)q:SetLabel("Underwater Effect List")local r=vgui.Create("MatSelect",q)r:SetItemWidth(128)r:SetItemHeight(128)r:SetConVar("wire_vthruster_uweffect")for o,p in pairs(l)do r:AddMaterialEx(o,"gui/thrustereffects/"..p,p,{wire_vthruster_uweffect=p})end;q:SetContents(r)k:AddItem(q)local s={}for t,u in pairs(list.Get("ThrusterSounds"))do s[t]={}for v,w in pairs(u)do s[t]["wire_v"..v]=w end end;k:AddControl("ListBox",{Label="#Thruster_Sounds",Options=s})k:NumSlider("#WireThrusterTool_force","wire_vthruster_force",1,10000,2)k:NumSlider("#WireThrusterTool_force_min","wire_vthruster_force_min",-10000,10000,2):SetTooltip("#WireThrusterTool_force_min.help")k:NumSlider("#WireThrusterTool_force_max","wire_vthruster_force_max",-10000,10000,2)k:CheckBox("#WireThrusterTool_bidir","wire_vthruster_bidir")k:CheckBox("#WireThrusterTool_owater","wire_vthruster_owater")k:CheckBox("#WireThrusterTool_uwater","wire_vthruster_uwater")k:AddControl("ListBox",{Label="#WireVThrusterTool_Mode",Options={["#XYZ Local"]={wire_vthruster_mode="0"},["#XYZ World"]={wire_vthruster_mode="1"},["#XY Local, Z World"]={wire_vthruster_mode="2"}}})k:CheckBox("#WireVThrusterTool_Angle","wire_vthruster_angleinputs")k:CheckBox("#WireVThrusterTool_LengthIsMul","wire_vthruster_lengthismul")end;list.Set("ThrusterModels","models/jaanus/wiretool/wiretool_speed.mdl",{})
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/witchergate.lua:
AddCSLuaFile()TOOL.Category="Travel"TOOL.Name="Witcher Gates"TOOL.ClientConVar["key"]=""TOOL.ClientConVar["r"]="167"TOOL.ClientConVar["g"]="100"TOOL.ClientConVar["b"]="30"TOOL.ClientConVar["spawnenabled"]="1"TOOL.Information={{name="left",stage=0},{name="left_next",stage=1,icon="gui/lmb.png"}}cleanup.Register("portalpairs")function TOOL:LeftClick(a)if IsValid(a.Entity)&&a.Entity:IsPlayer()then return false end;if CLIENT then return true end;if!self:GetOwner():CheckLimit("portalpairs")then return false end;if self:GetStage()==0 then local b=a.Entity:GetPhysicsObjectNum(a.PhysicsBone)self:ClearObjects()self:SetObject(1,a.Entity,a.HitPos,b,a.PhysicsBone,a.HitNormal)if a.HitNormal.z==1 then self.y1=self:GetOwner():EyeAngles().y end;self:SetStage(1)else local b=a.Entity:GetPhysicsObjectNum(a.PhysicsBone)local c=Color(self:GetClientInfo("r"),self:GetClientInfo("g"),self:GetClientInfo("b"))local d=self:GetClientInfo("key")self:SetObject(2,a.Entity,a.HitPos,b,a.PhysicsBone,a.HitNormal)local e=ents.Create("witcher_door")local f=ents.Create("witcher_door")e:SetPropOwner(self:GetOwner(),true)f:SetPropOwner(self:GetOwner(),true)local g=self:GetNormal(1)local h=g:Angle()if self.y1 then h.y=self.y1+180 end;h:RotateAroundAxis(h:Right(),-90)h:RotateAroundAxis(h:Up(),-90)e:SetPos(self:GetPos(1)+g*3)e:Spawn()e:SetAngles(h)e:SetNotSolid(true)e:SetColour(c)e:SetOther(f)e.ToggleButton=numpad.OnDown(self:GetOwner(),tonumber(d),"PortalToggle",e)if IsValid(self:GetEnt(1))&&self:GetEnt(1):GetClass()=="prop_physics"then e:SetParent(self:GetEnt(1))else e:PhysicsDestroy()end;local i=self:GetNormal(2):Angle()if a.HitNormal.z==1 then i.y=self:GetOwner():EyeAngles().y+180 end;i:RotateAroundAxis(i:Right(),-90)i:RotateAroundAxis(i:Up(),-90)f:SetPos(self:GetPos(2)+self:GetNormal(2)*3)f:Spawn()f:SetAngles(i)f:SetNotSolid(true)f:SetColour(c)f:SetOther(e)f.ToggleButton=numpad.OnDown(self:GetOwner(),tonumber(d),"PortalToggle",f)if tobool(self:GetClientInfo("spawnenabled"))then e:Enable()f:Enable()end;if IsValid(self:GetEnt(2))&&self:GetEnt(2):GetClass()=="prop_physics"then f:SetParent(self:GetEnt(2))else f:PhysicsDestroy()end;undo.Create("Portal Pair")undo.AddEntity(e)undo.AddEntity(f)undo.SetPlayer(self:GetOwner())undo.SetCustomUndoText("Undone Portal Pair")undo.Finish()self:SetStage(0)self:ClearObjects()self.y1=nil;self:GetOwner():AddCount("portalpairs",e)self:GetOwner():AddCleanup("portalpairs",e)self:GetOwner():AddCleanup("portalpairs",f)end;return true end;function TOOL:RightClick(a)end;function TOOL:DrawHUD()local a=self:GetOwner():GetEyeTrace()local h=a.HitNormal:Angle()local j=a.HitNormal:Angle()local k=a.HitNormal.z==1;local l=Angle(0,self:GetOwner():EyeAngles().y,0)if k then h.y=self:GetOwner():EyeAngles().y+180 end;h:RotateAroundAxis(h:Right(),-90)h:RotateAroundAxis(h:Up(),-90)cam.Start3D()cam.Start3D2D(a.HitPos+a.HitNormal*2-(k&&l:Right()*-23||j:Right()*23)-(k&&l:Forward()||j:Up())*47,h,1)surface.SetDrawColor(0,255,0,30)surface.DrawRect(0,0,46,92)cam.End3D2D()cam.End3D()end;function TOOL:Think()end;function TOOL:Holster()self:ClearObjects()self:SetStage(0)end;function TOOL.BuildCPanel(m)m:AddControl("Header",{Description="#tool.witchergate.desc"})m:AddControl("Numpad",{Label="#tool.witchergate.key",Command="witchergate_key"})m:AddControl("Color",{Label="#tool.witchergate.color",Red="witchergate_r",Green="witchergate_g",Blue="witchergate_b"})m:AddControl("CheckBox",{Label="#tool.witchergate.spawnon",Command="witchergate_spawnenabled"})end;if CLIENT then language.Add("tool.witchergate.name","Witcher Gates")language.Add("tool.witchergate.left","Select the spot for the first portal")language.Add("tool.witchergate.left_next","Select the spot for the second portal")language.Add("tool.witchergate.desc","Create linked pairs of portals to allow easy travel")language.Add("tool.witchergate.key","Key to toggle the pair")language.Add("tool.witchergate.color","Portal color")language.Add("tool.witchergate.spawnon","Start On")language.Add("Cleaned_portalpairs","Cleaned up all Portal Pairs")language.Add("Cleanup_portalpairs","Portal Pairs")end
--addons/!lpakr_out/lua/weapons/sup_a280.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dc12u/cl_init.lua:
include'shared.lua'function SWEP:DoCustomFireSound()return self:IsLaserMode()end
--addons/!lpakr_out/lua/weapons/sup_dc12u/shared.lua:
SWEP.DrawCrosshair=false;SWEP.FadeCrosshairOnAim=false;SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(0,-2.5,0.4)SWEP.AimPos=Vector(-1,2,0)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-4,0)SWEP.SprintAng=Vector(-35,30,-20)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='DC-12U'SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(24,-0.3,-4.5)SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto','laser'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/dc12u.mdl'SWEP.WorldModel='models/galactic/weapons/vmodels/dc12u.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=100;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.2;SWEP.FireSound=Sound'blaster.fire'SWEP.RecoilAngle=Angle(-1.2,0,0)SWEP.HipSpread=0.03;SWEP.AimSpread=0.015;SWEP.VelocitySensitivity=10;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.007;SWEP.SpreadCooldown=0.13;SWEP.Shots=1;SWEP.Damage=45;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.UIPosition=Vector(-5,-40,0)SWEP.UIAngle=Angle(0,90,0)SWEP.LaserSoundLoop='lasers.fire'SWEP.Range=150;sound.Add({name='lasers.fire',channel=CHAN_WEAPON,volume=.35,level=90,pitch=100,sound='thrusters/hover00.wav'})function SWEP:DoCustomFire(a,b,c)if CLIENT then return self:IsLaserMode()end;if self:IsLaserMode()then if self.LaserStarted then self:TurnOffLaser()else self:TurnOnLaser()end;return true else return false end end;function SWEP:FireAnimFunc()end;function SWEP:IsLaserMode()return self.FireMode=='laser'end
--addons/!lpakr_out/lua/weapons/sup_dc17.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dc17m_shotgun.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.AimPos=Vector(0,-1,0)SWEP.AimAng=Vector(0,0,0)SWEP.RestPos=Vector(0,-.5,.5)SWEP.SprintPos=Vector(5,-3,1)SWEP.SprintAng=Vector(-15,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;SWEP.UIPosition=Vector(0,0,0)SWEP.UIAngle=Angle(0,90,0)SWEP.PrintName='DC-17m Shotgun'SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=4;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(16,-1.5,-4)SWEP.IsShotgun=true;SWEP.FadeCrosshairOnAim=false;SWEP.PlayBackRate=1;SWEP.PlayBackRateSV=1;SWEP.BulletDiameter=5;SWEP.CaseLength=10;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto','semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc17m.mdl'SWEP.WorldModel='models/weapons/w_dc17m_at.mdl'SWEP.Bodygroups='020'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.AmmoOffset=Vector(20,0,-2)SWEP.Primary.ClipSize=8;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=.8;SWEP.FireSound=Sound'blaster.fire_shotgun'SWEP.ReloadSound=Sound'blaster.reload_dc17m'SWEP.Recoil=2;SWEP.RecoilAngle=Angle(-1,0,0)SWEP.RecoilAngleSpread=Angle(.2,0,0)SWEP.ShotgunReload=false;SWEP.ReloadStartWait=0.6;SWEP.ReloadFinishWait=1.1;SWEP.ReloadShellInsertWait=0.6;SWEP.Chamberable=false;SWEP.HipSpread=0;SWEP.AimSpread=0;SWEP.ClumpSpread=.1;SWEP.VelocitySensitivity=2.2;SWEP.MaxSpreadInc=0.01;SWEP.SpreadPerShot=0.01;SWEP.SpreadCooldown=1.03;SWEP.Shots=6;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.Damage=55;SWEP.FireDistance=800;SWEP.FireDistanceDegrade=10;SWEP.FireDistanceDegradeMulti=8
--addons/!lpakr_out/lua/weapons/sup_dc17mbr.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_de10.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(.5,-2,.5)SWEP.AimPos=Vector(-3.79,-9.5,.525)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-11,-5)SWEP.SprintAng=Vector(50,0,2)SWEP.ViewModelMovementScale=.5;SWEP.AimSpeed=30;SWEP.IconLetter='b'SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=false;SWEP.ZoomAmount=5;SWEP.AdjustableZoom=false;SWEP.MinZoom=2;SWEP.MaxZoom=5;SWEP.ZoomSteps=5;SWEP.ScopeOverrideMaterialIndex=1;SWEP.ScopeFOV=20;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=true;SWEP.ScopedBlur=false end;sound.Add({name='blaster.de10_fire',channel=CHAN_WEAPON,volume=.35,level=90,pitch={95,105},sound='weapons/de10_fire.wav'})sound.Add({name='blaster.de10_reload',channel=CHAN_WEAPON,volume=.35,level=90,pitch={95,105},sound='weapons/de10_reload.wav'})SWEP.PrintName='DE-10 Side Arm'SWEP.ReloadSound='blaster.de10_reload'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(22,1,-.8)SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.HasScope=true;SWEP.FadeCrosshairOnAim=true;SWEP.PreventQuickScoping=true;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.SprintingEnabled=true;SWEP.NormalHoldType='pistol'SWEP.RunHoldType='normal'SWEP.FireModes={'semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=2;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supde10.mdl'SWEP.WorldModel='models/weapons/w_de10.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=12;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=false;SWEP.FireDelay=.8;SWEP.FireSound=Sound'blaster.de10_fire'SWEP.Recoil=2;SWEP.RecoilAngle=Angle(-3,0,0)SWEP.HipSpread=0.01;SWEP.AimSpread=0.005;SWEP.VelocitySensitivity=2;SWEP.MaxSpreadInc=0;SWEP.SpreadPerShot=0;SWEP.SpreadCooldown=0;SWEP.Shots=1;SWEP.Damage=115;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.UIPosition=Vector(0,-60,2)SWEP.UIAngle=Angle(0,0,0)
--addons/!lpakr_out/lua/weapons/sup_dt57.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dt57.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(-.5,-2,.5)SWEP.AimPos=Vector(0,-3,.5)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-3,1)SWEP.SprintAng=Vector(-25,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;SWEP.PrintName='DT-57'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/v_dt57.mdl'SWEP.WorldModel='models/galactic/weapons/wmodels/w_dt57.mdl'SWEP.AmmoOffset=Vector(20,0,-4)SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=60;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.125;SWEP.FireSound=Sound'blaster.fire_smg'SWEP.ReloadSound=Sound'blaster.reload_smg'SWEP.Recoil=.2;SWEP.RecoilAngle=Angle(-1.0,-.2,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.03;SWEP.AimSpread=.03;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=42;SWEP.DeployTime=0;SWEP.ShowHands=true;SWEP.FadeCrosshairOnAim=false;SWEP.UIPosition=Vector(0,-55,0)SWEP.UIAngle=Angle(0,-90,0)
--addons/!lpakr_out/lua/weapons/sup_ee3.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,-3,-0.4)SWEP.AimPos=Vector(-4.9775,-5,1.303)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-4,0)SWEP.SprintAng=Vector(-35,30,-20)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='EE-3'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=1;SWEP.ViewbobEnabled=true;SWEP.Akimbo=true;SWEP.AmmoOffset=Vector(30,-2,-5)SWEP.AmmoOffsetAng=Angle(0,-90,90)SWEP.PlayBackRate=2;SWEP.PlayBackRateSV=2;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.SprintingEnabled=true;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'3burst'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/EE3.mdl'SWEP.WorldModel='models/weapons/w_EE3.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=72;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.06;SWEP.FireSound=Sound'blaster.fire'SWEP.Recoil=.5;SWEP.RecoilAngle=Angle(-1.3,-.25,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.SpreadOnAim=true;SWEP.HipSpread=.02;SWEP.AimSpread=.002;SWEP.VelocitySensitivity=1.2;SWEP.MaxSpreadInc=0.15;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=43;SWEP.DeployTime=1;SWEP.FadeCrosshairOnAim=true;SWEP.UIPosition=Vector(-5,-40,0)SWEP.UIAngle=Angle(0,90,0)SWEP.ShowHands=false;SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=true;SWEP.ZoomAmount=15;SWEP.AdjustableZoom=true;SWEP.MinZoom=1;SWEP.MaxZoom=35;SWEP.ZoomSteps=5;SWEP.ScopeOverrideMaterialIndex=1;SWEP.ScopeFOV=15;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=false;SWEP.ScopedBlur=false;SWEP.HasScope=true;SWEP.PreventQuickScoping=true
--addons/!lpakr_out/lua/weapons/sup_grenade_dioxis.lua:
AddCSLuaFile()SWEP.Base='weapon_grenadebase'SWEP.PrintName='Dioxis Grenade'SWEP.Author='Scott'SWEP.Purpose='It\'s a Dioxis grenade'SWEP.Spawnable=true;SWEP.Category='SUP Weapons'SWEP.GrenadeEnt='rp_grenade_dioxis'SWEP.HoldType='grenade'SWEP.Impact=false;SWEP.Range=90000;SWEP.Damage=75
--addons/!lpakr_out/lua/weapons/sup_mandorifle.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_rpg_falcon.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_stealthblaster.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_t21b.lua:
debug.Trace()
--addons/!lpakr_out/lua/weapons/sup_zendo.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,-1,0)SWEP.AimPos=Vector(-4.97,-3,-0.059)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-3,1)SWEP.SprintAng=Vector(-25,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='Verpine Shatter Rifle'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=1;SWEP.ViewbobEnabled=true;SWEP.Akimbo=true;SWEP.AmmoOffset=Vector(20,0,-4)SWEP.AmmoOffsetAng=Angle(0,-90,90)SWEP.PlayBackRate=2;SWEP.PlayBackRateSV=2;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.SprintingEnabled=nil;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'3burst'}SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/jalmaries/zendogun/zendoPM_Gun_byJalmaries_v.mdl'SWEP.WorldModel='models/jalmaries/zendogun/zendoPM_Gun_byJalmaries_w.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=72;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.06;SWEP.FireSound=Sound'blaster.zendo_smg'SWEP.ReloadSound=Sound'blaster.reload_smg'SWEP.Recoil=.5;SWEP.RecoilAngle=Angle(-1.3,-.25,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.02;SWEP.AimSpread=.002;SWEP.VelocitySensitivity=1.2;SWEP.MaxSpreadInc=0.15;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=43;SWEP.DeployTime=1;SWEP.FadeCrosshairOnAim=true;SWEP.SpreadOnAim=true;SWEP.ShowHands=false;SWEP.UIPosition=Vector(0,-55,0)SWEP.UIAngle=Angle(0,-90,0)SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'SWEP.HasScope=true;SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=false;SWEP.ZoomAmount=15;SWEP.AdjustableZoom=true;SWEP.MinZoom=1;SWEP.MaxZoom=35;SWEP.ZoomSteps=5;SWEP.ScopeOverrideMaterialIndex=1;SWEP.ScopeFOV=10;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=false;SWEP.ScopedBlur=false;SWEP.ScopeRotate=0;sound.Add({name='blaster.zendo_smg',channel=CHAN_WEAPON,volume=.75,level=90,pitch={95,100},sound='galactic/weapons/zendo/zendo_fire.wav'})
--addons/!lpakr_out/lua/weapons/swb_base/sh_bonemods.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swb_base/sh_bullets.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swb_base/sh_cosmetics.lua:
SWEP.SkinSlotId=0;function SWEP:GetCharmBody()if self.CharmGroupId then return self.CharmGroupId end;for a,b in pairs(self:GetBodyGroups())do if b.name=='clip'then self.CharmGroupId=b.id;return b.id end end end;function SWEP:LoadSkins()if info.NoCosmetics then return end;local c=cosmetics.GetEquipped(self:GetOwner(),self:GetClass():Replace('_dual',''),cosmetics.WEAPON,cosmetics.SLOT.WEAPON.SKIN)if c then self:SetCosmetics(c)end;local c=cosmetics.GetEquipped(self:GetOwner(),'charm',cosmetics.WEAPON,cosmetics.SLOT.WEAPON.CHARM)if c then self:SetCosmetics(c)end end;function SWEP:SetCosmetics(c)if info.NoCosmetics then return end;local d=self:GetOwner()if!IsValid(d)then return end;if c:GetSlot()==cosmetics.SLOT.WEAPON.SKIN then if c:GetMaterial()then self.SubMaterials={[self.SkinSlotId]=c:GetMaterial():GetName()}elseif c:GetSubMaterials()then self.SubMaterials=c:GetSubMaterials()end;if c:GetWorldSubMaterials()then self.WorldSubMaterials=c:GetWorldSubMaterials()else self.WorldSubMaterials=self.SubMaterials end elseif c:GetSlot()==cosmetics.SLOT.WEAPON.CHARM then local e=c:IsWeaponAttachment()local f=self:GetCharmBody()if f then end;self:AddAttachment('CHARM',e,false,nil,'charm')end end;function SWEP:RemoveCosmetics(c)self:SetSubMaterial()self.Draw=self.O_Draw;if c:GetSlot()==cosmetics.SLOT.WEAPON.SKIN then self.SubMaterials=nil elseif c:GetSlot()==cosmetics.SLOT.WEAPON.CHARM then local f=self:GetCharmBody()if f then self:SetBodygroup(f,0)end;self:RemoveAttachment('CHARM')end end
--addons/!lpakr_out/lua/weapons/swb_base/sh_attachments.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_bombtool.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_building.lua:
AddCSLuaFile()SWEP.PrintName='Building Kit'SWEP.Author='Scott'SWEP.DrawAmmo=false;SWEP.HoldType='normal'SWEP.Category='SUP Weapons'SWEP.UseHands=false;SWEP.Slot=3;SWEP.SlotPos=5;SWEP.Spawnable=true;SWEP.ViewModelFOV=50;SWEP.WorldModel='models/galactic/repairtool/w_repairtool.mdl'SWEP.ViewModel='models/galactic/repairtool/v_repairtool.mdl'SWEP.Primary.Damage=0;SWEP.Primary.NumShots=0;SWEP.Primary.Cone=0;SWEP.Primary.Delay=0;SWEP.Primary.ClipSize=0;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.Primary.Ammo='none'SWEP.Primary.TakeAmmo=0;SWEP.Primary.Tracer=0;SWEP.Primary.TracerName='none'SWEP.Secondary.Ammo='none'SWEP.ViewModelFlip=false;SWEP.AnimPrefix='rpg'SWEP.DrawCrosshair=false;function SWEP:Initialize()self:SetHoldType'normal'end;function SWEP:PrimaryAttack()self:SetNextPrimaryFire(CurTime()+1)if!CLIENT||!IsFirstTimePredicted()||self:GetOwner()!=LocalPlayer()then return end;self:DisplayMenu()srp.build.RequestSpawn()end;function SWEP:DisplayMenu()if!IsValid(srp.build.ui)then srp.build.OpenMenu()end end;function SWEP:SecondaryAttack()self:SetNextSecondaryFire(CurTime()+.1)if!CLIENT||!IsFirstTimePredicted()||self:GetOwner()!=LocalPlayer()then return end;self:DisplayMenu()if self:GetOwner():KeyDown(IN_WALK)then srp.build.ui:Previous()else srp.build.ui:Next()end end;function SWEP:Deploy()self:SetHoldType'normal'if CLIENT&&self:GetOwner()==LocalPlayer()then self:DisplayMenu()end end;function SWEP:Holster()if SERVER then elseif self:GetOwner()==LocalPlayer()then srp.build.CloseMenu()end;return true end;function SWEP:OnRemove()if CLIENT&&self:GetOwner()==LocalPlayer()then srp.build.CloseMenu()end end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/weapons/weapon_claw_damage.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_headtaker.lua:
AddCSLuaFile()SWEP.Base='drgbase_weapon'SWEP.PrintName='Head Taker'SWEP.Class='weapon_headtaker'SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.Spawnable=false;SWEP.AdminOnly=false;SWEP.Slot=2;SWEP.SlotPos=0;SWEP.WorldModel=Model'models/weapons/c_models/c_headtaker/c_headtaker.mdl'SWEP.ViewModel=Model'models/weapons/c_models/c_headtaker/c_headtaker.mdl'SWEP.HoldType='melee'SWEP.Primary.Damage=-1;SWEP.Primary.Bullets=-1;SWEP.Primary.Spread=0;SWEP.Primary.Automatic=false;SWEP.Primary.Delay=5;SWEP.Primary.Recoil=0;SWEP.DrGBase_Melee=true;SWEP.Primary.Ammo='melee'SWEP.Primary.Cost=1;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;DrGBase.AddWeapon(SWEP)
--addons/ssrp_lfs/lua/weapons/weapon_lfsmissilelauncher.lua:
AddCSLuaFile()

SWEP.Category = "Other"
SWEP.PrintName = "PLX-1 Porta-Launcher"
SWEP.Author = "Luna"
SWEP.Slot = 2
SWEP.SlotPos = 9
SWEP.DrawWeaponInfoBox 	= false
SWEP.BounceWeaponIcon = false
SWEP.Category = "SUP Weapons"

SWEP.Spawnable = true
SWEP.AdminSpawnable	= false
SWEP.WorldModel = 'models/galactic/weapons/wmodels/plx_launcher.mdl'
SWEP.ViewModel = 'models/galactic/weapons/vmodels/plx_launcher.mdl'

SWEP.UseHands = true
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV = 53
SWEP.Weight = 42
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = true
SWEP.HoldType = "rpg"

SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 8
SWEP.Primary.Automatic	= false
SWEP.Primary.Ammo = "ammo_e60r"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

local fire = Sound 'weapons/sw_rocket/rocket_fire.wav'
local reload = Sound 'weapons/dc17m_at_reload.wav'
local no_angle = Angle()
local pitch_90 = Angle(90,0,0)

local NextFind = 0
local AllPlanes = {}

local teamColors = {
	[0] = Color( 0, 255, 0, 255 ),
	Color( 0, 127, 255, 255 ),
	Color( 255, 0, 0, 255 ),
}

function SWEP:SetupDataTables()
end

function SWEP:Initialize()
	self:SetHoldType( self.HoldType )
end

function SWEP:GetTarget()
	self.FoundVehicles = {}

	for k, v in pairs( LVS:GetVehicles() ) do
		table.insert( self.FoundVehicles, v )
	end

	local owner = self:GetOwner()
	local AimForward = owner:GetAimVector()
	local startpos = owner:GetShootPos()

	local Vehicles = {}
	local ClosestEnt = NULL
	local ClosestDist = 0

	for k, v in pairs( self.FoundVehicles  ) do
		if IsValid( v ) then
			local sub = (v:GetPos() - startpos)
			local toEnt = sub:GetNormalized()
			local dist = sub:Length()
			local Ang = math.acos( math.Clamp( AimForward:Dot( toEnt ) ,-1,1) ) * (180 / math.pi)

			if Ang < 30 and dist < 10000 and self:CanSee( v ) then
				table.insert( Vehicles, v )

				local stuff = WorldToLocal( v:GetPos(), no_angle, startpos, owner:EyeAngles() + pitch_90 )
				stuff.z = 0
				local dist = stuff:Length()

				if not IsValid( ClosestEnt ) then
					ClosestEnt = v
					ClosestDist = dist
				end

				if dist < ClosestDist then
					ClosestDist = dist
					if ClosestEnt ~= v then
						ClosestEnt = v
					end
				end
			end
		else
			self.FoundVehicles[k] = nil
		end
	end

	self.ClosestEnt = ClosestEnt
	return ClosestEnt
end

function SWEP:GetClosestEnt()
	return self.ClosestEnt
end

function SWEP:ResetTarget(ent)
	self.Locked = false
	self.FindTime = nil
	self.LastLockedEnt = ent

	if self.TrackSND then
		self.TrackSND:Stop()
		self.TrackSND = nil
	end

	if self.LockSND then
		self.LockSND:Stop()
		self.LockSND = nil
	end
end

function SWEP:Think()
	local ent = self:GetTarget()
	local owner = self:GetOwner()

	if not IsValid(ent) or ent ~= self.LastLockedEnt or self:Clip1() == 0 then
		self:ResetTarget(ent)
	end

	if IsValid(ent) and not self.Locked then
		if not self.TrackSND and SERVER then
			self.TrackSND = CreateSound(self.Owner, "lfs/radar_track.wav")
			self.TrackSND:PlayEx( 0, 100 )
			self.TrackSND:ChangeVolume( 0.5, 2 )
		end

		self.FindTime = self.FindTime or CurTime() + 3

		if self.FindTime < CurTime() then
			self.Locked = true

			if not self.LockSND and SERVER then
				self.LockSND = CreateSound(self.Owner, "lfs/radar_lock.wav")
				self.LockSND:PlayEx( 0, 100 )
				self.LockSND:ChangeVolume( 0.5, 2 )
			end
		end
	end
end

function SWEP:CanSee( entity )
	local pos = entity:GetPos()
	local owner = self:GetOwner()

	local tr = util.TraceLine({
		start = owner:GetShootPos(),
		endpos = pos,
		filter = function( ent )
			if ent == owner then
				return false
			end
			return true
		end
	})

	return (tr.HitPos - pos):Length() < 500
end

local ang = Angle(-10, -5, 0)

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() or CLIENT then
		return
	end

	local LockOnTarget = self.Locked and self:GetClosestEnt()

	local owner = self:GetOwner()
	local startpos = owner:GetShootPos() + owner:EyeAngles():Right() * 10
	local projectile = ents.Create( "lvs_missile" )

	projectile:SetPos( startpos )
	projectile:SetAngles( self:GetForward():Angle() )
	projectile:SetParent( self )
	projectile:Spawn()
	projectile:Activate()

	if IsValid(LockOnTarget) then
		projectile.GetTarget = function( missile ) return LockOnTarget end
		projectile.GetTargetPos = function( missile )
			missile:FindTarget(self:GetPos(), LockOnTarget:GetForward(), 80, 17500)
			return LockOnTarget:GetPos() + VectorRand() * math.random(100, 100)
		end
	else
		projectile.GetTargetPos = function( missile )
			return missile:GetPos() + missile:GetForward() * 200
		end
	end

	projectile:SetAttacker(owner)
	projectile:SetSpeed(4000)
	projectile:SetDamage(600)
	projectile:SetRadius(450)
	projectile:Enable()
	projectile:EmitSound( "LVS.AAT.FIRE_MISSILE" )

	self:SetNextPrimaryFire( CurTime() + 4 )
	self:TakePrimaryAmmo( 1 )

	owner:EmitSound(fire)

	if IsValid(owner) and owner:IsPlayer() then
		owner:ViewPunch( ang )
	end
end

function SWEP:SecondaryAttack()
	return false
end

function SWEP:Deploy()
	self:SendWeaponAnim( ACT_VM_DRAW )
	self:SetNextPrimaryFire( CurTime() + 4 )
	return true
end

function SWEP:Reload()
	if self:Clip1() < self.Primary.ClipSize and self:GetOwner():GetAmmoCount( self.Primary.Ammo ) > 0 then
		self:DefaultReload( ACT_VM_RELOAD )
		self:SetNextPrimaryFire( CurTime() + 4 )
		self:ResetTarget()
	end
end

local function DrawCircle( X, Y, radius )
	local segmentdist = 360 / ( 2 * math.pi * radius / 2 )

	for a = 0, 360 - segmentdist, segmentdist do
		surface.DrawLine( X + math.cos( math.rad( a ) ) * radius, Y - math.sin( math.rad( a ) ) * radius, X + math.cos( math.rad( a + segmentdist ) ) * radius, Y - math.sin( math.rad( a + segmentdist ) ) * radius )
	end
end

function SWEP:Holster()
	self:ResetTarget()
	return true
end

function SWEP:OnDrop()
	self:ResetTarget()
end

function SWEP:OwnerChanged()
	self:ResetTarget()
end

local maxDistance = 10000
function SWEP:PaintPlaneIdentifier( ply )
	if NextFind < CurTime() then
		NextFind = CurTime() + 1
		AllPlanes = LVS:GetVehicles()
	end

	local MyPos = ply:GetPos()
	local MyTeam = ply:lvsGetAITeam()
	local startpos = ply:GetShootPos()

	for _, v in pairs( AllPlanes ) do
		if IsValid( v ) then
			local rPos = v:LocalToWorld( v:OBBCenter() )
			local Pos = rPos:ToScreen()
			local Dist = (MyPos - rPos):Length()

			if Dist < maxDistance then
				if not util.TraceLine( {start = startpos,endpos = rPos,mask = MASK_NPCWORLDSTATIC,} ).Hit then

					local Alpha = 255 * (1 - (Dist / 10000) ^ 2)
					local Team = v:GetAITEAM()
					local IndicatorColor = self.Locked and teamColors[2] or teamColors[Team] or teamColors[0]
					IndicatorColor.a = Alpha

					v:LVSHudPaintVehicleIdentifier( Pos.x, Pos.y, IndicatorColor, v )
				end
			end
		end
	end
end

function SWEP:DrawHUD()
	local ply = LocalPlayer()
	self:PaintPlaneIdentifier(ply)

	if self.Locked or not self.FindTime then
		return
	end

	local ent = self:GetClosestEnt()
	if not IsValid( ent ) then return end

	local pos = ent:LocalToWorld( ent:OBBCenter() )
	local scr = pos:ToScreen()
	draw.NoTexture()

	surface.SetDrawColor( 200, 0, 0, 255 )
	local percent = math.max((self.FindTime - CurTime()) / 3, 0)
	LVS:DrawDiamond(scr.x, scr.y, 25 + 20 * percent, 1 )
end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_cleaver.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dexter.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category='SUP Custom Weapons'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Dexter's Lightsabers"SWEP.Class="weapon_lightsaber_dexter"SWEP.DualWielded=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.DamageType=DMG_DISSOLVE;SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=Sound'lightsaber/darksaber_swing.wav'SWEP.UseOnSound=Sound'lightsaber/saber_on_kylo.wav'SWEP.UseOffSound=Sound'lightsaber/saber_off_kylo.wav'SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_dual_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dreadsk.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category='SUP Custom Weapons'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/galactic/weapons/electrostaff/electrostaff.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Kanshou&Bakuya"SWEP.Class="weapon_lightsaber_dreadsk"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.MaxForce=225;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.IgnoreHiltCosmetic=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Repulse","Force Push","Force Pull","Saber Throw"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=true;SWEP.NoGlow=true;SWEP.UseHilt="models/galactic/weapons/electrostaff/electrostaff.mdl"SWEP.UseLength=40;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.UseLoopSound="dread_loop"SWEP.UseSwingSound="dread_swing"SWEP.UseOnSound="dread_soundon"SWEP.UseOffSound="dread_soundoff"SWEP.DamageType=DMG_DISSOLVE;sound.Add({name='dread_loop',channel=CHAN_STATIC,volume=.85,level=80,pitch=100,sound='galactic/sabers/dread/dread_hum.wav'})sound.Add({name='dread_swing',channel=CHAN_STATIC,volume=.85,level=80,pitch=100,sound={'galactic/sabers/dread/dread_swing_01.wav','galactic/sabers/dread/dread_swing_02.wav','galactic/sabers/dread/dread_swing_03.wav','galactic/sabers/dread/dread_swing_04.wav'}})sound.Add({name='dread_soundon',channel=CHAN_WEAPON,volume=.85,level=80,pitch=100,sound='galactic/sabers/dread/dread_ignite.mp3'})sound.Add({name='dread_soundoff',channel=CHAN_WEAPON,volume=.85,level=80,pitch=100,sound='galactic/sabers/dread/dread_deignite.mp3'})SWEP.Base="wos_adv_single_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_event.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_falcon.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David + Scott"SWEP.Category='SUP Custom Weapons'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/keithsword/parts/keithsword.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Falcon Katana"SWEP.Class="weapon_lightsaber_falcon"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=65;SWEP.SaberBurnDamage=8;SWEP.MaxForce=info.Main&&0||50;SWEP.RegenSpeed=1;SWEP.CanKnockback=false;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.NoForcePowers=true;SWEP.ShowForceBar=!info.Main;SWEP.ForcePowerList={}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=true;SWEP.NoGlow=true;SWEP.UseHilt="models/keithsword/parts/keithsword.mdl"SWEP.UseLength=42;SWEP.UseWidth=false;SWEP.UseColor=Color(255,255,25,0)SWEP.UseDarkInner=false;SWEP.UseLoopSound="lightsaber/saber_loop1.wav"SWEP.UseSwingSound="lightsaber/darksaber_swing.wav"SWEP.UseOnSound="lightsaber/saber_on_kylo.wav"SWEP.UseOffSound="lightsaber/saber_off_kylo.wav"SWEP.Base="wos_adv_single_lightsaber_base"SWEP.DamageType=DMG_DISSOLVE;SWEP.HolsterBone='ValveBiped.Bip01_Spine'function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*2+c:Forward()*18+c:Up()*3;c:RotateAroundAxis(-c:Right(),160)return b,c end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_grandmaster.lua:
AddCSLuaFile()SWEP.Author='Robotboy655 + King David'SWEP.Category='Lightsabers'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel='models/weapons/v_crowbar.mdl'SWEP.WorldModel='models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl'SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSiz=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo='none'SWEP.PrintName='Grand Master Lightsaber'SWEP.Class='weapon_lightsaber_grandmaster'SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=300;SWEP.SaberBurnDamage=20;SWEP.MaxForce=250;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={'Meditate','Force Leap','Force Absorb','Force Heal','Force Repulse','Force Push','Force Pull','Cloak','Saber Throw'}SWEP.DevestatorList={'Kyber Slam','Lightning Coil','Sonic Discharge'}SWEP.Stances={}SWEP.UseHilt="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.UseLength=50;SWEP.UseWidth=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base='wos_adv_single_lightsaber_base'
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_guardian.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_pike_aedius.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_saberpike_h.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David + Scott"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=false;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/galactic/weapons/saberpike/saberpike.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Saber Pike"SWEP.Class="weapon_lightsaber_saberpike_h"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.MaxForce=400;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.IgnoreHiltCosmetic=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=false;SWEP.NoGlow=true;SWEP.UseHilt="models/galactic/weapons/saberpike/saberpike.mdl"SWEP.UseLength=50;SWEP.UseWidth=false;SWEP.UseColor=Color(255,50,255)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"SWEP.HolsterBone='forward'function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*-10+c:Up()*-6;c:RotateAroundAxis(c:Up(),45)return b,c end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_sentinel_aedius.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Sentinel Duallies"SWEP.Class="weapon_lightsaber_sentinel_aedius"SWEP.DualWielded=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.DamageType=DMG_DISSOLVE;SWEP.Base="wos_adv_dual_lightsaber_base"
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_repairtool/shared.lua:
SWEP.PrintName='Repair Tool'SWEP.Author='Scott'SWEP.DrawAmmo=false;SWEP.Category='SUP Weapons'SWEP.UseHands=true;SWEP.Slot=3;SWEP.SlotPos=5;SWEP.Spawnable=true;SWEP.ViewModelFOV=50;SWEP.WorldModel='models/galactic/repairtool/w_repairtool.mdl'SWEP.ViewModel='models/galactic/repairtool/v_repairtool.mdl'SWEP.ViewModelFlip=false;SWEP.DrawCrosshair=false;SWEP.HoldType='pistol'SWEP.Primary.Damage=0;SWEP.Primary.Ammo='none'SWEP.Secondary.Damage=0;SWEP.Secondary.Ammo='none'SWEP.Cooldown=5;SWEP.FailedSound=Sound'weapons/physgun_off.wav'
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/base_gmodentity.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_anim")ENT.PrintName=""ENT.Author=""ENT.Contact=""ENT.Purpose=""ENT.Instructions=""ENT.Spawnable=false;if CLIENT then ENT.LabelColor=Color(255,255,255,255)function ENT:BeingLookedAtByLocalPlayer()if LocalPlayer():GetEyeTrace().Entity!=self then return false end;if EyePos():Distance(self:GetPos())>256 then return false end;return true end end;function ENT:Think()end;function ENT:SetOverlayText(a)end;function ENT:GetOverlayText()local b=self:GetNetworkedString("GModOverlayText")if b==""then return""end;if game.SinglePlayer()then return b end;local c=self:GetPlayerName()return b.."\n("..c..")"end;function ENT:SetPlayer(d)if IsValid(d)then self:SetVar("Founder",d)self:SetVar("FounderIndex",d:UniqueID())end end;function ENT:GetPlayer()return self:GetVar("Founder",NULL)end;function ENT:GetPlayerIndex()return self:GetVar("FounderIndex",0)end;function ENT:GetPlayerName()local d=self:GetPlayer()if IsValid(d)then return d:Nick()end;return self:GetNetworkedString("FounderName")end
--addons/!lpakr_out/lua/drgbase/entity_helpers.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot/possession.lua:
function ENT:IsPossessionEnabled()return self:GetNWBool("DrGBasePossessionEnabled")end;function ENT:GetPossessor()return self:GetNW2Entity("DrGBasePossessor")end;function ENT:IsPossessed()return IsValid(self:GetPossessor())end;function ENT:IsPossessor(a)if!self:IsPossessed()then return false else return self:GetPossessor()==a end end;function ENT:CurrentViewPreset()if!self:IsPossessed()then return-1 end;if#self.PossessionViews==0 then return-1 end;local b=self:GetNW2Int("DrGBasePossessionView",1)return b,self.PossessionViews[b]end;function ENT:CycleViewPresets()if SERVER then elseif self:IsPossessedByLocalPlayer()then net.Start("DrGBasePossessionCycleViewPresets")net.WriteEntity(self)net.SendToServer()end end;function ENT:PossessionGetLockedOn()if!self:IsPossessed()then return NULL else return self:GetNW2Entity("DrGBasePossessionLockedOn")end end;function ENT:PossessorView()if!self:IsPossessed()then return end;local b,c=self:CurrentViewPreset()local d;local e;if b==-1||c.auto then d=self:WorldSpaceCenter()+Vector(0,0,self:Height()/3)e=self:Length()*3 else local f=c.offset||Vector(0,0,0)if c.eyepos then d=self:EyePos()elseif isstring(c.bone)then local g=self:LookupBone(c.bone)if g!=nil then center=self:GetBonePosition(g)end else d=self:WorldSpaceCenter()end;local h=self:TraceLine(self:PossessorForward()*f.x*self:GetModelScale()+self:PossessorRight()*f.y*self:GetModelScale()+self:PossessorUp()*f.z*self:GetModelScale(),{start=d})d=h.HitPos;e=c.distance||0 end;local h=self:TraceLine(-self:PossessorNormal()*e*self:GetModelScale(),{start=d})return h.HitPos,self:GetPossessor():EyeAngles()end;function ENT:PossessorTrace(i)if!self:IsPossessed()then return end;local d,j=self:PossessorView()i=i||{}i.start=d;i.endpos=d+j:Forward()*999999999;return self:TraceLine(nil,i)end;function ENT:PossessorNormal()if!self:IsPossessed()then return end;return self:GetPossessor():EyeAngles():Forward()end;function ENT:PossessorForward()if!self:IsPossessed()then return end;local k=self:PossessionGetLockedOn()if IsValid(k)then local l=self:GetPos():DrG_Direction(k:GetPos())l.z=0;return l:GetNormalized()else local m=self:PossessorNormal()m.z=0;return m:GetNormalized()end end;function ENT:PossessorRight()if!self:IsPossessed()then return end;local n=self:PossessorForward()n:Rotate(Angle(0,-90,0))return n end;function ENT:PossessorUp()return Vector(0,0,1)end;function ENT:OnPossessed()end;function ENT:OnDispossessed()end;function ENT:_InitPossession()if SERVER then else self:SetNW2VarProxy("DrGBasePossessor",function(self,o,p,q)if!IsValid(p)&&IsValid(q)then self:OnPossessed(q)elseif IsValid(p)&&!IsValid(q)then self:OnDispossessed(p)end end)end end;function ENT:_HandlePossession(r)if!self:IsPossessed()then return end;local s=self:GetPossessor()if r&&self:OnPossession()then return end;if r then local t=s:KeyDown(IN_FORWARD)local u=s:KeyDown(IN_BACK)local v=s:KeyDown(IN_MOVELEFT)local w=s:KeyDown(IN_MOVERIGHT)local n=t&&!u;local x=u&&!t;local y=w&&!v;local z=v&&!w;if self.PossessionMovement==POSSESSION_MOVE_8DIR then self:PossessionFaceForward()if n then self:PossessionMoveForward()elseif x then self:PossessionMoveBackward()end;if y then self:PossessionMoveRight()elseif z then self:PossessionMoveLeft()end elseif self.PossessionMovement==POSSESSION_MOVE_4DIR then self:PossessionFaceForward()local l=self._DrGBasePossLast4DIR||""if n&&(l==""||l=="N")then self:PossessionMoveForward()self._DrGBasePossLast4DIR="N"elseif x&&(l==""||l=="S")then self:PossessionMoveBackward()self._DrGBasePossLast4DIR="S"elseif y&&(l==""||l=="E")then self:PossessionMoveRight()self._DrGBasePossLast4DIR="E"elseif z&&(l==""||l=="W")then self:PossessionMoveLeft()self._DrGBasePossLast4DIR="W"else self._DrGBasePossLast4DIR=""end elseif self.PossessionMovement==POSSESSION_MOVE_1DIR then local A=self:GetPos()if n then A=A+self:PossessorForward()elseif x then A=A-self:PossessorForward()end;if y then A=A+self:PossessorRight()elseif z then A=A-self:PossessorRight()end;if A!=self:GetPos()then self:MoveTowards(A)else self:PossessionFaceForward()end elseif self.PossessionMovement==POSSESSION_MOVE_CUSTOM then self:PossessionControls(n,x,y,z)end;if s:DrG_ButtonDown(s:GetInfoNum("drgbase_possession_climb",KEY_C))then if self.ClimbLadders&&navmesh.IsLoaded()then local B=navmesh.GetNearestNavArea(self:GetPos())if IsValid(B)then local C=B:GetLadders()for D,E in ipairs(C)do if self.ClimbLadderUp then if self:GetHullRangeSquaredTo(E:GetBottom())<self.LaddersUpDistance^2 then self:ClimbLadderUp(E)return end elseif self.ClimbLaddersDown then if self:GetHullRangeSquaredTo(E:GetTop())<self.LaddersDownDistance^2 then self:ClimbLadderDown(E)return end end end end end;local F=self:FindLedge()if isvector(F)then self:ClimbLedge(F)end end end;for G,H in pairs(self.PossessionBinds)do if isstring(G)then if CLIENT then local I=GetConVar(G)if!I then continue else G=I:GetInt()end else G=s:GetInfoNum(G,BUTTON_CODE_INVALID)if G==BUTTON_CODE_INVALID then continue end end end;for D,J in ipairs(H)do if CLIENT&&!J.client then continue end;if SERVER&&(!r&&J.coroutine||r&&!J.coroutine)then continue end;if!isfunction(J.onkeyup)then J.onkeyup=function()end end;if!isfunction(J.onkeypressed)then J.onkeypressed=function()end end;if!isfunction(J.onkeydown)then J.onkeydown=function()end end;if!isfunction(J.onkeydownlast)then J.onkeydownlast=function()end end;if!isfunction(J.onkeyreleased)then J.onkeyreleased=function()end end;if s:KeyPressed(G)then J.onkeypressed(self,s)end;if s:KeyDown(G)then J.onkeydown(self,s)else J.onkeyup(self,s)end;if s:KeyDownLast(G)then J.onkeydownlast(self,s)end;if s:KeyReleased(G)then J.onkeyreleased(self,s)end;if!isfunction(J.onbuttonup)then J.onbuttonup=function()end end;if!isfunction(J.onbuttonpressed)then J.onbuttonpressed=function()end end;if!isfunction(J.onbuttondown)then J.onbuttondown=function()end end;if!isfunction(J.onbuttonreleased)then J.onbuttonreleased=function()end end;if s:DrG_ButtonUp(G)then J.onbuttonup(self,s)end;if s:DrG_ButtonPressed(G)then J.onbuttonpressed(self,s)end;if s:DrG_ButtonDown(G)then J.onbuttondown(self,s)end;if s:DrG_ButtonReleased(G)then J.onbuttonreleased(self,s)end end end end;if SERVER then else CreateClientConVar("drgbase_possession_teleport","0",true,true)function ENT:IsPossessedByLocalPlayer()return self:IsPossessor(LocalPlayer())end;function ENT:PossessionHUD()end;hook.Add("HUDPaint","DrGBasePossessionHUD",function()local K=LocalPlayer()if!isfunction(K.DrG_Possessing)then return end;local L=K:DrG_Possessing()if!IsValid(L)then return end;local M=L:PossessionHUD()if M then return end;DrGBase.DrawPossessionHUD(L)end)function ENT:PossessionRender()end;hook.Add("RenderScreenspaceEffects","DrGBasePossessionDraw",function()local K=LocalPlayer()if!isfunction(K.DrG_Possessing)then return end;local L=K:DrG_Possessing()if!IsValid(L)then return end;L:PossessionRender()end)function ENT:PossessionHalos()end;hook.Add("PreDrawHalos","DrGBasePossessionHalos",function()local K=LocalPlayer()if!isfunction(K.DrG_Possessing)then return end;local L=K:DrG_Possessing()if!IsValid(L)then return end;L:PossessionHalos()end)end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/misc.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot_droidbase/animations.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot_droidbase/animations.lua:
ENT.Animations={PlayerModel={RunAnimations={["normal"]=ACT_HL2MP_RUN,["ar2"]=ACT_HL2MP_RUN_AR2,["camera"]=ACT_HL2MP_RUN_CAMERA,["crossbow"]=ACT_HL2MP_RUN_CROSSBOW,["duel"]=ACT_HL2MP_RUN_DUEL,["fist"]=ACT_HL2MP_RUN_FIST,["knife"]=ACT_HL2MP_RUN_KNIFE,["magic"]=ACT_HL2MP_RUN_MAGIC,["melee2"]=ACT_HL2MP_RUN_MELEE2,["passive"]=ACT_HL2MP_RUN_PASSIVE,["physgun"]=ACT_HL2MP_RUN_PHYSGUN,["revolver"]=ACT_HL2MP_RUN_REVOLVER,["rpg"]=ACT_HL2MP_RUN_RPG,["shotgun"]=ACT_HL2MP_RUN_SHOTGUN,["smg"]=ACT_HL2MP_RUN_SMG1,["grenade"]=ACT_HL2MP_RUN_GRENADE,["melee"]=ACT_HL2MP_RUN_MELEE,["pistol"]=ACT_HL2MP_RUN_PISTOL,["slam"]=ACT_HL2MP_RUN_SLAM},WalkAnimations={["normal"]=ACT_HL2MP_WALK,["ar2"]=ACT_HL2MP_WALK_AR2,["camera"]=ACT_HL2MP_WALK_CAMERA,["crossbow"]=ACT_HL2MP_WALK_CROSSBOW,["duel"]=ACT_HL2MP_WALK_DUEL,["fist"]=ACT_HL2MP_WALK_FIST,["knife"]=ACT_HL2MP_WALK_KNIFE,["magic"]=ACT_HL2MP_WALK_MAGIC,["melee2"]=ACT_HL2MP_WALK_MELEE2,["passive"]=ACT_HL2MP_WALK_PASSIVE,["physgun"]=ACT_HL2MP_WALK_PHYSGUN,["revolver"]=ACT_HL2MP_WALK_REVOLVER,["rpg"]=ACT_HL2MP_WALK_RPG,["shotgun"]=ACT_HL2MP_WALK_SHOTGUN,["smg"]=ACT_HL2MP_WALK_SMG1,["grenade"]=ACT_HL2MP_WALK_GRENADE,["melee"]=ACT_HL2MP_WALK_MELEE,["pistol"]=ACT_HL2MP_WALK_PISTOL,["slam"]=ACT_HL2MP_WALK_SLAM},IdleAnimations={["normal"]=ACT_HL2MP_IDLE,["ar2"]=ACT_HL2MP_IDLE_AR2,["camera"]=ACT_HL2MP_IDLE_CAMERA,["crossbow"]=ACT_HL2MP_IDLE_CROSSBOW,["duel"]=ACT_HL2MP_IDLE_DUEL,["fist"]=ACT_HL2MP_IDLE_FIST,["knife"]=ACT_HL2MP_IDLE_KNIFE,["magic"]=ACT_HL2MP_IDLE_MAGIC,["melee2"]=ACT_HL2MP_IDLE_MELEE2,["passive"]=ACT_HL2MP_IDLE_PASSIVE,["physgun"]=ACT_HL2MP_IDLE_PHYSGUN,["revolver"]=ACT_HL2MP_IDLE_REVOLVER,["rpg"]=ACT_HL2MP_IDLE_RPG,["shotgun"]=ACT_HL2MP_IDLE_SHOTGUN,["smg"]=ACT_HL2MP_IDLE_SMG1,["grenade"]=ACT_HL2MP_IDLE_GRENADE,["melee"]=ACT_HL2MP_IDLE_MELEE,["pistol"]=ACT_HL2MP_IDLE_PISTOL,["slam"]=ACT_HL2MP_IDLE_SLAM},CrouchWalkAnimations={["normal"]=ACT_HL2MP_WALK_CROUCH,["ar2"]=ACT_HL2MP_WALK_CROUCH_AR2,["camera"]=ACT_HL2MP_WALK_CROUCH_CAMERA,["crossbow"]=ACT_HL2MP_WALK_CROUCH_CROSSBOW,["duel"]=ACT_HL2MP_WALK_CROUCH_DUEL,["fist"]=ACT_HL2MP_WALK_CROUCH_FIST,["knife"]=ACT_HL2MP_WALK_CROUCH_KNIFE,["magic"]=ACT_HL2MP_WALK_CROUCH_MAGIC,["melee2"]=ACT_HL2MP_WALK_CROUCH_MELEE2,["passive"]=ACT_HL2MP_WALK_CROUCH_PASSIVE,["physgun"]=ACT_HL2MP_WALK_CROUCH_PHYSGUN,["revolver"]=ACT_HL2MP_WALK_CROUCH_REVOLVER,["rpg"]=ACT_HL2MP_WALK_CROUCH_RPG,["shotgun"]=ACT_HL2MP_WALK_CROUCH_SHOTGUN,["smg"]=ACT_HL2MP_WALK_CROUCH_SMG1,["grenade"]=ACT_HL2MP_WALK_CROUCH_GRENADE,["melee"]=ACT_HL2MP_WALK_CROUCH_MELEE,["pistol"]=ACT_HL2MP_WALK_CROUCH_PISTOL,["slam"]=ACT_HL2MP_WALK_CROUCH_SLAM},CrouchIdleAnimations={["normal"]=ACT_HL2MP_IDLE_CROUCH,["ar2"]=ACT_HL2MP_IDLE_CROUCH_AR2,["camera"]=ACT_HL2MP_IDLE_CROUCH_CAMERA,["crossbow"]=ACT_HL2MP_IDLE_CROUCH_CROSSBOW,["duel"]=ACT_HL2MP_IDLE_CROUCH_DUEL,["fist"]=ACT_HL2MP_IDLE_CROUCH_FIST,["knife"]=ACT_HL2MP_IDLE_CROUCH_KNIFE,["magic"]=ACT_HL2MP_IDLE_CROUCH_MAGIC,["melee2"]=ACT_HL2MP_IDLE_CROUCH_MELEE2,["passive"]=ACT_HL2MP_IDLE_CROUCH_PASSIVE,["physgun"]=ACT_HL2MP_IDLE_CROUCH_PHYSGUN,["revolver"]=ACT_HL2MP_IDLE_CROUCH_REVOLVER,["rpg"]=ACT_HL2MP_IDLE_CROUCH_RPG,["shotgun"]=ACT_HL2MP_IDLE_CROUCH_SHOTGUN,["smg"]=ACT_HL2MP_IDLE_CROUCH_SMG1,["grenade"]=ACT_HL2MP_IDLE_CROUCH_GRENADE,["melee"]=ACT_HL2MP_IDLE_CROUCH_MELEE,["pistol"]=ACT_HL2MP_IDLE_CROUCH_PISTOL,["slam"]=ACT_HL2MP_IDLE_CROUCH_SLAM},JumpAnimations={["normal"]=ACT_HL2MP_JUMP_KNIFE,["ar2"]=ACT_HL2MP_JUMP_AR2,["camera"]=ACT_HL2MP_JUMP_CAMERA,["crossbow"]=ACT_HL2MP_JUMP_CROSSBOW,["duel"]=ACT_HL2MP_JUMP_DUEL,["fist"]=ACT_HL2MP_JUMP_FIST,["knife"]=ACT_HL2MP_JUMP_KNIFE,["magic"]=ACT_HL2MP_JUMP_MAGIC,["melee2"]=ACT_HL2MP_JUMP_MELEE2,["passive"]=ACT_HL2MP_JUMP_PASSIVE,["physgun"]=ACT_HL2MP_JUMP_PHYSGUN,["revolver"]=ACT_HL2MP_JUMP_REVOLVER,["rpg"]=ACT_HL2MP_JUMP_RPG,["shotgun"]=ACT_HL2MP_JUMP_SHOTGUN,["smg"]=ACT_HL2MP_JUMP_SMG1,["grenade"]=ACT_HL2MP_JUMP_GRENADE,["melee"]=ACT_HL2MP_JUMP_MELEE,["pistol"]=ACT_HL2MP_JUMP_PISTOL,["slam"]=ACT_HL2MP_JUMP_SLAM},ShootAnimations={["normal"]=ACT_HL2MP_GESTURE_RANGE_ATTACK,["ar2"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,["camera"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_CAMERA,["crossbow"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW,["duel"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL,["fist"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST,["knife"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,["magic"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_MAGIC,["melee2"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2,["passive"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PASSIVE,["physgun"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PHYSGUN,["revolver"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER,["rpg"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG,["shotgun"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN,["smg"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1,["grenade"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,["melee"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE,["pistol"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,["slam"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM},ReloadAnimations={["normal"]=ACT_HL2MP_GESTURE_RELOAD,["ar2"]=ACT_HL2MP_GESTURE_RELOAD_AR2,["camera"]=ACT_HL2MP_GESTURE_RELOAD_CAMERA,["crossbow"]=ACT_HL2MP_GESTURE_RELOAD_CROSSBOW,["duel"]=ACT_HL2MP_GESTURE_RELOAD_DUEL,["fist"]=ACT_HL2MP_GESTURE_RELOAD_FIST,["knife"]=ACT_HL2MP_GESTURE_RELOAD_KNIFE,["magic"]=ACT_HL2MP_GESTURE_RELOAD_MAGIC,["melee2"]=ACT_HL2MP_GESTURE_RELOAD_MELEE2,["passive"]=ACT_HL2MP_GESTURE_RELOAD_PASSIVE,["physgun"]=ACT_HL2MP_GESTURE_RELOAD_PHYSGUN,["revolver"]=ACT_HL2MP_GESTURE_RELOAD_REVOLVER,["rpg"]=ACT_HL2MP_GESTURE_RELOAD_RPG,["shotgun"]=ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,["smg"]=ACT_HL2MP_GESTURE_RELOAD_SMG1,["grenade"]=ACT_HL2MP_GESTURE_RELOAD_GRENADE,["melee"]=ACT_HL2MP_GESTURE_RELOAD_MELEE,["pistol"]=ACT_HL2MP_GESTURE_RELOAD_PISTOL,["slam"]=ACT_HL2MP_GESTURE_RELOAD_SLAM}},NPCModel={RunAnimations={["normal"]=ACT_RUN,["ar2"]=ACT_HL2MP_RUN_AR2,["camera"]=ACT_HL2MP_RUN_CAMERA,["crossbow"]=ACT_HL2MP_RUN_CROSSBOW,["duel"]=ACT_HL2MP_RUN_DUEL,["fist"]=ACT_HL2MP_RUN_FIST,["knife"]=ACT_HL2MP_RUN_KNIFE,["magic"]=ACT_HL2MP_RUN_MAGIC,["melee2"]=ACT_HL2MP_RUN_MELEE2,["passive"]=ACT_HL2MP_RUN_PASSIVE,["physgun"]=ACT_HL2MP_RUN_PHYSGUN,["revolver"]=ACT_HL2MP_RUN_REVOLVER,["rpg"]=ACT_HL2MP_RUN_RPG,["shotgun"]=ACT_HL2MP_RUN_SHOTGUN,["smg"]=ACT_HL2MP_RUN_SMG1,["grenade"]=ACT_HL2MP_RUN_GRENADE,["melee"]=ACT_HL2MP_RUN_MELEE,["pistol"]=ACT_HL2MP_RUN_PISTOL,["slam"]=ACT_HL2MP_RUN_SLAM},WalkAnimations={["normal"]=ACT_WALK,["ar2"]=ACT_HL2MP_WALK_AR2,["camera"]=ACT_HL2MP_WALK_CAMERA,["crossbow"]=ACT_HL2MP_WALK_CROSSBOW,["duel"]=ACT_HL2MP_WALK_DUEL,["fist"]=ACT_HL2MP_WALK_FIST,["knife"]=ACT_HL2MP_WALK_KNIFE,["magic"]=ACT_HL2MP_WALK_MAGIC,["melee2"]=ACT_HL2MP_WALK_MELEE2,["passive"]=ACT_HL2MP_WALK_PASSIVE,["physgun"]=ACT_HL2MP_WALK_PHYSGUN,["revolver"]=ACT_HL2MP_WALK_REVOLVER,["rpg"]=ACT_HL2MP_WALK_RPG,["shotgun"]=ACT_HL2MP_WALK_SHOTGUN,["smg"]=ACT_HL2MP_WALK_SMG1,["grenade"]=ACT_HL2MP_WALK_GRENADE,["melee"]=ACT_HL2MP_WALK_MELEE,["pistol"]=ACT_HL2MP_WALK_PISTOL,["slam"]=ACT_HL2MP_WALK_SLAM},CrouchWalkAnimations={["normal"]=ACT_WALK_CROUCH,["ar2"]=ACT_HL2MP_WALK_CROUCH_AR2,["camera"]=ACT_HL2MP_WALK_CROUCH_CAMERA,["crossbow"]=ACT_HL2MP_WALK_CROUCH_CROSSBOW,["duel"]=ACT_HL2MP_WALK_CROUCH_DUEL,["fist"]=ACT_HL2MP_WALK_CROUCH_FIST,["knife"]=ACT_HL2MP_WALK_CROUCH_KNIFE,["magic"]=ACT_HL2MP_WALK_CROUCH_MAGIC,["melee2"]=ACT_HL2MP_WALK_CROUCH_MELEE2,["passive"]=ACT_HL2MP_WALK_CROUCH_PASSIVE,["physgun"]=ACT_HL2MP_WALK_CROUCH_PHYSGUN,["revolver"]=ACT_HL2MP_WALK_CROUCH_REVOLVER,["rpg"]=ACT_HL2MP_WALK_CROUCH_RPG,["shotgun"]=ACT_HL2MP_WALK_CROUCH_SHOTGUN,["smg"]=ACT_HL2MP_WALK_CROUCH_SMG1,["grenade"]=ACT_HL2MP_WALK_CROUCH_GRENADE,["melee"]=ACT_HL2MP_WALK_CROUCH_MELEE,["pistol"]=ACT_HL2MP_WALK_CROUCH_PISTOL,["slam"]=ACT_HL2MP_WALK_CROUCH_SLAM},IdleAnimations={["normal"]=ACT_IDLE,["ar2"]=ACT_HL2MP_IDLE_AR2,["camera"]=ACT_HL2MP_IDLE_CAMERA,["crossbow"]=ACT_HL2MP_IDLE_CROSSBOW,["duel"]=ACT_HL2MP_IDLE_DUEL,["fist"]=ACT_HL2MP_IDLE_FIST,["knife"]=ACT_HL2MP_IDLE_KNIFE,["magic"]=ACT_HL2MP_IDLE_MAGIC,["melee2"]=ACT_HL2MP_IDLE_MELEE2,["passive"]=ACT_HL2MP_IDLE_PASSIVE,["physgun"]=ACT_HL2MP_IDLE_PHYSGUN,["revolver"]=ACT_HL2MP_IDLE_REVOLVER,["rpg"]=ACT_HL2MP_IDLE_RPG,["shotgun"]=ACT_HL2MP_IDLE_SHOTGUN,["smg"]=ACT_HL2MP_IDLE_SMG1,["grenade"]=ACT_HL2MP_IDLE_GRENADE,["melee"]=ACT_HL2MP_IDLE_MELEE,["pistol"]=ACT_HL2MP_IDLE_PISTOL,["slam"]=ACT_HL2MP_IDLE_SLAM},CrouchIdleAnimations={["normal"]=ACT_CROUCHIDLE,["ar2"]=ACT_HL2MP_IDLE_CROUCH_AR2,["camera"]=ACT_HL2MP_IDLE_CROUCH_CAMERA,["crossbow"]=ACT_HL2MP_IDLE_CROUCH_CROSSBOW,["duel"]=ACT_HL2MP_IDLE_CROUCH_DUEL,["fist"]=ACT_HL2MP_IDLE_CROUCH_FIST,["knife"]=ACT_HL2MP_IDLE_CROUCH_KNIFE,["magic"]=ACT_HL2MP_IDLE_CROUCH_MAGIC,["melee2"]=ACT_HL2MP_IDLE_CROUCH_MELEE2,["passive"]=ACT_HL2MP_IDLE_CROUCH_PASSIVE,["physgun"]=ACT_HL2MP_IDLE_CROUCH_PHYSGUN,["revolver"]=ACT_HL2MP_IDLE_CROUCH_REVOLVER,["rpg"]=ACT_HL2MP_IDLE_CROUCH_RPG,["shotgun"]=ACT_HL2MP_IDLE_CROUCH_SHOTGUN,["smg"]=ACT_HL2MP_IDLE_CROUCH_SMG1,["grenade"]=ACT_HL2MP_IDLE_CROUCH_GRENADE,["melee"]=ACT_HL2MP_IDLE_CROUCH_MELEE,["pistol"]=ACT_HL2MP_IDLE_CROUCH_PISTOL,["slam"]=ACT_HL2MP_IDLE_CROUCH_SLAM},JumpAnimations={["normal"]=ACT_JUMP,["ar2"]=ACT_HL2MP_JUMP_AR2,["camera"]=ACT_HL2MP_JUMP_CAMERA,["crossbow"]=ACT_HL2MP_JUMP_CROSSBOW,["duel"]=ACT_HL2MP_JUMP_DUEL,["fist"]=ACT_HL2MP_JUMP_FIST,["knife"]=ACT_HL2MP_JUMP_KNIFE,["magic"]=ACT_HL2MP_JUMP_MAGIC,["melee2"]=ACT_HL2MP_JUMP_MELEE2,["passive"]=ACT_HL2MP_JUMP_PASSIVE,["physgun"]=ACT_HL2MP_JUMP_PHYSGUN,["revolver"]=ACT_HL2MP_JUMP_REVOLVER,["rpg"]=ACT_HL2MP_JUMP_RPG,["shotgun"]=ACT_HL2MP_JUMP_SHOTGUN,["smg"]=ACT_HL2MP_JUMP_SMG1,["grenade"]=ACT_HL2MP_JUMP_GRENADE,["melee"]=ACT_HL2MP_JUMP_MELEE,["pistol"]=ACT_HL2MP_JUMP_PISTOL,["slam"]=ACT_HL2MP_JUMP_SLAM},ShootAnimations={["normal"]=ACT_HL2MP_GESTURE_RANGE_ATTACK,["ar2"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,["camera"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_CAMERA,["crossbow"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW,["duel"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL,["fist"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST,["knife"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,["magic"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_MAGIC,["melee2"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2,["passive"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PASSIVE,["physgun"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PHYSGUN,["revolver"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER,["rpg"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG,["shotgun"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN,["smg"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1,["grenade"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,["melee"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE,["pistol"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,["slam"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM}}}
--addons/!lpakr_out/lua/entities/dronesrewrite_republic/cl_init.lua:
include("shared.lua")function ENT:Draw()self:DrawModel()end;function ENT:Think()if!self.LastPulse||self.LastPulse<CurTime()then local a=EffectData()a:SetOrigin(self:GetPos()+Vector(0,0,24))a:SetRadius(55)util.Effect('rb655_force_repulse_out',a,true,true)self.LastPulse=CurTime()+.25 end end
--addons/!lpakr_out/lua/entities/ent_chess_board.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Model=Model'models/weapons/w_slam.mdl'ENT.Models={["board"]=Model('models/props_phx/games/chess/board.mdl'),["hl2table"]=Model('models/props_c17/furnituretable001a.mdl'),["BlackPawn"]=Model('models/props_phx/games/chess/black_pawn.mdl'),['WhitePawn']=Model('models/props_phx/games/chess/white_pawn.mdl'),["BlackRook"]=Model('models/props_phx/games/chess/black_rook.mdl'),['WhiteRook']=Model('models/props_phx/games/chess/white_rook.mdl'),["BlackKnight"]=Model('models/props_phx/games/chess/black_knight.mdl'),['WhiteKnight']=Model('models/props_phx/games/chess/white_knight.mdl'),["BlackBishop"]=Model('models/props_phx/games/chess/black_bishop.mdl'),['WhiteBishop']=Model('models/props_phx/games/chess/white_bishop.mdl'),["BlackQueen"]=Model('models/props_phx/games/chess/black_queen.mdl'),['WhiteQueen']=Model('models/props_phx/games/chess/white_queen.mdl'),["BlackKing"]=Model('models/props_phx/games/chess/black_king.mdl'),['WhiteKing']=Model('models/props_phx/games/chess/white_king.mdl'),["dama"]=Model('models/props_phx/games/chess/white_dama.mdl')}if info.CWRP then ENT.Models["table"]=Model('models/props/swdecortable.mdl')ENT.BoardHeight=Vector(0,0,34)ENT.TableOffset=Vector(0,0,0)else ENT.Models["table"]=Model('models/props_c17/furnituretable001a.mdl')ENT.BoardHeight=Vector(0,0,18)ENT.TableOffset=Vector(0,0,18)end;ENT.Characters={['BlackPawn']='♟',['WhitePawn']='♙',['BlackRook']='♜',['WhiteRook']='♖',['BlackKnight']='♞',['WhiteKnight']='♘',['BlackBishop']='♝',['WhiteBishop']='♗',['BlackQueen']='♛',['WhiteQueen']='♕',['BlackKing']='♚',['WhiteKing']='♔'}ENT.PhysBox={mins=Vector(-30,-30,-0),maxs=Vector(30,30,33)}ENT.PrintName='Chess'ENT.Author='my_hat_stinks'ENT.Information='A chess board'ENT.Category='Game boards'ENT.Game='Chess'ENT.Spawnable=true;ENT.AdminOnly=true;ENT.IsChessBoard=true;ENT.TopLeft=Vector(2.5,-15.5,-16)ENT.SquareH=78.5;ENT.SquareW=80.2;ENT.RealH=4;ENT.RealW=3.9;ENT.MoveTime=0.3;ENT.MoveSound=Sound'physics/wood/wood_solid_impact_soft1.wav'ENT.CheckSound=Sound'physics/concrete/rock_impact_hard1.wav'local a={1,2,4,8,16,32,64,128}local b=Color(150,255,150)ENT.StartState=Chess.CHESS_WHITEMOVE;function ENT:SetupDataTables()self:NetworkVar('Int',0,'BlackPassant')self:NetworkVar('Int',1,'WhitePassant')self:NetworkVar('Int',2,'ChessState')self:NetworkVar('Bool',0,'Playing')self:NetworkVar('Int',3,'DrawOffer')self:NetworkVar('Float',0,'WhiteWager')self:NetworkVar('Float',1,'BlackWager')self:NetworkVar('Entity',0,'WhitePlayer')self:NetworkVar('Entity',1,'BlackPlayer')self:NetworkVar('Entity',2,'TableEnt')self:NetworkVar('Int',4,'MoveCount')self:NetworkVar('Bool',1,'Repetition')self:NetworkVar('Float',2,'WhiteTime')self:NetworkVar('Float',3,'BlackTime')end;local c=Matrix({{0.1225,0,0,0},{0,0.1225,0,0},{0,0,0.1225,0},{0,0,0,0}})function ENT:SpawnFunction(d,e,f)if!e.Hit then return end;local g=e.HitPos;local h=IsValid(self)&&self||ents.Create(f)h:SetPos(g)h:Spawn()return h end;function ENT:Initialize()self.Pieces={["a"]={},["b"]={},["c"]={},["d"]={},["e"]={},["f"]={},["g"]={},["h"]={}}self:SetModel(self.Models['board'])self:DrawShadow(false)local i=self:OBBMins()*0.1;local j=self:OBBMaxs()*0.1;self:PhysicsInit(SOLID_NONE)if CLIENT then self:EnableMatrix('RenderMultiply',c)hook.Add('KeyPress',self,self.GetSpectateUse)end;self:ResetBoard()end;function ENT:OnRemove()if CLIENT then if IsValid(self.PiecesEnt)then self.PiecesEnt:Remove()end;if IsValid(self:GetTableEnt())&&IsValid(self:GetTableEnt().ClientChessTable)then self:GetTableEnt().ClientChessTable:Remove()end end end;function ENT:GetTableGrid(tbl,k,l)if type(k)=='number'then k=Chess.NumToLetter[k+1]end;return tbl&&tbl[k]&&tbl[k][8-l]end;function ENT:GetTableKey(tbl,k,l)if type(k)=='string'then k=Chess.NumToLetter[k]-1 end;return tbl&&tbl[k]&&tbl[k][8-l]end;function ENT:GetSquare(m,n,tbl)tbl=tbl||self.Pieces;return tbl[m]&&tbl[m][n]end;function ENT:SquareTeam(o)if o.Team then return o.Team end;return IsValid(o.Ent)&&(o.Ent:GetWhite()&&'White'||'Black')end;function ENT:SquareMoved(o)if o.Moved!=nil then return o.Moved end;return IsValid(o.Ent)&&o.Ent:GetMoved()end;function ENT:SquareClass(o)if o.Class!=nil then return o.Class end;return IsValid(o.Ent)&&o.Ent:GetRole()end;function ENT:SquareColor(m,n)local p=n/2==math.floor(n/2)local q=Chess.NumToLetter[m]/2==math.floor(Chess.NumToLetter[m]/2)return p==q&&'Black'||'White'end;function ENT:GetRookMoves(tbl,m,n,r,s,CheckTable)s=s||8;local t=0;for u=n+1,8 do local v=self:GetSquare(m,u,CheckTable)if v then if self:SquareTeam(v)=='White'!=r then tbl[m][u]=true end;break end;tbl[m][u]=true;t=t+1;if t>=s then break end end;t=0;for u=n-1,1,-1 do local v=self:GetSquare(m,u,CheckTable)if v then if self:SquareTeam(v)=="White"!=r then tbl[m][u]=true end;break end;tbl[m][u]=true;t=t+1;if t>=s then break end end;t=0;for w=Chess.NumToLetter[m]+1,8 do local v=self:GetSquare(Chess.NumToLetter[w],n,CheckTable)if v then if self:SquareTeam(v)=="White"!=r then tbl[Chess.NumToLetter[w]][n]=true end;break end;tbl[Chess.NumToLetter[w]][n]=true;t=t+1;if t>=s then break end end;t=0;for w=Chess.NumToLetter[m]-1,1,-1 do local v=self:GetSquare(Chess.NumToLetter[w],n,CheckTable)if v then if self:SquareTeam(v)=="White"!=r then tbl[Chess.NumToLetter[w]][n]=true end;break end;tbl[Chess.NumToLetter[w]][n]=true;t=t+1;if t>=s then break end end end;function ENT:GetBishopMoves(tbl,m,n,r,s,CheckTable)s=s||8;local w,t=Chess.NumToLetter[m],0;for u=n+1,8 do w=w+1;if w>8 then break end;local v=self:GetSquare(Chess.NumToLetter[w],u,CheckTable)if v then if self:SquareTeam(v)=="White"!=r then tbl[Chess.NumToLetter[w]][u]=true end;break end;tbl[Chess.NumToLetter[w]][u]=true;t=t+1;if t>=s then break end end;local w,t=Chess.NumToLetter[m],0;for u=n+1,8 do w=w-1;if w<1 then break end;local v=self:GetSquare(Chess.NumToLetter[w],u,CheckTable)if v then if self:SquareTeam(v)=="White"!=r then tbl[Chess.NumToLetter[w]][u]=true end;break end;tbl[Chess.NumToLetter[w]][u]=true;t=t+1;if t>=s then break end end;local w,t=Chess.NumToLetter[m],0;for u=n-1,1,-1 do w=w+1;if w>8 then break end;local v=self:GetSquare(Chess.NumToLetter[w],u,CheckTable)if v then if self:SquareTeam(v)=="White"!=r then tbl[Chess.NumToLetter[w]][u]=true end;break end;tbl[Chess.NumToLetter[w]][u]=true;t=t+1;if t>=s then break end end;local w,t=Chess.NumToLetter[m],0;for u=n-1,1,-1 do w=w-1;if w<1 then break end;local v=self:GetSquare(Chess.NumToLetter[w],u,CheckTable)if v then if self:SquareTeam(v)=="White"!=r then tbl[Chess.NumToLetter[w]][u]=true end;break end;tbl[Chess.NumToLetter[w]][u]=true;t=t+1;if t>=s then break end end end;function ENT:GetMove(m,n,x,CheckTable)if!(m&&n)then return{}end;if!Chess.NumToLetter[m]then return{}end;if Chess.NumToLetter[m]<1||Chess.NumToLetter[m]>8 then return{}end;if n<1||n>8 then return{}end;local o=self:GetSquare(m,n,CheckTable)if!o then return{}end;local class=o.Class||IsValid(o.Ent)&&o.Ent:GetRole()if!class then return{}end;local r=self:SquareTeam(o)=='White'local Moved=self:SquareMoved(o)local y=false;local tbl={["a"]={},["b"]={},["c"]={},["d"]={},["e"]={},["f"]={},["g"]={},["h"]={}}if class=='Pawn'then local u=r&&n+1||n-1;local z=self:GetSquare(Chess.NumToLetter[Chess.NumToLetter[m]-1],u,CheckTable)if z then local A=self:SquareTeam(z)=='White'if A!=r then tbl[Chess.NumToLetter[Chess.NumToLetter[m]-1]][u]=true end elseif r&&u==6||!r&&u==3 then local B=r&&self:GetBlackPassant()||self:GetWhitePassant()if Chess.NumToLetter[m]>1&&bit.band(B,a[Chess.NumToLetter[m]-1])==a[Chess.NumToLetter[m]-1]then tbl[Chess.NumToLetter[Chess.NumToLetter[m]-1]][u]='ENPASSANT'end end;local C=self:GetSquare(Chess.NumToLetter[Chess.NumToLetter[m]+1],u,CheckTable)if C then local A=self:SquareTeam(C)=='White'if A!=r then tbl[Chess.NumToLetter[Chess.NumToLetter[m]+1]][u]=true end elseif r&&u==6||!r&&u==3 then local B=r&&self:GetBlackPassant()||self:GetWhitePassant()if Chess.NumToLetter[m]<8&&bit.band(B,a[Chess.NumToLetter[m]+1])==a[Chess.NumToLetter[m]+1]then tbl[Chess.NumToLetter[Chess.NumToLetter[m]+1]][u]='ENPASSANT'end end;local D=self:GetSquare(m,u,CheckTable)if!D then tbl[m][u]=true;if!Moved then u=r&&u+1||u-1;if u>0&&u<9&&!self:GetSquare(m,u,CheckTable)then tbl[m][u]='PAWNDOUBLE'end end end elseif class=='Rook'then self:GetRookMoves(tbl,m,n,r,8,CheckTable)elseif class=='Bishop'then self:GetBishopMoves(tbl,m,n,r,8,CheckTable)elseif class=='Queen'then self:GetRookMoves(tbl,m,n,r,8,CheckTable)self:GetBishopMoves(tbl,m,n,r,8,CheckTable)elseif class=='King'then self:GetRookMoves(tbl,m,n,r,1,CheckTable)self:GetBishopMoves(tbl,m,n,r,1,CheckTable)y=true;local E=true;if!x then for F,G in pairs(tbl)do for H,I in pairs(G)do local J=table.Copy(self.Pieces)J[m][n]=nil;J[F][H]={Team=r&&'White'||'Black',Class=class,Moved=true}if self:CheckForCheck(J,r)then tbl[F][H]=nil end end end;E=self:CheckForCheck(self.Pieces,r)end;if!Moved&&!E then local K=self:GetSquare('h',n,CheckTable)local L=self:GetSquare('a',n,CheckTable)if K&&!self:SquareMoved(K)then if!(self:GetSquare('f',n,CheckTable)||self:GetSquare('g',n,CheckTable))then local J=table.Copy(self.Pieces)J[m][n]=nil;J["f"][n]={Team=r&&"White"||"Black",Class=class,Moved=true}local M=!self:CheckForCheck(J,r)local J=table.Copy(self.Pieces)J[m][n]=nil;J["g"][n]={Team=r&&"White"||"Black",Class=class,Moved=true}local N=!self:CheckForCheck(J,r)if M&&N then tbl['g'][n]='CASTLEKINGSIDE'end end end;if L&&!self:SquareMoved(L)then if!(self:GetSquare("b",n,CheckTable)||self:GetSquare("c",n,CheckTable)||self:GetSquare("d",n,CheckTable))then local J=table.Copy(self.Pieces)J[m][n]=nil;J["c"][n]={Team=r&&"White"||"Black",Class=class,Moved=true}local O=!self:CheckForCheck(J,r)local J=table.Copy(self.Pieces)J[m][n]=nil;J["d"][n]={Team=r&&"White"||"Black",Class=class,Moved=true}local P=!self:CheckForCheck(J,r)if O&&P then tbl['c'][n]='CASTLEQUEENSIDE'end end end end elseif class=='Knight'then local Q=Chess.NumToLetter[m]+2;if Q&&Q>=1&&Q<=8 then local R=self:GetSquare(Chess.NumToLetter[Q],n-1,CheckTable)local S=self:GetSquare(Chess.NumToLetter[Q],n+1,CheckTable)if n-1>=1&&(!R||self:SquareTeam(R)==(r&&"Black"||"White"))then tbl[Chess.NumToLetter[Q]][n-1]=true end;if n+1<=8&&(!S||self:SquareTeam(S)==(r&&"Black"||"White"))then tbl[Chess.NumToLetter[Q]][n+1]=true end end;local T=Chess.NumToLetter[m]-2;if T&&T>=1&&T<=8 then local R=self:GetSquare(Chess.NumToLetter[T],n-1,CheckTable)local S=self:GetSquare(Chess.NumToLetter[T],n+1,CheckTable)if n-1>=1&&(!R||self:SquareTeam(R)==(r&&"Black"||"White"))then tbl[Chess.NumToLetter[T]][n-1]=true end;if n+1<=8&&(!S||self:SquareTeam(S)==(r&&"Black"||"White"))then tbl[Chess.NumToLetter[T]][n+1]=true end end;local U=Chess.NumToLetter[m]local V=n-2;if V&&V>=1&&V<=8 then local R=self:GetSquare(Chess.NumToLetter[U-1],V,CheckTable)local S=self:GetSquare(Chess.NumToLetter[U+1],V,CheckTable)if U>1&&(!R||self:SquareTeam(R)==(r&&"Black"||"White"))then tbl[Chess.NumToLetter[U-1]][V]=true end;if U<8&&(!S||self:SquareTeam(S)==(r&&"Black"||"White"))then tbl[Chess.NumToLetter[U+1]][V]=true end end;local W=n+2;if W&&W>=1&&W<=8 then local R=self:GetSquare(Chess.NumToLetter[U-1],W,CheckTable)local S=self:GetSquare(Chess.NumToLetter[U+1],W,CheckTable)if U>1&&(!R||self:SquareTeam(R)==(r&&"Black"||"White"))then tbl[Chess.NumToLetter[U-1]][W]=true end;if U<8&&(!S||self:SquareTeam(S)==(r&&"Black"||"White"))then tbl[Chess.NumToLetter[U+1]][W]=true end end end;if!x then for F,G in pairs(tbl)do for H,I in pairs(G)do local J=table.Copy(self.Pieces)J[m][n]=nil;J[F][H]={Team=r&&"White"||"Black",Class=class,Moved=true}if self:CheckForCheck(J,r)then tbl[F][H]=nil end end end end;return tbl end;function ENT:CastlingCheck(o,r)if!o then return false,false end;local n=r&&1||8;local X=self:SquareMoved(o)local E=self:CheckForCheck(self.Pieces,r)local L,K=false,false;if!Moved&&!E then local K=self:GetSquare("h",n,CheckTable)local L=self:GetSquare("a",n,CheckTable)if K&&!self:SquareMoved(K)then if!(self:GetSquare("f",n,CheckTable)||self:GetSquare("g",n,CheckTable))then local J=table.Copy(self.Pieces)J["d"][n]=nil;J["f"][n]={Team=r&&"White"||"Black",Class=class,Moved=true}local M=!self:CheckForCheck(J,r)local J=table.Copy(self.Pieces)J["d"][n]=nil;J["g"][n]={Team=r&&"White"||"Black",Class=class,Moved=true}local N=!self:CheckForCheck(J,r)if M&&N then K=true end end end;if L&&!self:SquareMoved(L)then if!(self:GetSquare("b",n,CheckTable)||self:GetSquare("c",n,CheckTable)||self:GetSquare("d",n,CheckTable))then local J=table.Copy(self.Pieces)J["d"][n]=nil;J["c"][n]={Team=r&&"White"||"Black",Class=class,Moved=true}local O=!self:CheckForCheck(J,r)local J=table.Copy(self.Pieces)J["d"][n]=nil;J["d"][n]={Team=r&&"White"||"Black",Class=class,Moved=true}local P=!self:CheckForCheck(J,r)if O&&P then L=true end end end end;return L,K end;function ENT:RefreshSquares()self.Squares={}self.LastSquaresUpdatePos=self:GetPos()local Y=self:LocalToWorld(self.TopLeft)local Z=-self:GetRight()*self.RealH;local _=self:GetUp()*self.RealW;for a0=0,7 do self.Squares[a0]={}for a1=0,7 do local a2=_*a0+_*0.5;local a3=Z*a1+Z*0.5;self.Squares[a0][a1]=Y+a2+a3 end end;local a4=self:GetRight()*self.RealW/2;self.Squares[Chess.CHESS_WCAP1]={}self.Squares[Chess.CHESS_WCAP2]={}self.Squares[Chess.CHESS_BCAP1]={}self.Squares[Chess.CHESS_BCAP2]={}for a1=0,7 do local a5=_*8.5+_*0.5;local a6=_*9.3+_*0.5;local a3=a4*-(7+a1)+Z*0.5;self.Squares[Chess.CHESS_WCAP1][a1]=Y+a5+a3;self.Squares[Chess.CHESS_WCAP2][a1]=Y+a6+a3 end;for a1=0,7 do local a5=_*-1.4+_*0.5;local a6=_*-2.2+_*0.5;local a3=a4*(a1-7)+Z*0.5;self.Squares[Chess.CHESS_BCAP1][a1]=Y+a5+a3;self.Squares[Chess.CHESS_BCAP2][a1]=Y+a6+a3 end end;function ENT:GetSquarePos(a7,a8)return self:GetTableKey(self.Squares,a7,a8)end;function ENT:ResetBoard()self:RefreshSquares()if self.Pieces then for a9,G in pairs(self.Pieces)do for a9,aa in pairs(G)do if IsValid(aa.Ent)then aa.Ent:SetGridNum(-1)aa.Ent:Remove()end end end end;self.Pieces={["a"]={[1]={Team="White",Class="Rook",Moved=false},[2]={Team="White",Class="Pawn",Moved=false},[7]={Team="Black",Class="Pawn",Moved=false},[8]={Team="Black",Class="Rook",Moved=false}},["b"]={[1]={Team="White",Class="Knight",Moved=false},[2]={Team="White",Class="Pawn",Moved=false},[7]={Team="Black",Class="Pawn",Moved=false},[8]={Team="Black",Class="Knight",Moved=false}},["c"]={[1]={Team="White",Class="Bishop",Moved=false},[2]={Team="White",Class="Pawn",Moved=false},[7]={Team="Black",Class="Pawn",Moved=false},[8]={Team="Black",Class="Bishop",Moved=false}},["d"]={[1]={Team="White",Class="Queen",Moved=false},[2]={Team="White",Class="Pawn",Moved=false},[7]={Team="Black",Class="Pawn",Moved=false},[8]={Team="Black",Class="Queen",Moved=false}},["e"]={[1]={Team="White",Class="King",Moved=false},[2]={Team="White",Class="Pawn",Moved=false},[7]={Team="Black",Class="Pawn",Moved=false},[8]={Team="Black",Class="King",Moved=false}},["f"]={[1]={Team="White",Class="Bishop",Moved=false},[2]={Team="White",Class="Pawn",Moved=false},[7]={Team="Black",Class="Pawn",Moved=false},[8]={Team="Black",Class="Bishop",Moved=false}},["g"]={[1]={Team="White",Class="Knight",Moved=false},[2]={Team="White",Class="Pawn",Moved=false},[7]={Team="Black",Class="Pawn",Moved=false},[8]={Team="Black",Class="Knight",Moved=false}},["h"]={[1]={Team="White",Class="Rook",Moved=false},[2]={Team="White",Class="Pawn",Moved=false},[7]={Team="Black",Class="Pawn",Moved=false},[8]={Team="Black",Class="Rook",Moved=false}},[Chess.CHESS_WCAP1]={},[Chess.CHESS_WCAP2]={},[Chess.CHESS_BCAP1]={},[Chess.CHESS_BCAP2]={}}self:Update()end;function ENT:Update(ab,ac)if CLIENT then return end;ab,ac=ab||{},ac||{}net.Start("Chess.Update")net.WriteEntity(self)net.WriteTable(self.Pieces)if ab then net.WriteTable(ab)if ac then net.WriteTable(ac)end end;net.Broadcast()end;ENT.LastTick=0;ENT.LastTickTeam=""function ENT:Think()end;function ENT:GetPlayer(ad)if ad=='White'||ad==true then return self:GetWhitePlayer()else return self:GetBlackPlayer()end end;function ENT:EndGame(ae,af)self:SetChessState(Chess.CHESS_INACTIVE)self:SetPlaying(false)local ag=self:GetPlayer'White'local ah=self:GetPlayer'Black'local ai=self.WagerValue;self.WagerValue=nil;timer.Simple(0.5,function()if IsValid(ag)then ag:SetInChess(false)ag:SetActiveChessBoard(nil)if IsValid(self)&&ag:GetVehicle()==self.WhiteSeat then ag:ExitVehicle()end end;if IsValid(ah)then ah:SetInChess(false)ah:SetActiveChessBoard(nil)if IsValid(self)&&ah:GetVehicle()==self.BlackSeat then ah:ExitVehicle()end end end)self:SetWhitePlayer(NULL)self:SetBlackPlayer(NULL)local aj=(ai||0)*2;local ak=IsValid(ag)local al=IsValid(ah)if ae=='White'then self:GameWin(ag,ah)if ak&&ai then Chess.AddMoney(ag,aj,true)end elseif ae=='Black'then self:GameWin(ah,ag)if al&&ai then Chess.AddMoney(ah,aj,true)end elseif!ae then if ai then if ak then Chess.AddMoney(ag,ai,true)end;if al then Chess.AddMoney(ah,ai,true)end end;self:GameDraw(ag,ah,aj)end;local am=IsValid(ag)&&ag:Nick()||'[Anonymous White]'local an=IsValid(ah)&&ah:Nick()||'[Anonymous Black]'if!af then if ae=='White'then Chess.SendMessage(self,term.Get('ChessWonAgainst'),am,an)else Chess.SendMessage(self,term.Get('ChessWonAgainst'),an,am)end end end;function ENT:GameWin(ae,ao,ai)hook.Run('OnTabletopGameOver',self,ae,ao,ai)end;function ENT:GameDraw(ap,aq,ai)hook.Run('OnTabletopDrawn',self,ap,aq,ai)end;function ENT:DoCapture(o,ar,as)if!o then return end;table.Empty(self.RepetitionTable)self:SetRepetition(false)self:SetMoveCount(0)local class=o.Class;local at=false;local au,av;if o.Team=="White"then for a0=Chess.CHESS_BCAP1,Chess.CHESS_BCAP2 do for a1=1,8 do local aw=self:GetSquare(a0,a1)if!aw then self.Pieces[a0][a1]={Team="White",Class=class,Moved=false}aw=self.Pieces[a0][a1]at=true;au,av=a0,a1;break end end;if at then break end end else for a0=Chess.CHESS_WCAP1,Chess.CHESS_WCAP2 do for a1=1,8 do local aw=self:GetSquare(a0,a1)if!aw then self.Pieces[a0][a1]={Team="Black",Class=class,Moved=false}aw=self.Pieces[a0][a1]at=true;au,av=a0,a1;break end end;if at then break end end end;return{From={ar,as},To={au,av}}end;function ENT:CheckForCheck(tbl,ax)if!tbl then return true end;local ay,az,aA;for m,G in pairs(tbl)do for n,o in pairs(G)do if o&&self:SquareClass(o)=="King"&&(ax&&self:SquareTeam(o)=="White"||!ax&&self:SquareTeam(o)=="Black")then ay=o;az=m;aA=n;break end end;if ay then break end end;if!ay then return true end;for m,G in pairs(tbl)do for n,o in pairs(G)do if o&&(ax&&self:SquareTeam(o)=="Black"||!ax&&self:SquareTeam(o)=="White")then local aB=self:GetMove(m,n,true,tbl)if aB[az]&&aB[az][aA]then return true end end end end;return false end;function ENT:IsCheckmate(ax)for m,G in pairs(self.Pieces)do for n,o in pairs(G)do if o&&(ax&&self:SquareTeam(o)=="White"||!ax&&self:SquareTeam(o)=="Black")then local aB=self:GetMove(m,n,false,tbl)for aC,G in pairs(aB)do if table.Count(G)>0 then return false end end end end end;return true end;function ENT:NoMaterialCheck()local aD={}local aE={}for m,G in pairs(self.Pieces)do if m==Chess.CHESS_WCAP1||m==Chess.CHESS_WCAP2||m==Chess.CHESS_BCAP1||m==Chess.CHESS_BCAP2 then continue end;for n,o in pairs(G)do if o then local r=self:SquareTeam(o)=="White"local aF=self:SquareClass(o)if aF=="Queen"||aF=="Rook"||aF=="Pawn"then return false end;if aF=="King"then continue end;if r then table.insert(aE,{Square=o,Class=aF,GridLet=m,GridNum=n})else table.insert(aD,{square=o,Class=aF,GridLet=m,GridNum=n})end end end end;if#aD==0&&#aE==0 then return true end;if#aD==1&&#aE==0&&(aD[1].Class=="Bishop"||aD[1].Class=="Knight")then return true end;if#aD==0&&#aE==1&&(aE[1].Class=="Bishop"||aE[1].Class=="Knight")then return true end;local aG;for a0=1,#aD do if aD[a0].Class!="Bishop"then return false end;if!aG then aG=self:SquareColor(aD[a0].GridLet,aD[a0].GridNum)end;if aG!=self:SquareColor(aD[a0].GridLet,aD[a0].GridNum)then return false end end;for a0=1,#aE do if aE[a0].Class!="Bishop"then return false end;if!aG then aG=self:SquareColor(aE[a0].GridLet,aE[a0].GridNum)end;if aG!=self:SquareColor(aE[a0].GridLet,aE[a0].GridNum)then return false end end;return true end;function table.EqualsTable(CheckTable,aH,aI)if!(CheckTable&&aH)then return false end;aI=aI||1;if aI>=15 then error("Unable to match tables: Tables too deep!")end;if table.Count(CheckTable)!=table.Count(aH)then return false end;for aJ,I in pairs(CheckTable)do if type(I)=="table"then if type(aH[aJ])!="table"then return false end;if!table.EqualsTable(I,aH[aJ],aI+1)then return false end elseif type(I)=="Entity"then else if aH[aJ]!=I then return false end end end;return true end;function ENT:DoRepetition()local aK=self.Pieces;local aL=self:GetSquare("d",1)local aM=self:GetSquare("d",8)local aN,aO=self:CastlingCheck(aL,true)local aP,aQ=self:CastlingCheck(aM,false)for a9,aR in pairs(self.RepetitionTable)do if table.EqualsTable(aR.Pieces,aK)&&aR.WCQ==aN&&aR.WCK==aO&&aR.BCQ==aP&&aR.BCK==aQ then aR.Count=aR.Count+1;if aR.Count>=3 then self:SetRepetition(true)end;return end end;self:SetRepetition(false)table.insert(self.RepetitionTable,{WCQ=aN,WCK=aO,BCQ=aP,BCK=aQ,Pieces=table.Copy(aK),Count=1})end;function ENT:DoMove(aS,aT,ar,as)if CLIENT then return end;if!(aS&&ar&&aT&&as)then return end;if aS==ar&&aT==as then return end;local aU=self:GetSquare(aS,aT)if!aU then return end;local aB=self:GetMove(aS,aT)if!aB[ar][as]then return end;local aV=aB[ar][as]self:SetWhitePassant(0)self:SetBlackPassant(0)self:SetRepetition(false)self:SetMoveCount(aU.Class=="Pawn"&&0||self:GetMoveCount()+1)local aW;local aX;if aV=='PAWNDOUBLE'then if aU.Team=='White'then self:SetWhitePassant(a[Chess.NumToLetter[aS]])else self:SetBlackPassant(a[Chess.NumToLetter[aS]])end elseif aV=='ENPASSANT'then local aY=self:GetSquare(ar,aT)if aY&&aY.Class then aX=self:DoCapture(aY,ar,aT)end;self.Pieces[ar][aT]=nil;aW=true elseif aV=="CASTLEKINGSIDE"then aX=self:DoMove("h",aT,"f",aT)elseif aV=="CASTLEQUEENSIDE"then aX=self:DoMove("a",aT,"d",aT)end;local aZ=self:GetSquare(ar,as)if!aZ then self.Pieces[ar]=self.Pieces[ar]||{}self.Pieces[ar][as]=self.Pieces[ar][as]||{}aZ=self.Pieces[ar][as]end;if aZ.Class then aX=self:DoCapture(aZ,ar,as)end;aZ.Team=aU.Team;aZ.Class=aU.Class;aZ.Moved=true;self.Pieces[aS][aT]=nil;local d=self:GetPlayer(aZ.Team)if(as==1||as==8)&&aZ.Class=="Pawn"&&IsValid(d)then net.Start'Chess.PromotionSelection'net.WriteUInt(Chess.NumToLetter[ar],5)net.Send(d)self:SetChessState(aZ.Team=="White"&&Chess.CHESS_WHITEPROMO||Chess.CHESS_BLACKPROMO)else self:SetChessState(aZ.Team=="White"&&Chess.CHESS_BLACKMOVE||Chess.CHESS_WHITEMOVE)end;local a_={From={aS,aT},To={ar,as}}self:Update(a_,aX)local b0=self:CheckForCheck(self.Pieces,aZ.Team!='White')local b1=self:IsCheckmate(aZ.Team!='White')if b0&&b1 then local b2=self:GetPlayer('White')local b3=self:GetPlayer('Black')local am=IsValid(WhitePly)&&b2:Nick()||'[Anonymous White]'local an=IsValid(BlackPly)&&b3:Nick()||'[Anonymous Black]'if aZ.Team=='White'then Chess.SendMessage(self,term.Get('ChessCheckmate'),am,an)else Chess.SendMessage(self,term.Get('ChessCheckmate'),an,am)end;self:EndGame(aZ.Team)return elseif b1 then local b2=self:GetPlayer'White'local b3=self:GetPlayer'Black'local am=IsValid(WhitePly)&&b2:Nick()||'[Anonymous White]'local an=IsValid(BlackPly)&&b3:Nick()||'[Anonymous Black]'Chess.SendMessage(self,term.Get('ChessStalemate'),am,an)self:EndGame()return end;local b4=self:NoMaterialCheck()if b4 then local b2=self:GetPlayer'White'local b3=self:GetPlayer'Black'local am=IsValid(WhitePly)&&b2:Nick()||'[Anonymous White]'local an=IsValid(BlackPly)&&b3:Nick()||'[Anonymous Black]'Chess.SendMessage(self,term.Get('ChessInsufficientMaterial'),am,an)self:EndGame()return end;if aW then self:SetRepetition(false)else self:DoRepetition()end;return a_ end;function ENT:GameName()return self.Game||'a board game'end;local b5,b6;function ENT:Refresh()for m,b7 in pairs(self.Pieces)do for n,o in pairs(b7)do if!IsValid(o.Ent)||Chess.NumToLetter[o.Ent:GetGridLet()]!=m||o.Ent:GetGridNum()!=n then b7[n]=nil end end end end;function ENT:RequestMove(aS,aT,ar,as)if!(aS&&aT&&ar&&as)then return end;net.Start'Chess.ClientRequestMove'net.WriteUInt(aS+1,5)net.WriteUInt(8-aT,5)net.WriteUInt(ar+1,5)net.WriteUInt(8-as,5)net.SendToServer()end;local b8={Main=Color(0,0,0,200),ToMove=Color(200,200,200,20),Text=Color(180,180,180),White=color_white,Black=Color(20,20,20,255)}function ENT:CreateChessPanel()self:EndSpectating()if IsValid(b5)then b5:Remove()end;return ui.Create('ui_chesscontrol',function(b9)b9:Populate(self,!self.IsDraughts)end)end;function ENT:CreateWagerPanel()if IsValid(b6)then b6:Remove()end;return ui.Create('ui_chess_wager',function(b9)b9:Populate(self,!self.IsDraughts)end)end;local ba,bb,bc;local bd=Vector(0,0,30)local be=Angle(0,0,0)local function bf(d,Y,bg,bh,bi,bj)if d:InChess()||IsValid(d.Chess_Spectating)then if d:InChess()then bc=d:GetActiveChessBoard()else bc=d.Chess_Spectating end;if!IsValid(bc)then return end;if d:InChess()then if!IsValid(b5)then b5=IsValid(bc.ChessPanel)&&bc.ChessPanel||bc:CreateChessPanel()bc.ChessPanel=b5 end;if bc:GetChessState()==Chess.CHESS_WAGER then if!IsValid(b6)then b6=IsValid(bc.WagerPanel)&&bc.WagerPanel||bc:CreateWagerPanel()bc.WagerPanel=b6 end elseif IsValid(b6)then b6:Remove()end end;local bk=bc:GetPos()+bd;if d.Chess_Spectating then d.Chess_ViewAngle=d.Chess_ViewAngle||bc:GetRight()*-20;local bl=RealTime()local bm=bl-(bc.LastCameraUpdate||bl)bc.LastCameraUpdate=bl;d.Chess_ViewMomentum=d.Chess_ViewMomentum||math.random(-100,100)be.y=d.Chess_ViewMomentum*bm;d.Chess_ViewAngle:Rotate(be)d.Chess_ViewMomentum=math.Approach(d.Chess_ViewMomentum,0,bm*150)local bn=input.IsMouseDown(MOUSE_LEFT)local bo=bn&&!bc.WasMouseDown;local bp=gui.MouseX()if bn&&!bo then d.Chess_ViewMomentum=((bc.LastX||bp)-bp)*bm*500 end;bc.LastX=bp;bc.WasMouseDown=bn;bk=bk+d.Chess_ViewAngle elseif d==bc:GetBlackPlayer()then bk=bk+bc:GetRight()*(bc.FlipView&&-20||20)else bk=bk+bc:GetRight()*(bc.FlipView&&20||-20)end;local bq=(bc:GetPos()-bk):Angle()if input.IsKeyDown(KEY_LALT)then bq=bg;gui.EnableScreenClicker(false)else gui.EnableScreenClicker(true)end;local br={origin=bk,angles=bq,fov=bh,znear=bi,zfar=bj,drawviewer=true}ba=true;bb=bk;return br elseif ba then gui.EnableScreenClicker(false)bb=nil;bc=nil;ba=nil else if IsValid(b5)then b5:Remove()end;if IsValid(b6)then b6:Remove()end;bb=nil;bc=nil;ba=nil end end;hook.Add('CalcView','ChessBoardSeatCam',bf)function ENT:ResetHighlights()self.Highlight={-1,-1}self.Selected={-1,-1}self.Moves={}end;function ENT:GetTraceFilter()local tbl=player.GetAll()for m,b7 in pairs(self.Pieces)do for n,o in pairs(b7)do if IsValid(o.Ent)then table.insert(tbl,o.Ent)end end end;return tbl end;local bs,bt,bu=Color(0,255,0,50),Color(50,50,50,200),Color(150,50,50,150)local bv,bw,bx=Color(0,0,0,120),Color(255,255,255,10),Color(50,50,150,150)function ENT:Draw()if self.IsInCheck then if!self.PlayedCheckSound then sound.Play(self.CheckSound,self:GetPos())self.PlayedCheckSound=true end else self.PlayedCheckSound=nil end;if IsValid(Chess.TwoDDermaPanel)then return end;local bl=CurTime()if(self.LastReScaleTime||0)+10<bl then self:EnableMatrix("RenderMultiply",c)self.LastReScaleTime=bl end;if!self.PiecesEnts then self.PiecesEnts={}for a0=1,16 do self.PiecesEnts[a0]=ClientsideModel(self.Models["WhitePawn"])self.PiecesEnts[a0]:SetNoDraw(true)self.PiecesEnts[a0]:EnableMatrix("RenderMultiply",c)end end;if FrameTime()>=0.33&&!self.SpectatingTable then if self.FPSFailTimeout&&self.FPSFailTimeout<bl then self.FPSFailCount=0 end;if!self.FPSNextCheck||self.FPSNextCheck<=bl then self.FPSNextCheck=bl+0.1;self.FPSFailTimeout=bl+2;self.FPSFailCount=(self.FPSFailCount||0)+1;if self.FPSFailCount>=30 then self.LowFPSCheck=bl+5 end end end;local by=LocalPlayer():InChess()if self:GetPos()!=self.LastSquaresUpdatePos then self:RefreshSquares()end;if by||self.SpectatingTable||!(self.LowFPSCheck&&self.LowFPSCheck>bl)then local a0=0;for bz,b7 in pairs(self.Pieces)do for bA,o in pairs(b7)do if!(o.Team&&o.Class)then continue end;a0=(a0||0)+1;local Y=self:GetSquarePos(bz,bA)if o.Moving&&o.MoveStart then local bm=math.Clamp((RealTime()-o.MoveStart)/self.MoveTime,0,1)if bm==1||!bm then o.Moving=false;sound.Play(self.MoveSound,Y)else local bB=bm*6>=3&&6-bm*6||bm*6;Y=Vector(o.MoveFrom[1]+(Y[1]-o.MoveFrom[1])*bm,o.MoveFrom[2]+(Y[2]-o.MoveFrom[2])*bm,Y[3]+bB)end end;if!IsValid(self.PiecesEnts[a0])then self.PiecesEnts[a0]=ClientsideModel(self.Models["WhitePawn"])self.PiecesEnts[a0]:SetNoDraw(true)self.PiecesEnts[a0]:EnableMatrix("RenderMultiply",c)end;if self.PiecesEnts[a0]:GetPos()!=Y then self.PiecesEnts[a0]:SetPos(Y)end;if self.PiecesEnts[a0]:GetModel()!=self.Models[o.Team..o.Class]then self.PiecesEnts[a0]:SetModel(self.Models[o.Team..o.Class])end;self.PiecesEnts[a0]:DrawModel()if self.DrawDouble&&self.DrawDouble[o.Class]then self.PiecesEnts[a0]:SetModel(self.Models["dama"])self.PiecesEnts[a0]:SetModel(self.Models[o.Team..o.Class])self.PiecesEnts[a0]:SetPos(Y+Vector(0,0,(self.PiecesEnts[a0]:OBBMaxs()[3]-self.PiecesEnts[a0]:OBBMins()[3])*0.1225))self.PiecesEnts[a0]:DrawModel()end end end end;self:DrawModel()if!by then self.Highlight=nil;self.Selected=nil;self.Moves=nil;self.FlipView=false;if!cvars.Bool("chess_debug")then return end end;self.Highlight=self.Highlight||{-1,-1}self.Selected=self.Selected||{-1,-1}self.Moves=self.Moves||{}local bn=input.IsMouseDown(MOUSE_LEFT)local bo=bn&&!self.WasMouseDown;if bc==self then self.Highlight[1]=-1;self.Highlight[2]=-1;local bC,bD=gui.MouseX(),gui.MouseY()local bE=bb+gui.ScreenToVector(bC,bD)*10000;local e=util.TraceLine({start=bb,endpos=bE,filter=self:GetTraceFilter()})local Y=self:WorldToLocal(e.HitPos)local bC,bD=-1,-1;if Y[2]>self.TopLeft[2]&&Y[3]>self.TopLeft[3]then for a0=0,8 do if Y[2]<self.TopLeft[2]+self.RealW*a0 then break end;bD=a0 end;for a0=0,8 do if Y[3]<self.TopLeft[3]+self.RealH*a0 then break end;bC=a0 end end;self.Highlight={bC,bD}if self.Highlight[1]==8 then self.Highlight[1]=-1 end;if self.Highlight[2]==8 then self.Highlight[2]=-1 end;if bo then if self.Selected&&self:GetTableGrid(self.Moves,bC,bD)then self:RequestMove(self.Selected[1],self.Selected[2],bC,bD)self:ResetHighlights()else self:ResetHighlights()self.Selected={bC,bD}self.Moves=self:GetMove(Chess.NumToLetter[bC+1],8-bD)end end else self.Selected[1]=-1;self.Selected[2]=-1;self.Highlight[1]=-1;self.Highlight[2]=-1;self.Moves={}if!cvars.Bool("chess_debug")then return end end;local Y=self:LocalToWorld(self.TopLeft)local bg=self:GetUp():Angle()cam.Start3D2D(Y,bg,0.05)for a0=0,7 do for a1=0,7 do local bF=self.SquareW*a0;local bG=self.SquareH*a1;local o=self:GetTableGrid(self.Pieces,a0,a1)if o&&IsValid(o.Ent)then draw.RoundedBox(0,bF,bG,self.SquareW,self.SquareH,o.Ent:GetWhite()&&bw||bv)end;if self.Highlight[1]==a0&&self.Highlight[2]==a1 then draw.RoundedBox(0,bF,bG,self.SquareW,self.SquareH,bs)end;if self:GetTableGrid(self.Moves,a0,a1)then draw.RoundedBox(0,bF,bG,self.SquareW,self.SquareH,bx)end;if self.Selected[1]==a0&&self.Selected[2]==a1 then draw.RoundedBox(0,bF,bG,self.SquareW,self.SquareH,bu)end;if cvars.Bool("chess_debug")then draw.RoundedBox(0,bF,bG,self.SquareW,self.SquareH,Color(255,255,255,50))end;if cvars.Bool("chess_gridletters")then bG=bG+self.SquareH-20;local bH=Chess.NumToLetter[a0+1]..tostring(8-a1)draw.SimpleText(bH,"ui.16",bF+6,bG+1,color_black)draw.SimpleText(bH,"ui.16",bF+5,bG,color_white)end end end;cam.End3D2D()self.WasMouseDown=input.IsMouseDown(MOUSE_LEFT)end;function ENT:EndSpectating()local d=LocalPlayer()if!IsValid(d)then return end;if!self.SpectatingTable then return end;chat.AddText(b,'You are no longer spectating this game.')d.Chess_Spectating=nil;self.SpectatingTable=false;if IsValid(self.SpectatingFrame)then self.SpectatingFrame:Remove()end end;function ENT:GetSpectateUse(d,bI)if d!=LocalPlayer()then return end;if bI!=IN_USE||input.IsMouseDown(MOUSE_LEFT)then return end;if CurTime()<(self.Spec_LastPoll||0)+1 then return end;self.Spec_LastPoll=CurTime()if IsValid(d.Chess_Spectating)then return end;if d==self:GetWhitePlayer()||d==self:GetBlackPlayer()then self:EndSpectating()return end;local e=util.TraceLine({start=d:EyePos(),endpos=d:EyePos()+d:GetAimVector()*150,filter=d})if!(e.Hit&&IsValid(e.Entity))then self:EndSpectating()return end;if e.Entity!=self:GetTableEnt()then self:EndSpectating()return end;chat.AddText(b,'You are now spectating this game.')self.SpectatingTable=true;d.Chess_Spectating=self;self.SpectatingFrame=ui.Create('ui_chesscontrol',function(b9)b9:Populate(self,true,true)end)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gambling_machine_base/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gambling_machine_roulette/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gambling_machine_spinwheel/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gambling_machine_spinwheel/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gmod_button.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_gmodentity")ENT.PrintName=""ENT.Author=""ENT.Contact=""ENT.Purpose=""ENT.Instructions=""function ENT:SetupDataTables()self:NetworkVar("Int",0,"Key")self:NetworkVar("Bool",0,"On")self:SetOn(false)self.Toggled=false end;function ENT:Initialize()if SERVER then else self.PosePosition=0 end end;function ENT:Use(a,b,c,d)if!a:IsPlayer()then return end;if self.Toggled then if c==USE_ON then self:Toggle(!self:GetOn(),a)end;return end;if IsValid(self.LastUser)then return end;if self:GetOn()then self:Toggle(false,a)return end;self:Toggle(true,a)self:NextThink(CurTime())self.LastUser=a end;function ENT:Think()self.BaseClass.Think(self)if CLIENT then self:UpdateLever()end;if SERVER&&self:GetOn()&&!self.Toggled then if!IsValid(self.LastUser)||!self.LastUser:KeyDown(IN_USE)then self:Toggle(false,self.LastUser)self.LastUser=nil end;self:NextThink(CurTime())end end;function ENT:Toggle(e,f)local g=self:GetPlayer()if!IsValid(g)then return end;g.UsingKeypad=true;if e then numpad.Activate(g,self:GetKey(),true)self:SetOn(true)else numpad.Deactivate(g,self:GetKey(),true)self:SetOn(false)end;g.UsingKeypad=false end;function ENT:UpdateLever()local h=0.0;if self:GetOn()then h=1.0 end;self.PosePosition=math.Approach(self.PosePosition,h,FrameTime()*5.0)self:SetPoseParameter("switch",self.PosePosition)self:InvalidateBoneCache()end;function ENT:Draw()self:DrawModel()end
--addons/!lpakr_out/lua/entities/gmod_wire_consolescreen/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_freezer.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Freezer"ENT.WireDebugName="Freezer"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.State=false;self.CollisionState=0;self.Marks={}self.Inputs=WireLib.CreateInputs(self,{"Activate","Disable Collisions"})self:UpdateOutputs()end;function ENT:TriggerInput(a,b)local c=self:GetPlayer()if!c:IsValid()then return end;if a=="Activate"then self.State=b!=0;for d,e in pairs(self.Marks)do if e:IsValid()then local f=e:GetPhysicsObject()if f:IsValid()then if self.State then gamemode.Call("OnPhysgunFreeze",self,f,e,c)else if!gamemode.Call("CanPlayerUnfreeze",c,e,f)then return end;f:EnableMotion(true)f:Wake()end end end end elseif a=="Disable Collisions"then self.CollisionState=math.Clamp(math.Round(b),0,4)for d,e in pairs(self.Marks)do if e:IsValid()then local f=e:GetPhysicsObject()if f:IsValid()&&WireLib.CanTool(c,e,"nocollide")then if self.CollisionState==0 then e:SetCollisionGroup(COLLISION_GROUP_NONE)f:EnableCollisions(true)elseif self.CollisionState==1 then e:SetCollisionGroup(COLLISION_GROUP_WORLD)f:EnableCollisions(true)elseif self.CollisionState==2 then e:SetCollisionGroup(COLLISION_GROUP_NONE)f:EnableCollisions(false)elseif self.CollisionState==3 then e:SetCollisionGroup(COLLISION_GROUP_WEAPON)f:EnableCollisions(true)elseif self.CollisionState==4 then e:SetCollisionGroup(COLLISION_GROUP_WEAPON)f:EnableCollisions(false)end end end end end;self:UpdateOverlay()end;local g={[0]="Normal Collisions",[1]="Disabled prop/player Collisions",[2]="Disabled prop/world Collisions",[3]="Disabled player Collisions",[4]="Disabled prop/world/player Collisions"}function ENT:UpdateOverlay()self:SetOverlayText((self.State&&"Frozen"||"Unfrozen").."\n"..g[self.CollisionState].."\n".."Linked Entities: "..#self.Marks)end;function ENT:UpdateOutputs()self:UpdateOverlay()WireLib.SendMarks(self)end;function ENT:CheckEnt(e)if IsValid(e)then for h,i in pairs(self.Marks)do if i==e then return true,h end end end;return false,0 end;function ENT:LinkEnt(e)if self:CheckEnt(e)then return false end;self.Marks[#self.Marks+1]=e;e:CallOnRemove("AdvEMarker.Unlink",function(e)if self:IsValid()then self:UnlinkEnt(e)end end)self:UpdateOutputs()return true end;function ENT:UnlinkEnt(e)local j,h=self:CheckEnt(e)if j then table.remove(self.Marks,h)self:UpdateOutputs()end;return j end;function ENT:ClearEntities()self.Marks={}self:UpdateOutputs()end;duplicator.RegisterEntityClass("gmod_wire_freezer",WireLib.MakeWireEnt,"Data")function ENT:BuildDupeInfo()local k=BaseClass.BuildDupeInfo(self)||{}if next(self.Marks)then local l={}for h,i in pairs(self.Marks)do l[h]=i:EntIndex()end;k.marks=l end;return k end;function ENT:ApplyDupeInfo(c,e,k,m)BaseClass.ApplyDupeInfo(self,c,e,k,m)if k.Ent1 then table.insert(self.Marks,m(k.Ent1))end;if k.marks then for h,n in pairs(k.marks)do self.Marks[h]=m(n)end end;self:TriggerInput("Disable Collisions",self.Inputs["Disable Collisions"].Value)self:UpdateOutputs()end
--addons/!lpakr_out/lua/entities/gmod_wire_latch.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Constraint Latch"ENT.Purpose="Controllable weld and nocollide between two selected entities"ENT.WireDebugName="Latch"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=Wire_CreateInputs(self,{"Activate","NoCollide","Strength"})self.Outputs=Wire_CreateOutputs(self,{"Welded"})self.nocollide_masks={{false,false,true},{true,false,false},{false,true,false},{true,true,false}}self.nocollide_description={"NoCollided","Ent1 has collisions disabled","Ent2 has collisions disabled","All collisions disabled"}self.Nocollide=nil;self:TriggerInput("NoCollide",0)end;local function a(b,c)if IsValid(c)then if!c.Constraint||c.Constraint==b then c.Constraint=nil;Wire_TriggerOutput(c,"Welded",0)c:UpdateOverlay()end end end;function ENT:Remove_Weld()if self.Constraint then if self.Constraint:IsValid()then self.Constraint:Remove()end;self.Constraint=nil end end;function ENT:Create_Weld()self:Remove_Weld()self.Constraint=MakeWireLatch(self.Ent1,self.Ent2,self.Bone1,self.Bone2,self.weld_strength||0)if self.Constraint then self.Constraint:CallOnRemove("Weld Latch Removed",a,self)end end;function ENT:SendVars(d,e,f,g,h)self.Ent1=d;self.Ent2=e;self.Bone1=f;self.Bone2=g;self.Constraint=h end;function ENT:TriggerInput(i,j)if i=="Activate"then if j==0&&self.Constraint then self:Remove_Weld()elseif j!=0&&!self.Constraint then self:Create_Weld()Wire_TriggerOutput(self,"Welded",1)end elseif i=="NoCollide"then self.nocollide_status=j;local k=self.nocollide_masks[j]||{false,false,false}if IsValid(self.Ent1)then local l=self.Ent1:GetPhysicsObject()if l:IsValid()then l:EnableCollisions(!k[1])end end;if IsValid(self.Ent2)then local l=self.Ent2:GetPhysicsObject()if l:IsValid()then l:EnableCollisions(!k[2])end end;if k[3]then if!self.Nocollide then if self.Ent1&&self.Ent2 then self.Nocollide=constraint.NoCollide(self.Ent1,self.Ent2,self.Bone1,self.Bone2)end end else if self.Nocollide then if self.Nocollide:IsValid()then self.Nocollide:Input("EnableCollisions",nil,nil,nil)self.Nocollide:Remove()end;self.Nocollide=nil end end elseif i=="Strength"then local m=math.max(j,0)if m!=self.weld_strength then self.weld_strength=m;if self.Constraint then self:Create_Weld()end end end;self:UpdateOverlay()end;function ENT:OnRemove()self:TriggerInput("Activate",0)self:TriggerInput("NoCollide",0)end;function ENT:UpdateOverlay()local n=self.nocollide_description[self.nocollide_status]if!n then if IsValid(self.Constraint)then self:SetOverlayText("Welded")else self:SetOverlayText("Deactivated")end;return end;local o=self.Constraint&&"Welded and "||"Not welded but "o=o..n;self:SetOverlayText(o)end;function ENT:BuildDupeInfo()local p=BaseClass.BuildDupeInfo(self)||{}if IsValid(self.Ent1)then p.Ent1=self.Ent1:EntIndex()p.Bone1=self.Bone1 end;if IsValid(self.Ent2)then p.Ent2=self.Ent2:EntIndex()p.Bone2=self.Bone2 end;p.Activate=self.Constraint&&1||0;p.NoCollide=self.nocollide_status;p.weld_strength=self.weld_strength;return p end;function ENT:ApplyDupeInfo(q,c,p,r)BaseClass.ApplyDupeInfo(self,q,c,p,r)self.Ent1=r(p.Ent1,game.GetWorld())if IsValid(self.Ent1)then self.Bone1=p.Bone1 end;self.Ent2=r(p.Ent2,game.GetWorld())if IsValid(self.Ent2)then self.Bone2=p.Bone2 end;self:TriggerInput("Strength",p.weld_strength||0)self:TriggerInput("Activate",p.Activate)self:TriggerInput("NoCollide",p.NoCollide)end;duplicator.RegisterEntityClass("gmod_wire_latch",WireLib.MakeWireEnt,"Data")function MakeWireLatch(d,e,f,g,s)if!constraint.CanConstrain(d,f)then return false end;if!constraint.CanConstrain(e,g)then return false end;local t=d:GetPhysicsObjectNum(f)local u=e:GetPhysicsObjectNum(g)if t==u then return false end;local h=constraint.Weld(d,e,f,g,s||0)if!IsValid(h)then return nil end;h.Type=""return h end
--addons/!lpakr_out/lua/entities/gmod_wire_lever.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Analog Lever"ENT.WireDebugName="Lever"function ENT:CalcAngle(a,b)local c=self:GetPos()local d=self:GetRight()local e=self:WorldToLocal(a+b*(c-a):Dot(d)/b:Dot(d))self.Ang=math.Clamp(math.deg(math.atan2(e[1],e[3])),-45,45)end;if CLIENT then function ENT:Initialize()self.RBMin,self.RBMax=self:GetRenderBounds()self.RBMin:Add(Vector(-30,0,0))self.RBMax:Add(Vector(30,0,60))end;local f=ENT.RenderGroup;function ENT:Draw()if!IsValid(self.csmodel)then self.csmodel=ClientsideModel("models/props_wasteland/tram_lever01.mdl",f)self.csmodel:SetParent(self)self.NextRBUpdate=0 end;self.User=self:GetNWEntity("User",NULL)if IsValid(self.User)then self:CalcAngle(self.User:GetShootPos(),self.User:GetAimVector())else self.Ang=self:GetNWFloat("Ang",0)end;local g=Angle(self.Ang,0,0)local h=self:LocalToWorldAngles(g)local i=self:LocalToWorld(g:Up()*21)render.Model({model=self.csmodel:GetModel(),pos=i,angle=h},self.csmodel)BaseClass.Draw(self)end;function ENT:Think()if CurTime()>=(self.NextRBUpdate||0)then self.NextRBUpdate=CurTime()+10;self:SetRenderBounds(self.RBMin,self.RBMax)end;local j=LocalPlayer():KeyDown(IN_USE)||LocalPlayer():KeyDown(IN_ATTACK)if j&&!self.wasClicking&&IsValid(self.csmodel)then local k=LocalPlayer():GetShootPos()if k:DistToSqr(self:GetPos())<100^2 then local l=util.IntersectRayWithOBB(k,LocalPlayer():GetAimVector()*100,self.csmodel:GetPos(),self.csmodel:GetAngles(),self.csmodel:OBBMins()-Vector(2,2,2),self.csmodel:OBBMaxs()+Vector(2,2,2))if l then net.Start("wire_lever_activate")net.WriteEntity(self)net.SendToServer()end end end;self.wasClicking=j end else util.PrecacheModel("models/props_wasteland/tram_lever01.mdl")function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self:SetUseType(SIMPLE_USE)self.Ang=0;self.Value=0;self:Setup(0,1)self.Inputs=WireLib.CreateInputs(self,{"SetValue","Min","Max"})self.Outputs=WireLib.CreateOutputs(self,{"Value","Entity [ENTITY]"})end;function ENT:Setup(m,n)m=m||0;n=n||1;self.Min=math.min(m,n)self.Max=math.max(m,n)end;function ENT:TriggerInput(o,p)if o=="SetValue"then self.Ang=(math.Clamp(p,self.Min,self.Max)-self.Min)/(self.Max-self.Min)*90-45 elseif o=="Min"then self.Min=p elseif o=="Max"then self.Max=p end end;function ENT:Use(q)if!IsValid(q)||!q:IsPlayer()||IsValid(self.User)then return end;self.User=q;WireLib.TriggerOutput(self,"Entity",q)self:SetNWEntity("User",self.User)end;util.AddNetworkString("wire_lever_activate")net.Receive("wire_lever_activate",function(r,q)local s=net.ReadEntity()if!IsValid(q)||!IsValid(s)||!s.Use||s:GetClass()!="gmod_wire_lever"then return end;if IsValid(s.User)then return end;if q:GetShootPos():DistToSqr(s:GetPos())<100^2 then s:Use(q,q,USE_ON,1)end end)function ENT:Think()BaseClass.Think(self)if IsValid(self.User)then local a=self.User:GetShootPos()if a:DistToSqr(self:GetPos())<100^2&&(self.User:KeyDown(IN_USE)||self.User:KeyDown(IN_ATTACK))then local b=self.User:GetAimVector()self:CalcAngle(a,b)else self.User=NULL;WireLib.TriggerOutput(self,"Entity",NULL)self:SetNWEntity("User",self.User)end end;local t=self.Value;self.Value=Lerp((self.Ang+45)/90,self.Min,self.Max)if self.Value!=t then WireLib.TriggerOutput(self,"Value",self.Value)self:ShowOutput()self:SetNWFloat("Ang",self.Ang)end;self:NextThink(CurTime())return true end;function ENT:ShowOutput()self:SetOverlayText(string.format("(%.2f - %.2f) = %.2f",self.Min,self.Max,self.Value))end;function ENT:ConvertFromOldLever(u)self:SetParent()constraint.RemoveAll(self)local v=self:GetSolid()local w=self:GetPhysicsObject():IsMotionEnabled()self:SetNotSolid(true)self:GetPhysicsObject():EnableMotion(false)self:SetModel("models/props_wasteland/tram_leverbase01.mdl")self:PhysicsInit(SOLID_VPHYSICS)self:SetPos(u:GetPos())self:SetAngles(u:GetAngles())timer.Simple(0,function()if!IsValid(self)then return end;if u.Constraints then for x,y in pairs(u.Constraints)do local z=y.Ent1;local A=y.Ent2;local B=y.Bone1;local C=y.Bone2;if z==u then z=self elseif A==u then A=self end;if y.Type=="Weld"then local D=y.forcelimit;local E=y.nocollide;local F=false;constraint.Weld(z,A,B,C,D,E,F)elseif y.Type=="NoCollide"then constraint.NoCollide(z,A,B,C)end end end;self:SetParent(u:GetParent())u:Remove()self:SetNotSolid(!v)self:GetPhysicsObject():EnableMotion(w)end)end;local G=setmetatable({},{__mode="kv"})hook.Add("AdvDupe_FinishPasting","LeverFixOldDupe",function(H)if next(G)==nil then return end;local I={}for J,s in pairs(H[1].CreatedEntities)do if s:GetClass()=="gmod_wire_lever"then I[s]=true end end;for self,u in pairs(G)do if u:IsValid()&&self:IsValid()then if I[self]then self:ConvertFromOldLever(u)G[self]=nil end else if u:IsValid()then u:Remove()end;if self:IsValid()then self:Remove()end;G[self]=nil end end end)function ENT:BuildDupeInfo()local K=BaseClass.BuildDupeInfo(self)||{}K.value=self.Value;return K end;function ENT:ApplyDupeInfo(q,s,K,L)BaseClass.ApplyDupeInfo(self,q,s,K,L)if K.baseent then local u=L(K.baseent)G[self]=u end;if K.value then self.Value=nil;self:TriggerInput("SetValue",K.value)end end;duplicator.RegisterEntityClass("gmod_wire_lever",WireLib.MakeWireEnt,"Data","Min","Max")end
--addons/!lpakr_out/lua/entities/gmod_wire_numpad.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Numpad"ENT.WireDebugName="Numpad"if CLIENT then return end;local a={"0","1","2","3","4","5","6","7","8","9",".","enter","+","-","*","/"}local b={37,38,39,40,41,42,43,44,45,46,52,51,50,49,48,47}local c={}for d,e in ipairs(a)do c[e]=b[d]end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=Wire_CreateInputs(self,a)self.Outputs=Wire_CreateOutputs(self,a)self.Buffer={}for f=1,#a do self.Buffer[f]=0 end end;function ENT:ReadCell(g)g=math.floor(g)if g>=0&&g<#a then return self.Buffer[g+1]else return nil end end;function ENT:WriteCell(g,h)g=math.floor(g)if g>=0&&g<#a then self:TriggerInput(a[g+1],h)return true else return false end end;function ENT:TriggerInput(i,h)if h!=0 then numpad.Activate(self:GetPlayer(),c[i],true)else numpad.Deactivate(self:GetPlayer(),c[i],true)end end;function ENT:Setup(j,k,l)self.toggle=j;self.value_off=k;self.value_on=l;self.impulses={}for d,m in ipairs(b)do table.insert(self.impulses,numpad.OnDown(self:GetPlayer(),m,"WireNumpad_On",self,d))table.insert(self.impulses,numpad.OnUp(self:GetPlayer(),m,"WireNumpad_Off",self,d))end;self:ShowOutput()end;function ENT:NumpadActivate(i)if self.toggle then return self:Switch(self.Buffer[i]==0,i)end;return self:Switch(true,i)end;function ENT:NumpadDeactivate(i)if self.toggle then return true end;return self:Switch(false,i)end;function ENT:Switch(n,i)if!self:IsValid()then return false end;self.Buffer[i]=n&&1||0;self:ShowOutput()self.Value=n&&self.value_on||self.value_off;Wire_TriggerOutput(self,a[i],self.Value)return true end;function ENT:ShowOutput()local o=""for d,p in ipairs(a)do if self.Buffer[d]!=0 then o=o..", "..p end end;self:SetOverlayText(string.sub(o,2))end;function ENT:OnRemove()for q,r in ipairs(self.impulses)do numpad.Remove(r)end end;local function s(t,u,i)return u:NumpadActivate(i)end;numpad.Register("WireNumpad_On",s)local function v(t,u,i)return u:NumpadDeactivate(i)end;numpad.Register("WireNumpad_Off",v)duplicator.RegisterEntityClass("gmod_wire_numpad",WireLib.MakeWireEnt,"Data","toggle","value_off","value_on")
--addons/!lpakr_out/lua/entities/gmod_wire_spawner.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Prop Spawner"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WireDebugName="Prop Spawner"if CLIENT then return end;local a=CreateConVar("wire_spawner_delay",game.SinglePlayer()&&0||0.2)local b={}hook.Add("EntityRemoved","wire_spawner_EntityRemoved",function(c)if!b[c]then return end;b[c]:CheckEnts(c)b[c]=nil end)local function d(...)local e=DoPropSpawnedEffect;DoPropSpawnedEffect=function()end;local f=MakeProp(...)DoPropSpawnedEffect=e;return f end;function ENT:Initialize()self:SetMoveType(MOVETYPE_NONE)self:PhysicsInit(SOLID_VPHYSICS)self:SetCollisionGroup(COLLISION_GROUP_WEAPON)self:DrawShadow(false)self:SetTrigger(true)self.DisabledByTouch=false;self.DisabledByTimeUntil=CurTime()local g=self:GetPhysicsObject()if g:IsValid()then g:Wake()end;self.UndoList={}self.SpawnLastValue=0;self.UndoLastValue=0;self.CurrentPropCount=0;self.Inputs=WireLib.CreateSpecialInputs(self,{"Spawn","Undo","UndoEnt","SpawnEffect"},{"NORMAL","NORMAL","ENTITY","NORMAL"})self.Outputs=WireLib.CreateSpecialOutputs(self,{"Out","LastSpawned","Props"},{"NORMAL","ENTITY","ARRAY"})Wire_TriggerOutput(self,"Props",self.UndoList)end;function ENT:Setup(h,i,j,k,l,m,n,o,p)self.delay=h;self.undo_delay=i;self.spawn_effect=j;if l then self.mat=k;self.r=l;self.g=m;self.b=n;self.a=o;self.skin=p;self:SetRenderMode(3)self:SetMaterial(k||"")self:SetSkin(p||0)self:SetColor(Color(l||255,m||255,n||255,100))end;self:ShowOutput()end;function ENT:StartTouch(c)end;function ENT:EndTouch(c)if c.PropSpawner==self then self.DisabledByTouch=false end end;function ENT:DoSpawn(q,r)if self.DisabledByTimeUntil>CurTime()then return end;if self.DisabledByTouch then if IsValid(self.TouchDisabledProp)then local s,t=self:GetPhysicsObject():GetAABB()local u=t-s;local v=math.max(u.X,u.Y,u.Z)if self.TouchDisabledProp:GetPos():Distance(self:GetPos())<v*2 then return end end end;local c=self;if!c:IsValid()then return end;local g=c:GetPhysicsObject()if!g:IsValid()then return end;local w=c:GetPos()local x=c:GetAngles()local y=c:GetModel()local z=nil;if self.spawn_effect!=0 then z=MakeProp(q,w,x,y,{},{})else z=d(q,w,x,y,{},{})end;if!IsValid(z)then return end;z:SetMaterial(c:GetMaterial())z:SetColor(Color(self.r,self.g,self.b,self.a))z:SetSkin(c:GetSkin()||0)z.PropSpawner=self;local A=z:GetPhysicsObject()A:SetMass(g:GetMass())if!c:IsPlayerHolding()then A:SetVelocity(g:GetVelocity())A:AddAngleVelocity(g:GetAngleVelocity()-A:GetAngleVelocity())end;local B=constraint.NoCollide(z,c,0,0)if B:IsValid()then z:DeleteOnRemove(B)end;undo.Create("Prop")undo.AddEntity(z)undo.AddEntity(B)undo.SetPlayer(q)undo.Finish()if IsValid(q)then q:AddCleanup("props",z)q:AddCleanup("props",B)end;table.insert(self.UndoList,1,z)b[z]=self;Wire_TriggerOutput(self,"LastSpawned",z)self.CurrentPropCount=#self.UndoList;Wire_TriggerOutput(self,"Out",self.CurrentPropCount)Wire_TriggerOutput(self,"Props",self.UndoList)self:ShowOutput()self.DisabledByTouch=true;self.TouchDisabledProp=z;self.DisabledByTimeUntil=CurTime()+a:GetFloat()if self.undo_delay==0 then return end;timer.Simple(self.undo_delay,function()if z:IsValid()then z:Remove()end end)end;function ENT:DoUndo(q)if!next(self.UndoList)then return end;local c=table.remove(self.UndoList,#self.UndoList)if!IsValid(c)then return self:DoUndo(q)end;c:Remove()WireLib.AddNotify(q,"Undone Prop",NOTIFY_UNDO,2)end;function ENT:DoUndoEnt(q,c)if!IsValid(c)then return end;if b[c]!=self then return end;c:Remove()WireLib.AddNotify(q,"Undone Prop",NOTIFY_UNDO,2)end;function ENT:CheckEnts(C)for D=#self.UndoList,1,-1 do local c=self.UndoList[D]if!IsValid(c)||c==C then table.remove(self.UndoList,D)end end;if#self.UndoList!=self.CurrentPropCount then self.CurrentPropCount=#self.UndoList;Wire_TriggerOutput(self,"Out",self.CurrentPropCount)Wire_TriggerOutput(self,"Props",self.UndoList)self:ShowOutput()end end;function ENT:TriggerInput(E,F)local q=self:GetPlayer()if E=="Spawn"then local G=F>0;if G==self.SpawnLastValue then return end;self.SpawnLastValue=G;if G then if self.delay==0 then self:DoSpawn(q)return end;local H=function(c,q)if!IsValid(c)then return end;c:DoSpawn(q)end;timer.Simple(self.delay,function()H(self,q)end)end elseif E=="Undo"then local I=F>0;if I==self.UndoLastValue then return end;self.UndoLastValue=I;if I then self:DoUndo(q)end elseif E=="UndoEnt"then self:DoUndoEnt(q,F)elseif E=="SpawnEffect"then self.spawn_effect=F end end;function ENT:ShowOutput()self:SetOverlayText("Spawn Delay: "..self.delay.."\nUndo Delay: "..self.undo_delay.."\nActive Props: "..self.CurrentPropCount)end;function ENT:OnRemove()for J,c in ipairs(self.UndoList)do b[c]=nil end end;duplicator.RegisterEntityClass("gmod_wire_spawner",WireLib.MakeWireEnt,"Data","delay","undo_delay","spawn_effect","mat","r","g","b","a","skin")
--addons/!lpakr_out/lua/entities/gmod_wire_teleporter.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Teleporter"ENT.WireDebugName="Teleporter"ENT.Author="Divran"if CLIENT then return end;local a=CreateConVar("wire_teleporter_cooldown","1",{FCVAR_ARCHIVE,FCVAR_NOTIFY})function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Jumping=false;self.TargetPos=self:GetPos()self.TargetAng=self:GetAngles()self.Entities={}self.LocalPos={}self.LocalAng={}self.LocalVel={}self.UseSounds=true;self.UseEffects=true;self.ClassSpecificActions={gmod_wire_hoverball=function(b,c,d)b:SetZTarget(d.z)end,gmod_toggleablehoverball=function(b,c,d)b:SetTargetZ(d.z)end,gmod_hoverball=function(b,c,d)b.dt.TargetZ=d.z end}self:ShowOutput()self.Inputs=Wire_CreateInputs(self,{"Jump (Activates the teleporter.\nIf nothing happens and an error noise is played, the destination does not have enough room to fit your contraption.)","TargetPos [VECTOR]","X","Y","Z","TargetAngle [ANGLE]","Sound"})end;function ENT:TriggerInput(e,f)if e=="Jump"then if f!=0&&!self.Jumping then self:Jump(self.UseAngle||self.Inputs.TargetAngle.Src!=nil)self.UseAngle=false end elseif e=="TargetPos"then self.TargetPos=f elseif e=="X"then self.TargetPos.x=f elseif e=="Y"then self.TargetPos.y=f elseif e=="Z"then self.TargetPos.z=f elseif e=="TargetAngle"then self.TargetAng=f;self.UseAngle=true elseif e=="Sound"then self.UseSounds=f!=0 end;self:ShowOutput()end;function ENT:ShowOutput()self:SetOverlayText("Target Position = "..tostring(self.TargetPos).."\nTarget Angle = "..tostring(self.TargetAng).."\nSounds = "..(self.UseSounds&&"Yes"||"No").."\nEffects = "..(self.UseEffects&&"Yes"||"No"))end;function ENT:Jump(g)if self.Jumping then return end;if!util.IsInWorld(self.TargetPos)then self:EmitSound("buttons/button8.wav")return end;if self:GetPos()==self.TargetPos&&self:GetAngles()==self.TargetAng then self:EmitSound("buttons/button8.wav")return end;local h=constraint.GetAllConstrainedEntities(self)local i=next(h)if next(h,i)==nil&&IsValid(self:GetParent())then h=constraint.GetAllConstrainedEntities(self:GetParent())end;self.Entities={}self.OtherEntities={}for j,b in pairs(h)do local k=self:WorldToLocal(b:GetPos())k:Rotate(self.TargetAng)k=k+self.TargetPos;local l=util.IsInWorld(k)if!l then self:EmitSound("buttons/button8.wav")return elseif b!=self then if self:CheckAllowed(b)then table.insert(self.Entities,b)else self.OtherEntities[#self.OtherEntities+1]=b end end end;self.Jumping=true;if self.UseSounds then self:EmitSound("ambient/levels/citadel/weapon_disintegrate2.wav")end;if self.UseEffects then local effectdata=EffectData()effectdata:SetEntity(self)local m=self.TargetPos-self:GetPos()m:Normalize()effectdata:SetOrigin(self:GetPos()+m*math.Clamp(self:BoundingRadius()*5,180,4092))util.Effect("jump_out",effectdata,true,true)DoPropSpawnedEffect(self)for j,b in pairs(h)do local effectdata=EffectData()effectdata:SetEntity(b)effectdata:SetOrigin(self:GetPos()+m*math.Clamp(b:BoundingRadius()*5,180,4092))util.Effect("jump_out",effectdata,true,true)end end;timer.Simple(0.05,function()if!IsValid(self)then return end;self:Jump_Part2(g)end)end;function ENT:Jump_Part2(g)local n=self:GetPos()self.LocalPos={}self.LocalAng={}self.LocalVel={}for o,b in pairs(self.Entities)do if IsValid(b)then if b:GetPhysicsObjectCount()>1 then local p={Main=self:WorldToLocal(b:GetPos())}local q={Main=self:WorldToLocal(b:GetVelocity()+b:GetPos())}for r=0,b:GetPhysicsObjectCount()-1 do local l=b:GetPhysicsObjectNum(r)p[r]=b:WorldToLocal(l:GetPos())q[r]=b:WorldToLocal(b:GetPos()+l:GetVelocity())l:SetVelocity(l:GetVelocity()*-1)end;self.LocalPos[b]=p;self.LocalVel[b]=q else self.LocalPos[b]=self:WorldToLocal(b:GetPos())self.LocalVel[b]=self:WorldToLocal(b:GetVelocity()+b:GetPos())end;b:SetVelocity(b:GetVelocity()*-1)if g then self.LocalAng[b]=self:WorldToLocalAngles(b:GetAngles())end else self.Entities[o]=nil end end;local s=self:GetParent()self:SetParent()local t=self:WorldToLocal(self:GetVelocity()+self:GetPos())self:SetPos(self.TargetPos)if g then self:SetAngles(self.TargetAng)end;self:GetPhysicsObject():SetVelocity(self:LocalToWorld(t)-self:GetPos())if self.UseSounds then self:EmitSound("npc/turret_floor/die.wav",450,70)end;local m=(n-self:GetPos()):GetNormalized()if self.UseEffects then effectdata=EffectData()effectdata:SetEntity(self)effectdata:SetOrigin(self:GetPos()+m*math.Clamp(self:BoundingRadius()*5,180,4092))util.Effect("jump_in",effectdata,true,true)end;for o,b in pairs(self.Entities)do if IsValid(b)then local u=b:GetPos()if g then b:SetAngles(self:LocalToWorldAngles(self.LocalAng[b]))end;if b:GetPhysicsObjectCount()>1 then b:SetPos(self:LocalToWorld(self.LocalPos[b].Main))local v=b:GetPhysicsObject()if v:IsValid()then v:SetVelocity(self:LocalToWorld(self.LocalVel[b].Main)-b:GetPos())else b:SetVelocity(self:LocalToWorld(self.LocalVel[b].Main))end;for r=0,b:GetPhysicsObjectCount()-1 do local l=b:GetPhysicsObjectNum(r)l:SetPos(b:LocalToWorld(self.LocalPos[b][r]))l:SetVelocity(b:LocalToWorld(self.LocalVel[b][r])-b:GetPos())end;b:GetPhysicsObject():Wake()else b:SetPos(self:LocalToWorld(self.LocalPos[b]))local v=b:GetPhysicsObject()if v:IsValid()then v:SetVelocity(self:LocalToWorld(self.LocalVel[b])-b:GetPos())else b:SetVelocity(self:LocalToWorld(self.LocalVel[b]))end;b:GetPhysicsObject():Wake()end;if self.UseEffects then effectdata=EffectData()effectdata:SetEntity(b)effectdata:SetOrigin(self:GetPos()+m*math.Clamp(b:BoundingRadius()*5,180,4092))util.Effect("jump_in",effectdata,true,true)DoPropSpawnedEffect(b)end;if self.ClassSpecificActions[b:GetClass()]then self.ClassSpecificActions[b:GetClass()](b,u,b:GetPos())end else self.Entities[o]=nil end end;if self.UseEffects then for j,b in pairs(self.OtherEntities)do effectdata=EffectData()effectdata:SetEntity(b)effectdata:SetOrigin(self:GetPos()+m*math.Clamp(b:BoundingRadius()*5,180,4092))util.Effect("jump_in",effectdata,true,true)DoPropSpawnedEffect(b)end end;self:SetParent(s)timer.Create("teleporter_"..self:EntIndex(),a:GetFloat(),1,function()if self:IsValid()then self.Jumping=false end end)end;function ENT:CheckAllowed(w)if w:GetParent():EntIndex()!=0 then return false end;local x=w:GetClass()if x=="Player"||x:find("npc_")then return false end;return true end;function ENT:Setup(y,z)self.UseSounds=y;self.UseEffects=z;self:ShowOutput()end;duplicator.RegisterEntityClass("gmod_wire_hoverdrivecontroler",WireLib.MakeWireEnt,"Data","UseSounds","UseEffects")duplicator.RegisterEntityClass("gmod_wire_teleporter",WireLib.MakeWireEnt,"Data","UseSounds","UseEffects")scripted_ents.Alias("gmod_wire_hoverdrivecontroler","gmod_wire_teleporter")
--addons/!lpakr_out/lua/entities/gmod_wire_trail.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_trigger_entity.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_value.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Value"ENT.WireDebugName="Value"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Outputs=WireLib.CreateOutputs(self,{"Out"})end;local a={NORMAL=0,ANGLE=Angle(0,0,0),VECTOR=Vector(0,0,0),VECTOR2={0,0},VECTOR4={0,0,0,0},STRING=""}function ENT:SetupLegacy(b)local c={}for d,e in pairs(b)do local f,g=string.match(e,"^ *([^: ]+) *:(.*)$")f=string.upper(f||"NORMAL")if a[f]then c[#c+1]={DataType=f,Value=g||e}end end;self.LegacyOutputs=true;self:Setup(c)end;local tonumber=tonumber;local h={}function h.NORMAL(g)return tonumber(g)end;function h.VECTOR(g)local i,j,k=string.match(g,"^ *([^%s,]+) *, *([^%s,]+) *, *([^%s,]+) *$")if tonumber(i)&&tonumber(j)&&tonumber(j)then return Vector(tonumber(i),tonumber(j),tonumber(k))end end;function h.VECTOR2(g)local i,j=string.match(g,"^ *([^%s,]+) *, *([^%s,]+) *$")if tonumber(i)&&tonumber(j)then return{tonumber(i),tonumber(j)}end end;function h.VECTOR4(g)local i,j,k,l=string.match(g,"^ *([^%s,]+) *, *([^%s,]+) *, *([^%s,]+) *, *([^%s,]+) *$")if tonumber(i)&&tonumber(j)&&tonumber(j)&&tonumber(l)then return{tonumber(i),tonumber(j),tonumber(k),tonumber(l)}end end;function h.ANGLE(g)local m,j,n=string.match(g,"^ *([^%s,]+) *, *([^%s,]+) *, *([^%s,]+) *$")if tonumber(m)&&tonumber(j)&&tonumber(n)then return Angle(tonumber(m),tonumber(j),tonumber(n))end end;h.STRING=WireLib.ParseEscapes;function ENT:ParseValue(o,f)if h[f]then local p=h[f](o)if p then return p else WireLib.AddNotify(self:GetPlayer(),"Constant Value: Unable to parse value '"..tostring(o).."' as type '"..f.."'.",NOTIFY_ERROR,5,NOTIFYSOUND_ERROR1)return a[f]end end end;function ENT:Setup(q)if!q then return end;local r,g=next(q)if!g then WireLib.AddNotify(self:GetPlayer(),"Constant Value: No values found!",NOTIFY_ERROR,5,NOTIFYSOUND_ERROR1)elseif!istable(g)then self:SetupLegacy(q)else self.value=q;local s={}local t={}local b={}local u={}for d,e in pairs(q)do e.DataType=string.upper(e.DataType)if e.DataType=="NUMBER"then e.DataType="NORMAL"end;if a[string.upper(e.DataType)]!=nil then s[d]=tostring(d)t[d]=string.upper(e.DataType)b[d]=self:ParseValue(e.Value,string.upper(e.DataType))u[d]=b[d]!=nil&&e.Value||"*ERROR*"else WireLib.AddNotify(self:GetPlayer(),"Constant Value: Invalid type '"..string.upper(e.DataType).."' specified.",NOTIFY_ERROR,5,NOTIFYSOUND_ERROR1)s[d]=tostring(d)t[d]="STRING"b[d]="INVALID TYPE SPECIFIED"u[d]="*ERROR*"end end;if self.LegacyOutputs then for d,e in pairs(s)do s[d]="Value"..e end end;WireLib.AdjustSpecialOutputs(self,s,t,u)local v={}for d,e in pairs(q)do v[#v+1]=string.format("%s [%s]: %s",s[d],t[d],u[d])WireLib.TriggerOutput(self,s[d],b[d])end;self:SetOverlayText(table.concat(v,"\n"))self.types=t;self.values=b end end;function ENT:ReadCell(w)w=math.floor(w)local f=self.types[w+1]if f=="NORMAL"then return self.values[w+1]end;return 0 end;duplicator.RegisterEntityClass("gmod_wire_value",WireLib.MakeWireEnt,"Data","value")
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/keypad/sh_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/ladder_small/shared.lua:
ENT.Type="anim"ENT.Base="ladder_base"ENT.PrintName="Ladder (Small)"ENT.Category="Ladders"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.Model=Model("models/props_c17/metalladder001.mdl")ENT.RenderGroup=RENDERGROUP_BOTH
--addons/!lpakr_out/lua/entities/ladder_small4/shared.lua:
ENT.Type="anim"ENT.Base="ladder_base"ENT.PrintName="Ladder (Small - Wood)"ENT.Category="Ladders"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.Model=Model("models/props/cs_militia/ladderwood.mdl")ENT.RenderGroup=RENDERGROUP_BOTH
--addons/ssrp_lfs/lua/entities/lvs_base/sh_weapons.lua:

ENT.WEAPONS = {
	[1] = {},
}

function ENT:InitWeapons()
end

function ENT:AddWeapon( data, PodID )
	if not istable( data ) then print("[LVS] couldn't register weapon") return end

	if not PodID or PodID <= 1 then
		PodID = 1
	end

	if not self.WEAPONS[ PodID ] then
		self.WEAPONS[ PodID ] = {}
	end

	local default = LVS:GetWeaponPreset( "DEFAULT" )

	data.Icon = data.Icon or Material("lvs/weapons/bullet.png")
	data.Ammo = data.Ammo or -1
	data.Delay = data.Delay or 0
	data.HeatRateUp = data.HeatRateUp or default.HeatRateUp
	data.Attack = data.Attack or default.Attack
	data.StartAttack = data.StartAttack or default.StartAttack
	data.FinishAttack = data.FinishAttack or default.FinishAttack
	data.OnSelect = data.OnSelect or default.OnSelect
	data.OnDeselect = data.OnDeselect or default.OnDeselect
	data.OnThink = data.OnThink or default.OnThink
	data.OnOverheat = data.OnOverheat or default.OnOverheat
	data.OnRemove = data.OnRemove or default.OnRemove
	data.UseableByAI = data.UseableByAI ~= false

	table.insert( self.WEAPONS[ PodID ], data )
end

function ENT:HasWeapon( ID )
	return istable( self.WEAPONS[1][ ID ] )
end

function ENT:AIHasWeapon( ID )
	local weapon = self.WEAPONS[1][ ID ]
	if not istable( weapon ) then return false end

	return weapon.UseableByAI
end

function ENT:GetActiveWeapon()
	local SelectedID = self:GetSelectedWeapon()
	local CurWeapon = self.WEAPONS[1][ SelectedID ]

	return CurWeapon, SelectedID
end

function ENT:GetMaxAmmo()
	local CurWeapon = self:GetActiveWeapon()

	if not CurWeapon then return -1 end

	return CurWeapon.Ammo or -1
end

if SERVER then
	function ENT:WeaponRestoreAmmo()
		local AmmoIsSet = false

		for PodID, data in pairs( self.WEAPONS ) do
			for id, weapon in pairs( data ) do
				local MaxAmmo = weapon.Ammo or -1
				local CurAmmo = weapon._CurAmmo or -1

				if CurAmmo == MaxAmmo then continue end

				self.WEAPONS[PodID][ id ]._CurAmmo = MaxAmmo

				AmmoIsSet = true
			end
		end

		if AmmoIsSet then
			self:SetNWAmmo( self:GetAmmo() )

			for _, pod in pairs( self:GetPassengerSeats() ) do
				local weapon = pod:lvsGetWeapon()

				if not IsValid( weapon ) then continue end

				weapon:SetNWAmmo( weapon:GetAmmo() )
			end
		end

		return AmmoIsSet
	end
	
	function ENT:WeaponsOnRemove()
		for _, data in pairs( self.WEAPONS ) do
			for ID, Weapon in pairs( data ) do
				if not Weapon.OnRemove then continue end

				Weapon.OnRemove( self )
			end
		end
	end

	function ENT:WeaponsFinish()
		if not self._activeWeapon then return end

		local CurWeapon = self.WEAPONS[1][ self._activeWeapon ]

		if not CurWeapon then return end

		if CurWeapon.FinishAttack then
			CurWeapon.FinishAttack( self )
		end

		self._activeWeapon = nil
		self.OldAttack = false
	end

	function ENT:GetAmmo()
		if self:GetAI() then return self:GetMaxAmmo() end

		local CurWeapon = self:GetActiveWeapon()

		if not CurWeapon then return -1 end

		return CurWeapon._CurAmmo or self:GetMaxAmmo()
	end

	function ENT:TakeAmmo( num )
		if self:GetMaxAmmo() <= 0 then return end

		local CurWeapon = self:GetActiveWeapon()

		CurWeapon._CurAmmo = math.max( self:GetAmmo() - (num or 1), 0 )

		self:SetNWAmmo( CurWeapon._CurAmmo )
	end

	function ENT:GetHeat()
		local CurWeapon = self:GetActiveWeapon()

		if not CurWeapon then return 0 end

		return (CurWeapon._CurHeat or 0)
	end

	function ENT:GetOverheated()
		local CurWeapon = self:GetActiveWeapon()

		if not CurWeapon then return false end

		return CurWeapon.Overheated == true
	end

	function ENT:SetOverheated( overheat )
		if self:GetOverheated() == overheat then return end

		local CurWeapon = self:GetActiveWeapon()

		if not CurWeapon then return end

		CurWeapon.Overheated = overheat

		if self:GetHeat() == 0 then return end

		if CurWeapon.OnOverheat then
			CurWeapon.OnOverheat( self )
		end
	end

	function ENT:SetHeat( heat )
		local CurWeapon = self:GetActiveWeapon()

		if not CurWeapon then return end

		heat = math.Clamp( heat, 0, 1 )

		CurWeapon._CurHeat = heat

		if self:GetNWHeat() == heat then return end

		self:SetNWHeat( heat )
	end

	function ENT:CanAttack()
		local CurWeapon = self:GetActiveWeapon()

		return (CurWeapon._NextFire or 0) < CurTime()
	end

	function ENT:SetNextAttack( time )
		local CurWeapon = self:GetActiveWeapon()

		CurWeapon._NextFire = time
	end

	function ENT:WeaponsShouldFire()
		if self:GetAI() then return self._AIFireInput end

		local ply = self:GetDriver()

		if not IsValid( ply ) then return false end

		return ply:lvsKeyDown( "ATTACK" )
	end

	function ENT:WeaponsThink()
		local T = CurTime()
		local FT = FrameTime()
		local CurWeapon, SelectedID = self:GetActiveWeapon()
	
		for ID, Weapon in pairs( self.WEAPONS[1] ) do
			local IsActive = ID == SelectedID
			if Weapon.OnThink then Weapon.OnThink( self, IsActive ) end

			if IsActive then continue end

			-- cool all inactive weapons down
			Weapon._CurHeat = Weapon._CurHeat and Weapon._CurHeat - math.min( Weapon._CurHeat, (Weapon.HeatRateDown or 0.25) * FT ) or 0
		end

		if not CurWeapon then return end

		local ShouldFire = self:WeaponsShouldFire()
		local CurHeat = self:GetHeat()

		if self:GetOverheated() then
			if CurHeat <= 0 then
				self:SetOverheated( false )
			else
				ShouldFire = false
			end
		else
			if CurHeat >= 1 then
				self:SetOverheated( true )
				ShouldFire = false
			end
		end

		if self:GetMaxAmmo() > 0 then
			if self:GetAmmo() <= 0 then
				ShouldFire = false
			end
		end

		if ShouldFire ~= self.OldAttack then
			self.OldAttack = ShouldFire

			if ShouldFire then
				if CurWeapon.StartAttack then
					CurWeapon.StartAttack( self )
				end
				self._activeWeapon = SelectedID
			else
				self:WeaponsFinish()
			end
		end

		if ShouldFire then
			if not self:CanAttack() then return end

			local ShootDelay = (CurWeapon.Delay or 0)

			self:SetNextAttack( T + ShootDelay )
			self:SetHeat( CurHeat + (CurWeapon.HeatRateUp or 0.2) * math.max(ShootDelay, FT) )

			if not CurWeapon.Attack then return end

			if CurWeapon.Attack( self ) then
				self:SetHeat( CurHeat - math.min( self:GetHeat(), (CurWeapon.HeatRateDown or 0.25) * FT ) )
				self:SetNextAttack( T )
			end
		else
			self:SetHeat( self:GetHeat() - math.min( self:GetHeat(), (CurWeapon.HeatRateDown or 0.25) * FT ) )
		end
	end

	function ENT:SelectWeapon( ID )
		if not isnumber( ID ) then return end

		if self.WEAPONS[1][ ID ] then
			self:SetSelectedWeapon( ID )
		end

		local ply = self:GetDriver()

		if not IsValid( ply ) then return end

		net.Start( "lvs_select_weapon" )
		net.Send( ply )
	end

	function ENT:OnWeaponChanged( name, old, new)
		if new == old then return end

		self:WeaponsFinish()

		local PrevWeapon = self.WEAPONS[1][ old ]
		if PrevWeapon and PrevWeapon.OnDeselect then
			PrevWeapon.OnDeselect( self )
		end

		local NextWeapon = self.WEAPONS[1][ new ]
		if NextWeapon and NextWeapon.OnSelect then
			NextWeapon.OnSelect( self )
			self:SetNWAmmo( NextWeapon._CurAmmo or NextWeapon.Ammo or -1 )
		end
	end

	return
end

function ENT:SelectWeapon( ID )
	if not isnumber( ID ) then return end

	net.Start( "lvs_select_weapon" )
		net.WriteInt( ID, 5 )
		net.WriteBool( false )
	net.SendToServer()
end

function ENT:NextWeapon()
	net.Start( "lvs_select_weapon" )
		net.WriteInt( 1, 5 )
		net.WriteBool( true )
	net.SendToServer()
end

function ENT:PrevWeapon()
	net.Start( "lvs_select_weapon" )
		net.WriteInt( -1, 5 )
		net.WriteBool( true )
	net.SendToServer()
end

LVS:AddHudEditor( "WeaponSwitcher", ScrW() - 210, ScrH() - 165,  200, 68, 200, 68, "WEAPON SELECTOR", 
	function( self, vehicle, X, Y, W, H, ScrX, ScrY, ply )
		if not vehicle.LVSHudPaintWeapons then return end
		vehicle:LVSHudPaintWeapons( X, Y, W, H, ScrX, ScrY, ply )
	end
)

LVS:AddHudEditor( "WeaponInfo", ScrW() - 230, ScrH() - 85,  220, 75, 220, 75, "WEAPON INFO", 
	function( self, vehicle, X, Y, W, H, ScrX, ScrY, ply )
		if not vehicle.LVSHudPaintWeaponInfo then return end

		vehicle:LVSHudPaintWeaponInfo( X, Y, W, H, ScrX, ScrY, ply )
	end
)

function ENT:GetAmmoID( ID )
	local ply = LocalPlayer()

	if not IsValid( ply ) then return end

	local Base = ply:lvsGetWeaponHandler()

	if not IsValid( Base ) then return -1 end

	local selected = Base:GetSelectedWeapon()
	local weapon = self.WEAPONS[ Base:GetPodIndex() ][ ID ]

	if ID == selected then
		weapon._CurAmmo = Base:GetNWAmmo()
	else
		weapon._CurAmmo = weapon._CurAmmo or weapon.Ammo or -1
	end

	return weapon._CurAmmo
end


local Circles = {
	[1] = {r = -1, col = Color(0,0,0,200)},
	[2] = {r = 0, col = Color(255,255,255,200)},
	[3] = {r = 1, col = Color(255,255,255,255)},
	[4] = {r = 2, col = Color(255,255,255,200)},
	[5] = {r = 3, col = Color(0,0,0,200)},
}

local function DrawCircle( X, Y, target_radius, heatvalue )
	local endang = 360 * heatvalue

	if endang == 0 then return end

	for i = 1, #Circles do
		local data = Circles[ i ]
		local radius = target_radius + data.r
		local segmentdist = endang / ( math.pi * radius / 2 )

		for a = 0, endang, segmentdist do
			local r = data.col.r
			local g = data.col.g * (1 - math.min(a / 270,1))
			local b = data.col.b * (1 - math.min(a / 90,1))

			surface.SetDrawColor( r, g, b, data.col.a )

			surface.DrawLine( X - math.sin( math.rad( a ) ) * radius, Y + math.cos( math.rad( a ) ) * radius, X - math.sin( math.rad( a + segmentdist ) ) * radius, Y + math.cos( math.rad( a + segmentdist ) ) * radius )
		end
	end
end

ENT.HeatMat = Material( "lvs/heat.png" )

function ENT:LVSHudPaintWeaponInfo( X, Y, w, h, ScrX, ScrY, ply )
	local Base = ply:lvsGetWeaponHandler()

	if not IsValid( Base ) then return end

	if not Base:HasWeapon( Base:GetSelectedWeapon() ) then return end

	local Heat = Base:GetNWHeat()
	local hX = X + w - h * 0.5
	local hY = Y + h * 0.25 + h * 0.25
	local hAng = math.cos( CurTime() * 50 ) * 5 * Heat ^ 2

	surface.SetMaterial( self.HeatMat )
	surface.SetDrawColor( 0, 0, 0, 200 )
	surface.DrawTexturedRectRotated( hX + 4, hY + 1, h * 0.5, h * 0.5, hAng )
	surface.SetDrawColor( 255, 255 * (1 - Heat), 255 * math.max(1 - Heat * 1.5,0), 255 )
	surface.DrawTexturedRectRotated( hX + 2, hY - 1, h * 0.5, h * 0.5, hAng )

	DrawCircle( hX, hY, h * 0.35, Heat )

	if Base:GetMaxAmmo() <= 0 then return end

	draw.DrawText( "AMMO ", "LVS_FONT", X + 72, Y + 35, color_white, TEXT_ALIGN_RIGHT )
	draw.DrawText( Base:GetNWAmmo(), "LVS_FONT_HUD_LARGE", X + 72, Y + 20, color_white, TEXT_ALIGN_LEFT )
end

function ENT:LVSHudPaintWeapons( X, Y, w, h, ScrX, ScrY, ply )
	local Base = ply:lvsGetWeaponHandler()

	if not IsValid( Base ) then return end

	local PodID = Base:GetPodIndex()

	local num = #self.WEAPONS[ PodID ]

	if num <= 1 then return end

	local CenterY = (Y + h * 0.5)
	local CenterX = (X + w * 0.5)

	local FlatSelector = CenterX > ScrX * 0.333 and CenterX < ScrX * 0.666

	local T = CurTime()
	local FT = RealFrameTime()

	local gap = 4
	local SizeY = h - gap

	local Selected = Base:GetSelectedWeapon()
	if Selected ~= self._OldSelected then
		self._OldSelected = Selected
		self._SelectActiveTime = T + 2
	end

	local tAlpha = (self._SelectActiveTime or 0) > T and 1 or 0
	local tAlphaRate = FT * 15

	self.smAlphaSW = self.smAlphaSW and (self.smAlphaSW + math.Clamp(tAlpha - self.smAlphaSW,-tAlphaRate,tAlphaRate)) or 0

	if self.smAlphaSW > 0.95 then
		self._DisplaySelected = Selected
	else
		self._DisplaySelected = self._DisplaySelected or Selected
	end

	local A255 = 255 * self.smAlphaSW
	local A150 = 150 * self.smAlphaSW

	local Col = Color(0,0,0,A150)
	local ColSelect = Color(255,255,255,A150)

	local SwapY = 0

	if Y < (ScrY * 0.5 - h * 0.5) then
		SwapY = 1
	end

	for ID = 1, num do
		local IsSelected = self._DisplaySelected == ID
		local n = num - ID
		local xPos = FlatSelector and X + (w + gap) * (ID - 1) - ((w + gap) * 0.5 * num - w * 0.5) or X
		local yPos = FlatSelector and Y - h * math.min(SwapY,0) or Y - h * n + (num - 1) * h * SwapY

		draw.RoundedBox(5, xPos, yPos, w, SizeY, IsSelected and ColSelect or Col )

		if IsSelected then
			surface.SetDrawColor( 0, 0, 0, A255 )
		else
			surface.SetDrawColor( 255, 255, 255, A255 )
		end
		surface.SetMaterial( self.WEAPONS[PodID][ID].Icon )
		surface.DrawTexturedRect( xPos, yPos, SizeY * 2, SizeY )

		local ammo = self:GetAmmoID( ID )

		if ammo > -1 then
			draw.DrawText( ammo, "LVS_FONT_HUD", xPos + w - 10, yPos + SizeY * 0.5 - 10, IsSelected and Color(0,0,0,A255) or Color(255,255,255,A255), TEXT_ALIGN_RIGHT )
		else
			draw.DrawText( "O", "LVS_FONT_HUD", xPos + w - 19, yPos + SizeY * 0.5 - 10, IsSelected and Color(0,0,0,A255) or Color(255,255,255,A255), TEXT_ALIGN_RIGHT )
			draw.DrawText( "O", "LVS_FONT_HUD", xPos + w - 10, yPos + SizeY * 0.5 - 10, IsSelected and Color(0,0,0,A255) or Color(255,255,255,A255), TEXT_ALIGN_RIGHT )
		end
	end
end
--addons/ssrp_lfs/lua/entities/lvs_fakehover_iftx/shared.lua:

ENT.Base = "lvs_base_fakehover"

ENT.PrintName = "IFT-X"
ENT.Author = "Luna"
ENT.Information = "Hover Tank of the Galactic Republic"
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/blu/iftx.mdl"
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

ENT.MaxHealth = 2700

ENT.ForceAngleMultiplier = 2
ENT.ForceAngleDampingMultiplier = 1

ENT.ForceLinearMultiplier = 1
ENT.ForceLinearRate = 0.25

ENT.MaxVelocityX = 320
ENT.MaxVelocityY = 320

ENT.MaxTurnRate = 0.5

ENT.BoostAddVelocityX = 120
ENT.BoostAddVelocityY = 120

ENT.GroundTraceHitWater = true
ENT.GroundTraceLength = 50
ENT.GroundTraceHull = 100

ENT.LAATC_PICKUPABLE = true
ENT.LAATC_DROP_IN_AIR = true
ENT.LAATC_PICKUP_POS = Vector(-200,0,25)
ENT.LAATC_PICKUP_Angle = Angle(0,0,0)

ENT.UIPosition = Vector(400, -100, 20)
ENT.UIAngle = Angle(25, 155, 0)

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "BTLFire" )
	self:AddDT( "Bool", "IsCarried" )
	self:AddDT( "Entity", "GunnerSeat" )

	if SERVER then
		self:NetworkVarNotify( "IsCarried", self.OnIsCarried )
	end
end

function ENT:GetAimAngles()
	local trace = self:GetEyeTrace()

	local AimAnglesR = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld( Vector(-60,-51,43) ) ):GetNormalized():Angle() )
	local AimAnglesL = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld( Vector(-60,51,43) ) ):GetNormalized():Angle() )

	return AimAnglesR, AimAnglesL
end

function ENT:WeaponsInRange()
	if self:GetIsCarried() then return false end

	local AimAnglesR, AimAnglesL = self:GetAimAngles()

	return not ((AimAnglesR.p >= 10 and AimAnglesL.p >= 10) or (AimAnglesR.p <= -25 and AimAnglesL.p <= -25) or (math.abs(AimAnglesL.y) + math.abs(AimAnglesL.y)) >= 30)
end

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Ammo = 600
	weapon.Delay = 0.2
	weapon.HeatRateUp = 0.25
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		if not ent:WeaponsInRange() then return true end

		local ID_L = ent:LookupAttachment( "muzzle_left" )
		local ID_R = ent:LookupAttachment( "muzzle_right" )
		local MuzzleL = ent:GetAttachment( ID_L )
		local MuzzleR = ent:GetAttachment( ID_R )

		if not MuzzleL or not MuzzleR then return end

		ent.MirrorPrimary = not ent.MirrorPrimary

		local Pos = ent.MirrorPrimary and MuzzleL.Pos or MuzzleR.Pos
		local Dir =  (ent.MirrorPrimary and MuzzleL.Ang or MuzzleR.Ang):Up()

		local bullet = {}
		bullet.Src 	= Pos
		bullet.Dir 	= Dir
		bullet.Spread 	= Vector( 0.01,  0.01, 0 )
		bullet.TracerName = "lvs_laser_blue_long"
		bullet.Force = 100
		bullet.HullSize = 1
		bullet.Damage = 75
		bullet.Velocity = 40000
		bullet.Attacker = ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(50,50,255) )
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_impact", effectdata )
		end
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetStart( Vector(50,50,255) )
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle_colorable", effectdata )

		ent:TakeAmmo()

		if ent.MirrorPrimary then
			ent:PlayAnimation( "fire_left" )

			if not IsValid( ent.SNDLeft ) then return end

			ent.SNDLeft:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )

			return
		end

		ent:PlayAnimation( "fire_right" )

		if not IsValid( ent.SNDRight ) then return end

		ent.SNDRight:PlayOnce( 100 + math.sin( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("physics/metal/weapon_impact_soft3.wav")
	end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	weapon.OnThink = function( ent, active )
		if ent:GetIsCarried() then
			self:SetPoseParameter("cannon_right_pitch", 0 )
			self:SetPoseParameter("cannon_right_yaw", 0 )

			self:SetPoseParameter("cannon_left_pitch", 0 )
			self:SetPoseParameter("cannon_left_yaw", 0 )

			return
		end

		local AimAnglesR, AimAnglesL = ent:GetAimAngles()

		self:SetPoseParameter("cannon_right_pitch", AimAnglesR.p )
		self:SetPoseParameter("cannon_right_yaw", AimAnglesR.y )

		self:SetPoseParameter("cannon_left_pitch", AimAnglesL.p )
		self:SetPoseParameter("cannon_left_yaw", AimAnglesL.y )
	end
	self:AddWeapon( weapon )


	local weapon = {}
	weapon.Icon = Material("lvs/weapons/missile.png")
	weapon.Ammo = 60
	weapon.Delay = 1
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0.2
	weapon.Attack = function( ent )
		if not ent:WeaponsInRange() then return true end

		local Driver = ent:GetDriver()

		for i = 1, 6 do
			timer.Simple( (i / 5) * 0.75, function()
				if not IsValid( ent ) then return end

				if ent:GetAmmo() <= 0 then ent:SetHeat( 1 ) return end

				ent:TakeAmmo()

				local ID_L = ent:LookupAttachment( "muzzle_left" )
				local ID_R = ent:LookupAttachment( "muzzle_right" )
				local MuzzleL = ent:GetAttachment( ID_L )
				local MuzzleR = ent:GetAttachment( ID_R )

				if not MuzzleL or not MuzzleR then return end

				ent.MirrorPrimary = not ent.MirrorPrimary

				local Pos = ent.MirrorPrimary and MuzzleL.Pos or MuzzleR.Pos
				local Dir =  (ent.MirrorPrimary and MuzzleL.Ang or MuzzleR.Ang):Up()

				local projectile = ents.Create( "lvs_concussionmissile" )
				projectile:SetPos( Pos )
				projectile:SetAngles( Dir:Angle() )
				projectile:SetParent( ent )
				projectile:Spawn()
				projectile:Activate()
				projectile.GetTarget = function( missile ) return missile end
				projectile.GetTargetPos = function( missile )
					return missile:LocalToWorld( Vector(150,0,0) + VectorRand() * math.random(-10,10) )
				end
				projectile:SetAttacker( IsValid( Driver ) and Driver or self )
				projectile:SetEntityFilter( ent:GetCrosshairFilterEnts() )
				projectile:SetSpeed( 5000 )
				projectile:SetDamage( 400 )
				projectile:SetRadius( 200 )
				projectile:Enable()
				projectile:EmitSound( "LVS.IFTX.FIRE_MISSILE" )

				if ent.MirrorPrimary then
					ent:PlayAnimation( "fire_left" )
				else
					ent:PlayAnimation( "fire_right" )
				end
			end)
		end

		ent:SetHeat( 1 )
		ent:SetOverheated( true )
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("weapons/shotgun/shotgun_cock.wav")
	end
	self:AddWeapon( weapon )

	self:InitTurret()
end

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/iftx/loop.wav",
		Pitch = 70,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 30,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
		SoundLevel = 85,
	},
	{
		sound = "lvs/vehicles/iftx/loop_hi.wav",
		Pitch = 70,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 30,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
		SoundLevel = 85,
	},
	{
		sound = "^lvs/vehicles/iftx/dist.wav",
		Pitch = 70,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 30,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		SoundLevel = 90,
	},
}

sound.Add( {
	name = "LVS.IFTX.FIRE_MISSILE",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 125,
	pitch = {95, 105},
	sound = "lvs/vehicles/iftx/fire_missile.mp3"
} )

--addons/ssrp_lfs/lua/entities/lvs_fakehover_wheel.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.Spawnable       = false
ENT.AdminSpawnable  = false
ENT.DoNotDuplicate = true
ENT.lvsDoNotGrab = true

function ENT:SetupDataTables()
	self:NetworkVar( "Entity",0, "Base" )
end

if SERVER then
	function ENT:Initialize()	
		self:SetModel( "models/props_vehicles/tire001c_car.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:DrawShadow( false )
	end

	function ENT:Define( data )
		local bbox = Vector(data.radius,data.radius,data.radius)

		self:PhysicsInitSphere( data.radius, "gmod_silent" )
		self:SetCollisionBounds( -bbox, bbox )

		local PhysObj = self:GetPhysicsObject()
		if IsValid( PhysObj ) then
			PhysObj:EnableDrag( false )
			PhysObj:EnableMotion( false )
			PhysObj:SetMass( data.mass )
			PhysObj:SetBuoyancyRatio( data.buoyancyratio )
		end
	end

	function ENT:Think()
		return false
	end

	function ENT:OnTakeDamage( dmginfo )
		local base = self:GetBase()

		if not IsValid( base ) then return end

		base:TakeDamageInfo( dmginfo )
	end

	return
end

function ENT:Initialize()
end

function ENT:Think()
	local T = CurTime()

	if (self._nextFX or 0) > T then return end

	self._nextFX = T + 0.02

	local base = self:GetBase()

	if not IsValid( base ) then return end

	if base:GetVelocity():Length() < 50 then return end

	local data = {
		start = self:LocalToWorld( self:OBBCenter() ),
		endpos = self:LocalToWorld( Vector(0,0,self:OBBMins().z - 10 ) ),
		filter = base:GetCrosshairFilterEnts(),
		mask = MASK_WATER
	}

	local traceWater = util.TraceLine( data )

	if not traceWater.Hit then
		return
	end

	local effectdata = EffectData()
		effectdata:SetOrigin( traceWater.HitPos )
		effectdata:SetEntity( base )
		effectdata:SetMagnitude( self:BoundingRadius() )
	util.Effect( "lvs_hover_water", effectdata )
end

function ENT:Draw()
end

function ENT:OnRemove()
end

--addons/ssrp_lfs/lua/entities/lvs_repulsorlift_gunship/cl_lights.lua:

local white = Color(255, 255, 255, 255)
local grey = Color( 255, 255, 255, 10 )

ENT.LightMaterial = Material( "effects/lvs/laat_spotlight" )
ENT.GlowMaterial = Material( "sprites/light_glow02_add" )

function ENT:OnRemoved()
	self:RemoveLight()
end

function ENT:RemoveLight()
	if IsValid( self.projector_L ) then
		self.projector_L:Remove()
		self.projector_L = nil
	end

	if IsValid( self.projector_R ) then
		self.projector_R:Remove()
		self.projector_R = nil
	end
end

function ENT:PostDrawTranslucent()
	if self:GetBodygroup( 5 ) ~= 2 or not self:GetLightsActive() then
		self:RemoveLight()

		return
	end

	if not IsValid( self.projector_L ) then
		local thelamp = ProjectedTexture()
		thelamp:SetBrightness( 10 )
		thelamp:SetTexture( "effects/flashlight/soft" )
		thelamp:SetColor( Color(255,255,255) )
		thelamp:SetEnableShadows( false )
		thelamp:SetFarZ( 5000 )
		thelamp:SetNearZ( 75 )
		thelamp:SetFOV( 40 )
		self.projector_L = thelamp
	end

	if not IsValid( self.projector_R ) then
		local thelamp = ProjectedTexture()
		thelamp:SetBrightness( 10 )
		thelamp:SetTexture( "effects/flashlight/soft" )
		thelamp:SetColor( Color(255,255,255) )
		thelamp:SetEnableShadows( false )
		thelamp:SetFarZ( 5000 )
		thelamp:SetNearZ( 75 )
		thelamp:SetFOV( 40 )
		self.projector_R = thelamp
	end

	if not self.SpotlightID_L then
		self.SpotlightID_L = self:LookupAttachment( "spotlight_left" )
	else
		local attachment = self:GetAttachment( self.SpotlightID_L )

		if attachment then
			local StartPos = attachment.Pos
			local Dir = attachment.Ang:Up()

			render.SetMaterial( self.GlowMaterial )
			render.DrawSprite( StartPos + Dir * 20, 400, 400, white )

			render.SetMaterial( self.LightMaterial )
			render.DrawBeam(  StartPos - Dir * 10,  StartPos + Dir * 1500, 350, 0, 0.99, grey )

			if IsValid( self.projector_L ) then
				self.projector_L:SetPos( StartPos )
				self.projector_L:SetAngles( Dir:Angle() )
				self.projector_L:Update()
			end
		end
	end

	if not self.SpotlightID_R then
		self.SpotlightID_R = self:LookupAttachment( "spotlight_right" )
	else
		local attachment = self:GetAttachment( self.SpotlightID_R )

		if attachment then
			local StartPos = attachment.Pos
			local Dir = attachment.Ang:Up()

			render.SetMaterial( self.GlowMaterial )
			render.DrawSprite( StartPos + Dir * 20, 400, 400, white )

			render.SetMaterial( self.LightMaterial )
			render.DrawBeam(  StartPos - Dir * 10,  StartPos + Dir * 1500, 350, 0, 0.99, grey )

			if IsValid( self.projector_R ) then
				self.projector_R:SetPos( StartPos )
				self.projector_R:SetAngles( Dir:Angle() )
				self.projector_R:Update()
			end
		end
	end
end

function ENT:AnimLights()
	if self:GetBodygroup( 5 ) ~= 2 then return end

	local TargetValue = self:HitGround() and 0 or 1
	local Rate = FrameTime() * 10

	self.smSpotLight = isnumber( self.smSpotLight ) and (self.smSpotLight + math.Clamp(TargetValue - self.smSpotLight,-Rate,Rate * 0.1)) or 0

	if not self.SpotLightID_L then
		self.SpotLightID_L = self:LookupBone( "spotlight_left" )
	else
		self:ManipulateBoneAngles( self.SpotLightID_L, Angle(10,-30,5) * self.smSpotLight )
	end

	if not self.SpotLightID_R then
		self.SpotLightID_R = self:LookupBone( "spotlight_right" )
	else
		self:ManipulateBoneAngles( self.SpotLightID_R, Angle(-10,30,5) * self.smSpotLight )
	end
end
--addons/ssrp_lfs/lua/entities/lvs_starfighter_slave1/shared.lua:
ENT.Base = "lvs_base_starfighter"

ENT.PrintName = "Slave I"
ENT.Author = "Reaps"
ENT.Information = "Modified KDY Engineering Firespray-31"
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/jackjack/ships/slave13p.mdl"

ENT.AITEAM = 2

ENT.MaxVelocity = 2450
ENT.MaxThrust = 2450

ENT.TurnRatePitch = 1.5
ENT.TurnRateYaw = 1.3
ENT.TurnRateRoll = 0.7

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.SpawnNormalOffset = 100
ENT.SpawnAngleOffset = Angle(-90, 0, 0)

ENT.MaxHealth = 1600
ENT.MaxShield = 280

function ENT:InitWeapons()
	self.FirePositions = {
		Vector(300.55,-57.8,-451.65),
		Vector(297.69,57.78,-460.64),
		Vector(300.55,57.8,-451.65),
		Vector(297.69,-57.78,-460.64),
	}

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Ammo = 1600
	weapon.Delay = 0.12
	weapon.HeatRateUp = 0.35
	weapon.HeatRateDown = 1.2
	weapon.Attack = function( ent )
		self.NumPrim = self.NumPrim and self.NumPrim + 1 or 1

		if self.NumPrim > 2 then 
			self.NumPrim = 1 
		end

		local pod = ent:GetDriverSeat()
		if not IsValid( pod ) then 
			return 
		end

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
			bullet.Spread 	= Vector( 0.02,  0.02, 0.02 )
			bullet.TracerName = "lvs_laser_red"
			bullet.Force	= 10
			bullet.HullSize	= 25
			bullet.Damage	= 50
			bullet.SplashDamage	= 80
			bullet.SplashDamageRadius = 250
			bullet.Velocity = 50000
			bullet.Attacker 	= ent:GetDriver()
			bullet.Callback = function(att, tr, dmginfo)
				local effectdata = EffectData()
				effectdata:SetStart( Vector(255,50,50) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
				util.Effect( "lvs_laser_explosion", effectdata )
			end

			local effectdata = EffectData()
			effectdata:SetStart( Vector(255,50,50) )
			effectdata:SetOrigin( bullet.Src )
			effectdata:SetNormal( ent:GetForward() )
			effectdata:SetEntity( ent )
			util.Effect( "lvs_muzzle_colorable", effectdata )
			ent:LVSFireBullet( bullet )

		ent:TakeAmmo()

		ent.PrimarySND:PlayOnce( 100 + math.cos( CurTime() + self:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )
	
		local weapon = {}
		weapon.Icon = Material("lvs/weapons/bullet.png")
		weapon.Ammo = 250
		weapon.Delay = 0.3
		weapon.HeatRateUp = 0.6
		weapon.HeatRateDown = 0.5
		weapon.Attack = function( ent )
		local pod = ent:GetDriverSeat()

		if not IsValid( pod ) then return end

		local startpos = pod:LocalToWorld( pod:OBBCenter() ) --These 7 lines tell the vehicle where your crosshair is in the middle of the screen, this is required for weapons that aim towards the crosshair.
		local trace = util.TraceHull( {
			start = startpos,
			endpos = (startpos + ent:GetForward() * 50000),
			mins = Vector( -10, -10, -10 ),
			maxs = Vector( 10, 10, 10 ),
			filter = ent:GetCrosshairFilterEnts()
		} )

		for i = 0,1 do								--- These 3 lines are your mirror function, they allow you to shoot out of two positions at the same time.
		self.MirrorPrimary = not self.MirrorPrimary --- This specific mirror method is required for having the shots aim towards your crosshair, because for some reason that doesn't work with the other method.
		
		local Mirror = self.MirrorPrimary and -1 or 1

		local bullet = {}
			bullet.Src 	= self:LocalToWorld(Vector(205.93,-73.68,-120.98)) --This is your mirrored position. Whichever number has ' * Mirror' next to it will be mirrored as a positive and negative number
			bullet.Dir 	= (trace.HitPos - bullet.Src):GetNormalized() --This makes your shots aim towards the crosshair.
			bullet.Spread 	= Vector( 0.01,  0.01, 0.01 )
			bullet.TracerName = "lvs_laser_blue"
			bullet.Force	= 40
			bullet.HullSize 	= 25
			bullet.Damage	= 25
			bullet.SplashDamage = 100
			bullet.SplashDamageRadius = 25
			bullet.Velocity = 50000
			bullet.Attacker 	= ent:GetDriver()
			bullet.Callback = function(att, tr, dmginfo)
				local effectdata = EffectData()
					effectdata:SetStart( Vector(50,50,255) )  ---This determines the color of the impact effect when you shoot
					effectdata:SetOrigin( tr.HitPos )
					effectdata:SetNormal( tr.HitNormal )
				util.Effect( "lvs_laser_impact", effectdata )
				util.Effect( "cball_bounce", effectdata )
			end

				local effectdata = EffectData()
				effectdata:SetStart( Vector(50,50,255) ) ---This determines the color of the muzzle flash your ship makes when it shoots
				effectdata:SetOrigin( bullet.Src )
				effectdata:SetNormal( ent:GetForward() )
				effectdata:SetEntity( ent )
				util.Effect( "lvs_muzzle_colorable", effectdata )

				ent:LVSFireBullet( bullet )
			end --This extra 'end' closes off the mirror function, don't forget to include an end in this spot when mirroring or you'll get errors.

			ent:TakeAmmo()

			ent.SecondarySND:PlayOnce( 100 + math.cos( CurTime() + self:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
		end
		weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
		weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/vehicles/imperial/overheat.wav") end
	self:AddWeapon( weapon )
	
	local weapon = {}
		weapon.Icon = Material("lvs/weapons/dual_mg.png")
		weapon.Ammo = 1250
		weapon.Delay = 0.1
		weapon.HeatRateUp = 1.5
		weapon.HeatRateDown = 0.3
		weapon.Attack = function( ent )
			local bullet = {}
			bullet.Dir 	= ent:GetForward()
			bullet.Spread 	= Vector( 0.01,  0.01, 0.01 )
			bullet.TracerName = "lvs_laser_red"
			bullet.Force	= 10
			bullet.HullSize 	= 25
			bullet.Damage	= 40
			bullet.SplashDamage = 200
			bullet.SplashDamageRadius = 200
			bullet.Velocity = 60000
			bullet.Attacker 	= ent:GetDriver()
			bullet.Callback = function(att, tr, dmginfo)
				local effectdata = EffectData()
					effectdata:SetStart( Vector(255,50,50) ) 
					effectdata:SetOrigin( tr.HitPos )
					effectdata:SetNormal( tr.HitNormal )
				util.Effect( "lvs_laser_impact", effectdata )
			end

			for i = -1,1,2 do
				bullet.Src 	= ent:LocalToWorld( Vector(300.55,57.8 * i,-451.65) )

				local effectdata = EffectData()
				effectdata:SetStart( Vector(255,50,50) ) 
				effectdata:SetOrigin( bullet.Src )
				effectdata:SetNormal( ent:GetForward() )
				effectdata:SetEntity( ent )
				util.Effect( "lvs_muzzle_colorable", effectdata )

				ent:LVSFireBullet( bullet )
			end

			ent:TakeAmmo()

			ent.PrimarySND:PlayOnce( 100 + math.cos( CurTime() + self:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
		end
		weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
		weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/vehicles/imperial/overheat.wav") end
	self:AddWeapon( weapon )
	
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/missile.png")
	weapon.Ammo = 6
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

		ent._nextMissle = T + 0.3
		
		ent._swapMissile = not ent._swapMissile

		local Pos = Vector( 207, 73, -120.61)

		local projectile = ents.Create( "lvs_concussionmissile" )
		projectile:SetPos( ent:LocalToWorld( Pos ) )
		projectile:SetAngles( ent:GetAngles() )
		projectile:SetParent( ent )
		projectile:Spawn()
		projectile:Activate()
		projectile:SetAttacker( ent:GetDriver() )
		projectile:SetEntityFilter( ent:GetCrosshairFilterEnts() )
		projectile:SetSpeed( ent:GetVelocity():Length() + 4000 )

		ent._ProtonTorpedo = projectile

		ent:SetNextAttack( CurTime() + 0.1 ) -- wait 0.1 second before starting to track
	end
	weapon.FinishAttack = function( ent )
		if not IsValid( ent._ProtonTorpedo ) then return end

		local projectile = ent._ProtonTorpedo

		projectile:Enable()
		projectile:EmitSound( "lvs/vehicle/slave1/slave1_concussionmissile.wav", 125 )
		ent:TakeAmmo()

		ent._ProtonTorpedo = nil

		local NewHeat = ent:GetHeat() + 0.5

		ent:SetHeat( NewHeat )
		if NewHeat >= 1 then
			ent:SetOverheated( true )
		end
	end
	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )
	
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/protontorpedo.png")
	weapon.Ammo = 4
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

		ent._swapMissile = not ent._swapMissile

		local Pos = Vector(275.25, (ent._swapMissile and -16.66 or 16.66), -490.64 )

		local Driver = self:GetDriver()

		local projectile = ents.Create( "lvs_protontorpedo" )
		projectile:SetPos( ent:LocalToWorld( Pos ) )
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
	
	self:AddWeapon( LVS:GetWeaponPreset( "TURBO" ) )
end

ENT.FlyByAdvance = 0.75
ENT.FlyBySound = "lvs/vehicle/slave1/slave1_fly.wav" 
ENT.DeathSound = "lvs/vehicles/generic_starfighter/crash.wav"

ENT.EngineSounds = {
	{
		sound = "lvs/vehicle/slave1/engine.wav",
		sound_int = "lvs/vehicle/slave1/slave1_interior.wav",
		Pitch = 80,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 40,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
	},
}
--addons/ssrp_lfs/lua/entities/lvs_starfighter_stap/cl_init.lua:
include("shared.lua")

ENT.EngineFXPos = {
	Vector(-60.77,103.87,31.04),
}

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-43.79,108.02,57.05), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-43.79,-108.02,57.05), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-43.09,108.36,4.96), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-43.09,108.36,4.96), 0, 20, 2, 1000, 150 )
end

function ENT:OnFrame()
	self:EngineEffects()
end

function ENT:EngineEffects()
	if not self:GetEngineActive() then return end

	local T = CurTime()

	if (self.nextEFX or 0) > T then return end

	self.nextEFX = T + 0.01

	local THR = self:GetThrottle()

	local emitter = self:GetParticleEmitter( self:GetPos() )

	if not IsValid( emitter ) then return end

	for _, v in pairs( self.EngineFXPos ) do
		local Sub = Mirror and 1 or -1
		local vOffset = self:LocalToWorld( v )
		local vNormal = -self:GetForward()

		vOffset = vOffset + vNormal * 5


		if not particle then continue end

		particle:SetVelocity( vNormal * math.Rand(500,1000) + self:GetVelocity() )
		particle:SetLifeTime( 0 )
		particle:SetDieTime( 0.1 )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(15,25) )
		particle:SetEndSize( math.Rand(0,50) )
		particle:SetRoll( math.Rand(-1,1) * 100 )
		
		particle:SetColor( 255, 172, 28 )
	end
end
function ENT:OnStartBoost()
	self:EmitSound( "lvs/vehicles/vwing/boost.wav", 85 )
end

function ENT:OnStopBoost()
	self:EmitSound( "lvs/vehicles/vwing/brake.wav", 85 )
end

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	return self:LocalToWorld(Vector(250, 0, 20)), angles, fov
end
--addons/ssrp_lfs/lua/entities/lvs_starfighter_ywing_bomber/cl_init.lua:
include("shared.lua")

ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EngineFXColor = Color( 255, 25, 25, 255)
ENT.EngineFxPos = {
	Vector(-530,205,50),
	Vector(-530,-205,50),
}

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	if not pod:GetThirdPersonMode() then
		return pos, angles, fov
	end

	return self:LocalToWorld(Vector(-550, 0, 120)), angles, fov
end

function ENT:OnSpawn()
	for _, pos in ipairs(self.EngineFxPos) do
		self:RegisterTrail( pos, 2, 35, 2, 1000, 150 )
	end
end

function ENT:OnFrame()
	self:AnimAstromech()
end

function ENT:PostDraw()
end

function ENT:AnimAstromech()
	local T = CurTime()

	if (self.nextAstro or 0) < T then
		self.nextAstro = T + math.Rand(0.5,2)

		local HasShield = self:GetShield() > 0
		if self.OldShield == true and not HasShield then
			self:EmitSound( "lvs/vehicles/naboo_n1_starfighter/astromech/shieldsdown"..math.random(1,2)..".ogg",100 )
		else
			if math.random(0,4) == 3 then
				self:EmitSound( "lvs/vehicles/naboo_n1_starfighter/astromech/"..math.random(1,11)..".ogg", 70 )
			end
		end

		self.OldShield = HasShield
	end
end

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 200 + self:GetThrottle() * 55 + self:GetBoost() * 0.7

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

--addons/ssrp_lfs/lua/entities/lvs_walker_atte/shared.lua:

ENT.Base = "lvs_walker_atte_hoverscript"

ENT.PrintName = "ATTE"
ENT.Author = "Luna"
ENT.Information = "Assault Walker of the Galactic Republic"
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable		= true
ENT.AdminSpawnable	= false

ENT.MDL = "models/blu/atte.mdl"
ENT.GibModels = {
	"models/blu/atte.mdl",
	"models/blu/atte_rear.mdl",
	"models/blu/atte_bigfoot.mdl",
	"models/blu/atte_bigleg.mdl",
	"models/blu/atte_smallleg_part1.mdl",
	"models/blu/atte_smallleg_part2.mdl",
	"models/blu/atte_smallleg_part3.mdl"
}

ENT.AITEAM = 1

ENT.MaxHealth = 12000

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.HoverHeight = 140
ENT.HoverTraceLength = 225
ENT.HoverHullRadius = 20

ENT.TurretTurnRate = 100

ENT.LAATC_PICKUPABLE = true
ENT.LAATC_DROP_IN_AIR = true
ENT.LAATC_PICKUP_POS = Vector(-220,0,-115)
ENT.LAATC_PICKUP_Angle = Angle(0,0,0)

ENT.CanMoveOn = {
	["func_door"] = true,
	["func_movelinear"] = true,
	["prop_physics"] = true,
}

ENT.lvsShowInSpawner = true

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "RearEntity" )
	self:AddDT( "Entity", "TurretSeat" )
	self:AddDT( "Entity", "GunnerSeat" )

	self:AddDT( "Float", "Move" )
	self:AddDT( "Bool", "IsMoving" )
	self:AddDT( "Bool", "IsCarried" )
	self:AddDT( "Bool", "IsRagdoll" )
	self:AddDT( "Vector", "AIAimVector" )

	self:AddDT( "Float", "TurretPitch" )
	self:AddDT( "Float", "TurretYaw" )

	if SERVER then
		self:NetworkVarNotify( "IsCarried", self.OnIsCarried )
	end
end

function ENT:GetContraption()
	return {self, self:GetRearEntity()}
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

function ENT:GetAimAngles()
	local trace = self:GetEyeTrace()

	local AimAngles = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld( Vector(265,0,100)) ):GetNormalized():Angle() )

	local ID = self:LookupAttachment( "muzzle_right_up" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return AimAngles, trace.HitPos, false end

	local DirAng = self:WorldToLocalAngles( (trace.HitPos - self:GetDriverSeat():LocalToWorld( Vector(0,0,33) ) ):Angle() )

	return AimAngles, trace.HitPos, (math.abs( DirAng.p ) < 12 and math.abs( DirAng.y ) < 35)
end

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Ammo = 1000
	weapon.Delay = 0.1
	weapon.HeatRateUp = 2.5
	weapon.HeatRateDown = 1
	weapon.Attack = function( ent )
		if ent:GetIsCarried() then ent:SetHeat( 0 ) return true end

		local ID1 = ent:LookupAttachment( "muzzle_right_up" )
		local ID2 = ent:LookupAttachment( "muzzle_left_up" )
		local ID3 = ent:LookupAttachment( "muzzle_right_dn" )
		local ID4 = ent:LookupAttachment( "muzzle_left_dn" )

		local Muzzle1 = ent:GetAttachment( ID3 )
		local Muzzle2 = ent:GetAttachment( ID2 )
		local Muzzle3 = ent:GetAttachment( ID1 )
		local Muzzle4 = ent:GetAttachment( ID4 )

		if not Muzzle1 or not Muzzle2 or not Muzzle3 or not Muzzle4 then return end

		local FirePos = {
			[1] = Muzzle1,
			[2] = Muzzle2,
			[3] = Muzzle3,
			[4] = Muzzle4,
		}

		ent.FireIndex = ent.FireIndex and ent.FireIndex + 1 or 2

		if ent.FireIndex > #FirePos then
			ent.FireIndex = 1
		end

		local AimAngles, AimPos, InRange = ent:GetAimAngles()

		local Pos = FirePos[ent.FireIndex].Pos
		local Dir = (AimPos - Pos):GetNormalized()

		if not InRange then return true end

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

		if not IsValid( ent.SNDPrimary ) then return end

		ent.SNDPrimary:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if IsValid( base ) and base:GetIsCarried() then return end

		local AimAngles = ent:GetAimAngles()

		ent:SetPoseParameter("frontgun_pitch", math.Clamp(AimAngles.p,-5,5) )
		ent:SetPoseParameter("frontgun_yaw", AimAngles.y )
	end
	self:AddWeapon( weapon )

	self:InitTurret()
	self:InitGunner()
end
--addons/ssrp_lfs/lua/entities/lvs_walker_atte/cl_legs.lua:

function ENT:OnFrame()
	self:PredictPoseParamaters()
	self:DamageFX()

	local RearEnt = self:GetRearEntity()

	if not IsValid( RearEnt ) then return end

	if self:GetIsRagdoll() then 
		self:LegClearAll()
		RearEnt:LegClearAll()

		return
	end

	local Up = self:GetUp()
	local Forward = self:GetForward()
	local Vel = self:GetVelocity()
	
	local Stride = 40
	local Lift = 20
	
	local FT = math.min(FrameTime(),0.08) -- if fps lower than 12, clamp the frametime to avoid spazzing.

	local Rate = FT * 20

	if Vel:Length() < 10 then -- sync with server animation when not moving
		self.Move = self:GetMove()
	else
		self.Move = self.Move and self.Move + self:WorldToLocal( self:GetPos() + Vel ).x * FT * 1.8 or 0
	end
	
	local Cycl1 = self.Move
	local Cycl2 = self.Move + 180
	local Cycl3 = self.Move + 90
	local Cycl4 = self.Move + 270
	local Cycl5 = self.Move
	local Cycl6 = self.Move + 180
	
	local IsMoving = self:GetIsMoving()
	
	if self:GetIsCarried() then
		self.TRACEPOS1 = self:LocalToWorld( Vector(200,70,180) )
		self.TRACEPOS2 = self:LocalToWorld( Vector(200,-70,180) )
		self.TRACEPOS3 = RearEnt:LocalToWorld( Vector(-160,-70,180) )
		self.TRACEPOS4 = RearEnt:LocalToWorld( Vector(-160,70,180) )
		self.TRACEPOS5 = RearEnt:LocalToWorld( Vector(0,-140,150) )
		self.TRACEPOS6 = RearEnt:LocalToWorld( Vector(0,140,150) )
		Cycl1 = 0
		Cycl2 = 0
		Cycl3 = 0
		Cycl4 = 0
		Cycl5 = 0
		Cycl6 = 0
		IsMoving = true
	end

	local MoveRoll = math.cos( math.rad(self:GetMove()) ) * 2

	-- FRONT LEFT
	local X = 20 + math.cos( math.rad(Cycl1) ) * Stride
	local Z = math.max( math.sin( math.rad(-Cycl1) ), 0) * Lift
	local STARTPOS = self:LocalToWorld( Vector(179.38,49.49,135.76) )
	self.TRACEPOS1 = self.TRACEPOS1 and self.TRACEPOS1 or STARTPOS
	if Z > 0 or not IsMoving then 
		self.TRACEPOS1 = self.TRACEPOS1 + (STARTPOS + Forward * X - self.TRACEPOS1) * Rate
		self.FSOG1 = false
	else
		self.FSOG1 = true
	end
	local ENDPOS = util.TraceLine( { start = self.TRACEPOS1 - Up * 50, endpos = self.TRACEPOS1 - Up * 160, filter = function( ent ) if ent == self or ent == self:GetRearEntity() or self.HoverCollisionFilter[ ent:GetCollisionGroup() ] then return false end return true end,} ).HitPos + Up * (45+Z)
	if self.FSOG1 ~= self.oldFSOG1 then
		self.oldFSOG1 = self.FSOG1
		if self.FSOG1 then
			sound.Play( Sound( "lvs/vehicles/atte/stomp"..math.random(1,4).."_light.ogg" ), ENDPOS, SNDLVL_70dB)
			local effectdata = EffectData()
				effectdata:SetOrigin( ENDPOS - Vector(0,0,45) )
			util.Effect( "lvs_walker_stomp", effectdata )
		else
			sound.Play( Sound( "lvs/vehicles/atte/hydraulic"..math.random(1,7)..".ogg" ), ENDPOS, SNDLVL_70dB)
		end
	end
	
	local ATTACHMENTS = {
		Leg1 = {MDL = "models/blu/atte_smallleg_part3.mdl", Ang = Angle(-90,-90,0), Pos = Vector(0,0,0)},
		Leg2 = {MDL = "models/blu/atte_smallleg_part2.mdl", Ang = Angle(-90,-90,0), Pos = Vector(3,4,0)},
		Foot = {MDL = "models/blu/atte_smallleg_part1.mdl", Ang = Angle(0,0,MoveRoll), Pos = Vector(0,-4,0)}
	}
	self:GetLegEnts( 1, 60, 65, self:LocalToWorldAngles( Angle(90,-10,0) ), STARTPOS, ENDPOS, ATTACHMENTS )
	
	
	-- FRONT RIGHT
	local STARTPOS = self:LocalToWorld( Vector(179.38,-49.49,135.76) )
	local X = 20 + math.cos( math.rad(Cycl2) ) * Stride
	local Z = math.max( math.sin( math.rad(-Cycl2) ), 0) * Lift
	self.TRACEPOS2 = self.TRACEPOS2 and self.TRACEPOS2 or STARTPOS
	if Z > 0 or not IsMoving then 
		self.TRACEPOS2 = self.TRACEPOS2 + (STARTPOS + Forward * X - self.TRACEPOS2) * Rate
		self.FSOG2 = false
	else
		self.FSOG2 = true
	end
	local ENDPOS = util.TraceLine( { start = self.TRACEPOS2 - Up * 50, endpos = self.TRACEPOS2 - Up * 160, filter = function( ent ) if ent == self or ent == self:GetRearEntity() or self.HoverCollisionFilter[ ent:GetCollisionGroup() ] then return false end return true end, } ).HitPos + Up * (45+Z)
	if self.FSOG2 ~= self.oldFSOG2 then
		self.oldFSOG2 = self.FSOG2
		if self.FSOG2 then
			sound.Play( Sound( "lvs/vehicles/atte/stomp"..math.random(1,4).."_light.ogg" ), ENDPOS, SNDLVL_70dB)
			local effectdata = EffectData()
				effectdata:SetOrigin( ENDPOS - Vector(0,0,45) )
			util.Effect( "lvs_walker_stomp", effectdata )
		else
			sound.Play( Sound( "lvs/vehicles/atte/hydraulic"..math.random(1,7)..".ogg" ), ENDPOS, SNDLVL_70dB)
		end
	end
	
	local ATTACHMENTS = {
		Leg1 = {MDL = "models/blu/atte_smallleg_part3.mdl", Ang = Angle(-90,90,0), Pos = Vector(0,0,0)},
		Leg2 = {MDL = "models/blu/atte_smallleg_part2.mdl", Ang = Angle(-90,90,0), Pos = Vector(-3,-4,0)},
		Foot = {MDL = "models/blu/atte_smallleg_part1.mdl", Ang = Angle(0,180,-MoveRoll), Pos = Vector(0,4,0)}
	}
	
	self:GetLegEnts( 2, 60, 65, self:LocalToWorldAngles( Angle(90,10,0) ), STARTPOS, ENDPOS, ATTACHMENTS )
	
	
	local Forward = RearEnt:GetForward()
	local Up = RearEnt:GetUp()

	-- REAR RIGHT
	local STARTPOS = RearEnt:LocalToWorld( Vector(-144.56,-68.16,126.39) )
	local X = -20 + math.cos( math.rad(Cycl5) ) * Stride
	local Z = math.max( math.sin( math.rad(-Cycl5) ), 0) * Lift
	self.TRACEPOS3 = self.TRACEPOS3 and self.TRACEPOS3 or STARTPOS
	if Z > 0 or not IsMoving then 
		self.TRACEPOS3 = self.TRACEPOS3 + (STARTPOS + Forward * X - self.TRACEPOS3) * Rate
		self.FSOG3 = false
	else
		self.FSOG3 = true
	end
	local ENDPOS = util.TraceLine( { start = self.TRACEPOS3 - Up * 50, endpos = self.TRACEPOS3 - Up * 160, filter = function( ent ) if ent == self or ent == self:GetRearEntity() or self.HoverCollisionFilter[ ent:GetCollisionGroup() ] then return false end return true end, } ).HitPos + Up * (45+Z)
	if self.FSOG3 ~= self.oldFSOG3 then
		self.oldFSOG3 = self.FSOG3
		if self.FSOG3 then
			sound.Play( Sound( "lvs/vehicles/atte/stomp"..math.random(1,4).."_light.ogg" ), ENDPOS, SNDLVL_70dB)
			local effectdata = EffectData()
				effectdata:SetOrigin( ENDPOS - Vector(0,0,45) )
			util.Effect( "lvs_walker_stomp", effectdata )
		else
			sound.Play( Sound( "lvs/vehicles/atte/hydraulic"..math.random(1,7)..".ogg" ), ENDPOS, SNDLVL_70dB)
		end
	end
	
	local ATTACHMENTS = {
		Leg1 = {MDL = "models/blu/atte_smallleg_part3.mdl", Ang = Angle(-90,-90,0), Pos = Vector(0,0,0)},
		Leg2 = {MDL = "models/blu/atte_smallleg_part2.mdl", Ang = Angle(-90,-90,0), Pos = Vector(3,4,0)},
		Foot = {MDL = "models/blu/atte_smallleg_part1.mdl", Ang = Angle(0,180,0), Pos = Vector(0,4,0)}
	}
	
	RearEnt:GetLegEnts( 3, 60, 65, RearEnt:LocalToWorldAngles( Angle(90,180,0) ), STARTPOS, ENDPOS, ATTACHMENTS )
	
	
	-- REAR LEFT
	local STARTPOS = RearEnt:LocalToWorld( Vector(-144.56,68.16,126.39) )
	local X = -20 + math.cos( math.rad(Cycl6) ) * Stride
	local Z = math.max( math.sin( math.rad(-Cycl6) ), 0) * Lift
	self.TRACEPOS4 = self.TRACEPOS4 and self.TRACEPOS4 or STARTPOS
	if Z > 0 or not IsMoving then 
		self.TRACEPOS4 = self.TRACEPOS4 + (STARTPOS + Forward * X - self.TRACEPOS4) * Rate
		self.FSOG4 = false
	else
		self.FSOG4 = true
	end
	local ENDPOS = util.TraceLine( { start = self.TRACEPOS4 - Up * 50, endpos = self.TRACEPOS4 - Up * 160, filter = function( ent ) if ent == self or ent == self:GetRearEntity() or self.HoverCollisionFilter[ ent:GetCollisionGroup() ] then return false end return true end, } ).HitPos + Up * (45+Z)
	if self.FSOG4 ~= self.oldFSOG4 then
		self.oldFSOG4 = self.FSOG4
		if self.FSOG4 then
			sound.Play( Sound( "lvs/vehicles/atte/stomp"..math.random(1,4).."_light.ogg" ), ENDPOS, SNDLVL_70dB)
			local effectdata = EffectData()
				effectdata:SetOrigin( ENDPOS - Vector(0,0,45) )
			util.Effect( "lvs_walker_stomp", effectdata )
		else
			sound.Play( Sound( "lvs/vehicles/atte/hydraulic"..math.random(1,7)..".ogg" ), ENDPOS, SNDLVL_70dB)
		end
	end
	
	local ATTACHMENTS = {
		Leg1 = {MDL = "models/blu/atte_smallleg_part3.mdl", Ang = Angle(-90,90,0), Pos = Vector(0,0,0)},
		Leg2 = {MDL = "models/blu/atte_smallleg_part2.mdl", Ang = Angle(-90,90,0), Pos = Vector(-3,-4,0)},
		Foot = {MDL = "models/blu/atte_smallleg_part1.mdl", Ang = Angle(0,0,0), Pos = Vector(0,-4,0)}
	}
	
	RearEnt:GetLegEnts( 4, 60, 65, RearEnt:LocalToWorldAngles( Angle(90,180,0) ), STARTPOS, ENDPOS, ATTACHMENTS )


	local Right = RearEnt:GetRight()

	-- MID RIGHT
	local STARTPOS = RearEnt:LocalToWorld( Vector(-11.37,-45,139.61) )
	local X = 30 + math.cos( math.rad(Cycl3) ) * Stride
	local Z = math.max( math.sin( math.rad(-Cycl3) ), 0) * Lift
	self.TRACEPOS5 = self.TRACEPOS5 and self.TRACEPOS5 or STARTPOS
	if Z > 0 or not IsMoving then 
		self.TRACEPOS5 = self.TRACEPOS5 + (STARTPOS + Forward * X + Right * 90 - self.TRACEPOS5) * Rate
		self.FSOG5 = false
	else
		self.FSOG5 = true
	end
	local ENDPOS = util.TraceLine( { start = self.TRACEPOS5 - Up * 50, endpos = self.TRACEPOS5 - Up * 160, filter = function( ent ) if ent == self or ent == self:GetRearEntity() or self.HoverCollisionFilter[ ent:GetCollisionGroup() ] then return false end return true end, } ).HitPos + Up * (60+Z)
	if self.FSOG5 ~= self.oldFSOG5 then
		self.oldFSOG5 = self.FSOG5
		if self.FSOG5 then
			sound.Play( Sound( "lvs/vehicles/atte/stomp"..math.random(1,4)..".ogg" ), ENDPOS, SNDLVL_100dB )
			local effectdata = EffectData()
				effectdata:SetOrigin( ENDPOS - Vector(0,0,65) )
			util.Effect( "lvs_walker_stomp", effectdata )
		else
			sound.Play( Sound( "lvs/vehicles/atte/lift"..math.random(1,4)..".ogg" ), ENDPOS, SNDLVL_100dB )
		end
	end
	
	local ATTACHMENTS = {
		Leg2 = {MDL = "models/blu/atte_bigleg.mdl", Ang = Angle(-90,180,0), Pos = Vector(0,0,0)},
		Foot = {MDL = "models/blu/atte_bigfoot.mdl", Ang = Angle(0,180,0), Pos = Vector(-16,3,0)}
	}
	
	RearEnt:GetLegEnts( 5, 60, 94, RearEnt:LocalToWorldAngles( Angle(135,100,0) ), STARTPOS, ENDPOS, ATTACHMENTS )
	
	
	
	-- MID LEFT
	local STARTPOS = RearEnt:LocalToWorld( Vector(-11.37,45,139.61) )
	local X = 30 + math.cos( math.rad(Cycl4) ) * Stride
	local Z = math.max( math.sin( math.rad(-Cycl4) ), 0) * Lift
	self.TRACEPOS6 = self.TRACEPOS6 and self.TRACEPOS6 or STARTPOS
	if Z > 0 or not IsMoving then 
		self.TRACEPOS6 = self.TRACEPOS6 + (STARTPOS + Forward * X - Right * 90 - self.TRACEPOS6) * Rate
		self.FSOG6 = false
	else
		self.FSOG6 = true
	end
	local ENDPOS = util.TraceLine( { start = self.TRACEPOS6 - Up * 50, endpos = self.TRACEPOS6 - Up * 160, filter = function( ent ) if ent == self or ent == self:GetRearEntity() or self.HoverCollisionFilter[ ent:GetCollisionGroup() ] then return false end return true end } ).HitPos + Up * (60+Z)
	if self.FSOG6 ~= self.oldFSOG6 then
		self.oldFSOG6 = self.FSOG6
		if self.FSOG6 then
			sound.Play( Sound( "lvs/vehicles/atte/stomp"..math.random(1,4)..".ogg" ), ENDPOS, SNDLVL_100dB )
			local effectdata = EffectData()
				effectdata:SetOrigin( ENDPOS - Vector(0,0,65) )
			util.Effect( "lvs_walker_stomp", effectdata )
		else
			sound.Play( Sound( "lvs/vehicles/atte/lift"..math.random(1,4)..".ogg" ), ENDPOS, SNDLVL_100dB )
		end
	end
	
	local ATTACHMENTS = {
		Leg2 = {MDL = "models/blu/atte_bigleg.mdl", Ang = Angle(-90,180,0), Pos = Vector(0,0,0)},
		Foot = {MDL = "models/blu/atte_bigfoot.mdl", Ang = Angle(0,0,0), Pos = Vector(16,-3,0)}
	}
	
	RearEnt:GetLegEnts( 6, 60, 94, RearEnt:LocalToWorldAngles( Angle(135,-100,0) ), STARTPOS, ENDPOS, ATTACHMENTS )
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

--addons/!lpakr_out/lua/dash/thirdparty/medialib.core/medialib.core.lua:
local a;do local b="git@f8be0165"local c=true;a=a||{}a.VERSION=b;a.DISTRIBUTABLE=c;a.INSTANCE=a.VERSION.."_1"a.Modules={}local d=CreateConVar("medialib_debug","0",FCVAR_ARCHIVE)cvars.AddChangeCallback(d:GetName(),function(e,e,f)a.DEBUG=f=="1"end)a.DEBUG=d:GetBool()function a.modulePlaceholder(g)a.Modules[g]={}end;function a.module(g,h)if a.DEBUG then print("[MediaLib] Creating module "..g)end;local i=a.Modules[g]||{name=g,options=h}a.Modules[g]=i;return i end;local j=file.Exists;function a.tryInclude(file)if j(file,"LUA")then include(file)return true end;if a.DEBUG then print("[MediaLib] Attempted to include nonexistent file "..file)end;return false end;function a.load(g)local i=a.Modules[g]if i then return i end;if a.DEBUG then print("[MediaLib] Loading unreferenced module "..g)end;local file="medialib/"..g..".lua"if!a.tryInclude(file)then return nil end;return a.Modules[g]end;local k=setmetatable({medialib=a},{__index=_G})local l={read=function(self)return file.Read(self.lua_path,"LUA")end,load=function(self)return include(self.lua_path)end,addcs=function(self)AddCSLuaFile(self.lua_path)end}l.__index=l;local m={read=function(self)return self.source end,load=function(self)local n=CompileString(self:read(),"MediaLib_DynFile_"..self.name)setfenv(n,k)return n()end,addcs=function()end}m.__index=m;a.FolderItems={}function a.folderIterator(o)local p={}for e,q in pairs(file.Find("medialib/"..o.."/*.lua","LUA"))do table.insert(p,setmetatable({name=q,lua_path="medialib/"..o.."/"..q},l))end;for r,s in pairs(a.FolderItems)do local t=r:match("^([^/]*).+")if t==o then table.insert(p,setmetatable({name=r:match("^[^/]*/(.+)"),source=s},m))end end;return pairs(p)end;if CLIENT then local function u()for v=1,30 do MsgC(HSVToColor(30*v,0.5,0.9)," "..string.rep("SEE BELOW FOR INSTRUCTIONS  ",3).."\n")end end;concommand.Add("medialib_noflash",function(e,e,w)if w[1]=="rainbow"then u()end;SetClipboardText("http://get.adobe.com/flashplayer/otherversions/")MsgN("[ MediaLib: How to get Flash Player ]")MsgN("1. Open this website in your browser (not the ingame Steam browser): ".."http://get.adobe.com/flashplayer/otherversions/")MsgN("   (the link has been automatically copied to your clipboard)")MsgN("2. Download and install the NSAPI (for Firefox) version")MsgN("3. Restart your Garry's Mod and rejoin this server")MsgN("[ ======================= ]")end)concommand.Add("medialib_lowaudio",function(e,e,w)if w[1]=="rainbow"then u()end;SetClipboardText("http://windows.microsoft.com/en-us/windows7/adjust-the-sound-level-on-your-computer")MsgN("[ MediaLib: How to fix muted sound ]")MsgN("1. Follow instructions here: ".."http://windows.microsoft.com/en-us/windows7/adjust-the-sound-level-on-your-computer")MsgN("   (the link has been automatically copied to your clipboard, you can open it in the steam ingame browser)")MsgN("2. Increase the volume of a process called 'Awesomium Core'")MsgN("3. You should immediately start hearing sound if a mediaclip is playing")MsgN("[ ======================= ]")end)hook.Add("OnPlayerChat","MediaLib.ShowInstructions",function(e,x)if x:match("!ml_noflash")then RunConsoleCommand("medialib_noflash","rainbow")RunConsoleCommand("showconsole")elseif x:match("!ml_lowvolume")then RunConsoleCommand("medialib_lowaudio","rainbow")RunConsoleCommand("showconsole")end end)end end;a.modulePlaceholder("oop")do local y=a.module("oop")y.Classes=y.Classes||{}function y.class(g,z)local A=y.Classes[g]if!A then A=y.createClass(g,z)y.Classes[g]=A;if a.DEBUG then print("[MediaLib] Registering oopclass "..g)end end;return A end;function y.resolveClass(B)if B==nil then return y.Object end;local C=type(B)if C=="string"then local D=y.Classes[B]if D then return D end;error("Resolving class from inexistent class string '"..tostring(B).."'")end;if C=="table"then return B end;error("Resolving class from invalid object '"..tostring(B).."'")end;local E={}local F={'__add','__call','__concat','__div','__ipairs','__le','__len','__lt','__mod','__mul','__pairs','__pow','__sub','__tostring','__unm'}function y.createClass(g,z)local A={}local G;if z!=E then G=y.resolveClass(z)end;A.name=g;A.super=G;A.members=setmetatable({},{__index=A.super})A.members.class=A;A.members.super=A.super;local H={}do H.__index=A.members;for e,I in pairs(F)do H[I]=function(...)local J=A.members[I]if J then return J(...)end end end end;local K={}do K.__index=A.members;K.__newindex=A.members;K.__tostring=function(self)return"class "..self.name end;function K:__call(...)local L={}setmetatable(L,H)local M=L.initialize;if M then M(L,...)end;return L end end;setmetatable(A,K)return A end;y.Object=y.createClass("Object",E)function y.Object:hashCode()local N=getmetatable(self)local O=N.__tostring;N.__tostring=nil;local P=tostring(self):match("table: 0x(.*)")N.__tostring=O;return P end;function y.Object:__tostring()return string.format("%s@%s",self.class.name,self:hashCode())end end;a.modulePlaceholder("mediabase")do local y=a.load("oop")local Q=y.class("Media")function Q:on(R,S)self._events=self._events||{}self._events[R]=self._events[R]||{}self._events[R][S]=true end;function Q:emit(R,...)if!self._events then return end;local T=self._events[R]if!T then return end;for r,e in pairs(T)do r(...)end end;function Q:getServiceBase()error("Media:getServiceBase() not implemented!")end;function Q:getService()return self._service end;function Q:getUrl()return self._unresolvedUrl end;function Q:lookupMetadata()local U=self._metadata;if type(U)=="table"then return U end;if U==true||type(U)=="string"then return nil end;self._metadata=true;self:getService():query(self:getUrl(),function(V,W)if V then self._metadata=V else self._metadata=W end end)return nil end;function Q:isValid()return false end;function Q:IsValid()return self:isValid()end;function Q:setVolume(X)end;function Q:getVolume()end;function Q:setQuality(Y)end;function Q:seek(Z)end;function Q:getTime()return 0 end;function Q:sync(_,a0)if self._lastSync&&self._lastSync>CurTime()-5 then return end;local a1=self:shouldSync(_,a0)if!a1 then return end;self:seek(_+0.1)self._lastSync=CurTime()end;function Q:shouldSync(_,a0)if!self:isValid()||!self:isPlaying()then return false end;a0=a0||2;local a2=self:getTime()local a3=math.abs(a2-_)return a3>a0 end;function Q:getState()end;function Q:isPlaying()return self:getState()=="playing"end;function Q:play()end;function Q:pause()end;function Q:stop()end;function Q:runCommand(a4)end;function Q:draw(a5,a6,a7,a8)end;function Q:getTag()return self._tag end;function Q:setTag(a9)self._tag=a9 end;function Q:guessDefaultTag()for v=1,10 do local aa=debug.getinfo(v,"S")if!aa then break end;local ab=aa.short_src;local ac=ab:match("addons/(.-)/")if ac&&ac!="medialib"then return string.format("addon:%s",ac)end end;return"addon:medialib"end;function Q:setDefaultTag()self:setTag(self:guessDefaultTag())end;function Q:getDebugInfo()return string.format("[%s] Media [%s] valid:%s state:%s url:%s time:%d",self:getTag(),self.class.name,tostring(self:isValid()),self:getState(),self:getUrl(),self:getTime())end end;a.modulePlaceholder("media")do local ad=a.module("media")ad.Services={}function ad.registerService(g,A)ad.Services[g]=A()end;ad.RegisterService=ad.registerService;function ad.service(g)return ad.Services[g]end;ad.Service=ad.service;function ad.guessService(ae,h)for g,af in pairs(ad.Services)do local ag=true;if h&&h.whitelist then ag=ag&&table.HasValue(h.whitelist,g)end;if h&&h.blacklist then ag=ag&&!table.HasValue(h.blacklist,g)end;if ag&&af:isValidUrl(ae)then return af end end end;ad.GuessService=ad.guessService end;a.modulePlaceholder("mediaregistry")do local ah=a.module("mediaregistry")local ai=setmetatable({},{__mode="v"})function ah.add(ad)table.insert(ai,ad)end;function ah.get()return ai end;concommand.Add("medialib_listall",function()hook.Run("MediaLib_ListAll")end)hook.Add("MediaLib_ListAll","MediaLib_"..a.INSTANCE,function()print("Media for medialib version "..a.INSTANCE..":")for e,aj in pairs(ai)do print(aj:getDebugInfo())end end)concommand.Add("medialib_stopall",function()hook.Run("MediaLib_StopAll")end)hook.Add("MediaLib_StopAll","MediaLib_"..a.INSTANCE,function()for e,aj in pairs(ai)do aj:stop()end;table.Empty(ai)end)local d=CreateConVar("medialib_debugmedia","0")hook.Add("HUDPaint","MediaLib_G_DebugMedia",function()if!d:GetBool()then return end;local ak={0}hook.Run("MediaLib_DebugPaint",ak)end)hook.Add("MediaLib_DebugPaint","MediaLib_"..a.INSTANCE,function(ak)local v=ak[1]for e,ad in pairs(ai)do local C=string.format("#%d %s",v,ad:getDebugInfo())draw.SimpleText(C,"DermaDefault",10,10+v*15)v=v+1 end;ak[1]=v end)end;a.modulePlaceholder("servicebase")do local y=a.load("oop")local ah=a.load("mediaregistry")local al=y.class("Service")function al:on(R,S)self._events=self._events||{}self._events[R]=self._events[R]||{}self._events[R][S]=true end;function al:emit(R,...)for r,e in pairs(self._events[R]||{})do r(...)end;if R=="error"then MsgN("[MediaLib] Video error: "..table.ToString{...})end end;function al:load()end;function al:loadMediaObject(ad,ae,h)ad._unresolvedUrl=ae;ad._service=self;ad:setDefaultTag()hook.Run("Medialib_ProcessOpts",ad,h||{})ah.add(ad)self:resolveUrl(ae,function(am,an)ad:openUrl(am)if an&&an.start&&(!h||!h.dontSeek)then ad:seek(an.start)end end)end;function al:isValidUrl()end;function al:directQuery()end;local ao={}ao.__index=ao;function ao:addCallback(ap)table.insert(self._callbacks,ap)end;function ao:run(V,W)local aq=table.remove(self._callbacks,1)if!aq then return end;aq(V,W,function(ar,as)self:run(ar,as)end)end;function al:query(ae,S)local at=setmetatable({_callbacks={}},ao)at:addCallback(function(e,e,ap)return self:directQuery(ae,ap)end)hook.Run("Medialib_ExtendQuery",ae,at)at:addCallback(function(V,W)S(V,W)end)at:run(ae)end;function al:parseUrl()end;function al:resolveUrl(ae,ap)ap(ae,self:parseUrl(ae))end end;a.modulePlaceholder("timekeeper")do local y=a.load("oop")local au=y.class("TimeKeeper")function au:initialize()self:reset()end;function au:reset()self.cachedTime=0;self.cachedDuration=0;self.running=false;self.runningTimeStart=0 end;function au:getTime()local _=self.cachedTime;if self.running then _=_+RealTime()-self.runningTimeStart end;return _ end;function au:isRunning()return self.running end;function au:play()if self.running then return end;self.runningTimeStart=RealTime()self.running=true end;function au:pause()if!self.running then return end;local av=RealTime()-self.runningTimeStart;self.cachedTime=self.cachedTime+av;self.running=false end;function au:seek(_)self.cachedTime=_;if self.running then self.runningTimeStart=RealTime()end end;function au:getDuration(S)if self.cachedDuration&&self.cachedDuration>0 then S(self.cachedDuration)end;self.durationCallback=S end;function au:setDuration(aw)self.cachedDuration=aw;if self.durationCallback then self.durationCallback(aw)end end end;a.modulePlaceholder("service_html")do local y=a.load("oop")a.load("timekeeper")local ax=y.class("HTMLService","Service")function ax:load(ae,h)local ad=y.class("HTMLMedia")()self:loadMediaObject(ad,ae,h)return ad end;function ax:hasReliablePlaybackEvents(ay)return false end;local az={instances={}}local function aA()return a.MAX_HTMLPOOL_INSTANCES||0 end;hook.Add("MediaLib_HTMLPoolInfo",a.INSTANCE,function()print(a.INSTANCE.."> Free HTMLPool instance count: "..#az.instances.."/"..aA())end)concommand.Add("medialib_htmlpoolinfo",function()hook.Run("MediaLib_HTMLPoolInfo")end)timer.Create("MediaLib."..a.INSTANCE..".HTMLPoolCleaner",60,0,function()if#az.instances==0 then return end;local aB=table.remove(az.instances,1)if IsValid(aB)then aB:Remove()end end)function az.newInstance()return vgui.Create("DHTML")end;function az.get()if#az.instances==0 then if a.DEBUG then MsgN("[MediaLib] Returning new instance; htmlpool empty")end;return az.newInstance()end;local aB=table.remove(az.instances,1)if!IsValid(aB)then if a.DEBUG then MsgN("[MediaLib] Returning new instance; instance was invalid")end;return az.newInstance()end;if a.DEBUG then MsgN("[MediaLib] Returning an instance from the HTML pool")end;return aB end;function az.free(aB)if!IsValid(aB)then return end;if#az.instances>=aA()then if a.DEBUG then MsgN("[MediaLib] HTMLPool full; removing the freed instance")end;aB:Remove()else if a.DEBUG then MsgN("[MediaLib] Freeing an instance to the HTMLPool")end;aB:SetHTML("")table.insert(az.instances,aB)end end;local aC=CreateConVar("medialib_showallmessages","0")local aD=y.class("HTMLMedia","Media")local aE,aF=1280,720;function aD:initialize()self.timeKeeper=y.class("TimeKeeper")()self.panel=az.get()local aG=self.panel;aG:SetPos(0,0)aG:SetSize(aE,aF)local aH="MediaLib.HTMLMedia.FakeThink-"..self:hashCode()hook.Add("Think",aH,function()if!IsValid(self.panel)then hook.Remove("Think",aH)return end;self.panel:Think()end)local aI=aG._OldCM||aG.ConsoleMessage;aG._OldCM=aI;aG.ConsoleMessage=function(aJ,aK)if aK&&isstring(aK)&&!aC:GetBool()then if string.find(aK,"XMLHttpRequest",nil,true)then return end;if string.find(aK,"Unsafe JavaScript attempt to access",nil,true)then return end;if string.find(aK,"Unable to post message to",nil,true)then return end;if string.find(aK,"ran insecure content from",nil,true)then return end;if string.find(aK,"Mixed Content:",nil,true)then return end end;return aI(aJ,aK)end;aG:AddFunction("console","warn",function(aL)if!aC:GetBool()then return end;aG:ConsoleMessage(aL)end)aG:SetPaintedManually(true)aG:SetVisible(false)aG:AddFunction("medialiblua","Event",function(aM,aN)self:handleHTMLEvent(aM,util.JSONToTable(aN))end)end;function aD:getBaseService()return"html"end;function aD:openUrl(ae)self.panel:OpenURL(ae)self.URLChanged=CurTime()end;function aD:runJS(aO,...)local aP=string.format(aO,...)self.panel:QueueJavascript(aP)end;function aD:handleHTMLEvent(aM,R)if a.DEBUG then MsgN("[MediaLib] HTML Event: "..aM.." ("..table.ToString(R)..")")end;if aM=="stateChange"then local aQ=R.state;local aR;if R.time then self.timeKeeper:seek(R.time)end;if aQ=="playing"then aR="playing"self.timeKeeper:play()elseif aQ=="ended"||aQ=="paused"||aQ=="buffering"then aR=aQ;self.timeKeeper:pause()elseif aQ=="duration"then self.timeKeeper:setDuration(R.duration)end;if aR then self.state=aR;self:emit(aR)end elseif aM=="playerLoaded"then for e,aS in pairs(self.commandQueue||{})do aS()end elseif aM=="error"then self:emit("error",{errorId="service_error",errorName="Error from service: "..tostring(R.message)})else MsgN("[MediaLib] Unhandled HTML event "..tostring(aM))end end;function aD:getState()return self.state end;local aT=CreateConVar("medialib_html_updatestride","1",FCVAR_ARCHIVE)function aD:setUpdateStrideOverride(aU)self._updateStrideOverride=aU end;function aD:updateTexture()local aV=FrameNumber()local aW=self._nextTextureUpdateFrame||0;local aX=self._updateStrideOverride||aT:GetInt()if aW<=aV then self.panel:UpdateHTMLTexture()self._nextTextureUpdateFrame=aV+aX end end;function aD:getHTMLMaterial()if self._htmlMat then return self._htmlMat end;local aY=self.panel:GetHTMLMaterial()self._htmlMat=aY;return aY end;function aD:draw(aZ,a_,b0,b1)self:updateTexture()local aY=self:getHTMLMaterial()if!aY then return end;surface.SetMaterial(aY)surface.SetDrawColor(255,255,255)local b2,b3=aE/aY:Width(),aF/aY:Height()surface.DrawTexturedRectUV(aZ||0,a_||0,b0||aE,b1||aF,0,0,b2,b3)end;function aD:getTime()return self.timeKeeper:getTime()end;function aD:setQuality(b4)if self.lastSetQuality&&self.lastSetQuality==b4 then return end;self.lastSetQuality=b4;self:runJS("medialibDelegate.run('setQuality', {quality: %q})",b4)end;function aD:applyVolume()local b5=self.internalVolume||1;local b6=self.volume||1;local b7=b5*b6;if self.lastSetVolume&&self.lastSetVolume==b7 then return end;self.lastSetVolume=b7;self:runJS("medialibDelegate.run('setVolume', {vol: %f})",b7)end;function aD:setVolume(b7)self.volume=b7;self:applyVolume()end;function aD:getVolume()return self.volume||1 end;local b8=0.2;function aD:seek(_)self.timeKeeper:seek(_-b8)self:runJS("medialibDelegate.run('seek', {time: %.1f})",_)end;function aD:getDuration(S)return self.timeKeeper:getDuration(S)end;function aD:hasReliablePlaybackEvents()local af=self:getService()return af&&af:hasReliablePlaybackEvents(self)end;function aD:play()if!self:hasReliablePlaybackEvents()then self.timeKeeper:play()end;self:runJS("medialibDelegate.run('play')")end;function aD:pause()if!self:hasReliablePlaybackEvents()then self.timeKeeper:pause()end;self:runJS("medialibDelegate.run('pause')")end;function aD:stop()az.free(self.panel)self.panel=nil;self.timeKeeper:pause()self:emit("ended",{stopped=true})self:emit("destroyed")end;function aD:runCommand(aS)if self._playerLoaded then aS()else self.commandQueue=self.commandQueue||{}self.commandQueue[#self.commandQueue+1]=aS end end;function aD:isValid()return IsValid(self.panel)end end;a.modulePlaceholder("service_bass")do local y=a.load("oop")local b9=y.class("BASSService","Service")function b9:load(ae,h)local ad=y.class("BASSMedia")()self:loadMediaObject(ad,ae,h)return ad end;local ba=y.class("BASSMedia","Media")function ba:initialize()self.bassPlayOptions={"noplay","noblock"}self.commandQueue={}end;function ba:getBaseService()return"bass"end;function ba:updateFFT()local bb=FrameNumber()if self._lastFFTUpdate&&self._lastFFTUpdate==bb then return end;self._lastFFTUpdate=bb;local bc=self.chan;if!IsValid(bc)then return end;self.fftValues=self.fftValues||{}bc:FFT(self.fftValues,FFT_512)end;function ba:getFFT()return self.fftValues end;function ba:draw(aZ,a_,b0,b1)surface.SetDrawColor(0,0,0)surface.DrawRect(aZ,a_,b0,b1)self:updateFFT()local bd=self:getFFT()if!bd then return end;local be=#bd;local bf=b0/be;for v=1,be do surface.SetDrawColor(HSVToColor(v,0.9,0.5))local bg=bd[v]*b1;surface.DrawRect(aZ+v*bf,a_+b1-bg,bf,bg)end end;function ba:openUrl(ae)self._openingInfo={"url",ae}local bh=table.concat(self.bassPlayOptions," ")sound.PlayURL(ae,bh,function(bc,bi,bj)self:bassCallback(bc,bi,bj)end)end;function ba:openFile(bk)self._openingInfo={"file",bk}local bh=table.concat(self.bassPlayOptions," ")sound.PlayFile(bk,bh,function(bc,bi,bj)self:bassCallback(bc,bi,bj)end)end;function ba:reload()local type,bl=unpack(self._openingInfo||{})if!type then MsgN("[Medialib] Attempting to reload BASS stream that was never started the first time!")return end;if IsValid(self.chan)then self.chan:Stop()self.chan=nil end;self._stopped=false;self:stopStateChecker()self.commandQueue={}MsgN("[Medialib] Attempting to reload BASS stream ",type,bl)if type=="url"then self:openUrl(bl)elseif type=="file"then self:openFile(bl)elseif type then MsgN("[Medialib] Failed to reload audio resource ",type,bl)return end;self:applyVolume(true)if self._commandState=="play"then self:play()end end;function ba:bassCallback(bc,bi,bj)if!IsValid(bc)then ErrorNoHalt("[MediaLib] BassMedia play failed: ",bj)self._stopped=true;self:emit("error","loading_failed",string.format("BASS error id: %s; name: %s",bi,bj))return end;if self._stopped then MsgN("[MediaLib] Loading BASS media aborted; stop flag was enabled")bc:Stop()return end;self.chan=bc;for e,bm in pairs(self.commandQueue)do bm(bc)end;self.commandQueue={}self:startStateChecker()end;function ba:startStateChecker()timer.Create("MediaLib_BASS_EndChecker_"..self:hashCode(),1,0,function()if IsValid(self.chan)&&self.chan:GetState()==GMOD_CHANNEL_STOPPED then self:emit("ended")self:stopStateChecker()end end)end;function ba:stopStateChecker()timer.Remove("MediaLib_BASS_EndChecker_"..self:hashCode())end;function ba:runCommand(aS)if IsValid(self.chan)then aS(self.chan)else self.commandQueue[#self.commandQueue+1]=aS end end;function ba:applyVolume(bn)local b5=self.internalVolume||1;local b6=self.volume||1;local b7=b5*b6;if!bn&&self.lastSetVolume&&self.lastSetVolume==b7 then return end;self.lastSetVolume=b7;self:runCommand(function(bc)bc:SetVolume(b7)end)end;function ba:setVolume(b7)self.volume=b7;self:applyVolume()end;function ba:getVolume()return self.volume||1 end;function ba:seek(_)self:runCommand(function(bc)if bc:IsBlockStreamed()then return end;self._seekingTo=_;local bo="MediaLib_BASSMedia_Seeker_"..self:hashCode()local function bp()if self._seekingTo!=_||!IsValid(bc)then timer.Destroy(bo)return end;bc:SetTime(_)if math.abs(bc:GetTime()-_)<0.25 then timer.Destroy(bo)end end;timer.Create(bo,0.2,0,bp)bp()end)end;function ba:getTime()if self:isValid()&&IsValid(self.chan)then return self.chan:GetTime()end;return 0 end;function ba:getState()if!self:isValid()then return"error"end;if!IsValid(self.chan)then return"loading"end;local bq=self.chan:GetState()if bq==GMOD_CHANNEL_PLAYING then return"playing"end;if bq==GMOD_CHANNEL_PAUSED then return"paused"end;if bq==GMOD_CHANNEL_STALLED then return"buffering"end;if bq==GMOD_CHANNEL_STOPPED then return"paused"end;return end;function ba:play()self:runCommand(function(bc)bc:Play()self:emit("playing")self._commandState="play"end)end;function ba:pause()self:runCommand(function(bc)bc:Pause()self:emit("paused")self._commandState="pause"end)end;function ba:stop()self._stopped=true;self:runCommand(function(bc)bc:Stop()self:emit("ended",{stopped=true})self:emit("destroyed")self:stopStateChecker()end)end;function ba:isValid()return!self._stopped end;local ah=a.load("mediaregistry")local br="ML_MapCleanHack_"..a.INSTANCE;if CLIENT then net.Receive(br,function()for e,aj in pairs(ah.get())do if aj:getBaseService()=="bass"&&aj:isValid()&&IsValid(aj.chan)&&aj.chan:GetState()==GMOD_CHANNEL_STOPPED then aj:reload()end end end)end end;a.FolderItems["services/gdrive.lua"]="local oop = medialib.load(\"oop\")\r\n\r\nlocal GDriveService = oop.class(\"GDriveService\", \"HTMLService\")\r\nGDriveService.identifier = \"GDrive\"\r\n\r\nlocal all_patterns = {\"^https?://drive.google.com/file/d/([^/]*)/edit\"}\r\n\r\nfunction GDriveService:parseUrl(url)\r\n\tfor _,pattern in pairs(all_patterns) do\r\n\t\tlocal id = string.match(url, pattern)\r\n\t\tif id then\r\n\t\t\treturn {id = id}\r\n\t\tend\r\n\tend\r\nend\r\n\r\nfunction GDriveService:isValidUrl(url)\r\n\treturn self:parseUrl(url) ~= nil\r\nend\r\n\r\nlocal function urlencode(str)\r\n   if (str) then\r\n      str = string.gsub (str, \"\\n\", \"\\r\\n\")\r\n      str = string.gsub (str, \"([^%w ])\",\r\n         function (c) return string.format (\"%%%02X\", string.byte(c)) end)\r\n      str = string.gsub (str, \" \", \"+\")\r\n   end\r\n   return str\r\nend\r\n\r\nlocal player_url = \"https://wyozi.github.io/gmod-medialib/mp4.html?id=%s\"\r\nlocal gdrive_stream_url = \"https://drive.google.com/uc?export=download&confirm=yTib&id=%s\"\r\nfunction GDriveService:resolveUrl(url, callback)\r\n\tlocal urlData = self:parseUrl(url)\r\n\tlocal playerUrl = string.format(player_url, urlencode(string.format(gdrive_stream_url, urlData.id)))\r\n\r\n\tcallback(playerUrl, {start = urlData.start})\r\nend\r\n\r\nfunction GDriveService:directQuery(url, callback)\r\n\tcallback(nil, {\r\n\t\ttitle = url:match(\"([^/]+)$\")\r\n\t})\r\nend\r\n\r\nfunction GDriveService:hasReliablePlaybackEvents()\r\n\treturn true\r\nend\r\n\r\nreturn GDriveService"a.FolderItems["services/mp4.lua"]="local oop = medialib.load(\"oop\")\r\n\r\nlocal Mp4Service = oop.class(\"Mp4Service\", \"HTMLService\")\r\nMp4Service.identifier = \"mp4\"\r\n\r\nlocal all_patterns = {\"^https?://.*%.mp4\"}\r\n\r\nfunction Mp4Service:parseUrl(url)\r\n\tfor _,pattern in pairs(all_patterns) do\r\n\t\tlocal id = string.match(url, pattern)\r\n\t\tif id then\r\n\t\t\treturn {id = id}\r\n\t\tend\r\n\tend\r\nend\r\n\r\nfunction Mp4Service:isValidUrl(url)\r\n\treturn self:parseUrl(url) ~= nil\r\nend\r\n\r\nlocal player_url = \"https://wyozi.github.io/gmod-medialib/mp4.html?id=%s\"\r\nfunction Mp4Service:resolveUrl(url, callback)\r\n\tlocal urlData = self:parseUrl(url)\r\n\tlocal playerUrl = string.format(player_url, urlData.id)\r\n\r\n\tcallback(playerUrl, {start = urlData.start})\r\nend\r\n\r\nfunction Mp4Service:directQuery(url, callback)\r\n\tcallback(nil, {\r\n\t\ttitle = url:match(\"([^/]+)$\")\r\n\t})\r\nend\r\n\r\nfunction Mp4Service:hasReliablePlaybackEvents()\r\n\treturn true\r\nend\r\n\r\nreturn Mp4Service"a.FolderItems["services/soundcloud.lua"]="local oop = medialib.load(\"oop\")\r\n\r\nlocal SoundcloudService = oop.class(\"SoundcloudService\", \"HTMLService\")\r\nSoundcloudService.identifier = \"soundcloud\"\r\n\r\nlocal all_patterns = {\r\n\t\"^https?://www.soundcloud.com/([A-Za-z0-9_%-]+/[A-Za-z0-9_%-]+)/?.*$\",\r\n\t\"^https?://soundcloud.com/([A-Za-z0-9_%-]+/[A-Za-z0-9_%-]+)/?.*$\",\r\n}\r\n\r\nfunction SoundcloudService:parseUrl(url)\r\n\tfor _, pattern in pairs(all_patterns) do\r\n\t\tlocal path = string.match(url, pattern)\r\n\t\tif path then\r\n\t\t\treturn {id = path}\r\n\t\tend\r\n\tend\r\nend\r\n\r\nfunction SoundcloudService:isValidUrl(url)\r\n\treturn self:parseUrl(url) ~= nil\r\nend\r\n\r\nlocal player_url = \"https://gmod-api.superiorservers.co/static/gmod-medialib/soundcloud.html?id=\"\r\nfunction SoundcloudService:resolveUrl(url, callback)\r\n\tlocal urlData = self:parseUrl(url)\r\n\tlocal urlEncoded = urlData.id:URLEncode()\r\n\tcallback(player_url .. urlEncoded, {})\r\nend\r\n\r\nfunction SoundcloudService:directQuery(url, callback)\r\n\tlocal urlData = self:parseUrl(url)\r\n\tif not urlData then\r\n\t\treturn callback(\"Invalid URL\")\r\n\tend\r\n\r\n\tlocal url = \"https://soundcloud.com/oembed?format=json&url=https://soundcloud.com/\" .. urlData.id\r\n\r\n\thttp.Fetch(url, function(result, size)\r\n\t\tif size == 0 then\r\n\t\t\treturn\r\n\t\tend\r\n\r\n\t\tlocal entry = util.JSONToTable(result)\r\n\t\tif not entry or not entry.title or not entry.type then\r\n\t\t\treturn\r\n\t\tend\r\n\r\n\t\tlocal response = self:BuildResponse(entry, urlData)\r\n\t\tresponse.raw = entry\r\n\r\n\t\tcallback(nil, response)\r\n\tend, function(err) callback(\"HTTP: \" .. err) end)\r\nend\r\n\r\nfunction SoundcloudService:BuildResponse(item, urlData)\r\n\tlocal id = urlData.id\r\n\r\n\treturn {\r\n\t\tid = id,\r\n\t\ttitle = item.title,\r\n\t\ticon = item.thumbnail_url,\r\n\t\tduration = -1\r\n\t}\r\nend\r\n\r\nreturn SoundcloudService\r\n"a.FolderItems["services/twitch.lua"]="local oop = medialib.load(\"oop\")\r\n\r\nlocal TwitchService = oop.class(\"TwitchService\", \"HTMLService\")\r\nTwitchService.identifier = \"twitch\"\r\n\r\nlocal all_patterns = {\r\n\t\"https?://www.twitch.tv/([A-Za-z0-9_%-]+)\",\r\n\t\"https?://twitch.tv/([A-Za-z0-9_%-]+)\"\r\n}\r\n\r\nfunction TwitchService:parseUrl(url)\r\n\tfor _,pattern in pairs(all_patterns) do\r\n\t\tlocal id = string.match(url, pattern)\r\n\t\tif id then\r\n\t\t\treturn {id = id}\r\n\t\tend\r\n\tend\r\nend\r\n\r\nfunction TwitchService:isValidUrl(url)\r\n\treturn self:parseUrl(url) ~= nil\r\nend\r\n\r\nlocal player_url = \"https://wyozi.github.io/gmod-medialib/twitch.html?channel=%s\"\r\nfunction TwitchService:resolveUrl(url, callback)\r\n\tlocal urlData = self:parseUrl(url)\r\n\tlocal playerUrl = string.format(player_url, urlData.id)\r\n\r\n\tcallback(playerUrl, {start = urlData.start})\r\nend\r\n\r\nlocal function metaQuery(name, callback)\r\n\thttp.Fetch(\"https://gmod-api.superiorservers.co/api/mediaplayer/twitch/\" .. name, function(b)\r\n\t\tlocal obj = util.JSONToTable(b)\r\n\t\tif not obj or not obj.response or not obj.success then\r\n\t\t\tcallback(obj and obj.message or 'Channel not found')\r\n\t\t\tprint(b)\r\n\t\t\treturn\r\n\t\tend\r\n\r\n\t\tcallback(nil, obj.response)\r\n\tend, function()\r\n\t\tcallback(\"failed HTTP request\")\r\n\tend)\r\nend\r\n\r\nfunction TwitchService:directQuery(url, callback)\r\n\tlocal urlData = self:parseUrl(url)\r\n\r\n\tmetaQuery(urlData.id, function(metaErr, meta)\r\n\t\tif metaErr then\r\n\t\t\tcallback(metaErr)\r\n\t\t\treturn\r\n\t\tend\r\n\r\n\t\tlocal data = {}\r\n\t\tdata.id = meta.broadcaster_login\t\r\n\t\tdata.title = meta.title:sub(1, 256)\r\n\t\tdata.icon = meta.icon\r\n\t\tdata.raw = meta\r\n\r\n\t\tcallback(nil, data)\r\n\tend)\r\nend\r\n\r\nreturn TwitchService"a.FolderItems["services/vimeo.lua"]="local oop = medialib.load(\"oop\")\r\n\r\nlocal VimeoService = oop.class(\"VimeoService\", \"HTMLService\")\r\nVimeoService.identifier = \"vimeo\"\r\n\r\nlocal all_patterns = {\r\n\t\"https?://www.vimeo.com/([0-9]+)\",\r\n\t\"https?://vimeo.com/([0-9]+)\",\r\n\t\"https?://www.vimeo.com/channels/staffpicks/([0-9]+)\",\r\n\t\"https?://vimeo.com/channels/staffpicks/([0-9]+)\",\r\n}\r\n\r\nfunction VimeoService:parseUrl(url)\r\n\tfor _,pattern in pairs(all_patterns) do\r\n\t\tlocal id = string.match(url, pattern)\r\n\t\tif id then\r\n\t\t\treturn {id = id}\r\n\t\tend\r\n\tend\r\nend\r\n\r\nfunction VimeoService:isValidUrl(url)\r\n\treturn self:parseUrl(url) ~= nil\r\nend\r\n\r\nlocal player_url = \"http://wyozi.github.io/gmod-medialib/vimeo.html?id=%s\"\r\nfunction VimeoService:resolveUrl(url, callback)\r\n\tlocal urlData = self:parseUrl(url)\r\n\tlocal playerUrl = string.format(player_url, urlData.id)\r\n\r\n\tcallback(playerUrl, {start = urlData.start})\r\nend\r\n\r\nfunction VimeoService:directQuery(url, callback)\r\n\tlocal urlData = self:parseUrl(url)\r\n\tlocal metaurl = string.format(\"http://vimeo.com/api/v2/video/%s.json\", urlData.id)\r\n\r\n\thttp.Fetch(metaurl, function(result, size, _headers, httpcode)\r\n\t\tif size == 0 then\r\n\t\t\tcallback(\"http body size = 0\")\r\n\t\t\treturn\r\n\t\tend\r\n\r\n\t\tif httpcode == 404 then\r\n\t\t\tcallback(\"Invalid id\")\r\n\t\t\treturn\r\n\t\tend\r\n\r\n\t\tlocal data = {}\r\n\t\tdata.id = urlData.id\r\n\r\n\t\tlocal jsontbl = util.JSONToTable(result)\r\n\r\n\t\tif jsontbl then\r\n\t\t\tdata.title = jsontbl[1].title\r\n\t\t\tdata.duration = jsontbl[1].duration\r\n\t\telse\r\n\t\t\tdata.title = \"ERROR\"\r\n\t\tend\r\n\r\n\t\tcallback(nil, data)\r\n\tend, function(err) callback(\"HTTP: \" .. err) end)\r\nend\r\n\r\nfunction VimeoService:hasReliablePlaybackEvents()\r\n\treturn true\r\nend\r\n\r\nreturn VimeoService\r\n"a.FolderItems["services/webaudio.lua"]="local oop = medialib.load(\"oop\")\r\nlocal WebAudioService = oop.class(\"WebAudioService\", \"BASSService\")\r\nWebAudioService.identifier = \"webaudio\"\r\n\r\nlocal all_patterns = {\r\n\t\"^https?://(.*)%.mp3\",\r\n\t\"^https?://(.*)%.ogg\",\r\n}\r\n\r\nfunction WebAudioService:parseUrl(url)\r\n\tfor _,pattern in pairs(all_patterns) do\r\n\t\tlocal id = string.match(url, pattern)\r\n\t\tif id then\r\n\t\t\treturn {id = id}\r\n\t\tend\r\n\tend\r\nend\r\n\r\nfunction WebAudioService:isValidUrl(url)\r\n\treturn self:parseUrl(url) ~= nil\r\nend\r\n\r\nfunction WebAudioService:resolveUrl(url, callback)\r\n\tcallback(url, {})\r\nend\r\n\r\nfunction WebAudioService:directQuery(url, callback)\r\n\tcallback(nil, {\r\n\t\ttitle = url:match(\"([^/]+)$\")\r\n\t})\r\nend\r\n\r\nreturn WebAudioService"a.FolderItems["services/webm.lua"]="local oop = medialib.load(\"oop\")\r\n\r\nlocal WebmService = oop.class(\"WebmService\", \"HTMLService\")\r\nWebmService.identifier = \"webm\"\r\n\r\nlocal all_patterns = {\"^https?://.*%.webm\"}\r\n\r\nfunction WebmService:parseUrl(url)\r\n\tfor _,pattern in pairs(all_patterns) do\r\n\t\tlocal id = string.match(url, pattern)\r\n\t\tif id then\r\n\t\t\treturn {id = id}\r\n\t\tend\r\n\tend\r\nend\r\n\r\nfunction WebmService:isValidUrl(url)\r\n\treturn self:parseUrl(url) ~= nil\r\nend\r\n\r\nlocal player_url = \"http://wyozi.github.io/gmod-medialib/webm.html?id=%s\"\r\nfunction WebmService:resolveUrl(url, callback)\r\n\tlocal urlData = self:parseUrl(url)\r\n\tlocal playerUrl = string.format(player_url, urlData.id)\r\n\r\n\tcallback(playerUrl, {start = urlData.start})\r\nend\r\n\r\nfunction WebmService:directQuery(url, callback)\r\n\tcallback(nil, {\r\n\t\ttitle = url:match(\"([^/]+)$\")\r\n\t})\r\nend\r\n\r\nreturn WebmService"a.FolderItems["services/webradio.lua"]="local oop = medialib.load(\"oop\")\r\nlocal WebRadioService = oop.class(\"WebRadioService\", \"BASSService\")\r\nWebRadioService.identifier = \"webradio\"\r\n\r\nlocal all_patterns = {\r\n\t\"^https?://(.*)%.pls\",\r\n\t\"^https?://(.*)%.m3u\"\r\n}\r\n\r\nfunction WebRadioService:parseUrl(url)\r\n\tfor _,pattern in pairs(all_patterns) do\r\n\t\tlocal id = string.match(url, pattern)\r\n\t\tif id then\r\n\t\t\treturn {id = id}\r\n\t\tend\r\n\tend\r\nend\r\n\r\nfunction WebRadioService:isValidUrl(url)\r\n\treturn self:parseUrl(url) ~= nil\r\nend\r\n\r\nfunction WebRadioService:resolveUrl(url, callback)\r\n\tcallback(url, {})\r\nend\r\n\r\nfunction WebRadioService:directQuery(url, callback)\r\n\tcallback(nil, {\r\n\t\ttitle = url:match(\"([^/]+)$\") -- the filename is the best we can get (unless we parse pls?)\r\n\t})\r\nend\r\n\r\nreturn WebRadioService"a.FolderItems["services/youtube.lua"]="local oop = medialib.load(\"oop\")\r\n\r\nlocal YoutubeService = oop.class(\"YoutubeService\", \"HTMLService\")\r\nYoutubeService.identifier = \"youtube\"\r\n\r\nlocal raw_patterns = {\r\n\t\"^https?://[A-Za-z0-9%.%-]*%.?youtu%.be/([A-Za-z0-9_%-]+)\",\r\n\t\"^https?://[A-Za-z0-9%.%-]*%.?youtube%.com/watch%?.*v=([A-Za-z0-9_%-]+)\",\r\n\t\"^https?://[A-Za-z0-9%.%-]*%.?youtube%.com/v/([A-Za-z0-9_%-]+)\",\r\n\t\"^https?://[A-Za-z0-9%.%-]*%.?youtube%-nocookie%.com/embed/([A-Za-z0-9_%-]+)\"\r\n}\r\n\r\nlocal all_patterns = {}\r\n\r\n-- Appends time modifier patterns to each pattern\r\nfor _, p in pairs(raw_patterns) do\r\n\tlocal function with_sep(sep)\r\n\t\ttable.insert(all_patterns, p .. sep .. \"t=(%d+)m(%d+)s\")\r\n\t\ttable.insert(all_patterns, p .. sep .. \"t=(%d+)s?\")\r\n\tend\r\n\r\n\t-- We probably support more separators than youtube itself, but that does not matter\r\n\twith_sep(\"#\")\r\n\twith_sep(\"&\")\r\n\twith_sep(\"?\")\r\n\r\n\ttable.insert(all_patterns, p)\r\nend\r\n\r\nfunction YoutubeService:parseUrl(url)\r\n\tfor _,pattern in pairs(all_patterns) do\r\n\t\tlocal id, time1, time2 = string.match(url, pattern)\r\n\t\tif id then\r\n\t\t\tlocal time_sec\r\n\t\t\tif time1 and time2 then\r\n\t\t\t\ttime_sec = tonumber(time1)*60 + tonumber(time2)\r\n\t\t\telse\r\n\t\t\t\ttime_sec = tonumber(time1)\r\n\t\t\tend\r\n\r\n\t\t\treturn {\r\n\t\t\t\tid = id,\r\n\t\t\t\tstart = time_sec\r\n\t\t\t}\r\n\t\tend\r\n\tend\r\nend\r\n\r\nfunction YoutubeService:isValidUrl(url)\r\n\treturn self:parseUrl(url) ~= nil\r\nend\r\n\r\nlocal player_url = \"https://gmod-api.superiorservers.co/static/gmod-medialib/youtube.html?id=%s\"\r\nfunction YoutubeService:resolveUrl(url, callback)\r\n\tlocal urlData = self:parseUrl(url)\r\n\tlocal playerUrl = string.format(player_url, urlData.id)\r\n\r\n\tcallback(playerUrl, {start = urlData.start})\r\nend\r\n\r\n-- http://en.wikipedia.org/wiki/ISO_8601#Durations\r\n-- Cheers wiox :))\r\nlocal function PTToSeconds(str)\r\n\tlocal h = str:match(\"(%d+)H\") or 0\r\n\tlocal m = str:match(\"(%d+)M\") or 0\r\n\tlocal s = str:match(\"(%d+)S\") or 0\r\n\treturn h*(60*60) + m*60 + s\r\nend\r\n\r\nlocal DEFAULT_API_KEY = \"AIzaSyBmQHvMSiOTrmBKJ0FFJ2LmNtc4YHyUJaQ\"\r\n\r\nfunction YoutubeService:directQuery(url, callback)\r\n\tlocal apiKey = medialib.YOUTUBE_API_KEY or DEFAULT_API_KEY\r\n\r\n\tlocal urlData = self:parseUrl(url)\r\n\tlocal metaurl = string.format(\r\n\t\t\"https://www.googleapis.com/youtube/v3/videos?part=snippet%%2CcontentDetails&id=%s&key=%s\",\r\n\t\turlData.id, apiKey\r\n\t)\r\n\r\n\thttp.Fetch(metaurl, function(result, size)\r\n\t\tif size == 0 then\r\n\t\t\tcallback(\"http body size = 0\")\r\n\t\t\treturn\r\n\t\tend\r\n\r\n\t\tlocal jsontbl = util.JSONToTable(result)\r\n\t\tif not jsontbl or not jsontbl.items then\r\n\t\t\tcallback(result)\r\n\t\t\treturn\r\n\t\tend\r\n\r\n\t\tlocal item = jsontbl.items[1]\r\n\t\tif not item then\r\n\t\t\tcallback(\"No video id found\")\r\n\t\t\treturn\r\n\t\tend\r\n\r\n\t\tlocal response = self:BuildResponse(item, urlData)\r\n\t\tresponse.raw = jsontbl\r\n\r\n\t\tcallback(nil, response)\r\n\tend, function(err) callback(\"HTTP: \" .. err) end)\r\nend\r\n\r\nfunction YoutubeService:BuildResponse(item, urlData)\r\n\tlocal live = item.snippet.liveBroadcastContent == \"live\"\r\n\tlocal id = urlData.id\r\n\r\n\treturn {\r\n\t\tid = id,\r\n\t\ttitle = item.snippet.title,\r\n\t\tlive = live,\r\n\t\tduration = not live and tonumber(PTToSeconds(item.contentDetails.duration)),\r\n\t\ticon = 'https://img.youtube.com/vi/' .. id .. '/sddefault.jpg',\r\n\t}\r\nend\r\n\r\nfunction YoutubeService:hasReliablePlaybackEvents()\r\n\treturn true\r\nend\r\n\r\nreturn YoutubeService\r\n"a.modulePlaceholder("serviceloader")do a.load("servicebase")a.load("service_html")a.load("service_bass")local ad=a.load("media")for e,file in a.folderIterator("services")do if a.DEBUG then print("[MediaLib] Registering service "..file.name)end;local bs,V=pcall(function()return file:load()end)if bs then ad.registerService(V.identifier,V)else print("[MediaLib] Failed to load service ",file,": ",V)end end end;a.modulePlaceholder("__loader")do a.load("mediabase")a.load("media")a.load("serviceloader")end;return a
--addons/!lpakr_out/lua/entities/nbot_aquad_droid.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='Aqua Droid'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/player/droid/aqua_droid_npc.mdl'ENT.Models={'models/player/droid/aqua_droid.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/nbot_sw_snow_droid_commando.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='Snow Droid Commando'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/tfa/comm/gg/npc_sw_snow_droid_commando.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_snow_droid_commando.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/nbot_sw_training_droid_b1.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/nbot_sw_training_droid_b1.lua:
AddCSLuaFile()ENT.CWRP=true;ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='B1 Training Droid'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/tfa/comm/gg/npc_comb_sw_t_droid_b1.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_t_droid_b1.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/nbot_sw_training_droid_commando.lua:
AddCSLuaFile()ENT.CWRP=true;ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='Commando Training Droid'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/tfa/comm/gg/npc_sw_t_droid_commando.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_t_droid_commando.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_baneback_spider.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Bane Back Spider"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/jfo/npcs/banebackspider.mdl"}ENT.Skins={0}ENT.ModelScale=1;ENT.CollisionBounds=Vector(72,72,100)ENT.BloodColor=BLOOD_COLOR_GREEN;ENT.RagdollOnDeath=false;ENT.SpawnHealth=400;ENT.HealthRegen=0;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;ENT.OnSpawnSounds={""}ENT.OnIdleSounds={"Zombie.FootstepLeft","Zombie.FootstepRight"}ENT.IdleSoundDelay=0.2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={}ENT.OnDownedSounds={}ENT.Footsteps={}ENT.Omniscient=false;ENT.SpotDuration=10;ENT.RangeAttackRange=300;ENT.MeleeAttackRange=50;ENT.ReachEnemyRange=250;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.Frightening=false;ENT.AllyDamageTolerance=0.33;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.33;ENT.Acceleration=800;ENT.Deceleration=800;ENT.JumpHeight=50;ENT.StepHeight=10;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;ENT.WalkAnimation=ACT_WALK;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_WALK;ENT.RunAnimRate=1.5;ENT.IdleAnimation=ACT_IDLE;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_JUMP;ENT.JumpAnimRate=1;ENT.UseWalkframes=false;ENT.WalkSpeed=100;ENT.RunSpeed=150;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=80;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(0,0,0)ENT.EyeBone="Head"ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.UseWeapons=false;ENT.Weapons={}ENT.WeaponAccuracy=1;ENT.WeaponAttachment=""ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=true;ENT.PossessionEnabled=true;ENT.PossessionCrosshair=true;ENT.PossessionViews={{offset=Vector(-200,0,150),distance=0},{offset=Vector(45,0,0),distance=-325,eyepos=true}}ENT.PossessionBinds={}game.AddParticles("particles/antlion_blood.pcf")PrecacheParticleSystem("AntlionGib")PrecacheParticleSystem("AntlionGibTrails")if SERVER then else function ENT:CustomInitialize()end;function ENT:CustomThink()end;function ENT:CustomDraw()end end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_bull_rancor.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="[TFU] Bull Rancor"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/tfu/bull_rancor.mdl"}ENT.Skins={0}ENT.ModelScale=2;ENT.CollisionBounds=Vector(140,140,140)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=1800;ENT.HealthRegen=30;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;ENT.OnSpawnSounds={}ENT.OnIdleSounds={"fallenlogic/rancor/breath_loop.wav"}ENT.IdleSoundDelay=2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={"fallenlogic/rancor/death1.mp3"}ENT.OnDownedSounds={}ENT.Footsteps={}ENT.Omniscient=false;ENT.SpotDuration=30;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=80;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.Frightening=true;ENT.AllyDamageTolerance=0.1;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.1;ENT.Acceleration=1000;ENT.Deceleration=1000;ENT.JumpHeight=50;ENT.StepHeight=20;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;ENT.WalkAnimation=ACT_WALK;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_WALK;ENT.RunAnimRate=1.1;ENT.IdleAnimation=ACT_IDLE;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_JUMP;ENT.JumpAnimRate=1;ENT.UseWalkframes=false;ENT.WalkSpeed=100;ENT.RunSpeed=200;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=60;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(0,0,0)ENT.EyeBone="R_Eyelid"ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.UseWeapons=false;ENT.Weapons={}ENT.WeaponAccuracy=1;ENT.WeaponAttachment=""ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=false;ENT.PossessionEnabled=false;ENT.PossessionPrompt=true;ENT.PossessionCrosshair=false;ENT.PossessionMovement=POSSESSION_MOVE_1DIR;ENT.PossessionViews={}ENT.PossessionBinds={}if SERVER then else function ENT:CustomInitialize()end;function ENT:CustomThink()end;function ENT:CustomDraw()end;function ENT:OnChaseEnemy()end end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_jka_rancor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_mecharancor.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Cybernetic Rancor"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/rancor_mecharancor_a01.mdl"}ENT.Skins={0}ENT.ModelScale=190;ENT.CollisionBounds=Vector(0.8,1,1)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=500;ENT.HealthRegen=0;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;ENT.OnSpawnSounds={}ENT.OnIdleSounds={}ENT.IdleSoundDelay=2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={"fallenlogic/rancor/death1.mp3"}ENT.OnDownedSounds={}ENT.Footsteps={}ENT.Omniscient=false;ENT.SpotDuration=30;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=50;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.Frightening=false;ENT.AllyDamageTolerance=0.33;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.33;ENT.Acceleration=800;ENT.Deceleration=800;ENT.JumpHeight=50;ENT.StepHeight=20;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;ENT.WalkAnimation=ACT_WALK;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_RUN;ENT.RunAnimRate=1;ENT.IdleAnimation=ACT_IDLE;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_JUMP;ENT.JumpAnimRate=1;ENT.UseWalkframes=false;ENT.WalkSpeed=45;ENT.RunSpeed=70;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=60;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(0,0,0)ENT.EyeBone="Head"ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.UseWeapons=false;ENT.Weapons={}ENT.WeaponAccuracy=1;ENT.WeaponAttachment=""ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=false;ENT.PossessionEnabled=false;ENT.PossessionPrompt=true;ENT.PossessionCrosshair=false;ENT.PossessionMovement=POSSESSION_MOVE_1DIR;ENT.PossessionViews={}ENT.PossessionBinds={}if SERVER then else function ENT:CustomInitialize()end;function ENT:CustomThink()end;function ENT:CustomDraw()end end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_reek.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Reek"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/bull_reek_a01.mdl"}ENT.ModelScale=1;ENT.BloodColor=BLOOD_COLOR_RED;ENT.CollisionBounds=Vector(45,45,45)ENT.OnDamageSounds={}ENT.OnDeathSounds={"fallenlogic/reek/reek_spawn.mp3"}ENT.OnSpawnSounds={"fallenlogic/reek/reek_spawn.mp3"}ENT.SpawnHealth=1500;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=30;ENT.ReachEnemyRange=40;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.UseWalkframes=false;ENT.WalkAnimation=ACT_WALK;ENT.RunAnimation=ACT_RUN;ENT.IdleAnimation=ACT_IDLE;ENT.WalkSpeed=40;ENT.RunSpeed=120;ENT.EyeBone="EyelidTop"AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_tridroid.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_wampa.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_zombie.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_zombie.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.PrintName="Zombie"ENT.Category='GM Hostile Nextbots'ENT.Models={"models/Zombie/Classic.mdl"}ENT.BloodColor=BLOOD_COLOR_GREEN;ENT.OnDamageSounds={"Zombie.Pain"}ENT.OnDeathSounds={"Zombie.Die"}ENT.SpawnHealth=100;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=30;ENT.ReachEnemyRange=30;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ZOMBIES}ENT.UseWalkframes=true;ENT.RunAnimation=ACT_WALK;ENT.EyeBone="ValveBiped.Bip01_Spine4"ENT.EyeOffset=Vector(7.5,0,5)ENT.PossessionEnabled=true;ENT.PossessionMovement=POSSESSION_MOVE_8DIR;ENT.PossessionViews={{offset=Vector(0,30,20),distance=100},{offset=Vector(7.5,0,0),distance=0,eyepos=true}}ENT.PossessionBinds={[IN_ATTACK]={{coroutine=true,onkeydown=function(self)self:EmitSound("Zombie.Attack")self:PlayActivityAndMove(ACT_MELEE_ATTACK1,1,self.PossessionFaceForward)end}}}AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/pfx1_0f.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx2_00.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx2_01.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Sparkle 2"ENT.Category="PPE: Other"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[2]sparkle2"
--addons/!lpakr_out/lua/entities/pfx2_02_s.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx2_03.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Ground Acid"ENT.Category="PPE: Other"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[2]acid_ground"
--addons/!lpakr_out/lua/entities/pfx2_04.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_00_s.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_01.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_02_s.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Smaller Red Jet"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_r_s"
--addons/!lpakr_out/lua/entities/pfx4_05~.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_07.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_07.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="BFG Projectile"ENT.Category="PPE: Weapons"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]bfg_*proj"
--addons/!lpakr_out/lua/entities/pfx5_00_alt_ss.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx5_00_ss.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Micro Black Hole"ENT.Category="PPE: Cosmic"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[5]black_hole_mmicro"
--addons/!lpakr_out/lua/entities/pfx8_01.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Red Vortex"ENT.Category="PPE: Magic"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[8]red_vortex"
--addons/!lpakr_out/lua/entities/pfx8_07.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/proj_drg_flashbang.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_artilleryshell/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_artilleryshell_dioxis.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_aura_armour.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_bomb_base/cl_init.lua:
include'shared.lua'function ENT:Initialize()self.Initialized=true;self.SoundHumming=self:StartLoopingSound('Hackbomb.humming')end;function ENT:PlayerUse()srp.hacking.OpenInjectionMenu(self)end;function ENT:Think()if!self.Initialized then self:Initialize()self.Think=function()end end end;function ENT:ExplodeWarningDraw()local a=DynamicLight(self:EntIndex())a.Pos=self:LocalToWorld(self.LightPos)a.r=200;a.g=25;a.b=25;a.Brightness=5;a.Size=math.abs(math.sin(CurTime()*2)*20)a.Decay=1;a.DieTime=CurTime()+.2 end;function ENT:ExplodeWarning()self.LightSize=50;self.LightDynamic=true;self.DrawEffects=self.ExplodeWarningDraw;self.WarningLoopSound=self:StartLoopingSound('Hackbomb.Sound')end;function ENT:DrawEffects()local a=DynamicLight(self:EntIndex(),!self.LightDynamic)if a then local b=self.ModeInfo[self:GetMode()]||self.ModeInfo[3]local c=b.color;a.Pos=self:LocalToWorld(self.LightPos)a.r=c.r;a.g=c.g;a.b=c.b;a.Brightness=5+math.cos(RealTime()/1*b.speed)*6;a.Size=self.LightSize;a.Decay=1;a.DieTime=CurTime()+.2 end end;function ENT:OnRemove()if self.WarningLoopSound then self:StopLoopingSound(self.WarningLoopSound)end;if self.SoundHumming then self:StopLoopingSound(self.SoundHumming)end end;ENT.UIPosition=Vector(0,0,50)function ENT:DrawName(d)local e=self:GetDisplayName()if e==''then return end;local f=(d:WorldSpaceCenter()-self:WorldSpaceCenter()):Angle()f.p=0;f.r=90;f.y=f.y+90;cam.Start3D2D(self:LocalToWorld(self.UIPosition),f,.025)draw.DrawText(e,'ui_header.xxl',0,0,col.white,TEXT_ALIGN_CENTER)cam.End3D2D()end;function ENT:Draw()self:DrawModel()self:DrawEffects()self:DrawName(LocalPlayer())end;net('rp_bomb.PreExplosion',function()local g=net.ReadEntity()local h=net.ReadString()if IsValid(g)&&g[h]then g[h](g)end end)
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bomb_big.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bomb_big.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='rp_bomb_base'ENT.PrintName='Big Bomb'ENT.Category='SUP Hackables'ENT.Spawnable=true;ENT.Models={Model('models/props/swtorbombmedium.mdl'),Model('models/props_phx/mk-82.mdl'),Model('models/props_phx/torpedo.mdl')}ENT.Damage=5000;ENT.DamageRadius=3000;ENT.GameCount={4,6}ENT.GameDifficulty={'normal','hard','hardcore'}ENT.ExplosionTimer=2
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bubbleshield/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_busstation.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_collectable/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_floatingcandycane/shared.lua:
ENT.PrintName='Ghost Orb'ENT.Author='Scott'ENT.Contact='STEAM_0:1:2665200'ENT.Purpose='Floating candy canes'ENT.Instructions=''ENT.Type='anim'ENT.Base='base_anim'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.DoNotDuplicate=true;ENT.DontFreeze=true;ENT.Paths={{Speed=35,Height=5,Nodes={Vector(8450.558594,-2416.220947,560.031250),Vector(8445.937500,-783.378601,560.031250),Vector(7931.189453,-2421.164063,560.031250),Vector(7930.321777,-783.897461,560.031250),Vector(7438.770996,-2415.021240,560.031250),Vector(6930.454102,-2412.843018,560.031250),Vector(7417.473633,-790.885864,560.031250),Vector(6507.758789,-2417.607422,560.031250),Vector(6498.732422,-782.711853,560.031250),Vector(6884.222656,-785.270508,560.031250),Vector(7422.284668,-2423.225586,560.031250),Vector(7922.392090,-2415.583984,560.031250),Vector(7929.134277,-794.903870,560.031250),Vector(8439.054688,-783.946167,560.031250),Vector(8683.995117,-1594.725098,523.031189),Vector(8450.558594,-2416.220947,560.031250),Vector(8450.558594,-2416.220947,560.031250)}},{Speed=150,Height=80,Nodes={Vector(1817.040283,772.459595,1248.910400),Vector(1392.391602,787.754578,1222.696045),Vector(1020.586426,978.001709,1153.943237),Vector(855.013062,1437.153320,1026.359009),Vector(1095.949219,1755.124390,956.639160),Vector(1479.746216,1871.116211,946.713013),Vector(2007.195679,2121.226807,909.581909),Vector(2381.833008,2156.635254,920.044434),Vector(2437.633057,1604.123535,1066.053833),Vector(2016.640625,939.006104,1216.239258)}},{Speed=100,Height=80,Nodes={Vector(5765.641113,233.657959,-239.968765),Vector(5779.355469,331.744171,-239.968735),Vector(5741.265625,424.738251,-239.968750),Vector(5768.128906,537.850098,-239.968765),Vector(5869.309082,585.161499,-239.968750),Vector(5912.270996,478.148376,-239.968750),Vector(5869.711914,372.237640,-239.968765),Vector(5796.663086,291.580170,-239.968750),Vector(5745.035156,219.888489,-239.968750),Vector(5735.880859,129.374878,-239.968735),Vector(5736.792969,62.850082,-239.968750),Vector(5746.932129,9.124756,-239.968750),Vector(5752.681152,-69.886818,-239.968750),Vector(5762.522949,-176.292084,-239.968735),Vector(5782.792480,-286.425537,-239.968750),Vector(5825.440430,-460.139923,-239.968750),Vector(5950.866699,-548.338806,-239.968750),Vector(6022.085449,-543.760071,-239.968765),Vector(6201.611816,-418.860840,-239.968765),Vector(6230.558105,-284.842743,-239.968750),Vector(6127.749023,-213.268707,-239.968735),Vector(6040.683105,-195.840332,-239.968750),Vector(5989.080566,-132.216309,-239.968765),Vector(6061.856934,-68.474480,-239.968750),Vector(6145.262695,-46.194260,-239.968750),Vector(6146.920410,8.510185,-239.968750),Vector(6126.640137,115.045441,-239.968750),Vector(6126.312012,188.011047,-239.968750),Vector(6231.647461,239.562012,-239.968750),Vector(6335.907227,275.200562,-239.968750),Vector(6257.077637,309.110046,-239.968735),Vector(6131.862793,254.587097,-239.968750),Vector(6074.358887,173.310272,-239.968750),Vector(6020.907715,115.958466,-239.968735),Vector(6010.695801,171.260284,-239.968750),Vector(6062.359375,235.722412,-239.968750),Vector(6124.729492,321.842896,-239.968750),Vector(6174.680664,403.229004,-239.968750),Vector(6233.787109,516.062012,-239.968750),Vector(6242.430176,634.885986,-239.968750),Vector(6132.313477,534.724304,-239.968750),Vector(6067.402832,452.175415,-239.968750),Vector(6003.774902,401.785797,-239.968750),Vector(5946.209473,419.992676,-239.968750),Vector(5930.121582,487.587830,-239.968750),Vector(5896.385254,590.261536,-239.968750),Vector(5850.865234,732.083496,-239.968750),Vector(5827.703613,845.254761,-239.968750),Vector(5791.061035,848.327820,-239.968750),Vector(5768.807129,786.690674,-239.968750),Vector(5779.914063,692.198364,-239.968750),Vector(5805.616699,542.619690,-239.968750),Vector(5799.812012,445.297058,-239.968750),Vector(5787.814941,372.526489,-239.968750),Vector(5763.751953,283.762177,-239.968750)}},{Speed=100,Height=80,Nodes={Vector(5824.693848,-1213.831665,-239.968750),Vector(5762.332520,-1221.840210,-239.968750),Vector(5691.408691,-1216.211426,-239.968750),Vector(5688.255859,-1120.429443,-239.968750),Vector(5757.148438,-1067.707886,-239.968750),Vector(5800.181641,-986.945190,-239.968750),Vector(5764.321777,-903.758789,-239.968750),Vector(5716.482422,-847.221375,-239.968750),Vector(5724.338867,-752.401062,-239.968750),Vector(5792.104980,-723.240479,-239.968750),Vector(5860.714355,-700.582458,-239.968750),Vector(5889.728027,-628.300659,-239.968750),Vector(5861.961914,-566.176636,-239.968750),Vector(5887.681152,-436.363251,-239.968735),Vector(5982.045410,-368.336853,-239.968750),Vector(6089.233398,-366.288086,-239.968735),Vector(6086.483398,-429.771667,-239.968750),Vector(5961.298340,-590.237915,-239.968750),Vector(5856.982422,-709.617676,-239.968750),Vector(5805.736816,-805.985840,-239.968750),Vector(5810.214844,-894.526428,-239.968765),Vector(5806.812500,-977.597107,-239.968750),Vector(5759.238281,-1067.317871,-239.968750)}},{Speed=100,Height=80,Nodes={Vector(5363.772461,-143.807281,-239.968750),Vector(5504.593262,-141.678772,-239.968750),Vector(5608.290527,-112.035500,-239.968750),Vector(5560.526367,-16.953133,-226.565796),Vector(5414.479980,28.236263,-199.182190),Vector(5170.865234,-41.302158,-153.504669),Vector(4983.257813,30.630524,-118.328339),Vector(4732.279785,-23.811625,-95.968750),Vector(3989.325195,-26.340141,24.566853),Vector(3727.286377,-9.005908,32.031250),Vector(3591.498291,-105.192398,32.031250),Vector(3580.392578,-353.492004,32.031250),Vector(3562.814697,-756.089233,32.031250),Vector(3503.208008,-1169.064575,32.031250),Vector(3241.986816,-1478.629395,32.031250),Vector(2311.895752,-1107.227295,32.031250),Vector(1636.902344,-1193.313843,32.031250),Vector(940.763672,-1152.608032,32.031250),Vector(1192.942993,1246.655029,32.031219),Vector(2587.743164,1279.463867,32.031250),Vector(3142.521240,959.968689,74.893341),Vector(3585.924805,574.964600,32.031250),Vector(3610.100342,54.058998,32.031258),Vector(3969.250977,6.227271,28.581734),Vector(4311.828125,7.517088,-39.933731),Vector(4783.128418,7.773572,-95.968750),Vector(5311.534668,122.080750,-239.968750),Vector(5649.557617,100.436302,-239.968735),Vector(5716.021973,-33.232353,-239.968750)}},{Speed=100,Height=80,Nodes={Vector(-499.909576,-467.662872,32.031250),Vector(-672.933472,-649.308899,32.031250),Vector(-956.951172,-620.104126,32.031250),Vector(-1118.620361,-463.016052,32.031250),Vector(-1685.427246,-308.619263,32.031250),Vector(-1870.468506,-622.843079,32.031250),Vector(-2170.593262,-435.939972,32.031250),Vector(-2645.349854,-401.786560,32.031250),Vector(-2953.255127,-537.606873,36.031250),Vector(-3291.599609,-665.233582,32.031250),Vector(-3597.321289,-634.923340,32.031250),Vector(-4306.875488,-501.499756,32.031235),Vector(-4684.609863,-266.200623,32.031250),Vector(-4833.515625,44.682892,32.031235),Vector(-4663.383301,362.141693,32.031235),Vector(-4399.848145,641.062744,32.031250),Vector(-4056.129150,529.022583,36.031265),Vector(-3837.858887,290.612213,32.031250),Vector(-3586.329590,342.752899,32.031235),Vector(-3260.605225,400.713043,32.031265),Vector(-2914.509277,416.231964,32.031250),Vector(-2541.591309,392.019318,32.031250),Vector(-1918.604248,400.038422,32.031235),Vector(-1225.736328,357.758514,32.031235),Vector(-2008.752808,-94.644440,32.031265),Vector(-2891.796631,-157.818649,32.031250),Vector(-3267.783691,-20.226898,32.031250),Vector(-3606.907959,138.278595,32.031250),Vector(-3973.916992,166.893402,32.031250),Vector(-4232.481934,43.024719,32.031235),Vector(-4318.443359,-244.140579,32.031250),Vector(-4061.063721,-292.227051,32.031250),Vector(-3769.445068,-287.457581,32.031250),Vector(-3363.605469,-325.834991,32.031250),Vector(-2722.053711,-345.264252,32.031250),Vector(-1598.258545,-272.064545,32.031250),Vector(-819.018677,-143.035629,32.031250),Vector(-128.116699,-247.228409,32.031250),Vector(-80.680756,-841.367249,32.031250),Vector(-388.258118,-966.369568,32.031250)}},{Speed=100,Height=80,Nodes={Vector(-499.909576,-467.662872,32.031250),Vector(-672.933472,-649.308899,32.031250),Vector(-956.951172,-620.104126,32.031250),Vector(-1118.620361,-463.016052,32.031250),Vector(-1685.427246,-308.619263,32.031250),Vector(-1870.468506,-622.843079,32.031250),Vector(-2170.593262,-435.939972,32.031250),Vector(-2645.349854,-401.786560,32.031250),Vector(-2953.255127,-537.606873,36.031250),Vector(-3291.599609,-665.233582,32.031250),Vector(-3597.321289,-634.923340,32.031250),Vector(-4306.875488,-501.499756,32.031235),Vector(-4684.609863,-266.200623,32.031250),Vector(-4833.515625,44.682892,32.031235),Vector(-4663.383301,362.141693,32.031235),Vector(-4399.848145,641.062744,32.031250),Vector(-4056.129150,529.022583,36.031265),Vector(-3837.858887,290.612213,32.031250),Vector(-3586.329590,342.752899,32.031235),Vector(-3260.605225,400.713043,32.031265),Vector(-2914.509277,416.231964,32.031250),Vector(-2541.591309,392.019318,32.031250),Vector(-1918.604248,400.038422,32.031235),Vector(-1225.736328,357.758514,32.031235),Vector(-2008.752808,-94.644440,32.031265),Vector(-2891.796631,-157.818649,32.031250),Vector(-3267.783691,-20.226898,32.031250),Vector(-3606.907959,138.278595,32.031250),Vector(-3973.916992,166.893402,32.031250),Vector(-4232.481934,43.024719,32.031235),Vector(-4318.443359,-244.140579,32.031250),Vector(-4061.063721,-292.227051,32.031250),Vector(-3769.445068,-287.457581,32.031250),Vector(-3363.605469,-325.834991,32.031250),Vector(-2722.053711,-345.264252,32.031250),Vector(-1598.258545,-272.064545,32.031250),Vector(-819.018677,-143.035629,32.031250),Vector(-128.116699,-247.228409,32.031250),Vector(-80.680756,-841.367249,32.031250),Vector(-388.258118,-966.369568,32.031250),Vector(-7035.845703,653.832031,-175.968750),Vector(-7040.843750,394.390991,-201.912079),Vector(-7045.195313,197.683838,-230.013123),Vector(-7025.889160,-188.390808,-231.340729),Vector(-7017.495605,-703.968872,-175.502213),Vector(-7071.646484,-503.305359,-186.352600),Vector(-7076.683105,-142.458191,-237.902161),Vector(-7075.593262,230.169922,-225.372498),Vector(-7084.202148,400.286255,-201.070236),Vector(-7074.703613,525.813721,-183.137665),Vector(-7073.942871,628.062561,-175.968750)}},{Speed=100,Height=80,Nodes={Vector(-3744.623291,1425.587891,-303.968750),Vector(-3679.811523,1340.885864,-303.968750),Vector(-3616.791504,1290.564087,-303.968750),Vector(-3522.769775,1325.600830,-303.968750),Vector(-3385.554443,1402.270386,-303.968750),Vector(-3200.548096,1371.244751,-303.968750),Vector(-3037.108154,1302.130249,-303.968750),Vector(-2703.681641,1379.883423,-303.968750),Vector(-2458.058350,1350.537476,-303.968750),Vector(-2272.834961,1413.110718,-318.994415),Vector(-2192.274658,1366.201294,-331.714447),Vector(-2140.984863,1302.120239,-339.812836),Vector(-2033.629150,1289.202148,-356.763733),Vector(-1914.251343,1352.770874,-375.612854),Vector(-1755.874878,1406.139282,-400.619659),Vector(-1463.117676,1353.198975,-446.844482),Vector(-1178.889404,1363.086426,-491.722626),Vector(-1039.109863,1321.762939,-495.968750),Vector(-738.699829,1400.592896,-495.968750),Vector(-615.508240,1363.391479,-495.968750),Vector(-459.178589,1313.246582,-495.968750),Vector(-38.852905,1327.263794,-495.968750),Vector(-69.354477,1387.236450,-495.968750),Vector(-170.030441,1398.136108,-495.968750),Vector(-218.927246,1362.704224,-495.968750),Vector(-241.598190,1286.091431,-495.968750),Vector(-231.783051,1102.103149,-495.968750),Vector(-211.572205,634.311340,-495.968750),Vector(-217.816956,-138.523193,-495.968750),Vector(-192.042175,-702.393677,-495.968750),Vector(-250.290863,-1108.170776,-495.968750),Vector(-257.405731,-1359.186523,-495.968750),Vector(-10.296463,-1337.874268,-495.968750),Vector(215.970520,-1321.584717,-495.968750),Vector(406.032776,-1319.053833,-495.968750),Vector(756.966675,-1311.094849,-516.382568),Vector(1037.848877,-1328.850098,-539.789429),Vector(1458.928223,-1339.218750,-574.879333),Vector(1889.649170,-1345.538086,-610.772705),Vector(2307.746582,-1343.078247,-645.614197),Vector(2940.302246,-1336.310547,-698.327148),Vector(4027.499756,-1345.577271,-751.968750),Vector(4034.448730,-1182.524048,-751.968750),Vector(4039.172852,-445.751617,-751.968750),Vector(4025.090088,36.957535,-751.968750),Vector(4029.119385,747.685120,-751.968750),Vector(4036.122803,1338.295166,-751.968750),Vector(3872.964355,1334.090820,-751.968750),Vector(3453.152588,1325.926758,-741.064697),Vector(3159.828613,1321.688477,-716.621033),Vector(2693.353027,1324.756348,-677.748047),Vector(2325.438232,1305.952026,-647.088501),Vector(1549.538696,1341.946655,-582.430176),Vector(1029.183105,1344.541016,-539.067261),Vector(801.324219,1345.038330,-520.078979),Vector(502.063232,1346.512939,-495.968750),Vector(-12.103516,1335.958984,-495.968750),Vector(-242.268234,1340.781494,-495.968750)}},{Speed=100,Height=80,Nodes={Vector(6679.042480,635.890015,4192.031250),Vector(6660.869141,601.867798,4192.031250),Vector(6678.126953,570.885498,4192.031250),Vector(6703.949219,572.865845,4192.031250),Vector(6722.387695,603.268555,4192.031250),Vector(6711.096191,635.303833,4192.031250)}},{Speed=100,Height=80,Nodes={Vector(6048.307129,-263.810913,4448.031250),Vector(6227.460449,-297.828094,4448.031250),Vector(6384.967285,-285.960083,4464.031250),Vector(6586.364258,-264.634644,4488.031250),Vector(6930.896484,-250.674881,4488.031250),Vector(6915.629395,-484.326355,4488.031250),Vector(6526.069336,-555.680786,4488.031250),Vector(6348.859863,-465.104553,4464.031250),Vector(6182.185059,-426.794495,4448.031250),Vector(6036.534668,-403.391663,4448.031250)}},{Speed=100,Height=80,Nodes={Vector(6048.307129,-263.810913,4448.031250),Vector(6227.460449,-297.828094,4448.031250),Vector(6384.967285,-285.960083,4464.031250),Vector(6586.364258,-264.634644,4488.031250),Vector(6930.896484,-250.674881,4488.031250),Vector(6915.629395,-484.326355,4488.031250),Vector(6526.069336,-555.680786,4488.031250),Vector(6348.859863,-465.104553,4464.031250),Vector(6182.185059,-426.794495,4448.031250),Vector(6036.534668,-403.391663,4448.031250),Vector(2880.377197,-868.400452,1281.062744),Vector(2595.993164,-978.888489,1237.545898),Vector(2339.680420,-1088.394897,1195.754395),Vector(2043.616577,-1040.023438,1192.765869),Vector(2004.171387,-842.263000,1241.913086),Vector(2272.766846,-664.736450,1301.963623),Vector(2647.040527,-664.595581,1321.614258),Vector(2952.953125,-823.057983,1296.608643),Vector(2989.123779,-909.557861,1276.103271)}},{Speed=80,Height=80,Nodes={Vector(3386.437988,-903.968750,43.333008),Vector(3084.125488,-919.968750,-16.797714),Vector(2704.984131,-903.968750,42.963432),Vector(2527.241699,-919.968750,-11.566673),Vector(2307.180176,-919.968750,-26.304626),Vector(2201.747070,-903.968750,47.130569),Vector(1977.451050,-903.968750,40.480927),Vector(1683.658936,-919.968750,-45.177246),Vector(1559.549072,-903.968750,40.988434),Vector(1095.087280,-919.968750,-10.838913),Vector(858.925903,-903.968750,40.973083),Vector(616.031250,-570.648376,-24.175995),Vector(616.031250,-12.323303,-5.897064),Vector(616.031250,522.337769,-15.975861),Vector(592.031250,879.440796,35.905334),Vector(814.528809,919.968872,-53.942474),Vector(1200.003174,919.968750,-28.592926),Vector(1589.785889,919.968872,-83.584351),Vector(1854.206787,919.968750,-52.502167),Vector(2310.793457,919.968750,20.427155),Vector(2574.585449,919.968750,-60.630798),Vector(2970.873047,919.968872,-98.754822),Vector(3215.668945,919.968628,-16.799103),Vector(3479.968750,747.133789,-45.773010),Vector(3479.968750,462.353271,-190.524628),Vector(2668.557129,83.471802,-441.378540),Vector(1789.533447,77.836731,-373.575073),Vector(1145.964478,272.153564,-323.933472),Vector(857.832153,-206.170044,-301.708252),Vector(1081.712280,-643.995483,-318.977295),Vector(1489.620605,-666.835022,-350.441223),Vector(2036.423828,-480.949707,-392.618958),Vector(2401.464600,281.484863,-420.776428),Vector(3000.471191,427.838745,-466.980774),Vector(2996.851563,-81.387329,-466.701538),Vector(3479.968750,-294.942078,-414.504822),Vector(3479.968750,-518.356323,-289.775116),Vector(3479.968750,-733.810730,-19.108612)}}}PrecacheParticleSystem('combineball')
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_medical.lua:
AddCSLuaFile()ENT.Base="rp_funcmodule"ENT.Type="anim"ENT.Spawnable=info.Dev;ENT.Category='SUP'ENT.PrintName="Bacta Tanks"ENT.DisplayName="Bacta Tanks\nControls"ENT.MaxHealth=8000;ENT.Model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/props/vendor/vendor_guild_bank.mdl'ENT.UIPosition=Vector(-14,0,90)ENT.UIAngle=Angle(0,90,90)ENT.UIScale=.04;ENT.Activated=true;ENT.InteractionRange=200;ENT.CanDisable=false;function ENT:OnStartup()self:CheckSpawnTimers()end;function ENT:OnShutdown()self:CheckSpawnTimers()end;function ENT:OnSystemFailure()self:CheckSpawnTimers()end;function ENT:CheckSpawnTimers()if!self:GetActivated()then srp.funcmodules.DisplayWarning('medical')hook.Add('OnPlayerReviveDeath',self,self.SetupRespawns)else srp.funcmodules.RemoveWarning('medical')hook.Remove('OnPlayerReviveDeath',self)end end;function ENT:SetupRespawns(a,b,c)if a:GetAllegianceID()=="REPUBLIC"then return false,(c||5)+15 end end;function ENT:OnRemove()hook.Remove('OnPlayerReviveDeath',self)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_funcmodule_turret.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/rp_grenade_health.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/rp_grenade_impact.lua:
AddCSLuaFile()ENT.Base='rp_grenade'ENT.PrintName='Impact Grenade'ENT.Spawnable=false;ENT.WorldModel='models/weapons/w_eq_flashbang.mdl'ENT.Impact=true;ENT.ExplosionTime=5;ENT.FreezeMotion=false;ENT.WorldMaterial='models/weapons/v_models/grenades/virus_grenade'ENT.ViewMaterial='models/weapons/v_models/grenades/virus_grenade'ENT.Impact=true;ENT.Range=200;ENT.Damage=150;ENT.TrailColor=Color(255,113,70,50)function ENT:Explode()return 0 end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_incubator.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_npc/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_npc_ent/shared.lua:
ENT.Type='anim'ENT.Base='base_anim'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.AutomaticFrameAdvance=false;ENT.Spawnable=info.Dev;ENT.DoNotDuplicate=true;function ENT:SetupDataTables()self:NetworkVar('Int',0,'NPCID')self:NetworkVar('String',0,'AnimationString')self:NetworkVarNotify('NPCID',self.OnDataReceived)end;function ENT:OnDataReceived(a,a,b)local c=srp.npc.data[b]self.data=c end;function ENT:GetData()return self.data||{}end;function ENT:GetDialogue()return self.DialogueID end;function ENT:Think()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_pallet/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_picture/menu_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_pocketrocket/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_questitem/shared.lua:
ENT.PrintName='Quest Item'ENT.Author='Scott'ENT.Contact='STEAM_0:1:26675200'ENT.Type='anim'ENT.Base='base_anim'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Spawnable=info.Dev;ENT.DoNotDuplicate=true;ENT.DontFreeze=true;ENT.Interactive=true;ENT.InteractionName='Inspect'ENT.LastUsedTimeout=120;ENT.InteractionRange=400;ENT.InteractionColor=col.pink;ENT.ShouldHideOnUse=false;ENT.HideDuration=5;ENT.Model=Model'models/hunter/blocks/cube05x05x05.mdl'scripted_ents.Register({},'rp_quest_spore')
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_redlightbot/shared.lua:
ENT.PrintName='Red Light Droid'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Spawnable=info.Dev||false;ENT.AdminOnly=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Category='SUP Development'ENT.Type='anim'ENT.Base='base_anim'ENT.Model=Model'models/blu/vulturedroid.mdl'ENT.DoNotDuplicate=true;ENT.DontSit=true;function ENT:SetupDataTables()self:NetworkVar('Bool',0,'TargetMode')end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_roominfo.lua:
AddCSLuaFile()local a;local b,c=365,500;local d=Color(0,0,0,180)local e=Color(50,50,170,255)local f=Material'sup/gui/loading'ENT.Type='anim'ENT.Base='base_srp'ENT.Category='SUP'ENT.PrintName='Room Info'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Spawnable=true;ENT.Model=Model'models/lt_c/holo_wall_unit.mdl'ENT.ClaimableBoard=true;ENT.DoNotDuplicate=true;ENT.NetworkPlayerUse=true;ENT.RequiredPermission='broadcast'ENT.UIPosition=Vector(-25,0,90)ENT.UIAngle=Angle(0,0,90)ENT.UIScale=.15;function ENT:GetTypes()return{{Name='UNCLAIMED',Color=col.grey_dark},{Name='TRYOUTS',Recruiting=true},{Name='TRAINING'},{Name='JEDI TRIALS',Color=col.green},{Name='PvE SIM',Color=col.orange},{Name='PvP',Color=col.red},{Name='PvP FFA',Color=col.red_dark},{Name='PvP TEAMS',Color=col.red_light},{Name='PvPvE',Color=col.orange},{Name='GM CLAIMED'},{Name='CLAIMED'},{Name='OOC'}}end;function ENT:SetupDataTables()self:NetworkVar('Entity',0,'ClaimedPlayer')self:NetworkVar('Int',0,'InfoType')self:NetworkVar('String',0,'Description')end;function ENT:Initialize()self:SetModel(self.Model)self:SetBodygroup(1,1)self:SetInfoType(1)self.Types=self.GetTypes()self._Initialized=true end;if CLIENT then function ENT:Think()if!self._Initialized then self:Initialize()else self.Think=function()end end end end;function ENT:ClientPlayerUse()if!IsValid(a)then srp.ui.Create('srp_claimableroom',function(g)g:Populate(self)a=g end)end end;function ENT:SetRoomInfo(h,i,j)if!self.Types[i]then return end;j=string.sub(j||'',0,800)self:SetInfoType(i)self:SetDescription(j)self:SetClaimedPlayer(h)hook.Run('OnPlayerClaimedRoom',self,h,self.Types[i],j)end;function ENT:CanUse(h)local k=h:GetGroupRank()return k&&k:HasPermission(self.RequiredPermission)||h:IsTrialGamemaster()end;function ENT:Draw()self:DrawModel()local h=self:GetClaimedPlayer()local l=IsValid(h)&&h:Nick()||nil;local i=!l&&1||self:GetInfoType()||1;local m=self.Types[i]if!m then return end;local j=self:GetDescription()||''if!self.descwrapped||j!=self.desclast then self.desclast=j;local n=string.Wrap(j,'ui_header.s',310)||{}self.descwrapped=table.Splice(n,15,#n-15)end;local o=i<3&&IsValid(h)&&h:GetGroup()local p=o&&o.color||e;local q=m.Name||self.PrintName;local r=o&&o.id;if r then q=r..' '..q end;cam.Start3D2D(self:LocalToWorld(self.UIPosition),self:LocalToWorldAngles(self.UIAngle),self.UIScale)draw.Box(0,0,365,500,d)draw.Box(0,0,365,i==1&&500||70,m.Color||p)draw.DrawText(q,'ui_header.xl',180,i==1&&200||0,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)if i>1&&l then if i>1 then for s=1,#self.descwrapped do draw.DrawText(self.descwrapped[s],'ui_header.s',25,55+s*25,col.white)end end;draw.DrawText('Last claimed by '..l,'ui_header.s',b*.5,c-35,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;cam.End3D2D()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_rtsdrone/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_scrapmachine/shared.lua:
ENT.PrintName='Scrap Machine'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Spawnable=info.Dev;ENT.AdminOnly=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Category='SUP'ENT.Type='anim'ENT.Base='base_srp'ENT.Model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/items/harvesting/slicing/slicing_computer_small_1.mdl'ENT.UIAngle=Angle(0,-90,87)ENT.UIOffset=Vector(-0.2,5,20)ENT.Scrapper=true;ENT.DoNotDuplicate=true;ENT.NetworkPlayerUse=true;ENT.EngineStart=Sound'ambient/machines/spinup.wav'ENT.EngineStop=Sound'ambient/machines/spindown.wav'ENT.EngineLoop='Scrapper.Running'sound.Add({name='Scrapper.Running',sound='ambient/machines/spin_loop.wav',volume=.7,level=60})function ENT:SetupDataTables()self:NetworkVar('Bool',0,'Running')self:NetworkVar('Entity',0,'Crafter')self:NetworkVar('String',0,'Item')self:NetworkVar('Int',0,'ItemCount')self:NetworkVarNotify('Item',self.OnItemChanged)end;function ENT:OnItemChanged(a,b,c)if!CLIENT then return end;if c==''then self.Item=nil else self.Item=srp.items.Get(c)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_storage/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/sup_areatrigger/cl_init.lua:
include'shared.lua'local a=Color(0,0,0,25)local b=Color(222,0,0,25)local c=Vector(0,0,2)local d=color_white;local e=color_black;ENT.UIOffset=Vector(0,0,50)function ENT:Initialize()self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)end;function ENT:Draw()if hook.Call('CanSeeAreaToolBoxes',nil,self)!=true then return end;local f,g=self:GetMin(),self:GetMax()if!f||!g then return end;local h=self:GetPos()local i=self:GetAngles()render.SetColorMaterial()if self:GetSphere()then local j=self:GetSphereSize()||50;render.DrawSphere(h,j,12,12,a)render.DrawWireframeSphere(h,j,12,12,b,true)else render.DrawBox(h,i,f,g,a,true)render.DrawWireframeBox(h,i,f,g,b,true)end;self:DrawInfoGraph(LocalPlayer(),h,self.UIOffset)end;function ENT:DrawInfoGraph(k,h,c)local l=(h-k:GetPos()):Angle()l.p=0;l.y=l.y+-90;l.r=l.r+90;local m=self:GetDisplayName()||''local n=self:GetActionID()||''cam.Start3D2D(h+c,l,.15)draw.DrawText(m,'ui.24',0,0,d,TEXT_ALIGN_CENTER)draw.DrawText(n,'ui.20',0,25,d,TEXT_ALIGN_CENTER)cam.End3D2D()end
--addons/!lpakr_out/lua/entities/sup_areatrigger/shared.lua:
ENT.Type='anim'ENT.Base='base_anim'ENT.PrintName='SUP Area Trigger'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Editable=false;ENT.Spawnable=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.IsAreaTrigger=true;ENT.DoNotDuplicate=false;function ENT:SetupDataTables()self:NetworkVar('Bool',0,'Sphere')self:NetworkVar('Int',0,'SphereSize')self:NetworkVar('Vector',0,'Min')self:NetworkVar('Vector',1,'Max')self:NetworkVar('String',0,'DisplayName')self:NetworkVar('String',1,'ActionID')self:NetworkVar('Entity',0,'GMOwner')end;function ENT:UpdateTransmitState()return TRANSMIT_ALWAYS end
--addons/!lpakr_out/lua/entities/sup_placedmine.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/sup_placedmine.lua:
AddCSLuaFile()ENT.Type='anim'DEFINE_BASECLASS'base_anim'ENT.PrintName='Land Mine'ENT.Author='Scott'ENT.Contact='Scott (STEAM_0:1:26675200)'ENT.Purpose='Base Mine Entity'ENT.Instructions='There are none.'ENT.Model=Model'models/milrp/weapons/antitank/w_mine.mdl'ENT.Category='Superior Servers'ENT.SteppedOn=Sound'weapons/slam/mine_mode.wav'ENT.PlacedSounds={Sound'player/footsteps/gravel1.wav',Sound'player/footsteps/gravel2.wav',Sound'player/footsteps/gravel2.wav'}function ENT:Initialize()self:SetModel(self.Model)end;function ENT:SetupDataTables()self:NetworkVar('String',0,'AllegianceID')end;function ENT:StartTouch(a)if!(a:IsPlayer()||a:IsVehicle())then return end;self.armedby=a;self:EmitSound(self.SteppedOn)end;function ENT:EndTouch(a)if!(a:IsPlayer()||a:IsVehicle())then return end;self:Explode(a)self:Remove()end;function ENT:Use(b)if!IsValid(b)||!b:IsPlayer()||self.hidden==true then return end;srp.interaction.Start(b,'Hiding',col.blue,5,60,function(c,b,d)if IsValid(self)&&d then self:Hide()end end)end;function ENT:Hide()self.hidden=true;local e=self:GetPos()local f=self:GetUp()self:SetPos(e-f*3)local g=EffectData()g:SetStart(e)g:SetOrigin(e+f*2)g:SetNormal(f)g:SetScale(20)g:SetMagnitude(10)util.Effect('ThumperDust',g,true,true)self:EmitSound(self.PlacedSounds[math.random(1,#self.PlacedSounds)])end;function ENT:Explode(a)self:ApplyExplosion(self:GetPropOwner()||self,self,self:GetPos(),self:GetUp(),500,{Radius=200,Scale=20,Magnitude=500})if IsValid(self.armedby)then if self.armedby:IsPlayer()then self.armedby:SetVelocity(Vector(math.random(-100,100),math.random(-100,100),math.random(500,1500)))if self.armedby:Alive()then self.armedby:Kill()end elseif self.armedby:IsVehicle()then self.armedby:ExplodeVehicle()end end end;function ENT:EODInteract(b)if self.removing||b==self.armedby then return end;self.removing=true;srp.interaction.Start(b,'Disabling',col.red,10,50,function(c,b,d)if!IsValid(self)then return end;self.removing=false;if d then self:Remove()else self:Explode(dmg)end end)end;function ENT:OnReceivedDamage(dmg)if self.damaged then return end;if dmg:GetDamageType()==DMG_BLAST then self.damaged=true;self:Explode(dmg:GetAttacker())end end;ENT.ThreatMaterial=Material'materials/galactic/ui/blast.png'function ENT:Draw()self:DrawModel()if self:GetAllegianceID()!=LocalPlayer():GetAllegianceID()then return end;local e=self:GetPos()+Vector(0,0,20)local h=(LocalPlayer():GetPos()-self:GetPos()):Angle()h:RotateAroundAxis(h:Up(),90)h:RotateAroundAxis(h:Forward(),90)cam.Start3D2D(e,h,0.1)surface.SetDrawColor(col.red)surface.SetMaterial(self.ThreatMaterial)surface.DrawTexturedRect(-128,-128,256,256)cam.End3D2D()end
--addons/!lpakr_out/lua/entities/sup_usetrigger/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/wos_lightning_coil/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/anzati_proton/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/anzati_swtor9/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=1;if!f then return end;for h=0,d/g do local i=b+c*(d-h*g)local j=f:Add("wos/lightsabers/effects/anzati/swtor9",i)if j then j:SetLifeTime(0)j:SetDieTime(0.2)j:SetGravity(Vector(0,0,math.random(32,128)))j:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(math.random(100,200))j:SetEndAlpha(0)j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/gamemodes/srp_base/entities/effects/balloon_pop.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/cwbase_laser.lua:
TRACER_FLAG_USEATTACHMENT=0x0002;SOUND_FROM_WORLD=0;CHAN_STATIC=6;EFFECT.Speed=20000;EFFECT.Length=50;EFFECT.UseModel=false;local a=Vector()local b=Material'effects/sw_laser_blue_main'local c=Material'effects/sw_laser_blue_front'function EFFECT:GetTracerOrigin(d)local e=d:GetStart()local f=d:GetEntity()if!IsValid(f)||f:IsDormant()then return a end;local g=f:GetOwner()if!IsValid(g)||g:IsDormant()then return a end;if bit.band(d:GetFlags(),TRACER_FLAG_USEATTACHMENT)==TRACER_FLAG_USEATTACHMENT then local h=LocalPlayer()if f:IsWeapon()&&(f.IsCarriedByLocalPlayer&&f:IsCarriedByLocalPlayer())&&!h:ShouldDrawLocalPlayer()&&MuzzlePosition then self.LocalPlayer=true;local i=f.Akimbo&&(f.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition;return i+f:GetForward()*1 else local j=f.Akimbo&&(f.AkimboLeftFire&&1||2)||d:GetAttachment()local k=f:GetAttachment(j)||{Pos=f:GetPos()}if k then return k.Pos else return e end end end;self.DeleteMe=true;return e end;function EFFECT:Init(d)self.StartPos=self:GetTracerOrigin(d)self.EndPos=d:GetOrigin()self.MinimalMode=cvar.GetValue('srp_minimal')if!self.StartPos||self.StartPos==a then self.DeleteMe=true;return end;local l=self.EndPos-self.StartPos;self.Normal=l:GetNormal()self.StartTime=0;self.LifeTime=(l:Length()+self.Length)/self.Speed end;function EFFECT:Think()if!self.StartPos||!self.LifeTime||!self.StartTime then return false end;self.LifeTime=self.LifeTime-FrameTime()self.StartTime=self.StartTime+FrameTime()if self.DeleteMe||self.LifeTime<=0&&IsValid(bolt)then bolt:Remove()end;return!(self.DeleteMe||self.LifeTime<0)end;function EFFECT:Render()if!self.StartPos||!self.Speed||!self.StartTime then self.DeleteMe=true;return end;local m=math.max(0,self.Speed*self.StartTime)local n=math.max(0,m-self.Length)local o=self.StartPos+self.Normal*n;local p=self.StartPos+self.Normal*m;render.SetMaterial(c)render.DrawSprite(p,15,15,col.white)render.SetMaterial(b)render.DrawBeam(o,p,15,0,1,col.white)if srp.nvg.IsEnabled()then return end;if!self.MinimalMode then self.dlight=DynamicLight(self:EntIndex())if self.dlight then self.dlight.pos=p;self.dlight.r=0;self.dlight.g=0;self.dlight.b=255;self.dlight.brightness=2;self.dlight.Decay=2000;self.dlight.Size=700;self.dlight.DieTime=CurTime()+1 end end end
--addons/!lpakr_out/lua/effects/dronesrewrite_explosionbig.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/dronesrewrite_flame.lua:
function EFFECT:Init(a)local b=a:GetStart()local c=a:GetOrigin()if!b then return end;self.Emitter=ParticleEmitter(b)for d=1,20 do local e=self.Emitter:Add("particles/firebom21",b)e:SetDieTime(1.8)e:SetStartAlpha(math.random(170,200))e:SetEndAlpha(0)e:SetStartSize(2)e:SetEndSize(math.random(55,75))e:SetRoll(math.random(-10,10))e:SetRollDelta(math.random(-15,15))e:SetVelocity((c-b):GetNormal()*math.random(500,800)+VectorRand()*math.random(1,20))e:SetCollide(true)end;for d=1,2 do local e=self.Emitter:Add("particle/smokesprites_000"..math.random(1,9),b)e:SetDieTime(2)e:SetStartAlpha(255)e:SetEndAlpha(0)e:SetStartSize(math.Rand(2,4))e:SetEndSize(math.random(70,90))e:SetRoll(math.random(-10,10))e:SetRollDelta(math.random(-10,10))e:SetVelocity((c-b):GetNormal()*math.random(500,800)+VectorRand()*math.random(1,30)+Vector(0,0,20))e:SetCollide(true)e:SetColor(40,40,40)end;self.Emitter:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/gamemodes/srp_base/entities/effects/effect_valentine.lua:
return lpakr()()
--addons/ssrp_lfs/lua/effects/lvs_explosion.lua:
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

	self.DieTime = CurTime() + 1

	self:Explosion( Pos, 2 )

	local ply = LocalPlayer():GetViewEntity()
	if IsValid( ply ) then
		local delay = (Pos - ply:GetPos()):Length() / 13503.9
		timer.Simple( delay, function()
			sound.Play( "LVS.DYNAMIC_EXPLOSION", Pos )
		end )
	else
		sound.Play( "LVS.DYNAMIC_EXPLOSION", Pos )
	end
	
	for i = 1, 20 do
		timer.Simple(math.Rand(0,0.01) * i, function()
			if IsValid( self ) then
				local p = Pos + VectorRand() * 10 * i
				
				self:Explosion( p, math.Rand(0.5,0.8) )
			end
		end)
	end

	self:Debris( Pos )
end

function EFFECT:Debris( pos )
	local emitter = ParticleEmitter( pos, false )

	if not IsValid( emitter ) then return end

	for i = 0,60 do
		local particle = emitter:Add( "effects/fleck_tile"..math.random(1,2), pos )
		local vel = VectorRand() * math.Rand(200,600)
		vel.z = math.Rand(200,600)
		if particle then
			particle:SetVelocity( vel )
			particle:SetDieTime( math.Rand(10,15) )
			particle:SetAirResistance( 10 ) 
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 5 )
			particle:SetEndSize( 5 )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 0,0,0 )
			particle:SetGravity( Vector( 0, 0, -600 ) )
			particle:SetCollide( true )
			particle:SetBounce( 0.3 )
		end
	end
	
	emitter:Finish()
end

function EFFECT:Explosion( pos , scale )
	local emitter = ParticleEmitter( pos, false )
	
	if not IsValid( emitter ) then return end

	for i = 0,10 do
		local particle = emitter:Add( Materials[ math.random(1, #Materials ) ], pos )

		if particle then
			particle:SetVelocity( VectorRand() * 1500 * scale )
			particle:SetDieTime( math.Rand(0.75,1.5) * scale )
			particle:SetAirResistance( math.Rand(200,600) ) 
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( math.Rand(60,120) * scale )
			particle:SetEndSize( math.Rand(220,320) * scale )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 40,40,40 )
			particle:SetGravity( Vector( 0, 0, 100 ) )
			particle:SetCollide( false )
		end
	end

	for i = 0, 40 do
		local particle = emitter:Add( "particles/flamelet"..math.random(1,5), pos )

		if particle then
			particle:SetVelocity( VectorRand() * 1500 * scale )
			particle:SetDieTime( 0.2 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 20 * scale )
			particle:SetEndSize( math.Rand(180,240) * scale )
			particle:SetEndAlpha( 100 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetColor( 200,150,150 )
			particle:SetCollide( false )
		end
	end

	emitter:Finish()

	local dlight = DynamicLight( math.random(0,9999) )
	if dlight then
		dlight.pos = pos
		dlight.r = 255
		dlight.g = 180
		dlight.b = 100
		dlight.brightness = 8
		dlight.Decay = 2000
		dlight.Size = 300
		dlight.DieTime = CurTime() + 1
	end
end

function EFFECT:Think()
	if CurTime() < self.DieTime then return true end

	return false
end

function EFFECT:Render()
end

--addons/ssrp_lfs/lua/effects/lvs_laat_right_projector.lua:
EFFECT.Mat = Material( "effects/lvs/ballturret_projectorbeam" )
EFFECT.HitMat = Material( "sprites/light_glow02_add" )

local green = Color(0,255,0,255)
local white = Color(255, 255, 255, 255)

function EFFECT:Init( data )
	self.Entity = data:GetEntity()

	if IsValid( self.Entity ) then
		self.ID = self.Entity:LookupAttachment( "muzzle_ballturret_right" )

		if self.ID then
			local Muzzle = self.Entity:GetAttachment( self.ID )

			self:SetRenderBoundsWS( self.Entity:GetPos(), Muzzle.Ang:Up() * 50000 )
		end
	end
end

function EFFECT:Think()
	if not IsValid( self.Entity ) or not self.ID or not self.Entity:GetBTRFire() then
		return false
	end

	return true
end


function EFFECT:Render()
	if not self.ID or not IsValid( self.Entity ) then return end

	local Muzzle = self.Entity:GetAttachment( self.ID )

	local Dir = Muzzle.Ang:Up()
	local StartPos = Muzzle.Pos + Dir * 14
	local Trace = util.TraceLine( { start = StartPos, endpos = StartPos + Dir * 50000, filter = self } )
	local EndPos = Trace.HitPos

	self:SetRenderBoundsWS( StartPos, EndPos )

	render.SetMaterial( self.Mat )
	render.DrawBeam( StartPos, EndPos, 14 + math.random(0,4), 1, 0, green )
	render.DrawBeam( StartPos, EndPos, 3 + math.random(0,4), 1, 0, white )

	render.SetMaterial( self.HitMat )
	local A = 150 + math.random(0,20)
	local B = 70 + math.random(0,20)
	render.DrawSprite( StartPos, A, A, green )
	render.DrawSprite( StartPos, B, B, white )

	render.DrawSprite( EndPos, A, A, green )
	render.DrawSprite( EndPos + VectorRand() * 10, B, B, white )

	if math.random(0,5) == 1 then
		local emitter = ParticleEmitter( EndPos, false )
		local dir = (self.Entity:GetPos() - EndPos):GetNormalized()

		for i = 0, 10 do
			local particle = emitter:Add( "sprites/rico1", EndPos )

			local vel = VectorRand()  * 100 + dir * 40

			if not particle then continue end

			particle:SetVelocity( vel )
			particle:SetAngles( vel:Angle() + Angle(0,90,0) )
			particle:SetDieTime( math.Rand(0.1,0.3) * 0.5 )
			particle:SetStartAlpha( math.Rand( 200, 255 ) )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( math.Rand(1,30) )
			particle:SetEndSize( 0 )
			particle:SetRoll( math.Rand(-100,100) )
			particle:SetRollDelta( math.Rand(-100,100) )

			particle:SetAirResistance( 0 )
		end

		emitter:Finish()
	end
end

--addons/ssrp_lfs/lua/effects/lvs_laser_blue_long.lua:
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

	local len = 2500 * bullet:GetLength()

	render.SetMaterial( self.MatSprite )
	render.DrawBeam( endpos - dir * len * 2, endpos + dir * len * 2, 200, 1, 0, blue )

	render.SetMaterial( self.MatBeam )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 45, 1, 0, blue )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 15, 1, 0, white )
end

--addons/ssrp_lfs/lua/effects/lvs_proton_trail.lua:
EFFECT.Offset = Vector(-8,0,0)

local GlowMat = Material( "effects/select_ring" )

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

		local particle = emitter:Add( "particles/flamelet"..math.random(1,5), pos )
		if particle then
			particle:SetVelocity( -self.Entity:GetForward() * math.Rand(250,800) + self.Entity:GetVelocity())
			particle:SetDieTime( 1 )
			particle:SetAirResistance( 0 ) 
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 8 )
			particle:SetEndSize( 1 )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 0,0,255 )
			particle:SetGravity( Vector( 0, 0, 600 ) )
			particle:SetCollide( false )
		end
		
		local particle = emitter:Add( "particles/flamelet"..math.random(1,5), self.Entity:GetPos() )
		if particle then
			particle:SetVelocity( -self.Entity:GetForward() * 200 + VectorRand() * 50 )
			particle:SetDieTime( 1 )
			particle:SetAirResistance( 600 ) 
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 6 )
			particle:SetEndSize( 2 )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 0,0,255 )
			particle:SetGravity( Vector( 0, 0, 600 ) )
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

	render.DrawSprite( pos, 100, 100, Color( 0, 127, 255, 50 ) )
end

--addons/!lpakr_out/lua/effects/nrg_tracer_drr.lua:
AddCSLuaFile()AddCSLuaFile("effects/fxbase.lua")include("effects/fxbase.lua")EFFECT.Speed=6500;EFFECT.Length=64;function EFFECT:Think()util.ParticleTracerEx("nrg_tracer_drr",self.StartPos,self.EndPos,self.Parent:EntIndex(),1,-1)end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/rb655_force_repulse_in.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=ParticleEmitter(b)if!c then return end;local d=c:Add("effects/rb655_splash_warpring1",b)if d then d:SetLifeTime(0)d:SetDieTime(0.5)d:SetGravity(Vector(0,0,0))d:SetVelocity(Vector(0,0,0))d:SetStartSize(100)d:SetEndSize(0)d:SetStartAlpha(0)d:SetEndAlpha(200)d:SetColor(255,255,255)end;c:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/sup_laser_yellow_washed.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/screengrab/init_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/voice_vis/init_cl.lua:
return lpakr()()