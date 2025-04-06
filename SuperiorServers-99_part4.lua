--Stealed clientside server code by exechack.cc
--Hostname: !💠⇛SuperiorServers.co - CWRP - UPDATED MAP & CONTENT! - Part 4/12 - 06/04/2025


--PATH addons/gpakr_out/lua/dash/preload/gpakr.lua:
local a={}local b=SERVER&&'addons/gpakr_out/data/'||'download/data/'file.CreateDir('sup/gpakr/cw')local c={r=255,g=0,b=0,a=255}local d={r=0,g=255,b=0,a=255}local e={r=255,g=255,b=255,a=255}local f={r=150,g=200,b=175,a=255}local function g(...)MsgC(d,'[gPakr] ',e,unpack{...})MsgN()end;local function h(...)g(c,'[ERROR] ',e,...)end;local function i(j,k)local l=10^(k||2)return math.floor(j*l+0.5)/l end;g'Init'local m={}local n,o=file.Find('gpakr/*.lua','LUA')for o,p in ipairs(n)do local q=include('gpakr/'..p)a[#a+1]=q;m[q.File..'.dat']=true end;if SERVER then local r=1;local s=r*60;local t=s*60;local u=t*24;local v=u*7;local w=u*365.2425/12;local x=u*365.2425;local function y(z,A)return A==1&&z||z..'s'end;local function B(j,C)local D={}while!C||C!=0 do local E=C||0;if j>=x||E<=-7 then local F=math.floor(j/x)D[#D+1]=F..' '..y('year',F)j=j-x*F elseif j>=w||E<=-6 then local F=math.floor(j/w)D[#D+1]=F..' '..y('month',F)j=j-w*F elseif j>=v||E<=-5 then local F=math.floor(j/v)D[#D+1]=F..' '..y('week',F)j=j-v*F elseif j>=u||E<=-4 then local F=math.floor(j/u)D[#D+1]=F..' '..y('day',F)j=j-u*F elseif j>=t||E<=-3 then local F=math.floor(j/t)D[#D+1]=F..' '..y('hour',F)j=j-t*F elseif j>=s||E<=-2 then local F=math.floor(j/s)D[#D+1]=F..' '..y('minute',F)j=j-s*F elseif j>=r||E<=-1 then local F=math.floor(j/r)D[#D+1]=F..' '..y('second',F)j=j-r*F else break end;if C then if C>0 then C=C-1 else C=C+1 end end end;local G=''for H=1,#D do if H==1 then G=G..D[H]elseif H==#D then G=G..' and '..D[H]else G=G..', '..D[H]end end;return G end;g('Last compiled ',f,B(os.time(os.date('!*t'))-1649168946),e,' ago on ',f,'05 April 2022 14:29:06 UTC')end;local I,o=file.Find('sup/gpakr/cw'..'/*.dat','DATA')for J,K in ipairs(I)do if!m['sup/gpakr/cw'..'/'..K]then g('Pruning old datapack: ',f,K)file.Delete('sup/gpakr/cw'..'/'..K)end end;local L=0;local M=0;local N=0;local function O(P,Q)local R=SysTime()local S=file.Open(b..Q.File,'rb','GAME')if!S then h('Unable to open datapack: ',f,Q.FileName,e)return false end;local T=S:Size()L=L+T;local U=S:Read(T)S:Close()if!U then h('Unable to read datapack: ',f,Q.FileName,e)return false end;local V=util.Decompress(U)U=nil;collectgarbage()if!V then h('Unable to decompress datapack: ',f,Q.FileName,e)return false end;local W=file.Open(P,'wb','DATA')if!W then h('Unable to open outfile for datapack: ',f,Q.FileName,e)return false end;M=M+V:len()W:Write(V)W:Close()V=nil;collectgarbage()local X=SysTime()-R;N=N+X;g('Cached datapack: ',f,Q.FileName,e,' in ',f,i(X,4),e,' seconds')return true end;local Y=0;local function Z(Q)local P=Q.File..'.dat'local _=file.Exists(P,'DATA')if!_&&!file.Exists(b..Q.File,'GAME')then h('Missing datapack: ',f,Q.FileName)return 0 end;if!_&&!O(P,Q)then return 0 end;local R=SysTime()local a0,a=game.MountGMA('data/'..P)if!a0 then g('Failing to mount datapack: ',f,Q.FileName)return 0 end;Y=Y+#a;local X=SysTime()-R;g('Mounted datapack: ',f,Q.FileName,e,' in ',f,i(X,4),e,' seconds')return X end;for J,K in ipairs(a)do if!K.ShouldLoad then g('Ignored datapack: ',f,K.FileName)continue end;if SERVER then resource.AddSingleFile('data/'..K.File)end;N=N+Z(K)end;if L>0 then g('Decompressed ',f,i(L/1048576)..'MB')end;if M>0 then g('Cached ',f,i(M/1048576)..'MB')end;g('Loaded ',f,Y,e,' files')g('Finished in ',f,i(N,4),e,' seconds')
--addons/gpakr_out/lua/gpakr/battalion2-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/battalion2-1052324687.bsp',FileName='battalion2',CRC='1052324687',Len=95639256,ShouldLoad=true}
--addons/gpakr_out/lua/gpakr/weapons-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/weapons-2818896064.bsp',FileName='weapons',CRC='2818896064',Len=128565099,ShouldLoad=true}
--addons/!lpakr_out/lua/dash/libraries/usermessage.lua:
if SERVER then else usermessage={}local a={}net.Receive('umsg.ChatPrint',function()chat.AddText(net.ReadString())end)net.Receive('umsg.ConsolePrint',function()MsgC(Color(255,255,255),net.ReadString()..'\n')end)net.Receive('umsg.SendLua',function()RunString(net.ReadString())end)net.Receive('umsg.UnPooled',function(b,...)usermessage.IncomingMessage(net.ReadString())end)function usermessage.Hook(c,d,...)a[c]={}a[c].Function=function()d(usermessage,unpack(a[c].PreArgs))end;a[c].PreArgs={...}net.Receive('umsg.'..c,function(b)usermessage.IncomingMessage(c)end)end;function usermessage.GetTable()return a end;function usermessage.IncomingMessage(c)if a[c]then a[c].Function()else Msg('Warning: Unhandled usermessage \''..c..'\'\n')end end;function usermessage:ReadAngle()return net.ReadAngle()end;function usermessage:ReadBool()return net.ReadBool()end;function usermessage:ReadChar()return net.ReadInt(8)end;function usermessage:ReadEntity()return net.ReadEntity()end;function usermessage:ReadFloat()return net.ReadFloat()end;function usermessage:ReadLong()return net.ReadInt(32)end;function usermessage:ReadShort()return net.ReadInt(16)end;function usermessage:ReadString()return net.ReadString()end;function usermessage:ReadVector()return net.ReadVector()end;function usermessage:ReadVectorNormal()local e=net.ReadVector()e:Normalize()return e end;function usermessage:Reset()ErrorNoHalt('usermessage:Reset() is not supported!')end end
--addons/!lpakr_out/lua/dash/extensions/player.lua:
PLAYER=FindMetaTable'Player'ENTITY=FindMetaTable'Entity'function PLAYER:Timer(a,b,c,d,e)a=self:SteamID64()..'-'..a;timer.Create(a,b,c,function()if IsValid(self)then d(self)else if e then e()end;timer.Remove(a)end end)end;function PLAYER:TimerExists(a)return timer.Exists(self:SteamID64()..'-'..a)end;function PLAYER:TimerAdjust(a,b,c,d,e)a=self:SteamID64()..'-'..a;timer.Adjust(a,b,c,d&&function()if IsValid(self)then d(self)else if e then e()end;timer.Remove(a)end end||nil)end;function PLAYER:DestroyTimer(a)timer.Remove(self:SteamID64()..'-'..a)end;function player.Find(f)f=tostring(f)for g,h in player.Iterator()do if f==h:SteamID()||f==h:SteamID64()||string.find(string.lower(h:Name()),string.lower(f),1,true)!=nil then return h end end end;function player.GetStaff()return table.Filter(player.GetAll(),PLAYER.IsAdmin)end;if CLIENT then return end;local i={}local j=ENTITY.SetPos;function PLAYER:SetPos(k)i[self]=k end;hook.Add('FinishMove','SetPos.FinishMove',function(l)if i[l]then j(l,i[l])i[l]=nil;return true end end)
--addons/!lpakr_out/lua/dash/extensions/client/draw.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/extensions/client/string.lua:
return lpakr()()
--addons/!lpakr_out/lua/areatrigger/init_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/panel.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/core/util/http/http_cl.lua:
ba.http=ba.http||{Queue={Get={},Post={}},Endpoint='https://gmod-api.superiorservers.co/api/'}net('ba.http.Authenticated',function()ba.http.Headers={SteamID64=LocalPlayer():SteamID64()}for a,b in ipairs(ba.http.Queue.Get)do ba.http.Fetch(b.path,b.onSuccess,b.onFailure)end;for a,b in ipairs(ba.http.Queue.Post)do ba.http.Post(b.path,b.params,b.onSuccess,b.onFailure)end;ba.http.Queue=nil end)local HTTP=HTTP;function ba.http.Fetch(path,c,d,e)if!ba.http.Headers&&!e then table.insert(ba.http.Queue.Get,{path=path,onSuccess=c,onFailure=d})return end;HTTP{url=path:StartsWith('http')&&path||ba.http.Endpoint..path,method='get',headers=ba.http.Headers,success=function(f,g,h)if f==401 then if d then d('Unauthorized')end elseif c then c(g,g:len(),h,f)end end,failed=function(i)if d then d(i)end end}end;function ba.http.Post(j,k,c,d,e)if!ba.http.Headers&&!e then table.insert(ba.http.Queue.Post,{path=path,params=k,onSuccess=c,onFailure=d})return end;HTTP{url=path:StartsWith('http')&&path||ba.http.Endpoint..path,method='post',parameters=k,headers=ba.http.Headers,success=function(f,g,h)if f==401 then if d then d('Unauthorized')end elseif c then c(g,g:len(),h,f)end end,failed=function(i)if d then d(i)end end}end;function ba.http.FetchJson(path,c,d,e)ba.http.Fetch(path,function(g,l,h,f)local m=util.JSONToTable(g)if m&&m.success!=false then c(m.response||m,l,h,f)else d(m&&m.success&&m.message||'Invald Json')end end,d,e)end;http._Fetch=http._Fetch||http.Fetch;function http.Fetch(j,c,d,h)if j:StartsWith(ba.http.Endpoint)then ba.http.Fetch(j,c,d)else http._Fetch(j,c,d,h)end end;http._Post=http._Post||http.Post;function http.Post(j,n,c,d,h)if j:StartsWith(ba.http.Endpoint)then ba.http.Post(j,n,c,d)else http._Post(j,n,c,d,h)end end
--addons/!lpakr_out/lua/badmin/core/ranks/groups_sh.lua:
ba.ranks=ba.ranks||{}ba.ranks.Stored=ba.ranks.Stored||{}local a={}a.__index=a;function ba.ranks.Create(b,c)local d={Name=b:lower():gsub(' ',''),NiceName=b,ID=c,Immunity=0,Flags={},Global=false,VIP=false,Admin=false,SA=false,GA=false,Root=false}setmetatable(d,a)ba.ranks.Stored[d.ID]=d;ba.ranks.Stored[d.Name]=d;ba.ranks.Stored[d.NiceName]=d;return d end;function ba.ranks.GetTable()return ba.ranks.Stored end;function ba.ranks.Get(e)return ba.ranks.Stored[isstring(e)&&e:lower()||e]end;function ba.ranks.CanTarget(f,g)if!isplayer(f)||f:IsRoot()||f:IsSuperAdmin()&&!g:IsRoot()then return true end;return f:GetImmunity()>g:GetImmunity()end;function a:SetAuthRequired(h)self.RequiresAuth=h;return self end;function a:SetImmunity(i)self.Immunity=i;return self end;function a:SetGlobal(h)self.Global=h;return self end;function a:SetFlags(j)for k=1,#j do self.Flags[j[k]]=true;self.Flags[k]=j[k]end;return self end;function a:SetVIP(h)self.VIP=h;return self end;function a:SetAdmin(h)if h==true then self:SetVIP(h)self:SetAuthRequired(h)end;self.Admin=h;return self end;function a:SetDA(h)if h==true then self:SetAdmin(h)end;self.DA=h;return self end;function a:SetSA(h)if h==true then self:SetDA(h)end;self.SA=h;return self end;function a:SetGA(h)if h==true then self:SetSA(h)end;self.GA=h;return self end;function a:SetRoot(h)if h==true then self:SetGlobal(h)self:SetGA(h)end;self.Root=h;return self end;function a:GetAuthRequired()return self.RequiresAuth==true end;function a:GetID()return self.ID end;function a:GetName()return self.Name end;function a:GetNiceName()return self.NiceName end;function a:GetImmunity()return self.Immunity end;function a:IsGlobal()return self.Global end;function a:HasFlag(l)return self.Flags[l:lower()]||self:IsRoot()end;function a:CanTarget(e)return self:IsRoot()||self:GetImmunity()>e:GetImmunity()end;function a:IsVIP()return self.VIP end;function a:IsAdmin()return self.Admin end;function a:IsDA()return self.DA end;function a:IsSA()return self.SA end;function a:IsGA()return self.GA end;function a:IsRoot()return self.Root end;function PLAYER:GetRankTable()return ba.ranks.Get(self:GetNetVar('UserGroup')||1)end;function PLAYER:GetRank()return self:GetRankTable():GetName()end;PLAYER.GetUserGroup=PLAYER.GetRank;function PLAYER:GetImmunity()return self:GetRankTable():GetImmunity()end;function PLAYER:HasFlag(l,m)if hook.Call('PlayerAdminCheck',GAMEMODE,self)==false then return false end;if SERVER&&m&&!ba.IsAuthed(self)then return false end;return self:GetRankTable():HasFlag(l)end;PLAYER.HasAccess=PLAYER.HasFlag;function PLAYER:IsRank(n)return self:GetRank()==n end;PLAYER.IsUserGroup=PLAYER.IsRank;function PLAYER:IsVIP()return hook.Call('PlayerVIPCheck',GAMEMODE,self)==true||self:GetRankTable():IsVIP()end;function PLAYER:IsAdmin(m)if hook.Call('PlayerAdminCheck',GAMEMODE,self)==false then return false end;if SERVER&&m&&!ba.IsAuthed(self)then return false end;return self:GetRankTable():IsAdmin()end;function PLAYER:IsDA(m)if hook.Call('PlayerAdminCheck',GAMEMODE,self)==false then return false end;if SERVER&&m&&!ba.IsAuthed(self)then return false end;return self:GetRankTable():IsDA()end;function PLAYER:IsSA(m)if hook.Call('PlayerAdminCheck',GAMEMODE,self)==false then return false end;if SERVER&&m&&!ba.IsAuthed(self)then return false end;return self:GetRankTable():IsSA()end;function PLAYER:IsGA(m)if hook.Call('PlayerAdminCheck',GAMEMODE,self)==false then return false end;if SERVER&&m&&!ba.IsAuthed(self)then return false end;return self:GetRankTable():IsGA()end;PLAYER.IsSuperAdmin=PLAYER.IsGA;function PLAYER:IsRoot(m)return SERVER&&m&&(ba.IsAuthed(self)&&self:GetRankTable():IsRoot())||self:GetRankTable():IsRoot()end;function PLAYER:IsAdminMode()return self:GetNetVar('AdminMode')==true end;function PLAYER:SetAdminMode(o)self:SetNetVar('AdminMode',o&&true||nil)end;nw.Register'UserGroup':Write(net.WriteUInt,4):Read(net.ReadUInt,4):SetPlayer():SetHook('nw.UserGroup')nw.Register'AdminMode':Write(net.WriteBool):Read(net.ReadBool):SetLocalPlayer()
--addons/!lpakr_out/lua/badmin/core/ui/main_cl.lua:
ba.ui=ba.ui||{}function ba.ui.OpenAuthLink(a)gui.OpenURL('https://superiorservers.co/api/auth/login?return=https://superiorservers.co'..a)end;function ba.ui.WordWrap(b,c,d,e)surface.SetFont(b)local f={}local g=1;local h=1;local i=string.Explode('\n',c,false)for j,k in ipairs(i)do local l=0;local m=''local n=0;local o=1;while o<=#k do local p=k[o]local q;if e&&e[g]then q=16 else q=surface.GetTextSize(p)end;if l+q>d then if n!=0 then m=m:sub(1,#m-(o-n)+1)f[#f+1]=m;m=''l=0;g=g-(o-n)o=n+1;n=0 else f[#f+1]=m;l=q;m=p;g=g+1;n=0;o=o+1 end else if p==' 'then n=o end;m=m..p;l=l+q;g=g+1;o=o+1 end end;if m!=''||i[j+1]then f[#f+1]=m end;g=g+2;h=g end;return f end
--addons/!lpakr_out/lua/badmin/core/ui/vgui/ba_passwordentry.lua:
local a={}surface.CreateFont("PwdFont",{font="Courier New",size=30,weight=700,antialias=true})function a:Init()self:SetFont("PwdFont")self:SetMouseInputEnabled(false)self:SetKeyBoardInputEnabled(false)self.Under=vgui.Create("DTextEntry")self.Under:SetFont("PwdFont")self.Under:SetTextColor(Color(0,0,0,0))self.Under.OnTextChanged=function(b)self.HiddenText=string.rep('*',#b:GetText())self.LastRand=nil end;self.Under.Paint=function()return false end end;function a:GetRealText()return self.Under:GetText()end;function a:Think()self.Under:SetParent(self:GetParent())self.Under:SetPos(self:GetPos())self.Under:SetSize(self:GetSize())end;local c=Color(0,0,0,0)function a:PaintOver(d,e)local f=self.Under:GetCaretPos()local g=self.Under:GetText()self.Under:SetText(self.HiddenText||"")self.Under:SetCaretPos(f)self.Under:DrawTextEntryText(self:GetTextColor(),self:GetHighlightColor(),self:GetCursorColor())self.Under:SetText(g)self.Under:SetCaretPos(f)end;vgui.Register("ba_passwordentry",a,"DTextEntry")local h;net.Receive("ba.PasswordRequest",function(i)if IsValid(h)then h:Close()end;local j=net.ReadBool()local k=j&&net.ReadBool()h=ui.Create("ui_frame",function(self)self:SetTitle("Authenticate")self:SetSize(300,1)self:MakePopup()end)local l;local m;local n;local o;if!j then local p,q=h:GetDockPos()l=ui.Create("ba_passwordentry",function(self)self:SetSize(290,28)self:SetPos(p,q+17)end,h)o=ui.Create('ui_button',function(self)self:SetSize(290,29)self:SetPos(p,q+50)self:SetText("Submit")end,h)local r=ui.Create("DLabel",function(self)self:SetText("Enter password:")self:SizeToContents()self:SetPos(p,q-5)end,h)l.Under.OnEnter=function()o:DoClick()end;h:SetTall(118)else if k then l=ui.Create("ba_passwordentry",function(self)self:SetSize(290,28)self:SetPos(5,51)end,h)m=ui.Create("ba_passwordentry",function(self)self:SetSize(290,28)self:SetPos(5,102)end,h)n=ui.Create("ba_passwordentry",function(self)self:SetSize(290,28)self:SetPos(5,153)end,h)o=ui.Create('ui_button',function(self)self:SetSize(290,29)self:SetPos(5,186)self:SetText("Submit")end,h)local r=ui.Create("DLabel",function(self)self:SetText("Enter reset code:")self:SizeToContents()self:SetPos(5,29)end,h)local s=ui.Create("DLabel",function(self)self:SetText("Choose new password:")self:SizeToContents()self:SetPos(5,80)end,h)local t=ui.Create("DLabel",function(self)self:SetText("Confirm:")self:SizeToContents()self:SetPos(5,131)end,h)h:SetTall(220)else m=ui.Create("ba_passwordentry",function(self)self:SetSize(290,28)self:SetPos(5,51)end,h)n=ui.Create("ba_passwordentry",function(self)self:SetSize(290,28)self:SetPos(5,102)end,h)o=ui.Create('ui_button',function(self)self:SetSize(290,29)self:SetPos(5,135)self:SetText("Submit")end,h)local r=ui.Create("DLabel",function(self)self:SetText("Create a password:")self:SizeToContents()self:SetPos(5,29)end,h)local s=ui.Create("DLabel",function(self)self:SetText("Confirm:")self:SizeToContents()self:SetPos(5,80)end,h)h:SetTall(169)end;n.Under.OnEnter=function()o:DoClick()end end;h:Center()o.DoClick=function(self)if self:GetDisabled()then return end;net.Start("ba.PasswordAuth")net.WriteBool(j)if j then if k then net.WriteString(m:GetRealText())net.WriteBool(true)net.WriteString(l:GetRealText())else net.WriteString(m:GetRealText())net.WriteBool(false)end else net.WriteString(l:GetRealText())end;net.SendToServer()h:Close()end;local u=SysTime()o.Think=function(self)if j then if k then local v=l:GetRealText()if#v==0 then self:SetText("Enter the reset code")self:SetDisabled(true)return end end;local w=m:GetRealText()if#w<4 then self:SetText("Need at least 4 characters")self:SetDisabled(true)elseif n:GetRealText()!=w then self:SetText("Passwords don't match")self:SetDisabled(true)else self:SetText("Submit")self:SetDisabled(false)end else if SysTime()<u+1 then self:SetDisabled(true)else self:SetDisabled(false)end end end;if l then l.OnKeyCode=function(x)if x==KEY_TAB&&m then m.Under:RequestFocus()end end;timer.Simple(0.05,function()if IsValid(l)then l.Under:RequestFocus()end end)end;if m then m.OnKeyCode=function(x)if x==KEY_TAB then n.Under:RequestFocus()end end end end)
--addons/!lpakr_out/lua/badmin/core/module_loader.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/voice_vis/_module.lua:
ba.Module('Voice Visualizers'):Author('aStonedPenguin'):Include('init_cl.lua')
--addons/!lpakr_out/lua/badmin/plugins/anticrash_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/plugins/antispam_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/plugins/tellall_sh.lua:
term.Add('AdminSentStaffMessage','# has sent a staff message to the server: #')ba.AddCommand('TellAll',function(a,b)net.Start('ba.TellAll')net.WriteString(b)net.Broadcast()ba.notify_all(term.Get('AdminSentStaffMessage'),a,b)end):AddParam(cmd.STRING):SetFlag'A':SetHelp'Sends a message to the server'surface.CreateFont('ba.ui.tellall',{font='coolvetica',size=40,weight=750})local c={}local d={}function d:Init()surface.PlaySound('HL1/fvox/beep.wav')self.Lines={}self.Time=15;self.EndTime=CurTime()+self.Time;self.Title=ui.Create('DLabel',self)self.Title:SetText('Staff Message!')end;function d:PerformLayout(e,f)self.Title:SizeToContents()self.Title:SetPos(e*0.5-self.Title:GetWide()*0.5,5)self.Title:SetSize(self.Title:GetWide(),20)for g,h in ipairs(self.Lines)do h:SetPos(e*0.5-h:GetWide()*0.5,g*30)end end;function d:ApplySchemeSettings()self.Title:SetFont('ui.22')self.Title:SetColor(ui.col.White)end;function d:Think()self:MoveToFront()if self.Anim then self.Anim:Run()end;if self.MoveAnim then self.MoveAnim:Run()end end;function d:FadeIn(i,j)self.Anim=Derma_Anim('Fade Panel',self,function(k,l,m,n)k:SetAlpha(m*255)if l.Finished then self.Anim=nil;if j then j()end end end)if self.Anim then self.Anim:Start(i)end end;function d:FadeOut(i,j)self.Anim=Derma_Anim('Fade Panel',self,function(k,l,m,n)k:SetAlpha(255-m*255)if l.Finished then self.Anim=nil;if j then j()end end end)if self.Anim then self.Anim:Start(i)end end;function d:MoveDown(o,i,j)local p=self.NextY||self.y;self.NextY=p+o;self.MoveAnim=Derma_Anim('Move Panel',self,function(k,l,m,n)k.y=p+m*o;if l.Finished then self.MoveAnim=nil;self.NextY=nil;if j then j()end end end)if self.MoveAnim then self.MoveAnim:Start(i)end end;function d:SetText(b)local q=string.Wrap(b,'ba.ui.tellall',ScrW()*0.8)self:SetWide(175)for g,h in ipairs(q)do self.Lines[#self.Lines+1]=ui.Create('DLabel',function(r)r:SetFont('ba.ui.tellall')r:SetTextColor(ui.col.White)r:SetText(h)r:SizeToContents()if r:GetWide()+20>self:GetWide()then self:SetWide(r:GetWide()+20)end end,self)end;self:SetTall(41+#q*30)self:SetPos(ScrW()*0.5-self:GetWide()*0.5)self:FadeIn(0.2)self:MoveDown(ScrH()*0.1,0.2)for g,h in ipairs(c)do h:MoveDown(self:GetTall()+10,0.2)end;c[#c+1]=self;timer.Simple(self.Time,function()local s=table.remove(c,1)if IsValid(s)then s:FadeOut(0.2,function()s:Remove()end)end end)end;local t=ui.col.Red:Copy()t.a=25;function d:Paint(e,f)derma.SkinHook('Paint','Frame',self,e,f)draw.Box(0,0,e*(self.EndTime-CurTime())/self.Time,30,t)surface.SetDrawColor(CurTime()%2<1&&ui.col.Red||ui.col.Outline)surface.DrawOutlinedRect(0,0,e,f)end;vgui.Register('ba_tellall',d,'Panel')net('ba.TellAll',function()ui.Create('ba_tellall',function(self)self:SetText(net.ReadString())end)end)
--addons/!lpakr_out/lua/drgbase/misc.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/possession.lua:
local a=CreateConVar("drgbase_possession_enable","1",{FCVAR_ARCHIVE,FCVAR_NOTIFY,FCVAR_REPLICATED})local b=CreateConVar("drgbase_possession_allow_lockon","1",{FCVAR_ARCHIVE,FCVAR_NOTIFY,FCVAR_REPLICATED})properties.Add("drgbasepossess",{MenuLabel="Possess",Order=1000,MenuIcon="drgbase/icon16.png",Filter=function(self,c,d)if!c.IsDrGNextbot then return false end;if!a:GetBool()then return false end;if!c.PossessionPrompt then return false end;if!c:IsPossessionEnabled()then return false end;return true end,Action=function(self,c)self:MsgStart()net.WriteEntity(c)self:MsgEnd()end,Receive=function(self,e,d)local c=net.ReadEntity()local f=c:Possess(d)if f=='ok'then net.Start'DrGBaseNextbotCanPossess'net.WriteEntity(c)else net.Start'DrGBaseNextbotCantPossess'net.WriteEntity(c)net.WriteString(f)end;net.Send(d)end})hook.Add("StartCommand","DrGBasePossessionStartCommand",function(d,g)if!isfunction(d.DrG_IsPossessing)then return end;if d:DrG_IsPossessing()then local h=d:DrG_GetPossessing()g:ClearMovement()if d:HasWeapon("drgbase_possession")then g:SelectWeapon(d:GetWeapon("drgbase_possession"))elseif SERVER then d:Give("drgbase_possession")end;local i=h:PossessionGetLockedOn()if IsValid(i)then local j=h:PossessorView()local k=g:GetViewAngles()local l=j:DrG_Direction(i:WorldSpaceCenter()):Angle()local m=i.DrGBase_LockOnBone;if isstring(m)then m=i:LookupBone(m)end;if isnumber(m)then l=j:DrG_Direction(i:GetBonePosition(m)):Angle()end;if SERVER then else g:SetViewAngles(LerpAngle(GetConVar("drgbase_possession_lockon_speed"):GetFloat(),k,l))end end elseif SERVER then d:StripWeapon'drgbase_possession'end end)hook.Add("PlayerFootstep","DrGBasePossessionMuteFootsteps",function(d)if!isfunction(d.DrG_IsPossessing)then return end;if d:DrG_IsPossessing()then return true end end)if SERVER then else CreateClientConVar("drgbase_possession_exit",tostring(KEY_E),true,true)CreateClientConVar("drgbase_possession_view",tostring(KEY_V),true,true)CreateClientConVar("drgbase_possession_climb",tostring(KEY_C),true,true)CreateClientConVar("drgbase_possession_lockon",tostring(KEY_L),true,true)CreateClientConVar("drgbase_possession_lockon_speed","0.05",true,true)net.Receive("DrGBaseNextbotCanPossess",function()local c=net.ReadEntity()if!IsValid(c)then return end;notification.AddLegacy("You are now possessing "..c.PrintName..".",NOTIFY_HINT,4)surface.PlaySound("buttons/lightswitch2.wav")end)net.Receive("DrGBaseNextbotCantPossess",function()local c=net.ReadEntity()if!IsValid(c)then return end;local n=net.ReadString()local o=n;if n=="not allowed"then o="you are not allowed to possess this nextbot."elseif n=="already possessed"then o="another player is already possessing this nextbot."elseif n=="error"then o="unknown error."elseif n=="not alive"then o="you are dead."elseif n=="already possessing"then o="you are already possessing a nextbot."elseif n=="disabled"then o="possession is not available for this nextbot."elseif n=="no views"then o="no defined camera views."elseif n=="in vehicle"then o="you are in a vehicle."end;notification.AddLegacy("You can't possess "..c.PrintName..": "..o,NOTIFY_ERROR,4)surface.PlaySound("buttons/button10.wav")end)local p={["CHudWeaponSelection"]=true,["CHudAmmo"]=true,["CHudSecondaryAmmo"]=true,["CHudZoom"]=true}hook.Add("HUDShouldDraw","DrGBasePossessionHideHUD",function(q)local d=LocalPlayer()if!isfunction(d.DrG_IsPossessing)then return end;if!d:DrG_IsPossessing()then return end;if p[q]then return false end;if q=="CHudCrosshair"&&!d:DrG_Possessing().PossessionCrosshair then return false end end)hook.Add("CalcView","DrGBasePossessionCalcView",function(d,j,r,s,t,u)if!isfunction(d.DrG_IsPossessing)then return end;if!d:DrG_IsPossessing()then return end;local h=d:DrG_Possessing()if!isfunction(h.PossessorView)then return end;local v={}v.origin,v.angles=h:PossessorView()v.fov,v.znear,v.zfar=s,t,u;v.drawviewer=true;return v end)hook.Add("ContextMenuOpen","DrGBasePossessionDisableCMenu",function()local d=LocalPlayer()if!isfunction(d.DrG_IsPossessing)then return end;if d:DrG_IsPossessing()then return false end end)hook.Add("ShouldDrawLocalPlayer","DrGBasePossessionDrawPlayer",function(d)if!isfunction(d.DrG_IsPossessing)then return end;if d:DrG_IsPossessing()then return false end end)function DrGBase.DrawPossessionHUD(c)end end
--addons/!lpakr_out/lua/drgbase/weapons.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/weapons.lua:
function DrGBase.AddWeapon(a)local b=string.Replace(a.Folder,"weapons/","")if a.PrintName==nil||a.Category==nil then return end;list.Set("DrGBaseWeapons",b,{Name=a.PrintName,Class=b,Category=a.Category})end
--addons/!lpakr_out/lua/drgbase/modules/math.lua:
function math.DrG_Cycle(a,b,c,d)if!isnumber(a)then a=0 end;if!isnumber(b)then b=a+1 end;if a>b then return math.DrG_Cycle(b,a,c,d)end;local e=math.pi*2;return(math.sin((CurTime()-(d||0))*e*(c||1)%e)+1)/2*(b-a)+a end
--addons/!lpakr_out/lua/dronesrewrite/main.lua:
DRONES_REWRITE={}DRONES_REWRITE.LogDebug=function(a)if DRONES_REWRITE.ServerCVars&&DRONES_REWRITE.ServerCVars.DebugMode:GetBool()then MsgC(Color(255,100,100),"[DRR Debug] ",SERVER&&Color(137,222,255)||Color(255,222,102),a,"\n")end end;DRONES_REWRITE.Version=4;DRONES_REWRITE.HUD={}DRONES_REWRITE.Overlay={}DRONES_REWRITE.Weapons={}DRONES_REWRITE.Keys={["Forward"]=KEY_W,["Back"]=KEY_S,["Right"]=KEY_D,["Left"]=KEY_A,["Down"]=KEY_LCONTROL,["Up"]=KEY_SPACE,["Sprint"]=KEY_LSHIFT,["MoveSlowly"]=KEY_LALT,["Exit"]=KEY_E,["ThirdPerson"]=KEY_I,["Enable"]=KEY_G,["Fire1"]=MOUSE_LEFT,["Fire2"]=MOUSE_RIGHT,["SelfDestruct"]=KEY_J,["NightVision"]=KEY_R,["Flashlight"]=KEY_F,["SpecialKey"]=MOUSE_MIDDLE,["WeaponView"]=KEY_T,["Zoom"]=KEY_H,["StrafeRight"]=KEY_0,["StrafeLeft"]=KEY_0}DRONES_REWRITE.SortedKeys={"Forward","Back","Right","Left","Down","Up","Sprint","MoveSlowly","Exit","ThirdPerson","Enable","Fire1","Fire2","SelfDestruct","NightVision","Flashlight","SpecialKey","WeaponView","Zoom","StrafeRight","StrafeLeft"}DRONES_REWRITE.GetDrones=function()local b={}for c,d in pairs(ents.GetAll())do if d.IS_DRONE then b[#b+1]=d end end;return b end;DRONES_REWRITE.GetDronesRewrite=function()local b={}for c,d in pairs(ents.GetAll())do if d.IS_DRR then b[#b+1]=d end end;return b end;DRONES_REWRITE.FindDroneByUnit=function(e)for c,d in pairs(DRONES_REWRITE.GetDronesRewrite())do if string.find(string.lower(d:GetUnit()),string.lower(e))then return d end end;return NULL end;DRONES_REWRITE.IncludeFolder=function(f,g,h,i)h=h||"sh"i=i||{}local j,k=file.Find(f.."/*","LUA")for c,d in pairs(j)do if table.HasValue(i,d)then continue end;local file=f.."/"..d;if CLIENT&&(h=="cl"||h=="sh")then include(file)end end;if g then for c,d in pairs(k)do DRONES_REWRITE.IncludeFolder(f.."/"..d,h)end end;DRONES_REWRITE.LogDebug("Included "..f)end;DRONES_REWRITE.LoadFile=function(f)include(f)DRONES_REWRITE.LogDebug("Included "..f)end;DRONES_REWRITE.LoadFile("dronesrewrite/receiver.lua")DRONES_REWRITE.LoadFile("dronesrewrite/cvars.lua")DRONES_REWRITE.IncludeFolder("dronesrewrite",false,"sh",{"main.lua","receiver.lua","cvars.lua"})DRONES_REWRITE.IncludeFolder("dronesrewrite/client",true,"cl")DRONES_REWRITE.IncludeFolder("dronesrewrite/weapons",true)DRONES_REWRITE.DoPrecache=function()local l,m=file.Find("models/dronesrewrite/*","GAME")local n=0;for o,p in pairs(m)do local f=Format("models/dronesrewrite/%s/",p)local q,r=file.Find(f.."*","GAME")for s,t in pairs(q)do if string.find(t,".mdl")then util.PrecacheModel(f..t)n=n+1;break end end end;print(Format("Precached %i Drones Rewrite models",n))end;DRONES_REWRITE.Loaded=true
--addons/!lpakr_out/lua/dronesrewrite/cvars.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/client/help_menu.lua:
DRONES_REWRITE.ShowHelpWindow=function(a)local b=DRONES_REWRITE.CreateWindow(870,500)b:SetSize(282,500)b:SetupCloseButton()local c=Derma_Anim("Sizing",b,function(d,c,e,f)d:SetSize(Lerp(e,d:GetWide(),870),500)d:SetupCloseButton()end)local g=b.Think;b.Think=function(self)g(self)if c:Active()then c:Run()end end;local g=b.Paint;b.Paint=function(b,h,i)g(b,h,i)local j=b.Animation&&DRONES_REWRITE.Colors.Border||DRONES_REWRITE.Colors.Grey;surface.SetDrawColor(j)surface.DrawLine(281,25,281,500)end;local k=DRONES_REWRITE.CreateScrollPanel(0,25,282,474,b)local l=DRONES_REWRITE.CreateScrollPanel(282,25,588,475,b)l.labs={}l.oldlabs={}local m=Derma_Anim("Alpha",l,function(d,c,e,f)for n,o in pairs(d.oldlabs)do if IsValid(o)then o:SetAlpha(Lerp(e,o:GetAlpha(),0))if o:GetAlpha()<=0 then o:Remove()end end end;for n,o in pairs(d.labs)do if IsValid(o)then o:SetAlpha(Lerp(e,o:GetAlpha(),255))end end end)l.Think=function(self)if m:Active()then m:Run()end end;local p=0;local function q(r,a)local s=1+p*31;local t=DRONES_REWRITE.CreateButton(r,1,s,280,30,k,function()if!b.Animation then c:Start(1)b.Animation=true end;for n,o in pairs(l.labs)do table.insert(l.oldlabs,o)l.labs[n]=nil end;a()m:Start(2)b:SetTitle(r)end)if a&&a==r then t.DoClick()end;p=p+1;return t end;for n,o in pairs(DRONES_REWRITE.Manuals)do q(o.label,function()for n,o in pairs(string.Explode("\n",o.text))do local u=DRONES_REWRITE.CreateLabel(o,10,10+(n-1)*16,l)u:SetAlpha(0)table.insert(l.labs,u)end end)end end;concommand.Add("dronesrewrite_help",DRONES_REWRITE.ShowHelpWindow)
--addons/!lpakr_out/lua/dronesrewrite/client/overlay/default.lua:
return lpakr()()
--addons/!lpakr_out/lua/grapple/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/libraries/resource.lua:
local a={}local b=include("luadata.lua")local function c(...)print("[resource] ",...)end;local function d(...)print("[resource warning] ",...)end;local function e(f)if file.Exists(f,"DATA")then return f end end;local function g(h)h=h||{}local self={}function self:check(f,i,j)if h[f]then if h[f].extra_callbacks then for k,l in pairs(h[f].extra_callbacks)do local i=j[k]if i then h[f].extra_callbacks[k]=function(...)l(...)i(...)end end end end;if h[f].callback then if!istable(h[f].callback)then h[f].callback={h[f].callback}end;table.insert(h[f].callback,i)return true end end end;function self:start(f,i,j)if!istable(i)then i={i}end;h[f]={callback=table.Copy(i),extra_callbacks=table.Copy(j||{})}end;function self:callextra(f,k,m)if!h[f]||!h[f].extra_callbacks[k]then return end;return h[f].extra_callbacks[k](m)end;function self:stop(f,m,...)if!h[f]then return end;if istable(h[f].callback)then for n,o in ipairs(h[f].callback)do o(m,...)end elseif h[f].callback then h[f].callback(m,...)end;h[f]=m end;function self:get(f)return h[f]end;function self:uncache(f)h[f]=nil end;return self end;local p="pac3_cache/downloads/"local q="pac3_cache/resource_etags.txt"file.CreateDir(p)local r=CreateConVar("pac_downloads_cache_maxage","604800",FCVAR_ARCHIVE,"Maximum age of cache entries in seconds, default is 1 week.")local function s(t)for u,v in ipairs(file.Find(p.."*","DATA"))do local w=p..v;if file.Time(w,"DATA")<t then file.Delete(w)end end end;s(os.time()-r:GetInt())local function x(y,z)local A=file.Read(y,"DATA")file.Delete(y,"DATA")file.Write(z,A)return true end;local function B(C,D,i,E,F,G,H,I)if G then local J=b.ReadFile(q)local K=J[H||C]HTTP({method="HEAD",url=pac.FixGMODUrl(C),success=function(L,M,N)local O=N.ETag||N["Last-Modified"]if!O then return end;if O!=K then if K then c(C,": etag has changed ",O)else c(C,": no previous etag stored",O)end;B(C,D,i,E,F,nil,H,I)else G()end end})return end;local file;local P={[".txt"]=true,[".jpg"]=true,[".png"]=true,[".vtf"]=true,[".dat"]=true}return pac.HTTPGet(C,function(M,Q,N)do if I then local R=N["Content-Type"]&&(N["Content-Type"]:match(".-/(.-);")||N["Content-Type"]:match(".-/(.+)"))||"dat"if R=="jpeg"then R="jpg"end;if M:StartWith("VTF")then R="vtf"end;if P["."..R]then D=D.."."..R else D=D..".dat"end end;local S,T=_G.file.Open(p..D.."_temp.dat","wb","DATA")file=S;if!file then c("resource download error: ",T)E()return false end;local K=N.ETag||N["Last-Modified"]if K then local J=b.ReadFile(q)||{}J[H||C]=K;b.WriteFile(q)end;F(N)end;file:Write(M)file:Close()local U=p..D.."_temp.dat"if U then local V,T=x(U,U:gsub("(.+)_temp%.dat","%1"))if!V then c("unable to rename %q: %s",U,T)E()return end;local U=e(p..D)if U then a.BuildCacheFolderList(U:match(".+/(.+)"))i(U)else d("resource download error: %q not found!",p..D)E()end else d("resource download error: %q not found!",p..D)E()end end,function(...)E(...)end)end;local W=g()local X=false;function a.Download(f,i,E,Y,G)E=E||function(Z)c(f,": ",Z)end;local _;local a0;local I;if f:find("^.-://")then local a1=false;if f:StartWith("_")then f=f:sub(2)a1=true end;if!a.url_cache_lookup then a.BuildCacheFolderList()end;_=f;local Y=Y||pac.Hash(f)if!a1&&a.url_cache_lookup[Y]then f=a.url_cache_lookup[Y]a0=e(p..f)I=false else f=Y;a0=false;I=true end end;if!a0 then G=nil end;if!X then local l=i;i=function(f)if l then l(f)end end end;if a0&&!G then X=true;if isfunction(i)then i(a0)elseif istable(i)then for n,o in ipairs(i)do o(a0)end end;X=false;return true end;if G then G=function()if X then return end;X=true;W:callextra(f,"check_etag",a0)X=false;W:stop(f,a0)W:uncache(f)end end;if W:check(f,i,{on_fail=E,check_etag=G})then return true end;W:start(f,i,{on_fail=E,check_etag=G})if _ then if!G then end;B(_,f,function(...)W:stop(f,...)W:uncache(f)end,function(...)W:callextra(f,"on_fail",...||f.." not found")W:uncache(f)end,function(N)return true end,G,nil,I)return true end end;function a.BuildCacheFolderList(a2)if!a.url_cache_lookup then local a3={}for u,a2 in ipairs(file.Find(p.."*","DATA"))do local a4=a2:match("(%w+)%.")if a4 then a3[a4]=a2 else c("bad file in downloads/cache folder: ",a2)file.Delete(p..a2)end end;a.url_cache_lookup=a3 end;if a2 then a.url_cache_lookup[a2:match("(.-)%.")]=a2 end end;function a.ClearDownloads()local a5={}for u,f in ipairs(vfs.Find(p))do file.Delete(p..f)end;a.BuildCacheFolderList()end;function a.CheckDownloadedFiles()local a6=b.ReadFile(q)local a7=table.Count(a6)c("checking "..a7 .." files for updates..")local n=0;for f,K in pairs(a6)do a.Download(f,function()n=n+1;if n==a7 then c("done checking for file updates")end end,c,nil,true)end end;if CLIENT then local a8={}timer.Create("pac3_resource_gc",0.25,0,function()for a9,aa in pairs(a8)do if!aa.ply:IsValid()then a8[a9]=nil;file.Delete(aa.path)end end end)pac.AddHook("ShutDown","resource_gc",function()for u,a4 in ipairs(file.Find(p.."*","DATA"))do file.Delete(p..a4)end end)function a.DownloadTexture(_,i,ab)if!_:find("^.-://")then return end;return a.Download(_,function(f)local ac;local ad;if f:EndsWith(".vtf")then local ae=file.Open(f,"rb","DATA")ae:Seek(24)ac=ae:ReadShort()ae:Close()ad=CreateMaterial(tostring({}),"VertexLitGeneric",{})ad:SetTexture("$basetexture","../data/"..f)else ad=Material("../data/"..f,"mips smooth noclamp")end;local af=ad:GetTexture("$basetexture")if af then i(af,ac)a8[_]={ply=ab,path=f}elseif ab==pac.LocalPlayer then pac.Message(Color(255,50,50),"$basetexture from ",_," is nil")end end,function()end)end end;return a
--addons/!lpakr_out/lua/pac3/libraries/animations.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/shared/movement.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/shared/entity_mutators/model.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/shared/entity_mutators/size.lua:
local a={}a.ClassName="size"function a:WriteArguments(b,c)net.WriteFloat(b)if c then net.WriteBool(true)net.WriteFloat(c.StandingHullHeight)net.WriteFloat(c.CrouchingHullHeight)net.WriteFloat(c.HullWidth)else net.WriteBool(false)end;if SERVER then else net.WriteBool(false)end end;function a:ReadArguments()local b=math.Clamp(net.ReadFloat(),0.1,10)local c=false;local d;if net.ReadBool()then c={}c.StandingHullHeight=net.ReadFloat()c.CrouchingHullHeight=net.ReadFloat()c.HullWidth=net.ReadFloat()end;if net.ReadBool()then d=net.ReadTable()end;return b,c,d end;function a:StoreState()local e=self.Entity;return 1,false,{ViewOffset=e.GetViewOffset&&e:GetViewOffset()||nil,ViewOffsetDucked=e.GetViewOffsetDucked&&e:GetViewOffsetDucked()||nil,StepSize=e.GetStepSize&&e:GetStepSize()||nil}end;local f={"ViewOffset","ViewOffsetDucked","StepSize"}function a:Mutate(b,c,d)local e=self.Entity;if e:GetModelScale()!=b then e:SetModelScale(b)end;d=d||self.original_state[3]if d then for g,h in ipairs(f)do local i=d[h]if i then local j=e["Set"..h]if j then j(e,i*b)end end end end;if e.SetHull&&e.SetHullDuck&&e.ResetHull then if c then local k,l=Vector(),Vector()local m,n=Vector(),Vector()local o=math.Clamp(c.HullWidth||32,1,4096)k.x=-o/2;l.x=o/2;k.y=-o/2;l.y=o/2;m.x=-o/2;n.x=o/2;m.y=-o/2;n.y=o/2;k.z=0;l.z=math.Clamp(c.StandingHullHeight||72,1,4096)m.z=0;n.z=math.Clamp(c.CrouchingHullHeight||36,1,4096)e:SetHull(k,l)e:SetHullDuck(m,n)else e:ResetHull()end end end;pac.emut.Register(a)
--addons/!lpakr_out/lua/pac3/core/client/parts.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/animation.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/clip.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/holdtype.lua:
local a,b=pac.PartTemplate("base")b.ClassName="holdtype"b.ThinkTime=0;b.Group='entity'b.Icon='icon16/user_edit.png'local c={"ACT_MP_STAND_IDLE","ACT_MP_WALK","ACT_MP_RUN","ACT_MP_CROUCH_IDLE","ACT_MP_CROUCHWALK","ACT_MP_ATTACK_STAND_PRIMARYFIRE","ACT_MP_ATTACK_CROUCH_PRIMARYFIRE","ACT_MP_RELOAD_STAND","ACT_MP_RELOAD_CROUCH","ACT_MP_JUMP","ACT_LAND","ACT_RANGE_ATTACK1","ACT_MP_SWIM_IDLE","ACT_MP_SWIM"}do local d={}for e,f in pairs(c)do local g=f;g="_"..g;g=g:gsub("ACT_MP_","")g=g:lower()g=g:gsub("_(.)",function(h)return h:upper()end)d[g]=_G[f]end;if d.Crouchwalk then d.CrouchWalk=d.Crouchwalk;d.Crouchwalk=nil end;c=d end;b.ActMods=c;local i={enums=function(j)if!j.GetSequenceList then return{}end;local k={}for l,m in pairs(j:GetSequenceList())do k[m]=m end;return k end}a:StartStorableVars()for n in pairs(c)do a:GetSet(n,"",i)end;a:GetSet("Fallback","",i)a:GetSet("Noclip","",i)a:GetSet("Air","",i)a:GetSet("Sitting","",i)a:GetSet("AlternativeRate",false)a:GetSet("Override",false)a:EndStorableVars()for n in pairs(c)do b["Set"..n]=function(self,o)self[n]=o;if!self:IsHidden()then self:UpdateActTable()end end end;function b:SetFallback(o)self.Fallback=o;if!self:IsHidden()then self:UpdateActTable()end end;function b:UpdateActTable()local p=self:GetRootPart():GetOwner()if!p:IsValid()then return end;p.pac_holdtype_alternative_animation_rate=self.AlternativeRate;p.pac_holdtypes=p.pac_holdtypes||{}if self.Override then table.Empty(p.pac_holdtypes)end;p.pac_holdtypes[self]=p.pac_holdtypes[self]||{}local q=p.pac_holdtypes[self]for n,f in pairs(c)do q[f]=p:GetSequenceActivity(p:LookupSequence(self[n]))end;q.fallback=p:GetSequenceActivity(p:LookupSequence(self.Fallback))q.noclip=p:GetSequenceActivity(p:LookupSequence(self.Noclip))q.air=p:GetSequenceActivity(p:LookupSequence(self.Air))q.sitting=p:GetSequenceActivity(p:LookupSequence(self.Sitting))q.part=self end;function b:OnThink()local p=self:GetRootPart():GetOwner()if!p:IsValid()then return end;if p:GetModel()!=self.last_model||p.pac_holdtypes!=self.last_pac_holdtypes then self:UpdateActTable()self.last_model=p:GetModel()self.last_pac_holdtypes=p.pac_holdtypes end end;function b:GetSequenceList()local p=self:GetOwner()if p:IsValid()then return p:GetSequenceList()end;return{"none"}end;function b:OnHide()local p=self:GetRootPart():GetOwner()if p:IsValid()then if p.pac_holdtypes then p.pac_holdtypes[self]=nil end;p.pac_holdtype_alternative_animation_rate=nil end end;function b:OnShow()self:UpdateActTable()end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/jiggle.lua:
local FrameTime=FrameTime;local a=util.QuickTrace;local VectorRand=VectorRand;local Vector=Vector;local Angle=Angle;local b=physenv.GetGravity;local c,d=pac.PartTemplate("base_drawable")d.ClassName="jiggle"d.Group='model'd.Icon='icon16/chart_line.png'c:StartStorableVars()c:GetSet("Strain",0.5,{editor_onchange=function(self,e)self.sens=0.25;e=tonumber(e)return math.Clamp(e,0,1)*0.999 end})c:GetSet("Speed",1)c:GetSet("ConstantVelocity",Vector(0,0,0))c:GetSet("LocalVelocity",true)c:GetSet("JiggleAngle",true)c:GetSet("JigglePosition",true)c:GetSet("ConstrainPitch",false)c:GetSet("ConstrainYaw",false)c:GetSet("ConstrainRoll",false)c:GetSet("ConstrainX",false)c:GetSet("ConstrainY",false)c:GetSet("ConstrainZ",false)c:GetSet("ConstrainSphere",0)c:GetSet("StopRadius",0)c:GetSet("Ground",false)c:GetSet("ResetOnHide",false)c:EndStorableVars()local f=math.AngleDifference;function d:Reset()local g,h=self:GetDrawPosition()self.pos=g||Vector()self.vel=Vector()self.ang=h||Angle()self.angvel=Angle()end;function d:Initialize()self.pos=Vector()self.vel=Vector()self.ang=Angle()self.angvel=Angle()self.first_time_reset=true end;function d:OnShow()if self.ResetOnHide then self:Reset()end end;local i,j=math.huge,-math.huge;local function k(e)if e!=i&&e!=j&&(e>=0||e<=0)then return e end;return 0 end;function d:OnDraw()local g,h=self:GetDrawPosition()if self.first_time_reset then self:Reset()self.first_time_reset=false end;local l=FrameTime()local m=self.Speed*l;self.vel=self.vel||VectorRand()self.pos=self.pos||g*1;if self.StopRadius!=0&&self.pos&&self.pos:Distance(g)<self.StopRadius then self.vel=Vector()return end;if self.JigglePosition then if!self.ConstrainX then self.vel.x=self.vel.x+g.x-self.pos.x;if self.LocalVelocity then self.vel=self.vel+h:Right()*self.ConstantVelocity.x else self.vel.x=self.vel.x+self.ConstantVelocity.x end;self.pos.x=self.pos.x+self.vel.x*(self.Invert&&-m||m)self.vel.x=self.vel.x*self.Strain else self.pos.x=g.x end;if!self.ConstrainY then self.vel.y=self.vel.y+g.y-self.pos.y;if self.LocalVelocity then self.vel=self.vel+h:Forward()*self.ConstantVelocity.y else self.vel.y=self.vel.y+self.ConstantVelocity.y end;self.pos.y=self.pos.y+self.vel.y*m;self.vel.y=self.vel.y*self.Strain else self.pos.y=g.y end;if!self.ConstrainZ then self.vel.z=self.vel.z+g.z-self.pos.z;if self.LocalVelocity then self.vel=self.vel+h:Up()*self.ConstantVelocity.z else self.vel.z=self.vel.z+self.ConstantVelocity.z end;self.pos.z=self.pos.z+self.vel.z*m;self.vel.z=self.vel.z*self.Strain else self.pos.z=g.z end;if self.Ground then self.pos.z=a(g,b()*100).HitPos.z end else self.pos=g end;if self.ConstrainSphere>0 then local n=math.min(self.pos:Distance(g),self.ConstrainSphere)self.pos=g+(self.pos-g):GetNormalized()*n end;if self.JiggleAngle then self.angvel=self.angvel||h*1;self.ang=self.ang||h*1;if!self.ConstrainPitch then self.angvel.p=self.angvel.p+f(h.p,self.ang.p)self.ang.p=f(self.ang.p,self.angvel.p*-m)self.angvel.p=self.angvel.p*self.Strain end;if!self.ConstrainYaw then self.angvel.y=self.angvel.y+f(h.y,self.ang.y)self.ang.y=f(self.ang.y,self.angvel.y*-m)self.angvel.y=self.angvel.y*self.Strain end;if!self.ConstrainRoll then self.angvel.r=self.angvel.r+f(h.r,self.ang.r)self.ang.r=f(self.ang.r,self.angvel.r*-m)self.angvel.r=self.angvel.r*self.Strain end else self.ang=h end end;function d:OnThink()self.pos.x=k(self.pos.x)self.pos.y=k(self.pos.y)self.pos.z=k(self.pos.z)self.ang.p=k(self.ang.p)self.ang.y=k(self.ang.y)self.ang.r=k(self.ang.r)end;c:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/poseparameter.lua:
local a,b=pac.PartTemplate("base")b.ClassName="poseparameter"b.ThinkTime=0;b.Group={'modifiers','entity'}b.Icon='icon16/disconnect.png'a:StartStorableVars()a:GetSet("PoseParameter","",{enums=function(c)return c:GetPoseParameterList()end})a:GetSet("Range",0)a:EndStorableVars()function b:GetNiceName()return pac.PrettifyName(self:GetPoseParameter())end;function b:GetPoseParameterList()local d=self:GetOwner()local e={}if d:IsValid()then for f=0,d:GetNumPoseParameters()-1 do local g=d:GetPoseParameterName(f)if g!=""then e[g]={name=g,i=f,range={d:GetPoseParameterRange(f)}}end end end;return e end;function b:SetRange(h)self.Range=h;self:UpdateParams()end;function b:UpdateParams()local d=self:GetOwner()if d:IsValid()then if!self.pose_params||d:GetModel()!=self.last_owner_mdl then self.pose_params=self:GetPoseParameterList()self.last_owner_mdl=d:GetModel()end;local i=self.pose_params[self.PoseParameter]if i then local h=Lerp((self.Range+1)/2,i.range[1]||0,i.range[2]||1)d.pac_pose_params=d.pac_pose_params||{}d.pac_pose_params[self.UniqueID]=d.pac_pose_params[self.UniqueID]||{}d.pac_pose_params[self.UniqueID].key=i.name;d.pac_pose_params[self.UniqueID].val=h;d:SetPoseParameter(i.name,h)end end end;function b:OnHide()local d=self:GetOwner()if d:IsValid()then d.pac_pose_params=nil;d:ClearPoseParameters()end end;function b:OnShow(d)self:UpdateParams()end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/shake.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/text.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/trail.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/webaudio.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/pac_core_init.lua:
if CLIENT&&pac&&!VLL_CURR_FILE&&!VLL2_FILEDEF then return end;if CLIENT then if pac&&pac.Panic then ProtectedCall(pac.Panic)end;include("pac3/core/client/init.lua")end
--addons/!lpakr_out/lua/pac3/libraries/luadata.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/menu_bar.lua:
local a=pace.LanguageString;local function b(c,d)local e=c.OnCursorEntered;c.OnCursorEntered=function(...)d()c.OnCursorEntered=e;return e(...)end end;local function f(g)do local g,h=g:AddSubMenu(a"save",function()pace.SaveParts()end)g:SetDeleteSelf(false)h:SetImage(pace.MiscIcons.save)b(h,function()pace.AddSaveMenuToMenu(g)end)end;do local g,h=g:AddSubMenu(a"load",function()pace.LoadParts(nil,true)end)g:SetDeleteSelf(false)h:SetImage(pace.MiscIcons.load)b(h,function()pace.AddSavedPartsToMenu(g,true)end)end;do local g,h=g:AddSubMenu(a"wear",function()pace.WearParts()end)g:SetDeleteSelf(false)h:SetImage(pace.MiscIcons.wear)pace.PopulateWearMenu(g)end;do g:AddOption(a"request",function()RunConsoleCommand("pac_request_outfits")pac.Message('Requesting outfits.')end):SetImage(pace.MiscIcons.replace)end;do local g,h=g:AddSubMenu(a"clear",function()end)h:SetImage(pace.MiscIcons.clear)g.GetDeleteSelf=function()return false end;g:AddOption(a"OK",function()pace.ClearParts()end):SetImage(pace.MiscIcons.clear)end;g:AddSpacer()do local i,j=g:AddSubMenu(a"help",function()pace.ShowWiki()end)i.GetDeleteSelf=function()return false end;j:SetImage(pace.MiscIcons.help)i:AddOption(a"Getting Started",function()pace.ShowWiki(pace.WikiURL.."Beginners-FAQ")end):SetImage(pace.MiscIcons.info)do local k=i:AddOption(a"Discord / PAC3 Chat",function()gui.OpenURL("https://discord.gg/utpR3gJ")cookie.Set("pac3_discord_ad",3)end)k:SetImage(pace.MiscIcons.chat)if cookie.GetNumber("pac3_discord_ad",0)<3 then j.PaintOver=function(l,m,n)surface.SetDrawColor(255,255,0,50+math.sin(SysTime()*20)*20)surface.DrawRect(0,0,m,n)end;k.PaintOver=j.PaintOver;cookie.Set("pac3_discord_ad",cookie.GetNumber("pac3_discord_ad",0)+1)end end;local o=_G.PAC_VERSION&&PAC_VERSION()if o then local p,q=i:AddSubMenu(a"Version",function()pace.ShowWiki()end)p.GetDeleteSelf=function()return false end;q:SetImage(pace.MiscIcons.info)p:AddOption(o)end;i:AddOption(a"about",function()pace.ShowAbout()end):SetImage(pace.MiscIcons.about)end;do g:AddOption(a"exit",function()pace.CloseEditor()end):SetImage(pace.MiscIcons.exit)end end;local function r(g)g:AddOption(a"hide editor",function()pace.Call("ToggleFocus")chat.AddText("[PAC3] \"ctrl + e\" to get the editor back")end):SetImage("icon16/application_delete.png")g:AddCVar(a"camera follow: "..GetConVar("pac_camera_follow_entity"):GetInt(),"pac_camera_follow_entity","1","0"):SetImage("icon16/camera_go.png")g:AddCVar(a"enable editor camera: "..GetConVar("pac_enable_editor_view"):GetInt(),"pac_enable_editor_view","1","0"):SetImage("icon16/camera.png")g:AddOption(a"reset view position",function()pace.ResetView()end):SetImage("icon16/camera_link.png")g:AddOption(a"reset zoom",function()pace.ResetZoom()end):SetImage("icon16/magnifier.png")end;local function s(g)g:AddOption(a"settings",function()pace.OpenSettings()end)g:AddCVar(a"inverse collapse/expand controls","pac_reverse_collapse","1","0")g:AddCVar(a"enable shift+move/rotate clone","pac_grab_clone","1","0")g:AddCVar(a"remember editor position","pac_editor_remember_position","1","0")g:AddCVar(a"show parts IDs","pac_show_uniqueid","1","0")g:AddSpacer()g:AddOption(a"position grid size",function()Derma_StringRequest(a"position grid size",a"size in units:",GetConVarNumber("pac_grid_pos_size"),function(t)RunConsoleCommand("pac_grid_pos_size",t)end)end)g:AddOption(a"angles grid size",function()Derma_StringRequest(a"angles grid size",a"size in degrees:",GetConVarNumber("pac_grid_ang_size"),function(t)RunConsoleCommand("pac_grid_ang_size",t)end)end)g:AddCVar(a"render attachments as bones","pac_render_attachments","1","0").DoClick=function()pace.ToggleRenderAttachments()end;g:AddSpacer()g:AddCVar(a"automatic property size","pac_auto_size_properties","1","0")g:AddCVar(a"enable language identifier in text fields","pac_editor_languageid","1","0")pace.AddLanguagesToMenu(g)pace.AddFontsToMenu(g)g:AddSpacer()local u,c=g:AddSubMenu(a"rendering",function()end)u.GetDeleteSelf=function()return false end;c:SetImage("icon16/camera_edit.png")u:AddCVar(a"no outfit reflections","pac_optimization_render_once_per_frame","1","0")end;local function v(g)local c=g:AddOption(a"t pose",function()pace.SetTPose(!pace.GetTPose())end):SetImage("icon16/user_go.png")g:AddOption(a"reset eye angles",function()pace.ResetEyeAngles()end):SetImage("icon16/user_delete.png")g:AddOption(a"reset zoom",function()pace.ResetZoom()end):SetImage("icon16/magnifier.png")if pacx&&pacx.GetServerModifiers then local w,c=g:AddSubMenu(a"modifiers",function()end)c:SetImage("icon16/user_edit.png")w.GetDeleteSelf=function()return false end;for x in pairs(pacx.GetServerModifiers())do w:AddCVar(a(x),"pac_modifier_"..x,"1","0")end end end;function pace.OnMenuBarPopulate(y)for z,A in pairs(y.Menus)do A:Remove()end;f(y:AddMenu("pac"))r(y:AddMenu(a"view"))s(y:AddMenu(a"options"))v(y:AddMenu(a"player"))pace.AddToolsToMenu(y:AddMenu(a"tools"))y:RequestFocus(true)end;function pace.OnOpenMenu()local g=DermaMenu()g:SetPos(input.GetCursorPos())v(g)g:AddSpacer()r(g)g:AddSpacer()s(g)g:AddSpacer()f(g)g:AddSpacer()local g,c=g:AddSubMenu(a"tools")c:SetImage("icon16/plugin.png")pace.AddToolsToMenu(g)g:MakePopup()end
--addons/!lpakr_out/lua/autorun/pac_extra_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/extra/shared/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/extra/shared/pac_weapon.lua:
do return end;local a={Primary={},Secondary={}}a.Author="CapsAdmin"a.Contact=""a.Purpose=""a.Instructions=""a.PrintName="pac weapon"a.DrawAmmo=false;a.DrawCrosshair=false;a.ViewModel="models/weapons/v_pistol.mdl"a.WorldModel="models/weapons/w_pistol.mdl"a.DrawWeaponInfoBox=true;a.Base="weapon_base"a.SlotPos=1;a.Slot=1;a.Spawnable=true;a.AdminSpawnable=true;a.AutoSwitchTo=true;a.AutoSwitchFrom=true;a.Weight=1;a.HoldType="normal"a.Primary.ClipSize=10;a.Primary.DefaultClip=10;a.Primary.Automatic=false;a.Primary.Ammo="pistol"a.Secondary.ClipSize=10;a.Secondary.DefaultClip=10;a.Secondary.Automatic=false;a.Secondary.Ammo="pistol"function a:OnDrop()end;function a:GetViewModelPosition(b,c)return b,c end;function a:TranslateActivity(d)return d end;function a:Deploy()return true end;function a:Initialize()end;function a:DrawHUD()end;function a:PrintWeaponInfo()end;function a:DrawWeaponSelection(e,f,g,h,i)end;function a:DrawWorldModel()return true end;function a:CanPrimaryAttack()return true end;function a:CanSecondaryAttack()return true end;function a:Reload()return false end;function a:Holster()return true end;function a:ShouldDropOnDie()return false end;weapons.Register(a,"pac_weapon",true)if CLIENT then local j,k=pac.PartTemplate("base")k.ClassName="weapon"j:StartStorableVars()for l,m in pairs(a)do if!istable(m)&&!isfunction(m)then j:GetSet(l,m)end end;for l,m in pairs(a.Primary)do j:GetSet("Primary"..l,m)end;for l,m in pairs(a.Secondary)do j:GetSet("Secondary"..l,m)end;j:EndStorableVars()j:Register()end
--addons/!lpakr_out/lua/pac3/extra/client/pac2_compat.lua:
local a={["pelvis"]="valvebiped.bip01_pelvis",["spine"]="valvebiped.bip01_spine",["spine 2"]="valvebiped.bip01_spine1",["spine 3"]="valvebiped.bip01_spine2",["spine 4"]="valvebiped.bip01_spine4",["neck"]="valvebiped.bip01_neck1",["head"]="valvebiped.bip01_head1",["right clavicle"]="valvebiped.bip01_r_clavicle",["right upper arm"]="valvebiped.bip01_r_upperarm",["right upperarm"]="valvebiped.bip01_r_upperarm",["right forearm"]="valvebiped.bip01_r_forearm",["right hand"]="valvebiped.bip01_r_hand",["left clavicle"]="valvebiped.bip01_l_clavicle",["left upper arm"]="valvebiped.bip01_l_upperarm",["left upperarm"]="valvebiped.bip01_l_upperarm",["left forearm"]="valvebiped.bip01_l_forearm",["left hand"]="valvebiped.bip01_l_hand",["right thigh"]="valvebiped.bip01_r_thigh",["right calf"]="valvebiped.bip01_r_calf",["right foot"]="valvebiped.bip01_r_foot",["right toe"]="valvebiped.bip01_r_toe0",["left thigh"]="valvebiped.bip01_l_thigh",["left calf"]="valvebiped.bip01_l_calf",["left foot"]="valvebiped.bip01_l_foot",["left toe"]="valvebiped.bip01_l_toe0"}local function b(c)if a[c]then return a[c]end;if!c.lower then debug.Trace()return""end;c=c:lower()for d,e in pairs(a)do if c==e then return d end end;return c end;function pacx.ConvertPAC2Config(f,g)local h={}local i=pac.CreatePart("group")i:SetName(g||"pac2 outfit")for d,f in pairs(f.parts)do if f.sprite.Enabled then local j=pac.CreatePart("sprite")j:SetParent(i)j.pac2_part=f;j:SetName(f.name.." sprite")j:SetBone(b(f.bone))j:SetColor(Vector(f.sprite.color.r,f.sprite.color.g,f.sprite.color.b))j:SetAlpha(f.sprite.color.a/255)j:SetPosition(f.offset*1)j:SetAngles(f.angles*1)j:SetMaterial(f.sprite.material)j:SetSizeX(f.sprite.x)j:SetSizeY(f.sprite.y)j:SetEyeAngles(f.eyeangles)if f.weaponclass&&f.weaponclass!=""then local k=pac.CreatePart("event")k:SetName(j.Name.." weapon class")k:SetParent(j)k:SetEvent("weapon_class")k:SetOperator("find simple")k:SetInvert(true)k:SetArguments(f.weaponclass.."@@"..(f.hideweaponclass&&"1"||"0"))end end;if f.light.Enabled then local j=pac.CreatePart("light")j:SetParent(i)j.pac2_part=f;j:SetName(f.name.." light")j:SetBone(b(f.bone))j:SetColor(Vector(f.light.r,f.light.g,f.light.b))j:SetPosition(f.offset*1)j:SetAngles(f.angles*1)j:SetBrightness(f.light.Brightness)j:SetSize(f.light.Size)if f.weaponclass&&f.weaponclass!=""then local k=pac.CreatePart("event")k:SetName(j.Name.." weapon class")k:SetParent(j)k:SetEvent("weapon_class")k:SetOperator("find simple")k:SetInvert(true)k:SetArguments(f.weaponclass.."@@"..(f.hideweaponclass&&"1"||"0"))end end;if f.text.Enabled then local j=pac.CreatePart("text")j:SetParent(i)j.pac2_part=f;j:SetName(f.name.." text")j:SetBone(b(f.bone))j:SetColor(Vector(f.text.color.r,f.text.color.g,f.text.color.b))j:SetAlpha(f.text.color.a/255)j:SetColor(Vector(f.text.outlinecolor.r,f.text.outlinecolor.g,f.text.outlinecolor.b))j:SetAlpha(f.text.outlinecolor.a/255)j:SetPosition(f.offset*1)j:SetAngles(f.angles*1)j:SetOutline(f.text.outline)j:SetText(f.text.text)j:SetFont(f.text.font)j:SetSize(f.text.size)j:SetEyeAngles(f.eyeangles)if f.weaponclass&&f.weaponclass!=""then local k=pac.CreatePart("event")k:SetName(j.Name.." weapon class")k:SetParent(j)k:SetEvent("weapon_class")k:SetOperator("find simple")k:SetInvert(true)k:SetArguments(f.weaponclass.."@@"..(f.hideweaponclass&&"1"||"0"))end end;if f.trail.Enabled then local j=pac.CreatePart("trail")j:SetParent(i)j.pac2_part=f;j:SetName(f.name.." trail")j:SetBone(b(f.bone))j:SetPosition(f.offset*1)j:SetAngles(f.angles*1)j:SetStartSize(f.trail.startsize)j:SetStartColor(Vector(f.trail.color.r,f.trail.color.g,f.trail.color.b))j:SetEndColor(Vector(f.trail.color.r,f.trail.color.g,f.trail.color.b))j:SetStartAlpha(f.trail.color.a/255)j:SetEndAlpha(f.trail.color.a/255)j:SetSpacing(0)j:SetMaterial(f.trail.material)j:SetLength(f.trail.length)if f.weaponclass&&f.weaponclass!=""then local k=pac.CreatePart("event")k:SetName(j.Name.." weapon class")k:SetParent(j)k:SetEvent("weapon_class")k:SetOperator("find simple")k:SetInvert(true)k:SetArguments(f.weaponclass.."@@"..(f.hideweaponclass&&"1"||"0"))end end;if true||f.color.a!=0&&f.size!=0&&f.scale!=vector_origin||f.effect.Enabled then local j=pac.CreatePart("model")j:SetParent(i)j.pac2_part=f;j:SetName(f.name.." model")j:SetBone(b(f.bone))j:SetMaterial(f.material)j:SetColor(Vector(f.color.r,f.color.g,f.color.b))j:SetAlpha(f.color.a/255)j:SetModel(f.model)j:SetSize(f.size)j:SetScale(f.scale*1)j:SetPosition(f.offset*1)j:SetAngles(f.angles*1)j:SetInvert(f.mirrored)j:SetFullbright(f.fullbright)j:SetEyeAngles(f.eyeangles)if f.effect.Enabled then local l=pac.CreatePart("effect")l:SetName(f.name.." effect")l:SetParent(j)l:SetBone(b(f.bone))l:SetLoop(f.effect.loop)l:SetRate(f.effect.rate)l:SetEffect(f.effect.effect)if f.weaponclass&&f.weaponclass!=""then local k=pac.CreatePart("event")k:SetName(l.Name.." weapon class")k:SetParent(l)k:SetEvent("weapon_class")k:SetOperator("find simple")k:SetInvert(true)k:SetArguments(f.weaponclass.."@@"..(f.hideweaponclass&&"1"||"0"))end end;if f.clip.Enabled then local l=j:CreatePart("clip")l:SetName(f.name.." clip")if f.clip.bone&&f.clip.bone!=""then l:SetBone(f.clip.bone)end;l:SetParent(j)l:SetPosition(f.clip.angles:Forward()*f.clip.distance)l:SetAngles(f.clip.angles*-1)end;if f.animation.Enabled then local l=j:CreatePart("animation")l:SetParent(j)l:SetName(f.name.." animation")l:SetSequenceName(f.animation.sequence||"")l:SetRate(f.animation.rate)l:SetMin(f.animation.min)l:SetMax(f.animation.max)l:SetOffset(f.animation.offset)l:SetPingPongLoop(f.animation.loopmode)j:AddChild(l)end;if f.modelbones.Enabled then j:SetBoneMerge(f.modelbones.merge)j.pac2_modelbone=f.modelbones.redirectparent;for d,c in pairs(f.modelbones.bones)do c.size=tonumber(c.size)if c.scale==Vector(1,1,1)&&c.angles==Vector(0,0,0)&&c.offset==Vector(0,0,0)&&c.size==1 then goto m end;local l=pac.CreatePart("bone")l:SetName("model bone "..j:GetName().." "..d)l:SetParent(j)l:SetBone(j:GetOwner():GetBoneName(d))l:SetScale(c.scale*1)l:SetAngles(c.angles*1)l:SetPosition(c.offset*1)l:SetSize(c.size)::m::end end;if f.weaponclass&&f.weaponclass!=""then local k=pac.CreatePart("event")k:SetName(j.Name.." weapon class")k:SetParent(j)k:SetEvent("weapon_class")k:SetOperator("find simple")k:SetInvert(true)k:SetArguments(f.weaponclass.."@@"..(f.hideweaponclass&&"1"||"0"))end end end;local j=pac.CreatePart("entity")j:SetParent(i)j:SetName("player")j:SetColor(Vector(f.player_color.r,f.player_color.g,f.player_color.b))j:SetAlpha(f.player_color.a/255)j:SetMaterial(f.player_material)j:SetScale(f.overall_scale*1)j:SetDrawWeapon(f.drawwep)for c,f in pairs(f.bones)do local k=pac.CreatePart("bone")k:SetParent(j)k:SetName(c.." bone")k:SetBone(b(c))k:SetSize(tonumber(f.size))k:SetScale(f.scale*1)k:SetPosition(f.offset*1)k:SetAngles(f.angles*1)end;for d,j in pairs(pac.GetLocalParts())do if j.pac2_part&&j.pac2_part.parent&&j.pac2_part.parent!="none"then for d,n in pairs(pac.GetLocalParts())do if n:GetName()==j.pac2_part.parent.." model"then j:SetParent(n)if n.pac2_modelbone then j:SetBone(b(n.pac2_modelbone))end end end end end;for d,j in pairs(pac.GetLocalParts())do j:SetParent(j:GetParent())end;return i end;local o={}do local function p(q,r)local s,t=q:Peek()if!s then error(string.format("Expected type ID at %s! (Got EOF)",t))else local u=decode_types[string.byte(s)]if!u then error(string.format("Unknown type ID, %s!",string.byte(s)))else return u(q,r||{0})end end end;local decode_types;decode_types={[2]=function(q,r)local s,v,t={},q:Next()r[#r+1]=s;local w=false;local d;while true do v,t=q:Peek()if v=="\1"then if w then error(string.format("Expected value to match key at %s! (Got EO Table)",t))else q:Next()return s end else if w then s[d]=p(q,r)else d=p(q,r)end;w=!w end end end,[3]=function(q,r)local s,x,v,t={},1,q:Next()r[#r+1]=s;while true do v,t=q:Peek()if v=="\1"then q:Next()return s else s[x]=p(q,r)x=x+1 end end end,[4]=function(q)q:Next()return false end,[5]=function(q)q:Next()return true end,[6]=function(q)local y,v,t,z="",q:Next()while true do v=q:Next()if!v then error(string.format("Expected \1 to end number at %s! (Got EOF!)",t))elseif v=="\1"then break else y=y..v end end;if y==""then y="0"end;local A=tonumber(y)if!A then error(string.format("Invalid number at %s! (%q)",t,y))end;return A end,[7]=function(q)local y,v,t,z="",q:Next()while true do v=q:Next()if!v then error(string.format("Expected unescaped \1 to end string at position %s! (Got EOF)",t))elseif z then if v=="\3"then y=y.."\0"else y=y..v end;z=false elseif v=="\2"then z=true elseif v=="\1"then y=string.gsub(y,"\4","\"")return y else y=y..v end end end,[8]=function(q)local B=decode_types[6](q)q:StepBack()local C=decode_types[6](q)q:StepBack()local D=decode_types[6](q)return Vector(B,C,D)end,[9]=function(q)local E=decode_types[6](q)q:StepBack()local C=decode_types[6](q)q:StepBack()local F=decode_types[6](q)return Angle(E,C,F)end,[13]=function(q)return GetConVar(decode_types[7](q))end,[15]=function(q)local F=decode_types[6](q)q:StepBack()local G=decode_types[6](q)q:StepBack()local H=decode_types[6](q)q:StepBack()local I=decode_types[6](q)return Color(F,G,H,I)end,[253]=function(q)q:Next()return-math.huge end,[254]=function(q)q:Next()return math.huge end,[255]=function(q,r)return r[decode_types[6](q)-1]end}local J={}J.__index=J;function J:Next()self.i=self.i+1;self.c=string.sub(self.s,self.i,self.i)if self.c==""then self.c=nil end;self.p=string.sub(self.s,self.i+1,self.i+1)if self.p==""then self.p=nil end;return self.c,self.i end;function J:StepBack()self.i=self.i-1;self.c=string.sub(self.s,self.i,self.i)if self.c==""then self.c=nil end;self.p=string.sub(self.s,self.i+1,self.i+1)if self.p==""then self.p=nil end;return self.c,self.i end;function J:Peek()return self.p,self.i+1 end;function o.decode(f)if f==nil then return nil elseif!isstring(f)then error(string.format("Expected string to decode! (Got type %s)",type(f)))elseif f:len()==0 then return nil end;return p(setmetatable({s=f,i=0,c=string.sub(f,0,0),p=string.sub(f,1,1)},J),{})end end;concommand.Add("pac_convert_pac2_outfits",function()if!file.IsDir("pac2_outfits","DATA")then pac.Message("garrysmod/data/pac2_outfits/ does not exist")return end;local K=select(2,file.Find("pac2_outfits/*","DATA"))if#K==0 then pac.Message("garrysmod/data/pac2_outfits/ is empty")return end;for L,M in ipairs(K)do local N=file.Read("pac2_outfits/"..M.."/__owner.txt","DATA")if!N then N=pac.LocalPlayer:Nick()pac.Message("garrysmod/data/pac2_outfits/"..M.."/__owner.txt does not exist (it contains the player nickname) defaulting to "..N)end;local K=select(2,file.Find("pac2_outfits/"..M.."/*","DATA"))if#K==0 then pac.Message("garrysmod/data/pac2_outfits/"..M.."/ is empty")return end;for L,O in ipairs(K)do local g=file.Read("pac2_outfits/"..M.."/"..O.."/name.txt","DATA")local f=file.Read("pac2_outfits/"..M.."/"..O.."/outfit.txt","DATA")if!g then pac.Message("garrysmod/data/pac2_outfits/"..M.."/"..O.."/name.txt does not exist. defaulting to: "..O)end;if f then pace.ClearParts()local P,Q=pcall(function()pacx.ConvertPAC2Config(o.decode(f),g)end)if P then file.CreateDir("pac3/pac2_outfits/")file.CreateDir("pac3/pac2_outfits/"..M.."/")pace.SaveParts("pac2_outfits/"..M.."/"..O)else pac.Message("garrysmod/data/pac2_outfits/"..M.."/"..O.."("..g..") failed to convert : "..Q)end else pac.Message("garrysmod/data/pac2_outfits/"..M.."/"..O.."/data.txt does not exist. this file contains the outfit data")end end end;pace.ClearParts()pac.Message("pac2 outfits are stored under pac > load > pac2_outfits in the editor")pac.Message("you may need to restart the editor to see them")end)
--addons/!lpakr_out/lua/casino/ui/casinojoin_ui.lua:
return lpakr()()
--addons/!lpakr_out/lua/casino/receivers_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/sh_chess.lua:
Chess=Chess||{}if SERVER then else include'chess/sh_chess.lua'include'chess/cl_chess.lua'include'chess/ui/cl_dermaboard.lua'include'chess/ui/cl_dermachesscontrol.lua'include'chess/ui/cl_dermawager.lua'include'chess/ui/cl_chesspromotion.lua'end;function Chess.AddMoney(a,b,c)if info.CWRP then a:AddMoney(b,c)else a:AddMoney(b)end end;function Chess.TakeMoney(a,b,c)if info.CWRP then a:TakeMoney(b)else a:TakeMoney(b)end end
--addons/!lpakr_out/lua/chess/sh_chess.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/wiltos_animbase_loader.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/wiltos_animbase_loader.lua:
include("wos/anim_extension/loader/loader.lua")
--addons/!lpakr_out/lua/wos/anim_extension/extensions/wos_aoc.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/anim_extension/holdtypes/melee_combo.lua:
local a={}a.Name="Melee Combination"a.HoldType="melee-combo"a.BaseHoldType="melee2"a.Translations={}a.Translations[ACT_MP_CROUCH_IDLE]=ACT_HL2MP_IDLE_CROUCH_KNIFE;a.Translations[ACT_MP_CROUCHWALK]=ACT_HL2MP_WALK_CROUCH_KNIFE;a.Translations[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE;wOS.AnimExtension:RegisterHoldtype(a)
--addons/!lpakr_out/lua/wire/wire_paths.lua:
if!WireLib then return end;if CLIENT then net.Receive("WireLib.Paths.TransmitPath",function(a)local b={Path={}}b.Entity=net.ReadEntity()if!b.Entity:IsValid()then return end;b.Name=net.ReadString()b.Width=net.ReadFloat()if b.Width<=0 then if b.Entity.WirePaths then b.Entity.WirePaths[b.Name]=nil end;return end;b.StartPos=net.ReadVector()b.Material=net.ReadString()b.Color=net.ReadColor()local c=net.ReadUInt(16)for d=1,c do b.Path[d]={Entity=net.ReadEntity(),Pos=net.ReadVector()}end;if b.Entity.WirePaths==nil then b.Entity.WirePaths={}end;b.Entity.WirePaths[b.Name]=b end)return end;WireLib.Paths={}local e=WireLib.RegisterPlayerTable(setmetatable({},{__index=function(f,g)f[g]={}return f[g]end}))util.AddNetworkString("WireLib.Paths.RequestPaths")util.AddNetworkString("WireLib.Paths.TransmitPath")net.Receive("WireLib.Paths.RequestPaths",function(a,h)local i=net.ReadEntity()if i:IsValid()&&i.Inputs then for j,k in pairs(i.Inputs)do if k.Src then WireLib.Paths.Add(k,h)end end end end)local function l(k,h)net.Start("WireLib.Paths.TransmitPath")local m=k.Color;net.WriteEntity(k.Entity)net.WriteString(k.Name)if!k.Src||k.Width<=0 then net.WriteFloat(0)else net.WriteFloat(k.Width)net.WriteVector(k.StartPos)net.WriteString(k.Material)net.WriteColor(Color(m.r||255,m.g||255,m.b||255,m.a||255))net.WriteUInt(#k.Path,16)for n,o in ipairs(k.Path)do net.WriteEntity(o.Entity)net.WriteVector(o.Pos)end end;net.Send(h)end;local function p()for h,q in pairs(e)do if h:IsValid()then local r=table.remove(q,1)if r then l(r,h)else e[h]=nil end else e[h]=nil end end;if!next(e)then timer.Remove("WireLib.Paths.ProcessQueue")end end;function WireLib.Paths.Add(k,h)if h then table.insert(e[h],k)else for n,s in pairs(s.GetAll())do table.insert(e[s],k)end end;if!timer.Exists("WireLib.Paths.ProcessQueue")then timer.Create("WireLib.Paths.ProcessQueue",0,0,p)end end
--addons/!lpakr_out/lua/wire/gates/highspeed.lua:
GateActions("Highspeed")GateActions["highspeed_write"]={name="Highspeed Write",inputs={"Clk","Memory","Address","Data"},inputtypes={"NORMAL","WIRELINK","NORMAL","NORMAL"},output=function(a,b,c,d,e)if!c then return 0 end;if!c.WriteCell then return 0 end;if b<=0 then return 0 end;d=math.floor(d)if d<0 then return 0 end;return c:WriteCell(d,e)&&1||0 end,label=function(f,b,c,d,e)return string.format("Clock:%s Memory:%s Address:%s Data:%s = %s",b,c,d,e,f)end}GateActions["highspeed_read"]={name="Highspeed Read",inputs={"Clk","Memory","Address"},inputtypes={"NORMAL","WIRELINK","NORMAL"},output=function(a,b,c,d)if b<=0 then return a.Memory||0 end;d=math.floor(d||-1)if!c||!c.ReadCell||d<0 then a.Memory=0;return 0 end;a.Memory=c:ReadCell(d)return a.Memory||0 end,label=function(f,b,c,d)return string.format("Clock:%s Memory:%s Address:%s = %s",b,c,d,f)end}GateActions()
--addons/!lpakr_out/lua/wire/gpulib.lua:
GPULib={}local a={}a.__index=a;GPULib.GPU=a;function GPULib.WireGPU(b,...)local self={entindex=b&&b:EntIndex()||0,Entity=b||NULL}setmetatable(self,a)self:Initialize(...)return self end;WireGPU=GPULib.WireGPU;function a:SetTranslucentOverride(c)self.translucent=c end;function a:GetInfo()local b=self.Entity;if!b:IsValid()then b=self.actualEntity end;if!b then return end;local d=b:GetModel()local e=WireGPU_Monitors[d]local f=b:LocalToWorld(e.offset)local g=b:LocalToWorldAngles(e.rot)return e,f,g end;if CLIENT then local h={}function GPULib.Material(i)if!h[i]then local j=Material(i)local k=j:GetString("$basetexture")local l=j:GetName()local m={["$basetexture"]=k,["$vertexcolor"]=1,["$vertexalpha"]=1}h[i]=CreateMaterial(l.."_DImage","UnlitGeneric",m)end;return h[i]end;local n=64;local o={}for p=1,n do local q={false,nil}table.insert(o,q)end;local function r()for p,s in ipairs(o)do if!s[1]then local t=s[2]if t then s[1]=true;return t else local t=GetRenderTargetEx("WireGPU_RT_"..p,1024,1024,RT_SIZE_NO_CHANGE,MATERIAL_RT_DEPTH_SEPARATE,256,0,12)if t then s[1]=true;s[2]=t;return t else s[1]=true;ErrorNoHalt("Wiremod: Render target WireGPU_RT_"..p.." could not be created!\n")end end end end;ErrorNoHalt("All render targets are in use, some wire screens may not draw!\n")return nil end;local function u(v)for p,s in pairs(o)do if s[2]==v then s[1]=false;return end end;ErrorNoHalt("RT Screen ",v," could not be freed (not found)\n")end;local w={font="lucida console",size=40,weight=800,antialias=true,additive=false}surface.CreateFont("WireGPU_ConsoleFont",w)surface.CreateFont("LCDFontBlur",{font="Alphanumeric LCD",size=26,antialias=false,blursize=1})surface.CreateFont("LCDFont",{font="Alphanumeric LCD",size=26,antialias=false})WireGPU_matScreen=CreateMaterial("sprites/GPURT","UnlitGeneric",{["$vertexcolor"]=1,["$vertexalpha"]=1,["$translucent"]=1,["$ignorez"]=1,["$nolod"]=1})WireGPU_matBuffer=CreateMaterial("sprites/GPUBUF","UnlitGeneric",{["$vertexcolor"]=1,["$vertexalpha"]=1,["$translucent"]=1,["$ignorez"]=1,["$nolod"]=1})function a:Initialize(x)if x then return nil end;if self.RT then ErrorNoHalt("Warning: GPU:Initialize called, but an RT still existed. Maybe you are not killing it properly?")u(self.RT)end;self.RT=r()if!self.RT then return nil end;self.ForceClear=true;return self.RT end;function GPULib.WireGPU(b,...)local self={entindex=b&&b:EntIndex()||0,Entity=b||NULL}setmetatable(self,a)self:Initialize(...)return self end;function a:Finalize()if!self.RT then return end;timer.Simple(0.2,function()if IsValid(self.Entity)then return end;self:FreeRT()end)end;function a:FreeRT()u(self.RT)self.RT=nil end;function a:Clear(y)if!self.RT then return end;render.ClearRenderTarget(self.RT,y||Color(0,0,0,0))end;local z={[0]={{u=0,v=0},{u=1,v=0},{u=1,v=1},{u=0,v=1}},{{u=0,v=1},{u=0,v=0},{u=1,v=0},{u=1,v=1}},{{u=1,v=1},{u=0,v=1},{u=0,v=0},{u=1,v=0}},{{u=1,v=0},{u=1,v=1},{u=0,v=1},{u=0,v=0}}}function a.DrawScreen(A,B,C,D,E,F,G,H)local I={{x=A,y=B},{x=A+C,y=B},{x=A+C,y=B+D},{x=A,y=B+D}}local J=z[E]||z[0]for K,L in ipairs(I)do local M=J[K]if M.u==0 then L.u=M.u-F else L.u=M.u+F+G end;if M.v==0 then L.v=M.v-F else L.v=M.v+F+H end end;surface.DrawPoly(I)end;function a:RenderToGPU(N)if!self.RT then return end;if self.ForceClear then self:Clear()self.ForceClear=nil end;local O=ScrW()local P=ScrH()local Q=self.RT;local R=render.GetRenderTarget()render.SetRenderTarget(Q)render.SetViewPort(0,0,1024,1024)cam.Start2D()local S,T=xpcall(N,debug.traceback)if!S then WireLib.ErrorNoHalt(T)end;cam.End2D()render.SetViewPort(0,0,O,P)render.SetRenderTarget(R)end;function a:RenderToWorld(U,V,N,W,X)local e,f,g=self:GetInfo()if W then f=f+g:Up()*W end;if X then f=f-g:Right()*(e.y2-e.y1)/2;f=f-g:Forward()*(e.x2-e.x1)/2 end;local D=U&&U*e.RatioX||V||1024;local C=U||D/e.RatioX;local A=-C/2;local B=-D/2;local Y=e.RS*1024/D;cam.Start3D2D(f,g,Y)local S,T=xpcall(N,debug.traceback,A,B,C,D,e,f,g,Y)if!S then WireLib.ErrorNoHalt(T)end;cam.End3D2D()end;function a:Render(E,F,U,V,Z,G,H)if!self.RT then return end;local e,f,g=self:GetInfo()local _=WireGPU_matScreen:GetTexture("$basetexture")WireGPU_matScreen:SetTexture("$basetexture",self.RT)local Y=e.RS;cam.Start3D2D(f,g,Y)local S,T=xpcall(function()local a0=1/e.RatioX;local C=(U||1024)*a0;local D=V||1024;local A=-C/2;local B=-D/2;local a1=self.translucent;if a1==nil then a1=e.translucent end;if!a1 then surface.SetDrawColor(0,0,0,255)surface.DrawRect(-512*a0,-512,1024*a0,1024)end;surface.SetDrawColor(255,255,255,255)surface.SetMaterial(WireGPU_matScreen)render.PushFilterMag(self.texture_filtering||TEXFILTER.POINT)render.PushFilterMin(self.texture_filtering||TEXFILTER.POINT)self.DrawScreen(A,B,C,D,E||0,F||0,G||0,H||0)render.PopFilterMin()render.PopFilterMag()if Z then Z(f,g,Y,a0,e)end end,debug.traceback)if!S then WireLib.ErrorNoHalt(T)end;cam.End3D2D()WireGPU_matScreen:SetTexture("$basetexture",_)end;local a2={}function WireGPU_NeedRenderTarget(a3)if!a2[a3]then a2[a3]=GPULib.WireGPU(Entity(a3))end;return a2[a3].RT end;function WireGPU_GetMyRenderTarget(a3)local self=a2[a3]if self.RT then return self.RT end;return self:Initialize()end;function WireGPU_ReturnRenderTarget(a3)return a2[a3]:Finalize()end;function WireGPU_DrawScreen(A,B,C,D,E,F)return a.DrawScreen(A,B,C,D,E,F)end end;if CLIENT then usermessage.Hook("wire_gpulib_setent",function(a4)local a5=Entity(a4:ReadShort())if!a5:IsValid()then return end;if!a5.GPU then return end;local b=Entity(a4:ReadShort())if!b:IsValid()then return end;a5.GPU.Entity=b;a5.GPU.entindex=b:EntIndex()if a5==b then return end;a5.GPU.actualEntity=a5;local d=b:GetModel()local e=WireGPU_Monitors[d]local D=1024*e.RS;local C=D/e.RatioX;local A=-C/2;local B=-D/2;local a6={{A,B},{A,B+D},{A+C,B},{A+C,B+D}}local a7,a8=a5:OBBMins(),a5:OBBMaxs()local a9="wire_gpulib_updatebounds"..a5:EntIndex()local function aa()if!a5:IsValid()then timer.Remove(a9)return end;if!b:IsValid()then timer.Remove(a9)a5.ExtraRBoxPoints[1001]=nil;a5.ExtraRBoxPoints[1002]=nil;a5.ExtraRBoxPoints[1003]=nil;a5.ExtraRBoxPoints[1004]=nil;Wire_UpdateRenderBounds(a5)a5.GPU.Entity=a5.GPU.actualEntity;a5.GPU.entindex=a5.GPU.actualEntity:EntIndex()a5.GPU.actualEntity=nil;return end;local g=b:LocalToWorldAngles(e.rot)local f=b:LocalToWorld(e.offset)a5.ExtraRBoxPoints=a5.ExtraRBoxPoints||{}for p,A,B in ipairs_map(a6,unpack)do local ab=Vector(A,B,0)ab:Rotate(g)ab=a5:WorldToLocal(ab+f)a5.ExtraRBoxPoints[p+1000]=ab end;Wire_UpdateRenderBounds(a5)end;timer.Create(a9,5,0,aa)aa()end)elseif SERVER then function GPULib.switchscreen(a5,b)a5.GPUEntity=b;umsg.Start("wire_gpulib_setent")umsg.Short(a5:EntIndex())umsg.Short(b:EntIndex())umsg.End()end end;if CLIENT then local ac={}function GPULib.ClientCacheCallback(b,ad)ac[b&&b:EntIndex()||0]=ad end;local function ae(a4)local af=a4:ReadLong()local a=ents.GetByIndex(af)if!a then return end;if!a:IsValid()then return end;if!ac[af]then return end;local ag=0;local ah=0;while true do ag=ag+1;if ag>256 then error("GPULib usermessage read error")return end;local ai=a4:ReadChar()+128;if ai==240 then return end;local aj=ai%4;local ak=math.floor(ai/4)%4;local al=math.floor(ai/16)%4;local am=math.floor(ai/64)%4;local an=0;local ao=0;if aj>0 then local ap=0;if aj==1 then ap=a4:ReadChar()end;if aj==2 then ap=a4:ReadShort()end;if aj==3 then ap=a4:ReadFloat()end;ah=ah+ap end;if al==0 then ao=1 end;if al==1 then ao=a4:ReadChar()+130 end;if al==2 then ao=2 end;if al==3 then ao=3 end;if ak==0 then an=1 end;if ak==1 then an=a4:ReadChar()+130 end;if ak==2 then an=2 end;if ak==3 then an=4 end;for p=1,ao do local aq=0;if am==0 then aq=a4:ReadChar()end;if am==1 then aq=a4:ReadShort()end;if am==2 then aq=a4:ReadLong()end;if am==3 then aq=a4:ReadFloat()end;for ar=1,an do ac[af](ah,aq)ah=ah+1 end end end end;usermessage.Hook("wire_memsync",ae)elseif SERVER then local as={}as.__index=as;GPULib.CACHEMGR=as;function GPULib.GPUCacheManager(b,at,...)local self={EntIndex=b&&b:EntIndex()||0,Entity=b||NULL}setmetatable(self,as)self.ValueOrderMatters=at;self.Enabled=true;self:Reset()return self end;GPUCacheManager=GPULib.GPUCacheManager;local function au(av)if av>=-128&&av<=127&&math.floor(av)==av then return 1,false end;if av>=-32768&&av<=32767&&math.floor(av)==av then return 2,false end;if av>=-2147483648&&av<=2147483647&&math.floor(av)==av then return 4,false end;return 4,true end;function as:Reset()self.Cache={}self.CacheBytes=0 end;function as:Write(aw,aq)local am,ax;if aq then am,ax=au(aq)self.CacheBytes=self.CacheBytes+am end;table.insert(self.Cache,{aw,aq,am,ax})end;function as:WriteNow(aw,aq,ay)umsg.Start("wire_memsync",ay)umsg.Long(self.EntIndex)umsg.Char(195-128)umsg.Float(aw)umsg.Float(aq)umsg.Char(240-128)umsg.End()end;function as:Flush(ay)if#self.Cache==0 then return end;self.CacheBytes=0;if!self.ValueOrderMatters then table.sort(self.Cache,function(az,aA)return az[1]<aA[1]end)end;local aB={}for aC,aD in ipairs(self.Cache)do local aE,av,aF,aG=aD[1],aD[2]||0,aD[3]||1,aD[4]||false;local aH=aB[#aB]local aI;local aJ;if aH then aJ=aH.Offset+#aH.Data*aH.Repeat;aI=aJ==aE end;if!aH then aH={Data={av},Offset=aE,SetOffset=aE,Repeat=1,Size=aF,IsFloat=aG}table.insert(aB,aH)elseif aI&&aH.Size==aF then if#aH.Data==1&&aH.Data[1]==av&&aI&&aH.Repeat<256 then aH.Repeat=aH.Repeat+1 elseif aH.Repeat>1 then aH={Data={av},Offset=aE,Repeat=1,Size=aF,IsFloat=aG}if!aI then aH.SetOffset=aE-aJ end;table.insert(aB,aH)else if#aH.Data*aH.Repeat*aH.Size<196 then table.insert(aH.Data,av)else aH={Data={av},Offset=aE,Repeat=1,Size=aF,IsFloat=aG}if!aI then aH.SetOffset=aE-aJ end;table.insert(aB,aH)end end else aH={Data={av},Offset=aE,Repeat=1,Size=aF,IsFloat=aG}if!aI then aH.SetOffset=aE-aJ end;table.insert(aB,aH)end end;local aK=4;umsg.Start("wire_memsync",ay)umsg.Long(self.EntIndex)for aL,aM in ipairs(aB)do local ai=0;if aM.SetOffset then local aj=au(aM.SetOffset)if aj==1 then ai=ai+1 end;if aj==2 then ai=ai+2 end;if aj==4 then ai=ai+3 end end;if aM.Repeat>1 then if aM.Repeat==2 then ai=ai+8 elseif aM.Repeat==4 then ai=ai+12 else ai=ai+4 end end;if#aM.Data>1 then if#aM.Data==2 then ai=ai+32 elseif#aM.Data==3&&!aM.IsFloat then ai=ai+48 else ai=ai+16 end end;if aM.Size==1 then ai=ai+0 end;if aM.Size==2 then ai=ai+64 end;if aM.Size==4&&!aM.IsFloat then ai=ai+128 end;if aM.Size==4&&aM.IsFloat then ai=ai+192 end;umsg.Char(ai-128)aK=aK+4;if aM.SetOffset then local aj=au(aM.SetOffset)if aj==1 then umsg.Char(aM.SetOffset)aK=aK+1 end;if aj==2 then umsg.Short(aM.SetOffset)aK=aK+2 end;if aj==4 then umsg.Float(aM.SetOffset)aK=aK+4 end end;if#aM.Data>2 then if#aM.Data!=3||aM.IsFloat then umsg.Char(#aM.Data-130)aK=aK+1 end end;if aM.Repeat>1&&aM.Repeat!=2&&aM.Repeat!=4 then umsg.Char(aM.Repeat-130)aK=aK+1 end;for aC,av in ipairs(aM.Data)do if aM.Size==1 then umsg.Char(av)aK=aK+1 end;if aM.Size==2 then umsg.Short(av)aK=aK+2 end;if aM.Size==4&&!aM.IsFloat then umsg.Long(av)aK=aK+4 end;if aM.Size==4&&aM.IsFloat then umsg.Float(av)aK=aK+4 end end;if aB[aL+1]then local aN=#aB[aL+1].Data*aB[aL+1].Repeat*aB[aL+1].Size;if aN+aK>248 then umsg.Char(240-128)umsg.End()aK=4;umsg.Start("wire_memsync",ay)umsg.Long(self.EntIndex)aB[aL+1].SetOffset=aB[aL+1].Offset end else umsg.Char(240-128)umsg.End()end end;self.Cache={}end end
--addons/!lpakr_out/lua/wire/client/wiredermaexts.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/rendertarget_fix.lua:
WireLib.RTFix={}local a=WireLib.RTFix;a.List={}function a:Add(b,c,d)a.List[b]={c,d}end;function a:GetAll()return a.List end;function a:Get(b)return a.List[b]end;function a:ReloadAll()for e,f in pairs(a.List)do local g=f[2]for h,i in ipairs(ents.FindByClass(e))do g(i)end end end;function a:Reload(b)local g=a.List[b][2]for e,f in ipairs(ents.FindByClass(b))do g(f)end end;concommand.Add("wire_rt_fix",function()a:ReloadAll()end)local function j(k)k:ClearControls()k:Help([[Here you can fix screens that use
rendertargets if they break due to lag.
If a screen is not on this list, it means
that either its author has not added it to
this list, the screen has its own fix, or
that no fix is necessary.
You can also use the console command
"wire_rt_fix", which does the same thing
as pressing the "All" button.]])local l=vgui.Create("DButton")l:SetText("All")function l:DoClick()a:ReloadAll()end;l:SetToolTip("Fix all RTs on the map.")k:AddItem(l)for e,f in pairs(a.List)do local l=vgui.Create("DButton")l:SetText(f[1])l:SetToolTip("Fix all "..f[1].."s on the map\n("..e..")")function l:DoClick()a:Reload(e)end;k:AddItem(l)end end;hook.Add("PopulateToolMenu","WireLib_RenderTarget_Fix",function()spawnmenu.AddToolMenuOption("Wire","Options","RTFix","Fix RenderTargets","","",j,nil)end)local function m(n,o)if n.GPU||n.GPU.RT then n.GPU:FreeRT()end;n.GPU:Initialize()if o then n[o]=true end end;a:Add("gmod_wire_consolescreen","Console Screen",function(n)m(n,"NeedRefresh")end)a:Add("gmod_wire_digitalscreen","Digital Screen",function(n)m(n,"NeedRefresh")end)a:Add("gmod_wire_oscilloscope","Oscilloscope",m)a:Add("gmod_wire_textscreen","Text Screen",function(n)m(n,"NeedRefresh")end)a:Add("gmod_wire_egp","EGP",function(n)m(n,"NeedsUpdate")end)a:Add("gmod_wire_egp_emitter","EGP Emitter",function(n)if n:GetUseRT()then m(n,"NeedsUpdate")end end)
--addons/!lpakr_out/lua/wos/advswl/config/sh_hiltwos.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/robot-boy/sh_rb655_lightsaber_presets.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/forcepowers/sh_forcepowers.lua:
wOS=wOS||{}local a={['npc_strider']=true,['npc_antlion']=true,['prop_ragdoll']=true}local b=512;local c=225;local d=25;local e=600;local f=450;local g=Vector(0,0,10)local h=Sound'lightsaber/saber_hit.wav'wOS.AvailablePowers={["Resurrect"]={name="Resurrect",icon="RES",image="wos/forceicons/heal",description="Yassssss\n",target=1,targetclass='rp_ragdoll',Upgrades={{ReviveDuration=5},{ReviveDuration=4},{ReviveDuration=3}},ActionServer=function(self,i,j,k)if!IsValid(i)then return end;local l=CurTime()if self.wOS_ResCooldown&&self.wOS_ResCooldown>l then return end;local m=self:GetForce()local n=self.MaxForce*.75;local o=k.ReviveDuration||3;if m<n then return end;local p=i:GetPlayer()if!IsValid(p)||!i:GetRevive()then return end;if p.wOS_TargetResCooldown&&p.wOS_TargetResCooldown>l then return end;local owner=self:GetOwner()if!i:RevivePlayer(owner,o)then return end;self:SetForce(math.max(0,m-n))self:SetNextAttack(0.5,true)owner:AddTalentXP(15,'forcepoints')p.wOS_TargetResCooldown=l+300;self.wOS_ResCooldown=l+180;srp.buffs.Add(owner,'forcerevive',180)end},["Strike"]={name="Strike",icon="LB",image="wos/forceicons/leap",description="Yassssss\n",target=1,ActionServer=function(self,p)local owner=self:GetOwner()if!IsValid(p)||!self:GetEnabled()then return end;if self:GetForce()<25 then return end;if self.wOS_LBCooldown&&self.wOS_LBCooldown>CurTime()then return end;local q=p:GetPos()local r=q+-p:GetForward()*55;local s=util.TraceEntityHull({start=r+g,endpos=r-g*20,filter=p},owner)if!s.Hit||s.StartSolid||math.abs(s.HitPos.z-q.z)>20 then return end;self:SetForce(self:GetForce()-25)self:SetNextAttack(0.2,true)local t=p:GetAngles()owner:SetPos(s.HitPos)owner:SetAngles(t)owner:SetEyeAngles(t)self:PlayWeaponSound("lightsaber/force_leap.wav")self.wOS_LBCooldown=CurTime()+30 end},["Force Leap"]={name="Leap",icon="L",image="wos/forceicons/leap",description="Use the force to do a powerful leap into the direction you are looking.\n\nEach level grants more jump power.\nLevel up to level 2 to receive and extra jump.",Upgrades={{LeapPower=1},{LeapPower=1.1},{LeapPower=1.15,ExtraJump=true}},ActionServer=function(self,j,j,k)local owner=self:GetOwner()if!srp.gamemaster.GetToggle('forceleap')then return end;if self:GetForce()<10 then return end;if self.wOS_Cooldown&&self.wOS_Cooldown>CurTime()then return end;self:SetForce(self:GetForce()-10)self:SetNextAttack(0.5,true)local u=b*k.LeapPower;u=u+b*owner:GetTalentPassive('ForceJumpPower')if k.ExtraJump&&owner:IsOnGround()&&!owner.wOS_DoubleJump then owner.wOS_DoubleJump=true;self.wOS_Cooldown=CurTime()+.5;srp.buffs.Add(owner,'forceleap',.5)else self.wOS_Cooldown=CurTime()+5;srp.buffs.Add(owner,'forceleap',5)end;owner:SetVelocity(owner:GetAimVector()*u+Vector(0,0,u))self:PlayWeaponSound("lightsaber/force_leap.wav")self:CallOnClient("ForceJumpAnim","")end},["Charge"]={name="Charge",icon="CH",image="wos/forceicons/charge",target=1,distance=600,description="Lunge at your enemy",ActionServer=function(self,v)if!IsValid(v)then self:SetNextAttack(0.2,true)return end;if self:GetForce()<20 then self:SetNextAttack(0.2,true)return end;local owner=self:GetOwner()local w=v:GetPos()-owner:GetPos()w=w/w:Length()owner:SetLocalVelocity(w*700+Vector(0,0,300))self:SetForce(self:GetForce()-20)self:PlayWeaponSound("lightsaber/force_leap.wav")owner:SetSequenceOverride("phalanx_a_s2_t1",5)self:SetNextAttack(1,true)self.AerialLand=true end},["Force Absorb"]={name="Absorb",icon="A",image="wos/forceicons/absorb",description="Your Absorb allows you to absorb some damage.\n\nEach level reduces force power drain during use.",Upgrades={{ForceDrain=-6,ForceHitDrain=1},{ForceDrain=-3,ForceHitDrain=.95},{ForceDrain=-2,ForceHitDrain=.9},{ForceDrain=-2,ForceHitDrain=.85}},ActionServer=function(self,j,j,k)if self:GetForce()<1 then return end;local x=k.ForceDrain||-6;self:SetForce(self:GetForce()+x)self:GetOwner():SetNWFloat("wOS.ForceAnim",CurTime()+0.5)self:SetNextAttack(0.4,true)end},["Saber Throw"]={name="Throw",icon="T",image="wos/forceicons/throw",description="Throws your lightsaber. It will return to you.",ActionServer=function(self)if self.wOS_ThrowCooldown&&self.wOS_ThrowCooldown>CurTime()then return end;if self:GetForce()<30 then return end;self:SetForce(self:GetForce()-30)self:SetEnabled(false)self:SetBladeLength(0)self:SetNextAttack(1,true)local owner=self:GetOwner()owner:DrawWorldModel(false)local v=ents.Create('ent_lightsaber_thrown')v.ThrowSpeedIncrease=owner:GetTalentPassive('ForceThrowSpeed')v.SaberDamage=200;v.WepDamageBoost=self.WepDamageBoost||0;v.DamageType=self.DamageType;v:SetModel(self:GetWorldModel())v:SetBladeID(self.Blade.internal||1)v:Spawn()v:SetBladeLength(self:GetMaxLength())v:SetMaxLength(self:GetMaxLength())v:SetCrystalColorVector(self:GetCrystalColorVector())v:SetDarkInner(self:GetDarkInner())local y=self:GetSaberPosAng()local z=owner:GetShootPos()+Vector(0,0,5)v:SetPos(y)v:SetEndPos(z+owner:GetAimVector()*600)v:SetOwner(owner)self.wOS_ThrowCooldown=owner:IsRoot()&&CurTime()||CurTime()+10;srp.buffs.Add(owner,'forcethrow',10)end},["Force Heal"]={name="Heal",icon="H",image="wos/forceicons/heal",target=1,description="Heals your target.",ActionServer=function(self,p)if!IsValid(p)||!p:Alive()then return end;if self:GetForce()<10 then return end;local owner=self:GetOwner()local A=d+d*owner:GetTalentPassive('ForceHealth')local B=EffectData()B:SetOrigin(self:GetSaberPosAng())B:SetEntity(p)util.Effect("rb655_force_heal",B,true,true)p:Heal(A,true)if!p.sparring&&p:Health()<p:GetMaxHealth()then owner:AddTalentXPCD(5,5)end;owner:SetNWFloat('wOS.ForceAnim',CurTime()+0.25)self:SetForce(self:GetForce()-3)self:SetNextAttack(0.18,true)end},["Group Heal"]={name="G-Heal",icon="GH",image="wos/forceicons/group_heal",description="Heals all around you.",ActionServer=function(self)local owner=self:GetOwner()if!IsValid(owner)||self:GetForce()<75 then return end;local C=c+c*owner:GetTalentPassive('ForceHealthRange')local D=owner:AOEHeal(C,500,true)local B=EffectData()B:SetOrigin(self:GetSaberPosAng())B:SetEntity(owner)util.Effect("rb655_force_heal",B,true,true)owner:SetNWFloat("wOS.ForceAnim",CurTime()+0.3)self:SetForce(self:GetForce()-50)end},["Cloak"]={name="Cloak",icon="C",image="wos/forceicons/cloak",description="Shrowd yourself with the force for 10 seconds",CanCloak=true,ActionServer=function(self)local owner=self:GetOwner()if self:GetForce()<50||!srp.gamemaster.GetToggle('cloaking')then return end;self:SetForce(self:GetForce()-50)self:PlayWeaponSound('lightsaber/force_leap.wav')self:SetNextAttack(0.7,true)owner:SetCloaked(true)end},["Force Reflect"]={name="Reflect",icon="FR",image="wos/forceicons/reflect",description="An eye for an eye",ActionServer=function(self)local owner=self:GetOwner()if self:GetForce()<50||!owner:IsOnGround()then return end;if owner:GetNWFloat("ReflectTime",0)>=CurTime()then return end;self:SetForce(self:GetForce()-20)self:SetNextAttack(0.5,true)self:PlayWeaponSound("lightsaber/force_leap.wav")owner:SetNWFloat("ReflectTime",CurTime()+2)end},["Rage"]={name="Rage",icon="RA",image="wos/forceicons/reflect",description="Unleash your anger",ActionServer=function(self)local owner=self:GetOwner()if self:GetForce()<50||!owner:IsOnGround()then return end;if owner:GetNWFloat("RageTime",0)>=CurTime()then return end;self:SetForce(self:GetForce()-50)self:SetNextAttack(0.7,true)self:PlayWeaponSound("lightsaber/force_leap.wav")owner:SetNWFloat("RageTime",CurTime()+10)end},["Force Choke"]={name="Choke",icon="FC",target=1,distance=600,description="Fuck",ActionServer=function(self,p,E)if!IsValid(p)||p:IsFrozen()then return end;if self.wOS_ChokeCooldown&&self.wOS_ChokeCooldown>CurTime()then return end;if p.wOS_ChokeCooldown&&p.wOS_ChokeCooldown>CurTime()then return end;if self:GetForce()<15 then return end;local owner=self:GetOwner()local F=owner:GetPos()local G=p:GetPos()p:Freeze(true)p:SetAngles((F-G):Angle())p:SetEyeAngles((F-G):Angle())local H=p:PlayAnimation('wos_force_choke')||3;p:TakeDamage(p:Health()*.30,owner,self)p.wOS_ChokeCooldown=CurTime()+30;owner:PlayAnimation('wos_cast_choke')self:SetForce(self:GetForce()-75)self.wOS_ChokeCooldown=CurTime()+10;srp.buffs.Add(owner,'forcechoke',10)local I=EffectData()I:SetStart(G)I:SetOrigin(G)I:SetNormal(p:GetUp())I:SetScale(100)I:SetMagnitude(1)util.Effect('ThumperDust',I,true,true)owner:Freeze(true)owner:AddTalentXP(5,'forcepoints')timer.Simple(H-1.5,function()if IsValid(owner)then owner:Freeze(false)elseif IsValid(p)then p:Freeze(false)end;if IsValid(self)&&IsValid(p)then p:Freeze(false)local J=EffectData()J:SetOrigin(p:EyePos())J:SetNormal(Vector(0,0,1))J:SetScale(.2)util.Effect('gdcw_whitephosphorusairburst',J,true,true)if p:Alive()then wOS.AvailablePowers['Force Push'].ActionServer(self,p,{p},{},1,100)end end end)end},["Shadow Strike"]={name="Strike",icon="SS",distance=80,image="wos/forceicons/shadow_strike",target=1,description="From the darkness it preys",ActionServer=function(self,v)local owner=self:GetOwner()if!owner:IsCloaked()then return end;if!IsValid(v)then self:SetNextAttack(0.2,true)return end;if self:GetForce()<50 then self:SetNextAttack(0.2,true)return end;owner:SetSequenceOverride("b_c3_t2",1)self:SetForce(self:GetForce()-50)owner:EmitSound("lightsaber/saber_hit_laser"..math.random(1,4)..".wav")owner:AnimResetGestureSlot(GESTURE_SLOT_CUSTOM)owner:SetAnimation(PLAYER_ATTACK1)v:TakeDamage(500,owner,self)owner:AddTalentXP(5,'forcepoints')self:SetNextAttack(0.7,true)end},["Force Pull"]={name="Pull",icon="PL",targetnpcs=true,target=3,distance=700,description="Pulls your target(s) towards you.\n\nLevel up to transfer 15 armour from them to you. They will take damage if they don't have enough armour!",Upgrades={{ArmorOnPull=false},{ArmorOnPull=true}},ActionServer=function(self,p,E,k)if self:GetForce()<#E*15 then return end;if E==0 then return end;if self.wOS_PullCooldown&&self.wOS_PullCooldown>CurTime()then return end;local K=1+(k.PullPower||0)local L=k.ArmorOnPull;local owner=self:GetOwner()local M=owner:GetPos()local N=owner:GetForward()for j,v in ipairs(E)do if!IsValid(v)||v:GetClass()=='rp_npc'then continue end;if!v:IsPlayer()then continue end;if v:IsMarkedForDeletion()then continue end;if a[v:GetClass()]then continue end;if v:IsNPC()||v:IsNextBot()then v=srp.npc.CreateMonitoredRagdoll(v,6)end;if v.wOS_TargetCooldown&&v.wOS_TargetCooldown>CurTime()then continue end;local G=v:GetPos()local O=G:Distance(M)if O>700 then continue end;if v:GetClass()=='prop_ragdoll'then local P=v:GetPhysicsObject()M.z=G.z;local Q=P:GetMass()local R=(M-G):GetNormalized()local S=(500+O*.40)*Q;if IsValid(P)then P:SetVelocity(R*S+Vector(0,0,1000))end else local T=v:GetVelocity()*2;local w=M+N*K-G;v:SetLocalVelocity(-T+w+Vector(0,0,300))if L then local U=math.Clamp(v:Armor(),0,15)local V=15-U;v:SetArmor(v:Armor()-U)owner:SetArmor(math.min(owner:Armor()+15,owner:GetMaxArmor(100)))if V>0 then v:TakeDamage(V,owner,owner)end end end;if v:IsPlayer()then v:PlayAnimation('balanced_jump',false)v.wOS_TargetCooldown=CurTime()+10 else v.wOS_TargetCooldown=CurTime()+60 end end;owner:SetNWFloat("wOS.ForceAnim",CurTime()+0.3)self:SetForce(self:GetForce()-#E*15)self:SetNextAttack(1.5,true)self:PlayWeaponSound("lightsaber/force_repulse.wav")srp.buffs.Add(owner,'forcepull',10)self.wOS_PullCooldown=CurTime()+1 end},["Force Push"]={name="Push",icon="PH",target=3,targetnpcs=true,distance=400,description="Push your target away from you.\n\nLeveling this up allows you to push them further!",Upgrades={{PushPower=1},{PushPower=1.1},{PushPower=1.1},{PushPower=1.2}},ActionServer=function(self,p,E,k,K,W)if!K&&self:GetForce()<15 then return end;K=K||1;K=K*k.PushPower;if E==0 then return end;if self.wOS_PushCooldown&&self.wOS_PushCooldown>CurTime()then return end;local owner=self:GetOwner()local M=owner:GetPos()local N=owner:GetForward()local X=owner:GetTalentPassive('ForcePullPush')for j,v in ipairs(E)do if!IsValid(v)||v:GetClass()=='rp_npc'then continue end;if!v:IsPlayer()then continue end;if a[v:GetClass()]then continue end;if v.wOS_TargetCooldown&&v.wOS_TargetCooldown>CurTime()then continue end;local G=v:GetPos()local O=G:Distance(M)if O>700 then continue end;if v:IsNPC()||v:IsNextBot()then v=srp.npc.CreateMonitoredRagdoll(v,6)end;local B=EffectData()B:SetOrigin(G+Vector(0,0,30))B:SetRadius(1500)util.Effect('rb655_force_repulse_in',B,true,true)if v:GetClass()=='prop_ragdoll'then local P=v:GetPhysicsObject()M.z=G.z;local R=(G-M):GetNormalized()if IsValid(P)then local Q=math.max(1,P:GetMass())local S=(e+O*.5)*Q;S=S+S*X;timer.Simple(.5,function()if IsValid(P)then P:SetVelocity(R*S+Vector(0,0,800))end end)end else local R=(G-M):GetNormalized()local T=v:GetVelocity()local S=f+O*.5;S=S+S*X;v:SetVelocity(-T+R*S*K+Vector(0,0,300+(W||0)))end;if v:IsPlayer()then v.wOS_TargetCooldown=CurTime()+10;if K>1 then v:PlayAnimation('b_death_stabbed',false)timer.Simple(1,function()if IsValid(v)then v:PlayAnimation('idle')end end)end else v.wOS_TargetCooldown=CurTime()+60 end end;owner:SetNWFloat("wOS.ForceAnim",CurTime()+0.3)self:PlayWeaponSound("lightsaber/force_repulse.wav")self:SetForce(self:GetForce()-15*#E)self:SetNextAttack(1.5,true)srp.buffs.Add(owner,'forcepush',10)self.wOS_PushCooldown=CurTime()+10 end},["Lightning Strike"]={name="Lightning",icon="LS",distance=600,image="wos/forceicons/lightning_strike",target=1,description="A focused charge of lightning",ActionServer=function(self,v)if!IsValid(v)then self:SetNextAttack(0.2,true)return end;if self:GetForce()<20 then self:SetNextAttack(0.2,true)return end;self:SetForce(self:GetForce()-20)local B=EffectData()B:SetOrigin(self:GetSaberPosAng())B:SetEntity(v)util.Effect("rb655_force_lighting",B,true,true)local owner=self:GetOwner()local Y=DamageInfo()Y:SetAttacker(owner||self)Y:SetInflictor(owner||self)Y:SetDamage(150)v:TakeDamageInfo(Y)owner:EmitSound(Sound("npc/strider/fire.wav"))owner:EmitSound(Sound("ambient/atmosphere/thunder1.wav"))if!self.SoundLightning then self.SoundLightning=CreateSound(owner,"lightsaber/force_lightning"..math.random(1,2)..".wav")self.SoundLightning:Play()else self.SoundLightning:Play()end;local Z={}Z.Num=1;Z.Src=owner:GetPos()+Vector(0,0,10)Z.Dir=v:GetPos()-(owner:GetPos()+Vector(0,0,10))Z.Spread=0;Z.Tracer=1;Z.Force=0;Z.Damage=0;Z.AmmoType="Pistol"Z.Entity=owner;Z.TracerName="thor_thunder"self:SetNextAttack(2,true)owner:FireBullets(Z)timer.Create("test",0.2,1,function()if self.SoundLightning then self.SoundLightning:Stop()self.SoundLightning=nil end end)end},["Advanced Cloak"]={name="Adv Cloak",icon="AC",image="wos/forceicons/advanced_cloak",description="Shrowd yourself with the force for 25 seconds",ActionServer=function(self)local owner=self:GetOwner()if self:GetForce()<50||!owner:IsOnGround()then return end;if owner:IsCloaked()||!srp.gamemaster.GetToggle('cloaking')then return end;self:SetForce(self:GetForce()-50)self:SetNextAttack(0.7,true)self:PlayWeaponSound("lightsaber/force_leap.wav")owner:SetCloaked(true)end},["Force Lightning"]={name="Shock",icon="SH",target=3,targetnpcs=true,image="wos/forceicons/lightning",description="Torture people ( and monsters ) at will.",ActionServer=function(self,p,E)if self.wOS_ShockCooldown&&self.wOS_ShockCooldown>CurTime()then return end;self.wOS_ShockCooldown=CurTime()+.1;local Y=DamageInfo()Y:SetAttacker(owner||self)Y:SetInflictor(owner||self)Y:SetDamage(4)local owner=self:GetOwner()for j,v in pairs(E)do if self:GetForce()<2 then return end;if IsValid(v)&&v.TakeDamageInfo then local B=EffectData()B:SetOrigin(self:GetSaberPosAng())B:SetEntity(v)util.Effect("rb655_force_lighting",B,true,true)if v:IsPlayer()then Y:SetDamage(v:Health()<v:GetMaxHealth()*.15&&6||2)else Y:SetDamage(v:Health()<100&&6||2)end;v:TakeDamageInfo(Y)self:SetForce(self:GetForce()-1)found=true end end;if!self.SoundLightning then self.SoundLightning=CreateSound(owner,"lightsaber/force_lightning"..math.random(1,2)..".wav")self.SoundLightning:Play()else self.SoundLightning:Play()end;timer.Create("StopLighting"..self:EntIndex(),0.2,1,function()if IsValid(self)then if self.SoundLightning then self.SoundLightning:Stop()self.SoundLightning=nil end end end)self:SetNextAttack(.1,true)end},["Force Combust"]={name="Combust",icon="C",target=1,description="Ignite stuff infront of you.",ActionServer=function(self,v)if!IsValid(v)||v:IsOnFire()then self:SetNextAttack(.2,true)return end;local _=math.Clamp(512/self:GetOwner():GetPos():Distance(v:GetPos()),1,16)local a0=math.ceil(math.Clamp(_*2,10,32))if self:GetForce()<a0 then self:SetNextAttack(0.2,true)return end;v:Ignite(_,0)owner:AddTalentXP(5,'forcepoints')self:SetForce(self:GetForce()-a0)self:SetNextAttack(1,true)end},["Force Repulse"]={name="Repulse",icon="R",description="Hold to charge for greater distance/damage.\nKill everybody close to you.\nPush back everybody who is a bit farther away but still close enough.",think=function(self)if self:GetNextSecondaryFire()>CurTime()then return end;if self:GetForce()<1 then return end;local owner=self:GetOwner()if!owner:KeyDown(IN_ATTACK2)&&!owner:KeyReleased(IN_ATTACK2)then return end;if!self._ForceRepulse&&self:GetForce()<16 then return end;local a1=math.min(128*(self._ForceRepulse||0),600)if!owner:KeyReleased(IN_ATTACK2)then if!self._ForceRepulse then self:SetForce(self:GetForce()-16)self._ForceRepulse=1 end;if!self.NextForceEffect||self.NextForceEffect<CurTime()then local B=EffectData()B:SetOrigin(owner:GetPos()+Vector(0,0,36))B:SetRadius(a1)util.Effect("rb655_force_repulse_in",B,true,true)self.NextForceEffect=CurTime()+math.Clamp(self._ForceRepulse/20,0.1,0.5)end;self._ForceRepulse=self._ForceRepulse+0.025;self:SetForce(self:GetForce()-0.5)if self:GetForce()>0.99 then return end else if!self._ForceRepulse then return end end;for a2,a3 in pairs(ents.FindInSphere(owner:GetPos(),a1))do if a3==owner then continue end;local a4=owner:GetPos():Distance(a3:GetPos())local a5=(a1-a4)/256;local a6=(owner:GetPos()-a3:GetPos()):GetNormalized()a6.z=0;if(a3:IsNextBot()||a3:IsNPC())&&util.IsValidRagdoll(a3:GetModel()||"")then local Y=DamageInfo()Y:SetDamagePosition(a3:GetPos()+a3:OBBCenter())Y:SetDamage(8*a5)Y:SetDamageType(DMG_GENERIC)if 1-a4/a1>0.8 then Y:SetDamageType(DMG_DISSOLVE)Y:SetDamage(a3:Health()*3)end;Y:SetDamageForce(-a6*math.min(a5*40000,80000))Y:SetInflictor(owner)Y:SetAttacker(owner)a3:TakeDamageInfo(Y)if a3:IsOnGround()then a3:SetVelocity(a6*a5*-2048+Vector(0,0,64))elseif!a3:IsOnGround()then a3:SetVelocity(a6*a5*-1024+Vector(0,0,64))end elseif a3:IsPlayer()&&a3:IsOnGround()then a3:SetVelocity(a6*a5*-2048+Vector(0,0,64))a3:PlayAnimation('b_death_stabbed',false)timer.Simple(1,function()if IsValid(a3)then a3:PlayAnimation('idle')end end)elseif a3:IsPlayer()&&!a3:IsOnGround()then a3:SetVelocity(a6*a5*-384+Vector(0,0,64))a3:SetVelocity(a6*a5*-2048+Vector(0,0,64))a3:PlayAnimation('b_death_stabbed',false)timer.Simple(1,function()if IsValid(a3)then a3:PlayAnimation('idle')end end)elseif a3:GetPhysicsObjectCount()>0 then for a2=0,a3:GetPhysicsObjectCount()-1 do a3:GetPhysicsObjectNum(a2):ApplyForceCenter(a6*a5*-512*math.min(a3:GetPhysicsObject():GetMass(),256)+Vector(0,0,64))end end end;local B=EffectData()B:SetOrigin(owner:GetPos()+Vector(0,0,36))B:SetRadius(a1)util.Effect('rb655_force_repulse_out',B,true,true)self._ForceRepulse=nil;self:SetNextAttack(1,true)self:PlayWeaponSound('lightsaber/force_repulse.wav')end},["Force Speed"]={name="Speed",icon="SP",description="Increases run speed by 20%",think=function(self)end},['Meditate']={name='Med',icon='M',description='Relax yourself and channel your energy',think=function(self)local owner=self:GetOwner()if!IsValid(owner)then return end;local a7=owner:KeyDown(IN_ATTACK2)local a8=owner:OnGround()local a9=!self:GetEnabled()&&!self._ForceMeditating&&a8;local aa=6-6*owner:GetTalentPassive('ForceMeditation')if a9&&a7 then self._ForceMeditating=true;self.MedCooldown=CurTime()+aa;owner:SetNWBool('IsMeditating',true)owner:SetLocalVelocity(Vector(0,0,0))owner:SetMoveType(MOVETYPE_NONE)elseif self._ForceMeditating&&(!a7||!a8)then self._ForceMeditating=false;owner:SetNWBool('IsMeditating',false)owner:SetMoveType(MOVETYPE_WALK)end;if self._ForceMeditating&&(!self.MedCooldown||self.MedCooldown<CurTime())then self.MedCooldown=CurTime()+aa;self:SetDevEnergy(self:GetDevEnergy()+15*(incr&&1.2||1))local B=EffectData()B:SetOrigin(owner:GetPos()+Vector(0,0,50))B:SetEntity(owner)util.Effect('rb655_force_heal',B,true,true)local incr=owner:IsTalentSelected'sabermeditation'owner:Heal(owner:GetMaxHealth()*(incr&&.2||.1),true)owner:AOEHeal(100,30*(incr&&1.2||1),true)end end},["Channel Hatred"]={name="Hatred",icon="HT",description="I can feel your anger",think=function(self)if self.ChannelCooldown&&self.ChannelCooldown>=CurTime()then return end;local owner=self:GetOwner()if owner:KeyDown(IN_ATTACK2)&&!self:GetEnabled()&&owner:OnGround()then self._ForceChanneling=true else self._ForceChanneling=false end;if owner:KeyReleased(IN_ATTACK2)then self.ChannelCooldown=CurTime()+3 end;if self._ForceChanneling then if!self._NextChannelHeal then self._NextChannelHeal=0 end;owner:SetNWBool("wOS.IsChanneling",true)if self._NextChannelHeal<CurTime()then owner:SetHealth(math.min(owner:Health()+owner:GetMaxHealth()*0.01,owner:GetMaxHealth()))self:SetDevEnergy(self:GetDevEnergy()+5)self._NextChannelHeal=CurTime()+3 end;owner:SetLocalVelocity(Vector(0,0,0))owner:SetMoveType(MOVETYPE_NONE)if!self.SoundChanneling then self.SoundChanneling=CreateSound(owner,"ambient/levels/citadel/field_loop1.wav")self.SoundChanneling:Play()else self.SoundChanneling:Play()end;timer.Create("wOS.HatredChannelSound",0.2,1,function()if self.SoundChanneling then self.SoundChanneling:Stop()self.SoundChanneling=nil end end)else owner:SetNWBool("wOS.IsChanneling",false)if self:GetMoveType()!=MOVETYPE_WALK&&owner:GetNWFloat("wOS.DevestatorTime",0)<CurTime()then owner:SetMoveType(MOVETYPE_WALK)end end;if owner:KeyReleased(IN_ATTACK2)then self.ChannelCooldown=CurTime()+3 end end}}for ab,ac in pairs(wOS.AvailablePowers)do ac.id=ab end
--addons/!lpakr_out/lua/advdupe2/sh_codec.lua:
local a=5;include"sh_codec_legacy.lua"AddCSLuaFile"sh_codec_legacy.lua"local pairs=pairs;local type=type;local error=error;local Vector=Vector;local Angle=Angle;local b=string.format;local c=string.char;local d=string.byte;local e=string.sub;local f=string.gsub;local g=string.find;local h=string.gmatch;local i=string.match;local j=table.concat;local k=util.Compress;local l=util.Decompress;AdvDupe2.CodecRevision=a;function AdvDupe2.GenerateDupeStamp(m)local n={}n.name=m:GetName()n.time=os.date("%I:%M %p")n.date=os.date("%d %B %Y")n.timezone=os.date("%z")hook.Call("AdvDupe2_StampGenerated",GAMEMODE,n)return n end;local function o(p)local q=""for r,s in pairs(p)do q=j{q,r,"\1",s,"\1"}end;return q.."\2"end;local t="AD2F%s\n%s\n%s"local u,v;local function w()end;local x={}for y=1,255 do x[y]=w end;local function z(p)local A=true;local B=0;for r,s in pairs(p)do B=B+1;if r!=B||x[TypeID(s)]==w then A=false;break end end;return A end;local function C(D)x[TypeID(D)](D)end;local E,u,F;x[TYPE_TABLE]=function(D)if!F[D]then u=u+1;F[D]=u else v:WriteByte(247)v:WriteShort(F[D])return end;if z(D)then v:WriteByte(254)for y,s in pairs(D)do C(s)end else v:WriteByte(255)for r,s in pairs(D)do if x[TypeID(r)]!=w&&x[TypeID(s)]!=w then C(r)C(s)end end end;v:WriteByte(246)end;x[TYPE_BOOL]=function(D)v:WriteByte(D&&253||252)end;x[TYPE_NUMBER]=function(D)v:WriteByte(251)v:WriteDouble(D)end;x[TYPE_VECTOR]=function(D)v:WriteByte(250)v:WriteDouble(D.x)v:WriteDouble(D.y)v:WriteDouble(D.z)end;x[TYPE_ANGLE]=function(D)v:WriteByte(249)v:WriteDouble(D.p)v:WriteDouble(D.y)v:WriteDouble(D.r)end;x[TYPE_STRING]=function(D)E=#D;if E<246 then v:WriteByte(E)v:Write(D)else v:WriteByte(248)v:WriteULong(E)v:Write(D)end end;local function G()v:Seek(v:Tell()-1)error(b("Couldn't find deserializer for type {typeid:%d}!",v:ReadByte()))end;local H=0;local I,J;do local K={}for y=1,255 do K[y]=G end;local function L()local M=v:ReadByte()if!M then error("Expected value, got EOF!")end;if M==0 then return nil end;return K[M]()end;I=L;K[255]=function()local N={}local r;H=H+1;local O=H;repeat r=L()if r!=nil then N[r]=L()end until r==nil;u[O]=N;return N end;K[254]=function()local N={}local r=0;local s;H=H+1;local O=H;repeat r=r+1;s=L()if s!=nil then N[r]=s end until s==nil;u[O]=N;return N end;K[253]=function()return true end;K[252]=function()return false end;K[251]=function()return v:ReadDouble()end;K[250]=function()return Vector(v:ReadDouble(),v:ReadDouble(),v:ReadDouble())end;K[249]=function()return Angle(v:ReadDouble(),v:ReadDouble(),v:ReadDouble())end;K[248]=function()local P=v:Tell()local Q=0;while v:ReadByte()!=0 do Q=Q+1 end;v:Seek(P)local R=v:Read(Q)if!R then R=""end;v:ReadByte()return R end;K[247]=function()H=H+1;return u[v:ReadShort()]end;for y=1,246 do K[y]=function()return v:Read(y)end end end;do local K={}for y=1,255 do K[y]=G end;local function L()local M=v:ReadByte()if!M then error("Expected value, got EOF!")end;return K[M]()end;J=L;K[255]=function()local N={}H=H+1;u[H]=N;for r in L do N[r]=L()end;return N end;K[254]=function()local N={}H=H+1;u[H]=N;local r=1;for s in L do N[r]=s;r=r+1 end;return N end;K[253]=function()return true end;K[252]=function()return false end;K[251]=function()return v:ReadDouble()end;K[250]=function()return Vector(v:ReadDouble(),v:ReadDouble(),v:ReadDouble())end;K[249]=function()return Angle(v:ReadDouble(),v:ReadDouble(),v:ReadDouble())end;K[248]=function()local Q=v:ReadULong()local R=v:Read(Q)if!R then R=""end;return R end;K[247]=function()return u[v:ReadShort()]end;K[246]=function()return end;for y=1,245 do K[y]=function()return v:Read(y)end end;K[0]=function()return""end end;local function S(p)u=0;F={}v=file.Open("ad2temp.txt","wb","DATA")if!v then error("Failed to open file data/ad2temp.txt for writing!")end;C(p)v:Close()v=file.Open("ad2temp.txt","rb","DATA")if!v then error("Failed to open file data/ad2temp.txt for reading!")end;local A=v:Read(v:Size())v:Close()return A end;local function T(U,L)if U==nil then error("File could not be decompressed!")return{}end;u={}H=0;v=file.Open("ad2temp.txt","wb","DATA")v:Write(U)v:Flush()v:Close()v=file.Open("ad2temp.txt","rb","DATA")local V,p=pcall(L)v:Close()if V then return p else error(p)end end;function AdvDupe2.Encode(W,q,X,...)local Y=k(S(W))q.check="\r\n\t\n"q.size=#Y;X(t:format(c(a),o(q),Y),...)end;local function Z(U)local _=U:find("\2")if!_ then error("Attempt to read AD2 file with malformed info block!")end;local q={}local a0=U:sub(1,_-1)for r,s in a0:gmatch("(.-)\1(.-)\1")do q[r]=s end;if q.check!="\r\n\t\n"then if q.check=="\10\9\10"then error("Detected AD2 file corrupted in file transfer (newlines homogenized)(when using FTP, transfer AD2 files in image/binary mode, not ASCII/text mode)!")else error("Attempt to read AD2 file with malformed info block!")end end;return q,U:sub(_+2)end;local a1={}a1[1]=AdvDupe2.LegacyDecoders[1]a1[2]=AdvDupe2.LegacyDecoders[2]a1[3]=function(a2)a2=a2:Replace("\r\r\n\t\r\n","\t\t\t\t")a2=a2:Replace("\r\n\t\n","\t\t\t\t")a2=a2:Replace("\r\n","\n")a2=a2:Replace("\t\t\t\t","\r\n\t\n")return a1[4](a2)end;a1[4]=function(a2)local q,a3=Z(a2:sub(7))return T(l(a3),I),q end;a1[5]=function(a2)local q,a3=Z(a2:sub(7))return T(l(a3),J),q end;function AdvDupe2.CheckValidDupe(W,q)if!W.HeadEnt then return false,"Missing HeadEnt table"end;if!W.Entities then return false,"Missing Entities table"end;if!W.HeadEnt.Z then return false,"Missing HeadEnt.Z"end;if!W.HeadEnt.Pos then return false,"Missing HeadEnt.Pos"end;if!W.HeadEnt.Index then return false,"Missing HeadEnt.Index"end;if!W.Entities[W.HeadEnt.Index]then return false,"Missing HeadEnt index ["..W.HeadEnt.Index.."] from Entities table"end;for a4,a5 in pairs(W.Entities)do if!a5.PhysicsObjects then return false,"Missing PhysicsObject table from Entity ["..a4 .."]["..a5.Class.."]["..a5.Model.."]"end;if!a5.PhysicsObjects[0]then return false,"Missing PhysicsObject[0] table from Entity ["..a4 .."]["..a5.Class.."]["..a5.Model.."]"end;if q.ad1 then if!a5.PhysicsObjects[0].LocalPos then return false,"Missing PhysicsObject[0].LocalPos from Entity ["..a4 .."]["..a5.Class.."]["..a5.Model.."]"end;if!a5.PhysicsObjects[0].LocalAngle then return false,"Missing PhysicsObject[0].LocalAngle from Entity ["..a4 .."]["..a5.Class.."]["..a5.Model.."]"end else if!a5.PhysicsObjects[0].Pos then return false,"Missing PhysicsObject[0].Pos from Entity ["..a4 .."]["..a5.Class.."]["..a5.Model.."]"end;if!a5.PhysicsObjects[0].Angle then return false,"Missing PhysicsObject[0].Angle from Entity ["..a4 .."]["..a5.Class.."]["..a5.Model.."]"end end end;return true,W end;function AdvDupe2.Decode(a2)local a6,a7=a2:match("^(....)(.)")if!a7 then return false,"Malformed dupe (wtf <5 chars long)!"end;a7=a7:byte()if a6!="AD2F"then if a6=="[Inf"then local V,p,q,a8=pcall(AdvDupe2.LegacyDecoders[0],a2)if V then q.ad1=true;q.size=#a2;q.revision=0;local a9=tonumber(a8.Head)||istable(p.Entities)&&next(p.Entities)if!a9 then return false,"Missing head index"end;local aa;if isstring(a8.StartPos)then local ab,ac,ad=a8.StartPos:match("^(.-),(.-),(.+)$")aa=Vector(tonumber(ab)||0,tonumber(ac)||0,tonumber(ad)||0)else aa=Vector()end;local ae;if isstring(a8.HoldPos)then ae=(tonumber(a8.HoldPos:match("^.-,.-,(.+)$"))||0)*-1 else ae=0 end;p.HeadEnt={Index=a9,Pos=aa,Z=ae}else ErrorNoHalt(p)end;if V then V,p=AdvDupe2.CheckValidDupe(p,q)end;return V,p,q,a8 else return false,"Unknown duplication format!"end elseif a7>a then return false,b("Newer codec needed. (have rev %u, need rev %u) Update Advdupe2.",a,a7)elseif a7<1 then return false,b("Attempt to use an invalid format revision (rev %d)!",a7)else local V,p,q=pcall(a1[a7],a2)if V then V,p=AdvDupe2.CheckValidDupe(p,q)end;if V then q.revision=a7 else ErrorNoHalt(p)end;return V,p,q end end;if CLIENT then concommand.Add("advdupe2_to_json",function(af,af,ag)if!ag[1]then print("Need AdvDupe2 file name argument!")return end;local ah="advdupe2/"..ag[1]local ai="advdupe2/"..string.StripExtension(ag[1])..".json"local aj=file.Open(ah,"rb","DATA")if!aj then print("File could not be read or found! ("..ah..")")return end;local ak=aj:Read(aj:Size())aj:Close()local al,p=AdvDupe2.Decode(ak)local am=file.Open(ai,"wb","DATA")if!am then print("File could not be written! ("..ai..")")return end;am:Write(util.TableToJSON(p))am:Close()print("File written! ("..ai..")")end)concommand.Add("advdupe2_from_json",function(af,af,ag)if!ag[1]then print("Need json file name argument!")return end;local ah="advdupe2/"..ag[1]local ai="advdupe2/"..string.StripExtension(ag[1])..".txt"local aj=file.Open(ah,"rb","DATA")if!aj then print("File could not be read or found! ("..ah..")")return end;local ak=aj:Read(aj:Size())aj:Close()AdvDupe2.Encode(util.JSONToTable(ak),{},function(a5)local am=file.Open(ai,"wb","DATA")if!am then print("File could not be written! ("..ai..")")return end;am:Write(a5)am:Close()print("File written! ("..ai..")")end)end)end
--gamemodes/starwarsrp/gamemode/shared.lua:
DeriveGamemode 'srp_base'

function PLAYER:GetSWVehicle()
	local viewent = self:GetViewEntity()
	if IsValid(viewent) and viewent.IsSWVehicle then
		return viewent
	end

	local vehicle = self:GetVehicle()
	if not IsValid(vehicle) then
		return
	end

	if vehicle.IsSWVehicle then
		return vehicle
	end

	local parent = vehicle:GetParent()
	if IsValid(parent) and parent.IsSWVehicle then
		return parent
	end
end
--addons/!lpakr_out/lua/dash/libraries/keybind.lua:
keybind=keybind||setmetatable({GetTable=setmetatable({},{__call=function(self)return self end})},{__call=function(self,a,b)return self.Add(a,b)end})local c;c={__tostring=function(self)return self.Name end,__eq=function(d,e)return getmetatable(d)==c&&getmetatable(e)==c&&d.Name==e.Name end}c.__index=c;c.__concat=c.__tostring;RegisterMetaTable('Keybind',c)function c:SetName(a)if self.Name then keybind.GetTable[self.Name]=nil end;keybind.GetTable[a]=self;self.Name=a;return self end;function c:GetName()return self.Name end;function c:SetKey(f)self.Key=f;return self end;function c:GetKey()return self.Key end;function c:SetCooldown(g)self.Cooldown=g;return self end;function c:GetCooldown()return self.Cooldown end;function c:SetHelp(h)self.Help=h;return self end;function c:GetHelp()return self.Help end;function c:SetClientCallback(b)self.ClientCallback=b;return self end;function c:SetSharedCallback(b)self.SharedCallback=b;return self end;function c:SetServerCallback(b)self.ServerCallback=b;return self end;function c:SetCanRun(b)self.CanRunCallback=b;return self end;function c:SetClientSide(i)self.RunOnClient=i;self.RunOnServer=!i;return self end;function c:IsClientSide()return self.RunOnClient end;function c:SetShared(j)self.RunOnClient=j;self.RunOnServer=j;return self end;function c:SetServer(k)self.RunOnClient=!k;self.RunOnServer=k;return self end;function c:IsServerSide()return self.RunOnServer end;function c:Remove()keybind.GetTable[self:GetName()]=nil end;function keybind.Add(a,l,b)b=b||function(self,m)print(m:Name()..' pressed '..l)end;local n=setmetatable({Key=l,Cooldown=0.25,RunOnClient=false,RunOnServer=true,CanRunCallback=function(self,m)return true end,ClientCallback=b,ServerCallback=b},c)n:SetName(a)return n end;function keybind.Get(a)return keybind.GetTable[a]end;function keybind.Exists(a)return keybind.GetTable[a]!=nil end;function keybind.Remove(a)keybind.GetTable[a]=nil end;function PLAYER:SetKeybindCooldown(n,o)if!self.KeybindCooldowns then self.KeybindCooldowns={}end;self.KeybindCooldowns[n:GetName()]=CurTime()+o end;function PLAYER:GetKeybindCooldown(n)return self.KeybindCooldowns&&self.KeybindCooldowns[n:GetName()]||0 end;if SERVER then elseif CLIENT then hook('PlayerButtonDown','keybind.PlayerButtonDown',function(m,l)if!IsFirstTimePredicted()then return end;for p,n in pairs(keybind.GetTable())do if n:GetKey()==l&&m:GetKeybindCooldown(n)<CurTime()&&n:CanRunCallback(m)then m:SetKeybindCooldown(n,n:GetCooldown())if n:IsServerSide()then net.Start'keybind.Run'net.WriteString(n:GetName())net.SendToServer()end;if n:IsClientSide()then n:ClientCallback(m)end end end end)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/cmd_sh.lua:
local a={[cmd.ERROR_MISSING_PARAM]=true,[cmd.ERROR_INVALID_PLAYER]=true,[cmd.ERROR_INVALID_NUMBER]=true,[cmd.ERROR_INVALID_TIME]=true,[cmd.ERROR_COMMAND_COOLDOWN]=true}local b={}local c='ssrp'function srp.AddCommand(d,e)return cmd.Add(d,e):SetConCommand(c)end;function srp.AddClientCommand(d,e)return cmd.Add(d):SetConCommand(c):RunOnClient(e)end;function srp.GetHelpCommands()return b end;local f=FindMetaTable'Chat'function f:SetBlockable()self.blockable=true;return self end;function f:GetBlockable()return self.blockable end;local g=FindMetaTable'Command'function g:SetChatCommand()self.ChatCommand=true;return self end;function g:IsChatCommand()return self.ChatCommand==true end;function g:SetGM(h)self.gamemaster=true;self.gamemasterLite=h;return self end;function g:SetSuppressable(i)self.CanBeSuppressed=i||'communications'return self end;function g:GetSuppressable()return self.CanBeSuppressed end;function g:SetInfoSection(j)self.InfoSection=j;return self end;function g:GetInfoSection()return self.InfoSection||'Chat'end;function g:SetInfo(k)local l=self:GetInfoSection()b[l]=b[l]||{}b[l][self.Name]=self;self.Info=k;return self end;function g:GetInfo()return self.Info end;function g:SetInfoArgs(m)self.InfoArgs=m;return self end;function g:GetInfoArgs()return self.InfoArgs end;function g:SetTrainer()self.Trainer=true;return self end;function g:HasTrainer(n)if!self.Trainer then return true end;local o=n:GetGroupRank()if n:IsTrainer()||o&&o:HasPermission('train')then return true else return false end end;function g:SetAlive()self.Life=true;return self end;function g:HasLife(n)return!self.Life||n:Alive()end;function g:SetUseJailed()self.IgnoreJailChat=true;return self end;function g:HasJailChat()return self.IgnoreJailChat end;function g:SetEnforcement(p)self.Enforcement=true;self.EnforcementOfficer=p;return self end;function g:GetEnforcement()return self.Enforcement,self.EnforcementOfficer end;hook('cmd.OnCommandError',function(q,r,s,t)if a[s]&&r:GetConCommand()==c then srp.notif.Warning(q,3,term.Get(s),unpack(t))end end)hook('cmd.CanRunCommand',function(q,r,m)if!IsValid(q)then return end;if r:IsChatCommand()&&q:IsChatMuted()then return false end;if!r:HasLife(q)then return false end;if!r:HasTrainer(q)then return false end;if q:IsOppressed()&&!r:HasJailChat()then return false end;local u,v=r:GetEnforcement()if u&&!q:IsEnforcement(nil,nil,v)then return false end;local w=r:IsChatCommand()&&r:GetSuppressable()if w then local x=srp.gamemaster.GetToggle(w)if!q:CanCommunicate()||(srp.funcmodules[w]==false||!x)then srp.notif.Warning(q,3,term.Get('ChatSuppressed'))return false end end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/string_sh.lua:
local a=getmetatable("")local tostring=tostring;local isfunction=isfunction;local isstring=isstring;local Format=Format;local b={['&#039;']='\'',['&Tab;']=' ',['&NewLine;']='\n',['&excl;']='!',['&QUOT;']='"',['&QUOT']='"',['&quot;']='"',['&quot']='"',['&num;']='#',['&dollar;']='$',['&percnt;']='%%',['&AMP;']='&',['&AMP']='&',['&amp;']='&',['&amp']='&',['&apos;']="'",['&lpar;']='(',['&rpar;']=')',['&ast;']='*',['&midast;']='*',['&plus;']='+',['&comma;']=',',['&period;']='.',['&sol;']='/',['&colon;']=':',['&semi;']=';',['&LT;']='<',['&LT']='<',['&lt;']='<',['&lt']='<',['&nvlt;']='<⃒',['&equals;']='=',['&bne;']='=⃥',['&GT;']='>',['&GT']='>',['&gt;']='>',['&gt']='>',['&nvgt;']='>⃒',['&quest;']='?',['&commat;']='@',['&lbrack;']='[',['&lsqb;']='[',['&bsol;']='\\',['&rbrack;']=']',['&rsqb;']=']',['&Hat;']='^',['&UnderBar;']='_',['&lowbar;']='_',['&DiacriticalGrave;']='`',['&grave;']='`',['&fjlig;']='fj',['&lbrace;']='{',['&lcub;']='{',['&VerticalLine;']='|',['&verbar;']='|',['&vert;']='|',['&rbrace;']='}',['&rcub;']='}',['&NonBreakingSpace;']=' ',['&nbsp;']=' ',['&nbsp']=' ',['&iexcl;']='¡',['&iexcl']='¡',['&cent;']='¢',['&cent']='¢',['&pound;']='£',['&pound']='£',['&curren;']='¤',['&curren']='¤',['&yen;']='¥',['&yen']='¥',['&brvbar;']='¦',['&brvbar']='¦',['&sect;']='§',['&sect']='§',['&Dot;']='¨',['&DoubleDot;']='¨',['&die;']='¨',['&uml;']='¨',['&uml']='¨',['&COPY;']='©',['&COPY']='©',['&copy;']='©',['&copy']='©',['&ordf;']='ª',['&ordf']='ª',['&laquo;']='«',['&laquo']='«',['&not;']='¬',['&not']='¬',['&shy;']='­',['&shy']='­',['&REG;']='®',['&REG']='®',['&circledR;']='®',['&reg;']='®',['&reg']='®',['&macr;']='¯',['&macr']='¯',['&strns;']='¯',['&deg;']='°',['&deg']='°',['&PlusMinus;']='±',['&plusmn;']='±',['&plusmn']='±',['&pm;']='±',['&sup2;']='²',['&sup2']='²',['&sup3;']='³',['&sup3']='³',['&DiacriticalAcute;']='´',['&acute;']='´',['&acute']='´',['&micro;']='µ',['&micro']='µ',['&para;']='¶',['&para']='¶',['&CenterDot;']='·',['&centerdot;']='·',['&middot;']='·',['&middot']='·',['&Cedilla;']='¸',['&cedil;']='¸',['&cedil']='¸',['&sup1;']='¹',['&sup1']='¹',['&ordm;']='º',['&ordm']='º',['&raquo;']='»',['&raquo']='»',['&frac14;']='¼',['&frac14']='¼',['&frac12;']='½',['&frac12']='½',['&half;']='½',['&frac34;']='¾',['&frac34']='¾',['&iquest;']='¿',['&iquest']='¿',['&Agrave;']='À',['&Agrave']='À',['&Aacute;']='Á',['&Aacute']='Á',['&Acirc;']='Â',['&Acirc']='Â',['&Atilde;']='Ã',['&Atilde']='Ã',['&Auml;']='Ä',['&Auml']='Ä',['&Aring;']='Å',['&Aring']='Å',['&angst;']='Å',['&AElig;']='Æ',['&AElig']='Æ',['&Ccedil;']='Ç',['&Ccedil']='Ç',['&Egrave;']='È',['&Egrave']='È',['&Eacute;']='É',['&Eacute']='É',['&Ecirc;']='Ê',['&Ecirc']='Ê',['&Euml;']='Ë',['&Euml']='Ë',['&Igrave;']='Ì',['&Igrave']='Ì',['&Iacute;']='Í',['&Iacute']='Í',['&Icirc;']='Î',['&Icirc']='Î',['&Iuml;']='Ï',['&Iuml']='Ï',['&ETH;']='Ð',['&ETH']='Ð',['&Ntilde;']='Ñ',['&Ntilde']='Ñ',['&Ograve;']='Ò',['&Ograve']='Ò',['&Oacute;']='Ó',['&Oacute']='Ó',['&Ocirc;']='Ô',['&Ocirc']='Ô',['&Otilde;']='Õ',['&Otilde']='Õ',['&Ouml;']='Ö',['&Ouml']='Ö',['&times;']='×',['&times']='×',['&Oslash;']='Ø',['&Oslash']='Ø',['&Ugrave;']='Ù',['&Ugrave']='Ù',['&Uacute;']='Ú',['&Uacute']='Ú',['&Ucirc;']='Û',['&Ucirc']='Û',['&Uuml;']='Ü',['&Uuml']='Ü',['&Yacute;']='Ý',['&Yacute']='Ý',['&THORN;']='Þ',['&THORN']='Þ',['&szlig;']='ß',['&szlig']='ß',['&agrave;']='à',['&agrave']='à',['&aacute;']='á',['&aacute']='á',['&acirc;']='â',['&acirc']='â',['&atilde;']='ã',['&atilde']='ã',['&auml;']='ä',['&auml']='ä',['&aring;']='å',['&aring']='å',['&aelig;']='æ',['&aelig']='æ',['&ccedil;']='ç',['&ccedil']='ç',['&egrave;']='è',['&egrave']='è',['&eacute;']='é',['&eacute']='é',['&ecirc;']='ê',['&ecirc']='ê',['&euml;']='ë',['&euml']='ë',['&igrave;']='ì',['&igrave']='ì',['&iacute;']='í',['&iacute']='í',['&icirc;']='î',['&icirc']='î',['&iuml;']='ï',['&iuml']='ï',['&eth;']='ð',['&eth']='ð',['&ntilde;']='ñ',['&ntilde']='ñ',['&ograve;']='ò',['&ograve']='ò',['&oacute;']='ó',['&oacute']='ó',['&ocirc;']='ô',['&ocirc']='ô',['&otilde;']='õ',['&otilde']='õ',['&ouml;']='ö',['&ouml']='ö',['&div;']='÷',['&divide;']='÷',['&divide']='÷',['&oslash;']='ø',['&oslash']='ø',['&ugrave;']='ù',['&ugrave']='ù',['&uacute;']='ú',['&uacute']='ú',['&ucirc;']='û',['&ucirc']='û',['&uuml;']='ü',['&uuml']='ü',['&yacute;']='ý',['&yacute']='ý',['&thorn;']='þ',['&thorn']='þ',['&yuml;']='ÿ',['&yuml']='ÿ',['&Amacr;']='Ā',['&amacr;']='ā',['&Abreve;']='Ă',['&abreve;']='ă',['&Aogon;']='Ą',['&aogon;']='ą',['&Cacute;']='Ć',['&cacute;']='ć',['&Ccirc;']='Ĉ',['&ccirc;']='ĉ',['&Cdot;']='Ċ',['&cdot;']='ċ',['&Ccaron;']='Č',['&ccaron;']='č',['&Dcaron;']='Ď',['&dcaron;']='ď',['&Dstrok;']='Đ',['&dstrok;']='đ',['&Emacr;']='Ē',['&emacr;']='ē',['&Edot;']='Ė',['&edot;']='ė',['&Eogon;']='Ę',['&eogon;']='ę',['&Ecaron;']='Ě',['&ecaron;']='ě',['&Gcirc;']='Ĝ',['&gcirc;']='ĝ',['&Gbreve;']='Ğ',['&gbreve;']='ğ',['&Gdot;']='Ġ',['&gdot;']='ġ',['&Gcedil;']='Ģ',['&Hcirc;']='Ĥ',['&hcirc;']='ĥ',['&Hstrok;']='Ħ',['&hstrok;']='ħ',['&Itilde;']='Ĩ',['&itilde;']='ĩ',['&Imacr;']='Ī',['&imacr;']='ī',['&Iogon;']='Į',['&iogon;']='į',['&Idot;']='İ',['&imath;']='ı',['&inodot;']='ı',['&IJlig;']='Ĳ',['&ijlig;']='ĳ',['&Jcirc;']='Ĵ',['&jcirc;']='ĵ',['&Kcedil;']='Ķ',['&kcedil;']='ķ',['&kgreen;']='ĸ',['&Lacute;']='Ĺ',['&lacute;']='ĺ',['&Lcedil;']='Ļ',['&lcedil;']='ļ',['&Lcaron;']='Ľ',['&lcaron;']='ľ',['&Lmidot;']='Ŀ',['&lmidot;']='ŀ',['&Lstrok;']='Ł',['&lstrok;']='ł',['&Nacute;']='Ń',['&nacute;']='ń',['&Ncedil;']='Ņ',['&ncedil;']='ņ',['&Ncaron;']='Ň',['&ncaron;']='ň',['&napos;']='ŉ',['&ENG;']='Ŋ',['&eng;']='ŋ',['&Omacr;']='Ō',['&omacr;']='ō',['&Odblac;']='Ő',['&odblac;']='ő',['&OElig;']='Œ',['&oelig;']='œ',['&Racute;']='Ŕ',['&racute;']='ŕ',['&Rcedil;']='Ŗ',['&rcedil;']='ŗ',['&Rcaron;']='Ř',['&rcaron;']='ř',['&Sacute;']='Ś',['&sacute;']='ś',['&Scirc;']='Ŝ',['&scirc;']='ŝ',['&Scedil;']='Ş',['&scedil;']='ş',['&Scaron;']='Š',['&scaron;']='š',['&Tcedil;']='Ţ',['&tcedil;']='ţ',['&Tcaron;']='Ť',['&tcaron;']='ť',['&Tstrok;']='Ŧ',['&tstrok;']='ŧ',['&Utilde;']='Ũ',['&utilde;']='ũ',['&Umacr;']='Ū',['&umacr;']='ū',['&Ubreve;']='Ŭ',['&ubreve;']='ŭ',['&Uring;']='Ů',['&uring;']='ů',['&Udblac;']='Ű',['&udblac;']='ű',['&Uogon;']='Ų',['&uogon;']='ų',['&Wcirc;']='Ŵ',['&wcirc;']='ŵ',['&Ycirc;']='Ŷ',['&ycirc;']='ŷ',['&Yuml;']='Ÿ',['&Zacute;']='Ź',['&zacute;']='ź',['&Zdot;']='Ż',['&zdot;']='ż',['&Zcaron;']='Ž',['&zcaron;']='ž',['&fnof;']='ƒ',['&imped;']='Ƶ',['&gacute;']='ǵ',['&jmath;']='ȷ',['&circ;']='ˆ',['&Hacek;']='ˇ',['&caron;']='ˇ',['&Breve;']='˘',['&breve;']='˘',['&DiacriticalDot;']='˙',['&dot;']='˙',['&ring;']='˚',['&ogon;']='˛',['&DiacriticalTilde;']='˜',['&tilde;']='˜',['&DiacriticalDoubleAcute;']='˝',['&dblac;']='˝',['&DownBreve;']='̑',['&Alpha;']='Α',['&Beta;']='Β',['&Gamma;']='Γ',['&Delta;']='Δ',['&Epsilon;']='Ε',['&Zeta;']='Ζ',['&Eta;']='Η',['&Theta;']='Θ',['&Iota;']='Ι',['&Kappa;']='Κ',['&Lambda;']='Λ',['&Mu;']='Μ',['&Nu;']='Ν',['&Xi;']='Ξ',['&Omicron;']='Ο',['&Pi;']='Π',['&Rho;']='Ρ',['&Sigma;']='Σ',['&Tau;']='Τ',['&Upsilon;']='Υ',['&Phi;']='Φ',['&Chi;']='Χ',['&Psi;']='Ψ',['&Omega;']='Ω',['&ohm;']='Ω',['&alpha;']='α',['&beta;']='β',['&gamma;']='γ',['&delta;']='δ',['&epsi;']='ε',['&epsilon;']='ε',['&zeta;']='ζ',['&eta;']='η',['&theta;']='θ',['&iota;']='ι',['&kappa;']='κ',['&lambda;']='λ',['&mu;']='μ',['&nu;']='ν',['&xi;']='ξ',['&omicron;']='ο',['&pi;']='π',['&rho;']='ρ',['&sigmaf;']='ς',['&sigmav;']='ς',['&varsigma;']='ς',['&sigma;']='σ',['&tau;']='τ',['&upsi;']='υ',['&upsilon;']='υ',['&phi;']='φ',['&chi;']='χ',['&psi;']='ψ',['&omega;']='ω',['&thetasym;']='ϑ',['&thetav;']='ϑ',['&vartheta;']='ϑ',['&Upsi;']='ϒ',['&upsih;']='ϒ',['&phiv;']='ϕ',['&straightphi;']='ϕ',['&varphi;']='ϕ',['&piv;']='ϖ',['&varpi;']='ϖ',['&Gammad;']='Ϝ',['&digamma;']='ϝ',['&gammad;']='ϝ',['&kappav;']='ϰ',['&varkappa;']='ϰ',['&rhov;']='ϱ',['&varrho;']='ϱ',['&epsiv;']='ϵ',['&straightepsilon;']='ϵ',['&varepsilon;']='ϵ',['&backepsilon;']='϶',['&bepsi;']='϶',['&IOcy;']='Ё',['&DJcy;']='Ђ',['&GJcy;']='Ѓ',['&Jukcy;']='Є',['&DScy;']='Ѕ',['&Iukcy;']='І',['&YIcy;']='Ї',['&Jsercy;']='Ј',['&LJcy;']='Љ',['&NJcy;']='Њ',['&TSHcy;']='Ћ',['&KJcy;']='Ќ',['&Ubrcy;']='Ў',['&DZcy;']='Џ',['&Acy;']='А',['&Bcy;']='Б',['&Vcy;']='В',['&Gcy;']='Г',['&Dcy;']='Д',['&IEcy;']='Е',['&ZHcy;']='Ж',['&Zcy;']='З',['&Icy;']='И',['&Jcy;']='Й',['&Kcy;']='К',['&Lcy;']='Л',['&Mcy;']='М',['&Ncy;']='Н',['&Ocy;']='О',['&Pcy;']='П',['&Rcy;']='Р',['&Scy;']='С',['&Tcy;']='Т',['&Ucy;']='У',['&Fcy;']='Ф',['&KHcy;']='Х',['&TScy;']='Ц',['&CHcy;']='Ч',['&SHcy;']='Ш',['&SHCHcy;']='Щ',['&HARDcy;']='Ъ',['&Ycy;']='Ы',['&SOFTcy;']='Ь',['&Ecy;']='Э',['&YUcy;']='Ю',['&YAcy;']='Я',['&acy;']='а',['&bcy;']='б',['&vcy;']='в',['&gcy;']='г',['&dcy;']='д',['&iecy;']='е',['&zhcy;']='ж',['&zcy;']='з',['&icy;']='и',['&jcy;']='й',['&kcy;']='к',['&lcy;']='л',['&mcy;']='м',['&ncy;']='н',['&ocy;']='о',['&pcy;']='п',['&rcy;']='р',['&scy;']='с',['&tcy;']='т',['&ucy;']='у',['&fcy;']='ф',['&khcy;']='х',['&tscy;']='ц',['&chcy;']='ч',['&shcy;']='ш',['&shchcy;']='щ',['&hardcy;']='ъ',['&ycy;']='ы',['&softcy;']='ь',['&ecy;']='э',['&yucy;']='ю',['&yacy;']='я',['&iocy;']='ё',['&djcy;']='ђ',['&gjcy;']='ѓ',['&jukcy;']='є',['&dscy;']='ѕ',['&iukcy;']='і',['&yicy;']='ї',['&jsercy;']='ј',['&ljcy;']='љ',['&njcy;']='њ',['&tshcy;']='ћ',['&kjcy;']='ќ',['&ubrcy;']='ў',['&dzcy;']='џ',['&ensp;']=' ',['&emsp;']=' ',['&emsp13;']=' ',['&emsp14;']=' ',['&numsp;']=' ',['&puncsp;']=' ',['&ThinSpace;']=' ',['&thinsp;']=' ',['&VeryThinSpace;']=' ',['&hairsp;']=' ',['&NegativeMediumSpace;']='​',['&NegativeThickSpace;']='​',['&NegativeThinSpace;']='​',['&NegativeVeryThinSpace;']='​',['&ZeroWidthSpace;']='​',['&zwnj;']='‌',['&zwj;']='‍',['&lrm;']='‎',['&rlm;']='‏',['&dash;']='‐',['&hyphen;']='‐',['&ndash;']='–',['&mdash;']='—',['&horbar;']='―',['&Verbar;']='‖',['&Vert;']='‖',['&OpenCurlyQuote;']='‘',['&lsquo;']='‘',['&CloseCurlyQuote;']='’',['&rsquo;']='’',['&rsquor;']='’',['&lsquor;']='‚',['&sbquo;']='‚',['&OpenCurlyDoubleQuote;']='“',['&ldquo;']='“',['&CloseCurlyDoubleQuote;']='”',['&rdquo;']='”',['&rdquor;']='”',['&bdquo;']='„',['&ldquor;']='„',['&dagger;']='†',['&Dagger;']='‡',['&ddagger;']='‡',['&bull;']='•',['&bullet;']='•',['&nldr;']='‥',['&hellip;']='…',['&mldr;']='…',['&permil;']='‰',['&pertenk;']='‱',['&prime;']='′',['&Prime;']='″',['&tprime;']='‴',['&backprime;']='‵',['&bprime;']='‵',['&lsaquo;']='‹',['&rsaquo;']='›',['&OverBar;']='‾',['&oline;']='‾',['&caret;']='⁁',['&hybull;']='⁃',['&frasl;']='⁄',['&bsemi;']='⁏',['&qprime;']='⁗',['&MediumSpace;']=' ',['&ThickSpace;']='  ',['&NoBreak;']='⁠',['&ApplyFunction;']='⁡',['&af;']='⁡',['&InvisibleTimes;']='⁢',['&it;']='⁢',['&InvisibleComma;']='⁣',['&ic;']='⁣',['&euro;']='€',['&TripleDot;']='⃛',['&tdot;']='⃛',['&DotDot;']='⃜',['&Copf;']='ℂ',['&complexes;']='ℂ',['&incare;']='℅',['&gscr;']='ℊ',['&HilbertSpace;']='ℋ',['&Hscr;']='ℋ',['&hamilt;']='ℋ',['&Hfr;']='ℌ',['&Poincareplane;']='ℌ',['&Hopf;']='ℍ',['&quaternions;']='ℍ',['&planckh;']='ℎ',['&hbar;']='ℏ',['&hslash;']='ℏ',['&planck;']='ℏ',['&plankv;']='ℏ',['&Iscr;']='ℐ',['&imagline;']='ℐ',['&Ifr;']='ℑ',['&Im;']='ℑ',['&image;']='ℑ',['&imagpart;']='ℑ',['&Laplacetrf;']='ℒ',['&Lscr;']='ℒ',['&lagran;']='ℒ',['&ell;']='ℓ',['&Nopf;']='ℕ',['&naturals;']='ℕ',['&numero;']='№',['&copysr;']='℗',['&weierp;']='℘',['&wp;']='℘',['&Popf;']='ℙ',['&primes;']='ℙ',['&Qopf;']='ℚ',['&rationals;']='ℚ',['&Rscr;']='ℛ',['&realine;']='ℛ',['&Re;']='ℜ',['&Rfr;']='ℜ',['&real;']='ℜ',['&realpart;']='ℜ',['&Ropf;']='ℝ',['&reals;']='ℝ',['&rx;']='℞',['&TRADE;']='™',['&trade;']='™',['&Zopf;']='ℤ',['&integers;']='ℤ',['&mho;']='℧',['&Zfr;']='ℨ',['&zeetrf;']='ℨ',['&iiota;']='℩',['&Bernoullis;']='ℬ',['&Bscr;']='ℬ',['&bernou;']='ℬ',['&Cayleys;']='ℭ',['&Cfr;']='ℭ',['&escr;']='ℯ',['&Escr;']='ℰ',['&expectation;']='ℰ',['&Fouriertrf;']='ℱ',['&Fscr;']='ℱ',['&Mellintrf;']='ℳ',['&Mscr;']='ℳ',['&phmmat;']='ℳ',['&order;']='ℴ',['&orderof;']='ℴ',['&oscr;']='ℴ',['&alefsym;']='ℵ',['&aleph;']='ℵ',['&beth;']='ℶ',['&gimel;']='ℷ',['&daleth;']='ℸ',['&CapitalDifferentialD;']='ⅅ',['&DD;']='ⅅ',['&DifferentialD;']='ⅆ',['&dd;']='ⅆ',['&ExponentialE;']='ⅇ',['&ee;']='ⅇ',['&exponentiale;']='ⅇ',['&ImaginaryI;']='ⅈ',['&ii;']='ⅈ',['&frac13;']='⅓',['&frac23;']='⅔',['&frac15;']='⅕',['&frac25;']='⅖',['&frac35;']='⅗',['&frac45;']='⅘',['&frac16;']='⅙',['&frac56;']='⅚',['&frac18;']='⅛',['&frac38;']='⅜',['&frac58;']='⅝',['&frac78;']='⅞',['&LeftArrow;']='←',['&ShortLeftArrow;']='←',['&larr;']='←',['&leftarrow;']='←',['&slarr;']='←',['&ShortUpArrow;']='↑',['&UpArrow;']='↑',['&uarr;']='↑',['&uparrow;']='↑',['&RightArrow;']='→',['&ShortRightArrow;']='→',['&rarr;']='→',['&rightarrow;']='→',['&srarr;']='→',['&DownArrow;']='↓',['&ShortDownArrow;']='↓',['&darr;']='↓',['&downarrow;']='↓',['&LeftRightArrow;']='↔',['&harr;']='↔',['&leftrightarrow;']='↔',['&UpDownArrow;']='↕',['&updownarrow;']='↕',['&varr;']='↕',['&UpperLeftArrow;']='↖',['&nwarr;']='↖',['&nwarrow;']='↖',['&UpperRightArrow;']='↗',['&nearr;']='↗',['&nearrow;']='↗',['&LowerRightArrow;']='↘',['&searr;']='↘',['&searrow;']='↘',['&LowerLeftArrow;']='↙',['&swarr;']='↙',['&swarrow;']='↙',['&nlarr;']='↚',['&nleftarrow;']='↚',['&nrarr;']='↛',['&nrightarrow;']='↛',['&rarrw;']='↝',['&rightsquigarrow;']='↝',['&nrarrw;']='↝̸',['&Larr;']='↞',['&twoheadleftarrow;']='↞',['&Uarr;']='↟',['&Rarr;']='↠',['&twoheadrightarrow;']='↠',['&Darr;']='↡',['&larrtl;']='↢',['&leftarrowtail;']='↢',['&rarrtl;']='↣',['&rightarrowtail;']='↣',['&LeftTeeArrow;']='↤',['&mapstoleft;']='↤',['&UpTeeArrow;']='↥',['&mapstoup;']='↥',['&RightTeeArrow;']='↦',['&map;']='↦',['&mapsto;']='↦',['&DownTeeArrow;']='↧',['&mapstodown;']='↧',['&hookleftarrow;']='↩',['&larrhk;']='↩',['&hookrightarrow;']='↪',['&rarrhk;']='↪',['&larrlp;']='↫',['&looparrowleft;']='↫',['&looparrowright;']='↬',['&rarrlp;']='↬',['&harrw;']='↭',['&leftrightsquigarrow;']='↭',['&nharr;']='↮',['&nleftrightarrow;']='↮',['&Lsh;']='↰',['&lsh;']='↰',['&Rsh;']='↱',['&rsh;']='↱',['&ldsh;']='↲',['&rdsh;']='↳',['&crarr;']='↵',['&cularr;']='↶',['&curvearrowleft;']='↶',['&curarr;']='↷',['&curvearrowright;']='↷',['&circlearrowleft;']='↺',['&olarr;']='↺',['&circlearrowright;']='↻',['&orarr;']='↻',['&LeftVector;']='↼',['&leftharpoonup;']='↼',['&lharu;']='↼',['&DownLeftVector;']='↽',['&leftharpoondown;']='↽',['&lhard;']='↽',['&RightUpVector;']='↾',['&uharr;']='↾',['&upharpoonright;']='↾',['&LeftUpVector;']='↿',['&uharl;']='↿',['&upharpoonleft;']='↿',['&RightVector;']='⇀',['&rharu;']='⇀',['&rightharpoonup;']='⇀',['&DownRightVector;']='⇁',['&rhard;']='⇁',['&rightharpoondown;']='⇁',['&RightDownVector;']='⇂',['&dharr;']='⇂',['&downharpoonright;']='⇂',['&LeftDownVector;']='⇃',['&dharl;']='⇃',['&downharpoonleft;']='⇃',['&RightArrowLeftArrow;']='⇄',['&rightleftarrows;']='⇄',['&rlarr;']='⇄',['&UpArrowDownArrow;']='⇅',['&udarr;']='⇅',['&LeftArrowRightArrow;']='⇆',['&leftrightarrows;']='⇆',['&lrarr;']='⇆',['&leftleftarrows;']='⇇',['&llarr;']='⇇',['&upuparrows;']='⇈',['&uuarr;']='⇈',['&rightrightarrows;']='⇉',['&rrarr;']='⇉',['&ddarr;']='⇊',['&downdownarrows;']='⇊',['&ReverseEquilibrium;']='⇋',['&leftrightharpoons;']='⇋',['&lrhar;']='⇋',['&Equilibrium;']='⇌',['&rightleftharpoons;']='⇌',['&rlhar;']='⇌',['&nLeftarrow;']='⇍',['&nlArr;']='⇍',['&nLeftrightarrow;']='⇎',['&nhArr;']='⇎',['&nRightarrow;']='⇏',['&nrArr;']='⇏',['&DoubleLeftArrow;']='⇐',['&Leftarrow;']='⇐',['&lArr;']='⇐',['&DoubleUpArrow;']='⇑',['&Uparrow;']='⇑',['&uArr;']='⇑',['&DoubleRightArrow;']='⇒',['&Implies;']='⇒',['&Rightarrow;']='⇒',['&rArr;']='⇒',['&DoubleDownArrow;']='⇓',['&Downarrow;']='⇓',['&dArr;']='⇓',['&DoubleLeftRightArrow;']='⇔',['&Leftrightarrow;']='⇔',['&hArr;']='⇔',['&iff;']='⇔',['&DoubleUpDownArrow;']='⇕',['&Updownarrow;']='⇕',['&vArr;']='⇕',['&nwArr;']='⇖',['&neArr;']='⇗',['&seArr;']='⇘',['&swArr;']='⇙',['&Lleftarrow;']='⇚',['&lAarr;']='⇚',['&Rrightarrow;']='⇛',['&rAarr;']='⇛',['&zigrarr;']='⇝',['&LeftArrowBar;']='⇤',['&larrb;']='⇤',['&RightArrowBar;']='⇥',['&rarrb;']='⇥',['&DownArrowUpArrow;']='⇵',['&duarr;']='⇵',['&loarr;']='⇽',['&roarr;']='⇾',['&hoarr;']='⇿',['&ForAll;']='∀',['&forall;']='∀',['&comp;']='∁',['&complement;']='∁',['&PartialD;']='∂',['&part;']='∂',['&npart;']='∂̸',['&Exists;']='∃',['&exist;']='∃',['&NotExists;']='∄',['&nexist;']='∄',['&nexists;']='∄',['&empty;']='∅',['&emptyset;']='∅',['&emptyv;']='∅',['&varnothing;']='∅',['&Del;']='∇',['&nabla;']='∇',['&Element;']='∈',['&in;']='∈',['&isin;']='∈',['&isinv;']='∈',['&NotElement;']='∉',['&notin;']='∉',['&notinva;']='∉',['&ReverseElement;']='∋',['&SuchThat;']='∋',['&ni;']='∋',['&niv;']='∋',['&NotReverseElement;']='∌',['&notni;']='∌',['&notniva;']='∌',['&Product;']='∏',['&prod;']='∏',['&Coproduct;']='∐',['&coprod;']='∐',['&Sum;']='∑',['&sum;']='∑',['&minus;']='−',['&MinusPlus;']='∓',['&mnplus;']='∓',['&mp;']='∓',['&dotplus;']='∔',['&plusdo;']='∔',['&Backslash;']='∖',['&setminus;']='∖',['&setmn;']='∖',['&smallsetminus;']='∖',['&ssetmn;']='∖',['&lowast;']='∗',['&SmallCircle;']='∘',['&compfn;']='∘',['&Sqrt;']='√',['&radic;']='√',['&Proportional;']='∝',['&prop;']='∝',['&propto;']='∝',['&varpropto;']='∝',['&vprop;']='∝',['&infin;']='∞',['&angrt;']='∟',['&ang;']='∠',['&angle;']='∠',['&nang;']='∠⃒',['&angmsd;']='∡',['&measuredangle;']='∡',['&angsph;']='∢',['&VerticalBar;']='∣',['&mid;']='∣',['&shortmid;']='∣',['&smid;']='∣',['&NotVerticalBar;']='∤',['&nmid;']='∤',['&nshortmid;']='∤',['&nsmid;']='∤',['&DoubleVerticalBar;']='∥',['&par;']='∥',['&parallel;']='∥',['&shortparallel;']='∥',['&spar;']='∥',['&NotDoubleVerticalBar;']='∦',['&npar;']='∦',['&nparallel;']='∦',['&nshortparallel;']='∦',['&nspar;']='∦',['&and;']='∧',['&wedge;']='∧',['&or;']='∨',['&vee;']='∨',['&cap;']='∩',['&caps;']='∩︀',['&cup;']='∪',['&cups;']='∪︀',['&Integral;']='∫',['&int;']='∫',['&Int;']='∬',['&iiint;']='∭',['&tint;']='∭',['&ContourIntegral;']='∮',['&conint;']='∮',['&oint;']='∮',['&Conint;']='∯',['&DoubleContourIntegral;']='∯',['&Cconint;']='∰',['&cwint;']='∱',['&ClockwiseContourIntegral;']='∲',['&cwconint;']='∲',['&CounterClockwiseContourIntegral;']='∳',['&awconint;']='∳',['&Therefore;']='∴',['&there4;']='∴',['&therefore;']='∴',['&Because;']='∵',['&becaus;']='∵',['&because;']='∵',['&ratio;']='∶',['&Colon;']='∷',['&Proportion;']='∷',['&dotminus;']='∸',['&minusd;']='∸',['&mDDot;']='∺',['&homtht;']='∻',['&Tilde;']='∼',['&sim;']='∼',['&thicksim;']='∼',['&thksim;']='∼',['&nvsim;']='∼⃒',['&backsim;']='∽',['&bsim;']='∽',['&race;']='∽̱',['&ac;']='∾',['&mstpos;']='∾',['&acE;']='∾̳',['&acd;']='∿',['&VerticalTilde;']='≀',['&wr;']='≀',['&wreath;']='≀',['&NotTilde;']='≁',['&nsim;']='≁',['&EqualTilde;']='≂',['&eqsim;']='≂',['&esim;']='≂',['&nesim;']='≂̸',['&NotEqualTilde;']='≂̸',['&TildeEqual;']='≃',['&sime;']='≃',['&simeq;']='≃',['&NotTildeEqual;']='≄',['&nsime;']='≄',['&nsimeq;']='≄',['&TildeFullEqual;']='≅',['&cong;']='≅',['&simne;']='≆',['&NotTildeFullEqual;']='≇',['&ncong;']='≇',['&TildeTilde;']='≈',['&ap;']='≈',['&approx;']='≈',['&asymp;']='≈',['&thickapprox;']='≈',['&thkap;']='≈',['&NotTildeTilde;']='≉',['&nap;']='≉',['&napprox;']='≉',['&ape;']='≊',['&approxeq;']='≊',['&apid;']='≋',['&napid;']='≋̸',['&backcong;']='≌',['&bcong;']='≌',['&CupCap;']='≍',['&asympeq;']='≍',['&nvap;']='≍⃒',['&Bumpeq;']='≎',['&HumpDownHump;']='≎',['&bump;']='≎',['&nbump;']='≎̸',['&NotHumpDownHump;']='≎̸',['&HumpEqual;']='≏',['&bumpe;']='≏',['&bumpeq;']='≏',['&nbumpe;']='≏̸',['&NotHumpEqual;']='≏̸',['&DotEqual;']='≐',['&doteq;']='≐',['&esdot;']='≐',['&nedot;']='≐̸',['&doteqdot;']='≑',['&eDot;']='≑',['&efDot;']='≒',['&fallingdotseq;']='≒',['&erDot;']='≓',['&risingdotseq;']='≓',['&Assign;']='≔',['&colone;']='≔',['&coloneq;']='≔',['&ecolon;']='≕',['&eqcolon;']='≕',['&ecir;']='≖',['&eqcirc;']='≖',['&circeq;']='≗',['&cire;']='≗',['&wedgeq;']='≙',['&veeeq;']='≚',['&triangleq;']='≜',['&trie;']='≜',['&equest;']='≟',['&questeq;']='≟',['&NotEqual;']='≠',['&ne;']='≠',['&Congruent;']='≡',['&equiv;']='≡',['&bnequiv;']='≡⃥',['&NotCongruent;']='≢',['&nequiv;']='≢',['&le;']='≤',['&leq;']='≤',['&nvle;']='≤⃒',['&GreaterEqual;']='≥',['&ge;']='≥',['&geq;']='≥',['&nvge;']='≥⃒',['&LessFullEqual;']='≦',['&lE;']='≦',['&leqq;']='≦',['&nlE;']='≦̸',['&nleqq;']='≦̸',['&GreaterFullEqual;']='≧',['&gE;']='≧',['&geqq;']='≧',['&ngE;']='≧̸',['&ngeqq;']='≧̸',['&NotGreaterFullEqual;']='≧̸',['&lnE;']='≨',['&lneqq;']='≨',['&lvertneqq;']='≨︀',['&lvnE;']='≨︀',['&gnE;']='≩',['&gneqq;']='≩',['&gvertneqq;']='≩︀',['&gvnE;']='≩︀',['&Lt;']='≪',['&NestedLessLess;']='≪',['&ll;']='≪',['&nLtv;']='≪̸',['&NotLessLess;']='≪̸',['&nLt;']='≪⃒',['&Gt;']='≫',['&NestedGreaterGreater;']='≫',['&gg;']='≫',['&nGtv;']='≫̸',['&NotGreaterGreater;']='≫̸',['&nGt;']='≫⃒',['&between;']='≬',['&twixt;']='≬',['&NotCupCap;']='≭',['&NotLess;']='≮',['&nless;']='≮',['&nlt;']='≮',['&NotGreater;']='≯',['&ngt;']='≯',['&ngtr;']='≯',['&NotLessEqual;']='≰',['&nle;']='≰',['&nleq;']='≰',['&NotGreaterEqual;']='≱',['&nge;']='≱',['&ngeq;']='≱',['&LessTilde;']='≲',['&lesssim;']='≲',['&lsim;']='≲',['&GreaterTilde;']='≳',['&gsim;']='≳',['&gtrsim;']='≳',['&NotLessTilde;']='≴',['&nlsim;']='≴',['&NotGreaterTilde;']='≵',['&ngsim;']='≵',['&LessGreater;']='≶',['&lessgtr;']='≶',['&lg;']='≶',['&GreaterLess;']='≷',['&gl;']='≷',['&gtrless;']='≷',['&NotLessGreater;']='≸',['&ntlg;']='≸',['&NotGreaterLess;']='≹',['&ntgl;']='≹',['&Precedes;']='≺',['&pr;']='≺',['&prec;']='≺',['&Succeeds;']='≻',['&sc;']='≻',['&succ;']='≻',['&PrecedesSlantEqual;']='≼',['&prcue;']='≼',['&preccurlyeq;']='≼',['&SucceedsSlantEqual;']='≽',['&sccue;']='≽',['&succcurlyeq;']='≽',['&PrecedesTilde;']='≾',['&precsim;']='≾',['&prsim;']='≾',['&SucceedsTilde;']='≿',['&scsim;']='≿',['&succsim;']='≿',['&NotSucceedsTilde;']='≿̸',['&NotPrecedes;']='⊀',['&npr;']='⊀',['&nprec;']='⊀',['&NotSucceeds;']='⊁',['&nsc;']='⊁',['&nsucc;']='⊁',['&sub;']='⊂',['&subset;']='⊂',['&NotSubset;']='⊂⃒',['&nsubset;']='⊂⃒',['&vnsub;']='⊂⃒',['&Superset;']='⊃',['&sup;']='⊃',['&supset;']='⊃',['&NotSuperset;']='⊃⃒',['&nsupset;']='⊃⃒',['&vnsup;']='⊃⃒',['&nsub;']='⊄',['&nsup;']='⊅',['&SubsetEqual;']='⊆',['&sube;']='⊆',['&subseteq;']='⊆',['&SupersetEqual;']='⊇',['&supe;']='⊇',['&supseteq;']='⊇',['&NotSubsetEqual;']='⊈',['&nsube;']='⊈',['&nsubseteq;']='⊈',['&NotSupersetEqual;']='⊉',['&nsupe;']='⊉',['&nsupseteq;']='⊉',['&subne;']='⊊',['&subsetneq;']='⊊',['&varsubsetneq;']='⊊︀',['&vsubne;']='⊊︀',['&supne;']='⊋',['&supsetneq;']='⊋',['&varsupsetneq;']='⊋︀',['&vsupne;']='⊋︀',['&cupdot;']='⊍',['&UnionPlus;']='⊎',['&uplus;']='⊎',['&SquareSubset;']='⊏',['&sqsub;']='⊏',['&sqsubset;']='⊏',['&NotSquareSubset;']='⊏̸',['&SquareSuperset;']='⊐',['&sqsup;']='⊐',['&sqsupset;']='⊐',['&NotSquareSuperset;']='⊐̸',['&SquareSubsetEqual;']='⊑',['&sqsube;']='⊑',['&sqsubseteq;']='⊑',['&SquareSupersetEqual;']='⊒',['&sqsupe;']='⊒',['&sqsupseteq;']='⊒',['&SquareIntersection;']='⊓',['&sqcap;']='⊓',['&sqcaps;']='⊓︀',['&SquareUnion;']='⊔',['&sqcup;']='⊔',['&sqcups;']='⊔︀',['&CirclePlus;']='⊕',['&oplus;']='⊕',['&CircleMinus;']='⊖',['&ominus;']='⊖',['&CircleTimes;']='⊗',['&otimes;']='⊗',['&osol;']='⊘',['&CircleDot;']='⊙',['&odot;']='⊙',['&circledcirc;']='⊚',['&ocir;']='⊚',['&circledast;']='⊛',['&oast;']='⊛',['&circleddash;']='⊝',['&odash;']='⊝',['&boxplus;']='⊞',['&plusb;']='⊞',['&boxminus;']='⊟',['&minusb;']='⊟',['&boxtimes;']='⊠',['&timesb;']='⊠',['&dotsquare;']='⊡',['&sdotb;']='⊡',['&RightTee;']='⊢',['&vdash;']='⊢',['&LeftTee;']='⊣',['&dashv;']='⊣',['&DownTee;']='⊤',['&top;']='⊤',['&UpTee;']='⊥',['&bot;']='⊥',['&bottom;']='⊥',['&perp;']='⊥',['&models;']='⊧',['&DoubleRightTee;']='⊨',['&vDash;']='⊨',['&Vdash;']='⊩',['&Vvdash;']='⊪',['&VDash;']='⊫',['&nvdash;']='⊬',['&nvDash;']='⊭',['&nVdash;']='⊮',['&nVDash;']='⊯',['&prurel;']='⊰',['&LeftTriangle;']='⊲',['&vartriangleleft;']='⊲',['&vltri;']='⊲',['&RightTriangle;']='⊳',['&vartriangleright;']='⊳',['&vrtri;']='⊳',['&LeftTriangleEqual;']='⊴',['&ltrie;']='⊴',['&trianglelefteq;']='⊴',['&nvltrie;']='⊴⃒',['&RightTriangleEqual;']='⊵',['&rtrie;']='⊵',['&trianglerighteq;']='⊵',['&nvrtrie;']='⊵⃒',['&origof;']='⊶',['&imof;']='⊷',['&multimap;']='⊸',['&mumap;']='⊸',['&hercon;']='⊹',['&intcal;']='⊺',['&intercal;']='⊺',['&veebar;']='⊻',['&barvee;']='⊽',['&angrtvb;']='⊾',['&lrtri;']='⊿',['&Wedge;']='⋀',['&bigwedge;']='⋀',['&xwedge;']='⋀',['&Vee;']='⋁',['&bigvee;']='⋁',['&xvee;']='⋁',['&Intersection;']='⋂',['&bigcap;']='⋂',['&xcap;']='⋂',['&Union;']='⋃',['&bigcup;']='⋃',['&xcup;']='⋃',['&Diamond;']='⋄',['&diam;']='⋄',['&diamond;']='⋄',['&sdot;']='⋅',['&Star;']='⋆',['&sstarf;']='⋆',['&divideontimes;']='⋇',['&divonx;']='⋇',['&bowtie;']='⋈',['&ltimes;']='⋉',['&rtimes;']='⋊',['&leftthreetimes;']='⋋',['&lthree;']='⋋',['&rightthreetimes;']='⋌',['&rthree;']='⋌',['&backsimeq;']='⋍',['&bsime;']='⋍',['&curlyvee;']='⋎',['&cuvee;']='⋎',['&curlywedge;']='⋏',['&cuwed;']='⋏',['&Sub;']='⋐',['&Subset;']='⋐',['&Sup;']='⋑',['&Supset;']='⋑',['&Cap;']='⋒',['&Cup;']='⋓',['&fork;']='⋔',['&pitchfork;']='⋔',['&epar;']='⋕',['&lessdot;']='⋖',['&ltdot;']='⋖',['&gtdot;']='⋗',['&gtrdot;']='⋗',['&Ll;']='⋘',['&nLl;']='⋘̸',['&Gg;']='⋙',['&ggg;']='⋙',['&nGg;']='⋙̸',['&LessEqualGreater;']='⋚',['&leg;']='⋚',['&lesseqgtr;']='⋚',['&lesg;']='⋚︀',['&GreaterEqualLess;']='⋛',['&gel;']='⋛',['&gtreqless;']='⋛',['&gesl;']='⋛︀',['&cuepr;']='⋞',['&curlyeqprec;']='⋞',['&cuesc;']='⋟',['&curlyeqsucc;']='⋟',['&NotPrecedesSlantEqual;']='⋠',['&nprcue;']='⋠',['&NotSucceedsSlantEqual;']='⋡',['&nsccue;']='⋡',['&NotSquareSubsetEqual;']='⋢',['&nsqsube;']='⋢',['&NotSquareSupersetEqual;']='⋣',['&nsqsupe;']='⋣',['&lnsim;']='⋦',['&gnsim;']='⋧',['&precnsim;']='⋨',['&prnsim;']='⋨',['&scnsim;']='⋩',['&succnsim;']='⋩',['&NotLeftTriangle;']='⋪',['&nltri;']='⋪',['&ntriangleleft;']='⋪',['&NotRightTriangle;']='⋫',['&nrtri;']='⋫',['&ntriangleright;']='⋫',['&NotLeftTriangleEqual;']='⋬',['&nltrie;']='⋬',['&ntrianglelefteq;']='⋬',['&NotRightTriangleEqual;']='⋭',['&nrtrie;']='⋭',['&ntrianglerighteq;']='⋭',['&vellip;']='⋮',['&ctdot;']='⋯',['&utdot;']='⋰',['&dtdot;']='⋱',['&disin;']='⋲',['&isinsv;']='⋳',['&isins;']='⋴',['&isindot;']='⋵',['&notindot;']='⋵̸',['&notinvc;']='⋶',['&notinvb;']='⋷',['&isinE;']='⋹',['&notinE;']='⋹̸',['&nisd;']='⋺',['&xnis;']='⋻',['&nis;']='⋼',['&notnivc;']='⋽',['&notnivb;']='⋾',['&barwed;']='⌅',['&barwedge;']='⌅',['&Barwed;']='⌆',['&doublebarwedge;']='⌆',['&LeftCeiling;']='⌈',['&lceil;']='⌈',['&RightCeiling;']='⌉',['&rceil;']='⌉',['&LeftFloor;']='⌊',['&lfloor;']='⌊',['&RightFloor;']='⌋',['&rfloor;']='⌋',['&drcrop;']='⌌',['&dlcrop;']='⌍',['&urcrop;']='⌎',['&ulcrop;']='⌏',['&bnot;']='⌐',['&profline;']='⌒',['&profsurf;']='⌓',['&telrec;']='⌕',['&target;']='⌖',['&ulcorn;']='⌜',['&ulcorner;']='⌜',['&urcorn;']='⌝',['&urcorner;']='⌝',['&dlcorn;']='⌞',['&llcorner;']='⌞',['&drcorn;']='⌟',['&lrcorner;']='⌟',['&frown;']='⌢',['&sfrown;']='⌢',['&smile;']='⌣',['&ssmile;']='⌣',['&cylcty;']='⌭',['&profalar;']='⌮',['&topbot;']='⌶',['&ovbar;']='⌽',['&solbar;']='⌿',['&angzarr;']='⍼',['&lmoust;']='⎰',['&lmoustache;']='⎰',['&rmoust;']='⎱',['&rmoustache;']='⎱',['&OverBracket;']='⎴',['&tbrk;']='⎴',['&UnderBracket;']='⎵',['&bbrk;']='⎵',['&bbrktbrk;']='⎶',['&OverParenthesis;']='⏜',['&UnderParenthesis;']='⏝',['&OverBrace;']='⏞',['&UnderBrace;']='⏟',['&trpezium;']='⏢',['&elinters;']='⏧',['&blank;']='␣',['&circledS;']='Ⓢ',['&oS;']='Ⓢ',['&HorizontalLine;']='─',['&boxh;']='─',['&boxv;']='│',['&boxdr;']='┌',['&boxdl;']='┐',['&boxur;']='└',['&boxul;']='┘',['&boxvr;']='├',['&boxvl;']='┤',['&boxhd;']='┬',['&boxhu;']='┴',['&boxvh;']='┼',['&boxH;']='═',['&boxV;']='║',['&boxdR;']='╒',['&boxDr;']='╓',['&boxDR;']='╔',['&boxdL;']='╕',['&boxDl;']='╖',['&boxDL;']='╗',['&boxuR;']='╘',['&boxUr;']='╙',['&boxUR;']='╚',['&boxuL;']='╛',['&boxUl;']='╜',['&boxUL;']='╝',['&boxvR;']='╞',['&boxVr;']='╟',['&boxVR;']='╠',['&boxvL;']='╡',['&boxVl;']='╢',['&boxVL;']='╣',['&boxHd;']='╤',['&boxhD;']='╥',['&boxHD;']='╦',['&boxHu;']='╧',['&boxhU;']='╨',['&boxHU;']='╩',['&boxvH;']='╪',['&boxVh;']='╫',['&boxVH;']='╬',['&uhblk;']='▀',['&lhblk;']='▄',['&block;']='█',['&blk14;']='░',['&blk12;']='▒',['&blk34;']='▓',['&Square;']='□',['&squ;']='□',['&square;']='□',['&FilledVerySmallSquare;']='▪',['&blacksquare;']='▪',['&squarf;']='▪',['&squf;']='▪',['&EmptyVerySmallSquare;']='▫',['&rect;']='▭',['&marker;']='▮',['&fltns;']='▱',['&bigtriangleup;']='△',['&xutri;']='△',['&blacktriangle;']='▴',['&utrif;']='▴',['&triangle;']='▵',['&utri;']='▵',['&blacktriangleright;']='▸',['&rtrif;']='▸',['&rtri;']='▹',['&triangleright;']='▹',['&bigtriangledown;']='▽',['&xdtri;']='▽',['&blacktriangledown;']='▾',['&dtrif;']='▾',['&dtri;']='▿',['&triangledown;']='▿',['&blacktriangleleft;']='◂',['&ltrif;']='◂',['&ltri;']='◃',['&triangleleft;']='◃',['&loz;']='◊',['&lozenge;']='◊',['&cir;']='○',['&tridot;']='◬',['&bigcirc;']='◯',['&xcirc;']='◯',['&ultri;']='◸',['&urtri;']='◹',['&lltri;']='◺',['&EmptySmallSquare;']='◻',['&FilledSmallSquare;']='◼',['&bigstar;']='★',['&starf;']='★',['&star;']='☆',['&phone;']='☎',['&female;']='♀',['&male;']='♂',['&spades;']='♠',['&spadesuit;']='♠',['&clubs;']='♣',['&clubsuit;']='♣',['&hearts;']='♥',['&heartsuit;']='♥',['&diamondsuit;']='♦',['&diams;']='♦',['&sung;']='♪',['&flat;']='♭',['&natur;']='♮',['&natural;']='♮',['&sharp;']='♯',['&check;']='✓',['&checkmark;']='✓',['&cross;']='✗',['&malt;']='✠',['&maltese;']='✠',['&sext;']='✶',['&VerticalSeparator;']='❘',['&lbbrk;']='❲',['&rbbrk;']='❳',['&bsolhsub;']='⟈',['&suphsol;']='⟉',['&LeftDoubleBracket;']='⟦',['&lobrk;']='⟦',['&RightDoubleBracket;']='⟧',['&robrk;']='⟧',['&LeftAngleBracket;']='⟨',['&lang;']='⟨',['&langle;']='⟨',['&RightAngleBracket;']='⟩',['&rang;']='⟩',['&rangle;']='⟩',['&Lang;']='⟪',['&Rang;']='⟫',['&loang;']='⟬',['&roang;']='⟭',['&LongLeftArrow;']='⟵',['&longleftarrow;']='⟵',['&xlarr;']='⟵',['&LongRightArrow;']='⟶',['&longrightarrow;']='⟶',['&xrarr;']='⟶',['&LongLeftRightArrow;']='⟷',['&longleftrightarrow;']='⟷',['&xharr;']='⟷',['&DoubleLongLeftArrow;']='⟸',['&Longleftarrow;']='⟸',['&xlArr;']='⟸',['&DoubleLongRightArrow;']='⟹',['&Longrightarrow;']='⟹',['&xrArr;']='⟹',['&DoubleLongLeftRightArrow;']='⟺',['&Longleftrightarrow;']='⟺',['&xhArr;']='⟺',['&longmapsto;']='⟼',['&xmap;']='⟼',['&dzigrarr;']='⟿',['&nvlArr;']='⤂',['&nvrArr;']='⤃',['&nvHarr;']='⤄',['&Map;']='⤅',['&lbarr;']='⤌',['&bkarow;']='⤍',['&rbarr;']='⤍',['&lBarr;']='⤎',['&dbkarow;']='⤏',['&rBarr;']='⤏',['&RBarr;']='⤐',['&drbkarow;']='⤐',['&DDotrahd;']='⤑',['&UpArrowBar;']='⤒',['&DownArrowBar;']='⤓',['&Rarrtl;']='⤖',['&latail;']='⤙',['&ratail;']='⤚',['&lAtail;']='⤛',['&rAtail;']='⤜',['&larrfs;']='⤝',['&rarrfs;']='⤞',['&larrbfs;']='⤟',['&rarrbfs;']='⤠',['&nwarhk;']='⤣',['&nearhk;']='⤤',['&hksearow;']='⤥',['&searhk;']='⤥',['&hkswarow;']='⤦',['&swarhk;']='⤦',['&nwnear;']='⤧',['&nesear;']='⤨',['&toea;']='⤨',['&seswar;']='⤩',['&tosa;']='⤩',['&swnwar;']='⤪',['&rarrc;']='⤳',['&nrarrc;']='⤳̸',['&cudarrr;']='⤵',['&ldca;']='⤶',['&rdca;']='⤷',['&cudarrl;']='⤸',['&larrpl;']='⤹',['&curarrm;']='⤼',['&cularrp;']='⤽',['&rarrpl;']='⥅',['&harrcir;']='⥈',['&Uarrocir;']='⥉',['&lurdshar;']='⥊',['&ldrushar;']='⥋',['&LeftRightVector;']='⥎',['&RightUpDownVector;']='⥏',['&DownLeftRightVector;']='⥐',['&LeftUpDownVector;']='⥑',['&LeftVectorBar;']='⥒',['&RightVectorBar;']='⥓',['&RightUpVectorBar;']='⥔',['&RightDownVectorBar;']='⥕',['&DownLeftVectorBar;']='⥖',['&DownRightVectorBar;']='⥗',['&LeftUpVectorBar;']='⥘',['&LeftDownVectorBar;']='⥙',['&LeftTeeVector;']='⥚',['&RightTeeVector;']='⥛',['&RightUpTeeVector;']='⥜',['&RightDownTeeVector;']='⥝',['&DownLeftTeeVector;']='⥞',['&DownRightTeeVector;']='⥟',['&LeftUpTeeVector;']='⥠',['&LeftDownTeeVector;']='⥡',['&lHar;']='⥢',['&uHar;']='⥣',['&rHar;']='⥤',['&dHar;']='⥥',['&luruhar;']='⥦',['&ldrdhar;']='⥧',['&ruluhar;']='⥨',['&rdldhar;']='⥩',['&lharul;']='⥪',['&llhard;']='⥫',['&rharul;']='⥬',['&lrhard;']='⥭',['&UpEquilibrium;']='⥮',['&udhar;']='⥮',['&ReverseUpEquilibrium;']='⥯',['&duhar;']='⥯',['&RoundImplies;']='⥰',['&erarr;']='⥱',['&simrarr;']='⥲',['&larrsim;']='⥳',['&rarrsim;']='⥴',['&rarrap;']='⥵',['&ltlarr;']='⥶',['&gtrarr;']='⥸',['&subrarr;']='⥹',['&suplarr;']='⥻',['&lfisht;']='⥼',['&rfisht;']='⥽',['&ufisht;']='⥾',['&dfisht;']='⥿',['&lopar;']='⦅',['&ropar;']='⦆',['&lbrke;']='⦋',['&rbrke;']='⦌',['&lbrkslu;']='⦍',['&rbrksld;']='⦎',['&lbrksld;']='⦏',['&rbrkslu;']='⦐',['&langd;']='⦑',['&rangd;']='⦒',['&lparlt;']='⦓',['&rpargt;']='⦔',['&gtlPar;']='⦕',['&ltrPar;']='⦖',['&vzigzag;']='⦚',['&vangrt;']='⦜',['&angrtvbd;']='⦝',['&ange;']='⦤',['&range;']='⦥',['&dwangle;']='⦦',['&uwangle;']='⦧',['&angmsdaa;']='⦨',['&angmsdab;']='⦩',['&angmsdac;']='⦪',['&angmsdad;']='⦫',['&angmsdae;']='⦬',['&angmsdaf;']='⦭',['&angmsdag;']='⦮',['&angmsdah;']='⦯',['&bemptyv;']='⦰',['&demptyv;']='⦱',['&cemptyv;']='⦲',['&raemptyv;']='⦳',['&laemptyv;']='⦴',['&ohbar;']='⦵',['&omid;']='⦶',['&opar;']='⦷',['&operp;']='⦹',['&olcross;']='⦻',['&odsold;']='⦼',['&olcir;']='⦾',['&ofcir;']='⦿',['&olt;']='⧀',['&ogt;']='⧁',['&cirscir;']='⧂',['&cirE;']='⧃',['&solb;']='⧄',['&bsolb;']='⧅',['&boxbox;']='⧉',['&trisb;']='⧍',['&rtriltri;']='⧎',['&LeftTriangleBar;']='⧏',['&NotLeftTriangleBar;']='⧏̸',['&RightTriangleBar;']='⧐',['&NotRightTriangleBar;']='⧐̸',['&iinfin;']='⧜',['&infintie;']='⧝',['&nvinfin;']='⧞',['&eparsl;']='⧣',['&smeparsl;']='⧤',['&eqvparsl;']='⧥',['&blacklozenge;']='⧫',['&lozf;']='⧫',['&RuleDelayed;']='⧴',['&dsol;']='⧶',['&bigodot;']='⨀',['&xodot;']='⨀',['&bigoplus;']='⨁',['&xoplus;']='⨁',['&bigotimes;']='⨂',['&xotime;']='⨂',['&biguplus;']='⨄',['&xuplus;']='⨄',['&bigsqcup;']='⨆',['&xsqcup;']='⨆',['&iiiint;']='⨌',['&qint;']='⨌',['&fpartint;']='⨍',['&cirfnint;']='⨐',['&awint;']='⨑',['&rppolint;']='⨒',['&scpolint;']='⨓',['&npolint;']='⨔',['&pointint;']='⨕',['&quatint;']='⨖',['&intlarhk;']='⨗',['&pluscir;']='⨢',['&plusacir;']='⨣',['&simplus;']='⨤',['&plusdu;']='⨥',['&plussim;']='⨦',['&plustwo;']='⨧',['&mcomma;']='⨩',['&minusdu;']='⨪',['&loplus;']='⨭',['&roplus;']='⨮',['&Cross;']='⨯',['&timesd;']='⨰',['&timesbar;']='⨱',['&smashp;']='⨳',['&lotimes;']='⨴',['&rotimes;']='⨵',['&otimesas;']='⨶',['&Otimes;']='⨷',['&odiv;']='⨸',['&triplus;']='⨹',['&triminus;']='⨺',['&tritime;']='⨻',['&intprod;']='⨼',['&iprod;']='⨼',['&amalg;']='⨿',['&capdot;']='⩀',['&ncup;']='⩂',['&ncap;']='⩃',['&capand;']='⩄',['&cupor;']='⩅',['&cupcap;']='⩆',['&capcup;']='⩇',['&cupbrcap;']='⩈',['&capbrcup;']='⩉',['&cupcup;']='⩊',['&capcap;']='⩋',['&ccups;']='⩌',['&ccaps;']='⩍',['&ccupssm;']='⩐',['&And;']='⩓',['&Or;']='⩔',['&andand;']='⩕',['&oror;']='⩖',['&orslope;']='⩗',['&andslope;']='⩘',['&andv;']='⩚',['&orv;']='⩛',['&andd;']='⩜',['&ord;']='⩝',['&wedbar;']='⩟',['&sdote;']='⩦',['&simdot;']='⩪',['&congdot;']='⩭',['&ncongdot;']='⩭̸',['&easter;']='⩮',['&apacir;']='⩯',['&apE;']='⩰',['&napE;']='⩰̸',['&eplus;']='⩱',['&pluse;']='⩲',['&Esim;']='⩳',['&Colone;']='⩴',['&Equal;']='⩵',['&ddotseq;']='⩷',['&eDDot;']='⩷',['&equivDD;']='⩸',['&ltcir;']='⩹',['&gtcir;']='⩺',['&ltquest;']='⩻',['&gtquest;']='⩼',['&LessSlantEqual;']='⩽',['&leqslant;']='⩽',['&les;']='⩽',['&nleqslant;']='⩽̸',['&nles;']='⩽̸',['&NotLessSlantEqual;']='⩽̸',['&GreaterSlantEqual;']='⩾',['&geqslant;']='⩾',['&ges;']='⩾',['&ngeqslant;']='⩾̸',['&nges;']='⩾̸',['&NotGreaterSlantEqual;']='⩾̸',['&lesdot;']='⩿',['&gesdot;']='⪀',['&lesdoto;']='⪁',['&gesdoto;']='⪂',['&lesdotor;']='⪃',['&gesdotol;']='⪄',['&lap;']='⪅',['&lessapprox;']='⪅',['&gap;']='⪆',['&gtrapprox;']='⪆',['&lne;']='⪇',['&lneq;']='⪇',['&gne;']='⪈',['&gneq;']='⪈',['&lnap;']='⪉',['&lnapprox;']='⪉',['&gnap;']='⪊',['&gnapprox;']='⪊',['&lEg;']='⪋',['&lesseqqgtr;']='⪋',['&gEl;']='⪌',['&gtreqqless;']='⪌',['&lsime;']='⪍',['&gsime;']='⪎',['&lsimg;']='⪏',['&gsiml;']='⪐',['&lgE;']='⪑',['&glE;']='⪒',['&lesges;']='⪓',['&gesles;']='⪔',['&els;']='⪕',['&eqslantless;']='⪕',['&egs;']='⪖',['&eqslantgtr;']='⪖',['&elsdot;']='⪗',['&egsdot;']='⪘',['&el;']='⪙',['&eg;']='⪚',['&siml;']='⪝',['&simg;']='⪞',['&simlE;']='⪟',['&simgE;']='⪠',['&LessLess;']='⪡',['&NotNestedLessLess;']='⪡̸',['&GreaterGreater;']='⪢',['&NotNestedGreaterGreater;']='⪢̸',['&glj;']='⪤',['&gla;']='⪥',['&ltcc;']='⪦',['&gtcc;']='⪧',['&lescc;']='⪨',['&gescc;']='⪩',['&smt;']='⪪',['&lat;']='⪫',['&smte;']='⪬',['&smtes;']='⪬︀',['&late;']='⪭',['&lates;']='⪭︀',['&bumpE;']='⪮',['&PrecedesEqual;']='⪯',['&pre;']='⪯',['&preceq;']='⪯',['&NotPrecedesEqual;']='⪯̸',['&npre;']='⪯̸',['&npreceq;']='⪯̸',['&SucceedsEqual;']='⪰',['&sce;']='⪰',['&succeq;']='⪰',['&NotSucceedsEqual;']='⪰̸',['&nsce;']='⪰̸',['&nsucceq;']='⪰̸',['&prE;']='⪳',['&scE;']='⪴',['&precneqq;']='⪵',['&prnE;']='⪵',['&scnE;']='⪶',['&succneqq;']='⪶',['&prap;']='⪷',['&precapprox;']='⪷',['&scap;']='⪸',['&succapprox;']='⪸',['&precnapprox;']='⪹',['&prnap;']='⪹',['&scnap;']='⪺',['&succnapprox;']='⪺',['&Pr;']='⪻',['&Sc;']='⪼',['&subdot;']='⪽',['&supdot;']='⪾',['&subplus;']='⪿',['&supplus;']='⫀',['&submult;']='⫁',['&supmult;']='⫂',['&subedot;']='⫃',['&supedot;']='⫄',['&subE;']='⫅',['&subseteqq;']='⫅',['&nsubE;']='⫅̸',['&nsubseteqq;']='⫅̸',['&supE;']='⫆',['&supseteqq;']='⫆',['&nsupE;']='⫆̸',['&nsupseteqq;']='⫆̸',['&subsim;']='⫇',['&supsim;']='⫈',['&subnE;']='⫋',['&subsetneqq;']='⫋',['&varsubsetneqq;']='⫋︀',['&vsubnE;']='⫋︀',['&supnE;']='⫌',['&supsetneqq;']='⫌',['&varsupsetneqq;']='⫌︀',['&vsupnE;']='⫌︀',['&csub;']='⫏',['&csup;']='⫐',['&csube;']='⫑',['&csupe;']='⫒',['&subsup;']='⫓',['&supsub;']='⫔',['&subsub;']='⫕',['&supsup;']='⫖',['&suphsub;']='⫗',['&supdsub;']='⫘',['&forkv;']='⫙',['&topfork;']='⫚',['&mlcp;']='⫛',['&Dashv;']='⫤',['&DoubleLeftTee;']='⫤',['&Vdashl;']='⫦',['&Barv;']='⫧',['&vBar;']='⫨',['&vBarv;']='⫩',['&Vbar;']='⫫',['&Not;']='⫬',['&bNot;']='⫭',['&rnmid;']='⫮',['&cirmid;']='⫯',['&midcir;']='⫰',['&topcir;']='⫱',['&nhpar;']='⫲',['&parsim;']='⫳',['&parsl;']='⫽',['&nparsl;']='⫽⃥',['&fflig;']='ﬀ',['&filig;']='ﬁ',['&fllig;']='ﬂ',['&ffilig;']='ﬃ',['&ffllig;']='ﬄ',['&Ascr;']='𝒜',['&Cscr;']='𝒞',['&Dscr;']='𝒟',['&Gscr;']='𝒢',['&Jscr;']='𝒥',['&Kscr;']='𝒦',['&Nscr;']='𝒩',['&Oscr;']='𝒪',['&Pscr;']='𝒫',['&Qscr;']='𝒬',['&Sscr;']='𝒮',['&Tscr;']='𝒯',['&Uscr;']='𝒰',['&Vscr;']='𝒱',['&Wscr;']='𝒲',['&Xscr;']='𝒳',['&Yscr;']='𝒴',['&Zscr;']='𝒵',['&ascr;']='𝒶',['&bscr;']='𝒷',['&cscr;']='𝒸',['&dscr;']='𝒹',['&fscr;']='𝒻',['&hscr;']='𝒽',['&iscr;']='𝒾',['&jscr;']='𝒿',['&kscr;']='𝓀',['&lscr;']='𝓁',['&mscr;']='𝓂',['&nscr;']='𝓃',['&pscr;']='𝓅',['&qscr;']='𝓆',['&rscr;']='𝓇',['&sscr;']='𝓈',['&tscr;']='𝓉',['&uscr;']='𝓊',['&vscr;']='𝓋',['&wscr;']='𝓌',['&xscr;']='𝓍',['&yscr;']='𝓎',['&zscr;']='𝓏',['&Afr;']='𝔄',['&Bfr;']='𝔅',['&Dfr;']='𝔇',['&Efr;']='𝔈',['&Ffr;']='𝔉',['&Gfr;']='𝔊',['&Jfr;']='𝔍',['&Kfr;']='𝔎',['&Lfr;']='𝔏',['&Mfr;']='𝔐',['&Nfr;']='𝔑',['&Ofr;']='𝔒',['&Pfr;']='𝔓',['&Qfr;']='𝔔',['&Sfr;']='𝔖',['&Tfr;']='𝔗',['&Ufr;']='𝔘',['&Vfr;']='𝔙',['&Wfr;']='𝔚',['&Xfr;']='𝔛',['&Yfr;']='𝔜',['&afr;']='𝔞',['&bfr;']='𝔟',['&cfr;']='𝔠',['&dfr;']='𝔡',['&efr;']='𝔢',['&ffr;']='𝔣',['&gfr;']='𝔤',['&hfr;']='𝔥',['&ifr;']='𝔦',['&jfr;']='𝔧',['&kfr;']='𝔨',['&lfr;']='𝔩',['&mfr;']='𝔪',['&nfr;']='𝔫',['&ofr;']='𝔬',['&pfr;']='𝔭',['&qfr;']='𝔮',['&rfr;']='𝔯',['&sfr;']='𝔰',['&tfr;']='𝔱',['&ufr;']='𝔲',['&vfr;']='𝔳',['&wfr;']='𝔴',['&xfr;']='𝔵',['&yfr;']='𝔶',['&zfr;']='𝔷',['&Aopf;']='𝔸',['&Bopf;']='𝔹',['&Dopf;']='𝔻',['&Eopf;']='𝔼',['&Fopf;']='𝔽',['&Gopf;']='𝔾',['&Iopf;']='𝕀',['&Jopf;']='𝕁',['&Kopf;']='𝕂',['&Lopf;']='𝕃',['&Mopf;']='𝕄',['&Oopf;']='𝕆',['&Sopf;']='𝕊',['&Topf;']='𝕋',['&Uopf;']='𝕌',['&Vopf;']='𝕍',['&Wopf;']='𝕎',['&Xopf;']='𝕏',['&Yopf;']='𝕐',['&aopf;']='𝕒',['&bopf;']='𝕓',['&copf;']='𝕔',['&dopf;']='𝕕',['&eopf;']='𝕖',['&fopf;']='𝕗',['&gopf;']='𝕘',['&hopf;']='𝕙',['&iopf;']='𝕚',['&jopf;']='𝕛',['&kopf;']='𝕜',['&lopf;']='𝕝',['&mopf;']='𝕞',['&nopf;']='𝕟',['&oopf;']='𝕠',['&popf;']='𝕡',['&qopf;']='𝕢',['&ropf;']='𝕣',['&sopf;']='𝕤',['&topf;']='𝕥',['&uopf;']='𝕦',['&vopf;']='𝕧',['&wopf;']='𝕨',['&xopf;']='𝕩',['&yopf;']='𝕪',['&zopf;']='𝕫',['&#32;']=' ',['&#33;']='!',['&#34;']='"',['&#35;']='#',['&#36;']='$',['&#37;']='%%',['&#38;']='&',['&#39;']="'",['&#40;']='(',['&#41;']=')',['&#42;']='*',['&#43;']='+',['&#44;']=',',['&#45;']='-',['&#46;']='.',['&#47;']='/',['&#160;']=' ',['&#338;']='Œ',['&#339;']='œ',['&#352;']='Š',['&#353;']='š',['&#376;']='Ÿ',['&#402;']='ƒ',['&#8211;']='–',['&#8212;']='—',['&#8216;']='‘',['&#8217;']='’',['&#8218;']='‚',['&#8220;']='“',['&#8221;']='”',['&#8222;']='„',['&#8224;']='†',['&#8225;']='‡',['&#8226;']='•',['&#8230;']='…',['&#8240;']='‰',['&#8364;']='€',['&#8482;']='™'}local c={"st","nd","rd"}function a:Capitalize()return self[1]:upper()..self:sub(2)end;function string.Ordinal(d)return c[d%100]||"th"end;function string.Capitalize(e)return e[1]:upper()..e:sub(2)end;function string.GetMetres(f)return math.floor(f*15/352)end;local function g(h)return utf8.char(h)end;local function i(h)return g(tonumber(h,16))end;function string.DecodeHTML(h)local j=string.gsub(h,'&[%w#]-;',b)j=string.gsub(j,'&#x([%w%d]*);',i)j=string.gsub(j,'&#([%d]*);',g)return j end;function string.insert(k,l,m)return k:sub(1,m)..l..k:sub(m+1)end;local n={time=function()return srp.time.GetStarwarsString()end,name='Nick',steamid='SteamID',money='GetMoney',group=function(o)return o:GetGroup()&&o:GetGroup().name||o:GetAllegiance().name end}function string.RPFormat(o,e)return e:gsub('{([^{}]+)}',function(p)local q=n[p]return isfunction(q)&&q(o)||isstring(q)&&isfunction(o[q])&&o[q](o)||o[q]&&tostring(o[q])||p end)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/player_cl.lua:
local a={}function GM:DrawPhysgunBeam(b,c,d,e,f,g)local h=a[b]if h!=e then if IsValid(h)||!d&&h==NULL then a[b]=nil;hook.Run('OnPhysgunDrop',b,e,h)end;if d then a[b]=e;hook.Run('OnPhysgunPickup',b,e,h)end end;return true end;function GM:PhysgunPickup(b,i)return false end;function GM:CanTool(b,j,k)return b:IsTrialGamemaster()end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu_cl.lua:
local a={}function a:Init()self.IsLayedOut={}self:Populate()self:SetFadeTime(0)end;function a:Populate()local b=spawnmenu.GetCreationTabs()for c,d in SortedPairsByMemberValue(b,"Order")do if self.IsLayedOut[c]||d.CustomCheck&&d.CustomCheck()==false then continue end;self.IsLayedOut[c]=true;local e=vgui.Create("Panel")self:AddSheet(c,e,d.Icon,nil,nil,d.Tooltip)e.Paint=function()e.Paint=nil;local f=d.Function()f:SetParent(e)f:Dock(FILL)end end end;vgui.Register("CreationMenu",a,"DPropertySheet")
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/controls/ropematerial_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/content_cl.lua:
local a={}AccessorFunc(a,"m_pSelectedPanel","SelectedPanel")function a:Init()self:SetPaintBackground(false)self.CategoryTable={}self.HorizontalDivider=vgui.Create("DHorizontalDivider",self)self.HorizontalDivider:Dock(FILL)self.HorizontalDivider:SetLeftWidth(192)self.HorizontalDivider:SetLeftMin(100)self.HorizontalDivider:SetRightMin(100)if ScrW()>=1024 then self.HorizontalDivider:SetLeftMin(192)self.HorizontalDivider:SetRightMin(400)end;self.HorizontalDivider:SetDividerWidth(6)self.HorizontalDivider:SetCookieName("SpawnMenuCreationMenuDiv")self.ContentNavBar=vgui.Create("ContentSidebar",self.HorizontalDivider)self.HorizontalDivider:SetLeft(self.ContentNavBar)end;function a:EnableModify()self.ContentNavBar:EnableModify()end;function a:EnableSearch(...)self.ContentNavBar:EnableSearch(...)end;function a:CallPopulateHook(b)hook.Call(b,GAMEMODE,self,self.ContentNavBar.Tree,self.OldSpawnlists)end;function a:SwitchPanel(c)if IsValid(self.SelectedPanel)then self.SelectedPanel:SetVisible(false)self.SelectedPanel=nil end;self.SelectedPanel=c;if!IsValid(c)then return end;self.HorizontalDivider:SetRight(self.SelectedPanel)self.HorizontalDivider:InvalidateLayout(true)self.SelectedPanel:SetVisible(true)self:InvalidateParent()end;function a:OnSizeChanged()self.HorizontalDivider:LoadCookies()end;vgui.Register("SpawnmenuContentPanel",a,"DPanel")local function d()local e=vgui.Create("SpawnmenuContentPanel")e.OldSpawnlists=e.ContentNavBar.Tree:AddNode("#spawnmenu.category.browse","icon16/cog.png")e:EnableModify()hook.Call("PopulatePropMenu",GAMEMODE)e:CallPopulateHook("PopulateContent")e.OldSpawnlists:MoveToFront()e.OldSpawnlists:SetExpanded(true)return e end;spawnmenu.AddCreationTab("#spawnmenu.content_tab",d,"icon16/application_view_tile.png",-10)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/basepanel_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/dropdown_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/feedback_ui.lua:
local a={}function a:Init()self:SetSize(500,200)local b,c=(ScrW()-self:GetWide())*.5,(ScrH()-self:GetTall())*.5;self:SetAlpha(0)self:AlphaTo(255,.3)self:Center()self:SetBackgroundColor(col.midnight)self:AddPanel('srp_label',function(d)d:Dock(FILL)d:DockMargin(15,15,15,15)d:SetContentAlignment(7)d:SetText('Ooops. Someone forgot to set a label. You should probably press Cancel.')d:SetWrap(true)d:SetTextColor(col.white_dark)d:SetFont'ui_label.l'self.msg=d end)self:AddPanel('srp_button_tagtext',function(e)e:SetWide(150)e:SetBackgroundColor(overlay)e:SetHoverColor(col.green_dark)e:SetTextColor(col.white)e:SetBorderColor(col.midnight_dark)e:SetTagTextColor(col.green)e:SetText'CONFIRM'e:SetTagFont'SSRPForkAwesome'e:SetTagText(0xf00c,true)e:SetTagWidth(32)e:LeftClick(function()if self.from_server&&self.crc then net.Start('srp.notif.AddConfirmation')net.WriteString(self.crc)net.SendToServer()self:Remove()elseif self.callback then self.callback(self.data)self:Remove()else self:DoClick(self)self:Remove()end end)self.yes=e end)self:AddPanel('srp_button_tagtext',function(f)f:SetBackgroundColor(red)f:SetWide(150)f:SetBackgroundColor(overlay)f:SetHoverColor(col.red_dark)f:SetTextColor(col.white)f:SetBorderColor(col.midnight_dark)f:SetTagTextColor(col.red)f:SetText'DENY'f:SetTagFont'SSRPForkAwesome'f:SetTagText(0xf00d,true)f:SetTagWidth(32)f:LeftClick(function()self:Remove()end)self.no=f end)end;function a:SetData(g,h)self.data=h;self.callback=h.callback;self.from_server=h.from_server;self.crc=h.crc;self.sub_text=h.sub_text;self.icon=isstring(h.icon)&&Material(h.icon)||h.icon;self.icon_color=(h.icon_color&&h.icon_color||col.white):Copy()self.icon_color.a=100;self.m_bgHeaderColor=self.m_bgHeaderColor||h.header_color;self.timeout=g&&CurTime()+g||nil;if h.paint then self.Paint=h.paint end;if h.setup then h:setup(self)end;if self.m_bgHeaderColor then self.close:SetBackgroundColor(self.m_bgHeaderColor)self.close:SetHoverColor(self.m_bgHeaderColor)end;local i=#string.Wrap(h.sub_text,self.msg:GetFont(),2000)self:SetTitle(h.title||'Invalid title')self.msg:SetText(h.sub_text||'Invalid message')self:SetTall(i*30+150)self:MakePopup()end;function a:DoClick()end;function a:PerformLayout(j,k)self.BaseClass.PerformLayout(self,j,k)local b=j-self.no:GetWide()-10;local c=k-self.yes:GetTall()-10;self.no:SetPos(b,c)b=b-10-self.yes:GetWide()self.yes:SetPos(b,c)end;function a:Think()if self.removing then return end;self:MoveToFront()if self.timeout&&self.timeout<CurTime()then self.removing=true;local b,c=self:GetPos()self:AlphaTo(0,.2,.25,function()self:Remove()end)end end;vgui.Register('srp_feedback',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/modelwheel_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/settingsmenu_ui.lua:
local a={}local b=Color(255,255,255,5)a.Types={number='DisplayNumber',bool='DisplayBool',custom='DisplayCustom',color='DisplayColor',dropdown='DisplayDropdown'}local c=Color(255,100,100,50)local d=Color(100,255,100,50)function a:Init()self:DockPadding(5,5,5,5)self:DockMargin(5,5,5,5)self:SetBackgroundColor(col.grey_dark)self:AddPanel('srp_panel',function(e)e:DockPadding(0,0,0,0)e:Dock(LEFT)e:SetWide(550)e:SetBackgroundColor(col.transparent)e:AddPanel('srp_label',function(f)f:Dock(FILL)f:SetFont'ui_header.r'f:SetTextColor(col.white)f:SetContentAlignment(4)f:SetTextInset(10,0)self.Name=f end)e:AddPanel('srp_label',function(g)g:Dock(BOTTOM)g:SetFont'ui_header.s'g:SetTextColor(col.white_dark)g:SetVisible(false)g:SetTall(0)g:SetContentAlignment(7)g:SetWrap(true)g:SetTextInset(10,0)self.Description=g end)end)self:AddPanel('srp_panel_rounded',function(e)e:Dock(FILL)self.Right=e end)end;function a:DisplayBool(h)local i=h:GetName()local j=h:GetValue()&&2||1;self.Right:AddPanel('srp_checkbox',function(e)e:Dock(FILL)e:SetOptions({name='OFF',value=false},{name='ON',value=true})e:SetSpeed(6000)e:SetPosition(j,true)e:OnValueChanged(function(k,l,m)k.option1:SetFont(l==1&&'ui_label.rb'||'ui_label.r')k.option2:SetFont(l==2&&'ui_label.rb'||'ui_label.r')cvar.SetValue(i,m.value)end)end)end;function a:DisplayNumber(h)local n=h:GetMetadata('Min')||0;local o=h:GetMetadata('Max')||1;self.Right:AddPanel('srp_slider',function(e)e:Dock(FILL)e:DockMargin(0,4,0,4)e:SetValue(h:GetValue(),n,o)e:OnValueChanged(function(k,j,p)if h:GetMetadata('Value')then h:SetValue(j)else h:SetValue(p)end end)end)end;function a:DisplayColor(h)local q=h:GetMetadata('Alpha')||false;self.Right:AddPanel('srp_colorpicker',function(e)e:Dock(FILL)e:DockMargin(0,4,0,4)e:SetColor(h:GetValue())e:OnValueChanged(function(k,r)h:SetValue(r)end)end)end;function a:DisplayCustom(h)self.Right:AddPanel(h:GetCustomElement(),function(e)e:Dock(FILL)e:SetCvar(h)end)end;function a:DisplayDropdown(h)end;function a:Populate(h)self.Var=h;self.Name:SetText(h:GetMetadata('Menu')||table.concat(h:GetName():Split('_'),' ',2):Capitalize())if h:GetDescription()then self.Description:SetText(h:GetDescription())self.Description:SetVisible(true)self.Description:SetTall(20)end;local s=h:GetCustomElement()&&'custom'||string.lower(h:GetMetadata('Type')||'bool')local t=self.Types[s]if t then self[t](self,h)end end;vgui.Register('srp_setting_container',a,'srp_panel_rounded')local a={}function a:Init()self:SetBackgroundColor(col.transparent)self:DockPadding(6,6,6,6)self:SetTall(50)self.Options={}self:AddPanel('srp_label',function(f)f:Dock(TOP)f:SetTall(50)f:SetFont'ui_header.r'f:SetTextColor(col.white)f:SetTextInset(10,0)f.Paint=function(k,u,v)draw.RoundedBox(6,0,0,u,v,col.midnight)end;self.Header=f end)end;function a:DisplaySetting(h)self:AddPanel('srp_setting_container',function(e)e:SetTall(60)e:Populate(h)e:Dock(TOP)table.insert(self.Options,e)end)end;function a:Populate(w,x)self.Header:SetText(w)for l=1,#x do self:DisplaySetting(x[l])end;self:SetTall(62+#x*70)end;vgui.Register('srp_setting_cat',a,'srp_panel')local a={}function a:Init()self:SetBackgroundColor(col.transparent)self:DockPadding(0,0,0,0)self:AddPanel('srp_panel',function(e)e:Dock(TOP)e:SetTall(40)e:SetBackgroundColor(col.midnight)e:DockPadding(2,2,2,2)e:AddPanel('srp_label',function(f)f:Dock(FILL)f:SetText'Search'f:SetFont'ui_header.s'f:SetContentAlignment(6)end)e:AddPanel('srp_textinput_rounded',function(e)e:DockMargin(5,5,20,5)e:Dock(RIGHT)e:SetWide(300)e:OnValid(function(y)timer.Create('srp.settings.Search',0.5,1,function()if!IsValid(self)then return end;local z=(y:GetValue()||''):lower()self:Search(z)end)end)end)end)self:AddPanel('ui_scrollpanel',function(A)A:Dock(FILL)self.Scroll=A end)end;function a:Search(z)local B=self.Scroll:GetCanvas():GetChildren()for C,D in pairs(B)do local E=0;for C,e in pairs(D.Options)do local F=e.Name:GetText():lower()local G=e.Description:GetText():lower()if str==''||string.find(F,z)||string.find(G,z)then E=E+1;e:SetVisible(true)e:Dock(TOP)else e:SetVisible(false)e:Dock(NODOCK)end end;if E==0 then D:SetTall(0)else D:SetTall(60+E*90)end;D:SetVisible(E>0)end;self.Scroll:InvalidateLayout(true)end;function a:Populate(H)local I={}for C,cvar in ipairs(cvar.GetOrderedTable())do if cvar:ShouldShow()&&(cvar:GetMetadata('Menu')||cvar:GetCustomElement())then local D=cvar:GetMetadata('Category')||cvar:GetMetadata('Category')||'Other'I[D]=I[D]||{}I[D][#I[D]+1]=cvar end end;for l=1,#H do local w=H[l]if I[w]then srp.ui.Create('srp_setting_cat',function(e)e:Populate(w,I[w])self.Scroll:AddItem(e)end)end end end;vgui.Register('srp_settings',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/simplelist_ui.lua:
local a={}local b=Color(125,125,125,90)function a:Init()self:DockMargin(4,2,4,2)self:DockPadding(2,2,2,2)self:SetBackgroundColor(Color(100,100,100,80))self.items={}self:SetTall(150)self:AddPanel('srp_dropdown',function(c)c:SetBackgroundColor(b)c:DockMargin(0,0,0,10)c:Dock(TOP)c:OnSelect(function(d,e,f)if!table.HasValue(self.items,f.id)&&self:GetMax()>table.Count(self.items)then self:AddItem(f.id,f.name)end end)self.dropdown=c end)self:AddPanel('ui_scrollpanel',function(g)g:Dock(FILL)self.scroll=g end)end;function a:Clear()self.items={}self.dropdown:Clear()self.scroll:Reset()end;function a:AddOption(...)self.dropdown:AddOption(...)end;function a:SetDisabled(h)return self.dropdown:SetDisabled(h)end;function a:AddItem(i,j)srp.ui.Create('srp_panel',function(k)k.lid=i;k:SetTall(25)k:DockMargin(0,0,0,0)k:DockPadding(5,0,0,0)k:SetBackgroundColor(b)k:AddPanel('srp_label',function(l)l:SetText(j)l:Dock(FILL)end)k:AddPanel('srp_button',function(m)m:DockMargin(0,0,0,0)m:Dock(RIGHT)m:SetText'X'm:SetWide(25)m:SetBorderColor(col.transparent)m:SetTextColor(col.red)m:SetBackgroundColor(col.transparent)m:SetHoverColor(col.transparent)m:LeftClick(function(d)table.RemoveByValue(self.items,k.lid)k:Remove()end)end)table.insert(self.items,k.lid)self.scroll:AddItem(k)end)end;function a:SetMax(n)self.maxselection=n end;function a:GetMax()return self.maxselection||10 end;function a:GetItems()return self.items end;vgui.Register('srp_simplelist',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/statuemodel_ui.lua:
local a={}function a:Init()end;function a:Populate(b)self.Entity=b end;function a:Submit()if!IsValid(self.Entity)then self:Remove()return end end;vgui.Register('srp_statuemodel',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/tabs_ui.lua:
local a={Paint=function()end}function a:Init()self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self.items={}self.items_mapped={}self.selected=nil;self:AddPanel('srp_panel',function(b)b:SetTall(40)b:Dock(TOP)b:DockPadding(0,0,0,0)b:DockMargin(0,0,0,0)b:SetBackgroundColor(col.transparent)self.strip=b end)self:AddPanel('srp_panel',function(c)c:Dock(FILL)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c.Paint=function()end;self.container=c end)end;function a:ClearTabs()self.items={}self.selected_item=nil;self.strip:Clear()self.container:Clear()end;local d=Color(200,200,200)function a:AddPage(e,f,g,h)if!f then return end;g=g||function()end;self.strip:AddPanel('srp_button',function(i)i:Dock(LEFT)i:SetTextColor(d)i:SetBackgroundColor(col.transparent)i:SetBorderColor(col.transparent)i:SetText(e)i:SetFont'ui_header.rb'surface.SetFont('ui_header.rb')local j,k=surface.GetTextSize(e)i:SetWide(j+10)i:SetContentAlignment(5)i.Paint=function()end;i:LeftClick(function(l)self:SelectItem(l.id)end)i:OnSelected(function(l)l:SetTextColor(col.white)end)i:OnDeselected(function(l)l:SetTextColor(d)end)if ispanel(f)then local id=self:AddInternal(e,i,f).id;if id==1 then self:SelectItem(id,nil,h)end;g(id,i,f)elseif isstring(f)then srp.ui.Create(f,function(f)local id=self:AddInternal(e,i,f).id;if id==1 then self:SelectItem(id,nil,h)end;g(id,i,f)end)end end)end;function a:AddInternal(e,i,f)local m={name=e,button=i,page=f}local id=table.insert(self.items,m)m.id=id;m.button.id=id;m.page.id=id;self.items_mapped[e]=m;f:SetVisible(false)f:SetAlpha(0)f:SetParent(nil)self:OnPageAdded(id,i,f)return m end;function a:SelectItemByName(e)local m=self.items_mapped[e]if m then self:SelectItem(m.id,true)return m.page end end;function a:SelectItem(id,n,o)if!n&&self.next&&self.next>CurTime()then return end;if self.selected&&self.selected.id==id then return end;local m=self.items[id]if!m then return end;local p=self.selected;if p then if p.page.OnTabHide then if p.page:OnTabHide(self,self.container)==false then return end end;p.button:Select(false)p.page:Dock(NODOCK)p.page:AlphaTo(0,.05,0,function(q,l)l:SetVisible(false)l:SetParent(nil)end)end;m.button:Select(true)m.page:SetParent(self.container)m.page:Dock(FILL)m.page:SetVisible(true)m.page:AlphaTo(255,.05,0)if!o&&m.page.OnTabShow then m.page:OnTabShow(self,self.container)end;self:OnSelected(m.id,m.btn,m.page)self.selected=m;self.next=CurTime()+.2 end;function a:RemoveTab(id)end;function a:GetSelected()return self.selected end;function a:OnPageAdded(id,i,r)end;function a:OnSelected(id,i,r)end;vgui.Register('srp_tabs',table.Copy(a),'srp_panel')local a={}local s=Color(0,0,0,50)function a:Init()self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self.strip:Dock(LEFT)self.strip:SetWide(64)self.strip:DockPadding(0,0,0,0)self.strip:DockMargin(0,0,0,0)self.strip:SetBackgroundColor(col.grey_light)self:SetMode(LEFT,175)self.SelectedTextColor=col.white;self.DeselectedTextColor=d;self.ButtonBackgroundColor=col.grey;self.ButtonHoverColor=col.grey_dark;self.ButtonSelectedColor=col.grey_dark end;function a:SetButtonSelectedTextColor(col)self.SelectedTextColor=col end;function a:SetButtonDeselectedTextColor(col)self.DeselectedTextColor=col end;function a:SetButtonBackgroundColor(col)self.ButtonBackgroundColor=col end;function a:SetButtonHoverColor(col)self.ButtonHoverColor=col end;function a:SetButtonSelectedBackgroundColor(col)self.ButtonSelectedColor=col end;function a:SetMode(t,u)self.mode=t==LEFT&&LEFT||t==TOP&&TOP||LEFT;self.size=u||200;self.strip:Dock(self.mode)if self.mode==LEFT then self.strip:SetWide(self.size)else end;return self end;function a:AddPage(e,v,f,w,h)if!f then return end;local t=self.mode||LEFT;self.strip:AddPanel('srp_button_tag_rounded',function(i)i:DockPadding(0,0,0,0)i:DockMargin(2,2,4,4)i:SetSize(56,52)i:SetMaterial(v)i:SetMaterialMargin(4,2,4,2)i:SetTextColor(self.DeselectedTextColor)i:SetBackgroundColor(self.ButtonBackgroundColor)i:SetHoverColor(self.ButtonHoverColor)i:SetSelectedBackgroundColor(self.ButtonSelectedColor)i:SetFont'ui_header.sb'i:SetText(e)if t==LEFT then i:SetTall(42)i:Dock(TOP)else i:SetWide(self.size)i:Dock(LEFT)end;i:OnSelected(function(l)l:SetTextColor(self.SelectedTextColor)if l.TabPanel&&l.TabPanel.OnSelected then l.TabPanel:OnSelected(l,self)end end)i:OnDeselected(function(l)l:SetTextColor(self.DeselectedTextColor)if l.TabPanel&&l.TabPanel.OnDeselected then l.TabPanel:OnDeselected(l,self)end end)if isstring(f)then f=vgui.Create(f)end;if isfunction(f)then i:LeftClick(f)if w then w(id,i,f)end;return else i:LeftClick(function(l)self:SelectItem(l.id)end)end;if ispanel(f)then local id=self:AddInternal(e,i,f).id;i.TabPanel=f;if id==1 then self:SelectItem(id,nil,h)end;if w then w(id,i,f)end elseif isstring(f)then srp.ui.Create(f,function(f)local id=self:AddInternal(e,i,f).id;i.TabPanel=f;if id==1 then self:SelectItem(id,nil,h)end;if w then w(id,i,f)end end)end end)end;function a:SetStripBackgroundColor(col)self.strip:SetBackgroundColor(col)end;vgui.Register('srp_tabs_icon',a,'srp_tabs')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/transformgizmo_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/transformgizmo_ui.lua:
srp.ui=srp.ui||{}srp.ui.mctrl={}local a=srp.ui.mctrl;a.grab_dist=15;a.angle_pos=0.5;local b=CreateClientConVar("grid_pos_size","4")local c=CreateClientConVar("grid_ang_size","45")local function d(e,f,g,h,i,j)local k=4*h/(6*math.tan(0.5*j))local l=i:Forward()local m=i:Right()local n=i:Up()return(k*l+(e-0.5*g)*m+(0.5*h-f)*n):GetNormalized()end;local function o(p,g,h,i,j)local k=4*h/(6*math.tan(0.5*j))local q=i:Forward():Dot(p)if q==0 then return 0,0,-1 end;local r=k/q*p;local s=0.5*g+i:Right():Dot(r)local t=0.5*h-i:Up():Dot(r)local u;if q<0 then u=-1 elseif s<0||s>g||t<0||t>h then u=0 else u=1 end;return s,t,u end;local function v(w,x)local y=Matrix()y:SetAngles(w)local z=Matrix()z:SetAngles(x)return(z*y):GetAngles()end;local function A(w,x)local y=Matrix()y:SetAngles(w)local z=Matrix()z:SetAngles(x)return(z:GetInverse()*y):GetAngles()end;local function B()local s,t=input.GetCursorPos()if a.grab&&a.grab.mouse_offset then s=s+a.grab.mouse_offset.x;t=t+a.grab.mouse_offset.y end;return s,t end;do a.target=NULL;function ENTITY:BuildWorldMatrix(C)local D=Matrix()D:SetTranslation(self.Position)D:SetAngles(self.Angles)local E=self:GetBoneMatrix()*D;E:SetAngles(self:CalcAngles(E:GetAngles(),E:GetTranslation()))if C then E:Translate(self.PositionOffset)E:Rotate(self.AngleOffset)end;return E end;function ENTITY:GetWorldMatrixWithoutOffsets()return self:BuildWorldMatrix(false)end;function a.SetTarget(part)part=part||NULL;if!part:IsValid()then a.target=NULL;return end;if!part.GetDrawPosition then a.target=NULL else a.target=part end end;function a.GetTarget()return a.target:IsValid()&&a.target||NULL end;function a.GetAxes(F)return F:Forward(),F:Right()*-1,F:Up()end;function a.GetWorldPosition()local part=a.GetTarget()if!part:IsValid()then return end;local E=part:GetWorldMatrixWithoutOffsets()return E:GetTranslation(),E:GetAngles()end;function a.GetWorldMatrix()local part=a.GetTarget()if!part:IsValid()then return end;return part:GetWorldMatrixWithoutOffsets()end;function a.WorldToLocalPosition(G,F)local part=a.GetTarget()if!part:IsValid()then return end;local H,x=part:GetBonePosition()if H&&x then return WorldToLocal(G,F,H,x)end end;function a.GetCameraFOV()return LocalPlayer():GetFOV()end;function a.VecToScreen(I)local s,t,J=o((I-EyePos()):GetNormalized(),ScrW(),ScrH(),EyeAngles(),math.rad(a.GetCameraFOV()))return{x=s-1,y=t-1,visible=J==1}end;function a.ScreenToVec(s,t)local I=d(s,t,ScrW(),ScrH(),EyeAngles(),math.rad(a.GetCameraFOV()))return I end;function a.GetGizmoSize()local dist=part:GetWorldMatrixWithoutOffsets():GetTranslation():Distance(LocalPlayer():GetRealView())/50;if dist>1 then dist=1/dist end;return 5*math.rad(LocalPlayer():GetFOV())/dist end end;function a.LinePlaneIntersection(G,K,s,t)local L=K;local M=LocalPlayer():GetRealView()-G;local N=a.ScreenToVec(s,t)return M+N*-M:Dot(L)/N:Dot(L)end;local function O(P,Q,R,S)return P*R+Q*S end;function a.PointToAxis(G,T)local s,t=B()local U=a.VecToScreen(G)local V=a.VecToScreen(G+T*10)local W=math.atan2(V.y-U.y,V.x-U.x)local k=O(math.cos(W),math.sin(W),V.x-s,V.y-t)return V.x+math.cos(W)*-k,V.y+math.sin(W)*-k end;function a.CalculateMovement()local part=a.GetTarget()if!part:IsValid()then return end;local T=a.grab.axis;local X=a.GetGizmoSize()local E=a.grab.matrix;local G=E:GetTranslation()local Y,Z,_=E:GetForward(),-E:GetRight(),E:GetUp()local a0;if T=="x"then local a1=a.LinePlaneIntersection(G,Z,a.PointToAxis(G,Y))a0=(a1:Dot(Y)-X)*Y elseif T=="y"then local a1=a.LinePlaneIntersection(G,Y,a.PointToAxis(G,Z))a0=(a1:Dot(Z)-X)*Z elseif T=="z"then local a1=a.LinePlaneIntersection(G,Y,a.PointToAxis(G,_))a0=(a1:Dot(_)-X)*_ elseif T=="view"then a0=a.LinePlaneIntersection(G,LocalPlayer():GetAimVector(),B())end;if a0 then local a2=Matrix()a2:SetTranslation(E:GetTranslation()+a0)local z=a.grab.bone_matrix:GetInverse()*a2;local G=z:GetTranslation()if input.IsKeyDown(KEY_LCONTROL)then local a3=b:GetInt("grid_pos_size")G.x=math.Round(G.x/a3)*a3;G.y=math.Round(G.y/a3)*a3;G.z=math.Round(G.z/a3)*a3 end;hook.Call('TransformGizmoPositionChanged',part,G,0.25)end end;function a.CalculateRotation()local part=a.GetTarget()if!part:IsValid()then return end;local T=a.grab.axis;local F=a.grab.matrix:GetAngles()local a4;if T=="x"then local a5=util.IntersectRayWithPlane(EyePos(),a.ScreenToVec(B()),a.grab.matrix:GetTranslation(),a.grab.matrix:GetRight())if!a5 then return end;local a6=(a5-a.grab.matrix:GetTranslation()):Angle()local a7=A(a6,F)local a8=a7.p;if math.abs(a7.y)>90 then a8=-a8+180 end;a8=math.NormalizeAngle(a8)a4=v(Angle(a8,0,0),F)elseif T=="y"then local a5=util.IntersectRayWithPlane(EyePos(),a.ScreenToVec(B()),a.grab.matrix:GetTranslation(),a.grab.matrix:GetUp())if!a5 then return end;local a6=(a5-a.grab.matrix:GetTranslation()):Angle()local a7=A(a6,F)a4=v(Angle(0,a7.y-90,0),F)elseif T=="z"then local a5=util.IntersectRayWithPlane(EyePos(),a.ScreenToVec(B()),a.grab.matrix:GetTranslation(),a.grab.matrix:GetForward())if!a5 then return end;local a6=(a5-a.grab.matrix:GetTranslation()):Angle()a6:RotateAroundAxis(a.grab.matrix:GetForward(),90)local a7=A(a6,F)local a8=a7.p;if a7.y>0 then a8=-a8+180 end;a8=math.NormalizeAngle(a8)a4=v(Angle(0,0,a8),F)end;if a4 then local F=A(a4,a.grab.bone_matrix:GetAngles())if input.IsKeyDown(KEY_LCONTROL)then local a3=c:GetInt("grid_ang_size")F.p=math.Round(F.p/a3)*a3;F.y=math.Round(F.y/a3)*a3;F.r=math.Round(F.r/a3)*a3 end;hook.Call('TransformGizmoRotationChanged',part,F,0.25)end end;a.grab={mode=nil,axis=nil}local a9=CreateClientConVar("grab_clone","1",true,false,"Holding shift when moving or rotating a part creates its clone")function a.GUIMousePressed(aa)if aa!=MOUSE_LEFT then return end;local ab=a.GetTarget()if!ab:IsValid()then return end;local s,t=input.GetCursorPos()local G,F=a.GetWorldPosition()if!G||!F then return end;local Y,Z,_=a.GetAxes(F)local ac=a.GetGizmoSize()do local T;for ad,ae in pairs({x=a.VecToScreen(G+Y*ac),y=a.VecToScreen(G+Z*ac),z=a.VecToScreen(G+_*ac),view=a.VecToScreen(G)})do local k=math.sqrt((ae.x-s)^2+(ae.y-t)^2)if k<=a.grab_dist then T={axis=ad,pos=ae}break end end;if T then a.grab={}a.grab.mode="move"a.grab.axis=T.axis;local s,t=input.GetCursorPos()a.grab.mouse_offset={x=math.ceil(T.pos.x-s),y=math.ceil(T.pos.y-t)}a.grab.matrix=ab:GetWorldMatrixWithoutOffsets()*Matrix()a.grab.bone_matrix=ab:GetBoneMatrix()*Matrix()return true end end;do local T;for ad,ae in pairs({x=a.VecToScreen(G+Y*ac*a.angle_pos),y=a.VecToScreen(G+Z*ac*a.angle_pos),z=a.VecToScreen(G+_*ac*a.angle_pos)})do local k=math.sqrt((ae.x-s)^2+(ae.y-t)^2)if k<=a.grab_dist then T={axis=ad,pos=ae}break end end;if T then a.grab={}a.grab.mode="rotate"a.grab.axis=T.axis;local s,t=input.GetCursorPos()a.grab.mouse_offset={x=math.ceil(T.pos.x-s)+0.5,y=math.ceil(T.pos.y-t)+0.5}a.grab.matrix=ab:GetWorldMatrixWithoutOffsets()*Matrix()a.grab.bone_matrix=ab:GetBoneMatrix()*Matrix()a.grab.dist=dist;if a9:GetBool()&&input.IsShiftDown()then local af=ab:Clone()af:SetParent(af:GetParent())end;return true end end end;function a.GUIMouseReleased(aa)if aa==MOUSE_LEFT then a.grab=nil end end;local ag=surface.GetTextureID("gui/center_gradient.vtf")local function ah(P,Q,R,S,ai,aj)ai=ai||1;if!aj then surface.SetTexture(ag)end;local ak,al=P-R,Q-S;local F=math.atan2(ak,al)local am=math.sqrt(ak*ak+al*al)P=P-ak*0.5;Q=Q-al*0.5;surface.DrawTexturedRectRotated(P,Q,ai,am,math.deg(F))end;local function an(s,t,W,ao)ah(s,t,W,ao,3)end;local function ap(s,t,aq,ar,...)ar=ar||16;local as=ar/aq-0.1;for ad=0,ar do local at=(ad+0)/ar*math.pi*2;local au=(ad+1+as)/ar*math.pi*2;ah(s+math.sin(at)*aq,t+math.cos(at)*aq,s+math.sin(au)*aq,t+math.cos(au)*aq,...)end end;function a.LineToBox(U,V,av)av=av||7;an(U.x,U.y,V.x,V.y)ap(V.x,V.y,av,32,2)end;function a.RotationLines(G,aw,ax,ac)local ay=a.VecToScreen(G+aw*ac*a.angle_pos)local az=a.VecToScreen(G+aw*ac*a.angle_pos*0.9+ax*ac*0.08)local aA=a.VecToScreen(G+aw*ac*a.angle_pos*0.9+ax*ac*-0.08)an(ay.x,ay.y,az.x,az.y)an(ay.x,ay.y,aA.x,aA.y)end;function a.HUDPaint()a.LastThinkCall=FrameNumber()if a.IsSelecting then return end;local ab=a.GetTarget()if!ab then return end;local G,F=a.GetWorldPosition()if!G||!F then return end;local Y,Z,_=a.GetAxes(F)local aB=a.GetGizmoSize()local U=a.VecToScreen(G)local aC=a.VecToScreen(G+Y*aB)local aD=a.VecToScreen(G+Z*aB)local aE=a.VecToScreen(G+_*aB)if U.visible||aC.visible||aD.visible||aE.visible then if a.grab&&(a.grab.axis=="x"||a.grab.axis=="view")then surface.SetDrawColor(255,200,0,255)else surface.SetDrawColor(255,80,80,255)end;a.LineToBox(U,aC)a.RotationLines(G,Y,_,aB)if a.grab&&(a.grab.axis=="y"||a.grab.axis=="view")then surface.SetDrawColor(255,200,0,255)else surface.SetDrawColor(80,255,80,255)end;a.LineToBox(U,aD)a.RotationLines(G,Z,Y,aB)if a.grab&&(a.grab.axis=="z"||a.grab.axis=="view")then surface.SetDrawColor(255,200,0,255)else surface.SetDrawColor(80,80,255,255)end;a.LineToBox(U,aE)a.RotationLines(G,_,Z,aB)surface.SetDrawColor(255,200,0,255)ap(U.x,U.y,4,32,2)end end;function a.Think()if a.IsSelecting then return end;if!a.target:IsValid()then return end;if!a.grab then return end;if a.grab.axis&&a.grab.mode=="move"then a.CalculateMovement()elseif a.grab.axis&&a.grab.mode=="rotate"then a.CalculateRotation()end end;hook.Add('Think','mctrl_Think',a.Think)srp.ui=srp.ui||{}srp.ui.mctrl=a
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/battlepass_sh.lua:
srp.battlepass=srp.battlepass||{}srp.battlepass.season={}srp.battlepass.FREE=1;srp.battlepass.PREMIUM=2;srp.battlepass.COMMON=1;srp.battlepass.UNCOMMON=2;srp.battlepass.RARE=3;srp.battlepass.LEGENDARY=4;local a={}local b={}local c=false;local d=function(self,...)return self.Model end;local e=function(self,...)return self.Icon end;local f=function(self,...)local g,h=0,{...}return self.Description:gsub('#',function()g=g+1;return h[g]end)end;local i=function(self,...)local g,h=0,{...}return self.Name:gsub('#',function()g=g+1;return h[g]end)end;local function j(self)return self.SetupPreview end;local function k(self)return self.SetupPanel end;local l=function(self,m)net.WriteString(tostring(m))end;local n=function(self,m)return net.ReadString()end;function srp.battlepass.IsRunning()return c end;function srp.battlepass.IsEnabled(o)return table.HasValue(srp.battlepass.season,o)end;function srp.battlepass.AddUnlockType(o,p)p.id=o;p.GetDescription=p.GetDescription||f;p.GetName=p.GetName||i;p.GetModel=p.GetModel||d;p.GetIcon=p.GetIcon||e;p.HasCustomPanel=k;p.SetupPanel=p.SetupPanel;p.HasPreview=j;p.SetupPreview=p.SetupPreview;p.NetRead=p.NetRead||n;p.NetWrite=p.NetWrite||l;a[o]=p end;function srp.battlepass.GetUnlockType(o)return a[o]end;function srp.battlepass.Add(o,p)p.id=o;if!p.endtime||os.time()>p.endtime then return end;table.insert(srp.battlepass.season,p.id)c=true;local q=p.color||col.blue_light;local r=p.name||'Battlepass'srp.shop.Add(r,o):SetImage(p.icon):SetCat('Battlepass'):SetDesc(p.shopdescription):SetBackgroundColor(q):SetPrice(p.cost||1500):SetTimeStamps(p.starttime,p.endtime):SetNetworked(true):SetStackable(false):SetGetPrice(function(self,s)return math.ceil(self.Price*(s:HasUpgrade('vip_plus')&&.9||1))end)srp.talents.AddTree(o,{name=r,hide=true,global=true,color=q,xpid=p.xpid||'battlepass30',icon=p.icon,maxlevel=p.levels})b[o]=p end;function srp.battlepass.Get(o)return b[o]end;srp.AddClientCommand('battlepass',function(s,o)srp.battlepass.OpenMenu(o)end):AddParam(cmd.WORD)local t={'SERVERTOKEN_CRAFTING','SERVERTOKEN_PACKAGE','SERVERTOKEN_PATROLS'}local u={'TOKEN_REDLIGHT','TOKEN_SPLEEF','TOKEN_MK','TOKEN_FAILSAFE','TOKEN_SAFELANDING'}local v=function(s,w)for g=1,w do local o=t[math.random(1,#t)]s:AddInventoryItem(o,1,nil,true)end end;local x=function(s,w)for g=1,w do local o=u[math.random(1,#u)]s:AddInventoryItem(o,1,nil,true)end end;srp.battlepass.AddUnlockType('money',{Name='# RC',GetName=function(self,m)return string.Comma(m)..' RC'end,Icon=Material('galactic/ui/menu/money-3.png','smooth'),Description='Gives you # RC',Rarity=srp.battlepass.COMMON,Unlock=function(self,s,w)s:AddMoney(w,true)return true end,GetCost=function(self,w)return math.ceil(w*0.05)end})srp.battlepass.AddUnlockType('xp',{GetName=function(self,m,y)return string.Comma(m)..' '..srp.talents.Get(y||'default').name..' XP'end,Icon=Material'galactic/ui/battlepass/xp.png',Description='',Rarity=srp.battlepass.COMMON,Unlock=function(self,s,m,y)s:AddTalentXP(m,y,nil,nil,true)return true end,GetCost=function(self,w)return math.ceil(w*.03)end})srp.battlepass.AddUnlockType('credits',{Name='# Credits',Icon=Material'galactic/ui/currency.png',Description='',Rarity=srp.battlepass.COMMON,Unlock=function(self,s,m)s:AddCredits(m,'Reward - '..m)return true end,GetCost=function(self,w)return w*10000 end})srp.battlepass.AddUnlockType('arenatickets',{Name='Arena Tickets x#',Icon=Material'materials/galactic/ui/inventory/security.png',Description='',Rarity=srp.battlepass.COMMON,Unlock=function(self,s,m)x(s,m)return true end})srp.battlepass.AddUnlockType('storetickets',{Name='Store Tickets x#',Icon=Material'materials/galactic/ui/inventory/security.png',Description='',Rarity=srp.battlepass.COMMON,Unlock=function(self,s,m)v(s,m)return true end})srp.battlepass.AddUnlockType('randcosmetic',{Name='Random Cosmetic',Icon=Material'galactic/ui/menu/cap.png',Description='',Rarity=srp.battlepass.COMMON,Unlock=function(self,s)local z=cosmetics.Random(s,true)if!z then s:AddMoney(50000,true)else cosmetics.Give(s,z.name)end;return true end,GetCost=function(self,w)return 45000 end})srp.battlepass.AddUnlockType('store',{Name='#',GetIcon=function(self,o)return srp.shop.GetByUID(o):GetImage()end,GetName=function(self,o)return srp.shop.GetByUID(o):GetName()end,GetDescription=function(self,o)return srp.shop.GetByUID(o):GetDesc()||''end,Rarity=srp.battlepass.COMMON,Unlock=function(self,s,o)local A=srp.shop.GetByUID(o):GetID()srp.shop.AddUpgrade(s,A,true)return true end,GetCost=function(self,o)local A=srp.shop.GetByUID(o)local B=A.Price||5000;return 6500*B end})srp.battlepass.AddUnlockType('armouryitem',{Name='#',GetIcon=function(self,o)return srp.items.Get(o).icon end,GetName=function(self,o)return srp.items.Get(o).name end,GetDescription=function(self,o)return srp.items.Get(o).description||''end,Rarity=srp.battlepass.RARE,Unlock=function(self,s,o,C)return true end})srp.battlepass.AddUnlockType('item',{Name='#',GetIcon=function(self,o)return srp.items.Get(o).icon end,GetName=function(self,o,C)return srp.items.Get(o).name..' x'..(C||1)end,GetDescription=function(self,o)return srp.items.Get(o).description||''end,Rarity=srp.battlepass.RARE,Unlock=function(self,s,o,C)local D=srp.items.Get(o)s:AddInventoryItem(D,C,nil,true)return true end,GetCost=function(self,o,C)local D=srp.items.Get(o)if D.base=='SALETOKEN'then return 200000 else return(D.tradedisabled||D.nodrop)&&50000||1000 end end,NetWrite=function(self,o,C)net.WriteString(o)net.WriteUInt(C,16)end,NetRead=function(self,o,C)return net.ReadString(),net.ReadUInt(16)end})srp.battlepass.AddUnlockType('achievement',{Name='#',GetIcon=function(self,o)return srp.triumphs.Get(o):GetMaterial()end,GetName=function(self,o)return srp.triumphs.Get(o):GetName()..' Achievement'end,GetDescription=function(self,o)return srp.triumphs.Get(o):GetDescription()||''end,Rarity=srp.battlepass.COMMON,Unlock=function(self,s,o)local E=srp.triumphs.Get(o)if!E:IsCompleted(s)then srp.triumphs.Completed(s,E)end;return true end})srp.battlepass.AddUnlockType('gift',{Name='#',GetName=function(self,o)return gifts.Get(o).Name..' Gift Bundle'end,GetIcon=function(self,o)return gifts.Get(o).Material end,GetDescription=function(self,o)return gifts.Get(o).Description||''end,Rarity=srp.battlepass.COMMON,Unlock=function(self,s,o)gifts.Give(o,'Santa','Mr. Clause',s:SteamID(),'Received from the nice list! Lucky!',function()if IsValid(s)then srp.notif.Neutral(s,3,'You have received a gift bundle!')end end)return true end})srp.battlepass.AddUnlockType('message',{Name='#',Icon=Material'materials/galactic/ui/triumphs/package.png',GetDescription=function(self,o)return''end,Rarity=srp.battlepass.COMMON,Unlock=function(self,s,o)end})local function F(self,G,o,H)local z=cosmetics.Get(o)local I=z:GetModel()local J=z:GetClass()local K=z:GetType()local L=z:GetSlot()local M=z:GetMaterial()local N=z:GetSubMaterials()local O=G.parentEnt;local P,Q=z:GetUIOffsetPos()local R,S=z:GetUIOffsetAng()local T=z:GetUIAttachment()local U=z:GetUIScale()if H then G:SetFOV(50)end;if!IsValid(O)then if K==cosmetics.APPAREL then local V;local W='0000000'if srp.seasonal.Halloween then V='models/galactic/suphalloween/supclone.mdl'W='11111'else V=LocalPlayer():GetModel()end;O=G:AddModel(V,Vector(),Angle(0,-90,0))O:SetBodyGroups(W)G:TryCenter(O,nil,H&&.9||0.75)if H then O:SetPos(O:GetPos()+Vector(0,0,15))end;if L==cosmetics.SLOT.APPAREL.FACE then O:SetBodygroup(1,1)elseif L==cosmetics.SLOT.APPAREL.BACK then O:SetAngles(Angle(0,45,0))end elseif!H&&J then local X=J=='charm'J=X&&'sup_dc15s'||charm;G:SetCanControl(false)local Y=weapons.Get(J)local Z=scripted_ents.GetStored(J)if X&&Y then O=G:AddModel(Y.ViewModel,Vector(),Angle(0,25,0))G:TryCenter(O,'charm',6)elseif Y then O=G:AddModel(Y.ViewModel,Y.UIPosition+P,Y.UIAngle+R)elseif Z then O=G:AddModel(Z.t.Model,Z.t.UIPosition,Z.t.UIAngle)end end;G.parentEnt=O end;local _=G:AddModel(I)if M then _:SetMaterial(M)elseif N then for o,M in pairs(N)do _:SetSubMaterial(o,M)end end;if IsValid(O)then _:SetParent(O)_:AddEffects(EF_BONEMERGE)else _:ManipulateBoneScale(0,Vector(U,U,U))G:TryCenter(_,T,U)G:SetFOV(ScreenScale(25))if H&&Q then _:SetPos(_:GetPos()+Q)elseif!H&&P then _:SetPos(_:GetPos()+P)end;if H&&S then _:SetPos(_:GetPos()+S)elseif!H&&R then _:SetAngles(_:GetAngles()+R)end end end;local function a0(self,a1,o,H)local z=cosmetics.Get(o)local a2=z:GetMaterial()if H then a1:AddPanel('srp_cosmetic_callingcard',function(a3)a3:Populate(LocalPlayer(),z,'',1,true)a3:Center()a3:SetPos(-458,-15)end)else a1:AddPanel('srp_cosmetic_callingcard',function(a3)a3:Populate(LocalPlayer(),z,'Custom callingcard tag',.85)a3:Center()end)end end;local function a4(self,a1,o,H)local a5=srp.emotes.GetByName(o)if!a5 then return end;local G=a1:AddPanel('srp_modelpanel',function(G)G:Dock(FILL)G:SetMouseInputEnabled(true)G:SetFOV(50)end)local s=G:AddModel(LocalPlayer():GetModel())G:TryCenter(s)local o=o:Replace(' ','')srp.effect.PlayEffect('Emote',s,{Emote=o})end;srp.battlepass.AddUnlockType('callingcard',{Icon=Material'galactic/ui/menu/cap.png',GetName=function(self,o)return cosmetics.Get(o):GetName()end,GetModel=function(self,o)return cosmetics.Get(o):GetModel()end,GetDescription=function(self,o)return cosmetics.Get(o):GetDescription()end,SetupPanel=function(self,a1,o,H)a0(self,a1,o,H)end,Rarity=srp.battlepass.COMMON,Unlock=function(self,s,m)if!cosmetics.Give(s,cosmetics.Get(m).name)then s:AddMoney(40000)end end})srp.battlepass.AddUnlockType('title',{Icon=Material'galactic/ui/battlepass/badge.png',GetName=function(self,o)return srp.titles.GetByName(o).Name end,GetDescription=function(self,o)return'A custom title'end,SetupPanel=function(self,a1,o,H)if H then a1:AddPanel('DImage',function(a6)a6:SetSize(64,64)a6:SetPos((116-64)/2,(134-64)/2)a6:SetMaterial(self.Icon)a6:SetMouseInputEnabled(false)end)return end;a1:AddPanel('srp_titlepreview',function(a3)a3:SetSize(1,1)a3:Populate(o)a3:Center()a3:CenterHorizontal(0.5)end)end,Rarity=srp.battlepass.RARE,Unlock=function(self,s,m)return true end})srp.battlepass.AddUnlockType('title_effect',{Icon=Material'galactic/ui/battlepass/badge.png',GetName=function(self,o)return srp.titles.GetEffectByName(o).Name end,GetDescription=function(self,o)return'A custom title'end,SetupPanel=function(self,a1,o,H)if H then a1:AddPanel('DImage',function(a6)a6:SetSize(64,64)a6:SetPos((116-64)/2,(134-64)/2)a6:SetMaterial(self.Icon)a6:SetMouseInputEnabled(false)end)return end;a1:AddPanel('srp_titlepreview',function(a3)a3:SetSize(1,1)a3:Populate(o,true)a3:Center()a3:CenterHorizontal(0.5)end)end,Rarity=srp.battlepass.RARE,Unlock=function(self,s,m)return true end})srp.battlepass.AddUnlockType('emote',{GetIcon=function(self,o)return srp.emotes.GetByName(o).mat end,GetName=function(self,o)return srp.emotes.GetByName(o).name end,GetDescription=function(self,o)return'Special emote'end,SetupPanel=function(self,a1,o,H)a1:AddPanel('DImage',function(a6)a6:SetMaterial(self:GetIcon(o))a6:SetMouseInputEnabled(false)if H then a6:SetSize(64,64)a6:SetPos((116-64)/2,(134-64)/2)else a6:SetSize(256,256)a6:Center()end end)end,Rarity=srp.battlepass.RARE,Unlock=function(self,s,o)return true end})srp.battlepass.AddUnlockType('cosmetic',{Icon=Material'galactic/ui/menu/cap.png',GetName=function(self,o)return cosmetics.Get(o):GetName()end,GetModel=function(self,o)return cosmetics.Get(o):GetModel()end,GetDescription=function(self,o)return cosmetics.Get(o):GetDescription()end,SetupPreview=function(self,G,o,H)F(self,G,o,H)end,Rarity=srp.battlepass.COMMON,Unlock=function(self,s,m)if!cosmetics.Give(s,cosmetics.Get(m).name)then s:AddMoney(25000)end end})srp.battlepass.AddUnlockType('cosmeticset',{Icon=Material'galactic/ui/menu/cap.png',GetName=function(self,a7)return a7.Name end,GetModel=function(self,a7)return cosmetics.Get(a7.Cosmetics[1]):GetModel()end,GetDescription=function(self,a7)return a7.Description end,SetupPreview=function(self,G,a7,H)for a8,o in pairs(a7.Cosmetics)do F(self,G,o,H)end end,Rarity=srp.battlepass.COMMON,Unlock=function(self,s,a7)for a8,o in pairs(a7.Cosmetics)do if!cosmetics.Give(s,cosmetics.Get(o).name)then s:AddMoney(25000)end end end})
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buybacks/ui/buyback_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buybacks/ui/buybacks_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cards/cards_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/character_cl.lua:
srp.character=srp.character||{}srp.character.me=srp.character.me||{}srp.character.menu=srp.character.menu||nil;srp.character.playerView=srp.character.playerView||nil;if IsValid(srp.character.playerView)then srp.character.playerView:Remove()end;function srp.character.OpenMenu(a,b)a=a==nil&&true||a;if a then if IsValid(srp.character.menu)then srp.character.menu:Populate(b)else srp.character.menu=srp.ui.Create('srp_charactermenu')srp.character.menu:Populate(b)end elseif IsValid(srp.character.menu)then srp.character.menu:Remove()end end;net('srp.character.Menu',function()srp.character.OpenMenu(net.ReadBool())end)net('srp.character.SendCharacters',function()local c=net.ReadUInt(6)for d=1,c do local e=net.ReadCharacterData()srp.character.me[e.characterid]=e end;hook.Run('OnCharactersReceived')end)net('srp.character.SendCharacter',function(f)local e=net.ReadCharacterData()srp.character.me[e.characterid]=e;hook.Run('OnCharacterReceived',e)end)net('srp.character.SelectCharacter',function(f)local g=LocalPlayer()local e=srp.character.me[net.ReadUInt(32)]g.character=e;hook.Run('OnCharacterSelected',g,e.characterid,e)if info.Main&&!g:IsTrained()then srp.training.Start()end end)net('srp.character.CharacterUnloaded',function(f)LocalPlayer().character=nil;hook.Run'OnCharacterUnloaded'local h=net.ReadBool()if h==true then srp.character.OpenMenu(true)end end)net('srp.character.PlayerUsed',function()if IsValid(srp.character.playerView)then srp.character.playerView:Remove()end;local i=net.ReadPlayer()if!IsValid(i)then return end;srp.ui.Create('srp_characterpanel',function(j)j:SetPlayer(i)srp.character.playerView=j end)end)hook('InitPostEntity','srp.character.OpenMenuInit',function(g)srp.character.OpenMenu(true)end)hook('PlayerOpenedLoadInScreen','srp.character.LoadingScreen',function(k)k:EnableMinize(false)k.LoadingCompleted=function(l)srp.character.OpenMenu(true,l)end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/creationpanels/allegiance_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/chat/chat_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/construction/ui/store_ui.lua:
local a={}local b=col.blue:Copy()local c=col.yellow:Copy()function a:Populate(...)self.BaseClass.Populate(self,...)if self.IsContainer then self:SetTitle('EyeKeya')self.SetHeaderColor(c)self:SetBackgroundColor(b)self.info:SetBackgroundColor(c)end end;vgui.Register('srp_constructionstore',a,'srp_inventory')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_itempnl_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_purchase_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetictooltip_ui.lua:
local a={}local b=col.midnight:Copy()local c=col.black:Copy()local d=col.midnight_light:Copy()local e=col.midnight_dark:Copy()local f=Material'gui/gradient_up'local g=Material'gui/gradient_down'local h=Material('gui/lmb.png','noclamp smooth')local i=Material('gui/rmb.png','noclamp smooth')function a:Init()self:SetSkin'SRP_SUP'self:SetSize(400,175)self:SetText'Tooltip Test'self:SetBackgroundColor(b)self:SetBorderColor(c)self:SetAlpha(0)self:SetDrawOnTop(true)self:AddPanel('srp_panel_rounded',function(j)j:Dock(TOP)j:SetBackgroundColor(col.midnight_light)j:DockMargin(0,0,0,0)j:SetTall(30)j:AddPanel('srp_label',function(k)k:Dock(FILL)k:SetContentAlignment(5)k:SetFont'ui_header.s'self.Title=k end)end)local l=140;local m=(l-60)/2-10;self:AddPanel('srp_panel',function(j)j:Dock(FILL)j:SetTall(l)j:SetBackgroundColor(col.transparent)j:DockMargin(0,4,0,0)j:DockPadding(0,0,0,0)j:AddPanel('srp_panel_rounded',function(j)j:Dock(LEFT)j:SetWide(64)j:DockPadding(2,2,2,2)j:DockMargin(0,0,10,0)j:SetBackgroundColor(col.midnight_dark)j:AddPanel('DImage',function(n)n:SetSize(58,58)self.Image=n end)j:AddPanel('srp_label',function(k)k:Dock(BOTTOM)k:SetContentAlignment(5)k:SetFont'ui_label.r'k:SetText''self.Premium=k end)self.ImageBackground=j end)j:AddPanel('srp_label',function(k)k:Dock(TOP)k:SetContentAlignment(4)k:SetFont'ui_label.xl'k:SetTall(35)k:SetVisible(false)self.Cost=k end)j:AddPanel('srp_label',function(k)k:Dock(FILL)k:SetContentAlignment(7)k:SetFont'ui_label.r'k:SetWrap(true)self.Description=k end)j:AddPanel('srp_panel',function(j)j:Dock(BOTTOM)j:SetTall(28)j:SetBackgroundColor(col.transparent)j:DockPadding(0,0,0,0)self.interactive=j end)end)end;function a:SetText(o)if o&&istable(o)then self:Populate(o)end end;function a:Populate(p)self.Title:SetText(p.prettyname||'NO_ID')if p.icon&&!tostring(p.icon):find('error')then self.Image:SetMaterial(p.icon)self.Image:SetImageColor(col.white)else self.Image:SetVisible(false)if p:GetModel()then if!p.creditsOnly then self.Premium:SetTall(0)end;self.ImageBackground:AddPanel('srp_modelpanel',function(q)q:Dock(FILL)q:SetCamPos(Vector(-35,0,65))q:SetLookAt(Vector(0,0,65))q:SetFOV(40)q:AddModel(p:GetModel(),Vector(),Angle(0,180,0))end)end end;local r=p.creditsOnly;local s=r&&col.yellow:Copy()||p.color;local t;local u;if r then t=p:GetCredits()u='Credits'self.Premium:SetText'PREMIUM'else t=p:GetCost()u=LocalPlayer():GetCurrency()||'RC'end;if p:IsOwned()then self.Cost:SetText'OWNED'self.Cost:SetVisible(true)elseif t then self.Cost:SetText(string.Comma(t||0)..' '..u)self.Cost:SetVisible(true)end;self.Description:SetText(p:GetDescription()||'NO_DESCRIPTION')self:AddInteractive(i,80,'Remove')self:AddInteractive(h,200,'Equip (shift to preset)')if s then local v=s;local w,x,y=ColorToHSL(v)local z=HSLToColor(w,x,y*1.1)self.ImageBackground.Paint=function(x,A,w)draw.RoundedBox(6,0,0,A,w,e)if v then surface.SetDrawColor(z)surface.SetMaterial(g)surface.DrawTexturedRect(2,2,A-4,w-4)surface.SetDrawColor(v)surface.SetMaterial(f)surface.DrawTexturedRect(2,2,A-4,w-4)end end end end;function a:AddInteractive(B,C,D)self.interactive:AddPanel('srp_button_tag',function(j)j:Dock(RIGHT)j:SetWide(C||100)j:DockMargin(0,0,0,0)j:SetBackgroundColor(col.transparent)j:SetHoverColor(col.transparent)j:SetBorderColor(col.transparent)j:SetText(D..' ')j:SetMaterial(B)j:DockMaterial(RIGHT)j:SetContentAlignment(6)end)self.interactive:SetVisible(true)end;function a:PositionTooltip()if!IsValid(self.TargetPanel)then self:Close()return end;self:InvalidateLayout(true)local E,F=input.GetCursorPos()local A,w=self:GetSize()local G,H=self.TargetPanel:LocalToScreen(0,0)F=F-50;F=math.min(F,H-w-10)if F<2 then F=2 end;self:SetPos(math.Clamp(E-A*0.5,0,ScrW()-self:GetWide()),math.Clamp(F,0,ScrH()-self:GetTall()))end;function a:OpenForPanel(I)self.TargetPanel=I;self:PositionTooltip()self:AlphaTo(255,0.1,0)end;function a:PerformLayout(A,w)self.Image:Center()end;function a:Show()self:SetVisible(true)end;function a:Close()self:Remove()end;function a:Paint(A,w)self:PositionTooltip()derma.SkinHook('Paint','RoundedPanel',self,A,w)end;vgui.Register('srp_cosmetictip',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/crowdfunders_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/init_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/ui/creditspurchased_ui.lua:
local a={}local b=Material('galactic/ui/box_money.png','smooth noclamp')local c=Material'gui/gradient_down'local d=Sound'galactic/effects/whiz.wav'local e=col.midnight:Copy()e.a=240;local f=col.green:Copy()f.a=150;function a:Init()local g=ScrW()self:SetSize(350,58)self:SetPos(g+10,50)self:MoveTo(g-355,50,.25,0,-1)self:SetBackgroundColor(e)self:DockPadding(0,0,0,0)self:AlphaTo(0,.5,5,function()self:Remove()end)self:AddPanel('DImage',function(h)h:Dock(LEFT)h:SetMaterial(b)h:SetWide(48)h:DockMargin(5,5,6,5)h:SetImageColor(col.green)end)self:AddPanel('srp_label',function(h)h:Dock(TOP)h:SetFont'ui_header.rb'h:SetContentAlignment(1)h:SetTall(32)h:DockMargin(0,0,0,0)self.credits=h end)self:AddPanel('srp_label',function(h)h:Dock(BOTTOM)h:SetFont'ui_header.r'h:SetText'Thank you for supporting the server!'h:SetContentAlignment(7)h:DockMargin(0,0,0,0)h:SetTall(32)end)surface.PlaySound(d)end;function a:Populate(i)self.credits:SetText(Format('Your %s credits have arrived',string.Comma(i)))end;function a:Paint(j,k)draw.Box(0,0,j,k,e)surface.SetDrawColor(f)surface.DrawOutlinedRect(0,0,j,k,1)end;vgui.Register('srp_creditspurchased',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/effects/effects_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/eventrewards/eventrewards_cl.lua:
srp.gmrewards=srp.gmrewards||{}function srp.gmrewards.CompleteHistory()if srp.gmrewards.History then local a,b=LocalPlayer():GetGameMasterPoints()srp.gmrewards.History.Points=a;srp.gmrewards.History.NextPoints=srp.gmrewards.History.Points;srp.gmrewards.History.MaxPoints=b;srp.gmrewards.History.NextMaxPoints=srp.gmrewards.History.MaxPoints end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/eventrewards/ui/eventreward_level_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/eventrewards/ui/eventreward_level_ui.lua:
local a={}local b=Color(222,222,222,150)local c=Color(246,248,250,50)local d=Color(75,177,255,50)local e=Material'materials/galactic/ui/what.png'function a:Init()self.Level=0;self.Points=0;self.PointsPercent=0;self.PointsTotalPercent=0;self.MaxTotalPoints=0 end;function a:Populate(f,g,h)self.Points=f;self.MaxTotalPoints=g;self.PointsPercent=f/h;self.PointsTotalPercent=g/h end;function a:Paint(i,j)local k=j*.45;self.unlockedPercent=(self.unlockedPercent||0)+RealFrameTime()/1*3;local l=self.unlockedPercent%1;render.PushFilterMag(TEXFILTER.ANISOTROPIC)render.PushFilterMin(TEXFILTER.ANISOTROPIC)draw.NoTexture()surface.SetDrawColor(self:IsHovered()&&d||c)surface.DrawArc(i*0.5,j*0.5,k-2,k,0,360,361)surface.SetDrawColor(col.yellow)surface.DrawArc(i*0.5,j*0.5,k-14,k-10,0,360*self.PointsTotalPercent,360)surface.SetDrawColor(255,255,255)surface.DrawArc(i*0.5,j*0.5,k-14,k-10,0,360*self.PointsPercent,360)render.PopFilterMag()render.PopFilterMin()draw.SimpleText(self.Points,'gmrewards_title',i/2,j*.5,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)draw.SimpleText(self.MaxTotalPoints,'gmrewards_points',i/2,j*.72,col.yellow,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;vgui.Register('srp_eventreward_level',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/ui/eventtitle_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/ui/levelplate_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/bossbars/bossbar_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/containers/ui/container_ui.lua:
local a={}local b=Color(0,0,0,50)function a:Init()self:SetSize(240,325)self:DockPadding(2,2,2,2)self:SetBackgroundColor(col.midnight_dark)self:SetBorderColor(col.grey)self.folder=srp.containers.basePath;self:AddPanel('srp_panel',function(c)c:SetBackgroundColor(col.transparent)c:Dock(TOP)c:DockMargin(1,0,0,0)c:SetTall(30)c:AddPanel('srp_dropdown',function(d)d:Dock(FILL)d:DockMargin(0,0,5,0)d:SetBorderColor(b)d:OnSelect(function(e,f,g)self.containerid=g.id;self:Populate()end)self.typedd=d end)c:AddPanel('srp_textinput',function(h)h:Dock(RIGHT)h:SetWide(100)h:SetText'All'h:DockMargin(0,0,0,0)h:SetBackgroundColor(col.grey)h:SetTextColor(col.white_dark)h:SetBorderColor(col.transparent)self.Tag=h end)end)self:AddPanel('srp_label',function(h)h:Dock(TOP)h:SetText'Target'h:DockMargin(6,0,0,0)end)self:AddPanel('srp_panel',function(c)c:Dock(TOP)c:DockMargin(5,0,5,5)c:DockPadding(0,0,0,0)c:SetBackgroundColor(col.transparent)c:SetTall(30)self.classpanel=c end)self:AddPanel('ui_scrollpanel',function(i)i:Dock(FILL)i:SetPadding(5)self.scroll=i end)self:AddPanel('srp_panel',function(c)c:SetTall(25)c:Dock(BOTTOM)c:DockPadding(0,0,0,0)c:SetBackgroundColor(col.transparent)c:AddPanel('srp_button_rounded',function(j)j:SetText'Apply'j:SetTextColor(col.blue_light)j:SetBackgroundColor(col.midnight_light)j:SetHoverColor(col.midnight_dark)j:SetBorderColor(col.transparent)j:Dock(FILL)j:DockMargin(0,0,0,0)j:LeftClick(function()self:Save(true)end)self.ApplyBtn=j end)c:AddPanel('srp_button_rounded',function(j)j:SetText'X'j:SetTextColor(col.red)j:SetBackgroundColor(col.midnight_light)j:SetHoverColor(col.midnight_dark)j:SetBorderColor(col.transparent)j:Dock(RIGHT)j:SetWide(25)j:DockMargin(0,0,0,0)j:LeftClick(function()self:Delete()self:Unload()self:Remove()end)end)c:AddPanel('srp_button_rounded',function(j)j:SetText'Unload'j:SetTextColor(col.orange)j:SetBackgroundColor(col.midnight_light)j:SetHoverColor(col.midnight_dark)j:SetBorderColor(col.transparent)j:Dock(RIGHT)j:SetWide(55)j:DockMargin(0,0,0,0)j:LeftClick(function()self:Unload()end)end)end)self.pnltypes={}for k,g in ipairs(srp.containers.GetAll(true))do self.typedd:AddOption(g.Name,{id=g.internal},k==1)end;hook('OnPlayerAddedContainer',self,function(e,l)if e.fileid==l then e:SetBorderColor(col.green)end end)hook('OnPlayerRemovedContainer',self,function(e,l)if e.fileid==l then e:SetBorderColor(col.grey_light)end end)end;function a:OnRemove()hook.Remove('OnPlayerAddedContainer',self)hook.Remove('OnPlayerAddedContainer',self)end;function a:Populate()self.pnltypes={}self.fileid=nil;self.NextSave=nil;self:SetBorderColor(col.grey_light)self.ApplyBtn:SetTooltip'Save'self.Tag:SetText'all'self.scroll:Reset()local m=srp.containers.Get(self.containerid,true)if!m then return end;self.classpanel:Clear()self.classpanel:AddPanel(m.CustomPanel||'srp_dropdown',function(d)d:Dock(FILL)d:SetTextColor(col.white_dark)d:SetBorderColor(b)d:DockMargin(0,0,0,0)self.classinput=d end)if m.PopulateClasses then self.classinput:Clear()m:PopulateClasses(self.classinput)end;local n=LocalPlayer():GetGamemasterTag()for o,p in ipairs(m.ValidTypes)do local q=srp.containers.GetType(p,true)if!q then return end;srp.ui.Create('srp_label',function(h)h:Dock(TOP)h:SetText(q.Name)h:DockMargin(6,0,0,0)self.scroll:AddItem(h)end)srp.ui.Create(q.PanelName||'srp_textinput',function(c)c:SetParent(canvas)c:Dock(TOP)c:DockMargin(5,0,5,5)if c.SetTextColor then c:SetTextColor(col.white_dark)end;if c.SetBorderColor then c:SetBorderColor(b)end;if q.PanelCreated then q:PanelCreated(c)elseif q.Bounds then local r=q.Bounds.Min||0;local s=q.Bounds[n]||q.Bounds.Max||r;c:SetMinMax(r,s)end;self.scroll:AddItem(c)self.pnltypes[p]=c end)end end;function a:Validate()local t={}local u=LocalPlayer()for p,c in pairs(self.pnltypes)do local q=srp.containers.GetType(p)local v=c:GetValue()local w=q:Validation(u,v)if w then v=w!=true&&w||v;c:SetValue(v)table.insert(t,{q.internal,v})else return end end;return t end;function a:SaveToDisk(x)if!self.fileid then self.fileid=self.classinput:GetValue()..'_'..os.time()self.ApplyBtn:SetTooltip(self.fileid)end;local g={FileID=self.fileid,ContainerID=self.containerid,Class=self.classinput:GetValue(),Types={},Tags=string.Explode(',',self.Tag:GetValue())}for p,c in pairs(self.pnltypes)do table.insert(g.Types,{p,c:GetValue()})end;local y=x&&util.Compress(util.TableToJSON(g))||util.TableToJSON(g,true)file.Write(self.folder..self.containerid..'_'..self.fileid..'.json',y)end;function a:Load(g,z)if!self.typedd:ChooseOption(g.ContainerID)then self:Remove()return end;self.fileid=g.FileID;self.folder=z;self.classinput:SetValue(g.Class)self.ApplyBtn:SetTooltip(self.fileid)if srp.containers.GetActive(self.fileid)then self:SetBorderColor(col.green)end;if g.Tags then self.Tag:SetText(table.concat(g.Tags,','))end;for o,A in pairs(g.Types)do if self.pnltypes[A[1]]then self.pnltypes[A[1]]:SetValue(A[2])end end end;function a:Unload()if!self.fileid then return end;local m=srp.containers.Get(self.containerid,true)local B=self.classinput:GetValue()net.Start'srp.containers.Remove'net.WriteUInt(m.internal,3)net.WriteString(B)net.WriteString(self.fileid)net.SendToServer()end;function a:Delete()if self.fileid then file.Delete(self.folder..self.containerid..'_'..self.fileid..'.json')end end;function a:Save(C)if self.NextSave&&self.NextSave>CurTime()then return end;if!self.containerid then return end;if self.Tag:GetValue()==''then return end;local g=self:Validate()if!g then return end;local B=self.classinput:GetValue()local D=srp.containers.Get(self.containerid,true)if!D||!D:Validate(LocalPlayer(),B)then return end;self:SaveToDisk()self.NextSave=CurTime()+1;net.Start'srp.containers.Set'net.WriteUInt(D.internal,3)net.WriteString(self.fileid)if D.Apply!=nil then net.WriteBool(D.Apply)else net.WriteBool(C)end;net.WriteString(B)net.WriteUInt(#g,6)for k=1,#g do net.WriteUInt(g[k][1],6)net.WriteString(g[k][2])end;net.SendToServer()end;vgui.Register('srp_container',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/domination/domination_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/eventmode/mode_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/eventmode/ui/eventypes_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/objectives/objectives_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/ui/agenda_ui.lua:
local a={}function a:Init()self:DockPadding(0,0,0,0)self:SetBackgroundColor(col.midnight)self:AddPanel('srp_panel',function(b)b:SetBackgroundColor(col.midnight_dark)b:Dock(TOP)b:SetTall(30)b:DockPadding(4,4,4,4)b:DockMargin(0,0,0,0)b:AddPanel('srp_button_rounded',function(c)c:SetFont'SSRPForkAwesome'c:SetText''c:Dock(LEFT)c:DockMargin(0,0,0,0)c:SetBackgroundColor(col.green)c:SetHoverColor(col.green)c:SetWide(50)c:LeftClick(function()self.Markdown:SetVisible(false)srp.gamemaster.GetInfo()end)end)if LocalPlayer():IsHeadGamemaster()then b:AddPanel('srp_button_rounded',function(c)c:SetText'Edit Agenda'c:Dock(LEFT)c:DockMargin(4,0,0,0)c:SetBackgroundColor(col.midnight)c:SetHoverColor(col.midnight_light)c:LeftClick(function()self:ShowEditMenu()end)end)end end)self:AddPanel('srp_markdown',function(d)d:Dock(FILL)d:SetText'# Not available at this time.'d:SetContentAlignment(7)d:DockMargin(0,0,0,0)d:SetVisible(srp.gamemaster.agenda!=nil)d:Dock(FILL)self.Markdown=d end)self:AddPanel('srp_panel',function(b)b:Dock(BOTTOM)b:SetVisible(false)b:SetTall(0)b:SetBackgroundColor(col.midnight_dark)b:SetBorderColor(col.midnight_dark)b:DockPadding(10,10,10,10)b:AddPanel('srp_textinput',function(e)e:Dock(FILL)e:SetMultiline(true)e:SetBorderColor(col.transparent)e:SetBackgroundColor(col.transparent)e:SetFont'groupplate.description'e:DockMargin(2,2,2,2)e:OnChanged(function(f,e,g)self.Markdown:SetMarkdown(e)end)self.EditInput=e end)b:AddPanel('srp_panel',function(h)h:SetBackgroundColor(col.transparent)h:SetBorderColor(col.transparent)h:Dock(BOTTOM)h:SetTall(30)h:DockPadding(0,0,0,0)h:DockMargin(1,1,1,1)h:AddPanel('srp_button_rounded',function(c)c:SetText'Submit'c:Dock(FILL)c:DockMargin(0,0,0,0)c:SetBackgroundColor(col.midnight_light)c:SetHoverColor(col.midnight)c:SetBorderColor(col.transparent)c:LeftClick(function()net.Start'srp.gamemaster.SetAgenda'net.WriteString(self.EditInput:GetText())net.SendToServer()self:HideEditMenu()end)end)h:AddPanel('srp_button_rounded',function(c)c:SetText'X'c:Dock(RIGHT)c:DockMargin(0,0,0,0)c:SetBackgroundColor(col.midnight_light)c:SetHoverColor(col.midnight)c:SetWide(50)c:LeftClick(function()self:HideEditMenu()end)end)end)self.EditMenu=b end)hook('OnGamemasterAgendaChanged',self,function(self,i)if IsValid(self.Markdown)then self.Markdown:SetText(i)self.EditInput:SetText(i)self.Markdown:SetVisible(true)end end)if srp.gamemaster.agenda then self.Markdown:SetText(srp.gamemaster.agenda)self.EditInput:SetText(srp.gamemaster.agenda)end end;function a:ShowEditMenu()self.EditMenu:SetVisible(true)self.EditMenu:SizeTo(-1,300,.25,0,-1,function()if IsValid(self.Markdown)then self.Markdown:InvalidateLayout(true)end end)end;function a:HideEditMenu(j)self.EditMenu:SizeTo(-1,0,.25,0,-1,function()if IsValid(self.EditMenu)then self.EditMenu:SetVisible(false)end;if IsValid(self.Markdown)then self.Markdown:InvalidateLayout(true)end end)end;function a:OnRemove()hook.Remove('OnGamemasterAgenda',self)end;vgui.Register('srp_gmagenda',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/ui/fogcontroller_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/ui/gmmodels_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/group_sh.lua:
srp.groups=srp.groups||{}srp.groups.groupcache={}srp.groups.groupcache_mapped={}srp.permissions={none=0}nw.Register'srp.groups.id':Write(net.WriteUInt,5):Read(net.ReadUInt,5):SetPlayer():SetHook'OnPlayerGroupChanged'nw.Register'srp.groups.trained':Write(net.WriteBool):Read(net.ReadBool):SetLocalPlayer()nw.Register'srp.groups.color':Write(net.WriteColor):Read(net.ReadColor):SetPlayer()local function a(b,c,d)for e,f in pairs(c)do if IsValid(f)&&(!d||!f:IsAFK())then table.insert(b,f)end end;return b end;local g={}local h={}local i={}local j={}local k={}local l={}local m={}m.__index=m;function m:Init()self.loaded=false;self.color=Color(255,255,255)self.desc='The description for this battalion is empty.'self.permissions=0;self.maxcharacters=600;self.tags={}self.attributes={}self.loadout={}self.settings={}self.metainfo={}self.players={}self.children={}self.children_mapped={}self.characters={}self.ranks={}self.ranks_mapped={}self.ranks_paged={}self.classes={}self.classes_mapped={}self.classes_paged={}self.lorenames={}self.lorenames_mapped={}self.lorenames_paged={}self.canleave=true;self.agenda=''self.money=0;self.blacklists={}self.webhooks={}self.upgrades={}end;function m:SetUpgrades(b)self.upgrades={}if!b then return end;for n,o in pairs(b)do self.upgrades[n]=o end end;function m:SetUpgrade(n,o)self.upgrades[n]=o||1 end;function m:GetUpgrade(n)local p=self:GetParent(true)return p.upgrades[n]||0 end;function m:GetUpgrades()local p=self:GetParent(true)return p.upgrades||{}end;function m:AddWebhooks(b)for q=1,#b do local r=b[q]local j=r.settings&&util.JSONToTable(r.settings)if webhook.Register(self.id,r.url,r.mask,j,true,true)then self.webhooks[r.url]={identifier=r.identifier,mask=r.mask,settings=j}end end end;function m:GetWebhooks()return self.webhooks end;function m:AddWebhook(s,t,u,j)local v,w=webhook.Register(self.id,t,u,j,true)if v then self.webhooks[w]={identifier=s,mask=u,settings=j}end;return v,w end;function m:RemoveWebhook(t)if self.webhooks[t]then self.webhooks[t]=nil;return webhook.RemoveByUrl(t)else return false end end;function m:SetName(x)self.name=x;return self end;function m:SetDiscord(y)self.discord=y;return self end;function m:GetDiscord()return self.discord end;function m:SetMoney(z,A)self.money=z end;function m:AddMoney(z,A)if z>0 then self:SendMessage('GroupGold',z)end;local B=math.Clamp(self.money+z,0,40)self:SetMoney(B,A)end;function m:GetMoney()return self.money end;function m:CanAfford(C)return self.money>=C end;function m:GetName()return self.name end;function m:AddLog(D,...)srp.groups.AddLog(self,D,...)end;function m:AddLogMessage(D,...)self:SendMessage(D,...)self:AddLog(D,...)end;function m:SetAbbreviation(E)self.abbreviation=E;return self end;function m:GetAbbreviation()return self.abbreviation||self.id end;function m:IsLoaded()return self.loaded end;function m:SetLoaded(F)self.loaded=F;return self end;function m:SetCoverImage(G)self.coverimg=G;return self end;function m:GetCoverImage()return self.coverimg end;function m:SetParent(y,internal)local H=srp.groups.Get(y,internal)if H then H:AddChild(self.id)end;return self end;function m:GetParent(I)if self.parent then return srp.groups.Get(self.parent)elseif I then return self end end;function m:SetAllegianceID(y)self.allegiance=y;return self end;function m:GetAllegianceID()return self.allegiance end;function m:AddChild(y,internal)local J=srp.groups.Get(y,internal)J.parent=self.id;self.children[J.id]=J;table.insert(self.children_mapped,J)return self end;function m:IsConnected(H)return self.id==H.id||self.parent&&self.parent==H.id||self.children[H.id]end;function m:GetChildren(K)return K&&self.children_mapped||self.children end;function m:GetPlayers(L,d)if!L then return a({},self.players,d)else local M=a({},self.players,d)local p=self:GetParent()if p then M=a(M,p.players,d)end;for y,J in pairs(self.children)do M=a(M,J.players,d)end;return M end end;function m:SendMessage(N,...)local M=self:GetPlayers(true)if M then srp.notif.AddChatNotifTab('Group',M,self:GetColor(),'['..self:GetName()..'] ',term.Get(N),...)end end;function m:GetChild(y,internal)if y==self.id||internal&&self.internal==y then return self end;local H=srp.groups.Get(y,internal)if H&&H.parent==self.id then return H end end;function m:GetConnected(y,internal,f)if y==self.id||internal&&self.internal==y then return self end;local p=self:GetParent()if p&&(internal&&p.internal==y||p.id==y)then return p end;return self:GetChild(y,internal)end;function m:SetColor(O)self.color=O:Copy()self.altcolor=O:Copy()self.altcolor.a=150;return self end;function m:GetColor()return self.color end;function m:GetAltColor()return self.altcolor end;function m:SetAgenda(E)self.agenda=E;return self end;function m:GetAgenda()return self.agenda end;function m:SetPrivateAgenda(E)self.privateagenda=E;return self end;function m:GetPrivateAgenda()return self.privateagenda end;function m:LoadBlacklist(P)self.blacklists={}for e,Q in ipairs(P)do self.blacklists[Q.blacklisted]=Q end;return self end;function m:IsBlacklisted(R)return self:GetParent(true).blacklists[R]end;function m:AddBlacklist(Q)self:GetParent(true).blacklists[Q.blacklisted]=Q||{}end;function m:RemoveBlacklist(R)self:GetParent(true).blacklists[R]=nil end;function m:GetBlacklist()return self:GetParent(true).blacklists end;function m:LoadSettings(Q)self.settings={}for e,S in ipairs(Q)do local T=tonumber(S.value)if T then self.settings[S.key]=T elseif S.value=='true'||S.value=='false'then self.settings[S.key]=tobool(S.value)else self.settings[S.key]=S.value end end;return self end;function m:GetSettings()return self:GetParent(true).settings end;function m:GetSetting(U,V)return self:GetParent(true).settings[U]||V end;function m:SetSetting(U,T)self:GetParent(true).settings[U]=T;return self end;function m:SetSettings(b)self:GetParent(true).settings=b;return self end;function m:LoadTags(Q)self.tags={}for e,W in ipairs(Q)do local X=Color(25,25,25)X:SetEncodedRGB(W.color||0)self.tags[W.id]={id=W.id,name=W.name,color=X}end;return self end;function m:AddTag(y,x,X)self.tags[y]={id=y,name=x,color=X}return self end;function m:GetTag(y)return self.tags[y]end;function m:RemoveTag(y)self.tags[y]=nil end;function m:SetAttribute(y)table.insert(self.attributes,y)return self end;function m:SetAttributes(b)self.attributes=b;return self end;function m:HasAttribute(y)return table.HasValue(self.attributes,y)end;function m:GetAttributes()return self.attributes end;function m:SetMeta(U,Y)self.metainfo[U]=Y;return self end;function m:GetMeta(U)return self.metainfo[U]end;function m:SetStat(U,Y)self.metainfo[U]=Y;return self end;function m:GetStat(U,V)local Z=self.metainfo[U]if istable(Z)then return Z[self.id]||Z.default||V else return Z||V end end;function m:SetVIP(F)self.vip=F==nil&&true||F;return self end;function m:IsVIP()return self.vip end;function m:SetHidden(F)self.hidden=F==nil&&true||F;return self end;function m:GetHidden()return self.hidden end;function m:CanLeave()return self.canleave end;function m:SetCanLeave(F)self.canleave=F;return self end;function m:SetSpawn(_,a0)self.grid=util.MakeGrid(_,a0)return self end;function m:GetSpawn()return self.grid end;function m:SetPermissions(...)for e,Y in ipairs({...})do self.permissions=bit.bor(self.permissions,Y)end;return self end;function m:GetPermissions()return self.permissions end;function m:AddPermissions(y)if!self:HasPermission(y)then self.permissions=bit.bor(self.permissions,srp.permissions[y])end;return self end;function m:HasPermission(y)local a1=srp.permissions[y]return a1&&bit.band(self.permissions,a1)==a1 end;function m:IsInGroup(a2)return self.characters[a2]end;function m:IsInConnectedGroup(f)local H=f:GetGroup()return H&&self:IsConnected(H)end;function m:AddCharacter(a2,a3,Q,internal,a4)local Q=Q||{}Q.characterid=a2;Q.rid=a3;Q.added=Q.added||os.time()Q.updated=Q.updated||os.time()Q.lastseen=Q.lastseen||os.time()Q.tags=Q.tags||{}local a5=self:IsInGroup(a2)Q.lorename=Q.lorename||a5&&a5.lorename;Q.class=Q.class||a5&&a5.class;Q.name=Q.name||a5&&a5.name;Q.steamid=Q.steamid||a5&&a5.steamid;local a6=self:GetRank(a3,internal)if!a6 then return end;if!a4 then self:RemoveCharacter(a2)end;a6:AddCharacter(a2,Q,internal,a4)if Q.class then local a7=self:GetClass(Q.class)if a7 then a7:AddCharacter(a2,Q,internal,a4)end end;i[a2]=self.id;self.characters[a2]=Q;return Q end;function m:RemoveCharacter(a2)if!self.characters[a2]then return false end;local a6=self:GetCharacterRank(a2)if a6 then a6:RemoveCharacter(a2)end;local a7=self:GetCharacterClass(a2)if a7 then a7:RemoveCharacter(a2)end;local Q=self.characters[a2]i[a2]=nil;self.characters[a2]=nil;self.players[a2]=nil;return Q end;function m:AddCharacters(a8,internal,a4)self.characters={}self.players={}for e,a6 in pairs(self.ranks)do a6:Clear()end;for e,a7 in pairs(self.classes)do a7:Clear()end;for q=1,#a8 do local a9=a8[q]a9.characterid=tonumber(a9.characterid)self:AddCharacter(a9.characterid,a9.rid,a9,internal,a4)end;return self end;function m:LoadPlayer(f)local a2=f:CharacterID()if!a2 then return end;local a6=self:GetCharacterRank(a2)local a7=self:GetCharacterClass(a2)local aa=self:GetCharacterLoreName(a2)if!a6 then return end;f:SetNetVar('srp.groups.id',self.internal)f:SetNetVar('srp.groups.rid',a6.internal)f:SetNetVar('srp.groups.cid',a7&&a7.internal||nil)f:SetNetVar('srp.groups.lid',aa&&aa.internal||nil)self.players[a2]=f;if self.privateagenda then net.Start'srp.groups.AgendaChanged'net.WriteGroup(self)net.WriteString(self.privateagenda)net.WriteBool(true)net.Send(f)end;if a6 then a6:PlayerLoaded(f)end;self:SetModel(f)self:SetTag(f)hook.Run('OnGroupLoadedPlayer',f)return true end;function m:GetModel()if self.model then return self.model else local y=self:GetMeta('mode_id')||self.id:lower()local ab=self:GetMeta('model_category')||'trooper'return srp.groups.modelpath..y..'/'..ab..'.mdl'end end;function m:SetGlobalModel(ac)self.globalModel=ac;return self end;function m:GetGlobalModel()return self.globalModel end;function m:SetModel(f)local a2=f:CharacterID()if!a2 then return end;local ad=cosmetics.GetEquipped(f,'player',cosmetics.APPEARANCE,cosmetics.SLOT.APPEARANCE.MODEL)local a6=self:GetCharacterRank(a2)local a7=self:GetCharacterClass(a2)local aa=self:GetCharacterLoreName(a2)local ae=a7&&a7:GetStat('modelscale')||a6:GetStat('modelscale')||1;local af=ad&&ad:GetModel()||aa&&aa:GetModel()||a7&&a7:GetModel()||self:GetGlobalModel()||a6:GetModel()||self:GetModel()local ag=a7&&a7:GetBodyGroups()||a6:GetBodyGroups()local ah=a7&&a7:GetSkin()||a6:GetSkin()if af then f:SetModel(af)else f:GetAllegiance():SetModel(f)end;if ag then f:SetBodyGroups(ag)end;if ae then f:SetSize(ae)end;if ah then f:SetSkin(ah)end;local O=self:GetColor()f:SetPlayerColor(Vector(O.r/255,O.g/255,O.b/255))end;function m:UnloadPlayer(f)if!f:CharacterID()then return end;local ai=f:GetCharacter()if!ai then return end;f:SetNetVar('srp.character.name',ai.name)f:SetNetVar('srp.groups.id',nil)f:SetNetVar('srp.groups.rid',nil)f:SetNetVar('srp.groups.cid',nil)f:SetNetVar('srp.groups.lid',nil)self.players[f:CharacterID()]=nil end;function m:AddRank(y,internal)local a6=srp.granks.Get(y,internal)a6=a6&&table.Copy(a6)if a6 then a6:SetGroup(self)self.ranks[a6.id]=a6;self.ranks_mapped[a6.internal]=a6;table.insert(self.ranks_paged,a6)end end;function m:GetRank(y,internal)return internal&&self.ranks_mapped[y]||self.ranks[y]end;function m:GetRanks(aj)return aj&&self.ranks_paged||self.ranks_mapped end;function m:GetRankPage(y)return self.ranks_paged[y]end;function m:SetRankGroup(y,internal)self.rank_group=y;self.ranks={}self.ranks_mapped={}local ak=srp.granks.GetGroup(y,internal)if!ak then return self end;for q=1,#ak do local al=srp.granks.Get(ak[q],internal)local a6=al&&table.Copy(al)if a6 then a6:SetGroup(self)self.ranks[a6.id]=a6;self.ranks_mapped[a6.internal]=a6;table.insert(self.ranks_paged,a6)end end;return self end;function m:GetRankGroup()return self.rank_group end;function m:AddClass(y,internal)local a6=srp.granks.Get(y,internal)a6=a6&&table.Copy(a6)if a6 then a6:SetGroup(self)self.classes[a6.id]=a6;self.classes_mapped[a6.internal]=a6;table.insert(self.classes_paged,a6)end;return self end;function m:AddClasses(...)for e,am in ipairs({...})do self:AddClass(am)end;return self end;function m:GetClass(y,internal)return internal&&self.classes_mapped[y]||self.classes[y]end;function m:GetClasses()return self.classes_paged end;function m:AddLoreName(y,internal)local a6=srp.granks.Get(y,internal)a6=a6&&table.Copy(a6)if a6 then a6:SetGroup(self)self.lorenames[a6.id]=a6;self.lorenames_mapped[a6.internal]=a6;table.insert(self.lorenames_paged,a6)end;return self end;function m:AddLoreNames(...)for e,am in ipairs({...})do self:AddLoreName(am)end;return self end;function m:GetLoreName(y,internal)return internal&&self.lorenames_mapped[y]||self.lorenames[y]end;function m:GetLoreNames()return self.lorenames_paged end;function m:SetClass(a2,y,Q,internal)local a7=self:GetClass(y,internal)local ai=self.characters[a2]if!ai||!a7 then return false end;local an=self:GetCharacterClass(a2)if an then an:RemoveCharacter(a2)end;ai.class=a7.id;a7:AddCharacter(a2,ai)return true end;function m:SetLoreName(a2,y,Q,internal)local aa=self:GetLoreName(y,internal)local ai=self.characters[a2]if!ai||!aa then return false end;local ao=self:GetCharacterLoreName(a2)if ao then ao:RemoveCharacter(a2)end;ai.lorename=aa.id;aa:AddCharacter(a2,ai)return true end;function m:RemoveCharacterClass(a2)local a7=self:GetCharacterClass(a2)local ai=self.characters[a2]if!a7||!ai then return end;ai.class=nil;a7:RemoveCharacter(a2)return true end;function m:RemoveCharacterLoreName(a2)local aa=self:GetCharacterLoreName(a2)local ai=self.characters[a2]if!aa||!ai then return end;ai.lorename=nil;aa:RemoveCharacter(a2)return true end;function m:GetCharacterRank(a2)return self.characters[a2]&&self:GetRank(self.characters[a2].rid)end;function m:GetCharacterClass(a2)return self.characters[a2]&&self:GetClass(self.characters[a2].class)end;function m:GetCharacterLoreName(a2)return self.characters[a2]&&self:GetLoreName(self.characters[a2].lorename)end;function m:GetCharacter(a2)return self.characters[a2]end;function m:OnPlayerJoined(ap)self.PlayerJoined=ap end;function m:OnPlayerLeft(ap)self.PlayerLeft=ap end;function m:PlayerJoined(f,aq)end;function m:PlayerLeft(f,aq)end;function m:SetLoadout(b,ar)self.loadout=b;return self end;function m:SetUtility(b)self.utility=b;return self end;function m:GetUtility()return self.utility end;function m:GetLoadout()return self.loadout end;function m:Give(f,as)for y,at in pairs(as||{})do if isstring(at)then f:Give(at,false,true)else if at[self.id]then self:Give(f,at)end end end end;function m:GiveLoadout(f)local a2=f:CharacterID()local a6=self:GetCharacterRank(a2)if!a6 then return false end;local a7=self:GetCharacterClass(a2)local as=a6:GetLoadout()||{}local au=a7&&a7:GetLoadout()local av=a7&&a7:GetUtility()local aw=a7&&a7:HasPermission'jedi'local ax=self:GetUtility()if ax&&!(a7&&a7.noutility)then self:Give(f,ax)end;if av then self:Give(f,av)end;if a7&&au&&(aw||a7.loadoutonly)then self:Give(f,au)return true end;if as&&(aw||a6.loadoutonly)then self:Give(f,as)return true end;if a6:GetMeta('ForceLoadout')then table.Merge(as,au||{})elseif a7 then as=au||as end;local ay=self:GetLoadout()if ay then self:Give(f,ay)end;self:Give(f,as)return true end;function m:SetMaxCharacters(az)self.maxcharacters=az;return self end;function m:GetMaxCharacters()return self.maxcharacters end;function m:IsFull()return self.maxcharacters&&self.maxcharacters>0&&table.Count(self.characters)>=self.maxcharacters||false end;function m:GetCharacterCount()return table.Count(self.characters)end;function m:AddRoleClass(y,a6)self.class[a6.internal]=a6;return self end;function m:SetTag(f)local a2=f:CharacterID()local a6=self:GetCharacterRank(a2)local a7=self:GetCharacterClass(a2)local aa=self:GetCharacterLoreName(a2)local aA=aa&&aa:GetCharacterName()||a7&&a7:GetCharacterName()||f:GetCharacter().name;local aB=self:GetAbbreviation()local aC=aa&&aa:GetTag()||a7&&a7:GetTag()||a6:GetTag()||a6.id;if a7&&a7:GetTag()&&a7:ShouldDisplayRank()!=false then aC=(a6:GetTag()||a6.id)..' '..a7:GetTag()end;f:SetNetVar('srp.character.name',aA)if aB==''then f:SetTag(aC)elseif aC==''then f:SetTag(aB)else f:SetTag(aB..' '..aC)end end;function m:Notify(aD,...)srp.notif.Neutral(self:GetPlayers(true),aD,...)end;function m:LoadExternal()local y=self.internal;PLAYER['Is'..self.id:Replace(' ','_'):Replace('-','_')]=function(f)return f:GetNetVar('srp.groups.id')==y end;return self end;function srp.groups.Create(y,x)if srp.groups.groupcache[y]then return srp.groups.groupcache[y]end;local aE={internal=-1,id=y}setmetatable(aE,m)aE:Init()aE:SetName(x||y)aE.internal=table.insert(srp.groups.groupcache_mapped,aE)srp.groups.groupcache[y]=aE;return aE end;function srp.groups.Get(y,internal)return internal&&srp.groups.groupcache_mapped[y]||srp.groups.groupcache[y]end;function srp.groups.GetAll(K)return K&&srp.groups.groupcache_mapped||srp.groups.groupcache end;function srp.groups.GetByName(x)for e,at in pairs(srp.groups.groupcache)do if at&&string.lower(at.name)==string.lower(x)then return at end end end;function srp.groups.AddPermissions(b)local q=table.Count(srp.permissions)-1;for e,x in ipairs(b)do srp.permissions[x]=bit.lshift(1,q)q=q+1 end end;function srp.groups.RegisterUpgrade(y,b)b.id=y;b.cost=b.cost||100;b.max=b.max||3;b.internal=table.insert(h,b)g[y]=b end;function srp.groups.GetUpgrade(y,internal)return internal&&h[y]||g[y]end;function srp.groups.GetUpgrades(internal)return internal&&h||g end;local function aF(self,T)net.WriteString(T)end;local function aG(self,T)return net.ReadString(T)end;local function aH(self,T)return true end;local function aI(self,T)return tostring(T)end;local function aJ(self,T)return T end;function srp.groups.SetSettingConfig(U,b)if!b then b={}end;b.id=U;b.Write=b.Write||aF;b.Read=b.Read||aG;b.Validate=b.Validate||aH;b.Serialize=b.Serialize||aI;b.Deserialize=b.Deserialize||aJ;j[b.id]=b;local aK=b.Category||'Misc'if!l[aK]then l[aK]={}end;table.insert(l[aK],b)b.internal=table.insert(k,b)end;function srp.groups.GetSettingConfig(U)return internal&&k[internal]||j[U]end;function srp.groups.GetSettingConfigsByCategory()return l end;function srp.groups.GetSettingConfigs()return k end;function PLAYER:IsHealer(a7)local a7=a7||self:GetGroupClass()return a7&&a7:HasPermission('medic')end;function PLAYER:IsTrained()return self:GetNetVar('srp.groups.trained')||false end;function PLAYER:SetTrained(F,A)self:SetNetVar('srp.groups.trained',F)if F then ParticleEffectAttach('lvlup_master',PATTACH_POINT_FOLLOW,self,0)self:EmitSound('galactic/level_up.wav',55,100,1,CHAN_AUTO)end;hook.Run('OnPlayerNoGroup',self)self:SetData('trained',F==true&&1||0,function()if A then A(true,self)end end)end;function PLAYER:GetGroup()local y=self:GetNetVar('srp.groups.id')if y then return srp.groups.Get(y,true)end end;function PLAYER:GetGroupID()return self:GetNetVar('srp.groups.id')end;function PLAYER:GetGroupTag()local y=self:GetNetVar('srp.groups.id')if y then return srp.groups.Get(y,true).id end end;function PLAYER:GetFullTag()local H=self:GetGroup()local a6=self:GetGroupRank()if H&&a6 then return table.concat({H.id,a6:GetName()},' ')end end;PLAYER.O_Team=PLAYER.O_Team||PLAYER.Team;team.O_GetColor=team.O_GetColor||team.GetColor;function PLAYER:Team()local aL=self:GetGroup()if aL then return aL.internal end;local aM=self:GetAllegiance()if aM then return aM.internal+50 end;return self:O_Team()end;function team.GetColor(q)local aL=srp.groups.Get(q,true)if aL then return aL:GetColor()end;local aM=srp.allegiance.Get(q-50,true)if aM then return aM.color end;return aL&&aL:GetColor()||team.O_GetColor(q)end;srp.groups.RegisterUpgrade('storageweight',{name='Extra Storage',description='Increases group storage by 2.5kg',icon=Material'galactic/ui/backpack.png',max=10,cost=20})srp.groups.RegisterUpgrade('patrolcd',{name='Patrol Cooldown',description='Wait 30 seconds less before you can run your next patrol.',icon=Material'galactic/ui/triumphs/patrol.png',max=10,cost=15})srp.groups.SetSettingConfig('motd',{Name='Message of the Day',Category='General',Settings={Min=0,Max=200},Validate=function(self,H,T)return T&&#T<=self.Settings.Max end,OnSet=function(self,H,T)srp.groups.SendMessageOfTheDay(H,H:GetPlayers(true))end})local aN=86400;local aO={{name='3 Days',value=aN*3},{name='5 Days',value=aN*5},{name='7 Days',value=aN*7},{name='14 Days',value=aN*14},{name='21 Days',value=aN*21},{name='28 Days',value=aN*28},{name='35 Days',value=aN*35},{name='42 Days',value=aN*42},{name='56 Days',value=aN*56}}srp.groups.SetSettingConfig('loa_timer',{Name='LOA Timer',Panel='srp_dropdown_rounded',Category='General',Blacklist={'JEDI','SENATOR'},SetupPanel=function(self,p,aP)return aP:AddPanel('srp_dropdown_rounded',function(aQ)aQ:SetText''aQ:Dock(TOP)for q,b in ipairs(aO)do aQ:AddOption(b.name,b)end end)end,SetValue=function(self,p,aP,aR,T)aR:SetValue(T)end,GetValue=function(self,p,aP,aR,T)return aR:GetValue()end,Write=function(self,T)net.WriteUInt(T,23)end,Read=function(self)return net.ReadUInt(23)end,Deserialize=function(self,T)return tonumber(T)end,Validate=function(self,H,T)return tonumber(T)>=aO[1].value&&tonumber(T)<=aO[#aO].value end})srp.groups.SetSettingConfig('openinvite',{Name='Public Invite',Panel='ui_checkbox',Category='Recruitment',Blacklist={'JEDI','SENATOR','CG'},SetupPanel=function(self,p,aP)return aP:AddPanel('ui_checkbox',function(aS)aS:SetText''aS:SizeToContents()aS:SetPos(10,10)end)end,SetValue=function(self,p,aP,aR,T)aR:SetChecked(T)end,GetValue=function(self,p,aP,aR,T)return aR:GetChecked()end,Write=function(self,T)net.WriteBool(T)end,Read=function(self)return net.ReadBool()end,Deserialize=function(self,T)return tobool(T)end,Validate=function(self,H,T)return tobool(T)==T end})srp.groups.SetSettingConfig('tryoutadvert',{Name='Tryout Advert',Category='Recruitment',Blacklist={'JEDI','SENATOR'},Settings={Min=0,Max=2048},Validate=function(self,H,T)return T&&#T<=self.Settings.Max end,SetupPanel=function(self,p,aP)p:SetTall(200)p.Name:SetContentAlignment(7)local aT=aP:AddPanel('srp_textinput_rounded',function(aQ)aQ:Dock(LEFT)aQ:SetWide(200)aQ:SetMultiline(true)aQ:OnChanged(function(aU,aV,aW)aP.Markdown:SetMarkdown(aV)end)end)aP:AddPanel('srp_markdown',function(aX)aX:DockMargin(2,2,2,2)aX:DockPadding(0,0,0,0)aX:Dock(FILL)aX:SetText'#### Not available at this time.'aX:SetContentAlignment(7)aP.Markdown=aX end)return aT end,SetValue=function(self,p,aP,aR,T)aR:SetValue(T)aP.Markdown:SetMarkdown(T)end})
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/groupcmd_sh.lua:
srp.AddCommand('gsetloa',function(a,b,c,d)srp.groups.SetLOA(a,c,d==1,b,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('gsetplayernoteid',function(a,b,c,e)srp.groups.SetPlayerNote(a,b,c,e,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):AddParam(cmd.STRING):SetCooldown(2)srp.AddCommand('gsetplayernote',function(a,f,c,e)srp.groups.SetPlayerNote(a,f:CharacterID(),c,e,false)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.WORD):AddParam(cmd.STRING):SetInfoSection('Battalion'):SetInfo('Sets the note of the specified player in the given group.'):SetInfoArgs({'Target - The SteamID/Name','GroupID - The Group Ticker','Text - The note'}):SetCooldown(2)srp.AddCommand('gaddchartag',function(a,c,g,h)srp.groups.AddCharacterTag(a,c,g,h)end):AddParam(cmd.STRING):AddParam(cmd.UINT):AddParam(cmd.UINT):SetInfoSection('Battalion'):SetInfo('Sets a tag on the specified player of the given group.'):SetInfoArgs({'GroupID - The Group Ticker','ID - The character ID','Tag - The Tag'}):SetCooldown(2)srp.AddCommand('gaddchartagid',function(a,c,g,h)srp.groups.AddCharacterTag(a,c,g,h,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('gremovechartag',function(a,c,g,h)srp.groups.RemoveCharacterTag(a,c,g,h)end):AddParam(cmd.STRING):AddParam(cmd.UINT):AddParam(cmd.UINT):SetInfoSection('Battalion'):SetInfo('Removes a tag from specified player of the given group.'):SetInfoArgs({'GroupID - The Group Ticker','ID - The character ID','Tag - The Tag'}):SetCooldown(2)srp.AddCommand('gremovechartagid',function(a,c,g,h)srp.groups.RemoveCharacterTag(a,c,g,h,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('gblacklistaddid',function(a,i,j)srp.groups.AddBlacklist(a,i,j,true)end):AddParam(cmd.WORD):AddParam(cmd.STRING):SetCooldown(2)srp.AddCommand('gblacklistremove',function(a,i)srp.groups.RemoveBlacklisted(a,i)end):AddParam(cmd.PLAYER_STEAMID32):SetInfoSection('Battalion'):SetInfo('Removes the blacklist for the specified player in the given group.'):SetInfoArgs({'GroupID - The Group Ticker','Target - SteamID'}):SetCooldown(2)srp.AddCommand('gaddtag',function(a,k)local l=string.Explode(' ',k,false)if#l<3 then return end;local m,n=string.find(l[2],'#%w%w%w%w%w%w')if!m then return end;local o=l[2]:sub(m,n)local c=l[1]local p=table.concat(l,' ',3)local q=Color()q:SetHex(o)srp.groups.AddTag(a,c,p,q)end):AddParam(cmd.STRING):SetInfoSection('Battalion'):SetInfo('Creates a tag with the specified name and colour for the given group.'):SetInfoArgs({'GroupID - The Group Ticker','HexColor - The hex colour','Name - Tag Name'}):SetCooldown(2)srp.AddCommand('gaddtagid',function(a,c,k)local l=k:Explode(' ')if#l<2 then return end;local m,n=string.find(l[1],'#%w%w%w%w%w%w')if!m then return end;local o=l[1]:sub(m,n)local p=table.concat(l,' ',2)local q=Color()q:SetHex(o)srp.groups.AddTag(a,c,p,q,true)end):AddParam(cmd.UINT):AddParam(cmd.STRING):SetCooldown(2)srp.AddCommand('gupdatetag',function(a,c,r,p,s,t,u)local v=Color(math.Clamp(s,0,255),math.Clamp(t,0,255),math.Clamp(u,0,255))srp.groups.UpdateTag(a,r,c,p,v)end):AddParam(cmd.STRING):AddParam(cmd.UINT):AddParam(cmd.STRING):AddParam(cmd.UINT):AddParam(cmd.UINT):AddParam(cmd.UINT):SetInfoSection('Battalion'):SetInfo('Updates a tag with the specified name and RGB colour for the given tagid and groupid.'):SetInfoArgs({'GroupID - The Group Ticker','ID - The Tag ID','Name - Tag Name','R - Red 0-255','G - Green 0-255','B - Blue 0-255'}):SetCooldown(2)srp.AddCommand('gremovetag',function(a,c,r)srp.groups.RemoveTag(a,c,r)end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Battalion'):SetInfo('Removes a tag by the specified Tag ID for the given group.'):SetInfoArgs({'GroupID - The Group Ticker','ID - The Tag ID'}):SetCooldown(2)srp.AddCommand('gremovetagid',function(a,c,r)srp.groups.RemoveTag(a,c,r,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('invite',function(a)net.Start'srp.groups.Invite'net.Send(a)end):SetInfoSection('Battalion'):SetInfo('Opens the invite menu.'):SetCooldown(2).CanRun=function(self,w)local x=w:GetGroupRank()return x&&x:HasPermission('invite')||false end;srp.AddCommand('ginvite',function(a,f,c,y)srp.groups.Invite(a,f:CharacterID(),c,y,false)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.WORD):AddParam(cmd.STRING):SetInfoSection('Battalion'):SetInfo('Invites the specified player for the given group set as the given rank.'):SetInfoArgs({'GroupID - The Group Ticker','Target - The SteamID/Name','RankID - The Rank ID'}):SetCooldown(2)srp.AddCommand('ginviteid',function(a,f,c,y)srp.groups.Invite(a,f,c,y,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('gopenjoinid',function(a,c)srp.groups.OpenJoin(a,c,true)end):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('gtransferid',function(a,b)srp.groups.Transfer(a,b)end):AddParam(cmd.UINT):SetInfoSection('Battalion'):SetInfo('Transfer the player into a connected battalion by characterid.'):SetInfoArgs({'Target - The characterid of the person transfering'}):SetCooldown(2)srp.AddCommand('gtransfer',function(a,f)local b=f:CharacterID()if b&&b>0 then srp.groups.Transfer(a,b)end end):AddParam(cmd.PLAYER_ENTITY):SetInfoSection('Battalion'):SetInfo('Transfer the player into a connected battalion by player.'):SetInfoArgs({'Target - The characterid of the person transfering'}):SetCooldown(2)srp.AddCommand('gpromote',function(a,f,c,z)srp.groups.Promote(a,f:CharacterID(),c,z,false)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.WORD):AddParam(cmd.STRING):SetInfoSection('Battalion'):SetInfo('Promotes or Demotes the specified player to the given rank in the given group.'):SetInfoArgs({'Target - The SteamID/Name','GroupID - The Group Ticker','RankID - The Rank ID'}):SetCooldown(2)srp.AddCommand('gpromoteid',function(a,b,c,z)srp.groups.Promote(a,b,c,z,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('gsetclass',function(a,f,c,g)srp.groups.SetPlayerClass(a,f:CharacterID(),c,g,false)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.WORD):AddParam(cmd.STRING):SetInfoSection('Battalion'):SetInfo('Sets the specified player to the given class in the given group.'):SetInfoArgs({'Target - The SteamID/Name','GroupID - The Group Ticker','ClassID - The Class ID'}):SetCooldown(2)srp.AddCommand('gsetclassid',function(a,b,c,g)srp.groups.SetPlayerClass(a,b,c,g,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('gsetlorename',function(a,f,c,A)srp.groups.SetPlayerLoreName(a,f:CharacterID(),c,A,false)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.WORD):AddParam(cmd.STRING):SetInfoSection('Battalion'):SetInfo('Sets the specified player to the given class in the given group.'):SetInfoArgs({'Target - The SteamID/Name','GroupID - The Group Ticker','ClassID - The Class ID'}):SetCooldown(2)srp.AddCommand('gsetlorenameid',function(a,b,c,A)srp.groups.SetPlayerLoreName(a,b,c,A,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('gkick',function(a,f,c)srp.groups.Kick(a,f:CharacterID(),c,false)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING):SetInfoSection('Battalion'):AddAlias('gforcekick'):SetInfo('Kicks the specified target from the given group.'):SetInfoArgs({'Target - The SteamID/Name','GroupID - The Group Ticker'}):SetCooldown(2)srp.AddCommand('gkickid',function(a,g,c)srp.groups.Kick(a,g,c,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('gkickclassid',function(a,g,c)srp.groups.KickClass(a,g,c,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('gkicklorenameid',function(a,A,c)srp.groups.KickLoreName(a,A,c,true)end):AddParam(cmd.UINT):AddParam(cmd.UINT):SetCooldown(2)srp.AddCommand('gleaveclass',function(a)srp.notif.Confirm(a,{title='Leave Class',sub_text='Are you sure you want to leave this class?',duration=30,make_popup=true,OnAnswered=function(l,B)srp.groups.LeaveClass(B)end})end):SetInfoSection('Battalion'):SetInfo('Makes YOU leave your current class.'):SetCooldown(2)srp.AddCommand('gleavelorename',function(a)srp.notif.Confirm(a,{title='Leave Lore Name',sub_text='Are you sure you want to leave this lore name?',duration=30,make_popup=true,OnAnswered=function(l,B)srp.groups.LeaveLoreName(B)end})end):SetInfoSection('Battalion'):SetInfo('Makes YOU leave your current lore name.'):SetCooldown(2)srp.AddCommand('gleave',function(a)srp.notif.Confirm(a,{title='Leave Group',sub_text='Are you sure you want to leave the battalion? Think carefully about this!',duration=30,make_popup=true,OnAnswered=function(l,B)srp.groups.Leave(B)end})end):SetInfoSection('Battalion'):SetInfo('Makes YOU leave your current battalion'):SetCooldown(2)srp.AddCommand('gforceinvite',function(a,f,l)local C=string.Split(l,' ')local c,z,g=C[1],C[2],C[3]srp.groups.ForceInvite(a,f:CharacterID(),c,z,g)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING):SetInfoSection('Battalion'):SetInfo('Like ginvite but sends the invite to the specified target instead. This should only be used for accepting CDR and lore applications.'):SetFlag('D'):SetCooldown(2)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groups_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/ui/hacking_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/ui/hackinginstallpanel_ui.lua:
local a={}function a:Init()self:SetTitle'Security Interface Injector'self:MakePopup()self:SetSize(600,400)self:Center()self:SetBackgroundColor(col.midnight)self:SetAlpha(0)self:AlphaTo(255,.5,0)self:AddPanel('srp_label',function(b)b:SetText'Select an injection module to alter the bomb.'b:Dock(TOP)b:SetContentAlignment(5)b:SetTextColor(col.white)b:SetTall(70)b:SetFont'ui_header.r'end)self:AddPanel('srp_panel_rounded',function(c)c:SetSize(128,128)c:DockMargin(0,0,0,0)c:DockPadding(0,0,0,0)c:SetBorderColor(col.midnight_light)c:SetBackgroundColor(col.midnight_light)c:AddPanel('srp_inventoryitem',function(c)c:Dock(FILL)c:DockMargin(0,0,0,0)c:SetTextColor(col.white)c:OnSelected(function(c,d,e,f)self.SelectedItem=d end)c:OnFilterItem(function(c,d)if d&&d.hackInjector then return true end end)self.invitem=c end)self.container=c end)self:AddPanel('srp_panel_rounded',function(c)c:SetBackgroundColor(col.midnight_light)c:SetSize(225,50)c:AddPanel('srp_button_rounded',function(c)c:Dock(FILL)c:SetText'Attempt Injection'c:DockMargin(0,0,0,0)c:SetBackgroundColor(col.black)c:SetHoverColor(col.green_dark)c:LeftClick(function(g)if!self.SelectedItem then return end;if self.CurrentUpgrade then srp.notif.Confirm({title='Injection Override',sub_text='This will destroy the currently injected module. Do you want to continue?',Machine=self.Machine,SelectedItem=self.SelectedItem,callback=function(h)srp.hacking.RequestInject(h.Machine,h.SelectedItem)end})else srp.hacking.RequestInject(self.Machine,self.SelectedItem)end end)self.recycle=c end)self.controls=c end)hook('OnHackingDeviceInjectionStatusReceived',self,self.OnInjectionUpdated)end;function a:Populate(i)self.Machine=i;local j=i:GetUpgrade()if j then local d=srp.items.Get(j)if d then self.invitem:SetItem(d,{},1)self.CurrentUpgrade=j end end end;function a:OnInjectionUpdated(i,k)if k then self:Remove()end end;function a:OnRemove()hook.Remove('OnHackingDeviceInjectionStatusReceived',self)end;function a:PerformLayout(l,m)self.close:SetPos(l-30,2)if IsValid(self.container)then self.container:SetPos((l-128)*.5,(m-128)*.5)end;if IsValid(self.controls)then self.controls:SetPos((l-225)*.5,(m-50)*.85)end end;vgui.Register('srp_hackinginstallpanel',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hangars/hangar_cl.lua:
srp.hangar=srp.hangar||{}srp.hangar.spawns=srp.hangar.spawns||{}srp.hangar.vehicles=srp.hangar.vehicles||{}function srp.hangar.RequestVehicle(a,b,c)net.Start'srp.hangar.RequestVehicle'net.WriteString(a)net.WriteShort(b)net.WriteShort(c)net.SendToServer()end;net('srp.hangar.SpawnVehicle',function()local a,spawn_id,c,d,e=net.ReadString(),net.ReadUInt(4),net.ReadUInt(4),net.ReadEntity(),net.ReadPlayer()local f=srp.hangar.spawns[a].hangars[spawn_id]if!f then return end;d.spawn_id=spawn_id;d.vehicle_id=c;f.vehicle=d;f.owner=e;hook.Run('OnHangarShipSpawned',e,spawn_id,d)end)net('srp.hangar.DespawnVehicle',function()local f=srp.hangar.spawns[net.ReadString()].hangars[net.ReadUInt(4)]if!f then return end;f.vehicle=nil;f.owner=nil;hook.Run('OnHangarShipDespawned',spawn_id)end)local g;function srp.hangar.Open(h)if IsValid(g)then g:Remove()end;srp.ui.Create('srp_hangar',function(i)i:Populate(h)g=i end)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/menu_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/nameplate_cl.lua:
local a=Material'materials/galactic/ui/warning.png'local b=Material'materials/galactic/ui/hud/cuff.png'local c=Material'sup/hud/istalking'local d=Material'sup/hud/istyping'local e=Material'sup/hud/nickname'local f=math.Approach;local g=Vector(0,0,25)local h=Color(240,240,240,250)local i=Color(0,0,0,255)local j,k=48,48;local l=20;local m=5;surface.CreateFont('ui_nameplate',{font='Clear Sans Medium',size=48,antialias=true})surface.CreateFont('ui_nameplate_hp',{font='Clear Sans Medium',size=32,antialias=true})hook('PostDrawTranslucentRenderables',function(n,o)if o||n then return end;local p=LocalPlayer()if!IsValid(p)then return end;local q=cvar.GetValue'srp_hud'local r=cvar.GetValue'srp_triumpshowtitle'local s=p:HasWeapon'weapon_revive'local t=!IsValid(p:GetActiveWeapon())||p:GetActiveWeapon():GetClass()=='weapon_holster'local u=p:GetRealView()for v=1,#srp.hud.Players do local w=srp.hud.Players[v]if!IsValid(w)||w==p&&!cvar.GetValue('srp_hud_showself')then continue end;local x=q&&!w:GetNetVar'srp.hud.hidden'if w:GetPos():Distance(u)>400||w:GetObserverMode()!=OBS_MODE_NONE then continue end;local y=w:GetShootPos()local z=(y-u):Angle()local A=0;z.p=0;z.y=z.y+-90;z.r=z.r+90;local B={}local C=w:GetChatColor()||col.white;if hook.Run('OnRenderNameplateIcons',w,B)then x=true end;local D=#B*j;local E,F=-150,0;local G=-1*E*2;local H=w:GetTag()..' '..w:Nick()surface.SetFont'ui_nameplate'local I,J=surface.GetTextSize(H)E=I>G&&-(I+10)/2||E;G=I>G&&I+10||G;local K=w:Health()local L=w:Armor()local M=FrameTime()*60*15;w.lerphp=f(w.lerphp||K,K,M)w.lerpap=f(w.lerpap||L,L,M)local N=w.lerphp/w:GetMaxHealth()local O=math.Clamp(N,0,1)local P=N>1.20&&col.pink||N>1&&col.blue_light||N>.75&&col.green||N>.5&&col.green_dark||N>.25&&col.orange||col.red;cam.Start3D2D(y+g,z,0.10)render.SetColorMaterial()render.SuppressEngineLighting(true)if x then surface.SetTextColor(C)surface.SetTextPos(-I/2,0)surface.DrawText(H)if r then local Q=w:GetTitle()local R=w:GetTitleEffect()if Q then R(w,Q,E,F,G,A)end end end;for v=1,#B do local px=-D/2+j*(v-1)local S=B[v]if!S.visible&&!x then continue end;if S.material then surface.SetDrawColor(S.color||color_white)surface.SetMaterial(S.material)surface.DrawTexturedRect(px,-(k+16),j,k)end;if S.text then draw.DrawText(S.text,'ui_header.s',px+j/2,-15,col.white,TEXT_ALIGN_CENTER)end end;if x&&cvar.GetValue'srp_hud_nickname'then local T=w:GetNickName()if T then draw.DrawText(T,'ui_header.s',px,-15,col.white,TEXT_ALIGN_CENTER)end end;if x&&!t&&K>0 then draw.Box(E,85,G,l,h)draw.Box(E,85,G*O,l,P)draw.Box(E,85+l,G,m,i)if L>0 then draw.Box(E,85+l,G*math.Clamp(w.lerpap/200,0,1),m,col.yellow)end;surface.SetDrawColor(0,0,0,255)surface.DrawOutlinedRect(E,85,G,l+m)if s then draw.SimpleText(K..'HP ( '..math.Round(N*100)..'% )','ui_header.sb',E+G/2,85+l/2-1,i,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end;render.SuppressEngineLighting(false)cam.End3D2D()end end)local h=col.white:Copy()hook('OnRenderNameplateIcons',function(w,B)if w:IsJailed()then local U=string.FormattedTime(w:GetJailTime(),'%02i:%02i')B[#B+1]={material=a,color=col.red,text=U}elseif w:IsWanted()then B[#B+1]={material=a,color=col.red}elseif w:IsCuffed()then B[#B+1]={material=b,color=w:IsCuffedLegs()&&col.red||col.white}end;if w:IsSpeaking()then table.insert(B,{material=c})elseif w:IsTyping()then table.insert(B,{material=d})elseif w:IsGhosted()&&LocalPlayer():IsGhosted()then B[#B+1]={material=a,color=col.red,visible=true}return true end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/overviews_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/interaction/interaction_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/ui/hud_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/weaponswitch/ui/weporganiser_cat_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/imprints/ui/imprint_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/inventory/inventory_sh.lua:
srp.inventory=srp.inventory||{}srp.inventory.instances={}srp.inventory.shop={}srp.inventory.rarities={emptycosmetic=Material('materials/galactic/ui/paint.png','smooth noclamp'),empty=Material('materials/galactic/ui/inventory/empty.png','smooth noclamp'),common=Material('materials/galactic/ui/inventory/common.png','smooth noclamp'),uncommon=Material('materials/galactic/ui/inventory/uncommon.png','smooth noclamp'),rare=Material('materials/galactic/ui/inventory/rare.png','smooth noclamp')}function srp.inventory.RegisterShop(a,b)b.id=a;srp.inventory.shop[a]=b;if srp.inventory.ShopsLoaded then srp.inventory.InstanceShop(a,b)end end;function srp.inventory.GetShop(a)return srp.inventory.shop[a]end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/inventory/inventorydata_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/items/resources/collectables_cl.lua:
local a=500^2;hook.Add('SetupOutlines',function()local b=LocalPlayer():GetPos()for c,d in ipairs(ents.FindByClass('rp_collectable'))do local e=d:GetPos():DistToSqr(b)if d:GetCount()>0&&e<a then local f=d:GetChance()||100;local g=f<10&&col.orange||f<20&&col.blue||col.white;outline.Add(d,g,outline.MODE_BOTH)end end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/leaderboard/leaderboard_sh.lua:
srp.leaderboard=srp.leaderboard||{}local a={}function srp.leaderboard.Create(b,c)c.id=b;a[b]=c;return b end;function srp.leaderboard.Get(b)return a[b]end;function srp.leaderboard.GetAll()return a end;function srp.leaderboard.RegisterPatrol(b)return srp.leaderboard.Create('patrols.'..b,{Name='Patrol Route '..b,MaxCount=5,SortDesc=false,GetValue=function(self,d)return ba.str.FormatTime(d)end})end;function srp.leaderboard.RegisterPackage(b)return srp.leaderboard.Create('package.'..b,{Name=b..' Package',MaxCount=5,SortDesc=false,GetValue=function(self,d)return ba.str.FormatTime(d)end})end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loadouts/loadout_cl.lua:
srp.loadouts=srp.loadouts||{}srp.loadouts.data=srp.loadouts.data||{}srp.loadouts.p_owned=srp.loadouts.p_owned||{}srp.loadouts.p_equipped=srp.loadouts.p_equipped||{}net('srp.loadouts.SendPurchasedItems',function()srp.loadouts.p_owned={}local a=net.ReadUInt(10)for b=1,a do srp.loadouts.p_owned[net.ReadString()]=true end;hook.Run'OnLoadoutPurchases'end)net('srp.loadouts.Clear',function()srp.loadouts.p_equipped={}hook.Run'OnLoadoutCleared'end)net('srp.loadouts.RequestUnload',function()local c=net.ReadString()srp.loadouts.p_equipped[c]=nil;hook.Run('OnLoadedUnequipped',c)end)net('srp.loadouts.SendPurchasedItem',function()local d,e=net.ReadString(),net.ReadString()srp.loadouts.p_owned[e]=true;hook.Run('OnLoadoutPurchased',d,e)end)net('srp.loadouts.SendEquipped',function()local a=net.ReadUInt(3)if!a then return end;local f={}for b=1,a do f[net.ReadString()]=srp.items.data[net.ReadString()]end;srp.loadouts.p_equipped=f;hook.Run('OnLoadoutEquipmentReceived',f)end)net('srp.loadouts.SendEquip',function()local d,e=net.ReadString(),net.ReadString()srp.loadouts.p_equipped[d]=srp.items.data[e]hook.Run('OnLoadoutEquip',d,e)end)net('srp.loadouts.RequestDelete',function()srp.loadouts.p_equipped={}hook.Run'OnLoadoutDeleted'end)function srp.loadouts.RequestPurchase(d,e)if!d||!e then return end;net.Start'srp.loadouts.RequestPurchase'net.WriteString(d)net.WriteString(e)net.SendToServer()end;function srp.loadouts.RequestEquip(d,e)if!d||!e then return end;net.Start'srp.loadouts.RequestEquip'net.WriteString(d)net.WriteString(e)net.SendToServer()end;function srp.loadouts.RequestDelete()net.Start'srp.loadouts.RequestDelete'net.SendToServer()end;function srp.loadouts.RequestUnload(c)net.Start'srp.loadouts.RequestUnload'net.WriteString(c)net.SendToServer()end;local g;function srp.loadouts.Open()if IsValid(g)then g:Remove()end;srp.ui.Create('srp_loadout',function(h)g=h end)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/funcmodules/oxygen_sh.lua:
srp.funcmodules=srp.funcmodules||{}srp.funcmodules.oxygen=0;function PLAYER:GetOxygen()return SERVER&&srp.funcmodules.oxygenData[self]||CLIENT&&srp.funcmodules.oxygen||0 end;function PLAYER:SetOxygen(a)if SERVER then else srp.funcmodules.oxygen=a end end;if CLIENT then net('srp.funcmodules.SetOxygen',function()srp.funcmodules.oxygen=net.ReadUInt(8)end)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/funcmodules/ui/funcmodulewarning_ui.lua:
local a={}local b=Color(50,0,0,200)local c=col.midnight_light:Copy()c.a=200;local d=Material('materials/galactic/ui/warning.png','smooth noclamp nomips')function a:Init()self:SetText''self:DockMargin(0,0,0,4)self:DockPadding(45,4,2,6)self:SetTall(28)self:SetMouseInputEnabled(true)self:AddPanel('srp_label',function(e)e:Dock(FILL)e:SetFont'ui_label.b'e:SetText'Something broke!'e:SetContentAlignment(4)e:SetMouseInputEnabled(false)self.title=e end)end;function a:SetData(f)f=istable(f)&&f||{text=f}if f.click then self:LeftClick(f.click)end;self.data=f;self.title:SetText(f.text)end;function a:Paint(g,h)b.r=100+math.cos(RealTime()*3)*50;draw.RoundedBox(6,1,1,g-2,h-2,c)draw.RoundedBox(6,0,0,g,h,b)if self.data&&self.data.icon then surface.DisableClipping(true)surface.SetMaterial(self.data.icon)surface.SetDrawColor(0,0,0,255)surface.DrawTexturedRect(4,(h-33)*.5,34,34)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(5,(h-32)*.5,32,32)surface.DisableClipping(false)end end;vgui.Register('srp_funcmodulewarning',a,'srp_button')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/mapchange/ui/mapchange_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/mapchange/ui/maprow_ui.lua:
local a={}local b=Material('materials/galactic/ui/inventory/water.png','noclamp smooth')local c=col.orange:Copy()c.a=150;local d=col.midnight_dark:Copy()d.a=255;local e={}local f={col.blue_light,col.red_light,col.orange,col.yellow,col.green_light}function a:Init()self:Dock(TOP)self:SetTall(57)self:DockPadding(5,5,5,5)self:DockMargin(0,2,0,0)self.Paint=self.PaintMainContainer;self:AddPanel('srp_panel',function(g)g:Dock(LEFT)g:SetWide(50)g:DockMargin(0,0,0,0)g:DockPadding(0,0,0,0)g:SetBackgroundColor(col.transparent)g:AddPanel('srp_label',function(h)h:SetSize(50,50)h:SetContentAlignment(5)h:SetFont'ui_header.l'h:SetTextColor(col.white_dark)self.mapIcon=h end)g:AddPanel('DImage',function(i)i:DockMargin(0,0,0,0)i:Dock(FILL)i:SetVisible(false)i:SetMaterial(b)self.mapImage=i end)self.mapImageContainer=g end)self:AddPanel('srp_panel',function(g)g:Dock(FILL)g:SetBackgroundColor(col.transparent)g:AddPanel('srp_label',function(h)h:Dock(TOP)h:SetFont'ui_header.r'h:SetTextColor(col.white_dark)self.name=h end)g:AddPanel('srp_label',function(h)h:Dock(FILL)h:DockMargin(5,0,0,0)h:SetTall(20)h:SetTextColor(col.white_dark)self.workshopid=h end)self.mainContainer=g end)end;function a:Populate(j,k,l)local m=false;local n=l.restricted||m;local o=j&&!m||!n;local p=j;self.mapid=k;self.mapname=l.name;self:SetBackgroundColor(n&&c||d)self.mapImageContainer:SetBackgroundColor(f[string.byte(l.name[1])%#f])self:SetImage(k)self.mapIcon:SetText(l.name[1])local q=istable(l.wsid)&&string.Implode(' | ',l.wsid)||l.wsid||''self.workshopid:SetText(k..' '..q)self.name:SetText(l.name)if(m||n)&&!p then self:AddPanel('srp_label',function(r)r:Dock(RIGHT)r:SetWide(32)r:SetFont'SSRPForkAwesome'r:SetText(0xf023,true)r:SetContentAlignment(5)r:SetTextColor(col.red)self.Blacklist=r end)end;if p then self:AddPanel('srp_button_rounded',function(r)r.Blacklisted=false;r:Dock(RIGHT)r:SetWide(32)r:SetFont'SSRPForkAwesome'r:SetText(0xf13e,true)r:SetTextColor(col.green)r:SetBackgroundColor(col.midnight)r:SetBorderColor(col.transparent)r:SetHoverColor(col.midnight_light)r:LeftClick(function(s)srp.ui.Create('srp_requestvalue',function(g)g:SetTitle(s.Blacklisted&&'Remove Blacklist'||'Blacklist')g:SetText'Please specify a reason for the blacklist change.'g:OnSubmit(function(s,t)if IsValid(self)then net.Start'srp.map.Blacklist'net.WriteString(self.mapid)net.WriteString(t)net.SendToServer()end;s:Remove()end)end)end)self.Blacklist=r end)end;if o then self:AddPanel('srp_button',function(r)r:Dock(RIGHT)r:SetWide(32)r:SetFont'SSRPForkAwesome'r:SetText(0xf00c,true)r:SetBackgroundColor(n&&col.orange||col.midnight_light)r:SetBorderColor(col.transparent)r:SetHoverColor(col.green)r:LeftClick(function(s)net.Start'srp.map.ChangeMap'net.WriteString(self.mapid)net.SendToServer()end)end)end end;function a:SetImage(k)local i=self.mapImage;if e[k]&&e[k]:IsError()then return end;local u='maps/thumb/'..k..'.png'if file.Exists(u,'GAME')then local v=Material(u)if v&&!v:IsError()then i:SetMaterial(v)i:SetVisible(true)e[k]=v end elseif e[k]then i:SetMaterial(e[k])i:SetVisible(true)else texture.Create(k):EnableProxy(false):Download('https://image.gametracker.com/images/maps/160x120/garrysmod/'..k..'.jpg',function(s,w)if IsValid(i)&&w&&!w:IsError()then i:SetMaterial(w)i:SetVisible(true)e[s.Name]=w end end)end end;function a:SetBlacklisted(x)if!IsValid(self.Blacklist)then return end;local y=x.blacklisted;self.Blacklist.Blacklisted=y;self.Blacklist:SetText(y&&0xf023||0xf13e,true)self.Blacklist:SetTextColor(y&&col.red||col.green)self.Blacklist:SetTooltip((x.steamid||'unknown')..'\n'..(x.reason||'No reason given'))end;function a:PaintMainContainer(z,A)draw.Box(0,0,z,A,d)if!self.mapid then return end;self.offset=math.Approach(self.offset||0,(self:IsChildHovered()||self:IsHovered())&&300||0,1)if e[self.mapid]then surface.SetMaterial(e[self.mapid])surface.SetDrawColor(255,255,255,50)surface.DrawTexturedRect(0,-100-self.offset,600,600)end end;vgui.Register('srp_maprow',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/spawnpoints/spawnpoints_cl.lua:
srp.spawn=srp.spawn||{}srp.spawn.cooldowns=srp.spawn.cooldowns||{}function srp.spawn.RequestCustomPoints()net.Start'srp.spawn.GetCustomSpawns'net.SendToServer()end;function srp.spawn.RequestSpawn(a)net.Start'srp.spawn.RequestCustomSpawn'net.WriteString(a)net.SendToServer()end;net('srp.spawn.GetCustomSpawns',function()local b=net.ReadUInt(3)local c={}local d={}for e=1,b do local a=net.ReadString()c[a]={id=a,type=net.ReadString(),name=net.ReadString()}table.insert(d,c[a])end;hook.Run('OnSpawnPointsReceived',c,d)end)net('srp.spawn.RequestCustomSpawn',function()local a=net.ReadString()local f=net.ReadUInt(16)srp.spawn.cooldowns[a]=CurTime()+f;hook.Run('OnSpawnPointSelected',a,CurTime()+f)end)net('srp.spawn.RemoveCustomSpawn',function()local a=net.ReadString()srp.spawn.RemoveCustomPoint(a)hook.Run('OnSpawnPointRemoved',a)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/nightvision/nightvision_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/npc/npcs_cl.lua:
local IsValid=IsValid;local a=ents.FindByClass;local ipairs=ipairs;local Vector=Vector;local RealTime=RealTime;local b=math.abs;local c=math.cos;local d=cam.Start3D2D;local e=cam.End3D2D;local f=surface.SetMaterial;local g=surface.SetDrawColor;local h=surface.DrawTexturedRect;local i=draw.SimpleText;local j=Color(255,255,255)hook('PostDrawTranslucentRenderables','DrawNPCInfo',function(k,l)if k||l then return end;if!IsValid(LocalPlayer())then return end;local m=LocalPlayer():GetPos()local n=a'rp_npc'if#n==0 then return end;for o,p in ipairs(n)do if!IsValid(p)then continue end;local q=p:GetPos()local r=m:DistToSqr(q)if r>440000 then continue end;local s=b(255-r/440000*100/100*255)local t=(q-m):Angle()t.p=0;t.y=t.y+-90;t.r=t.r+90;local u=q+Vector(0,0,80)u=u+Vector(0,0,c(RealTime()*2)*2)local v=p:GetIconMaterial()local w,x=p:GetTitle()if!x then continue end;x.a=s;d(u,t,0.125)if v then f(v)g(x)h(-64,-135,128,128)end;i(w||'Unknown','ui_hud.npcname',0,0,j,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)e()end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/npc/dialogues/dialogue_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/animations/anim_sh.lua:
srp.anim=srp.anim||{}PLAYERANIMEVENT_CUSTOM_SERVER=123412451;hook('DoAnimationEvent','AnimEventTest',function(a,b,c)if!a.playanim||b!=PLAYERANIMEVENT_CUSTOM_SERVER then return end;a:AddVCDSequenceToGestureSlot(GESTURE_SLOT_ATTACK_AND_RELOAD,c,0,a.animshouldstop)a:AnimSetGestureWeight(GESTURE_SLOT_ATTACK_AND_RELOAD,1)return ACT_INVALID end)function srp.anim.Play(a,d,e)local f=a:LookupSequence(d)if!f||f==-1 then return end;a.playanim=true;a.animshouldstop=!e;a:DoCustomAnimEvent(PLAYERANIMEVENT_CUSTOM_SERVER,f)a.playanim=false;return a:SequenceDuration(f)end;function srp.anim.Stop(a)local g='srp.anim.PlayLoop.'..a:SteamID()timer.Remove(g)a:AnimResetGestureSlot(GESTURE_SLOT_ATTACK_AND_RELOAD)a.animshouldstop=true end;function PLAYER:PlayAnimation(d,h)return srp.anim.Play(self,d,h)end;function PLAYER:StopAnimation()return srp.anim.Stop(self)end;if SERVER then else net('srp.anim.Play',function()local a=net.ReadPlayer()local c=net.ReadString()local e=net.ReadBool()if!IsValid(a)then return end;srp.anim.Play(a,c,e)end)net('srp.anim.Stop',function()local a=net.ReadPlayer()if IsValid(a)then srp.anim.Stop(a)end end)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/death/ui/death_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/tips/tips_cl.lua:
srp.tips=srp.tips||{}local a={}function srp.tips.GetRandom()return a[math.random(1,#a)]end;function srp.tips.Set(b)a=b end;function srp.tips.Add(c)table.insert(a,c)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/util/insight_cl.lua:
local LocalPlayer=LocalPlayer;local a=ENTITY.GetPos;local b=ENTITY.EyePos;local c=VECTOR.DistToSqr;local d=ENTITY.IsLineOfSightClear;local e=util.TraceLine;local f;local g={mask=-1,filter={}}function ENTITY:InSight()return false end;function PLAYER:InSight()return false end;function ENTITY:InTrace()return false end;function PLAYER:InTrace()return false end;hook('Think','VisChecks',function()if IsValid(LocalPlayer())then f=LocalPlayer()g.filter[1]=LocalPlayer()function ENTITY:InSight()if c(a(self),a(f))<250000 then return d(f,self)end;return false end;function PLAYER:InSight()if c(b(self),b(f))<250000 then return d(f,self)end;return false end;function ENTITY:InTrace()g.start=b(f)g.endpos=a(self)g.filter[2]=self;return!e(g).Hit end;function PLAYER:InTrace()g.start=b(f)g.endpos=b(self)g.filter[2]=self;return!e(g).Hit end;hook.Remove('Think','VisChecks')end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/polling/polls_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/ui/configs/rtscfg_selection_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/ui/configs/rtscfg_selection_ui.lua:
local a={}local b=Material'gui/gradient_up'function a:Init()self:SetSize(0,70)self:DockPadding(3,3,3,3)self:MakePopup()self:SetKeyboardInputEnabled(false)self:AddPanel('srp_button_rounded',function(c)c:Dock(LEFT)c:SetWide(14)c:SetFont'ui_button_close'c:SetText(0xf00d,true)c:DockMargin(0,0,0,0)c:SetTextColor(col.black)c:SetBackgroundColor(col.transparent)c:SetHoverColor(col.transparent)c:SetDisabledColor(col.transparent)c:LeftClick(function(d)d:SetDisabled(true)self:FadeClose()end)self.minimize=c end)self:AddPanel('ui_scrollpanel_horizontal',function(e)e:Dock(FILL)self.scroll=e end)end;function a:Populate(f,g)local h,i=f:LocalToScreen(0,0)self:SetPos(h,i-105)self:MoveToFront()self.Action=g;self:LoadConfigs(g)end;function a:Think()self:MoveToFront()end;function a:LoadConfigs(g)local j=srp.rts.directory..'/'..g.id..'/'local k=file.Find(j..'*.dat','DATA')if!k then self:Remove()return end;local l=0;for m,n in ipairs(k)do local o=file.Read(j..n,'DATA')if!o||o==''then continue end;local p=util.JSONToTable(o)if!p||!p.fileid||!p.data then ErrorNoHalt(Format('Tried to load RTS file: %s for action: %s. Contained missing data.',n,g.id))continue end;if!g:Validate(p.data)then ErrorNoHalt(Format('Tried to load RTS file: %s for action: %s. Contained invalid data.',n,g.id))continue end;l=l+1;self:DisplayConfig(p)end;self:SizeTo(math.min(l*70+20,800),70,0.1,0)end;function a:DisplayConfig(p)srp.ui.Create('srp_rtscfgaction',function(e)e:SetSize(64,64)e:Populate(self.Action,p)e:LeftClick(function(d)self:ConfigSelected(d.Action,d.FileData)self:FadeClose()end)self.scroll:AddItem(e)end)end;function a:OnConfigSelected(q)self.ConfigSelected=q end;function a:ConfigSelected(g,r)print'Config selected, no OnConfigSelected set'end;function a:FadeClose(s)self:AlphaTo(0,1,0)self:SizeTo(20,70,s||0.15,0,-1,function()if IsValid(self)then self:Remove()end end)end;function a:Paint(t,u)draw.Box(0,0,t,u,col.white_dark)surface.SetMaterial(b)surface.SetDrawColor(col.white)surface.DrawTexturedRect(0,0,t,u)end;vgui.Register('srp_rtscfgselection',a,'srp_panel')local a={}function a:Init()self:SetFont'ui_label.r'self:SetBorderColor(col.grey)self:SetDisabledColor(col.white_dark)self:SetTextColor(col.white)self:AddPanel('DImage',function(v)v:SetSize(34,34)v:SetPos(15,10)v:SetMouseInputEnabled(false)v:SetVisible(false)self.icon=v end)self:AddPanel('SpawnIcon',function(v)v:SetSize(64,64)v:SetPos(0,0)v:SetMouseInputEnabled(false)v:SetVisible(false)v:SetAlpha(50)self.spawnicon=v end)self:AddPanel('srp_button',function(w)w:SetSize(14,14)w:SetPos(50,49)w:SetFont'SSRPForkAwesomeSmall'w:SetText(0xf013,true)w:SetBackgroundColor(col.transparent)w:SetHoverColor(col.transparent)w:SetBorderColor(col.transparent)w:SetVisible(false)w:LeftClick(function(d)if IsValid(d.ConfigPanel)then d.ConfigPanel:FadeClose()else srp.ui.Create(self.CfgPanelName,function(e)e:Populate(d,self.ActionID,self.Action,self.FileData)e:OnSaved(function(x,y)self:Populate(self.Action,y)end)d.ConfigPanel=e end)end end)self.Config=w end)end;function a:Populate(g,p)self.ActionID=g.id;self.Action=g;self.FileData=p;self.lbl:MoveToFront()self.lbl:Dock(BOTTOM)self.lbl:SetTall(26)self:SetText(p.name||p.fileid:Explode('_')[1])self.Config:SetVisible()local z=g:GetIcon(p.data)local A=g:GetConfigPanel()self.CfgPanelName=A;self.Config:SetVisible(A!=nil)if type(z)=='IMaterial'then self.icon:SetMaterial(z)self.icon:SetVisible(true)elseif z then self.spawnicon:SetModel(z)self.spawnicon:SetVisible(true)end end;vgui.Register('srp_rtscfgaction',a,'srp_button')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/ui/configs/rtscfg_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/sky/sky_cl.lua:
srp.skybox=srp.skybox||{}local a=info.Dev;local b;function srp.skybox.GetList()net.Start'srp.skybox.GetList'net.SendToServer()end;local function c(d)if!a then b=d;return end;if d then util.SetSkybox(d:TrimRight('up'))end end;hook('OnSkyboxChanged','srp.skybox.Changed',c)hook('InitPostEntity','srp.skybox.Ready',function()a=true;if b then c(b)end end)net('srp.skybox.GetList',function()local e=net.ReadUInt(9)local f={}for g=1,e do f[g]=net.ReadString()end;hook.Run('OnSkyboxesReceived',f)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/sky/sky_sh.lua:
srp.skybox=srp.skybox||{}local a={['sky06up.vmt']=true,['sky_whiteup.vmt']=true,['sky_c17_05up.vmt']=true,['sky_rainbow_01up.vmt']=true}nw.Register'srp.Skybox':Write(net.WriteString):Read(net.ReadString):SetGlobal():SetHook'OnSkyboxChanged'function srp.skybox.GetValidSkyboxes()local b=file.Find('materials/skybox/*','GAME')local c={}for d,e in pairs(b)do if!e:find('hdr')&&e:EndsWith('up.vmt')&&!a[e]then c[e:Replace('.vmt','')]=true end end;return c end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/storage/soreagetransport_cl.lua:
srp.activities=srp.activities||{}net('srp.activities.DropoffZone',function()LocalPlayer().DropoffZoneID=net.ReadUInt(32)hook.Call('OnActivityDropoffAdded',id)end)net('srp.activities.RemoveDropoffZone',function()LocalPlayer().DropoffZoneID=nil;hook.Call('OnActivityDropoffRemoved')end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/talents/ui/talentprogress_ui.lua:
local a={}local b=Color(0,0,0,100)local c=Color(121,121,121,200)local d=Color(255,255,255,150)local e=20;local f=24;local g=Material('effects/sw_laser_white_front')local h=Material('effects/sw_laser_blue_front')local i=Material('materials/galactic/ui/menu/levelcircle.png','smooth nomips noclamp')local j=52;local k=8;function a:Init()self:SetBackgroundColor(b)self.levels={}self:DockMargin(0,0,0,0)self:DockPadding(0,0,0,0)self:AddPanel('srp_panel',function(l)l:DockMargin(0,0,0,0)l:DockPadding(0,0,0,0)l:SetBackgroundColor(col.transparent)l:Dock(FILL)self.Container=l end)end;function a:Populate(m)local n=srp.talents.Get(m)self.TreeLevel=LocalPlayer():GetTalentLevel(m)||0;self.MaxLevel=n.maxlevel||150;for o,p in pairs(n.passives)do self:AddProgressButton(o,p,m)end;if n.addpanel then self:AddPanel(n.addpanel,function(l)l:Populate(self,n)end)end end;function a:AddProgressButton(o,p,q)self.Container:AddPanel('srp_talentcircle',function(r)r:Populate(o,p,q)self.levels[o]=r end)end;function a:PerformLayout(s,t)if!self.MaxLevel then return end;local s,t=self.Container:GetSize()local u=s-e-e;local v=u/self.MaxLevel;for w,l in pairs(self.levels)do local x=e+v*(w-1)l:SetPos(x-j/2,(t-j)/2,j,j)end end;function a:Paint(s,t)draw.RoundedBox(6,0,0,s,t,b)local s,t=self.Container:GetSize()local u=s-e-e;local v=u/self.MaxLevel;for w=1,self.MaxLevel do local x=e+v*(w-1)local y=self.TreeLevel>=w;surface.SetMaterial(y&&h||g)surface.SetDrawColor(y&&d||c)surface.DrawTexturedRect(x-f/2,(t-f)/2,f,f)end end;vgui.Register('srp_talentprogress_passives',a,'srp_panel')local a={}function a:Init()self:SetBackgroundColor(b)self:SetBorderColor(col.midnight)self:SetHoverColor(col.midnight_dark)self:SetText''self.levels={}self:AddPanel('srp_grid',function(z)z:SetTall(30)z:SetAdjusted(true)z:SetMouseInputEnabled(false)self.Grid=z end)end;function a:PerformLayout(s,t)self.Grid:SetWide(s-20)self.Grid:Center()end;function a:Populate(m,A)local n=srp.talents.Get(m)self.TreeLevel=LocalPlayer():GetTalentLevel(m)||0;if!n.talents then return end;local B=LocalPlayer():GetGroup()local C=LocalPlayer():GetGroupClass()local D=C&&C:HasPermission'jedi'local E;for o,p in ipairs(n.talents)do if p.classTalents then continue end;local F=LocalPlayer():GetSelectedTalent(m,o)local G;if F then local H=p.options[F]if H then E=H.battalion;G=srp.talents.GetTalent(H.talent)end end;self:AddProgressButton(p.level,G,E,B)end;self:LeftClick(function()A:ShowTalentTree(m)end)end;function a:AddProgressButton(I,G,E,B)self:AddPanel('srp_talentprogress_selected',function(l)l:Populate(I,G,E,B)self.Grid:AddItem(l)end)end;vgui.Register('srp_talentprogress_talents',a,'srp_button_rounded')local a={}function a:Init()self:SetSize(82,30)self:SetBackgroundColor(col.midnight)self:DockPadding(0,0,0,0)self:SetMouseInputEnabled(false)self:AddPanel('srp_label',function(J)J:Dock(LEFT)J:SetWide(26)J:SetBackgroundColor(col.midnight_dark)J:SetFont'ui_header.r'J:SetContentAlignment(5)J:DockMargin(4,4,4,4)self.Level=J end)self:AddPanel('DImage',function(K)K:SetSize(26,26)K:DockMargin(0,0,0,0)K:SetVisible(false)self.Icon=K end)end;function a:PerformLayout(s,t)s=s-26;self.Icon:SetPos(26+(s-26)/2,(t-26)/2)end;function a:Populate(I,G,E,B)self.Level:SetText(I)if!G then self:SetAlpha(50)return end;self.Icon:SetVisible(true)self.Icon:SetMaterial(G.icon,true)if E&&B then self:SetBackgroundColor(B:GetColor())end end;vgui.Register('srp_talentprogress_selected',a,'srp_panel_rounded')local a={}function a:Init()self:SetSize(j,j)self:DockMargin(0,0,0,0)self:SetFont'ui_label.rb'self:SetTextColor(col.grey_light)end;function a:Populate(o,p,q)self:SetText(o)self.Level=o;self.Passive=isPassive;self.TreeId=q;self.Talents={}local L=LocalPlayer():GetTalentLevel(q)>=self.Level;local B=LocalPlayer():GetGroup()local C=LocalPlayer():GetGroupClass()local D=C&&C:HasPermission'jedi'self.Completed=L;for M,N in pairs(p)do local G=srp.talents.GetTalent(M)if G then table.insert(self.Talents,G)end end end;function a:CreateTooltip()if#self.Talents==0 then return end;srp.ui.Create('srp_talenslist',function(O)local x,P=self:LocalToScreen(self:GetWide()/2,self:GetTall()/2+10)O.parent=self;O:SetPos(x,P)O:MakePopup(true)O:MoveToFront(true)O:Populate(self.Level,self.TreeId,self.Talents,self.Passive)self.Tooltip=O end)end;function a:Think()local Q=self:IsHovered()if Q&&!IsValid(self.Tooltip)&&self.Talents then self:CreateTooltip()end end;function a:Paint(s,t)surface.SetMaterial(i)if self.Completed then surface.SetDrawColor(79,133,249)else surface.SetDrawColor(255,255,255)end;surface.DrawTexturedRect(0,0,s,t)surface.SetDrawColor(255,255,255)surface.DrawTexturedRect(4,4,s-8,t-8)end;vgui.Register('srp_talentcircle',a,'srp_button')local a={}local R=Color(100,200,100,150)function a:Init()self:SetText' 'self:SetBackgroundColor(col.grey)end;function a:Populate(I,m,p)local S=LocalPlayer():GetTalentLevel(m)>=I;for T,G in ipairs(p)do self:AddPanel('srp_button_tag',function(r)r:SetBackgroundColor(S&&R||col.transparent)r:SetTextColor(col.white)r:DockMargin(0,0,0,0)r:Dock(TOP)r:SetText(G.name)r:SetMaterial(G.icon)r:SetMaterialBackground(d)r:SetBorderColor(col.transparent)end)end;self:SetTall(#p*31)end;vgui.Register('srp_talenslist',a,'srp_tooltip')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/time/timer_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/ui/inventoryselect_ui.lua:
local a={}local b=Color(50,50,50,150)local c=Color(5,5,5,150)local d=128;function a:Init()self:SetTall(80)self:SetBackgroundColor(col.white_dark)self.OriginalText='Select'self:AddPanel('srp_inventoryselect_item',function(e)e:SetBackgroundColor(b)e:SetHoverColor(c)e:Dock(FILL)e:SetText(self.OriginalText)e:SetTextColor(col.white_dark)e:LeftClick(function()self:DisplayIventoryItems()end)e:RightClick(function()self:Clear()end)self.selection=e end)self:SetTall(d+20)hook('VGUIMousePressed',self,self.OnVGUIMousePressed)end;function a:Clear()self:SetItem(nil)end;function a:OnVGUIMousePressed(f,g)if!IsValid(self.InventoryList)then return end;if!self.InventoryList:IsOurChild(f)||f!=self.InventoryList then self.InventoryList:Remove()end end;function a:OnSelected(h)self._OnSelected=h end;function a:_OnSelected()end;function a:OnFilterItem(h)self._OnFilterItem=h;if IsValid(self.InventoryList)then self.InventoryList._OnFilterItem=h end end;function a:_OnFilterItem(i)return true end;function a:OnSelectItems(h)self._OnSelectItems=h end;function a:DisplayIventoryItems()if IsValid(self.InventoryList)then self.InventoryList:Remove()return end;srp.ui.Create('srp_inventoryselect_list',function(f)f:SetSize(420,80)f:OnFilterItem(self._OnFilterItem)f:OnSelectItems(self._OnSelectItems)f:Populate(self)self.InventoryList=f end)self:InvalidateLayout(true)end;function a:SetItem(i,j,k)self.selection:SetItem(i,j,k)if!i then self.selection:SetText(self.OriginalText||'')end;self:_OnSelected(i,j,k)end;function a:SetDisabled(l,m)self.selection:SetDisabled(l,m)end;function a:SetTextColor(col)self.selection:SetTextColor(col)end;function a:SetText(n)self.OriginalText=self.OriginalText||n;self.selection:SetText(n)end;function a:SetFont(n)self.selection:SetFont(n)end;function a:PerformLayout(o,p)if IsValid(self.InventoryList)then local q,r=self:GetParent():LocalToScreen(self:GetPos())self.InventoryList:SetPos(q+o/2-self.InventoryList:GetWide()/2,r+p)end end;function a:OnRemove()hook.Remove('VGUIMousePressed',self)if IsValid(self.InventoryList)then self.InventoryList:Remove()end end;function a:Paint()end;vgui.Register('srp_inventoryitem',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/ui/tradinggroup_ui.lua:
local a={}function a:Init()self:SetBackgroundColor(col.transparent)self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self:AddPanel('srp_label',function(b)b:SetText'Name'b:Dock(LEFT)b:SetWide(80)b:SetText'ui_label.b'b:SetTextColor(col.white)b:SetContentAlignment(4)self.Name=b end)self:AddPanel('srp_label',function(b)b:SetText'0'b:Dock(FILL)b:SetText'ui_label.rb'b:SetTextColor(col.white)b:SetContentAlignment(6)self.Value=b end)end;function a:SetText(c,d)self.Name:SetText(c)if type(d)=='Panel'then self.Value:Remove()d:SetParent(self)d:Dock(FILL)d:DockMargin(0,0,0,0)self.Value=d else self.Value:SetText(d)end end;function a:SetValue(d)self.Value:SetText(d)end;vgui.Register('srp_tradeinfogroup',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/steps_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/traininghangars_ui.lua:
local a={}local b=Color(0,0,0,222)local c=Color(50,50,200,200)local d;local e={}function a:SetupPanels()self:AddPanel('srp_label',function(f)f:SetContentAlignment(5)f:SetSize(ScrW(),60)f:SetFont'ui_header.xl'self.title=f end)self:AddPanel('srp_label',function(f)f:SetContentAlignment(5)f:SetSize(ScrW(),80)f:SetFont'ui_label.l'self.text=f end)self:AddPanel('srp_modelpanel',function(g)g:SetSize(350,350)g:SetCamPos(Vector(400,0,140))g:SetLookAt(Vector(0,0,60))g:SetFOV(40)self.preview=g end)end;function a:Populate(h)self.step=h;self.title:SetText(h.title)self.text:SetText(h.text)self.preview:AddModel(h.preview.model,h.preview.pos||Vector(),Angle(20,-40,0))self:CreateVehicle()self:CreateButton()end;function a:CreateVehicle()if self.step.door then d=Entity(self.step.door)if IsValid(d)then d:SetNoDraw(true)end end;for i,j in ipairs(self.step.vehicles)do local k=ClientsideModel'prop_physics'k:SetModel(j.model)k:SetPos(j.pos)k:SetAngles(j.ang)k:Spawn()table.insert(e,k)end end;function a:OnRemove()for i,k in ipairs(e)do if IsValid(k)then k:Remove()end end;if IsValid(d)then d:SetNoDraw(false)end end;function a:PerformLayout(l,m)self.title:SetPos(0,m*.2)self.text:SetPos(0,m*.3)self.preview:SetPos((l-350)/2,(m-350)*.6)end;vgui.Register('srp_training_hangars',a,'srp_training_base')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingoverview_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/tutorial/tutorial_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/waterpuddle/water_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/attachments_cl.lua:
local a={}srp.WeaponAttachments=srp.WeaponAttachments||{}srp.WeaponAttachments.Owned=srp.WeaponAttachments.Owned||{}srp.WeaponAttachments.DrawEotech=function(self,b,c,d)surface.SetMaterial(self.OpticZone.Optic)surface.SetDrawColor(0,0,255,255)surface.DrawTexturedRect(-12,-12,24,24)surface.SetMaterial(self.OpticZone.Lense)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(-32,-32,64,64)end;srp.WeaponAttachments.DrawAimpoint=function(self,b,c,d)surface.SetMaterial(self.OpticZone.Optic)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(-8,-8,16,16)surface.SetMaterial(self.OpticZone.Lense)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(-32,-32,64,64)end;srp.WeaponAttachments.DrawKobra=function(self,b,c,d)surface.SetMaterial(self.OpticZone.Optic)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(-8,-8,16,16)end;function srp.WeaponAttachments.GetEquipped(e)return a[e]end;function srp.WeaponAttachments.GetEquippedAll()return a end;local f;net('srp.WeaponAttachments.OpenMenu',function()if IsValid(f)then f:Remove()end;srp.ui.Create('srp_attachments',function(g)g:Populate()f=g end)end)net('srp.WeaponAttachments.SendOwned',function()local h=net.ReadUInt(10)for i=1,h do local j=srp.WeaponAttachments.Get(net.ReadString())if j then srp.WeaponAttachments.Owned[j.id]=true end end end)net('srp.WeaponAttachments.Unlock',function()local j=net.ReadAttachment()if j then srp.WeaponAttachments.Owned[j.id]=j;hook.Run('OnAttachmentPurchased',j)end end)net('srp.WeaponAttachments.Equip',function()local e=net.ReadString()local k=net.ReadString()local l=net.ReadString()a[e]=a[e]||{}a[e][k]=l;hook.Run('OnAttachmentAdded',e,k,l)end)net('srp.WeaponAttachments.UnEquip',function()local e=net.ReadString()local k=net.ReadString()a[e]=a[e]||{}a[e][k]=nil;hook.Run('OnAttachmentRemoved',e,k)end)net('srp.WeaponAttachments.SendEquipped',function()local m=net.ReadUInt(10)local n={}for i=1,m do local e=net.ReadString()local k=net.ReadString()local l=net.ReadString()n[e]=n[e]||{}n[e][k]=l end;a=n end)hook('OnCharacterChanged',function()a={}end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/attachments_sh.lua:
srp.WeaponAttachments=srp.WeaponAttachments||{}srp.WeaponAttachments.Owned={}srp.WeaponAttachments.Slots={SCOPE={Id='SCOPE',Name='Scope',Scope=true,UIPos=Vector(),UIAng=Angle()},BARREL={Id='BARREL',Name='Barrel',UIPos=Vector(),UIAng=Angle()},BARREL_GRIP={Id='BARREL_GRIP',Name='Barrel Grip',UIPos=Vector(),UIAng=Angle()},BARREL_RAIL={Id='BARREL_RAIL',Name='Barrel Rail',UIPos=Vector(),UIAng=Angle()},TOP_RAIL={Id='TOP_RAIL',Name='Top Rail',UIPos=Vector(),UIAng=Angle()},STOCK={Id='STOCK',Name='Stock',UIPos=Vector(),UIAng=Angle()},HANDLE={Id='HANDLE',Name='Handle',UIPos=Vector(),UIAng=Angle()},MAGAZINE={Id='MAGAZINE',Name='Magazine',UIPos=Vector(),UIAng=Angle()},MODKIT={Id='MODKIT',Name='Mod Kit',UIPos=Vector(),UIAng=Angle()},MODULE_INFUSER={Id='MODULE_INFUSER',Name='Cosmetic',UIPos=Vector(),UIAng=Angle()},MODULE_1={Id='MODULE_1',Name='Module Slot 1',UIPos=Vector(),UIAng=Angle()},MODULE_2={Id='MODULE_2',Name='Module Slot 2',UIPos=Vector(),UIAng=Angle()},MODULE_3={Id='MODULE_3',Name='Module Slot 3',UIPos=Vector(),UIAng=Angle()},MODULE_4={Id='MODULE_4',Name='Module Slot 4',UIPos=Vector(),UIAng=Angle()},MODULE_5={Id='MODULE_5',Name='Module Slot 5',UIPos=Vector(),UIAng=Angle()},CHARM={Id='CHARM',Name='Charm Mount',UIPos=Vector(),UIAng=Angle()}}local a={}local b={}local c={}local d={}local e={}local f={}local g={}function srp.WeaponAttachments.Register(h,i,j,k)h=istable(h)&&h||{h}j=istable(j)&&j||{j}k.id=i;k.slot=j;k.weaponclasses=h;k.required=k.required&&a[k.required]a[i]=k;k.internalid=table.insert(b,k)for l,m in ipairs(h)do c[m]=c[m]||{}c[m][i]=k;e[m]=e[m]||{}e[m][k.internalid]=k;for l,n in ipairs(j)do d[m]=d[m]||{}d[m][n]=d[m][n]||{}d[m][n][i]=k end;if!f[m]then f[m]=true;table.insert(g,m)end end end;function srp.WeaponAttachments.GetAllClasses()return g end;function srp.WeaponAttachments.Get(i,o)return o&&b[i]||a[i]end;function srp.WeaponAttachments.GetAllByWeapon(m)return c[m]end;function srp.WeaponAttachments.GetByWeapon(m,i,o)if o then return e[m]&&e[m][i]else return c[m]&&c[m][i]end end;function srp.WeaponAttachments.GetAll()return a end;function srp.WeaponAttachments.IsOwned(p,i)if CLIENT then return srp.WeaponAttachments.Owned[p]else return srp.WeaponAttachments.Owned[p]&&srp.WeaponAttachments.Owned[p][i]end end;local q={'sup_z6','sup_dc15s','sup_cr2'}local function r()for l,i in ipairs(q)do local s=weapons.GetStored(i)s.FireDelay=s.FireDelay+0.01 end end;if SERVER then else net('srp.weapons.SyncFireAdjustments',function()r()end)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/npcweapons_sh.lua:
local function a()for b,c in ipairs(weapons.GetList())do local d=weapons.Get(c.ClassName)if!d.BaseClass||!(d.BaseClass.SWBWeapon||d.Base=='weapon_grenadebase')||!d.Spawnable||d.Hide then continue end;list.Add('NPCUsableWeapons',{class=c.ClassName,title=d.PrintName})end end;hook('InitPostEntity','npc.PopulateWeapons',a)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/jedi/powers_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/jedi/powers_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/jedi/powers_sh.lua:
srp.ForcePowers=srp.ForcePowers||{}srp.ForcePowers.UpdatePointsPerLevel=4;srp.ForcePowers.RefundPricePerLevel=5000;function PLAYER:GetForceLevel(a)if self.ForcePowerLevels then return self.ForcePowerLevels[a]||0 else return 0 end end;function PLAYER:SetForceLevel(a,b)self.ForcePowerLevels[a]=b end;function PLAYER:GetForcePoints()return self.ForcePowerPoints||0 end;function PLAYER:SetForcePoints(c)self.ForcePowerPoints=c end
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/starmap/starmap_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/hud/arcade_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/hud/arcade_sh.lua:
arcadeColor=Color(255,105,180)arcadeColorAlt=Color(8,247,254)mhbColor=Color(220,220,220)if CLIENT then matproxy.Add({name='ArcadeColor',init=function(self,a,b)self.ResultTo=b.resultvar end,bind=function(self,a,c)a:SetVector(self.ResultTo,Vector(arcadeColor.r/255,arcadeColor.g/255,arcadeColor.b/255))end})matproxy.Add({name='ArcadeColorAlt',init=function(self,a,b)self.ResultTo=b.resultvar end,bind=function(self,a,c)a:SetVector(self.ResultTo,Vector(arcadeColorAlt.r/255,arcadeColorAlt.g/255,arcadeColorAlt.b/255))end})end;local function d()for e,c in ipairs(ents.FindByClass('light_dynamic'))do if c:GetPos().z>0 then continue end;if e%2==0 then local f=arcadeColor.r..' '..arcadeColor.g..' '..arcadeColor.b;c:SetKeyValue('_light',f)else local f=arcadeColorAlt.r..' '..arcadeColorAlt.g..' '..arcadeColorAlt.b;c:SetKeyValue('_light',f)end end end;hook.Add('InitPostEntity','ArcadeColor',d)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/events/egghunt_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/events/egghunt_sh.lua:
if true then return end;local a={'st','nd','rd'}local function b()local c=srp.events.Arena.Pos+Vector(math.random(-650,650),math.random(-650,650),25)local d=ents.Create'rp_easteregg'd:SetPos(c)d:Spawn()d:PhysicsInit(SOLID_VPHYSICS)d:SetMoveType(MOVETYPE_NONE)d:SetSolid(SOLID_VPHYSICS)d:SetTrigger(true)d:SetModelScale(6)d:Activate()d.IsSuperEgg=math.random()>.9;d.InEvent=true end;local function e()for f,d in ipairs(ents.FindByClass('rp_easteregg'))do if d.InEvent then d:Remove()end end end;srp.events.Register('easter','Egg Hunt',75):SetTheme('easter'):SetArenaEvent(true):SetMaxPlaytime(info.Dev&&30||240):SetRequiresVote(true,2,15):SetLeaderboard():SetDescription([[
		Collect the eggs for easter!
	]]):SetTagLines({default='Egg'}):OnStart(function(self)if CLIENT then return end;local g=self:GetPlayers()srp.events.SpawnInRoom(g,200,function(h)h:AddFlags(FL_GODMODE)h:SetRunSpeed(250)h:StripWeapons()h:Freeze(true)h:SetFrags(0)timer.Simple(2,function()if IsValid(h)then h:Freeze(false)end end)end)for i=1,5 do b()end end):OnPlayerRemoved(function(self,h)local g=self:GetPlayers()if IsValid(h)then self:DisplayDeathCounter(#g,h:Nick())h:SetCharacterStatisticAverage('minigame_losses',1)h:SetCharacterStatisticAverage('minigame_wins',0)else self:DisplayDeathCounter(#g)end;if#g<=1 then self:End(srp.events.END,g[1])end end):OnWriteEndData(function(self,h)net.WritePlayer(h)end):OnReadEndData(function(self,h)return net.ReadPlayer(h)end):OnEnd(function(self,j,h)if CLIENT then return end;local g=self:GetPlayers()local k=table.Copy(g)table.sort(k,function(l,m)return l:Frags()>m:Frags()||l:TimeConnected()>m:TimeConnected()end)timer.Simple(5,function()for f,h in ipairs(g)do if IsValid(h)then h:Spawn()end end end)e()for i,h in ipairs(k)do local h=k[i]if i<4 then h:SetCharacterStatisticAverage('minigame_wins',1)srp.notif.SuccessAll(5,h:Nick()..' came '..i..a[i]..' in the egg hunt!')else h:SetCharacterStatisticAverage('minigame_losses',1)end end end):AddHook('PlayerDeath',function(self,h)self:RemovePlayer(h)end):AddHook('OnEasterEggClaimed',function(self,n,h)b()if IsValid(h)then h:AddFrags(n.IsSuperEgg&&4||1)end end):AddClientHook('CalcView',function(self,h,c,o,p)local q=srp.events.Arena.Pos+Vector(0,0,-250)c=srp.events.Arena.Pos+Vector(0,-720,600)o=(q-c):Angle()local r={origin=c,angles=o,fov=100,drawviewer=true}return r end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/events/safelanding_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/gamemaster/realtimestrategy/door_sh.lua:
local a={toggle=true,open=true,close=true,lock=true,unlock=true}local b={{name='Toggle',value='toggle',icon='icon16/door_out.png'},{name='Open',value='open',icon='icon16/door_open.png'},{name='Close',value='close',icon='icon16/door.png'},{name='Lock',value='lock',icon='icon16/lock.png'},{name='Unlock',value='unlock',icon='icon16/lock_break.png'}}srp.rts.Register'ctx_use':SetName'Press':SetIcon('icon16/door_in.png'):SetContextual({'func_button','func_button_rotating','class C_BaseEntity'}):SetServersideAction():OnSelected(function(self,c,d,e)d[1]:Use(c,c,USE_ON,0)end)srp.rts.Register'ctx_door':SetName'Door':SetIcon('icon16/door.png'):SetContextual({'func_door','prop_door_rotating','func_door_rotating'}):SetServersideAction():SetSubContexts(function(self,d,e)return table.ClearKeys(b)end):OnSelected(function(self,c,d,e)local f=d[1]local g=self:GetData(c,'context1')if!g||!a[g]then return end;local h;local i=f:GetName()if i&&i!=''then h=ents.FindByName(f:GetName())else h={f}end;for j,k in ipairs(h)do if IsValid(k)then k:Fire(g,'1')end end end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/dailies_sh.lua:
local a='materials/galactic/ui/inventory/crystal.png'local b='materials/galactic/ui/inventory/hilt.png'local c=Material'materials/galactic/ui/inventory/crystal.png'local d={{name='Spring Green',color=Color(20,164,75),cost=50},{name='Washout Yellow',color=Color(251,239,115),cost=50}}local e={{name='Daily Reborn Hilt #1',model='models/sgg/starwars/weapons/w_reborn_saber_hilt.mdl',cost=25},{name='Daily Hilt #1',model='models/sgg/starwars/weapons/w_saber_1_hilt.mdl',cost=25},{name='Daily Hilt #2',model='models/sgg/starwars/weapons/w_saber_2_hilt.mdl',cost=25},{name='Daily Hilt #3',model='models/sgg/starwars/weapons/w_saber_3_hilt.mdl',cost=25},{name='Daily Hilt #4',model='models/sgg/starwars/weapons/w_saber_4_hilt.mdl',cost=25},{name='Daily Hilt #5',model='models/sgg/starwars/weapons/w_saber_5_hilt.mdl',cost=25},{name='Daily Hilt #6',model='models/sgg/starwars/weapons/w_saber_6_hilt.mdl',cost=25},{name='Daily Hilt #7',model='models/sgg/starwars/weapons/w_saber_7_hilt.mdl',cost=25},{name='Daily Hilt #8',model='models/sgg/starwars/weapons/w_saber_8_hilt.mdl',cost=25},{name='Daily Hilt #9',model='models/sgg/starwars/weapons/w_saber_9_hilt.mdl',cost=25}}local f={{name='Metal Bundle',cost=5,items={METAL_SCRAP=50,METAL_REFINED_METAL=50,METAL_PLATE=50}}}for g,h in ipairs(d)do local i=h.name;local j=string.upper(i):Replace(' ','_')cosmetics.RegisterItem('ls_c'..j):SetName(i):SetType(cosmetics.SABER):SetSlot(cosmetics.SLOT.SABER.COLOR):SetClass('saber'):SetIcon(c):SetColor(h.color||h)local k='COSMETIC_DAILY_'..j;srp.items.Register('Cosmetics',k,{base='COSMETIC',name=i,maxstack=50000,description='Cosmetic rewarded for your daily commitment.',craftingOffset=5,icon=a,color=h.color||h,store='STORE_TRADER',tradedisabled=true,nodrop=true,scrap='TRADERCOIN',scrapcount=math.Round(math.max(h.cost*.25,1)),trade='TRADERCOIN',tradeamount=info.Dev&&1||h.cost,tradecolor=col.yellow:Copy(),cosmetic='ls_c'..j})end;for g,l in ipairs(e)do local i=l.name;local j=string.upper(i):Replace(' ','_')local k='ls_hilt_'..i;local m='ls_hilt_2_'..i;cosmetics.RegisterItem(k):SetName(i):SetType(cosmetics.SABER):SetSlot(cosmetics.SLOT.SABER.HILT):SetClass('saber'):SetModel(l.model):SetDrawModel(true)srp.items.Register('Cosmetics',k,{base='COSMETIC',name=i,maxstack=50000,description='Cosmetic rewarded for your daily commitment.',craftingOffset=5,icon=b,store='STORE_TRADER',tradedisabled=true,nodrop=true,trade='TRADERCOIN',tradeamount=info.Dev&&1||l.cost,tradecolor=col.yellow:Copy(),cosmetic=k,scrap='TRADERCOIN',scrapcount=math.Round(math.max(l.cost*.25,1))})end;for g,n in ipairs(f)do local i=n.name;local j=string.upper(i):Replace(' ','_')srp.items.Register('Bundles','BUNDLE_'..j,{base='BUNDLE',name=i,description='An asortment of goodies.',icon='materials/galactic/ui/foods/package.png',rarity='rare',Items=n.items,nodrop=true,tradedisabled=true,store='STORE_TRADER',trade='TRADERCOIN',tradeamount=info.Dev&&1||n.cost,tradecolor=col.yellow:Copy(),scrap='TRADERCOIN',scrapcount=math.Round(math.max(n.cost*.25,1))})end
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/storetokens_sh.lua:
local a=3600;local function b(c)local d=math.floor(c/3600)local e=math.floor(c%3600/60)local f=math.floor(c-d*3600-e*60)if e<10 then e='0'..e end;if f<10 then f='0'..f end;return d..'H '..e..'M '..f..'S'end;srp.items.RegisterBase('SALETOKEN',{name='Server Sale Token',icon='materials/galactic/ui/menu/sale.png',price=999999999,maxstack=99999,model=Model'models/props/cargocrate1.mdl',gui_position=Vector(0,0,0),nodrop=true,cantrade=false,sale=.05,weight=0,hours=48,interaction={Use={label='Info',count=1,callback=function(self,g,h,i,j)srp.notif.Neutral(g,3,'You must claim these in the store!')return false end}},OnPreInventoryAdded=function(self,k,l,j)if!l then return{Timeout=os.time()+a*self.hours}end end,GetName=function(self,i)return(self:HasExpired(i.meta)&&0.05||self.sale)*100 ..'% Store Sale Token'end,HasExpired=function(self,l)return os.time()>(l.Timeout||0)end,CustomDisplayOverride=function(self,m,l)local n=l.Timeout||0;local o=os.time()local p=m:AddPanel'srp_label'p:Dock(TOP)p:SetTall(35)p:SetWrap(true)p:SetTextColor(col.black)if n>o then p:SetText(Format('Redeem in store. Expires in %s',b(n-o)))else p:SetTextColor(col.red)p:SetFont'ui_label.rb'p:SetText('This token has expired. It is now worth 5%!')m:GetParent().Title:SetText('5% off store items')end;return 35 end})srp.items.Register('Store Tokens','SALETOKEN_5',{base='SALETOKEN',name='5% Sale Token',sale=.05,description='Select this in store and receive a 5% discount on your purchase!',rarity='rare'})srp.items.Register('Store Tokens','SALETOKEN_10',{base='SALETOKEN',name='10% Sale Token',sale=.10,description='Select this in store and receive a 10% discount on your purchase!',rarity='rare'})srp.items.Register('Store Tokens','SALETOKEN_25',{base='SALETOKEN',name='25% Sale Token',sale=.25,description='Select this in store and receive a 25% discount on your purchase',rarity='rare'})srp.items.Register('Store Tokens','SALETOKEN_50',{base='SALETOKEN',name='50% Sale Token',sale=.5,description='Select this in store and receive a 50% discount on your purchase!',rarity='rare'})srp.items.Register('Store Tokens','SALETOKEN_75',{base='SALETOKEN',name='75% Sale Token',sale=.75,description='Select this in store and receive a 75% discount on your purchase!',rarity='rare'})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/anaxes_sh.lua:
srp.spawn.AddSpawnPoints('rp_anaxes',{jails={REPUBLIC={{pos=Vector(-8564,14716,968),ang=Angle(0,-1,0)},{pos=Vector(-8141,15035,968),ang=Angle(0,-91,0)},{pos=Vector(-8147,14395,968),ang=Angle(0,90,0)},{pos=Vector(-7757,15010,968),ang=Angle(0,-89,0)},{pos=Vector(-7762,14410,968),ang=Angle(0,92,0)},{pos=Vector(-7372,15024,968),ang=Angle(0,-90,0)},{pos=Vector(-7383,14400,968),ang=Angle(0,91,0)},{pos=Vector(-6988,15034,968),ang=Angle(0,-89,0)},{pos=Vector(-6994,14379,968),ang=Angle(0,98,0)}},CIS={{pos=Vector(-8564,14716,968),ang=Angle(0,-1,0)},{pos=Vector(-8141,15035,968),ang=Angle(0,-91,0)},{pos=Vector(-8147,14395,968),ang=Angle(0,90,0)},{pos=Vector(-7757,15010,968),ang=Angle(0,-89,0)},{pos=Vector(-7762,14410,968),ang=Angle(0,92,0)},{pos=Vector(-7372,15024,968),ang=Angle(0,-90,0)},{pos=Vector(-7383,14400,968),ang=Angle(0,91,0)},{pos=Vector(-6988,15034,968),ang=Angle(0,-89,0)},{pos=Vector(-6994,14379,968),ang=Angle(0,98,0)}},SITH={{pos=Vector(-8564,14716,968),ang=Angle(0,-1,0)},{pos=Vector(-8141,15035,968),ang=Angle(0,-91,0)},{pos=Vector(-8147,14395,968),ang=Angle(0,90,0)},{pos=Vector(-7757,15010,968),ang=Angle(0,-89,0)},{pos=Vector(-7762,14410,968),ang=Angle(0,92,0)},{pos=Vector(-7372,15024,968),ang=Angle(0,-90,0)},{pos=Vector(-7383,14400,968),ang=Angle(0,91,0)},{pos=Vector(-6988,15034,968),ang=Angle(0,-89,0)},{pos=Vector(-6994,14379,968),ang=Angle(0,98,0)}}},jail_exit=Vector(1691,1162,-10957),groups={['41st']={pos=Vector(-8749,11115,64),dir=Vector(-1,1,0)},['41SB']={pos=Vector(-8749,11115,64),dir=Vector(-1,1,0)},['ARC']={pos=Vector(-7038,10660,64),dir=Vector(1,-1,0)},['327th']={pos=Vector(-5692,10665,64),dir=Vector(1,-1,0)},['327KC']={pos=Vector(-5692,10665,64),dir=Vector(1,-1,0)},['CG']={pos=Vector(-6176,13248,1024),dir=Vector(-1,-1,0)},['RM']={pos=Vector(-4848,9824,64),dir=Vector(-1,-1,0)},['501st']={pos=Vector(-5841,11127,64),dir=Vector(-1,1,0)},['332nd']={pos=Vector(-5841,11127,64),dir=Vector(-1,1,0)},['212th']={pos=Vector(-6370,10668,64),dir=Vector(1,-1,0)},['212AB']={pos=Vector(-6370,10668,64),dir=Vector(1,-1,0)},['GM']={pos=Vector(-9298,10674,64),dir=Vector(1,-1,0)},['NAVY']={pos=Vector(-10192,4976,832),dir=Vector(1,-1,0)},['32nd']={pos=Vector(-4956,-1007,88),dir=Vector(-1,1,0)},['RC']={pos=Vector(-6511,11126,64),dir=Vector(-1,1,0)},['187th']={pos=Vector(-5128,11088,64),dir=Vector(-1,1,0)},['104th']={pos=Vector(-5020,10660,64),dir=Vector(1,-1,0)},['104WP']={pos=Vector(-5020,10660,64),dir=Vector(1,-1,0)},['JEDI']={pos=Vector(2709,11050,-11504),dir=Vector(1,1,0)}},default={pos=Vector(-6248,14214,-256),ang=Angle(0,40,0),dir=Vector(1,1,0)},allegiances={['CIS']={pos=Vector(5851,13966,-491),ang=Angle(0,0,0)}}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/coruscantbelow_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/training_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/talents/talents_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/cw_base.lua:
AddCSLuaFile()local a=5;local b=Color(250,250,250)if CLIENT then SWEP.PrintName='SWB Base'SWEP.DrawCrosshair=false;SWEP.IconLetter='b'SWEP.CSMuzzleFlashes=true;SWEP.MuzzleEffect='tfa_muzzlesmoke'SWEP.MuzzlePosMod={x=6.5,y=30,z=-2}SWEP.AimPos=Vector(-7.6,-16,2.1)SWEP.AimAng=Vector(0,-1.2,0)SWEP.SprintPos=Vector(1.786,1.442,2)SWEP.SprintAng=Vector(-10.778,27.573,0)SWEP.ViewModelMovementScale=1;SWEP.ScopeMaterialManual=CreateMaterial('cw_base_scoope1','UnlitGeneric',{['$basetexture']='dev/dev_scanline',['$model']=1,['$alpha']=.1,['$translucent']=.008,['$vertexcolor']=1,['Proxies']={['TextureScroll']={['texturescrollvar']='$basetexturetransform',['texturescrollrate']=1,['texturescrollangle']=-90}}})SWEP.ScopeMaterialManual:Recompute()end;SWEP.SWBWeapon=true;SWEP.Tracer=1;SWEP.TracerName='sup_laser_blue'SWEP.Primary.Tracer=1;SWEP.Primary.TracerName='sup_laser_blue'SWEP.HolsterUnderwater=false;SWEP.FadeCrosshairOnAim=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.CanRicochet=false;SWEP.Slot=1;SWEP.SlotPos=0;SWEP.SprintingEnabled=true;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto','semi'}SWEP.Base='swb_base'SWEP.Category='SUP Starwars Weapons'SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFOV=100;SWEP.ViewModelFlip=false;SWEP.ViewModel='models/weapons/cstrike/c_rif_ak47.mdl'SWEP.WorldModel='models/weapons/w_irifle.mdl'SWEP.Spawnable=false;SWEP.AdminSpawnable=false;SWEP.Primary.ClipSize=30;SWEP.Primary.DefaultClip=30;SWEP.Primary.Automatic=true;SWEP.Primary.Ammo='ammo_blaster'SWEP.FireDelay=0.3;SWEP.FireSound=Sound'blaster.fire'SWEP.Recoil=.8;SWEP.HipRecoilSprintStep=0.6;SWEP.HipDivRecoil=Vector(.03,.03,.03)SWEP.HipSpread=0.02;SWEP.AimSpread=0.01;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.007;SWEP.SpreadCooldown=0.13;SWEP.Shots=1;SWEP.Damage=30;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.ImpactEffect='cwbase_impact'SWEP.ImpactEffectColor=Vector(50,50,255)SWEP.ImpactDecal='FadingScorch'sound.Add({name='blaster.fire_smg',channel=CHAN_WEAPON,volume=.75,level=90,pitch={95,100},sound='weapons/dc15s_fire.wav'})sound.Add({name='blaster.fire',channel=CHAN_WEAPON,volume=.35,level=90,pitch={100,105},sound='weapons/dc15a_fire.wav'})sound.Add({name='blaster.repeatfire',channel=CHAN_WEAPON,volume=.35,level=90,pitch={100,105},sound='weapons/repeat-1.wav'})sound.Add({name='blaster.z6_fire',channel=CHAN_WEAPON,volume=.35,level=90,pitch={100,105},sound='weapons/z6_fire.wav'})sound.Add({name='westarm5.fire',channel=CHAN_WEAPON,volume=.35,level=90,pitch=100,sound='weapons/westarm5.wav'})sound.Add({name='blaster.fire_shotgun',channel=CHAN_WEAPON,volume=.35,level=90,pitch={80,85},sound='weapons/dc15a_fire.wav'})sound.Add({name='blaster.fire_pistol',channel=CHAN_WEAPON,volume=.35,level=90,pitch={100,105},sound='weapons/dc15sa_fire.wav'})sound.Add({name='blaster.fire_sniper',channel=CHAN_WEAPON,volume=.35,level=90,pitch={80,90},sound='weapons/dc17m_sn_fire.wav'})sound.Add({name='blaster.reload_dc17m',channel=CHAN_WEAPON,volume=.35,level=90,pitch={95,100},sound='weapons/dc17m_br_reload.wav'})sound.Add({name='blaster.dc17mbr_fire',channel=CHAN_WEAPON,volume=.35,level=90,pitch={95,100},sound='weapons/dc17m_br_fire.wav'})sound.Add({name='blaster.reload_smg',channel=CHAN_WEAPON,volume=.35,level=90,pitch={95,100},sound='weapons/westar34_reload.wav'})sound.Add({name='blaster.reload_pistol',channel=CHAN_WEAPON,volume=.35,level=90,pitch={95,100},sound='weapons/dc17_reload.wav'})function SWEP:DoImpactEffect(c,d)if!IsValid(self)||c.HitSky then return true end;local e=CLIENT&&cvar.GetValue('srp_cosmeticsweapondecals')!=true;self:BlastMarks(c.HitPos,c.HitNormal,c.MatType,e)if self.ImpactDecal&&!(e&&self.ImpactDecal!='FadingScorch')then util.Decal(self.ImpactDecal,c.HitPos+c.HitNormal,c.HitPos-c.HitNormal)return true end end;function SWEP:BlastMarks(f,g,h,e)if!self.ImpactEffect then return end;local i=self.ImpactEffect!='cwbase_impact'if i&&!CLIENT then return end;if CLIENT&&i&&e then return end;local j=EffectData()j:SetStart(self.ImpactEffectColor)j:SetOrigin(f)j:SetNormal(g)j:SetEntity(self:GetOwner())j:SetMagnitude(h||0)j:SetScale(math.sqrt(self.CaseLength/30))util.Effect(self.ImpactEffect,j)return true end;function SWEP:OnReload()if self.ReloadSound then self:EmitSound(self.ReloadSound)end end;function SWEP:DrawScope(k,l)surface.SetDrawColor(20,100,100,2)surface.SetMaterial(self.ScopeMaterialManual)surface.DrawTexturedRect(0,0,k,l)draw.RoundedBox(8,(k-8)/2,(l-8)/2,16,16,b)end;MuzzlePosition=Vector()MuzzlePosition2=Vector()hook.Add('PostRender',function()local m=LocalPlayer():GetViewModel()if IsValid(m)then local n=m:GetAttachment(1)MuzzlePosition=n&&n.Pos;local n=m:GetAttachment(2)MuzzlePosition2=n&&n.Pos end end)local o={['Weapon_Pistol.Special1']=true,['Weapon_Pistol.Special2']=true,['Weapon.StepLeft']=true,['Weapon.StepRight']=true,['Weapon.ImpactSoft']=true}hook.Add('EntityEmitSound','srp.EmitReloadSound',function(p)local q=IsValid(p.Entity)&&(p.Entity:IsPlayer()&&p.Entity:GetActiveWeapon()||p.Entity)||nil;if!q||!q.SWBWeapon||!(q.ReloadSoundTP||q.IgnoreReloadSound)then return end;if p.OriginalSoundName&&p.OriginalSoundName:find('357')||o[p.OriginalSoundName]then return false end end)
--addons/!lpakr_out/lua/weapons/drgbase_possession.lua:
SWEP.PrintName="Possession"SWEP.Spawnable=false;SWEP.AdminOnly=true;SWEP.AutoSwitchTo=false;SWEP.DrawAmmo=false;SWEP.DisableDuplicator=true;SWEP.Primary.Ammo=""SWEP.Secondary.Ammo=""SWEP.WorldModel=""SWEP.Slot=5;function SWEP:PrimaryAttack()end;function SWEP:SecondaryAttack()end;function SWEP:Reload()end
--addons/!lpakr_out/lua/weapons/drgbase_weapon/shared.lua:
SWEP.IsDrGWeapon=true;SWEP.PrintName=""SWEP.Category=""SWEP.Author=""SWEP.Contact=""SWEP.Purpose=""SWEP.Instructions=""SWEP.Spawnable=false;SWEP.AdminOnly=false;SWEP.HoldType="ammo_blaster"SWEP.ViewModelFOV=62;SWEP.ViewModelFlip=true;SWEP.ViewModelOffset=Vector(0,0,0)SWEP.ViewModelAngle=Angle(0,0,0)SWEP.UseHands=false;SWEP.ViewModel=""SWEP.WorldModel=""SWEP.CSMuzzleFlashes=false;SWEP.CSMuzzleX=false;DrGBase.IncludeFile'misc.lua'DrGBase.IncludeFile'primary.lua'DrGBase.IncludeFile'secondary.lua'function SWEP:Initialize()self:_BaseInitialize()self:CustomInitialize()end;function SWEP:_BaseInitialize()end;function SWEP:CustomInitialize()end;function SWEP:Think()self:_BaseThink()self:CustomThink()end;function SWEP:_BaseThink()end;function SWEP:CustomThink()end;function SWEP:Reload()self:DefaultReload(ACT_VM_RELOAD)end;if CLIENT then function SWEP:CalcViewModelView(a,b,c,d,e)local f=d+self.Owner:GetForward()*self.ViewModelOffset.x+self.Owner:GetUp()*self.ViewModelOffset.z;if self.ViewModelFlip then f=f-self.Owner:GetRight()*self.ViewModelOffset.y else f=f+self.Owner:GetRight()*self.ViewModelOffset.y end;local g=e+self.ViewModelAngle;return f,g end end
--addons/!lpakr_out/lua/weapons/drgbase_weapon/secondary.lua:
SWEP.Secondary.Enabled=false;SWEP.Secondary.Damage=1;SWEP.Secondary.Bullets=1;SWEP.Secondary.Spread=0;SWEP.Secondary.Automatic=false;SWEP.Secondary.Delay=0;SWEP.Secondary.Recoil=0;SWEP.Secondary.Ammo=""SWEP.Secondary.Cost=1;SWEP.Secondary.ClipSize=0;SWEP.Secondary.DefaultClip=0;SWEP.Secondary.Sound=""SWEP.Secondary.EmptySound=""function SWEP:CanSecondaryAttack()if!self.Secondary.Enabled then return false end;if self:GetSecondaryAmmoType()<0 then return true end;if self.Secondary.ClipSize>0 then return self.Weapon:Clip2()>=self.Secondary.Cost else return self.Owner:GetAmmoCount(self.Secondary.Ammo)>=self.Secondary.Cost end end;function SWEP:TriedToSecondaryAttack()self:EmitSound(self.Secondary.EmptySound)self:SetNextSecondaryFire(CurTime()+self.Secondary.Delay)end;function SWEP:SecondaryAttack()if!self.Secondary.Enabled then return false end;if!self:CanSecondaryAttack()then if IsFirstTimePredicted()then self:TriedToSecondaryAttack()end;return false end;if IsFirstTimePredicted()&&self:PreSecondaryAttack()==false then return false end;if IsFirstTimePredicted()then self:FireSecondary()end;self:EmitSound(self.Secondary.Sound)if IsFirstTimePredicted()then if self.Secondary.Delay>=0 then local a=CurTime()+self.Secondary.Delay;self:SetNextSecondaryFire(a)self:PostSecondaryAttack(a)else self:PostSecondaryAttack(CurTime())end end;return true end;function SWEP:PreSecondaryAttack()end;function SWEP:FireSecondary()self:ShootBullet(self.Secondary.Damage,self.Secondary.Bullets,self.Secondary.Spread)end;function SWEP:PostSecondaryAttack()end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/drgbase_tool_faction.lua:
TOOL.Tab="DrGBase"TOOL.Category="Tools"TOOL.Name="#tool.drgbase_tool_faction.name"TOOL.ClientConVar={["list"]="[]"}TOOL.BuildCPanel=function(a)a:Help("#tool.drgbase_tool_faction.desc")a:Help("Click on a faction to remove it from the list, or right click to copy it.")local b=DrGBase.DListView({"Factions"},{convar="drgbase_tool_faction_list"})b:SetSize(10,300)function b:OnRowSelected(c)self:RemoveLine(c)end;a:AddItem(b)a:Help("Insert a custom faction here:")local d=vgui.Create("DTextEntry")function b:OnRowRightClick(e,f)d:SetValue(f:GetValue(1))end;a:AddItem(d)local g=vgui.Create("DButton")g:SetText("Insert faction")function g:DoClick()b:AddLine(string.upper(d:GetValue()))end;a:AddItem(g)local h=vgui.Create("DButton")h:SetText("Clear factions")function h:DoClick()b:Clear()end;a:AddItem(h)end;function TOOL:ClearFactions()if CLIENT then return end;net.Start("DrGBaseFactionTool")net.WriteString("[]")net.Send(self:GetOwner())end;function TOOL:SetFactions(i)if CLIENT then return end;local j={}for k,l in ipairs(i)do table.insert(j,{l})end;net.Start("DrGBaseFactionTool")net.WriteString(util.TableToJSON(j))net.Send(self:GetOwner())end;function TOOL:LeftClick(m)local n=m.Entity;if IsValid(n)&&n.IsDrGNextbot then elseif n:IsWorld()then else return false end;return true end;function TOOL:RightClick(m)local n=m.Entity;if n:IsPlayer()then elseif n.IsDrGNextbot then elseif n:IsWorld()then else return false end;return true end;function TOOL:Reload()if CLIENT then return true end;self:ClearFactions()return true end;if SERVER then else language.Add("tool.drgbase_tool_faction.name","Faction Tool")language.Add("tool.drgbase_tool_faction.desc","Edit your factions or a nextbot's.")language.Add("tool.drgbase_tool_faction.0","Right click to copy a nextbot/player's factions, left click to apply those factions to a nextbot. (aim at the ground to apply them to yourself)")net.Receive("DrGBaseFactionTool",function(o)GetConVar("drgbase_tool_faction_list"):SetString(net.ReadString())end)end
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/drgbase_tool_omniscient.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/drgbase_tool_scale.lua:
TOOL.Tab="DrGBase"TOOL.Category="Tools"TOOL.Name="#tool.drgbase_tool_scale.name"TOOL.BuildCPanel=function(a)a:Help("#tool.drgbase_tool_scale.desc")a:Help("#tool.drgbase_tool_scale.0")end;function TOOL:LeftClick(b)if!IsValid(b.Entity)then return false end;if!b.Entity.IsDrGNextbot then return false end;return true end;function TOOL:RightClick(b)if!IsValid(b.Entity)then return false end;if!b.Entity.IsDrGNextbot then return false end;return true end;function TOOL:Reload(b)if!IsValid(b.Entity)then return false end;if!b.Entity.IsDrGNextbot then return false end;return true end;if CLIENT then language.Add("tool.drgbase_tool_scale.name","Change Scale")language.Add("tool.drgbase_tool_scale.desc","Change the scale of a nextbot.")language.Add("tool.drgbase_tool_scale.0","Left click to scale up, right click to scale down, reload to reset scale.")end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/editentity.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/editentity.lua:
TOOL.AddToMenu=false;TOOL.Category="Construction"TOOL.Name="#tool.editentity.name"function TOOL:LeftClick(a)if!a.Hit then return false end;self.Weapon:SetTargetEntity1(a.Entity)return true end;function TOOL:RightClick(a)return self:LeftClick(a)end;function TOOL:Think()local b=self.Weapon:GetTargetEntity1()if CLIENT&&self.LastEditing!=b then self.LastEditing=b;local c=controlpanel.Get("editentity")if!c then return end;c:ClearControls()self.BuildCPanel(c,b)end end;function TOOL.BuildCPanel(c,d)local e=vgui.Create("DEntityProperties")e:SetEntity(d)e:SetSize(10,500)c:AddPanel(e)end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/fadingdoor.lua:
if CLIENT then language.Add('tool.fadingdoor.name','Fading door tool')language.Add('tool.fadingdoor.desc','Create toggleable \'doors\' on a selected entity.')language.Add('tool.fadingdoor.left','Apply options to fading door')language.Add('tool.fadingdoor.reload','Disable fading door.')language.Add('tool.fadingdoor.toggle','Toggle Mode')language.Add('tool.fadingdoor.start_open','Start Open')language.Add('tool.fadingdoor.toggle_others','Toggle Other Doors')language.Add('tool.fadingdoor.bind','Activator Button')language.Add('tool.fadingdoor.enablematerial','Enable Material')language.Add('tool.fadingdoor.enable_sound','Enable Sound Effects')language.Add('tool.fadingdoor.sound_on','Enable Sound')language.Add('tool.fadingdoor.sound_off','Disable Sound')end;TOOL.Category='Superior Tools'TOOL.Name='#tool.fadingdoor.name'TOOL.Information={{name="left"},{name="left"},{name="reload"}}TOOL.ClientConVar['toggle']=1;TOOL.ClientConVar['start_open']=0;TOOL.ClientConVar['toggle_others']=0;TOOL.ClientConVar['bind']=0;TOOL.ClientConVar['enable_material']=0;TOOL.ClientConVar['fading_material']='materials/error'TOOL.ClientConVar['enable_sound']=0;TOOL.ClientConVar["sound_on"]='lightsaber/saber_loop1.wav'TOOL.ClientConVar["sound_off"]='lightsaber/saber_loop1.wav'list.Add('FadingDoorSounds',{'lightsaber/saber_loop1.wav'})local a={}local function b(c,d,e)if!IsValid(c)||!IsValid(d)then return false end;local f=d.fadingdoor;if!f then return false end;if f.toggle&&e==false then return end;local g=!f.faded;if g then d.orig_collision=d:GetCollisionGroup()d.orig_material=d:GetMaterial()d.orig_rendermode=d:GetRenderMode()local h=d:GetColor()local i=Color(h.r,h.g,h.b,200)d.orig_color=h;d:SetNoDraw(!f.enable_material)d:SetMaterial(f.fading_material)d:SetRenderMode(RENDERMODE_TRANSALPHA)d:SetColor(i)d:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)if f.enable_sound&&f.sound_on then emt:EmitSound(f.sound_on)end;f.faded=true else d:SetNoDraw(false)d:SetMaterial(d.orig_material)d:SetCollisionGroup(d.orig_collision)d:SetRenderMode(d.orig_rendermode)d:SetColor(d.orig_color)if f.enable_sound&&f.sound_off then emt:EmitSound(f.sound_off)end;f.faded=false end end;local function j(self,d,k)local c=IsEntity(self)&&self:IsPlayer()&&self||self:GetOwner()if!IsValid(c)then return end;if!IsValid(d)||d:GetClass()!="prop_physics"then return end;if CLIENT then return true end;if d.fadingdoor then numpad.Remove(d.fadingdoor.bind_down)numpad.Remove(d.fadingdoor.bind_up)end;if k then b(c,d,false)d.fadingdoor=nil;return true end;d.fadingdoor={toggle=self:GetClientNumber'toggle'==1,toggle_others=self:GetClientNumber'toggle_others'==1,start_open=self:GetClientNumber'start_open'==1,bind=self:GetClientNumber'bind',enable_material=self:GetClientNumber'enable_material'==1,fading_material=self:GetClientInfo'fading_material',sound_enabled=self:GetClientNumber'enable_sound'==1,sound_on=self:GetClientInfo'sound_on',sound_off=self:GetClientInfo'sound_off'}a[c]=a[c]||{}table.insert(a[c],d)numpad.Register('FadingDoorToggle',b)d.fadingdoor.bind_down=numpad.OnDown(c,d.fadingdoor.bind,'FadingDoorToggle',d,true)d.fadingdoor.bind_up=numpad.OnUp(c,d.fadingdoor.bind,'FadingDoorToggle',d,false)if d.fadingdoor.start_open==true then b(c,d,true)end;undo.Create'tool_fadingdoor'undo.SetPlayer(c)undo.AddEntity(d)undo.SetCustomUndoText'Undone Fading Door settings'undo.AddFunction(function(l,d)if IsValid(d)then j(l.Owner,d,true)end end,d)undo.Finish()return true end;function TOOL:LeftClick(m)return j(self,m.Entity)end;function TOOL:RightClick(m)return j(self,m.Entity)end;function TOOL:Reload(m)return j(self,m.Entity,true)end;function TOOL.BuildCPanel(n)n:AddControl('Checkbox',{Label='#tool.fadingdoor.toggle',Command='fadingdoor_toggle'})n:AddControl('Checkbox',{Label='#tool.fadingdoor.start_open',Command='fadingdoor_start_open'})n:AddControl('Checkbox',{Label='#tool.fadingdoor.toggle_others',Command='fadingdoor_toggle_others'})n:AddControl("Numpad",{Label="#tool.fadingdoor.bind",Command="fadingdoor_bind"})n:AddControl('Checkbox',{Label='#tool.fadingdoor.enable_sound',Command='fadingdoor_enable_sound'})n:AddControl('combobox',{Label='#tool.fadingdoor.sound_on',Options=list.Get('FadingDoorSounds')})n:AddControl('combobox',{Label='#tool.fadingdoor.sound_off',Options=list.Get('FadingDoorSounds')})n:AddControl('Checkbox',{Label='#tool.fadingdoor.enablematerial',Command='fadingdoor_enable_material'})local o={}for p,q in pairs(list.Get('OverrideMaterials'))do if!table.HasValue(o,q)then table.insert(o,q)end end;n:MatSelect('fadingdoor_fading_material',o,true,0.25,0.25)end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/material.lua:
TOOL.Category='Render'TOOL.Name='#tool.material.name'TOOL.ClientConVar['override']='debug/env_cubemap_model'TOOL.Information={{name="left"},{name="right"},{name="reload"}}local a={['phoenix_storms/scrnspace']=true}local function b(c,d,e)if SERVER&&e.MaterialOverride&&!a[e.MaterialOverride:lower()]then d:SetMaterial(e.MaterialOverride)duplicator.StoreEntityModifier(d,'material',e)end;return true end;duplicator.RegisterEntityModifier('material',b)function TOOL:LeftClick(f)if!IsValid(f.Entity)||CLIENT then return end;local g=f.Entity;if IsValid(g.AttachedEntity)then g=g.AttachedEntity end;local h=self:GetClientInfo('override')b(self:GetOwner(),g,{MaterialOverride=h})return true end;function TOOL:RightClick(f)local g=f.Entity;if IsValid(g.AttachedEntity)then g=g.AttachedEntity end;if!IsValid(g)then return false end;if CLIENT then return true end;local i=g:GetMaterial()if i==''then i=g:GetMaterials()[1]end;self:GetOwner():ConCommand("material_override "..i)return true end;function TOOL:Reload(f)if!IsValid(f.Entity)then return end;if CLIENT then return true end;local g=f.Entity;if IsValid(g.AttachedEntity)then g=g.AttachedEntity end;b(self:GetOwner(),g,{MaterialOverride=''})return true end;function TOOL.BuildCPanel(j)j:AddControl('Header',{Description='#tool.material.help'})local k=j:AddControl('TextBox',{Label='#spawnmenu.quick_filter_tool'})k:SetUpdateOnType(true)local l={}for m,n in pairs(list.Get('OverrideMaterials'))do if!table.HasValue(l,n)then table.insert(l,n)end end;local o=j:MatSelect('material_override',l,true,0.25,0.25)k.OnValueChange=function(p,q)for m,r in pairs(o.Controls)do if!r.Value:lower():find(q:lower())then r:SetVisible(false)else r:SetVisible(true)end end;o:InvalidateChildren()j:InvalidateChildren()end end;list.Add('OverrideMaterials','portal/border')list.Add('OverrideMaterials','models/altodev/swrp13/combineglass001a')list.Add('OverrideMaterials','null')list.Add('OverrideMaterials','models/mymodels/kamino/jedi_banner/jediorderflag')list.Add('OverrideMaterials','models/wireframe')list.Add('OverrideMaterials','debug/env_cubemap_model')list.Add('OverrideMaterials','models/shadertest/shader3')list.Add('OverrideMaterials','models/shadertest/shader4')list.Add('OverrideMaterials','models/shadertest/shader5')list.Add('OverrideMaterials','models/shiny')list.Add('OverrideMaterials','models/debug/debugwhite')list.Add('OverrideMaterials','models/props_combine/stasisshield_sheet')list.Add('OverrideMaterials','models/props_combine/com_shield001a')list.Add('OverrideMaterials','models/props_c17/frostedglass_01a')list.Add('OverrideMaterials','models/props_lab/Tank_Glass001')list.Add('OverrideMaterials','models/props_combine/tprings_globe')list.Add('OverrideMaterials','models/screenspace')list.Add('OverrideMaterials','brick/brick_model')list.Add('OverrideMaterials','models/props_pipes/GutterMetal01a')list.Add('OverrideMaterials','models/props_pipes/Pipesystem01a_skin3')list.Add('OverrideMaterials','models/props_wasteland/wood_fence01a')list.Add('OverrideMaterials','models/props_foliage/tree_deciduous_01a_trunk')list.Add('OverrideMaterials','models/props_c17/FurnitureFabric003a')list.Add('OverrideMaterials','models/props_c17/FurnitureMetal001a')list.Add('OverrideMaterials','models/props_c17/paper01')list.Add('OverrideMaterials','models/flesh')list.Add('OverrideMaterials','phoenix_storms/metalset_1-2')list.Add('OverrideMaterials','phoenix_storms/metalfloor_2-3')list.Add('OverrideMaterials','phoenix_storms/plastic')list.Add('OverrideMaterials','phoenix_storms/wood')list.Add('OverrideMaterials','phoenix_storms/bluemetal')list.Add('OverrideMaterials','phoenix_storms/cube')list.Add('OverrideMaterials','phoenix_storms/dome')list.Add('OverrideMaterials','phoenix_storms/gear')list.Add('OverrideMaterials','phoenix_storms/stripes')list.Add('OverrideMaterials','phoenix_storms/wire/pcb_green')list.Add('OverrideMaterials','phoenix_storms/wire/pcb_red')list.Add('OverrideMaterials','phoenix_storms/wire/pcb_blue')list.Add('OverrideMaterials','hunter/myplastic')list.Add('OverrideMaterials','models/XQM/LightLinesRed_tool')list.Add('OverrideMaterials','models/XQM//Deg360')list.Add('OverrideMaterials','models/XQM//LightLinesGB')list.Add('OverrideMaterials','models/XQM//LightLinesRed')list.Add('OverrideMaterials','models/XQM//SquaredMat')list.Add('OverrideMaterials','models/XQM//WoodTexture_1')list.Add('OverrideMaterials','models/antlion/antlion_innards')list.Add('OverrideMaterials','models/barnacle/roots')list.Add('OverrideMaterials','models/combine_advisor/body9')list.Add('OverrideMaterials','models/combine_advisor/mask')list.Add('OverrideMaterials','models/combine_scanner/scanner_eye')list.Add('OverrideMaterials','models/dog/eyeglass')list.Add('OverrideMaterials','models/effects/slimebubble_sheet')list.Add('OverrideMaterials','models/effects/splode_sheet')list.Add('OverrideMaterials','models/gibs/metalgibs/metal_gibs')list.Add('OverrideMaterials','models/gibs/woodgibs/woodgibs01')list.Add('OverrideMaterials','models/gibs/woodgibs/woodgibs02')list.Add('OverrideMaterials','models/gibs/woodgibs/woodgibs03')list.Add('OverrideMaterials','models/player/player_chrome1')list.Add('OverrideMaterials','models/props_animated_breakable/smokestack/brickwall002a')list.Add('OverrideMaterials','models/props_building_details/courtyard_template001c_bars')list.Add('OverrideMaterials','models/props_buildings/destroyedbuilldingwall01a')list.Add('OverrideMaterials','models/props_buildings/plasterwall021a')list.Add('OverrideMaterials','models/props_c17/furniturefabric001a')list.Add('OverrideMaterials','models/props_c17/furniturefabric002a')list.Add('OverrideMaterials','models/props_c17/furnituremetal001a')list.Add('OverrideMaterials','models/props_c17/gate_door02a')list.Add('OverrideMaterials','models/props_c17/metalladder001')list.Add('OverrideMaterials','models/props_c17/metalladder002')list.Add('OverrideMaterials','models/props_c17/metalladder003')list.Add('OverrideMaterials','models/props_canal/canal_bridge_railing_01a')list.Add('OverrideMaterials','models/props_canal/canal_bridge_railing_01b')list.Add('OverrideMaterials','models/props_canal/canal_bridge_railing_01c')list.Add('OverrideMaterials','models/props_canal/canalmap_sheet')list.Add('OverrideMaterials','models/props_canal/coastmap_sheet')list.Add('OverrideMaterials','models/props_canal/metalcrate001d')list.Add('OverrideMaterials','models/props_canal/metalwall005b')list.Add('OverrideMaterials','models/props_canal/rock_riverbed01a')list.Add('OverrideMaterials','models/props_combine/citadel_cable')list.Add('OverrideMaterials','models/props_combine/citadel_cable_b')list.Add('OverrideMaterials','models/props_combine/combine_interface_disp')list.Add('OverrideMaterials','models/props_combine/combine_monitorbay_disp')list.Add('OverrideMaterials','models/props_combine/metal_combinebridge001')list.Add('OverrideMaterials','models/props_combine/pipes01')list.Add('OverrideMaterials','models/props_combine/pipes03')list.Add('OverrideMaterials','models/props_combine/prtl_sky_sheet')list.Add('OverrideMaterials','models/props_debris/building_template010a')list.Add('OverrideMaterials','models/props_debris/building_template022j')list.Add('OverrideMaterials','models/props_debris/composite_debris')list.Add('OverrideMaterials','models/props_debris/concretefloor013a')list.Add('OverrideMaterials','models/props_debris/concretefloor020a')list.Add('OverrideMaterials','models/props_debris/concretewall019a')list.Add('OverrideMaterials','models/props_debris/metalwall001a')list.Add('OverrideMaterials','models/props_debris/plasterceiling008a')list.Add('OverrideMaterials','models/props_debris/plasterwall009d')list.Add('OverrideMaterials','models/props_debris/plasterwall021a')list.Add('OverrideMaterials','models/props_debris/plasterwall034a')list.Add('OverrideMaterials','models/props_debris/plasterwall034d')list.Add('OverrideMaterials','models/props_debris/plasterwall039c')list.Add('OverrideMaterials','models/props_debris/plasterwall040c')list.Add('OverrideMaterials','models/props_debris/tilefloor001c')list.Add('OverrideMaterials','models/props_foliage/driftwood_01a')list.Add('OverrideMaterials','models/props_foliage/oak_tree01')list.Add('OverrideMaterials','models/props_interiors/metalfence007a')list.Add('OverrideMaterials','models/props_junk/plasticcrate01a')list.Add('OverrideMaterials','models/props_junk/plasticcrate01b')list.Add('OverrideMaterials','models/props_junk/plasticcrate01c')list.Add('OverrideMaterials','models/props_junk/plasticcrate01d')list.Add('OverrideMaterials','models/props_junk/plasticcrate01e')list.Add('OverrideMaterials','models/props_lab/cornerunit_cloud')list.Add('OverrideMaterials','models/props_lab/door_klab01')list.Add('OverrideMaterials','models/props_lab/security_screens')list.Add('OverrideMaterials','models/props_lab/security_screens2')list.Add('OverrideMaterials','models/props_lab/warp_sheet')list.Add('OverrideMaterials','models/props_lab/xencrystal_sheet')list.Add('OverrideMaterials','models/props_pipes/destroyedpipes01a')list.Add('OverrideMaterials','models/props_pipes/pipemetal001a')list.Add('OverrideMaterials','models/props_pipes/pipeset_metal02')list.Add('OverrideMaterials','models/props_pipes/pipesystem01a_skin1')list.Add('OverrideMaterials','models/props_pipes/pipesystem01a_skin2')list.Add('OverrideMaterials','models/props_vents/borealis_vent001')list.Add('OverrideMaterials','models/props_vents/borealis_vent001b')list.Add('OverrideMaterials','models/props_vents/borealis_vent001c')list.Add('OverrideMaterials','models/props_wasteland/concretefloor010a')list.Add('OverrideMaterials','models/props_wasteland/concretewall064b')list.Add('OverrideMaterials','models/props_wasteland/concretewall066a')list.Add('OverrideMaterials','models/props_wasteland/dirtwall001a')list.Add('OverrideMaterials','models/props_wasteland/metal_tram001a')list.Add('OverrideMaterials','models/props_wasteland/quarryobjects01')list.Add('OverrideMaterials','models/props_wasteland/rockcliff02a')list.Add('OverrideMaterials','models/props_wasteland/rockcliff02b')list.Add('OverrideMaterials','models/props_wasteland/rockcliff02c')list.Add('OverrideMaterials','models/props_wasteland/rockcliff04a')list.Add('OverrideMaterials','models/props_wasteland/rockgranite02a')list.Add('OverrideMaterials','models/props_wasteland/tugboat01')list.Add('OverrideMaterials','models/props_wasteland/tugboat02')list.Add('OverrideMaterials','models/props_wasteland/wood_fence01a_skin2')list.Add('OverrideMaterials','models/shadertest/predator')list.Add('OverrideMaterials','models/weapons/v_crossbow/rebar_glow')list.Add('OverrideMaterials','models/weapons/v_crowbar/crowbar_cyl')list.Add('OverrideMaterials','models/weapons/v_grenade/grenade body')list.Add('OverrideMaterials','models/XQM/BoxFull_diffuse')list.Add('OverrideMaterials','models/XQM/CellShadedCamo_diffuse')list.Add('OverrideMaterials','models/XQM/CinderBlock_Tex')list.Add('OverrideMaterials','models/XQM/JetBody2TailPiece_diffuse')list.Add('OverrideMaterials','models/XQM/PoleX1_diffuse')list.Add('OverrideMaterials','models/XQM/Rails/gumball_1')list.Add('OverrideMaterials','models/XQM/SquaredMatInverted')list.Add('OverrideMaterials','models/XQM/WoodPlankTexture')list.Add('OverrideMaterials','models/XQM/boxfull_diffuse')list.Add('OverrideMaterials','models/dav0r/hoverball')list.Add('OverrideMaterials','models/spawn_effect')list.Add('OverrideMaterials','phoenix_storms/Fender_chrome')list.Add('OverrideMaterials','phoenix_storms/Fender_white')list.Add('OverrideMaterials','phoenix_storms/Fender_wood')list.Add('OverrideMaterials','phoenix_storms/Future_vents')list.Add('OverrideMaterials','phoenix_storms/FuturisticTrackRamp_1-2')list.Add('OverrideMaterials','phoenix_storms/OfficeWindow_1-1')list.Add('OverrideMaterials','phoenix_storms/Pro_gear_side')list.Add('OverrideMaterials','phoenix_storms/black_brushes')list.Add('OverrideMaterials','phoenix_storms/black_chrome')list.Add('OverrideMaterials','phoenix_storms/blue_steel')list.Add('OverrideMaterials','phoenix_storms/camera')list.Add('OverrideMaterials','phoenix_storms/car_tire')list.Add('OverrideMaterials','phoenix_storms/checkers_map')list.Add('OverrideMaterials','phoenix_storms/cigar')list.Add('OverrideMaterials','phoenix_storms/concrete0')list.Add('OverrideMaterials','phoenix_storms/concrete1')list.Add('OverrideMaterials','phoenix_storms/concrete2')list.Add('OverrideMaterials','phoenix_storms/concrete3')list.Add('OverrideMaterials','phoenix_storms/construct/concrete_barrier00')list.Add('OverrideMaterials','phoenix_storms/construct/concrete_barrier2_00')list.Add('OverrideMaterials','phoenix_storms/construct/concrete_pipe_00')list.Add('OverrideMaterials','phoenix_storms/egg')list.Add('OverrideMaterials','phoenix_storms/gear_top')list.Add('OverrideMaterials','phoenix_storms/grey_chrome')list.Add('OverrideMaterials','phoenix_storms/grey_steel')list.Add('OverrideMaterials','phoenix_storms/heli')list.Add('OverrideMaterials','phoenix_storms/indentTiles2')list.Add('OverrideMaterials','phoenix_storms/iron_rails')list.Add('OverrideMaterials','phoenix_storms/mat/mat_phx_carbonfiber')list.Add('OverrideMaterials','phoenix_storms/mat/mat_phx_metallic')list.Add('OverrideMaterials','phoenix_storms/mat/mat_phx_metallic2')list.Add('OverrideMaterials','phoenix_storms/mat/mat_phx_plastic')list.Add('OverrideMaterials','phoenix_storms/mat/mat_phx_plastic2')list.Add('OverrideMaterials','phoenix_storms/metal_plate')list.Add('OverrideMaterials','phoenix_storms/metal_wheel')list.Add('OverrideMaterials','phoenix_storms/metalbox')list.Add('OverrideMaterials','phoenix_storms/metalbox2')list.Add('OverrideMaterials','phoenix_storms/metalfence004a')list.Add('OverrideMaterials','phoenix_storms/middle')list.Add('OverrideMaterials','phoenix_storms/mrref2')list.Add('OverrideMaterials','phoenix_storms/output_jack')list.Add('OverrideMaterials','phoenix_storms/pack2/chrome')list.Add('OverrideMaterials','phoenix_storms/pack2/interior_sides')list.Add('OverrideMaterials','phoenix_storms/pack2/train_floor')list.Add('OverrideMaterials','phoenix_storms/potato')list.Add('OverrideMaterials','phoenix_storms/pro_gear_top2')list.Add('OverrideMaterials','phoenix_storms/ps_grass')list.Add('OverrideMaterials','phoenix_storms/road')list.Add('OverrideMaterials','phoenix_storms/roadside')list.Add('OverrideMaterials','phoenix_storms/scrnspace')list.Add('OverrideMaterials','phoenix_storms/side')list.Add('OverrideMaterials','phoenix_storms/simplyMetallic1')list.Add('OverrideMaterials','phoenix_storms/smallwheel')list.Add('OverrideMaterials','phoenix_storms/spheremappy')list.Add('OverrideMaterials','phoenix_storms/t_light')list.Add('OverrideMaterials','phoenix_storms/thruster')list.Add('OverrideMaterials','phoenix_storms/tiles2')list.Add('OverrideMaterials','phoenix_storms/top')list.Add('OverrideMaterials','phoenix_storms/torpedo')list.Add('OverrideMaterials','phoenix_storms/trains/track_beamside')list.Add('OverrideMaterials','phoenix_storms/trains/track_beamtop')list.Add('OverrideMaterials','phoenix_storms/trains/track_plate')list.Add('OverrideMaterials','phoenix_storms/trains/track_plateside')list.Add('OverrideMaterials','phoenix_storms/white_brushes')list.Add('OverrideMaterials','phoenix_storms/white_fps')list.Add('OverrideMaterials','phoenix_storms/window')list.Add('OverrideMaterials','phoenix_storms/wood_dome')list.Add('OverrideMaterials','phoenix_storms/wood_side')list.Add('OverrideMaterials','models/cs_havana/wndb')list.Add('OverrideMaterials','models/cs_havana/wndd')list.Add('OverrideMaterials','models/cs_italy/plaster')list.Add('OverrideMaterials','models/cs_italy/pwtrim2')list.Add('OverrideMaterials','models/de_cbble/wndarch')list.Add('OverrideMaterials','models/de_chateau/ch_arch_b1')list.Add('OverrideMaterials','models/pi_window/plaster')list.Add('OverrideMaterials','models/pi_window/trim128')list.Add('OverrideMaterials','models/props/cs_assault/dollar')list.Add('OverrideMaterials','models/props/cs_assault/fireescapefloor')list.Add('OverrideMaterials','models/props/cs_assault/metal_stairs1')list.Add('OverrideMaterials','models/props/cs_assault/moneywrap')list.Add('OverrideMaterials','models/props/cs_assault/moneywrap02')list.Add('OverrideMaterials','models/props/cs_assault/moneytop')list.Add('OverrideMaterials','models/props/cs_assault/pylon')list.Add('OverrideMaterials','models/props/CS_militia/boulder01')list.Add('OverrideMaterials','models/props/CS_militia/milceil001')list.Add('OverrideMaterials','models/props/CS_militia/militiarock')list.Add('OverrideMaterials','models/props/CS_militia/militiarockb')list.Add('OverrideMaterials','models/props/CS_militia/milwall006')list.Add('OverrideMaterials','models/props/CS_militia/rocks01')list.Add('OverrideMaterials','models/props/CS_militia/roofbeams01')list.Add('OverrideMaterials','models/props/CS_militia/roofbeams02')list.Add('OverrideMaterials','models/props/CS_militia/roofbeams03')list.Add('OverrideMaterials','models/props/CS_militia/RoofEdges')list.Add('OverrideMaterials','models/props/cs_office/clouds')list.Add('OverrideMaterials','models/props/cs_office/file_cabinet2')list.Add('OverrideMaterials','models/props/cs_office/file_cabinet3')list.Add('OverrideMaterials','models/props/cs_office/screen')list.Add('OverrideMaterials','models/props/cs_office/snowmana')list.Add('OverrideMaterials','models/props/de_inferno/de_inferno_boulder_03')list.Add('OverrideMaterials','models/props/de_inferno/infflra')list.Add('OverrideMaterials','models/props/de_inferno/infflrd')list.Add('OverrideMaterials','models/props/de_inferno/inftowertop')list.Add('OverrideMaterials','models/props/de_inferno/offwndwb_break')list.Add('OverrideMaterials','models/props/de_inferno/roofbits')list.Add('OverrideMaterials','models/props/de_inferno/tileroof01')list.Add('OverrideMaterials','models/props/de_inferno/woodfloor008a')list.Add('OverrideMaterials','models/props/de_nuke/nukconcretewalla')list.Add('OverrideMaterials','models/props/de_nuke/nukecardboard')list.Add('OverrideMaterials','models/props/de_nuke/pipeset_metal')list.Add('OverrideMaterials','models/props_pipes/pipeset_metal')list.Add('OverrideMaterials','models/props_combine/combinethumper002')list.Add('OverrideMaterials','models/props_combine/tprotato1_sheet')list.Add('OverrideMaterials','models/props_debris/building_template012d')list.Add('OverrideMaterials','models/props_combine/tprings_sheet')list.Add('OverrideMaterials','models/weapons/v_stunbaton/w_shaft01a')list.Add('OverrideMaterials','models/props_wasteland/lighthouse_stairs')list.Add('OverrideMaterials','models/props_c17/frostedglass_01a_dx60')list.Add('OverrideMaterials','models/props_lab/generatorconsole_disp')list.Add('OverrideMaterials','models/props_combine/health_charger_glass')list.Add('OverrideMaterials','phoenix_storms/Airboat')list.Add('OverrideMaterials','phoenix_storms/Blue_steel')list.Add('OverrideMaterials','phoenix_storms/Indenttiles2')list.Add('OverrideMaterials','phoenix_storms/Indenttiles_1-2')list.Add('OverrideMaterials','phoenix_storms/MetalSet_1-2')list.Add('OverrideMaterials','phoenix_storms/Metalfloor_2-3')list.Add('OverrideMaterials','phoenix_storms/amraam')list.Add('OverrideMaterials','phoenix_storms/barrel')list.Add('OverrideMaterials','phoenix_storms/bomb')list.Add('OverrideMaterials','phoenix_storms/cannon')list.Add('OverrideMaterials','phoenix_storms/chrome')list.Add('OverrideMaterials','phoenix_storms/dome_side')list.Add('OverrideMaterials','phoenix_storms/explo_barrel')list.Add('OverrideMaterials','phoenix_storms/fender')list.Add('OverrideMaterials','phoenix_storms/fender_chrome')list.Add('OverrideMaterials','phoenix_storms/fender_white')list.Add('OverrideMaterials','phoenix_storms/fender_wood')list.Add('OverrideMaterials','phoenix_storms/future_vents')list.Add('OverrideMaterials','phoenix_storms/glass')list.Add('OverrideMaterials','phoenix_storms/lag_sign')list.Add('OverrideMaterials','phoenix_storms/metal')list.Add('OverrideMaterials','phoenix_storms/mrtire')list.Add('OverrideMaterials','phoenix_storms/point1')list.Add('OverrideMaterials','phoenix_storms/pack2/black')list.Add('OverrideMaterials','phoenix_storms/pack2/bluelight')list.Add('OverrideMaterials','phoenix_storms/pack2/darkblue')list.Add('OverrideMaterials','phoenix_storms/pack2/darkgrey')list.Add('OverrideMaterials','phoenix_storms/pack2/glass')list.Add('OverrideMaterials','phoenix_storms/pack2/interior_top')list.Add('OverrideMaterials','phoenix_storms/pack2/metalbox2')list.Add('OverrideMaterials','phoenix_storms/pack2/panel')list.Add('OverrideMaterials','phoenix_storms/pack2/redlight')list.Add('OverrideMaterials','models/effects/splode1_sheet')list.Add('OverrideMaterials','models/error/new light1')list.Add('OverrideMaterials','models/items/boxsniperrounds')list.Add('OverrideMaterials','models/weapons/v_slam/new light1')list.Add('OverrideMaterials','models/props_junk/ravenholmsign_sheet')list.Add('OverrideMaterials','models/props_junk/TrafficCone001a')list.Add('OverrideMaterials','models/Items/boxart1')list.Add('OverrideMaterials','models/props/de_tides/clouds')list.Add('OverrideMaterials','models/props/cs_office/offinspa')list.Add('OverrideMaterials','models/props/cs_office/offinspb')list.Add('OverrideMaterials','models/props/cs_office/offinspc')list.Add('OverrideMaterials','models/props/cs_office/offinspd')list.Add('OverrideMaterials','models/props/cs_office/offinspf')list.Add('OverrideMaterials','models/props/cs_office/offinspg')list.Add('OverrideMaterials','models/balloon/balloon_hl2')list.Add('OverrideMaterials','models/balloon/balloon_nips')list.Add('OverrideMaterials','models/balloon/balloon_milfman')list.Add('OverrideMaterials','models/effects/vol_light001')list.Add('OverrideMaterials','models/effects/vol_lightmask02')list.Add('OverrideMaterials','pk02/pk02_ceiling01')util.AddWhitelistedMaterial('starwars/')util.AddWhitelistedMaterial('phoenix_storms/')util.AddWhitelistedMaterial('models/')util.AddWhitelistedMaterial('galactic/')util.AddWhitelistedMaterial('tx130t/')util.AddBlacklistedMaterial('models/altodev/')
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/precision.lua:
TOOL.Category="Superior Tools"TOOL.Name="#Tool.precision.name"TOOL.Command=nil;TOOL.ConfigName=""TOOL.ClientConVar["mode"]="1"TOOL.ClientConVar["user"]="1"TOOL.ClientConVar["forcelimit"]="0"TOOL.ClientConVar["freeze"]="1"TOOL.ClientConVar["nocollide"]="1"TOOL.ClientConVar["nocollideall"]="0"TOOL.ClientConVar["rotation"]="15"TOOL.ClientConVar["rotate"]="1"TOOL.ClientConVar["offset"]="0"TOOL.ClientConVar["torquelimit"]="0"TOOL.ClientConVar["friction"]="0"TOOL.ClientConVar["width"]="1"TOOL.ClientConVar["offsetpercent"]="1"TOOL.ClientConVar["removal"]="0"TOOL.ClientConVar["move"]="1"TOOL.ClientConVar["physdisable"]="0"TOOL.ClientConVar["ShadowDisable"]="0"TOOL.ClientConVar["allowphysgun"]="0"TOOL.ClientConVar["autorotate"]="0"TOOL.ClientConVar["entirecontrap"]="0"TOOL.ClientConVar["nudge"]="25"TOOL.ClientConVar["nudgepercent"]="1"TOOL.ClientConVar["disablesliderfix"]="0"TOOL.ClientConVar["XRotMin"]="-180"TOOL.ClientConVar["XRotMax"]="180"TOOL.ClientConVar["YRotMin"]="-180"TOOL.ClientConVar["YRotMax"]="180"TOOL.ClientConVar["ZRotMin"]="-180"TOOL.ClientConVar["ZRotMax"]="180"TOOL.ClientConVar["XRotFric"]="0"TOOL.ClientConVar["YRotFric"]="0"TOOL.ClientConVar["ZRotFric"]="0"TOOL.ClientConVar["FreeMov"]="0"TOOL.ClientConVar["enablefeedback"]="1"TOOL.ClientConVar["chatfeedback"]="1"TOOL.ClientConVar["nudgeundo"]="0"TOOL.ClientConVar["moveundo"]="1"TOOL.ClientConVar["rotateundo"]="1"if CLIENT then language.Add("Tool.precision.name","Easy Precision")language.Add("Tool.precision.desc","Accurately positions objects")language.Add("Tool.precision.0","Primary: Move/Apply | Secondary: Push | Reload: Pull")language.Add("Tool.precision.1","Target the second item. If enabled, this will move the first item.  (Swap weps to cancel)")language.Add("Tool.precision.2","Rotate enabled: Turn left and right to rotate the object (Hold reload or alt-fire for other rotation directions!)")language.Add("Undone.precision","Undone Precision Constraint")language.Add("Undone.precision.nudge","Undone Precision Nudge")language.Add("Undone.precision.rotate","Undone Precision Rotate")language.Add("Undone.precision.move","Undone Precision Move")language.Add("Undone.precision.weld","Undone Precision Weld")language.Add("Undone.precision.axis","Undone Precision Axis")language.Add("Undone.precision.ballsocket","Undone Precision Ballsocket")language.Add("Undone.precision.advanced.ballsocket","Undone Precision Advanced Ballsocket")language.Add("Undone.precision.slider","Undone Precision Slider")end;TOOL.inuse=nil;TOOL.axis=0;TOOL.axisY=0;TOOL.axisZ=0;TOOL.realdegrees=0;TOOL.lastdegrees=0;TOOL.realdegreesY=0;TOOL.lastdegreesY=0;TOOL.realdegreesZ=0;TOOL.lastdegreesZ=0;TOOL.OldPos=0;TOOL.axis2=0;TOOL.axisY2=0;TOOL.axisZ2=0;TOOL.realdegrees2=0;TOOL.lastdegrees2=0;TOOL.realdegrees2Y=0;TOOL.lastdegrees2Y=0;TOOL.realdegrees2Z=0;TOOL.lastdegrees2Z=0;TOOL.OldPos2=0;TOOL.SavedPos=Vector(0,0,1)function TOOL:GetToolMode(a)return self:GetClientNumber("mode",a)end;function TOOL:GetSnapDistance()return math.Clamp(self:GetClientNumber("offset"),-10000,10000)end;function TOOL:GetSnapPercent()return self:GetClientNumber("offsetpercent")==1 end;function TOOL:GetNudgeDistance()return math.Clamp(self:GetClientNumber("nudge"),-100,100)end;function TOOL:GetNudgePercent()return self:GetClientNumber("nudgepercent")==1 end;function TOOL:GetDoRotate()return self:GetClientNumber("rotate")==1 end;function TOOL:GetRotation()return math.Clamp(self:GetClientNumber("rotation"),0,360)end;function TOOL:DoParent(b,c)local d=c;if!(b&&b:IsValid()&&b:EntIndex()!=0)then self:SendMessage("Oops, First Target was world or somthing invalid")return end;if!(c&&c:IsValid()&&c:EntIndex()!=0)then self:SendMessage("Oops, Second Target was world or somthing invalid")return end;if b==c then self:SendMessage("Oops, Can't parent somthing to itself")return end;b:SetMoveType(MOVETYPE_NONE)local disablephysgun=self:GetClientNumber("allowphysgun")==0;b.PhysgunDisabled=disablephysgun;b:SetUnFreezable(disablephysgun)local e=b:GetPhysicsObject()if e:IsValid()then e:EnableCollisions(false)end;while true do if!d:GetParent():IsValid()then b:SetParent(c)if self:GetClientNumber("entirecontrap")==0 then self:SendMessage("Parent Set.")end;e:Wake()break elseif d:GetParent()==b then UndoParent(d)timer.Simple(0.1,function()b.SetParent(b,c)end)self:SendMessage("Oops, Closed Parent Loop Detected; Broken loop and set parent.")break else d=d:GetParent()end end;e:Wake()end;function TOOL:UndoParent(b)b:SetParent(nil)b:SetMoveType(MOVETYPE_VPHYSICS)b.PhysgunDisabled=false;b:SetUnFreezable(false)local e=b:GetPhysicsObject()if e:IsValid()then e:EnableCollisions(true)e:Wake()end end;function TOOL:DoConstraint()local b,c=self:GetEnt(1),self:GetEnt(2)if!b:IsValid()||CLIENT then self:ClearObjects()return false end;local f=self:GetToolMode(1)local g=self:GetClientNumber("forcelimit",0)local h=util.tobool(self:GetClientNumber("freeze",1))local i=self:GetClientNumber("nocollide",0)local j=util.tobool(self:GetClientNumber("nocollideall",0))local k=self:GetClientNumber("torquelimit",0)local l=self:GetClientNumber("width",1)local m=self:GetClientNumber("friction",0)local n=util.tobool(self:GetClientNumber("physdisable",0))local o,p=self:GetBone(1),self:GetBone(2)local q,r=self:GetLocalPos(1),self:GetLocalPos(2)local e=self:GetPhys(1)if self:GetClientNumber("entirecontrap")==1 then local s=0;local t={}local u={}local v={}GetAllEnts(b,t,u,v)for w,x in pairs(t)do if x&&x:IsValid()then if!(x==c)then local y=x:GetPhysicsObject()if y:IsValid()then y:EnableCollisions(!j)y:EnableMotion(!h)y:Wake()if x:GetPhysicsObjectCount()<2 then if f==1 then x:DrawShadow(!shadowdisable)if n then x:SetMoveType(MOVETYPE_NONE)x.PhysgunDisabled=disablephysgun;x:SetUnFreezable(disablephysgun)else x:SetMoveType(MOVETYPE_VPHYSICS)x.PhysgunDisabled=false;x:SetUnFreezable(false)end elseif f==2 then self:SendMessage("Sorry, No entire contraption rotating... yet")return false elseif f==3 then self:SendMessage("Sorry, No entire contraption moving... yet")return false elseif f==4 then local constraint=constraint.Weld(x,c,0,p,g,util.tobool(i))if constraint then undo.Create("Precision_Weld")undo.AddEntity(constraint)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",constraint)end elseif f==5 then local constraint=constraint.Axis(x,c,0,p,q,r,g,k,m,i)if constraint then undo.Create("Precision_Axis")undo.AddEntity(constraint)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",constraint)end elseif f==6 then local constraint=constraint.Ballsocket(x,c,0,p,r,g,k,i)if constraint then undo.Create("Precision_Ballsocket")undo.AddEntity(constraint)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",constraint)end elseif f==7 then local constraint=constraint.AdvBallsocket(x,c,0,p,q,r,g,k,self:GetClientNumber("XRotMin",-180),self:GetClientNumber("YRotMin",-180),self:GetClientNumber("ZRotMin",-180),self:GetClientNumber("XRotMax",180),self:GetClientNumber("YRotMax",180),self:GetClientNumber("ZRotMax",180),self:GetClientNumber("XRotFric",0),self:GetClientNumber("YRotFric",0),self:GetClientNumber("ZRotFric",0),self:GetClientNumber("FreeMov",0),i)if constraint then undo.Create("Precision_Advanced_Ballsocket")undo.AddEntity(constraint)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",constraint)end elseif f==8 then local z=constraint.Slider(x,c,0,p,q,r,l)if z then undo.Create("Precision_Slider")if self:GetClientNumber("disablesliderfix")==0 then local constraint2=constraint.AdvBallsocket(b,c,o,p,q,r,0,0,0,-180,-180,0,180,180,50,0,0,1,0)if constraint2 then undo.AddEntity(constraint2)end;local constraint3=constraint.AdvBallsocket(b,c,o,p,q,r,0,0,-180,0,-180,180,0,180,0,50,0,1,0)if constraint3 then undo.AddEntity(constraint3)end;local constraint4=constraint.AdvBallsocket(b,c,o,p,q,r,0,0,-180,-180,0,180,180,0,0,0,50,1,0)if constraint4 then undo.AddEntity(constraint4)end end;undo.AddEntity(z)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",z)end end;if util.tobool(i)&&iNum!=0 then local constraint=constraint.NoCollide(x,c,0,p)end end;if f==9 then self:DoParent(x,c)end end end end;s=s+1 end;self:SendMessage(s.." items constrained.")else if f==1 then if!b:GetParent():IsValid()then e:EnableCollisions(!j)if n then self:SendMessage("Item Physics Disabled.")local disablephysgun=false;if self:GetClientNumber("allowphysgun")==0 then disablephysgun=true end;b:SetMoveType(MOVETYPE_NONE)b.PhysgunDisabled=disablephysgun;b:SetUnFreezable(disablephysgun)if b:GetMoveType()==0 then b:SetPos(e:GetPos())b:SetAngles(e:GetAngles())end else b:SetMoveType(MOVETYPE_VPHYSICS)b.PhysgunDisabled=false;b:SetUnFreezable(false)end end;b:DrawShadow(!util.tobool(self:GetClientNumber("ShadowDisable",0)))elseif f==2 then self:SendMessage("Rotate completed")elseif f==3 then self:SendMessage("Snap move completed")elseif f==4 then local constraint=constraint.Weld(b,c,o,p,g,util.tobool(i))if constraint then self:SendMessage("Target welded.")undo.Create("Precision_Weld")undo.AddEntity(constraint)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",constraint)end elseif f==5 then local constraint=constraint.Axis(b,c,o,p,q,r,g,k,m,i)if constraint then self:SendMessage("Target Axised.")undo.Create("Precision_Axis")undo.AddEntity(constraint)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",constraint)end elseif f==6 then local constraint=constraint.Ballsocket(b,c,o,p,r,g,k,i)if constraint then self:SendMessage("Target Ballsocketed.")undo.Create("Precision_Ballsocket")undo.AddEntity(constraint)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",constraint)end elseif f==7 then local constraint=constraint.AdvBallsocket(b,c,o,p,q,r,g,k,self:GetClientNumber("XRotMin",-180),self:GetClientNumber("YRotMin",-180),self:GetClientNumber("ZRotMin",-180),self:GetClientNumber("XRotMax",180),self:GetClientNumber("YRotMax",180),self:GetClientNumber("ZRotMax",180),self:GetClientNumber("XRotFric",0),self:GetClientNumber("YRotFric",0),self:GetClientNumber("ZRotFric",0),self:GetClientNumber("FreeMov",0),i)if constraint then self:SendMessage("Target Adv Ballsocketed.")undo.Create("Precision_Advanced_Ballsocket")undo.AddEntity(constraint)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",constraint)end elseif f==8 then local z=constraint.Slider(b,c,o,p,q,r,l)if z then self:SendMessage("Target Slidered.")undo.Create("Precision_Slider")if self:GetClientNumber("disablesliderfix")==0 then local constraint2=constraint.AdvBallsocket(b,c,o,p,q,r,0,0,0,-180,-180,0,180,180,50,0,0,1,0)if constraint2 then undo.AddEntity(constraint2)end;local constraint3=constraint.AdvBallsocket(b,c,o,p,q,r,0,0,-180,0,-180,180,0,180,0,50,0,1,0)if constraint3 then undo.AddEntity(constraint3)end;local constraint4=constraint.AdvBallsocket(b,c,o,p,q,r,0,0,-180,-180,0,180,180,0,0,0,50,1,0)if constraint4 then undo.AddEntity(constraint4)end end;undo.AddEntity(z)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",z)self:GetOwner():AddCleanup("constraints",constraint2)self:GetOwner():AddCleanup("constraints",constraint3)self:GetOwner():AddCleanup("constraints",constraint4)end end;if util.tobool(i)&&iNum!=0 then local constraint=constraint.NoCollide(b,c,o,p)end;if f==9 then e:EnableMotion(0)self:DoParent(b,c)else e:EnableMotion(!h)e:Wake()end end;if inuse==self:GetOwner():SteamID64()then inuse=nil end;self:ClearObjects()end;function TOOL:DoNoConstraint(A)if CLIENT then self:ClearObjects()return true end;local h=util.tobool(self:GetClientNumber("freeze",1))local j=util.tobool(self:GetClientNumber("nocollideall",0))local n=util.tobool(self:GetClientNumber("physdisable",0))local B=util.tobool(self:GetClientNumber("autorotate",0))local shadowdisable=util.tobool(self:GetClientNumber("ShadowDisable",0))local disablephysgun=!util.tobool(self:GetClientNumber("allowphysgun",0))local b=A.Entity;local e=A.Entity:GetPhysicsObjectNum(A.PhysicsBone)if!b:IsValid()then self:ClearObjects()return false end;if self:GetClientNumber("entirecontrap")==1 then local s=0;local t={}local u={}local v={}GetAllEnts(b,t,u,v)local C=Vector(0,0,1)local D=Vector(0,0,1)if B then C=e:RotateAroundAxis(Vector(0,0,1),0)D=Vector(C.p-math.Round(C.p/45)*45,C.r-math.Round(C.r/45)*45,C.y-math.Round(C.y/45)*45)C.y=math.Round(C.y/45)*45;e:SetAngles(C)e:Wake()end;for w,x in pairs(t)do if x&&x:IsValid()then local y=x:GetPhysicsObject()if y:IsValid()then if B then if!(x==b)then local E=math.sqrt(math.pow(x:GetPos().X-b:GetPos().X,2)+math.pow(x:GetPos().Y-b:GetPos().Y,2))local F=math.atan((x:GetPos().Y-b:GetPos().Y)/(x:GetPos().X-b:GetPos().X))-math.rad(D.Z)if x:GetPos().X-b:GetPos().X<0 then x:SetPos(Vector(b:GetPos().X-E*math.cos(F),b:GetPos().Y-E*math.sin(F),x:GetPos().Z))else x:SetPos(Vector(b:GetPos().X+E*math.cos(F),b:GetPos().Y+E*math.sin(F),x:GetPos().Z))end;y:SetAngles(y:RotateAroundAxis(Vector(0,0,-1),D.Z))y:Wake()end end;if!x:GetParent():IsValid()then y:EnableCollisions(!j)y:EnableMotion(!h)y:Wake()end end;if!x:GetParent():IsValid()then if n then x:SetMoveType(MOVETYPE_NONE)x.PhysgunDisabled=disablephysgun;x:SetUnFreezable(disablephysgun)else x:SetMoveType(MOVETYPE_VPHYSICS)x.PhysgunDisabled=false;x:SetUnFreezable(false)end end;x:DrawShadow(!shadowdisable)end;s=s+1 end;self:SendMessage(s.." items targeted :")else if B then local C=e:RotateAroundAxis(Vector(0,0,1),0)C.p=math.Round(C.p/45)*45;C.r=math.Round(C.r/45)*45;C.y=math.Round(C.y/45)*45;e:SetAngles(C)e:Wake()end;e:EnableCollisions(!j)if!b:GetParent():IsValid()then if n then b:SetMoveType(MOVETYPE_NONE)b.PhysgunDisabled=disablephysgun;b:SetUnFreezable(disablephysgun)else b:SetMoveType(MOVETYPE_VPHYSICS)b.PhysgunDisabled=false;b:SetUnFreezable(false)end;e:EnableMotion(!h)e:Wake()end;b:DrawShadow(!shadowdisable)end;if inuse==self:GetOwner():SteamID64()then inuse=nil end;self:ClearObjects()end;function TOOL:SendMessage(G)if self:GetClientNumber("enablefeedback")==0 then return end;srp.notif.Neutral(self:GetOwner(),3,G)end;function TOOL:LeftClick(A)local f=self:GetToolMode()local iNum=self:NumObjects()print'Left Click'print(f,iNum)if iNum==0 then A.Entity:SetMoveType(MOVETYPE_VPHYSICS)end;local H=A.Entity:GetPhysicsObjectNum(A.PhysicsBone)local I=self:GetOwner():SteamID64()if iNum<2 then if SERVER&&!util.IsValidPhysicsObject(A.Entity,A.PhysicsBone)&&(!A.Entity:GetParent():IsValid()||!self:GetClientNumber("removal")==1||!f==9)then if!(f<4&&iNum==0)then return false end end;if A.Entity:IsPlayer()then return false end;if SERVER&&!H:IsValid()&&(!A.Entity:GetParent():IsValid()||!self:GetClientNumber("removal")==1||!f==9)then if!(f<4&&iNum==0)then return false end end end;if iNum==0 then if!A.Entity:IsValid()then return false end;if f==10 then if CLIENT then return true end;local t={}local u={}local v={}local g=self:GetClientNumber("forcelimit",0)local h=util.tobool(self:GetClientNumber("freeze",1))local i=self:GetClientNumber("nocollide")==1;GetAllEnts(A.Entity,t,u,v)v=GetAllConstraints(u)local J=table.Count(v)local K=0;for w,x in pairs(t)do x:GetPhysicsObject():EnableMotion(false)constraint.RemoveConstraints(x,"Weld")end;for L,M in pairs(v)do if M.Constraint.Type=="Weld"then K=K+1;timer.Simple(0.1,function()constraint.Weld(M.Entity[1].Entity,M.Entity[2].Entity,M.Entity[1].Bone,M.Entity[2].Bone,g,i)end)end end;if!h then local N;for w,x in pairs(t)do N=x:GetPhysicsObject()timer.Simple(0.1,function()N:EnableMotion(true)end)end end;self:SendMessage(J.." total constraints found.")self:SendMessage(K.." welds redone.")return K>0 elseif self:GetClientNumber("removal")==1&&f>3 then if CLIENT then return true end;local O=A.Entity;local P=false;if self:GetClientNumber("entirecontrap")==1 then local Q=0;local t={}local u={}local v={}GetAllEnts(O,t,u,v)for w,x in pairs(t)do if x&&x:IsValid()then if f==4 then P=constraint.RemoveConstraints(x,"Weld")elseif f==5 then P=constraint.RemoveConstraints(x,"Axis")elseif f==6 then P=constraint.RemoveConstraints(x,"Ballsocket")elseif f==7 then P=constraint.RemoveConstraints(x,"AdvBallsocket")elseif f==8 then P=constraint.RemoveConstraints(x,"Slider")elseif f==9 then P=x:GetParent():IsValid()if P then self:UndoParent(x)end end end;if P then Q=Q+1 end end;self:SendMessage(Q.." constraints removed.")else if f==4 then P=constraint.RemoveConstraints(O,"Weld")elseif f==5 then P=constraint.RemoveConstraints(O,"Axis")elseif f==6 then P=constraint.RemoveConstraints(O,"Ballsocket")elseif f==7 then P=constraint.RemoveConstraints(O,"AdvBallsocket")elseif f==8 then P=constraint.RemoveConstraints(O,"Slider")elseif f==9 then P=O:GetParent():IsValid()if P then self:UndoParent(O)end end;if P then self:SendMessage("Constraint removed.")else self:SendMessage("No constraint to remove.")end end;return P elseif self:GetClientNumber("Move")==0&&f!=3||f<3 then if f==2 then if CLIENT then return true end;local R=A.Entity:GetPos()local S=A.Entity:GetAngles()local function T(U,V,R,S)if V:IsValid()then V:SetAngles(S)V:SetPos(R)end end;if self:GetClientNumber("rotateundo")then undo.Create("Precision_Rotate")undo.SetPlayer(self:GetOwner())undo.AddFunction(T,A.Entity,R,S)undo.Finish()end;H:EnableMotion(false)local W=self:GetRotation()local X=W==0;print'start rotation'if inuse==nil||inuse==I then inuse=I;axis=A.HitNormal;axisY=axis:Cross(A.Entity:GetUp())if self:WithinABit(axisY,Vector(0,0,0))then axisY=axis:Cross(A.Entity:GetForward())end;axisZ=axisY:Cross(axis)realdegrees,realdegreesY,realdegreesZ=0,0,0;lastdegrees=X&&0||-(W/2%W)lastdegreesY,lastdegreesZ=lastdegrees,lastdegrees;OldPos=A.HitPos else axis2=A.HitNormal;axis2Y=axis2:Cross(A.Entity:GetUp())if self:WithinABit(axis2Y,Vector(0,0,0))then axis2Y=axis2:Cross(A.Entity:GetForward())end;axis2Z=A.Entity:GetUp()realdegrees2,realdegrees2Y,realdegrees2Z=0,0,0;lastdegrees2=X&&0||-(W/2%W)lastdegrees2Y,lastdegrees2Z=lastdegrees2,lastdegrees2;OldPos2=A.HitPos end;self:SetObject(iNum+2,A.Entity,A.HitPos,H,A.PhysicsBone,A.HitNormal)elseif f==1 then self:SendMessage("Current settings applied.")self:DoNoConstraint(A)return true end end end;self:SetObject(iNum+1,A.Entity,A.HitPos,H,A.PhysicsBone,A.HitNormal)if iNum>1 then self:DoConstraint()elseif iNum==1 then if self:GetEnt(1)==self:GetEnt(2)then SavedPos=self:GetPos(2)end;local Y=self:GetSnapDistance()local Z=self:GetClientNumber("move")==1&&f>2||f==3;if Z&&f<9 then if CLIENT then self:ReleaseGhostEntity()return true end;local _,a0=self:GetNormal(1),self:GetNormal(2)local e,a1=self:GetPhys(1),self:GetPhys(2)local a2,a3=_:Angle(),(a0*-1):Angle()if self:GetClientNumber("autorotate")==1 then a3.p=math.Round(a3.p/45)*45;a3.r=math.Round(a3.r/45)*45;a3.y=math.Round(a3.y/45)*45;a0=a3:Forward()*-1 end;local R=self:GetEnt(1):GetPos()local S=self:GetEnt(1):GetAngles()local function T(U,V,R,S)if V:IsValid()then V:SetAngles(S)V:SetPos(R)end end;if self:GetClientNumber("moveundo")==1 then undo.Create("Precision Move")undo.SetPlayer(self:GetOwner())undo.AddFunction(T,self:GetEnt(1),R,S)undo.Finish()end;local a4=self:GetDoRotate()local W=self:GetRotation()local X=W==0;if a4&&f!=1||f==2 then print'start rotation'if inuse==nil||inuse==I then inuse=I;axis=a0;axisY=axis:Cross(Vector(0,1,0))if self:WithinABit(axisY,Vector(0,0,0))then axisY=axis:Cross(Vector(0,0,1))end;axisY:Normalize()axisZ=axisY:Cross(axis)axisZ:Normalize()realdegrees,realdegreesY,realdegreesZ=0,0,0;lastdegrees=X&&0||-(W/2%W)lastdegreesY,lastdegreesZ=lastdegrees,lastdegrees else axis2=a0;axis2Y=axis2:Cross(Vector(0,1,0))if self:WithinABit(axis2Y,Vector(0,0,0))then axis2Y=axis2:Cross(Vector(0,0,1))end;axis2Y:Normalize()axis2Z=axis2Y:Cross(axis2)axis2Z:Normalize()realdegrees2,realdegrees2Y,realdegrees2Z=0,0,0;lastdegrees2=X&&0||-(W/2%W)lastdegrees2Y,lastdegrees2Z=lastdegrees2,lastdegrees2 end else if inuse==nil||inuse==I then inuse=I;axis=a0;axisY=axis:Cross(Vector(0,1,0))if self:WithinABit(axisY,Vector(0,0,0))then axisY=axis:Cross(Vector(0,0,1))end;axisY:Normalize()axisZ=axisY:Cross(axis)axisZ:Normalize()else axis2=a0;axis2Y=axis2:Cross(Vector(0,1,0))if self:WithinABit(axis2Y,Vector(0,0,0))then axis2Y=axis2:Cross(Vector(0,0,1))end;axis2Y:Normalize()axis2Z=axis2Y:Cross(axis2)axis2Z:Normalize()end end;local a5=e:AlignAngles(a2,a3)if self:GetClientNumber("autorotate")==1 then a5.p=math.Round(a5.p/45)*45;a5.r=math.Round(a5.r/45)*45;a5.y=math.Round(a5.y/45)*45 end;e:SetAngles(a5)local a6=Y;local a7=self:GetSnapPercent()if a7 then local c=self:GetEnt(2)local a8=c:OBBMins()local a9=c:OBBMaxs()local aa=math.abs(a9.z-a8.z)-0.5;if self:WithinABit(a0,c:GetForward())then aa=math.abs(a9.x-a8.x)-0.5 elseif self:WithinABit(a0,c:GetRight())then aa=math.abs(a9.y-a8.y)-0.5 end;a6=a6/100;a6=a6*aa end;a0=a0*(-0.0625+a6)local ab=self:GetPos(2)+e:GetPos()-self:GetPos(1)+a0;e:SetPos(ab)e:EnableMotion(false)e:Wake()end;self:ReleaseGhostEntity()local ac=self:GetDoRotate()&&f>1&&(self:GetClientNumber("move")==1&&f>2||f==3)||f==2;if ac&&f<9 then self:SetStage(iNum+1)if inuse==nil||inuse==I then inuse=I end else self:DoConstraint()end else local Z=self:GetClientNumber("move")==1&&f>2||f==3;if Z then self:StartGhostEntity(A.Entity)end;self:SetStage(iNum+1)end;return true end;function TOOL:WithinABit(ad,ae)local af=0.1;local ag=ad.x-ae.x;local ah=ad.y-ae.y;local ai=ad.z-ae.z;if ag<af&&ag>-af&&ah<af&&ah>-af&&ai<af&&ai>-af then return true else ag=ad.x+ae.x;ah=ad.y+ae.y;ai=ad.z+ae.z;if ag<af&&ag>-af&&ah<af&&ah>-af&&ai<af&&ai>-af then return true else return false end end end;function TOOL:UpdateCustomGhost(aj,ak,Y)if aj==nil then return end;if!aj:IsValid()then aj=nil;return end;local al=util.GetPlayerTrace(ak,ak:GetAimVector())local A=util.TraceLine(al)if!A.Hit then return end;local a2,a3=self:GetNormal(1):Angle(),(A.HitNormal*-1):Angle()local a5=self:GetEnt(1):AlignAngles(a2,a3)self.GhostEntity:SetPos(self:GetEnt(1):GetPos())if self:GetClientNumber("autorotate")==1 then a5.p=math.Round(a5.p/45)*45;a5.r=math.Round(a5.r/45)*45;a5.y=math.Round(a5.y/45)*45 end;self.GhostEntity:SetAngles(a5)local am=A.HitNormal;local a7=self:GetSnapPercent()local a6=Y;if a7 then local a8=A.Entity:OBBMins()local a9=A.Entity:OBBMaxs()local aa=math.abs(a9.z-a8.z)-0.5;if self:WithinABit(am,A.Entity:GetForward())then aa=math.abs(a9.x-a8.x)-0.5 elseif self:WithinABit(am,A.Entity:GetRight())then aa=math.abs(a9.y-a8.y)-0.5 end;a6=a6/100;a6=a6*aa end;local an=aj:LocalToWorld(self:GetLocalPos(1))local ab=A.HitPos+self:GetEnt(1):GetPos()-an+am*a6;self.GhostEntity:SetPos(ab)end;function TOOL:Think()if self:NumObjects()<1 then return end;local b=self:GetEnt(1)local f=self:GetToolMode()local I=self:GetOwner():SteamID64()if self:NumObjects()==1&&f!=2 then if self:GetClientNumber("move")==1&&f>2||f==3 then if f<9 then local Y=self:GetSnapDistance()self:UpdateCustomGhost(self.GhostEntity,self:GetOwner(),Y)end end else local ac=self:GetDoRotate()&&f!=1||f==2;if SERVER&&ac then local Y=self:GetSnapDistance()local e=self:GetPhys(1)local ao=self:GetOwner():GetCurrentCommand()local W=self:GetRotation()local X=W==0;local ap=ao:GetMouseX()*0.02;local aq=0;local ar=0;local C=0;if self:GetOwner():KeyDown(IN_RELOAD)then if inuse==I then realdegreesY=realdegreesY+ap;aq=realdegreesY-(X&&0||(realdegreesY+W/2)%W)ar=lastdegreesY-aq;lastdegreesY=aq;C=e:RotateAroundAxis(axisY,ar)else realdegrees2Y=realdegrees2Y+ap;aq=realdegrees2Y-(X&&0||(realdegrees2Y+W/2)%W)ar=lastdegrees2Y-aq;lastdegrees2Y=aq;C=e:RotateAroundAxis(axisY2,ar)end elseif self:GetOwner():KeyDown(IN_ATTACK2)then if inuse==I then realdegreesZ=realdegreesZ+ap;aq=realdegreesZ-(X&&0||(realdegreesZ+W/2)%W)ar=lastdegreesZ-aq;lastdegreesZ=aq;C=e:RotateAroundAxis(axisZ,ar)else realdegrees2Z=realdegrees2Z+ap;aq=realdegrees2Z-(X&&0||(realdegrees2Z+W/2)%W)ar=lastdegrees2Z-aq;lastdegrees2Z=aq;C=e:RotateAroundAxis(axisZ2,ar)end else if inuse==I then realdegrees=realdegrees+ap;aq=realdegrees-(X&&0||(realdegrees+W/2)%W)ar=lastdegrees-aq;lastdegrees=aq;C=e:RotateAroundAxis(axis,ar)else realdegrees2=realdegrees2+ap;aq=realdegrees2-(X&&0||(realdegrees2+W/2)%W)ar=lastdegrees2-aq;lastdegrees2=aq;C=e:RotateAroundAxis(axis2,ar)end end;e:SetAngles(C)if self:GetClientNumber("move")==1&&f>2||f==3 then local as=self:GetPos(2)local c=self:GetEnt(2)local a0=self:GetNormal(2)local a6=Y;local a7=self:GetSnapPercent()if a7 then local a8=c:OBBMins()local a9=c:OBBMaxs()local aa=math.abs(a9.z-a8.z)-0.5;if self:WithinABit(a0,c:GetForward())then aa=math.abs(a9.x-a8.x)-0.5 elseif self:WithinABit(a0,c:GetRight())then aa=math.abs(a9.y-a8.y)-0.5 end;a6=a6/100;a6=a6*aa end;a0=a0*(-0.0625+a6)local ab=Vector(0,0,0)if self:GetEnt(1)==self:GetEnt(2)then ab=SavedPos+e:GetPos()-self:GetPos(1)+a0 else ab=as+e:GetPos()-self:GetPos(1)+a0 end;e:SetPos(ab)else local ab=e:GetPos()-self:GetPos(1)if inuse==I then ab=ab+OldPos else ab=ab+OldPos2 end;e:SetPos(ab)end;e:Wake()end end end;function TOOL:Nudge(A,at)if!A.Entity:IsValid()||A.Entity:IsPlayer()then return false end;local e=A.Entity:GetPhysicsObjectNum(A.PhysicsBone)local Y=self:GetNudgeDistance()local a7=self:GetNudgePercent()local a6=Y;if a7 then local a8=A.Entity:OBBMins()local a9=A.Entity:OBBMaxs()local aa=math.abs(a9.z-a8.z)-0.5;if self:WithinABit(A.HitNormal,A.Entity:GetForward())then aa=math.abs(a9.x-a8.x)-0.5 elseif self:WithinABit(A.HitNormal,A.Entity:GetRight())then aa=math.abs(a9.y-a8.y)-0.5 end;a6=a6/100;a6=a6*aa end;if self:GetClientNumber("entirecontrap")==1 then local s=0;local t={}local u={}local v={}GetAllEnts(A.Entity,t,u,v)for w,x in pairs(t)do if x&&x:IsValid()then local y=x:GetPhysicsObject()if y:IsValid()then local ab=y:GetPos()+A.HitNormal*a6*at;y:SetPos(ab)y:Wake()if x:GetMoveType()==0 then x:SetPos(ab)end end end;s=s+1 end;if at==-1 then self:SendMessage(s.." items pushed.")elseif at==1 then self:SendMessage(s.." items pulled.")else self:SendMessage(s.." items nudged.")end else if self:GetClientNumber("nudgeundo")==1 then local au=e:GetPos()local function av(U,V,au)if A.Entity:IsValid()then A.Entity:SetPos(au)end end;undo.Create("Precision PushPull")undo.SetPlayer(self:GetOwner())undo.AddFunction(av,A.Entity,au)undo.Finish()end;local ab=e:GetPos()+A.HitNormal*a6*at;e:SetPos(ab)e:Wake()if A.Entity:GetMoveType()==0 then A.Entity:SetPos(ab)end;if at==-1 then self:SendMessage("target pushed.")elseif at==1 then self:SendMessage("target pulled.")else self:SendMessage("target nudged.")end end;return true end;function TOOL:RightClick(A)local ac=self:GetDoRotate()local f=self:GetToolMode()if f==2&&self:NumObjects()==1||ac&&self:NumObjects()==2 then if CLIENT then return false end else if CLIENT then return true end;return self:Nudge(A,-1)end end;function TOOL:Reload(A)local ac=self:GetDoRotate()local f=self:GetToolMode()if f==2&&self:NumObjects()==1||ac&&self:NumObjects()==2 then if CLIENT then return false end else if CLIENT then return true end;return self:Nudge(A,1)end end;if CLIENT then local aw=0;local function ax(ay)ay:ClearControls()ay:AddControl("ComboBox",{Label="#Presets",MenuButton=1,Folder="precision",Options={},CVars={[0]="precision_offset",[1]="precision_forcelimit",[2]="precision_freeze",[3]="precision_nocollide",[4]="precision_nocollideall",[5]="precision_rotation",[6]="precision_rotate",[7]="precision_torquelimit",[8]="precision_friction",[9]="precision_mode",[10]="precision_width",[11]="precision_offsetpercent",[12]="precision_removal",[13]="precision_move",[14]="precision_physdisable",[15]="precision_advballsocket",[16]="precision_XRotMin",[17]="precision_XRotMax",[18]="precision_YRotMin",[19]="precision_YRotMax",[20]="precision_ZRotMin",[21]="precision_ZRotMax",[22]="precision_XRotFric",[23]="precision_YRotFric",[24]="precision_ZRotFric",[25]="precision_FreeMov",[26]="precision_ShadowDisable",[27]="precision_allowphysgun",[28]="precision_autorotate",[29]="precision_massmode",[30]="precision_nudge",[31]="precision_nudgepercent",[32]="precision_disablesliderfix"}})ay:AddControl("Slider",{Label="Push/Pull Amount",Type="Float",Min=1,Max=100,Command="precision_nudge",Description="Distance to push/pull props with altfire/reload"}):SetDecimals(4)ay:AddControl("Checkbox",{Label="Push/Pull as Percent (%) of target's depth",Command="precision_nudgepercent",Description="Unchecked = Exact units, Checked = takes % of width from target prop when pushing/pulling"})local az=LocalPlayer():GetInfoNum("precision_user",0)local f=LocalPlayer():GetInfoNum("precision_mode",0)local aA=vgui.Create("DListView")local aa=186;if az<2 then aa=118 elseif az<3 then aa=152 end;aA:SetSize(30,aa)aA:AddColumn("Tool Mode")aA:SetMultiSelect(false)function aA:OnRowSelected(aB,aC)if!(f==aB)then RunConsoleCommand("precision_setmode",aB)end end;if f==1 then aA:AddLine(" 1 ->Apply<- (Directly apply settings to target)")else aA:AddLine(" 1   Apply   (Directly apply settings to target)")end;if f==2 then aA:AddLine(" 2 ->Rotate<- (Turn an object without moving it)")else aA:AddLine(" 2   Rotate   (Turn an object without moving it)")end;if f==3 then aA:AddLine(" 3 ->Move<- (Snap objects together - Great for building!)")else aA:AddLine(" 3   Move   (Snap objects together - Great for building!)")end;if f==4 then aA:AddLine(" 4 ->Weld<-")else aA:AddLine(" 4   Weld")end;if f==5 then aA:AddLine(" 5 ->Axis<-")else aA:AddLine(" 5   Axis")end;if f==6 then aA:AddLine(" 6 ->Ballsocket<-")else aA:AddLine(" 6   Ballsocket")end;if az>=2 then if f==7 then aA:AddLine(" 7 ->Adv Ballsocket<-")else aA:AddLine(" 7   Adv Ballsocket")end;if f==8 then aA:AddLine(" 8 ->Slider<-")else aA:AddLine(" 8   Slider")end end;if az>=3 then if f==9 then aA:AddLine(" 9 ->Parent<- (Like a solid weld, but without object collision)")else aA:AddLine(" 9   Parent   (Like a solid weld, but without object collision)")end;if f==10 then aA:AddLine("10 ->Repair<- (Re-welds - Experimental, probably useless)")else aA:AddLine("10   Repair   (Re-welds - Experimental, probably useless)")end end;aA:SortByColumn(1)ay:AddItem(aA)local aD=LocalPlayer():GetInfoNum("precision_move",1)==1&&f>2&&f<=9;local aE=(LocalPlayer():GetInfoNum("precision_rotate",1)==1||f==2)&&f<=9;if f>3&&f<=8 then ay:AddControl("Checkbox",{Label="Move Target? ('Easy' constraint mode)",Command="precision_move",Description="Uncheck this to apply the constraint without altering positions."})end;if f>2&&f<=8 then ay:AddControl("Checkbox",{Label="Rotate Target? (Rotation after moving)",Command="precision_rotate",Description="Uncheck this to remove the extra click for rotation. Handy for speed building."})ay:AddControl("Slider",{Label="Snap Distance",Type="Float",Min=0,Max=100,Command="precision_offset",Description="Distance offset between joined props.  Type in negative to inset when moving."})ay:AddControl("Checkbox",{Label="Snap distance as Percent (%) of target's depth",Command="precision_offsetpercent",Description="Unchecked = Exact units, Checked = takes % of width from second prop"})end;if f>1&&f<=8 then ay:AddControl("Slider",{Label="Rotation Snap (Degrees)",Type="Float",Min=0.02,Max=90,Command="precision_rotation",Description="Rotation rotates by this amount at a time. No more guesswork. Min: 0.02 degrees "}):SetDecimals(4)end;if f!=9 then ay:AddControl("Checkbox",{Label="Freeze Target",Command="precision_freeze",Description="Freeze props when this tool is used"})if f>2 then ay:AddControl("Checkbox",{Label="No Collide Targets",Command="precision_nocollide",Description="Nocollide pairs of props when this tool is used. Note: No current way to remove this constraint when used alone."})end end;if az>=2||f==1 then if f>2&&f<9||f==1 then ay:AddControl("Checkbox",{Label="Auto-align to world (nearest 45 degrees)",Command="precision_autorotate",Description="Rotates to the nearest world axis (similar to holding sprint and use with physgun)"})end;if f==1 then ay:AddControl("Checkbox",{Label="Disable target shadow",Command="precision_ShadowDisable",Description="Disables shadows cast from the prop"})end end;if az>=3 then if f==1 then ay:AddControl("Checkbox",{Label="Only Collide with Player",Command="precision_nocollideall",Description="Nocollides the first prop to everything and the world (except players collide with it). Warning: don't let it fall away through the world."})ay:AddControl("Checkbox",{Label="Disable Physics on object",Command="precision_physdisable",Description="Disables physics on the first prop (gravity, being shot etc won't effect it)"})ay:AddControl("Checkbox",{Label="Adv: Allow Physgun on PhysDisable objects",Command="precision_allowphysgun",Description="Disabled to stop accidents, use if you want to be able to manually move props after phyics disabling them (may break clipboxes)."})end;if f==9 then ay:AddControl("Checkbox",{Label="Adv: Allow Physgun on Parented objectss",Command="precision_allowphysgun",Description="Disabled to stop accidents, use this if you want to play with the parenting hierarchy etc."})end end;if f>=4&&f<=9 then ay:AddControl("Checkbox",{Label="Constraint Removal Mode",Command="precision_removal",Description="When enabled, attempts to undo constraints of the current mode on targeted props (Much like the reload function of other tools).  Use 'move' mode to remove nocollideall constraint."})end;if az>=2 then if f!=2 then ay:AddControl("Checkbox",{Label="Entire Contraption! (Everything connected to target)",Command="precision_entirecontrap",Description="For mass constraining or removal or nudging or applying of things. Yay generic."})end end;if az>=2 then if f>=4&&f<=7||f==10 then ay:AddControl("Slider",{Label="Force Breakpoint",Type="Float",Min=0.0,Max=50000,Command="precision_forcelimit",Description="Applies to most constraint modes"})end;if f==5||f==6||f==7 then ay:AddControl("Slider",{Label="Torque Breakpoint",Type="Float",Min=0.0,Max=50000,Command="precision_torquelimit",Description="Breakpoint of turning/rotational force"})end end;if f==5 then ay:AddControl("Slider",{Label="Axis Friction",Type="Float",Min=0.0,Max=100,Command="precision_friction",Description="Turning resistance, this is best at 0 in most cases to conserve energy"})end;if f==7 then ay:AddControl("Slider",{Label="X Rotation Minimum",Type="Float",Min=-180,Max=180,Command="precision_XRotMin",Description="Rotation minimum of advanced ballsocket in X axis"})ay:AddControl("Slider",{Label="X Rotation Maximum",Type="Float",Min=-180,Max=180,Command="precision_XRotMax",Description="Rotation maximum of advanced ballsocket in X axis"})ay:AddControl("Slider",{Label="Y Rotation Minimum",Type="Float",Min=-180,Max=180,Command="precision_YRotMin",Description="Rotation minimum of advanced ballsocket in Y axis"})ay:AddControl("Slider",{Label="Y Rotation Maximum",Type="Float",Min=-180,Max=180,Command="precision_YRotMax",Description="Rotation maximum of advanced ballsocket in Y axis"})ay:AddControl("Slider",{Label="Z Rotation Minimum",Type="Float",Min=-180,Max=180,Command="precision_ZRotMin",Description="Rotation minimum of advanced ballsocket in Z axis"})ay:AddControl("Slider",{Label="Z Rotation Maximum",Type="Float",Min=-180,Max=180,Command="precision_ZRotMax",Description="Rotation maximum of advanced ballsocket in Z axis"})ay:AddControl("Slider",{Label="X Rotation Friction",Type="Float",Min=0,Max=100,Command="precision_XRotFric",Description="Rotation friction of advanced ballsocket in X axis"})ay:AddControl("Slider",{Label="Y Rotation Friction",Type="Float",Min=0,Max=100,Command="precision_YRotFric",Description="Rotation friction of advanced ballsocket in Y axis"})ay:AddControl("Slider",{Label="Z Rotation Friction",Type="Float",Min=0,Max=100,Command="precision_ZRotFric",Description="Rotation friction of advanced ballsocket in Z axis"})ay:AddControl("Checkbox",{Label="Free Movement",Command="precision_FreeMov",Description="Only lock relative rotation, not position?"})end;if f==8 then ay:AddControl("Slider",{Label="Slider Width",Type="Float",Min=0.0,Max=10,Command="precision_width",Description="Width of the slider black line (0 = invisible)"})ay:AddControl("Checkbox",{Label="Turn Off Minor Slider Stabilisation",Command="precision_disablesliderfix",Description="Fix being seperate X/Y/Z advanced ballsocket locks between the props.  This stops most spaz caused by rotation, but not spaz caused by displacement."})ay:AddControl("Label",{Text="Stabilisation is seperate X/Y/Z adv. ballsockets; it makes it far less prone to rotation triggered spaz, but the difference is only noticible sometimes as it's still just as prone to spaz caused by drifting.",Description="Due to lack of working descriptions at time of coding"})end;if f==9 then ay:AddControl("Label",{Text="Parenting Notes:",Description="Due to lack of working descriptions at time of coding"})ay:AddControl("Label",{Text="Parenting objects is most similar to a very strong weld, but it stops most interaction on the first object when you attach it to the second.  Players can walk on it, but it will fall through players.  It will not collide with objects or the world.  It will also not cause any extra physics lag/spaz.  Try it out on a test object, and decide if it's useful to you!",Description="Due to lack of working descriptions at time of coding"})ay:AddControl("Label",{Text="Parented objects are most useful for: Adding detail to moving objects without creating extra physics lag.  Things like houses that you want to move (though you can only safely walk on parented objects when they are still.)",Description="Due to lack of working descriptions at time of coding"})ay:AddControl("Label",{Text="Possible issues:  Remove constraints first to avoid spaz. Duplicating or such may cause the collision model to become seperated.  Best to test it if in doubt.",Description="Why must labels cause menu flicker? D:"})end;if aw==1 then ay:AddControl("Button",{Label="\\/ General Tool Options \\/",Command="precision_generalmenu",Description="Collapse menu"})local aF={Label="User Level",Description="Shows options appropriate to user experience level",MenuButton="0",Height=67,Options={}}if az==1 then aF.Options[" 1 ->Normal<-"]={precision_setuser="1"}else aF.Options[" 1   Normal"]={precision_setuser="1"}end;if az==2 then aF.Options[" 2 ->Advanced<-"]={precision_setuser="2"}else aF.Options[" 2   Advanced"]={precision_setuser="2"}end;if az==3 then aF.Options[" 3 ->Experimental<-"]={precision_setuser="3"}else aF.Options[" 3   Experimental"]={precision_setuser="3"}end;ay:AddControl("ListBox",aF)ay:AddControl("Checkbox",{Label="Enable tool feedback messages?",Command="precision_enablefeedback",Description="Toggle for feedback messages incase they get annoying"})ay:AddControl("Checkbox",{Label="On = Feedback in Chat, Off = Centr Scrn",Command="precision_chatfeedback",Description="Chat too cluttered? Can have messages centre screen instead"})ay:AddControl("Checkbox",{Label="Add Push/Pull to Undo List",Command="precision_nudgeundo",Description="For if you're in danger of nudging somthing to where you can't reach it"})ay:AddControl("Checkbox",{Label="Add Movement to Undo List",Command="precision_moveundo",Description="So you don't have to secondary fire with nocollide to undo mistakes"})ay:AddControl("Checkbox",{Label="Add Rotation to Undo List",Command="precision_rotateundo",Description="So you can find the exact rotation value easier"})ay:AddControl("Button",{Label="Restore Current Mode Default",Command="precision_defaultrestore",Description="Collapse menu"})else ay:AddControl("Button",{Label="-- General Tool Options --",Command="precision_generalmenu",Description="Expand menu"})end end;local function aG()local f=LocalPlayer():GetInfoNum("precision_mode",3)if f==1 then RunConsoleCommand("precision_freeze","1")RunConsoleCommand("precision_autorotate","1")RunConsoleCommand("precision_ShadowDisable","0")RunConsoleCommand("precision_nocollideall","0")RunConsoleCommand("precision_physdisable","0")RunConsoleCommand("precision_allowphysgun","0")RunConsoleCommand("precision_entirecontrap","0")elseif f==2 then RunConsoleCommand("precision_rotation","15")RunConsoleCommand("precision_freeze","1")RunConsoleCommand("precision_entirecontrap","0")elseif f==3 then RunConsoleCommand("precision_rotate","1")RunConsoleCommand("precision_offset","0")RunConsoleCommand("precision_offsetpercent","1")RunConsoleCommand("precision_rotation","15")RunConsoleCommand("precision_freeze","1")RunConsoleCommand("precision_nocollide","1")RunConsoleCommand("precision_autorotate","1")RunConsoleCommand("precision_entirecontrap","0")elseif f==4 then RunConsoleCommand("precision_move","1")RunConsoleCommand("precision_rotate","1")RunConsoleCommand("precision_offset","0")RunConsoleCommand("precision_offsetpercent","1")RunConsoleCommand("precision_rotation","15")RunConsoleCommand("precision_freeze","1")RunConsoleCommand("precision_nocollide","1")RunConsoleCommand("precision_autorotate","0")RunConsoleCommand("precision_removal","0")RunConsoleCommand("precision_entirecontrap","0")RunConsoleCommand("precision_forcelimit","0")elseif f==5 then RunConsoleCommand("precision_move","1")RunConsoleCommand("precision_rotate","1")RunConsoleCommand("precision_offset","0")RunConsoleCommand("precision_offsetpercent","1")RunConsoleCommand("precision_rotation","15")RunConsoleCommand("precision_freeze","1")RunConsoleCommand("precision_nocollide","1")RunConsoleCommand("precision_autorotate","0")RunConsoleCommand("precision_removal","0")RunConsoleCommand("precision_entirecontrap","0")RunConsoleCommand("precision_forcelimit","0")RunConsoleCommand("precision_torquelimit","0")RunConsoleCommand("precision_friction","0")elseif f==6 then RunConsoleCommand("precision_move","1")RunConsoleCommand("precision_rotate","1")RunConsoleCommand("precision_offset","0")RunConsoleCommand("precision_offsetpercent","1")RunConsoleCommand("precision_rotation","15")RunConsoleCommand("precision_freeze","1")RunConsoleCommand("precision_nocollide","1")RunConsoleCommand("precision_autorotate","0")RunConsoleCommand("precision_removal","0")RunConsoleCommand("precision_entirecontrap","0")RunConsoleCommand("precision_forcelimit","0")RunConsoleCommand("precision_torquelimit","0")elseif f==7 then RunConsoleCommand("precision_move","0")RunConsoleCommand("precision_rotate","1")RunConsoleCommand("precision_offset","0")RunConsoleCommand("precision_offsetpercent","1")RunConsoleCommand("precision_rotation","15")RunConsoleCommand("precision_freeze","1")RunConsoleCommand("precision_nocollide","1")RunConsoleCommand("precision_autorotate","0")RunConsoleCommand("precision_removal","0")RunConsoleCommand("precision_entirecontrap","0")RunConsoleCommand("precision_forcelimit","0")RunConsoleCommand("precision_torquelimit","0")RunConsoleCommand("precision_XRotMin","0")RunConsoleCommand("precision_XRotMax","0")RunConsoleCommand("precision_YRotMin","0")RunConsoleCommand("precision_YRotMax","0")RunConsoleCommand("precision_ZRotMin","0")RunConsoleCommand("precision_ZRotMax","0")RunConsoleCommand("precision_XRotFric","0")RunConsoleCommand("precision_YRotFric","0")RunConsoleCommand("precision_ZRotFric","0")RunConsoleCommand("precision_FreeMov","1")elseif f==8 then RunConsoleCommand("precision_move","1")RunConsoleCommand("precision_rotate","1")RunConsoleCommand("precision_offset","0")RunConsoleCommand("precision_offsetpercent","1")RunConsoleCommand("precision_rotation","15")RunConsoleCommand("precision_freeze","1")RunConsoleCommand("precision_nocollide","0")RunConsoleCommand("precision_autorotate","0")RunConsoleCommand("precision_removal","0")RunConsoleCommand("precision_entirecontrap","0")RunConsoleCommand("precision_width","1")RunConsoleCommand("precision_disablesliderfix","0")elseif f==9 then RunConsoleCommand("precision_removal","0")RunConsoleCommand("precision_allowphysgun","0")RunConsoleCommand("precision_entirecontrap","0")end;precision_updatecpanel()end;concommand.Add("precision_defaultrestore",aG)local function aH()if aw==1 then aw=0 else aw=1 end;precision_updatecpanel()end;concommand.Add("precision_generalmenu",aH)function precision_setmode(ak,aI,aJ)if LocalPlayer():GetInfoNum("precision_mode",3)!=aJ[1]then RunConsoleCommand("precision_mode",aJ[1])timer.Simple(0.05,function()precision_updatecpanel()end)end end;concommand.Add("precision_setmode",precision_setmode)function precision_setuser(ak,aI,aJ)if LocalPlayer():GetInfoNum("precision_user",3)!=aJ[1]then RunConsoleCommand("precision_user",aJ[1])timer.Simple(0.05,function()precision_updatecpanel()end)end end;concommand.Add("precision_setuser",precision_setuser)function precision_updatecpanel()local ay=controlpanel.Get("precision")if!ay then return end;ax(ay)end;concommand.Add("precision_updatecpanel",precision_updatecpanel)function TOOL.BuildCPanel(ay)ax(ay)end;function TOOL:FreezeMovement()local iNum=self:GetStage()if iNum>1 then return true elseif iNum>0&&self:GetClientNumber("mode")==2 then return true end;return false end end;function TOOL:Holster()self:ClearObjects()end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/resizer.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/unbreakable.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/7seg.lua:
WireToolSetup.setCategory("Visuals/Indicators")WireToolSetup.open("7seg","7 Segment Display","gmod_wire_indicator",nil,"7 Segment Displays")TOOL.GhostAngle=Angle(90,0,0)TOOL.GhostMin="x"if CLIENT then language.Add("tool.wire_7seg.name","7-Segment Display Tool")language.Add("tool.wire_7seg.desc","Spawns 7 indicators for numeric display with the wire system.")language.Add("ToolWire7Seg_a_colour","Off Colour:")language.Add("ToolWire7Seg_b_colour","On Colour:")language.Add("ToolWire7SegTool_worldweld","Allow weld to world")language.Add("undone_wire7seg","Undone 7-Segment Display")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}WireToolSetup.setToolMenuIcon("icon16/lightbulb_add.png")end;WireToolSetup.BaseLang()TOOL.MaxLimitName="wire_indicators"TOOL.ClientConVar={model="models/segment.mdl",ar=70,ag=70,ab=70,aa=255,br=255,bg=0,bb=0,ba=255,worldweld=1}function TOOL:PostMake_SetPos()end;function TOOL:LeftClick_PostMake(a,b,c)if!istable(a)then return end;local d=self:GetClientNumber("worldweld")==1;undo.Create("Wire7Seg")for e=1,7 do local f=WireLib.Weld(a[e],c.Entity,c.PhysicsBone,true,false,d)undo.AddEntity(a[e])undo.AddEntity(f)b:AddCleanup("wire_indicators",a[e])b:AddCleanup("wire_indicators",f)end;undo.SetPlayer(b)undo.Finish()return true end;function TOOL.BuildCPanel(g)WireToolHelpers.MakePresetControl(g,"wire_7seg")g:AddControl("Color",{Label="#ToolWire7Seg_a_colour",Red="wire_7seg_ar",Green="wire_7seg_ag",Blue="wire_7seg_ab",Alpha="wire_7seg_aa",ShowAlpha="1",ShowHSV="1",ShowRGB="1",Multiplier="255"})g:AddControl("Color",{Label="#ToolWire7Seg_b_colour",Red="wire_7seg_br",Green="wire_7seg_bg",Blue="wire_7seg_bb",Alpha="wire_7seg_ba",ShowAlpha="1",ShowHSV="1",ShowRGB="1",Multiplier="255"})g:AddControl("ComboBox",{Label="#wire_model",Options={["Huge 7-seg bar"]={wire_7seg_model="models/segment2.mdl"},["Normal 7-seg bar"]={wire_7seg_model="models/segment.mdl"},["Small 7-seg bar"]={wire_7seg_model="models/segment3.mdl"}}})g:CheckBox("#ToolWire7SegTool_worldweld","wire_7seg_worldweld")end
--addons/!lpakr_out/lua/wire/stools/dual_input.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/freezer.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/fx_emitter.lua:
WireToolSetup.setCategory("Visuals")WireToolSetup.open("fx_emitter","FX Emitter","gmod_wire_fx_emitter",nil,"FX Emitters")if CLIENT then language.Add("Tool.wire_fx_emitter.name","Wire FX Emitter")language.Add("Tool.wire_fx_emitter.desc","Wire FX Emitter Emits effects eh?")language.Add("Tool.wire_fx_emitter.delay","Delay between effect pulses")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/props_lab/tpplug.mdl",Effect="sparks",Delay=0.07,weld=1,createflat=1}TOOL.GhostMin="y"function TOOL.BuildCPanel(a)a:AddControl("Header",{Text="#Tool.wire_fx_emitter.name",Description="#Tool.wire_fx_emitter.desc"})local b={Label="#Effect",Height="250",MenuButton="0",Options={}}for c,d in pairs(ComboBox_Wire_FX_Emitter_Options)do b.Options["#wire_fx_emitter_"..c]={wire_fx_emitter_Effect=c}end;a:AddControl("ListBox",b)a:NumSlider("#Tool.wire_fx_emitter.delay","wire_fx_emitter_Delay",0.05,5,2)end
--addons/!lpakr_out/lua/wire/stools/gimbal.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/latch.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/oscilloscope.lua:
WireToolSetup.setCategory("Visuals/Screens")WireToolSetup.open("oscilloscope","Oscilloscope","gmod_wire_oscilloscope",nil,"Oscilloscopes")if CLIENT then language.Add("tool.wire_oscilloscope.name","Oscilloscope Tool (Wire)")language.Add("tool.wire_oscilloscope.desc","Spawns an oscilloscope that displays line graphs.")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.NoLeftOnClass=true;TOOL.ClientConVar={model="models/props_lab/monitor01b.mdl",createflat=0}function TOOL.BuildCPanel(a)WireDermaExts.ModelSelect(a,"wire_oscilloscope_model",list.Get("WireScreenModels"),5)a:CheckBox("#Create Flat to Surface","wire_oscilloscope_createflat")end
--addons/!lpakr_out/lua/wire/stools/ranger.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/speedometer.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/textreceiver.lua:
WireToolSetup.setCategory("Input, Output/Keyboard Interaction")WireToolSetup.open("textreceiver","Text Receiver","gmod_wire_textreceiver",nil,"Text Receivers")if CLIENT then language.Add("Tool.wire_textreceiver.name","Text Receiver Tool (Wire)")language.Add("Tool.wire_textreceiver.desc","Spawns a text receiver for use with the wire system.")language.Add("Tool_wire_textreceiver_case_insensitive","Case insensitive")language.Add("Tool_wire_textreceiver_use_lua_patterns","Use Lua Patterns")language.Add("Tool_wire_textreceiver_num_matches","Number of matches to use")for a=1,24 do language.Add("Tool_wire_textreceiver_match"..a,"Match "..a..":")end;TOOL.Information={{name="left",text="Create/Update "..TOOL.Name},{name="right",text="Copy settings"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(10)TOOL.ClientConVar["case_insensitive"]=1;TOOL.ClientConVar["use_lua_patterns"]=0;TOOL.ClientConVar["num_matches"]=1;TOOL.ClientConVar["match1"]="Hello World"for a=2,24 do TOOL.ClientConVar["match"..a]=""end;TOOL.ClientConVar["model"]="models/jaanus/wiretool/wiretool_range.mdl"function TOOL:RightClick(b)if b.Entity&&b.Entity:IsValid()&&b.Entity:GetClass()=="gmod_wire_textreceiver"then if CLIENT then return true end;local c=b.Entity.UseLuaPatterns;local d=b.Entity.Matches;local e=b.Entity.CaseInsensitive;local f=self:GetOwner()f:ConCommand("wire_textreceiver_use_lua_patterns "..(c&&1||0))f:ConCommand("wire_textreceiver_case_insensitive "..(e&&1||0))for a=1,24 do local g=d[a]if g!=nil then f:ConCommand("wire_textreceiver_match"..a.." "..g)end end;f:ChatPrint("Text receiver settings copied.")else return false end end;if CLIENT then function TOOL.BuildCPanel(h)ModelPlug_AddToCPanel(h,"Misc_Tools","wire_textreceiver")h:CheckBox("#Tool_wire_textreceiver_case_insensitive","wire_textreceiver_case_insensitive")h:CheckBox("#Tool_wire_textreceiver_use_lua_patterns","wire_textreceiver_use_lua_patterns")local i=h:NumSlider("#Tool_wire_textreceiver_num_matches","wire_textreceiver_num_matches",0,24,0)local j=vgui.Create("DPanelList")j:SetTall(300)j:EnableVerticalScrollbar(true)local function k(l)local l=math.Clamp(math.Round(l)||GetConVarNumber("wire_textreceiver_num_matches"),0,24)j:Clear()for a=1,l do local m=vgui.Create("DPanel")local n=vgui.Create("DLabel",m)n:SetText("Match "..a..":")n:SetPos(2,2)n:SetDark(true)n:SizeToContents()local o=vgui.Create("DTextEntry",m)o:SetText(GetConVarString("wire_textreceiver_match"..a))o:SetPos(50,2)o:SetWide(220)o:SetConVar("wire_textreceiver_match"..a)j:AddItem(m)end end;function i:OnValueChanged(p)k(tonumber(p))end;h:AddItem(j)end end
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/wire_namer.lua:
TOOL.Category="Tools"TOOL.Name="Namer"TOOL.Command=nil;TOOL.ConfigName=""TOOL.Tab="Wire"if CLIENT then language.Add("Tool.wire_namer.name","Naming Tool")language.Add("Tool.wire_namer.desc","Names components.")language.Add("Tool.wire_namer.left","Set name")language.Add("Tool.wire_namer.right","Copy name")language.Add("WireNamerTool_name","Name:")TOOL.Information={"left","right"}end;TOOL.ClientConVar["name"]=""local function a(Player,b,c)if c&&c.name then b:SetNWString("WireName",c.name)duplicator.StoreEntityModifier(b,"WireName",c)end end;duplicator.RegisterEntityModifier("WireName",a)function TOOL:LeftClick(d)if!d.Entity:IsValid()then return end;if CLIENT then return end;if!d.Entity.IsWire then return end;local e=self:GetClientInfo("name")a(Player,d.Entity,{name=e})return true end;function TOOL:RightClick(d)if!d.Entity:IsValid()then return end;if CLIENT then return end;local e=d.Entity:GetNWString("WireName")if!e then return end;self:GetOwner():ConCommand('wire_namer_name "'..e..'"')end;function TOOL.BuildCPanel(f)f:AddControl("Header",{Text="#Tool.wire_namer.name",Description="#Tool.wire_namer.desc"})f:AddControl("TextBox",{Label="#WireNamerTool_name",Command="wire_namer_name",MaxLength="20"})end
--addons/!lpakr_out/lua/weapons/sup_beck.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_bo.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_bowcaster_land.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_cr5k.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dc15sa.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.AimPos=Vector(-3.33,0,1.8)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-11,-5)SWEP.SprintAng=Vector(50,0,2)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;sound.Add({name='blaster.dc15sa_fire',channel=CHAN_WEAPON,volume=.35,level=90,pitch={95,105},sound='weapons/dc15sa_fire.wav'})SWEP.PrintName='DC-15 Side Arm'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(15,-2.3,-2.5)SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='pistol'SWEP.RunHoldType='normal'SWEP.FireModes={'semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=2;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc15sa.mdl'SWEP.WorldModel='models/weapons/w_dc15sa.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=false;SWEP.FireDelay=.25;SWEP.FireSound=Sound'blaster.dc15sa_fire'SWEP.ReloadSound=Sound'blaster.reload_pistol'SWEP.Recoil=2;SWEP.RecoilAngle=Angle(-2,0,0)SWEP.HipSpread=0.02;SWEP.AimSpread=0.01;SWEP.VelocitySensitivity=1;SWEP.MaxSpreadInc=0;SWEP.SpreadPerShot=0;SWEP.SpreadCooldown=0;SWEP.Shots=1;SWEP.Damage=40;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,0,0)
--addons/!lpakr_out/lua/weapons/sup_dc17m_gl.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.AimPos=Vector(0,-1,0)SWEP.AimAng=Vector(0,0,0)SWEP.RestPos=Vector(0,-.5,.5)SWEP.SprintPos=Vector(5,-3,1)SWEP.SprintAng=Vector(-15,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;SWEP.UIPosition=Vector(0,0,0)SWEP.UIAngle=Angle(0,90,0)game.AddAmmoType({name='ammo_gl',dmgtype=DMG_BLAST,tracer=TRACER_LINE_AND_WHIZ,plydmg=0,npcdmg=0,force=1,minsplash=0,maxsplash=0})SWEP.PrintName='DC-17m Launcher'SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=4;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(16,-1.5,-4)SWEP.FadeCrosshairOnAim=false;SWEP.PlayBackRate=1;SWEP.PlayBackRateSV=1;SWEP.BulletDiameter=5;SWEP.CaseLength=10;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='crossbow'SWEP.RunHoldType='passive'SWEP.FireModes={'auto','semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc17m.mdl'SWEP.WorldModel='models/weapons/w_dc17m_at.mdl'SWEP.Bodygroups='020'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.AmmoOffset=Vector(20,0,-2)SWEP.Primary.ClipSize=1;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=3;SWEP.FireSound=Sound'weapons/ar2/ar2_altfire.wav'SWEP.ReloadSound=Sound'blaster.reload_dc17m'SWEP.Recoil=3;SWEP.RecoilAngle=Angle(-3,0,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.ProjectileVeloctiy=3000;SWEP.Projectile=nil;SWEP.Primary.Ammo='ammo_gl'SWEP.ShotgunReload=false;SWEP.ReloadStartWait=0.6;SWEP.ReloadFinishWait=1.1;SWEP.ReloadShellInsertWait=0.6;SWEP.Chamberable=false;SWEP.HipSpread=0;SWEP.AimSpread=0;SWEP.VelocitySensitivity=2.2;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.02;SWEP.SpreadCooldown=1.03;SWEP.Shots=8;SWEP.Damage=550;SWEP.DeployTime=2;SWEP.ShowHands=true;SWEP.IsGrenadeLauncher=true;function SWEP:CreateFragGrenade(a,b,c)local d=ents.Create('rp_grenade_gl')d.class=self:GetClass()d.Damage=d.Damage||self.Damage||200;d.Range=d.Range||self.Range||175;d:SetOwner(c)d:SetPos(a)d:Spawn()if c:IsPlayer()then b=b+b*c:GetTalentPassive('GrenadeThrow')end;local e=d:GetPhysicsObject()if IsValid(e)then e:SetVelocity(b)end end;function SWEP:ThrowGrenade(c)local f=c:EyePos()local g=c:EyeAngles()local h=g:Forward()h.z=h.z+0.01;local i=g:Right()local a=f+h*18+i*8;local b=c:GetVelocity()b=b+h*3000;self:CreateFragGrenade(a,b,c)end;function SWEP:DoCustomFire(j,k,l)return true end;function SWEP:DoImpactEffect(m,n)end
--addons/!lpakr_out/lua/weapons/sup_ddc_dual.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_de10_dual.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dlt20a.lua:
print'sup_dlt20a'AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,-7,0.5)SWEP.AimPos=Vector(0,-5,0.5)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-4,0)SWEP.SprintAng=Vector(-35,30,-20)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;SWEP.PrintName='DLT 20a'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.Akimbo=true;SWEP.AmmoOffset=Vector(30,-2,-5)SWEP.AmmoOffsetAng=Angle(0,-90,90)SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.SprintingEnabled=false;SWEP.NormalHoldType='duel'SWEP.RunHoldType='normal'SWEP.FireModes={'semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=2;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/weapons/synbf3/c_dlt20a.mdl'SWEP.WorldModel='models/weapons/synbf3/w_dlt20a.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=100;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.2;SWEP.FireSound=Sound'blaster.fire'SWEP.RecoilAngle=Angle(-1.2,0,0)SWEP.HipSpread=0.03;SWEP.AimSpread=0.015;SWEP.VelocitySensitivity=10;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.007;SWEP.SpreadCooldown=0.13;SWEP.Shots=1;SWEP.Damage=44;SWEP.DeployTime=1;SWEP.FadeCrosshairOnAim=false;SWEP.UIPosition=Vector(-5,-40,0)SWEP.UIAngle=Angle(0,90,0)SWEP.ShowHands=false
--addons/!lpakr_out/lua/weapons/sup_ee3.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_ee3_jay.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,-7.5,-1)SWEP.AimPos=Vector(-5.15,-5,0.5)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-4,0)SWEP.SprintAng=Vector(-35,30,-20)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='Assassins Bow'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=1;SWEP.ViewbobEnabled=true;SWEP.Akimbo=true;SWEP.AmmoOffset=Vector(30,-2,-5)SWEP.AmmoOffsetAng=Angle(0,-90,90)SWEP.PlayBackRate=2;SWEP.PlayBackRateSV=2;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.SprintingEnabled=true;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'3burst'}SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/cac/weapons/v_assasinbowcaster.mdl'SWEP.WorldModel='models/cac/weapons/w_assasinbowcaster.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=72;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.06;SWEP.FireSound=Sound'blaster.jay_fire'SWEP.Recoil=.5;SWEP.RecoilAngle=Angle(-1.3,-.25,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.SpreadOnAim=true;SWEP.HipSpread=.02;SWEP.AimSpread=.002;SWEP.VelocitySensitivity=1.2;SWEP.MaxSpreadInc=0.15;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=43;SWEP.DeployTime=1;SWEP.FadeCrosshairOnAim=false;SWEP.UIPosition=Vector(-5,-40,0)SWEP.UIAngle=Angle(0,90,0)SWEP.ShowHands=false;SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'sound.Add({name='blaster.jay_fire',channel=CHAN_WEAPON,volume=.35,level=90,pitch={100,105},sound='galactic/weapons/jay/ee3_fire.wav'})
--addons/!lpakr_out/lua/weapons/sup_emplauncher.lua:
debug.Trace()
--addons/!lpakr_out/lua/weapons/sup_gaz.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_grenade_health.lua:
AddCSLuaFile()SWEP.Base='weapon_grenadebase'SWEP.PrintName='Pulse Health Grenade'SWEP.Author='Scott'SWEP.Purpose='It\'s a HP grenade'SWEP.Spawnable=true;SWEP.Category='SUP Weapons'SWEP.HoldType='grenade'SWEP.GrenadeEnt='rp_grenade_health'SWEP.Damage=50;SWEP.Range=360000;SWEP.Impact=false
--addons/!lpakr_out/lua/weapons/sup_grenade_smoke.lua:
AddCSLuaFile()SWEP.Base='weapon_grenadebase'SWEP.PrintName='Smoke Grenade'SWEP.Author='Scott'SWEP.Purpose='It\'s a smoke grenade'SWEP.Spawnable=true;SWEP.Category='SUP Weapons'SWEP.HoldType='grenade'SWEP.GrenadeEnt='rp_grenade_smoke'SWEP.SelectedColor=1;SWEP.Colors={{'Red',col.red},{'Green',col.green},{'Blue',col.blue},{'Yellow',col.yellow},{'White',col.white}}
--addons/!lpakr_out/lua/weapons/sup_hei.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_hz12.lua:
debug.Trace()
--addons/!lpakr_out/lua/weapons/sup_nt242.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.PrintName='NT-242'SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(0,-1,0)SWEP.AimPos=Vector(-4.61,-5,-1.25)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,-10,-1)SWEP.SprintAng=Vector(-15,40,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.SkinSlotId=1;SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=true;SWEP.ZoomAmount=5;SWEP.AdjustableZoom=true;SWEP.MinZoom=15;SWEP.MaxZoom=45;SWEP.ZoomSteps=2;SWEP.ScopeOverrideMaterialIndex=5;SWEP.ScopeFOV=10;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=false;SWEP.ScopedBlur=false;SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(20,-1,-3)SWEP.PlayBackRate=3;SWEP.PlayBackRateSV=3;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.CanPenetrate=true;SWEP.HasScope=true;SWEP.FadeCrosshairOnAim=true;SWEP.PreventQuickScoping=true;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'bolt'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/bf/v_nt242_longblaster.mdl'SWEP.WorldModel='models/galactic/weapons/bf/w_nt242_longblaster.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=false;SWEP.Primary.ClipSize=10;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=false;SWEP.FireDelay=.3;SWEP.FireSound=Sound'blaster.fire_sniper'SWEP.Recoil=3;SWEP.RecoilAngle=Angle(-3,0,0)SWEP.HipDivRecoil=Vector(.045,.05,.05)SWEP.RecoilSpeed=12;SWEP.HipSpread=0.08;SWEP.AimSpread=0;SWEP.VelocitySensitivity=0;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.007;SWEP.SpreadCooldown=0.13;SWEP.Shots=1;SWEP.Damage=70;SWEP.DeployTime=3.5;SWEP.ShowHands=true;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,90,0)function SWEP:AdjustMouseSensitivity()if self.dt.State==SWB_AIMING then local a=math.Clamp(cvar.GetValue('weapon_aimsense_sniper')||1,0,1)return a>0&&a||.7 end end
--addons/!lpakr_out/lua/weapons/sup_remotesatchel/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_remotesatchel/cl_init.lua:
include'shared.lua'local a,b=250,50;local c=Color(0,0,0,175)local d=Color(150,150,150,200)function SWEP:DrawHUD()local e,f=ScrW(),ScrH()local g=self:GetFrequency()local h,i=(e-a)/2,f-b-70;draw.Box(h,i,a,b,c)surface.SetDrawColor(d)surface.DrawOutlinedRect(h,i,a,b,1)draw.SimpleText('Channel','ui_label.l',h+10,i+b/2-3,col.white,TEXT_ALIGN_BOTTOM,TEXT_ALIGN_CENTER)draw.SimpleText(g||0,'ui_label.xl',h+a-10,i+b/2,col.white,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)draw.SimpleText('Hold R to change channel.','ui_label.s',h+10,i+b/2+3,col.white,TEXT_ALIGN_LEFT,TEXT_ALIGN_top)end
--addons/!lpakr_out/lua/weapons/sup_storyz.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swb_base/sh_projectile.lua:
function SWEP:FireProjectile(a)if CLIENT then return end;local b=self:GetOwner()local c=ents.Create(self.Projectile)local d=b:EyeAngles()c:SetAngles(d)c:SetPos(b:EyePos()+d:Forward()*15)c:SetOwner(b)if c.SetupWeapon then c:SetupWeapon(self)end;c:Spawn()if c.SetSpeed then c:SetSpeed(self.ProjectileVeloctiy)end end
--addons/!lpakr_out/lua/weapons/swb_base/sh_sounds.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swb_base/sh_cosmetics.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swb_base/cl_model.lua:
local a=CreateClientConVar("viewmodel_flip",0,true,false,"Flips all weapons view model. USE AT YOUR OWN RISK.",0,1)local b=CreateClientConVar("viewmodel_offset_x",0,true,false,"Adjust all weapons X position. USE AT YOUR OWN RISK.",-10,10)local c=CreateClientConVar("viewmodel_offset_y",0,true,false,"Adjust all weapons Y position. USE AT YOUR OWN RISK.",-10,10)local d=CreateClientConVar("viewmodel_offset_z",0,true,false,"Adjust all weapons Z position. USE AT YOUR OWN RISK.",-10,10)local e={}cvars.AddChangeCallback('viewmodel_flip',function(f,g,h)e={}end,'scopeMaterialsReset')SWEP.BlendPos=Vector(0,0,0)SWEP.BlendAng=Vector(0,0,0)SWEP.OldDelta=Angle(0,0,0)SWEP.AngleDelta=Angle(0,0,0)SWEP.FireMove=0;SWEP.ViewModelMovementScale=1;SWEP.Sequence=""SWEP.Cycle=0;SWEP.NoStockShells=true;SWEP.NoStockMuzzle=true;local i=Vector(0,0,0)local j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;local A={}local B=debug.getregistry()local C=B.Entity.GetVelocity;local D=B.Vector.Length;local E=B.Angle.Right;local F=B.Angle.Up;local G=B.Angle.Forward;local H=B.Angle.RotateAroundAxis;local I;function SWEP:GetTracerOrigin()if self.dt.State==SWB_AIMING&&self.SimulateCenterMuzzle then return self.CenterPos end end;function SWEP:CreateShell(J)local K=self:GetOwner()if!IsValid(K)||K:IsNPC()||K:ShouldDrawLocalPlayer()||self.NoShells then return end;J=self.Shell||J;v=K:GetViewModel()if!IsValid(v)then return end;z=v:GetAttachment(2)if z then if self.InvertShellEjectAngle then dir=-z.Ang:Forward()else dir=z.Ang:Forward()end;SWB_MakeFakeShell(J,z.Pos+dir,EyeAngles(),dir*200,0.6,10,self.ShellScale)end end;function SWEP:CreateMuzzle(L,M)local K=self:GetOwner()if K:ShouldDrawLocalPlayer()then return end;v=K:GetViewModel()if IsValid(v)then v:StopParticles()w=v:LookupAttachment("1")if w then x=v:GetAttachment(w)if x then r=EyeAngles()if self.MuzzlePosMod then L=L+r:Right()*self.MuzzlePosMod.x+r:Forward()*self.MuzzlePosMod.y+r:Up()*self.MuzzlePosMod.z end;if self.dt.State==SWB_AIMING&&self.SimulateCenterMuzzle then L=K:GetShootPos()+r:Forward()*15-r:Up()*6;self.CenterPos=L end;if self.dt.Suppressed then if self.MuzzleEffectSupp then if!self.NoSilMuz then if self.dt.State==SWB_AIMING&&self.SimulateCenterMuzzle then ParticleEffect(self.MuzzleEffectSupp,L+K:GetVelocity()*0.03,r,v)else if self.PosBasedMuz then ParticleEffect(self.MuzzleEffectSupp,L+K:GetVelocity()*0.03,r,v)else ParticleEffectAttach(self.MuzzleEffectSupp,PATTACH_POINT_FOLLOW,v,w)end end end end else if self.MuzzleEffect then if self.dt.State==SWB_AIMING&&self.SimulateCenterMuzzle then ParticleEffect(self.MuzzleEffect,L+K:GetVelocity()*0.03,r,v)else if self.PosBasedMuz then ParticleEffect(self.MuzzleEffect,L+K:GetVelocity()*0.03,r,v)else ParticleEffectAttach(self.MuzzleEffect,PATTACH_POINT_FOLLOW,v,w)end end end;dlight=DynamicLight(self:EntIndex())dlight.r=255;dlight.g=218;dlight.b=74;dlight.Brightness=4;dlight.Pos=L+K:GetAimVector()*3;dlight.Size=96;dlight.Decay=128;dlight.DieTime=CurTime()+FrameTime()end end end end end;SWBShells={}SWBShells["mainshell"]={m="models/weapons/rifleshell.mdl",s={"player/pl_shell1.wav","player/pl_shell2.wav","player/pl_shell3.wav"}}SWBShells["shotshell"]={m="models/weapons/Shotgun_shell.mdl",s={"weapons/fx/tink/shotgun_shell1.wav","weapons/fx/tink/shotgun_shell2.wav","weapons/fx/tink/shotgun_shell3.wav"}}SWBShells["smallshell"]={m="models/weapons/shell.mdl",s={"player/pl_shell1.wav","player/pl_shell2.wav","player/pl_shell3.wav"}}function SWB_MakeFakeShell(N,L,M,vel,O,P,Q)if!N||!L||!M then return end;local R=SWBShells[N]if!R then return end;vel=vel||Vector(0,0,-100)vel=vel+VectorRand()*5;O=O||0.5;P=P||5;Q=Q||1;local S=ClientsideModel(R.m,RENDERGROUP_BOTH)S:SetPos(L)S:PhysicsInitBox(Vector(-0.5,-0.15,-0.5),Vector(0.5,0.15,0.5))S:SetAngles(M)S:SetModelScale(Q,0)S:SetMoveType(MOVETYPE_VPHYSICS)S:SetSolid(SOLID_VPHYSICS)S:SetCollisionGroup(COLLISION_GROUP_DEBRIS)local T=S:GetPhysicsObject()T:SetMaterial("gmod_silent")T:SetMass(10)T:SetVelocity(vel)timer.Simple(O,function()if IsValid(S)&&R.s then S:EmitSound(table.Random(R.s),35,100)end end)SafeRemoveEntityDelayed(S,P)end;function SWEP:FireAnimationEvent(L,M,U,V)if U==5001 then if self.MuzzleEffect then self:CreateMuzzle(L,M)end;if self.NoStockMuzzle then return true end;return self.dt.Suppressed end;if U==20 then if self.Shell then self:CreateShell()end;return self.NoStockShells end end;surface.CreateFont('ui.40',{font='roboto',size=40,weight=500})SWEP.ApproachSpeed=18;local W=game.SinglePlayer()local X,Y=Vector(0,0,0),Vector(0,0,0)local Z,_=Vector(0,0,0),Vector(0,0,0)local a0={pitch=0,yaw=0,roll=0}local a1=0;local a2;local a3=GetRenderTarget("swb_scope_texture",ScrW(),ScrH(),false)function SWEP:PostDrawViewModel(v)v:SetSubMaterial()self:RenderScope()end;function SWEP:PreDrawViewModel(v,a4,a5)CT=UnPredictedCurTime()if self.Bodygroups then v:SetBodyGroups(self.Bodygroups)end;if self.SubMaterials then for a6,a7 in pairs(self.SubMaterials)do v:SetSubMaterial(a6,a7)end end;local a8=(self.dt.State==SWB_AIMING||IsValid(self.ScopeEntity))&&self.ScopeOverrideMaterialIndex&&!self.OpticZone;if a8 then local a9=e[self.ClassName]if!a9 then local aa=IsValid(self.ScopeEntity)&&self.ScopeEntity||self;local ab=Material(aa:GetMaterials()[self.ScopeOverrideMaterialIndex+1]):GetTexture("$basetexture")local ac,ad=self.ScopeFlipX&&-1||1,self.ScopeFlipY&&-1||1;local ae=ab:GetMappingWidth()/ScrW()local af=ab:GetMappingHeight()/ScrH()if ae>af then ad=ad*ae/af else ac=ac*af/ae end;e[self.ClassName]=CreateMaterial("swb_scope_material_"..self:GetClass(),"UnlitGeneric",{["$basetexture"]=a3:GetName(),["$vertexcolor"]=0,["$vertexalpha"]=0,["$nolod"]=1,["$model"]=1,["$basetexturetransform"]=string.format("center 0.5 0.5 scale %f %f rotate %f translate %f %f",1/ac,1/ad,self.ScopeRotate||0,self.TranslateX||0,self.TranslateY||0)})a9=e[self.ClassName]end;if IsValid(self.ScopeEntity)then self.ScopeEntity:SetSubMaterial(self.ScopeOverrideMaterialIndex,"!"..a9:GetName())else v:SetSubMaterial(self.ScopeOverrideMaterialIndex,"!"..a9:GetName())end end;local K=self:GetOwner()v=K:GetViewModel()self.Sequence=v:GetSequenceName(v:GetSequence())self.IsReloading=self.Sequence:find("reload")if!self.IsReloading then self.IsReloading=self.Sequence:find("insert")if!self.IsReloading then self.IsFiddlingWithSuppressor=self.Sequence:find("silencer")end end;self.Cycle=v:GetCycle()r=EyeAngles()FT=FrameTime()s=Angle(r.p,r.y,0)-self.OldDelta;s.p=math.Clamp(s.p,-10,10)self.OldDelta=Angle(r.p,r.y,0)self.AngleDelta=LerpAngle(math.Clamp(FT*10,0,1),self.AngleDelta,s)self.AngleDelta.y=math.Clamp(self.AngleDelta.y,-10,10)vel=C(K)len=D(vel)o=K:GetWalkSpeed()local ag,ah=self.RestPos||i,self.RestAng||i;X,Y=ag*1,ah*1;a1=1;a0.roll=math.Clamp(vel:DotProduct(r:Right())*0.04*len/o,-5,5)if self.dt.State==SWB_AIMING then a1=0.2;j,k=self.AimPos*1,self.AimAng*1;aiming=true;self.ApproachSpeed=math.Approach(self.ApproachSpeed,self.AimSpeed||18,FT*100)elseif self.dt.State==SWB_ACTION then j,k=self.SwimPos*1,self.SwimAng*1;self.ApproachSpeed=math.Approach(self.ApproachSpeed,5,FT*100)elseif self.dt.State==SWB_RUNNING||(len>o*1.2&&K:KeyDown(IN_SPEED)||len>o*3||self.ForceRunStateVelocity&&len>self.ForceRunStateVelocity)&&K:OnGround()then if self.IsReloading&&self.Cycle<0.9 then j,k=ag*1,Y*1 else if self.SprintingEnabled then j,k=self.SprintPos*1,self.SprintAng*1 else j,k=ag*1,Y*1 end end;p=K:GetRunSpeed()q=7+math.Clamp(p/100,0,6)u=math.Clamp(len/p,0,1)m=math.sin(CT*q)*u;l=math.cos(CT*q)*u;tan1=math.tan(m*l)*u;if(self.IsReloading||self.IsFiddlingWithSuppressor)&&self.Cycle<=0.9 then Y.x=Y.x+tan1*0.2*self.ViewModelMovementScale*u;Y.y=Y.y-l*1.5*self.ViewModelMovementScale*u;Y.z=Y.z+l*3*self.ViewModelMovementScale*u;X.x=X.x-m*1.2*self.ViewModelMovementScale*u;X.y=X.y+tan1*3*self.ViewModelMovementScale*u;X.z=X.z+tan1*1.5*self.ViewModelMovementScale*u;self.ApproachSpeed=math.Approach(self.ApproachSpeed,4,FT*100)else Y.x=Y.x+tan1*0.2*self.ViewModelMovementScale*u;Y.y=Y.y-l*1.5*self.ViewModelMovementScale*u;Y.z=Y.z+l*3*self.ViewModelMovementScale*u;X.x=X.x-m*1.2*self.ViewModelMovementScale*u;X.y=X.y+tan1*3*self.ViewModelMovementScale*u;X.z=X.z+tan1*1.5*self.ViewModelMovementScale*u;self.ApproachSpeed=math.Approach(self.ApproachSpeed,6,FT*100)end else if self.dt.Safe then j,k=self.SprintPos*1,self.SprintAng*1 else j,k=ag*1,Y*1 end;self.ApproachSpeed=math.Approach(self.ApproachSpeed,10,FT*100)A.start=K:GetShootPos()A.endpos=A.start+K:EyeAngles():Forward()*30;A.filter=K;y=util.TraceLine(A)if y.Hit then self.NearWall=true;j.y=j.y-math.Clamp(30*(1-y.Fraction),0,15)end end;if len<10||!K:OnGround()then if self.dt.State!=SWB_AIMING then l,m=math.cos(CT),math.sin(CT)n=math.atan(l*m,l*m)Y.x=Y.x+n*1.15;Y.y=Y.y+l*0.4;Y.z=Y.z+n;X.y=X.y+n*0.2*a1 end elseif len>10&&len<o*1.2 then q=6+o/130;u=math.Clamp(len/o,0,1)m=math.sin(CT*q)*u;l=math.cos(CT*q)*u;tan1=math.tan(m*l)*u;Y.x=Y.x+tan1*self.ViewModelMovementScale*a1;Y.y=Y.y-l*self.ViewModelMovementScale*a1;Y.z=Y.z+l*self.ViewModelMovementScale*a1;X.x=X.x-m*0.4*self.ViewModelMovementScale*a1;X.y=X.y+tan1*1*self.ViewModelMovementScale*a1;X.z=X.z+tan1*0.5*self.ViewModelMovementScale*a1 end;FT=FrameTime()k.z=k.z+a0.roll;self.BlendPos=LerpVector(FT*self.ApproachSpeed,self.BlendPos,j)self.BlendAng=LerpVector(FT*self.ApproachSpeed,self.BlendAng,k)Z=LerpVector(FT*10,Z,X)_=LerpVector(FT*10,_,Y)self.FireMove=Lerp(FT*15,self.FireMove,0)end;function SWEP:DrawOpticZone()if!IsValid(self.ScopeEntity)then return end;local ai=self.OpticZone;if!ai.Draw then return end;local L=self.ScopeEntity:LocalToWorld(ai.Pos)local M=self.ScopeEntity:LocalToWorldAngles(ai.Ang)cam.Start3D2D(L,M,.015)ai.Draw(self.ScopeEntity.attachment,self,L,M)cam.End3D2D()end;function SWEP:RenderScope()if!self.HasScope then return end;if self.OpticZone then self:DrawOpticZone()return end;local a8=self.dt.State==SWB_AIMING&&self.HasScope||IsValid(self.ScopeEntity)&&self.ScopeOverrideMaterialIndex;if a8 then local aj=self.AimAng;local ak,al=self:GetViewModelPosition(vector_origin*1,angle_zero*1)local am=math.Clamp((self.AimTime-CurTime())/0.25,0,1)local L=EyePos()local M=EyeAngles()+Angle(aj.x,aj.y,aj.z)-al;local an,ao,ap,aq=0,0,ScrW(),ScrH()M.r=-M.r;render.PushRenderTarget(a3)render.Clear(0,0,0,255,true,true)render.RenderView{origin=L,angles=M,drawviewmodel=false,fov=self.AdjustableZoom&&(self.ScopeZoomAmount||self.MaxZoom)||self.ScopeFOV||LocalPlayer():GetFOV(),x=an,y=ao,w=ap,h=aq}cam.Start2D()surface.SetDrawColor(0,0,0,255*am)surface.DrawRect(0,0,ap,aq)if self.ScopeTexture then surface.SetDrawColor(255,255,255,255)surface.SetMaterial(self.ScopeTexture)surface.DrawTexturedRect(self.ScopeTextureX||0,self.ScopeTextureY||0,ap,aq)elseif self.DrawScope then self:DrawScope(ap,aq)else surface.SetDrawColor(0,0,0,255)surface.DrawRect(0,aq/2-3,ap,7)surface.DrawRect(ap/2-3,0,7,aq)end;if self.AdjustableZoom then local ao=aq*0.5-self.ZoomSteps*0.5*50;surface.SetFont('ui.40')for ar=self.ZoomSteps,1,-1 do local as=ar-1;if self._ZoomStep&&as==self._ZoomStep then surface.SetDrawColor(25,25,150,255)surface.SetTextColor(255,255,100,255)else surface.SetDrawColor(15,15,15,50)surface.SetTextColor(200,200,200,255)end;local an,ao=ap*0.5+aq*0.275,ao+(self.ZoomSteps-as-1)*52;surface.DrawRect(an,ao,50,50)surface.SetTextPos(an+5,ao+4)surface.DrawText(ar..'x')end;surface.SetTextColor(255,255,255,255)if self.DisplayRangeFinder then surface.SetFont'ui_header.l'local y=LocalPlayer():GetEyeTrace()local L=LocalPlayer():GetPos()if IsValid(y.Entity)&&isplayer(y.Entity)then local at=y.Entity:Name()..' - '..math.ceil(y.Entity:GetPos():Distance(L)/25)..'m'local ap,aq=surface.GetTextSize(at)surface.SetTextPos(ap*0.5-ap*0.5,aq*0.75)surface.DrawText(at)else local at=math.ceil(y.HitPos:Distance(L)/25)..'m'local ap,aq=surface.GetTextSize(at)surface.SetTextPos(ap*0.5-ap*0.5,aq*0.75)surface.DrawText(at)end end end;cam.End2D()render.PopRenderTarget()end end;local au=Vector()function SWEP:GetViewModelPosition(L,M)CT=UnPredictedCurTime()local av=self.dt.State==SWB_AIMING&&self.HasScope;if self.InstantDissapearOnAim&&self.dt.State==SWB_AIMING then self.ViewModelFOV=90;L=L-M:Forward()*100;return L,M end;if self.MoveWepAwayWhenAiming&&CT>self.AimTime&&self.dt.State==SWB_AIMING then self.ViewModelFOV=90;L=L-M:Forward()*100;return L,M end;self.ViewModelFOV=self.ViewModelFOV_Orig;H(M,E(M),_.x+self.BlendAng.x+self.AngleDelta.p*a1)if a:GetBool()then self.ViewModelFlip=!self.ViewModelFlip_Orig else self.ViewModelFlip=self.ViewModelFlip_Orig end;if!self.ViewModelFlip then H(M,F(M),_.y+self.BlendAng.y+self.AngleDelta.y*0.3*a1)H(M,G(M),_.z+self.BlendAng.z+self.AngleDelta.y*0.3*a1)else H(M,F(M),_.y+self.BlendAng.y-self.AngleDelta.y*0.3*a1)H(M,G(M),_.z-self.BlendAng.z-self.AngleDelta.y*0.3*a1)end;if!self.ViewModelFlip then L=L+(Z.x+self.BlendPos.x+self.AngleDelta.y*0.1*a1)*E(M)else L=L+(Z.x+self.BlendPos.x-self.AngleDelta.y*0.1*a1)*E(M)end;L=L+(Z.y+self.BlendPos.y-self.FireMove)*G(M)L=L+(Z.z+self.BlendPos.z-self.AngleDelta.p*0.1)*F(M)local aw,ax,ay=b:GetFloat(),c:GetFloat(),d:GetFloat()au.x=aw;au.y=ax;au.z=ay;au:Rotate(M)return L+au,M end;local az,L,M;function SWEP:DrawWorldModel()if self.NPCOwned then self:DrawModel()return end;if self.dt.Safe then if self.CHoldType!=self.RunHoldType then self:SetHoldType(self.RunHoldType)self.CHoldType=self.RunHoldType end else if self.dt.State==SWB_AIMING&&self.AimHoldType then if self.CHoldType!=self.AimHoldType then self:SetHoldType(self.AimHoldType)self.CHoldType=self.AimHoldType end elseif self.dt.State==SWB_RUNNING||self.dt.State==SWB_ACTION then if self.CHoldType!=self.RunHoldType then self:SetHoldType(self.RunHoldType)self.CHoldType=self.RunHoldType end else if self.CHoldType!=self.NormalHoldType then self:SetHoldType(self.NormalHoldType)self.CHoldType=self.NormalHoldType end end end;if self.WorldSubMaterials then for a6,a7 in pairs(self.WorldSubMaterials)do self:SetSubMaterial(a6,a7)end end;self:DrawModel()self:DoWorldBoneAnimation(self.WMEnt)end
--addons/!lpakr_out/lua/weapons/swb_knife/shared.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.BounceWeaponIcon=false;SWEP.DrawWeaponInfoBox=false;SWEP.PrintName="Knife"SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=1;SWEP.ViewbobEnabled=true;SWEP.EquipMenuData={type="item_weapon",desc="knife_desc"}SWEP.Icon="vgui/ttt/icon_knife"end;SWEP.SpeedDec=0;SWEP.Slot=3;SWEP.SlotPos=0;SWEP.SWBWeapon=true;SWEP.Author="Spy"SWEP.Contact=""SWEP.Purpose=""SWEP.Instructions=""SWEP.Category="SUP Weapons"SWEP.ViewModelFOV=55;SWEP.ViewModelFlip=false;SWEP.ViewModel=Model("models/weapons/cstrike/c_knife_t.mdl")SWEP.WorldModel=Model("models/weapons/w_knife_t.mdl")SWEP.UseHands=true;SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=true;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.HitSound=Sound("SWB_Knife_Hit")SWEP.SwingSound=Sound("SWB_Knife_Swing")SWEP.HitSoundElse=Sound("SWB_Knife_HitElse")SWEP.Kind=WEAPON_EQUIP;SWEP.CanBuy={ROLE_TRAITOR}SWEP.LimitedStock=true;SWEP.WeaponID=AMMO_KNIFE;SWEP.IsSilent=true;function SWEP:IsEquipment()return WEPS.IsEquipment(self)end;function SWEP:Initialize()self:SetHoldType("knife")end;local a,b;function SWEP:Deploy()self:SendWeaponAnim(ACT_VM_DRAW)self:SetNextPrimaryFire(CurTime()+0.7)return true end;function SWEP:Reload()end;function SWEP:Think()if self.DamageTime&&CurTime()>self.DamageTime then self:Damage()self.DamageTime=nil end end;function SWEP:PrimaryAttack()self.DamageMin=20;self.DamageMax=20;b=CurTime()if IsFirstTimePredicted()then self:EmitSound(self.SwingSound,70,100)self.DamageTime=b+0.15 end;self:GetOwner():SetDTFloat(0,0.5)self:SetNextPrimaryFire(b+0.55)self:SetNextSecondaryFire(b+0.55)end;function SWEP:SecondaryAttack()self.DamageMin=50;self.DamageMax=60;local c=self:GetOwner()c:SetAnimation(PLAYER_ATTACK1)b=CurTime()self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)if IsFirstTimePredicted()then self:EmitSound(self.SwingSound,70,100)self.DamageTime=b+0.15 end;c:SetDTFloat(0,0.5)self:SetNextPrimaryFire(b+1)self:SetNextSecondaryFire(b+1)end;local d={}local e,f;function SWEP:Damage()local c=self:GetOwner()d.start=c:GetShootPos()d.endpos=d.start+c:EyeAngles():Forward()*50;d.filter=c;d.mins=Vector(-6,-6,-6)d.maxs=Vector(6,6,6)e=util.TraceHull(d)if e.Hit then f=e.Entity;if IsValid(f)then if f:IsPlayer()||f:IsNPC()then ParticleEffect("blood_impact_red_01",e.HitPos,e.HitNormal:Angle(),f)self:EmitSound(self.HitSound,80,100)else self:EmitSound(self.HitSoundElse,80,100)end else self:EmitSound(self.HitSoundElse,80,100)end end end;if CLIENT then local g,h,i;function SWEP:DrawWorldModel()self:DrawModel()end end;function SWEP:Holster(j)self:OnRemove()return true end;if CLIENT then SWEP.BlendPos=Vector(0,0,0)SWEP.BlendAng=Vector(0,0,0)SWEP.OldDelta=Angle(0,0,0)SWEP.AngleDelta=Angle(0,0,0)local k=debug.getregistry()local l=k.Angle.Right;local m=k.Angle.Up;local n=k.Angle.Forward;local o=k.Angle.RotateAroundAxis;local p=k.Entity.GetVelocity;local q=k.Vector.Length;local r,s,t=Angle(0,0,0),Angle(0,0,0),Angle(0,0,0)function SWEP:CalcView(u,h,i,v)FT,b=FrameTime(),CurTime()local c=self:GetOwner()if self.ViewbobEnabled then ws=c:GetWalkSpeed()vel=q(p(c))if c:OnGround()&&vel>ws*0.3 then if vel<ws*1.2 then cos1=math.cos(b*15)cos2=math.cos(b*12)t.p=cos1*0.15;t.y=cos2*0.1 else cos1=math.cos(b*20)cos2=math.cos(b*15)t.p=cos1*0.25;t.y=cos2*0.15 end else t=LerpAngle(FT*10,t,r)end end;return h,i+t*self.ViewbobIntensity,v end;local w=Vector(0,0,0)local x,y,cos1,z,A,ws,B,C,vel,FT,D,E;local F=game.SinglePlayer()local G,H=Vector(0,0,0),Vector(0,0,0)local I,J=Vector(0,0,0),Vector(0,0,0)function SWEP:PreDrawViewModel()local c=self:GetOwner()b=UnPredictedCurTime()a=c:GetViewModel()EA=EyeAngles()FT=FrameTime()E=Angle(EA.p,EA.y,0)-self.OldDelta;E.p=math.Clamp(E.p,-10,10)self.OldDelta=Angle(EA.p,EA.y,0)self.AngleDelta=LerpAngle(math.Clamp(FT*10,0,1),self.AngleDelta,E)self.AngleDelta.y=math.Clamp(self.AngleDelta.y,-10,10)vel=q(p(c))ws=c:GetWalkSpeed()G,H=w*1,w*1;if vel<10||!c:OnGround()then cos1,z=math.cos(b),math.sin(b)A=math.atan(cos1*z,cos1*z)H.x=H.x+A*1.15;H.y=H.y+cos1*0.4;H.z=H.z+A;G.y=G.y+A*0.2 elseif vel>10&&vel<ws*1.2 then C=6+ws/130;mul=math.Clamp(vel/ws,0,1)z=math.sin(b*C)*mul;cos1=math.cos(b*C)*mul;tan1=math.tan(z*cos1)*mul;H.x=H.x+tan1;H.y=H.y-cos1;H.z=H.z+cos1;G.x=G.x-z*0.4;G.y=G.y+tan1*1;G.z=G.z+tan1*0.5 elseif vel>ws*1.2&&c:KeyDown(IN_SPEED)||vel>ws*3 then B=c:GetRunSpeed()C=7+math.Clamp(B/100,0,6)mul=math.Clamp(vel/B,0,1)z=math.sin(b*C)*mul;cos1=math.cos(b*C)*mul;tan1=math.tan(z*cos1)*mul;H.x=H.x+tan1*0.2;H.y=H.y-cos1*1.5;H.z=H.z+cos1*3;G.x=G.x-z*1.2;G.y=G.y+tan1*1.5;G.z=G.z+tan1 end;FT=FrameTime()I=LerpVector(FT*10,I,G)J=LerpVector(FT*10,J,H)end;function SWEP:GetViewModelPosition(h,i)o(i,l(i),J.x+self.AngleDelta.p)o(i,m(i),J.y+self.AngleDelta.y*0.3)o(i,n(i),J.z+self.AngleDelta.y*0.3)h=h+(I.x+self.AngleDelta.y*0.1)*l(i)h=h+(I.y+self.BlendPos.y)*n(i)h=h+(I.z+self.BlendPos.z-self.AngleDelta.p*0.1)*m(i)return h,i end end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/weapons/weapon_datapad.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_deconstruction.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_hotwire.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David + Scott"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/tobester/weapons/hotwire_spear.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Hotwire Spear"SWEP.Class="weapon_lightsaber_hotwire"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=50;SWEP.SaberBurnDamage=5;SWEP.MaxForce=info.Main&&0||50;SWEP.RegenSpeed=1;SWEP.CanKnockback=false;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.NoForcePowers=true;SWEP.ShowForceBar=!info.Main;SWEP.ForcePowerList={}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=true;SWEP.NoGlow=true;SWEP.UseHilt="models/tobester/weapons/hotwire_spear.mdl"SWEP.UseLength=42;SWEP.UseWidth=false;SWEP.UseColor=Color(255,255,25,0)SWEP.UseDarkInner=false;SWEP.UseLoopSound="lightsaber/saber_loop1.wav"SWEP.UseSwingSound="lightsaber/darksaber_swing.wav"SWEP.UseOnSound="lightsaber/saber_on_kylo.wav"SWEP.UseOffSound="lightsaber/saber_off_kylo.wav"SWEP.Base="wos_adv_single_lightsaber_base"SWEP.HolsterBone='ValveBiped.Bip01_Spine4'function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*6+c:Forward()*10-c:Up()*8;c:RotateAroundAxis(-c:Right(),164)c:RotateAroundAxis(c:Up(),6)return b,c end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_jax.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_sentinel_aedius.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_sinnura.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/weapons/weapon_stungun.lua:
AddCSLuaFile()SWEP.PrintName='Stun Gun'SWEP.Author='Scott'SWEP.DrawAmmo=false;SWEP.Category='SUP Weapons'SWEP.HoldType='normal'SWEP.UseHands=true;SWEP.Slot=3;SWEP.SlotPos=1;SWEP.Spawnable=true;SWEP.ViewModelFOV=70;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc15sa.mdl'SWEP.WorldModel='models/weapons/w_dc15sa.mdl'SWEP.Primary.Damage=0;SWEP.Primary.NumShots=0;SWEP.Primary.Cone=0;SWEP.Primary.Delay=0;SWEP.Primary.Sound=Sound'weapons/sw_stun.wav'SWEP.Primary.ClipSize=0;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.Primary.Ammo='none'SWEP.Primary.TakeAmmo=0;SWEP.Primary.Tracer=0;SWEP.Primary.TracerName='none'SWEP.Secondary.Ammo='none'SWEP.AnimPrefix='pistol'SWEP.HoldType='pistol'SWEP.ViewModelFlip=false;SWEP.DrawCrosshair=false;SWEP.Melee={DotRange=0.70721,HullRadius=1.732,TestHull=Vector(4,4,4),Mask=MASK_SHOT_HULL}function SWEP:Initialize()self:SetHoldType(self.HoldType)end;function SWEP:PrimaryAttack()self:SetNextPrimaryFire(CurTime()+.5)local owner=self:GetOwner()self:ShootEffects(owner)if IsFirstTimePredicted()then self:CheckStun(owner)end end;function SWEP:SecondaryAttack()end;function SWEP:DoFire(a,b)self:GetOwner():FireBullets({Attacker=owner,Damage=0,Force=1,Distance=900,Num=1,Tracer=1,TracerName='sup_laser_green',Src=a,Dir=b,IgnoreEntity=self})end;function SWEP:CheckStun(owner)local c=self:GetTrace()local d=c&&c.Entity;if!IsValid(d)||!d:IsPlayer()||!d:Alive()||SERVER&&d:IsStunned()==true then self:DoFire(owner:GetShootPos(),owner:GetAimVector())return end;self:DoFire(owner:GetShootPos(),(c.HitPos-owner:GetShootPos()):Angle():Forward())if d:GetPos():Distance(owner:GetPos())>900 then return end;local e=d:GetAllegianceID()if e!='CIVILIAN'&&e!=owner:GetAllegianceID()then return end end;function SWEP:ShootEffects(owner)self:EmitSound(self.Primary.Sound,50,100,.5,CHAN_WEAPON)self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)owner:MuzzleFlash()owner:SetAnimation(PLAYER_ATTACK1)end;function SWEP:DoImpactEffect(c,f)if c.HitSky then return true end;util.Decal('fadingscorch',c.HitPos+c.HitNormal,c.HitPos-c.HitNormal)return true end;function SWEP:GetTrace()local g=self.Melee;local h=self:GetOwner()h:LagCompensation(true)local i=h:EyePos()local j=h:GetAimVector()local k=i+j*800;local l={start=i,endpos=k,mask=self.Melee.Mask,filter=h}local c=util.TraceLine(l)local m=c.Fraction==1;if m then l.endpos=k-j*g.HullRadius;l.mins=-g.TestHull;l.maxs=g.TestHull;l.output=c;util.TraceHull(l)m=c.Fraction==1||c.Entity==NULL;if!m then local n=c.Entity:GetPos()-i;n:Normalize()if n:Dot(j)<g.DotRange then c.Fraction=1;c.Entity=NULL;m=true else util.FindHullIntersection(l,c)m=c.Fraction==1||c.Entity==NULL end end else m=c.Entity==NULL end;h:LagCompensation(false)return c end;function SWEP:Deploy()self:EmitSound('weapons/sw_startup.wav')end;function SWEP:DrawHUD()srp.weapons.DrawCrosshair(nil,nil,200,0)end
--addons/!lpakr_out/lua/weapons/weapon_westar34.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/wos_adv_dual_lightsaber_base/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/dronesrewrite_base/shared.lua:
ENT.DrrBaseType="base"ENT.RenderInCam=true;ENT.WaitNPCS=0;ENT.NextAction=0;ENT.EnginePower=0;ENT.FlyConstant=2.2524;ENT.BlockKeys=false;ENT.MoveCoefficient=1;ENT.DRONES_REWRITE_DELTA=0;ENT.CamAngles=Angle(0,0,0)ENT.CanSit=false;ENT.HackValue=1;ENT.Useable=true;ENT.IS_DRONE=true;ENT.IS_DRR=true;ENT.AllowControl=false;ENT.BlockRemoteController=false;ENT.ShowOnRadar=true;ENT.UNIT="BASE"ENT.AI_AllowDown=true;ENT.AI_AllowUp=true;ENT.AI_AllowForward=true;ENT.AI_AllowBack=true;ENT.AI_AllowRotate=true;ENT.AI_AllowStay=true;ENT.DisableInWater=true;ENT.DRRDefMaxDistance=10000;ENT.Slots={["Body"]=2,["Engine"]=1,["Camera"]=1,["AI"]=5,["Fuel"]=1}ENT.Modules=nil;ENT.Buffer={}ENT.Base="base_anim"ENT.Type="anim"ENT.PrintName="Base Drone"ENT.Spawnable=false;ENT.AdminSpawnable=false;ENT.Category=""ENT.Weight=100;ENT.Model="models/props_phx/construct/metal_plate1.mdl"ENT.HealthAmount=100;ENT.DefaultHealth=100;ENT.CriticalHealthPoint=30;ENT.DamageThreshold=0;ENT.DoExplosionEffect=true;ENT.ExplosionForce=37;ENT.ExplosionAngForce=3;ENT.Speed=2300;ENT.UpSpeed=6900;ENT.SprintCoefficient=2;ENT.RotateSpeed=13;ENT.AngOffset=10;ENT.PitchOffset=1;ENT.Alignment=1;ENT.AlignmentPitch=0;ENT.AlignmentRoll=0;ENT.Damping=1;ENT.AngDamping=1;ENT.AngPitchDamping=0;ENT.AngYawDamping=0;ENT.AngRollDamping=0;ENT.VelCoefficientOffset=0.0025;ENT.VelCoefficientMax=3;ENT.AngOffsetVel=1;ENT.NoiseCoefficient=0.3;ENT.NoiseCoefficientPos=0;ENT.NoiseCoefficientAng=0;ENT.CameraModel="models/dronesrewrite/camera/camera.mdl"ENT.SimplestCamera=false;ENT.FirstPersonCam_pos=Vector(0,0,-5)ENT.ThirdPersonCam_pos=Vector(0,0,0)ENT.ThirdPersonCam_distance=100;ENT.EnabledThirdPerson=true;ENT.RenderCam=true;ENT.CamZoom=30;ENT.OverlayName="Default"ENT.HUD_hudName="Sci Fi"ENT.HUD_textColor=Color(200,255,255)ENT.HUD_hudColor=Color(200,255,255)ENT.HUD_shouldDrawCrosshair=true;ENT.HUD_shouldDrawHud=true;ENT.HUD_shouldDrawHealth=true;ENT.HUD_shouldDrawTargets=true;ENT.HUD_shouldDrawOverlay=true;ENT.HUD_shouldDetectDamage=true;ENT.HUD_shouldDrawRadar=true;ENT.HUD_shouldDrawCenter=true;ENT.Enabled=true;ENT.UseNightVision=true;ENT.UseFlashlight=true;ENT.Fuel=100;ENT.MaxFuel=100;ENT.FuelReduction=0.1;ENT.ShouldConsumeFuel=true;ENT.MaxPrimaryAmmo=0;ENT.MaxSecondaryAmmo=0;ENT.ShouldConsumeAmmo=true;ENT.Immortal=false;ENT.NoPropellers=false;ENT.Propellers=nil;ENT.Sounds=nil;ENT.Weapons=nil;ENT.KeysFuncs=nil;ENT.Legs=nil;ENT.Attachments=nil;ENT.PlayLoop=true;ENT.AllowPitchRestrictions=true;ENT.PitchMin=0;ENT.PitchMax=90;ENT.AllowYawRestrictions=false;ENT.YawMin=0;ENT.YawMax=0;ENT.CurrentWeapon=nil;ENT.Dists=nil;ENT.Slip=6;ENT.AngSlip=0.05;ENT.isDroneOnGround=false;ENT.Hover=15;ENT.WaitForSound=0.13;function ENT:CanTool(a,b,c)return c=='remover'end;function ENT:IsDroneOnGround()return self.isDroneOnGround end;function ENT:AddHook(d,e,f)if!self.hooks then self.hooks={}end;if!self.hooks[d]then self.hooks[d]={}end;self.hooks[d][e]=f end;function ENT:RemoveHook(d,e)if!self.hooks then self.hooks={}end;if self.hooks[d]&&self.hooks[d][e]then self.hooks[d][e]=nil end end;function ENT:CallHook(e,...)if!self.hooks then self.hooks={}end;if!self.hooks[e]then return end;for g,h in pairs(self.hooks[e])do if CLIENT then else h(...)end end end;function ENT:AddHookClient(d,e,f)if CLIENT then return end;net.Start("dronesrewrite_addhook")net.WriteEntity(self)net.WriteString(d)net.WriteString(e)net.WriteString(f)net.Broadcast()end;function ENT:RemoveHookClient(d,e,f)if CLIENT then return end;net.Start("dronesrewrite_removehook")net.WriteEntity(self)net.WriteString(d)net.WriteString(e)net.Broadcast()end;function ENT:GetUnit()return self.UNIT..self:EntIndex()end;function ENT:GetNumPropellers()return self.Propellers&&#self.Propellers.Info||0 end;function ENT:CalculateFlyConstant()if self.DrrBaseType=="base"then return self.FlyConstant*4/self:GetNumPropellers()else return 1 end end;function ENT:IsDroneDestroyed()return self:GetHealth()<=0 end;function ENT:IsDroneImmortal()return self.Immortal||DRONES_REWRITE.ServerCVars.NoDamage:GetBool()end;function ENT:IsDroneEnabled()return SERVER&&self.Enabled||self:GetNWBool("Enabled")end;function ENT:IsDroneWorkable()return!self:IsDroneDestroyed()&&self:IsDroneEnabled()end;function ENT:GetHealth()return CLIENT&&self:GetNWInt("Health")||self.HealthAmount end;function ENT:GetDefaultHealth()return self:GetNWInt("DefHealth")end;function ENT:GetPrimaryAmmo()return self:GetNWInt("Ammo1")end;function ENT:GetPrimaryMax()return self:GetNWInt("MaxAmmo1")end;function ENT:GetSecondaryAmmo()return self:GetNWInt("Ammo2")end;function ENT:GetSecondaryMax()return self:GetNWInt("MaxAmmo2")end;function ENT:GetDriver()return self:GetNWEntity("DronesRewriteDriver")end;function ENT:GetCamera()return self:GetNWEntity("Camera")end;function ENT:GetMainCamera()return self:GetNWEntity("MainCamera")end;function ENT:DoCamEffects()return self:GetNWBool("CameraHUD")&&!self:GetNWBool("ThirdPerson")end;function ENT:SupportAngles()return self:GetNWBool("SupportAngles")&&!self:GetNWBool("ThirdPerson")end;function ENT:GetLocalCamPos()return self:GetNWVector("CameraPositions")end;function ENT:GetCameraTraceLine(i,j,k,l)local m=self:GetCamera()if!IsValid(m)then m=self end;local n=m:GetPos()i=i||100000;j=j||Vector(0,0,0)k=k||Vector(0,0,0)local o={}table.insert(o,m)table.insert(o,self)local p=util.TraceHull({start=n,endpos=n+self.CamAngles:Forward()*i,filter=o,mins=j,maxs=k,mask=l})return p end
--addons/!lpakr_out/lua/entities/dronesrewrite_camera/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/dronesrewrite_controller/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/dronesrewrite_controller/cl_init.lua:
include("shared.lua")local a=CreateMaterial("UnlitGeneric","GMODScreenspace",{})function ENT:Draw()if!self.Rt then self.Rt=GetRenderTarget("ControllerDrr"..self:EntIndex(),1024,1024,false)end;self:DrawModel()cam.Start3D2D(self:LocalToWorld(Vector(-14.7,-14.4,1.5)),self:LocalToWorldAngles(Angle(0,90,0)),0.03)local b,c=520,345;draw.RoundedBox(0,0,0,b,c,Color(0,0,0))local d=self:GetNWEntity("DronesRewriteDrone")if IsValid(d)then if!DRONES_REWRITE.ClientCVars.NoScreen:GetBool()then a:SetTexture("$basetexture",self.Rt)surface.SetMaterial(a)surface.DrawTexturedRect(0,0,b,c)end;draw.SimpleText("DRONE: "..d:GetUnit(),"DronesRewrite_font3",8,8,Color(255,255,255,200))draw.SimpleText("HEALTH: "..d:GetHealth(),"DronesRewrite_font3",8,30,Color(255,255,255,200))draw.SimpleText("MAX DISTANCE: "..self:GetNWInt("Distance"),"DronesRewrite_font3",8,52,Color(255,255,255,200))else surface.SetMaterial(Material("stuff/console/broken4"))surface.SetDrawColor(Color(255,255,255,50))surface.DrawTexturedRect(0,0,b,c)draw.SimpleText("NO SIGNAL","DronesRewrite_font1",b/2,c/2-16,Color(255,255,255,50),TEXT_ALIGN_CENTER)end;cam.End3D2D()if!DRONES_REWRITE.ClientCVars.NoGlows:GetBool()then local e=DynamicLight(self:EntIndex())if e then e.pos=self:LocalToWorld(Vector(-7,-7,3))e.r=255;e.g=255;e.b=255;e.brightness=1;e.Decay=1000;e.Size=36;e.DieTime=CurTime()+0.1 end end end;function ENT:OpenMenu()local f=DRONES_REWRITE.CreateWindow(265,110)local g=true;local h=vgui.Create("DTextEntry",f)h:SetSize(245,25)h:SetPos(10,30)h.OnTextChanged=function()net.Start("dronesrewrite_controllerlookup")net.WriteEntity(self)net.WriteString(h:GetValue())net.SendToServer()end;h.OnLoseFocus=function()h:RequestFocus()end;h:RequestFocus()local i=DRONES_REWRITE.CreateButton("Enter a valid drone id",10,70,245,30,f,function()net.Start("dronesrewrite_controldr")net.WriteEntity(self)net.SendToServer()f:Close()end)h.OnEnter=i.DoClick;i.Think=function(i)local h=IsValid(self:GetNWEntity("DronesRewriteDrone"))&&"Control "..self:GetNWEntity("DronesRewriteDrone"):GetUnit()||"Enter a valid drone id"if h!=i:GetText()then i:SetText(h)end end end
--addons/!lpakr_out/lua/entities/ent_flame_hotspot.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/ent_grapple/cl_init.lua:
include'shared.lua'function ENT:Initialize()self:SetRenderOrigin(self:GetPos()+Vector(0,0,-100))end;function ENT:Draw()self:DrawModel()if!self.RenderPos then self.RenderPos=self:GetPos()+self:GetForward()*1-self:GetUp()*4-self:GetRight()*69 end;self:SetRenderOrigin(self.RenderPos)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/ent_textscreen/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/furniture_bed.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gambling_machine_roulette/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_contr_spawner/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gmod_wheel.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_adv_emarker.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_cd_ray.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_dataplug.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_dataport.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Data Port"ENT.WireDebugName="DataPort"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self:SetUseType(SIMPLE_USE)self.Outputs=Wire_CreateOutputs(self,{"Port0","Port1","Port2","Port3","Port4","Port5","Port6","Port7"})self.Inputs=Wire_CreateInputs(self,{"Port0","Port1","Port2","Port3","Port4","Port5","Port6","Port7"})self.Ports={}for a=0,7 do self.Ports[a]=0 end;self.OutPorts={}self:NextThink(CurTime())end;function ENT:Think()BaseClass.Think(self)for a=0,7 do if self.OutPorts[a]then Wire_TriggerOutput(self,"Port"..a,self.OutPorts[a])self.OutPorts[a]=nil end end;self:NextThink(CurTime())return true end;function ENT:ReadCell(b)b=math.floor(b)if b>=0&&b<=7 then return self.Ports[b]else return nil end end;function ENT:WriteCell(b,c)b=math.floor(b)if b>=0&&b<=7 then self.OutPorts[b]=c;return true else return false end end;function ENT:TriggerInput(d,c)for a=0,7 do if d=="Port"..a then self.Ports[a]=c end end end;duplicator.RegisterEntityClass("gmod_wire_dataport",WireLib.MakeWireEnt,"Data")
--addons/!lpakr_out/lua/entities/gmod_wire_eyepod.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_gps.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_gps.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire GPS"ENT.WireDebugName="GPS"if CLIENT then function ENT:Think()BaseClass.Think(self)local a=self:GetPos()if COLOSSAL_SANDBOX then a=a*6.25 end;local b=string.format("Position = %0.3f, %0.3f, %0.3f",math.Round(a.x,3),math.Round(a.y,3),math.Round(a.z,3))self:SetOverlayText(b)self:NextThink(CurTime()+0.04)return true end;return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.storedpositions={}self.arrayindex=0;self.Inputs=Wire_CreateInputs(self,{"Store/Save Pos","Next","Remove Save Position"})self.Outputs=WireLib.CreateSpecialOutputs(self,{"X","Y","Z","Vector","Recall X","Recall Y","Recall Z","Recall Vector","Current Memory"},{"NORMAL","NORMAL","NORMAL","VECTOR","NORMAL","NORMAL","NORMAL","VECTOR","NORMAL"})end;function ENT:Setup()self.Value=0;self.PrevOutput=nil;Wire_TriggerOutput(self,"X",0)Wire_TriggerOutput(self,"Y",0)Wire_TriggerOutput(self,"Z",0)Wire_TriggerOutput(self,"Vector",Vector(0,0,0))Wire_TriggerOutput(self,"Recall X",0)Wire_TriggerOutput(self,"Recall Y",0)Wire_TriggerOutput(self,"Recall Z",0)Wire_TriggerOutput(self,"Recall Vector",Vector(0,0,0))Wire_TriggerOutput(self,"Current Memory",0)end;function ENT:Think()BaseClass.Think(self)local a=self:GetPos()if COLOSSAL_SANDBOX then a=a*6.25 end;Wire_TriggerOutput(self,"X",a.x)Wire_TriggerOutput(self,"Y",a.y)Wire_TriggerOutput(self,"Z",a.z)Wire_TriggerOutput(self,"Vector",a)Wire_TriggerOutput(self,"Current Memory",self.arrayindex)if self.arrayindex>0 then Wire_TriggerOutput(self,"Recall X",self.storedpositions[self.arrayindex].x)Wire_TriggerOutput(self,"Recall Y",self.storedpositions[self.arrayindex].y)Wire_TriggerOutput(self,"Recall Z",self.storedpositions[self.arrayindex].z)Wire_TriggerOutput(self,"Recall Vector",self.storedpositions[self.arrayindex])else Wire_TriggerOutput(self,"Recall X",0)Wire_TriggerOutput(self,"Recall Y",0)Wire_TriggerOutput(self,"Recall Z",0)Wire_TriggerOutput(self,"Recall Vector",Vector(0,0,0))end;self:NextThink(CurTime()+0.04)return true end;function ENT:TriggerInput(c,d)if c=="Store/Save Pos"then if d!=0 then local e=self:GetPos()table.insert(self.storedpositions,e)self.arrayindex=self.arrayindex+1 end elseif c=="Next"then if d!=0 then if#self.storedpositions>0 then if!(self.arrayindex>=#self.storedpositions)then self.arrayindex=self.arrayindex+1 else self.arrayindex=1 end end end elseif c=="Remove Save Position"then if d!=0 then if self.arrayindex!=0 then table.remove(self.storedpositions,self.arrayindex)end;if self.arrayindex==1&&#self.storedpositions==0 then self.arrayindex=0 end;if self.arrayindex==#self.storedpositions+1 then self.arrayindex=self.arrayindex-1 end end end end;duplicator.RegisterEntityClass("gmod_wire_gps",WireLib.MakeWireEnt,"Data")
--addons/!lpakr_out/lua/entities/gmod_wire_grabber.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_grabber.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Grabber"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WireDebugName="Grabber"function ENT:SetupDataTables()self:NetworkVar("Float",0,"BeamLength")end;if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=Wire_CreateInputs(self,{"Grab","Strength (The strength of the weld. The weld will break if enough force is applied. Setting to zero makes the weld unbreakable.)","Range"})self.Outputs=Wire_CreateOutputs(self,{"Holding","Grabbed Entity [ENTITY]"})self.WeldStrength=0;self.Weld=nil;self.WeldEntity=nil;self.EntHadGravity=true;self.ExtraProp=nil;self.ExtraPropWeld=nil;self:GetPhysicsObject():SetMass(10)self:Setup(100,true)end;function ENT:OnRemove()if self.Weld then self:ResetGrab()end;Wire_Remove(self)end;function ENT:Setup(a,b)if a then self:SetBeamLength(a)end;self.Gravity=b end;function ENT:LinkEnt(c)if!IsValid(c)then return false,"Not a valid entity!"end;self.ExtraProp=c;WireLib.SendMarks(self,{c})return true end;function ENT:UnlinkEnt()if IsValid(self.ExtraPropWeld)then self.ExtraPropWeld:Remove()self.ExtraPropWeld=nil end;self.ExtraProp=nil;WireLib.SendMarks(self,{})return true end;function ENT:ResetGrab()if IsValid(self.Weld)then self.Weld:Remove()if self.EntHadGravity&&IsValid(self.WeldEntity)&&IsValid(self.WeldEntity:GetPhysicsObject())&&self.Gravity then self.WeldEntity:GetPhysicsObject():EnableGravity(true)end end;if IsValid(self.ExtraPropWeld)then self.ExtraPropWeld:Remove()end;self.Weld=nil;self.WeldEntity=nil;self.ExtraPropWeld=nil;self:SetColor(Color(255,255,255,self:GetColor().a))Wire_TriggerOutput(self,"Holding",0)Wire_TriggerOutput(self,"Grabbed Entity",self.WeldEntity)end;function ENT:CanGrab(d)if!d.Entity||!isentity(d.Entity)then return false end;if!d.Entity:IsValid()&&!d.Entity:IsWorld()||d.Entity:IsPlayer()then return false end;if!util.IsValidPhysicsObject(d.Entity,d.PhysicsBone)then return false end;if!WireLib.CanTool(self:GetPlayer(),d.Entity,"weld")then return false end;return true end;function ENT:TriggerInput(e,f)if e=="Grab"then if f!=0&&self.Weld==nil then local g=self:GetPos()local h=self:GetUp()local i=ents.FindByClass("gmod_wire_spawner")table.insert(i,self)local d=util.TraceLine{start=g,endpos=g+h*self:GetBeamLength(),filter=i}if!self:CanGrab(d)then return end;local j=constraint.Weld(self,d.Entity,0,0,self.WeldStrength)if j then j.Type=""end;local k;if self.ExtraProp then if self.ExtraProp:IsValid()then k=constraint.Weld(self.ExtraProp,d.Entity,0,0,self.WeldStrength)if k then k.Type=""end end end;if self.Gravity then d.Entity:GetPhysicsObject():EnableGravity(false)end;self.WeldEntity=d.Entity;self.Weld=j;self.ExtraPropWeld=k;self.EntHadGravity=d.Entity:GetPhysicsObject():IsGravityEnabled()self:SetColor(Color(255,0,0,self:GetColor().a))Wire_TriggerOutput(self,"Holding",1)Wire_TriggerOutput(self,"Grabbed Entity",self.WeldEntity)elseif f==0 then if self.Weld!=nil||self.ExtraPropWeld!=nil then self:ResetGrab()end end elseif e=="Strength"then self.WeldStrength=math.max(f,0)elseif e=="Range"then self:SetBeamLength(math.Clamp(f,0,32000))end end;function ENT:BuildDupeInfo()local l=BaseClass.BuildDupeInfo(self)||{}if self.WeldEntity&&self.WeldEntity:IsValid()then l.WeldEntity=self.WeldEntity:EntIndex()end;if self.ExtraProp&&self.ExtraProp:IsValid()then l.ExtraProp=self.ExtraProp:EntIndex()end;return l end;function ENT:ApplyDupeInfo(m,n,l,o)BaseClass.ApplyDupeInfo(self,m,n,l,o)self.WeldEntity=o(l.WeldEntity)self.ExtraProp=o(l.ExtraProp)if self.WeldEntity&&self.Inputs.Grab.Value!=0 then if!self.Weld&&self.trace!=nil then self.Weld=constraint.Weld(self,self.trace,0,0,self.WeldStrength)self.Weld.Type=""end;if IsValid(self.ExtraProp)then self.ExtraPropWeld=constraint.Weld(self.ExtraProp,self.WeldEntity,0,0,self.WeldStrength)self.ExtraPropWeld.Type=""end;if self.Gravity then self.WeldEntity:GetPhysicsObject():EnableGravity(false)end;if self.Weld then self:SetColor(Color(255,0,0,self:GetColor().a))Wire_TriggerOutput(self,"Holding",1)Wire_TriggerOutput(self,"Grabbed Entity",self.WeldEntity)else self:ResetGrab()end end end;duplicator.RegisterEntityClass("gmod_wire_grabber",WireLib.MakeWireEnt,"Data","Range","Gravity")
--addons/!lpakr_out/lua/entities/gmod_wire_graphics_tablet.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_graphics_tablet.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Graphics Tablet"ENT.WireDebugName="Graphics Tablet"ENT.Author="greenarrow"ENT.Editable=true;ENT.workingDistance=64;local a=false;local b=true;function ENT:SetupDataTables()self:NetworkVar("Bool",0,"DrawBackground",{KeyName="DrawBackground",Edit={type="Boolean",title="#Tool_wire_graphics_tablet_mode",order=1}})self:NetworkVar("Bool",1,"CursorMode",{KeyName="CursorMode",Edit={type="Boolean",title="#Tool_wire_graphics_tablet_draw_background",order=2}})end;if CLIENT then function ENT:Initialize()self.GPU=WireGPU(self,true)end;function ENT:OnRemove()self.GPU:Finalize()end;local function c(d,e,f,g,h,i,j,k)local l,m=d>h&&d||h,e>i&&e||i;local n,o,p,q=d+f,e+g,h+j,i+k;local r,s=(n<p&&n||p)-l,(o<q&&o||q)-m;return l,m,r,s end;function ENT:Draw()self:DrawModel()local t=self:GetDrawBackground()self.GPU:RenderToWorld(nil,512,function(l,m,r,s,u,v,w,x)if t then surface.SetDrawColor(0,0,0,255)surface.DrawRect(l,m,r,s)end;local y=LocalPlayer()local z=y:GetEyeTraceNoCursor()local A=z.Entity;if A:IsValid()then local B=z.Normal:Dot(z.HitNormal)*z.Fraction*-16384;B=math.max(B,z.Fraction*16384-A:BoundingRadius())if B<self.workingDistance&&A==self.GPU.Entity then local C=WorldToLocal(z.HitPos,Angle(),v,w)local D=0.5+C.x/(x*r)local E=0.5-C.y/(x*s)if D>=0&&E>=0&&D<=1&&E<=1 then surface.SetDrawColor(255,255,255,255)local F=16;local G=2;local H,I=l+D*r,m+E*s;local d,e,f,g=c(H-F,I-G,F*2,G*2,l,m,r,s)local h,i,j,k=c(H-G,I-F,G*2,F*2,l,m,r,s)surface.DrawRect(d,e,f,g)surface.DrawRect(h,i,j,k)end end end end,t&&nil||0.1)Wire_Render(self)end;return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Outputs=Wire_CreateOutputs(self,{"X","Y","Use (Outputs 1 as long as any player is holding the use key while aiming at the screen.)","OnScreen (Outputs 1 as long as any player is aiming at the screen)"})Wire_TriggerOutput(self,"X",0)Wire_TriggerOutput(self,"Y",0)Wire_TriggerOutput(self,"Use",0)Wire_TriggerOutput(self,"OnScreen",0)self.lastOnscreen=0;self.lastX=0;self.lastY=0;self.lastClick=0 end;function ENT:Think()BaseClass.Think(self)local J=0;local K=0;local L=self.GPUEntity||self;local M=L:GetModel()local u=WireGPU_Monitors[M]local w=L:LocalToWorldAngles(u.rot)local v=L:LocalToWorld(u.offset)local s=1024;local r=s/u.RatioX;local l=-r/2;local m=-s/2;for N,y in pairs(player.GetAll())do local z=y:GetEyeTraceNoCursor()local A=z.Entity;if A:IsValid()then local B=z.Normal:Dot(z.HitNormal)*z.Fraction*-16384;B=math.max(B,z.Fraction*16384-A:BoundingRadius())if B<64&&A==L then if y:KeyDown(IN_ATTACK)||y:KeyDown(IN_USE)then K=1 end;local C=WorldToLocal(z.HitPos,Angle(),v,w)local D=0.5+C.x/(u.RS*r)local E=0.5-C.y/(u.RS*s)if D>=0&&E>=0&&D<=1&&E<=1 then J=1;if D!=self.lastX||E!=self.lastY then self.lastX=D;self.lastY=E;if self:GetCursorMode()==b then D=D*2-1;E=-(E*2-1)end;Wire_TriggerOutput(self,"X",D)Wire_TriggerOutput(self,"Y",E)self:ShowOutput(D,E,K,1)end end end end end;if J!=self.lastOnScreen then Wire_TriggerOutput(self,"OnScreen",J)self:ShowOutput(self.lastX,self.lastY,self.lastClick,J)self.lastOnScreen=J end;if K!=self.lastClick then Wire_TriggerOutput(self,"Use",K)self:ShowOutput(self.lastX,self.lastY,K,self.lastOnScreen)self.lastClick=K end;self:NextThink(CurTime()+0.08)return true end;function ENT:ShowOutput(D,E,O,P)self:SetOverlayText(string.format("X = %f, Y = %f, Use = %d, On Screen = %d\n",D,E,O,P))end;function ENT:OnRestore()BaseClass.OnRestore(self)Wire_AdjustOutputs(self,{"X","Y","Use","OnScreen"})end;function ENT:Setup(Q,t)if Q!=nil then self:SetCursorMode(Q)end;if t!=nil then self:SetDrawBackground(t)end end;duplicator.RegisterEntityClass("gmod_wire_graphics_tablet",WireLib.MakeWireEnt,"Data","gmode","draw_background")
--addons/!lpakr_out/lua/entities/gmod_wire_las_receiver.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Laser Pointer Receiver"ENT.WireDebugName="Laser Receiver"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self:SetUseType(SIMPLE_USE)self.Outputs=WireLib.CreateSpecialOutputs(self,{"X","Y","Z","Active","Pos","RangerData"},{"NORMAL","NORMAL","NORMAL","NORMAL","VECTOR","RANGER"})self.VPos=Vector(0,0,0)self:SetOverlayText("Laser Pointer Receiver")end;function ENT:GetBeaconPos(a)return self.VPos end;function ENT:GetBeaconVelocity(a)return Vector()end;function ENT:Use(b,c)if!hook.Run("PlayerGiveSWEP",b,"laserpointer",weapons.Get("laserpointer"))then return end;b:PrintMessage(HUD_PRINTTALK,"Hold down your use key for 2 seconds to get and link a Laser Pointer.")timer.Create("las_receiver_use_"..b:EntIndex(),2,1,function()if!IsValid(b)||!b:IsPlayer()then return end;if!b:KeyDown(IN_USE)then return end;if!b:GetEyeTrace().Entity then return end;if!IsValid(b:GetWeapon("laserpointer"))then if!hook.Run("PlayerGiveSWEP",b,"laserpointer",weapons.Get("laserpointer"))then return end;b:Give("laserpointer")end;b:GetWeapon("laserpointer").Receiver=self;b:PrintMessage(HUD_PRINTTALK,"You are now linked!")b:SelectWeapon("laserpointer")end)end;local function d(e,f,g)if e:HasWeapon("laserPointer")then local h=e:GetWeapon("laserPointer")if h&&h:IsValid()then e.LasReceiver=h.Receiver end end end;hook.Add("PlayerDeath","laserMemory",d)duplicator.RegisterEntityClass("gmod_wire_las_receiver",WireLib.MakeWireEnt,"Data")duplicator.RegisterEntityClass("gmod_wire_las_reciever",WireLib.MakeWireEnt,"Data")
--addons/!lpakr_out/lua/entities/gmod_wire_light.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_rt_screen.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_rt_screen.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="base_wire_entity"ENT.PrintName="Improved RT Screen"ENT.WireDebugName="Improved RT Screen"function ENT:SetupDataTables()self:NetworkVar("Bool",0,"Active")self:NetworkVar("Entity",0,"Camera")self:NetworkVar("String",0,"ScreenMaterial")if CLIENT then self:NetworkVarNotify("ScreenMaterial",self.ScreenMaterialChanged)end;self:NetworkVar("Float",0,"ScrollX")self:NetworkVar("Float",1,"ScrollY")self:NetworkVar("Float",2,"ScaleX")self:NetworkVar("Float",3,"ScaleY")self:NetworkVar("String",1,"MaterialParams")if CLIENT then self:NetworkVarNotify("MaterialParams",self.MaterialParamsChanged)end end;local a={numint={"SetInt","NORMAL",nil},numfloat={"SetFloat","NORMAL",nil},vector3={"SetVector","VECTOR",function(b)return Vector(b.x,b.y,b.z)end},string={"SetString","STRING",nil},texture={"SetTexture","STRING",nil},matrix44={"SetMatrix","matrix4",function(b)return Matrix({{b.a1,b.a2,b.a3,b.a4},{b.b1,b.b2,b.b3,b.b4},{b.c1,b.c2,b.c3,b.c4},{b.d1,b.d2,b.d3,b.d4}})end}}local c={}local function d(e)if c[e]!=nil then return c[e]end;local f=file.Read("materials/improvedrt_screen/monitor_"..e..".vmt","GAME")if f==nil then return end;local e=util.KeyValuesToTable(f)local g={}for h,b in pairs(e["!parameters"]||{})do local i=assert(a[b.type])[3]g[h]={WireName=b.wirename,WireType=a[b.type][2],MaterialFn=a[b.type][1],Default=i&&i(b.default)||b.default}end;c[e]=g;return g end;function ENT:TriggerInput(j,k)if j=="Active"then self:SetActive(k!=0)elseif j=="Camera"then if!IsValid(k)||k:GetClass()!="gmod_wire_rt_camera"then k=nil end;self:SetCamera(k)elseif j=="Scroll X"then self:SetScrollX(k)elseif j=="Scroll Y"then self:SetScrollY(k)elseif j=="Scale X"then self:SetScaleX(k)elseif j=="Scale Y"then self:SetScaleY(k)else self.MaterialParams[j]=k;self:SetMaterialParams(util.TableToJSON(self.MaterialParams))end end;function ENT:IsScreenInRange(l)local m=l:GetInfoNum("wire_rt_screen_renderdistance",512)return l:EyePos():DistToSqr(self:GetPos())<=m*m end;if CLIENT then CreateClientConVar("wire_rt_screen_renderdistance","512",nil,true,nil,0)local n={}local function o(j)if n[j]!=nil then return n[j]end;if j==""then MsgN("WireRTScreen: got empty name (typically happens at entity creation).")return nil end;local p="improvedrt_screen/monitor_"..j..".vmt"if!file.Exists("materials/"..p,"GAME")then MsgN("WireRTScreen: material "..p.." does not exist on client for some reason! Screen will not be rendered")return nil end;local e=Material(p)n[j]=e;return e end;function ENT:Initialize()self.MonitorDesc=WireGPU_Monitors[self:GetModel()]self:ScreenMaterialChanged(nil,nil,self:GetScreenMaterial())self.MaterialParams={}end;function ENT:ScreenMaterialChanged(q,q,e)self.Material=o(e)self.MaterialParamsDesc=d(e)end;function ENT:MaterialParamsChanged(q,q,r)self.MaterialParams=util.JSONToTable(r)end;function ENT:Think()local s=self:GetCamera()if!self:GetActive()then if IsValid(s)then s:SetIsObserved(false)end;self.ShouldRenderCamera=false;return end;self.ShouldRenderCamera=self:IsScreenInRange(LocalPlayer())if IsValid(s)then s:SetIsObserved(self.ShouldRenderCamera)end end;function ENT:DrawScreen()local s=self:GetCamera()local t=self.MonitorDesc;local u=self.Material;local v=s.RenderTarget;if!v then return end;u:SetTexture(u:GetString("!targettex1"),v)local w=u:GetString("!targettex2")if w!=nil then u:SetTexture(w,v)end;if self.MaterialParamsDesc then for x,b in pairs(self.MaterialParamsDesc)do local k=self.MaterialParams[b.WireName]||b.Default;u[b.MaterialFn](u,x,k)end end;local y=512/t.RatioX;local z=512;local A=-y;local B=y;local C=-z;local D=z;local E,F=0,0;local G,H=self:GetScaleX(),t.RatioX*self:GetScaleY()local I=self:GetScrollX()local J=self:GetScrollY()E=E+I;G=G+I;F=F+J;H=H+J;cam.Start3D2D(self:LocalToWorld(t.offset),self:LocalToWorldAngles(t.rot),t.RS)surface.SetDrawColor(255,255,255)surface.SetMaterial(u)surface.DrawPoly({{x=B,y=C,u=G,v=F},{x=B,y=D,u=G,v=H},{x=A,y=D,u=E,v=H},{x=A,y=C,u=E,v=F}})cam.End3D2D()end;function ENT:DrawDummy()local t=self.MonitorDesc;local y=512/t.RatioX;local z=512;local A=-y;local B=y;local C=-z;local D=z;cam.Start3D2D(self:LocalToWorld(t.offset),self:LocalToWorldAngles(t.rot),t.RS)draw.NoTexture()surface.SetDrawColor(0,0,0)surface.DrawPoly({{x=B,y=C,u=1,v=0},{x=B,y=D,u=1,v=1},{x=A,y=D,u=0,v=1},{x=A,y=C,u=0,v=0}})cam.End3D2D()end;function ENT:Draw()self:DrawModel()if self.MonitorDesc==nil then return end;if self:GetActive()&&self.ShouldRenderCamera&&self.Material!=nil&&IsValid(self:GetCamera())&&self:GetCamera():GetActive()then self:DrawScreen()elseif!self.translucent then self:DrawDummy()end end end;duplicator.RegisterEntityClass("improvedrt_screen",WireLib.MakeWireEnt,"Data","ScreenMaterial")duplicator.RegisterEntityClass("gmod_wire_rt_screen",WireLib.MakeWireEnt,"Data","ScreenMaterial")
--addons/!lpakr_out/lua/entities/gmod_wire_thruster.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Thruster"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WireDebugName="Thruster"WireLib.ThrusterNetEffects={["fire_smoke"]=true}function ENT:SetEffect(a)self:SetNWString("Effect",a)self.neteffect=WireLib.ThrusterNetEffects[a]end;function ENT:GetEffect(a)return self:GetNWString("Effect")end;function ENT:SetOn(b)self:SetNWBool("On",b,true)end;function ENT:IsOn(a)return self:GetNWBool("On")end;function ENT:SetOffset(c)self:SetNWVector("Offset",c,true)end;function ENT:GetOffset(a)return self:GetNWVector("Offset")end;if CLIENT then function ENT:Initialize()self.ShouldDraw=1;self.EffectAvg=0;local d,e=self:GetRenderBounds()self:SetRenderBounds(e+Vector(0,0,128),d,0)end;function ENT:DrawTranslucent()if self.ShouldDraw==0||!self:IsOn()then return end;local f=WireLib.ThrusterEffectDraw[self:GetEffect()]if f then f(self)end end;function ENT:Think()BaseClass.Think(self)self.ShouldDraw=GetConVarNumber("cl_drawthrusterseffects")if self.ShouldDraw==0||!self:IsOn()then return end;local g=WireLib.ThrusterEffectThink[self:GetEffect()]if g then g(self)end end;function ENT:CalcNormal()return(self:LocalToWorld(self:GetOffset())-self:GetPos()):GetNormalized()end;return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self:DrawShadow(false)local h=self:GetPhysicsObject()if h:IsValid()then h:Wake()end;local i=self:OBBMaxs()local j=self:OBBMins()self.ThrustOffset=Vector(0,0,i.z)self.ThrustOffsetR=Vector(0,0,j.z)self:SetForce(2000)self.oweffect="fire"self.uweffect="same"self:SetOffset(self.ThrustOffset)self:StartMotionController()self:Switch(false)self.Inputs=Wire_CreateInputs(self,{"A"})self.soundname=Sound("PhysicsCannister.ThrusterLoop")end;function ENT:OnRemove()BaseClass.OnRemove(self)if self.soundname&&self.soundname!=""then self:StopSound(self.soundname)end end;function ENT:SetForce(k,l)if k then self.force=k;self:ShowOutput()end;self.mul=l||1;local h=self:GetPhysicsObject()if!h:IsValid()then Msg("Warning: [",self,"] Physics object isn't valid!\n")return end;if self.neteffect then self.effectforce=self.ThrustOffset:Length()*self.force*self.mul*50;self.updateeffect=true end;if self.mul>0 then self:SetOffset(self.ThrustOffset)else self:SetOffset(self.ThrustOffsetR)end end;function ENT:CalcForce(h)local m=h:LocalToWorldVector(self.ThrustOffset)*self.force*self.mul*-50;local n,o=h:CalculateVelocityOffset(m,h:LocalToWorld(self.ThrustOffset))self.ForceLinear=h:WorldToLocalVector(WireLib.clampForce(n))self.ForceAngular=h:WorldToLocalVector(WireLib.clampForce(o))end;function ENT:SetDatEffect(p,q,r,s)if self:WaterLevel()>0 then if!p then self:SetEffect("none")return end;if r=="same"then self:SetEffect(s)return else self:SetEffect(r)return end else if!q then self:SetEffect("none")return end;self:SetEffect(s)return end end;function ENT:Setup(k,t,u,s,r,q,p,v,w)self:SetForce(k)self:SetDatEffect(p,q,r,s)self.oweffect=s;self.uweffect=r;self.force_min=t;self.force_max=u;self.bidir=v;self.owater=q;self.uwater=p;if!w then w=""end;local x='["?]'if string.find(w,x)then self:StopSound(self.SoundName)w=""end;if w==""then self:StopSound(self.soundname)end;self.soundname=Sound(w)end;function ENT:TriggerInput(y,z)if y=="A"then if self.bidir&&math.abs(z)>0.01&&math.abs(z)>self.force_min||z>0.01&&z>self.force_min then self:Switch(true,math.min(z,self.force_max))else self:Switch(false,0)end end end;function ENT:Think()if self.neteffect&&self.updateeffect then self.updateeffect=false;self:SetNWFloat("Thrust",self.effectforce)end;self:NextThink(CurTime()+0.5)end;function ENT:PhysicsSimulate(h,A)if!self:IsOn()then return SIM_NOTHING end;if self:WaterLevel()>0 then if!self.uwater then self:SetEffect("none")return SIM_NOTHING end;if self.uweffect=="same"then self:SetEffect(self.oweffect)else self:SetEffect(self.uweffect)end else if!self.owater then self:SetEffect("none")return SIM_NOTHING end;self:SetEffect(self.oweffect)end;self:CalcForce(h)return self.ForceAngular,self.ForceLinear,SIM_LOCAL_ACCELERATION end;function ENT:Switch(B,l)if!self:IsValid()then return false end;local C=self:IsOn()!=B;self:SetOn(B)if B then if C&&(self.soundname&&self.soundname!="")then self:StopSound(self.soundname)self:EmitSound(self.soundname)end;self.mul=l;self:SetForce(nil,l)else if self.soundname&&self.soundname!=""then self:StopSound(self.soundname)end;self.mul=0 end;self:ShowOutput()local h=self:GetPhysicsObject()if h:IsValid()then h:Wake()end;return true end;function ENT:ShowOutput()self:SetOverlayText(string.format("Force Mul: %.2f\nModel Mul: %.2f\nInput: %.2f\nForce Applied: %.2f",self.force||0,self.ThrustOffset.z,self.mul||0,(self.force||0)*(self.mul||0)*self.ThrustOffset.z))end;function ENT:OnRestore()local h=self:GetPhysicsObject()if h:IsValid()then h:Wake()end;local i=self:OBBMaxs()local j=self:OBBMins()self.ThrustOffset=Vector(0,0,i.z)self.ThrustOffsetR=Vector(0,0,j.z)self:SetOffset(self.ThrustOffset)self:StartMotionController()BaseClass.OnRestore(self)end;duplicator.RegisterEntityClass("gmod_wire_thruster",WireLib.MakeWireEnt,"Data","force","force_min","force_max","oweffect","uweffect","owater","uwater","bidir","soundname")
--addons/!lpakr_out/lua/entities/gmod_wire_user.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire User"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WireDebugName="User"function ENT:SetupDataTables()self:NetworkVar("Float",0,"BeamLength")end;if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=WireLib.CreateInputs(self,{"Fire"})self:Setup(2048)end;function ENT:Setup(a)if a then self:SetBeamLength(a)end end;function ENT:TriggerInput(b,c)if b=="Fire"&&c!=0 then local d=self:GetPos()local e=util.TraceLine({start=d,endpos=d+self:GetUp()*self:GetBeamLength(),filter={self}})if!IsValid(e.Entity)then return false end;local f=self:GetPlayer()if!IsValid(f)then f=self end;if hook.Run("PlayerUse",f,e.Entity)==false then return false end;if hook.Run("WireUse",f,e.Entity,self)==false then return false end;if e.Entity.Use then e.Entity:Use(f,self,USE_ON,0)else e.Entity:Fire("use","1",0)end end end;duplicator.RegisterEntityClass("gmod_wire_user",WireLib.MakeWireEnt,"Data","Range")
--addons/!lpakr_out/lua/entities/gmod_wire_vehicle.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/ladder_small/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/ladder_small3/shared.lua:
ENT.Type="anim"ENT.Base="ladder_base"ENT.PrintName="Ladder (Small - Runged)"ENT.Category="Ladders"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.Model=Model("models/props/cs_militia/ladderrung.mdl")ENT.RenderGroup=RENDERGROUP_BOTH
--addons/ssrp_lfs/lua/entities/lvs_atrt/cl_camera.lua:

function ENT:CalcViewDriver( ply, pos, angles, fov, pod )
	local view = {}
	view.origin = pos
	view.angles = angles
	view.fov = fov
	view.drawviewer = false

	-- pos is not consistent, not sure why. calculate pos based on vehicle instead
	view.origin = self:LocalToWorld( self:OBBCenter() ) + self:GetUp() * 60

	if not pod:GetThirdPersonMode() then return view end

	local mn = self:OBBMins()
	local mx = self:OBBMaxs()
	local radius = ( mn - mx ):Length()
	local radius = radius + radius * pod:GetCameraDistance()

	local clamped_angles = pod:WorldToLocalAngles( angles )
	clamped_angles.p = math.max( clamped_angles.p, -20 )
	clamped_angles = pod:LocalToWorldAngles( clamped_angles )

	local StartPos = self:LocalToWorld( self:OBBCenter() ) + clamped_angles:Up() * 40
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

function ENT:LVSCalcView( ply, pos, angles, fov, pod )
	if self:GetIsChargingJump() then
		self.FOVModifier = self.FOVModifier or 1

		self.FOVModifier = math.Approach( self.FOVModifier, 0.95, FrameTime() * 0.05 / self.JumpChargeTime )

		fov = fov * self.FOVModifier
	else
		self.FOVModifier = 1
	end
	
	if self:GetDriver() == ply then
		return self:CalcViewDriver( ply, pos, angles, fov, pod )
	end
end
--addons/ssrp_lfs/lua/entities/lvs_base/cl_seatswitcher.lua:
local white = Color( 255, 255, 255,  0 )
local black = Color( 0, 0, 0, 255 )

ENT.IconVehicleLocked = Material( "lvs/locked.png" )

LVS:AddHudEditor( "SeatSwitcher", ScrW() - 360, 0,  350, 30, 350, 30, "SEAT SWITCHER",
	function( self, vehicle, X, Y, W, H, ScrX, ScrY, ply )
		if not IsValid(vehicle) or not vehicle.LVSHudPaintSeatSwitcher or not IsValid(ply) then return end
		vehicle:LVSHudPaintSeatSwitcher( X, Y, W, H, ScrX, ScrY, ply )
	end
)

function ENT:LVSHudPaintSeatSwitcher( X, Y, w, h, ScrX, ScrY, ply )
	local pSeats = self:GetPassengerSeats()
	local SeatCount = table.Count( pSeats )

	if not SeatCount or SeatCount <= 0 then return end

	pSeats[0] = self:GetDriverSeat()

	draw.NoTexture()

	local HasAI = self:GetAI()
	local MySeat = ply:GetVehicle():GetNWInt( "pPodIndex", -1 )

	local Passengers = {}
	for _, player in pairs( player.GetAll() ) do
		if player:lvsGetVehicle() == self then
			local Pod = player:GetVehicle()
			Passengers[ Pod:GetNWInt( "pPodIndex", -1 ) ] = player:GetName()
		end
	end

	if HasAI then
		Passengers[1] = "[AI] "..self.PrintName

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
	local HiderOffset = 200 * ply.smHider
	local xPos = w - 35
	local yPos = ScrH() - 100 -  (SeatCount + 1) * 30 + 5

	white.a = Alpha1
	black.a = 100 + (50 * ply.smHider)
	LVS.ThemeColorAlpha.a = black.a

	local SwapY = false
	local SwapX = false
	local xHider = HiderOffset

	if X < (ScrX * 0.5 - w * 0.5) then
		SwapX = true
		xPos = 0
		xHider = 0
	end

	for _, Pod in pairs( pSeats ) do
		if not IsValid(Pod) then
			continue
		end

		local I = Pod:GetNWInt( "pPodIndex", -1 )
		if I <= 0 then continue end

		if I == MySeat then
			draw.RoundedBox(5, X + xPos - xHider, yPos + I * 30, 35 + HiderOffset, 25, LVS.ThemeColorAlpha )
		else
			draw.RoundedBox(4, X + xPos - xHider, yPos + I * 30, 35 + HiderOffset, 25, black )
		end

		if Hide then
			if Passengers[I] then
				draw.DrawText( Passengers[I], "LVS_FONT_SWITCHER", X + 40 + xPos - xHider, yPos + I * 30 + 2.5, white, TEXT_ALIGN_LEFT )
			else
				draw.DrawText( "-", "LVS_FONT_SWITCHER", X + 40 + xPos - xHider, yPos + I * 30 + 2.5, white, TEXT_ALIGN_LEFT )
			end

			draw.DrawText( "["..I.."]", "LVS_FONT_SWITCHER", X + 17 + xPos - xHider, yPos + I * 30 + 2.5, white, TEXT_ALIGN_CENTER )
		else
			if Passengers[I] then
				draw.DrawText( "["..I.."]", "LVS_FONT_SWITCHER", X + 17 + xPos - xHider, yPos + I * 30 + 2.5, white, TEXT_ALIGN_CENTER )
			else
				draw.DrawText( "["..I.."]", "LVS_FONT_SWITCHER", X + 17 + xPos - xHider, yPos + I * 30 + 2.5, white, TEXT_ALIGN_CENTER )
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

--addons/ssrp_lfs/lua/entities/lvs_base/cl_trailsystem.lua:

ENT.TrailMaterial = Material( "trails/smoke" )
ENT.TrailRed = 255
ENT.TrailGreen = 255
ENT.TrailBlue = 255
ENT.TrailAlpha = 100

function ENT:OnTrail( active, id )
end

function ENT:HandleTrail()
	if not self.RegisteredTrailPositions then return end

	local FT = RealFrameTime()

	local pos = self:GetPos()
	local vel = self:GetVelocity()
	local vel_length = vel:Length()

	for id, data in pairs( self.RegisteredTrailPositions ) do
		local cur_pos = self:LocalToWorld( data.pos )
		local cur_vel = (cur_pos - data.oldpos) / FT

		local cur_velL = math.abs( self:WorldToLocal( pos + cur_vel ).z )

		if cur_velL > data.activation_speed and vel_length > data.min_flight_speed then
			if not data.id then
				data.id = self:StartTrail( data.pos, data.startsize, data.endsize, data.lifetime )
				self:OnTrail( true, data.id )
			end
		else
			if data.id then
				self:OnTrail( false, data.id )
				self:FinishTrail( data.id )
				data.id = nil
			end
		end

		data.oldpos = cur_pos
	end
end

function ENT:RegisterTrail( Pos, StartSize, EndSize, LifeTime, min_flight_speed, activation_speed )
	if not istable( self.RegisteredTrailPositions ) then
		self.RegisteredTrailPositions = {}
	end

	local data = {
		pos = Pos,
		oldpos = self:LocalToWorld( Pos ),
		startsize = StartSize,
		endsize = EndSize,
		lifetime = LifeTime,
		min_flight_speed = min_flight_speed,
		activation_speed = activation_speed,
	}

	table.insert( self.RegisteredTrailPositions, data )
end

function ENT:StartTrail( Pos, StartSize, EndSize, LifeTime )
	if not istable( self.TrailActive ) then
		self.TrailActive = {}
	end

	local ID = 1
	for _,_ in ipairs( self.TrailActive ) do
		ID = ID + 1
	end

	self.TrailActive[ ID ] = {
		lifetime = LifeTime,
		start_size = StartSize,
		end_size = EndSize,
		pos = Pos,
		active = true,
		positions = {},
	}

	return ID
end

function ENT:FinishTrail( ID )
	self.TrailActive[ ID ].active = false
end

function ENT:DrawTrail()
	if not self.TrailActive then return end

	local Time = CurTime()

	self._NextTrail = self._NextTrail or 0

	local Set = self._NextTrail < Time

	render.SetMaterial( self.TrailMaterial )

	for ID, data in pairs( self.TrailActive ) do

		for pos_id, pos_data in pairs( data.positions ) do
			if Time - pos_data.time > data.lifetime then
				data.positions[ pos_id ] = nil
			end
		end

		if Set then
			if data.active then
				local cur_pos = {
					time = Time,
					pos = self:LocalToWorld( data.pos ),
				}

				table.insert( data.positions, cur_pos )
				table.sort( data.positions, function( a, b ) return a.time > b.time end )
			end
		end

		local num = #data.positions

		if num == 0 then 
			if not data.active then
				self.TrailActive[ ID ] = nil
			end

			continue
		end

		render.StartBeam( num )

		for _, pos_data in ipairs( data.positions ) do
			local Scale = (pos_data.time + data.lifetime - Time) / data.lifetime
			local InvScale = 1 - Scale

			render.AddBeam( pos_data.pos, data.start_size * Scale + data.end_size * InvScale, pos_data.time * 50, Color( self.TrailRed, self.TrailGreen, self.TrailBlue, self.TrailAlpha * Scale ^ 2 ) )
		end

		render.EndBeam()
	end

	if Set then
		self._NextTrail = Time + 0.025
	end
end

--addons/ssrp_lfs/lua/entities/lvs_fakehover_iftx/sh_turret.lua:

function ENT:FireTurret( weapon )
	local T = CurTime()

	if (weapon._NextFire or 0) > T then return end

	weapon._NextFire = T + 0.1

	local ID = self:LookupAttachment( "muzzle_ballturret_left" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return end

	local dir = Muzzle.Ang:Up()
	local pos = Muzzle.Pos

	local bullet = {}
	bullet.Src = pos
	bullet.Dir = dir
	bullet.Spread = Vector( 0.035,  0.035, 0.035 )
	bullet.TracerName = "lvs_laser_blue_short"
	bullet.Force = 25
	bullet.HullSize = 25
	bullet.Damage = 15
	bullet.Velocity = 8000
	bullet.Attacker = weapon:GetDriver()
	bullet.Callback = function(att, tr, dmginfo)
		local effectdata = EffectData()
		effectdata:SetStart( Vector(50,50,255) )
		effectdata:SetOrigin( tr.HitPos )
		effectdata:SetNormal( tr.HitNormal )
		util.Effect( "lvs_laser_impact", effectdata )
	end

	weapon:LVSFireBullet( bullet )
	weapon:EmitSound("lvs/vehicles/iftx/fire_turret.mp3", 85, 100 + math.cos( CurTime() * 0.5 + self:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1, CHAN_WEAPON )

	local effectdata = EffectData()
	effectdata:SetStart( Vector(50,50,255) )
	effectdata:SetOrigin( bullet.Src )
	effectdata:SetNormal( dir )
	effectdata:SetEntity( weapon )
	util.Effect( "lvs_muzzle_colorable", effectdata )
end

function ENT:CanUseBTL()
	return self:GetBodygroup(1) == 0
end

function ENT:CanUseTurret()
	return self:GetBodygroup(1) == 1
end

function ENT:TraceBTL()
	local ID = self:LookupAttachment( "muzzle_ballturret_left" )
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

function ENT:SetPoseParameterBTL( weapon )
	if self:GetIsCarried() then
		self:SetPoseParameter("turret_pitch", 0 )
		self:SetPoseParameter("turret_yaw",  0 )

		return
	end

	if not IsValid( weapon:GetDriver() ) and not weapon:GetAI() then return end

	local AimAng = weapon:WorldToLocal( weapon:GetPos() + weapon:GetAimVector() ):Angle()
	AimAng:Normalize()

	self:SetPoseParameter("turret_pitch", AimAng.p )
	self:SetPoseParameter("turret_yaw",  AimAng.y )
end

function ENT:InitTurret()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/laserbeam.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0.25
	weapon.HeatRateDown = 0.3
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/overheat.wav")
	end
	weapon.Attack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if base:GetIsCarried() then return true end

		if not base:CanUseBTL() then
			if not base:CanUseTurret() then return true end

			base:FireTurret( ent )

			return
		end

		local trace = base:TraceBTL()

		base:BallturretDamage( trace.Entity, ent:GetDriver(), trace.HitPos, (trace.HitPos - ent:GetPos()):GetNormalized() )
	end
	weapon.StartAttack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if base:GetIsCarried() then return end

		if not base:CanUseBTL() then return end

		base:SetBTLFire( true )

		if not IsValid( self.sndBTL ) then return end

		self.sndBTL:Play()
		self.sndBTL:EmitSound( "lvs/vehicles/laat/ballturret_fire.mp3", 110 )
	end
	weapon.FinishAttack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		base:SetBTLFire( false )

		if not IsValid( self.sndBTL ) then return end

		self.sndBTL:Stop()
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		base:SetPoseParameterBTL( ent )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if base:GetIsCarried() then return end

		if not base:CanUseBTL() and not base:CanUseTurret() then return end

		local Pos2D = base:TraceBTL().HitPos:ToScreen()

		base:PaintCrosshairCenter( Pos2D, color_white )
		base:PaintCrosshairOuter( Pos2D, color_white )
		base:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon, 2 )
end

--addons/ssrp_lfs/lua/entities/lvs_fakehover_iftx/cl_prediction.lua:

function ENT:PredictPoseParamaters()
	local pod = self:GetGunnerSeat()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if ply ~= plyL then return end

	self:SetPoseParameterBTL( pod:lvsGetWeapon() )

	self:InvalidateBoneCache()
end
--addons/ssrp_lfs/lua/entities/lvs_fakehover_x34/shared.lua:
ENT.Base = "lvs_base_fakehover"

ENT.PrintName = "x34 - Unarmed"
ENT.Author = "niksacokica"
ENT.Information = ""
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable = true
ENT.AdminSpawnable = false

ENT.MDL = "models/niksacokica/x-34/x-34.mdl"
ENT.GibModels = {}

ENT.AITEAM = 2

ENT.MaxHealth = 500

ENT.ForceAngleMultiplier = 2
ENT.ForceAngleDampingMultiplier = 1

ENT.ForceLinearMultiplier = 1
ENT.ForceLinearRate = .1

ENT.MaxVelocityX = 1200
ENT.MaxVelocityY = 400

ENT.MaxTurnRate = 1

ENT.BoostAddVelocityX = 500
ENT.BoostAddVelocityY = 120

ENT.GroundTraceHitWater = true
ENT.GroundTraceLength = 50
ENT.GroundTraceHull = 100

ENT.LAATC_PICKUPABLE = false

function ENT:InitWeapons()
end

ENT.EngineSounds = {
	{
		sound = "niksacokica/x-34/engine_loop.wav",
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
}
--addons/ssrp_lfs/lua/entities/lvs_fighterplane_engine.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.Spawnable       = false
ENT.AdminSpawnable  = false
ENT.DoNotDuplicate = true

ENT._LVS = true

function ENT:SetupDataTables()
	self:NetworkVar( "Entity",0, "Base" )
end

if SERVER then
	function ENT:Initialize()
		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_NONE )
		self:DrawShadow( false )
	end

	function ENT:Think()
		return false
	end

	function ENT:OnTakeDamage( dmginfo )
	end

	function ENT:UpdateTransmitState()
		return TRANSMIT_ALWAYS
	end

	return
end

ENT._oldEnActive = false
ENT._ActiveSounds = {}

function ENT:Initialize()
end

function ENT:StopSounds()
	for id, sound in pairs( self._ActiveSounds ) do
		if istable( sound ) then
			for _, snd in pairs( sound ) do
				if snd then
					snd:Stop()
				end
			end
		else
			sound:Stop()
		end
		self._ActiveSounds[ id ] = nil
	end
end

function ENT:HandleEngineSounds( vehicle )
	local ply = LocalPlayer()
	local pod = ply:GetVehicle()
	local Throttle = vehicle:GetThrottle() - vehicle:GetThrustStrenght() * vehicle:GetThrottle() * 0.5
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

	local FT = RealFrameTime()

	self._smTHR = self._smTHR and self._smTHR + (Throttle - self._smTHR) * FT or 0

	for id, sound in pairs( self._ActiveSounds ) do
		if not sound then continue end

		local data = self.EngineSounds[ id ]

		local Pitch = math.Clamp( data.Pitch + self._smTHR * data.PitchMul, data.PitchMin, data.PitchMax )
		local PitchMul = data.UseDoppler and Doppler or 1

		local InActive = self._smTHR > data.FadeOut or self._smTHR < data.FadeIn
		if data.FadeOut >= 1 and self._smTHR > 1 then
			InActive = false
		end

		local Volume = InActive and 0 or LVS:GetVolume()

		if data.VolumeMin and data.VolumeMax and not InActive then
			Volume = math.max(self._smTHR - data.VolumeMin,0) / (1 - data.VolumeMin) * data.VolumeMax * LVS:GetVolume()
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

function ENT:OnEngineActiveChanged( Active )
	if not Active then self:StopSounds() end

	for id, data in pairs( self.EngineSounds ) do
		if not isstring( data.sound ) then continue end

		self.EngineSounds[ id ].Pitch = data.Pitch or 80
		self.EngineSounds[ id ].PitchMin = data.PitchMin or 0
		self.EngineSounds[ id ].PitchMax = data.PitchMax or 255
		self.EngineSounds[ id ].PitchMul = data.PitchMul or 100
		self.EngineSounds[ id ].UseDoppler = data.UseDoppler ~= false
		self.EngineSounds[ id ].FadeIn = data.FadeIn or 0
		self.EngineSounds[ id ].FadeOut = data.FadeOut or 1
		self.EngineSounds[ id ].FadeSpeed = data.FadeSpeed or 1.5
		self.EngineSounds[ id ].SoundLevel = data.SoundLevel or 85

		local sound = CreateSound( self, data.sound )
		sound:SetSoundLevel( data.SoundLevel )
		sound:PlayEx(0,100)

		if data.sound_int and data.sound_int ~= data.sound then
			if data.sound_int == "" then
				self._ActiveSounds[ id ] = {
					ext = sound,
					int = false,
				}
			else
				local sound_interior = CreateSound( self, data.sound_int )
				sound_interior:SetSoundLevel( data.SoundLevel )
				sound_interior:PlayEx(0,100)

				self._ActiveSounds[ id ] = {
					ext = sound,
					int = sound_interior,
				}
			end
		else
			self._ActiveSounds[ id ] = sound
		end
	end
end

function ENT:Think()
	local vehicle = self:GetBase()

	if not IsValid( vehicle ) then return end

	self:DamageFX( vehicle )

	if not self.EngineSounds then
		self.EngineSounds = vehicle.EngineSounds

		return
	end

	local EngineActive = vehicle:GetEngineActive()

	if self._oldEnActive ~= EngineActive then
		self._oldEnActive = EngineActive
		self:OnEngineActiveChanged( EngineActive )
	end

	if EngineActive then
		self:HandleEngineSounds( vehicle )
	else
		self._smTHR = 0
	end
end

function ENT:OnRemove()
	self:StopSounds()
end

function ENT:Draw()
end

function ENT:DrawTranslucent()
end

function ENT:DamageFX( vehicle )
	local T = CurTime()
	local HP = vehicle:GetHP()
	local MaxHP = vehicle:GetMaxHP()

	if HP <= 0 or HP > MaxHP * 0.5 or (self.nextDFX or 0) > T then return end

	self.nextDFX = T + 0.05

	local effectdata = EffectData()
		effectdata:SetOrigin( self:GetPos() )
		effectdata:SetEntity( vehicle )
	util.Effect( "lvs_engine_blacksmoke", effectdata )
end

--addons/ssrp_lfs/lua/entities/lvs_fighterplane_wheel.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.Spawnable       = false
ENT.AdminSpawnable  = false
ENT.DoNotDuplicate = true
ENT.lvsDoNotGrab = true

if SERVER then
	function ENT:Initialize()	
		self:SetModel( "models/props_vehicles/tire001c_car.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:DrawShadow( false )
	end

	function ENT:SetBrakes( active )
		if not self._CanUseBrakes then
			actuve = false
		end

		if active ~= self._BrakesActive then
			self._BrakesActive = active

			if active then
				self:StartMotionController()
			else
				self:StopMotionController()
			end
		end
	end

	function ENT:SetBrakeForce( force )
		self._BrakeForce = force
	end

	function ENT:GetBrakeForce()
		return (self._BrakeForce or 25)
	end

	function ENT:Define( data )
		local bbox = Vector(data.radius,data.radius,data.radius)

		self:PhysicsInitSphere( data.radius, data.physmat )
		self:SetCollisionBounds( -bbox, bbox )

		local PhysObj = self:GetPhysicsObject()
		if IsValid( PhysObj ) then
			PhysObj:SetMass( data.mass )
		end

		self._CanUseBrakes = data.brake
	end

	function ENT:PhysicsSimulate( phys, deltatime )
		local BrakeForce = Vector( -phys:GetAngleVelocity().x, 0, 0 ) * self:GetBrakeForce()

		return BrakeForce, Vector(0,0,0), SIM_LOCAL_ACCELERATION
	end

	function ENT:SetBase( ent )
		self._baseEnt = ent
	end

	function ENT:GetBase()
		return self._baseEnt
	end

	function ENT:Use( ply )
	end

	function ENT:Think()
		return false
	end

	function ENT:OnRemove()
	end

	function ENT:PhysicsCollide( data, physobj )
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
end

function ENT:Draw()
end

function ENT:OnRemove()
end

--addons/ssrp_lfs/lua/entities/lvs_missile.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.PrintName = "Missile"
ENT.Author = "Luna"
ENT.Information = "LVS Missile"
ENT.Category = "[LVS]"

ENT.Spawnable		= true
ENT.AdminOnly		= false

ENT.ExplosionEffect = "lvs_explosion_small"

ENT.lvsProjectile = true

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Active" )
	self:NetworkVar( "Entity", 0, "NWTarget" )
end

if SERVER then
	util.AddNetworkString( "lvs_missile_hud" )

	function ENT:FindTarget( pos, forward, cone_ang, cone_len )
		local targets = {
			[1] = player.GetAll(),
			[2] = LVS:GetVehicles(),
			[3] = LVS:GetNPCs(),
		}

		local Attacker = self:GetAttacker()
		local Parent = self:GetParent()
		local Owner = self:GetOwner()
		local Target = NULL
		local DistToTarget = 0

		for _, tbl in ipairs( targets ) do
			for _, ent in pairs( tbl ) do
				if not IsValid( ent ) or ent == Parent or ent == Owner or Target == ent or Attacker == ent then continue end

				local pos_ent = ent:GetPos()
				local dir = (pos_ent - pos):GetNormalized()
				local ang = math.deg( math.acos( math.Clamp( forward:Dot( dir ) ,-1,1) ) )

				if ang > cone_ang then continue end

				local dist, _, _ = util.DistanceToLine( pos, pos + forward * cone_len, pos_ent )

				if not IsValid( Target ) then
					Target = ent
					DistToTarget = dist

					continue
				end

				if dist < DistToTarget then
					Target = ent
					DistToTarget = dist
				end
			end
		end

		self:SetTarget( Target )

		local ply = self:GetAttacker()

		if not IsValid( ply ) or not ply:IsPlayer() then return end

		net.Start( "lvs_missile_hud", true )
			net.WriteEntity( self )
		net.Send( ply )
	end

	function ENT:SetEntityFilter( filter )
		if not istable( filter ) then return end

		self._FilterEnts = {}

		for _, ent in pairs( filter ) do
			self._FilterEnts[ ent ] = true
		end
	end
	function ENT:SetTarget( ent ) self:SetNWTarget( ent ) end
	function ENT:SetDamage( num ) self._dmg = num end
	function ENT:SetThrust( num ) self._thrust = num end
	function ENT:SetSpeed( num ) self._speed = num end
	function ENT:SetTurnSpeed( num ) self._turnspeed = num end
	function ENT:SetRadius( num ) self._radius = num end
	function ENT:SetAttacker( ent ) self._attacker = ent end

	function ENT:GetAttacker() return self._attacker or NULL end
	function ENT:GetDamage() return (self._dmg or 450) end
	function ENT:GetRadius() return (self._radius or 250) end
	function ENT:GetSpeed() return (self._speed or 4000) end
	function ENT:GetTurnSpeed() return (self._turnspeed or 1) * 100 end
	function ENT:GetThrust() return (self._thrust or 500) end
	function ENT:GetTarget()
		if IsValid( self:GetNWTarget() ) then
			local Pos = self:GetPos()
			local tPos = self:GetTargetPos()

			local Sub = tPos - Pos
			local Len = Sub:Length()
			local Dir = Sub:GetNormalized()
			local Forward = self:GetForward()

			local AngToTarget = math.deg( math.acos( math.Clamp( Forward:Dot( Dir ) ,-1,1) ) )

			local LooseAng = math.min( Len / 100, 90 )

			if AngToTarget > LooseAng then
				self:SetNWTarget( NULL )
			end
		end

		return self:GetNWTarget()
	end
	function ENT:GetTargetPos()
		local Target = self:GetNWTarget()

		if not IsValid( Target ) then return Vector(0,0,0) end

		if isfunction( Target.GetShield ) then
			if Target:GetShield() > 0 then
				return Target:LocalToWorld( VectorRand() * math.random( -1000, 1000 ) )
			end
		end

		if isfunction( Target.GetMissileOffset ) then
			return Target:LocalToWorld( Target:GetMissileOffset() )
		end

		return Target:GetPos()
	end

	function ENT:SpawnFunction( ply, tr, ClassName )

		local ent = ents.Create( ClassName )
		ent:SetPos( ply:GetShootPos() )
		ent:SetAngles( ply:EyeAngles() )
		ent:Spawn()
		ent:Activate()
		ent:SetAttacker( ply )
		ent:Enable()

		return ent
	end

	function ENT:Initialize()
		self:SetModel( "models/weapons/w_missile_launch.mdl" )
		self:SetMoveType( MOVETYPE_NONE )
		self:SetRenderMode( RENDERMODE_TRANSALPHA )
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
		self:SetCollisionGroup( COLLISION_GROUP_NONE )
		self:PhysWake()

		self.IsEnabled = true

		local pObj = self:GetPhysicsObject()

		if not IsValid( pObj ) then
			self:Remove()

			print("LVS: missing model. Missile terminated.")

			return
		end

		pObj:SetMass( 1 )
		pObj:EnableGravity( false )
		pObj:EnableMotion( true )
		pObj:EnableDrag( false )

		self:SetTrigger( true )

		self:StartMotionController()

		self:PhysWake()

		self.SpawnTime = CurTime()

		self:SetActive( true )
	end

	function ENT:PhysicsSimulate( phys, deltatime )
		phys:Wake()

		local Thrust = self:GetThrust()
		local Speed = self:GetSpeed()
		local Pos = self:GetPos()
		local velL = self:WorldToLocal( Pos + self:GetVelocity() )

		local ForceLinear = (Vector( Speed * Thrust,0,0) - velL) * deltatime

		local Target = self:GetTarget()

		if not IsValid( Target ) then
			return (-phys:GetAngleVelocity() * 250 * deltatime), ForceLinear, SIM_LOCAL_ACCELERATION
		end

		local AngForce = -self:WorldToLocalAngles( (self:GetTargetPos() - Pos):Angle() )

		local ForceAngle = (Vector(AngForce.r,-AngForce.p,-AngForce.y) * self:GetTurnSpeed() - phys:GetAngleVelocity() * 5 ) * 250 * deltatime

		return ForceAngle, ForceLinear, SIM_LOCAL_ACCELERATION
	end

	function ENT:Think()
		local T = CurTime()

		self:NextThink( T + 1 )

		if not self.SpawnTime then return true end

		if (self.SpawnTime + 12) < T then
			self:Detonate()
		end

		return true
	end

	ENT.IgnoreCollisionGroup = {
		[COLLISION_GROUP_NONE] = true,
		[COLLISION_GROUP_WORLD] =  true,
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

		self:Detonate()
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

		if IsValid( target ) and not target:IsNPC() then
			Pos = target:GetPos() -- place explosion inside the hit targets location so they receive full damage. This fixes all the garbage code the LFS' missile required in order to deliver its damage
		end

		local attacker = self:GetAttacker()

		util.BlastDamage( self, IsValid( attacker ) and attacker or game.GetWorld(), Pos, self:GetRadius(), self:GetDamage() )

		SafeRemoveEntityDelayed( self, FrameTime() )
	end
else
	function ENT:Initialize()
	end

	function ENT:Enable()
		if self.IsEnabled then return end

		self.IsEnabled = true

		self.snd = CreateSound(self, "weapons/rpg/rocket1.wav")
		self.snd:SetSoundLevel( 80 )
		self.snd:Play()

		local effectdata = EffectData()
			effectdata:SetOrigin( self:GetPos() )
			effectdata:SetEntity( self )
		util.Effect( "lvs_missiletrail", effectdata )
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

	function ENT:Draw()
		if not self:GetActive() then return end

		self:DrawModel()
	end

	function ENT:Think()
		if self.snd then
			self.snd:ChangePitch( 100 * self:CalcDoppler() )
		end

		if self.IsEnabled then return end

		if self:GetActive() then
			self:Enable()
		end
	end

	function ENT:SoundStop()
		if self.snd then
			self.snd:Stop()
		end
	end

	function ENT:OnRemove()
		self:SoundStop()
	end

	local function DrawDiamond( X, Y, radius, angoffset )
		angoffset = angoffset or 0

		local segmentdist = 90
		local radius2 = radius + 1

		for ang = 0, 360, segmentdist do
			local a = ang + angoffset
			surface.DrawLine( X + math.cos( math.rad( a ) ) * radius, Y - math.sin( math.rad( a ) ) * radius, X + math.cos( math.rad( a + segmentdist ) ) * radius, Y - math.sin( math.rad( a + segmentdist ) ) * radius )
			surface.DrawLine( X + math.cos( math.rad( a ) ) * radius2, Y - math.sin( math.rad( a ) ) * radius2, X + math.cos( math.rad( a + segmentdist ) ) * radius2, Y - math.sin( math.rad( a + segmentdist ) ) * radius2 )
		end
	end

	local color_red = Color(255,0,0,255)
	local HudTargets = {}
	hook.Add( "HUDPaint", "!!!!lvs_missile_hud", function()
		local T = CurTime()

		local Index = 0

		surface.SetDrawColor( 255, 0, 0, 255 )

		for ID, _ in pairs( HudTargets ) do
			local Missile = Entity( ID )

			if not IsValid( Missile ) then
				HudTargets[ ID ] = nil

				continue
			end

			local Target = Missile:GetNWTarget()

			if not IsValid( Target ) then
				HudTargets[ ID ] = nil

				continue
			end

			local MissilePos = Missile:GetPos():ToScreen()
			local TargetPos = Target:LocalToWorld( Target:OBBCenter() ):ToScreen()

			Index =  Index + 1

			if not TargetPos.visible then continue end

			DrawDiamond( TargetPos.x, TargetPos.y, 40, ID * 1337 - T * 100 )

			if isfunction( Target.GetShield ) and Target:GetShield() > 0 then
				draw.DrawText("WEAK LOCK", "LVS_FONT", TargetPos.x + 20, TargetPos.y + 20, color_red, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
			else
				draw.DrawText(" FULL LOCK", "LVS_FONT", TargetPos.x + 20, TargetPos.y + 20, color_red, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
			end

			-- if not MissilePos.visible then continue end

			DrawDiamond( MissilePos.x, MissilePos.y, 16, ID * 1337 - T * 100 )
			draw.DrawText( Index, "LVS_FONT", MissilePos.x + 10, MissilePos.y + 10, color_red, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

			surface.DrawLine( MissilePos.x, MissilePos.y, TargetPos.x, TargetPos.y )
		end
	end )

	net.Receive( "lvs_missile_hud", function( len )
		local ent = net.ReadEntity()

		if not IsValid( ent ) then return end

		HudTargets[ ent:EntIndex() ] = true
	end )
end
--addons/ssrp_lfs/lua/entities/lvs_soundemitter.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.Spawnable       = false
ENT.AdminSpawnable  = false
ENT.DoNotDuplicate = true

ENT._LVS = true

function ENT:SetupDataTables()
	self:NetworkVar( "Entity",0, "Base" )

	self:NetworkVar( "Bool",0, "Active" )

	self:NetworkVar( "String",1, "Sound")
	self:NetworkVar( "String",2, "SoundInterior")

	self:NetworkVar( "Int",0, "SoundLevel" )

	if SERVER then
		self:SetSoundLevel( 110 )
	end
end

if SERVER then
	util.AddNetworkString( "lvs_soundemitter_playonce" )

	function ENT:Initialize()
		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_NONE )
		self:DrawShadow( false )
		debugoverlay.Cross( self:GetPos(), 50, 5, Color( 150, 150, 150 ) )
	end

	function ENT:Think()
		return false
	end

	function ENT:UpdateTransmitState()
		return TRANSMIT_ALWAYS
	end

	function ENT:PlayOnce( pitch, volume )
		net.Start( "lvs_soundemitter_playonce", true )
			net.WriteEntity( self )
			net.WriteInt( pitch or 100, 9 )
			net.WriteFloat( volume or 1 )
		net.SendPVS( self:GetPos() )
	end

	function ENT:Play()
		self:SetActive( true )
	end

	function ENT:Stop()
		self:SetActive( false )
	end

	return
end

net.Receive( "lvs_soundemitter_playonce", function( len )
	local ent = net.ReadEntity()

	if not IsValid( ent ) or not ent.PlayOnce then return end

	ent:PlayOnce( net.ReadInt( 9 ), net.ReadFloat() )
end )

function ENT:PlayOnce( pitch, volume )
	local ply = LocalPlayer()
	local veh = ply:lvsGetVehicle()

	local snd = self:GetSound()
	local snd_int = self:GetSoundInterior()

	if snd == snd_int then self:EmitSound( snd, self:GetSoundLevel(), pitch, volume, CHAN_WEAPON ) return end

	if IsValid( veh ) and veh == self:GetBase() and ply:GetViewEntity() == ply then
		local pod = ply:GetVehicle()

		if IsValid( pod ) then
			if pod:GetThirdPersonMode() then
				self:EmitSound( snd, self:GetSoundLevel(), pitch, volume, CHAN_WEAPON )
			else
				self:EmitSound( snd_int, self:GetSoundLevel(), pitch, volume, CHAN_WEAPON )
			end
		else
			self:EmitSound( snd, self:GetSoundLevel(), pitch, volume, CHAN_WEAPON )
		end
	else
		self:EmitSound( snd, self:GetSoundLevel(), pitch, volume, CHAN_WEAPON )
	end
end

function ENT:Initialize()
end

function ENT:RemoveSounds()
	if self.snd then
		self.snd:Stop()
		self.snd = nil
	end

	if self.snd_int then
		self.snd_int:Stop()
		self.snd_int = nil
	end
end

function ENT:HandleSounds()
	if not self.snd_int then return end

	local ply = LocalPlayer()
	local veh = ply:lvsGetVehicle()

	if IsValid( veh ) and veh == self:GetBase() and ply:GetViewEntity() == ply then
		local pod = ply:GetVehicle()

		if IsValid( pod ) then
			if pod:GetThirdPersonMode() then
				if self.snd then self.snd:ChangeVolume( 1 ) end
				if self.snd_int then self.snd_int:ChangeVolume( 0 ) end
			else
				if self.snd then self.snd:ChangeVolume( 0 ) end
				if self.snd_int then self.snd_int:ChangeVolume( 1 ) end
			end
		else
			if self.snd then self.snd:ChangeVolume( 1 ) end
			if self.snd_int then self.snd_int:ChangeVolume( 0 ) end
		end
	else
		if self.snd then self.snd:ChangeVolume( 1 ) end
		if self.snd_int then self.snd_int:ChangeVolume( 0 ) end
	end
end

function ENT:StartSounds()
	local snd = self:GetSound()
	local snd_int = self:GetSoundInterior()

	if snd ~= "" then
		self.snd = CreateSound( self, snd )
		self.snd:SetSoundLevel( self:GetSoundLevel() )
		self.snd:PlayEx(0,100)
	end

	if snd == snd_int or snd_int == "" or LocalPlayer():lvsGetVehicle() ~= self:GetBase() then
		if self.snd then self.snd:ChangeVolume( 1, 0 ) end

		return
	end

	self.snd_int = CreateSound( self, snd_int )
	self.snd_int:SetSoundLevel( self:GetSoundLevel() )
	self.snd_int:PlayEx(0,100)
end

function ENT:StopSounds()
	self.NextActive = CurTime() + 0.12

	if self.snd then
		self.snd:ChangeVolume( 0, 0.1 )
	end

	if self.snd_int then
		self.snd_int:ChangeVolume( 0, 0.1 )
	end

	timer.Simple(0.11, function()
		if not IsValid( self ) then return end
		self:RemoveSounds()
	end)
end

function ENT:OnActiveChanged( Active )
	if Active then
		self:StartSounds()
	else
		self:StopSounds()
	end
end

ENT._oldActive = false
function ENT:Think()
	local Active = self:GetActive() and (self.NextActive or 0) < CurTime()

	if self._oldActive ~= Active then
		self._oldActive = Active
		self:OnActiveChanged( Active )
	end

	if Active then
		self:HandleSounds()
	end
end

function ENT:OnRemove()
	self:RemoveSounds()
end

function ENT:Draw()
end

function ENT:DrawTranslucent()
end

--addons/ssrp_lfs/lua/entities/lvs_starfighter_arc170/cl_init.lua:
include("shared.lua")

ENT.EngineColor = Color( 255, 50, 0, 255)
ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EnginePos = {
	Vector(-163.81,64.51,8.36),
	Vector(-163.81,-64.51,8.36),
}

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-34,326,-13), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-34,-326,-13), 0, 20, 2, 1000, 150 )
end

function ENT:OnFrame()
	self:EngineEffects()
	self:AnimAstromech()
	self:AnimWings()
	self:AnimGunner()
end

function ENT:EngineEffects()
	if not self:GetEngineActive() then return end

	local T = CurTime()

	if (self.nextEFX or 0) > T then return end

	self.nextEFX = T + 0.01

	local THR = self:GetThrottle()

	local emitter = self:GetParticleEmitter( self:GetPos() )

	if not IsValid( emitter ) then return end

	for _, pos in pairs( self.EnginePos ) do
		local vOffset = self:LocalToWorld( pos )
		local vNormal = -self:GetForward()

		vOffset = vOffset + vNormal * 5

		local particle = emitter:Add( "effects/muzzleflash2", vOffset )

		if not particle then continue end

		particle:SetVelocity( vNormal * (math.Rand(500,1000) + self:GetBoost() * 10) + self:GetVelocity() )
		particle:SetLifeTime( 0 )
		particle:SetDieTime( 0.1 )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(15,25) )
		particle:SetEndSize( math.Rand(0,10) )
		particle:SetRoll( math.Rand(-1,1) * 100 )
		particle:SetColor( 255, 50, 200 )
	end
end

function ENT:AnimGunner()
	local Pod = self:GetTailGunnerSeat()

	if not IsValid( Pod ) then return end

	local weapon = Pod:lvsGetWeapon()

	if not IsValid( weapon ) then return end

	local EyeAngles = self:WorldToLocalAngles( weapon:GetAimVector():Angle() )
	EyeAngles:RotateAroundAxis( EyeAngles:Up(), 180 )

	local Yaw = math.Clamp( EyeAngles.y,-60,60)
	local Pitch = math.Clamp( EyeAngles.p,-60,60 )

	self:ManipulateBoneAngles( 5, Angle(Yaw,0,0) )
	self:ManipulateBoneAngles( 6, Angle(0,0, math.max( Pitch, -25 ) ) )

	self:ManipulateBoneAngles( 2, Angle( math.Clamp( Yaw, -30, 30 ),0,0) )
	self:ManipulateBoneAngles( 3, Angle(0,0, math.Clamp( Pitch, -60, 12 ) ) )
end

function ENT:AnimAstromech()
	local T = CurTime()

	if (self.nextAstro or 0) < T then
		self.nextAstro = T + math.Rand(0.5,2)
		self.AstroAng = math.Rand(-180,180)

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

	self.smastro = self.smastro and (self.smastro + ((self.AstroAng or 0) - self.smastro) * RealFrameTime() * 10) or 0

	self:ManipulateBoneAngles( 1, Angle(self.smastro,0,0) )
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

	local Ang = (1 - self._sm_wing) * 20

	self:ManipulateBoneAngles( 8, Angle(0,-Ang,0) )
	self:ManipulateBoneAngles( 9, Angle(0,Ang,0) )
	
	self:ManipulateBoneAngles( 10, Angle(0,Ang,0) )
	self:ManipulateBoneAngles( 11, Angle(0,-Ang,0) )

	self:InvalidateBoneCache()
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

--addons/ssrp_lfs/lua/entities/lvs_starfighter_vulturedroid/cl_init.lua:
include("shared.lua")

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-151,87,15), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-151,-87,15), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-151,87,-15), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-151,-87,-15), 0, 20, 2, 1000, 150 )
end

function ENT:OnFrame()
end

ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EngineFXColor = Color( 38, 0, 230, 255)
ENT.EngineFxPos = {
	Vector(-49.5,-45.31,1.9),
	Vector(-47,-48.39,1.8),
	Vector(-45,-51.55,1.7),
	Vector(-43,-54.71,1.6),
	Vector(-41,-57.97,1.5),
	Vector(-39,-60.82,1.4),
	Vector(-49.5,45.31,1.9),
	Vector(-47,48.39,1.8),
	Vector(-45,51.55,1.7),
	Vector(-43,54.71,1.6),
	Vector(-41,57.97,1.5),
	Vector(-39,60.82,1.4),
	Vector(-49.5,-45.31,-1.9),
	Vector(-47,-48.39,-1.8),
	Vector(-45,-51.55,-1.7),
	Vector(-43,-54.71,-1.6),
	Vector(-41,-57.97,-1.5),
	Vector(-39,-60.82,-1.4),
	Vector(-49.5,45.31,-1.9),
	Vector(-47,48.39,-1.8),
	Vector(-45,51.55,-1.7),
	Vector(-43,54.71,-1.6),
	Vector(-41,57.97,-1.5),
	Vector(-39,60.82,-1.4),
}

local offset = Vector(-36.2,-62.6,0)
local offset2 = Vector(-36.2,-62.6,0)
local roll = Angle(0,299,90)
local roll2 = Angle(0,61,-90)

function ENT:PostDraw(scale)
	if not self:GetEngineActive() then return end

	cam.Start3D2D( self:LocalToWorld(offset * scale), self:LocalToWorldAngles(roll), 1 )
		draw.NoTexture()
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRectRotated( -11, -1.5, 19.7, 6 , -3.4 )
		surface.DrawTexturedRectRotated( -11, 1.5, 19.7, 6 , 3.4 )
	cam.End3D2D()

	cam.Start3D2D( self:LocalToWorld(offset2 * scale), self:LocalToWorldAngles(roll2), 1 )
		draw.NoTexture()
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRectRotated( -11, -1.5, 19.7, 6 , -3.4 )
		surface.DrawTexturedRectRotated( -11, 1.5, 19.7, 6 , 3.4 )
	cam.End3D2D()
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

--addons/ssrp_lfs/lua/entities/lvs_starfighter_vwing/cl_init.lua:
include("shared.lua")

ENT.EngineColor = Color( 255, 220, 150, 255)
ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EngineCenter = Material( "vgui/circle" )
ENT.EnginePos = {
	[1] = Vector(-155,0,76.85),
	[2] = Vector(-155,0,41.82),
}

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	if self:GetDriver() == ply and not pod:GetThirdPersonMode() then
		local newpos = pos + self:GetForward() * 37 + self:GetUp() * 8

		return newpos, angles, fov
	else
		return pos, angles, fov
	end
end

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-152,55,55), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-152,-55,55), 0, 20, 2, 1000, 150 )
end

function ENT:OnFrame()
	self:EngineEffects()
	self:AnimWings()
end

function ENT:AnimWings()
	self._sm_wing = self._sm_wing or 1

	local target_wing = self:GetFoils() and 0 or 1
	local RFT = RealFrameTime() * (0.5 + math.abs( math.sin( self._sm_wing * math.pi ) ) * 0.5)
	local RateUp = RFT * 2
	local RateDown = RFT * 1.5

	self._sm_wing = self._sm_wing + math.Clamp(target_wing - self._sm_wing,-RateDown,RateUp)

	local DoneMoving = self._sm_wing == 1 or self._sm_wing == 0

	if self._oldDoneMoving ~= DoneMoving then
		self._oldDoneMoving = DoneMoving
		if not DoneMoving then
			self:EmitSound("lvs/vehicles/vwing/sfoils.wav")
		end
	end

	self:SetPoseParameter( "wings", 1 - self._sm_wing )

	self:InvalidateBoneCache()
end

function ENT:EngineEffects()
	if not self:GetEngineActive() then return end

	local T = CurTime()

	if (self.nextEFX or 0) > T then return end

	self.nextEFX = T + 0.01

	local THR = self:GetThrottle()

	local emitter = self:GetParticleEmitter( self:GetPos() )

	if not IsValid( emitter ) then return end

	for _, pos in pairs( self.EnginePos ) do
		local vOffset = self:LocalToWorld( pos )
		local vNormal = -self:GetForward()

		vOffset = vOffset + vNormal * 5

		local particle = emitter:Add( "effects/muzzleflash2", vOffset )

		if not particle then continue end

		particle:SetVelocity( vNormal * math.Rand(500,1000) + self:GetVelocity() )
		particle:SetLifeTime( 0 )
		particle:SetDieTime( 0.1 )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(15,25) )
		particle:SetEndSize( math.Rand(0,10) )
		particle:SetRoll( math.Rand(-1,1) * 100 )
		particle:SetColor( 255, 200, 50 )
	end
end

local offset = Vector(-136,0,76.85)
local offset2 = Vector(-136,0,41.82)
local degRoll = Angle(-90,0,0)

function ENT:PostDraw(scale)
	if not self:GetEngineActive() then return end

	local size = 20 * scale

	cam.Start3D2D( self:LocalToWorld(offset * scale), self:LocalToWorldAngles(degRoll), 1 )
		surface.SetDrawColor( self.EngineColor )
		surface.SetMaterial( self.EngineCenter )
		surface.DrawTexturedRectRotated(0, 0, size, size , 0)
		surface.SetDrawColor( color_white )
		surface.SetMaterial( self.EngineGlow )
		surface.DrawTexturedRectRotated(0, 0, size, size, 0)
	cam.End3D2D()

	cam.Start3D2D( self:LocalToWorld(offset2 * scale), self:LocalToWorldAngles(degRoll), 1 )
		surface.SetDrawColor(self.EngineColor)
		surface.SetMaterial(self.EngineCenter)
		surface.DrawTexturedRectRotated(0, 0, size, size, 0)
		surface.SetDrawColor(color_white)
		surface.SetMaterial(self.EngineGlow)
		surface.DrawTexturedRectRotated( 0, 0, size, size , 0)
	cam.End3D2D()
end

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 60 + self:GetThrottle() * 60 + self:GetBoost()

	render.SetMaterial( self.EngineGlow )

	for _, pos in pairs( self.EnginePos ) do
		render.DrawSprite(  self:LocalToWorld( pos ), Size, Size, self.EngineColor )
	end
end

function ENT:OnStartBoost()
	self:EmitSound( "lvs/vehicles/vwing/boost.wav", 85 )
end

function ENT:OnStopBoost()
	self:EmitSound( "lvs/vehicles/vwing/brake.wav", 85 )
end

--MediaLib_DynFile_webaudio.lua:
local oop = medialib.load("oop")
local WebAudioService = oop.class("WebAudioService", "BASSService")
WebAudioService.identifier = "webaudio"

local all_patterns = {
	"^https?://(.*)%.mp3",
	"^https?://(.*)%.ogg",
}

function WebAudioService:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local id = string.match(url, pattern)
		if id then
			return {id = id}
		end
	end
end

function WebAudioService:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

function WebAudioService:resolveUrl(url, callback)
	callback(url, {})
end

function WebAudioService:directQuery(url, callback)
	callback(nil, {
		title = url:match("([^/]+)$")
	})
end

return WebAudioService
--addons/!lpakr_out/lua/dash/thirdparty/medialib.service.volume3d.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_projector.lua:
AddCSLuaFile()ENT.Base='media_base'ENT.PrintName='Projector'ENT.Category='RP Media'ENT.Spawnable=info.Dev;local a={rp_liberator_sup_b8at={Projector={BindModel='models/lt_c/sci_fi/ground_locker_small.mdl',Pos=Vector(2210,-1235,-13268),Ang=Angle(0,90,0),SoundOrigin=Vector(1985,-1105,-13060),Room='The Lounge'},Screen={Pos=Vector(2187,-1231,-13027),Ang=Angle(0,180,90),Scale=.2}},rp_monsglacia_crimson={Projector={BindModel='models/lt_c/sci_fi/ground_locker_small.mdl',Pos=Vector(-10127,-10996,-607),Ang=Angle(0,-90,0),SoundOrigin=Vector(1985,-1105,-13060)},Screen={Pos=Vector(-10048,-10994,-340),Ang=Angle(0,0,90),Scale=.19}}}a=a[game.GetMap()]if!a then return end;ENT.MediaPlayer=true;ENT.Model=a.Projector.BindModel||'models/starwars/syphadias/props/sw_tor/bioware_ea/props/coruscant/cor_works_light_03.mdl'ENT.Room=a.Projector.Room||nil;if SERVER then else local b;function ENT:GetSoundOrigin()if!b then b=ents.FindByClass('media_sound')[1]end;return b end;ENT.Draw=ENTITY.DrawModel;local c;local function d()if IsValid(c)&&IsValid(LocalPlayer())&&LocalPlayer():GetPos():Distance(c:GetPos())<950 then cam.Start3D2D(a.Screen.Pos,a.Screen.Ang,a.Screen.Scale)c:DrawScreen(0,0,2026,1140)cam.End3D2D()end end;hook.Add('OnEntityCreated','theatre.OnCreated',function(e)if e:GetClass()!='media_projector'then return end;c=e;if IsValid(c)then hook('PostDrawOpaqueRenderables','theater.PostDrawOpaqueRenderables',d)hook.Remove('OnEntityCreated','theatre.OnCreated')end end)end
--addons/!lpakr_out/lua/entities/nbot_sw_snow_droid_b2.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_mountain_rancor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_nocturnal_rancor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_rancor_egg.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Rancor Hatchling"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/rancor_egg.mdl"}ENT.Skins={0}ENT.ModelScale=1;ENT.CollisionBounds=Vector(1,1,1)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=1000;ENT.HealthRegen=5;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;ENT.OnSpawnSounds={}ENT.OnIdleSounds={}ENT.IdleSoundDelay=2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={"fallenlogic/rancor/death1.mp3"}ENT.OnDownedSounds={}ENT.Footsteps={}ENT.Omniscient=false;ENT.SpotDuration=30;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=80;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.Frightening=true;ENT.AllyDamageTolerance=0.33;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.33;ENT.Acceleration=1000;ENT.Deceleration=1000;ENT.JumpHeight=50;ENT.StepHeight=20;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;ENT.WalkAnimation=ACT_WALK;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_WALK;ENT.RunAnimRate=1.2;ENT.IdleAnimation=ACT_IDLE;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_JUMP;ENT.JumpAnimRate=1;ENT.UseWalkframes=false;ENT.WalkSpeed=0;ENT.RunSpeed=0;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=60;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(0,0,0)ENT.EyeBone="R_Eyelid"ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.UseWeapons=false;ENT.Weapons={}ENT.WeaponAccuracy=1;ENT.WeaponAttachment=""ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=false;ENT.PossessionEnabled=false;ENT.PossessionPrompt=true;ENT.PossessionCrosshair=false;ENT.PossessionMovement=POSSESSION_MOVE_1DIR;ENT.PossessionViews={}ENT.PossessionBinds={}game.AddParticles("particles/antlion_blood.pcf")PrecacheParticleSystem("AntlionGib")if SERVER then else function ENT:CustomInitialize()end;function ENT:CustomThink()end;function ENT:CustomDraw()end end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_rancor_egg_hostile.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Rancor Hatchling (Hostile)"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/rancor_egg.mdl"}ENT.Skins={0}ENT.ModelScale=1;ENT.CollisionBounds=Vector(1,1,1)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=1000;ENT.HealthRegen=5;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;ENT.OnSpawnSounds={}ENT.OnIdleSounds={}ENT.IdleSoundDelay=2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={"fallenlogic/rancor/death1.mp3"}ENT.OnDownedSounds={}ENT.Footsteps={}ENT.Omniscient=false;ENT.SpotDuration=30;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=80;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.Frightening=true;ENT.AllyDamageTolerance=0.33;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.33;ENT.Acceleration=1000;ENT.Deceleration=1000;ENT.JumpHeight=50;ENT.StepHeight=20;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;ENT.WalkAnimation=ACT_WALK;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_WALK;ENT.RunAnimRate=1.2;ENT.IdleAnimation=ACT_IDLE;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_JUMP;ENT.JumpAnimRate=1;ENT.UseWalkframes=false;ENT.WalkSpeed=0;ENT.RunSpeed=0;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=60;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(0,0,0)ENT.EyeBone="R_Eyelid"ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.UseWeapons=false;ENT.Weapons={}ENT.WeaponAccuracy=1;ENT.WeaponAttachment=""ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=false;ENT.PossessionEnabled=false;ENT.PossessionPrompt=true;ENT.PossessionCrosshair=false;ENT.PossessionMovement=POSSESSION_MOVE_1DIR;ENT.PossessionViews={}ENT.PossessionBinds={}game.AddParticles("particles/antlion_blood.pcf")PrecacheParticleSystem("AntlionGib")if SERVER then else function ENT:CustomInitialize()end;function ENT:CustomThink()end;function ENT:CustomDraw()end end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_rancordragon.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_tridroid.lua:
AddCSLuaFile()ENT.CWRP=true;ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='Tri-Droid'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/freddo/tri_droid.mdl'ENT.Factions={FACTION_COMBINE}ENT.UseWalkframes=true;ENT.WeaponAccuracy=0.75;ENT.Weapons={}ENT.Models={'models/freddo/tri_droid.mdl'}ENT.Omniscient=true;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=0;ENT.ReachEnemyRange=3000;ENT.AvoidEnemyRange=200;ENT.AvoidAfraidOfRange=0;ENT.WatchAfraidOfRange=0;ENT.RagdollOnDeath=true;ENT.WalkSpeed=40;ENT.RunSpeed=40;ENT.ClimbLedges=false;ENT.ClimbLaddersUp=false;ENT.ClimbLaddersDown=false;DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_tyrant_rancor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_01.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_06.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_08#.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Fire [Pink]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]_campfire_pink"
--addons/!lpakr_out/lua/entities/pfx1_08__l.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_08_~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Fire [Yellow]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]_campfire_yellow"
--addons/!lpakr_out/lua/entities/pfx1_0c.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx3_00.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Cherry Tree Petals"ENT.Category="PPE: Nature"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[3]sakura_env"
--addons/!lpakr_out/lua/entities/pfx4_03.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Green Jet"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_g"
--addons/!lpakr_out/lua/entities/pfx4_03~.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_05.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_06_2.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Red Energy Rod"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]energy_rod_r"
--addons/!lpakr_out/lua/entities/pfx4_0b.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx7_01.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Rain"ENT.Category="PPE: Weather"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[7]rain"
--addons/!lpakr_out/lua/entities/pfx7_04.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Fog 2"ENT.Category="PPE: Weather"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[7]area_of_fog"
--addons/!lpakr_out/lua/entities/pfx8_04.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Large Core"ENT.Category="PPE: Magic"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[8]core_1"
--addons/!lpakr_out/lua/entities/pfx8_06.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Magic Orb 2"ENT.Category="PPE: Magic"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[8]orb_1"
--addons/!lpakr_out/lua/entities/pfxcom1.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfxcom1.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="PFXCOM1"ENT.Category="PPE: Water"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[com1]jet"
--addons/!lpakr_out/lua/entities/prop_animatable.lua:
AddCSLuaFile()ENT.Base="base_entity"ENT.Type="anim"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.AutomaticFrameAdvance=true;function ENT:SetupDataTables()self:NetworkVar("Bool",0,"IsRagdoll")if CLIENT then return end;self:SetIsRagdoll(false)end;function ENT:Think()self:NextThink(CurTime())return true end;local a=Material("vgui/white")function ENT:DrawBBox()if GetConVarNumber("rb655_easy_animation_noglow")!=0 then return end;local b=LocalPlayer():GetActiveWeapon()if IsValid(b)&&b:GetClass()=="gmod_camera"then return end;local c=self:OBBMins()local d=self:OBBMaxs()local e=self:GetPos()+Vector(d.x,c.y,c.z)local f=self:GetPos()+Vector(d.x,d.y,c.z)local g=self:GetPos()+Vector(c.x,d.y,c.z)render.SetMaterial(a)render.DrawQuad(g,f,e,self:GetPos()+c)end;function ENT:Draw()self:SetRenderBounds(self:GetModelBounds())self:DrawModel()end;function ENT:DrawTranslucent()self:Draw()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_amplifier.lua:
AddCSLuaFile()ENT.Base='rp_building'ENT.PrintName='Crit Amplifier'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.Model='models/starwars/syphadias/props/sw_tor/bioware_ea/props/city/city_streetlamp_post.mdl'ENT.GUIOffset=Vector(0,0,225)ENT.GUIAngle=Angle(0,90,90)ENT.Particle='[4]energy_rod_g'PrecacheParticleSystem'[4]energy_rod_g'ENT.AuraPosition=Vector(0,0,80)ENT.AuraAngle=Angle(90,0,0)ENT.PVSZoneOffset=Vector(0,0,50)function ENT:SpawnAura()local a=srp.buffs.CreateAura(self,self.PVSZoneOffset,self:GetAngles(),'models/hunter/misc/shell2x2.mdl',6)a.buffid='critchance'self.Aura=a;a.CanBuff=function(b,c)return c:IsPlayer()end;a.OnZoneEntered=function(b,c)c.CritChanceIncrease=true;srp.buffs.Add(c,b.buffid)end;a.OnZoneExit=function(b,c)c.CritChanceIncrease=false;srp.buffs.Remove(c,b.buffid)end end;function ENT:RemoveAura()if IsValid(self.Aura)&&!self.Aura:IsMarkedForDeletion()then self.Aura:Remove()end end;function ENT:SpawnAuraEffect()local d=ents.Create'pfx4_06_1'd:SetMoveType(MOVETYPE_NONE)d:SetParent(self)d:SetLocalPos(self.AuraPosition)d:SetLocalAngles(self.AuraAngle)d:Spawn()self:DeleteOnRemove(d)self.AuraEffect=d end;function ENT:RemoveAuraEffect()if IsValid(self.AuraEffect)&&!self.AuraEffect:IsMarkedForDeletion()then self.AuraEffect:Remove()end end;function ENT:OnCreated()self:SpawnAuraEffect()self:SpawnAura()end;function ENT:OnDestroyed()self:RemoveAuraEffect()self:RemoveAura()end;function ENT:Draw()self:DrawModel()local e=self:GetColor()||col.white;cam.Start3D2D(self:LocalToWorld(self.GUIOffset),self:LocalToWorldAngles(self.GUIAngle),.5)draw.DrawText(self.PrintName..' #'..self:EntIndex(),'ui_header.l',0,0,e,TEXT_ALIGN_CENTER)cam.End3D2D()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_artilleryshell_smoke_green.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='rp_artilleryshell'ENT.PrintName='Smoke Mortar Shell (GREEN)'ENT.Category='SUP'ENT.Spawnable=true;ENT.DoNotDuplicate=true;ENT.Interactive=true;ENT.SmokeColor=Color(50,200,50)ENT.SmokeColor2=Color(50,200,50)ENT.Range=400;local a=Vector(0,0,1)function ENT:DoExplosionEffect(b)local c=self.LandingPos||b.HitPos;util.ScreenShake(c,100,100,2,500)self:CreateSmoke(self.SmokeColor,self.SmokeColor2,250,0.15,100,5)self:EmitSound('ambient/fire/ignite.wav',100,100,1)util.Decal('Splash.Large',c+a*4,c-a*6)return 35 end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_artilleryshell_smoke_red.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='rp_artilleryshell'ENT.PrintName='Smoke Mortar Shell (RED)'ENT.Category='SUP'ENT.Spawnable=true;ENT.DoNotDuplicate=true;ENT.Interactive=true;ENT.SmokeColor=Color(255,50,50)ENT.SmokeColor2=Color(255,50,50)ENT.Range=400;local a=Vector(0,0,1)function ENT:DoExplosionEffect(b)local c=self.LandingPos||b.HitPos;util.ScreenShake(c,100,100,2,500)self:CreateSmoke(self.SmokeColor,self.SmokeColor2,250,0.15,100,5)self:EmitSound('ambient/fire/ignite.wav',100,100,1)util.Decal('Splash.Large',c+a*4,c-a*6)return 35 end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_container/shared.lua:
DEFINE_BASECLASS'base_anim'ENT.Category='SUP'ENT.PrintName='Container'ENT.Author='Scott'ENT.Contact=''ENT.Purpose=''ENT.Instructions=''ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.DoNotDuplicate=true;ENT.HighLagRisk=true;ENT.Interactive=true;function ENT:SetupDataTables()self:NetworkVar('String',0,'ItemID')end;function ENT:Initialize()self:SetModel'models/props/campcrate.mdl'self:SetSolid(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_fish/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_funcmodule/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_comms.lua:
AddCSLuaFile()ENT.Base="rp_funcmodule"ENT.Type="anim"ENT.Spawnable=info.Dev;ENT.Category='SUP'ENT.PrintName="Communications Relay"ENT.DisplayName="Communications\nRelay"ENT.MaxHealth=25000;ENT.Model=Model'models/props/swdish.mdl'ENT.Activated=true;ENT.UIPosition=Vector(18,-144,70)ENT.UIAngle=Angle(0,0,70)ENT.UIScale=.05;ENT.InteractionRange=250;ENT.CanDisable=true;ENT.PhysicsBox={min=Vector(-120,-120,0),max=Vector(120,120,800)}function ENT:OnStartup()self:CheckComms()end;function ENT:OnShutdown()self:CheckComms()end;function ENT:OnSystemFailure()self:CheckComms()end;function ENT:CheckComms()srp.funcmodules.SetCommunications('REPUBLIC',self:GetActivated())end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_lights.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_lights.lua:
AddCSLuaFile()ENT.Base='rp_funcmodule'ENT.Type='anim'ENT.Spawnable=info.Dev;ENT.Category='SUP'ENT.PrintName='Fuse Box'ENT.DisplayName='FUSE BOX'ENT.MaxHealth=10000;ENT.Model=Model'models/props/console5.mdl'ENT.RequiresHacking=true;ENT.Activated=true;ENT.CanDisable=false;ENT.InteractionRange=200;ENT.CanDisable=true;ENT.UIPosition=Vector(9.9,-55,128)ENT.UIAngle=Angle(0,90,84.8)ENT.UIScale=.05;ENT.SparkOrigin=Vector(20,0,70)local a=Material('materials/galactic/ui/utility.png','noclamp smooth')local b=Material('materials/galactic/ui/warning.png','noclamp smooth')local c=Material('materials/galactic/ui/tools.png','noclamp smooth')local d=256;local e=col.blue_light:Copy()e.a=200;local f=col.red:Copy()f.r=200;f.g=50;f.b=75;f.a=200;local g=Material('models/props_lab/warp_sheet')function ENT:OnStartup()self:UpdateFuseState()end;function ENT:OnShutdown()self:UpdateFuseState()end;function ENT:OnSystemFailure()self:UpdateFuseState()end;function ENT:SetLightStatus(h)srp.funcmodules.ToggleLights(h)if h then srp.funcmodules.RemoveWarning('fuse')else srp.funcmodules.DisplayWarning('fuse')end;if!h then local i=self:LocalToWorld(self.SparkOrigin)for j=1,math.random(2,6)do local k=j-1;timer.Simple(k*.25+math.random(k*0.05),function()if!IsValid(self)then return end;local l=EffectData()l:SetScale(2)l:SetOrigin(i+self:GetRight()*math.random(-80,80)+self:GetUp()*math.random(-55,55))l:SetNormal(self:GetUp()+VectorRand(-0.5,0.5))util.Effect('ManhackSparks',l,false,true)end)end end end;function ENT:UpdateFuseState()if self:GetActivated()then self:SetLightStatus(true)else self:SetLightStatus(false)end end;local m=Vector(35,0,55)function ENT:DrawTranslucent()local n=self:GetActivated()cam.Start3D2D(self:LocalToWorld(self.UIPosition),self:LocalToWorldAngles(self.UIAngle),self.UIScale)surface.SetDrawColor(0,255,255,255)surface.SetMaterial(g)surface.DrawTexturedRect(-260,-225,2705,600)draw.Box(-260,-225,2705,600,n&&e||f)if self.label then draw.Box(2120,42,130,130,col.green)surface.SetDrawColor(200,200,200,255)surface.DrawOutlinedRect(2120,42,130,130,6)draw.DrawText('CODE '..self.label,'ui_header.xxl',1800,0,col.white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)end;draw.SimpleText(self.DisplayName,'ui_header.xxl',0,125,self:GetActivated()&&col.white||col.red_light,TEXT_ALIGN_LEFT,TEXT_ALIGN_BOTTOM)draw.SimpleText(Format('%03i/%03i HP',self:GetHP(),self.MaxHealth),'ui_header.xxl',0,55,col.white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)cam.End3D2D()local o=DynamicLight(self:EntIndex())if o then o.pos=self:GetPos()+m;o.r=n&&0||255;o.g=n&&255||0;o.b=n&&255||0;o.brightness=2;o.Decay=1;o.Size=200;o.DieTime=CurTime()+.5 end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_funcmodule_status.lua:
AddCSLuaFile()ENT.Base='base_anim'ENT.Type='anim'ENT.Spawnable=info.Dev;ENT.Category='SUP Development'ENT.PrintName='Module Checker'ENT.Model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/props/imperial/imp_holo_console.mdl'ENT.ThinkTime=4;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.DoNotDuplicate=true;ENT.UIPosition=Vector(-51,-1.5,98)ENT.UIAngle=Angle(0,0,90)ENT.UIScale=.095;ENT.UIBarCount=5;ENT.UIBarWidth=100;ENT.UIBarHeight=15;ENT.UIBarPadding=5;ENT.IgnoreModules={rp_funcmodule_turret=true}function ENT:Initialize()self.HealthBars={}end;local a=Material('materials/galactic/ui/utility.png','noclamp smooth')local b=Material('materials/galactic/ui/warning.png','noclamp smooth')local c=Material('materials/galactic/ui/tools.png','noclamp smooth')local d={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P'}function ENT:UpdateHealthBars()local e=ents.FindByClass'rp_funcmodule_*'self.HealthBars={}local f=5;self.HealthBars[#self.HealthBars+1]={label='A',location='.................................',name='The Liberator',health=self.UIBarCount,percent=1,color=f<2&&col.red||f<3&&col.orange||col.green,materialcolor=f<2&&col.red||f<3&&col.orange||col.white,material=f<2&&a||f<3&&b||c}for g,h in ipairs(e)do if!h.GetHP||self.IgnoreModules[h:GetClass()]then continue end;local i=h:GetHP()/h.MaxHealth;local f=self.UIBarCount*i;local j=#self.HealthBars+1;local k=d[j]||d[1]h.label=k;self.HealthBars[j]={label=k,location=h:GetLocationName(),name=h.PrintName,health=f,percent=i,color=f<2&&col.red||f<3&&col.orange||col.green,materialcolor=f<2&&col.red||f<3&&col.orange||col.white,material=f<2&&a||f<3&&b||c}end end;if CLIENT then local l=CreateMaterial('funcmodule_status',"UnlitGeneric",{["$basetexture"]='dev/dev_scanline',["$translucent"]=1,["$additive"]=1,["$vertexcolor"]="1",["$vertexalpha"]="1",["Proxies"]={["TextureScroll"]={["texturescrollvar"]="$baseTextureTransform",["texturescrollrate"]=.1,["texturescrollangle"]=-90}}})function ENT:Think()self:UpdateHealthBars()self:SetNextClientThink(CurTime()+self.ThinkTime)return true end;function ENT:Draw()self:DrawModel()local m=self:LocalToWorld(self.UIPosition)local n=self:LocalToWorldAngles(self.UIAngle)local o=5;local p=-10;local q=0;local r=math.sin(CurTime()+5)>0;cam.Start3D2D(m,n,self.UIScale)for g,s in ipairs(self.HealthBars)do if s.material then surface.SetDrawColor(s.materialcolor)surface.SetMaterial(s.material)surface.DrawTexturedRect(p,o-12,32,32)end;draw.Box(p+35,o-11,28,28,col.blue_light)surface.SetDrawColor(200,200,200,255)surface.DrawOutlinedRect(p+35,o-11,28,28,1)draw.DrawText(s.label||'0','ui_header.l',p+48,o-18,col.white,TEXT_ALIGN_CENTER)draw.DrawText(s.name,'ui_header.r',p+68,o-15,col.white,TEXT_ALIGN_LEFT)draw.DrawText(s.location,'ui_label.s',p+68,o+5,col.white_dark,TEXT_ALIGN_LEFT)for g=1,self.UIBarCount do surface.SetDrawColor(g<=s.health&&s.color||col.grey_light)surface.DrawRect(p+(g-1)*self.UIBarWidth+(g-1)*self.UIBarPadding,o+25,self.UIBarWidth,self.UIBarHeight)if g-1<s.health then surface.SetDrawColor(s.color)surface.DrawOutlinedRect(p+(g-1)*self.UIBarWidth+(g-1)*self.UIBarPadding,o+25,self.UIBarWidth,self.UIBarHeight,r&&5||1)end end;p=g>=8&&550||-10;if g==8 then o=5 else o=o+70 end end;surface.SetMaterial(l)surface.SetDrawColor(col.blue_dark)surface.DrawTexturedRect(-75,-35,1190,580)cam.End3D2D()end end
--addons/!lpakr_out/lua/entities/rp_grenade_gl.lua:
AddCSLuaFile()ENT.Base='rp_grenade'ENT.PrintName='Grenade Launcher'ENT.Spawnable=false;ENT.WorldModel='models/Items/AR2_Grenade.mdl'ENT.ExplosionTime=5;ENT.FreezeMotion=false;ENT.Impact=true;ENT.Range=200;ENT.Damage=550;ENT.TrailColor=Color(189,0,0)function ENT:Explode()return 0 end
--addons/!lpakr_out/lua/entities/rp_grenade_health.lua:
AddCSLuaFile()ENT.Base="rp_grenade"ENT.PrintName="Health Grenade"ENT.Spawnable=false;ENT.WorldModel="models/weapons/w_eq_flashbang.mdl"ENT.ExplosionTime=4;ENT.FreezeMotion=false;ENT.HitSound=Sound'Flashbang.Bounce'ENT.SmokeColor=Color(50,50,200,50)ENT.SmokeColor2=Color(50,50,200,50)ENT.TrailColor=Color(50,50,200,50)ENT.TrailGlowColor='blueglow2'
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_hologram/shared.lua:
ENT.PrintName='Hologram'ENT.Author='Scott'ENT.Contact='STEAM_0:1:2665200'ENT.Purpose=''ENT.Instructions=''ENT.Type='anim'ENT.Base='base_srp'ENT.Category='SUP'ENT.Spawnable=true;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.RTSInteraction=true;ENT.IsHologram=true;ENT.PVSZoneOffset=Vector()ENT.NetworkPlayerUse=true;ENT.Interactive=true;ENT.DoNotDuplicate=true;ENT.Model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/props/imperial/imp_holo_table.mdl'ENT.UIPosition=Vector(55,75,39)ENT.UIAngle=Angle(180,0,-100)ENT.UIPositionOther=Vector(-55,-75,39)ENT.UIAngleOther=Angle(0,0,80)ENT.UIPositionBack=Vector(106,-34,44)ENT.UIAngleBack=Angle(0,90,80)ENT.UIPositionBackOther=Vector(-106,34,44)ENT.UIAngleBackOther=Angle(0,-90,80)ENT.MaxDrawables=10;ENT.ValidEntities={['prop_physics']=true,['prop_static']=true,['prop_dynamic']=true,['Player']=true,['player']=true,['prop_effect']=true,['Player']=true}ENT.TargetRadius=2;ENT.TargetScale=.4;ENT.TargetOffset=Vector(0,0,34)ENT.TargetMaterial='galactic/supcraftingstation/hologram.vmt'function ENT:SetupDataTables()self:NetworkVar('Entity',0,'Target')self:NetworkVar('Vector',0,'DynamicTargetOffset')self:NetworkVar('Float',0,'DynamicTargetScaling')end;function ENT:Initialize()self:SetModel(self.Model)self:SetMoveType(MOVETYPE_NONE)if self.ModelScale then self:SetModelScale(self.ModelScale)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_item/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_itemofinterest_orb.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='rp_itemofinterest'ENT.PrintName='Orb'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.Model=Model'models/fleshgibs.mdl'
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_jetpack/cl_init.lua:
include'shared.lua'local a=Material'sprites/heatwave'local b=Material'effects/fire_cloud1'local c=Color(100,50,0,255)local d=Color(255,255,255)local e=Color(255,255,255,128)local f=Color(255,255,255,0)local g=Color(0,0,0,0)local h=Color(0,0,255,128)local i=Vector(-6,-3,-10)local j=Vector(6,-3,-10)sound.Add({name='Jetpack.Flame1',channel=CHAN_STATIC,volume=.20,level=75,pitch=100,sound='galactic/jetpack.wav',loop=true})sound.Add({name='Jetpack.Start',channel=CHAN_STATIC,volume=.45,level=75,pitch=120,sound='galactic/weapons/jetpack/on.wav'})sound.Add({name='Jetpack.Stop',channel=CHAN_STATIC,volume=.45,level=75,pitch=120,sound='galactic/weapons/jetpack/off.wav'})local k=Sound('Jetpack.Flame1')local l=Color(255,255,255,128)local m=Color(5,5,255,255)local n=Color(255,255,255)local o=Color(100,100,255,255)function ENT:OnRemove()if self.emitter then self.emitter:Finish()end;if self.sound then self.sound:Stop()self.sound=nil end end;function ENT:Think()local p=self:GetParent()local q=IsValid(p)&&!p:IsOnGround()&&self:GetEnabled()&&self:CanOperate(p)if q&&!self.sound then self:EmitSound('Jetpack.Start')self.sound=CreateSound(self,k)self.sound:PlayEx(0.2,100)end;if!q&&self.sound then self.sound:Stop()self.sound=nil;self:EmitSound('Jetpack.Stop')end;if self.sound&&IsValid(p)then local r=math.Clamp(p:GetVelocity():Length()/300,0,1)self.sound:ChangePitch(60+50*r)end end;function ENT:GetEmitter(s)if IsValid(self.emitter)then if self.dietime&&self.dietime>CurTime()then self.emitter:Finish()self.emitter=nil else return self.emitter end end;self.emitter=ParticleEmitter(s,true)self.dietime=CurTime()+.5;return self.emitter end;function ENT:Draw()end;function ENT:DrawTranslucent()local p=self:GetParent()if!(!IsValid(p)||p:IsCloaked()||p:GetRenderMode()==RENDERMODE_NONE||p==LocalPlayer()&&!isThirdPerson())then self:DrawModel()else return end;if!IsValid(p)then return end;if!self:GetEnabled()||!self:CanOperate(p)||p:IsOnGround()then self.scale=math.Approach(self.scale||0,0,RealFrameTime()/1*4)else self.scale=math.Approach(self.scale||1,1,RealFrameTime()/1*4)end;local t=p:GetVelocity():Length2D()local u=t<=52;local v=-self:GetUp()-self:GetVelocity():GetNormalized()self:DrawFlame(self:LocalToWorld(i),v,u)self:DrawFlame(self:LocalToWorld(j),v,u)end;function ENT:DrawFlame(w,x,u)local y=self.Seed+CurTime()*-10;local z=self.scale||0;if z<0.01 then return end;render.SetMaterial(b)render.StartBeam(3)render.AddBeam(w,3,y,l)render.AddBeam(w+x*5*z,3,y+1,u&&c||o)render.AddBeam(w+x*12*z,1,y+3,m)render.EndBeam()y=y*0.5;render.UpdateRefractTexture()render.SetMaterial(a)render.StartBeam(3)render.AddBeam(w,6,y,l)render.AddBeam(w+x*7*z,6,y+2,n)render.AddBeam(w+x*70*z,19,y+3,n)render.EndBeam()y=y*1.3;render.SetMaterial(b)render.StartBeam(3)render.AddBeam(w,3,y,l)render.AddBeam(w+x*5*z,4,y+1,u&&c||o)render.AddBeam(w+x*15*z,1,y+2,m)render.EndBeam()end;function ENT:CanOperate(p)return p:GetFuel()>0 end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_lava/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_mortar.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_questitem/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_ragdoll/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_routebuttons/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_safelanding/cl_init.lua:
include'shared.lua'ENT.Draw=ENTITY.DrawModel
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_scrapmachine/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_shielddome/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_storagecrate/cl_init.lua:
include'shared.lua'function ENT:Draw()if LocalPlayer()==self:GetParent()&&!isThirdPerson()then return end;self:DrawModel()local a=self:GetDestination()||'Unknown'local b=Vector(math.cos(CurTime()+200)*.2,math.sin(CurTime()+500)*.3,math.sin(CurTime()+100)*.5)cam.Start3D2D(self:LocalToWorld(self.UIPosition+b),self:LocalToWorldAngles(self.UIAngle),.1)surface.SetDrawColor(255,238,7)surface.DrawOutlinedRect(-80,35,160,28,1)draw.DrawText(self:GetCargo(),'ui_header.l',0,-5,col.yellow,TEXT_ALIGN_CENTER)draw.DrawText(a,'ui_label.r',0,40,col.red,TEXT_ALIGN_CENTER)cam.End3D2D()end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_stove/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_timer/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_trashcan_large.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_trashcan_large.lua:
AddCSLuaFile()ENT.Base='rp_trashcan'ENT.PrintName='Large Trashcan'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.DoNotDuplicate=true;ENT.Model=Model'models/props_junk/trashcluster01a.mdl'
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_warfund.lua:
AddCSLuaFile()ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Spawnable=info.Dev;ENT.AdminOnly=info.Dev;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Category='SUP'ENT.Type='anim'ENT.Base='base_anim'ENT.Model=Model'models/props/swsign1.mdl'ENT.NetworkPlayerUse=true;ENT.DontSit=true;ENT.DontFreeze=true;ENT.DoNotDuplicate=true;ENT.IgnoreNoGrav=true;ENT.UIPosition=Vector(1.4,-57,64)ENT.UIAngle=Angle(0,90,90)function ENT:SetupDataTables()self:NetworkVar('Int',0,'Amount')self:NetworkVar('String',0,'YearMonth')end;function ENT:Initialize()end;if CLIENT then local a=Color(250,50,50,200)local b=CreateMaterial('timer_scanlines','UnlitGeneric',{['$basetexture']='dev/dev_scanline',['$translucent']=1,['$additive']=1,['$vertexcolor']='1',['$vertexalpha']='1',['Proxies']={['TextureScroll']={['texturescrollvar']='$baseTextureTransform',['texturescrollrate']=.1,['texturescrollangle']=-90}}})local c=325;local d=148;function ENT:Draw()self:DrawModel()local e=self:GetYearMonth()||'2024.0'cam.Start3D2D(self:LocalToWorld(self.UIPosition),self:LocalToWorldAngles(self.UIAngle),.35)draw.Box(0,0,c,d,col.black)draw.SimpleText('WARFUNDS '..e,'ui_led.r',c*.5,d*.5-5,col.red_dark,TEXT_ALIGN_CENTER,TEXT_ALIGN_BOTTOM)local f=self:GetAmount()||0;draw.SimpleText(string.Comma(f)..' RC','ui_led.r',c*.5,d*.5+5,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)surface.SetDrawColor(255,0,0,25)surface.SetMaterial(b)surface.DrawTexturedRect(0,0,c,d)cam.End3D2D()end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_water.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/sent_firework/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/anzati_hearts/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)if!f then return end;for g=0,d do local h=b+c*(d-g)local i=f:Add("wos/lightsabers/effects/anzati/heart",h)if i then i:SetLifeTime(0)i:SetDieTime(0.3)i:SetGravity(Vector(0,0,math.random(32,128)))i:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))i:SetStartSize(1)i:SetEndSize(0)i:SetStartAlpha(math.random(100,200))i:SetEndAlpha(0)i:SetColor(e.p,e.y,e.r)i:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/anzati_swtor5/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/anzati_swtor5/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=1;if!f then return end;for h=0,d/g do local i=b+c*(d-h*g)local j=f:Add("wos/lightsabers/effects/anzati/swtor5",i)if j then j:SetLifeTime(0)j:SetDieTime(0.3)j:SetGravity(Vector(0,0,math.random(32,128)))j:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(math.random(100,200))j:SetEndAlpha(0)j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/anzati_swtor6/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=1;if!f then return end;for h=0,d/g do local i=b+c*(d-h*g)local j=f:Add("wos/lightsabers/effects/anzati/swtor6",i)if j then j:SetLifeTime(0)j:SetDieTime(0.3)j:SetGravity(Vector(0,0,math.random(32,128)))j:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(math.random(100,200))j:SetEndAlpha(0)j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/anzati_swtor9/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/cwbase_laser.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/effects/effect_bats.lua:
local a=Material('galactic/seasonal/halloween/bat.png')local b=75;function EFFECT:Init(c)local d=ParticleEmitter(c:GetOrigin())local e=c:GetStart()||Vector(255,255,255)for f=0,b do local g=c:GetOrigin()+Vector(math.Rand(-24,24),math.Rand(-24,24),math.Rand(-24,24))+Vector(0,0,math.Rand(0,80))local h=d:Add(a,g)if h then h:SetVelocity(VectorRand()*math.Rand(150,300))h:SetLifeTime(0)h:SetDieTime(math.Rand(3,5))h:SetColor(e.x||220,e.y||25,e.z||200)h:SetStartAlpha(255)h:SetEndAlpha(0)local i=math.Rand(5,25)h:SetStartSize(i)h:SetEndSize(i*2)h:SetRoll(math.Rand(-360,360))h:SetRollDelta(math.Rand(-0.21,0.21))h:SetAirResistance(500)h:SetGravity(Vector(math.Rand(-500,500),math.Rand(-500,500),math.Rand(0,-500)))h:SetCollide(true)h:SetBounce(0.45)h:SetLighting(1)end end;d:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/gamemodes/srp_base/entities/effects/effect_smokepuff.lua:
function EFFECT:Init(a)local b=128;local c=ParticleEmitter(a:GetOrigin())local d=a:GetStart()||Vector(255,255,255)for e=0,b do local f=a:GetOrigin()+Vector(math.Rand(-24,24),math.Rand(-24,24),math.Rand(-24,24))+Vector(0,0,math.Rand(0,80))local g=c:Add("particle/particle_smokegrenade",f)if g then g:SetVelocity(VectorRand()*math.Rand(250,500))g:SetLifeTime(0)g:SetDieTime(math.Rand(1,3))g:SetColor(d.x||220,d.y||25,d.z||200)g:SetStartAlpha(255)g:SetEndAlpha(0)local h=math.Rand(15,50)g:SetStartSize(h)g:SetEndSize(h*2)g:SetRoll(math.Rand(-360,360))g:SetRollDelta(math.Rand(-0.21,0.21))g:SetAirResistance(500)g:SetGravity(Vector(math.Rand(-1000,1000),math.Rand(-1000,1000),math.Rand(0,-1000)))g:SetCollide(true)g:SetBounce(0.45)g:SetLighting(1)end end;c:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/fireworks_may4th.lua:
return lpakr()()
--addons/ssrp_lfs/lua/effects/lvs_concussion_explosion.lua:
local red = Color( 255, 40, 100, 255)
local white = Color( 255, 255, 255, 255)

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
		local particle = emitter:Add( Materials[ math.random(1, #Materials ) ], self.Pos )

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
			particle:SetColor( 255, 40, 100 )
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
	render.DrawSprite( self.Pos, 400 * Scale, 400 * Scale, red )
	render.DrawSprite( self.Pos, 100 * Scale, 100 * Scale, white )
end

--addons/ssrp_lfs/lua/effects/lvs_laser_explosion_aat.lua:
local white = Color(255, 255, 255, 255)
local red = Color( 250, 0, 0, 255)
local orange = Color( 255, 100, 50, 255)
local redAlpha = Color( 255, 0, 0, 255)

EFFECT.HeatWaveMat = Material( "particle/warp1_warp" )
EFFECT.GlowMat = Material( "sprites/light_glow02_add" )

function EFFECT:Init( data )
	local Pos = data:GetOrigin()
	self.Pos = Pos

	self.LifeTime = 0.4
	self.DieTime = CurTime() + self.LifeTime
	self.DieTimeGlow = CurTime() + 0.2

	sound.Play( "LVS.AAT.LASER_EXPLOSION", Pos )
	self:Explosion( Pos )
end

function EFFECT:Explosion( pos )
	local emitter = ParticleEmitter( pos, false )

	if not emitter then return end

	for i = 0, 15 do
		local particle = emitter:Add( "sprites/light_glow02_add", pos )

		local vel = VectorRand() * 450

		if not particle then continue end

		particle:SetVelocity( vel )
		particle:SetAngles( vel:Angle() + Angle(0,90,0) )
		particle:SetDieTime( math.Rand(1,1.6) )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(12,15) )
		particle:SetEndSize( 0 )
		particle:SetRoll( math.Rand(-100,100) )
		particle:SetRollDelta( math.Rand(-100,100) )
		particle:SetColor( 255,0,0 )
		particle:SetGravity( Vector(0,0,-600) )

		particle:SetAirResistance( 0 )

		particle:SetCollide( true )
		particle:SetBounce( 0.5 )
	end

	for i = 0, 5 do
		local particle = emitter:Add( "sprites/rico1", pos )

		local vel = VectorRand() * 1000

		if not particle then continue end

		particle:SetVelocity( vel )
		particle:SetAngles( vel:Angle() + Angle(0,90,0) )
		particle:SetDieTime( math.Rand(0.5,0.8) )
		particle:SetStartAlpha( math.Rand( 200, 255 ) )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(10,20) )
		particle:SetEndSize( 0 )
		particle:SetRoll( math.Rand(-100,100) )
		particle:SetRollDelta( math.Rand(-100,100) )
		particle:SetColor( 255, 0, 0 )
		particle:SetGravity( -vel:GetNormalized() * math.random(1250,1750) )
		particle:SetCollide( true )
		particle:SetBounce( 0.5 )

		particle:SetAirResistance( 200 )
	end

	for i = 0, 20 do
		local particle = emitter:Add( "sprites/flamelet"..math.random(1,5), pos )

		if not particle then continue end

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

	emitter:Finish()
end

function EFFECT:Think()
	if self.DieTime < CurTime() then return false end

	return true
end

function EFFECT:Render()
	local Scale = math.max((self.DieTime - self.LifeTime + 0.3 - CurTime()) / 0.3,0)
	render.SetMaterial( self.HeatWaveMat )
	render.DrawSprite( self.Pos, 300 * Scale, 300 * Scale, white )

	render.SetMaterial( self.GlowMat )
	render.DrawSprite( self.Pos, 1000 * Scale, 1000 * Scale, orange )

	local Scale = (self.DieTimeGlow - CurTime()) / 0.2
	if Scale > 0 then
		render.SetMaterial( self.GlowMat )
		render.DrawSprite( self.Pos, 100 * Scale, 100 * Scale, red )
		render.DrawSprite( self.Pos, 25 * Scale, 25 * Scale, white )
	end

	local Scale = (self.DieTime - self.LifeTime + 0.25 - CurTime()) / 0.25
	local InvScale = 1 - Scale
	local scaleSqr = (Scale ^ 2)

	if Scale > 0 then
		render.SetColorMaterial()

		redAlpha.a = 255 * scaleSqr
		render.DrawSphere( self.Pos, -180 * InvScale, 30,30, redAlpha )

		redAlpha.a = 150 * scaleSqr
		render.DrawSphere( self.Pos, -190 * InvScale, 30,30, redAlpha )

		redAlpha.a = 50 * scaleSqr
		render.DrawSphere( self.Pos, -200 * InvScale, 30,30, redAlpha )
		render.DrawSphere( self.Pos, 210 * InvScale, 30,30, redAlpha )
	end
end

--addons/ssrp_lfs/lua/effects/lvs_tracer_white.lua:
local grey = Color( 100, 100, 100, 255 )
local yellow = Color( 255, 255, 0, 255 )

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

	local len = 2500 * bullet:GetLength()

	render.SetMaterial( self.MatBeam )

	render.DrawBeam( endpos - dir * len, endpos + dir * len * 0.1, 10, 1, 0, grey )
	render.DrawBeam( endpos - dir * len * 0.5, endpos + dir * len * 0.1, 5, 1, 0, yellow )

	render.SetMaterial( self.MatSprite )
	render.DrawSprite( endpos, 400, 400, grey )
end

--addons/!lpakr_out/lua/effects/rb655_force_repulse_out.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetRadius()local d=ParticleEmitter(b)if!d then return end;local e=d:Add("effects/rb655_conc_warp",b)if e then e:SetLifeTime(0)e:SetDieTime(0.25*5)e:SetGravity(Vector(0,0,0))e:SetVelocity(Vector(0,0,0))e:SetStartSize(0)e:SetEndSize(c*2)e:SetStartAlpha(math.random(128,200))e:SetEndAlpha(0)e:SetColor(255,255,255)end;local e=d:Add("effects/rb655_splash_warpring1",b)if e then e:SetLifeTime(0)e:SetDieTime(0.25*5)e:SetGravity(Vector(0,0,0))e:SetVelocity(Vector(0,0,0))e:SetStartSize(0)e:SetEndSize(c*2)e:SetStartAlpha(math.random(128,200))e:SetEndAlpha(0)e:SetColor(255,255,255)end;d:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/sup_laser_christmas.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/sup_laser_red.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/thruster_sperm.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/chatbox/emotes_cl.lua:
ba.chatEmotes=ba.chatEmotes||{}local a={[1]="+1"}local function b(c)for d,e in pairs(c)do for f,g in pairs(e.Emotes)do if a[f]!=nil then f=a[f]end;local h=':'..f..':'ba.chatEmotes[h]={name=h,loadUrl=string.Replace(e.ImageUrl,'{item_id}',tostring(g)),mat=false}end end end;local function i()local j='badmin/emotes.dat'ba.http.FetchJson('emotes',function(c)b(c)file.Write(j,pon.encode(c))end,function()if file.Exists(j,'DATA')then b(pon.decode(file.Read(j,'DATA')))end end)end;hook('InitPostEntity','ba.emotes.InitPostEntity',i)concommand.Add('reload_emotes',i)concommand.Add('parse_emotes',function(k)if!k:IsRoot()then return end;http.Fetch('https://raw.githubusercontent.com/iamcal/emoji-data/master/emoji.json',function(l)dat=util.JSONToTable(l)local m={}print(dat)for d,g in pairs(dat)do if g.has_img_twitter&&g.short_name then if g.skin_variations then local n=1;for f,o in pairs(g.skin_variations)do if o.has_img_twitter then n=n+1 end end else end;if g.image then if file.Exists('72x72/'..g.image,'DATA')then m[g.short_name]={id=g.image:Replace('.png','')}end end end end;file.Write('emoji_new.txt',util.TableToJSON(m))end)end)
--addons/!lpakr_out/lua/badmin/modules/screengrab/init_cl.lua:
local a=render.Capture;local b=render.CapturePixels;local c=render.ReadPixel;local d;local e=1;local f=2;local g=3;local function h(i)local j=FrameNumber()i()if j!=FrameNumber()then net.Start'ba.sg.Failed'net.WriteUInt(e,4)net.SendToServer()end end;local function k()b()local l,m,n=c(0,0)if l!=255||n!=255||m!=255 then net.Start'ba.sg.Failed'net.WriteUInt(f,4)net.SendToServer()return true end end;local o={format='jpeg',quality=30,x=0,y=0,w=ScrW(),h=ScrH()}local p;local function q()if p<CurTime()then hook.Remove('PostRender','ba.sg.PostRender')return end;if gui.IsGameUIVisible()then return end;hook.Remove('PostRender','ba.sg.PostRender')cam.Start2D()local r='SUP Screen Grab: '..LocalPlayer():NameID()surface.SetFont'ui.22'local s,t=surface.GetTextSize(r)draw.RoundedBox(4,ScrW()-s-20,ScrH()-t-20,s+10,t+10,ui.col.FlatBlack)draw.SimpleText(r,'ui.22',ScrW()-15,ScrH()-15,ui.col.White,TEXT_ALIGN_RIGHT,TEXT_ALIGN_BOTTOM)surface.SetDrawColor(255,255,255)surface.DrawRect(0,0,1,1)cam.End2D()if k()then return end;local u;h(function()o.w=ScrW()o.h=ScrH()u=a(o)end)if k()then return end;if!u then net.Start'ba.sg.Failed'net.WriteUInt(g,4)net.SendToServer()return end;net.Start'ba.sg.Request'net.WriteChunks(u..69)net.SendToServer()end;net('ba.sg.Request',function()p=CurTime()+59;hook.Add('PostRender','ba.sg.PostRender',q)end)net('ba.sg.Display',function()local v=net.ReadString()net.ReadChunks(function(u)ui.Create('ba_screengrab_frame',function(self)self:SetPlayer(v)self:SetData(u)end)end)end)
--addons/!lpakr_out/lua/badmin/modules/screengrab/init_sh.lua:
term.Add('ScreengrabStarted','Screengrab started on #, please allow up to 60 seconds for this to finish.')term.Add('ScreengrabRunning','# has an active screengrab uploading please wait!')term.Add('ScreengrabTimedOut','Screengrab on # has timed out. This could be because they\'re tabbed out. If they\'re not, they could be cheating. Do not ban based on this message alone.')term.Add('ScreengrabGotNoData','Screengrab on # has failed. This could be a bug or they could be cheating. Do not ban based on this message alone.')ba.AddCommand('Screen Grab',function(a,b)if b:IsScreenGrabRunning()then ba.notify_err(a,term.Get('ScreengrabRunning'),b)return end;b:ScreenGrab(a)ba.notify(a,term.Get('ScreengrabStarted'),b)end):AddParam(cmd.PLAYER_ENTITY):SetFlag'A':AddAlias'sg':SetHelp'Shows you your target\'s screen. This command can cause players to lag, use it sparingly.'
--addons/!lpakr_out/lua/badmin/modules/ssrp/terms_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/ssrp/logs/staff_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/ssrp/logs/inventory_sh.lua:
return lpakr()()