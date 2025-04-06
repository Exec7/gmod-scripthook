--[[
███████╗██╗░░██╗███████╗░█████╗░██╗░░██╗░█████╗░░█████╗░██╗░░██╗░░░░█████╗░░█████╗░
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██║░░██║██╔══██╗██╔══██╗██║░██╔╝░░░██╔══██╗██╔══██╗
█████╗░░░╚███╔╝░█████╗░░██║░░╚═╝███████║███████║██║░░╚═╝█████═╝░░░░██║░░╚═╝██║░░╚═╝
██╔══╝░░░██╔██╗░██╔══╝░░██║░░██╗██╔══██║██╔══██║██║░░██╗██╔═██╗░░░░██║░░██╗██║░░██╗
███████╗██╔╝╚██╗███████╗╚█████╔╝██║░░██║██║░░██║╚█████╔╝██║░╚██╗██╗╚█████╔╝╚█████╔╝
╚══════╝╚═╝░░╚═╝╚══════╝░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝░╚════╝░░╚════╝░


LUA TOTAL: 4583
--]]
--Stealed clientside server code by exechack.cc
--Hostname: !💠⇛SuperiorServers.co - CWRP - UPDATED MAP & CONTENT! - Part 1/12 - 06/04/2025


--PATH addons/gpakr_out/lua/gpakr/vehicles-lfs-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/vehicles-lfs-2917419988.bsp',FileName='vehicles-lfs',CRC='2917419988',Len=164191448,ShouldLoad=true}
--addons/!lpakr_out/lua/dash/libraries/hook.lua:
local a=debug.getinfo;local isstring=isstring;local isfunction=isfunction;local IsValid=IsValid;local b={}local c={}local d={}local function e()local f={}for g,h in pairs(b)do f[g]={}for i,j in pairs(h)do f[g][d[g][i]]=j end end;return f end;local function k(g,l)return c[g]!=nil&&c[g][l]!=nil end;local function m(g,n,...)local h=b[g]if h!=nil then local o=0::p::o=o+1;local q=h[o]if q!=nil then local r,s,t,u,v,w=q(...)if r!=nil then return r,s,t,u,v,w end;goto p end end;if!n then return end;local j=n[g]if!j then return end;return j(n,...)end;local function x(g,...)return m(g,GAMEMODE,...)end;local function y(g,l)local h=b[g]if!h then return end;local z=c[g]local i=z[l]if!i then return end;local A=#h;if A==i then h[i]=nil;z[l]=nil;d[g][i]=nil else local B=d[g]h[i]=h[A]h[A]=nil;local C=B[A]z[l]=nil;z[C]=i;B[i]=C;B[A]=nil end end;local function D(g,l,j)if isfunction(l)then j=l;l=a(j).short_src end;if!j then return end;if b[g]==nil then b[g]={}c[g]={}d[g]={}end;if k(g,l)then y(g,l)end;local h=b[g]local z=c[g]if!isstring(l)then local E=j;j=function(...)if IsValid(l)then return E(l,...)end;local i=z[l]y(g,l)local F=h[i]if F!=nil then return F(...)end end end;local i=#h+1;h[i]=j;z[l]=i;d[g][i]=l end;hook=setmetatable({Remove=y,GetTable=e,Exists=k,Add=D,Call=m,Run=x},{__call=function(self,...)return self.Add(...)end})
--addons/!lpakr_out/lua/dash/extensions/string.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/extensions/indexing.lua:
ENTITY=FindMetaTable'Entity'PLAYER=FindMetaTable'Player'WEAPON=FindMetaTable'Weapon'local a=ENTITY.GetTable;local b=ENTITY.GetOwner;local c='Owner'function ENTITY:__index(d)local e=ENTITY[d]if e!=nil then return e end;local f=a(self)if f then e=f[d]if e!=nil then return e end end;if d==c then return b(self)end end;function PLAYER:__index(d)local e=PLAYER[d]if e!=nil then return e end;e=ENTITY[d]if e!=nil then return e end;local f=a(self)if f then return f[d]end end;function WEAPON:__index(d)local e=WEAPON[d]if e!=nil then return e end;e=ENTITY[d]if e!=nil then return e end;local f=a(self)if f then e=f[d]if e!=nil then return e end end;if d==c then return b(self)end end
--addons/!lpakr_out/lua/dash/extensions/client/player.lua:
local a;local b=LocalPlayer;function LocalPlayer()a=b()if IsValid(a)then LocalPlayer=function()return a end end;return a end
--addons/!lpakr_out/lua/areatrigger/ui/dropdown_ui.lua:
return lpakr()()
--addons/!lpakr_out/lua/areatrigger/init_sh.lua:
areatrigger.Category='Superior Tools'areatrigger.SavePath='sup/areatrigger'areatrigger.IDCharacterLimit=100;areatrigger.NameCharacterLimit=20;areatrigger.actions=areatrigger.actions||{}areatrigger.actions_mapped=areatrigger.actions_mapped||{}function areatrigger.IsGameMaster(a)return a:IsGamemaster()end;function areatrigger.IsEventCharacter(a)return a:GetAllegiance():IsEvent()end;function areatrigger.SetPropOwner(b,a)b:SetPropOwner(a)end;function areatrigger.Notify(a,c)if CLIENT then srp.notif.Neutral(3,a)else srp.notif.Neutral(a,3,c)end end;function areatrigger.NotifyError(a,c)if CLIENT then srp.notif.Warning(3,a)else srp.notif.Warning(a,3,c)end end;function areatrigger.NetReadTrigger(a)local d=areatrigger.GetDefintiion(net.ReadUInt(8),true)local e={def=d,value=d.ReadNet&&d:ReadNet(a)||net.ReadString(),oncePerLife=net.ReadBool(),oncePerPlayer=net.ReadBool(),triggerOnce=net.ReadBool(),playerCooldown=net.ReadDouble(),globalCooldown=net.ReadDouble(),actionDelay=net.ReadDouble()}e.playerCooldown=d.Cooldown&&math.max(e.playerCooldown,d.Cooldown)||e.playerCooldown;e.globalCooldown=d.Cooldown&&math.max(e.globalCooldown,d.Cooldown)||e.globalCooldown;e.actionDelay=d.actionDelay&&math.max(e.actionDelay,d.Cooldown)||e.actionDelay;return e end;function areatrigger.NetWriteTrigger(f,e)local d=areatrigger.GetDefintiion(f)local g=d.internal;net.WriteUInt(g,8)if d.WriteNet then d:WriteNet(e.value)else net.WriteString(tostring(e.value))end;net.WriteBool(e.oncePerLife)net.WriteBool(e.oncePerPlayer)net.WriteBool(e.triggerOnce)net.WriteDouble(e.playerCooldown)net.WriteDouble(e.globalCooldown)net.WriteDouble(e.actionDelay)end;function areatrigger.AddAction(f,e)e.id=f;if areatrigger.actions[f]then e.internal=areatrigger.actions[f].internal;areatrigger.actions_mapped[e.internal]=e else e.internal=table.insert(areatrigger.actions_mapped,e)end;areatrigger.actions[f]=e end;function areatrigger.GetDefintiion(f,g)return g&&areatrigger.actions_mapped[f]||areatrigger.actions[f]end;function areatrigger.GetDefintiions(h)return h&&areatrigger.actions_mapped||areatrigger.actions end;local function i(a,e)if!areatrigger.IsGameMaster(a)then return end;if!e.EntityMods||!e.EntityMods.ActionData then return end;local j=e.EntityMods.ActionData;local k=e.Class=='sup_usetrigger'local b=ents.Create(k&&'sup_usetrigger'||'sup_areatrigger')b:SetGMOwner(a)areatrigger.SetPropOwner(b,a)b:SetAction(e.DT.ActionID||'')b:SetEventCharacters(j.EventCharactersOnly)b:SetDisplayName(e.DT.DisplayName)b:SetPos(e.Pos)b:SetAngles(e.Angle)b:Spawn()if!k then b:SetSize(j.BoxWidth,j.BoxHeight,j.BoxLength||j.BoxWidth)b:SetArea(e.DT.Sphere,e.DT.Min,e.DT.Max,e.DT.SphereSize)else b:SetModel(e.Model)b:SetupPhys()end;b:SetWeight(j.Weight||0,0,50000)b:SetRemoveOnUse(math.Clamp(j.RemoveOnUse,0,255))b:SetupDupeInfo()undo.Create'sup_areatrigger'undo.SetPlayer(a)undo.AddEntity(b)undo.SetCustomUndoText'Removed Trigger'undo.Finish()return b end;duplicator.Allow('sup_areatrigger')duplicator.Allow('sup_usetrigger')duplicator.RegisterEntityClass('sup_areatrigger',i,'Data')duplicator.RegisterEntityClass('sup_usetrigger',i,'Data')
--addons/!lpakr_out/lua/dash/libraries/term.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/libraries/term.lua:
term=setmetatable({},{__call=function(self,...)return self.Add(...)end})local a={}local b={}local c={}local d={}local e=10;local f=false;local function g(h,i)local j,k=i:gsub('#','#')local l=#b+1;c[h]=l;b[l]=i;d[l]=k end;local function m()for n,o in SortedPairsByMemberValue(a,'Name',false)do g(o.Name,o.Message)end;f=true end;hook.Add('InitPostEntity','term.sort.InitPostEntity',m)function term.Add(h,i)local h=tostring(h)a[c[h]||#a+1]={Name=h,Message=i}if f&&!c[h]then timer.Create('terms.Sort',0,1,function()table.Empty(b)table.Empty(c)table.Empty(d)m()end)end end;function term.Exists(p)return b[p]!=nil||c[tostring(p)]!=nil end;function term.Get(h)return c[tostring(h)]end;function term.GetString(p)return b[p]end;function net.WriteTerm(p,...)net.WriteUInt(p,e)for l=1,d[p]do local o=select(l,...)if isplayer(o)then net.WriteUInt(0,2)net.WritePlayer(o)elseif isentity(o)then net.WriteUInt(1,2)net.WriteEntity(o)elseif isnumber(o)&&o%1==0 then net.WriteUInt(2,2)net.WriteUInt(o,32)else net.WriteUInt(3,2)net.WriteString(tostring(o))end end end;function net.ReadTerm()return b[net.ReadUInt(e)]:gsub('#',function()local q=net.ReadUInt(2)if q==0 then local o=net.ReadPlayer()return IsValid(o)&&o:Name()||'Unknown'elseif q==1 then local o=net.ReadEntity()return IsValid(o)&&util.GetPrintName(o)||'Unknown Entity'elseif q==2 then return tostring(net.ReadUInt(32))end;return net.ReadString()end)end
--addons/!lpakr_out/lua/dash/libraries/cmd.lua:
require'term'cmd=cmd||setmetatable({GetTable=setmetatable({},{__call=function(self)return self end}),OPT_OPTIONAL=1,ERROR_INVALID_COMMAND=2,ERROR_MISSING_PARAM=3,ERROR_INVALID_PLAYER=4,ERROR_INVALID_NUMBER=5,ERROR_INVALID_INT=6,ERROR_INVALID_UINT=7,ERROR_INVALID_TIME=8,ERROR_COMMAND_COOLDOWN=9,NumberUnits={h=100,k=1000,m=1000000,b=1000000000},TimeUnits={s=TIME_SECOND,mi=TIME_MINUTE,h=TIME_HOUR,d=TIME_DAY,w=TIME_WEEK,mo=TIME_MONTH,y=TIME_YEAR},concommands={}},{__call=function(self,a,b)return self.Add(a,b)end})local c={__tostring=function(self)return self.Name end}c.__index=c;c.__concat=c.__tostring;RegisterMetaTable('Command',c)local d={}term.Add(cmd.ERROR_MISSING_PARAM,'Missing argument #: #')term.Add(cmd.ERROR_INVALID_PLAYER,'Could not find player: #')term.Add(cmd.ERROR_INVALID_NUMBER,'Invalid number: #')term.Add(cmd.ERROR_INVALID_INT,'Invalid whole number: #')term.Add(cmd.ERROR_INVALID_UINT,'Invalid number (0 - 2147483647): #')term.Add(cmd.ERROR_INVALID_TIME,'Invalid time: #')term.Add(cmd.ERROR_COMMAND_COOLDOWN,'You need to wait # seconds to run "#" again!')local function e(f,g)g=g:Trim()if g:len()==0 then return{}end;if f.SplitQuotes then return string.ExplodeQuotes(g)else return string.Explode(" ",g)end end;function cmd.AddParam(a,h,i,j)local k=#d+1;cmd[a:upper()]=k;d[k]={NiceName=h,Parse=i,AutoComplete=j}return k end;function cmd.Parse(l,f,m)local n=f:GetParams()local g=e(f,m)local o={}for p,q in ipairs(n)do if g[1]==nil&&!q.Opts[cmd.OPT_OPTIONAL]then hook.Call('cmd.OnCommandError',nil,l,f,cmd.ERROR_MISSING_PARAM,{p,d[q.Enum].NiceName})return false elseif g[1]!=nil then local r,s,t=d[q.Enum].Parse(l,f,g[1],g,p)if r==false then hook.Call('cmd.OnCommandError',nil,l,f,s,t)return false end;if hook.Call('cmd.CanParamParse',nil,l,f,q.Enum,s)==false then return false end;for u=1,t||1 do table.remove(g,1)end;o[#o+1]=s end end;return true,o end;local function v(f,w,g,x)local y={}if w!=nil&&string.IsSteamID32(w)then y={w}elseif w!=nil then y=table.Filter(player.GetAll(),function(q)return string.find(q:Name():lower(),w:lower())end)if#y==1 then y[1]=y[1]:SteamID()else for p,q in ipairs(y)do y[p]=q:Name()end end else for z,q in player.Iterator()do y[#y+1]=q:Name()end end;return y end;cmd.AddParam('PLAYER_STEAMID32','Player/SteamID',function(l,f,w,g,x)local A=player.Find(w)if A==nil&&!string.IsSteamID32(w)then return false,cmd.ERROR_INVALID_PLAYER,{w}end;return true,A||w end,v)cmd.AddParam('PLAYER_STEAMID64','Player/SteamID64',function(l,f,w,g,x)local A=player.Find(w)if A==nil&&!string.IsSteamID64(w)then return false,cmd.ERROR_INVALID_PLAYER,{w}end;return true,A||w end)cmd.AddParam('PLAYER_ENTITY','Player/SteamID',function(l,f,w,g,x)local A=player.Find(w)if A==nil then return false,cmd.ERROR_INVALID_PLAYER,{w}end;return true,A end,v)cmd.AddParam('PLAYER_ENTITY_MULTI','Players/SteamIDs',function(l,f,w,g,x)local B={}for u=1,#g+x-#f:GetParams()do local A=player.Find(g[u])if A==nil then return false,cmd.ERROR_INVALID_PLAYER,{g[u]}else B[#B+1]=A end end;return true,B,#B end,v)cmd.AddParam('WORD','Single Word',function(l,f,w,g,x)if!w||w==''then return false,cmd.ERROR_INVALID_COMMAND,{w}else return true,w end end,function(f,w,g,x)return{'<Word>'}end)cmd.AddParam('STRING','String',function(l,f,w,g,x)local B=''local C=0;for u=1,#g+x-#f:GetParams()do B=B..(u==1&&''||' ')..g[u]C=C+1 end;return true,B,C end,function(f,w,g,x)local B=''local C=1;for u=1,#g+x-#f:GetParams()do B=B..(u==1&&''||' ')..g[u]C=C+1 end;return B==''&&{'<String>'}||{B},C end)local function D(l,f,w,g,x)local E=0;local F=false;for p,G in string.gmatch(w:lower(),'(%d-%p-%d-)(%a+)')do if cmd.NumberUnits[G]then E=E+p*cmd.NumberUnits[G]F=true else return false,cmd.ERROR_INVALID_NUMBER,{w}end end;if!F then local H=tonumber(w)if!H then return false,cmd.ERROR_INVALID_NUMBER,{w}end;return true,H end;return true,E end;local function I(f,w,g,x)if w!=nil then local F=false;for p,G in string.gmatch(w:lower(),'(%d-%p-%d-)(%a+)')do F=true;break end;if!F then if!tonumber(w)then return{'<Number>'}end;local y={}for p,q in pairs(cmd.NumberUnits)do y[#y+1]=w..p end;return y end end;return w==nil&&{'<Number>'}||{w}end;cmd.AddParam('INT','Whole Number (-2147483647 - 2147483647)',function(l,f,w,g,x)local r,s,t=D(l,f,w,g,x)if r&&s%1!=0 then return false,cmd.ERROR_INVALID_INT,{w}end;return r,s,t end,I)cmd.AddParam('UINT','Whole Number (0 - 2147483647)',function(l,f,w,g,x)local r,s,t=D(l,f,w,g,x)if r then if s<0 then return false,cmd.ERROR_INVALID_UINT,{w}elseif s%1!=0 then return false,cmd.ERROR_INVALID_INT,{w}end end;return r,s,t end,I)cmd.AddParam('FLOAT','Number',D,I)cmd.AddParam('TIME','Time',function(l,f,w,g,x)local E=0;for p,G in string.gmatch(w:lower(),'(%d+)(%a+)')do if cmd.TimeUnits[G]then E=E+p*cmd.TimeUnits[G]else return false,cmd.ERROR_INVALID_TIME,{w}end end;if E==0 then return false,cmd.ERROR_INVALID_TIME,{w}end;return true,E end,function(f,w,g,x)if w!=nil then local F=false;for p,G in string.gmatch(w:lower(),'(%d+)(%a+)')do if cmd.TimeUnits[G]then F=true;break else break end end;if!F then if!tonumber(w)then return{'<Time>'}end;local y={}for p,q in pairs(cmd.TimeUnits)do y[#y+1]=w..p end;return y end end;return w==nil&&{'<Time>'}||{w}end)cmd.AddParam('RAW','Raw',function(J,f,w,g,x)return true,g,#g end)function cmd.Add(a,b)local C=setmetatable({Name=a:lower():gsub(' ',''),NiceName=a,Cooldown=0.25,SplitQuotes=false,Params={},CanRun=function()end,Callback=b||function()end},c)cmd.GetTable[C.Name]=C;return C end;function cmd.Get(a)return cmd.GetTable[a:lower()]end;function cmd.Exists(a)return cmd.GetTable[a:lower()]!=nil end;function cmd.Remove(a)cmd.GetTable[a]=nil end;if SERVER then else function cmd.Run(K,...)local g={...}net.Start'cmd.Run'net.WriteString(K)net.WriteUInt(#g,4)for p,q in ipairs(g)do net.WriteString(tostring(q))end;net.SendToServer()end end;local L=FindMetaTable'Player'function L:RunCommand(K,...)cmd.Run(self,K,{...})end;function L:SetCommandCooldown(f,M)if!self.CmdCooldown then self.CmdCooldown={}end;self.CmdCooldown[f:GetName()]=CurTime()+M end;function c:SetConCommand(a)a=a:lower()self.ConCommand=a;if!cmd.concommands[a]then cmd.concommands[a]=true;local N;if SERVER then else N=function(O,C,P,Q)O:ConCommand('_'..a..' '..Q)end end;concommand.Add(a,N,function(K,Q)local y={}local g=e(self,Q)local R=#g;local S=Q:sub(Q:len(),Q:len()+1)==' '&&R>=1;if R<=1&&!S then for p,q in pairs(cmd.GetTable())do if q:GetConCommand()==K&&q:CanRun(LocalPlayer())!=false&&(!g[1]||string.StartWith(q:GetName(),g[1]:lower()))then y[#y+1]=K..' '..q:GetName()end end;return#y>0&&y||{'<No results>'}end;if g[1]&&cmd.Exists(g[1])then local f=cmd.Get(g[1])table.remove(g,1)K=K..' '..f:GetName()for p,q in ipairs(f:GetParams())do if!g[1]&&!S||p>R then break end;local T,t=d[q.Enum].AutoComplete(f,g[1],g,p)if!T then break end;if#T==1 then y[1]=(y[1]||K)..' "'..T[1]..'"'elseif#T>1 then K=y[1]||K;y[1]=nil;for p,q in ipairs(T)do y[#y+1]=K..' "'..q..'"'end end;for u=1,t||1 do table.remove(g,u)end end end;return#y>0&&y||{'<No results>'}end)end;return self end;function c:AddParam(U,...)if#self.Params>0&&self.Params[#self.Params].Enum==cmd.STRING then self.SplitQuotes=true end;local G={Enum=U,Opts={}}for p,q in ipairs({...})do G.Opts[q]=true end;self.Params[#self.Params+1]=G;return self end;function c:AddAlias(a)cmd.GetTable[a:lower():gsub(' ','')]=self;return self end;function c:SetCooldown(V)self.Cooldown=V;return self end;function c:RunOnClient(b)self.ClientCallback=b;return self end;function c:GetName()return self.Name end;function c:GetNiceName()return self.NiceName end;function c:GetConCommand()return self.ConCommand end;function c:GetCooldown()return self.Cooldown end;function c:GetParams()return self.Params end;function c:Run(l,...)if l:IsPlayer()&&self.ClientCallback then local g={...}net.Start'cmd.Run'net.WriteString(self:GetName())net.WriteUInt(#g,4)for p,q in ipairs(g)do net.WriteType(q)end;net.Send(l)end;return self.Callback(l,...)end;if CLIENT then net.Receive('cmd.Run',function()local g={}local a=net.ReadString()for u=1,net.ReadUInt(4)do g[u]=net.ReadType()end;cmd.Get(a).ClientCallback(unpack(g))end)else net.Receive('cmd.Run',function(W,X)local g={}local K=net.ReadString()for u=1,net.ReadUInt(4)do g[#g+1]=net.ReadString()end;cmd.Run(X,K,g)end,false)hook.Add('PlayerSay','cmd.PlayerSay',function(X,Y)local Y=Y:Trim()if Y[1]=='!'||Y[1]=='/'then local g=string.Explode(" ",Y)local K=g[1]:sub(2)table.remove(g,1)cmd.Run(X,K,g,Y)return''end end)end
--addons/!lpakr_out/lua/dash/libraries/cvar.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/submodules/lua_aes/aes.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/checkbox.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/dmenuoption.lua:
timer.Simple(0,function()local a=vgui.GetControlTable'DMenuOption'a._PerformLayout=a._PerformLayout||a.PerformLayout;a.PerformLayout=function(self,b,c)self._PerformLayout(self,b,c)if self:GetSkin()&&self:GetSkin().Name=='SUP'then self:SetTall(25)self:SetContentAlignment(5)end end end)
--addons/!lpakr_out/lua/ui/controls/propertysheet.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/scrollpanel_horizontal.lua:
local a={}function a:Init()self.parent=self:GetParent()self.scrollButton=vgui.Create('Panel',self)self.scrollButton.OnMousePressed=function(b,c)if c==MOUSE_LEFT&&!self:GetParent().ShouldHideScrollbar then local d,e=b:CursorPos()b.scrolling=true;b.mouseOffset=d end end;self.scrollButton.OnMouseReleased=function(b,c)if c==MOUSE_LEFT then b.scrolling=false;b.mouseOffset=nil end end;self.offset=0 end;function a:Think()if self.scrollButton.scrolling then if!input.IsMouseDown(MOUSE_LEFT)then self.scrollButton:OnMouseReleased(MOUSE_LEFT)return end;local d,e=self.scrollButton:CursorPos()local f=d-self.scrollButton.mouseOffset;local g=self.parent:GetCanvas():GetWide()-self.parent:GetWide()local h=(self.scrollButton.x+f)/(self:GetWide()-self.offset)self.parent.Offset=math.Clamp(h*g,0,g)self.parent:InvalidateLayout()end end;function a:PerformLayout()local g=self.parent:GetCanvas():GetWide()-self.parent:GetWide()self:SetPos(0,self.parent:GetTall()-self:GetTall())self.offsetRatio=self.parent:GetWide()/self.parent:GetCanvas():GetWide()self.offset=math.Clamp(math.ceil(self.offsetRatio*self.parent:GetWide()),20,math.huge)self.scrollButton:SetSize(self.offset,self:GetTall()-4)self.scrollButton:SetPos(math.Clamp(self.parent.Offset/g,0,1)*(self:GetWide()-self.offset),(self:GetTall()-self.scrollButton:GetTall())*0.5)end;function a:Paint(i,j)if self:GetParent().ShouldHideScrollbar then return end;derma.SkinHook('Paint','UIScrollBarHorizontal',self,i,j)end;function a:OnMouseWheeled(k)self.parent:OnMouseWheeled(k)end;vgui.Register('ui_scrollbar_horizontal',a,'Panel')local l={}function l:Init()self.scrollBar=vgui.Create('ui_scrollbar_horizontal',self)self.scrollBar:SetMouseInputEnabled(true)self.scrollBar.Horizontal=true;self.contentContainer=vgui.Create('Panel',self)self.contentContainer:SetMouseInputEnabled(true)self.Offset=0;self.Speed=0;self.scrollSize=4;self.Spacing=1;self.Padding=0;self.scrollBar:Dock(BOTTOM)self.scrollBar:SetTall(6)function self.contentContainer.OnChildRemoved(b,m)self:PerformLayout()end end;function l:LerpPositions(n,o)self.contentContainer:LerpPositions(n,o)end;function l:SetScrollBarColor(p)self.scrollBar.m_bgColor=p end;function l:Reset()self:GetCanvas():Clear(true)self.Offset=0;self.Speed=0;self.scrollSize=1;self:PerformLayout()end;function l:AddItem(m)m:SetParent(self:GetCanvas())self:PerformLayout()end;function l:SetSpacing(q)self.Spacing=q end;function l:SetPadding(q)self.Padding=q end;function l:GetCanvas()return self.contentContainer end;function l:SetScrollSize(r)self.scrollSize=r end;function l:ScrollTo(n)self.Offset=n;self:InvalidateLayout()end;function l:OnMouseWheeled(k)if k>0&&self.Speed<0||k<0&&self.Speed>0 then self.Speed=0 else self.Speed=self.Speed+k*self.scrollSize end;if system.IsOSX()then self.Speed=self.Speed*0.1 end;self:PerformLayout()end;function l:SetOffset(s)local g=self:GetCanvas():GetWide()-self:GetWide()if g<0 then g=0 end;self.Offset=math.Clamp(s,0,g)self:PerformLayout()if self.Offset==0||self.Offset==g then return true end end;function l:Think()if self.Speed!=0 then if self:SetOffset(self.Offset-self.Speed)then self.Speed=0 else if self.Speed<0 then self.Speed=math.Clamp(self.Speed+FrameTime()*self.scrollSize*4,self.Speed,0)else self.Speed=math.Clamp(self.Speed-FrameTime()*self.scrollSize*4,0,self.Speed)end end end end;function l:PerformLayout()local t=self:GetCanvas()local n=0;for u,v in ipairs(t:GetChildren())do if!v:IsVisible()&&self.HideInvisible then continue end;local w=n+(u>1&&self.Padding||0)if v.x!=w||v.y!=self.Padding then v:SetPos(w,math.max(0,self.Padding))end;if v:GetTall()!=t:GetTall()-self.Padding*2 then v:SetTall(math.min(t:GetTall(),t:GetTall()-self.Padding*2))end;local x,y,z,c=v:GetDockMargin()n=n+v:GetWide()+self.Spacing+self.Padding+x+z end;if t:GetWide()!=n then t:SetWide(n)end;if(self.ShouldHideScrollbar||t:GetWide()<=self:GetWide())&&self.scrollBar:IsVisible()then t:SetWide(self:GetWide())self.scrollBar:SetVisible(false)self.scrollBar:SetTall(0)elseif!self.ShouldHideScrollbar&&t:GetWide()>self:GetWide()&&!self.scrollBar:IsVisible()then self.scrollBar:SetVisible(true)self.scrollBar:SetTall(6)end;local g=self:GetCanvas():GetWide()-self:GetWide()if self.Offset>g then self.Offset=g end;if self.Offset<0 then self.Offset=0 end;local A=self:GetTall()-self.scrollBar:GetTall()if t:GetTall()!=A then t:SetTall(A)end;if t.y!=0||t.x!=-self.Offset then t:SetPos(-self.Offset,0)self.scrollBar:InvalidateLayout()end end;function l:IsAtMaxOffset()local g=math.Clamp(self:GetCanvas():GetWide()-self:GetWide(),0,math.huge)return self.Offset==g end;function l:GetMaxOffset()return math.Clamp(self:GetCanvas():GetWide()-self:GetWide(),0,math.huge)end;function l:Paint(i,j)end;function l:HideScrollbar(B)self.ShouldHideScrollbar=B end;function l:DockToFrame()local C=self:GetParent()local D,E=C:GetDockPos()self:SetPos(D,E)self:SetSize(C:GetWide()-10,C:GetTall()-(E+5))end;vgui.Register('ui_scrollpanel_horizontal',l,'Panel')
--addons/!lpakr_out/lua/badmin/core/terms_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/core/ranks/setup_sh.lua:
ba.ranks.Create('Root',10):SetImmunity(10000):SetRoot(true)ba.ranks.Create('Sudo Root',9):SetImmunity(10000):SetRoot(true)ba.ranks.Create('Council',8):SetImmunity(7500):SetFlags('uvmasgdc'):SetGA(true)ba.ranks.Create('Super Admin',7):SetImmunity(7000):SetFlags('uvmasd'):SetAdmin(true):SetSA(true)ba.ranks.Create('Game Master',11):SetImmunity(6750):SetFlags('uvmad'):SetDA(true)ba.ranks.Create('Double Admin',6):SetImmunity(6500):SetFlags('uvmad'):SetDA(true)ba.ranks.Create('Content Creator',5):SetImmunity(6250):SetFlags('uvma'):SetGlobal(true):SetAdmin(true)ba.ranks.Create('Admin',4):SetImmunity(6000):SetFlags('uvma'):SetAdmin(true)ba.ranks.Create('Moderator',3):SetImmunity(5000):SetFlags('uvm'):SetAdmin(true)ba.ranks.Create('VIP',2):SetImmunity(0):SetFlags('uv'):SetVIP(true)ba.ranks.Create('User',1):SetImmunity(0):SetFlags('u')
--addons/!lpakr_out/lua/badmin/core/commands/commands_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/core/commands/commands_sh.lua:
function ba.AddCommand(a,b)return cmd(a,b):SetConCommand'ba'end;local c=FindMetaTable'Command'function c:SetChatCommand()self.ChatCommand=true;return self end;function c:SetAuthRequired(d)self.RequiresAuth=d;return self end;function c:SetFlag(e)if self.RequiresAuth==nil then self:SetAuthRequired(true)end;self.Flag=e;return self end;function c:SetHelp(f)self.Help=f;return self end;function c:SetIgnoreImmunity(d)self.IgnoreImmunity=d;return self end;function c:SetPreventSendArgs(d)self.PreventSendArgs=d;return self end;function c:SetLogFilterFlag(e)self.LogFilterFlag=e;return self end;function c:IsChatCommand()return self.ChatCommand==true end;function c:GetFlag()return self.Flag end;function c:GetHelp()return self.Help end;function c:GetAuthRequired()return self.RequiresAuth==true end;function c:GetIgnoreImmunity()return self.IgnoreImmunity||false end;function c:GetPreventSendArgs()return self.PreventSendArgs||false end;function c:GetLogFilterFlag()return self.LogFilterFlag end;cmd.ERROR_INVALID_GROUP=100;cmd.ERROR_GROUP_IMMUNITY=101;cmd.AddParam('RANK','Rank',function(g,h,i,j,k)local l=ba.ranks.Get(i:lower())if!l then return false,cmd.ERROR_INVALID_GROUP,{i}elseif g:IsPlayer()&&!g:GetRankTable():CanTarget(l)then return false,cmd.ERROR_GROUP_IMMUNITY,{i}end;return true,i end,function(h,i,j,k)local m={}for n,o in ipairs(ba.ranks.GetTable())do if i!=nil&&string.find(o:GetName():lower(),i:lower())then m[#m+1]=o:GetName()elseif i==nil then m[#m+1]=o:GetName()end end;return#m==0&&{'<Rank>'}||m end)
--addons/!lpakr_out/lua/badmin/core/module_loader.lua:
local a={}local b={}b.__index=b;function ba.Module(c)local d={Name=c,Files={},Dependancies={}}setmetatable(d,b)a[#a+1]=d;return d end;function b:Author(c)self.Creator=c;return self end;function b:SetGM(c)self.Gamemode=c:lower()return self end;function b:CustomCheck(e)self.CustomCheckFunc=e;return self end;function b:Require(a)if istable(a)then for f,g in ipairs(a)do self.Dependancies[#self.Dependancies+1]=g end else self.Dependancies[#self.Dependancies+1]=a end;return self end;function b:Include(h)if istable(h)then for f,g in ipairs(h)do self.Files[#self.Files+1]=g end else self.Files[#self.Files+1]=h end;return self end;function b:Init()if(!self.CustomCheckFunc||self.CustomCheckFunc())&&(!self.Gamemode||gmod.GetGamemode().Name:lower()==self.Gamemode)then for i,j in ipairs(self.Files)do dash.IncludeDynamic(self.Directory..j)end;ba.print('> Module | '..self.Name)end end;local i,k=file.Find('badmin/modules/*','LUA')for i,d in ipairs(k)do dash.IncludeSH('badmin/modules/'..d..'/_module.lua')a[#a].Directory='badmin/modules/'..d..'/'end;hook.Add('PostGamemodeLoaded','ba.modules.PostGamemodeLoaded',function()for f,g in ipairs(a)do g:Init()end;hook.Call('BadminPluginsLoaded')end)
--addons/!lpakr_out/lua/badmin/modules/darkrp/_module.lua:
ba.Module'DarkRP':Author'aStonedPenguin':CustomCheck(function()return rp!=nil end):Include{'commands_sh.lua','misc_sv.lua','misc_sh.lua','sod/sod_sv.lua','sod/sod_sh.lua','loghooks_sh.lua','bans/bans_sh.lua','bans/bans_sv.lua','bans/bans_cl.lua','jails/jails_sh.lua','jails/jails_sv.lua','reserved_slots_sv.lua'}
--addons/!lpakr_out/lua/badmin/modules/notifications/_module.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/notifications/_module.lua:
ba.Module'Notifications':Author'aStonedPenguin':Include{'notifications_sh.lua','notifications_cl.lua'}
--addons/!lpakr_out/lua/badmin/modules/player_blocking/_module.lua:
ba.Module('Player Blocking'):Author('KingofBeast'):Include('init_cl.lua'):Include('init_sh.lua')
--addons/!lpakr_out/lua/badmin/modules/rewards/_module.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/screengrab/_module.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/plugins/antispam_sh.lua:
term.Add('PlayerMutedForProfanity','# has been muted for 30 seconds for attempting to say: #')term.Add('YouMutedForProfanity','You have been muted for 30 seconds for attempting to say: #')term.Add('PlayerMutedForSpam','# has been muted for 30 seconds for chat spam, last message: "#"')term.Add('YouMutedForSpam','You have been muted for 30 seconds for chat spam.')
--addons/!lpakr_out/lua/badmin/plugins/managment_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/wrappers.lua:
local a=FindMetaTable("Entity")local b={}local function c(d,e)b[d]=b[d]||{}if!b[d][e]then local self={}setmetatable(self,{__index=function(self,f)if f=="Wrapper"then return true elseif f=="Entity"then return e elseif d[f]!=nil then return d[f]elseif IsValid(e)&&e:GetTable()[f]!=nil then local g=e:GetTable()[f]if isfunction(g)then return function(self,...)return g(e,...)end else return g end elseif a[f]!=nil then local g=a[f]if isfunction(g)then return function(self,...)return g(e,...)end else return g end end end})b[d][e]=self;return self else return b[d][e]end end;local h={}function a:DrG_Wrap()return c(h,self)end
--addons/!lpakr_out/lua/drgbase/modules/coroutine.lua:
local a=0;local b={}local c={}function DRGLog(d,e,...)end;timer.Create('srp.saveDebug',.5,0,function()local f=util.TableToJSON(c)if f&&f!=''&&#f>2 then file.Write('nextbot_positions.txt',f)end end)local function g()for h,i in pairs(b)do local j=coroutine.status(i.cor)if j=="suspended"then local k,l=coroutine.resume(i.cor)if coroutine.status(i.cor)=="dead"then DRGLog('coroutine.Dead From Suspended',h)if isfunction(i.call)then i.call(k,l)end end elseif j=="dead"then DRGLog('coroutine.Dead',h)coroutine.DrG_Remove(h)end end end;function coroutine.DrG_Create(i,m)local n=coroutine.create(i)local h=a;a=a+1;b[h]={cor=n,call=m}DRGLog('coroutine.DrG_Create',h)hook.Add("Think","DrGBaseCoroutines",g)return n,h end;function coroutine.DrG_Remove(h)b[h]=nil;if table.Count(b)==0 then hook.Remove("Think","DrGBaseCoroutines")end end
--addons/!lpakr_out/lua/drgbase/modules/navmesh.lua:
if CLIENT then return end;local a={}function navmesh.DrG_GetAreaFromCenter(b)return a[tostring(b)]end;for c,d in ipairs(navmesh.GetAllNavAreas())do a[tostring(d:GetCenter())]=d end
--addons/!lpakr_out/lua/dronesrewrite/main.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/cvars.lua:
DRONES_REWRITE.ServerCVars={}DRONES_REWRITE.ClientCVars={}DRONES_REWRITE.ServerCVars.DebugMode=CreateConVar("dronesrewrite_debugmode","0",{FCVAR_ARCHIVE,FCVAR_REPLICATED})cvars.AddChangeCallback("dronesrewrite_debugmode",function(a,b,c)if tobool(c)then DRONES_REWRITE.LogDebug("ENTERING DEBUG MODE !!!")else DRONES_REWRITE.LogDebug("EXITING DEBUG MODE !!!")end end)DRONES_REWRITE.ServerCVars.SpeedCoef=CreateConVar("dronesrewrite_admin_speedcoef","1",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.RotSpeedCoef=CreateConVar("dronesrewrite_admin_rotspeedcoef","1",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.HealthCoef=CreateConVar("dronesrewrite_admin_hpcoef","1",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.DmgCoef=CreateConVar("dronesrewrite_admin_dmgcoef","1",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.NoDamage=CreateConVar("dronesrewrite_admin_nodamage","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.NoLoopSound=CreateConVar("dronesrewrite_admin_noloop","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.NoAmmo=CreateConVar("dronesrewrite_admin_noammo","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.SpawnAsDisabled=CreateConVar("dronesrewrite_admin_spawndisabled","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.RemoveOnDestroyed=CreateConVar("dronesrewrite_admin_remove","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.NoWaiting=CreateConVar("dronesrewrite_admin_nowaiting","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.NoFlyCor=CreateConVar("dronesrewrite_admin_noflycor","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.NoWeps=CreateConVar("dronesrewrite_admin_noweps","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.NoSignalLimit=CreateConVar("dronesrewrite_admin_nosiglim","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.NoShells=CreateConVar("dronesrewrite_admin_noshells","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.MS_DontSpawnStuff=CreateConVar("dronesrewrite_admin_nostuffms","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.NoInterpolation=CreateConVar("dronesrewrite_admin_noint","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.UpdateRate=CreateConVar("dronesrewrite_admin_updrate","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.UseUpdateRate=CreateConVar("dronesrewrite_admin_customrate","0",{FCVAR_ARCHIVE})DRONES_REWRITE.ServerCVars.NoCameraRestrictions=CreateConVar("dronesrewrite_admin_360rotate","0",{FCVAR_ARCHIVE,FCVAR_REPLICATED})DRONES_REWRITE.ServerCVars.CamAllowRestrictions=CreateConVar("dronesrewrite_admin_360cam","0",{FCVAR_ARCHIVE,FCVAR_REPLICATED})DRONES_REWRITE.ServerCVars.StaticCam=CreateConVar("dronesrewrite_admin_staticcam","0",{FCVAR_ARCHIVE,FCVAR_REPLICATED})if CLIENT then DRONES_REWRITE.ClientCVars.DrawHUD=CreateClientConVar("dronesrewrite_hud_drawhud","1",true,false)DRONES_REWRITE.ClientCVars.DrawCrosshair=CreateClientConVar("dronesrewrite_hud_drawcrosshair","1",true,false)DRONES_REWRITE.ClientCVars.DrawHealth=CreateClientConVar("dronesrewrite_hud_drawhealth","1",true,false)DRONES_REWRITE.ClientCVars.DrawTargets=CreateClientConVar("dronesrewrite_hud_drawtargets","1",true,false)DRONES_REWRITE.ClientCVars.DetectDamage=CreateClientConVar("dronesrewrite_hud_drawdamage","1",true,false)DRONES_REWRITE.ClientCVars.DrawRadar=CreateClientConVar("dronesrewrite_hud_drawradar","1",true,false)DRONES_REWRITE.ClientCVars.OverlayDef=CreateClientConVar("dronesrewrite_overlay_usedefault","1",true,false)DRONES_REWRITE.ClientCVars.HUD_useDef=CreateClientConVar("dronesrewrite_hud_usedefault","1",true,false)DRONES_REWRITE.ClientCVars.HUD_customHud=CreateClientConVar("dronesrewrite_curhud","Sci Fi",true,false)DRONES_REWRITE.ClientCVars.CustomOverlay=CreateClientConVar("dronesrewrite_curoverlay","Default",true,false)DRONES_REWRITE.ClientCVars.DrawTpCrosshair=CreateClientConVar("dronesrewrite_cl_crosshairtp","1",true,false)DRONES_REWRITE.ClientCVars.NoGlows=CreateClientConVar("dronesrewrite_cl_noglows","0",true,false)DRONES_REWRITE.ClientCVars.NoScreen=CreateClientConVar("dronesrewrite_cl_noscreen","0",true,false)DRONES_REWRITE.ClientCVars.NoConWin=CreateClientConVar("dronesrewrite_cl_noconwin","0",true,false)DRONES_REWRITE.ClientCVars.DefaultTp=CreateClientConVar("dronesrewrite_cl_deftp","0",true,false)DRONES_REWRITE.ClientCVars.NoConRender=CreateClientConVar("dronesrewrite_cl_noconrender","0",true,false)DRONES_REWRITE.ClientCVars.CamDistanceCoefficient=CreateClientConVar("dronesrewrite_cl_cameradistance","0",true,false)DRONES_REWRITE.ClientCVars.CamOrientation=CreateClientConVar("dronesrewrite_cl_camorientation","Right",true,false)DRONES_REWRITE.ClientCVars.QuickSel=CreateClientConVar("dronesrewrite_cl_quickwepsel","0",true,false)DRONES_REWRITE.ClientCVars.DrawAttachments=CreateClientConVar("dronesrewrite_cl_drawattachments","0",true,false)DRONES_REWRITE.ClientCVars.DisableHell=CreateClientConVar("dronesrewrite_cl_nohell","0",true,false)DRONES_REWRITE.ClientCVars.WvCamOrientation=CreateClientConVar("dronesrewrite_cl_wvcamorientation","Right",true,true)DRONES_REWRITE.ClientCVars.MouseLimit=CreateClientConVar("dronesrewrite_cl_mouselimit","16",true,true)DRONES_REWRITE.ClientCVars.MouseRotation=CreateClientConVar("dronesrewrite_cl_mouserotation","0",true,true)DRONES_REWRITE.ClientCVars.Keys={}for d,e in pairs(DRONES_REWRITE.Keys)do DRONES_REWRITE.ClientCVars.Keys[d]=CreateClientConVar("dronesrewrite_key_"..d,tostring(e),true,true)end end
--addons/!lpakr_out/lua/dronesrewrite/client/clientsettings_menu.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/client/overlay.lua:
return lpakr()()
--addons/!lpakr_out/lua/grapple/sh_movement.lua:
local a=FrameTime;local b=Vector(0,0,1)hook.Add('SetupMove','gGrap.SetupMove',function(c,d,e)if!IsValid(c.Grapple)then return end;local f=d:GetOrigin()local g=c:GetMaxSpeed()*0.6;local h=d:GetForwardSpeed()/10000;local i=c:GetAimVector():Dot(b)local j=b*i*h*g;local k=f+j*a()d:SetVelocity(j)d:SetOrigin(k)if SERVER&&(d:KeyDown(IN_JUMP)||d:KeyDown(IN_USE)||f.z-2<=c.Grapple.GrappleData.Ground.z&&d:KeyDown(IN_BACK))then c.Grapple:EndTouch(c)end end)
--addons/ssrp_lfs/lua/lvs_framework/autorun/cl_camera.lua:

function LVS:CalcView( vehicle, ply, pos, angles, fov, pod )
	local view = {}
	view.origin = pos
	view.angles = angles
	view.fov = fov
	view.drawviewer = false

	if not pod:GetThirdPersonMode() then return view end

	local mn = vehicle:OBBMins()
	local mx = vehicle:OBBMaxs()
	local radius = ( mn - mx ):Length()
	local radius = radius + radius * pod:GetCameraDistance()

	local TargetOrigin = view.origin + ( view.angles:Forward() * -radius ) + view.angles:Up() * radius * pod:GetCameraHeight()
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
	view.drawviewer = true

	if tr.Hit and  not tr.StartSolid then
		view.origin = view.origin + tr.HitNormal * WallOffset
	end

	return view
end

local Zoom = 0
hook.Add( "CalcView", "!!!!LVS_calcview", function(ply, pos, angles, fov)
	if ply:GetViewEntity() ~= ply then return end

	local pod = ply:GetVehicle()
	local vehicle = ply:lvsGetVehicle()

	if not IsValid( pod ) or not IsValid( vehicle ) then return end

	local TargetZoom = ply:lvsKeyDown( "ZOOM" ) and 0 or 1

	Zoom = Zoom + (TargetZoom - Zoom) * RealFrameTime() * 10

	local newfov = fov * Zoom + 40 * (1 - Zoom)

	local base = pod:lvsGetWeapon()

	if IsValid( base ) then
		local weapon = base:GetActiveWeapon()

		if weapon and weapon.CalcView then
			return weapon.CalcView( base, ply, pos, angles, newfov, pod )
		else
			return vehicle:LVSCalcView( ply, pos, angles, newfov, pod )
		end
	else
		local weapon = vehicle:GetActiveWeapon()

		if weapon and weapon.CalcView then
			return weapon.CalcView( vehicle, ply, pos, angles, newfov, pod )
		else
			return vehicle:LVSCalcView( ply, pos, angles, newfov, pod )
		end
	end
end )

--addons/!lpakr_out/lua/autorun/netstream.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/init.lua:
pac=pac||{}pac.LocalPlayer=LocalPlayer()pac.LocalViewModel=pac.LocalPlayer:IsValid()&&pac.LocalPlayer:GetViewModel()||NULL;pac.LocalHands=pac.LocalPlayer:IsValid()&&pac.LocalPlayer:GetHands()||NULL;do local a=CreateClientConVar("pac_enable","1",true)cvars.AddChangeCallback("pac_enable",function(b,c,d)if c==d then return end;if tobool(d)then pac.Enable()else pac.Disable()end end)function pac.IsEnabled()return a:GetBool()end;function pac.Enable()pac.EnableDrawnEntities(true)pac.EnableAddedHooks()pac.CallHook("Enable")a:SetBool(true)end;function pac.Disable()pac.EnableDrawnEntities(false)pac.DisableAddedHooks()pac.CallHook("Disable")a:SetBool(false)end end;include("util.lua")include("class.lua")pac.CompileExpression=include("pac3/libraries/expression.lua")pac.resource=include("pac3/libraries/resource.lua")pac.animations=include("pac3/libraries/animations.lua")include("pac3/core/shared/init.lua")pac.urltex=include("pac3/libraries/urltex.lua")include("parts.lua")include("max_render_time.lua")include("part_pool.lua")include("bones.lua")include("hooks.lua")include("owner_name.lua")include("integration_tools.lua")include("ear_grab_animation.lua")pac.LoadParts()hook.Add("OnEntityCreated","pac_init",function(e)local f=LocalPlayer()if!f:IsValid()then return end;pac.LocalPlayer=f;pac.LocalViewModel=pac.LocalPlayer:GetViewModel()pac.LocalHands=pac.LocalPlayer:GetHands()pac.in_initialize=true;hook.Run("pac_Initialized")pac.in_initialize=nil;hook.Remove("OnEntityCreated","pac_init")end)
--addons/!lpakr_out/lua/pac3/core/shared/entity_mutators/blood_color.lua:
local a={}a.ClassName="blood_color"function a:WriteArguments(b)assert(b>=-1&&b<=6,"invalid blood color")net.WriteInt(b,8)end;function a:ReadArguments()return net.ReadInt(8)end;pac.emut.Register(a)
--addons/!lpakr_out/lua/pac3/core/client/part_pool.lua:
local pac=pac;local a=render.SetColorModulation;local b=render.SetBlend;local c=render.ModelMaterialOverride;local d=render.MaterialOverride;local SysTime=SysTime;local NULL=NULL;local pairs=pairs;local e=false;local f=false;local IsEntity=IsEntity;local next=next;local g=FindMetaTable('Entity')local h=FindMetaTable('Player')local i=g.IsValid;local j=h.Alive;local function k(l)return IsEntity(l)&&pcall(l.GetPos,l)end;local function m(l)return IsEntity(l)&&pcall(l.UniqueID,l)end;local function n(l,o)timer.Simple(0,function()if!l:IsValid()then o()end end)end;function pac.ForceRendering(p)e=p;if p then f=p end end;local q=_G.pac_local_parts||{}local r=_G.pac_all_parts||{}local s=_G.pac_uid_parts||{}if game.SinglePlayer()||player.GetCount()==1&&LocalPlayer():IsSuperAdmin()then _G.pac_local_parts=q;_G.pac_all_parts=r;_G.pac_uid_parts=s end;local function t(u)return s[u]||{}end;local function v(l)local u=i(l)&&pac.Hash(l)return s[u]||{}end;do local function w(l,x)local y=q[l]if y==nil||next(y)==nil then pac.UnhookEntityRender(l)goto z end;if x=="update_legacy_bones"then pac.ResetBones(l)for A,B in next,y do if B:IsValid()then if!B:HasParent()then B:CallRecursive("BuildBonePositions")end else y[A]=nil end end elseif x=="update"then for A,B in next,y do if B:IsValid()then if!B:HasParent()then B:CallRecursive("Think")end else y[A]=nil end end else for A,B in next,y do if B:IsValid()then if!B:HasParent()then if B.OwnerName=="viewmodel"&&x=="viewmodel"||B.OwnerName=="hands"&&x=="hands"||B.OwnerName!="viewmodel"&&B.OwnerName!="hands"&&x!="viewmodel"&&x!="hands"then if!B:IsDrawHidden()then B:CallRecursive("Draw",x)end end end else y[A]=nil end end end::z::a(1,1,1)b(1)d()c()end;local function C(D)ErrorNoHalt(debug.traceback(D))end;function pac.RenderOverride(l,x)if l.pac_error then return end;if pac.IsRenderTimeExceeded(l)then if x=="opaque"then pac.DrawRenderTimeExceeded(l)end;return end;local E=SysTime()local F,G=xpcall(w,C,l,x)pac.RecordRenderTime(l,x,E)if!F then pac.Message("failed to render ",tostring(l),":")if l==pac.LocalPlayer then chat.AddText("your pac3 outfit failed to render!")chat.AddText(G)chat.AddText("hiding your outfit to prevent further errors")end;l.pac_error=G;table.insert(pac.Errors,G)pac.HideEntityParts(l)else l.pac_error=nil end end;function pac.GetRenderTimeInfo(l)return l.pac_rendertime||{}end end;function pac.HideEntityParts(l)if q[l]&&l.pac_drawing then for H,B in pairs(q[l])do B:HideFromRendering()end;pac.ResetBones(l)l.pac_drawing=false end end;function pac.ShowEntityParts(l)if!q[l]||l.pac_shouldnotdraw||l.pac_ignored then return end;if!l.pac_drawing then for H,B in pairs(q[l])do B:ShowFromRendering()end;pac.ResetBones(l)l.pac_drawing=true;l.pac_error=nil elseif l.pac_fix_show_from_render&&l.pac_fix_show_from_render<SysTime()then for H,B in pairs(q[l])do B:ShowFromRendering()end;l.pac_fix_show_from_render=nil end end;function pac.EnableDrawnEntities(I)for l in next,pac.drawn_entities do if l:IsValid()then if I then pac.ShowEntityParts(l)else pac.HideEntityParts(l)end else pac.drawn_entities[l]=nil end end end;function pac.HookEntityRender(l,B)local y=q[l]if!y then y={}q[l]=y end;if y[B]then return false end;pac.dprint("hooking render on %s to draw part %s",tostring(l),tostring(B))pac.drawn_entities[l]=true;y[B]=B;l.pac_has_parts=true;B:ShowFromRendering()return true end;function pac.UnhookEntityRender(l,B)if B&&q[l]then q[l][B]=nil end;if q[l]&&!next(q[l])||!B then q[l]=nil;l.pac_has_parts=nil;pac.drawn_entities[l]=nil;if l.pac_bones_once then pac.ResetBones(l)l.pac_bones_once=nil end end;if B then B:HideFromRendering()end end;pac.AddHook("Think","events",function()for H,J in ipairs(player.GetAll())do if!q[J]then continue end;if pac.IsEntityIgnored(J)then continue end;if j(J)then if J.pac_revert_ragdoll then J.pac_revert_ragdoll()J.pac_revert_ragdoll=nil end;continue end;local K=J:GetRagdollEntity()if!i(K)then pac.HideEntityParts(J)continue end;if J.pac_ragdoll==K then continue end;J.pac_ragdoll=K;K.pac_ragdoll_owner=J;K=hook.Run("PACChooseDeathRagdoll",J,K)||K;if J.pac_death_physics_parts then if J.pac_physics_died then return end;for H,B in pairs(t(pac.Hash(J)))do if B.is_model_part then local l=B:GetOwner()if l:IsValid()then K:SetNoDraw(true)B.skip_orient=true;l:SetParent(NULL)l:SetNoDraw(true)l:PhysicsInitBox(Vector(1,1,1)*-5,Vector(1,1,1)*5)l:SetCollisionGroup(COLLISION_GROUP_DEBRIS)local L=l:GetPhysicsObject()L:AddAngleVelocity(VectorRand()*1000)L:AddVelocity(J:GetVelocity()+VectorRand()*30)L:Wake()function l.RenderOverride()if B:IsValid()then if!B.HideEntity then B:PreEntityDraw(l,l,l:GetPos(),l:GetAngles())l:DrawModel()B:PostEntityDraw(l,l,l:GetPos(),l:GetAngles())end else l.RenderOverride=nil end end end end end;J.pac_physics_died=true elseif J.pac_death_ragdollize||J.pac_death_ragdollize==nil then pac.HideEntityParts(J)for H,B in pairs(q[J])do B:SetOwner(K)end;K:SetOwner(J)pac.ShowEntityParts(K)J.pac_revert_ragdoll=function()J.pac_ragdoll=nil;if!q[J]then return end;pac.HideEntityParts(K)for H,B in pairs(q[J])do B:SetOwner(J)end;pac.ShowEntityParts(J)end end end;if pac.last_flashlight_on!=pac.LocalPlayer:FlashlightIsOn()then local M=ProjectedTexture()M:SetTexture("effects/flashlight001")M:SetFarZ(5000)M:SetColor(Color(0,0,0,255))M:SetPos(pac.LocalPlayer:EyePos()-pac.LocalPlayer:GetAimVector()*400)M:SetAngles(pac.LocalPlayer:EyeAngles())M:Update()hook.Add("PostRender","pac_flashlight_stuck_fix",function()hook.Remove("PostRender","pac_flashlight_stuck_fix")M:Remove()end)pac.last_flashlight_on=pac.LocalPlayer:FlashlightIsOn()end;for l in next,pac.drawn_entities do if i(l)then if l.pac_drawing&&l:IsPlayer()then l.pac_traceres=util.QuickTrace(l:EyePos(),l:GetAimVector()*32000,{l,l:GetVehicle(),l:GetOwner()})l.pac_hitpos=l.pac_traceres.HitPos end else pac.drawn_entities[l]=nil end end;if pac.next_frame_funcs then for N,O in pairs(pac.next_frame_funcs)do O()end;for P,A in ipairs(table.GetKeys(pac.next_frame_funcs))do pac.next_frame_funcs[A]=nil end end;if pac.next_frame_funcs_simple&&#pac.next_frame_funcs_simple!=0 then for P,O in ipairs(pac.next_frame_funcs_simple)do O()end;for P=#pac.next_frame_funcs_simple,1,-1 do pac.next_frame_funcs_simple[P]=nil end end end)pac.AddHook("EntityRemoved","change_owner",function(l)if k(l)then if m(l)then local y=v(l)if next(y)!=nil then n(l,function()for H,B in pairs(y)do if B.dupe_remove then B:Remove()end end end)end else local Q=l:GetOwner()if m(Q)then local y=v(Q)if next(y)!=nil then n(l,function()for H,B in pairs(y)do if B.ClassName=="group"then if B:GetOwnerName()=="hands"then B:UpdateOwnerName()end;B:HideInvalidOwners()end end end)end end end end end)pac.AddHook("OnEntityCreated","change_owner",function(l)if!k(l)then return end;local Q=l:GetOwner()if k(Q)&&(!Q:IsPlayer()||m(Q))then for H,B in pairs(v(Q))do if B.ClassName=="group"then B:UpdateOwnerName(l,false)end end end end)function pac.RemovePartsFromUniqueID(R)for H,B in pairs(t(R))do if!B:HasParent()then B:Remove()end end end;function pac.UpdatePartsWithMetatable(S)for H,B in pairs(r)do if S.ClassName==B.ClassName then for N,T in pairs(S)do if isfunction(T)then B[N]=T end end end end end;function pac.GetPropertyFromName(U,V,W)for H,B in pairs(v(W))do if B[U]&&V==B.Name then return B[U](B)end end end;function pac.RemoveUniqueIDPart(X,R)if!s[X]then return end;s[X][R]=nil end;function pac.SetUniqueIDPart(X,R,B)s[X]=s[X]||{}s[X][R]=B;pac.NotifyPartCreated(B)end;function pac.AddPart(B)r[B.Id]=B end;function pac.RemovePart(B)r[B.Id]=nil end;function pac.GetLocalParts()return s[pac.Hash(pac.LocalPlayer)]||{}end;function pac.GetPartFromUniqueID(u,Y)return s[u]&&s[u][Y]||NULL end;function pac.FindPartByName(u,Z,_)if s[u]then if s[u][Z]then return s[u][Z]end;for H,B in pairs(s[u])do if B==_ then continue end;if B:GetName()==Z then return B end end;for H,B in pairs(s[u])do if B==_ then continue end;if pac.StringFind(B:GetName(),Z)then return B end end;for H,B in pairs(s[u])do if B==_ then continue end;if pac.StringFind(B:GetName(),Z,true)then return B end end end;return NULL end;function pac.GetLocalPart(Y)local u=pac.Hash(pac.LocalPlayer)return s[u]&&s[u][Y]||NULL end;function pac.RemoveAllParts(a0,a1)if a1&&pace then pace.RemovePartOnServer("__ALL__")end;for H,B in pairs(a0&&pac.GetLocalParts()||r)do if B:IsValid()then local a2,G=pcall(B.Remove,B)if!a2 then pac.Message('Failed to remove part: '..G..'!')end end end;if!a0 then r={}s={}end end;function pac.UpdateMaterialParts(a3,R,self,a4)pac.RunNextFrame("material "..a3 .." "..self.Id,function()for H,B in pairs(t(R))do if a3=="update"||a3=="remove"then if B.Materialm==a4&&self!=B then if a3=="update"then B.force_translucent=self.Translucent else B.force_translucent=nil;B.Materialm=nil end end elseif a3=="show"then if B.Material&&B.Material!=""&&B.Material==a4 then B:SetMaterial(a4)end end end end)end;function pac.NotifyPartCreated(B)local u=B:GetPlayerOwnerId()if!s[u]then return end;for H,a5 in pairs(s[u])do a5:OnOtherPartCreated(B)if B:GetPlayerOwner()==pac.LocalPlayer then pac.CallHook("OnPartCreated",B)end end end;function pac.CallRecursiveOnAllParts(a6,...)for H,B in pairs(r)do if B[a6]then local a7=B[a6](B,...)if a7!=nil then return a7 end end end end;function pac.CallRecursiveOnOwnedParts(l,a6,...)local a8=v(l)for H,B in pairs(a8)do if B[a6]then local a7=B[a6](B,...)if a7!=nil then return a7 end end end end;function pac.EnablePartsByClass(a9,aa)for H,B in pairs(r)do if B.ClassName==a9 then B:SetEnabled(aa)end end end;cvars.AddChangeCallback("pac_hide_disturbing",function()for H,B in pairs(r)do if B:IsValid()then B:UpdateIsDisturbing()end end end,"PAC3")do local pac=pac;local FrameNumber=FrameNumber;local RealTime=RealTime;local GetConVar=GetConVar;local EF_BONEMERGE=EF_BONEMERGE;local RENDERMODE_TRANSALPHA=RENDERMODE_TRANSALPHA;local ab=CreateClientConVar("pac_draw_distance","500")pac.Errors={}pac.firstperson_parts=pac.firstperson_parts||{}pac.EyePos=vector_origin;pac.drawn_entities=pac.drawn_entities||{}pac.RealTime=0;pac.FrameNumber=0;local ac=CreateConVar('pac_optimization_render_once_per_frame','0',{FCVAR_ARCHIVE},'render only once per frame (will break water reflections and vr)')local function ad()local ae=0;local af=0;local ag=0;return function(ah)if!ah then if e then return end;if!ac:GetBool()then return end end;local ai=FrameNumber()if ai==ae then af=af+1 else ae=ai;if ag!=af then ag=af end;af=1 end;return af<ag end end;do local aj=0;local ak=0;local al=0;local am=0;local an;pac.AddHook("Think","update_parts",function()pac.LocalPlayer=LocalPlayer()pac.LocalViewModel=pac.LocalPlayer:GetViewModel()pac.LocalHands=pac.LocalPlayer:GetHands()pac.RealTime=RealTime()pac.FrameNumber=pac.FrameNumber+1;aj=ab:GetInt()an=an||GetConVar("pac_sv_draw_distance")ak=an:GetFloat()al=0;if aj<=0 then aj=32768 end;if ak<=0 then ak=32768 end;aj=math.min(ak,aj)for l in next,pac.drawn_entities do if!i(l)then pac.drawn_entities[l]=nil;goto ao end;if l:IsDormant()then goto ao end;pac.ResetRenderTime(l)am=l:EyePos():Distance(pac.EyePos)al=l:BoundingRadius()*3*(l:GetModelScale()||1)if l:IsPlayer()||i(l.pac_ragdoll_owner)then local J=l.pac_ragdoll_owner||l;local K=J.pac_ragdoll;if i(K)&&(J.pac_death_hide_ragdoll||J.pac_draw_player_on_death)then K:SetRenderMode(RENDERMODE_TRANSALPHA)local ap=K:GetColor()ap.a=0;K:SetColor(ap)K:SetNoDraw(true)if K:GetParent()!=J then K:SetParent(l)K:AddEffects(EF_BONEMERGE)end;if J.pac_draw_player_on_death then J:DrawModel()end end;if al<32 then al=128 end elseif!l:IsNPC()then al=al*4 end;local aq=l.IsPACWorldEntity;if(l==pac.LocalHands||l==pac.LocalViewModel)&&!pac.LocalPlayer:ShouldDrawLocalPlayer()then aq=true end;if!aq&&l==pac.LocalPlayer then aq=l:ShouldDrawLocalPlayer()end;if!aq&&l.pac_camera then aq=l.pac_camera:IsValid()end;if!aq&&l!=pac.LocalPlayer then if l.pac_draw_distance then aq=l.pac_draw_distance<=0||am<=l.pac_draw_distance else aq=am<=aj end end;l.pac_is_drawing=aq;if aq then pac.ShowEntityParts(l)pac.RenderOverride(l,"update")else if f then f=false;return end;pac.HideEntityParts(l)end::ao::end;pac.FrameNumber=pac.FrameNumber+1 end)end;local ar=false;function pac.SetupBones(l)if ar then return end;ar=true;local F,G=pcall(l.SetupBones,l)ar=false;if!F then error(G)end end;do local as=ad()pac.AddHook("PreDrawOpaqueRenderables","draw_opaque",function(at,au)if as(true)then return end;for l in next,pac.drawn_entities do if l.pac_is_drawing&&q[l]&&!l:IsDormant()then pac.RenderOverride(l,"update_legacy_bones")end end end)local as=ad()pac.AddHook("PostDrawOpaqueRenderables","draw_opaque",function(at,au,av)if as()then return end;for l in next,pac.drawn_entities do if l.pac_is_drawing&&q[l]&&!l:IsDormant()then if av&&!l:GetNW2Bool("pac_in_skybox")then continue end;pac.RenderOverride(l,"opaque")end end end)end;do local as=ad()pac.AddHook("PostDrawTranslucentRenderables","draw_translucent",function(at,au,av)if as()then return end;for l in next,pac.drawn_entities do if l.pac_is_drawing&&q[l]&&!l:IsDormant()then if av&&!l:GetNW2Bool("pac_in_skybox")then continue end;pac.RenderOverride(l,"translucent")end end end)end;pac.AddHook("UpdateAnimation","update_animation_parts",function(J)if J.pac_is_drawing&&q[J]then local y=q[J]for H,B in pairs(y)do B:CallRecursive("OnUpdateAnimation",J)end end end)local aw=false;pac.AddHook("PostDrawViewModel","draw_firstperson",function(ax,ay,az)if aw then return end;for l in next,pac.drawn_entities do if i(l)then if l.pac_drawing&&q[l]then aw=true;pac.RenderOverride(l,"viewmodel")aw=false end else pac.drawn_entities[l]=nil end end end)local aA=false;pac.AddHook("PostDrawPlayerHands","draw_firstperson_hands",function(aB,ax,ay,az)if aA then return end;for l in next,pac.drawn_entities do if i(l)then if l.pac_drawing&&q[l]then aA=true;pac.RenderOverride(l,"hands")aA=false end else pac.drawn_entities[l]=nil end end end)end
--addons/!lpakr_out/lua/pac3/core/client/base_part.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/flex.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/group.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/halo.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/holdtype.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/light.lua:
local DynamicLight=DynamicLight;local a,b=pac.PartTemplate("base_drawable")b.FriendlyName="light"b.ClassName="light2"b.Group='effects'b.Icon='icon16/lightbulb.png'b.ProperColorRange=true;a:StartStorableVars()a:GetSet("InnerAngle",0)a:GetSet("OuterAngle",0)a:GetSet("NoModel",false)a:GetSet("NoWorld",false)a:SetPropertyGroup("appearance")a:GetSet("Brightness",8)a:GetSet("Size",100,{editor_sensitivity=0.25})a:GetSet("Color",Vector(1,1,1),{editor_panel="color2"})a:EndStorableVars()function b:GetLight()if!self.light then self.light=DynamicLight(tonumber(self:GetPrintUniqueID(),16))end;self.light.decay=0;self.light.dietime=math.huge;return self.light end;function b:RemoveLight()if!self.light then return end;local c=self.light;self.light=nil;c.pos=Vector(9999,9999,9999)timer.Simple(0,function()c.dietime=0 end)end;function b:GetNiceName()local d=self:GetColor()local e=pac.ColorToNames({r=d[1]*255,g=d[2]*255,b=d[3]*255})return e.." light"end;local f={"InnerAngle","OuterAngle","NoWorld","NoModel","Brightness","Color","Size"}function b:OnShow()for g,h in ipairs(f)do self["Set"..h](self,self["Get"..h](self))end end;function b:OnDraw()local i,j=self:GetDrawPosition()self:GetLight().pos=i;self:GetLight().dir=j:Forward()end;function b:SetSize(k)self.Size=k;self:GetLight().size=k end;function b:SetColor(k)self.Color=k;self:GetLight().r=math.Clamp(k.r*255,0,255)self:GetLight().g=math.Clamp(k.g*255,0,255)self:GetLight().b=math.Clamp(k.b*255,0,255)end;function b:SetBrightness(k)self.Brightness=k;self:GetLight().brightness=k end;function b:SetNoModel(k)self.NoModel=k;self:GetLight().nomodel=k end;function b:SetNoWorld(k)self.NoWorld=k;self:GetLight().noworld=k end;function b:SetInnerAngle(k)self.InnerAngle=k;self:GetLight().innerangle=k end;function b:SetOuterAngle(k)self.OuterAngle=k;self:GetLight().outerangle=k end;function b:OnHide()self:RemoveLight()end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/material.lua:
local a=include("pac3/libraries/shader_params.lua")local b=GetConVar("mat_hdr_level")local c={debug=bit.lshift(1,0),no_debug_override=bit.lshift(1,1),no_draw=bit.lshift(1,2),use_in_fillrate_mode=bit.lshift(1,3),vertexcolor=bit.lshift(1,4),vertexalpha=bit.lshift(1,5),selfillum=bit.lshift(1,6),additive=bit.lshift(1,7),alphatest=bit.lshift(1,8),multipass=bit.lshift(1,9),znearer=bit.lshift(1,10),model=bit.lshift(1,11),flat=bit.lshift(1,12),nocull=bit.lshift(1,13),nofog=bit.lshift(1,14),ignorez=bit.lshift(1,15),decal=bit.lshift(1,16),envmapsphere=bit.lshift(1,17),noalphamod=bit.lshift(1,18),envmapcameraspace=bit.lshift(1,19),basealphaenvmapmask=bit.lshift(1,20),translucent=bit.lshift(1,21),normalmapalphaenvmapmask=bit.lshift(1,22),needs_software_skinning=bit.lshift(1,23),opaquetexture=bit.lshift(1,24),envmapmode=bit.lshift(1,25),suppress_decals=bit.lshift(1,26),halflambert=bit.lshift(1,27),wireframe=bit.lshift(1,28),allowalphatocoverage=bit.lshift(1,29),ignore_alpha_modulation=bit.lshift(1,30)}local function d(e,f)if isstring(e)then e={e}end;local g=0;for h,i in pairs(e)do if i then local j=f[i]||f[h]if!j then error("invalid flag",2)end;g=bit.bor(g,tonumber(j))end end;return g end;local function k(e,f)if!e then return f.default_valid_flag end;local g={}for h,i in pairs(f)do if bit.band(e,i)>0 then g[h]=true end end;return g end;local l={vertexlitgeneric="3d",unlitgeneric="2d",eyerefract="eye refract"}for m,n in pairs(a.shaders)do for o,p in pairs(a.base)do if n[o]then for h,i in pairs(p)do if!n[o][h]then n[o][h]=i end end else n[o]=p end end end;for m,n in pairs(a.shaders)do local q=CreateMaterial(tostring({}),m,{})local r,s=pac.PartTemplate("base")s.ClassName="material_"..(l[m]||m)s.Description=m;s.ProperColorRange=true;if m=="vertexlitgeneric"then s.FriendlyName="material"s.Group={'modifiers','model','entity'}else s.FriendlyName="material "..m;s.Group="advanced"end;s.Icon="icon16/paintcan.png"r:StartStorableVars()r:SetPropertyGroup("generic")r:GetSet("LoadVmt","",{editor_panel="material"})function s:SetLoadVmt(t)if!t||t==""then return end;local u=file.Read("materials/"..t..".vmt","GAME")if!u then return end;local v=util.KeyValuesToTable(u)local w=u:match("^(.-)%{"):gsub("%p",""):Trim()for h,i in pairs(self:GetVars())do local x=s.ShaderParams[h]if x&&x.default!=nil then self["Set"..h](self,x.default)end;if x&&x.type=="texture"then self["Set"..h](self,"")end end;print(u)print("======")PrintTable(v)print("======")for h,i in pairs(v)do if h:StartWith("$")then h=h:sub(2)end;local y=self["Set"..h]if y then local z=s.ShaderParams[h]if isstring(i)then if i:find("[",nil,true)then i=Vector(i:gsub("[%[%]]",""):gsub("%s+"," "):Trim())if isnumber(z.default)then i=i.x end elseif i:find("{",nil,true)then i=Vector(i:gsub("[%{%}]",""):gsub("%s+"," "):Trim())if z.type=="color"then i=i/255 end end end;if isnumber(i)then if z.type=="bool"||z.is_flag then i=i==1 end end;y(self,i)else pac.Message("cannot convert material parameter "..h)end end end;r:GetSet("MaterialOverride","all",{enums=function(self,u)local A={}if pace.current_part:GetOwner():IsValid()then A=pace.current_part:GetOwner():GetMaterials()end;table.insert(A,"all")local B={}for C,i in ipairs(A)do i=i:match(".+/(.+)")||i;B[i]=i:lower()end;return B end})local function D(self,E,F)pac.RunNextFrameSimple(function()if!IsValid(self)&&!E then return end;local G=self:GetName()for C,H in ipairs(self:GetRootPart():GetChildrenList())do if H.GetMaterials then for C,t in ipairs(H.Materials:Split(";"))do if t==G then H:SetMaterials(H.Materials)break end end end end;local u=self.MaterialOverride;F=F||self:GetParent()local I=0;if F:IsValid()then if tonumber(u)then I=tonumber(u)elseif u!="all"&&F:GetOwner():IsValid()then for J,i in ipairs(F:GetOwner():GetMaterials())do if(i:match(".+/(.+)")||i):lower()==u:lower()then I=J;break end end end;F.material_override=F.material_override||{}F.material_override[I]=F.material_override[I]||{}for C,K in pairs(F.material_override)do for J,i in ipairs(K)do if i==self then table.remove(K,J)break end end end;if!E then table.insert(F.material_override[I],self)end end end)end;function s:Initialize()self.translation_vector=Vector()self.rotation_angle=Angle(0,0,0)end;function s:GetNiceName()local t=""if m=="refract"then t=self:Getnormalmap()elseif m=="eyerefract"then t=self:Getiris()else t=self:Getbasetexture()end;t=t:gsub("%%(..)",function(L)local I=tonumber("0x"..L)if I then return string.char(I)end end)local G=("/"..t):match(".+/(.-)%.")||("/"..t):match(".+/(.+)")local M=(pac.PrettifyName(G)||"no texture").." | "..m;return M end;function s:SetMaterialOverride(I)self.MaterialOverride=I;D(self)end;function s:OnThink()if self:GetOwner():IsValid()then local A=self:GetOwner():GetMaterials()if A&&#A!=self.last_material_count then D(self)self.last_material_count=#A end end end;s.ShaderParams={}s.TransformVars={}local N={}for h,i in pairs(n)do table.insert(N,{k=h,v=i})end;table.sort(N,function(O,P)return O.k:lower()<P.k:lower()end)for C,i in ipairs(N)do local Q,R=i.k,i.v;local S={}for h,i in pairs(R)do table.insert(S,{k=h,v=i})end;table.sort(S,function(O,P)return O.k:lower()<P.k:lower()end)for C,i in ipairs(S)do local T,z=i.k,i.v;s.ShaderParams[T]=z;if z.is_flag&&Q=="generic"then r:SetPropertyGroup("flags")else r:SetPropertyGroup(Q)end;if z.default==nil then if z.type=="vec3"then z.default=Vector(0,0,0)elseif z.type=="color"then z.default=Vector(1,1,1)elseif z.type=="float"then z.default=0 elseif z.type=="vec2"then z.default=Vector(0,0)end end;local U=T;local V=(z.description||"").." ($"..T..")"if z.type=="matrix"then local W=U.."Position"local X=U.."Scale"local Y=U.."Angle"local Z=U.."AngleCenter"local _=z.friendly:gsub("Transform","")r:GetSet(W,Vector(0,0,0),{editor_friendly=_.."Position",description=V})r:GetSet(X,Vector(1,1,1),{editor_friendly=_.."Scale",description=V})r:GetSet(Y,0,{editor_panel="number",editor_friendly=_.."Angle",description=V})r:GetSet(Z,Vector(0.5,0.5,0),{editor_friendly=_.."AngleCenter",description=V})s.TransformVars[W]=true;s.TransformVars[X]=true;s.TransformVars[Y]=true;s.TransformVars[Z]=true;local a0="$"..T;local function a1(self)self.matrix=self.matrix||Matrix()self.matrix:Identity()self.matrix:Translate(self.translation_vector)self.matrix:Translate(self[Z])self.matrix:Rotate(self.rotation_angle)self.matrix:Translate(-self[Z])self.matrix:SetScale(self[X])end;s["Set"..W]=function(self,a2)self[W]=a2;self.translation_vector.x=self[W].x;self.translation_vector.y=self[W].y;a1(self)self:GetRawMaterial():SetMatrix(a0,self.matrix)end;s["Set"..X]=function(self,a2)self[X]=a2;a1(self)self:GetRawMaterial():SetMatrix(a0,self.matrix)end;s["Set"..Y]=function(self,I)self[Y]=I;self.rotation_angle.y=self[Y]*360;a1(self)self:GetRawMaterial():SetMatrix(a0,self.matrix)end;s["Set"..Z]=function(self,a2)self[Z]=a2;a1(self)self:GetRawMaterial():SetMatrix(a0,self.matrix)end elseif z.type=="texture"then local a3="Get"..U.."NoHDR"if z.partial_hdr then r:GetSet(U.."NoHDR",false,{editor_friendly=z.friendly.." No HDR",description="Disables bound param when HDR is enabled"})end;z.default=z.default||""r:GetSet(U,z.default,{editor_panel="textures",editor_friendly=z.friendly,description=V,shader_param_info=z})local T="$"..T;s["Set"..U.."NoHDR"]=function(self,a4)self[U.."NoHDR"]=a4;s["Set"..U](self,self[U])end;s["Set"..U]=function(self,a4)self[U]=a4;if a4==""||z.partial_hdr&&b:GetInt()>0&&self[a3](self)then self:GetRawMaterial():SetUndefined(T)self:GetRawMaterial():Recompute()else if!pac.resource.DownloadTexture(a4,function(a5,a6)if a6 then self.vtf_frame_limit=self.vtf_frame_limit||{}self.vtf_frame_limit[U]=a6 end;self:GetRawMaterial():SetTexture(T,a5)end,self:GetPlayerOwner())then self:GetRawMaterial():SetTexture(T,a4)local a7=self:GetRawMaterial():GetTexture(T)if a7 then self.vtf_frame_limit=self.vtf_frame_limit||{}self.vtf_frame_limit[U]=a7:GetNumAnimationFrames()end end end end else r:GetSet(U,z.default,{editor_friendly=z.friendly,enums=z.enums,description=V,editor_sensitivity=(z.type=="vec3"||z.type=="color")&&0.25||nil,editor_panel=z.type=="color"&&"color2"||U=="model"&&"boolean"||nil,editor_round=z.type=="integer"})local a8=T;local T="$"..T;if isnumber(z.default)then s["Set"..U]=function(self,a4)self[U]=a4;local a9=self:GetRawMaterial()a9:SetFloat(T,a4)if z.recompute then a9:Recompute()end end;if U:lower():find("frame")then s["Set"..U]=function(self,a4)self[U]=a4;if self.vtf_frame_limit&&z.linked&&self.vtf_frame_limit[z.linked]then self:GetRawMaterial():SetInt(T,math.abs(a4)%self.vtf_frame_limit[z.linked])else self:GetRawMaterial():SetInt(T,a4)end end end elseif isbool(z.default)then if z.is_flag then s["Set"..U]=function(self,a4)self[U]=a4;local a9=self:GetRawMaterial()local B=k(a9:GetInt("$flags"),c)B[a8]=a4;a9:SetInt("$flags",d(B,c))a9:Recompute()end else s["Set"..U]=function(self,a4)if isvector(a4)then a4=a4==Vector(1,1,1)&&true||false end;self[U]=a4;local a9=self:GetRawMaterial()a9:SetInt(T,a4&&1||0)if z.recompute then a9:Recompute()end end end elseif isvector(z.default)||z.type=="vec3"||z.type=="vec2"then s["Set"..U]=function(self,a4)if isstring(a4)then a4=Vector()end;self[U]=a4;local a9=self:GetRawMaterial()a9:SetVector(T,a4)if z.recompute then a9:Recompute()end end elseif z.type=="vec4"then s["Set"..U]=function(self,a4)local aa,ab,ac,ad;if isstring(a4)then aa,ab,ac,ad=unpack(a4:Split(" "))aa=tonumber(aa)||0;ab=tonumber(ab)||0;ac=tonumber(ac)||0;ad=tonumber(ad)||0 elseif isvector(a4)then aa,ab,ac=a4.x,a4.y,a4.z;ad=0 else aa,ab,ac,ad=0,0,0,0 end;self[U]=("%f %f %f %f"):format(aa,ab,ac,ad)local a9=self:GetRawMaterial()a9:SetString(T,("[%f %f %f %f]"):format(aa,ab,ac,ad))if z.recompute then a9:Recompute()end end end end end end;r:EndStorableVars()function s:GetRawMaterial()if!self.Materialm then self.material_name=tostring({})local a9=pac.CreateMaterial(self.material_name,m,{})self.Materialm=a9;for h,i in pairs(self:GetVars())do if s.ShaderParams[h]&&s.ShaderParams[h].default!=nil then self["Set"..h](self,i)end end end;return self.Materialm end;function s:OnParent(F)D(self)end;function s:OnRemove()D(self,true)end;function s:OnUnParent(F)D(self,true,F)end;function s:OnHide()D(self,true)end;function s:OnShow()D(self)end;r:Register()end
--addons/!lpakr_out/lua/pac3/core/client/parts/motion_blur.lua:
local a=render.SetBlend;local b=table.insert;local c=table.remove;local d,e=pac.PartTemplate("base_drawable")e.ClassName="motion_blur"e.Group='modifiers'e.Icon='icon16/shape_ungroup.png'd:StartStorableVars():GetSet("Bone","none"):GetSet("Alpha",0.5):GetSet("BlurLength",10):GetSet("BlurSpacing",0.1):EndStorableVars()function e:OnShow()if self.BlurLength>0 then self.blur_history={}self.blur_last_add=0;pac.drawing_motionblur_alpha=false end end;function e:DrawBlur(f,g)local h=self:GetParent()if!h:IsValid()then return end;local i=h:GetOwner()if!h.OnDraw then return end;self.blur_history=self.blur_history||{}local j=self.BlurSpacing;if!self.blur_last_add||j==0||self.blur_last_add<pac.RealTime then local k={}local l=1;for m=0,i:GetBoneCount()-1 do local n=i:GetBoneMatrix(m)if n then k[l]={id=m,matrix=n}l=l+1 end end;b(self.blur_history,{f,g,i:GetCycle(),k})self.blur_last_add=pac.RealTime+j/1000 end;local o=i:GetCycle()local p=#self.blur_history;for l=1,p do local f,g,q,k=self.blur_history[l][1],self.blur_history[l][2],self.blur_history[l][3],self.blur_history[l][4]local r=self.Alpha*l/p;a(r)if i then i:SetCycle(q)for s,t in ipairs(k)do pcall(i.SetBoneMatrix,i,t.id,t.matrix)end end;pac.drawing_motionblur_alpha=r;h:OnDraw(i,f,g)pac.drawing_motionblur_alpha=false;if i then pac.SetupBones(i)end end;i:SetCycle(o)local u=math.min(self.BlurLength,20)while#self.blur_history>=u do c(self.blur_history,1)end end;function e:OnDraw()if pac.drawing_motionblur_alpha then return end;if self.BlurLength>0 then local f,g=self:GetDrawPosition()self:DrawBlur(f,g)end end;d:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/projectile.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/libraries/webaudio.lua:
local a=_G.webaudio||{}_G.webaudio=a;if me then a.debug=true end;a.sample_rate=nil;a.speed_of_sound=340.29;a.buffer_size=CreateClientConVar("webaudio_buffer_size","2048",true)local function b(c)MsgC(Color(0,255,0),"[pac webaudio] ")MsgC(Color(255,255,255),c)Msg("\n")end;local function d(c)if a.debug then b(c)end end;cvars.AddChangeCallback("webaudio_buffer_size",function(e,e,f)d("buffer size changed to "..f)a.Shutdown()a.Initialize()end)if a.browser_panel&&a.browser_panel:IsValid()then a.browser_panel:Remove()a.browser_panel=nil end;a.browser_state="uninitialized"a.volume=1;local g;local function h(i,j)if j&&!j:IsReady()then j.js_queue=j.js_queue||{}table.insert(j.js_queue,i)return end;if g then table.insert(g,i)else if i!=""then a.browser_panel:RunJavascript(i)end end end;local function k()g=g||{}end;local function l()if g then local c=table.concat(g,"\n")g=nil;h(c)end end;do local m;local n;function a.Update()if a.browser_state!="initialized"then if a.browser_state!="initializing"then a.Initialize()end;return end;if!system.HasFocus()&&GetConVar("snd_mute_losefocus"):GetBool()then a.SetVolume(0)else a.SetVolume(GetConVar("volume"):GetFloat())end;local o=RealTime()m=m||a.eye_pos;n=n||o-FrameTime()a.eye_velocity=(a.eye_pos-m)/(o-n)m=a.eye_pos;n=o;for p,j in pairs(a.streams)do if j:IsValid()then j:Think()else a.streams[p]=nil end end end end;function a.Shutdown()a.browser_state="uninitialized"if a.browser_panel then a.browser_panel:Remove()end;a.browser_panel=nil;hook.Remove("RenderScene","pac_webaudio2")hook.Remove("Think","pac_webaudio2")end;function a.Initialize()if a.browser_state!="uninitialized"then return end;a.browser_state="initializing"if a.browser_panel then a.browser_panel:Remove()end;a.browser_panel=vgui.Create("DHTML")a.browser_panel:SetVisible(false)a.browser_panel:SetPos(ScrW(),ScrH())a.browser_panel:SetSize(1,1)local q=nil;a.browser_panel.ConsoleMessage=function(self,r)if msg=="Uncaught ReferenceError: lua is not defined"then a.browser_state="uninitialized"end;if q!=r then q=r;d(r)end end;a.browser_panel:AddFunction("lua","print",d)a.browser_panel:AddFunction("lua","message",function(s,...)local t={}for u=1,select("#",...)do t[u]=tostring(select(u,...))end;d(s.." "..table.concat(t,", "))if s=="initialized"then a.browser_state="initialized"a.sample_rate=t[1]||-1 elseif s=="stream"then local j=a.GetStream(tonumber(t[2])||0)if j:IsValid()then j:HandleBrowserMessage(t[1],unpack(t,3,table.maxn(t)))end end end)local v=[==[
/*jslint bitwise: true */

window.onerror = function(description, url, line)
{
	dprint("Unhandled exception at line " + line + ": " + description);
};

function dprint(str)
{
	]==]..(a.debug&&"lua.print(str);"||"")..[==[
}

var audio;
var gain;
var processor;
var streams = new Object();
var streams_array = [];

function open()
{
    if(audio)
    {
        audio.destination.disconnect();
    }

    if (typeof AudioContext != "undefined")
    {
        audio = new AudioContext();
        processor = audio.createScriptProcessor(]==]..a.buffer_size:GetInt()..[==[, 2, 2);
        gain = audio.createGain();
		compressor = audio.createDynamicsCompressor()
    } else {
        audio = new webkitAudioContext();
        processor = audio.createJavaScriptNode(]==]..a.buffer_size:GetInt()..[==[, 2, 2);
        gain = audio.createGainNode();
		compressor = audio.createDynamicsCompressor()
    }

    processor.onaudioprocess = function(event)
    {
        var output_left = event.outputBuffer.getChannelData(0);
        var output_right = event.outputBuffer.getChannelData(1);

        for(var i = 0; i < event.outputBuffer.length; ++i)
        {
            output_left[i] = 0;
            output_right[i] = 0;
        }

        for(var i = 0; i < streams_array.length; ++i)
        {
            var stream = streams_array[i];

            var buffer_length = stream.buffer.length;
            var buffer_left = stream.buffer.getChannelData(0);
            var buffer_right = stream.buffer.numberOfChannels == 1 ? buffer_left : stream.buffer.getChannelData(1);

			if (stream.use_smoothing)
			{
				stream.speed_smooth = stream.speed_smooth + (stream.speed - stream.speed_smooth) * 1;
				stream.vol_left_smooth = stream.vol_left_smooth  + (stream.vol_left  - stream.vol_left_smooth ) * 1;
				stream.vol_right_smooth = stream.vol_right_smooth + (stream.vol_right - stream.vol_right_smooth) * 1;
			}
			else
			{
				stream.speed_smooth = stream.speed;
				stream.vol_left_smooth  = stream.vol_left_smooth;
				stream.vol_right_smooth = stream.vol_right_smooth;
			}

			if(!stream.use_echo && (stream.paused || (stream.vol_left < 0.001 && stream.vol_right < 0.001)))
            {
                continue;
            }
            var echol;
            var echor;
            if (stream.use_echo && stream.echo_buffer)
            {
                echol = stream.echo_buffer.getChannelData(0);
                echor = stream.echo_buffer.getChannelData(1);
            }

            var sml = 0;
            var smr = 0;

            for(var j = 0; j < event.outputBuffer.length; ++j)
            {
				if (stream.paused || stream.max_loop > 0 && stream.position >= (buffer_length * stream.max_loop) - 1)
                {
                    stream.done_playing = true;

					if (!stream.paused)
					{
					    stream.paused = true;
					}

                    if (!stream.use_echo)
                    {
                        break;
                    }
                }
                else
                {
                    stream.done_playing = false;
                }

                var index = (stream.position >> 0) % buffer_length;

				if (stream.reverse)
				{
					index = -index + buffer_length;
				}

                var left  = 0;
                var right = 0;

                if (!stream.done_playing)
                {
                    // filters
					if (stream.filter_type == 0)
					{
						// None
                        left = buffer_left[index] * stream.vol_both;
                        right = buffer_right[index] * stream.vol_both;
					}
					else
                    {
                        sml = sml + (buffer_left[index] - sml) * stream.filter_fraction;
                        smr = smr + (buffer_right[index] - smr) * stream.filter_fraction;

                        if (stream.filter_type == 1)
                        {
							// Low pass
                            left = sml * stream.vol_both;
                            right = smr * stream.vol_both;
                        }
                        else if (stream.filter_type == 2)
                        {
							// High pass
                            left = (buffer_left[index] - sml) * stream.vol_both;
                            right = (buffer_right[index] - smr) * stream.vol_both;
                        }
                    }

					left = Math.min(Math.max(left, -1), 1) * stream.vol_left_smooth;
					right = Math.min(Math.max(right, -1), 1) * stream.vol_right_smooth;
                }

				if (stream.lfo_volume_time)
				{
					var res = (Math.sin((stream.position/audio.sampleRate)*10*stream.lfo_volume_time)*stream.lfo_volume_amount);
					left *= res;
					right *= res;
				}

                if (stream.use_echo)
                {
					var echo_index = (stream.position >> 0) % stream.echo_delay;

                    echol[echo_index] = echol[echo_index] * stream.echo_feedback + left;
                    echor[echo_index] = echor[echo_index] * stream.echo_feedback + right;

                    output_left[j] += echol[echo_index];
                    output_right[j] += echor[echo_index];
                }
                else
                {
                    output_left[j] += left;
                    output_right[j] += right;
                }

				var speed = stream.speed_smooth;

				if (stream.lfo_pitch_time)
				{
					speed -= (Math.sin((stream.position/audio.sampleRate)*10*stream.lfo_pitch_time)*stream.lfo_pitch_amount);
					speed += Math.pow(stream.lfo_pitch_amount*0.5,2);
				}

                stream.position += speed;

				var max = 1;

				output_left[j] = Math.min(Math.max(output_left[j], -max), max);
				output_right[j] = Math.min(Math.max(output_right[j], -max), max);

				if (!isFinite(output_left[j])) {
					output_left[j] = 0
				}

				if (!isFinite(output_right[j])) {
					output_right[j] = 0
				}
            }
        }
    };

    processor.connect(compressor);
    compressor.connect(gain);
    gain.connect(audio.destination);

    lua.message("initialized", audio.sampleRate);
}

function close()
{
    if(audio)
    {
        audio.destination.disconnect();
        audio = null;
        lua.message("uninitialized");
    }
}

var buffer_cache = new Object();

function download_buffer(url, callback, skip_cache, id)
{
    if (!skip_cache && buffer_cache[url])
    {
        callback(buffer_cache[url]);

        return;
    }

    var request = new XMLHttpRequest();

    request.open("GET", url);
    request.responseType = "arraybuffer";
    request.send();

    request.onload = function()
    {
        dprint("decoding " + url + " " + request.response.byteLength + " ...");

        audio.decodeAudioData(request.response,

            function(buffer)
            {
                dprint("decoded " + url + " successfully");

                callback(buffer);

                buffer_cache[url] = buffer;
            },

            function(err)
            {
                dprint("decoding error " + url + " " + err.message);
				lua.message("stream", "call", id, "OnError", "decoding failed", err.message);
            }
        );
    };

    request.onprogress = function(event)
    {
        dprint("downloading " +  (event.loaded / event.total) * 100);
    };

    request.onerror = function()
    {
        dprint("downloading " + url + " errored");
		lua.message("stream", "call", id, "OnError", "download failed: ", request.responseText);
    };
}

function CreateStream(url, id, skip_cache)
{
    dprint("Loading " + url);

    download_buffer(url, function(buffer)
    {
        var stream = {};

        stream.id = id;
        stream.position = 0;
        stream.buffer = buffer;
        stream.url = url;
        stream.speed = 1; // 1 = normal pitch
        stream.max_loop = 1; // -1 = inf
        stream.vol_both = 1;
        stream.vol_left = 1;
        stream.vol_right = 1;
        stream.paused = true;
        stream.use_smoothing = true;
        stream.echo_volume = 0;
        stream.filter_type = 0;
        stream.filter_fraction = 1;
        stream.done_playing = false;

        stream.use_echo = false;
        stream.echo_feedback = 0.75;
        stream.echo_buffer = false;

        stream.vol_left_smooth = 0;
        stream.vol_right_smooth = 0;
        stream.speed_smooth = stream.speed;

        stream.play = function(stop, position)
        {
			dprint("play " + stop + position)
            if(position !== undefined)
            {
                stream.position = position;
            }

            stream.paused = !stop;
        };

        stream.usefft = function(enable)
        {
            // later
        };

		stream.useEcho = function(b) {
			stream.use_echo = b;

			if (b)
			{
				stream.setEchoDelay(stream.echo_delay);
			}
			else
			{
				stream.echo_buffer = undefined;
			}
		};

        stream.setEchoDelay = function(x) {

            if(stream.use_echo && (!stream.echo_buffer || (x != stream.echo_buffer.length))) {
                var size = 1;

                while((size <<= 1) < x);

				stream.echo_buffer = audio.createBuffer(2, size, audio.sampleRate);
            }

            stream.echo_delay = x;
        };

        streams[id] = stream;
        streams_array.push(stream);

		dprint("created stream[" + id + "][" + stream.url + "]");
        lua.message("stream", "loaded", id, buffer.length);

		if (]==]..(a.debug&&"true"||"false")..[==[)
		{
			var size = 0, key;
			for (key in streams) {
				if (streams.hasOwnProperty(key)) size++;
			}
			dprint("total stream count " + size)
		}

    }, skip_cache, id);
}

function DestroyStream(id)
{
	var stream = streams[id];

	if (stream)
	{
		dprint("destroying stream[" + id + "][" + stream.url + "]");

		delete streams[id];
		delete buffer_cache[stream.url];

		var i = streams_array.indexOf(stream);
		streams_array.splice(i, 1);

		if (]==]..(a.debug&&"true"||"false")..[==[)
		{
			var size = 0, key;
			for (key in streams) {
				if (streams.hasOwnProperty(key)) size++;
			}
			dprint("total stream count " + size)
		}
	}
}

open();

]==]a.browser_panel.OnFinishLoadingDocument=function(self)self.OnFinishLoadingDocument=nil;d("OnFinishLoadingDocument")a.browser_panel:RunJavascript(v)end;file.Write("pac_webaudio2_blankhtml.txt","<html></html>")a.browser_panel:OpenURL("asset://garrysmod/data/pac_webaudio2_blankhtml.txt")a.eye_pos=Vector()a.eye_ang=Angle()hook.Add("RenderScene","pac_webaudio2",function(w,x)a.eye_pos=w;a.eye_ang=x end)hook.Add("Think","pac_webaudio2",a.Update)end;function a.SetVolume(y)if a.volume!=y then a.volume=y;h(string.format("gain.gain.value = %f",y))end end;a.streams=setmetatable({},{__mode="kv"})do local z={}z.__index=z;local function A(B,C,D,E)z[B]=C;z["Set"..B]=function(self,F)if E then F=E(F,self)end;self[B]=F;if D then self:Call(D,F)end end;z["Get"..B]=function(self,...)return self[B]end end;A("Loaded",false)A("Paused",true)A("SampleCount",0)A("MaxLoopCount",nil)A("Panning",0)A("Volume",1)A("AdditiveVolumeFraction",0)A("3D",false)A("Doppler",true)A("SourceEntity",NULL)A("SourcePosition",nil)A("LastSourcePosition",nil)A("LastSourcePositionTime",nil)A("SourceVelocity",nil)A("SourceRadius",4300)A("ListenerOutOfRadius",false)A("Id")A("Url","")A("PlaybackSpeed",1)A("AdditivePitchModifier",0)A("SamplePosition",0,".position = %f")A("PitchLFOAmount",nil,".lfo_pitch_amount = %f")A("PitchLFOTime",nil,".lfo_pitch_time = %f")A("VolumeLFOAmount",nil,".lfo_volume_amount = %f")A("VolumeLFOTime",nil,".lfo_volume_time = %f")A("FilterType",nil,".filter_type = %i")A("FilterFraction",0,".filter_fraction = %f",function(G)return math.Clamp(G,0,1)end)A("Echo",false,".useEcho(%s)")A("EchoDelay",1,".setEchoDelay(Math.ceil(audio.sampleRate * %f))",function(G)return math.Clamp(G,0,5)end)A("EchoFeedback",0.75,".echo_feedback = %f")function z:IsReady()return self.Loaded end;function z:GetLength()if!self.Loaded then return 0 end;return self.SampleCount/tonumber(a.sample_rate)end;function z:IsValid()return self.invalid==nil end;function z:Remove()a.streams[self:GetId()]=nil;self:Stop()h(string.format("DestroyStream(%i)",self:GetId()))self.invalid=true end;function z:Call(H,...)local i=string.format("var id = %d; try { if (streams[id]) { streams[id]%s } } catch(e) { dprint('streams[' + id + '] ' + e.toString()) }",self:GetId(),string.format(H,...))h(i,self)end;function z:HandleBrowserMessage(I,...)if I=="call"then self:HandleCallBrowserMessage(...)elseif I=="fft"then self:HandleFFTBrowserMessage(...)elseif I=="stop"then self.Paused=true elseif I=="return"then self.ReturnedValues={...}elseif I=="loaded"then self:HandleLoadedBrowserMessage(...)elseif I=="position"then self:HandlePositionBrowserMessage(...)end end;function z:SetMaxLoopCount(J)self.MaxLoopCount=J;self:Call(".max_loop = %i",J==true&&-1||J==false&&1||tonumber(J)||1)end;function z:Pause()self.Paused=true;self:Call(".play(false)")end;function z:Resume()self.Paused=false;self:UpdatePlaybackSpeed()self:UpdateVolume()self:Call(".play(true)")end;function z:Play()self.Paused=false;k()self:UpdatePlaybackSpeed()self:UpdateVolume()self:Call(".play(true, 0)")l()end;function z:Stop()self.Paused=true;self:Call(".play(false, 0)")end;function z:Restart()self:SetSamplePosition(0)end;function z:SetPosition(w)self:SetSamplePosition(w%1*self:GetSampleCount())end;function z:SetPlaybackRate(K)if self.PlaybackSpeed==K then return self end;self.PlaybackSpeed=K;self:UpdatePlaybackSpeed()return self end;function z:SetAdditivePitchModifier(L)if self.AdditivePitchModifier==L then return self end;self.AdditivePitchModifier=L;self:UpdatePlaybackSpeed()return self end;function z:UpdatePlaybackSpeed(M)local N=self.PlaybackSpeed+self.AdditivePitchModifier;if N<0 then self:Call(".reverse = true")N=math.abs(N)end;if M then N=N+M end;if N!=self.last_speed then self:Call(".speed = %f",N)self.last_speed=N end end;function z:SetPanning(O)if self.Panning==O then return self end;self.Panning=O;self:UpdateVolume()return self end;function z:SetVolume(P)if self.Volume==P then return self end;self.Volume=P;self:UpdateVolume()return self end;function z:SetAdditiveVolumeModifier(Q)if self.AdditiveVolumeFraction==Q then return self end;self.AdditiveVolumeFraction=Q;self:UpdateVolume()return self end;local function R(S)if S.findheadpos_last_mdl!=S:GetModel()then S.findheadpos_head_bone=nil;S.findheadpos_head_attachment=nil;S.findheadpos_last_mdl=S:GetModel()end;if!S.findheadpos_head_bone then for u=0,S:GetBoneCount()||0 do local B=S:GetBoneName(u):lower()if B:find("head",nil,true)then S.findheadpos_head_bone=u;break end end end;if S.findheadpos_head_bone then local T=S:GetBoneMatrix(S.findheadpos_head_bone)if T then local w=T:GetTranslation()if w!=S:GetPos()then return w,T:GetAngles()end end else if!S.findheadpos_attachment_eyes then S.findheadpos_head_attachment=S:GetAttachments().eyes||S:GetAttachments().forward end;if S.findheadpos_head_attachment then local U=S:GetAttachment(S.findheadpos_head_attachment)return U.Pos,U.Ang end end;return S:EyePos(),S:EyeAngles()end;function z:UpdateSourcePosition()if!self.SourceEntity:IsValid()then self:OutOfRadius()return end;self.SourcePosition=R(self.SourceEntity)end;function z:UpdateVolume()k()if self:Get3D()then self:UpdateVolume3d()else self:UpdateVolumeFlat()end;l()end;function z:UpdateVolumeFlat()self:SetRightVolume(math.Clamp(1+self.Panning,0,1)+self.AdditiveVolumeFraction)self:SetLeftVolume(math.Clamp(1-self.Panning,0,1)+self.AdditiveVolumeFraction)end;function z:UpdateVolumeBoth()if self.last_vol_both!=self.Volume then self:Call(".vol_both= %f",self.Volume)self.last_vol_both=self.Volume end end;function z:SetLeftVolume(y)if self.last_left_volume!=y then self:Call(".vol_left= %f",y)self.last_left_volume=y end;self:UpdateVolumeBoth()end;function z:SetRightVolume(y)if self.last_right_volume!=y then self:Call(".vol_right = %f",y)self.last_right_volume=y end;self:UpdateVolumeBoth()end;function z:UpdateVolume3d()if self.SourceEntity==pac.LocalPlayer&&!pac.LocalPlayer:ShouldDrawLocalPlayer()then self:UpdateVolumeFlat()return end;self:UpdateSourcePosition()local o=RealTime()self.SourcePosition=self.SourcePosition||Vector()self.LastSourcePosition=self.LastSourcePosition||self.SourcePosition;self.LastSourcePositionTime=self.LastSourcePositionTime||o-FrameTime()self.SourceVelocity=(self.SourcePosition-self.LastSourcePosition)/(o-self.LastSourcePositionTime)self.LastSourcePosition=self.SourcePosition;self.LastSourcePositionTime=o+0.001;local V=self.SourcePosition-a.eye_pos;local W=V:Length()if W<self.SourceRadius then local X=V:GetNormalized():Dot(a.eye_ang:Right())local P=math.Clamp(1-W/self.SourceRadius,0,1)^6;P=P*0.5;self:SetRightVolume(math.Clamp(1+X,0,1)*P+self.AdditiveVolumeFraction)self:SetLeftVolume(math.Clamp(1-X,0,1)*P+self.AdditiveVolumeFraction)if self:GetDoppler()&&a.eye_velocity then local Y=self.SourceVelocity-a.eye_velocity;local Z=V:GetNormalized():Dot(-Y)*0.0254;self:UpdatePlaybackSpeed(Z/a.speed_of_sound)end;self.ListenerOutOfRadius=false else self:OutOfRadius()end end;function z:OutOfRadius()if!self.ListenerOutOfRadius then self:SetRightVolume(0)self:SetLeftVolume(0)self.ListenerOutOfRadius=true end end;function z:SetSourceEntity(S,_)self.SourceEntity=S;if!_&&S:IsValid()then S:CallOnRemove("webaudio_remove_stream_"..tostring(self),function()if self:IsValid()then self:Remove()end end)end end;function z:Think()if self.Paused then return end;self:UpdateVolume()end;function z:__newindex(a0,f)if a0=="OnFFT"then if isfunction(f)then self:Call(".usefft(true)")else self:Call(".usefft(false)")end end;rawset(self,a0,f)end;function z:__tostring()return string.format("stream[%p][%d][%s]",self,self:GetId(),self:GetUrl())end;function z:HandleCallBrowserMessage(a1,...)if!self[a1]then return end;self[a1](self,...)end;function z:HandleFFTBrowserMessage(a2)local a3=CompileString(a2,"stream_fft_data")()self.OnFFT(a3)end;function z:HandleLoadedBrowserMessage(a4)self.Loaded=true;self.SampleCount=a4;k()self:SetFilterType(0)self:SetMaxLoopCount(self:GetMaxLoopCount())self:SetEcho(self:GetEcho())self:SetEchoFeedback(self:GetEchoFeedback())self:SetEchoDelay(self:GetEchoDelay())l()if self.OnLoad then self:OnLoad()end;if self.js_queue then for e,i in ipairs(self.js_queue)do h(i)end;self.js_queue=nil end end;function z:HandlePositionBrowserMessage(a5)self.SamplePosition=a5 end;a.stream_meta=z end;a.streams=a.streams||{}a.last_stream_id=0;function a.CreateStream(a6)a.Initialize()a6="../"..a6;local self=setmetatable({},a.stream_meta)a.last_stream_id=a.last_stream_id+1;self:SetId(a.last_stream_id)self:SetUrl(a6)a.streams[self:GetId()]=self;h(string.format("CreateStream(%q, %i)",self:GetUrl(),self:GetId()))return self end;function a.Panic(a7)for a8,a9 in pairs(a.streams)do a9:Remove()end;a.last_stream_id=0 end;function a.GetStream(p)return a.streams[p]||NULL end;function a.StreamExists(p)return a.streams[p]!=nil end;return a
--addons/!lpakr_out/lua/pac3/core/client/parts/sunbeams.lua:
local ScrW=ScrW;local ScrH=ScrH;local a;local b,c=pac.PartTemplate("base_drawable")c.ClassName="sunbeams"c.Group='effects'c.Icon='icon16/weather_sun.png'b:StartStorableVars()b:GetSet("Darken",0)b:GetSet("Multiplier",0.25,{editor_sensitivity=0.25})b:GetSet("Size",0.1,{editor_sensitivity=0.25})b:GetSet("Translucent",true)b:EndStorableVars()function c:GetNiceName()local d=self:GetMultiplier()return d>0&&"bright sunbeams"||d<0&&"dark sunbeams"||self.ClassName end;function c:OnDraw()if!a then a=_G.DrawSunbeams end;cam.Start2D()local e=self:GetDrawPosition()local f=e:ToScreen()local g=-math.Clamp(pac.EyePos:Distance(e)/1000,0,1)+1;a(self.Darken,g*self.Multiplier*(math.Clamp(pac.EyeAng:Forward():Dot((e-pac.EyePos):GetNormalized())-0.5,0,1)*2)^5,self.Size,f.x/ScrW(),f.y/ScrH())cam.End2D()end;b:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/text.lua:
local a=cam.Start3D;local b=cam.Start3D2D;local EyePos=EyePos;local EyeAngles=EyeAngles;local c=draw.SimpleTextOutlined;local DisableClipping=DisableClipping;local d=render.CullMode;local e=cam.End3D2D;local f=cam.End3D;local g=surface.SetFont;local Color=Color;local h,i=pac.PartTemplate("base_drawable")local j={"BudgetLabel","CenterPrintText","ChatFont","ClientTitleFont","CloseCaption_Bold","CloseCaption_BoldItalic","CloseCaption_Italic","CloseCaption_Normal","CreditsLogo","CreditsOutroLogos","CreditsOutroText","CreditsText","Crosshairs","DebugFixed","DebugFixedSmall","DebugOverlay","Default","DefaultFixed","DefaultFixedDropShadow","DefaultSmall","DefaultUnderline","DefaultVerySmall","HDRDemoText","HL2MPTypeDeath","HudDefault","HudHintTextLarge","HudHintTextSmall","HudNumbers","HudNumbersGlow","HudNumbersSmall","HudSelectionNumbers","HudSelectionText","Marlett","QuickInfo","TargetID","TargetIDSmall","Trebuchet18","Trebuchet24","WeaponIcons","WeaponIconsSelected","WeaponIconsSmall","DermaDefault","DermaDefaultBold","DermaLarge","GModNotify","ScoreboardDefault","ScoreboardDefaultTitle","GModToolName","GModToolSubtitle","GModToolHelp","GModToolScreen","ContentHeader","GModWorldtip","ContentHeader","DefaultBold","TabLarge","Trebuchet22","TraitorState","TimeLeft","HealthAmmo","cool_small","cool_large","treb_small"}i.ClassName="text"i.Group="effects"i.Icon="icon16/text_align_center.png"h:StartStorableVars():SetPropertyGroup("generic"):PropertyOrder("Name"):PropertyOrder("Hide"):GetSet("Text",""):GetSet("Font","default",{enums=j}):GetSet("Size",1,{editor_sensitivity=0.25}):GetSet("DrawMode","DrawTextOutlined",{enums={["draw.SimpleTextOutlined 3D2D"]="DrawTextOutlined",["draw.SimpleTextOutlined 2D"]="DrawTextOutlined2D",["surface.DrawText"]="SurfaceText"}}):SetPropertyGroup("text layout"):GetSet("HorizontalTextAlign",TEXT_ALIGN_CENTER,{enums={["Left"]="0",["Center"]="1",["Right"]="2"}}):GetSet("VerticalTextAlign",TEXT_ALIGN_CENTER,{enums={["Center"]="1",["Top"]="3",["Bottom"]="4"}}):GetSet("ConcatenateTextAndOverrideValue",false,{editor_friendly="CombinedText"}):GetSet("TextPosition","Prefix",{enums={["Prefix"]="Prefix",["Postfix"]="Postfix"}},{editor_friendly="ConcatenateMode"}):SetPropertyGroup("data source"):GetSet("TextOverride","Text",{enums={["Proxy value (DynamicTextValue)"]="Proxy",["Text"]="Text",["Health"]="Health",["Maximum Health"]="MaxHealth",["Armor"]="Armor",["Maximum Armor"]="MaxArmor",["Timerx"]="Timerx",["CurTime"]="CurTime",["RealTime"]="RealTime",["Velocity"]="Velocity",["Velocity Vector"]="VelocityVector",["Position Vector"]="PositionVector",["Owner Position Vector"]="OwnerPositionVector",["Clip current Ammo"]="Ammo",["Clip Size"]="ClipSize",["Ammo Reserve"]="AmmoReserve",["Sequence Name"]="SequenceName",["Weapon Name"]="Weapon",["Vehicle Class"]="VehicleClass",["Model Name"]="ModelName",["Model Path"]="ModelPath",["Player Name"]="PlayerName",["Player SteamID"]="SteamID",["Map"]="Map",["Ground Surface"]="GroundSurface",["Ground Entity Class"]="GroundEntityClass",["Players"]="Players",["Max Players"]="MaxPlayers",["Difficulty"]="GameDifficulty"}}):GetSet("DynamicTextValue",0):GetSet("RoundingPosition",2,{editor_onchange=function(self,k)return math.Round(k,0)end}):SetPropertyGroup("orientation"):PropertyOrder("AimPartName"):PropertyOrder("Bone"):PropertyOrder("Position"):SetPropertyGroup("appearance")h:GetSet("ForceAdditive",false,{description="additive rendering for the surface.DrawText mode"})h:GetSet("Outline",0)h:GetSet("Color",Vector(255,255,255),{editor_panel="color"})h:GetSet("Alpha",1,{editor_sensitivity=0.25,editor_clamp={0,1}})h:GetSet("OutlineColor",Vector(255,255,255),{editor_panel="color"})h:GetSet("OutlineAlpha",1,{editor_onchange=function(self,k)self.sens=0.25;k=tonumber(k)return math.Clamp(k,0,1)end})h:GetSet("Translucent",true):SetPropertyGroup("CustomFont"):GetSet("CreateCustomFont",false,{description="Tries to create a custom font.\nHeavily throttled as creating fonts is an expensive process.\nSupport is limited because of the fonts' supported features and the limits of Lua strings.\nFont names include those stored in your operating system. for example: Comic Sans MS, Ink Free"}):GetSet("CustomFont","DermaDefault"):GetSet("FontSize",13):GetSet("FontWeight",500):GetSet("FontBlurSize",0):GetSet("FontScanLines",0):GetSet("FontAntialias",true):GetSet("FontUnderline",false):GetSet("FontItalic",false):GetSet("FontStrikeout",false):GetSet("FontSymbol",false):GetSet("FontRotary",false):GetSet("Shadow",false):GetSet("FontAdditive",false):GetSet("FontOutline",false)h:EndStorableVars()function i:GetNiceName()if self.TextOverride!="Text"then return self.TextOverride end;return'Text: "'..self:GetText()..'"'end;function i:SetColor(l)self.ColorC=self.ColorC||Color(255,255,255,255)self.ColorC.r=l.r;self.ColorC.g=l.g;self.ColorC.b=l.b;self.Color=l end;function i:SetAlpha(m)self.ColorC=self.ColorC||Color(255,255,255,255)self.ColorC.a=m*255;self.Alpha=m end;function i:SetOutlineColor(l)self.OutlineColorC=self.OutlineColorC||Color(255,255,255,255)self.OutlineColorC.r=l.r;self.OutlineColorC.g=l.g;self.OutlineColorC.b=l.b;self.OutlineColor=l end;function i:SetOutlineAlpha(m)self.OutlineColorC=self.OutlineColorC||Color(255,255,255,255)self.OutlineColorC.a=m*255;self.OutlineAlpha=m end;function i:SetFont(n)self.UsedFont=n;if!self.CreateCustomFont then if!pcall(g,n)then if#self.Font>20 then self.lastwarn=self.lastwarn||CurTime()if self.lastwarn>CurTime()+1 then pac.Message(Color(255,150,0),n.." Font not found! Could be custom font, trying again in 4 seconds!")self.lastwarn=CurTime()end;timer.Simple(4,function()if!pcall(g,n)then pac.Message(Color(255,150,0),n.." Font still not found! Reverting to DermaDefault!")n="DermaDefault"self.UsedFont=n end end)else timer.Simple(5,function()if!pcall(g,n)then pac.Message(Color(255,150,0),n.." Font still not found! Reverting to DermaDefault!")n="DermaDefault"self.UsedFont=n end end)end end end;self.Font=self.UsedFont end;local o=0;function i:OnDraw()local p,q=self:GetDrawPosition()self:CheckFont()if!pcall(g,self.UsedFont)then return end;local r=self.Text||""if self.TextOverride=="Text"then goto s end;r=""if self.TextOverride=="Health"then r=self:GetRootPart():GetOwner():Health()elseif self.TextOverride=="MaxHealth"then r=self:GetRootPart():GetOwner():GetMaxHealth()elseif self.TextOverride=="Ammo"then r=IsValid(self:GetPlayerOwner():GetActiveWeapon())&&self:GetPlayerOwner():GetActiveWeapon():Clip1()||""elseif self.TextOverride=="ClipSize"then r=IsValid(self:GetPlayerOwner():GetActiveWeapon())&&self:GetPlayerOwner():GetActiveWeapon():GetMaxClip1()||""elseif self.TextOverride=="AmmoReserve"then r=IsValid(self:GetPlayerOwner():GetActiveWeapon())&&self:GetPlayerOwner():GetAmmoCount(self:GetPlayerOwner():GetActiveWeapon():GetPrimaryAmmoType())||""elseif self.TextOverride=="Armor"then r=self:GetPlayerOwner():Armor()elseif self.TextOverride=="MaxArmor"then r=self:GetPlayerOwner():GetMaxArmor()elseif self.TextOverride=="Timerx"then r=""..math.Round(CurTime()-self.time,self.RoundingPosition)elseif self.TextOverride=="CurTime"then r=""..math.Round(CurTime(),self.RoundingPosition)elseif self.TextOverride=="RealTime"then r=""..math.Round(RealTime(),self.RoundingPosition)elseif self.TextOverride=="Velocity"then local t=self:GetRootPart():GetOwner()r=math.Round(t:GetVelocity():Length(),2)elseif self.TextOverride=="VelocityVector"then local t=self:GetOwner()||self:GetRootPart():GetOwner()local u=t:GetVelocity()r="("..math.Round(u.x,self.RoundingPosition)..","..math.Round(u.y,self.RoundingPosition)..","..math.Round(u.z,self.RoundingPosition)..")"elseif self.TextOverride=="PositionVector"then local u=self:GetDrawPosition()r="("..math.Round(u.x,self.RoundingPosition)..","..math.Round(u.y,self.RoundingPosition)..","..math.Round(u.z,self.RoundingPosition)..")"elseif self.TextOverride=="OwnerPositionVector"then local t=self:GetRootPart():GetOwner()local u=t:GetPos()r="("..math.Round(u.x,self.RoundingPosition)..","..math.Round(u.y,self.RoundingPosition)..","..math.Round(u.z,self.RoundingPosition)..")"elseif self.TextOverride=="SequenceName"then r=self:GetRootPart():GetOwner():GetSequenceName(self:GetPlayerOwner():GetSequence())elseif self.TextOverride=="PlayerName"then r=self:GetPlayerOwner():GetName()elseif self.TextOverride=="SteamID"then r=self:GetPlayerOwner():SteamID()elseif self.TextOverride=="ModelName"then local v=self:GetRootPart():GetOwner():GetModel()||"null"v=string.Split(v,"/")[#string.Split(v,"/")]v=string.gsub(v,".mdl","")r=v elseif self.TextOverride=="ModelPath"then r=self:GetPlayerOwner():GetModel()elseif self.TextOverride=="Map"then r=game.GetMap()elseif self.TextOverride=="GroundSurface"then local w=util.TraceLine({start=self:GetRootPart():GetOwner():GetPos()+Vector(0,0,30),endpos=self:GetRootPart():GetOwner():GetPos()+Vector(0,0,-60),filter=function(t)if t==self:GetRootPart():GetOwner()||t==self:GetPlayerOwner()then return false else return true end end})if w.Hit then if w.MatType==MAT_ANTLION then r="Antlion"elseif w.MatType==MAT_BLOODYFLESH then r="Bloody Flesh"elseif w.MatType==MAT_CONCRETE then r="Concrete"elseif w.MatType==MAT_DIRT then r="Dirt"elseif w.MatType==MAT_EGGSHELL then r="Egg Shell"elseif w.MatType==MAT_FLESH then r="Flesh"elseif w.MatType==MAT_GRATE then r="Grate"elseif w.MatType==MAT_ALIENFLESH then r="Alien Flesh"elseif w.MatType==MAT_CLIP then r="Clip"elseif w.MatType==MAT_SNOW then r="Snow"elseif w.MatType==MAT_PLASTIC then r="Plastic"elseif w.MatType==MAT_METAL then r="Metal"elseif w.MatType==MAT_SAND then r="Sand"elseif w.MatType==MAT_FOLIAGE then r="Foliage"elseif w.MatType==MAT_COMPUTER then r="Computer"elseif w.MatType==MAT_SLOSH then r="Slime"elseif w.MatType==MAT_TILE then r="Tile"elseif w.MatType==MAT_GRASS then r="Grass"elseif w.MatType==MAT_VENT then r="Grass"elseif w.MatType==MAT_WOOD then r="Wood"elseif w.MatType==MAT_DEFAULT then r="Default"elseif w.MatType==MAT_GLASS then r="Glass"elseif w.MatType==MAT_WARPSHIELD then r="Warp Shield"else r="Other Surface"end else r="Air"end elseif self.TextOverride=="GroundEntityClass"then local w=util.TraceLine({start=self:GetRootPart():GetOwner():GetPos()+Vector(0,0,30),endpos=self:GetRootPart():GetOwner():GetPos()+Vector(0,0,-60),filter=function(t)if t==self:GetRootPart():GetOwner()||t==self:GetPlayerOwner()then return false else return true end end})if w.Hit then r=w.Entity:GetClass()end elseif self.TextOverride=="GameDifficulty"then local x=game.GetSkillLevel()if x==1 then r="Easy"elseif x==2 then r="Normal"elseif x==3 then r="Hard"end elseif self.TextOverride=="Players"then r=#player.GetAll()elseif self.TextOverride=="MaxPlayers"then r=game.MaxPlayers()elseif self.TextOverride=="Weapon"then if IsValid(self:GetPlayerOwner():GetActiveWeapon())then r=self:GetPlayerOwner():GetActiveWeapon():GetClass()else r="unarmed"end elseif self.TextOverride=="VehicleClass"then if IsValid(self:GetPlayerOwner():GetVehicle())then r=self:GetPlayerOwner():GetVehicle():GetClass()else r="not driving"end elseif self.TextOverride=="Proxy"then r=""..math.Round(self.DynamicTextValue,self.RoundingPosition)end;if self.ConcatenateTextAndOverrideValue then if self.TextPosition=="Prefix"then r=""..self.Text..r elseif self.TextPosition=="Postfix"then r=""..r..self.Text end end::s::if r!=""then if self.DrawMode=="DrawTextOutlined"then a(EyePos(),EyeAngles())b(p,q,self.Size)local y=DisableClipping(true)c(r,self.UsedFont,0,0,self.ColorC,self.HorizontalTextAlign,self.VerticalTextAlign,self.Outline,self.OutlineColorC)d(1)c(r,self.UsedFont,0,0,self.ColorC,self.HorizontalTextAlign,self.VerticalTextAlign,self.Outline,self.OutlineColorC)d(0)DisableClipping(y)e()f()a(EyePos(),EyeAngles())b(p,q,self.Size)local y=DisableClipping(true)draw.SimpleText(r,self.UsedFont,0,0,self.ColorC,self.HorizontalTextAlign,self.VerticalTextAlign,self.Outline,self.OutlineColorC)d(1)draw.SimpleText(r,self.UsedFont,0,0,self.ColorC,self.HorizontalTextAlign,self.VerticalTextAlign,self.Outline,self.OutlineColorC)d(0)DisableClipping(y)e()f()elseif self.DrawMode=="SurfaceText"||self.DrawMode=="DrawTextOutlined2D"then hook.Add("HUDPaint","pac.DrawText"..self.UniqueID,function()if!pcall(g,self.UsedFont)then return end;self:SetFont(self.UsedFont)surface.SetTextColor(self.Color.r,self.Color.g,self.Color.b,255*self.Alpha)surface.SetFont(self.UsedFont)local z=self:GetDrawPosition():ToScreen()local A,B=surface.GetTextSize(r)if self.HorizontalTextAlign==0 then z.x=z.x elseif self.HorizontalTextAlign==1 then z.x=z.x-A/2 elseif self.HorizontalTextAlign==2 then z.x=z.x-A end;if self.VerticalTextAlign==1 then z.y=z.y-B/2 elseif self.VerticalTextAlign==3 then z.y=z.y elseif self.VerticalTextAlign==4 then z.y=z.y-B end;surface.SetTextPos(z.x,z.y)local C=(EyePos()-self:GetWorldPosition()):Length()local D=200;local E=1000;if D==0 then D=0.1 end;if E==0 then E=0.1 end;if D>E then local F=D;D=E;E=F end;if C<E then if C<D then if self.DrawMode=="DrawTextOutlined2D"then draw.SimpleTextOutlined(r,self.UsedFont,z.x,z.y,Color(self.Color.r,self.Color.g,self.Color.b,255*self.Alpha),TEXT_ALIGN_TOP,TEXT_ALIGN_LEFT,self.Outline,Color(self.OutlineColor.r,self.OutlineColor.g,self.OutlineColor.b,255*self.OutlineAlpha))elseif self.DrawMode=="SurfaceText"then surface.DrawText(r,self.ForceAdditive)end else local G=math.pow(math.Clamp(1-(C-D)/E,0,1),3)if self.DrawMode=="DrawTextOutlined2D"then draw.SimpleTextOutlined(r,self.UsedFont,z.x,z.y,Color(self.Color.r,self.Color.g,self.Color.b,255*self.Alpha*G),TEXT_ALIGN_TOP,TEXT_ALIGN_LEFT,self.Outline,Color(self.OutlineColor.r,self.OutlineColor.g,self.OutlineColor.b,255*self.OutlineAlpha*G))elseif self.DrawMode=="SurfaceText"then surface.SetTextColor(self.Color.r*G,self.Color.g*G,self.Color.b*G)surface.DrawText(r,true)end end end end)end;if self.DrawMode=="DrawTextOutlined"then hook.Remove("HUDPaint","pac.DrawText"..self.UniqueID)end else hook.Remove("HUDPaint","pac.DrawText"..self.UniqueID)end end;function i:Initialize()self:TryCreateFont()end;function i:CheckFont()if self.CreateCustomFont then o=o||0;if o+3<=CurTime()then self:TryCreateFont()end else self:SetFont(self.Font)end end;function i:TryCreateFont()if"Font_"..self.CustomFont.."_"..math.Round(self.FontSize,3).."_"..self.UniqueID==self.lastcustomfont then self.UsedFont="Font_"..self.CustomFont.."_"..math.Round(self.FontSize,3).."_"..self.UniqueID;return end;if self.CreateCustomFont then local H="Font_"..self.CustomFont.."_"..math.Round(self.FontSize,3).."_"..self.UniqueID;surface.CreateFont(H,{font=self.CustomFont,extended=self.Extended,size=self.FontSize,weight=self.Weight,blursize=self.BlurSize,scanlines=self.ScanLines,antialias=self.Antialias,underline=self.Underline,italic=self.Italic,strikeout=self.Strikeout,symbol=self.Symbol,rotary=self.Rotary,shadow=self.Shadow,additive=self.Additive,outline=self.Outline})self:SetFont(H)self.lastcustomfont=H;o=CurTime()end end;function i:OnShow()self.time=CurTime()end;function i:OnHide()hook.Remove("HUDPaint","pac.DrawText"..self.UniqueID)end;function i:OnRemove()hook.Remove("HUDPaint","pac.DrawText"..self.UniqueID)end;function i:SetText(n)self.Text=n end;h:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/bodygroup.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/light.lua:
local a,b=pac.PartTemplate("base_drawable")b.FriendlyName="legacy light"b.ClassName="light"b.Group="legacy"b.Icon='icon16/lightbulb.png'a:StartStorableVars()a:GetSet("Brightness",1)a:GetSet("Size",5,{editor_sensitivity=0.25})a:GetSet("Style",0,{editor_clamp={0,16}})a:GetSet("Color",Vector(255,255,255),{editor_panel="color"})a:EndStorableVars()function b:GetNiceName()local c=pac.ColorToNames(self:GetColor())return c.." light"end;local DynamicLight=DynamicLight;function b:OnDraw()local d=self:GetDrawPosition()local e=self.light||DynamicLight(tonumber(self.UniqueID))e.Pos=d;e.MinLight=self.Brightness;e.Size=self.Size;e.Style=self.Style;e.r=self.Color.r;e.g=self.Color.g;e.b=self.Color.b;e.DieTime=1000000000000;self.light=e end;function b:OnHide()local e=self.light;if e then e.DieTime=0;e.Size=0;e.MinLight=0;e.Pos=Vector()end end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/model.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/libraries/webaudio/browser.lua:
pac.webaudio=pac.webaudio||{}local a=pac.webaudio;a.Browser=a.Browser||{}a.Browser.States={Uninitialized=0,Initializing=1,Initialized=2}if a.Browser.Control&&a.Browser.Control:IsValid()then a.Browser.Control:Remove()a.Browser.Control=nil end;a.Browser.State=a.Browser.States.Uninitialized;a.Browser.Control=nil;a.Browser.JavascriptQueue={}a.Browser.Volume=nil;local b=Color(121,221,203)local c=Color(200,200,200)function a.Browser.Initialize()if a.Browser.State!=a.Browser.States.Uninitialized then return end;a.Browser.State=a.Browser.States.Initializing;if a.Browser.Control then a.Browser.Control:Remove()end;a.Browser.Control=vgui.Create("DHTML")a.Browser.Control:SetVisible(false)a.Browser.Control:SetPos(ScrW(),ScrH())a.Browser.Control:SetSize(1,1)local d=nil;a.Browser.Control.ConsoleMessage=function(self,e)if msg=="Uncaught ReferenceError: lua is not defined"then a.Browser.State=a.Browser.States.Uninitialized end;if d!=e then d=e;pac.Message(b,'[OGG] ',c,unpack(pac.RepackMessage(e)))end end;a.Browser.Control:AddFunction("lua","print",a.DebugPrint)a.Browser.Control:AddFunction("lua","message",function(f,...)local g={...}a.DebugPrint(f,...)if f=="initialized"then a.Browser.State=a.Browser.States.Initialized;a.SampleRate=g[1]elseif f=="stream"then local h=a.Streams.GetStream(tonumber(g[2])||0)if!h then return end;local f=g[1]h:HandleBrowserMessage(f,unpack(g,3,table.maxn(g)))end end)a.Browser.Control:SetHTML(a.Browser.HTML)end;function a.Browser.IsInitializing()return a.Browser.State==a.Browser.States.Initializing end;function a.Browser.IsInitialized()return a.Browser.State==a.Browser.States.Initialized end;function a.Browser.RunJavascript(i)if IsValid(a.Browser.Control)then a.Browser.Control:QueueJavascript(i)end end;function a.Browser.QueueJavascript(i)a.Browser.JavascriptQueue[#a.Browser.JavascriptQueue+1]=i end;function a.Browser.Think()if#a.Browser.JavascriptQueue==0 then return end;local i=table.concat(a.Browser.JavascriptQueue,"\n")a.Browser.RunJavascript(i)a.Browser.JavascriptQueue={}end;function a.Browser.SetVolume(j)if a.Browser.Volume==j then return end;a.Browser.Volume=j;a.Browser.QueueJavascript(string.format("gain.gain.value = %f",j))end;a.Browser.HTML=[==[
<script>

window.onerror = function(description, url, line)
{
    lua.print("Unhandled exception at line " + line + ": " + description)
}

function lerp(x0, x1, t)
{
    return x0 * (1 - t) + x1 * t;
}

var audio, gain, processor, analyser, streams = [];

function open()
{
    if(audio)
    {
        audio.destination.disconnect();
        delete audio;
        delete gain;
    }

    if(typeof AudioContext != "undefined"){
        audio = new AudioContext;
        processor = audio.createScriptProcessor(4096, 0, 2);
        gain = audio.createGain();
    }else{
        audio = new webkitAudioContext;
        processor = audio.createJavaScriptNode(4096, 0, 1);
        gain = audio.createGainNode();
    }

    processor.onaudioprocess = function(event)
    {
        var outputLeft  = event.outputBuffer.getChannelData(0);
        var outputRight = event.outputBuffer.getChannelData(1);

        for(var i = 0; i < event.outputBuffer.length; ++i)
        {
            outputLeft [i] = 0;
            outputRight[i] = 0;
        }

        for(var i in streams)
        {
            var stream = streams[i];

            if(!stream.use_echo && (stream.paused || (stream.vol_left < 0.001 && stream.vol_right < 0.001)))
            {
                continue;
            }

            var echol;
            var echor;

            if (stream.use_echo && stream.echo_buffer)
            {
                echol = stream.echo_buffer.getChannelData(0);
                echor = stream.echo_buffer.getChannelData(1);
            }

            var inputLength = stream.buffer.length;
            var inputLeft   = stream.buffer.getChannelData(0);
            var inputRight  = stream.buffer.numberOfChannels == 1 ? inputLeft : stream.buffer.getChannelData(1);

            var sml = 0;
            var smr = 0;

            for(var j = 0; j < event.outputBuffer.length; ++j)
            {
                if (stream.use_smoothing)
                {
                    stream.speed_smooth     = stream.speed_smooth + (stream.speed - stream.speed_smooth) * 0.001;
                    stream.vol_left_smooth  = stream.vol_left_smooth  + (stream.vol_left  - stream.vol_left_smooth ) * 0.001;
                    stream.vol_right_smooth = stream.vol_right_smooth + (stream.vol_right - stream.vol_right_smooth) * 0.001;
                }
                else
                {
                    stream.speed_smooth     = stream.speed;
                    stream.vol_left_smooth  = stream.vol_left_smooth;
                    stream.vol_right_smooth = stream.vol_right_smooth;
                }

                if (stream.paused || stream.max_loop > 0 && stream.position > inputLength * stream.max_loop)
                {
                    stream.done_playing = true;

					if (!stream.paused)
					{
                        lua.message("stream", "stop", stream.id);
					    stream.paused = true;
					}

                    if (!stream.use_echo)
                    {
                        break;
                    }
                }
                else
                {
                    stream.done_playing = false;
                }

                var index      = (stream.position >> 0) % inputLength;
                var echo_index = (stream.position >> 0) % stream.echo_delay;

                var left  = 0;
                var right = 0;

                if (!stream.done_playing)
                {
                    // filters
					if (stream.filter_type == 0)
					{
						// None
                        left  = inputLeft [index] * stream.vol_left_smooth;
                        right = inputRight[index] * stream.vol_right_smooth;
					}
					else
                    {
                        sml = sml + (inputLeft [index] - sml) * stream.filter_fraction;
                        smr = smr + (inputRight[index] - smr) * stream.filter_fraction;

                        if (stream.filter_type == 1)
                        {
							// Low pass
                            left  = sml * stream.vol_left_smooth;
                            right = smr * stream.vol_right_smooth;
                        }
                        else if (stream.filter_type == 2)
                        {
							// High pass
                            left  = (inputLeft [index] - sml) * stream.vol_left_smooth;
                            right = (inputRight[index] - smr) * stream.vol_right_smooth;
                        }
                    }
                }

                if (stream.use_echo)
                {
                    echol[echo_index] = echol[echo_index] * stream.echo_feedback + left;
                    echor[echo_index] = echor[echo_index] * stream.echo_feedback + right;

                    outputLeft [j] += echol[echo_index];
                    outputRight[j] += echor[echo_index];
                }
                else
                {
                    outputLeft [j] += left;
                    outputRight[j] += right;
                }

                stream.position += stream.speed_smooth;
            }
        }
    };

    processor.connect(gain)
    gain.connect(audio.destination)

    lua.message("initialized", audio.sampleRate)
}

function close()
{
    if(audio)
    {
        audio.destination.disconnect();
        delete audio
        audio = null
        lua.message("uninitialized")
    }
}

var buffer_cache = []

function download_buffer(url, callback, skip_cache, id)
{
    if (!skip_cache && buffer_cache[url])
    {
        callback(buffer_cache[url])

        return
    }

    var request = new XMLHttpRequest

    request.open("GET", url)
    request.responseType = "arraybuffer"
    request.send()

    request.onload = function()
    {
        lua.print("decoding " + url + " " + request.response.byteLength + " ...")

        audio.decodeAudioData(request.response,

            function(buffer)
            {
                lua.print("decoded " + url + " successfully")

                callback(buffer)

                buffer_cache[url] = buffer
            },

            function(err)
            {
                lua.print("decoding error " + url + " " + err)
				lua.message("stream", "call", id, "OnError", "decoding failed", err)
            }
        )
    }

    request.onprogress = function(event)
    {
        lua.print("downloading " +  (event.loaded / event.total) * 100)
    }

    request.onerror = function()
    {
        lua.print("downloading " + url + " errored")
		lua.message("stream", "call", id, "OnError", "download failed")
    };
}

function createStream(url, id, skip_cache)
{
    lua.print("Loading " + url)

    download_buffer(url, function(buffer)
    {
        var stream = {}

        stream.id = id
        stream.position = 0
        stream.buffer = buffer
        stream.url = url
        stream.speed = 1 // 1 = normal pitch
        stream.max_loop = 1 // -1 = inf
        stream.vol_left = 1
        stream.vol_right = 1
        stream.filter = audio.createBiquadFilter();
        stream.paused = true
        stream.use_smoothing = true
        stream.echo_volume = 0
        stream.filter_type = 0
        stream.filter_fraction = 1
        stream.done_playing = false

        stream.use_echo = false
        stream.echo_feedback = 0.75
        stream.echo_buffer = false

        stream.vol_left_smooth = 0
        stream.vol_right_smooth = 0
        stream.speed_smooth = stream.speed

        stream.play = function(stop, position)
        {
            if(position !== undefined)
            {
                stream.position = position
            }

            stream.paused = !stop
        };

        stream.usefft = function(enable)
        {
            // later
        }

		stream.useEcho = function(b) {
			stream.use_echo = b

			if (b)
			{
				stream.setEchoDelay(stream.echo_delay)
			}
			else
			{
				stream.echo_buffer = undefined
			}
		}

        stream.setEchoDelay = function(x) {

            if(stream.use_echo && (!stream.echo_buffer || (x != stream.echo_buffer.length))) {
                var size = 1;

                while((size <<= 1) < x);

				stream.echo_buffer = audio.createBuffer(2, size, audio.sampleRate);
            }

            stream.echo_delay = x;
        }

        streams[id] = stream

        lua.message("stream", "loaded", id, buffer.length)
    }, skip_cache, id)
}

function destroyStream(id)
{
}

open()

</script>

]==]
--addons/!lpakr_out/lua/autorun/pac_editor_init.lua:
if CLIENT&&pac&&pace&&!VLL_CURR_FILE&&!VLL2_FILEDEF then return end;if!pac then include("autorun/pac_core_init.lua")end;if!pac then error("pac editor requires pac core")end;if CLIENT then include("pac3/editor/client/init.lua")end
--addons/!lpakr_out/lua/pac3/editor/client/view.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/mctrl.lua:
pace.mctrl={}local a=pace.mctrl;a.grab_dist=15;a.angle_pos=0.5;local b=CreateClientConVar("pac_grid_pos_size","4")local c=CreateClientConVar("pac_grid_ang_size","45")local function d(e,f,g,h,i,j)local k=4*h/(6*math.tan(0.5*j))local l=i:Forward()local m=i:Right()local n=i:Up()return(k*l+(e-0.5*g)*m+(0.5*h-f)*n):GetNormalized()end;local function o(p,g,h,i,j)local k=4*h/(6*math.tan(0.5*j))local q=i:Forward():Dot(p)if q==0 then return 0,0,-1 end;local r=k/q*p;local s=0.5*g+i:Right():Dot(r)local t=0.5*h-i:Up():Dot(r)local u;if q<0 then u=-1 elseif s<0||s>g||t<0||t>h then u=0 else u=1 end;return s,t,u end;local function v(w,x)local y=Matrix()y:SetAngles(w)local z=Matrix()z:SetAngles(x)return(z*y):GetAngles()end;local function A(w,x)local y=Matrix()y:SetAngles(w)local z=Matrix()z:SetAngles(x)return(z:GetInverse()*y):GetAngles()end;local function B()local s,t=input.GetCursorPos()if a.grab&&a.grab.mouse_offset then s=s+a.grab.mouse_offset.x;t=t+a.grab.mouse_offset.y end;return s,t end;do a.target=NULL;function a.SetTarget(C)C=C||NULL;if!C:IsValid()then a.target=NULL;return end;if!C.GetDrawPosition then a.target=NULL else a.target=C end end;function a.GetTarget()return a.target:IsValid()&&!a.target:IsHidden()&&a.target||NULL end;function a.GetAxes(D)return D:Forward(),D:Right()*-1,D:Up()end;function a.GetWorldPosition()local C=a.GetTarget()if!C:IsValid()then return end;local E=C:GetWorldMatrixWithoutOffsets()return E:GetTranslation(),E:GetAngles()end;function a.GetWorldMatrix()local C=a.GetTarget()if!C:IsValid()then return end;return C:GetWorldMatrixWithoutOffsets()end;function a.WorldToLocalPosition(F,D)local C=a.GetTarget()if!C:IsValid()then return end;local G,x=C:GetBonePosition()if G&&x then return WorldToLocal(F,D,G,x)end end;function a.GetCameraFOV()if pace.editing_viewmodel||pace.editing_hands then return pac.LocalPlayer:GetActiveWeapon().ViewModelFOV||55 end;return pace.GetViewFOV()end;function a.VecToScreen(H)local s,t,I=o((H-EyePos()):GetNormalized(),ScrW(),ScrH(),EyeAngles(),math.rad(a.GetCameraFOV()))return{x=s-1,y=t-1,visible=I==1}end;function a.ScreenToVec(s,t)local H=d(s,t,ScrW(),ScrH(),EyeAngles(),math.rad(a.GetCameraFOV()))return H end;function a.GetGizmoSize()local C=pace.current_part;if pace.editing_viewmodel||pace.editing_hands then return 5 end;if C.ClassName=="clip"||C.ClassName=="clip2"then C=C.Parent end;if C.ClassName=="camera"then return 30 end;if C.ClassName=="group"then return 45 end;if!C:IsValid()||!C.GetWorldPosition then return 3 end;local dist=C:GetWorldMatrixWithoutOffsets():GetTranslation():Distance(pace.GetViewPos())/50;if dist>1 then dist=1/dist end;return 5*math.rad(pace.GetViewFOV())/dist end end;function a.LinePlaneIntersection(F,J,s,t)local K=J;local L=pace.GetViewPos()-F;local M=a.ScreenToVec(s,t)return L+M*-L:Dot(K)/M:Dot(K)end;local function N(O,P,Q,R)return O*Q+P*R end;function a.PointToAxis(F,S)local s,t=B()local T=a.VecToScreen(F)local U=a.VecToScreen(F+S*10)local V=math.atan2(U.y-T.y,U.x-T.x)local k=N(math.cos(V),math.sin(V),U.x-s,U.y-t)return U.x+math.cos(V)*-k,U.y+math.sin(V)*-k end;function a.CalculateMovement()local C=a.GetTarget()if!C:IsValid()then return end;local S=a.grab.axis;local W=a.GetGizmoSize()local E=a.grab.matrix;local F=E:GetTranslation()local X,Y,Z=E:GetForward(),-E:GetRight(),E:GetUp()local _;if S=="x"then local a0=a.LinePlaneIntersection(F,Y,a.PointToAxis(F,X))_=(a0:Dot(X)-W)*X elseif S=="y"then local a0=a.LinePlaneIntersection(F,X,a.PointToAxis(F,Y))_=(a0:Dot(Y)-W)*Y elseif S=="z"then local a0=a.LinePlaneIntersection(F,X,a.PointToAxis(F,Z))_=(a0:Dot(Z)-W)*Z elseif S=="view"then _=a.LinePlaneIntersection(F,pace.GetViewAngles():Forward(),B())end;if _ then local a1=Matrix()a1:SetTranslation(E:GetTranslation()+_)local z=a.grab.bone_matrix:GetInverse()*a1;local F=z:GetTranslation()if input.IsKeyDown(KEY_LCONTROL)then local a2=b:GetInt("pac_grid_pos_size")F.x=math.Round(F.x/a2)*a2;F.y=math.Round(F.y/a2)*a2;F.z=math.Round(F.z/a2)*a2 end;pace.Call("VariableChanged",C,"Position",F,0.25)timer.Create("pace_refresh_properties",0.1,1,function()pace.PopulateProperties(C)end)end end;function a.CalculateRotation()local C=a.GetTarget()if!C:IsValid()then return end;local S=a.grab.axis;local D=a.grab.matrix:GetAngles()local a3;if S=="x"then local a4=util.IntersectRayWithPlane(EyePos(),a.ScreenToVec(B()),a.grab.matrix:GetTranslation(),a.grab.matrix:GetRight())if!a4 then return end;local a5=(a4-a.grab.matrix:GetTranslation()):Angle()local a6=A(a5,D)local a7=a6.p;if math.abs(a6.y)>90 then a7=-a7+180 end;a7=math.NormalizeAngle(a7)a3=v(Angle(a7,0,0),D)elseif S=="y"then local a4=util.IntersectRayWithPlane(EyePos(),a.ScreenToVec(B()),a.grab.matrix:GetTranslation(),a.grab.matrix:GetUp())if!a4 then return end;local a5=(a4-a.grab.matrix:GetTranslation()):Angle()local a6=A(a5,D)a3=v(Angle(0,a6.y-90,0),D)elseif S=="z"then local a4=util.IntersectRayWithPlane(EyePos(),a.ScreenToVec(B()),a.grab.matrix:GetTranslation(),a.grab.matrix:GetForward())if!a4 then return end;local a5=(a4-a.grab.matrix:GetTranslation()):Angle()a5:RotateAroundAxis(a.grab.matrix:GetForward(),90)local a6=A(a5,D)local a7=a6.p;if a6.y>0 then a7=-a7+180 end;a7=math.NormalizeAngle(a7)a3=v(Angle(0,0,a7),D)end;if a3 then local D=A(a3,a.grab.bone_matrix:GetAngles())if input.IsKeyDown(KEY_LCONTROL)then local a2=c:GetInt("pac_grid_ang_size")D.p=math.Round(D.p/a2)*a2;D.y=math.Round(D.y/a2)*a2;D.r=math.Round(D.r/a2)*a2 end;pace.Call("VariableChanged",C,"Angles",D,0.25)timer.Create("pace_refresh_properties",0.1,1,function()pace.PopulateProperties(C)end)end end;a.grab={mode=nil,axis=nil}local a8=CreateClientConVar("pac_grab_clone","1",true,false,"Holding shift when moving or rotating a part creates its clone")function a.GUIMousePressed(a9)if a9!=MOUSE_LEFT then return end;local aa=a.GetTarget()if!aa:IsValid()then return end;local s,t=input.GetCursorPos()local F,D=a.GetWorldPosition()if!F||!D then return end;local X,Y,Z=a.GetAxes(D)local ab=a.GetGizmoSize()do local S;for ac,ad in pairs({x=a.VecToScreen(F+X*ab),y=a.VecToScreen(F+Y*ab),z=a.VecToScreen(F+Z*ab),view=a.VecToScreen(F)})do local k=math.sqrt((ad.x-s)^2+(ad.y-t)^2)if k<=a.grab_dist then S={axis=ac,pos=ad}break end end;if S then a.grab={}a.grab.mode="move"a.grab.axis=S.axis;local s,t=input.GetCursorPos()a.grab.mouse_offset={x=math.ceil(S.pos.x-s),y=math.ceil(S.pos.y-t)}a.grab.matrix=aa:GetWorldMatrixWithoutOffsets()*Matrix()a.grab.bone_matrix=aa:GetBoneMatrix()*Matrix()if a8:GetBool()&&input.IsShiftDown()then local ae=aa:Clone()ae:SetParent(ae:GetParent())end;pace.RecordUndoHistory()return true end end;do local S;for ac,ad in pairs({x=a.VecToScreen(F+X*ab*a.angle_pos),y=a.VecToScreen(F+Y*ab*a.angle_pos),z=a.VecToScreen(F+Z*ab*a.angle_pos)})do local k=math.sqrt((ad.x-s)^2+(ad.y-t)^2)if k<=a.grab_dist then S={axis=ac,pos=ad}break end end;if S then a.grab={}a.grab.mode="rotate"a.grab.axis=S.axis;local s,t=input.GetCursorPos()a.grab.mouse_offset={x=math.ceil(S.pos.x-s)+0.5,y=math.ceil(S.pos.y-t)+0.5}a.grab.matrix=aa:GetWorldMatrixWithoutOffsets()*Matrix()a.grab.bone_matrix=aa:GetBoneMatrix()*Matrix()a.grab.dist=dist;if a8:GetBool()&&input.IsShiftDown()then local ae=aa:Clone()ae:SetParent(ae:GetParent())end;pace.RecordUndoHistory()return true end end end;function a.GUIMouseReleased(a9)if a9==MOUSE_LEFT then a.grab=nil end;pace.RecordUndoHistory()end;local af=surface.GetTextureID("gui/center_gradient.vtf")local function ag(O,P,Q,R,ah,ai)ah=ah||1;if!ai then surface.SetTexture(af)end;local aj,ak=O-Q,P-R;local D=math.atan2(aj,ak)local al=math.sqrt(aj*aj+ak*ak)O=O-aj*0.5;P=P-ak*0.5;surface.DrawTexturedRectRotated(O,P,ah,al,math.deg(D))end;local function am(s,t,V,an)ag(s,t,V,an,3)end;local function ao(s,t,ap,aq,...)aq=aq||16;local ar=aq/ap-0.1;for ac=0,aq do local as=(ac+0)/aq*math.pi*2;local at=(ac+1+ar)/aq*math.pi*2;ag(s+math.sin(as)*ap,t+math.cos(as)*ap,s+math.sin(at)*ap,t+math.cos(at)*ap,...)end end;function a.LineToBox(T,U,au)au=au||7;am(T.x,T.y,U.x,U.y)ao(U.x,U.y,au,32,2)end;function a.RotationLines(F,av,aw,ab)local ax=a.VecToScreen(F+av*ab*a.angle_pos)local ay=a.VecToScreen(F+av*ab*a.angle_pos*0.9+aw*ab*0.08)local az=a.VecToScreen(F+av*ab*a.angle_pos*0.9+aw*ab*-0.08)am(ax.x,ax.y,ay.x,ay.y)am(ax.x,ax.y,az.x,az.y)end;function a.HUDPaint()a.LastThinkCall=FrameNumber()if pace.IsSelecting then return end;local aa=a.GetTarget()if!aa then return end;local F,D=a.GetWorldPosition()if!F||!D then return end;local X,Y,Z=a.GetAxes(D)local aA=a.GetGizmoSize()local T=a.VecToScreen(F)local aB=a.VecToScreen(F+X*aA)local aC=a.VecToScreen(F+Y*aA)local aD=a.VecToScreen(F+Z*aA)if T.visible||aB.visible||aC.visible||aD.visible then if a.grab&&(a.grab.axis=="x"||a.grab.axis=="view")then surface.SetDrawColor(255,200,0,255)else surface.SetDrawColor(255,80,80,255)end;a.LineToBox(T,aB)a.RotationLines(F,X,Z,aA)if a.grab&&(a.grab.axis=="y"||a.grab.axis=="view")then surface.SetDrawColor(255,200,0,255)else surface.SetDrawColor(80,255,80,255)end;a.LineToBox(T,aC)a.RotationLines(F,Y,X,aA)if a.grab&&(a.grab.axis=="z"||a.grab.axis=="view")then surface.SetDrawColor(255,200,0,255)else surface.SetDrawColor(80,80,255,255)end;a.LineToBox(T,aD)a.RotationLines(F,Z,Y,aA)surface.SetDrawColor(255,200,0,255)ao(T.x,T.y,4,32,2)end end;function a.Think()if pace.IsSelecting then return end;if!a.target:IsValid()then return end;if!a.grab then return end;if a.grab.axis&&a.grab.mode=="move"then a.CalculateMovement()elseif a.grab.axis&&a.grab.mode=="rotate"then a.CalculateRotation()end end;pac.AddHook("Think","pace_mctrl_Think",a.Think)pace.mctrl=a
--addons/!lpakr_out/lua/pac3/editor/client/wiki.lua:
pace.WikiURL="https://github.com/capsadmin/pac3/wiki/"pace.wiki_cache={}function pace.GetPropertyDescription(a,b,c)end;function pace.ShowHelp(a)pace.ShowWiki(pace.WikiURL)end
--addons/!lpakr_out/lua/pac3/extra/client/init.lua:
pacx=pacx||{}include("pac3/extra/shared/init.lua")include("contraption.lua")include("pac2_compat.lua")
--addons/!lpakr_out/lua/autorun/ppfx_cache.lua:
game.AddParticles("particles/pfx_redux.pcf")PrecacheParticleSystem("[1]campfire1")PrecacheParticleSystem("[1]cig_smoke*")PrecacheParticleSystem("[1]candle_flame")PrecacheParticleSystem("[1]ground_fire_1")PrecacheParticleSystem("[1]ground_fire_1*")PrecacheParticleSystem("[1]smoke_lifting_01")PrecacheParticleSystem("[1]_large_campfire")PrecacheParticleSystem("[1]fireplace_default")PrecacheParticleSystem("[1]_smoke_colorful_1")PrecacheParticleSystem("[1]groundflame1")PrecacheParticleSystem("[1]molotov_ground")PrecacheParticleSystem("[1]embers")PrecacheParticleSystem("[1]embers_~")PrecacheParticleSystem("[1]flametrail")PrecacheParticleSystem("[1]groundflame")PrecacheParticleSystem("[1]flamethrower_basic")PrecacheParticleSystem("[1]big_smoke")PrecacheParticleSystem("[1]_large_campfire_red")PrecacheParticleSystem("[1]_campfire_red")PrecacheParticleSystem("[1]_large_campfire_yellow")PrecacheParticleSystem("[1]_campfire_yellow")PrecacheParticleSystem("[1]_large_campfire_purple")PrecacheParticleSystem("[1]_campfire_purple")PrecacheParticleSystem("[1]_large_campfire_green")PrecacheParticleSystem("[1]_campfire_green")PrecacheParticleSystem("[1]_large_campfire_pink")PrecacheParticleSystem("[1]_campfire_pink")PrecacheParticleSystem("[1]_large_campfire_blue")PrecacheParticleSystem("[1]_campfire_blue")PrecacheParticleSystem("[1]g_leak_flame")PrecacheParticleSystem("[2]sparkle1")PrecacheParticleSystem("[2]sparkle2")PrecacheParticleSystem("[2]gushing_blood_alien")PrecacheParticleSystem("[2]gushing_blood_alien*")PrecacheParticleSystem("[2]gushing_blood")PrecacheParticleSystem("[2]gushing_blood*")PrecacheParticleSystem("[2]acid_ground")PrecacheParticleSystem("[2]swirl_1")PrecacheParticleSystem("[2]swirl_rnd")PrecacheParticleSystem("[2]gman_lines")PrecacheParticleSystem("[2]blood_leak")PrecacheParticleSystem("[2]blood_leak_alien")PrecacheParticleSystem("[3]sakura_env")PrecacheParticleSystem("[3]leaves_env")PrecacheParticleSystem("[4]jet_r")PrecacheParticleSystem("[4]jet_r*")PrecacheParticleSystem("[4]jet_r_s")PrecacheParticleSystem("[4]jet_r_s*")PrecacheParticleSystem("[4]jet_g_s")PrecacheParticleSystem("[4]jet_g_s*")PrecacheParticleSystem("[4]jet_g")PrecacheParticleSystem("[4]jet_g*")PrecacheParticleSystem("[4]jet_b_s")PrecacheParticleSystem("[4]jet_b_s*")PrecacheParticleSystem("[4]jet_b")PrecacheParticleSystem("[4]jet_b*")PrecacheParticleSystem("[4]jet_f_s")PrecacheParticleSystem("[4]jet_f_s*")PrecacheParticleSystem("[4]jet_f")PrecacheParticleSystem("[4]jet_f*")PrecacheParticleSystem("[4]jet_v_s")PrecacheParticleSystem("[4]jet_v_s*")PrecacheParticleSystem("[4]jet_v")PrecacheParticleSystem("[4]jet_v*")PrecacheParticleSystem("[4]energy_rod_r")PrecacheParticleSystem("[4]energy_rod_g")PrecacheParticleSystem("[4]energy_rod_b")PrecacheParticleSystem("[4]energy_rod_y")PrecacheParticleSystem("[4]arcs_electric_1")PrecacheParticleSystem("[4]arcs_electric_1_small")PrecacheParticleSystem("[4]bfg_*proj")PrecacheParticleSystem("[4]electric_beam")PrecacheParticleSystem("[4]matrix_core")PrecacheParticleSystem("[4]binary_sphere")PrecacheParticleSystem("[4]_car_nitro")PrecacheParticleSystem("[5]black_hole_micro_b")PrecacheParticleSystem("[5]black_hole_mmicro_b")PrecacheParticleSystem("[5]black_hole_b")PrecacheParticleSystem("[5]black_hole_micro")PrecacheParticleSystem("[5]black_hole_mmicro")PrecacheParticleSystem("[5]black_hole")PrecacheParticleSystem("[5]starfield1")PrecacheParticleSystem("[5]starfield_2")PrecacheParticleSystem("[5]simple_galaxy")PrecacheParticleSystem("[6]gunfire_generic")PrecacheParticleSystem("[6]bullet_tracer_generic")PrecacheParticleSystem("[6]gunfire_ar2")PrecacheParticleSystem("[6]bullet_tracer_ar2")PrecacheParticleSystem("[7]dusty_wind1")PrecacheParticleSystem("[7]rain")PrecacheParticleSystem("[7]snow")PrecacheParticleSystem("[7]areal_fog_s")PrecacheParticleSystem("[7]area_of_fog")PrecacheParticleSystem("[7]blizzard_mod")PrecacheParticleSystem("[8]magic_1")PrecacheParticleSystem("[8]red_vortex")PrecacheParticleSystem("[8]magic_flame")PrecacheParticleSystem("[8]magic_portal*")PrecacheParticleSystem("[8]magic_portal")PrecacheParticleSystem("[8]core_1")PrecacheParticleSystem("[8]ball_core")PrecacheParticleSystem("[8]orb_1")PrecacheParticleSystem("[8]frostbeam")PrecacheParticleSystem("[9]colorful_trail_1")PrecacheParticleSystem("[A]waterleak_1")
--addons/!lpakr_out/lua/casino/ui/casinoactions_ui.lua:
return lpakr()()
--addons/!lpakr_out/lua/casino/objects_sh.lua:
local a={}local b={}PINFO={}PINFO.__index=PINFO;function PINFO:Init(c,d,e)self.id=e&&e:SteamID64()||'house'self.casino=c;self.casinoid=c.internal;self.entity=e;self.house=!e;self.deck=d;self.hand={}self.waiting=false;self.cooldown=0;self.position=0;self.wager=0;self.value=0;self.timers={}self.ready=false end;function PINFO:SetReady(f)self.ready=f end;function PINFO:GetReady()return self.ready end;function PINFO:SetTimeout(g)self.casino:SetTimeout(self,g)end;function PINFO:RemoveTimeout()self.casino:RemoveTimeout(self)end;function PINFO:SetCooldown(h)self.cooldown=CurTime()+h end;function PINFO:AddTimer(i,g,j)local k='casino.'..self.casino.internal..'.'..self.id;self.timers[k]=true;timer.Create(k,g,1,function()if self then self.timers[k]=nil;j(self)end end)end;function PINFO:ClearTimers()for l,k in pairs(self.timers)do timer.Remove(k)end end;function PINFO:SetTurn(f)self.waiting=f;if SERVER&&IsValid(self.entity)then net.Send'casino.SetTurn'net.WriteBool(f)net.Send(self.entity)end end;function PINFO:SetWager(m,n)self.wager=math.Clamp(math.floor(m),0,casino.MaxWager)self.prewager=nil;self.skipround=n end;function PINFO:SetPosition(o)self.position=o end;function PINFO:AddRandomCardToHand(p)self.casino:AddRandomCardToHand(self,p)return self:SolveHandValue()end;function PINFO:SolveHandValue()local q=0;local r=0;for l,s in ipairs(pinfo.hand)do q=q+s.value end;if q>21 then for l,s in ipairs(pinfo.hand)do if s.specialValue then q=q-s.value;q=q+s.specialValue;if q<=21 then break end end end end;self.value=q;return self.value end;function PINFO:GetValue(t)if t||self.value==0 then return self:SolveHandValue()else return self.value end end;function PINFO:Clear()self.value=0;self.hand={}self.waiting=false;self.ready=false;self.skipround=false;self:ClearTimers()end;function casino.CreatePInfo(c,d,u)local v={}setmetatable(v,PINFO)v:Init(c,d,u)return v end;CASINO={}CASINO.__index=CASINO;function CASINO:Init()self.description=''self.deck=casino.DeckStack(self.id,4)self.actions={}self.timers={}self.players={}self.playing={}self.players_list={}self.maxplayers=4;self.position=0;self.roundcooldown=10;self.wagers=false end;function CASINO:SetDescription(w)self.description=w;return self end;function CASINO:Log(...)if info.CasinoLog then print(...)end end;function CASINO:SetWager(f)self.wagers=f;return self end;function CASINO:GameCreated()self:SetStatus(casino.STATUS_ENDED)return self end;function CASINO:SetController(u,x)self.controller=u;self.maxplayers=x;return self end;function CASINO:GetController()return self.controller end;function CASINO:SetStatus(y,pinfo,j,...)local z=casino.StatusString[y||0]||(y||0)self:Log(z,pinfo,j,...)if CLIENT then self:RunHook('Status',y)if IsValid(self.controller)then self.controller:OnStatusChanged(self,y,pinfo,j,...)end;return end;local A;if pinfo then if!IsValid(pinfo.entity)then return end;A=pinfo.entity else A=self.players_list;self.status=y;self:RunHook('Status',y)if IsValid(self.controller)then self.controller:OnStatusChanged(self,y,...)end end;net.Start'casino.RoundStatus'net.WriteUInt(self.internal,16)net.WriteUInt(y,4)if j then j(self)end;net.Send(A)end;function CASINO:StartCasino(e,o)local pinfo=casino.CreatePInfo(self,self.deck,e)pinfo:SetReady(false)pinfo:SetPosition(o)if self._SolveHandValue then pinfo.SolveHandValue=self._SolveHandValue end;e.casinoInfo=pinfo;self.players[pinfo.position]=pinfo;self.players_list[#self.players_list+1]=e;self:SetStatus(casino.PLAYER_SYNC,pinfo,function()net.WriteString(self.id)net.WriteUInt(o,4)if IsValid(self.controller)then net.WriteBool(true)net.WriteEntity(self.controller)else net.WriteBool(false)end end)if!self.wagers then self:SetReady(e,0)end end;function CASINO:RemovePInfoFromTable(B,pinfo)for C,D in pairs(B)do if D.id==pinfo.id then table.remove(B,C)return C end end;return false end;function CASINO:RemovePInfo(pinfo)self.players[pinfo.position]=nil;self:RemovePInfoFromTable(self.playing,pinfo)table.RemoveByValue(self.players_list,pinfo.entity)if#self.playing==0&&self.status==casino.STATUS_PLAYING then self:FinishRound()return end;if pinfo.position==self.position then self:Next()end end;function CASINO:EndCasino(e)local pinfo=self:GetPInfo(e)if!pinfo then return end;e.casinoInfo=nil;self:SetStatus(casino.PLAYER_DESYNC,pinfo)self:PlayerLeftCheckProgression(pinfo)self.players[pinfo.position]=nil;table.RemoveByValue(self.players_list,e)if IsValid(e:GetVehicle())then e:ExitVehicle()end end;function CASINO:UpdateWager(e,m)local pinfo=self:GetPInfo(e)if!pinfo then return end;pinfo.prewager=m;self:SetStatus(casino.PLAYER_WAGER,pinfo,function()net.WriteUInt(m,32)end)end;function CASINO:SetTimeout(pinfo,E)self:AddTimer(pinfo.id..'_timeout',E,function()if pinfo==self.playing[self.position]then self:UnReady(pinfo.entity)end end)end;function CASINO:RemoveTimeout(pinfo)self:RemoveTimer(pinfo.id..'_timeout')end;function CASINO:SetReady(e,m)local pinfo=self:GetPInfo(e)if!pinfo then return end;if!self:_OnPlayerReady(pinfo)then return end;local F=self:AddPlayingInOrder(pinfo)pinfo:SetReady(true)pinfo:SetWager(m||0,!F)self:RunHook('PlayerStatus',casino.PLAYER_READY,pinfo,m)self:SetStatus(casino.PLAYER_READY,pinfo,function()net.WriteUInt(m,32)end)if#self.playing==1&&self.AutoStart&&self.status==casino.STATUS_ENDED then self:StartRound()end end;function CASINO:AddPlayingInOrder(pinfo)local o=pinfo.position;local G=false;local H=-1;local I=self.position;local J=false;for C,K in ipairs(self.playing)do if K.position>o then H=table.insert(self.playing,C,pinfo)J=true;break end end;if!J then H=table.insert(self.playing,pinfo)end;if I<H&&#self.playing>1&&self.status!=casino.STATUS_ENDED then self.position=H else return true end end;function CASINO:UnReady(e)local pinfo=self:GetPInfo(e)if!pinfo then return end;pinfo:SetReady(false)pinfo:SetWager(0)pinfo.waiting=nil;self:RunHook('PlayerStatus',casino.PLAYER_UNREADY,pinfo)self:SetStatus(casino.PLAYER_UNREADY,pinfo)self:PlayerLeftCheckProgression(pinfo)end;function CASINO:AddTimer(i,g,j)local k='casino.'..self.internal..'.'..i;self.timers[k]=true;timer.Create(k,g,1,function()if self then self.timers[k]=nil;j(self)end end)end;function CASINO:RemoveTimer(i)local k='casino.'..self.internal..'.'..i;timer.Remove(k)end;function CASINO:AddActions(B)self.actions=B;return self end;function CASINO:SetAutoStart(f)self.AutoStart=f;return self end;function CASINO:StartRound()if#self.playing==0||self.status!=casino.STATUS_ENDED then return end;if self.wagers then for l,pinfo in pairs(self.playing)do local m=pinfo.prewager||pinfo.wager||0;if m>0&&casino.HasMoney(pinfo.entity,m)then pinfo:SetWager(m)casino.TakeMoney(pinfo.entity,m)else pinfo:SetWager(0)end end end;self:SetStatus(casino.STATUS_PLAYING)self:_OnRoundStarted(self.House)self:Next()return self end;function CASINO:HasReadyPlayer()return#self.playing>0 end;function CASINO:Next(L)if self.position>=#self.playing&&self.AutoRunHouseOnLastPlayer then self:_DoHouseTurn(self.House)return end;self.position=self.position%#self.playing+1;local pinfo=self.playing[self.position]if!pinfo then return end;if L then L:SetTurn(false)L:RemoveTimeout()self:RunHook('TurnEnded',L)end;local M=#self.playing;self:SetStatus(casino.PLAYER_TURN,nil,function(N)net.WriteUInt(pinfo.position,4)net.WritePlayer(pinfo.entity)end,pinfo)pinfo:SetTurn(true)pinfo:SetTimeout(info.Dev&&900||60)self:_DoPlayerTurn(pinfo,self.position>=M)end;function CASINO:PlayerLeftCheckProgression(pinfo)local O=#self.playing;local P=self:RemovePInfoFromTable(self.playing,pinfo)if!P then return end;if#self.playing==0 then self:FinishRound()return end;if P<=self.position then local Q=self.position;self.position=self.position-1;if P==Q then self:Next(pinfo)end end end;function CASINO:FinishRound(R)local S=self:_OnRoundFinished(self.House)if S then return end;self:SetStatus(casino.STATUS_ENDED)self:Clear()self:AddTimer('NextRound',R||self.roundcooldown,function()self:StartRound()end)end;function CASINO:AddHouse(T)self.House=casino.CreatePInfo(self,self.deck)self.AutoRunHouseOnLastPlayer=T;if self._SolveHandValue then self.House.SolveHandValue=self._SolveHandValue end;self:RunHook('HouseJoined',pinfo)return self end;function CASINO:RunHook(i,...)return hook.Run('OnCasino'..i,self,...)end;function CASINO:GetPInfo(e)return e.casinoInfo&&e.casinoInfo.casinoid==self.internal&&e.casinoInfo end;function CASINO:AddRandomCardToHand(pinfo,p)local U={}for C=1,p||1 do local s=self.deck:TakeCard(pinfo.id)table.insert(pinfo.hand,s)table.insert(U,s)end;self:RunHook('CardsAddedToHand',pinfo,U)self:SetStatus(casino.PLAYER_CARDS,nil,function()net.WriteUInt(pinfo.position,4)for l,s in ipairs(U)do net.WriteUInt(s.internal,casino.CardBits)end;net.WriteUInt(0,casino.CardBits)end,pinfo,U)end;function CASINO:SetPush(pinfo)if!pinfo.skipround then casino.AddMoney(pinfo.entity,pinfo.wager)end end;function CASINO:SetWinner(pinfo,V)V=V||1;if pinfo.skipround then return end;local W=pinfo.wager*V;if W>0 then casino.AddMoney(pinfo.entity,pinfo.wager+W)end;self:RunHook('PlayerStatus',casino.PLAYER_WON,pinfo,W,V)self:SetStatus(casino.PLAYER_WON,pinfo,function()net.WriteUInt(W,32)end)end;function CASINO:SetLoser(pinfo)if!pinfo.skipround then self:RunHook('PlayerStatus',casino.PLAYER_LOST,pinfo)self:SetStatus(casino.PLAYER_LOST,pinfo)end end;function CASINO:TakeRandomCard(X)return self.deck:TakeCardFromTop(X)end;function CASINO:Shuffle()self.deck:Shuffle()end;function CASINO:ClaimCards()for l,pinfo in pairs(self.players)do pinfo:Clear()end;if self.House then self.House:Clear()end;self.deck:CollectAllCards()end;function CASINO:RequestAction(e,Y,Z)local pinfo=self:GetPInfo(e)if#self.actions+1==Y then self:UnReady(e)return end;if pinfo&&pinfo.waiting&&pinfo.cooldown<CurTime()&&self.actions[Y]then self:_DoPlayerRequestAction(pinfo,self.actions[Y],Z)end end;function CASINO:OnRoundStarted(j)self._OnRoundStarted=j;return self end;function CASINO:OnPlayerReady(j)self._OnPlayerReady=j;return self end;function CASINO:OnUIUpdate(j)self._OnUIUpdate=j;return self end;function CASINO:OnUIActionInput(j)self._OnUIActionInput=j;return self end;function CASINO:OnRoundFinished(j)self._OnRoundFinished=j;return self end;function CASINO:OnHouseTurn(j)self._DoHouseTurn=j;return self end;function CASINO:OnSolveHandValue(j)self._SolveHandValue=j;return self end;function CASINO:OnPlayerTurn(j)self._DoPlayerTurn=j;return self end;function CASINO:OnPlayerRequestAction(j)self._DoPlayerRequestAction=j;return self end;function CASINO:DoHouseTurn(j)self._DoHouseTurn(self,self.House)return self end;function CASINO:_OnUIActionInput(_,a0)end;function CASINO:_OnUIUpdate(_,a1)end;function CASINO:_OnRoundStarted(a2)end;function CASINO:_OnPlayerReady(e)return true end;function CASINO:_OnRoundFinished()end;function CASINO:_DoHouseTurn()end;function CASINO:_DoPlayerTurn()end;function CASINO:_DoPlayerRequestAction()end;function CASINO:ClearTimers()for k,l in pairs(self.timers)do timer.Remove(k)end end;function CASINO:Clear()self:ClaimCards()self:ClearTimers()self.position=0 end;function CASINO:Remove()self:ClearTimers()for l,e in pairs(self.players_list)do if IsValid(e)then self:EndCasino(e)end end;self=nil end;function CASINO:__tostring()local B=util.TableToJSON({id=self.id,status=casino.StatusString[self.status||-1]||'N/A',['players_list (broadcast rec)']=self.players_list,['players (ready+unready)']=table.Count(self.players),['players (ready/playing)']=table.Count(self.playing)},true)return B end;function casino.CreateGame(a3,a0)local a4={id=a3,name=a0||a3}setmetatable(a4,CASINO)a[a3]=a4;a4:Init()return a4 end;function casino.NewGame(a3,a5)local a4=table.Copy(a[a3])if a5 then a4.internalid=a5;b[a5]=a4 else a4.internal=table.insert(b,a4)end;a4:Shuffle()return a4 end;function casino.GetActive(i)return b[i]end;function casino.GetAll()return b end;function casino.GetPlaying(e)local pinfo=e.casinoInfo;if pinfo then return e.casinoInfo.casino end end;function casino.RemoveActiveGame(a6)local c=b[a6]if c then c:Remove()end end
--addons/!lpakr_out/lua/casino/games_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/chess/ui/cl_dermaboard.lua:
return lpakr()()
--addons/!lpakr_out/lua/chess/ui/cl_dermachesscontrol.lua:
return lpakr()()
--addons/!lpakr_out/lua/chess/ui/cl_dermawager.lua:
local a={}local b=16777215;function a:Init()self:SetSize(300,120)self:Center()self:SetTitle'Wager'self:SetDeleteOnClose(true)self:MakePopup()ui.Create('DNumSlider',function(c)c:Dock(FILL)c:SetText'Set Wager'c:SetDecimals(0)c:SetValue(0)c:SizeToContents()c:DockMargin(10,20,10,20)self.Slider=c end,self)ui.Create('ui_panel',function(c)c:Dock(BOTTOM)ui.Create('ui_button',function(d)d:SetText'Accept'd:Dock(LEFT)d:SetWide(64)d:SetEnabled(false)d.WagerVal=-1;d.Think=function(e)if!IsValid(self.Board)then return end;local f=LocalPlayer()if f==self.Board:GetWhitePlayer()then local g=self.Board:GetBlackWager()if g&&g>=0 then e:SetEnabled(true)e:SetText(tostring(g))e.WagerVal=g end elseif f==self.Board:GetBlackPlayer()then local g=self.Board:GetWhiteWager()if g&&g>=0 then e:SetEnabled(true)e:SetText(tostring(g))e.WagerVal=g end end end;d.DoClick=function(e)self:SendWager(e.WagerVal)end end,c)ui.Create('ui_button',function(d)d:SetText'Send Wager'd:Dock(FILL)d.DoClick=function(e)self:SendWager(self.Slider:GetValue())end end,c)end,self)self.btnClose.DoClick=function(h)surface.PlaySound'sup/ui/beep.ogg'self:Resign()end end;function a:SendWager(i)net.Start'Chess.ClientWager'net.WriteUInt(math.Clamp(i,0,b),24)net.SendToServer()end;function a:Resign()net.Start'Chess.ClientResign'net.SendToServer()end;function a:Populate(j,k)self.Board=j;self.IsChess=k;self.Slider:SetMinMax(0,math.Clamp(LocalPlayer():GetMoney(),0,b))end;function a:Think()if!IsValid(self.Board)||self.Board:GetChessState()!=Chess.CHESS_WAGER||!LocalPlayer():InChess()then self:Remove()end end;vgui.Register('ui_chess_wager',a,'ui_frame')
--addons/!lpakr_out/lua/wos/anim_extension/core/sh_metatable.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/anim_extension/core/sh_prone_support.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/wire_paths.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/wiregates.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/memory.lua:
GateActions("Memory")GateActions["latch"]={name="Latch (Edge triggered)",description="Updates its value to Data when Clk changes and is greater than 0.",inputs={"Data","Clk"},output=function(a,b,c)local d=c>0;if a.PrevValue!=d then a.PrevValue=d;if d then a.LatchStore=b end end;return a.LatchStore||0 end,reset=function(a)a.LatchStore=0;a.PrevValue=nil end,label=function(e,b,c)return"Latch Data:"..b.."  Clock:"..c.." = "..e end}GateActions["dlatch"]={name="D-Latch",description="Updates its value to Data when Clk is greater than 0.",inputs={"Data","Clk"},output=function(a,b,c)if c>0 then a.LatchStore=b end;return a.LatchStore||0 end,reset=function(a)a.LatchStore=0 end,label=function(e,b,c)return"D-Latch Data:"..b.."  Clock:"..c.." = "..e end}GateActions["srlatch"]={name="SR-Latch",description="Outputs 1 when set (S) until it gets reset (R).",inputs={"S","R"},output=function(a,f,g)if f>0&&g<=0 then a.LatchStore=1 elseif f<=0&&g>0 then a.LatchStore=0 end;return a.LatchStore end,reset=function(a)a.LatchStore=0 end,label=function(e,f,g)return"S:"..f.." R:"..g.." == "..e end}GateActions["rslatch"]={name="RS-Latch",description="Outputs 1 when set (S) and not reset (R).",inputs={"S","R"},output=function(a,f,g)if f>0&&g<1 then a.LatchStore=1 elseif g>0 then a.LatchStore=0 end;return a.LatchStore end,reset=function(a)a.LatchStore=0 end,label=function(e,f,g)return"S:"..f.." R:"..g.." == "..e end}GateActions["toggle"]={name="Toggle (Edge triggered)",description="Toggles its output between two values when Clk changes.",inputs={"Clk","OnValue","OffValue"},output=function(a,c,h,i)local d=c>0;if a.PrevValue!=d then a.PrevValue=d;if d then a.LatchStore=!a.LatchStore end end;if a.LatchStore then return h end;return i end,reset=function(a)a.LatchStore=false;a.PrevValue=nil end,label=function(e,c,h,i)return"Off:"..i.."  On:"..h.."  Clock:"..c.." = "..e end}GateActions["wom4"]={name="Write Only Memory(4 store)",inputs={"Clk","AddrWrite","Data"},output=function(a,c,j,b)j=math.floor(tonumber(j))if c>0 then if j>=0&&j<4 then a.LatchStore[j]=b end end;return 0 end,reset=function(a)a.LatchStore={}for k=0,3 do a.LatchStore[k]=0 end end,label=function()return"Write Only Memory - 4 store"end}GateActions["ram8"]={name="RAM(8 store)",inputs={"Clk","AddrRead","AddrWrite","Data","Reset"},output=function(a,c,l,j,b,m)if m>0 then a.LatchStore={}end;l=math.floor(tonumber(l))j=math.floor(tonumber(j))if c>0 then if j>=0&&j<8 then a.LatchStore[j]=b end end;if l<0||l>=8 then return 0 end;return a.LatchStore[l]||0 end,reset=function(a)a.LatchStore={}end,label=function(e,c,l,j,b,m)return"WriteAddr:"..j.."  Data:"..b.."  Clock:"..c.."  Reset:"..m.."\nReadAddr:"..l.." = "..e end,ReadCell=function(n,a,o)if o<0||o>=8 then return 0 else return a.LatchStore[o]||0 end end,WriteCell=function(n,a,o,p)if o<0||o>=8 then return false else a.LatchStore[o]=p;return true end end}GateActions["ram64"]={name="RAM(64 store)",inputs={"Clk","AddrRead","AddrWrite","Data","Reset"},output=function(a,c,l,j,b,m)if m>0 then a.LatchStore={}end;l=math.floor(tonumber(l))j=math.floor(tonumber(j))if c>0 then if j<64 then a.LatchStore[j]=b end end;return a.LatchStore[l]||0 end,reset=function(a)a.LatchStore={}end,label=function(e,c,l,j,b,m)return"WriteAddr:"..j.."  Data:"..b.."  Clock:"..c.."  Reset:"..m.."\nReadAddr:"..l.." = "..e end,ReadCell=function(n,a,o)if o<0||o>=64 then return 0 else return a.LatchStore[o]||0 end end,WriteCell=function(n,a,o,p)if o<0||o>=64 then return false else a.LatchStore[o]=p;return true end end}GateActions["ram1k"]={name="RAM(1kb)",inputs={"Clk","AddrRead","AddrWrite","Data","Reset"},output=function(a,c,l,j,b,m)if m>0 then a.LatchStore={}end;l=math.floor(tonumber(l))j=math.floor(tonumber(j))if c>0 then if j<1024 then a.LatchStore[j]=b end end;return a.LatchStore[l]||0 end,reset=function(a)a.LatchStore={}end,label=function(e,c,l,j,b,m)return"WriteAddr:"..j.."  Data:"..b.."  Clock:"..c.."  Reset:"..m.."\nReadAddr:"..l.." = "..e end,ReadCell=function(n,a,o)if o<0||o>=1024 then return 0 else return a.LatchStore[o]||0 end end,WriteCell=function(n,a,o,p)if o<0||o>=1024 then return false else a.LatchStore[o]=p;return true end end}GateActions["ram32k"]={name="RAM(32kb)",inputs={"Clk","AddrRead","AddrWrite","Data","Reset"},output=function(a,c,l,j,b,m)if m>0 then a.LatchStore={}end;l=math.floor(tonumber(l))j=math.floor(tonumber(j))if c>0 then if j<32768 then a.LatchStore[j]=b end end;return a.LatchStore[l]||0 end,reset=function(a)a.LatchStore={}end,label=function(e,c,l,j,b,m)return"WriteAddr:"..j.."  Data:"..b.."  Clock:"..c.."  Reset:"..m.."\nReadAddr:"..l.." = "..e end,ReadCell=function(n,a,o)if o<0||o>=32768 then return 0 else return a.LatchStore[o]||0 end end,WriteCell=function(n,a,o,p)if o<0||o>=32768 then return false else a.LatchStore[o]=p;return true end end}GateActions["ram128k"]={name="RAM(128kb)",inputs={"Clk","AddrRead","AddrWrite","Data","Reset"},output=function(a,c,l,j,b,m)if m>0 then a.LatchStore={}end;l=math.floor(tonumber(l))j=math.floor(tonumber(j))if c>0 then if j<131072 then a.LatchStore[j]=b end end;return a.LatchStore[l]||0 end,reset=function(a)a.LatchStore={}end,label=function(e,c,l,j,b)return"WriteAddr:"..j.."  Data:"..b.."  Clock:"..c.."\nReadAddr:"..l.." = "..e end,ReadCell=function(n,a,o)if o<0||o>=131072 then return 0 else return a.LatchStore[o]||0 end end,WriteCell=function(n,a,o,p)if o<0||o>=131072 then return false else a.LatchStore[o]=p;return true end end}GateActions["ram64x64"]={name="RAM(64x64 store)",inputs={"Clk","AddrReadX","AddrReadY","AddrWriteX","AddrWriteY","Data","Reset"},output=function(a,c,q,r,s,t,b,m)if m>0 then a.LatchStore={}end;q=math.floor(tonumber(q))r=math.floor(tonumber(r))s=math.floor(tonumber(s))t=math.floor(tonumber(t))if c>0 then if s>=0&&s<64||t>=0&&t<64 then a.LatchStore[s+t*64]=b end end;if q<0||q>=64||r<0||r>=64 then return 0 end;return a.LatchStore[q+r*64]||0 end,reset=function(a)a.LatchStore={}end,label=function(e,c,q,r,s,t,b,m)return"WriteAddr:"..s..", "..t.."  Data:"..b.."  Clock:"..c.."  Reset:"..m.."\nReadAddr:"..q..", "..r.." = "..e end,ReadCell=function(n,a,o)if o<0||o>=4096 then return 0 else return a.LatchStore[o]||0 end end,WriteCell=function(n,a,o,p)if o<0||o>=4096 then return false else a.LatchStore[o]=p;return true end end}GateActions["udcounter"]={name="Up/Down Counter",description="Increases or decreases on Clk.",inputs={"Increment","Decrement","Clk","Reset"},output=function(a,u,v,c,m)local w=u>0;local x=v>0;local y=c>0;local z=m>0;if(a.PrevInc!=w||a.PrevDec!=x||a.PrevClk!=y)&&y then if w&&!x&&!z then a.countStore=(a.countStore||0)+1 elseif!w&&x&&!z then a.countStore=(a.countStore||0)-1 end;a.PrevInc=w;a.PrevDec=x;a.PrevClk=y end;if z then a.countStore=0 end;return a.countStore end,label=function(e,u,v,c,m)return"Increment:"..u.." Decrement:"..v.." Clk:"..c.." Reset:"..m.." = "..e end}GateActions["togglewhile"]={name="Toggle While(Edge triggered)",description="Toggles its output between two values when Clk changes and While is nonzero.",inputs={"Clk","OnValue","OffValue","While"},output=function(a,c,h,i,A)local d=c>0;if A<=0 then d=false;a.LatchStore=false end;if a.PrevValue!=d then a.PrevValue=d;if d then a.LatchStore=!a.LatchStore end end;if a.LatchStore then return h end;return i end,reset=function(a)a.LatchStore=0;a.PrevValue=nil end,label=function(e,c,h,i,A)return"Off:"..i.."  On:"..h.."  Clock:"..c.."  While:"..A.." = "..e end}GateActions()
--addons/!lpakr_out/lua/wire/gates/rangerdata.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/time.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/trig.lua:
GateActions("Trig")GateActions["quadratic"]={name="Quadratic Formula",description="Solves for X in the quadratic equation.",inputs={"A","B","C"},outputs={"Pos","Neg"},output=function(a,b,c,d)local e=math.sqrt(c^2-4*b*d)return(-c+e)/(2*b),(-c-e)/(2*b)end,label=function(f,b,c,d)return("AX^2 + BX + C\n(-%s +/- sqrt(%s^2 - 4*%s*%s)) / (2*%s) = %s,%s"):format(c,c,b,d,b,f.Pos,f.Neg)end}GateActions["sin"]={name="Sin(Rad)",inputs={"A"},output=function(a,b)return math.sin(b)end,label=function(f,b)return"sin("..b.."rad) = "..f end}GateActions["cos"]={name="Cos(Rad)",inputs={"A"},output=function(a,b)return math.cos(b)end,label=function(f,b)return"cos("..b.."rad) = "..f end}GateActions["tan"]={name="Tan(Rad)",inputs={"A"},output=function(a,b)return math.tan(b)end,label=function(f,b)return"tan("..b.."rad) = "..f end}GateActions["asin"]={name="Asin(Rad)",inputs={"A"},output=function(a,b)return math.asin(b)end,label=function(f,b)return"asin("..b..") = "..f.."rad"end}GateActions["acos"]={name="Acos(Rad)",inputs={"A"},output=function(a,b)return math.acos(b)end,label=function(f,b)return"acos("..b..") = "..f.."rad"end}GateActions["atan"]={name="Atan(Rad)",inputs={"A"},output=function(a,b)return math.atan(b)end,label=function(f,b)return"atan("..b..") = "..f.."rad"end}GateActions["sin_d"]={name="Sin(Deg)",inputs={"A"},output=function(a,b)return math.sin(math.rad(b))end,label=function(f,b)return"sin("..b.."deg) = "..f end}GateActions["cos_d"]={name="Cos(Deg)",inputs={"A"},output=function(a,b)return math.cos(math.rad(b))end,label=function(f,b)return"cos("..b.."deg) = "..f end}GateActions["tan_d"]={name="Tan(Deg)",inputs={"A"},output=function(a,b)return math.tan(math.rad(b))end,label=function(f,b)return"tan("..b.."deg) = "..f end}GateActions["asin_d"]={name="Asin(Deg)",inputs={"A"},output=function(a,b)return math.deg(math.asin(b))end,label=function(f,b)return"asin("..b..") = "..f.."deg"end}GateActions["acos_d"]={name="Acos(Deg)",inputs={"A"},output=function(a,b)return math.deg(math.acos(b))end,label=function(f,b)return"acos("..b..") = "..f.."deg"end}GateActions["atan_d"]={name="Atan(Deg)",inputs={"A"},output=function(a,b)return math.deg(math.atan(b))end,label=function(f,b)return"atan("..b..") = "..f.."deg"end}GateActions["rad2deg"]={name="Radians to Degrees",inputs={"A"},output=function(a,b)return math.deg(b)end,label=function(f,b)return b.."rad = "..f.."deg"end}GateActions["deg2rad"]={name="Degrees to Radians",inputs={"A"},output=function(a,b)return math.rad(b)end,label=function(f,b)return b.."deg = "..f.."rad"end}GateActions["angdiff"]={name="Difference(rad)",inputs={"A","B"},output=function(a,b,c)return math.rad(math.AngleDifference(math.deg(b),math.deg(c)))end,label=function(f,b,c)return b.."deg - "..c.."deg = "..f.."deg"end}GateActions["angdiff_d"]={name="Difference(deg)",inputs={"A","B"},output=function(a,b,c)return math.AngleDifference(b,c)end,label=function(f,b,c)return b.."deg - "..c.."deg = "..f.."deg"end}GateActions["atan2"]={name="Atan2",inputs={"A","B"},output=function(a,b,c)return math.atan2(b,c)end,label=function(f,b,c)return"atan2("..b..","..c..") = "..f end}GateActions()
--addons/!lpakr_out/lua/wos/advswl/forms/cl_forms.lua:
return lpakr()()
--addons/!lpakr_out/lua/advdupe2/cl_ghost.lua:
function AdvDupe2.LoadGhosts(a,b,c,d,e)AdvDupe2.RemoveGhosts()AdvDupe2.Ghosting=true;AdvDupe2.GhostToSpawn={}local f=0;local g,h,i,j;if b.ad1 then local k=a.HeadEnt.Z;local l,m;g=c.Time||""h=b.Description||""i=b.Date||""j=b.Creator||""AdvDupe2.HeadEnt=a.HeadEnt.Index;AdvDupe2.HeadPos=a.HeadEnt.Pos;AdvDupe2.HeadZPos=k;AdvDupe2.HeadPos.Z=AdvDupe2.HeadPos.Z+k;for n,o in pairs(a.Entities)do if o.SavedParentIdx then if!o.BuildDupeInfo then o.BuildDupeInfo={}end;o.BuildDupeInfo.DupeParentID=o.SavedParentIdx;l=o.LocalPos;m=o.LocalAngle else l,m=nil,nil end;for p,q in pairs(o.PhysicsObjects)do q.Pos=l||q.LocalPos;q.Pos.Z=q.Pos.Z-k;q.Angle=m||q.LocalAngle;q.LocalPos=nil;q.LocalAngle=nil end;o.LocalPos=nil;o.LocalAngle=nil;AdvDupe2.GhostToSpawn[f]={Model=o.Model,PhysicsObjects=o.PhysicsObjects}if AdvDupe2.HeadEnt==n then AdvDupe2.HeadEnt=f end;f=f+1 end;AdvDupe2.HeadOffset=AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Pos;AdvDupe2.HeadAngle=AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Angle else g=b.time||""h=a.Description||""i=b.date||""j=b.name||""AdvDupe2.HeadEnt=a.HeadEnt.Index;AdvDupe2.HeadZPos=a.HeadEnt.Z;AdvDupe2.HeadPos=a.HeadEnt.Pos;AdvDupe2.HeadOffset=a.Entities[AdvDupe2.HeadEnt].PhysicsObjects[0].Pos;AdvDupe2.HeadAngle=a.Entities[AdvDupe2.HeadEnt].PhysicsObjects[0].Angle;for n,o in pairs(a.Entities)do AdvDupe2.GhostToSpawn[f]={Model=o.Model,PhysicsObjects=o.PhysicsObjects}if AdvDupe2.HeadEnt==n then AdvDupe2.HeadEnt=f end;f=f+1 end end;if!e then AdvDupe2.Info.File:SetText("File: "..d)AdvDupe2.Info.Creator:SetText("Creator: "..j)AdvDupe2.Info.Date:SetText("Date: "..i)AdvDupe2.Info.Time:SetText("Time: "..g)AdvDupe2.Info.Size:SetText("Size: "..string.NiceSize(tonumber(b.size)||0))AdvDupe2.Info.Desc:SetText("Desc: "..(h||""))AdvDupe2.Info.Entities:SetText("Entities: "..table.Count(a.Entities))AdvDupe2.Info.Constraints:SetText("Constraints: "..table.Count(a.Constraints))end;AdvDupe2.StartGhosting()AdvDupe2.Preview=e end;function AdvDupe2.RemoveGhosts()if AdvDupe2.Ghosting then hook.Remove("Tick","AdvDupe2_SpawnGhosts")AdvDupe2.Ghosting=false;if!AdvDupe2.BusyBar then AdvDupe2.RemoveProgressBar()end end;if AdvDupe2.GhostEntities then for n,o in pairs(AdvDupe2.GhostEntities)do if IsValid(o)then o:Remove()end end end;if IsValid(AdvDupe2.HeadGhost)then AdvDupe2.HeadGhost:Remove()end;AdvDupe2.CurrentGhost=1;AdvDupe2.HeadGhost=nil;AdvDupe2.GhostEntities=nil;AdvDupe2.Preview=false end;local function r(s)if!s then return end;if!s.Model||s.Model:sub(-4,-1)!=".mdl"then s.Model="models/error.mdl"end;local t=ClientsideModel(s.Model,RENDERGROUP_TRANSLUCENT)if!IsValid(t)then AdvDupe2.RemoveGhosts()AdvDupe2.Notify("Too many entities to spawn ghosts!",NOTIFY_ERROR)return end;t:SetRenderMode(RENDERMODE_TRANSALPHA)t:SetColor(Color(255,255,255,150))t.Phys=s.PhysicsObjects[0]if util.IsValidRagdoll(s.Model)then local u,v,w={},{},{}t:SetupBones()for n,o in pairs(s.PhysicsObjects)do local x=t:TranslatePhysBoneToBone(n)local y=t:GetBoneParent(x)if y==-1 then u[x]=t:GetBoneMatrix(x):GetInverseTR()else y=t:TranslatePhysBoneToBone(t:TranslateBoneToPhysBone(y))v[x]=y;u[x]=t:GetBoneMatrix(x):GetInverseTR()*t:GetBoneMatrix(y)end;local z=Matrix()z:SetAngles(o.Angle)w[x]=z end;for x,A in pairs(w)do if v[x]&&w[v[x]]then local B=w[v[x]]:GetInverseTR()*A;local z=u[x]*B;t:ManipulateBoneAngles(x,z:GetAngles())else local C=t:GetBonePosition(x)t:ManipulateBonePosition(x,-C)t:ManipulateBoneAngles(x,u[x]:GetAngles())end end end;return t end;local function D()if AdvDupe2.CurrentGhost==AdvDupe2.HeadEnt then AdvDupe2.CurrentGhost=AdvDupe2.CurrentGhost+1 end;local E=AdvDupe2.GhostToSpawn[AdvDupe2.CurrentGhost]if E&&AdvDupe2.CurrentGhost/AdvDupe2.TotalGhosts*100<=GetConVar("advdupe2_limit_ghost"):GetFloat()then AdvDupe2.GhostEntities[AdvDupe2.CurrentGhost]=r(E)if!AdvDupe2.BusyBar then AdvDupe2.ProgressBar.Percent=AdvDupe2.CurrentGhost/AdvDupe2.TotalGhosts*100 end;AdvDupe2.CurrentGhost=AdvDupe2.CurrentGhost+1;AdvDupe2.UpdateGhosts(true)else AdvDupe2.Ghosting=false;hook.Remove("Tick","AdvDupe2_SpawnGhosts")if!AdvDupe2.BusyBar then AdvDupe2.RemoveProgressBar()end end end;net.Receive("AdvDupe2_SendGhosts",function(F,G,H)AdvDupe2.RemoveGhosts()AdvDupe2.GhostToSpawn={}AdvDupe2.HeadEnt=net.ReadInt(16)AdvDupe2.HeadZPos=net.ReadFloat()AdvDupe2.HeadPos=net.ReadVector()local I={}for p=1,net.ReadInt(16)do I[p]=net.ReadString()end;for p=1,net.ReadInt(16)do AdvDupe2.GhostToSpawn[p]={Model=I[net.ReadInt(16)],PhysicsObjects={}}for n=0,net.ReadInt(8)do AdvDupe2.GhostToSpawn[p].PhysicsObjects[n]={Angle=net.ReadAngle(),Pos=net.ReadVector()}end end;AdvDupe2.CurrentGhost=1;AdvDupe2.GhostEntities={}AdvDupe2.HeadGhost=r(AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt])AdvDupe2.HeadOffset=AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Pos;AdvDupe2.HeadAngle=AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Angle;AdvDupe2.GhostEntities[AdvDupe2.HeadEnt]=AdvDupe2.HeadGhost;AdvDupe2.TotalGhosts=#AdvDupe2.GhostToSpawn;if AdvDupe2.TotalGhosts>1 then AdvDupe2.Ghosting=true;if!AdvDupe2.BusyBar then AdvDupe2.InitProgressBar("Ghosting: ")AdvDupe2.BusyBar=false end;hook.Add("Tick","AdvDupe2_SpawnGhosts",D)else AdvDupe2.Ghosting=false end end)net.Receive("AdvDupe2_AddGhost",function(F,G,H)local J={Model=net.ReadString(),PhysicsObjects={}}for n=0,net.ReadInt(8)do J.PhysicsObjects[n]={Angle=net.ReadAngle(),Pos=net.ReadVector()}end;AdvDupe2.GhostEntities[AdvDupe2.CurrentGhost]=r(J)AdvDupe2.CurrentGhost=AdvDupe2.CurrentGhost+1 end)function AdvDupe2.StartGhosting()AdvDupe2.RemoveGhosts()if!AdvDupe2.GhostToSpawn then return end;AdvDupe2.CurrentGhost=1;AdvDupe2.GhostEntities={}AdvDupe2.Ghosting=true;AdvDupe2.HeadGhost=r(AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt])AdvDupe2.GhostEntities[AdvDupe2.HeadEnt]=AdvDupe2.HeadGhost;AdvDupe2.TotalGhosts=#AdvDupe2.GhostToSpawn;if AdvDupe2.TotalGhosts>1 then if!AdvDupe2.BusyBar then AdvDupe2.InitProgressBar("Ghosting: ")AdvDupe2.BusyBar=false end;hook.Add("Tick","AdvDupe2_SpawnGhosts",D)else AdvDupe2.Ghosting=false end end;net.Receive("AdvDupe2_StartGhosting",function()AdvDupe2.StartGhosting()end)net.Receive("AdvDupe2_RemoveGhosts",AdvDupe2.RemoveGhosts)local K,L=Vector(),Angle()function AdvDupe2.UpdateGhosts(M)if!IsValid(AdvDupe2.HeadGhost)then AdvDupe2.RemoveGhosts()AdvDupe2.Notify("Invalid ghost parent!",NOTIFY_ERROR)return end;local N=LocalPlayer():GetEyeTrace()if!N.Hit then return end;local O,P,Q,R;local S=GetConVar("advdupe2_offset_world"):GetBool()if GetConVar("advdupe2_original_origin"):GetBool()then P=Angle()O=Vector(AdvDupe2.HeadPos)Q=AdvDupe2.HeadPos+AdvDupe2.HeadOffset;R=AdvDupe2.HeadAngle else local T=S&&Angle(0,0,0)||AdvDupe2.HeadAngle;local U=math.Clamp(AdvDupe2.HeadZPos+GetConVar("advdupe2_offset_z"):GetFloat()||0,-16000,16000)local V=math.Clamp(GetConVar("advdupe2_offset_pitch"):GetFloat()||0,-180,180)local W=math.Clamp(GetConVar("advdupe2_offset_yaw"):GetFloat()||0,-180,180)local X=math.Clamp(GetConVar("advdupe2_offset_roll"):GetFloat()||0,-180,180)P=Angle(V,W,X)O=Vector(N.HitPos)O.z=O.z+U;Q,R=LocalToWorld(AdvDupe2.HeadOffset,T,O,P)end;if math.abs(K.x-Q.x)>0.01||math.abs(K.y-Q.y)>0.01||math.abs(K.z-Q.z)>0.01||math.abs(L.p-R.p)>0.01||math.abs(L.y-R.y)>0.01||math.abs(L.r-R.r)>0.01||M then K=Q;L=R;AdvDupe2.HeadGhost:SetPos(Q)AdvDupe2.HeadGhost:SetAngles(R)for n,J in ipairs(AdvDupe2.GhostEntities)do local Y=J.Phys;local C,A=LocalToWorld(Y.Pos,Y.Angle,O,P)J:SetPos(C)J:SetAngles(A)end end end
--addons/!lpakr_out/lua/vgui/stackercontrolpresets.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/terms.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/libraries/keybind.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/cl_cvar.lua:
cvar.Register'srp_hud':SetDefault(true):AddMetadata('Menu','Enable HUD'):AddMetadata('Category','SSRP'):SetDescription('Shows or hides useful information on screen.'):ConCommand(function(self,a,b)local c=tobool(b[1]||false)if c then srp.hud.Open()elseif IsValid(srp.hud.ui)then srp.hud.ui:Remove()end;cvar.SetValue('srp_hud',c)end):AddCallback(function(d,e)if e then srp.hud.Open()elseif IsValid(srp.hud.ui)then srp.hud.ui:Remove()end end)cvar.Register'srp_hud_showself':SetDefault(false,true):AddMetadata('Menu','Display own nameplate'):AddMetadata('Category','SSRP'):SetDescription('Displays the nameplate above your own head')cvar.Register'srp_hud_nickname':SetDefault(false,true):AddMetadata('Menu','Display nickname on nameplate'):AddMetadata('Category','SSRP'):SetDescription('Displays the persons nickname above their head.')cvar.Register'srp_storeshowinventory':SetDefault(true,true):AddMetadata('Menu','Display Inventory in Store/Storage'):AddMetadata('Category','SSRP'):SetDescription('Useful for smaller resolution devices. If disabled it hides your own inventory from view in the store/storage.')cvar.Register'srp_groupmdls':SetDefault(true):AddMetadata('Menu','Display Models in Group List'):AddMetadata('Category','SSRP'):SetDescription('The 3d models displayed in the F4 battalion list menu.')cvar.Register'srp_chat':SetDefault(true):AddMetadata('Menu','Enable Chat'):AddMetadata('Category','Chat'):SetDescription('You can still read chat via console.'):ConCommand(function(self,a,b)if!b[1]then self:SetValue(!self:GetValue())else self:SetValue(b[1]=='1')end end)cvar.Register'srp_chattagtime':SetDefault(true):AddMetadata('Menu','Enable Chat Tags'):AddMetadata('Category','Chat'):SetDescription('Turns off chat tags showing above player heads.'):ConCommand(function(self,a,b)if!b[1]then self:SetValue(!self:GetValue())else self:SetValue(b[1]=='1')end end)cvar.Register'srp_markers':SetDefault(true):AddMetadata('Menu','Enable Battalion Markers'):AddMetadata('Category','SSRP'):SetDescription('Sounds and visual indicators made by your battalion members to mark points of interest.')local f={cl_updaterate={16,16},cl_cmdrate={16,16},gmod_mcore_test={1,0},mat_queue_mode={2,-1},cl_threaded_bone_setup={0,0},cl_threaded_client_leaf_system={1,0},r_threaded_client_shadow_manager={1,0},r_threaded_particles={1,0},r_threaded_renderables={1,0},snd_mix_async={1,0}}local function g(h)for i,j in pairs(f)do RunConsoleCommand(i,j[h&&1||2])end end;cvar.Register'srp_multicore':SetDefault(false):AddMetadata('Menu','Performance Rendering'):AddMetadata('Category','SSRP'):SetDescription('May give some performance benefits. Revert if you suddely get more issues!'):ConCommand(function(self,a,b)g(tobool(b[1]||false))end):AddCallback(function(d,e)g(tobool(e||false))end)g(tobool(cvar.GetValue('srp_multicore')))cvar.Register'srp_minimal':SetDefault(false):AddMetadata('Category','SSRP'):AddMetadata('Menu','Minimal Mode'):SetDescription('Enforces reduced rendering range and lighting options.')cvar.Register'srp_screeneffects':SetDefault(true):AddMetadata('Category','SSRP'):AddMetadata('Menu','Screenspace Effects'):SetDescription('Screen overlay effects and sounds that may play.')cvar.Register'srp_outlines':SetDefault(true):AddMetadata('Category','SSRP'):AddMetadata('Menu','Draw Outlines'):SetDescription('Draw outlines around objects of significance.')cvar.Register'srp_textscreens':SetDefault(true):AddMetadata('Menu','Textscreens'):AddMetadata('Category','SSRP'):SetDescription('3d textscreens on the walls will no longer be displayed.')cvar.Register'srp_physgun_all':SetDefault(true):AddMetadata('Menu','Enable Global Physgun'):AddMetadata('Category','Gamemaster'):SetDescription('You can physgun any props not owned by you.'):SetConVar(true,true,function(self,k)return tobool(k)end)cvar.Register'srp_tools_ignore':SetDefault(false):AddMetadata('Menu','Ignore Tool Selection'):AddMetadata('Category','Gamemaster'):SetDescription('Ignores your GM/Staff tools when weapon switching.'):AddCallback(function(d,e)srp.hud.EnsureWeapons(true)end):SetConVar(true,true,function(self,k)return tobool(k)end)cvar.Register'srp_cosmetics':SetDefault(false,true):AddMetadata('Menu','Enable'):AddMetadata('Category','Cosmetics'):SetDescription('Enable or disable showing of yours and others cosmetics globally.')cvar.Register'event_visuals':SetDefault(true,true):AddMetadata('Menu','Enable Event Cosmetics'):AddMetadata('Category','Cosmetics'):SetDescription('Display Seasonal Room Decorations and sounds for Winter, Halloween, Summer etc.')cvar.Register'srp_cosmeticsseasons':SetDefault(true,true):AddMetadata('Menu','Enable Seasonal Items'):AddMetadata('Category','Cosmetics'):SetDescription('Display seasonal specific cosmetics.')cvar.Register'srp_cosmeticeffects':SetDefault(true,true):AddMetadata('Menu','Effects'):AddMetadata('Category','Cosmetics'):SetDescription('Shows or hides all player effects.')cvar.Register'srp_cosmeticsweapons':SetDefault(true,true):AddMetadata('Menu','Weapon Skins'):AddMetadata('Category','Cosmetics'):SetDescription('Display weapon cosmetics.')cvar.Register'srp_cosmeticsweaponseasonal':SetDefault(true,true):AddMetadata('Menu','Weapon Seasonal'):AddMetadata('Category','Cosmetics'):SetDescription('Display seasonal cosmetics or very out of place cosmetics.')cvar.Register'srp_cosmeticsweapondecals':SetDefault(true,true):AddMetadata('Menu','Weapon Blast Marks'):AddMetadata('Category','Cosmetics'):SetDescription('Display cosmetic blastmarks or very out of place infusers.')cvar.Register'srp_cosmeticsvehicles':SetDefault(true,true):AddMetadata('Menu','Vehicle Skins'):AddMetadata('Category','Cosmetics'):SetDescription('Display all vehicle cosmetics.')cvar.Register'srp_cosmeticsvehiclesextra':SetDefault(false,true):AddMetadata('Menu','Vehicle Skins (Spicy)'):AddMetadata('Category','Cosmetics'):SetDescription('Display all vehicle cosmetics deemed to be too distracting or out of place.')cvar.Register'srp_cosmeticspets':SetDefault(true,true):AddMetadata('Menu','Pets'):AddMetadata('Category','Cosmetics'):SetDescription('Display all weapon pet cosmetics.')cvar.Register'srp_cosmeticspeteffects':SetDefault(true,true):AddMetadata('Menu','Pet Effects'):AddMetadata('Category','Cosmetics'):SetDescription('Shows or hides all weapon pet cosmetic effects that may play on some pet cosmetics.')cvar.Register'srp_quickswitch':SetDefault(false,true):AddMetadata('Category','Weapons'):AddMetadata('Menu','Enable Quick Weapon Switch'):SetDescription('Your weapon will instantly change to the next available weapon in your loadout.')cvar.Register'weapon_switchui_remember':SetDefault(false,true):AddMetadata('Category','Weapons'):AddMetadata('Menu','Remember Last Weapon Selection'):SetDescription('When changing weapons the last weapon will be auto-highlighted.')cvar.Register'weapon_hitmarker':SetDefault(true,true):AddMetadata('Category','Weapons'):AddMetadata('Menu','Enable Hitmarkers'):SetDescription('Display hitmarkers based on if the client thinks you hit someone.')cvar.Register'weapon_crosshair':SetDefault(true,true):AddMetadata('Category','Crosshair'):AddMetadata('Menu','Enable Gamemode Crosshair'):SetDescription('If enabled gamemode based crosshairs will be visible.')cvar.Register'weapon_staticcrosshair':SetDefault(false,true):AddMetadata('Category','Crosshair'):AddMetadata('Menu','Enable Static Crosshair'):SetDescription('When enabled the crosshair will be in 2D space instead of 3D space.')cvar.Register'weapon_crosshairads':SetDefault(false,true):AddMetadata('Category','Crosshair'):AddMetadata('Menu','Enable ADS Crosshair'):SetDescription('The crosshair will be visible even when aiming down sights.')cvar.Register'weapon_muzzleflash':SetDefault(true,true):AddMetadata('Category','Weapons'):AddMetadata('Menu','Enable Muzzleflash Effect'):SetDescription('Enable any muzzleflashes when the weapon fires if it supports it.')local l=CreateClientConVar('srp_weapon_ads_toggle','0',true,true,'Makes it so you must right click again to get out of ADS.')cvar.Register'weapon_adstoggle':SetDefault(false,true):AddMetadata('Category','Weapons'):AddMetadata('Menu','Enable Toggle ADS'):SetDescription('If enabled the weapon will stay in ADS mode when you let go of right click.'):ConCommand(function(self,a,b)l:SetBool(b[1])end):AddCallback(function(d,e)l:SetBool(e)end)cvar.Register'srp_weapon_tp_ads':SetDefault(false,true):AddMetadata('Category','Weapons'):AddMetadata('Menu','Enable Thirdperson ADS'):SetDescription('When enabled holding right click while in thirdperson will auto-ads you.')cvar.Register'lightsaber_simpleability':SetDefault(false,true):AddMetadata('Category','Weapons'):AddMetadata('Menu','Enable Lightsaber Ability Bar'):SetDescription('Removes icons and shows full ability names.')cvar.Register'lightsaber_brightness':SetDefault(0,true):AddMetadata('Category','Weapons'):AddMetadata('Menu','Change Lightsaber Brightness'):AddMetadata('Type','number'):SetDescription('How bright and big the light emitted from the lightsabers are.')cvar.Register'lightsaber_effects':SetDefault(true,true):AddMetadata('Category','Weapons'):AddMetadata('Menu','Enable Lightsaber Effects'):SetDescription('Enables or disables some of the custom lightsaber crystal effects.')cvar.Register'weapon_aimsense':SetDefault(1,true):AddMetadata('Category','Weapons'):AddMetadata('Menu','Change ADS Sensitivity'):AddMetadata('Type','number'):SetDescription('Aim sensitivity multiplier.')cvar.Register'weapon_aimsense_sniper':SetDefault(1,true):AddMetadata('Category','Weapons'):AddMetadata('Menu','Change Sniper ADS Sensitivity'):AddMetadata('Type','number'):SetDescription('Aim sensitivity multiplier for sniper rifles.')cvar.Register'srp_quests_minimized':SetDefault(false,true):AddMetadata('Category','Quests'):AddMetadata('Menu','Start Minimized'):SetDescription('The quest display will be minimized by default.')cvar.Register'srp_quests_flashprogress':SetDefault(true,true):AddMetadata('Category','Quests'):AddMetadata('Menu','Flash Objective Progress'):SetDescription('When there is progress made in a quest objective then it will flash.')local function m(h)if h then srp.objectives.Display()elseif IsValid(srp.objectives.ui)then srp.objectives.ui:Remove()end end;cvar.Register'srp_showobjectives':SetDefault(true,true):AddMetadata('Category','SSRP'):AddMetadata('Menu','Enable Objectives'):SetDescription('Show the objectives created by GMs in events.'):ConCommand(function(self,a,b)m(tobool(b[1]||false))end):AddCallback(function(d,e)m(tobool(e||false))end)cvar.Register'srp_trainingnotif':SetDefault(true,true):AddMetadata('Category','Chat'):AddMetadata('Menu','Enable Player Trained Notifications')cvar.Register'srp_showallobjectives':SetDefault(true,true):AddMetadata('Category','Gamemaster'):AddMetadata('Menu','Display all group objectives'):SetDescription('See all objectives.')cvar.Register'srp_triumpcompleted':SetDefault(true,true):AddMetadata('Menu','Enable Achievement completion UI'):AddMetadata('Category','Achievements'):SetDescription('Enables completion effects when an Achievement is fully completed.')cvar.Register'srp_triumphpartcompleted':SetDefault(true,true):AddMetadata('Menu','Enable objective completion UI'):AddMetadata('Category','Achievements'):SetDescription('Enables completion effects when an objective is completed.')cvar.Register'srp_triumphparts':SetDefault(true,true):AddMetadata('Menu','Show Achievement objective Progress'):AddMetadata('Category','Achievements'):SetDescription('Enables the UI that displays an Achievement\'s objective progress.')cvar.Register'srp_triumpshowtitle':SetDefault(true,true):AddMetadata('Category','Achievements'):AddMetadata('Menu','Enable Achievement Titles'):SetDescription('Enables displaying titles above players heads.')cvar.Register'srp_triumphtitle':SetDefault(1):AddMetadata('Category','Titles'):AddMetadata('Menu','Title'):SetDescription('A title to display above your head for all to see.'):SetCustomElement('srp_triumphtitle').Validate=function(self,i)return i==0||srp.titles.Get(i)end;cvar.Register'srp_triumphtitle_effect':SetDefault(1):AddMetadata('Category','Titles'):AddMetadata('Menu','Title Effect'):SetDescription('The effect to apply to a title.'):SetCustomElement('srp_triumphtitle_effect').Validate=function(self,i)return i==0||srp.titles.GetEffect(i)end;hook('OnLocalCosmeticsLoaded','srp.cvar.TriumpTitleSync',function()timer.Simple(5,function()net.Start'srp.titles.Sync'net.WriteUInt(cvar.GetValue('srp_triumphtitle'),8)net.WriteUInt(cvar.GetValue('srp_triumphtitle_effect'),8)net.SendToServer()end)end)cvar.Register'media_enable':SetDefault(true,true):AddMetadata('Category','Audio - Media'):AddMetadata('Menu','Enable media players'):SetDescription('Starts or stops media players.')cvar.Register'media_mute_when_unfocused':SetDefault(true,true):AddMetadata('Category','Audio - Media'):AddMetadata('Menu','Mute media players when alt-tabbed'):SetDescription('When the media player is running it will pause and resume when you tab in and out. Saves bandwidth.')cvar.Register'media_quality':SetDefault('medium'):SetType(function()return v=='low'||v=='medium'||v=='high'||v=='veryhigh'end)cvar.Register'srp_media_volume':SetDefault(0.02,true):AddMetadata('Category','Audio - Media'):AddMetadata('Menu','Media player volume'):AddMetadata('Type','number')cvar.Register'srp_radioshowtalking':SetDefault(false,true):AddMetadata('Menu','Enable Talking only mode on UI'):AddMetadata('Category','Radio')cvar.Register'srp_radioshowchannel':SetDefault(true,true):AddMetadata('Category','Radio'):AddMetadata('Menu','Enable Radio Frequency Indicator'):SetDescription('Shows or hides the Radio channel you are currently in on your screen.')cvar.Register'srp_radioeffects':SetDefault(true,true):AddMetadata('Category','Radio'):AddMetadata('Menu','Enable Voice Radio Effects'):SetDescription('The sounds that play when you or someone else starts and stops talking.')cvar.Register'srp_radiomaxviewers':SetDefault(5,true):AddMetadata('Category','Radio'):AddMetadata('Menu','Max radio users to show at once'):AddMetadata('Type','number'):AddMetadata('Min',1):AddMetadata('Max',5):AddMetadata('Value',true):SetDescription('The max amount of radio users that will be displayed before scrolling.')cvar.Register'audio_hurt':SetDefault(true,true):AddMetadata('Category','Audio'):AddMetadata('Menu','Player Hurt Sounds'):SetDescription('Play hurt sounds when players are damaged.')cvar.Register'audio_hurtself':SetDefault(true,true):AddMetadata('Category','Audio'):AddMetadata('Menu','Player Hurt Sounds'):SetDescription('Damage to yourself will play the hurt sounds.')cvar.Register'weapon_audioonly':SetDefault(false,true):AddMetadata('Category','Audio'):AddMetadata('Menu','Enable Weapon Focus mode'):SetDescription('The game will try to only play the sound effects from weapons.')local weapon_volume=cvar.Register'weapon_volume':SetDefault(1,true):AddMetadata('Category','Audio'):AddMetadata('Menu','Weapon Volume'):AddMetadata('Type','number'):SetDescription('Attempt to change all weapon volume levels relatively.'):AddCallback(function(d,e)weapon_volume=e end):GetValue()||1;local weapon_falloff=cvar.Register'weapon_falloff':SetDefault(1,true):AddMetadata('Category','Audio'):AddMetadata('Menu','Weapon Volume Level'):AddMetadata('Type','number'):SetDescription('Attempt to change the falloff volume of weapons.'):AddCallback(function(d,e)weapon_falloff=e end):GetValue()||1;cvar.Register'vehicle_volume':SetDefault(0.5,true):AddMetadata('Category','Audio'):AddMetadata('Menu','Vehicle Volume'):AddMetadata('Type','number')hook('EntityEmitSound','srp.cfg.EntityVolumes',function(n)local o=false;if weapon_volume<1&&n.Channel==CHAN_WEAPON then o=true;n.Volume=n.Volume*weapon_volume end;if weapon_falloff<1&&n.Channel==CHAN_WEAPON then o=true;n.SoundLevel=n.SoundLevel*weapon_falloff end;if o then return true end end)timer.Simple(5,function()if cvar.GetTable()['notification_sound']then cvar.GetTable()['notification_sound']:AddMetadata('Category','Audio')end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/icongenerator_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/controlpanel_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/controlpanel_cl.lua:
local a={}AccessorFunc(a,"m_bInitialized","Initialized")function a:Init()self:SetInitialized(false)end;function a:ClearControls()self:Clear()end;function a:GetEmbeddedPanel()return self end;function a:AddPanel(b)self:AddItem(b,nil)self:InvalidateLayout()end;function a:MatSelect(c,d,e,f,g)local h=vgui.Create("MatSelect",self)Derma_Hook(h.List,"Paint","Paint","Panel")h:SetConVar(c)if e!=nil then h:SetAutoHeight(e)end;if f!=nil then h:SetItemWidth(f)end;if g!=nil then h:SetItemHeight(g)end;if d!=nil then for i,j in pairs(d)do local k=i;if isnumber(k)then k=j end;h:AddMaterial(k,j)end end;self:AddPanel(h)return h end;function a:FillViaTable(l)self:SetInitialized(true)self:SetName(l.Text)if l.ControlPanelBuildFunction then self:FillViaFunction(l.ControlPanelBuildFunction)end end;function a:FillViaFunction(m)m(self)end;function a:ControlValues(n)if n.label then self:SetLabel(n.label)end;if n.closed then self:SetExpanded(false)end end;function a:AddControl(o,n)local n=table.LowerKeyNames(n)local p=o;o=string.lower(o)if o=="header"then if n.description then local q=self:Help(n.description)return q end;return end;if o=="textbox"then local q=self:TextEntry(n.label||"Untitled",n.command)return q end;if o=="label"then local q=self:Help(n.text)return q end;if o=="checkbox"||o=="toggle"then local q=self:CheckBox(n.label||"Untitled",n.command)if n.help then self:ControlHelp(n.label..".help")end;return q end;if o=="slider"then local r=0;if n.type&&string.lower(n.type)=="float"then r=2 end;local q=self:NumSlider(n.label||"Untitled",n.command,n.min||0,n.max||100,r)if n.help then self:ControlHelp(n.label..".help")end;return q end;if o=="propselect"then local q=vgui.Create("PropSelect",self)q:ControlValues(n)self:AddPanel(q)return q end;if o=="matselect"then local q=vgui.Create("MatSelect",self)q:ControlValues(n)self:AddPanel(q)Derma_Hook(q.List,"Paint","Paint","Panel")return q end;if o=="ropematerial"then local q=vgui.Create("RopeMaterial",self)q:SetConVar(n.convar)self:AddPanel(q)return q end;if o=="button"then local q=vgui.Create("DButton",self)if n.command then function q:DoClick()LocalPlayer():ConCommand(n.command)end end;q:SetText(n.label||n.text||"No Label")self:AddPanel(q)return q end;if o=="numpad"then local q=vgui.Create("CtrlNumPad",self)q:SetConVar1(n.command)q:SetConVar2(n.command2)q:SetLabel1(n.label)q:SetLabel2(n.label2)self:AddPanel(q)return q end;if o=="color"then local q=vgui.Create("CtrlColor",self)q:SetLabel(n.label)q:SetConVarR(n.red)q:SetConVarG(n.green)q:SetConVarB(n.blue)q:SetConVarA(n.alpha)self:AddPanel(q)return q end;if o=="combobox"then if tostring(n.menubutton)=="1"then local q=vgui.Create("ControlPresets",self)q:SetPreset(n.folder)if n.options then for i,j in pairs(n.options)do q:AddOption(i,j)end end;if n.cvars then for i,j in pairs(n.cvars)do q:AddConVar(j)end end;self:AddPanel(q)return q end;o="listbox"end;if o=="listbox"then if n.height then local q=vgui.Create("DListView")q:SetMultiSelect(false)q:AddColumn(n.label||"unknown")if n.options then for i,j in pairs(n.options)do local s=q:AddLine(i)s.data=j;for i,j in pairs(s.data)do if GetConVarString(i)==j then s:SetSelected(true)end end end end;q:SetTall(n.height)q:SortByColumn(1,false)function q:OnRowSelected(t,u)for i,j in pairs(u.data)do RunConsoleCommand(i,j)end end;self:AddItem(q)return q else local q=vgui.Create("CtrlListBox",self)if n.options then for i,j in pairs(n.options)do q:AddOption(i,j)end end;local v=vgui.Create("DLabel",self)v:SetText(n.label)v:SetDark(true)q:SetHeight(25)q:Dock(TOP)self:AddItem(v,q)return q end end;if o=="materialgallery"then local q=vgui.Create("MatSelect",self)q:SetItemWidth(n.width||32)q:SetItemHeight(n.height||32)q:SetNumRows(n.rows||4)q:SetConVar(n.convar||nil)Derma_Hook(q.List,"Paint","Paint","Panel")for w,x in pairs(n.options)do local y=x.material;local z=x.value;x.material=nil;x.value=nil;q:AddMaterialEx(w,y,z,x)end;self:AddPanel(q)return q end;local q=vgui.Create(p,self)if!q then q=vgui.Create(o,self)end;if q then if q.ControlValues then q:ControlValues(n)end;self:AddPanel(q)return q end;MsgN("UNHANDLED CONTROL: ",o)PrintTable(n)MsgN("\n\n")end;vgui.Register("ControlPanel",a,"DForm")
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/content_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contentcontainer_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contentsidebar_cl.lua:
local a={}function a:Init()self.Tree=vgui.Create("DTree",self)self.Tree:SetClickOnDragHover(true)self.Tree.OnNodeSelected=function(b,c)hook.Call("ContentSidebarSelection",GAMEMODE,self:GetParent(),c)end;self.Tree:Dock(FILL)self.Tree:SetBackgroundColor(Color(240,240,240,255))self:SetPaintBackground(false)end;function a:EnableSearch(d,e)self.Search=vgui.Create('DContentSearch',self)self.Search:SetSearchType(d,e||"PopulateContent")end;function a:EnableModify()self:EnableSearch()self:CreateSaveNotification()self.Toolbox=vgui.Create("ContentSidebarToolbox",self)hook.Add("OpenToolbox","OpenToolbox",function()if!IsValid(self.Toolbox)then return end;self.Toolbox:Open()end)end;function a:CreateSaveNotification()local f=vgui.Create("Panel",self)f:Dock(TOP)f:SetVisible(false)f:DockMargin(8,1,8,4)local g=vgui.Create("DButton",f)g:Dock(FILL)g:SetIcon("icon16/disk.png")g:SetText("#spawnmenu.savechanges")g.DoClick=function()f:SlideUp(0.2)hook.Run("OnSaveSpawnlist")end;local h=vgui.Create("DButton",f)h:Dock(RIGHT)h:SetIcon("icon16/arrow_rotate_clockwise.png")h:SetText("")h:SetTooltip("#spawnmenu.revert_tooptip")h:SetWide(26)h:DockMargin(4,0,0,0)h.DoClick=function()f:SlideUp(0.2)hook.Run("OnRevertSpawnlist")end;hook.Add("SpawnlistContentChanged","ShowSaveButton",function()if f:IsVisible()then return end;f:SlideDown(0.2)end)end;vgui.Register("ContentSidebar",a,"DPanel")
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contenttypes/vehicles_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/checkbox_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/itemselector_ui.lua:
local a={}local b=Color(50,50,50,150)local c=Color(5,5,5,150)local d=128;function a:Init()self:SetTall(80)self:SetBackgroundColor(col.white_dark)self.panelid='srp_itemselector_item'self:AddPanel('srp_itemselector_item',function(e)e:SetBackgroundColor(b)e:SetHoverColor(c)e:Dock(FILL)e:SetText'Select an Item'e:LeftClick(function()self:DisplayItems()end)self.SelectionButton=e end)self:SetTall(d+20)hook('VGUIMousePressed',self,self.OnVGUIMousePressed)end;function a:SetTextColor(col)self.SelectionButton:SetTextColor(col)end;function a:SetText(f)self.SelectionButton:SetText(f)end;function a:OnVGUIMousePressed(g,h)if!IsValid(self.InventoryList)then return end;if!self.InventoryList:IsOurChild(g)||g!=self.InventoryList then self.InventoryList:Remove()end end;function a:SetItemPanel(i)self.panelid=i end;function a:OnSelected(j)self._OnSelected=j end;function a:_OnSelected()end;function a:OnFilterItem(j)self._OnFilterItem=j;if IsValid(self.InventoryList)then self.InventoryList._OnFilterItem=j end end;function a:_OnFilterItem(k)return true end;function a:OnSelectItems(j)self._OnSelectItems=j end;function a:DisplayItems()if IsValid(self.InventoryList)then self.InventoryList:Remove()return end;srp.ui.Create('srp_itemselector_list',function(g)g:SetSize(420,80)g:SetItemPanel(self.panelid)g:OnSelectItems(self._OnSelectItems)g:OnFilterItem(self._OnFilterItem)g:Populate(self)self.InventoryList=g end)self:InvalidateLayout(true)end;function a:SetItem(k,l)self.SelectionButton:SetItem(k)self.SelectionButton:SetText(k.shortname||k.name)self:_OnSelected(k,l)end;function a:SetDisabled(m,n)self.SelectionButton:SetDisabled(m,n)end;function a:PerformLayout(o,p)if IsValid(self.InventoryList)then local q,r=self:GetParent():LocalToScreen(self:GetPos())self.InventoryList:SetPos(q+o/2-self.InventoryList:GetWide()/2,r+p)end end;function a:OnRemove()hook.Remove('VGUIMousePressed',self)if IsValid(self.InventoryList)then self.InventoryList:Remove()end end;function a:Paint()end;vgui.Register('srp_itemselector',a,'srp_panel')local a={}function a:Init()self:SetBackgroundColor(col.white_dark)self:SetBorderColor(col.grey_light)self:DockPadding(5,5,5,5)self:SetTall(80)self:MakePopup()self:AddPanel('ui_scrollpanel',function(s)s:Dock(FILL)srp.ui.Create('srp_grid',function(t)s:AddItem(t)t:Dock(TOP)t:SetAutoHeight(true)self.grid=t end)end)hook('VGUIMousePressed',self,self.OnVGUIMousePressed)end;function a:SetItemPanel(i)self.panelid=i end;function a:OnFilterItem(j)self._OnFilterItem=j end;function a:_OnFilterItem(k)return true end;function a:OnGetItems(j)self._OnGetItems=j;return self end;function a:_OnGetItems()end;function a:OnVGUIMousePressed(g,h)if!self:IsOurChild(g)||g!=self then self:Remove()end end;function a:OnSelectItems(j)self._OnSelectItems=j end;function a:AddItems(u,v)if!v||#v==0 then return end;local w=0;for x,k in pairs(v)do if!self:_OnFilterItem(k)then continue end;srp.ui.Create(self.panelid,function(g)g:SetSize(64,64)g:Populate(u,k)self.grid:AddItem(g)end)w=w+1 end;return w end;function a:Populate(u)local w=0;if self._OnSelectItems then w=self:AddItems(u,self:_OnSelectItems())||0 end;self:SetTall(math.max(76,10+64*w/6+4*w/6))self:InvalidateLayout(true)if w==0 then self:Remove()end end;function a:OnRemove()hook.Remove('VGUIMousePressed',self)end;vgui.Register('srp_itemselector_list',a,'srp_panel')local a={}function a:Init()self:DockMargin(0,0,0,0)self:DockPadding(0,0,0,0)self:Clear()self:AddPanel('DImage',function(y)y:Dock(FILL)y:SetMouseInputEnabled(false)y:SetKeyboardInputEnabled(false)y:DockMargin(12,12,12,12)y:SetBackgroundColor(col.transparent)self.icon=y end)self:AddPanel('srp_label',function(z)z:SetText'0'z:SetFont'ui_label.rb'z:SetContentAlignment(5)z:SetMouseInputEnabled(false)z:SetKeyboardInputEnabled(false)z:SetTextColor(col.grey_dark)z:SetDragParent(self)self.label=z end)self:LeftClick(function()if self.selector&&self.item then self.selector:SetItem(self.item)end end)end;function a:Populate(u,k)self.selector=u;self:SetItem(k)end;function a:SetItem(k)self.item=k;self.icon:SetMaterial(k.icon)self.icon:SetImageColor(k.color||col.white)end;function a:SetText(f)self.label:SetText(f)end;function a:SetTextColor(col)self.label:SetTextColor(col)end;function a:CreateTooltip()if!self.item then return end;srp.ui.Create('srp_tooltip',function(A)local B,C=self:LocalToScreen(self:GetWide()/2,self:GetTall()/2+10)A.parent=self;A:SetPos(B,C)A:MakePopup(true)A:MoveToFront(true)A:SetBackgroundColor(col.white_dark)A:SetText(self.item.name||'')self.tooltip=A end)end;function a:Think()local D=self:IsHovered()if D&&!IsValid(self.tooltip)&&self.item then self:CreateTooltip()end end;function a:PerformLayout(o,p)if IsValid(self.label)then self.label:SetWide(o)self.label:SetPos(0,p-18)end end;local b=Color(50,50,50,50)local E=Color(255,255,255,50)function a:Paint(o,p)draw.RoundedBox(6,0,0,o,p,b)if self:IsHovered()then draw.RoundedBox(6,0,0,o,p,E)end;if self.outline then surface.SetDrawColor(50,50,50,200)surface.DrawRect(0,0,o,p)end end;vgui.Register('srp_itemselector_item',a,'srp_button')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/labels_ui.lua:
local a={}DEFINE_BASECLASS'DLabel'function a:Init()self:SetFont'ui_label.r'self:SetTextColor(col.white)self:DockMargin(5,1,5,1)end;function a:PaintLabel(b,c)derma.SkinHook('Paint','RoundedPanel',self,b,c)end;function a:SetBackgroundColor(col)self.m_bgColor=col;self.Paint=self.PaintLabel;return self end;function a:DockMargin(d,e,f,g)BaseClass.DockMargin(self,d,e,f,g)return self end;function a:DockPadding(d,e,f,g)BaseClass.DockPadding(self,d,e,f,g)return self end;function a:SetWide(h)BaseClass.SetWide(self,h)return self end;function a:SetPos(i,j)BaseClass.SetPos(self,i,j)return self end;function a:SetFont(k)BaseClass.SetFont(self,k)return self end;function a:SetText(e,l)if l==true then e=utf8.char(e)end;BaseClass.SetText(self,e)return self end;function a:SetTextColor(m)BaseClass.SetTextColor(self,m)return self end;function a:SizeToContents(n)BaseClass.SizeToContents(self,n)return self end;function a:SizeToContentsX(n)BaseClass.SizeToContentsX(self,n)return self end;function a:SizeToContentsY(n)BaseClass.SizeToContentsY(self,n)return self end;function a:SetContentAlignment(h)BaseClass.SetContentAlignment(self,h)return self end;function a:SetWrap(g)BaseClass.SetWrap(self,g)return self end;function a:SetAutoStretchVertical(g)BaseClass.SetWrap(self,g)return self end;function a:Dock(e)BaseClass.Dock(self,e)return self end;function a:Finish()return self:GetParent()end;vgui.Register('srp_label',a,'DLabel')local a={}function a:Init()self.text=''self.font='ui_label.r'self.mx=64 end;function a:SetFont(k)self.font=k end;function a:GetFont()return self.font end;function a:SetText(o)surface.SetFont(self.font)self.width,self.height=surface.GetTextSize(o)self.text=o end;function a:GetText()return self.text end;function a:SetSpeed()end;function a:SetContentAlignment()end;function a:Paint(b,c)if!self.text||!self.width then return end;derma.SkinHook('Paint','RoundedPanel',self,b,c)self.mx=self.mx<-self.width-10&&b+10||self.mx-100*FrameTime()surface.SetTextColor(255,255,255,255)surface.SetFont(self:GetFont())surface.SetTextPos(self.mx,(c-self.height)*.5)surface.DrawText(self.text)end;vgui.Register('srp_label_scroll',a,'srp_panel')local a={}function a:SetIcon(p,l,q)if!IsValid(self.icon)then srp.ui.Create('srp_label',function(r)r:SetParent(self)r:DockPadding(0,0,0,0)r:DockMargin(0,0,0,0)r:SetFont'SSRPForkAwesome'r:SetText(p,l)r:Dock(q||LEFT)r:SetContentAlignment(5)r:SetWide(15)self:SetTextInset(23,0)self.icon=r end)else self.icon:SetText(p,l)end end;function a:SetIconColor(col)self.icon:SetTextColor(col)end;function a:IconDockMargin(s,g,m,t)self.icon:DockMargin(s,g,m,t)end;function a:SetIconWidth(u)self.icon:SetWide(u)self:SetTextInset(u+8,0)end;vgui.Register('srp_labelawesome',a,'srp_label')vgui.Register("srp_header",{Init=function(self)self:SetFont'ui_header.l'self:SetTall(30)self:DockMargin(5,15,5,5)end},"srp_label")vgui.Register("srp_subheader",{Init=function(self)self:SetFont'ui_header.r'self:DockMargin(5,5,5,2)end},"srp_label")vgui.Register("srp_label_small",{Init=function(self)self:SetFont'ui_label.s'end},"srp_label")
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/listselect_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/modelexplorer_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/modelexplorer_ui.lua:
local a={}local b=Color(240,240,240,255)function a:Init()self:SetTitle'Model Explorer'self:SetBackgroundColor(col.white_dark)self:SetSize(900,700)self:Center()self:MakePopup()self:AddPanel('srp_textinput',function(c)c:SetText'Search From Path'c:DockMargin(2,10,2,10)c:SetTextColor(col.grey_dark)c:Dock(TOP)c:SetBackgroundColor(b)c:OnChanged(function(d,e)if!string.StartsWith(e,'models/')then return end;timer.Create('srp.modelsearch',0.8,1,function()self:ExporePath(e)end)end)end)self:AddPanel('DTree',function(f)f:SetClickOnDragHover()f:Dock(LEFT)f:SetWide(300)f:SetBackgroundColor(b)f:SetSkin('Default')local g=f:AddNode'models'g:SetSkin('')g:SetExpanded(true)g:SetBackgroundColor(col.transparent)f.OnNodeSelected=function(f,g)print(self,g:GetText())end;self.Node=g;self.Tree=f end)self:AddPanel('ui_scrollpanel',function(h)h:Dock(FILL)srp.ui.Create('srp_grid',function(i)i:Dock(FILL)i:SetSpacing(8,10,false)i:SetAutoHeight(true)h:AddItem(i)self.Grid=i end)end)end;function a:ExporePath(j)self.Grid:Clear()self:DisplayPath(j,0)self.Node:SetText(j)end;function a:DisplayPath(k,l)k=k[#k]=='/'&&k||k..'/'local m,n=file.Find(k..'*','GAME')if n&&l==0 then for o,p in pairs(n)do self:DisplayPath(k..p,l+1)end end;if m then for o,q in pairs(m)do if q:EndsWith('.mdl')then self:DisplayModel(k..q)local g=self.Node:AddNode(q,'icon16/brick.png')g.Path=k..q end end end end;function a:DisplayModel(j)srp.ui.Create('srp_button_rounded',function(r)r:SetText''r:SetSize(128,128)r:SetBackgroundColor(b)r:SetHoverColor(col.white)r:DockPadding(4,4,4,4)r:LeftClick(function()SetClipboardText(j)srp.notif.Neutral(3,j)end)r:AddPanel('srp_modelpanel',function(s)s:SetMouseInputEnabled(false)s:TryCenter(s:AddModel(j))s:Dock(FILL)end)self.Grid:AddItem(r)end)end;vgui.Register('srp_modelexplorer',a,'srp_window')concommand.Add('modelexpl',function(t,u,v,w)srp.ui.Create('srp_modelexplorer',function(r)r:ExporePath('models/workshop/player/items/demo')end)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/search_ui.lua:
local a={}local b='ssrp/'..info.WebID..'/charactersearch/'function a:Init()self:DockMargin(2,2,2,2)self:OnChanged(function(c,d,e)self:Search(d,e)end)srp.ui.Create('srp_searchlist',function(f)f.textinput=self;f:OnSelected(function(c,g)self.Value=g;self:_OnSelected(g)end)self.searchlist=f end)end;function a:SetMinSearchWidth(h)self.minlistwidth=h;return self end;function a:SetMaxSearchWidth(h)self.maxlistwidth=h;return self end;function a:PerformLayout(h,i)if IsValid(self.searchlist)then self.searchlist:SetWide(math.Clamp(h*.3,self.minlistwidth||150,self.maxlistwidth||600))local j,k=self:GetParent():LocalToScreen(self:GetPos())self.searchlist:SetPos(j,k+i+4)end end;function a:GetResults(l)ba.http.FetchJson(self.SearchURL..l,function(m)if IsValid(self)then self:Results(m)end end,function(n)if IsValid(self)then self:Error(n||'Search failed',true)end end)end;function a:CloseSearchList()end;function a:Search(o,e)if!e||#o<3 then self:CloseSearchList()return end;timer.Create('srp.searchui',0.2,1,function()if IsValid(self)then self:GetResults(o)end end)end;function a:Results(p)local q=self:_OnFilterResults(p)self.searchlist:DisplayList(q)end;function a:Error(r)end;function a:SetPlayerSearch()self.SearchURL=b;return self end;function a:SetSearchURL(s)self.SearchURL=s;return self end;function a:OnFilterResults(t)self._OnFilterResults=t;return self end;function a:_OnFilterResults(u)return u end;function a:OnResults(t)self._OnResults=t;return self end;function a:_OnResults(u)end;function a:OnSelected(t)self._OnSelected=t;return self end;function a:_OnSelected(u)end;function a:GetValue()return self.Value end;function a:OnRemove()if IsValid(self.searchlist)then self.searchlist:Remove()end end;vgui.Register('srp_search',a,'srp_textinput')vgui.Register('srp_search_rounded',a,'srp_textinput_rounded')local a={}function a:Init()self:SetBackgroundColor(col.transparent)self:DockPadding(0,0,0,0)self:SetTall(40)self:SetVisible(false)self:MakePopup()self:SetKeyboardInputEnabled(false)self.fields={}end;function a:DisplayList(v)local w={}for x=1,#v do local y=v[x]local z=y.id||y.name||x;if IsValid(self.fields[z])then w[z]=self.fields[z]continue end;self:AddPanel('srp_searchlist_item',function(f)f.searchid=z;f.data=y;f:Dock(TOP)f:SetTall(40)f:Populate(y)f:LeftClick(function(c)self:_OnSelected(c.data)end)w[z]=f end)end;for z,f in pairs(self.fields)do if IsValid(f)&&!w[z]then f:Remove()end end;local A=table.Count(w)self:SetTall(A*40+A*2+6)self:SetVisible(true)self.fields=w;hook('VGUIMousePressed',self,self.OnVGUIMousePressed)self:MoveToFront()end;function a:OnSelected(t)self._OnSelected=t;return self end;function a:_OnSelected(u)end;function a:OnVGUIMousePressed(f,B)if!self:IsOurChild(f)||f!=self then self:SetVisible(false)end end;function a:OnRemove()hook.Remove('VGUIMousePressed',self)end;vgui.Register('srp_searchlist',a,'srp_panel_rounded')local a={}function a:Init()self:DockPadding(4,4,4,4)self:DockMargin(0,0,0,2)self:SetBackgroundColor(col.white_dark)self:SetHoverColor(col.white)self:SetBorderColor(col.grey_light)self:SetTextColor(col.black)self:SetContentAlignment(4)self:SetFont'ui_label.r'self.lbl:DockMargin(0,0,0,10)self.tag=''self.ctid=''self:AddPanel('ui_imagebutton',function(C)C:SetSkin'SUP'C:Dock(LEFT)C:SetWide(32)C:DockMargin(0,0,10,0)self.avatar=C end)self:SetAlpha(0)self:AlphaTo(255,.2,0)end;function a:Populate(D)self:SetText(D.name||D.id)self.avatar:SetSteamID64(util.SteamIDTo64(D.steamid),64)self.ctid='#'..D.characterid;if D.tag then self.tag=D.tag elseif D.updated then self.tag=string.NiceTime(os.time()-D.updated)..' ago'end end;function a:PaintOver(h,i)if self.tag then draw.SimpleText(self.tag,'ui_label.s',h-10,i/2,col.grey_light,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)draw.SimpleText(self.ctid,'ui_label.s',45,i/2+6,col.grey_light,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)end end;vgui.Register('srp_searchlist_item',a,'srp_button')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/simplelist_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/textinput_ui.lua:
local a={}function a:Init()self:Dock(FILL)self:SetFont'ui_label.r'self:DockMargin(0,0,0,0)self:SetAllowNonAsciiCharacters(true)self:SetTextColor(col.white)self:SetCursorColor(col.white)self:SetHighlightColor(col.black)end;function a:SetErrorPosition(b,c,d)self.errorX=b;self.errorY=c;self.errorAlign=d end;function a:SetBackgroundColor(col)self.m_bgColor=col end;function a:SetBorderColor(col)self.outline=true;self.m_bdrColor=col end;function a:GetBorderColor()return self.m_bdrColor end;function a:AddParentButton(e)self.activatebutton=e;return self end;function a:SetValidation(f,g)if!isstring(f)then return end;self.pattern=f;self.prettypattern=g;return self end;function a:SetMaxLength(h)self.max_len=h;return self end;function a:SetMinLength(i)self.min_len=i;return self end;function a:GetMaxLength()return self.max_len end;function a:GetMinLength()return self.min_len end;function a:SetMinMax(i,j)self:SetMinLength(i)self:SetMaxLength(j)return self end;function a:SetValue(k)self:SetText(k)return self end;function a:GetValue()return self:GetText()end;function a:TooLong()if self.number_validation&&tonumber(self:GetText())then return tonumber(self:GetText())>(self.max_len||1024)else return self:GetText():len()>(self.max_len||1024)end end;function a:TooShort()if self.number_validation&&tonumber(self:GetText())then return tonumber(self:GetText())<(self.min_len||0)else return self:GetText():len()<(self.min_len||0)end end;function a:SetNumberInput()self:SetValidation'%d+'self.number_validation=true;return self end;function a:ResolveValidation()if self:TooLong()||self:TooShort()then if self.number_validation then self.errorText=self:TooLong()&&Format('Too many',self.max_len||1024)||Format('Too little',self.min_len||0)else self.errorText=self:TooLong()&&Format('Maximum of %i characters required',self.max_len||1024)||Format('Minimum of %i characters required',self.min_len||0)end;return false else self.errorText=nil end;if!self.pattern then return true end;local l=string.match(self:GetText()||'',self.pattern)if l then self.errorText=nil else self.errorText='Format Required: '..(self.prettypattern||self.pattern)return false end;if self.CustomValidation then local m,n=self:CustomValidation(self:GetValue())self.errorText=n;return m end;return true end;function a:OnCustomValidation(o)self.CustomValidation=o;return self end;function a:RemoveValidation()self.pattern=nil;return self end;function a:OnKeyCode(p)if p==KEY_ENTER then if IsValid(self.activatebutton)then self.activatebutton.DoClick(self.activatebutton)end end end;function a:OnTextChanged()local q=self:ResolveValidation()self:_OnTextChanged(self:GetValue(),q)if q then if self._OnValid then self:_OnValid()end elseif self._OnInvalid then self:_OnInvalid()end end;function a:_OnTextChanged(r)end;function a:OnChanged(o)self._OnTextChanged=o;return self end;function a:IsValueValid()return self:ResolveValidation()end;function a:OnValid(s)self._OnValid=s;return self end;function a:OnInvalid(s)self._OnInvalid=s;return self end;function a:Paint(t,u)derma.SkinHook('Paint','TextInput',self,t,u)return false end;function a:PaintRounded()self.Paint=function(v,t,u)derma.SkinHook('Paint','TextInputRounded',v,t,u)return false end end;function a:PaintOver(t,u)derma.SkinHook('Paint','TextInputOver',self,t,u)end;vgui.Register('srp_internaltext',a,'DTextEntry')local a={}function a:Init()self:SetTall(30)self:DockMargin(5,2,5,2)self:DockPadding(0,0,0,0)self:SetBackgroundColor(col.transparent)self:CreateDropdown()end;function a:CreateDropdown()self:AddPanel('srp_internaltext',function(r)self.OnValid=function(w,x)r:OnValid(x)end;self.OnInvalid=function(w,x)r:OnInvalid(x)end;self.OnChanged=function(w,x)r:OnChanged(x)end;self.OnTextChanged=function(w)r:OnTextChanged()end;self.GetCaretPos=function(w)return r:GetCaretPos()end;self.SetCaretPos=function(w,y)r:SetCaretPos(y)end;self.IsValueValid=function()return r:IsValueValid()end;self.RemoveValidation=function(w)r:RemoveValidation()end;self.SetMinLength=function(w,x)r:SetMinLength(x)end;self.SetMaxLength=function(w,x)r:SetMaxLength(x)end;self.SetValidation=function(w,x,z)r:SetValidation(x,z)end;self.AddParentButton=function(w,x)r:AddParentButton(x)end;self.SetValue=function(w,x)r:SetValue(x)end;self.SetBackgroundColor=function(w,x)r:SetBackgroundColor(x)end;self.SetBorderColor=function(w,x)r:SetBorderColor(x)end;self.SetAllowNonAsciiCharacters=function(w,x)r:SetAllowNonAsciiCharacters(x)end;self.SetMinMax=function(w,x,z)r:SetMinMax(x,z)end;self.SetText=function(w,x)r:SetText(x)end;self.SetFont=function(w,x)r:SetFont(x)end;self.SetMultiline=function(w,x)r:SetMultiline(x)end;self.GetText=function()return r:GetText()end;self.GetValue=function()return r:GetValue()end;self.SetTextColor=function(w,x)r:SetTextColor(x)end;self.SetCursorColor=function(w,x)r:SetCursorColor(x)end;self.SetHighlightColor=function(w,x)r:SetHighlightColor(x)end;self.GetMinLength=function()return r:GetMinLength()end;self.GetMaxLength=function()return r:GetMaxLength()end;self.GetMinMax=function()return r:GetMinMax()end;self.OnCustomValidation=function(w,x)r:OnCustomValidation(x)end;self.SetErrorPosition=function(w,b,c,d)r:SetErrorPosition(b,c,d)end;self.PaintRounded=function(w)r:PaintRounded()end;self.RequestFocus=function()return r:RequestFocus()end;self.OnMousePressed=function(w,p)return r:OnMousePressed(p)end;self.SetDisabled=function(w,x)r:SetDisabled(x)if IsValid(self.left)then self.left:SetDisabled(x)end;if IsValid(self.right)then self.right:SetDisabled(x)end end;self.SetNumberInput=function(w,x,A,B)r:SetNumberInput(x)self:DisplayWangs(A,B)end;self.SetNumeric=function(w,C,A)return r:SetNumeric(C)end;self.GetNumeric=function()return r:GetNumeric()end;self.SetPlaceholderText=function(w,x)r:SetPlaceholderText(x)end;self.SetPlaceholderColor=function(w,x)r:SetPlaceholderColor(x)end;self.txt=r end)end;function a:DisplayWangs(D,B)if!D then if IsValid(self.left)then self.left:Remove()end;if IsValid(self.right)then self.right:Remove()end;return end;self.stepamount=B||1;self:AddPanel('srp_button_rounded',function(E)E:Dock(LEFT)E:SetWide(30)E:SetFont'SSRPForkAwesome'E:SetText(0xf104,true)E:DockMargin(0,0,2,0)E:LeftClick(function()local F=tonumber(self:GetValue())if!F then return end;local B=math.max(self.txt.min_len||0,F-B)self:SetValue(B)self.txt:SetCaretPos(5)self.txt:OnTextChanged()end)self.left=E end)self:AddPanel('srp_button_rounded',function(E)E:Dock(RIGHT)E:SetWide(30)E:SetFont'SSRPForkAwesome'E:SetText(0xf105,true)E:DockMargin(2,0,0,0)E:LeftClick(function()local F=tonumber(self:GetValue())if!F then return end;local B=math.min(self.txt.max_len||1024,F+B)self:SetValue(B)self.txt:SetCaretPos(5)self.txt:OnTextChanged()end)self.right=E end)end;vgui.Register('srp_textinput',a,'srp_panel')vgui.Register('srp_textinput_rounded',{Init=function(self)self:PaintRounded()end},'srp_textinput')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/window_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/battlepass_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/ui/battlepasspreviews_ui.lua:
local a={}local b=Color(147,158,190)local c=Color(196,203,225)function a:Init()self:SetTall(64)self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,20)self:SetBackgroundColor(col.transparent)self:SetVisible(false)self:AddPanel('srp_panel',function(d)d:SetBackgroundColor(col.transparent)d:SetPos(0,0)d:SetTall(64)d:DockPadding(0,0,0,0)self.Container=d end)end;function a:Populate(e)self:AlphaTo(0,.05,0,function()if IsValid(self)then self.Container:Clear()self:DisplayItems(e)if#e>1 then self:AlphaTo(255,.05,0)end end end)end;function a:DisplayItems(e)for f,g in ipairs(e)do local h=srp.battlepass.GetUnlockType(g[1])self.Container:AddPanel('srp_button_rounded',function(i)i:Dock(LEFT)i:SetSize(64,64)i:SetBackgroundColor(b)i:SetHoverColor(c)i:DockMargin(2,0,0,0)i:DockPadding(12,12,12,12)i:SetText''i:LeftClick(function(j)self:_OnLevelSubItemSelected(g)end)if h then local k=h:GetModel(unpack(g,2))local l=h:GetIcon(unpack(g,2))if k then self.Container:AddPanel('srp_modelpanel',function(m)m:Dock(FILL)m:SetMouseInputEnabled(false)m:TryCenter(m:AddModel(k))end)elseif l then i:AddPanel('DImage',function(n)n:DockMargin(0,0,0,0)n:Dock(FILL)n:SetMaterial(l)n:SetMouseInputEnabled(false)end)end end end)end;self:InvalidateLayout(true)end;function a:PerformLayout(o,p)self.Container:SetWide(#self.Container:GetChildren()*64+#self.Container:GetChildren()*4)self.Container:Center()end;function a:OnLevelSubItemSelected(q)self._OnLevelSubItemSelected=q end;function a:_OnLevelSubItemSelected(g)end;vgui.Register('srp_battlepasspreviews',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buffs/buffs_sh.lua:
srp.buffs=srp.buffs||{}local a={}local b={}function srp.buffs.AddDefinition(c,d,e,f,g,h,i)local j={id=c,name=d,icon=e,description=f,duration=g,color=h,fill=i}j.internal=table.insert(b,j)a[c]=j end;function srp.buffs.AddDefinitionEx(c,j)j.id=c;j.internal=table.insert(b,j)a[c]=j end;function srp.buffs.GetDefinition(c,k)return k&&b[c]||a[c]end;function srp.buffs.Add(l,c,g,k)local m=srp.buffs.GetDefinition(c,k)if!m then return end;local n=l.buffs&&l.buffs[m.id]g=g||m.duration;l.buffs=l.buffs||{}l.buffs[m.id]={id=m.id,duration=g,endtime=g&&g+CurTime()}if m.OnAdded then m:OnAdded(l,g)end;if g then timer.Create('srp.buff_'..l:SteamID()..'_'..m.id,g-1.5,1,function()if IsValid(l)then srp.buffs.Remove(l,c,k)end end)end;if!n then hook.Run('OnBuffAdded',l,m,l.buffs[m.id],g)else hook.Run('OnBuffUdpated',l,m,l.buffs[m.id],g)end end;function srp.buffs.HasBuff(l,c)return l.buffs&&l.buffs[c]&&(!l.buffs.endtime||l.buffs.endtime>CurTime())end;function srp.buffs.Remove(l,c,k)if!l.buffs then return end;local m=srp.buffs.GetDefinition(c,k)if!m then return end;if!l.buffs[m.id]then return end;if m.OnRemoved then m:OnAdded(l)end;l.buffs[m.id]=nil;hook.Run('OnBuffRemoved',l,m)end;function PLAYER:HasBuff(c)return self.buffs.HasBuff(self,c)end;function PLAYER:AddBuff(c,g,k)srp.buffs.AddBuff(self,c,g,k)end;function PLAYER:RemoveBuff(c,k)srp.buffs.Remove(self,c,k)end;srp.buffs.AddDefinition('stunned','Stunned',Material'materials/galactic/ui/shield.png','You are stunned for %i seconds!')srp.buffs.AddDefinition('shield','Shield Aura',Material'materials/hud/missile_reticle.png','A shield is buffing you!')srp.buffs.AddDefinition('grenade','Grenade',Material'materials/galactic/ui/grenade.png','Next grenade throw',nil,col.blue)srp.buffs.AddDefinition('stimkit_l','Stim Heal',Material'materials/galactic/ui/health.png','Next stim ready',nil,col.red)srp.buffs.AddDefinition('stimkit_r','Self Heal',Material'materials/galactic/ui/health.png','Next stim ready',nil,col.orange)srp.buffs.AddDefinition('critchance','Crit Chance',Material'materials/galactic/ui/talents/headshot.png','You\'re regenerating HP!')srp.buffs.AddDefinition('health','Health Aura',Material'materials/galactic/ui/health.png','You\'re regenerating HP!')srp.buffs.AddDefinition('armor','Blast Protection',Material'materials/galactic/ui/scoreboard/staff.png','You\'re regenerating AP!')srp.buffs.AddDefinition('explosion','Blast Protection',Material'materials/galactic/ui/blast.png','You have blast protection!')srp.buffs.AddDefinition('rc','RC Aura',Material'materials/galactic/ui/talents/buff.png','Increased attack damage and runspeed!')srp.buffs.AddDefinition('forceleap','Leap',Material'materials/wos_edit/forceicons/leap.png','Cooldown until next leap',nil,col.grey_dark,true)srp.buffs.AddDefinition('forcepush','Push',Material'materials/wos_edit/forceicons/push.png','Cooldown until next push',nil,col.grey_dark,true)srp.buffs.AddDefinition('forcepull','Pull',Material'materials/wos_edit/forceicons/pull.png','Cooldown until next pull',nil,col.grey_dark,true)srp.buffs.AddDefinition('forcerevive','Revive',Material'materials/wos_edit/forceicons/heal.png','Cooldown until next revive',nil,col.grey_dark,true)srp.buffs.AddDefinition('forcechoke','Choke',Material'materials/wos_edit/forceicons/rage.png','Cooldown until next pull',nil,col.grey_dark,true)srp.buffs.AddDefinition('forcethrow','Throw',Material'materials/wos_edit/forceicons/throw.png','Cooldown until next pull',nil,col.grey_dark,true)srp.buffs.AddDefinition('safezone','Safe zone',Material'materials/galactic/ui/defensive.png','Safezone',nil,col.pink,true)srp.buffs.AddDefinition('jetpackmissile','Missiles',Material'materials/galactic/ui/talents/jetpack.png','Cooldown until next missile',nil,col.red,true)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buffs/ui/buffbox_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/building/building_sh.lua:
srp.build=srp.build||{}srp.build.data={}local a=Vector(0,0,-400)local b={rp_building=true}function srp.build.Add(c,d)if!d.name||!d.model then return end;d.id=c;d.CanPlace=d.CanPlace||function()return true end;d.offset=d.offset||Vector()d.overlapoffset=d.overlapoffset||Vector()srp.build.data[c]=d;return d end;function srp.build.Get(c)return srp.build.data[c]end;function srp.build.GetTransform(e,f)if CLIENT then e=LocalPlayer()end;local g=util.TraceLine({start=e:EyePos(),endpos=e:EyePos()+e:GetAimVector()*125,filter=e})if!g then return end;g=util.TraceLine({start=g.HitPos,endpos=g.HitPos+a,filter=e})if!g then return end;if!IsValid(g.Entity)||g.Entity:IsPlayer()then return g.HitWorld,g.HitPos,g.HitNormal end;local h=g.Entity;local i=h.GetBuildingData&&h:GetBuildingData()||{}if IsValid(g.Entity)&&(i.overlap||!b[g.Entity:GetClass()])&&(CLIENT||g.Entity.GetPropOwner&&IsValid(g.Entity:GetPropOwner()))then return true,g.HitPos,g.HitNormal,i end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buybacks/buyback_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/charactercreate_ui.lua:
local a=Material('galactic/sup_logo.png','smooth')local b={Paint=function()end}function b:Init()self.pages={}self:SetAlpha(0)self:Dock(FILL)self:DockPadding(0,50,0,50)self:AddPage(srp.ui.Create('srp_charactercreation_allegiances'))self:AddPage(srp.ui.Create('srp_charactercreation_presets'))self:AddPage(srp.ui.Create('srp_charactercreation_info'))self:Select(1)end;function b:AddPage(c)local d=table.insert(self.pages,c)c.pageid=d;c:SetParent(self)c:Dock(FILL)c:Populate(self)return d end;function b:Select(d,...)if self.lastselected&&self.lastselected==d then return end;for e,c in pairs(self.pages)do if IsValid(c)&&c.Display then if e==d then self.selectedPanel=c;c:Display(true,...)elseif c:IsVisible()then c:Display(false)end;c:InvalidateLayout(true)end end;self.lastselected=d end;function b:NextPage(...)self:Select((self.lastselected||0)+1,...)end;function b:Display(f)if IsValid(self.selectedPanel)then self.selectedPanel:Display(f)end;if f then self:SetVisible(true)self:SetAlpha(255)self:Select(1)else self:AlphaTo(0,.2,0,function()if IsValid(self)then self:SetVisible(false)end end)end end;vgui.Register('srp_charactercreation',b,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/chat/ui/commands_ui.lua:
local a={}function a:Init()self:SetTitle'Player Commands'self:SetSize(1248,720)self:DockPadding(1,30,1,1)self:SetBorderColor(col.black)self:AddPanel('srp_panel',function(b)b:Dock(LEFT)b:SetWide(200)b:SetBackgroundColor(col.grey_light)b:SetBorderColor(col.grey)b:DockMargin(0,0,0,0)b:DockPadding(0,0,0,0)b:AddPanel('srp_label',function(c)c:SetText'Categories'c:SetFont'ui_header.r'c:SetTextColor(col.black)c:DockMargin(0,0,0,0)c:DockPadding(10,0,0,0)c:Dock(TOP)c:SetTall(40)c:SetTextInset(10,0)c.Paint=function(d,e,f)surface.SetDrawColor(col.white_dark)surface.DrawRect(0,0,e,f)surface.SetDrawColor(0,0,0,255)surface.DrawLine(0,f-1,e,f-1)end end)b:AddPanel('ui_scrollpanel',function(g)g:Dock(FILL)g:DockMargin(0,0,0,0)self.listScroll=g end)end)self:AddPanel('srp_panel',function(b)b:Dock(FILL)b:DockMargin(0,0,0,0)b:DockPadding(0,0,0,0)b:SetBackgroundColor(col.white_dark)b:AddPanel('srp_panel',function(h)h:Dock(TOP)h:SetTall(40)h:DockMargin(0,0,0,0)h:DockPadding(0,0,0,0)h:AddPanel('srp_label',function(c)c:SetText'Commands'c:SetFont'ui_header.r'c:SetTextColor(col.black)c:DockMargin(0,0,0,0)c:DockPadding(10,0,0,0)c:Dock(FILL)c:SetTextInset(10,0)end)h:AddPanel('srp_textinput',function(c)c:SetFont'ui_header.r'c:SetTextColor(col.black)c:SetBackgroundColor(Color(255,255,255,50))c:DockMargin(4,4,4,4)c:DockPadding(0,0,0,0)c:Dock(RIGHT)c:SetWide(250)c:OnValid(function(i)local j=i:GetValue()self:Search(j)end)self.search=c end)h.Paint=function(d,e,f)surface.SetDrawColor(col.white_dark)surface.DrawRect(0,0,e,f)surface.SetDrawColor(0,0,0,255)surface.DrawLine(0,f-1,e,f-1)end end)b:AddPanel('ui_scrollpanel',function(g)g:Dock(FILL)self.commandScroll=g end)end)self:PopulateCatagories()end;function a:Search(j)if!j||j:Replace(' ','')==''then if IsValid(self.SelectedBtn)then self:PopulateCommandList(self.SelectedBtn.Commands)else self.commandScroll:Reset()end;return end;local k={}for l,m in pairs(srp.GetHelpCommands())do for n,o in pairs(m)do if n!=o:GetName()then continue end;if o.Name:find(j)then k[n]=o end end end;self:PopulateCommandList(k)end;function a:PopulateCatagories()self.Categories={}for l,m in SortedPairs(srp.GetHelpCommands(),false)do srp.ui.Create('srp_button',function(p)p.Commands=m;p:Dock(TOP)p:SetText(l)p:SetFont'ui_header.s'p:SetTall(45)p:DockPadding(5,5,5,5)p:DockMargin(0,0,0,0)p:SetContentAlignment(4)p:SetBorderColor(col.transparent)p:LeftClick(function(q)self.SelectedBtn=q;self:PopulateCommandList(m)end)if l=='Battalion'then self.SelectedBtn=p;self:PopulateCommandList(m)end;self.listScroll:AddItem(p)end)end end;function a:PopulateCommandList(m)self.commandScroll:Reset()for n,o in SortedPairsByMemberValue(m,'Name',false)do if n!=o:GetName()||o:GetFlag()&&!LocalPlayer():HasFlag(o:GetFlag())then continue end;srp.ui.Create('srp_command',function(b)b:Populate(o)self.commandScroll:AddItem(b)end)end end;vgui.Register('srp_commands',a,'srp_window')local a={}function a:Init()self:DockMargin(5,5,5,5)self:DockPadding(15,10,15,15)self:SetTall(125)self:AddPanel('srp_label',function(c)c:SetText'Test'c:SetFont'ui_header.r'c:DockMargin(0,0,0,5)c:DockPadding(0,0,0,0)c:Dock(TOP)c:SetTall(40)c:DockMargin(0,0,0,0)c:SetTextInset(15,0)c.Paint=function(d,e,f)surface.SetDrawColor(col.grey_light)surface.DrawRect(0,0,e,f)surface.SetDrawColor(0,0,0,255)surface.DrawLine(0,f-1,e,f-1)end;c.DoClick=function(d)SetClipboardText(d:GetText())srp.notif.Neutral(2,'Copied to clipboard')end;self.name=c end)self:AddPanel('srp_panel',function(b)b:Dock(TOP)b:DockMargin(0,4,0,0)b:DockPadding(0,5,0,0)b:SetBackgroundColor(Color(25,25,25,80))b:AddPanel('srp_label',function(c)c:Dock(FILL)c:SetFont'ui_label.l'c:SetWrap(true)c:SetAutoStretchVertical(true)c:SetContentAlignment(7)c:SetTextColor(col.grey)self.description=c end)self.descriptionpnl=b end)self:AddPanel('srp_panel',function(b)b:Dock(TOP)b:DockMargin(0,0,0,0)b:DockPadding(0,0,0,0)b:SetVisible(false)b:SetTall(23)b:SetBackgroundColor(Color(25,25,25,120))b:AddPanel('srp_grid',function(r)r:Dock(FILL)r:SetAutoHeight(true)r.OnComplete=function(d,f)self.tagpnl:SetTall(f+5)end;self.tags=r end)self.tagpnl=b end)end;function a:Populate(o)self.command=o;self.name:SetText('/'..o:GetName())local s=o:GetInfo()self.description:SetText(s)surface.SetFont'ui_header.r'local e,f=surface.GetTextSize(s)self.descriptionpnl:SetTall(math.Max(f+10,25))local t=o:GetInfoArgs()if t then for u,v in pairs(t)do surface.SetFont'ui_label.r'local e=surface.GetTextSize(v)srp.ui.Create('srp_button',function(p)p:SetFont'ui_label.r'p:DockMargin(0,0,0,0)p:DockPadding(2,2,2,2)p:SetText('['..v..']')p:SetWide(e+15)p:SetContentAlignment(4)p:SetBorderColor(col.transparent)p:SetBackgroundColor(col.transparent)p:SetHoverColor(col.transparent)p:SetTextColor(col.grey_light)self.tags:AddItem(p)end)end;self.tagpnl:SetVisible(true)self:SetTall(170)end;self:InvalidateLayout(true)self:SizeToChildren(false,true)end;function a:Paint(e,f)surface.SetDrawColor(col.blue_light)surface.DrawRect(15,6,20,4)end;vgui.Register('srp_command',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/construction/construction_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/construction/ui/constructionbtn_ui.lua:
local a={}local b=Material'galactic/ui/inventory/building.png'local c=col.black:Copy()c.a=222;function a:Init()self:SetText'Construction'self:SetSize(64,64)self:SetPos((ScrW()-64)*.5,ScrH()*.85)self:SetMaterial(b)self:SetBackgroundColor(c)self.img:SetSize(48,48)self:SetMaterialPos((64-48)*.5,(64-48)*.5)self:SetBackgroundColor(col.red)self:SetHoverColor(col.red_dark)self:LeftClick(function()self:ToggleMode()end)hook('PlayerBindPress',self,function(d,e,f,g,h)if g&&h==KEY_F then if!d:IsDisabled()then d:ToggleMode()end;return true end end)end;function a:ToggleMode()if self.NextToggle&&self.NextToggle>CurTime()then return end;srp.construction.ToggleMode()if srp.construction.IsConstructing()then self:SetBackgroundColor(col.green)self:SetHoverColor(col.green_light)self:SetPos((ScrW()-64)*.5,ScrH()*.75-70)else self:SetBackgroundColor(col.red)self:SetHoverColor(col.red_dark)self:SetPos((ScrW()-64)*.5,ScrH()*.85)end;srp.EnableMouse(false)self.NextToggle=CurTime()+.2 end;function a:OnRemove()srp.EnableMouse(false)hook.Remove('PlayerBindPress',self)end;vgui.Register('srp_constructionbtn',a,'srp_button_image_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/construction/ui/constructionitem_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/construction/ui/constructionitem_ui.lua:
local a={}local b=Color(0,0,0,175)local c=Color(255,255,255,50)local d=col.blue:Copy()local e=Material'gui/gradient_up'function a:Init()self:SetFont'ui_label.r'self:SetBorderColor(c)self:SetBackgroundColor(b)self:DockPadding(2,2,2,2)self.lbl:Dock(BOTTOM)self.lbl.Paint=function(f,g,h)draw.Box(0,0,g,h,self.Selected&&d||b)end;self:AddPanel('SpawnIcon',function(i)i:Dock(FILL)i:SetKeyboardInputEnabled(false)i:SetMouseInputEnabled(false)i.PaintOver=function()end;self.SpawnIcon=i end)self:AddPanel('srp_label',function(i)i:SetVisible(false)i:SetContentAlignment(5)i:SetFont'ui_label.r'i:SetTextColor(col.yellow)i:SetTall(15)i.Paint=function(f,g,h)draw.Box(0,0,g,h,self.Selected&&d||b)end;self.inventory=i end)self:LeftClick(function()if IsValid(self.Container)then self.Container:Select(self.id)end end)hook('OnInventoryItemRemoved',self,self.OnItemRemoved)end;function a:Populate(j,k)self.Item=j;self.Container=k;self:SetText(j.Name)self.SpawnIcon:SetModel(j.Model)self.SpawnIcon:SetToolTip(false)if#j.Name>12 then self:SetFont'ui_label.s'end;if j.InventoryID then local l=LocalPlayer():GetInventoryItemCount(j.InventoryID)||0;self.inventory:SetText(l)self.inventory:SetVisible(true)self.inventory:SizeToContentsX(10)if l==0 then self:SetAlpha(150)end end end;function a:OnItemRemoved(m,j)if!self.Item then return end;if j.id==self.Item.InventoryID then local l=LocalPlayer():GetInventoryItemCount(j.InventoryID)||0;self.inventory:SetText(l)self.inventory:SizeToContentsX(10)if l==0 then self:SetAlpha(150)end end end;function a:PerformLayout(g,h)self.inventory:SetPos((g-self.inventory:GetWide())*.5,h-38)end;function a:OnRemove()hook.Remove('OnInventoryItemRemoved',self)end;function a:Paint(g,h)draw.Box(0,0,g,h,col.grey)surface.SetMaterial(e)surface.SetDrawColor(col.grey_dark)surface.DrawTexturedRect(0,0,g,h)surface.SetDrawColor(0,0,0,200)surface.DrawOutlinedRect(0,0,g,h)end;vgui.Register('srp_constructionitem',a,'srp_button')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/callingcard/callingcard_cl.lua:
srp.callingcard=srp.callingcard||{}function srp.callingcard.SetTag(a)net.Start'srp.callingcard.SetTag'net.WriteString(a)net.SendToServer()end;function srp.callingcard.ClearTag()net.Start'srp.callingcard.ClearTag'net.SendToServer()end;function srp.callingcard.RequestCallingCard()net.Start'srp.callingcard.RequestCallingCard'net.SendToServer()end;net('srp.callingcard.SetTag',function()hook.Run('OnCallingCardUpdated',net.ReadString())end)net('srp.callingcard.ClearTag',function()hook.Run('OnCallingCardCleared')end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_displayweapon_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmeticplayer_ui.lua:
local a={}local b={Controls={{name='Head Wear',pos={x=.5,y=.03,offsetx=-95},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot=cosmetics.SLOT.APPAREL.HEAD}},{name='Hair',pos={x=.5,y=.03},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot={{name='Head',id=cosmetics.SLOT.APPAREL.HAIR},{name='Face',id=cosmetics.SLOT.APPAREL.HAIR_BEARD}}}},{name='Face',pos={x=.5,y=.03,offsetx=95},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot={{name='Face Slot 1',id=cosmetics.SLOT.APPAREL.FACE},{name='Face Slot 2',id=cosmetics.SLOT.APPAREL.FACE2}}}},{name='Model',display='srp_cosmetic_displaymodels',pos={x=.5,y=.90,offsetx=-95},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPEARANCE,slot=cosmetics.SLOT.APPEARANCE.MODEL}},{name='Calling Cards',display='srp_cosmetic_displaycallingcard',pos={x=.04,y=.90},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPEARANCE,slot=cosmetics.SLOT.APPEARANCE.CALLINGCARD}},{name='Effects',display='srp_cosmetic_displayeffects',pos={x=.04,y=.90,offsetx=95},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPEARANCE,slot=cosmetics.SLOT.APPEARANCE.EFFECTS}},{name='Pet',pos={x=.5,y=.90},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot=cosmetics.SLOT.APPAREL.PET}},{name='Patches',pos={x=.5,y=.90,offsetx=95},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot=cosmetics.SLOT.APPAREL.PATCH}},{name='Arms',pos={x=.88,y=.25},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot={{name='Left',id=cosmetics.SLOT.APPAREL.LEFT_ARM},{name='Right',id=cosmetics.SLOT.APPAREL.RIGHT_ARM}}}},{name='Hands',pos={x=.88,y=.25,offsety=95},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot={{name='Left',id=cosmetics.SLOT.APPAREL.LEFT_HAND},{name='Right',id=cosmetics.SLOT.APPAREL.RIGHT_HAND}}}},{name='Legs',pos={x=.88,y=.25,offsetx=95},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot={{name='Left',id=cosmetics.SLOT.APPAREL.LEFT_LEG},{name='Right',id=cosmetics.SLOT.APPAREL.RIGHT_LEG}}}},{name='Knees',pos={x=.88,y=.25,offsetx=95,offsety=95},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot={{name='Left',id=cosmetics.SLOT.APPAREL.LEFT_KNEE},{name='Right',id=cosmetics.SLOT.APPAREL.RIGHT_KNEE}}}},{name='Feet',pos={x=.88,y=.25,offsetx=95,offsety=190},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot=cosmetics.SLOT.APPAREL.FEET}},{name='Neck',pos={x=.12,y=.25,offsetx=-95},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot=cosmetics.SLOT.APPAREL.NECK}},{name='Chest',pos={x=.12,y=.25,offsetx=-95,offsety=95},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot={{name='Chest',id=cosmetics.SLOT.APPAREL.CHEST},{name='Left',id=cosmetics.SLOT.APPAREL.CHEST_LEFT},{name='Right',id=cosmetics.SLOT.APPAREL.CHEST_RIGHT}}}},{name='Back',pos={x=.12,y=.25,offsetx=-95,offsety=190},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot=cosmetics.SLOT.APPAREL.BACK}},{name='Shoulder',pos={x=.12,y=.25},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot={{name='Left',id=cosmetics.SLOT.APPAREL.SHOULDERS},{name='Right',id=cosmetics.SLOT.APPAREL.SHOULDERS2}}}},{name='Waist',pos={x=.12,y=.25,offsety=95},size={w=85,h=85},color=col.white,background=col.midnight_light,selector={type=cosmetics.APPAREL,slot=cosmetics.SLOT.APPAREL.WAIST}}}}function a:Init()self:SetClass'player'self:SetControls(b)self:AddPanel('srp_modelpanel',function(c)c:Dock(FILL)c:MoveToBack()c:SetCanControl(true)self.PreviewPanel=c end)self:AddPanel('srp_button_tagtext_rounded',function(c)c:SetSize(200,28)c:SetPos(5,10)c:SetTagWidth(30)c:SetTagFont('SSRPForkAwesome')c:SetTagText(0xf1fc,true)c:SetTagBackground(col.transparent)c:SetBackgroundColor(col.midnight_light)c:SetHoverColor(col.midnight)c:SetBorderColor(col.transparent)c:SetTagTextColor(col.white)c:SetText'Colour'c:LeftClick(function(d)if IsValid(d.Colourizer)then d.Colourizer:FadeOut()return end;self:AddPanel('srp_cosmetic_colourize',function(c)c:Populate(d,350,400,'cosmetics.ChangeColor','GetPlayerColor')d.Colourizer=c end)end)end)self:OnPlayerStateChanged()end;function a:OnControlSelected()if IsValid(self.PreviewPanel)then self.PreviewPanel:SetVisible(false)end end;function a:OnControlDeselected()if IsValid(self.PreviewPanel)then self.PreviewPanel:SetVisible(true)end end;function a:OnPlayerStateChanged()if!IsValid(self.PreviewEntity)then self.PreviewEntity=self.PreviewPanel:AddModel(LocalPlayer():GetModel())self.PreviewEntity.cents={}end;self.PreviewEntity:SetAngles(Angle(0,-90,0))self.PreviewEntity:SetSkin(LocalPlayer():GetSkin())for e=0,self.PreviewEntity:GetNumBodyGroups()-1 do self.PreviewEntity:SetBodygroup(e,LocalPlayer():GetBodygroup(e)||0)end;self.PreviewPanel:TryCenter(self.PreviewEntity,nil,1)self.PreviewEntity:SetPos(self.PreviewEntity:GetPos()+Vector(0,0,15))end;function a:AddCosmetic(f)if f:GetSlot()==cosmetics.SLOT.APPEARANCE.MODEL then self.PreviewEntity:SetModel(f:GetModel())return end;local g=f:GetEquipped(self.PreviewEntity)if g then g:RemovePlayer(self.PreviewEntity)end;local h=f:AddPlayer(self.PreviewEntity)if IsValid(h)then self.PreviewPanel:AddEntity(h)end end;function a:RemoveCosmetic(f)f:RemovePlayer(self.PreviewEntity)if f:GetSlot()==cosmetics.SLOT.APPEARANCE.MODEL then self.PreviewEntity:SetModel(LocalPlayer():GetModel())end end;function a:ClearItems()if!IsValid(self.PreviewEntity)then return end;for i,j in pairs(self.PreviewEntity.cents)do if IsValid(j)then j:Remove()end end;self.PreviewEntity:SetModel(LocalPlayer():GetModel())end;vgui.Register('srp_cosmeticplayer',a,'srp_cosmeticpanel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/crafting/ui/crafting_ui.lua:
local a={}local b={['ALL']={material=Material('materials/galactic/ui/foods/package.png','smooth')},['AMMO']={material=Material('materials/galactic/ui/inventory/ammo.png')},['EQUIPMENT']={material=Material('materials/galactic/ui/inventory/handcuff.png')},['EDIBLE']={material=Material('materials/galactic/ui/foods/waterbottle.png')},['CRYSTALS']={material=Material('materials/galactic/ui/inventory/crystal.png')},['HILTS']={material=Material('materials/galactic/ui/inventory/hilt.png'),orderBy='internal',orderMode=false},['METALS']={material=Material('materials/galactic/ui/inventory/refinedmetal.png')},['MODULES']={material=Material('materials/galactic/ui/inventory/infuserorange.png')},['POTIONS']={material=Material('materials/galactic/ui/foods/waterbottle.png')},['WEAPONS']={material=Material('materials/galactic/ui/foods/package.png')}}function a:Init()self:SetSize(1000,600)self:Center()self:MakePopup()self:SetTitle'Crafting'self:SetBackgroundColor(col.midnight_dark)self:AddPanel('ui_scrollpanel',function(c)c:Dock(LEFT)c:SetWide(200)self.Scroll=c end)self:AddPanel('srp_crafting_view',function(d)d:Dock(FILL)self.Container=d end)end;function a:Populate(e)self.Machine=e;local f=srp.crafting.GetCategories(true)for g,h in ipairs(f)do local i=h.catid;local j=self:AddHeader(i)local k=b[i:upper()]||b.ALL;local l=0;for m,n in SortedPairsByMemberValue(h.recipes,k.orderBy||"name",k.orderMode||false)do local o,p=n:CanView(LocalPlayer())if!o then continue end;local q=istable(n.creates)&&n.creates[1]||n.creates;l=l+(self:AddRecipe(n,q)&&1||0)end;if l==0 then j:Remove()end end end;function a:AddHeader(i)local j=b[i:upper()]||b.ALL;return srp.ui.Create('srp_button_tag',function(d)d:SetTall(32)d:SetText(i)d:SetFont'ui_header.s'd:SetBackgroundColor(col.black)d:SetHoverColor(col.black)d:SetMaterial(j.material)d:SetBorderColor(col.transparent)self.Scroll:AddItem(d)end)end;function a:AddRecipe(n,r)local s=srp.items.Get(r)if!s then return end;return srp.ui.Create('srp_button_tag',function(d)d:SetTall(32)d:SetText(n.name)d:SetTextColor(col.white_dark)d:SetBackgroundColor(col.midnight_light)d:SetHoverColor(col.midnight)d:SetBorderColor(col.transparent)if s.icon then d:SetMaterial(s.icon)if s.color then d:SetMaterialColor(s.color)end end;d:LeftClick(function()self.Container:Populate(self.Machine,n,s)end)if self.Machine:GetRecipe()==n.id then self.Container:Populate(self.Machine,n,s)end;self.Scroll:AddItem(d)end)end;vgui.Register('srp_crafting',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/crafting/ui/craftingview_ui.lua:
local a={}local b=Material'materials/galactic/ui/foods/package.png'local c=Material'materials/galactic/arena/chevron.png'local d=Color(0,0,0,100)local e=Color(0,0,0,50)local f=Color(0,150,0,150)local g=Color(100,100,200,50)function a:Init()self:SetBackgroundColor(col.transparent)self:AddPanel('srp_panel',function(h)h:Dock(TOP)h:SetTall(98)h:SetBackgroundColor(col.transparent)h:AddPanel('DImage',function(i)i:Dock(LEFT)i:SetWide(90)self.Icon=i end)h:AddPanel('srp_label',function(j)j:SetText''j:Dock(TOP)j:SetContentAlignment(1)j:SetTextColor(col.white)j:SetFont'ui_header.l'j:SetTall(45)j:DockMargin(15,0,0,0)self.Name=j end)h:AddPanel('srp_label',function(j)j:SetText''j:Dock(TOP)j:SetContentAlignment(7)j:SetTextColor(col.white_dark)j:SetFont'ui_header.s'j:DockMargin(15,0,0,0)self.Description=j end)end)self:AddPanel('srp_grid',function(k)k:Dock(TOP)k:SetSpacing(15,15)k:SetTall(50)self.StatGrid=k end)self:AddPanel('srp_grid',function(k)k:Dock(FILL)k:SetSpacing(15,15)k:SetAutoHeight(true)self.Grid=k end)self:AddPanel('srp_panel',function(l)l:DockMargin(0,0,0,0)l:SetSize(200,128)l:SetBackgroundColor(col.transparent)l:SetVisible(false)l.Paint=function(m,n,o)surface.SetMaterial(c)surface.SetDrawColor(col.midnight_light)surface.DrawTexturedRectRotatedPoint(n*.25,o/2,32,32,-90,0,0)surface.DrawTexturedRectRotatedPoint(n*.5,o/2,32,32,-90,0,0)surface.DrawTexturedRectRotatedPoint(n*.75,o/2,32,32,-90,0,0)if self.Running then self.NextChevron=(self.NextChevron||0)+RealFrameTime()/1*5;local p=math.ceil(self.NextChevron%3)surface.SetDrawColor(f)surface.DrawTexturedRectRotatedPoint(n*.25*p,o/2,32,32,-90,0,0)end end;self.Chevrons=l end)self:AddPanel('srp_panel_rounded',function(h)h:SetBackgroundColor(e)h:SetSize(250,30)h:SetVisible(true)h:SetBackgroundColor(col.transparent)h:AddPanel('srp_label',function(h)h:Dock(FILL)h:SetTextColor(col.white)h:SetText('Waiting...')h:SetContentAlignment(5)self.CurrentCount=h end)self.CountContainer=h end)self:AddPanel('srp_panel_rounded',function(h)h:SetBackgroundColor(e)h:SetSize(250,50)h:SetVisible(false)h:AddPanel('srp_button_rounded',function(h)h:Dock(RIGHT)h:SetText'Craft'h:DockMargin(0,0,0,0)h:SetBackgroundColor(col.midnight_light)h:SetHoverColor(col.midnight_dark)h:LeftClick(function(m)if self.Running then srp.crafting.End(self.Machine)elseif self.Recipe then self.ItemCount=self.Count:GetValue()srp.crafting.Start(self.Machine,self.Recipe,self.Count:GetValue())end end)self.Craft=h end)h:AddPanel('srp_numberinput_rounded',function(h)h:Dock(FILL)h:DockMargin(0,0,4,0)h:SetMinMax(1,500000)h:SetValue(1)h:SetBackgroundColor(col.transparent)h:SetTextColor(col.white_dark)self.Count=h end)self.Controls=h end)hook('OnCraftingStart',self,self.OnStart)hook('OnCraftingEnd',self,self.OnEnd)hook('OnCraftingProgress',self,self.OnProgress)end;function a:OnRemove()hook.Remove('OnCraftingStart',self)hook.Remove('OnCraftingEnd',self)hook.Remove('OnCraftingProgress',self)end;function a:OnStart(q,r)if q==self.Machine&&self.Recipe.internal==r then self.Running=true;self.ItemCount=0;self.Craft:SetText'Stop'self.Craft:SetBackgroundColor(col.red_dark)self.Craft:SetHoverColor(col.red_dark)self.Chevrons:SetVisible(true)self.CountContainer:SetVisible(true)end end;function a:OnEnd(q)if q!=self.Machine then return end;self.Running=false;self.Craft:SetText'Craft'self.Craft:SetBackgroundColor(col.midnight_light)self.Craft:SetHoverColor(col.midnight_dark)self.Chevrons:SetVisible(false)self.CountContainer:SetVisible(false)self.CurrentCount:SetText('Waiting...')end;function a:OnProgress(q,r,s)if q!=self.Machine||self.Recipe.internal!=r then return end;if!self.Running then self:OnStart(q,r)end;self.ItemCount=(self.ItemCount||0)+(s||1)self.CurrentCount:SetText(self.ItemCount..' item(s) crafted')end;function a:AddStat(t,u,v,w)return srp.ui.Create('srp_panel_rounded',function(h)h:SetSize(v||230,24)h:DockMargin(0,1,0,1)h:SetBackgroundColor(col.grey_light)h:AddPanel('srp_label',function(j)j:Dock(FILL)j:SetTextColor(col.white)j:SetFont'ui_label.r'j:SetText(t)end)h:AddPanel('srp_label',function(j)j:Dock(RIGHT)j:SetTextColor(col.white)j:SetFont'ui_label.r'j:SetText(u)j:SetWide(w||60)j:SetContentAlignment(6)end)self.StatGrid:AddItem(h)end)end;function a:Populate(x,y,z)self.Machine=x;self.Recipe=y;self.Item=z;self.Name:SetText(z.name)self.Description:SetText(z.description||'')if z.icon then self.Icon:SetVisible(true)self.Icon:SetMaterial(z.icon)self.Icon:SetImageColor(z.color||col.white)else self.Icon:SetVisible(false)end;self.Controls:SetVisible(true)self.StatGrid:Clear()self.Grid:Clear()self:AddStat('Production Quantity',string.Comma(y.count||0))self:AddStat('Production Cost',string.Comma(y.cost||0)..LocalPlayer():GetCurrency())local A=self:AddStat('Production Time',string.NiceTime(y.time))A.PaintOver=function(m,n,o)if!IsValid(self.Machine)||!self.Machine:GetRunning()then return end;local B=self.Machine.RecipeEndTime;if!B||B<CurTime()then return end;local C=(B-CurTime())/self.Machine.RecipeTime;draw.RoundedBox(4,1,1,(n-2)*C,o-2,g)end;for D,s in pairs(y.items)do local z=srp.items.Get(D)if!z then continue end;srp.ui.Create('srp_crafting_item',function(h)h:Populate(z,s)self.Grid:AddItem(h)end)end end;function a:PerformLayout(n,o)if IsValid(self.Chevrons)then self.Chevrons:SetPos((n-200)*.5,(o-128)*.85)end;if IsValid(self.Controls)then self.Controls:SetPos((n-250)*.5,(o-50)*.95)end;if IsValid(self.CountContainer)then self.CountContainer:SetPos((n-250)*.5,(o-50)*.95-35)end end;vgui.Register('srp_crafting_view',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/eventrewards/ui/eventreward_info_ui.lua:
local a={}function a:Init()self:SetTall(150)self:DockMargin(0,10,0,0)self:SetBackgroundColor(featureBackground)self:AddPanel('srp_label',function(b)b:Dock(TOP)b:SetTall(40)b:SetText''b:SetFont'ui_header.rb'b.Paint=function(c,d,e)draw.Box(2,e-2,d-4,4,col.white_dark)end;self.Title=b end)self:AddPanel('srp_label',function(b)b:Dock(FILL)b:SetText''b:SetFont'ui_label.r'b:SetMultiline(true)b:SetWrap(true)self.Description=b end)end;function a:Populate(f,g,h)self.Title:SetText(f)self.Description:SetText(g)if h then self:SetBackgroundColor(h)end end;vgui.Register('srp_eventreward_info',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/eventlights_cl.lua:
srp.ui=srp.ui||{}srp.ui.audio=srp.ui.audio;ArenaColorTop=Color(222,222,222)ArenaColorBot=Color(222,222,222)ArenaColorFloor=Color(222,222,222)local a={}local b={}local c={}local d=false;local e,f=0,0;local g=Color(200,200,200)local h=Color(255,255,255)local i=Material('materials/galactic/arena/chevron.png','smooth')local j=Material('materials/galactic/arena/watermelon.png','smooth')local k=Material('materials/galactic/seasonal/easter/eggs2.png','smooth')local l=Material('materials/galactic/seasonal/easter/happyeaster.png','smooth')local m={{snd='sound/galactic/arena/rtj.mp3',AmpStart=1,AmpAmount=14},{snd='sound/galactic/arena/dance.mp3',AmpStart=1,AmpAmount=14},{snd='sound/music/hl1_song10.mp3',AmpStart=1,AmpAmount=14},{snd='sound/music/hl2_song14.mp3',AmpStart=1,AmpAmount=14},{snd='sound/music/hl2_song15.mp3',AmpStart=1,AmpAmount=14},{snd='sound/music/hl2_song20_submix0.mp3',AmpStart=1,AmpAmount=14}}local n=CreateMaterial('arena_scanlines','UnlitGeneric',{['$basetexture']='dev/dev_scanline',['$translucent']=1,['$additive']=1,['$vertexcolor']='1',['$vertexalpha']='1',['Proxies']={['TextureScroll']={['texturescrollvar']='$baseTextureTransform',['texturescrollrate']=.1,['texturescrollangle']=-90}}})local o={small={{WallPositions={{pos=Vector(-5527,-1913,-13544),ang=Angle(0,0,90),w=8000,h=1205},{pos=Vector(-3936,-3447,-13544),ang=Angle(0,180,90),w=8000,h=1205},{pos=Vector(-5527,-3447,-13544),ang=Angle(0,90,90),w=8000,h=1205},{pos=Vector(-3937,-1912,-13544),ang=Angle(0,-90,90),w=8000,h=1205}},getBotBarColor=function(self,e)return HSVToColor(195,1.5*e,1)end,getBarColor=function(self,e)local p=HSVToColor(195,1-1.5*e,0.85)for q,r in ipairs(ents.FindByClass('rp_eventplatform'))do if!r:GetBomb()then r:SetColor(p)end end;return p end,getBackgroundColor=function(self,e)local s=HSVToColor(50,1.5*e,1)local t=Vector(s.r/255,s.g/255,s.b/255)for q,r in ipairs(player.GetBots())do r:SetPlayerColor(t)end;return HSVToColor(195,1.5*e,1)end,symbolColors={Color(69,224,255),Color(69,205,255),Color(69,184,255)},drawWall=function(self,u)surface.SetMaterial(i)srp.ui.DrawShapeLine(u,4096/2,-100,3,4110,-2500,-2)srp.ui.DrawShapeLine(u+1,4096/2,-100,3,4096,-2500,-0.9,true)end},{plain=false,getBotBarColor=function(self,e)return HSVToColor(195,1.5*e,1)end,getBarColor=function(self,e)local p=HSVToColor(100,1-1.5*e,0.85)for q,r in ipairs(ents.FindByClass('rp_eventplatform'))do if!r:GetBomb()then r:SetColor(p)end end;return p end,getBackgroundColor=function(self,e)local s=HSVToColor(350,1.5*e,1)local t=Vector(s.r/255,s.g/255,s.b/255)for q,r in ipairs(player.GetBots())do r:SetPlayerColor(t)end;return HSVToColor(50,1.5*e,1)end,symbolColors={Color(255,255,255,255),Color(255,255,255,255),Color(255,255,255,255)},drawWall=function(self,u)surface.SetMaterial(j)surface.SetDrawColor(255,255,255,255)local v=e*500;local w=1024-v;local x=1024+v;surface.DrawTexturedRect((8000-x)/2,(1205-x)/2,x,x)surface.DrawTexturedRect((8000-w)/2-2024,(1205-w)/2,w,w)surface.DrawTexturedRect((8000-w)/2+2024,(1205-w)/2,w,w)end},safelanding={plain=false,getBotBarColor=function(self,e)local y=c&&c[37]||0;return HSVToColor(0+y*250,1,1)end,getBarColor=function(self,e)local y=c&&c[37]||0;local p=HSVToColor(50+y*310,1,1)for q,r in ipairs(ents.FindByClass('rp_safelanding'))do r:SetColor(p)end;return p end,getBackgroundColor=function(self,e)local y=(c&&c[37]||0)*50;local s=HSVToColor(350,1.5*y,1)local t=Vector(s.r/255,s.g/255,s.b/255)for q,r in ipairs(player.GetBots())do r:SetPlayerColor(t)end;return HSVToColor(50,1.5*y,1)end,symbolColors={Color(255,255,255,255),Color(255,255,255,255),Color(255,255,255,255)},drawWall=function(self,u)local y=c&&c[37]||0;y=y+(c&&c[42]||0)*50;surface.SetMaterial(j)surface.SetDrawColor(255,255,255,255)local v=y*5;local w=300+1024*-v;local x=300+1024*v;surface.DrawTexturedRect((8000-x)/2,(1205-x)/2,x,x)surface.DrawTexturedRect((8000-w)/2-2024,(1205-w)/2,w,w)surface.DrawTexturedRect((8000-w)/2+2024,(1205-w)/2,w,w)end},failsafe={plain=false,audio='galactic/minigames/teaser.wav',audioloop=true,WarningMaterial=Material('materials/galactic/ui/warning.png','noclamp smooth'),symbolColors={Color(150,0,0,255),Color(100,0,0,255),Color(100,0,0,255)},index=0,time=0,phrases={'Quick, there isnt much time!','Did you press a button yet?','I dont think you have the right button....','Whos going to die?!','Where has your luck gone?','I suck at this game - {name}'},getBotBarColor=function(self,e)return self.symbolColors[2]end,getBarColor=function(self,e)return self.symbolColors[2]end,getBackgroundColor=function(self,e)return self.symbolColors[1]end,drawWall=function(self,u)surface.SetMaterial(n)surface.DrawTexturedRect(0,0,8000,1205)surface.SetMaterial(self.WarningMaterial)surface.SetDrawColor(255,255,255,255)local v=256+math.cos(CurTime()*16)*80;local w=1024-v;local x=1024+v;surface.DrawTexturedRect((8000-w)/2-2354,(1205-w)/2,w,w)if u==4 then surface.DrawTexturedRect((8000-w)/2+2354,(1205-w)/2,w,w)else local z=math.floor(CurTime())if z!=self.time&&z%3==0 then self.index=math.random(#self.phrases)end;self.time=z;local A=self.phrases[self.index%#self.phrases+1]draw.SimpleText(string.RPFormat(LocalPlayer(),A),'ui_header.xxxl',8000*.35,1205/2,col.white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)end end},easter={plain=false,getBotBarColor=function(self,e)return HSVToColor(55,1.5*e,1)end,getBarColor=function(self,e)local p=HSVToColor(310,1-1.5*e,0.85)return p end,getBackgroundColor=function(self,e)local s=HSVToColor(350,1+1.5*e,1)local t=Vector(s.r/255,s.g/255,s.b/255)for q,r in ipairs(player.GetBots())do r:SetPlayerColor(t)end;return HSVToColor(50,1.5*e,1)end,symbolColors={Color(255,255,255,255),Color(255,255,255,255),Color(255,255,255,255)},drawWall=function(self,u)surface.SetDrawColor(255,255,255,255)local v=e*500;local w=1024-v;local x=1024+v;surface.SetMaterial(l)surface.DrawTexturedRect((8000-x)/2,(1205-x)/2,x,x)surface.SetMaterial(k)surface.DrawTexturedRect((8000-w)/2-2024,(1205-w)/2,w,w)surface.SetMaterial(k)surface.DrawTexturedRect((8000-w)/2+2024,(1205-w)/2,w,w)end}},large={{plain=true,sound={snd='sound/music/hl2_song20_submix0.mp3',AmpStart=1,AmpAmount=14},getBotBarColor=function(self,e)return HSVToColor(193,1.5*e,1)end,getBarColor=function(self,e)return HSVToColor(193,1.5*e,1)end,getBackgroundColor=function(self,e)return HSVToColor(193,1.5*e,1)end,drawWall=function(self,u)end}}}local B=o.small[1]matproxy.Add({name='ArenaColorTop',init=function(self,C,D)self.ResultTo=D.resultvar end,bind=function(self,C,E)C:SetVector(self.ResultTo,Vector(ArenaColorTop.r/255,ArenaColorTop.g/255,ArenaColorTop.b/255))end})matproxy.Add({name='ArenaColorBot',init=function(self,C,D)self.ResultTo=D.resultvar end,bind=function(self,C,E)C:SetVector(self.ResultTo,Vector(ArenaColorBot.r/255,ArenaColorBot.g/255,ArenaColorBot.b/255))end})matproxy.Add({name='ArenaColorFloor',init=function(self,C,D)self.ResultTo=D.resultvar end,bind=function(self,C,E)C:SetVector(self.ResultTo,Vector(ArenaColorFloor.r/255,ArenaColorFloor.g/255,ArenaColorFloor.b/255))end})local F=FindMetaTable'IGModAudioChannel'local G=4;local H=14;function F:SetAmpRange(I,J)G=I;H=J end;function F:GetAmpRange()return G,H end;function F:GetAverageFFT(I,J)local K=0;local L=0;for M=I,I+J-1 do if c&&c[M]then L=L+1;K=K+c[M]end end;return L==0&&0||K/L end;function F:GetHighestInRange(I,J)local N=0;for M=I,I+J-1 do if!c[M]then continue end;if c[M]>N then N=c[M]end end;return N end;local function O(M)if b[M]then return b[M]else b[M]={offset=0,colorOffset=0}return b[M]end end;function srp.ui.DrawShapeLine(M,P,Q,R,v,S,T,U)local V=O(M)V.offset=(V.offset||0)+T;if V.offset<-(v+S)then V.offset=0;V.colorOffset=V.colorOffset%#B.symbolColors+1 end;Q=Q+S+V.offset;for M=0,R-1 do if U then local z=(M+V.colorOffset)%#B.symbolColors+1;surface.SetDrawColor(B.symbolColors[z])end;surface.DrawTexturedRect(P,Q+(v+S)*M,v,v)end end;local function W()local u=0;h=B:getBackgroundColor(e)local X=d&&srp.events.Arena.Walls.Large||srp.events.Arena.Walls.Small;for M=1,#X do local Y=X[M]cam.Start3D2D(Y.pos,Y.ang,.2)draw.Box(0,0,Y.w,Y.h,h)if B.drawWall then B:drawWall(u)end;u=u+2;cam.End3D2D()end end;local function Z(_,M,a0)local a1=1000*_;local col=HSVToColor(120,1,_)col.a=50;surface.SetDrawColor(col)surface.DrawRect((M-1)*a0,ScrH()-a1,a0,a1)draw.DrawText(M,'default',(M-1)*a0,ScrH()-a1-5,color_white,TEXT_ALIGN_CENTER)end;local function a2(a3,a4)if B.audio==false then return end;if IsValid(srp.ui.audio)then srp.ui.audio:Stop()end;local z=a3%#m+1;local a5,a6=a4:GetMusic()local a7=eventMusicData||m[z]local a8=a5||B.audio||a7.snd;sound.PlayFile(a8,'noplay noblock',function(a9,aa,ab)if IsValid(a9)then a9:EnableLooping(true)a9:SetVolume(d&&0.1||0.4)a9:SetAmpRange(a7.AmpStart||1,a7.AmpAmount||14)a9:SetTime(a7.StartFrom||0)a9:Play()srp.ui.audio=a9 end end)end;local function ac()if IsValid(srp.ui.audio)then srp.ui.audio:Stop()srp.ui.audio=nil end end;local function ad()local ae=IsValid(srp.ui.audio)&&srp.ui.audio:GetState()==GMOD_CHANNEL_PLAYING;if ae then srp.ui.audio:SetVolume((d&&0.5||1)*cvar.GetValue('srp_media_volume'))end;local af=ae&&srp.ui.audio:FFT(c,FFT_4096)local ag=ae&&srp.ui.audio:GetHighestInRange(srp.ui.audio:GetAmpRange())||0;local ah=ae&&srp.ui.audio:GetAverageFFT(srp.ui.audio:GetAmpRange())||0;e=Lerp(RealFrameTime()/1*100,e||ag,ag)f=Lerp(RealFrameTime()/1*100,f||ah,ah)local col=B:getBarColor(e)local ai=B:getBotBarColor(e)ArenaColorBot=col;ArenaColorTop=col;ArenaColorFloor=ai;if info.Dev&&input.IsKeyDown(KEY_E)&&af then for M=1,af do local _=c[M]||0;Z(_,M,ScrW()/128)end end end;local function aj(a3)if d then local z=a3%#o.large+1;B=o.large[z]||o.large[1]||o.small[1]else local z=a3%#o.small+1;B=o.small[z]||o.small[1]end end;function srp.ui.StartArenaEffects(a4)if!a4:IsArenaEvent()then return end;local a3=os.date'!%S'd=a4:IsLargeArena()if a4:GetTheme()then local ak=a4:GetTheme()B=d&&(o.large[ak]||o.large[1]||o.small[1])||(o.small[ak]||o.small[1])else aj(a3)end;if!a4:GetNoMusic()then a2(a3,a4)end;hook.Add(info.Dev&&'HUDPaint'||'Think','srp.ui.DoAudioBeatFFT',ad)hook.Add('PostDrawOpaqueRenderables','srp.ui.DrawShapeLine',W)end;function srp.ui.EndArenaEffects()ac()hook.Remove(info.Dev&&'HUDPaint'||'Think','srp.ui.DoAudioBeatFFT')hook.Remove('PostDrawOpaqueRenderables','srp.ui.DrawShapeLine')end;hook('OnAutoEventStart',srp.ui.StartArenaEffects)hook('OnAutoEventEnd',srp.ui.EndArenaEffects)hook('OnAutoEventPlayerRemoved',function(al)if al==LocalPlayer()then srp.ui.EndArenaEffects()end end)concommand.AddDev('srp_lighttest',function()srp.ui.StartArenaEffects(srp.events.Get('safelanding'))end)concommand.AddDev('srp_lighttest_stop',function()srp.ui.EndArenaEffects()end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/events/events_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/firingrange/ui/firingrange_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/gamemaster_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/toggles_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/blacklist/ui/eventcharblacklist_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/bossbars/ui/bossbar_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/commands/commands_sh.lua:
srp.AddCommand('gms',function(a)net.Start('srp.gamemaster.OpenMenu',true)net.Send(a)end):SetGM():SetCooldown(2):SetInfoSection('Gamemaster'):SetInfo('Opens the gamemaster menu.')srp.AddCommand('ghost',function(a)a:ToggleGhost()srp.notif.Neutral(a,3,term.Get('Ghosted'),a:IsGhosted()&&'invisible'||'visible')if a:IsGhosted()&&!a:IsSeniorGamemaster()then local b=a:GetGamemasterTag()ba.notify_staff('# # has turned on ghost mode.',b,a)end end):SetCooldown(2):SetInfoSection('Gamemaster'):SetInfo('Makes you invisible so you can do gamemaster duties.').CanRun=function(self,a)return a:IsTrialGamemaster()||a:HasFlag('A')end;srp.AddCommand('eventcharacter',function(a)srp.gamemaster.ToggleEventCharacter(a)end):AddAlias('eventcharacters'):SetInfoSection('Gamemaster'):SetInfo('Enables and disables the ability for event characters to spawn.'):SetGM()srp.AddCommand('sethealth',function(a,c,d)for e,f in ipairs(d)do if IsValid(f)then srp.gamemaster.SetHealth(a,f,c)end end end):AddParam(cmd.UINT):AddParam(cmd.PLAYER_ENTITY_MULTI):SetGM():SetInfoSection('Gamemaster'):SetInfo('Sets the health of the given player(s).'):SetInfoArgs({'HP - Health to set','Targets - space seperated SteamIDs/Names'})srp.AddCommand('setoxygen',function(a,g,d)for e,f in ipairs(d)do if IsValid(f)&&(!info.Main||f:IsEventCharacter())then srp.gamemaster.SetOxygen(a,f,g)end end end):AddParam(cmd.UINT):AddParam(cmd.PLAYER_ENTITY_MULTI):SetInfoSection('Gamemaster'):SetInfo('Sets the oxygen of the given player(s).'):SetInfoArgs({'OX - Oxygen to set','Targets - space seperated SteamIDs/Names'}):SetGM()srp.AddCommand('gmreturn',function(a,d)local b=a:GetGamemasterTag()if d==nil then if!a:Alive()then a:Spawn()end;if a:InVehicle()then a:ExitVehicle()end;local e,h=hook.Run('PlayerSelectSpawn',a)a:SetPos(h)ba.notify_staff('# # has returned themselves to spawn.',b,a)return end;for i,j in ipairs(d)do local k=j:GetAllegiance()if!k||!k:IsEvent()then continue end;if!j:Alive()then j:Spawn()end;if j:InVehicle()then j:ExitVehicle()end;local e,h=hook.Run('PlayerSelectSpawn',j)j:SetPos(h)end;ba.notify_staff('# # has returned '..('# '):rep(#d)..'to spawn.',b,a,unpack(d))end):AddParam(cmd.PLAYER_ENTITY_MULTI,cmd.OPT_OPTIONAL):SetInfoSection('Gamemaster'):SetInfo('Returns you are specified players to their spawn point.'):SetInfoArgs({'Targets - space seperated SteamIDs/Names'}):SetGM()srp.AddCommand('gmtele',function(a,d)local b=a:GetGamemasterTag()local l=a:GetEyeTraceNoCursor().HitPos;local m=false;for i,j in ipairs(d)do local k=j:GetAllegiance()if!k||info.Main&&!k:IsEvent()then continue end;if!j:Alive()then j:Spawn()end;if j:InVehicle()then j:ExitVehicle()end;j:SetPos(util.FindEmptyPos(l))m=true end;if m then ba.notify_staff('# # has teleported '..('# '):rep(#d),b,a,unpack(d))end end):AddParam(cmd.PLAYER_ENTITY_MULTI):SetInfoSection('Gamemaster'):SetInfo('Teleports the given player(s) infront of you. Only even characters can be teleported on Server 1.'):SetInfoArgs({'Targets - space seperated SteamIDs/Names'}):SetGM()srp.AddCommand('gmgoto',function(a,f)local b=a:GetGamemasterTag()if!a:Alive()then return end;local k=f:GetAllegiance()if!k||info.Main&&!k:IsEvent()then return end;if a:InVehicle()then a:ExitVehicle()end;a:SetPos(util.FindEmptyPos(f:GetPos()+Vector(0,0,2)))ba.notify_staff('# # has gone to #',b,a,f)end):AddParam(cmd.PLAYER_ENTITY):SetInfoSection('Gamemaster'):SetInfo('Teleports you to the given player'):SetInfoArgs({'Target - Name or SteamID or the event character'}):SetGM()srp.AddCommand('gmgive',function(a,f,n)local o=weapons.GetStored(n)if o&&o.Spawnable then f:Give(n)end end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING):SetInfoSection('Gamemaster'):SetInfo('Give a weapon to a player'):SetInfoArgs({'Target - Name or SteamID or the event character','Weapon Class - The class name of the weapon'}):SetGM()srp.AddCommand('setfuel',function(a,p,d)for e,f in ipairs(d)do if IsValid(f)&&(a:IsRoot()||f:IsEventCharacter())then srp.gamemaster.SetFuel(a,f,p)end end end):AddParam(cmd.UINT):AddParam(cmd.PLAYER_ENTITY_MULTI):SetInfoSection('Gamemaster'):SetInfo('Sets the fuel level of the given player(s).'):SetInfoArgs({'Fuel - Fuel to set','Targets - space seperated SteamIDs/Names'}):SetGM()srp.AddCommand('setgravity',function(a,q,r)q=math.Clamp(q,-0.1,5)if!r then srp.funcmodules.SetPlayerGravity(q)else for s=1,#r do if IsValid(r[s])then r[s]:SetGravity(q)end end end;srp.notif.WarningAll(5,'Gravity was changed to '..q)hook.Run('OnPlayerSetGravity',a,q,r||player.GetAll())end):AddParam(cmd.FLOAT):AddParam(cmd.PLAYER_ENTITY_MULTI,cmd.OPT_OPTIONAL):SetInfoSection('Gamemaster'):SetInfo('Sets the gravity of a player or players relative to normal gravity settings. If no player is passed it sets it to all players.\n\n1 = 100% gravity. -0.1 to 5 valid.'):SetInfoArgs({'Multi - Gravity multiplier','Targets - space seperated SteamIDs/Names'}):SetGM()srp.AddCommand('setscale',function(a,t,d)for e,f in ipairs(d)do f:SetSize(math.Clamp(t,.1,5))hook.Run('OnPlayerScaled',a,f,t)end end):AddParam(cmd.FLOAT):AddParam(cmd.PLAYER_ENTITY_MULTI):SetInfoSection('Gamemaster'):SetInfo('Sets the scale of a target or targets from 10% (0.1) to 500% (5)'):SetInfoArgs({'Scale - scale multiplier','Targets - space seperated SteamIDs/Names'}):SetGM()srp.AddCommand('setarmor',function(a,u,d)for e,f in ipairs(d)do srp.gamemaster.SetArmor(a,f,u)end end):AddParam(cmd.UINT):AddParam(cmd.PLAYER_ENTITY_MULTI):SetInfoSection('Gamemaster'):SetInfo('Sets the armour level of the given player(s).'):SetInfoArgs({'Armour - armour to set','Targets - space seperated SteamIDs/Names'}):SetGM()srp.AddCommand('setrunspeed',function(a,v,d)for e,f in ipairs(d)do srp.gamemaster.SetRunSpeed(a,f,v)end end):AddParam(cmd.UINT):AddParam(cmd.PLAYER_ENTITY_MULTI):SetInfoSection('Gamemaster'):SetInfo('Sets the run speed of the given player(s).'):SetInfoArgs({'Speed - Max run speed','Targets - space seperated SteamIDs/Names'}):SetGM()srp.AddCommand('setjumpheight',function(a,w,d)for e,f in ipairs(d)do srp.gamemaster.SetJumpHeight(a,f,w)end end):AddParam(cmd.UINT):AddParam(cmd.PLAYER_ENTITY_MULTI):SetInfoSection('Gamemaster'):SetInfo('Sets the jump height of the given player(s).'):SetInfoArgs({'Height - Max height','Targets - space seperated SteamIDs/Names'}):SetGM()srp.AddCommand('setmodel',function(a,x,y)if y then srp.gamemaster.SetModel(a,x,y)end end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING):SetHelp('Sets the server valid model of a target.'):SetInfoSection('Gamemaster'):SetInfo('Sets the model of the given player.'):SetInfoArgs({'Model - Server validated model path','Target - The Player'}):SetGM()srp.AddCommand('resetmodel',function(a,x)srp.gamemaster.ResetModel(a,x)end):AddParam(cmd.PLAYER_ENTITY):SetHelp('Sets the server valid model of a target.'):SetInfoSection('Gamemaster'):SetInfo('Resets the model of the given player.'):SetInfoArgs({'Target - The Player'}):SetGM()srp.AddCommand('resetstats',function(a,x,y)if y&&x.gmstats[y]then x.gmstats[y]=nil;a:ApplyTalent(y)else x.gmstats={}srp.talents.SyncAll(x)end;x:SetGravity(1)x.CustomTarget=false;local z=x:GetAllegiance()x:SetNoTarget(z:IsEvent()&&z.id!='CIVILIAN')end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING,cmd.OPT_OPTIONAL):SetInfoSection('Gamemaster'):SetInfo('Resets all stats given the specified target. Optional name given to only reset that stat.'):SetInfoArgs({'Target - The SteamID/Name of the player','Name - Stat name'}):SetGM()srp.AddCommand('notarget',function(a,x)if!IsValid(x)then return end;local A=!x:IsNoTarget()x:SetNoTarget(A)x.CustomTarget=true;x.CustomNoTarget=A;srp.notif.Neutral(a,3,term.Get('ToggleNPCNoTarget'),A&&'enabled'||'disabled',x:Nick(),x:SteamID())end):AddParam(cmd.PLAYER_ENTITY):SetInfoSection('Gamemaster'):SetInfo('Toggles no-target on a player. This means that NPCs will not target or "see" them.'):SetInfoArgs({'Target - The SteamID/Name of the player'}):SetGM(true)local B=false;srp.AddCommand('notargetall',function(a,x)if info.Main&&!info.Dev then return end;B=!B;for e,a in player.Iterator()do a:SetNoTarget(B)a.CustomTarget=true;a.CustomNoTarget=B end;srp.notif.Warning(a,3,term.Get('ToggleNPCNoTargetAll'),a:Nick(),a:SteamID(),B&&'enabled'||'disabled')end):SetInfoSection('Gamemaster'):SetInfo('Toggles no-target on all players.\n\nOnly works on Server 2.'):SetInfoArgs({'Targets - String seperated list of SteamIDs/Names'}):SetGM()srp.AddCommand('togglename',function(a,x)local status=!x:GetNetVar('srp.hud.hidden')x:SetNetVar('srp.hud.hidden',status)srp.notif.Neutral({a,x},3,term.Get('PlayerToggledPlayersNameTag'),a:Nick(),a:SteamID(),status&&'hidden'||'shown',x:Nick(),x:SteamID())hook.Run('OnPlayerNameToggled',a,x,status)end):AddParam(cmd.PLAYER_ENTITY):SetInfoSection('Gamemaster'):SetInfo('Toggles the visibility of the specified player\'s nameplate.'):SetInfoArgs({'Target - The SteamID/Name of the player'}):SetGM()local C=false;srp.AddCommand('togglenames',function(a,d)C=!C;for e,f in ipairs(d)do f:SetNetVar('srp.hud.hidden',C)srp.notif.Neutral({a,f},3,term.Get('PlayerToggledPlayersNameTag'),a:Nick(),a:SteamID(),C&&'hidden'||'shown',f:Nick(),f:SteamID())hook.Run('OnPlayerNamesToggled',a,f,status)end end):AddParam(cmd.PLAYER_ENTITY_MULTI):SetInfoSection('Gamemaster'):SetInfo('Toggles the visibility of the specified players\' nameplate.'):SetInfoArgs({'Targets - String seperated SteamIDs/Names'}):SetGM()srp.AddCommand('settag',function(a,f,b)local b=b:sub(0,15)if f:IsEventCharacter()then f:SetTag(b)end end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING):SetInfoSection('Gamemaster'):SetInfo('Sets the chat/rank tag of the specified player.\n0 to 15 characters.'):SetInfoArgs({'Target - The SteamID/Name of the player','Tag - The tag to display'}):SetGM()srp.AddCommand('setmytag',function(a,b)local b=b:sub(0,10)if a:IsEventCharacter()||info.EventMode then a:SetTag(b)end end):AddParam(cmd.STRING):SetInfoSection('Gamemaster'):SetInfo('Sets your chat/rank tag.\n0 to 15 characters.'):SetInfoArgs({'Tag - The tag to display'})srp.AddCommand('setnpcdistance',function(a,n,D)srp.gamemaster.SetEntityStats(a,n,'SetMaxLookDistance',math.Clamp(D,1,25000))end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Gamemaster'):SetInfo('Sets the maximum target distance of a specific NPC class. This works for base classes too.\nClass names can be found by right clicking an NPCs spawn icon and pressing Copy to Clipboard.\n\nFrom 1 to 25000.'):SetInfoArgs({'Class - Class name of NPC','Distance - The max distance to set'}):SetGM(true)srp.AddCommand('setnpcdistanceupdate',function(a,n,D)srp.gamemaster.SetEntityStats(a,n,'SetMaxLookDistance',math.Clamp(D,1,25000),true)end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Gamemaster'):SetInfo('Sets the maximum target distance of a specific NPC class. This works for base classes too.\nClass names can be found by right clicking an NPCs spawn icon and pressing Copy to Clipboard.\n\nFrom 1 to 25000.'):SetInfoArgs({'Class - Class name of NPC','Distance - The max distance to set'}):SetGM(true)srp.AddCommand('setnpchealth',function(a,n,E)srp.gamemaster.SetEntityStats(a,n,'health',math.Clamp(E,1,a:IsSeniorGamemaster()&&999999||20000))end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Gamemaster'):SetInfo('Sets the npc health of a specific NPC class. This works for base classes too.\nClass names can be found by right clicking an NPCs spawn icon and pressing Copy to Clipboard.\n\nFrom 1 to 15000. 999999 limit for SGM+'):SetInfoArgs({'Class - Class name of NPC','Health - The health to set'}):SetGM(true)srp.AddCommand('setnpchealthupdate',function(a,n,E)srp.gamemaster.SetEntityStats(a,n,'health',math.Clamp(E,1,a:IsSeniorGamemaster()&&999999||20000),true)end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Gamemaster'):SetInfo('Sets the npc health of a specific NPC class. This works for base classes too.\nClass names can be found by right clicking an NPCs spawn icon and pressing Copy to Clipboard.\n\nFrom 1 to 15000. 999999 limit for SGM+'):SetInfoArgs({'Class - Class name of NPC','Health - The health to set'}):SetGM(true)srp.AddCommand('setnpcdamage',function(a,n,F)srp.gamemaster.SetEntityStats(a,n,'damage',math.Clamp(F,1,a:IsSeniorGamemaster()&&999999||20000))end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Gamemaster'):SetInfo('Sets the npc damage of a specific NPC class. This works for base classes too.\nClass names can be found by right clicking an NPCs spawn icon and pressing Copy to Clipboard.\n\nFrom 1 to 15000. 999999 limit for SGM+'):SetInfoArgs({'Class - Class name of NPC','Health - The health to set'}):SetGM(true)srp.AddCommand('resetnpchealth',function(a,n)srp.gamemaster.ResetEntityStats(a,n,'health')end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Gamemaster'):SetInfo('Resets the health of the given NPC class.\nClass names can be found by right clicking an NPCs spawn icon and pressing Copy to Clipboard.'):SetInfoArgs({'Class - Class name of NPC'}):SetGM(true)srp.AddCommand('resetnpcdamage',function(a,n)srp.gamemaster.ResetEntityStats(a,n,'damage')end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Gamemaster'):SetInfo('Resets the damage of the given NPC class.\nClass names can be found by right clicking an NPCs spawn icon and pressing Copy to Clipboard.'):SetInfoArgs({'Class - Class name of NPC'}):SetGM(true)srp.AddCommand('setnpcdamageupdate',function(a,n,F)srp.gamemaster.SetEntityStats(a,n,'damage',math.Clamp(F,1,a:IsSeniorGamemaster()&&999999||15000),true)end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Gamemaster'):SetInfo('Sets the npc damage of a specific NPC class and for all spawned NPCs of that type. This works for base classes too.\nClass names can be found by right clicking an NPCs spawn icon and pressing Copy to Clipboard.\n\nFrom 1 to 15000. 999999 limit for SGM+'):SetInfoArgs({'Class - Class name of NPC','Damage - The damage to set'}):SetGM()srp.AddCommand('setlvsteam',function(a,n,G)local z=srp.allegiance.Get(G:upper(),true)if!z then return end;local H=scripted_ents.Get(n)if!H||!H.LVS then return end;srp.gamemaster.SetEntityStats(a,n,'SetAITEAM',z.internal,true)end):AddParam(cmd.WORD):AddParam(cmd.WORD):AddAlias('setlfsteam'):SetInfoSection('Gamemaster'):SetInfo('Sets the LVS vehicle class to the specific team.\nClass names can be found by right clicking an LVS vehicle spawn icon and pressing Copy to Clipboard.'):SetInfoArgs({'Class - Class name of LVS vehicle','Team - The team to set (REPUBLIC/CIS)'}):SetGM()srp.AddCommand('setnpcweaponspread',function(a,I,J)srp.gamemaster.SetNPCWeaponStats(a,I,'NPCSpread',math.Clamp(J,1,180),true)end):AddParam(cmd.STRING):AddParam(cmd.UINT):SetInfoSection('Gamemaster'):AddAlias('setwepspread'):SetInfo('Sets the weapon spread of a specific weapon class and for all weapons of that class in use by an NPC.\nClass names can be found by right clicking a weapons spawn icon and pressing Copy to Clipboard.\n\nFrom 0 to 60'):SetInfoArgs({'Class - Class name of Weapon','Spread - The spread to set'}):SetGM()srp.AddCommand('setnpcweaponburst',function(a,I,K,L)local M=weapons.GetStored(I)if!M then return end;local N=M.Primary.ClipSize;K=math.Clamp(K,0,N)L=math.Clamp(L,K,N)srp.gamemaster.SetNPCWeaponStats(a,I,'NPCMinShots',K,true)srp.gamemaster.SetNPCWeaponStats(a,I,'NPCMaxShots',L,true)end):AddParam(cmd.STRING):AddParam(cmd.UINT):AddParam(cmd.UINT):AddAlias('setwepburst'):SetInfoSection('Gamemaster'):SetInfo('Sets how many rounds an NPC will fire of a specific weapon class and for all weapons of that class in use by an NPC.\nClass names can be found by right clicking a weapons spawn icon and pressing Copy to Clipboard.\n\nFrom 0 to the weapons magazine size.'):SetInfoArgs({'Class - Class name of Weapon','Min - The NPC will fire at least these many rounds before rest','Max - The NPC will fire at most these many rounds before rest'}):SetGM()srp.AddCommand('setnpcweaponcooldown',function(a,I,K,L)local M=weapons.GetStored(I)if!M then return end;K=math.Clamp(K,1,60)L=math.Clamp(L,K+1,61)srp.gamemaster.SetNPCWeaponStats(a,I,'NPCRestTimeMin',K,true)srp.gamemaster.SetNPCWeaponStats(a,I,'NPCRestTimeMax',L,true)end):AddParam(cmd.STRING):AddParam(cmd.UINT):AddParam(cmd.UINT):AddAlias('setwepcooldown'):SetInfoSection('Gamemaster'):SetInfo('Sets the weapon wait time between shots of a specific weapon class when used by an NPC.\nClass names can be found by right clicking a weapons spawn icon and pressing Copy to Clipboard.\n\nFrom 1 to 60 seconds.'):SetInfoArgs({'Class - Class name of Weapon','Min - The NPC will rest for at least these many seconds before firing in seconds','Max - The NPC will rest for at most these many seconds before firing in seconds'}):SetGM()srp.AddCommand('setnpcweapondamage',function(a,I,F)F=math.Clamp(F,1,a:IsSeniorGamemaster()&&999999||20000)srp.gamemaster.SetNPCWeaponStats(a,I,'Damage',F,true)end):AddParam(cmd.STRING):AddParam(cmd.UINT):AddAlias('setweapondamage'):SetInfoSection('Gamemaster'):SetInfo('Sets the damage of this weapon class when used by an NPC.'):SetInfoArgs({'Class - Class name of Weapon','Damage - How much damage it does. Max 999999 damage for SGM+ and 20000 for everyone else.'}):SetGM()srp.AddCommand('eventroom',function(a)a:SetPos(Vector(-1601,8088,-15157))end):SetInfoSection('Gamemaster'):SetInfo('Takes you to the event room.'):SetGM()srp.AddCommand('arena',function(a)a:SetPos(Vector(-4944,-2848,-13776))end):SetInfoSection('Gamemaster'):SetInfo('Takes you to the arena room.'):SetFlag'*'srp.AddCommand('eventroomdark',function(a)a:SetPos(Vector(7988,9093,-15167))end):SetInfoSection('Gamemaster'):SetInfo('Takes you to the dark event room.'):SetGM()srp.AddCommand('eventskybox',function(a)a:SetPos(Vector(639,2558,-15567))end):SetInfoSection('Gamemaster'):SetInfo('Takes you to the skybox.'):SetGM()srp.AddCommand('eventcontrol',function(a)a:SetPos(Vector(1976,14174,-14130))end):AddAlias('controlroom'):SetInfoSection('Gamemaster'):SetInfo('Takes you to the control room. This is the room with a lot of map buttons.'):SetGM()srp.AddCommand('eventbroadcast',function(a)a:SetPos(Vector(2249,6576,-15039))end):SetInfoSection('Gamemaster'):SetInfo('Takes you to the broadcast room.'):SetGM()srp.AddCommand('gamemaster',function(a,O)if O then chat.Send('Gamemaster',a,O)srp.xchat.Send('Gamemaster',{gid=a:GetNetVar('srp.groups.id'),aid=a:GetAllegianceID(),name=a:GetTag()..' '..a:Nick(),message=O,emote=a:IsVIP()})end end):AddParam(cmd.STRING):AddAlias('gm'):SetInfoSection('Gamemaster'):SetInfo('A private chat room for all gamemasters. This is displayed on all servers.'):SetInfoArgs({'Message - The message to display'}):SetGM()srp.AddCommand('setchatcolor',function(P,f,Q,R,S)local T=f:IsEventCharacter()if T then local U=Color(math.Clamp(Q,0,255),math.Clamp(R,0,255),math.Clamp(S,0,255))f:SetChatColor(U)end end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.UINT):AddParam(cmd.UINT):AddParam(cmd.UINT):SetInfoSection('Gamemaster'):SetInfo('Sets the specified target\'s chat colour. Uses RGB values.'):SetInfoArgs({'Target - The SteamID/Name','R - Red 0-255','G - 0-255','B - 0-255'}):SetGM()srp.AddCommand('removechatcolor',function(P,f)f:SetChatColor(nil)end):AddParam(cmd.PLAYER_ENTITY):SetInfoSection('Gamemaster'):SetInfo('Resets the chat colour of the specified player.'):SetInfoArgs({'Target - The SteamID/Name'}):SetGM()srp.AddCommand('describetarget',function(a,f,V)chat.Send('DescriptionTarget',a,f,V)end):SetUseJailed():AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING):AddAlias('describepm'):AddAlias('desctarget'):AddAlias('descpm'):SetInfoSection('Gamemaster'):SetInfo('Sends a descriptive message in chat to people around you along with the target regardless of their range.'):SetInfoArgs({'Target - Player to force send to','Message - The message to display'}):SetGM()srp.AddCommand('describe',function(a,V)chat.Send('Description',a,V)end):SetUseJailed():AddParam(cmd.STRING):AddAlias('desc'):SetInfoSection('Gamemaster'):SetInfo('Sends a descriptive message in chat to people around you.'):SetInfoArgs({'Message - The message to display'}):SetGM()srp.AddCommand('describeall',function(a,V)chat.Send('DescriptionAll',a,V)end):SetUseJailed():AddParam(cmd.STRING):AddAlias('descall'):SetInfoSection('Gamemaster'):SetInfo('Sends a descriptive message in chat to the whole server.'):SetInfoArgs({'Message - The message to display'}):SetGM()srp.AddCommand('describegroup',function(a,W,V)local X=srp.groups.Get(W)if X then chat.Send('DescriptionGroup',a,V,X)end end):SetUseJailed():AddParam(cmd.WORD):AddParam(cmd.STRING):AddAlias('desgroup'):SetInfoSection('Gamemaster'):SetInfo('Sends a descriptive message in chat to everyone in this group.'):SetInfoArgs({'GroupID - The group to send this descibe to.','Message - The message to display.'}):SetGM()srp.AddCommand('describeroom',function(a,V)chat.Send('DescriptionRoom',a,V)end):SetUseJailed():AddParam(cmd.STRING):AddAlias('desroom'):SetInfoSection('Gamemaster'):SetInfo('Sends a descriptive message in chat to the room you are in.'):SetInfoArgs({'Message - The message to display'}):SetGM()local Y=CurTime()srp.AddCommand('freezeprops',function(a)if CurTime()-Y<15 then return end;local Z=ents.GetAll'prop_physics'for s=1,#Z do local _=Z[s]if!IsValid(_)then continue end;local a0=_:GetPhysicsObject()if!IsValid(a0)then continue end;a0:EnableMotion(false)end;Y=CurTime()srp.notif.NeutralAll(3,term.Get('AllPropsFrozen'),a:Nick(),a:SteamID())end):SetInfoSection('Gamemaster'):SetInfo('Freezes all entites on the server. Useful to help with lag or prevent a physics crash.'):SetGM()srp.AddCommand('cleanupmyroom',function(a)local a1=a:GetLocation()if!a1||a1.default then return end;for e,_ in ents.Iterator()do local a2=_:GetPropOwner()if a2==a&&!(_:IsPlayer()||_:IsWeapon())then local a3=_:GetLocation()if a3.name==a1.name then _:Remove()end end end;hook.Run('OnPlayerCleanedupRoom',a,a1,false)end):SetInfoSection('Gamemaster'):SetInfo('Cleans up all of your spawned enties in the current room.'):SetGM(true)srp.AddCommand('cleanuproom',function(a)local a1=a:GetLocation()if!a1||a1.default then return end;for e,_ in ents.Iterator()do if _.PropOwnerID then local a3=_:GetLocation()if a3.name==a1.name&&!(_:IsPlayer()||_:IsWeapon())then _:Remove()end end end;hook.Run('OnPlayerCleanedupRoom',a,a1,true)end):SetInfoSection('Gamemaster'):SetInfo('Cleans up all entites in your room.'):SetGM()srp.AddClientCommand('viewgms',function(a)srp.ui.Create'srp_gamemasters'end):AddAlias('gmlist'):SetInfoSection('Gamemaster'):SetInfo('View all online Gamemasters.')srp.AddCommand('setprice',function(a,a4)local a5=a:GetEyeTraceNoCursor().Entity;if!IsValid(a5)then return end;if a5.IsGamblingMachine&&!a5.IsRolling then local a4=math.Clamp(a4,500,a5.SpinWheel&&150000||300000)local a6=Format('[%s] sid: %s. cid: %s. machine: %s. from: %s. to: %s.\n',os.date(),a:SteamID(),a:CharacterID(),a5,a5:Getprice(),a4)a5:Setprice(a4)print(a6)file.Append('money/'..a:SteamID64()..'.txt',a6)end end):AddParam(cmd.UINT):AddAlias'price':SetGM():SetInfoSection('Gambling'):SetInfo('Set a price for gambling machine.')srp.AddCommand('resetprice',function(a,a4)local a5=a:GetEyeTraceNoCursor().Entity;if!IsValid(a5)||!a5.IsGamblingMachine||a5.IsRolling then return end;local a7=a5.DefaultPrice||10000;a5:Setprice(a7)local a6=Format('[%s] sid: %s. cid: %s. machine: %s. from: %s. to: %s (RESET).\n',os.date(),a:SteamID(),a:CharacterID(),a5,a5:Getprice(),a7)print(a6)file.Append('money/'..a:SteamID64()..'.txt',a6)end):AddParam(cmd.UINT):AddAlias'price':SetGM():SetInfoSection('Gambling'):SetInfo('Set the default price for gambling machines.')hook('PlayerGamble','changedMoney',function(a,_,a8,a4,a9)local aa=Format('[%s (%s)] %s (%s): %s won: %s (pre wallet: %s)\n',os.date(),tostring(_),a:Nick(),a:SteamID(),string.Comma(a4),a9,string.Comma(a8))print(aa)file.Append('gamba.txt',aa)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/containers/containers_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/domination/ui/dominationinfo_ui.lua:
local a={}function a:Init()self:SetBackgroundColor(col.white_dark)self:SetTitle'Capture Zone Information'self:SetSize(400,260)self:Center()self:MakePopup()self:AddPanel('srp_label',function(b)b:Dock(TOP)b:SetText'Letter'b:SetFont'ui_label.rb'b:SetTextColor(col.grey_light)end)self:AddPanel('srp_textinput',function(c)c:Dock(TOP)c:SetText'A'c:SetMinMax(1,2)c:SetBackgroundColor(col.white_dark)c:SetTextColor(col.grey_dark)self.letter=c end)self:AddPanel('srp_label',function(b)b:Dock(TOP)b:SetText'Name'b:SetFont'ui_label.rb'b:SetTextColor(col.grey_light)end)self:AddPanel('srp_textinput',function(c)c:Dock(TOP)c:SetText'A'c:SetMinMax(0,50)c:SetBackgroundColor(col.white_dark)c:SetTextColor(col.grey_dark)self.name=c end)self:AddPanel('srp_label',function(b)b:Dock(TOP)b:SetText'Radius'b:SetFont'ui_label.rb'b:SetTextColor(col.grey_light)end)self:AddPanel('srp_textinput',function(c)c:Dock(TOP)c:SetText'400'c:SetNumeric()c:SetMinMax(1,4)c:SetBackgroundColor(col.white_dark)c:SetTextColor(col.grey_dark)self.radius=c end)self:AddPanel('srp_button_rounded',function(d)d:Dock(BOTTOM)d:SetText'Update'd:SetBackgroundColor(col.blue)d:LeftClick(function()if IsValid(self.Entity)then net.Start'srp.domination.SetInfo'net.WriteEntity(self.Entity)net.WriteString(self.name:GetText())net.WriteString(self.letter:GetText())net.WriteUInt(tonumber(self.radius:GetValue()),12)net.SendToServer()end end)end)end;function a:Populate(e)self.Entity=e;self.letter:SetText(e:GetZoneLetter())self.name:SetText(e:GetZoneName())self.radius:SetText(e:GetZoneRadius())end;vgui.Register('srp_capturezoneinfo',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/fog/fov_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gifts/gifts_sh.lua:
gifts=gifts||{}local a={}local b={}function gifts.Add(c,d)d.id=c;d.Name=d.Name||c;d.Material=Material(d.Icon,'smooth noclamp')d.internal=table.insert(b,d)a[c]=d;srp.triumphs.Create('winter_g_'..c,false):SetName('The '..d.Name..' gifter!'):SetDescription'The most generous person around.':SetMaterial(d.Icon||'materials/galactic/seasonal/christmas/present.png','smooth noclamp'):SetMaterialColor(col.white):SetSpotlightCompletedColor(col.blue):SetSpotlightColor(col.blue_dark):SetOutline(gold):SetColor(col.orange):SetMenuSection'Seasonal':SetGrouped'Winter':FastSave():AddObjective('Gifted','Send Gifts',d.GiftCount||2)end;function gifts.Get(c,e)return e&&b[c]||a[c]end;function gifts.GetAll(f)return f&&b||a end;function gifts.ReadGift()return gifts.Get(net.ReadUInt(12),true)end;function gifts.WriteGift(g)return net.WriteUInt(istable(g)&&g.internal||g,12)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gifts/ui/giftstore_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/orgs/orgs_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupinvite_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groups_ui.lua:
local a={}local b=Color(150,150,150,50)local c=col.blue:Copy()c.a=100;function a:Init()self:DockMargin(0,0,0,0)self:DockPadding(0,0,0,0)self:SetBackgroundColor(col.grey)self:ShowGroups()hook('OnCharacterSelected',self,self.ShowGroups)end;function a:OnRemove()hook.Remove('OnCharacterSelected',self)end;function a:ShowGroup(d)local e=srp.groups.Get(d)if!e then return end;self:Clear()self:AddPanel('srp_groupview',function(f)f:Dock(FILL)f:SetGroup(e)end)end;function a:ShowCharacter(e,g)self:AddPanel('srp_panel',function(h)h:DockMargin(0,0,0,0)h:DockPadding(0,0,0,0)h:SetBackgroundColor(col.white_dark)h:SetSize(self:GetSize())h:SetPos(0,0)h:AddPanel('srp_groupcharacteroverv',function(f)f:Dock(FILL)f:Setup(h,e,g)end)end)end;function a:ShowAgenda(e)self:AddPanel('srp_panel',function(h)h:DockMargin(0,0,0,0)h:DockPadding(0,0,0,0)h:SetBackgroundColor(col.white_dark)h:SetSize(self:GetSize())h:SetPos(0,0)h:AddPanel('srp_groupagenda',function(f)f:Dock(FILL)f:Setup(h,e)end)end)end;function a:DisplayTryouts(i)local j=ents.FindByClass('rp_roominf*')for k,l in ipairs(j)do local m=l:GetClaimedPlayer()if!IsValid(m)then continue end;local info=l.Types[l:GetInfoType()]if!info then continue end;local e=m:GetGroup()if!e then continue end;e=e:GetParent(true)if info.Name=='TRYOUTS'then local n='ui_label.r'local o=e.name..' ('..e.id..') is recruiting!'surface.SetFont(n)local p,q=surface.GetTextSize(o)local r=l:GetDescription()r=(!r||r=='')&&'No information was given'||r;srp.ui.Create('srp_button_rounded',function(f)f:SetSize(p+25,20)f:SetBackgroundColor(e:GetAltColor())f:SetHoverColor(e.color)f:SetContentAlignment(5)f:SetFont(n)f:SetText(o)f:LeftClick(function(s)s:SetDisabled(true,4)srp.ui.Create('srp_window',function(t)t:MakePopup()t:MoveToFront()t:SetTitle'Tryout information't:SetBackgroundColor(col.midnight_dark)t:SetSize(350,400)t:Center()t:AddPanel('srp_label',function(u)u:Dock(TOP)u:SetText('This battalion is hosting a tryout. Get in touch with them if you\'re interested in joining them!\nThis is what they have to say:\n')u:SetTextColor(col.white)u:SetFont'ui_header.s'u:SetContentAlignment(7)u:DockMargin(4,4,4,4)u:SetTall(80)u:SetWrap(true)end)t:AddPanel('srp_label',function(u)u:Dock(FILL)u:SetText(r)u:SetTextColor(col.white)u:SetFont'ui_header.s'u:SetContentAlignment(7)u:DockMargin(4,4,4,4)u:SetWrap(true)end)t:AddPanel('srp_button_rounded',function(v)v:Dock(BOTTOM)v:SetText('Close')v:SetTextColor(col.white)v:DockMargin(4,2,4,2)v:SetBackgroundColor(col.midnight)v:LeftClick(function(s)t:Remove()end)end)if!LocalPlayer():GetGroupRank()||!LocalPlayer():GetGroupRank():HasPermission('invite')then t:AddPanel('srp_button_rounded',function(v)v:Dock(BOTTOM)v:SetText('Show location')v:SetTextColor(col.white_dark)v:SetBackgroundColor(col.midnight_light)v:DockMargin(4,2,4,2)v:LeftClick(function(s)t:Remove()srp.ui.MarkPOI(l:GetPos()+Vector(0,0,45),120)srp.ui.AimTowards(l:GetPos())end)end)end end)end)i:AddItem(f)end)end end end;function a:ShowPanel(d,w,e)self:AddPanel('srp_panel',function(h)h:DockMargin(0,0,0,0)h:DockPadding(0,0,0,0)h:SetBackgroundColor(col.midnight)h:SetSize(self:GetSize())h:SetPos(0,0)h.Think=function(s)if s:HasFocus()&&input.IsKeyDown(KEY_BACKSPACE)then s:Remove()end end;h:AddPanel('srp_panel',function(f)f:Dock(TOP)f:SetTall(30)f:DockPadding(0,0,0,0)f:DockMargin(0,0,0,0)f:SetBackgroundColor(e:GetColor())f:AddPanel('srp_label',function(x)x:SetText(w)x:SetFont'ui_button.l'x:Dock(FILL)x:DockMargin(4,0,4,0)self.name=x end)f:AddPanel('srp_button_rounded',function(v)v:SetFont'SSRPForkAwesome'v:SetText(0xf104,true)v:SetWide(35)v:Dock(LEFT)v:DockMargin(0,0,0,0)v:DockPadding(0,0,0,0)v:SetBackgroundColor(buttonColor)v:SetHoverColor(buttonHoverColor)v:SetBorderColor(col.transparent)v:LeftClick(function(v)h:Remove()end)end)end)h:AddPanel(d,function(f)f:Dock(FILL)f:Setup(e)end)end)end;function a:ShowGroups()self:Clear()self:AddPanel('ui_scrollpanel',function(y)y:Dock(FILL)y:HideScrollbar(true)srp.ui.Create('srp_grid',function(i)i:SetAutoHeight(info.CWRP)i:DockPadding(0,0,0,0)i:SetAdjusted(info.CWRP,true)i:SetSpacing(15,12)i:SetParent(y:GetCanvas())i:Dock(TOP)srp.ui.Create('srp_panel_rounded',function(f)f:SetBackgroundColor(col.midnight)f:SetSize(980,160)f:DockPadding(0,0,0,0)f:DockMargin(0,0,0,0)f:AddPanel('srp_label',function(x)x:Dock(TOP)x:SetText'BATTALIONS'x:SetFont'ui.20'x:SetContentAlignment(4)x:SetTall(35)x:SetTextColor(col.white)x:DockPadding(0,0,0,0)x:DockMargin(0,0,0,0)x:SetTextInset(10,0)x.Paint=function(s,z,A)draw.RoundedBox(0,0,0,z,A,col.midnight_dark)draw.Box(0,20,z,A-20,col.midnight_dark)end end)f:AddPanel('srp_label',function(x)x:Dock(TOP)x:SetContentAlignment(7)x:SetWrap(true)x:SetText'Join a battalion to further your experience with the server and meet new friends.\nBe sure to keep an eye on chat for tryout times and locations or ask an Officer in that battalion for help.\n\nAny claimed tryout rooms will show below.'x:SetFont'ui.16'x:SetTextColor(col.white_dark)x:SetTall(65)x:DockMargin(10,10,10,10)end)f:AddPanel('srp_grid',function(i)i:Dock(FILL)i:DockMargin(10,10,10,10)self:DisplayTryouts(i)end)i:AddItem(f)end)local B=srp.groups.GetAll(true)for C,e in ipairs(B)do if e:GetHidden()||e:GetParent()||e:GetAllegianceID()!=LocalPlayer():GetAllegianceID()then continue end;srp.ui.Create('srp_groupplate',function(f)f:SetGroup(self,e)i:AddItem(f)end)end;self.grid=i end)self.scroll=y end)self:InvalidateLayout(true)end;vgui.Register('srp_groups',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/z_hexmatch_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/z_trivia_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hangars/hangar_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/emotes/emote_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/marker/markers_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/notifications/notify_sh.lua:
function PLAYER:Notify(a,b)if!b then return end;if SERVER then else srp.notif.Add(a||1,3,b)end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/voting/voting_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/inventory/ui/container_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/inventory/ui/item_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/items/affixes/affixes_cl.lua:
srp.affixes=srp.affixes||{}net('srp.affixes.SyncAll',function()local a=net.ReadEntity()local b={}while true do local c=net.ReadUInt(7)if c==0 then break end;local d=srp.affixes.Get(c,true)b[d.id]=net.ReadFloat()end;a.Affixes=b end)net('srp.affixes.Sync',function()local a=net.ReadEntity()if!a.Affixes then a.Affixes={}end;local c=net.ReadUInt(7)local d=srp.affixes.Get(c,true)a.Affixes[c]=net.ReadFloat()end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/ui/bailrow_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/ui/ticketline_ui.lua:
local a={}local b=Color(0,0,0,100)local c=Color(0,0,0,5)local d=Color(255,255,255,50)local e=col.red_dark;local f=col.purple;local g={[0]={'Citation',col.purple},[1]={'Bail Paid',col.blue_dark},[2]={'Warrant',col.orange},[3]={'Jailed',col.red_dark,jailed},[4]={'Void',col.grey_light}}function a:Init()self:SetTall(40)self:SetBackgroundColor(b)self:DockPadding(0,0,0,0)self:AddPanel('srp_panel',function(h)h:Dock(TOP)h:DockMargin(0,0,0,0)h:DockPadding(0,0,0,0)h:SetTall(40)h:SetBackgroundColor(col.transparent)h:AddPanel('srp_button_rounded',function(i)i:Dock(LEFT)i:SetWide(80)i:SetText''i:SetMouseInputEnabled(false)i:SetContentAlignment(5)self.status=i end)h:AddPanel('srp_label',function(i)i:Dock(LEFT)i:SetText''i:SetWide(200)i:SetMouseInputEnabled(false)self.name=i end)h:AddPanel('srp_label',function(i)i:Dock(LEFT)i:SetWide(200)i:SetText''i:SetMouseInputEnabled(false)i:SetContentAlignment(4)self.reason=i end)h:AddPanel('srp_label',function(i)i:Dock(LEFT)i:SetWide(150)i:SetText''i:SetMouseInputEnabled(false)i:SetContentAlignment(4)self.date=i end)h:AddPanel('srp_label',function(i)i:Dock(LEFT)i:SetWide(100)i:SetMouseInputEnabled(false)i:SetContentAlignment(4)i:SetText('00:00:00')i:SetVisible(false)self.duration=i end)h:AddPanel('srp_button_rounded',function(j)j:SetBackgroundColor(b)j:SetHoverColor(col.grey_dark)j:SetFont'SSRPForkAwesome'j:SetText(0xf107,true)j:SetWide(32)j:DockMargin(2,0,0,0)j:Dock(RIGHT)j.maximised=false;j:LeftClick(function(k)k.maximised=!k.maximised;if k.maximised then j:SetText(0xf106,true)self:Maximise()else j:SetText(0xf107,true)self:Minimise()end end)end)h:AddPanel('srp_button_rounded',function(j)j:SetBackgroundColor(b)j:SetHoverColor(col.ui_close_bg)j:SetFont'ui_button_close'j:SetText(0xf1f8,true)j:SetWide(32)j:DockMargin(0,0,0,0)j:Dock(RIGHT)j:SetVisible(false)j:LeftClick(function()cmd.Run('ticketdelete',self.ticketid)end)self.remove=j end)h:AddPanel('srp_button_rounded',function(j)j:SetBackgroundColor(col.red_dark)j:SetHoverColor(col.red_dark)j:SetText'Non co-operative'j:SetWide(100)j:DockMargin(5,10,5,10)j:Dock(RIGHT)j:SetVisible(false)self.cooperative=j end)end)self:AddPanel('srp_panel',function(h)h:SetBackgroundColor(c)h:SetBorderColor(col.grey_light)h:Dock(FILL)h:SetVisible(false)h:DockMargin(1,2,1,2)h:DockPadding(5,5,5,5)h:AddPanel('srp_panel',function(h)h:DockMargin(0,0,0,0)h:DockPadding(0,0,0,00)h:Dock(FILL)h:SetBackgroundColor(col.transparent)h:AddPanel('srp_label',function(i)i:Dock(TOP)i:SetText('Description')i:SetFont('ui_label.rb')i:SetTextColor(col.grey_dark)i:SetTall(15)end)h:AddPanel('srp_label',function(i)i:SetText''i:SetTextColor(col.grey_dark)i:Dock(FILL)i:SetContentAlignment(7)i:SetWrap(true)self.description=i end)end)h:AddPanel('srp_grid',function(l)l:Dock(RIGHT)l:SetWide(310)l:SetBackgroundColor(col.grey_light)l:AddItem(srp.ui.Create('srp_label',function(i)i:SetText('Involved Officers')i:SetFont('ui_label.rb')i:SetTextColor(col.grey_dark)i:SetSize(300,15)end))self.officers=l end)self.info=h end)hook('OnJailTicketStatusChanged',self,self.OnStatusChanged)end;function a:Maximise()self:SetTall(240)self:GetParent():GetParent():InvalidateLayout(true)self.info:SetVisible(true)end;function a:Minimise()self:SetTall(40)self:GetParent():GetParent():InvalidateLayout(true)self.info:SetVisible(false)end;function a:SetStatus(m)local n=g[m]||g[0]self.status:SetText(Format('%04i',self.citation.id)..' '..n[1])self.status:SetBackgroundColor(n[2])self.citation.status=m;self.remove:SetVisible(m<4&&self.ticketid>6)end;function a:OnStatusChanged(m,n)if m==self.ticketid then self:SetStatus(n)end end;function a:OnRemove()hook.Remove('OnJailTicketStatusChanged',self)end;function a:Populate(o,p)self.ticketid=p.id;self.selected=o.characterid==p.criminal.characterid;self.character=o;self.citation=p;self.name:SetText('CT '..p.criminal.characterid..' '..p.criminal.name)local q=srp.jail.GetReason(p.reasonid,true)local r=q.sevdata.color;if q then self.reason:SetText(q.name)self.reason:SetTextColor(r)end;self.description:SetText(p.description)self.date:SetText(p.added)self:SetStatus(p.status)self.cooperative:SetVisible(!p.cooperative)if p.status==2||p.status==3 then self.duration:SetText(string.NiceTime(p.duration||0))self.duration:SetVisible(true)end;local s=false;self:AddOfficer(p.issuer)for m,t in ipairs(p.officers)do self:AddOfficer(t)if p.jailer&&p.jailer.characterid==t.characterid then s=true end end;if!s&&jailerid then self:AddOfficer(p.jailer)end end;function a:AddOfficer(t)local p=self.citation;srp.ui.Create('srp_button_rounded',function(j)local u=t.characterid==p.jailerid&&e||t.characterid==p.issuerid&&f||d;local v=u:IsLight()j:SetSize(150,28)j:DockMargin(0,0,0,0)j:SetText(t.characterid..' '..t.name)j:SetTextColor(v&&col.grey_dark||col.white)j:SetContentAlignment(4)j:SetBackgroundColor(u)j:SetHoverColor(u)j:AddPanel('ui_imagebutton',function(w)w:Dock(LEFT)w:DockMargin(1,1,5,1)w:SetWide(26)w:SetSkin'SUP'w:SetSteamID64(util.SteamIDTo64(t.steamid),64)end)j:LeftClick(function()gui.OpenURL('https://superiorservers.co/profile/'..t.steamid)end)self.officers:AddItem(j)end)end;function a:Paint(x,y)draw.Box(0,0,x,40,b)if!self.citation then return end;local r=self.citation.status==4&&col.grey||self.selected&&col.blue_light||col.transparent;draw.Box(0,0,(self:IsHovered()||self:IsChildHovered(true))&&2||1,40,r)end;vgui.Register('srp_ticketline',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loginrewards/ui/loginrewards_ui.lua:
local a={}local b={}local c=Color(150,150,150,222)local d=Material'materials/galactic/sup_starfield.png'local function e(self,f,g)surface.DisableClipping(true)surface.SetDrawColor(self.SkewColor||c)local h,i=self:GetDockPadding()local j=self.skew||15;self.poly=self.poly||{{x=-j-h,y=-i},{x=f+h-j,y=-i},{x=f+h+j,y=g+i},{x=j-h,y=g+i}}draw.NoTexture()surface.DrawPoly(self.poly)surface.DisableClipping(false)end;function a:Init()local f,g=ScrW(),ScrH()local k,l=f*.1,g*.1;self:SetSize(f,g)self:SetPos(0,0)self:DockPadding(k,l,k,l)self:MoveToFront()self:MakePopup()self:SetAlpha(0)self:AlphaTo(255,.5,0)self:AddPanel('srp_modelpanel',function(m)m:SetSize(f,g)m:SetPos(0,0)m:SetMouseInputEnabled(false)m:SetCamPos(Vector(150,30,0))m:SetLookAt(Vector(0,30,0))m:SetFOV(40)m:AddPanel('srp_panel',function(n)n:DockMargin(0,0,0,0)n:SetBackgroundColor(Color(0,0,0,100))n:Dock(FILL)n:SetMouseInputEnabled(false)end)self.mdl=m end)self:AddPanel('srp_panel',function(n)n:Dock(RIGHT)n:SetWide(f*.35)n:DockPadding(10,10,10,10)n:DockMargin(0,g*.1,0,g*.1)n:SetBackgroundColor(col.transparent)self.gridwidth=f*.35-20;n:AddPanel('srp_loginrewardmilestone',function(n)n:Dock(FILL)self.milestone=n end)n:AddPanel('srp_grid',function(o)o:Dock(BOTTOM)o:SetTall(170)o:SetSpacing(0,0,0)self.grid=o end)n:AddPanel('srp_label',function(p)p:SetText'Choose a reward to keep'p:SetFont'ui_label.l'p:Dock(BOTTOM)p:SetContentAlignment(5)p:DockMargin(50,0,50,0)p:DockPadding(5,5,0,0)p.SkewColor=Color(50,50,50,255)p.Paint=e end)self.container=n end)self:AddPanel('srp_label',function(p)p:SetText'You\'ve been rewarded for logging in today. Come back each day to receive another reward!'p:SetSize(700,80)p:SetFont'ui_header.r'p:SetMouseInputEnabled(false)p:MoveToFront()p:SetContentAlignment(5)p:DockPadding(-5,0,0,0)p.Paint=e;self.description=p end)self:AddPanel('srp_label',function(p)p:SetText'Daily Login Rewards'p:SetSize(512,100)p:SetFont'ui_header.xl'p:SetMouseInputEnabled(false)p:MoveToFront()p:SetContentAlignment(5)p:DockPadding(-5,-10,0,0)p.Paint=e;self.title=p end)if info.Dev then self:AddPanel('srp_button_rounded',function(q)q:SetText'Exit'q:SetSize(128,32)q:SetPos((f-128)/2,g-32-32)q:LeftClick(function(r)self:AlphaTo(0,.2,0,function()self:Remove()end)end)self.close=q end)end;hook('OnDailRewardClaimed',self,self.Unlocked)end;function a:Unlocked(s)self:AlphaTo(0,.5,.2,function()if IsValid(self)then self:Remove()end end)end;function a:OnRemove()hook.Remove('OnDailRewardClaimed',self)end;function a:Populate(t,u,v,w)local x=self.mdl:AddModel(LocalPlayer():GetModel(),Vector(0,0,-15),Angle(0,35,0))x:SetRenderMode(RENDERMODE_TRANSALPHA)x:SetRenderFX(kRenderFxHologram)x:SetColor(col.white)self.player=x;local y=#u;local z=self.gridwidth/y-1*y-2;self.grid:SetTall(z+22)for s,A in ipairs(u)do srp.ui.Create('srp_loginreward',function(n)n:SetSize(z,z)n:Populate(s,A)self.grid:AddItem(n)end)end;self.milestone:SetDays(t)self.milestone:SetMilestone(v,w)end;function a:Think()if!IsValid(self.player)then return end;local B=self.player:LookupSequence'sit_zen'if B>0 then self.player:ResetSequence(B)end end;function a:PerformLayout(f,g)if IsValid(self.title)then self.title:SetPos(f*.1,(g-150)*.5)end;if IsValid(self.description)then self.description:SetPos(f*.1,(g-150)*.5+92)end end;function a:Paint(f,g)draw.Box(0,0,f,g,col.grey_dark)surface.SetDrawColor(255,255,255,50)surface.SetMaterial(d)surface.DrawTexturedRect(0,0,f,g)end;vgui.Register('srp_loginrewards',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/mapchange/mapchange_cl.lua:
srp.map=srp.map||{}net('srp.map.Blacklists',function()local a={}while true do local b=net.ReadString()if b==''then break end;local c=net.ReadBool()local d=net.ReadString()local e=net.ReadString()a[b]={blacklisted=c,steamid=d,reason=e}end;hook.Run('OnMapBlacklistLoaded',a)end)net('srp.map.Blacklist',function()hook.Run('OnMapBlacklistLoaded',{[net.ReadString()]={blacklisted=net.ReadBool(),steamid=net.ReadString(),reason=net.ReadString()}})end)net('srp.map.StartVote',function()local f=net.ReadString()local g=net.ReadUInt(4)local h=srp.map.maps[f]if!h then return end;srp.notif.FlashConfirm('changemap','Change Map','A pending map vote for '..h.name..' is waiting for you.',30,'Vote Yes',function()net.Ping'srp.map.Vote'end)hook.Run('OnMapVoteStarted',h,g)end)net('srp.map.Vote',function()local i=net.ReadString()srp.notif.FlashConfirm('gmvoted_'..i,'GM Voted',i..' voted to change map.',10,'Close',function()end)hook.Run('OnMapVoted',i)end)net('srp.map.ShowMenu',function()srp.ui.Create('srp_mapchange')end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/permaprops/perma_sh.lua:
srp.permaprops=srp.permaprops||{}function srp.permaprops.CanEditPermaprops(a)if!info.MapInfo then return false end;if info.MapInfo.core then return a:IsDA(true)else return a:IsSeniorGamemaster()end end;function ENTITY:IsProp()return self:GetClass()=='prop_physics'end;srp.AddCommand('go',function(a)local b=a:GetShootPos()local c=a:GetAimVector()local d=ents.FindAlongRay(b+c*50,b+c*550,Vector(-1,-1,-1),Vector(1,1,1))local e=table.Filter(d,function(f)return f!=a&&f:GetParent()!=a&&!f.IgnoreGoCheck end)[1]if!IsValid(e)then return end;local g=e:GetPos()g=Format(' P: %f, %f, %f',g.x,g.y,g.z)local h=e:GetAngles()h=Format(' A: %f, %f, %f',h.p,h.y,h.r)local i=e.PropOwner;if IsValid(i)then srp.notif.Neutral(a,3,term.Get('PlayerOwnsEntity'),i:Nick(),i:SteamID(),e:GetClass(),e:EntIndex(),e:GetModel()..g..h)elseif e.PropOwnerID then srp.notif.Neutral(a,3,term.Get('PlayerOwnsEntity'),e.PropOwnerID,'OFFLINE',e:GetClass(),e:EntIndex(),e:GetModel()..g..h)elseif e.PermaPropID then srp.notif.Warning(a,3,term.Get('WorldOwnsEntityPermaProp'),e:GetClass(),e:EntIndex(),e:GetModel()..g..h)else srp.notif.Warning(a,3,term.Get('WorldOwnsEntity'),e:GetClass(),e:EntIndex(),e:GetModel()..g..h)end end):SetInfoSection('Perma Props'):SetInfo('Displays basic information about the currently aimed at entity.')srp.AddCommand('permapropsadd',function(a)local j=a:GetEyeTrace().Entity;if!IsValid(j)then return end;if!srp.permaprops.CanEditPermaprops(a)then return end;srp.permaprops.AddEntity(j,function(k,l)if k then srp.notif.Success(a,4,term.Get('PermaPropAdded'))else srp.notif.Warning(a,4,l||term.Get('UnknownError'),count,max_ents)end end)end):AddAlias('ppadd'):SetInfoSection('Perma Props'):SetInfo('Adds the currently aimed at Entity to the permaprops database.').CanRun=function(self,a)return srp.permaprops.CanEditPermaprops(a)end;srp.AddCommand('permapropsremove',function(a)local j=a:GetEyeTrace().Entity;if!IsValid(j)then return end;if!srp.permaprops.CanEditPermaprops(a)then return end;srp.permaprops.RemoveEntity(j,function(k,l)if k then srp.notif.Success(a,4,term.Get('PropRemoved'))else srp.notif.Warning(a,4,l||term.Get('UnknownError'))end end)end):AddAlias('ppremove'):SetInfoSection('Perma Props'):SetInfo('Removes the currently aimed at entity from the Permaprop database.').CanRun=function(self,a)return srp.permaprops.CanEditPermaprops(a)end;srp.AddCommand('permaprops',function(a,m)srp.permaprops.RemoveAll()srp.permaprops.LoadEntities(true,m)end):SetFlag'*':AddParam(cmd.STRING,cmd.OPT_OPTIONAL)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/spawnpoints/spawnpoints_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/nightvision/nightvision_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/npc/dialogues/dialogue_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/patrols/patrols_cl.lua:
srp.patrols=srp.patrols||{}local a='icon16/cross.png'function srp.patrols.StartMenu(b,c)if IsValid(srp.patrols.ui)then srp.patrols.ui:Remove()end;srp.ui.Create('srp_routeinfo',function(d)d:SetCount(b)d:SetProgress(c)srp.patrols.ui=d end)end;function srp.patrols.OnPatrolPlayersLoaded(e)if IsValid(srp.patrols.playerui)then srp.patrols.playerui:Remove()end;if!IsValid(srp.patrols.ui)then return end;local f=LocalPlayer():GetGroup()&&LocalPlayer():GetGroupRank():HasPermission('officer')local g=DermaMenu(false)local h,i=srp.patrols.ui:GetPos()g:SetPos(h,46)g:SetSkin'SRP_SUP'local j=g:AddOption('Close',function(k)srp.patrols.playerui:Remove()end)j:SetTextColor(col.white)for l,m in pairs(e)do if IsValid(m)then if f then local j,n=g:AddSubMenu(m:GetTag()..' '..m:Nick())n:SetTextColor(m:GetChatColor())local o=j:AddOption('Kick',function()net.Start'srp.patrols.KickPlayer'net.WritePlayer(m)net.SendToServer()end)o:SetTextColor(col.red)o:SetIcon(a)else local j=g:AddOption(m:GetTag()..' '..m:Nick())j:SetTextColor(m:GetChatColor())end end end;srp.patrols.playerui=g end;function srp.patrols.GetPlayers()net.Start'srp.patrols.GetPlayers'net.SendToServer()end;net('srp.patrols.GetPlayers',function()local p=net.ReadUInt(6)local e={}for q=1,p do table.insert(e,net.ReadPlayer())end;srp.patrols.OnPatrolPlayersLoaded(e)hook.Run('OnPatrolPlayersLoaded',e)end)net('srp.patrols.StartRoute',function()local r=net.ReadBool()if r&&net.ReadPlayer()==LocalPlayer()then srp.patrols.StartMenu(net.ReadUInt(10),net.ReadUInt(10))else srp.notif.FlashConfirm('joinpatrol','Join Patrol','Join a patrol and receive patrol updates!',90,'Join',function()net.Start'srp.patrols.Join'net.SendToServer()end)end end)net('srp.patrols.StartForcedRoute',function()srp.notif.FlashConfirm('joinpatrol','Join Patrol','Join a patrol and receive patrol updates!',90,'Join',function()net.Start'srp.patrols.Join'net.SendToServer()end)end)net('srp.patrols.Join',function()srp.patrols.StartMenu(net.ReadUInt(10),net.ReadUInt(10))end)net('srp.patrols.SetPosition',function()local b,c=net.ReadUInt(10),net.ReadUInt(10)if IsValid(srp.patrols.ui)then srp.patrols.ui:SetProgress(c)else srp.patrols.StartMenu(b,c)end;srp.notif.Neutral(3,Format('Patrol point completed %i of %i',c,b))end)net('srp.patrols.EndRoute',function()if IsValid(srp.patrols.ui)then srp.patrols.ui:FadeOut()end end)net('srp.patrols.KickPlayer',function()if IsValid(srp.patrols.ui)then srp.patrols.ui:Remove()end;srp.notif.Warning(3,'You were removed from the patrol by an officer.')end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/contextmenu_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/flashlight_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/binds/ui/binder_ui.lua:
local a={}local b=utf8.char(0xf1f8)local c=utf8.char(0xf10d)function a:Init()self:DockPadding(8,8,8,8)self:SetBackgroundColor(col.midnight_dark)self:SetBorderColor(col.grey_light)self:AddPanel('srp_button_rounded',function(d)d:DockMargin(0,0,5,0)d:Dock(LEFT)d:SetFont'ui.24'd:SetText'...'d:SetBackgroundColor(col.midnight)d:SetHoverColor(col.grey)d:LeftClick(function(e)input.StartKeyTrapping()e.Trapping=true;e:SetText'...'end)d.Think=function(e)if input.IsKeyTrapping()&&e.Trapping then local f=input.CheckKeyTrapping()if f then e:SetText(input.GetKeyName(f):upper())e.Trapping=false;self.Bind.Key=f;self:Save()end end end;self.Binder=d end)self:AddPanel('srp_panel',function(g)g:Dock(FILL)g:SetBackgroundColor(col.transparent)g:DockMargin(0,0,0,0)g:DockPadding(0,0,0,0)g:AddPanel('srp_panel',function(g)g:Dock(TOP)g:SetBackgroundColor(col.transparent)g:DockMargin(0,0,0,0)g:DockPadding(0,0,0,0)g:SetTall(35)g:AddPanel('srp_dropdown',function(g)g:SetText'Bind Type?'g:DockMargin(0,0,0,0)g:Dock(LEFT)g:SetWide(150)g:SetBackgroundColor(col.midnight)g:AddOption('Chat',{value=srp.binds.TYPE_CHAT})g:AddOption('Console Command',{value=srp.binds.TYPE_COMMAND})g:AddOption('Server Bind',{value=srp.binds.TYPE_GAME})g:OnSelect(function(e,h,i)if self.Bind&&self.Bind.Type==i.value then return end;if self.Bind.Type==srp.binds.TYPE_GAME then self.DefaultBind:SetValue'Server bind would you like to re-map?'end;self.Bind.Type=i.value;self:Save()end)self.Type=g end)g:AddPanel('srp_dropdown',function(g)g:SetText'Run When?'g:DockMargin(0,0,0,0)g:Dock(LEFT)g:SetWide(150)g:SetBackgroundColor(col.midnight)g:OnSelect(function(e,h,i)if self.Bind&&self.Bind.Condition==i.value then return end;self.Bind.Condition=i.value;self:Save()end)for j,k in SortedPairs(srp.binds.Conditions)do g:AddOption(j,{value=j})end;self.Condition=g end)g:AddPanel('srp_button_rounded',function(d)d:SetFont'ForkAwesome'd:SetContentAlignment(5)d:SetText(b)d:SetTooltip'Remove Bind'd:Dock(RIGHT)d:SetWide(40)d:DockMargin(0,0,0,0)d:LeftClick(function(e)self:Delete()end)self.Unbind=d end)g:AddPanel('srp_button_rounded',function(d)d:SetFont'ForkAwesome'd:SetContentAlignment(5)d:SetText(c)d:SetTooltip'Add Macro'd:Dock(RIGHT)d:SetWide(40)d:DockMargin(0,0,0,0)d:LeftClick(function(e)local l=ui.DermaMenu(e)l:SetSkin('SRP_SUP')for j,m in SortedPairs(srp.binds.Macros)do local n=l:AddOption(m.Description..(m.Optional&&' - Optional'||''),function()local o=self.Command:GetCaretPos()||0;local p=string.insert(self.Command:GetText(),j,o)self.Command:SetText(p)self.Command:OnTextChanged()self.Command:SetCaretPos(o+#j)end)n:SetTextColor(col.white)end;l:Open()end)self.Macros=d end)self.ContOptions=g end)g:AddPanel('srp_textinput_rounded',function(g)g:Dock(FILL)g:DockMargin(0,4,0,0)g:DockPadding(0,0,0,0)g:SetBackgroundColor(col.midnight_light)g:OnChanged(function(e)self.Bind.Command=e:GetValue()self:Save()end)self.Command=g end)g:AddPanel('srp_dropdown',function(g)g:SetText'Which server bind would you like to re-map?'g:SetVisible(false)g:Dock(BOTTOM)g:DockMargin(0,4,0,0)g:DockPadding(0,0,0,0)g:SetBackgroundColor(col.midnight_light)g:OnSelect(function(e,h,i)if!i.value then return end;if self.UID then srp.binds.Remove(self.UID)end;self.UID=i.value;self:Save()end)self.DefaultBind=g end)self.ContRight=g end)for j,q in pairs(keybind.GetTable())do if!q:IsCustom()then self.DefaultBind:AddOption(string.upper(q:GetName()),{value=q:GetName(),obj=q})end end;self:SetTall(ui.ButtonHeight*2+30)end;function a:Save()if!self.Bind.Key then return end;if self.Bind.Type==srp.binds.TYPE_GAME then if self.UID then srp.binds.ReMap(self.UID,self.Bind.Key)end else if self.UID then srp.binds.Remove(self.UID)end;self.UID=srp.binds.Add(self.Bind.Key,self.Bind.Type,self.Bind.Command,self.Bind.Condition)end end;function a:Delete()if self.UID then srp.binds.Remove(self.UID)end;self:Remove()end;function a:SetBind(r,s)self.UID=s;self.Bind=r;self.Binder:SetText(r.Key&&(input.GetKeyName(r.Key)||'...'):upper()||'...')self.Type:ChooseOption(r.Type,true)if srp.binds.Conditions[r.Condition]then self.Condition:SetValue(r.Condition,true)end;if r.Command then self.Command:SetText(r.Command)end;if r.Type==srp.binds.TYPE_GAME&&keybind.Get(self.UID)then self.DefaultBind:SetValue(self.UID,true)end;if r.IsDefault then self:SetBorderColor(col.blue_dark)self.Unbind:SetVisible(false)else self:SetBorderColor(col.grey_light)self.Unbind:SetVisible(true)end end;function a:PerformLayout(t,u)end;function a:Think()local v=self.Bind.Type==srp.binds.TYPE_GAME;self.Condition:SetVisible(!v)self.Macros:SetVisible(!v)self.Command:SetVisible(!v)self.DefaultBind:SetVisible(v)end;function a:Paint(t,u)draw.RoundedBox(4,1,1,t-2,u-2,self.m_bdrColor)draw.RoundedBox(4,2,2,t-4,u-4,self.m_bgColor)end;vgui.Register('srp_settings_binder',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/ui/invasionplate_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/ui/shiptimer_ui.lua:
local a={}vgui.Register('srp_quest_shiptimer',a,'srp_panel')local function b()srp.ui.Create('srp_quest_shiptimer',function(c)c:Populate(10)end)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/meta_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/ui/configs/rtscfg_npc_ui.lua:
local a={}function a:OnConfigLoaded(b,c)local d=c.class||b:GetData('class')local e=c.weapon||b:GetData('weapon')local f=c.health||b:GetData('health')self:AddSetting('Class','The NPC that will spawn','srp_dropdown',function(g)for h,i in SortedPairsByMemberValue(list.Get('NPC'),'Name',false)do if h:find('nbot')then continue end;g:AddOption(i.Name,{value=h},{font='ui_header.s'},h==d)end end)self:AddSetting('Weapon','The weapon the NPC will spawn with','srp_dropdown',function(g)for j,i in SortedPairsByMemberValue(list.Get('NPCUsableWeapons'),'title',false)do g:AddOption(i.title,{value=i.class},{font='ui_header.s'},i.class==e)end end)self:AddSetting('Health','The health the NPC will spawn with','srp_textinput',function(g)g:SetText(f||0)g:SetNumberInput(true,true,1000)g:SetMinMax(1,20000)g.PaintOver=function(k,l,m)draw.SimpleText('HP','ui_label.r',#k:GetText()*6.2+38,m/2,col.white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)end end)end;function a:GetSaveData()local n={class=self.fields.Class:GetValue(),weapon=self.fields.Weapon:GetValue(),health=self.fields.Health:GetValue()}if self.Action:Validate(n)then return n end end;vgui.Register('srp_rtscfg_npc',a,'srp_rtscfg')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/staffnews/news_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/staffnews/ui/staffnews_ui.lua:
local a={}local b=Color(0,0,0,225)local c=file.Find('backgrounds/*','MOD')local d={}for e,f in ipairs(c)do local g=Material('../backgrounds/'..f)table.insert(d,g)end;local h=Material'materials/galactic/ui/skills.png'local i=Material'materials/galactic/ui/warning.png'local j=Material'materials/galactic/ui/sith.png'local k=Material'materials/galactic/ui/talents/talent.png'function a:Init()self:SetDraggable(false)self:SetTitle'Staff & Gamemaster News'self:SetSize(800,600)self:SetPos(0,ScrH()/2+50)self:SetAlpha(0)self:SetBackgroundColor(col.midnight)self:MakePopup()self.close:SetDisabled(true,5)self:AddPanel('srp_button_rounded',function(l)l:DockMargin(0,0,0,0)l:SetPos(800-60,3)l:SetSize(27,27)l:SetText'+'l:SetFont'ui_label.rb'l:SetBackgroundColor(col.green)l:SetHoverColor(col.green)l:SetVisible(false)l:SetBorderColor(col.transparent)l:LeftClick(function()if IsValid(self.EditMenu)then self.EditMenu:Remove()end;self.EditMenu=srp.ui.Create('srp_staffnews_edit')end)self.NewButton=l end)self:AddPanel('ui_scrollpanel',function(m)m:Dock(LEFT)m:SetWide(300)self.items=m end)self:AddPanel('srp_staffnews_item',function(m)m:Dock(FILL)m:SetBackgroundColor(col.transparent)m:SetVisible(false)m:DockMargin(4,1,4,4)self.info=m end)hook('HUDPaint',self,function()draw.Box(0,0,ScrW(),ScrH(),b)end)end;function a:Populate(n,o)if!n then return end;local p=table.Count(n)for q=1,p do local r=n[q]srp.ui.Create('srp_button_tag_rounded',function(l)l:SetText(r.title)l:SetContentAlignment(4)l:SetBackgroundColor(col.grey_light)l:SetHoverColor(col.grey)l:LeftClick(function(s)self.info:Populate(r,s)self.info:SetVisible(true)end)if r.type=='1'then l:SetMaterial(h)l:SetBackgroundColor(col.green_dark)elseif r.steamid=='STEAM_0:1:26675200'then l:SetMaterial(j)l:SetBackgroundColor(col.gold)elseif r.urgent=='1'then l:SetMaterial(i)l:SetBackgroundColor(col.red_dark)else l:SetMaterial(k)end;self.items:AddItem(l)end)end;self:AlphaTo(255,.2,0)self:MoveTo((ScrW()-800)/2,(ScrH()-600)*.45,.2,0,-1)self.NewButton:SetVisible(LocalPlayer():IsSuperAdmin()||LocalPlayer():IsHeadGamemaster())timer.Simple(o&&2||10,function()if IsValid(self)then self.close:SetDisabled(false)end end)end;function a:OnRemove()hook.Remove('HUDPaint',self)srp.staffnews.UpdateLastRead()end;vgui.Register('srp_staffnews',a,'srp_window')local a={}local b=col.white_dark:Copy()b.a=200;local t=col.gold:Copy()local u=Color(189,77,77)local v=Color(240,240,240,125)function a:Init()self:SetBackgroundColor(b)self:SetBorderColor(col.grey_light)self:DockPadding(1,1,1,1)self:DockMargin(0,0,0,0)self.background=d[math.random(1,#d)]self:AddPanel('srp_panel',function(w)w:Dock(TOP)w:DockMargin(1,1,1,1)w:SetTall(40)w:DockPadding(4,4,4,4)w:SetBackgroundColor(v)w:AddPanel('srp_label',function(x)x:SetText'Header'x:Dock(FILL)x:SetFont'ui_header.rb'x:SetTextColor(col.grey_light)self.Header=x end)self.HeaderBar=w end)self:AddPanel('srp_label',function(x)x:SetText'Body'x:Dock(FILL)x:SetFont'ui_label.rb'x:SetContentAlignment(7)x:DockMargin(10,20,10,10)x:SetWrap(true)x:SetTextColor(col.grey_light)self.Body=x end)self:AddPanel('srp_label',function(x)x:SetText'ui_heading'x:SetFont'ui_label.r'x:Dock(BOTTOM)x:SetTextColor(col.grey_light)x:SetContentAlignment(5)x:DockMargin(0,0,0,5)self.Author=x end)self:AddPanel('srp_label',function(x)x:SetText'00:00:00 00/00/0000'x:SetFont'ui_label.s'x:SetTextColor(col.grey)x:SizeToContents()x:SetContentAlignment(2)x:SetColor(col.grey_light)x:Dock(BOTTOM)x:DockMargin(0,0,0,0)self.Date=x end)self:AddPanel('srp_button_rounded',function(l)l:SetFont'ui_label.rb'l:SetText'Delete Item'l:SetTextColor(col.white)l:SetBackgroundColor(col.red_dark)l:SetHoverColor(col.red)l:SetContentAlignment(5)l:SetVisible(false)l:SetSize(105,24)l:LeftClick(function()if self.itemid then net.Start'srp.staffnews.RemoveItem'net.WriteUInt(self.itemid,16)net.SendToServer()self.button:Remove()self:SetVisible(false)end end)self.RemoveBtn=l end)end;function a:Populate(y,z)self.itemid=y.id;self.button=z;self.Header:SetTextColor(col.white)self:SetBackgroundColor(b)self:SetBorderColor(col.grey_light)if y.urgent=='1'then self.Header:SetTextColor(u)self:SetBorderColor(u)self.urgent=true end;if y.steamid=='STEAM_0:1:26675200'then self.Header:SetTextColor(t)self:SetBorderColor(t)self.urgent=true end;if y.type=='1'then self.Header:SetTextColor(col.green)self:SetBorderColor(col.green)end;self.Header:SetText(y.title)self.Body:SetText(y.text)self.Date:SetText(y.added)self.Author:SetText(y.staffname..' - '..y.steamid)if LocalPlayer():IsDA()||LocalPlayer():IsHeadGamemaster()then self.RemoveBtn:SetVisible(true)else self.RemoveBtn:SetVisible(false)end end;function a:PerformLayout(A,B)self.RemoveBtn:SetPos(A-self.RemoveBtn:GetWide()-8,9)end;local C=Material'gui/gradient_up'function a:Paint(A,B)draw.Box(0,0,A,B,self.m_bgColor||col.white_dark)if self.background then surface.SetMaterial(self.background)surface.SetDrawColor(255,255,255,35)surface.DrawTexturedRect((A-1031)*.5,40+(B-40-580)*.5,1031,580)end;if self.urgent then surface.SetMaterial(C)surface.SetDrawColor(self.m_bdrColor)surface.DrawTexturedRect(0,0,A,B)end;if self.outline then surface.SetDrawColor(self.m_bdrColor||col.grey)surface.DrawOutlinedRect(0,0,A,B,2)end end;vgui.Register('srp_staffnews_item',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/simroom/ui/simroom_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/talents/ui/talents_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/talents/ui/talenttrees_ui.lua:
local a={}function a:Init()self:SetBackgroundColor(col.grey)self:DockMargin(0,0,0,0)self:DockPadding(0,0,0,0)self:AddPanel('ui_scrollpanel',function(b)b:DockMargin(0,0,0,0)b:Dock(FILL)self.scroll=b;srp.ui.Create('srp_grid',function(c)b:AddItem(c)c:Dock(TOP)c:SetAdjusted(true)c:SetSpacing(19,12,false)c.OnComplete=function(d,e)d:SetTall(e+8)end;self.grid=c end)end)self:AddPanel('srp_panel',function(f)f:Dock(TOP)f:SetBackgroundColor(col.midnight)f:DockPadding(0,0,50,0)f:DockMargin(0,0,0,0)f:SetTall(30)f:AddPanel('srp_checkbox',function(f)f:Dock(RIGHT)f:DockMargin(0,0,0,0)f:SetWide(260)f:SetOptions({name='DISABLE PASSIVES',value=true},{name='ENABLE PASSIVES',value=false})f:SetSpeed(6000)f:SetPosition(2,true)f:OnValueChanged(function(d,g,h)d.option1:SetFont(g==1&&'ui_label.rb'||'ui_label.r')d.option2:SetFont(g==2&&'ui_label.rb'||'ui_label.r')LocalPlayer():SetPassivesDisabled(h.value)end)self.PassiveCheckbox=f end)self.NavigationTop=f end)hook('OnTalentPassivesToggled',self,function(f,i)self.PassiveCheckbox:SetPosition(i&&2||1,true,true)end)end;function a:Populate(j)local k=srp.talents.GetAll(true)if!k then return end;for l,m in ipairs(k)do if m.hide then continue end;srp.ui.Create('srp_talenttree',function(f)f:Populate(m)if m.talents then f:LeftClick(function()j:ShowTalentTree(m.id)end)end;self.grid:AddItem(f)end)if m.passives then srp.ui.Create('srp_talentprogress_passives',function(f)f:SetSize(725,64)f:Populate(m.id,j)self.grid:AddItem(f)end)else srp.ui.Create('srp_talentprogress_talents',function(f)f:SetSize(725,64)f:Populate(m.id,j)self.grid:AddItem(f)end)end end end;function a:PerformLayout(n,e)end;vgui.Register('srp_talenttrees',a,'srp_panel')local a={}local o=Color(0,0,0,100)local p=Color(0,0,0,100)function a:Init()self:SetSize(205,64)self:SetBackgroundColor(o)self:SetHoverColor(p)self:SetText''self:SetTextColor(col.white_dark)self:DockPadding(0,0,0,0)self:AddPanel('srp_panel_rounded',function(f)f:Dock(LEFT)f:SetWide(64)f:DockMargin(0,0,8,0)f:SetMouseInputEnabled(false)f:AddPanel('DImage',function(q)q:SetMouseInputEnabled(false)q:Dock(FILL)q:DockMargin(8,8,8,8)self.Image=q end)self.IconBackground=f end)self:AddPanel('srp_panel',function(f)f:Dock(FILL)f:SetMouseInputEnabled(false)f:DockPadding(10,0,0,0)f:DockMargin(0,0,0,0)f:SetBackgroundColor(col.transparent)self.lbl:SetParent(f)self.lbl:Dock(TOP)self.lbl:SetTall(28)self.lbl:SetContentAlignment(1)self.lbl:DockMargin(0,0,0,0)f:AddPanel('srp_label',function(r)r:SetText'0/0'r:SetFont'ui_header.r'r:Dock(TOP)r:SetContentAlignment(7)r:SetMouseInputEnabled(false)r:SetTextColor(col.white_dark)r:DockMargin(0,0,0,0)r:SetTall(35)self.level=r end)end)end;function a:Populate(m)self:SetText(m.name)if m.icon then self.Image:SetMaterial(m.icon)end;if!m.talents then self:SetCursor'none'end;if m.color then self.IconBackground:SetBackgroundColor(m.color)self.IconBackground:SetHoverColor(m.color)local s=m.color:Copy()s.a=125;self:SetBackgroundColor(s)self:SetHoverColor(s)end;local t=LocalPlayer():GetTalentXP(m.id)local u=LocalPlayer():GetTalentLevel(m.id)local v=m.maxlevel||srp.talents.maxlevel;self.level:SetText(math.min(v,u)..'/'..v)end;vgui.Register('srp_talenttree',a,'srp_button_rounded')local a={}function a:Init()self:SetBackgroundColor(col.transparent)self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)end;function a:ShowList()self:Clear()self:AddPanel('srp_talenttrees',function(f)f:Dock(FILL)f:Populate(self)end)end;function a:ShowTalentTree(w)self:Clear()self:AddPanel('srp_talents',function(f)f:Dock(FILL)f:SetTalents(w,self)end)end;function a:Populate()self:ShowList()end;vgui.Register('srp_talentcontainer',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/time/time_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/ui/tradinggroup_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/ui/tradingsell_ui.lua:
local a={}local b={{'Recently Added',function(c,d)return c.rowinfo.added>d.rowinfo.added end},{'Price - Low',function(c,d)return c.rowinfo.price>d.rowinfo.price end},{'Price - High',function(c,d)return c.rowinfo.price<d.rowinfo.price end},{'Stack - Low',function(c,d)return c.rowinfo.remaining>d.rowinfo.remaining end},{'Stack - High',function(c,d)return c.rowinfo.remaining<d.rowinfo.remaining end},{'Sold - Least',function(c,d)return c.rowinfo.count-c.rowinfo.remaining<d.rowinfo.count-d.rowinfo.remaining end},{'Sold - Most',function(c,d)return c.rowinfo.count-c.rowinfo.remaining>d.rowinfo.count-d.rowinfo.remaining end}}function a:Init()self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self:SetBackgroundColor(col.midnight_light)self.statInfo={}self.sortType=b[3]self:AddPanel('srp_panel',function(e)e:SetBackgroundColor(Color(0,0,0,100))e:DockMargin(0,0,0,0)e:DockPadding(0,0,0,0)e:SetWide(200)e:Dock(LEFT)e:AddPanel('srp_button_rounded',function(f)f:SetBackgroundColor(col.grey_dark)f:SetHoverColor(col.grey_dark)f:DockPadding(0,0,0,0)f:DockMargin(5,0,5,0)f:Dock(TOP)f:SetTall(30)f:SetText'Sell Items'end)e:AddPanel('srp_inventoryitem',function(f)f:Dock(TOP)f:DockMargin(10,0,10,0)f:OnSelected(function(e,g,h,i)self:DisplaySellMenu(g,i)end)f:OnFilterItem(function(e,g)return g&&!g.tradedisabled end)end)e:AddPanel('srp_panel_rounded',function(e)e:DockPadding(5,5,5,5)e:DockMargin(5,5,5,5)e:Dock(FILL)e:SetBackgroundColor(col.midnight_dark)e:SetVisible(false)e:AddPanel('srp_label',function(j)j:SetText'ITEM.NAME'j:SetFont'ui_label.r'j:SetContentAlignment(4)j:SetTall(25)j:SetWrap(true)j:Dock(TOP)j:SetTextColor(col.white)e.Name=j end)e:AddPanel('srp_label',function(j)j:SetText'Item Description'j:SetFont'ui_label.s'j:SetContentAlignment(7)j:SetTall(100)j:SetWrap(true)j:Dock(TOP)j:SetTextColor(col.white)e.Description=j end)e:AddPanel('srp_label',function(j)j:SetText('')j:SetVisible(false)j:SetTextColor(col.red)j:SetTall(25)j:Dock(TOP)e.MaxPrice=j end)e:AddPanel('srp_tradeinfogroup',function(j)local k=srp.ui.Create'DNumberWang'k:SetValue(1)k:SetMin(1)k:SetMax(10000)k:SetDecimals(0)k.OnValueChanged=function(l,m)self.SaleCount=m;self:UpdateTotalPrice()end;j:SetText('Count',k)j:SetTall(25)j:Dock(TOP)e.Count=j end)e:AddPanel('srp_tradeinfogroup',function(j)local k=srp.ui.Create'DNumberWang'k:SetValue(1)k:SetMin(1)k:SetMax(10000000)k:SetDecimals(0)k.OnValueChanged=function(l,m)self.SalePrice=m;self:UpdateTotalPrice()end;j:SetText('Price',k)j:SetTall(25)j:Dock(TOP)e.Price=j end)e:AddPanel('srp_panel',function(e)e:DockMargin(2,5,2,5)e:SetBackgroundColor(col.grey_light)e:Dock(TOP)e:SetTall(2)end)e:AddPanel('srp_tradeinfogroup',function(j)j:SetText('Total Tax','0RC')j:SetTall(25)j:Dock(TOP)e.Tax=j end)e:AddPanel('srp_tradeinfogroup',function(j)j:SetText('Total Price','0RC')j:SetTall(25)j:Dock(TOP)e.TotalPrice=j end)e:AddPanel('srp_button_rounded',function(f)f:Dock(BOTTOM)f:SetText'Sell Items'f:SetBackgroundColor(col.orange)f:SetHoverColor(col.orange)f:DockMargin(2,2,2,2)f:LeftClick(function(l)if!self.itemid||!self.SalePrice||!self.SaleCount then return end;l:SetDisabled(true,4)srp.trading.SellItem(self.itemid,self.SalePrice,self.SaleCount)end)self.Sell=f end)self.SalePanel=e end)end)self:AddPanel('srp_panel',function(e)e:DockMargin(0,0,0,0)e:DockPadding(5,5,5,5)e:Dock(FILL)e:SetBackgroundColor(col.transparent)e:AddPanel('srp_panel_rounded',function(e)e:DockMargin(0,0,0,5)e:DockPadding(2,2,2,2)e:SetTall(30)e:Dock(TOP)e:SetBackgroundColor(col.midnight_dark)e:AddPanel('srp_button_rounded',function(f)f:SetText'Refresh'f:Dock(RIGHT)f:DockMargin(0,0,0,0)f:SetBackgroundColor(col.blue)f:SetHoverColor(col.blue_light)f:SetBorderColor(col.transparent)f:LeftClick(function(l)l:SetDisabled(true,2)srp.trading.RequestItems()end)end)e:AddPanel('srp_dropdown',function(n)n:SetText'Order By'n:SetWide(200)n:Dock(RIGHT)n:DockMargin(0,0,0,0)n:SetBackgroundColor(col.white_dark)n:SetHoverColor(col.white_dark)n:SetTextColor(col.grey_dark)n:OnSelect(function(l,o,p)self.sortType=p;self:OrderItems()end)for q,p in ipairs(b)do n:AddOption(p[1],{sort=p[2]})end end)self.controls=e end)e:AddPanel('srp_panel',function(e)e:Dock(TOP)e:SetTall(30)e:SetBackgroundColor(col.black)e:AddPanel('srp_label',function(j)j:DockPadding(0,0,0,0)j:DockMargin(40,0,0,0)j:Dock(LEFT)j:SetWide(150)j:SetTextColor(col.white)j:SetFont'ui_label.l'j:SetMouseInputEnabled(false)j:SetContentAlignment(4)j:SetText'Title'end)e:AddPanel('srp_label',function(j)j:DockPadding(0,0,0,0)j:DockMargin(0,0,40,0)j:Dock(RIGHT)j:SetWide(150)j:SetTextColor(col.white)j:SetFont'ui_label.l'j:SetMouseInputEnabled(false)j:SetContentAlignment(6)j:SetText'Price'end)e:AddPanel('srp_label',function(j)j:DockPadding(0,0,0,0)j:DockMargin(0,0,0,0)j:Dock(RIGHT)j:SetWide(150)j:SetTextColor(col.white)j:SetFont'ui_label.l'j:SetMouseInputEnabled(false)j:SetContentAlignment(6)j:SetText'Stack'end)e:AddPanel('srp_label',function(j)j:DockPadding(0,0,0,0)j:DockMargin(0,0,0,0)j:Dock(RIGHT)j:SetWide(150)j:SetTextColor(col.white)j:SetFont'ui_label.l'j:SetMouseInputEnabled(false)j:SetContentAlignment(6)j:SetText'Remaining'end)end)e:AddPanel('ui_scrollpanel',function(r)r:Dock(FILL)srp.ui.Create('srp_grid',function(e)e:SetAutoHeight(true)e:Dock(TOP)r:AddItem(e)self.saleListGrid=e end)self.saleList=r end)end)hook('OnTradingListLoaded',self,self.LoadItems)hook('OnTradingListed',self,self.ListItem)end;function a:ClearItem()self.itemid=nil end;function a:DisplaySellMenu(g,i)if!g then self:ClearItem()return end;self.itemid=g.id;self.SalePanel.Name:SetText(g.name||'Unknown Item')self.SalePanel.Description:SetText(g.description||'')self.SalePanel.TotalPrice:SetValue('0 RC')self.SalePanel.Tax:SetValue('0 RC')self.SalePanel.Price:SetValue(0)self.SalePanel.Count:SetValue(0)self.SalePanel.Price.Value:SetMax(g.trademaxprice||10000000)self.SalePanel:SetVisible(true)self.SalePanel.MaxPrice:SetVisible(g.trademaxprice!=nil)if g.trademaxprice then self.SalePanel.MaxPrice:SetText(Format('A max price of %s is applied to this item!',string.Comma(g.trademaxprice)))end;self.SaleCount=0;self.SalePrice=0 end;function a:UpdateTotalPrice()local s=self.SalePrice*self.SaleCount;local t=LocalPlayer():GetTradeTax()local u=s*t;self.SalePanel.Tax:SetValue(Format('%s RC',string.Comma(u)))self.SalePanel.TotalPrice:SetValue(string.Comma(math.Round(s+u))..' RC')end;function a:LoadItems(p)self.saleListGrid:Clear()if#p.selling==0 then return end;local v=0;local w=0;local x=0;local y=os.time()-86400;self.Items={}local i=0;for z=1,#p.selling do local A=p.selling[z]local g=srp.items.Get(A.itemid)if!g then continue end;self:LoadItem(g,A)i=i+1;v=v+A.price;x=x+A.remaining;if(A.updated&&tonumber(A.updated)||A.added&&tonumber(A.added))>y then w=w+A.price end end;v=math.floor(v/i)w=math.floor(w/i)end;function a:ListItem(B,C,i,s)self:LoadItem(srp.items.Get(C),{id=B,count=i,remaining=i,price=s,added=os.time(),updated=os.time()})end;function a:LoadItem(g,p)self.Items=self.Items||{}srp.ui.Create('srp_tradingsellline',function(e)e:SetTall(40)e:Dock(TOP)e:Populate(g,p)table.insert(self.Items,e)self.saleListGrid:AddItem(e)end)end;function a:OrderItems()if!self.Items||#self.Items==0 then return end;table.sort(self.Items,self.sortType.sort)for D,e in ipairs(self.Items)do self.saleListGrid:MoveToFront(e)end end;function a:OnRemove()hook.Remove('OnTradingListLoaded',self)end;vgui.Register('srp_tradingsell',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/titles_sh.lua:
srp.titles=srp.titles||{}local a={}local b={}local c={}local d={}local e=Color(240,240,240,250)nw.Register'srp.titles.Id':Write(net.WriteUInt,8):Read(net.ReadUInt,8):SetPlayer():SetHook('OnCharacterTitleChanged')nw.Register'srp.titles.EffectId':Write(net.WriteUInt,8):Read(net.ReadUInt,8):SetPlayer():SetHook('OnCharacterTitleEffectChanged')local function f(g,h,i,j,k,l)surface.SetFont'ui_header.l'local m,n=surface.GetTextSize(h)surface.SetTextColor(e)surface.SetTextPos(-m/2,n)surface.DrawText(h)end;local o=Material'galactic/seasonal/easter/hatch.png'local p=Material'galactic/seasonal/easter/hatch_1.png'local q={o,p}function srp.titles.DrawTitle(g,h,r,i,j,k,l)surface.SetFont(r)local m,n=surface.GetTextSize(h)surface.SetTextColor(e)surface.SetTextPos(-m/2,n)surface.DrawText(h)end;function srp.titles.DrawTitleEffect(r,s)s=s||0;return function(g,h,i,j,k,l)surface.SetFont(r)local m,n=surface.GetTextSize(h)surface.SetTextColor(e)surface.SetTextPos(-m/2,n+s)surface.DrawText(h)end end;function srp.titles.DrawEggs()local t=45;local u=-t/2;return function(g,h,i,j,k,l)local v=math.floor(CurTime())%2==0&&1||2;local w=q[v]surface.SetDrawColor(255,255,255,255)surface.SetMaterial(w)surface.DrawTexturedRect(u,t,t,t)if v==1 then local x=t/2;draw.DrawText('quack!','ui_header.s',u-45,t+20,col.pink,TEXT_ALIGN_LEFT)draw.DrawText('quack!','ui_header.s',u+85,t,col.yellow,TEXT_ALIGN_RIGHT)else draw.DrawText('yo','ui_header.rb',u+70,t,col.white,TEXT_ALIGN_RIGHT)end end end;function srp.titles.DrawColor(col)return function(g,h,i,j,k,l)surface.SetFont'ui_header.l'local m,n=surface.GetTextSize(h)surface.SetTextColor(col)surface.SetTextPos(-m/2,n)surface.DrawText(h)end end;function srp.titles.DrawFlashing(y)return function(g,h,i,j,k,l)local z=math.Round(CurTime(),0)%2==0;surface.SetFont'ui_header.l'local m,n=surface.GetTextSize(h)surface.SetTextColor(z&&e||y)surface.SetTextPos(-m/2,n)surface.DrawText(h)end end;function srp.titles.DrawZigZag(y,A)surface.SetFont'ui_header.l'local B=surface.GetTextSize('O')return function(g,h,i,j,k,l)surface.SetTextColor(y)surface.SetFont'ui_header.l'local m,n=surface.GetTextSize(h)local C=math.cos(os.clock()*A)*5;local D=#h;local E=-m/2;for F=1,D do local G=h[F]local H=F%2==0;surface.SetTextPos(E,n+(H&&-C||C))surface.DrawText(G)E=E+B end end end;function srp.titles.DrawWave(y,A,I)local J=0;local K=I||15;local L=5;local M=math.pi*2/K*2;return function(g,h,i,j,k,l)J=J+RealFrameTime()+A;surface.SetTextColor(y)surface.SetFont'ui_header.l'local m,n=surface.GetTextSize(h)local D=#h;local E=-m/2-#h;for F=1,D do local G=h[F]local B=surface.GetTextSize(G)if G==' 'then else local C=math.cos(J+F+M)*L;surface.SetTextPos(E,n+C)surface.DrawText(G)end;E=E+B+(G==' '&&3||2)end end end;function srp.titles.DrawStaticRainbow(g,h,i,j,k,l)surface.SetFont'ui_header.l'local m,n=surface.GetTextSize(h)draw.Rainbow(-m/2,n,h)end;local N=1;local O={}local function P(Q,R,S,T,U,V)local Q=Q||R+S*100;if O[Q]then return O[Q]end;T=T||N;U=U||1;V=V||1;local W={}local X=(S-R)/T;for F=1,math.ceil(X)do local Y=R>S&&-T||T;table.insert(W,HSVToColor(R+F*Y,U,V))end;O[Q]=W;return W end;function srp.titles.DrawGradient(Q,R,S,Z,_,a0)local a1=P(Q,R,S,a0,Z,_)local D=#a1;local a2=1;return function(g,h,i,j,k,l)surface.SetFont'ui_header.l'local m,n=surface.GetTextSize(h)a2=math.abs(math.cos(os.clock())*D)i=-m/2;local Q=math.floor(a2)for F=1,#h do local C=(Q+F)%(D-1)if C==0 then C=1 end;local col=a1[C]surface.SetTextColor(col)surface.SetTextPos(i,n)surface.DrawText(h[F])i=i+surface.GetTextSize(h[F])end end end;function srp.titles.DrawImage(w)local t=45;local u=-t/2;return function(g,h,i,j,k,l)surface.SetDrawColor(255,255,255,255)surface.SetMaterial(w)surface.DrawTexturedRect(u,t,t,t)end end;function srp.titles.Get(Q)return a[Q]end;function srp.titles.GetByName(a3)return c[a3]end;function srp.titles.GetEffectByName(a3)return d[a3]end;function srp.titles.GetAll()return a end;function srp.titles.GetAllEffects()return b end;function srp.titles.Register(a4,a5)a5.Name=a4;a5.ID=table.insert(a,a5)c[a4]=a5 end;function srp.titles.RegisterEffect(a3,a5)a5.Name=a3;a5.ID=table.insert(b,a5)d[a3]=a5 end;function srp.titles.GetEffect(Q)return b[Q]end;function srp.titles.HasAccess(g,Q)local a6=a[Q]if!a6 then return false end;if a6.Triumph then local a7=srp.triumphs.Get(a6.Triumph)return a7&&a7:IsCompleted(g)end;if a6.Time then return g:GetPlayTime()>=a6.Time end;if a6.CanAccess then return a6:CanAccess(g)end;if a6.Battlepass then local a8=a6.BattlepassLevel||0;local a9=g:GetTalentLevel(a6.Battlepass)||0;return a9>=a8 end;return false end;function srp.titles.HasEffectAccess(g,Q)local a6=b[Q]if!a6 then return false end;if a6.CanAccess then return a6.CanAccess(g,Q)end;if a6.Time then return g:GetPlayTime()>=a6.Time end;if a6.Triumph then local a7=srp.triumphs.Get(a6.Triumph)return a7&&a7:IsCompleted(g)end;if a6.Battlepass then local a8=a6.BattlepassLevel||0;local a9=g:GetTalentLevel(a6.Battlepass)||0;return a9>=a8 end;return true end;function PLAYER:SetTitle(Q)self:SetNetVar('srp.titles.Id',Q)end;function PLAYER:SetTitleEffect(Q)self:SetNetVar('srp.titles.EffectId',Q)end;function PLAYER:GetTitle()return self.DisplayTitle end;function PLAYER:GetTitleEffect()return self.DisplayTitleEffect||f end;srp.titles.RegisterEffect('Default',{Draw=f})hook('OnCharacterTitleChanged',function(g,Q)if!Q||Q==0 then g.DisplayTitle=nil else g.DisplayTitle=a[Q]&&a[Q].Name end end)hook('OnCharacterTitleEffectChanged',function(g,Q)if!Q||Q==0 then g.DisplayTitleEffect=nil else local aa=srp.titles.GetEffect(Q,true)g.DisplayTitleEffect=aa&&aa.Draw end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/ui/triumpheffect_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/ui/triumphflash_ui.lua:
local a={}local b=col.grey_dark:Copy()b.a=250;local c=Color(100,100,255,100)local d=col.blue_light;function a:Init()self:SetSize(400,160)self:Center()self:SetAlpha(0)self:DockPadding(2,2,2,2)surface.PlaySound('garrysmod/save_load'..math.random(1,3)..'.wav')self:SetPos(ScrW()-410,ScrH())self:AlphaTo(255,1,0,function()self:AlphaTo(0,1,5,function()self:Remove()end)end)self:AddPanel('srp_panel',function(e)e:Dock(LEFT)e:SetWide(140)e:DockMargin(0,0,0,0)e:DockPadding(25,35,25,35)e:SetBackgroundColor(col.transparent)e:AddPanel('DImage',function(f)f:Dock(TOP)f:SetMaterial(mat)f:SetMouseInputEnabled(false)f:SetTall(90)self.icon=f end)end)self:AddPanel('srp_panel',function(e)e:Dock(FILL)e:DockMargin(0,0,0,0)e:SetBackgroundColor(col.transparent)e:AddPanel('srp_label',function(g)g:SetText''g:Dock(TOP)g:SetFont'ui_header.r'g:SetContentAlignment(1)g:SetTextColor(col.white)g:SetTall(35)self.name=g end)e:AddPanel('srp_label',function(g)g:SetText''g:Dock(TOP)g:SetFont'ui_label.r'g:SetContentAlignment(7)g:SetTextColor(col.white_dark)g:SetWrap(true)self.description=g end)e:AddPanel('srp_panel',function(e)e:Dock(FILL)e:DockMargin(0,0,0,0)e:SetBackgroundColor(col.transparent)self.container=e end)end)end;function a:Populate(h)self.triumph=h;self.completed=h:IsCompleted()self.name:SetText(h:GetName())self.description:SetText(h:GetDescription()||'')if h.color then self.triumphcolor=h.color:Copy()self.triumphcolor.a=150 end;local i=h:GetMaterial()if i then self.icon:SetMaterial(i)end;self:PopulateObjectives()end;function a:PopulateObjectives()self.container:Clear()local j=self.triumph:GetObjectives(true)||{}for k,l in pairs(j)do local m=self.triumph:GetObjective(l)srp.ui.Create('srp_triumphobj',function(e)e:SetParent(self.container)e:Dock(TOP)e:DockMargin(2,2,2,2)e:Populate(self.triumph,l,m,self.triumphcolor)end)end;local n=math.max(4,table.Count(j))local o=70+n*30;self:SetTall(o)self:MoveTo(ScrW()-410,ScrH()-o-10,1/(n/4),0)end;function a:Think()self:MoveToFront()end;function a:Paint(p,q)draw.RoundedBox(6,0,0,p,q,b)if self.triumphcolor then draw.RoundedBox(12,2,4,4,q-8,self.triumphcolor)end end;vgui.Register('srp_triumphflash',a,'srp_panel')local a={}function a:Init()self:SetSize(220,36)self:Center()self:SetAlpha(0)self:DockPadding(2,2,2,2)self:AlphaTo(255,.5,0,function()self:AlphaTo(0,.5,3,function()self:Remove()end)end)self:AddPanel('srp_panel',function(e)e:Dock(LEFT)e:SetWide(32)e:DockMargin(0,0,2,0)e:DockPadding(2,2,2,2)e:SetBackgroundColor(col.transparent)e:AddPanel('DImage',function(f)f:Dock(FILL)f:SetMaterial(mat)f:SetMouseInputEnabled(false)self.icon=f end)end)self:AddPanel('srp_label',function(g)g:Dock(FILL)g:SetText'Objective Description'g:SetContentAlignment(4)g:SetFont'ui_header.s'self.description=g end)self:AddPanel('srp_label',function(g)g:Dock(RIGHT)g:SetText'+0'g:SetContentAlignment(6)g:SetWide(50)g:SetFont'ui_header.xs'self.increase=g end)end;function a:Populate(h,r,s,t)local u=h:GetObjectiveDescription(r)||''self.triumph=h;self.description:SetText(u)self.increase:SetText('+'..s)self.percent=t/(h:GetObjective(r)||1)local v=surface.GetTextSize(u)+150;self:SetWide(v)if!self.displaying then local p=(ScrW()-v)/2;self:SetPos(p-20,10)self:MoveTo(p,10,.5,0)end;local i=h:GetMaterial()if i then self.icon:SetMaterial(i)end;self.displaying=true end;function a:Think()self:MoveToFront()end;local b=Color(50,50,50,200)local w=col.black:Copy()w.a=170;function a:Paint(p,q)draw.RoundedBox(4,0,0,p,q,b)if self.percent then draw.RoundedBox(4,0,0,p*self.percent,q,w)end end;vgui.Register('srp_triumphpartflash',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trivia/ui/triviaview_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/cloaking/cloaking_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/rakghoul/rakghoul_sh.lua:
local a={['models/galactic/troll/troll.mdl']=true,['models/galactic/swtorrhak/swtorrhak.mdl']=true,['models/player/zombie_classic.mdl']=true,['models/player/zombie_fast.mdl']=true,['models/player/zombie_soldier.mdl']=true,['models/stalkertnb/bloodsucker.mdl']=true,['models/DPFilms/Metropolice/Playermodels/pm_zombie_police.mdl']=true}local b={Sound('npc/zombie/foot1.wav'),Sound('npc/zombie/foot2.wav'),Sound('npc/zombie/foot3.wav')}local c={['models/mrpounder1/player/massif.mdl']=true}hook('CalcMainActivity',function(d,e)if d:IsNoClip()||!a[d:GetModel()]then return end;d.CalcIdeal=ACT_HL2MP_IDLE_ZOMBIE;d.CalcSeqOverride=-1;local f=e:Length2DSqr()local g=d:IsOnGround()if g&&!d.m_bWasOnGround then d:AnimRestartGesture(GESTURE_SLOT_JUMP,ACT_LAND,true)end;if f>1000&&!g then d.CalcIdeal=ACT_ZOMBIE_LEAPING elseif d.m_bJumping&&!g then d.CalcIdeal=ACT_ZOMBIE_LEAP_START elseif d:Crouching()then d.CalcIdeal=f>0.25&&ACT_MP_CROUCHWALK||ACT_MP_CROUCH_IDLE elseif f>22500 then d.CalcIdeal=ACT_HL2MP_RUN_ZOMBIE_FAST elseif f>0.25 then d.CalcIdeal=ACT_HL2MP_WALK_ZOMBIE_01 end;return d.CalcIdeal,d.CalcSeqOverride end)hook('PlayerFootstep',function(d,h,i,j,k,l)local m=d:GetModel()if c[m]||a[m]then EmitSound(b[math.random(1,#b)],h,d:EntIndex(),CHAN_BODY,k,SNDLVL_30dB,0,100)return true end end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/sparring/sparring_cl.lua:
srp.sparring=srp.sparring||{}
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/starmap/ui/starmap_list_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/hud/menu_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/player/hands_sh.lua:
function PLAYER:GetHandsModel()if self:GetAllegianceID()!='REPUBLIC'||self:IsJEDI()then return player_manager.TranslatePlayerHands(player_manager.TranslateToPlayerModelName(self:GetModel()))else return{skin=1,body='000000',model='models/galactic/clones/clonearms.mdl',material=self:GetMaterial()}end end
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/events/spleef_sh.lua:
local a=15;local b=35;local c={}local function d(e,f)if CLIENT then return end;local g={}local h=(b*e+a*e)/2;local i=srp.events.Arena.Pos+Vector(-h,-h,50)local j=ents.Create'rp_lava'j:SetPos(srp.events.Arena.Pos+Vector(-20,0,25))j:SetAngles(Angle(0,0,0))j:Spawn()for k=0,e-1 do c[k]=c[k]||{}for l=0,f-1 do local m=ents.Create('rp_eventplatform')m:SetPos(i+Vector(k*b+k*a,l*b+l*a,0))m:Spawn()m.GridX=k;m.GridY=l;m:SetExplosive(math.random()>.98,function(self)local k,l=self.GridX,self.GridY;for n=0,2 do local k=self.GridX-n;if c[k]&&IsValid(c[k][self.GridY])then c[k][self.GridY]:SetExplosiveMarked(n)end;local k=self.GridX+n;if c[k]&&IsValid(c[k][self.GridY])then c[k][self.GridY]:SetExplosiveMarked(n)end;local l=self.GridY-n;if IsValid(c[self.GridX][l])then c[self.GridX][l]:SetExplosiveMarked(n)end;local l=self.GridY+n;if IsValid(c[self.GridX][l])then c[self.GridX][l]:SetExplosiveMarked(n)end end end)table.insert(g,m)c[k][l]=m end end;return g end;local function o()for p,m in ipairs(ents.FindByClass'rp_lava')do m:Remove()end;for p,m in ipairs(ents.FindByClass'rp_eventplatform')do m:Remove()end end;srp.events.Register('spleef','Spleef ',20):SetArenaEvent(true):SetMaxPlaytime(720):SetRequiresVote(true,4,25):SetDescription([[
		Destroy the platform and be the last standing!
	]]):SetTagLines({default='Shoot the ground, survive!'}):OnStart(function(self)if CLIENT then return end;o()d(22,22)local q=self:GetPlayers()self:DisplayDeathCounter(#q)srp.events.SpawnInRoom(q,200,function(r)r:AddFlags(FL_GODMODE)r:SetMaxHealth(2000)r:SetHealth(250)r:SetMaxHealth(250)r:SetArmor(0)r:SetRunSpeed(150)r:StripWeapons()r:Freeze(true)timer.Simple(2,function()if IsValid(r)then local s=r:Give'sup_de10'if IsValid(s)then r:SelectWeapon'sup_de10's:SetClip1(500)end;if r:IsPlayer()then r:Freeze(false)end end end)end)end):OnPlayerRemoved(function(self,r)local q=self:GetPlayers()if IsValid(r)then self:DisplayDeathCounter(#q,r:Nick())r:SetCharacterStatisticAverage('minigame_losses',1)r:SetCharacterStatisticAverage('minigame_wins',0)else self:DisplayDeathCounter(#q)end;if#q<=1 then self:End(srp.events.END,q[1])end end):OnWriteEndData(function(self,r)net.WritePlayer(r)end):OnReadEndData(function(self,r)return net.ReadPlayer(r)end):OnEnd(function(self,t,r)if CLIENT then return end;if!IsValid(r)||!IsEntity(r)then o()return end;r:Freeze(true)r:StripWeapons()r:RemoveFlags(FL_GODMODE)r:SetCharacterStatisticAverage('minigame_wins',1)srp.notif.SuccessAll(5,r:Nick()..' has won Spleef.')timer.Simple(5,function()o()if IsValid(r)then r:Freeze(false)r:Spawn()end end)end):AddHook('PlayerDeath',function(self,r)self:RemovePlayer(r)end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/gamemaster/realtimestrategy/core_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/cosmetic_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/fireworks_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/food_drink_sh.lua:
sound.Add({name='srp.food.burp',channel=CHAN_ITEM,volume=0.4,soundlevel=65,sound={'galactic/effects/burp1.mp3','galactic/effects/burp2.wav'}})local a={label='Consume',color=col.grey_dark,basecooldown=5,callback=function(self,b,c,d,e)local f=b:GetMaxHealth()*1.2;local g=math.min(b:Health()+(self.power||10),f)b:SetHealth(g)if math.random()<.05 then b:EmitSound('srp.food.burp')end;return 1 end}local h=function(i,j)return{label='Feast',color=col.purple,basecooldown=5,callback=function(self,b,c,d,e)local f=b:GetMaxHealth()*(j||1.1)local g=math.min(b:Health()+(self.power||i||25),f)b:SetHealth(g)if math.random()<.05 then b:EmitSound('srp.food.burp')end;return 1 end}end;srp.items.RegisterBase('CONSUME',{name='Core Consume Item',description='Refreshing',icon='materials/galactic/ui/foods/waterbottle.png',iconsettings='smooth noclamp',model=Model'models/props_junk/PopCan01a.mdl',cost=100,maxstack=2000,energy=1,gui_position=Vector(0,0,25),weight=0,interaction={OnPickup={label='Pickup',callback=function(self,b,c,d,e,k)return c:AddItem(self,e)end}}})srp.items.RegisterBase('ALCOHOL',{name='Core Consume Item',description='Refreshing',icon='materials/galactic/ui/foods/waterbottle.png',iconsettings='smooth noclamp',model=Model'models/props_junk/GlassBottle01a.mdl',cost=100,maxstack=200,energy=1,gui_position=Vector(0,0,25),health=10,armour=10,interaction={OnAltPickup={label='Pickup',callback=function(self,b,c,d,e,k)if c:AddItem(self,e)then return true else return false end end},OnPickup={label='Drink',color=col.red,consumeable=true,consumeduration=90,callback=function(self,b,c,d,e,k)local l=math.min(b:Health()+self.health,b:GetMaxHealth()*150)local m=math.min(b:Armor()+self.armour,400)b:SetHealth(l)b:SetArmor(m)if math.random()<.1 then b:EmitSound('srp.food.burp')end;e=e-1;if e<=0 then return true else k:SetCount(e)return false end end}}})srp.items.Register('Alcohol','ALCOHOL_VODKA',{base='ALCOHOL',name='Vodka',icon='materials/galactic/ui/foods/vodka.png',interaction={OnPickup={consumeduration=60,clhooks={RenderScreenspaceEffects=function(self)DrawMotionBlur(0.03,0.8,0.08)end}}}})srp.items.Register('Alcohol','ALCOHOL_MERENZANE',{base='ALCOHOL',name='Merenzane Gold',icon='materials/galactic/ui/foods/beer.png',iconsettings='smooth noclamp',interaction={OnPickup={consumeduration=60,clhooks={RenderScreenspaceEffects=function(self)DrawMotionBlur(0.01,0.5,0.1)end}}}})srp.items.Register('Alcohol','ALCOHOL_ARDEES',{base='ALCOHOL',name='Ardees',description='Jawa Juices',icon='materials/galactic/ui/foods/vodka.png',interaction={OnPickup={consumeduration=120,clhooks={RenderScreenspaceEffects=function(self)DrawMotionBlur(0.1,0.4,0.14)end}}}})srp.items.Register('Alcohol','ALCOHOL_TATSUNSET',{base='ALCOHOL',name='Tatooine Sunset',description='Chill vibe drink',icon='materials/galactic/ui/foods/cocktail.png',interaction={OnPickup={consumeduration=180,clhooks={RenderScreenspaceEffects=function(self)DrawMotionBlur(0.5,0.2,0.18)end}}}})srp.items.Register('Alcohol','ALCOHOL_TATSUNSET_STRONG',{base='ALCOHOL',name='Tatooine Sunset (strong)',description='Chill vibe drink',icon='materials/galactic/ui/foods/cocktail.png',interaction={OnPickup={consumeduration=30,clhooks={RenderScreenspaceEffects=function(self)DrawMotionBlur(1,0.5,0.1)end}}}})srp.items.Register('Raw Materials','DIRTY_WATER',{base='CONSUME',name='Dirty Water',maxstack=250,description='Dirty Water. Needs distilling.',model=Model'models/props_junk/garbage_milkcarton001a.mdl',icon='materials/galactic/ui/foods/dirtywater.png',craftingOffset=5})srp.items.Register('Liquids','LIQUID_,WATER',{base='CONSUME',name='Distilled Water',maxstack=250,description='Juicy.. heh.',model=Model'models/props_junk/garbage_milkcarton001a.mdl',icon='materials/galactic/ui/foods/waterbottle.png',interaction={Use=a},tradedisabled=true})srp.items.Register('Liquids','LIQUID_WATER',{base='CONSUME',name='Distilled Water',maxstack=250,description='Juicy.. heh.',model=Model'models/props_junk/garbage_milkcarton001a.mdl',icon='materials/galactic/ui/foods/waterbottle.png',interaction={Use=a},tradedisabled=true,OnPreInventoryAdded=function(self,n,o,e)if!o then return{Charges=3}end end,interaction={Use={label='Drink',callback=function(self,b,c,d,e)return false end}}})srp.items.Register('Liquids','LIQUID_PUMPKINWATER',{base='CONSUME',name='Pumpkin Juice',maxstack=250,description='Magical pumpkin water used to lubricate weaponry.\nIncreases damage by 5%',model=Model'models/props_junk/garbage_milkcarton001a.mdl',icon='materials/galactic/ui/foods/waterbottle.png',color=col.orange,tradedisabled=true,trade='FOOD_PUMPKIN',tradeamount=50,tradecolor=col.purple,interaction={Use={label='Apply Lubricant',color=col.purple,count=1,callback=function(self,b,c,d,e)local p=b:GetActiveWeapon()if!IsValid(p)then return false end;if p.JuiceBoost then return false end;p.JuiceBoost=true;p.Damage=(p.Damage||1)*1.05;p.SaberDamage=(p.SaberDamage||1)*1.05;p.Primary.Damage=(p.Primary.Damage||1)*1.05;srp.notif.Success(b,3,'Lubricant temporary applied to weapon')return 1 end}}})srp.items.Register('Liquids','FOOD_HALLOWEEN_POISON',{base='CONSUME',name='Pumpkin Fruit Juice',maxstack=250,description='A juicy liquid to give you the goodness you require',model=Model'models/props_junk/garbage_milkcarton001a.mdl',icon='materials/galactic/ui/foods/waterbottle.png',color=col.yellow,tradedisabled=true,tradecolor=col.purple,interaction={PoisonEffect={consumeduration=15,clhooks={RenderScreenspaceEffects=function(self)DrawMotionBlur(1,0.2,0.16)end}},Use={label='Drink',color=col.purple,count=1,callback=function(self,b,c,d,e)srp.items.TrackConsumeable(b,self.id,'PoisonEffect')srp.effect.Run(b,'Puke')return 1 end}}})srp.items.Register('Liquids','LIQUID_COFFEE',{base='CONSUME',name='Coffee',maxstack=250,description='Drink de coffee',model=Model'models/galactic/me3fix/coffeemaker01.mdl',icon='materials/galactic/ui/foods/soda.png',tradedisabled=true,interaction={Use={color=col.brown,consumeable=true,consumeduration=60,callback=function(self,b,c,d,e)srp.items.TrackConsumeable(b,self.id,'Use')return true end,callbackstart=function(self,b)b:SetRunSpeed(230)end,callbackend=function(self,b)b:ApplyTalent'runspeed'end}}})srp.items.Register('Liquids','LIQUID_SODA',{base='CONSUME',name='A Sodipop',maxstack=250,description='Drink ur dank sodis kids',model=Model'models/props_junk/PopCan01a.mdl',icon='materials/galactic/ui/foods/soda.png',interaction={Use=a},tradedisabled=true})srp.items.Register('Basic Foods','FOOD_CHILI',{base='CONSUME',name='Chili Pepper',maxstack=150,description='Spicy hot hot',model=Model'models/galactic/me3fix/hvywepcrate01.mdl',icon='materials/galactic/ui/foods/chilli.png',interaction={Use=a}})srp.items.Register('Basic Foods','FOOD_BELLPEPPER',{base='CONSUME',name='Bell Pepper',maxstack=150,description='Bell end veggie',model=Model'models/galactic/me3fix/hvywepcrate01.mdl',icon='materials/galactic/ui/foods/pepper.png',interaction={Use=a}})srp.items.Register('Basic Foods','FOOD_ARTICHOKE',{base='CONSUME',name='Artichoke',maxstack=150,description='No fucking idea what this is',model=Model'models/galactic/me3fix/hvywepcrate01.mdl',icon='materials/galactic/ui/foods/artichoke.png',interaction={Use=a}})srp.items.Register('Basic Foods','FOOD_ONION',{base='CONSUME',name='Onion',maxstack=150,description='Stare at it',model=Model'models/galactic/me3fix/hvywepcrate01.mdl',icon='materials/galactic/ui/foods/onion.png',interaction={Use=a}})srp.items.Register('Basic Foods','FOOD_TURNIP',{base='CONSUME',name='Turnip',maxstack=150,description='Nice',model=Model'models/galactic/me3fix/hvywepcrate01.mdl',icon='materials/galactic/ui/foods/turnip.png',interaction={Use=a}})srp.items.Register('Basic Foods','FOOD_PUMPKIN',{base='CORE',name='Pumkin',maxstack=150,description='What do I do with this?',model=Model'models/tsbb/vegetables/pumpkin.mdl',icon='materials/galactic/ui/foods/pumpkin.png',nodrop=true})srp.items.Register('Basic Foods','FOOD_CANDYCANE',{base='CORE',name='Candy Cane',maxstack=150,description='Suck it',model=Model'models/tsbb/vegetables/pumpkin.mdl',icon='materials/galactic/seasonal/christmas/candycane.png',nodrop=true,cantrade=false})srp.items.Register('Basic Foods','TOKEN_XMAS',{base='CORE',name='Christmas Token',maxstack=150,description='Access special christmas items!',icon='materials/galactic/seasonal/christmas/present.png',nodrop=true,cantrade=false})srp.items.Register('Basic Foods','FOOD_PUMPKIN_CAKE',{base='CONSUME',name='Pumkin Cake Slice',maxstack=150,description='Yum. Gives a small amount of HP up to 50% extra HP.',model=Model'models/tsbb/vegetables/pumpkin.mdl',icon='materials/galactic/ui/foods/pumpkin-cake.png',interaction={Use=h(50,1.5)},power=10,trade='FOOD_PUMPKIN',tradecolor=col.purple,tradeamount=25})srp.items.Register('Basic Foods','FOOD_PUMPKIN_SOUP',{base='CONSUME',name='Pumkin Soup',maxstack=150,description='Good Pumpkin Soup for your belly yum yum. Gives a medium amount of HP up to 50%.',model=Model'models/tsbb/vegetables/pumpkin.mdl',icon='materials/galactic/ui/foods/pumpkinsoup.png',trade='FOOD_PUMPKIN',power=50,tradeamount=75,tradecolor=col.purple,interaction={Use=h(100,1.5)}})srp.items.Register('Basic Foods','FOOD_PUMPKIN_PIE',{base='CONSUME',name='Pumkin Pie',maxstack=150,description='Yum. Gives a large amount of HP up to 50% extra HP.',model=Model'models/tsbb/vegetables/pumpkin.mdl',icon='materials/galactic/ui/foods/pumpkin-pie.png',interaction={Use=h(200,1.5)},power=125,trade='FOOD_PUMPKIN',tradecolor=col.purple,tradeamount=120})srp.items.Register('Basic Foods','FOOD_ZOMBIE_HAND',{base='CORE',name='Zombie Hand',maxstack=150,description='Used for something... but what?',icon='materials/galactic/ui/foods/handpart.png',trade='FOOD_PUMPKIN',tradecolor=col.purple,tradeamount=20})srp.items.Register('Basic Foods','FOOD_SPIDER',{base='CORE',name='Spiders',maxstack=150,description='Used for something... but what?',icon='materials/galactic/seasonal/halloween/spider.png',trade='FOOD_PUMPKIN',tradecolor=col.purple,tradeamount=5})srp.items.Register('Basic Foods','FOOD_FROGSLEGS',{base='CORE',name='Frogs Legs',maxstack=150,description='Hippity hoppity..... no.',icon='materials/galactic/seasonal/halloween/frog.png',trade='FOOD_PUMPKIN',tradecolor=col.purple,tradeamount=10})srp.items.Register('Basic Foods','HALLOWEEN_POTION',{base='CORE',name='Halloween Potion',maxstack=150,description='I probably shouldn\'t consume this... or should I.',icon='materials/galactic/seasonal/halloween/cauldron.png',color=col.green:Copy(),tradecolor=col.purple:Copy(),interaction={Use={label='Slurp',color=col.purple,count=1,callback=function(self,b,c,d,e)srp.items.TrackConsumeable(b,self.id,'Consume')return 1 end},Consume={consumeable=true,consumeduration=120,callbackstart=function(self,b)b:Timer('sick',2,5,function(self)self:TakeDamage(50)end)end,callbackend=function(self,b)b:DestroyTimer('sick')end}}})srp.items.Register('Basic Foods','HALLOWEEN_JUMP_POTION',{base='CORE',name='Jumping Potion',maxstack=150,description='Gives you jumping abilities!',icon='materials/galactic/seasonal/halloween/cauldron.png',color=col.red:Copy(),tradecolor=col.purple:Copy(),interaction={Use={label='Slurp',color=col.purple,count=1,callback=function(self,b,c,d,e)srp.items.TrackConsumeable(b,self.id,'Consume')return 1 end},Consume={consumeable=true,consumeduration=180,callbackstart=function(self,b)b:SetJumpPower(240)end,callbackend=function(self,b)b:ApplyTalent'jumppower'end}}})srp.items.Register('Basic Foods','HALLOWEEN_SPEED_POTION',{base='CORE',name='Speed Potion',maxstack=150,description='Gives you extra-running abilities!',icon='materials/galactic/seasonal/halloween/cauldron.png',color=col.blue_light:Copy(),tradecolor=col.purple:Copy(),interaction={Use={label='Slurp',color=col.purple,count=1,callback=function(self,b,c,d,e)srp.items.TrackConsumeable(b,self.id,'Consume')return 1 end},Consume={consumeable=true,consumeduration=180,callback=function(self,b)local e=self:GetCount()-1;if e<=0 then self:Remove()else self:SetCount(e)end end,callbackstart=function(self,b)b:SetRunSpeed(220)end,callbackend=function(self,b)b:ApplyTalent'runspeed'end}}})srp.items.Register('Basic Foods','XMAS_COAL',{base='CORE',name='Coal',description='What happens if I eat this? Something good I hope.',cantrade=true,nodrop=false,interaction={Use={label='Chomp',color=col.grey_dark,count=1,callback=function(self,b,c,d,e)srp.items.TrackConsumeable(b,self.id,'Consume')return 1 end},Consume={consumeable=true,consumeduration=240,callback=function(self,b)local e=self:GetCount()-1;if e<=0 then self:Remove()else self:SetCount(e)end end,callbackstart=function(self,b)b:SetRunSpeed(50)b:SetHealth(1)end,callbackend=function(self,b)b:ApplyTalent'runspeed'end}}})srp.items.Register('Basic Foods','XMAS_HOTCHOCOLATE',{base='CORE',name='Hot choccy',maxstack=150,description='Gives you extra-running abilities!',icon='materials/galactic/seasonal/christmas/chocolate.png',trade='FOOD_CANDYCANE',tradeamount=150,tradecolor=col.black:Copy(),interaction={Use={label='Slurp',color=col.green_dark,count=1,callback=function(self,b,c,d,e)srp.items.TrackConsumeable(b,self.id,'Consume')return 1 end},Consume={consumeable=true,consumeduration=240,callback=function(self,b)local e=self:GetCount()-1;if e<=0 then self:Remove()else self:SetCount(e)end end,callbackstart=function(self,b)b:SetRunSpeed(245)end,callbackend=function(self,b)b:ApplyTalent'runspeed'end}}})srp.items.Register('Basic Foods','XMAS_FRIEDCHICKEN',{base='CORE',name='Fried Chicken',maxstack=150,description='Gives you jumping abilities!',icon='materials/galactic/seasonal/christmas/friedchicken.png',tradecolor=col.black:Copy(),trade='FOOD_CANDYCANE',tradeamount=150,interaction={Use={label='Feast',color=col.green_dark,count=1,callback=function(self,b,c,d,e)srp.items.TrackConsumeable(b,self.id,'Consume')return 1 end},Consume={consumeable=true,consumeduration=240,callbackstart=function(self,b)b:SetJumpPower(300)end,callbackend=function(self,b)b:ApplyTalent'jumppower'end}}})srp.items.Register('Alcohol','XMAS_WINE',{base='ALCOHOL',name='Winter Wine',maxstack=250,description='Nice winter spiced wine',model=Model'models/props_junk/garbage_milkcarton001a.mdl',icon='materials/galactic/seasonal/christmas/wine.png',tradedisabled=true,trade='FOOD_CANDYCANE',tradeamount=50,tradecolor=col.black,interaction={OnPickup={consumeduration=60,clhooks={RenderScreenspaceEffects=function(self)DrawMotionBlur(0.03,0.8,0.08)end}}}})srp.items.Register('Liquids','XMAS_EGGNOG',{base='CONSUME',name='Eggnog',maxstack=250,description='Drink your eggnog and become a strong lad. Increases current weapons damage by 15%',model=Model'models/props_junk/garbage_milkcarton001a.mdl',icon='materials/galactic/seasonal/christmas/eggnog.png',tradedisabled=true,trade='FOOD_CANDYCANE',tradeamount=150,tradecolor=col.black,interaction={Use={label='Drink Your Nog',color=col.purple,count=1,callback=function(self,b,c,d,e)local p=b:GetActiveWeapon()if!IsValid(p)then return false end;p.JuiceBoost=p.JuiceBoost||p.SaberDamage||p.Primary.Damage||p.Damage;p.Damage=(p.JuiceBoost||p.Damage)*1.15;p.SaberDamage=(p.JuiceBoost||p.SaberDamage)*1.15;p.Primary.Damage=(p.JuiceBoost||p.Primary.Damage)*1.15;srp.notif.Success(b,3,'Lubricant temporary applied to weapon')return 1 end}}})srp.items.Register('Liquids','XMAS_COOKIEMILK',{base='CONSUME',name='Cookies & Milk',maxstack=250,description='Dunk your cookies in your warm milk like the little bitch you are and become a strong lad. Increases current weapons damage by 20%',model=Model'models/props_junk/garbage_milkcarton001a.mdl',icon='materials/galactic/seasonal/christmas/cookie.png',tradedisabled=true,trade='FOOD_CANDYCANE',tradeamount=250,tradecolor=col.black,interaction={Use={label='Drink Your Nog',color=col.purple,count=1,callback=function(self,b,c,d,e)local p=b:GetActiveWeapon()if!IsValid(p)then return false end;p.JuiceBoost=p.JuiceBoost||p.SaberDamage||p.Primary.Damage||p.Damage;p.Damage=(p.JuiceBoost||p.Damage)*1.2;p.SaberDamage=(p.JuiceBoost||p.SaberDamage||0)*1.2;p.Primary.Damage=(p.JuiceBoost||p.Primary.Damage)*1.2;srp.notif.Success(b,3,'Lubricant temporary applied to weapon')return 1 end}}})srp.items.Register('Basic Foods','FOOD_GINGERBREAD',{base='CONSUME',name='Ginger Bread Man',maxstack=150,description='Yum. Gives 40HP up to 25% HP over your maximum HP.',model=Model'models/tsbb/vegetables/pumpkin.mdl',icon='materials/galactic/seasonal/christmas/gingerbread man.png',interaction={Use=h(40,1.25)},power=125,trade='FOOD_CANDYCANE',tradecolor=col.black,tradeamount=125})srp.items.Register('Basic Foods','FOOD_CUPCAKE',{base='CONSUME',name='Cup Cake',maxstack=150,description='Yum. Gives 50HP up to 20% HP over your maximum HP.',model=Model'models/tsbb/vegetables/pumpkin.mdl',icon='materials/galactic/seasonal/christmas/cupcake.png',interaction={Use=h(50,1.2)},power=125,trade='FOOD_CANDYCANE',tradecolor=col.black,tradeamount=85})srp.items.Register('Basic Foods','FOOD_XMASLOG',{base='CONSUME',name='Christmas Log',maxstack=150,description='Yum. Gives 50HP up to 30% HP over your maximum HP.',model=Model'models/tsbb/vegetables/pumpkin.mdl',icon='materials/galactic/seasonal/christmas/christmas log.png',interaction={Use=h(50,1.3)},power=125,trade='FOOD_CANDYCANE',tradecolor=col.black,tradeamount=100})srp.items.Register('Basic Foods','FOOD_TURKEY',{base='CONSUME',name='Turkey',maxstack=150,description='Yum. Gives 50HP up to 20% HP over your maximum HP.',model=Model'models/tsbb/vegetables/pumpkin.mdl',icon='materials/galactic/seasonal/christmas/turkey.png',interaction={Use=h(50,1.2)},power=125,trade='FOOD_CANDYCANE',tradecolor=col.black,tradeamount=150})srp.items.Register('Basic Foods','VALENTINE_CHOCOLATE',{base='CONSUME',name='Valentines Chocolate',maxstack=150,description='Yum. Gives 20HP up to 30% HP over your maximum HP.',icon='materials/galactic/seasonal/valentines/chocolates.png',interaction={Use=h(20,1.3)},power=125,trade='VALENTINE_PETALS',tradecolor=col.black,tradeamount=25})srp.items.Register('Basic Foods','VALENTINE_STRAWBERRY',{base='CONSUME',name='Valentines Strawberry',maxstack=150,description='Yum. Gives 50HP up to 50% HP over your maximum HP.',icon='materials/galactic/seasonal/valentines/strawberry.png',interaction={Use=h(50,1.5)},power=125,trade='VALENTINE_PETALS',tradecolor=col.black,tradeamount=75})srp.items.Register('Basic Foods','VALENTINE_PETALS',{base='CONSUME',name='Valentines Petals',maxstack=150,description='Gross. Gives 2HP.',icon='materials/galactic/seasonal/valentines/petals.png',interaction={Use=h(2,1)},power=125,cantrade=false,nodrop=true,weight=0})srp.items.Register('Basic Foods','VALENTINE_ROSE',{base='CONSUME',name='Valentines Rose',maxstack=150,description='Gross. Gives 5HP.',icon='materials/galactic/seasonal/valentines/rose.png',interaction={Use=h(5,1)},power=125,scrap='VALENTINE_PETALS',scrapcount=8,cantrade=false,nodrop=true,weight=0})srp.items.Register('Incubator','EASTER_INCUBATION_EGG',{base='CONSUME',name='Incubation Egg',maxstack=150,description='Incubate me, please!',icon='materials/galactic/seasonal/easter/egg.png',interaction={Use=h(5,1)},cantrade=false,nodrop=true,tradecolor=col.yellow,UseIncubated=function(b)print'Incubation unlock!'end})srp.items.Register('Incubator','INCUBATOR_DNASAMPLE',{base='CONSUME',name='DNA Strand',maxstack=150,description='Decreases incubation time on eggs',icon='materials/galactic/seasonal/easter/egg.png',interaction={Use=h(5,1)},cantrade=false,nodrop=true,tradecolor=col.yellow})srp.items.Register('Basic Foods','EASTER_EGG',{base='CONSUME',name='Easter Egg',maxstack=150,description='Yummy choccy egg. Gives 100 HP with a 5% overheal.',icon='materials/galactic/seasonal/easter/egg.png',interaction={Use=h(50,1.05)},power=125,cantrade=false,nodrop=true,tradecolor=col.yellow})srp.items.Register('Basic Foods','FOOD_ICECUBES',{base='CONSUME',name='Ice Cubes',maxstack=150,description='Munch on these to gain 50HP up to 10% HP over your maximum HP.',icon='materials/galactic/seasonal/summer/icecube.png',interaction={Use=h(25,1.10)},power=125,tradecolor=col.orange})srp.items.Register('Basic Foods','FOOD_BURGER',{base='CONSUME',name='Burger',maxstack=150,description='Munch on these to gain 25HP up to 10% HP over your maximum HP.',icon='materials/galactic/seasonal/summer/burger.png',interaction={Use=h(25,1.10)},power=125,tradecolor=col.orange})srp.items.Register('Basic Foods','FOOD_HOTDOG',{base='CONSUME',name='Hotdog',maxstack=150,description='Suck it and gain 50 HP up to 15% over your maximum HP',icon='materials/galactic/seasonal/summer/hotdog.png',interaction={Use=h(50,1.15)},power=125,tradecolor=col.orange})srp.items.Register('Basic Foods','FOOD_ICECREAM',{base='CONSUME',name='Icecream',maxstack=150,description='Lick it and gain 75 HP up to 15% over your maximum HP',icon='materials/galactic/seasonal/summer/icecream.png',interaction={Use=h(75,1.15)},power=125,tradecolor=col.orange})srp.items.Register('Basic Foods','FOOD_ICECREAMPOT',{base='CONSUME',name='Icecream Pot',maxstack=150,description='Lick it and gain 75 HP up to 15% over your maximum HP',icon='materials/galactic/seasonal/summer/icecreamtub.png',interaction={Use=h(75,1.15)},power=125,tradecolor=col.orange})srp.items.Register('Liquids','FOOD_FRESHDRINK',{base='CONSUME',name='Fresh Iced Drink',maxstack=150,description='Drink it and gain 150 HP up to 20% over your maximum HP',icon='materials/galactic/seasonal/summer/freshdrink.png',interaction={Use=h(150,1.2)},power=125,tradecolor=col.orange})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/resources/food_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/npc/dialogues_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/npc/npcs_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/training_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/drgbase_possessor.lua:
AddCSLuaFile()SWEP.PrintName="Possessor"SWEP.Category="DrGBase"SWEP.Spawnable=true;SWEP.AdminOnly=false;SWEP.Primary.Ammo=""SWEP.Secondary.Ammo=""SWEP.WorldModel=""SWEP.ViewModel="models/weapons/v_bugbait.mdl"SWEP.DrawAmmo=false;SWEP.AutoSwitchTo=false;SWEP.Slot=5;local function a(b)return b.IsDrGNextbot&&b.PossessionPrompt&&b:IsPossessionEnabled()end;function SWEP:Initialize()self:SetHoldType("magic")end;function SWEP:PrimaryAttack()if CLIENT then return end;local c=self:GetOwner()if!IsValid(c)then return end;if!c:IsPlayer()then return end;local d=c:GetEyeTraceNoCursor()if IsValid(d.Entity)&&a(d.Entity)then local e=d.Entity:Possess(c)if e=="ok"then net.Start("DrGBaseNextbotCanPossess")net.WriteEntity(d.Entity)else net.Start("DrGBaseNextbotCantPossess")net.WriteEntity(d.Entity)net.WriteString(e)end;net.Send(c)end end;function SWEP:SecondaryAttack()end;function SWEP:Reload()end;hook.Add("PreDrawHalos","DrGBasePossessorSWEPHalos",function()local f=LocalPlayer()local g=f:GetActiveWeapon()if IsValid(g)&&g:GetClass()=="drgbase_possessor"then local d=f:GetEyeTraceNoCursor()local b=d.Entity;if!IsValid(b)then return end;if a(b)&&!b:IsPossessed()then halo.Add({b},DrGBase.CLR_GREEN)else halo.Add({b},DrGBase.CLR_RED)end end end)
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/axis.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/lamp.lua:
return lpakr()()
--addons/ssrp_tools_npc/lua/weapons/gmod_tool/stools/npc_relationship.lua:
TOOL.Name = '#Tool.npc_relationship.name'
TOOL.Category = 'Superior Tools'

if CLIENT then
	language.Add('Tool.npc_relationship.name', 'NPC Relationships')
	language.Add('Tool.npc_relationship.desc', 'Change the relationships of npcs')
	language.Add('Tool.npc_relationship.left', 'Select an NPC to modify')
	language.Add('Tool.npc_relationship.left_1', 'Select a player or NPC to update relation')
	language.Add('Tool.npc_relationship.right', 'Select an NPC to class modify')
	language.Add('Tool.npc_relationship.right_1', 'Select an NPC or player to class modify')
	language.Add('Tool.npc_relationship.reload', 'Clears the target\'s class relationship status for new npcs.')
end

TOOL.Information = {
	{ name = 'left', stage = 0,  op = 0},
	{ name = 'left_1', stage = 1,  op = 0},
	{ name = 'right', stage = 0, op = 0},
	{ name = 'right', stage = 0, op = 1},
	{ name = 'right_1', stage = 1, op = 1},
	{ name = 'reload' }
}

TOOL.ClientConVar['relation'] = 'D_NU'
TOOL.ClientConVar['priority'] = 99

local blacklist = {
	['npc_stalker'] = true,
	['npc_strider'] = true,
}

local classrelations = {}
local relations = {
	['D_LI'] = {name = 'Like', enum = D_LI},
	['D_NU'] = {name = 'Neutral', enum = D_NU},
	['D_FR'] = {name = 'Fear', enum = D_FR},
	['D_HT'] = {name = 'Hate', enum = D_HT}
}

function TOOL:Holster()
	self.target = nil
	self.class_target = nil
	self:SetStage(0)
	self:SetOperation(0)
end

function TOOL.IsBlacklisted(e)
	return blacklist[e:GetClass()]
end

function TOOL:LeftClick(trace)
	if CLIENT then 
		return true 
	end

	local target = trace.Entity
	if not IsValid(target) or not (target:IsNPC() or target:IsPlayer()) then
		if IsValid(self.target) then
			target = self:GetOwner()
		else
			return
		end
	end

	if self.IsBlacklisted(target) then
		return false
	end

	local cvar_rel = self:GetClientInfo('relation')
	local relation = relations[cvar_rel] and relations[cvar_rel].enum or D_NU
	local priority = math.Clamp(self:GetClientNumber('priority', 99), 1, 99)
	
	if self.target == target then
		return false
	end

	self:SetOperation(0)

	if IsValid(self.target) then
		self:SetStage(0)
		self.target:AddEntityRelationship(target, relation, priority)
		if target:IsNPC() then
			target:AddEntityRelationship(self.target, relation, priority)
		end
		self.target = nil
	else
		self:SetStage(1)
		self.target = target
	end

	return true
end

function TOOL:RightClick(trace)
	if CLIENT then 
		return true
	end

	local target = trace.Entity
	if not IsValid(target) or not (target:IsNPC() or target:IsPlayer()) then
		target = self:GetOwner()
	end

	if self.IsBlacklisted(target) then
		return false
	end

	local cvar_rel = self:GetClientInfo('relation')
	local relation = relations[cvar_rel] and cvar_rel or 'D_NU'
	local priority = math.Clamp(self:GetClientNumber('priority', 99), 1, 99)

	if (not IsValid(self.class_target) and not target:IsNPC()) or self.class_target == target then
		return false
	end

	if IsValid(self.class_target) then
		self:SetStage(0)
		self:SetOperation(0)

		if target:IsNPC() then
			target:AddRelationship(self.class_target:GetClass() .. ' ' .. relation .. ' ' .. priority)
		end

		self.class_target:AddRelationship(target:GetClass() .. ' ' .. relation .. ' ' .. priority)
		self:AddClassRelationship(self.class_target, target, relation, priority)
		self.class_target = nil
	else
		self:SetOperation(1)
		self:SetStage(1)

		self.class_target = target
	end

	return true
end

function TOOL:Reload(trace)
	if CLIENT then 
		return true 
	end

	self:SetOperation(0)
	self:SetStage(0)

	if 	not IsValid(trace.Entity) or 
		not trace.Entity:IsNPC() then
		self.class_target = nil
		self.target = nil
		return false
	end
	
	local c1 = trace.Entity:GetClass()
	if not classrelations[c1] then
		return
	end

	for c2, _ in ipairs(classrelations[c1]) do
		if classrelations[c2] then
			classrelations[c2][c1] = nil
		end
	end

	classrelations[c1] = nil
	return true
end

function TOOL:AddClassRelationship(first, second, relation, priority)
	local c1, c2 = first:GetClass(), second:GetClass()

	classrelations[c1] = classrelations[c1] or {}
	classrelations[c1][c2] = {relation, priority}

	srp.notif.Neutral(self:GetOwner(), 3, term.Get('ToolNPCRelationshipAdded'), c1, c2)

	for _, e in ipairs(ents.FindByClass(c1)) do
		e:AddRelationship(c2 .. ' ' .. relation .. ' ' .. priority)
	end

	if second:IsNPC() then
		classrelations[c2] = classrelations[c2] or {}
		classrelations[c2][c1] = {relation, priority}

		for _, e in ipairs(ents.FindByClass(c2)) do
			e:AddRelationship(c1 .. ' ' .. relation .. ' ' .. priority)
		end
	end
end

function TOOL.BuildCPanel(cpanel)
	cpanel:AddControl('Header', {
		Description = '#tool.npc_relationship.desc'
	})

	local options = {}
	for id, dat in pairs(relations) do
		options[dat.name] = {npc_relationship_relation = id}
	end

	cpanel:AddControl('ListBox', {
		Label = 'Relationship Mode', 
		Help = true, 
		Options = options
	})

 	cpanel:AddControl('Slider', {
		Label = 'Priority', 
		Command = 'npc_relationship_priority', 
		Min = 1, 
		Max = 99
	})
end

if SERVER then
	hook('PlayerSpawnedNPC', function(pl, ent) 
		local relations = classrelations[ent:GetClass()]
		if relations then 
			for c2, data in pairs(relations) do
				ent:AddRelationship(c2 .. ' ' .. data[1] .. ' ' .. data[2])
			end
		end
	end)
end
--addons/!lpakr_out/lua/improvedstacker/localization.lua:
local a="#tool.stacker_improved."localify.Bind("en",a.."language_en","English")localify.Bind("bg",a.."language_bg","Български")localify.Bind("fr",a.."language_fr","Français")localify.Bind("pl",a.."language_pl","Polski")localify.Bind("ru",a.."language_ru","Русский")localify.Bind("zh-cn",a.."language_zh-cn","简体中文")localify.Bind("en",a.."name","Stacker - Improved")localify.Bind("en",a.."desc","Easily stack duplicated props in any direction")localify.Bind("en",a.."left","Create a stack")localify.Bind("en",a.."shift_left","Increase stack size")localify.Bind("en",a.."right","Create a single prop")localify.Bind("en",a.."shift_right","Decrease stack size")localify.Bind("en",a.."reload","Change stack direction")localify.Bind("en","Undone_stacker_improved","Undone stacked prop(s)")localify.Bind("en",a.."error_blocked_by_server","The server has blocked you from changing this console variable")localify.Bind("en",a.."error_not_admin","You must be in the 'admin' usergroup to change this console variable")localify.Bind("en",a.."error_invalid_argument","You must enter a valid number value")localify.Bind("en",a.."error_max_per_stack","The max props that can be stacked at once is limited to ")localify.Bind("en",a.."error_too_quick","You are using stacker too quickly")localify.Bind("en",a.."error_max_per_player","Stacker prop limit reached")localify.Bind("en",a.."error_not_in_world","Stacked props must be spawned within the world")localify.Bind("en",a.."error_max_constraints","Failed to create constraint, most likely ran out of entity slots")localify.Bind("en",a.."label_presets","Stacker Presets: ")localify.Bind("en",a.."label_relative","Stack relative to: ")localify.Bind("en",a.."label_direction","Stack direction: ")localify.Bind("en",a.."label_count","Stack size")localify.Bind("en",a.."label_reset_offsets","Reset offsets")localify.Bind("en",a.."label_reset_angles","Reset angles")localify.Bind("en",a.."label_show_settings","Click to show settings")localify.Bind("en",a.."label_hide_settings","Click to hide settings")localify.Bind("en",a.."label_x","X  (-back, +front)")localify.Bind("en",a.."label_y","Y  (-left, +right)")localify.Bind("en",a.."label_z","Z  (-down, +up)")localify.Bind("en",a.."label_pitch","Pitch  (-down, +up)")localify.Bind("en",a.."label_yaw","Yaw   (-left, +right)")localify.Bind("en",a.."label_roll","Roll    (-left, +right)")localify.Bind("en",a.."label_language","Language: ")localify.Bind("en",a.."label_credits","")localify.Bind("en",a.."label_max_per_stack","Stack size")localify.Bind("en",a.."label_max_per_player","Props per player")localify.Bind("en",a.."label_max_offsetx","Maximum X offset")localify.Bind("en",a.."label_max_offsety","Maximum Y offset")localify.Bind("en",a.."label_max_offsetz","Maximum Z offset")localify.Bind("en",a.."label_delay","Delay")localify.Bind("en",a.."label_opacity","Opacity")localify.Bind("en",a.."checkbox_freeze","Freeze stacked props")localify.Bind("en",a.."checkbox_weld","Weld stacked props")localify.Bind("en",a.."checkbox_nocollide","No-Collide stacked props with each other")localify.Bind("en",a.."checkbox_nocollide_all","No-Collide stacked props with EVERYTHING")localify.Bind("en",a.."checkbox_use_shift_key","Change stack size with SHIFT + left/right-click")localify.Bind("en",a.."checkbox_relative","Stack relative to new rotation")localify.Bind("en",a.."checkbox_material","Apply material")localify.Bind("en",a.."checkbox_color","Apply color")localify.Bind("en",a.."checkbox_physprop","Apply physical properties")localify.Bind("en",a.."checkbox_ghost","Ghost all props in the stack")localify.Bind("en",a.."checkbox_halo","Add halos to ghosted props")localify.Bind("en",a.."checkbox_halo_color","Halo color")localify.Bind("en",a.."checkbox_axis","Draw XYZ axis")localify.Bind("en",a.."checkbox_axis_labels","Draw XYZ axis labels")localify.Bind("en",a.."checkbox_axis_angles","Draw XYZ axis angles")localify.Bind("en",a.."checkbox_stayinworld","Stay in world")localify.Bind("en",a.."combobox_world","World")localify.Bind("en",a.."combobox_prop","Prop")localify.Bind("en",a.."combobox_direction_up","Up")localify.Bind("en",a.."combobox_direction_down","Down")localify.Bind("en",a.."combobox_direction_front","Front")localify.Bind("en",a.."combobox_direction_back","Back")localify.Bind("en",a.."combobox_direction_right","Right")localify.Bind("en",a.."combobox_direction_left","Left")localify.Bind("en",a.."combobox_default","Default")localify.Bind("en",a.."combobox_sandbox","Sandbox")localify.Bind("en",a.."combobox_darkrp","DarkRP")localify.Bind("en",a.."combobox_singleplayer","Singleplayer")localify.Bind("en",a.."hud_front","Front")localify.Bind("en",a.."hud_right","Right")localify.Bind("en",a.."hud_up","Up")localify.Bind("en",a.."help_max_per_player","Maximum stacked props each player is limited to.")localify.Bind("en",a.."help_max_per_stack","Maximum props per stack (left-click).")localify.Bind("en",a.."help_delay","Delay (in seconds) between each Stacker use (left/right-click)")localify.Bind("en",a.."help_max_offsetx","Maximum distance between stacked props (X-axis).")localify.Bind("en",a.."help_max_offsety","Maximum distance between stacked props (Y-axis).")localify.Bind("en",a.."help_max_offsetz","Maximum distance between stacked props (Z-axis).")localify.Bind("en",a.."help_freeze","Stacked props are frozen when spawned.")localify.Bind("en",a.."help_weld","Stacked props are welded to each other when spawned.")localify.Bind("en",a.."help_nocollide","Stacked props won't collide with other stacked props.")localify.Bind("en",a.."help_nocollide_all","Stacked props won't collide with anything except players, NPCs, vehicles, and the world.")localify.Bind("en",a.."help_stayinworld","Prevents stacked props from being created outside of the map.")localify.Bind("en",a.."warning_max_per_player","Primarily for Roleplay gamemodes. For Sandbox gamemodes, this should generally be unlimited (-1).")localify.Bind("en",a.."warning_max_offsetx","Primarily for Roleplay gamemodes. Don't modify unless you know what you're doing.")localify.Bind("en",a.."warning_max_offsety","Primarily for Roleplay gamemodes. Don't modify unless you know what you're doing.")localify.Bind("en",a.."warning_max_offsetz","Primarily for Roleplay gamemodes. Don't modify unless you know what you're doing.")localify.Bind("en",a.."warning_freeze","For DarkRP.")localify.Bind("en",a.."warning_weld","For DarkRP.")localify.Bind("en",a.."warning_nocollide","For DarkRP.")localify.Bind("en",a.."warning_nocollide_all","DO NOT CHANGE WHILE THE SERVER IS RUNNING. This uses the GM.ShouldCollide hook and is experimental. It works and is guaranteed to stop crashes from Stacker, but needs more testing.")localify.Bind("bg",a.."name","Натрупвач - Подобрен")localify.Bind("bg",a.."desc","Лесно натрупва еднакви предмети във всяка посока")localify.Bind("bg",a.."left","Създай натрупване")localify.Bind("bg",a.."shift_left","Увеличи размера на натрупването")localify.Bind("bg",a.."right","Създай единичен обект")localify.Bind("bg",a.."shift_right","Намали размера на натрупването")localify.Bind("bg",a.."reload","Смени направлението на натрупване")localify.Bind("bg","Undone_stacker_improved","Премахва натрупването на предмет(и)")localify.Bind("bg",a.."error_blocked_by_server","Сървърът ви е блокирал да променяте тази конзолна променлива")localify.Bind("bg",a.."error_not_admin","Трябва да бъдете в групата 'admin' за да промените тази конзолна променлива")localify.Bind("bg",a.."error_invalid_argument","Трябва да въведете валидно число за тази стойност")localify.Bind("bg",a.."error_max_per_stack","Максималния брой предмети които могат да бъдат натрупани на един път е ограничен до ")localify.Bind("bg",a.."error_too_quick","Използвате натрупвача твърде бързо")localify.Bind("bg",a.."error_max_per_player","Ограничението за натрупани предмети е достигнато")localify.Bind("bg",a.."error_not_in_world","Натрупваните предмети трябва да се създават вътре в света")localify.Bind("bg",a.."error_max_constraints","Не можа да се създаде връзка, най вероятно са свършили слотовете за обекти")localify.Bind("bg",a.."label_presets","Шаблон на натрупвача: ")localify.Bind("bg",a.."label_relative","Натрупвай спрямо: ")localify.Bind("bg",a.."label_direction","Направление на натрупване: ")localify.Bind("bg",a.."label_count","Размер на натрупване")localify.Bind("bg",a.."label_reset_offsets","Нулиране на отместването")localify.Bind("bg",a.."label_reset_angles","Нулиране на ъглите")localify.Bind("bg",a.."label_show_settings","Цъкнете за показване на настройки")localify.Bind("bg",a.."label_hide_settings","Цъкнете за скриване на настройки")localify.Bind("bg",a.."label_x","Абсциса  (-назад, +напред)")localify.Bind("bg",a.."label_y","Ордината  (-ляво, +дясно)")localify.Bind("bg",a.."label_z","Апликата  (-долу, +горе)")localify.Bind("bg",a.."label_pitch","Тангаж  (-долу, +горе)")localify.Bind("bg",a.."label_yaw","Азимут  (-ляво, +дясно)")localify.Bind("bg",a.."label_roll","Крен    (-ляво, +дясно)")localify.Bind("bg",a.."label_language","Език: ")localify.Bind("bg",a.."label_credits","Преведено от: [BG][Sk&Bh]Trick or treat KID!")localify.Bind("bg",a.."label_max_per_stack","Брой на натрупване")localify.Bind("bg",a.."label_max_per_player","Брой предмети на играч")localify.Bind("bg",a.."label_max_offsetx","Максимално отместване по абсциса")localify.Bind("bg",a.."label_max_offsety","Максимално отместване по ордината")localify.Bind("bg",a.."label_max_offsetz","Максимално отместване по апликата")localify.Bind("bg",a.."label_delay","Закъснение")localify.Bind("bg",a.."label_opacity","Тъмнота")localify.Bind("bg",a.."checkbox_freeze","Замрази натрупаните предмети")localify.Bind("bg",a.."checkbox_weld","Завари натрупаните предмети")localify.Bind("bg",a.."checkbox_nocollide","Не-сблъсък на натрупаните предмети един към друг")localify.Bind("bg",a.."checkbox_nocollide_all","Не-сблъсък на натрупаните предмети с ВСИЧКО")localify.Bind("bg",a.."checkbox_relative","Натрупвай спрямо новата ориентация")localify.Bind("bg",a.."checkbox_material","Приложи текстура")localify.Bind("bg",a.."checkbox_color","Приложи цвят")localify.Bind("bg",a.."checkbox_physprop","Приложи физически свойства")localify.Bind("bg",a.."checkbox_ghost","Сенки за всички предмети в стека")localify.Bind("bg",a.."checkbox_halo","Добави ореоли към предметите сенки")localify.Bind("bg",a.."checkbox_halo_color","Цвят на ореола")localify.Bind("bg",a.."checkbox_axis","Чертай осите XYZ")localify.Bind("bg",a.."checkbox_axis_labels","Чертай етикети на XYZ осите")localify.Bind("bg",a.."checkbox_axis_angles","Чертай ъглите на XYZ осите")localify.Bind("bg",a.."checkbox_stayinworld","Натрупвай в рамките на света")localify.Bind("bg",a.."combobox_world","Свят")localify.Bind("bg",a.."combobox_prop","Предмет")localify.Bind("bg",a.."combobox_direction_up","Горе")localify.Bind("bg",a.."combobox_direction_down","Долу")localify.Bind("bg",a.."combobox_direction_front","Отпред")localify.Bind("bg",a.."combobox_direction_back","Отзад")localify.Bind("bg",a.."combobox_direction_right","Дясно")localify.Bind("bg",a.."combobox_direction_left","Ляво")localify.Bind("bg",a.."combobox_default","По подразбиране")localify.Bind("bg",a.."combobox_sandbox","Пясъчник")localify.Bind("bg",a.."combobox_darkrp","Ролева игра")localify.Bind("bg",a.."combobox_singleplayer","Самостоятелна игра")localify.Bind("bg",a.."hud_front","Отпред")localify.Bind("bg",a.."hud_right","Дясно")localify.Bind("bg",a.."hud_up","Горе")localify.Bind("bg",a.."help_max_per_player","Максимален брой натрупвани предмети до които е ограничен всеки играч")localify.Bind("bg",a.."help_max_per_stack","Максимален брой предмети при всяко натрупване (ляв клик).")localify.Bind("bg",a.."help_delay","Закъснение (в секунди) между всяко използване на натрупвача (ляв/десен клик)")localify.Bind("bg",a.."help_max_offsetx","Максимално разстояние между натрупаните предмети (абсциса).")localify.Bind("bg",a.."help_max_offsety","Максимално разстояние между натрупаните предмети (ордината).")localify.Bind("bg",a.."help_max_offsetz","Максимално разстояние между натрупаните предмети (апликата).")localify.Bind("bg",a.."help_freeze","Натрупваните предмети са замразени при създаване.")localify.Bind("bg",a.."help_weld","Натрупваните предмети са заварени по между си при създаване.")localify.Bind("bg",a.."help_nocollide","Натрупваните предмети няма да се сблъскват с други такива.")localify.Bind("bg",a.."help_nocollide_all","Натрупваните предмети няма да се сблъскват с всичко освен играчи, NPC, превозни средства, и света.")localify.Bind("bg",a.."help_stayinworld","Предотвратява натрупваните обекти да бъдат създавани извън света.")localify.Bind("bg",a.."warning_max_per_player","Преди всичко за режими на Ролева игра. За режим Пясъчник, това трябва генерално да бъде неограничено (-1).")localify.Bind("bg",a.."warning_max_offsetx","Преди всичко за режими на Ролева игра. Не модифицирайте ако не знаете какво правите.")localify.Bind("bg",a.."warning_max_offsety","Преди всичко за режими на Ролева игра. Не модифицирайте ако не знаете какво правите.")localify.Bind("bg",a.."warning_max_offsetz","Преди всичко за режими на Ролева игра. Не модифицирайте ако не знаете какво правите.")localify.Bind("bg",a.."warning_freeze","За режим на Ролева игра.")localify.Bind("bg",a.."warning_weld","За режим на Ролева игра.")localify.Bind("bg",a.."warning_nocollide","За режим на Ролева игра.")localify.Bind("bg",a.."warning_nocollide_all","НЕ ПРОМЕНЯЙТЕ ДОКАТО СЪРВЪРА РАБОТИ. Това използва кука /GM.ShouldCollide/ и е експериментално. Работи и с гаранция ще спре крашовете, но се нуждае от още тестване.")localify.Bind("fr",a.."name","Stacker - Amélioré")localify.Bind("fr",a.."desc","Empilez facilement les props dupliqués dans n'importe quelle direction")localify.Bind("fr",a.."left","Créer une pile")localify.Bind("fr",a.."shift_left","Augmenter la taille des piles")localify.Bind("fr",a.."right","Créer un seul prop")localify.Bind("fr",a.."shift_right","Diminuer la taille de la pile")localify.Bind("fr",a.."reload","Changer la direction de la pile")localify.Bind("fr","Undone_stacker_improved","Annuler le(s) prop(s) empilé(s)")localify.Bind("fr",a.."error_blocked_by_server","Le serveur vous a empêché de modifier cette variable de console")localify.Bind("fr",a.."error_not_admin","Vous devez être dans le groupe d'utilisateurs 'admin' pour modifier cette variable de console")localify.Bind("fr",a.."error_invalid_argument","Vous devez entrer une valeur numérique valide")localify.Bind("fr",a.."error_max_per_stack","Les props maximum qui peuvent être empilés à la fois sont limités à ")localify.Bind("fr",a.."error_too_quick","Vous utilisez l'empileur trop rapidement")localify.Bind("fr",a.."error_max_per_player","Limite de l'empileur atteinte")localify.Bind("fr",a.."error_not_in_world","Les props empilés doivent être engendrés dans le monde")localify.Bind("fr",a.."error_max_constraints","Échec de la création de la contrainte, très probablement à court d'emplacements d'entité")localify.Bind("fr",a.."label_presets","Préréglages de l'empileur ")localify.Bind("fr",a.."label_relative","Pile relatif au: ")localify.Bind("fr",a.."label_direction","Direction: ")localify.Bind("fr",a.."label_count","Taille")localify.Bind("fr",a.."label_reset_offsets","Effacer les décalages")localify.Bind("fr",a.."label_reset_angles","Effacer les angles")localify.Bind("fr",a.."label_show_settings","Afficher les paramètres")localify.Bind("fr",a.."label_hide_settings","Masquer les paramètres")localify.Bind("fr",a.."label_x","X  (-derrière, +devant)")localify.Bind("fr",a.."label_y","Y  (-gauche, +droite)")localify.Bind("fr",a.."label_z","Z  (-bas, +haut)")localify.Bind("fr",a.."label_pitch","Pitch  (-bas, +haut)")localify.Bind("fr",a.."label_yaw","Yaw   (-gauche, +droite)")localify.Bind("fr",a.."label_roll","Roll    (-gauche, +droite)")localify.Bind("fr",a.."label_language","Langue: ")localify.Bind("fr",a.."label_credits","")localify.Bind("fr",a.."label_max_per_stack","Taille")localify.Bind("fr",a.."label_max_per_player","Props par joueur(s)")localify.Bind("fr",a.."label_max_offsetx","Décalage X maximal")localify.Bind("fr",a.."label_max_offsety","Décalage Y maximal")localify.Bind("fr",a.."label_max_offsetz","Décalage Z maximal")localify.Bind("fr",a.."label_delay","Délai")localify.Bind("fr",a.."label_opacity","Opacité")localify.Bind("fr",a.."checkbox_freeze","Geler les props empilés")localify.Bind("fr",a.."checkbox_weld","Souder les props empilés")localify.Bind("fr",a.."checkbox_nocollide","No-Collide les props empilés avec les autres")localify.Bind("fr",a.."checkbox_nocollide_all","No-Collide les props empilés avec TOUT")localify.Bind("fr",a.."checkbox_use_shift_key","Changer la taille d'empilement avec SHIFT + clic gauche/droite")localify.Bind("fr",a.."checkbox_relative","Pile par rapport à la nouvelle rotation")localify.Bind("fr",a.."checkbox_material","Appliquer un matériaux")localify.Bind("fr",a.."checkbox_color","Appliquer une couleur")localify.Bind("fr",a.."checkbox_physprop","Appliquer une propriété physique")localify.Bind("fr",a.."checkbox_ghost","Traverser tout les props dans l'empilement")localify.Bind("fr",a.."checkbox_halo","Ajouter des halos aux props fantômes")localify.Bind("fr",a.."checkbox_halo_color","Couleur du halo")localify.Bind("fr",a.."checkbox_axis","Dessiner l'axe XYZ")localify.Bind("fr",a.."checkbox_axis_labels","Dessiner des étiquettes d'axe XYZ")localify.Bind("fr",a.."checkbox_axis_angles","Dessiner des angles d'axe XYZ")localify.Bind("fr",a.."checkbox_stayinworld","Rester dans le monde")localify.Bind("fr",a.."combobox_world","Monde")localify.Bind("fr",a.."combobox_prop","Prop")localify.Bind("fr",a.."combobox_direction_up","Haut")localify.Bind("fr",a.."combobox_direction_down","Bas")localify.Bind("fr",a.."combobox_direction_front","Devant")localify.Bind("fr",a.."combobox_direction_back","Derrière")localify.Bind("fr",a.."combobox_direction_right","Droite")localify.Bind("fr",a.."combobox_direction_left","Gauche")localify.Bind("fr",a.."combobox_default","Défaut")localify.Bind("fr",a.."combobox_sandbox","Sandbox")localify.Bind("fr",a.."combobox_darkrp","DarkRP")localify.Bind("fr",a.."combobox_singleplayer","Solo")localify.Bind("fr",a.."hud_front","Devant")localify.Bind("fr",a.."hud_right","Droite")localify.Bind("fr",a.."hud_up","Haut")localify.Bind("fr",a.."help_max_per_player","Les props empilés sont limités à chaque joueur.")localify.Bind("fr",a.."help_max_per_stack","Maximum de props par pile (clic gauche).")localify.Bind("fr",a.."help_delay","Délai (en secondes) entre chaque utilisation de l'Empileur (clic gauche / droit)")localify.Bind("fr",a.."help_max_offsetx","Distance maximale entre les props empilés (axe X).")localify.Bind("fr",a.."help_max_offsety","Distance maximale entre les props empilés (axe Y).")localify.Bind("fr",a.."help_max_offsetz","Distance maximale entre les props empilés (axe Z).")localify.Bind("fr",a.."help_freeze","Les props empilés sont congelés lorsqu'ils sont spawn.")localify.Bind("fr",a.."help_weld","Les props empilés sont soudés les uns aux autres lors du spawn.")localify.Bind("fr",a.."help_nocollide","Les props empilés ne vont pas entrer en collision avec d'autres props empilés.")localify.Bind("fr",a.."help_nocollide_all","Les props empilés n'entreront en collision avec rien d'autre que les joueurs, les PNJ, les véhicules et le monde.")localify.Bind("fr",a.."help_stayinworld","Empêche la création de props empilés à l'extérieur de la carte.")localify.Bind("fr",a.."warning_max_per_player","Principalement pour les modes de jeu Roleplay. Pour les modes de jeu Sandbox, cela devrait généralement être illimité (-1).")localify.Bind("fr",a.."warning_max_offsetx","Principalement pour les modes de jeu Roleplay. Ne modifiez pas à moins de savoir ce que vous faites.")localify.Bind("fr",a.."warning_max_offsety","Principalement pour les modes de jeu Roleplay. Ne modifiez pas à moins de savoir ce que vous faites.")localify.Bind("fr",a.."warning_max_offsetz","Principalement pour les modes de jeu Roleplay. Ne modifiez pas à moins de savoir ce que vous faites.")localify.Bind("fr",a.."warning_freeze","Pour DarkRP.")localify.Bind("fr",a.."warning_weld","Pour DarkRP.")localify.Bind("fr",a.."warning_nocollide","Pour DarkRP.")localify.Bind("fr",a.."warning_nocollide_all","NE PAS CHANGER PENDANT QUE LE SERVEUR FONCTIONNE. Cela utilise le crochet GM.ShouldCollide et est expérimental. Cela fonctionne et est garanti pour arrêter les plantages de Stacker, mais a besoin de plus de tests.")localify.Bind("pl",a.."name","Stacker - Ulepszony")localify.Bind("pl",a.."desc","Łatwo kopiuj obiekty w dowolnym kierunku")localify.Bind("pl",a.."left","Utwórz kopię")localify.Bind("pl",a.."shift_left","Zwiększ ilość kopii")localify.Bind("pl",a.."right","Utwórz pojedyńczy obiekt")localify.Bind("pl",a.."shift_right","Zmniejsz ilość kopii")localify.Bind("pl",a.."reload","Zmień kierunek kopiowania")localify.Bind("pl","Undone_stacker_improved","Cofnięto skopiowany obiekt")localify.Bind("pl",a.."error_blocked_by_server","Serwer zablokował twoją możliwość zmieniania wartości serwerowych")localify.Bind("pl",a.."error_not_admin","Musiz być w grupie 'admin' by zmienić tę wartość konsolową")localify.Bind("pl",a.."error_invalid_argument","Musisz wprowadzić poprawną wartość liczbową")localify.Bind("pl",a.."error_max_per_stack","Maksymalna ilość kopii jest ograniczona do ")localify.Bind("pl",a.."error_too_quick","Używasz Stackera za szybko")localify.Bind("pl",a.."error_max_per_player","Osiągnięto limir obiektów dla Stackera")localify.Bind("pl",a.."error_not_in_world","Skopiowane obiekty nie mogą wychodzić poza mapę")localify.Bind("pl",a.."error_max_constraints","Nie udało się utworzyć łaczenia, najprawdopodobniej brakuje miejsc na obiekty")localify.Bind("pl",a.."label_presets","Ustawienia zapisane: ")localify.Bind("pl",a.."label_relative","Kopiowanie względem: ")localify.Bind("pl",a.."label_direction","Kierunek kopiowania: ")localify.Bind("pl",a.."label_count","Ilość kopii")localify.Bind("pl",a.."label_reset_offsets","Zresetuj przesunięcia")localify.Bind("pl",a.."label_reset_angles","Zresetuj kąty")localify.Bind("pl",a.."label_show_settings","Pokaż ustawienia")localify.Bind("pl",a.."label_hide_settings","Ukryj ustawienia")localify.Bind("pl",a.."label_x","X  (-tył, +przód)")localify.Bind("pl",a.."label_y","Y  (-lewo, +prawo)")localify.Bind("pl",a.."label_z","Z  (-dół, +góra)")localify.Bind("pl",a.."label_pitch","Pochylenie  (-dół, +góra)")localify.Bind("pl",a.."label_yaw","Odchylenie   (-lewo, +prawo)")localify.Bind("pl",a.."label_roll","Przechylenie    (-lewo, +prawo)")localify.Bind("pl",a.."label_language","Język: ")localify.Bind("pl",a.."label_credits","")localify.Bind("pl",a.."label_max_per_stack","Ilość kopii")localify.Bind("pl",a.."label_max_per_player","Ilość obiektów na gracza")localify.Bind("pl",a.."label_max_offsetx","Max przesunięcie X")localify.Bind("pl",a.."label_max_offsety","Max przesunięcie Y")localify.Bind("pl",a.."label_max_offsetz","Max przesunięcie Z")localify.Bind("pl",a.."label_delay","Opóźnienie")localify.Bind("pl",a.."label_opacity","Przezroczystość")localify.Bind("pl",a.."checkbox_freeze","Zamrażaj skopiowane obiekty")localify.Bind("pl",a.."checkbox_weld","Spawaj skopiowane obiekty")localify.Bind("pl",a.."checkbox_nocollide","Wyłącz kolizję pomiędzy skopiowanymi obiektami")localify.Bind("pl",a.."checkbox_nocollide_all","Wyłącz kolizję skopiowanych obiektamów ze WSZYSTKIM")localify.Bind("pl",a.."checkbox_use_shift_key","Zmień ilość kopii za pomocą SHIFT + lewy/prawy")localify.Bind("pl",a.."checkbox_relative","Kopiuj względem nowego obrotu")localify.Bind("pl",a.."checkbox_material","Zastosuj materiał")localify.Bind("pl",a.."checkbox_color","Zastosuj kolor")localify.Bind("pl",a.."checkbox_physprop","Zastosuj właściwości fizyczne")localify.Bind("pl",a.."checkbox_ghost","Dodaj duchy obiektów wszyschich kopii")localify.Bind("pl",a.."checkbox_halo","Dodaj poświatę do duchów obiektów")localify.Bind("pl",a.."checkbox_halo_color","Kolor poświaty")localify.Bind("pl",a.."checkbox_axis","Rysuj oś XYZ")localify.Bind("pl",a.."checkbox_axis_labels","Rysuj opis osi XYZ")localify.Bind("pl",a.."checkbox_axis_angles","Rysuj kąty osi XYZ")localify.Bind("pl",a.."checkbox_stayinworld","Zostań w środku mapy")localify.Bind("pl",a.."combobox_world","świat")localify.Bind("pl",a.."combobox_prop","Obiekt")localify.Bind("pl",a.."combobox_direction_up","Góra")localify.Bind("pl",a.."combobox_direction_down","Dół")localify.Bind("pl",a.."combobox_direction_front","Przód")localify.Bind("pl",a.."combobox_direction_back","Tył")localify.Bind("pl",a.."combobox_direction_right","Prawo")localify.Bind("pl",a.."combobox_direction_left","Lewo")localify.Bind("pl",a.."combobox_default","Domyślne")localify.Bind("pl",a.."combobox_sandbox","Sandbox")localify.Bind("pl",a.."combobox_darkrp","DarkRP")localify.Bind("pl",a.."combobox_singleplayer","Singleplayer")localify.Bind("pl",a.."hud_front","Przód")localify.Bind("pl",a.."hud_right","Prawo")localify.Bind("pl",a.."hud_up","Góra")localify.Bind("pl",a.."help_max_per_player","Maksymalna ilość skopiowanych obiektó na gracza to.")localify.Bind("pl",a.."help_max_per_stack","Maksymalna ilość obiektów na kopię (lewy przycisk myszki).")localify.Bind("pl",a.."help_delay","Opóźnienie (w sekundach) pomiędzy każdym użyciem Stackera (lewy/prawy przycisk)")localify.Bind("pl",a.."help_max_offsetx","Maksymalny dystans pomiędzy skopiowanymi obiektami (oś X).")localify.Bind("pl",a.."help_max_offsety","Maksymalny dystans pomiędzy skopiowanymi obiektami (oś Y).")localify.Bind("pl",a.."help_max_offsetz","Maksymalny dystans pomiędzy skopiowanymi obiektami (oś Z).")localify.Bind("pl",a.."help_freeze","Skopiowane obiekty są zamrożone.")localify.Bind("pl",a.."help_weld","Skopiowane obiekty są zespawane do siebie.")localify.Bind("pl",a.."help_nocollide","Skopiowane obiekty nie będą kolidowały z innymi skopiowanymi obiektami.")localify.Bind("pl",a.."help_nocollide_all","Skopiowane obiekty nie będą kolidowały ze wszystkim oprócz graczy, NPCs, pojazdów, i mapy.")localify.Bind("pl",a.."help_stayinworld","Nie pozwalaj na tworzenie kopii poza mapą.")localify.Bind("pl",a.."warning_max_per_player","Głównie dla trybu Roleplay. Dla trybów Sandbox, zazwyczaj powinno być nieograniczone (-1).")localify.Bind("pl",a.."warning_max_offsetx","Głownie dla tryby Roleplay. Nie zmieniaj, jeśli nie wiesz co robisz.")localify.Bind("pl",a.."warning_max_offsety","Głownie dla tryby Roleplay. Nie zmieniaj, jeśli nie wiesz co robisz.")localify.Bind("pl",a.."warning_max_offsetz","Głownie dla tryby Roleplay. Nie zmieniaj, jeśli nie wiesz co robisz.")localify.Bind("pl",a.."warning_freeze","Dla DarkRP.")localify.Bind("pl",a.."warning_weld","Dla DarkRP.")localify.Bind("pl",a.."warning_nocollide","Dla DarkRP.")localify.Bind("pl",a.."warning_nocollide_all","NIE ZMIENIAJ JEŚLI SERWER JEST WŁĄCZONY. To używa GM.ShouldCollide i jest eksperymentalne. Działa i zapobiega awarii serwera spowodowanymi Stackerem, ale wymaga dalszych testów.")localify.Bind("ru",a.."name","Стакер - Улучшенный")localify.Bind("ru",a.."desc","Легко дублируйте предметы в любом направлении")localify.Bind("ru",a.."left","Стакать")localify.Bind("ru",a.."shift_left","Увеличить размер стака")localify.Bind("ru",a.."right","Создать одиночный предмет")localify.Bind("ru",a.."shift_right","Уменьшить размер стака")localify.Bind("ru",a.."reload","Изменить напраление стака")localify.Bind("ru","Undone_stacker_improved","Отменить стаканные предметы")localify.Bind("ru",a.."error_blocked_by_server","Сервер заблокировал вас от изменения этой консольной переменной")localify.Bind("ru",a.."error_not_admin","Вы должны быть в группе админа, чтобы изменить эту консольную переменную")localify.Bind("ru",a.."error_invalid_argument","Вы должны ввести правильное числовое значение")localify.Bind("ru",a.."error_max_per_stack","Максимальное количество предметов, которые могут быть стаканы в один момент, ограничено к ")localify.Bind("ru",a.."error_too_quick","Вы используете стакер слишком быстро")localify.Bind("ru",a.."error_max_per_player","Достигнуто максимальное количество предметов")localify.Bind("ru",a.."error_not_in_world","Стаканные предметы должны появляться в мире")localify.Bind("ru",a.."error_max_constraints","Не удалось создать соединение, скорее всего, закончились слоты сущностей")localify.Bind("ru",a.."label_presets","Готовые настройки стака: ")localify.Bind("ru",a.."label_relative","Стак относителен к: ")localify.Bind("ru",a.."label_direction","Направление стака: ")localify.Bind("ru",a.."label_count","Размер стака")localify.Bind("ru",a.."label_reset_offsets","Сбросить отклонения")localify.Bind("ru",a.."label_reset_angles","Сбросить углы")localify.Bind("ru",a.."label_show_settings","Показать настройки")localify.Bind("ru",a.."label_hide_settings","Спрятать настройки")localify.Bind("ru",a.."label_x","X  (-сзади, +спереди)")localify.Bind("ru",a.."label_y","Y  (-слева, +справа)")localify.Bind("ru",a.."label_z","Z  (-снизу, +сверху)")localify.Bind("ru",a.."label_pitch","Pitch  (-снизу, +сверху)")localify.Bind("ru",a.."label_yaw","Yaw   (-слева, +справа)")localify.Bind("ru",a.."label_roll","Roll    (-слева, +справа)")localify.Bind("ru",a.."label_language","Язык: ")localify.Bind("ru",a.."label_credits","Переведено от SupinePandora43")localify.Bind("ru",a.."label_max_per_stack","Размер стака")localify.Bind("ru",a.."label_max_per_player","Количество предметов игрока")localify.Bind("ru",a.."label_max_offsetx","Максимальное X отклонение")localify.Bind("ru",a.."label_max_offsety","Максимальное Y отклонение")localify.Bind("ru",a.."label_max_offsetz","Максимальное Z отклонение")localify.Bind("ru",a.."label_delay","Задержка")localify.Bind("ru",a.."label_opacity","Непрозрачность")localify.Bind("ru",a.."checkbox_freeze","Заморозить стаканные предметы")localify.Bind("ru",a.."checkbox_weld","Сварить стаканные предметы")localify.Bind("ru",a.."checkbox_nocollide","Отключить столкновения стаканных предметов друг с другом")localify.Bind("ru",a.."checkbox_nocollide_all","Отключить столкновения стаканных предметов со ВСЕМ")localify.Bind("ru",a.."checkbox_use_shift_key","Изменить размер стака с SHIFT + ЛКМ/ПКМ")localify.Bind("ru",a.."checkbox_relative","Стак относителен нового поворота")localify.Bind("ru",a.."checkbox_material","Применить материал")localify.Bind("ru",a.."checkbox_color","Применить цвет")localify.Bind("ru",a.."checkbox_physprop","Применить физические свойства")localify.Bind("ru",a.."checkbox_ghost","Призрачные все предметы в стаке")localify.Bind("ru",a.."checkbox_halo","Добавить обводку к призрачным предметам")localify.Bind("ru",a.."checkbox_halo_color","Цвет обводки")localify.Bind("ru",a.."checkbox_axis","Отрисовывать XYZ ось")localify.Bind("ru",a.."checkbox_axis_labels","Отрисовывать XYZ названия осей ")localify.Bind("ru",a.."checkbox_axis_angles","Отрисовывать XYZ углы оси")localify.Bind("ru",a.."checkbox_stayinworld","Оставаться в мире")localify.Bind("ru",a.."combobox_world","Мир")localify.Bind("ru",a.."combobox_prop","Предмет")localify.Bind("ru",a.."combobox_direction_up","Верх")localify.Bind("ru",a.."combobox_direction_down","Низ")localify.Bind("ru",a.."combobox_direction_front","Перед")localify.Bind("ru",a.."combobox_direction_back","Зад")localify.Bind("ru",a.."combobox_direction_right","Право")localify.Bind("ru",a.."combobox_direction_left","Лево")localify.Bind("ru",a.."combobox_default","По умолчанию")localify.Bind("ru",a.."combobox_sandbox","Sandbox")localify.Bind("ru",a.."combobox_darkrp","DarkRP")localify.Bind("ru",a.."combobox_singleplayer","Одиночная игра")localify.Bind("ru",a.."hud_front","Перед")localify.Bind("ru",a.."hud_right","Право")localify.Bind("ru",a.."hud_up","Верх")localify.Bind("ru",a.."help_max_per_player","Максимальное количество предметов, которые могут быть стаканы в один момент.")localify.Bind("ru",a.."help_max_per_stack","Максимальное количество предметов в стаке (ЛКМ).")localify.Bind("ru",a.."help_delay","Задержка (в секундах) между каждым использыванием стакера (ЛКМ/ПКМ)")localify.Bind("ru",a.."help_max_offsetx","Максимальная дистанция между стаканными предметами (X-ось).")localify.Bind("ru",a.."help_max_offsety","Максимальная дистанция между стаканными предметами (Y-ось).")localify.Bind("ru",a.."help_max_offsetz","Максимальная дистанция между стаканными предметами (Z-ось).")localify.Bind("ru",a.."help_freeze","Заморозить стаканные предметы при спавне.")localify.Bind("ru",a.."help_weld","Сварить стаканные предметы друг к другу при спавне.")localify.Bind("ru",a.."help_nocollide","Стаканные предметы не будут сталкиваться друг с другом.")localify.Bind("ru",a.."help_nocollide_all","Отключить столкновения для стаканных предметов.")localify.Bind("ru",a.."help_stayinworld","Предотвращает создание стака за пределами мира.")localify.Bind("ru",a.."warning_max_per_player","В основном для RolePlay игровых режимов. Для SandBox игровых режимов, это должно быть неограничено (-1).")localify.Bind("ru",a.."warning_max_offsetx","В основном для RolePlay игровых режимов. Не изменяйте, если не знаете что делаете.")localify.Bind("ru",a.."warning_max_offsety","В основном для RolePlay игровых режимов. Не изменяйте, если не знаете что делаете.")localify.Bind("ru",a.."warning_max_offsetz","В основном для RolePlay игровых режимов. Не изменяйте, если не знаете что делаете.")localify.Bind("ru",a.."warning_freeze","Для DarkRP.")localify.Bind("ru",a.."warning_weld","Для DarkRP.")localify.Bind("ru",a.."warning_nocollide","Для DarkRP.")localify.Bind("ru",a.."warning_nocollide_all","НЕ ИЗМЕНЯЙТЕ ВО ВРЕМЯ РАБОТЫ СЕРВЕРА. Это использует экспериментальный GM.ShouldCollide. Это работает и гарантированно предотвращает сбои в Stacker, но требует дополнительного тестирования.")localify.Bind("zh-cn",a.."name","叠加器 - 改进")localify.Bind("zh-cn",a.."desc","轻易在任何方向复制物品")localify.Bind("zh-cn",a.."left","进行一次叠加")localify.Bind("zh-cn",a.."shift_left","增加叠加大小")localify.Bind("zh-cn",a.."right","叠加单个物品")localify.Bind("zh-cn",a.."shift_right","减少叠加大小")localify.Bind("zh-cn",a.."reload","改变叠加方向")localify.Bind("zh-cn","Undone_stacker_improved","撤回叠加物品")localify.Bind("zh-cn",a.."error_blocked_by_server","服务器禁止你修改这个控制台参数")localify.Bind("zh-cn",a.."error_not_admin","你必须是管理员才能修改这个控制台参数")localify.Bind("zh-cn",a.."error_invalid_argument","你必须输入一个合法数字")localify.Bind("zh-cn",a.."error_max_per_stack","单次叠加物品的上限是 ")localify.Bind("zh-cn",a.."error_too_quick","你叠加器使用得太快了")localify.Bind("zh-cn",a.."error_max_per_player","叠加器达到了物品上限")localify.Bind("zh-cn",a.."error_not_in_world","叠加的物品必须生成在地图内部")localify.Bind("zh-cn",a.."error_max_constraints","约束生成失败，很可能是达到了实体上限")localify.Bind("zh-cn",a.."label_presets","叠加器预设：")localify.Bind("zh-cn",a.."label_relative","叠加相对方向：")localify.Bind("zh-cn",a.."label_direction","叠加方向：")localify.Bind("zh-cn",a.."label_count","叠加大小：")localify.Bind("zh-cn",a.."label_reset_offsets","重置位差")localify.Bind("zh-cn",a.."label_reset_angles","重置角度")localify.Bind("zh-cn",a.."label_show_settings","点击显示设置")localify.Bind("zh-cn",a.."label_hide_settings","点击隐藏设置")localify.Bind("zh-cn",a.."label_x","X  (-后, +前)")localify.Bind("zh-cn",a.."label_y","Y  (-左, +右)")localify.Bind("zh-cn",a.."label_z","Z  (-下, +上)")localify.Bind("zh-cn",a.."label_pitch","Pitch  (-下, +上)")localify.Bind("zh-cn",a.."label_yaw","Yaw    (-左, +右)")localify.Bind("zh-cn",a.."label_roll","Roll    (-左, +右)")localify.Bind("zh-cn",a.."label_language","语言: ")localify.Bind("zh-cn",a.."label_credits","翻译： 8Z (STEAM_0:0:33380074)")localify.Bind("zh-cn",a.."label_max_per_stack","单次叠加上限")localify.Bind("zh-cn",a.."label_max_per_player","玩家叠加物品上限")localify.Bind("zh-cn",a.."label_max_offsetx","最大 X 位差")localify.Bind("zh-cn",a.."label_max_offsety","最大 Y 位差")localify.Bind("zh-cn",a.."label_max_offsetz","最大 Z 位差")localify.Bind("zh-cn",a.."label_delay","冷却")localify.Bind("zh-cn",a.."label_opacity","透明度")localify.Bind("zh-cn",a.."checkbox_freeze","固定叠加物品")localify.Bind("zh-cn",a.."checkbox_weld","焊接叠加物品")localify.Bind("zh-cn",a.."checkbox_nocollide","叠加互相无碰撞")localify.Bind("zh-cn",a.."checkbox_nocollide_all","叠加全部无碰撞")localify.Bind("zh-cn",a.."checkbox_use_shift_key","更改叠加大小使用 SHIFT+左键/右键")localify.Bind("zh-cn",a.."checkbox_relative","叠加使用新物品的相对角度")localify.Bind("zh-cn",a.."checkbox_material","应用材质")localify.Bind("zh-cn",a.."checkbox_color","应用颜色")localify.Bind("zh-cn",a.."checkbox_physprop","应用物理特性")localify.Bind("zh-cn",a.."checkbox_ghost","所有叠加物品显示预览")localify.Bind("zh-cn",a.."checkbox_halo","物品预览光环效果")localify.Bind("zh-cn",a.."checkbox_halo_color","光环颜色")localify.Bind("zh-cn",a.."checkbox_axis","显示 XYZ 轴")localify.Bind("zh-cn",a.."checkbox_axis_labels","显示 XYZ 轴标签")localify.Bind("zh-cn",a.."checkbox_axis_angles","显示 XYZ 轴角度")localify.Bind("zh-cn",a.."checkbox_stayinworld","叠加限定在地图内部")localify.Bind("zh-cn",a.."combobox_world","世界")localify.Bind("zh-cn",a.."combobox_prop","物品")localify.Bind("zh-cn",a.."combobox_direction_up","上")localify.Bind("zh-cn",a.."combobox_direction_down","下")localify.Bind("zh-cn",a.."combobox_direction_front","前")localify.Bind("zh-cn",a.."combobox_direction_back","后")localify.Bind("zh-cn",a.."combobox_direction_right","右")localify.Bind("zh-cn",a.."combobox_direction_left","左")localify.Bind("zh-cn",a.."combobox_default","默认")localify.Bind("zh-cn",a.."combobox_sandbox","沙盘")localify.Bind("zh-cn",a.."combobox_darkrp","DarkRP")localify.Bind("zh-cn",a.."combobox_singleplayer","单人")localify.Bind("zh-cn",a.."hud_front","前")localify.Bind("zh-cn",a.."hud_right","右")localify.Bind("zh-cn",a.."hud_up","上")localify.Bind("zh-cn",a.."help_max_per_player","每个玩家堆叠物品的数量上限。")localify.Bind("zh-cn",a.."help_max_per_stack","单次堆叠（左键）时的物品上限。")localify.Bind("zh-cn",a.."help_delay","每次使用堆叠器（左键/右键）后的冷却。")localify.Bind("zh-cn",a.."help_max_offsetx","叠加物品间的最大位差（X轴）。")localify.Bind("zh-cn",a.."help_max_offsety","叠加物品间的最大位差（Y轴）。")localify.Bind("zh-cn",a.."help_max_offsetz","叠加物品间的最大位差（Z轴）。")localify.Bind("zh-cn",a.."help_freeze","叠加的物品刷出后固定。")localify.Bind("zh-cn",a.."help_weld","叠加的物品刷出后互相焊接。")localify.Bind("zh-cn",a.."help_nocollide","叠加的物品和其他叠加物品无碰撞。")localify.Bind("zh-cn",a.."help_nocollide_all","叠加的物品只会和玩家，NPC，车辆和世界碰撞。")localify.Bind("zh-cn",a.."help_stayinworld","避免叠加的物品刷出在地图外部。")localify.Bind("zh-cn",a.."warning_max_per_player","主要用于角色扮演模式的设置。沙盘模式下这个应该是无限的（-1）。")localify.Bind("zh-cn",a.."warning_max_offsetx","主要用于角色扮演模式的设置。如果你不确定这是什么，不要修改。")localify.Bind("zh-cn",a.."warning_max_offsety","主要用于角色扮演模式的设置。如果你不确定这是什么，不要修改。")localify.Bind("zh-cn",a.."warning_max_offsetz","主要用于角色扮演模式的设置。如果你不确定这是什么，不要修改。")localify.Bind("zh-cn",a.."warning_freeze","提供给 DarkRP 的设置。")localify.Bind("zh-cn",a.."warning_weld","提供给 DarkRP 的设置。")localify.Bind("zh-cn",a.."warning_nocollide","提供给 DarkRP 的设置。")localify.Bind("zh-cn",a.."warning_nocollide_all","绝对不要在服务器运作时修改！这个实验性的功能调用 GM.ShouldCollide。这个设置管用且必定能够避免叠加器崩服，但需要更多的测试。")
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/unbreakable.lua:
TOOL.Category='Constraints'TOOL.Name='#tool.unbreakable.name'if CLIENT then language.Add('tool.unbreakable.name','Unbreakable')language.Add('tool.unbreakable.desc','Make a prop unbreakable')language.Add('tool.unbreakable.left','Make a prop unbreakable')language.Add('tool.unbreakable.right','Revert a props unbreakable status')else hook('InitPostEntity','unbreakable.InitPostEntity',function()local a=ents.Create'filter_activator_name'a:SetKeyValue('TargetName','FilterDamage')a:SetKeyValue('negated','1')a:Spawn()end)end;TOOL.Information={{name="left"},{name="right"}}local function b(c,d,e)if e.Unbreakable then d:Fire('SetDamageFilter','FilterDamage',0)else d:Fire('SetDamageFilter','',0)end;d.Unbreakable=e.Unbreakable end;duplicator.RegisterEntityModifier('unbreakable',b)function TOOL:LeftClick(f)if IsValid(f.Entity)&&!f.Entity.Unbreakable then return true end;return false end;function TOOL:RightClick(f)if IsValid(f.Entity)&&f.Entity.Unbreakable then return true end;return false end;TOOL.Reload=TOOL.RightClick;function TOOL.BuildCPanel(g)g:AddControl('Header',{Text='#tool.unbreakable.name',Description='#tool.unbreakable.left'})end
--addons/!lpakr_out/lua/wire/stools/adv_input.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/cd_ray.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/characterlcd.lua:
WireToolSetup.setCategory("Visuals/Screens")WireToolSetup.open("characterlcd","Character LCD","gmod_wire_characterlcd",nil,"Character LCDs")if CLIENT then language.Add("tool.wire_characterlcd.name","Character LCD Tool (Wire)")language.Add("tool.wire_characterlcd.desc","Spawns a Character LCD, which can be used to display text")language.Add("tool.wire_characterlcd.bgcolor","Background color:")language.Add("tool.wire_characterlcd.fgcolor","Text color:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/props_lab/monitor01b.mdl",width=16,height=2,createflat=0,bgred=148,bggreen=178,bgblue=15,fgred=45,fggreen=91,fgblue=45}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_characterlcd")WireDermaExts.ModelSelect(a,"wire_characterlcd_model",list.Get("WireScreenModels"),5)a:AddControl("Color",{Label="#tool.wire_characterlcd.bgcolor",Red="wire_characterlcd_bgred",Green="wire_characterlcd_bggreen",Blue="wire_characterlcd_bgblue",ShowAlpha="0",ShowHSV="1",ShowRGB="1",Multiplier="255"})a:AddControl("Color",{Label="#tool.wire_characterlcd.fgcolor",Red="wire_characterlcd_fgred",Green="wire_characterlcd_fggreen",Blue="wire_characterlcd_fgblue",ShowAlpha="0",ShowHSV="1",ShowRGB="1",Multiplier="255"})a:NumSlider("Width","wire_characterlcd_width",1,56,0)a:NumSlider("Height","wire_characterlcd_height",1,16,0)a:CheckBox("#Create Flat to Surface","wire_characterlcd_createflat")end
--addons/!lpakr_out/lua/wire/stools/consolescreen.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/data_satellitedish.lua:
WireToolSetup.setCategory("Memory")WireToolSetup.open("data_satellitedish","Satellite Dish","gmod_wire_data_satellitedish",nil,"Satellite Dishs")if CLIENT then language.Add("Tool.wire_data_satellitedish.name","Satellite Dish Tool (Wire)")language.Add("Tool.wire_data_satellitedish.desc","Spawns a Satellite Dish.")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar["model"]="models/props_wasteland/prison_lamp001c.mdl"TOOL.ReloadSetsModel=true;WireToolSetup.SetupLinking(true,"Wire Transferer")function TOOL.BuildCPanel(a)WireDermaExts.ModelSelect(a,"wire_data_satellitedish_model",list.Get("Wire_satellitedish_Models"),1)end
--addons/!lpakr_out/lua/wire/stools/dataplug.lua:
WireToolSetup.setCategory("Advanced")WireToolSetup.open("dataplug","Data - Plug/Socket","gmod_wire_datasocket",nil,"Plugs and Sockets")if CLIENT then language.Add("Tool.wire_dataplug.name","Data Plug Tool (Wire)")language.Add("Tool.wire_dataplug.desc","Spawns plugs and sockets for use with the hi-speed wire system.")language.Add("sboxlimit_wire_dataplugs","You've hit plugs limit!")language.Add("sboxlimit_wire_datasockets","You've hit sockets limit!")language.Add("undone_wiredataplug","Undone Wire Data Plug")language.Add("undone_wiredatasocket","Undone Wire Data Socket")language.Add("Tool_wire_dataplug_weldforce","Plug weld force:")language.Add("Tool_wire_dataplug_attachrange","Plug attachment detection range:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name},{name="right",text="Create/Update Plug"}}end;WireToolSetup.BaseLang()TOOL.ClientConVar["model"]="models/hammy/pci_slot.mdl"TOOL.ClientConVar["weldforce"]=5000;TOOL.ClientConVar["attachrange"]=5;function TOOL:GetConVars()return self:GetClientNumber("weldforce"),math.Clamp(self:GetClientNumber("attachrange"),1,100)end;local a=list.Get("Wire_Socket_Models")cleanup.Register("wire_dataplugs")function TOOL:GetModel()local b=self:GetClientInfo("model")if!util.IsValidModel(b)||!util.IsValidProp(b)||!a[b]then return"models/props_lab/tpplugholder_single.mdl","models/props_lab/tpplug.mdl"end;return b,a[b].plug end;function TOOL:RightClick(c)if!c then return false end;if c.Entity then if c.Entity:IsPlayer()then return false end;if c.Entity:GetClass()=="gmod_wire_dataplug"then if CLIENT then return true end;c.Entity:Setup()return true end end;if CLIENT then return true end;if!util.IsValidPhysicsObject(c.Entity,c.PhysicsBone)then return false end;local d=self:GetOwner()local e,f=self:GetModel()local g=WireLib.MakeWireEnt(d,{Class="gmod_wire_dataplug",Pos=c.HitPos,Angle=self:GetAngle(c),Model=f})if!IsValid(g)then return false end;g:SetPos(c.HitPos-c.HitNormal*g:OBBMins().x)undo.Create("wiredataplug")undo.AddEntity(g)undo.SetPlayer(d)undo.Finish()d:AddCleanup("wire_dataplugs",g)return true end;function TOOL:GetGhostAngle(c)local h=self:GetModel()return c.HitNormal:Angle()+(a[h].ang||Angle(0,0,0))-Angle(90,0,0)end;function TOOL.BuildCPanel(i)WireToolHelpers.MakePresetControl(i,"wire_dataplug")ModelPlug_AddToCPanel(i,"Socket","wire_dataplug")i:NumSlider("#Tool_wire_dataplug_weldforce","wire_dataplug_weldforce",0,100000)i:NumSlider("#Tool_wire_dataplug_attachrange","wire_dataplug_attachrange",1,100)end
--addons/!lpakr_out/lua/wire/stools/datarate.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/emarker.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/emarker.lua:
WireToolSetup.setCategory("Detection")WireToolSetup.open("emarker","Entity Marker","gmod_wire_emarker",nil,"Entity Markers")if CLIENT then language.Add("Tool.wire_emarker.name","Entity Marker Tool (Wire)")language.Add("Tool.wire_emarker.desc","Spawns an Entity Marker for use with the wire system.")TOOL.Information={{name="left_0",stage=0,text="Create Entity Marker/Display Link Info"},{name="right_0",stage=0,text="Link Entity Marker"},{name="reload_0",stage=0,text="Unlink Entity Marker"},{name="right_1",stage=1,text="Now select the entity to link to"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(30)TOOL.ClientConVar={model="models/jaanus/wiretool/wiretool_siren.mdl"}function TOOL:LeftClick(a)if!a.HitPos||a.Entity:IsPlayer()then return false end;if CLIENT then return true end;if!util.IsValidPhysicsObject(a.Entity,a.PhysicsBone)then return false end;self:SetStage(0)local b=self:GetOwner()if a.Entity:GetClass()=="gmod_wire_emarker"then self.marker=a.Entity;if!self.marker.mark||!self.marker.mark:IsValid()then b:PrintMessage(HUD_PRINTTALK,"Entity Marker not linked")return false end;b:PrintMessage(HUD_PRINTTALK,"Linked model: "..self.marker.mark:GetModel())self:GetWeapon():SetNWEntity("WireEntityMark",self.marker.mark)self:GetWeapon():SetNWEntity("WireEntityMarker",self.marker)else local c=self:LeftClick_Make(a,b)return self:LeftClick_PostMake(c,b,a)end;return true end;function TOOL:RightClick(a)if!a.HitPos||!IsValid(a.Entity)||a.Entity:IsPlayer()then return false end;if CLIENT then return true end;if self:GetStage()==0&&a.Entity:GetClass()=="gmod_wire_emarker"then self.marker=a.Entity;self:SetStage(1)return true elseif self:GetStage()==1 then self.marker:LinkEMarker(a.Entity)self:SetStage(0)self:GetOwner():PrintMessage(HUD_PRINTTALK,"Entity Marker linked")self:GetWeapon():SetNWEntity("WireEntityMark",self.marker.mark)self:GetWeapon():SetNWEntity("WireEntityMarker",self.marker)return true else return false end end;function TOOL:Reload(a)if!a.HitPos||a.Entity:IsPlayer()then return false end;if CLIENT then return true end;self:SetStage(0)local d=a.Entity;if!IsValid(d)then return false end;if d:GetClass()=="gmod_wire_emarker"then d:UnLinkEMarker()self:GetOwner():PrintMessage(HUD_PRINTTALK,"Entity Marker unlinked")self:GetWeapon():SetNWEntity("WireEntityMark",self.marker)self:GetWeapon():SetNWEntity("WireEntityMarker",self.marker)return true end end;function TOOL:DrawHUD()local e=self:GetWeapon():GetNWEntity("WireEntityMark")local d=self:GetWeapon():GetNWEntity("WireEntityMarker")if!IsValid(e)||!IsValid(d)then return end;local f=d:GetPos():ToScreen()local g=e:GetPos():ToScreen()if g.x>0&&g.y>0&&g.x<ScrW()&&g.y<ScrH()then surface.SetDrawColor(255,255,100,255)surface.DrawLine(f.x,f.y,g.x,g.y)end end;function TOOL.BuildCPanel(h)ModelPlug_AddToCPanel(h,"Misc_Tools","wire_emarker")end
--addons/!lpakr_out/lua/wire/stools/eyepod.lua:
WireToolSetup.setCategory("Vehicle Control")WireToolSetup.open("eyepod","Eye Pod","gmod_wire_eyepod",nil,"Eye Pods")if CLIENT then language.Add("Tool.wire_eyepod.name","Eye Pod Tool (Wire)")language.Add("Tool.wire_eyepod.desc","Spawns an Eye Pod Mouse Controller.")language.Add("WireEyePod_DefaultToZero","Default Outputs To Zero When Inactive")language.Add("WireEyePod_CumulativeOutput","Output Cumulative Mouse Position")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(15)TOOL.ClientConVar["model"]="models/jaanus/wiretool/wiretool_siren.mdl"TOOL.ClientConVar["DefaultToZero"]="1"TOOL.ClientConVar["CumulativeOutput"]="0"TOOL.ClientConVar["XMin"]="0"TOOL.ClientConVar["XMax"]="0"TOOL.ClientConVar["YMin"]="0"TOOL.ClientConVar["YMax"]="0"WireToolSetup.SetupLinking(true,"eyepod")if CLIENT then local function a(b)b:ClearControls()b:AddControl("Header",{Text="#Tool.wire_eyepod.name",Description="#Tool.wire_eyepod.desc"})b:AddControl("ComboBox",{Label="#Presets",MenuButton="1",Folder="wire_eyepod",Options={Default={wire_eyepod_DefaultToZero="1",wire_eyepod_CumulativeOutput="0",wire_eyepod_XMin="0",wire_eyepod_XMax="0",wire_eyepod_YMin="0",wire_eyepod_YMax="0"}},CVars={[0]="wire_eyepod_DefaultToZero",[1]="wire_eyepod_CumulativeOutput",[2]="wire_eyepod_XMin",[3]="wire_eyepod_XMax",[4]="wire_eyepod_YMin",[5]="wire_eyepod_YMax"}})WireDermaExts.ModelSelect(b,"wire_eyepod_model",list.Get("Wire_Misc_Tools_Models"),1)b:AddControl("CheckBox",{Label="#WireEyePod_CumulativeOutput",Command="wire_eyepod_CumulativeOutput"})b:AddControl("CheckBox",{Label="#WireEyePod_DefaultToZero",Command="wire_eyepod_DefaultToZero"})b:AddControl("Label",{Text="\nClamp the output of the EyePod. \nSet both sliders to 0 to remove the clamp in that axis.",Description="Clamps the outputs of the EyePod. Set to 0 not to clamp in that axis"})b:AddControl("Slider",{Label="X Min",Type="Float",Min=-2000,Max=2000,Command="wire_eyepod_XMin",Description="Clamps the output of the EyePod's X to this minimum"})b:AddControl("Slider",{Label="X Max",Type="Float",Min=-2000,Max=2000,Command="wire_eyepod_XMax",Description="Clamps the output of the EyePod's X to this maximum"})b:AddControl("Slider",{Label="Y Min",Type="Float",Min=-2000,Max=2000,Command="wire_eyepod_YMin",Description="Clamps the output of the EyePod's Y to this minimum"})b:AddControl("Slider",{Label="Y Max",Type="Float",Min=-2000,Max=2000,Command="wire_eyepod_YMax",Description="Clamps the output of the EyePod's Y to this maximum"})end;function TOOL.BuildCPanel(b)a(b)end end
--addons/!lpakr_out/lua/wire/stools/gpulib_switcher.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/gyroscope.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/gyroscope.lua:
WireToolSetup.setCategory("Detection")WireToolSetup.open("gyroscope","Gyroscope","gmod_wire_gyroscope",nil,"Gyroscopes")if CLIENT then language.Add("Tool.wire_gyroscope.name","Gyroscope Tool (Wire)")language.Add("Tool.wire_gyroscope.desc","Spawns a gyroscope for use with the wire system.")language.Add("Tool.wire_gyroscope.out180","Output -180 to 180 instead of 0 to 360")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(10)TOOL.ClientConVar={model="models/bull/various/gyroscope.mdl",out180=0}function TOOL.BuildCPanel(a)ModelPlug_AddToCPanel(a,"gyroscope","wire_gyroscope")a:CheckBox("#Tool.wire_gyroscope.out180","wire_gyroscope_out180")end
--addons/!lpakr_out/lua/wire/stools/hydraulic.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/las_receiver.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/light.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/radio.lua:
WireToolSetup.setCategory("Input, Output/Data Transfer")WireToolSetup.open("radio","Radio","gmod_wire_radio",nil,"Radios")if CLIENT then language.Add("Tool.wire_radio.name","Radio Tool (Wire)")language.Add("Tool.wire_radio.desc","Spawns a radio for use with the wire system.")language.Add("WireRadioTool_channel","Channel:")language.Add("WireRadioTool_values","Values:")language.Add("WireRadioTool_secure","Secure")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={channel=1,values=4,secure=0,model="models/props_lab/binderblue.mdl"}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_radio")WireDermaExts.ModelSelect(a,"wire_radio_model",list.Get("Wire_radio_Models"),2,true)a:NumSlider("#WireRadioTool_channel","wire_radio_channel",1,30,0)a:NumSlider("#WireRadioTool_values","wire_radio_values",1,20,0)a:CheckBox("#WireRadioTool_secure","wire_radio_secure")end
--addons/!lpakr_out/lua/wire/stools/target_finder.lua:
WireToolSetup.setCategory("Detection/Beacon")WireToolSetup.open("target_finder","Target Finder","gmod_wire_target_finder",nil,"Target Finders")if CLIENT then language.Add("Tool.wire_target_finder.name","Target Finder Beacon Tool (Wire)")language.Add("Tool.wire_target_finder.desc","Spawns a target finder beacon for use with the wire system.")language.Add("WireTargetFinderTool_minrange","Minimum Range:")language.Add("WireTargetFinderTool_maxrange","Maximum Range:")language.Add("WireTargetFinderTool_maxtargets","Maximum number of targets to track:")language.Add("WireTargetFinderTool_MaxBogeys","Max number of bogeys (closest):")language.Add("WireTargetFinderTool_MaxBogeys_desc","Set to 0 for all within range, this needs to be atleast as many as Max Targets.")language.Add("WireTargetFinderTool_players","Target players")language.Add("WireTargetFinderTool_notowner","Do not target owner")language.Add("WireTargetFinderTool_notownersstuff","Do not target owner's stuff")language.Add("WireTargetFinderTool_npcs","Target NPCs")language.Add("WireTargetFinderTool_npcname","NPC(s) Filter:")language.Add("WireTargetFinderTool_beacons","Target Locators")language.Add("WireTargetFinderTool_hoverballs","Target Hoverballs")language.Add("WireTargetFinderTool_thrusters","Target Thrusters")language.Add("WireTargetFinderTool_props","Target Props")language.Add("WireTargetFinderTool_propmodel","Prop Model(s) Filter:")language.Add("WireTargetFinderTool_vehicles","Target Vehicles")language.Add("WireTargetFinderTool_rpgs","Target RPGs")language.Add("WireTargetFinderTool_PaintTarget","Paint Target")language.Add("WireTargetFinderTool_PaintTarget_desc","Paints currently selected target(s).")language.Add("WireTargetFinderTool_casesen","Case Sensitive")language.Add("WireTargetFinderTool_playername","Name(s) Filter:")language.Add("WireTargetFinderTool_entity","Entity Name(s):")language.Add("WireTargetFinderTool_steamname","SteamID(s) Filter:")language.Add("WireTargetFinderTool_colorcheck","Color Filter")language.Add("WireTargetFinderTool_colortarget","Color Target/Skip")language.Add("WireTargetFinderTool_pcolR","Red:")language.Add("WireTargetFinderTool_pcolG","Green:")language.Add("WireTargetFinderTool_pcolB","Blue:")language.Add("WireTargetFinderTool_pcolA","Alpha:")language.Add("WireTargetFinderTool_checkbuddylist","Check Propprotection Buddy List (EXPERIMENTAL!)")language.Add("WireTargetFinderTool_onbuddylist","Target Only Buddys (EXPERIMENTAL!)")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/beer/wiremod/targetfinder.mdl",modelsize="",minrange=1,maxrange=1000,players=0,npcs=1,npcname="",beacons=0,hoverballs=0,thrusters=0,props=0,propmodel="",vehicles=0,playername="",steamname="",colorcheck=0,colortarget=0,pcolR=255,pcolG=255,pcolB=255,pcolA=255,casesen=0,rpgs=0,painttarget=1,maxtargets=1,maxbogeys=1,notargetowner=0,notownersstuff=0,entityfil="",checkbuddylist=0,onbuddylist=0}function TOOL:Reload(a)if a.Entity:IsValid()then self:GetOwner():ConCommand("wire_target_finder_entityfil "..a.Entity:GetClass().."\n")else self:GetOwner():ConCommand("wire_target_finder_entityfil \n")end;return true end;function TOOL.BuildCPanel(b)WireToolHelpers.MakePresetControl(b,"wire_target_finder")WireToolHelpers.MakeModelSizer(b,"wire_target_finder_modelsize")ModelPlug_AddToCPanel(b,"TargetFinder","wire_target_finder",true,1)b:NumSlider("#WireTargetFinderTool_minrange","wire_target_finder_minrange",1,10000,0)b:NumSlider("#WireTargetFinderTool_maxrange","wire_target_finder_maxrange",1,10000,0)b:NumSlider("#WireTargetFinderTool_maxtargets","wire_target_finder_maxtargets",1,10,0)b:NumSlider("#WireTargetFinderTool_MaxBogeys","wire_target_finder_maxbogeys",0,30,0)b:NumSlider("#WireTargetFinderTool_minrange","wire_target_finder_minrange",1,1000,0)b:CheckBox("#WireTargetFinderTool_players","wire_target_finder_players")b:CheckBox("#WireTargetFinderTool_notowner","wire_target_finder_notargetowner")b:CheckBox("#WireTargetFinderTool_notownersstuff","wire_target_finder_notownersstuff")b:CheckBox("#WireTargetFinderTool_npcs","wire_target_finder_npcs")b:TextEntry("#WireTargetFinderTool_npcname","wire_target_finder_npcname")b:CheckBox("#WireTargetFinderTool_beacons","wire_target_finder_beacons")b:CheckBox("#WireTargetFinderTool_hoverballs","wire_target_finder_hoverballs")b:CheckBox("#WireTargetFinderTool_thrusters","wire_target_finder_thrusters")b:CheckBox("#WireTargetFinderTool_props","wire_target_finder_props")b:TextEntry("#WireTargetFinderTool_propmodel","wire_target_finder_propmodel")b:CheckBox("#WireTargetFinderTool_vehicles","wire_target_finder_vehicles")b:CheckBox("#WireTargetFinderTool_rpgs","wire_target_finder_rpgs")b:CheckBox("#WireTargetFinderTool_PaintTarget","wire_target_finder_painttarget")b:CheckBox("#WireTargetFinderTool_casesen","wire_target_finder_casesen")b:TextEntry("#WireTargetFinderTool_playername","wire_target_finder_playername")b:TextEntry("#WireTargetFinderTool_entity","wire_target_finder_entityfil")b:TextEntry("#WireTargetFinderTool_steamname","wire_target_finder_steamname")b:CheckBox("#WireTargetFinderTool_colorcheck","wire_target_finder_colorcheck")b:CheckBox("#WireTargetFinderTool_colortarget","wire_target_finder_colortarget")b:NumSlider("#WireTargetFinderTool_pcolR","wire_target_finder_pcolR",0,255,0)b:NumSlider("#WireTargetFinderTool_pcolG","wire_target_finder_pcolG",0,255,0)b:NumSlider("#WireTargetFinderTool_pcolB","wire_target_finder_pcolB",0,255,0)b:NumSlider("#WireTargetFinderTool_pcolA","wire_target_finder_pcolA",0,255,0)b:CheckBox("#WireTargetFinderTool_checkbuddylist","wire_target_finder_checkbuddylist")b:CheckBox("#WireTargetFinderTool_onbuddylist","wire_target_finder_onbuddylist")end
--addons/!lpakr_out/lua/wire/stools/user.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/waypoint.lua:
WireToolSetup.setCategory("Detection/Beacon")WireToolSetup.open("waypoint","Waypoint","gmod_wire_waypoint",nil,"Waypoints")if CLIENT then language.Add("Tool.wire_waypoint.name","Waypoint Beacon Tool (Wire)")language.Add("Tool.wire_waypoint.desc","Spawns a waypoint beacon for use with the wire system.")language.Add("WireWaypointTool_range","Range:")language.Add("WireWaypointTool_alink","Auto-link previous")TOOL.Information={{name="left_0",stage=0,text="Create/Update "..TOOL.Name},{name="right_0",stage=0,text="Link to next waypoint"},{name="reload_0",stage=0,text="Remove link to next waypoint"},{name="left_1",stage=1,text="Select waypoint to go to after this one"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(30)TOOL.ClientConVar={model="models/props_lab/powerbox02d.mdl",range=150,alink=0,createflat=1}function TOOL:LeftClick(a)if!a.HitPos then return false end;if a.Entity:IsPlayer()then return false end;if CLIENT then return true end;if!util.IsValidPhysicsObject(a.Entity,a.PhysicsBone)then return false end;local b=self:GetOwner()if self:GetStage()==1 then self:SetStage(0)if a.Entity:IsValid()&&a.Entity:GetClass()=="gmod_wire_waypoint"&&self.SrcWaypoint&&self.SrcWaypoint:IsValid()then self.SrcWaypoint:SetNextWaypoint(a.Entity)self.SrcWaypoint=nil;return true end;self.SrcWaypoint=nil;return end;local c=self:LeftClick_Make(a,b)if isbool(c)then return c end;local d=self:LeftClick_PostMake(c,b,a)if self.OldWaypoint&&self.OldWaypoint:IsValid()&&self:GetClientNumber("alink")==1 then self.OldWaypoint:SetNextWaypoint(c)end;self.OldWaypoint=c;return d end;function TOOL:RightClick(a)if self:GetStage()==0&&a.Entity:IsValid()&&a.Entity:GetClass()=="gmod_wire_waypoint"then self.SrcWaypoint=a.Entity;self:SetStage(1)return true end;return self:LeftClick(a)end;function TOOL:Reload(a)if self:GetStage()!=0 then return false end;if a.Entity:IsValid()&&a.Entity:GetClass()=="gmod_wire_waypoint"then a.Entity:SetNextWaypoint(NULL)return true end end;function TOOL.BuildCPanel(e)ModelPlug_AddToCPanel(e,"Misc_Tools","wire_waypoint")e:NumSlider("#WireWaypointTool_range","wire_waypoint_range",1,2000,2)e:CheckBox("#WireWaypointTool_alink","wire_waypoint_alink")e:CheckBox("#Create Flat to Surface","wire_waypoint_createflat")end
--addons/!lpakr_out/lua/wire/stools/wheel.lua:
WireToolSetup.setCategory("Physics/Force")WireToolSetup.open("wheel","Wheel","gmod_wire_wheel",nil,"Wheels")if CLIENT then language.Add("tool.wire_wheel.name","Wheel Tool (wire)")language.Add("tool.wire_wheel.desc","Attaches a wheel to something.")TOOL.Information={{name="left",text="Attach a wheel"}}language.Add("tool.wire_wheel.group","Input value to go forward:")language.Add("tool.wire_wheel.group_reverse","Input value to go in reverse:")language.Add("tool.wire_wheel.group_stop","Input value for no acceleration:")language.Add("tool.wire_wheel.group_desc","All these values need to be different.")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(30)TOOL.ClientConVar={torque=3000,friction=1,nocollide=1,forcelimit=0,fwd=1,bck=-1,stop=0}function TOOL:GetAngle(a)return a.HitNormal:Angle()+Angle(self:GetOwner():GetInfoNum("wheel_rx",0),self:GetOwner():GetInfoNum("wheel_ry",0),self:GetOwner():GetInfoNum("wheel_rz",0))end;function TOOL:SetPos(b,a)local c=b:GetPos()-b:NearestPoint(b:GetPos()-a.HitNormal*512)b:SetPos(a.HitPos+c+a.HitNormal)end;function TOOL:GetModel()local d=self:GetOwner()if self:CheckValidModel(d:GetInfo("wheel_model"))then return d:GetInfo("wheel_model")else return"models/props_c17/oildrum001.mdl"end end;function TOOL.BuildCPanel(e)WireToolHelpers.MakePresetControl(e,"wire_wheel")e:NumSlider("#tool.wire_wheel.group","wire_wheel_fwd",-10,10,0)e:NumSlider("#tool.wire_wheel.group_stop","wire_wheel_stop",-10,10,0)e:NumSlider("#tool.wire_wheel.group_reverse","wire_wheel_bck",-10,10,0)e:AddControl("PropSelect",{Label="#tool.wheel.model",ConVar="wheel_model",Category="Wheels",height=5,Models=list.Get("WheelModels")})e:NumSlider("#tool.wheel.torque","wire_wheel_torque",10,10000,0)e:NumSlider("#tool.wheel.forcelimit","wire_wheel_forcelimit",0,50000,0)local f=e:NumSlider("#tool.wheel.friction","wire_wheel_friction",0,50,2)f:SetTooltip("How quickly the wheel comes to a stop. Note: An existing wheel's friction cannot be updated")e:CheckBox("#tool.wheel.nocollide","wire_wheel_nocollide")end
--addons/!lpakr_out/lua/weapons/laserpointer/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/laserpointer/shared.lua:
SWEP.Author=""SWEP.Contact=""SWEP.Purpose=""SWEP.Instructions="Left Click to designate targets. Right click to select laser receiver."SWEP.Category="Wiremod"SWEP.Spawnable=true;SWEP.AdminOnly=false;SWEP.viewModel="models/weapons/v_pistol.mdl"SWEP.worldModel="models/weapons/w_pistol.mdl"SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=false;SWEP.Secondary.Ammo="none"
--addons/!lpakr_out/lua/weapons/sup_arm5_harlem.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_b2cannon.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_binos.lua:
AddCSLuaFile()SWEP.PrintName='Binoculars'SWEP.Author='Scott'SWEP.Category='SUP Weapons'SWEP.Slot=2;SWEP.SlotPos=1;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.Primary.Automatic=false;SWEP.Secondary.Automatic=false;SWEP.Primary.Ammo='none'SWEP.Secondary.Ammo='none'SWEP.ViewModelFlip=false;SWEP.DrawCrosshair=false;SWEP.ViewModel='models/weapons/gredwitch/v_binoculars.mdl'SWEP.WorldModel='models/weapons/gredwitch/w_binoculars.mdl'SWEP.UseHands=true;SWEP.HoldType='camera'SWEP.Binos=true;SWEP.ZoomLevels={{name='x1 Zoom',zoom=60},{name='x2 Zoom',zoom=40},{name='x4 Zoom',zoom=20}}function SWEP:Initialize()self:SetHoldType(self.HoldType)self.Zoomed=false;self.ZoomID=1;self.ZoomAlpha=0;self.ZoomFOV=0 end;function SWEP:PrimaryAttack()if!SERVER||!IsFirstTimePredicted()then return end;if self.Zoomed then srp.marker.TryTraceMortar(self:GetOwner())self:SetNextPrimaryFire(CurTime()+2)end end;function SWEP:SecondaryAttack()if!IsFirstTimePredicted()then return end;if self.Zoomed then self.ZoomID=1+(self.ZoomID+1)%#self.ZoomLevels;self:SetNextSecondaryFire(CurTime()+1)end end;function SWEP:Reload()if self.NextReload&&self.NextReload>CurTime()then return end;self.NextReload=CurTime()+2;if self.Zoomed then self.Zoomed=false;self:SendWeaponAnim(ACT_VM_IDLE)else self.Zoomed=true;self:SendWeaponAnim(ACT_VM_DEPLOY)end;self:SetNextSecondaryFire(CurTime()+1)self:SetNextPrimaryFire(CurTime()+1)end;function SWEP:Deploy()self:SendWeaponAnim(ACT_VM_DRAW)return true end;local a=Material'gredwitch/overlay_binoculars'function SWEP:DrawHUD()self.ZoomAlpha=Lerp(FrameTime()*4,self.ZoomAlpha,self.Zoomed&&255||0)surface.SetDrawColor(0,0,0,self.ZoomAlpha)surface.SetMaterial(a)local b=ScrW()local c=ScrH()surface.DrawTexturedRect(0,-(b-c)/2,b,b)end;function SWEP:CalcViewModelView(d,e)if self.Zoomed then return Vector()else return e-Vector(0,0,1.3)end end;function SWEP:CalcView(f,e,g,h)if self.Zoomed then self.ZoomFOV=math.Approach(self.ZoomFOV,self.Zoomed&&self.ZoomLevels[self.ZoomID].zoom||0,RealFrameTime()*45)h=h-self.ZoomFOV;return e,g,h end end
--addons/!lpakr_out/lua/weapons/sup_cr5k.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,0,-0.5)SWEP.AimPos=Vector(-3.465,4,0.04)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(10,2,1)SWEP.SprintAng=Vector(-20,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='CR-5K Suppressed'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFOV=60;SWEP.ViewModelFlip=false;SWEP.ViewModel='models/tobester/weapons/v_sean_blaster.mdl'SWEP.WorldModel='models/tobester/weapons/w_sean_blaster.mdl'SWEP.UIPosition=Vector(-10,2,0)SWEP.UIAngle=Angle()SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=75;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.055;SWEP.FireSound=Sound'blaster.cr5k_smg'SWEP.ReloadSound=Sound'blaster.reload_smg'SWEP.Recoil=.4;SWEP.RecoilAngle=Angle(-1.3,0.1,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.025;SWEP.AimSpread=.03;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=28;SWEP.DeployTime=0;SWEP.ShowHands=true;SWEP.FadeCrosshairOnAim=true;SWEP.FireDistance=3000;SWEP.FireDistanceDegrade=300;SWEP.FireDistanceDegradeMulti=2;SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=true;SWEP.ZoomAmount=15;SWEP.AdjustableZoom=true;SWEP.MinZoom=1;SWEP.MaxZoom=35;SWEP.ZoomSteps=5;SWEP.HasScope=false;SWEP.PreventQuickScoping=true;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,90,0)SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'SWEP.AmmoOffset=Vector(15,-3,-5)sound.Add({name='blaster.cr5k_smg',channel=CHAN_WEAPON,volume=.35,level=90,pitch={95,100},sound='galactic/weapons/jay/cr5k_fire.wav'})
--addons/!lpakr_out/lua/weapons/sup_dc15sa.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dc17_capwookie.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.AimPos=Vector(0,-5,0)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,-12,-10)SWEP.SprintAng=Vector(50,0,5)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='Commando Pistols'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='duel'SWEP.RunHoldType='normal'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc17dual.mdl'SWEP.WorldModel='models/galactic/weapons/wmodels/supdc17sdualworld.mdl'SWEP.Akimbo=true;SWEP.AmmoOffset=Vector(20,-3,-2)SWEP.AmmoOffsetAng=Angle(-20,-90,90)SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=75;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.08;SWEP.FireSound=Sound'blaster.fire_creep'SWEP.ReloadSound=Sound'blaster.reload_creep'SWEP.ReloadSoundTP=Sound'blaster.reload_creep'SWEP.Recoil=.4;SWEP.RecoilAngle=Angle(-1.3,0.1,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.025;SWEP.AimSpread=.03;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=37;SWEP.DeployTime=0;SWEP.ShowHands=true;SWEP.FadeCrosshairOnAim=true;SWEP.FireDistance=3000;SWEP.FireDistanceDegrade=300;SWEP.FireDistanceDegradeMulti=2;SWEP.ShowHands=true;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,180,0)SWEP.SprintingEnabled=true;SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'sound.Add({name='blaster.fire_creep',channel=CHAN_WEAPON,volume=.35,level=90,pitch=100,sound='galactic/weapons/creep/creep_fire.wav'})sound.Add({name='blaster.reload_creep',channel=CHAN_WEAPON,volume=.35,level=90,pitch=100,sound='galactic/weapons/creep/creep_reload.wav'})
--addons/!lpakr_out/lua/weapons/sup_dc17m_gl.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_emprifle_harlem.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_emprifle_harlem.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(1,-5,0)SWEP.AimPos=Vector(-5.715,-2,.785)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(5,0,-4)SWEP.SprintAng=Vector(-15,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='EMP Rifle'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=1;SWEP.PlayBackRateSV=1;SWEP.BulletDiameter=5;SWEP.CaseLength=10;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/jalmaries/harlemgun/harlemPM_Gun_byJalmaries_v.mdl'SWEP.WorldModel='models/jalmaries/harlemgun/harlemPM_Gun_byJalmaries_w.mdl'SWEP.Spawnable=false;SWEP.AdminSpawnable=false;SWEP.Primary.ClipSize=69;SWEP.Primary.DefaultClip=69;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.15;SWEP.FireSound=Sound'blaster.mando_fire'SWEP.ReloadSound=Sound'blaster.e11_reload'SWEP.Recoil=.4;SWEP.RecoilAngle=Angle(-.5,0,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.01;SWEP.AimSpread=.01;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=60;SWEP.DeployTime=0;SWEP.ShowHands=false;SWEP.FadeCrosshairOnAim=true;SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'SWEP.AmmoOffset=Vector(20,-2,-3)SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,90,0)SWEP.ClumpSpread=nil;sound.Add({name='blaster.ca88_fire',channel=CHAN_WEAPON,volume=.72,level=85,pitch={95,100},sound='weapons/ca88_fire.mp3'})sound.Add({name='blaster.e11_reload',channel=CHAN_WEAPON,volume=.72,level=85,pitch={95,100},sound='weapons/dc17m_sza_reload.wav'})
--addons/!lpakr_out/lua/weapons/sup_grenade_smoke.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_hz12.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_iqa11.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_jax.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(0,-1,0)SWEP.AimPos=Vector(-4.83,-7.4,-.35)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-4,0)SWEP.SprintAng=Vector(-35,30,-20)SWEP.ViewModelMovementScale=.75;SWEP.IconLetter='b'SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=false;SWEP.ZoomAmount=1;SWEP.AdjustableZoom=true;SWEP.MinZoom=0;SWEP.MaxZoom=5;SWEP.ZoomSteps=5;SWEP.ScopeOverrideMaterialIndex=6;SWEP.ScopeFOV=10;SWEP.ScopeFlipX=false;SWEP.ScopeFlipY=false;SWEP.ScopedBlur=false;SWEP.PrintName='Mythoclast'SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(24,-0.3,-4.5)SWEP.Chamberable=false;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto','semi'}SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/tobester/weapons/v_jax_blaster.mdl'SWEP.WorldModel='models/tobester/weapons/w_jax_blaster.mdl'SWEP.Spawnable=info.Dev;SWEP.AdminSpawnable=false;SWEP.Primary.ClipSize=50;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.19;SWEP.FireSound=Sound'jax.fire'SWEP.ReloadSound=Sound'jax.reload'SWEP.RecoilAngle=Angle(-1.4,0,0)SWEP.Recoil=3;SWEP.RecoilAngle=Angle(-3,0,0)SWEP.HipDivRecoil=Vector(.045,.05,.05)SWEP.RecoilSpeed=12;SWEP.HipSpread=.02;SWEP.AimSpread=.002;SWEP.VelocitySensitivity=0;SWEP.MaxSpreadInc=0;SWEP.SpreadPerShot=0;SWEP.SpreadCooldown=0;SWEP.Shots=1;SWEP.Damage=60;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.HasScope=true;SWEP.FadeCrosshairOnAim=true;SWEP.PreventQuickScoping=true;SWEP.UIPosition=Vector(-5,-40,0)SWEP.UIAngle=Angle(0,90,0)SWEP.HeadPopper=true;sound.Add({name='jax.fire',channel=CHAN_WEAPON,volume=.35,level=90,pitch=100,sound='galactic/weapons/jax/jaxfire.wav'})sound.Add({name='jax.reload',channel=CHAN_WEAPON,volume=.35,level=90,pitch=100,sound='galactic/weapons/jax/jaxreload.wav'})
--addons/!lpakr_out/lua/weapons/sup_rt97c.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_trandouzi.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swb_base/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swb_base/sh_bonemods.lua:
local a=Vector()local b=Angle()local c=Vector(1,1,1)local function d(e,f,g,h)e.wepanimpercent=math.Approach(e.wepanimpercent||0,f&&0||1,RealFrameTime()/1*60)if f&&!h then e.wepanimpercent=nil;e:InvalidateBoneCache()return end;local i=f&&h||g;for j=1,#i do local g=i[j]local k,l=g.name,g.ang||b;local m=e:LookupBone(k)if m&&m!=-1 then e:ManipulateBoneAngles(m,l*e.wepanimpercent)end end;if f&&pl.wepanimpercent==0 then e.wepanimpercent=nil;e:InvalidateBoneCache()end end;function SWEP:InitBoneMods()self.BoneMods=nil;self.BoneAnimationSets=self.BoneAnimationSets||{}end;function SWEP:ResetBones(n)n=n||self:GetOwner()if!IsValid(n)then return end;n:InvalidateBoneCache()for j=0,n:GetBoneCount()do n:ManipulateBoneScale(j,c)n:ManipulateBoneAngles(j,b)n:ManipulateBonePosition(j,a)end end;function SWEP:PlayBoneAnimation(o)if o&&self.BoneAnimationSets[o]then self:SetBoneAnimationSetID(o)else self:SetBoneAnimationSetID(0)end end;function SWEP:IsPlayingBoneAnimation()return self:GetBoneAnimationSetID()!=0 end;function SWEP:AddBoneAnimation(p,g)self.BoneAnimationSets[p]=g end;function SWEP:GetBoneAnimation(p)return self.BoneAnimationSets[p]end;function SWEP:IsPlayingBoneAnimationSet(p)return self:GetBoneAnimationSetID()==p end;function SWEP:GetBoneAnimationPlaying()local p=self:GetBoneAnimationSetID()return self.BoneAnimationSets[p||1]end;function SWEP:GetBoneAnimationLastPlayed()if!self.LastBoneAnimationID then return else return self.BoneAnimationSets[self.LastBoneAnimationID]end end;function SWEP:DoWorldBoneAnimation(e)e=self:GetOwner()if!IsValid(e)then return end;if self.AnimResetBones then self.AnimResetBones=false;self:ResetBones(e)return end;local q=self:GetBoneAnimationPlaying()if!q then return end;local r=e.wepanimpercent&&e.wepanimpercent>0;if q||r then d(e,!q&&r,q,self:GetBoneAnimationLastPlayed())end;self:OnCustomBoneAnimation(e)end;function SWEP:OnCustomBoneAnimation(e)end;function SWEP:DoViewModelBoneAnimation(s)end
--addons/!lpakr_out/lua/weapons/swb_base/cl_calcview.lua:
local a,b,c,d,e,f,g,h;local i,j,k=Angle(0,0,0),Angle(0,0,0),Angle(0,0,0)local l=debug.getregistry()local m=l.Entity.GetVelocity;local n=l.Vector.Length;local o=l.Angle.Right;local p=l.Angle.Up;local q=l.Angle.Forward;local r=l.Angle.RotateAroundAxis;local s=l.Player.GetCurrentCommand;local t=l.CUserCmd.CommandNumber;SWEP.LerpBackSpeed=5;function SWEP:CalcView(u,v,h,w,x,y)a,b=FrameTime(),CurTime()if self.ReloadViewBobEnabled then if self.IsReloading&&self.Cycle<=0.9 then g=self:GetOwner():GetAttachment(1)if g then h=h*1;self.LerpBackSpeed=1;j=LerpAngle(a*4,j,(h-g.Ang)*0.3)else self.LerpBackSpeed=math.Approach(self.LerpBackSpeed,5,a*40)j=LerpAngle(a*self.LerpBackSpeed,j,i)end else self.LerpBackSpeed=math.Approach(self.LerpBackSpeed,5,a*40)j=LerpAngle(a*self.LerpBackSpeed,j,i)end;r(h,o(h),j.p*self.RVBPitchMod)r(h,p(h),j.r*self.RVBYawMod)r(h,q(h),(j.p+j.r)*.25*self.RVBRollMod)end;if!self.HasScope&&self.dt.State==SWB_AIMING then if self.DelayedZoom then if b>self.AimTime then if self.SnapZoom then self.CurFOVMod=self.ZoomAmount else self.CurFOVMod=Lerp(a*10,self.CurFOVMod,self.ZoomAmount)end else self.CurFOVMod=Lerp(a*10,self.CurFOVMod,0)end else if self.SnapZoom then self.CurFOVMod=self.ZoomAmount else self.CurFOVMod=Lerp(a*10,self.CurFOVMod,self.ZoomAmount)end end else self.CurFOVMod=Lerp(a*10,self.CurFOVMod,0)end;w=math.Clamp(w-self.CurFOVMod,5,90)return v,h+k*self.ViewbobIntensity,w end;function SWEP:AdjustMouseSensitivity()if self.dt.State==SWB_AIMING then local z=math.Clamp(cvar.GetValue('weapon_aimsense')||1,0,1)return z>0&&z||.7 end end
--addons/!lpakr_out/lua/weapons/swb_base/cl_model.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_drr_remote_gm.lua:
AddCSLuaFile()SWEP.PrintName='GM Drone'SWEP.Category='Drones'SWEP.Spawnable=true;SWEP.UseHands=true;SWEP.DrawAmmo=false;SWEP.ViewModelFOV=50;SWEP.Slot=3;SWEP.SlotPos=5;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=true;SWEP.Primary.Ammo='none'SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo='none'SWEP.ViewModel='models/dronesrewrite/c_controller/c_controller.mdl'SWEP.WorldModel='models/dronesrewrite/w_controller/w_controller.mdl'SWEP.TargetDRR=NULL;SWEP.RemoteDRRDistance=4096;SWEP.DroneClass={'dronesrewrite_gm'}function SWEP:DoIdle()timer.Create('weapon_idle'..self:EntIndex(),self:SequenceDuration(),1,function()if IsValid(self)then self:SendWeaponAnim(ACT_VM_IDLE)self:DoIdle()end end)end;function SWEP:Initialize()self:SetHoldType("slam")end;function SWEP:DrawHUD()if IsValid(self.Owner:GetNWEntity('DronesRewriteDrone'))then return end;local a=util.TraceLine({start=EyePos(),endpos=self.Owner:GetShootPos()+self.Owner:GetAimVector()*self.RemoteDRRDistance,filter=self.Owner})local b=a.Entity;local c='Drone that you\'re looking at - 'if!IsValid(b)then b=self:GetNWEntity('DronesRewriteDrone')c='Chosen drone - 'end;if IsValid(b)&&b.IS_DRR then local d,e=ScrW()/2,ScrH()-220;draw.SimpleText(c..b:GetUnit(),'DronesRewrite_customfont2_1',d,e,Color(255,255,255,200),TEXT_ALIGN_CENTER)local f=b:LocalToWorld(b:OBBCenter())local a=util.TraceLine({start=EyePos(),endpos=f,filter=self.Owner})if a.Hit&&a.Entity!=b then return end;local f=f:ToScreen()local g=math.sin(CurTime()*2)*30;surface.DrawCircle(f.x,f.y,g,Color(255,255,255,50))local g=math.sin(CurTime()*4)*30;surface.DrawCircle(f.x,f.y,g,Color(255,255,255,50))end end;function SWEP:CreateDrone()local h=self:GetOwner()local a=h:GetEyeTraceNoCursor()if!a.Hit then return end;h.Drone=ents.Create(self.DroneClass[math.random(1,#self.DroneClass)])if IsValid(h.Drone)then local f=a.HitPos+a.HitNormal*(self.SpawnHeight&&self.SpawnHeight||32)h.Drone:SetupOwner(h)h.Drone:SetPos(f)h.Drone:SetAngles(Angle(0,(h:GetPos()-a.HitPos):Angle().y,0))h.Drone:Spawn()h.Drone:Activate()h.Drone.Owner=h;undo.Create'drone_undo'undo.AddEntity(h.Drone)undo.SetPlayer(h)undo.Finish'Drone'print'Create Drones!'return h.Drone end end;function SWEP:GetDrone()local h=self:GetOwner()if IsValid(h.Drone)then if h.Drone:IsDroneDestroyed()then h.Drone:Remove()return self:CreateDrone()else return h.Drone end else return self:CreateDrone()end end;function SWEP:PrimaryAttack()if!SERVER then return end;local i=self:GetDrone()if IsValid(i)then self:SetNextPrimaryFire(CurTime()+0.5)self:SetNextSecondaryFire(CurTime()+0.5)end end;function SWEP:SecondaryAttack()self:SetNextPrimaryFire(CurTime()+0.9)self:SetNextSecondaryFire(CurTime()+0.9)local h=self:GetOwner()h:SetAnimation(PLAYER_ATTACK1)self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)self:DoIdle()end;function SWEP:Reload()if self.NextUse&&self.NextUse>CurTime()then return end;self.NextUse=CurTime()+2;srp.notif.Confirm({title='Confirm Destruction',sub_text='Are you sure you want to self-destruct this drone?',ent=self,callback=function(j)net.Start'dronesrewrite_selfdestruct'net.SendToServer()end})end;function SWEP:OnRemove(k)timer.Stop('weapon_idle'..self:EntIndex())local h=self:GetOwner()if!k&&IsValid(h)&&IsValid(h.Drone)then h.Drone:Remove()end end;function SWEP:Holster()self:OnRemove(true)return true end;function SWEP:Deploy()self.Weapon:SendWeaponAnim(ACT_VM_DRAW)self:DoIdle()self:SetDeploySpeed(0.7)self:SetNextPrimaryFire(CurTime()+self:SequenceDuration()*0.8)self:SetNextSecondaryFire(CurTime()+self:SequenceDuration()*0.8)return true end
--addons/!lpakr_out/lua/weapons/weapon_e5.lua:
AddCSLuaFile()SWEP.PrintName='E5 Blaster'SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,-7,0)SWEP.AimPos=Vector(-3.7,0,0)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,0,1)SWEP.SprintAng=Vector(-15,5,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Event Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/weapons/v_E5.mdl'SWEP.WorldModel='models/weapons/w_E5.mdl'SWEP.UIPosition=Vector(15,0,0)SWEP.UIAngle=Angle()SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=80;SWEP.Primary.DefaultClip=80;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.14;SWEP.FireSound=Sound'blaster.fire_smg'SWEP.ReloadSound=Sound'blaster.reload_smg'SWEP.Recoil=.4;SWEP.RecoilAngle=Angle(-.5,0,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.01;SWEP.AimSpread=.01;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=50;SWEP.DeployTime=0;SWEP.ShowHands=false;SWEP.FadeCrosshairOnAim=false;SWEP.TracerName='sup_laser_red'SWEP.Primary.TracerName='sup_laser_red'SWEP.ImpactEffectColor=Vector(255,0,0)
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_crafter.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_crafter.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category='SUP Custom Weapons'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/starwars/cwa/lightsabers/darksaberancient.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Crafter Lightsaber"SWEP.Class="weapon_lightsaber_crafter"SWEP.DualWielded=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound="lightsaber/saber_loop1.wav"SWEP.UseSwingSound="lightsaber/darksaber_swing.wav"SWEP.UseOnSound="lightsaber/saber_on_kylo.wav"SWEP.UseOffSound="lightsaber/saber_off_kylo.wav"SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_dual_lightsaber_base"SWEP.DamageType=DMG_DISSOLVE
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dual_guardian.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dual_master.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Dual Master Lightsaber"SWEP.Class="weapon_lightsaber_dual_master"SWEP.DualWielded=true;SWEP.SaberDamage=300;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=250;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb","Force Heal","Force Pull","Saber Throw","Force Repulse","Force Push","Group Heal"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_dual_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_ichigo.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David + Scott"SWEP.Category='SUP Custom Weapons'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel='models/weapons/v_crowbar.mdl'SWEP.WorldModel='models/weapons/dannio/starwars/w_ichigo.mdl'SWEP.ViewModelFOV=55;SWEP.DamageType=DMG_DISSOLVE;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Veritas Lightsaber"SWEP.Class="weapon_lightsaber_ichigo"SWEP.DualWielded=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=false;SWEP.NoGlow=true;SWEP.UseHilt='models/weapons/dannio/starwars/w_ichigo.mdl'SWEP.UseLength=false;SWEP.UseWidth=2.5;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;sound.Add({name='ichigo_loop',channel=CHAN_STATIC,volume=.85,level=80,pitch=100,sound='galactic/weapons/ichigo/hum.wav'})sound.Add({name='ichigo_swing',channel=CHAN_STATIC,volume=.85,level=80,pitch=100,sound='galactic/weapons/ichigo/swing.wav'})sound.Add({name='ichigo_soundon',channel=CHAN_WEAPON,volume=.85,level=80,pitch=100,sound='galactic/weapons/ichigo/onsound.wav'})sound.Add({name='ichigo_soundoff',channel=CHAN_WEAPON,volume=.85,level=80,pitch=100,sound='galactic/weapons/ichigo/offsound.wav'})SWEP.UseLoopSound='ichigo_loop'SWEP.UseSwingSound='ichigo_swing'SWEP.UseOnSound='ichigo_soundon'SWEP.UseOffSound='ichigo_soundoff'SWEP.Base="wos_adv_dual_lightsaber_base"SWEP.HolsterBone='forward'function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*-10+c:Up()*-6;c:RotateAroundAxis(c:Up(),45)return b,c end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_moe.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_pike_aedius.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David + Scott"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/galactic/weapons/saberpike/saberpike.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Aedius's Pike"SWEP.Class="weapon_lightsaber_pike_aedius"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.MaxForce=200;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.IgnoreHiltCosmetic=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Saber Throw","Force Leap","Force Absorb","Force Heal","Force Push","Cloak"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=false;SWEP.NoGlow=true;SWEP.UseHilt="models/galactic/weapons/saberpike/saberpike.mdl"SWEP.UseLength=55;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"SWEP.HolsterBone='forward'SWEP.DamageType=DMG_DISSOLVE;function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*-10+c:Up()*-6;c:RotateAroundAxis(c:Up(),45)return b,c end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_smashy.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_popcorn.lua:
AddCSLuaFile()SWEP.PrintName="Popcorn"SWEP.Slot=1;SWEP.SlotPos=1;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.ViewModel="models/Teh_Maestro/popcorn.mdl"SWEP.WorldModel="models/Teh_Maestro/popcorn.mdl"SWEP.Spawnable=false;SWEP.AdminOnly=false;SWEP.Author="Antimony51"SWEP.Instructions="Left Click: Eat Popcorn\nRight Click: Throw Bucket"SWEP.Primary.Clipsize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.Clipsize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=false;SWEP.Secondary.Ammo="none"SWEP.DrawAmmo=false;SWEP.Slot=1;SWEP.SlotPos=1;SWEP.HoldType="shotgun"function SWEP:Deploy()end;function SWEP:Think()local a=self:GetOwner()if(a.ChewScale||0)>0 then a.ChewScale=math.Clamp((a.ChewStart+a.ChewDur-CurTime())/a.ChewDur,0,1)end end;function SWEP:Initialize()end;function SWEP:PrimaryAttack()local a=self:GetOwner()a.ChewScale=1;a.ChewStart=CurTime()a.ChewDur=SoundDuration("crisps/eat.wav")self.Weapon:SetNextPrimaryFire(CurTime()+12)end;function SWEP:SecondaryAttack()local b,c,d,e;self.Weapon:SetNextSecondaryFire(CurTime()+16)if CLIENT then return end;local a=self:GetOwner()a:EmitSound("weapons/slam/throw.wav")a:ViewPunch(Angle(math.Rand(-8,8),math.Rand(-8,8),0))b=ents.Create("sent_popcorn_thrown")b:SetOwner(a)b:SetPos(a:GetShootPos())b:Spawn()b:Activate()d=b:GetPhysicsObject()if IsValid(d)then d:SetVelocity(a:GetPhysicsObject():GetVelocity())d:AddVelocity(a:GetAimVector()*128*d:GetMass())d:AddAngleVelocity(VectorRand()*128*d:GetMass())end end;if CLIENT then local f=ParticleEmitter(Vector(0,0,0))function SWEP:GetViewModelPosition(g,h)g,h=LocalToWorld(Vector(20,-10,-15),Angle(0,0,0),g,h)return g,h end;local function i(j,k)j:SetColor(255,255,255,255)j:SetVelocity(k||VectorRand():GetNormalized()*15)j:SetGravity(Vector(0,0,-200))j:SetLifeTime(0)j:SetDieTime(math.Rand(5,10))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(255)j:SetEndAlpha(0)j:SetCollide(true)j:SetBounce(0.25)j:SetRoll(math.pi*math.Rand(0,1))j:SetRollDelta(math.pi*math.Rand(-4,4))end;net.Receive("Popcorn_Eat",function()local l=net.ReadEntity()if!IsValid(l)then return end;local m=net.ReadFloat()local n=l:LookupAttachment("eyes")f:SetPos(LocalPlayer():GetPos())local o=l:GetAttachment(n)||{Ang=l:EyeAngles(),Pos=l:EyePos()}local p;local g;if l!=LocalPlayer()then p=(o.Ang:Forward()-o.Ang:Up()):GetNormalized()g=o.Pos+p*3 else p=l:GetAimVector():GetNormalized()g=l:GetShootPos()+gui.ScreenToVector(ScrW()/2,ScrH()/4*3)*10 end;for q=1,m do if!IsValid(l)then return end;local j=f:Add("particle/popcorn-kernel",g)if j then local r=VectorRand():GetNormalized()i(j,(p+r):GetNormalized()*math.Rand(0,40))end end end)net.Receive("Popcorn_Eat_Start",function()local l=net.ReadEntity()l.ChewScale=1;l.ChewStart=CurTime()l.ChewDur=SoundDuration("crisps/eat.wav")end)end
--addons/!lpakr_out/lua/weapons/weapon_shield.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/weapons/weapon_turboblaster.lua:
AddCSLuaFile()SWEP.PrintName='Turbolasers'SWEP.Author='Scott'SWEP.HoldType='normal'SWEP.Category='SUP Event Weapons'SWEP.UseHands=false;SWEP.Slot=1;SWEP.SlotPos=1;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.WorldModel=''SWEP.Primary.Damage=0;SWEP.Primary.NumShots=0;SWEP.Primary.Cone=0;SWEP.Primary.Delay=0;SWEP.Primary.ClipSize=0;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.Primary.Ammo='none'SWEP.Primary.TakeAmmo=0;SWEP.Primary.Tracer=0;SWEP.Primary.TracerName='none'SWEP.Secondary.Ammo='none'SWEP.Secondary.Automatic=true;SWEP.ViewModelFlip=false;SWEP.AnimPrefix='rpg'SWEP.DrawCrosshair=true;SWEP.FireMode=0;SWEP.FireSpeed={0.15,0.25,0.5,1,2,3,4,5}SWEP.FireColor=0;SWEP.FireColors={{'Blue',col.white},{'Green',col.green},{'Red',col.red},{'Yellow',col.yellow},{'Orange',col.orange},{'Purple',col.purple}}function SWEP:Initialize()self:SetHoldType(self.HoldType)end;function SWEP:PrimaryAttack()if CLIENT then return true end;self:SetNextPrimaryFire(CurTime()+(self.Cooldown||0.1))local a=self:GetOwner()local b=a:EyePos()local c=a:GetAimVector()local d=ents.Create'rp_laserbolt'd.Ready=true;d:SetOwner(a)d:SetPos(b+c*500)d:SetAngles(c:Angle())d:SetColor(self.FireColors[self.FireColor+1][2])d:Spawn()end;function SWEP:SecondaryAttack()if CLIENT then return end;if!IsFirstTimePredicted()then return end;self:SetNextSecondaryFire(CurTime()+1)self.FireColor=(self.FireColor+1)%#self.FireColors;srp.notif.Success(self:GetOwner(),3,'Turboblaster colours set to '..self.FireColors[self.FireColor+1][1])end;function SWEP:Holster()if!SERVER then return true end;self:GetOwner():DrawViewModel(true)self:GetOwner():DrawWorldModel(true)return true end;function SWEP:Deploy()end;function SWEP:Reload()if CLIENT then return end;if!IsFirstTimePredicted()then return end;if self.NextReload&&self.NextReload>CurTime()then return end;self.FireMode=(self.FireMode+1)%#self.FireSpeed;self.Cooldown=self.FireSpeed[self.FireMode+1]self.NextReload=CurTime()+.5;srp.notif.Success(self:GetOwner(),3,'Firespeed set to '..self.FireSpeed[self.FireMode+1]..'s')end;function SWEP:DrawWorldModel()end;function SWEP:PreDrawViewModel(e)return true end
--addons/!lpakr_out/lua/weapons/wos_adv_single_lightsaber_base/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot/relationships.lua:
local a=CreateConVar("drgbase_debug_relationships","0")function ENT:IsFrightening()return self:GetNW2Bool("DrGBaseFrightening")end;function ENT:Team()return self:GetNW2Int("DrGBaseTeam",0)end;local function b(c)if c==D_LI then return"D_LI"elseif c==D_HT then return"D_HT"elseif c==D_FR then return"D_FR"elseif c==D_NU then return"D_NU"else return"D_ER"end end;local d={[D_LI]=true,[D_HT]=true,[D_FR]=true}local function e(c)return d[c]||false end;local function f(c)return e(c)||c==D_NU end;local g=D_NU;local h=1;local i={disp=g,prio=h}function ENT:_InitRelationships()if CLIENT then return end;self._DrGBaseRelationships=table.DrG_Default({},g)self._DrGBaseRelPriorities=table.DrG_Default({},h)self._DrGBaseRelationshipCaches={[D_LI]={},[D_HT]={},[D_FR]={}}self._DrGBaseIgnoredEntities={}if f(self.DefaultRelationship)then self._DrGBaseDefaultRelationship=self.DefaultRelationship else self._DrGBaseDefaultRelationship=g end;self._DrGBaseRelationshipDefiners={["entity"]=table.DrG_Default({},i),["class"]=table.DrG_Default({},i),["model"]=table.DrG_Default({},i),["faction"]=table.DrG_Default({},i)}self:SetNW2Bool("DrGBaseFrightening",self.Frightening)self._DrGBaseFactions={}self:UpdateRelationships()self:JoinFactions(self.Factions)end;if SERVER then else function ENT:LocalPlayerRelationship()return self._DrGBaseLocalPlayerRelationship||g end;net.Receive("DrGBaseNextbotPlayerRelationship",function()local j=net.ReadEntity()local c=net.ReadInt(4)if IsValid(j)then j._DrGBaseLocalPlayerRelationship=c end end)function ENT:GetRelationship(k,l)if IsValid(k)then return self:NetCallback("DrGBaseGetRelationship",l,k)elseif isfunction(l)then l(self,D_ER)end end;function ENT:IsAlly(k,l)return self:GetRelationship(k,function(self,c)l(self,c==D_LI)end)end;function ENT:IsEnemy(k,l)return self:GetRelationship(k,function(self,c)l(self,c==D_HT)end)end;function ENT:IsAfraidOf(k,l)return self:GetRelationship(k,function(self,c)l(self,c==D_FR)end)end;function ENT:IsHostile(k,l)return self:GetRelationship(k,function(self,c)l(self,c==D_HT||c==D_FR)end)end;function ENT:IsNeutral(k,l)return self:GetRelationship(k,function(self,c)l(self,c==D_NU)end)end;function ENT:IsIgnored(k,l)if IsValid(k)then return self:NetCallback("DrGBaseIsIgnored",l,k)elseif isfunction(l)then l(self,false)end end end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/locomotion.lua:
if CLIENT then return end;function ENT:_InitLocomotion()self:SetAcceleration(self.Acceleration)self:SetDeceleration(self.Deceleration)self:SetJumpHeight(self.JumpHeight)self:SetStepHeight(self.StepHeight)self:SetMaxYawRate(self.MaxYawRate)self:SetDeathDropHeight(self.DeathDropHeight)end;function ENT:GetAcceleration()return self.loco:GetAcceleration()end;function ENT:SetAcceleration(a)return self.loco:SetAcceleration(a)end;function ENT:GetDeceleration()return self.loco:GetDeceleration()end;function ENT:SetDeceleration(b)return self.loco:SetDeceleration(b)end;function ENT:GetJumpHeight()return self.loco:GetJumpHeight()end;function ENT:SetJumpHeight(c)return self.loco:SetJumpHeight(c)end;function ENT:GetStepHeight()return self.loco:GetStepHeight()end;function ENT:SetStepHeight(c)return self.loco:SetStepHeight(c)end;function ENT:GetMaxYawRate()return self.loco:GetMaxYawRate()end;function ENT:SetMaxYawRate(d)return self.loco:SetMaxYawRate(d)end;function ENT:GetDeathDropHeight()return self.loco:GetDeathDropHeight()end;function ENT:SetDeathDropHeight(c)return self.loco:SetDeathDropHeight(c)end;function ENT:IsStuck()return self.loco:IsStuck()end;function ENT:ClearStuck()return self.loco:ClearStuck()end;local e=Vector()function ENT:IsStuckInWorld()return self:TraceHull(e,{collisiongroup=COLLISION_GROUP_DEBRIS}).HitWorld end;function ENT:GetDesiredSpeed()return self:GetNW2Float("DrGBaseDesiredSpeed")end;function ENT:SetDesiredSpeed(f)return self.loco:SetDesiredSpeed(f)end;local g=FindMetaTable("CLuaLocomotion")local h=g.IsClimbingOrJumping;function g:IsClimbingOrJumping()local i=self:GetNextBot()if i.IsDrGNextbot then return i:IsClimbing()||h(self)else return h(self)end end;local j=g.IsUsingLadder;function g:IsUsingLadder()local i=self:GetNextBot()if i.IsDrGNextbot then local k,l=i:IsClimbingLadder()return k else return j(self)end end;local m=g.SetDesiredSpeed;function g:SetDesiredSpeed(f)local i=self:GetNextBot()if i.IsDrGNextbot then i:SetNW2Float("DrGBaseDesiredSpeed",f)i:SetNW2Float("DrGBaseSpeed",f/i:GetScale())return m(self,f)else return m(self,f)end end
--addons/!lpakr_out/lua/entities/drgbase_nextbot_droidbase/movements.lua:
function ENT:IsCrouching()return self:GetNW2Bool('DrGBaseCrouching')end
--addons/!lpakr_out/lua/entities/drgbase_nextbot_human/shared.lua:
ENT.Base="drgbase_nextbot"ENT.IsDrGNextbotHuman=true;ENT.BehaviourType=AI_BEHAV_HUMAN;ENT.RangeAttackRange=1500;ENT.MeleeAttackRange=0;ENT.ReachEnemyRange=1000;ENT.AvoidEnemyRange=750;ENT.AvoidAfraidOfRange=500;ENT.WatchAfraidOfRange=750;ENT.Spawnable=true;DrGBase.IncludeFile'animations.lua'DrGBase.IncludeFile'movements.lua'ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbSpeed=60;ENT.ClimbUpAnimation=ACT_ZOMBIE_CLIMB_UP;ENT.ClimbOffset=Vector(-14,0,0)ENT.EyeBone="ValveBiped.Bip01_Head1"ENT.EyeOffset=Vector(5,0,2.5)ENT.UseWeapons=true;ENT.Weapons={}ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=true;ENT.PossessionEnabled=false;ENT.PossessionPrompt=false;ENT.PossessionCrosshair=false;ENT.PossessionMovement=POSSESSION_MOVE_8DIR;ENT.PossessionViews={{offset=Vector(0,30,20),distance=100},{offset=Vector(7.5,0,2.5),distance=0,eyepos=true}}ENT.PossessionBinds={[IN_DUCK]={{coroutine=false,onkeypressed=function(self)self:SetCrouching(!self:IsCrouching())end}},[IN_ATTACK]={{coroutine=true,onkeydown=function(self)self:PrimaryFire()end}},[IN_ATTACK2]={{coroutine=true,onkeydown=function(self)self:SecondaryFire()end}},[IN_RELOAD]={{coroutine=true,onkeydown=function(self)self:Reload()end}}}
--addons/!lpakr_out/lua/entities/e60r_rocket/shared.lua:
ENT.Type="anim"ENT.PrintName="High Explosive Anti-Tank RPG"ENT.Author=""ENT.Contact=""ENT.Purpose=""ENT.Instructions=""ENT.Spawnable=false;ENT.AdminSpawnable=false
--addons/!lpakr_out/lua/entities/ent_grapple/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/furniture_bed.lua:
AddCSLuaFile()ENT.PrintName='Furniture - Couch'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Type='anim'ENT.Base='base_anim'ENT.Contact=''ENT.Purpose=''ENT.Instructions=''ENT.Spawnable=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Model='models/props_c17/FurnitureCouch001a.mdl'ENT.Interactive=false;ENT.InteractionName='Sleep'ENT.SpawnPosition=Vector(50,0,-16)ENT.SpawnAngles=Angle(0,0,0)ENT.Mins=Vector(-15,-15,0)ENT.Maxs=Vector(15,15,60)ENT.BoxColor=Color(255,255,255,10)function ENT:Initialize()end;function ENT:OnSpawned(a,b)local c=b.Name;self.PropertyID=b.id;self.SpawnPointName=c..' - Sofa'local d=self:LocalToWorld(self.SpawnPosition)local e=self:LocalToWorldAngles(self.SpawnAngles)srp.spawn.AddCustomPoint(self.SpawnPointName,'ALL',{cooldown=1800,textcolor=col.yellow,outline=col.yellow_dark,pos=d,ang=e,ent=self,PropertyID=self.PropertyID,canuse=function(f,a)return srp.doors.HasAccess(a,f.PropertyID)end})end;function ENT:OnRemove()srp.spawn.RemoveCustomPoint(self.SpawnPointName)end;local g=20;function ENT:DrawInteraction(h,i,j)surface.SetFont'ui_header.s'surface.SetDrawColor(255,255,255,255)surface.SetMaterial(h.OnPickup)surface.SetTextColor(255,255,255,255)local k=self.InteractionName;local l,m=surface.GetTextSize(k)l=l+g+4;local n,o=j.x,j.y;surface.DrawTexturedRect(n,o,g,g)surface.SetTextPos(n+g+2,o-2)surface.DrawText(k)end;function ENT:Draw(p)self:DrawModel(p)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gmod_balloon.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gmod_button.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_adv_input.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Advanced Input"ENT.WireDebugName="Adv. Input"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=Wire_CreateInputs(self,{"Reset"})self.Outputs=Wire_CreateOutputs(self,{"Out"})end;function ENT:Setup(a,b,c,d,e,f,g)self.keymore=a;self.keyless=b;local h=self:GetPlayer()numpad.OnDown(h,a,"WireAdvInput_On",self,1)numpad.OnUp(h,a,"WireAdvInput_Off",self,1)numpad.OnDown(h,b,"WireAdvInput_On",self,-1)numpad.OnUp(h,b,"WireAdvInput_Off",self,-1)self.toggle=c==1||c==true;self.value_min=d;self.value_max=e;self.Value=f;self.value_start=f;self.speed=g;self:ShowOutput()Wire_TriggerOutput(self,"Out",self.Value)end;function ENT:TriggerInput(i,j)if i=="Reset"then if j!=0 then self.Value=self.value_start;self:ShowOutput()Wire_TriggerOutput(self,"Out",self.Value)end end end;function ENT:InputActivate(k)if self.toggle then return self:Switch(!self.On,k)end;return self:Switch(true,k)end;function ENT:InputDeactivate(k)if self.toggle then return true end;return self:Switch(false,k)end;function ENT:Switch(l,k)if!self:IsValid()then return false end;self.On=l;if l then self.dir=k else self.dir=0 end;return true end;function ENT:Think()BaseClass.Think(self)local m=CurTime()-(self.LastThink||0)self.LastThink=(self.LastThink||0)+m;if self.On==true then self.Value=self.Value+self.speed*m*self.dir;if self.Value<self.value_min then self.Value=self.value_min elseif self.Value>self.value_max then self.Value=self.value_max end;self:ShowOutput()Wire_TriggerOutput(self,"Out",self.Value)self:NextThink(CurTime()+0.02)return true end end;function ENT:ShowOutput()self:SetOverlayText("("..self.value_min.." - "..self.value_max..") = "..self.Value)end;local function n(h,o,k)if!o:IsValid()then return false end;if!gamemode.Call("PlayerUse",h,o)then return end;return o:InputActivate(k)end;local function p(h,o,k)if!o:IsValid()then return false end;if!gamemode.Call("PlayerUse",h,o)then return end;return o:InputDeactivate(k)end;numpad.Register("WireAdvInput_On",n)numpad.Register("WireAdvInput_Off",p)duplicator.RegisterEntityClass("gmod_wire_adv_input",WireLib.MakeWireEnt,"Data","keymore","keyless","toggle","value_min","value_max","value_start","speed","frozen")
--addons/!lpakr_out/lua/entities/gmod_wire_data_satellitedish.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_datasocket.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_datasocket.lua:
AddCSLuaFile()DEFINE_BASECLASS("gmod_wire_socket")ENT.PrintName="Wire Data Socket"ENT.WireDebugName="Socket"function ENT:GetPlugClass()return"gmod_wire_dataplug"end;if CLIENT then local a=ents.FindByClass("gmod_wire_datasocket")||{}local function b()for c,self in ipairs(a)do local d,e=self:GetLinkPos()local f=self:GetClosestPlug()if IsValid(f)&&self:CanLink(f)&&f:GetNWBool("PlayerHolding",false)&&f:GetClosestSocket()==self then local g=f:GetPos():ToScreen()local h=d:ToScreen()surface.SetDrawColor(255,255,100,255)surface.DrawLine(g.x,g.y,h.x,h.y)end end end;function ENT:DrawEntityOutline()end;function ENT:Initialize()self:CacheData()table.insert(a,self)if#a==1 then hook.Add("HUDPaint","Wire_DataSocket_DrawLinkHelperLine",b)end end;function ENT:OnRemove()table.RemoveByValue(a,self)if#a==0 then hook.Remove("HUDPaint","Wire_DataSocket_DrawLinkHelperLine")end end;return end;function ENT:Initialize()self:CacheData()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=WireLib.CreateInputs(self,{"Memory"})self.Outputs=WireLib.CreateOutputs(self,{"Memory"})WireLib.TriggerOutput(self,"Memory",0)self.Memory=nil end;function ENT:Setup(i,j)self.WeldForce=i||5000;self.AttachRange=j||5;self:SetNWInt("AttachRange",self.AttachRange)end;function ENT:ResendValues()self:SetMemory(self.Plug.Memory)end;function ENT:ResetValues()self.Memory=nil;WireLib.TriggerOutput(self,"Memory",0)end;duplicator.RegisterEntityClass("gmod_wire_datasocket",WireLib.MakeWireEnt,"Data","WeldForce","AttachRange")function ENT:SetMemory(k)self.Memory=k;WireLib.TriggerOutput(self,"Memory",1)end;function ENT:ReadCell(l,m)m=m||0;if m>50 then return end;l=math.floor(l)if self.Memory then if self.Memory.ReadCell then return self.Memory:ReadCell(l,m+1)else return nil end else return nil end end;function ENT:WriteCell(l,n,m)m=m||0;if m>50 then return end;l=math.floor(l)if self.Memory then if self.Memory.WriteCell then return self.Memory:WriteCell(l,n,m+1)else return false end else return false end end;function ENT:TriggerInput(o,n,p)if o=="Memory"then self.OwnMemory=self.Inputs.Memory.Src end end;function ENT:BuildDupeInfo()local q=BaseClass.BuildDupeInfo(self)if q.Socket then q.Socket.ArrayInput=nil end;return q end;function ENT:GetApplyDupeInfoParams(q)return q.Socket.WeldForce,q.Socket.AttachRange end;duplicator.RegisterEntityClass("gmod_wire_datasocket",WireLib.MakeWireEnt,"Data","WeldForce","AttachRange")
--addons/!lpakr_out/lua/entities/gmod_wire_digitalscreen/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_dual_input.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_hdd.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Flash EEPROM"ENT.WireDebugName="WireHDD"if CLIENT then return end;function ENT:OnRemove()for a,b in pairs(self.CacheUpdated)do file.Write(self:GetStructName(a),self:MakeFloatTable(self.Cache[a]))end end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self:SetUseType(SIMPLE_USE)self.Outputs=Wire_CreateOutputs(self,{"Data","Capacity","DriveID"})self.Inputs=Wire_CreateInputs(self,{"Clk","AddrRead","AddrWrite","Data"})self.Clk=0;self.AWrite=0;self.ARead=0;self.Data=0;self.Out=0;self.FlashType=0;self.BlockSize=16;self.DriveID=0;self.PrevDriveID=nil;self.DriveCap=0;self.MaxAddress=0;self.Cache={}self.CacheUpdated={}self.Owner_SteamID="SINGLEPLAYER"self:NextThink(CurTime()+1.0)end;function ENT:Setup(c,d)self.DriveID=c;self.DriveCap=d;self:UpdateCap()self:SetOverlayText(self.DriveCap.."kb".."\nWriteAddr:"..self.AWrite.."  Data:"..self.Data.."  Clock:"..self.Clk.."\nReadAddr:"..self.ARead.." = "..self.Out)Wire_TriggerOutput(self,"DriveID",self.DriveID)end;function ENT:GetStructName(e)return"WireFlash/"..(self.Owner_SteamID||"UNKNOWN").."/HDD"..self.DriveID.."/"..e..".txt"end;function ENT:GetCap()if file.Exists(self:GetStructName("drive"),"DATA")then local f=file.Read(self:GetStructName("drive"),"DATA")if tonumber(f)then self.DriveCap=tonumber(f)self.FlashType=0;self.BlockSize=16;self.MaxAddress=self.DriveCap*1024 else local g=string.Explode("\n",f)if g[1]=="FLASH1"then self.DriveCap=tonumber(g[2])||0;self.MaxAddress=tonumber(g[3])||self.DriveCap*1024;self.FlashType=1;self.BlockSize=32 else file.Write(self:GetStructName("drive"),"FLASH1\n"..self.DriveCap.."\n"..self.MaxAddress)end end else file.Write(self:GetStructName("drive"),"FLASH1\n"..self.DriveCap.."\n"..self.MaxAddress)self.FlashType=1;self.BlockSize=32;self.MaxAddress=0 end;if!game.SinglePlayer()&&self.DriveCap>256 then self.DriveCap=256 end;Wire_TriggerOutput(self,"Capacity",self.DriveCap)end;function ENT:UpdateCap()if!game.SinglePlayer()&&self.DriveCap>256 then self.DriveCap=256 end;if self.FlashType==0 then file.Write(self:GetStructName("drive"),self.DriveCap)else file.Write(self:GetStructName("drive"),"FLASH1\n"..self.DriveCap.."\n"..self.MaxAddress)end;self:GetCap()end;function ENT:GetFloatTable(h)local i=h;local j={}local k=0;while string.len(i)>0 do local l=string.sub(i,1,24)i=string.sub(i,25)j[k]=tonumber(l)k=k+1 end;return j end;function ENT:MakeFloatTable(m)local i=""for n=0,#m-1 do local o=string.sub(tostring(m[n]),1,24)o=o..string.rep(" ",24-string.len(o))i=i..o end;return i end;function ENT:ReadCell(p)p=math.floor(p)if self.DriveID<0||!game.SinglePlayer()&&self.DriveID>=4 then return nil end;local q=self:GetPlayer()if q:IsValid()then local r=q:SteamID()r=string.gsub(r,":","_")if r!="UNKNOWN"then self.Owner_SteamID=r else self.Owner_SteamID="SINGLEPLAYER"end;if self.DriveID!=self.PrevDriveID then self:GetCap()self.PrevDriveID=self.DriveID end;if p<self.DriveCap*1024&&p>=0 then local s=math.floor(p/self.BlockSize)local t=math.floor(p)%self.BlockSize;if self.Cache[s]then return self.Cache[s][t]||0 end;if!file.Exists(self:GetStructName(s),"DATA")then self.Cache[s]={}self.CacheUpdated[s]=true;for n=0,self.BlockSize-1 do self.Cache[s][n]=0 end;return 0 end;local u=self:GetFloatTable(file.Read(self:GetStructName(s)))self.Cache[s]={}for n=0,self.BlockSize-1 do self.Cache[s][n]=u[n]||0 end;return self.Cache[s][t]else return nil end else return nil end end;function ENT:WriteCell(p,l)p=math.floor(p)if self.DriveID<0||!game.SinglePlayer()&&self.DriveID>=4 then return false end;local q=self:GetPlayer()if q:IsValid()then local r=q:SteamID()r=string.gsub(r,":","_")if r!="UNKNOWN"then self.Owner_SteamID=r else self.Owner_SteamID="SINGLEPLAYER"end;if self.DriveID!=self.PrevDriveID then self:GetCap()self.PrevDriveID=self.DriveID end;if p<self.DriveCap*1024&&p>=0 then local s=math.floor(p/self.BlockSize)local t=math.floor(p)%self.BlockSize;if self.Cache[s]then self.CacheUpdated[s]=true;self.Cache[s][t]=l;if p>self.MaxAddress then self.MaxAddress=p end;return true end;if!file.Exists(self:GetStructName(s),"DATA")then self.Cache[s]={}self.CacheUpdated[s]=true;for n=0,self.BlockSize-1 do self.Cache[s][n]=0 end;self.Cache[s][t]=l;if p>self.MaxAddress then self.MaxAddress=p end;return true end;local u=self:GetFloatTable(file.Read(self:GetStructName(s)))self.Cache[s]={}for n=0,self.BlockSize-1 do self.Cache[s][n]=u[n]||0 end;self.CacheUpdated[s]=true;self.Cache[s][t]=l;if p>self.MaxAddress then self.MaxAddress=p end;return true else return false end else return false end end;function ENT:Think()local v=next(self.CacheUpdated)if v then self.CacheUpdated[v]=nil;file.CreateDir(string.GetPathFromFilename(self:GetStructName(v)))file.Write(self:GetStructName(v),self:MakeFloatTable(self.Cache[v]))self:UpdateCap()end;self:NextThink(CurTime()+0.25)return true end;function ENT:TriggerInput(w,l)if w=="Clk"then self.Clk=l;if self.Clk>=1 then self:WriteCell(self.AWrite,self.Data)if self.ARead==self.AWrite then local x=self:ReadCell(self.ARead)if x then Wire_TriggerOutput(self,"Data",x)self.Out=x end end end elseif w=="AddrRead"then self.ARead=l;local x=self:ReadCell(l)if x then Wire_TriggerOutput(self,"Data",x)self.Out=x end elseif w=="AddrWrite"then self.AWrite=l;if self.Clk>=1 then self:WriteCell(self.AWrite,self.Data)end elseif w=="Data"then self.Data=l;if self.Clk>=1 then self:WriteCell(self.AWrite,self.Data)if self.ARead==self.AWrite then local x=self:ReadCell(self.ARead)if x then Wire_TriggerOutput(self,"Data",x)self.Out=x end end end end;self:SetOverlayText(self.DriveCap.."kb".."\nWriteAddr:"..self.AWrite.."  Data:"..self.Data.."  Clock:"..self.Clk.."\nReadAddr:"..self.ARead.." = "..self.Out)end;duplicator.RegisterEntityClass("gmod_wire_hdd",WireLib.MakeWireEnt,"Data","DriveID","DriveCap")
--addons/!lpakr_out/lua/entities/gmod_wire_hologrid.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_hoverball.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_hydraulic.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Hydraulic Controller"ENT.WireDebugName="Hydraulic"if CLIENT then return end;function ENT:Initialize()BaseClass.Initialize(self)WireLib.CreateInputs(self,{"Length (Sets the length of the hydraulic)","In (Decreases the length of the hydraulic each tick.)","Out (Increases the length of the hydraulic each tick.)","Constant (Affects the strength of the hydraulic. Higher values means it's able to lift more weight, and more easily overcome the inertia of attached entities.\nSet to zero to reset this value to the default.)","Damping (Affects the springyness of the hydraulic.\nLower values means more bouncyness, higher values means more resistant to change.\nIf set too high, may cause severe shaking.\nSet to zero to reset this value to the default.)"})WireLib.CreateOutputs(self,{"Length","Target Length","Constant","Damping"})self.TargetLength=0;self.current_constant=0;self.current_damping=0;self.direction=0;self.last_time=CurTime()end;function ENT:GetWPos(a,b,c)if a:EntIndex()==0 then return c end;if IsValid(b)then return b:LocalToWorld(c)else return a:LocalToWorld(c)end end;function ENT:GetDistance()local d=self.constraint:GetTable()local e=self:GetWPos(d.Ent1,d.Phys1||d.Ent1:GetPhysicsObject(),d.LPos1)local f=self:GetWPos(d.Ent2,d.Phys2||d.Ent2:GetPhysicsObject(),d.LPos2)return e:Distance(f)end;function ENT:Think()BaseClass.Think(self)if!IsValid(self.constraint)then return end;local g=CurTime()-self.last_time;self.last_time=CurTime()if self.direction!=0 then self:SetLength(math.max(self.TargetLength+self.constraint:GetTable().speed*self.direction*g,1))end;self:UpdateOutputs(true)self:NextThink(CurTime()+0.05)return true end;function ENT:UpdateOutputs(h)if!IsValid(self.constraint)then return end;local i=self:GetDistance()WireLib.TriggerOutput(self,"Length",i)WireLib.TriggerOutput(self,"Target Length",self.TargetLength)if!h then WireLib.TriggerOutput(self,"Constant",self.current_constant)WireLib.TriggerOutput(self,"Damping",self.current_damping)end;self:SetOverlayText(string.format("%s length: %.2f\nConstant: %i\nDamping: %i",self.constraint.stretchonly&&"Winch"||"Hydraulic",i,self.current_constant,self.current_damping))end;function ENT:SetConstraint(j,k)self.constraint=j;self.rope=k;if self.Inputs&&self.Inputs.Constant.Src then self:TriggerInput("Constant",self.Inputs.Constant.Value)else self.current_constant=self.constraint:GetKeyValues().constant end;if self.Inputs&&self.Inputs.Damping.Src then self:TriggerInput("Damping",self.Inputs.Damping.Value)else self.current_damping=self.constraint:GetKeyValues().damping end;if self.Inputs&&self.Inputs.Length.Src then self:TriggerInput("Length",self.Inputs.Length.Value)else self.TargetLength=self:GetDistance()end;self:UpdateOutputs()end;function ENT:SetLength(l)self.TargetLength=l;if IsValid(self.constraint)then self.constraint:Fire("SetSpringLength",l,0)end;if IsValid(self.rope)then self.rope:Fire("SetLength",l,0)end end;function ENT:TriggerInput(m,l)if m=="Length"then self:SetLength(math.max(l,1))elseif m=="In"then self.direction=-l elseif m=="Out"then self.direction=l elseif m=="Constant"then if l!=0 then self.current_constant=l elseif IsValid(self.constraint)then self.current_constant=WireLib.CalcElasticConsts(self.constraint.Ent1,self.constraint.Ent2)end;if IsValid(self.constraint)then self.constraint:Fire("SetSpringConstant",self.current_constant)end;timer.Simple(0.1,function()if IsValid(self)then self:UpdateOutputs()end end)elseif m=="Damping"then if l!=0 then self.current_damping=l elseif IsValid(self.constraint)then self.current_damping=select(2,WireLib.CalcElasticConsts(self.constraint.Ent1,self.constraint.Ent2))end;if IsValid(self.constraint)then self.constraint:Fire("SetSpringDamping",self.current_damping)end;timer.Simple(0.1,function()if IsValid(self)then self:UpdateOutputs()end end)end end;local n={}function MakeWireHydraulicController(o,p,q,r,s,t,k)local u=WireLib.MakeWireEnt(o,{Class="gmod_wire_hydraulic",Pos=p,Angle=q,Model=r})if!IsValid(u)then return end;if!t then n[s]=u else u.MyId=u:EntIndex()t.MyCrtl=u:EntIndex()u:SetConstraint(t,k)u:DeleteOnRemove(t)end;if k then u:DeleteOnRemove(k)end;return u end;duplicator.RegisterEntityClass("gmod_wire_hydraulic",MakeWireHydraulicController,"Pos","Ang","Model","MyId")duplicator.RegisterEntityClass("gmod_wire_winch_controller",MakeWireHydraulicController,"Pos","Ang","Model","MyId")scripted_ents.Alias("gmod_wire_winch_controller","gmod_wire_hydraulic")function MakeWireHydraulic(o,v,w,x,y,z,A,B,C,D,E,F,G)if!constraint.CanConstrain(v,x)then return false end;if!constraint.CanConstrain(w,y)then return false end;local H=v:GetPhysicsObjectNum(x)local I=w:GetPhysicsObjectNum(y)local J=H:LocalToWorld(z)local K=I:LocalToWorld(A)if H==I then return false end;local L,M=WireLib.CalcElasticConsts(v,w)local t,k=constraint.Elastic(v,w,x,y,z,A,L,M,0,C,B,F)if!t then return nil,k end;if E==1 then local N=constraint.Slider(v,w,x,y,z,A,0)N:SetTable({})t:DeleteOnRemove(N)end;local O={Type="WireHydraulic",pl=o,Ent1=v,Ent2=w,Bone1=x,Bone2=y,LPos1=z,LPos2=A,width=B,material=C,speed=D,fixed=E,stretchonly=F}t:SetTable(O)if G then local u=n[G]t.MyCrtl=u:EntIndex()u.MyId=u:EntIndex()u:SetConstraint(t,k)u:DeleteOnRemove(t)if k then u:DeleteOnRemove(k)end;v:DeleteOnRemove(u)w:DeleteOnRemove(u)t:DeleteOnRemove(u)end;return t,k end;duplicator.RegisterConstraint("WireHydraulic",MakeWireHydraulic,"pl","Ent1","Ent2","Bone1","Bone2","LPos1","LPos2","width","material","speed","fixed","stretchonly","MyCrtl")local function P(o,v,w,x,y,z,A,B,Q,R,C,G)return MakeWireHydraulic(o,v,w,x,y,z,A,B,C,Q,0,true,G)end;duplicator.RegisterConstraint("WireWinch",P,"pl","Ent1","Ent2","Bone1","Bone2","LPos1","LPos2","width","fwd_speed","bwd_speed","material","MyCrtl")
--addons/!lpakr_out/lua/entities/gmod_wire_igniter.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Igniter"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WireDebugName="Igniter"function ENT:SetupDataTables()self:NetworkVar("Float",0,"BeamLength")end;if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=Wire_CreateInputs(self,{"A","Length","Extinguish"})self.IgniteLength=10;self:Setup(false,2048)end;function ENT:Setup(a,b)self.TargetPlayers=a;if b then self:SetBeamLength(b)end end;function ENT:DoTrace()local c=self:GetPos()local d=self:GetUp()local e={}e.start=c;e.endpos=c+d*self:GetBeamLength()e.filter={self}local e=util.TraceLine(e)local f=GetConVarNumber('sbox_wire_igniters_allowtrgply')>0;if!IsValid(e.Entity)then return false end;if!gamemode.Call("CanProperty",self:GetPlayer(),"ignite",e.Entity)then return false end;if e.Entity:IsPlayer()&&(!self.TargetPlayers||!f)then return false end;if e.Entity:IsWorld()then return false end;return e.Entity end;function ENT:TriggerInput(g,h)if g=="A"then if h!=0 then local i=self:DoTrace()if i==false then return false end;i:Extinguish()i:Ignite(self.IgniteLength,0)end elseif g=="Length"then self.IgniteLength=math.min(h,GetConVarNumber("sbox_wire_igniters_maxlen"))elseif g=="Extinguish"then if h!=0 then local i=self:DoTrace()if i==false then return false end;i:Extinguish()end end end;duplicator.RegisterEntityClass("gmod_wire_igniter",WireLib.MakeWireEnt,"Data","TargetPlayers","Range")
--addons/!lpakr_out/lua/entities/gmod_wire_motor.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Motor"ENT.WireDebugName="Motor"if CLIENT then ENT.RenderGroup=RENDERGROUP_BOTH;return end;function ENT:Initialize()BaseClass.Initialize(self)self.Inputs=Wire_CreateInputs(self,{"Mul"})end;function ENT:SetConstraint(a)self.constraint=a;self.Mul=0;self:ShowOutput()end;function ENT:SetAxis(b)self.axis=b end;function ENT:TriggerInput(c,d)if c=="Mul"then self.Mul=d;self:ShowOutput()local e=self.constraint;if!IsValid(e)then return false end;e:Fire("Scale",d,0)e:Fire("Activate","",0)end end;function ENT:ShowOutput()if self.constraint&&IsValid(self.constraint)then local f=self.constraint.torque;local g=f*self.Mul;local h=self.constraint.forcelimit;local i=self.constraint.friction;self:SetOverlayText(string.format("Current Torque: %s\nTorque: %s\nForce Limit: %s\nHinge Friction: %s",g,f,h,i))end end;local j={}function MakeWireMotorController(k,l,m,n,o,p,q)local r=WireLib.MakeWireEnt(k,{Class="gmod_wire_motor",Pos=l,Angle=m,Model=o})if!IsValid(r)then return end;if!p then j[n]=r else r.MyId=r:EntIndex()p.MyCrtl=r:EntIndex()r:SetConstraint(p)r:DeleteOnRemove(p)end;if q then r:SetAxis(q)r:DeleteOnRemove(q)end;return r end;duplicator.RegisterEntityClass("gmod_wire_motor",MakeWireMotorController,"Pos","Ang","MyId","model")function MakeWireMotor(k,s,t,u,v,w,x,i,f,y,h,z)if!constraint.CanConstrain(s,u)then return false end;if!constraint.CanConstrain(t,v)then return false end;local A=s:GetPhysicsObjectNum(u)local B=t:GetPhysicsObjectNum(v)local C=A:LocalToWorld(w)local D=B:LocalToWorld(x)if A==B then return false end;local p,q=constraint.Motor(s,t,u,v,w,x,i,f,0,y,0,k,h)if!p then return nil,q end;local E={Type="WireMotor",pl=k,Ent1=s,Ent2=t,Bone1=u,Bone2=v,LPos1=w,LPos2=x,friction=i,torque=f,nocollide=y,forcelimit=h}p:SetTable(E)if z then local r=j[z]p.MyCrtl=r:EntIndex()r.MyId=r:EntIndex()r:SetConstraint(p)r:DeleteOnRemove(p)if q then r:SetAxis(q)r:DeleteOnRemove(q)end;s:DeleteOnRemove(r)t:DeleteOnRemove(r)p:DeleteOnRemove(r)end;return p,q end;duplicator.RegisterConstraint("WireMotor",MakeWireMotor,"pl","Ent1","Ent2","Bone1","Bone2","LPos1","LPos2","friction","torque","nocollide","forcelimit","MyCrtl")
--addons/!lpakr_out/lua/entities/gmod_wire_nailer.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_nailer.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Nailer"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WireDebugName="Nailer"function ENT:SetupDataTables()self:NetworkVar("Float",0,"BeamLength")self:NetworkVar("Bool",0,"ShowBeam")end;if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=WireLib.CreateInputs(self,{"Weld","Axis","Ballsocket"})self:SetBeamLength(2048)end;function ENT:Setup(a,b,c)self.Flim=math.Clamp(a,0,10000)if b then self:SetBeamLength(b)end;if c!=nil then self:SetShowBeam(c)end;self:ShowOutput()end;function ENT:CanNail(d)if!IsValid(d.Entity)||d.Entity:IsPlayer()then return false end;if!util.IsValidPhysicsObject(d.Entity,d.PhysicsBone)then return false end;if!WireLib.CanTool(self:GetPlayer(),d.Entity,"nailer")then return false end;return true end;function ENT:TriggerInput(e,f)if f==0 then return end;local g=self:GetUp()local h=util.TraceLine({start=self:GetPos(),endpos=self:GetPos()+g*self:GetBeamLength(),filter={self}})if!self:CanNail(h)then return end;local i=util.TraceLine({start=h.HitPos,endpos=h.HitPos+g*50,filter={h.Entity,self}})if!self:CanNail(i)then return end;if e=="Weld"then constraint.Weld(h.Entity,i.Entity,h.PhysicsBone,i.PhysicsBone,self.Flim)elseif e=="Axis"then local j=h.Entity:GetPhysicsObject()local k=i.Entity:GetPhysicsObject()if!IsValid(j)||!IsValid(k)then return end;local l=j:WorldToLocal(i.HitPos+i.HitNormal)local m=k:WorldToLocal(i.HitPos)constraint.Axis(h.Entity,i.Entity,h.PhysicsBone,i.PhysicsBone,l,m,self.Flim)elseif e=="Ballsocket"then constraint.Ballsocket(h.Entity,i.Entity,h.PhysicsBone,i.PhysicsBone,i.Entity:WorldToLocal(h.HitPos),self.Flim)end;local n=EffectData()n:SetOrigin(i.HitPos)n:SetNormal(h.HitNormal)n:SetMagnitude(5)n:SetScale(1)n:SetRadius(10)util.Effect("Sparks",n,false,true)end;function ENT:ShowOutput()self:SetOverlayText(string.format("Range: %s\nForce limit: %s",math.Round(self:GetBeamLength(),2),math.Round(self.Flim,2)))end;WireLib.AddInputAlias("A","Weld")duplicator.RegisterEntityClass("gmod_wire_nailer",WireLib.MakeWireEnt,"Data","Flim","Range","ShowBeam")
--addons/!lpakr_out/lua/entities/gmod_wire_pixel.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Pixel"ENT.WireDebugName="Pixel"if CLIENT then function ENT:Draw()self:DrawModel()end;return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.R,self.G,self.B=0,0,0;self.Inputs=WireLib.CreateInputs(self,{"Red","Green","Blue","PackedRGB","RGB","Color [VECTOR]"})end;function ENT:TriggerInput(a,b)local c,d,e=self.R,self.G,self.B;if a=="Red"then c=b elseif a=="Green"then d=b elseif a=="Blue"then e=b elseif a=="PackedRGB"then e=b%256;d=b/256%256;c=b/(256*256)%256 elseif a=="RGB"then local f=math.floor(b/1000)local g=b-math.floor(b/1000)*1000;local h=24*math.fmod(f,10)local i=24*math.fmod(math.floor(f/10),10)local j=24*math.fmod(math.floor(f/100),10)e=g+h;d=g+i;c=g+j elseif a=="Color"then c=b.r;d=b.g;e=b.b end;self:ShowOutput(math.floor(c),math.floor(d),math.floor(e))end;function ENT:Setup()self:ShowOutput(0,0,0)end;function ENT:ShowOutput(c,d,e)if c!=self.R||d!=self.G||e!=self.B then self.R,self.G,self.B=c,d,e;self:SetColor(Color(c,d,e,255))end end;duplicator.RegisterEntityClass("gmod_wire_pixel",WireLib.MakeWireEnt,"Data")
--addons/!lpakr_out/lua/entities/gmod_wire_speedometer.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_textscreen.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Text Screen"ENT.WireDebugName="Text Screen"function ENT:InitializeShared()self.text=""self.chrPerLine=5;self.textJust=0;self.valign=0;self.tfont="Arial"self.fgcolor=Color(255,255,255)self.bgcolor=Color(0,0,0)end;if CLIENT then local a={}a.__index=a;function MakeTextScreenLayouter()return setmetatable({},a)end;function a:AddString(b)local c,d=surface.GetTextSize(b)local e=self.x+c;if e>self.x2 then return false end;table.insert(self.drawlist,{b,self.x,self.y})self.x=e;self.LineHeight=math.max(d,self.LineHeight)return true end;function a:NextLine()if self.LineHeight==0 then self:AddString(" ")end;local f=self.y+self.LineHeight;if f>self.y2 then return false end;local g=(self.x2-self.x)*self.halign/2;table.insert(self.lines,{g,self.drawlist})self.y=f;self:ResetLine()return true end;function a:ResetLine()self.LineHeight=0;self.x=self.x1;self.drawlist={}end;function a:ResetPage()self:ResetLine()self.y=self.y1;self.lines={}end;function a:layout(h,i,j,k,l,m)self.x1=i;self.y1=j;self.x2=i+k;self.y2=j+l;self.halign=m;self:ResetPage()for n,o in h:gmatch("([^\n]*)(\n*)")do for p,q in n:gmatch("( *)([^ ]*)")do if!self:AddString(p..q)then if!self:NextLine()then return false end;self:AddString(q)end end;for r=1,#o do if!self:NextLine()then return false end end end;if!self:NextLine()then return false end;return true end;function a:DrawText(h,i,j,k,l,m,s)self:layout(h,i,j,k,l,m,s)local t=(self.y2-self.y)*s/2;for u,g,v in ipairs_map(self.lines,unpack)do for u,b,i,j in ipairs_map(v,unpack)do surface.SetTextPos(i+g,j+t)surface.DrawText(b)end end end;function a:GetTextSize(h,k,l)self:layout(h,0,0,k,l,2,0)local w=nil;for u,g,v in ipairs_map(self.lines,unpack)do if!w then w=g else w=math.min(w,g)end end;return w&&self.x2-w||0,self.y end;function ENT:Initialize()self:InitializeShared()self.GPU=WireGPU(self)self.layouter=MakeTextScreenLayouter()self:CreateFont(self.tfont,self.chrPerLine)WireLib.netRegister(self)end;function ENT:OnRemove()self.GPU:Finalize()self.NeedRefresh=true end;function ENT:Draw()self:DrawModel()if self.NeedRefresh then self.NeedRefresh=nil;self.GPU:RenderToGPU(function()local k=1024;local l=1024;surface.SetDrawColor(self.bgcolor.r,self.bgcolor.g,self.bgcolor.b,255)surface.DrawRect(0,0,k,l)surface.SetFont(self.tfont..self.chrPerLine)surface.SetTextColor(self.fgcolor)self.layouter:DrawText(self.text,0,0,k,l,self.textJust,self.valign)end)end;self.GPU:Render()Wire_Render(self)end;function ENT:SetText(h)self.text=h;self.NeedRefresh=true end;function ENT:Receive()if net.ReadBit()!=0 then self.chrPerLine=net.ReadUInt(4)self.textJust=net.ReadUInt(2)self.valign=net.ReadUInt(2)self.fgcolor=Color(net.ReadUInt(8),net.ReadUInt(8),net.ReadUInt(8))self.bgcolor=Color(net.ReadUInt(8),net.ReadUInt(8),net.ReadUInt(8))self.tfont=net.ReadString()self:CreateFont(self.tfont,self.chrPerLine)self.NeedRefresh=true else self:SetText(net.ReadString())end end;local x={}function ENT:CreateFont(y,z)if x[y..z]then return end;local A={font=y,size=760/z,weight=400,antialias=true,additive=false}surface.CreateFont(y..z,A)x[y..z]=true;self.NeedRefresh=true end;return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.doSendText=false;self.doSendConfig=false;self.Inputs=WireLib.CreateSpecialInputs(self,{"String","Font","FGColor","BGColor"},{"STRING","STRING","VECTOR","VECTOR"})self:InitializeShared()end;function ENT:Setup(B,z,C,s,D,E,F)self.fgcolor=E||Color(255,255,255)self.bgcolor=F||Color(0,0,0)self.chrPerLine=math.Clamp(math.ceil(z||10),1,15)self.textJust=C||1;self.valign=s||0;self.tfont=D||"Arial"self:SendConfig()self:TriggerInput("String",B||"")end;function ENT:TriggerInput(G,H)if G=="String"then self.text=string.sub(tostring(H),1,1024)self.doSendText=true elseif G=="Font"then self.tfont=tostring(H)self.doSendConfig=true elseif G=="FGColor"then self.fgcolor=Color(H.x,H.y,H.z)self.doSendConfig=true elseif G=="BGColor"then self.bgcolor=Color(H.x,H.y,H.z)self.doSendConfig=true end end;local function I(h)return h:gsub("<br>","\n")end;function ENT:SendText(J)self.doSendText=false;WireLib.netStart(self)net.WriteBit(false)net.WriteString(I(self.text))WireLib.netEnd(J)end;function ENT:Think()if self.doSendConfig then self:SendConfig()end;if self.doSendText then self:SendText()end end;function ENT:SendConfig(J)self.doSendConfig=false;WireLib.netStart(self)net.WriteBit(true)net.WriteUInt(self.chrPerLine,4)net.WriteUInt(self.textJust,2)net.WriteUInt(self.valign,2)net.WriteUInt(self.fgcolor.r,8)net.WriteUInt(self.fgcolor.g,8)net.WriteUInt(self.fgcolor.b,8)net.WriteUInt(self.bgcolor.r,8)net.WriteUInt(self.bgcolor.g,8)net.WriteUInt(self.bgcolor.b,8)net.WriteString(string.sub(self.tfont,0,31))WireLib.netEnd(J)end;function ENT:Retransmit(J)self:SendText(J)self:SendConfig(J)end;duplicator.RegisterEntityClass("gmod_wire_textscreen",WireLib.MakeWireEnt,"Data","text","chrPerLine","textJust","valign","tfont","fgcolor","bgcolor")
--addons/!lpakr_out/lua/entities/gmod_wire_twoway_radio.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Two-way Radio"ENT.WireDebugName="2W Radio"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=Wire_CreateInputs(self,{"A","B","C","D"})self.Outputs=Wire_CreateOutputs(self,{"A","B","C","D"})self.PairID=nil;self.Other=nil end;function ENT:Setup()self.PrevOutputA=nil;self.PrevOutputB=nil;self.PrevOutputC=nil;self.PrevOutputD=nil;self:ShowOutput("update",1)Wire_TriggerOutput(self,"A",self.Outputs.A.Value||0)Wire_TriggerOutput(self,"B",self.Outputs.B.Value||0)Wire_TriggerOutput(self,"C",self.Outputs.C.Value||0)Wire_TriggerOutput(self,"D",self.Outputs.D.Value||0)end;local a=0;function ENT:GetTwoWayID()a=a+1;return a end;function ENT:TriggerInput(b,c)if self.Other&&self.Other:IsValid()&&self.Other.Inputs then self.Other:ReceiveRadio(b,c)self:ShowOutput("update",1)end end;function ENT:Think()BaseClass.Think(self)if!self.Other||!self.Other:IsValid()then self.Other=nil;self.PairID=nil end end;function IsRadio(d)if IsValid(d)&&d:GetClass()=="gmod_wire_twoway_radio"then return true end;return false end;function ENT:ReceiveRadio(b,c)if b=="A"&&self.Other&&self.Other:IsValid()then Wire_TriggerOutput(self,"A",c)elseif b=="B"&&self.Other&&self.Other:IsValid()then Wire_TriggerOutput(self,"B",c)elseif b=="C"&&self.Other&&self.Other:IsValid()then Wire_TriggerOutput(self,"C",c)elseif b=="D"&&self.Other&&self.Other:IsValid()then Wire_TriggerOutput(self,"D",c)end;self:ShowOutput(b,c)end;function ENT:RadioLink(e,f)self.Other=e;self.PairID=f;self.PeerID=f;self:TriggerInput("A",self.Inputs.A.Value||0)self:TriggerInput("B",self.Inputs.B.Value||0)self:TriggerInput("C",self.Inputs.C.Value||0)self:TriggerInput("D",self.Inputs.D.Value||0)self:ShowOutput("update",1)end;function ENT:LinkEnt(e)if!IsRadio(e)then return false,"Must link to another Two-Way Radio"end;if e==self then return false,"Cannot link Two-Way Radio to itself"end;if self.Other then if self.Other==e then return false end;self.Other.UnlinkEnt()end;local f=self:GetTwoWayID()self:RadioLink(e,f)e:RadioLink(self,f)WireLib.AddNotify(self:GetPlayer(),"The Radios are now paired. Pair ID is "..tostring(f)..".",NOTIFY_GENERIC,7)WireLib.SendMarks(self,{e})return true end;function ENT:UnlinkEnt()if!IsRadio(self)then return false end;if!IsRadio(self.Other)then return false end;self.Other:RadioLink(nil,nil)WireLib.SendMarks(self.Other,{})self:RadioLink(nil,nil)WireLib.SendMarks(self,{})return true end;function ENT:ShowOutput(b,c)local g;if b=="A"then if c!=self.PrevOutputA then self.PrevOutputA=c||0;g=1 end elseif b=="B"then if c!=self.PrevOutputB then self.PrevOutputB=c||0;g=1 end elseif b=="C"then if c!=self.PrevOutputC then self.PrevOutputC=c||0;g=1 end elseif b=="D"then if c!=self.PrevOutputD then self.PrevOutputD=c||0;g=1 end elseif b=="update"then g=1 end;if g then if self.PairID==nil then self:SetOverlayText("(Not Paired) Transmit: 0, 0, 0, 0")else self:SetOverlayText("(Pair ID: "..self.PairID..")\nTransmit A: "..(self.Inputs.A.Value||0).." B: "..(self.Inputs.B.Value||0).." C: "..(self.Inputs.C.Value||0).." D: "..(self.Inputs.D.Value||0).."\nReceive A: "..(self.Outputs.A.Value||0).." B: "..(self.Outputs.B.Value||0).." C: "..(self.Outputs.C.Value||0).." D: "..(self.Outputs.D.Value||0))end end end;function ENT:OnRestore()BaseClass.OnRestore(self)Wire_AdjustInputs(self,{"A","B","C","D"})Wire_AdjustOutputs(self,{"A","B","C","D"})end;function ENT:BuildDupeInfo()local h=BaseClass.BuildDupeInfo(self)||{}if self.Other&&self.Other:IsValid()then h.Other=self.Other:EntIndex()end;return h end;function ENT:ApplyDupeInfo(i,j,h,k)BaseClass.ApplyDupeInfo(self,i,j,h,k)local e=k(h.Other)if IsValid(e)then local f=e.PairID||self:GetTwoWayID()self:RadioLink(e,f)end end;duplicator.RegisterEntityClass("gmod_wire_twoway_radio",WireLib.MakeWireEnt,"Data")
--addons/ssrp_lfs/lua/entities/lvs_atrt/cl_init.lua:
include("shared.lua")
include( "cl_camera.lua" )
include( "cl_prediction.lua" )

function ENT:DamageFX()
	self.nextDFX = self.nextDFX or 0

	if self.nextDFX < CurTime() then
	self.nextDFX = CurTime() + 0.05

	if self:GetIsRagdoll() then
		if math.random(0,45) < 3 then
	 			if math.random(1,2) == 1 then
	 				local Pos = self:LocalToWorld( Vector(0,0,40) + VectorRand() * 50 )
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
		effectdata:SetOrigin( self:LocalToWorld( Vector(0,0,40) ) )
		effectdata:SetEntity( self )
	 	util.Effect( "lvs_engine_blacksmoke", effectdata )

	 	if HP <= MaxHP * 0.25 then
	 		local effectdata = EffectData()
			effectdata:SetOrigin( self:LocalToWorld( Vector(-20,0,40) ) )
			effectdata:SetNormal( self:GetUp() )
			effectdata:SetMagnitude( math.Rand(1,3) )
			effectdata:SetEntity( self )
	 		util.Effect( "lvs_exhaust_fire", effectdata )
	 	end
	end
end

function ENT:OnJump()
	local effectdata = EffectData()
	effectdata:SetOrigin( self:GetPos() )
	util.Effect( "lvs_walker_stomp", effectdata )

	sound.Play( Sound( "lvs/vehicles/atte/stomp"..math.random(1,4).."_light.ogg" ), self:GetPos(), SNDLVL_70dB)
end

function ENT:OnFrame()
	self:DamageFX()
	self:DrawDriver()

	self.jumpPrevFrame = self.jumpPrevFrame or false

	if self:GetIsJumping() and not self.jumpPrevFrame and self:GetProperJump() then
		self:OnJump()
	end

	self.jumpPrevFrame = self:GetIsJumping()
end

local yaw_right = Angle(0,90,0)
function ENT:DrawDriver()
	local pod = self:GetDriverSeat()

	if not IsValid( pod ) then return end

	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and plyL:GetViewEntity() == plyL and not pod:GetThirdPersonMode()) then return end

	local ID = self:LookupAttachment( "driver" )
	local Att = self:GetAttachment( ID )

	if not Att then return end

	local _,Ang = LocalToWorld( self:GetPos(), yaw_right, Att.Pos, Att.Ang )

	local PosL = self:WorldToLocal( Att.Pos + Att.Ang:Right() * 5 - Att.Ang:Up() * 7 )
	pod:SetLocalPos( PosL )

	ply:SetSequence( "drive_airboat" )
	ply:SetRenderAngles( Ang )
	ply:DrawModel()
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

function ENT:LVSHudPaint( X, Y, ply )
	if self:GetIsCarried() then return end

	local Pos2D = self:GetEyeTrace().HitPos:ToScreen()

	local _,_, InRange = self:GetMainAimAngles()

	local Col = InRange and white or red

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

	if self:GetIsCarried() then
		draw.SimpleText( "X" , "LVS_FONT",  hX, hY, Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	else
		local Throttle = Vel / 150
		self:LVSDrawCircle( hX, hY, H * 0.35, math.min( Throttle, 1 ) )
	end
end

--addons/ssrp_lfs/lua/entities/lvs_base_fighterplane/cl_hud.lua:
ENT.IconEngine = Material( "lvs/engine.png" )

local black = Color(0,0,0,255)

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


--addons/ssrp_lfs/lua/entities/lvs_base_turret/cl_init.lua:
include("shared.lua")
include("cl_camera.lua")
include("sh_camera_eyetrace.lua")
include("cl_hud.lua")
include("cl_deathsound.lua")

DEFINE_BASECLASS( "lvs_base" )

function ENT:Think()
	BaseClass.Think( self )

	self.EFxScale = self.EFxScale and (self.EFxScale - self.EFxScale * RealFrameTime()) or 0

	self:CalcOnThrottle()
end

function ENT:CalcOnThrottle()--[[
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
	end]]
end

function ENT:StartBoost()--[[
	local T = CurTime()

	if (self._NextSND or 0) > T then return end

	self._NextSND = T + 1

	self.EFxScale = 100

	self:OnStartBoost()]]
end

function ENT:StopBoost()--[[
	local T = CurTime()

	if (self._NextSND or 0) > T then return end

	self._NextSND = T + 1

	self:OnStopBoost()]]
end

function ENT:GetBoost()
	--return (self.EFxScale or 0)
end

function ENT:OnStartBoost()
end

function ENT:OnStopBoost()
end
--addons/ssrp_lfs/lua/entities/lvs_base_turret/cl_deathsound.lua:

function ENT:OnDestroyed()
	if not self.DeathSound then return end

	if self:GetVelocity():Length() <= self.MaxVelocity * 0.5 then return end

	self._sndDeath = CreateSound( self, self.DeathSound )
	self._sndDeath:SetSoundLevel( 125 )
	self._sndDeath:PlayEx( 1, 50 + 50 * self:CalcDoppler( LocalPlayer() ) )
end

function ENT:StopDeathSound()
	if not self._sndDeath then return end

	self._sndDeath:Stop()
end


--addons/ssrp_lfs/lua/entities/lvs_escapepod/shared.lua:
ENT.Base = "lvs_base_starfighter"

ENT.PrintName = "Escape Pod"
ENT.Author = "Ace"
ENT.Information = ""
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable = true
ENT.AdminSpawnable = false

ENT.MDL = "models/ace/sw/rh/escapepod.mdl"
ENT.GibModels = {
	"models/ace/sw/rh/escapepod.mdl"
}

ENT.AITEAM = 2
ENT.Mass = 1000

ENT.MaxVelocity = 3000
ENT.MaxThrust = 28000

ENT.ThrustVtol = 55
ENT.ThrustRateVtol = 3

ENT.TurnRatePitch = 1
ENT.TurnRateYaw = 3
ENT.TurnRateRoll = 1

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 2

ENT.MaxHealth = 600
ENT.MaxShield = 500

local blueLight = Vector(100, 100, 255)

function ENT:InitWeapons()
end

ENT.FlyByAdvance = 0.5
ENT.FlyBySound = "lvs/vehicles/arc170/flyby.wav"
ENT.DeathSound = "lvs/vehicles/generic_starfighter/crash.wav"

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/arc170/loop.wav",
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
--addons/ssrp_lfs/lua/entities/lvs_fighterplane_exhaust.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.Spawnable       = false
ENT.AdminSpawnable  = false
ENT.DoNotDuplicate = true

ENT.RenderGroup = RENDERGROUP_BOTH

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

function ENT:Initialize()
end

function ENT:Think()
end

ENT.ExhaustSprite = Material( "effects/muzzleflash2" )

function ENT:Draw()
end

function ENT:DrawTranslucent()
	local vehicle = self:GetBase()

	if not IsValid( vehicle ) or not vehicle:GetEngineActive() then return end

	local Throttle = vehicle:GetThrottle()

	self.PosOffset = (self.PosOffset or 0) + RealFrameTime() * (8 + 4 * Throttle)

	local T = CurTime()

	if (self.NextFX or 0) < T then
		self.NextFX = T + 0.05 + (1 - Throttle) / 10

		if math.random(0,1) == 1 then
			self.PosOffset = 0

			local HP = vehicle:GetHP()
			local MaxHP = vehicle:GetMaxHP()

			if HP <= 0 then return end

			if HP > MaxHP * 0.25 then
				local effectdata = EffectData()
					effectdata:SetOrigin( self:GetPos() )
					effectdata:SetNormal( self:GetUp() )
					effectdata:SetMagnitude( Throttle )
					effectdata:SetEntity( vehicle )
				util.Effect( "lvs_exhaust", effectdata )
			else
				local effectdata = EffectData()
					effectdata:SetOrigin( self:GetPos() )
					effectdata:SetNormal( self:GetUp() )
					effectdata:SetMagnitude( Throttle )
					effectdata:SetEntity( vehicle )
				util.Effect( "lvs_exhaust_fire", effectdata )
			end
		end
	end

	if self.PosOffset > 1 or Throttle < 0.5 then return end

	local Dir = self:GetUp() * self.PosOffset
	local Pos = self:GetPos() + Dir * (5 + 5 * Throttle)

	local Size = math.min( 10 * (1 - self.PosOffset ) ^ 2, 5 + 5 * Throttle )

	render.SetMaterial( self.ExhaustSprite )
	render.DrawSprite( Pos, Size, Size, color_white )
end

--addons/ssrp_lfs/lua/entities/lvs_protontorpedo.lua:
AddCSLuaFile()

ENT.Base = "lvs_missile"

ENT.Type            = "anim"

ENT.PrintName = "Proton Torpedo"
ENT.Author = "Luna"
ENT.Information = "geht ab wie'n z�pfchen"
ENT.Category = "[LVS]"

ENT.Spawnable		= true
ENT.AdminOnly		= false

ENT.ExplosionEffect = "lvs_proton_explosion"
ENT.GlowColor = Color( 0, 127, 255, 255 )

if SERVER then
	function ENT:GetDamage() return
		(self._dmg or 500)
	end

	function ENT:GetRadius()
		return (self._radius or 150)
	end

	return
end

ENT.GlowMat = Material( "sprites/light_glow02_add" )

function ENT:Enable()
	if self.IsEnabled then return end

	self.IsEnabled = true

	self.snd = CreateSound(self, "npc/combine_gunship/gunship_crashing1.wav")
	self.snd:SetSoundLevel( 80 )
	self.snd:Play()

	local effectdata = EffectData()
		effectdata:SetOrigin( self:GetPos() )
		effectdata:SetEntity( self )
	util.Effect( "lvs_proton_trail", effectdata )
end

function ENT:Draw()
	if not self:GetActive() then return end

	self:DrawModel()

	render.SetMaterial( self.GlowMat )

	local pos = self:GetPos()
	local dir = self:GetForward()

	for i = 0, 30 do
		local Size = ((30 - i) / 30) ^ 2 * 128

		render.DrawSprite( pos - dir * i * 7, Size, Size, self.GlowColor )
	end
end
--addons/ssrp_lfs/lua/entities/lvs_repulsorlift_engine.lua:
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

--addons/ssrp_lfs/lua/entities/lvs_repulsorlift_gunship/sh_mainweapons.lua:
function ENT:InitWeaponDriver()
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
	weapon.Icon = Material("lvs/weapons/protontorpedo.png")
	weapon.Ammo = 26
	weapon.Delay = 0 -- this will turn weapon.Attack to a somewhat think function
	weapon.HeatRateUp = -0.5 -- cool down when attack key is held. This system fires on key-release.
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		local T = CurTime()

		if IsValid( ent._ProtonTorpedo ) then
			if (ent._nextMissleTracking or 0) > T then return end

			ent._nextMissleTracking = T + 0.1 -- 0.1 second interval because those find functions can be expensive

			ent._ProtonTorpedo:FindTarget( ent:GetPos(), ent:GetForward(), 30, 7500 )

			if IsValid( ent._ProtonTorpedo:GetTarget() ) then
				ent:SetBodygroup( 1, 1 )
			end

			return
		end

		local T = CurTime()

		if (ent._nextMissle or 0) > T then return end

		ent._nextMissle = T + 0.5

		ent._swapMissile = not ent._swapMissile

		local TypeA = self:GetBodygroup( 3 ) == 0
		local Pos = Vector( (TypeA and -20 or 206.07), (ent._swapMissile and -59 or 59), 286.88 )

		local Driver = self:GetDriver()

		local projectile = ents.Create( TypeA and "lvs_protontorpedo" or "lvs_concussionmissile" )
		projectile:SetPos( ent:LocalToWorld( Pos ) )
		projectile:SetAngles( ent:GetAngles() )
		projectile:SetParent( ent )
		projectile:Spawn()
		projectile:Activate()
		projectile:SetAttacker( IsValid( Driver ) and Driver or self )
		projectile:SetEntityFilter( ent:GetCrosshairFilterEnts() )
		projectile:SetSpeed( ent:GetVelocity():Length() + 4000 )

		ent._ProtonTorpedo = projectile
		ent._TypeA = TypeA

		ent:SetNextAttack( CurTime() + 0.1 ) -- wait 0.1 second before starting to track
	end
	weapon.FinishAttack = function( ent )
		ent:SetBodygroup( 1, 0 )

		if not IsValid( ent._ProtonTorpedo ) then return end

		local projectile = ent._ProtonTorpedo

		projectile:Enable()
		projectile:EmitSound( self._TypeA and "lvs/vehicles/naboo_n1_starfighter/proton_fire.mp3" or "lvs/vehicles/vulturedroid/fire_missile.mp3", 125 )
		ent:TakeAmmo()

		ent._ProtonTorpedo = nil

		local NewHeat = ent:GetHeat() + 0.33

		ent:SetHeat( NewHeat )
		if NewHeat >= 1 then
			ent:SetOverheated( true )
		end
	end
	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )



	local weapon = {}
	weapon.Icon = Material("lvs/weapons/gunship_sidedoor.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.StartAttack = function( ent )
		local T = CurTime()

		if (ent.NextDoor or 0) > T then return end

		if ent:GetBodygroup( 2 ) == 0 then
			local DoorMode = ent:GetDoorMode() + 1

			ent:SetDoorMode( DoorMode )
			
			if DoorMode == 1 then
				ent:EmitSound( "lvs/vehicles/laat/door_open.wav" )
			end
			
			if DoorMode == 2 then
				ent.NextDoor = T + 1

				ent:PlayAnimation( "doors_open" )
				ent:EmitSound( "lvs/vehicles/laat/door_large_open.wav" )
			end
			
			if DoorMode == 3 then
				ent:PlayAnimation( "doors_close" )
				ent:EmitSound( "lvs/vehicles/laat/door_large_close.wav" )
			end
			
			if DoorMode >= 4 then
				ent:SetDoorMode( 0 )
				ent:EmitSound( "lvs/vehicles/laat/door_close.wav" )

				ent.NextDoor = T + 1
			end
		else
			ent.NextDoor = T + 1

			local DoorMode = ent:GetDoorMode() + 1

			ent:SetDoorMode( DoorMode )

			if DoorMode == 1 then
				ent:PlayAnimation( "doors_open" )
				ent:EmitSound( "lvs/vehicles/laat/door_large_open.wav" )
			end
			
			if DoorMode >= 2 then
				ent:PlayAnimation( "doors_close" )
				ent:EmitSound( "lvs/vehicles/laat/door_large_close.wav" )
				ent:SetDoorMode( 0 )
			end
		end

		ent:OnDoorsChanged()
	end
	self:AddWeapon( weapon )


	local weapon = {}
	weapon.Icon = Material("lvs/weapons/gunship_reardoor.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.StartAttack = function( ent )
		local T = CurTime()

		if (ent.NextDoor or 0) > T then return end

		ent.NextDoor = T + 1

		local ToggleHatch = not ent:GetRearHatch()

		ent:SetRearHatch( ToggleHatch )
		
		if ToggleHatch then
			ent:EmitSound( "lvs/vehicles/laat/door_open.wav" )
		else
			ent:EmitSound( "lvs/vehicles/laat/door_close.wav" )
		end

		ent:OnDoorsChanged()
	end
	self:AddWeapon( weapon )
end
--addons/ssrp_lfs/lua/entities/lvs_repulsorlift_gunship/cl_prediction.lua:

function ENT:PredictBTL()
	local pod = self:GetBTPodL()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if ply ~= plyL then return end

	self:SetPosBTL()
	self:SetPoseParameterBTL( pod:lvsGetWeapon() )
end

function ENT:PredictBTR()
	local pod = self:GetBTPodR()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if ply ~= plyL then return end

	self:SetPosBTR()
	self:SetPoseParameterBTR( pod:lvsGetWeapon() )
end

function ENT:PredictPoseParamaters()
	self:PredictBTL()
	self:PredictBTR()

	self:InvalidateBoneCache()
end
--addons/ssrp_lfs/lua/entities/lvs_starfighter_awing/cl_init.lua:
include("shared.lua")

ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EngineFXColor = Color( 255, 240, 150)
ENT.EngineFxPos = {
	Vector(-110,-50,0),
	Vector(-110,50,0),
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

--addons/ssrp_lfs/lua/entities/lvs_starfighter_droidtrifighter/cl_init.lua:
include("shared.lua")
local red = Color( 255, 0, 0, 255)
local orange = Color( 255, 100, 0, 255)

ENT.EngineFXPos = {
	Vector(-104.75,0,31.59),
	Vector(-104.75,-27.74,-15.54),
	Vector(-104.75,27.74,-15.54),
}

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-120,0,31.59), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-120,-27.74,-15.54), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-120,27.74,-15.54), 0, 20, 2, 1000, 150 )
end

function ENT:OnFrame()
	self:EngineEffects()
end

ENT.EngineGlow = Material( "sprites/light_glow02_add" )

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 80 + self:GetThrottle() * 40 + self:GetBoost() * 0.8

	render.SetMaterial( self.EngineGlow )
	render.DrawSprite( self:LocalToWorld( Vector(-120,0,31.59) ), Size, Size, orange )
	render.DrawSprite( self:LocalToWorld( Vector(-120,-27.74,-15.54) ), Size, Size, orange )
	render.DrawSprite( self:LocalToWorld( Vector(-120,27.74,-15.54) ), Size, Size, orange )

	render.DrawSprite( self:LocalToWorld( Vector(79,16.99,9.81) ), 16, 16, red )
	render.DrawSprite( self:LocalToWorld( Vector(84,13.55,8.05) ), 12, 12, red )

	render.DrawSprite( self:LocalToWorld( Vector(79,-16.99,9.81) ), 16, 16, red )
	render.DrawSprite( self:LocalToWorld( Vector(84,-13.55,8.05) ), 12, 12, red )
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

		particle:SetColor( 255, 100, 200 )
	end
end

function ENT:OnStartBoost()
	self:EmitSound( "lvs/vehicles/vulturedroid/boost.wav", 85 )
end

function ENT:OnStopBoost()
	self:EmitSound( "lvs/vehicles/vulturedroid/brake.wav", 85 )
end

--addons/ssrp_lfs/lua/entities/lvs_starfighter_n1/cl_init.lua:
include("shared.lua")
local blue = Color( 0, 127, 255, 255)
local vectorOffset = Vector(20, 143.87, 30.93)
local cockpitBonePosition = Vector(0, 0, 0)

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-95,143.87,30.93), 0, 20, 2, 2500, 150 )
	self:RegisterTrail( Vector(-95,-143.87,30.93), 0, 20, 2, 2500, 150 )
end

function ENT:OnFrame()
	self:EngineEffects()
	self:AnimAstromech()
	self:AnimCockpit()
end

ENT.EngineGlow = Material( "sprites/light_glow02_add" )

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 80 + self:GetThrottle() * 120 + self:GetBoost()

	render.SetMaterial( self.EngineGlow )

	for i = -1,1,2 do
		vectorOffset.y = 143.87 * i

		local pos = self:LocalToWorld( vectorOffset )
		render.DrawSprite( pos, Size, Size, blue )
	end
end

function ENT:EngineEffects()
	if not self:GetEngineActive() then return end

	local T = CurTime()

	if (self.nextEFX or 0) > T then return end

	self.nextEFX = T + 0.01

	local THR = self:GetThrottle()

	local emitter = self:GetParticleEmitter( self:GetPos() )

	if not IsValid( emitter ) then return end

	for i = -1,1,2 do
		vectorOffset.y = 143.87 * i

		local vOffset = self:LocalToWorld( vectorOffset )
		local vNormal = -self:GetForward()

		vOffset = vOffset + vNormal * 5

		local particle = emitter:Add( "effects/select_ring", vOffset )

		if not particle then continue end

		particle:SetVelocity( vNormal * (1000 + self:GetBoost() * 10) + self:GetVelocity() )
		particle:SetLifeTime( 0 )
		particle:SetDieTime( 0.05 )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( 20 )
		particle:SetEndSize( 20 )
		particle:SetAngles( vNormal:Angle() )
		particle:SetColor( math.Rand( 10, 100 ), math.Rand( 100, 220 ), math.Rand( 240, 255 ) )
	end
end

function ENT:AnimAstromech()
	local T = CurTime()

	if (self.nextAstro or 0) < T then
		self.nextAstro = T + math.Rand(0.5,2)
		self.AstroAng = math.Rand(-180,180)

		local HasShield = self:GetShield() > 0

		if self.OldShield == true and not HasShield then
			self:EmitSound( "lvs/vehicles/naboo_n1_starfighter/astromech/shieldsdown"..math.random(1,2)..".ogg", 100 )
		else
			if math.random(0,4) == 3 then
				self:EmitSound( "lvs/vehicles/naboo_n1_starfighter/astromech/"..math.random(1,11)..".ogg", 70 )
			end
		end

		self.OldShield = HasShield
	end

	self.smastro = self.smastro and (self.smastro + ((self.AstroAng or 0) - self.smastro) * RealFrameTime() * 10) or 0

	self:ManipulateBoneAngles( 2, Angle(self.smastro,0,0) )
end

function ENT:AnimCockpit()
	local bOn = self:GetActive()
	local TVal = bOn and 0 or 1
	local Speed = FrameTime() * 4

	self.SMcOpen = self.SMcOpen and self.SMcOpen + math.Clamp(TVal - self.SMcOpen,-Speed,Speed) or 0

	cockpitBonePosition.z = self.SMcOpen * 50
	self:ManipulateBonePosition( 1, cockpitBonePosition )
end

function ENT:OnStartBoost()
	self:EmitSound( "lvs/vehicles/naboo_n1_starfighter/boost.wav", 85 )
end

function ENT:OnStopBoost()
	self:EmitSound( "lvs/vehicles/naboo_n1_starfighter/brake.wav", 85 )
end

--addons/ssrp_lfs/lua/entities/lvs_starfighter_stap/shared.lua:
-- If there's any bugs feel free to fix them, credit would be nice, but if not it's all gucci :D
ENT.Base = "lvs_base_starfighter"

ENT.PrintName = "STAP"
ENT.Author = "Wolf"
ENT.Information = "CIS STAP Speeder"
ENT.Category = "[LVS] - Wolf"

ENT.Spawnable = true
ENT.AdminSpawnable = false

ENT.MDL = "models/ace/comm/tessa/droid_stap.mdl"

ENT.AITEAM = 2

ENT.MaxVelocity = 1500
ENT.MaxThrust = 650

ENT.ThrustVtol = 55
ENT.ThrustRateVtol = 3

ENT.TurnRatePitch = 2
ENT.TurnRateYaw = 2
ENT.TurnRateRoll = 1

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.MaxHealth = 250
ENT.MaxShield = 100

ENT.SpawnNormalOffset = 50

function ENT:InitWeapons()
	
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/dual_mg.png")
	weapon.Ammo = 350
	weapon.Delay = 0.15
	weapon.HeatRateUp = 0.5
	weapon.HeatRateDown = 1
	weapon.Attack = function( ent )
		local bullet = {}
		bullet.Dir 	= ent:GetForward()
		bullet.Spread 	= Vector( 0.015,  0.015, 0 )
		bullet.TracerName = "lvs_laser_red"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 35
		bullet.Velocity = 60000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(255,50,50) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_explosion", effectdata )
		end

		for i = -1,1,2 do
			bullet.Src 	= ent:LocalToWorld( Vector(80, 15.2 * i,23.5) )

			local effectdata = EffectData()
			effectdata:SetStart( Vector(255,50,50) )
			effectdata:SetOrigin( bullet.Src )
			effectdata:SetNormal( ent:GetForward() )
			effectdata:SetEntity( ent )
			util.Effect( "lvs_muzzle_colorable", effectdata )

			ent:LVSFireBullet( bullet )
		end

		ent:TakeAmmo()

		ent.PrimarySND:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )
	
	self:AddWeapon( LVS:GetWeaponPreset( "TURBO" ) )
end

ENT.FlyByAdvance = 0.75
ENT.FlyBySound = "lvs/vehicles/naboo_n1_starfighter/flyby.wav" 
ENT.DeathSound = "lvs/vehicles/generic_starfighter/crash.wav"

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/vulturedroid/loop.wav",
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
--addons/ssrp_lfs/lua/entities/lvs_starfighter_vwing/shared.lua:

ENT.Base = "lvs_base_starfighter"

ENT.PrintName = "V-Wing"
ENT.Author = "Luna"
ENT.Information = "Starfighter of the Galactic Republic"
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/blu/vwing.mdl"
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
ENT.MaxThrust = 2150

ENT.ThrustVtol = 55
ENT.ThrustRateVtol = 3

ENT.TurnRatePitch = 1
ENT.TurnRateYaw = 1
ENT.TurnRateRoll = 1

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.MaxHealth = 1000
ENT.MaxShield = 300

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "Foils" )
end

function ENT:InitWeapons()
	self.FirePositions = {
		Vector(3.97,-56.3,53.79),
		Vector(4.01,56.39,46.96),
		Vector(4.01,-56.39,46.96),
		Vector(3.97,56.3,53.79),
	}

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/mg.png")
	weapon.Ammo = 3000
	weapon.Delay = 0.07
	weapon.HeatRateUp = 0.25
	weapon.HeatRateDown = 1
	weapon.Attack = function( ent )
		ent.NumPrim = ent.NumPrim and ent.NumPrim + 1 or 1
		if ent.NumPrim > #ent.FirePositions then ent.NumPrim = 1 end

		if not ent:GetFoils() then
			ent:SetHeat( ent:GetHeat() + 0.1 )
		end

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

		local CurPos = ent.FirePositions[ent.NumPrim]

		local bullet = {}
		bullet.Src 	= ent:LocalToWorld( CurPos )
		bullet.Dir 	= (trace.HitPos - bullet.Src):GetNormalized()
		bullet.Spread 	= Vector( 0.025,  0.025, 0 )
		bullet.TracerName = "lvs_laser_green"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 25
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

		local effectdata = EffectData()
		effectdata:SetStart( Vector(50,255,50) )
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( ent:GetForward() )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle_colorable", effectdata )

		ent:TakeAmmo()

		if CurPos.y > 0 then
			ent.SNDLeft:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
		else
			ent.SNDRight:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
		end
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("physics/metal/weapon_impact_soft3.wav")

		if ent.SetFoils then ent:SetFoils( true ) end
	end
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

		local Pos = Vector( 6, (ent._swapMissile and -57 or 57), 50.5 )

		local Driver = self:GetDriver()

		local projectile = ents.Create( "lvs_concussionmissile" )
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
		projectile:EmitSound( "lvs/vehicles/vulturedroid/fire_missile.mp3", 125 )
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

ENT.FlyByAdvance = 0.5
ENT.FlyBySound = "lvs/vehicles/vwing/flyby.wav"
ENT.DeathSound = "lvs/vehicles/generic_starfighter/crash.wav"

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/vwing/loop.wav",
		sound_int = "lvs/vehicles/vwing/loop_interior.wav",
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
--addons/ssrp_lfs/lua/entities/lvs_turret_aa_red/shared.lua:
ENT.Base = "lvs_base_turret"

ENT.PrintName = "Anti-Air Turret Red"
ENT.Author = "Luna"
ENT.Information = "It shoots lasers into the sky and makes things go boom"
ENT.Category = "[LVS] - Turrets (CIS)"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/antiairturret/rep_anti-airturret.mdl"

ENT.AITEAM = 2

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
	local ID = self:LookupAttachment( "muzzle1" )
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

    return not (AimAngles.p >= -10 or AimAngles.p <= -180)
end

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Delay = 0.25
	weapon.HeatRateUp = .34
	weapon.HeatRateDown = .5
	weapon.Attack = function( ent )
        if not ent:GetVehicle():WeaponsInRange( ent ) then return true end
		local base = ent:GetVehicle()

		local ID_1 = self:LookupAttachment( "muzzle1" )
		local ID_2 = self:LookupAttachment( "muzzle2" )
		local Muzzle1 = self:GetAttachment( ID_1 )
		local Muzzle2 = self:GetAttachment( ID_2 )

		if not Muzzle1 or not Muzzle2 then return end		

		ent.MirrorPrimary = not ent.MirrorPrimary

		local Pos = ent.MirrorPrimary and Muzzle1.Pos or Muzzle2.Pos
		local Dir =  (ent.MirrorPrimary and Muzzle1.Ang or Muzzle2.Ang):Up()

		local bullet = {}
		bullet.Src 	= Pos
		bullet.Dir 	= Dir
		bullet.Spread 	= Vector( 0.025,  0.025, 0.025 )
		bullet.TracerName = "lvs_laser_red"
		bullet.Force	= 100
		bullet.HullSize 	= 50
		bullet.Damage	= 35
		bullet.Velocity = 50000
		bullet.SplashDamage	= 70
		bullet.SplashDamageRadius	= 250
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
	
	
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/dual_mg.png")
	weapon.Delay = 0.1
	weapon.HeatRateUp = .2
	weapon.HeatRateDown = .5
	weapon.Attack = function( ent )
        if not ent:GetVehicle():WeaponsInRange( ent ) then return true end
		local pod = ent:GetDriverSeat()
		local dir = ent:GetAimVector()
		local trace = ent:GetEyeTrace()
		local base = ent:GetVehicle()

		local ID_1 = self:LookupAttachment( "muzzle1" )
		local ID_2 = self:LookupAttachment( "muzzle2" )
		local Muzzle1 = self:GetAttachment( ID_1 )
		local Muzzle2 = self:GetAttachment( ID_2 )

		if not Muzzle1 or not Muzzle2 then return end

		ent.MirrorPrimary = not ent.MirrorPrimary

		local Pos = ent.MirrorPrimary and Muzzle1.Pos or Muzzle2.Pos
		local Dir =  (ent.MirrorPrimary and Muzzle1.Ang or Muzzle2.Ang):Up()

		ent.SwapTopBottom = not ent.SwapTopBottom

		base.SecondarySND:PlayOnce( 100 + math.Rand(-3,3), 1 )

		local bullet = {}
		bullet.Src = Pos
		bullet.Dir = Dir
		bullet.Spread 	= Vector( 0.07,  0.07, 0.07 )
		bullet.TracerName = "lvs_laser_red"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 20
		bullet.Velocity = 50000
		--bullet.SplashDamage	= 20
		--bullet.SplashDamageRadius	= 200
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
		effectdata:SetNormal( Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle_colorable", effectdata )
		
		ent:LVSFireBullet( bullet )
	end
	
	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav")end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
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
--addons/ssrp_lfs/lua/entities/lvs_turret_av/cl_init.lua:
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

--addons/ssrp_lfs/lua/entities/lvs_v19/cl_init.lua:
include("shared.lua")

function ENT:OnSpawn()
end

ENT.EngineColor = Color( 129, 228, 218, 255)
ENT.EngineGlow = Material("sprites/light_glow02_add")
ENT.EnginePos = {
		Vector(-215,-122.3,8.38),
		Vector(-215,122.3,8.38),
		Vector(-25.93,0,225.85),
	}

function ENT:OnFrame()
	self:EngineEffects()
	self:AnimWings()
end

function ENT:OnWingsChanged()
	if not self:GetWingsDown() then
		self.EnginePos = {
			Vector(-215,-122.3,8.38),
			Vector(-215,122.3,8.38),
		}
		local function EngineTimer()
			self.EnginePos = {
			Vector(-140,0,-207.25),
			Vector(-215.42,-122.3,8.38),
			Vector(-215.42,122.3,8.38),
			}
		end
		timer.Simple(0.5, EngineTimer)
		
	else
		self.EnginePos = {
			Vector(-215,-122.3,8.38),
			Vector(-215,122.3,8.38),
		}
		local function EngineTimer()
			self.EnginePos = {
			Vector(-25.93,0,225.85),
			Vector(-215.42,-122.3,8.38),
			Vector(-215.42,122.3,8.38),
			}
		end
		timer.Simple(0.5, EngineTimer)
	end
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
		particle:SetStartSize( math.Rand(25,35) )
		particle:SetEndSize( math.Rand(0,10) )
		particle:SetRoll( math.Rand(-1,1) * 100 )
		particle:SetColor( 129, 228, 218 )
	end
end

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 80 + self:GetThrottle() * 120 + self:GetBoost() * 2

	render.SetMaterial( self.EngineGlow )

	for _, pos in pairs( self.EnginePos ) do
		render.DrawSprite(  self:LocalToWorld( pos ), Size, Size, self.EngineColor )
	end

end

function ENT:AnimCockpit()
end

function ENT:OnStartBoost()
	self:EmitSound( "ARC170_BOOST", 70 )
end

function ENT:OnStopBoost()
	self:EmitSound( "ARC170_BRAKE", 70 )
end

function ENT:AnimWings()

	self._sm_wing = self._sm_wing or 1
	
	local RFT = RealFrameTime() * 10
	
	local target_wing = self:GetWingsDown() and 0 or 1

	local Rate = RFT * 0.2

	self._sm_wing = self._sm_wing + math.Clamp(target_wing - self._sm_wing,-Rate,Rate)

	local DoneMoving = self._sm_wing == 1 or self._sm_wing == 0

	local Ang = (1 - self._sm_wing) * 180

	local A5 = Ang
	local A6 = Ang
    local A7 = -Ang

	self:ManipulateBoneAngles( 2, Angle(0,0,A5*0.7) )
	self:ManipulateBoneAngles( 1, Angle(0,0,A7*0.7) )
	self:ManipulateBoneAngles( 3, Angle(0,A6,0) )

	self:InvalidateBoneCache()
end

--addons/ssrp_lfs/lua/entities/lvs_walker_atte_hoverscript/cl_init.lua:
include("shared.lua")

--addons/!lpakr_out/lua/dash/thirdparty/medialib.service.volume3d.lua:
dash.IncludeSH'dash/thirdparty/medialib.core/ext/volume3d.lua'
--addons/!lpakr_out/lua/entities/nbot_policedroid.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='Police Droid'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/player/valley/policedroid/h_npc_policedroid.mdl'ENT.Models={'models/player/valley/policedroid.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/nbot_sw_snow_droid_b1.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/nbot_sw_snow_droid_b2.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='B2 Snow Droid'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/tfa/comm/gg/npc_sw_snow_droid_b2.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_snow_droid_b2.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/nbot_sw_training_droid_commando.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_marsh_rancor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_nerf.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Nerf"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/nerf.mdl"}ENT.Skins={0}ENT.ModelScale=1;ENT.CollisionBounds=Vector(72,72,72)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=500;ENT.HealthRegen=0;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;ENT.OnSpawnSounds={"fallenlogic/bantha/bantha_spawn.wav"}ENT.OnIdleSounds={}ENT.IdleSoundDelay=2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={}ENT.OnDownedSounds={}ENT.Footsteps={}ENT.Omniscient=false;ENT.SpotDuration=30;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=50;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.Frightening=false;ENT.AllyDamageTolerance=0.33;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.33;ENT.Acceleration=800;ENT.Deceleration=800;ENT.JumpHeight=50;ENT.StepHeight=10;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;ENT.WalkAnimation=ACT_WALK;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_RUN;ENT.RunAnimRate=1;ENT.IdleAnimation=ACT_IDLE;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_JUMP;ENT.JumpAnimRate=1;ENT.UseWalkframes=false;ENT.WalkSpeed=50;ENT.RunSpeed=70;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=60;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(0,0,0)ENT.EyeBone="Head"ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.UseWeapons=false;ENT.Weapons={}ENT.WeaponAccuracy=1;ENT.WeaponAttachment=""ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=true;ENT.PossessionEnabled=true;ENT.PossessionCrosshair=true;ENT.PossessionViews={{offset=Vector(-200,0,150),distance=0},{offset=Vector(45,0,0),distance=-325,eyepos=true}}ENT.PossessionBinds={}if SERVER then else function ENT:CustomInitialize()end;function ENT:CustomThink()end;function ENT:CustomDraw()end end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_vardosian_acklay.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Vardosian Acklay"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/acklay_a01.mdl"}ENT.Skins={1}ENT.ModelScale=2;ENT.BloodColor=BLOOD_COLOR_RED;ENT.OnDamageSounds={}ENT.OnDeathSounds={"fallenlogic/acklay/screech01.mp3"}ENT.SpawnHealth=1500;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=120;ENT.ReachEnemyRange=100;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.UseWalkframes=false;ENT.WalkAnimation=ACT_WALK;ENT.RunAnimation=ACT_RUN;ENT.IdleAnimation=ACT_IDLE;ENT.WalkSpeed=30;ENT.RunSpeed=125;ENT.EyeBone="EyelidTop"AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/particlecontroller_normal.lua:
AddCSLuaFile()ENT.Base="base_gmodentity"ENT.PrintName="Particle Controller - Normal"ENT.Author=""ENT.Spawnable=false;ENT.AdminSpawnable=false;ENT.RenderGroup=RENDERGROUP_NONE;function ENT:SetupDataTables()self:NetworkVar("Entity",0,"TargetEnt")self:NetworkVar("Entity",1,"TargetEnt2")self:NetworkVar("String",0,"EffectName")self:NetworkVar("String",1,"NumpadState")self:NetworkVar("Float",0,"RepeatRate")self:NetworkVar("Int",0,"AttachNum")self:NetworkVar("Int",1,"AttachNum2")self:NetworkVar("Int",2,"NumpadKey")self:NetworkVar("Bool",0,"Active")self:NetworkVar("Bool",1,"RepeatSafety")self:NetworkVar("Bool",2,"Toggle")self:NetworkVar("Vector",0,"UtilEffectInfo")end;function ENT:Initialize()local a=self:GetTargetEnt()local b=self:GetTargetEnt2()if!string.StartWith(self:GetEffectName(),"!UTILEFFECT!")then if SERVER then else local c=nil;if self:GetColor().r==0&&self:GetColor().g==0&&self:GetColor().b==0 then else if self:GetColor().a==1 then c={position=Vector(self:GetColor().r/255,self:GetColor().g/255,self:GetColor().b/255)}else c={position=Vector(self:GetColor().r,self:GetColor().g,self:GetColor().b)}end end;self.cpointtable={}self.cpointtable[1]={entity=a,attachtype=PATTACH_ABSORIGIN_FOLLOW}if IsValid(b)then self.cpointtable[2]={entity=b,attachtype=PATTACH_ABSORIGIN_FOLLOW}else if c then self.cpointtable[2]=c else self.cpointtable[2]=self.cpointtable[1]end end;for d=3,64 do if c then self.cpointtable[d]=c else self.cpointtable[d]=self.cpointtable[1]end end;PrecacheParticleSystem(self:GetEffectName())end end;self:SetModel("models/hunter/plates/plate.mdl")self:SetNoDraw(true)if self:GetRepeatRate()>0 then self.NextRepeat=0 else if self:GetActive()then self:AttachParticle()end end end;function ENT:Think()if self:GetNumpadState()=="off"then self:SetNumpadState("")self:RemoveParticle(false,self:GetEffectName())end;if self:GetNumpadState()=="on"then self:SetNumpadState("")if self:GetRepeatRate()>0 then self.NextRepeat=0 else if self:GetActive()then self:AttachParticle()end end end;if self:GetActive()==true&&self:GetRepeatRate()>0 then if!(self.NextRepeat>CurTime())then if self:GetRepeatSafety()then self:RemoveParticle(true,self:GetEffectName())else self:AttachParticle()end;self.NextRepeat=CurTime()+self:GetRepeatRate()end end;self:NextThink(CurTime())return true end;function ENT:AttachParticle()local a=self:GetTargetEnt()local e=self:GetAttachNum()local f=self:GetEffectName()local b=self:GetTargetEnt2()local g=self:GetAttachNum2()if f==nil||!a:IsValid()then return end;if string.StartWith(f,"!UTILEFFECT!")then local h=self:GetUtilEffectInfo().x;local i=self:GetUtilEffectInfo().y;local j=self:GetUtilEffectInfo().z;local k=EffectData()k:SetEntity(a)if string.find(f,"Tracer",0,true)!=nil then k:SetScale(5000)else k:SetScale(h)end;k:SetMagnitude(i)k:SetRadius(j)k:SetFlags(0)if string.EndsWith(f,"!")then if string.find(f,"!FLAG1!")then k:SetFlags(1)f=string.Replace(f,"!FLAG1!","")end;if string.find(f,"!FLAG2!")then k:SetFlags(2)f=string.Replace(f,"!FLAG2!","")end;if string.find(f,"!FLAG3!")then k:SetFlags(3)f=string.Replace(f,"!FLAG3!","")end;if string.find(f,"!FLAG4!")then k:SetFlags(4)f=string.Replace(f,"!FLAG4!","")end;if string.find(f,"!FLAG5!")then k:SetFlags(5)f=string.Replace(f,"!FLAG5!","")end;if string.find(f,"!FLAG6!")then k:SetFlags(6)f=string.Replace(f,"!FLAG6!","")end;if string.find(f,"!FLAG7!")then k:SetFlags(7)f=string.Replace(f,"!FLAG7!","")end;if string.find(f,"!FLAG8!")then k:SetFlags(8)f=string.Replace(f,"!FLAG8!","")end;if string.find(f,"!FLAG9!")then k:SetFlags(9)f=string.Replace(f,"!FLAG9!","")end end;k:SetColor(0)if string.EndsWith(f,"!")then if string.find(f,"!COLOR1!")then k:SetColor(1)f=string.Replace(f,"!COLOR1!","")end;if string.find(f,"!COLOR2!")then k:SetColor(2)f=string.Replace(f,"!COLOR2!","")end;if string.find(f,"!COLOR3!")then k:SetColor(3)f=string.Replace(f,"!COLOR3!","")end;if string.find(f,"!COLOR4!")then k:SetColor(4)f=string.Replace(f,"!COLOR4!","")end;if string.find(f,"!COLOR5!")then k:SetColor(5)f=string.Replace(f,"!COLOR5!","")end;if string.find(f,"!COLOR6!")then k:SetColor(6)f=string.Replace(f,"!COLOR6!","")end;if string.find(f,"!COLOR7!")then k:SetColor(7)f=string.Replace(f,"!COLOR7!","")end;if string.find(f,"!COLOR8!")then k:SetColor(8)f=string.Replace(f,"!COLOR8!","")end;if string.find(f,"!COLOR9!")then k:SetColor(9)f=string.Replace(f,"!COLOR9!","")end end;if string.find(string.lower(f),"shakeropes")then k:SetMagnitude(i*20)end;if string.find(string.lower(f),"thumperdust")then k:SetScale(h*50)end;if string.find(string.lower(f),"bloodspray")then k:SetScale(h*4)end;if a:GetAttachment(e)!=nil then k:SetAttachment(e)k:SetStart(a:GetAttachment(e).Pos)k:SetOrigin(a:GetAttachment(e).Pos)k:SetAngles(a:GetAttachment(e).Ang)k:SetNormal(a:GetAttachment(e).Ang:Forward())else k:SetStart(a:GetPos())k:SetOrigin(a:GetPos())k:SetAngles(a:GetAngles())k:SetNormal(a:GetAngles():Forward())end;if IsValid(b)then if b:GetAttachment(g)!=nil then k:SetOrigin(b:GetAttachment(g).Pos)k:SetNormal(b:GetAttachment(g).Ang:Forward())else k:SetOrigin(b:GetPos())k:SetNormal(b:GetAngles():Forward())end end;util.Effect(string.Replace(f,"!UTILEFFECT!",""),k)else a:CreateParticleEffect(f,self.cpointtable)end end;function ENT:RemoveParticle(l,m)local a=self:GetTargetEnt()if CLIENT then if a:IsValid()then a:StopParticleEmission(m)end;if a!=self then for n,o in pairs(ents:GetAll())do if o!=self then if IsValid(o)&&o:GetClass()=="particlecontroller_normal"&&o:GetParent()==a then if o.GetActive&&o:GetActive()==true&&o:GetNumpadState()==""then o:AttachParticle()end end end end end end;if l==true then self:AttachParticle()end end;function ENT:OnRemove()self:RemoveParticle(false,self:GetEffectName())end;duplicator.RegisterEntityClass("particlecontroller_normal",function(p,q)end,"Data")
--addons/!lpakr_out/lua/entities/pfx1_06~.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_08#_l.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Large Fire [Pink]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]_large_campfire_pink"
--addons/!lpakr_out/lua/entities/pfx1_0c.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Medium fire"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]ground_fire_1"
--addons/!lpakr_out/lua/entities/pfx1_0c~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Large fire"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]ground_fire_1*"
--addons/!lpakr_out/lua/entities/pfx1_0e_l.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Large Fire [Default]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]_large_campfire"
--addons/!lpakr_out/lua/entities/pfx1_0f.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Colorful Smoke Cloud"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]_smoke_colorful_1"
--addons/!lpakr_out/lua/entities/pfx2_01.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_00.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Basic Jet"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_f"
--addons/!lpakr_out/lua/entities/pfx4_02_s~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Smaller Red Jet [Smokeless]"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_r_s*"
--addons/!lpakr_out/lua/entities/pfx4_05.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Electric Arcs"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]arcs_electric_1"
--addons/!lpakr_out/lua/entities/pfx4_05~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Electric Arcs [Small]"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]arcs_electric_1_small"
--addons/!lpakr_out/lua/entities/pfx5_00_ss.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx6_02b.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/proj_drg_default/shared.lua:
return lpakr()()
--addons/ssrp_lfs/lua/entities/roy_eta2_lvs/cl_init.lua:
include("shared.lua")

ENT.EngineColor = Color( 0, 180, 255, 255)
ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EnginePos = {
	Vector(-115.797,-15.056,-18.838),
	Vector(-115.797,15.056,-18.838),
}

function ENT:OnSpawn()
	self:SetPoseParameter("sFoils", 0)
	self:RegisterTrail( Vector(-48.852,104.794,-24.138), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-48.852,-104.794,-24.138), 0, 20, 2, 1000, 150 )
end

local ply = nil

function ENT:OnFrame()

	ply = self:GetDriver()

	if IsValid(ply) or self:GetAI() then
		self.canopyState = 0
	else
		self.canopyState = 1
	end
	
	self.canopyLerp = Lerp(0.1, self.canopyLerp or 0, self.canopyState)
	self:SetPoseParameter("cockpitOpen", self.canopyLerp)

	self:EngineEffects()
	self:AnimAstromech()
	self:AnimWings()
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
		particle:SetStartSize( math.Rand(20,25) )
		particle:SetEndSize( math.Rand(0,10) )
		particle:SetRoll( math.Rand(-1,1) * 100 )
		particle:SetColor( 50, 180, 255 )
	end
end

function ENT:AnimAstromech()
	local T = CurTime()

	if (self.nextAstro or 0) < T then
		self.nextAstro = T + math.Rand(0.5,2)
		self.AstroAng = 0 - math.Rand(-180,180)

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

	self:ManipulateBoneAngles( 4, Angle(self.smastro,0,0) )
end

function ENT:AnimWings()
	self._sm_wing = self._sm_wing or 1

	local target_wing = self:GetFoils() and 0 or 1
	local RFT = RealFrameTime() * (0.5 + math.abs( math.sin( self._sm_wing * math.pi ) ) * 0.5)

	local Rate = RFT * 1

	self._sm_wing = self._sm_wing + math.Clamp(target_wing - self._sm_wing,-Rate,Rate)

	local DoneMoving = self._sm_wing == 1 or self._sm_wing == 0

	if self._oldDoneMoving ~= DoneMoving then
		self._oldDoneMoving = DoneMoving
		if not DoneMoving then
			self:EmitSound("lvs/vehicles/arc170/sfoils.wav")
		end
	end

	if ( self:GetFoils() ) then
		self.foilVar = 0
	else
		self.foilVar = 1
	end
	self.foilLerp = Lerp(0.01, self.foilLerp or 0, self.foilVar)

	self:SetPoseParameter("sFoils", 1-self._sm_wing)

	self:InvalidateBoneCache()
end

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 50 + self:GetThrottle() * 120 + self:GetBoost() * 6

	render.SetMaterial( self.EngineGlow )

	for _, pos in pairs( self.EnginePos ) do
		render.DrawSprite(  self:LocalToWorld( pos ), Size, Size, self.EngineColor )
		render.DrawSprite(  self:LocalToWorld( pos ), Size*.4, Size*.4, Color( 255, 255, 255, 120) )
	end
end

function ENT:OnStartBoost()
	self:EmitSound( "lvs/vehicles/arc170/boost.wav", 85 )
end

function ENT:OnStopBoost()
	self:EmitSound( "lvs/vehicles/arc170/brake.wav", 85 )
end

--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_beacon/cl_init.lua:
include'shared.lua'ENT.MaxWidth=200;ENT.UIOffset=Vector(0,0,1200)function ENT:Initialize()srp.hud.AddOverview('beacon_'..self:EntIndex(),{text='Beacon #'..self:EntIndex(),pos=self:GetPos()+self.UIOffset,entity=self,showbar=true,percent=1})self.OverviewInit=true end;function ENT:OnRemove()srp.hud.RemoveOverview('beacon_'..self:EntIndex())end;function ENT:GetOverviewData(a)a.text=self:GetBeaconName()||'Unknown Beacon'a.pos=self:GetPos()+self.UIOffset;a.drawbar=true;local b=self.Colors[self:GetBeaconColor()]a.barcolor=b&&b.col||col.white;return a end;local c;function ENT:ClientPlayerUse()if!LocalPlayer():IsTrialGamemaster()then return end;srp.ui.Create('srp_beacon',function(d)d:Populate(self)c=d end)end;function ENT:Draw()if!self.OverviewInit then self:Initialize()end;self:DrawModel()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_bomb_base/shared.lua:
ENT.PrintName='Bomb Base'ENT.Author='Scott'ENT.Contact='STEAM_0:1:2665200'ENT.Purpose=''ENT.Instructions=''ENT.Type='anim'ENT.Base='base_srp'ENT.Category='SUP Hackables'ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_TRANSLUCENT;ENT.IsHackableBomb=true;ENT.NetworkPlayerUse=true;ENT.ModeInfo={{color=col.red,speed=15,snd='buttons/button5.wav'},{color=col.green,speed=1,snd='buttons/button5.wav'},{color=col.yellow,speed=4,snd='buttons/button5.wav'},{color=col.orange,speed=10,snd='buttons/button5.wav'}}ENT.LightPos=Vector(0,0,35)ENT.LightSize=25;ENT.Models={Model('models/combine_helicopter/helicopter_bomb01.mdl')}ENT.Damage=500;ENT.DamageRadius=1000;ENT.GameCount={3,4}ENT.GameDifficulty={'normal'}ENT.ExplosionMode='Explode'ENT.PreExplosionMode='ExplodeWarning'ENT.ExplosionTimer=12;ENT.ExplosionTypes={Explode='Explode',Gas='ExplodeGas',Fire='ExplodeFire'}ENT.PreExplosionTypes={ExplodeWarning='ExplodeWarning'}function ENT:SetupDataTables()self:NetworkVar('Int',0,'Mode')self:NetworkVar('String',0,'Upgrade')self:NetworkVar('String',1,'DisplayName')end;sound.Add({name='Hackbomb.Humming',sound='sound/npc/turret_wall/turret_loop1.wav',pitch=100,volume=1})sound.Add({name='Hackbomb.Sound',sound='sound/npc/turret_floor/alert.wav',pitch=100,volume=1})
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bubbleshield/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_building/cl_init.lua:
include'shared.lua'local a=Color(200,200,200,100)local b='Construct!'local c=' + ALT Information'local d=20;function ENT:Initialize()self.offset=0;self.start=0;self.duration=0 end;function ENT:PlayerUse()srp.build.OpenInteractionMenu(self)end;function ENT:DrawCrafting()if!self:GetBuilding()then return end;if!self.item then local e=self:GetBuildingData()if!e then self.Think=function()end;return else self.start=CurTime()self.duration=e.duration||5;self.offset=math.abs(self:OBBMaxs().z-self:OBBMins().z)self.item=e end end;if!IsValid(self.mdl)then local f=ClientsideModel(self.item.model)if!IsValid(f)then return end;f:SetModelScale(1.05,0)f:SetPos(self:GetPos())f:SetAngles(self:GetAngles())f:SetParent(self)f:SetNoDraw(true)f:SetRenderMode(RENDERMODE_TRANSALPHA)f:SetColor(Color(255,255,255,25))self.mdl=f end;if!IsValid(self.mdl)then return end;local g,h=self.mdl:OBBMins(),self.mdl:OBBMaxs()local i=math.Clamp((CurTime()-self.start)/(self.duration||0),0,1)local j=-self.mdl:GetUp()local k=self.mdl:LocalToWorld(Vector(0,0,(self.offset+2)*i))local l=j:Dot(k)local m=render.EnableClipping(true)render.PushCustomClipPlane(j,l)render.ModelMaterialOverride(self.EffectCrafting)self.mdl:DrawModel()render.ModelMaterialOverride()render.PopCustomClipPlane()render.EnableClipping(m)if i==1 then self:StopBuilding()end end;function ENT:StopBuilding()end;function ENT:Draw()self:DrawModel()self:DrawCrafting()if!self.item then return end;local k=self:LocalToWorld(self.item.UIPosition||self.UIPosition)local n=self:LocalToWorldAngles(self.item.UIAngle||self.UIAngle)cam.Start3D2D(k,n,.2)draw.DrawText((self:Health()||0)..'/'..(self:GetMaxHealth()||0),'DermaDefault',0,0,a,TEXT_ALIGN_CENTER)cam.End3D2D()if self.item.UIAltPosition then k=self:LocalToWorld(self.item.UIAltPosition)n=self:LocalToWorldAngles(self.item.UIAltAngle)else n:RotateAroundAxis(Vector(0,0,1),180)end;cam.Start3D2D(k,n,.2)draw.DrawText((self:Health()||0)..'/'..(self:GetMaxHealth()||0),'DermaDefault',0,0,a,TEXT_ALIGN_CENTER)cam.End3D2D()end;function ENT:OnRemove()if IsValid(self.mdl)then self.mdl:Remove()end end;function ENT:DrawInteraction(o)local p=c;if self:GetRequiresConstruction()then p=b elseif self:GetBuilding()then return end;surface.SetFont('ui_label_inventory.itemheader')surface.SetDrawColor(255,255,255,255)surface.SetMaterial(o.OnPickup)surface.SetTextColor(255,255,255,255)local q,r=surface.GetTextSize(p)q=q+d+4;local s,t=(ScrW()-d-q)*.50,(ScrH()-(d+20))*.8;surface.DrawTexturedRect(s,t,d,d)surface.SetTextPos(s+d+2,t)surface.DrawText(p)end;function ENT:GetRepairInfo(u)local v=self:GetBuildingData()if!v then return end;local w=table.GetKeys(v.items)[1]local x=math.max(1,math.Round(v.items[w]*.1))local e=srp.items.Get(w)if!e then return end;local i=self:Health()/v.health;local x=math.ceil(5*(1-i))*x;return e.name,x,i,e.icon end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bus/cl_init.lua:
include'shared.lua'local a=20;local b=Material'sprites/light_glow02_add'local c=col.red:Copy()local d=col.white:Copy()local e=Vector(0,0,1)ENT.ViewOrigin=Vector(-300,0,250)ENT.ViewAngles=Angle(10,0,0)ENT.Interactive=true;ENT.InteractionName='Board Ship (25RC)'ENT.Stages={[1]={OnEntered=function(self)srp.bus.CloseLoadingScreen()end},[2]={RunForAll=true,OnEntered=function(self)self.ThrustTarget=0 end},[3]={RunForAll=true,OnEntered=function(self)self.ThrustTarget=1 end},[4]={OnEntered=function(self)srp.bus.OpenLoadingScreen()end}}ENT.Thrusters={{Position=Vector(-129,-105,79),Angle=Angle()},{Position=Vector(-129,105,79),Angle=Angle()}}function ENT:OnRemove()srp.bus.CloseLoadingScreen()end;function ENT:DrawDust()if self:GetNoDraw()then return end;if!self:InSight()then return end;if self.NextEffect&&self.NextEffect>CurTime()then return end;local f=util.TraceLine({start=self:GetPos(),endpos=self:GetPos()-self:GetUp()*500,filter=self})if f.HitWorld then local g=EffectData()local h=EffectData()h:SetStart(f.HitPos)h:SetOrigin(f.HitPos)h:SetNormal(e)h:SetScale(math.random(50,150))h:SetMagnitude(5)util.Effect('ThumperDust',h,true,true)end;self.NextEffect=CurTime()+.5 end;function ENT:Think()self:DrawDust()end;function ENT:DrawEngine()self.Thrust=math.Approach(self.Thrust||0,self.ThrustTarget||0,RealFrameTime()*60)for i,j in ipairs(self.Thrusters)do local k=self:LocalToWorld(j.Position)local l=self:LocalToWorldAngles(j.Angle)k.x=k.x-20*self.Thrust;local m=20;render.SetMaterial(b)render.DrawSprite(k,m,m,c)m=m+20*self.Thrust;render.SetMaterial(b)render.DrawSprite(k,m,m,d)render.DrawSprite(k,m,m,d)end end;function ENT:Draw(n)self:DrawModel(n)self:DrawEngine()if info.Dev then local o=self:GetNetVar('bus.PathingEnter')||{}cam.Start2D()for p,q in ipairs(o)do local r=q:ToScreen()draw.Box(r.x,r.y,4,4,p==#o&&col.orange||p==1&&col.blue||col.green)end;cam.End2D()end end;function ENT:DrawInteraction(s,f,t)if self:GetNoDraw()then return end;surface.SetFont'ui_header.s'surface.SetDrawColor(255,255,255,255)surface.SetMaterial(s.OnPickup)surface.SetTextColor(255,255,255,255)local u=self.InteractionName||''local v,w=surface.GetTextSize(u)v=v+a+4;local x,y=t.x,t.y;surface.DrawTexturedRect(x,y,a,a)surface.SetTextPos(x+a+2,y-2)surface.DrawText(u)end;local function z(A,B,C,D)local E=A:GetBus()if IsValid(E)then local l=E:LocalToWorldAngles(E.ViewAngles)l.r=0;return{origin=E:LocalToWorld(E.ViewOrigin),angles=l,fov=100}end end;hook('OnBusRideChanged',function(A,E,F)if IsValid(E)then hook.Add('CalcView','srp.bus.CalcView',z)else hook.Remove('CalcView','srp.bus.CalcView')end end)
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_button/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_fish/shared.lua:
ENT.PrintName='Fish AI'ENT.Author='Scott'ENT.Contact='STEAM_0:1:2665200'ENT.Purpose='To swim and live life to the fullest'ENT.Instructions=''ENT.Type='anim'ENT.Base='base_anim'ENT.Category='SUP'ENT.Spawnable=true;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.DoNotDuplicate=true;ENT.DontFreeze=true;ENT.Paths={{Vector(-7525,-641,10),Vector(-7704,-450,10),Vector(-7776,-367,10),Vector(-7659,-248,10),Vector(-7522,-356,10),Vector(-7269,-511,10),Vector(-7161,-406,10),Vector(-7415,-218,10),Vector(-7507,-94,10),Vector(-7564,153,10),Vector(-7383,324,10),Vector(-7116,159,10),Vector(-6862,-119,10),Vector(-6741,-186,10),Vector(-6460,-188,10),Vector(-6415,63,10),Vector(-6206,47,10),Vector(-5971,-69,10),Vector(-6144,347,10),Vector(-6415,117,10),Vector(-6537,-193,10),Vector(-6862,28,10),Vector(-6958,348,10),Vector(-7197,422,10),Vector(-6985,-78,10),Vector(-6803,-488,10),Vector(-7001,-468,10),Vector(-7133,-419,10),Vector(-7453,-394,10),Vector(-7506,-519,10),Vector(-7666,-400,10),Vector(-7861,-691,10),Vector(-7828,-1031,10),Vector(-8024,-767,10),Vector(-8114,-457,10),Vector(-8448,-671,10),Vector(-8196,-1117,10),Vector(-8371,-1350,10),Vector(-8725,-924,10),Vector(-8290,-608,10),Vector(-8033,-747,10),Vector(-7742,-761,10),Vector(-7676,-462,10),Vector(-7284,-411,10),Vector(-7204,-337,10),Vector(-7345,114,10),Vector(-7105,257,10),Vector(-6833,-19,10),Vector(-6650,-180,10),Vector(-6359,-22,10),Vector(-6606,262,10),Vector(-6934,344,10),Vector(-7107,512,10),Vector(-7216,285,10),Vector(-6930,-109,10),Vector(-6914,-311,10),Vector(-7014,-307,10),Vector(-7053,-116,10),Vector(-7171,-293,10),Vector(-7128,-377,10),Vector(-7181,-399,10),Vector(-7331,-349,10),Vector(-7381,-543,10),Vector(-7447,-679,10),Vector(-7732,-610,10),Vector(-7963,-704,10),Vector(-7932,-1044,10),Vector(-8322,-1034,10),Vector(-8690,-993,10),Vector(-8795,-1685,10),Vector(-8341,-1478,10),Vector(-8247,-911,10),Vector(-7783,-855,10),Vector(-7518,-541,10),Vector(-7179,-325,10),Vector(-7106,-73,10),Vector(-7114,297,10),Vector(-7177,428,10),Vector(-6874,323,10),Vector(-6748,-20,10),Vector(-6598,-125,10),Vector(-6446,-58,10),Vector(-6581,141,10),Vector(-6588,219,10),Vector(-6303,164,10),Vector(-6025,191,10),Vector(-5906,365,10),Vector(-5745,542,10),Vector(-5618,271,10),Vector(-6037,27,10),Vector(-6278,117,10),Vector(-6601,72,10),Vector(-6770,-357,10),Vector(-6933,-351,10),Vector(-6988,-116,10),Vector(-6914,68,10),Vector(-6926,258,10),Vector(-7207,493,10),Vector(-7030,17,-179),Vector(-7111,-251,10),Vector(-7200,-294,10),Vector(-7366,-452,10),Vector(-7283,-552,10),Vector(-7106,-432,10),Vector(-7070,-411,10),Vector(-6977,-383,10),Vector(-6949,-226,10),Vector(-7021,-61,10),Vector(-7059,85,10),Vector(-6923,183,10),Vector(-6691,47,10),Vector(-6501,-96,10),Vector(-6229,-92,10),Vector(-6086,-36,10),Vector(-6171,101,10),Vector(-6460,1,10),Vector(-6734,-11,10),Vector(-6968,208,10),Vector(-6804,-72,10),Vector(-6511,-83,10),Vector(-5989,78,10),Vector(-5729,309,10),Vector(-5331,593,10),Vector(-4839,722,10),Vector(-4966,241,10),Vector(-4985,124,10),Vector(-5677,214,10),Vector(-6159,152,10),Vector(-6386,-124,10),Vector(-6678,-67,10),Vector(-6861,-22,10),Vector(-7011,-45,10),Vector(-7088,-63,10)}}
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_floatingpumpkin/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_floatingpumpkin/cl_init.lua:
include'shared.lua'function ENT:Think()if!self:GetNoDraw()then local a=EffectData()a:SetOrigin(self:GetPos()+self:GetForward()*17+self:GetUp()*8)a:SetRadius(25)util.Effect('rb655_force_repulse_out',a,true,true)local b=util.TraceLine({start=self:GetPos(),endpos=self:GetPos()-Vector(0,0,200),filter=self})if!b.HitWorld&&(!self.LastEffect||self.LastEffect<CurTime())then a:SetOrigin(b.HitPos)a:SetNormal(b.HitNormal)a:SetRadius(.5)a:SetMagnitude(0.05)util.Effect('VortDispel',a,true,true)self.LastEffect=CurTime()+2 end end;self:SetNextClientThink(CurTime()+.5)return true end;function ENT:Draw()local c=DynamicLight(self:EntIndex())if c then c.pos=self:GetPos()+Vector(0,0,4)c.r=255;c.g=34+math.cos(CurTime()*2)*34;c.b=0;c.brightness=5;c.Decay=1;c.Size=250;c.DieTime=CurTime()+.01 end;self:DrawModel()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_funcmodule_status.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/rp_grenade/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/rp_grenade_dioxis.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/rp_grenade_smoke.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/rp_grenade_smoke.lua:
AddCSLuaFile()ENT.Base="rp_grenade"ENT.PrintName="Smoke Grenade"ENT.Spawnable=false;ENT.WorldModel="models/weapons/w_eq_flashbang.mdl"ENT.ExplosionTime=1;ENT.FreezeMotion=false;ENT.HitSound=Sound'Flashbang.Bounce'ENT.SmokeColor=Color(0,0,200)ENT.SmokeColor2=Color(0,0,200)ENT.TrailColor=Color(172,181,189)ENT.TrailGlowColor='whiteglow1'function ENT:CreateSmoke(a)if IsValid(self.smoke)then return end;self.smoke=ents.Create'env_smokestack'self.smoke:SetParent(self)self.smoke:SetPos(self:GetPos())self.smoke:SetKeyValue("Name","smokey_"..self:EntIndex())self.smoke:SetKeyValue("InitialState",1)self.smoke:SetKeyValue("WindAngle","20")self.smoke:SetKeyValue("WindSpeed","4")self.smoke:SetSaveValue("SpreadSpeed",3)self.smoke:SetSaveValue("Speed",45)self.smoke:SetSaveValue("StartSize",5)self.smoke:SetSaveValue("EndSize",35)self.smoke:SetSaveValue("Rate",100)self.smoke:SetSaveValue("JetLength",400)self.smoke:SetSaveValue("BaseSpread",5)self.smoke:SetSaveValue("Twist",1)self.smoke:SetKeyValue("rendercolor",a.r.." "..a.g.." "..a.b)self.smoke:SetKeyValue("renderamt","40")local b=ents.Create'env_particlelight'b:SetParent(self)b:SetPos(self:GetPos()+Vector(0,0,25))b:SetSaveValue("Color","1 1 1")b:SetSaveValue("Intensity","255")b:SetSaveValue("PSName","smokey_"..self:EntIndex())b:Spawn()b:Activate()self.smoke:Spawn()self.smoke:Activate()self.smoke:DeleteOnRemove(b)self.smoke:Fire("turnon","",0.1)end;function ENT:RunInterval()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_hackable_lock/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_hologram/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_hologram_temple.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_itemofinterest_orb.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_lava/cl_init.lua:
include'shared.lua'function ENT:Initialize()self:SetColor(col.orange:Copy())end;ENT.Draw=ENTITY.DrawModel
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_note/shared.lua:
ENT.PrintName='Note'ENT.Category='SUP'ENT.Author='Scott'ENT.Contact='STEAM_0:1:26675200'ENT.Type='anim'ENT.Base='base_anim'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Spawnable=true;ENT.Interactive=true;ENT.Model=Model('models/lt_c/sci_fi/holo_tablet.mdl')ENT.Fonts={'Trebuchet','Roboto','Comic Sans MS','Star Jedi'}function ENT:SetupDataTables()self:NetworkVar("Int",0,'Font')self:NetworkVar("String",0,'Title')self:NetworkVar("String",1,'Text')end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_palletdropoff/cl_init.lua:
include'shared.lua'local a=Vector(0,0,100)function ENT:Draw()if info.Dev||LocalPlayer().DropoffZoneID==self:EntIndex()then render.Model({model='models/effects/vol_light128x256.mdl',pos=self:GetPos()+a,ang=self:GetAngles()})end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_palletdropoff/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_picture/shared.lua:
dash.IncludeCL'menu_cl.lua'ENT.Type='anim'ENT.PrintName='Picture Frame'ENT.Author='aStonedPenguin'ENT.Base='base_srp'ENT.Category='SUP'ENT.NetworkPlayerUse=true;ENT.Spawnable=true;function ENT:SetupDataTables()self:NetworkVar('String',0,'URL')self:NetworkVar('Int',0,'AspectMode')self:NetworkVar('Float',0,'Scale')self:NetworkVar('Bool',0,'Vertical')if CLIENT then self:NetworkVarNotify('URL',function(self,a,b,c)self.InvalidatePicture=true end)self:NetworkVarNotify('AspectMode',function(self,a,b,c)self:ApplyAspectRatio(self.AspectModes[c],self:GetScale())self.InvalidatePicture=true end)self:NetworkVarNotify('Scale',function(self,a,b,c)self:ApplyAspectRatio(self:GetAspectInfo(),c)self.InvalidatePicture=true end)self:NetworkVarNotify('Vertical',function(self,a,b,c)self.InvalidatePicture=true end)end end;ENT.DefaultURL='https://gmod-api.superiorservers.co/static/images/textless_logo.png'ENT.AspectModes={[0]={Name='1:1',Scale=Vector(1,1,1),Mins=Vector(-12,-1,-12),Maxs=Vector(12,1,12),Width=512,Height=512,MaxScale=3},[1]={Name='4:3',Scale=Vector(1.25,1,1),Mins=Vector(-15,-1,-12),Maxs=Vector(15,1,12),Width=640,Height=512,MaxScale=3},[2]={Name='16:9',Scale=Vector(1.77,1,1),Mins=Vector(-21.24,-1,-12),Maxs=Vector(21.24,1,12),Width=906,Height=512,MaxScale=2},[3]={Name='21:9',Scale=Vector(2.33,1,1),Mins=Vector(-27.96,-1,-12),Maxs=Vector(27.96,1,12),Width=1192,Height=512,MaxScale=1.75}}function ENT:GetAspectInfo()return self.AspectModes[self:GetAspectMode()||0]end;local d={'^https?://.*%.webp','^https?://.*%.jpeg','^https?://.*%.jpg','^https?://.*%.png'}function ENT:IsValidURL(e)if string.match(e,'STEAMID?:.*%d')||e:StartsWith('ORG:')then return true end;for f,g in ipairs(d)do if string.match(e,g)then return true end end end;local h={'"',"'",']','[','\\'}function ENT:EscapeURL(e)for i,j in ipairs(h)do e=string.Replace(e,j,'')end;return e end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_ragdoll/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_redlightbot/cl_init.lua:
include'shared.lua'ENT.AttackOffset=100;ENT.IdleOffset=0;function ENT:Draw()self:DrawModel()local a=1/RealFrameTime()local b=self:GetTargetMode()self.DisplayOffset=math.Approach(self.DisplayOffset||0,b&&self.AttackOffset||self.IdleOffset,175/a)self.OriginalPosition=self.OriginalPosition||self:GetPos()local c=math.sin(RealTime()*2)*(b&&10||0)self:SetRenderOrigin(self.OriginalPosition+Vector(0,0,self.DisplayOffset+c))end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_stove/cl_init.lua:
include'shared.lua'function ENT:OnRecipeUpdated(a)if a then self:ShowVisuals(a)else self:RemoveVisuals()end end;function ENT:ShowVisuals()end;function ENT:RemoveVisuals()end;ENT.Draw=ENTITY.DrawModel
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_tradingterminal.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/sent_firework/cl_init.lua:
include'shared.lua'local a=CreateClientConVar('fireworks_smoke','1',true,false)local b=CreateClientConVar('fireworks_flame','1',true,false)function ENT:Initialize()self.Emitter=ParticleEmitter(self:GetPos(),false)self.NextPuff=CurTime()MX,MN=self:GetRenderBounds()self:SetRenderBounds(MN+Vector(0,0,512),MX)end;local c=Material('sprites/gmdm_pickups/light')function ENT:Draw()self:DrawModel()if WireAddonCL then Wire_Render(self)end;if FrameTime()==0||!self.Emitter||self.NextPuff>CurTime()then return end;local d=self:GetPos()+self:GetUp()*19;local e=self:GetFuseLevel()||0;local f=self:GetFlameColor()||Vector(255,165,0)local g=math.Rand(100,250)if e>1&&b:GetBool()then local h=self.Emitter:Add('sprites/gmdm_pickups/light',d+VectorRand())if h then h:SetVelocity(-self:GetUp()*g+VectorRand()*10)h:SetDieTime(math.Rand(0.75,1.25))h:SetColor(f.x,f.y,f.z)h:SetStartAlpha(math.Rand(100,255))h:SetStartSize(math.Rand(5,50))h:SetEndSize(math.Rand(0.1,0.5))h:SetGravity(Vector(0,0,-400))h:SetCollide(true)h:SetBounce(1)end;local i=math.cos(CurTime()*10)*256;render.SetMaterial(c)render.DrawSprite(d,i,i,Color(f.x,f.y,f.z))end;if e>0&&a:GetBool()then local j=self.Emitter:Add('particles/smokey',d+VectorRand())if j then j:SetVelocity(-self:GetUp()*g/2+VectorRand()*10)j:SetDieTime(math.Rand(1,3))local k=math.Rand(35,255)j:SetColor(k,k,k)j:SetStartAlpha(math.Rand(35,100))j:SetEndAlpha(0)j:SetStartSize(math.Rand(0.5,5))j:SetEndSize(math.Rand(10,20))j:SetRollDelta(math.Rand(-2,2))j:SetGravity(Vector(0,0,100))end end;self.NextPuff=CurTime()+math.random()*0.05 end;function ENT:OnRemove()if!self.Emitter then return end;self.Emitter:Finish()end
--addons/!lpakr_out/lua/entities/sent_firework/shared.lua:
ENT.Type='anim'ENT.Base='base_anim'ENT.PrintName='Firework'ENT.Author='TurtleHx/LinkTwilight'ENT.Information='A firework'ENT.Spawnable=false;ENT.AdminSpawnable=false;function ENT:SetupDataTables()self:NetworkVar('Int',0,'FuseLevel')self:NetworkVar('Vector',0,'FlameColor')self:NetworkVar('Vector',1,'ExplodeColor')end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/sent_popcorn_thrown/shared.lua:
ENT.Base="base_anim"ENT.Type="anim"ENT.PrintName="Thrown Popcorn"ENT.Model=Model("models/Teh_Maestro/popcorn.mdl")
--addons/!lpakr_out/lua/entities/sup_targettrigger.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='base_anim'ENT.PrintName='Area Trigger Helper'ENT.Category='SUP'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Editable=false;ENT.Spawnable=true;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.IsAreaTrigger=true;ENT.IsTriggerHelper=true;local a=Vector(0,0,25)local b=Angle(0,90,90)local c={ui.col.Black,ui.col.Red,ui.col.Green,ui.col.Blue,ui.col.Pink,ui.col.Orange,ui.col.Purple}function ENT:SetupDataTables()self:NetworkVar('Entity',0,'GMOwner')end;function ENT:Initialize()end;function ENT:SpawnFunction(d,e,f)local g=ents.Create(f)g:SetPos(d:GetEyeTraceNoCursor().HitPos)g:Spawn()g:SetGMOwner(d)areatrigger.SetPropOwner(g,d)undo.Create'sup_helpertrigger'undo.SetPlayer(d)undo.AddEntity(g)undo.SetCustomUndoText'Removed Trigger Helper'undo.Finish()end;function ENT:GetDisplayName()return self:GetClass()..'['..self:EntIndex()..']'end;function ENT:Draw(h)if self:GetGMOwner()!=LocalPlayer()then return end;self:DrawModel(h)cam.Start3D2D(self:LocalToWorld(a),self:LocalToWorldAngles(b),0.25)draw.DrawText('Target Helper','ui.26',0,-20,color_white,TEXT_ALIGN_CENTER)draw.DrawText('['..self:EntIndex()..']','ui.26',0,0,color_white,TEXT_ALIGN_CENTER)cam.End3D2D()end
--addons/!lpakr_out/lua/entities/witcher_door/shared.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_entity")ENT.Type="anim"ENT.PrintName="Witcher Portal"ENT.Category="Portals"ENT.Spawnable=false;ENT.AdminOnly=false;ENT.Model=Model("models/hunter/blocks/cube1x2x025.mdl")ENT.RenderGroup=RENDERGROUP_BOTH;function ENT:SetupDataTables()self:NetworkVar("Bool",0,"Enabled")self:NetworkVar("Vector",0,"TempColor")self:NetworkVar("Vector",1,"RealColor")self:NetworkVar("Entity",0,"Other")self:NetworkVar("Float",0,"AnimStart")end;function ENT:UpdateTransmitState()return TRANSMIT_ALWAYS end;local function a(b,c,d)local e=(c-b):GetNormalized()return d:Dot(e)>=0 end;if SERVER then elseif CLIENT then local function f(g)render.ClearStencil()render.SetStencilEnable(true)render.SetStencilCompareFunction(STENCIL_ALWAYS)render.SetStencilPassOperation(STENCIL_REPLACE)render.SetStencilFailOperation(STENCIL_KEEP)render.SetStencilZFailOperation(STENCIL_KEEP)render.SetStencilWriteMask(254)render.SetStencilTestMask(254)render.SetStencilReferenceValue(g||43)end;local function h()render.SetStencilCompareFunction(STENCIL_EQUAL)end;local function i()render.SetStencilEnable(false)render.ClearStencil()end;function ENT:Initialize()self.PixVis=util.GetPixelVisibleHandle()local j=Matrix()j:Scale(Vector(1,1,0.01))local k=1.8;local l=EffectData()l:SetEntity(self)l:SetOrigin(self:GetPos())util.Effect("portal_inhale",l)self:SetSolid(SOLID_VPHYSICS)self.hole=ClientsideModel("models/hunter/plates/plate1x2.mdl",RENDERGROUP_BOTH)self.hole:SetPos(self:GetPos()-self:GetUp()*(1+k))self.hole:SetAngles(self:GetAngles())self.hole:SetParent(self)self.hole:SetNoDraw(true)self.hole:EnableMatrix("RenderMultiply",j)self.top=ClientsideModel("models/hunter/plates/plate075x1.mdl",RENDERGROUP_BOTH)self.top:SetMaterial("portal/border")self.top:SetPos(self:GetPos()+self:GetRight()*44.5-self:GetUp()*(12.5+k))self.top:SetParent(self)self.top:SetLocalAngles(Angle(-75,-90,0))self.top:SetNoDraw(true)self.top:EnableMatrix("RenderMultiply",j)self.bottom=ClientsideModel("models/hunter/plates/plate075x1.mdl",RENDERGROUP_BOTH)self.bottom:SetMaterial("portal/border")self.bottom:SetPos(self:GetPos()-self:GetRight()*44.5-self:GetUp()*(12.5+k))self.bottom:SetParent(self)self.bottom:SetLocalAngles(Angle(-75,90,0))self.bottom:SetNoDraw(true)self.bottom:EnableMatrix("RenderMultiply",j)self.left=ClientsideModel("models/hunter/plates/plate075x2.mdl",RENDERGROUP_BOTH)self.left:SetMaterial("portal/border")self.left:SetPos(self:GetPos()+self:GetForward()*20.8-self:GetUp()*(12.5+k))self.left:SetParent(self)self.left:SetLocalAngles(Angle(-75,0,0))self.left:SetNoDraw(true)self.left:EnableMatrix("RenderMultiply",j)self.right=ClientsideModel("models/hunter/plates/plate075x2.mdl",RENDERGROUP_BOTH)self.right:SetMaterial("portal/border")self.right:SetPos(self:GetPos()-self:GetForward()*20.8-self:GetUp()*(12.5+k))self.right:SetParent(self)self.right:SetLocalAngles(Angle(-105,0,0))self.right:SetNoDraw(true)self.right:EnableMatrix("RenderMultiply",j)self.back=ClientsideModel("models/hunter/plates/plate3x3.mdl",RENDERGROUP_BOTH)self.back:SetMaterial("vgui/black")self.back:SetPos(self:GetPos()-self:GetUp()*42)self.back:SetParent(self)self.back:SetLocalAngles(angle_zero)self.back:SetNoDraw(true)self.h,self.s,self.l=0,1,1 end;function ENT:OnRemove()self.top:Remove()self.bottom:Remove()self.left:Remove()self.right:Remove()self.hole:Remove()self.back:Remove()end;function ENT:Draw()end;function ENT:Think()local k=1.8;local j=Matrix()j:Scale(Vector(1,1,0.01))if self:GetEnabled()then local m=DynamicLight(self:EntIndex())if m then local n=self:GetRealColor()m.pos=self:WorldSpaceCenter()+self:GetUp()*15;m.Size=300;m.style=5;m.Decay=600;m.brightness=1;m.r=n.x/2*255;m.g=n.y/2*255;m.b=n.z/2*255;m.DieTime=CurTime()+0.1 end end;if!IsValid(self.hole)then self.hole=ClientsideModel("models/hunter/plates/plate1x2.mdl",RENDERGROUP_BOTH)self.hole:SetPos(self:GetPos()-self:GetUp()*(1+k))self.hole:SetAngles(self:GetAngles())self.hole:SetParent(self)self.hole:SetNoDraw(true)self.hole:EnableMatrix("RenderMultiply",j)end;if!IsValid(self.top)then self.top=ClientsideModel("models/hunter/plates/plate075x1.mdl",RENDERGROUP_BOTH)self.top:SetMaterial("portal/border")self.top:SetPos(self:GetPos()+self:GetRight()*44.5-self:GetUp()*(12.5+k))self.top:SetParent(self)self.top:SetLocalAngles(Angle(-75,-90,0))self.top:SetNoDraw(true)self.top:EnableMatrix("RenderMultiply",j)end;if!IsValid(self.bottom)then self.bottom=ClientsideModel("models/hunter/plates/plate075x1.mdl",RENDERGROUP_BOTH)self.bottom:SetMaterial("portal/border")self.bottom:SetPos(self:GetPos()-self:GetRight()*44.5-self:GetUp()*(12.5+k))self.bottom:SetParent(self)self.bottom:SetLocalAngles(Angle(-75,90,0))self.bottom:SetNoDraw(true)self.bottom:EnableMatrix("RenderMultiply",j)end;if!IsValid(self.left)then self.left=ClientsideModel("models/hunter/plates/plate075x2.mdl",RENDERGROUP_BOTH)self.left:SetMaterial("portal/border")self.left:SetPos(self:GetPos()+self:GetForward()*20.8-self:GetUp()*(12.5+k))self.left:SetParent(self)self.left:SetLocalAngles(Angle(-75,0,0))self.left:SetNoDraw(true)self.left:EnableMatrix("RenderMultiply",j)end;if!IsValid(self.right)then self.right=ClientsideModel("models/hunter/plates/plate075x2.mdl",RENDERGROUP_BOTH)self.right:SetMaterial("portal/border")self.right:SetPos(self:GetPos()-self:GetForward()*20.8-self:GetUp()*(12.5+k))self.right:SetParent(self)self.right:SetLocalAngles(Angle(-105,0,0))self.right:SetNoDraw(true)self.right:EnableMatrix("RenderMultiply",j)end;if!IsValid(self.back)then self.back=ClientsideModel("models/hunter/plates/plate3x3.mdl",RENDERGROUP_BOTH)self.back:SetMaterial("vgui/black")self.back:SetPos(self:GetPos()-self:GetUp()*42)self.back:SetParent(self)self.back:SetLocalAngles(angle_zero)self.back:SetNoDraw(true)end;self.top:SetParent(self)self.bottom:SetParent(self)self.left:SetParent(self)self.right:SetParent(self)self.hole:SetParent(self)self.back:SetParent(self)end;local o=CreateMaterial("witcherGlow","UnlitGeneric",{["$basetexture"]="sprites/light_glow02",["$basetexturetransform"]="center 0 0 scale 1 1 rotate 0 translate 0 0",["$additive"]=1,["$translucent"]=1,["$vertexcolor"]=1,["$vertexalpha"]=1,["$ignorez"]=1})function ENT:DrawTranslucent()if a(LocalPlayer():EyePos(),self:GetPos()-self:GetUp()*1.8,self:GetUp())then return end;local p=self:GetEnabled()local q=self:GetRealColor()local r=CurTime()-self:GetAnimStart()local s=math.Clamp(r/(p&&0.5||0.1),0,1)if s<=1 then if!self.DisplayColor then self.DisplayColor=Color(255,255,255)end;self.DisplayColor.r=q.x/2*255;self.DisplayColor.g=q.y/2*255;self.DisplayColor.b=q.z/2*255;self.h,self.s,self.l=ColorToHSL(self.DisplayColor)self.l=Lerp(s,self.l||1,p&&0||1)self.col=HSLToColor(self.h,self.s,self.l)end;if p then self.lerpr=Lerp(s,self.lerpr||255,self.col.r)self.lerpg=Lerp(s,self.lerpg||255,self.col.g)self.lerpb=Lerp(s,self.lerpb||255,self.col.b)else self.lerpr=Lerp(s,self.lerpr||0,self.col.r)self.lerpg=Lerp(s,self.lerpg||0,self.col.g)self.lerpb=Lerp(s,self.lerpb||0,self.col.b)end;self.top:SetNoDraw(true)f()if p&&s>0||!p&&s<1 then self.hole:DrawModel()end;h()render.ClearBuffersObeyStencil(self.lerpr,self.lerpg,self.lerpb,0,p)if p&&s>=0.1 then if s>=1 then self.back:DrawModel()end;render.SetColorModulation(q.x*3,q.y*3,q.z*3)self.top:DrawModel()self.bottom:DrawModel()self.left:DrawModel()self.right:DrawModel()render.SetColorModulation(1,1,1)end;i()if!p then return end;local t=self:GetUp()local u=(self:GetPos()-EyePos()):GetNormalized()local v=u:Dot(t*-1)if v>=0 then render.SetColorModulation(1,1,1)local w=util.PixelVisible(self:GetPos()+self:GetUp()*3,20,self.PixVis)if!w then return end;local x=math.Clamp(EyePos():Distance(self:GetPos())/10*v*w,0,30)local y=Color(q.x/2*255,q.y/2*255,q.z/2*255,x)render.SetMaterial(o)render.DrawSprite(self:GetPos()+self:GetUp()*2,600,600,y,w*v)end end end
--addons/!lpakr_out/lua/effects/anzati_ghosts/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=1;if!f then return end;for h=0,d/g do local i=b+c*(d-h*g)local j=f:Add("wos/lightsabers/effects/anzati/halloween",i)if j then j:SetLifeTime(0)j:SetDieTime(0.3)j:SetGravity(Vector(0,0,math.random(32,128)))j:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(math.random(100,200))j:SetEndAlpha(0)j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/anzati_swtor1/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=1;if!f then return end;for h=0,d/g do local i=b+c*(d-h*g)local j=f:Add("wos/lightsabers/effects/anzati/swtor",i)if j then j:SetLifeTime(0)j:SetDieTime(0.3)j:SetGravity(Vector(0,0,math.random(32,128)))j:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(math.random(100,200))j:SetEndAlpha(0)j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/anzati_swtor12/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/drg_blood_explosion.lua:
function EFFECT:Init(a)local b=a:GetEntity()if!IsValid(b)then return end;local c=a:GetFlags()for d=0,b:GetBoneCount()-1 do if b:GetBoneName(d)=="__INVALIDBONE__"then continue end;local e,f=b:GetBonePosition(d)if c==BLOOD_COLOR_RED then ParticleEffect("blood_impact_red_01_goop",e,f,b)elseif c==BLOOD_COLOR_YELLOW then ParticleEffect("blood_impact_yellow_01",e,f,b)elseif c==BLOOD_COLOR_GREEN then ParticleEffect("blood_impact_green_01",e,f,b)elseif c==BLOOD_COLOR_ANTLION then ParticleEffect("blood_impact_antlion_01",e,f,b)elseif c==BLOOD_COLOR_ZOMBIE then ParticleEffect("blood_impact_zombie_01",e,f,b)elseif c==BLOOD_COLOR_ANTLION_WORKER then ParticleEffect("blood_impact_antlion_worker_01",e,f,b)end end end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/dronesrewrite_explosionms.lua:
AddCSLuaFile()function EFFECT:Init(a)self.Start=a:GetOrigin()self.size=320000;self.Emitter=ParticleEmitter(self.Start)local b=self.Emitter:Add("particle/warp3_warp_noz",self.Start)b:SetDieTime(0.3)b:SetStartSize(200)for c=1,200 do local d=VectorRand()local b=self.Emitter:Add("effects/fleck_cement"..math.random(1,2),self.Start)b:SetDieTime(math.random(8,15))b:SetStartAlpha(255)b:SetEndAlpha(0)b:SetStartSize(math.random(60,90))b:SetRoll(math.Rand(-10,10))b:SetRollDelta(math.Rand(-10,10))b:SetVelocity(d*5000)b:SetAirResistance(10)b:SetGravity(Vector(0,0,math.random(-500,-200)))b:SetColor(0,0,0)end;for c=1,180 do local b=self.Emitter:Add("particle/smokesprites_000"..math.random(1,3),self.Start)b:SetDieTime(4)b:SetStartAlpha(255)b:SetEndAlpha(0)b:SetStartSize(math.random(1000,2000))b:SetRoll(math.Rand(-10,10))b:SetRollDelta(math.Rand(-5,5))b:SetEndSize(math.random(7000,8000))local d=Angle(0,c*2,0)b:SetVelocity(d:Forward()*math.random(7000,8000))b:SetColor(0,0,0)end;for c=6,math.random(5,15)do local d=VectorRand()for e=1,15 do local b=self.Emitter:Add("particle/smokesprites_000"..math.random(1,3),self.Start+d*e*300)b:SetDieTime(math.Rand(8,14))b:SetStartAlpha(math.random(150,200))b:SetEndAlpha(0)b:SetStartSize(300)b:SetRoll(math.Rand(-10,10))b:SetRollDelta(math.Rand(-0.2,0.2))b:SetEndSize(2000)b:SetGravity(Vector(0,0,-e*math.Rand(1,2)))b:SetVelocity(VectorRand()*100)b:SetAirResistance(e)b:SetCollide(true)b:SetColor(10,10,5)end end;self.Emitter:Finish()end;function EFFECT:Think()self.size=self.size-5000;return self.size>0 end;function EFFECT:Render()render.SetMaterial(Material("sprites/light_ignorez"))render.DrawSprite(self.Start,self.size*2,self.size,Color(255,255,255,255))end
--addons/!lpakr_out/gamemodes/srp_base/entities/effects/effect_kiss.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/fireworks_may4th.lua:
local a=Material'effects/sw_laser_yellow_main'local b=Material'effects/sw_laser_blue_main'function EFFECT:Init(c)self.Origin=c:GetOrigin()self.EndTime=CurTime()+20;self.Ships={}local d=ParticleEmitter(self.Origin,false)for e=0,500 do local f=self.Origin-Vector(600,0,0)-self:GetAngles():Forward()+Vector(math.Rand(0,500),math.Rand(-500,500),1)local g=self:GetAngles():Forward()*math.Rand(-500,4500)local h=d:Add(math.random()<0.5&&a||b,f)if h then h:SetVelocity(g)h:SetAngles(Angle(90,0,0))h:SetLifeTime(0)h:SetDieTime(6)h:SetStartAlpha(math.random(220,255))h:SetEndAlpha(0)h:SetStartSize(math.random(1,3))h:SetEndSize(math.random(3,6))h:SetAirResistance(math.Rand(130,150))h:SetColor(255,255,255)h:SetCollide(false)end end;d:Finish()SafeRemoveEntityDelayed(self,20)timer.Simple(20,function()if IsValid(d)then d:Finish()end end)end;function EFFECT:SpawnModel(i,j,k,l,m)if!CLIENT then return end;local n=ents.CreateClientProp(i)n.scaleInt=0;n.endScale=j;n.direction=k||1;n:PhysicsInit(SOLID_VPHYSICS)n:SetMoveType(MOVETYPE_NONE)n:SetModelScale(0,0)if IsValid(n:GetPhysicsObject())then n:GetPhysicsObject():EnableMotion(false)end;n:SetPos(self.Origin+l)n:SetLocalAngles(m)SafeRemoveEntityDelayed(n,20)table.insert(self.Ships,n)end;function EFFECT:Think()return CurTime()<self.EndTime end;function EFFECT:Render()for o,n in ipairs(self.Ships)do if IsValid(n)then n.scaleInt=Lerp(FrameTime()/1*3,n.scaleInt,n.endScale)n:SetModelScale(n.scaleInt,0)n:SetPos(n:GetPos()+n:GetForward()*n.direction*.2)end end end
--addons/!lpakr_out/lua/effects/fireworks_newyear23.lua:
local a=Material'materials/galactic/ui/sith.png'function EFFECT:Init(b)self.Origin=b:GetOrigin()self.StartTime=CurTime()local c=ParticleEmitter(self.Origin,false)for d=0,50 do local e=VectorRand():GetNormal()*math.Rand(1000,3500)local f=c:Add(a,self.Origin)if f then local g=math.random(25,255)f:SetVelocity(e)f:SetLifeTime(0)f:SetDieTime(6)f:SetStartAlpha(math.random(220,255))f:SetEndAlpha(0)f:SetStartSize(math.random(5,10))f:SetEndSize(math.random(30,60))f:SetAirResistance(math.Rand(130,150))f:SetColor(255,g,g)f:SetCollide(false)f:SetBounce(1)end end;c:Finish()SafeRemoveEntityDelayed(self,15)local h=EffectData()h:SetOrigin(self:GetPos()+Vector(-1000,0,0))h:SetStart(Vector(200,35,35))h:SetScale(1)util.Effect('firework_explosion',h,true,true)local h=EffectData()h:SetOrigin(self:GetPos()+Vector(1000,0,0))h:SetStart(Vector(200,35,35))h:SetScale(1)util.Effect('firework_explosion',h,true,true)end;function EFFECT:Think()return CurTime()<self.StartTime+0.5 end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/fireworks_newyear25.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/fxbase.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/jump_out.lua:
return lpakr()()
--addons/ssrp_lfs/lua/effects/lvs_laat_left_projector.lua:
EFFECT.Mat = Material( "effects/lvs/ballturret_projectorbeam" )
EFFECT.HitMat = Material( "sprites/light_glow02_add" )

local white = Color(255, 255, 255, 255)
local green = Color(0,255,0,255)

function EFFECT:Init( data )
	self.Entity = data:GetEntity()

	if IsValid( self.Entity ) then
		self.ID = self.Entity:LookupAttachment( "muzzle_ballturret_left" )

		if self.ID then
			local Muzzle = self.Entity:GetAttachment( self.ID )

			self:SetRenderBoundsWS( self.Entity:GetPos(), Muzzle.Ang:Up() * 50000 )
		end
	end
end

function EFFECT:Think()
	if not IsValid( self.Entity ) or not self.ID or not self.Entity:GetBTLFire() then
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

--addons/ssrp_lfs/lua/effects/lvs_tracer_yellow.lua:

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

	render.DrawBeam( endpos - dir * len, endpos + dir * len * 0.1, 10, 1, 0, Color( 255, 80, 0, 255 ) )
	render.DrawBeam( endpos - dir * len * 0.5, endpos + dir * len * 0.1, 5, 1, 0, Color( 255, 255, 0, 255 ) )

	render.SetMaterial( self.MatSprite ) 
	render.DrawSprite( endpos, 400, 400, Color( 125, 80, 0, 255 ) )
end

--addons/!lpakr_out/lua/effects/portal_inhale/init.lua:
AddCSLuaFile()function EFFECT:Init(a)self.emitter=ParticleEmitter(a:GetOrigin())self.ent=a:GetEntity()end;function EFFECT:GetEntity()return IsValid(self.ent)&&self.ent||false end;function EFFECT:Think()if self:GetEntity()then if self:GetEntity():GetEnabled()then local b=CurTime()if(self.nextParticle||0)<b then local c=self:GetEntity()self.nextParticle=b+0.1;local d=c:GetPos()+c:GetUp()*math.random(7,70)+c:GetRight()*math.random(-47,47)+c:GetForward()*math.random(-24,24)local e=self:GetEntity():GetUp()*-1;local f=self.emitter:Add("particle/particle_glow_05_addnofog",d)local g=self:GetEntity():GetRealColor()/2*255;f:SetDieTime(1.2)f:SetGravity(e*100)f:SetVelocity(e*50)f:SetColor(g.x,g.y,g.z)f:SetAirResistance(100)f:SetStartAlpha(255)f:SetRoll(math.random(0,360))f:SetStartSize(math.random(1,2))f:SetEndSize(0)f:SetVelocityScale(true)f:SetLighting(false)end end;return true else self.emitter:Finish()return false end end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/sup_laser_green.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/sup_laser_green_lime.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/sup_laser_maroon.lua:
EFFECT.Speed=20000;EFFECT.Length=50;EFFECT.UseModel=false;local a=Material'effects/sw_laser_red_main'local b=Material'effects/sw_laser_red_front'local c=Vector()function EFFECT:Init(d)self.StartPos=d:GetStart()self.EndPos=d:GetOrigin()self.Scale=d:GetScale()if self.Scale==0 then self.Scale=1 end;local e=d:GetEntity()if!self.StartPos||!self.EndPos||!IsValid(e)then self.DieTime=0;return end;local f=d:GetAttachment()if IsValid(e)then if e.Owner==LocalPlayer()&&LocalPlayer():GetViewModel()!=LocalPlayer()&&!LocalPlayer():ShouldDrawLocalPlayer()then local g=e.Sequence&&(e.Sequence:find('right')&&MuzzlePosition2||MuzzlePosition)||nil;g=g||e.Akimbo&&(e.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition;self.StartPos=g||self.StartPos else local h=e.Akimbo&&(e.AkimboLeftFire&&f||f+1)||f;local f=e:GetAttachment(h)if f&&f.Pos then self.StartPos=f.Pos else self.DieTime=0;return end end end;if self.StartPos==c||self.EndPos==c then self.DieTime=0;return end;self.Dir=(self.EndPos-self.StartPos):GetNormalized()self:SetRenderBoundsWS(self.StartPos+self.Dir,self.EndPos)self.StartTime=CurTime()self.Distance=self.StartPos:Distance(self.EndPos)self.TracerTime=self.Distance/(self.Scale*self.Speed)self.DieTime=self.StartTime+self.TracerTime;local i=EffectData()i:SetOrigin(self.StartPos+self.Dir*10)i:SetNormal(self.Dir)i:SetMagnitude(0)i:SetScale(1)util.Effect('StriderMuzzleFlash',i)end;function EFFECT:Think()if CurTime()>(self.DieTime||0)then return false end;return true end;function EFFECT:Render()if srp.nvg.IsEnabled()then return end;if CurTime()>=(self.DieTime||0)then return end;local j=self.Scale||1;local k=(CurTime()-self.StartTime)/self.TracerTime;if k<0 then return end;local l=self.StartPos+self.Dir*self.Distance*k;local m=l+self.Dir*(math.random(-10,20)+self.Length*j)if a then render.SetMaterial(a)render.DrawBeam(l,m,j*24,0,1,col.maroon)end;if b then render.SetMaterial(b)render.DrawSprite(m,j*24,j*24,col.maroon)end;self.dlight=DynamicLight(self:EntIndex())if self.dlight then self.dlight.pos=m;self.dlight.r=144;self.dlight.g=12;self.dlight.b=63;self.dlight.brightness=2;self.dlight.Decay=2000;self.dlight.Size=700;self.dlight.DieTime=CurTime()+.1 end end
--addons/!lpakr_out/lua/effects/sup_laser_orange.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/sup_laser_yellow_mando.lua:
EFFECT.Speed=20000;EFFECT.Length=50;EFFECT.UseModel=false;local a=Material'effects/sw_laser_yellow_main'local b=Material'effects/sw_laser_yellow_front'local c=Vector()function EFFECT:Init(d)self.StartPos=d:GetStart()self.EndPos=d:GetOrigin()self.Scale=d:GetScale()if self.Scale==0 then self.Scale=1 end;local e=d:GetEntity()if!self.StartPos||!self.EndPos||!IsValid(e)then self.DieTime=0;return end;local f=d:GetAttachment()if IsValid(e)&&f>0 then if e.Owner==LocalPlayer()&&LocalPlayer():GetViewModel()!=LocalPlayer()&&!LocalPlayer():ShouldDrawLocalPlayer()then local g=e.Sequence&&(e.Sequence:find('right')&&MuzzlePosition2||MuzzlePosition)||nil;g=g||e.Akimbo&&(e.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition;self.StartPos=g||self.StartPos else local h=e.Akimbo&&(e.AkimboLeftFire&&f||f+1)||f;local f=e:GetAttachment(h)if f&&f.Pos then self.StartPos=f.Pos else self.DieTime=0;return end end end;if self.StartPos==c||self.EndPos==c then self.DieTime=0;return end;self.Dir=(self.EndPos-self.StartPos):GetNormalized()self:SetRenderBoundsWS(self.StartPos+self.Dir,self.EndPos)self.StartTime=CurTime()self.Distance=self.StartPos:Distance(self.EndPos)self.TracerTime=self.Distance/(self.Scale*self.Speed)self.DieTime=self.StartTime+self.TracerTime;local i=EffectData()i:SetOrigin(self.StartPos+self.Dir*10)i:SetNormal(self.Dir)i:SetMagnitude(0)i:SetScale(1)util.Effect('StriderMuzzleFlash',i)end;function EFFECT:Think()if CurTime()>self.DieTime then return false end;return true end;function EFFECT:Render()if CurTime()>=self.DieTime then return end;local j=self.Scale||1;local k=(CurTime()-self.StartTime)/self.TracerTime;if k<0 then return end;local l=self.StartPos+self.Dir*self.Distance*k;local m=l+self.Dir*(math.random(15,20)+self.Length*j)if a then render.SetMaterial(a)render.DrawBeam(l,m,j*15,0,1,col.white)end;if b then render.SetMaterial(b)render.DrawSprite(m,j*15,j*15,col.white)end;if srp.nvg.IsEnabled()then return end;self.dlight=DynamicLight(self:EntIndex())if self.dlight then self.dlight.pos=m;self.dlight.r=230;self.dlight.g=200;self.dlight.b=0;self.dlight.brightness=2;self.dlight.Decay=2000;self.dlight.Size=700;self.dlight.DieTime=CurTime()+1 end end
--addons/!lpakr_out/lua/effects/thruster_ring.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/chatbox/init_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/player_blocking/init_sh.lua:
ba.AddCommand('Block'):RunOnClient(function(a)if a==LocalPlayer()then return end;if!a:IsBlocked()then a:Block(true)end end):AddParam(cmd.PLAYER_ENTITY):SetIgnoreImmunity(true):SetHelp'Blocks a player'ba.AddCommand('Unblock'):RunOnClient(function(a)if a==LocalPlayer()then return end;if a:IsBlocked()then a:Block(false)end end):AddParam(cmd.PLAYER_ENTITY):SetIgnoreImmunity(true):SetHelp'Unblocks a player'
--addons/!lpakr_out/lua/badmin/modules/ssrp/terms_sh.lua:
term.Add('YourVIPRestored','Your VIP has been restored!')term.Add('RewardDiscord','You\'ve been given 250 credits for joining our Discord!')term.Add('RewardSteam','You\'ve been given 250 credits for joining our Steam Group!')term.Add('RewardSteamName','You\'ve been given 5 credits for your Steam name!')ba.logs.RegisterConverter('Location',function(a)if!a then return a end;local b=string.Explode(' ',a,false)if#b!=3 then return a end;local c,d,e=tonumber(b[1]),tonumber(b[2]),tonumber(b[3])local f=srp.loc.GetPosition(Vector(c,d,e))return f&&f.name||'Unknown Location'end)
--addons/!lpakr_out/lua/badmin/modules/ssrp/logs/jail_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/ssrp/logs/gm_sh.lua:
local a=ba.logs.Term;ba.logs.AddTerm('GamasterCommand','#(#) has ran #',{'Name','SteamID','CommandName'})ba.logs.AddTerm('GamasterCommandArgs','#(#) has ran # with args: #',{'Name','SteamID','CommandName','Arguments'})local function b(c)return isentity(c)&&c.SteamID&&c:SteamID()||tostring(c)end;local function d(e)local f={}for g,c in ipairs(e)do if istable(c)then for h,i in ipairs(c)do f[#f+1]=b(i)end else f[#f+1]=b(c)end end;return table.concat(f,', ')end;ba.logs.Create('GameMaster',false):Hook('cmd.OnCommandRun',function(self,j,k,f)if k:GetConCommand()=='ssrp'&&k.gamemaster then local l,m=j:Nick(),j:SteamID()local n=k:GetName()local o=d(f)local p=o==''&&a('GamasterCommand')||a('GamasterCommandArgs')self:Log(p,l,m,n,o)end end)