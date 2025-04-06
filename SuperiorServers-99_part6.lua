--Stealed clientside server code by exechack.cc
--Hostname: !💠⇛SuperiorServers.co - CWRP - UPDATED MAP & CONTENT! - Part 6/12 - 06/04/2025


--PATH addons/badmin/lua/includes/init.lua:
-- Init
if (SERVER) then
	AddCSLuaFile()
	AddCSLuaFile 'dash/init.lua'
end
include 'dash/init.lua'

dash.IncludeSH '_init.lua'

-- Extensions
for k, v in pairs(dash.LoadDir('extensions')) do
	dash.IncludeSH(v)
end
for k, v in pairs(dash.LoadDir('extensions/server')) do
	dash.IncludeSV(v)
end
for k, v in pairs(dash.LoadDir('extensions/client')) do
	dash.IncludeCL(v)
end
--addons/!lpakr_out/lua/dash/preload/client/lpakr_cl.lua:
file.CreateDir'sup/lpakr/cw'local a={r=255,g=0,b=0,a=255}local b={r=0,g=75,b=235,a=255}local c={r=255,g=255,b=255,a=255}local d={r=150,g=175,b=200,a=255}local function e(...)MsgC(b,'[lPakr] ',c,unpack{...})MsgN()end;local function f(...)e(a,'[ERROR] ',c,...)end;local function g(h,i)local j=10^(i||2)return math.floor(h*j+0.5)/j end;e'Init'local k=false;local l=SysTime()local m='lpakr-2837596064.dat'local n='sup/lpakr/cw/'..m;local o,p=file.Find('sup/lpakr/cw/*.dat','DATA')for q,r in ipairs(o)do if r!=m then e('Pruning old datapack: ',d,r)file.Delete('sup/lpakr/cw/'..r)end end;local s=0;local t={}local u;local function v()local w=SysTime()u=file.Open(n,'rb','DATA')if!u then f('Unable to open cached datapack: ',d,m)return false end;local x=u:Read(u:Size())if!x then f('Cached datapack data is nil: ',d,m)u:Close()return false end;local y=util.SHA256(x)if y!='c05703e8f11948ee93b9e07359ea23edd4d8224b3f5d8bd8b09b4fd7ada8df93'then f('File hash mismatch: expected',d,'"c05703e8f11948ee93b9e07359ea23edd4d8224b3f5d8bd8b09b4fd7ada8df93"',c,' got ',d,'"'..y..'"')u:Close()return false end;x=nil;collectgarbage()u:Seek(0)local z=u:ReadULong()local A=0;for B=1,z do local C,D=u:ReadLine(),u:ReadULong()t['addons/!lpakr_out/'..C:sub(1,C:len()-1)]={Origin=A,Len=D}A=A+D end;s=u:Tell()local E=SysTime()-w;e('Mounted datapack: ',d,m,c,' in ',d,g(E,4),c,' seconds')e('Loaded ',d,z,c,' files')e('Finished in ',d,g(SysTime()-l,4),c,' seconds')k=true;return true end;local F='lpakr-2837596064.bsp'local G='download/data/sup/lpakr/cw/'..F;local function H()local I=file.Open(G,'rb','GAME')if!I then f('Unable to open datapack: ',d,F)return false end;local J=I:Size()local K=I:Read(J)I:Close()if!K then f('Unable to read datapack: ',d,F)return false end;local x=util.Decompress(K)K=nil;collectgarbage()if!x then f('Unable to decompress datapack: ',d,F)return false end;local L=file.Open(n,'wb','DATA')if!L then f('Unable to open outfile for datapack: ',d,F)L:Close()return false end;L:Write(x)L:Close()x=nil;collectgarbage()e('Cached datapack: ',d,F,c,' in ',d,g(SysTime()-l,4),c,' seconds')return true end;local function M(N,O)if!hook then require'hook'end;hook.Add('Think','lpakr.Think',function()if LocalPlayer():IsValid()then net.Start'lpakr.Error'net.WriteString(N)net.WriteUInt(O,12)net.SendToServer()hook.Remove('Think','lpakr.Think')end end)end;local function P(O)M('Missing content!\nMake sure you have server downloads on, restart your game and try again.\n'..'Error #'..O,O)end;local Q;local function R()local S='Loading content...'Q=vgui.Create('Panel')Q:SetSize(ScrW(),ScrH())Q:MakePopup()Q:DoModal()function Q:Paint(T,U)surface.SetDrawColor(0,0,0)surface.DrawRect(0,0,T,U)surface.SetFont('DermaLarge')local V,W=surface.GetTextSize(S)surface.SetTextColor(255,255,255)surface.SetTextPos((T-V)*0.5,(U-W)*0.5)surface.DrawText(S)end end;local X,Y=0,3;local function Z()X=X+1;if!Q then R()end;HTTP{url='https://r2-cdn.superiorservers.co/fastdl/data/sup/lpakr/cw/'..F,method='GET',success=function(O,_,a0)local x=util.Decompress(_)if!x then f('Unable to decompress HTTP\'d datapack: ',d,F)if X<Y then Z()else O=tonumber(O)P(O!=200&&O||1)end;return end;local I=file.Open(n,'wb','DATA')if!I then f('Unable to open outfile for HTTP\'d datapack: ',d,F)if X<Y then Z()else P(2)end;return end;I:Write(x)I:Close()e('Fetched ',d,F,c,' over HTTP')e'Reconnecting'RunConsoleCommand'retry'end,failed=function(a1)if X<=Y then Z()else P(3)end end,timeout=60}e('Fetching ',d,F,c,' over HTTP try ',d,X..'/'..Y)end;if file.Exists(n,'DATA')then if!v()then if file.Exists(G,'GAME')then if!H()then Z()end else Z()end end elseif file.Exists(G,'GAME')then if!H()then Z()else if!v()then Z()end end else Z()end;if!k then function lpakr()return function()end end;return false end;local a2=debug.getinfo;local a3=string.sub;local CompileString=CompileString;local a4=file.Open;function lpakr()local a5=a2(2,'S')local a6=a3(a5.source,2)local a7=t[a6]if!a7 then return function()f('Calling lpakr() from unmounted file: ',d,a6)end end;u:Seek(s+a7.Origin)local a8=u:Read(a7.Len)if!a8 then return function()f('Unable to read file: ',d,a6)end end;return CompileString(a8,a6)end
--addons/!lpakr_out/lua/dash/extensions/table.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/extensions/type.lua:
local getmetatable=getmetatable;local tonumber=tonumber;local a=getmetatable''local b=FindMetaTable'Angle'local c=FindMetaTable'VMatrix'local d=FindMetaTable'Vector'local e=FindMetaTable'IMaterial'local f=FindMetaTable'Entity'local g=FindMetaTable'Player'local h=FindMetaTable'PhysObj'local i=FindMetaTable'Weapon'local j=FindMetaTable'NPC'local k=FindMetaTable'NextBot'local l=FindMetaTable'Vehicle'local m=FindMetaTable'CSEnt'local n={[f]=true,[l]=true,[h]=true,[i]=true,[j]=true,[g]=true}if SERVER then else n[m]=true end;function isstring(o)return getmetatable(o)==a end;function isangle(o)return getmetatable(o)==b end;function ismatrix(o)return getmetatable(o)==c end;function isvector(o)return getmetatable(o)==d end;function ismaterial(o)return getmetatable(o)==e end;function isnumber(o)return o!=nil&&o==tonumber(o)end;function isbool(o)return o==true||o==false end;function isentity(o)return n[getmetatable(o)]==true end;IsEntity=isentity;function isplayer(o)return getmetatable(o)==g end;function f:IsPlayer()return false end;function g:IsPlayer()return true end;function h:IsPlayer()return false end;function i:IsPlayer()return false end;function j:IsPlayer()return false end;function f:IsWeapon()return false end;function g:IsWeapon()return false end;function h:IsWeapon()return false end;function i:IsWeapon()return true end;function j:IsWeapon()return false end;function f:IsNPC()return false end;function g:IsNPC()return false end;function h:IsNPC()return false end;function i:IsNPC()return false end;function j:IsNPC()return true end;function f:IsNextbot()return false end;function g:IsNextbot()return false end;function h:IsNextbot()return false end;function i:IsNextbot()return false end;function j:IsNextbot()return false end;function f:IsPhysObj()return false end;function g:IsPhysObj()return false end;function h:IsPhysObj()return false end;function i:IsPhysObj()return false end;function j:IsPhysObj()return false end;if SERVER then else function f:IsCSEnt()return false end;function g:IsCSEnt()return false end;function i:IsCSEnt()return false end;function j:IsCSEnt()return false end;function l:IsCSEnt()return false end;function m:IsPlayer()return false end;function m:IsWeapon()return false end;function m:IsNPC()return false end;function m:IsVehicle()return false end;function m:IsCSEnt()return true end end
--addons/!lpakr_out/lua/dash/extensions/client/surface.lua:
do local a={{},{},{},{}}local b,c,d,e=a[1],a[2],a[3],a[4]local f=surface.DrawPoly;function surface.DrawQuad(g,h,i,j,k,l,m,n)b.x,b.y=g,h;c.x,c.y=i,j;d.x,d.y=k,l;e.x,e.y=m,n;f(a)end;local o={{},{},{},{}}local p,q,r,s=o[1],o[2],o[3],o[4]local t,u=math.min,math.max;function surface.DrawQuadUV(g,h,i,j,k,l,m,n)local v,w=u,u;local x,y=t,t;v=g;if i<v then v=i end;if k<v then v=k end;if m<v then v=m end;w=h;if j<w then w=j end;if l<w then w=l end;if n<w then w=n end;x=g;if i>x then x=i end;if k>x then x=k end;if m>x then x=m end;y=h;if j>y then y=j end;if l>y then y=l end;if n>y then y=n end;local z=y-w;local A=x-v;p.u,p.v=(g-v)/A,(h-w)/z;q.u,q.v=(i-v)/A,(j-w)/z;r.u,r.v=(k-v)/A,(l-w)/z;s.u,s.v=(m-v)/A,(n-w)/z;p.x,p.y=g,h;q.x,q.y=i,j;r.x,r.y=k,l;s.x,s.y=m,n;f(o)end;local B=surface.DrawLine;function surface.DrawOutlinedQuad(g,h,i,j,k,l,m,n)B(g,h,i,j)B(i,j,k,l)B(k,l,m,n)B(m,n,g,h)end end;do local C,D=math.cos,math.sin;local E=3.141592653589/180;local F=surface.DrawQuad;function surface.DrawArc(G,H,I,J,K,L,M)K,L=K*E,L*E;local N=(L-K)/M;local O=M;local P,Q,R,S,T;S,T=C(K),D(K)for U=0,M-1 do P=U*N+K;Q,R=S,T;S,T=C(P+N),D(P+N)F(G+Q*I,H+R*I,G+Q*J,H+R*J,G+S*J,H+T*J,G+S*I,H+T*I)O=O-1;if O<0 then break end end end end;do local C,D=math.cos,math.sin;local E=3.141592653589/180;local B=surface.DrawLine;function surface.DrawArcOutline(G,H,I,J,K,L,M)K,L=K*E,L*E;local N=(L-K)/M;local O=M;local P,Q,R,S,T;S,T=C(K),D(K)B(G+S*I,H+T*I,G+S*J,H+T*J)for U=0,M-1 do P=U*N+K;Q,R=S,T;S,T=C(P+N),D(P+N)B(G+Q*J,H+R*J,G+S*J,H+T*J)B(G+Q*I,H+R*I,G+S*I,H+T*I)O=O-1;if O<0 then break end end;B(G+S*I,H+T*I,G+S*J,H+T*J)end end;do local V=surface.SetFont;local W=surface.GetTextSize;local X='TargetID'local Y=setmetatable({},{__mode='k'})timer.Create('surface.ClearFontCache',1800,0,function()for Z=1,#Y do Y[Z]=nil end end)function surface.SetFont(_)X=_;return V(_)end;function surface.GetTextSize(a0)if!Y[X]then Y[X]={}end;if!Y[X][a0]then local a1,a2=W(a0)Y[X][a0]={w=a1,h=a2}return a1,a2 end;return Y[X][a0].w,Y[X][a0].h end end
--addons/!lpakr_out/lua/areatrigger/ui/menu_ui.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/thirdparty/pon/pon.lua:
local a={}_G.pon=a;local type,b=type,table.Count;local tonumber=tonumber;local c=string.format;do local type,b=type,table.Count;local tonumber=tonumber;local c=string.format;local d={}local e;local f=0;d['table']=function(self,g,output,h)if h[g]then output[#output+1]=c('(%x)',h[g])return else f=f+1;h[g]=f end;local i=next(g,nil)local j=1;local k=nil;if i==1 then output[#output+1]='{'for l,m in next,g do if l==j then j=j+1;local n=type(m)if n=='string'then local o=h[m]if o then output[#output+1]=c('(%x)',o)else f=f+1;h[m]=f;self.string(self,m,output,h)end else self[n](self,m,output,h)end else break end end;j=j-1 else j=nil end;if j==nil then output[#output+1]='['else output[#output+1]='~'end;for l,m in next,g,j do local p,n=type(l),type(m)if p=='string'then local o=h[l]if o then output[#output+1]=c('(%x)',o)else f=f+1;h[l]=f;self.string(self,l,output,h)end else self[p](self,l,output,h)end;if n=='string'then local o=h[m]if o then output[#output+1]=c('(%x)',o)else f=f+1;h[m]=f;self.string(self,m,output,h)end else self[n](self,m,output,h)end end;output[#output+1]='}'end;local q=string.gsub;d['string']=function(self,r,output)local s,b=q(r,";","\\;")if b==0 then output[#output+1]='\''..r..';'else output[#output+1]='"'..s..'";'end end;d['number']=function(self,t,output)if t%1==0 then if t<0 then output[#output+1]=c('x%x;',-t)else output[#output+1]=c('X%x;',t)end else output[#output+1]=tonumber(t)..';'end end;d['boolean']=function(self,u,output)output[#output+1]=u&&'t'||'f'end;d['Vector']=function(self,u,output)output[#output+1]=('v'..u.x..','..u.y)..','..u.z..';'end;d['Angle']=function(self,u,output)output[#output+1]=('a'..u.p..','..u.y)..','..u.r..';'end;d['Entity']=function(self,u,output)output[#output+1]='E'..(IsValid(u)&&u:EntIndex()..';'||'#')end;d['Player']=d['Entity']d['Vehicle']=d['Entity']d['Weapon']=d['Entity']d['NPC']=d['Entity']d['NextBot']=d['Entity']d['PhysObj']=d['Entity']d['nil']=function()output[#output+1]='?'end;d.__index=function(v)ErrorNoHalt('Type: '..v..' can not be encoded. Encoded as as pass-over value.')return d['nil']end;do local w,x=table.Empty,table.concat;function a.encode(g)local output={}f=0;d['table'](d,g,output,{})local y=x(output)return y end end end;do local tonumber=tonumber;local z,A,q,B=string.find,string.sub,string.gsub,string.Explode;local Vector,Angle,Entity=Vector,Angle,Entity;local C={}C['{']=function(self,D,r,h)local E={}h[#h+1]=E;local l,m,p,n=1,nil,nil,nil;while true do n=A(r,D,D)if!n||n=='~'then D=D+1;break end;if n=='}'then return D+1,E end;D=D+1;D,m=self[n](self,D,r,h)E[l]=m;l=l+1 end;while true do p=A(r,D,D)if!p||p=='}'then D=D+1;break end;D=D+1;D,l=self[p](self,D,r,h)n=A(r,D,D)D=D+1;D,m=self[n](self,D,r,h)E[l]=m end;return D,E end;C['[']=function(self,D,r,h)local E={}h[#h+1]=E;local l,m,p,n=1,nil,nil,nil;while true do p=A(r,D,D)if!p||p=='}'then D=D+1;break end;D=D+1;D,l=self[p](self,D,r,h)if!l then continue end;n=A(r,D,D)D=D+1;if!self[n]then print('did not find type: '..n)end;D,m=self[n](self,D,r,h)E[l]=m end;return D,E end;C['"']=function(self,D,r,h)local F=z(r,'";',D,true)local y=q(A(r,D,F-1),'\\;',';')D=F+2;h[#h+1]=y;return D,y end;C['\'']=function(self,D,r,h)local F=z(r,';',D,true)local y=A(r,D,F-1)D=F+1;h[#h+1]=y;return D,y end;C['n']=function(self,D,r,h)D=D-1;local F=z(r,';',D,true)local t=tonumber(A(r,D,F-1))D=F+1;return D,t end;C['0']=C['n']C['1']=C['n']C['2']=C['n']C['3']=C['n']C['4']=C['n']C['5']=C['n']C['6']=C['n']C['7']=C['n']C['8']=C['n']C['9']=C['n']C['-']=C['n']C['X']=function(self,D,r,h)local F=z(r,';',D,true)local t=tonumber(A(r,D,F-1),16)D=F+1;return D,t end;C['x']=function(self,D,r,h)local F=z(r,';',D,true)local t=-tonumber(A(r,D,F-1),16)D=F+1;return D,t end;C['(']=function(self,D,r,h)local F=z(r,')',D,true)local t=tonumber(A(r,D,F-1),16)D=F+1;return D,h[t]end;C['t']=function(self,D)return D,true end;C['f']=function(self,D)return D,false end;C['v']=function(self,D,r,h)local F=z(r,';',D,true)local G=A(r,D,F-1)D=F+1;local H=B(',',G,false)return D,Vector(tonumber(H[1]),tonumber(H[2]),tonumber(H[3]))end;C['a']=function(self,D,r,h)local F=z(r,';',D,true)local I=A(r,D,F-1)D=F+1;local H=B(',',I,false)return D,Angle(tonumber(H[1]),tonumber(H[2]),tonumber(H[3]))end;C['E']=function(self,D,r,h)if r[D]=='#'then D=D+1;return D,NULL else local F=z(r,';',D,true)local t=tonumber(A(r,D,F-1))D=F+1;return D,Entity(t)end end;C['P']=function(self,D,r,h)local F=z(r,';',D,true)local t=tonumber(A(r,D,F-1))D=F+1;return D,Entity(t)||NULL end;C['?']=function(self,D,r,h)return D+1,nil end;function a.decode(J)local K,y=C[A(J,1,1)](C,2,J,{})return y end end
--addons/!lpakr_out/lua/ui/colors.lua:
ui.col={SUP=Color(51,128,255),Header=Color(15,15,15,255),Gradient=Color(85,85,85,200),Background=Color(10,10,10,160),Outline=Color(75,75,75,255),Hover=Color(160,160,160,75),Button=Color(130,130,130,150),ButtonHover=Color(220,220,220,150),ButtonRed=Color(240,0,0),ButtonGreen=Color(0,240,0),ButtonBlack=Color(25,25,25,180),Close=Color(235,235,235),CloseBackground=Color(200,10,10),CloseHovered=Color(235,0,70),TransGrey155=Color(100,100,100,155),TransWhite50=Color(255,255,255,50),TransWhite100=Color(255,255,255,100),OffWhite=Color(200,200,200),DarkGrey=Color(58,58,58),Grey=Color(100,100,100),LightGrey=Color(150,150,150),FlatBlack=Color(45,45,45),Black=Color(0,0,0),White=Color(255,255,255),DarkWhite=Color(200,200,200),Blue=Color(0,50,200),Red=Color(235,10,10),DarkRed=Color(200,10,10),Green=Color(10,235,10),DarkGreen=Color(0,153,51),Orange=Color(245,120,0),Yellow=Color(255,255,51),Gold=Color(212,175,55),Purple=Color(147,112,219),Pink=Color(255,105,180),Brown=Color(139,69,19),Indigo=Color(75,0,130),Violet=Color(148,0,211),LightMidnight=Color(56,56,63),Midnight=Color(45,45,51),DarkMidnight=Color(33,33,37)}if CLIENT then include'theme.lua'end
--addons/!lpakr_out/lua/ui/theme.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/util.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/button.lua:
local a={}function a:Init()self:SetContentAlignment(5)self:SetDrawBorder(true)self:SetPaintBackground(true)self:SetTall(22)self:SetMouseInputEnabled(true)self:SetKeyboardInputEnabled(true)self:SetCursor("hand")self:SetFont('ui.18')self:SetTextColor(ui.col.White)end;function a:AddPanel(b,c)if ispanel(b)then b:SetParent(self)return b else return ui.Create(b,c,self)end end;function a:SetImageColor(d)if IsValid(self.m_Image)then self.m_Image:SetImageColor(d)end end;function a:PerformLayout()if IsValid(self.m_Image)then self:SetContentAlignment(4)self.m_Image:SetPos(5,5)self.m_Image:SetSize(self:GetTall()-10,self:GetTall()-10)surface.SetFont(self:GetFont())local e,f=surface.GetTextSize(self:GetText())local g=self.m_Image:GetWide()+5;self:SetTextInset(self:GetWide()*0.5-e*0.5+g*0.5,0)end;DLabel.PerformLayout(self)end;function a:Paint(h,i)derma.SkinHook('Paint','Button',self,h,i)return false end;function a:SetNoPaint(j)if j then self.O_OldPaint=self.Paint;self.Paint=function()end else if self.O_OldPaint then self.Paint=self.O_OldPaint end end end;function a:SetDisabled(j,k)self.m_bDisabled=j;self:InvalidateLayout()if k&&j then timer.Create(tostring(self),k,1,function()if IsValid(self)then self:SetDisabled(false)end end)else timer.Remove(tostring(self))end;return self end;function a:DoClick()if self.ConfirmationEnabled then if self:IsConfirming()then self:ResetConfirmation()self:DoConfirm()else self.PreConfirmText=self:GetText()self:SetText(self.ConfirmationText||'Click to confirm')local l=SysTime()self.ConfirmationTime=l;if self.ConfirmationHoldEnabled!=false then timer.Simple(self.ConfirmationHold||3,function()if IsValid(self)&&self:IsConfirming()&&self.ConfirmationTime==l then self:ResetConfirmation()end end)end end end end;function a:DoConfirm()end;function a:SetBackgroundColor(d)self.BackgroundColor=d end;function a:SetBorderColor(m)self.BackgroundBorderColor=m end;function a:SetHoverColor(m)self.BackgroundHoverColor=m end;function a:ResetConfirmation()self:SetText(self.PreConfirmText)self.ConfirmedOnce=nil;self.ConfirmationTime=nil;self.PreConfirmText=nil end;function a:EnableConfirmation(n)self.ConfirmationEnabled=n end;function a:EnableConfirmationHold(n)self.ConfirmationHoldEnabled=n end;function a:SetConfirmationText(o)self.ConfirmationText=o end;function a:SetConfirmationHold(p)self.ConfirmationHold=p end;function a:IsConfirming()return self.ConfirmationTime!=nil end;function a:AddFontIcon(q)self.FontIcon=q end;vgui.Register('ui_button',a,'DButton')
--addons/!lpakr_out/lua/ui/controls/listrequest.lua:
local a={}function a:Init()self.OptionList=ui.Create('ui_listview',self)end;function a:PerformLayout()self.OptionList:SetPos(0,0)self.OptionList:SetSize(self:GetWide(),self:GetTall())end;function a:SetOptions(b)self.OptionList:Reset()local c=0;for d,e in ipairs(b)do self.OptionList:AddRow(e).DoClick=function(f)self:OnSelection(f,e)end;c=c+1 end;if c<=0 then self.OptionList:AddSpacer('No options found!')end end;function a:OnSelection(f,g)end;function a:DockToFrame()local h=self:GetParent()local i,j=h:GetDockPos()self:SetPos(i,j)self:SetSize(h:GetWide()-10,h:GetTall()-(j+5))end;vgui.Register('ui_listrequest',a,'Panel')
--addons/!lpakr_out/lua/ui/controls/settings.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/slider.lua:
local a={}function a:Init()self.ButtonContainer=ui.Create('Panel',self)self.ButtonContainer.Paint=function()end;self.Button=ui.Create('ui_button',self.ButtonContainer)self.Button.OnMousePressed=function(b,c)if c==MOUSE_LEFT then self:StartDrag()end end;self.Button:SetText('')self.Button.Paint=function(self,d,e)derma.SkinHook('Paint','SliderButton',self,d,e)end;self:SetValue(0.5)end;function a:PerformLayout()self:SetTall(20)self.ButtonContainer:SetPos(40,0)self.ButtonContainer:SetSize(self:GetWide()-40,self:GetTall())self.Button:SetSize(20,20)self.Button:SetPos(self.Value*(self.ButtonContainer:GetWide()-20),0)end;function a:Paint(d,e)derma.SkinHook('Paint','UISlider',self,d,e)end;function a:Think()if self.Dragging then local f,g=self:CursorPos()f=f-40;f=math.Clamp(f-self.OffX,0,self.ButtonContainer:GetWide()-20)if self.Button.x!=f then self:SetValue(f/(self.ButtonContainer:GetWide()-20))self:OnChange(self.Value)end;if!input.IsMouseDown(MOUSE_LEFT)then self:EndDrag()end end end;function a:StartDrag()self.Dragging=true;self.OffX=self.Button:CursorPos()end;function a:EndDrag()self.Dragging=false;self:OnMouseReleased(self.Value)end;function a:OnMouseReleased(h)end;function a:OnChange(h)end;function a:SetValue(h)self.Value=h;self.Button:SetPos(h*(self.ButtonContainer:GetWide()-20),0)end;function a:GetValue()return self.Value end;vgui.Register('ui_slider',a,'Panel')
--addons/!lpakr_out/lua/badmin/core/core_init.lua:
ba.include_dir'core/util/notifications'dash.IncludeSH'terms_sh.lua'dash.IncludeSV'data_sv.lua'ba.include_dir'core/http'ba.include_dir'core/util'dash.IncludeSH'player_sh.lua'dash.IncludeSH'ranks/groups_sh.lua'dash.IncludeSV'ranks/groups_sv.lua'dash.IncludeSH'ranks/auth_sh.lua'dash.IncludeSV'ranks/auth_sv.lua'dash.IncludeSH'ranks/setup_sh.lua'dash.IncludeSH'commands/commands_sh.lua'dash.IncludeSV'commands/commands_sv.lua'dash.IncludeSV'bans_sv.lua'dash.IncludeSH'gamemaster/gamemaster_sh.lua'dash.IncludeSV'gamemaster/gamemaster_sv.lua'dash.IncludeCL'ui/main_cl.lua'local a,b=file.Find('badmin/core/ui/vgui/*.lua','LUA')for c,d in ipairs(a)do dash.IncludeCL('ui/vgui/'..d)end;dash.IncludeSH'logging/logs_sh.lua'dash.IncludeSV'logging/logs_sv.lua'dash.IncludeCL'logging/logs_cl.lua'dash.IncludeSH'module_loader.lua'ba.include_dir'plugins'
--addons/!lpakr_out/lua/badmin/core/gamemaster/gamemaster_sh.lua:
ba.gamemaster=ba.gamemaster||{}local a=color_white:Copy()local b={[0]={Name='User',Color=a}}local c={}nw.Register'GamemasterRank':Write(net.WriteUInt,4):Read(net.ReadUInt,4):SetPlayer()function ba.gamemaster.Register(d,e)e.Tag=d:upper()e.Color=e.Color&&e.Color:Copy()||a;e.internal=table.insert(b,e)c[d]=e;PLAYER['Is'..e.Name:Replace(' ','')]=function(self,f)local d=self:GetNetVar('GamemasterRank')||0;if e.ExactMatch then return d==e.internal end;if f||!e.StaffFlag then return d&&d>=e.internal||false else return d&&d>=e.internal||self:HasFlag(rp&&'s'||e.StaffFlag)||false end end end;function ba.gamemaster.GetRank(d)return b[d]end;function ba.gamemaster.GetRankByTag(d)return c[d]end;function ba.gamemaster.GetColor(d)local e=b[d]return e&&e.Color||a end;function ba.gamemaster.GetName(d)local e=b[d]||b[0]return e&&e.Name||'User'end;function PLAYER:GetGamemasterID()return self:GetNetVar('GamemasterRank')||0 end;function PLAYER:GetGamemasterName()local g=self:GetGamemasterID()local e=b[g]||b[0]return e.Name end;function PLAYER:GetGamemasterTag()local g=self:GetGamemasterID()local e=b[g]||b[0]return e.Tag end;function PLAYER:GetGamemasterColor()local g=self:GetGamemasterID()local e=b[g]||b[0]return e.Color||a end;ba.gamemaster.Register('gml',{Name='Lite Gamemaster',Color=ui.col.LightGrey,ExactMatch=true})ba.gamemaster.Register('tgm',{Name='Trial Gamemaster',Color=ui.col.Yellow,StaffFlag='A'})ba.gamemaster.Register('gm',{Name='Gamemaster',Color=ui.col.Orange,StaffFlag='A'})ba.gamemaster.Register('vgm',{Name='Veteran Gamemaster',Color=ui.col.Purple,StaffFlag='A'})ba.gamemaster.Register('sgm',{Name='Senior Gamemaster',Color=ui.col.Red,StaffFlag='D'})ba.gamemaster.Register('hgm',{Name='Head Gamemaster',Color=ui.col.Blue,StaffFlag='D'})
--addons/!lpakr_out/lua/badmin/modules/voice_vis/_module.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/plugins/motd_sh.lua:
ba.AddCommand'MoTD':RunOnClient(function(a)ba.OpenMoTD()end):SetHelp'Opens the rules of the server':AddAlias'rules'term.Add('MOTDSet','The MoTD has been set to "#".')ba.AddCommand('SetMoTD',function(b,c)ba.svar.Set('motd',c)ba.notify(b,term.Get('MOTDSet'),c)end):AddParam(cmd.STRING):SetFlag'*':SetHelp'Sets the MoTD URL for the server'ba.AddCommand'SMoTD':RunOnClient(function(a)gui.OpenURL(ba.svar.Get('smotd'))end):SetHelp'Opens the staff MoTD'ba.AddCommand('SetSMoTD',function(b,c)ba.svar.Set('smotd',c)end):AddParam(cmd.STRING):SetFlag'*':SetHelp'Sets the SMoTD URL for the server'local d={{Name='Rules',Icon='sup/gui/generic/rules.png',Callback=function()gui.OpenURL(ba.svar.Get('motd'))end},{Name='Wiki',Icon='sup/gui/generic/supwiki.png',URL='https://wiki.superiorservers.co'},{Name='Forums',Icon='sup/gui/generic/logo.png',URL='https://superiorservers.co/api/auth/login?return=https://forum.superiorservers.co'},{Name='Discord',Icon='sup/gui/generic/discord.png',URL='https://sups.gg/discord'},{Name='Steam',Icon='sup/gui/generic/steam.png',URL='https://steamcommunity.com/groups/SuperiorServers'},{Name='Credit Shop',Icon='sup/gui/generic/credits.png',CMD='upgrades',TextColor=ui.col.Gold}}function ba.OpenMoTD()local e=ui.Create('ui_frame',function(self)self:SetTitle('SUP Links')self:MakePopup()end)local f,g=e:GetDockPos()local h,i=200,f;local j=ui.Create('ui_tablist',function(self,k)self:DockToFrame()end,e)for l,m in ipairs(d)do local n=j:AddButton(m.Name,function()if m.URL then gui.OpenURL(m.URL)elseif m.CMD then cmd.Run(m.CMD)elseif m.Callback then m.Callback()end;if m.Remove then e:Remove()end end)if m.Icon then n:SetIcon(m.Icon)end;if m.TextColor then n:SetTextColor(m.TextColor)end;h=n:GetWide()+22;i=i+n:GetTall()+10 end;e:SetSize(h,i+5)e:Center()j:DockToFrame()end;surface.CreateFont('ba.LoadinScreen',{font='Michroma',size=30,weight=600,antialias=true})surface.CreateFont('ba.LoadedScreen',{font='Michroma',size=24,weight=600,antialias=true})local o={'Loading...','Loading User Data','Networking Initalized','Receiving Data','Validating Data','Done'}local p=ui.col.Background:Copy()local q=Material('sup/gui/generic/logo.png','smooth noclamp')local r=Material('sup/gui/generic/new1.png','smooth noclamp')local s=Color(255,255,255,255)local t=128;local u={}function u:Init()self.Title=ui.Create('ui_button',self)self.Title:SetText'Recent Updates'self.Title:SetEnabled(false)self.Title:Dock(TOP)self.Loading=true;ba.http.FetchJson('changelogs',function(v)if!IsValid(self)then return end;self.Loading=false;for l,m in ipairs(v)do if l>3 then continue end;ui.Create('ui_button',function(w)w:SetText(m.Title)w:Dock(TOP)w:DockMargin(0,5,0,0)w.DoClick=function()gui.OpenURL(m.Url)end;w.Paint=function(w,h,i)derma.SkinHook('Paint','TabButton',w,h,i)end;if os.time()-m.Start<432000 then w.PaintOver=function(w,h,i)surface.SetDrawColor(255,255,255)surface.SetMaterial(r)surface.DrawTexturedRect(h-64,0,64,64)end end end,self)end end)end;function u:PerformLayout(h,i)for l,m in ipairs(self:GetChildren())do m:SetTall(64)end;self.Title:SetHeight(ui.SpacerHeight)end;function u:Paint(h,i)if self.Loading then draw.RoundedBox(5,0,0,h,i,ui.col.Background)local x=SysTime()*5;draw.NoTexture()surface.SetDrawColor(255,255,255)surface.DrawArc(h*0.5,i*0.5,20,25,x*80,x*80+180,20)end end;vgui.Register('ba_load_updates',u,'Panel')u={}function u:Init()self.Rules=self:Button('Rules','sup/gui/generic/rules.png',function()gui.OpenURL(ba.svar.Get('motd'))end)self.Rules:Dock(LEFT)self.Rules:DockMargin(0,0,2.5,0)self.Wiki=self:Button('Wiki','sup/gui/generic/supwiki.png',function()gui.OpenURL('https://wiki.superiorservers.co')end)self.Wiki:Dock(LEFT)self.Wiki:DockMargin(0,0,2.5,0)self.Forums=self:Button('Forums','sup/gui/generic/logo.png','https://superiorservers.co/api/auth/login?return=https://forum.superiorservers.co')self.Forums:Dock(LEFT)self.Forums:DockMargin(2.5,0,0,0)self.Credits=self:Button('Credit Shop','sup/gui/generic/credits.png',function()cmd.Run'upgrades'end)self.Credits:Dock(LEFT)self.Credits:DockMargin(2.5,0,0,0)self.Credits.Think=function()local y=LocalPlayer():GetCredits()self.Credits:SetText(y>0&&'Credit Shop ('..string.Comma(y)..')'||'Credit Shop')end end;function u:Button(z,A,c)return ui.Create('ui_button',function(w)w:SetText(z)w:SetIcon(A)w.DoClick=function()if isfunction(c)then c()else gui.OpenURL(c)end end;w.Paint=function(w,h,i)derma.SkinHook('Paint','TabButton',w,h,i)end end,self)end;function u:PerformLayout(h,i)for l,m in ipairs(self:GetChildren())do m:SetSize(h/4,i)end end;vgui.Register('ba_load_links',u,'Panel')u={}function u:Init()texture.Create('SUP_Background'):EnableProxy(false):Download('https://superiorservers.co/static/images/background.jpg',function(w,B)if IsValid(self)then self.BackgroundMaterial=B end end)self.Messages={}self.MinimizeEnabled=true;self:DockPadding(25,140,25,25)self.Links=ui.Create('ba_load_links',self)self.Links:SetVisible(false)self.Links:Dock(TOP)self.Container=ui.Create('Panel',self)self.Container:SetVisible(false)self.Container:Dock(FILL)self.Container:DockMargin(0,25,0,25)self.Updates=ui.Create('ba_load_updates',self.Container)self.Updates:Dock(LEFT)self.Updates:DockMargin(0,0,2.5,0)self.Rewards=ui.Create('ba_rewards_panel',self.Container)self.Rewards:Dock(RIGHT)self.Rewards:DockMargin(2.5,0,0,0)self.Rewards:FetchData()self.CloseButton=ui.Create('ui_button',self)self.CloseButton:SetText'Close'self.CloseButton:SetVisible(false)self.CloseButton.DoClick=function(w)self:Close()end;self.CloseButton:Dock(BOTTOM)self:SetSize(ScrW(),ScrH())self:Center()self:MakePopup()self:SetCursor'blank'local C=1;timer.Create('ba.LoadingMessages',0.6,#o+1,function()if o[C]then table.insert(self.Messages,o[C])elseif self.MinimizeEnabled then self:SizeTo()else self:LoadingCompleted()end;C=C+1 end)self.HiddenPanels={}for l,m in ipairs(vgui.GetWorldPanel():GetChildren())do if IsValid(m)&&m:IsVisible()&&m!=self then table.insert(self.HiddenPanels,m)m:SetVisible(false)end end;hook.Add('HUDShouldDraw',self,function(w,D)return D=='CHudGMod'||D=='NetGraph'end)hook.Add('HUDPaint',self,function()if hook.Call('PaintLoadinBackground',nil,self)!=true then local h,i=ScrW(),ScrH()p.a=math.min(ui.col.Background.a,self:GetAlpha())draw.Box(0,0,h,i,p)draw.BlurBox(0,0,h,i)draw.BlurResample(10)end end)hook.Call('PlayerOpenedLoadInScreen',nil,self)end;function u:EnableMinize(E)self.MinimizeEnabled=E end;function u:LoadingCompleted()end;function u:OnRemove()for l,m in ipairs(self.HiddenPanels)do if IsValid(m)then m:SetVisible(true)end end;hook.Call('PlayerCloseLoadInScreen',nil,self)end;function u:Think()if self.Anim then self.Anim:Run()end end;function u:PerformLayout(h,i)self.Links:SetTall(ui.SpacerHeight)self.Updates:SetSize(self.Container:GetWide()*0.5-2.5,self.Container:GetTall())self.Rewards:SetSize(self.Updates:GetSize())self.CloseButton:SetTall(ui.SpacerHeight)end;function u:Paint(h,i)if self.BackgroundMaterial then surface.SetDrawColor(255,255,255)surface.SetMaterial(self.BackgroundMaterial)surface.DrawTexturedRect(0,0,h,i)surface.SetDrawColor(ui.col.Outline)surface.DrawOutlinedRect(0,0,h,i)end;if!self.Messages then draw.Box(0,0,h,115,ui.col.Background)surface.SetDrawColor(255,255,255)surface.SetMaterial(q)surface.DrawTexturedRect((h-64)*0.5,10,64,64)draw.SimpleText('Welcome to SUP!','ba.LoadedScreen',h*0.5,79,ui.col.White,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)end;if self.Messages then local F=i*0.25;surface.SetDrawColor(255,255,255)surface.SetMaterial(q)surface.DrawTexturedRect((h-t)*0.5,F,t,t)local G,H=h*0.5,t+F+15;for l,m in ipairs(self.Messages)do s.a=255-l*255/(#o+1)local I,J=draw.SimpleText(m,'ba.LoadinScreen',G,H,s,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)H=H+J+5 end end end;function u:SizeTo(K)local h,i=self:GetSize()local L,M=ScrW()*0.5,math.min(530,ScrH())self.Anim=Derma_Anim('Size Panel',self,function(N,O,P,Q)N:SetSize(Lerp(P,h,L),Lerp(P,i,M))N:Center()if O.Finished then N.Anim=nil;N.Messages=nil;for l,m in ipairs(N:GetChildren())do m:SetVisible(true)end;N:SetCursor'arrow'end end)if self.Anim then self.Anim:Start(0.5)end end;function u:Close()self.Anim=Derma_Anim('Fade Panel',self,function(N,O,P,Q)N:SetAlpha(255-P*255)if O.Finished then self.Anim=nil;self:Remove()end end)if self.Anim then self.Anim:Start(0.2)end end;vgui.Register('ba_load_menu',u,'Panel')hook.Add('InitPostEntity','ba.loadin.InitPostEntity',function()ui.Create('ba_load_menu')end)concommand.Add('load_menu',function()if IsValid(LOAD)then LOAD:Remove()end;LOAD=ui.Create('ba_load_menu')end)
--addons/!lpakr_out/lua/badmin/plugins/util_sh.lua:
term.Add('SeeConsole','See console for output.')ba.AddCommand('Reload',function(a)RunConsoleCommand('changelevel',game.GetMap())end):SetFlag'*':SetHelp'Reloads the map'ba.AddCommand('Restart',function(a)game.GetWorld():Remove()end):SetFlag'*':SetHelp'Restarts the server'ba.AddCommand('Bots',function(a,b)for c=1,tonumber(b)do RunConsoleCommand('bot')end end):AddParam(cmd.UINT):SetFlag'*':SetHelp'Spawns bots'ba.AddCommand('KickBots',function(a)for d,e in ipairs(player.GetBots())do e:Kick()end end):SetFlag'*':SetHelp'Kicks all bots'ba.AddCommand'PO':RunOnClient(function(f)gui.OpenURL('https://superiorservers.co/bans/'..ba.InfoTo32(f))end):AddParam(cmd.PLAYER_STEAMID32):SetHelp'Show\'s a players previous bans':SetIgnoreImmunity(true)local g=Color(220,220,220)local h='\n           'ba.AddCommand('Lookup',function(a,f)ba.notify(a,term.Get('SeeConsole'))end):RunOnClient(function(f)MsgC(g,'---------------------------\n')MsgC(g,f:Name()..'\n')MsgC(g,'---------------------------\n')MsgC(g,'SteamID:'..h..f:SteamID()..'\n')MsgC(g,'Rank:'..h..f:GetRank()..'\n')MsgC(g,'Play Time:'..h..ba.str.FormatTime(f:GetPlayTime())..'\n')end):AddParam(cmd.PLAYER_ENTITY):SetHelp'Show\'s a players rank info':SetIgnoreImmunity(true)local g=Color(200,200,200)ba.AddCommand('Who',function(a)ba.notify(a,term.Get('SeeConsole'))end):RunOnClient(function()MsgC(g,'--------------------------------------------------------\n')MsgC(g,'          SteamID      |      Name      |      Rank\n')MsgC(g,'--------------------------------------------------------\n')for i,e in player.Iterator()do local j=e:SteamID()local k=e:Name()local l=string.format("%s%s %s%s ",j,string.rep(" ",2-j:len()),k,string.rep(" ",20-k:len()))l=l..e:GetRank()MsgC(g,l..'\n')end end):SetHelp'Show\'s the ranks for all users online'ba.AddCommand'Profile':RunOnClient(function(f)ba.ui.OpenAuthLink('/profile/'..ba.InfoTo64(f))end):AddParam(cmd.PLAYER_STEAMID32):SetHelp'Execs lua on your target':SetIgnoreImmunity(true)ba.AddCommand('Exec',function(a,f,m)f:SendLua([[pcall(RunString, ]]..m..[[)]])end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING):SetFlag'*':SetHelp'Execs lua on your target'local n={['afk']=function(o)return table.Filter(o,function(e)return e:IsAFK()end)end,['dead']=function(o)return table.Filter(o,function(e)return!e:Alive()end)end,['all']=function(o)return o end}local p={['rp']='rp.superiorservers.co',['rp2']='rp2.superiorservers.co',['rp3']='rp3.superiorservers.co',['zrp']='zrp.superiorservers.co',['milrp']='milrp.superiorservers.co',['cwrp']='cwrp.superiorservers.co',['cwrp2']='cwrp2.superiorservers.co'}ba.AddCommand('Move',function(a,q,r)local s=q;local t=s:lower()local u;local v=p[r:lower()]if!v then return end;local u=n[t]if u then local o=u(player.GetAll())table.sort(o,function(w,x)return(w.NotAFK||0)>(x.NotAFK||0)end)local y=0;for d,e in ipairs(o)do y=y+1;if y>5 then break end;e:SendLua([[LocalPlayer():ConCommand('connect ]]..v..[[')]])end;ba.notify(a,term.Get('AdminMovedPlayers'),tostring(y))else local z=player.Find(s)if z then z:SendLua([[LocalPlayer():ConCommand('connect ]]..v..[[')]])return else ba.notify(a,term.Get('PlayerNotFound'),s)end end end):AddParam(cmd.STRING):AddParam(cmd.STRING):SetFlag'*':SetHelp('Moves the given set of players to the other server. Categories: '..table.ConcatKeys(n,', ')..'.')
--addons/!lpakr_out/lua/drgbase/entity_helpers.lua:
if!istable(ENT)then return end;function ENT:PrintPoseParameters()for a=0,self:GetNumPoseParameters()-1 do local b,c=self:GetPoseParameterRange(a)print(self:GetPoseParameterName(a).." "..b.." / "..c)end end;function ENT:PrintAnimations()for a,d in pairs(self:GetSequenceList())do local e=self:GetSequenceActivity(a)if e!=-1 then print(a.." => "..d.." / "..e.." => "..self:GetSequenceActivityName(a))else print(a.." => "..d.." / -1")end end end;function ENT:PrintBones()for a=0,self:GetBoneCount()-1 do local f=self:GetBoneName(a)if f==nil then continue end;print(a.." => "..f)end end;function ENT:PrintAttachments()for a,g in ipairs(self:GetAttachments())do print(g.id.." => "..g.name)end end;function ENT:PrintBodygroups()for a,h in ipairs(self:GetBodyGroups())do print(h.id.." => "..h.name.." ("..h.num.." subgroups)")end end;function ENT:Timer(...)return self:DrG_Timer(...)end;function ENT:LoopTimer(...)return self:DrG_LoopTimer(...)end;function ENT:TraceLine(i,j)return self:DrG_TraceLine(i,j)end;function ENT:TraceHull(i,j)return self:DrG_TraceHull(i,j)end;function ENT:TraceLineRadial(k,l,j)return self:DrG_TraceLineRadial(k,l,j)end;function ENT:TraceHullRadial(k,l,j)return self:DrG_TraceHullRadial(k,l,j)end;function ENT:ScreenShake(m,n,o,p)return util.ScreenShake(self:GetPos(),m,n,o,p)end;function ENT:GetCooldown(q)local r=self:GetNW2Float("DrGBaseCooldowns/"..tostring(q),false)if r!=false then return math.Clamp(r-CurTime(),0,math.huge)else return 0 end end;function ENT:NetMessage(q,...)return net.DrG_Send("DrGBaseEntMessage",q,self,...)end;function ENT:_HandleNetMessage()end;function ENT:OnNetMessage()end;if SERVER then else local function s(q,self,...)if!IsValid(self)then return end;if isfunction(self._HandleNetMessage)&&isfunction(self.OnNetMessage)then if q=="DrGBaseCallOnClient"then local t,u=table.DrG_Pack(...)local v=table.remove(t,1)if isfunction(self[v])then self[v](self,table.DrG_Unpack(t,u-1))end elseif!self:_HandleNetMessage(q,...)then self:OnNetMessage(q,...)end else timer.DrG_Simple(engine.TickInterval(),s,q,self,...)end end;net.DrG_Receive("DrGBaseEntMessage",s)function ENT:NetCallback(q,w,...)if!isfunction(w)then return end;return net.DrG_UseCallback(q,function(...)if IsValid(self)then w(self,...)end end,self,...)end;function ENT:DynamicLight(x,p,y,z,A)return self:DrG_DynamicLight(x,p,y,z,A)end end
--addons/!lpakr_out/lua/drgbase/nodegraph.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/meta/player.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/modules/net.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/properties.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/stuff.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/stuff.lua:
game.AddDecal("DrrBigExpo","stuff/decals/drrbigexp")if SERVER then else surface.CreateFont("DronesRewrite_font1",{font="Tahoma",size=40,weight=2000})surface.CreateFont("DronesRewrite_font2",{font="Tahoma",size=12,weight=2000})surface.CreateFont("DronesRewrite_font3",{font="Tahoma",size=25,weight=2000})surface.CreateFont("DronesRewrite_font4",{font="Tahoma",size=18,weight=1})surface.CreateFont("DronesRewrite_font5",{font="Lucida Console",size=16,weight=1})surface.CreateFont("DronesRewrite_font6",{font="Impact",size=18,weight=1})surface.CreateFont("DronesRewrite_customfont1",{font="Exo",size=16,weight=1})surface.CreateFont("DronesRewrite_customfont1_1",{font="Exo",size=25,weight=1})surface.CreateFont("DronesRewrite_customfont2",{font="Gnuolane RG",size=25,weight=1})surface.CreateFont("DronesRewrite_customfont2_1",{font="Gnuolane RG",size=28,weight=1})surface.CreateFont("DronesRewrite_customfont1big",{font="Exo",size=100,weight=1})surface.CreateFont("DronesRewrite_customfont1big2",{font="Exo",size=60,weight=1})surface.CreateFont("DronesRewrite_font3_out",{font="Tahoma",size=30,weight=1})hook.Add("PlayerBindPress","dronesrewrite_stopmenu",function(a,b,c)local d=a:GetNWEntity("DronesRewriteDrone")if IsValid(d)then local e={"phys_swap","slot","invnext","invprev","lastinv","gmod_tool","gmod_toolmode"}for f,g in pairs(e)do if b:find(g)then return true end end end end)end;hook.Add("StartCommand","dronesrewrite_locker",function(a,h)local d=a:GetNWEntity("DronesRewriteDrone")if IsValid(d)then h:ClearButtons()h:ClearMovement()end end)
--addons/!lpakr_out/lua/dronesrewrite/client/manuals.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/client/manuals.lua:
DRONES_REWRITE.Manuals={}local function a(b,c)table.insert(DRONES_REWRITE.Manuals,{label=b,text=c})end;a("Credits",[[
  Code:
    ProfessorBear
    calafex
    EgrOnWire

  Models:
    ProfessorBear
    calafex
    EgrOnWire

  Textures:
    ProfessorBear
    calafex
    EgrOnWire

  Effects:
    Darken217
    calafex
    ProfessorBear

  Balance:
    calafex

  Testers:
    DoomSpy

  Addon is under MIT license
  Copyright (c) 2016 ProfessorBear
]])
--addons/!lpakr_out/lua/dronesrewrite/client/overlay/drones2.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/client/overlay/rainbow.lua:
DRONES_REWRITE.Overlay["Rainbow"]=function(a)local b={["$pp_colour_addr"]=0,["$pp_colour_addg"]=0,["$pp_colour_addb"]=0,["$pp_colour_brightness"]=0,["$pp_colour_contrast"]=1,["$pp_colour_colour"]=10,["$pp_colour_mulr"]=0,["$pp_colour_mulg"]=0,["$pp_colour_mulb"]=0}DrawColorModify(b)end
--addons/!lpakr_out/lua/dronesrewrite/weapons/camera.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/firework_color_proxy.lua:
AddCSLuaFile()if CLIENT then matproxy.Add({name="FireworkColor",init=function(self,a,b)self.ResultTo=b.resultvar end,bind=function(self,a,c)if!IsValid(c)then return end;if!c.GetExplodeColor then return end;local d=c:GetExplodeColor()if d then if isvector(d)then a:SetVector(self.ResultTo,d)end else a:SetVector(self.ResultTo,Vector(1,0,0))end end})end
--addons/!lpakr_out/lua/grapple/shared.lua:
sGrap=sGrap||{}local a=15;local b=2;local c=4;local d=10;local e=Vector(0,0,1)local f=120;local g=Color(0,255,0)local h=Color(255,0,0)local i=Color(255,0,255)local j=Color(139,69,19)local k={['prop_physics']=true}local function l(m)return IsValid(m)&&k[m:GetClass()]end;local function n(o)o.Ground=util.TraceLine({start=o.Start,endpos=o.Start+-e*800}).HitPos+Vector(0,0,15)o.Distance=o.AnchorMount:Distance(o.Ground)o.Valid=o.Distance>f end;local function p(o,q)local r=util.TraceLine({start=q,endpos=q-Vector(0,0,c)})if!r.HitSky&&r.HitPos&&(l(r.Entity)||r.HitWorld)then o.AnchorMount=r.HitPos;o.AnchorLedge=r.HitPos-o.Dir*d;n(o)end end;local function s(o,q,t)local u=util.TraceLine({start=q,endpos=q+Vector(0,0,5)})if u.HitWorld||u.HitSky||IsValid(u.Entity)then return end;local r=util.TraceLine({start=q,endpos=q+o.Dir*d})if t>a then return end;if r.HitSky then elseif r.HitWorld||l(r.Entity)||t<b then return s(o,q+Vector(0,0,c),t+1)else p(o,r.HitPos)end end;function sGrap.TryGrapple(v,w)local x=v:GetEyeTraceNoCursor()if x.HitSky||!x.HitPos then return end;local y=-x.HitNormal;y.z=0;local z={Start=x.HitPos-y*5,Dir=y,pl=v,Started=CurTime(),PointLog={}}if x.HitPos:Distance(v:GetPos())>w then z.OutOfRange=true;return z end;s(z,z.Start,1)return z end
--addons/!lpakr_out/lua/vgui/stackercontrolpresets.lua:
local a={}function a:OpenPresetEditor()if!self.m_strPreset then return end;self.Window=vgui.Create("StackerPresetEditor")self.Window:MakePopup()self.Window:Center()self.Window:SetType(self.m_strPreset)self.Window:SetConVars(self.ConVars)self.Window:SetPresetControl(self)end;vgui.Register("StackerControlPresets",a,"ControlPresets")
--addons/!lpakr_out/lua/vgui/stackerpreseteditor.lua:
return lpakr()()
--addons/ssrp_lfs/lua/lvs_framework/autorun/lvs_bulletsystem.lua:

LVS._ActiveBullets = {}

function LVS:GetBullet( index )
	if not LVS._ActiveBullets then return end

	return LVS._ActiveBullets[ index ]
end

local NewBullet = {}
NewBullet.__index = NewBullet

function NewBullet:SetPos( pos )
	self.curpos = pos
end

function NewBullet:GetPos()
	if not self.curpos then return self.Src end

	return self.curpos
end

function NewBullet:GetDir()
	return self.Dir or Vector(0,0,0)
end

function NewBullet:GetTimeAlive()
	return CurTime() - self.StartTime
end

function NewBullet:GetSpawnTime()
	if SERVER then
		return self.StartTime
	else
		return math.min( self.StartTimeCL, CurTime() ) -- time when the bullet is received on client
	end
end

function NewBullet:GetLength()
	return math.min((CurTime() - self:GetSpawnTime()) * 14,1)
end

local function HandleBullets()
	local T = CurTime()
	local FT = FrameTime()

	for id, bullet in pairs( LVS._ActiveBullets ) do -- loop through bullet table
		if bullet:GetSpawnTime() + 5 < T then -- destroy all bullets older than 5 seconds
			LVS._ActiveBullets[ id ] = nil
			continue
		end

		local start = bullet.Src
		local dir = bullet.Dir
		local TimeAlive = bullet:GetTimeAlive()
		local pos = dir * TimeAlive * bullet.Velocity
		local mul = bullet:GetLength()
		local Is2ndTickAlive = TimeAlive > FT * 2 -- this system is slow. Takes atleast 2 ticks before it spawns. We need to trace from startpos until lua catches up

		-- startpos, direction and curtime of creation is networked to client.
		-- The Bullet position is simulated by doing startpos + dir * time * velocity
		if SERVER then
			bullet:SetPos( start + pos )
		else
			if IsValid( bullet.Entity ) then -- if the vehicle entity is valid...
				local inv = 1 - mul

				-- ..."parent" the bullet to the vehicle for a very short time. This will give the illusion of the bullet not lagging behind even tho it is fired later on client
				bullet:SetPos( start * mul + bullet.Entity:LocalToWorld( bullet.SrcEntity ) * inv + pos )
			else
				bullet:SetPos( start + pos )
			end
		end

		local Filter
		if IsValid( bullet.Entity ) then
			Filter = bullet.Entity:GetCrosshairFilterEnts() -- auto filter all entities that are attached to the vehicle
		end

		local trace = util.TraceHull( {
			start = Is2ndTickAlive and start + pos - dir or start,
			endpos = start + pos + dir * bullet.Velocity * FT,
			filter = Filter,
			mins = Vector(-1,-1,-1) * bullet.HullSize,
			maxs = Vector(1,1,1) * bullet.HullSize,
			mask = MASK_SHOT_HULL
		} )

		if CLIENT then
			if not bullet.Muted and mul == 1 then
				-- whats more expensive, spamming this effect or doing distance checks to localplayer for each bullet think? Alternative method?
				local effectdata = EffectData()
				effectdata:SetOrigin( bullet:GetPos() )
				effectdata:SetFlags( 2 )
				util.Effect( "TracerSound", effectdata )
			end

			if not bullet.HasHitWater then
				local traceWater = util.TraceLine( {
					start = start + pos - dir,
					endpos = start + pos + dir * bullet.Velocity * FT,
					filter = Filter,
					mask = MASK_WATER,
				} )

				if traceWater.Hit then
					LVS._ActiveBullets[ id ].HasHitWater = true

					local effectdata = EffectData()
					effectdata:SetOrigin( traceWater.HitPos )
					effectdata:SetScale( 10 + bullet.HullSize * 0.5 )
					effectdata:SetFlags( 2 )
					util.Effect( "WaterSplash", effectdata, true, true )
				end
			end
		end

		if trace.Hit then
			-- hulltrace doesnt hit the wall due to its hullsize...
			-- so this needs an extra trace line
			local traceImpact = util.TraceLine( {
				start = Is2ndTickAlive and start + pos - dir or start,
				endpos = start + pos + dir * 50000,
				filter = Filter,
				mask = MASK_SHOT_HULL
			} )

			if SERVER then
				local EndPos = traceImpact.Hit and traceImpact.HitPos or trace.HitPos

				local dmginfo = DamageInfo()
				dmginfo:SetDamage( bullet.Damage )
				dmginfo:SetAttacker( (IsValid( bullet.Attacker ) and bullet.Attacker) or (IsValid( bullet.Entity ) and bullet.Entity) or game.GetWorld() )
				dmginfo:SetDamageType( DMG_AIRBOAT )
				dmginfo:SetInflictor( (IsValid( bullet.Entity ) and bullet.Entity) or (IsValid( bullet.Attacker ) and bullet.Attacker) or game.GetWorld() )
				dmginfo:SetDamagePosition( EndPos )
				dmginfo:SetDamageForce( bullet.Dir * bullet.Force )

				if bullet.Callback then
					bullet.Callback( bullet.Attacker, traceImpact, dmginfo )
				end

				trace.Entity:TakeDamageInfo( dmginfo )

				if bullet.SplashDamage and bullet.SplashDamageRadius then
					local effectdata = EffectData()
					effectdata:SetOrigin( EndPos )
					effectdata:SetNormal( trace.HitWorld and trace.HitNormal or dir )
					effectdata:SetMagnitude( bullet.SplashDamageRadius / 250 )
					util.Effect( "lvs_bullet_impact", effectdata )

					dmginfo:SetDamageType( DMG_SONIC )
					dmginfo:SetDamage( bullet.SplashDamage )

					util.BlastDamageInfo( dmginfo, EndPos, bullet.SplashDamageRadius )
				end
			else
				if not traceImpact.HitSky then
					local effectdata = EffectData()
					effectdata:SetOrigin( traceImpact.HitPos )
					effectdata:SetEntity( traceImpact.Entity )
					effectdata:SetStart( start )
					effectdata:SetNormal( traceImpact.HitNormal )
					effectdata:SetSurfaceProp( traceImpact.SurfaceProps )
					util.Effect( "Impact", effectdata )
				end
			end

			LVS._ActiveBullets[ id ] = nil
		end
	end
end

if SERVER then
	util.AddNetworkString( "lvs_fire_bullet" )

	hook.Add( "Tick", "!!!!lvs_bullet_handler", function( ply, ent ) -- from what i understand, think can "skip" on lag, while tick still simulates all steps
		HandleBullets()
	end )

	function LVS:FireBullet( data )
		local bullet = {}

		setmetatable( bullet, NewBullet )

		bullet.TracerName = data.TracerName or "lvs_tracer_orange"
		bullet.Src = data.Src or Vector(0,0,0)
		bullet.Dir = (data.Dir + VectorRand() * (data.Spread or Vector(0,0,0)) * 0.5):GetNormalized()
		bullet.Force = data.Force or 10
		bullet.HullSize = data.HullSize or 5
		bullet.Velocity = data.Velocity or 2500
		bullet.Attacker = IsValid( data.Attacker ) and data.Attacker or (IsValid( data.Entity ) and data.Entity or game.GetWorld())
		bullet.Damage = data.Damage or 10
		bullet.Entity = data.Entity
		bullet.Filter = data.Filter or bullet.Entity
		bullet.SrcEntity = data.SrcEntity or Vector(0,0,0)
		bullet.Callback = data.Callback
		bullet.SplashDamage = data.SplashDamage
		bullet.SplashDamageRadius = data.SplashDamageRadius
		bullet.StartTime = CurTime()

		-- net.WriteVector isnt accurate enough. Instead we split into 3 floats per vector
		-- i dont know how this can be optimized while achieving the same?
		net.Start( "lvs_fire_bullet", true )
			net.WriteString( bullet.TracerName )
			net.WriteFloat( bullet.Src.x )
			net.WriteFloat( bullet.Src.y )
			net.WriteFloat( bullet.Src.z )
			net.WriteAngle( bullet.Dir:Angle() )
			net.WriteFloat( bullet.StartTime )
			net.WriteFloat( bullet.HullSize )
			net.WriteEntity( bullet.Entity )
			net.WriteFloat( bullet.SrcEntity.x )
			net.WriteFloat( bullet.SrcEntity.y )
			net.WriteFloat( bullet.SrcEntity.z )
			net.WriteFloat( bullet.Velocity )
		net.SendPVS( bullet.Src )

		table.insert(LVS._ActiveBullets, bullet )
	end
else
	local Index = 0
	local MaxIndex = 4094 -- this is the util.effect limit

	net.Receive( "lvs_fire_bullet", function( length )
		local bullet = {}

		setmetatable( bullet, NewBullet )

		bullet.TracerName = net.ReadString()
		bullet.Src = Vector(net.ReadFloat(),net.ReadFloat(),net.ReadFloat())
		bullet.Dir = net.ReadAngle():Forward()
		bullet.StartTime = net.ReadFloat()
		bullet.HullSize = net.ReadFloat()
		bullet.Entity = net.ReadEntity()
		bullet.SrcEntity = Vector(net.ReadFloat(),net.ReadFloat(),net.ReadFloat())
		bullet.Velocity = net.ReadFloat()
		bullet.StartTimeCL = CurTime() + RealFrameTime()

		local ply = LocalPlayer()
		bullet.Muted = IsValid( ply ) and bullet.Entity == ply:lvsGetVehicle()

		Index = Index + 1
		if Index > 4094 then
			Index = 1
		end

		LVS._ActiveBullets[ Index ] = bullet

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( bullet.Dir )
		effectdata:SetMaterialIndex( Index )
		util.Effect( bullet.TracerName, effectdata )
	end )

	hook.Add( "Think", "!!!!_lvs_bullet_think_cl", function()
		HandleBullets()
	end )
end
--addons/ssrp_lfs/lua/lvs_framework/autorun/lvs_hookers.lua:

local function SetDistance( vehicle, ply )
	local iWheel = ply:GetCurrentCommand():GetMouseWheel()

	if iWheel == 0 or not vehicle.SetCameraDistance then return end

	local newdist = math.Clamp( vehicle:GetCameraDistance() - iWheel * 0.03 * ( 1.1 + vehicle:GetCameraDistance() ), -1, 10 )

	vehicle:SetCameraDistance( newdist )
end

local function SetHeight( vehicle, ply )
	local iWheel = ply:GetCurrentCommand():GetMouseWheel()

	if iWheel == 0 or not vehicle.SetCameraHeight then return end

	local newdist = math.Clamp( vehicle:GetCameraHeight() - iWheel * 0.03 * ( 1.1 + vehicle:GetCameraHeight() ), -1, 10 )

	vehicle:SetCameraHeight( newdist )
end

hook.Add( "VehicleMove", "!!!!lvs_vehiclemove", function( ply, vehicle, mv )
	if not ply.lvsGetVehicle then return end

	local veh = ply:lvsGetVehicle()

	if not IsValid( veh ) then return end

	if SERVER and ply:lvsKeyDown( "VIEWDIST" ) then
		if ply:lvsKeyDown( "VIEWHEIGHT" ) then
			SetHeight( vehicle, ply )
		else
			SetDistance( vehicle, ply )
		end
	end

	if CLIENT and not IsFirstTimePredicted() then return end

	local KeyThirdPerson = ply:lvsKeyDown("THIRDPERSON")

	if ply._lvsOldThirdPerson ~= KeyThirdPerson and vehicle.CanChangeView != false then
		ply._lvsOldThirdPerson = KeyThirdPerson

		if KeyThirdPerson and vehicle.SetThirdPersonMode then
			vehicle:SetThirdPersonMode( not vehicle:GetThirdPersonMode() )
		end
	end

	return true
end )

hook.Add( "PhysgunPickup", "!!!!lvs_disable_wheel_grab", function( ply, ent )
	if ent.lvsDoNotGrab then return false end
end )

hook.Add("CalcMainActivity", "!!!lvs_playeranimations", function(ply)
	if not ply.lvsGetVehicle then return end

	local Ent = ply:lvsGetVehicle()

	if IsValid( Ent ) then
		local A,B = Ent:CalcMainActivity( ply )

		if A and B then
			return A, B
		end
	end
end)

hook.Add("UpdateAnimation", "!!!lvs_playeranimations", function( ply, velocity, maxseqgroundspeed )
	if not ply.lvsGetVehicle then return end

	local Ent = ply:lvsGetVehicle()

	if not IsValid( Ent ) then return end

	return Ent:UpdateAnimation( ply, velocity, maxseqgroundspeed )
end)

hook.Add( "StartCommand", "!!!!LVS_grab_command", function( ply, cmd )
	if not ply.lvsGetVehicle then return end

	local veh = ply:lvsGetVehicle()

	if not IsValid( veh ) then return end

	veh:StartCommand( ply, cmd )
end )

if CLIENT then
	hook.Add( "CanProperty", "!!!!lvsEditPropertiesDisabler", function( ply, property, ent )
		if ent.LVS and not ply:IsAdmin() and property == "editentity" then return false end
	end )

	return
end

hook.Add( "EntityTakeDamage", "!!!_lvs_fix_vehicle_explosion_damage", function( target, dmginfo )
	if not target:IsPlayer() then return end

	local veh = target:lvsGetVehicle()

	if not IsValid( veh ) or dmginfo:IsDamageType( DMG_DIRECT ) then return end

	dmginfo:SetDamage( 0 )
end )
--addons/ssrp_lfs/lua/lvs_framework/autorun/lvs_keybinding.lua:

hook.Add( "LVS:Initialize", "!!11lvs_default_keys", function()
	local KEYS = {
		{
			name = "ATTACK",
			category = "Armament",
			name_menu = "Attack",
			default = "+attack",
			cmd = "lvs_attack"
		},
		{
			name = "ZOOM",
			category = "Armament",
			name_menu = "Zoom",
			default = "+attack2",
			cmd = "lvs_zoom"
		},
		{
			name = "~SELECT~WEAPON#1",
			category = "Armament",
			name_menu = "Select Weapon 1",
			cmd = "lvs_select_weapon1"
		},
		{
			name = "~SELECT~WEAPON#2",
			category = "Armament",
			name_menu = "Select Weapon 2",
			cmd = "lvs_select_weapon2"
		},
		{
			name = "~SELECT~WEAPON#3",
			category = "Armament",
			name_menu = "Select Weapon 3",
			cmd = "lvs_select_weapon3"
		},
		{
			name = "~SELECT~WEAPON#4",
			category = "Armament",
			name_menu = "Select Weapon 4",
			cmd = "lvs_select_weapon4"
		},
		--[[ only adding 4 because i dont want to bloat the menu. There can be added as many keys as neededed the system should figure it out by itself
		{
			name = "~SELECT~WEAPON#5",
			category = "Armament",
			name_menu = "Select Weapon 5",
			cmd = "lvs_select_weapon5"
		},
		]]
		{
			name = "EXIT",
			category = "Misc",
			name_menu = "Exit Vehicle",
			default = "+use",
			cmd = "lvs_exit"
		},
		{
			name = "VIEWDIST",
			category = "Misc",
			name_menu = "Enable Mouse-Wheel Set-Camera-Distance",
			default = MOUSE_MIDDLE,
			cmd = "lvs_viewzoom"
		},
		{
			name = "VIEWHEIGHT",
			category = "Misc",
			name_menu = "Set-Camera-Distance => Set-Camera-Height",
			default = "phys_swap",
			cmd = "lvs_viewheight"
		},
		{
			name = "THIRDPERSON",
			category = "Misc",
			name_menu = "Toggle Thirdperson",
			default = "+duck",
			cmd = "lvs_thirdperson"
		},
		{
			name = "FREELOOK",
			category = "Misc",
			name_menu = "Freelook (Hold)",
			default = "+walk",
			cmd = "lvs_freelook"
		},
		{
			name = "ENGINE",
			category = "Misc",
			name_menu = "Toggle Engine",
			default = "+reload",
			cmd = "lvs_startengine"
		},
		{
			name = "VSPEC",
			category = "Misc",
			name_menu = "Toggle Vehicle-specific Function",
			default = "+jump",
			cmd = "lvs_special"
		},
		{
			name = "VSPEC2",
			category = "Misc",
			name_menu = "Toggle Vehicle-specific Secondary Function",
			default = "impulse 100",
			cmd = "lvs_special2"
		},
	}

	for _, v in pairs( KEYS ) do
		LVS:AddKey( v.name, v.category, v.name_menu, v.cmd, v.default )
	end
end )

if SERVER then return end

hook.Add( "PlayerBindPress", "!!!!_LVS_PlayerBindPress", function( ply, bind, pressed )
	if not ply.lvsGetVehicle then return end

	local vehicle = ply:lvsGetVehicle()

	if not IsValid( vehicle ) then return end

	if not ply:lvsKeyDown( "VIEWDIST" ) then
		if string.find( bind, "invnext" ) then
			vehicle:NextWeapon()
		end
		if string.find( bind, "invprev" ) then
			vehicle:PrevWeapon()
		end
	end

	if string.find( bind, "+zoom" ) then
		return true
	end
end )

hook.Add( "SpawnMenuOpen", "!!!lvs_spawnmenudisable", function()
	local ply = LocalPlayer()

	if not ply._lvsDisableSpawnMenu or not IsValid( ply:lvsGetVehicle() ) then return end

	return false
end )

hook.Add( "ContextMenuOpen", "!!!lvs_contextmenudisable", function()
	local ply = LocalPlayer()

	if not ply._lvsDisableContextMenu or not IsValid( ply:lvsGetVehicle() ) then return end

	return false
end )

--addons/ssrp_lfs/lua/lvs_framework/autorun/lvs_net.lua:
if SERVER then
	util.AddNetworkString( "lvs_player_request_filter" )

	net.Receive( "lvs_player_request_filter", function( length, ply )
		if not IsValid( ply ) then return end

		local ent = net.ReadEntity()

		if not IsValid( ent ) then return end

		local CrosshairFilterEnts = table.Copy( ent:GetCrosshairFilterEnts() )

		for id, entity in pairs( CrosshairFilterEnts ) do
			if not IsValid( entity ) or entity:GetNoDraw() then
				CrosshairFilterEnts[ id ] = nil
			end
		end

		net.Start( "lvs_player_request_filter" )
			net.WriteEntity( ent )
			net.WriteTable( CrosshairFilterEnts )
		net.Send( ply )
	end, 40)
else
	net.Receive( "lvs_player_request_filter", function( length )
		local LVSent = net.ReadEntity()

		if not IsValid( LVSent ) then return end

		local Filter = {}

		for _, entity in pairs( net.ReadTable() ) do
			if not IsValid( entity ) then continue end
			table.insert( Filter, entity )
		end

		LVSent.CrosshairFilterEnts = Filter
	end)
end
--addons/!lpakr_out/lua/pac3/libraries/expression.lua:
local a={PI=math.pi,rand=math.random,randx=function(b,c)b=b||-1;c=c||1;return math.Rand(b,c)end,abs=math.abs,acos=math.acos,asin=math.asin,atan=math.atan,atan2=math.atan2,ceil=math.ceil,cos=math.cos,cosh=math.cosh,deg=math.deg,exp=math.exp,floor=math.floor,frexp=math.frexp,ldexp=math.ldexp,log=math.log,log10=math.log10,max=math.max,min=math.min,rad=math.rad,sin=math.sin,sinh=math.sinh,sqrt=math.sqrt,tanh=math.tanh,tan=math.tan,sgn=function(d)return d>0&&1||d<0&&-1||0 end,clamp=math.Clamp,round=math.Round}local e={"repeat","until","function","end"}local function f(g,h)for i,j in pairs(e)do if g:find("[%p%s]"..j)||g:find(j.."[%p%s]")then return false,string.format("illegal characters used %q",j)end end;local k={}for l,m in pairs(a)do k[l]=m end;if h then for l,m in pairs(h)do k[l]=m end end;k.select=select;g="local IN = select(1, ...) return "..g;local n=CompileString(g,"pac_expression",false)if isstring(n)then return false,n else setfenv(n,k)return true,n end end;return f
--addons/!lpakr_out/lua/pac3/core/shared/entity_mutators/blood_color.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/part_pool.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/owner_name.lua:
pac.OwnerNames={"self","viewmodel","hands","active vehicle","active weapon","world"}local function a(b,c)return pac.StringFind(b:GetClass(),c)||pac.StringFind(b:GetClass(),c,true)||b.GetName&&pac.StringFind(b:GetName(),c)||b.GetName&&pac.StringFind(b:GetName(),c,true)||pac.StringFind(b:GetModel(),c)||pac.StringFind(b:GetModel(),c,true)end;local function d(e,f)return e:GetOwner()==f||(!f.CPPIGetOwner||f:CPPIGetOwner()==e||f:CPPIGetOwner()==true)end;local function g(b)local h=b:GetPos()local i=b:GetAngles()local j=b:GetModel():lower():gsub("\\","/")local k,l,m=math.Round(h.x/10)*10,math.Round(h.y/10)*10,math.Round(h.z/10)*10;local n,o,p=math.Round(i.p/10)*10,math.Round(i.y/10)*10,math.Round(i.r/10)*10;local q=k..l..m..n..o..p..j;return pac.Hash(q)end;SafeRemoveEntity(pac.WorldEntity)pac.WorldEntity=NULL;function pac.GetWorldEntity()if!pac.WorldEntity:IsValid()then local b=pac.CreateEntity("models/error.mdl")b:SetPos(Vector(0,0,0))b:SetModelScale(0,0)b.IsPACWorldEntity=true;pac.WorldEntity=b end;return pac.WorldEntity end;function pac.HandleOwnerName(r,s,b,t,u)local v=tonumber(s)if v then b=Entity(v)if b:IsValid()then if r:IsValid()&&r.GetViewModel&&b==r:GetViewModel()then t:SetOwnerName("viewmodel")return b end;if r:IsValid()&&r.GetHands&&b==r:GetHands()then t:SetOwnerName("hands")return b end;if b==pac.LocalPlayer then t:SetOwnerName("self")return b end;if b.GetPersistent&&b:GetPersistent()then t:SetOwnerName("persist "..g(b))end;return b end;return pac.GetWorldEntity()end;if s=="world"||s=="worldspawn"then return pac.GetWorldEntity()end;if s=="self"then return r end;if r:IsValid()then if s=="active weapon"&&r.GetActiveWeapon&&r:GetActiveWeapon():IsValid()then return r:GetActiveWeapon()end;if s=="active vehicle"&&r.GetVehicle&&r:GetVehicle():IsValid()then return r:GetVehicle()end;if s=="hands"&&r==pac.LocalPlayer&&pac.LocalHands:IsValid()then return pac.LocalHands end;if s=="hands"&&r.GetHands then return r:GetHands()end;if s=="viewmodel"&&r.GetViewModel then return r:GetViewModel()end;if IsValid(b)&&(!u||u(b))&&d(b,r)&&a(b,s)then return b end;for w,x in pairs(ents.GetAll())do if x:IsValid()&&(!u||u(x))&&d(x,r)&&a(x,s)then return x end end end;if s:find("persist ",nil,true)then local q=s:match("persist (.+)")for w,x in pairs(ents.GetAll())do if x.GetPersistent&&x:GetModel()&&x:GetPersistent()&&q==g(x)then return x end end end;return NULL end
--addons/!lpakr_out/lua/pac3/core/client/parts/group.lua:
local a,b=pac.PartTemplate("base")b.ClassName="group"b.Icon='icon16/world.png'b.Description="right click to add parts"a:StartStorableVars()a:GetSet("Duplicate",false)a:GetSet("OwnerName","self")a:EndStorableVars()local c={}local d=0;pac.AddHook("Think","group_init",function()if d==0 then return end;for e=1,d do local self=c[e]if self:IsValid()&&!self:HasParent()&&!self.Owner:IsValid()&&!self.update_owner_once then self:UpdateOwnerName()end end;c={}d=0 end)function b:Initialize()d=d+1;c[d]=self end;function b:SetOwner(f)if self:HasParent()then self.Owner=f||NULL else local g=self:GetOwner()if g:IsValid()then pac.UnhookEntityRender(g,self)end;self.Owner=f||NULL;g=self:GetOwner()if g:IsValid()then if!pac.HookEntityRender(g,self)then self:ShowFromRendering()end end end end;function b:HideInvalidOwners()local h=self:GetOwner()if!h:IsValid()then self:SetOwner(NULL)end end;function b:UpdateOwnerName()self.update_owner_once=true;if self:HasParent()then return end;local f;local h=self:GetOwner()if self.Duplicate then f=pac.HandleOwnerName(self:GetPlayerOwner(),self.OwnerName,f,self,function(i)return i.pac_duplicate_attach_uid!=self.UniqueID end)||NULL;if f!=h&&f:IsValid()then local j=self:ToTable()j.self.OwnerName="self"j.self.Duplicate=false;pac.SetupENT(f)local k=f:AttachPACPart(j)k:SetShowInEditor(false)f:CallOnRemove("pac_remove_outfit_"..j.self.UniqueID,function()f:RemovePACPart(j)end)if self:GetPlayerOwner()==pac.LocalPlayer then f:SetPACDrawDistance(0)end;f.pac_duplicate_attach_uid=k:GetUniqueID()end else f=pac.HandleOwnerName(self:GetPlayerOwner(),self.OwnerName,f,self)||NULL end;if f!=h then self:SetOwner(f)end end;local l=b.SetPlayerOwner;function b:SetPlayerOwner(m)local n=self.PlayerOwner;l(self,m)if n:IsValid()then self:UpdateOwnerName()end end;function b:SetOwnerName(o)if o==""then o="self"end;self.OwnerName=o;if self.Owner:IsValid()then self:UpdateOwnerName()end end;function b:GetNiceName()return#self:GetChildrenList().." children"end;function b:OnVehicleChanged(m,p)if self:HasParent()then return end;if self.OwnerName=="active vehicle"then self:UpdateOwnerName()end end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/light.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/particles.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/physics.lua:
local a,b=pac.PartTemplate("base")b.ThinkTime=0;b.ClassName="physics"b.Group='model'b.Icon='icon16/shape_handles.png'a:StartStorableVars()a:GetSet("Box",true)a:GetSet("Radius",1)a:GetSet("SelfCollision",false)a:GetSet("Gravity",true)a:GetSet("Collisions",true)a:GetSet("Mass",100)a:GetSet("Follow",false)a:GetSet("SecondsToArrive",0.1)a:GetSet("MaxSpeed",10000)a:GetSet("MaxAngular",3600)a:GetSet("MaxSpeedDamp",1000)a:GetSet("MaxAngularDamp",1000)a:GetSet("DampFactor",1)a:GetSet("ConstrainSphere",0)a:EndStorableVars()local function c(self)return self.Parent.ClassName!="model"&&self.Parent.ClassName!="model2"end;b.phys=NULL;function b:SetBox(d)self.Box=d;self:SetRadius(self.Radius)end;function b:SetCollisions(d)self.Collisions=d;if self.phys:IsValid()then self.phys:EnableCollisions(d)end end;function b:SetMass(e)self.Mass=e;if self.phys:IsValid()then self.phys:SetMass(math.Clamp(e,0.001,50000))end end;function b:SetRadius(e)self.Radius=e;if c(self)then return end;local f=self.Parent:GetOwner()if e<=0 then e=f:BoundingRadius()/2 end;f:SetNoDraw(false)if self.Box then f:PhysicsInitBox(Vector(1,1,1)*-e,Vector(1,1,1)*e)else f:PhysicsInitSphere(e)end;self.phys=f:GetPhysicsObject()if self.Gravity!=nil then self.phys:EnableGravity(self.Gravity)end end;function b:SetGravity(d)self.Gravity=d;if self.phys:IsValid()then self.phys:EnableGravity(d)end end;function b:SetSelfCollision(d)self.SelfCollision=d;if c(self)then return end;local f=self.Parent:GetOwner()if d then f:SetCollisionGroup(COLLISION_GROUP_NONE)else f:SetCollisionGroup(COLLISION_GROUP_DEBRIS)end end;local g={}function b:OnThink()if self.Parent.GetWorldPosition then if self.disabled then self:Enable()end else if!self.disabled then self:Disable()end end;local h=self.phys;if h:IsValid()then h:Wake()if self.Follow then g.pos=self.Parent:GetWorldPosition()g.angle=self.Parent:GetWorldAngles()g.secondstoarrive=math.max(self.SecondsToArrive,0.0001)g.maxangular=self.MaxAngular;g.maxangulardamp=self.MaxAngularDamp;g.maxspeed=self.MaxSpeed;g.maxspeeddamp=self.MaxSpeedDamp;g.dampfactor=self.DampFactor;g.teleportdistance=0;h:ComputeShadowControl(g)if self.ConstrainSphere!=0&&h:GetPos():Distance(self.Parent:GetWorldPosition())>self.ConstrainSphere then h:SetPos(self.Parent:GetWorldPosition()+(self.Parent:GetWorldPosition()-h:GetPos()):GetNormalized()*-self.ConstrainSphere)end else if self.ConstrainSphere!=0 then local i=self.Parent:GetWorldPosition()-h:GetPos()if i:Length()>self.ConstrainSphere then h:SetPos(self.Parent:GetWorldPosition()-i:GetNormalized()*self.ConstrainSphere)h:SetVelocity(Vector())end end end end end;function b:OnParent(j)timer.Simple(0,function()self:Enable()end)end;function b:OnUnParent(j)timer.Simple(0,function()self:Disable()end)end;function b:OnShow()timer.Simple(0,function()self:Enable()end)end;function b:OnHide()timer.Simple(0,function()self:Disable()end)end;function b:Enable()if c(self)then return end;local j=self:GetParent()j.skip_orient=true;local f=j:GetOwner()f:SetNoDraw(false)self:SetRadius(self.Radius)for k,l in pairs(self.StorableVars)do if pac.registered_parts.base.StorableVars[k]then goto m end;self["Set"..k](self,self[k])::m::end;self.disabled=false end;function b:Disable()if c(self)then return end;local j=self:GetParent()local f=j:GetOwner()if f:IsValid()then f:SetNoDraw(true)f:PhysicsInit(SOLID_NONE)end;j.skip_orient=false;self.disabled=true end;function b:SetPositionDamping(n)self.PositionDamping=n;if self.phys:IsValid()then self.phys:SetDamping(self.PositionDamping,self.AngleDamping)end end;function b:SetAngleDamping(n)self.AngleDamping=n;if self.phys:IsValid()then self.phys:SetDamping(self.PositionDamping,self.AngleDamping)end end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/trail.lua:
local Lerp=Lerp;local tonumber=tonumber;local a=table.insert;local b=table.remove;local c=math.ceil;local d=math.abs;local e=math.min;local f=render.StartBeam;local g=cam.IgnoreZ;local h=render.EndBeam;local i=render.AddBeam;local j=render.SetMaterial;local Vector=Vector;local RealTime=RealTime;local k=Color(255,255,255)function pac.DrawTrail(self,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A)self.trail_points=self.trail_points||{}local B=self.trail_points;if pac.drawing_motionblur_alpha then local C=pac.drawing_motionblur_alpha;self.trail_points_motionblur=self.trail_points_motionblur||{}self.trail_points_motionblur[C]=self.trail_points_motionblur[C]||{}B=self.trail_points_motionblur[C]end;local D=RealTime()if!B[1]||B[#B].pos:Distance(n)>m then a(B,{pos=n*1,life_time=D+l})end;local E=#B;j(p)f(E)for F=#B,1,-1 do local G=B[F]local H=(G.life_time-D)/l;local I=H;H=-H+1;local J=1/E*(F-1)k.r=e(Lerp(J,u,q),255)k.g=e(Lerp(J,v,r),255)k.b=e(Lerp(J,w,s),255)k.a=e(Lerp(J,x,t),255)i(G.pos,H*y+I*z,J*A,k)if H>=1 then b(B,F)end end;h()if self.CenterAttraction!=0 then local K=FrameTime()*self.CenterAttraction;local L=Vector(0,0,0)for M,G in ipairs(B)do L:Zero()for M,G in ipairs(B)do L:Add(G.pos)end;L:Mul(1/#B)L:Sub(G.pos)L:Mul(K)G.pos:Add(L)end end;if!self.Gravity:IsZero()then local N=self.Gravity*FrameTime()N:Rotate(o)for M,G in ipairs(B)do G.pos:Add(N)end end end;local O,P=pac.PartTemplate("base_drawable")P.FriendlyName="trail"P.ClassName="trail2"P.Icon='icon16/arrow_undo.png'P.Group='effects'P.ProperColorRange=true;O:StartStorableVars():GetSet("Duration",1):GetSet("Spacing",0.25):GetSet("StartSize",3):GetSet("EndSize",0):GetSet("StartColor",Vector(1,1,1),{editor_panel="color2"}):GetSet("EndColor",Vector(1,1,1),{editor_panel="color2"}):GetSet("StartAlpha",1):GetSet("EndAlpha",0):GetSet("Stretch",1):GetSet("CenterAttraction",0):GetSet("Gravity",Vector(0,0,0)):GetSet("IgnoreZ",false):GetSet("TrailPath","trails/laser",{editor_panel="material"}):GetSet("Translucent",true):EndStorableVars()function P:GetNiceName()local Q=pac.PrettifyName("/"..self:GetTrailPath())local R=Q&&Q:match(".+/(.+)")return R&&R:gsub("%..+","")||"error"end;P.LastAdd=0;function P:Initialize()self:SetTrailPath(self.TrailPath)end;function P:SetTrailPath(S)self.TrailPath=S;self:SetMaterial(S)end;function P:SetMaterial(S)S=S||""if!pac.Handleurltex(self,S,function(p)self.Materialm=p;self:MakeMaterialUnlit()end)then if isstring(S)then self.Materialm=pac.Material(S,self)self:CallRecursive("OnMaterialChanged")elseif type(S)=="IMaterial"then self.Materialm=S;self:CallRecursive("OnMaterialChanged")end;self:MakeMaterialUnlit()end end;function P:MakeMaterialUnlit()if!self.Materialm then return end;local T=self.Materialm:GetShader()if T=="VertexLitGeneric"||T=="Cable"||T=="LightmappedGeneric"then self.Materialm=pac.MakeMaterialUnlitGeneric(self.Materialm,self.Id)end end;function P:OnShow()self.points={}end;function P:OnHide()self.points={}end;function P:OnDraw()local n,o=self:GetDrawPosition()local p=self.material_override&&self.material_override[0][1]&&self.material_override[0][1]:GetRawMaterial()||self.Materialm;if!p then return end;pac.DrawTrail(self,math.min(self.Duration,10),self.Spacing+self.StartSize/10,n,o,p,self.StartColor.x*255,self.StartColor.y*255,self.StartColor.z*255,self.StartAlpha*255,self.EndColor.x*255,self.EndColor.y*255,self.EndColor.z*255,self.EndAlpha*255,self.StartSize,self.EndSize,1/self.Stretch)end;O:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/entity.lua:
local a=render.CullMode;local b=render.SuppressEngineLighting;local c=render.SetBlend;local d=render.SetColorModulation;local e=render.MaterialOverride;local f=game.SinglePlayer;local Angle=Angle;local Vector=Vector;local NULL=NULL;local Color=Color;local g,h=pac.PartTemplate("base_drawable")h.FriendlyName="legacy entity"h.ClassName="entity"h.Group='legacy'h.Icon='icon16/brick.png'g:StartStorableVars()g:SetPropertyGroup("generic")g:PropertyOrder("Name")g:PropertyOrder("Hide")g:GetSet("Model","")g:GetSet("Material","")g:GetSet("HideEntity",false)g:GetSet("DrawWeapon",true)g:GetSet("MuteSounds",false)g:GetSet("AllowOggWhenMuted",false)g:GetSet("HideBullets",false)g:GetSet("DrawPlayerOnDeath",false)g:GetSet("HidePhysgunBeam",false)g:GetSet("UseLegacyScale",false)g:SetPropertyGroup("appearance")g:GetSet("Color",Vector(255,255,255),{editor_panel="color"})g:GetSet("Brightness",1)g:GetSet("Alpha",1,{editor_sensitivity=0.25,editor_clamp={0,1}})g:GetSet("Fullbright",false)g:PropertyOrder("DrawOrder")g:PropertyOrder("Translucent")g:GetSet("Invert",false)g:GetSet("DoubleFace",false)g:GetSet("Skin",0,{editor_onchange=function(self,i)return math.Round(math.max(tonumber(i),0))end})g:GetSet("DrawShadow",true)g:GetSet("LodOverride",-1)g:SetPropertyGroup("movement")g:GetSet("SprintSpeed",0)g:GetSet("RunSpeed",0)g:GetSet("WalkSpeed",0)g:GetSet("CrouchSpeed",0)g:SetPropertyGroup("orientation")g:PropertyOrder("AimPartName")g:PropertyOrder("Bone")g:PropertyOrder("Position")g:PropertyOrder("Angles")g:PropertyOrder("EyeAngles")g:GetSet("Size",1,{editor_sensitivity=0.25})g:GetSet("Scale",Vector(1,1,1))g:SetPropertyGroup("behavior")g:GetSet("RelativeBones",true)g:GetSet("Weapon",false)g:GetSet("InverseKinematics",false)g:GetSet("MuteFootsteps",false)g:GetSet("SuppressFrames",false)g:GetSet("AnimationRate",1)g:GetSet("FallApartOnDeath",false)g:GetSet("DeathRagdollizeParent",false)g:GetSet("HideRagdollOnDeath",false)g:GetSetPart("EyeTarget")g:EndStorableVars()local j={}function g:EntityField(k,l)l="pac_"..l;j[l]=k;self.PART["Set"..k]=function(self,m)self[k]=m;local n=self:GetOwner()if n:IsValid()then n[l]=m end end end;g:EntityField("InverseKinematics","enable_ik")g:EntityField("MuteFootsteps","mute_footsteps")g:EntityField("AnimationRate","global_animation_rate")g:EntityField("RunSpeed","run_speed")g:EntityField("WalkSpeed","walk_speed")g:EntityField("CrouchSpeed","crouch_speed")g:EntityField("SprintSpeed","sprint_speed")g:EntityField("FallApartOnDeath","death_physics_parts")g:EntityField("DeathRagdollizeParent","death_ragdollize")g:EntityField("HideRagdollOnDeath","death_hide_ragdoll")g:EntityField("DrawPlayerOnDeath","draw_player_on_death")g:EntityField("HidePhysgunBeam","hide_physgun_beam")g:EntityField("MuteSounds","mute_sounds")g:EntityField("AllowOggWhenMuted","allow_ogg_sounds")g:EntityField("HideBullets","hide_bullets")function h:Initialize()self:SetColor(self:GetColor())end;function h:GetNiceName()local o=self:GetOwner()if o:IsValid()then if o:IsPlayer()then return o:Nick()else return language.GetPhrase(o:GetClass())end end;if self.Weapon then return"Weapon"end;return self.ClassName end;function h:SetUseLegacyScale(p)self.UseLegacyScale=p;self:UpdateScale()end;function h:SetWeapon(p)self.Weapon=p;if p then self:OnShow()else self:OnHide()end end;function h:SetDrawShadow(p)self.DrawShadow=p;local o=self:GetOwner()if o:IsValid()then o:DrawShadow(p)end end;function h:UpdateScale(o)o=o||self:GetOwner()if!o:IsValid()then return end;if!self.UseLegacyScale then o.pac3_Scale=self.Size end;if o:IsPlayer()||o:IsNPC()then if self:GetPlayerOwner()==pac.LocalPlayer then pac.emut.MutateEntity(self:GetPlayerOwner(),"size",o,self.Size)end;pac.SetModelScale(o,self.Scale)else pac.SetModelScale(o,self.Scale*self.Size)end end;function h:SetSize(m)self.Size=m;self:UpdateScale()end;function h:SetScale(m)self.Scale=m;self:UpdateScale()end;function h:SetColor(q)q=q||Vector(255,255,255)self.Color=q;self.Colorf=Vector(q.r,q.g,q.b)/255;self.Colorc=self.Colorc||Color(q.r,q.g,q.b,self.Alpha)self.Colorc.r=q.r;self.Colorc.g=q.g;self.Colorc.b=q.b end;function h:SetAlpha(q)self.Alpha=q;self.Colorc=self.Colorc||Color(self.Color.r,self.Color.g,self.Color.b,self.Alpha)self.Colorc.a=q end;function h:SetMaterial(q)q=q||""if!pac.Handleurltex(self,q)then if q==""then self.Materialm=nil else self.Materialm=pac.Material(q,self)self:CallRecursive("OnMaterialChanged")end end;self.Material=q end;function h:SetRelativeBones(p)self.RelativeBones=p;local o=self:GetOwner()if o:IsValid()then self:UpdateScale(o)end end;function h:UpdateWeaponDraw(o)local r=o&&o:IsValid()&&o.GetActiveWeapon&&o:GetActiveWeapon()||NULL;if r:IsWeapon()then if!r.pac_weapon_class then r:SetNoDraw(!self.DrawWeapon)end end end;function h:UpdateColor()d(self.Colorf.r*self.Brightness,self.Colorf.g*self.Brightness,self.Colorf.b*self.Brightness)if pac.drawing_motionblur_alpha then return end;c(self.Alpha)end;function h:UpdateMaterial()local s=self.MaterialOverride||self.Materialm;if s then e(s)end end;function h:UpdateAll(o)self:UpdateColor(o)self:UpdateMaterial(o)self:UpdateScale(o)end;local t=Angle()local function u()local v=0;local w=0;local x=0;return function()local y=FrameNumber()if y==v then w=w+1 else v=y;if x!=w then x=w end;w=1 end;return w<x end end;function h:OnShow()local o=self:GetOwner()if!o:IsValid()then return end;self:SetModel(self:GetModel())if self.Weapon&&o.GetActiveWeapon&&o:GetActiveWeapon():IsValid()then o=o:GetActiveWeapon()end;for z,l in pairs(j)do self["Set"..l](self,self[l])end;self:SetColor(self:GetColor())o:SetColor(self.Colorc)self:UpdateWeaponDraw(self:GetOwner())function o.RenderOverride()if self:IsValid()then if!self.HideEntity then if self.SuppressFrames then if!self.should_suppress then self.should_suppress=u()end;if self.should_suppress()then return end end;self:ModifiersPostEvent("PreDraw")self:PreEntityDraw(o)local A=!self.Position:IsZero()||!self.Angles:IsZero()local B;self.BoneOverride=nil;if A then B=o:GetPos()self.BoneOverride="none"local B,C=self:GetDrawPosition()o:SetPos(B)o:SetRenderAngles(C)pac.SetupBones(o)end;o:SetSkin(self.Skin)if o.pac_bodygroups_torender then for D,E in pairs(o.pac_bodygroups_torender)do o:SetBodygroup(D,E)end end;o.pac_bodygroups_torender=nil;if self.EyeTarget.GetWorldPosition then o:SetEyeTarget(self.EyeTarget:GetWorldPosition())end;o:DrawModel()if A then o:SetPos(B)o:SetRenderAngles(t)end;self:PostEntityDraw(o)self:ModifiersPostEvent("OnDraw")end else o.RenderOverride=nil end end;self.current_ro=o.RenderOverride;self:UpdateScale()if self.LodOverride!=-1 then self:SetLodOverride(self.LodOverride)end end;local F=CreateConVar('pac_allow_mdl','1',CLIENT&&{FCVAR_REPLICATED}||{FCVAR_ARCHIVE,FCVAR_REPLICATED},'Allow to use custom MDLs')local G=CreateConVar('pac_allow_mdl_entity','1',CLIENT&&{FCVAR_REPLICATED}||{FCVAR_ARCHIVE,FCVAR_REPLICATED},'Allow to use custom MDLs as Entity')function h:SetModel(H)self.Model=H;local o=self:GetOwner()if!o:IsValid()then return end;pac.ResetBoneCache(o)if H:find("^http")then local I,J=hook.Run('PAC3AllowMDLDownload',self:GetPlayerOwner(),self,H)local K,L=hook.Run('PAC3AllowEntityMDLDownload',self:GetPlayerOwner(),self,H)if G:GetBool()&&F:GetBool()&&I!=false&&K!=false then if o==pac.LocalPlayer then pac.Message("downloading ",H," to use as player model")end;pac.DownloadMDL(H,function(M)if!o:IsValid()then return end;if self:GetPlayerOwner()==pac.LocalPlayer then pac.Message("finished downloading ",H)pac.emut.MutateEntity(self:GetPlayerOwner(),"model",o,self.Model)end;o:SetModel(M)o:SetSubMaterial()for N=0,#o:GetBodyGroups()-1 do o:SetBodygroup(N,0)end;pac.ResetBoneCache(o)for z,O in ipairs(self:GetChildrenList())do O:OnShow(true)end end,function(P)pac.Message(P)self:SetError(P)end,self:GetPlayerOwner())self.mdl_zip=true else local Q=L||J||"mdl is not allowed"self.loading=Q;self:SetError(Q)pac.Message(self:GetPlayerOwner(),' - mdl files are not allowed')end elseif self.Model!=""then if self:GetPlayerOwner()==pac.LocalPlayer then pac.emut.MutateEntity(self:GetPlayerOwner(),"model",o,self.Model)end;o:SetModel(self.Model)pac.RunNextFrame('entity updatemat '..tostring(o),function()if!o:IsValid()||!self:IsValid()then return end;pac.ResetBoneCache(o)o:SetSubMaterial()for N=0,#o:GetBodyGroups()-1 do o:SetBodygroup(N,0)end;self:CallRecursive("CalcShowHide",true)end)self.mdl_zip=false end end;function h:SetLodOverride(i)self.LodOverride=i;local n=self:GetOwner()if n:IsValid()then n:SetLOD(i)end end;function h:OnThink()local o=self:GetOwner()if o:IsValid()then o.pac_mute_footsteps=self.MuteFootsteps;if self.Weapon&&o.GetActiveWeapon&&o:GetActiveWeapon():IsValid()then o=o:GetActiveWeapon()end;if f()&&o:IsPlayer()&&o:GetModelScale()!=self.Size then self:UpdateScale(o)end;if(self.HideEntity||self.Weapon)&&self.current_ro!=o.RenderOverride then self:OnShow()end;o.pac_material=self.Material;o.pac_materialm=self.Materialm;o.pac_color=self.Colorf;o.pac_alpha=self.Alpha;o.pac_brightness=self.Brightness;o.pac_hide_entity=self.HideEntity;o.pac_fullbright=self.Fullbright;o.pac_invert=self.Invert end end;function h:OnRemove()local o=self:GetOwner()if!o:IsValid()then return end;if self:GetPlayerOwner()==pac.LocalPlayer then pac.emut.RestoreMutations(self:GetPlayerOwner(),"model",o)pac.emut.RestoreMutations(self:GetPlayerOwner(),"size",o)end;pac.SetModelScale(o)end;function h:OnHide()local o=self:GetOwner()if!o:IsValid()then return end;if self.Weapon&&o.GetActiveWeapon&&o:GetActiveWeapon():IsValid()then o=o:GetActiveWeapon()end;o.RenderOverride=nil;o:SetColor(Color(255,255,255,255))o.pac_material=nil;o.pac_materialm=nil;o.pac_color=nil;o.pac_alpha=nil;o.pac_brightness=nil;o.pac_hide_entity=nil;o.pac_fullbright=nil;o.pac_invert=nil;for R in pairs(j)do o[R]=nil end;if o:IsPlayer()||o:IsNPC()then else pac.SetModelScale(o,Vector(1,1,1))end;local S=o.GetWeapons&&o:GetWeapons()if S then for z,r in pairs(S)do if!r.pac_weapon_class then r:SetNoDraw(false)end end end;if self.LodOverride!=-1 then o:SetLOD(-1)end end;function h:SetHideEntity(p)self.HideEntity=p;if p then self:OnHide()else self:OnShow()end end;function h:PreEntityDraw(o)self:UpdateWeaponDraw(o)self:UpdateColor(o)self:UpdateMaterial(o)if self.Invert then a(1)end;if self.Fullbright then b(true)end end;function h:PostEntityDraw()if self.Invert then a(0)end;if self.Fullbright then b(false)end;c(1)d(1,1,1)e()end;g:Register()do local IN_SPEED=IN_SPEED;local IN_WALK=IN_WALK;local IN_DUCK=IN_DUCK;local function T(U,V)if V&&V!=0 then local W=U:GetForwardMove()W=W>0&&V||W<0&&-V||0;local X=U:GetSideMove()X=X>0&&V||X<0&&-V||0;U:SetForwardMove(W)U:SetSideMove(X)end end;pac.AddHook("CreateMove","legacy_entity_part_speed_modifier",function(U)if U:KeyDown(IN_SPEED)then T(U,pac.LocalPlayer.pac_sprint_speed)elseif U:KeyDown(IN_WALK)then T(U,pac.LocalPlayer.pac_walk_speed)elseif U:KeyDown(IN_DUCK)then T(U,pac.LocalPlayer.pac_crouch_speed)else T(U,pac.LocalPlayer.pac_run_speed)end end)end
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/sound.lua:
local a,b=pac.PartTemplate("base_movable")b.FriendlyName="legacy sound"b.Group="legacy"b.ClassName="sound"b.ThinkTime=0;b.Group='effects'b.Icon='icon16/sound.png'a:StartStorableVars()a:SetPropertyGroup("generic")a:GetSet("Sound","")a:GetSet("Volume",1,{editor_sensitivity=0.25})a:GetSet("Pitch",0.4,{editor_sensitivity=0.125})a:GetSet("MinPitch",100,{editor_sensitivity=0.125})a:GetSet("MaxPitch",100,{editor_sensitivity=0.125})a:GetSet("RootOwner",true)a:GetSet("SoundLevel",100)a:GetSet("LocalPlayerOnly",false)a:SetPropertyGroup("playback")a:GetSet("PlayOnFootstep",false)a:GetSet("Overlapping",false)a:GetSet("Loop",false)a:GetSet("Sequential",false,{description="if there are multiple sounds (separated by ; or using [min,max] notation), plays these sounds in sequential order instead of randomly"})a:GetSet("SequentialStep",1,{editor_onchange=function(self,c)self.sens=0.25;c=tonumber(c)return math.Round(c)end})a:EndStorableVars()function b:GetNiceName()local d=pac.PrettifyName("/"..self:GetSound())return d&&d:match(".+/(.-)%.")||"no sound"end;function b:Initialize()end;function b:OnShow(e)if!e then self.played_overlapping=false;self:PlaySound()end;local f=self:GetOwner()if f:IsValid()&&f:IsPlayer()then f.pac_footstep_override=f.pac_footstep_override||{}if self.PlayOnFootstep then f.pac_footstep_override[self.UniqueID]=self else f.pac_footstep_override[self.UniqueID]=nil end end end;function b:OnHide()self.played_overlapping=false;self:StopSound()if self.PlayOnFootstep then local f=self:GetOwner()if f:IsValid()then f.pac_footstep_override=nil;if f:IsPlayer()then f.pac_footstep_override=f.pac_footstep_override||{}f.pac_footstep_override[self.UniqueID]=nil end end end end;function b:OnThink()if!self.csptch then self:PlaySound()else if self.Loop then pac.playing_sound=true;if!self.csptch:IsPlaying()then self.csptch:Play()end;self.csptch:ChangePitch(self.Pitch*255+math.sin(pac.RealTime)/2,0)pac.playing_sound=false end end end;local g={["#"]=true,["@"]=true,[">"]=true,["<"]=true,["^"]=true,[")"]=true,["}"]=true,["$"]=true,["!"]=true,["?"]=true}local function h(i)if g[i:sub(1,1)]then i=i:gsub("^(.)",function()return"*"end)end;if g[i:sub(2,2)]then i=i:gsub("^(..)",function(j)return j[1].."*"end)end;return i end;function b:SetSound(d)if!isstring(d)then self.Sound=""return end;if g[d:sub(1,1)]||g[d:sub(2,2)]then d=h(d)end;self.Sound=d:gsub("\\","/")self:PlaySound()end;function b:SetVolume(c)self.Volume=c;if!self.csptch then self:PlaySound()end;if self.csptch then self.csptch:ChangeVolume(math.Clamp(self.Volume,0.001,1),0)end end;function b:SetPitch(c)self.Pitch=c;if!self.csptch then self:PlaySound()end;if self.csptch then self.csptch:ChangePitch(math.Clamp(self.Pitch*255,1,255),0)end end;function b:PlaySound(k,l)local f=self.RootOwner&&self:GetRootPart():GetOwner()||self:GetOwner()if f:IsValid()then if f:GetClass()=="viewmodel"||f==pac.LocalHands then f=pac.LocalPlayer end;if self:GetLocalPlayerOnly()&&f!=pac.LocalPlayer then return end;local i;if k&&self.Sound==""then i=k else local m=self.Sound:Split(";")if#m>1 then if self.Sequential then self.seq_index=self.seq_index||1;i=m[self.seq_index]self.seq_index=self.seq_index+self.SequentialStep;self.seq_index=self.seq_index%(#m+1)if self.seq_index==0 then self.seq_index=1 end else i=table.Random(m)end elseif#m==1 then if string.match(m[1],"%[(%d-),(%d-)%]")then local function n(o,d)local p,q=o:match("%[(%d-),(%d-)%]")if o:match("%[(%d-),(%d-)%]")==nil then return 1 end;if q<p then q=p end;if d=="min"then return tonumber(p)elseif d=="max"then return tonumber(q)else return tonumber(q)end end;if self.Sequential then self.seq_index=self.seq_index||n(self.Sound,"min")i=self.Sound:gsub("(%[%d-,%d-%])",self.seq_index)self.seq_index=self.seq_index+self.SequentialStep;local r=n(self.Sound,"max")-n(self.Sound,"min")+1;if self.seq_index>n(self.Sound,"max")then self.seq_index=self.seq_index-r elseif self.seq_index<n(self.Sound,"min")then self.seq_index=self.seq_index+r end else i=self.Sound:gsub("(%[%d-,%d-%])",function(o)local p,q=o:match("%[(%d-),(%d-)%]")if q<p then q=p end;return math.random(p,q)end)end else i=m[1]||k end end end;local s;if k&&self.Volume==-1 then s=l||1 else s=self.Volume end;local t;if self.MinPitch==self.MaxPitch then t=self.Pitch*255 else t=math.random(self.MinPitch,self.MaxPitch)end;pac.playing_sound=true;if self.Overlapping then if!self.played_overlapping then f:EmitSound(i,s*160,t)self.played_overlapping=true end else if self.csptch then self.csptch:Stop()end;local u=CreateSound(f,i)u:SetSoundLevel(self.SoundLevel)u:PlayEx(s,t)f.pac_csptch=u;self.csptch=u end;pac.playing_sound=false end end;function b:StopSound()if self.csptch then self.csptch:Stop()end end;local v={CHAN_AUTO=0,CHAN_WEAPON=1,CHAN_VOICE=2,CHAN_ITEM=3,CHAN_BODY=4,CHAN_STREAM=5,CHAN_STATIC=6}for w,x in pairs(v)do sound.Add({name="pac_silence_"..w:lower(),channel=x,volume=0,soundlevel=0,pitchstart=0,pitchend=0,sound="ambient/_period.wav"})end;a:Register()
--addons/!lpakr_out/lua/pac3/editor/client/select.lua:
local a=pace.LanguageString;pace.selectControl={}local b=pace.selectControl;function b.VecToScreen(c)return c:ToScreen()end;function b.GetMousePos()return input.GetCursorPos()end;function b.GUIMousePressed(d)end;function b.GUIMouseReleased(d)end;function b.HUDPaint()end;local e=CreateConVar('pac_render_attachments','0',{FCVAR_ARCHIVE},'Render attachments when selecting bones')function pace.ToggleRenderAttachments()RunConsoleCommand('pac_render_attachments',e:GetBool()&&'0'||'1')end;local f="pac_select"local g=0.05;surface.CreateFont(f,{font="DejaVu Sans",size=500*g,weight=800,antialias=true,additive=true})local h=f.."_blur"surface.CreateFont(h,{font="DejaVu Sans",size=500*g,weight=800,antialias=true,additive=false,blursize=3})local function i(j,k,l,m)surface.SetFont(h)surface.SetTextColor(color_black)for n=1,10 do surface.SetTextPos(l,m)surface.DrawText(j)end;surface.SetFont(f)surface.SetTextColor(k)surface.SetTextPos(l,m)surface.DrawText(j)end;local o;local p=20;local l,m=0,0;local q=5;local r=12;local s=7;local t=5;local u=83;local v=167;local w=213;local x=148;local y=67;local z=201;local A=surface.GetTextureID("gui/center_gradient.vtf")function pace.DrawHUDText(l,m,j,B,C,D,E,F,G)D=D||gui.MouseX()E=E||gui.MouseY()local k=F&&Color(128,255,128)||color_white;surface.SetDrawColor(G||k)pace.util.DrawLine(Lerp(0.025,D,l+B),Lerp(0.025,E,m+C),Lerp(0.05,l+B,D),Lerp(0.05,m+C,E),F&&4||1)surface.SetFont(f)local H,I=surface.GetTextSize(j)i(j,k,l+B-H/2,m+C-I/2)end;local function J(K)return l>K.x-p&&l<K.x+p&&m>K.y-p&&m<K.y+p end;local function L(K,M,N,O,P)if!K.visible then return false end;surface.SetDrawColor(M,N,O,255)surface.DrawOutlinedRect(K.x-P*0.5,K.y-P*0.5,P,P)surface.SetDrawColor(0,0,0,255)surface.DrawOutlinedRect(K.x-P*0.5-1,K.y-P*0.5-1,P+2,P+2)return J(K)end;function pace.DrawSelection(K)return L(K,255,255,255,q)end;function pace.DrawSelectionHovered(K)return L(K,u,v,w,s)end;function pace.DrawSelectionSelected(K)return L(K,x,y,z,r+math.sin(RealTime()*4)*3)end;local function Q(R)local S=R.Nick&&R:Nick()if!S||S==""then S=language.GetPhrase(R:GetClass())end;return R:EntIndex().." - "..S end;function pace.StopSelect()pac.RemoveHook("GUIMouseReleased","draw_select")pac.RemoveHook("GUIMousePressed","draw_select")pac.RemoveHook("HUDPaint","draw_select")function b.GUIMousePressed(d)end;function b.GUIMouseReleased(d)end;function b.HUDPaint()end;timer.Simple(0.1,function()pace.IsSelecting=false end)end;local function T(U,V,W,X,Y,Z,_)local a0;local F={}o=nil;local function a1(d)if d==MOUSE_LEFT then if!F then pace.StopSelect()end;o=Vector(b.GetMousePos())end end;local function a2(d)if d==MOUSE_LEFT then if a0 then a0.dist=nil;Y(a0)pace.StopSelect()end end end;local function a3()if _&&!_()then pace.StopSelect()return end;surface.SetAlphaMultiplier(1)l,m=b.GetMousePos()local a4={}for a5,a6 in pairs(U)do if V(a5,a6)then goto a7 end;local K=b.VecToScreen(W(a5,a6))local a8=X(a5,a6)if J(K)then table.insert(a4,{pos=K,friendly=a8,dist=pace.util.FastDistance2D(K.x,K.y,l,m),key=a5,value=a6})else local a9=false;if F then for n,aa in ipairs(F)do if aa.key==a5&&aa.value==a6 then a9=true;break end end end;if!a9 then pace.DrawSelection(K)end end::a7::end;if a4[1]then table.sort(a4,function(ab,O)return ab.dist<O.dist end)if!F||!o then F={}local ac=a4[1]for n,ad in ipairs(a4)do if math.Round(ad.dist/200)==math.Round(ac.dist/200)then table.insert(F,ad)else break end end;if#F<3&&ac.dist<p/4 then F={ac}end end elseif!o then F=nil end;if F then if#F==1 then local ad=F[1]pace.DrawSelectionSelected(ad.pos)pace.DrawHUDText(ad.pos.x,ad.pos.y,a(ad.friendly),0,-30,ad.pos.x,ad.pos.y)a0=ad;if Z then Z(ad.key,ad.value)end else table.sort(F,function(ab,O)return a(ab.friendly)>a(O.friendly)end)local ae;local af=math.min(#F*30,400)for ag,ad in ipairs(F)do local ah=math.sin(ag/#F*math.pi*2)*af;local ai=math.cos(ag/#F*math.pi*2)*af;ad.pos=b.VecToScreen(W(ad.key,ad.value))if o&&pace.util.FastDistance2D(ad.pos.x+ah,ad.pos.y+ai,l,m)<p then pace.DrawSelectionSelected(ad.pos)pace.DrawHUDText(ad.pos.x,ad.pos.y,a(ad.friendly),ah,ai,ad.pos.x,ad.pos.y,true)ae=ad;if Z then Z(ad.key,ad.value)end else pace.DrawSelectionHovered(ad.pos)pace.DrawHUDText(ad.pos.x,ad.pos.y,a(ad.friendly),ah,ai,ad.pos.x,ad.pos.y,false,Color(255,255,255,128))end end;a0=ae end end end;pace.IsSelecting=true;b.HUDPaint=a3;b.GUIMousePressed=a1;b.GUIMouseReleased=a2;pac.AddHook("GUIMousePressed","draw_select",b.GUIMousePressed)pac.AddHook("GUIMouseReleased","draw_select",b.GUIMouseReleased)pac.AddHook("HUDPaint","draw_select",b.HUDPaint)end;function pace.SelectBone(R,Y,aj)if!R||!R:IsValid()then return end;local a4=table.Copy(pac.GetModelBones(R))if aj then local ak=R:GetModel()&&util.GetModelMeshes(R:GetModel())if ak then for ag,ad in pairs(a4)do if!ad.bone then a4[ag]=nil end end end;for ag,ad in pairs(a4)do if ad.is_special||!e:GetBool()&&ad.is_attachment then a4[ag]=nil end end end;T(a4,function()end,function(ag,ad)return pac.GetBonePosAng(R,ag)end,function(ag,ad)return ag end,Y,function(a5,aa)if aa.is_special||aa.is_attachment then return end;R.pac_bones_select_target=aa.i end,function()return R:IsValid()end)end;function pace.SelectPart(al,Y)T(al,function(am,an)return an:IsHidden()&&an:GetShowInEditor()end,function(am,an)if an.GetDrawPosition then return an:GetDrawPosition()end;local ao=an:GetOwner()if ao:IsValid()then return ao:GetPos()end;ao=an:GetPlayerOwner()if ao:IsValid()then return ao:GetPos()end end,function(am,an)return an:GetName()end,function(a0)return Y(a0.value)end)end;function pace.SelectEntity(Y)T(ents.GetAll(),function(am,R)return!R:IsValid()||R:EntIndex()==-1 end,function(am,R)return R:EyePos()end,function(am,R)return Q(R)end,function(a0)return Y(a0.value)end)end
--addons/!lpakr_out/lua/pac3/editor/client/saved_parts.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/fonts.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/render_scores.lua:
local a=CreateClientConVar("pac_show_profiling_info",1,true,true)local b="pac_render_score"surface.CreateFont(b,{font="Arial",shadow=true,size=14,antialias=false})pace.RenderTimes={}function pace.GetProfilingData(c)local d=false;if d then local e={events={}}e.times_rendered=d.times_ran;for f,g in pairs(d.types)do e.events[f]={average_ms=g.total_render_time/e.times_rendered}end;return e end end;timer.Create("pac_render_times",0.1,0,function()if!pac.IsEnabled()then return end;for h,i in pairs(player.GetHumans())do local g=pace.GetProfilingData(i)if g then local j=0;for k,l in pairs(g.events)do j=j+l.average_ms*0.001 end;pace.RenderTimes[i:EntIndex()]=j end end end)pac.AddHook("HUDPaint","pac_show_render_times",function()if!pace.IsActive()||!pace.IsFocused()||!a:GetBool()then return end;for h,i in pairs(player.GetHumans())do if i==pac.LocalPlayer then goto m end;local n=i:EyePos()if n:Distance(pac.EyePos)<100 then local n=n:ToScreen()if n.visible then surface.SetFont(b)surface.SetTextColor(255,255,255,255)local j=pace.RenderTimes[i:EntIndex()]if j then surface.SetTextPos(n.x,n.y)surface.DrawText(string.format("average render time : %.3f ms",j*1000))end end end::m::end end)
--addons/!lpakr_out/lua/pac3/editor/client/wear_filter.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/extra/client/contraption.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/pac_init.lua:
-- to prevent workshop addon's pac_init.lua from running

--addons/!lpakr_out/lua/autorun/pac_version.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/pac_version.lua:
AddCSLuaFile()function _G.PAC_VERSION()return GetGlobalString("pac_version")end
--addons/!lpakr_out/lua/casino/ui/casinopanel_ui.lua:
return lpakr()()
--addons/!lpakr_out/lua/casino/ui/casinoactions_ui.lua:
local a={Scale=0.03}local b,c=340,120;local d=48;local e=Color(0,0,0,150)function a:DrawButton(b,c)if self:IsHovered()then draw.RoundedBox(6,0,0,b,c,casino.Col.midnight)else draw.RoundedBox(6,0,0,b,c,self.BgColor)end end;function a:Init()self:SetSize(b,c)self:SetPos(0,0)self:SetBackgroundColor(e)self:DockMargin(0,0,0,0)self.Hand={}self.ActionButtons={}self:AddPanel('DPanel',function(f)f:SetBackgroundColor(casino.Col.transparent)f:Dock(FILL)f.AddPanel=function(self,g,h)return ui.Create(g,h,self)end;f:AddPanel('DLabel',function(f)f:Dock(FILL)f:SetText'Wager 0'f:SetFont'ui.20'f:SetTextInset(10,0)self.Wager=f end)f:AddPanel('DPanel',function(f)f:SetBackgroundColor(casino.Col.transparent)f:Dock(RIGHT)f:SetWide(200)f.Paint=function()end;self.ContainerRight=f end)self.Container=f end)self:AddPanel('DPanel',function(f)f:SetBackgroundColor(casino.Col.midnight)f:Dock(BOTTOM)f:SetTall(35)f:DockPadding(2,0,2,5)f.AddPanel=function(self,g,h)return ui.Create(g,h,self)end;self.Actions=f end)hook.Add('HUDShouldDraw',self,function(f,g)if g=='Compass'then return false end end)end;function a:AddPanel(g,h)return ui.Create(g,h,self)end;function a:Populate(i,j,k)self.Table=i;self.Casino=i.Casino;for l,m in ipairs(self.Casino.actions)do self:AddAction(l,m)end;self:OnWagerUpdated(j)self:AddAction(#self.Casino.actions+1,'Surrender',red)if k then local n=1-(LocalPlayer():GetFOV()-75)/25;local o=3*n;self.LocalCamPosition=k.pos+k.dir*o;self.Position=Vector()self.Angle=Angle()self:Start3D(self.Scale)end end;function a:AddAction(l,p,q)self.Actions:AddPanel('DButton',function(r)r:SetText('[F'..l..'] '..p)r:Dock(LEFT)r:DockMargin(5,0,0,0)r:SetContentAlignment(5)r:SetTextColor(color_white)r:SetFont'ui.10'r:SetWide(75)r.BgColor=q||casino.Col.midnight_light;r.Paint=a.DrawButton;r.OnMousePressed=function(s,t)if t!=MOUSE_LEFT then return end;net.Start'casino.RequestAction'net.WriteUInt(l,3)local u=self.Casino:_OnUIActionInput(self,self.Actions,r,p,l)if u then net.WriteBool(true)net.WriteTable(u)else net.WriteBool(false)end;net.SendToServer()end;table.insert(self.ActionButtons,r)end)end;function a:OnCardsAdded(v,w,x)if self.Casino&&self.Casino.MyPosition==w then table.Add(self.Hand,x)end end;function a:OnPlayerTurn(w)if self.Casino&&self.Casino.MyPosition==w then self:ToggleActions(true)else self:ToggleActions(false)end end;function a:OnWagerUpdated(j)self.Wager:SetText('Wager: '..string.Comma(j||0))end;function a:OnRoundStarted()self:Cleanup()end;function a:OnRoundEnded()self:ToggleActions(false)end;function a:OnPlayerWon()self.Actions:SetBackgroundColor(casino.Col.green)timer.Simple(self.Casino.roundcooldown-1,function()if IsValid(self)then self.Actions:SetBackgroundColor(casino.Col.midnight)end end)end;function a:OnPlayerLost()self.Actions:SetBackgroundColor(casino.Col.red)timer.Simple(self.Casino.roundcooldown-1,function()if IsValid(self)then self.Actions:SetBackgroundColor(casino.Col.midnight)end end)end;function a:Cleanup()self.Hand={}self:ToggleActions(false)end;function a:OnUpdateStatus(y,...)self.Casino:_OnUIUpdate(self,self.Actions,self.Hand)end;function a:ToggleActions(z)for l=1,#self.ActionButtons-1 do self.ActionButtons[l]:SetDisabled(!z)end end;function a:Start3D(A)self.IsThreeDimensional=true;hook.Add('PostDrawTranslucentRenderables',self,function()vgui.Start3D2D(self.Position,self.Angle,A)self:Paint3D2D()vgui.End3D2D()end)end;function a:OnRemove()hook.Remove('HUDShouldDraw',self)hook.Remove('PostDrawOpaqueRenderables',self)end;function a:UpdateTransform()if!IsValid(self.Table)||!self.LocalCamPosition then return end;local w=self.Table:LocalToWorld(self.LocalCamPosition+Vector(0,0,4))local B=LocalPlayer():EyePos()B.z=w.z;local C=B-w;local D=C:Angle()D.y=D.y+90;D.r=D.r+60;w=w-D:Forward()*b/2*self.Scale;if thirdPerson then D:RotateAroundAxis(D:Forward(),-15)w.z=w.z+20 end;self.Position=w;self.Angle=D end;function a:Paint(b,c)derma.SkinHook('Paint','Panel',self,b,c)surface.SetDrawColor(255,255,255,255)for l,E in ipairs(self.Hand)do surface.SetMaterial(E.icon)surface.DrawTexturedRect(b-20-(l*d-5),(c-d)*.3,d,d)end;self:UpdateTransform()end;vgui.Register('rp_casino_action',a,'DPanel')
--addons/!lpakr_out/lua/casino/receivers_cl.lua:
local a={[casino.PLAYER_SYNC]=function(b,c)return{net.ReadString(),net.ReadUInt(4),net.ReadBool()&&net.ReadEntity()}end,[casino.PLAYER_WAGER]=function(b,c)return{net.ReadUInt(casino.MaxWagerBits)}end,[casino.PLAYER_READY]=function(b,c)return{net.ReadUInt(casino.MaxWagerBits)}end,[casino.PLAYER_TURN]=function(b,c)return{net.ReadUInt(4),net.ReadPlayer()}end,[casino.PLAYER_CARDS]=function(b,c)local d=net.ReadUInt(4)local e={}while true do local f=net.ReadUInt(casino.CardBits)if f==0 then break end;table.insert(e,casino.deck[f])end;return{d==0,d,e}end}local function g(b,c,h,d,i)local j=casino.NewGame(h,b)if i then i.Casino=j;j:SetController(i)end;j.MyPosition=d;j:SetStatus(c)end;local function k(b,c)local j=casino.GetActive(b)if j then j:SetStatus(c)casino.RemoveActiveGame(b)end end;local function l(b,c,...)local j=casino.GetActive(b)if j then j:SetStatus(c,...)end end;net.Receive('casino.RoundStatus',function()local b=net.ReadUInt(16)local c=net.ReadUInt(4)local m=(a[c]||function()return{}end)()if c==casino.PLAYER_SYNC then g(b,c,unpack(m))elseif c==casino.PLAYER_DESYNC then k(b,c,unpack(m))else l(b,c,unpack(m))end end)
--addons/!lpakr_out/lua/chess/ui/cl_chesspromotion.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/anim_extension/extensions/wos_prone.lua:
wOS.AnimExtension.Mounted["Prone Mod"]=true
--addons/!lpakr_out/lua/wire/gates/array.lua:
GateActions("Array")local a={NUMBER=0,ANGLE=Angle(0,0,0),VECTOR=Vector(0,0,0),STRING="",ENTITY=NULL}local b={NUMBER=function(c)return tostring(c)end,ANGLE=function(c)return string.format("(%d,%d,%d)",c.p,c.r,c.y)end,VECTOR=function(c)return string.format("(%d,%d,%d)",c.x,c.y,c.z)end,STRING=function(c)return c end,ENTITY=function(c)return tostring(c)end}local d={ANGLE=function(e,f)return e.p==f.p&&e.y==f.y&&e.r==f.r end,VECTOR=function(e,f)return e.x==f.x&&e.y==f.y&&e.z==f.z end}local g=function(e,f)return e==f end;for h,i in pairs(a)do local j=h;if j=="NUMBER"then j="NORMAL"end;local k=d[h]||g;GateActions["array_read_"..h]={name="Array Read ("..h..")",description="Attempts to get a "..h:lower().." from the array at the index.",inputs={"R","Index"},inputtypes={"ARRAY","NORMAL"},outputtypes={j},output=function(l,m,n)local o=m[math.floor(n)]local p=type(o)if!o then return i end;if p=="Player"&&h=="ENTITY"then return o end;if p=="NPC"&&h=="ENTITY"then return o end;if string.upper(p)!=h then return i end;return o end,label=function(q,m,n)return string.format("%s[%s] = %s",m,n,b[h](q))end}GateActions["array_find_"..h]={name="Array Find ("..h..")",description="Outputs the index of the specified "..h:lower().." if it exists in the array.",inputs={"R","Value"},inputtypes={"ARRAY",j},outputtypes={"NORMAL"},output=function(l,m,r)for s=1,#m do if s>10000 then return 0 end;local o=m[s]if k(o,r)then return s end end;return 0 end,label=function(q,m,n)return string.format("find(%s,%s) = %d",m,n,q)end}end;GateActions["array_gettype"]={name="Array Get Type",description="Gets the type of the element at the index as a string.",inputs={"R","Index"},inputtypes={"ARRAY","NORMAL"},outputtypes={"STRING"},output=function(l,m,n)local p=type(m[math.floor(n)])if p=="nil"then return"NIL"end;if p=="Player"then return"ENTITY"end;if p=="NPC"then return"ENTITY"end;if!a[string.upper(p)]then return"TYPE NOT SUPPORTED"end;return p end,label=function(q,m,n)return string.format("type(%s[%s]) = %s",m,n,q)end}GateActions["array_count"]={name="Array Count",inputs={"R"},inputtypes={"ARRAY"},outputtypes={"NORMAL"},output=function(l,m)return#m end,label=function(q,m,n)return string.format("#%s = %s",m,q)end}
--addons/!lpakr_out/lua/wire/gates/comparison.lua:
GateActions("Comparison")GateActions["="]={name="Equal",inputs={"A","B"},output=function(a,b,c)if math.abs(b-c)<0.001 then return 1 end;return 0 end,label=function(d,b,c)return b.." == "..c.." = "..d end}GateActions["!="]={name="Not Equal",inputs={"A","B"},output=function(a,b,c)if math.abs(b-c)<0.001 then return 0 end;return 1 end,label=function(d,b,c)return b.." ~= "..c.." = "..d end}GateActions["<"]={name="Less Than",inputs={"A","B"},output=function(a,b,c)if b<c then return 1 end;return 0 end,label=function(d,b,c)return b.." < "..c.." = "..d end}GateActions[">"]={name="Greater Than",inputs={"A","B"},output=function(a,b,c)if b>c then return 1 end;return 0 end,label=function(d,b,c)return b.." > "..c.." = "..d end}GateActions["<="]={name="Less or Equal",inputs={"A","B"},output=function(a,b,c)if b<=c then return 1 end;return 0 end,label=function(d,b,c)return b.." <= "..c.." = "..d end}GateActions[">="]={name="Greater or Equal",inputs={"A","B"},output=function(a,b,c)if b>=c then return 1 end;return 0 end,label=function(d,b,c)return b.." >= "..c.." = "..d end}GateActions["inrangei"]={name="Is In Range (Inclusive)",inputs={"Min","Max","Value"},output=function(a,e,f,g)if f<e then local h=f;f=e;e=h end;if g>=e&&g<=f then return 1 end;return 0 end,label=function(d,e,f,g)return e.." <= "..g.." <= "..f.." = "..d end}GateActions["inrangee"]={name="Is In Range (Exclusive)",inputs={"Min","Max","Value"},output=function(a,e,f,g)if f<e then local h=f;f=e;e=h end;if g>e&&g<f then return 1 end;return 0 end,label=function(d,e,f,g)return e.." < "..g.." < "..f.." = "..d end}GateActions()
--addons/!lpakr_out/lua/wire/wiremonitors.lua:
WireGPU_Monitors={}function WireGPU_AddMonitor(a,b,c,d,e,f,g,h,i,j,k,l)if!k then k=Angle(0,90,90)elseif!isangle(k)then k=Angle(0,90,0)end;local m=(j-i)/(h-g)local n={Name=a,offset=Vector(c,-e,d),RS=(f||(j-i)/512)/2,RatioX=m,x1=g,x2=h,y1=i,y2=j,z=c,rot=k,translucent=l}WireGPU_Monitors[b]=n end;local function o(p)if p.x-0.002<p.y then if p.x-0.002<p.z then return Vector(1,0,0)else return Vector(0,0,1)end else if p.y<p.z then return Vector(0,1,0)else return Vector(0,0,1)end end end;local function q(p)if p.x-0.002>p.y then if p.x>p.z then return Vector(1,0,0)else return Vector(0,0,1)end else if p.y+0.002>p.z then return Vector(0,1,0)else return Vector(0,0,1)end end end;function WireGPU_FromBox(a,b,r,s,l)local t=s-r;local u,v=o(t),q(t)local k=u:Angle()+Angle(90,0,0)if math.abs(v:Dot(k:Forward()))<0.01 then k:RotateAroundAxis(u,90)end;local w=WorldToLocal(r,Angle(0,0,0),Vector(0,0,0),k)local x=WorldToLocal(s,Angle(0,0,0),Vector(0,0,0),k)local r=Vector(math.min(w.x,x.x),math.min(w.y,x.y),math.min(w.z,x.z))local s=Vector(math.max(w.x,x.x),math.max(w.y,x.y),math.max(w.z,x.z))return WireGPU_FromBox_Helper(a,b,r,s,k,l)end;function WireGPU_FromBox_Helper(a,b,r,s,k,l)local y=(r+s)*0.5;local z=Vector(y.x,y.y,s.z+0.2)r=r-z;s=s-z;local g,i=r.x,r.y;local h,j=s.x,s.y;z:Rotate(k)local n={Name=a,offset=z,RS=(j-i)/1024,RatioX=(j-i)/(h-g),x1=g,x2=h,y1=i,y2=j,z=z.z,rot=k,translucent=l}WireGPU_Monitors[b]=n;return n end;function WireGPU_FromRotatedBox(a,b,w,x,A,B,k,l)if isvector(k)then k=Vector:Angle()end;local w=WorldToLocal(w,Angle(0,0,0),Vector(0,0,0),k)local x=WorldToLocal(x,Angle(0,0,0),Vector(0,0,0),k)local A=WorldToLocal(A,Angle(0,0,0),Vector(0,0,0),k)local B=WorldToLocal(B,Angle(0,0,0),Vector(0,0,0),k)local r=Vector(math.min(w.x,x.x,A.x,B.x),math.min(w.y,x.y,A.y,B.y),math.min(w.z,x.z,A.z,B.z))local s=Vector(math.max(w.x,x.x,A.x,B.x),math.max(w.y,x.y,A.y,B.y),math.max(w.z,x.z,A.z,B.z))print(r,s,k)return WireGPU_FromBox_Helper(a,b,r,s,k,l)end;WireGPU_FromBox_Helper("Workspace 002","models/props_lab/workspace002.mdl",Vector(-20,49,-34),Vector(16.2,84,-30.5),Angle(0,133.34,59.683))WireGPU_AddMonitor("Small TV","models/props_lab/monitor01b.mdl",6.53,0.45,1.0,0.0185,-5.535,3.5,-4.1,5.091)WireGPU_FromBox_Helper("Old TV","models/props_c17/tv_monitor01.mdl",Vector(-9.1,-4.6,-3),Vector(5.5,5.8,6),Angle(0,90,90))WireGPU_AddMonitor("Monitor Small","models/kobilica/wiremonitorsmall.mdl",0.3,5.0,0,0.0175,-4.4,4.5,0.6,9.5)WireGPU_AddMonitor("LCD Monitor (4:3)","models/props/cs_office/computer_monitor.mdl",3.3,16.7,0,0.031,-10.5,10.5,8.6,24.7)WireGPU_AddMonitor("Monitor Big","models/kobilica/wiremonitorbig.mdl",0.2,13,0,0.045,-11.5,11.6,1.6,24.5)WireGPU_AddMonitor("Plasma TV (4:3)","models/blacknecro/tv_plasma_4_3.mdl",0.1,-0.5,0,0.082,-27.87,27.87,-20.93,20.93)WireGPU_AddMonitor("Plasma TV (16:10)","models/props/cs_office/tv_plasma.mdl",6.1,18.93,0,0.065,-28.5,28.5,2,36)WireGPU_AddMonitor("Billboard","models/props/cs_assault/billboard.mdl",1,0,0,0.23,-110.512,110.512,-57.647,57.647)WireGPU_FromBox_Helper("Beige CRT Monitor","models/props_lab/monitor01a.mdl",Vector(-9.3,-4.9,-3),Vector(9.3,10.4,12.45),Angle(0,90,85))WireGPU_FromBox_Helper("White CRT Monitor","models/props_lab/monitor02.mdl",Vector(-9.0,6.3,-3),Vector(9.0,21.2,12.8),Angle(0,90,82.5))WireGPU_AddMonitor("Cube 1x1x1","models/hunter/blocks/cube1x1x1.mdl",24,0,0,nil,-23.275,23.275,-23.275,23.275)WireGPU_AddMonitor("Panel 1x1","models/hunter/plates/plate1x1.mdl",0,1.7,0,nil,-23.275,23.275,-23.275,23.275,true)WireGPU_AddMonitor("Panel 2x2","models/hunter/plates/plate2x2.mdl",0,1.7,0,nil,-47.45,47.45,-47.45,47.45,true)WireGPU_AddMonitor("Panel 0.5x0.5","models/hunter/plates/plate05x05.mdl",0,1.7,0,nil,-11.8265,11.8265,-11.8265,11.8265,true)WireGPU_AddMonitor("Tray","models/props/cs_militia/reload_bullet_tray.mdl",0,0.8,0,nil,0,7.68,0,4.608,true)WireGPU_FromBox_Helper("Wall-mounted TV","models/props_wasteland/controlroom_monitor001b.mdl",Vector(-10.2,-12.6,-3),Vector(10.7,4.7,15.38),Angle(0,90,103.2))WireGPU_FromBox_Helper("Oscilloscope","models/props_lab/reciever01b.mdl",Vector(-5.93,-2,-3),Vector(-1.74,2.1,6.225),Angle(0,90,90))WireGPU_FromBox_Helper("Oscilloscope 2","models/props_c17/consolebox03a.mdl",Vector(4,2,-10),Vector(10.6,7.1,10),Angle(0,90,90))WireGPU_FromBox_Helper("Oscilloscope 3","models/props_c17/consolebox05a.mdl",Vector(-6,0,-10),Vector(0.9,5.1,11),Angle(0,90,87))WireGPU_FromBox_Helper("Receiver","models/props_lab/reciever01c.mdl",Vector(-5.2,-1.7,-3),Vector(-0.2,0.8,5.5),Angle(0,90,90))WireGPU_FromBox_Helper("Receiver 2","models/props_lab/reciever01d.mdl",Vector(-5.2,-1.7,-3),Vector(-0.2,0.8,5.5),Angle(0,90,90))WireGPU_FromBox_Helper("Oscilloscope 4","models/props_c17/consolebox01a.mdl",Vector(8.5,7.2,-10),Vector(15,9.4,16.4),Angle(0,90,90))WireGPU_FromBox_Helper("Combine Console","models/props_combine/combine_interface001.mdl",Vector(-9.9,25.6,-10),Vector(5.7,33.5,34.2),Angle(0,90,41.5))WireGPU_FromBox_Helper("Cash Register","models/props_c17/cashregister01a.mdl",Vector(-9.2,8.5,-10),Vector(4.4,11.6,-5.9),Angle(0,180,90))WireGPU_FromBox_Helper("Combine Monitor","models/props_combine/combine_monitorbay.mdl",Vector(-30.7,-26,-10),Vector(38,34.7,-2),Angle(0,90,90))WireGPU_FromBox_Helper("Workspace 001","models/props_lab/workspace001.mdl",Vector(4,37,0),Vector(21.2,52,11.1),Angle(0,15,83))WireGPU_FromBox_Helper("Radio","models/props_lab/citizenradio.mdl",Vector(-5.8,11.7,-3),Vector(11.3,15.3,8.2),Angle(0,90,90))WireGPU_FromBox_Helper("Security Bank","models/props_lab/securitybank.mdl",Vector(-4.6,66,-3),Vector(25,86.5,12),Angle(0,90,90))WireGPU_FromBox_Helper("GPS","models/beer/wiremod/gps.mdl",Vector(-2.9,-2.1,-3),Vector(2.9,2.9,1.18),Angle(0,90,0))WireGPU_FromBox_Helper("E2","models/beer/wiremod/gate_e2.mdl",Vector(-2.8,-2.8,-3),Vector(2.8,2.8,0.55),Angle(0,90,0))WireGPU_FromBox_Helper("Target Finder","models/beer/wiremod/targetfinder.mdl",Vector(-3.2,-2.3,-3),Vector(3.2,1.2,1.5),Angle(0,90,0))WireGPU_FromBox_Helper("4-pin DIP","models/bull/gates/microcontroller1.mdl",Vector(-2.3,-1.2,-3),Vector(2.3,1.2,0.96),Angle(0,90,0))WireGPU_FromBox_Helper("8-pin DIP","models/bull/gates/microcontroller2.mdl",Vector(-4.3,-1.2,-3),Vector(4.3,1.2,0.96),Angle(0,90,0))WireGPU_FromBox_Helper("Gate","models/jaanus/wiretool/wiretool_gate.mdl",Vector(-2.9,-2.9,-3),Vector(2.9,2.9,0.82),Angle(0,90,0))WireGPU_FromBox_Helper("Controller","models/jaanus/wiretool/wiretool_controlchip.mdl",Vector(-3.4,-1.5,-3),Vector(3.4,1.5,0.82),Angle(0,90,0))WireGPU_FromBox_Helper("Keypad","models/props_lab/keypad.mdl",Vector(-1.7,2,-3),Vector(1.7,4,0.68),Angle(0,90,90))WireGPU_FromBox_Helper("C4","models/weapons/w_c4_planted.mdl",Vector(1.5,1.35,-3),Vector(7.8,4.6,8.65),Angle(0,-90,0))WireGPU_FromBox_Helper("Toolgun","models/weapons/w_toolgun.mdl",Vector(-1.4,4.7,-3),Vector(1.05,7.16,-0.14),Angle(0,-90,45))WireGPU_FromBox_Helper("Blue Panel 1x1","models/xqm/panel1x1.mdl",Vector(-9.2,-9.2,-3),Vector(9.2,9.2,-0.3),Angle(0,-90,0))WireGPU_FromBox_Helper("Blue Panel 1x2","models/xqm/panel1x2.mdl",Vector(-9.2,-31.2,-3),Vector(9.2,9.2,-0.3),Angle(0,-90,0))WireGPU_FromBox_Helper("Blue Box","models/xqm/box5s.mdl",Vector(-9.2,-9.2,-3),Vector(9.2,9.2,9.3),Angle(0,-90,90))WireGPU_FromBox_Helper("Teleporter","models/props_lab/miniteleport.mdl",Vector(20.8,-8.1,-3),Vector(30.2,-3.7,17.8),Angle(0,90,55))WireGPU_FromBox_Helper("Printer","models/props_lab/plotter.mdl",Vector(-10.2,-19.5,-3),Vector(-6.7,-18.3,39.6),Angle(0,90,0))WireGPU_FromBox_Helper("Combine Console 2","models/props_combine/combine_interface002.mdl",Vector(-14.15,27.5,-10),Vector(11.5,32.3,34.2),Angle(0,90,41.5))WireGPU_FromBox_Helper("Combine Console 3","models/props_combine/combine_interface003.mdl",Vector(-20.3,48.7,-10),Vector(19.9,50.9,13),Angle(0.5,91,70))WireGPU_FromBox_Helper("Combine Monitor 2","models/props_combine/combine_intmonitor003.mdl",Vector(-17,0,-10),Vector(15,48.5,22.8),Angle(0,90,90))WireGPU_FromBox_Helper("Combine Monitor 3","models/props_combine/combine_intmonitor001.mdl",Vector(-16,3,-10),Vector(10,48.5,-4.1),Angle(0,90,90))WireGPU_FromBox_Helper("Workspace 003","models/props_lab/workspace003.mdl",Vector(110,73.3,-3),Vector(149,96,-1),Angle(0,90,101))WireGPU_FromBox_Helper("Workspace 004","models/props_lab/workspace004.mdl",Vector(4.2,37,0),Vector(21.4,52,11.1),Angle(0,15,83))WireGPU_FromBox_Helper("Servers","models/props_lab/servers.mdl",Vector(-18.2,7.8,0),Vector(-4.7,19.1,12.1),Angle(0,90,82))WireGPU_AddMonitor("Plasma TV (16:10) 2","models/props_phx/rt_screen.mdl",6.1,18.93,0,0.065,-28.5,28.5,2,36)WireGPU_FromBox_Helper("8x2 LCD","models/fasteroid/bull/lcd1.mdl",Vector(-4.91,-1.02,-3),Vector(1.31,1.02,0.8),Angle(0,90,0))WireGPU_FromBox_Helper("16x2 LCD","models/fasteroid/bull/lcd2.mdl",Vector(-4.91,-1.02,-3),Vector(7.52,1.02,0.8),Angle(0,90,0))WireGPU_FromBox_Helper("16x4 LCD","models/fasteroid/bull/lcd3.mdl",Vector(-4.91,-3.11,-3),Vector(7.52,1.02,0.8),Angle(0,90,0))WireGPU_FromBox_Helper("40x4 LCD","models/fasteroid/bull/lcd4.mdl",Vector(-4.91,-3.11,-3),Vector(26.22,1.02,0.8),Angle(0,90,0))WireGPU_FromBox_Helper("20x4 LCD","models/fasteroid/bull/lcd5.mdl",Vector(-4.91,-3.11,-3),Vector(10.65,1.02,0.8),Angle(0,90,0))WireGPU_FromBox("TF2 Red billboard","models/props_mining/billboard001.mdl",Vector(0,-168,0),Vector(3,168,192),false)WireGPU_FromBox("TF2 Red vs Blue billboard","models/props_mining/billboard002.mdl",Vector(0,-306,96),Vector(3,306,288),false)WireGPU_AddMonitor("Window","models/props_phx/construct/windows/window1x1.mdl",0,1.7,0,nil,-17.3,17.3,-17.3,17.3,true,true)local function C(self,b)local D;local E=ents.GetAll()for F=1,#E do local G=E[F]if G:GetModel()==b&&G:GetClass()!="class C_BaseFlex"&&G:GetClass()!="gmod_ghost"then D=G;break end end;if!D then return nil end;local H=Vector(0.25,0.25,0.25)local r=D:OBBMins()+H;local s=D:OBBMaxs()-H;return WireGPU_FromBox("Auto: "..b:match("([^/]*)$"),b,r,s,false)end;setmetatable(WireGPU_Monitors,{__index=C})
--addons/!lpakr_out/lua/wire/flir.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/wire_soundpropertylist.lua:
local a={}local b=200;AccessorFunc(a,"m_strSearchPattern","SearchPattern")AccessorFunc(a,"m_strSelectedSound","SelectedSound")AccessorFunc(a,"m_nListSpeed","ListSpeed")AccessorFunc(a,"m_nMaxItems","MaxItems")local function c(d,e)if!e then return true end;if e==""then return true end;d=string.lower(d)e=string.lower(e)if string.find(d,e,0,true)then return true end;return false end;local function f(self,e)if!IsValid(self)then return end;self:ClearList()local g=sound.GetTable()||{}local h=#g;self.SearchProgress:SetVisible(true)if h<=0 then self.SearchProgress:SetVisible(false)return end;self.SearchProgress:SetFraction(0)self.SearchProgressLabel:SetText("Searching... (0 %)")self.SearchProgressLabel:SizeToContents()self.SearchProgressLabel:Center()WireLib.Timedpairs(self.TimedpairsName,g,self.m_nListSpeed,function(i,j,self)if!IsValid(self)then return false end;if!IsValid(self.SoundProperties)then return false end;if!IsValid(self.SearchProgress)then return false end;self.SearchProgress:SetFraction(i/h)self.SearchProgressLabel:SetText("Searching... ("..math.Round(i/h*100).." %)")self.SearchProgressLabel:SizeToContents()self.SearchProgressLabel:Center()if self.TabfileCount>=self.m_nMaxItems then self.SearchProgress:SetFraction(1)self.SearchProgressLabel:SetText("Searching... (100 %)")self.SearchProgressLabel:SizeToContents()self.SearchProgressLabel:Center()self.SearchProgress:SetVisible(false)self:InvalidateLayout()return false end;if!c(j,e)then return end;self:AddItem(i,j)end,function(i,j,self)if!IsValid(self)then return end;if!IsValid(self.SoundProperties)then return end;if!IsValid(self.SearchProgress)then return end;self.SearchProgress:SetFraction(1)self.SearchProgressLabel:SetText("Searching... (100 %)")self.SearchProgressLabel:SizeToContents()self.SearchProgressLabel:Center()self.SearchProgress:SetVisible(false)self:InvalidateLayout()end,self)end;function a:Init()self.TimedpairsName="wire_soundpropertylist_items_"..tostring({})self:SetDrawBackground(false)self:SetListSpeed(100)self:SetMaxItems(400)self.SearchPanel=self:Add("DPanel")self.SearchPanel:DockMargin(0,0,0,3)self.SearchPanel:SetTall(20)self.SearchPanel:Dock(TOP)self.SearchPanel:SetDrawBackground(false)self.SearchText=self.SearchPanel:Add("DTextEntry")self.SearchText:DockMargin(0,0,3,0)self.SearchText:Dock(FILL)self.SearchText.OnChange=function(k)self:SetSearchPattern(k:GetValue())end;self.RefreshIcon=self.SearchPanel:Add("DImageButton")self.RefreshIcon:SetImage("icon16/arrow_refresh.png")self.RefreshIcon:SetWide(20)self.RefreshIcon:Dock(RIGHT)self.RefreshIcon:SetToolTip("Refresh")self.RefreshIcon:SetStretchToFit(false)self.RefreshIcon.DoClick=function()self:Refresh()end;self.SearchProgress=self:Add("DProgress")self.SearchProgress:DockMargin(0,0,0,0)self.SearchProgress:SetTall(20)self.SearchProgress:Dock(BOTTOM)self.SearchProgress:SetVisible(false)self.SearchProgressLabel=self.SearchProgress:Add("DLabel")self.SearchProgressLabel:SizeToContents()self.SearchProgressLabel:Center()self.SearchProgressLabel:SetText("")self.SearchProgressLabel:SetPaintBackground(false)self.SearchProgressLabel:SetDark(true)self.SoundProperties=self:Add("DListView")self.SoundProperties:SetMultiSelect(false)self.SoundProperties:Dock(FILL)local l=self.SoundProperties:AddColumn("No.")l:SetFixedWidth(30)l:SetWide(30)local l=self.SoundProperties:AddColumn("ID")l:SetFixedWidth(40)l:SetWide(40)self.SoundProperties:AddColumn("Name")self.SoundProperties.OnRowSelected=function(m,n,o)local p=o.m_strSoundname;local q=o.m_tabData;self.m_strSelectedSound=p;self:DoClick(p,q,m,o)end;self.SoundProperties.DoDoubleClick=function(m,n,o)local p=o.m_strSoundname;local q=o.m_tabData;self.m_strSelectedSound=p;self:DoDoubleClick(p,q,m,o)end;self.SoundProperties.OnRowRightClick=function(m,n,o)local p=o.m_strSoundname;local q=o.m_tabData;self.m_strSelectedSound=p;self:DoRightClick(p,q,m,o)end;self:Refresh()end;function a:PerformLayout()if!self.SearchProgress:IsVisible()then return end;self.SearchProgressLabel:SizeToContents()self.SearchProgressLabel:Center()end;function a:ClearList()WireLib.TimedpairsStop(self.TimedpairsName)self.SoundProperties:Clear(true)self.TabfileCount=0 end;function a:AddItem(...)local r={...}local s=r[2]if!isstring(s)||s==""then return end;if self.TabfileCount>self.m_nMaxItems then return end;if#s>b then return end;local t={}local u=0;for i,j in ipairs(r)do if i==2 then continue end;u=u+1;t[u]=j end;local o=self.SoundProperties:AddLine(self.TabfileCount+1,...)o.m_strSoundname=s;o.m_tabData=t;if self.m_strSelectedSound==s then self.SoundProperties:SelectItem(o)end;self.TabfileCount=self.TabfileCount+1;return o end;function a:SetSearchPattern(e)self.m_strSearchPattern=e||""self:Refresh()end;function a:SetSelectedSound(v)self.m_strSelectedSound=v||""self:Refresh()end;function a:Refresh()f(self,self.m_strSearchPattern)end;function a:DoClick(p,q,m,o)end;function a:DoDoubleClick(p,q,m,o)end;function a:DoRightClick(p,q,m,o)end;vgui.Register("wire_soundpropertylist",a,"DPanel")
--addons/!lpakr_out/lua/wos/advswl/anim/sh_forcesequence.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/core/cl_core.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/forcepowers/sh_forcepowers.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/devestators/wos_devmaterialbuilding.lua:
wOS=wOS||{}wOS.DevestatorIcons={}wOS.DevestatorIcons["Kyber Slam"]=Material("wos/devestators/slam.png","unlitgeneric")wOS.DevestatorIcons["Lightning Coil"]=Material("wos/devestators/coil.png","unlitgeneric")wOS.DevestatorIcons["Sonic Discharge"]=Material("wos/devestators/sonic.png","unlitgeneric")
--addons/!lpakr_out/lua/advdupe2/sh_codec_legacy.lua:
local pairs=pairs;local type=type;local tonumber=tonumber;local error=error;local Vector=Vector;local Angle=Angle;local a=string.format;local b=string.char;local c=string.byte;local d=string.sub;local e=string.gsub;local f=string.find;local g=string.gmatch;local h=string.match;local i=table.concat;function AdvDupe2.GenerateDupeStamp(j)local k={}k.name=j:GetName()k.time=os.date("%I:%M %p")k.date=os.date("%d %B %Y")k.timezone=os.date("%z")hook.Call("AdvDupe2_StampGenerated",GAMEMODE,k)return k end;local l="AD2F%s\n%s\n%s"local m,n;local o=0;local p,q;local r,s,t,u,v,w,x;local function y()local z=c(p,q+1)if z then local A=n[z]if A then q=q+1;return A()else error(a("encountered invalid data type (%u)\n",z))end else error("expected value, got EOF\n")end end;n={[1]=function()error("expected value, got terminator\n")end,[2]=function()u=f(p,"\1",q)if u then w=d(p,q+1,u-1)q=u else error("expected table identifier, got EOF\n")end;local z={}o[w]=z;while true do if c(p,q+1)==1 then q=q+1;return z else z[y()]=y()end end end,[3]=function()u=f(p,"\1",q)if u then w=d(p,q+1,u-1)q=u else error("expected table identifier, got EOF\n")end;local z,B={},1;o[w]=z;while true do if c(p,q+1)==1 then q=q+1;return z else z[B]=y()B=B+1 end end end,[4]=function()return false end,[5]=function()return true end,[6]=function()u=f(p,"\1",q)if u then r=tonumber(d(p,q+1,u-1))||0;q=u;return r else error("expected number, got EOF\n")end end,[7]=function()u=f(p,"\1",q)if u then w=d(p,q+1,u-1)q=u;return w else error("expected string, got EOF\n")end end,[8]=function()u,v=f(p,".-\1.-\1.-\1",q)if u then r,s,t=h(p,"^(.-)\1(.-)\1(.-)\1",q+1)q=v;return Vector(tonumber(r),tonumber(s),tonumber(t))else error("expected vector, got EOF\n")end end,[9]=function()u,v=f(p,".-\1.-\1.-\1",q)if u then r,s,t=h(p,"^(.-)\1(.-)\1(.-)\1",q+1)q=v;return Angle(tonumber(r),tonumber(s),tonumber(t))else error("expected angle, got EOF\n")end end,[10]=function()u=f(p,"\1",q)if u then w=d(p,q+1,u-1)q=u else error("expected table identifier, got EOF\n")end;x=o[w]if x then return x else error(a("table identifier %s points to nil\n",w))end end}local function C()local z=c(p,q+1)if z then local A=m[z]if A then q=q+1;return A()else error(a("encountered invalid data type (%u)\n",z))end else error("expected value, got EOF\n")end end;m={[1]=function()error("expected value, got terminator\n")end,[2]=function()local z={}while true do if c(p,q+1)==1 then q=q+1;return z else z[C()]=C()end end end,[3]=function()local z,B={},1;while true do if c(p,q+1)==1 then q=q+1;return z else z[B]=C()B=B+1 end end end,[4]=function()return false end,[5]=function()return true end,[6]=function()u=f(p,"\1",q)if u then r=tonumber(d(p,q+1,u-1))||0;q=u;return r else error("expected number, got EOF\n")end end,[7]=function()u=f(p,"\1",q)if u then w=d(p,q+1,u-1)q=u;return w else error("expected string, got EOF\n")end end,[8]=function()u,v=f(p,".-\1.-\1.-\1",q)if u then r,s,t=h(p,"^(.-)\1(.-)\1(.-)\1",q+1)q=v;return Vector(tonumber(r),tonumber(s),tonumber(t))else error("expected vector, got EOF\n")end end,[9]=function()u,v=f(p,".-\1.-\1.-\1",q)if u then r,s,t=h(p,"^(.-)\1(.-)\1(.-)\1",q+1)q=v;return Angle(tonumber(r),tonumber(s),tonumber(t))else error("expected angle, got EOF\n")end end}local function D(E)p=E;q=0;o={}return C()end;local function F(E)p=E;q=0;o={}return y()end;local function G(H)local I=256;local J={}for B=0,255 do J[B]=b(B)end;local q=2;local K={}local L=1;local M=c(H)local N=J[M]K[L]=J[M]local O;local P=#H;local Q;while q<=P do Q=c(H,q)if Q>252 then M=0;Q=256-Q;for B=q+Q,q+1,-1 do M=bit.bor(bit.lshift(M,8),c(H,B))end;q=q+Q+1 else M=Q;q=q+1 end;O=J[M]||N..d(N,1,1)L=L+1;K[L]=O;J[I]=N..d(O,1,1)I=I+1;N=O end;return i(K)end;local R={[2]={[0]="\254"},[5]={[22]="\1",[11]="\2"},[6]={[13]="\7",[35]="\6",[37]="\5",[58]="\3",[31]="\8",[9]="\13",[51]="\9",[55]="\10",[57]="\4",[59]="\15"},[7]={[1]="\14",[15]="\16",[87]="\31",[89]="\30",[62]="\26",[17]="\27",[97]="\19",[19]="\43",[10]="\12",[39]="\33",[41]="\24",[82]="\40",[3]="\32",[46]="\41",[47]="\38",[94]="\25",[65]="\23",[50]="\39",[26]="\11",[7]="\28",[33]="\18",[61]="\17",[25]="\42"},[8]={[111]="\101",[162]="\29",[2]="\34",[133]="\21",[142]="\36",[5]="\20",[21]="\37",[170]="\44",[130]="\22",[66]="\35"},[9]={[241]="\121",[361]="\104",[365]="\184",[125]="\227",[373]="\198",[253]="\117",[381]="\57",[270]="\49",[413]="\80",[290]="\47",[294]="\115",[38]="\112",[429]="\74",[433]="\0",[437]="\48",[158]="\183",[453]="\107",[166]="\111",[469]="\182",[477]="\241",[45]="\86",[489]="\69",[366]="\100",[497]="\61",[509]="\76",[49]="\53",[390]="\78",[279]="\196",[283]="\70",[414]="\98",[53]="\55",[422]="\109",[233]="\79",[349]="\89",[369]="\52",[14]="\105",[238]="\56",[319]="\162",[323]="\83",[327]="\63",[458]="\65",[335]="\231",[339]="\225",[337]="\114",[347]="\193",[493]="\139",[23]="\209",[359]="\250",[490]="\68",[42]="\54",[63]="\91",[286]="\97",[254]="\50",[510]="\108",[109]="\73",[67]="\103",[255]="\122",[69]="\170",[70]="\110",[407]="\176",[411]="\119",[110]="\120",[83]="\146",[149]="\163",[151]="\224",[85]="\51",[155]="\177",[79]="\251",[27]="\118",[447]="\159",[451]="\228",[455]="\175",[383]="\174",[463]="\243",[467]="\157",[173]="\210",[475]="\167",[177]="\84",[90]="\45",[487]="\206",[93]="\226",[495]="\245",[207]="\64",[127]="\147",[191]="\155",[511]="\153",[195]="\208",[197]="\85",[199]="\178",[181]="\82",[102]="\116",[103]="\71",[285]="\144",[105]="\102",[211]="\199",[213]="\123",[301]="\66",[305]="\46",[219]="\137",[81]="\67",[91]="\88",[157]="\130",[325]="\95",[29]="\58",[231]="\201",[117]="\99",[341]="\222",[237]="\77",[239]="\211",[71]="\223"},[10]={[710]="\149",[245]="\60",[742]="\172",[774]="\81",[134]="\151",[917]="\145",[274]="\216",[405]="\242",[146]="\194",[838]="\246",[298]="\248",[870]="\189",[1013]="\150",[894]="\190",[326]="\244",[330]="\166",[334]="\217",[465]="\179",[346]="\59",[354]="\180",[966]="\212",[974]="\143",[370]="\148",[998]="\154",[625]="\138",[382]="\161",[194]="\141",[198]="\126",[402]="\96",[206]="\185",[586]="\129",[721]="\187",[610]="\135",[618]="\181",[626]="\72",[226]="\62",[454]="\127",[658]="\113",[462]="\164",[234]="\214",[474]="\140",[242]="\106",[714]="\188",[730]="\87",[498]="\237",[746]="\125",[754]="\229",[786]="\128",[202]="\93",[18]="\255",[810]="\173",[846]="\131",[74]="\192",[842]="\142",[977]="\252",[858]="\235",[78]="\134",[874]="\234",[882]="\90",[646]="\92",[1006]="\160",[126]="\165",[914]="\221",[718]="\94",[738]="\238",[638]="\197",[482]="\230",[34]="\220",[962]="\133",[6]="\213",[706]="\219",[986]="\171",[994]="\233",[866]="\200",[1010]="\247",[98]="\169",[518]="\236",[494]="\207",[230]="\205",[542]="\191",[501]="\202",[530]="\203",[450]="\204",[209]="\158",[106]="\186",[590]="\136",[218]="\232",[733]="\124",[309]="\168",[221]="\152",[757]="\240",[113]="\215",[114]="\156",[362]="\239",[486]="\132",[358]="\249",[262]="\75",[30]="\218",[821]="\195",[546]="\253"}}local function S(H)local T,U,V=c(H,1,3)if!V||#H<4 then error("invalid input")end;local W=bit.bor(bit.lshift(V,16),bit.lshift(U,8),T)local P=#H+1;local X={}local Y=0;local Z=0;local _=0;local a0;local a1=2;local a2;local q=4;while Y<W do if a1<=_ then a2=R[a1]a0=bit.band(Z,bit.lshift(1,a1)-1)if a2&&a2[a0]then Y=Y+1;X[Y]=a2[a0]Z=bit.rshift(Z,a1)_=_-a1;a1=2 else a1=a1+1;if a1>10 then error("malformed code")end end else Z=bit.bor(Z,bit.lshift(c(H,q),_))_=_+8;q=q+1;if q>P then error("malformed code")end end end;return i(X)end;local function a3(p)local a4,a5=h(p,"^(.-)\n(.-)$")if!a4 then error("invalid input")end;return e(a5,a4,"\26")end;local J;local a6;local function a7(a8)local a9,aa=c(a8),d(a8,3)if a9==89 then return J[aa]elseif a9==86 then local r,s,t=h(aa,"^(.-),(.-),(.+)$")return Vector(tonumber(r),tonumber(s),tonumber(t))elseif a9==65 then local r,s,t=h(aa,"^(.-),(.-),(.+)$")return Angle(tonumber(r),tonumber(s),tonumber(t))elseif a9==84 then local z={}local ab=a6[aa]if!ab then ab={}a6[aa]=ab end;ab[#ab+1]=z;return z elseif a9==78 then return tonumber(aa)elseif a9==83 then return e(d(aa,2,-2),"�",";")elseif a9==66 then return aa=="t"elseif a9==80 then return 1 end;error(a("AD1 deserialization failed: invalid chunk (%u:%s)",a9,aa))end;local function ac(ad)ad=ad:Replace("\r\n","\n")local ae,af,ag,ah=ad:match("%[Info%]\n(.+)\n%[More Information%]\n(.+)\n%[Save%]\n(.+)\n%[Dict%]\n(.+)")if!ae then error("unknown duplication format")end;local ai={}for aj,ak in ae:gmatch("([^\n:]+):([^\n]+)")do ai[aj]=ak end;local al={}for aj,ak in af:gmatch("([^\n:]+):([^\n]+)")do al[aj]=ak end;J={}for aj,ak in ah:gmatch("(.-):\"(.-)\"\n")do J[aj]=ak end;local am={}for an,ao in ag:gmatch("([^\n:]+):([^\n]+)")do local o={}a6={}local ap;for aq,a8 in ao:gmatch('(%w+){(.-)}')do if c(aq)==72 then aq=d(aq,2)ap=aq end;o[aq]={}for ar in g(a8,'[^;]+')do local aj,ak=h(ar,'(.-)=(.+)')if aj then aj=a7(aj)ak=a7(ak)o[aq][aj]=ak else ak=a7(ar)local as=o[aq]as[#as+1]=ak end end end;for aq,at in pairs(a6)do for au,av in pairs(at)do if!o[aq]then error("attempt to reference a nonexistent table")end;for aj,ak in pairs(o[aq])do av[aj]=ak end end end;am[an]=o[ap]end;return am,ai,al end;local function aw(p)local ax=p:find("\2")if!ax then error("attempt to read AD2 file with malformed info block error 1")end;local ai={}local ay=p:sub(1,ax-1)for aj,ak in ay:gmatch("(.-)\1(.-)\1")do ai[aj]=ak end;if ai.check!="\r\n\t\n"then if ai.check=="\10\9\10"then error("detected AD2 file corrupted in file transfer (newlines homogenized)(when using FTP, transfer AD2 files in image/binary mode, not ASCII/text mode)")else error("attempt to read AD2 file with malformed info block error 2")end end;return ai,p:sub(ax+2)end;local az={}az[2]=function(aA)aA=aA:Replace("\r\r\n\t\r\n","\t\t\t\t")aA=aA:Replace("\r\n\t\n","\t\t\t\t")aA=aA:Replace("\r\n","\n")aA=aA:Replace("\t\t\t\t","\r\n\t\n")local ai,ad=aw(aA:sub(7))return F(G(S(a3(ad)))),ai end;az[1]=function(aA)aA=aA:Replace("\r\r\n\t\r\n","\t\t\t\t")aA=aA:Replace("\r\n\t\n","\t\t\t\t")aA=aA:Replace("\r\n","\n")aA=aA:Replace("\t\t\t\t","\r\n\t\n")local ai,ad=aw(aA:sub(7))return D(G(S(a3(ad)))),ai end;az[0]=ac;AdvDupe2.LegacyDecoders=az
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/info.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/filters_sh.lua:
filter={}local function a(b)local c={}for d,e in player.Iterator()do if b(e)then c[#c+1]=e end end;return c end;local function f(b)local c={}for d,g in ents.Iterator()do if b(g)then c[#c+1]=g end end;return c end;function filter.GetActivePlayers(h)return a(function(i)return!i:IsAFK(h)end)end;function filter.GetEnforcement(j,k)return a(function(i)return i:IsEnforcement(nil,nil,j,k)end)end;function filter.InRange(l,m)return a(function(i)return i:GetPos():Distance(l)<m end)end;function filter.InPVS(l)return table.Filter(ents.FindInPVS(l),function(i)return IsValid(i)&&i:IsPlayer()end)end;function filter.GetOwnedClass(e,n)return table.Filter(ents.FindByClass(n),function(g)return g:GetOwner()==e||g:GetPropOwner()==e end)end;function filter.GetOwnedProps(e)return table.Filter(ents.FindByClass('prop_physics'),function(g)return g:GetOwner()==e||g:GetPropOwner()==e end)end;function filter.GetOwnedEnts(e)return table.Filter(ents.GetAll(),function(g)return g:GetOwner()==e||g:GetPropOwner()==e end)end;function filter.GetInRoom(o,p)if p then return f(function(q)local r=q:GetLocation()return r&&r.name==o end)else return a(function(i)local r=i:GetLocation()return r&&r.name==o end)end end;function filter.GetInRoomID(s)return f(function(g)return g:GetLocationID()end)end;function filter.GetEvent()return a(function(i)local t=i:GetAllegiance()return t&&t:IsEvent()end)end;function filter.CanUseEventCharacters()return a(function(i)return i:CanUseEventCharacters()end)end;function filter.GetSpawned(u)return a(function(i)return i:GetAllegiance()!=nil&&i!=u end)end;function filter.GetSpawnedNoEvent(v)v=istable(v)&&v||{v}local w={}for x=1,#v do w[v[x]]=true end;return a(function(i)return i:GetAllegiance()!=nil&&!w[i]&&!i.InEvent end)end;function filter.GetAllegiance(y,z)if z then return a(function(i)return!i:GetGroup()&&i:GetAllegianceID()==y end)else return a(function(i)return i:GetAllegianceID()==y end)end end;function filter.GetTrainers()return a(function(i)return i:IsTrainer()end)end;function filter.GetGM(k,A)return a(function(i)if A&&i:IsAFK()then return false else return i:IsTrialGamemaster(k)||i:IsRoot()end end)end;function filter.GetGMFrom(s)return a(function(i)return i:GetGamemasterID()>=s end)end;function filter.GetSeniorGM()return a(function(i)return i:IsSeniorGamemaster()end)end;function filter.GetStaff()return a(function(i)return i:IsAdmin()end)end;function filter.GetAFK(h)return a(function(i)return i:IsAFK(h)end)end;function filter.GetGroup(s,B)return a(function(i)local C=i:GetGroup()return C&&(B&&C:GetConnected(s)||C.id==s)end)end;function filter.GetNoGroup()return a(function(i)return!i:GetGroup()end)end;function filter.GetPermission(D)return a(function(i)local C=i:GetGroup()if C&&C:HasPermission(D)then return true end;local E=i:GetGroupRank()if E&&E:HasPermission(D)then return true end;local n=i:GetGroupClass()if n&&n:HasPermission(D)then return true end end)end;function table.FilterTable(F,G)local c={}for x,H in pairs(F)do if G(H)then c[x]=H end end;return c end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/table_sh.lua:
function table.merge(a,b)local c=table.Copy(a)for d,e in pairs(b)do if c[d]&&istable(c[d])&&c[d]!=e then c[d]=table.merge(c[d],e,true)else c[d]=e end end;return c end;function table.Add(a,b)for f,e in ipairs(b)do table.insert(a,e)end;return a end;function table.AddCopy(a,b)local g=table.Copy(a)for f,e in ipairs(b)do table.insert(g,e)end;return g end;function table.ArrayHasValue(h,e)for i,j in ipairs(h)do if j==e then return i end end end;function table.Splice(k,l,m)m=m||1;l=l||1;local n=l+m;local o={}local p={}for q,r in ipairs(k)do if q<l||q>=n then table.insert(o,r)else table.insert(p,r)end end;return o,p end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/player_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu_cl.lua:
spawnmenu._GetPropTable=spawnmenu._GetPropTable||spawnmenu.GetPropTable;function spawnmenu.AddQuickAction(a,b,c)local d=player.GetHumans()table.sort(d,function(e,f)return e:Nick()>f:Nick()end)local g,h=a:AddSubMenu(b)for i,j in ipairs(d)do g:AddOption(j:GetTag()..' '..j:Nick(),function(...)c(j,...)end)end end;function spawnmenu.GetPropTable()return table.Merge(spawnmenu.GetCustomPropTable(),spawnmenu._GetPropTable())end;function GM:SpawnMenuEnabled()return true end;function GM:SpawnMenuOpen()return true end;function GM:ContextMenuOpen()return!LocalPlayer():GetRTSMode()end;function GM:GetSpawnmenuTools(b)return spawnmenu.GetToolMenu(b)end;function GM:AddSTOOL(k,l,m,n,o,p)self:AddToolmenuOption('Main',k,l,m,n,o,p)end;function GM:AddGamemodeToolMenuTabs()spawnmenu.AddToolTab('Main','#spawnmenu.tools_tab','icon16/wrench.png')end;function GM:AddToolMenuTabs()end;function GM:AddGamemodeToolMenuCategories()spawnmenu.AddToolCategory('Main','Constraints','#spawnmenu.tools.constraints')spawnmenu.AddToolCategory('Main','Construction','#spawnmenu.tools.construction')spawnmenu.AddToolCategory('Main','Render','#spawnmenu.tools.render')spawnmenu.AddToolCategory('Main','Roleplay','Roleplay')end;function GM:AddToolMenuCategories()end;function GM:PopulatePropMenu()spawnmenu.PopulateFromEngineTextFiles()end;local q={}local r=CurTime()local function s(t)local u=file.Find(t..'*','GAME')for v,w in ipairs(u)do if w:sub(-4,-1)=='.mdl'then if!w:find('_gestures')&&!w:find('_anim')&&!w:find('_gst')&&!w:find('_pst')&&!w:find('_shd')&&!w:find('_ss')&&!w:find('cs_fix')&&!w:find('_anm')then table.insert(q,(t..w):lower())end elseif w:sub(-4,-4)!='.'then r=r+0.02;timer.Simple(r-CurTime(),function()s(t..w..'/')end)end end end;function GM:DoModelSearch(x)local y={}if#q==0 then r=CurTime()s('models/')end;if x:len()<3 then table.insert(y,'Enter at least 3 characters')else x=x:lower()for v,w in ipairs(q)do if w:find(x)then table.insert(y,w)end end end;return y end;cvar.Register'sup_saved_props':SetDefault({})local z={}for v,w in ipairs(cvar.GetValue('sup_saved_props'))do z[w.model]=v end;hook('PopulatePropMenu','srp.SavedProps',function()spawnmenu.AddPropCategory('2','Saved Props',cvar.GetValue('sup_saved_props'),'icon16/heart.png',999,0)end)spawnmenu.AddContentType('model',function(A,B)local C=vgui.Create('SpawnIcon',A)if B.body then B.body=string.Trim(tostring(B.body),'B')end;if B.wide then C:SetWide(B.wide)end;if B.tall then C:SetTall(B.tall)end;C:InvalidateLayout(true)C:SetModel(B.model,B.skin||0,B.body)C:SetTooltip(string.Replace(string.GetFileFromFilename(B.model),'.mdl',''))C.DoClick=function(C)surface.PlaySound('ui/buttonclickrelease.wav')RunConsoleCommand('gm_spawn',C:GetModelName(),C:GetSkinID()||0,C:GetBodyGroup()||'')end;C.OpenMenu=function(C)local a=DermaMenu()a:AddOption('Copy to Clipboard',function()SetClipboardText(string.gsub(B.model,'\\','/'))end)a:AddOption('Spawn using Toolgun',function()RunConsoleCommand('gmod_tool','creator')RunConsoleCommand('creator_type','4')RunConsoleCommand('creator_name',B.model)end)a:AddSpacer()spawnmenu.AddQuickAction(a,'Set Player',function(j)RunConsoleCommand('ba','setmodel',j:SteamID(),B.model)end)a:AddSpacer()a:AddOption('Save/Unsave Prop',function()if z[B.model]then local D=cvar.GetValue('sup_saved_props')table.remove(D,z[B.model])z[B.model]=nil;cvar.SetValue('sup_saved_props',D)C:Remove()else local D=cvar.GetValue('sup_saved_props')local v=#D+1;D[v]={type='model',model=B.model}z[v]=B.model;cvar.SetValue('sup_saved_props',D)end;RunConsoleCommand('spawnmenu_reload')end)a:Open()end;C:InvalidateLayout(true)if IsValid(A)then A:Add(C)end;return C end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/contextmenu_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/toolpanel_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/controls/ctrllistbox_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/commrose_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/font_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/grid_ui.lua:
local a={}function a:Init()self.x_space=2;self.y_space=2;self.autoheight=false;self.items={}self.contentheight=0;self.adjusted=false;self:DockPadding(0,0,0,0)end;function a:SetHorizontal(b)self.Horizontal=b end;function a:SetAdjusted(b,c)self.adjusted=b;self.adjustedAlignLast=c end;function a:GetAdjusted()return self.adjusted,self.adjustedAlignLast end;function a:AddItem(d,e,f)if f then table.insert(self.items,f,d)else table.insert(self.items,d)end;d.InGrid=self;d.FullWidth=e;d:SetParent(self)if e then local g,h,i,j=self:GetDockPadding()d:SetWide(self:GetWide()-g-i)end end;function a:RemoveItem(d)if d.InGrid!=self then return end;d.InGrid=nil;d:SetParent(nil)table.RemoveByValue(self.items,d)end;function a:MoveToFront(d)if d.InGrid!=self then return end;self:RemoveItem(d)self:AddItem(d,d.FullWidth,1)end;function a:MoveToEnd(d)if d.InGrid!=self then return end;self:RemoveItem(d)self:AddItem(d)end;function a:SetSpacing(k,l,m)self.x_space=k;self.y_space=l;if m then local g,h,i,j=self:GetDockPadding()self:DockPadding(g,self.y_space,i,j)end end;function a:UpdatePositions(n,o)local p,q=self.x_space,self.y_space;local r=p;local s=q;local t=n-p-self.x_space*2;local u=0;local v=1;local w={{width=0,height=0,panels={}}}local x,y=self:GetAdjusted()for z=1,#self.items do local d=self.items[z]if!IsValid(d)||!d:IsVisible()then continue end;if d.FullWidth then d:SetWide(self:GetWide()-p*2)end;local A,B=d:GetSize()local C=r+A-t>=self.x_space*.75;if C then w[v].height=u;s=s+(u||B)+self.y_space;r=p;u=0;v=v+1;w[v]={width=0,height=0,panels={}}end;w[v].width=w[v].width+A;table.insert(w[v].panels,{pnl=d,width=A,height=B,X=r,Y=s})if!x then d:SetPos(r,s)end;u=u>B&&u||B;r=r+A+self.x_space end;if self.autoheight then self:SetTall(s+u)end;if x then self:SetAdjustedPadding(p,q,t,w,y)end;self:OnComplete(s+u)end;function a:SetAdjustedPadding(p,q,t,w,y)for z,D in ipairs(w)do local E=table.Count(D.panels)local F=t-D.width;if z==#w&&y then local G=w[z-1]if G then E=table.Count(G.panels)F=t-G.width end end;local H=F/E;local r=p+H/2;for I,J in ipairs(D.panels)do J.pnl:SetPos(r,J.Y)r=r+J.width+H end end end;function a:SetAutoHeight(b)self.autoheight=b;return false end;function a:GetAutoHeight()return self.autoheight end;function a:RemoveItems()for K,L in pairs(self.items)do L:Remove()end end;function a:Clear()for K,L in pairs(self.items)do L:Remove()end end;function a:OnComplete(M)end;function a:PerformLayout(N,M)self:UpdatePositions(N,M)end;function a:Paint(N,M)end;vgui.Register('srp_grid',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/image_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/markdown_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/markdown_ui.lua:
local a={Header='<head><style type="text/css"> %s </style></head>',Body='<body class="markdown-body"> %s </body>'}local b=[[
	@import url('https://fonts.googleapis.com/css?family=Roboto:400,400i,900');

	html{
		margin: 0 auto;
		font-family: Roboto;
		color: #bbb;
		line-height: 1;
		padding: 30px;
		background-color: rgba(0, 0, 0, 0);
	}

	h1, h2, h3, h4 {
		color: #ddd;
		font-weight: 400;

		-webkit-touch-callout: none; /* iOS Safari */
		-webkit-user-select: none; /* Safari */
		-khtml-user-select: none; /* Konqueror HTML */
		-moz-user-select: none; /* Old versions of Firefox */
		-ms-user-select: none; /* Internet Explorer/Edge */
		user-select: none
	}

	a {
		color: #0099ff;
		margin: 0;
		padding: 0;
		vertical-align: baseline;
	}
	a:hover {
		text-decoration: none;
		color: #ff6600;
	}
	a:visited {
		color: purple;
	}
	blockquote {
		border-left:.5em solid #eee;
		padding: 0 2em;
		margin-left:0;
	}
	blockquote  cite {
		font-size:16px;
		line-height:20px;
		color:#bfbfbf;
	}
	blockquote p {
		color: #777;
	}
	hr {
		text-align: left;
		margin: 0 auto 0 0;
		color: #4c4c4c;
	}

	::selection {
		background: #0000ff;
	}

	::-moz-selection {
		background: #0000ff;
	}

	::-webkit-scrollbar {
		width: 7px;
		height: 7px
	}
	::-webkit-scrollbar-button {
		height: 0;
		background-color: transparent
	}
	::-webkit-scrollbar-track {
		background-color: #333
	}
	::-webkit-scrollbar-track-piece {
		background-color: transparent
	}
	::-webkit-scrollbar-thumb {
		height: 5px;
		background-color: rgb(51,128,255);
		border-radius: 0
	}
	::-webkit-scrollbar-corner {
		background-color: #999
	}
]]function a:Init()self:SetBackgroundColor(col.transparent)self:AddPanel('HTML',function(c)c:Dock(FILL)self.Html=c end)end;function a:SetMarkdown(d)local e=self.Header:Replace('%s',b)..self.Body:Replace('%s',srp.ui.Markdown(d))self.Html:SetHTML(e)end;function a:SetText(d)self:SetMarkdown(d)end;vgui.Register('srp_markdown',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/numberinput_ui.lua:
local a={}a.TextInputPanel='srp_textinput'function a:Init()self:SetTall(30)self:DockPadding(0,0,0,0)self:DockMargin(5,5,5,5)self:SetBackgroundColor(col.transparent)self:AddPanel(self.TextInputPanel,function(b)b:DockMargin(0,0,0,0)b:Dock(FILL)b:SetText(0)b:SetNumberInput()b:OnInvalid(function(c)local d=math.Clamp(self:GetValue(),c:GetMinLength()||0,c:GetMaxLength()||0)c:SetText(d||0)c:SetCaretPos(c:GetValue():len())end)b.Paint=function(e,f,g)derma.SkinHook('Paint','NumberInput',e,f,g)return false end;self.input=b end)end;function a:Change(h)local i=(self:GetValue()||0)+h;self:SetValue(i)end;function a:SetValue(j)if tonumber(j)then self.input:SetText(j)end;return self end;function a:SetMinMax(k,l)self.input:SetMinMax(k,l)return self end;function a:SetMinLength(k)self.input:SetMinLength(k)return self end;function a:SetMaxLength(l)self.input:SetMaxLength(l)return self end;function a:GetValue()return tonumber(self.input:GetText())||0 end;function a:SetBackgroundColor(col)if IsValid(self.input)then self.input:SetBackgroundColor(col)end end;function a:SetBorderColor(col)if IsValid(self.input)then self.input:SetBorderColor(col)end end;function a:SetTextColor(col)if IsValid(self.input)then self.input:SetTextColor(col)end end;function a:SetInputWidth(f)self.input_width=f;self.input:Dock(NODOCK)self.input:SetWide(f<=1&&self:GetWide()*f||f)return self end;function a:PerformLayout(f,g)if self.input_width&&IsValid(self.input)then self.input:SetWide(self.input_width<=1&&f*self.input_width||self.input_width)end end;function a:Paint()end;vgui.Register('srp_numberinput',a,'srp_panel')local a=table.Copy(a)a.TextInputPanel='srp_textinput_rounded'vgui.Register('srp_numberinput_rounded',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/presents_ui.lua:
local a={}local b={Material('materials/galactic/ui/chest_loot.png','smooth noclamp'),Material('materials/galactic/ui/skills.png','smooth noclamp'),Material('materials/galactic/ui/paint.png','smooth noclamp')}function a:Init()self:SetSize(ScrW(),ScrH())self:MakePopup()self:Center()self:SetBackgroundColor(col.black)self:SetAlpha(0)self:AlphaTo(255,.5,0)self:AddPanel('srp_label',function(c)c:SetText(srp.seasonal.Present.Title)c:SetFont'ui_header.xl'c:SetTextColor(col.white)c:Dock(TOP)c:DockMargin(0,ScrH()*.2,0,0)c:SetTall(100)c:SetContentAlignment(2)end)self:AddPanel('srp_label',function(c)c:SetText(srp.seasonal.Present.Description1)c:SetFont'ui_header.r'c:SetTextColor(col.white)c:Dock(TOP)c:SetTall(20)c:SetContentAlignment(2)end)self:AddPanel('srp_label',function(c)c:SetText(srp.seasonal.Present.Description2)c:SetFont'ui_header.r'c:SetTextColor(col.white)c:Dock(TOP)c:SetTall(25)c:SetContentAlignment(8)end)self:AddPanel('srp_button',function(d)d:SetText'Thank You!'d:SetSize(250,45)d:SetPos((ScrW()-250)*.5,(ScrH()-45)*.8)d:LeftClick(function(e)e:LeftClick(function()end)self:AlphaTo(0,1,0,function()self:Remove()end)end)local f=Color(20,20,20,100)d.Paint=function(e,g,h)draw.RoundedBox(12,1,1,g-2,h-2,f)end end)end;function a:Populate(i)self.data=i;local g,h=ScrW(),ScrH()self:AddPanel('srp_panel',function(j)j:SetSize(634,250)j:SetPos((ScrW()-624)*.5,(ScrH()-250)*.5)j:SetBackgroundColor(Color(50,50,50,5))for k=1,#i do local l=istable(i[k])&&i[k].prettyname||i[k]if!i[k]then continue end;j:AddPanel('srp_panel',function(m)m:Dock(LEFT)m:SetAlpha(0)m:SetWide(200)m:DockMargin(4,2,4,2)m:DockPadding(5,5,5,5)m:SetBackgroundColor(Color(50,50,50,100))m:SetBorderColor(Color(0,0,0,150))m:AlphaTo(255,.5,k*.25,function()surface.PlaySound('weapons/scope_zoom_sw752.wav')end)if k==3&&i[k].GetModel&&i[k]:GetModel()then m:AddPanel('srp_modelpanel',function(n)n:Dock(FILL)n:DockMargin(0,0,0,0)n:AddModel(i[k]:GetModel())n:SetCamPos(Vector(0,-5,5))n:SetLookAt(Vector(0,0,0))end)else m:AddPanel('DImage',function(o)o:Dock(FILL)if!istable(i[k])then o.mat=b[k==3&&1||k]o.col=col.white else o.mat=i[k]:GetMaterial()||i[k]:GetIcon()o.col=i[k]:GetColor()||col.white end;o.Paint=function(e,g,h)if!e.mat then return end;render.SuppressEngineLighting(true)surface.SetDrawColor(e.col)surface.SetMaterial(e.mat)surface.DrawTexturedRect((g-160)*.5,(h-160)*.5,160,160)render.SuppressEngineLighting(false)end end)end;m:AddPanel('srp_label',function(c)c:Dock(BOTTOM)c:SetText(l)c:SetFont(#l>17&&'ui_header.s'||'ui_header.r')c:SetTall(40)c:SetContentAlignment(5)end)end)end end)timer.Simple(1.7,function()LocalPlayer():EmitSound('odessa.nlo_cheer01')end)end;local p=Material'materials/galactic/sup_starfield.png'function a:Paint(g,h)surface.SetMaterial(srp.seasonal.Present.Background||p)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(0,0,g,h)end;vgui.Register('srp_present',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/purchase_ui.lua:
local a={}local b=Material('materials/galactic/ui/menu/usd.png','smooth')local c=375;local d=40;local e=200;local f=200;local g=col.pink:Copy()g.a=175;local function h(i)if!i:IsHovered()&&!i.Pressed then return end;if i.RemainingCreditsRequired then return end;if i.Pressed then if i.Pressed<CurTime()then i.Progress=0;i.Pressed=nil;i:OnPurchase()end;return end;local j=input.WasMousePressed(MOUSE_LEFT)local k=input.IsMouseDown(MOUSE_LEFT)if k&&!i.Pressed then i.Progress=math.Approach(i.Progress||0,1,0.01)if i.Progress>=0.97&&!i.Pressed then i.Pressed=CurTime()+.75;i.Progress=1 end else i.Progress=0 end end;function a:Init()self:SetTitle'Confirm Purchase'self:SetBackgroundColor(col.midnight)self:SetAlpha(0)self:AlphaTo(255,0.1,0)self:SetSize(560,340)self:Center()self:MakePopup()self:DoModal()self:AddPanel('srp_panel',function(l)l:Dock(FILL)l:SetBackgroundColor(col.transparent)l:AddPanel('srp_label',function(m)m:SetFont'ui_header.l'm:Dock(TOP)m:SetTall(60)self.ItemName=m end)l:AddPanel('srp_label',function(m)m:SetFont'ui_header.r'm:Dock(FILL)m:SetContentAlignment(7)m:SetWrap(true)self.Description=m end)end)self:AddPanel('srp_panel',function(l)l:Dock(RIGHT)l:SetWide(e)l:SetBackgroundColor(col.transparent)l:AddPanel('srp_panel',function(l)l:SetSize(e,f)l:DockPadding(0,0,0,0)l:SetBackgroundColor(col.transparent)self.Display=l end)self.DisplayContainer=l end)self:AddPanel('srp_panel',function(l)l:SetSize(c+5,d)l:SetBackgroundColor(col.transparent)l:DockPadding(0,0,0,0)l:AddPanel('srp_button',function(n)n:SetText'0 RC'n:SetTextColor(col.black)n:SetFont'ui_header.rb'n:SetContentAlignment(5)n:Dock(RIGHT)n:SetWide(c/2)n:SetVisible(false)n:DockMargin(0,0,0,0)n:SetBackgroundColor(col.white_dark)n:SetHoverColor(col.white_dark)n.OnPurchase=function(i)if self:_Accept(false)!=false then self:Remove()end end;n.Progress=0;n.Think=h;n.Paint=function(i,o,p)draw.Box(0,0,o,p,col.white_dark)draw.Box(0,0,o*i.Progress,p,i.Pressed&&col.yellow||col.white)end;self.Cash=n end)l:AddPanel('srp_button_tag',function(n)n:SetText'0 Credits'n:SetTextColor(col.black)n:SetFont'ui_header.rb'n:SetContentAlignment(5)n:Dock(RIGHT)n:SetWide(c/2)n:SetVisible(false)n:DockMargin(0,0,5,0)n:SetBackgroundColor(col.white_dark)n:SetHoverColor(col.white_dark)n:SetMaterial(b)n:SetMaterialBackground(col.transparent)n:LeftClick(function(i)if i.RemainingCreditsRequired then ba.ui.OpenAuthLink('/'..info.WebID..'/credits/'..LocalPlayer():SteamID()..'/'..math.abs(i.RemainingCreditsRequired))end end)n.OnPurchase=function(i)if self:_Accept(true)!=false then self:Remove()end end;n.Progress=0;n.Think=h;n.Paint=function(i,o,p)draw.Box(0,0,o,p,col.white_dark)draw.Box(0,0,o*i.Progress,p,i.Pressed&&col.yellow||col.white)if i.RemainingCreditsRequired then draw.DrawText(string.Comma(i.RemainingCreditsRequired)..' MISSING!','ui_label.rb',o-10,p-15,col.red,TEXT_ALIGN_RIGHT)end end;self.Credits=n end)self.Container=l end)hook('OnCreditsChanged',self,self.UpdateMissingCredits)end;function a:OnRemove()hook.Remove('OnCreditsChanged',self)end;function a:SetStoreItem(q,r)local s=srp.shop.GetByUID(q)if!s then self:Remove()return end;local b=s:GetPrice(LocalPlayer())self.Cash:SetVisible(false)self:SetCredits(b)end;function a:SetText(t)self.ItemName:SetText(t)end;function a:SetDescription(t)self.Description:SetText(t)end;function a:SetMaterial(u)self.Display:AddPanel('DImage',function(v)v:Dock(FILL)v:SetMaterial(u)end)end;function a:SetModel(w,x,y)self.Display:AddPanel('srp_modelpanel',function(z)z:Dock(FILL)z:TryCenter(z:AddModel(w,x,y))end)end;function a:SetRC(A)local B,C=LocalPlayer():GetCurrency()self.Cash:SetVisible(true)self.Cash:SetText(string.Comma(A)..' '..(C||'RC'))end;function a:SetCredits(b)self.RequiredCredits=b;self.Credits:SetVisible(true)self.Credits:SetText(string.Comma(b)..' CREDITS')self:UpdateMissingCredits()end;function a:UpdateMissingCredits()local D=self.RequiredCredits-LocalPlayer():GetCredits()if D>0 then self.Credits.RemainingCreditsRequired=D else self.Credits.RemainingCreditsRequired=nil end end;function a:LeftClick(E)self._Accept=E end;function a:OnAccept(E)self._Accept=E end;function a:_Accept(F)end;function a:PerformLayout(o,p)self.BaseClass.PerformLayout(self,o,p)if IsValid(self.Container)then self.Container:SetPos(o-c-15,p-d-15)end;if IsValid(self.Display)then self.Display:SetPos(0,d-20)end end;vgui.Register('srp_purchase',a,'srp_window')concommand.AddDev('srp_purchase',function()if IsValid(STORETESTPURCHASE)then STORETESTPURCHASE:Remove()end;srp.ui.Create('srp_purchase',function(l)l:SetStoreItem('vip_plus')l:OnAccept(function(i,G)print(i,G)end)STORETESTPURCHASE=l end)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/simpleinfo_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/skin_ui.lua:
local a={PrintName='SRP_SUP',Author='Scott'}local b=col.ui_SUP:Copy()local c=Color(15,15,15,245)local d=col.blue:Copy()local e=Color(0,0,0,255)local f=Color(25,25,25,255)local g=col.ui_outline:Copy()local h=Color(25,25,25,250)local i=Color(100,100,100,255)local j=Color(25,25,25,250)local k=Color(0,0,0,100)local l=Color(100,100,100,255)local m=col.white:Copy()local n=col.red:Copy()local o=col.green:Copy()local p=col.black:Copy()local q=col.grey:Copy()local r=Color(0,0,0,25)local s=Color(47,137,198,200)local t=Material'sup/gui/loading'local u=Material'materials/galactic/sup_starfield.png'local v=Material'materials/galactic/sup_dirt.jpg'function a:PaintUIScrollBar(self,w,x)local y=self.scrollButton.x;draw.Box(y,0,w-y-y,x,r)draw.Box(y,self.scrollButton.y,w-y-y,self.height,p)end;function a:PaintUIScrollBarHorizontal(self,w,x)local z=self.scrollButton.y;draw.Box(0,z,w,x-z-z,q)draw.Box(self.scrollButton.x,z,self.offset,x-z-z,self.m_bgColor||b)end;function a:PaintFrame(self,w,x)draw.NoTexture()if self.ribbon then draw.Box(0,0,10,x,self.ribbon_color||d)end;draw.Box(self.ribbon&&10||0,0,w-(self.ribbon&&10||0),30,self.m_bgHeaderColor||e)draw.Box(self.ribbon&&10||0,30,w-(self.ribbon&&10||0),x-30,self.m_bgColor||c)if self.blur then draw.BlurPanel(self)end;if self.outline then surface.SetDrawColor(self.m_bdrColor||g)surface.DrawOutlinedRect(0,0,w,x)end end;function a:PaintCheckBox(self,w,x)local A=self:GetChecked()draw.OutlinedBox(0,0,w,x,self:IsHovered()&&l||m,g)draw.Box(A&&1||w*0.5,1,w*0.5-1,x-2,A&&b||p)end;function a:PaintInventory(self,w,x)a:PaintFrame(self,w,x)end;local B=Color(27,39,53)function a:PaintCharacterMenu(self,w,x)a:PaintFrame(self,w,x)draw.Box(0,30,w,x-30,B)surface.SetMaterial(u)if srp.seasonal.Halloween then surface.SetDrawColor(253,136,19,196)else surface.SetDrawColor(255,255,255,100)end;surface.DrawTexturedRect(0,30,w,x-30)end;function a:PaintBackgroundFrame(self,w,x)a:PaintFrame(self,w,x)surface.SetMaterial(u)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(0,30,w,x-30)end;function a:PaintInventoryMenu(self,w,x)a:PaintFrame(self,w,x)end;local C,D=225,8;function a:PaintFrameLoading(self,w,x)if!self.loading then return end;local E,F=self:GetDockPadding()draw.Box(0,F,w,x-F,self.color_loadingbg||f)if self.mat_loading!=false then surface.SetMaterial(self.mat_loading||t)surface.SetDrawColor(255,255,255)surface.DrawTexturedRect((w-96)*.5,(x-96)*.5,96,96)end;if self.loadendtime then local y,z=w-C,x/2;draw.DrawText((self.loadingtext||'Loading')..string.rep('.',math.abs(math.sin(CurTime())*3)),self.font_loading||'ui_header.s',y/2,z+100,self.color_loading||col.white)draw.Box(y/2,z+90,C,D,col.grey_light)local G=1-(self.loadendtime-CurTime())/self.loadtimeout;draw.Box(y/2,z+90,C*G,D,col.blue)end end;function a:PaintFlashConfirmationFrame(self,w,x)a:PaintRoundedPanel(self,w,x)if self.end_time&&self.duration then local G=(self.end_time-CurTime())/self.duration;local H=math.Round(w*G)draw.RoundedBox(6,2,2,w-4,28,s)draw.RoundedBox(6,2,2,H-4,28,s)end end;function a:PaintSpacer(self,w,x)draw.Box(0,0,w,x,q)end;function a:PaintPanel(self,w,x)draw.Box(0,0,w,x,self.m_bgColor||c)if self.outline then surface.SetDrawColor(self.m_bdrColor||g)surface.DrawOutlinedRect(0,0,w,x)end end;function a:PaintImagePanel(self,w,x)if self.m_bgColor then draw.Box(0,0,w,x,self.m_bgColor)end;if self.Material then surface.SetDrawColor(self.MaterialColor)surface.SetMaterial(self.Material)local I,J=self:GetDockPadding()local K,L=w-I-I,x-J-J;if self.KeepRatio then local M=L*self.MatRatio;surface.DrawTexturedRect((w-K)*.5,(x-M)*.5,K,M)else surface.DrawTexturedRect(I,J,K,L)end end end;function a:PaintRoundedPanel(self,w,x)if self.outline then draw.RoundedBox(self.PanelRadius||6,0,0,w,x,self.m_bdrColor||g)draw.RoundedBox(self.PanelRadius||6,2,2,w-4,x-4,self.m_bgColor||c)else draw.RoundedBox(self.PanelRadius||6,0,0,w,x,self.m_bgColor||c)end end;function a:PaintRoundedButton(self,w,x,y,z)local N=self.disabled&&(self.m_bgdColor||k)||self.selected&&self.selectedbg||(self.m_bghWidthChildren&&self:IsChildHovered(true)||self:IsHovered())&&(self.m_bghColor||q)||(self.m_bgColor||j)if self.outline then draw.RoundedBox(self.ButtonRadius||6,0,0,w,x,self.m_bdrColor||g)draw.RoundedBox(self.ButtonRadius||6,2,2,w-4,x-4,N)else draw.RoundedBox(self.ButtonRadius||6,0,0,w,x,N)end end;function a:PaintButton(self,w,x,y,z)local N=self.disabled&&(self.m_bgdColor||k)||self.selected&&self.selectedbg||(self.m_bghWidthChildren&&self:IsChildHovered(true)||self:IsHovered())&&(self.m_bghColor||q)||(self.m_bgColor||j)draw.OutlinedBox(y||0,z||0,w,x,N,self.m_bdrColor||l)end;function a:PaintButtonAnimated(self,w,x)a:PaintButton(self,w,x)if!self.icon then return end;local col=self.icon_color||col.white;local O=math.cos(RealTime()/1)*30;local P=math.sin(RealTime()/1)*30;surface.SetDrawColor(col)surface.SetMaterial(self.icon)local Q,R=w*4,w*x;surface.DrawTexturedRectUV(-w*2+O,-x*2+O-P,Q,R,0,0,Q/32,R/32)end;function a:PaintMenu(self,w,x)draw.OutlinedBox(0,0,w,x,self.m_bgColor||j,col.black)end;function a:PaintMenuOption(self,w,x)local N=self:IsHovered()&&b||(self.m_bgColor||q)draw.Box(0,0,w,x,N)surface.SetDrawColor(col.grey_dark)surface.DrawOutlinedRect(0,0,w,x)end;function a:PaintDropdown(self,w,x)a:PaintButton(self,w-2,x-2,1,1)draw.Box(w-6,2,5,x-4,b)surface.SetDrawColor(g)surface.DrawOutlinedRect(0,0,w,x)end;function a:PaintDropdownRounded(self,w,x)a:PaintRoundedButton(self,w-2,x-2,1,1)end;local function S(self,T,w,x)local y=self.errorX||w-4;local z=self.errorY||x/2;local U=self.errorAlign||TEXT_ALIGN_RIGHT;DisableClipping(true)draw.SimpleText(T,"ui_label.r",y,z,col.red,U,TEXT_ALIGN_CENTER)DisableClipping(false)end;function a:PaintTextInput(self,w,x)draw.OutlinedBox(0,0,w,x,self.m_bgColor||h,self.m_bdrColor||i)self:DrawTextEntryText(self.errorText&&col.red||self.m_colText,self.m_colHighlight,self.m_colCursor)if self.errorText then S(self,self.errorText,w,x)end end;function a:PaintTextInputRounded(self,w,x)draw.RoundedBox(6,0,0,w,x,self.m_bgColor||h)self:DrawTextEntryText(self.errorText&&col.red||self.m_colText,self.m_colHighlight,self.m_colCursor)if self.errorText then S(self,self.errorText,w,x)end end;function a:PaintNumberInput(self,w,x)draw.Box(0,0,w,x,self.m_bgColor||j)self:DrawTextEntryText(self.m_colText,self.m_colHighlight,self.m_colCursor)end;function a:PaintCommRose(self,w,x)end;function a:PaintTextInputOverlay(self,w,x)if self.outline then surface.SetDrawColor(g)surface.DrawOutlinedRect(0,0,w,x)end end;function a:PaintGroupOverview(self,w,x)end;function a:PaintGroupRankMenu(self,w,x)draw.Box(0,0,w,x,self.m_bgColor)surface.SetDrawColor(255,255,255,25)local V=SysTime()for W,X in ipairs(self.Lines)do local Y=(V-X.st)/X.spd;local y=-X.w+Y*(w+X.w)if y>w then table.insert(self.ToDel,W)else surface.DrawLine(y,X.y,y+X.w,X.y)end end;if self.insignia then local Z,_=self.insignia:Width(),self.insignia:Height()local Z,_=25*Z/_,25;surface.SetMaterial(self.insignia)surface.SetDrawColor(255,255,255,100)surface.DrawTexturedRect(210,37,Z,_)end end;derma.DefineSkin('SRP_SUP','SRP SUP\'s derma skin',a)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/tabs_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/tag_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/textinput_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/ui/battlepass_purchase_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/buffs/ui/buffbars_ui.lua:
local a={}function a:Init()self.buffs={}self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self:SetBorderColor(col.transparent)self:SetBackgroundColor(col.transparent)end;function a:Resize()local b=#self:GetChildren()local c=b*64+b*4;self:SetSize(c,64)self:SetPos((ScrW()-c)*.5,ScrH()-225)end;function a:OnChildAdded(d)self:Resize()end;function a:OnChildRemoved(d)self:Resize()end;function a:AddBuff(e,f)local g=e.id;if IsValid(self.buffs[g])then self.buffs[g]:Populate(e,f)return end;self:AddPanel('srp_buffbox',function(d)d:Dock(LEFT)d:Populate(e,f)self.buffs[g]=d end)end;function a:RemoveBuff(g)if IsValid(self.buffs[g])then self.buffs[g]:DoRemove()end end;vgui.Register('srp_buffbar',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/building/building_cl.lua:
srp.build=srp.build||{}srp.build.enabled=false;srp.build.ui=srp.build.ui;local a=Material'models/props_combine/combine_interface_disp'local b={model=nil,ang=0,canoffset=false,zoffset=Vector(),overlap=false}local c=Vector()local d,e=Color(0,255,0,200),Color(255,0,0,200)local function f(g,h)if h||!srp.build.enabled then return end;if!b||!IsValid(b.ent)then return end;local i=b.ent;local j,k,l,m=srp.build.GetTransform()if!k then return end;local n=(l*-1):Angle()n:RotateAroundAxis(l,b.ang)n:RotateAroundAxis(n:Right(),90)n:RotateAroundAxis(n:Up(),b.offsetAngle||0)render.ModelMaterialOverride(a)if m&&m.overlap then i:SetPos(k+b.overlapoffset+b.zoffset)else i:SetPos(k+b.offset+b.zoffset)end;i:SetAngles(n)i:SetColor(j&&d||e)render.ModelMaterialOverride(nil)end;local function o(p)if!b||!srp.build.enabled then return end;local q=p:GetMouseWheel()if!q||q==0 then return end;if LocalPlayer():KeyDown(IN_ZOOM)then b.zoffset.z=0;b.ang=0;return end;if LocalPlayer():KeyDown(IN_SPEED)&&b.canoffset then b.zoffset.z=math.Clamp(b.zoffset.z+q,-100,100)return end;if LocalPlayer():KeyDown(IN_WALK)then b.ang=b.ang+math.Clamp(q,-5,5)return end end;function srp.build.SetBuilding(r,s)srp.build.enabled=r;if IsValid(b.ent)then b.ent:Remove()end;local t=srp.build.Get(s)if!t&&r then return end;if r then b={id=t.id,canoffset=t.canoffset,offset=t.offset,overlapoffset=t.overlapoffset,offsetAngle=t.offsetangle,zoffset=Vector(),ang=b.ang||0,overlap=t.overlap}local i=ents.CreateClientside('base_srp')if!IsValid(i)then return end;i:SetModel(t.model)i:SetRenderMode(RENDERMODE_TRANSALPHA)i:DrawShadow(false)i:SetMaterial(tostring(a))i:Spawn()i:Activate()b.overlap=t.overlap;b.ent=i;b.forward=i:GetForward():Angle()hook('InputMouseApply','srp.build.Turn',o)hook('PostDrawTranslucentRenderables','srp.build.Control',f)else hook.Remove('InputMouseApply','srp.build.Turn')hook.Remove('PostDrawTranslucentRenderables','srp.build.Control')end end;function srp.build.RequestConstruction(i,u,v)net.Start'srp.build.ConstructionProgress'net.WriteEntity(i)net.WriteItem(u)net.WriteUInt(v,8)net.SendToServer()end;function srp.build.RequestConstructionItems(i)net.Start'srp.build.ConstructionItems'net.WriteEntity(i)net.SendToServer()end;function srp.build.RequestSpawn()if!srp.build.enabled||!b.ang then return end;net.Start'srp.build.RequestSpawn'net.WriteString(b.id)net.WriteInt(b.ang,10)net.WriteInt(b.zoffset.z,10)net.SendToServer()end;function srp.build.OpenMenu()if IsValid(srp.build.ui)then srp.build.ui:Remove()end;srp.ui.Create('srp_building',function(w)srp.build.ui=w end)end;function srp.build.CloseMenu()if IsValid(srp.build.ui)then srp.build.ui:Remove()end end;function srp.build.OpenInteractionMenu(i)if i.nextuse&&i.nextuse>CurTime()then return end;local x=input.IsKeyDown(KEY_LALT)if i.GetRequiresConstruction&&i:GetRequiresConstruction()&&!x then srp.ui.Create('srp_building_constructor',function(w)w:Populate(i)end)return end;if!x then return end;srp.ui.Create('srp_commrose',function(y)y.building=i;y:SetText'Manage Building'y:AddOption('repair',{name='Repair',background=col.green:Copy(),click=function(self)local i=self:GetParent().building;if!IsValid(i)then return end;net.Start'srp.build.Repair'net.WriteEntity(i)net.SendToServer()self:GetParent():Close()end})y:AddSpacer()y:AddOption('exit',{name='Quit',background=col.orange:Copy(),click=function(self)self:GetParent():Close()end})y:AddOption('salvage',{name='Salvage',background=col.red:Copy(),click=function(self)local i=self:GetParent().building;if!IsValid(i)then return end;net.Start'srp.build.Destroy'net.WriteEntity(i)net.SendToServer()self:GetParent():Close()end})y:Complete()end)i.nextuse=CurTime()+2 end;net('srp.build.OpenMenu',function()srp.build.OpenMenu()end)net('srp.build.OpenInteractionMenu',function()srp.build.OpenInteractionMenu(net.ReadEntity())end)net('srp.build.ConstructionProgress',function()local i=net.ReadEntity()local u=net.ReadItem()local v=net.ReadUInt(8)if IsValid(i)then hook.Run('OnBuildConstructionProgress',i,u,v)end end)net('srp.build.ConstructionItems',function()local i=net.ReadEntity()if!IsValid(i)then return end;local z={}while true do local v=net.ReadUInt(8)if v==0 then break end;z[net.ReadItem().id]=v end;hook.Run('OnBuildConstructionSync',i,z)end)net('srp.build.ConstructionComplete',function()local i=net.ReadEntity()if IsValid(i)then hook.Run('OnBuildConstructionCompleted',i)end end)hook('PlayerBindPress','srp.build.HideWeaponSwitcher',function(A,B,C)if(LocalPlayer():KeyDown(IN_WALK)||LocalPlayer():KeyDown(IN_SPEED))&&(B=='invprev'||B=='invnext')&&srp.build.enabled then return true end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/character_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/charactermeta_sh.lua:
local math=math;PLAYER.O_Nick=PLAYER.O_Nick||PLAYER.Nick;PLAYER.O_Name=PLAYER.O_Name||PLAYER.Name;function PLAYER:GetCharacterNick()return self:GetNetVar('srp.character.name')||self.O_Nick(self)end;PLAYER.GetCharacterName=PLAYER.GetCharacterNick;PLAYER.Nick=PLAYER.GetCharacterNick;PLAYER.Name=PLAYER.GetCharacterNick;PLAYER.SteamName=PLAYER.O_Nick;local a='money/'file.CreateDir(a)local function b(c,d,e,f)local g=debug.traceback()local h=Format('[%s] cid: %s. Old: %s. New: %s. Change: %s.\n%s\n\n',os.date(),c:CharacterID(),d,e,f,g)file.Append(a..c:SteamID64()..'.txt',h)end;function PLAYER:CharacterID()return self:IsBot()&&0||self:GetNetVar'srp.character.id'end;function PLAYER:IsIronMan()return self:GetNetVar('srp.character.ironman',false)end;function PLAYER:GetTimePlayed()return self:GetCharacter().playtime end;function PLAYER:GetMoney()if SERVER then else return self:GetNetVar('srp.character.money')||0 end end;function PLAYER:GetMoneyBoost()if self:IsVIPPlus()then return srp.crowdfunder.IsExtendedBoost()&&5||1.75 elseif self:IsVIP()then return srp.crowdfunder.IsExtendedBoost()&&3.5||1.5 else return srp.crowdfunder.IsExtendedBoost()&&3||1 end end;function PLAYER:AddMoney(i,j,k)local l=self:GetCharacter()if!l then return end;if i<=0 then ErrorNoHaltWithStack(Format('AddMoney for %s (%s) was given negative RC of %s. This should not be allowed!!!!',self:Nick(),self:SteamID(),i))end;if!j then i=i*self:GetMoneyBoost()i=i*(1+self:GetImprintValue('rcincr',0))if srp.relationship.IsOnline(self)then i=i*1.15 end;if self:IsAFK()then i=i*(1+self:GetImprintValue('couchpotatovet',0))end end;local m=l.money;l.money=l.money+math.Round(math.abs(i))self:SetNetVar('srp.character.money',l.money)self:SetCharacterStatisticAverage('money_gained',i)b(self,m,l.money,i)srp.character.SaveMoney(self,i,k)return true,i end;function PLAYER:TakeMoney(i,k)local l=self:GetCharacter()if!l then return end;local m=l.money;i=math.floor(math.abs(i))l.money=l.money-i;self:SetNetVar('srp.character.money',l.money)self:SetCharacterStatisticAverage('money_spent',i)b(self,m,l.money,-i)srp.character.SaveMoney(self,-i,k)return true end;function PLAYER:HasMoney(i)return self:GetMoney()>=math.abs(i)end;PLAYER.CanAfford=PLAYER.HasMoney;function PLAYER:GetAllegianceID()local n=srp.allegiance.Get(self:GetNetVar('srp.allegiance.id'),true)return n&&n.id end;function PLAYER:GetAllegiance()return srp.allegiance.Get(self:GetNetVar('srp.allegiance.id'),true)end;function PLAYER:IsEventCharacter()local n=srp.allegiance.Get(self:GetNetVar('srp.allegiance.id'),true)return n&&n:IsEvent()end;function PLAYER:GetPresetID()return self:GetNetVar('srp.character.preset')||1 end;function PLAYER:GetPreset()local o=self:GetNetVar('srp.character.preset')||1;local n=self:GetAllegiance()return n:GetPreset(o)end;function PLAYER:GetPresetStats()return self.AllegianceStats||{}end;function PLAYER:GetCharacter()if CLIENT then return srp.character.me[self:GetNetVar('srp.character.id')]else local p=self:SteamID()return srp.character.data[p]&&srp.character.data[p][self:GetNetVar('srp.character.id')]end end;function PLAYER:SetTag(q)self:SetNetVar('srp.character.tag',q)end;function PLAYER:GetTag()return self:GetNetVar('srp.character.tag')||''end;function PLAYER:SetPreset(r)srp.character.SetPreset(self,r)end;function PLAYER:GetCustomTitle()return self:GetNetVar('srp.character.title')end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/creationpanels/info_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/creationpanels/presets_ui.lua:
local a={Paint=function()end,ItemWidth=180,ItemHeight=250,ItemColCount=6}local b=Material('materials/galactic/ui/padlock.png','smooth nomip noclamp')local function c(d)if istable(d)then return d[math.random(#d)]else return d end end;local function e(f)if istable(f)then for g,h in ipairs(f)do if LocalPlayer():HasUpgrade(h)then return true end end else return LocalPlayer():HasUpgrade(f)end;return false end;function a:Init()local i=ScrW()*.05;self:DockPadding(i,i,i,i)self:Dock(FILL)self:SetAlpha(0)self:AddPanel('srp_label',function(j)j:SetText'Select Character'j:SetFont'ui_header.xl'j:SetTall(100)j:SetContentAlignment(5)j:Dock(TOP)end)local k=154;local l=k*2+16;self:AddPanel('srp_panel',function(m)m:SetTall(35)m:SetBackgroundColor(col.transparent)m:Dock(TOP)m:DockMargin(0,5,0,5)m:DockPadding(0,0,0,0)m:AddPanel('srp_panel',function(n)n:SetSize(l,35)n:SetBackgroundColor(col.transparent)n:DockPadding(0,0,0,0)n:AddPanel('srp_button',function(o)o:SetContentAlignment(5)o:SetBackgroundColor(col.transparent)o:SetHoverColor(col.transparent)o:SetBorderColor(col.red)o:Dock(FILL)o:SetText'Back to selection'o:SetFont'ui_header.r'o:SetWide(k)o:DockMargin(8,0,8,0)o:LeftClick(function(p)self.Controller:GetParent():Select(1)end)end)n:AddPanel('srp_button',function(o)o:SetContentAlignment(5)o:SetBackgroundColor(col.transparent)o:SetHoverColor(col.transparent)o:SetBorderColor(col.white)o:Dock(LEFT)o:SetText'Back'o:SetFont'ui_header.r'o:SetWide(k)o:DockMargin(8,0,8,0)o:LeftClick(function(p)self.Controller:Select(1)end)end)m:InvalidateLayout(true)m:InvalidateChildren(true)self.container=n end)m.PerformLayout=function(p,q,r)self.container:SetPos((q-l)/2,0)end end)self:AddPanel('ui_scrollpanel',function(s)srp.ui.Create('srp_grid',function(t)t:SetAutoHeight(true)s:AddItem(t)self.grid=t end)self.scroll=s end)end;function a:Populate(u)self.Controller=u end;function a:DisplayPresets(v)self.grid:Clear()self.Allegiance=v;local w=0;for x,y in ipairs(v.presets)do srp.ui.Create('srp_charactercreation_preset',function(o)o:SetSize(self.ItemWidth,self.ItemHeight)o:Populate(x,y)o.Controller=self.Controller;o.Allegiance=self.Allegiance;self.grid:AddItem(o)end)w=w+1 end;local z=math.ceil(w/self.ItemColCount)local A=math.min(w,self.ItemColCount)*self.ItemWidth+math.min(w,self.ItemColCount)*3;local B=z*self.ItemHeight+z*4;self.scroll:SetSize(A+30,self.ItemHeight*3+8)self.scroll:SetPos((ScrW()-A)/2,260)timer.Simple(.2,function()if IsValid(self)then self.scroll:InvalidateLayout(true)end end)end;function a:Display(C,v)if C then self:SetVisible(true)self:SetAlpha(255)if v then self:DisplayPresets(v)end else self:AlphaTo(0,.2,0,function()if IsValid(self)then self:SetVisible(false)end end)end end;vgui.Register('srp_charactercreation_presets',a,'srp_panel')local a={}function a:Init()self.lbl:Dock(BOTTOM)self.lbl:SetTall(60)self.lbl:SetFont'ui_header.s'self:LeftClick(function()if self.VIPRequired||self.NeedsUpgrade then return end;self.Controller:Select(3,self.Allegiance,self.PresetID)end)self:AddPanel('srp_modelpanel',function(D)D:SetFOV(80)D:MoveToBack()D:SetMouseInputEnabled(false)self.model=D end)end;function a:PerformLayout(q,r)self.model:SetPos(0,0)self.model:SetSize(q,r)end;function a:Populate(x,y)self.Preset=y;self.PresetID=x;self.VIPRequired=y.vip&&!LocalPlayer():IsVIP()self.NeedsUpgrade=y.upgrade!=nil&&!e(y.upgrade)self:SetText(y.name)local E=self.model:AddModel(c(y.model),Vector(),Angle())local F=E:LookupBone('ValveBiped.Bip01_Head1')||0;local G,H=E:GetBonePosition(F)if F==0 then G=Vector(0,0,30)end;G=G/2;self.model:SetCamPos(G+Vector(50,0,0))self.model:SetLookAt(G)end;function a:Paint(q,r)surface.SetDrawColor(25,25,25,200)surface.DrawRect(0,0,q,r)end;local I=col.red:Copy()function a:PaintOver(q,r)local J=self:IsHovered()self.linealpha=math.Approach(self.linealpha||0,J&&1||0,RealFrameTime()/1*(J&&4||1))surface.SetDrawColor(200,200,200,255*self.linealpha)surface.DrawRect(0,r-2,q,2)if J then self:SetFont'ui_header.sb'else self:SetFont'ui_header.s'end;if self.VIPRequired||self.NeedsUpgrade then surface.SetMaterial(b)surface.SetDrawColor(255,50,50,255)surface.DrawTexturedRect(q-26,10,16,16)I.a=math.Approach(I.a,J&&255||0,RealFrameTime()/1*2)if J then draw.DrawText(self.VIPRequired&&'VIP Required'||'Upgrade Required','ui_label.r',q-28,10,I,TEXT_ALIGN_RIGHT,TEXT_ALIGN_TOP)end end end;vgui.Register('srp_charactercreation_preset',a,'srp_button_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmeticweapon_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/crafting/ui/crafting_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/crafting/ui/craftingview_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/storecreditevents_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/storecreditevents_sh.lua:
srp.shop=srp.shop||{}local a=info.WebID..'_events:'local b={}local c={}local d={}local function e(f,g)srp.Redis:SetEx(a..f,math.Round(g),os.time()+g)end;CREDITEVENT={}CREDITEVENT.__index=CREDITEVENT;function CREDITEVENT:Init()self.Owner=nil;self.ServerHooks={}self.ClientHooks={}self.KeyValues={}self._OnStarted=function()end;self._OnEnded=function()end end;function CREDITEVENT:SetName(h)self.Name=h;return self end;function CREDITEVENT:SetMaterial(i)self.Material=i;return self end;function CREDITEVENT:SetDescription(j)self.Description=j;return self end;function CREDITEVENT:SetAnnouncement(j)self.Announcement=j;return self end;function CREDITEVENT:SetData(k,l)self.KeyValues[k]=l;return self end;function CREDITEVENT:GetData(k)return self.KeyValues[k]end;function CREDITEVENT:Start(m,n)self.Owner=m;self:LoadHooks()self:_OnStarted(m,n)end;function CREDITEVENT:OnStarted(o)self._OnStarted=o;return self end;function CREDITEVENT:End()self:RemoveHooks()self:_OnEnded(self.Owner)end;function CREDITEVENT:OnEnded(o)self._OnEnded=o;return self end;function CREDITEVENT:SetDuration(g)self.Duration=g;return self end;function CREDITEVENT:AddServerHook(f,p)self.ServerHooks[f]=function(...)p(self,...)end;return self end;function CREDITEVENT:AddClientHook(f,p)self.ClientHooks[f]=function(...)p(self,...)end;return self end;function CREDITEVENT:RemoveHook(f)hook.Remove(f,self.id)return self end;function CREDITEVENT:LoadHooks()for f,o in pairs(SERVER&&self.ServerHooks||self.ClientHooks)do hook.Add(f,self.id,o)end end;function CREDITEVENT:RemoveHooks()for f,o in pairs(SERVER&&self.ServerHooks||self.ClientHooks)do hook.Remove(f,self.id)end end;function CREDITEVENT:SetPrice(q)self.Cost=q;srp.shop.Add(self.Name,'event_'..self.id):SetCat('Events'):SetDesc(self.Description):SetPrice(self.Cost):SetImage(self.Material):SetStackable(true):SetCanBuy(function(self,m)return!b[self.id]||d[self.id].Duration!=nil,"Event is current running"end):SetOnBuy(function(r,m)srp.shop.StartEvent(m,self.id)end)return self end;function srp.shop.EventRunning(f)return b[f]end;function srp.shop.GetRunningEvents()return b end;function srp.shop.GetEvents()return d end;function srp.shop.GetEvent(f)return d[f]end;function srp.shop.AddEvent(f,s,t)local u={id=f,type=t||f,Name=s}setmetatable(u,CREDITEVENT)u:Init()d[f]=u;return u end;function srp.shop.Start(f,m,g)local v=d[f]if!v then return end;local w=v.type;local x=b[f]local y='CreditEvent.'..f;g=math.ceil(g||v.Duration)if b[f]&&g then local z=timer.TimeLeft(y)||0;local A=z+g;v.Finish=CurTime()+A;e(v.id,A)timer.Create(y,A,1,function()srp.shop.EndEvent(v)end)net.Start'srp.creditevent.Start'net.WriteString(v.id)net.WriteUInt(v.Finish,32)net.Broadcast()hook.Run('OnShopEventUpdated',v,A)return end;v:Start(m)b[f]=true;c[w]=true;if IsValid(m)&&v.Announcement then RunConsoleCommand('ba','tellall',v.Announcement:Replace('#',m:Nick()))end;if g then v.Finish=CurTime()+g;e(v.id,g)timer.Create(y,g,1,function()srp.shop.EndEvent(v)end)net.Start'srp.creditevent.Start'net.WriteString(v.id)net.WriteUInt(v.Finish,32)net.Broadcast()end;hook.Run('OnShopEventStarted',v,g)end;function srp.shop.StartEvent(m,f)local v=d[f]if b[f]&&c[v.type]&&!v.Duration then srp.notif.Warning(m,3,term.Get'CreditEventRunnning')return end;srp.shop.Start(f,m)end;function srp.shop.EndEvent(v)v:End()net.Start'srp.creditevent.End'net.WriteString(v.id)net.Broadcast()b[v.id]=nil;c[v.type]=nil;hook.Run('OnShopEventEnded',v)end;function srp.shop.SyncEvents(m)if table.Count(b)==0 then return end;net.Start'srp.creditevent.Sync'net.WriteUInt(table.Count(b),6)for f,B in pairs(b)do local v=srp.shop.GetEvent(f)net.WriteString(f)net.WriteUInt(v.Finish,32)end;net.Broadcast()end;function srp.shop.LoadEvents()MsgC(col.pink,'[CreditStore] LoadEvents.\n')for f,v in pairs(d)do MsgC(col.pink,'[CreditStore] fetching eventid '..f..'\n')srp.Redis:Get(a..f,function(self,C)C=tonumber(C)||0;if os.time()>C then print('[CreditStore] Session is finished!',f,C)return end;local D=tonumber(C)-os.time()print('[CreditStore] Session Loading',f,C,D)srp.shop.Start(f,nil,D)end)end end;local function E(v)srp.shop.HostName=srp.shop.HostName||GetHostName()if table.Count(b)==0 then RunConsoleCommand('hostname',srp.shop.HostName)return end;local F={}local G=0;for f,B in pairs(b)do F[#F+1]=srp.shop.GetEvent(f).Name:Replace(' Event','')end;RunConsoleCommand('hostname',srp.shop.HostName..' - '..table.concat(F,', ')..' Event!')end;if SERVER then else local H=4;local I=4;local J=Color(25,25,25,150)local function K()local L=srp.shop.GetRunningEvents()local M,N=ScrW(),ScrH()local O=20;surface.SetFont'ui_header.r'for f,B in pairs(L)do local v=srp.shop.GetEvent(f)if!v then continue end;local h=v.Name..' Active'if v.Finish then local P=string.FormattedTime(v.Finish-CurTime())h=h..' - '..Format('%02i:%02i:%02i',P.h,P.m,P.s)end;local M,N=draw.WordBox(H,O,N-26,h,'ui_label.r',J,col.white_dark)O=O+M+I end end;net('srp.creditevent.Start',function()local v=d[net.ReadString()]v.Finish=net.ReadUInt(32)v:Start()b[v.id]=true;c[v.type]=true;hook('HUDPaint','srp.shop.DrawEventTags',K)end)net('srp.creditevent.End',function()local v=d[net.ReadString()]v:End()b[v.id]=nil;c[v.type]=nil;if table.Count(b)==0 then hook.Remove('HUDPaint','srp.shop.DrawEventTags')end end)net('srp.creditevent.Sync',function()local G=net.ReadUInt(6)for Q=1,G do local v=d[net.ReadString()]v.Finish=net.ReadUInt(32)v:Start()b[v.id]=true;c[v.type]=true end;hook('HUDPaint','srp.shop.DrawEventTags',K)end)end;if!(info.Main||info.Dev)then return end;local R=3600;srp.shop.AddEvent('vip','VIP Event'):SetMaterial(Material('materials/galactic/ui/menu/vip-perma.png','noclamp')):SetDescription'Give everyone VIP for the next 45 minutes.\n\nExtends the event if one is currently running.':SetAnnouncement'Wow! # has started a VIP event. Thank you! :)':SetDuration(R*.75):SetPrice(350):AddServerHook('PlayerVIPCheck',function(self,m)return true end):AddClientHook('PlayerVIPCheck',function(self,m)return true end)srp.shop.AddEvent('crafting','Crafting Event'):SetMaterial(Material('materials/galactic/ui/inventory/building.png','noclamp')):SetDescription'For the next 30 minutes the crafting time will be reduced and resource pickups will be doubled for everyone!\n\nExtends the event if one is currently running.':SetAnnouncement'Wow! # has started a Crafting event. Thank you! :)':SetDuration(R*.5):SetPrice(350)srp.shop.AddEvent('package','Package Event'):SetMaterial(Material('materials/galactic/ui/triumphs/package.png','noclamp')):SetDescription'For the next 60 minutes packages will give double rewards for everyone!\n\nExtends the event if one is currently running.':SetAnnouncement'Wow! # has started a Package event. Thank you! :)':SetDuration(R):SetPrice(450)srp.shop.AddEvent('patrols','Patrol Event'):SetMaterial(Material('materials/galactic/ui/triumphs/patrol.png','noclamp')):SetDescription'For the next 60 minutes the patrols will give double rewards and faster capture speeds for everyone!\n\nExtends the event if one is currently running.':SetAnnouncement'Wow! # has started a Patrol event. Thank you! :)':SetDuration(R):SetPrice(350)srp.shop.AddEvent('blackjack','Blackjack Payout Event'):SetMaterial(Material('materials/galactic/ui/casino/blackjack.png','noclamp')):SetDescription'For the next 30 minutes getting a 21 will increase to a 4/2 from a 3/2':SetAnnouncement'Wow! # has started a Patrol event. Thank you! :)':SetDuration(R*.5):SetPrice(350)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/firingrange/firingrange_cl.lua:
srp.firingrange=srp.firingrange||{}
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/methods_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/toggles_sh.lua:
srp.gmt={broadcast={name='Broadcast',status=true},lrbroadcast={name='LR Broadcast',status=true},communications={name='Communications',status=true},jetpack={name='Jetpack',status=true},cloaking={name='Cloaking',status=true},forceleap={name='Force Leap',status=true},talents={name='Talents',status=true},flashlight={name='Flash Light',status=true}}function srp.gamemaster.GetToggle(a)return srp.gmt[a]&&srp.gmt[a].status end;srp.AddCommand('gmtoggle',function(b,a)srp.gamemaster.ToggleGameplay(b,a)end):AddParam(cmd.STRING):SetInfoSection('Gamemaster'):SetInfo('Toggles gm setting. This is used internally by the Gamemaster Settings Menu.'):SetInfoArgs({'ID - The internal setting id'}):SetGM()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/containers/ui/containers_ui.lua:
local a={}local b=Color(0,0,0,50)function a:Init()self:SetBackgroundColor(col.midnight)self:DockPadding(10,10,10,10)self:AddPanel('srp_panel_rounded',function(c)c:Dock(LEFT)c:SetWide(150)c:SetBackgroundColor(b)c:DockPadding(5,5,5,5)self.TagPnl=c end)self:AddPanel('srp_panel',function(c)c:Dock(TOP)c:SetTall(30)c:DockPadding(16,0,38,0)c:DockMargin(0,0,0,2)c:SetBackgroundColor(col.transparent)c:AddPanel('srp_button_rounded',function(d)d:Dock(RIGHT)d:DockMargin(0,0,0,0)d:SetText'Clear & Reload'd:SetFont'ui_header.s'd:SetTextColor(col.grey_dark)d:SetBackgroundColor(col.red)d:SetHoverColor(col.red_dark)d:LeftClick(function()self:LoadContainers()end)end)c:AddPanel('srp_button_rounded',function(d)d:Dock(LEFT)d:DockMargin(0,0,0,0)d:SetText'Create New Container'd:SetWide(150)d:SetFont'ui_header.s'd:SetTextColor(col.grey_dark)d:SetBackgroundColor(col.green)d:SetHoverColor(col.green_dark)d:LeftClick(function()self:EmptyContainer()end)end)end)self:AddPanel('ui_scrollpanel',function(e)e:Dock(FILL)srp.ui.Create('srp_grid',function(f)f:Dock(TOP)f:SetAutoHeight(true)f:SetSpacing(18,20,true)f.OnComplete=function(g,h)g:SetTall(h+300)self.scroll:GetCanvas():InvalidateLayout(true)self.scroll:InvalidateLayout(true)end;e:AddItem(f)self.grid=f end)self.scroll=e end)self:LoadContainers()end;function a:LoadFile(i,j,k)local l=file.Read(i,'DATA')if!l||#l==0 then return end;local m=util.JSONToTable(compressed&&util.Decompress(l)||l)if!m||!m.FileID||!m.ContainerID||!m.Class||!m.Types then return end;if m.Tags then for n,o in ipairs(m.Tags)do self:AddTag(o:Capitalize())end else m.Tags={self.LastFolder}self:AddTag(self.LastFolder:Capitalize())end;srp.ui.Create('srp_container',function(c)c:Populate()c:Load(m,j)c:SetVisible(false)c.Tags=m.Tags;self.grid:AddItem(c)end)end;function a:RecursiveLoad(p,q)p=p[#p]=='/'&&p||p..'/'local r,s=file.Find(p..'*','DATA')if r then for t,k in ipairs(r)do if k:find('.json')then self:LoadFile(p..k,p,k)end end end;if s&&q<2 then for t,j in ipairs(s)do self.LastFolder=j;self:RecursiveLoad(p..j,q+1)end end end;function a:LoadContainers(compressed)self.grid:Clear()self.TagPnl:Clear()self.Tags={}self.LastFolder='All'self:AddTag('All')self:RecursiveLoad(srp.containers.basePath,0)self:Filter('all')self.grid:InvalidateLayout(true)self.scroll:InvalidateLayout(true)end;function a:EmptyContainer()srp.ui.Create('srp_container',function(c)c:Populate()self.grid:AddItem(c)end)end;local function u(v,w)if!w then return false end;for t,o in ipairs(w)do if v==o:lower()then return true end end;return false end;function a:Filter(x)for t,c in ipairs(self.grid:GetChildren())do if x=='all'||u(x,c.Tags)then c:SetVisible(true)else c:SetVisible(false)end end end;function a:AddTag(x)if self.Tags[x]then return end;local n=math.Clamp(string.byte(x[1]),30,90)local col=HSVToColor(360*(90-n)/60,1,1)col.a=75;self.TagPnl:AddPanel('srp_tag',function(c)c:Dock(TOP)c:SetBackgroundColor(b)c:SetText(' '..x)c:SetTextColor(col.black)c:DockMargin(0,5,0,0)c:SetTall(20)c:SetBorderColor(col)c.remove:Dock(FILL)c.remove:SetText(0xf02b,true)c.remove:SetContentAlignment(6)c.remove:SetBackgroundColor(col)c:LeftClick(function(g)self:Filter(x:lower())end)self.Tags[x]=c end)end;vgui.Register('srp_containers',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/domination/domination_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/objectives/objectives_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/ui/tellall_ui.lua:
local a={}local b=Material('galactic/ui/skills.png','smooth noclamp nomip')local c=Color(10,10,10,240)local d=Color(222,222,222,250)local e=Color(41,128,185,255)local f='ui_header.r'local g='ui_header.s'local h=80;function a:Init()self:SetSize(400,h)self:SetAlpha(0)self:AlphaTo(255,.5,0)local i,j=ScrW(),ScrH()self:SetPos((i-600)/2,h+10)chat.PlaySound()timer.Create('srp.gmtellall',15,1,function()if!IsValid(self)then return end;self:AlphaTo(0,.2,0,function()if IsValid(self)then self:Remove()end end)end)end;function a:Populate(k,l,b)surface.SetFont(f)self.gm=b;self.textw,self.texth=surface.GetTextSize(l)self.text=l;if IsValid(k)then self.name=k:Nick()self.steamid=k:SteamID()end;self:SetSize(140+math.max(self.textw,20),self.texth+40)self:CenterHorizontal()end;function a:Paint(i,j)draw.Box(0,0,i,j,c)draw.Box(1,1,i-2,20,e)if self.gm then surface.SetMaterial(b)surface.SetDrawColor(e)surface.DisableClipping(true)surface.DrawTexturedRect((i-64)/2,-60,64,64,22)surface.DisableClipping(false)end;draw.SimpleText(self.text||'',f,i/2,j/2+11,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)if self.name then draw.SimpleText('From '..(self.name||''),g,i/2,9,d,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end;function a:OnRemove()end;vgui.Register('srp_gmtellall',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gifts/ui/giftitem_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/orgs/orgs_cl.lua:
srp.org=srp.org||{}net('srp.org.Created',function()srp.notif.Success(3,'Organisation Created!')hook.Run('OnOrgCreated')end)net('srp.org.Get',function()local a={id=net.ReadString(),Name=net.ReadString(),Ticker=net.ReadString(),Color=net.ReadColor(),IsOwner=function(self,b)return self.Owner==b end,IsOfficer=function(self,b)return self.Players[b]&&self.Players[b]>=2 end,IsMember=function(self,b)return self.Players[b]end}local c=net.ReadUInt(7)local d=srp.org.Models[c]&&srp.org.Models[c].Model||srp.org.Models[1].Model;a.Model=d;a.ModelID=c;a.Players={}for e=1,net.ReadUInt(5)do local b=net.ReadPlayer()local f=net.ReadUInt(3)a.Players[b]=f;if f==3 then a.Owner=b end end;srp.ui.Create('srp_orgmenu',function(g)g:Populate(g)end)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupagenda_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/grouplogs_ui.lua:
local a={}a.Icons={['GroupSettingChanged']=Material('materials/galactic/ui/grouplogs/notepad.png','smooth'),['GroupLogAgenda']=Material('materials/galactic/ui/grouplogs/agenda.png','smooth'),['GroupLogInvite']=Material('materials/galactic/ui/grouplogs/invite.png','smooth'),['GroupLogTransfer']=Material('materials/galactic/ui/grouplogs/invite.png','smooth'),['GroupLogKick']=Material('materials/galactic/ui/grouplogs/kick.png','smooth'),['GroupLogLeft']=Material('materials/galactic/ui/grouplogs/kick.png','smooth'),['GroupLogPromote']=Material('materials/galactic/ui/grouplogs/promoted.png','smooth'),['GroupLogDemote']=Material('materials/galactic/ui/grouplogs/demoted.png','smooth'),['GroupLogClass']=Material('materials/galactic/ui/grouplogs/class.png','smooth'),['GroupLogClassID']=Material('materials/galactic/ui/grouplogs/class.png','smooth'),['GroupLogRemoveClass']=Material('materials/galactic/ui/grouplogs/kickclass.png','smooth'),['GroupLogRemoveClassID']=Material('materials/galactic/ui/grouplogs/kickclass.png','smooth'),['GroupLogLoreName']=Material('materials/galactic/ui/grouplogs/lorename.png','smooth'),['GroupLogLoreNameID']=Material('materials/galactic/ui/grouplogs/lorename.png','smooth'),['GroupLogRemoveLoreName']=Material('materials/galactic/ui/grouplogs/lorenamekick.png','smooth'),['GroupLogRemoveLoreNameID']=Material('materials/galactic/ui/grouplogs/lorenamekick.png','smooth'),['GroupLogNote']=Material('materials/galactic/ui/grouplogs/notepad.png','smooth'),['GroupLogCrystal']=Material('materials/galactic/ui/grouplogs/crystal.png','smooth')}local b=col.midnight:Copy()local c=col.midnight_dark:Copy()local d=col.black:Copy()function a:Init()self:SetTall(36)self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self:SetBackgroundColor(b)self:AddPanel('srp_panel',function(e)e:SetMouseInputEnabled(false)e:DockPadding(6,6,6,6)e:DockMargin(0,0,0,0)e:Dock(LEFT)e:SetWide(36)e:SetBackgroundColor(col.transparent)e:AddPanel('DImage',function(f)f:SetMouseInputEnabled(false)f:DockPadding(2,2,2,2)f:DockMargin(0,0,0,0)f:Dock(FILL)f:SetImageColor(col.white)self.icon=f end)end)self:AddPanel('srp_panel',function(e)e:SetMouseInputEnabled(false)e:DockPadding(5,0,5,0)e:DockMargin(0,0,0,0)e:Dock(LEFT)e:SetWide(140)e:SetBackgroundColor(col.transparent)e:AddPanel('srp_label',function(g)g:SetMouseInputEnabled(false)g:DockPadding(0,0,0,0)g:DockMargin(0,0,0,0)g:Dock(FILL)g:SetText'2020/06/11 23:44:00'g:SetContentAlignment(5)g:SetTextColor(col.white_dark)self.date=g end)end)self:AddPanel('srp_label',function(g)g:Dock(FILL)g:DockMargin(5,0,0,0)g:SetMouseInputEnabled(false)g:SetTextColor(col.white_dark)self.txt=g end)end;function a:OnMousePressed(h)if h==MOUSE_LEFT then self:CopyInfo()end end;function a:Populate(i,j)i.arguments=util.JSONToTable(i.arguments)if!i.arguments||#i.arguments==0 then self:Remove()return end;local k=term.ReadString(i.type,unpack(i.arguments))if!k||k==''then self:Remove()return end;self.txt:SetText(k)self.date:SetText(i.added)if self.Icons[i.type]then self.icon:SetMaterial(self.Icons[i.type])end;self.even=j;self.log=i end;function a:CopyInfo()if self.log then SetClipboardText(self.log.type..'\n'..self.log.added..'\n'..self.txt:GetText()..'\n\n'..table.concat(self.log.arguments,'\n'))srp.notif.Neutral(5,'Copied log to clipboard.')end end;function a:Paint(l,m)draw.Box(0,0,l,m,self.even&&c||b)if self:IsHovered()then draw.Box(0,0,l,m,d)end end;vgui.Register('srp_logline',a,'srp_panel')local a={}function a:Init()self:DockPadding(0,0,0,0)self:SetBackgroundColor(col.transparent)end;function a:Setup(n)self:AddPanel('srp_pagination',function(e)e:Dock(FILL)e:SetURL(srp.groups.logurl..n.id..'/%i')e:SetBackgroundColor(col.black)e:DisplayData(function(self,o,p,q)for r=1,#q do srp.ui.Create('srp_logline',function(i)i:Populate(q[r],r%2==0)o:AddItem(i)end)end end)end)end;vgui.Register('srp_logs',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupplate_ui.lua:
local a={}local b=Material'gui/gradient'local c=Color(255,255,255,15)local d=Color(0,0,0,25)local e=28;local f=95;local g=180;surface.CreateFont('groupplate.title',{font='Roboto',size=16,weight=500,additive=true})surface.CreateFont('groupplate.description',{font='Roboto',size=12,weight=400,additive=true})function a:Init()self:DockPadding(0,5,0,0)self:SetBackgroundColor(col.transparent)self:SetSize(f+e,g)self:AddPanel('srp_panel',function(h)h:Dock(FILL)h:DockMargin(0,0,0,0)h:DockPadding(0,0,0,0)h:SetBackgroundColor(col.transparent)h:AddPanel('srp_modelpanel',function(h)h:SetPos(0,0)h:SetSize(f,g)h:SetCamPos(Vector(-35,0,65))h:SetLookAt(Vector(0,0,65))h:SetFOV(40)h.outline=nil;self.mdl=h end)h:AddPanel('srp_button',function(i)i:SetContentAlignment(5)i:SetBackgroundColor(col.transparent)i:SetHoverColor(col.transparent)i:SetBorderColor(col.transparent)i:SetText''i:SetPos(0,0)i:SetSize(f,g)i:DockPadding(0,0,0,0)i:DockMargin(0,0,0,0)i:LeftClick(function(j)if self.group&&self.controller then self.controller:ShowGroup(self.group.id)end end)self.inspect=i end)h:AddPanel('srp_label',function(k)k:SetSize(f,15)k:SetPos(0,6)k:SetContentAlignment(5)k:SetTextColor(col.white)k:SetFont'ui_header.sb'k:MoveToFront()k:SetMouseInputEnabled(false)self.id=k end)self.ViewPanel=h end)self:AddPanel('srp_panel',function(h)h:Dock(RIGHT)h:SetWide(e)h:DockMargin(0,0,0,0)h:DockPadding(1,1,1,1)self.SidePanel=h end)end;function a:SetGroup(l,m,n)self.group=m;self.controller=l;local o=m:GetColor():Copy()o.a=100;local p=m:GetAltColor():Copy()self.id:SetText(m.id:upper())self:SetBackgroundColor(o)self.SidePanel:SetBackgroundColor(p)if n||cvar.GetValue('srp_groupmdls')then local q=m:GetParent()local r=q&&q:GetRanks(true)[1]:GetModel()||m:GetRanks(true)[1]:GetModel()self.player=self.mdl:AddModel(r,Vector(),Angle(0,180,0))self.hoverAnim=m.id=='JEDI'&&'gesture_bow_original'||'gesture_salute_original'if m.id=='JEDI'then self.mdl:SetCamPos(Vector(-130,0,55))self.mdl:SetLookAt(Vector(0,0,55))self.mdl:SetFOV(25)end end;local s=m:GetChildren()for t,m in pairs(s)do self.SidePanel:AddPanel('srp_button_rounded',function(i)i:Dock(TOP)i:SetTall(e-2)i:SetContentAlignment(5)i:SetFont'SSRPForkAwesome'i:SetText(0xf0c1,true)i:SetTooltip(m.name)i:SetTextColor(col.white)i:DockMargin(0,0,0,0)i:SetBorderColor(col.transparent)i:SetBackgroundColor(o)i:SetHoverColor(p)i:LeftClick(function()if self.controller then self.controller:ShowGroup(m.id)end end)end)end;for t,u in ipairs(m:GetAttributes())do local v=srp.groups.GroupTags[u]if!v then continue end;self.SidePanel:AddPanel('srp_panel_rounded',function(h)h:Dock(BOTTOM)h:SetTall(e-6)h:DockMargin(2,2,2,2)h:DockPadding(1,1,1,1)h:SetBackgroundColor(o)h:AddPanel('DImage',function(w)w:Dock(FILL)w:SetTooltip(v.Name)w:SetMaterial(v.Icon)end)end)end;return self end;function a:Think()if!IsValid(self.player)then return end;local x=self:IsHovered()||self.inspect:IsHovered()||self.SidePanel&&(self.SidePanel:IsHovered()||self.SidePanel:IsChildHovered())local y=self.player:LookupSequence(x&&self.hoverAnim||'idle_all_01')if y>0 then self.player:ResetSequence(y)if x then self.player:SetCycle(.335)end end end;function a:Paint(z,A)draw.Box(0,0,z-e,A,self.m_bgColor)end;vgui.Register('srp_groupplate',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/grouprank_ui.lua:
local a={}local b=Color(255,255,255,50)function a:Init()self:SetTall(221)self:DockPadding(8,8,8,8)self:DockMargin(0,0,0,0)self.NextLine=0;self.Lines={}self.ToDel={}self.outline=true;self:SetBorderColor(col.grey_dark)self:SetBackgroundColor(col.transparent)self:AddPanel('srp_panel_rounded',function(c)c:Dock(TOP)c:DockPadding(0,0,0,0)c:DockMargin(0,0,0,0)c:SetTall(30)c:SetBackgroundColor(col.grey)c:AddPanel('srp_label',function(d)d:Dock(FILL)d:SetText('CHANGE CLASS & RANK')self.lbl=d end)self.header=c end)self:AddPanel('srp_modelpanel',function(c)c:Dock(FILL)c:SetCanControl(true)self.mdl=c end)end;function a:Setup(e,f,g)self.container=e;self.group=f;self.character=g;self:DisplaySettings('Rank','GetRanks','promote','gpromoteid','gkickid',13,42)self:DisplaySettings('Class','GetClasses','setclass','gsetclassid','gkickclassid',13,112)self:DisplaySettings('Lore Name','GetLoreNames','setlorename','gsetlorenameid','gkicklorenameid',13,182)local h=LocalPlayer():GetGroup()local i=h&&(h:IsConnected(self.group)&&LocalPlayer():HasPermission('promote'))||false;if i&&(f.parent||#f.children_mapped>0)then self:AddPanel('srp_button_rounded',function(j)j:SetPos(13,252)j:SetFont'ui_label.l'j:SetWide(120)j:SetText'Transfer'j:LeftClick(function(k)cmd.Run('gtransferid',g.characterid)end)end)end end;function a:DisplaySettings(l,m,n,o,p,q,r)self[l]={}self:AddPanel('srp_label',function(d)d:SetPos(q,r)d:SetContentAlignment(4)d:SetFont'ui_label.l'd:SetWide(120)d:SetText(l)end)self:AddPanel('srp_label',function(d)d:SetPos(q+120,r)d:SetContentAlignment(6)d:SetFont'ui_label.l'd:SetWide(100)d:SetText('0/0')self[l].maxplayers=d end)self:AddPanel('srp_dropdown',function(s)s:SetWide(220)s:SetPos(q,r+25)s:SetFont'ui_header.s's:SetBackgroundColor(b)s:SetHoverColor(b)s:OnSelect(function(k,t,u)if IsValid(self.player)then self.player:SetSequence(ACT_GMOD_GESTURE_AGREE)end;self:OnSelected(l,n,o,t,u)end)self[l].dropdown=s end)self:AddPanel('srp_button',function(j)j:SetPos(q+225,r+25)j:SetText'APPLY'j:SetWide(60)j:SetBackgroundColor(col.red)j:SetHoverColor(col.red_dark)j:SetVisible(false)j:LeftClick(function(k)if k.kicking then local v=n=='setclass'&&'Are you sure you want to remove this character from their class?'||n=='setlorename'&&'Are you sure you want to remove this character from their lore name?'||'Are you sure you want to remove this character from the battalion?'srp.notif.Confirm({title='Confirm Kick',sub_text=v,charid=self.character.characterid,groupid=self.group.internal,callback=function(u)if IsValid(self)then cmd.Run(p,self.character.characterid,self.group.internal)self.container:Remove()end end})elseif k.currank then srp.notif.Confirm({title='Confirm',sub_text=Format('Are you sure you want to set %s to %s?',self.character.name,k.currank:GetName()),callback=function(w)if IsValid(self)then cmd.Run(o,self.character.characterid,self.group.internal,k.currank.internal)end end})end end)self[l].btn=j end)self:Populate(l,m)end;function a:Populate(l,m)local x=self.group[m](self.group,true)if!x then return end;local y=self.group.parent;for z,A in pairs(x)do if y&&A.id=='CDR'then continue end;self[l].dropdown:AddOption(Format('%s - %s',A.id,A:GetName()),A,{font='ui_header.s'},A.id==self.character.lorename||A.id==self.character.rid||A.id==self.character.class)end end;function a:OnSelected(l,n,o,t,u)if!u then return end;if u:GetModel()then self:UpdateModel(u:GetModel())end;local h=LocalPlayer():GetGroup()local B=LocalPlayer():GetGroupRank()if!B then return end;local i=h:IsConnected(self.group)&&B:HasPermission(n)||LocalPlayer():IsSA()||false;local C=u.id==self.character.rid||u.id==self.character.class||u.id==self.character.lorename;local j=self[l].btn;j:SetVisible(i)j:SetText(C&&'KICK'||'APPLY')j:SetBackgroundColor(C&&col.red||col.blue)j:SetHoverColor(C&&col.red_dark||col.blue_dark)j.kicking=C;j.currank=u;self[l].maxplayers:SetText(Format('%i/%i',u:GetCharacterCount(),u:GetMaxCharacters()||500))end;function a:UpdateModel(D)local E=self.player;if!D||!isstring(D)then if IsValid(E)then E:Remove()end;return end;if!IsValid(E)then E=self.mdl:AddModel(D,Vector(0,0,0),Angle(0,-45,0))else E:SetModel(D)end;E.AutomaticFrameAdvance=true;E:ResetSequence('walk_all')E:SetCycle(0)self.player=E;self.mdl:SetCamPos(Vector(100,-10,34))self.mdl:SetLookAt(Vector(0,-55,34))end;function a:Think()if!self:IsVisible()then return end;if SysTime()>self.NextLine then self.NextLine=SysTime()+math.Rand(0,0.15)for F=1,math.random(math.Clamp(100-#self.Lines,0,20))do table.insert(self.Lines,{w=math.random(50),y=math.random(self:GetTall()),st=SysTime(),spd=math.Rand(15,25)})end end;for G,H in ipairs(self.ToDel||{})do if self.Lines[H-(G-1)]then table.remove(self.Lines,H-(G-1))end end;table.Empty(self.ToDel)end;function a:Paint(I,J)derma.SkinHook('Paint','GroupRankMenu',self,I,J)end;vgui.Register('srp_grouprank',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/grouprecruitment_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupview_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/webhooks/webhookadd_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/webhooks/webhooks_ui.lua:
local a={}function a:Init()self:SetBackgroundColor(col.midnight)self:DockPadding(0,0,0,0)self:AddPanel('srp_groupwebhooks_list',function(b)b:Dock(FILL)self.List=b end)self:AddPanel('srp_groupwebhooks_add',function(b)b:Dock(RIGHT)b:SetWide(475)self.Add=b end)hook('OnGroupWebhooksReceived',self,self.Populate)end;function a:Setup(c)srp.groups.GetWebhooks()end;function a:Populate(d)self.List:Populate(d,self.Add)end;vgui.Register('srp_groupwebhooks',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/z_circruits_sh.lua:
local a=1;local b=2;local c=3;local d=4;local e,f=0,0;local g=24;local h=g/2;local i=Material'materials/icon32/folder.png'local j={Name='Firewall Bypasser',MoveSpeed=150,KeyPaths={[KEY_W]={y=-1},[KEY_S]={y=1},[KEY_A]={x=-1},[KEY_D]={x=1}},KeyReverses={[KEY_W]=KEY_S,[KEY_S]=KEY_W,[KEY_A]=KEY_D,[KEY_D]=KEY_A},CreateZone=function(k,l,m,n,o)k=k+e;l=l+f;return{min={x=k,y=l},max={x=k+m,y=l+n},x=k,y=l,w=m,h=n,type=o}end,CreateObject=function(p,k,l,m,n,o)k=k+e;l=l+f;return{name=p,material=Material('materials/galactic/ui/hacking/chip.png','noclamp smooth'),min={x=k,y=l},max={x=k+m,y=l+n},x=k,y=l,w=m,h=n,type=o}end}j.Maps={{Path={j.CreateZone(36,144,40,67,a,0.0375,0.24406779661017,0.04166666666667,0.1135593220339),j.CreateZone(76,154,104,48,c,0.07916666666667,0.26101694915254,0.10833333333333,0.08135593220339),j.CreateZone(130,202,50,167,c,0.13541666666667,0.34237288135593,0.05208333333333,0.28305084745763),j.CreateZone(36,369,144,39,c,0.0375,0.62542372881356,0.15,0.06610169491525),j.CreateZone(36,408,50,141,c,0.0375,0.69152542372881,0.05208333333333,0.23898305084746),j.CreateZone(85,498,168,51,c,0.08854166666667,0.84406779661017,0.175,0.0864406779661),j.CreateZone(253,154,50,395,c,0.26354166666667,0.26101694915254,0.05208333333333,0.66949152542373),j.CreateZone(252.5,104,395,50,c,0.2625,0.17627118644068,0.4125,0.0864406779661),j.CreateZone(598,93,50,12,d,0.62291666666667,0.15762711864407,0.05208333333333,0.02033898305085),j.CreateZone(241,44,407,50,c,0.25104166666667,0.07457627118644,0.42395833333333,0.08474576271186),j.CreateZone(191,44,50,435,c,0.19895833333333,0.07457627118644,0.05208333333333,0.73728813559322),j.CreateZone(208,479,18,80,d,0.21666666666667,0.81186440677966,0.01875,0.13559322033898),j.CreateZone(208,559,463,18,d,0.21666666666667,0.94745762711864,0.48229166666667,0.03050847457627),j.CreateZone(651,535,20,24,c,0.678125,0.90677966101695,0.02083333333333,0.04067796610169),j.CreateZone(311,517,360,18,d,0.32395833333333,0.87627118644068,0.375,0.03050847457627),j.CreateZone(311,165,18,352,d,0.32395833333333,0.27966101694915,0.01875,0.59661016949153),j.CreateZone(329,165,527,51,c,0.34270833333333,0.27966101694915,0.54895833333333,0.0864406779661),j.CreateZone(856,157,40,67,b,0.89166666666667,0.26610169491525,0.04166666666667,0.1135593220339)},Scene={j.CreateObject(chip,61,51,94,93,c,0.06354166666667,0.0864406779661,0.09791666666667,0.15762711864407),j.CreateObject(chip,351,227,94,93,c,0.365625,0.38474576271186,0.09791666666667,0.15762711864407),j.CreateObject(chip,440,317,35,35,c,0.45833333333333,0.53728813559322,0.03645833333333,0.05932203389831),j.CreateObject(chip,393,331,35,35,c,0.409375,0.56101694915254,0.03645833333333,0.05932203389831),j.CreateObject(chip,340,324,35,35,c,0.35416666666667,0.54915254237288,0.03645833333333,0.05932203389831),j.CreateObject(chip,792,19,35,35,c,0.825,0.03220338983051,0.03645833333333,0.05932203389831),j.CreateObject(chip,867,119,35,35,c,0.903125,0.20169491525424,0.03645833333333,0.05932203389831),j.CreateObject(chip,680,530,35,35,c,0.70833333333333,0.89830508474576,0.03645833333333,0.05932203389831),j.CreateObject(chip,334,478,35,35,c,0.34791666666667,0.81016949152542,0.03645833333333,0.05932203389831),j.CreateObject(chip,486,335,35,35,c,0.50625,0.56779661016949,0.03645833333333,0.05932203389831),j.CreateObject(chip,182,556,18,18,d,0.18958333333333,0.94237288135593,0.01875,0.03050847457627),j.CreateObject(chip,708,119,35,35,c,0.7375,0.20169491525424,0.03645833333333,0.05932203389831),j.CreateObject(chip,867,19,35,35,c,0.903125,0.03220338983051,0.03645833333333,0.05932203389831),j.CreateObject(chip,462,277,35,35,c,0.48125,0.46949152542373,0.03645833333333,0.05932203389831),j.CreateObject(chip,440,369,35,35,c,0.45833333333333,0.62542372881356,0.03645833333333,0.05932203389831),j.CreateObject(chip,381,377,35,35,c,0.396875,0.63898305084746,0.03645833333333,0.05932203389831),j.CreateObject(chip,84,325,35,35,c,0.0875,0.55084745762712,0.03645833333333,0.05932203389831),j.CreateObject(chip,108,423,67,66,c,0.1125,0.71694915254237,0.06979166666667,0.11186440677966),j.CreateObject(chip,762,63,94,93,c,0.79375,0.10677966101695,0.09791666666667,0.15762711864407)}},{Path={j.CreateZone(36,144,40,67,a,0.0375,0.24406779661017,0.04166666666667,0.1135593220339),j.CreateZone(76,155,104,48,c,0.07916666666667,0.26271186440678,0.10833333333333,0.08135593220339),j.CreateZone(173,155,36,140,c,0.18020833333333,0.26271186440678,0.0375,0.23728813559322),j.CreateZone(173,289,36,115,c,0.18020833333333,0.48983050847458,0.0375,0.19491525423729),j.CreateZone(173,370,135,36,c,0.18020833333333,0.6271186440678,0.140625,0.06101694915254),j.CreateZone(308,380,239,17,d,0.32083333333333,0.64406779661017,0.24895833333333,0.02881355932203),j.CreateZone(547,271,31,133,c,0.56979166666667,0.45932203389831,0.03229166666667,0.22542372881356),j.CreateZone(556,179,16,92,d,0.57916666666667,0.30338983050847,0.01666666666667,0.15593220338983),j.CreateZone(282,179,274,16,d,0.29375,0.30338983050847,0.28541666666667,0.0271186440678),j.CreateZone(282,179,13,288,d,0.29375,0.30338983050847,0.01354166666667,0.48813559322034),j.CreateZone(282,456,281,11,d,0.29375,0.7728813559322,0.29270833333333,0.01864406779661),j.CreateZone(563,448,209,30,c,0.58645833333333,0.75932203389831,0.21770833333333,0.05084745762712),j.CreateZone(748,191,15,257,d,0.77916666666667,0.32372881355932,0.015625,0.43559322033898),j.CreateZone(748,191,108,12,d,0.77916666666667,0.32372881355932,0.1125,0.02033898305085),j.CreateZone(856,157,40,67,b,0.89166666666667,0.26610169491525,0.04166666666667,0.1135593220339)},Scene={j.CreateObject(chip,762,63,94,93,c,0.79375,0.10677966101695,0.09791666666667,0.15762711864407),j.CreateObject(chip,108,423,67,66,c,0.1125,0.71694915254237,0.06979166666667,0.11186440677966),j.CreateObject(chip,84,325,35,35,c,0.0875,0.55084745762712,0.03645833333333,0.05932203389831),j.CreateObject(chip,340,409,35,35,c,0.35416666666667,0.69322033898305,0.03645833333333,0.05932203389831),j.CreateObject(chip,398,409,35,35,c,0.41458333333333,0.69322033898305,0.03645833333333,0.05932203389831),j.CreateObject(chip,228,202,35,35,c,0.2375,0.34237288135593,0.03645833333333,0.05932203389831),j.CreateObject(chip,867,19,35,35,c,0.903125,0.03220338983051,0.03645833333333,0.05932203389831),j.CreateObject(chip,708,119,35,35,c,0.7375,0.20169491525424,0.03645833333333,0.05932203389831),j.CreateObject(chip,182,556,18,18,d,0.18958333333333,0.94237288135593,0.01875,0.03050847457627),j.CreateObject(chip,486,335,35,35,c,0.50625,0.56779661016949,0.03645833333333,0.05932203389831),j.CreateObject(chip,708,19,35,35,c,0.7375,0.03220338983051,0.03645833333333,0.05932203389831),j.CreateObject(chip,334,478,35,35,c,0.34791666666667,0.81016949152542,0.03645833333333,0.05932203389831),j.CreateObject(chip,680,530,35,35,c,0.70833333333333,0.89830508474576,0.03645833333333,0.05932203389831),j.CreateObject(chip,867,119,35,35,c,0.903125,0.20169491525424,0.03645833333333,0.05932203389831),j.CreateObject(chip,792,19,35,35,c,0.825,0.03220338983051,0.03645833333333,0.05932203389831),j.CreateObject(chip,340,324,35,35,c,0.35416666666667,0.54915254237288,0.03645833333333,0.05932203389831),j.CreateObject(chip,394,343,35,35,c,0.41041666666667,0.58135593220339,0.03645833333333,0.05932203389831),j.CreateObject(chip,440,317,35,35,c,0.45833333333333,0.53728813559322,0.03645833333333,0.05932203389831),j.CreateObject(chip,61,211,94,93,c,0.06354166666667,0.35762711864407,0.09791666666667,0.15762711864407),j.CreateObject(chip,633,211,94,93,c,0.659375,0.35762711864407,0.09791666666667,0.15762711864407),j.CreateObject(chip,61,51,94,93,c,0.06354166666667,0.0864406779661,0.09791666666667,0.15762711864407)}}}function j:Init(q)self.curzone=1;self.travelpoints={x=1,y=1}self.cursor={lastdir=KEY_D,x=1,y=1}end;function j:GenerateSettings(r,s)return{Map=math.random(1,#self.Maps),Countdown=45,WaitTimer=2}end;function j:Reset()self.curzone=1;self.travelpoints={x=1,y=1}self.cursor={x=self.Map.Path[1].x+self.Map.Path[1].w-5,y=self.Map.Path[1].y+self.Map.Path[1].h/2,lastdir=KEY_D}self.lastdir=nil;self.Playing=true;self.HitWall=false;self.Completed=false;self.LineTrail={FX=self.cursor.x,FY=self.cursor.y,{SX=self.cursor.x,SY=self.cursor.y}}end;function j:Start(s)self.Countdown=s.Countdown;self.StartTime=s.Start+s.WaitTimer;self.EndTime=s.Start+s.Countdown;self.Settings=s||{}self.Map=self.Maps[s.Map]self:Reset()return self.EndTime end;function j:OnFailedAttempt(t,u)self.StartTime=CurTime()+1;self:Reset()end;function j:Stop(v)self.Playing=false;if v==srp.hacking.COMPLETED then self:OnSuccess()else self:OnLost()end end;function j:SetupDisplay()end;function j:OnSuccess()end;function j:OnLost()end;function j:BetweenPoints(w,x,y,z)return w>=y.min.x&&w<=y.max.x&&x>=y.min.y&&x<=y.max.y end;function j:InSafeZone(k,l)if k<0||k>self.width||l<0||l>self.height then return false end;if self:BetweenPoints(k,l,self.Map.Path[self.curzone])then return true end;local A=self.Map.Path[self.curzone+1]if A then if self:BetweenPoints(k,l,A)then self.curzone=self.curzone+1;return true,A.type==b end end;local B=self.Map.Path[self.curzone-1]if B then if self:BetweenPoints(k,l,B)then self.curzone=self.curzone-1;return true,B.type==b end end;return false end;function j:StoreLineHistory()local C=self.LineTrail[#self.LineTrail]C.FX=self.cursor.x;C.FY=self.cursor.y;self.LineTrail[#self.LineTrail+1]={SX=self.cursor.x,SY=self.cursor.y}end;function j:KeyPressed(q,D)if!self.Playing||self.StartTime>CurTime()then return end;if self.KeyReverses[self.cursor.lastdir]==D then return end;if self.KeyPaths[D]&&self.lastdir!=D then self.cursor.lastdir=D;self.lastdir=D;self.travelpoints={x=self.cursor.x,y=self.cursor.y}self:StoreLineHistory()end end;function j:KeyReleased(q,D)end;function j:Think(q)if!self.Playing||self.HitWall||self.Completed||self.StartTime>CurTime()then return end;local E=self.KeyPaths[self.cursor.lastdir]local F=self.MoveSpeed*RealFrameTime()if E.x then self.cursor.x=self.cursor.x+E.x*F else self.cursor.y=self.cursor.y+E.y*F end;local G,H=self:InSafeZone(self.cursor.x,self.cursor.y)self.HitWall=!G;if H then self.Playing=false;self.Completed=true;srp.hacking.RequestInput(self)elseif!G then self.Playing=false;self.Completed=false;srp.hacking.RequestInput(self)end end;function j:WriteInput()net.WriteBool(self.Completed)end;function j:ReadInput()return net.ReadBool()end;function j:IsValidInput(r,I)return I end;if CLIENT then local J=surface.GetTextureID('materials/sprites/physbeam_white.vtf')local K=Material'materials/galactic/ui/job.png'local L=Color(5,5,5,255)local M={[a]={color=col.white,material=Material('materials/galactic/ui/hacking/start.png','smooth noclamp')},[b]={color=col.white,material=Material('materials/galactic/ui/hacking/end.png','smooth noclamp')},[c]={color=Color(74,93,74)},[d]={color=Color(164,175,164)}}function j:Paint(q,m,n)if!self.Playing then return end;local N=self.HitWall&&col.red||col.white;surface.SetDrawColor(74,161,77)surface.DrawRect(0,0,m,n)surface.SetDrawColor(200,200,200,200)surface.DrawRect(0,0,16,n)surface.SetDrawColor(255,200,50)surface.DrawRect(8,575,16,8)for O=1,#self.Map.Path do local y=self.Map.Path[O]local P=M[y.type]||M[c]surface.SetDrawColor(P.color)if P.material then surface.SetMaterial(P.material)surface.DrawTexturedRect(y.min.x,y.min.y,y.w,y.h)else surface.DrawRect(y.min.x,y.min.y,y.w,y.h)end end;if self.Map.Scene then for O=1,#self.Map.Scene do local y=self.Map.Scene[O]if y.material&&!y.material:IsError()then if y.color then surface.SetDrawColor(y.color)else surface.SetDrawColor(255,255,255,255)end;surface.SetMaterial(y.material)surface.DrawTexturedRect(y.min.x,y.min.y,y.w,y.h)end end end;draw.NoTexture()if self.HitWall then surface.SetDrawColor(200,200,200,200)else surface.SetDrawColor(255,200,50,200)end;for O=1,#self.LineTrail do local Q=self.LineTrail[O]if Q.FX&&Q.FY then surface.DrawLine(Q.SX,Q.SY,Q.FX,Q.FY)surface.DrawLine(Q.SX-1,Q.SY-1,Q.FX-1,Q.FY-1)surface.DrawLine(Q.SX+1,Q.SY+1,Q.FX+1,Q.FY+1)surface.DrawLine(Q.SX-4,Q.SY-4,Q.FX-4,Q.FY-4)surface.DrawLine(Q.SX+4,Q.SY+4,Q.FX+4,Q.FY+4)surface.DrawLine(Q.SX-8,Q.SY-8,Q.FX-8,Q.FY-8)surface.DrawLine(Q.SX+8,Q.SY+8,Q.FX+8,Q.FY+8)else surface.DrawLine(Q.SX,Q.SY,self.cursor.x,self.cursor.y)surface.DrawLine(Q.SX-1,Q.SY-1,self.cursor.x-1,self.cursor.y-1)surface.DrawLine(Q.SX+1,Q.SY+1,self.cursor.x+1,self.cursor.y+1)surface.DrawLine(Q.SX-4,Q.SY-4,self.cursor.x-4,self.cursor.y-4)surface.DrawLine(Q.SX+4,Q.SY+4,self.cursor.x+4,self.cursor.y+4)end end;surface.SetDrawColor(N)surface.SetMaterial(i)surface.DrawTexturedRect(self.cursor.x-h,self.cursor.y-h,g,g)end end;srp.hacking.RegisterGame('circuits',j)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/highlight_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/menu_cl.lua:
srp.menu=srp.menu||{}srp.menu.panel=srp.menu.panel||nil;if IsValid(srp.menu.panel)then srp.menu.panel:Remove()end;local a=Material('materials/galactic/ui/menu/talentlevel.png','nomips noclamp')local b=Material('materials/galactic/ui/menu/imprints.png','nomips noclamp')local c=Material('materials/galactic/ui/menu/settings.png','nomips noclamp')local d=Material('materials/gui/e.png','nomips noclamp')local e=Material('materials/galactic/ui/menu/talentlevel.png','nomips noclamp')local f=Material('materials/galactic/ui/menu/groupfist.png','nomips noclamp')local g=Material('materials/galactic/ui/menu/usd.png','smooth noclamp nomips')local h=Material('materials/galactic/ui/menu/discord.png','noclamp nomips')local i=Material('models/props_lab/warp_sheet')function srp.menu.Open(j,k,l)local m;if l&&IsValid(srp.menu.panel)then srp.menu.panel:Remove()end;if IsValid(srp.menu.panel)then srp.menu.panel:Show()hook.Run('OnMenuOpened')if j then m=srp.menu.panel:SelectItemByName(j)end;if k then srp.menu.panel:MoveToFront()end;return m end;local n=vgui.Create'srp_talentcontainer'n:Populate()local o=vgui.Create'srp_imprints'o:Populate()srp.ui.Create('srp_f4menu',function(p)p:SetSize(1220,609)p:Center()p:MakePopup(true)p:SetDeleteOnClose(false)local q=srp.ui.Create'srp_settings'q:Populate({'SSRP','TeamSpeak Sync','Quests','Achievements','Audio','Audio - Media','Radio','Weapons','Crosshair','Cosmetics','Titles','Chat','HUD','Gamemaster','NPC','Other','Staff'})p:AddPage('Group',f,'srp_groups',function(r,s,t)s.img:DockMargin(2,2,2,2)end)p:AddPage('Talents',a,n)p:AddPage('Imprints',b,o)hook.Run('OnMenuCreated',p)p:AddPage('Store',g,'srp_creditshop_panel',function(r,s,t)s:SetText'SHOP's:SetFont'ui_header.sb's:SetTextInset(10,0)s:SetBorderColor(col.gold)s:SetBackgroundColor(col.midnight_dark)end)p:AddPage('Discord',h,function(s,r,t)gui.OpenURL(info.Discord)end,function(r,s,u)s:Dock(BOTTOM)end)p:AddPage('Settings',c,q,function(r,s,t)s:Dock(BOTTOM)end)p:AddPage('Binds',d,srp.ui.Create('srp_settings_binds'),function(r,s,t)s:Dock(BOTTOM)s.img:DockMargin(8,8,8,8)end)srp.menu.panel=p;if j then m=srp.menu.panel:SelectItemByName(j)end;if k then srp.menu.panel:MoveToFront()end end)return m end;function srp.menu.Close()if IsValid(srp.menu.panel)then srp.menu.panel:Hide()hook.Run('OnMenuClosed')return end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/marker/markers_cl.lua:
srp.marker=srp.marker||{}local a={}local b={}local c,d,e=24,24,120;local function f()local g=LocalPlayer():GetPos()for h,i in pairs(a)do local j=i.pos:ToScreen()if!j.visible then continue end;if i.CanView&&!i.CanView(i,LocalPlayer())then continue end;local k=g:Distance(i.pos)if!i.mortar&&k>6000 then continue end;surface.SetMaterial(i.icon)surface.SetDrawColor(i.color)surface.DrawTexturedRect(j.x-c/2,j.y-d,c,d)if IsValid(i.pl)then draw.DrawText(i.pl:Nick(),'ui_header.r',j.x,j.y,col.white,TEXT_ALIGN_CENTER)end;if i.distance then local l=string.GetMetres(k)draw.DrawText(l..'m','ui_header.r',j.x,j.y+18,col.white,TEXT_ALIGN_CENTER)end end end;function srp.marker.Mark(m,n,o)srp.marker.Remove(m)local p=m:SteamID()local q=srp.marker.type[n]||srp.marker.type[0]local i={pl=m,pos=o+Vector(0,0,q.offset||0),start=CurTime(),endtime=CurTime()+e,icon=q.icon,color=q.color:Copy(),distance=true,mortar=q.mortar,CanView=q.CanView}if m:GetPos():Distance(i.pos)<4000 then surface.PlaySound('buttons/button16.wav')end;if q.OnAdded then q.OnAdded(q,LocalPlayer(),m)end;srp.hud.RegisterMarker(p,{icon=i.icon,color=i.color,pos=i.pos})timer.Create('srp.marker.Remove'..p,e,1,function()if IsValid(m)then srp.marker.Remove(m)end end)local r=table.insert(a,i)b[p]=r;hook('HUDPaint','srp.hud.draw_marker',f)end;function srp.marker.Remove(m)local p=m:SteamID()local r=b[p]if!r then return end;local i=a[r]if i then a[r]=nil;b[p]=nil end;srp.hud.RemoveMarker(p)if table.Count(a)==0 then timer.Remove('srp.marker.Remove'..p)hook.Remove('HUDPaint','srp.hud.draw_marker')end end;net('srp.marker.MarkPos',function()local m,n,j=net.ReadEntity(),net.ReadUInt(4),net.ReadVector()if cvar.GetValue('srp_markers')&&IsValid(m)&&j then srp.marker.Mark(m,n,j)end end)net('srp.marker.RemoveMarker',function()local m=net.ReadEntity()if IsValid(m)then srp.marker.Remove(m)end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/notifications/notify_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/notifications/ui/newsticker_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/ui/filters_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/imprints/imprint_cl.lua:
srp.imprint=srp.imprint||{}function srp.imprint.UpgradeAll()net.Start'srp.imprint.UpgradeAll'net.SendToServer()end;local function a(b,c)local d=LocalPlayer()local e=srp.imprint.Get(b,true)local f=math.min(c,#e.Tiers)d.Imprints[e.id]=f;d.ImprintValues[e.id]=e.Tiers[f]||0;return e,c end;net('srp.imprint.Sync',function()local d=LocalPlayer()d.Imprints={}d.ImprintValues={}for g=1,net.ReadUInt(7)do a(net.ReadUInt(7),net.ReadUInt(4))end;hook.Run('OnImprintsSynced',d.Imprints)end)net('srp.imprint.Upgrade',function()local e,c=a(net.ReadUInt(7),net.ReadUInt(4))hook.Run('OnImprintUpgraded',e.id,e,c)end)net('srp.imprint.UpgradeAll',function()local h=srp.imprint.GetAll(true)local d=LocalPlayer()d.Imprints={}d.ImprintValues={}for g=1,#h do local e=h[g]local i=#e.Tiers;d.Imprints[e.id]=i;d.ImprintValues[e.id]=e.Tiers[i]||0;hook.Run('OnImprintUpgraded',e.id,e,i)end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/inventory/ui/container_ui.lua:
local a={}function a:Init()self:SetSize(ScrW(),ScrH())self:SetPos(0,0)end;function a:Populate(b,c)local d=cvar.GetValue('srp_storeshowinventory')local e=srp.inventory.Get(LocalPlayer():CharacterID())self:AddPanel(c||'srp_inventory',function(f)f:SetTitle(b.name||'Store')f:Populate(b,e)f.close:LeftClick(function(g)srp.inventory.Close(b.id)self:Remove()end)self.store=f end)if d then self:AddPanel(c||'srp_inventory',function(h)h:SetTitle'My Inventory'h:SetWide(425)h:Populate(e,b)h.close:LeftClick(function(g)srp.inventory.Close(b.id)self:Remove()end)self.inventory=h end)self.store:SetWide(425)self.store:SetPos(ScrW()*.5-self.store:GetWide()-5,(ScrH()-self.store:GetTall())*.5)self.inventory:SetPos(ScrW()*.5+5,(ScrH()-self.inventory:GetTall())*.5)else self.store:Center()end end;function a:Paint()end;vgui.Register('srp_inventory_container',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/inventory/ui/inventory_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/items/item_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/items/scrapping/scrapping_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/ui/tickets_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/ui/tickets_ui.lua:
local a={}local b=Color(0,0,0,5)local c=Material'materials/galactic/sup_logo.png'local d=Material'materials/galactic/ui/job.png'local e=Material'materials/galactic/ui/triumphs/miscellaneous.png'local f=Material'materials/galactic/ui/menu/player.png'local g=Material'materials/galactic/ui/padlock.png'local h=Material('materials/galactic/ui/warning.png','smooth noclamp nomips')function a:Init()self.characters={}self.characterlist={}self:SetSize(1200,700)self:DockPadding(1,30,1,1)self:SetBackgroundColor(col.white_dark)self:SetTitle'Ticket Database'self:Center()self:MakePopup()self:SetDeleteOnClose(false)self:AddPanel('srp_panel',function(i)i:SetTall(40)i:Dock(TOP)i:SetBackgroundColor(col.grey_light)i:DockMargin(0,0,0,0)i:DockPadding(4,4,4,4)i:AddPanel('srp_search',function(i)i:Dock(FILL)i:SetPlayerSearch()i:OnFilterResults(function(j,k)local l={}for m,n in pairs(k)do if string.find(n.name:lower(),'nigge')||string.find(n.name:lower(),'nigga')then continue end;local o=player.GetBySteamID(n.steamid)if IsValid(o)&&o:CharacterID()==n.characterid then n.tag='Online Now'end;table.insert(l,n)end;return l end)i:OnSelected(function(j,p)self:SearchCitations(p)end)self.search=i end)i:AddPanel('srp_checkbox',function(i)i:SetOptions({name='Received',http=srp.jail.GetPlayerTickets,httparg='steamid'},{name='Given',http=srp.jail.GetGivenTickets,httparg='characterid'})i:SetPosition(1)i:Dock(RIGHT)i:DockMargin(2,2,2,2)i:SetWide(200)i:OnValueChanged(function(j,q,r)self.HTTPFunction=r.http;self.HTTPFunctionArg=r.httparg;if self.character then j:SetDisabled(true,1)self:SearchCitations(self.character)end end)self.searchMode=i end)end)self:AddPanel('srp_panel',function(i)i:SetWide(280)i:Dock(LEFT)i:SetBackgroundColor(b)i:SetBorderColor(col.grey)i:DockMargin(0,0,0,0)i:DockPadding(0,0,0,0)i:AddPanel('srp_label',function(s)s:SetText' History's:SetFont'ui_header.r's:DockMargin(0,0,0,0)s:DockPadding(0,0,0,0)s:Dock(TOP)s:SetTall(40)s.Paint=function(j,t,u)surface.SetDrawColor(col.grey_dark)surface.DrawRect(0,0,t,u)surface.SetDrawColor(0,0,0,255)surface.DrawLine(0,u-1,t,u-1)end end)i:AddPanel('ui_scrollpanel',function(v)v:Dock(FILL)self.historylist=v end)end)self:AddPanel('srp_panel',function(i)i:Dock(FILL)i:SetBackgroundColor(col.transparent)i:DockMargin(0,0,0,0)i:DockPadding(0,0,0,0)i:AddPanel('srp_label',function(s)s:SetText' Overview's:SetFont'ui_header.r's:DockMargin(0,0,0,0)s:DockPadding(0,0,0,0)s:Dock(TOP)s:SetTall(40)s.Paint=function(j,t,u)surface.SetDrawColor(col.grey_dark)surface.DrawRect(0,0,t,u)surface.SetDrawColor(0,0,0,255)surface.DrawLine(0,u-1,t,u-1)end end)i:AddPanel('srp_panel',function(i)i:Dock(FILL)i:SetBackgroundColor(col.transparent)i:DockMargin(0,0,0,0)i:DockPadding(4,4,4,4)i:AddPanel('ui_scrollpanel',function(v)v:Dock(FILL)self.overview=v end)end)self.display=i end)end;function a:Populate(w)if!w then return end;local i=self.characters[w]if IsValid(i)then self:SearchCitations(i.character)else self.search:SetValue(w)self.search:Search(w,true)end end;function a:SearchCitations(p)local x=p[self.HTTPFunctionArg||'steamid']local y=self.HTTPFunction||srp.jail.GetPlayerTickets;y(x,function(z,A)self:AddSearchHistory(p,A)end)end;function a:AddSearchHistory(p,A)if self.characters[p.steamid]then self.characters[p.steamid]:Populate(p,A)self:DisplayCitations(p,A)else srp.ui.Create('srp_jailbutton',function(i)i:Populate(p,A)i:LeftClick(function(j)j:SetDisabled(true,1)self:SearchCitations(j.character)end)self.historylist:AddItem(i)self.characters[p.steamid]=i;local B=table.insert(self.characterlist,1,i)if B>10 then local C=table.remove(self.characterlist,6)if IsValid(C)then C:Remove()end end;self:DisplayCitations(p,A)end)end end;function a:DisplayCitations(p,A)self.character=p;self:SetTitle('Ticket Database - '..p.name..' - '..p.steamid)self.overview:Reset()if IsValid(self.titlePanel)then self.titlePanel:Remove()end;for m,i in ipairs(self.characterlist)do if IsValid(i)then i:Select(i.character.characterid==p.characterid)end end;local o=player.GetBySteamID(p.steamid)local D={}local E={}if A then for m,F in ipairs(A)do if E[F.criminalid]then continue end;table.insert(D,F.criminalid)E[F.criminalid]=true end end;self.display:AddPanel('srp_panel',function(i)self.titlePanel=i;i:Dock(TOP)i:SetTall(200)i:SetBackgroundColor(Color(0,0,0,100))i:DockPadding(9,9,9,9)i:AddPanel('ui_imagebutton',function(G)G:SetWide(182)G:Dock(LEFT)G:DockMargin(0,0,6,0)G:SetSkin'SUP'G:SetSteamID64(util.SteamIDTo64(p.steamid),182)end)i:AddPanel('srp_panel',function(i)i:Dock(FILL)i:DockPadding(15,15,15,15)i:DockMargin(0,0,0,0)i:SetBackgroundColor(col.transparent)i:AddPanel('srp_label',function(s)s:SetText(p.name)s:SetTextColor(col.white)s:Dock(TOP)s:SetTall(30)s:SetFont'ui_header.l'end)i:AddPanel('srp_label',function(s)s:SetText(p.steamid)s:SetTextColor(col.white)s:Dock(TOP)s:SetTall(20)s:SetFont'ui_header.r'end)i:AddPanel('srp_label',function(s)s:SetText("\""..(p.biography||'').."\"")s:SetWrap(true)s:SetContentAlignment(7)s:SetTextColor(col.white)s:Dock(FILL)s:SetTall(15)s:SetFont'ui_label.r'end)end)i:AddPanel('srp_panel',function(i)i:Dock(RIGHT)i:SetWide(182)i:DockMargin(0,0,6,0)i:SetBackgroundColor(col.transparent)i:AddPanel('srp_button_tag_rounded',function(H)H:Dock(TOP)H:DockMargin(0,0,0,2)H:DockPadding(0,0,0,0)H:SetText' Offline'H:SetFont'ui_label.l'H:SetMaterial(f)H:SetDisabled(false)local I=IsValid(o)&&o:IsJailed()&&col.red||IsValid(o)&&col.green||Color(0,0,0,150)local J=IsValid(o)&&o:IsJailed()&&'Jailed'||IsValid(o)&&'Online'||'Offline'H:SetBackgroundColor(I)H:SetHoverColor(I)H:SetText(J)self.online=H end)if IsValid(o)then local K=o:IsWanted()&&'Wanted'||o:IsJailed()&&'Jailed'||nil;local L=o:IsWanted()&&h||o:IsJailed()&&g||nil;if K then i:AddPanel('srp_button_tag_rounded',function(H)H:Dock(TOP)H:DockMargin(0,0,0,2)H:DockPadding(0,0,0,0)H:SetText(' '..K)H:SetFont'ui_label.l'H:SetMaterial(L)H:SetDisabled(false)H:SetBackgroundColor(col.red_dark)H:SetHoverColor(col.red_dark)self.online=H end)end end;i:AddPanel('srp_button_tag_rounded',function(H)H:Dock(TOP)H:DockMargin(0,0,0,2)H:DockPadding(0,0,0,0)H:SetBackgroundColor(Color(0,0,0,150))H:SetText' SUP Profile'H:SetFont'ui_label.l'H:SetMaterial(c,true)H:LeftClick(function(j)gui.OpenURL('https://superiorservers.co/profile/'..p.steamid)end)end)i:AddPanel('srp_button_tag_rounded',function(H)H:Dock(TOP)H:DockMargin(0,0,0,2)H:DockPadding(0,0,0,0)H:SetBackgroundColor(Color(0,0,0,150))H:SetText' Steam Profile'H:SetFont'ui_label.l'H:SetMaterial(d)H:LeftClick(function(j)gui.OpenURL('https://steamcommunity.com/profiles/'..util.SteamIDTo64(p.steamid))end)end)if LocalPlayer():IsEnforcement()then i:AddPanel('srp_button_tag_rounded',function(H)H:Dock(TOP)H:DockMargin(0,0,0,2)H:DockPadding(0,0,0,0)H:SetBackgroundColor(Color(0,0,0,150))H:SetText' Create Ticket'H:SetFont'ui_label.l'H:SetMaterial(e)H:LeftClick(function(j)cmd.Run('ticketoffline',p.steamid,p.characterid)end)end)end end)end)if A then for m,F in ipairs(A)do srp.ui.Create('srp_ticketline',function(i)i:Populate(p,F)self.overview:AddItem(i)end)end end end;vgui.Register('srp_tickets',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loadouts/loadout_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loadouts/ui/loadoutmoduleslot_ui.lua:
local a={}local b=col.midnight_dark;function a:Init()self:LeftClick(function(c)c:DisplayModules()end)hook('OnAttachmentAdded',self,self.OnAttachmentAdded)hook('OnAttachmentRemoved',self,self.OnAttachmentRemoved)end;function a:ShowRemoveButton()if IsValid(self.RemoveBtn)then return end;self:AddPanel('srp_button_rounded',function(d)d:SetFont'SSRPForkAwesome'd:SetText(0xf00d,true)d:SetPos(110,5)d:SetSize(16,16)d:SetBackgroundColor(col.midnight_dark)d:SetHoverColor(col.midnight_dark)d:SetTextColor(col.red_dark)d:LeftClick(function()self:SetDisabled(true,2)srp.notif.Confirm({title='Confirm Deletion',sub_text='If you have the weapon module tool it will be consumed and your module will be refunded. If you do not have the item then this module will be destroyed.\n\nAre you sure you want to continue?',class=self.item.class_name,slotid=self.slotid,callback=function(e)net.Start'srp.WeaponAttachments.UnEquip'net.WriteString(e.class)net.WriteString(e.slotid)net.SendToServer()end})end)self.RemoveBtn=d end)end;function a:Populate(f,g,h,i)self.item=g;self.slotid=f;self.AttachmentMaterial=i&&srp.inventory.rarities.emptycosmetic||srp.inventory.rarities.empty;self.AttachmentText=nil;self.Cosmetic=i;if IsValid(self.RemoveBtn)then self.RemoveBtn:Remove()end;if h then local j=srp.WeaponAttachments.Get(h)if j then self:DisplayAttachment(j)end end end;function a:DisplayAttachment(j)local g=srp.items.Get(j.id)if g then self.AttachmentItem=g;self.AttachmentMaterial=srp.inventory.rarities[g.rarity]||self.AttachmentMaterial;self:SetText''self.AttachmentText=g.name;self:ShowRemoveButton()end end;function a:OnAttachmentAdded(k,l,m,n)local j=srp.WeaponAttachments.Get(n)if j&&self.slotid==m then self:DisplayAttachment(j)end end;function a:OnAttachmentRemoved(k,l,m,n)if self.slotid!=m then return end;if IsValid(self.RemoveBtn)then self.RemoveBtn:Remove()end;self.AttachmentMaterial=self.Cosmetic&&srp.inventory.rarities.emptycosmetic||srp.inventory.rarities.empty;self.AttachmentItem=nil;self.AttachmentText=nil end;function a:DisplayModules()if IsValid(self.ModuleList)then self.ModuleList:Remove()return end;srp.ui.Create('srp_loadout_modulelist',function(o)o:Populate(self.slotid,self.item,self.AttachmentItem!=nil)self.ModuleList=o end)self:InvalidateLayout(true)end;function a:PerformLayout(p,q)if IsValid(self.ModuleList)then local r,s=self:GetParent():LocalToScreen(self:GetPos())self.ModuleList:SetPos(r+p/2-self.ModuleList:GetWide()/2,s-self.ModuleList:GetTall())end end;function a:OnRemove()if IsValid(self.ModuleList)then self.ModuleList:Remove()end;hook.Remove('OnAttachmentAdded',self)end;function a:Paint(p,q)if self.AttachmentMaterial then if self.Cosmetic&&!self.AttachmentItem then draw.RoundedBox(12,10,10,p-20,q-20,b)surface.SetMaterial(self.AttachmentMaterial)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(20,20,p-40,q-40)else draw.RoundedBox(12,10,10,p-20,q-20,b)end end;if self.AttachmentItem&&self.AttachmentItem.icon then if self.AttachmentItem.color then surface.SetDrawColor(self.AttachmentItem.color.r,self.AttachmentItem.color.g,self.AttachmentItem.color.b,self:IsHovered()&&255||200)else surface.SetDrawColor(255,255,255,220)end;surface.SetMaterial(self.AttachmentItem.icon)surface.DrawTexturedRect(34,24,p-68,q-68)end;if self.AttachmentText then local t=self.AttachmentText;surface.SetFont'ui_header.s'local u,v=surface.GetTextSize(t)u=u+12;draw.DrawText(self.AttachmentText,'ui_header.s',p/2,q-40,col.white,TEXT_ALIGN_CENTER)end end;vgui.Register('srp_loadout_moduleslot',a,'srp_button')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loadouts/ui/loadoutslots_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loadouts/ui/loadouttip_ui.lua:
local a={}local b=Material'gui/lmb.png'local c=98;function a:Init()self.outline=col.black;self:SetSize(450,200)self:SetBackgroundColor(col.midnight)self:DockPadding(5,5,5,5)self:SetMouseInputEnabled(false)self:AddPanel('srp_label',function(d)d:Dock(TOP)d:SetTall(25)d:SetMouseInputEnabled(false)self.header=d end)self:AddPanel('srp_panel',function(d)d:Dock(LEFT)d:SetWide(123)d:SetMouseInputEnabled(false)d.Paint=function(e,f,g)draw.Box(0,0,f,g,col.midnight_dark)if e.icon then surface.SetDrawColor(255,255,255,255)surface.SetMaterial(e.icon)surface.DrawTexturedRect((f-c)/2,(g-c)/2,c,c)end end;self.img=d end)self:AddPanel('srp_label',function(h)h:DockMargin(5,5,5,5)h:Dock(TOP)h:SetContentAlignment(7)h:SetWrap(true)h:SetTall(60)h:SetFont'ui_label.r'self.desc=h end)self:AddPanel('srp_grid',function(i)i:Dock(FILL)i:SetAutoHeight(true)i:DockMargin(2,2,2,2)self.stats=i end)self:AddPanel('srp_panel',function(d)d:Dock(BOTTOM)d:SetTall(24)d:SetBackgroundColor(col.midnight_dark)d:AddPanel('srp_label',function(h)h:Dock(LEFT)h:SetText('')self.cost=h end)d:AddPanel('srp_label',function(h)h:Dock(RIGHT)h:SetText('BUY')h:SetWide(35)self.info=h end)d:AddPanel('DImage',function(j)j:Dock(RIGHT)j:SetWide(20)j:SetMaterial(b)self.click=j end)end)end;function a:Think()local k,l=gui.MousePos()self:SetPos(k+20,l+20)if!IsValid(self.owner)||!self.owner:IsVisible()then self:Remove()return end end;function a:SetItem(m,n,o,p)self.item=m;self.img.icon=m.icon;self.header:SetText(m.name)if m.description then self.desc:SetText(m.description)else self.desc:Remove()end;local i=m&&m.GenerateStats&&m.GenerateStats(self.item)if i then self:PopulateStats(i)end;if p then self.info:SetText'EQUIPPED'self.info:SetWide(80)self.click:SetWide(0)self.cost:SetText''elseif o then self.info:SetText'EQUIP'self.info:SetWide(40)self.click:SetWide(20)self.cost:SetText''else local q=LocalPlayer():GetCurrency()self.info:SetText'BUY'self.info:SetWide(40)self.click:SetWide(20)self.cost:SetText((n||0)..q)end end;function a:PopulateStats(i)self.stats:Clear()if!i then return end;for r,s in pairs(i)do if!s[1]||!s[2]then continue end;srp.ui.Create('srp_label',function(h)h:SetSize(142,24)h:SetText(s[1]..': '..(s[2]==-1&&'Unlimited'||s[2]))h:SetFont'ui_label.r'h:DockMargin(0,0,0,0)h:SetTall(20)h:SetContentAlignment(4)self.stats:AddItem(h)end)end end;function a:Paint(f,g)derma.SkinHook('Paint','Frame',self,f,g)end;vgui.Register('srp_loadout_tooltip',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/doors/doors_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/funcmodules/funcmodule_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/funcmodules/ui/funcmodulearea_ui.lua:
local a={}function a:Init()self:SetSize(335,400)self:SetPos(2,100)self:SetBackgroundColor(col.transparent)self:DockPadding(0,0,0,0)self:SetKeyboardInputEnabled(false)self:SetMouseInputEnabled(false)self:MoveToFront()self.warnings={}end;function a:AddWarning(b,c)if self.warnings[b]then self.warnings[b]:Remove()end;self:AddPanel('srp_funcmodulewarning',function(d)d:Dock(TOP)d:SetData(c)self.warnings[b]=d end)return self end;function a:RemoveWarning(b)if self.warnings[b]then self.warnings[b]:Remove()end;return self end;vgui.Register('srp_funcmodulearea',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/npc/dialogues/dialogue_cl.lua:
srp.dialogue=srp.dialogue||{}local a;function srp.dialogue.CreateMenu(b,c)if IsValid(a)then a:Remove()end;srp.ui.Create('srp_dialogue',function(d)d.npc=c;d:SetWide(600)d:SetDialogue(b)a=d end)end;function srp.dialogue.SendOnClick(e,f,g,c)net.Start'srp.dialogue.SendOnClick'net.WriteEntity(c)net.WriteString(e)net.WriteByte(f)net.WriteByte(g)net.SendToServer()end;net('srp.dialogue.Open',function()local e=net.ReadString()local c=net.ReadEntity()local h=srp.dialogue.data[e]if h.Read then h:Read(c)end;srp.dialogue.CreateMenu(e,c)end)net('srp.dialogue.Close',function()local h=srp.dialogue.data[net.ReadString()]if h&&h.OnClosed then h:OnClosed()end;if IsValid(a)then a:Remove()end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/thirdperson_cl.lua:
cvar.Register'enable_thirdperson':SetDefault(false):AddMetadata('Menu','Enable thirdperson'):ConCommand(function(self,a,b)if!b[1]then self:SetValue(!self:GetValue())else self:SetValue(b[1]=="1")end end)local c=CreateClientConVar('sup_thirdperson_x','120')local d=CreateClientConVar('sup_thirdperson_y','0')local e=CreateClientConVar('sup_thirdperson_z','15')local f=true;local g=false;local h,i=40,400;local j,k=-40,40;local l,m=-15,15;local n=90;local o=0;function EnableThirdPerson(p)f=p end;function isThirdPerson(a)a=a||LocalPlayer()if!f then return end;if a:InChess()then return false end;local q=a:GetActiveWeapon()local r=!srp.camera.enabled&&cvar.GetValue('enable_thirdperson')local s=!a:InVehicle()&&a:GetObserverMode()==OBS_MODE_NONE&&a:Alive()local t=IsValid(q)&&q.ThirdPerson;return(t||r)&&s end;local u={origin=Vector()}local v;local w=nil;local x={}local function y(a)local q=a:GetActiveWeapon()if IsValid(q)&&(q.IsLightsaber&&q:GetEnabled()||q.EnableFreeLook==false)then return false else return true end end;function PLAYER:GetRealView()return isThirdPerson(self)&&u.origin||self:GetShootPos()end;timer.Create('ThirdPerson.IgnoreEnts',1,0,function()if!IsValid(LocalPlayer())then return end;x=player.GetAll()for z,A in ipairs(LocalPlayer():GetChildren())do x[#x+1]=A end end)hook('CalcView','ThirdPerson.CalcView',function(a,B,C)local D=isThirdPerson(a)if(D||o>0)&&a.camera_ang then if D then o=math.min(o+(1-o)*FrameTime()*18,1)if o>.99 then o=1 end else o=math.max(o-o*FrameTime()*18,0)if o<.2 then o=0 end end;local g=g;local E=y(a)if a:KeyDown(IN_WALK)then g=!g end;if v&&(!g||!E)then a.camera_ang=Angle(v.p,v.y,v.r)v=nil elseif!v&&g&&E then v=Angle(a.camera_ang.p,a.camera_ang.y,a.camera_ang.r)end;B=a:GetDefaultViewOffset(true)+a.camera_ang:Forward()*o*-math.Clamp(c:GetInt(),h,i)+a.camera_ang:Right()*o*math.Clamp(d:GetInt(),j,k)+a.camera_ang:Up()*o*math.Clamp(e:GetInt(),l,m)local F=util.TraceHull({start=a:GetShootPos(),endpos=B,filter=x,collisiongroup=COLLISION_GROUP_BREAKABLE_GLASS,mins=Vector(-10,-10,-10),maxs=Vector(10,10,10)})if F.Hit then B=F.HitPos+(a:GetShootPos()-F.HitPos):GetNormal()*10 end;local G=util.TraceLine({start=a:EyePos(),endpos=B+a.camera_ang:Forward()*100000,filter=x,mask=MASK_VISIBLE})u.origin=B;u.fov=n;u.angles=a.camera_ang+a:GetViewPunchAngles()u.drawviewer=true;if D&&a:IsNoClip()then a:SetEyeAngles(v||a.camera_ang)elseif D&&!E||!g then local H=(G.HitPos-a:EyePos()):Angle()local I=math.NormalizeAngle(a.camera_ang.y-45)local J=math.NormalizeAngle(a.camera_ang.y+45)local K=math.NormalizeAngle(H.y)a:SetEyeAngles(H)end;return u elseif u&&u.drawviewer then u.drawviewer=false;return u end end)hook("CreateMove","ThirdPerson.CreateMove",function(L)local a=LocalPlayer()if isThirdPerson(a)&&a.camera_ang&&!a:IsNoClip()then local M=v||a.camera_ang;local N=a:GetAimVector():Angle()+a:GetViewPunchAngles()local O=Vector(L:GetForwardMove(),L:GetSideMove(),L:GetUpMove())O:Rotate(N-M)L:SetForwardMove(O.x)L:SetSideMove(O.y)L:SetUpMove(O.z)end end)hook("InputMouseApply","ThirdPerson.InputMouseApply",function(L,c,d,P)local a=LocalPlayer()if isThirdPerson(a)then if!a.camera_ang then a.camera_ang=a:EyeAngles()end;a.camera_ang.p=math.Clamp(math.NormalizeAngle(a.camera_ang.p+d/50),-90,90)a.camera_ang.y=math.NormalizeAngle(a.camera_ang.y-c/50)return true else a.camera_ang=a:EyeAngles()end end)local Q;hook("PlayerBindPress","ThirdPerson.PlayerBindPress",function(a,R,S)if S&&R:lower()=="+walk"then local T=SysTime()if Q&&Q>T-0.5 then if!y(a)then g=false else g=!g end end;Q=T end end)hook('ShouldDrawLocalPlayer','ThirdPersonDrawPlayer',function()if cvar.GetValue('enable_thirdperson')then local a=LocalPlayer()return isThirdPerson(a)end end)hook('OnSSRPContextMenuOpened','ThirdPersonDrawAdjsuter',function(a,U,V)U:AddPanel('ui_checkbox',function(self)self:Dock(TOP)self:SetText'Enable Thirdperson'self:SetConVar'enable_thirdperson'self:SizeToContents()self:SetMouseInputEnabled(true)self:DockMargin(0,4,0,4)end)if a.camera_ang then local W=U:AddPanel('srp_window',function(self)self:Dock(TOP)self:SetTall(190)self:SetTitle'Camera Offset'self:SetMouseInputEnabled(true)self:SetDraggable(false)self:DockMargin(0,10,0,10)self.close:Remove()self.Paint=function(X,Y,Z)draw.RoundedBox(4,0,0,Y,Z,col.midnight)end end)local _=W:AddPanel('ui_slider_vertical',function(self,a0)self:Dock(RIGHT)self:SetSkin'SUP'self.OnChange=function(self,a1)a1=1-a1;c:SetInt(h+a1*(i-h))end;self:SetValue(math.Clamp(1-(c:GetInt()-h)/(i-h),0,1))end)local a2=W:AddPanel('srp_panel',function(self,a0)self:Dock(FILL)self:DockMargin(0,0,2,0)self.OnMousePressed=function(X)X.Dragging=true end;self.Think=function(X)if!input.IsMouseDown(MOUSE_LEFT)||!X:IsHovered()then X.Dragging=false;return end;if!self.targetX then return end;local a3,a4=X:CursorPos()local a5,a6=self.targetX,self.targetY;local a7,a8=X:GetWide(),X:GetTall()self.targetX=math.Clamp(a3,0,a7)self.targetY=math.Clamp(a4,0,a8)local a9=self.targetX/a7;local aa=1-self.targetY/a8;if self.targetX!=a5||self.targetY!=a6 then d:SetInt(j+a9*(k-j))e:SetInt(l+aa*(m-l))end end;self.Paint=function(X,Y,Z)if!X.targetX then return end;surface.SetDrawColor(col.white_dark)surface.DrawOutlinedRect(Y*.25,Z*.25,Y*.5,Z*.5)surface.DrawLine(0,Z*.5,Y,Z*.5)surface.DrawLine(Y*.5,0,Y*.5,Z)surface.SetDrawColor(col.white)surface.DrawOutlinedRect(0,0,Y,Z)surface.DrawLine(X.targetX,0,X.targetX,Z)surface.DrawLine(0,X.targetY,Y,X.targetY)draw.RoundedBox(4,X.targetX-9,X.targetY-9,18,18,col.white_dark)draw.RoundedBox(4,X.targetX-8,X.targetY-8,16,16,col.blue_light)end;self:InvalidateLayout(true)timer.Simple(0.03,function()if IsValid(self)then self.targetX=(d:GetInt()-j)/(k-j)*self:GetWide()self.targetY=(1-(e:GetInt()-l)/(m-l))*self:GetTall()end end)end)end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/animations/ui/boneanimplace_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/death/death_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/death/revive_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/death/revive_cl.lua:
srp.revive=srp.revive||{}local a={'Yeah, uh, he appears to be dead...','Why am I checking his pulse, he\'s missing his fucking head!','Wow, he\'s fucked up alright'}function srp.revive.OpenMenu(b)srp.ui.Create('srp_commrose',function(c)c.rev=b;c:SetText'Medical Overview'c:AddOption('pulse',{name='Check Pulse',background=col.green_dark:Copy(),click=function()LocalPlayer():ChatPrint(a[math.random(1,#a)])end})c:AddOption('exit',{name='Quit',background=col.orange:Copy(),click=function(self)self:GetParent():Close()end})c:AddOption('kill',{name='Kill player',background=col.red_dark:Copy(),click=function(self)local b=self:GetParent().rev;if IsValid(b)then net.Start'srp.revive.Execute'net.WriteEntity(b)net.SendToServer()self:GetParent():Close()end end})c:AddOption('revive',{name='Start Revive',background=col.green:Copy(),click=function(self)local b=self:GetParent().rev;if IsValid(b)then net.Start'srp.revive.Revive'net.WriteEntity(b)net.SendToServer()self:GetParent():Close()end end})c:Complete()end)end;net('srp.revive.OpenMenu',function()srp.revive.OpenMenu(net.ReadEntity())end)concommand.AddDev('srp_commrose',function(d)srp.revive.OpenMenu(d)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/polling/ui/polloption_ui.lua:
local a={}local b=Color(200,200,200,25)local c=Color(0,0,0,40)function a:Init()self:DockPadding(1,1,1,1)self:DockMargin(0,5,0,0)self:SetTall(25)self:AddPanel('srp_label',function(d)d:SetText''d:Dock(FILL)d:SetContentAlignment(4)self.name=d end)self:AddPanel('srp_button_rounded',function(e)e:SetText'0%'e:Dock(RIGHT)e:SetContentAlignment(6)e:SetWide(110)e:SetTextColor(col.white)e:DockMargin(0,0,0,0)e:DockPadding(2,2,5,2)e:SetBackgroundColor(c)e:LeftClick(function(f)if!self.votedfor then net.Start'srp.polls.RequestVote'net.WriteUInt(self.poll.pollid,16)net.WriteUInt(self.option.optionid,4)net.SendToServer()end end)self.percentlbl=e end)hook('OnPollVoted',self,self.UpdateVoteCount)end;function a:Populate(g,h,i)if i then self.percentlbl:SetDisabled(true)self.percentlbl:SetBackgroundColor(col.red_dark)end;self.disabled=i;self.poll=g;self.option=h;self.name:SetText(h.name)self.votedfor=g.voted_for;self.count=h.count||0;self.percent=g.count==0&&self.count==0&&0||(self.count/g.count||0)self.percentlbl:SetText(self.count..' votes ('..math.Round((self.percent||0)*100)..'%)')end;function a:UpdateVoteCount(g,j)if g.pollid==self.poll.pollid&&j==self.option.optionid then self.votedfor=true;self.count=self.count+1;self.percent=g.count==0&&self.count==0&&0||(self.count/g.count||0)self.percentlbl:SetText(self.count..' votes ('..math.Round((self.percent||0)*100)..'%)')end end;function a:Paint(k,l)draw.RoundedBox(6,0,0,k,l,col.grey)draw.RoundedBox(6,1,1,(k-112)*self.percent,l-2,self.disabled&&col.red_dark||self.votedfor&&col.green_light||col.blue_dark)end;vgui.Register('srp_polloption',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/invasion_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/questing_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/trader_cl.lua:
srp.trader=srp.trader||{}
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/ui/quest_objective_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/enums_sh.lua:
if CLIENT then SCHED_NONE=0;SCHED_IDLE_STAND=1;SCHED_IDLE_WALK=2;SCHED_IDLE_WANDER=3;SCHED_WAKE_ANGRY=4;SCHED_ALERT_FACE=5;SCHED_ALERT_FACE_BESTSOUND=6;SCHED_ALERT_REACT_TO_COMBAT_SOUND=7;SCHED_ALERT_SCAN=8;SCHED_ALERT_STAND=9;SCHED_ALERT_WALK=10;SCHED_INVESTIGATE_SOUND=11;SCHED_COMBAT_FACE=12;SCHED_COMBAT_SWEEP=13;SCHED_FEAR_FACE=14;SCHED_COMBAT_STAND=15;SCHED_COMBAT_WALK=16;SCHED_CHASE_ENEMY=17;SCHED_CHASE_ENEMY_FAILED=18;SCHED_VICTORY_DANCE=19;SCHED_TARGET_FACE=20;SCHED_TARGET_CHASE=21;SCHED_SMALL_FLINCH=22;SCHED_BIG_FLINCH=23;SCHED_BACK_AWAY_FROM_ENEMY=24;SCHED_MOVE_AWAY_FROM_ENEMY=25;SCHED_BACK_AWAY_FROM_SAVE_POSITION=26;SCHED_TAKE_COVER_FROM_ENEMY=27;SCHED_TAKE_COVER_FROM_BEST_SOUND=28;SCHED_FLEE_FROM_BEST_SOUND=29;SCHED_TAKE_COVER_FROM_ORIGIN=30;SCHED_FAIL_TAKE_COVER=31;SCHED_RUN_FROM_ENEMY=32;SCHED_RUN_FROM_ENEMY_FALLBACK=33;SCHED_MOVE_TO_WEAPON_RANGE=34;SCHED_MOVE_OFF_OF_NPC=35;SCHED_ESTABLISH_LINE_OF_FIRE=36;SCHED_ESTABLISH_LINE_OF_FIRE_FALLBACK=37;SCHED_PRE_FAIL_ESTABLISH_LINE_OF_FIRE=38;SCHED_FAIL_ESTABLISH_LINE_OF_FIRE=39;SCHED_SHOOT_ENEMY_COVER=40;SCHED_COWER=41;SCHED_MELEE_ATTACK1=42;SCHED_MELEE_ATTACK2=43;SCHED_RANGE_ATTACK1=44;SCHED_RANGE_ATTACK2=45;SCHED_SPECIAL_ATTACK1=46;SCHED_SPECIAL_ATTACK2=47;SCHED_STANDOFF=48;SCHED_ARM_WEAPON=0;SCHED_DISARM_WEAPON=49;SCHED_HIDE_AND_RELOAD=50;SCHED_RELOAD=51;SCHED_AMBUSH=52;SCHED_DIE=53;SCHED_DIE_RAGDOLL=54;SCHED_WAIT_FOR_SCRIPT=55;SCHED_AISCRIPT=56;SCHED_SCRIPTED_WALK=57;SCHED_SCRIPTED_RUN=58;SCHED_SCRIPTED_CUSTOM_MOVE=59;SCHED_SCRIPTED_WAIT=60;SCHED_SCRIPTED_FACE=61;SCHED_SCENE_GENERIC=62;SCHED_NEW_WEAPON=63;SCHED_NEW_WEAPON_CHEAT=64;SCHED_SWITCH_TO_PENDING_WEAPON=65;SCHED_GET_HEALTHKIT=66;SCHED_WAIT_FOR_SPEAK_FINISH=67;SCHED_MOVE_AWAY=68;SCHED_MOVE_AWAY_FAIL=69;SCHED_MOVE_AWAY_END=70;SCHED_FORCED_GO=71;SCHED_FORCED_GO_RUN=72;SCHED_NPC_FREEZE=73;SCHED_PATROL_WALK=74;SCHED_COMBAT_PATROL=75;SCHED_PATROL_RUN=76;SCHED_RUN_RANDOM=77;SCHED_FALL_TO_GROUND=78;SCHED_DROPSHIP_DUSTOFF=79;SCHED_FLINCH_PHYSICS=80;SCHED_FAIL=81;SCHED_FAIL_NOSTOP=82;SCHED_RUN_FROM_ENEMY_MOB=83;SCHED_DUCK_DODGE=84;SCHED_INTERACTION_MOVE_TO_PARTNER=85;SCHED_INTERACTION_WAIT_FOR_PARTNER=86;SCHED_SLEEP=87;LAST_SHARED_SCHEDULE=88 end;GOAL_NONE=-1;GOAL_ENEMY=0;GOAL_TARGET=1;GOAL_ENEMY_LKP=2;GOAL_SAVED_POSITION=3;TASK_INVALID=0;TASK_RESET_ACTIVITY=1;TASK_WAIT=2;TASK_ANNOUNCE_ATTACK=3;TASK_WAIT_FACE_ENEMY=4;TASK_WAIT_FACE_ENEMY_RANDOM=5;TASK_WAIT_PVS=6;TASK_SUGGEST_STATE=7;TASK_TARGET_PLAYER=8;TASK_SCRIPT_WALK_TO_TARGET=9;TASK_SCRIPT_RUN_TO_TARGET=10;TASK_SCRIPT_CUSTOM_MOVE_TO_TARGET=11;TASK_MOVE_TO_TARGET_RANGE=12;TASK_MOVE_TO_GOAL_RANGE=13;TASK_MOVE_AWAY_PATH=14;TASK_GET_PATH_AWAY_FROM_BEST_SOUND=15;TASK_SET_GOAL=16;TASK_GET_PATH_TO_GOAL=17;TASK_GET_PATH_TO_ENEMY=18;TASK_GET_PATH_TO_ENEMY_LKP=19;TASK_GET_CHASE_PATH_TO_ENEMY=20;TASK_GET_PATH_TO_ENEMY_LKP_LOS=21;TASK_GET_PATH_TO_ENEMY_CORPSE=22;TASK_GET_PATH_TO_PLAYER=23;TASK_GET_PATH_TO_ENEMY_LOS=24;TASK_GET_FLANK_RADIUS_PATH_TO_ENEMY_LOS=25;TASK_GET_FLANK_ARC_PATH_TO_ENEMY_LOS=26;TASK_GET_PATH_TO_RANGE_ENEMY_LKP_LOS=27;TASK_GET_PATH_TO_TARGET=28;TASK_GET_PATH_TO_TARGET_WEAPON=29;TASK_CREATE_PENDING_WEAPON=30;TASK_GET_PATH_TO_HINTNODE=31;TASK_STORE_LASTPOSITION=32;TASK_CLEAR_LASTPOSITION=33;TASK_STORE_POSITION_IN_SAVEPOSITION=34;TASK_STORE_BESTSOUND_IN_SAVEPOSITION=35;TASK_STORE_BESTSOUND_REACTORIGIN_IN_SAVEPOSITION=36;TASK_REACT_TO_COMBAT_SOUND=37;TASK_STORE_ENEMY_POSITION_IN_SAVEPOSITION=38;TASK_GET_PATH_TO_COMMAND_GOAL=39;TASK_MARK_COMMAND_GOAL_POS=40;TASK_CLEAR_COMMAND_GOAL=41;TASK_GET_PATH_TO_LASTPOSITION=42;TASK_GET_PATH_TO_SAVEPOSITION=43;TASK_GET_PATH_TO_SAVEPOSITION_LOS=44;TASK_GET_PATH_TO_RANDOM_NODE=45;TASK_GET_PATH_TO_BESTSOUND=46;TASK_GET_PATH_TO_BESTSCENT=47;TASK_RUN_PATH=48;TASK_WALK_PATH=49;TASK_WALK_PATH_TIMED=50;TASK_WALK_PATH_WITHIN_DIST=51;TASK_WALK_PATH_FOR_UNITS=52;TASK_RUN_PATH_FLEE=53;TASK_RUN_PATH_TIMED=54;TASK_RUN_PATH_FOR_UNITS=55;TASK_RUN_PATH_WITHIN_DIST=56;TASK_STRAFE_PATH=57;TASK_CLEAR_MOVE_WAIT=58;TASK_SMALL_FLINCH=59;TASK_BIG_FLINCH=60;TASK_DEFER_DODGE=61;TASK_FACE_IDEAL=62;TASK_FACE_REASONABLE=63;TASK_FACE_PATH=64;TASK_FACE_PLAYER=65;TASK_FACE_ENEMY=66;TASK_FACE_HINTNODE=67;TASK_PLAY_HINT_ACTIVITY=68;TASK_FACE_TARGET=69;TASK_FACE_LASTPOSITION=70;TASK_FACE_SAVEPOSITION=71;TASK_FACE_AWAY_FROM_SAVEPOSITION=72;TASK_SET_IDEAL_YAW_TO_CURRENT=73;TASK_RANGE_ATTACK1=74;TASK_RANGE_ATTACK2=75;TASK_MELEE_ATTACK1=76;TASK_MELEE_ATTACK2=77;TASK_RELOAD=78;TASK_SPECIAL_ATTACK1=79;TASK_SPECIAL_ATTACK2=80;TASK_FIND_HINTNODE=81;TASK_FIND_LOCK_HINTNODE=82;TASK_CLEAR_HINTNODE=83;TASK_LOCK_HINTNODE=84;TASK_SOUND_ANGRY=85;TASK_SOUND_DEATH=86;TASK_SOUND_IDLE=87;TASK_SOUND_WAKE=88;TASK_SOUND_PAIN=89;TASK_SOUND_DIE=90;TASK_SPEAK_SENTENCE=91;TASK_WAIT_FOR_SPEAK_FINISH=92;TASK_SET_ACTIVITY=93;TASK_RANDOMIZE_FRAMERATE=94;TASK_SET_SCHEDULE=95;TASK_SET_FAIL_SCHEDULE=96;TASK_SET_TOLERANCE_DISTANCE=97;TASK_SET_ROUTE_SEARCH_TIME=98;TASK_CLEAR_FAIL_SCHEDULE=99;TASK_PLAY_SEQUENCE=100;TASK_PLAY_PRIVATE_SEQUENCE=101;TASK_PLAY_PRIVATE_SEQUENCE_FACE_ENEMY=102;TASK_PLAY_SEQUENCE_FACE_ENEMY=103;TASK_PLAY_SEQUENCE_FACE_TARGET=104;TASK_FIND_COVER_FROM_BEST_SOUND=105;TASK_FIND_COVER_FROM_ENEMY=106;TASK_FIND_LATERAL_COVER_FROM_ENEMY=107;TASK_FIND_BACKAWAY_FROM_SAVEPOSITION=108;TASK_FIND_NODE_COVER_FROM_ENEMY=109;TASK_FIND_NEAR_NODE_COVER_FROM_ENEMY=110;TASK_FIND_FAR_NODE_COVER_FROM_ENEMY=111;TASK_FIND_COVER_FROM_ORIGIN=112;TASK_DIE=113;TASK_WAIT_FOR_SCRIPT=114;TASK_PUSH_SCRIPT_ARRIVAL_ACTIVITY=115;TASK_PLAY_SCRIPT=116;TASK_PLAY_SCRIPT_POST_IDLE=117;TASK_ENABLE_SCRIPT=118;TASK_PLANT_ON_SCRIPT=119;TASK_FACE_SCRIPT=120;TASK_PLAY_SCENE=121;TASK_WAIT_RANDOM=122;TASK_WAIT_INDEFINITE=123;TASK_STOP_MOVING=124;TASK_TURN_LEFT=125;TASK_TURN_RIGHT=126;TASK_REMEMBER=127;TASK_FORGET=128;TASK_WAIT_FOR_MOVEMENT=129;TASK_WAIT_FOR_MOVEMENT_STEP=130;TASK_WAIT_UNTIL_NO_DANGER_SOUND=131;TASK_WEAPON_FIND=132;TASK_WEAPON_PICKUP=133;TASK_WEAPON_RUN_PATH=134;TASK_WEAPON_CREATE=135;TASK_ITEM_PICKUP=136;TASK_ITEM_RUN_PATH=137;TASK_USE_SMALL_HULL=138;TASK_FALL_TO_GROUND=139;TASK_WANDER=140;TASK_FREEZE=141;TASK_GATHER_CONDITIONS=142;TASK_IGNORE_OLD_ENEMIES=143;TASK_DEBUG_BREAK=144;TASK_ADD_HEALTH=145;TASK_ADD_GESTURE_WAIT=146;TASK_ADD_GESTURE=147;TASK_GET_PATH_TO_INTERACTION_PARTNER=148;TASK_PRE_SCRIPT=149;LAST_SHARED_TASK=150
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/rts_sh.lua:
srp.rts=srp.rts||{}srp.rts.fov=100;ACTIONMODE_CONTROL=1;ACTIONMODE_UNIT=2;srp.rts.ClassBlacklist={['env_sprite']=true,['env_rope']=true,['class C_FuncAreaPortalWindow']=true,['func_illusionary']=true}srp.rts.ClassWhitelist={['prop_door']=true,['prop_physics']=true}nw.Register'srp.rts.enabled':Write(net.WriteBool):Read(net.ReadBool):SetLocalPlayer():SetHook'OnPlayerRTSMode'nw.Register'srp.rts.drone':Write(net.WriteEntity):Read(net.ReadEntity):SetPlayer():SetHook'OnPlayerRTSDrone'nw.Register'srp.rts.NPCSchedule':Write(net.WriteInt,10):Read(net.ReadInt,10)function ENTITY:SendSchedule(a)if!self.SetSchedule then return end;self:SetSchedule(a)self:SetNetVar('srp.rts.NPCSchedule',a)end;function ENTITY:GetSchedule()return self:GetNetVar('srp.rts.NPCSchedule')||0 end;function PLAYER:SetRTSDrone(b)self:SetNetVar('srp.rts.drone',b)end;function PLAYER:GetRTSDrone()return self:GetNetVar('srp.rts.drone')end;function PLAYER:SetRTSMode(c)self:SetNetVar('srp.rts.enabled',c)end;function PLAYER:GetRTSMode()return self:GetNetVar('srp.rts.enabled')end;function srp.rts.GetDroneTrace(d,e,f)local g=d:GetRTSDrone()if!IsValid(g)then return end;local h=SERVER&&g:GetPos()||g:GetSmoothPos()local i=gui.ScreenToVector(e,f)return util.TraceLine{start=h,endpos=h+i*20000}end;function srp.rts.GetEntityFromCursor(e,f)local g=LocalPlayer():GetRTSDrone()local i=gui.ScreenToVector(e,f)local j=util.TraceLine{start=g:GetSmoothPos(),endpos=g:GetSmoothPos()+i*20000}if IsValid(j.Entity)then return j.Entity else local k=ents.FindInSphere(j.HitPos,150)local l;local m=500;for n,b in ipairs(k)do local o=b:GetPos():DistToSqr(j.HitPos)if o<m then l=b;m=o end end;return l end end;srp.AddCommand('rts',function(d)srp.rts.ToggleMode(d)end):SetGM():SetInfoSection('Gamemaster'):SetInfo('Toggles RTS mode. Currently only available on CWRP 2 and 3.')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/ui/rtsgroups_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/seasonal/weather_cl.lua:
local a=false;local b='http://ip-api.com/json'local c='https://api.open-meteo.com/v1/forecast?latitude=%lat%&longitude=%lon%&current_weather=true'local d=true;srp.WeatherTemp=0;local function e(f)local g=f.current_weather;if!g then return end;local h=g.temperature;if!h then return end;srp.WeatherTemp=math.Round(h,1)if h>=28&&!d then srp.notif.Neutral(4,'Remember to stay hydrated!')end;if h<=5&&!d then srp.notif.Neutral(4,'Stay warm with a hot chocolate maybe?')end;net.Start'srp.weather'net.WriteInt(h,7)net.SendToServer()d=false end;local function i()http.Fetch(b,function(j)local f=util.JSONToTable(j)if!f then return end;local c=c:Replace('%lat%',f.lat):Replace('%lon%',f.lon)http.Fetch(c,function(k)local f=util.JSONToTable(k)if f then e(f)end end)end)end;hook('OnCharacterSelected',function()if!(srp.seasonal.Summer||srp.seasonal.Christmas)then return end;if!a then i()timer.Create('srp.weather.notif',info.Dev&&20||3600,0,i)a=true end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/optimize/optimize_cl.lua:
RunConsoleCommand('r_decals',10)local a={pp_colormod='0',p_colormod_addr='0',p_colormod_addg='0',p_colormod_addb='0',p_colormod_mullr='0',p_colormod_mullg='0',p_colormod_mullb='0',pp_colormod_brightness='0',pp_colormod_contrast='1',pp_colormod_color='1',cl_interp_ratio='2',cl_interp='0.1',rate=100000}for b,c in pairs(a)do RunConsoleCommand(b,c)cvars.AddChangeCallback(b,function(d,e,f)if a[d]&&f!=a[d]then RunConsoleCommand(d,a[d])end end)end;timer.Create('CleanBodys',60,0,function()RunConsoleCommand'r_cleardecals'for g,h in ipairs(ents.FindByClass('class C_ClientRagdoll'))do h:Remove()end;for g,h in ipairs(ents.FindByClass('class C_PhysPropClientside'))do if!IsValid(h:GetParent())&&!h.DoNotRemove then h:Remove()end end end)function DoPropSpawnedEffect()end;function GM:CalcView(i,j,k,l,m,n)local o=i:GetVehicle()local p={}p.origin=j;p.angles=k;p.fov=l;p.znear=m;p.zfar=n;p.drawviewer=false;if IsValid(o)then return hook.Run('CalcVehicleView',o,i,p)end;local q=i:GetActiveWeapon()if IsValid(q)then local r=q.CalcView;if r then p.origin,p.angles,p.fov=r(q,i,j*1,k*1,l)end end;return p end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/restart/restart_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/sounds/sounds_sh.lua:
srp.sounds=srp.sounds||{}srp.sounds.data=srp.sounds.data||{}function srp.sounds.Register(a,b)srp.sounds.data[a]=b end;function srp.sounds.Get(a)return srp.sounds.data[a]end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/staffnews/ui/staffnews_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/statistics/statcapture_cl.lua:
srp.statcapture=srp.statcapture||{}function srp.statcapture.Read()local a=net.ReadUInt(7)if a==0 then return end;local b={}local c=net.ReadBool()for d=1,a do local e=net.ReadString()local f=!c&&net.ReadString()local g=net.ReadUInt(20)table.insert(b,{id=e,steamid=f,value=g})end;return b end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/statistics/statcapture_sh.lua:
srp.statcapture=srp.statcapture||{}local a={}function srp.statcapture.AddType(b,c)c.id=b;a[b]=c end;function srp.statcapture.GetType(b,c)return a[b]end;srp.statcapture.AddType('npckills',{Name='Most NPCs Killed',HookId='OnNPCKilled',Hook=function(self,d,e,f)if IsValid(f)&&f:IsPlayer()then d:Add(self.id,f,1)end end})srp.statcapture.AddType('deaths',{Name='Most Deaths',HookId='PlayerDeath',Hook=function(self,d,g,h,f)if IsValid(g)&&(f:IsNPC()||h:IsNPC())then d:Add(self.id,g,1)end end})srp.statcapture.AddType('revives',{Name='Most Revives',HookId='OnPlayerRevived',Hook=function(self,d,i,j)if IsValid(j)then d:Add(self.id,j,1)end end})srp.statcapture.AddType('playerkills',{Name='Most Players Killed',HookId='DoPlayerDeath',Hook=function(self,d,g,f)if IsValid(f)&&f:IsPlayer()then d:Add(self.id,f,1)end end})
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/simroom/simroom_sh.lua:
srp.simroom=srp.simroom||{}srp.simroom.MaxWaves=15;srp.simroom.MaxSpawns=15;srp.simroom.MaxWaveDelay=30;srp.simroom.MaxHealth=2500;srp.simroom.MaxWavesBits=net.GetBits(srp.simroom.MaxWaves)srp.simroom.MaxSpawnsBits=net.GetBits(srp.simroom.MaxSpawns)srp.simroom.MaxWaveDelayBits=net.GetBits(srp.simroom.MaxWaveDelay)srp.simroom.MaxHealthBits=net.GetBits(srp.simroom.MaxHealth)srp.simroom.BlacklistedClasses={npc_drg_jka_rancor=true,npc_drg_mutant_rancor=true,npc_drg_bull_rancor=true,npc_drg_adolescent_bull_rancor=true,npc_drg_mecharancor=true,npc_drg_rancor=true,npc_drg_irradiated_rancor=true,npc_drg_juvenile_rancor=true,npc_drg_marsh_rancor=true,npc_drg_mountain_rancor=true,npc_drg_nocturnal_rancor=true,npc_drg_rancor_egg=true,npc_drg_rancor_egg_hostile=true,npc_drg_rancor_mount=true,npc_drg_rancordragon=true,npc_drg_simulated_rancor=true,npc_drg_tyrant_rancor=true,npc_drg_war_rancor=true,npc_barnacle=true,npc_combinedropship=true,npc_combinegunship=true,npc_cscanner=true,npc_strider=true,npc_helicopter=true,npc_combine_camera=true,npc_drg_tauntaun=true,combine_mine=true,npc_rollermine_friendly=true,npc_rollermine=true,npc_drg_dewback=true,npc_drg_nightmarebeast=true,npc_turret_ceiling=true,npc_turret_floor=true}srp.simroom.BlacklistedWeapons={weapon_ar2=true,weapon_pistol=true,weapon_bugbait=true,weapon_smg1=true,weapon_turboblaster=true,weapon_rpg=true,weapon_physgun=true,weapon_stunstick=true,weapon_357=true}local a={}local b={}function srp.simroom.Register(c,d)if!d.Map then ErrorNoHaltWithStack('Simroom registered with no map set!')return end;if!d.Zone||!d.Zone.Min||!d.Zone.Max then ErrorNoHaltWithStack('Simroom zone missing Zone.Min or Zone.Max values!')return end;if d.Map!=info.Map then return end;OrderVectors(d.Zone.Min,d.Zone.Max)local e={id=c,Name=d.Name||'Simroom',Description=d.Description,Color=d.Color||color_white:Copy(),MaxSpaws=d.MaxSpawns||srp.simroom.MaxSpawns,Background=d.Background||nil,PercentToWorld=srp.simroom.CalculatePosition,ZoneFlipX=d.ZoneFlipX,ZoneFlipY=d.ZoneFlipY,Zone=d.Zone}e.internal=table.insert(b,e)a[c]=e end;function srp.simroom.Get(c,f)return f&&b[c]||a[c]end;function srp.simroom.CalculatePosition(e,g,h)local i=e.Zone.Max.x-e.Zone.Min.x;local j=e.Zone.Max.y-e.Zone.Min.y;if e.ZoneFlipX then g=1-g end;if e.ZoneFlipY then h=1-h end;return Vector(e.Zone.Min.x+i*g,e.Zone.Min.y+j*h,e.Zone.Max.z)end;function srp.simroom.ReadFromServer()local k=srp.simroom.Read()if k then k.OwnerSteamID=net.ReadString()return k end end;function srp.simroom.WriteToClient(e,k)srp.simroom.Write(e,k)net.WriteString(k.OwnerSteamID)end;function srp.simroom.Write(e,k)if SERVER&&!k then net.WriteUInt(0,3)return end;net.WriteUInt(e.internal,3)net.WriteUInt(k.Waves,srp.simroom.MaxWavesBits)net.WriteUInt(k.WaveDelay,srp.simroom.MaxWaveDelayBits)net.WriteUInt(k.MinSpawns,srp.simroom.MaxSpawnsBits)net.WriteUInt(#k.Spawns,srp.simroom.MaxSpawnsBits)for l=1,#k.Spawns do local m=k.Spawns[l]if srp.simroom.BlacklistedClasses[m.Class]||m.Class:find('drg')||m.Class:find('nbot')then m.Class='npc_sw_droid_b1_h'end;if srp.simroom.BlacklistedWeapons[m.Weapon]then m.Weapon='weapon_e5'end;net.WriteString(m.Class)net.WriteString(m.Weapon)net.WriteBool(m.Roaming)net.WriteUInt(m.Health,srp.simroom.MaxHealthBits)net.WriteFloat(m.X)net.WriteFloat(m.Y)end end;function srp.simroom.Read()local f=net.ReadUInt(3)if f==0 then return end;local e=srp.simroom.Get(f,true)local n=math.Clamp(net.ReadUInt(srp.simroom.MaxWavesBits),1,srp.simroom.MaxWaves)local o=math.Clamp(net.ReadUInt(srp.simroom.MaxWaveDelayBits),2,srp.simroom.MaxWaveDelay)local p=math.Clamp(net.ReadUInt(srp.simroom.MaxSpawnsBits),1,srp.simroom.MaxSpawns)local q=math.Clamp(net.ReadUInt(srp.simroom.MaxSpawnsBits),1,srp.simroom.MaxSpawns)local r={}for l=1,q do local s=net.ReadString()local t=net.ReadString()local u=net.ReadBool()local v=math.Clamp(net.ReadUInt(srp.simroom.MaxHealthBits),250,srp.simroom.MaxHealth)local g=math.Clamp(net.ReadFloat(),0,1)local h=math.Clamp(net.ReadFloat(),0,1)if srp.simroom.BlacklistedClasses[s]||s:find('drg')||s:find('nbot')then s='npc_sw_droid_b1_h'end;if srp.simroom.BlacklistedWeapons[t]then t='weapon_e5'end;table.insert(r,{Class=s,Weapon=t,Roaming=u,Health=v,X=g,Y=h,Pos=e:PercentToWorld(g,h)})end;p=math.min(#r,p)return{internal=f,Waves=n,WaveDelay=o,MinSpawns=p,Spawns=r}end;srp.simroom.Register('csr',{Name='CSR Simroom',Description='Citadel simroom',Color=col.midnight:Copy(),Map='rp_liberator_sup_b8at',Background=Material('materials/galactic/ui/sims/csr.png'),ZoneFlipY=true,ZoneFlipX=false,Zone={Min=Vector(6400.030000,-2439.970000,-240),Max=Vector(8959.970000,-768.030000,560)}})srp.simroom.Register('esr',{Name='ESR Simroom',Description='Empty simroom',Color=col.midnight:Copy(),Map='rp_liberator_sup_b8at',Background=Material('materials/galactic/ui/sims/esr.png'),ZoneFlipY=true,ZoneFlipX=false,Zone={Min=Vector(6400.030000,768.030000,-239.970000),Max=Vector(8959.970000,2423.970000,539.980000)}})
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/simroom/ui/simroom_node_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/talents/talent_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/talents/ui/talents_ui.lua:
local a={}local b=Color(150,150,150)local c=col.blue:Copy()c.a=240;local d=Color(col.blue.r,col.blue.g,col.blue.b,220)local e=Color(0,0,0,55)local f=c;local g=Color(0,0,0,160)function a:Init()self:SetSize(800,553)self:DockPadding(0,0,0,0)self:SetBackgroundColor(col.midnight)self:AddPanel('srp_panel_rounded',function(h)h:Dock(TOP)h:SetBackgroundColor(col.midnight_dark)h:SetTall(28)h:DockPadding(0,0,0,0)h:DockMargin(0,0,0,2)h:AddPanel('srp_button',function(i)i:Dock(LEFT)i:SetFont'SSRPForkAwesome'i:SetText(0xf104,true)i:SetWide(28)i:SetBackgroundColor(col.midnight_dark)i:SetHoverColor(col.blue)i:SetBorderColor(col.transparent)i:DockMargin(0,0,0,0)i:LeftClick(function()self.controller:ShowList()end)end)h:AddPanel('srp_label',function(j)j:Dock(FILL)j:SetContentAlignment(4)self.name=j end)end)self:AddPanel('ui_scrollpanel',function(k)k:Dock(FILL)self.scroll=k end)self.curpercent=0;hook('OnMenuOpened',self,self.Refresh)hook('OnTalentXPReceived',self,self.UpdateXPBar)end;function a:OnRemove()hook.Remove('OnMenuOpened',self)hook.Remove('OnTalentXPReceived',self)end;function a:Refresh(l)if!l||l==LocalPlayer()then self:UpdateXPBar(self.tree.id,LocalPlayer():GetTalentXP())self:SetTalents(self.tree.id,self.controller)end end;function a:GoBack()self:GetParent():ShowList()end;function a:SetTalents(m,n)self.scroll:Reset()local o=srp.talents.Get(m)if!o then return end;srp.ui.Create('srp_label',function(j)j:Dock(TOP)j:SetFont'ui_header.s'j:SetBackgroundColor(col.transparent)j:SetTall(45)j:SetContentAlignment(5)j:SetText(o.description||'No description is set for this tree.')self.scroll:AddItem(j)end)self.tree=o;self.controller=n;self.name:SetText(o.name)for p,q in ipairs(o.talents)do srp.ui.Create('srp_talent_row',function(r)r:SetLevel(m,p,q)r:SetTall(52.3)r:Dock(TOP)self.scroll:AddItem(r)end)end;self:UpdateXPBar(m,LocalPlayer():GetTalentXP())end;function a:UpdateXPBar(p,s,t)local u=LocalPlayer():GetTalentLevel()local v=srp.talents.GetLevel(u)local w=srp.talents.GetLevel(u+1)local x=(s-v)/(w-v)self.curxp=s;self.level=u;self.change=t;self.nextxp=w;self.xppercent=x end;function a:PaintOver(y,z)local A=srp.talents.maxlevel==self.level;local B=y*.3;local C=y-B-10;local D=2;if self.xppercent then self.curpercent=Lerp(FrameTime()/.2,self.curpercent||0,self.xppercent)local E=A&&B||B*self.curpercent;draw.RoundedBox(4,C,D,B,26,f)draw.RoundedBox(4,C,D,E,26,A&&col.green_dark||col.midnight_light)draw.DrawText((self.level||0)..'/'..srp.talents.maxlevel..(A&&' - MAX LEVEL'||' ('..self.curxp..'/'..self.nextxp..')')..' +'..(self.change||0)..'XP','ui_header.xs',C+B*.5,7,col.white,TEXT_ALIGN_CENTER)end end;vgui.Register('srp_talents',a,'srp_panel')local a={}function a:Init()self:DockPadding(2,2,2,2)self:DockMargin(0,0,0,0)self:AddPanel('srp_panel',function(h)h:Dock(LEFT)h:SetWide(45)h:AddPanel('srp_label',function(j)j:Dock(FILL)j:SetText'0'j:SetContentAlignment(5)j:SetFont'ui_label.l'self.levelbl=j end)h.Paint=function(F,y,z)draw.RoundedBox(4,0,0,y,z,F.unlocked&&d||f)end;self.info=h end)self:AddPanel('srp_grid',function(G)G:Dock(FILL)G:DockMargin(1,1,1,1)G:DockPadding(0,0,0,0)G:SetAutoHeight(true)G.OnComplete=function(F,z)self:SetTall(z+4)end;self.talents=G end)hook('OnTalentSelected',self,self.UpdateSelected)hook('OnTalentXPReceived',self,self.UpdateUnlocks)end;function a:OnRemove()hook.Remove('OnTalentXPReceived',self)hook.Remove('OnTalentSelected',self)end;local H=Material('materials/galactic/ui/talents/talent.png')function a:SetLevel(m,I,r)self.data=r;self.treeid=m;self.tierid=I;self.levelbl:SetText(r.level)local J=LocalPlayer():GetGroup()local K=J&&J:GetColor()if r.battalionTalents&&J then self.info.Paint=function(F,y,z)if F.unlocked then draw.RoundedBox(4,0,0,y,z,K)end end elseif r.classTalents&&J then self.info.Paint=function(F,y,z)if F.unlocked then draw.RoundedBox(4,0,0,y,z,col.red_dark)end end end;local L=LocalPlayer():GetGroupClass()local M=L&&L:HasPermission'jedi'for p,N in ipairs(r.options)do local O=N.battalion;local P=N.permission;if O then if!J then continue elseif M then if O!=J.id&&O!='JEDI'then continue end elseif O!=J.id then continue end end;if P then local Q=false;for R,S in ipairs(P)do if J&&J:HasPermission(S)||L&&L:HasPermission(S)then Q=true;break end end;if!Q then continue end end;local T=srp.talents.GetTalent(N.talent)if!T then continue end;srp.ui.Create('srp_button_tag_rounded',function(i)i.TalentID=p;local U=srp.talents.FormatValue(LocalPlayer(),N.value)||0;i.desc=T.description:Replace('%value',U>0&&U<1&&math.Round(U*100,2)||U)i:SetText(T.name||N.talent)i:SetFont'ui_label.r'i:SetSize(980/3-5,52.3)i:DockMargin(0,0,0,2)i:SetBackgroundColor(col.grey_dark)i:SetMaterialBackground(col.transparent)i:SetMaterial(T.icon||H)i:SetHoverColor(col.grey)i:OnSelected(function(F)LocalPlayer():EmitSound('npc/dog/dog_servo'..math.random(1,3)..'.wav',30)end)i:LeftClick(function(F)F:SetDisabled(true,.5)if!F.enabled then return end;if F.cost then srp.notif.Confirm({title='Confirm Selection',sub_text='Level 40 Talents cost '..F.cost..' to activate. Are you sure you want to do this?',tid=F.tid,tierid=F.tierid,treeid=F.treeid,callback=function(V)net.Start'srp.talents.Select'net.WriteString(V.treeid)net.WriteUInt(V.tierid,4)net.WriteUInt(V.tid,7)net.SendToServer()end})else net.Start'srp.talents.Select'net.WriteString(F.treeid)net.WriteUInt(F.tierid,4)net.WriteUInt(F.tid,7)net.SendToServer()end end)i.CreateTooltip=function(F)srp.ui.Create('srp_tooltip',function(W)W.parent=F;local X,Y=F:LocalToScreen(F:GetWide()/2,F:GetTall()/2+10)W:SetPos(X,Y)W:MakePopup(true)W:MoveToFront(true)W:SetText(F.desc)F.tooltip=W end)end;i.Think=function(F)local Z=F:IsHovered()if Z&&!IsValid(F.tooltip)then F:CreateTooltip()end end;local _=r.battalionTalents&&(K||col.yellow)||r.classTalents&&col.red||f;i.Paint=function(F,y,z)draw.RoundedBox(6,0,0,y,z,F.selected&&_||e)end;i.tid=p;i.treeid=m;i.tierid=I;i.option=N;i.cost=N.cost;local p=LocalPlayer():GetSelectedTalent(m,I)i.selected=i.tid==p;self.talents:AddItem(i)end)end;self:UpdateUnlocks()end;function a:UpdateSelected(m,I,p)if self.treeid!=m then return end;if self.tierid!=I then return end;for R,i in pairs(self.talents:GetChildren())do i:Select(i.tid==p)end end;function a:UpdateUnlocks()local a0=LocalPlayer():GetTalentLevel()>=self.data.level;self.info.unlocked=a0;for R,i in pairs(self.talents:GetChildren())do if IsValid(i)then i:SetTextColor(a0&&col.white||b)i:SetHoverColor(a0&&col.grey||col.grey_dark)i.enabled=a0 end end end;function a:Paint(y,z)end;vgui.Register('srp_talent_row',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/talents/ui/talentsxp_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/time/timer_cl.lua:
srp.timer=srp.timer||{}if IsValid(srp.timer.ui)then srp.timer.ui:Remove()end;function srp.timer.AddUI(a,b,c)if!IsValid(srp.timer.ui)then srp.ui.Create('srp_timercontainer',function(d)d:AddTimer(a,b,c)srp.timer.ui=d end)else srp.timer.ui:AddTimer(a,b,c)end end;function srp.timer.RemoveUI(a)if IsValid(srp.timer.ui)then srp.timer.ui:RemoveTimer(a)end end;net('srp.timer.Start',function()srp.timer.Start(net.ReadPlayer(),net.ReadString(),net.ReadString(),net.ReadUInt(14))end)net('srp.timer.End',function()srp.timer.End(net.ReadString())end)net('srp.timer.Sync',function()local e=net.ReadUInt(8)for f=1,e do srp.timer.Start(net.ReadPlayer(),net.ReadString(),net.ReadString(),net.ReadUInt(14))end end)hook('OnTimerStarted',function(c)srp.timer.AddUI(c.id,c.name,c.duration)end)hook('OnTimerEnded',function(c)srp.timer.RemoveUI(c.id)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trading/trading_sh.lua:
function PLAYER:GetTradeTax()return self:IsVIPPlus()&&0.025||self:IsVIP()&&0.05||0.1 end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/training_sh.lua:
function PLAYER:IsTrainer()return self:GetData('trainer')==1||self:IsAdmin()end;srp.AddCommand('train',function(a)local b=a:GetGroup()if!a:IsTrainer()then if a.trainingwait&&a.trainingwait>CurTime()then return end;net.Start'srp.training.RequestCert'net.WritePlayer(a)net.Send(GetCertifiedTrainers(b.id))a.trainingwait=CurTime()+30;return end;local c=a:GetEyeTrace().Entity;if IsValid(c)&&c:IsPlayer()&&!c:IsTrained()then c:SetTrained(true)hook.Run('OnPlayerSetTrained',a,c)if!c.wastrained then c.wastrained=true;a:AddTalentXP(200)end end end):AddAlias('tr'):SetInfoSection('Training'):SetInfo('Trains the player you are looking at after they have went through the various training steps.'):SetTrainer()srp.AddCommand('untrain',function(a)local c=a:GetEyeTrace().Entity;if IsValid(c)&&c:IsPlayer()&&c:IsTrained()then c:SetTrained(false)hook.Run('OnPlayerSetUntrained',a,c)end end):AddAlias('utr'):SetFlag'A':SetInfoSection('Training'):SetInfo('Untrains the player you are looking at. Useful for new players who have not been trained correctly.')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingdefcon_ui.lua:
local a={}local b=col.blue:Copy()b.a=215;local c=col.grey:Copy()c.a=215;function a:SetupPanels()self.blur=true;self:AddPanel('srp_label',function(d)d:SetContentAlignment(5)d:SetTall(80)d:SetFont'ui_header.xl'd:Dock(TOP)self.title=d end)self:AddPanel('srp_label',function(d)d:SetContentAlignment(5)d:SetTall(120)d:SetFont'ui_label.l'd:Dock(TOP)self.text=d end)self:AddPanel('srp_panel',function(e)e:SetSize(1000,800)e:SetBackgroundColor(col.transparent)e:Dock(FILL)e:AddPanel('ui_scrollpanel',function(f)f:Dock(LEFT)f:SetWide(200)self.scrollL=f end)e:AddPanel('ui_scrollpanel',function(f)f:Dock(FILL)self.scrollR=f end)self.container=e end)end;function a:Populate(g)self.step=g;self.title:SetText(g.title)self.text:SetText(g.text)self:CreateThreatcons()self:CreateRankGrid()self:CreateButton()end;function a:CreateThreatcons()local h=self.scrollL:GetCanvas()if!IsValid(h)then return end;srp.ui.Create('srp_label',function(e)e:DockMargin(0,0,0,0)e:SetParent(h)e:Dock(TOP)e:SetTall(35)e:SetText'Threatcon/Defcon Information'end)for i,j in ipairs(srp.defcon.data)do if!j.name then continue end;srp.ui.Create('srp_panel',function(e)e:SetParent(h)e:Dock(TOP)e:SetTall(50)e:SetBackgroundColor(Color(0,0,0,200))e:SetBorderColor(j.col)e:DockMargin(0,0,0,0)e:AddPanel('srp_label',function(d)d:SetText(j.name)d:Dock(FILL)end)e:AddPanel('srp_label',function(d)d:SetText(j.sub)d:Dock(BOTTOM)d:SetTall(20)end)end)end end;function a:CreateRankGrid()local h=self.scrollR:GetCanvas()if!IsValid(h)then return end;srp.ui.Create('srp_label',function(e)e:DockMargin(0,0,0,0)e:SetParent(h)e:Dock(TOP)e:SetTall(35)e:SetText'Rank Overview'end)srp.ui.Create('srp_grid',function(k)k:SetParent(h)k:Dock(TOP)k:SetAutoHeight(true)local l=srp.groups.Get(self.step.groupid||1,self.step.groupid==nil):GetRanks(true)if!l then return end;for m,n in pairs(l)do local o=m<10;srp.ui.Create('srp_panel',function(e)e:SetSize(260,42)e:SetBackgroundColor(o&&b||c)e:SetBorderColor(o&&col.blue_light||col.grey_dark)e:AddPanel('DImage',function(p)p:Dock(LEFT)p:SetWide(28)local q=n:GetIcon()if q&&!q:IsError()then p:SetMaterial(q)else p:SetVisible(false)end end)e:AddPanel('srp_label',function(d)d:Dock(FILL)d:SetFont'ui_label.s'd:SetText(n:GetName())end)k:AddItem(e)end)end end)end;vgui.Register('srp_training_defconinfo',a,'srp_training_base')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/triumph_cl.lua:
srp.triumphs=srp.triumphs||{}local a;local b='ssrp/'..info.WebID..'/triumphs/'local c='ssrp/'..info.WebID..'/triumph/'local d;local e;local f;local function g(h)if!h then return end;for i,j in pairs(h)do local k=srp.triumphs.Get(i)if k then k:SetCompleted(j)hook.Run('OnTriumphObjectiveCompleted',k)end end end;local function l(m)if!m then return end;for i,n in pairs(m)do local k=srp.triumphs.Get(i)if k then k:SetLocalData(n)hook.Run('OnTriumphUpdated',k)end end end;function srp.triumphs.OpenMenu()if IsValid(e)then e:Remove()end;srp.ui.Create('srp_triumphwindow',function(a)e=a end)end;function srp.triumphs.ShowFlash(k)if IsValid(f)then f:Populate(k)return end;srp.ui.Create('srp_triumphflash',function(o)o:Populate(k)f=o end)end;function srp.triumphs.ShowPartFlash(k,p,q,r)if IsValid(d)then d:Populate(k,p,q,r)return end;srp.ui.Create('srp_triumphpartflash',function(o)o:Populate(k,p,q,r)d=o end)end;function srp.triumphs.GetProgress(s)s=s||function()end;ba.http.FetchJson(b..LocalPlayer():SteamID(),function(t)if!(t.completed||t.triumphs)then return s(false)end;g(t.completed)l(t.triumphs)if s then s(true,t)end end,function()s(false)end)end;function srp.triumphs.GetTriumphProgress(i,s)s=s||function()end;ba.http.FetchJson(c..LocalPlayer():SteamID()..'/'..i,function(t)if!t.triumph then return end;local k=srp.triumphs.Get(i)if k then k:SetLocalData(t.triumph)hook.Run('OnTriumphUpdated',k)if t.completed then k:SetCompleted(t.completed)hook.Run('OnTriumphObjectiveCompleted',k)end end;s(k)end)end;net.Receive('srp.triumphs.Completed',function()if!cvar.GetValue('srp_triumpcompleted')then return end;local k=net.ReadTriumph()k:SetCompleted(os.time())srp.triumphs.ShowFlash(k)end)net.Receive('srp.triumphs.PartCompleted',function()if!cvar.GetValue('srp_triumphpartcompleted')then return end;local k=net.ReadTriumph()k:SetObjectiveCompleted(net.ReadString())srp.triumphs.GetTriumphProgress(k.id,function()srp.triumphs.ShowFlash(k)end)end)net.Receive('srp.triumphs.PartUpdated',function()if!cvar.GetValue('srp_triumphparts')then return end;srp.triumphs.ShowPartFlash(net.ReadTriumph(),net.ReadString(),net.ReadUInt(32),net.ReadUInt(32))end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/rakghoul/rakghoul_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/sparring/sparring_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/starmap/starmap_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/starmap/ui/starmap_list_ui.lua:
local a={}function a:Init()self:SetWide(300)self:SetBackgroundColor(col.midnight_light)self:AddPanel('ui_scrollpanel',function(b)end)end;function a:Populate(c)end;vgui.Register('srp_starmap_list',a,'srp_panel')
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/starmap/ui/starmap_view_ui.lua:
local a={}function a:Init()end;function a:Paint(b,c)end;vgui.Register('srp_starmap_view',a,'srp_panel')
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/events/ui/captureinfo_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/map/busmanager/busses_sh.lua:
srp.bus=srp.bus||{}nw.Register'bus.PathingEnter':Write(net.WriteTable):Read(net.ReadTable)nw.Register'bus.ride':Write(net.WriteEntity):Read(net.ReadEntity):SetLocalPlayer():SetHook'OnBusRideChanged'function PLAYER:GetBus()return self:GetNetVar'bus.ride'end;function PLAYER:SetBus(a)return self:SetNetVar('bus.ride',a)end
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/credits/general_sh.lua:
local a={'# is an epic gamer!','# has paid $2.50 to look cool in front of everyone','# is love # is life','Everyone tell # how cool they are','Winner winner chicken dinner! # bought an announcement!','# is as cool as a cucumber','# has spent $2.50 so I, the server, must inform you all that they are cool','# is the destroyer of sith','# loves starwars!','We love # <3'}srp.shop.Add('Announcement','announcement'):SetCat('General'):SetDesc('If you\'re bored and have $2.50 to blow, you may as well buy this and let the whole server know how cool you are.'):SetPrice(250):SetCooldown(3):SetImage(Material('materials/galactic/ui/menu/announcement.png','noclamp')):SetOnBuy(function(self,b)local c=string.gsub(a[math.random(#a)],'#',b:Name())RunConsoleCommand('ba','tellall',c)end)local d=500;local e=10;local f=250;local g=5;local h=5;local i=50;local function j(b,k)local l=b:GetUpgradeCount('perma_ammo')local m=b:GetUpgradeCount('perma_ammo250')local n=d*l+f*m;local o=e*l+g*m;local p=h*l+h*m;local q=i*m;if n>0 then if b:GetAmmoCount('ammo_blaster')<n then b:SetAmmo(n,'ammo_blaster')end end;if o>0 then if b:GetAmmoCount('ammo_e60r')<o then b:SetAmmo(o,'ammo_e60r')end;if b:GetAmmoCount('ammo_gl')<o then b:SetAmmo(o,'ammo_gl')end end;if p>0 then if b:GetAmmoCount('grenade')<p then b:SetAmmo(p,'grenade')end end;if q>0 then if b:GetAmmoCount('ammo_fuel')<q then b:SetAmmo(q,'ammo_fuel')end end end;srp.shop.Add('All Weapons','weapon_unlock'):SetCat('General'):SetDesc('All weapons and future weapons no longer require purchases with RC.'):SetImage(Material('materials/galactic/ui/blasted.png','noclamp ')):SetPrice(7000):SetStackable(false):SetHidden(false):SetNetworked(true)srp.shop.Add('Perma Ammo','perma_ammo'):SetCat('General'):SetDesc('You will always have at least 500 blaster ammo, 10 Rockets and 10 Grenade launcher rounds equipped when you spawn.\n\nYou can stack this!'):SetImage(Material('materials/galactic/ui/menu/bullets.png','noclamp ')):SetPrice(550):SetStackable(true):SetHidden(true):SetCanBuy(function(self,b)return false,'Sold out! :)'end):SetOnBuy(function(self,b)j(b)end):AddHook('PlayerUpgradesLoaded',function(b)j(b)end):AddHook('PlayerLoadout',function(b,r)if!r then j(b)end end)srp.shop.Add('Perma Ammo','perma_ammo250'):SetCat('General'):SetDesc('You will always have at least 250 blaster ammo, 5 Rockets and 5 Grenade launcher rounds equipped when you spawn.\nYou can stack this!'):SetImage(Material('materials/galactic/ui/menu/bullets.png','noclamp ')):SetPrice(550):SetStackable(true):SetOnBuy(function(self,b)j(b)end):AddHook('PlayerUpgradesLoaded',function(b)j(b)end):AddHook('PlayerLoadout',function(b,r)if!r then j(b)end end)local s={'SERVERTOKEN_VIP','SERVERTOKEN_CRAFTING','SERVERTOKEN_PACKAGE','SERVERTOKEN_PATROLS'}local t={'TOKEN_REDLIGHT','TOKEN_SPLEEF','TOKEN_MK','TOKEN_FAILSAFE','TOKEN_SAFELANDING'}local u=function(b)for v=1,5 do local k=s[math.random(1,#s)]b:AddInventoryItem(k,1,true)end end;local w=function(b)for v=1,5 do local k=t[math.random(1,#t)]b:AddInventoryItem(k,1,true)end end;srp.shop.Add('Summer Bundle','summer_bundle'):SetCat('Bundles'):SetNetworked(true):SetDisplayInit(function(self,x)x:FormatDisplayBox({'5x Event Tickets','5x Arena Tickets','Extra Character Slots','Summer Pheonix Pet Cosmetic','2x XP Boosters'},nil,nil,.25)end):SetDisplayPainter(function(self,x,y,z)draw.Box(0,10,y,z-20,col.red)surface.SetDrawColor(255,183,0,200)surface.DrawGradient(0,0,y,z-10)end):SetDesc([[
A generous summer gift.

2x XP boosters
Character slot unlock
5x Server Event Tickets
5x Random Arena Tickets
Pheonix pet cosmetic
	]]):SetImage(Material('materials/galactic/seasonal/summer/sun.png','noclamp')):SetPrice(1200):SetStackable(false):SetTimeStamps(1655730495,1725170802):SetOnBuy(function(self,b)return true end):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end)srp.shop.Add('July 4th Bundle 2024','summer2024_bundle'):SetCat('Bundles'):SetNetworked(true):SetDisplayInit(function(self,x)x:FormatDisplayBox({'3x Cosmetic Hats','Cosmetic Parrot','2x XP Boosters','5x Event Tickets','5x Arena Tickets'},nil,nil,.25)end):SetDisplayPainter(function(self,x,y,z)draw.Box(0,10,y,z-20,col.red)surface.SetDrawColor(222,70,32,200)surface.DrawGradient(0,0,y,z-10)end):SetDesc([[
A generous summer gift for 2024.

2x XP boosters
5x Server Event Tickets
5x Random Arena Tickets
3x Cosmetic Hats
1x Cosmetic Parrot Pet
	]]):SetImage(Material('materials/galactic/seasonal/summer/sun.png','noclamp')):SetPrice(1200):SetStackable(false):SetTimeStamps(1655730495,1725170802):SetGetPrice(function(self,b)return self.Price+(b:HasUpgrade('upgrd_firework_indep_2024')&&-750||0)+(b:IsVIPPlus()&&-350||0)end):SetOnBuy(function(self,b)return true end):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end)srp.shop.Add('New Years 2025','newyear25_bundle'):SetCat('Bundles'):SetNetworked(true):SetTimeStamps(1672185600,1738281600):SetDisplayInit(function(self,x)x:FormatDisplayBox({'2x Cosmetic Pets','5x Event Tickets','5x Arena Tickets','New Years Firework','2x XP Boosters','2x Battlepass XP Boosters','Animated Callingcard'},nil,nil,.25)end):SetDesc([[
A generous new years gift.

2x XP boosters (does not contribute to XP boost cost stack!)
2x Battlepass XP boosters (does not contribute to XP boost cost stack!)
5x Server Event Tickets
5x Random Arena Tickets.
1x 2025 Firework access.
2x Cosmetic pets
1x Animated calling card

Price is adjusted if you have the firework.
Price is adjusted for VIP+ members.
	]]):SetImage(Material('materials/galactic/ui/inventory/fireworks.png','noclamp')):SetPrice(1400):SetStackable(false):SetOnBuy(function(self,b)return true end):SetGetPrice(function(self,b)return self.Price+(b:HasUpgrade('upgrd_firework_newyear_2025')&&-750||0)+(b:IsVIPPlus()&&-350||0)end):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end)srp.shop.Add('New Years 2023','newyear23_bundle'):SetCat('Bundles'):SetNetworked(true):SetTimeStamps(1672185600,1738281600):SetDisplayInit(function(self,x)x:FormatDisplayBox({'5x Emotes','5x Event Tickets','5x Arena Tickets','New Years Firework','2x XP Boosters','2x Battlepass XP Boosters'},nil,nil,.25)end):SetDesc([[
A generous new years gift.

5x New Emotes
2x XP boosters (does not contribute to XP boost cost stack!)
2x Battlepass XP boosters (does not contribute to XP boost cost stack!)
5x Server Event Tickets
5x Random Arena Tickets.

Price is adjusted if you have the firework.
Price is adjusted for VIP+ members.
	]]):SetImage(Material('materials/galactic/ui/inventory/fireworks.png','noclamp')):SetPrice(1600):SetStackable(false):SetOnBuy(function(self,b)return true end):SetGetPrice(function(self,b)return self.Price+(b:HasUpgrade('upgrd_firework_newyear_2023')&&-750||0)+(b:IsVIPPlus()&&-350||0)end):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end)srp.shop.Add('New Years 2022','newyear22_bundle'):SetCat('Bundles'):SetNetworked(true):SetTimeStamps(1672185600,1738281600):SetDesc([[
A generous new years gift.

2x XP boosters (does not contribute to XP boost cost stack!)
2x Battlepass XP boosters (does not contribute to XP boost cost stack!)
Extra Character slots
5x Server Event Tickets
5x Random Arena Tickets.
12 Hour colodown reduction on the Present.

Price is adjusted if you have the firework.
	]]):SetImage(Material('materials/galactic/ui/inventory/fireworks.png','noclamp')):SetPrice(1400):SetStackable(false):SetOnBuy(function(self,b)return true end):SetGetPrice(function(self,b)return self.Price+(b:HasUpgrade('upgrd_firework_newyear_2022')&&-750||0)end):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end)srp.shop.Add('Easter Bundle','easter_bundle'):SetCat('Battlepass'):SetNetworked(true):SetDesc([[
Last years easter bundle for those who missed out.

1. 2x XP boosters
2. Character slot unlock
3. 50,000 RC
	]]):SetImage(Material('materials/galactic/seasonal/easter/eggs.png','noclamp')):SetPrice(1200):SetStackable(false):SetTimeStamps(1650150001,1713221940):SetOnBuy(function(self,b)return true end):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end)srp.shop.Add('Easter Bundle 2','easter_bundle2'):SetCat('Battlepass'):SetNetworked(true):SetDesc([[
A generous gift from The Rabbit.

1. 2x XP Boosters
2. 2x BP XP Boosters
3. 2x Slot Increase
4. 30,000 RC
5. Titles
	]]):SetImage(Material('materials/galactic/seasonal/easter/eggs.png','noclamp')):SetPrice(1200):SetStackable(false):SetTimeStamps(1650150001,1713221940):SetOnBuy(function(self,b)return true end):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end)srp.shop.Add('May 4th Bundle','bundle_may4th'):SetCat('Battlepass'):SetNetworked(true):SetDesc([[
May the force be with you.

1. 2x XP Boosters
2. 2x BP XP Boosters
3. 2x Slot Increase
4. 25,000 RC
5. May 4th firework
6. Starwars title font
7. May the 4th/force be with you title
	]]):SetImage(Material('materials/galactic/ui/currency.png','noclamp smooth')):SetPrice(900):SetStackable(false):SetTimeStamps(1650150001,1683543469):SetOnBuy(function(self,b)return true end):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end)srp.shop.Add('Valentine Bundle','valentine_bundle'):SetCat('Battlepass'):SetNetworked(true):SetDesc([[
The Love Bundle

1. 4x Icon Titles
2. 1x "Wholesome" title
3. 1x Pink "legendary" title
2. Gratitude Emote
3. 2x XP boosters
4. 50,000 RC
5. Firework
	]]):SetImage(Material('galactic/seasonal/valentines/heart.png','noclamp')):SetPrice(1350):SetStackable(false):SetTimeStamps(1676285522,1708559999):SetBackgroundColor(col.pink):SetGetPrice(function(self,b)return self.Price+(b:HasUpgrade('upgrd_firework_valentines_2023')&&-750||0)end):SetOnBuy(function(self,b)srp.shop.GetByUID('50k_rc'):OnBuy(b)return true end):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end)srp.shop.Add('Valentine Bundle 2','valentine_bundle2'):SetCat('Battlepass'):SetNetworked(true):SetDesc([[
1. Start a friendship at the Valentines Troll (XP/RC boost online with your friend.)
2. 2x XP boosters
3. 50,000 RC
4. 50,000 XP
4. 5 Event Tickets
5. 5 Store Event Tickets.

Note: Relationships will move to the HR droid after Valentines where you can always have a friendship!
	]]):SetImage(Material('galactic/seasonal/valentines/heart.png','noclamp')):SetPrice(1200):SetStackable(false):SetTimeStamps(1676285522,1708559999):SetBackgroundColor(col.pink):SetOnBuy(function(self,b)return true end):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end)srp.shop.Add('Media Access','media_access'):SetCat('General'):SetDesc([[
This gives you access to the Media Player across all characters.

Can only be used during defcon 6.
Please follow the rules on media players.
	]]):SetImage(Material('materials/galactic/ui/menu/media.png','noclamp')):SetPrice(500):SetNetworked(true,true):SetStackable(false):SetCanBuy(function(self,b)if b:IsVIPPlus()then return false,"This comes with VIP+! Nice!"else return true end end)srp.shop.Add('Boost Extender','boost_extender'):SetCat('General'):SetDesc([[
Instead of your XP boost resetting after 15 minutes of being offline it will now reset
after 8 hours.
	]]):SetImage(Material('materials/galactic/ui/menu/boostextender.png','noclamp')):SetNetworked(true):SetStackable(false):SetHidden(true):SetPrice(800):SetCanBuy(function(self,b)return false,'Sold out! :)'end)srp.shop.Add('Slot Boost','skill_weight'):SetCat('General'):SetDesc([[
This adds 4 slots to your inventory each time.
Price increases by $2 each time this is stacked.
	]]):SetImage(Material('materials/galactic/ui/menu/xpboost.png','noclamp')):SetNetworked(true):SetStackable(true):SetHidden(true):SetPrice(250):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end):SetOnBuy(function(self,b)if CLIENT then hook.Run("OnPurchaseXPBoost")end end):SetGetPrice(function(self,b)local A=0;if b:HasUpgrade(self:GetUID())then local B=b:HasUpgrade('easter_bundle2')&&-2||0;A=self.Price*(b:GetUpgradeCount(self:GetUID())+B)end;return self.Price+A end)srp.shop.Add('5% XP Boost','skill_bst_5'):SetCat('General'):SetDesc([[
An XP boost that stacks 5% each time

1. Gives you a 5% XP increase.
2. Applied after all other increases.
3. Applies to all characters
4. Cost increases by $2 every stack.
	]]):SetPrice(400):SetImage(Material('materials/galactic/ui/menu/xpboost.png','noclamp')):SetNetworked(true):SetStackable(true):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end):SetOnBuy(function(self,b)if CLIENT then hook.Run("OnPurchaseXPBoost")end end):SetGetPrice(function(self,b)local A=0;if b:HasUpgrade(self:GetUID())then local C=b:GetUpgradeCount('skill_bst_15')*3;local B=(b:HasUpgrade('easter_bundle')&&-2||0)+(b:HasUpgrade('easter_bundle2')&&-2||0)+(b:HasUpgrade('summer_bundle')&&-2||0)+(b:HasUpgrade('summer2024_bundle')&&-2||0)+(b:HasUpgrade('newyear22_bundle')&&-2||0)-C;A=self.Price*(b:GetUpgradeCount(self:GetUID())+B)*0.5 end;return self.Price+A end)srp.shop.Add('15% XP Boost','skill_bst_15'):SetCat('General'):SetDesc([[
An XP boost that stacks 15% each time

1. Gives you a 15% XP increase.
2. Applied after all other increases.
3. Applies to all characters
4. Cost increases by $2 every stack.
	]]):SetPrice(600):SetMinimumLTV(250,true):SetImage(Material('materials/galactic/ui/menu/xpboost.png','noclamp')):SetNetworked(true):SetStackable(true):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end):SetOnBuy(function(self,b)if CLIENT then hook.Run('OnPurchaseXPBoost')else local D=srp.shop.GetByUID('skill_bst_5'):GetID()srp.shop.AddUpgrade(b,D,true,nil,true)srp.shop.AddUpgrade(b,D,true,nil,true)srp.shop.AddUpgrade(b,D,true,nil,true)end end):SetGetPrice(function(self,b)local A=0;if b:HasUpgrade(self:GetUID())then A=200*b:GetUpgradeCount(self:GetUID())*0.5 end;return self.Price+A end)srp.shop.Add('Battlepass XP Boost','bp_boost_5'):SetCat('General'):SetDesc([[
An XP boost that stacks 5% each time for the battlepass.

Battlepass XP can be boosted up to 500xp with the normal XP boost and then
increased by 5% for every BP boost you have.

1. Applies to all characters
2. Cost increases by $2 every stack.
	]]):SetPrice(400):SetImage(Material('materials/galactic/ui/menu/xpboost.png','noclamp')):SetNetworked(true):SetStackable(true):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end):SetOnBuy(function(self,b)if CLIENT then hook.Run("OnPurchaseBPXPBoost")end end):SetGetPrice(function(self,b)local A=0;if b:HasUpgrade(self:GetUID())then local B=b:HasUpgrade('newyear22_bundle')&&-2||0;A=self.Price*(b:GetUpgradeCount(self:GetUID())+B)*0.5 end;return self.Price+A end)srp.shop.Add('5k RC','5k_rc'):SetCat('RC'):SetDesc('Adds 5k Republic Credits to your account'):SetPrice(500):SetImage(Material('materials/galactic/ui/menu/money-2.png','noclamp ')):SetOnBuy(function(self,b)b:AddMoney(5000,true)end):SetCanBuy(function(self,b)if b:IsIronMan()then return false,'You cannot buy cash on a ironman character!'else return b:CharacterID(),'You need to select a character!'end end)srp.shop.Add('15k RC','15k_rc'):SetCat('RC'):SetDesc('Adds 15,000 Republic Credits to your account'):SetImage(Material('materials/galactic/ui/menu/money-3.png','noclamp ')):SetPrice(1000):SetOnBuy(function(self,b)b:AddMoney(15000,true)end):SetCanBuy(function(self,b)if b:IsIronMan()then return false,'You cannot buy cash on a ironman character!'else return b:CharacterID(),'You need to select a character!'end end)srp.shop.Add('50k RC','50k_rc'):SetCat('RC'):SetDesc('Adds 50,000 Republic Credits to your account'):SetImage(Material('materials/galactic/ui/menu/money-4.png','noclamp ')):SetPrice(2000):SetOnBuy(function(self,b)b:AddMoney(50000,true)end):SetCanBuy(function(self,b)if b:IsIronMan()then return false,'You cannot buy cash on a ironman character!'else return b:CharacterID(),'You need to select a character!'end end)srp.shop.Add('150k RC','150k_rc'):SetCat('RC'):SetDesc('Adds 150,000 Republic Credits to your account'):SetImage(Material('materials/galactic/ui/menu/money-5.png','noclamp ')):SetPrice(3700):SetOnBuy(function(self,b)b:AddMoney(150000,true)end):SetCanBuy(function(self,b)if b:IsIronMan()then return false,'You cannot buy cash on a ironman character!'else return b:CharacterID(),'You need to select a character!'end end)srp.shop.Add('300k RC','300k_rc'):SetCat('RC'):SetDesc('Adds 300,000 Republic Credits to your account'):SetImage(Material('materials/galactic/ui/menu/money-5.png','noclamp ')):SetPrice(5500):SetOnBuy(function(self,b)b:AddMoney(300000,true)end):SetCanBuy(function(self,b)if b:IsIronMan()then return false,'You cannot buy cash on a ironman character!'else return b:CharacterID(),'You need to select a character!'end end)srp.shop.Add('500k RC','500k_rc'):SetCat('RC'):SetDesc('Adds 500,000 Republic Credits to your account'):SetImage(Material('materials/galactic/ui/menu/money-5.png','noclamp ')):SetPrice(6500):SetOnBuy(function(self,b)b:AddMoney(500000,true)end):SetCanBuy(function(self,b)if b:IsIronMan()then return false,'You cannot buy cash on a ironman character!'else return b:CharacterID(),'You need to select a character!'end end)srp.shop.Add('Character Slots','character_slots'):SetCat('Character'):SetDesc('An extra 3 character slots.'):SetImage(Material('materials/galactic/ui/menu/group.png','noclamp ')):SetPrice(300):SetStackable(true):SetNetworked(true):SetCanBuy(function(self,b)return b:GetUpgradeCount('character_slots')<3,'You can only stack this 3 times!'end)srp.shop.Add('Event Chars','event_character'):SetCat('Character'):SetDesc('Get access to play as an event character without the need to have VIP!\n\nThis will reduce the Perma VIP cost by 500 credits ($5)'):SetImage(Material('materials/galactic/ui/menu/player.png','noclamp ')):SetPrice(500):SetStackable(false):SetNetworked(true):SetCanBuy(function(self,b)if b:IsVIP()then return false,"You own VIP"else return true end end)srp.shop.Add('Pack Selection','iconic_pack_1'):SetCat('Character'):SetDesc([[
Ability to roleplay as any of these characters.
Selectable by the character creation menu.

1. C-3PO
2. R2-ASTROMECH
3. Wookiee
	]]):SetImage(Material('materials/galactic/ui/menu/models.png','noclamp ')):SetPrice(1500):SetNetworked(true):SetStackable(false):SetCanBuy(function(self,b)return!(b:HasUpgrade('iconic_wookiee')&&b:HasUpgrade('iconic_astromech')&&b:HasUpgrade('iconic_c3po')),'You own one of these items!'end)srp.shop.Add('Wookiee','iconic_wookiee'):SetCat('Character'):SetDesc([[
		Ability to roleplay as a wookie with a Bowcaster.
		Selectable by the character creation menu.
	]]):SetImage(Material('materials/galactic/ui/menu/monkey.png','noclamp ')):SetPrice(540):SetNetworked(true):SetStackable(false):SetCanBuy(function(self,b)return!b:HasUpgrade('iconic_pack_1'),"You own Iconic Pack #1"end)srp.shop.Add('R2-Astromech','iconic_astromech'):SetCat('Character'):SetDesc([[
Ability to roleplay as a R2-Astromech.
Selectable by the character creation menu.
	]]):SetImage(Material('materials/galactic/ui/menu/astromech.png','noclamp ')):SetPrice(540):SetNetworked(true):SetStackable(false):SetCanBuy(function(self,b)return!b:HasUpgrade('iconic_pack_1'),"You own Iconic Pack #1"end)srp.shop.Add('C-3PO','iconic_c3po'):SetCat('Character'):SetDesc([[
Ability to roleplay as a C-3PO.
Selectable by the character creation menu.
	]]):SetImage(Material('materials/galactic/ui/c3po.png','noclamp ')):SetPrice(540):SetNetworked(true):SetStackable(false):SetCanBuy(function(self,b)return!b:HasUpgrade('iconic_pack_1'),"You own Iconic Pack #1"end)srp.shop.Add('Bipedal Droid','bipedal_droids'):SetCat('Character'):SetDesc([[
Ability to roleplay as a bipdel droid.
Selectable by the character creation menu.
These are combat droids and can join battalions.

Has the option in the cosmetic menu to change the droids colour.
	]]):SetImage(Material('materials/galactic/ui/menu/droid.png','noclamp ')):SetPrice(1000):SetNetworked(true):SetStackable(false)srp.shop.Add('Younglings','character_pack_4'):SetCat('Character'):SetDesc([[
Younglings that are selected in the character menu.
They require VIP to use.

1. Jedi Youngling Male
2. Jedi Youngling Female

Will be able to rank up in the future.
	]]):SetImage(Material('materials/galactic/ui/menu/stick.png','noclamp ')):SetPrice(1000):SetNetworked(true):SetStackable(false):SetCanBuy(function(self,b)return b:IsVIP(),'You need VIP to buy this.'end)local E=[[
- Rank across all of our CWRP servers
- Scoreboard icon & chatbox emotes
- 50% XP and salary boost
- Four extra character slots (default is 2, you get 6)
- Special groups in events
- Access to Jedi and Jedi rank progression
- +50 character chatbox limit
]]local F=[[
- This amplifies your VIP or staff rank.
- A colored VIP icon on the scoreboard to show how pretty you are
- XP boost increased to 75%
- Salary bonus increased to 100%
- Three Extra character slots
- Youtube Player access in the OOC lounge
- +100 character chatbox limit
- 10% off any battlepass.
]]srp.shop.Add('30 Day VIP','trial_vip'):SetCat('Ranks'):SetDesc(E):SetPrice(550):SetImage(Material('materials/galactic/ui/menu/vip-perma.png','noclamp')):SetImageColor(col.yellow):SetCanBuy(function(self,b)if b:IsVIP()then return false,'You\'re already VIP or higher!'end;return true end):SetOnBuy(function(self,b)RunConsoleCommand('ba','setgroup',b:SteamID(),'vip','30d','user')end)srp.shop.Add('Perma VIP','vip'):SetCat('Ranks'):SetDesc(E):SetPrice(1500):SetImage(Material('materials/galactic/ui/menu/vip-30d.png','noclamp')):SetImageColor(col.yellow):SetStackable(false):SetNetworked(true):SetCanBuy(function(self,b)if b:IsVIP()then return false,'You\'re already VIP or higher!'end;return true end):SetOnBuy(function(self,b)RunConsoleCommand('ba','setgroup',b:SteamID(),'vip')end):SetGetPrice(function(self,b)return self.Price-(b:HasUpgrade('event_character')&&500||0)end)srp.shop.Add('Perma VIP+','vip_plus'):SetCat('Ranks'):SetDesc(F):SetPrice(800):SetImage(Material('materials/galactic/ui/menu/vip-perma.png','noclamp')):SetImageColor(col.yellow):SetNetworked(true):SetStackable(false):SetCanBuy(function(self,b)local G=b:GetBVar('expire_time')==0;local H=b:GetBVar('expire_rank')==2;if b:HasUpgrade(self:GetUID())then return false,'You are already VIP+!'elseif b:HasUpgrade('vip')then return true elseif G&&b:IsVIP()then return true elseif H then return true else return false,'You need Permanent VIP!'end end):SetGetPrice(function(self,b)return self.Price-(b:HasUpgrade('media_access')&&300||0)end)srp.shop.Add('30d Moderator','trial_mod'):SetCat('Ranks'):SetDesc([[
- 30 days of moderator across our CWRP servers
- Moderator Forum Rank
- VIP Benefits for the duration of moderator
- +100 character chatbox limit

WARNING: Abuse or inactivity will have your rank revoked!
	]]):SetPrice(2500):SetImage(Material('materials/galactic/ui/menu/mod-30d.png','noclamp')):SetImageColor(col.blue_light):SetCanBuy(function(self,b)if b:IsAdmin()&&b:GetRank()!='moderator'then return false,'You do not need this!'elseif b:GetPlayTime()<36000 then return false,'You need 10 hours play time to purchase moderator!'end;return true end):SetOnBuy(function(self,b)local I=30*86400;local J=math.max(b:GetRank()=='moderator'&&b:GetBVar('expire_time')||os.time(),os.time())ba.data.SetRank(b,'moderator','vip',J+I)end)srp.shop.Add('60d Moderator','trial_mod_60d'):SetCat('Ranks'):SetDesc([[
- 60 days of moderator across our CWRP servers
- Moderator Forum Rank
- VIP Benefits for the duration of moderator
- +100 character chatbox limit

WARNING: Abuse or inactivity will have your rank revoked!
	]]):SetPrice(3500):SetImage(Material('materials/galactic/ui/menu/mod-60d.png','noclamp ')):SetImageColor(col.blue_light):SetCanBuy(function(self,b)if b:IsAdmin()&&b:GetRank()!='moderator'then return false,'You do not need this!'elseif b:GetPlayTime()<36000 then return false,'You need 10 hours play time to purchase moderator!'end;return true end):SetOnBuy(function(self,b)local I=60*86400;local J=math.max(b:GetRank()=='moderator'&&b:GetBVar('expire_time')||os.time(),os.time())ba.data.SetRank(b,'moderator','vip',J+I)end)srp.shop.Add('500k RC','500k_rc'):SetCat('RC'):SetDesc('Adds 500,000 Republic Credits to your account.'):SetImage(Material('materials/galactic/ui/menu/money-5.png','noclamp ')):SetPrice(6000):SetMinimumLTV(200,true):SetOnBuy(function(self,b)b:AddMoney(500000,true)end):SetCanBuy(function(self,b)return b:CharacterID(),'You need to select a character!'end)srp.shop.Add('Store Event Tickets x5','storeevents_random'):SetCat('Events'):SetDesc('Receive 5 random store events.'):SetPrice(1200):SetImage(Material('materials/galactic/ui/inventory/security.png','noclamp ')):SetStackable(true):SetOnBuy(function(K,b)u(b)end)srp.shop.Add('Arena Tickets x5','arenatickets_random'):SetCat('Events'):SetDesc('Receive 5 random arena tickets.'):SetPrice(1200):SetImage(Material('materials/galactic/ui/inventory/security.png','noclamp ')):SetStackable(true):SetOnBuy(function(K,b)w(b)end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/events/spleef_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/hud/locations_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/maps_sh.lua:
srp.map.AddMaps({rp_anaxes={name='Anaxes',wsid=1829795551,main=true},rp_monsglacia_crimson={name='Monsglacia Crimson',wsid=1790624702,main=true},gm_cruisercanyon={name='Cruiser canyon',wsid=1855964806},gm_arid_valley_v1={name='Arid Valley v1',restricted=false},gm_atomic={name='Atomic',restricted=false},gm_bay={name='Bay',wsid=104484764,restricted=false},gm_bigcity={name='Big City',restricted=false},gm_bigisland={name='Big Island',restricted=false},c17_outside={name='C17 Outside',restricted=false},cityruins={name='City Ruins',restricted=false},gm_flatgrass={name='Flatgrass'},gm_construct={name='Construct'},gm_construct_extended={name='Construct Extended',wsid=509873419,restricted=false},rp_coastalimprobable={name='Coastal Improbable',wsid=940717528,restricted=false},endor={name='Endor',restricted=false},geonosis={name='Geonosis',restricted=false},kashyyyk={name='Kashyyyk',restricted=false},gm_lair={name='Lair',restricted=false},mustafar={name='Mustafar',restricted=false},gm_valley={name='Valley',restricted=false},rp_city17_build210={name='City 17',restricted=false},rp_naboo_city_v2_3={name='Naboo City V2',restricted=false,wsid=225115060,main=true},rp_tatooine_dunesea_v1={name='Tatooine Dunesea v1',restricted=false},rp_liberator_sup_b8at={name='Liberator',restricted=false,main=true,core=true},rp_dantooine_united_v1={name='Dantooine United V1',main=true,core=true,restricted=false,wsid=2929627396},rp_kamino_extensive={name='Kamino',wsid=774517123,restricted=false},dm_hydro={name='Hyrdo',restricted=false},event_christophsis_tgc={name='Christophsis',restricted=false},gm_diprip_dam={name='Diprip Dam',restricted=false},gm_emp_coast={name='Emp Coast',restricted=false},gm_emp_glycencity={name='Emp Glycencity',restricted=false},gm_lunarbase={name='Lunar Base',restricted=false},gm_range_e8={name='Range e8',restricted=false},gm_range_f4={name='Range F4',restricted=false},gm_range_f4_night={name='Range F4 Night',restricted=false},gm_uldum2={name='Uldun 2',restricted=false},gm_wastes={name='Wastes',restricted=false},rp_gozanti_freighter={name='Gozanti Freighter',restricted=false},rp_kashyyyk_jungle_b2={name='Kashyyyk Jungle B2',restricted=false},rp_nar_shaddaa_v3={name='Nar Shaddaa v3',restricted=false},rp_rishimoon_crimson_s={name='Rishimoon Crimson',restricted=false},rp_vanqor_v1={name='Vanqor V1',restricted=false},event_fortified={name='Fortified',wsid=738569030,restricted=false},gm_dddustbowl2={name='Dust Bowl 2',wsid=108093685,restricted=false},gm_fork={name='Fork',wsid=326332456,restricted=false,nonav=true},gm_medievalsiege={name='Medieval Siege',wsid=1245300884,restricted=false},gm_mountainlake2={name='Mountain Lake v2',wsid=349856780,restricted=false},gm_ninfield_v2exp={name='Nin Field v2',wsid=505151457,restricted=false},gm_spoon={name='Spoon',wsid=941407499,restricted=false},rp_fs_coast_07_003_pak={name='FS Coast',wsid=144137567,restricted=false},rp_locality={name='FS Coast 2017',wsid=199758059,restricted=false},rp_ryloth={name='Ryloth',wsid=1270291592,restricted=false},rp_coruscantbelow={name='Coruscant Below',wsid=2114506770,restricted=false,main=true},rp_coruscant_underworld={name='Coruscant Underworld',wsid={1122367733,1122339596,1233871118},restricted=false},rp_venator_extensive_v1_4={name='Venator Extensive',wsid=1257128301,restricted=false},gm_dddustbowl2={name='Dust Bowl',wsid=108093685,restricted=false},toth_forgotten={name='Thoth Forgotten',wsid=788972940,restricted=false},gm_balkans={name='Balkans',wsid=1307357127,restricted=false},gm_balkans_snow={name='Balkans Snow',wsid=1412360702,restricted=false},gm_bay={name='Bay',wsid=104484764,restricted=false},gm_blackmesasigma_night={name='Blackmesa Sigma Night',wsid=104482189,restricted=false},gm_coolsnow={name='Coolsnow',wsid=200098715,restricted=false},gm_emp_chain={name='EMP Chain',wsid=613046581,restricted=false},gm_emp_commandergrad={name='EMP Commandergrad',wsid=752039564,restricted=false},gm_emp_downfall={name='EMP Downfall',wsid=752044799,restricted=false},gm_emp_flat={name='EMP Flat',wsid=752298944,restricted=false},gm_emp_mesa={name='EMP Mesa',wsid=752552314,restricted=false},gm_emp_midbridge={name='EMP Mid-Bridge',wsid=613062694,restricted=false},gm_emp_palmbay={name='EMP Palm Bay',wsid=613064894,restricted=false},gm_emp_streetsoffire={name='EMP Street of Fire',wsid=613069064,restricted=false},gm_forest_arctic={name='Forest Arctic',wsid=1534857243,restricted=false},gm_forest_tropical={name='Forest Tropical',wsid=1441149304,restricted=false},gm_marsh={name='GM Marsh',wsid=878761545,restricted=false},gm_vyten={name='Vyten',wsid=1449731878,restricted=false},rhen_var={name='Rhen Var',wsid=1412913974,restricted=false},rp_monsilva_crimson={name='Monsilva Crimson',wsid=1346612100,restricted=false},rp_research_crimson={name='Research Crimson',wsid=1172493467,restricted=false},rp_yuka_kr={name='Yuka KR',wsid=1423019928,restricted=false},mor_surface_v3={name='Mor Surface V3',wsid=528120516,restricted=false},gm_usborder={name='US Border',wsid=897081595,restricted=false},event_umbarahillbase_haz={name='Umbara Hill base',wsid=1586549506,restricted=false},event_umbararidge_haz={name='Umbara Ridge',wsid=1586549506,restricted=false},rp_avalon_desert_day={name='Avalon Desert Day',wsid=440474486,restricted=false},rp_avalon_desert_night={name='Avalon Desert Night',wsid=440474486,restricted=false},rp_avalon_desert_space={name='Avalon Desert Space',wsid=440474486,restricted=false},cityruins2={name='City Ruins V2',wsid=266180263,restricted=false},gm_battleofconcord={name='Battle of Concord',wsid=1793260162,restricted=false},rp_deadcity={name='Dead City',wsid=1864156937,restricted=false},gm_arid_valley_v2_day={name='Arid Valley v2 Day',wsid=510346779,restricted=false},gm_arid_valley_v2_night={name='Arid Valley v2 Night',wsid=510347812,restricted=false},gm_blackmesa_sigma={name='Blackmesa Sigma',wsid=104483047,restricted=false},gm_boreas_s={name='Boreas',wsid=1572373847,restricted=false},gm_canals_03={name='Canals 03',wsid=1707566777,restricted=false},gm_emp_arid={name='Emp Arid',wsid=613039682,restricted=false},gm_emp_bush={name='Emp Bush',wsid=613041835,restricted=false},gm_emp_crossroads={name='Emp Crossroads',wsid=613050025,restricted=false},gm_emp_cyclopean={name='Emp Cyclopean',wsid=613051969,restricted=false},gm_emp_escort={name='Emp Escort',wsid=613054910,restricted=false},gm_emp_isle={name='Emp Isle',wsid=613059763,restricted=false},gm_emp_mvalley2={name='Emp Valley2',wsid=613063827,restricted=false},gm_geonosis_plains_b2={name='Geonosis Plains b2',wsid=109800824,restricted=false},gm_invakeep={name='Invakeep',wsid=1721531436,restricted=false},gm_megadesertv3={name='Mega Desert v3',wsid=407488414,restricted=false},gm_sevenseas={name='GM Seven Seas',wsid=1809454081,restricted=false},ec_harrower_v1={name='Harrower V1',wsid=805999944,restricted=false},mygeeto={name='Mygeeto',wsid=1405080787,restricted=false},naboo={name='Naboo',wsid=576353911,restricted=false},rp_betaworkshl2={name='Betaworks HL2',wsid=1121801379,restricted=false},rp_mercenary={name='Mercenary',wsid=1683178139,restricted=false},rp_mos_mesric_v2={name='Mos Mesric v2',wsid=614696420,restricted=false},rp_scifi={name='Sci-Fi Map',wsid=670961247,restricted=false},gm_baik_stalingrad={name='Stalingrad (Baik)',wsid=522630489,restricted=false},gm_baik_tatooine={name='Tatooine (Baik)',wsid=563731859,restricted=false},rp_generators={name='Generators',wsid=2299825726,restricted=false},felucia_5={name='Felucia 5',wsid=1715656251,restricted=false},gm_bigbridge_night={name='Big Bridge Night',wsid=2193864156,restricted=false},gm_bigcity_improved={name='Big City Improved',wsid=815782148,restricted=false},gm_blackwoods2={name='Blackwoods 2',wsid=2147185063,restricted=false},gm_dddustbowl2night={name='DD Dust Bowl 2 night',wsid=108101584,restricted=false},gm_diprip_city={name='Diprip City',wsid=613009152,restricted=false},gm_diprip_refinery={name='Diprip Refinery',wsid=613030275,restricted=false},gm_diprip_supermarket={name='Diprip Supermarket',wsid=613074437,restricted=false},gm_diprip_village={name='Diprip Village',wsid=613037740,restricted=false},gm_emp_duststorm={name='EMP Duststorm',wsid=613053117,restricted=false},gm_emp_forest={name='EMP Forest',wsid=752303212,restricted=false},gm_emp_glycenplains={name='EMP Glycenplains',wsid=752547425,restricted=false},gm_emp_manticore={name='EMP Manticore',wsid=752550512,restricted=false},gm_emp_slaughtered={name='EMP Slaughtered',wsid=613067448,restricted=false},gm_emp_snowstorm={name='EMP Snowstorm',wsid=752555229,restricted=false},gm_emp_urbanchaos={name='EMP Urban Chaos',wsid=613071062,restricted=false},gm_geonosian_droidfacility={name='Geonosian Droid Facility',wsid=2173050449,restricted=false},gm_goldencity={name='Golden City',wsid=1403089746,restricted=false},gm_kashyyyk_slavercamp={name='Kashyyyk Slaver Camp',wsid=2222910384,restricted=false},gm_longestbridge={name='Longest Bridge',wsid=165351734,restricted=false},gm_nostromo={name='Nostromo',wsid=2100307792,restricted=false},gm_shady_forest={name='Shady Forest',wsid=2218629970,restricted=false},gm_warmap_v5={name='Warmap v5',wsid=105630061,restricted=false},gm_warmap_v5_night={name='Warmap v5 Night',wsid=106452374,restricted=false},gm_warmap_v5_snow={name='Warmap v5 Snow',wsid=105960495,restricted=false},mor_alphastation_b4_re={name='Mor Alphastation B4',wsid=105960495,restricted=false},mor_facility_b2_re={name='Mor Facility B2',wsid=187892524,restricted=false},mor_facility_cv1={name='Mor Facility CV1',wsid=562589737,restricted=false},mor_outpostnorth32_a5_fixed={name='Mor Outpost North 32 A5',wsid=2182734625,restricted=false},ow_breach_final={name='OW Breach Final',wsid=1790144708,restricted=false},rp_anaxes_kaktusownia={name='Anaxes Kaktusownia',wsid=2360006866,restricted=false,main=true},rp_arquitens_class={name='Arquitens Class',wsid=2350995208,restricted=false},rp_arquitens_v2={name='Arquitens V2',wsid=2212995894,restricted=false},rp_city8_district9={name='City 8 District 9',wsid=132916875,restricted=false},rp_cscdesert_edit2={name='CSC Desert 2',wsid=2156135292,restricted=false},rp_imp_rhen_var={name='Imperial Rhen Var',wsid=2350723886,restricted=false},rp_junglestorm={name='Jungle Storm',wsid=949224045,restricted=false},rp_kamino_standalone={name='Kamino Standalone',wsid=901224962,restricted=false},rp_radar={name='Radar',wsid=1458627591,restricted=false},rp_residential={name='Residential',wsid=2147044243,restricted=false},rp_residential_2={name='Residential 2',wsid=2232368085,restricted=false},rp_train_corellia={name='Train Corellia',wsid=1895555352,restricted=false},rp_wasteland={name='Wasteland',wsid=554556189,restricted=false},rp_yantar={name='Yantar',wsid=1858789063,restricted=false},ubasev10={name='U-Base v10',wsid=216416746,restricted=false},gm_ubasev4={name='Ubase v4',wsid=216416746,restricted=false},gm_cessation={name='Cessation',wsid=2570145358,restricted=false},gm_espa={name='Espa',wsid=2496877340,restricted=false},gm_farside={name='Farside',wsid=2570192418,restricted=false},gm_forestrally2={name='Forest Rally 2',wsid=2565360097,restricted=false},gm_only_forest={name='Only Forest',wsid=2550321794,restricted=false},gm_quarantine={name='Quarantine',wsid=2380009030,restricted=false},gm_rhine={name='Rhine',wsid=1289646999,restricted=false},rp_darkscape={name='Darkscape',wsid=2272131829,restricted=false},rp_geonosis={name='Geonosis',wsid=2584305819,restricted=false},rp_spruceton={name='Spruceton',wsid=2423998041,restricted=false},rp_lr_refuge_v1={name='Metro Refuge v1',wsid=337486491,restricted=false},gm_asteroidfield={name='Asteroid Field',wsid=2255586125,restricted=false},rp_jupiter_underground={name='Jupiter Underground',wsid=2381557019,restricted=false},gm_towncomplete={name='Town Complete',wsid=2401394644,restricted=false},ocean_at_rest={name='Ocean at Rest',wsid=2432293395,restricted=false},gm_contrast_2={name='Contrast 2',wsid=2466651013,restricted=false},gm_geonosian_canyons={name='Geonosian Canyons',wsid=2507630538,restricted=false},gm_towncomplete_prewar={name='Town Complete - Prewar',wsid=2517882908,restricted=false},gm_only_forest_night={name='Only Forest Night',wsid=2552761124,restricted=false},gm_badlands={name='Badlands',wsid=2553337948,restricted=false},ntx_cairostation={name='Cairo Station',wsid=2582506076,restricted=false},gm_urbanhell={name='Urban Hell',wsid=2591145493,restricted=false},gm_arctic_dig={name='Arctic Dig',wsid=2593647611,restricted=false},gm_neon_bigcity={name='Neon Bigcity',wsid=2607262101,restricted=false},rp_city17transitblock_prewar_v3={name='City17 Transitblock - Prewar',wsid=2607269704,restricted=false},sl_avanpost5={name='Avan Post 5',wsid=2629687036,restricted=false},gm_russia={name='Russia',wsid=2634728857,restricted=false},gm_vault={name='Vault',wsid=2668557938,restricted=false},rp_pripyat_shoc={name='Pripyat',wsid=2686701691,restricted=false},rp_podkhod={name='Podkhod',wsid=2696602988,restricted=false},gm_frame={name='Frame',wsid=2698930782,restricted=false},gm_bitterbrookwoods={name='Bitterbrook Woods',wsid=2701195340,restricted=false},rp_sector_16_v9={name='Sector 16 v9',wsid=2730604582,restricted=false},gm_eliden_hmcd={name='Eliden Hmcd',wsid=2749910792,restricted=false},gm_trainride_v1={name='Train Ride v1',wsid=2753502531,restricted=false},gm_trainride_v1_day={name='Train Ride Day v1',wsid=2753502531,restricted=false},gm_smog_city={name='Smog City',wsid=2760823156,restricted=false},gm_vertigo_full={name='Vertigo',wsid=2206563101,restricted=false},rp_industrial17_destroyed={name='Industrial 17 Destroyed',wsid=2220206773,restricted=false},rp_recusant_ag={name='Recusant AG',wsid=2813974082,restricted=false},["gm_goldencity_blackout"]={name="gm_goldencity_blackout",wsid=1937872055},["gm_goldencity_blackout_nocubemap"]={name="gm_goldencity_blackout",wsid=1937872055},["gm_coast_nlo_prewar_v2"]={name="Coast NLO Pre-war",wsid=2667508344},["rp_junglestorm_v2"]={name="Junglestorm - V2",wsid=2692719419},["mor_arcturus"]={name="mor_arcturus",wsid=2891642178},["hmcd_govnova"]={name="Eliden Homicide | gm_eliden_hmcd",wsid=2749910792},["gm_hightechcity"]={name="High Tech City",wsid=2856036399},["gm_hightechcity_night"]={name="High Tech City (Night)",wsid=2874787742},["gm_fichina"]={name="gm_fichina",wsid=2018210359},["rp_salvation_2_stalker_snow"]={name="rp_salvation_2_stalker_snow",wsid=132901080},["rp_desert_conflict"]={name="rp_Desert_Conflict",wsid=1957556944},["rp_golanplaneta"]={name="Golan Space Station",wsid=2623045414},["gm_abandonedbunker"]={name="Abandoned Bunker",wsid=2813050830},["cc_ancient"]={name="cc_ancient",wsid=2899794596},["zs_vector_v2"]={name="zs_vector_v2",wsid=1928679934},["gm_retreat"]={name="gm_retreat - Arctic Map",wsid=2374716535},["gm_npcarena35"]={name="NPC Arena 3.5",wsid=1845308503},["rp_redforest"]={name="Red Forest (Clear Sky)",wsid=1801953390},["gm_grasslab"]={name="gm_grasslab",wsid=2396049351},["gm_grasslab_night"]={name="gm_grasslab_night",wsid=2405009063},["gm_thesummoner"]={name="The Summoner",wsid=2829138126},["gm_outpost_omega"]={name="Outpost Omega",wsid=2081068194},["gm_chernobylmeltdown_v1"]={name="INSIDE CHERNOBYL",wsid=1911686547},["rp_industrial17_destroyed"]={name="rp_industrial17_destroyed",wsid=2220206773},["gm_flatsand"]={name="Flatsand",wsid=1707243677},["gm_vertigo_full"]={name="Vertigo [Half-Life 2 Beta]",wsid=2206563101},["borealis_sinkable"]={name="Borealis (SINKABLE)",wsid=2137991799},["gm_borealis_full"]={name="Borealis [Half-Life 2 Beta]",wsid=2169049801},["gm_revmoon2"]={name="gm_revmoon2",wsid=126373432},["gm_bombingfacility"]={name="gm_bombingfacility",wsid=2290496206},["ttt_glacier"]={name="ttt_glacier",wsid=228041314},["gm_vind_rocheste"]={name="Rocheste [Vindictus]",wsid=764767697},["01h"]={name="Vindictus maps - part 4",wsid=274282092},["01i"]={name="Vindictus maps - part 4",wsid=274282092},["01k"]={name="Vindictus maps - part 4",wsid=274282092},["01l"]={name="Vindictus maps - part 4",wsid=274282092},["12c"]={name="Vindictus Heide maps - part 3",wsid=274292648},["01a"]={name="Vindictus maps - part 2",wsid=274346638},["01b"]={name="Vindictus maps - part 2",wsid=274346638},["01c"]={name="Vindictus maps - part 2",wsid=274346638},["ttt_shadowmoses"]={name="ttt_shadowmoses",wsid=975437544},["rp_baserg_haz_v3"]={name="Tropical Jungle Military Base",wsid=1556040063},["rp_forest_canyon"]={name="Forest Canyon",wsid=2034593720},["gm_fort_wars"]={name="gm_fort_wars",wsid=2925585624},["rp_deadcairo"]={name="Halo - Dead Cairo Space Station",wsid=1090044630},["gm_frostbase"]={name="gm_frostbase",wsid=1789547747},["zs_arctic_cave"]={name="zs_arctic_cave",wsid=431856764},["zs_cave_shanty_b3"]={name="ZS Cave Shanty",wsid=1613141542},["gm_abyssalplain"]={name="Gm_AbyssalPlain",wsid=2819207400},["gm_arid_mesa"]={name="Gm_Arid_Mesa",wsid=144936535},["gm_arid_mesa_night"]={name="GM Arid Mesa Night",wsid=148147085},["rp_city8"]={name="City 8",wsid=132913036},["rp_city8_canals"]={name="City 8 Canals",wsid=132911524},["rp_city8_v2"]={name="City8 v2",wsid=637382960},["rp_city8_2_hl2_e"]={name="City 82",wsid=641738653},["rp_nova_prospekt_caretion_v1b"]={name="Nova Pospekt Caretion",wsid=1208305908},["rp_felucia_un"]={name="Felucia",wsid=2921582275},["haj_sturm"]={name="Operation Storm",wsid=1345035765},["haj_gold"]={name="Operation Gold",wsid=1344295879},["haj_archery"]={name="Operation Archery",wsid=1345015759},["gm_floatingworlds_ii_night"]={name="gm_Floatingworlds_2_Night",wsid=104487702},["gm_floatingworlds_ii"]={name="gm_Floatingworlds_2",wsid=104486484},["gm_island"]={name="gm_Island",wsid=734885989},["gm_lorn"]={name="gm_lorn",wsid=2092470771},["mars_valley"]={name="Mars Valley",wsid=2494464463},["gm_russian_outpost_v2"]={name="Russian Outpost",wsid=2911484351},["rp_oldworld_fix"]={name="Oldworld Fix",wsid=731720128},["gm_bunker1970"]={name="Bunker",wsid=2731328424},["gms_coastal_outlands"]={name="Coastal Outlands",wsid=146610619},["ttt_deepsea"]={name="Deepsea",wsid=2068390190},["gm_born"]={name="Born",wsid=2936813669},["ons-arcticstronghold"]={name="ONS-ArcticStronghold",wsid=2938975810},["gm_2004_vente"]={name="Vente 2004 | Sandbox Map",wsid=2897918571},["tm_forgeworld"]={name="Forgeworld",wsid=2897288501},["rp_geonosis_v2"]={name="Geonosis",wsid=2934989538},["rp_toydariaun"]={name="Toydaria",wsid=2841462972},["gm_dailcore"]={name="Dailcore",wsid=3016484254},["gm_forgottenisland"]={name="Forgotten Island",wsid=3015012733},["gm_hoodcorner_extended"]={name="Hoodcorner Extended",wsid=3016061508},["gm_nexus"]={name="Nexus",wsid=2993529126},["gm_vacant_industry"]={name="Vacant Industry",wsid=2985579279},["rp_rudmerge_day"]={name="Rudmerge Day",wsid=2994310934},["gm_stormwald"]={name="Stormwald",wsid=2983690708},["gm_pile"]={name="Pile",wsid=2974682769}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/doors/coruscant_below_sh.lua:
if CLIENT then local a={}local b=surface.GetTextureID("gui/gradient_down")local c=surface.GetTextureID("gui/gradient_up")srp.doors.AddDrawPanel('corbelow_doubleplazadoor_right',function(d)local e,f;local g=d:GetDoorButtonPos()if g then e=g+Vector(-6,0,25)f=d:LocalToWorldAngles(Angle(180,180,-90))else local h=d:OBBCenter()e=d:LocalToWorld(h+Vector(0,5,15))f=d:LocalToWorldAngles(Angle(180,0,-90))end;return true,e,f end,function(d,i)srp.doors.DrawDefault(d,i,TEXT_ALIGN_LEFT)end)srp.doors.AddDrawPanel('corbelow_doubleplazadoor',function(d)local e,f;local g=d:GetDoorButtonPos()if g then e=g+Vector(-6,0,25)f=d:LocalToWorldAngles(Angle(180,0,-90))else local h=d:OBBCenter()e=d:LocalToWorld(h+Vector(0,5,15))f=d:LocalToWorldAngles(Angle(180,0,-90))end;return true,e,f end,function(d,i)srp.doors.DrawDefault(d,i,TEXT_ALIGN_RIGHT)end)srp.doors.AddDrawPanel('corbelow_plazaclub',function(d)return true,Vector(10915,4567,425),Angle(0,-90,90)end,function(d,i,j,k)local l=d:GetPropertyColor()l.a=i;srp.doors.color_green.a=srp.doors.color_green.a-50;local m={}m.texture=c;m.color=srp.doors.color_green;m.x=-1500;m.y=1050;m.w=3000;m.h=500;draw.TexturedQuad(m)m.texture=b;m.y=-250;draw.TexturedQuad(m)k=600;if d:GetPropertyName()!=nil then srp.doors.DrawText(d:GetPropertyName(),l,TEXT_ALIGN_CENTER,'ui_header.xxl',-30)end;local n=d:GetDoorOwner()if!IsValid(n)then srp.doors.DrawText('BUSINESS FOR SALE',srp.doors.color_green,TEXT_ALIGN_CENTER,'ui_header.xl')else srp.doors.DrawText(n:GetTag()..' '..n:Name(),srp.doors.color_green,TEXT_ALIGN_CENTER,'ui_header.xl')end end)srp.doors.AddDrawPanel('terminal_entrance',function(d)return true,Vector(150,-4270,190),Angle(0,90,90)end,function(d,i)local l=d:GetPropertyColor()l.a=i;local m={}m.texture=b;m.color=Color(255,0,0,50+i)m.x=-1500;m.y=-200;m.w=3000;m.h=1200;draw.TexturedQuad(m)if d:GetPropertyName()!=nil then srp.doors.DrawText(d:GetPropertyName(),l,TEXT_ALIGN_CENTER,'ui_header.xxxl',-25)srp.doors.DrawText('See you soon...',srp.doors.color_green,TEXT_ALIGN_CENTER,'ui_header.xl')end end)srp.doors.AddDrawPanel('corbelow_plazabar_exitplaza',function(d)return true,Vector(9223,2140,40),Angle(0,180,90)end,function(d,i)local l=d:GetPropertyColor()l.a=i;local m={}m.texture=c;m.color=srp.doors.color_blue;m.x=-1500;m.y=350;m.w=3000;m.h=800;draw.TexturedQuad(m)m.texture=b;m.y=1500;m.y=-1000;draw.TexturedQuad(m)if d:GetPropertyName()!=nil then srp.doors.DrawText(d:GetPropertyName(),l,TEXT_ALIGN_CENTER,'ui_header.xxl',0)end;srp.doors.DrawText('PUBLIC PROPERTY',srp.doors.color_blue,TEXT_ALIGN_CENTER,'ui_header.xl')srp.doors.DrawText('You can exit the plaza through here',srp.doors.color_blue,TEXT_ALIGN_CENTER,'ui_header.l')end)srp.doors.AddDrawPanel('corbelow_plazabar_enterplaza',function(d)return true,Vector(9223,-1110,40),Angle(0,0,90)end,function(d,i)local l=d:GetPropertyColor()l.a=i;local m={}m.texture=c;m.color=srp.doors.color_blue;m.x=-1500;m.y=350;m.w=3000;m.h=800;draw.TexturedQuad(m)m.texture=b;m.y=1500;m.y=-1000;draw.TexturedQuad(m)if d:GetPropertyName()!=nil then srp.doors.DrawText(d:GetPropertyName(),l,TEXT_ALIGN_CENTER,'ui_header.xxl',10)end;srp.doors.DrawText('PUBLIC PROPERTY',srp.doors.color_blue,TEXT_ALIGN_CENTER,'ui_header.xl')srp.doors.DrawText('You can get to the Plaza this way',srp.doors.color_blue,TEXT_ALIGN_CENTER,'ui_header.l')end)end;srp.doors.AddGroup({Name='Plaza Room 1',Construction=true,Map='rp_coruscantbelow',Description='A simple square room located under the Plaza.',Price=5000,Doors={{id=3438,DrawFix='corbelow_doubleplazadoor',DrawPos=Vector(9215,3785,17)},{id=3439,Slave=true}}})srp.doors.AddGroup({Name='Plaza Room 2',Construction=true,Map='rp_coruscantbelow',Description='Located under the plaza.\nThis room is small and about the shap of a triangle with shop front windows.',Price=4000,Business=true,Doors={{id=3430},{id=3405}}})srp.doors.AddGroup({Name='Plaza Room 4',Construction=true,Map='rp_coruscantbelow',Description='A simple square room located under the Plaza.',Price=5000,Doors={{id=3414,DrawFix='corbelow_doubleplazadoor',DrawPos=Vector(11166,3785,17)},{id=3415,Slave=true}}})srp.doors.AddGroup({Name='Plaza Room 5',Construction=true,Map='rp_coruscantbelow',Description='A simple square room located under the Plaza.',Price=5000,Doors={{id=3412,DrawFix='corbelow_doubleplazadoor_right',DrawPos=Vector(11166,4199,17)},{id=1232,Slave=true}}})srp.doors.AddGroup({Name='Plaza Room 6',Construction=true,Map='rp_coruscantbelow',Description='A simple square room located under the Plaza.',Price=5000,Doors={{id=4678,DrawFix='corbelow_doubleplazadoor_right',DrawPos=Vector(9215,5358,17)},{id=4679,Slave=true}}})srp.doors.AddGroup({Name='Plaza Room 7',Construction=true,Map='rp_coruscantbelow',Description='A simple square room located under the Plaza.',Price=5000,Doors={{id=3451,DrawFix='corbelow_doubleplazadoor_right',DrawPos=Vector(8703,5358,17)},{id=3452,Slave=true}}})srp.doors.AddGroup({Name='Plaza Club',Map='rp_coruscantbelow',Description='The best place around. Its dark, cold and loud.',Price=15000,Business=true,Doors={{id=3486,DrawFix='corbelow_plazaclub'},{id=3487,Slave=true}}})srp.doors.AddGroup({Name='Bar & Arena',Map='rp_coruscantbelow',Description='',Price=0,Public=true,Doors={{id=2184,DrawFix='corbelow_plazabar_exitplaza'},{id=2182,Slave=true}}})srp.doors.AddGroup({Name='Bar & Arena',Map='rp_coruscantbelow',Description='',Price=0,Public=true,Doors={{id=2187,DrawFix='corbelow_plazabar_enterplaza'},{id=2186,Slave=true}}})srp.doors.AddGroup({Name='Terminal',Map='rp_coruscantbelow',Description='',Price=0,Public=true,Doors={{id=1797,DrawFix='terminal_entrance'}}})srp.doors.AddGroup({Name='Dt Cafe',Map='rp_coruscantbelow',Description='',Price=5000,Business=true,Doors={{id=1931},{id=1932,Slave=true},{id=1938},{id=1937,Slave=true},{id=1942},{id=1943,Slave=true},{id=4654},{id=4656}}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/quests/cargoday_sh.lua:
srp.quests.CreateStep('cargoday_delivery','New Delivery'):SetDescription('Deliver the new cargo around the ship.'):SetFaction('cis_basic'):AddAvatar('start',{Title='{AvatarName}',Description='We\'ve just received new supplies. Deliver them to the good men around the ship!'}):AddAvatar('end',{Title='{AvatarName}',Description='Thank you for the work, that\'s all for now.'}):AddAvatar('halfway',{Title='{AvatarName}',Description='We\'re nearly there. Keep it up and you all might just get an increase in pay!.'}):AddAvatar('alert',{Title='{AvatarName}',Description='Wait! I\'ve been informed that the {FactionTag} are on our way to steal our new cargo!'}):AddAvatar('standby',{Title='{AvatarName}',Description='Prepare the ship immediatly!'}):AddAvatar('clone',{AvatarId='clone',Title='{AvatarName}',Description='*sweats from all this manual labour*'}):AddAvatar('cis_warning',{AvatarId='cis2',Title='{AvatarName}',Description='Surrender your goods to the {FactionTag} and we will make your end quick!'}):AddAvatar('cis_warning2',{AvatarId='cis2',Title='{AvatarName}',Description='Fine... have it your way. Board the ship! Take no prisoners!'}):AddObjective('delivery','Deliver # Packages',function(a,b,c,d,e)return math.ceil(util.SharedRandom(d,1+9*e,2+18*e,0))end):AddHook('OnPalletDroppedOff',function(self,f,g)if!IsValid(f)||!f.SpawnedByPallet then return end;self:UpdateObjective('delivery',1)local h=self:GetObjectiveCount('delivery')if h==10 then self:DisplayAvatar('halfway')end;if h==15 then self:DisplayAvatar('clone')end end):OnStarted(function(self)if info.Dev then self:AddTimer('deliver',2,function(i)i:UpdateObjective('delivery',25)i:DisplayAvatar('clone')end)end end):OnEnded(function(self)self:GiveAllMoney(2000)self:DisplayAvatar('alert',10)self:DisplayAvatar('cis_warning',16)self:DisplayAvatar('standby',20)self:DisplayAvatar('cis_warning2',27)self:AddTimer('defcon',20,function(i)i:SetDefcon(5)end)return{timeout=info.Dev&&5||32}end)srp.quests.CreateStep('cargoday_boarding','{FactionTag} Attack'):SetDescription('Hunt down the {FactionTag} on the ship kill them!'):SetFaction('cis_basic'):SetCallouts({Title='{AvatarName}',Description='There are contacts in #!'}):AddAvatar('start_alternative',{Title='{AvatarName}',Description='The {FactionName} are here! Exterminate them!'}):AddAvatar('ending',{Title='{AvatarName}',Description='That was close. Looks like they\'ve all been cleaned up. Do a quick sweep and then head back to your quaters!'}):AddAvatar('halfway',{Title='{AvatarName}',Description='They are starting to retreat! Keep it up!'}):AddAvatar('cis_warning1',{AvatarId='cis1',Title='{AvatarName}',Description='Give up now! Surrender your cargo!'}):AddAvatar('cis_warning2',{AvatarId='cis2',Title='{AvatarName}',Description='You will not survive this!'}):AddAvatar('cis_warning3',{AvatarId='cis1',Title='{AvatarName}',Description='Fall back! We will get them next time!'}):AddAvatar('cis_warning4',{AvatarId='cis2',Title='{AvatarName}',Description='I said fall back!'}):AddObjective('kill','Kill # {FactionTag}',function(a,b,c,d,e)return info.Dev&&10||math.ceil(util.SharedRandom(d,250+250*e,500+500*e,0))end):AddHook('OnNPCKilled',function(self,j)if j.Invasion then self:UpdateObjective('kill',1)local h=self:GetObjectiveCount('kill')if h==15 then self:DisplayAvatar('cis_warning1')end;if h==250 then self:DisplayAvatar('halfway')end;if h==500 then self:DisplayAvatar('cis_warning2')end;if h==750 then self:DisplayAvatar('cis_warning4')end end end):OnStarted(function(self)self:SetDefcon(4)self:SpawnFaction(7,math.random(145,160))self:PlaySound('phx/kaboom.wav')self:PlaySound('phx/kaboom.wav',.5)self:PlaySound('phx/kaboom.wav',.7)end):OnEnded(function(self)self:ClearSpawns()self:DisplayAvatar('cis_warning3',2)self:DisplayAvatar('ending',6)self:GiveAllMoney(1500)self:SetDefcon(6)return{timeout=10}end)srp.quests.Create('cargoday','Cargo Day',srp.quests.TYPE_ALL):SetDescription([[]]):SetAvatar('501Rex'):AddSteps({'cargoday_delivery','cargoday_boarding'})srp.quests.Create('imperialintelligence','Imperial Intelligence',srp.quests.TYPE_ALL):SetDescription([[The ISB]]):SetAvatar('ISB'):AddSteps({{id='wait',name='Investigating',min=5,max=15,lines={'We\'re still investigating the item.','The results are inconclusive, we\'re running more tests.'}},{id='interesting_item',items={rp_itemofinterest_orb=4}}})
--addons/!lpakr_out/lua/weapons/basecombatweapon2/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/drgbase_possession.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/drgbase_weapon/primary.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stool.lua:
ToolObj={}include('ghostentity.lua')include('object.lua')if CLIENT then include('stool_cl.lua')end;function ToolObj:Create()local a={}setmetatable(a,self)self.__index=self;a.Mode=nil;a.SWEP=nil;a.Owner=nil;a.ClientConVar={}a.ServerConVar={}a.Objects={}a.Stage=0;a.Message="start"a.LastMessage=0;a.AllowedCVar=0;return a end;function ToolObj:CreateConVars()local b=self:GetMode()if CLIENT then for c,d in pairs(self.ClientConVar)do CreateClientConVar(b.."_"..c,d,true,true)end;return end end;function ToolObj:GetServerInfo(e)local b=self:GetMode()return GetConVarString(b.."_"..e)end;function ToolObj:BuildConVarList()local b=self:GetMode()local f={}for g,h in pairs(self.ClientConVar)do f[b.."_"..g]=h end;return f end;function ToolObj:GetClientInfo(e)local b=self:GetMode()return self:GetOwner():GetInfo(b.."_"..e)end;function ToolObj:GetClientNumber(e,d)d=d||0;local b=self:GetMode()return self:GetOwner():GetInfoNum(b.."_"..e,d)end;function ToolObj:Allowed()if CLIENT then return true end;return self.AllowedCVar:GetBool()end;function ToolObj:Init()end;function ToolObj:GetMode()return self.Mode end;function ToolObj:GetSWEP()return self.SWEP end;function ToolObj:GetOwner()return self:GetSWEP().Owner||self:GetOwner()end;function ToolObj:GetWeapon()return self:GetSWEP().Weapon||self.Weapon end;function ToolObj:LeftClick()return false end;function ToolObj:RightClick()return false end;function ToolObj:Reload()self:ClearObjects()end;function ToolObj:Deploy()self:ReleaseGhostEntity()return end;function ToolObj:Holster()self:ReleaseGhostEntity()return end;function ToolObj:Think()self:ReleaseGhostEntity()end;function ToolObj:CheckObjects()for g,h in pairs(self.Objects)do if!h.Ent:IsWorld()&&!h.Ent:IsValid()then self:ClearObjects()end end end;local i=file.Find(SWEP.Folder.."/stools/*.lua","LUA")local j={}function GetToolInfo(k)return j[k]end;for l,m in pairs(i)do local n,o,p=string.find(m,"([%w_]*).lua")TOOL=ToolObj:Create()TOOL.Mode=p;AddCSLuaFile("stools/"..m)include("stools/"..m)TOOL:CreateConVars()SWEP.Tool[p]=TOOL;j[p]=TOOL;TOOL=nil end;ToolObj=nil;if CLIENT then local q=SWEP.Tool;local function r()for s,TOOL in pairs(q)do if TOOL.AddToMenu!=false then spawnmenu.AddToolMenuOption(TOOL.Tab||"Main",TOOL.Category||"New Category",s,TOOL.Name||"#"..s,TOOL.Command||"gmod_tool "..s,TOOL.ConfigName||s,TOOL.BuildCPanel)end end end;hook("PopulateToolMenu","AddSToolsToMenu",r)spawnmenu.AddContentType("tool",function(t,u)if!u.spawnname then return end;local v=vgui.Create("ContentIcon",t)v:SetContentType("tool")v:SetSpawnName(u.spawnname)v:SetName(u.nicename||"#tool."..u.spawnname..".name")v:SetMaterial("gui/tool.png")v.DoClick=function()spawnmenu.ActivateTool(u.spawnname)surface.PlaySound("ui/buttonclickrelease.wav")end;v.OpenMenu=function(v)local w=DermaMenu()w:AddOption("Delete",function()v:Remove()hook.Run("SpawnlistContentChanged",v)end)w:Open()end;if IsValid(t)then t:Add(v)end;return v end)end
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/drgbase_tool_damage.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/drgbase_tool_scale.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/hackcreator.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/hackcreator.lua:
local a='rp_bomb_base'local b={SuccessSound={'galactic/ui/hacking/success.wav'},FailureSound={'galactic/ui/hacking/failure.wav'},Damage={min=5,max=6000},Radius={min=100,max=1000},Models={['models/combine_helicopter/helicopter_bomb01.mdl']={},['models/props/swtorbombmedium.mdl']={},['models/props/swtorbombsmall.mdl']={},['models/props/starwars/weapons/hoth_bomb.mdl']={},['models/props/starwars/weapons/seismic_charge.mdl']={},['models/props/starwars/tech/proton_shell.mdl']={},['models/lt_c/sci_fi/dm_container.mdl']={},['models/lt_c/sci_fi/am_container.mdl']={}}}TOOL.Category='Superior Tools'TOOL.Name='Hackable Bombs'TOOL.ClientConVar['name']=''TOOL.ClientConVar['games']=''TOOL.ClientConVar['preexplodeid']=1;TOOL.ClientConVar['explodeid']=1;TOOL.ClientConVar['failuresound']=''TOOL.ClientConVar['successsound']=''TOOL.ClientConVar['damage']=0;TOOL.ClientConVar['radius']=0;TOOL.ClientConVar['model']=''if CLIENT then language.Add('Tool.hackcreator.name','Hackables Creator')language.Add('Tool.hackcreator.displayname','Name')language.Add('Tool.hackcreator.left','Create Bomb')language.Add('Tool.hackcreator.right','Convert to Bomb')language.Add('Tool.hackcreator.reload','Remove Bomb')language.Add('Tool.hackcreator.desc','Creates hackable bombs')language.Add('Tool.hackcreator.preexplodeid','Pre-Explosion Type')language.Add('Tool.hackcreator.explodeid','Explosion Type')language.Add('Tool.hackcreator.damage','Explosion Damage')language.Add('Tool.hackcreator.radius','Explosion Radius')language.Add('Tool.hackcreator.successsound','Success Sound')language.Add('Tool.hackcreator.failuresound','Failure Sound')language.Add('Tool.hackcreator.model','Bomb Model')end;TOOL.Information={{name='left'},{name='right'},{name='reload'}}local c=Color(10,189,227)local d=Color(0,0,0,200)local e={}local function f(g)if!g||g==''then return end;local h={}for i,j in ipairs(string.Explode(',',g))do local k=string.Explode('.',j)table.insert(h,{id=k[1],difficulty=k[2]})end;return h end;local function l(self,m,n,o)local p=self:GetClientInfo'model'local q=self:GetClientInfo'name'if!b.Models[p]then p='models/combine_helicopter/helicopter_bomb01.mdl'end;local r=math.Clamp(self:GetClientNumber('damage'),b.Damage.min,b.Damage.max)local s=math.Clamp(self:GetClientNumber('radius'),b.Radius.min,b.Radius.max)local t=self:GetClientInfo'preexplodeid'local u=self:GetClientInfo'explodeid'local v=self:GetClientInfo('successsound')if!table.HasValue(b.SuccessSound,v)then v=b.SuccessSound[1]end;local w=self:GetClientInfo('failuresound')if!table.HasValue(b.FailureSound,w)then w=b.FailureSound[1]end;local h=f(self:GetClientInfo('games'))if!h||#h==0 then return end;local x=ents.Create(a)function x:GenerateGameList()return h end;x.GameConfig=h;x.Damage=r;x.DamageRadius=s;x.SuccessSound=v;x.FailureSound=w;x.ExplosionMode=x.PreExplosionTypes[t]&&t||'ExplodeWarning'x.PreExplosionMode=x.ExplosionTypes[u]&&u||'Explode'x:SetDisplayName(q||'')x:SetPropOwner(n)x:Spawn()x:SetModel(o||p)x:SetPos(m.HitPos-m.HitNormal*x:OBBMins())x:SetAngles(Angle(0,n:GetAngles().y,0))undo.Create'hackcreator'undo.SetPlayer(n)undo.AddEntity(x)undo.SetCustomUndoText'Removed Hackable Bomb'undo.Finish()return x end;function TOOL:LeftClick(m)l(self,m,self:GetOwner())end;function TOOL:RightClick(m)local x=m.Entity;local n=self:GetOwner()if!IsValid(x)||x:GetClass()!='prop_physics'||x:GetPropOwner()!=n then return end;local y=x:GetPos()local z=x:GetAngles()local A=x:GetMaterial()local B=x:GetSkin()x:Remove()local C=l(self,m,n,x:GetModel())C:SetPos(y)C:SetAngles(z)C:SetSkin(B)C:SetMaterial(A)end;function TOOL:Reload(m)if IsValid(m.Entity)&&m.Entity:GetClass()==a then m.Entity:Remove()end end;local function D()local E={}for F,G in pairs(e)do if IsValid(G)then table.insert(E,G.gameid..'.'..G.difficulty)end end;RunConsoleCommand('hackcreator_games',table.concat(E,','))end;local function H(I,J)local G=vgui.Create('DPanel')G:SetTall(50)G:DockPadding(0,0,0,5)G:DockMargin(0,0,0,4)G.Paint=function(K,L,M)surface.SetDrawColor(c)surface.DrawOutlinedRect(0,0,L,M)end;G.gameid=J.id;local N=vgui.Create('DPanel',G)N:SetTall(20)N:DockPadding(5,0,0,5)N:DockMargin(0,0,0,10)N:Dock(TOP)N.Paint=function(K,L,M)draw.Box(0,0,L,M,c)end;local q=vgui.Create('DLabel',N)q:Dock(FILL)q:SetText(J.Name||J.id)q:SetTextColor(color_white)q:DockMargin(0,2,0,0)q:SetContentAlignment(4)local O=vgui.Create('DButton',N)O:DockMargin(0,0,0,0)O:DockPadding(0,0,0,0)O:SetTextColor(color_white)O:Dock(RIGHT)O:SetText'X'O:SetFont'ui_label.b'O:SetSize(30,20)O.DoClick=function()G:Remove()D()end;O.Paint=function(self,L,M)draw.Box(0,0,L,M,col.red)end;if J.Difficulties then G:SetTall(100)local q=vgui.Create('DLabel',G)q:Dock(TOP)q:SetText'Difficulty'q:SetFont'ui_label.b'q:SetTextColor(col.grey)q:DockMargin(5,0,0,5)local P=vgui.Create('DComboBox',G)P:DockMargin(5,0,5,0)P:Dock(TOP)P.OnSelect=function(self,Q,R,S)G.difficulty=S end;for i,T in pairs(J.Difficulties)do P:AddChoice(i[1]:upper()..i:sub(2,#i),i,i=='normal')end else local U=vgui.Create('DLabel',G)U:Dock(FILL)U:SetFont'ui_label.r'U:SetText'No difficulty options available'U:SetContentAlignment(5)U:SetTextColor(col.grey)U:DockMargin(0,0,0,0)G.difficulty='normal'end;G:Dock(TOP)I.Scroll:AddItem(G)table.insert(e,G)D()end;local function V(I)local G=vgui.Create('DPanel',I)G:SetTall(22)G:DockPadding(0,0,0,0)G:DockMargin(10,10,10,5)G:Dock(TOP)G.Paint=function()end;local P=vgui.Create('DComboBox',G)P:DockMargin(0,0,0,0)P:Dock(FILL)local O=vgui.Create('DButton',G)O:DockMargin(1,1,1,1)O:SetTextColor(color_white)O:SetWidth(20)O:Dock(RIGHT)O:SetText'+'O.Paint=function(self,L,M)draw.RoundedBox(2,0,0,L,M,c)end;O.DoClick=function(K,Q,R,S)local F,S=P:GetSelected()if table.Count(I.Scroll:GetChildren())<7 then H(I,S)end end;for i,T in pairs(srp.hacking.GetAll())do P:AddChoice(T.Name||i,T,i=='hexmatch')end;local W=vgui.Create('DPanel',I)W:Dock(TOP)W:SetTall(240)W:DockMargin(10,10,10,10)local X=vgui.Create('DScrollPanel',W)X:Dock(FILL)I.Scroll=X end;local function Y(q,I)local Z=vgui.Create('DCollapsibleCategory',I)Z:Dock(TOP)Z:SetLabel(q)Z:DockMargin(5,5,5,5)local _=vgui.Create'srp_panel'_:SetTall(500)_:DockPadding(10,10,10,10)_:SetBackgroundColor(col.white_dark)_.OnChildAdded=function(K,a0)K:SetTall(K:GetTall()+a0:GetTall()+4)end;Z:SetContents(_)return _ end;local function a1(g,Z)local a2=vgui.Create('DLabel')a2:Dock(TOP)a2:SetTextColor(color_black)a2:SetText(g)a2:DockMargin(0,2,2,2)Z:AddItem(a2)return a2 end;function TOOL.BuildCPanel(I)local G=I:AddControl('Textbox',{Label='#Tool.hackcreator.displayname',Command='hackcreator_name',Help=false})local Z=Y('Success Control',I)a1('#tool.hackcreator.successsound',Z)local a3=vgui.Create('DComboBox')a3:DockMargin(5,5,5,5)a3:Dock(TOP)a3.OnSelect=function(self,Q,R,S)RunConsoleCommand('hackcreator_successsound',S)end;for a4,a5 in ipairs(b.SuccessSound)do a3:AddChoice(a5,a5,a4==1)end;Z:AddItem(a3)local Z=Y('Failure Control',I)a1('#tool.hackcreator.failuresound',Z)local a6=vgui.Create('DComboBox')a6:DockMargin(5,5,5,5)a6:Dock(TOP)a6.OnSelect=function(self,Q,R,S)RunConsoleCommand('hackcreator_failuresound',S)end;for a4,a5 in ipairs(b.FailureSound)do a6:AddChoice(a5,a5,a4==1)end;Z:AddItem(a6)a1('#tool.hackcreator.preexplodeid',Z)local a7=vgui.Create('DComboBox')a7:DockMargin(5,5,5,5)a7:Dock(TOP)a7.OnSelect=function(self,Q,R,S)RunConsoleCommand('hackercreator_preexplodeid',S)end;Z:AddItem(a7)local a4=1;local T=scripted_ents.GetStored('rp_bomb_base').t;for i,q in pairs(T.PreExplosionTypes)do a7:AddChoice(q,i,a4==1)a4=a4+1 end;a1('#tool.hackcreator.explodeid',Z)local a8=vgui.Create('DComboBox')a8:DockMargin(5,5,5,5)a8:Dock(TOP)a8.OnSelect=function(self,Q,R,S)RunConsoleCommand('hackercreator_explodeid',S)end;Z:AddItem(a8)local a4=1;for i,q in pairs(T.ExplosionTypes)do a8:AddChoice(q,i,a4==1)a4=a4+1 end;local r=I:NumSlider('Explosion Damage','hackcreator_damage',b.Damage.min,b.Damage.max,0)local s=I:NumSlider('Explosion Radius','hackcreator_radius',b.Radius.min,b.Radius.max,0)Z:AddItem(r)Z:AddItem(s)I:AddControl('PropSelect',{Label='#tool.hackcreator.model',ConVar='hackcreator_model',Height=3,Models=b.Models})V(I)end;function TOOL:DrawHUD()end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/nocollide_world.lua:
return lpakr()()
--addons/!lpakr_out/lua/improvedstacker/localization.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/sup_areatrigger.lua:
local a=Model'models/dav0r/buttons/button.mdl'local b={{'sup_areatrigger','Area Trigger'},{'sup_usetrigger','Use Trigger'}}TOOL.Category=areatrigger.Category;TOOL.Name='Area Triggers'TOOL.ClientConVar.triggerclass=1;TOOL.ClientConVar.actionid=''TOOL.ClientConVar.triggername='Trigger Name'TOOL.ClientConVar.model=a;TOOL.ClientConVar.mass=1000;TOOL.ClientConVar.area_w=100;TOOL.ClientConVar.area_h=100;TOOL.ClientConVar.area_l=100;TOOL.ClientConVar.enableevents=0;TOOL.ClientConVar.sphere=0;TOOL.ClientConVar.sphere_size=50;TOOL.ClientConVar.helperview=1;TOOL.ClientConVar.removeuse=0;TOOL.Information={{name='left'},{name='right'}}cleanup.Register(b[1][1])cleanup.Register(b[2][1])if CLIENT then language.Add('tool.sup_areatrigger.name','Area Trigger')language.Add('tool.sup_areatrigger.desc','Do things when players use your trigger')language.Add('tool.sup_areatrigger.triggerclass','Trigger Entity')language.Add('tool.sup_areatrigger.actionid','Control Mode')language.Add('tool.sup_areatrigger.model','Trigger Use Model')language.Add('tool.sup_areatrigger.triggername','Name')language.Add('tool.sup_areatrigger.left','Spawns an Trigger with the selected options')language.Add('tool.sup_areatrigger.right','Updates the closest Trigger with the selected options')language.Add('tool.sup_areatrigger.sphere','Sphere trigger')language.Add('tool.sup_areatrigger.sphere.help','Use sphere trigger instead of a cube')language.Add('tool.sup_areatrigger.enableevents','Event Characters Only')language.Add('tool.sup_areatrigger.enableevents.help','Only event characters can trigger this')language.Add('tool.sup_areatrigger.helperview','Enable helper overlay')language.Add('tool.sup_areatrigger.helperview.help','Pick a overlay type from the dropdown to see the ent ids in game. Helps with some specific trigger types.')language.Add('tool.sup_areatrigger.removeuse','Remove after X uses')language.Add('Cleanup_sup_areatrigger','Trigger: Area')language.Add('Cleaned_sup_areatrigger','Cleaned up all Area Triggers')language.Add('Cleanup_sup_usetrigger','Trigger: Use')language.Add('Cleaned_sup_usetrigger','Cleaned up all Use Triggers')end;function TOOL:CanUse(c)return areatrigger.IsGameMaster(c)end;function TOOL:LeftClick(d)end;function TOOL:RightClick(d)end;local e;local function f(g,h)if!g then return end;g:Clear()g:NumSlider('Weight','sup_areatrigger_mass',0,50000,0)if h then g:NumSlider('Sphere Size','sup_areatrigger_sphere_size',50,500,0)else g:NumSlider('Area Width','sup_areatrigger_area_w',20,1000,0)g:NumSlider('Area Height','sup_areatrigger_area_h',20,1000,0)g:NumSlider('Area Length','sup_areatrigger_area_l',20,1000,0)end end;function TOOL.BuildCPanel(g)local i=vgui.Create('DComboBox',g)i:DockMargin(10,10,10,10)i:Dock(TOP)g.TriggerMode=i;i.OnSelect=function(self,j,k,l)RunConsoleCommand('sup_areatrigger_triggerclass',l)if IsValid(g.model)then g.model:SetDisabled(l!=2)end end;for m=1,#b do i:AddChoice(b[m][2],m,m==1)end;local n=g:AddControl('Textbox',{Label="#tool.sup_areatrigger.model",Command="sup_areatrigger_model",Help=true})g.model=n;n:SetDisabled(true)g:AddControl('Textbox',{Label="#tool.sup_areatrigger.triggername",Command="sup_areatrigger_triggername",Help=true})g:NumSlider('Remove on Use','sup_areatrigger_removeuse',0,255,0)g:AddControl('CheckBox',{Label='#tool.sup_areatrigger.enableevents',Command='sup_areatrigger_enableevents',Help=true})local o=g:AddControl('CheckBox',{Label='#tool.sup_areatrigger.sphere',Command='sup_areatrigger_sphere',Help=true})o.OnChange=function(self,p)if!g.physicals then return end;f(g.physicals,p)end;local q=vgui.Create('DForm',g)q:DockMargin(5,5,5,5)q:SetLabel'Physical Properties'q:SetTall(100)q:Dock(TOP)g.physicals=q;f(g.physicals,o:GetChecked())local r=vgui.Create('DCollapsibleCategory',g)r:SetLabel'Action Lists'r:DockMargin(5,5,5,5)r:Dock(TOP)r.OnMousePressed=function()end;local i=vgui.Create('DComboBox',g)i:DockMargin(10,5,10,5)i:Dock(TOP)i:SetText'Action List ID'i.SetActionList=function(s,t)s:Clear()for u,v in pairs(t)do s:AddChoice(u,u)end end;i.OnSelect=function(self,j,k,l)RunConsoleCommand('sup_areatrigger_actionid',l)end;i:SetActionList(areatrigger.Activated)g.Triggerid=i;e=i;local w=vgui.Create('DButton',g)w:DockMargin(10,5,10,5)w:Dock(TOP)w:SetText'Open Control Panel'w.DoClick=function(s)areatrigger.OpenMenu()end;local r=vgui.Create('DCollapsibleCategory',g)r:SetLabel'Debug'r:DockMargin(5,5,5,5)r:Dock(TOP)r.OnMousePressed=function()end;g:AddControl('CheckBox',{Label='#tool.sup_areatrigger.helperview',Command='sup_areatrigger_helperview',Help=true})local i=vgui.Create('DComboBox',g)i:SetText'Entities to view'i:DockMargin(10,10,10,10)i:Dock(TOP)i.OnSelect=function(self,j,k,x)areatrigger.SetDrawHelperClass(x)end;for m,y in pairs(areatrigger.GetDrawHelperClasses())do i:AddChoice(y[1],y[2])end end;local z=Color(0,0,0,25)local A=Color(222,0,0,25)local B=Angle()function TOOL:DrawHUD()if!areatrigger.IsGameMaster(LocalPlayer())then return end;areatrigger.DrawHelper(self)local C=LocalPlayer():GetEyeTrace()B.y=LocalPlayer():GetAngles().y;if self:GetClientNumber('triggerclass')==1 then local D=self:GetClientNumber('sphere')==1;if D then local E=math.Clamp(self:GetClientNumber('sphere_size')||50,50,500)cam.Start3D()render.SetColorMaterial()render.DrawSphere(C.HitPos,E,15,15,z)render.DrawWireframeSphere(C.HitPos,E,15,15,A,true)cam.End3D()else local F,G,H=self:GetClientNumber('area_w')||20,self:GetClientNumber('area_h')||20,self:GetClientNumber('area_l')||20;local I=Vector(-F/2,-H/2,0)local J=Vector(F/2,H/2,G)cam.Start3D()render.SetColorMaterial()render.DrawBox(C.HitPos,B,I,J,z,true)render.DrawWireframeBox(C.HitPos,B,I,J,A,true)cam.End3D()end else local K=self:GetClientInfo('model')||a;if K=='*0'then K=a end;cam.Start3D()render.Model({model=K,pos=C.HitPos,angle=B})cam.End3D()end end;if CLIENT then hook('OnTriggerConfigActivated','areatrigger.PopulateActionListID',function()if IsValid(e)then e:SetActionList(areatrigger.Activated)end end)hook('OnTriggerConfigDeactivated','areatrigger.PopulateActionListID',function()if IsValid(e)then e:SetActionList(areatrigger.Activated)end end)end
--addons/!lpakr_out/lua/wire/tool_loader.lua:
local function a()for b,c in pairs(file.Find("wire/stools/*.lua","LUA"))do include("wire/stools/"..c)AddCSLuaFile("wire/stools/"..c)end;if TOOL then WireToolSetup.close()end end;local function d(self,e)return self.NoGhostOn&&table.HasValue(self.NoGhostOn,e.Entity:GetClass())end;WireToolObj={}setmetatable(WireToolObj,ToolObj)WireToolObj.Tab="Wire"function WireToolObj:LeftClick(e)if!e.HitPos||e.Entity:IsPlayer()||e.Entity:IsNPC()||SERVER&&!util.IsValidPhysicsObject(e.Entity,e.PhysicsBone)then return false end;if self.NoLeftOnClass&&e.HitNonWorld&&(e.Entity:GetClass()==self.WireClass||d(self,e))then return false end;if CLIENT then return true end;local f=self:GetOwner()local g=self:LeftClick_Make(e,f)return self:LeftClick_PostMake(g,f,e)end;function WireToolObj:Reload(e)if!IsValid(e.Entity)then return false end;if CLIENT then return true end;if self.ReloadSetsModel then self:GetOwner():ConCommand(self.Mode.."_model "..e.Entity:GetModel())self:GetOwner():PrintMessage(HUD_PRINTTALK,self.Name.." model set to "..e.Entity:GetModel())return true end;if e.Entity:GetParent():IsValid()then local h=e.Entity:GetPos()e.Entity:SetParent()e.Entity:SetPos(h)local i=e.Entity:GetPhysicsObject()if i then i:Wake()end;self:GetOwner():ChatPrint("Entity unparented.")return true end;return false end;function WireToolObj:UpdateGhost(g)if!IsValid(g)then return end;local e=self:GetOwner():GetEyeTrace()if!e.Hit then return end;if IsValid(e.Entity)&&(e.Entity:IsPlayer()||e.Entity:IsNPC()||e.Entity:GetClass()==self.WireClass||d(self,e))then g:SetNoDraw(true)return end;g:SetAngles(self:GetAngle(e))self:SetPos(g,e)g:SetNoDraw(false)end;function WireToolObj:Think()local j=self:GetModel()if!IsValid(self.GhostEntity)||self.GhostEntity:GetModel()!=j then if self.GetGhostAngle then self:MakeGhostEntity(j,Vector(0,0,0),self:GetGhostAngle(self:GetOwner():GetEyeTrace()))else self:MakeGhostEntity(j,Vector(0,0,0),self.GhostAngle||Angle(0,0,0))end;if IsValid(self.GhostEntity)&&CLIENT then self.GhostEntity:SetPredictable(true)end end;self:UpdateGhost(self.GhostEntity)end;function WireToolObj:CheckHitOwnClass(e)return e.Entity:IsValid()&&e.Entity:GetClass()==self.WireClass end;local k={[""]=false}function WireToolObj:CheckValidModel(j)local l=k[j||""]if l!=nil then return l end;if SERVER then else k[j]=file.Exists(j,"GAME")end;return k[j]end;function WireToolObj:GetModel()local m=self:GetClientInfo("model")if self.ClientConVar.modelsize then local n=self:GetClientInfo("modelsize")if n!=""then local j=string.sub(m,1,-5).."_"..n..string.sub(m,-4)if self:CheckValidModel(j)then return j end;j=string.GetPathFromFilename(m)..n.."_"..string.GetFileFromFilename(m)if self:CheckValidModel(j)then return j end end end;if self:CheckValidModel(m)then return m end;return self.Model||self.ClientConVar.model||"models/props_c17/oildrum001.mdl"end;function WireToolObj:GetAngle(e)local o;if math.abs(e.HitNormal.x)<0.001&&math.abs(e.HitNormal.y)<0.001 then o=Vector(0,0,e.HitNormal.z):Angle()else o=e.HitNormal:Angle()end;if self.GetGhostAngle then o=self:GetGhostAngle(e)elseif self.GhostAngle then o=o+self.GhostAngle end;if self.ClientConVar.createflat then if self:GetClientNumber("createflat")==0 then o.pitch=o.pitch+90 end;local j=self:GetModel()if string.find(j,"pcb")||string.find(j,"hunter")then o.pitch=o.pitch+90 end else o.pitch=o.pitch+90 end;return o end;function WireToolObj:SetPos(g,e)local p=g:OBBMins()if self.GetGhostMin then g:SetPos(e.HitPos-e.HitNormal*self:GetGhostMin(p,e))elseif self.GhostMin then g:SetPos(e.HitPos-e.HitNormal*p[self.GhostMin])elseif self.ClientConVar.createflat&&self:GetClientNumber("createflat")==1!=((string.find(self:GetModel(),"pcb")||string.find(self:GetModel(),"hunter"))!=nil)then g:SetPos(e.HitPos+e.HitNormal*g:OBBMaxs().x)else g:SetPos(e.HitPos-e.HitNormal*p.z)end end;if CLIENT then local q={font="Helvetica",size=60,weight=900}for r=60,20,-2 do q.size=r;surface.CreateFont("GmodToolScreen"..r,q)end;local s={["$vertexcolor"]=1,["$vertexalpha"]=1,["$ignorez"]=1}local t=surface.GetTextureID("models/weapons/v_toolgun/wirescreen_bg")function WireToolObj:DrawToolScreen(u,v)surface.SetTexture(t)surface.DrawTexturedRect(0,0,u,v)local w=self.Name;if self.ScreenFont then surface.SetFont(self.ScreenFont)else for r=60,20,-2 do surface.SetFont("GmodToolScreen"..r)local x,y=surface.GetTextSize(w)if x<=u-16 then self.ScreenFont="GmodToolScreen"..r;break end end end;local z,A=surface.GetTextSize(w)local x=u/2-z/2;local y=105-A/2;surface.SetTextColor(0,0,0,255)surface.SetTextPos(x+3,y+3)surface.DrawText(w)surface.SetTextColor(255,255,255,255)surface.SetTextPos(x,y)surface.DrawText(w)s["$basetexture"]="spawnicons/"..self:GetModel():sub(1,-5)local B=CreateMaterial(self:GetModel().."_DImage","UnlitGeneric",s)surface.SetMaterial(B)surface.DrawTexturedRect(128-32,150,64,64)local C=self:GetOwner():GetInfo("wire_tool_weldworld")!="0"&&!self:GetOwner():KeyDown(IN_WALK)draw.DrawText("World Weld:  "..(C&&"On"||"Off"),"GmodToolScreen20",5,v-38,Color(C&&150||255,C&&255||150,150,255))local C=self:GetOwner():GetInfo("wire_tool_nocollide")!="0"&&!self:GetOwner():KeyDown(IN_WALK)draw.DrawText("Nocollide All: "..(C&&"On"||"Off"),"GmodToolScreen20",5,v-22,Color(C&&150||255,C&&255||150,150,255))end;CreateClientConVar("wire_tool_weldworld","0",true,true)CreateClientConVar("wire_tool_nocollide","1",true,true)local function D(E)E:ClearControls()E:Help("Hold Alt while spawning Wire entities\nto disable Weld and Nocollide All")E:CheckBox("Allow Weld to World","wire_tool_weldworld")E:CheckBox("Nocollide All","wire_tool_nocollide")end;hook.Add("PopulateToolMenu","WireLib_WireOptions",function()spawnmenu.AddToolMenuOption("Wire","Options","WireOptions","Tool Options","","",D,nil)end)end;WireToolHelpers={}function WireToolHelpers.GetTOOL(F,f)if CLIENT then f=LocalPlayer()end;if!f then return end;for b,G in ipairs(f:GetWeapons())do if G:GetClass()=="gmod_tool"then return G:GetToolObject(F)end end end;function WireToolHelpers.GetActiveTOOL(F,f)if CLIENT then f=LocalPlayer()end;if!f then return end;local H=f:GetActiveWeapon()if!IsValid(H)||H:GetClass()!="gmod_tool"||H.Mode!=F then return end;return H:GetToolObject(F)end;if CLIENT then function WireToolHelpers.MakePresetControl(I,F,J)if!F||!I then return end;local TOOL=WireToolHelpers.GetTOOL(F)if!TOOL then return end;local K=vgui.Create("ControlPresets",I)K:SetPreset(J||F)if TOOL.ClientConVar then local L={}for M,N in pairs(TOOL.ClientConVar)do if M!="id"then M=F.."_"..M;L[M]=N;K:AddConVar(M)end end;K:AddOption("#Default",L)end;I:AddPanel(K)end;function WireToolHelpers.MakeModelSizer(I,O)return I:AddControl("ListBox",{Label="Model Size",Options={["normal"]={[O]=""},["mini"]={[O]="mini"},["nano"]={[O]="nano"}}})end;function WireToolHelpers.MakeModelSel(I,F)local TOOL=WireToolHelpers.GetTOOL(F)if!TOOL then return end;ModelPlug_AddToCPanel(I,TOOL.short_name,TOOL.Mode,true)end end;function WireToolHelpers.SetupSingleplayerClickHacks(TOOL)end;if game.SinglePlayer()then if SERVER then elseif CLIENT then net.Receive("wire_singleplayer_tool_wtfgarry",function(P)local Q=net.ReadString()local R=net.ReadString()local S=WireToolHelpers.GetTOOL(R)if!S then return end;S[Q](S,LocalPlayer():GetEyeTrace())end)end end;WireToolSetup={}function WireToolSetup.setCategory(T,...)WireToolSetup.cat=T;local U={...}if#U>0 then WireToolSetup.Wire_MultiCategories=U else WireToolSetup.Wire_MultiCategories=nil end end;function WireToolSetup.setToolMenuIcon(V)TOOL.Wire_ToolMenuIcon=V end;function WireToolSetup.open(W,X,Y,Z,_)if TOOL then WireToolSetup.close()end;TOOL=WireToolObj:Create()TOOL.Mode="wire_"..W;TOOL.short_name=W;TOOL.Category=WireToolSetup.cat;TOOL.Wire_MultiCategories=WireToolSetup.Wire_MultiCategories;TOOL.Name=X;TOOL.PluralName=_;TOOL.WireClass=Y;if Z then TOOL.LeftClick_Make=Z end;local a0=debug.getinfo(2,"S")if a0 then TOOL.SourceFile=a0.short_src end end;function WireToolSetup.close()TOOL:CreateConVars()SWEP.Tool[TOOL.Mode]=TOOL;TOOL=nil end;function WireToolSetup.BaseLang()if CLIENT then language.Add("undone_"..TOOL.WireClass,"Undone Wire "..TOOL.Name)if TOOL.PluralName then language.Add("Cleanup_"..TOOL.WireClass,"Wire "..TOOL.PluralName)language.Add("Cleaned_"..TOOL.WireClass,"Cleaned Up Wire "..TOOL.PluralName)end;for b,a0 in pairs(TOOL.Information||{})do if a0.text then language.Add("Tool."..TOOL.Mode.."."..a0.name,a0.text)end end end;cleanup.Register(TOOL.WireClass)end;function WireToolSetup.SetupMax(a1,a2,a3)TOOL.MaxLimitName=a2||TOOL.WireClass:sub(6).."s"a3=a3||"You've hit the Wire "..TOOL.PluralName.." limit!"if CLIENT then language.Add("SBoxLimit_"..TOOL.MaxLimitName,a3)AddWireAdminMaxDevice(TOOL.PluralName,TOOL.MaxLimitName)else CreateConVar("sbox_max"..TOOL.MaxLimitName,a1)end end;function WireToolSetup.SetupLinking(a4,a5)TOOL.SingleLink=a4;a5=a5||"entity"if CLIENT then if TOOL.Information==nil||next(TOOL.Information)==nil then TOOL.Information={{name="left_0",stage=0},{name="right_0",stage=0},{name="reload_0",stage=0},{name="right_1",stage=1},{name="right_2",stage=2}}if!a4 then table.insert(TOOL.Information,{name="info_1",stage=1})table.insert(TOOL.Information,{name="info_2",stage=2})table.insert(TOOL.Information,{name="reload_2",stage=2})end end;language.Add("Tool."..TOOL.Mode..".left_0","Create/Update "..TOOL.Name)language.Add("Tool."..TOOL.Mode..".right_0","Select a "..TOOL.Name.." to link")language.Add("Tool."..TOOL.Mode..".reload_0","Unlink everything from a "..TOOL.Name)language.Add("Tool."..TOOL.Mode..".right_1","Now select the "..a5 .." to link to")language.Add("Tool."..TOOL.Mode..".right_2","Now select the "..a5 .." to unlink")if!a4 then language.Add("Tool."..TOOL.Mode..".info_1","Hold shift to link to more")language.Add("Tool."..TOOL.Mode..".info_2","Hold shift to unlink from more")language.Add("Tool."..TOOL.Mode..".reload_2","Reload on the same controller again to clear all linked entities.")end;local a6=0;function TOOL:DrawHUD()local e=self:GetOwner():GetEyeTrace()if!e.Entity then a6=0 end;if self:CheckHitOwnClass(e)then local a7=e.Entity;if a7.WireLinkedEnts&&a7.WireLinkedEnts.Marks then local a8=a7:GetPos():ToScreen()for b,g in pairs(a7.WireLinkedEnts.Marks)do if IsValid(g)then local a9=g:GetPos():ToScreen()surface.SetDrawColor(255,255,100,255)surface.DrawLine(a8.x,a8.y,a9.x,a9.y)end end end;if CurTime()-a6>1 then if!a7.WireLinkedEnts||CurTime()>a7.WireLinkedEnts.LastUpdated then net.Start("WireLinkedEntsRequest")net.WriteEntity(a7)if a7.WireLinkedEnts then net.WriteFloat(a7.WireLinkedEnts.LastUpdated)else net.WriteFloat(0)end;net.SendToServer()end;a6=CurTime()end end end end;function TOOL:RightClick(e)if!e.HitPos||!IsValid(e.Entity)||e.Entity:IsPlayer()then return false end;if CLIENT then return true end;local g=e.Entity;if self:GetStage()==0 then if self:CheckHitOwnClass(e)then self.Controller=g;self:SetStage(1)return true else return false end elseif self:GetStage()==1 then if!IsValid(self.Controller)then self:SetStage(0)return end;local f=self:GetOwner()local aa,ab=self.Controller:LinkEnt(g)if aa then if self.SingleLink||!f:KeyDown(IN_SPEED)then self:SetStage(0)end;self.HasLinked=true;WireLib.AddNotify(f,"Linked entity: "..tostring(g).." to the "..self.Name,NOTIFY_GENERIC,5)else WireLib.AddNotify(f,ab||"That entity is already linked to the "..self.Name,NOTIFY_ERROR,5,NOTIFYSOUND_DRIP3)end;return aa end end;function TOOL:Reload(e)if!e.HitPos||!IsValid(e.Entity)||e.Entity:IsPlayer()then self:SetStage(0)return false end;if CLIENT then return true end;local g=e.Entity;if self:CheckHitOwnClass(e)then local f=self:GetOwner()self:SetStage(0)if g.ClearEntities then g:ClearEntities()WireLib.AddNotify(f,"All entities unlinked from the "..self.Name,NOTIFY_GENERIC,7)else g:UnlinkEnt()WireLib.AddNotify(f,"Unlinked "..self.Name,NOTIFY_GENERIC,5)end;return true elseif self:GetStage()==1 then local f=self:GetOwner()local aa,ab=self.Controller:UnlinkEnt(g)if aa then if!self:GetOwner():KeyDown(IN_SPEED)then self:SetStage(0)end;self.HasLinked=true;WireLib.AddNotify(f,"Unlinked entity: "..tostring(g).." from the "..self.Name,NOTIFY_GENERIC,5)else WireLib.AddNotify(f,ab||"That entity is not linked to the "..self.Name,NOTIFY_ERROR,5,NOTIFYSOUND_DRIP3)end;return aa end end;if!a4 then function TOOL:Think()if self.HasLinked then if!self:GetOwner():KeyDown(IN_SPEED)then self:SetStage(0)end;if self:GetStage()==0 then self.HasLinked=false end end;WireToolObj.Think(self)end end end;if SERVER then else net.Receive("WireLinkedEnts",function(ac)local a7=net.ReadEntity()local ad=net.ReadFloat()if IsValid(a7)then a7.WireLinkedEnts={Marks={},LastUpdated=ad}for b=1,net.ReadUInt(16)do local ae=net.ReadEntity()if IsValid(ae)then table.insert(a7.WireLinkedEnts.Marks,ae)end end end end)end;a()
--addons/!lpakr_out/lua/wire/stools/addressbus.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/adv_emarker.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/characterlcd.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/dataplug.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/egp.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/egp.lua:
WireToolSetup.setCategory("Visuals/Screens")WireToolSetup.open("egp","EGP v3","gmod_wire_egp",nil,"EGPs")TOOL.ClientConVar["model"]="models/kobilica/wiremonitorbig.mdl"TOOL.ClientConVar["type"]=1;TOOL.ClientConVar["createflat"]=1;TOOL.ClientConVar["weld"]=0;TOOL.ClientConVar["weldworld"]=0;TOOL.ClientConVar["freeze"]=1;TOOL.ClientConVar["emitter_usert"]=1;TOOL.ClientConVar["translucent"]=0;cleanup.Register("wire_egps")if CLIENT then language.Add("Tool.wire_egp.name","E2 Graphics Processor")language.Add("Tool.wire_egp.desc","EGP Tool")language.Add("Tool.wire_egp.left_0","Create EGP Screen/HUD/Emitter")language.Add("Tool.wire_egp.right_0","Link EGP HUD to vehicle")language.Add("Tool.wire_egp.reload_0","Open the Reload Menu for several lag fixing options")language.Add("Tool.wire_egp.1","Now right click a vehicle.")language.Add("sboxlimit_wire_egps","You've hit the EGP limit!")language.Add("Undone_wire_egp","Undone EGP")language.Add("Tool_wire_egp_createflat","Create flat to surface")language.Add("Tool_wire_egp_weld","Weld")language.Add("Tool_wire_egp_weldworld","Weld to world")language.Add("Tool_wire_egp_freeze","Freeze")language.Add("Tool_wire_egp_drawemitters","Draw emitters (Clientside)")language.Add("Tool_wire_egp_emitter_drawdist","Additional emitter draw distance (Clientside)")language.Add("Tool_wire_egp_emitter_usert","Use an RT for emitters (improves performance)")language.Add("Tool_wire_egp_translucent","Transparent background")end;WireToolSetup.SetupLinking(false,"vehicle")function TOOL:CheckHitOwnClass(a)return IsValid(a.Entity)&&a.Entity:GetClass()=="gmod_wire_egp_hud"end;TOOL.Reload=nil;if CLIENT then local b={}local c;local function d(e)e.GPU:FreeRT()e.GPU=GPULib.WireGPU(e)e:EGP_Update()end;local function f(e)if e then RunConsoleCommand("EGP_Request_Reload",e:EntIndex())else RunConsoleCommand("EGP_Request_Reload")end end;local function g()local h=vgui.Create("DFrame")h:SetSize(200,114)h:Center()h:ShowCloseButton(true)h:SetDraggable(false)h:SetTitle("EGP Reload Menu")h:SetDeleteOnClose(false)local i=200/2-4;local j=20;local k,l=2,200/2;local m=vgui.Create("DLabel",h)m:SetPos(k+2,24)m:SetText("Current Screen:")m:SizeToContents()local n=vgui.Create("DLabel",h)n:SetPos(l,24)n:SetText("All screens on map:")n:SizeToContents()local o=vgui.Create("DButton",h)o:SetText("RenderTarget")o:SetPos(k,40)o:SetSize(i,j)function o:DoClick()h:SetVisible(false)d(c)LocalPlayer():ChatPrint("[EGP] RenderTarget reloaded.")end;local p=vgui.Create("DButton",h)p:SetText("Objects")p:SetPos(k,65)p:SetSize(i,j)function p:DoClick()h:SetVisible(false)f(c)LocalPlayer():ChatPrint("[EGP] Requesting...")end;local q=vgui.Create("DButton",h)q:SetText("Both")q:SetPos(k,90)q:SetSize(i,j)function q:DoClick()h:SetVisible(false)if c:GetClass()=="gmod_wire_egp_hud"&&c:GetClass()=="gmod_wire_egp_emitter"then LocalPlayer():ChatPrint("[EGP] Entity does not have a RenderTarget")else d(c)LocalPlayer():ChatPrint("[EGP] RenderTarget reloaded.")end;LocalPlayer():ChatPrint("[EGP] Requesting object reload...")f(c)end;local r=vgui.Create("DButton",h)r:SetText("RenderTarget")r:SetPos(l,40)r:SetSize(i,j)function r:DoClick()h:SetVisible(false)local s=ents.FindByClass("gmod_wire_egp")for t,u in pairs(s)do d(u)end;LocalPlayer():ChatPrint("[EGP] RenderTargets reloaded on all screens on the map.")end;local v=vgui.Create("DButton",h)v:SetText("Objects")v:SetPos(l,65)v:SetSize(i,j)function v:DoClick()h:SetVisible(false)LocalPlayer():ChatPrint("[EGP] Requesting...")f()end;local w=vgui.Create("DButton",h)w:SetText("Both")w:SetPos(l,90)w:SetSize(i,j)function w:DoClick()h:SetVisible(false)local s=ents.FindByClass("gmod_wire_egp")for t,u in pairs(s)do d(u)end;LocalPlayer():ChatPrint("[EGP] RenderTargets reloaded on all screens on the map.")LocalPlayer():ChatPrint("[EGP] Requesting object reload...")f()end;h:MakePopup()h:SetVisible(false)b={Panel=h,SingleRender=o,SingleObjects=p,SingleBoth=q,AllRender=r,AllObjects=v,AllBoth=w}end;function TOOL:LeftClick(a)return!a.Entity||a.Entity&&!a.Entity:IsPlayer()end;function TOOL:Reload(a)if!b.Panel then g()end;b.Panel:SetVisible(true)if!EGP:ValidEGP(a.Entity)then b.SingleRender:SetEnabled(false)b.SingleObjects:SetEnabled(false)b.SingleBoth:SetEnabled(false)else c=a.Entity;if c:GetClass()=="gmod_wire_egp_hud"||c:GetClass()=="gmod_wire_egp_emitter"then b.SingleRender:SetEnabled(false)b.SingleBoth:SetEnabled(false)else b.SingleRender:SetEnabled(true)b.SingleBoth:SetEnabled(true)end;b.SingleObjects:SetEnabled(true)end end;function TOOL.BuildCPanel(x)if!EGP then return end;x:SetSpacing(10)x:SetName("E2 Graphics Processor")WireDermaExts.ModelSelect(x,"wire_egp_model",list.Get("WireScreenModels"),5)local y={}y.Label="Screen Type"y.MenuButton=0;y.Options={}y.Options.Screen={wire_egp_type=1}y.Options.HUD={wire_egp_type=2}y.Options.Emitter={wire_egp_type=3}x:AddControl("ComboBox",y)x:AddControl("Checkbox",{Label="#Tool_wire_egp_createflat",Command="wire_egp_createflat"})x:AddControl("Checkbox",{Label="#Tool_wire_egp_weld",Command="wire_egp_weld"})x:AddControl("Checkbox",{Label="#Tool_wire_egp_weldworld",Command="wire_egp_weldworld"})x:AddControl("Checkbox",{Label="#Tool_wire_egp_freeze",Command="wire_egp_freeze"})x:AddControl("Checkbox",{Label="#Tool_wire_egp_translucent",Command="wire_egp_translucent"})x:AddControl("Checkbox",{Label="#Tool_wire_egp_drawemitters",Command="wire_egp_drawemitters"})x:AddControl("Checkbox",{Label="#Tool_wire_egp_emitter_usert",Command="wire_egp_emitter_usert"})local z=vgui.Create("DNumSlider")z:SetText("#Tool_wire_egp_emitter_drawdist")z:SetConVar("wire_egp_emitter_drawdist")z:SetMin(0)z:SetMax(5000)z:SetDecimals(0)x:AddItem(z)end end;function TOOL:UpdateGhost(e,A)if!IsValid(e)then return end;local a=A:GetEyeTrace()if IsValid(a.Entity)&&a.Entity:IsPlayer()then e:SetNoDraw(true)return end;local B=self:GetClientNumber("type")if B==1 then e:SetAngles(self:GetAngle(a))self:SetPos(e,a)elseif B==2||B==3 then e:SetPos(a.HitPos+a.HitNormal*0.25)e:SetAngles(a.HitNormal:Angle()+Angle(90,0,0))end;e:SetNoDraw(false)end;function TOOL:Think()if self.HasLinked then if!self:GetOwner():KeyDown(IN_SPEED)then self:SetStage(0)end;if self:GetStage()==0 then self.HasLinked=false end end;local B=self:GetClientNumber("type")if!self.GhostEntity||!self.GhostEntity:IsValid()then local a=self:GetOwner():GetEyeTrace()self:MakeGhostEntity(Model("models/bull/dynamicbutton.mdl"),a.HitPos,a.HitNormal:Angle()+Angle(90,0,0))elseif!self.GhostEntity.Type||self.GhostEntity.Type!=B||self.GhostEntity.Type==1&&self.GhostEntity:GetModel()!=self:GetClientInfo("model")then if B==1 then self.GhostEntity:SetModel(self:GetClientInfo("model"))elseif B==2||B==3 then self.GhostEntity:SetModel("models/bull/dynamicbutton.mdl")end;self.GhostEntity.Type=B end;self:UpdateGhost(self.GhostEntity,self:GetOwner())end
--addons/!lpakr_out/lua/wire/stools/extbus.lua:
WireToolSetup.setCategory("Advanced")WireToolSetup.open("extbus","Data - Extended Bus","gmod_wire_extbus",nil,"Extended Buses")if CLIENT then language.Add("Tool.wire_extbus.name","Extended bus tool (Wire)")language.Add("Tool.wire_extbus.desc","Spawns an extended bus (programmable address bus)")TOOL.Information={{name="left",text="Create/Update extended bus"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar["model"]="models/jaanus/wiretool/wiretool_gate.mdl"function TOOL.BuildCPanel(a)WireDermaExts.ModelSelect(a,"wire_extbus_model",list.Get("Wire_gate_Models"),5)end
--addons/!lpakr_out/lua/wire/stools/graphics_tablet.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/hdd.lua:
WireToolSetup.setCategory("Advanced")WireToolSetup.open("hdd","Memory - Flash EEPROM","gmod_wire_hdd",nil,"Flash EEPROMs")if CLIENT then language.Add("Tool.wire_hdd.name","Flash (EEPROM) tool (Wire)")language.Add("Tool.wire_hdd.desc","Spawns flash memory. It is used for permanent storage of data (carried over sessions)")TOOL.Information={{name="left",text="Create/Update flash memory"}}WireToolSetup.setToolMenuIcon("icon16/database.png")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar["model"]="models/jaanus/wiretool/wiretool_gate.mdl"TOOL.ClientConVar["driveid"]=0;TOOL.ClientConVar["client_driveid"]=0;TOOL.ClientConVar["drivecap"]=128;TOOL.ClientConVar["packet_bandwidth"]=100;TOOL.ClientConVar["packet_rate"]=0.4;local function a(b,c,d)return"WireFlash\\"..(b||"UNKNOWN").."\\HDD"..c.."\\"..d..".txt"end;local function e(f)local g=0;local h=16;if tonumber(f)then g=tonumber(f)else local i=string.Explode("\n",f)if i[1]=="FLASH1"then g=tonumber(i[2])||0;h=32 end end;return g,h end;local function j(k)local l=k;local m={}local n=0;while string.len(l)>0 do local o=string.sub(l,1,24)l=string.sub(l,24,string.len(l))m[n]=tonumber(o)n=n+1 end;return m end;local function p(q)local l=""for r=0,#q-1 do local s=string.sub(tostring(q[r]),1,24)s=s..string.rep(" ",24-string.len(s))l=l..s end;return l end;function TOOL.BuildCPanel(t)t:AddControl("Header",{Text="#Tool.wire_hdd.name",Description="#Tool.wire_hdd.desc"})local u=vgui.Create("DWireModelSelect")u:SetModelList(list.Get("Wire_gate_Models"),"wire_hdd_model")u:SetHeight(5)t:AddItem(u)t:AddControl("Slider",{Label="Drive ID",Type="Integer",Min="0",Max="3",Command="wire_hdd_driveid"})t:AddControl("Slider",{Label="Capacity (KB)",Type="Integer",Min="0",Max="128",Command="wire_hdd_drivecap"})t:AddControl("Label",{Text=""})t:AddControl("Label",{Text="Flash memory manager"})t:AddControl("Slider",{Label="Server drive ID",Type="Integer",Min="0",Max="3",Command="wire_hdd_driveid"})t:AddControl("Slider",{Label="Client drive ID",Type="Integer",Min="0",Max="99",Command="wire_hdd_client_driveid"})local v=vgui.Create("DButton",t)t:AddPanel(v)v:SetText("Download server drive to client drive")v.DoClick=function()RunConsoleCommand("wire_hdd_download",GetConVarNumber("wire_hdd_driveid"))end;t:AddControl("Button",{Text="Upload client drive to server drive",Command="wire_hdd_upload"})local v=vgui.Create("DButton",t)t:AddPanel(v)v:SetText("Clear server drive")v.DoClick=function()RunConsoleCommand("wire_hdd_clearhdd",GetConVarNumber("wire_hdd_driveid"))end;t:AddControl("Button",{Text="Clear client drive",Command="wire_hdd_clearhdd_client"})end
--addons/!lpakr_out/lua/wire/stools/input.lua:
WireToolSetup.setCategory("Input, Output/Keyboard Interaction")WireToolSetup.open("input","Numpad Input","gmod_wire_input",nil,"Numpad Inputs")if CLIENT then language.Add("tool.wire_input.name","Input Tool (Wire)")language.Add("tool.wire_input.desc","Spawns a input for use with the wire system.")language.Add("WireInputTool_keygroup","Key:")language.Add("WireInputTool_toggle","Toggle")language.Add("WireInputTool_value_on","Value On:")language.Add("WireInputTool_value_off","Value Off:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/beer/wiremod/numpad.mdl",modelsize="",keygroup=7,toggle=0,value_off=0,value_on=1}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_input")WireToolHelpers.MakeModelSizer(a,"wire_input_modelsize")ModelPlug_AddToCPanel(a,"Numpad","wire_input",true)a:AddControl("Numpad",{Label="#WireInputTool_keygroup",Command="wire_input_keygroup"})a:CheckBox("#WireInputTool_toggle","wire_input_toggle")a:NumSlider("#WireInputTool_value_on","wire_input_value_on",-10,10,1)a:NumSlider("#WireInputTool_value_off","wire_input_value_off",-10,10,1)end
--addons/!lpakr_out/lua/wire/stools/locator.lua:
WireToolSetup.setCategory("Detection/Beacon")WireToolSetup.open("locator","Locator","gmod_wire_locator",nil,"Locators")if CLIENT then language.Add("Tool.wire_locator.name","Locator Beacon Tool (Wire)")language.Add("Tool.wire_locator.desc","Spawns a locator beacon for use with the wire system.")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(30)TOOL.ClientConVar={model="models/props_lab/powerbox02d.mdl",createflat=1}function TOOL.BuildCPanel(a)ModelPlug_AddToCPanel(a,"Misc_Tools","wire_locator")a:CheckBox("#Create Flat to Surface","wire_locator_createflat")end
--addons/!lpakr_out/lua/wire/stools/motor.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/numpad.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/oscilloscope.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/plug.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/ranger.lua:
WireToolSetup.setCategory("Detection")WireToolSetup.open("ranger","Ranger","gmod_wire_ranger",nil,"Rangers")if CLIENT then language.Add("Tool.wire_ranger.name","Ranger Tool (Wire)")language.Add("Tool.wire_ranger.desc","Spawns a ranger for use with the wire system.")language.Add("Tool.wire_ranger.range","Range:")language.Add("Tool.wire_ranger.default_zero","Default to zero")language.Add("Tool.wire_ranger.show_beam","Show Beam")language.Add("Tool.wire_ranger.ignore_world","Ignore world")language.Add("Tool.wire_ranger.trace_water","Hit water")language.Add("Tool.wire_ranger.out_dist","Output Distance")language.Add("Tool.wire_ranger.out_pos","Output Position")language.Add("Tool.wire_ranger.out_vel","Output Velocity")language.Add("Tool.wire_ranger.out_ang","Output Angle")language.Add("Tool.wire_ranger.out_col","Output Color")language.Add("Tool.wire_ranger.out_val","Output Value")language.Add("Tool.wire_ranger.out_sid","Output SteamID(number)")language.Add("Tool.wire_ranger.out_uid","Output UniqueID")language.Add("Tool.wire_ranger.out_eid","Output Entity+EntID")language.Add("Tool.wire_ranger.out_hnrm","Output HitNormal")language.Add("Tool.wire_ranger.hires","High Resolution")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(10)TOOL.ClientConVar={model="models/jaanus/wiretool/wiretool_range.mdl",range=1500,default_zero=1,show_beam=1,ignore_world=0,trace_water=0,out_dist=1,out_pos=0,out_vel=0,out_ang=0,out_col=0,out_val=0,out_sid=0,out_uid=0,out_eid=0,out_hnrm=0,hires=0}function TOOL.BuildCPanel(a)ModelPlug_AddToCPanel(a,"Laser_Tools","wire_ranger")a:NumSlider("#Tool.wire_ranger.range","wire_ranger_range",1,1000,2)a:CheckBox("#Tool.wire_ranger.default_zero","wire_ranger_default_zero")a:CheckBox("#Tool.wire_ranger.show_beam","wire_ranger_show_beam")a:CheckBox("#Tool.wire_ranger.ignore_world","wire_ranger_ignore_world")a:CheckBox("#Tool.wire_ranger.trace_water","wire_ranger_trace_water")a:CheckBox("#Tool.wire_ranger.out_dist","wire_ranger_out_dist")a:CheckBox("#Tool.wire_ranger.out_pos","wire_ranger_out_pos")a:CheckBox("#Tool.wire_ranger.out_vel","wire_ranger_out_vel")a:CheckBox("#Tool.wire_ranger.out_ang","wire_ranger_out_ang")a:CheckBox("#Tool.wire_ranger.out_col","wire_ranger_out_col")a:CheckBox("#Tool.wire_ranger.out_val","wire_ranger_out_val")a:CheckBox("#Tool.wire_ranger.out_sid","wire_ranger_out_sid")a:CheckBox("#Tool.wire_ranger.out_uid","wire_ranger_out_uid")a:CheckBox("#Tool.wire_ranger.out_eid","wire_ranger_out_eid")a:CheckBox("#Tool.wire_ranger.out_hnrm","wire_ranger_out_hnrm")a:CheckBox("#Tool.wire_ranger.hires","wire_ranger_hires")end
--addons/!lpakr_out/lua/wire/stools/rom.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/rt_screen.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/screen.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/teleporter.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/watersensor.lua:
WireToolSetup.setCategory("Detection")WireToolSetup.open("watersensor","Water Sensor","gmod_wire_watersensor",nil,"Water Sensors")if CLIENT then language.Add("Tool.wire_watersensor.name","Water Sensor Tool (Wire)")language.Add("Tool.wire_watersensor.desc","Spawns a constant Water Sensor prop for use with the wire system.")language.Add("WireWatersensorTool_watersensor","Water Sensor:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/beer/wiremod/watersensor.mdl",modelsize=""}function TOOL.BuildCPanel(a)WireToolHelpers.MakeModelSizer(a,"wire_watersensor_modelsize")ModelPlug_AddToCPanel(a,"WaterSensor","wire_watersensor")end
--addons/!lpakr_out/lua/weapons/sup_b2.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dc12u/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dc15le.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_ddc.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.AimPos=Vector(-3.245,-5,1.6)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,-12,-10)SWEP.SprintAng=Vector(50,0,5)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;SWEP.PrintName='DDC Defender'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.Akimbo=true;SWEP.AmmoOffset=Vector(20,-3,-2)SWEP.AmmoOffsetAng=Angle(-20,-90,90)SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.SprintingEnabled=false;SWEP.IgnoreReloadSound=true;SWEP.NormalHoldType='revolver'SWEP.RunHoldType='normal'SWEP.FireModes={'semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=2;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/bf/v_defender_sporting_pistol.mdl'SWEP.WorldModel='models/galactic/weapons/bf/w_defender_sporting_pistol.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=25;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=false;SWEP.FireDelay=.13;SWEP.FireSound=Sound'blaster.de10_fire'SWEP.Recoil=1;SWEP.RecoilAngle=Angle(-5,0,0)SWEP.HipSpread=0.05;SWEP.AimSpread=0.005;SWEP.VelocitySensitivity=5;SWEP.MaxSpreadInc=0;SWEP.SpreadPerShot=0;SWEP.SpreadCooldown=0;SWEP.Shots=1;SWEP.Damage=40;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,180,0)
--addons/!lpakr_out/lua/weapons/sup_detonator/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dl44.lua:
debug.Trace()
--addons/!lpakr_out/lua/weapons/sup_dlt19.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.RestPos=Vector(0,-1,0)SWEP.AimPos=Vector(0,-1,0.5)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-3,1.15)SWEP.SprintAng=Vector(-35,30,-20)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.PrintName='DLT-19'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewModelFOV=75;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.Akimbo=false;SWEP.AmmoOffset=Vector(30,-2,-5)SWEP.AmmoOffsetAng=Angle(0,-90,90)SWEP.CanPenetrate=false;SWEP.PlayBackRate=5;SWEP.PlayBackRateSV=5;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/dlt19.mdl'SWEP.WorldModel='models/weapons/w_dlt19.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=140;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.12;SWEP.FireSound=Sound'blaster.fire'SWEP.RecoilAngle=Angle(-1.2,0,0)SWEP.HipSpread=.03;SWEP.AimSpread=.02;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.25;SWEP.SpreadCooldown=0.1;SWEP.Shots=1;SWEP.Damage=30;SWEP.DeployTime=1;SWEP.FadeCrosshairOnAim=false;SWEP.UIPosition=Vector(-5,-40,0)SWEP.UIAngle=Angle(0,90,0)SWEP.ShowHands=false;function SWEP:BulletCallback(a,b,c)if CLIENT then return end;if!b.HitWorld||math.random()>.2 then return end;local d=b.HitNormal:Dot(Vector(0,0,1))if d!=1 then return end;local e=ents.FindInSphere(b.HitPos,50)for f,g in ipairs(e)do if!g:IsNPC()||g.WasSuppressed&&g.NextSuppression>CurTime()then continue end;if math.random()>.75 then continue end;g:SetSaveValue('m_bShouldPatrol',false)g:SendSchedule(SCHED_BACK_AWAY_FROM_ENEMY)g.NextSuppression=CurTime()+2;break end end
--addons/!lpakr_out/lua/weapons/sup_dlt20a.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_ee4.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_emplauncher.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_grenade_dioxis.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_grenade_shield.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_grenade_sticky.lua:
AddCSLuaFile()SWEP.Base='weapon_grenadebase'SWEP.PrintName='Sticky Grenade'SWEP.Author='Scott'SWEP.Purpose='It\'s a sticky situation heheheh'SWEP.Category='SUP Weapons'SWEP.Spawnable=true;SWEP.Cooldown=1;SWEP.HoldType='grenade'SWEP.GrenadeEnt='rp_grenade_sticky'SWEP.WorldMaterial='models/weapons/v_models/grenades/virus_grenade'SWEP.ViewMaterial='models/weapons/v_models/grenades/virus_grenade'SWEP.Sticky=true;SWEP.Range=25;SWEP.Damage=120
--addons/!lpakr_out/lua/weapons/sup_hotsonsniper.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_rt97c.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.PrintName='RT-97C'SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(0,-1,0)SWEP.AimPos=Vector(-4.725,-16,.635)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,-10,-1)SWEP.SprintAng=Vector(-15,40,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.SkinSlotId=1;SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=true;SWEP.ZoomAmount=5;SWEP.AdjustableZoom=true;SWEP.MinZoom=15;SWEP.MaxZoom=45;SWEP.ZoomSteps=2;SWEP.ScopeOverrideMaterialIndex=5;SWEP.ScopeFOV=10;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=false;SWEP.ScopedBlur=false;SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=1;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(20,-1,-3)SWEP.PlayBackRate=3;SWEP.PlayBackRateSV=3;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.CanPenetrate=true;SWEP.HasScope=true;SWEP.FadeCrosshairOnAim=true;SWEP.PreventQuickScoping=true;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto','semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/rt97c.mdl'SWEP.WorldModel='models/galactic/weapons/wmodels/rt97c.mdl'SWEP.ViewModelFOV=80;SWEP.Spawnable=true;SWEP.AdminSpawnable=false;SWEP.Primary.ClipSize=200;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=.09;SWEP.Recoil=3;SWEP.RecoilAngle=Angle(-1.25,0,0)SWEP.RecoilProneAngle=Angle(-0.5,.03,0)SWEP.HipDivRecoil=Vector(.045,.05,.05)SWEP.RecoilSpeed=12;SWEP.SpeedDec=30;SWEP.HipSpread=0.02;SWEP.AimSpread=1;SWEP.VelocitySensitivity=0;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.007;SWEP.SpreadCooldown=0.13;SWEP.Shots=1;SWEP.Damage=38;SWEP.DeployTime=3;SWEP.ShowHands=true;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,90,0)function SWEP:AdjustMouseSensitivity()if self:GetOwner():Crouching()||self:GetOwner():IsProne()then local a=math.Clamp(cvar.GetValue('weapon_aimsense_sniper')||1,0,1)return a>0&&a||.7 end end
--addons/!lpakr_out/lua/weapons/sup_scattergun.lua:
debug.Trace()
--addons/!lpakr_out/lua/weapons/sup_shax.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_z6.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swb_base/cl_rendericon.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_baton.lua:
AddCSLuaFile()SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.PrintName="Baton"SWEP.Author="code_gs, scott, DarkRP"SWEP.Contact=""SWEP.Purpose=""SWEP.IconLetter=""SWEP.Spawnable=false;SWEP.AdminSpawnable=false;SWEP.AdminOnly=true;SWEP.Slot=3;SWEP.SlotPos=1;SWEP.ViewModelFOV=62;SWEP.ViewModelFlip=false;SWEP.AnimPrefix="stunstick"SWEP.StickColor=Color(255,255,255)SWEP.ViewModel=Model("models/weapons/v_stunbaton.mdl")SWEP.WorldModel=Model("models/weapons/w_stunbaton.mdl")SWEP.Sound=Sound("weapons/stunstick/stunstick_swing1.wav")SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo=''SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=0;SWEP.Secondary.Automatic=false;SWEP.Secondary.Ammo=''SWEP.Melee={DotRange=0.70721,HullRadius=1.732,TestHull=Vector(16,16,16),Mask=MASK_SHOT_HULL}function SWEP:Initialize()self:SetHoldType('normal')end;function SWEP:SetupDataTables()self:NetworkVar('Bool',1,"SeqIdling")self:NetworkVar('Float',1,"SeqIdleTime")self:NetworkVar('Float',2,"HoldTypeChangeTime")end;function SWEP:Deploy()self:SetHoldType("normal")local a=self:GetOwner():GetViewModel()if!IsValid(a)then return true end;a:SendViewModelMatchingSequence(a:LookupSequence("idle01"))return true end;function SWEP:ResetStick(b)if!IsValid(self:GetOwner())||!b&&(!IsValid(self:GetOwner():GetActiveWeapon())||self:GetOwner():GetActiveWeapon():GetClass()!=self:GetClass())then return end;self:SetSeqIdling(false)self:SetSeqIdleTime(0)self:SetHoldTypeChangeTime(0)end;function SWEP:Holster()if CLIENT then self.hasShot=false end;if!IsValid(self:GetOwner())then return true end;self:ResetStick(false)return true end;function SWEP:OnRemove()self:ResetStick(true)end;function SWEP:Think()if self:GetSeqIdling()then self:SetSeqIdling(false)if!IsValid(self:GetOwner())then return end;self:GetOwner():SetAnimation(PLAYER_ATTACK1)self:EmitSound(self.Sound)local a=self:GetOwner():GetViewModel()if!IsValid(a)then return end;a:SendViewModelMatchingSequence(a:LookupSequence("attackch"))a:SetPlaybackRate(1+1/3)local c=CurTime()+a:SequenceDuration()/a:GetPlaybackRate()self:SetSeqIdleTime(c)self:SetNextPrimaryFire(c)end;if self:GetSeqIdleTime()!=0&&CurTime()>=self:GetSeqIdleTime()then self:SetSeqIdleTime(0)if!IsValid(self:GetOwner())then return end;local a=self:GetOwner():GetViewModel()if!IsValid(a)then return end;a:SendViewModelMatchingSequence(a:LookupSequence("idle01"))end;if self:GetHoldTypeChangeTime()!=0&&CurTime()>=self:GetHoldTypeChangeTime()then self:SetHoldTypeChangeTime(0)self:SetHoldType("normal")end end;function SWEP:PrimaryAttack()self:DoMelee()self:SetNextPrimaryFire(CurTime()+0.51)if!SERVER then return end;local d=self:GetOwner()if!IsValid(d)then return end;local e=self:GetTrace()local f=e&&e.Entity;if!IsValid(f)then return end;if f:GetClass()=='rp_ragdoll'then f=f:GetPlayer()end;if!f.IsPlayer||!f:IsPlayer()then return end;local g=!f:IsWanted()if g&&!d:KeyDown(IN_USE)then srp.notif.Warning(d,4,term.Get('PersonNotWanted'))return end;local h=f:GetAllegianceID()if h!='CIVILIAN'&&d:GetAllegianceID()!=h then return end;local i,j=srp.jail.Arrest(d,f,g)if i&&isnumber(j)then self:Notify(d,4,term.Get'PlayerWasJailed',f:Nick(),math.Round(j/60))elseif i then self:Notify(d,4,term.Get'PlayerSentBackToJail',f:Nick())end end;function SWEP:SecondaryAttack()self:DoMelee()self:SetNextSecondaryFire(CurTime()+0.51)if!SERVER then return end;local d=self:GetOwner()if!IsValid(d)then return end;local e=self:GetTrace()if!e||!e.Entity:IsPlayer()then return end;local f=e.Entity;if srp.jail.Release(d,f)then srp.notif.Success(d,4,term.Get'PlayerJailReleased')elseif f:IsWanted()then f:SetWanted(d,false)end end;function SWEP:Notify(d,...)srp.notif.Neutral(d,...)end;function SWEP:DoMelee()self:SetHoldType("melee")self:SetHoldTypeChangeTime(CurTime()+0.3)local a=self:GetOwner():GetViewModel()if IsValid(a)then a:SendViewModelMatchingSequence(a:LookupSequence("idle01"))self:SetSeqIdling(true)end end;function SWEP:GetTrace()local k=self.Melee;local l=self:GetOwner()l:LagCompensation(true)local m=l:EyePos()local n=l:GetAimVector()local o=m+n*200;local p={start=m,endpos=o,mask=self.Melee.Mask,filter=l}local q=util.TraceLine(p)local r=q.Fraction==1;if r then p.endpos=o-n*k.HullRadius;p.mins=-k.TestHull;p.maxs=k.TestHull;p.output=q;util.TraceHull(p)r=q.Fraction==1||q.Entity==NULL;if!r then local s=q.Entity:GetPos()-m;s:Normalize()if s:Dot(n)<k.DotRange then q.Fraction=1;q.Entity=NULL;r=true else util.FindHullIntersection(p,q)r=q.Fraction==1||q.Entity==NULL end end else r=q.Entity==NULL end;l:LagCompensation(false)return q end
--addons/!lpakr_out/lua/weapons/weapon_bowcaster.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_combo_fists.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_cuffs.lua:
AddCSLuaFile()SWEP.PrintName='Cuffs'SWEP.Author='Scott'SWEP.HoldType='normal'SWEP.Category='SUP Weapons'SWEP.UseHands=false;SWEP.Slot=2;SWEP.SlotPos=5;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.WorldModel=''SWEP.Primary.Damage=0;SWEP.Primary.NumShots=0;SWEP.Primary.Cone=0;SWEP.Primary.Delay=0;SWEP.Primary.ClipSize=0;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.Primary.Ammo='none'SWEP.Primary.TakeAmmo=0;SWEP.Primary.Tracer=0;SWEP.Primary.TracerName='none'SWEP.Secondary.Ammo='none'SWEP.ViewModelFlip=false;SWEP.AnimPrefix='rpg'SWEP.DrawCrosshair=true;SWEP.Cooldown=3;SWEP.MaxDistance=80;function SWEP:Deploy()return true end;function SWEP:Initialize()self:SetHoldType(self.HoldType)self.DrawAmmo=false end;function SWEP:PrimaryAttack()self:SetNextPrimaryFire(CurTime()+self.Cooldown)self:SetNextSecondaryFire(CurTime()+self.Cooldown)end;function SWEP:SecondaryAttack()self:SetNextPrimaryFire(CurTime()+self.Cooldown)self:SetNextSecondaryFire(CurTime()+self.Cooldown)end;function SWEP:Holster()if!SERVER then return true end;local a=self:GetOwner()a:DrawViewModel(true)a:DrawWorldModel(true)return true end;function SWEP:Reload()if!IsFirstTimePredicted()then return end;if self.NextReload&&self.NextReload>CurTime()then return end;self.NextReload=CurTime()+2;local b=self:GetOwner()local c=b:GetEyeTraceNoCursor()if SERVER&&c.HitWorld then self:TryMove(b,c.HitPos,c.HitNormal)return end;if CLIENT&&!c.HitWorld&&IsValid(c.Entity)&&c.Entity:IsPlayer()then self:ShowRose(c.Entity)end end;function SWEP:ShowRose(d)local e=d:IsCuffed()local f=d:IsCuffedLegs()srp.ui.Create('srp_commrose',function(g)g.cuffWeapon=self;g.cuffTarget=d;g:SetText'Handcuffs'g:AddOption('cuff',{name=e&&'Remove Cuffs'||'Cuff',background=col.white:Copy(),click=function(self,h)local d=h.cuffTarget;if!IsValid(d)then h:Close()return end;if d:IsCuffed()then srp.jail.TryUnCuff(d)else srp.jail.TryCuff(d)end;h:Close()end})g:AddOption('bindlegs',{name=f&&'Unbind Legs'||'Bind Legs',background=col.white:Copy(),click=function(self,h)local d=h.cuffTarget;if!IsValid(d)then h:Close()return end;if d:IsCuffedLegs()then srp.jail.TryUnCuffLegs(d)else srp.jail.TryCuffLegs(d)end;h:Close()end})g:AddOption('exit',{name='Quit',background=col.red:Copy(),click=function(self,h)h:Close()end})g:Complete()end)end;function SWEP:TryMove(a,i,j)local k=a.holdingplayer;if!IsValid(k)||k:GetPos():Distance(i)>800 then return end;srp.jail.MoveCuffedTo(a,i)end;function SWEP:DrawWorldModel()end;function SWEP:PreDrawViewModel(l)return true end;local m=Material('materials/galactic/ui/padlock.png','smooth noclamp')local n=Color(170,170,200)local o=300;local p=60;function SWEP:DrawHUD()local q='Cuffs Equipped'local r=n;local b=LocalPlayer()local s=b:GetEyeTraceNoCursor().Entity;if IsValid(s)&&s:IsPlayer()&&s:GetPos():Distance(b:GetPos())<self.MaxDistance then if s:IsCuffed()then q='Uncuff Player'r=col.red elseif!s:IsCuffed()then q='Cuff Player'r=col.green end end;surface.SetFont'ui_header.rb'local t=surface.GetTextSize(q)o=math.max(t+60,300)local u=ScrW()-o-5;local v=ScrH()-p-5;draw.Box(u,v,o,p,col.grey)surface.SetDrawColor(0,0,0,222)surface.DrawOutlinedRect(u,v,o,p,2)surface.SetMaterial(m)surface.SetDrawColor(r)surface.DrawTexturedRect(u+o-48,v+(p-48)/2,48,48)draw.DrawText(q,'ui_header.rb',u+o-52,v+5,r,TEXT_ALIGN_RIGHT)draw.DrawText('R to hold and control player','ui_header.rb',u+o-52,v+25,r,TEXT_ALIGN_RIGHT)end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_consular_leo.lua:
AddCSLuaFile()SWEP.Author='Robotboy655 + King David'SWEP.Category='SUP Custom Weapons'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel='models/weapons/v_crowbar.mdl'SWEP.WorldModel='models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl'SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo='none'SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo='none'SWEP.PrintName='Voidblade'SWEP.Class='weapon_lightsaber_consular_leo'SWEP.DualWielded=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.CanMoveWhileAttacking=true;SWEP.MaxForce=250;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.DamageType=DMG_DISSOLVE;SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb","Force Pull","Force Push","Force Repulse","Force Heal","Group Heal","Resurrect"}SWEP.UseForms={Arrogant={1,2,3}}SWEP.UseHilt=false;SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base='wos_adv_dual_lightsaber_base'
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dexter.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dual_consular.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dual_master.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_electrostaff.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David + Scott"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=2;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/galactic/weapons/electrostaff/electrostaff.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Electro Staff"SWEP.Class="weapon_lightsaber_electrostaff"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.MaxForce=225;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.IgnoreHiltCosmetic=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Repulse","Force Push","Force Pull","Saber Throw"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoBlade=true;SWEP.NoGlow=true;SWEP.UseHilt="models/galactic/weapons/electrostaff/electrostaff.mdl"SWEP.UseLength=40;SWEP.UseWidth=false;SWEP.UseColor=Color(255,50,255)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"SWEP.HolsterBone='forward'function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*-10+c:Up()*-6;c:RotateAroundAxis(c:Up(),45)return b,c end
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_event.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Event Lightsaber"SWEP.Class="weapon_lightsaber_event"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=300;SWEP.SaberBurnDamage=10;SWEP.MaxForce=250;SWEP.RegenSpeed=2;SWEP.CanKnockback=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb","Force Choke","Lightning Coil","Force Lightning","Saber Throw","Cloak"}SWEP.DevestatorList={}SWEP.UseHilt="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=Color(255,20,20)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_event_dual.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_knight.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_saberpike_storyz.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/b2_rocket/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/b2_rocket/shared.lua:
ENT.Type="anim"ENT.PrintName="High Explosive Anti-Tank RPG"ENT.Author="Generic Default"ENT.Contact="AIDS"ENT.Purpose="SPLODE"ENT.Instructions="LAUNCH"ENT.Spawnable=false;ENT.AdminSpawnable=false
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/base_srp/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/entity_helpers.lua:
if!istable(ENT)then return end;function ENT:PrintPoseParameters()for a=0,self:GetNumPoseParameters()-1 do local b,c=self:GetPoseParameterRange(a)print(self:GetPoseParameterName(a).." "..b.." / "..c)end end;function ENT:PrintAnimations()for a,d in pairs(self:GetSequenceList())do local e=self:GetSequenceActivity(a)if e!=-1 then print(a.." => "..d.." / "..e.." => "..self:GetSequenceActivityName(a))else print(a.." => "..d.." / -1")end end end;function ENT:PrintBones()for a=0,self:GetBoneCount()-1 do local f=self:GetBoneName(a)if f==nil then continue end;print(a.." => "..f)end end;function ENT:PrintAttachments()for a,g in ipairs(self:GetAttachments())do print(g.id.." => "..g.name)end end;function ENT:PrintBodygroups()for a,h in ipairs(self:GetBodyGroups())do print(h.id.." => "..h.name.." ("..h.num.." subgroups)")end end;function ENT:Timer(...)return self:DrG_Timer(...)end;function ENT:LoopTimer(...)return self:DrG_LoopTimer(...)end;function ENT:TraceLine(i,j)return self:DrG_TraceLine(i,j)end;function ENT:TraceHull(i,j)return self:DrG_TraceHull(i,j)end;function ENT:TraceLineRadial(k,l,j)return self:DrG_TraceLineRadial(k,l,j)end;function ENT:TraceHullRadial(k,l,j)return self:DrG_TraceHullRadial(k,l,j)end;function ENT:ScreenShake(m,n,o,p)return util.ScreenShake(self:GetPos(),m,n,o,p)end;function ENT:GetCooldown(q)local r=self:GetNW2Float("DrGBaseCooldowns/"..tostring(q),false)if r!=false then return math.Clamp(r-CurTime(),0,math.huge)else return 0 end end;function ENT:NetMessage(q,...)return net.DrG_Send("DrGBaseEntMessage",q,self,...)end;function ENT:_HandleNetMessage()end;function ENT:OnNetMessage()end;if SERVER then else local function s(q,self,...)if!IsValid(self)then return end;if isfunction(self._HandleNetMessage)&&isfunction(self.OnNetMessage)then if q=="DrGBaseCallOnClient"then local t,u=table.DrG_Pack(...)local v=table.remove(t,1)if isfunction(self[v])then self[v](self,table.DrG_Unpack(t,u-1))end elseif!self:_HandleNetMessage(q,...)then self:OnNetMessage(q,...)end else timer.DrG_Simple(engine.TickInterval(),s,q,self,...)end end;net.DrG_Receive("DrGBaseEntMessage",s)function ENT:NetCallback(q,w,...)if!isfunction(w)then return end;return net.DrG_UseCallback(q,function(...)if IsValid(self)then w(self,...)end end,self,...)end;function ENT:DynamicLight(x,p,y,z,A)return self:DrG_DynamicLight(x,p,y,z,A)end end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/detection.lua:
function ENT:GetSightFOV()return self:GetNW2Int("DrGBaseSightFOV")end;function ENT:GetSightRange()return self:GetNW2Int("DrGBaseSightRange")end;function ENT:GetSightLuminosityRange()return self:GetNW2Float("DrGBaseMinLuminosity"),self:GetNW2Float("DrGBaseMaxLuminosity")end;function ENT:IsBlind()if self.NoEyes then return true end;if self:GetCooldown("DrGBaseBlind")>0 then return true end;return self:GetSightFOV()<=0||self:GetSightRange()<=0 end;function ENT:GetHearingCoefficient()return self:GetNW2Int("DrGBaseHearingCoefficient")end;function ENT:IsDeaf()if self.NoEars then return true else return self:GetHearingCoefficient()<=0 end end;function ENT:_InitDetection()self._DrGBaseWasInSight={}if CLIENT then return end;self:SetSightFOV(self.SightFOV)self:SetSightRange(self.SightRange)self:SetSightLuminosityRange(self.MinLuminosity,self.MaxLuminosity)self:SetHearingCoefficient(self.HearingCoefficient)end;if SERVER then else function ENT:IsInSight(a,b)if IsValid(a)then return self:NetCallback("DrGBaseIsInSight",b,a)elseif isfunction(b)then b(self,false)end end;function ENT:WasInSight(a)if!IsValid(a)then return false end;self:IsInSight(a,function(self,c)if IsValid(a)then self._DrGBaseWasInSight[a]=c end end)return self._DrGBaseWasInSight[a]||false end end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/path.lua:
if CLIENT then return end;function ENT:_InitPath()self._DrGBaseNavAreaBlacklist={}end;function ENT:GetPath()if!self._DrGBasePath then self._DrGBasePath=Path("Follow")self._DrGBasePath:SetMinLookAheadDistance(300)return self._DrGBasePath else return self._DrGBasePath end end;function ENT:LastComputeSuccess()return self._DrGBaseLastComputeSuccess||false end;function ENT:LastComputeTime()local a=self:GetPath()if!IsValid(a)then return-1 end;return CurTime()-a:GetAge()end;function ENT:InvalidatePath()local a=self:GetPath()if!IsValid(a)then return end;return a:Invalidate()end;function ENT:DrawPath()local a=self:GetPath()if!IsValid(a)then return end;return a:Draw()end;function ENT:UpdatePath()local a=self:GetPath()if!IsValid(a)then return end;return a:Update(self)end;function ENT:ComputePath(b,c)local a=self:GetPath()if!IsValid(a)then return end;return a:Compute(self,b,c)end;function ENT:RefreshPath(c)local a=self:GetPath()if!IsValid(a)then return end;return a:Compute(self,a:GetEnd(),c)end;function ENT:BlacklistNavArea(d,e)self._DrGBaseNavAreaBlacklist[d:GetID()]=tobool(e)end;function ENT:IsNavAreaBlacklisted(d)return self._DrGBaseNavAreaBlacklist[d:GetID()]||false end;function ENT:BlacklistedNavAreas()local f={}for g,h in pairs(self._DrGBaseNavAreaBlacklist)do if h then table.insert(f,navmesh.GetNavAreaByID(g))end end;return f end;local i=false;function ENT:GetPathGenerator()return function(d,j,k,l,m)if!IsValid(j)then return 0 end;if self:IsNavAreaBlacklisted(d)then return-1 end;if!self.loco:IsAreaTraversable(d)then return-1 end;local n=0;if IsValid(k)then if!self.ClimbLadders then return-1 end;n=k:GetLength()elseif m>0 then n=m else n=j:GetCenter():Distance(d:GetCenter())end;local o=false;local p=j:GetCostSoFar()+n;local q=j:ComputeAdjacentConnectionHeightChange(d)if q>0 then if IsValid(k)then if!self.ClimbLaddersUp then return-1 end;if q<self.ClimbLaddersUpMinHeight then return-1 end;if q>self.ClimbLaddersUpMaxHeight then return-1 end;local r=self:OnComputePathLadderUp(j,d,k)if r>=0 then p=p+n*r else return-1 end elseif q<self.loco:GetStepHeight()then local r=self:OnComputePathStep(j,d,q)if r>=0 then p=p+n*r else return-1 end elseif i&&q<self.loco:GetJumpHeight()then local r=self:OnComputePathJump(j,d,q)if r>=0 then p=p+n*r else return-1 end elseif self.ClimbLedges then if q<self.ClimbLedgesMinHeight then return-1 end;if q>self.ClimbLedgesMaxHeight then return-1 end;local r=self:OnComputePathLedge(j,d,q)if r>=0 then p=p+n*r else return-1 end else return-1 end elseif q<0 then local s=-q;if IsValid(k)then if!self.ClimbLaddersDown then return-1 end;if s<self.ClimbLaddersDownMinHeight then return-1 end;if s>self.ClimbLaddersDownMaxHeight then return-1 end;local r=self:OnComputePathLadderDown(j,d,k)if r>=0 then p=p+n*r else return-1 end elseif s<self.loco:GetDeathDropHeight()then local r=self:OnComputePathDrop(j,d,s)if r>=0 then p=p+n*r else return-1 end else return-1 end else local r=self:OnComputePathFlat(j,d)if r>=0 then p=p+n*r else return-1 end end;if d:IsUnderwater()then local r=self:OnComputePathUnderwater(j,d)if r>=0 then p=p+n*r else return-1 end end;local r=self:OnComputePath(j,d)if r>=0 then return p+n*r else return-1 end end end;function ENT:OnComputePath(t,u)return 0 end;function ENT:OnComputePathLadderUp(t,u,k)return 1 end;function ENT:OnComputePathLadderDown(t,u,k)return 1 end;function ENT:OnComputePathLedge(t,u,q)return 1 end;function ENT:OnComputePathStep(t,u,q)return 0 end;function ENT:OnComputePathJump(t,u,q)return 1 end;function ENT:OnComputePathDrop(t,u,s)return 1 end;function ENT:OnComputePathFlat(t,u)return 0 end;function ENT:OnComputePathUnderwater(t,u)return 1 end;local v=FindMetaTable("PathFollower")DrGBase.OLD_Compute=DrGBase.OLD_Compute||v.Compute;function v:Compute(w,b,c)if w.IsDrGNextbot then if!isfunction(c)then c=w:GetPathGenerator()end;w._DrGBaseLastComputeSuccess=DrGBase.OLD_Compute(self,w,b,c)return w._DrGBaseLastComputeSuccess else return DrGBase.OLD_Compute(self,w,b,c)end end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/behaviours.lua:
function ENT:IsWaiting()return self:GetNW2Bool("DrGBaseWaiting")end;function ENT:IsJumping()return self:GetNW2Bool("DrGBaseJumping")end;function ENT:IsLeaping()return self:GetNW2Bool("DrGBaseLeaping")end;function ENT:IsGliding()return self:GetNW2Bool("DrGBaseGliding")end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/hooks.lua:
function ENT:LastHitGroup()return self:GetNW2Int("DrGBaseLastHitGroup",0)end;function ENT:_InitHooks()if CLIENT then return end;self._DrGBaseLastDmgInflicted={}self:DrG_AddListener("OnTraceAttack",self._HandleTraceAttack)self:DrG_AddListener("OnNavAreaChanged",self._HandleNavAreaChanged)self:DrG_AddListener("OnLeaveGround",self._HandleLeaveGround)self:DrG_AddListener("OnLandOnGround",self._HandleLandOnGround)end;if SERVER then else end
--addons/!lpakr_out/lua/entities/drgbase_nextbot_human/animations.lua:
ENT.Animations={PlayerModel={RunAnimations={["normal"]=ACT_HL2MP_RUN,["ar2"]=ACT_HL2MP_RUN_AR2,["camera"]=ACT_HL2MP_RUN_CAMERA,["crossbow"]=ACT_HL2MP_RUN_CROSSBOW,["duel"]=ACT_HL2MP_RUN_DUEL,["fist"]=ACT_HL2MP_RUN_FIST,["knife"]=ACT_HL2MP_RUN_KNIFE,["magic"]=ACT_HL2MP_RUN_MAGIC,["melee2"]=ACT_HL2MP_RUN_MELEE2,["passive"]=ACT_HL2MP_RUN_PASSIVE,["physgun"]=ACT_HL2MP_RUN_PHYSGUN,["revolver"]=ACT_HL2MP_RUN_REVOLVER,["rpg"]=ACT_HL2MP_RUN_RPG,["shotgun"]=ACT_HL2MP_RUN_SHOTGUN,["smg"]=ACT_HL2MP_RUN_SMG1,["grenade"]=ACT_HL2MP_RUN_GRENADE,["melee"]=ACT_HL2MP_RUN_MELEE,["pistol"]=ACT_HL2MP_RUN_PISTOL,["slam"]=ACT_HL2MP_RUN_SLAM},WalkAnimations={["normal"]=ACT_HL2MP_WALK,["ar2"]=ACT_HL2MP_WALK_AR2,["camera"]=ACT_HL2MP_WALK_CAMERA,["crossbow"]=ACT_HL2MP_WALK_CROSSBOW,["duel"]=ACT_HL2MP_WALK_DUEL,["fist"]=ACT_HL2MP_WALK_FIST,["knife"]=ACT_HL2MP_WALK_KNIFE,["magic"]=ACT_HL2MP_WALK_MAGIC,["melee2"]=ACT_HL2MP_WALK_MELEE2,["passive"]=ACT_HL2MP_WALK_PASSIVE,["physgun"]=ACT_HL2MP_WALK_PHYSGUN,["revolver"]=ACT_HL2MP_WALK_REVOLVER,["rpg"]=ACT_HL2MP_WALK_RPG,["shotgun"]=ACT_HL2MP_WALK_SHOTGUN,["smg"]=ACT_HL2MP_WALK_SMG1,["grenade"]=ACT_HL2MP_WALK_GRENADE,["melee"]=ACT_HL2MP_WALK_MELEE,["pistol"]=ACT_HL2MP_WALK_PISTOL,["slam"]=ACT_HL2MP_WALK_SLAM},IdleAnimations={["normal"]=ACT_HL2MP_IDLE,["ar2"]=ACT_HL2MP_IDLE_AR2,["camera"]=ACT_HL2MP_IDLE_CAMERA,["crossbow"]=ACT_HL2MP_IDLE_CROSSBOW,["duel"]=ACT_HL2MP_IDLE_DUEL,["fist"]=ACT_HL2MP_IDLE_FIST,["knife"]=ACT_HL2MP_IDLE_KNIFE,["magic"]=ACT_HL2MP_IDLE_MAGIC,["melee2"]=ACT_HL2MP_IDLE_MELEE2,["passive"]=ACT_HL2MP_IDLE_PASSIVE,["physgun"]=ACT_HL2MP_IDLE_PHYSGUN,["revolver"]=ACT_HL2MP_IDLE_REVOLVER,["rpg"]=ACT_HL2MP_IDLE_RPG,["shotgun"]=ACT_HL2MP_IDLE_SHOTGUN,["smg"]=ACT_HL2MP_IDLE_SMG1,["grenade"]=ACT_HL2MP_IDLE_GRENADE,["melee"]=ACT_HL2MP_IDLE_MELEE,["pistol"]=ACT_HL2MP_IDLE_PISTOL,["slam"]=ACT_HL2MP_IDLE_SLAM},CrouchWalkAnimations={["normal"]=ACT_HL2MP_WALK_CROUCH,["ar2"]=ACT_HL2MP_WALK_CROUCH_AR2,["camera"]=ACT_HL2MP_WALK_CROUCH_CAMERA,["crossbow"]=ACT_HL2MP_WALK_CROUCH_CROSSBOW,["duel"]=ACT_HL2MP_WALK_CROUCH_DUEL,["fist"]=ACT_HL2MP_WALK_CROUCH_FIST,["knife"]=ACT_HL2MP_WALK_CROUCH_KNIFE,["magic"]=ACT_HL2MP_WALK_CROUCH_MAGIC,["melee2"]=ACT_HL2MP_WALK_CROUCH_MELEE2,["passive"]=ACT_HL2MP_WALK_CROUCH_PASSIVE,["physgun"]=ACT_HL2MP_WALK_CROUCH_PHYSGUN,["revolver"]=ACT_HL2MP_WALK_CROUCH_REVOLVER,["rpg"]=ACT_HL2MP_WALK_CROUCH_RPG,["shotgun"]=ACT_HL2MP_WALK_CROUCH_SHOTGUN,["smg"]=ACT_HL2MP_WALK_CROUCH_SMG1,["grenade"]=ACT_HL2MP_WALK_CROUCH_GRENADE,["melee"]=ACT_HL2MP_WALK_CROUCH_MELEE,["pistol"]=ACT_HL2MP_WALK_CROUCH_PISTOL,["slam"]=ACT_HL2MP_WALK_CROUCH_SLAM},CrouchIdleAnimations={["normal"]=ACT_HL2MP_IDLE_CROUCH,["ar2"]=ACT_HL2MP_IDLE_CROUCH_AR2,["camera"]=ACT_HL2MP_IDLE_CROUCH_CAMERA,["crossbow"]=ACT_HL2MP_IDLE_CROUCH_CROSSBOW,["duel"]=ACT_HL2MP_IDLE_CROUCH_DUEL,["fist"]=ACT_HL2MP_IDLE_CROUCH_FIST,["knife"]=ACT_HL2MP_IDLE_CROUCH_KNIFE,["magic"]=ACT_HL2MP_IDLE_CROUCH_MAGIC,["melee2"]=ACT_HL2MP_IDLE_CROUCH_MELEE2,["passive"]=ACT_HL2MP_IDLE_CROUCH_PASSIVE,["physgun"]=ACT_HL2MP_IDLE_CROUCH_PHYSGUN,["revolver"]=ACT_HL2MP_IDLE_CROUCH_REVOLVER,["rpg"]=ACT_HL2MP_IDLE_CROUCH_RPG,["shotgun"]=ACT_HL2MP_IDLE_CROUCH_SHOTGUN,["smg"]=ACT_HL2MP_IDLE_CROUCH_SMG1,["grenade"]=ACT_HL2MP_IDLE_CROUCH_GRENADE,["melee"]=ACT_HL2MP_IDLE_CROUCH_MELEE,["pistol"]=ACT_HL2MP_IDLE_CROUCH_PISTOL,["slam"]=ACT_HL2MP_IDLE_CROUCH_SLAM},JumpAnimations={["normal"]=ACT_HL2MP_JUMP_KNIFE,["ar2"]=ACT_HL2MP_JUMP_AR2,["camera"]=ACT_HL2MP_JUMP_CAMERA,["crossbow"]=ACT_HL2MP_JUMP_CROSSBOW,["duel"]=ACT_HL2MP_JUMP_DUEL,["fist"]=ACT_HL2MP_JUMP_FIST,["knife"]=ACT_HL2MP_JUMP_KNIFE,["magic"]=ACT_HL2MP_JUMP_MAGIC,["melee2"]=ACT_HL2MP_JUMP_MELEE2,["passive"]=ACT_HL2MP_JUMP_PASSIVE,["physgun"]=ACT_HL2MP_JUMP_PHYSGUN,["revolver"]=ACT_HL2MP_JUMP_REVOLVER,["rpg"]=ACT_HL2MP_JUMP_RPG,["shotgun"]=ACT_HL2MP_JUMP_SHOTGUN,["smg"]=ACT_HL2MP_JUMP_SMG1,["grenade"]=ACT_HL2MP_JUMP_GRENADE,["melee"]=ACT_HL2MP_JUMP_MELEE,["pistol"]=ACT_HL2MP_JUMP_PISTOL,["slam"]=ACT_HL2MP_JUMP_SLAM},ShootAnimations={["normal"]=ACT_HL2MP_GESTURE_RANGE_ATTACK,["ar2"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,["camera"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_CAMERA,["crossbow"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW,["duel"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL,["fist"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST,["knife"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,["magic"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_MAGIC,["melee2"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2,["passive"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PASSIVE,["physgun"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PHYSGUN,["revolver"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER,["rpg"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG,["shotgun"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN,["smg"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1,["grenade"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,["melee"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE,["pistol"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,["slam"]=ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM},ReloadAnimations={["normal"]=ACT_HL2MP_GESTURE_RELOAD,["ar2"]=ACT_HL2MP_GESTURE_RELOAD_AR2,["camera"]=ACT_HL2MP_GESTURE_RELOAD_CAMERA,["crossbow"]=ACT_HL2MP_GESTURE_RELOAD_CROSSBOW,["duel"]=ACT_HL2MP_GESTURE_RELOAD_DUEL,["fist"]=ACT_HL2MP_GESTURE_RELOAD_FIST,["knife"]=ACT_HL2MP_GESTURE_RELOAD_KNIFE,["magic"]=ACT_HL2MP_GESTURE_RELOAD_MAGIC,["melee2"]=ACT_HL2MP_GESTURE_RELOAD_MELEE2,["passive"]=ACT_HL2MP_GESTURE_RELOAD_PASSIVE,["physgun"]=ACT_HL2MP_GESTURE_RELOAD_PHYSGUN,["revolver"]=ACT_HL2MP_GESTURE_RELOAD_REVOLVER,["rpg"]=ACT_HL2MP_GESTURE_RELOAD_RPG,["shotgun"]=ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,["smg"]=ACT_HL2MP_GESTURE_RELOAD_SMG1,["grenade"]=ACT_HL2MP_GESTURE_RELOAD_GRENADE,["melee"]=ACT_HL2MP_GESTURE_RELOAD_MELEE,["pistol"]=ACT_HL2MP_GESTURE_RELOAD_PISTOL,["slam"]=ACT_HL2MP_GESTURE_RELOAD_SLAM}},NPCModel={RunAnimations={["normal"]=ACT_RUN,["ar2"]=ACT_HL2MP_RUN_AR2,["camera"]=ACT_HL2MP_RUN_CAMERA,["crossbow"]=ACT_HL2MP_RUN_CROSSBOW,["duel"]=ACT_HL2MP_RUN_DUEL,["fist"]=ACT_HL2MP_RUN_FIST,["knife"]=ACT_HL2MP_RUN_KNIFE,["magic"]=ACT_HL2MP_RUN_MAGIC,["melee2"]=ACT_HL2MP_RUN_MELEE2,["passive"]=ACT_HL2MP_RUN_PASSIVE,["physgun"]=ACT_HL2MP_RUN_PHYSGUN,["revolver"]=ACT_HL2MP_RUN_REVOLVER,["rpg"]=ACT_HL2MP_RUN_RPG,["shotgun"]=ACT_HL2MP_RUN_SHOTGUN,["smg"]=ACT_HL2MP_RUN_SMG1,["grenade"]=ACT_HL2MP_RUN_GRENADE,["melee"]=ACT_HL2MP_RUN_MELEE,["pistol"]=ACT_HL2MP_RUN_PISTOL,["slam"]=ACT_HL2MP_RUN_SLAM},WalkAnimations={["normal"]=ACT_WALK,["ar2"]=ACT_HL2MP_WALK_AR2,["camera"]=ACT_HL2MP_WALK_CAMERA,["crossbow"]=ACT_HL2MP_WALK_CROSSBOW,["duel"]=ACT_HL2MP_WALK_DUEL,["fist"]=ACT_HL2MP_WALK_FIST,["knife"]=ACT_HL2MP_WALK_KNIFE,["magic"]=ACT_HL2MP_WALK_MAGIC,["melee2"]=ACT_HL2MP_WALK_MELEE2,["passive"]=ACT_HL2MP_WALK_PASSIVE,["physgun"]=ACT_HL2MP_WALK_PHYSGUN,["revolver"]=ACT_HL2MP_WALK_REVOLVER,["rpg"]=ACT_HL2MP_WALK_RPG,["shotgun"]=ACT_HL2MP_WALK_SHOTGUN,["smg"]=ACT_HL2MP_WALK_SMG1,["grenade"]=ACT_HL2MP_WALK_GRENADE,["melee"]=ACT_HL2MP_WALK_MELEE,["pistol"]=ACT_HL2MP_WALK_PISTOL,["slam"]=ACT_HL2MP_WALK_SLAM},CrouchWalkAnimations={["normal"]=ACT_WALK_CROUCH,["ar2"]=ACT_HL2MP_WALK_CROUCH_AR2,["camera"]=ACT_HL2MP_WALK_CROUCH_CAMERA,["crossbow"]=ACT_HL2MP_WALK_CROUCH_CROSSBOW,["duel"]=ACT_HL2MP_WALK_CROUCH_DUEL,["fist"]=ACT_HL2MP_WALK_CROUCH_FIST,["knife"]=ACT_HL2MP_WALK_CROUCH_KNIFE,["magic"]=ACT_HL2MP_WALK_CROUCH_MAGIC,["melee2"]=ACT_HL2MP_WALK_CROUCH_MELEE2,["passive"]=ACT_HL2MP_WALK_CROUCH_PASSIVE,["physgun"]=ACT_HL2MP_WALK_CROUCH_PHYSGUN,["revolver"]=ACT_HL2MP_WALK_CROUCH_REVOLVER,["rpg"]=ACT_HL2MP_WALK_CROUCH_RPG,["shotgun"]=ACT_HL2MP_WALK_CROUCH_SHOTGUN,["smg"]=ACT_HL2MP_WALK_CROUCH_SMG1,["grenade"]=ACT_HL2MP_WALK_CROUCH_GRENADE,["melee"]=ACT_HL2MP_WALK_CROUCH_MELEE,["pistol"]=ACT_HL2MP_WALK_CROUCH_PISTOL,["slam"]=ACT_HL2MP_WALK_CROUCH_SLAM},IdleAnimations={["normal"]=ACT_IDLE,["ar2"]=ACT_HL2MP_IDLE_AR2,["camera"]=ACT_HL2MP_IDLE_CAMERA,["crossbow"]=ACT_HL2MP_IDLE_CROSSBOW,["duel"]=ACT_HL2MP_IDLE_DUEL,["fist"]=ACT_HL2MP_IDLE_FIST,["knife"]=ACT_HL2MP_IDLE_KNIFE,["magic"]=ACT_HL2MP_IDLE_MAGIC,["melee2"]=ACT_HL2MP_IDLE_MELEE2,["passive"]=ACT_HL2MP_IDLE_PASSIVE,["physgun"]=ACT_HL2MP_IDLE_PHYSGUN,["revolver"]=ACT_HL2MP_IDLE_REVOLVER,["rpg"]=ACT_HL2MP_IDLE_RPG,["shotgun"]=ACT_HL2MP_IDLE_SHOTGUN,["smg"]=ACT_HL2MP_IDLE_SMG1,["grenade"]=ACT_HL2MP_IDLE_GRENADE,["melee"]=ACT_HL2MP_IDLE_MELEE,["pistol"]=ACT_HL2MP_IDLE_PISTOL,["slam"]=ACT_HL2MP_IDLE_SLAM},CrouchIdleAnimations={["normal"]=ACT_CROUCHIDLE,["ar2"]=ACT_HL2MP_IDLE_CROUCH_AR2,["camera"]=ACT_HL2MP_IDLE_CROUCH_CAMERA,["crossbow"]=ACT_HL2MP_IDLE_CROUCH_CROSSBOW,["duel"]=ACT_HL2MP_IDLE_CROUCH_DUEL,["fist"]=ACT_HL2MP_IDLE_CROUCH_FIST,["knife"]=ACT_HL2MP_IDLE_CROUCH_KNIFE,["magic"]=ACT_HL2MP_IDLE_CROUCH_MAGIC,["melee2"]=ACT_HL2MP_IDLE_CROUCH_MELEE2,["passive"]=ACT_HL2MP_IDLE_CROUCH_PASSIVE,["physgun"]=ACT_HL2MP_IDLE_CROUCH_PHYSGUN,["revolver"]=ACT_HL2MP_IDLE_CROUCH_REVOLVER,["rpg"]=ACT_HL2MP_IDLE_CROUCH_RPG,["shotgun"]=ACT_HL2MP_IDLE_CROUCH_SHOTGUN,["smg"]=ACT_HL2MP_IDLE_CROUCH_SMG1,["grenade"]=ACT_HL2MP_IDLE_CROUCH_GRENADE,["melee"]=ACT_HL2MP_IDLE_CROUCH_MELEE,["pistol"]=ACT_HL2MP_IDLE_CROUCH_PISTOL,["slam"]=ACT_HL2MP_IDLE_CROUCH_SLAM},JumpAnimations={["normal"]=ACT_JUMP,["ar2"]=ACT_HL2MP_JUMP_AR2,["camera"]=ACT_HL2MP_JUMP_CAMERA,["crossbow"]=ACT_HL2MP_JUMP_CROSSBOW,["duel"]=ACT_HL2MP_JUMP_DUEL,["fist"]=ACT_HL2MP_JUMP_FIST,["knife"]=ACT_HL2MP_JUMP_KNIFE,["magic"]=ACT_HL2MP_JUMP_MAGIC,["melee2"]=ACT_HL2MP_JUMP_MELEE2,["passive"]=ACT_HL2MP_JUMP_PASSIVE,["physgun"]=ACT_HL2MP_JUMP_PHYSGUN,["revolver"]=ACT_HL2MP_JUMP_REVOLVER,["rpg"]=ACT_HL2MP_JUMP_RPG,["shotgun"]=ACT_HL2MP_JUMP_SHOTGUN,["smg"]=ACT_HL2MP_JUMP_SMG1,["grenade"]=ACT_HL2MP_JUMP_GRENADE,["melee"]=ACT_HL2MP_JUMP_MELEE,["pistol"]=ACT_HL2MP_JUMP_PISTOL,["slam"]=ACT_HL2MP_JUMP_SLAM},ReloadAnimations={["normal"]=ACT_HL2MP_GESTURE_RELOAD,["ar2"]=ACT_HL2MP_GESTURE_RELOAD_AR2,["camera"]=ACT_HL2MP_GESTURE_RELOAD_CAMERA,["crossbow"]=ACT_HL2MP_GESTURE_RELOAD_CROSSBOW,["duel"]=ACT_HL2MP_GESTURE_RELOAD_DUEL,["fist"]=ACT_HL2MP_GESTURE_RELOAD_FIST,["knife"]=ACT_HL2MP_GESTURE_RELOAD_KNIFE,["magic"]=ACT_HL2MP_GESTURE_RELOAD_MAGIC,["melee2"]=ACT_HL2MP_GESTURE_RELOAD_MELEE2,["passive"]=ACT_HL2MP_GESTURE_RELOAD_PASSIVE,["physgun"]=ACT_HL2MP_GESTURE_RELOAD_PHYSGUN,["revolver"]=ACT_HL2MP_GESTURE_RELOAD_REVOLVER,["rpg"]=ACT_HL2MP_GESTURE_RELOAD_RPG,["shotgun"]=ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,["smg"]=ACT_HL2MP_GESTURE_RELOAD_SMG1,["grenade"]=ACT_HL2MP_GESTURE_RELOAD_GRENADE,["melee"]=ACT_HL2MP_GESTURE_RELOAD_MELEE,["pistol"]=ACT_HL2MP_GESTURE_RELOAD_PISTOL,["slam"]=ACT_HL2MP_GESTURE_RELOAD_SLAM}}}ENT.Animations.NPCModel=table.merge(ENT.Animations.PlayerModel,ENT.Animations.NPCModel)
--addons/!lpakr_out/lua/entities/dronesrewrite_camera/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/ent_lightsaber.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="base_anim"ENT.PrintName="Lightsaber"ENT.Category="Robotboy655's Entities"ENT.Editable=true;ENT.Spawnable=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WepDamageBoost=0;function ENT:SetupDataTables()self:NetworkVar("Float",0,"BladeLength")self:NetworkVar("Float",1,"BladeWidth",{KeyName="BladeWidth",Edit={type="Float",category="Blade",min=2,max=4,order=1}})self:NetworkVar("Float",2,"MaxLength",{KeyName="MaxLength",Edit={type="Float",category="Blade",min=32,max=64,order=2}})self:NetworkVar("Bool",0,"Enabled")self:NetworkVar("Bool",1,"DarkInner",{KeyName="DarkInner",Edit={type="Boolean",category="Blade",order=3}})self:NetworkVar("Vector",0,"CrystalColorVector",{KeyName="CrystalColorVector",Edit={type="VectorColor",category="Hilt",order=4}})end;function ENT:Initialize()if SERVER then else self:SetRenderBounds(Vector(-self:GetBladeLength(),-128,-128),Vector(self:GetBladeLength(),128,128))language.Add(self.ClassName,self.PrintName)end end;function ENT:OnEnabled()if CLIENT then return end;if self:WaterLevel()>2 then return end;self:EmitSound(self.OnSound)self.SoundLoop=CreateSound(self,Sound(self.LoopSound))if self.SoundLoop then self.SoundLoop:Play()end;self.SoundSwing=CreateSound(self,Sound(self.SwingSound))if self.SoundSwing then self.SoundSwing:Play()self.SoundSwing:ChangeVolume(0,0)end;self.SoundHit=CreateSound(self,Sound("lightsaber/saber_hit.wav"))if self.SoundHit then self.SoundHit:Play()self.SoundHit:ChangeVolume(0,0)end end;function ENT:OnDisabled(a)if CLIENT then if a then rb655_SaberClean(self:EntIndex())end;return end;self:EmitSound(self.OffSound)if self.SoundLoop then self.SoundLoop:Stop()self.SoundLoop=nil end;if self.SoundSwing then self.SoundSwing:Stop()self.SoundSwing=nil end;if self.SoundHit then self.SoundHit:Stop()self.SoundHit=nil end end;function ENT:OnEnabledOrDisabldd(b,c,d)if c==d then return end;if d then self:OnEnabled()else self:OnDisabled()end end;function ENT:OnRemove()self:OnDisabled(true)end;function ENT:GetSaberPosAng(e,f)e=e||1;local g=self:LookupAttachment("blade"..e)if f then g=self:LookupAttachment("quillon"..e)end;if g>0 then local h=self:GetAttachment(g)return h.Pos,h.Ang:Forward()end;return self:LocalToWorld(Vector(1,-0.58,-0.25)),-self:GetAngles():Forward()end;function ENT:Draw()self:DrawModel()if halo.RenderedEntity&&IsValid(halo.RenderedEntity())&&halo.RenderedEntity()==self then return end;local i=self:GetCrystalColor()*255;local j=false;local k=0;for l,m in pairs(self:GetAttachments())do if!string.match(m.name,"blade(%d+)")&&!string.match(m.name,"quillon(%d+)")then continue end;local n=string.match(m.name,"blade(%d+)")local o=string.match(m.name,"quillon(%d+)")if n&&self:LookupAttachment("blade"..n)>0 then k=k+1;local p,q=self:GetSaberPosAng(n)rb655_RenderBlade(p,q,self:GetBladeLength(),self:GetMaxLength(),self:GetBladeWidth(),i,self:GetDarkInner(),self:EntIndex(),self:WaterLevel()>2,false,k,self.NoGlow)j=true end;if o&&self:LookupAttachment("quillon"..o)>0 then k=k+1;local p,q=self:GetSaberPosAng(o,true)rb655_RenderBlade(p,q,self:GetBladeLength(),self:GetMaxLength(),self:GetBladeWidth(),i,self:GetDarkInner(),self:EntIndex(),self:WaterLevel()>2,true,k,self.NoGlow)end end;if!j then local p,q=self:GetSaberPosAng()rb655_RenderBlade(p,q,self:GetBladeLength(),self:GetMaxLength(),self:GetBladeWidth(),i,self:GetDarkInner(),self:EntIndex(),self:WaterLevel()>2,nil,nil,self.NoGlow)end end;if CLIENT then return end;function ENT:OnTakeDamage(r)self:TakePhysicsDamage(r)end;function ENT:Think()if!self:GetEnabled()&&self:GetBladeLength()!=0 then self:SetBladeLength(math.Approach(self:GetBladeLength(),0,2))elseif self:GetEnabled()&&self:GetBladeLength()!=self:GetMaxLength()then self:SetBladeLength(math.Approach(self:GetBladeLength(),self:GetMaxLength(),8))end;if self:GetEnabled()&&self:WaterLevel()>2 then self:SetEnabled(false)end;if self:GetBladeLength()<=0 then if self.SoundSwing then self.SoundSwing:ChangeVolume(0,0)end;if self.SoundLoop then self.SoundLoop:ChangeVolume(0,0)end;if self.SoundHit then self.SoundHit:ChangeVolume(0,0)end;return end;local p,s=self:GetSaberPosAng()local t=self:BladeThink(p,s)if self:LookupAttachment("blade2")>0 then local u,v=self:GetSaberPosAng(2)local w=self:BladeThink(u,v)t=t||w end;if self.SoundHit then if t then self.SoundHit:ChangeVolume(math.Rand(0.1,0.5),0)else self.SoundHit:ChangeVolume(0,0)end end;if self.SoundSwing then if self.LastAng!=s then self.LastAng=self.LastAng||s;self.SoundSwing:ChangeVolume(math.Clamp(s:Distance(self.LastAng)/2,0,1),0)end;self.LastAng=s end;if self.SoundLoop then local p=p+s*self:GetBladeLength()if self.LastPos!=p then self.LastPos=self.LastPos||p;self.SoundLoop:ChangeVolume(0.1+math.Clamp(p:Distance(self.LastPos)/32,0,0.2),0)end;self.LastPos=p end;self:NextThink(CurTime()+0.1)return true end;function ENT:BladeThink(x,q)local y=util.TraceHull({start=x,endpos=x+q*self:GetBladeLength(),filter=self})if y.Hit then rb655_DrawHit(y.HitPos,y.HitNormal)rb655_LS_DoDamage(y,self)end;return y.Hit end;function ENT:Use(z,A,B,C)if!IsValid(z)||!z:KeyPressed(IN_USE)then return end;if self:WaterLevel()>2 then return end;self:SetEnabled(!self:GetEnabled())end;function ENT:SpawnFunction(D,E)if!E.Hit||!D:CheckLimit("ent_lightsabers")then return end;local F=D:GetInfo("rb655_lightsaber_model")if!file.Exists(F,"GAME")then return end;local G=ents.Create(ClassName)G:SetPos(E.HitPos+E.HitNormal*2)local s=D:EyeAngles()s.p=0;s:RotateAroundAxis(s:Right(),180)G:SetAngles(s)G:SetMaxLength(math.Clamp(D:GetInfoNum("rb655_lightsaber_bladel",42),32,64))G:SetCrystalColorVector(Vector(D:GetInfo("rb655_lightsaber_red"),D:GetInfo("rb655_lightsaber_green"),D:GetInfo("rb655_lightsaber_blue"))/255)G:SetDarkInner(D:GetInfo("rb655_lightsaber_dark")=="1")G:SetModel(F)G:SetBladeWidth(math.Clamp(D:GetInfoNum("rb655_lightsaber_bladew",2),2,4))G.LoopSound=D:GetInfo("rb655_lightsaber_humsound")G.SwingSound=D:GetInfo("rb655_lightsaber_swingsound")G.OnSound=D:GetInfo("rb655_lightsaber_onsound")G.OffSound=D:GetInfo("rb655_lightsaber_offsound")G:Spawn()G:Activate()G:SetOwner(D)G.Color=G:GetColor()local H=G:GetPhysicsObject()if IsValid(H)then H:Wake()end;if IsValid(D)then D:AddCount("ent_lightsabers",G)D:AddCleanup("ent_lightsabers",G)end;return G end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gambling_machine_base/cl_init.lua:
dash.IncludeSH'shared.lua'surface.CreateFont('3d2d',{font='Tahoma',size=130,weight=1700,shadow=true,antialias=true})local a='Be a winner'local b=20;local c=col.red;local d=col.green;local e=CreateMaterial('gambling_scanlines','UnlitGeneric',{['$basetexture']='dev/dev_scanline',['$translucent']=1,['$additive']=1,['$vertexcolor']='1',['$vertexalpha']='1',['Proxies']={['TextureScroll']={['texturescrollvar']='$baseTextureTransform',['texturescrollrate']=.1,['texturescrollangle']=-90}}})e:Recompute()function ENT:DrawInteraction(f)surface.SetFont('ui_header.r')surface.SetDrawColor(255,255,255,255)surface.SetMaterial(f.OnPickup)surface.SetTextColor(255,255,255,255)local g,h=surface.GetTextSize(a)g=g+b+4;local i,j=(ScrW()-b)/2,(ScrH()-(b+20))*.75;surface.DrawTexturedRect(i,j,b,b)surface.SetTextPos(i+b+2,j-4)surface.DrawText(a)end;local k=Material('materials/galactic/ui/alert.png','smooth noclamp')function ENT:DrawDefcon()local l=srp.defcon.status||6;if l>4 then return end;draw.RoundedBox(64,-1800,-1600,3700,605,col.grey_dark)draw.DrawText('DEFCON '..l,'ui_header.xxxl',-1100,-1550,col.white,TEXT_ALIGN_LEFT)draw.DrawText('MACHINE DISABLED. THE SHIP NEEDS YOUR HELP!','ui_header.xxl',-1100,-1300,col.white,TEXT_ALIGN_LEFT)surface.SetDrawColor(200,200,200,25)surface.SetMaterial(e)surface.DrawTexturedRect(-2550,-2000,5125,1400)surface.SetDrawColor(255,255,255,255)surface.SetMaterial(k)surface.DrawTexturedRect(-1700,-1550,512,512)return true end;function ENT:Draw(m)self:DrawModel()local n=self:GetPos()local o=self:GetTransforms()cam.Start3D2D(self:LocalToWorld(o.OffsetPos),self:LocalToWorldAngles(o.OffsetAng),o.Scale)draw.Box(o.X,o.Y,o.W,o.H,self.BackgroundColor)if!self:DrawDefcon()then if self.BackgroundMaterial then surface.SetDrawColor(255,255,255,255)surface.SetMaterial(self.BackgroundMaterial)surface.DrawTexturedRect(-840,-1900,1600,1225)end;self:DrawScreen()surface.SetDrawColor(200,200,200,35)surface.SetMaterial(e)surface.DrawTexturedRect(o.X,o.Y,o.W,o.H)if isPayingOut then local p=SysTime()*5;draw.NoTexture()surface.SetDrawColor(255,255,255,255)surface.DrawArc(-250,-770,41,46,p*180,p*180+180,5)draw.SimpleText('TRANSFERRING...','ui_header.xl',0,-800,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)end end;cam.End3D2D()end;function ENT:DrawScreen()end;function ENT:PlayerUse()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gambling_machine_fiftyfifty/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gmod_balloon.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_gmodentity")ENT.Spawnable=false;function ENT:Initialize()if CLIENT then return end;self:PhysicsInit(SOLID_VPHYSICS)local a=self:GetPhysicsObject()if IsValid(a)then a:SetMass(100)a:Wake()a:EnableGravity(false)end;self:SetForce(1)self:StartMotionController()end;function ENT:SetForce(b)self.Force=b*5000;self:SetOverlayText("Force: "..math.floor(b))end;function ENT:OnTakeDamage(c)if self.Indestructible then return end;local d=self:GetColor()local e=EffectData()e:SetOrigin(self:GetPos())e:SetStart(Vector(d.r,d.g,d.b))util.Effect("balloon_pop",e)if self.Explosive then local e=EffectData()e:SetOrigin(self:GetPos())e:SetScale(1)e:SetMagnitude(25)util.Effect("Explosion",e,true,true)end;self:Remove()end;function ENT:PhysicsSimulate(a,f)local g=Vector(0,0,self.Force)*f;local h=Vector(0,0,0)return h,g,SIM_GLOBAL_FORCE end
--addons/!lpakr_out/lua/entities/gmod_wire_adv_emarker.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Adv Wire Entity Marker"ENT.Author="Divran"ENT.WireDebugName="Adv EMarker"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Marks={}local a={"Entities [ARRAY]","Nr"}for b=3,12 do a[b]="Entity"..b-2 .." [ENTITY]"end;self.Inputs=WireLib.CreateInputs(self,{"Entity (This entity will be added or removed once the other two inputs are changed) [ENTITY]","Add Entity (Change to non-zero value to add the entity specified by the 'Entity' input)","Remove Entity (Change to non-zero value to remove the entity specified by the 'Entity' input)","Clear Entities (Removes all entities from the marker)"})self.Outputs=WireLib.CreateOutputs(self,a)self:SetOverlayText("Number of entities linked: 0")end;function ENT:TriggerInput(c,d)if c=="Entity"then if IsValid(d)then self.Target=d end elseif c=="Add Entity"then if IsValid(self.Target)then if d!=0 then local e,f=self:CheckEnt(self.Target)if!e then self:LinkEnt(self.Target)end end end elseif c=="Remove Entity"then if IsValid(self.Target)then if d!=0 then local e,f=self:CheckEnt(self.Target)if e then self:UnlinkEnt(self.Target)end end end elseif c=="Clear Entities"then self:ClearEntities()end end;function ENT:UpdateOutputs()WireLib.TriggerOutput(self,"Entities",self.Marks)WireLib.TriggerOutput(self,"Nr",#self.Marks)for b=3,12 do WireLib.TriggerOutput(self,"Entity"..b-2,self.Marks[b-2])end;self:SetOverlayText("Number of entities linked: "..#self.Marks)WireLib.SendMarks(self)end;function ENT:CheckEnt(g)for f,h in pairs(self.Marks)do if h==g then return true,f end end;return false,0 end;function ENT:LinkEnt(g)if self:CheckEnt(g)then return false end;self.Marks[#self.Marks+1]=g;g:CallOnRemove("AdvEMarker.Unlink",function(g)self:UnlinkEnt(g)end)self:UpdateOutputs()return true end;function ENT:UnlinkEnt(g)local e,f=self:CheckEnt(g)if e then table.remove(self.Marks,f)self:UpdateOutputs()end;return e end;function ENT:ClearEntities()for b=1,#self.Marks do if self.Marks[b]:IsValid()then self.Marks[b]:RemoveCallOnRemove("AdvEMarker.Unlink")end end;self.Marks={}self:UpdateOutputs()end;function ENT:OnRemove()self:ClearEntities()end;duplicator.RegisterEntityClass("gmod_wire_adv_emarker",WireLib.MakeWireEnt,"Data")function ENT:BuildDupeInfo()local i=BaseClass.BuildDupeInfo(self)||{}if next(self.Marks)then local j={}for f,h in pairs(self.Marks)do j[f]=h:EntIndex()end;i.marks=j end;return i end;function ENT:ApplyDupeInfo(k,g,i,l)BaseClass.ApplyDupeInfo(self,k,g,i,l)if i.marks then self.Marks=self.Marks||{}for f,m in pairs(i.marks)do local g=l(m)self.Marks[f]=g;g:CallOnRemove("AdvEMarker.Unlink",function(g)if IsValid(self)then self:UnlinkEnt(g)end end)end;self:UpdateOutputs()end end
--addons/!lpakr_out/lua/entities/gmod_wire_clutch.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_damage_detector.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_dataport.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_dynamic_button.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_forcer.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/fx_emitter_default.lua:
AddCSLuaFile()local function a(b,c)local d=EffectData()d:SetOrigin(b)d:SetNormal(c:Forward()*2)d:SetMagnitude(1)d:SetScale(1)d:SetRadius(2)util.Effect("Sparks",d)end;AddFXEmitterEffect("small_sparks",a,"Sparks (Small)")local function a(b,c)local d=EffectData()d:SetOrigin(b)d:SetNormal(c:Forward()*2)d:SetMagnitude(2)d:SetScale(1)d:SetRadius(6)util.Effect("Sparks",d)end;AddFXEmitterEffect("sparks",a,"Sparks")local function a(b,c)local d=EffectData()d:SetOrigin(b+c:Forward()*5)d:SetAngles(c)d:SetScale(1)util.Effect("MuzzleEffect",d)end;AddFXEmitterEffect("muzzle",a,"Muzzleflash")local function a(b,c)local d=EffectData()d:SetOrigin(b+c:Forward()*5)d:SetAngles(c)d:SetScale(2)util.Effect("MuzzleEffect",d)end;AddFXEmitterEffect("muzzlebig",a,"Muzzleflash (Big)")local function a(b,c)local d=EffectData()d:SetOrigin(b)util.Effect("BloodImpact",d)end;AddFXEmitterEffect("bloodimpact",a,"Blood Impact")local function a(b,c)local d=EffectData()d:SetOrigin(b)d:SetAngles(c)d:SetNormal(c:Forward()*2)d:SetMagnitude(1)d:SetScale(1)d:SetRadius(1)util.Effect("StriderBlood",d)end;AddFXEmitterEffect("striderblood",a,"Strider Blood")local function a(b,c)local d=EffectData()d:SetOrigin(b)d:SetAngles(c)util.Effect("ShotgunShellEject",d)end;AddFXEmitterEffect("shotgun shell",a,"Shotgun Shell")local function a(b,c)local d=EffectData()d:SetOrigin(b)d:SetAngles(c)util.Effect("RifleShellEject",d)end;AddFXEmitterEffect("rifle shell",a,"Rifle Shell")local function a(b,c)local d=EffectData()d:SetOrigin(b)d:SetAngles(c)util.Effect("ShellEject",d)end;AddFXEmitterEffect("pistol shell",a,"Pistol Shell")local function a(b,c)local d=EffectData()d:SetOrigin(b)d:SetAngles(c)d:SetNormal(c:Forward())util.Effect("MetalSpark",d)end;AddFXEmitterEffect("metalsparks",a,"Metal Sparks")local function a(b,c)local d=EffectData()d:SetOrigin(b)d:SetAngles(c)util.Effect("GlassImpact",d)end;AddFXEmitterEffect("glassimpact",a,"Glass Impact")
--addons/!lpakr_out/lua/entities/gmod_wire_indicator.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Indicator"ENT.WireDebugName="Indicator"ENT.RenderGroup=RENDERGROUP_BOTH;function ENT:GetFactorFromValue(a)return math.Clamp((a-self.a)/(self.b-self.a),0,1)end;function ENT:GetColorFromValue(a)local b=self:GetFactorFromValue(a,self)local c=math.Clamp((self.br-self.ar)*b+self.ar,0,255)local d=math.Clamp((self.bg-self.ag)*b+self.ag,0,255)local e=math.Clamp((self.bb-self.ab)*b+self.ab,0,255)local f=math.Clamp((self.ba-self.aa)*b+self.aa,0,255)return Color(c,d,e,f),b end;if CLIENT then local g=64;function ENT:GetWorldTipBodySize()return 400,80 end;local function h(i,j,k,l)surface.SetDrawColor(0,0,0)surface.DrawLine(i,j,i+k,j)surface.DrawLine(i+k,j,i+k,j+l)surface.DrawLine(i+k,j+l,i,j+l)surface.DrawLine(i,j+l,i,j)end;local function m(i,j,k,l,self)if self.a==self.b then draw.DrawText("Can't draw color bar because A == B","GModWorldtip",i+k/2,j+l/2,color_white,TEXT_ALIGN_CENTER)return end;local n=self.b-self.a;local o=math.abs(self.b)-math.abs(self.a)local p=n/50;local q=nil;for r=self.a,self.b-p/2,p do local s,b=self:GetColorFromValue(r)local t=math.floor(i+b*k)if!q then if n>=0&&r>=self.value then q=r elseif n<0&&r<self.value then q=r end end;surface.SetDrawColor(s.r,s.g,s.b,s.a)surface.DrawRect(t,j,math.ceil(k/50),l)end;if self.value==self.b then q=self.b end;h(i,j,k,l)if q then q=math.Clamp(q,math.min(self.a,self.b)+p/2,math.max(self.a,self.b)-p/2)local b=self:GetFactorFromValue(q)local t=math.floor(i+b*k)h(t-p/2,j-l*0.15,math.ceil(k/50),l*1.4)end end;function ENT:DrawWorldTipBody(u)local v=self:GetOverlayData()for w,x in pairs(v)do self[w]=x end;local y=string.format("A color: %d,%d,%d,%d\nA value: %d",self.ar,self.ag,self.ab,self.aa,self.a)draw.DrawText(y,"GModWorldtip",u.min.x+u.edgesize,u.min.y+u.edgesize,color_white,TEXT_ALIGN_LEFT)local y=string.format("B color: %d,%d,%d,%d\nB value: %d",self.br,self.bg,self.bb,self.ba,self.b)draw.DrawText(y,"GModWorldtip",u.max.x-u.edgesize,u.min.y+u.edgesize,color_white,TEXT_ALIGN_RIGHT)local b=math.Clamp((self.value-self.a)/(self.b-self.a),0,1)local y=string.format("%s (%d%%)",math.Round(self.value,2),b*100)local k,l=surface.GetTextSize(y)draw.DrawText(y,"GModWorldtip",u.center.x+40,u.min.y+u.edgesize+l,color_white,TEXT_ALIGN_RIGHT)m(u.min.x+u.edgesize,u.min.y+u.edgesize+46,401,16,self)end;return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.a=0;self.ar=0;self.ag=0;self.ab=0;self.aa=0;self.b=0;self.br=0;self.bg=0;self.bb=0;self.ba=0;self.Inputs=WireLib.CreateInputs(self,{"A"})self:SetRenderMode(RENDERMODE_TRANSALPHA)end;function ENT:Setup(f,z,A,B,C,e,D,E,F,G)self.a=f||0;self.ar=z||255;self.ag=A||0;self.ab=B||0;self.aa=C||255;self.b=e||1;self.br=D||0;self.bg=E||255;self.bb=F||0;self.ba=G||255;self:TriggerInput("A",self.a)end;function ENT:TriggerInput(H,a)if H=="A"then self:ShowOutput(a)local s=self:GetColorFromValue(a)self:SetColor(s)end end;function ENT:ShowOutput(a)self:SetOverlayData({a=self.a,b=self.b,ar=self.ar,ag=self.ag,ab=self.ab,aa=self.aa,br=self.br,bg=self.bg,bb=self.bb,ba=self.ba,value=a})end;duplicator.RegisterEntityClass("gmod_wire_indicator",WireLib.MakeWireEnt,"Data","a","ar","ag","ab","aa","b","br","bg","bb","ba")function MakeWire7Seg(I,J,K,L,f,z,A,B,C,e,D,E,F,G)if IsValid(I)&&!I:CheckLimit("wire_indicators")then return false end;local function M(N,O)local P,Q,R=unpack(N)R=Vector(0,R.x,-R.y)local J,K=LocalToWorld(R*O,Angle(),J,K),K+Q;local S=WireLib.MakeWireEnt(I,{Class="gmod_wire_indicator",Pos=J,Angle=K,Model=L,frozen=frozen,nocollide=nocollide},f,z,A,B,C,e,D,E,F,G)if IsValid(S)then S:SetNWString("WireName",P)duplicator.StoreEntityModifier(S,"WireName",{name=P})end;return S end;local T={{"G",Angle(0,0,0),Vector(0,0)},{"A",Angle(0,0,0),Vector(0,2)},{"B",Angle(0,0,90),Vector(1,1)},{"C",Angle(0,0,90),Vector(1,-1)},{"D",Angle(0,0,0),Vector(0,-2)},{"E",Angle(0,0,90),Vector(-1,-1)},{"F",Angle(0,0,90),Vector(-1,1)}}local U={}U[1]=M(T[1],0)local O=U[1]:OBBMaxs().y;for r=2,7 do U[r]=M(T[r],O)if!IsValid(U[r])then break end;for j=1,r-1 do const=constraint.Weld(U[r],U[j],0,0,0,true,true)end;U[r-1]:DeleteOnRemove(U[r])end;if U[7]then U[7]:DeleteOnRemove(U[1])end;return U end
--addons/!lpakr_out/lua/entities/gmod_wire_las_receiver.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_soundemitter.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_spawner.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_textreceiver.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_waypoint.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_weight.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/grenade_snowball.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Model="models/weapons/w_snowball.mdl"ENT.Decal="PaintSplatBlue"ENT.Sound="player/footsteps/snow5.wav"function ENT:Initialize()self:Precache()if CLIENT then return end;self:SetModel(self.Model)self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)self:SetMoveType(MOVETYPE_FLYGRAVITY)self:SetMoveCollide(MOVECOLLIDE_DEFAULT)self:SetSolid(SOLID_BBOX)self:SetCollisionBounds(Vector(-2,-2,-2),Vector(2,2,2))self:SetModelScale(self:GetModelScale()*1.5)self.LifeTime=CurTime()+5 end;function ENT:Precache()util.PrecacheModel(self.Model)util.PrecacheSound(self.Sound)end;function ENT:Think()if self.LifeTime&&self.LifeTime<CurTime()then self:Remove()self.Think=function()end end end;function ENT:Touch(a)if!a then return end;local b=self:GetPos()local c=self:GetVelocity():GetNormal()*64;self:EmitSound(self.Sound)self:Remove()if IsFirstTimePredicted()then local d=util.TraceLine({start=b,endpos=b+c,mask=MASK_SHOT,filter=self})util.Decal(self.Decal,d.HitPos+d.HitNormal,d.HitPos-d.HitNormal)local e=EffectData()e:SetStart(b)e:SetOrigin(b)e:SetScale(20)util.Effect("inflator_magic",e)util.Effect("GlassImpact",e)self:EmitSound(self.Sound)end end
--addons/!lpakr_out/lua/entities/ladder_small3/shared.lua:
return lpakr()()
--addons/ssrp_lfs/lua/entities/lvs_atrt/cl_prediction.lua:

function ENT:PredictPoseParamaters()
end
--addons/ssrp_lfs/lua/entities/lvs_base_starfighter/cl_flyby.lua:

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
--addons/ssrp_lfs/lua/entities/lvs_base_turret/cl_hud.lua:
ENT.IconEngine = Material( "lvs/engine.png" )

function ENT:LVSHudPaintInfoText( X, Y, W, H, ScrX, ScrY, ply )
	local kmh = math.Round(self:GetVelocity():Length() * 0.09144,0)
	draw.DrawText( "km/h ", "LVS_FONT", X + 72, Y + 35, color_white, TEXT_ALIGN_RIGHT )
	draw.DrawText( kmh, "LVS_FONT_HUD_LARGE", X + 72, Y + 20, color_white, TEXT_ALIGN_LEFT )

	if ply ~= self:GetDriver() then return end

	--[[local Throttle = self:GetThrottle()
	local Col = Throttle <= 1 and color_white or Color(0,0,0,255)
	local hX = X + W - H * 0.5
	local hY = Y + H * 0.25 + H * 0.25

	surface.SetMaterial( self.IconEngine )
	surface.SetDrawColor( 0, 0, 0, 200 )
	surface.DrawTexturedRectRotated( hX + 4, hY + 1, H * 0.5, H * 0.5, 0 )
	surface.SetDrawColor( color_white )
	surface.DrawTexturedRectRotated( hX + 2, hY - 1, H * 0.5, H * 0.5, 0 )

	if not self:GetEngineActive() then
		draw.SimpleText( "X" , "LVS_FONT",  hX, hY, Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	self:LVSDrawCircle( hX, hY, H * 0.35, math.min( Throttle, 1 ) )

	if Throttle > 1 then
		draw.SimpleText( "+"..math.Round((Throttle - 1) * 100,0).."%" , "LVS_FONT",  hX, hY, Col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end]]
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

--addons/ssrp_lfs/lua/entities/lvs_dwarfdroid/shared.lua:

ENT.Base = "lvs_walker_atte_hoverscript"

ENT.PrintName = "Dwarf Droid"
ENT.Author = "JohnyReaper"
ENT.Information = "Assault Walker of the CIS"
ENT.Category = "[LVS] - Johny's Star Wars"

ENT.Spawnable		= true
ENT.AdminSpawnable	= false

ENT.NoCosmetics = true

ENT.MDL = "models/macieg/starwars/spider.mdl"
ENT.GibModels = {
}

ENT.AITEAM = 2

ENT.MaxHealth = 1500

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.HoverHeight = 62.5
ENT.HoverTraceLength = 400
ENT.HoverHullRadius = 5

ENT.TurretTurnRate = 100

ENT.LAATC_PICKUPABLE = false
ENT.LAATC_DROP_IN_AIR = true
ENT.LAATC_PICKUP_POS = Vector(-220,0,-145)
ENT.LAATC_PICKUP_Angle = Angle(0,180,0)

ENT.CanMoveOn = {
	["func_door"] = true,
	["func_movelinear"] = true,
	["prop_physics"] = true,
}

ENT.lvsShowInSpawner = true

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "TurretEnt" )
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
	return {self}
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

function ENT:GetMainAimAngles()
	local trace = self:GetEyeTrace()

	local AimAngles = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld( Vector(0,0,100)) ):GetNormalized():Angle() )

	local ID = self:LookupAttachment( "barrel" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return AimAngles, trace.HitPos, false end

	local DirAng = self:WorldToLocalAngles( (trace.HitPos - self:GetDriverSeat():LocalToWorld( Vector(0,0,33) ) ):Angle() )

	-- print(DirAng.p)

	return AimAngles, trace.HitPos, (math.abs( DirAng.p ) < 30)-- and math.abs( DirAng.y ) < 80)
end

-- function ENT:GetAimAngles( ent, base, RearEnt )
-- 	local trace = self:GetEyeTrace()

-- 	local Pos = self:LocalToWorld( Vector(208,0,170) )
-- 	local wAng = (trace.HitPos - Pos):GetNormalized():Angle()

-- 	local _, Ang = WorldToLocal( Pos, wAng, Pos, self:LocalToWorldAngles( Angle(0,0,0) ) )

-- 	return Ang, trace.HitPos, (Ang.p < 30 and Ang.p > -10 and math.abs( Ang.y ) < 60)
-- end

function ENT:ShootBottomWep(ent)

	-- if (!self:GetTurretEnt()) then return end

	local ID1 = self:LookupAttachment( "barrel" )

	local Muzzle1 = self:GetAttachment( ID1 )

	if not Muzzle1 then return end

	local AimAngles, AimPos, InRange = ent:GetMainAimAngles()

	local Pos = Muzzle1.Pos
	local Dir = (AimPos - Pos):GetNormalized()

	if not InRange then return true end

	local bullet = {}
	bullet.Src 	= Pos
	bullet.Dir 	= Dir
	bullet.Spread 	= Vector( 0.01,  0.01, 0 )
	bullet.TracerName = "lvs_laser_red_short"
	bullet.Force	= 10
	bullet.HullSize 	= 30
	bullet.Damage	= 100
	bullet.SplashDamage = 200
	bullet.SplashDamageRadius = 200
	bullet.Velocity = 8000
	bullet.Attacker 	= ent:GetDriver()
	bullet.Callback = function(att, tr, dmginfo)
		local effectdata = EffectData()
			effectdata:SetStart( Vector(255,50,50) ) 
			effectdata:SetOrigin( tr.HitPos )
		util.Effect( "lvs_laser_explosion", effectdata )
	end
	ent:LVSFireBullet( bullet )

	local effectdata = EffectData()
	effectdata:SetStart( Vector(255,50,50) )
	effectdata:SetOrigin( bullet.Src )
	effectdata:SetNormal( Dir )
	effectdata:SetEntity( ent )
	util.Effect( "lvs_muzzle_colorable", effectdata )

	ent:TakeAmmo()

	-- self:GetTurretEnt():PlayAnimation( "idle" )

	if not IsValid( ent.SNDPrimary ) then return end

	ent.SNDPrimary:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )

end

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Ammo = 400
	weapon.Delay = 0.6
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.2
	weapon.Attack = function( ent )
		if ent:GetIsCarried() then ent:SetHeat( 0 ) return true end

		-- if (self:GetDriverGunAngles() == 1) then return end
		-- 	ent:GetDriver():PrintMessage( HUD_PRINTCENTER, "NAJPIERW WYŁĄCZ TRYB STACJONARNY ABY STRZELAĆ Z TEJ BRONI" )
		-- return end

		return self:ShootBottomWep(ent)

		
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if IsValid( base ) and base:GetIsCarried() then return end

		-- if (self:GetDriverGunAngles() == 1) then return end

		local AimAngles = ent:GetMainAimAngles()

		-- print(AimAngles)

		local p = math.Clamp(AimAngles.p, -25, 35)
		-- local y = math.Clamp(AimAngles.y, -78, 78)

		ent:ManipulateBoneAngles(2,Angle(AimAngles.y,0,0))
		ent:ManipulateBoneAngles(3,Angle(0,0,p))

	end

	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )

	-- self:InitTurret()
	-- self:InitGunner()




	-- self.LegRotate = 0
	-- self.KnockbackAnim = 0

end
--addons/ssrp_lfs/lua/entities/lvs_plane_template/cl_init.lua:
include("shared.lua")

-- called when the vehicle is spawned. Use this instead of ENT:Initialize
function ENT:OnSpawn()
	-- register a wing-tip trail vortex effect.
	-- self:RegisterTrail( Pos, StartSize, EndSize, LifeTime, min_flight_speed, activation_speed )

	-- example:
	-- self:RegisterTrail( Vector(40,200,70), 0, 20, 2, 1000, 400 )
end

-- called when a trail effect is started
function ENT:OnTrail( active, id )
end

-- use this instead of ENT:Think()
function ENT:OnFrame()
end

function ENT:LVSPreHudPaint( X, Y, ply )
	return true -- return false to prevent original hud paint from running
end

function ENT:PreDraw() -- function is called in ENT:Draw() right before self:DrawModel() is called.
	return true -- set to false to prevent model from drawing.  Note this will not stop ENT:PostDraw() from being called
end

function ENT:PreDrawTranslucent() -- function is called in ENT:DrawTranslucent() right before self:DrawModel() is called
	return false -- set to true to draw the model in translucent
end

function ENT:PostDraw()
	-- called in ENT:Draw() after the self:DrawModel() is called
end

function ENT:PostDrawTranslucent()
	-- called in ENT:DrawTranslucent() after the self:DrawModel() is called.
end

-- called when the engine is turned on or off
function ENT:OnEngineActiveChanged( Active )
end

-- called when either an ai is activated/deactivated or when a player is sitting/exiting the driver seat
function ENT:OnActiveChanged( Active )
end

--[[ -- edit view here. This is run before the LVS' camera is run
function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	return pos, angles, fov
end
]]

--addons/ssrp_lfs/lua/entities/lvs_repulsorlift_gunship/shared.lua:

ENT.Base = "lvs_base_repulsorlift"

ENT.PrintName = "LAAT/i"
ENT.Author = "Luna"
ENT.Information = "Gunship/Troop Transport of the Galactic Republic"
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable = true
ENT.AdminSpawnable = false

ENT.MDL = "models/blu/laat.mdl"
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

ENT.MaxPitch = 60

ENT.ThrustVtol = 50
ENT.ThrustRateVtol = 2

ENT.TurnRatePitch = 0.7
ENT.TurnRateYaw = 0.7
ENT.TurnRateRoll = 0.7

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.MaxHealth = 4000
ENT.AutomaticFrameAdvance = true

ENT.UIPosition = Vector(1000, -100, -40)
ENT.UIAngle = Angle(25, 155, 0)

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "GunnerSeat" )
	self:AddDT( "Entity", "BTPodL" )
	self:AddDT( "Entity", "BTPodR" )

	self:AddDT( "Bool", "RearHatch" )

	self:AddDT( "Int", "DoorMode" )

	self:AddDT( "Bool", "WingTurretFire" )
	self:AddDT( "Vector", "WingTurretTarget" )

	self:AddDT( "Bool", "BTLFire" )
	self:AddDT( "Bool", "BTRFire" )

	self:AddDT( "Bool", "LightsActive" )
end

function ENT:InitWeapons()
	self:InitWeaponDriver()
	self:InitWeaponGunner()
	self:InitWeaponBTL()
	self:InitWeaponBTR()
end

sound.Add( {
	name = "LVS.LAAT.FLYBY",
	sound = {
		"lvs/vehicles/laat/flyby1.wav",
		"lvs/vehicles/laat/flyby2.wav",
		"lvs/vehicles/laat/flyby3.wav",
		"lvs/vehicles/laat/flyby4.wav",
		"lvs/vehicles/laat/flyby5.wav",
	}
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

function ENT:CalcMainActivity( ply )
	local Pod = ply:GetVehicle()

	if Pod == self:GetDriverSeat() or Pod == self:GetGunnerSeat() then return end

	if ply.m_bWasNoclipping then
		ply.m_bWasNoclipping = nil
		ply:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM )

		if CLIENT then
			ply:SetIK( true )
		end
	end

	if Pod == self:GetBTPodL() or Pod == self:GetBTPodR() then
		ply.CalcIdeal = ACT_STAND
		ply.CalcSeqOverride = ply:LookupSequence( "drive_jeep" )

		return ply.CalcIdeal, ply.CalcSeqOverride
	end

	ply.CalcIdeal = ACT_STAND
	ply.CalcSeqOverride = ply:LookupSequence( "idle_all_02" )

	if ply:GetAllowWeaponsInVehicle() and IsValid( ply:GetActiveWeapon() ) then

		local holdtype = ply:GetActiveWeapon():GetHoldType()

		if holdtype == "smg" then
			holdtype = "smg1"
		end

		local seqid = ply:LookupSequence( "idle_" .. holdtype )

		if seqid ~= -1 then
			ply.CalcSeqOverride = seqid
		end
	end

	return ply.CalcIdeal, ply.CalcSeqOverride
end
--addons/ssrp_lfs/lua/entities/lvs_starfighter_droidtrifighter/shared.lua:

ENT.Base = "lvs_base_starfighter"

ENT.PrintName = "Droid Tri-Fighter"
ENT.Author = "Luna"
ENT.Information = "Droid Starfighter of the Separatists"
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/salza/droidtrifighter.mdl"
ENT.GibModels = {
	"models/salza/tridroid_gib1.mdl",
	"models/salza/tridroid_gib2.mdl",
	"models/salza/tridroid_gib3.mdl",
	"models/salza/tridroid_gib4.mdl",
	"models/salza/tridroid_gib5.mdl",
}

ENT.AITEAM = 2

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

ENT.MaxHealth = 250

function ENT:InitWeapons()
	self.FirePositions = {
		Vector(114.58,0,86.08),
		Vector(112.54,74.47,-42.69),
		Vector(112.54,-74.47,-42.69),
	}

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
		bullet.TracerName = "lvs_laser_red"
		bullet.Force	= 10
		bullet.HullSize 	= 40
		bullet.Damage	= 10
		bullet.Velocity = 60000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(255,50,50) )
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_impact", effectdata )
		end
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetStart( Vector(255,50,50) )
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
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Ammo = 200
	weapon.Delay = 0.1
	weapon.HeatRateUp = 1.5
	weapon.HeatRateDown = 1
	weapon.Attack = function( ent )
		local bullet = {}
		bullet.Src 	= ent:LocalToWorld( Vector(152.24,0,0) )
		bullet.Dir 	= ent:GetForward()
		bullet.Spread 	= Vector( 0.015,  0.015, 0 )
		bullet.TracerName = "lvs_laser_red"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 40
		bullet.SplashDamage = 40
		bullet.SplashDamageRadius = 200
		bullet.Velocity = 30000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(255,0,0) )
				effectdata:SetOrigin( tr.HitPos )
			util.Effect( "lvs_laser_explosion", effectdata )
		end
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetStart( Vector(255,50,50) )
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( ent:GetForward() )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle_colorable", effectdata )

		ent:TakeAmmo()

		ent.SecondarySND:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )

	self:AddWeapon( LVS:GetWeaponPreset( "TURBO" ) )
end

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/droidtrifighter/loop.wav",
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
--addons/ssrp_lfs/lua/entities/lvs_starfighter_slave1/cl_init.lua:
include("shared.lua")

ENT.EngineFXPos = {

}

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-52.46,-355.16,7.28), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-52.46,355.16,7.28), 0, 20, 2, 1000, 150 )
end


function ENT:OnFrame()
	self:AnimCockpit()
	self:EngineEffects()
end
	
function ENT:OnFrame()
	self:AnimCockpit()
	self:EngineEffects()


end


function ENT:AnimCockpit()
	if not IsValid( self.Cockpit ) then
		local Prop = ents.CreateClientProp()
		Prop:SetPos( self:LocalToWorld( Vector(99,0,-110.04) ) )
		Prop:SetAngles( self:GetAngles() )
		Prop:SetModel( "models/jackjack/ships/slave1p.mdl" )
		Prop:SetParent( self )
		Prop:Spawn()
		self.Cockpit = Prop
	end
end

function ENT:OnRemove()
	if IsValid( self.Cockpit ) then
	self.Cockpit:Remove()
	end
end

ENT.EngineGlow = Material( "sprites/light_glow02_add" )

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 80 + self:GetThrottle() * 40 + self:GetBoost() * 0.8
--Engines--
	render.SetMaterial( self.EngineGlow )
	render.DrawSprite( self:LocalToWorld( Vector(-35.45,-69.47,-91.52) ), 405, 405, Color(196, 84, 39, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-35.45,-69.47,-91.52) ), 205, 205, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-35.45,69.47,-91.52) ), 405, 405, Color(196, 84, 39, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-35.45,69.47,-91.52) ), 205, 205, Color(209, 206, 29, 255) )
	
	
	
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,0.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-10.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-20.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-30.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-40.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-50.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-60.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-70.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,0.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-10.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-20.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-30.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-40.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-50.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-60.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,-70.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,10.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,20.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,30.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,40.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,50.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,60.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,70.28,50.91) ), 150, 150, Color( 255, 100, 0, 255) )
	
	
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,10.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,20.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,30.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,40.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,50.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,60.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-40.76,70.28,50.91) ), 70, 70, Color(209, 206, 29, 255) )

	
	--cockpit-- 
	
	--left lights--
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,8.48,66.72) ), 3, 3, Color(161, 0, 27, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,8.82,66.72) ), 3, 3, Color(110, 105, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,9.17,66.72) ), 3, 3, Color(8, 97, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,9.46,66.72) ), 3, 3, Color(8, 97, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,9.76,66.72) ), 3, 3, Color(161, 0, 27, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,10.06,66.72) ), 3, 3, Color(8, 97, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,10.36,66.72) ), 3, 3, Color(110, 105, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,10.66,66.72) ), 3, 3, Color(110, 105, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,10.96,66.72) ), 3, 3, Color(8, 97, 0, 255) )
	
	
	


	
	--middle lights--
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,2.86,66.72) ), 3, 3, Color(161, 0, 27, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,2.56,66.72) ), 3, 3, Color(8, 97, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,2.32,66.72) ), 3, 3, Color(110, 105, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,2.12,66.72) ), 3, 3, Color(110, 105, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,1.79,66.72) ), 3, 3, Color(8, 97, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,1.53,66.72) ), 3, 3, Color(161, 0, 27, 255) )
	
	--idk lmao i forgor--
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,-1.41,66.72) ), 3, 3, Color(8, 97, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,-1.71,66.72) ), 3, 3, Color(161, 0, 27 , 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,-2.01,66.72) ), 3, 3, Color(8, 97, 0, 255) )
	
	
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,-4.21,66.72) ), 3, 3, Color(110, 105, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,-4.41,66.72) ), 3, 3, Color(161, 0, 27, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,-4.71,66.72) ), 3, 3, Color(110, 105, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.38,-4.91,66.72) ), 3, 3, Color(8, 97, 0, 255) )
	
	render.DrawSprite( self:LocalToWorld( 	Vector(163.72,4.95,71.1) ), 3, 3, Color(8, 97, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(163.01,4.95,70.37) ), 3, 3, Color(8, 97, 0, 255) )

	
	render.DrawSprite( self:LocalToWorld( 	Vector(160.35,4.61,70.2) ), 3, 3, Color(161, 0, 27, 255) )
	
	render.DrawSprite( self:LocalToWorld( 	Vector(163.59,8.86,70.57) ), 3, 3, Color(8, 97, 0, 255) )
	
	render.DrawSprite( self:LocalToWorld( 	Vector(160.23,10,68.25) ), 3, 3, Color(161, 0, 27, 255) )
	
	render.DrawSprite( self:LocalToWorld( 	Vector(164.78,-0.97,72.27) ), 3, 3, Color(161, 0, 27, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(164.78,0.77,72.27) ), 3, 3, Color(161, 0, 27, 255) )
	
	

	
	
	render.DrawSprite( self:LocalToWorld( 	Vector(163.56,-6.99,70.55) ), 3, 3, Color(161, 0, 27, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(163.56,-7.29,70.55) ), 3, 3, Color(8, 97, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(163.56,-7.59,70.55) ), 3, 3, Color(161, 0, 27, 255) )
	
	render.DrawSprite( self:LocalToWorld( 	Vector(160.74,-6.62,68.31) ), 3, 3, Color(110, 105, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(160.74,-5.42,68.31) ), 3, 3, Color(8, 97, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(160.74,-4.28,68.31) ), 3, 3, Color(161, 0, 27, 255) )
	--bottom right dials--
	render.DrawSprite( self:LocalToWorld( 	Vector(156.27,-5.86,64.89) ), 3, 3, Color(161, 0, 27, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(156.27,-7.06,64.89) ), 3, 3, Color(8, 97, 0, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(156.27,-8.42,64.89) ), 3, 3, Color(161, 0, 27, 255) )
	--bottom left dials--
	render.DrawSprite( self:LocalToWorld( 	Vector(156.22,6.67,65.37) ), 3, 3, Color(161, 0, 27, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(156.22,8.17,65.37) ), 3, 3, Color(161, 0, 27, 255) )

	--consoles--
	render.DrawSprite( self:LocalToWorld( 	Vector(160.98,-0.18,69.93) ), 30, 30, Color(61, 16, 1, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(163.33,6.67,70.84) ), 15, 15, Color(61, 16, 1, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.83,6.21,68.8) ), 15, 15, Color(61, 16, 1, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(160.82,-5.89,69.56) ), 15, 15, Color(61, 16, 1, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(163.09,-6.09,72.13) ), 30, 30, Color(61, 16, 1, 255) )
	
	--weird lights--
	render.DrawSprite( self:LocalToWorld( 	Vector(166.45,-0.25,73.53) ), 30, 30, Color(61, 16, 1, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(163.31,10.93,76.09) ), 30, 30, Color(61, 16, 1, 255) )
	render.DrawSprite( self:LocalToWorld( 	Vector(158.69,15.17,75.65) ), 30, 30, Color(61, 16, 1, 255) )
	
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
	self:EmitSound( "lvs/vehicle/slave1/slave1_boost.wav", 125 )
end

function ENT:OnStopBoost()
	self:EmitSound( "lvs/vehicle/slave1/slave1_stopboost.wav", 125 )
end

--addons/ssrp_lfs/lua/entities/lvs_starfighter_ywing/shared.lua:
ENT.Base = "lvs_base_starfighter"

ENT.PrintName = "Y-Wing"
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

ENT.FirePositions = { Vector(450,-22,47),Vector(450,22,47) }

local blueLight = Vector(100, 100, 255)
local MissileAttach = {
	[1] = {
		left = "missile_1l",
		right = "missile_1r"
	},
	[2] = {
		left = "missile_2l",
		right = "missile_2r"
	},
	[3] = {
		left = "missile_3l",
		right = "missile_3r"
	},
}

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "GunnerSeat" )
	self:AddDT( "Float", "TurretPitch" )
	self:AddDT( "Float", "TurretYaw" )
end

function ENT:InitWeapons()
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
	weapon.Icon = Material("lvs/weapons/missile.png")
	weapon.Ammo = 60
	weapon.Delay = 1
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0.2
	weapon.Attack = function( ent )
		local Driver = ent:GetDriver()

		for i = 1, 2 do
			timer.Simple( (i / 5) * 0.75, function()
				if not IsValid( ent ) then return end
				if ent:GetAmmo() <= 0 then ent:SetHeat( 1 ) return end

				local Pos = ent:LocalToWorld( ent.FirePositions[i] )
				local Start = Pos + ent:GetForward() * 80
				local Dir = (ent:GetEyeTrace().HitPos - Start):GetNormalized()

				local projectile = ents.Create( "lvs_missile" )
				projectile:SetPos( Start )
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
				projectile:SetSpeed( 4000 )
				projectile:SetDamage( 400 )
				projectile:SetRadius( 200 )
				projectile:Enable()
				projectile:EmitSound( "LVS.AAT.FIRE_MISSILE" )

				ent:SetHeat( ent:GetHeat() + 0.2 )

				ent:TakeAmmo( 1 )

				if i == 6 then
					ent:SetHeat( 1 )
				end
			end)
		end

		ent:SetOverheated( true )
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("weapons/shotgun/shotgun_cock.wav")
	end
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
--addons/ssrp_lfs/lua/entities/lvs_turret_aa/shared.lua:
ENT.Base = "lvs_base_turret"

ENT.PrintName = "Anti-Air Turret"
ENT.Author = "Luna"
ENT.Information = "It shoots lasers into the sky and makes things go boom"
ENT.Category = "[LVS] - Turrets (Republic)"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/antiairturret/rep_anti-airturret.mdl"

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
		bullet.TracerName = "lvs_laser_blue"
		bullet.Force	= 100
		bullet.HullSize 	= 50
		bullet.Damage	= 35
		bullet.Velocity = 50000
		bullet.SplashDamage	= 70
		bullet.SplashDamageRadius	= 250
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(50,50,255) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_explosion", effectdata )
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
		bullet.TracerName = "lvs_laser_blue"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 20
		bullet.Velocity = 50000
		--bullet.SplashDamage	= 20
		--bullet.SplashDamageRadius	= 200
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(50,50,255) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_explosion", effectdata )
		end
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
--addons/ssrp_lfs/lua/entities/lvs_turret_av/shared.lua:
ENT.Base = "lvs_base_turret"

ENT.PrintName = "Anti-Vehicle Turret"
ENT.Author = "Luna"
ENT.Information = "Hard-hitting, but very limited firing arc. Good for dealing with pesky tanks."
ENT.Category = "[LVS] - Turrets (Republic)"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/antivehicleturret/Anti-VehicleTurret.mdl"

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
    local AimAngles = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld( Vector(0,0,30) ) ):GetNormalized():Angle() )

    return AimAngles
end

function ENT:WeaponsInRange( ent )
    local AimAngles = self:GetAimAngles( ent )

    return not (AimAngles.p >= 8 or AimAngles.p <= -10)
end

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Delay = 0.5
	weapon.HeatRateUp = 0.67
	weapon.HeatRateDown = 0.2
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
		bullet.Spread 	= Vector( 0.01,  0.01, 0.01)
		bullet.TracerName = "lvs_laser_blue_long"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 450
		bullet.Velocity = 20000
		bullet.SplashDamage	= 150
		bullet.SplashDamageRadius	= 200
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(50,50,255) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_explosion", effectdata )
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
	
	
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/dual_mg.png")
	weapon.Delay = 0.2
	weapon.HeatRateUp = 0.25
	weapon.HeatRateDown = 0.5
    weapon.Attack = function( ent )
        if not ent:GetVehicle():WeaponsInRange( ent ) then return true end
		local base = ent:GetVehicle()

		local ID_L = self:LookupAttachment( "muzzle_left" )
		local ID_R = self:LookupAttachment( "muzzle_right" )
		local MuzzleLeft = self:GetAttachment( ID_L )
		local MuzzleRight = self:GetAttachment( ID_R )

		if not MuzzleLeft or not MuzzleRight then return end		

		ent.MirrorPrimary = not ent.MirrorPrimary

		local Pos = ent.MirrorPrimary and MuzzleLeft.Pos or MuzzleRight.Pos
		local Dir =  (ent.MirrorPrimary and MuzzleLeft.Ang or MuzzleRight.Ang):Up()

		local bullet = {}
		bullet.Src 	= Pos
		bullet.Dir 	= Dir
		bullet.Spread 	= Vector( 0.015,  0.015, 0.015 )
		bullet.TracerName = "lvs_laser_blue"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 35
		bullet.Velocity = 50000
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

		base.SecondarySND:PlayOnce( 100 + math.Rand(-3,3), 1 )
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
--addons/ssrp_lfs/lua/entities/lvs_walker_atte/cl_init.lua:
include("shared.lua")
include( "cl_ikfunctions.lua" )
include( "cl_camera.lua" )
include( "cl_legs.lua" )
include( "cl_prediction.lua" )
include("sh_turret.lua")
include("sh_gunner.lua")

local black = Color(0,0,0,255)

function ENT:DamageFX()
	self.nextDFX = self.nextDFX or 0

	if self.nextDFX < CurTime() then
		self.nextDFX = CurTime() + 0.05

		if self:GetIsRagdoll() then
			if math.random(0,45) < 3 then
				if math.random(1,2) == 1 then
					local Pos = self:LocalToWorld( Vector(0,0,70) + VectorRand() * 80 )
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
			effectdata:SetOrigin( self:LocalToWorld( Vector(0,0,160) ) )
			effectdata:SetEntity( self )
		util.Effect( "lvs_engine_blacksmoke", effectdata )

		if HP <= MaxHP * 0.25 then
			local effectdata = EffectData()
				effectdata:SetOrigin( self:LocalToWorld( Vector(0,20,180) ) )
				effectdata:SetNormal( self:GetUp() )
				effectdata:SetMagnitude( math.Rand(1,3) )
				effectdata:SetEntity( self )
			util.Effect( "lvs_exhaust_fire", effectdata )

			local effectdata = EffectData()
				effectdata:SetOrigin( self:LocalToWorld( Vector(0,-20,180) ) )
				effectdata:SetNormal( self:GetUp() )
				effectdata:SetMagnitude( math.Rand(1,3) )
				effectdata:SetEntity( self )
			util.Effect( "lvs_exhaust_fire", effectdata )
		end
	end
end

function ENT:PreDraw()
	return false
end

function ENT:DrawTurretDriver()
	local pod = self:GetTurretSeat()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and plyL:GetViewEntity() == plyL and not pod:GetThirdPersonMode()) then return end

	local ID = self:LookupAttachment( "driver_turret" )
	local Att = self:GetAttachment( ID )

	if not Att then return end

	local _,Ang = LocalToWorld( Vector(0,0,0), Angle(-110,-90,0), Att.Pos, Att.Ang )

	ply:SetSequence( "drive_jeep" )
	ply:SetRenderAngles( Ang )
	ply:DrawModel()
end

function ENT:PreDrawTranslucent()
	self:DrawTurretDriver()

	return true
end

local zoom = 0
local zoom_mat = Material( "vgui/zoom" )

local white = Color(255,255,255,255)
local red = Color(255,0,0,255)

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
	if self:GetIsCarried() then return end

	if ply ~= self:GetDriver() then
		local pod = ply:GetVehicle()

		if pod == self:GetTurretSeat() or pod == self:GetGunnerSeat() then
			self:PaintZoom( X, Y, ply )
		end

		return
	end

	local Pos2D = self:GetEyeTrace().HitPos:ToScreen()

	local _,_, InRange = self:GetAimAngles()

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
		draw.SimpleText( "X" , "LVS_FONT",  hX, hY, black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	else
		local Throttle = Vel / 150
		self:LVSDrawCircle( hX, hY, H * 0.35, math.min( Throttle, 1 ) )
	end
end

--addons/ssrp_lfs/lua/entities/lvs_walker_atte_component.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.AutomaticFrameAdvance = true
ENT.DoNotDuplicate = true

function ENT:SetupDataTables()
	self:NetworkVar( "Entity",0, "Base" )
end

if SERVER then
	function ENT:Initialize()	
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
	end

	function ENT:Think()
		return false
	end

	function ENT:OnTakeDamage( dmginfo )
		local base = self:GetBase()

		if not IsValid( base ) then return end

		base:OnTakeDamage( dmginfo )
	end

	function ENT:PhysicsCollide( data, phys )
		local base = self:GetBase()

		if not IsValid( base ) then return end

		base:PhysicsCollide( data, phys )
	end

	function ENT:Use( ply )
		if (ply._lvsNextUse or 0) > CurTime() then return end

		local base = self:GetBase()

		if not IsValid( base ) then return end

		base:Use( ply )
	end

	function ENT:UpdateTransmitState() 
		return TRANSMIT_ALWAYS
	end

	return
end

function ENT:Draw()
	self:DrawModel()
end

function ENT:Think()
end

function ENT:OnRemove()
end
--addons/ssrp_lfs/lua/entities/lvs_walker_hsd/cl_camera.lua:

function ENT:CalcViewDriver( ply, pos, angles, fov, pod )
	local view = {}
	view.origin = pos
	view.angles = angles
	view.fov = fov
	view.drawviewer = false

	if not pod:GetThirdPersonMode() then return view end

	local mn = self:OBBMins()
	local mx = self:OBBMaxs()
	local radius = ( mn - mx ):Length()
	local radius = radius + radius * pod:GetCameraDistance()

	local clamped_angles = pod:WorldToLocalAngles( angles )
	clamped_angles.p = math.max( clamped_angles.p, -20 )
	clamped_angles = pod:LocalToWorldAngles( clamped_angles )

	local StartPos = self:LocalToWorld( self:OBBCenter() ) + clamped_angles:Up() * 100
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
	if self:GetDriver() == ply then
		return self:CalcViewDriver( ply, pos, angles, fov, pod )
	end

	local view = {}
	view.origin = self:LocalToWorld( Vector(0,0,200) )
	view.angles = angles
	view.fov = fov
	view.drawviewer = false

	local mn = self:OBBMins()
	local mx = self:OBBMaxs()
	local radius = ( mn - mx ):Length()
	local radius = radius + radius * pod:GetCameraDistance()

	local TargetOrigin = view.origin + ( view.angles:Forward() * -radius )
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

	if tr.Hit and  not tr.StartSolid then
		view.origin = view.origin + tr.HitNormal * WallOffset
	end

	return view
end
--addons/ssrp_lfs/lua/entities/lvs_walker_hsd_leg.lua:
AddCSLuaFile()

ENT.Type            = "anim"

function ENT:SetupDataTables()
	self:NetworkVar( "Entity",0, "Base" )
	self:NetworkVar( "String",0, "LocationIndex" )
end

if SERVER then
	function ENT:Initialize()	
		self:SetModel( "models/blu/hsd_leg_1.mdl" )
		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_NONE )
	end

	function ENT:Think()
		return false
	end
else 
	include( "entities/lvs_walker_atte/cl_ikfunctions.lua" )

	local Length1 = 140
	local Length2 = 300

	local Length3 = 20
	local Length4 = 20

	local LegData1 = {
		Leg1 = {MDL = "models/blu/hsd_leg_2.mdl", Ang = Angle(0,-90,-90), Pos = Vector(0,0,0)},
		Leg2 = {MDL = "models/blu/hsd_leg_4.mdl", Ang = Angle(180,90,4), Pos = Vector(20,0,-12)},
		Foot = {MDL = "models/blu/hsd_foot.mdl", Ang = Angle(0,0,0), Pos = Vector(0,-2,0)}
	}

	local LegData2 = {
		Leg1 = {MDL = "models/blu/hsd_leg_3.mdl", Ang = Angle(0,90,-90), Pos = Vector(0,0,0)},
	}

	local StartPositions = {
		["FL"] = Vector(150,270,0),
		["FR"] = Vector(150,-270,0),
		["RL"] = Vector(-150,270,0),
		["RR"] = Vector(-150,-270,0),
	}

	local LocToID = {
		[1] = "RL",
		[2] = "FL",
		[3] = "RR",
		[4] = "FR",
	}

	function ENT:Think()
		local Base = self:GetBase()

		if not IsValid( Base ) then return end

		if Base:GetIsRagdoll() then 
			self:LegClearAll()

			return
		end

		local LocIndex = self:GetLocationIndex()

		if not Base:HitGround() then
			local Pos = Base:LocalToWorld( StartPositions[ LocIndex ] )

			self:RunIK( Pos, Base )
			self._OldPos = Pos
			self._smPos = Pos

			return
		end

		local Up = Base:GetUp()
		local Forward = Base:GetForward()
		local Vel = Base:GetVelocity()

		local Speed = Vel:Length()
		local VelForwardMul = math.min( Speed / 100, 1 )
		local VelForward = Vel:GetNormalized() * VelForwardMul + Forward * (1 - VelForwardMul)

		local TraceStart = Base:LocalToWorld( StartPositions[ LocIndex ] ) + VelForward * math.Clamp( 400 - Speed * 2, 100, 200 ) * VelForwardMul

		local trace = util.TraceLine( { 
			start = TraceStart + Vector(0,0,200),
			endpos = TraceStart - Vector(0,0,100), 
			filter = function( ent ) 
				if ent == Base or Base.HoverCollisionFilter[ ent:GetCollisionGroup() ] then return false end 

				return true
			end,
		} )

		local UpdateLeg = LocToID[ Base:GetUpdateLeg() ] == LocIndex

		self._OldPos = self._OldPos or trace.HitPos
		self._smPos = self._smPos or self._OldPos

		if self._OldUpdateLeg ~= UpdateLeg then
			self._OldUpdateLeg = UpdateLeg

			if UpdateLeg then
				self.UpdateNow = true
			end
		end

		if self.UpdateNow and not self.MoveLeg then
			sound.Play( Sound( "lvs/vehicles/hsd/hydraulic_stop0"..math.random(1,2)..".wav" ), self:GetPos(), SNDLVL_100dB )

			self.UpdateNow = nil
			self.MoveLeg = true
			self.MoveDelta = 0
		end

		local ShaftOffset = 0
		local ENDPOS = self._smPos + Up * 20

		if self.MoveLeg then
			local traceWater = util.TraceLine( {
				start = TraceStart + Vector(0,0,200),
				endpos = ENDPOS,
				filter = Base:GetCrosshairFilterEnts(),
				mask = MASK_WATER,
			} )

			if traceWater.Hit then
				local T = CurTime()

				if (self._NextFX or 0) < T then
					self._NextFX = T + 0.05
	
					local effectdata = EffectData()
						effectdata:SetOrigin( traceWater.HitPos )
						effectdata:SetEntity( Base )
						effectdata:SetMagnitude( 50 )
					util.Effect( "lvs_hover_water", effectdata )
				end
			end

			if self.MoveDelta >= 1 then
				self.MoveLeg = false
				self.MoveDelta = nil

				sound.Play( Sound( "lvs/vehicles/hsd/footstep0"..math.random(1,3)..".wav" ), ENDPOS, SNDLVL_100dB )

				local effectdata = EffectData()
					effectdata:SetOrigin( trace.HitPos )
				util.Effect( "lvs_walker_stomp", effectdata )

				sound.Play( Sound( "lvs/vehicles/hsd/hydraulic_start0"..math.random(1,2)..".wav" ), self:GetPos(), SNDLVL_100dB )
			else
				self.MoveDelta = math.min( self.MoveDelta + RealFrameTime() * 2, 1 )
	
				self._smPos = LerpVector( self.MoveDelta, self._OldPos, trace.HitPos )

				local MulZ =  math.max( math.sin( self.MoveDelta * math.pi ), 0 )

				ShaftOffset = MulZ ^ 2 * 30
				ENDPOS = ENDPOS + Up * MulZ * 50
			end
		else
			self._OldPos = self._smPos
		end

		self:RunIK( ENDPOS, Base, ShaftOffset )
	end

	function ENT:RunIK( ENDPOS, Base, shaftoffset )
		shaftoffset = shaftoffset or 0

		local Ang = Base:WorldToLocalAngles( (ENDPOS - self:GetPos()):Angle() )

		self:SetAngles( Base:LocalToWorldAngles( Angle(0,Ang.y + 90,0) ) )

		local ID = self:LookupAttachment( "lower" )
		local Att = self:GetAttachment( ID )

		if not Att then return end

		local Pos, Ang = WorldToLocal( ENDPOS, (ENDPOS - Att.Pos):Angle(), Att.Pos, self:LocalToWorldAngles( Angle(0,-90,0) ) )

		local STARTPOS = Att.Pos

		self:GetLegEnts( 1, Length1, Length2, self:LocalToWorldAngles( Angle(0,180,135) ), STARTPOS, ENDPOS, LegData1 )

		if not self.IK_Joints[ 1 ] or not IsValid( self.IK_Joints[ 1 ].Attachment2 ) then return end

		local shaft = self.IK_Joints[ 1 ].Attachment2

		shaft:SetPoseParameter( "extrude", shaftoffset )
		shaft:InvalidateBoneCache()

		local ID1 = self:LookupAttachment( "upper" )
		local Start = self:GetAttachment( ID1 )

		if not Start then return end

		local ID2 = shaft:LookupAttachment( "upper_end" )
		local End = shaft:GetAttachment( ID2 )

		if not End then return end

		self:GetLegEnts( 2, Length3, Length4, self:LocalToWorldAngles( Angle(0,0,-45) ), Start.Pos, End.Pos, LegData2 )

		if not self.IK_Joints[ 2 ] or not IsValid( self.IK_Joints[ 2 ].Attachment1 ) then return end

		local strut = self.IK_Joints[ 2 ].Attachment1
		strut:SetPoseParameter( "extrude", (Start.Pos - End.Pos):Length() )
		strut:InvalidateBoneCache()
	end

	function ENT:OnRemove()
		self:OnRemoved()
	end

	function ENT:Draw()
		local Base = self:GetBase()

		if not IsValid( Base ) then return end

		if Base:GetIsRagdoll() then return end

		self:DrawModel()
	end
end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_base/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/thirdparty/medialib.service.youtubeplaylist.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_globalradio.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_room.lua:
AddCSLuaFile()ENT.Base='media_base'ENT.PrintName='Room Radio'ENT.Category='RP Media'ENT.Spawnable=true;ENT.AdminSpawnable=true;ENT.MediaPlayer=true;ENT.Model='models/props_lab/citizenradio.mdl'ENT.Is3D=false;function ENT:CanUse(a)return a:IsTrialGamemaster()end;function ENT:ShouldPlay()local b,c=LocalPlayer():GetLocation()return c>0&&b.name==self:GetRoom()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_screen.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/nbot_sw_droid_b1.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/nbot_sw_magnaguard_s4.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/nbot_sw_magnaguard_s4.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='Magna Guard Season 4'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/tfa/comm/gg/npc_comb_magna_guard_season4.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_magna_guard_trainer.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/nbot_sw_magnaguard_trainer.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='Magna Guard Trainer'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/tfa/comm/gg/npc_comb_magna_guard_trainer.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_magna_guard_trainer.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/nbot_sw_superbattle_cannon_droid_b2.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='B2 Super Battle Droid Cannon'ENT.Category='GM Hostile Nextbots'ENT.Weapons={'sup_b2cannon'}ENT.RagdollModel='models/tfa/comm/gg/npc_comb_sw_droid_b2_gunvariant.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_droid_b2_gunvariant.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_nerf.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_nightmarebeast.lua:
if!DrGBase then return end;ENT.Base="drgbase_nextbot"ENT.CWRP=true;ENT.PrintName="Underworld Nightmare Beast"ENT.Category="[Valkyrie] Creature NPCs"ENT.Models={"models/swtor/npcs/rancor_nightmarebeast.mdl"}ENT.Skins={0}ENT.ModelScale=1;ENT.CollisionBounds=Vector(100,100,100)ENT.BloodColor=BLOOD_COLOR_RED;ENT.RagdollOnDeath=false;ENT.SpawnHealth=1000;ENT.HealthRegen=5;ENT.MinPhysDamage=10;ENT.MinFallDamage=10;ENT.OnSpawnSounds={}ENT.OnIdleSounds={"fallenlogic/rancor/breath_loop.wav"}ENT.IdleSoundDelay=2;ENT.ClientIdleSounds=false;ENT.OnDamageSounds={}ENT.DamageSoundDelay=0.25;ENT.OnDeathSounds={}ENT.OnDownedSounds={}ENT.Footsteps={}ENT.Omniscient=false;ENT.SpotDuration=30;ENT.RangeAttackRange=0;ENT.MeleeAttackRange=75;ENT.ReachEnemyRange=50;ENT.AvoidEnemyRange=0;ENT.Factions={FACTION_ANTLIONS}ENT.Frightening=true;ENT.AllyDamageTolerance=0.33;ENT.AfraidDamageTolerance=0.33;ENT.NeutralDamageTolerance=0.33;ENT.Acceleration=1000;ENT.Deceleration=1000;ENT.JumpHeight=50;ENT.StepHeight=20;ENT.MaxYawRate=250;ENT.DeathDropHeight=200;ENT.WalkAnimation=ACT_WALK;ENT.WalkAnimRate=1;ENT.RunAnimation=ACT_RUN;ENT.RunAnimRate=1;ENT.IdleAnimation=ACT_IDLE;ENT.IdleAnimRate=1;ENT.JumpAnimation=ACT_JUMP;ENT.JumpAnimRate=1;ENT.UseWalkframes=false;ENT.WalkSpeed=100;ENT.RunSpeed=200;ENT.ClimbLedges=false;ENT.ClimbLedgesMaxHeight=math.huge;ENT.ClimbLedgesMinHeight=0;ENT.LedgeDetectionDistance=20;ENT.ClimbProps=false;ENT.ClimbLadders=false;ENT.ClimbLaddersUp=false;ENT.LaddersUpDistance=20;ENT.ClimbLaddersUpMaxHeight=math.huge;ENT.ClimbLaddersUpMinHeight=0;ENT.ClimbLaddersDown=false;ENT.LaddersDownDistance=20;ENT.ClimbLaddersDownMaxHeight=math.huge;ENT.ClimbLaddersDownMinHeight=0;ENT.ClimbSpeed=60;ENT.ClimbUpAnimation=ACT_CLIMB_UP;ENT.ClimbDownAnimation=ACT_CLIMB_DOWN;ENT.ClimbAnimRate=1;ENT.ClimbOffset=Vector(0,0,0)ENT.EyeBone="R_Eyelid"ENT.EyeOffset=Vector(0,0,0)ENT.EyeAngle=Angle(0,0,0)ENT.SightFOV=150;ENT.SightRange=15000;ENT.MinLuminosity=0;ENT.MaxLuminosity=1;ENT.HearingCoefficient=1;ENT.UseWeapons=false;ENT.Weapons={}ENT.WeaponAccuracy=1;ENT.WeaponAttachment=""ENT.DropWeaponOnDeath=false;ENT.AcceptPlayerWeapons=false;ENT.PossessionEnabled=false;ENT.PossessionPrompt=true;ENT.PossessionCrosshair=false;ENT.PossessionMovement=POSSESSION_MOVE_1DIR;ENT.PossessionViews={}ENT.PossessionBinds={}if SERVER then else function ENT:CustomInitialize()end;function ENT:CustomThink()end;function ENT:CustomDraw()end end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/ssrp_tools_npc/lua/entities/npc_droppodspawner.lua:
AddCSLuaFile()
DEFINE_BASECLASS 'npc_spawner'

ENT.Base = 'npc_spawner'
ENT.PrintName = 'SUP NPC Drop Pod Spawner'
ENT.Author = 'Scott (STEAM_0:1:26675200)'
ENT.Information = 'Controls NPC Spawn Waves'
ENT.Category = 'Superior Servers'
ENT.Editable = false
ENT.Spawnable = false
ENT.AdminOnly = false
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.DropSpeed = 800

function ENT:Initialize()  
    if CLIENT then
        self:DoEffect()
        return
    end

    srp.effect.Run('FlashBang', self:GetPos() + Vector(0,0,80), 500, 1, true)
    self:SetPos(self:GetPos() + Vector(0,0,90))

    self:SetModel 'models/galactic/props/droidpod/droidpod.mdl'
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_NONE)
    self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
    self:CreateRoutine()
    self:Reset(self:Enabled(), false)
    self:SetAngles(Angle(180, 0, 0) + Angle(math.random(-10, 10), math.random(-30, 30), math.random(-30, 30)))   
    self:DoFireChance()
    self:DoSmokeChance()
end

function ENT:DoFireChance()
    if math.random() > .15 then return end

    self:Ignite(100, 400)

    local entities = ents.FindInSphere(self:GetPos(), 300)

    for _, v in ipairs(entities) do
        if IsValid(v) and not v:IsPlayer() and not v:IsNPC() and math.random() < .3 then
            v:Ignite(math.random(10, 30), 300)
        end
    end
end

function ENT:DoSmokeChance()
    if math.random() > .2 then return end

	if IsValid(self.smoke) then
		return
	end

	self.smoke = ents.Create 'env_smokestack'
	self.smoke:SetParent(self)
	self.smoke:SetPos(self:GetPos() + Vector(0,0,40))
    self.smoke:SetAngles((-self:GetForward()):Angle())

	self.smoke:SetKeyValue("Name", "smokey_" .. self:EntIndex())
	self.smoke:SetKeyValue("InitialState",1)
	self.smoke:SetKeyValue("WindAngle", "20")
	self.smoke:SetKeyValue("WindSpeed", "4")
	self.smoke:SetSaveValue("SpreadSpeed", 4)
	self.smoke:SetSaveValue("Speed", 45)
	self.smoke:SetSaveValue("StartSize", math.random(10, 15))
	self.smoke:SetSaveValue("EndSize", math.random(40, 60))
	self.smoke:SetSaveValue("Rate", math.random(50, 80))
	self.smoke:SetSaveValue("JetLength", math.random(300, 600))
	self.smoke:SetSaveValue("BaseSpread", 8)
	self.smoke:SetSaveValue("Twist", 1)

    local grey = 30 + math.random() * 150
	self.smoke:SetKeyValue("rendercolor", grey .. " " ..  grey .. " " .. grey)
	self.smoke:SetKeyValue("renderamt", "80")

	local lighting = ents.Create 'env_particlelight'
	lighting:SetParent(self)
	lighting:SetPos(self:GetPos() + Vector(0,0,25))
	lighting:SetSaveValue("Color", "1 1 1")
	lighting:SetSaveValue("Intensity", "255")
	lighting:SetSaveValue("PSName", "smokey_" .. self:EntIndex())
	lighting:Spawn()
	lighting:Activate()

	self.smoke:Spawn()
	self.smoke:Activate()

	self.smoke:DeleteOnRemove(lighting)
	self.smoke:Fire("turnon","", 0.1)

    self:DeleteOnRemove(self.smoke)

    timer.Simple(40, function() 
        if IsValid(self) then
            self.smoke:Remove()
        end
    end)
end

function ENT:DoEffect()
    local pos = self:GetPos()

    local ef = EffectData()
    ef:SetOrigin(pos)
    ef:SetNormal(Vector(0,0,1))
    ef:SetScale( 0.5 + math.random()/2)
    util.Effect('gdcw_whitephosphorusairburst', ef, true, true)

    local ef = EffectData()
    ef:SetOrigin(pos + Vector(0,0,20))
    ef:SetNormal(Vector(0,0,1))
    ef:SetScale(50)
    ef:SetMagnitude(1)
    util.Effect('ThumperDust', ef, true, true)

    local ef = EffectData()
    ef:SetOrigin(pos - Vector(0,0,80))
    ef:SetNormal(Vector(0,0,1))
    ef:SetScale(120)
    ef:SetMagnitude(2)
    util.Effect('ThumperDust', ef, true, true)

    local dist = pos:Distance(LocalPlayer():GetPos())
    if dist < 1000 then
        util.ScreenShake(pos, 2, 50, 5, 5)
    end
end

function ENT:Draw()
    local pl = LocalPlayer()
    if not IsValid(pl) then
        return
    end

    local angle = (self:GetPos() - pl:GetPos()):Angle()
    angle.p = 0
    angle.y = angle.y + -90
    angle.r = angle.r + 90

    self:DrawModel()

    local health = self:GetNetVar('npc_spawner.podhealth') or 0
    local perc = (health/self:GetPodMaxHP())

    cam.Start3D2D(self:GetPos() + Vector(0,0,120), angle, .15)
        draw.Box(-201, 0, 402, 82, col.black)
        draw.Box(-200, 0, 400 * perc, 80, col.blue)
        draw.DrawText(health .. ' HP', 'ui_header.xl', 0, 8, col.white, TEXT_ALIGN_CENTER)
    cam.End3D2D()

    if self:IsOwned() then
        self:DrawInfoGraph(pl, Vector(0,0,150))
    end
end

if SERVER then
    function ENT:OnTakeDamage(dmginfo)
        if self.removing or not self.CanDamage then 
			return 
		end

        local hp = (self:GetNetVar('npc_spawner.podhealth') or 0) - dmginfo:GetDamage()
        self:SetNetVar('npc_spawner.podhealth', hp) 

        if hp <= 0 then
            self.removing = true

            local effect = EffectData()
            effect:SetOrigin(self:GetPos())
    
            util.Effect('Explosion', effect, true, true)
            util.BlastDamage(self, self, self:GetPos(), 500, 600)

            self:Remove()
        end
    end
end
--addons/!lpakr_out/lua/entities/npc_sw_droid_tactical.lua:
AddCSLuaFile()ENT.CWRP=true;ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='Tactical Droid'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/tfa/comm/gg/npc_comb_sw_droid_tactical.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_droid_tactical.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/parctrl_dummyent.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/parctrl_dummyent.lua:
AddCSLuaFile()ENT.Base="base_gmodentity"ENT.PrintName="Particle Controller Dummy Entity"ENT.Author=""ENT.Spawnable=false;ENT.AdminSpawnable=false;if CLIENT then language.Add("parctrl_dummyent","Physics Object")end;function ENT:SetupDataTables()self:NetworkVar("String",0,"EffectName")self:NetworkVar("Vector",0,"UtilEffectInfo")self:NetworkVar("Vector",1,"ColorInfo")self:NetworkVar("Int",0,"AttachNum")end;function ENT:Think()if self.ParticleEffectCalled then return end;local a=self:GetEffectName()local b=self:GetUtilEffectInfo()local c=self:GetColorInfo()local d=self:GetAttachNum()if a!=nil&&a!=""&&c!=nil&&b!=nil&&d!=nil then local e=self;if string.StartWith(a,"!UTILEFFECT!")then local f=b.x;local g=b.y;local h=b.z;local i=EffectData()i:SetEntity(e)i:SetScale(f)i:SetMagnitude(g)i:SetRadius(h)i:SetFlags(0)if string.EndsWith(a,"!")then if string.find(a,"!FLAG1!")then i:SetFlags(1)a=string.Replace(a,"!FLAG1!","")end;if string.find(a,"!FLAG2!")then i:SetFlags(2)a=string.Replace(a,"!FLAG2!","")end;if string.find(a,"!FLAG3!")then i:SetFlags(3)a=string.Replace(a,"!FLAG3!","")end;if string.find(a,"!FLAG4!")then i:SetFlags(4)a=string.Replace(a,"!FLAG4!","")end;if string.find(a,"!FLAG5!")then i:SetFlags(5)a=string.Replace(a,"!FLAG5!","")end;if string.find(a,"!FLAG6!")then i:SetFlags(6)a=string.Replace(a,"!FLAG6!","")end;if string.find(a,"!FLAG7!")then i:SetFlags(7)a=string.Replace(a,"!FLAG7!","")end;if string.find(a,"!FLAG8!")then i:SetFlags(8)a=string.Replace(a,"!FLAG8!","")end;if string.find(a,"!FLAG9!")then i:SetFlags(9)a=string.Replace(a,"!FLAG9!","")end end;i:SetColor(0)if string.EndsWith(a,"!")then if string.find(a,"!COLOR1!")then i:SetColor(1)a=string.Replace(a,"!COLOR1!","")end;if string.find(a,"!COLOR2!")then i:SetColor(2)a=string.Replace(a,"!COLOR2!","")end;if string.find(a,"!COLOR3!")then i:SetColor(3)a=string.Replace(a,"!COLOR3!","")end;if string.find(a,"!COLOR4!")then i:SetColor(4)a=string.Replace(a,"!COLOR4!","")end;if string.find(a,"!COLOR5!")then i:SetColor(5)a=string.Replace(a,"!COLOR5!","")end;if string.find(a,"!COLOR6!")then i:SetColor(6)a=string.Replace(a,"!COLOR6!","")end;if string.find(a,"!COLOR7!")then i:SetColor(7)a=string.Replace(a,"!COLOR7!","")end;if string.find(a,"!COLOR8!")then i:SetColor(8)a=string.Replace(a,"!COLOR8!","")end;if string.find(a,"!COLOR9!")then i:SetColor(9)a=string.Replace(a,"!COLOR9!","")end end;if string.find(string.lower(a),"shakeropes")then i:SetMagnitude(g*20)end;if string.find(string.lower(a),"thumperdust")then i:SetScale(f*50)end;if string.find(string.lower(a),"bloodspray")then i:SetScale(f*4)end;if e:GetAttachment(d)!=nil then i:SetStart(e:GetAttachment(d).Pos)i:SetOrigin(e:GetAttachment(d).Pos)i:SetAngles(e:GetAttachment(d).Ang)i:SetNormal(e:GetAttachment(d).Ang:Forward())else i:SetStart(e:GetPos())i:SetOrigin(e:GetPos())i:SetAngles(e:GetAngles())i:SetNormal(e:GetAngles():Forward())end;util.Effect(string.Replace(a,"!UTILEFFECT!",""),i)else local j=self:GetAttachment(d)if j!=nil then if CLIENT then e=ClientsideModel("models/hunter/plates/plate.mdl")end;e:SetParent(self,d-1)e:SetPos(j.Pos)e:SetAngles(j.Ang)e:SetNoDraw(true)e:Spawn()e:Activate()self:CallOnRemove("RemoveProjFX",function()if IsValid(e)then e:Remove()end end)end;local k=nil;if c==Vector(0,0,0)then else k={position=c}end;local l={}l[1]={entity=e,attachtype=PATTACH_ABSORIGIN_FOLLOW}for m=2,64 do if k then l[m]=k else l[m]=l[1]end end;e:CreateParticleEffect(a,l)end;self.ParticleEffectCalled=true end end;duplicator.RegisterEntityClass("parctrl_dummyent",function(n,o)end,"Data")
--addons/!lpakr_out/lua/entities/pfx1_08~.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_0e_l.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx2_06.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Dripping blood"ENT.Category="PPE: Other"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[2]blood_leak"
--addons/!lpakr_out/lua/entities/pfx4_00.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_01_s~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Smaller Blue Jet [Smokeless]"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_b_s*"
--addons/!lpakr_out/lua/entities/pfx4_03_s~.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_04_s.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Smaller Purple Jet"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_v_s"
--addons/!lpakr_out/lua/entities/pfx4_06.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_06_1.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Green Energy Rod"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]energy_rod_g"
--addons/!lpakr_out/lua/entities/pfx4_06_2.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx5_00.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx5_00_alt.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx8_00.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx8_02.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfxa_00.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfxa_00.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Waterleak"ENT.Category="PPE: Water"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[A]waterleak_1"
--addons/!lpakr_out/lua/entities/rp_baccarat.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='rp_casinotable'ENT.Spawnable=info.Dev;ENT.Author='Scott (STEAM_0:1:26675200)'ENT.PrintName='Baccarat Table'ENT.Description='We doing it doing it doing it doing it.'ENT.GameID='Baccarat'ENT.CasnoTable=true;ENT.DoNotDuplicate=true;ENT.Model=Model'models/mark2580/gtav/dcasino/games/d_casino_blackjack_pocker.mdl'ENT.SeatModel=Model'models/nova/chair_office01.mdl'
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_barbedwire.lua:
AddCSLuaFile()ENT.Base='rp_building'ENT.PrintName='Barbed Wire'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.Model='models/props_street/concertinawire128.mdl'ENT.GUIOffset=Vector(0,0,425)ENT.GUIAngle=Angle(0,90,90)sound.Add({name='barbedwire',pitch=100,volume=1,level=75,sound={'physics/metal/metal_chainlink_impact_soft1.wav','physics/metal/metal_chainlink_impact_soft2.wav','physics/metal/metal_chainlink_impact_soft3.wav'}})sound.Add({name='barbedwire.hard',pitch=100,volume=1,level=75,sound={'physics/metal/metal_chainlink_impact_hard1.wav','physics/metal/metal_chainlink_impact_hard2.wav','physics/metal/metal_chainlink_impact_hard3.wav'}})function ENT:StartTouch(a)if!IsValid(a)||!a:IsPlayer()then return end;if a.LastBarbedWire==self then return end;a.LastBarbedWire=self;self.EntityInZone[a]=true;a:ApplyTalent'runspeed'a:ApplyTalent'walkspeed'end;function ENT:EndTouch(a)if a.LastBarbedWire!=self then return end;a.LastBarbedWire=nil;a:ApplyTalent'runspeed'a:ApplyTalent'walkspeed'self.EntityInZone[a]=true end;function ENT:Touch(a)if!IsValid(a)||!a:IsPlayer()then return end;if self.NextHPTick[a]&&self.NextHPTick[a]>CurTime()then return end;local b=a:IsSprinting()self.NextHPTick[a]=CurTime()+(b&&math.random(.5,.75)||math.random(1.2,1.75))a:TakeDamage(b&&200||50,self,self)if a:Crouching()then return end;local c=self:GetTouchTrace()if b then EmitSound('barbedwire.hard',c.HitPos,0,CHAN_AUTO,1,65,nil,100,1)else EmitSound('barbedwire',c.HitPos,0,CHAN_AUTO,1,65,nil,100,1)end end;function ENT:FinishBuilding()self:SetBuilding(false)self:DoEffect(true)self:SetColor(white)self:OnCreated()end;hook('OnPlayerAppliedTalent','srp.talents.BarbedWire',function(d,e,f)if IsValid(d.LastBarbedWire)&&(e.id=='runspeed'||e.id=='walkspeed')then return e.id=='walkspeed'&&10||60,true end end)
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_buildzone/cl_init.lua:
include'shared.lua'function ENT:Draw()local a=LocalPlayer()if a:IsLiteGamemaster()then local b=self:GetBuilder()==a;local c=self:OBBMins()local d=self:OBBMaxs()render.DrawWireframeBox(self:GetPos(),self:GetAngles(),c,d,b&&col.red||col.white,true)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_button/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_cameracontrol/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_cloakdevice/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_crafting_jedi.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_life.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_monitor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/rp_grenade_popper.lua:
AddCSLuaFile()ENT.Base='rp_grenade'ENT.PrintName='Droid Popper'ENT.Spawnable=false;ENT.WorldModel='models/weapons/w_eq_flashbang.mdl'ENT.Impact=true;ENT.ExplosionTime=5;ENT.FreezeMotion=false;ENT.WorldMaterial='models/weapons/v_models/grenades/virus_grenade'ENT.ViewMaterial='models/weapons/v_models/grenades/virus_grenade'ENT.TrailColor=Color(20,129,218,255)ENT.TrailGlowColor='blueglow1'game.AddParticles'particles/advisor_fx.pcf'game.AddParticles'particles/electrical_fx.pcf'PrecacheParticleSystem'Advisor_Psychic_Scan_Glow'PrecacheParticleSystem'electrical_arc_01'local a=150;local b=10;local c={weapon_tool=true,weapon_gravgun=true,weapon_physgun=true,gmod_tool=true,weapon_stun=true,weapon_stungun=true,weapon_holster=true,sup_grenade_popper=true}local d={npc_manhack=true,npc_rollermine=true}function ENT:GetTargets(e,f)local g=CurTime()for h,i in ipairs(ents.FindByClass('npc_*'))do if i.NextPopperUse&&i.NextPopperUse>g then continue end;if IsValid(i)&&e:Distance(i:GetPos())<a then f(i)end end;for h,j in ipairs(player.GetAll())do if j.NextPopperUse&&j.NextPopperUse>g then continue end;if IsValid(j)&&e:Distance(j:GetPos())<b then f(j)end end end;function ENT:Explode()local e=self:GetPos()if CLIENT then self:CleanOldEffects()self:SpawnEffects(e)else local g=CurTime()timer.Simple(.15,function()if!IsValid(self)then return end;local k=DamageInfo()k:SetAttacker(self:GetOwner())k:SetInflictor(self)k:SetDamageType(DMG_BLAST)self:GetTargets(e,function(i)if i.IsDroid||d[i:GetClass()]then k:SetDamageType(DMG_DISSOLVE)k:SetDamage(math.min(20,i:Health()*.2))elseif i:IsNPC()then i:FearSound()k:SetDamage(math.min(20,i:Health()*.2))elseif i:IsPlayer()then k:SetDamage(100)end;i:TakeDamageInfo(k)local l=i:GetActiveWeapon()if IsValid(l)then local m=l:GetClass()if c[m]||l.IsLightsaber then return end;if i:IsPlayer()then i:StripWeapon(m)i:SelectWeapon('weapon_holster')else i:SetSchedule(SCHED_COWER)timer.Simple(.6,function()if IsValid(i)then i:SetPlaybackRate(0)end end)end;timer.Create('Popper.GiveWeapon.'..i:EntIndex(),5,1,function()if IsValid(i)then i:SetSchedule(SCHED_BIG_FLINCH)i:Give(m)end end)end;i.NextPopperUse=g+20 end)end)end;return 4 end;function ENT:CleanOldEffects()if IsValid(self.ParticleEffectOrb)then self.ParticleEffectOrb:Remove()end end;function ENT:CreateEffect(i)local n=math.random(-10,10)local o=math.random(-10,10)local p=i:CreateParticleEffect('electrical_arc_01',0,{entity=i,position=i:GetPos()+Vector(n,-o,100)})if p then p:SetControlPoint(0,i:GetPos()+Vector(-n,o,0))p:SetControlPoint(1,i:GetPos()+Vector(n/1.5,-o/1.5,70))end end;function ENT:SpawnEffects(e)self:EmitSound('ambient/fire/ignite.wav',100,100,1)local p=self:CreateParticleEffect('Advisor_Psychic_Scan_Glow',0,{entity=self,position=e})if!p then return end;p:SetControlPoint(0,e+Vector(100,0,150))self:GetTargets(e,function(i)if!IsValid(self)then return end;self:CreateEffect(i)self:CreateEffect(i)timer.Simple(.6,function()if IsValid(i)&&IsValid(self)then self:CreateEffect(i)self:CreateEffect(i)end end)timer.Simple(4.5,function()if IsValid(i)&&IsValid(self)then self:CreateEffect(i)self:CreateEffect(i)end end)end)end
--addons/!lpakr_out/lua/entities/rp_grenade_shield.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_hologram/cl_init.lua:
include'shared.lua'function ENT:Initialize()self.BroadcastEnts={}if self.UIRenderBounds then self:SetRenderBounds(self.UIRenderBounds.min,self.UIRenderBounds.max)end end;function ENT:GetTargetOffset()return self.TargetOffset+self:GetDynamicTargetOffset()end;function ENT:GetTargetScale()local a=self:GetDynamicTargetScaling()if a==0 then return self.TargetScale else return a end end;function ENT:BulletFired(b,c,d,e,f)if!IsValid(self:GetTarget())then return end;local a=self:GetTargetScale()local g=self:GetTargetOffset()local h=self:GetPos()+g+(d-self:GetTarget():GetPos())*a;local i=h+e*math.min(f,75)local j=EffectData()j:SetStart(h)j:SetOrigin(i)j:SetEntity(self)j:SetScale(0.15)util.Effect(c,j,true,true)end;function ENT:PlayerUse()if IsValid(self.TargetMenu)then return end;srp.ui.Create('srp_holodeck',function(k)k:Populate(self)self.TargetMenu=k end)end;function ENT:EntityAdded(l)if IsValid(l)then local f=l:OBBMins():Distance(l:OBBMaxs())if f<400 then l.HoloView=self;table.insert(self.BroadcastEnts,l)end end end;function ENT:EntityRemove(l)l.HoloView=nil;table.RemoveByValue(self.BroadcastEnts,l)end;function ENT:Think()self:SetNextClientThink(CurTime()+1)return true end;function ENT:RenderPlayer(m,h)local g=self:GetTargetOffset()h=h||self:GetPos()+g;if m:IsGhosted()||m:IsNoClip()then self:EntityRemove(m)return end;local a=self:GetTargetScale()local n=m:GetModelScale()local o=m:InVehicle()&&m:GetVehicle():GetPos()||m:GetPos()m.RenderingHolo=true;m:SetPos(h)m:SetModelScale(a)m:SetupBones()render.SetBlend(0.6)m:DrawModel()local p=m:GetActiveWeapon()if IsValid(p)then local q=m:GetModelScale()local r;if p.GetBladeLength then r=p:GetBladeLength()p:SetBladeLength(r*a)end;p:SetModelScale(a)p:DrawModel()p:SetModelScale(q)if r then p:SetBladeLength(r)end end;local s=m.LightsaberMDL;if IsValid(s)then local t=m:GetModelScale()s:SetModelScale(a)s:DrawModel()s:SetModelScale(t)end;render.SetBlend(1)m:SetPos(o)m:SetModelScale(n)m:SetupBones()m.RenderingHolo=false end;function ENT:RenderEntity(m,h)local a=self:GetTargetScale()local n=m:GetModelScale()local o=m:GetPos()m.DrawingHolo=true;m:SetPos(h)m:SetModelScale(a)m:SetupBones()render.SetBlend(0.8)m:DrawModel()render.SetBlend(1)local p=m.GetActiveWeapon&&m:GetActiveWeapon()if IsValid(p)then local q=m:GetModelScale()p:SetModelScale(a)p:DrawModel()p:SetModelScale(q)end;m:SetPos(o)m:SetModelScale(n)m:SetupBones()m.DrawingHolo=false end;local u=Material'materials/galactic/sup_dirt.jpg'local v=80;function ENT:DrawBroadcastables(m)self:RenderPlayer(m)local g=self:GetTargetOffset()local a=self:GetTargetScale()for w,l in ipairs(self.BroadcastEnts)do if IsValid(l)then local h=self:GetPos()+g+(l:GetPos()-m:GetPos())*a;if l:IsPlayer()then self:RenderPlayer(l,h)else self:RenderEntity(l,h)end end end end;function ENT:DrawNamePlate(m)if self.UINoDraw then return end;local x='Tracking: '..m:GetTag()..' '..m:Nick()local y=math.Clamp(m:Health()/m:GetMaxHealth(),0,1)local z=math.Clamp(m:Armor()/m:GetMaxArmor(),0,1)local A=m:GetChatColor()||col.yellow;surface.SetFont'ui_starwars.r'local B=255;local h=self:LocalToWorld(self.UIPosition)local C=self:LocalToWorldAngles(self.UIAngle)self:DrawDescription(x,B,y,z,h,C,A)if self.UIPositionOther then local h=self:LocalToWorld(self.UIPositionOther)local C=self:LocalToWorldAngles(self.UIAngleOther)self:DrawDescription(x,B,y,z,h,C,A)end;if self.UIPositionBack then local h=self:LocalToWorld(self.UIPositionBack)local C=self:LocalToWorldAngles(self.UIAngleBack)self:DrawDescription(x,B,y,z,h,C,A)end;if self.UIPositionBackOther then local h=self:LocalToWorld(self.UIPositionBackOther)local C=self:LocalToWorldAngles(self.UIAngleBackOther)self:DrawDescription(x,B,y,z,h,C,A)end end;function ENT:DrawDescription(x,B,y,z,h,C,A)cam.Start3D2D(h,C,.1)draw.DrawText(x,'ui_starwars.r',-6,-6,A,TEXT_ALIGN_LEFT)draw.DrawText(x,'ui_starwars.r',-3,-3,col.white,TEXT_ALIGN_LEFT)draw.Box(-2,23,B,5,A)draw.Box(0,25,B*y,5,col.red)draw.Box(-2,33,B,5,A)draw.Box(0,35,B*z,5,col.yellow)cam.End3D2D()end;function ENT:Draw()self:DrawModel()local m=self:GetTarget()if IsValid(m)then self:DrawBroadcastables(m)self:DrawNamePlate(m)end end;function ENT:DrawTranslucent()self:DrawModel()local m=self:GetTarget()if IsValid(m)then self:DrawBroadcastables(m)self:DrawNamePlate(m)end end;function ENT:OnRemove()hook.Remove('ShouldDrawLocalPlayer',self)end;net('srp.hologram.SendEntity',function()local l=net.ReadEntity()if IsValid(l)&&l.EntityAdded then l:EntityAdded(net.ReadEntity())end end)net('srp.hologram.RemoveEntity',function()local l=net.ReadEntity()if IsValid(l)&&l.EntityRemove then l:EntityRemove(net.ReadEntity())end end)net('srp.hologram.SendBulletFired',function()local D=net.ReadEntity()local b=net.ReadEntity()local c=net.ReadString()local h=net.ReadVector()local e=net.ReadVector()local f=net.ReadFloat()if IsValid(D)&&IsValid(b)then D:BulletFired(b,c,h,e,f)end end)
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_hologram_solo.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_item/shared.lua:
DEFINE_BASECLASS'base_anim'ENT.PrintName='RP Item'ENT.Author='Scott'ENT.Contact=''ENT.Purpose=''ENT.Instructions=''ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.HighLagRisk=false;ENT.Interactive=true;ENT.IsItem=true;ENT.DoNotDuplicate=true;ENT.DontSit=true;function ENT:SetupDataTables()self:NetworkVar('String',0,'ItemID')self:NetworkVar('Int',0,'Count')self:NetworkVarNotify('ItemID',self.RecacheItem)end;function ENT:Initialize()self:SetSolid(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_jetpack/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_note/cl_init.lua:
include'shared.lua'for a=1,#ENT.Fonts do local b=ENT.Fonts[a]surface.CreateFont('Note_'..b,{font=b,size=22,antialias=true,weight=600})end;function ENT:PlayerUse()if IsValid(self.panel)then return end;srp.ui.Create('srp_note',function(c)c:Setup(self,self:GetFont(),self:GetTitle(),self:GetText(),input.IsKeyDown(KEY_LSHIFT)&&LocalPlayer():IsTrialGamemaster())c:Center()c:MakePopup()self.panel=c end)end;local d=20;local e='Read Note'function ENT:DrawInteraction(f)surface.SetFont('ui_label.l')surface.SetDrawColor(255,255,255,255)surface.SetMaterial(f.OnPickup)surface.SetTextColor(255,255,255,255)local g,h=surface.GetTextSize(e)g=g+d+4;local i,j=(ScrW()-d)/2,(ScrH()-(d+20))*.6;surface.DrawTexturedRect(i,j,d,d)surface.SetTextPos(i+d+2,j+2)surface.DrawText(e)end;net('srp.note.open',function()local k=net.ReadEntity()if IsValid(k)&&k:GetClass()=='rp_note'then k:PlayerUse()end end)
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_npc/shared.lua:
ENT.Base='base_ai'ENT.Type='ai'ENT.RenderGroup=RENDERGROUP_OPAQUE;ENT.AutomaticFrameAdvance=true;ENT.Spawnable=false;ENT.DoNotDuplicate=true;ENT.DontSit=true;function ENT:SetupDataTables()self:NetworkVar('Int',0,'NPCID')self:NetworkVar('String',0,'AnimationString')self:NetworkVarNotify('NPCID',self.OnDataReceived)end;function ENT:OnDataReceived(a,a,b)local c=srp.npc.data[b]||{}self.data=c;self.NPCIcon=c.Icon;self.NPCTitle=c.Name;self.NPCTitleColor=c.Color end;function ENT:GetData()return self.data||{}end;function ENT:GetNPCTitle()return self.NPCTitle end;function ENT:GetNPCTitleColor()return self.NPCTitleColor end;function ENT:GetTitle()return self:GetNPCTitle(),self:GetNPCTitleColor()end;function ENT:GetIconMaterial()return self.NPCIcon end;function ENT:GetDialogue()return self.DialogueID end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_pallet/shared.lua:
ENT.Type='anim'ENT.Base='base_anim'ENT.Model=Model'models/galactic/me3fix/pallette01.mdl'ENT.MilRPModel=Model'models/props_junk/wood_pallet001a.mdl'ENT.PrintName='Pallet'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Spawnable=info.Dev||false;ENT.AdminOnly=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Category='SUP'ENT.DoNotDuplicate=true;ENT.MaxBoxes=3;ENT.BoxOffset=22;ENT.MRPBoxOffset=14;ENT.StorageModel=Model'models/props/campcratebig.mdl'ENT.MilRPStorageModel=Model'models/Items/ammoCrate_Rockets.mdl'ENT.PalletMaterial='galactic/supcraftingstation/hologram.vmt'ENT.PalletHeight=18;ENT.MRPPalletHeight=12
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_questitem/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_roominfo_db.lua:
AddCSLuaFile()ENT.Base='rp_roominfo'ENT.Type='anim'ENT.Category='SUP'ENT.PrintName='Room Info DB'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Spawnable=info.Dev;ENT.Model=Model'models/lt_c/holo_wall_unit.mdl'ENT.ClaimableBoard=true;ENT.DoNotDuplicate=true;ENT.NetworkPlayerUse=true;ENT.RequiredPermission='train'function ENT:GetTypes()return{{Name='UNCLAIMED',Color=col.grey_dark},{Name='EOD/Sweep Training',Color=col.red},{Name='Hostage Training',Color=col.yellow},{Name='Debrief',Color=col.blue}}end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_routebeacon/cl_init.lua:
include'shared.lua'local a=Color(0,0,0,222)local b=CreateMaterial('capturezone_rad',"UnlitGeneric",{["$basetexture"]='galactic/projectionred',["$translucent"]=1,["$additive"]=1,["$vertexcolor"]="1",["$vertexalpha"]="1"})function ENT:AttachLight()local c=ents.CreateClientProp()c:SetModel('models/effects/vol_light128x256.mdl')c:SetParent(self)c:SetLocalPos(Vector(0,0,-50))c:SetLocalAngles(Angle(180,0,0))c:Spawn()c:DrawShadow(false)self.light=c end;function ENT:OnRemove()if IsValid(self.light)then self.light:Remove()end end;function ENT:Draw()if!self:InGroup(LocalPlayer())then return end;if!IsValid(self.light)then self:AttachLight()else self.light:SetColor(self:GetColor())end;local d=self:GetPos()local e=LocalPlayer():EyePos()local f=e:Distance(d)local g=d+Vector(0,0,250)local h=(e-d):Angle()h.p=0;if f>250 then h.r=90;h.y=h.y+90;cam.Start3D2D(g,h,.5)draw.SimpleText(self.PrintName,'ui_header.xl',0,8,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)cam.End3D2D()else local i,j=ScrW(),ScrH()cam.Start2D()draw.SimpleText(self.PrintName,'ui_header.l',i*0.5,80,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)cam.End2D()end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_rtsdrone/shared.lua:
ENT.PrintName='Trading Terminal'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Spawnable=info.Dev;ENT.AdminOnly=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Category='SUP'ENT.Type='anim'ENT.Base='base_anim'ENT.Model=Model'models/hunter/blocks/cube075x075x025.mdl'ENT.IsRTSDrone=true;ENT.LookAngle=Angle(35,45,0)function ENT:GetTrace()local a=CLIENT&&self:GetSmoothPos()||self:GetPos()local b=self:GetForward()return util.TraceLine{start=a,endpos=a+b*20000}end;function ENT:StartCommand(c,d)if self:GetOwner()!=c then return end;local e=d:KeyDown(IN_DUCK)&&-1||d:KeyDown(IN_JUMP)&&1||0;d:SetUpMove(e*c:GetWalkSpeed())end;function ENT:SetupMove(c,f,d)if self:GetOwner()!=c then return end;c:SetObserverMode(OBS_MODE_IN_EYE)local g=35/180;local h=d:GetViewAngles()h.p=math.Remap(h.p,-90,90,0,self.LookAngle.p)f:SetAngles(h)f:SetOrigin(self:GetNetworkOrigin())f:SetVelocity(Vector())end;function ENT:Move(c,f)if self:GetOwner()!=c then return end;local i=1*FrameTime()local j=6*FrameTime()if f:KeyDown(IN_SPEED)then i=2*FrameTime()j=10*FrameTime()end;local a=f:GetOrigin()local k=f:GetVelocity()local l=f:GetAngles()local m=math.Clamp(f:GetForwardSpeed(),-400,400)local n=math.Clamp(f:GetSideSpeed(),-400,400)local o=math.Clamp(f:GetUpSpeed(),-400,400)local p=f:GetAngles()p.p=0;local b=p:Forward():GetNormalized()local q=p:Right():GetNormalized()local r=p:Up():GetNormalized()a=a+(b*m+q*n)*i;a=a+r*o*j;f:SetVelocity(k)f:SetOrigin(a)f:SetAngles(l)return true end;function ENT:FinishMove(c,f)if self:GetOwner()!=c then return end;self:SetNetworkOrigin(f:GetOrigin())self:SetAbsVelocity(f:GetVelocity())self:SetAngles(f:GetAngles())local s=self:GetPhysicsObject()if SERVER&&IsValid(s)then s:EnableMotion(true)s:SetPos(f:GetOrigin())s:Wake()s:EnableMotion(false)end;return true end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_safelanding/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_shielddome/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_simroom_waves/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_statue/shared.lua:
ENT.PrintName='Statue'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Spawnable=info.Dev;ENT.AdminOnly=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Category='SUP'ENT.Type='anim'ENT.Base='base_anim'ENT.NetworkPlayerUse=true;local a=Model'models/hunter/blocks/cube3x3x05.mdl'function ENT:SetupDataTables()self:NetworkVar('Entity',0,'StatueOwner')self:NetworkVar('Int',0,'AnimationIndex')self:NetworkVar('Int',1,'AnimationCycle')self:NetworkVar('Bool',0,'Looping')self:NetworkVar('String',0,'EntModel')self:NetworkVarNotify('EntModel',self.OnModelChanged)end;function ENT:SpawnFunction(b,c,d)local e=ents.Create(d)e:SetPos(c.HitPos+Vector(0,0,14))e:Spawn()e:Activate()e:StatueOwner(b)end;function ENT:Initialize()self:SetModel(self.Model)end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_stove/shared.lua:
DEFINE_BASECLASS'base_anim'ENT.Type='anim'ENT.Spawnable=info.Dev;ENT.Category='SUP Development'ENT.PrintName='Simple Stove'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Model=Model'models/props/console2.mdl'ENT.DoNotDuplicate=true;function ENT:SetupDataTables()self:SetNWVarProxy('Recipe',function(self,a,a,b)if CLIENT then self:OnRecipeUpdated(b)end end)end;function ENT:SetCooking(c)self:SetNetworkedBool('Cooking',c)end;function ENT:GetCooking()return self:GetNetworkedBool('Cooking')end;function ENT:SetRecipe(d)self:SetNetworkedString('Recipe',d)end;function ENT:GetRecipe()return self:GetNetworkedString('Recipe')end;function ENT:SetCook(e)self:SetNetworkedEntity('Cook',e)end;function ENT:GetCook()return self:GetNetworkedEntity('Cook')end;function ENT:SetFinishTime(f)self:SetNetworkedInt('FinishTime',f)end;function ENT:GetCook()return self:GetNetworkedInt('FinishTime')end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_vault_button.lua:
AddCSLuaFile()ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Spawnable=info.Dev;ENT.AdminOnly=info.Dev;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Category='SUP'ENT.Type='anim'ENT.Base='base_anim'ENT.Model=Model'models/maxofs2d/button_04.mdl'ENT.RTSInteraction=true;ENT.NetworkPlayerUse=true;ENT.DontSit=true;ENT.DontFreeze=true;ENT.DoNotDuplicate=true;ENT.IgnoreNoGrav=true;ENT.UIPosition=Vector(-2.1,-15,2.6)ENT.UIAngle=Angle(0,90,0)function ENT:SetupDataTables()end;function ENT:Initialize()end;function ENT:CanUse(a)return(!self.NextUse||self.NextUse<CurTime())&&(a:IsRoot()||a:IsEventCharacter()||a:HasPermission('jedi')&&a:HasPermission('officer'))end;function ENT:Use(a)if!self:CanUse(a)then return end;local b=ents.FindByName('vault_door')[1]b:Fire('Open','1')self.NextUse=CurTime()+40 end;if CLIENT then local c=112;local d=130;local e=CreateMaterial('timer_scanlines','UnlitGeneric',{['$basetexture']='dev/dev_scanline',['$translucent']=1,['$additive']=1,['$vertexcolor']='1',['$vertexalpha']='1',['Proxies']={['TextureScroll']={['texturescrollvar']='$baseTextureTransform',['texturescrollrate']=.1,['texturescrollangle']=-90}}})function ENT:Draw()self:DrawModel()cam.Start3D2D(self:LocalToWorld(self.UIPosition),self:LocalToWorldAngles(self.UIAngle),.1)draw.Box(0,0,c,d,col.black)draw.SimpleText('VAULT DOOR','ui_led.s',c*.5,5,col.green,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)if math.Round(CurTime())%2==0 then draw.SimpleText('[E]','ui_led.r',c*.5,d*.5,col.red,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)else draw.SimpleText(' E ','ui_led.r',c*.5,d*.5,col.green,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;surface.SetDrawColor(100,255,100,25)surface.SetMaterial(e)surface.DrawTexturedRect(0,0,c,d)cam.End3D2D()end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_warfund.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_water.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='base_anim'ENT.Category='SUP Development'ENT.PrintName='Puddle'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Model=Model'models/props_foliage/swamp_waterplant01.mdl'ENT.Material='models/effects/vol_light001'ENT.Spawnable=info.Dev;ENT.MaxPuddleCount=6;ENT.SoundCleanup=Sound'players.wav'ENT.Scale=2;function ENT:Initialize()self:SetModel(self.Model)self:SetMaterial(self.Material)self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)self:DrawShadow(false)self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_NONE)self.PuddleCount=self.MaxPuddleCount;self.CollisionScale=40*self.Scale;self.Players={}if SERVER then else local a=EffectData()a:SetOrigin(self:GetPos())a:SetMagnitude(12)a:SetScale(12)util.Effect('WaterSplash',a,true,true)end end;function ENT:Use(b)self:Cleanup(b)end;function ENT:Cleanup(b)if self.NextUse&&self.NextUse>CurTime()then return end;self.PuddleCount=self.PuddleCount-1;b:AddTalentXP(50,'labourer')b:AddMoney(50)local c=self.PuddleCount/self.MaxPuddleCount;local d=self.Scale*c;local e=self.CollisionScale*c;self:SetModelScale(d,.5)self:SetCollisionBounds(Vector(-e,-e,0),Vector(e,e,2))self:EmitSound(self.SoundCleanup)local a=EffectData()a:SetStart(self:GetPos())a:SetOrigin(b:GetEyeTraceNoCursor().HitPos)a:SetMagnitude(12)a:SetScale(12)util.Effect('WaterSplash',a,true,true)if self.PuddleCount==0 then self:Remove()end;self.NextUse=CurTime()+.5 end
--addons/!lpakr_out/lua/entities/shield/shared.lua:
ENT.Type='anim'ENT.Base='base_anim'ENT.PrintName='Shield'ENT.Author='Drover'ENT.Spawnable=true;ENT.Category='Shield'ENT.AutomaticFrameAdvance=true;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.MaxHealth=80000;ENT.HealthPoints=80000;ENT.IsShield=true;ENT.SkinSlotId=0;function ENT:SetupDataTables()self:NetworkVar('String',0,'OwnerName')self:NetworkVar('Entity',0,'ShieldOwner')end;function ENT:LoadSkins()local a=cosmetics.GetEquipped(self:GetShieldOwner(),'weapon_shield',cosmetics.WEAPON,cosmetics.SLOT.WEAPON.SKIN)if a then self:SetCosmetics(a)end end;function ENT:SetCosmetics(a)local b=self:GetShieldOwner()if!IsValid(b)then return end;if a:GetSlot()==cosmetics.SLOT.WEAPON.SKIN then if a:GetMaterial()then self.SubMaterials={[self.SkinSlotId]=a:GetMaterial():GetName()}elseif a:GetSubMaterials()then self.SubMaterials=a:GetSubMaterials()end end end
--addons/!lpakr_out/lua/entities/sup_areatrigger/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/sup_detonate.lua:
AddCSLuaFile()ENT.PrintName="Detonator"ENT.Type='anim'ENT.Base='base_anim'ENT.Spawnable=true;ENT.RenderGroup=RENDERGROUP_OPAQUE;ENT.ExplodeSound='det_armed'ENT.CountdownSound='det_countdown'ENT.PlaceSound='det_placed'ENT.UIPosition=Vector(0,0,3)ENT.UIAngle=Angle(0,90,0)sound.Add({name="det_placed",sound=Sound'weapons/sw_detonator/sw_detonator_stick.wav',channel=CHAN_WEAPON,volume=1.0,level=70,pitch={98,102}})sound.Add({name="det_armed",sound=Sound'ui/arm_bomb.wav',channel=CHAN_WEAPON,volume=1.0,level=70,pitch=100})sound.Add({name="det_countdown",sound=Sound'buttons/blip2.wav',channel=CHAN_WEAPON,volume=1.0,level=70,pitch=100})function ENT:SetupDataTables()self:NetworkVar('Bool',0,'Active')self:NetworkVar('Int',0,'Ticks')self:NetworkVarNotify('Ticks',function(a,b,c,d)if!self.MaxTicks||self.MaxTicks<d then self.MaxTicks=d end end)end;function ENT:Initialize()self.Time=5;self.MaxTicks=5;self:SetModel'models/weapons/w_swrcdeton.mdl'self:EmitSound(self.PlaceSound)end;function ENT:StartCountdown()if!self.live then self.live=true;self.Think=self.CountDownThink;self:SetActive(true)end end;function ENT:Explode()if self.exploding then return end;self.exploding=true;local e=self.PropOwner;local f=IsValid(e)&&1+e:GetTalentValue('explosiveradius',0)||1;local g=EffectData()g:SetOrigin(self:GetPos())g:SetNormal(self:GetUp())util.Effect('Explosion',g)util.BlastDamage(self,IsValid(e)&&e||self,self:GetPos(),250*f,250)if IsValid(self.Attached)then self.Attached:Fire('Open','1')end;self:Remove()end;function ENT:SetTimer(h)self.Time=h;self:SetTicks(self.Time)end;function ENT:Use(i,j)self:StartCountdown()end;function ENT:OnTakeDamage(k)self:Explode()end;function ENT:CountDownThink()if!self.live||self.exploding then return end;self.Tick=(self.Tick||self.Time)-1;self:SetTicks(self.Tick)if self.Tick==1 then self:EmitSound(self.ExplodeSound,40,80)elseif self.Tick==0 then self.Think=function()end;self:Explode()return else self:EmitSound('buttons/blip2.wav',70,110-self.Tick,1)end;self:NextThink(CurTime()+1)return true end;function ENT:Draw()self:DrawModel()local l=self:GetTicks()-1;local m=l/(math.Max(l,self.MaxTicks)-1)local n=self:GetActive()&&HSVToColor(0,1-m,1)||col.orange;self.LerpPercent=Lerp(.1,self.LerpPercent||1,m)cam.Start3D2D(self:LocalToWorld(self.UIPosition),self:LocalToWorldAngles(self.UIAngle),0.03)draw.NoTexture()surface.SetDrawColor(n)surface.DrawArc(0,0,110,125,0,self.LerpPercent*360,45)draw.SimpleText(self:GetTicks()||0,'ui_header.xxl',0,0,n,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)cam.End3D2D()end
--addons/!lpakr_out/lua/entities/wos_lightning_coil/cl_init.lua:
include('shared.lua')local a=Model("models/Combine_Helicopter/helicopter_bomb01.mdl")local b="models/alyx/emptool_glow"local c=28/4;ENT.Radius=100;ENT.LifeSpan=0;function ENT:Initialize()self:CreateBoom()end;function ENT:CreateBoom()if IsValid(self.Orb)then self.Orb:Remove()end;self.StartLife=CurTime()self.LifeSpan=CurTime()+0.5;self.Orb=ClientsideModel(a,RENDERGROUP_OPAQUE)self.Orb:SetRenderMode(RENDERMODE_TRANSALPHA)self.Orb:SetPos(self:GetOwner():GetPos())self.Orb:SetColor(Color(255,255,255,100))self.Orb:SetModelScale(0,0)self.Orb:SetMaterial("models/effects/splodearc_sheet")self:EmitSound("weapons/physcannon/energy_sing_explosion2.wav",100,math.random(65,135))end;function ENT:OnRemove()if IsValid(self.Orb)then self.Orb:Remove()end end;function ENT:Think()if IsValid(self.Orb)then local d=(CurTime()-self.StartLife)/0.01;self.Orb:SetModelScale(d,0)self.Orb:SetMaterial(b)self.Orb:SetPos(self:GetOwner():GetPos())if self.LifeSpan<=CurTime()then self:CreateBoom()end end end;function ENT:Draw()end
--addons/!lpakr_out/lua/effects/anzati_hearts/init.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/dronesrewrite_explosion.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/dronesrewrite_explosion.lua:
AddCSLuaFile()function EFFECT:Init(a)self.Start=a:GetOrigin()self.size=4000;self.Emitter=ParticleEmitter(self.Start)for b=1,30 do local c=VectorRand()local d=self.Emitter:Add("effects/fleck_cement"..math.random(1,2),self.Start)d:SetDieTime(math.random(1,15))d:SetStartAlpha(math.random(50,150))d:SetEndAlpha(0)d:SetStartSize(math.random(1,3))d:SetRoll(math.Rand(-10,10))d:SetRollDelta(math.Rand(-10,10))d:SetEndSize(0)d:SetVelocity(c*450)d:SetGravity(Vector(0,0,-50))d:SetColor(0,0,0)end;for b=1,10 do local c=VectorRand()local d=self.Emitter:Add("particle/smokesprites_000"..math.random(1,9),self.Start+c)d:SetDieTime(math.random(2,3))d:SetStartAlpha(math.random(50,150))d:SetEndAlpha(0)d:SetStartSize(20)d:SetRollDelta(math.Rand(-1,1))d:SetEndSize(80)d:SetVelocity(c*40)d:SetGravity(Vector(0,0,20))d:SetCollide(true)d:SetColor(50,50,20)end;for b=3,math.random(3,6)do local c=VectorRand()for e=1,math.random(4,8)do local d=self.Emitter:Add("particle/smokesprites_000"..math.random(1,3),self.Start+c*15)d:SetDieTime(math.Rand(0.6,1.5))d:SetStartAlpha(math.random(40,80))d:SetEndAlpha(0)d:SetStartSize(20)d:SetRoll(math.Rand(-180,180))d:SetEndSize(150)d:SetVelocity((self.Start+c*e*15-self.Start):GetNormal()*e*200)d:SetAirResistance(300+e*20)d:SetCollide(true)d:SetColor(0,0,0)local d=self.Emitter:Add("particles/fir21",self.Start+c*e*math.Rand(10,18)+VectorRand()*40)d:SetDieTime(0.05)d:SetStartAlpha(40)d:SetEndAlpha(0)d:SetStartSize(20)d:SetRoll(math.Rand(-10,10))d:SetRollDelta(math.Rand(-1,1))d:SetEndSize(70)d:SetVelocity((self.Start+c*e*15-self.Start):GetNormal()*500)d:SetAirResistance(20)d:SetColor(200,150,0)end end;for b=1,30 do local c=VectorRand()local d=self.Emitter:Add("particles/fir21",self.Start+c*25)d:SetDieTime(0.1)d:SetStartAlpha(60)d:SetEndAlpha(0)d:SetStartSize(20)d:SetRoll(math.Rand(-10,10))d:SetRollDelta(math.Rand(-0.5,0.5))d:SetEndSize(60)d:SetVelocity(c*155)d:SetAirResistance(40)d:SetColor(255,200,0)end;self.Emitter:Finish()end;function EFFECT:Think()self.size=self.size-500;return self.size>0 end;function EFFECT:Render()render.SetMaterial(Material("sprites/light_ignorez"))render.DrawSprite(self.Start,self.size*2,self.size,Color(255,100,0,50))end
--addons/!lpakr_out/lua/effects/firework_stars.lua:
local a=Material'materials/galactic/ui/star.png'function EFFECT:Init(b)self.Origin=b:GetOrigin()self.StartTime=CurTime()local c=ParticleEmitter(self.Origin,false)for d=0,100 do local e=VectorRand():GetNormal()*math.Rand(1000,2500)local f=c:Add(a,self.Origin)if f then f:SetVelocity(e)f:SetLifeTime(0)f:SetDieTime(6)f:SetStartAlpha(math.random(220,255))f:SetEndAlpha(0)f:SetStartSize(math.random(5,10))f:SetEndSize(math.random(60,100))f:SetAirResistance(math.Rand(130,150))f:SetColor(255,255,255)f:SetCollide(false)f:SetBounce(1)end end;c:Finish()SafeRemoveEntityDelayed(self,15)end;function EFFECT:Think()return CurTime()<self.StartTime+0.5 end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/fireworks_america.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/fireworks_halloween.lua:
local a=Material'materials/galactic/seasonal/ghost.png'local b=Material('materials/galactic/ui/foods/pumpkin.png')local c=Material('materials/galactic/seasonal/halloween/spider.png')local d=Material('materials/galactic/seasonal/halloween/monster.png')local e=Material('materials/galactic/seasonal/halloween/ghost.png')local f=Material('materials/galactic/seasonal/halloween/zombie.png')local g={Sound('npc/zombie/zombie_die1.wav'),Sound('npc/zombie/zombie_die3.wav'),Sound('npc/stalker/go_alert2.wav')}local h={b,c,d,e,f}function EFFECT:Init(i)self.Origin=i:GetOrigin()self.StartTime=CurTime()local j=h[math.random(1,#h)]local k=ParticleEmitter(self.Origin,false)for l=0,80 do local m=VectorRand():GetNormal()*math.Rand(1000,2500)local n=k:Add(math.random()>0.3&&j||h[math.random(1,#h)],self.Origin)if n then n:SetVelocity(m)n:SetLifeTime(0)n:SetDieTime(6)n:SetStartAlpha(math.random(220,255))n:SetEndAlpha(0)n:SetStartSize(math.random(5,10))n:SetEndSize(math.random(60,100))n:SetAirResistance(math.Rand(130,150))n:SetColor(255,255,255)n:SetCollide(false)n:SetBounce(1)end end;k:Finish()SafeRemoveEntityDelayed(self,15)if LocalPlayer():IsLineOfSightClear(self)then timer.Simple(.25,function()EmitSound(g[math.random(1,#g)],self.Origin,LocalPlayer():EntIndex(),CHAN_AUTO,.6,75,0,100,10)end)end end;function EFFECT:Think()return CurTime()<self.StartTime+0.5 end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/fireworks_newyear23.lua:
return lpakr()()
--addons/ssrp_lfs/lua/effects/lfs_tracer_purple.lua:
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

	self.TracerTime = math.min( 1, self.StartPos:Distance( self.EndPos ) / 15000 )
	self.Length = math.Rand( 0.1, 0.15 )

	-- Die when it reaches its target
	self.DieTime = CurTime() + self.TracerTime
	
	local Dir = self.Dir:GetNormalized()
	
	local emitter = ParticleEmitter( self.StartPos, false )
	
	for i = 0, 12 do
		local Pos = self.StartPos + Dir * i * 0.7 * math.random(1,2) * 0.5
		
		local particle = emitter:Add( "effects/muzzleflash2", Pos )
		local Size = 1
		
		if particle then
			particle:SetVelocity( Dir * 800 )
			particle:SetDieTime( 0.05 )
			particle:SetStartAlpha( 255 * Size )
			particle:SetStartSize( math.max( math.random(10,24) - i * 0.5,0.1 ) * Size )
			particle:SetEndSize( 0 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetColor( 255,255,255 )
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
	fDelta = math.Clamp( fDelta, 0, 1 ) ^ 1

	local sinWave = math.sin( fDelta * math.pi )
	
	local Pos1 = self.EndPos - self.Dir * ( fDelta - sinWave * self.Length )
	
	render.SetMaterial( self.Mat )
	render.DrawBeam( Pos1,
		self.EndPos - self.Dir * ( fDelta + sinWave * self.Length ),
		15, 1, 0, Color(255,220,220,255) )
		
	render.SetMaterial( self.Mat2 ) 
	render.DrawSprite( Pos1, 30, 30, Color(255,220,220,255) ) 
end
--addons/ssrp_lfs/lua/effects/lvs_concussion_trail.lua:
local brown = Color( 255, 40, 100, 50 )
EFFECT.Offset = Vector(-8,0,0)

local GlowMat = Material( "effects/select_ring" )
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
			particle:SetDieTime( math.Rand(2,3) )
			particle:SetStartAlpha( 100 )
			particle:SetStartSize( math.Rand(5,6) )
			particle:SetEndSize( math.Rand(12,30) )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetColor( 50,50,50 )
			particle:SetCollide( false )
		end

		local particle = emitter:Add( "particles/flamelet"..math.random(1,5), pos )
		if particle then
			particle:SetVelocity( -self.Entity:GetForward() * math.Rand(250,800) + self.Entity:GetVelocity())
			particle:SetDieTime( math.Rand(0.2,0.4) )
			particle:SetAirResistance( 0 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( math.Rand(10,15) )
			particle:SetEndSize( 5 )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 150,50,100 )
			particle:SetGravity( Vector( 0, 0, 0 ) )
			particle:SetCollide( false )
		end

		local particle = emitter:Add( "particles/flamelet"..math.random(1,5), self.Entity:GetPos() )
		if particle then
			particle:SetVelocity( -self.Entity:GetForward() * 200 + VectorRand() * 50 )
			particle:SetDieTime( 0.25 )
			particle:SetAirResistance( 600 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( math.Rand(6,10) )
			particle:SetEndSize( math.Rand(2,3) )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 255,100,200 )
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

	render.DrawSprite( pos, 100, 100, brown )
end

--addons/ssrp_lfs/lua/effects/lvs_engine_blacksmoke.lua:

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
	local Pos = data:GetOrigin() + VectorRand() * 25
	local Ent = data:GetEntity()

	if not IsValid( Ent ) then return end

	local emitter = Ent:GetParticleEmitter( Pos )

	if not IsValid( emitter ) then return end

	local particle = emitter:Add( Materials[ math.random(1, #Materials ) ], Pos )
	
	if particle then
		particle:SetVelocity( VectorRand() * 100 )
		particle:SetDieTime( 2 )
		particle:SetAirResistance( 600 ) 
		particle:SetStartAlpha( 50 )
		particle:SetStartSize( 60 )
		particle:SetEndSize( 200 )
		particle:SetRoll( math.Rand(-1,1) * math.pi )
		particle:SetRollDelta( math.Rand(-1,1) )
		particle:SetColor( 60, 60, 60 )
		particle:SetGravity( Vector( 0, 0, 600 ) )
		particle:SetCollide( false )
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

--addons/ssrp_lfs/lua/effects/lvs_laat_wing_projector.lua:
EFFECT.Mat = Material( "effects/lvs/ballturret_projectorbeam" )
EFFECT.HitMat = Material( "sprites/light_glow02_add" )

local green = Color(0,255,0,255)
local white = Color(255, 255, 255, 255)

function EFFECT:Init( data )
	self.Entity = data:GetEntity()

	self.StartPos = Vector(-172.97,334.04,93.25)
	self.EndPos = self.Entity:GetWingTurretTarget()
end

function EFFECT:Think()
	if not IsValid( self.Entity ) or not self.Entity:GetWingTurretFire() then
		return false
	end

	self.EndPosDesired = self.Entity:GetWingTurretTarget()
	self:SetRenderBoundsWS( self.Entity:GetPos(), self.EndPosDesired )

	return true

end

function EFFECT:Render()
	if not self.EndPosDesired then return end

	self.EndPos = self.EndPos + (self.EndPosDesired - self.EndPos) * FrameTime() * 10

	for i = -1,1,2 do
		local StartPos = self.Entity:LocalToWorld( self.StartPos * Vector(1,i,1) )

		local Trace = util.TraceLine( { start = StartPos, endpos = self.EndPos} )
		local EndPos = Trace.HitPos

		if self.Entity:WorldToLocal( EndPos ).z < 0 then
			self.StartPos = Vector(-172.97,334.04,93.25)
		else
			self.StartPos = Vector(-174.79,350.05,125.98)
		end

		if Trace.Entity == self.Entity then continue end

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
end

--addons/ssrp_lfs/lua/effects/lvs_laser_explosion.lua:
local white = Color( 255, 255, 255, 255)
local GlowMat = Material( "sprites/light_glow02_add" )

function EFFECT:Init( data )
	self.Pos = data:GetOrigin()
	self.Col = data:GetStart() or Vector(255,100,0)

	self.Color = Color( self.Col.x, self.Col.y, self.Col.z, 255)

	self.LifeTime = 0.4
	self.DieTime = CurTime() + self.LifeTime

	local emitter = ParticleEmitter( self.Pos, false )

	if not IsValid( emitter ) then return end

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
			particle:SetColor( self.Col.x,self.Col.y,self.Col.z )
			particle:SetGravity( Vector(0,0,-600) )

			particle:SetAirResistance( 0 )

			particle:SetCollide( true )
			particle:SetBounce( 0.5 )
		end
	end

	for i = 0, 20 do
		local particle = emitter:Add( "sprites/flamelet"..math.random(1,5), self.Pos )

		if particle then
			particle:SetVelocity( VectorRand(-1,1) * 500 )
			particle:SetDieTime( 0.15 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 10 )
			particle:SetEndSize( 32 )
			particle:SetEndAlpha( 100 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetRollDelta( math.Rand( -1, 1 ) * 100 )
			particle:SetColor( self.Col.x,self.Col.y,self.Col.z )
			particle:SetCollide( false )
		end
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
	render.SetMaterial( GlowMat )
	render.DrawSprite( self.Pos, 400 * Scale, 400 * Scale, self.Color )
	render.DrawSprite( self.Pos, 100 * Scale, 100 * Scale, white )
end

--addons/ssrp_lfs/lua/effects/lvs_laser_red.lua:
local red = Color( 255, 0, 0, 255 )
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

	local len = 1000 * bullet:GetLength()

	render.SetMaterial( self.MatSprite )
	render.DrawBeam( endpos - dir * len * 4, endpos + dir * len * 4, 200, 1, 0, red  )

	render.SetMaterial( self.MatBeam )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 45, 1, 0, red )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 15, 1, 0, white )
end

--addons/!lpakr_out/lua/effects/rb655_force_absorb.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=ParticleEmitter(b)if!c then return end;local d=c:Add("hud/health_over_bg",b+Vector(math.random(-16,16),math.random(-16,16),math.random(0,72)))if d then d:SetLifeTime(0)d:SetDieTime(2)d:SetGravity(Vector(0,0,100))d:SetVelocity(Vector(0,0,0))d:SetStartSize(math.random(1,5))d:SetEndSize(math.random(0,1))d:SetStartAlpha(math.random(200,255))d:SetEndAlpha(0)d:SetColor(255,64,64)end;c:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/rb655_force_repulse_out.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/sup_laser_blue.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/sup_laser_green_lime.lua:
EFFECT.Speed=20000;EFFECT.Length=50;EFFECT.UseModel=false;local a=Material'effects/sw_laser_green_main'local b=Material'effects/sw_laser_green_front'local c=Vector()function EFFECT:Init(d)self.StartPos=d:GetStart()self.EndPos=d:GetOrigin()self.Scale=d:GetScale()if self.Scale==0 then self.Scale=1 end;local e=d:GetEntity()if!self.StartPos||!self.EndPos||!IsValid(e)then self.DieTime=0;return end;local f=d:GetAttachment()if IsValid(e)then if e.Owner==LocalPlayer()&&LocalPlayer():GetViewModel()!=LocalPlayer()&&!LocalPlayer():ShouldDrawLocalPlayer()then local g=e.Sequence&&(e.Sequence:find('right')&&MuzzlePosition2||MuzzlePosition)||nil;g=g||e.Akimbo&&(e.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition;self.StartPos=g||self.StartPos else local h=e.Akimbo&&(e.AkimboLeftFire&&f||f+1)||f;local f=e:GetAttachment(h)if f&&f.Pos then self.StartPos=f.Pos else self.DieTime=0;return end end end;if self.StartPos==c||self.EndPos==c then self.DieTime=0;return end;self.Dir=(self.EndPos-self.StartPos):GetNormalized()self:SetRenderBoundsWS(self.StartPos+self.Dir,self.EndPos)self.StartTime=CurTime()self.Distance=self.StartPos:Distance(self.EndPos)self.TracerTime=self.Distance/(self.Scale*self.Speed)self.DieTime=self.StartTime+self.TracerTime;local i=EffectData()i:SetOrigin(self.StartPos+self.Dir*10)i:SetNormal(self.Dir)i:SetMagnitude(0)i:SetScale(1)util.Effect('StriderMuzzleFlash',i)end;function EFFECT:Think()if CurTime()>self.DieTime then return false end;return true end;function EFFECT:Render()if CurTime()>=self.DieTime then return end;if srp.nvg.IsEnabled()then return end;local j=self.Scale||1;local k=(CurTime()-self.StartTime)/self.TracerTime;if k<0 then return end;local l=self.StartPos+self.Dir*self.Distance*k;local m=l+self.Dir*self.Length*j;if a then render.SetMaterial(a)render.DrawBeam(l,m,j*15,0,1,col.green_dark)end;if b then render.SetMaterial(b)render.DrawSprite(m,j*15,j*15,col.green_dark)end;self.dlight=DynamicLight(self:EntIndex())if self.dlight then self.dlight.pos=m;self.dlight.r=10;self.dlight.g=200;self.dlight.b=10;self.dlight.brightness=2;self.dlight.Decay=2000;self.dlight.Size=500;self.dlight.DieTime=CurTime()+.1 end end
--addons/!lpakr_out/lua/effects/sup_laser_iceblast.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/sup_laser_maroon.lua:
return lpakr()()
--addons/!lpakr_out/lua/effects/sup_saber_fire/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=a:GetEntity()if!f then return end;for h=0,d,3 do local i=b+c*(d-h)local j=f:Add("particle/fire",i)if j then local k=i-b;local l=k:Angle()j:SetLifeTime(0)j:SetDieTime(0.1)j:SetGravity(vector_origin)j:SetVelocity(k)j:SetStartSize(5)j:SetEndSize(2)j:SetStartAlpha(math.random(110,220)/8)j:SetEndAlpha(0)e.p=e.p+d*55;e.y=e.y+d*55;j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(l)end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/thor_storm/init.lua:
EFFECT.Mat=Material("trails/electric")function EFFECT:Init(a)self.Position=a:GetStart()self.WeaponEnt=a:GetEntity()self.Attachment=a:GetAttachment()self.StartPos=self.Position;self.EndPos=a:GetOrigin()local b=self.StartPos-self.EndPos;b:Normalize()self.Dir=b;self.Entity:SetRenderBoundsWS(self.StartPos,self.EndPos)self.Alpha=100;self.Color=Color(0,255,255,self.Alpha)local c=DynamicLight(self:EntIndex())if c then c.Pos=self.StartPos;c.r=255;c.g=150;c.b=50;c.Brightness=3;c.Decay=256;c.size=256*math.Rand(0.5,1.0)c.DieTime=CurTime()+5 end end;function EFFECT:Think()self.Entity:SetRenderBoundsWS(self.StartPos,self.EndPos)self.Alpha=self.Alpha-FrameTime()*200;self.Color=Color(255,255,255,self.Alpha)return self.Alpha>0 end;function EFFECT:Render()if self.Alpha<1 then return end;if self.Alpha<1 then return end;self.Length=(self.StartPos-self.EndPos):Length()local d=CurTime()*-0.2;for e=1,10 do render.SetMaterial(self.Mat)d=d+e*0.05*d;render.DrawBeam(self.StartPos,self.EndPos,e*self.Alpha*0.03,d,d+self.Length/(128+self.Alpha),self.Color)render.DrawSprite(self.StartPos+self.Dir*e,e*5,e*5,Color(self.Color.r,self.Color.g,self.Color.b,self.Alpha))render.DrawSprite(self.EndPos,e*5,e*5,Color(self.Color.r,self.Color.g,self.Color.b,self.Alpha))end end
--addons/!lpakr_out/lua/effects/thor_thunder/init.lua:
EFFECT.Mat=Material("trails/electric")function EFFECT:Init(a)self.Position=a:GetStart()self.WeaponEnt=a:GetEntity()self.Attachment=a:GetAttachment()self.StartPos=self:GetTracerShootPos(self.Position,self.WeaponEnt,self.Attachment)self.EndPos=a:GetOrigin()local b=self.StartPos-self.EndPos;b:Normalize()self.Dir=b;self.Entity:SetRenderBoundsWS(self.StartPos,self.EndPos)self.Alpha=100;self.Color=Color(0,255,255,self.Alpha)local c=DynamicLight(self:EntIndex())if c then c.Pos=self.StartPos;c.r=255;c.g=150;c.b=50;c.Brightness=3;c.Decay=256;c.size=256*math.Rand(0.5,1.0)c.DieTime=CurTime()+5 end end;function EFFECT:Think()self.Entity:SetRenderBoundsWS(self.StartPos,self.EndPos)self.Alpha=self.Alpha-FrameTime()*200;self.Color=Color(255,255,255,self.Alpha)return self.Alpha>0 end;function EFFECT:Render()if self.Alpha<1 then return end;if self.Alpha<1 then return end;self.Length=(self.StartPos-self.EndPos):Length()local d=CurTime()*-0.2;for e=1,10 do render.SetMaterial(self.Mat)d=d+e*0.05*d;render.DrawBeam(self.StartPos,self.EndPos,e*self.Alpha*0.03,d,d+self.Length/(128+self.Alpha),self.Color)render.DrawSprite(self.StartPos+self.Dir*e,e*5,e*5,Color(self.Color.r,self.Color.g,self.Color.b,self.Alpha))render.DrawSprite(self.EndPos,e*5,e*5,Color(self.Color.r,self.Color.g,self.Color.b,self.Alpha))end end
--addons/!lpakr_out/lua/effects/wos_unstable_discharge/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)if!f then return end;for g=0,d do local h=b+c*(d-g)local i=f:Add("effects/muzzleflash"..math.random(1,4),h)if i then local j=h-b;local k=j:Angle()i:SetLifeTime(0)i:SetDieTime(0.3)i:SetGravity(vector_origin)i:SetVelocity(j)i:SetStartSize(6)i:SetEndSize(0)i:SetStartAlpha(math.random(110,220)/8)i:SetEndAlpha(0)i:SetColor(e.p,e.y,e.r)i:SetAngleVelocity(k)end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/badmin/modules/player_blocking/init_cl.lua:
cvar.Register'blocked_players':SetDefault(''):SetEncrypted()function ba.PlayerIsBlocked(a)return cvar.Get('blocked_players'):GetMetadata(a)end;function PLAYER:Block(b)if self==LocalPlayer()then return end;self:SetMuted(b)local c=cvar.Get('blocked_players')c:AddMetadata(self:SteamID(),b)c:Save()if b then chat.AddText(ui.col.White,self:NameID()..' has been blocked. ',ui.col.Red,'WARNING: ',ui.col.White,'This only blocks them for you and does not block local chat. If this is not adequate in diffusing the situation, please report them to a staff member.')else chat.AddText(ui.col.White,self:NameID()..' has been unblocked.')end end;function PLAYER:IsBlocked()return ba.PlayerIsBlocked(self:SteamID())end;hook('InitPostEntity','ba.playerblocking.OnEntityCreated',function()for d,e in player.Iterator()do if e:IsBlocked()then e:SetMuted(true)end end end)hook('OnEntityCreated','ba.playerblocking.OnEntityCreated',function(f)if f:IsPlayer()&&f:IsBlocked()then f:SetMuted(true)end end)hook('PlayerStartVoice','ba.playerblocking.PlayerStartVoice',function(g)if IsValid(g)&&g:IsBlocked()then g:SetMuted(true)end end)
--addons/!lpakr_out/lua/badmin/modules/rewards/init_cl.lua:
local a=Material('sup/gui/generic/discord.png','smooth noclamp')local b=Material('sup/gui/generic/steam.png','smooth noclamp')local c=Material('sup/gui/generic/logo.png','smooth noclamp')local d=PLAYER.SteamName||PLAYER.Name;local e={}function e:Init()self:SetText''end;local f=ui.col.White:Copy()f.a=150;function e:Paint(g,h)if self:IsHovered()&&!self.IsClaimed then derma.SkinHook('Paint','TabButton',self,g,h)else draw.RoundedBox(5,0,0,g,h,ui.col.Background)draw.RoundedBox(5,0,0,h,h,ui.col.Background)end;surface.SetDrawColor(255,255,255,self.IsClaimed&&150||255)surface.SetMaterial(self.Material)surface.DrawTexturedRect(10,10,h-20,h-20)local i=g*0.5;draw.SimpleText(self.Title,'ui.22',i,10,self.IsClaimed&&f||ui.col.White,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)if self.IsClaimable&&!self.IsClaimed then draw.SimpleText('Claim your '..self.Reward..' Credits','ui.16',i,h-10,ui.col.DarkGreen,TEXT_ALIGN_CENTER,TEXT_ALIGN_BOTTOM)else draw.SimpleText(self.IsClaimed&&'Claimed'||self.Description,'ui.16',i,h-10,self.IsClaimed&&f||ui.col.White,TEXT_ALIGN_CENTER,TEXT_ALIGN_BOTTOM)end;if!self.IsClaimable&&!self.IsClaimed then draw.SimpleText('+'..self.Reward..' Credits'..(self.Daily&&' a day'||''),'ui.16',g-10,10,ui.col.DarkGreen,TEXT_ALIGN_RIGHT,TEXT_ALIGN_TOP)end end;function e:DoClick()if self.IsClaimable&&!self.IsClaimed then net.Start'ba.rewards.Claim'net.WriteString(self.ClaimType)net.SendToServer()self.IsClaimed=true elseif!self.IsClaimed then gui.OpenURL(self.URL)end end;function e:Think()self:SetEnabled(self.IsClaimable||!self.IsClaimed)end;vgui.Register('ba_reward_task',e,'DButton')e={}function e:Init()self.Loading=true;self.Title=ui.Create('ui_button',self)self.Title:SetText'Claim Rewards'self.Title:SetEnabled(false)self.Title:Dock(TOP)self.Discord=ui.Create('ba_reward_task',self)self.Discord:Dock(TOP)self.Discord:DockMargin(0,5,0,0)self.Discord.Title='Discord'self.Discord.Reward=250;self.Discord.Description='Join our Discord'self.Discord.Material=a;self.Discord.ClaimType='award_discord'self.Discord.URL='https://superiorservers.co/discord'self.SteamGroup=ui.Create('ba_reward_task',self)self.SteamGroup:Dock(TOP)self.SteamGroup:DockMargin(0,5,0,0)self.SteamGroup.Title='Steam Group'self.SteamGroup.Reward=250;self.SteamGroup.Description='Join our Steam Group'self.SteamGroup.Material=b;self.SteamGroup.ClaimType='award_steam'self.SteamGroup.URL='https://steamcommunity.com/gid/103582791434605559/'self.SteamName=ui.Create('ba_reward_task',self)self.SteamName:Dock(TOP)self.SteamName:DockMargin(0,5,0,0)self.SteamName.Title='Steam Name'self.SteamName.Reward=5;self.SteamName.Daily=true;self.SteamName.Description='Add \'sups.gg\' to your steam name'self.SteamName.Material=c;self.SteamName.ClaimType='award_name'self.SteamName.Think=function(j)j.IsClaimable=string.find(d(LocalPlayer()):lower(),'superiorservers.c')!=nil||string.find(d(LocalPlayer()):lower(),'sups.g')!=nil;j:SetEnabled(j.IsClaimable)end end;function e:PerformLayout(g,h)for k,l in ipairs(self:GetChildren())do l:SetTall(64)end;self.Title:SetTall(ui.SpacerHeight)end;function e:Paint(g,h)if self.Loading then draw.RoundedBox(5,0,0,g,h,ui.col.Background)local m=SysTime()*5;draw.NoTexture()surface.SetDrawColor(255,255,255)surface.DrawArc(g*0.5,h*0.5,20,25,m*80,m*80+180,20)end end;local function n()ba.http.FetchJson('rewards/'..LocalPlayer():SteamID64(),function(o)ui.Create('ui_frame',function(j)j:SetTitle'Claim Rewards'j:MakePopup()j:SetSize(500,320)j:Center()ui.Create('ui_button',function(j,p)j:Dock(TOP)j:SetTall(ui.SpacerHeight)j:DockMargin(0,0,0,5)j:SetText('Get free credits and make this popup go away')j:SetDisabled(true)end,j)ui.Create('ba_rewards_panel',function(j,p)j:Dock(FILL)j.SurpressPopup=true;j:SetData(o)end,j)end)end)end;concommand.Add('rewards_popup',n)function e:OnRemove()if!self.SurpressPopup&&self.Data&&(!self.Data.award_discord||!self.Data.award_discord_claimed||(!self.Data.award_steam||!self.Data.award_steam_claimed)||self.Data.award_name&&!self.Data.award_name_claimed)then timer.Simple(30,n)end end;function e:SetData(o)self.Loading=false;self.Data=o;self.Discord.IsClaimable=o.award_discord;self.Discord.IsClaimed=o.award_discord_claimed;self.SteamGroup.IsClaimable=o.award_steam;self.SteamGroup.IsClaimed=o.award_steam_claimed;self.SteamName.IsClaimed=o.award_name_claimed;self.SteamName.URL='https://steamcommunity.com/profiles/'..LocalPlayer():SteamID64()..'/edit'end;function e:FetchData()ba.http.FetchJson('rewards/'..LocalPlayer():SteamID64(),function(o)if!IsValid(self)then return end;self:SetData(o)end)end;vgui.Register('ba_rewards_panel',e,'Panel')
--addons/!lpakr_out/lua/badmin/modules/screengrab/vgui_cl.lua:
local a={}function a:Init()self:SetTitle('Screen Grab')self:SetSize(ScrW()*0.9,ScrH()*0.9)self:Center()self:MakePopup()self:SetKeyboardInputEnabled(false)self:SetSizable(true)self.Html=self:Add'DHTML'self.Html:Dock(FILL)end;function a:PerformLayout(b,c)self.BaseClass.PerformLayout(self,b,c)end;function a:SetData(d)self.Html:SetHTML('<style type="text/css"> body { margin: 0; padding: 0; overflow: hidden; } img { width: 100%; height: 100%; } </style> <img src="data:image/jpg;base64,'..util.Base64Encode(d)..'"> ')end;function a:SetPlayer(e)self:SetTitle('Screen Grab: '..e)end;vgui.Register('ba_screengrab_frame',a,'ui_frame')
--addons/!lpakr_out/lua/badmin/modules/sitrequests/sitsync_cl.lua:
local function a(b,c)ui.BoolRequest("Connect","Would you like to connect to "..b.."?",function(d)if d then LocalPlayer():ConCommand('connect '..c)end end)end;local function e(f)local g=LocalPlayer()ui.Create("ui_frame",function(self)ba.sitsync.Frame=self;local h=200;self:SetSize(h,#ba.sitsync.Servers*35+35)self:SetPos(ScrW()-self:GetWide()-10,(ScrH()-self:GetTall())*0.5)self:ShowCloseButton(false)self:SetTitle("Our Servers")self:SetMouseInputEnabled(true)self:SetDraggable(false)for i,j in ipairs(ba.sitsync.Servers)do local k=ui.Create('ui_button',function(k)if g:IsAdmin()then k:SetWide(h*0.75)else k:SetWide(h-10)end;k:SetPos(5,35*i)k:SetTall(30)k:SetText(j.Name)k.DoClick=function()a(j.ID,j.IP)end;if info.ChatPrefix==j.ID then k:SetDisabled(true)end end,self)if g:IsAdmin()then local l=ui.Create('ui_button',function(l)l:SetPos(k:GetWide()+10,35*i)l:SetSize(h-k:GetWide()-15,30)l:SetDisabled(true)l:SetText("")end,self)end end;self.PaintOver=function(self,h,m)if!g:IsAdmin()then return end;surface.SetFont("ui.22")surface.SetTextColor(ui.col.White)surface.SetTextPos(h-46,5)surface.DrawText("Sits")surface.SetDrawColor(ui.col.White)draw.NoTexture()surface.SetFont("ui.24")local n=h*0.75+5;local o=h-n;for i,j in ipairs(ba.sitsync.Servers)do local p=35*i;if info.ChatPrefix==j.ID then local q=table.Count(ba.sits.Pending)local r=surface.GetTextSize(q)surface.SetTextPos(n+(o-r)*0.5,p+4)surface.DrawText(q)elseif j.Cache then local r=surface.GetTextSize(j.Cache)surface.SetTextPos(n+(o-r)*0.5,p+4)surface.DrawText(j.Cache)else local s=SysTime()*5+i*0.6;surface.DrawArc(n+o*0.5,p+15,8,9,s*80,s*80+180,20)end end end end,f)end;hook('OnContextMenuOpen',function()local f=g_ContextMenu;if IsValid(ba.sitsync.Frame)then return end;e(f)end)local function t()local u=net.ReadUInt(3)local v=net.ReadUInt(5)if!ba.sitsync.ServerNetRef[u]then return end;ba.sitsync.ServerNetRef[u].Cache=v end;net('ba.SitSync',function(w)t()end)net('ba.SitSyncInit',function(w)for x=1,net.ReadUInt(4)do t()end end)
--addons/!lpakr_out/lua/badmin/modules/ssrp/commands_sh.lua:
term.Add('AdminAddedYourCredits','# has added # credits to your account.')term.Add('AdminAddedCredits','You have added # credits to #\'s account.')ba.AddCommand('Add Credits',function(a,b,c,d)local e=IsValid(a)d=d||'Given by '..(e&&a:NameID()||'Console')local f=string.Comma(c)if isplayer(b)then b:AddCredits(c,d,function()ba.notify(b,term.Get('AdminAddedYourCredits'),a,f)end)else srp.shop.AddCredits(ba.InfoTo32(b),c,d)end;if e then ba.notify(a,term.Get('AdminAddedCredits'),f,b)end end):AddParam(cmd.PLAYER_STEAMID32):AddParam(cmd.UINT):AddParam(cmd.STRING,cmd.OPT_OPTIONAL):SetFlag'*':SetHelp'Gives a player credits'hook.Remove('PlayerNoClip','ba.PlayerNoClip')
--addons/!lpakr_out/lua/badmin/modules/ssrp/logs/inventory_sh.lua:
local a=ba.logs.Term;ba.logs.AddTerm('InventoryUsedItem','(#) #(#) used item # (x#)',{'CharacterID','Name','SteamID','Item','Amount'})ba.logs.AddTerm('InventoryDropItem','(#) #(#) dropped item # (x#)',{'CharacterID','Name','SteamID','Item','Amount'})ba.logs.Create'Inventory':Hook('OnPlayerUseInventory',function(self,b,c,d,e,f)self:PlayerLog(b,a('InventoryUsedItem'),b:CharacterID(),b,e.id,f||1)end):Hook('OnPlayerDropInventory',function(self,b,c,d,e,f)self:PlayerLog(b,a('InventoryDropItem'),b:CharacterID(),b,e.id,f||1)end)