--Stealed clientside server code by exechack.cc
--Hostname: !💠⇛SuperiorServers.co - CWRP - UPDATED MAP & CONTENT! - Part 8/12 - 06/04/2025


--PATH addons/gpakr_out/lua/gpakr/eventserver-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/eventserver-3777587709.bsp',FileName='eventserver',CRC='3966654722',Len=87326232,ShouldLoad=true}
--addons/gpakr_out/lua/gpakr/jedi-data.lua:
AddCSLuaFile()
return {File='sup/gpakr/cw/jedi-2546510763.bsp',FileName='jedi',CRC='2546510763',Len=59953804,ShouldLoad=true}
--addons/!lpakr_out/lua/dash/libraries/usermessage.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/extensions/entity.lua:
ENTITY=FindMetaTable'Entity'ENTITY._Remove=ENTITY._Remove||ENTITY.Remove;function ENTITY:Remove()self.InternalIsMarkedForDeletion=true;return self:_Remove()end;ENTITY._IsMarkedForDeletion=ENTITY._IsMarkedForDeletion||ENTITY.IsMarkedForDeletion;function ENTITY:IsMarkedForDeletion()return self.InternalIsMarkedForDeletion||self:_IsMarkedForDeletion()end
--addons/!lpakr_out/lua/dash/extensions/math.lua:
math.MaxUInt=2^32-1;math.MaxInt=2^32/2-1
--addons/!lpakr_out/lua/dash/extensions/type.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/extensions/util.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/extensions/util.lua:
TRACER_FLAG_WHIZ=0x0001;TRACER_FLAG_USEATTACHMENT=0x0002;TRACER_DONT_USE_ATTACHMENT=-1;function util.Tracer(a,b,c,d,e,f,g,h)local i=EffectData()i:SetStart(a)i:SetOrigin(b)i:SetEntity(c)i:SetScale(e)if h!=nil then i:SetHitBox(h)end;local j=i:GetFlags()if f then j=bit.bor(j,TRACER_FLAG_WHIZ)end;if d!=TRACER_DONT_USE_ATTACHMENT then j=bit.bor(j,TRACER_FLAG_USEATTACHMENT)i:SetAttachment(d)end;i:SetFlags(j)if g then util.Effect(g,i)else util.Effect("Tracer",i)end end;local k={}local l={output=k}function util.InSameRoom(m,n,o)l.start=m;l.endpos=n;l.filter=o;l.collisiongroup=COLLISION_GROUP_WORLD;l.mask=MASK_SOLID_BRUSHONLY;util.TraceLine(l)return!k.HitWorld end;function util.FindHullIntersection(p,q)local r=1e12;p.output=nil;local s=p.start;local t=s+(q.HitPos-s)*2;p.endpos=t;local u={p.mins,p.maxs}local v=util.TraceLine(p)if v.Fraction!=1 then table.CopyFromTo(v,q)return q end;local w;for x=1,2 do for y=1,2 do for z=1,2 do p.endpos=Vector(t.x+u[x].x,t.y+u[y].y,t.z+u[z].z)local v=util.TraceLine(p)if v.Fraction!=1 then local A=(v.HitPos-s):LengthSqr()if A<r then w=v;r=A end end end end end;if w then table.CopyFromTo(w,q)end;return q end;local Vector=Vector;local B=ents.FindInSphere;local C=util.PointContents;local D={[CONTENTS_SOLID]=true,[CONTENTS_MOVEABLE]=true,[CONTENTS_LADDER]=true,[CONTENTS_PLAYERCLIP]=true,[CONTENTS_MONSTERCLIP]=true}function util.IsEmpty(E,F)if D[C(E)]then return false end;local G=B(E,F)for z,H in ipairs(G)do if H:IsPlayer()&&H:Alive()||H:IsNPC()||H:GetClass()=='prop_physics'then return false end end;return true end;function util.FindEmptyPos(E,F,I)E=Vector(E.x,E.y,E.z)F=F||35;if util.IsEmpty(E,F)then return E end;for x=1,I||6 do local J=x*50;if util.IsEmpty(Vector(E.x+J,E.y,E.z),F)then E.x=E.x+J;return E elseif util.IsEmpty(Vector(E.x,E.y+J,E.z),F)then E.y=E.y+J;return E elseif util.IsEmpty(Vector(E.x,E.y,E.z+J),F)then E.z=E.z+J;return E end end;return E end;local K='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'function util.Base64Decode(i)i=string.gsub(i,'[^'..K..'=]','')return i:gsub('.',function(L)if L=='='then return''end;local M,N='',K:find(L)-1;for x=6,1,-1 do M=M..(N%2^x-N%2^(x-1)>0&&'1'||'0')end;return M end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(L)if#L!=8 then return''end;local O=0;for x=1,8 do O=O+(L:sub(x,x)=='1'&&2^(8-x)||0)end;return string.char(O)end)end;function resource.AddDir(P,Q)local R,S=file.Find(P..'*','GAME')for z,H in ipairs(R)do resource.AddFile(P..H)end;if Q==true then for z,H in ipairs(S)do resource.AddDir(P..H,Q)end end end;function IsValid(T)if!T then return false end;local U=T.IsValid;if!U then return false end;return U(T)end;local V={weapon_physgun='Physics Gun',weapon_physcannon='Gravgun',weapon_rpg='RPG',weapon_crossbow='Crossbow',weapon_crowbar='Crowbar',weapon_slam='SLAM',weapon_stunstick='Stunstick',weapon_bugbait='Bugbait',weapon_frag='Grenade',weapon_medkit='Medical Kit',weapon_smg1='SMG',weapon_shotgun='Shotgun',weapon_ar2='AR2',weapon_pistol='Pistol',weapon_357='.357',func_door='Door',func_rotating='Door',func_door_rotating='Door',prop_door_rotating='Door',prop_physics='Prop',prop_dynamic='Prop',prop_effect='Effect',env_fire='Fire',entityflame='Fire',trigger_hurt='Trigger Hurt',env_explosion='Explosion',env_laser='Laser',prop_vehicle_prisoner_pod='Prisoner Pod',prop_vehicle_airboat='Airboat',prop_vehicle_jeep='Jeep',prop_vehicle_jeep_old='Jeep',npc_crow='Crow',npc_monk='Father Grigori',npc_pigeon='Pigeon',npc_seagull='Segull',npc_cscanner='City Scanner',npc_combinedropship='Combine Dropship',npc_combine_s='Combine Soldier',npc_combinegunship='Combine Gunship',npc_helicopter='Hunter-Chopper',npc_manhack='Manhack',npc_metropolice='Metro-Police',npc_rollermine='Rollermine',npc_clawscanner='npc_clawscanner',npc_stalker='Stalker',npc_strider='Strider',npc_turret_floor='Turret',npc_alyx='Alyx Vance',npc_barney='Barney Calhoun',npc_citizen='Citizen',npc_dog='Dog',npc_kleiner='Dr. Isaac Kleiner',npc_mossman='Dr. Judith Mossman',npc_eli='Eli Vance',npc_gman='G-Man',npc_vortigaunt='Vortigaunt',npc_breen='Wallace Breen',npc_antlion='Antlion',npc_antlionguard='Antlion Guard',npc_barnacle='Barnacle',npc_headcrab='Headcrab',npc_headcrab_fast='Fast Headcrab',npc_headcrab_black='Poison Headcrab',npc_fastzombie='Fast Zombie',npc_fastzombie_torso='Fast Zombie Torso',npc_poisonzombie='Poison Zombie',npc_zombie='Zombie',npc_zombie_torso='Zombie Torso',npc_satchel='SLAM: Satchel Charge',npc_tripmine='SLAM: Tripmine',npc_grenade_frag='Grenade',rpg_missile='Missile'}function util.GetPrintName(W)local X=isentity(W)&&W:GetClass()||W;local Y=V[X]if Y then return Y end;if isentity(W)then if IsValid(W)then if!string.IsNilOrEmpty(W.PrintName)then return W.PrintName end;if W.GetPrintName then local Z=W:GetPrintName()if!string.IsNilOrEmpty(Z)then return Z end end elseif W==NULL then return'World'end end;local _=weapons.GetStored(X)if _&&!string.IsNilOrEmpty(_.PrintName)then return _.PrintName end;local a0=scripted_ents.GetStored(X)if a0&&a0.t&&!string.IsNilOrEmpty(a0.t.PrintName)then return a0.t.PrintName end;print('[util.GetPrintName] Unknown print name for '..X)return X end;function util.IsHalloween(a1)local p=os.date'!*t'if a1 then return p.month==10&&p.day==31 end;if p.month==10&&p.day>=26||p.month==11&&p.day<=3 then return true end end;function util.IsChristmas(a1)local p=os.date'!*t'if a1 then return p.month==12&&p.day==25 end;if p.month==12||p.month==1&&p.day<2 then return true end end;function util.IsSummer()local p=os.date'!*t'if p.month>6&&p.month<9 then return true end end
--addons/!lpakr_out/lua/autorun/areatrigger_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/dash/libraries/netstream.lua:
local a=0;local b=2^16-2^10;local c=b-1;function net.WriteChunks(d,e)a=(a+1)%0xFFFF;local f=0;local g=function()local h=d:sub(f,f+c)f=f+b;return h end;local function i()local j=g()j=util.Compress(j)if j&&j!=''then local k=j:len()net.Start('net.Chunks')net.WriteUInt(a,16)net.WriteUInt(k,16)net.WriteData(j,k)if SERVER then else net.SendToServer()end;timer.Simple(0.1,i)end end;net.WriteUInt(a,16)net.WriteUInt(math.ceil(d:len()/b),16)timer.Simple(0.1,i)end;local l={}if SERVER then else function net.ReadChunks(m)if!m then error('callback must be provided for stream read completion')end;l[net.ReadUInt(16)]={len=net.ReadUInt(16),callback=m}end;net.Receive('net.Chunks',function(n)local a=net.ReadUInt(16)if!l[a]then error('could not receive stream from server. txnid invalid.')end;local o=l[a]local k=net.ReadUInt(16)local d=net.ReadData(k)d=util.Decompress(d)o[#o+1]=d;if#o==o.len then l[a]=nil;o.callback(table.concat(o))end end)end
--addons/!lpakr_out/lua/ui/theme.lua:
ui.SpacerHeight=35;ui.ButtonHeight=30;local a={PrintName='SUP',Author='aStonedPenguin'}local b=ui.col.SUP;local c=ui.col.Gradient;local d=ui.col.Header;local e=ui.col.Background;local f=ui.col.Outline;local g=ui.col.Hover;local h=ui.col.Button;local i=ui.col.ButtonHover;local j=ui.col.Close;local k=ui.col.CloseBackground;local l=ui.col.CloseHovered;local m=ui.col.OffWhite;local n=ui.col.FlatBlack;local o=ui.col.Black;local p=ui.col.White;local q=ui.col.Red;local r=ui.col.Green;local s=Material'gui/gradient_down'local t=Material'sup/ui/check.png'local u=Material'sup/ui/x.png'function a:PaintFrame(self,v,w)if self.Blur!=false then draw.Blur(self)end;draw.RoundedBoxEx(5,0,0,v,30,d,true,true,false,false)if self.Accent then draw.RoundedBox(5,0,0,3,30,b)end;draw.RoundedBox(5,0,0,v,w,e)end;function a:PaintFrameLoading(self,v,w)if self.ShowIsLoadingAnim then draw.RoundedBox(5,0,27,v,w-27,e)local x=SysTime()*5;draw.NoTexture()surface.SetDrawColor(255,255,255)surface.DrawArc(v*0.5,w*0.5,41,46,x*80,x*80+180,20)end end;function a:PaintFrameTitleAnim(self,v,w)local y=self.TitleAnimDelta;local z=b.a;b.a=y*255;draw.RoundedBox(5,0,0,3,30,b)b.a=z;if y==1 then self.Accent=true end end;function a:PaintPanel(self,v,w)draw.RoundedBox(5,0,0,v,w,self.BackgroundColor||e)end;function a:PaintShadow()end;function a:PaintButton(self,v,w)if!self.m_bBackground then return end;if self:GetDisabled()then if self.Corners then draw.RoundedBoxEx(5,0,0,v,w,self.BackgroundDisabledColor||self.BackgroundColor||ui.col.FlatBlack,unpack(self.Corners))else draw.RoundedBox(5,0,0,v,w,self.BackgroundDisabledColor||self.BackgroundColor||ui.col.FlatBlack)end else if self.Corners then draw.RoundedBoxEx(5,0,0,v,w,self.BackgroundColor||ui.col.Button,unpack(self.Corners))else draw.RoundedBox(5,0,0,v,w,self.BackgroundColor||ui.col.Button)end;if self:IsHovered()||self.Active then if self.Corners then draw.RoundedBoxEx(5,0,0,v,w,self.BackgroundHoverColor||ui.col.Hover,unpack(self.Corners))else draw.RoundedBox(5,0,0,v,w,self.BackgroundHoverColor||ui.col.Hover)end end end;if self.FontIcon then draw.SimpleText(self.FontIcon,'ForkAwesome',w*0.5,w*0.5,self:GetTextColor(),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end;local function A(B,C,D,E,F)local G=C+B*1-C;local H=D+B*1-D;local I=64;local J=2*math.pi/I;local K={}X,Y=E-B,F-B;for L=0,I-1 do local M=J*L%I;local N=X+B*math.cos(M)local O=Y+B*math.sin(M)if L==I/4-1 then X,Y=C+B,F-B;table.insert(K,{x=X,y=Y,u=G,v=H})elseif L==I/2-1 then X,Y=C,B;table.insert(K,{x=X,y=Y,u=G,v=H})X=C+B elseif L==3*I/4-1 then X,Y=E-B,0;table.insert(K,{x=X,y=Y,u=G,v=H})Y=B end;table.insert(K,{x=N,y=O,u=G,v=H})end;return K end;local P=Material("effects/flashlight001")function a:PaintImageButton(self,v,w)if!self.Poly||(self.LastW!=v||self.LastH!=w)then self.Poly=A(5,0,0,v,w)self.LastW=v;self.LastH=w end;render.ClearStencil()render.SetStencilEnable(true)render.SetStencilWriteMask(1)render.SetStencilTestMask(1)render.SetStencilFailOperation(STENCILOPERATION_REPLACE)render.SetStencilPassOperation(STENCILOPERATION_ZERO)render.SetStencilZFailOperation(STENCILOPERATION_ZERO)render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)render.SetStencilReferenceValue(1)draw.NoTexture()surface.SetMaterial(P)surface.SetDrawColor(o)surface.DrawPoly(self.Poly)render.SetStencilFailOperation(STENCILOPERATION_ZERO)render.SetStencilPassOperation(STENCILOPERATION_REPLACE)render.SetStencilZFailOperation(STENCILOPERATION_ZERO)render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)render.SetStencilReferenceValue(1)if self.Material then surface.SetDrawColor(255,255,255)surface.SetMaterial(self.Material)surface.DrawTexturedRect(0,0,v,w)end;if IsValid(self.AvatarImage)then self.AvatarImage:SetPaintedManually(false)self.AvatarImage:PaintManual()self.AvatarImage:SetPaintedManually(true)end;render.SetStencilEnable(false)render.ClearStencil()if self.Hovered&&self:IsEnabled()then draw.RoundedBox(5,0,0,v,w,g)end end;function a:PaintImageRow(self,v,w)if self.Active then draw.RoundedBox(5,0,0,v,w,n)return else draw.RoundedBox(5,0,0,v,w,self.BackgroundColor||e)end;if self:IsHovered()then draw.RoundedBox(5,0,0,v,w,g)end end;local Q=utf8.char(0xf00d)function a:PaintWindowCloseButton(R,v,w)if!R.m_bBackground then return end;draw.RoundedBoxEx(5,0,0,v,w,R.Hovered&&l||k,false,true,false,false)draw.SimpleText(Q,'ForkAwesome',v*0.5,w*0.5,ui.col.White,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;function a:PaintTransparentWindowCloseButton(R,v,w)if!R.m_bBackground then return end;surface.SetDrawColor(R.Hovered&&l||j)local S=math.floor(v/2-5)local T=math.floor(w/2-5)render.PushFilterMin(3)render.PushFilterMag(3)surface.DrawLine(S,T,S+10,T+10)surface.DrawLine(S,T+10,S+10,T)render.PopFilterMag()render.PopFilterMin()end;function a:PaintVScrollBar(self,v,w)end;function a:PaintButtonUp(self,v,w)end;function a:PaintButtonDown(self,v,w)end;function a:PaintButtonLeft(self,v,w)end;function a:PaintButtonRight(self,v,w)end;local U=ui.col.SUP:Copy()U.a=180;function a:PaintScrollBarGrip(self,v,w)draw.RoundedBox(5,0,0,v,w,U)end;function a:PaintScrollPanel(self,v,w)draw.RoundedBox(5,0,0,v,w,e)end;function a:PaintUIScrollBar(self,v,w)local N=self.scrollButton.x;draw.RoundedBox(5,N,0,v-N-N,w,ui.col.FlatBlack)draw.RoundedBox(5,N,self.scrollButton.y,v-N-N,self.height,U)end;function a:PaintUISlider(self,v,w)a:PaintPanel(self,v,w)draw.RoundedBox(5,1,1,v-2,w-2,n)if self.Vertical then draw.RoundedBox(5,1,self:GetValue()*w,v-2,w-self:GetValue()*w,b)else draw.RoundedBox(5,41,1,self:GetValue()*(v-40)-self:GetValue()*16,w-2,b)draw.SimpleText(math.ceil(self:GetValue()*100)..'%','ui.18',20,w*0.5,p,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end;function a:PaintSliderButton(self,v,w)draw.RoundedBox(5,0,0,v,w,self:IsHovered()&&i||m)end;function a:PaintTextEntry(self,v,w)draw.RoundedBox(5,0,0,v,w,m)if self.GetPlaceholderText&&self.GetPlaceholderColor&&self:GetPlaceholderText()&&self:GetPlaceholderText():Trim()!=""&&self:GetPlaceholderColor()&&(!self:GetText()||self:GetText()=="")then local V=self:GetText()local W=self:GetPlaceholderText()if W:StartWith("#")then W=W:sub(2)end;W=language.GetPhrase(W)self:SetText(W)self:DrawTextEntryText(self:GetPlaceholderColor(),self:GetHighlightColor(),self:GetCursorColor())self:SetText(V)return end;self:DrawTextEntryText(o,b,o)end;function a:PaintUIListView(self,v,w)if self.Corners then draw.RoundedBoxEx(5,0,0,v,w,ui.col.Background,unpack(self.Corners))else draw.RoundedBox(5,0,0,v,w,ui.col.Background)end end;function a:PaintListView(self,v,w)end;function a:PaintListViewLine(self,v,w)if self.m_bAlt then draw.Box(0,0,v,w,(self:IsSelected()||self:IsHovered())&&b||g)else draw.Box(0,0,v,w,(self:IsSelected()||self:IsHovered())&&b||e)end;for Z,_ in ipairs(self.Columns)do if self:IsSelected()||self:IsHovered()then _:SetTextColor(o)_:SetFont('ui.20')else _:SetTextColor(p)_:SetFont('ui.15')end end end;function a:PaintCheckBox(self,v,w)local a0=self:GetChecked()draw.RoundedBox(5,0,0,v,w,ui.col.FlatBlack)draw.RoundedBox(5,a0&&v*0.5||1,1,v*0.5-1,w-2,a0&&b||ui.col.OffWhite)if self:IsHovered()then draw.RoundedBox(5,0,0,v,w,ui.col.Hover)end end;local a1=b:Copy()a1.a=50;function a:PaintTabButton(self,v,w)draw.RoundedBox(5,0,0,v,w,ui.col.ButtonBlack)if self:IsHovered()then draw.RoundedBox(5,0,0,v,w,ui.col.Hover)end;if self.Active then draw.RoundedBox(5,0,0,v,w,a1)end end;function a:PaintTabListPanel(self,v,w)draw.RoundedBoxEx(5,160,0,v-160,w,e,false,true,false,true)end;function a:PaintComboBox(self,v,w)if IsValid(self.Menu)&&!self.Menu.SkinSet then self.Menu:SetSkin('SUP')self.Menu.SkinSet=true end;if!self.ColorSet then self:SetTextColor(ui.col.White)self.ColorSet=true end;draw.RoundedBox(5,0,0,v,w,self.BackgroundColor||ui.col.Button)if self:IsHovered()then draw.RoundedBox(5,0,0,v,w,ui.col.Hover)end end;local a2=utf8.char(0xf107)function a:PaintComboDownArrow(self,v,w)draw.SimpleText(a2,'ForkAwesome',v*0.5,w*0.5,self.ComboBox:IsMenuOpen()&&ui.col.OffWhite||ui.col.White,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;function a:PaintMenu(self,v,w)draw.RoundedBox(5,0,0,v,w,ui.col.Black)end;function a:PaintMenuOption(self,v,w)if!self.FontSet then self:SetTextInset(0,0)self:SetFont('ui.16')self:PerformLayout()self.ParentMenu:PerformLayout()self.FontSet=true end;self:SetTextColor(p)local a3=self:IsEnabled()draw.RoundedBox(5,1,1,v-2,w-2,a3&&ui.col.Button||ui.col.FlatBlack)if self.m_bBackground&&(self.Hovered||self.Highlight)&&a3 then draw.RoundedBox(5,1,1,v-2,w-2,ui.col.Hover)end end;function a:PaintMenuRightArrow(R,v,w)surface.SetDrawColor(ui.col.White)draw.NoTexture()surface.DrawPoly({{x=3,y=3},{x=v,y=w*0.5+3},{x=3,y=w}})end;local a4=Color(200,200,200)local a5=ui.col.ButtonHover;local a6=Color(b.r,b.g,b.b-20)function a:PaintPropertySheet(self,v,w)local a7=self:GetActiveTab()if IsValid(a7)then if!self.Dark then draw.Box(0,a7:GetTall(),v,w-a7:GetTall(),a4)end end end;function a:PaintTab(self,v,w)local a8=self:GetPropertySheet():GetActiveTab()==self;if a8 then self:SetTextColor(a6)if!self:GetPropertySheet().Dark then draw.Box(0,0,v,w,a4)else draw.Box(0,0,v,w,e)surface.SetDrawColor(f)surface.DrawOutlinedRect(0,0,v,w+1)end elseif self:IsHovered()then self:SetTextColor(a5)else self:SetTextColor(a4)end end;function a:PaintTooltip(self,v,w)draw.RoundedBox(4,0,0,v,w,ui.col.Outline)draw.RoundedBox(4,1,1,v-2,w-2,ui.col.Background)end;derma.DefineSkin('SUP','SUP\'s derma skin',a)
--addons/!lpakr_out/lua/ui/controls/collapsible_section.lua:
local a,b=utf8.char(0xf0ab),utf8.char(0xf0aa)local c={}function c:Init()self.Collapsed=false;self.Header=ui.Create('ui_button',self)self.Header:SetDisabled(true)self.Header.Paint=function(d,e,f)derma.SkinHook("Paint","Button",d,e,f)if d:IsHovered()||self.CollapseBtn:IsHovered()then draw.RoundedBox(5,0,0,e,f,ui.col.Hover)end end;self.Header.OnMousePressed=function(d,g)if g==MOUSE_LEFT then self:Collapse(!self:IsCollapsed())end end;self.CollapseBtn=ui.Create('ui_button',self)self.CollapseBtn:SetFont('ForkAwesome')self.CollapseBtn:SetText(b)self.CollapseBtn:SetToolTip('Collapse')self.CollapseBtn.Paint=function()end;self.CollapseBtn.DoClick=function()self:Collapse(!self:IsCollapsed())end;self.Container=ui.Create('DPanel',self)end;function c:SetTall(f)self.OriginalTall=f+ui.SpacerHeight;self.BaseClass.SetTall(self,self.OriginalTall)end;function c:SetText(h)self.Header:SetText(h)end;function c:AddItem(i)i:SetParent(self.Container)end;function c:Collapse(j,k)self.Collapsed=j;local l=j&&ui.SpacerHeight||self.OriginalTall;if k then self.BaseClass.SetTall(self,l)else self.TargetHeight=l end;self.CollapseBtn:SetToolTip(j&&'Expand'||'Collapse')self.CollapseBtn:SetText(j&&a||b)end;function c:IsCollapsed()return self.Collapsed end;function c:OnCollapsing()end;function c:Think()if self.TargetHeight&&self:GetTall()!=self.TargetHeight then local m=self:GetTall()local n=m>self.TargetHeight&&-1||1;m=m+FrameTime()*(m-self.TargetHeight*-n)*8*n;if math.abs(m-self.TargetHeight)<1 then m=self.TargetHeight;self.TargetHeight=nil end;self.BaseClass.SetTall(self,m)self.OnCollapsing(self)end end;function c:PerformLayout(e,f)self.Header:SetPos(0,0)self.Header:SetSize(e,ui.SpacerHeight)self.Container:SetPos(0,ui.SpacerHeight)self.Container:SetSize(e,f-ui.SpacerHeight)self.CollapseBtn:SetPos(e-ui.SpacerHeight,0)self.CollapseBtn:SetSize(ui.SpacerHeight,ui.SpacerHeight)end;vgui.Register('ui_collapsible_section',c,'DPanel')
--addons/!lpakr_out/lua/ui/controls/scrollpanel.lua:
return lpakr()()
--addons/!lpakr_out/lua/ui/controls/settings.lua:
local a=FindMetaTable'Cvar'function a:ShouldShow()return true end;function a:SetShouldShow(b)self.ShouldShow=b;return self end;function a:SetDescription(c)self.Description=c;return self end;function a:GetDescription()return self.Description end;function a:SetCustomElement(d)self:AddMetadata('Type','Custom')self.CustomElementName=d;return self end;function a:GetCustomElement()return self.CustomElementName end;local e={}function e:Init()end;function e:PerformLayout(f,g)end;vgui.Register('ui_setting',e,'Panel')e={}Derma_Hook(e,'Paint','Paint','Panel')e.TypeMap={bool='AddBool',number='AddNumber',Custom='AddCustom'}function e:Init()self.Categories={}end;function e:AddCategory(h,i)local j=ui.Create('Panel',self)j:SetTall(45)j:Dock(TOP)self:AddItem(j)ui.Create('ui_button',function(k)k:SetText(h)k:SetTall(ui.ButtonHeight)k:SetDisabled(true)k:SetFont('ui.20')k:Dock(TOP)k:DockMargin(1,5,1,5)k.Header=true end,j)local l=45;for m,cvar in ipairs(i||{})do if!cvar:ShouldShow()then continue end;local n=self.TypeMap[cvar:GetMetadata('Type')||'bool']if!n then continue end;local o=self[n]if o then l=l+(o(self,j,cvar)||30)end end;j:SetTall(l)self.Categories[h]=j;return j end;function e:AddToCategory(p,q,r)local j=self.Categories[p]if!j then j=self:AddCategory(p)end;q:DockMargin(5,5,5,5)q:SetParent(j)q:Dock(TOP)j:SetTall(j:GetTall()+(r||q:GetTall()))return j end;function e:AddBool(j,cvar)local s=ui.Create('Panel',j)s:DockPadding(4,4,4,4)s:SetTall(30)s:Dock(TOP)s.Paint=function()end;ui.Create('ui_checkbox',function(self,t)self:SetPos(5,5)self:SetText(cvar:GetMetadata('Menu'))self:SetConVar(cvar:GetName())self:SizeToContents()self:Dock(TOP)t.GetCvarName=function(k)return self:GetText()end end,s)if cvar:GetDescription()then ui.Create('DLabel',function(self,t)self:SetFont('ui.14')self:SetColor(16)self:SetText(cvar:GetDescription())self:Dock(TOP)t:SetTall(60)end,s)return 60 end;return 30 end;function e:AddNumber(j,cvar)local s=ui.Create('Panel',j)s:SetTall(55)s:Dock(TOP)s:DockPadding(4,4,4,4)s.Paint=function()end;ui.Create('DLabel',function(self,t)self:SetFont('ui.18')self:SetColor(ui.col.ButtonText)self:SetText(cvar:GetMetadata('Menu'))self:SetTall(25)self:Dock(TOP)t.GetCvarName=function(k)return self:GetText()end end,s)ui.Create('ui_slider',function(self,t)self:SetValue(cvar:GetValue())self.OnChange=function(k,u)cvar:SetValue(u)end;self:Dock(FILL)end,s)if cvar:GetDescription()then ui.Create('DLabel',function(self,t)self:SetFont('ui.14')self:SetColor(16)self:SetText(cvar:GetDescription())self:Dock(TOP)t:SetTall(60)end,s)return 60 end;return 55 end;function e:AddCustom(j,cvar)local v=ui.Create(cvar:GetCustomElement(),function(self,t)self:SetCvar(cvar)self:Dock(TOP)t.GetCvarName=function(k)return cvar:GetMetadata('Menu')||cvar.Name||cvar.CustomElementName end end,j)v:InvalidateLayout(true)return v:GetTall()+14 end;function e:Populate(w)local x={}for m,y in ipairs(cvar.GetOrderedTable())do if y:GetMetadata('Menu')||y:GetCustomElement()then local j=y:GetMetadata('Category')||'Other'if!x[j]then x[j]={}end;x[j][#x[j]+1]=y end end;if w then for m,y in ipairs(w)do if x[y]then self:AddCategory(y,x[y])x[y]=nil end end end;for m,y in pairs(x)do self:AddCategory(m,y)end;hook.Call('ba.LayoutSettingsPanel',nil,self)end;function e:DockToFrame()local t=self:GetParent()local z,A=t:GetDockPos()self:SetPos(z,A)self:SetSize(t:GetWide()-10,t:GetTall()-(A+5))end;vgui.Register('ui_settingspanel',e,'ui_scrollpanel')
--addons/!lpakr_out/lua/ui/controls/tablist.lua:
local a={}function a:Init()self.tabList=ui.Create('ui_scrollpanel',function(b)b:SetSize(150,0)b:DockMargin(5,5,5,5)b:Dock(LEFT)b:SetSpacing(5)end,self)self.Buttons={}end;function a:GetButtons()return self.Buttons end;function a:SetActiveTab(c)self.ActiveTabID=c;for d,e in ipairs(self.Buttons)do e.Active=c==d;if IsValid(e.Tab)&&e.Tab:IsVisible()then e.Tab:Dock(NODOCK)e.Tab:SetVisible(false)end;if c==d then if!e.FinishedLayout then e:LayoutTab()end;e.Tab:SetVisible(true)e.Tab:DockMargin(0,0,0,0)e.Tab:Dock(FILL)self:TabChanged(e.Tab)end end end;function a:TabChanged(tab)end;function a:GetActiveTab()for d,e in ipairs(self.Buttons)do if e.Active then return e.Tab end end end;function a:GetActiveTabID()return self.ActiveTabID end;local function f(g,tab,h)local i=ui.Create('ui_button',function(btn)btn:SetSize(0,40)btn:SetText(g)btn.DoClick=function(self)h(self)end;btn.Paint=function(btn,j,k)derma.SkinHook('Paint','TabButton',btn,j,k)end end)return i end;function a:AddTab(g,l,m)local i=f(g,tab,function(n)if!n.FinishedLayout then n:LayoutTab()end;self:SetActiveTab(n.ID)end)function i.LayoutTab(n)local tab=isfunction(l)&&l(self)||l;tab.Paint=function(tab,j,k)end;tab:SetSize(self:GetWide()-160,self:GetTall())tab:SetVisible(false)tab:SetParent(self)tab:SetSkin(self:GetSkin().PrintName)n.Tab=tab;n.FinishedLayout=true end;if!isfunction(l)then i:LayoutTab()end;i.ID=table.insert(self.Buttons,i)self.tabList:AddItem(i)if m then self:SetActiveTab(i.ID)end;return i end;local o;function a:AddButton(g,h)local i=f(g,tab,h)self.tabList:AddItem(i)table.insert(self.Buttons,btn)o=self;return i end;function a:DockToFrame()local p=self:GetParent()local q,r=p:GetDockPos()r=r-5;self:SetPos(0,r)self:SetSize(p:GetWide(),p:GetTall()-r)end;function a:Paint(j,k)derma.SkinHook('Paint','TabListPanel',self,j,k)end;vgui.Register('ui_tablist',a,'Panel')
--addons/!lpakr_out/lua/badmin/core/core_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/core/util/player/player_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/chatbox2/_module.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/plugins/managment_sh.lua:
term.Add('AdminMutedPlayer','# has muted # for #.')term.Add('AdminMutedYou','# has muted you for #.')term.Add('AdminUnmutedYou','# has unmuted you.')term.Add('AdminUnmutedPlayer','# has unmuted #.')term.Add('YouAreUnmuted','You have been unmuted.')term.Add('PlayerNotMuted','# is not muted!')ba.AddCommand('Mute',function(a,b,c)b:ChatMute(c,function()ba.notify(b,term.Get('YouAreUnmuted'))end)b:VoiceMute(c)ba.notify(b,term.Get('AdminMutedYou'),a,string.FormatTime(c))return ba.NOTIFY_STAFF,term.Get('AdminMutedPlayer'),a,b,string.FormatTime(c)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.TIME):SetFlag'M':SetHelp'Mutes your targets chat and voice'ba.AddCommand('UnMute',function(a,b)if b:IsChatMuted()||b:IsVoiceMuted()then b:UnChatMute()b:UnVoiceMute()ba.notify(b,term.Get('AdminUnmutedYou'),a)return ba.NOTIFY_STAFF,term.Get('AdminUnmutedPlayer'),a,b end;return ba.NOTIFY_ERROR,term.Get('PlayerNotMuted'),a end):AddParam(cmd.PLAYER_ENTITY):SetFlag'M':SetHelp'Umutes your targets chat and voice'term.Add('AdminUnmutedPlayerChat','# has unmuted #\'s chat.')term.Add('AdminUnmutedYouChat','# has unmuted your chat.')term.Add('YouAreUnmutedChat','Your chat has been unmuted.')term.Add('AdminMutedPlayerChat','# has muted #\'s chat for #.')term.Add('AdminMutedYouChat','# has muted your chat for #.')ba.AddCommand('MuteChat',function(a,b,c)b:ChatMute(c,function()ba.notify(b,term.Get('YouAreUnmutedChat'))end)ba.notify(b,term.Get('AdminMutedYouChat'),a,string.FormatTime(c))return ba.NOTIFY_STAFF,term.Get('AdminMutedPlayerChat'),a,b,string.FormatTime(c)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.TIME):SetFlag'M':SetHelp'Mutes your targets chat'ba.AddCommand('UnMuteChat',function(a,b,c)if b:IsChatMuted()then b:UnChatMute()ba.notify(b,term.Get('AdminUnmutedYouChat'),a)return ba.NOTIFY_STAFF,term.Get('AdminUnmutedPlayerChat'),a,b end;return ba.NOTIFY_ERROR,term.Get('PlayerNotMuted'),a end):AddParam(cmd.PLAYER_ENTITY):SetFlag'M':SetHelp'Unmutes your targets chat'term.Add('AdminUnmutedPlayerVoice','# has unmuted #\'s voice.')term.Add('AdminUnmutedYouVoice','# has unmuted your voice.')term.Add('YouAreUnmutedVoice','Your voice has been unmuted.')term.Add('AdminMutedPlayerVoice','# has muted #\'s voice for #.')term.Add('AdminMutedYouVoice','# has muted your voice for #.')ba.AddCommand('MuteVoice',function(a,b,c)b:VoiceMute(c,function()ba.notify(b,term.Get('YouAreUnmutedVoice'))end)ba.notify(b,term.Get('AdminMutedYouVoice'),a,string.FormatTime(c))return ba.NOTIFY_STAFF,term.Get('AdminMutedPlayerVoice'),a,b,string.FormatTime(c)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.TIME):SetFlag'M':SetHelp'Mutes your targets voice'ba.AddCommand('UnMuteVoice',function(a,b,c)if b:IsVoiceMuted()then b:UnVoiceMute()ba.notify(b,term.Get('AdminUnmutedYouVoice'),a)return ba.NOTIFY_STAFF,term.Get('AdminUnmutedPlayerVoice'),a,b end;return ba.NOTIFY_ERROR,term.Get('PlayerNotMuted'),a end):AddParam(cmd.PLAYER_ENTITY):SetFlag'M':SetHelp'Unmutes your targets voice'term.Add('AdminIsSpectating','# is currently spectating someone!')term.Add('YouAreNowSpectating','Spectating #. Press W to change spectate modes!')term.Add('SpectateTargInvalid','You must choose a valid target!')function PLAYER:IsSpectatingPlayer()local d=self:GetObserverMode()return d==OBS_MODE_CHASE||d==OBS_MODE_IN_EYE end;ba.AddCommand('Spectate',function(a,e)if IsValid(e)then if a:IsSpectatingPlayer()then a:UnSpectatePlayer()end;if IsValid(e:IsSpectatingPlayer())then return ba.NOTIFY_ERROR,term.Get('AdminIsSpectating'),e end;if!a:Alive()then a:Spawn()end;hook.Run('PreMovementAffectingAction',a,true)a:SpectatePlayer(e)return ba.NOTIFY_NORM,term.Get('YouAreNowSpectating'),e elseif a:IsSpectatingPlayer()then a:UnSpectatePlayer()else return ba.NOTIFY_ERROR,term.Get('SpectateTargInvalid')end end):AddParam(cmd.PLAYER_ENTITY,cmd.OPT_OPTIONAL):SetFlag'A':SetHelp'Spectates your target/untoggles spectate':AddAlias'spec':SetLogFilterFlag'S'
--addons/!lpakr_out/lua/autorun/drgbase.lua:
DrGBase=DrGBase||{}DrGBase.Icon="drgbase/icon16.png"DrGBase.CLR_WHITE=Color(255,255,255)DrGBase.CLR_GREEN=Color(150,255,40)DrGBase.CLR_RED=Color(255,50,50)DrGBase.CLR_CYAN=Color(0,200,200)DrGBase.CLR_PURPLE=Color(220,40,115)DrGBase.CLR_BLUE=Color(50,100,255)DrGBase.CLR_ORANGE=Color(255,150,30)DrGBase.CLR_DARKGRAY=Color(20,20,20)DrGBase.CLR_LIGHTGRAY=Color(200,200,200)local function a(b)b=b:ToVector():ToColor()b.a=0;return b end;DrGBase.CLR_WHITE_TR=a(DrGBase.CLR_WHITE)DrGBase.CLR_GREEN_TR=a(DrGBase.CLR_GREEN)DrGBase.CLR_RED_TR=a(DrGBase.CLR_RED)DrGBase.CLR_CYAN_TR=a(DrGBase.CLR_CYAN)DrGBase.CLR_PURPLE_TR=a(DrGBase.CLR_PURPLE)DrGBase.CLR_BLUE_TR=a(DrGBase.CLR_BLUE)DrGBase.CLR_ORANGE_TR=a(DrGBase.CLR_ORANGE)DrGBase.CLR_DARKGRAY_TR=a(DrGBase.CLR_DARKGRAY)DrGBase.CLR_LIGHTGRAY_TR=a(DrGBase.CLR_LIGHTGRAY)function DrGBase.Print(c,d)d=d||{}if!d.chat then local b=DrGBase.CLR_GREEN;if d.color then b=d.color elseif SERVER then b=DrGBase.CLR_CYAN elseif CLIENT then b=DrGBase.CLR_ORANGE end;local e=DrGBase.CLR_WHITE;if d._error then e=DrGBase.CLR_RED end;MsgC(b,"[DrGBase] ",e,c,"\n")end end;function DrGBase.Error(c,d)d=d||{}d._error=true;return DrGBase.Print(c,d)end;function DrGBase.IncludeFile(f,g)if!g then AddCSLuaFile(f)return include(f)elseif SERVER then return include(f)end end;function DrGBase.IncludeFiles(h,g)local i={}for j,f in ipairs(h)do local k=DrGBase.IncludeFile(f,g)if k then table.insert(i,k)end end;return i end;function DrGBase.IncludeFolder(l,g)local i={}for j,f in ipairs(file.Find(l.."/*.lua","LUA"))do local k=DrGBase.IncludeFile(l.."/"..f,g)if k then table.insert(i,k)end end;return i end;function DrGBase.RecursiveInclude(l,g)local i=DrGBase.IncludeFolder(l)local h,m=file.Find(l.."/*","LUA")for j,n in ipairs(m)do table.Merge(i,DrGBase.RecursiveInclude(l.."/"..n,g))end;return i end;DrGBase.IncludeFolder'drgbase'DrGBase.IncludeFolder'drgbase/meta'DrGBase.IncludeFolder'drgbase/modules'
--addons/!lpakr_out/lua/drgbase/spawners.lua:
function DrGBase.AddSpawner(a)local b=string.Replace(a.Folder,"entities/","")if a.PrintName==nil||a.Category==nil then return false end;local c={Name=a.PrintName,Class=b,Category=a.Category}if a.Spawnable!=false then list.Set("NPC",b,c)list.Set("DrGBaseSpawners",b,c)end;DrGBase.Print("Spawner '"..b.."': loaded.")return true end
--addons/!lpakr_out/lua/drgbase/spawnmenu.lua:
return lpakr()()
--addons/!lpakr_out/lua/drgbase/modules/util.lua:
local a=CreateConVar("drgbase_debug_traces","0")function util.DrG_TraceLine(b)local c=util.TraceLine(b)if a:GetFloat()>0 then local d=c.Hit&&DrGBase.CLR_RED||DrGBase.CLR_GREEN;debugoverlay.Line(b.start,c.HitPos,a:GetFloat(),d,false)debugoverlay.Line(c.HitPos,b.endpos,a:GetFloat(),DrGBase.CLR_WHITE,false)end;return c end;function util.DrG_TraceHull(b)local c=util.TraceHull(b)if a:GetFloat()>0 then local d=c.Hit&&DrGBase.CLR_RED||DrGBase.CLR_GREEN;d=d:ToVector():ToColor()d.a=0;debugoverlay.Line(b.start,c.HitPos,a:GetFloat(),DrGBase.CLR_WHITE,false)debugoverlay.Box(c.HitPos,b.mins,b.maxs,a:GetFloat(),d)end;return c end;function util.DrG_TraceLineRadial(e,f,b)local g={}for h=1,f do local i=Vector(1,0,0)i:Rotate(Angle(0,h*360/f,0))b.endpos=b.start+i*e;table.insert(g,util.DrG_TraceLine(b))end;table.sort(g,function(j,k)return b.start:DistToSqr(j.HitPos)<b.start:DistToSqr(k.HitPos)end)return g end;function util.DrG_TraceHullRadial(e,f,b)local g={}for h=1,f do local i=Vector(1,0,0)i:Rotate(Angle(0,h*360/f,0))b.endpos=b.start+i*e;table.insert(g,util.DrG_TraceHull(b))end;table.sort(g,function(j,k)return b.start:DistToSqr(j.HitPos)<b.start:DistToSqr(k.HitPos)end)return g end;function util.DrG_SaveDmg(l)local b={}b.ammoType=l:GetAmmoType()b.attacker=l:GetAttacker()b.baseDamage=l:GetBaseDamage()b.damage=l:GetDamage()b.damageBonus=l:GetDamageBonus()b.damageCustom=l:GetDamageCustom()b.damageForce=l:GetDamageForce()b.damagePosition=l:GetDamagePosition()b.damageType=l:GetDamageType()b.inflictor=l:GetInflictor()b.maxDamage=l:GetMaxDamage()b.reportedPosition=l:GetReportedPosition()return b end;function util.DrG_LoadDmg(b)local l=DamageInfo()if!istable(b)then return end;l:SetAmmoType(b.ammoType)if IsValid(b.attacker)then l:SetAttacker(b.attacker)end;l:SetDamage(b.damage)l:SetDamageBonus(b.damageBonus)l:SetDamageCustom(b.damageCustom)l:SetDamageForce(b.damageForce)l:SetDamagePosition(b.damagePosition)l:SetDamageType(b.damageType)if IsValid(b.inflictor)then l:SetInflictor(b.inflictor)end;l:SetMaxDamage(b.maxDamage)l:SetReportedPosition(b.reportedPosition)return l end;function util.DrG_MergeColors(m,n,o)m=math.Clamp(m,0,1)return Color(n.r*m+o.r*(1-m),n.g*m+o.g*(1-m),n.b*m+o.b*(1-m),n.a*m+o.a*(1-m))end
--addons/!lpakr_out/lua/dronesrewrite/commands.lua:
return lpakr()()
--addons/!lpakr_out/lua/dronesrewrite/commands.lua:
local function a(b,c)if!c[1]then return NULL end;local d=c[1]=="-sel"&&b.SelectedDrone||DRONES_REWRITE.FindDroneByUnit(c[1])if IsValid(d)then if d.IS_DRONE&&!d.IS_DRR then b:AddLine("Unknown system protocol! Console only supports drones from Drones Rewrite!",Color(255,0,0))end else b:AddLine("Drone is not found!",Color(255,0,0))end;return d end;local e={}DRONES_REWRITE.AddCommand=function(f,g)e[f]=g end;DRONES_REWRITE.Words={[1]={"FRIED","TREES","RIGID","HIRED","TRIES","WRITE","TRIED","GREED","DRIED","BRAIN","SKIES","LAWNS","GHOST","CAUSE","PAINT","SHINY","MAKES","GAINS","THIEF","BASES","RAISE","REFER","CARES","TAKEN","WAKES","WAVES","WARNS","SAVES"},[2]={"STATING","HEALING","COSTING","REASONS","SEASIDE","SPARING","CAUSING","CRAFTED","PRISONS","PRESENT","DEALING","SETTING","LEAVING","VERSION","DEATHLY","BLAZING","GRANITE","TESTING","TRAITOR","STAMINA","TRINITY","CALLING","TALKING","ACQUIRE","WELCOME","DECRIES","FALLING","PACKING","ALLOWED","SELLING","AFFRONT","WALKING"},[3]={"CONQUORER","CONSISTED","WONDERFUL","COMMITTEE","SURRENDER","SUBJECTED","CONVICTED","FORBIDDEN","FORTIFIED","COLLECTED","CONTINUED","PERIMETER","SOUTHEAST","RELEASING","SOMETHING","ACCEPTING","MUTATIONS","GATHERING","LITERALLY","REPAIRING","INCESSANT","INTERIORS","REGARDING","TELEPHONE","OBTAINING","EXTENSIVE","DEFEATING","REQUIRING","UNLOCKING","RECYCLING","INSTINCTS","BARTERING","LEUTENANT","COMMUNITY","BATTERIES","RECIEVING","INCLUDING","INITIALLY","INVOLVING","MOUNTAINS"},[4]={"DISCOVERING","ELIMINATING","UNIMPORTANT","MISTRUSTING","MANUFACTURE","RADIOACTIVE","EXCLUSIVELY","BOMBARDMENT","DECEPTIVELY","INDEPENDENT","UNBELIEVERS","EFFECTIVELY","IMMEDIATELY","INFESTATION","DESCRIPTION","INFORMATION","REMEMBERING","NIGHTVISION","DESTRUCTION","OVERLOOKING"},[5]={"INFILTRATION","ORGANIZATION","AUTHENTICITY","APPRECIATION","SPOKESPERSON","LABORATORIES","INITIATEHOOD","SUBTERRANEAN","PURIFICATION","TRANSMISSION","CIVILIZATION","CONSTRUCTION","RESURRECTION","REPRIMANDING","ACCOMPANYING","OVERWHELMING","CONVERSATION","NORTHERNMOST","TRANSCRIBING","ANNOUNCEMENT","SECLUTIONIST"}}DRONES_REWRITE.GetCommands=function()local h={}table.Add(h,e)h["health"]=function(self,c)self:AddLine(self.Hp)end;h["break"]=function(self,c)self:Explode()end;h["blockkeys"]=function(self,c)if!c[2]||c[2]!="1"&&c[2]!="0"then self:AddLine("Incorrect format! blockkeys DRONEID 1 or blockkeys DRONEID 0.",Color(255,0,0))return end;local d=a(self,c)if IsValid(d)&&self.User:IsAdmin()then local i=tobool(c[2])d.BlockKeys=i;i=i&&"blocked"||"unblocked"self:AddLine("Keys has been "..i..".")end end;h["say"]=function(self,c)if!c[1]then self:AddLine("Incorrect format! say TEXT.")return end;local j=""for k,l in pairs(c)do j=j..l.." "end;self.User:Say(j)end;h["randscr"]=function(self,c)if!c[1]||c[1]!="1"&&c[1]!="0"then self:AddLine("Incorrect format! randscr 1 or randscr 0.",Color(255,0,0))return end;self:SetNWBool("noRandomScr",!tobool(c[1]))end;h["exit"]=function(self,c)self:Exit()end;h["lights"]=function(self,c)if!c[1]||c[1]!="1"&&c[1]!="0"then self:AddLine("Incorrect format! lights 1 or lights 0.",Color(255,0,0))return end;self:SetNWBool("noLights",!tobool(c[1]))end;h["screen"]=function(self,c)if!c[1]||c[1]!="1"&&c[1]!="0"then self:AddLine("Incorrect format! screen 1 or screen 0.",Color(255,0,0))return end;self:SetNWBool("noScreen",!tobool(c[1]))end;h["printbinds"]=function(self,c)for k,l in pairs(DRONES_REWRITE.Keys)do self:AddLine(k.." binded to "..DRONES_REWRITE.KeyNames[l]..".")end end;h["overridepower"]=function(self,c)if!c[2]then self:AddLine("Incorrect format! overridepower DRONEID NUMBER or overridepower DRONEID OLD.",Color(255,0,0))return end;local d=a(self,c)if IsValid(d)&&d:CanBeControlledBy_skipai(self.User)then if c[2]=="old"then c[2]=2.2535 end;d.FlyConstant=c[2]self:AddLine("Overrided to "..c[2]..".")end end;h["presskeybind"]=function(self,c)if!c[2]then self:AddLine("Incorrect format! presskeybind DRONEID _KEY or presskeybind DRONEID _BIND.",Color(255,0,0))self:AddLine("You can find binds by typing printbinds.",Color(255,0,0))return end;local d=a(self,c)if IsValid(d)&&d:CanBeControlledBy_skipai(self.User)then d:ClickKey(c[2])self:AddLine("Clicked.")end end;h["kick"]=function(self,c)local d=a(self,c)if IsValid(d)&&d:CanBeControlledBy_skipai(self.User)then d:SetDriver(NULL)self:AddLine("Driver has been kicked.")end end;h["forcecontrol"]=function(self,c)if!c[2]then self:AddLine("Incorrect format! forcecontrol DRONEID PLAYERNICK.",Color(255,0,0))return end;local m=NULL;for k,l in pairs(player.GetAll())do if string.find(string.lower(l:Name()),string.lower(c[2]))then m=l;break end end;if!IsValid(m)then self:AddLine("Could not find player with name "..c[2]..".",Color(255,0,0))return end;local d=a(self,c)if IsValid(d)&&self.User:IsAdmin()then d:SetDriver(NULL)d:SetDriver(m,1000000,self)self:AddLine("Driver has been changed.")end end;h["helpmenu"]=function(self,c)self.User:ConCommand("dronesrewrite_help")end;h["screamdriver"]=function(self,c)local d=a(self,c)if IsValid(d)&&d:CanBeControlledBy_skipai(self.User)then d:EmitSound("npc/stalker/go_alert2.wav")self:AddLine("Screamed as hell!")end end;h["info"]=function(self,c)local d=a(self,c)if IsValid(d)then self:AddLine("Getting info...")self:AddLine("------------------------------------------")self:AddLine("Security level: "..d.HackValue)self:AddLine("HP: "..d:GetHealth())self:AddLine("Weapons: ")for k,l in pairs(d.ValidWeapons)do self:AddLine(""..k..": ")self:AddLine("    Primary ammo: "..l.PrimaryAmmo)self:AddLine("    Secondary ammo: "..l.SecondaryAmmo)self:AddLine("")end;local f="no driver"if IsValid(d:GetDriver())then f=d:GetDriver():Name()end;self:AddLine("Driver: "..f)local f="no owner"if IsValid(d.Owner)then f=d.Owner:Name()end;self:AddLine("Owner: "..f)self:AddLine("Enabled: "..tostring(d.Enabled))self:AddLine("Public: "..tostring(d.AllowControl))self:AddLine("Speed: "..(d.Speed+d.UpSpeed+d.RotateSpeed)/3)self:AddLine("")self:AddLine("Installed modules: ")self.Commands["imodules"](self,c)self:AddLine("")self:AddLine("Hooks: ")for k,l in pairs(d.hooks)do self:AddLine("Hook: "..k)for f,n in pairs(l)do self:AddLine("    "..f)end;self:AddLine("")end;self:AddLine("------------------------------------------")end end;h["print"]=function(self,c)if!c[1]then self:AddLine("Incorrect format! print TEXT or print TEXT COLOR.",Color(255,0,0))return end;local o={255,255,255}local j=""local p={}table.Add(p,c)if#c>3 then for q=0,2 do local r=c[#c-q]if tonumber(r)then o[3-q]=r;p[#c-q]=nil else p={}table.Add(p,c)o={255,255,255}break end end end;for k,l in pairs(p)do j=j.." "..l end;self:AddLine(j,Color(o[1],o[2],o[3]))end;h["me"]=function(self,c)if!c[1]then self:AddLine("Incorrect format! me TEXT or me TEXT COLOR.",Color(255,0,0))return end;c[1]=self.User:Name().." "..c[1]self.Commands["print"](self,c)end;h["control"]=function(self,c)local d=a(self,c)if IsValid(d)&&d:CanBeControlledBy_skipai(self.User)then d:SetDriver(self.User,1000000,self)self:Exit()end end;h["addmodule"]=function(self,c)end;h["removemodule"]=function(self,c)end;h["imodules"]=function(self,c)end;h["removewep"]=function(self,c)end;h["addwep"]=function(self,c)end;h["select"]=function(self,c)local d=a(self,c)if IsValid(d)then self:AddLine("Selected "..d:GetUnit()..".")self:SetDrone(d)end end;h["unselect"]=function(self,c)if IsValid(self.SelectedDrone)then self:AddLine(self.SelectedDrone:GetUnit().." has been unselected.")end;self:SetDrone(NULL)end;h["clear"]=function(self,c)self:Clear()end;h["printlist"]=function(self,c)self:AddLine("-- Found drones --")for k,l in pairs(ents.GetAll())do if l.IS_DRONE then self:AddLine(l:GetUnit())end end end;h["hack"]=function(self,c)if self.Failed then self.CatchCommand=function(self,c,s)if s=="exit"then return true end;return false end;self:AddLine(" ")self:AddLine("Waiting for protection system to reboot...")timer.Create("dronesrewrite_console_cooldown"..self:EntIndex(),math.random(10,12),1,function()if IsValid(self)then self.CatchCommand=nil;self.Failed=false;self:AddLine("Done.")end end)return end;if self.Hacking then self:AddLine("Type exithack command first!")return end;if self.CatchCommand then self:AddLine("Something went wrong...")return end;local d=a(self,c)if IsValid(d)then self:AddLine("Please wait. Getting info...")timer.Simple(math.Rand(2,4),function()if!IsValid(self)then return end;if!IsValid(d)then return end;local t=DRONES_REWRITE.Words[d.HackValue]if!t then self:AddLine("Something went wrong. Hacking failed.")return end;self.Attempts=4;if d.AllowControl then self:AddLine("Already hacked!")return end;self:EmitSound("buttons/button24.wav",60)self:AddLine(" ")self:AddLine("4 ATTEMPT(S) LEFT")self:AddLine(" ")local u={}local v="!@#%^*()_-=+\\|/[]{}?\"\':;,.<>"for q=1,string.len(v)do u[q]=string.sub(v,q,q)end;local w=math.floor(#t*0.7)local x={}local y=""while w>0 do local z=table.Random(t)if x[z]then continue end;for q=4,math.random(0,20)+string.len(z)do y=y..table.Random(u)end;y=y..z;x[z]=z;w=w-1 end;local A=table.Random(x)local B=string.len(A)local C=math.random(1,200)+63744;for q=1,string.len(y),51 do self:AddLine("0x"..string.format("%x",C):upper().."   "..string.sub(y,q,q+50))C=C+12 end;self.CatchCommand=function(self,c,s)if!IsValid(d)then self:AddLine("Drone's signal was lost!",Color(255,0,0))self.Commands["exithack"](self)return false end;if s=="show_password"then if d:CanBeControlledBy_skipai(self.User)then self:AddLine("Password for this session: "..A)else self:AddLine("Access denied!")end;return false elseif s=="exit"||s=="exithack"then return true elseif self.Commands[s]then self:AddLine("Type exithack command first!")return false end;local D=string.lower(A)if D==s then self:AddLine("Hacked!",Color(0,255,0))self:EmitSound("buttons/button5.wav")self.Commands["exithack"](self)d.AllowControl=true else self:AddLine("Incorrect password.",Color(255,0,0))local E=0;for q=1,B do if string.sub(s,q,q)==string.sub(D,q,q)then E=E+1 end end;self:AddLine(E.." / "..B.." correct.")self:EmitSound("buttons/button10.wav")self.Attempts=self.Attempts-1;self:AddLine(self.Attempts.." ATTEMPT(S) LEFT")if self.Attempts<=0 then self.Commands["exithack"](self)self.Failed=true end end;return false end;self.Hacking=true end)end end;h["exithack"]=function(self,c)if!self.Hacking then self:AddLine("We aren't hacking right now!")return end;self:AddLine("Exiting from hacking...")self.Attempts=4;self.Hacking=false;self.CatchCommand=nil end;h["disable"]=function(self,c)local d=a(self,c)if IsValid(d)&&d:CanBeControlledBy_skipai(self.User)then d:SetEnabled(false)self:AddLine(d:GetUnit().." has been disabled.")end end;h["enable"]=function(self,c)local d=a(self,c)if IsValid(d)&&d:CanBeControlledBy_skipai(self.User)then d:SetEnabled(true)self:AddLine(d:GetUnit().." has been enabled.")end end;h["dropfuel"]=function(self,c)local d=a(self,c)if IsValid(d)&&d:CanBeControlledBy_skipai(self.User)then d:SetFuel(0)self:AddLine(d:GetUnit().." has dropped fuel.")end end;h["droppropellers"]=function(self,c)local d=a(self,c)if IsValid(d)&&d:CanBeControlledBy_skipai(self.User)then d:DropPropellers()self:AddLine(d:GetUnit().." has dropped propellers.")end end;h["destroy"]=function(self,c)local d=a(self,c)if IsValid(d)&&d:CanBeControlledBy_skipai(self.User)then d:Destroy()self:AddLine(d:GetUnit().." has been destroyed.")end end;h["modules"]=function(self,c)local d=a(self,c)if IsValid(d)then self:AddLine("-- Found modules --")for k,l in pairs(d.Modules)do self:AddLine(k)end end end;h["help"]=function(self,c)end;return h end
--addons/!lpakr_out/lua/dronesrewrite/particles.lua:
game.AddParticles("particles/blaster_sparks.pcf")game.AddParticles("particles/skull_fx.pcf")game.AddParticles("particles/fire_test.pcf")game.AddParticles("particles/fire_test2.pcf")game.AddParticles("particles/splode_fx.pcf")game.AddParticles("particles/flamethrower_fx.pcf")game.AddParticles("particles/artillery_muzzle.pcf")game.AddParticles("particles/boxglove_drr_fx.pcf")game.AddParticles("particles/electrical_fx.pcf")game.AddParticles("particles/napalmgrenade_fx.pcf")game.AddParticles("particles/laser_fx.pcf")game.AddParticles("particles/spectra_drr_fx.pcf")game.AddParticles("particles/vapor_drr_fx.pcf")game.AddParticles("particles/plasma_tracer.pcf")PrecacheParticleSystem("fire_test2")PrecacheParticleSystem("fire_test")PrecacheParticleSystem("fire_man_disap")PrecacheParticleSystem("sparks_rdbl")PrecacheParticleSystem("skull_trail")PrecacheParticleSystem("skull_impact")PrecacheParticleSystem("skull_impact_fire")PrecacheParticleSystem("splode_fire")PrecacheParticleSystem("splode_big_main")PrecacheParticleSystem("splode_drone_main")PrecacheParticleSystem("splode_drone_sparks")PrecacheParticleSystem("splode_big_drone_main")PrecacheParticleSystem("flamethrower_fire_drr")PrecacheParticleSystem("artillery_muzzle_main")PrecacheParticleSystem("blade_glow_drr")PrecacheParticleSystem("electrical_arc_01_parent")PrecacheParticleSystem("electrical_arc_01_system")PrecacheParticleSystem("laser_hit_drr")PrecacheParticleSystem("laser_hit_r_drr")PrecacheParticleSystem("laser_hit_g_drr")PrecacheParticleSystem("laser_hit_b_drr")PrecacheParticleSystem("napalmgren_shockwave_drr")PrecacheParticleSystem("elecray_hit_drr")PrecacheParticleSystem("stinger_explode_drr")PrecacheParticleSystem("vapor_drr")PrecacheParticleSystem("nrg_tracer_drr")PrecacheParticleSystem("vapor_collapse_drr")
--addons/!lpakr_out/lua/dronesrewrite/client/overlay.lua:
hook.Add("RenderScreenspaceEffects","dronesrewrite_overlay",function()local a=LocalPlayer()local b=a:GetNWEntity("DronesRewriteDrone")if IsValid(b)&&b:DoCamEffects()then local c=b:GetOverlayName()if b:GetNWBool("NightVision")then local d={["$pp_colour_addr"]=0,["$pp_colour_addg"]=0.7,["$pp_colour_addb"]=0,["$pp_colour_brightness"]=-0.4,["$pp_colour_contrast"]=0.7,["$pp_colour_colour"]=0.4,["$pp_colour_mulr"]=0,["$pp_colour_mulg"]=0,["$pp_colour_mulb"]=0}DrawColorModify(d)DrawBloom(0,1,3,4,2,0,1,1,1)DrawSharpen(0.65,4)local e=DynamicLight(b:EntIndex())if e then e.pos=b:GetPos()e.r=255;e.g=255;e.b=255;e.brightness=0;e.Decay=100;e.Size=2048;e.DieTime=CurTime()+0.1 end end;if DRONES_REWRITE.Overlay[c]then DRONES_REWRITE.Overlay[c](b)end end end)
--addons/!lpakr_out/lua/dronesrewrite/client/overlay/nooverlay.lua:
DRONES_REWRITE.Overlay["No Overlay"]=function(a)end
--addons/!lpakr_out/lua/dronesrewrite/client/overlay/orange.lua:
return lpakr()()
--addons/ssrp_lfs/lua/lvs_framework/autorun/cl_fonts.lua:
local THE_FONT = {
	font = "Verdana",
	extended = false,
	size = 14,
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
}
surface.CreateFont( "LVS_VERSION", THE_FONT )

THE_FONT.extended = false
THE_FONT.size = 20
THE_FONT.weight = 2000
surface.CreateFont( "LVS_FONT", THE_FONT )

THE_FONT.size = 16
surface.CreateFont( "LVS_FONT_SWITCHER", THE_FONT )

THE_FONT.font = "Arial"
THE_FONT.size = 14
THE_FONT.weight = 1
THE_FONT.shadow = false
surface.CreateFont( "LVS_FONT_PANEL", THE_FONT )

THE_FONT.size = 20
THE_FONT.weight = 2000
surface.CreateFont( "LVS_FONT_HUD", THE_FONT )

THE_FONT.size = 40
THE_FONT.weight = 2000
THE_FONT.shadow = true
surface.CreateFont( "LVS_FONT_HUD_LARGE", THE_FONT )
--addons/ssrp_lfs/lua/lvs_framework/autorun/sh_plane_keybinding.lua:

hook.Add( "LVS:Initialize", "[LVS] - Planes - Keys", function()
	local KEYS = {
		{
			name = "+THROTTLE",
			category = "LVS-Plane",
			name_menu = "Throttle Increase",
			default = "+forward",
			cmd = "lvs_plane_throttle_up"
		},
		{
			name = "-THROTTLE",
			category = "LVS-Plane",
			name_menu = "Throttle Decrease",
			default = "+back",
			cmd = "lvs_plane_throttle_down"
		},
		{
			name = "+PITCH",
			category = "LVS-Plane",
			name_menu = "Pitch Up",
			default = "+speed",
			cmd = "lvs_plane_pitch_up"
		},
		{
			name = "-PITCH",
			category = "LVS-Plane",
			name_menu = "Pitch Down",
			cmd = "lvs_plane_pitch_down"
		},
		{
			name = "-YAW",
			category = "LVS-Plane",
			name_menu = "Yaw Left [Roll in Direct Input]",
			cmd = "lvs_plane_yaw_left"
		},
		{
			name = "+YAW",
			category = "LVS-Plane",
			name_menu = "Yaw Right [Roll in Direct Input]",
			cmd = "lvs_plane_yaw_right"
		},
		{
			name = "-ROLL",
			category = "LVS-Plane",
			name_menu = "Roll Left [Yaw in Direct Input]",
			default = "+moveleft",
			cmd = "lvs_plane_roll_left"
		},
		{
			name = "+ROLL",
			category = "LVS-Plane",
			name_menu = "Roll Right [Yaw in Direct Input]",
			default = "+moveright",
			cmd = "lvs_plane_roll_right"
		},
	}

	for _, v in pairs( KEYS ) do
		LVS:AddKey( v.name, v.category, v.name_menu, v.cmd, v.default )
	end
end )
--addons/!lpakr_out/lua/pac3/libraries/string_stream.lua:
local a=math.huge;local b=math.frexp;local c=math.ldexp;local d=math.floor;local e=math.min;local f=math.max;local g=bit.rshift;local h={}local i={__index=h,__metatable="StringStream",__tostring=function(self)return string.format("Stringstream [%u,%u]",self:tell(),self:size())end}local j=setmetatable({},{__index=h})local k={__index=j,__metatable="StringStream",__tostring=function(self)return string.format("Stringstream [%u,%u]",self:tell(),self:size())end}local function l(m,n,o)local p=setmetatable({index=1,subindex=1},i)if m!=nil then assert(isstring(m),"stream must be a string")p:write(m)if n!=nil then assert(isnumber(n),"i must be a number")p:seek(n)else p:seek(1)end end;if o!=nil then assert(isstring(o),"endian must be a string")p:setEndian(o)end;return p end;local function q(r)if r==0 then return 0x00,0x00,0x00,0x00 elseif r==a then return 0x00,0x00,0x80,0x7F elseif r==-a then return 0x00,0x00,0x80,0xFF elseif r!=r then return 0x00,0x00,0xC0,0xFF else local s=0x00;if r<0 then s=0x80;r=-r end;local t,u=b(r)u=u+0x7F;if u<=0 then t=c(t,u-1)u=0 elseif u>0 then if u>=0xFF then return 0x00,0x00,0x80,s+0x7F elseif u==1 then u=0 else t=t*2-1;u=u-1 end end;t=d(c(t,23)+0.5)return t%0x100,g(t,8)%0x100,u%2*0x80+g(t,16),s+g(u,1)end end;local function v(w,x,y,z)local u=z%0x80*0x02+g(y,7)local t=c((y%0x80*0x100+x)*0x100+w,-23)if u==0xFF then if t>0 then return 0/0 else if z>=0x80 then return-a else return a end end elseif u>0 then t=t+1 else u=u+1 end;if z>=0x80 then t=-t end;return c(t,u-0x7F)end;local function A(r)if r==0 then return 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 elseif r==a then return 0x00,0x00,0x00,0x00,0x00,0x00,0xF0,0x7F elseif r==-a then return 0x00,0x00,0x00,0x00,0x00,0x00,0xF0,0xFF elseif r!=r then return 0x00,0x00,0x00,0x00,0x00,0x00,0xF8,0xFF else local s=0x00;if r<0 then s=0x80;r=-r end;local t,u=b(r)u=u+0x3FF;if u<=0 then t=c(t,u-1)u=0 elseif u>0 then if u>=0x7FF then return 0x00,0x00,0x00,0x00,0x00,0x00,0xF0,s+0x7F elseif u==1 then u=0 else t=t*2-1;u=u-1 end end;t=d(c(t,52)+0.5)return t%0x100,d(t/0x100)%0x100,d(t/0x10000)%0x100,d(t/0x1000000)%0x100,d(t/0x100000000)%0x100,d(t/0x10000000000)%0x100,u%0x10*0x10+d(t/0x1000000000000),s+g(u,4)end end;local function B(C,D,E,F,w,x,y,z)local u=z%0x80*0x10+g(y,4)local t=c((((((y%0x10*0x100+x)*0x100+w)*0x100+F)*0x100+E)*0x100+D)*0x100+C,-52)if u==0x7FF then if t>0 then return 0/0 else if z>=0x80 then return-a else return a end end elseif u>0 then t=t+1 else u=u+1 end;if z>=0x80 then t=-t end;return c(t,u-0x3FF)end;function h:setEndian(o)if o=="little"then debug.setmetatable(self,i)elseif o=="big"then debug.setmetatable(self,k)else error("Invalid endian specified",2)end end;function h:write(G)if self.index>#self then self[self.index]=G;self.index=self.index+1;self.subindex=1 else local n=1;local H=#G;while H>0 do if self.index>#self then self[self.index]=string.sub(G,n)self.index=self.index+1;self.subindex=1;break else local I=self[self.index]local J=e(#I-self.subindex+1,H)self[self.index]=string.sub(I,1,self.subindex-1)..string.sub(G,n,n+J-1)..string.sub(I,self.subindex+J)H=H-J;n=n+J;if H>0 then self.index=self.index+1;self.subindex=1 else self.subindex=self.subindex+J end end end end end;function h:read(H)local p={}while H>0 do local I=self[self.index]if I then if self.subindex==1&&H>=#I then p[#p+1]=I;self.index=self.index+1;H=H-#I else local J=e(#I-self.subindex+1,H)p[#p+1]=string.sub(I,self.subindex,self.subindex+J-1)H=H-J;if H>0 then self.index=self.index+1;self.subindex=1 else self.subindex=self.subindex+J end end else break end end;return table.concat(p)end;function h:seek(K)if K<1 then error("Index must be 1 or greater",2)end;self.index=#self+1;self.subindex=1;local H=0;for n,L in ipairs(self)do H=H+#L;if H>=K then self.index=n;self.subindex=K-(H-#L)break end end end;function h:skip(H)while H>0 do local I=self[self.index]if I then local J=e(#I-self.subindex+1,H)H=H-J;self.subindex=self.subindex+J;if self.subindex>#I then self.index=self.index+1;self.subindex=1 end else self.index=#self.index+1;self.subindex=1;break end end;while H<0 do local I=self[self.index]if I then local J=f(-self.subindex,H)H=H-J;self.subindex=self.subindex+J;if self.subindex<1 then self.index=self.index-1;self.subindex=self[self.index]&&#self[self.index]||1 end else self.index=1;self.subindex=1;break end end end;function h:tell()local H=0;for n=1,self.index-1 do H=H+#self[n]end;return H+self.subindex end;function h:size()local H=0;for n,L in ipairs(self)do H=H+#L end;return H end;function h:readUInt8()return string.byte(self:read(1))end;function j:readUInt8()return string.byte(self:read(1))end;function h:readUInt16()local M,N=string.byte(self:read(2),1,2)return N*0x100+M end;function j:readUInt16()local M,N=string.byte(self:read(2),1,2)return M*0x100+N end;function h:readUInt32()local M,N,O,P=string.byte(self:read(4),1,4)return P*0x1000000+O*0x10000+N*0x100+M end;function j:readUInt32()local M,N,O,P=string.byte(self:read(4),1,4)return M*0x1000000+N*0x10000+O*0x100+P end;function h:readInt8()local Q=self:readUInt8()if Q>=0x80 then Q=Q-0x100 end;return Q end;function h:readInt16()local Q=self:readUInt16()if Q>=0x8000 then Q=Q-0x10000 end;return Q end;function h:readInt32()local Q=self:readUInt32()if Q>=0x80000000 then Q=Q-0x100000000 end;return Q end;function h:readFloat()return v(string.byte(self:read(4),1,4))end;function j:readFloat()local M,N,O,P=string.byte(self:read(4),1,4)return v(P,O,N,M)end;function h:readDouble()return B(string.byte(self:read(8),1,8))end;function j:readDouble()local M,N,O,P,R,S,T,U=string.byte(self:read(8),1,8)return B(U,T,S,R,P,O,N,M)end;function h:readUntil(V)V=string.char(V)local p={}for n=self.index,#self do local I=self[self.index]local W=string.find(I,V,self.subindex,true)if W then p[#p+1]=string.sub(I,self.subindex,W)self.subindex=W+1;if self.subindex>#I then self.index=self.index+1;self.subindex=1 end;break else if self.subindex==1 then p[#p+1]=I else p[#p+1]=string.sub(I,self.subindex)end;self.index=self.index+1;self.subindex=1 end end;return table.concat(p)end;function h:readString()local X=self:readUntil(0)return string.sub(X,1,#X-1)end;function h:writeInt8(Q)if Q==a||Q==-a||Q!=Q then error("Can't convert error float to integer!",2)end;if Q<0 then Q=Q+0x100 end;self:write(string.char(Q%0x100))end;function h:writeInt16(Q)if Q==a||Q==-a||Q!=Q then error("Can't convert error float to integer!",2)end;if Q<0 then Q=Q+0x10000 end;self:write(string.char(Q%0x100,g(Q,8)%0x100))end;function j:writeInt16(Q)if Q==a||Q==-a||Q!=Q then error("Can't convert error float to integer!",2)end;if Q<0 then Q=Q+0x10000 end;self:write(g(Q,8)%0x100,string.char(Q%0x100))end;function h:writeInt32(Q)if Q==a||Q==-a||Q!=Q then error("Can't convert error float to integer!",2)end;if Q<0 then Q=Q+0x100000000 end;self:write(string.char(Q%0x100,g(Q,8)%0x100,g(Q,16)%0x100,g(Q,24)%0x100))end;function j:writeInt32(Q)if Q==a||Q==-a||Q!=Q then error("Can't convert error float to integer!",2)end;if Q<0 then Q=Q+0x100000000 end;self:write(string.char(g(Q,24)%0x100,g(Q,16)%0x100,g(Q,8)%0x100),Q%0x100)end;function h:writeFloat(Q)self:write(string.char(q(Q)))end;function j:writeFloat(Q)local M,N,O,P=q(Q)self:write(string.char(P,O,N,M))end;function h:writeDouble(Q)self:write(string.char(A(Q)))end;function j:writeDouble(Q)local M,N,O,P,R,S,T,U=A(Q)self:write(string.char(U,T,S,R,P,O,N,M))end;function h:writeString(string)self:write(string)self:write("\0")end;function h:getString()return table.concat(self)end;do do function h:writeBool(N)self:writeInt8(N&&1||0)end;function h:readBool()return self:readInt8()==1 end end;do function h:writeVector(Y)self:writeDouble(Y.x)self:writeDouble(Y.y)self:writeDouble(Y.z)end;function h:readVector()local Q=self:readDouble()local Z=self:readDouble()local _=self:readDouble()return Vector(Q,Z,_)end end;do function h:writeAngle(Y)self:writeDouble(Y.p)self:writeDouble(Y.y)self:writeDouble(Y.r)end;function h:readAngle()local Q=self:readDouble()local Z=self:readDouble()local _=self:readDouble()return Angle(Q,Z,_)end end;do function h:writeColor(Y)self:writeDouble(Y.r)self:writeDouble(Y.g)self:writeDouble(Y.b)self:writeDouble(Y.a)end;function h:readColor()local a0=self:readDouble()local T=self:readDouble()local N=self:readDouble()local M=self:readDouble()return Color(a0,T,N,M)end end;do function h:writeEntity(Y)self:writeInt32(Y:EntIndex())end;function h:readEntity()return Entity(self:readInt32())end end;function h:writeTable(a1)for a2,L in pairs(a1)do self:writeType(a2)self:writeType(L)end;self:writeType(nil)end;function h:readTable()local a1={}while true do local a2=self:readType()if a2==nil then return a1 end;a1[a2]=self:readType()end end;local a3={[TYPE_NIL]=function(X,a4,L)X:writeInt8(a4)end,[TYPE_STRING]=function(X,a4,L)X:writeInt8(a4)X:writeString(L)end,[TYPE_NUMBER]=function(X,a4,L)X:writeInt8(a4)X:writeDouble(L)end,[TYPE_TABLE]=function(X,a4,L)X:writeInt8(a4)X:writeTable(L)end,[TYPE_BOOL]=function(X,a4,L)X:writeInt8(a4)X:writeBool(L)end,[TYPE_VECTOR]=function(X,a4,L)X:writeInt8(a4)X:writeVector(L)end,[TYPE_ANGLE]=function(X,a4,L)X:writeInt8(a4)X:writeAngle(L)end,[TYPE_COLOR]=function(X,a4,L)X:writeInt8(a4)X:writeColor(L)end,[TYPE_ENTITY]=function(X,a4,L)X:writeInt8(a4)X:writeEntity(L)end}function h:writeType(L)local a5=nil;if IsColor(L)then a5=TYPE_COLOR else a5=TypeID(L)end;local a6=a3[a5]if a6 then return a6(self,a5,L)end;error("StringStream:writeType: Couldn't write "..type(L).." (type "..a5 ..")")end;local a7={[TYPE_NIL]=function(X)return nil end,[TYPE_STRING]=function(X)return X:readString()end,[TYPE_NUMBER]=function(X)return X:readDouble()end,[TYPE_TABLE]=function(X)return X:readTable()end,[TYPE_BOOL]=function(X)return X:readBool()end,[TYPE_VECTOR]=function(X)return X:readVector()end,[TYPE_ANGLE]=function(X)return X:readAngle()end,[TYPE_COLOR]=function(X)return X:readColor()end,[TYPE_ENTITY]=function(X)return X:readEntity()end}function h:readType(a5)a5=a5||self:readUInt8(8)local a6=a7[a5]if a6 then return a6(self)end;error("StringStream:readType: Couldn't read type "..tostring(a5))end end;return l
--addons/!lpakr_out/lua/pac3/core/client/max_render_time.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/bones.lua:
local pairs=pairs;local IsValid=IsValid;local unpack=unpack;local LocalToWorld=LocalToWorld;local a=math.sin;local RealTime=RealTime;local Entity=Entity;local ipairs=ipairs;local NULL=NULL;local LerpVector=LerpVector;local LerpAngle=LerpAngle;local Angle=Angle;local Vector=Vector;local b=util.QuickTrace;local pac=pac;local c=pac.CreateClientConVarFast("pac_enable_camera_as_bone","1",true,"boolean")pac.BoneNameReplacements={{"Anim_Attachment","attach"},{"RH","right hand"},{"LH","left hand"},{"_L_"," left "},{"_R_"," right "},{"%p"," "},{"ValveBiped",""},{"Bip01",""},{"Neck1","neck"},{"Head1","head"},{"Toe0","toe"},{"lowerarm","lower arm"},{"Bip",""},{" R"," right"},{" L"," left"}}function pac.GetAllBones(d)d=d||NULL;local e={}if d:IsValid()then d:InvalidateBoneCache()pac.SetupBones(d)local f=d:GetBoneCount()||0;for g=0,f do local h=d:GetBoneName(g)local i=h;if h then for j,k in pairs(pac.BoneNameReplacements)do i=i:gsub(k[1],k[2])end;i=i:Trim():lower():gsub("(.-)(%d+)","%1 %2")local l=d:GetBoneParent(g)if l==-1 then l=nil end;e[i]={friendly=i,real=h,bone=g,i=g,parent_i=l}end end;local m=d:GetAttachments()if m then for j,n in pairs(m)do local l=d:GetParentAttachment(n.id)if l==-1 then l=nil end;local i=n.name||"????"i=i:Trim():lower():gsub("(.-)(%d+)","%1 %2")if!e[i]then e[i]={friendly=i,real=n.name||"?????",id=n.id,i=n.id,parent_i=l,is_attachment=true}end end end;e.hitpos={friendly="hit position",is_special=true}e.footstep={friendly="footsteps",is_special=true}e.skirt={friendly="skirt",is_special=true}e.skirt2={friendly="skirt2",is_special=true}e.hitpos_world_props={friendly="hitpos_world_props",is_special=true}e.hitpos_world={friendly="hitpos_world",is_special=true}e.hitpos_world_noang={friendly="hitpos_world_noang",is_special=true}e.hitpos_ent_ang={friendly="hitpos_ent_ang",is_special=true}e.hitpos_ent_ang_zero_pitch={friendly="hitpos_ent_ang_zero_pitch",is_special=true}e.pos_ang={friendly="pos_ang",is_special=true}e.pos_eyeang={friendly="pos_eyeang",is_special=true}e.eyepos_eyeang={friendly="eyepos_eyeang",is_special=true}e.eyepos_ang={friendly="eyepos_ang",is_special=true}e.pos_noang={friendly="pos_noang",is_special=true}e.camera={friendly="camera",is_special=true}e.player_eyes={friendly="player_eyes",is_special=true}e.physgun_beam_endpos={friendly="physgun_beam_endpos",is_special=true}d.pac_bone_count=f+1 end;return e end;function pac.GetModelBones(d)if!d||!d:IsValid()then return{}end;if!d.pac_bones||d:GetModel()!=d.pac_last_model then d:InvalidateBoneCache()pac.SetupBones(d)if d.pac_holdtypes then d.pac_holdtypes={}end;d.pac_bones=pac.GetAllBones(d)d.pac_last_model=d:GetModel()end;return d.pac_bones end;function pac.GetAllFlexes(d)local o={}if d.GetFlexNum&&d:GetFlexNum()>0 then for p=0,d:GetFlexNum()-1 do local h=d:GetFlexName(p)o[h:lower()]={i=p,name=h}end end;return o end;function pac.GetFlexMap(d)if!d||!d:IsValid()then return{}end;if!d.pac_flex_map||d:GetModel()!=d.pac_last_model_flex then d.pac_flex_map=pac.GetAllFlexes(d)d.pac_last_model_flex=d:GetModel()end;return d.pac_flex_map end;function pac.ResetBoneCache(d)if!IsValid(d)then return end;d.pac_last_model=nil;d.pac_bones=nil;d.pac_cached_child_bones=nil;d.pac_flex_map=nil;if d.pac_holdtypes then d.pac_holdtypes={}end end;local q=Vector(0,0,1):Angle()local function r(d,s)local t,u=d:GetBonePosition(s)if!t then return end;if u.p!=u.p then u.p=0 end;if u.y!=u.y then u.y=0 end;if u.r!=u.r then u.r=0 end;if t==d:GetPos()then local v=d:GetBoneMatrix(s)if v then t=v:GetTranslation()u=v:GetAngles()end end;if(d:GetClass()=="viewmodel"||d==pac.LocalHands)&&d:GetOwner():IsPlayer()&&d:GetOwner():GetActiveWeapon().ViewModelFlip then u.r=-u.r end;return t,u end;local w=Angle(0,0,0)function pac.GetBonePosAng(d,s,x)if!d:IsValid()then return Vector(),Angle()end;if s=="physgun_beam_endpos"then if d.pac_drawphysgun_event then local y,z,A,B,g,C=unpack(d.pac_drawphysgun_event)local D;if A then if B:IsValid()then if g!=0 then local E,F=B:GetBonePosition(B:TranslatePhysBoneToBone(g))D=LocalToWorld(C,Angle(),E,F)else D=B:LocalToWorld(C)end else D=y.pac_traceres&&y.pac_traceres.HitPos||b(y:EyePos(),y:EyeAngles():Forward()*16000,{y,y:GetParent()}).HitPos end end;return D,Angle()end elseif s=="camera"then if c()then return pac.EyePos,pac.EyeAng else return d:EyePos(),d:EyeAngles()end elseif s=="player_eyes"then local G=d;local d=d.pac_traceres&&d.pac_traceres.Entity||b(d:EyePos(),d:EyeAngles():Forward()*16000,{d,d:GetParent()}).Entity;local H=c()if d:IsValid()&&(H||d!=pac.LocalPlayer)then return d:EyePos(),d:EyeAngles()end;if H then return pac.EyePos,pac.EyeAng else return G:EyePos(),G:EyeAngles()end elseif s=="pos_ang"then return d:GetPos(),d:GetAngles()elseif s=="pos_noang"then return d:GetPos(),w elseif s=="pos_eyeang"then return d:GetPos(),d:EyeAngles()elseif s=="eyepos_eyeang"then return d:EyePos(),d:EyeAngles()elseif s=="eyepos_ang"then return d:EyePos(),d:GetAngles()elseif s=="hitpos_world_props"then local I=b(d:EyePos(),d:EyeAngles():Forward()*16000,function(d)return d:GetClass()=="prop_physics"end)return I.HitPos,I.HitNormal:Angle()elseif s=="hitpos_world"then local I=b(d:EyePos(),d:EyeAngles():Forward()*16000,function(d)return d:IsWorld()end)return I.HitPos,I.HitNormal:Angle()elseif s=="hitpos_world_noang"then local I=b(d:EyePos(),d:EyeAngles():Forward()*16000,function(d)return d:IsWorld()end)return I.HitPos,w elseif s=="hitpos"||s=="hit position"then if d.pac_traceres then return d.pac_traceres.HitPos,d.pac_traceres.HitNormal:Angle()else local I=b(d:EyePos(),d:EyeAngles():Forward()*16000,{d,d:GetOwner()})return I.HitPos,I.HitNormal:Angle()end elseif s=="hitpos_ent_ang"then if d.pac_traceres then return d.pac_traceres.HitPos,d:EyeAngles()else local I=b(d:EyePos(),d:EyeAngles():Forward()*16000,{d,d:GetOwner()})return I.HitPos,d:EyeAngles()end elseif s=="hitpos_ent_ang_zero_pitch"then if d.pac_traceres then local u=d:EyeAngles()u.p=0;return d.pac_traceres.HitPos,u else local I=b(d:EyePos(),d:EyeAngles():Forward()*16000,{d,d:GetOwner()})return I.HitPos,d:EyeAngles()end elseif s=="footstep"then if d.pac_last_footstep_pos then return d.pac_last_footstep_pos,q end elseif s=="skirt"then local J,K=pac.GetBonePosAng(d,"left thigh",x)local L,M=pac.GetBonePosAng(d,"right thigh",x)return LerpVector(0.5,J,L),LerpAngle(0.5,K,M)elseif s=="skirt2"then local J,K=pac.GetBonePosAng(d,"left calf",x)local L,M=pac.GetBonePosAng(d,"right calf",x)return LerpVector(0.5,J,L),LerpAngle(0.5,K,M)end;local t,u;local N=pac.GetModelBones(d)local n=N[s]if n&&!n.is_special then if n.is_attachment then if x&&n.parent_i then local O=d:GetAttachment(n.parent_i)if!O then O=d:GetAttachment(n.id)end;if O then t,u=O.Pos,O.Ang end else local O=d:GetAttachment(n.id)if O then t,u=O.Pos,O.Ang end end else if x&&n.parent_i then t,u=r(d,n.parent_i)if!t||!u then t,u=r(d,n.bone)end else t,u=r(d,n.bone)end end else local P=s&&d:LookupBone(s)||nil;if P then t,u=r(d,P)end end;if!t then t=d:GetPos()end;if!u then if d:IsPlayer()then u=d:EyeAngles()u.p=0 else u=d:GetAngles()end end;return t,u end;do local Q=Vector(1,1,1)local R=Vector(0,0,0)local S=Angle(0,0,0)local T=FindMetaTable("Entity")local U=T.ManipulateBoneScale;local V=T.ManipulateBonePosition;local W=T.ManipulateBoneAngles;local X=T.ManipulateBoneJiggle;function pac.ResetBones(d)d.pac_bones_once=true;local Y=d.pac_boneanim;local f=(d:GetBoneCount()||0)-1;if Y then for p=0,f do U(d,p,Q)V(d,p,Y.positions[p]||R)W(d,p,Y.angles[p]||S)X(d,p,0)end else for p=0,f do U(d,p,Q)V(d,p,R)W(d,p,S)X(d,p,0)end end;local p=d.pac_bones_select_target;if p&&f>=p then U(d,p,d:GetManipulateBoneScale(p)*(1+a(RealTime()*4)*0.1))d.pac_bones_select_target=nil end;if d.pac_touching_flexes then local Z=false;for s,_ in pairs(d.pac_touching_flexes)do if!Z then d:SetFlexScale(1)Z=true end;if _<pac.RealTime then d:SetFlexWeight(s,0)else if d:GetFlexWeight(s)==0 then d.pac_touching_flexes[s]=nil end end end end;hook.Call("PAC3ResetBones",nil,d)end;function pac.SetEntityBoneMatrix(d,p,a0)pac.ManipulateBonePosition(d,p,a0:GetTranslation())pac.ManipulateBoneAngles(d,p,a0:GetAngles())end;function pac.ResetEntityBoneMatrix(d,p)pac.ManipulateBoneAngles(d,p,angle_zero)pac.ManipulateBonePosition(d,p,vector_origin)end;function pac.ManipulateBonePosition(y,s,a1)y.pac_boneanim=y.pac_boneanim||{positions={},angles={}}y.pac_boneanim.positions[s]=a1;if!y.pac_has_parts then y:ManipulateBonePosition(s,a1)end end;function pac.ManipulateBoneAngles(y,s,a1)y.pac_boneanim=y.pac_boneanim||{positions={},angles={}}y.pac_boneanim.angles[s]=a1;if!y.pac_has_parts then y:ManipulateBoneAngles(s,a1)end end end;if Entity(1):IsPlayer()&&!PAC_RESTART then timer.Simple(0,function()for j,a2 in ipairs(ents.GetAll())do pac.ResetBoneCache(a2)end end)end
--addons/!lpakr_out/lua/pac3/core/client/hooks.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/ear_grab_animation.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/base_movable.lua:
local pac=pac;local Vector=Vector;local Angle=Angle;local NULL=NULL;local Matrix=Matrix;local a,b=pac.PartTemplate("base")b.ClassName="base_movable"b.BaseName=b.ClassName;a:StartStorableVars():SetPropertyGroup("orientation"):GetSet("Bone","head"):GetSet("Position",Vector(0,0,0)):GetSet("Angles",Angle(0,0,0)):GetSet("EyeAngles",false):GetSet("PositionOffset",Vector(0,0,0)):GetSet("AngleOffset",Angle(0,0,0)):GetSetPart("AimPart"):GetSet("AimPartName","",{enums={["local eyes"]="LOCALEYES",["player eyes"]="PLAYEREYES",["local eyes yaw"]="LOCALEYES_YAW",["local eyes pitch"]="LOCALEYES_PITCH"}}):GetSetPart("Parent"):EndStorableVars()do function b:SetBone(c)self.Bone=c;pac.ResetBoneCache(self:GetOwner())end;function b:GetBonePosition()local d=self:GetParent()if d:IsValid()then if d.ClassName=="jiggle"then return d.pos,d.ang elseif!d.is_model_part&&!d.is_entity_part&&!d.is_bone_part&&!self.is_bone_part&&d.WorldMatrix then return d:GetWorldPosition(),d:GetWorldAngles()end end;local e=self:GetParentOwner()if e:IsValid()then return pac.GetBonePosAng(e,self.BoneOverride||self.Bone)end;return Vector(),Angle()end;function b:GetBoneMatrix()local d=self:GetParent()if d:IsValid()then if d.ClassName=="jiggle"then local f=Matrix()f:SetTranslation(d.pos)f:SetAngles(d.ang)return f elseif!d.is_model_part&&!d.is_entity_part&&!d.is_bone_part&&!self.is_bone_part&&d.WorldMatrix then return d.WorldMatrix end end;local f=Matrix()local e=self:GetParentOwner()if e:IsValid()then local g,h=pac.GetBonePosAng(e,self.BoneOverride||self.Bone)f:SetTranslation(g)f:SetAngles(h)end;return f end;function b:GetModelBones()return pac.GetModelBones(self:GetOwner())end;function b:GetModelBoneIndex()local i=self:GetModelBones()local e=self:GetOwner()if!e:IsValid()then return end;local j=self.Bone;if i[j]&&!i[j].is_special then return e:LookupBone(i[j].real)end;return nil end end;function b:BuildWorldMatrix(k)local l=Matrix()l:SetTranslation(self.Position)l:SetAngles(self.Angles)local m=self:GetBoneMatrix()*l;m:SetAngles(self:CalcAngles(m:GetAngles(),m:GetTranslation()))if k then m:Translate(self.PositionOffset)m:Rotate(self.AngleOffset)end;return m end;function b:GetWorldMatrixWithoutOffsets()return self:BuildWorldMatrix(false)end;function b:GetWorldMatrix()if!self.WorldMatrix||pac.FrameNumber!=self.last_framenumber then self.last_framenumber=pac.FrameNumber;self.WorldMatrix=self:BuildWorldMatrix(true)end;return self.WorldMatrix end;function b:GetWorldAngles()return self:GetWorldMatrix():GetAngles()end;function b:GetWorldPosition()return self:GetWorldMatrix():GetTranslation()end;function b:GetDrawPosition()return self:GetWorldPosition(),self:GetWorldAngles()end;function b:CalcAngles(h,n)n=n||self.WorldMatrix&&self.WorldMatrix:GetTranslation()if!n then return h end;local e=self:GetRootPart():GetOwner()if pac.StringFind(self.AimPartName,"LOCALEYES_YAW",true,true)then h=(pac.EyePos-n):Angle()h.p=0;return self.Angles+h end;if pac.StringFind(self.AimPartName,"LOCALEYES_PITCH",true,true)then h=(pac.EyePos-n):Angle()h.y=0;return self.Angles+h end;if pac.StringFind(self.AimPartName,"LOCALEYES",true,true)then return self.Angles+(pac.EyePos-n):Angle()end;if pac.StringFind(self.AimPartName,"PLAYEREYES",true,true)then local o=e.pac_traceres&&e.pac_traceres.Entity||NULL;if o:IsValid()then return self.Angles+(o:EyePos()-n):Angle()end;return self.Angles+(pac.EyePos-n):Angle()end;if self.AimPart:IsValid()&&self.AimPart.GetWorldPosition then return self.Angles+(self.AimPart:GetWorldPosition()-n):Angle()end;if self.EyeAngles then if e:IsPlayer()then return self.Angles+((e.pac_hitpos||e:GetEyeTraceNoCursor().HitPos)-n):Angle()elseif e:IsNPC()then return self.Angles+(e:EyePos()+e:GetForward()*100-n):Angle()end end;return h||Angle(0,0,0)end;a:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/clip.lua:
local a=render.EnableClipping;local b=render.PushCustomClipPlane;local LocalToWorld=LocalToWorld;local IsEntity=IsEntity;local c,d=pac.PartTemplate("base_drawable")d.FriendlyName="clip"d.ClassName="clip2"d.Groups={'model','modifiers'}d.Icon='icon16/cut.png'function d:OnParent(e)if!e.AddModifier then return end;e:AddModifier(self)local f=self:GetOwner()if f:IsValid()then function f.pacDrawModel(f)self:PreOnDraw()f:DrawModel()self:PostOnDraw()end end end;function d:OnUnParent(e)if!e:IsValid()then return end;if!e.RemoveModifier then return end;e:RemoveModifier(self)end;do local g;function d:PreOnDraw()g=a(true)local h,i=LocalToWorld(self.Position+self.PositionOffset,self:CalcAngles(self.Angles+self.AngleOffset),self:GetBonePosition())local j=i:Forward()b(j,j:Dot(h))end;local k=render.PopCustomClipPlane;function d:PostOnDraw()k()a(g)end end;c:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/link.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/script.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/core/client/parts/sound.lua:
local a=include("pac3/libraries/webaudio.lua")pac.webaudio2=a;local b,c=pac.PartTemplate("base_movable")c.FriendlyName="web sound"c.ClassName="sound2"c.Icon='icon16/music.png'c.Group='effects'b:StartStorableVars()b:SetPropertyGroup("generic")b:GetSet("Path","",{editor_panel="sound"})b:GetSet("Volume",1,{editor_sensitivity=0.25})b:GetSet("Pitch",1,{editor_sensitivity=0.125})b:GetSet("Radius",1500)b:GetSet("Doppler",false)b:GetSet("MinPitch",0,{editor_sensitivity=0.125})b:GetSet("MaxPitch",0,{editor_sensitivity=0.125})b:SetPropertyGroup("playback")b:GetSet("PlayCount",1,{editor_onchange=function(self,d)self.sens=0.25;d=tonumber(d)return math.Round(math.max(d,0))end,editor_friendly="PlayCount (0=loop)"})b:GetSet("Sequential",false,{description="if there are multiple sounds (separated by ; ), plays these sounds in sequential order instead of randomly"})b:GetSet("SequentialStep",1,{editor_onchange=function(self,d)self.sens=0.25;d=tonumber(d)return math.Round(d)end})b:GetSet("StopOnHide",false)b:GetSet("PauseOnHide",false)b:GetSet("Overlapping",false)b:GetSet("PlayOnFootstep",false)b:SetPropertyGroup("filter")b:GetSet("FilterType",0,{enums={none="0",lowpass="1",highpass="2"}})b:GetSet("FilterFraction",1,{editor_sensitivity=0.125,editor_clamp={0,1}})b:SetPropertyGroup("echo")b:GetSet("Echo",false)b:GetSet("EchoDelay",0.5,{editor_sensitivity=0.125})b:GetSet("EchoFeedback",0.75,{editor_sensitivity=0.125})b:SetPropertyGroup("lfo")b:GetSet("PitchLFOAmount",0,{editor_sensitivity=0.125,editor_friendly="pitch amount"})b:GetSet("PitchLFOTime",0,{editor_sensitivity=0.125,editor_friendly="pitch time"})b:GetSet("VolumeLFOAmount",0,{editor_sensitivity=0.125,editor_friendly="volume amount"})b:GetSet("VolumeLFOTime",0,{editor_sensitivity=0.125,editor_friendly="volume time"})b:EndStorableVars()function c:Initialize()a.Initialize()self.streams={}end;function c:GetNiceName()local e=self:GetPath()..";"local f={}for g,e in ipairs(e:Split(";"))do if e!=""then if e:StartWith("http")then e=e:gsub("%%(..)",function(h)local d=tonumber("0x"..h)if d then return string.char(d)end end)end;f[g]=pac.PrettifyName(("/"..e):match(".+/(.-)%.")||e:match("(.-)%."))||"sound"end end;return table.concat(f,";")end;local i={}local j=function(k,l,m)table.insert(i,k)l=l||"Set"..k;c["Set"..k]=function(self,n)if m then n=m(n)end;for o,p in pairs(self.streams)do if p:IsValid()then p[l](p,n)else self.streams[o]=nil end end;self[k]=n end end;j("Pitch","SetPlaybackRate")j("PlayCount","SetMaxLoopCount")j("Volume",nil,function(q)return math.Clamp(q,0,4)end)j("Radius","SetSourceRadius")j("FilterType")j("FilterFraction")j("Echo")j("EchoDelay")j("EchoFeedback",nil,function(q)return math.Clamp(q,0,0.99)end)j("PitchLFOAmount")j("PitchLFOTime")j("VolumeLFOAmount")j("VolumeLFOTime")j("Doppler")function c:OnThink()local r=self:GetRootPart():GetOwner()for o,p in pairs(self.streams)do if!p:IsValid()then self.streams[o]=nil;goto s end;if self.PlayCount==0 then p:Resume()end;if p.owner_set!=r&&r:IsValid()then p:SetSourceEntity(r,true)p.owner_set=r end::s::end;if self.last_playonfootstep!=self.PlayOnFootstep then local t=self:GetOwner()if t:IsValid()&&t:IsPlayer()then t.pac_footstep_override=t.pac_footstep_override||{}if self.PlayOnFootstep then t.pac_footstep_override[self.UniqueID]=self else t.pac_footstep_override[self.UniqueID]=nil end;if table.Count(t.pac_footstep_override)==0 then t.pac_footstep_override=nil end;self.last_playonfootstep=self.PlayOnFootstep end end end;function c:SetPath(e)self.seq_index=1;self.Path=e;local u={}for v,e in ipairs(e:Split(";"))do local w,x=e:match(".+%[(.-),(.-)%]")w=tonumber(w)x=tonumber(x)if w&&x then for g=w,x do table.insert(u,e:gsub("%[.-%]",g))end else table.insert(u,e)end end;for v,p in pairs(self.streams)do if p:IsValid()then p:Remove()end end;self.streams={}local function y(e)local p=a.CreateStream(e)self.streams[e]=p;p:Set3D(true)p.OnLoad=function()for v,z in ipairs(i)do self["Set"..z](self,self["Get"..z](self))end end;p.OnError=function(v,A,B)B=B||"unknown error"if self:IsValid()&&pac.LocalPlayer==self:GetPlayerOwner()&&pace&&pace.IsActive()then if pace&&pace.current_part==self&&!IsValid(pace.BusyWithProperties)then pace.MessagePrompt(A.."\n"..B,"OGG error for"..e,"OK")else pac.Message("OGG error: ",A," reason: ",A.."\n"..B,"OGG error for"..e)self:SetError("OGG error: "..A.."\n"..B.."\nfor:"..e)end end end;p.UpdateSourcePosition=function()if self:IsValid()then p.SourcePosition=self:GetDrawPosition()end end;if pace&&pace.Editor:IsValid()&&pace.current_part:IsValid()&&pace.current_part.ClassName=="ogg2"&&self:GetPlayerOwner()==pac.LocalPlayer then p:Play()end end;for v,e in ipairs(u)do local B=sound.GetProperties(e)if B then e=B.sound end;if!string.StartsWith(e,"http")||!pac.resource.Download(e,function(e)y("data/"..e)end)then y("sound/"..e)end end;self.paths=u end;c.last_stream=NULL;function c:PlaySound(v,C)C=C||0;local p=table.Random(self.streams)||NULL;if!p:IsValid()then return end;if self.Sequential then self.seq_index=self.seq_index||1;local D=self.paths[self.seq_index]||self.paths[1]local E="sound/"..D;local F="data/pac3_cache/downloads/"..pac.Hash(D)..".dat"if string.find(D,"^http")then E=F end;if self.streams[E]:IsValid()then p=self.streams[E]print(E,self.seq_index)end;self.seq_index=self.seq_index+self.SequentialStep;if self.seq_index>#self.paths then self.seq_index=self.seq_index-#self.paths elseif self.seq_index<1 then self.seq_index=self.seq_index+#self.paths end end;p:SetAdditiveVolumeModifier(C)if self.last_stream:IsValid()&&!self.Overlapping&&!self.PauseOnHide then self.last_stream:Stop()end;if self.MinPitch!=self.MaxPitch then p:SetAdditivePitchModifier(math.Rand(self.MinPitch,self.MaxPitch))else p:SetAdditivePitchModifier(0)end;if self.PauseOnHide then p:Resume()else p:Play()end;self.last_stream=p end;function c:StopSound()for z,p in pairs(self.streams)do if p:IsValid()then if self.PauseOnHide then p:Pause()elseif self.StopOnHide then p:Stop()end end end end;function c:OnShow(G)if!G then self:PlaySound()end end;function c:OnHide()self:StopSound()end;function c:OnRemove()for z,p in pairs(self.streams)do if!p:IsValid()then self.streams[z]=nil;goto s end;p:Remove()::s::end end;b:Register()
--addons/!lpakr_out/lua/pac3/core/client/parts/legacy/trail.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/pac_editor_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/parts.lua:
return lpakr()()
--addons/!lpakr_out/lua/pac3/editor/client/animation_timeline.lua:
local a=pac.animations;local b=a.eases;local c=pace.LanguageString;pace.timeline=pace.timeline||{}local d=pace.timeline;local e=200;do local f,g=pac.PartTemplate("base_movable")g.ClassName="timeline_dummy_bone"g.show_in_editor=false;g.PropertyWhitelist={Position=true,Angles=true,Bone=true}function g:GetParentOwner()return self:GetOwner()end;function g:GetBonePosition()local h=self:GetOwner()local i=self:GetModelBoneIndex(self.Bone)if!i then return h:GetPos(),h:GetAngles()end;pac.SetupBones(h)local j=h:GetBoneMatrix(i)local k=Matrix()k:SetTranslation(self.Position)k:SetAngles(self.Angles)j=j*k:GetInverse()if!j then return h:GetPos(),h:GetAngles()end;return j:GetTranslation(),j:GetAngles()end;f:Register()end;function d.IsActive()return d.editing end;local function l()if!d.entity:IsPlayer()then return end;if d.data.Type=="sequence"then pac.AddHook("CalcMainActivity","pac3_timeline",function(m)if m==d.entity then local n=m:LookupSequence("ragdoll")||m:LookupSequence("reference")return n,n end end)else pac.RemoveHook("CalcMainActivity","pac3_timeline")end end;d.interpolation="cosine"function d.SetInterpolation(o)d.interpolation=o;d.data=d.data||{FrameData={}}d.data.Interpolation=d.interpolation;d.Save()end;d.animation_type="sequence"function d.SetAnimationType(o)d.animation_type=o;d.frame.add_keyframe_button:SetDisabled(d.animation_type=="posture")d.data=d.data||{FrameData={}}d.data.Type=d.animation_type;d.Save()end;function d.SetCycle(p)a.SetEntityAnimationCycle(d.entity,d.animation_part:GetAnimID(),p)end;function d.GetCycle()return a.GetEntityAnimationCycle(d.entity,d.animation_part:GetAnimID())||0 end;function d.Stop()d.frame:Stop()end;function d.UpdateFrameData()if!d.selected_keyframe||!d.selected_bone then return end;local q=d.selected_keyframe:GetData().BoneInfo[d.selected_bone]||{}q.MF=q.MF||0;q.MR=q.MR||0;q.MU=q.MU||0;q.RR=q.RR||0;q.RU=q.RU||0;q.RF=q.RF||0;d.dummy_bone:SetPosition(Vector(q.MF,-q.MR,q.MU))d.dummy_bone:SetAngles(Angle(q.RR,q.RU,q.RF))end;function d.EditBone()pace.Call("PartSelected",d.dummy_bone)local r=pac.GetModelBones(d.entity)d.selected_bone=d.dummy_bone&&d.dummy_bone:GetBone()&&r[d.dummy_bone:GetBone()]&&r[d.dummy_bone:GetBone()].real||false;if!d.selected_bone then for s,t in pairs(r)do if!t.is_special&&!t.is_attachment then d.selected_bone=t.real;break end end;if!d.selected_bone then d.selected_bone='????'end end;d.UpdateFrameData()pace.PopulateProperties(d.dummy_bone)l()end;function d.Load(q)d.data=q;if q&&q.FrameData then a.ConvertOldData(q)if!q.Type then q.Type=0;local u={}for s,t in pairs(q.FrameData)do table.insert(u,t)end;q.FrameData=u end;d.animation_part:SetInterpolation(q.Interpolation)d.animation_part:SetAnimationType(q.Type)d.frame:Clear()for v,t in ipairs(q.FrameData)do local w=d.frame:AddKeyFrame(true)w:SetFrameData(v,t)end;d.SelectKeyframe(d.frame.keyframe_scroll:GetCanvas():GetChildren()[1])else d.data={FrameData={},Type=d.animation_type,Interpolation=d.interpolation}d.frame:Clear()d.SelectKeyframe(d.frame:AddKeyFrame())d.Save()end;d.UpdateFrameData()end;function d.Save()local q=table.Copy(d.data)local x=d.animation_part;timer.Create("pace_timeline_save",0.1,1,function()if x&&x:IsValid()then a.RegisterAnimation(x:GetAnimID(),q)if x:GetURL()!=""then file.Write("pac3/__animations/"..x:GetName()..".txt",util.TableToJSON(q))x:SetData("")else x.Data=util.TableToJSON(q)timer.Create("pace_backup",1,1,function()pace.Backup()end)end end end)end;function d.SelectKeyframe(w)d.selected_keyframe=w;d.UpdateFrameData()d.EditBone()d.Save()a.SetEntityAnimationFrame(d.entity,d.animation_part:GetAnimID(),w.AnimationKeyIndex,1)d.frame:Pause()end;function d.IsEditingBone()return d.dummy_bone==pace.current_part end;function d.Close()d.Save()if d.animation_part:GetURL()!=""then file.Write("pac3/__animations/backups/previous_session_"..os.date("%m%d%y%H%M%S")..".txt",util.TableToJSON(d.data))end;d.editing=false;if d.entity:IsValid()then d.Stop()end;d.animation_part=nil;d.frame:Remove()if d.dummy_bone&&d.dummy_bone:IsValid()then d.dummy_bone:Remove()end;pac.RemoveHook("pace_OnVariableChanged","pac3_timeline")pac.RemoveHook("CalcMainActivity","pac3_timeline")end;function d.Open(x)file.CreateDir("pac3")file.CreateDir("pac3/__animations")file.CreateDir("pac3/__animations/backups")d.editing=false;d.first_pass=true;d.editing=true;d.animation_part=x;d.entity=x:GetOwner()d.frame=vgui.Create("pac3_timeline")d.frame:SetSize(ScrW()-pace.Editor:GetWide(),93)d.frame:SetPos(pace.Editor:GetWide(),ScrH()-d.frame:GetTall())d.frame:SetTitle("")d.frame:ShowCloseButton(false)d.SetAnimationType(x.AnimationType)if d.dummy_bone&&d.dummy_bone:IsValid()then d.dummy_bone:Remove()end;d.dummy_bone=pac.CreatePart("timeline_dummy_bone",d.entity)d.dummy_bone:SetOwner(d.entity)pac.AddHook("pace_OnVariableChanged","pac3_timeline",function(x,y,z)if x==d.dummy_bone then if y=="Bone"then local r=pac.GetModelBones(d.entity)d.selected_bone=r[z]&&r[z].real||false;if!d.selected_bone then for s,t in pairs(r)do if!t.is_special&&!t.is_attachment then d.selected_bone=t.real;break end end;if!d.selected_bone then d.selected_bone='????'end end;timer.Simple(0,function()d.EditBone()end)else local q=d.selected_keyframe:GetData()q.BoneInfo=q.BoneInfo||{}q.BoneInfo[d.selected_bone]=q.BoneInfo[d.selected_bone]||{}q.BoneInfo[d.selected_bone].MF=q.BoneInfo[d.selected_bone].MF||0;q.BoneInfo[d.selected_bone].MR=q.BoneInfo[d.selected_bone].MR||0;q.BoneInfo[d.selected_bone].MU=q.BoneInfo[d.selected_bone].MU||0;q.BoneInfo[d.selected_bone].RR=q.BoneInfo[d.selected_bone].RR||0;q.BoneInfo[d.selected_bone].RU=q.BoneInfo[d.selected_bone].RU||0;q.BoneInfo[d.selected_bone].RF=q.BoneInfo[d.selected_bone].RF||0;if y=="Position"then q.BoneInfo[d.selected_bone].MF=z.x;q.BoneInfo[d.selected_bone].MR=-z.y;q.BoneInfo[d.selected_bone].MU=z.z elseif y=="Angles"then q.BoneInfo[d.selected_bone].RR=z.p;q.BoneInfo[d.selected_bone].RU=z.y;q.BoneInfo[d.selected_bone].RF=z.r end end;d.Save()elseif x==d.animation_part then if y=="Data"||y=="URL"then d.Load(a.GetRegisteredAnimations()[x:GetAnimID()])elseif y=="AnimationType"then d.SetAnimationType(z)elseif y=="Interpolation"then d.SetInterpolation(z)elseif y=="Rate"then d.data.TimeScale=z;d.Save()elseif y=="BonePower"then d.data.Power=z;d.Save()end end end)d.Load(a.GetRegisteredAnimations()[x:GetAnimID()])pac.RemoveHook("CalcMainActivity","pac3_timeline")d.Stop()end;pac.AddHook("pace_OnPartSelected","pac3_timeline",function(x)if x.ClassName=="timeline_dummy_bone"then return end;if x.ClassName=="custom_animation"then if d.editing then d.Close()end;d.Open(x)elseif d.editing then d.Close()end end)do local A={}function A:Init()self:DockMargin(0,0,0,0)self:DockPadding(0,35,0,0)do local B=self:Add("DPanel")local C=c"frame"..": 10.888"surface.SetFont(pace.CurrentFont)local D,E=surface.GetTextSize(C)B:SetWide(D)B:SetTall(E*2+2)B:SetPos(0,1)B.Paint=function(F,D,E)self:GetSkin().tex.Tab_Control(0,0,D,E)self:GetSkin().tex.CategoryList.Header(0,0,D,E)if!d.animation_part then return end;local D,E=draw.TextShadow({text=c"frame"..": "..(a.GetEntityAnimationFrame(d.entity,d.animation_part:GetAnimID())||0),font=pace.CurrentFont,pos={2,0},color=self:GetSkin().Colours.Category.Header},1,100)draw.TextShadow({text=c"time"..": "..math.Round(d.GetCycle()*a.GetAnimationDuration(d.entity,d.animation_part:GetAnimID()),3),font=pace.CurrentFont,pos={2,E},color=self:GetSkin().Colours.Category.Header},1,100)end end;do local G=vgui.Create("DPanel",self)G:Dock(RIGHT)G:SetWide(72)do local H=G:Add("DPanel")H:SetWide(100)H:SetTall(G:GetTall())H:Dock(BOTTOM)H:SetTall(36)local I=36;local J=(I-24)/2;local K=H:Add("DButton")K:SetSize(I,I)K:SetText("")K.DoClick=function()self:Toggle()end;K:Dock(LEFT)local L=H:Add("DButton")L:SetSize(I,I)L:SetText("")L.DoClick=function()self:Stop()end;L:Dock(LEFT)function K.PaintOver(M,D,E)surface.SetDrawColor(self:GetSkin().Colours.Button.Normal)draw.NoTexture()if self:IsPlaying()then surface.DrawRect(J,J,10,E-J*2)surface.DrawRect(J+13,J,10,E-J*2)else surface.DrawPoly({{x=J,y=J},{x=D-J,y=E/2},{x=J,y=E-J}})end end;function L:PaintOver(D,E)surface.SetDrawColor(self:GetSkin().Colours.Button.Normal)surface.DrawRect(J,J,24,24)end end;do local N=G:Add("DPanel")N:SetWide(100)N:SetTall(G:GetTall())N:Dock(TOP)N:SetTall(16)local O=N:Add("DImageButton")O:SetImage("icon16/add.png")O:SetTooltip(c"add keyframe")O:SizeToContents()O.DoClick=function()d.SelectKeyframe(self:AddKeyFrame())d.Save()end;O:Dock(LEFT)O:SetDisabled(true)self.add_keyframe_button=O;local P=N:Add("DImageButton")P:SetImage("icon16/connect.png")P:SetTooltip(c"edit bones")P:SizeToContents()P:Dock(LEFT)P.DoClick=function()d.EditBone()end;local Q=N:Add("DImageButton")Q:SetImage("icon16/disk.png")Q:SetTooltip(c"save")Q:SizeToContents()Q:Dock(RIGHT)Q.DoClick=function()Derma_StringRequest(c"question",c"save as",d.animation_part:GetName(),function(R)a.RegisterAnimation(R,table.Copy(d.data))file.Write("pac3/__animations/"..R..".txt",util.TableToJSON(d.data))end,function()end,c"save",c"cancel")end;local S=N:Add("DImageButton")S:SetImage("icon16/folder.png")S:SizeToContents()S:Dock(RIGHT)S:SetTooltip(c"load")S.DoClick=function()local T=DermaMenu()T:SetPos(S:LocalToScreen())for M,R in pairs(file.Find("animations/*.txt","DATA"))do T:AddOption(R:match("(.+)%.txt"),function()d.Load(util.JSONToTable(file.Read("animations/"..R)))end)end;for M,R in pairs(file.Find("pac3/__animations/*.txt","DATA"))do T:AddOption(R:match("(.+)%.txt"),function()d.Load(util.JSONToTable(file.Read("pac3/__animations/"..R)))end)end;T:PerformLayout()local U,V=G:LocalToScreen(0,0)U=U+G:GetWide()T:SetPos(U-T:GetWide(),V-T:GetTall())end end end;do local W=vgui.Create("pac_scrollpanel_horizontal",self)W:Dock(FILL)W:GetCanvas().Paint=function(M,D,E)derma.SkinHook("Paint","ListBox",self,D,E)end;W.PaintOver=function()if!d.animation_part then return end;local X=-self.keyframe_scroll:GetCanvas():GetPos()local U=d.GetCycle()*self.keyframe_scroll:GetCanvas():GetWide()end;local Y=W.PerformLayout;function W.PerformLayout()Y(W)local E=self:GetTall()-45;W:GetCanvas():SetTall(E)if self.moving then return end;local U=0;for s,t in ipairs(W:GetCanvas():GetChildren())do t:SetWide(math.max(1/t:GetData().FrameRate*e,4))t:SetTall(E)t:SetPos(U,0)U=U+t:GetWide()end end;self.keyframe_scroll=W end;do local W=vgui.Create("DPanel",self)surface.SetFont(pace.CurrentFont)local M,E=surface.GetTextSize("|")W:SetTall(E+2)W:Dock(TOP)W:NoClipping(true)W:SetCursor("sizewe")W.Think=function(M)if(self.dragging||W:IsHovered())&&input.IsMouseDown(MOUSE_LEFT)then if!self:IsPlaying()then self:Play()self:Pause()end;if d.data&&d.data.FrameData then local Z=-self.keyframe_scroll:GetCanvas():GetPos()+W:ScreenToLocal(gui.MouseX(),0)Z=Z/self.keyframe_scroll:GetCanvas():GetWide()d.SetCycle(Z)end;self.dragging=true end;if!input.IsMouseDown(MOUSE_LEFT)then self.dragging=false end end;local _=Material("icon16/bullet_arrow_down.png")local a0=Material("icon16/control_play_blue.png")local a1=Material("icon16/control_repeat_blue.png")local a2=Material("icon16/arrow_branch.png")W.Paint=function(F,D,E)local X=-self.keyframe_scroll:GetCanvas():GetPos()local a3=self.keyframe_scroll:GetCanvas():GetPos()self:GetSkin().tex.Tab_Control(0,0,D,E)self:GetSkin().tex.CategoryList.Header(0,0,D,E)local a4=X-X%e;for v=a4,a4+F:GetWide(),e/2 do if v-X>0&&v-X<ScrW()then local a5=v/e;local U=v-X;surface.SetDrawColor(0,0,0,100)surface.DrawLine(U+1,1+1,U+1,W:GetTall()-3+1)surface.SetDrawColor(self:GetSkin().Colours.Category.Header)surface.DrawLine(U,1,U,W:GetTall()-3)surface.SetTextPos(U+2+1,1+1)surface.SetFont(pace.CurrentFont)surface.SetTextColor(0,0,0,100)surface.DrawText(a5)surface.SetTextPos(U+2,1)surface.SetFont(pace.CurrentFont)surface.SetTextColor(self:GetSkin().Colours.Category.Header)surface.DrawText(a5)end end;for v=a4,a4+F:GetWide(),e/8 do if v-X>0&&v-X<ScrW()then local U=v-X;surface.SetDrawColor(0,0,0,100)surface.DrawLine(U+1,1+1,U+1,W:GetTall()/2+1)surface.SetDrawColor(self:GetSkin().Colours.Category.Header)surface.DrawLine(U,1,U,W:GetTall()/2)end end;local E=self.keyframe_scroll:GetCanvas():GetTall()+W:GetTall()if self.keyframe_scroll:GetVBar():IsVisible()then E=E-self.keyframe_scroll:GetVBar():GetTall()+5 end;for v,t in ipairs(self.keyframe_scroll:GetCanvas():GetChildren())do local a6=t.restart&&a1||t.start&&a0||false;local a7=t.estyle&&a2||false;if a6 then local U=t:GetPos()surface.SetDrawColor(255,255,255,200)surface.DrawLine(U,-a6:Height()/2-5,U,E)surface.SetDrawColor(255,255,255,255)surface.SetMaterial(a6)surface.DrawTexturedRect(1+U,a6:Height()-5,a6:Width(),a6:Height())end;if a7 then local a8=t:GetSize()local U=t:GetPos()+a8*0.5;surface.SetDrawColor(255,255,255,255)surface.SetMaterial(a7)surface.DrawTexturedRect(1+U-a7:Width()*0.5,a7:Height(),a7:Width(),a7:Height())if a8>=65 then draw.SimpleText(t.estyle,"Default",U,a7:Height()*2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)end end end;if!d.animation_part then return end;local U=d.GetCycle()*self.keyframe_scroll:GetCanvas():GetWide()U=U-X;surface.SetDrawColor(255,0,0,200)surface.DrawLine(U,0,U,E)surface.SetDrawColor(255,0,0,255)surface.SetMaterial(_)surface.DrawTexturedRect(1+U-_:Width()/2,-11,_:Width(),_:Height())end end end;function A:Paint(D,E)self:GetSkin().tex.Tab_Control(0,35,D,E-35)end;function A:Think()DFrame.Think(self)if pace.Editor:GetPos()+pace.Editor:GetWide()/2<ScrW()/2 then self:SetSize(ScrW()-(pace.Editor.x+pace.Editor:GetWide()),93)self:SetPos(pace.Editor.x+pace.Editor:GetWide(),ScrH()-self:GetTall())else self:SetSize(ScrW()-(ScrW()-pace.Editor.x),93)self:SetPos(0,ScrH()-self:GetTall())end;if input.IsKeyDown(KEY_SPACE)then if!self.toggled then self:Toggle()self.toggled=true end else self.toggled=false end end;function A:Play()a.RegisterAnimation(d.animation_part:GetAnimID(),d.data)a.SetEntityAnimation(d.entity,d.animation_part:GetAnimID())a.GetEntityAnimation(d.entity,d.animation_part:GetAnimID()).Paused=false;self.playing=true end;function A:OnMouseWheeled(a9)if input.IsControlDown()then e=e+a9*10 end end;function A:Pause()local aa=a.GetEntityAnimation(d.entity,d.animation_part:GetAnimID())if!aa then return end;a.GetEntityAnimation(d.entity,d.animation_part:GetAnimID()).Paused=true;self.playing=false end;function A:IsPlaying()return self.playing end;function A:Toggle()if self:IsPlaying()then self:Pause()else self:Play()end end;function A:Stop()self:Pause()a.StopAllEntityAnimations(d.entity)a.ResetEntityBoneMatrix(d.entity)end;function A:Clear()for v,t in pairs(self.keyframe_scroll:GetCanvas():GetChildren())do t:Remove()end;self.add_keyframe_button:SetDisabled(false)end;function A:GetAnimationTime()local ab=0;if d.data&&d.data.FrameData then for v=1,#d.data.FrameData do local t=d.data.FrameData[v]ab=ab+1/(t.FrameRate||1)end end;return ab end;function A:ResolveRestart()d.first_pass=false;local ac=0;local ad=d.data.RestartFrame;if!ad then return 0 end;for v,t in ipairs(d.data.FrameData)do if v==ad then return ac end;ac=ac+1/(t.FrameRate||1)end;return 0 end;function A:ResolveStart()d.first_pass=true;local ac=0;local ae=d.data.StartFrame;if!ae then return 0 end;for v,t in ipairs(d.data.FrameData)do if v==ae then return ac end;ac=ac+1/(t.FrameRate||1)end;return 0 end;function A:AddKeyFrame(af)local w=vgui.Create("pac3_timeline_keyframe")if!af then w.AnimationKeyIndex=table.insert(d.data.FrameData,{FrameRate=1,BoneInfo={}})w.DataTable=d.data.FrameData[w.AnimationKeyIndex]end;w:SetWide(e)w:SetParent(self.keyframe_scroll)self.keyframe_scroll:InvalidateLayout()w.Alternate=#d.frame.keyframe_scroll:GetCanvas():GetChildren()%2==1;return w end;vgui.Register("pac3_timeline",A,"DFrame")end;do local ag={}function ag:Init()self:SetCursor("hand")end;function ag:OnCursorMoved(U,V)if U>self:GetWide()-4 then self:SetCursor("sizewe")else self:SetCursor("hand")end end;function ag:SetStart(ah)self.start=ah end;function ag:GetStart()return self.start end;function ag:SetRestart(ah)self.restart=ah end;function ag:GetRestart()return self.restart end;function ag:GetData()return self.DataTable end;function ag:SetFrameData(i,ai)self.DataTable=ai;self.AnimationKeyIndex=i;self:GetParent():GetParent():InvalidateLayout()if ai.EaseStyle then self.estyle=ai.EaseStyle end;if d.data.RestartFrame==i then self:SetRestart(true)end;if d.data.StartFrame==i then self:SetStart(true)end end;function ag:GetAnimationIndex()return self.AnimationKeyIndex end;function ag:Paint(D,E)self.AltLine=self.Alternate;derma.SkinHook("Paint","CategoryButton",self,D,E)if d.selected_keyframe==self then local aj=self:GetSkin().Colours.Category.Line.Button_Selected;surface.SetDrawColor(aj.r,aj.g,aj.b,250)end;surface.DrawRect(0,0,D,E)surface.SetDrawColor(0,0,0,75)surface.DrawOutlinedRect(0,0,D,E)end;function ag:Think()if self.size_x then local ak=self.size_x-gui.MouseX()self:SetLength((self.size_w-ak)/e)elseif self.move then local U,V=self:GetPos()local ak=gui.MouseX()-self.move;self:SetPos(self.move_x+ak,V)end end;function ag:OnMouseReleased(al)if al==MOUSE_LEFT then if self.size_x then self.size_x=nil;self.size_w=nil;self:MouseCapture(false)self:SetCursor("sizewe")d.Save()elseif self.move then local am={}local u={}for s,t in pairs(d.frame.keyframe_scroll:GetCanvas():GetChildren())do table.insert(am,t)t:SetParent()end;table.sort(am,function(an,ah)return an:GetPos()+an:GetWide()/2<ah:GetPos()+ah:GetWide()/2 end)for v,t in ipairs(am)do t:SetParent(d.frame.keyframe_scroll)t.Alternate=#d.frame.keyframe_scroll:GetCanvas():GetChildren()%2==1;u[v]=d.data.FrameData[t:GetAnimationIndex()]end;for v,t in ipairs(u)do d.data.FrameData[v]=t;am[v].AnimationKeyIndex=v end;self:MouseCapture(false)self:SetCursor("hand")self.move=nil;self.move_x=nil;d.frame.moving=false end end end;function ag:OnMousePressed(al)if al==MOUSE_LEFT then local U=self:CursorPos()if U>=self:GetWide()-4 then self.size_x=gui.MouseX()self.size_w=self:GetWide()self:MouseCapture(true)self:SetCursor("sizewe")else self.move=gui.MouseX()self.move_x=self:GetPos()self:MoveToFront()self:MouseCapture(true)self:SetCursor("sizeall")d.frame.moving=true end;d.frame:Toggle(false)d.SelectKeyframe(self)elseif al==MOUSE_RIGHT then local T=DermaMenu()T:AddOption(c"set length",function()Derma_StringRequest(c"question",c"how long should this frame be in seconds?",tostring(self:GetWide()/e),function(o)self:SetLength(tonumber(o))end,function()end,c"set length",c"cancel")end):SetImage("icon16/time.png")T:AddOption(c"multiply length",function()Derma_StringRequest(c"question",c"multiply "..self:GetAnimationIndex().."'s length","1.0",function(o)self:SetLength(1/tonumber(o))end,function()end,c"multiply length",c"cancel")end):SetImage("icon16/time_add.png")if!self:GetRestart()then T:AddOption(c"set restart",function()for M,t in pairs(d.frame.keyframe_scroll:GetCanvas():GetChildren())do t:SetRestart(false)end;self:SetRestart(true)d.data.RestartFrame=self:GetAnimationIndex()end):SetImage("icon16/control_repeat_blue.png")else T:AddOption(c"unset restart",function()self:SetRestart(false)d.data.StartFrame=nil end):SetImage("icon16/control_repeat.png")end;if!self:GetStart()then T:AddOption(c"set start",function()for M,t in pairs(d.frame.keyframe_scroll:GetCanvas():GetChildren())do t:SetStart(false)end;self:SetStart(true)d.data.StartFrame=self:GetAnimationIndex()end):SetImage("icon16/control_play_blue.png")else T:AddOption(c"unset start",function()self:SetStart(false)d.data.StartFrame=nil end):SetImage("icon16/control_play.png")end;T:AddOption(c"reverse",function()local ao=d.data.FrameData[self:GetAnimationIndex()-1]if!ao then ao=d.data.FrameData[#d.data.FrameData]end;local ai=ao.BoneInfo;for v,t in pairs(ai)do self:GetData().BoneInfo[v]=table.Copy(self:GetData().BoneInfo[v]||{})self:GetData().BoneInfo[v].MU=t.MU*-1;self:GetData().BoneInfo[v].MR=t.MR*-1;self:GetData().BoneInfo[v].MF=t.MF*-1;self:GetData().BoneInfo[v].RU=t.RU*-1;self:GetData().BoneInfo[v].RR=t.RR*-1;self:GetData().BoneInfo[v].RF=t.RF*-1 end;d.UpdateFrameData()end):SetImage("icon16/control_rewind_blue.png")T:AddOption(c"duplicate to end",function()local w=d.frame:AddKeyFrame()local ai=self:GetData().BoneInfo;for v,t in pairs(ai)do local q=w:GetData()q.BoneInfo[v]=table.Copy(self:GetData().BoneInfo[v]||{})q.BoneInfo[v].MU=t.MU;q.BoneInfo[v].MR=t.MR;q.BoneInfo[v].MF=t.MF;q.BoneInfo[v].RU=t.RU;q.BoneInfo[v].RR=t.RR;q.BoneInfo[v].RF=t.RF end;w:SetLength(1/self:GetData().FrameRate)d.SelectKeyframe(w)end):SetImage("icon16/application_double.png")T:AddOption(c"remove",function()local ap=self:GetAnimationIndex()if ap==1&&!d.data.FrameData[2]then return end;table.remove(d.data.FrameData,ap)local aq;for v,t in pairs(d.frame.keyframe_scroll:GetCanvas():GetChildren())do if t==self then aq=v elseif t:GetAnimationIndex()>ap then t.AnimationKeyIndex=t.AnimationKeyIndex-1;t.Alternate=!t.Alternate end end;table.remove(d.frame.keyframe_scroll:GetCanvas():GetChildren(),aq)d.frame.keyframe_scroll:InvalidateLayout()self:Remove()local ar=#d.frame.keyframe_scroll:GetCanvas():GetChildren()local X=ap==ar&&ar-1||ar;d.SelectKeyframe(d.frame.keyframe_scroll:GetCanvas():GetChildren()[X])end):SetImage("icon16/application_delete.png")T:AddOption(c"set easing style",function()if d.data.Interpolation!="linear"then local ao=vgui.Create("DFrame")ao:SetSize(300,100)ao:Center()ao:SetTitle("Easing styles work only with the linear interpolation type!")ao:ShowCloseButton(false)local as=vgui.Create("DButton",ao)as:SetText("Okay")as:Dock(FILL)as.DoClick=function()ao:Close()end;ao:MakePopup()return end;local ap=self:GetAnimationIndex()local ao=vgui.Create("DFrame")ao:SetSize(200,100)ao:Center()ao:SetTitle("Select easing type")ao:MakePopup()local at=vgui.Create("DComboBox",ao)at:SetPos(5,30)at:Dock(FILL)at:SetValue("None")for au,M in pairs(b)do at:AddChoice(au)end;at.OnSelect=function(av,i,z)self:SetEaseStyle(z)ao:Close()end end):SetImage("icon16/arrow_turn_right.png")if self:GetEaseStyle()then T:AddOption(c"unset easing style",function()self:RemoveEaseStyle()end):SetImage("icon16/arrow_up.png")end;T:Open()end end;function ag:SetLength(aw)if!aw then return end;self:GetParent():GetParent():InvalidateLayout()self:GetData().FrameRate=1/math.max(aw,0.001)end;function ag:GetEaseStyle()return self.estyle end;function ag:SetEaseStyle(ax)if!ax then return end;self:GetData().EaseStyle=ax;self.estyle=ax end;function ag:RemoveEaseStyle()self:GetData().EaseStyle=nil;self.estyle=nil end;vgui.Register("pac3_timeline_keyframe",ag,"DPanel")end
--addons/!lpakr_out/lua/pac3/editor/client/wires.lua:
local function a(b,c,d,e,f)local g=f*f;local h=g*f;return(2*h-3*g+1)*b+(h-2*g+f)*d+(-2*h+3*g)*c+(h-g)*e end;local i={}for j=1,100 do i[#i+1]={Vector(0,0,0),Color(0,0,0,0)}end;local k=math.sqrt;local l=math.abs;local m=math.max;local n=math.min;local o=math.cos;local p=math.pi;local q=Color(0,0,0,100)local r=Vector(0,2.5,0)local s=FindMetaTable("Vector")local t=getmetatable(q)local u=render.StartBeam;local v=render.EndBeam;local w=render.AddBeam;local x=s.SetUnpacked;local y=t.SetUnpacked;local z=t.Unpack;local function A(B,C,D,E,F,G,H,I,J)local K,L,M,N=z(G)local O,P,Q,R=z(H)I=I||1;B=B||5;local J=20;local S=i;J=J||20;local T=-(E-C)local U=F-D;local V=k(m(T*T,8000),U*U)*1.5;V=m(V,l(U))V=n(V,1000)V=V*1.25/(-U/300)x(S[1][1],C,D,0)S[1][2]=G;for j=1,J do local f=j/J;f=1-(.5+o(f*p)*.5)local W=a(C,E,T>=0&&V||-V,V,f)local X=a(D,F,0,0,f)x(S[j+1][1],W,X,0)y(S[j+1][2],Lerp(f,K,O),Lerp(f,L,P),Lerp(f,M,Q),N*I)end;render.PushFilterMag(TEXFILTER.LINEAR)render.PushFilterMin(TEXFILTER.LINEAR)u(J+1)for j=1,J+1 do w(S[j][1]+r,B,0.5,q)end;v()u(J+1)for j=1,J+1 do local Y=S[j][1]w(Y,B,(j/J*10000-0.5)%1,S[j][2])end;v()render.PopFilterMag()render.PopFilterMin()end;local function Z(W,X,_,a0,...)local a1={type="3D",x=0,y=0,w=_,h=a0,znear=-10000,zfar=10000,origin=Vector(W,X,-1000),angles=Angle(-90,0,90),ortho={left=0,right=_,top=-a0,bottom=0}}cam.Start(a1)A(...)cam.End(a1)end;local a2;hook.Add("PostRenderVGUI","beams",function()if!pace.IsActive()then return end;if!pace.IsFocused()then return end;local a3=pace.current_part;if!a3:IsValid()then return end;local a4=a3.pace_tree_node;if a3!=a2 then a3.cached_props=nil end;a3.cached_props=a3.cached_props||a3:GetProperties()local a5=a3.cached_props;a2=a3;for a6,a7 in ipairs(a5)do if a7.udata.part_key then local a8=a3;local a9=a3["Get"..a7.udata.part_key](a3)if!a9:IsValid()then continue end;local aa=a8.pace_properties&&a8.pace_properties[a7.key]||NULL;local ab=a9.pace_tree_node||NULL;if!aa:IsValid()then continue end;if!ab:IsValid()then continue end;local ac={}ac["$basetexture"]=a9.Icon||"gui/colors.png"ac["$vertexcolor"]=1;ac["$vertexalpha"]=1;ac["$nocull"]=1;local ad=ab:GetModel()if ad then ad="spawnicons/"..ad:sub(1,-5).."_32"ac["$basetexture"]=ad end;local ae=CreateMaterial("pac_wire_icon_"..ac["$basetexture"],"UnlitGeneric",ac)render.SetMaterial(ae)local af,ag=aa:LocalToScreen(aa:GetWide(),aa:GetTall()/2)local ah,ai=ab.Icon:LocalToScreen(0,ab.Icon:GetTall()/2)do local W,X=pace.tree:LocalToScreen(0,0)local _,a0=pace.tree:LocalToScreen(pace.tree:GetSize())ah=math.Clamp(ah,W,_)ai=math.Clamp(ai,X,a0)end;aa.wire_smooth_hover=aa.wire_smooth_hover||0;if aa:IsHovered()||a8.pace_tree_node&&a8.pace_tree_node:IsValid()&&a8.pace_tree_node.Label:IsHovered()then aa.wire_smooth_hover=aa.wire_smooth_hover+(5-aa.wire_smooth_hover)*FrameTime()*20 else aa.wire_smooth_hover=aa.wire_smooth_hover+(0-aa.wire_smooth_hover)*FrameTime()*20 end;aa.wire_smooth_hover=math.Clamp(aa.wire_smooth_hover,0,5)if aa.wire_smooth_hover>0.01 then Z(0,0,ScrW(),ScrH(),aa.wire_smooth_hover,af,ag,ah,ai,Color(255,255,255),Color(255,255,255,255),1)end end end end)
--addons/!lpakr_out/lua/autorun/pac_restart.lua:
return lpakr()()
--addons/!lpakr_out/lua/autorun/pac_restart.lua:
AddCSLuaFile()local a=GetConVar('sv_allowcslua')local b=CreateClientConVar("pac_restart_prefer_local_version","0")function _G.pac_ReloadParts()local c=_G.pac;local d,e=file.Find("addons/*","MOD")for d,f in ipairs(e)do if file.Exists("addons/"..f.."/lua/autorun/pac_editor_init.lua","MOD")then c.Message("found PAC3 in garrysmod/addons/"..f)local g=_G.include;local function include(h,...)local i=h;if!file.Exists("addons/"..f.."/lua/"..h,"MOD")then local j=debug.getinfo(2).source;local k=j:sub(2):match("(.+/)")if k:StartWith("addons/"..f)then k=k:match("addons/.-/lua/(.+)")end;i=k..h end;if file.Exists("addons/"..f.."/lua/"..i,"MOD")then local l=file.Read("addons/"..f.."/lua/"..i,"MOD")if l then local m=CompileString(l,"addons/"..f.."/lua/"..i)if isfunction(m)then local n={pcall(m,...)}if n[1]then return unpack(n,2)end;c.Message("pac_restart: pcall error: "..n[2])else c.Message("pac_restart: compile string error: "..m)end end end;return g(h,...)end;_G.include=include;local o,p=pcall(function()pac.LoadParts()end)_G.include=g;break end end end;function _G.pac_Restart()PAC_MDL_SALT=PAC_MDL_SALT+1;local q;local r={}local c=_G.pac;local s;local t;if pace then if pace.Editor&&pace.Editor:IsValid()then q=true;if pace.current_part&&pace.current_part:IsValid()then s=pace.current_part:GetUniqueID()end;for u,v in pairs(pac.GetLocalParts())do if!v:HasParent()&&v:GetShowInEditor()then local o,p=pcall(function()table.insert(r,v:ToTable())end)if!o then print(p)end end end end;if pace.model_browser&&pace.model_browser:IsValid()&&pace.model_browser:IsVisible()then t=true;pace.model_browser:Remove()end end;if pac&&pac.Disable then c.Message("removing all traces of pac3 from lua")pac.Disable()pac.Panic()if pace&&pace.Editor then q=pace.Editor:IsValid()pace.Panic()end;for d,w in pairs(ents.GetAll())do for x in pairs(w:GetTable())do if x:sub(0,4)=="pac_"then w[x]=nil end end end;for y,z in pairs(hook.GetTable())do for A,m in pairs(z)do if isstring(A)&&(A:StartWith("pace_")||A:StartWith("pac_")||A:StartWith("pac3_")||A:StartWith("pacx_"))then hook.Remove(y,A)end end end;timer.Remove("pac_gc")timer.Remove("pac_render_times")timer.Remove("urlobj_download_queue")_G.pac=nil;_G.pace=nil;_G.pacx=nil;collectgarbage()end;_G.PAC_RESTART=true;if!b:GetBool()then c.Message("pac_restart: not reloading from local version")for d,h in ipairs(file.Find("autorun/pac*","LUA"))do if h:EndsWith("_init.lua")&&h!="pac_init.lua"then include("autorun/"..h)end end elseif a:GetBool()||LocalPlayer():IsSuperAdmin()then local B=false;if a:GetBool()then c.Message("pac_restart: sv_allowcslua is on, looking for PAC3 addon..")end;if LocalPlayer():IsSuperAdmin()then c.Message("pac_restart: LocalPlayer() is superadmin, looking for PAC3 addon..")end;local d,e=file.Find("addons/*","MOD")for d,f in ipairs(e)do if file.Exists("addons/"..f.."/lua/autorun/pac_editor_init.lua","MOD")then c.Message("found PAC3 in garrysmod/addons/"..f)local g=_G.include;local function include(h,...)local i=h;if!file.Exists("addons/"..f.."/lua/"..h,"MOD")then local j=debug.getinfo(2).source;local k=j:sub(2):match("(.+/)")if k:StartWith("addons/"..f)then k=k:match("addons/.-/lua/(.+)")end;i=k..h end;if file.Exists("addons/"..f.."/lua/"..i,"MOD")then local l=file.Read("addons/"..f.."/lua/"..i,"MOD")if l then local m=CompileString(l,"addons/"..f.."/lua/"..i)if isfunction(m)then local n={pcall(m,...)}if n[1]then return unpack(n,2)end;c.Message("pac_restart: pcall error: "..n[2])else c.Message("pac_restart: compile string error: "..m)end end end;c.Message("pac_restart: couldn't include "..i.." reverting to normal include")return g(h,...)end;_G.include=include;for d,h in ipairs(file.Find("autorun/pac_*","LUA"))do if h:EndsWith("_init.lua")&&h!="pac_init.lua"then c.Message("pac_restart: including autorun/"..h.."...")local o,p=pcall(function()include("autorun/"..h)end)if!o then c.Message("pac_restart: error when reloading pac "..p)end end end;_G.include=g;B=true;break end end;if!B then c.Message("sv_allowcslua is not enabled or unable to find PAC3 in addons/, loading PAC3 again from server lua")for d,h in ipairs(file.Find("autorun/pac*","LUA"))do if h:EndsWith("_init.lua")&&h!="pac_init.lua"then include("autorun/"..h)end end end end;_G.PAC_RESTART=nil;if q then pace.OpenEditor()end;pac.Enable()if r[1]then pace.LoadPartsFromTable(r,true)end;c.Message("pac_restart: done")if s then local v=pac.GetPartFromUniqueID(pac.Hash(pac.LocalPlayer),s)if v&&v:IsValid()then pace.Call("PartSelected",v)end end;if t then RunConsoleCommand("pac_asset_browser")end;local C="*•.¸♥¸.•* IF YOU ARE USING PAC_RESTART TO FIX A BUG IT WOULD BE NICE IF YOU COULD ALSO REPORT THE BUG *•.¸♥¸.•*"local D=C:Split(" ")for E=1,40 do for F,G in ipairs(D)do local H=F/#D;MsgC(HSVToColor(Lerp(H,0,360),0.6,1),G," ")end;MsgN("")end;MsgC(Color(79,155,245),"https://github.com/CapsAdmin/pac3/issues","\n")MsgC(Color(79,155,245),"https://discord.com/invite/utpR3gJ","\n")MsgC(Color(79,155,245),"https://steamcommunity.com/sharedfiles/filedetails/?id=104691717","\n")MsgC(Color(79,155,245),"https://steamcommunity.com/id/eliashogstvedt","\n")end
--addons/!lpakr_out/lua/autorun/prone_init.lua:
prone=prone||{}prone.animations=prone.animations||{}prone.config=prone.config||{}prone.Version=20170505;PRONE_GETTINGDOWN=0;PRONE_INPRONE=1;PRONE_GETTINGUP=2;PRONE_NOTINPRONE=3;PRONE_IMPULSE=127;prone.AddonCompatibility=true;function prone.WritePlayer(a)if IsValid(a)then net.WriteUInt(a:EntIndex(),7)else net.WriteUInt(0,7)end end;function prone.ReadPlayer()local b=net.ReadUInt(7)if!b then return end;return Entity(b)end;hook.Add("Initialize","prone.Initialize",function()if SERVER then else include("prone/config.lua")include("prone/sh_prone.lua")include("prone/cl_prone.lua")end;hook.Call("prone.Initialized")end)if CLIENT then hook.Add("PopulateToolMenu","prone.SandboxOptionsMenu",function()spawnmenu.AddToolMenuOption("Utilities","User","prone_options","Prone Options","","",function(c)c:SetName("Prone Mod")c:AddControl("Header",{Text="",Description="Configuration menu for the Prone Mod."})c:AddControl("Checkbox",{Label="Enable the bind key",Command="prone_bindkey_enabled"})c:AddControl("Checkbox",{Label="Double-tap the bind key",Command="prone_bindkey_doubletap"})c:AddControl("Checkbox",{Label="Can press jump to get up",Command="prone_jumptogetup"})c:AddControl("Checkbox",{Label="Double-tap jump to get up",Command="prone_jumptogetup"})c:AddControl("Numpad",{Label="Set the Bind-Key",Command="prone_bindkey_key"})end)end)end
--addons/!lpakr_out/lua/casino/objects_sh.lua:
return lpakr()()
--addons/!lpakr_out/lua/chess/ui/cl_chesspromotion.lua:
local a={}function a:Init()self:SetTitle'Promotion'self:SetSize(150,180)self:Center()self:ShowCloseButton(false)self:MakePopup()for b,c in ipairs(Chess.Promotions)do self:AddPromotion(b,c)end end;function a:Populate(d)self.File=d end;function a:AddPromotion(b,c)ui.Create('ui_button',function(e)e:SetText(c)e:Dock(TOP)e:DockMargin(4,4,4,4)e.DoClick=function(f)self:Promote(b)end end,self)end;function a:Promote(b)net.Start'Chess.PromotionSelection'net.WriteUInt(b,3)net.WriteUInt(self.File,5)net.SendToServer()self:Remove()end;vgui.Register('ui_chesspromotion',a,'ui_frame')
--addons/!lpakr_out/lua/wos/anim_extension/core/sh_holdtypes.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/wirenet.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/gates/angle.lua:
GateActions("Angle")GateActions["angle_add"]={name="Addition",inputs={"A","B","C","D","E","F","G","H"},inputtypes={"ANGLE","ANGLE","ANGLE","ANGLE","ANGLE","ANGLE","ANGLE","ANGLE"},compact_inputs=2,outputtypes={"ANGLE"},output=function(a,b,c,d,e,f,g,h,i)if!b then b=Angle(0,0,0)end;if!c then c=Angle(0,0,0)end;if!d then d=Angle(0,0,0)end;if!e then e=Angle(0,0,0)end;if!f then f=Angle(0,0,0)end;if!g then g=Angle(0,0,0)end;if!h then h=Angle(0,0,0)end;if!i then i=Angle(0,0,0)end;return b+c+d+e+f+g+h+i end,label=function(j)return string.format("Addition = (%d,%d,%d)",j.p,j.y,j.r)end}GateActions["angle_sub"]={name="Subtraction",inputs={"A","B"},inputtypes={"ANGLE","ANGLE"},outputtypes={"ANGLE"},output=function(a,b,c)if!b then b=Angle(0,0,0)end;if!c then c=Angle(0,0,0)end;return b-c end,label=function(j,b,c)return string.format("%s - %s = (%d,%d,%d)",b,c,j.p,j.y,j.r)end}GateActions["angle_neg"]={name="Negate",inputs={"A"},inputtypes={"ANGLE"},outputtypes={"ANGLE"},output=function(a,b)if!b then b=Angle(0,0,0)end;return Angle(-b.p,-b.y,-b.r)end,label=function(j,b)return string.format("-%s = (%d,%d,%d)",b,j.p,j.y,j.r)end}GateActions["angle_mul"]={name="Multiplication",inputs={"A","B"},inputtypes={"ANGLE","ANGLE"},outputtypes={"ANGLE"},output=function(a,b,c)if!b then b=Angle(0,0,0)end;if!c then c=Angle(0,0,0)end;return Angle(b.p*c.p,b.y*c.y,b.r*c.r)end,label=function(j,b,c)return string.format("%s * %s = (%d,%d,%d)",b,c,j.p,j.y,j.r)end}GateActions["angle_derive"]={name="Delta",description="Outputs the rate of change of the angle.",inputs={"A"},inputtypes={"ANGLE"},outputtypes={"ANGLE"},timed=true,output=function(a,b)local k=CurTime()if!b then b=Angle(0,0,0)end;local l,m=k-a.LastT,b-a.LastA;a.LastT,a.LastA=k,b;if l then return Angle(m.p/l,m.y/l,m.r/l)else return Angle(0,0,0)end end,reset=function(a)a.LastT,a.LastA=CurTime(),Angle(0,0,0)end,label=function(j,b)return string.format("diff(%s) = (%d,%d,%d)",b,j.p,j.y,j.r)end}GateActions["angle_divide"]={name="Division",inputs={"A","B"},inputtypes={"ANGLE","ANGLE"},outputtypes={"ANGLE"},output=function(a,b,c)if!b then b=Angle(0,0,0)end;if!c||c==Angle(0,0,0)then c=Angle(0,0,0)return c end;return Angle(b.p/c.p,b.y/c.y,b.r/c.r)end,label=function(j,b,c)return string.format("%s / %s = (%d,%d,%d)",b,c,j.p,j.y,j.r)end}GateActions["angle_convto"]={name="Compose",description="Combines three numbers into an angle.",inputs={"Pitch","Yaw","Roll"},inputtypes={"NORMAL","NORMAL","NORMAL"},outputtypes={"ANGLE"},output=function(a,n,o,p)return Angle(n,o,p)end,label=function(j,n,o,p)return string.format("angle(%s,%s,%s) = (%d,%d,%d)",n,o,p,j.p,j.y,j.r)end}GateActions["angle_convfrom"]={name="Decompose",description="Splits an angle into three numbers.",inputs={"A"},inputtypes={"ANGLE"},outputs={"Pitch","Yaw","Roll"},output=function(a,b)if b then return b.p,b.y,b.r end;return 0,0,0 end,label=function(j,b)return string.format("%s -> Pitch:%d Yaw:%d Roll:%d",b,j.Pitch,j.Yaw,j.Roll)end}GateActions["angle_ident"]={name="Identity",inputs={"A"},inputtypes={"ANGLE"},outputtypes={"ANGLE"},output=function(a,b)if!b then b=Angle(0,0,0)end;return b end,label=function(j,b)return string.format("%s = (%d,%d,%d)",b,j.p,j.y,j.r)end}GateActions["angle_shiftl"]={name="Shift Components Left",inputs={"A"},inputtypes={"ANGLE"},outputtypes={"ANGLE"},output=function(a,b)if!b then b=Angle(0,0,0)end;return Angle(b.y,b.r,b.p)end,label=function(j,b)return string.format("shiftL(%s) = (%d,%d,%d)",b,j.p,j.y,j.r)end}GateActions["angle_shiftr"]={name="Shift Components Right",inputs={"A"},inputtypes={"ANGLE"},outputtypes={"ANGLE"},output=function(a,b)if!b then b=Angle(0,0,0)end;return Angle(b.r,b.p,b.y)end,label=function(j,b)return string.format("shiftR(%s) = (%d,%d,%d)",b,j.p,j.y,j.r)end}GateActions["angle_fruvecs"]={name="Direction - (forward, up, right)",inputs={"A"},inputtypes={"ANGLE"},outputs={"Forward","Up","Right"},outputtypes={"VECTOR","VECTOR","VECTOR"},timed=true,output=function(a,b)if!b then return Vector(0,0,0),Vector(0,0,0),Vector(0,0,0)else return b:Forward(),b:Up(),b:Right()end end,label=function(j)return string.format("Forward = (%f , %f , %f)\nUp = (%f , %f , %f)\nRight = (%f , %f , %f)",j.Forward.x,j.Forward.y,j.Forward.z,j.Up.x,j.Up.y,j.Up.z,j.Right.x,j.Right.y,j.Right.z)end}GateActions["angle_norm"]={name="Normalize",description="Makes the angle fit within +/-180 degrees.",inputs={"A"},inputtypes={"ANGLE"},outputtypes={"ANGLE"},output=function(a,b)if!b then b=Angle(0,0,0)end;return Angle(math.NormalizeAngle(b.p),math.NormalizeAngle(b.y),math.NormalizeAngle(b.r))end,label=function(j,b)return string.format("normalize(%s) = (%d,%d,%d)",b,j.p,j.y,j.r)end}GateActions["angle_tostr"]={name="To String",inputs={"A"},inputtypes={"ANGLE"},outputtypes={"STRING"},output=function(a,b)if!b then b=Angle(0,0,0)end;return"["..tostring(b.p)..","..tostring(b.y)..","..tostring(b.r).."]"end,label=function(j,b)return string.format("toString(%s) = \""..j.."\"",b)end}GateActions["angle_compeq"]={name="Equal",inputs={"A","B"},inputtypes={"ANGLE","ANGLE"},outputtypes={"NORMAL"},output=function(a,b,c)if b==c then return 1 end;return 0 end,label=function(j,b,c)return string.format("(%s == %s) = %d",b,c,j)end}GateActions["angle_compineq"]={name="Not Equal",inputs={"A","B"},inputtypes={"ANGLE","ANGLE"},outputtypes={"NORMAL"},output=function(a,b,c)if b==c then return 0 end;return 1 end,label=function(j,b,c)return string.format("(%s != %s) = %d",b,c,j)end}GateActions["angle_round"]={name="Round",inputs={"A"},inputtypes={"ANGLE"},outputtypes={"ANGLE"},output=function(a,b)if!b then b=Angle(0,0,0)end;return Angle(math.Round(b.p),math.Round(b.y),math.Round(b.r))end,label=function(j,b)return string.format("round(%s) = (%d,%d,%d)",b,j.p,j.y,j.r)end}GateActions["angle_select"]={name="Select",inputs={"Choice","A","B","C","D","E","F","G","H"},inputtypes={"NORMAL","ANGLE","ANGLE","ANGLE","ANGLE","ANGLE","ANGLE","ANGLE","ANGLE"},outputtypes={"ANGLE"},output=function(a,q,...)q=math.Clamp(q,1,8)return({...})[q]end,label=function(j,q)return string.format("select(%s) = %s",q,j)end}GateActions["angle_mulcomp"]={name="Multiplication (component)",inputs={"A","B"},inputtypes={"ANGLE","NORMAL"},outputtypes={"ANGLE"},output=function(a,b,c)if!b then b=Angle(0,0,0)end;if!c then c=0 end;return Angle(b.p*c,b.y*c,b.r*c)end,label=function(j,b,c)return string.format("%s * %s = "..tostring(j),b,c)end}GateActions["angle_clampn"]={name="Clamp (numbers)",inputs={"A","Min","Max"},inputtypes={"ANGLE","NORMAL","NORMAL"},outputtypes={"ANGLE"},output=function(a,b,r,s)if r>s then r,s=s,r end;return Angle(math.Clamp(b.p,r,s),math.Clamp(b.y,r,s),math.Clamp(b.r,r,s))end,label=function(j,b,r,s)return"Clamp("..b..","..r..","..s..") = "..tostring(j)end}GateActions["angle_clampa"]={name="Clamp (angles)",inputs={"A","Min","Max"},inputtypes={"ANGLE","ANGLE","ANGLE"},outputtypes={"ANGLE"},output=function(a,b,r,s)if r.p>s.p then r.p,s.p=s.p,r.p end;if r.y>s.y then r.y,s.y=s.y,r.y end;if r.r>s.r then r.r,s.r=s.r,r.r end;return Angle(math.Clamp(b.p,r.p,s.p),math.Clamp(b.y,r.y,s.y),math.Clamp(b.r,r.r,s.r))end,label=function(j,b,r,s)return"Clamp("..b..","..r..","..s..") = "..tostring(j)end}GateActions()
--addons/!lpakr_out/lua/wire/gates/time.lua:
GateActions("Time")GateActions["accumulator"]={name="Accumulator",description="Counts time while A is set and Hold is not set.",inputs={"A","Hold","Reset"},timed=true,output=function(a,b,c,d)local e=CurTime()-(a.PrevTime||CurTime())a.PrevTime=(a.PrevTime||CurTime())+e;if d>0 then a.Accum=0 elseif c<=0 then a.Accum=a.Accum+b*e end;return a.Accum||0 end,reset=function(a)a.PrevTime=CurTime()a.Accum=0 end,label=function(f,b,c,d)return"A:"..b.." Hold:"..c.." Reset:"..d.." = "..f end}GateActions["smoother"]={name="Smoother",description="Smooths the change in a number.",inputs={"A","Rate"},timed=true,output=function(a,b,g)local e=CurTime()-(a.PrevTime||CurTime())a.PrevTime=(a.PrevTime||CurTime())+e;local h=b-a.Accum;if h>0 then a.Accum=a.Accum+math.min(h,g*e)elseif h<0 then a.Accum=a.Accum+math.max(h,-g*e)end;return a.Accum||0 end,reset=function(a)a.PrevTime=CurTime()a.Accum=0 end,label=function(f,b,g)return"A:"..b.." Rate:"..g.." = "..f end}GateActions["timer"]={name="Timer",description="Counts time upward while Run is set.",inputs={"Run","Reset"},timed=true,output=function(a,i,d)local e=CurTime()-(a.PrevTime||CurTime())a.PrevTime=(a.PrevTime||CurTime())+e;if d>0 then a.Accum=0 elseif i>0 then a.Accum=a.Accum+e end;return a.Accum||0 end,reset=function(a)a.PrevTime=CurTime()a.Accum=0 end,label=function(f,i,d)return"Run:"..i.." Reset:"..d.." = "..f end}GateActions["ostime"]={name="OS Time",description="Outputs the time of day on the server in seconds.",inputs={},timed=true,output=function(a)return os.date("%H")*3600+os.date("%M")*60+os.date("%S")end,label=function(f)return"OS Time = "..f end}GateActions["osdate"]={name="OS Date",description="Outputs the date on the server in days.",inputs={},timed=true,output=function(a)return os.date("%Y")*366+os.date("%j")end,label=function(f)return"OS Date = "..f end}GateActions["pulser"]={name="Pulser",description="Activates for one tick every TickTime while Run is set.",inputs={"Run","Reset","TickTime"},timed=true,output=function(a,i,d,j)local e=CurTime()-(a.PrevTime||CurTime())a.PrevTime=(a.PrevTime||CurTime())+e;if d>0 then a.Accum=0 elseif i>0 then a.Accum=a.Accum+e;if a.Accum>=j then a.Accum=a.Accum-j;return 1 end end;return 0 end,reset=function(a)a.PrevTime=CurTime()a.Accum=0 end,label=function(f,i,d,j)return"Run:"..i.." Reset:"..d.."TickTime:"..j.." = "..f end}GateActions["squarepulse"]={name="Square Pulse",description="Outputs Max during the PulseTime, Min during the GapTime, while Run is set.",inputs={"Run","Reset","PulseTime","GapTime","Min","Max"},timed=true,output=function(a,i,d,k,l,m,n)local e=CurTime()-(a.PrevTime||CurTime())a.PrevTime=(a.PrevTime||CurTime())+e;if d>0 then a.Accum=0 elseif i>0 then a.Accum=a.Accum+e;if a.Accum<=k then return n end;if a.Accum>=k+l then a.Accum=0 end end;return m end,reset=function(a)a.PrevTime=CurTime()a.Accum=0 end,label=function(f,i,d,k,l)return"Run:"..i.." Reset:"..d.." PulseTime:"..k.." GapTime:"..l.." = "..f end}GateActions["sawpulse"]={name="Saw Pulse",description="Outputs a value that linearly increases to Max and decreases to Min while Run is set.",inputs={"Run","Reset","SlopeRaiseTime","PulseTime","SlopeDescendTime","GapTime","Min","Max"},timed=true,output=function(a,i,d,o,k,p,l,m,n)local e=CurTime()-(a.PrevTime||CurTime())a.PrevTime=(a.PrevTime||CurTime())+e;if d>0 then a.Accum=0;return m end;if i<=0 then return m end;o=math.max(o,0)k=math.max(k,0)p=math.max(p,0)l=math.max(l,0)a.Accum=(a.Accum+e)%(o+k+p+l)if a.Accum<o then return m+(n-m)*a.Accum/o elseif a.Accum<o+k then return n elseif a.Accum<o+k+p then return n+(m-n)*(a.Accum-o-k)/p else return m end end,reset=function(a)a.PrevTime=CurTime()a.Accum=0 end,label=function(f,i,d,k,l)return"Run:"..i.." Reset:"..d.." PulseTime:"..k.." GapTime:"..l.." = "..f end}GateActions["derive"]={name="Derivative",description="Outputs the rate of change (derivative) of the number.",inputs={"A"},timed=false,output=function(a,b)local q=CurTime()local r=q-a.LastT;a.LastT=q;local s=b-a.LastA;a.LastA=b;if r!=0 then return s/r else return 0 end end,reset=function(a)a.LastT=CurTime()a.LastA=0 end,label=function(f,b)return"d/dt["..b.."] = "..f end}GateActions["delay"]={name="Delay",description="Holds an output of 1 for Hold seconds after Delay seconds on Clk.",inputs={"Clk","Delay","Hold","Reset"},outputs={"Out","TimeElapsed","Remaining"},timed=true,output=function(a,t,u,c,d)local e=CurTime()-(a.PrevTime||CurTime())a.PrevTime=(a.PrevTime||CurTime())+e;local v=0;if d>0 then a.Stage=0;a.Accum=0 end;if a.Stage==1 then if a.Accum>=u then a.Stage=2;a.Accum=0;v=1 else a.Accum=a.Accum+e end elseif a.Stage==2 then if a.Accum>=c then a.Stage=0;a.Accum=0;v=0 else v=1;a.Accum=a.Accum+e end else if t>0 then a.Stage=1;a.Accum=0 end end;return v,a.Accum,u-a.Accum end,reset=function(a)a.PrevTime=CurTime()a.Accum=0;a.Stage=0 end,label=function(f,t,u,c,d)return"Clk: "..t.." Delay: "..u.."\nHold: "..c.." Reset: "..d.."\nTime Elapsed: "..f.TimeElapsed.." = "..f.Out end}GateActions["monostable"]={name="Monostable Timer",description="Outputs 1 for Time duration and resets to 0 for a tick in between.",inputs={"Run","Time","Reset"},timed=true,output=function(a,i,w,d)local e=CurTime()-(a.PrevTime||CurTime())a.PrevTime=(a.PrevTime||CurTime())+e;if d>0 then a.Accum=0 elseif a.Accum>0||i>0 then a.Accum=a.Accum+e;if a.Accum>w then a.Accum=0 end end;if a.Accum>0 then return 1 else return 0 end end,reset=function(a)a.PrevTime=CurTime()a.Accum=0 end,label=function(f,i,w,d)return"Run:"..i.." Time:"..w.." Reset:"..d.." = "..f end}GateActions()
--addons/!lpakr_out/lua/wire/timedpairs.lua:
if!WireLib then return end;local next=next;local pairs=pairs;local unpack=unpack;local pcall=pcall;local a={}function WireLib.TimedpairsGetTable()return a end;function WireLib.TimedpairsStop(b)a[b]=nil end;local function c(d)local e={}for f,g in pairs(d)do e[#e+1]={key=f,value=g}end;return e end;local function h()if!next(a)then return end;local i={}for b,j in pairs(a)do for k=1,j.step do j.currentindex=j.currentindex+1;local l=j.lookup||{}if j.currentindex<=#l then local m=l[j.currentindex]||{}local n,o=xpcall(j.callback,debug.traceback,m.key,m.value,unpack(j.args))if!n then WireLib.ErrorNoHalt("Error in Timedpairs '"..b.."': "..o)i[#i+1]=b;break elseif o==false then i[#i+1]=b;break end else if j.endcallback then local m=l[j.currentindex-1]||{}local n,o=xpcall(j.endcallback,debug.traceback,m.key,m.value,unpack(j.args))if!n then WireLib.ErrorNoHalt("Error in Timedpairs '"..b.."' (in end function): "..o)end end;i[#i+1]=b;break end end end;for k=1,#i do a[i[k]]=nil end end;if CLIENT then hook.Add("PostRenderVGUI","WireLib_Timedpairs",h)else hook.Add("Think","WireLib_Timedpairs",h)end;function WireLib.Timedpairs(b,p,q,r,s,...)a[b]={lookup=c(p),step=q,currentindex=0,callback=r,endcallback=s,args={...}}end;function WireLib.Timedcall(r,...)local t={true}WireLib.Timedpairs("Timedcall_"..tostring(t),t,1,function(f,g,...)r(...)end,nil,...)end
--addons/!lpakr_out/lua/wire/flir.lua:
if!FLIR then FLIR={enabled=false}end;FLIR.RenderStack={}FLIR.enabled=false;FLIR.gcvar=CreateClientConVar("wire_flir_gain",2.2,true,false,"Brightness of FLIR ents. Higher = less detail, more visible.",0,10)cvars.AddChangeCallback("wire_flir_gain",function(a,a,b)FLIR.gain=b end)FLIR.gain=FLIR.gcvar:GetInt()FLIR.mat=Material("phoenix_storms/concrete0")FLIR.transmat=Material("phoenix_storms/iron_rails")FLIR.hide=false;function FLIR.Render(self)if!FLIR.hide then if self.BackupRenderOverride then self:BackupRenderOverride()end;self:DrawModel()return end end;FLIR.mapcol={["$pp_colour_brightness"]=0.5,["$pp_colour_contrast"]=0.4}FLIR.skycol={["$pp_colour_contrast"]=0.2,["$pp_colour_brightness"]=1}FLIR.desat={["$pp_colour_colour"]=0,["$pp_colour_contrast"]=1,["$pp_colour_brightness"]=0}FLIR.classWhitelist={["prop_physics"]=true,["sent_prop2mesh"]=true,["base_anim"]=true}local function c(d)FLIR.RenderStack[d]=nil;if d:IsValid()then d.RenderOverride=d.BackupRenderOverride;d.BackupRenderOverride=nil end end;local function e(d)if!d:IsValid()then return end;local f=d:GetClass()if d:GetColor().a>0&&(FLIR.classWhitelist[f]||d:GetMoveType()==MOVETYPE_VPHYSICS||d:IsPlayer()||d:IsNPC()||d:IsRagdoll())then FLIR.RenderStack[d]=true;d.BackupRenderOverride=d.RenderOverride;d.RenderOverride=FLIR.Render end end;function FLIR.start()if FLIR.enabled then return else FLIR.enabled=true end;for a,b in ipairs(ents.GetAll())do e(b)end;hook.Add("PreRender","wire_flir",function()render.SetLightingMode(2)FLIR.hide=true end)hook.Add("PostDraw2DSkyBox","wire_flir",function()DrawColorModify(FLIR.skycol)end)hook.Add("PostDrawOpaqueRenderables","wire_flir",function(a,a,g)if g then return end;DrawColorModify(FLIR.mapcol)render.MaterialOverride(FLIR.mat)render.SuppressEngineLighting(true)render.SetColorModulation(FLIR.gain,FLIR.gain,FLIR.gain)for d,h in pairs(FLIR.RenderStack)do if h&&d:IsValid()&&!d:GetNoDraw()then FLIR.hide=false;d:DrawModel()FLIR.hide=true else c(d)end end;render.SuppressEngineLighting(false)render.MaterialOverride(FLIR.transmat)end)hook.Add("PostDrawTranslucentRenderables","wire_flir",function()render.SuppressEngineLighting(false)render.MaterialOverride(nil)end)hook.Add("RenderScreenspaceEffects","wire_flir",function()DrawColorModify(FLIR.desat)DrawBloom(0.5,1.0,2,2,2,1,1,1,1)DrawBokehDOF(1,0.1,0.1)render.SetLightingMode(0)end)hook.Add("OnEntityCreated","wire_flir",function(d)if FLIR.enabled then e(d)end end)hook.Add("CreateClientsideRagdoll","wire_flir",function(a,i)if FLIR.enabled then e(i)end end)end;function FLIR.stop()if FLIR.enabled then FLIR.enabled=false else return end;render.SetLightingMode(0)hook.Remove("PostDrawOpaqueRenderables","wire_flir")hook.Remove("PostDrawTranslucentRenderables","wire_flir")hook.Remove("RenderScreenspaceEffects","wire_flir")hook.Remove("PostDraw2DSkyBox","wire_flir")hook.Remove("PreRender","wire_flir")hook.Remove("OnEntityCreated","wire_flir")hook.Remove("CreateClientsideRagdoll","wire_flir")for a,b in ipairs(ents.GetAll())do c(b)end end;function FLIR.toggle()if!FLIR.enabled then FLIR.start()else FLIR.stop()end end;concommand.Add("flir_toggle",function()FLIR.toggle()end)function FLIR.enable(j)if j then FLIR.start()else FLIR.stop()end end;net.Receive("FLIR.enable",function()local j=net.ReadBool()FLIR.enable(j)end)
--addons/!lpakr_out/lua/wire/von.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/cl_modelplug.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/wiredermaexts.lua:
WireDermaExts={}language.Add("wire_model","Model:")function ModelPlug_AddToCPanel(a,b,c,d,e)local list=list.Get("Wire_"..b.."_Models")if table.Count(list)>1 then local f=vgui.Create("DWireModelSelect",a)f:SetModelList(list,c.."_model")f:SetHeight(e)a:AddPanel(f)end;if d&&GetConVarNumber("cl_showmodeltextbox")>0 then a:TextEntry("#wire_model",c.."_model")end end;function ModelPlug_AddToCPanel_Multi(a,g,c,d,e)local f=vgui.Create("DWireModelSelectMulti",a)f:SetHeight(e)a:AddPanel(f)local h=c.."_model"for b,i in pairs_sortkeys(g)do local list=list.Get("Wire_"..b.."_Models")if list then f:AddModelList(i,list,h)end end;if d&&GetConVarNumber("cl_showmodeltextbox")>0 then a:TextEntry(d,c.."_model")end end;function WireDermaExts.ModelSelect(a,j,list,e,k)if table.Count(list)>1 then local f=vgui.Create("DWireModelSelect",a)f:SetModelList(list,j)f:SetHeight(e)a:AddPanel(f)if k&&GetConVarNumber("cl_showmodeltextbox")>0 then a:TextEntry("#wire_model",j)end;return f end end;local l={}function l:Init()self:EnableVerticalScrollbar()self:SetTall(66*2+2)end;function l:SetHeight(e)self:SetTall(66*(e||2)+2)end;function l:SetModelList(list,h)for m,n in pairs(list)do local o=vgui.Create("SpawnIcon")o:SetModel(m)o.Model=m;o:SetSize(64,64)o:SetTooltip(m)self:AddPanel(o,{[h]=m})end;self:SortByMember("Model",false)end;derma.DefineControl("DWireModelSelect","",l,"DPanelSelect")local l={}function l:Init()self.ModelPanels={}self:SetTall(66*2+26)end;function l:SetHeight(e)self:SetTall(66*(e||2)+26)end;function l:AddModelList(p,list,h)local q=vgui.Create("DWireModelSelect",self)q:SetModelList(list,h)self:AddSheet(p,q)self.ModelPanels[p]=q end;derma.DefineControl("DWireModelSelectMulti","",l,"DPropertySheet")
--addons/!lpakr_out/lua/wire/client/wire_listeditor.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/client/customspawnmenu.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/robot-boy/cl_rb655_lightsaber.lua:
return lpakr()()
--addons/!lpakr_out/lua/wos/advswl/core/cl_net.lua:
wOS=wOS||{}net.Receive('wOS.SyncForm',function(a,b)local c=net.ReadEntity()if!c.IsLightsaber then return end;c.CurForm=net.ReadString()end)
--addons/!lpakr_out/lua/autorun/client/sit.lua:
AddCSLuaFile("lua/autorun/client/sit.lua")CreateClientConVar("sitting_disallow_on_me","0",true,true)local function a(b)if!ms then return end;if!ms.GetTheaterPlayers then return end;if!ms.GetTheaterPlayers()then return end;return ms.GetTheaterPlayers()[b]end;hook.Add("KeyPress","seats_use",function(b,c)if c!=IN_USE then return end;local d=b:KeyDown(IN_WALK)||a(b)if!d then return end;RunConsoleCommand("sit")end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/cl_init.lua:
srp=srp||{}include'info.lua'include'shared.lua'loader.Load('starwarsrp','CW Roleplay',[[
	- Custom gamemode made by Scott (STEAM_0:1:26675200)

	* Addon credits below. If you know your stuff is on here but no credits given, feel free to message me!
	- Wyozi Media Player Framework
	- Majority of air vehicles/speeders made by Blue with the LFS mod on Github
	- Lightsabers are a heavily optimised wOS addon
	- Witcher portal Addon
	- Particle Effect Tool
	- Improved tool series by [IJWTB] Thomas
	- KingPommes Ventor Models (WSID 1251088550)
	- Weapon & Armour Skin contributions:
		- Walker
		- Tobestar
]])local a=[[
<!DOCTYPE html>
<html>

<head>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Audiowide&display=swap');

		* {
			margin: 0;
			box-sizing: border-box;
			color: white;
		}

		.body-toggle {
			opacity: 1;
		}

		body {
			overflow: hidden;
			background: transparent;
			opacity: 0;
			transition: 1.5s;

			display: flex;
			justify-content: center;
			align-items: center;
			flex-wrap: wrap;
			min-height: 100vh;
		}

		.box {
			position: relative;
			background: #060c21;

			width: 800px;
			max-width: 800px;

			height: 600px;
			max-height: 600px;

			display: -webkit-flex;
			display: flex;

			-webkit-flex-direction: column;
			flex-direction: column;
			-webkit-flex-wrap: nowrap;
			flex-wrap: nowrap;
		}

		.box:before {
			content: "";
			position: absolute;
			top: -2px;
			left: -2px;
			right: -2px;
			bottom: -2px;
			background: #fff;
			z-index: -1;

		}

		.box:after {
			content: "";
			position: absolute;
			top: -2px;
			left: -2px;
			right: -2px;
			bottom: -2px;
			background: #fff;
			z-index: -2;
			filter: blur(40px);

		}

		.box:before,
		.box:after {
			background: linear-gradient(235deg, #2196f3, #051a5a, #c72f2f);
		}

		.box .title {
			-webkit-order: 0;
			order: 0;
			-webkit-flex: 1 1 auto;
			flex: 1 1 auto;
			-webkit-align-self: auto;
			align-self: auto;

			padding: 20px;

			display: block;
			font-size: 32px;
			color: #fff;
			font-weight: 500;

			display: flex;
			align-items: center;

			text-transform: uppercase;
			font-family: 'Audiowide', cursive;

			display: block;
		}

		.box .title span {
			font-size: 22px;
			color: #fff;
			font-weight: 200;
			display: block;
		}

		.box .content {
			-webkit-order: 0;
			order: 0;
			-webkit-flex: 9 1 auto;
			flex: 9 1 auto;
			padding: 20px;

			font-family: 'Roboto', cursive;
		}
	</style>
</head>

<body>
	<div class="box">
		<div class="title">
			What's new?<span> 2025.01.21</span>
		</div>

		<div class="content">
			{{NEWS_CONTENT}}
		</div>
	</div>

	<script>
		function makeOpaque() {
			let element = document.querySelector("body");
			element.classList.toggle("body-toggle");
		}

		makeOpaque();
	</script>
</body>

</html>
]]concommand.Add('newstest',function()srp.ui.Create('srp_panel',function(b)b:SetSize(ScrW(),ScrH())b:Center()b:MakePopup()b:DockPadding(1,1,1,1)b:SetBackgroundColor(col.transparent)b:SetBorderColor(col.transparent)b:AddPanel('HTML',function(c)c:SetHTML(a:Replace('{{NEWS_CONTENT}}',[[
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla non velit id felis rutrum accumsan. Aliquam
				erat volutpat. Morbi ut odio in purus consequat rutrum. Donec in justo eu nibh pulvinar tincidunt nec et
				ligula. Vivamus tristique eros sit amet tellus imperdiet, eget auctor nulla malesuada. Nullam elit nunc,
				mattis in finibus aliquet, accumsan vitae libero. In quam elit, consectetur in nulla vel, accumsan
				ullamcorper risus. Vestibulum quis dui et orci posuere placerat. Suspendisse vitae lectus eget turpis
				ullamcorper laoreet a eleifend elit. Suspendisse elementum augue sit amet velit sollicitudin, in scelerisque
				sem placerat. Praesent vitae efficitur tortor. Sed non libero ac lectus varius interdum. Orci varius natoque
				penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras viverra, lorem ultricies
				pellentesque pulvinar, nibh lorem bibendum arcu, vitae ultrices nisl odio in elit. Curabitur vel nisl
				feugiat, rutrum tellus ut, consectetur massa.
			]]))c:Dock(FILL)end)b:AddPanel('srp_button_rounded',function(d)d:SetText'CLOSE NEWS'd:SetWide(150)d:SetBackgroundColor(col.red_dark)d:SetHoverColor(col.red)d:SetPos(0,ScrH()*.8)d:CenterHorizontal()d:LeftClick(function(e)b:Remove()end)d.Think=function(e)e:MoveToFront()end end)end)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/entity_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/gma_cl.lua:
gma=gma||{}local function a(b)local c=''while true do local d=b:Read(1)if!d then return end;if!d||d=='\0'then break else c=c..d end end;return c end;function gma.ReadFile(e)local b=file.Open(e,'r','DATA')b:Seek(0)local f=b:Read(4)if f!='GMAD'then return end;local g=b:Read(1)local h=b:Read(8)local i=b:Read(8)b:Read(1)local j=a(b)local k=a(b)local l=a(b)b:Read(4)local m={ident=f,version=g,steamid=h,date=i,title=j,author=l,json=util.JSONToTable(k),files={}}local n=1;while!b:EndOfFile()&&b:ReadULong()!=0 do local o=a(b)b:Read(8)b:Read(4)m.files[n]=o;n=n+1 end;b:Close()return m end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/surface_cl.lua:
local a=Material'gui/gradient_up'local b=Material'gui/gradient_down'function surface.DrawTexturedRectRotatedPoint(c,d,e,f,g,h,i)local j=math.cos(math.rad(g))local k=math.sin(math.rad(g))local l=i*k-h*j;local m=i*j+h*k;surface.DrawTexturedRectRotated(c+l,d+m,e,f,g)end;function surface.DrawGradient(c,d,e,f)surface.SetMaterial(a)surface.DrawTexturedRect(c,d,e,f)end;function surface.DrawGradientDown(c,d,e,f)surface.SetMaterial(b)surface.DrawTexturedRect(c,d,e,f)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/extensions/vector_sh.lua:
function VECTOR:ClampLength(a)if self:LengthSqr()>a*a then self:Normalize()self:Mul(a)end end;function VECTOR.SmoothDamp(b,c,d,e,f,g)e=math.max(1e-4,e)f=f||math.huge;g=g||FrameTime()local h=2/e;local i=h*g;local j=f*e;local k=1/(1+i+0.48*i*i+0.235*i*i*i)local l=b-c;l:ClampLength(j)local m=b-l;local n=(d+l*h)*g;local o=m+(l+n)*k;d:Sub(n*h)d:Mul(k)if(c-b):Dot(o-c)>0 then o=c;d[1]=0;d[2]=0;d[3]=0 end;return o end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/spawnmenu_cl.lua:
local a=CreateConVar("spawnmenu_border","0.1",{FCVAR_ARCHIVE})local b={}function b:Init()self:Dock(FILL)self.HorizontalDivider=vgui.Create("DHorizontalDivider",self)self.HorizontalDivider:Dock(FILL)self.HorizontalDivider:SetLeftWidth(ScrW())self.HorizontalDivider:SetDividerWidth(6)self.HorizontalDivider:SetCookieName("SpawnMenuDiv")self.HorizontalDivider:SetRightMin(300)if ScrW()>=1024 then self.HorizontalDivider:SetRightMin(460)end;self.ToolMenu=vgui.Create("ToolMenu",self.HorizontalDivider)self.HorizontalDivider:SetRight(self.ToolMenu)self.CreateMenu=vgui.Create("CreationMenu",self.HorizontalDivider)self.HorizontalDivider:SetLeft(self.CreateMenu)self.m_bHangOpen=false;self:SetMouseInputEnabled(true)self.ToolToggle=vgui.Create("DImageButton",self)self.ToolToggle:SetMaterial("gui/spawnmenu_toggle")self.ToolToggle:SetSize(16,16)self.ToolToggle.DoClick=function()self.ToolMenu:SetVisible(!self.ToolMenu:IsVisible())self:InvalidateLayout()if self.ToolMenu:IsVisible()then self.ToolToggle:SetMaterial("gui/spawnmenu_toggle")self.CreateMenu:Dock(NODOCK)self.HorizontalDivider:SetRight(self.ToolMenu)self.HorizontalDivider:SetLeft(self.CreateMenu)else self.ToolToggle:SetMaterial("gui/spawnmenu_toggle_back")self.HorizontalDivider:SetRight(nil)self.HorizontalDivider:SetLeft(nil)self.CreateMenu:SetParent(self.HorizontalDivider)self.CreateMenu:Dock(FILL)end end end;function b:OpenCreationMenuTab(c)self.CreateMenu:SwitchToName(c)end;function b:GetToolMenu()return self.ToolMenu end;function b:OnMousePressed()self:Close()end;function b:HangOpen(d)self.m_bHangOpen=d end;function b:HangingOpen()return self.m_bHangOpen end;function b:Open()RestoreCursorPosition()self.m_bHangOpen=false;if IsValid(g_ContextMenu)&&g_ContextMenu:IsVisible()then g_ContextMenu:Close(true)end;if self:IsVisible()then return end;CloseDermaMenus()self:MakePopup()self:SetVisible(true)self:SetKeyboardInputEnabled(false)self:SetMouseInputEnabled(true)self:SetAlpha(255)achievements.SpawnMenuOpen()if IsValid(self.StartupTool)&&self.StartupTool.Name then self.StartupTool:SetSelected(true)spawnmenu.ActivateTool(self.StartupTool.Name,true)self.StartupTool=nil end end;function b:Close(e)if self.m_bHangOpen then self.m_bHangOpen=false;return end;RememberCursorPosition()CloseDermaMenus()self:SetKeyboardInputEnabled(false)self:SetMouseInputEnabled(false)self:SetVisible(false)end;function b:PerformLayout()local f=math.Clamp((ScrW()-1024)*a:GetFloat(),25,256)local g=math.Clamp((ScrH()-768)*a:GetFloat(),25,256)if ScrW()<1024||ScrH()<768 then f=0;g=0 end;self:DockPadding(0,0,0,0)self.HorizontalDivider:DockMargin(f,g,f,g)self.HorizontalDivider:SetLeftMin(self.HorizontalDivider:GetWide()/3)self.ToolToggle:AlignRight(6)self.ToolToggle:AlignTop(6)end;function b:StartKeyFocus(h)self.m_pKeyFocus=h;self:SetKeyboardInputEnabled(true)self:HangOpen(true)end;function b:EndKeyFocus(h)if self.m_pKeyFocus!=h then return end;self:SetKeyboardInputEnabled(false)end;vgui.Register("SpawnMenu",b,"EditablePanel")local function i()if IsValid(g_SpawnMenu)then g_SpawnMenu:Remove()g_SpawnMenu=nil end;spawnmenu.ClearToolMenus()hook.Run("AddGamemodeToolMenuTabs")hook.Run("AddToolMenuTabs")hook.Run("AddGamemodeToolMenuCategories")hook.Run("AddToolMenuCategories")hook.Run("PopulateToolMenu")g_SpawnMenu=vgui.Create("SpawnMenu")g_SpawnMenu:SetVisible(false)CreateContextMenu()hook.Run("PostReloadToolsMenu")end;hook("InitPostEntity","CreateSpawnMenu",i)concommand.Add("spawnmenu_reload",i)function GM:OnSpawnMenuOpen()if!hook.Call("SpawnMenuOpen",GAMEMODE)then return end;if IsValid(g_SpawnMenu)then g_SpawnMenu:Open()end end;function GM:OnSpawnMenuClose()if IsValid(g_SpawnMenu)then g_SpawnMenu:Close()end;if dragndrop.IsDragging()then gui.EnableScreenClicker(true)end end;local function j(k)if IsValid(g_SpawnMenu)&&IsValid(k)&&k:HasParent(g_SpawnMenu)then g_SpawnMenu:StartKeyFocus(k)end;if IsValid(g_ContextMenu)&&IsValid(k)&&k:HasParent(g_ContextMenu)then g_ContextMenu:StartKeyFocus(k)end end;hook("OnTextEntryGetFocus","SpawnMenuKeyboardFocusOn",j)local function l(k)if IsValid(g_SpawnMenu)&&IsValid(k)&&k:HasParent(g_SpawnMenu)then g_SpawnMenu:EndKeyFocus(k)end;if IsValid(g_ContextMenu)&&IsValid(k)&&k:HasParent(g_ContextMenu)then g_ContextMenu:EndKeyFocus(k)end end;hook("OnTextEntryLoseFocus","SpawnMenuKeyboardFocusOff",l)local function m()if!IsValid(g_SpawnMenu)then return end;if!g_SpawnMenu:IsVisible()then return end;return true end;hook("GUIMousePressed","SpawnMenuOpenGUIMousePressed",m)local function n()if!IsValid(g_SpawnMenu)then return end;if!g_SpawnMenu:IsVisible()then return end;g_SpawnMenu:Close()return true end;hook("GUIMouseReleased","SpawnMenuOpenGUIMouseReleased",n)hook.Add("SpawnMenuOpen","Spawnmenu.StaffOnly",function()return LocalPlayer():IsTrialGamemaster()||LocalPlayer():IsLiteGamemaster()&&LocalPlayer():InBuildZone()end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contentsidebar_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contentsidebartoolbox_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/postprocessicon_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/postprocessicon_cl.lua:
local a={}function a:Init()self:SetPaintBackground(false)self:SetSize(128,128)self:SetText("")end;function a:OnDepressionChanged(b)if IsValid(self.checkbox)then self.checkbox:SetVisible(!b)end end;function a:Setup(c,d,e)self.label=e;self.name=c;self.icon=d;self:SetMaterial(d)self:SetName(e||c)self.PP=list.Get("PostProcess")[c]if!self.PP then return end;self.DoClick=function()if self.PP.onclick then return self.PP.onclick()end;if!self.PP.cpanel then return end;if!IsValid(self.cp)then self.cp=vgui.Create("ControlPanel")self.cp:SetName(c)self.cp:FillViaFunction(self.PP.cpanel)end;spawnmenu.ActivateToolPanel(1,self.cp)end;if self.PP.convar then self.checkbox=self:Add("DCheckBox")self.checkbox:SetConVar(self.PP.convar)self.checkbox:SetSize(20,20)self.checkbox:SetPos(self:GetWide()-20-8,8)self.Enabled=function()return self.checkbox:GetChecked()end elseif self.ConVars then self.checkbox=self:Add("DCheckBox")self.checkbox:SetSize(20,20)self.checkbox:SetPos(self:GetWide()-20-8,8)self.checkbox.OnChange=function(f,g)for h,i in pairs(self.ConVars)do if g then RunConsoleCommand(h,i.on)else RunConsoleCommand(h,i.off||"")end end end;self.checkbox.Think=function(f,g)local j=true;for h,i in pairs(self.ConVars)do if GetConVarString(h)!=i.on then j=false end end;f:SetChecked(j)end;self.Enabled=function()return checkbox:GetChecked()end end end;function a:DoRightClick()local k=self:GetSelectionCanvas()if IsValid(k)&&k:NumSelectedChildren()>0&&self:IsSelected()then return hook.Run("SpawnlistOpenGenericMenu",k)end;self:OpenMenu()end;function a:DoClick()end;function a:OpenMenu()if IsValid(self:GetParent())&&self:GetParent().GetReadOnly&&self:GetParent():GetReadOnly()then return end;local l=DermaMenu()l:AddOption("#spawnmenu.menu.delete",function()self:Remove()hook.Run("SpawnlistContentChanged")end):SetIcon("icon16/bin_closed.png")l:Open()end;function a:Enabled()return false end;function a:ToTable(m)local n={}n.type="postprocess"n.name=self.name;n.label=self.label;n.icon=self.icon;n.convars=self.ConVars;table.insert(m,n)end;function a:Copy()local o=vgui.Create("PostProcessIcon",self:GetParent())o:CopyBounds(self)o.ConVars=self.ConVars;o:Setup(self.name,self.icon,self.label)return o end;vgui.Register("PostProcessIcon",a,"ContentIcon")
--addons/!lpakr_out/gamemodes/srp_base/gamemode/sandbox/spawnmenu/creationmenu/content/contenttypes/custom_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/draganddrop_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/feedback_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/grid_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/markdown_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/rating_ui.lua:
local a={}local b=0xf123;local c=0xf005;local d=0xf006;function a:Init()self.rating=1;self.temprating=1;self:DockPadding(5,5,5,5)self:SetBackgroundColor(col.transparent)self:AddPanel('srp_grid',function(e)e:Dock(FILL)for f=1,10 do srp.ui.Create('srp_button',function(g)g:SetText(d,true)g:SetSize(32,32)g:SetFont'SSRPForkAwesome'g.rating=f;g:LeftClick(function(h)self.rating=h.rating;self:RatingChanged(self.rating)end)g.Paint=function(h,i,j)draw.RoundedBox(6,0,0,i,j,self.rating>=h.rating&&col.blue||self.temprating>=h.rating&&col.blue_light||col.grey)if h.disabled then return end;if h:IsHovered()then self.temprating=h.rating end;if h.rating<=self.temprating||h.rating<=self.rating then h:SetText(c,true)else h:SetText(d,true)end end;e:AddItem(g)end)end;self.Grid=e end)end;function a:SetDisabled(k,l)self.disabled=k;for m,n in pairs(self.Grid:GetChildren())do n:SetDisabled(k,l)end end;function a:OnRatingChanged(o)self.RatingChanged=o end;function a:RatingChanged(p)end;function a:GetRating()return self.rating end;function a:SetRating(p)self.rating=math.Clamp(p,1,10)self.temprating=self.rating;self:RatingChanged(self.rating)return self end;vgui.Register('srp_squarerating',a,'srp_panel')local a={}local q={{text=0xf165,background=Color(255,50,50,150),hovercolor=Color(255,25,25,200),selectcolor=Color(255,50,50,255),rating=1},{text=0xf146,background=Color(50,50,255,150),hovercolor=Color(25,25,255,200),selectcolor=Color(50,50,255,255),rating=2},{text=0xf164,background=Color(50,255,50,150),hovercolor=Color(50,255,25,200),selectcolor=Color(50,255,50,255),rating=3}}function a:Init()self.Rating=2;self.Ratings={}self:DockPadding(5,5,5,5)self:SetBackgroundColor(col.transparent)self:AddPanel('srp_grid',function(e)e:Dock(FILL)for f=1,#q do local r=q[f]srp.ui.Create('srp_button_rounded',function(g)g:SetText(r.text,true)g:SetSize(60,60)g:SetFont'SSRPForkAwesome'g:SetBorderColor(col.transparent)g:SetSelectedBackgroundColor(r.selectcolor)g:SetBackgroundColor(r.background)g:SetHoverColor(r.hovercolor)g.ratingid=f;g.rating=r.rating;g:LeftClick(function(h)if self.disabled then return end;self.Rating=h.rating;self:RatingChanged(h.rating)self:SelectRating(h.ratingid)end)e:AddItem(g)end)end;self.Grid=e end)end;function a:OnRatingChanged(s)self.RatingChanged=s end;function a:RatingChanged()end;function a:SelectRating(f)for m,n in pairs(self.Grid:GetChildren())do if f==n.ratingid then n:Select(true)else n:Select(false)end end end;function a:SetDisabled(k,l)self.disabled=k;for m,n in pairs(self.Grid:GetChildren())do n:SetDisabled(k,l)end end;vgui.Register('srp_thumbsrating',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/simpleinfo_ui.lua:
local a={}local b,c=col.midnight,col.midnight_dark;local d=Color(255,255,255)local e=Color(222,222,222)surface.CreateFont('ui_info_title.l',{font='Clear Sans Medium',size=60,weight=600,antialias=true})surface.CreateFont('ui_info_title.r',{font='Clear Sans Medium',size=28,weight=600,antialias=true})surface.CreateFont('ui_info_text.r',{font='Clear Sans Medium',size=18,weight=400,antialias=true})function a:Init()self:SetTitle''self:SetSize(400,100)self:MakePopup(true)self:DockPadding(0,0,0,0)self:SetAlpha(0)self:AlphaTo(255,.1,0)self:SetBackgroundColor(b)self:AddPanel('srp_panel',function(f)f:DockMargin(0,0,0,0)f:DockPadding(0,0,0,0)f:Dock(TOP)f:SetTall(80)f:SetMouseInputEnabled(false)f:SetBackgroundColor(col.transparent)f:AddPanel('srp_label',function(g)g:Dock(FILL)g:SetFont'ui_info_title.l'g:SetText''g:SetTextColor(d)g:SetContentAlignment(5)g:SetMouseInputEnabled(false)self.header=g end)end)self:AddPanel('ui_scrollpanel',function(h)h:Dock(FILL)self.scroll=h end)self.close:SetBackgroundColor(col.transparent)self.close:SetHoverColor(col.transparent)self.close:SetTextColor(col.white)self.close:MoveToFront()self.close:LeftClick(function()self:AlphaTo(0,.1,0,function()if IsValid(self)then self:Remove()end end)end)end;function a:SetHeader(i,j)self.header:SetText(i)if j then self.header:SetFont'SSRPForkAwesomeLarge'end;return self end;function a:AddInfoSegment(k,l,m)srp.ui.Create('srp_simpleinfocat',function(n)n:SetParent(self.scroll:GetCanvas())n:Dock(TOP)n:SetTall(m||200)n:SetHeader(k||'')n:SetInfo(l)end)self:SetTall(self:GetTall()+(m||220))return self end;function a:Paint(o,p)surface.SetDrawColor(b)surface.DrawRect(0,0,o,p)surface.SetDrawColor(c)surface.DrawOutlinedRect(0,0,o,p,2)end;vgui.Register('srp_simpleinfo',a,'srp_window')local a={}function a:Init()self:DockMargin(0,0,0,0)self:DockPadding(25,10,25,10)self:SetBackgroundColor(c)self:AddPanel('srp_label',function(g)g:Dock(TOP)g:SetTall(25)g:SetContentAlignment(4)g:DockMargin(0,5,0,5)g:SetTextColor(e)g:SetFont'ui_info_title.r'g:SetText''self.header=g end)self:AddPanel('srp_label',function(g)g:Dock(FILL)g:SetContentAlignment(7)g:SetTextColor(e)g:DockMargin(0,5,0,5)g:SetFont'ui_info_text.r'g:SetText''self.desc=g end)end;function a:SetHeader(i)self.header:SetText(i)end;function a:SetInfo(l)self.desc:SetText(l)end;vgui.Register('srp_simpleinfocat',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/skin_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/baseui/window_ui.lua:
local a={}local b=col.grey:Copy()b.a=222;AccessorFunc(a,'m_bDeleteOnClose','DeleteOnClose',FORCE_BOOL)AccessorFunc(a,'m_bScreenLock','ScreenLock',FORCE_BOOL)AccessorFunc(a,'m_bDraggable','Draggable',FORCE_BOOL)function a:Init()self.ribbon=false;self.loading=false;self.loadalpha=0;self:SetFocusTopLevel(true)self:DockPadding(self.ribbon&&20||5,35,5,5)self:SetBorderColor(col.grey_light)self:SetDeleteOnClose(true)self:SetScreenLock(true)self:SetDraggable(true)self:SetPaintBackgroundEnabled(false)self:SetPaintBorderEnabled(false)self:AddPanel('srp_label',function(c)c:SetText'Window'c:SetFont'ui_title.r'c:SetWide(400)c:SetPos(self.ribbon&&20||10,5)c:SetMouseInputEnabled(false)self.title=c end)self:AddPanel('srp_button_rounded',function(d)d:DockMargin(0,0,0,0)d:SetSize(27,27)d:SetBackgroundColor(b)d:SetHoverColor(col.red_dark)d:SetBorderColor(col.transparent)d:SetClose()self.close=d end)end;function a:CreateHeader(e,f)return srp.ui.Create('srp_panel_rounded',function(g)g:Dock(TOP)g:SetTall(120)g:DockMargin(5,5,5,5)g:DockPadding(5,15,5,5)g:SetBackgroundColor(col.midnight_dark)g:AddPanel('srp_label',function(h)h:Dock(TOP)h:SetFont'ui_header.r'h:SetText(e)end)if f then g:AddPanel('srp_label',function(h)h:Dock(FILL)h:SetText(f)end)end end)end;function a:AddHeader(e,f)local i=self:CreateHeader(e,f)i:SetParent(self)i:Dock(TOP)return i end;function a:SetBlur(j,k)self.blur=j;self.blurdepth=k||5;return self end;function a:SetDeleteOnClose(j)self.deleteonclose=j;return self end;function a:GetDeleteOnClose(j)return self.deleteonclose end;function a:RemoveTitle()self.title:Remove()return self end;function a:SetTitle(l)self.title:SetText(l)return self end;function a:SetTitleFont(l)self.title:SetFont(l)return self end;function a:SetTitleColor(col)self.title:SetTextColor(col)return self end;function a:SetBorderColor(m)self.outline=true;self.m_bdrColor=m;return self end;function a:AddPanel(n,o,p)local g=srp.ui.Create(n,nil,p)if!IsValid(g)then return self end;g:SetParent(self)if self.stacked then g:Dock(TOP)g:InvalidateLayout(true)end;if isfunction(o)then return o(g,self)||g else return o&&self||g end end;function a:AddSpacer()self:AddPanel('DPanel',function(c)c:Dock(TOP)c:SetTall(1)c:DockMargin(5,10,5,10)c.Paint=function(q,r,s)derma.SkinHook('Paint','Spacer',self,r,s)end end)return self end;function a:SetStacked()self.stacked=true;return self end;function a:SetCloseCode(t)self.CloseCode=t;return self end;function a:GetCloseCode()return self.CloseCode end;function a:SetLoading(j,u,v)self.loading=j;self.loadingtext=v;if u then self:SetLoadingTimer(u)end;return self end;function a:IsLoading()return self.loading end;function a:SetLoadingTimer(w)self.loadendtime=w+CurTime()self.loadtimeout=w;timer.Simple(w,function()if IsValid(self)then self.loading=false end end)end;function a:IsActive()if self:HasFocus()then return true end;if vgui.FocusedHasParent(self)then return true end;return false end;function a:OnMousePressed()local x,y=self:LocalToScreen(0,0)if self:GetDraggable()&&gui.MouseY()<y+34 then self.Dragging={gui.MouseX()-self.x,gui.MouseY()-self.y}self:MouseCapture(true)return end end;function a:OnMouseReleased()self.Dragging=nil;self:MouseCapture(false)end;function a:OnKeyCodePressed(t)if self:GetCloseCode()&&self:GetCloseCode()==t then if!self:GetDeleteOnClose()then self:Hide()else self:Remove()end end end;function a:PerformLayout(r,s)if IsValid(self.close)then self.close:SetPos(r-30,3)end end;function a:Think()local z=math.Clamp(gui.MouseX(),1,ScrW()-1)local A=math.Clamp(gui.MouseY(),1,ScrH()-1)if self.Dragging then local B=z-self.Dragging[1]local C=A-self.Dragging[2]if self:GetScreenLock()then local D=self:GetWide()/2;local E=self:GetTall()/2;B=math.Clamp(B,-D,ScrW()-D)C=math.Clamp(C,0,ScrH()-E)end;self:SetPos(B,C)end;if self.y<0 then self:SetPos(self.x,0)end end;function a:SetHeaderColor(m)self.m_bgHeaderColor=m;return self end;function a:GetHeaderColor()return self.m_bgHeaderColor end;function a:SetBackgroundColor(col)self.m_bgColor=col;return self end;function a:Paint(r,s)derma.SkinHook('Paint','Frame',self,r,s)end;function a:PaintOver(r,s)derma.SkinHook('Paint','FrameLoading',self,r,s)end;function a:Finish()return self end;vgui.Register('srp_window',a,'EditablePanel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/battlepass/battlepass_cl.lua:
srp.battlepass=srp.battlepass||{}srp.battlepass.History={}CreateMaterial('battlepass_wall','VertexLitGeneric',{['$basetexture']='dev/dev_measuregeneric01b'})local a={}local b=Color(150,150,150)local c={{mdl='models/hunter/plates/plate5x7.mdl',mat='lordtrilobite/bp_flooring',scale=2,pos=Vector(0,0,-3),ang=Angle()},{mdl='models/hunter/plates/plate5x7.mdl',mat='lordtrilobite/bp_wall',scale=2,pos=Vector(0,300,0),ang=Angle(0,0,90)},{mdl='models/hunter/plates/plate5x7.mdl',mat='lordtrilobite/bp_wall',scale=2,pos=Vector(250,150,0),ang=Angle(0,90,90)},{mdl='models/hunter/plates/plate5x7.mdl',mat='lordtrilobite/bp_wall',scale=2,pos=Vector(-250,150,0),ang=Angle(0,90,90)},{mdl='models/lt_c/sci_fi/box_crate.mdl',pos=Vector(50,150,-1),ang=Angle(0,0,0)},{pos=Vector(0,0,0),ang=Angle(0,0,0)},{pos=Vector(45,0,0),ang=Angle(0,45,0)},{pos=Vector(-45,0,0),ang=Angle(0,-45,0)}}local d;local function e()d=d||Entity(0):GetBrushSurfaces()return d end;local function f(g)local h=string.Explode('/',g)local j=table.concat(h,'/',3)j='materials/'..string.Explode('_-',j)[1]return j end;function srp.battlepass.loadBasicScenery(k)local l=util.TraceLine({start=LocalPlayer():GetPos(),endpos=LocalPlayer():GetPos()-LocalPlayer():GetUp()*500,mask=MASK_SOLID_BRUSHONLY})local m=l.HitWorld&&f(l.HitTexture)||''k:SetCamPos(Vector(0,-100,35))k:SetLookAt(Vector(0,0,0))for n,o in ipairs(c)do local p=c[i]local q=k:AddModel(o.mdl||'models/Items/item_item_crate.mdl',o.pos,o.ang)q:DrawShadow(true)if n>1 then q:SetParent(k.Entities[1])end;if o.mat then q:SetMaterial(o.mat)end;if o.scale then q:SetModelScale(o.scale,0)end;q:SetColor(b)table.insert(a,q)end end;function srp.battlepass.removeBasicScenery(k)for r,q in pairs(a)do if IsValid(q)then q:Remove()end end;wallents={}end;function srp.battlepass.PopulateHistory(s)local t=s.id;local u=LocalPlayer():GetTalentXP(t)||0;local v=s.levels||50;if!srp.battlepass.History[t]then srp.battlepass.History[t]={MaxLevel=v,LastExperience=u}end;srp.battlepass.History[t].CurrentExperience=u;return srp.battlepass.History[t]end;function srp.battlepass.CompleteHistory(s)local t=s.id;if srp.battlepass.History[t]then srp.battlepass.History[t].LastExperience=LocalPlayer():GetTalentXP(s.id)||0;srp.battlepass.History[t].CurrentExperience=srp.battlepass.History[t].LastExperience end end;function srp.battlepass.OpenMenu(n)if!srp.battlepass.IsEnabled(n)then return end;srp.ui.Create('srp_battlepass',function(w)w:Populate(n)srp.battlepass.menu=w end)end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/characters/ui/characters_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/chat/commands_sh.lua:
srp.AddCommand('ooc',function(a,b)if b then chat.Send('OOC',a,b)end end):AddAlias('/'):AddParam(cmd.STRING):SetCooldown(1):SetChatCommand():SetUseJailed():SetInfoSection('Chat'):SetInfo('Displays an out of character message to the whole server'):SetInfoArgs({'Message - The message to display'})srp.AddCommand('looc',function(a,b)if b then chat.Send('LOOC',a,b)end end):AddAlias('lc'):AddParam(cmd.STRING):SetChatCommand():SetUseJailed():SetInfoSection('Chat'):SetInfo('Displays a message to the people close to you out of character.'):SetInfoArgs({'Message - The message to display'})srp.AddCommand('broadcast',function(a,b)if b||b!=''then chat.Send('Broadcast',a,b)if srp.gamemaster.GetToggle('lrbroadcast')then srp.xchat.Send('Broadcast',{gid=a:GetNetVar('srp.groups.id'),aid=a:GetAllegianceID(),name=a:GetTag()..' '..a:Nick(),message=b,emote=a:IsVIP()})end end end):AddAlias('b'):AddParam(cmd.STRING):SetCooldown(2):SetChatCommand():SetSuppressable('broadcast'):SetInfoSection('Chat'):SetInfo('Displays an in-character message displayed as a "broadcast" which is a global message that the whole server can see.\n\nThis acts as a long range cross-server message'):SetInfoArgs({'Message - The message to display'}):SetAlive().CanRun=function(self,a)local c=a:GetGroupRank()return c&&c:HasPermission('broadcast')||a:IsEventCharacter()||a:IsGamemaster()||false end;srp.AddCommand('comms',function(a,b)if b&&b!=''then chat.Send('Comms',a,b)end end):AddAlias('c'):AddParam(cmd.STRING):SetCooldown(2):SetChatCommand():SetAlive():SetSuppressable('communications'):SetInfoSection('Chat'):SetInfo('Displays an in-character message displayed as a "communication" which is a global message that the whole server can see.\n\nThis acts as a short ranged message.'):SetInfoArgs({'Message - The message to display'})srp.AddCommand('securecomms',function(a,b)if b&&b!=''then chat.Send('CommsSecure',a,b)end end):AddAlias('secc'):AddParam(cmd.STRING):SetCooldown(2):SetChatCommand():SetAlive():SetSuppressable('communications'):SetInfoSection('Chat'):SetInfo('Displays an in-character message displayed as a "secure communcation" which is a global message that anyone on the same faction/allegiance can see.'):SetInfoArgs({'Message - The message to display'})srp.AddCommand('officer',function(a,b)if b&&b!=''then chat.Send('Officers',a,b)srp.xchat.Send('Officers',{gid=a:GetNetVar('srp.groups.id'),aid=a:GetAllegianceID(),name=a:GetTag()..' '..a:Nick(),message=b,emote=a:IsVIP()})end end):AddAlias('o'):AddParam(cmd.STRING):SetChatCommand():SetSuppressable('communications'):SetInfoSection('Chat'):SetInfo('A private in-character channel for officers to see.'):SetInfoArgs({'Message - The message to display'}).CanRun=function(self,a)local c=a:GetGroupRank()return c&&(c:HasPermission'officer'||c.id=='JEDIMASTERC')||false end;srp.AddCommand('me',function(a,b)chat.Send('Me',a,b)end):AddParam(cmd.STRING):SetChatCommand():SetInfoSection('Chat'):SetInfo('Used to indicate an action or thought/feeling made by yourself to people around you.'):SetInfoArgs({'Message - The message to display'}):SetUseJailed()srp.AddCommand('metarget',function(a,d,b)chat.Send('MeTarget',a,d,b)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING):SetChatCommand():SetInfoSection('Chat'):AddAlias('mepm'):SetInfo('Used to indicate an action or thought/feeling made by yourself to people around you and a specific person.'):SetInfoArgs({'Target - The player to PM to','Message - The message to display to everyone around you and the target.'}):SetUseJailed()srp.AddCommand('yell',function(a,b)chat.Send('Yell',a,b)end):AddParam(cmd.STRING):SetChatCommand():AddAlias('y'):SetInfoSection('Chat'):SetInfo('Used to indicate that you are yelling. People further away can see this message.'):SetInfoArgs({'Message - The message to display'}):SetAlive()srp.AddCommand('whisper',function(a,b)chat.Send('Whisper',a,b)end):AddParam(cmd.STRING):SetChatCommand():AddAlias('w'):SetInfoSection('Chat'):SetInfo('Used to indicate that you are whispering. Only people closer than normal can see this message.'):SetInfoArgs({'Message - The message to display'}):SetAlive():SetUseJailed()srp.AddCommand('group',function(a,b)if b then chat.Send('Group',a,b)end end):AddParam(cmd.STRING):SetChatCommand():SetSuppressable('communications'):AddAlias('g'):SetInfoSection('Battalion'):SetInfo('A private chat channel for anyone in your battalion or sub-battaion to see. If you are a Jedi then lore Jedi can also see this channel.'):SetInfoArgs({'Message - The message to display'}):SetAlive()srp.AddCommand('training',function(a,b)if b then chat.Send('Training',a,b)end end):AddParam(cmd.STRING):SetChatCommand():AddAlias('t'):SetInfoSection('Chat'):SetInfo('A private chat between everyone who is able to train recruits.'):SetInfoArgs({'Message - The message to display'}):SetTrainer()srp.AddCommand('h',function(a,b)if b then chat.Send('Help',a,b)end end):AddParam(cmd.STRING):SetChatCommand():SetUseJailed():SetInfoSection('Chat'):SetInfo('A private chat channel that new players and older players can talk in to provide help.'):SetInfoArgs({'Message - The message to display'}).CanRun=function(self,a)if SERVER then else return true end end;srp.AddCommand('guard',function(a,b)if b then chat.Send('Guard',a,b)end end):AddParam(cmd.STRING):SetChatCommand():SetInfoSection('Enforcement'):SetInfo('Communicate with other law enforcement.'):SetInfoArgs({'Message - The message to display'}):SetEnforcement()srp.AddCommand('destroy',function(a,e)local f=e&&e!=''&&a:GetWeapon(e)||a:GetActiveWeapon()if IsValid(f)&&(f.SWBWeapon||f.IsKnife||f.IsLightsaber)then f:Remove()end end):AddParam(cmd.STRING,cmd.OPT_OPTIONAL):SetChatCommand():SetInfoSection('Chat'):SetInfo('Will remove the weapon you are currently holding.'):SetInfoArgs({'Weapon Class => The class of the weapon to destroy'})srp.AddCommand('give',function(a,g)if g==0 then return end;local h=a:GetEyeTrace().Entity;if!IsValid(h)||!h:IsPlayer()||!h:CharacterID()then srp.notif.Warning(a,3,term.Get('MustLookAtPlayer'))return false end;if h:GetPos():Distance(a:GetPos())>150 then return end;local i=a:GetAllegianceID()local j=a:GetAllegiance()local k=h:GetAllegianceID()local l=h:GetAllegiance()if j:IsEvent()!=l:IsEvent()&&(j:IsEvent()&&!l:IsEvent())then return end;local g=math.abs(math.floor(g))if hook.Run('CanSendMoney',a,h,g)==false then return end;if!a:HasMoney(g)then srp.notif.Warning(a,3,term.Get('NotEnoughCredits'))return false end;a:TakeMoney(g)h:AddMoney(g,true)a:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_GIVE)srp.notif.Success(h,3,term.Get('ReceivedCreditsFrom'),g,a:GetCharacterName())srp.notif.Success(a,3,term.Get('SentCreditsTo'),g,h:GetCharacterName())hook.Run('OnPlayerGaveMoney',a,h,g)end):AddParam(cmd.UINT):SetCooldown(10):SetInfoSection('Chat'):SetInfo('Gives an amount of money to the person you are looking at in the same faction'):SetInfoArgs({'Amount - the amount of money to give'}):SetChatCommand():SetUseJailed()srp.AddCommand('resetname',function(a,m)srp.character.ResetName(m,function(n,...)if n then srp.notif.Info(a,3,...)else srp.notif.Warning(a,3,...)end end)end):AddParam(cmd.UINT):SetInfoSection('Staff'):SetInfo('Resets a players name'):SetInfoArgs({'CharacterID - The characterid of the player'}):SetFlag('D')srp.AddCommand('setname',function(a,d,o)if!d:CharacterID()then return end;if!a:IsAdmin()&&!d:IsEventCharacter()then srp.notif.Warning(a,4,term.Get('OnlySetEventCharNames'))return end;srp.character.SetName(d,o,function(n,p,...)if n==false then srp.notif.Warning(a,4,p||term.Get('UnknownError'),...)else srp.notif.Neutral(a,4,p,d,d:SteamID(),o)if IsValid(d)&&d:CharacterID()then d:SetNetVar('srp.character.name',o)d:GetCharacter().name=o;srp.notif.Neutral(d,4,term.Get('YourNameSet'),o,a:Nick(),a:SteamID())end end end)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.STRING):SetInfoSection('Chat'):SetInfo('Sets a players name to the name specified.'):SetInfoArgs({'Target - The steamid of the player','Name - The new unique name you want to give the player'}).CanRun=function(self,a)return a:IsTrialGamemaster()||a:IsAdmin()||false end;srp.AddCommand('roll',function(a,q,r)q=math.Clamp(q||100,1,10000)r=math.Clamp(r||1,1,10)math.randomseed(CurTime())local s={}for t=1,r do s[#s+1]=math.random(0,q)end;chat.Send('Roll',a,'rolled '..table.concat(s,', ')..' out of '..(q||100))end):AddParam(cmd.UINT,cmd.OPT_OPTIONAL):AddParam(cmd.UINT,cmd.OPT_OPTIONAL):SetInfoSection('Chat'):SetInfo('Rolls a number from 1 to the given upper bound no bigger than 10,000. May also provide the amount of rolls to do from 1 to 10.'):SetInfoArgs({'UpperNumber - The max the roll can go to (default: 100)','Count - The amount of rolls to complete (default: 1)'}):SetChatCommand():SetUseJailed()srp.AddCommand('room',function(a,b)if b then chat.Send('Room',a,b)end end):AddParam(cmd.STRING):AddAlias('simroom'):AddAlias('sim'):SetChatCommand():SetSuppressable('communications'):SetInfoSection('Chat'):SetInfo('Displays a message inside the room you are in.\nThe room name is provided at the botton of your screen.'):SetInfoArgs({'Message - The message to display.'})hook('PlayerGetChatLimit','VIP+Limit',function(a)if a:IsVIPPlus()then return chat.DefaultLimit+100 end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/callingcard/callingcard_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_displayeffects_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_displayvehicle_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/cosmetics/ui/cosmetic_displayweapon_ui.lua:
local a={}local b=Vector(40,0,0)local c=Angle(35,0,0)function a:SetupPreview()self:AddPanel('srp_modelpanel',function(d)d:Dock(FILL)d:MoveToBack()d:SetCanControl(true)self.PreviewPanel=d end)self:DisplayPreviewEntity()end;function a:DisplayPreviewEntity()local e=weapons.Get(self.Class)if!e then return end;local f=e.Model||e.WorldModel||e.MDL;if!f then return end;if IsValid(self.PreviewEntity)then self.PreviewEntity:SetModel(f)else self.PreviewEntity=self.PreviewPanel:AddModel(f)self.PreviewEntity.cents={}end;self.PreviewPanel:SetFOV(75)if!e.UIPosition then self.PreviewPanel:TryCenter(self.PreviewEntity)else self.PreviewEntity:SetPos(e.UIPosition)self.PreviewEntity:SetAngles(e.UIAngle)self.PreviewPanel:SetCamPos(Vector(0,-100,0))self.PreviewPanel:SetLookAt(Vector(0,0,0))end end;function a:AddCosmetic(g)if g:GetClass()=='charm'then self.Charm=cosmetics.GetManager(cosmetics.APPAREL).OnEquip(g,self.PreviewEntity)self.PreviewPanel:AddEntity(self.Charm)return end;local h=g:GetSkin()if h then self.PreviewEntity:SetSkin(h)end;local i=g:GetMaterial()if i then self.PreviewEntity:SetSubMaterial(0,i:GetName())else local j=g:GetSubMaterials()if j then for k,i in pairs(j)do self.PreviewEntity:SetSubMaterial(k,i)end end end end;function a:RemoveCosmetic(g)if!IsValid(self.PreviewEntity)then return end;self.PreviewEntity:SetSubMaterial()self.PreviewEntity:SetMaterial''self.PreviewEntity:SetSkin(0)if g:GetClass()=='charm'then cosmetics.GetManager(cosmetics.APPAREL).OnRemoved(g,self.PreviewEntity)if IsValid(self.Charm)then self.Charm:Remove()end;return end end;vgui.Register('srp_cosmetic_displayweapon',a,'srp_cosmetic_displayitem')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/init_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/credits/ui/item_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/effects/effects_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/effects/effects_cl.lua:
srp.effect=srp.effect||{}local a=0;local b=10;local c=2;local d=10;local e=CurTime()local f={['$pp_colour_colour']=1,['$pp_colour_addr']=0,['$pp_colour_addg']=0,['$pp_colour_addb']=0,['$pp_colour_brightness']=0,['$pp_colour_contrast']=1,['$pp_colour_mulr']=0,['$pp_colour_mulg']=0,['$pp_colour_mulb']=0}local g={}local h='galactic/projectionred'local i='srp.effects.ProjectedTextures'local function j(k,l,m)end;local function n()local o={}for p=1,#g do local q=g[p]q.percent=math.Clamp((CurTime()-q.start)/q.duration,0,q.maxpercent)local r=q.size*math.Min(q.percent,1)q.projection:SetOrthographic(true,r,r,r,r)q.projection:Update()if q.percent>=q.maxpercent then table.insert(o,p)end end;for p=1,#o do local q=table.remove(g,o[p])if q then if IsValid(q.projection)then q.projection:Remove()end;if IsValid(q.referenceProjection)then q.referenceProjection:Remove()end end end;if#g==0 then hook.Remove('Think',i)end end;function srp.effect.AddProjection(s,t,u,v,w,x,y)local q={pos=s,normal=t,color=v,size=u/2,start=CurTime(),finish=CurTime()+w,duration=w,percent=0}q.maxpercent=(w+x)/w;if y then local z=ProjectedTexture()z:SetOrthographic(true,q.size,q.size,q.size,q.size)z:SetPos(s-t*1)z:SetAngles(t:Angle())z:SetTexture(h)z:SetBrightness(2)z:SetNearZ(1)z:Update()q.referenceProjection=z end;local r=q.size*q.percent;local z=ProjectedTexture()z:SetOrthographic(true,r,r,r,r)z:SetPos(s-t*1)z:SetAngles(t:Angle())z:SetTexture(h)z:SetColor(v)z:SetBrightness(5)z:SetNearZ(1)z:Update()q.projection=z;table.insert(g,q)hook('Think',i,n)end;local function A()local B,C=CurTime()>e,1/RealFrameTime()if B&&a==0 then return elseif!B&&a!=b then a=math.Approach(a,b,d/C)elseif B then a=math.Approach(a,0,c/C)end;DrawToyTown(a,ScrH()*.5)end;function srp.effect.ApplySuppression(w)e=CurTime()+(w||2)a=4;util.ScreenShake(LocalPlayer():GetPos(),.5,10,1,1)end;local D=0;local function E(F)if!LocalPlayer():Alive()||F>.3 then if D>0 then LocalPlayer():StopLoopingSound(D)D=0 end;return end;if D==0 then D=LocalPlayer():StartLoopingSound'player/heartbeat1.wav'end end;function GM:RenderScreenspaceEffects()if cvar.GetValue('srp_screeneffects')then local F=math.Clamp(LocalPlayer():Health()/LocalPlayer():GetMaxHealth(),0,1)E(F)f['$pp_colour_colour']=F;draw.ColorModify(f)end;A()end;local G='srp.effect.Run'function srp.effect.PlayEffect(H,I,J)local K=srp.effect.effects[H]if K.OnRunCL then K:OnRunCL(I,J)end;if K.Draw then local w=J.Duration||K.Duration||10;local H=IsValid(I)&&I:EntIndex()||CurTime()hook.Add('PostDrawTranslucentRenderables','Effect.'..H,function()K:Draw(I,J)end)timer.Remove(G..H)timer.Create(G..H,w,1,function()if K.OnStopCL then K:OnStopCL(I,J)end;hook.Remove('PostDrawTranslucentRenderables','Effect.'..H)end)end end;net('srp.effect.Run',function(L,M)local H=net.ReadString()local I;local N=net.ReadBool()if N then I=net.ReadEntity()end;local J=net.ReadTable()srp.effect.PlayEffect(H,I,J)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/effects/explosive_sh.lua:
game.AddParticles'particles/clonewars_1.pcf'game.AddParticles'particles/vman_explosion.pcf'PrecacheParticleSystem'dusty_explosion_rockets'sound.Add({name='IED.Explode',channel=CHAN_AUTO,volume=.4,level=100,pitch=100,sound={'weapons/ied/ied_detonate_dist_01.wav','weapons/ied/ied_detonate_dist_02.wav','weapons/ied/ied_detonate_dist_03.wav'}})sound.Add({name='IED.ExplodeDistant',channel=CHAN_AUTO,volume=.6,level=100,pitch=100,sound={'weapons/ied/ied_detonate_dist_01.wav','weapons/ied/ied_detonate_dist_02.wav','weapons/ied/ied_detonate_dist_03.wav'}})sound.Add({name='IED.ExplodeVeryDistant',channel=CHAN_AUTO,volume=1,level=150,pitch=100,sound={'weapons/ied/ied_detonate_far_dist_01.wav','weapons/ied/ied_detonate_far_dist_02.wav','weapons/ied/ied_detonate_far_dist_03.wav'}})sound.Add({name='Mortar.Explode',channel=CHAN_AUTO,volume=.4,level=100,pitch=100,sound={'weapons/ied/ied_detonate_dist_01.wav','weapons/ied/ied_detonate_dist_02.wav','weapons/ied/ied_detonate_dist_03.wav'}})sound.Add({name='Mortar.ExplodeDistant',channel=CHAN_AUTO,volume=1,level=100,pitch=100,sound={'galactic/weapons/mortar/explosion1.mp3','galactic/weapons/mortar/explosion2.mp3','galactic/weapons/mortar/explosion3.mp3','galactic/weapons/mortar/explosion4.mp3'}})sound.Add({name='Mortar.ExplodeDistantFar',channel=CHAN_AUTO,volume=.7,level=100,pitch=100,sound={'galactic/weapons/mortar/explosion1.mp3','galactic/weapons/mortar/explosion2.mp3','galactic/weapons/mortar/explosion3.mp3','galactic/weapons/mortar/explosion4.mp3'}})timer.Simple(5,function()srp.sounds.Register('IED.Explode',{TravelSpeed=2500,Explosive=true,MaxDistance=6000,{name='IED.ExplodeDistant',distance={1000}},{name='IED.ExplodeVeryDistant',distance={3000}}})srp.sounds.Register('Mortar.Explode',{TravelSpeed=2500,Explosive=true,MaxDistance=14000,{name='Mortar.ExplodeDistant',distance={1000}},{name='Mortar.ExplodeDistantFar',distance={3000}}})end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/eventrewards/ui/eventreward_overview_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/blacklist/blacklist_cl.lua:
srp.gamemaster=srp.gamemaster||{}net('srp.gamemaster.BlacklistAdd',function()hook.Run('OnPlayerGMBlacklisted',net.ReadEntity(),net.ReadString(),net.ReadString())end)net('srp.gamemaster.BlacklistRemove',function()hook.Run('OnPlayerGMUnblacklisted',net.ReadEntity(),net.ReadString())end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/bossbars/ui/bossbar_ui.lua:
local a={}local b=Color(0,0,0,200)local c=Color(200,75,75,200)function a:Init()self:SetTall(40)self:DockMargin(0,0,0,5)self:SetMouseInputEnabled(false)self:SetKeyboardInputEnabled(false)self.Health=100;self.MaxHealth=100 end;function a:Populate(d,e)self.Entity=d;self.EntityIndex=d:EntIndex()self.EntityName=(e||d:GetClass()):Replace('npc_',''):Replace('_',''):Capitalize()self.Health=d:Health()self.MaxHealth=d:GetMaxHealth()||100;self.Percent=self.Health/self.MaxHealth end;function a:Think()if self.NextThink&&self.NextThink>CurTime()then return end;local d=self.Entity;if!IsValid(d)||d:Health()<0||d.Alive&&!d:Alive()then self:Remove()return end;self.MaxHealth=d:GetMaxHealth()self.Health=d:Health()self.NextThink=CurTime()+.5 end;function a:Paint(f,g)if srp.weaponswitcher.IsVisible()then return end;self.Percent=Lerp(RealFrameTime()/1*5,self.Percent,math.Clamp(self.Health/self.MaxHealth,0,1))draw.RoundedBox(4,0,0,f,g,b)draw.RoundedBox(4,1,1,f*self.Percent-2,g-2,c)draw.SimpleText(self.EntityName,'ui_header.r',20,g/2,col.white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)draw.SimpleText(self.Health..'/'..self.MaxHealth,'ui_header.s',f-20,g/2,col.white,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)self.LastPercent=self.Percent end;vgui.Register('srp_bossbar',a,'srp_panel')local a={}function a:Init()self.BossBars={}self:SetBackgroundColor(col.transparent)self:DockPadding(0,0,0,0)self:SetSize(500,105)self:SetPos(0,60)self:CenterHorizontal()end;function a:AddEntity(d,e)local h=d:EntIndex()self:AddPanel('srp_bossbar',function(i)i:Populate(d,e)i:SetPos(0,500)i:Dock(TOP)self.BossBars[h]=i end)self:SetTall(#self:GetChildren()*45)end;function a:RemoveEntity(d)local h=d:EntIndex()if IsValid(self.BossBars[h])then self.BossBars[h]:Remove()self.BossBars[h]=nil end end;vgui.Register('srp_bossbarcontainer',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/domination/ui/dominationteams_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/eventmode/mode_cl.lua:
srp.gamemaster=srp.gamemaster||{}srp.gamemaster.ratingsui=srp.gamemaster.ratingsui;if IsValid(srp.gamemaster.ratingsui)then srp.gamemaster.ratingsui:Remove()end;local function a(b)if#b>8 then local c=table.remove(b,1)if IsValid(c)then c:Remove()end end;local d=0;for e=1,#b do local c=b[e]c.Index=e;c:MoveMe(d,1,0,-1)d=d+c:GetTall()+2 end end;local function f()if IsValid(srp.gamemaster.ratingsui)then return end;local g=math.min(500,ScrW()*.25)srp.ui.Create('srp_panel',function(c)c:SetSize(g,800)c:SetPos(ScrW()*.05,ScrH()*.15)c:SetBackgroundColor(col.transparent)c:SetMouseInputEnabled(false)c:SetKeyBoardInputEnabled(false)c.Children={}c.OnChildAdded=function(h,c)table.insert(h.Children,c)a(h.Children)end;c.OnChildRemoved=function(h,c)table.RemoveByValue(h.Children,c)a(h.Children)end;srp.gamemaster.ratingsui=c end)end;function srp.gamemaster.DisplayRating(i,j,k,l)f()srp.ui.Create('srp_ratinginfo',function(c)c:SetPos(0,600)c:SetName(CurTime())c:SetParent(srp.gamemaster.ratingsui)c:Populate(srp.gamemaster.ratingsui,i,j,k,l)end)end;function srp.gamemaster.OpenEventViewer(m,n)if IsValid(srp.gamemaster.evviewerpanel)then return end;srp.ui.Create('srp_eventviewer',function(c)c:Populate(m,n)srp.gamemaster.evviewerpanel=c end)end;function srp.gamemaster.OpenTypeMenu(o)if IsValid(srp.gamemaster.typepanel)then return end;srp.ui.Create('srp_eventtypes',function(c)c:Populate(o)srp.gamemaster.typepanel=c end)end;net('srp.gamemaster.RatingDisplay',function()local l=net.ReadBool()local i=!l&&net.ReadPlayer()local j=net.ReadUInt(2)local k=net.ReadString()srp.gamemaster.DisplayRating(i,j,k,l)end)net('srp.gamemaster.Rating',function()local p=net.ReadUInt(24)local q=net.ReadString()srp.notif.FlashConfirm('eventratingpending_'..p,'Event Rating','Please rate this event!',300,'Rate',function()srp.ui.Create('srp_eventrating',function(c)c:Populate(p,q)end)end)end)net('srp.gamemaster.OpenEventMenu',function()srp.gamemaster.OpenEventViewer(net.ReadGameMasterTypes())end)net('srp.gamemaster.OpenEventMenuEnd',function()srp.gamemaster.OpenEventViewer(net.ReadGameMasterTypes(),net.ReadGameMasterEvent())end)net('srp.gamemaster.RemoveType',function()hook.Run('OnGameMasterTypeRemoved',net.ReadUInt(24))end)net('srp.gamemaster.SyncType',function()hook.Run('OnGameMasterTypeCreated',net.ReadGameMasterType())end)net('srp.gamemaster.OpenTypeEditor',function()srp.gamemaster.OpenTypeMenu(net.ReadGameMasterTypes())end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/objectives/ui/objectiveoverview_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/objectives/ui/objectives_ui.lua:
local a={}local b=Color(0,0,0,220)function a:Init()self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self:SetSize(280,555)self:SetPos(ScrW()-282,42)self:SetBackgroundColor(col.transparent)self:AddPanel('ui_scrollpanel',function(c)c:Dock(FILL)c.Padding=2;self.scroll=c end)hook.Add('OnGMObjectiveAdded',self,self.Populate)hook.Add('OnGMObjectiveRemoved',self,self.Populate)hook.Add('OnGMObjectiveUpdated',self,self.Populate)hook.Add('OnGMObjectivesAdded',self,self.Populate)end;function a:OnRemove()hook.Remove('OnGMObjectiveAdded',self)hook.Remove('OnGMObjectiveRemoved',self)hook.Remove('OnGMObjectiveUpdated',self)hook.Remove('OnGMObjectivesAdded',self)end;function a:Populate()local d=self.scroll:GetCanvas()d:Clear()local e=srp.objectives.GetAll()for f,g in pairs(e)do if table.Count(g)==0 then continue end;if f!=0&&(LocalPlayer():IsTrialGamemaster()&&!cvar.GetValue('srp_showallobjectives')&&LocalPlayer():GetGroupID()!=f)then continue end;local h='Global Objective'local i=col.white;if f!=0 then local j=srp.groups.Get(f,true)h=j&&j:GetName()||'Unknown'i=j&&j.color||i end;srp.ui.Create('srp_panel_rounded',function(k)k:SetParent(d)k:Dock(TOP)k:DockPadding(5,0,0,0)k:DockMargin(0,0,0,2)k:SetTall(30)k:SetBackgroundColor(b)k:AddPanel('srp_label',function(l)l:Dock(FILL)l:SetText(h)l:SetTextColor(i)l:DockPadding(0,0,0,0)l:DockMargin(0,0,0,0)end)end)for m,n in pairs(g)do srp.ui.Create('srp_objective',function(k)k:SetParent(d)k:Dock(TOP)k:Populate(m,n)end)end end end;function a:Think()local o=LocalPlayer():InRadio()if o!=self.RadioStatus then if o then self:SetPos(ScrW()-282,222)else self:SetPos(ScrW()-282,42)end;self.RadioStatus=o end end;function a:Paint()end;vgui.Register('srp_objectives',a,'srp_panel')local a={}function a:Init()self:DockPadding(2,2,2,2)self:DockMargin(0,2,0,0)self:SetTall(50)self:SetBackgroundColor(b)self:AddPanel('srp_panel_rounded',function(k)k:SetSize(50,48)k:DockPadding(1,2,1,1)k:DockMargin(2,2,2,2)k:Dock(LEFT)k:AddPanel('srp_label',function(l)l:SetFont'SSRPForkAwesomeLarge'l:SetText''l:Dock(FILL)l:SetContentAlignment(5)l:SetTextColor(color_white)self.icon=l end)self.statuscolor=k end)self:AddPanel('srp_label',function(l)l:SetContentAlignment(1)l:SetText'Name'l:SetFont'ui_header.rb'l:Dock(TOP)l:SetTall(25)l:DockMargin(2,1,1,1)self.name=l end)self:AddPanel('srp_label',function(l)l:SetContentAlignment(7)l:SetText'Description'l:SetFont'ui_label.b'l:Dock(TOP)l:DockMargin(2,0,0,0)self.description=l end)end;function a:Populate(m,p)self.id=m;self.objective=p;self.name:SetText(p.name)self.description:SetText(p.description)self.icon:SetText(p.status.icon,true)self.statuscolor:SetBackgroundColor(p.status.color)end;vgui.Register('srp_objective',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gamemaster/ui/gamemasterlist_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/gifts/ui/giftitem_ui.lua:
local a={}function a:Init()self.lbl:Dock(BOTTOM)self.lbl:SetContentAlignment(5)self:SetBackgroundColor(col.grey_light)self:AddPanel('DImage',function(b)b:SetSize(40,40)b:SetPos(20,16)b:SetMouseInputEnabled(false)b:MoveToBack()self.Icon=b end)hook('OnGiftUnlocked',self,self.Unlocked)end;function a:Unlocked(c)if c.id==self.ItemID then self:_OnUnlocked()self:Remove()end end;function a:OnUnlocked(d)self._OnUnlocked=d end;function a:SetTag(e,f)self.Count=e;self.CreditIcon=true end;function a:Populate(c,g,h)self.Gift=c;self.ItemID=g&&g.id;self.Item=g;local i=c.Credits||c.Price;local j=c.Credits&&''||' RC'self:SetText(c.Name)self:SetTag(g&&g.GifterName||string.Comma(i)..j,self.Credits)if c.Icon then self.Icon:SetMaterial(c.Icon)end end;function a:Paint(k,l)local m=self:IsHovered()&&col.grey||col.grey_light;draw.RoundedBox(4,0,8,k,l-8,m)if!self.Count then return end;surface.SetFont'ui_label.r'local n,o=surface.GetTextSize(self.Count)draw.RoundedBox(4,k-n-8,0,n+8,o,m)surface.SetTextColor(col.white)surface.SetTextPos(k-n-4,0)surface.DrawText(self.Count)end;vgui.Register('srp_giftitem',a,'srp_button_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/orgs/orgs_sh.lua:
srp.org=srp.org||{}srp.org.Ranks={'Member','Officer','Owner'}srp.org.Models={{Name='Alyx',Model='models/player/alyx.mdl'},{Name='Female #1',Model='models/player/group01/female_01.mdl'},{Name='Female #2',Model='models/player/group01/female_02.mdl'},{Name='Female #3',Model='models/player/group01/female_03.mdl'},{Name='Female #4',Model='models/player/group01/female_04.mdl'},{Name='Female #5',Model='models/player/group01/female_05.mdl'},{Name='Female #6',Model='models/player/group01/female_06.mdl'},{Name='Male #1',Model='models/player/group01/male_01.mdl'},{Name='Male #2',Model='models/player/group01/male_02.mdl'},{Name='Male #3',Model='models/player/group01/male_03.mdl'},{Name='Male #4',Model='models/player/group01/male_04.mdl'},{Name='Male #5',Model='models/player/group01/male_05.mdl'},{Name='Male #6',Model='models/player/group01/male_06.mdl'},{Name='Quarren',Model='models/player/valley/lgn/quarren/quarren.mdl'},{Name='Ithorian',Model='models/galactic/ithorian/ithorian.mdl'},{Name='Shop Keeper',Model='models/player/valley/lgn/shop_keeper/shop_keeper.mdl'},{Name='Pantoran',Model='models/galactic/pantoranciv/pantoranciv.mdl'},{Name='Gotal',Model='models/player/valley/gotal.mdl'},{Name='Ackbar',Model='models/player/valley/ackbar.mdl'},{Name='Droid',Model='models/player/valley/lgn/death_star/death_star.mdl'},{Name='Talz',Model='models/player/valley/talz.mdl'},{Name='Orphne',Model='models/player/valley/orphne.mdl'},{Name='Karkarodon',Model='models/player/valley/karkarodon.mdl'},{Name='Trandoshan Bounty Hunter',Model='models/tfa/comm/gg/pm_sw_trandoshan_bounty_hunter_v1.mdl'},{Name='Trandoshan Bounty Hunter 2',Model='models/tfa/comm/gg/pm_sw_trandoshan_bounty_hunter_v1_skin2.mdl'},{Name='Trandoshan Bounty Hunter 3',Model='models/tfa/comm/gg/pm_sw_trandoshan_bounty_hunter_v1_skin2.mdl'},{Name='Trandoshan Bounty Hunter 4',Model='models/tfa/comm/gg/pm_sw_trandoshan_bounty_hunter_v2_skin2.mdl'},{Name='Breen',Model='models/player/breen.mdl'},{Name='GMan',Model='models/player/gman_high.mdl'},{Name='Kleiner',Model='models/player/kleiner.mdl'},{Name='Power Droid',Model='models/player/valley/lgn/power_droid/power_droid.mdl'}}nw.Register'srp.org.Name':Write(net.WriteString):Read(net.ReadString):SetPlayer()nw.Register'srp.org.Rank':Write(net.WriteUInt,3):Read(function()return srp.org.Ranks[net.ReadUInt(3)]||srp.org.Ranks[1]end):SetLocalPlayer()function PLAYER:SetOrgName(a)self:SetNetVar('srp.org.Name',a)end;function PLAYER:GetOrgName()return self:GetNetVar('srp.org.Name')end;function PLAYER:SetOrgRank(b)self:SetNetVar('srp.org.Rank',b)end;function PLAYER:GetOrgRank()return self:GetNetVar('srp.org.Rank')end;srp.AddCommand('orgdisband',function(c)srp.notif.Confirm(c,{title='Disband Org',sub_text='Are you sure you want to disband the organisation? Everyone will be removed!',duration=30,make_popup=true,OnAnswered=function(d,e)srp.org.Disband(e)end})end):SetInfoSection('Orgs'):SetInfo('Disbands the organisation. For Organisation owners.')srp.AddCommand('orgleave',function(c)srp.notif.Confirm(c,{title='Leave Org',sub_text='Are you sure you want to leave the organisation? Think carefully about this!',duration=30,make_popup=true,OnAnswered=function(d,e)srp.org.Leave(e)end})end):SetInfoSection('Orgs'):SetInfo('Makes YOU leave your current organisation')srp.AddCommand('orginvite',function(c,f)srp.org.Invite(c,f)end):AddParam(cmd.PLAYER_ENTITY):SetInfoSection('Orgs'):SetInfo('Invite a player to your organisation'):SetInfoArgs({'Target - the player you want to invite'})srp.AddCommand('orginvite',function(c,f,g)srp.org.SetRank(c,f,g)end):AddParam(cmd.PLAYER_ENTITY):AddParam(cmd.FLOAT):SetInfoSection('Orgs'):SetInfo('Promote a player in the organisation that you are officer in.'):SetInfoArgs({'Target - the player you want to invite'}):SetInfoArgs({'Rank - The rank to set the player to. 1 = Member, 2 = Officer'})
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupblacklist_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/grouprecruitment_ui.lua:
local a={}local b=Material'galactic/ui/triumphs/background.png'local c=col.black:Copy()c.a=240;local d=Material'gui/gradient_up'function a:Init()self:SetSize(ScrW(),ScrH())self:SetPos(0,0)self:MakePopup()self:SetBackgroundColor(col.midnight)self:SetAlpha(0)self:AlphaTo(255,.25,0)self:AddPanel('srp_grid',function(e)e:SetSize(205,405)e:SetAutoHeight(true)e:SetSpacing(4,4,false)self.Grid=e end)self:AddPanel('srp_button_rounded',function(f)f:SetText'Close Recruitments'f:SetFont'ui_label.l'f:SetSize(150,40)f:SetBackgroundColor(col.midnight)f:SetHoverColor(col.midnight_light)f:LeftClick(function(f)self:DoRemove()end)self.CloseBtn=f end)cvar.SetValue('srp_hud',false,true)srp.groups.GetRecruitment()hook('OnGroupRecruitmentSynced',self,self.PopulateRecruitement)end;function a:OpenPreview(g,h)self:DisplayGroups(0)self:AddPanel('srp_group_recruitment_info',function(i)i:SetSize(208*6,708)i:Center()i:Populate(self,g,h)i:SetAlpha(0)i:AlphaTo(255,.25,.25)self.PreviewContainer=i end)end;function a:ClosePreview()self:DisplayGroups(255,.25)if IsValid(self.PreviewContainer)then self.PreviewContainer:AlphaTo(0,.25,0,function()if IsValid(self.PreviewContainer)then self.PreviewContainer:Remove()end end)end end;function a:AimTowards(j)local k=CurTime()+4;local l=j:GetPos()+Vector(0,0,50)srp.ui.MarkPOI(l,120)srp.ui.AimTowards(l)self:DoRemove()end;function a:JoinOpenBattalion(g)cmd.Run('gopenjoinid',g.internal)self:DoRemove()end;function a:DoRemove()self:AlphaTo(0,0.25,0,function()if IsValid(self)then self:Remove()end end)end;function a:DisplayGroups(m,n)for o,i in ipairs(self.Grid:GetChildren())do i:AlphaTo(m,.25,n||0)end end;function a:OnRemove()hook.Remove('OnGroupRecruitmentSynced',self)cvar.SetValue('srp_hud',true)end;function a:PopulateRecruitement(p)local q=0;for o,g in ipairs(srp.groups.GetAll(true))do local h=p[g.id]if h then srp.ui.Create('srp_group_recruitment_advert',function(i)i:Populate(self,g,h)self.Grid:AddItem(i)q=q+1 end)end end;self.Grid:SetWide(math.min(q,q>8&&6||4)*208)self.Grid:InvalidateLayout(true)self.Grid:Center()end;function a:PerformLayout(r,s)if IsValid(self.CloseBtn)then self.CloseBtn:SetPos((r-self.CloseBtn:GetWide())/2,s-70)end end;function a:Paint(r,s)draw.Blur(self)draw.Box(0,0,r,s,c)surface.SetMaterial(b)surface.SetDrawColor(150,150,150,5)surface.DrawTexturedRect(0,0,r,s)end;vgui.Register('srp_group_recruitment',a,'srp_panel')local a={}local t=col.midnight_dark:Copy()t.a=200;function a:Init()self:SetSize(200,350)self:DockPadding(5,10,5,10)self:SetAlpha(0)self:AlphaTo(255,.5,0)self.lbl:SetText''self:AddPanel('srp_modelpanel',function(u)u:SetSize(200,400)u:SetPos(0,0)u:SetMouseInputEnabled(false)u:SetCamPos(Vector(-35,0,65))u:SetLookAt(Vector(0,0,65))u:SetFOV(55)self.mdl=u end)self:AddPanel('srp_label',function(v)v:Dock(TOP)v:SetFont'ui_header.s'v:SetBackgroundColor(col.background)v:SetMouseInputEnabled(false)v:SetContentAlignment(5)v:SetTall(24)self.View=v end)self:AddPanel('srp_grid',function(e)e:SetSize(100,28)e:SetMouseInputEnabled(true)self.Attributes=e end)self:LeftClick(function(f)if IsValid(self.Controller)then self.Controller:OpenPreview(self.Group,self.Data)end end)end;function a:Populate(w,g,h)self.Controller=w;self.Group=g;self.Data=h;self.GroupColor=g:GetAltColor():Copy()self.GroupColor.a=75;self.View:SetText(g:GetName())self:SetupLeaderModel(g)self:PopulateAttributes(g:GetAttributes())if h.Tryout then self:AddPanel('srp_button_tagtext_rounded',function(f)f:Dock(BOTTOM)f:SetBackgroundColor(col.blue)f:SetHoverColor(col.blue_dark)f:SetContentAlignment(4)f:SetText'View Active Tryout!'f:SetTall(22)f:SetTagFont'SSRPForkAwesome'f:SetTagWidth(15)f:SetTagText(0xf08d,true)f:SetTagBackground(col.transparent)f:DockMargin(5,4,5,4)f:LeftClick(function()if IsValid(self.Controller)&&IsValid(h.TryoutEntity)then self.Controller:AimTowards(h.TryoutEntity)end end)end)end;if h.Open then self:AddPanel('srp_button_tagtext_rounded',function(f)f:Dock(BOTTOM)f:SetBackgroundColor(col.green)f:SetHoverColor(col.green_dark)f:SetContentAlignment(4)f:SetText'Join Open Battalion!'f:SetTall(22)f:SetTagFont'SSRPForkAwesome'f:SetTagWidth(15)f:SetTagText(0xf067,true)f:SetTagBackground(col.transparent)f:DockMargin(5,4,5,4)f:LeftClick(function()if IsValid(self.Controller)then self.Controller:JoinOpenBattalion(self.Group)end end)end)end end;function a:PopulateAttributes(x)for o,y in ipairs(x)do local p=srp.groups.GroupTags[y]if!p then continue end;srp.ui.Create('srp_panel_rounded',function(i)i:SetSize(26,26)i:DockPadding(1,1,1,1)i:SetBackgroundColor(col.transparent)i:AddPanel('DImage',function(z)z:Dock(FILL)z:SetTooltip(p.Name)z:SetMaterial(p.Icon)end)self.Attributes:AddItem(i)end)end;self.Attributes:SetWide(#x*35)self.Attributes:SetPos(0,45)self.Attributes:CenterHorizontal()end;function a:SetupLeaderModel(g)if!cvar.GetValue('srp_groupmdls')then return end;local A=g:GetRanks(true)[1]:GetModel()self.player=self.mdl:AddModel(A,Vector(),Angle(0,180,0))self.hoverAnim=g.id=='JEDI'&&'gesture_bow_original'||'gesture_salute_original'end;function a:PerformLayout(r,s)if IsValid(self.mdl)then self.mdl:SetSize(r,s)self.mdl:SetPos(0,0)end end;function a:Paint(r,s)draw.RoundedBox(6,0,0,r,s,t)if!self.GroupColor then return end;surface.SetDrawColor(self.GroupColor)surface.SetMaterial(d)surface.DrawTexturedRect(0,0,r,s*4)end;vgui.Register('srp_group_recruitment_advert',a,'srp_button_rounded')local a={}function a:Init()self:AddPanel('srp_panel_rounded',function(i)i:SetBackgroundColor(col.midnight_dark)i:DockMargin(10,10,10,5)i:DockPadding(2,2,2,2)i:Dock(TOP)i:SetTall(40)i:AddPanel('srp_button_tagtext_rounded',function(f)f:SetText'Back'f:SetTagFont'SSRPForkAwesome'f:SetTagWidth(36)f:SetTagText(0xf060,true)f:SetWide(110)f:SetContentAlignment(5)f:Dock(LEFT)f:DockMargin(0,0,0,0)f:SetBackgroundColor(col.midnight_light)f:SetHoverColor(col.midnight)f:SetTagBackground(col.midnight_dark)f:LeftClick(function(f)self.Controller:ClosePreview()end)end)i:AddPanel('srp_label',function(v)v:Dock(FILL)v:SetFont'ui_header.r'v:SetText''v:DockMargin(20,0,0,0)self.Title=v end)end)self:AddPanel('srp_panel_rounded',function(i)i:SetBackgroundColor(col.midnight_dark)i:DockMargin(10,5,10,10)i:DockPadding(10,10,10,10)i:Dock(FILL)i:AddPanel('srp_markdown',function(i)i:Dock(FILL)self.Markdown=i end)self.Container=i end)end;function a:Populate(w,g,h)self.Controller=w;self.Group=g;self.Data=h;self.Title:SetText(g:GetName()..' Recruitment Information')self.GroupColor=g:GetAltColor():Copy()self.GroupColor.a=75;if h.Message then self.Markdown:SetMarkdown(h.Message)end;if h.Tryout then self.Container:AddPanel('srp_panel_rounded',function(i)i:Dock(BOTTOM)i:SetBackgroundColor(col.blue)i:DockPadding(2,2,2,2)i:DockMargin(4,4,4,4)i:AddPanel('srp_label',function(v)v:Dock(FILL)v:SetContentAlignment(4)v:SetText'This battalion has an active tryout!'end)i:AddPanel('srp_button_rounded',function(f)f:Dock(RIGHT)f:SetText'Mark'f:SetWide(100)f:DockMargin(0,0,0,0)f:LeftClick(function()if IsValid(h.TryoutEntity)then self.Controller:AimTowards(h.TryoutEntity)end end)end)end)end;if h.Open then self.Container:AddPanel('srp_panel_rounded',function(i)i:Dock(BOTTOM)i:SetBackgroundColor(col.green)i:DockPadding(2,2,2,2)i:DockMargin(4,4,4,4)i:AddPanel('srp_label',function(v)v:Dock(FILL)v:SetContentAlignment(4)v:SetText'This battalion is open to freely join as a cadet!'end)i:AddPanel('srp_button_rounded',function(f)f:Dock(RIGHT)f:SetText'Join'f:SetWide(100)f:DockMargin(0,0,0,0)f:LeftClick(function()if IsValid(self.Controller)then self.Controller:JoinOpenBattalion(self.Group)end end)end)end)end;self:AddPanel('srp_group_recruitment_advert',function(i)i:Populate(nil,g,h)i:Dock(LEFT)if i.player then i.player:SetPos(Vector(0,0,0))i.mdl:SetCamPos(Vector(-35,0,43))i.mdl:SetLookAt(Vector(0,0,43))end end)end;vgui.Register('srp_group_recruitment_info',a,'srp_panel')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/groupupgrades_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/groups/ui/webhooks/webhooks_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hacking/z_reaction_sh.lua:
local a={Name='Reactionary Wire'}a.Difficulties={easy={Name='Easy',Color=col.green,Settings={Countdown=10,FailAttempts={name='Fail Attampts',val=4},W={name='Bar Width',val=.1},Speed={name='Move Speed',val=.5}}},normal={Name='Normal',Color=col.orange,Settings={Countdown=8,FailAttempts={name='Fail Attampts',val=2},W={name='Bar Width',gen=srp.hacking.RandPerc,args={10,15}},Speed={name='Move Speed',val=1}}},hard={Name='Hard',Color=col.red,Settings={Countdown=4,FailAttempts={name='Fail Attampts',val=2},W={name='Bar Width',gen=srp.hacking.RandPerc,args={5,8}},Speed={name='Move Speed',val=3}}},hardcore={Name='Hardcore',Color=col.purple,Settings={Countdown=15,FailAttempts={name='Fail Attampts',val=1},W={name='Bar Width',gen=srp.hacking.RandPerc,args={5,12}},Speed={name='Move Speed',val=3.5}}}}function a:Init(b)self.Countdown=8;self.Speed=.01;self.X=0;self.W=0;self.CursorX=0 end;function a:GenerateSettings()return{X=srp.hacking.RandPerc(0,95),W=.05,Countdown=8,FailAttempts=2,Speed=1}end;function a:Start(c)self.X=c.X;self.W=c.W;self.Countdown=c.Countdown;self.Speed=c.Speed;self.StartTime=c.Start;self.EndTime=c.Start+self.Countdown;self.Settings=c||{}if self.X+self.W>1 then self.W=self.W-(self.W-(1-self.X))end;return self.EndTime end;function a:Stop(d)self.Playing=false;if d==srp.hacking.COMPLETED then self:OnSuccess()else self:OnLost()end end;function a:SetupDisplay()end;function a:WriteInput()net.WriteFloat(self.CursorX,32)end;function a:ReadInput()return net.ReadFloat(32)end;function a:IsValidInput(e,f)self.CursorX=f;return self:InZone()end;function a:OnFailedAttempt(g,h)end;function a:OnSuccess()end;function a:OnLost()end;function a:KeyPressed(b,i)if i==KEY_SPACE then srp.hacking.RequestInput(self)end end;function a:KeyReleased(b,j)end;function a:InZone()local k=SERVER&&.03||.02;local l=math.max(0,self.X-k)local m=math.min(1,self.X+self.W+k)return self.CursorX>=self.X&&self.CursorX<=m end;function a:Think(b)self.CursorX=math.abs(math.sin(CurTime()*self.Speed))end;function a:Paint(b,n,o)if!self.StartTime then return end;draw.Box(0,0,n,o,col.grey_dark)local p,q=n*.8,8;local r,s=(n-p)/2,(o-q)/2;draw.Box(r,s,p,q,col.grey)local t=p*self.W;local u=10;local v=s-(u-q)/2;local w=r+p*self.X;local x=self.Difficulties[self.Settings.mode].Color||col.orange;draw.Box(w,v,t,u,x)surface.SetDrawColor(col.grey_dark)surface.DrawOutlinedRect(w,v,t,u,2)local y=p*self.CursorX;local z=self:InZone()local x=z&&col.red||col.grey_light;draw.Box(r+y-2,s-8,4,q+16,x)if z&&(!self.SoundCD||self.SoundCD<CurTime())then chat.PlaySound()self.SoundCD=CurTime()+.5 end end;srp.hacking.RegisterGame('reaction',a)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/highlight_cl.lua:
srp.highlight={}local a={}function srp.highlight.Add(b,c,d)if cvar.GetValue('srp_outlines')then table.insert(a,{ent=b,color=c,mode=d})end end;function srp.highlight.Remove(b)for e=1,#a do if a[e].ent==b then table.remove(a,e)break end end end;hook.Add('SetupOutlines','srp.highlight.RunQueue',function()for e=1,#a do local f=a[e]if IsValid(f.ent)then outline.Add(f.ent,f.color,f.mode)else table.remove(a,e)end end end)hook('OnPhysgunPickup','srp.highlight.AddPhysgunTarget',function(g,h,i)if g==LocalPlayer()then local j=g:GetWeaponColor()srp.highlight.Add(h,Color(j.x*255,j.y*255,j.z*255),outline.MODE_BOTH)end end)hook('OnPhysgunDrop','srp.highlight.RemovePhysgunTarget',function(g,h,i)if g==LocalPlayer()then srp.highlight.Remove(i)end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/interaction/ui/interaction_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/hud/scoreboard/player_card_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/inventory/inventory_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/inventory/ui/inventory_ui.lua:
local a={}local b=Material('materials/galactic/ui/foods/package.png','noclamp smooth')local c={Ammo=0}function a:Init()self:SetSize(734,500)self:SetTitle'Inventory'self:SetCloseCode(KEY_F2)self:DockPadding(0,30,0,0)self:SetBackgroundColor(col.midnight_dark)self:SetBorderColor(col.midnight_dark)self.ItemPanels={}self.EmptyItemPanels={}self:AddPanel('srp_panel',function(d)d:Dock(TOP)d:SetTall(40)d:SetBackgroundColor(col.midnight)d:DockPadding(2,2,2,2)d:AddPanel('ui_checkbox',function(e)e:SetSkin('SUP')e:SetText('')e:Dock(RIGHT)e:SizeToContents()e:DockMargin(0,7,0,0)e.OnChange=function(f,g)self:Search(self.LastSearch||'')end;self.Favourite=e end)d:AddPanel('srp_textinput_rounded',function(d)d:DockMargin(5,5,15,5)d:Dock(RIGHT)d:SetWide(150)d:OnValid(function(h)timer.Create('srp.inventory.Search',0.25,1,function()if!IsValid(self)then return end;local i=(h:GetValue()||''):lower()self:Search(i)end)end)end)d:AddPanel('srp_label',function(j)j:Dock(RIGHT)j:SetText'Search'j:SetFont'ui_header.s'j:SetContentAlignment(6)self.SearchLabel=j end)d:AddPanel('srp_button_tagtext_rounded',function(k)k:SetTagFont'SSRPForkAwesome'k:SetTagText(0xf24e,true)k:SetTagWidth(30)k:SetTagBackground(col.transparent)k:SetFont'ui_header.s'k:DockMargin(10,5,2,5)k:SetWide(140)k:SetContentAlignment(6)k:Dock(LEFT)k:SetText'0/0  'self.Slots=k end)end)self:AddPanel('ui_scrollpanel',function(l)l:Dock(FILL)l:DockMargin(8,5,5,5)srp.ui.Create('srp_grid',function(m)m:Dock(FILL)m:SetSpacing(5,5,false)m:SetAutoHeight(true)m:SetAdjusted(true,true)l:AddItem(m)self.grid=m end)self.Scroll=l end)hook('OnInventoryItemUpdated',self,self.OnInventoryAdded)hook('OnInventoryItemRemoved',self,self.OnInventoryRemoved)hook('OnItemFavouritesLoaded',self,self.UpdateFavourites)hook('OnItemFavourited',self,self.UpdateFavourites)end;function a:UpdateFavourites(n,o)local p=self:Sort()if!n then for q,n in ipairs(p)do if srp.items.IsFavourite(n)&&IsValid(self.ItemPanels[n.name])then self.grid:MoveToFront(self.ItemPanels[n.name])end end;self.grid:InvalidateLayout()end;if IsValid(self.ItemPanels[n.name])&&o then self.grid:MoveToFront(self.ItemPanels[n.name])self.grid:InvalidateLayout()end end;function a:OnRemove()hook.Remove('OnInventoryItemUpdated',self)hook.Remove('OnInventoryItemRemoved',self)hook.Remove('OnItemFavouritesLoaded',self)hook.Remove('OnItemFavourited',self)end;function a:OnInventoryAdded(r,s,t)if r.id!=self.inventory.id then return end;self:UpdateSlots()if self.ItemPanels[s.index]then self.ItemPanels[s.index]:UpdateCell(s)end end;function a:OnInventoryRemoved(r,u)if r.id!=self.inventory.id then return end;self:UpdateSlots()if IsValid(self.ItemPanels[u])then self.ItemPanels[u]:SetEmpty()end end;local v=Color(255,50,50,100)function a:UpdateSlots()local w=table.Count(self.inventory.items)||0;local x=self.inventory:GetMaxSlots()||0;self.Slots:SetText(w..'/'..x..'   ')if w>=x then self.Slots:SetBackgroundColor(v)else self.Slots:SetBackgroundColor(col.midnight_dark)end end;function a:Search(i)self.LastSearch=i;i=i==' '&&''||i;local y=0;for q,d in ipairs(self.grid:GetChildren())do local z=self:Filter(d)if!z then d:SetVisible(false)continue end;if!d.item then y=i==''&&y+1||y;d:SetVisible(i=='')continue end;if str==''||string.find(d.item.name:lower(),i)then d:SetBorderColor(i!=''&&col.white_dark||col.transparent)d:SetVisible(true)y=y+1 else d:SetVisible(false)end end;self.grid:SetAdjusted(y>=8,true)self.grid:InvalidateLayout(true)self.Scroll:InvalidateLayout(true)end;function a:Filter(d)if self.Favourite:GetChecked()then return d.IsFaved&&d.item else return true end end;function a:Sort()return{}end;function a:Populate(r,A)if!r then return end;self:SetLoading(true,.2,'Loading Inventory.')self.childInventory=A;self.inventory=r;self.grid:Clear()local x=r:GetMaxSlots()local B=math.max(x,r.maxindex||0)for C=1,B do local s=r.items[C]srp.ui.Create('srp_inventory_item',function(d)d:SetSize(54,54)d:Populate(C,r,A,x)d:SetItem(s)self.ItemPanels[C]=d;self.grid:AddItem(d)end)end;self:UpdateSlots()end;function a:GetCurrencyName()if self.item.trade then local D=srp.items.Get(self.item.trade).name;return D[#D]=='s'&&D||D..'s'else return LocalPlayer():GetCurrency()end end;function a:GetCurrencyAmount()return self.item.tradeamount||self.item.cost||0 end;function a:GetCurrencyMaterial()return self.item.trade&&srp.items.Get(self.item.trade).icon||b end;function a:Paint(E,F)derma.SkinHook('Paint','Inventory',self,E,F)end;vgui.Register('srp_inventory',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/items/resources/collectables_sh.lua:
srp.collectables=srp.collectables||{}local a={}local b={}function srp.collectables.Add(c,d)d.id=c;d.internal=table.insert(b,d)a[c]=d end;function srp.collectables.Get(c)return a[c]end;function srp.collectables.GetAll(e)return e&&b||a end;function srp.collectables.GetRandom()return b[math.random(1,#b)]end;function srp.collectables.CollectInventoryItem(self,f,g,h)if h>0 then return g:AddInventoryItem(self.Item,self.ItemCount*h)end end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/cuffs_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/jail/cuffs_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/loginrewards/loginrewards_sh.lua:
srp.loginrewards=srp.loginrewards||{}local a={}local b={}local c={}local d={}d.__index=d;debug.getregistry().Milestone=d;function d:SetName(e)self.name=e;return self end;function d:GetName()return self.name end;function d:SetDescription(f)self.description=f;return self end;function d:GetDescription(f)return self.description end;function d:SetIcon(f)self.icon=f;return self end;function d:GetIcon(f)return self.icon end;function d:OnGiveItem(g)self.Give=g;return self end;function d:OnRead(g)self.Read=g;return self end;function d:OnWrite(g)self.Write=g;return self end;function d:Give(h,i)end;function srp.loginrewards.RegisterMilestone(j,k)k=istable(k)&&k||{k}local l={id=j,name=j,days=k}setmetatable(l,d)a[j]=l;for m,i in ipairs(k)do b[i]=l end;l.internal=table.insert(c,l)return l end;function srp.loginrewards.GetTable(n)return n&&c||a end;function srp.loginrewards.GetMilestone(j,n)return n&&c[j]||a[j]end;function srp.loginrewards.ApplyLoginReward(h,i)local o=b[i]if!o then return end;local p,q=o:Give(h,i)if p then return o,q end end;function srp.loginrewards.GetNextMilestone(r)local s;local t;for m,u in ipairs(c)do for m,i in ipairs(u.days)do if i>r&&(!t||i<t)then s=u;t=i end end end;return s,t end;srp.loginrewards.RegisterMilestone('cosmetic',{50,100,150,200,300,400,500}):SetName('Random Cosmetic'):SetIcon(Material('materials/galactic/ui/box_random.png','smooth noclamp mips')):OnGiveItem(function(self,h)local v=cosmetics.Random(h,true)if!v then h:AddMoney(50000,true)return false else cosmetics.Give(h,v.name)return true,v end end):OnWrite(function(self,h,q)net.WriteCosmetic(q)end):OnRead(function(self,h)return net.ReadCosmetic(true)end)srp.loginrewards.RegisterMilestone('cash',{25,75,125,250,350,450,550}):SetName('Cash'):SetIcon(Material('materials/galactic/ui/menu/money-4.png','noclamp')):OnGiveItem(function(self,h)h:AddMoney(20000,true)return true,20000 end):OnWrite(function(self,h,q)net.WriteUInt(q,12)end):OnRead(function(self,h)return{name=net.ReadUInt(12)..' Cash'}end)local w={[7]='SALETOKEN_10',[30]='SALETOKEN_25',[90]='SALETOKEN_25',[180]='SALETOKEN_50',[365]='SALETOKEN_50'}srp.loginrewards.RegisterMilestone('discounts',{7,30,90,180,365}):SetName('Store Discount Token'):SetIcon(Material('materials/galactic/ui/menu/sale.png','noclamp')):OnGiveItem(function(self,h,i)local x=w[i||7]||w[7]local y=srp.items.Get(x)h:AddInventoryItem(y,1,nil,true)return true,y end):OnWrite(function(self,h,y)net.WriteString(y.id)end):OnRead(function(self,h)local y=srp.items.Get(net.ReadString())return{name=y&&y.name||'Unknown'}end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/funcmodules/funcmodule_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/funcmodules/funcmodule_sh.lua:
nw.Register('Gravity'):Write(net.WriteFloat):Read(net.ReadFloat):SetLocalPlayer()srp.AddCommand('gmtogglemodule',function(a)srp.funcmodules.ToggleModule(a,ent)end):SetGM():SetInfoSection('Gamemaster'):SetInfo('Toggles the module you are looking at if the module allows force disabling.')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/mapchange/ui/mapchange_ui.lua:
local a={}local b=col.grey:Copy()b.a=50;function a:Init()self:SetBackgroundColor(col.midnight)self:SetTitle'Change Map'self:SetSize(600,590)self:Center()self:MakePopup(true)self:DockPadding(10,35,2,2)self:AddPanel('srp_textinput',function(c)c:SetBackgroundColor(b)c:DockMargin(0,5,11,5)c:SetTextColor(col.white_dark)c:Dock(TOP)c:OnValid(function(d)local e=d:GetValue()self:Search(e==''&&nil||e)end)self.textbox=c end)self:AddPanel('ui_scrollpanel',function(f)f:Dock(FILL)f:SetSpacing(8,8)f:DockMargin(5,5,5,5)srp.ui.Create('srp_grid',function(g)g:Dock(TOP)g:SetAutoHeight(true)f:AddItem(g)self.Grid=g end)self.scrl=f end)self:AddPanel('srp_button_rounded',function(h)h:Dock(BOTTOM)h:SetText'Cancel Map Change'h:SetBackgroundColor(col.midnight_dark)h:SetHoverColor(col.midnight_light)h:SetTextColor(col.white_dark)h:DockMargin(0,5,11,5)h:LeftClick(function(i)net.Ping'srp.map.StopMapChange'end)end)self.Maps={}self.MapsId={}self:SetLoading(true)self:Populate()net.Ping'srp.map.Blacklists'hook('OnMapBlacklistLoaded',self,self.ShowBlacklists)end;function a:ShowBlacklists(j)self:SetLoading(false)for k,l in pairs(j)do local m=self.MapsId[k]if IsValid(m)then m:SetBlacklisted(l)end end end;function a:Search(n)n=n&&n:lower()for o,m in ipairs(self.Maps)do if n&&n!=''&&!(m.mapname:lower():find(n)||m.mapid:find(n))then m:SetVisible(false)else m:SetVisible(true)end end;self.scrl:InvalidateLayout(true)end;function a:Populate()self.Grid:Clear()local p=srp.map.maps;local q=1;local r=LocalPlayer():IsSeniorGamemaster()for k,s in SortedPairsByMemberValue(p,'name',false)do srp.ui.Create('srp_maprow',function(m)m:Populate(r,k,s)self.Grid:AddItem(m)self.MapsId[k]=m;self.Maps[q]=m end)q=q+1 end;self.scrl:InvalidateLayout()end;vgui.Register('srp_mapchange',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/map/spawnpoints/spawnpoints_sh.lua:
srp.spawn=srp.spawn||{}local a={}local b={}local c={}local function d(e,f)local g=e:GetGroup()if f.type=='ALL'||f.type==e:GetAllegianceID()||g&&f.type==g.id then if f.canuse==nil||f:canuse(e)==true then return true else return false end else return false end end;function srp.spawn.AddSpawnPoints(h,i)if info.Map==h then srp.spawn.points=i end end;function srp.spawn.AddCustomPoint(j,k,i)if i.map&&info.Map!=i.map then return end;local f=table.Merge({internal=table.Count(a)+1,id=j,type=k,name=i.name||j,pos=Vector(),ang=Angle(),cooldowns={},data=i},i)if SERVER&&f.gridid then f.grid=srp.spawn.grids[f.gridid]end;b[k]=b[k]||{}b[k][j]=f;a[j]=f;return f end;function srp.spawn.RemoveCustomPoint(j)local f=a[j]if f then b[f.type][j]=nil;a[j]=nil end end;function srp.spawn.GetCustomPoint(e,j)local f=a[j]if!f then return end;if d(e,f)then return f end end;function srp.spawn.GetCustomPoints(e,l)local m={}for j,f in pairs(a)do if l&&f.permanent==true then continue end;if d(e,f)then m[j]=f end end;return m end;function srp.spawn.IsClass(e,n)local o=e:GetGroupClass()if!o then return false else for p,j in ipairs(istable(n)&&n||{n})do if j==o.id then return true end end end end;local q={[0]=Vector(1,-1,0),[-45]=Vector(1,-1,0),[-90]=Vector(-1,-1,0),[-135]=Vector(-1,-1,0),[-180]=Vector(-1,1,0),[135]=Vector(-1,1,0),[90]=Vector(1,1,0),[45]=Vector(1,1,0)}srp.AddCommand('setbattalionspawn',function(e,r)if info.Main&&!e:IsRoot()then return end;local g=srp.groups.Get(r)if!g then return end;local s=e:GetAngles():SnapTo('y',45)local t=q[s.y]||q[0]srp.spawn.CreateTempSpawn(g.id,e:GetPos(),t,s)srp.notif.Success(e,4,term.Get('SpawnPointSet'))end):AddParam(cmd.STRING):AddAlias('setspawnpoint'):SetCooldown(5):SetGM():SetInfoSection('Spawns'):SetInfo('Creates a group spawn grid for the given group seeded from your current position and direction.'):SetInfoArgs({'GroupID - The Group Ticker'})srp.AddCommand('setallegiancespawnpoint',function(e,u)if info.Main||!u then return end;local v=srp.allegiance.Get(u:upper())if!v then return end;local s=e:GetAngles():SnapTo('y',45)local t=q[s.y]||q[0]srp.spawn.CreateTempSpawn(v.id,e:GetPos(),t,s)srp.notif.Success(e,4,term.Get('SpawnPointSet'))end):AddParam(cmd.STRING):SetCooldown(5):AddAlias('setfactionspawnpoint'):AddAlias('setteamspawnpoint'):SetInfoSection('Spawns'):SetInfo('Creates an allegiance spawn grid for the given allegiance seeded from your current position and direction.'):SetInfoArgs({'AllegianceID - The Allegiance'}):SetGM()srp.AddCommand('removespawnpoint',function(e,j)srp.spawn.RemoveTempSpawn(j)srp.notif.Success(e,4,term.Get('SpawnPointRemoved'))end):AddParam(cmd.STRING):SetCooldown(2):SetGM():SetInfoSection('Spawns'):SetInfo('Removes a spawn grid.'):SetInfoArgs({'ID - The Group/Allegiance Ticker'})hook('OnSpawnsGenerated',function()for w,i in pairs(b)do for j,f in pairs(i)do if f&&f.gridid then local x=srp.spawn.grids[f.gridid]a[j].grid=x;b[w][j].grid=x end end end end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/npc/npcs_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/player/player_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/polling/polls_cl.lua:
srp.polls=srp.polls||{}srp.polls.pollurl='ssrp/'..info.WebID..'/polls/'local a={}function srp.polls.LoadPolls()ba.http.FetchJson(srp.polls.pollurl..LocalPlayer():SteamID(),function(b)hook.Run('OnPollsLoaded',b)end,function()hook.Run'OnPollsFailed'end)end;function srp.polls.GetAll()return a end;function srp.polls.OpenMenu(c)srp.ui.Create('srp_pollcontainer',function(d)d:SetSize(720,500)d:MakePopup()d:Center()end)end;net('srp.polls.RequestVote',function()local e,f=net.ReadUInt(16),net.ReadUInt(4)if!a[e]then return end;local g=a[e]g.voted=true;g.count=(g.count||0)+1;g.options[f].count=(g.options[f].count||0)+1;hook.Run('OnPollVoted',g,f)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/polling/ui/poll_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/polling/ui/pollcontainer_ui.lua:
local a={}function a:Init()self:SetTitle'The Poll Booth'self:DockPadding(0,30,0,0)self:SetBackgroundColor(col.midnight_dark)self:AddPanel('srp_panel_rounded',function(b)b:Dock(TOP)b:SetTall(40)b:DockPadding(4,4,4,4)b:DockMargin(10,10,10,5)b:SetBackgroundColor(col.midnight_light)b:AddPanel('srp_label',function(c)c:Dock(FILL)c:SetFont'ui_label.r'c:SetText'Help contribute to the server by giving your vote on certain issues or topics.'c:SetWrap(true)end)end)self:AddPanel('ui_scrollpanel',function(d)d:Dock(FILL)srp.ui.Create('srp_grid',function(e)e:Dock(TOP)e:SetAutoHeight(true)e:SetSpacing(5,5,true)d:AddItem(e)self.grid=e end)self.scroll=d end)self:Refresh()hook('OnPollsLoaded',self,self.Populate)hook('OnPollsFailed',self,self.OnFailed)end;function a:Refresh()self:SetLoading(true)srp.polls.LoadPolls()end;function a:Populate(f)self:SetLoading(false)for g,h in SortedPairsByMemberValue(f,'endtime',true)do srp.ui.Create('srp_poll',function(b)b:Populate(h)b:SetWide(700)self.grid:AddItem(b)end)end;self.scroll:InvalidateLayout(true)end;function a:OnFailed()self:SetLoading(false)chat.AddText(col.white,'Failed to load poll information.')end;function a:OnRemove()hook.Remove('OnPollsLoaded',self)hook.Remove('OnPollsFailed',self)end;vgui.Register('srp_pollcontainer',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/quests/ui/quest_step_ui.lua:
local a={}local b=Color(15,15,15,200)function a:Init()self:SetTall(4)self:DockMargin(0,0,0,0)self:DockPadding(5,5,5,5)self:SetBackgroundColor(b)self.Objectives={}self:AddPanel('srp_panel',function(c)c:SetTall(35)c:Dock(TOP)c:DockPadding(0,0,0,0)c:SetBackgroundColor(col.transparent)c:AddPanel('srp_label',function(d)d:Dock(LEFT)d:SetWide(35)d:SetText''d:SetFont'ui_header.s'd:DockPadding(0,0,0,0)d:DockMargin(0,0,0,0)d:SetContentAlignment(5)d:SetBackgroundColor(col.blue)self.QuestStep=d end)c:AddPanel('srp_label',function(d)d:Dock(FILL)d:SetText''d:SetFont'ui_header.s'd:DockPadding(0,0,0,0)d:DockMargin(10,0,0,0)self.Title=d end)self.InfoContainer=c end)self:AddPanel('srp_label',function(d)d:Dock(TOP)d:SetTall(20)d:SetText''d:SetFont'ui_header.s'd:DockPadding(0,0,0,0)d:DockMargin(4,0,4,0)d:SetWrap(true)d:SetContentAlignment(7)self.Description=d end)hook('OnQuestEnded',self,self.OnQuestEnded)end;function a:OnQuestEnded(e)if self.Quest.instanceid!=e.instanceid then return end;for f,c in pairs(self.Objectives)do if IsValid(c)then c:ForceObjectiveCompleted()end end end;function a:Populate(e,g)self:Clear()self.Quest=e;self.Daily=e:GetType()==srp.quests.TYPE_DAILY;self.Step=g;self:SetAlpha(0)self:AlphaTo(255,0.2,0)local h=srp.invasion.FormatString(g:GetName(),g.internalData)local i=srp.invasion.FormatString(g:GetDescription(),g.internalData)self.QuestStep:SetText(g.stepid)self.Title:SetText(h)if self.Daily then self.InfoContainer:SetTall(0)self.InfoContainer:SetVisible(false)self:DockPadding(5,5,5,5)self:SetBorderColor(col.midnight_light)else self.InfoContainer:SetTall(35)self.InfoContainer:SetVisible(true)self:DockPadding(5,5,5,5)end;if i then self.Description:SetText(i)self.Description:SetVisible(true)else self.Description:SetText''self.Description:SetVisible(false)end;self:DisplayObjectives()self:AddPanel('srp_queststep_voting',function(c)c:Dock(TOP)c:SetTall(1)c:SetVisible(false)c:Populate(self,self.Quest,self.Step)self.Voting=c end)end;function a:DisplayObjectives()for j,k in ipairs(self.Step:GetObjectives(true))do self:DisplayObjective(k)end;self:UpdateHeight()end;function a:UpdateHeight(l)local m=self.Daily&&10||35+8+12;local n=0;if IsValid(self.Description)then local o=string.Wrap(self.Description:GetText()||'','ui_header.s',355)n=20*#o;self.Description:SetTall(n)end;m=m+#self.Objectives*38+n+(l||0)self:SetTall(m)self:HeightChanged(m)end;function a:DisplayObjective(p)self:AddPanel('srp_quest_objective',function(c)c:Dock(TOP)c:Populate(self.Quest,self.Step,p)table.insert(self.Objectives,c)end)end;function a:Clear()for f,c in pairs(self.Objectives)do c:Remove()end;self.Objectives={}self.Description:SetText''end;function a:HeightChanged(q)end;vgui.Register('srp_quest_step',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/realtimestrategy/ui/configs/rtscfg_ui.lua:
local a={}local b=Color(255,255,255,80)function a:Init()self:SetTitle'Config'self:SetSize(400,405)self:SetAlpha(0)self:SetBackgroundColor(col.white_dark)self.NextBindClose=CurTime()+1;self.fields={}self:AddPanel('ui_scrollpanel',function(c)c:Dock(FILL)self.container=c end)self:AddPanel('srp_panel',function(d)d:Dock(BOTTOM)d:DockPadding(2,2,2,2)d:DockMargin(0,0,0,0)d:SetTall(30)d:SetBackgroundColor(b)d:AddPanel('srp_button',function(e)e:SetText'Apply'e:SetBackgroundColor(col.grey_dark)e:SetHoverColor(col.black)e:Dock(RIGHT)e:DockMargin(2,2,2,2)e:LeftClick(function(d)self:ApplySettings()end)end)d:AddPanel('srp_button',function(e)e:SetText'Close'e:SetBackgroundColor(col.red_dark)e:SetHoverColor(col.red)e:Dock(LEFT)e:DockMargin(2,2,2,2)e:LeftClick(function(d)self:FadeClose()end)end)end)self:AddSetting('File Name','Save name to easily identify the file in the filesystem.','srp_textinput',function(d)d:SetText(math.ceil(CurTime()*1000))d:SetValidation("^[A-z0-9_%-]+$")d:SetMinMax(1,10)end)self.close:LeftClick(function()self:FadeClose()end)end;function a:AddSetting(f,g,h,i)srp.ui.Create('srp_label',function(j)j:SetText(f)j:SetFont'ui_header.s'j:SetTall(30)j:SetContentAlignment(1)j:SetTextColor(col.grey)self.container:AddItem(j)end)srp.ui.Create('srp_label',function(j)j:SetText(g)j:SetFont'ui_label.r'j:SetTall(18)j:SetContentAlignment(7)j:SetTextColor(col.grey_light)self.container:AddItem(j)end)local d=srp.ui.Create(h,function(k)i(k)self.fields[f:Replace(' ','')]=k;self.container:AddItem(k)end)return d end;function a:Populate(l,m,n,o)local p,q=l:LocalToScreen(0,0)local r,s=l:GetSize()local t=(ScrW()-400)*.5;self:SetPos(t,q)self:MoveTo(t,q-self:GetTall()-180,.2,0,-1)self:AlphaTo(255,.4,0)self.Action=n;self.ConfigDirectory=srp.rts.directory..'/'..self.Action.id..'/'self:OnConfigLoaded(n,o||{})file.CreateDir(self.ConfigDirectory)self:MakePopup()self:MoveToFront()end;function a:ApplySettings(u)local v=self:GetFileName()if!v then return end;local w=self.ConfigDirectory..v..'.dat'if!u&&file.Exists(w,'DATA')then end;local x=self:GetSaveData()if!x then return end;local y={name=self.fields.FileName:GetText(),fileid=v,creation=os.time(),author=LocalPlayer():SteamID64(),data=x}file.Write(w,util.TableToJSON(y))if self:_OnSaved(self.Action,y)then self:FadeClose()end end;function a:GetFileName()local z=self.fields.FileName:GetText()z=(!z||z=='')&&math.ceil(CurTime()*1000)||z;if!self.FileName then self.FileName=z..'_'..math.ceil(CurTime()*1000)self.fields.FileName:SetDisabled(true)self.fields.FileName:SetBackgroundColor(col.white_dark)self.fields.FileName:SetBorderColor(col.white_dark)self.fields.FileName:SetTextColor(col.grey_light)end;return self.FileName end;function a:GetSaveData()end;function a:OnSaved(A)self._OnSaved=A;return self end;function a:_OnSaved(m,B)return true end;function a:FadeClose()self:AlphaTo(0,.15,0,function()if IsValid(self)then self:Remove()end end)end;vgui.Register('srp_rtscfg',a,'srp_window')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/seasonal/seasonal_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/sky/sky_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/server/sounds/sounds_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/simroom/ui/simroom_display_ui.lua:
local a=1.4;local b={}function b:Init()self.Nodes={}self:AddPanel('srp_panel_rounded',function(c)c:SetSize(500,256)c:Center()c.Paint=function(d,e,f)if!d.Material then return end;surface.SetMaterial(d.Material)surface.SetDrawColor(255,255,255)surface.DrawTexturedRect(0,0,e,f)end;self.Map=c end)end;function b:Populate(g,h)self.Simroom=g;local i=g.MaterialScale||a;local e=g.Background:Width()*i;local f=g.Background:Height()*i;self.Map.Material=g.Background;self.Map:SetSize(e,f)end;function b:NewNode()if#self.Nodes>=self.Simroom.MaxSpaws then return end;return self.Map:AddPanel('srp_simroom_node',function(j)self.Nodes[#self.Nodes+1]=j;j:Populate(self.Simroom,self)j:SetSize(24,24)j:SetPos(26*#self.Nodes,10)end)end;function b:RemoveLastNode()local j=table.remove(self.Nodes,#self.Nodes)if IsValid(j)then j:Remove()end end;function b:RemoveNode(j)table.RemoveByValue(self.Nodes,j)j:Remove()end;function b:ClearNodes()for k,j in pairs(self.Nodes)do if IsValid(j)then j:Remove()end end;self.Nodes={}end;function b:GetPosition(j)return j:GetPosition()end;function b:Build()local l={}for k,j in pairs(self.Nodes)do local m=j:Build()if m then table.insert(l,m)end end;return l end;function b:Load(m)local j=self:NewNode()if IsValid(j)then j:Load(m)end end;function b:PerformLayout(e,f)if IsValid(self.Map)then self.Map:Center()end end;vgui.Register('srp_simroom_display',b,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/talents/meta_sh.lua:
local a=36000;local b=info.WebID..'_sessionxp:'function PLAYER:SetPassivesDisabled(c)self.DisablePassives=c;net.Start'srp.talents.DisablePassives'net.WriteBool(c)if SERVER then else net.SendToServer()end end;function PLAYER:GetPassivesDisabled()return self.DisablePassives end;function PLAYER:GetXPBoost()if self:IsVIPPlus()then return srp.crowdfunder.IsExtendedBoost()&&3.75||1.75 elseif self:IsVIP()then return srp.crowdfunder.IsExtendedBoost()&&3.5||1.5 else return srp.crowdfunder.IsExtendedBoost()&&3||1 end end;function PLAYER:GetSessionPercent()return 1+math.Min((os.time()-(self.joined||0))/a,1)end;function PLAYER:AdjustSessionXP(d)return math.ceil(d*self:GetSessionPercent())end;function PLAYER:ApplyTalent(e,f,g)local h=srp.talents.GetTalent(e)local i=self:GetTalentValue(e)if hook.Run('CanApplyTalent',self,e)==false then return end;if h&&h.ApplyTalent then if!f&&h.ApplyNow==false then elseif h.key=='weapon'then local j=h.Filter&&h.Filter(h,self)||self:GetWeapons()for _,k in ipairs(j)do if IsValid(k)&&(h.force||k.HasTalentStats)then local l,m=hook.Run('OnWeaponAppliedTalent',self,k,h,i)if l!=false then h.ApplyTalent(h,self,k,math.max(l||i,0),m)end end end elseif h.key then if IsValid(g)&&g.HasTalentStats then local l,m=hook.Run('OnEntityAppliedTalent',self,g,h,i)if l!=false then h.ApplyTalent(h,self,g,math.max(l||i,0),m)end end else local l,m=hook.Run('OnPlayerAppliedTalent',self,h,i)if l!=false then h.ApplyTalent(h,self,math.max(l||i,0),m)end end end end;function PLAYER:SaveSessionXP(n)if!self.joined then return end;local o=self:HasUpgrade('boost_extender')&&28800||900;srp.Redis:SetEx(b..self:SteamID64(),o,self.joined,n)end;function PLAYER:LoadSessionXP(n)local e=self:SteamID64()srp.Redis:Get(b..e,function(p,q)if IsValid(self)then self.joined=tonumber(q)||os.time()n(_,q)end end)end;function PLAYER:AddTalentXP(d,e,r,s,t)if e==''||!self.TalentXP then print'Tried to set XP on someone who has no TalentXP table or id is empty!!'print(self:CharacterID(),e,d)return end;e=e||'default'local u=self:GetTalentLevel(e)local v=self:GetTalentXP(e)if!u||!srp.HasActivePlayers()then return end;local w=u>=srp.talents.maxlevel;if!t then d=d*self:GetXPBoost()d=self:AdjustSessionXP(d)d=info.Dev&&d||d*(1+self:GetUpgradeCount('skill_bst_5')*5/100)d=d*(1+self:GetImprintValue('xpincr',0))if self:IsAFK()then d=d*(1+self:GetImprintValue('couchpotatovet',0))end;if srp.relationship.IsOnline(self)then d=d*1.15 end;d=math.ceil(d)end;local x=srp.talents.GetLevel(u+1,e)local y=v+d;local z=y>=x;self.TalentXP[e]=y;if!w then if z then self.TalentLevel[e]=(self.TalentLevel[e]||0)+1;self:UpdatePassiveTalents(e,self.TalentLevel[e])hook.Run('OnPlayerLeveledUp',self,e,self.TalentLevel[e],y,r)end end end;function PLAYER:AddTalentXPCD(d,e,A)if!A then A=e;e='default'end;if self.TalentCooldown[e]&&self.TalentCooldown[e]>CurTime()then return end;self:AddTalentXP(d,e)self.TalentCooldown[e]=CurTime()+A end;function PLAYER:SetTalentXP(d,e,r)if CLIENT then e=e||'default'end;self.TalentXP[e]=d;self.TalentLevel[e]=srp.talents.GetLevelFromXP(d,e)self:UpdatePassiveTalents(e,self.TalentLevel[e])end;function PLAYER:TalentLevelUp(e,r)self:SetTalentLevel(self.TalentLevel[e]+1,e,r)end;function PLAYER:SetTalentLevel(B,e,r,C)e=e||'default'local d=srp.talents.GetLevel(B)self.TalentXP[e]=d;self.TalentLevel[e]=B;self:UpdatePassiveTalents(e,B)end;function PLAYER:SetTalentValue(e,i)self.Talents=self.Talents||{}self.TalentPercentage=self.TalentPercentage||{}self.Talents[e]=i;self.TalentPercentage[e]=i/100 end;function PLAYER:AddTalentValue(e,i)self.Talents=self.Talents||{}self.TalentPercentage=self.TalentPercentage||{}self.Talents[e]=(self.Talents[e]||0)+i;self.TalentPercentage[e]=self.Talents[e]/100 end;function PLAYER:GetTalentValue(e,D)if hook.Run('CanApplyTalent',self,e)==false then return D||0 end;return self.Talents&&self.Talents[e]||D||0 end;function PLAYER:GetTalentPercentage(e,D)if hook.Run('CanApplyTalent',self,e)==false then return 0 end;return self.TalentPercentage&&self.TalentPercentage[e]||D||0 end;function PLAYER:IsTalentSelected(e)if hook.Run('CanApplyTalent',self,e)==false then return false end;return self.Talents&&(self.Talents[e]&&self.Talents[e]!=0)end;function PLAYER:GetTalentPassive(e,D)if hook.Run('CanApplyTalent',self,e)==false then return D||0 end;if self.DisablePassives then return D||0 end;return self.TalentPassives&&self.TalentPassives[e]||D||0 end;function PLAYER:IsTalentPassiveSelected(e)if hook.Run('CanApplyTalent',self,e)==false then return false end;if self.DisablePassives then return false end;return self.TalentPassives&&(self.TalentPassives[e]&&self.TalentPassives[e]!=0)end;function PLAYER:SelectTalent(E,B,e)self.TalentSelect=self.TalentSelect||{}self.TalentSelect[E]=self.TalentSelect[E]||{}self.TalentSelect[E][B]=e end;function PLAYER:GetTalentXP(e)e=e||'default'return self.TalentXP&&self.TalentXP[e]||0 end;function PLAYER:GetTalentLevel(e)e=e||'default'return self.TalentLevel&&self.TalentLevel[e]||0 end;function PLAYER:GetSelectedTalent(e,B)return self.TalentSelect&&self.TalentSelect[e]&&self.TalentSelect[e][B]end;function PLAYER:GetSelectedTalents()return self.TalentSelect end;function PLAYER:UpdatePassiveTalents(F,B)self.TalentPassives=self.TalentPassives||{}B=B||self:GetTalentLevel(F)local G=srp.talents.Get(F)if!G||!G.passives then return end;for H=1,B do local I=G.passives[H]if!I then continue end;for e,J in pairs(I)do self.TalentPassives[e]=J end end end;function PLAYER:SyncTalents()srp.talents.SyncAll(self)end;function PLAYER:Heal(K,L,M)if self.sparring then return end;local N=1+self:GetTalentValue('healingeffects')/100;local K=K*N;if L then local O=math.max(self:GetMaxHealth()+(M||0),self:Health())self:SetHealth(math.Clamp(K+self:Health(),0,O))else self:SetHealth(self:Health()+K)end end;function PLAYER:AOEHeal(P,K,L,M,n)local Q=player.GetAll()local R=self:GetPos()local S=0;for H=1,#Q do local pl=Q[H]if!IsValid(pl)||pl==self||pl.sparring then continue end;if R:Distance(pl:GetPos())<=P then pl:Heal(K,L,M)S=S+1;local T=EffectData()T:SetOrigin(pl:GetPos()+Vector(0,0,50))T:SetEntity(pl)util.Effect('rb655_force_heal',T,true,true)end end;return S end;hook('PlayerEntityCreated',function(pl)pl:LoadSessionXP(function()net.Start'srp.talents.SyncSession'net.WriteUInt(pl.joined,32)net.Send(pl)end)end)
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/training_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/training/ui/trainingbase_ui.lua:
local a={Paint=function()end}local b=CurTime()local c=col.blue:Copy()c.a=200;local d=Color(0,0,0,200)local e=col.blue:Copy()e.a=200;local f=col.red:Copy()f.a=150;local g=Material('materials/galactic/ui/menu/forums.png','smooth noclamp nomips')local h=Material('materials/galactic/ui/menu/trello.png','smooth noclamp nomips')local i=Material('materials/galactic/ui/menu/discord.png','smooth noclamp nomips')local j=Color(10,10,10,220)local k=.15;local l=.1;function a:Init()self.alpha=150;self.padding=ScrW()*k;self.paddingup=ScrH()*l;self:DockPadding(self.padding,self.paddingup,self.padding,self.paddingup)self:DockMargin(0,0,0,0)end;function a:Populate(m)end;function a:SetupPanels()end;function a:CreateButton(n)if!self.step then return end;local o=self.step.id==1;local p=self.step.last;local q=p&&550+(o&&0||100)||350;self.controlwidth=q;local r=LocalPlayer():IsTrained()&&1||self.step.timing||5;self:AddPanel('srp_panel',function(s)s:SetSize(q,40)s:DockPadding(0,0,0,0)s:DockMargin(0,0,0,0)s:SetBackgroundColor(col.white_dark)if!o then s:AddPanel('srp_button',function(t)t:Dock(LEFT)t:SetSize(100,40)t:SetText('PREVIOUS')t:SetBackgroundColor(d)t:SetBorderColor(col.white_dark)t:DockMargin(0,0,0,0)t:MoveToFront()t:SetDisabled(true,1)t:LeftClick(function(u)if b>CurTime()then return end;b=CurTime()+(info.Dev&&0.2||5)self:Previous()end)end)end;if p then s:AddPanel('srp_training_rating',function(s)s:SetWide(q-200)s:Dock(RIGHT)self.rating=s end)else s:AddPanel('srp_label',function(s)s:SetText'You may continue's:Dock(LEFT)s:SetWide(q-200)s:SetTextColor(col.grey_dark)s:SetContentAlignment(5)self.help=s end)end;s:AddPanel('srp_button',function(t)t:Dock(FILL)t:SetSize(100,40)t:SetText(p&&'FINISH'||'CONTINUE')t:SetBackgroundColor(d)t:SetBorderColor(col.white_dark)t:DockMargin(0,0,0,0)t:MoveToFront()t:SetDisabled(true,r)t:LeftClick(function(u)if p then self:Finish()else self:Next()end end)if self.step.timing!=false then local v=r;local w=CurTime()+v;t.Paint=function(x,y,z)surface.SetDrawColor(0,0,0,200)surface.DrawRect(0,0,y,z)surface.SetDrawColor(e)local A=CurTime()local B=w-A;local C=math.Clamp(B/v,0,1)surface.DrawRect(0,0,y-y*C,z)if self.help then local D=string.FormattedTime(B,'%02i:%02i')self.help:SetText(B>0&&'You may proceed in '..D||'You may now proceed.')end end end;self.backbtn=t end)s:SetPos((ScrW()-q)*(self.step.buttonoffset||.5),ScrH()*(n||.85))end)if!p then local E=LocalPlayer():IsTrained()self:AddPanel('srp_button',function(t)t:SetSize(110,25)t:SetText(E&&'CLOSE'||'DISCONNECT')t:SetBackgroundColor(f)t:SetBorderColor(f)t:SetHoverColor(f)t:DockMargin(0,0,0,0)t:MoveToFront()t:SetDisabled(true,.5)t:SetPos((ScrW()-110)*.5,ScrH()-26)t:LeftClick(function(u)if E then srp.training.End()else srp.notif.Confirm({title='Confirm',sub_text='Are you sure you want to disconnect?',header_color=col.red,callback=function(F)RunConsoleCommand('disconnect')end})end end)end)else self:CreateSocials()end;return self.backbtn end;function a:CreateSocials()self:AddPanel('srp_panel',function(s)s:SetSize(self.controlwidth,45)s:SetBackgroundColor(col.white_dark)local G=(self.controlwidth-12)/3;s:AddPanel('srp_button_tag',function(t)t:SetFont'ui_label.rb't:SetText'Forums't:SetMaterial(g)t:Dock(LEFT)t:SetWide(G)t:DockMargin(2,2,2,2)t:SetContentAlignment(4)t:SetBackgroundColor(j)t:LeftClick(function()gui.OpenURL('https://forum.superiorservers.co')end)end)s:AddPanel('srp_button_tag',function(t)t:SetText'Discord't:SetFont'ui_label.rb't:SetMaterial(i)t:Dock(FILL)t:DockMargin(2,2,2,2)t:SetContentAlignment(4)t:SetBackgroundColor(j)t:LeftClick(function()gui.OpenURL(info.Discord)end)end)if info.Trello then s:AddPanel('srp_button_tag',function(t)t:SetFont'ui_label.rb't:SetText'Trello't:SetContentAlignment(4)t:SetMaterial(h)t:Dock(RIGHT)t:SetWide(G)t:DockMargin(2,2,2,2)t:SetBackgroundColor(j)t:LeftClick(function()gui.OpenURL(info.Trello)end)end)end;s:SetPos((ScrW()-self.controlwidth)/2,ScrH()*.85-50)end)end;function a:Next()if!self.donext then self.donext=true;srp.training.NextStep()end end;function a:Previous()srp.training.PreviousStep()end;function a:Finish()if LocalPlayer():IsTrained()then srp.training.End()return end;net.Start'srp.training.Finish'net.SendToServer()end;function a:Paint(y,z)surface.SetDrawColor(0,0,0,self.alpha)surface.DrawRect(0,0,y,z)end;vgui.Register('srp_training_base',a,'srp_panel')local a={}function a:Init()self:SetBackgroundColor(col.transparent)self:DockPadding(0,0,0,0)self:DockMargin(0,0,0,0)self:AddPanel('srp_label',function(H)H:Dock(FILL)H:SetText'Do you prefer this over manual training?'H:SetTextColor(col.grey_dark)H:SetContentAlignment(6)end)self:AddPanel('srp_button',function(t)t:Dock(RIGHT)t:SetText'No't:SetWide(50)t:SetBackgroundColor(col.red_dark)t:SetHoverColor(col.red)t:SetBorderColor(col.transparent)t:SetTextColor(col.white)t:DockMargin(0,0,0,0)t:LeftClick(function(u)self:Rate(false)end)self.dislike=t end)self:AddPanel('srp_button',function(t)t:Dock(RIGHT)t:SetText'Yes't:SetWide(50)t:SetBackgroundColor(col.green_dark)t:SetHoverColor(col.green)t:SetBorderColor(col.transparent)t:SetTextColor(col.white)t:DockMargin(2,0,0,0)t:LeftClick(function(srp)self:Rate(true)end)self.like=t end)hook('OnTrainingRated',self,self.OnRatingGiven)end;function a:Rate(x)self.like:SetDisabled(true,1)self.dislike:SetDisabled(true,1)net.Start'srp.training.Rate'net.WriteBool(x)net.SendToServer()end;function a:OnRatingGiven(x)if x then self.like:SetBackgroundColor(col.green)self.dislike:SetBackgroundColor(col.red_dark)else self.like:SetBackgroundColor(col.green_dark)self.dislike:SetBackgroundColor(col.red)end end;function a:OnRemove()hook.Remove('OnTrainingRated',self)end;vgui.Register('srp_training_rating',a,'srp_panel_rounded')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/titles_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/triumphs/ui/triumpheffect_ui.lua:
local a={}function a:Init()self:SetParent(self)self:Dock(FILL)self:DockMargin(0,0,0,0)self:SetBackgroundColor(col.grey_dark)self:SetHoverColor(col.grey)self:SetTextColor(col.white)self:OnValidate(function(b,c,d)if d.id==0 then return true else return srp.titles.HasEffectAccess(LocalPlayer(),d.id)end end)hook('OnStoreItemPurchased',self,function(e,d)if string.find(d.Upgrade.UID,'bundle_')then e:SetCvar(self.Cvar)end end)end;function a:OnRemove()hook.Remove('OnStoreItemPurchased',self)end;function a:SetCvar(f)self:DockPadding(5,5,5,5)self:SetTall(70)self.Cvar=f;self:Clear()self:AddOption('No Title Effect',{id=0},true)local g=self.Cvar:GetValue()||0;local h=srp.titles.GetAllEffects()local i=h[g]&&h[g].Name||'None'for j,k in ipairs(h)do local l=srp.titles.HasEffectAccess(LocalPlayer(),j)self:AddOption(k.Name,{id=j,access=l},{text=l&&col.white||col.grey_dark,icon=k.Icon},i==k.Name)end;self:OnSelect(function(b,c,d)self.Cvar:SetValue(d.id)self.SelectedID=d.id;net.Start'srp.titles.SetEffect'net.WriteUInt(d.id,8)net.SendToServer()end)end;vgui.Register('srp_triumphtitle_effect',a,'srp_dropdown')
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/trivia/trivia_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/tutorial/tips_cl.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/voice/voice_sh.lua:
local a=176400;srp.AddCommand('setvoicerange',function(b,c)local d=b:GetGroupRank()local e=d&&d:HasPermission'officer'||b:IsTrialGamemaster()||b:IsEventCharacter()c=c||1;b.voicerange=a*math.Clamp(c,.1,e&&2.5||1)srp.notif.Success(b,2,term.Get('VoiceRangeIncreased'),b.voicerange)end):AddParam(cmd.FLOAT,cmd.OPT_OPTIONAL):SetInfoSection('Voice'):SetInfo('Sets your voice range multiplier. Officers can increas this beyond 1 up to 2.5. Non-officers can only go from 0 to 1.'):SetInfoArgs({'Range - Distance multiplier'})srp.AddCommand('toggleglobalvoice',function(b)b.GlobalVoice=!b.GlobalVoice;srp.notif.Success(b,2,term.Get('VoiceRangeSetGlobal'),b.GlobalVoice==true&&'Enabled'||'Disabled')end):SetInfoSection('Voice'):SetInfo('Toggles between normal and global voice. Everyone can hear you when its global.').CanRun=function(self,b)local f=b:GetGamemasterID()||0;return info.Main&&f>3||f>1||false end
--addons/!lpakr_out/gamemodes/srp_base/gamemode/modules/weapons/ui/attachmentitem_ui.lua:
local a={}function a:Init()self:SetBackgroundColor(col.black)self:SetBorderColor(col.grey)self:DockPadding(2,2,2,2)self:AddPanel('srp_panel',function(b)b:DockMargin(0,0,0,0)b:DockPadding(0,0,0,0)b:SetBackgroundColor(col.transparent)b:Dock(FILL)b:AddPanel('srp_label',function(c)c:SetText'Weapon Name'c:Dock(TOP)c:SetFont'ui_label.l'c:SetContentAlignment(4)self.name=c end)b:AddPanel('srp_label',function(c)c:SetText'Description'c:Dock(FILL)c:SetFont'ui_label.b'c:SetContentAlignment(7)self.description=c end)end)self:AddPanel('srp_button',function(d)d:SetWide(50)d:Dock(RIGHT)d:DockMargin(0,0,0,0)d:SetFont'SSRPForkAwesome'd:SetText'z'd:SetBackgroundColor(Color(50,250,50,100))d:SetHoverColor(Color(50,150,50,100))d:LeftClick(function()self:Select()end)self.button=d end)self:AddPanel('srp_label',function(c)c:SetText'0 USD'c:Dock(RIGHT)c:SetFont'ui_label.b'c:SetContentAlignment(7)self.cost=c end)end;function a:Select(e)hook.Run('OnAttachmenMenuRequestPreview',self.slot,self.attachment,e)end;function a:Populate(f,g,h,i,j)local k=LocalPlayer():GetAllegiance():GetCurrency()self.name:SetText(i.Name)self.description:SetText(i.Description||'No Description')self.cost:SetText(i.Cost&&i.Cost..' '..k||'FREE')self.slot=h;self.attachment=i;if j then self:Select(true)end end;vgui.Register('srp_attachmentitem',a,'srp_panel')
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/droideka/droideka_cl.lua:
local a={Sound('galactic/droideka/droideka_walk_01.mp3'),Sound('galactic/droideka/droideka_walk_02.mp3'),Sound('galactic/droideka/droideka_walk_03.mp3'),Sound('galactic/droideka/droideka_walk_04.mp3'),Sound('galactic/droideka/droideka_walk_06.mp3'),Sound('galactic/droideka/droideka_walk_07.mp3'),Sound('galactic/droideka/droideka_walk_08.mp3')}sound.Add({name='droideka.rolling',sound='galactic/droideka/droideka_roll_loop.wav',volume=.6,level=75,pitch=100,channel=CHAN_AUTO,loop=true,looping=true})hook('CalcMainActivity',function(b,c)if!b:IsDroidekaRolling()then return end;local d=c:Length2DSqr()if d==0 then return ACT_CROUCHIDLE,-1 else return ACT_GMOD_NOCLIP_LAYER,-1 end end)hook('PlayerFootstep',function(b,e,f,sound,g,h)if b:IsDroideka()then if b:IsDroidekaRolling()then b.DroidekaLooping=b:StartLoopingSound('droideka.rolling')else b.DroidekaStepCount=((b.DroidekaStepCount||0)+1)%#a;EmitSound(a[b.DroidekaStepCount+1],e,b:EntIndex(),CHAN_BODY,g,100,0,100)if b.DroidekaLooping then b:StopLoopingSound(b.DroidekaLooping)b.DroidekaLooping=nil end end;return true end end)hook('PlayerBindPress',function(b,i,j,k)if j&&i=='+reload'then net.Start'droideka.ToggleRoll'net.SendToServer()end end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/activities/starmap/starmap_sh.lua:
srp.starmap=srp.starmap||{}local a={}local b={}local c={}local d={}local e={}local function f()return true end;nw.Register'srp.starmap.status':Write(function(g)net.WriteUInt(g.mapid,15)net.WriteUInt(g.slotid,4)end):Read(function()return{mapid=net.ReadUInt(15),slotid=net.ReadUInt(4)}end):SetGlobal():SetHook('OnStarmapChanged')function srp.starmap.GetCurrentMap()local g=nw.GetGlobal'srp.starmap.status'if!g then return end;local h=srp.starmap.Get(g.mapid)if h then return h,h.Sectors[g.slotid]end end;function srp.starmap.SetCurrentMap(i,j)nw.SetGlobal('srp.starmap.status',{mapid=i,slotid=j})end;function srp.starmap.GetCurrentMap()local k=nw.GetGlobal('srp.starmap.status')if!k then return end;local h=srp.starmap.Get(k.mapid)if h then return h,h.Sectors[k.slotid]else return end end;function srp.starmap.Register(k)k.Map=srp.starmap.GetMapType(k.MapType,false)a[k.id]=k end;function srp.starmap.RegisterSector(h,sector)sector.Sector=srp.starmap.GetSectorType(sector.SectorID,false)h.Sectors[sector.SlotID]=sector end;function srp.starmap.Get(i)return a[i]end;function srp.starmap.Remove(i)a[i]=nil end;function srp.starmap.GetAll()return a end;function srp.starmap.RegisterSectorType(id,g)g.id=id;g.internal=table.insert(e,g)if!g.CanTravel then g.CanTravel=f end;d[id]=g end;function srp.starmap.GetSectorType(id,l)return l&&e[id]||d[id]end;function srp.starmap.GetSectorTypes()return e[id]end;function srp.starmap.RegisterMapType(id,g)g.id=id;g.SectorCount=#g.Sectors;g.internal=table.insert(c,g)if!g.CanTravel then g.CanTravel=f end;b[id]=g end;function srp.starmap.GetMapType(id,l)return l&&c[id]||b[id]end;function srp.starmap.GetMapTypes()return c[id]end;function srp.starmap.ReadMap()local m={id=net.ReadUInt(15),MapType=net.ReadString(),Name=net.ReadString(),Description=net.ReadString(),PermissionMode=net.ReadUInt(2),Color=net.ReadColor(),SteamID=net.ReadString(),Sectors={}}if net.WriteBool()then for n=1,net.ReadUInt(15)do local sector=srp.starmap.ReadSector()m.Sectors[sector.SlotID]=sector end end;return m end;function srp.starmap.WriteMap(h,o)net.WriteUInt(h.id,15)net.WriteString(h.MapType)net.WriteString(h.Name)net.WriteString(h.Description)net.WriteUInt(sector.PermissionMode,2)net.WriteColor(h.Color)net.WriteString(h.SteamID)if o&&h.Sectors then net.WriteBool(true)net.WriteUInt(table.Count(h.Sectors),15)for id,sector in pairs(h.Sectors)do srp.starmap.WriteSector(sector)end else net.WriteBool(false)end end;function srp.starmap.WriteSector(sector)net.WriteUInt(sector.MapID,15)net.WriteUInt(sector.SlotID,4)net.WriteUInt(sector.SectorID,6)net.WriteString(sector.Name)net.WriteString(sector.Description)net.WriteUInt(sector.PermissionMode,2)net.WriteString(sector.Skybox)net.WriteColor(sector.Color)net.WriteString(sector.SteamID)end;function srp.starmap.ReadSector()return{MapID=net.ReadUInt(15),SlotID=net.ReadUInt(4),SectorID=net.ReadUInt(6),Name=net.ReadString(),Description=net.ReadString(),PermissionMode=net.ReadUInt(2),Skybox=net.ReadString(),Color=net.ReadColor(),SteamID=net.ReadString()}end;srp.starmap.RegisterMapType('grid',{Name='Grid',Description='A simple grid layout',CellWidth=2,CellHeight=2,Sectors={{Name='1',x=0,y=0,w=.3,h=.3},{Name='2',x=0,y=0,w=.3,h=.3},{Name='3',x=0,y=0,w=.3,h=.3},{Name='4',x=0,y=0,w=.3,h=.3}}})srp.starmap.RegisterSectorType('blank',{Name='Blank',Description='This sector does nothing.',JumpDuration=5,CanTravel=function(self,p,h)return true end})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/hud/hud_ui.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/map/bridgetracker/ui/hyperspace_ui.lua:
local a={}function a:Init()self:SetSize(800,520)self:Center()self:MakePopup()self:SetTitle'Hyperspace Logs'self:SetBackgroundColor(col.grey_light)self:AddPanel('srp_label',function(b)b:SetText'Reason'b:SetFont'ui_label.l'b:Dock(TOP)b:DockMargin(4,10,1,2)end)self:AddPanel('srp_textinput',function(c)c:Dock(TOP)c:SetMinMax(5,128)c:SetMultiline(true)c:SetTall(256)self.Reason=c end)self:AddPanel('srp_label',function(b)b:SetText'Location'b:SetFont'ui_label.l'b:Dock(TOP)b:DockMargin(4,10,1,2)end)self:AddPanel('srp_textinput',function(c)c:Dock(TOP)c:SetMinMax(5,128)self.Location=c end)self:AddPanel('srp_label',function(b)b:SetText'Authorization'b:SetFont'ui_label.l'b:Dock(TOP)b:DockMargin(4,10,1,2)end)self:AddPanel('srp_textinput',function(c)c:Dock(TOP)c:SetMinMax(0,128)self.Authorization=c end)self:AddPanel('srp_button',function(d)d:Dock(BOTTOM)d:SetText'Submit'd:SetBackgroundColor(col.blue)d:SetHoverColor(col.blue_light)d:LeftClick(function(e)e:SetDisabled(true,2)self:Submit()end)end)end;function a:Submit()if!self.Reason:GetText()||#self.Reason:GetText()<5 then return end;self:_OnSubmit({Reason=self.Reason:GetText(),Location=self.Location:GetText(),Authorization=self.Authorization:GetText()})self:Remove()end;function a:OnSubmit(f)self._OnSubmit=f end;vgui.Register('srp_hyperspace',a,'srp_window')
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/modules/map/busmanager/busses_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/activities/defcon_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/cosmetics/appearance_sh.lua:
local a=Material('materials/galactic/ui/foods/package.png','smooth noclamp')cosmetics.RegisterItem('bodygroup'):SetName('Bodygroups'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.CORE):SetDescription('Unlocks the use of skins and bodygroups if your playerModel(supports it.'):SetIcon(a):SetCost(20000)local function b(self,c)return true end;cosmetics.RegisterItem('beard_1'):SetName('Beard 1'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HAIR_BEARD):SetModel('models/galactic/cosmetics/phase1cosmetics/beard1.mdl'):SetIcon(a):SetCost(100000):SetCanView(b)cosmetics.RegisterItem('beard_2'):SetName('Beard 2'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HAIR_BEARD):SetModel('models/galactic/cosmetics/phase1cosmetics/beard2.mdl'):SetIcon(a):SetCost(100000):SetCanView(b)cosmetics.RegisterItem('beard_3'):SetName('Beard 3'):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HAIR_BEARD):SetModel('models/galactic/cosmetics/phase1cosmetics/beard3.mdl'):SetIcon(a):SetCost(100000):SetCanView(b)for d=1,22 do cosmetics.RegisterItem('hair_'..d):SetName('Hair '..d):SetType(cosmetics.APPAREL):SetSlot(cosmetics.SLOT.APPAREL.HAIR):SetModel('models/galactic/cosmetics/phase1cosmetics/hair'..d..'.mdl'):SetIcon(a):SetCost(80000):SetCanView(b)end;cosmetics.RegisterItem('halloween_clone'):SetName('Spooky Cloneboy'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/suphalloween/supclone.mdl'):SetCost(5000):SetDrawModel(true):SetCanUse(function()return srp.seasonal.Halloween end)cosmetics.RegisterItem('july4th_trp'):SetName('July 4th Trooper'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/player/pc_trooper.mdl'):SetCost(10000):SetDrawModel(true):SetCanUse(function()return srp.seasonal.july4th end)cosmetics.RegisterItem('july4th_lt'):SetName('July 4th Trooper'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/player/pc_trooper_lt.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredPermissions('officer'):SetCanUse(function()return srp.seasonal.july4th end)cosmetics.RegisterItem('july4th_cc'):SetName('July 4th Trooper'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/player/pc_trooper_cc.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredPermissions('highofficer'):SetCanUse(function()return srp.seasonal.july4th end)cosmetics.RegisterItem('ramsey'):SetName('Ramsey\'s Raw Steak'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/ramsey/ramsey.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:92233696')cosmetics.RegisterItem('sinnura_jedi',true):SetName('Sinnura'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel(Model'models/artel/kotw/kotw.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:512600350')cosmetics.RegisterItem('ramsey_jedi'):SetName('Ramsey\'s Jedi Roast'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/arsenic/shilen/shilen.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:92233696')cosmetics.RegisterItem('barrett_jedi'):SetName('Barrett'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/cac/prod/prod_jedi.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:83032611')cosmetics.RegisterItem('heart'):SetName('Heart'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/custom/heart/heart.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:239116086')cosmetics.RegisterItem('templeguard'):SetName('Temple Guard'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/epangelmatikes/templeguard/temple_guard_kaito.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:61544172')cosmetics.RegisterItem('thrifter'):SetName('Thrifter'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/thrifter/thrifter.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:80784231')cosmetics.RegisterItem('bofafeen'):SetName('Bofa 19 Feen'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/feen/bofa.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:202846501')cosmetics.RegisterItem('bofatobe'):SetName('Bofa Tob'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/tobester/bofa.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:56336953')cosmetics.RegisterItem('tobe_blackops'):SetName('Bofa Blackops'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/tobester/tobester_rc.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:56336953')cosmetics.RegisterItem('krassz'):SetName('Krassz'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/krassz/krassz.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:95270591','STEAM_0:0:36185848')cosmetics.RegisterItem('jax_warrior'):SetName('Jax'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/epangelmatikes/templeguard/temple_guard_bro.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:95270591')cosmetics.RegisterItem('jax_clone'):SetName('Jax'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/custom/jax/jax.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:95270591')cosmetics.RegisterItem('gohen'):SetName('Gohen'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/gohen/gohen.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:52353999')cosmetics.RegisterItem('westy'):SetName('Westy'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/westy/westy.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:219944453')cosmetics.RegisterItem('pryn'):SetName('Pryn'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/pryn/pryn.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:3353756')cosmetics.RegisterItem('hotson_jedi2'):SetName('Hotson Jedi 2'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/hotson/hotson_jedi_2.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredClasses('JEDIHOTSON')cosmetics.RegisterItem('hotson_arc'):SetName('Hotson Blackops'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/hotson/2048p/trooper/trooper.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:514668327')cosmetics.RegisterItem('hotson_blackops'):SetName('Hotson Blackops'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/hotston/hotson_blackops.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:514668327')cosmetics.RegisterItem('hotson_jedi'):SetName('Hotson Jedi'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/hotson/hotson_jedi.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:514668327')cosmetics.RegisterItem('hotson_41'):SetName('Hotson 41st'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/hotson/hotson.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:514668327')cosmetics.RegisterItem('hotson_du'):SetName('Hotson GM Heavy'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/hotson/hotson_samurai.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:514668327')cosmetics.RegisterItem('debaz'):SetName('Debaz'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/debaz/debaz.mdl',true):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:85880898')cosmetics.RegisterItem('razer'):SetName('Razer'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/razer/razer.mdl',true):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:104788671')cosmetics.RegisterItem('shart'):SetName('Shart'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/shart/bofa.mdl',true):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:73281602')cosmetics.RegisterItem('seanhgm'):SetName('Sean'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/sean/sean.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:40802112')cosmetics.RegisterItem('shaxhgm'):SetName('Shax'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/shax/shax.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:29760963')cosmetics.RegisterItem('thresh'):SetName('Thresh'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/thresh/thresh.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:1:64693965')cosmetics.RegisterItem('clonetrooper'):SetName('Clone Trooper'):SetDescription('The basic Clone Trooper'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/trooper/cctrooper.mdl'):SetCost(10000):SetDrawModel(true):SetBlacklistedGroups('JEDI'):SetCanUse(function()return srp.seasonal.Christmas!=nil end)cosmetics.RegisterItem('shaakti'):SetName('Slut Ti'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel(Model('models/galactic/togruta/togrutaplayermodel.mdl')):SetCost(1000):SetDrawModel(true):SetRequiredClasses('SHAAK')cosmetics.RegisterItem('smashyowl'):SetName('Rav Bralor'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/lgg/rav_pm/rav.mdl'):SetRequiredSteamID('STEAM_0:0:33122264'):SetCost(1000):SetDrawModel(true)cosmetics.RegisterItem('vill'):SetName('Vill'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/vill/vill.mdl'):SetRequiredSteamID('STEAM_0:0:155880995'):SetCost(1000):SetDrawModel(true)cosmetics.RegisterItem('will'):SetName('Will'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/will/will.mdl'):SetRequiredSteamID('STEAM_0:1:54855314'):SetCost(1000):SetDrawModel(true)cosmetics.RegisterItem('SPACEGANDALF'):SetName('Sapce Wookiee'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/chewie.mdl'):SetRequiredSteamID('STEAM_0:1:78685066'):SetCost(1000):SetDrawModel(true)cosmetics.RegisterItem('monkey'):SetName('Monke'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tobester/monkey/monkey.mdl'):SetRequiredSteamID('STEAM_0:1:196548982'):SetCost(1000):SetDrawModel(true)cosmetics.RegisterItem('beck'):SetName('Beck'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/valley/xalek.mdl'):SetRequiredSteamID('STEAM_0:1:41161836'):SetCost(1000):SetDrawModel(true)cosmetics.RegisterItem('clips'):SetName('Clips'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/hosti/models/mando2022.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:515860247')cosmetics.RegisterItem('ringus'):SetName('Ringus'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/332nd/trooper/trips.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredSteamID('STEAM_0:0:82101476')cosmetics.RegisterItem('104evo'):SetName('104th Evo'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/104/evo.mdl'):SetCost(5000):SetDrawModel(true):SetRequiredLoreNames('104WOLFFE','104BOOST','104SINKER','104COMET')cosmetics.RegisterItem('heavytrooper'):SetName('Heavy Trooper'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/heavy/heavy_trooper.mdl'):SetCost(5000):SetDrawModel(true):SetRequiredClasses('HEAVY','HEAVYOFFICER')cosmetics.RegisterItem('arfboil'):SetName('Arf Boil'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/212/arf_boil.mdl'):SetCost(5000):SetDrawModel(true):SetRequiredLoreNames('212BOIL')cosmetics.RegisterItem('arfwaxer'):SetName('Arf Waxer'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/212/arf_waxer.mdl'):SetCost(5000):SetDrawModel(true):SetRequiredLoreNames('212WAXER')cosmetics.RegisterItem('wolfpack'):SetName('104th Wolf Pack'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/104wp/nco.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredGroups('104WP')cosmetics.RegisterItem('arcrgb'):SetName('Alpha'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/arc/alpha.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredGroups('ARC')cosmetics.RegisterItem('arctrooper'):SetName('ARC Trooper'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/arc/trooper.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredGroups('ARC'):SetRequiredClasses('SHADOWTROOPER','HEAVYOFFICER','HEAVY','ARFLOW','ARFHIGH','MEDICHIGH','MEDICLOW')cosmetics.RegisterItem('naval_highofc'):SetName('Naval High Officer'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/highofc.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('VADM','RDML','RDM','CAPT','CMDR','LTCMD')cosmetics.RegisterItem('naval_lowofc'):SetName('Naval Lower Officer'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/lowofc.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('LT','LTJG','ENS')cosmetics.RegisterItem('naval_nco'):SetName('Naval NCO'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/nco.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('MIDN','WO1','MCPO','SCPO','CPO')cosmetics.RegisterItem('naval_trooper'):SetName('Naval Trooper'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/trooper.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('PO1','PO2','PO3','CREW','CREWAPPR')cosmetics.RegisterItem('naval_grey'):SetName('Grey Naval'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/greynavy.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('VADM','RDML','RDM','CAPT','CMDR','LTCMD')cosmetics.RegisterItem('naval_grey_female'):SetName('Grey Naval Female'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/greynavy_female.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('VADM','RDML','RDM','CAPT','CMDR','LTCMD')cosmetics.RegisterItem('naval_red'):SetName('Red Naval'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/rednavy.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('LT','LTJG','ENS')cosmetics.RegisterItem('naval_red_female'):SetName('Red Naval Female'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/rednavy_female.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('LT','LTJG','ENS')cosmetics.RegisterItem('org_alt'):SetName('CG Alternative Armour'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/cgorg/bel.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredGroups('ORG'):SetRequiredPermissions('bail')cosmetics.RegisterItem('naval_blue'):SetName('Blue Naval'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/bluenavy.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('MIDN','WO1','MCPO','SCPO','CPO')cosmetics.RegisterItem('naval_blue_female'):SetName('Blue Naval Female'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/bluenavy_female.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('MIDN','WO1','MCPO','SCPO','CPO')cosmetics.RegisterItem('naval_white'):SetName('White Naval'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/whitenavy.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('PO1','PO2','PO3','CREW','CREWAPPR')cosmetics.RegisterItem('naval_white_female'):SetName('White Naval Female'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/naval/whitenavy_female.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredRanks('PO1','PO2','PO3','CREW','CREWAPPR')cosmetics.RegisterItem('rp_redtrooper'):SetName('Red Trooper'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/rp/redtrooper.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredGroups('32nd')cosmetics.RegisterItem('rp_bluetrooper'):SetName('Blue Trooper'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/rp/bluetrooper.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredGroups('32nd')cosmetics.RegisterItem('rp_redofc'):SetName('Red Officer'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/rp/redofficer.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredGroups('32nd'):SetRequiredPermissions('officer')cosmetics.RegisterItem('rp_blueofc'):SetName('Blue Officer'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/rp/blueofficer.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredGroups('32nd'):SetRequiredPermissions('officer')cosmetics.RegisterItem('rp_goldtrooper'):SetName('Gold NCO'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/rp/nco.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredGroups('32nd')cosmetics.RegisterItem('rp_goldofc'):SetName('Gold Low Officer'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/rp/lowofc.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredGroups('32nd'):SetRequiredPermissions('officer')cosmetics.RegisterItem('rp_goldhofc'):SetName('Gold High Officer'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/rp/highofc.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredGroups('32nd'):SetRequiredPermissions('highofficer')cosmetics.RegisterItem('kano_alt'):SetName('Kano\'s Alternative Armour'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/501/kanoalt.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredClasses('501KANO')cosmetics.RegisterItem('echo_alt'):SetName('Echo\'s Alternative Armour'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/501/bbecho.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredClasses('501ECHO')cosmetics.RegisterItem('anakin_alt'):SetName('Anakin\'s Alternative Clothing'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tfa/comm/pm_sw_anakin_skywalker.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredClasses('ANAKIN')cosmetics.RegisterItem('obiwan_alt'):SetName('Obiwan Clothing'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/tfa/comm/gg/pm_sw_obiwan_alt.mdl'):SetCost(1000):SetDrawModel(true):SetRequiredClasses('OBIWAN')cosmetics.RegisterItem('gm_trooper'):SetName('GM Trooper'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/gm/trooper.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredGroups('GM')cosmetics.RegisterItem('gm_nco'):SetName('GM NCO'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/gm/nco.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredGroups('GM'):SetRequiredPermissions('nco')cosmetics.RegisterItem('gm_officer'):SetName('GM Low Officer'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/gm/lowofc.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredGroups('GM'):SetRequiredPermissions('officer')cosmetics.RegisterItem('gm_hughofficer'):SetName('GM High Officer'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/clones/gm/highofc.mdl'):SetCost(10000):SetDrawModel(true):SetRequiredGroups('GM'):SetRequiredPermissions('highofficer')local e={['JEDISHAX']=true,['JEDICONSULARC']=true,['JEDIGUARDIANC']=true,['JEDISENTINELC']=true,['JEDIETAIN']=true}local f={['JEDICONSULAR']=true,['MASTER']=true,['JEDICOUNCIL']=true,['JEDICONSULARC']=true,['JEDISHAX']=true,['JEDIMASTERC']=true,['GUARDIANMASTER']=true,['CONSULARMASTER']=true,['SENTINELMASTER']=true,['JEDIETAIN']=true}local g={['JEDIGUARDIAN']=true,['MASTER']=true,['JEDICOUNCIL']=true,['JEDIGUARDIANC']=true,['JEDIMASTERC']=true,['GUARDIANMASTER']=true,['CONSULARMASTER']=true,['SENTINELMASTER']=true}local h={['JEDISENTINEL']=true,['MASTER']=true,['JEDICOUNCIL']=true,['JEDISENTINELC']=true,['JEDIMASTERC']=true,['GUARDIANMASTER']=true,['CONSULARMASTER']=true,['SENTINELMASTER']=true,['JEDIHOTSON']=true,['JEDIGALAK']=true,['JEDIPRYN']=true}local i={['MASTER']=true,['JEDICOUNCIL']=true,['JEDIMASTERC']=true,['GUARDIANMASTER']=true,['CONSULARMASTER']=true,['SENTINELMASTER']=true}local function j(self,c)local k=c:GetGroupRank()local l=c:GetGroupClass()return k&&f[k.id]||l&&f[l.id]||k&&!k:HasPermission'jedi'&&l&&l:HasPermission'jedi'&&!e[l.id]end;local function m(self,c)local k=c:GetGroupRank()local l=c:GetGroupClass()return k&&g[k.id]||l&&g[l.id]||k&&!k:HasPermission'jedi'&&l&&l:HasPermission'jedi'&&!e[l.id]end;local function n(self,c)local k=c:GetGroupRank()local l=c:GetGroupClass()return k&&h[k.id]||l&&h[l.id]||k&&!k:HasPermission'jedi'&&l&&l:HasPermission'jedi'&&!e[l.id]end;local function o(self,c)local k=c:GetGroupRank()local l=c:GetGroupClass()return k&&i[k.id]||l&&i[l.id]||k&&!k:HasPermission'jedi'&&l&&l:HasPermission'jedi'&&!e[l.id]end;cosmetics.RegisterItem('jedi_twilek'):SetName('Female Twilek'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/twilek_female/twilek_female.mdl'):SetCost(30000):SetDrawModel(true):SetCanUse(function(self,c)local k=c:GetGroupRank()local l=c:GetGroupClass()if l&&e[l.id]||k&&(k.id=='KNIGHT'||k.id=='JEDIKNIGHTC')||j(self,c)||m(self,c)||n(self,c)||o(self,c)then return true else return false end end)cosmetics.RegisterItem('jedi_consularf'):SetName('Female Consular'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/femaleconsular/femaleconsular.mdl'):SetCost(30000):SetDrawModel(true):SetCanUse(j)cosmetics.RegisterItem('jedi_consularm'):SetName('Male Consular'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/maleconsular/maleconsular.mdl'):SetCost(30000):SetDrawModel(true):SetCanUse(j)cosmetics.RegisterItem('jedi_sentinelf'):SetName('Female Sentinel'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/swtorsentinel/femalesentinel1.mdl'):SetCost(30000):SetDrawModel(true):SetCanUse(n)cosmetics.RegisterItem('jedi_sentinelm'):SetName('Male Sentinel'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/swtorsentinel/malesentinel1.mdl'):SetCost(30000):SetDrawModel(true):SetCanUse(n)cosmetics.RegisterItem('jedi_guardianm'):SetName('Male Guardian'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/maleguardian1/maleguardian1.mdl'):SetCost(30000):SetDrawModel(true):SetCanUse(m)cosmetics.RegisterItem('jedi_guardianf'):SetName('Female Guardian'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/femaleguardian1/femaleguardian1.mdl'):SetCost(30000):SetDrawModel(true):SetCanUse(m)cosmetics.RegisterItem('jedi_guardian1'):SetName('Guardian 1'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/grealms/characters/jedibattlelord/jedibattlelord.mdl'):SetCost(0):SetDrawModel(true):SetCanUse(m)cosmetics.RegisterItem('jedi_guardian2'):SetName('Guardian 2'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/grealms/characters/jedibattlelord/jedibattlelord_01.mdl'):SetCost(0):SetDrawModel(true):SetCanUse(m)cosmetics.RegisterItem('jedi_guardian3'):SetName('Guardian 3'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/grealms/characters/jedibattlelord/jedibattlelord_02.mdl'):SetCost(0):SetDrawModel(true):SetCanUse(m)cosmetics.RegisterItem('jedi_guardian4'):SetName('Guardian 4'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/grealms/characters/jedibattlelord/jedibattlelord_03.mdl'):SetCost(0):SetDrawModel(true):SetCanUse(m)cosmetics.RegisterItem('jedi_master1'):SetName('Master 1'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/swtormaster/swtormaster1.mdl'):SetCost(30000):SetDrawModel(true):SetCanUse(o)cosmetics.RegisterItem('jedi_master2'):SetName('Master 2'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/swtormaster/swtormaster2.mdl'):SetCost(30000):SetDrawModel(true):SetCanUse(o)cosmetics.RegisterItem('jedi_shadow'):SetName('Shadow Brown'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/valley/battlemaster.mdl'):SetCost(30000):SetDrawModel(true):SetRequiredGroups(o)cosmetics.RegisterItem('jedi_nautolan'):SetName('Nautolan'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/zhidus/jedi/nautolan/nautolan.mdl'):SetCost(30000):SetDrawModel(true):SetRequiredPermissions('jedi')cosmetics.RegisterItem('jedi_pantoran'):SetName('Pantoran'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/zhidus/jedi/pantoran/pantoran.mdl'):SetCost(30000):SetDrawModel(true):SetRequiredPermissions('jedi')cosmetics.RegisterItem('jedi_rodian'):SetName('Rodian'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/zhidus/jedi/rodian/rodian.mdl'):SetCost(30000):SetDrawModel(true):SetRequiredPermissions('jedi')cosmetics.RegisterItem('jedi_zabrak'):SetName('Zabrak'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/zhidus/jedi/zabrak/zabrak.mdl'):SetCost(30000):SetDrawModel(true):SetRequiredPermissions('jedi')cosmetics.RegisterItem('jedi_togruta'):SetName('Togruta'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/zhidus/jedi/togruta/togruta.mdl'):SetCost(30000):SetDrawModel(true):SetRequiredPermissions('jedi')cosmetics.RegisterItem('jedi_twilek_zhidus'):SetName('Twilek'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/player/zhidus/jedi/twilek/twilek.mdl'):SetCost(20000):SetDrawModel(true):SetRequiredPermissions('jedi')cosmetics.RegisterItem('jedi_shadowwhite'):SetName('Shadow'):SetType(cosmetics.APPEARANCE):SetSlot(cosmetics.SLOT.APPEARANCE.MODEL):SetModel('models/galactic/celestineshadow/celestineshadow.mdl'):SetCost(30000):SetDrawModel(true):SetRequiredGroups(function(self,c)if j(self,c)||m(self,c)||n(self,c)then return true else return false end end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/events/events_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/events/safelanding_sh.lua:
local a=Vector(-5290,-3250,-13750)local b=10;local c=10;local d=Vector(-5528,-2645,-13660)local e=Angle(90,0,0)local f=Sound'galactic/minigames/incorrect.wav'local g=Sound'galactic/minigames/success1.wav'local function h()for i,j in ipairs(ents.FindByClass'rp_safelanding')do if IsValid(j)then j:Remove()end end;for i,j in ipairs(ents.FindByClass'rp_lava')do if IsValid(j)then j:Remove()end end;if IsValid(srp.events.TimerEnt)then srp.events.TimerEnt:Remove()end end;local function k(l,m)h()local n=ents.Create'rp_timer'n:SetPos(d)n:SetAngles(e)n:Spawn()n:SetTimer(0)n:Pause(true)n.NoFinishSound=true;n:OnTimerFinished(function(self)hook.Run('OnEventTimerFinished',self)end)srp.events.TimerEnt=n;local o=ents.Create'rp_lava'o:SetPos(srp.events.Arena.Pos+Vector(-20,0,0))o:SetAngles(Angle(0,0,0))o:Spawn()for p=1,b do local q=p*100;for r=1,c do local s=a+Vector(q,r*100,0)local j=ents.Create'rp_safelanding'j:SetPos(s)j:Spawn()end end end;local function t(m)if IsValid(srp.events.TimerEnt)then srp.events.TimerEnt:SetTimer(m)srp.events.TimerEnt:Pause(false)end end;local function u()local v=ents.FindByClass'rp_safelanding'for i,j in ipairs(v)do if!IsValid(j)then continue end;j.Breaking=false end;local w=math.floor(#v*.5)for x=1,w do local j=v[math.random(1,#v)]if IsValid(j)then j.Breaking=true end end end;local function y()local v=ents.FindByClass'rp_safelanding'for i,j in ipairs(v)do if IsValid(j)&&j.Breaking then j:Remove()end end end;local function z()local v=ents.FindByClass'rp_safelanding'for i,j in ipairs(v)do if IsValid(j)&&j.Breaking then j:SetColor(col.red)end end end;local A={function(self)self:DisplayTitle'Choose a platform'u(1)if IsValid(srp.events.TimerEnt)then srp.events.TimerEnt:EmitSound(g)end;return 10,true end,function(self)z()if IsValid(srp.events.TimerEnt)then srp.events.TimerEnt:EmitSound(f)end;return.2,false end,function(self,B)y()self.Round=(self.Round||1)+1;self:DisplayTitle('Get ready for round '..self.Round..'!')return 4,false end}srp.events.Register('safelanding','Safe Landing',20):SetArenaEvent(true):SetMusic('sound/galactic/minigames/teaser.wav',{loop=true,AmpStart=37,AmpAmount=5}):SetMaxPlaytime(720):SetTheme('safelanding'):SetRequiresVote(true,3,15):SetDescription([[
		Choose a platform and hope you dont fall flat.
	]]):SetTagLines({default='Choose a platform and hope you dont fall flat.'}):OnStart(function(self)if CLIENT then return end;self.Round=1;local C=self:GetPlayers()self:DisplayTitle'Get Ready!'k()self:SetTimer(5)srp.events.SpawnAroundVector(C,srp.events.Arena.Pos+Vector(0,0,-100),200,function(D)D:StripWeapons()end)end):OnPlayerRemoved(function(self,D)local C=self:GetPlayers()if IsValid(D)then D:SetCharacterStatisticAverage('minigame_losses',1)D:SetCharacterStatisticAverage('minigame_wins',0)self:DisplayDeathCounter(#C,D:Nick())else self:DisplayDeathCounter(#C)end;if#C<=1 then self:End(srp.events.END,C[1])end end):OnWriteEndData(function(self,D)net.WritePlayer(D)end):OnReadEndData(function(self,D)return net.ReadPlayer(D)end):OnEnd(function(self,E,D)if CLIENT then return end;h()if!IsValid(D)||!IsEntity(D)then return end;D:SetCharacterStatisticAverage('minigame_wins',1)srp.notif.SuccessAll(5,D:Nick()..' has won Failsafe.')timer.Simple(5,function()if IsValid(D)then D:Spawn()end end)end):OnTimerFinished(function(self,B)local F=(B-1)%#A+1;local m,G=A[F](self)if m then self:SetTimer(m+1)if G!=false then t(m)end end end):AddHook('PlayerDeath',function(self,D)self:RemovePlayer(D)end)
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/stores_sh.lua:
srp.inventory.RegisterShop('STORE_MUNITIONS',{name='Battalion Munitions',description='Get your munitions and armour boys',color=col.blue,items={AMMO_PULSE=1500,UTILITY_FUEL=200,UTILITY_OXYGEN=1500}})srp.inventory.RegisterShop('STORE_TRADER',{name='Trader',description='Trade with your punk ass or what??',color=col.midnight_dark,items={}})srp.inventory.RegisterShop('STORE_DRINKS',{name='The Bar',description='Give me that good shit',color=col.blue,items={ALCOHOL_VODKA=150,ALCOHOL_MERENZANE=150,ALCOHOL_ARDEES=150,ALCOHOL_TATSUNSET=150}})srp.inventory.RegisterShop('STORE_SUMMERFOOD',{name='Summer Foods',description='Delicious Foods Yum',color=col.blue,items={FOOD_BURGER=10,FOOD_ICECUBES=5,FOOD_HOTDOG=15,FOOD_ICECREAM=5,FOOD_ICECREAMPOT=5,FOOD_FRESHDRINK=5,ALCOHOL_MERENZANE=150,ALCOHOL_ARDEES=150,ALCOHOL_TATSUNSET=150}})srp.inventory.RegisterShop('STORE_HALLOWEENFOOD',{name='Halloween Foods',description='Delicious Foods Yum',color=col.blue,items={FOOD_ZOMBIE_HAND=500,FOOD_SPIDER=1000,FOOD_FROGSLEGS=75,FOOD_PUMPKIN_SOUP=5000,FOOD_PUMPKIN_CAKE=2500,FOOD_PUMPKIN_PIE=1000,LIQUID_PUMPKINWATER=2500,ALCOHOL_VODKA=150,ALCOHOL_MERENZANE=150,ALCOHOL_ARDEES=150,ALCOHOL_TATSUNSET=150}})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/_base_sh.lua:
srp.items.RegisterBase('BUNDLE',{name='Inventory Bundle',icon='materials/galactic/ui/foods/package.png',price=100,maxstack=200,model=Model'models/props/cargocrate1.mdl',gui_position=Vector(0,0,20),Items={},interaction={OnPickup={label='Pickup',callback=function(self,a,b,c,d,e)return b:AddItem(self,d)end},Use={label='Unpack',callback=function(self,a,b,c,d)for f,g in pairs(self.Items)do b:AddItem(f,g*d)end;return true end}}})srp.items.RegisterBase('CORE',{name="Core Item",icon='materials/galactic/ui/foods/package.png',price=100,maxstack=200,model=Model'models/props/cargocrate1.mdl',gui_position=Vector(0,0,20),interaction={OnPickup={label='Pickup',callback=function(self,a,b,c,d,e)print('OnPickup.callback()',self,a,b,c,d,e)return b:AddItem(self,d)end}}})srp.items.RegisterBase('CORE_TEMP',{name="Core Temp Item",icon='materials/galactic/ui/foods/package.png',price=100,maxstack=200,model=Model'models/props/cargocrate1.mdl',gui_position=Vector(0,0,20),interaction={OnPickup={label='Hold',callback=function(self,a,b,c,d,e)a:PickupObject(e)return false end},OnAltPickup={label='Pickup',callback=function(self,a,b,c,d,e)return b:AddItem(self,d)end}}})srp.items.Register('Utility','WARFUND',{base='CORE',name='Warfunds',warfund=1000,description='Contains warfunds',rarity='rare',nodrop=false,tradedisabled=true,OnPreInventoryAdded=function(self,h,i,d)if!i then return{Warfund=self.warfund}end end})srp.items.Register('Store Tokens','TRADERCOIN',{base='CORE',name='Strange Coin',description='Used with the coin trader to unlock cosmetics, titles and other goodies.',icon='materials/galactic/ui/menu/coin.png',rarity='rare',nodrop=true,tradedisabled=true})srp.items.Register('Utility','UTILITY_MODULETOOL',{base='CORE',name='Weapon Module Tool',description='Safely remove a module from your weapon',icon='materials/galactic/ui/triumphs/module.png',model=Model'models/props/swdatapad.mdl',cost=1500,weight=10})srp.items.Register('Utility','UTILITY_HACKINGDEVICE',{base='CORE',name='Security Device',description='Gives you the ability to secure/hack security points',model=Model'models/props/swdatapad.mdl',cost=50,icon='materials/galactic/ui/inventory/security.png',weight=10})srp.items.Register('Utility','UTILITY_HACKINGFALLOVER',{base='CORE',name='Security Fallover Module',description='Increases failure threshold by one.',model=Model'models/props/swdatapad.mdl',cost=50,icon='materials/galactic/ui/inventory/security.png',weight=15,hackInjector=true})srp.items.Register('Utility','UTILITY_HACKINGDELAY',{base='CORE',name='Security Relay Delay Module',description='Increases time available on hacking by 30%.',model=Model'models/props/swdatapad.mdl',cost=50,icon='materials/galactic/ui/inventory/security.png',weight=15,hackInjector=true})srp.items.Register('Utility','UTILITY_FUEL',{base='CORE',name='Fuel Can',description='A fuel can used to operate Jetpacks',icon='materials/galactic/ui/inventory/fuelcan.png',fuel=25,cost=100,weight=5,interaction={Use={label='Fill Jetpack',callback=function(self,a,b,c,d)local j=(self.fuel+a:GetTalentValue('jetpackfuel'))*d;local k=math.min(a:GetFuel()+j,125)a:SetFuel(k)return true end}}})srp.items.Register('Utility','UTILITY_OXYGEN',{base='CORE',name='Oxygen Can',description='Used for oxygen masks in harsh conditions.',icon='materials/galactic/ui/inventory/oxygen.png',model=Model'models/props/gasbarrel.mdl',oxygen=50,cost=150,weight=5,interaction={Use={label='Use',callback=function(self,a,b,c,d)local l=a:GetOxygen()if!l||l==150 then return false end;a:SetOxygen(math.min(l+self.oxygen*d,200))return true end}}})srp.items.Register('Utility','UTILITY_ARMOUR',{base='CORE',name='Extra Armour',icon='materials/galactic/ui/inventory/armor.png',model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/items/harvesting/slicing/slicing_footlocker_dial.mdl',description='Adds 50 armour up to a maximum of 200 armour.',cost=600,weight=150,interaction={Use={label='Use',callback=function(self,a,b,c,d)if a:Armor()<200 then a:SetArmor(a:Armor()+50)return 1 end;return false end}}})local m=Material('!turret_camscan4')local n={['$pp_colour_colour']=.4,['$pp_colour_addr']=0,['$pp_colour_addg']=0,['$pp_colour_addb']=0,['$pp_colour_brightness']=0,['$pp_colour_contrast']=1,['$pp_colour_mulr']=0,['$pp_colour_mulg']=2,['$pp_colour_mulb']=0}local function o()render.SetStencilWriteMask(0xFF)render.SetStencilTestMask(0xFF)render.SetStencilReferenceValue(0)render.SetStencilPassOperation(STENCIL_KEEP)render.SetStencilFailOperation(STENCIL_KEEP)render.ClearStencil()render.SetStencilEnable(true)render.SetStencilReferenceValue(1)render.SetStencilCompareFunction(STENCIL_ALWAYS)render.SetStencilZFailOperation(STENCIL_REPLACE)for p,q in pairs(srp.hud.PlayersNotVisible)do if IsValid(q)&&q!=LocalPlayer()then q:DrawModel()end end;render.SetStencilCompareFunction(STENCIL_EQUAL)render.ClearBuffersObeyStencil(150,50,50,255,false)render.SetStencilEnable(false)end;srp.items.Register('Utility','UTILITY_HELMETVISION',{base='CORE',name='Helmet Vision',model=Model('models/starwars/syphadias/props/sw_tor/bioware_ea/items/harvesting/slicing/slicing_footlocker_dial.mdl'),icon='materials/galactic/ui/inventory/helmetvision.png',weight=150,interaction={OnPickup={consumeable=true,consumeduration=20,callback=function(self,a,b,c,d,e)return 1 end,callbackstart=function(self,a)a:SetDSP(57)end,callbackend=function(self,a)a:SetDSP(1)end,clhooks={RenderScreenspaceEffects=function(self)draw.ColorModify(n)surface.SetMaterial(m)surface.SetDrawColor(50,50,50,170)surface.DrawTexturedRect(0,0,ScrW(),ScrH())end,PostDrawOpaqueRenderables=o,EntityEmitSound=function(r)r.DSP=7;r.pitch=50;return true end}}}})srp.items.Register('Utility','WEAPON_UTILITY_NIGHTVISION',{base='WEAPON',name='Night vision',class_name='rp_nightvision',icon='materials/galactic/ui/talents/explosive.png',jedi=true,CanEquip=function(self,a)return!a:HasNVG()end,Equip=function(self,a)a:SetNVG(true)srp.nvg.SetNightVision(a,false)end,UnEquip=function(self,a)a:SetNVG(false)srp.nvg.SetNightVision(a,false)end,GenerateStats=function(self)return{}end})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/ammo_sh.lua:
srp.items.RegisterBase('AMMO',{name='Ammo',icon='materials/galactic/ui/foods/package.png',model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/items/harvesting/slicing/slicing_footlocker_screen.mdl',maxstack=5,gui_position=Vector(0,0,40),interaction={Use={label='Use',callback=function(self,a,b,c,d)if!self.type then return false end;a:GiveAmmo(self.ammo_count*d,self.type)return true end},OnAltPickup={label='Pickup',callback=function(self,a,b,c,d,e)local f=b:AddItem(self,d)if f then e:EmitSound('items/ammocrate_close.wav')return true else return false end end},OnPickup={label='Use',callback=function(self,a,b,c,d,e)if!self.type then return false end;a:GiveAmmo(self.ammo_count*d,self.type)return true end}}})srp.items.RegisterBase('SHELL',{name='Shell Item',price=500,maxstack=200,gui_position=Vector(0,0,20),model=Model'models/gredwitch/bombs/75mm_shell.mdl',icon=Material'materials/galactic/ui/inventory/ammo.png',shellclass='rp_artilleryshell',interaction={OnPickup={label='Pickup',callback=function(self,a,b,c,d,e)return b:AddItem(self,d)end},OnAltPickup={label='Hold',callback=function(self,a,b,c,d,e)a:PickupObject(e)return false end}}})srp.items.Register('Ammo','MORTAR_SHELL',{id='MORTAR_SHELL',base='SHELL',name='Standard Mortar Shell',description='Can be held and loaded into a mortar.',shellclass='rp_artilleryshell',scrap='METAL_SCRAP',scrapcount=6,icon='materials/galactic/ui/inventory/ammo.png'})srp.items.Register('Ammo','MORTAR_SHELL_SMOKE',{id='MORTAR_SHELL',base='SHELL',name='Smoke Mortar Shell',description='Can be held and loaded into a mortar.',shellclass='rp_artilleryshell_smoke',scrap='METAL_SCRAP',scrapcount=6,icon='materials/galactic/ui/inventory/ammo.png'})srp.items.Register('Ammo','MORTAR_SHELL_SMOKE_RED',{id='MORTAR_SHELL',base='SHELL',name='Smoke Mortar Shell (Red)',description='Can be held and loaded into a mortar.',shellclass='rp_artilleryshell_smoke_red',scrap='METAL_SCRAP',scrapcount=6,icon='materials/galactic/ui/inventory/ammo.png'})srp.items.Register('Ammo','MORTAR_SHELL_SMOKE_GREEN',{id='MORTAR_SHELL',base='SHELL',name='Smoke Mortar Shell (Green)',description='Can be held and loaded into a mortar.',shellclass='rp_artilleryshell_smoke_green',scrap='METAL_SCRAP',scrapcount=6,icon='materials/galactic/ui/inventory/ammo.png'})srp.items.Register('Ammo','MORTAR_SHELL_DIOXIS',{id='MORTAR_SHELL',base='SHELL',name='Dioxis Mortar Shell',description='Can be held and loaded into a mortar.',shellclass='rp_artilleryshell_dioxis',scrap='METAL_SCRAP',scrapcount=6,icon='materials/galactic/ui/inventory/ammo.png'})srp.items.Register('Ammo','AMMO_PULSE',{id='AMMO_PULSE',base='AMMO',name='Pulse Ammo',description='Provides you with 500 rounds of pulse ammo. Ammo is partially refunded when you disconnect.',description_small='500 rounds of pulse ammo',icon='materials/galactic/ui/inventory/ammo.png',iconsettings='smooth',type='ammo_blaster',ammo_count=500,cost=200,scrap='METAL_SCRAP',scrapcount=6,weight=1,trademaxprice=500})srp.items.Register('Ammo','AMMO_FUELINJECTOR',{id='AMMO_FUELINJECTOR',base='AMMO',name='Fuel Cell',description='Provides you with a fuel cell that contains 250ml of fuel',description_small='250ml of flamethrower fuel',icon='materials/galactic/ui/inventory/fuelcan.png',iconsettings='smooth',type='ammo_fuel',ammo_count=250,cost=500,scrap='UTILITY_FUEL',scrapcount=1,weight=1,trademaxprice=1200})srp.items.Register('Ammo','AMMO_GRENADE',{id='AMMO_GRENADE',base='AMMO',name='Grenades',description='Provides you with 20 grenades!',description_small='20 grenades',icon='materials/galactic/ui/inventory/handgrenade.png',iconsettings='smooth',type='grenade',ammo_count=20,cost=200,scrap='METAL_SCRAP',scrapcount=2,weight=1,trademaxprice=2500})srp.items.Register('Ammo','AMMO_E60R',{base='AMMO',id='AMMO_E60R',name='Missiles x2',description='Provides you with 2 missiles for the E60R and Republic AT. Ammo is partially refunded when you disconnect.',description_small='2 missiles for the E60R and Republic AT.',type='ammo_e60r',icon='materials/galactic/ui/inventory/missiles.png',ammo_count=2,cost=800,scrap='METAL_REFINED_METAL',scrapcount=2,weight=5,interaction={Use={label='Use',callback=function(self,a,b,c,d)if!self.type then return false end;local g=a:IsTalentSelected('extraatammo')&&2||1;a:GiveAmmo(self.ammo_count*g*d,self.type)return true end},OnPickup={label='Use',callback=function(self,a,b,c,d,e)if!self.type then return false end;local d=d*self.ammo_count*(a:IsTalentSelected('extraatammo')&&2||1)a:GiveAmmo(d*self.ammo_count,self.type)return true end}}})srp.items.Register('Ammo','AMMO_GL',{base='AMMO',id='AMMO_GL',name='Grenade Launcher Round',shortname='GL Rounds',description='Provides you with 2 shells for the Grenade Launcher. Ammo is partially refunded when you disconnect.',description_small='2 shells for the Grenade Launcher.',icon='materials/galactic/ui/menu/bullets.png',type='ammo_gl',ammo_count=2,cost=300,scrap='METAL_CASING',scrapcount=2,weight=5})
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/items/items/tokens_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/loadouts/battalions_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/maps_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/map/spawnpoints/rishimoon_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/quests/dailies_sh.lua:
local function a(b)local c=table.Copy(srp.crafting.GetCategory(b))for d=1,3 do local e=table.remove(c,math.random(1,#c))local b='craft_'..e.id;local f=table.Count(e.items)>2;local g=f&&{min=15,max=45}||{min=50,max=150}srp.quests.CreateObjective(b,'crafting'):SetDescription('Craft # '..e.name):SetGoal(g):AddHook('OnCraftedItem',1,function(self,h,i,j)if i.id==e.id then self:UpdateObjective(b,j||1)end end)end end;a'Ammo'a'Metals'srp.quests.CreateObjective('dailykill'):SetDescription('Kill # NPCs'):SetGoal({min=150,max=500}):AddHook('OnNPCKilled',2,function(self,k,l,m)self:UpdateObjective('dailykill',1)end)srp.quests.CreateObjective('steps'):SetDescription('Walk # Steps'):SetGoal({min=2000,max=5000}):AddHook('PlayerFootstep',1,function(self,h,n,o,p,q,r)if o==1 then self:UpdateObjective('steps',2)end end)srp.quests.CreateObjective('collect'):SetDescription('Collect # resources'):SetGoal({min=15,max=50}):AddHook('OnResourceCollected',1,function(self,h,j)self:UpdateObjective('collect',j)end)srp.quests.CreateObjective('moduleinspect'):SetDescription('Inspect # modules'):SetGoal({min=4,max=8}):AddHook('OnModuleInspected',2,function(self,s,h)h.LastModule=h.LastModule||{}if h.LastModule[s]&&h.LastModule[s]>CurTime()then return end;h.LastModule[s]=CurTime()+30;self:UpdateObjective('moduleinspect',1)end)srp.quests.CreateObjective('revive','medic',true):SetDescription('Revive # subjects'):SetGoal({min=5,max=15}):SetFilter(function(self,h)return h:HasPermission'medic'end):AddHook('OnPlayerRevived',2,function(self,t,h)self:UpdateObjective('revive',1)end)srp.quests.CreateObjective('packages'):SetDescription('Deliver # packages'):SetGoal({min=15,max=25}):AddHook('OnPalletDroppedOff',2,function(self,u,h,v)if IsValid(u)&&u.SpawnedByPallet then self:UpdateObjective('packages',1)end end)srp.quests.CreateObjective('patrols'):SetDescription('Complete # patrols'):SetGoal({min=2,max=4}):AddHook('OnPatrolEnded',-1,function(self,w,x)local y=w.players;local h=self.quest:GetPlayer()if table.HasValue(w.players,h)then self:UpdateObjective('patrols',1)end end)srp.quests.CreateObjective('gambling'):SetDescription('# RC in gambling winnings'):SetGoal({min=50000,max=150000}):AddHook('PlayerGamble',1,function(self,h,z,A,B,C)if C then self:UpdateObjective('gambling',B)end end)srp.quests.CreateObjective('eventrating'):SetDescription('Rate an S1 event'):SetGoal(1):AddHook('OnEventRating',1,function(self,h,b,D,E,F)if!info.Main then return end;self:UpdateObjective('eventrating',1)end)srp.quests.CreateStep('daily','Complete Daily!'):SetFaction('cis_basic'):OnEnded(function(self)return{timeout=5}end)local G=srp.quests.Create('dailies','Dailies',srp.quests.TYPE_DAILY):SetDescription([[]]):SetFaction('cis_basic'):SetAvatar('501Rex'):SetGenerated()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/quests/virtualwaves_sh.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/gamemode/config/quests/virtualwaves_sh.lua:
local a={'cis_basic','zombies'}local b={'CIS Faction','Zombie Faction'}srp.quests.CreateStep('wave_select','Wave Select'):SetDescription('Select a faction to fight! (F3 to show cursor)'):AddObjective('faction','Vote for a faction!',1):OnStarted(function(self,c)self:StartVote(25,b)end):OnVoteEnded(function(self,d)self.VoteWinner=d;self:UpdateObjective('faction',1)end):OnEnded(function(self)return{faction=a[self.VoteWinner||1],timeout=2}end)srp.quests.CreateStep('wave_spawn','Virtual Attack'):SetDescription('Hunt down the virtual scum and kill them!'):SetFaction('cis_basic'):SetCallouts({Title='{AvatarName}',Description='There are contacts in #!'}):AddAvatar('start_alternative',{Title='{AvatarName}',Description='Virtual enemies spawned, take them out!'}):AddAvatar('ending',{Title='{AvatarName}',Description='All cleaned up. Well done!'}):AddObjective('kill','Kill # Enemies!',function(e,f,g,h,i)return math.ceil(util.SharedRandom(h,1+499*i,500+500*i,0))end):AddHook('OnNPCKilled',function(self,j)if j.Invasion then self:UpdateObjective('kill',1)end end):OnStarted(function(self,f,k)if k.faction then self:SetFaction(k.faction)end;self:DisplayAvatar('start_alternative',6)self:SetDefcon(4)self:SpawnFaction(7,math.random(145,160))self:PlaySound('phx/kaboom.wav')self:PlaySound('phx/kaboom.wav',.5)self:PlaySound('phx/kaboom.wav',.7)end):OnEnded(function(self)self:ClearSpawns()self:DisplayAvatar('cis_warning3',2)self:DisplayAvatar('ending',6)self:GiveAllMoney(1500)self:SetDefcon(6)return{timeout=10}end)srp.quests.Create('virtualwaves','Virtual Defence',srp.quests.TYPE_ALL):SetDescription([[]]):SetAvatar('501Rex'):AddSteps({{id='wait',name='Interfacing...',description='...asdgun\';][sdgiu[aeno]asdls;z;lsfamgsa',min=3,max=8,lines={'Staring up training routines.','Routine startup complete. Initializing votes.'}},'wave_select','wave_spawn','wave_select','wave_spawn'})
--addons/!lpakr_out/lua/weapons/basecombatweapon2/shared.lua:
local a=0;local b=0;local c=0.0;local d=false;local e=false;local f=0.0;SWEP.Spawnable=false;SWEP.Category="Source Base"SWEP.Author="code_gs"SWEP.BulletSpread=VECTOR_CONE_15DEGREES;SWEP.ReloadsSingly=false;SWEP.Primary={Ammo="none",ClipSize=-1,DefaultClip=0,Automatic=true,Damage=0.0,Cooldown=0.0}SWEP.Secondary={Ammo="none",ClipSize=-1,DefaultClip=0,Automatic=true,Damage=0.0,Cooldown=0.0}SWEP.Sounds={["primary"]="",["secondary"]="",["reload"]="",["empty"]="",["special"]=""}SWEP.ActTable={["ACT_MP_STAND_IDLE"]="ACT_HL2MP_IDLE",["ACT_MP_WALK"]="ACT_HL2MP_WALK",["ACT_MP_RUN"]="ACT_HL2MP_RUN",["ACT_MP_CROUCH_IDLE"]="ACT_HL2MP_IDLE_CROUCH",["ACT_MP_CROUCHWALK"]="ACT_HL2MP_WALK_CROUCH",["ACT_MP_ATTACK_STAND_PRIMARYFIRE"]="ACT_HL2MP_GESTURE_RANGE_ATTACK",["ACT_MP_ATTACK_CROUCH_PRIMARYFIRE"]="ACT_HL2MP_GESTURE_RANGE_ATTACK",["ACT_MP_RELOAD_STAND"]="ACT_HL2MP_GESTURE_RELOAD",["ACT_MP_RELOAD_CROUCH"]="ACT_HL2MP_GESTURE_RELOAD",["ACT_MP_JUMP"]="ACT_HL2MP_JUMP_SLAM",["ACT_MP_SWIM"]="ACT_HL2MP_SWIM",["ACT_MP_SWIM_IDLE"]="ACT_HL2MP_SWIM_IDLE"}SWEP.IdleOnEmpty=true;SWEP.Activities={["primary"]=ACT_VM_PRIMARYATTACK,["secondary"]=ACT_VM_SECONDARYATTACK,["reload"]=ACT_VM_RELOAD,["deploy"]=ACT_VM_DRAW,["holster"]=ACT_VM_HOLSTER,["idle"]=ACT_VM_IDLE}function SWEP:Initialize()self.m_fThinkFunc=self.ItemFrame;self.m_flNextEmptySoundTime=0.0;a=0;b=0;c=0 end;function SWEP:SetupDataTables()self:NetworkVar("Float",0,"NextIdle")self:NetworkVar("Float",1,"NextReload")end;function SWEP:Precache()util.PrecacheModel(self.ViewModel)util.PrecacheModel(self.WorldModel)for g,h in pairs(self.Sounds)do if istable(h)then for g,i in ipairs(h)do util.PrecacheSound(i)end elseif h!=""then util.PrecacheSound(h)end end end;function SWEP:GetViewModel()return self.ViewModel end;function SWEP:SetViewModel(j,k)local l=self.Owner;if!IsValid(l)then return false end;local m=l:GetViewModel(k)if!IsValid(m)then return false end;if k==0 then self.ViewModel=j end;m:SetWeaponModel(j,self)end;function SWEP:GetWorldModel()return self.WorldModel end;function SWEP:GetPrintName()return self.PrintName end;function SWEP:GetMaxClip1()return self.Primary.ClipSize end;function SWEP:GetMaxClip2()return self.Secondary.ClipSize end;function SWEP:GetDefaultClip1()return self.Primary.DefaultClip end;function SWEP:GetDefaultClip2()return self.Secondary.DefaultClip end;function SWEP:UsesClipsForAmmo1()return self.Primary.ClipSize>0 end;function SWEP:UsesClipsForAmmo2()return self.Secondary.ClipSize>0 end;function SWEP:GetWeight()return self.Weight end;function SWEP:AllowsAutoSwitchTo()return self.AutoSwitchTo end;function SWEP:AllowsAutoSwtichFrom()return self.AutoSwitchFrom end;function SWEP:GetSlot()return self.Slot end;function SWEP:GetPosition()return self.SlotPos end;function SWEP:GetOwner()return self.Owner end;function SWEP:UsesHands()return self.UseHands end;function SWEP:FlipsViewModel()return self.ViewModelFlip end;function SWEP:LookupSound(n)local h=self.Sounds[n:lower()]if istable(h)then return h[math.random(1,#h)]end;return h||""end;function SWEP:LookupActivity(o)return self.Activities[o:lower()]||ACT_INVALID end;function SWEP:CanBeSelected()return self:VisibleInWeaponSelection()&&self:HasAmmo()||false end;function SWEP:HasAmmo()if self.Primary.Ammo==-1&&self.Secondary.Ammo==-1 then return true elseif bit.band(self:GetFlags(),ITEM_FLAG_SELECTONEMPTY)then return true end;local p=self.Owner;if!IsValid(p)then return false end;return self:Clip1()>0||p:GetAmmoCount(self.Primary.Ammo)||self:Clip2()>0||p:GetAmmoCount(self.Secondary.Ammo)end;function SWEP:VisibleInWeaponSelection()return true end;function SWEP:HasIdleTimeElapsed()local q=self:GetNextIdle()if q>-1&&CurTime()>self:GetNextIdle()then return true end;return false end;function SWEP:Drop(r)end;function SWEP:MakeTracer(s,t,u)local l=self.Owner;if!IsValid(l)then return end;local v=self:GetTracerType()local w=l:EntIndex()if game.Multiplayer()then w=self:EntIndex()end;local x=self:GetTracerAttachment()if u==TRACER_LINE||u==TRACER_LINE_AND_WHIZ then util.Tracer(s,t.HitPos,w,x,0.0,true,v)end end;function SWEP:ShouldDisplayAltFireHUDHint()if b>=WEAPON_RELOAD_HUD_HINT_COUNT then return false elseif self:UsesSecondaryAmmo()&&self:HasSecondaryAmmo()then return true elseif!self:UsesSecondaryAmmo()&&self:HasPrimaryAmmo()then return true end;return false end;function SWEP:DisplayAltFireHudHint()end;function SWEP:RescindAltFireHudHint()end;function SWEP:ShouldDisplayReloadHUDHint()if a>=WEAPON_RELOAD_HUD_HINT_COUNT then return false end;local l=self.Owner;if IsValid(self.Owner)&&l:IsPlayer()&&self:UsesClipsForAmmo1()&&self:Clip1()<self:GetMaxClip1()/2 then if l:GetAmmoCount(self.Primary.Ammo)>0 then return true end end;return false end;function SWEP:DisplayReloadHudHint()end;function SWEP:RescindReloadHudHint()end;SWEP.m_ActivityTimes={}function SWEP:IsViewModelSequenceFinished()local y=self:_GetActivity()if y==ACT_RESET||y==ACT_INVALID then return true end;local l=self.Owner;if!IsValid(l)then return false end;local m=l:GetViewModel()if!IsValid(m)then return false end;if!self.m_ActivityTimes[y]then ErrorNoHalt("Activity ",y," not registered!")return true end;return self.m_ActivityTimes[y]<=CurTime()end;function SWEP:_SendWeaponAnim(y,z)self:SendWeaponAnim(y)local q=CurTime()+self:SequenceDuration()+(z||0)self.m_ActivityTimes[y]=q;if self:GetNextIdle()!=-1 then self:SetNextIdle(q)end end;function SWEP:HasAnyAmmo()if!self:UsesPrimaryAmmo()&&!self:UsesSecondaryAmmo()then return true end;return self:HasPrimaryAmmo()||self:HasSecondaryAmmo()end;function SWEP:HasPrimaryAmmo()if self:UsesClipsForAmmo1()then if self:Clip1()>0 then return true end end;local l=self.Owner;if IsValid(l)then if l:GetAmmoCount(self.Primary.Ammo)>0 then return true end else if self:GetPrimaryAmmoCount()>0 then return true end end;return false end;function SWEP:HasSecondaryAmmo()if self:UsesClipsForAmmo2()then if self:Clip2()>0 then return true end end;local l=self.Owner;if IsValid(l)then if l:GetAmmoCount(self.Secondary.Ammo)>0 then return true end end;return false end;function SWEP:UsesPrimaryAmmo()return game.GetAmmoID(self.Secondary.Ammo)>0 end;function SWEP:UsesSecondaryAmmo()return game.GetAmmoID(self.Secondary.Ammo)>0 end;function SWEP:SetWeaponVisible(A)local m=NULL;local l=self.Owner;if IsValid(l)then m=l:GetViewModel()end;if A then self:RemoveEffects(EF_NODRAW)if IsValid(m)then m:RemoveEffects(EF_NODRAW)end else self:AddEffects(EF_NODRAW)if IsValid(m)then m:AddEffects(EF_NODRAW)end end end;function SWEP:IsWeaponVisible()local m;local l=self.Owner;if IsValid(l)then m=l:GetViewModel()if IsValid(m)then return!m:IsEffectActive(EF_NODRAW)end end end;function SWEP:ReloadOrSwitchWeapons()local l=self.Owner;if!IsValid(l)then return end;local B=CurTime()local C=self:GetNextPrimaryFire()local D=self:GetNextSecondaryFire()self.m_bFireOnEmpty=false;if!self:HasAnyAmmo()&&C<B&&D<B then if bit.band(self:GetFlags(),ITEM_FLAG_NOAUTOSWITCHEMPTY)==0&&GM:SwitchToNextBestWeapon(l,self)then self:SetNextPrimaryFire(B+0.3)return true end else if self:UsesClipsForAmmo1()&&self:Clip1()==0&&bit.band(self:GetFlags(),ITEM_FLAG_NOAUTORELOAD)==0&&C<B&&D<B then if self:Reload()then return true end end end;return false end;function SWEP:DefaultDeploy()if!self:CanDeploy()then return false end;local l=self.Owner;if IsValid(l)then if!l:Alive()then return false end;self:_SendWeaponAnim(self:LookupActivity("deploy"))timer.Simple(0,function()self:SetWeaponVisible(true)end)end;self.m_fThinkFunc=self.ItemFrame;local E=CurTime()+self:SequenceDuration()self:SetNextPrimaryFire(E)self:SetNextSecondaryFire(E)self:SetNextReload(E)c=0;d=false;e=false;f=CurTime()+5.0;return true end;function SWEP:Deploy()return self:CanDeploy()end;function SWEP:SharedDeploy()return self:DefaultDeploy(self:LookupActivity("deploy"))end;function SWEP:SetThinkFunction(F)self.m_fThinkFunc=F end;function SWEP:GetThinkFunction()return self.m_fThinkFunc end;function SWEP:GetLastWeapon()return self end;function SWEP:CanLower()return false end;function SWEP:Ready()return false end;function SWEP:Lower()return false end;function SWEP:_GetActivity()return self:GetSequenceActivity(self:GetSequence())end;function SWEP:DefaultHolster(G,y)self:SetNextReload(CurTime())timer.Simple(0,function()if IsValid(self)then self.m_fThinkFunc=function()end end end)self:PurgeContextThink()if c&&CurTime()<c then if d then self:RescindAltFireHudHint()end;if e then self:RescindReloadHudHint()end end;return true end;function SWEP:Holster(G)return self:DefaultHolster(G,self.Activities["holster"])end;function SWEP:CanHolster()return true end;function SWEP:ItemFrame()local l=self.Owner;if!IsValid(l)then return end;if!(d||e)&&CurTime()<c&&CurTime()>f then if pPlayer:GetStickDist()>0.0 then if self:ShouldDisplayReloadHUDHint()then self:DisplayReloadHudHint()elseif self:ShouldDisplayAltFireHUDHint()then self:DisplayAltFireHudHint()end else f=CurTime()+2.0 end end;if self:UsesClipsForAmmo1()then end;if!(l:KeyDown(IN_ATTACK)||l:KeyDown(IN_ATTACK2)||l:KeyDown(IN_RELOAD))&&!self:ReloadOrSwitchWeapons()&&!self:InReload()then self:Idle()end end;function SWEP:Think()self:SimulateContextThink()self.m_fThinkFunc(self)end;SWEP.m_tContexts={}SWEP.m_pContexts={}SWEP.m_Mappings={}function SWEP:AddContextThink(o,H,I,J,K)local L=CurTime()if!bRunInitialy then L=L+I end;local M=function()if CurTime()>=L then if H(self)then return true end;L=CurTime()+I end end;for N=0,math.max(#self.m_tContexts,#self.m_pContexts)do if self.m_Mappings[N]==o then if K then self.m_pContexts[N]=M else self.m_tContexts[N]=M end end end;if K then self.m_Mappings[table.insert(self.m_pContexts,M)]=o else self.m_Mappings[table.insert(self.m_tContexts,M)]=o end end;function SWEP:SimulateContextThink()for N=1,math.max(#self.m_tContexts,#self.m_pContexts)do if self.m_tContexts[N]&&self.m_tContexts[N]()then self.m_tContexts[N]=nil elseif self.m_pContexts[N]&&self.m_pContexts[N]()then self.m_pContexts[N]=nil end end end;function SWEP:PurgeContextThink()self.m_tContexts={}end;function SWEP:HandleFireOnEmpty()if self.m_bFireOnEmpty then self:ReloadOrSwitchWeapons()else if self.m_flNextEmptySoundTime<CurTime()then self:PlaySound("empty")self.m_flNextEmptySoundTime=CurTime()+0.5 end;self.m_bFireonEmpty=true end end;function SWEP:GetBulletSpread(O)return self.BulletSpread end;function SWEP:GetPrimaryFireRate()return self.Primary.Cooldown end;function SWEP:GetSecondaryFireRate()return self.Secondary.Cooldown end;function SWEP:GetPrimaryDamage(P,Q)return self.Primary.Damage end;function SWEP:GetSecondaryDamage(P,Q)return self.Primary.Damage end;function SWEP:AddViewModelBob(R,S)end;function SWEP:CalcViewmodelBob()return 0.0 end;function SWEP:ShouldShowControlPanels()return true end;function SWEP:CanBePickedUpByNPCs()return true end;function SWEP:GetPrimaryAmmoType()return self.Primary.Ammo end;function SWEP:GetSecondaryAmmoType()return self.Secondary.Ammo end;function SWEP:PlaySound(T,U)U=U||0;local pPlayer=self.Owner;local V=self:LookupSound(T)if!V then return end;local W;pPlayer:EmitSound(V)end;function SWEP:StopWeaponSound(T)end;function SWEP:_DefaultReload()if CLIENT||!(self:UsesClipsForAmmo1()&&self:UsesClipsForAmmo2())||self:InReload()then return false end;local l=self.Owner;if!IsValid(l)then return false end;if l:GetAmmoCount(self.Primary.Ammo)<=0 then return false end;local X=false;if self:UsesClipsForAmmo1()then local Y=math.min(self:GetMaxClip1()-self:Clip1(),l:GetAmmoCount(self.Primary.Ammo))if Y!=0 then X=true end end;if self:UsesClipsForAmmo2()then local Z=math.min(self:GetMaxClip2()-self:Clip2(),l:GetAmmoCount(self.Secondary.Ammo))if Z!=0 then X=true end end;if!X then return false end;if CLIENT then self:PlaySound("reload")end;self:_SendWeaponAnim(self:LookupActivity("reload"))l:SetAnimation(l:LookupAnimation("reload"))local _=self:SequenceDuration()self:AddContextThink("BaseCombatWeapon - FinishReload",function()self:FinishReload()return true end,_)_=_+CurTime()self:SetNextPrimaryFire(_)self:SetNextSecondaryFire(_)self:SetNextReload(_)return true end;function SWEP:Reload()return self:_DefaultReload()end;function SWEP:InReload()return self:GetNextReload()>CurTime()end;function SWEP:Idle()if self:HasIdleTimeElapsed()&&(!self.IdleOnEmpty&&self:UsesClipsForAmmo1()&&self:Clip1()>0||self.IdleOnEmpty)then self:_SendWeaponAnim(self:LookupActivity("idle"))return true end;return false end;function SWEP:IsWeaponZoomed()return false end;function SWEP:CheckReload()if self.m_bReloadsSingly then local l=self.Owner;local a0=self:Clip1()if!IsValid(l)then return end;if self:InReload()&&self:GetNextPrimaryFire()<=CurTime()then if(l:KeyDown(IN_ATTACK)||l:KeyDown(IN_ATTACK2))&&a0>0 then self:SetNextReload(CurTime())return end;if l:GetAmmoCount(self.Primary.Ammo)<=0 then self:FinishReload()return elseif a0<self:GetMaxClip1()then self:SetClip1(a0+1)l:RemoveAmmo(1,self.Primary.Ammo)self:Reload()return else self:FinishReload()self:SetNextPrimaryFire(CurTime())self:SetNextSecondaryFire(CurTime())return end end end end;function SWEP:FinishReload()local l=self.Owner;local a0=self:Clip1()local a1=self:Clip2()if IsValid(l)then if self:UsesClipsForAmmo1()then local Y=math.min(self:GetMaxClip1()-a0,l:GetAmmoCount(self.Primary.Ammo))self:SetClip1(a0+Y)l:RemoveAmmo(Y,self.Primary.Ammo)end;if self:UsesClipsForAmmo2()then local Z=math.min(self:GetMaxClip2()-a1,l:GetAmmoCount(self.Secondary.Ammo))self:SetClip2(a1+Z)l:RemoveAmmo(Z,self.Secondary.Ammo)end;if self.m_bReloadsSingly then self:SetNextReload(CurTime())end end end;function SWEP:AbortReload()if CLIENT then self:StopWeaponSound("reload")end;self:SetNextReload(CurTime())end;function SWEP:PrimaryAttack()local a0=self:Clip1()if self:UsesClipsForAmmo1()&&a0<=0 then self:HandleFireOnEmpty()return end;self:DoFireEffects()local pPlayer=self.Owner;if!IsValid(pPlayer)then return end;local a2={}a2.Src=pPlayer:GetShootPos()a2.Dir=pPlayer:GetAimVector()a2.Num=0;local a3=self:GetPrimaryFireRate()local C=self:GetNextPrimaryFire()while C<=CurTime()do self:PlaySound("primary",C)self:SetNextPrimaryFire(C+a3)a2.Num=a2.Num+1;if a3==0 then break end end;if self:UsesClipsForAmmo1()then a2.Num=math.min(a2.Num,a0)a0=a0-a2.Num;self:SetClip1(a0)else a2.Num=math.min(a2.Num,pPlayer:GetAmmoCount(self.Primary.Ammo))pPlayer:RemoveAmmo(a2.Num,self.Primary.Ammo)end;a2.Distance=MAX_TRACE_LENGTH;a2.AmmoType=self.Primary.Ammo;a2.Tracer=2;if SERVER then else a2.Spread=self:GetBulletSpread()end;pPlayer:FireBullets(a2)if a0<=0&&pPlayer:GetAmmoCount(self.Primary.Ammo)<=0 then end end;function SWEP:SecondaryAttack()end;function SWEP:FireBullets()end;function SWEP:GetControlPanelInfo(a4,a5)return NULL end;function SWEP:GetControlPanelClassName(a4,a5)return"vgui_screen"end;function SWEP:CanDeploy()return true end;function SWEP:GetDefaultAnimSpeed()return 1.0 end;function SWEP:GetAnimPrefix()return end;ACT_HL2MP_SWIM=ACT_HL2MP_IDLE+9;ACT_RANGE_ATTACK=ACT_HL2MP_IDLE+8;ACT_HL2MP_SWIM_IDLE=2057;SWEP.HoldTypes={["normal"]={[ACT_MP_STAND_IDLE]=ACT_HL2MP_IDLE,[ACT_MP_WALK]=ACT_HL2MP_WALK,[ACT_MP_RUN]=ACT_HL2MP_RUN,[ACT_MP_CROUCH_IDLE]=ACT_HL2MP_IDLE_CROUCH,[ACT_MP_CROUCHWALK]=ACT_HL2MP_WALK_CROUCH,[ACT_MP_ATTACK_STAND_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK,[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK,[ACT_MP_RELOAD_STAND]=ACT_HL2MP_GESTURE_RELOAD,[ACT_MP_RELOAD_CROUCH]=ACT_HL2MP_GESTURE_RELOAD,[ACT_MP_JUMP]=ACT_HL2MP_JUMP_SLAM,[ACT_RANGE_ATTACK1]=ACT_HL2MP_GESTURE_RANGE_ATTACK,[ACT_MP_SWIM]=ACT_HL2MP_SWIM,[ACT_MP_SWIM_IDLE]=ACT_HL2MP_SWIM_IDLE},["pistol"]={[ACT_MP_STAND_IDLE]=ACT_HL2MP_IDLE_PISTOL,[ACT_MP_WALK]=ACT_HL2MP_WALK_PISTOL,[ACT_MP_RUN]=ACT_HL2MP_RUN_PISTOL,[ACT_MP_CROUCH_IDLE]=ACT_HL2MP_IDLE_CROUCH_PISTOL,[ACT_MP_CROUCHWALK]=ACT_HL2MP_WALK_CROUCH_PISTOL,[ACT_MP_ATTACK_STAND_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,[ACT_MP_RELOAD_STAND]=ACT_HL2MP_GESTURE_RELOAD_PISTOL,[ACT_MP_RELOAD_CROUCH]=ACT_HL2MP_GESTURE_RELOAD_PISTOL,[ACT_MP_JUMP]=ACT_HL2MP_JUMP_PISTOL,[ACT_RANGE_ATTACK1]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,[ACT_MP_SWIM]=ACT_HL2MP_SWIM_PISTOL,[ACT_MP_SWIM_IDLE]=ACT_HL2MP_SWIM_IDLE_PISTOL},["fist"]={[ACT_MP_STAND_IDLE]=ACT_HL2MP_IDLE_FIST,[ACT_MP_WALK]=ACT_HL2MP_WALK_FIST,[ACT_MP_RUN]=ACT_HL2MP_RUN_FIST,[ACT_MP_CROUCH_IDLE]=ACT_HL2MP_IDLE_CROUCH_FIST,[ACT_MP_CROUCHWALK]=ACT_HL2MP_WALK_CROUCH_FIST,[ACT_MP_ATTACK_STAND_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST,[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST,[ACT_MP_RELOAD_STAND]=ACT_HL2MP_GESTURE_RELOAD_FIST,[ACT_MP_RELOAD_CROUCH]=ACT_HL2MP_GESTURE_RELOAD_FIST,[ACT_MP_JUMP]=ACT_HL2MP_JUMP_FIST,[ACT_RANGE_ATTACK1]=ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST,[ACT_MP_SWIM]=ACT_HL2MP_SWIM_FIST,[ACT_MP_SWIM_IDLE]=ACT_HL2MP_SWIM_IDLE_FIST},["passive"]={[ACT_MP_STAND_IDLE]=ACT_HL2MP_IDLE_PASSIVE,[ACT_MP_WALK]=ACT_HL2MP_WALK_PASSIVE,[ACT_MP_RUN]=ACT_HL2MP_RUN_PASSIVE,[ACT_MP_CROUCH_IDLE]=ACT_HL2MP_IDLE_CROUCH_PASSIVE,[ACT_MP_CROUCHWALK]=ACT_HL2MP_WALK_CROUCH_PASSIVE,[ACT_MP_ATTACK_STAND_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PASSIVE,[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PASSIVE,[ACT_MP_RELOAD_STAND]=ACT_HL2MP_GESTURE_RELOAD_PASSIVE,[ACT_MP_RELOAD_CROUCH]=ACT_HL2MP_GESTURE_RELOAD_PASSIVE,[ACT_MP_JUMP]=ACT_HL2MP_JUMP_PASSIVE,[ACT_RANGE_ATTACK1]=ACT_HL2MP_GESTURE_RANGE_ATTACK_PASSIVE,[ACT_MP_SWIM]=ACT_HL2MP_SWIM_PASSIVE,[ACT_MP_SWIM_IDLE]=ACT_HL2MP_SWIM_IDLE_PASSIVE},["ar2"]={[ACT_MP_STAND_IDLE]=ACT_HL2MP_IDLE_AR2,[ACT_MP_WALK]=ACT_HL2MP_WALK_AR2,[ACT_MP_RUN]=ACT_HL2MP_RUN_AR2,[ACT_MP_CROUCH_IDLE]=ACT_HL2MP_IDLE_CROUCH_AR2,[ACT_MP_CROUCHWALK]=ACT_HL2MP_WALK_CROUCH_AR2,[ACT_MP_ATTACK_STAND_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,[ACT_MP_RELOAD_STAND]=ACT_HL2MP_GESTURE_RELOAD_AR2,[ACT_MP_RELOAD_CROUCH]=ACT_HL2MP_GESTURE_RELOAD_AR2,[ACT_MP_JUMP]=ACT_HL2MP_JUMP_AR2,[ACT_RANGE_ATTACK1]=ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,[ACT_MP_SWIM]=ACT_HL2MP_SWIM_AR2,[ACT_MP_SWIM_IDLE]=ACT_HL2MP_SWIM_IDLE_AR2},["grenade"]={[ACT_MP_STAND_IDLE]=ACT_HL2MP_IDLE_GRENADE,[ACT_MP_WALK]=ACT_HL2MP_WALK_GRENADE,[ACT_MP_RUN]=ACT_HL2MP_RUN_GRENADE,[ACT_MP_CROUCH_IDLE]=ACT_HL2MP_IDLE_CROUCH_GRENADE,[ACT_MP_CROUCHWALK]=ACT_HL2MP_WALK_CROUCH_GRENADE,[ACT_MP_ATTACK_STAND_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]=ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,[ACT_MP_RELOAD_STAND]=ACT_HL2MP_GESTURE_RELOAD_GRENADE,[ACT_MP_RELOAD_CROUCH]=ACT_HL2MP_GESTURE_RELOAD_GRENADE,[ACT_MP_JUMP]=ACT_HL2MP_JUMP_GRENADE,[ACT_RANGE_ATTACK1]=ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,[ACT_MP_SWIM]=ACT_HL2MP_SWIM_GRENADE,[ACT_MP_SWIM_IDLE]=ACT_HL2MP_SWIM_IDLE_GRENADE}}function SWEP:SetWeaponHoldType(a6)self.ActTable=self.HoldTypes[a6]||self.ActTable end;function SWEP:RegisterHoldType(a6,a7)self.HoldTypes[a6]=a7 end;function SWEP:GetActTable()return self.ActTable end;function SWEP:SetActTable(a7)self.ActTable=a7 end;local a8={[ACT_MP_STAND_IDLE]="ACT_MP_STAND_IDLE",[ACT_MP_WALK]="ACT_MP_WALK",[ACT_MP_RUN]="ACT_MP_RUN",[ACT_MP_CROUCH_IDLE]="ACT_MP_CROUCH_IDLE"}local a9=false;function SWEP:TranslateActivity(aa)if a9 then if aa==ACT_RANGE_ATTACK1 then print"BaseCombatWeapon: Range Attack called"end end;if aa==ACT_MP_SWIM&&!(self.Owner:KeyDown(KEY_W)||self.Owner:KeyDown(KEY_A)||self.Owner:KeyDown(KEY_S)||self.Owner:KeyDown(KEY_D))then aa=ACT_MP_SWIM_IDLE end;if a9 then local ab=self.Owner:GetSequenceActivityName(self.Owner:SelectWeightedSequence(aa))if!self.ActTable[aa]&&(ab!="Not Found!"&&ab!=ACT_GMOD_NOCLIP_LAYER&&ab!=ACT_LAND)then print("BaseCombatWeapon: Unregistered sequence - "..ab)end end;if a9 then print("Quick: "..QuickTranslation[aa])print("Act: "..self.ActTable[QuickTranslation[aa]])end;return self.ActTable[aa]||-1 end;function SWEP:DoFireEffects()self:_SendWeaponAnim(self:LookupActivity("primary"))self:PlaySound("primary")local pPlayer=self.Owner;if IsValid(pPlayer)then pPlayer:MuzzleFlash()pPlayer:SetAnimation(pPlayer:LookupAnimation("attack"))end end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/baseknife.lua:
AddCSLuaFile()sound.Add({name="csgo_knife.Deploy",channel=CHAN_WEAPON,volume=0.4,level=65,sound="csgo_knife/knife_deploy1.wav"})sound.Add({name="csgo_knife.Hit",channel=CHAN_WEAPON,volume=1.0,level=65,sound={"csgo_knife/knife_hit1.wav","csgo_knife/knife_hit2.wav","csgo_knife/knife_hit3.wav","csgo_knife/knife_hit4.wav"}})sound.Add({name="csgo_knife.HitWall",channel=CHAN_WEAPON,volume=1.0,level=65,sound={"csgo_knife/knife_hit_01.wav","csgo_knife/knife_hit_02.wav","csgo_knife/knife_hit_03.wav","csgo_knife/knife_hit_04.wav","csgo_knife/knife_hit_05.wav"}})sound.Add({name="csgo_knife.Slash",channel=CHAN_WEAPON,volume={0.5,1.0},pitch={97,105},level=65,sound={"csgo_knife/knife_slash1.wav","csgo_knife/knife_slash2.wav"}})sound.Add({name="csgo_knife.Stab",channel=CHAN_WEAPON,volume=1.0,level=65,sound="csgo_knife/knife_stab.wav"})sound.Add({name="csgo_ButterflyKnife.backstab01",channel=CHAN_ITEM,volume=0.4,soundlevel=65,sound="csgo_knife/bknife_backstab01.wav"})sound.Add({name="csgo_ButterflyKnife.backstab02",channel=CHAN_ITEM,volume=0.4,soundlevel=65,sound="csgo_knife/bknife_backstab02.wav"})sound.Add({name="csgo_ButterflyKnife.draw01",channel=CHAN_ITEM,volume=0.6,soundlevel=65,sound="csgo_knife/bknife_draw01.wav"})sound.Add({name="csgo_ButterflyKnife.draw02",channel=CHAN_ITEM,volume=0.6,soundlevel=65,sound="csgo_knife/bknife_draw02.wav"})sound.Add({name="csgo_ButterflyKnife.look01_a",channel=CHAN_ITEM,volume=0.4,soundlevel=65,sound="csgo_knife/bknife_look01_a.wav"})sound.Add({name="csgo_ButterflyKnife.look01_b",channel=CHAN_ITEM,volume=0.4,soundlevel=65,sound="csgo_knife/bknife_look01_b.wav"})sound.Add({name="csgo_ButterflyKnife.look02_a",channel=CHAN_ITEM,volume=0.4,soundlevel=65,sound="csgo_knife/bknife_look02_a.wav"})sound.Add({name="csgo_ButterflyKnife.look02_b",channel=CHAN_ITEM,volume=0.4,soundlevel=65,sound="csgo_knife/bknife_look02_b.wav"})sound.Add({name="csgo_ButterflyKnife.look03_a",channel=CHAN_ITEM,volume=0.4,soundlevel=65,sound="csgo_knife/bknife_look03_a.wav"})sound.Add({name="csgo_ButterflyKnife.look03_b",channel=CHAN_ITEM,volume=0.4,soundlevel=65,sound="csgo_knife/bknife_look03_b.wav"})sound.Add({name="csgo_KnifeFalchion.inspect",channel=CHAN_STATIC,volume=1,soundlevel=65,sound="csgo_knife/knife_falchion_inspect.wav"})sound.Add({name="csgo_KnifeFalchion.draw",channel=CHAN_STATIC,volume={0.4,0.9},pitch={97,105},soundlevel=65,sound="csgo_knife/knife_falchion_draw.wav"})sound.Add({name="csgo_KnifeFalchion.Catch",channel=CHAN_STATIC,volume={0.3,0.7},pitch={97,105},soundlevel=65,sound="csgo_knife/knife_falchion_catch.wav"})sound.Add({name="csgo_KnifeFalchion.Idlev2",channel=CHAN_STATIC,volume=1,soundlevel=65,sound="csgo_knife/knife_falchion_idle.wav"})sound.Add({name="csgo_Weapon.WeaponMove1",channel=CHAN_ITEM,volume=0.15,soundlevel=65,sound="csgo_knife/movement1.wav"})sound.Add({name="csgo_Weapon.WeaponMove3",channel=CHAN_ITEM,volume=0.15,soundlevel=65,sound="csgo_knife/movement3.wav"})sound.Add({name="csgo_Weapon.WeaponMove2",channel=CHAN_ITEM,volume=0.15,soundlevel=65,sound="csgo_knife/movement2.wav"})sound.Add({name="csgo_KnifePush.Attack1Heavy",channel=CHAN_STATIC,volume={0.1,0.2},pitch={98,105},level=65,sound={"csgo_knife/knife_push_attack1_heavy_01.wav","csgo_knife/knife_push_attack1_heavy_02.wav","csgo_knife/knife_push_attack1_heavy_03.wav","csgo_knife/knife_push_attack1_heavy_04.wav"}})sound.Add({name="csgo_KnifePush.LookAtStart",channel=CHAN_STATIC,volume=0.2,level=65,sound={"csgo_knife/knife_push_lookat_start.wav"}})sound.Add({name="csgo_KnifePush.LookAtEnd",channel=CHAN_STATIC,volume=0.2,level=65,sound={"csgo_knife/knife_push_lookat_end.wav"}})sound.Add({name="csgo_KnifePush.Draw",channel=CHAN_STATIC,volume=0.3,level=65,sound={"csgo_knife/knife_push_draw.wav"}})sound.Add({name="KnifeBowie.draw",channel=CHAN_STATIC,volume={0.7,0.8},pitch={99,100},level=65,sound={"csgo_knife/knife_bowie_draw.wav"}})sound.Add({name="KnifeBowie.LookAtStart",channel=CHAN_STATIC,volume={0.2,0.2},pitch={99,100},level=65,sound={"csgo_knife/knife_bowie_inspect_start.wav"}})sound.Add({name="KnifeBowie.LookAtEnd",channel=CHAN_STATIC,volume={0.2,0.3},pitch={99,101},level=65,sound={"csgo_knife/knife_bowie_inspect_end.wav"}})if CLIENT then SWEP.PrintName="baseknife"SWEP.DrawAmmo=false;SWEP.DrawCrosshair=true;SWEP.ViewModelFOV=65;SWEP.ViewModelFlip=false;SWEP.CSMuzzleFlashes=true;SWEP.UseHands=true end;SWEP.Category="SUP Weapons"SWEP.Spawnable=false;SWEP.AdminSpawnable=false;SWEP.DrawWeaponInfoBox=false;SWEP.Weight=5;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.Primary.ClipSize=-1;SWEP.Primary.Damage=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=true;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Damage=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.Slot=2;SWEP.SlotPos=0;function SWEP:SetupDataTables()self:NetworkVar("Float",0,"InspectTime")self:NetworkVar("Float",1,"IdleTime")end;function SWEP:Initialize()self:SetMaterial(self.Skin)self:SetHoldType(self.AreDaggers&&"fist"||"knife")end;function SWEP:Think()local a=self:GetOwner()a:GetViewModel():SetSkin(self.SkinIndex||0)if CurTime()>=self:GetIdleTime()then self.Weapon:SendWeaponAnim(ACT_VM_IDLE)self:SetIdleTime(CurTime()+a:GetViewModel():SequenceDuration())end end;function SWEP:Deploy()self:SetInspectTime(0)self:SetIdleTime(CurTime()+self:GetOwner():GetViewModel():SequenceDuration())self.Weapon:SendWeaponAnim(ACT_VM_DRAW)local b=1;self.Weapon:SetNextPrimaryFire(CurTime()+b)self.Weapon:SetNextSecondaryFire(CurTime()+b)return true end;function SWEP:EntityFaceBack(c)local d=self:GetOwner():GetAngles().y-c:GetAngles().y;if d<-180 then d=360+d end;if d<=90&&d>=-90 then return true end;return false end;function SWEP:PrimaryAttack()if CurTime()<self.Weapon:GetNextPrimaryFire()then return end;self:DoAttack(false)end;function SWEP:SecondaryAttack()if CurTime()<self.Weapon:GetNextSecondaryFire()then return end;self:DoAttack(true)end;function SWEP:DoAttack(e)local f=self.Weapon;local g=self:GetOwner()local h=e&&48||64;local i=g:GetAimVector()local j=g:EyePos()local k=j+i*h;local l;local m;local n;local o;g:LagCompensation(true)local p={}p.start=j;p.endpos=k;p.filter=g;p.mask=MASK_SOLID;p.mins=Vector(-16,-16,-18)p.maxs=Vector(16,16,18)local q=util.TraceLine(p)local r=util.TraceHull(p)local s=IsValid(r.Entity)&&r||q;g:LagCompensation(false)local t=s.Hit&&!s.HitSky;local u=s.Entity;local v=u&&(u:IsPlayer()||u:IsNPC())&&IsValid(u)if t then if u&&IsValid(u)then n=v&&self:EntityFaceBack(u)o=e&&(n&&160||80)||n&&100||math.random(0,5)==3&&70||50;local w=DamageInfo()w:SetAttacker(g)w:SetInflictor(self)w:SetDamage(o)w:SetDamageType(bit.bor(DMG_BULLET,DMG_NEVERGIB))w:SetDamageForce(i*1000)w:SetDamagePosition(k)u:DispatchTraceAttack(w,s,i)else util.Decal("ManhackCut",s.HitPos+s.HitNormal,s.HitPos-s.HitNormal)end end;local b=e&&1.0||t&&0.5||0.4;f:SetNextPrimaryFire(CurTime()+b)f:SetNextSecondaryFire(CurTime()+b)g:SetAnimation(PLAYER_ATTACK1)l=t&&(e&&(n&&ACT_VM_SWINGHARD||ACT_VM_HITCENTER2)||(n&&ACT_VM_SWINGHIT||ACT_VM_HITCENTER))||(e&&ACT_VM_MISSCENTER2||ACT_VM_MISSCENTER)if l then f:SendWeaponAnim(l)self:SetIdleTime(CurTime()+self:GetOwner():GetViewModel():SequenceDuration())end;local x="csgo_knife.Stab"local y="csgo_knife.Hit"local z="csgo_knife.HitWall"local A="csgo_knife.Slash"m=v&&(e&&x||y)||t&&z||A;if m then f:EmitSound(m)end;return true end;function SWEP:Reload()local B=self:GetSequence()local C=self:GetSequenceActivity(B)if C==ACT_VM_IDLE_LOWERED&&CurTime()<self:GetInspectTime()then self:SetInspectTime(CurTime()+0.1)return end;self.Weapon:SendWeaponAnim(ACT_VM_IDLE_LOWERED)self:SetIdleTime(CurTime()+self:GetOwner():GetViewModel():SequenceDuration())self:SetInspectTime(CurTime()+0.1)return true end
--addons/!lpakr_out/lua/weapons/cw_css_base/css_convert.lua:
m_weaponMode=1;CS_PLAYER_SPEED_RUN=260;CS_PLAYER_SPEED_VIP=227;CS_PLAYER_SPEED_WALK=100;CS_PLAYER_SPEED_SHIELD=160;CS_PLAYER_SPEED_STOPPED=1;CS_PLAYER_SPEED_OBSERVER=900;CS_PLAYER_SPEED_DUCK_MODIFIER=0.34;CS_PLAYER_SPEED_WALK_MODIFIER=0.52;CS_PLAYER_SPEED_CLIMB_MODIFIER=0.34;local a={}function SWEP:LoadCfgFile()local b=self:GetClass()if a[b]then return a[b]end;local c=util.KeyValuesToTable(file.Read('scripts/'..b..'.txt','GAME'),false)if!c then return end;local d={}d.m_flMaxSpeed=c.MaxPlayerSpeed||1;d.m_iDefaultPrice=c.WeaponPrice||-1;d.m_flArmorRatio=c.WeaponArmorRatio||1;d.m_iCrosshairMinDistance=c.CrosshairMinDistance||4;d.m_iCrosshairDeltaDistance=c.CrosshairDeltaDistance||3;d.m_bCanUseWithShield=c.CanEquipWithShield||false;d.m_flMuzzleScale=c.MuzzleFlashScale||1;d.pMuzzleFlashStyle=c.MuzzleFlashStyle||'CS_MUZZLEFLASH_NORM'd.m_iPenetration=c.Penetration||1;d.m_iDamage=c.Damage||36;d.m_flRange=c.Range||8192;d.m_flRangeModifier=c.RangeModifier||0.98;d.m_iBullets=c.Bullets||1;d.m_flCycleTime=c.CycleTime||0.15;d.m_bAccuracyQuadratic=c.AccuracyQuadratic||0;d.m_flAccuracyDivisor=c.AccuracyDivisor||-1;d.m_flAccuracyOffset=c.AccuracyOffset||0;d.m_flMaxInaccuracy=c.MaxInaccuracy||0;d.m_fSpread={}d.m_fSpread[1]=c.Spread||0;d.m_fSpread[2]=c.SpreadAlt||0;d.m_fInaccuracyCrouch={}d.m_fInaccuracyCrouch[1]=c.InaccuracyCrouch||0;d.m_fInaccuracyCrouch[2]=c.InaccuracyCrouchAlt||0;d.m_fInaccuracyStand={}d.m_fInaccuracyStand[1]=c.InaccuracyStand||0;d.m_fInaccuracyStand[2]=c.InaccuracyStandAlt||0;d.m_fInaccuracyJump={}d.m_fInaccuracyJump[1]=c.InaccuracyJump||0;d.m_fInaccuracyJump[2]=c.InaccuracyJumpAlt||0;d.m_fInaccuracyLand={}d.m_fInaccuracyLand[1]=c.InaccuracyLand||0;d.m_fInaccuracyLand[2]=c.InaccuracyLandAlt||0;d.m_fInaccuracyLadder={}d.m_fInaccuracyLadder[1]=c.InaccuracyLadder||0;d.m_fInaccuracyLadder[2]=c.InaccuracyLadderAlt||0;d.m_fInaccuracyImpulseFire={}d.m_fInaccuracyImpulseFire[1]=c.InaccuracyFire||0;d.m_fInaccuracyImpulseFire[2]=c.InaccuracyFireAlt||0;d.m_fInaccuracyMove={}d.m_fInaccuracyMove[1]=c.InaccuracyMove||0;d.m_fInaccuracyMove[2]=c.InaccuracyMoveAlt||0;d.m_fInaccuracyReload=c.InaccuracyReload||0;d.m_fInaccuracyAltSwitch=c.InaccuracyAltSwitch||0;d.m_fRecoveryTimeCrouch=c.RecoveryTimeCrouch||1.0;d.m_fRecoveryTimeStand=c.RecoveryTimeStand||1.0;d.m_flTimeToIdleAfterFire=c.TimeToIdle||2;d.m_flIdleInterval=c.IdleInterval||20;d.m_bFullAuto=c.FullAuto||false;self.WeaponData=d;a[b]=d end;SWEP.WeaponData={m_flMaxSpeed=221,m_bFullAuto=false,m_iCrosshairMinDistance=4,m_iCrosshairDeltaDistance=4,m_flMuzzleScale=1.6,m_iPenetration=2,m_iDamage=36,m_flRange=8192,m_flRangeModifier=0.98,m_iBullets=1,m_flCycleTime=0.1,m_flAccuracyDivisor=200,m_flAccuracyOffset=0.35,m_flMaxInaccuracy=1.25,m_flTimeToIdleAfterFire=1.9,m_flIdleInterval=20,pMuzzleFlashStyle='CS_MUZZLEFLASH_X',m_fSpread={0,0},m_fInaccuracyReload=0,m_fInaccuracyCrouch={0.00687},m_fInaccuracyStand={0.00916},m_fInaccuracyJump={0.43044},m_fInaccuracyLand={0.08609},m_fInaccuracyLadder={0.10761},m_fInaccuracyImpulseFire={0.01158},m_fInaccuracyMove={0.09222},m_fRecoveryTimeCrouch=0.34868,m_fRecoveryTimeStand=0.48815}local function e(f,g,h)return f>=0&&g||h end;local function i(j,k,l,m,n)if k==l then return e(j-l,n,m)end;local o=(j-k)/(l-k)o=math.Clamp(o,0.0,1.0)return m+(n-m)*o end;function SWEP:GetCSWpnData()return self.WeaponData end;function SWEP:GetInaccuracy()local p=self:GetOwner()if!IsValid(p)then return 0 end;local q=self:GetCSWpnData()local r=self:GetMaxSpeed()if r==0 then r=q.m_flMaxSpeed end;local s=self:GetAccuracyPenalty()return s+i(p:GetAbsVelocity():Length2D(),r*CS_PLAYER_SPEED_DUCK_MODIFIER,r*0.95,0.0,q.m_fInaccuracyMove[m_weaponMode])end;function SWEP:GetSpread()return self:GetCSWpnData().m_fSpread[m_weaponMode]end;function SWEP:GetMaxSpeed()local t=self:GetCSWpnData().m_flMaxSpeed;return t end;function SWEP:RandomSeed(u,v)return util.SharedRandom('cssBaseSharedSpreadSeed',u,v,self:EntIndex())end;function SWEP:FX_FireBullets(w,x,y,z,A)local B=true;local C=w:GetShootPos()local D=(w:EyeAngles()+w:GetViewPunchAngles()):Forward()local p=self:GetOwner()local E=self:GetCSWpnData()local F=E.m_iDamage;local G=E.m_flRange;local H=E.m_iPenetration;local I=E.m_flRangeModifier;local J=E.iAmmoType;local K=self:RandomSeed(0,2*math.pi)local L=self:RandomSeed(0,y)local M=L*math.cos(K)local N=L*math.sin(K)local O=16;local P,Q={},{}for R=1,E.m_iBullets do local S=self:RandomSeed(0,2*math.pi)local T=self:RandomSeed(0,z)P[R]=T*math.cos(S)Q[R]=T*math.sin(S)end;for R=1,E.m_iBullets do local U={Attacker=p,Inflictor=self,Num=1,Src=C,Dir=D,Damage=F,Distance=G,AmmoType=J,Spread=Vector(M+P[R],N+Q[R],0),TracerName=self.Primary.TracerName,Tracer=1,Callback=function(V,W,X)if SERVER then else registerTrace(W.StartPos,W.HitPos,true)end end}p:FireBullets(U)end end;if info.Dev then local Y={}function registerTrace(Z,_,a0)table.insert(Y,{src=Z,hit=_,cl=a0})end;hook('PostDrawTranslucentRenderables','srp.dev.renderTraces',function(a1)for a2,W in ipairs(Y)do render.DrawLine(W.src,W.hit,W.cl&&col.yellow||col.blue,true)end end)net('srp.dev.SyncBulletTrace',function()registerTrace(net.ReadVector(),net.ReadVector())end)if CLIENT then concommand.Add('clr',function()Y={}end)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/ghostentity.lua:
function ToolObj:MakeGhostEntity(a,b,c)util.PrecacheModel(a)if SERVER&&!game.SinglePlayer()then return end;if CLIENT&&game.SinglePlayer()then return end;self:ReleaseGhostEntity()if!util.IsValidProp(a)then return end;if CLIENT then self.GhostEntity=ents.CreateClientProp(a)else self.GhostEntity=ents.Create("prop_physics")end;if!self.GhostEntity:IsValid()then self.GhostEntity=nil;return end;self.GhostEntity:SetModel(a)self.GhostEntity:SetPos(b)self.GhostEntity:SetAngles(c)self.GhostEntity:Spawn()self.GhostEntity:SetSolid(SOLID_VPHYSICS)self.GhostEntity:SetMoveType(MOVETYPE_NONE)self.GhostEntity:SetNotSolid(true)self.GhostEntity:SetRenderMode(RENDERMODE_TRANSALPHA)self.GhostEntity:SetColor(Color(255,255,255,150))end;function ToolObj:StartGhostEntity(d)local e=d:GetClass()if SERVER&&!game.SinglePlayer()then return end;if CLIENT&&game.SinglePlayer()then return end;self:MakeGhostEntity(d:GetModel(),d:GetPos(),d:GetAngles())end;function ToolObj:ReleaseGhostEntity()if self.GhostEntity then if!self.GhostEntity:IsValid()then self.GhostEntity=nil;return end;self.GhostEntity:Remove()self.GhostEntity=nil end;if self.GhostEntities then for f,g in pairs(self.GhostEntities)do if g:IsValid()then g:Remove()end;self.GhostEntities[f]=nil end;self.GhostEntities=nil end;if self.GhostOffset then for f,g in pairs(self.GhostOffset)do self.GhostOffset[f]=nil end end end;function ToolObj:UpdateGhostEntity()if self.GhostEntity==nil then return end;if!self.GhostEntity:IsValid()then self.GhostEntity=nil;return end;local h=util.GetPlayerTrace(self:GetOwner())local i=util.TraceLine(h)if!i.Hit then return end;local j,k=self:GetNormal(1):Angle(),(i.HitNormal*-1):Angle()local l=self:GetEnt(1):AlignAngles(j,k)self.GhostEntity:SetPos(self:GetEnt(1):GetPos())self.GhostEntity:SetAngles(l)local m=self.GhostEntity:LocalToWorld(self:GetLocalPos(1))local n=i.HitPos+self:GetEnt(1):GetPos()-m+i.HitNormal;self.GhostEntity:SetPos(n)end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/axis.lua:
TOOL.Category="Constraints"TOOL.Name="#tool.axis.name"TOOL.ClientConVar["forcelimit"]=0;TOOL.ClientConVar["torquelimit"]=0;TOOL.ClientConVar["hingefriction"]=0;TOOL.ClientConVar["nocollide"]=0;TOOL.Information={{name="left",stage=0},{name="left_1",stage=1,op=1},{name="right",stage=0},{name="right_1",stage=1,op=2},{name="reload"}}function TOOL:LeftClick(a)if self:GetOperation()==2 then return false end;if IsValid(a.Entity)&&a.Entity:IsPlayer()then return end;local b=self:NumObjects()if b==0&&!IsValid(a.Entity)then return false end;if b==0&&a.Entity:GetClass()=="prop_vehicle_jeep"then return false end;if SERVER&&!util.IsValidPhysicsObject(a.Entity,a.PhysicsBone)then return false end;local c=a.Entity:GetPhysicsObjectNum(a.PhysicsBone)self:SetObject(b+1,a.Entity,a.HitPos,c,a.PhysicsBone,a.HitNormal)self:SetOperation(1)if b>0 then if CLIENT then self:ClearObjects()self:ReleaseGhostEntity()return true end;local d=self:GetClientNumber("nocollide",0)local e=self:GetClientNumber("forcelimit",0)local f=self:GetClientNumber("torquelimit",0)local g=self:GetClientNumber("hingefriction",0)local h,i=self:GetEnt(1),self:GetEnt(2)local j,k=self:GetBone(1),self:GetBone(2)local l,m=self:GetNormal(1),self:GetNormal(2)local n,o=self:GetLocalPos(1),self:GetLocalPos(2)local p=self:GetPhys(1)local q=self:GetPos(2)local r,s=l:Angle(),-m:Angle()local t=p:AlignAngles(r,s)p:SetAngles(t)local u=q+p:GetPos()-self:GetPos(1)+m*0.2;p:SetPos(u)p:Wake()n=p:WorldToLocal(q+m)local v=constraint.Axis(h,i,j,k,n,o,e,f,g,d)if IsValid(v)then undo.Create("Axis")undo.AddEntity(v)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",v)end;self:ClearObjects()self:ReleaseGhostEntity()else self:StartGhostEntity(a.Entity)self:SetStage(b+1)end;return true end;function TOOL:RightClick(a)if self:GetOperation()==1 then return false end;if IsValid(a.Entity)&&a.Entity:IsPlayer()then return false end;local b=self:NumObjects()if b==0&&!IsValid(a.Entity)then return false end;local c=a.Entity:GetPhysicsObjectNum(a.PhysicsBone)self:SetObject(b+1,a.Entity,a.HitPos,c,a.PhysicsBone,a.HitNormal)self:SetOperation(2)if b>0 then if CLIENT then self:ClearObjects()return true end;local d=self:GetClientNumber("nocollide",0)local e=self:GetClientNumber("forcelimit",0)local f=self:GetClientNumber("torquelimit",0)local g=self:GetClientNumber("hingefriction",0)local h,i=self:GetEnt(1),self:GetEnt(2)local j,k=self:GetBone(1),self:GetBone(2)local l,m=self:GetNormal(1),self:GetNormal(2)local n,o=self:GetLocalPos(1),self:GetLocalPos(2)local p=self:GetPhys(1)local q=self:GetPos(2)p:Wake()n=p:WorldToLocal(q+m)local v=constraint.Axis(h,i,j,k,n,o,e,f,g,d)if IsValid(v)then undo.Create("Axis")undo.AddEntity(v)undo.SetPlayer(self:GetOwner())undo.Finish()self:GetOwner():AddCleanup("constraints",v)end;self:ClearObjects()self:ReleaseGhostEntity()else self:SetStage(b+1)end;return true end;function TOOL:Reload(a)if!IsValid(a.Entity)||a.Entity:IsPlayer()then return false end;if CLIENT then return true end;return constraint.RemoveConstraints(a.Entity,"Axis")end;function TOOL:Think()if self:NumObjects()!=1 then return end;self:UpdateGhostEntity()end;function TOOL:Holster()self:ClearObjects()end;local w=TOOL:BuildConVarList()function TOOL.BuildCPanel(x)x:AddControl("Header",{Description="#tool.axis.help"})x:AddControl("ComboBox",{MenuButton=1,Folder="axis",Options={["#preset.default"]=w},CVars=table.GetKeys(w)})x:AddControl("Slider",{Label="#tool.forcelimit",Command="axis_forcelimit",Type="Float",Min=0,Max=50000,Help=true})x:AddControl("Slider",{Label="#tool.torquelimit",Command="axis_torquelimit",Type="Float",Min=0,Max=50000,Help=true})x:AddControl("Slider",{Label="#tool.hingefriction",Command="axis_hingefriction",Type="Float",Min=0,Max=200,Help=true})x:AddControl("CheckBox",{Label="#tool.nocollide",Command="axis_nocollide",Help=true})end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/creator.lua:
TOOL.AddToMenu=false;TOOL.ClientConVar["type"]="0"TOOL.ClientConVar["name"]="0"TOOL.ClientConVar["arg"]="0"function TOOL:LeftClick(a,b)local c=self:GetClientNumber("type",0)local d=self:GetClientInfo("name",0)local e=self:GetClientInfo("arg",0)if CLIENT then return true end;if c==0 then Spawn_SENT(self:GetOwner(),d,a)elseif c==1 then Spawn_Vehicle(self:GetOwner(),d,a)elseif c==2 then Spawn_NPC(self:GetOwner(),d,e,a)elseif c==3 then Spawn_Weapon(self:GetOwner(),d,a)elseif c==4 then CCSpawn(self:GetOwner(),nil,{d})end;return true end
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/drgbase_tool_disableai.lua:
TOOL.Tab="DrGBase"TOOL.Category="Tools"TOOL.Name="#tool.drgbase_tool_disableai.name"TOOL.BuildCPanel=function(a)a:Help("#tool.drgbase_tool_disableai.desc")a:Help("#tool.drgbase_tool_disableai.0")end;function TOOL:LeftClick(b)if!IsValid(b.Entity)then return false end;if!b.Entity.IsDrGNextbot then return false end;return true end;if CLIENT then language.Add("tool.drgbase_tool_disableai.name","Disable AI")language.Add("tool.drgbase_tool_disableai.desc","Disable/enable AI for a nextbot.")language.Add("tool.drgbase_tool_disableai.0","Left click to toggle AI. (Green => Enabled / Red => Disabled)")hook.Add("PreDrawHalos","DrGBaseToolDisableAIHalos",function()local c=LocalPlayer():GetActiveWeapon()if!IsValid(c)||c:GetClass()!="gmod_tool"then return end;local d=LocalPlayer():GetTool()if d==nil||d.Mode!="drgbase_tool_disableai"then return end;local e={}local f={}for g,h in ipairs(DrGBase.GetNextbots())do if!IsValid(h)then continue end;if h:IsAIDisabled()then table.insert(f,h)else table.insert(e,h)end end;halo.Add(e,DrGBase.CLR_GREEN)halo.Add(f,DrGBase.CLR_RED)end)end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/fadingdoor.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/precision.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/smartweld.lua:
TOOL.AllowedClasses={prop_physics=true,prop_ragdoll=true,prop_vehicle=true,prop_vehicle_jeep=true,prop_vehicle_airboat=true,prop_vehicle_apc=true,prop_vehicle_crane=true,prop_vehicle_prisoner_pod=true}TOOL.SelectedProps={}TOOL.Category='Constraints'TOOL.Name='Weld - Smart'TOOL.ClientConVar['selectradius']=100;TOOL.ClientConVar['nocollide']=1;TOOL.ClientConVar['clearwelds']=1;TOOL.ClientConVar['strength']=0;TOOL.ClientConVar['world']=0;TOOL.ClientConVar['color_r']=0;TOOL.ClientConVar['color_g']=255;TOOL.ClientConVar['color_b']=0;TOOL.ClientConVar['color_a']=255;if CLIENT then language.Add('tool.smartweld.name','Weld - Smart')language.Add('tool.smartweld.desc','Automatically welds selected props')language.Add('tool.smartweld.0','Left-click to select/deselect props. Use key and left click to auto-select.')language.Add('tool.smartweld.1','Right-click to weld selected props. Reload key to unselect all. Hold Use and right-click to weld everything to the prop you\'re looking at.')language.Add('tool.smartweld.selectoutsideradius','Auto-Select Radius:')language.Add('tool.smartweld.selectoutsideradius.help','The auto-select radius, anything beyond this value wont be selected')language.Add('tool.smartweld.strength','Force Limit:')language.Add('tool.smartweld.strength.help','The strength of the welds created. Use 0 for unbreakable welds')language.Add('tool.smartweld.world','Weld everything to world')language.Add('tool.smartweld.world.help','Turning this on will weld everything to the world. Useful for making something totally immovable')language.Add('tool.smartweld.nocollide','No-collide')language.Add('tool.smartweld.nocollide.help','Whether all props should no-collide each other when welded')language.Add('tool.smartweld.clearwelds','Remove old welds')language.Add('tool.smartweld.clearwelds.help','If a selected prop has any welds already on it this will remove them first')language.Add('tool.smartweld.color','Selection color')language.Add('tool.smartweld.color.help','Modify the selection color to make the props look less idiotic')language.Add('Undone_smartweld','Undone Smart-Weld')end;function TOOL.BuildCPanel(a)a:SetName('Smart Weld')a:AddControl('Header',{Text='',Description='Automatically welds selected props.'})a:AddControl('Slider',{Label='#tool.smartweld.selectoutsideradius',Help='#tool.smartweld.selectoutsideradius',Type='float',Min='0',Max='500',Command='smartweld_selectradius'})a:AddControl('Slider',{Label='#tool.smartweld.strength',Help='#tool.smartweld.strength',Type='float',Min='0',Max='10000',Command='smartweld_strength'})a:AddControl('Checkbox',{Label='#tool.smartweld.world',Help='#tool.smartweld.world',Command='smartweld_world'})a:AddControl('Checkbox',{Label='#tool.smartweld.nocollide',Help='#tool.smartweld.nocollide',Command='smartweld_nocollide'})a:AddControl('Checkbox',{Label='#tool.smartweld.clearwelds',Help='#tool.smartweld.clearwelds',Command='smartweld_clearwelds'})a:AddControl('Color',{Label='#tool.smartweld.color',Help='#tool.smartweld.color',Red='smartweld_color_r',Green='smartweld_color_g',Blue='smartweld_color_b',Alpha='smartweld_color_a'})end;function TOOL:Deploy()end;function TOOL:Holster()if CLIENT then for b,v in ipairs(self.SelectedProps)do if IsValid(v.ent)then v.ent:SetColor(v.col)end end end;self.SelectedProps={}self:SetStage(1)end;function TOOL:LeftClick(c)if IsFirstTimePredicted()&&IsValid(c.Entity)&&!c.Entity:IsPlayer()then if SERVER&&!util.IsValidPhysicsObject(c.Entity,c.PhysicsBone)then return false end;if self:GetOwner():KeyDown(IN_USE)then return self:AutoSelect(c.Entity)end;return self:HandleProp(c)end;return false end;function TOOL:AutoSelect(d)if!IsValid(d)then return false end;local e=#self.SelectedProps;local f=self:GetClientNumber('selectradius')local g=ents.FindInSphere(d:GetPos(),f)if#g<1 then return false end;local h=0;for i=1,#g do if self:IsAllowedEnt(d)&&!self:PropHasBeenSelected(g[i])then self:SelectProp(g[i])h=h+1 end end;self:Notify(#self.SelectedProps-e..' prop(s) have been auto-selected.',NOTIFY_GENERIC)end;function TOOL:HandleProp(c)if#self.SelectedProps==0 then self:SelectProp(c.Entity,c.PhysicsBone)else for b,v in ipairs(self.SelectedProps)do if v.ent==c.Entity then self:DeselectProp(c.Entity)return true end end;self:SelectProp(c.Entity,c.PhysicsBone)end;return true end;function TOOL:DeselectProp(d)for b,v in ipairs(self.SelectedProps)do if v.ent==d then if CLIENT then d:SetColor(v.col)end;table.remove(self.SelectedProps,b)end end;return true end;function TOOL:SelectProp(j,k)if self:IsAllowedEnt(j)then if#self.SelectedProps==0 then self:SetStage(1)end;local l=j:IsRagdoll()&&k||0;table.insert(self.SelectedProps,{ent=j,col=j:GetColor(),bone=l})if CLIENT then j:SetColor(Color(self:GetClientNumber('color_r',0),self:GetClientNumber('color_g',0),self:GetClientNumber('color_b',0),self:GetClientNumber('color_a',255)))end;return true end;return false end;function TOOL:Reload()if IsFirstTimePredicted()&&self.SelectedProps then self:SetStage(1)if CLIENT then for b,v in ipairs(self.SelectedProps)do v.ent:SetColor(v.col)end end;self.SelectedProps={}self:Notify('Prop Selection Cleared',NOTIFY_CLEANUP)end end;function TOOL:RightClick(c)if#self.SelectedProps<=1 then self:Notify(#self.SelectedProps==1&&'Select at least one more prop to weld.'||'No props selected!',NOTIFY_GENERIC)return false end;self:FinishWelding(c.Entity)return false end;function TOOL:FinishWelding(j)if CLIENT then local m=0;for b,v in ipairs(self.SelectedProps)do if IsValid(v.ent)then v.ent:SetColor(v.col)m=m+1 end end;if self:GetOwner():KeyDown(IN_USE)then for b,v in ipairs(self.SelectedProps)do if v.ent==j then m=m+1;break end end;self:Notify('Weld complete! '..m..' props have been welded to a single prop.',NOTIFY_GENERIC)elseif tobool(self:GetClientNumber('world'))then self:Notify('Weld complete! '..m..' props have been welded to the world.',NOTIFY_GENERIC)else self:Notify('Weld complete! '..m..' props have been welded to each other.',NOTIFY_GENERIC)end end;self.SelectedProps={}self:SetStage(1)end;function TOOL:PropHasBeenSelected(d)for b,v in ipairs(self.SelectedProps)do if d==v.ent then return true end end;return false end;function TOOL:IsAllowedEnt(d)if IsValid(d)then local n=self:GetOwner()local c=n:GetEyeTrace()c.Entity=d;if!hook.Run('CanTool',n,c,'smartweld')||!self.AllowedClasses[d:GetClass()]then return false end;return true end;return false end;function TOOL:Notify(o,p)if CLIENT&&IsFirstTimePredicted()&&IsValid(self:GetOwner())then notification.AddLegacy(o,p,5)surface.PlaySound('buttons/button15.wav')end end
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/stacker_improved.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/gmod_tool/stools/textscreen.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/weight_improved.lua:
local a=TOOL.Mode;include("improvedweight/localify.lua")localify.LoadSharedFile("improvedweight/localization.lua")local b=localify.Localize;local c="#tool."..a.."."include("improvedweight/improvedweight.lua")local net=net;local util=util;local hook=hook;local math=math;local halo=halo;local draw=draw;local Lerp=Lerp;local pairs=pairs;local Color=Color;local string=string;local surface=surface;local IsValid=IsValid;local tonumber=tonumber;local language=language;local GetConVar=GetConVar;local LocalPlayer=LocalPlayer;local GetConVarNumber=GetConVarNumber;local NOTIFY_GENERIC=NOTIFY_GENERIC||0;local NOTIFY_ERROR=NOTIFY_ERROR||1;local NOTIFY_CLEANUP=NOTIFY_CLEANUP||4;local d=0.01;local e=50000;local f=3;local g=5;local h=-1234.5;local i=false;local j={original=b(c.."hud_original"),modified=b(c.."hud_modified")}TOOL.Category="Construction"TOOL.Name=b(c.."name")TOOL.Information={"left","right","reload"}TOOL.ClientConVar["mass"]="1"TOOL.ClientConVar["tooltip_show"]="0"TOOL.ClientConVar["tooltip_legacy"]="0"TOOL.ClientConVar["tooltip_scale"]="24"TOOL.ClientConVar["colorscale"]="1"TOOL.ClientConVar["rounded"]="1"TOOL.ClientConVar["decimals"]="2"TOOL.ClientConVar["notifs"]="1"TOOL.ClientConVar["notifs_sound"]="1"function TOOL:GetMass()return self:GetClientNumber("mass")end;function TOOL:ShouldUseLegacyTooltip()return self:GetClientNumber("tooltip_legacy")==1 end;function TOOL:GetTooltipScale()return self:GetClientNumber("tooltip_scale")end;function TOOL:ShouldSendNotification()return self:GetClientNumber("notifs")==1 end;if CLIENT then language.Add("tool."..a..".name",b(c.."name"))language.Add("tool."..a..".desc",b(c.."desc"))language.Add("tool."..a..".left",b(c.."left"))language.Add("tool."..a..".right",b(c.."right"))language.Add("tool."..a..".reload",b(c.."reload"))net.Receive(a.."_notif",function(k)notification.AddLegacy(net.ReadString(),net.ReadUInt(f),g)local l=net.ReadString()if l!=""&&GetConVarNumber(a.."_notifs_sound")==1 then surface.PlaySound(l)end end)net.Receive(a.."_error",function(k)surface.PlaySound("buttons/button10.wav")notification.AddLegacy(net.ReadString(),net.ReadUInt(f),g)end)local m=GetConVar("gmod_toolmode")local n=GetConVar(a.."_tooltip_show")local o=GetConVar(a.."_tooltip_legacy")local p=GetConVar(a.."_rounded")local q=GetConVar(a.."_decimals")local r=GetConVar(a.."_colorscale")local function s()return p:GetBool()end;local function t()return n:GetBool()end;local function u()return o:GetBool()end;local function v()return q:GetInt()end;local function w()return r:GetInt()end;function TOOL:Init()surface.CreateFont(a.."_tooltip",{font="coolvetica",size=GetConVarNumber(a.."_tooltip_scale",24),weight=500})surface.CreateFont(a.."_tooltip_legacy",{font="coolvetica",size=24,weight=500})m=GetConVar("gmod_toolmode")n=GetConVar(a.."_tooltip_show")o=GetConVar(a.."_tooltip_legacy")p=GetConVar(a.."_rounded")q=GetConVar(a.."_decimals")r=GetConVar(a.."_colorscale")i=true end;cvars.AddChangeCallback(a.."_tooltip_scale",function(x,y,z)z=tonumber(z)if!z then return false end;surface.CreateFont(a.."_tooltip",{font="coolvetica",size=z>0&&z||1,weight=500})end,a)local function A(B,C,D)return Color(Lerp(B,C.r,D.r),Lerp(B,C.g,D.g),Lerp(B,C.b,D.b))end;local function E(F,G,H,I,J,K,L,M,N)surface.SetFont(F)local O,P=0,0;local Q=""for R,S in pairs(G)do Q=Q..S;O,P=surface.GetTextSize(Q)end;I,J=M(I,J,O,P)||I,J;O,P=0,0;Q=""for R,S in pairs(G)do draw.SimpleText(S,F,I+O,J,H[R]||N||color_white,K,L)Q=Q..S;O,P=surface.GetTextSize(Q)end;return O,P end;local T=Color(0,0,0,200)local U=Color(250,250,200,255)local V=Color(100,150,255)local S="Loading"local W=T;local X=color_white;local F=a.."_tooltip"local Y=0;local Z,_;local a0={[1]={Min=Color(0,255,0),Max=Color(255,0,0)},[2]={Min=Color(0,255,0),Max=Color(255,255,0)},[3]={Min=Color(0,255,0),Max=Color(50,100,255)},[4]={Min=Color(50,100,255),Max=Color(255,0,0)}}local function a1()local a2=LocalPlayer()if!IsValid(a2)||!i then return end;local a3=a2:GetActiveWeapon()if!t()&&(!IsValid(a3)||a3:GetClass()!="gmod_tool"||m:GetString()!=a)then return end;local a4=a2:GetEyeTrace()local a5=a4.Entity;if!IsValid(a5)then return end;if a5:IsPlayer()then return end;local a6=s()local a7=v()local a8=improvedweight.GetOriginalWeight(a5,h)local a9=improvedweight.GetModifiedWeight(a5,h)if a8==h then a8=nil end;if a9==h then a9=nil end;a8=a6&&a8&&math.Round(a8,a7)||a8;a9=a6&&a9&&math.Round(a9,a7)||a9;local aa=string.Comma(a8||"N/A")local ab=string.Comma(a9||"N/A")local ac=(a5:GetPos()+a5:OBBCenter()):ToScreen()local I,J=ac.x,ac.y;local ad=u()if ad then W=U;X=color_black;F=a.."_tooltip_legacy"Y=8;S=("%s: %s | %s: %s"):format(j.original,aa,j.modified,ab)surface.SetFont(F)local Z,_=surface.GetTextSize(S)draw.RoundedBox(Y,I-Z/2-12,J-_/2-4,Z+24,_+8,T)draw.RoundedBox(Y,I-Z/2-10,J-_/2-2,Z+20,_+4,W)draw.SimpleText(S,F,I,J,X,1,1)else W=T;X=color_white;F=a.."_tooltip"Y=0;local ae=w()local af=a0[ae]local ag=af&&af.Min||color_white;if af then local B=(a9||0)/e;ag=A(B,af.Min,af.Max)halo.Add({a5},ag)end;local ah=math.Round((a9||1)/(a8||1),a6&&a7||2)E(F,{j.original..": ",aa,"  |  "..j.modified..": ",ab," ("..ah.."x)"},{textcol,V,textcol,V,ag},ac.x,ac.y,0,0,function(I,J,O,P)I=I-O/2;draw.RoundedBox(Y,I-10,J-5,O+20,P+10,W)draw.RoundedBox(Y,I-8,J-3,O+16,P+6,W)return I,J end)end end;hook.Add("HUDPaint",a.."_hud",a1)elseif SERVER then util.AddNetworkString(a.."_notif")util.AddNetworkString(a.."_error")function TOOL:SendNotif(Q,notify,l)if!self:ShouldSendNotification()then return end;net.Start(a.."_notif")net.WriteString(Q)net.WriteUInt(notify||NOTIFY_GENERIC,f)net.WriteString(l||"")net.Send(self:GetOwner())end;function TOOL:SendError(Q)net.Start(a.."_error")net.WriteString(Q)net.WriteUInt(notify||NOTIFY_ERROR,f)net.Send(self:GetOwner())end;hook.Add("OnEntityCreated",a.."_setup",function(a5)local R=a5:EntIndex()hook.Add("Tick",a.."_setup_"..R,function()if IsValid(a5)&&IsValid(a5:GetPhysicsObject())then improvedweight.Setup(a5)end;hook.Remove("Tick",a.."_setup_"..R)end)end)end;function TOOL:LeftClick(a4)local a5=a4.Entity;if!IsValid(a5)then return false end;if a5:IsPlayer()then return false end;if CLIENT then return true end;local ai=a5:GetPhysicsObject()if!IsValid(ai)then self:SendError(b(c.."error_invalid_phys",localify.GetLocale(self:GetOwner())))return false end;local aj=self:GetMass()if aj<d then self:SendError(b(c.."error_zero_weight",localify.GetLocale(self:GetOwner())))return false end;if aj>e then self:SendError(b(c.."error_max_weight",localify.GetLocale(self:GetOwner()))..(" (%s)"):format(string.Comma(e)))return false end;improvedweight.SetModifiedWeight(a5,aj)self:SendNotif((b(c.."notif_applied",localify.GetLocale(self:GetOwner())).." (%s)"):format(string.Comma(math.Round(aj,2))),NOTIFY_GENERIC,"buttons/button14.wav")return true end;function TOOL:RightClick(a4)local a5=a4.Entity;if!IsValid(a5)then return false end;if a5:IsPlayer()then return false end;if CLIENT then return true end;local ai=a5:GetPhysicsObject()if!IsValid(ai)then self:SendError(b(c.."error_invalid_phys",localify.GetLocale(self:GetOwner())))return false end;self:GetOwner():ConCommand(a.."_mass "..ai:GetMass())self:SendNotif((b(c.."notif_copied",localify.GetLocale(self:GetOwner())).." (%s)"):format(string.Comma(math.Round(ai:GetMass(),2))),NOTIFY_CLEANUP)return true end;function TOOL:Reload(a4)local a5=a4.Entity;if!IsValid(a5)then return false end;if a5:IsPlayer()then return false end;if CLIENT then return true end;local ai=a5:GetPhysicsObject()if!IsValid(ai)then self:SendError(b(c.."error_invalid_phys",localify.GetLocale(self:GetOwner())))return false end;improvedweight.RestoreOriginalWeight(a5)self:SendNotif((b(c.."notif_restored",localify.GetLocale(self:GetOwner())).." (%s)"):format(string.Comma(math.Round(improvedweight.GetOriginalWeight(a5),2))),NOTIFY_UNDO)return true end;function TOOL:Think()if CLIENT then return end;local a2=self:GetOwner()local a5=a2:GetEyeTrace().Entity;if!IsValid(a5)then return false end;if a5:IsPlayer()then return false end;local ai=a5:GetPhysicsObject()if!IsValid(ai)then return false end;if!improvedweight.IsSetup(a5)then improvedweight.Setup(a5)else if ai:GetMass()!=improvedweight.GetModifiedWeight(a5)then improvedweight.SetModifiedWeight(a5,ai:GetMass())end end end;local function ak(al)local am={Label="Presets",MenuButton=1,Folder="weight",Options={[b(c.."combobox_default")]={[a.."_colorscale"]="1",[a.."_decimals"]="2",[a.."_mass"]="1",[a.."_notifs"]="1",[a.."_notifs_sound"]="1",[a.."_rounded"]="1",[a.."_tooltip_show"]="0",[a.."_tooltip_legacy"]="0",[a.."_tooltip_scale"]="24"}},CVars={a.."_colorscale",a.."_decimals",a.."_mass",a.."_notifs",a.."_notifs_sound",a.."_rounded",a.."_tooltip_show",a.."_tooltip_legacy",a.."_tooltip_scale"}}local an={Label=b(c.."label_colorscale"),MenuButton=0,Options={[b(c.."combobox_green_to_red")]={[a.."_colorscale"]=1},[b(c.."combobox_green_to_yellow")]={[a.."_colorscale"]=2},[b(c.."combobox_green_to_blue")]={[a.."_colorscale"]=3},[b(c.."combobox_blue_to_red")]={[a.."_colorscale"]=4},[b(c.."combobox_none")]={[a.."_colorscale"]=0}}}local ao={}for ap,aq in pairs(localify.GetLocalizations())do if!b(c.."language_"..ap,ap)then continue end;ao[b(c.."language_"..ap,ap)]={localify_language=ap}end;local ar={Label=b(c.."label_language"),MenuButton=0,Options=ao}cvars.AddChangeCallback("localify_language",function(x,y,z)j.original=b(c.."hud_original")j.modified=b(c.."hud_modified")local al=controlpanel.Get(a)if!IsValid(al)then return end;al:ClearControls()ak(al)end,"improvedweight")al:AddControl("ComboBox",ar)al:ControlHelp("\n"..b(c.."label_credits"))al:AddControl("Label",{Text=b(c.."desc")})al:AddControl("ComboBox",am)al:ControlHelp("")al:AddControl("Slider",{Label=b(c.."label_weight"),Command=a.."_mass",Type="Float",Min="0.01",Max=e})al:ControlHelp("")al:AddControl("ComboBox",an)al:ControlHelp("")al:ControlHelp(b(c.."help_colorscale").."\n")al:AddControl("Checkbox",{Label=b(c.."checkbox_round"),Command=a.."_rounded"})al:AddControl("Slider",{Label=b(c.."label_decimals"),Command=a.."_decimals",Type="Numeric",Min="0",Max="8"})al:ControlHelp(b(c.."help_decimals").."\n")al:AddControl("Slider",{Label=b(c.."label_tooltip_scale"),Command=a.."_tooltip_scale",Type="Numeric",Min="1",Max="128"})al:ControlHelp(b(c.."help_tooltip_scale").."\n")al:AddControl("Checkbox",{Label=b(c.."checkbox_tooltip_show"),Command=a.."_tooltip_show"})al:ControlHelp(b(c.."help_tooltip_show"))al:AddControl("Checkbox",{Label=b(c.."checkbox_tooltip_legacy"),Command=a.."_tooltip_legacy"})al:ControlHelp(b(c.."help_tooltip_legacy"))al:AddControl("Checkbox",{Label=b(c.."checkbox_notifs"),Command=a.."_notifs"})al:ControlHelp(b(c.."help_notifs"))al:AddControl("Checkbox",{Label=b(c.."checkbox_notifs_sound"),Command=a.."_notifs_sound"})al:ControlHelp(b(c.."help_notifs_sound").."\n")end;TOOL.BuildCPanel=ak
--addons/!lpakr_out/lua/weapons/gmod_tool/stools/wire_adv.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/button.lua:
WireToolSetup.setCategory("Input, Output")WireToolSetup.open("button","Button","gmod_wire_button",nil,"Buttons")if CLIENT then language.Add("tool.wire_button.name","Button Tool (Wire)")language.Add("tool.wire_button.desc","Spawns a button for use with the wire system.")language.Add("WireButtonTool_toggle","Toggle")language.Add("WireButtonTool_entityout","Output Entity")language.Add("WireButtonTool_value_on","Value On:")language.Add("WireButtonTool_value_off","Value Off:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/props_c17/clock01.mdl",model_category="button",toggle="0",value_off="0",value_on="1",description="",entityout="0"}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_button")ModelPlug_AddToCPanel_Multi(a,{button="Normal",button_small="Small"},"wire_button","#Button_Model",6)a:CheckBox("#WireButtonTool_toggle","wire_button_toggle")a:CheckBox("#WireButtonTool_entityout","wire_button_entityout")a:NumSlider("#WireButtonTool_value_on","wire_button_value_on",-10,10,1)a:NumSlider("#WireButtonTool_value_off","wire_button_value_off",-10,10,1)end
--addons/!lpakr_out/lua/wire/stools/cd_disk.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/cd_disk.lua:
WireToolSetup.setCategory("Memory")WireToolSetup.open("cd_disk","CD Disk","gmod_wire_cd_disk",nil,"CD Disks")if CLIENT then language.Add("Tool.wire_cd_disk.name","CD Disk Tool (Wire)")language.Add("Tool.wire_cd_disk.desc","Spawns a CD Disk.")language.Add("WireDataTransfererTool_cd_disk","CD Disk:")list.Set("Wire_Laser_Disk_Models","models/venompapa/wirecd_small.mdl",true)list.Set("Wire_Laser_Disk_Models","models/venompapa/wirecd_medium.mdl",true)list.Set("Wire_Laser_Disk_Models","models/venompapa/wirecd_huge.mdl",true)TOOL.Information={{name="left",text="Create/Update "..TOOL.Name},{name="right",text="Change model"}}WireToolSetup.setToolMenuIcon("venompapa/wirecd/wirecd")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar["model"]="models/venompapa/wirecd_medium.mdl"TOOL.ClientConVar["skin"]="0"TOOL.ClientConVar["precision"]=4;TOOL.ClientConVar["iradius"]=10;function TOOL:RightClick(a)if CLIENT then return true end;if a.Entity&&a.Entity:IsValid()then if a.Entity:GetClass()=="prop_physics"then self:GetOwner():ConCommand('wire_cd_disk_model "'..a.Entity:GetModel()..'"\n')self:GetOwner():ConCommand('wire_cd_disk_skin "'..a.Entity:GetSkin()..'"\n')end end;return true end;function TOOL.BuildCPanel(b)WireDermaExts.ModelSelect(b,"wire_cd_disk_Model",list.Get("Wire_Laser_Disk_Models"),1)b:NumSlider("Disk density (inches per block, ipb)","wire_cd_disk_precision",1,16,0)b:NumSlider("Inner radius (disk hole radius)","wire_cd_disk_iradius",1,48,0)b:NumSlider("Disk skin (0..8, standard disks only)","wire_cd_disk_skin",0,8,0)end
--addons/!lpakr_out/lua/wire/stools/consolescreen.lua:
WireToolSetup.setCategory("Visuals/Screens")WireToolSetup.open("consolescreen","Console Screen","gmod_wire_consolescreen",nil,"Screens")if CLIENT then language.Add("tool.wire_consolescreen.name","Console Screen Tool (Wire)")language.Add("tool.wire_consolescreen.desc","Spawns a console screen")TOOL.Information={{name="left",text="Create "..TOOL.Name}}WireToolSetup.setToolMenuIcon("icon16/application_xp_terminal.png")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.NoLeftOnClass=true;TOOL.ClientConVar={model="models/props_lab/monitor01b.mdl",createflat=0}function TOOL.BuildCPanel(a)WireDermaExts.ModelSelect(a,"wire_consolescreen_model",list.Get("WireScreenModels"),5)a:CheckBox("#Create Flat to Surface","wire_consolescreen_createflat")a:Help("CharParam is LBBBFFF format: background and foreground colour of the character (one digit each for RGB), if L is nonzero the char flashes")end
--addons/!lpakr_out/lua/wire/stools/dynamic_button.lua:
WireToolSetup.setCategory("Input, Output")WireToolSetup.open("dynamic_button","Dynamic Button","gmod_wire_dynamic_button",nil,"Dynamic Buttons")if CLIENT then language.Add("tool.wire_dynamic_button.name","Dynamic Button Tool (Wire)")language.Add("tool.wire_dynamic_button.desc","Spawns a dynamic button for use with the wire system.")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}language.Add("WireDynamicButtonTool_toggle","Toggle")language.Add("WireDynamicButtonTool_entityout","Output Entity")language.Add("WireDynamicButtonTool_value_on","Value On:")language.Add("WireDynamicButtonTool_value_off","Value Off:")language.Add("WireDynamicButtonTool_materials_on","Material On:")language.Add("WireDynamicButtonTool_materials_off","Material Off:")language.Add("WireDynamicButtonTool_colour_on","Color On:")language.Add("WireDynamicButtonTool_colour_off","Color Off:")end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/bull/ranger.mdl",model_category="dynamic_button",toggle="0",value_off="0",value_on="1",description="",entityout="0",material_on="bull/dynamic_button_1",material_off="bull/dynamic_button_0",on_r=0,on_g=255,on_b=0,off_r=255,off_g=0,off_b=0}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_dynamic_button")ModelPlug_AddToCPanel_Multi(a,{dynamic_button="Normal",dynamic_button_small="Small"},"wire_dynamic_button","#Dynamic_Button_Model",1.3)a:NumSlider("#WireDynamicButtonTool_value_on","wire_dynamic_button_value_on",-10,10,1)a:AddControl("ListBox",{Label="#WireDynamicButtonTool_materials_on",Options=list.Get("WireDynamicButtonMaterialsOn")})a:AddControl("Color",{Label="#WireDynamicButtonTool_colour_on",Red="wire_dynamic_button_on_r",Green="wire_dynamic_button_on_g",Blue="wire_dynamic_button_on_b"})a:NumSlider("#WireDynamicButtonTool_value_off","wire_dynamic_button_value_off",-10,10,1)a:AddControl("ListBox",{Label="#WireDynamicButtonTool_materials_off",Options=list.Get("WireDynamicButtonMaterialsOff")})a:AddControl("Color",{Label="#WireDynamicButtonTool_colour_off",Red="wire_dynamic_button_off_r",Green="wire_dynamic_button_off_g",Blue="wire_dynamic_button_off_b"})a:CheckBox("#WireDynamicButtonTool_toggle","wire_dynamic_button_toggle")a:CheckBox("#WireDynamicButtonTool_entityout","wire_dynamic_button_entityout")end
--addons/!lpakr_out/lua/wire/stools/exit_point.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/gates.lua:
WireToolSetup.setCategory("Chips, Gates")WireToolSetup.open("gates","Gates","gmod_wire_gate",nil,"Gates")WireToolSetup.SetupMax(100)if CLIENT then language.Add("Tool.wire_gates.name","Gates Tool (Wire)")language.Add("Tool.wire_gates.desc","Spawns gates for use with the wire system.")TOOL.ClientConVar["model"]="models/jaanus/wiretool/wiretool_gate.mdl"TOOL.ClientConVar["parent"]=0;TOOL.ClientConVar["noclip"]=1;TOOL.ClientConVar["angleoffset"]=0;TOOL.ClientConVar["action"]="+"TOOL.ClientConVar["searchresultnum"]=28;language.Add("WireGatesTool_action","Gate action")language.Add("WireGatesTool_noclip","NoCollide")language.Add("WireGatesTool_parent","Parent")language.Add("WireGatesTool_angleoffset","Spawn angle offset")language.Add("sboxlimit_wire_gates","You've hit your gates limit!")WireToolSetup.setToolMenuIcon("bull/gates/gate_logic_and")TOOL.Information={{name="left",text="Create/Update Gate"},{name="right",text="Copy Gate"},{name="reload",text="Increase angle offset by 45 degrees"},{name="reload_shift",text="Shift+Reload: Unparent gate (If parented)"}}function TOOL.BuildCPanel(a)local b=vgui.Create("DTextEntry")b:SetValue("Search...")local c=b.OnGetFocus;function b:OnGetFocus()if self:GetValue()=="Search..."then self:SetValue("")end;c(self)end;local d=b.OnLoseFocus;function b:OnLoseFocus()if self:GetValue()==""then timer.Simple(0,function()self:SetValue("Search...")end)end;d(self)end;local e=vgui.Create("DPanel")e:SetTall(500)local f=vgui.Create("DTree",e)local g=vgui.Create("DListView",e)g:AddColumn("Gate Name")g:AddColumn("Category")local h=string.find;local i=table.SortByMember;local j=string.lower;local function k(l)l=j(l)local m={}for n,o in pairs(GateActions)do local p=o.name;local q=j(p)if h(q,l,1,true)then m[#m+1]={name=o.name,group=o.group,action=n,dist=WireLib.levenshtein(l,q),description=o.description}end end;i(m,"dist",true)return m end;local r;function b:OnTextChanged()local l=b:GetValue()if l!=""then if!r then r=true;local s,t=f:GetPos()local u,v=f:GetSize()g:SetPos(s+u,t)g:MoveTo(s,t,0.1,0,1)g:SetSize(u,v)g:SetVisible(true)end;local m=k(l)g:Clear()for w=1,#m do local x=m[w]local y=g:AddLine(x.name,x.group)local n=GetConVarString("wire_gates_action")if n==x.action then y:SetSelected(true)end;y.action=x.action;if x.description then y.description=x.description;y:SetTooltip(x.description)end end else if r then r=false;local s,t=f:GetPos()local u,v=f:GetSize()g:SetPos(s,t)g:MoveTo(s+u,t,0.1,0,1)g:SetSize(u,v)timer.Create("wire_customspawnmenu_hidesearchlist",0.1,1,function()if IsValid(g)then g:SetVisible(false)end end)end;g:Clear()end end;function g:OnClickLine(y)local z=g:GetSelected()if z&&next(z)then z[1]:SetSelected(false)end;y:SetSelected(true)a.GateDescription:SetText(y.description||"")RunConsoleCommand("wire_gates_action",y.action)end;function b:OnEnter()if#g:GetLines()>0 then g:OnClickLine(g:GetLine(1))end end;a:AddItem(b)f:Dock(FILL)g:SetVisible(false)g:SetMultiSelect(false)local function A(f,B,C)B.Icon:SetImage("icon16/folder.png")local D={}for E,F in pairs(C)do D[#D+1]={action=E,gate=F,name=F.name}end;i(D,"name",true)for G=1,#D do local n,o=D[G].action,D[G].gate;local H=B:AddNode(o.name||"No name found :(")H.name=o.name;if o.description then H.description=o.description;H:SetTooltip(o.description)end;H.action=n;function H:DoClick()RunConsoleCommand("wire_gates_Action",self.action)a.GateDescription:SetText(self.description||"")end;H.Icon:SetImage("icon16/newspaper.png")end;f:InvalidateLayout()end;local I={}for J,K in pairs(WireGatesSorted)do local L={}local M=false;for E,F in pairs(K)do if!F.is_banned then L[E]=F;M=true end end;if M then I[#I+1]={gatetype=J,gatefuncs=L}end end;table.sort(I,function(N,O)return N.gatetype<O.gatetype end)for w=1,#I do local J=I[w].gatetype;local K=I[w].gatefuncs;local B=f:AddNode(J)B.Icon:SetImage("icon16/folder.png")A(f,B,K)function B:DoClick()self:SetExpanded(!self.m_bExpanded)end end;a:AddItem(e)a.GateDescription=a:Help("")local P=a:CheckBox("#WireGatesTool_noclip","wire_gates_noclip")local Q=a:CheckBox("#WireGatesTool_parent","wire_gates_parent")a:Help("When parenting, you should check the nocollide box, or adv duplicator might not dupe the gate.")a:NumSlider("#WireGatesTool_angleoffset","wire_gates_angleoffset",0,360,0)WireDermaExts.ModelSelect(a,"wire_gates_model",list.Get("Wire_gate_Models"),3,true)function P.Button:DoClick()self:Toggle()end;function Q.Button:DoClick()self:Toggle()if self:GetChecked()==true then P:SetValue(1)end end end end;WireToolSetup.BaseLang()function TOOL:RightClick(R)if CLIENT then return true end;if self:CheckHitOwnClass(R)then local n=GateActions[R.Entity.action]assert(n,"Attempted to copy gate "..tostring(R.Entity).." with no action!")self:GetOwner():ConCommand("wire_gates_action "..R.Entity.action)self:GetOwner():ChatPrint("Gate copied ('"..n.name.."').")return true else return false end end;function TOOL:Reload(R)if self:GetOwner():KeyDown(IN_SPEED)then if!R||!R.Hit then return false end;if CLIENT&&R.Entity then return true end;if R.Entity:GetParent():IsValid()then local S=R.Entity:GetPos()R.Entity:SetParent()R.Entity:SetPos(S)local T=R.Entity:GetPhysicsObject()if T then T:Wake()end;self:GetOwner():ChatPrint("Entity unparented.")return true end;return false else if game.SinglePlayer()&&SERVER then self:GetOwner():ConCommand("wire_gates_angleoffset "..(self:GetClientNumber("angleoffset")+45)%360)elseif CLIENT then RunConsoleCommand("wire_gates_angleoffset",(self:GetClientNumber("angleoffset")+45)%360)end end;return false end;function TOOL:GetAngle(R)local U=WireToolObj.GetAngle(self,R)U:RotateAroundAxis(R.HitNormal,self:GetClientNumber("angleoffset"))return U end
--addons/!lpakr_out/lua/wire/stools/holoemitter.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/lamp.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/nailer.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/output.lua:
WireToolSetup.setCategory("Input, Output/Keyboard Interaction")WireToolSetup.open("output","Numpad Output","gmod_wire_output",nil,"Numpad Outputs")if CLIENT then language.Add("Tool.wire_output.name","Output Tool (Wire)")language.Add("Tool.wire_output.desc","Spawns an output for use with the wire system.")language.Add("Tool.wire_output.keygroup","Key:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(10)TOOL.ClientConVar={model="models/beer/wiremod/numpad.mdl",modelsize="",keygroup=1}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_output")WireToolHelpers.MakeModelSizer(a,"wire_output_modelsize")ModelPlug_AddToCPanel(a,"Numpad","wire_output",true)a:AddControl("Numpad",{Label="#Tool.wire_output.keygroup",Command="wire_output_keygroup"})end
--addons/!lpakr_out/lua/wire/stools/pixel.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/rom.lua:
WireToolSetup.setCategory("Advanced")WireToolSetup.open("rom","Memory - ROM","gmod_wire_dhdd",nil,"Memory ROMs")if CLIENT then language.Add("Tool.wire_rom.name","ROM Tool (Wire)")language.Add("Tool.wire_rom.desc","Spawns a ROM chip")language.Add("Tool.wire_rom.note","ROM size will depend on written data.\nThe maximum size is 256 KB.")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}TOOL.ClientConVar["model"]="models/jaanus/wiretool/wiretool_gate.mdl"function TOOL.BuildCPanel(a)ModelPlug_AddToCPanel(a,"gate","wire_rom",nil,4)a:Help("#Tool.wire_rom.note")end;WireToolSetup.setToolMenuIcon("icon16/database.png")end;TOOL.MaxLimitName="wire_dhdds"
--addons/!lpakr_out/lua/wire/stools/screen.lua:
WireToolSetup.setCategory("Visuals/Screens")WireToolSetup.open("screen","Screen","gmod_wire_screen",nil,"Screens")if CLIENT then language.Add("tool.wire_screen.name","Screen Tool (Wire)")language.Add("tool.wire_screen.desc","Spawns a screen that display values.")language.Add("Tool_wire_screen_singlevalue","Only one value")language.Add("Tool_wire_screen_singlebigfont","Use bigger font for single-value screen")language.Add("Tool_wire_screen_texta","Text A:")language.Add("Tool_wire_screen_textb","Text B:")language.Add("Tool_wire_screen_leftalign","Left alignment")language.Add("Tool_wire_screen_floor","Floor screen value")language.Add("Tool_wire_screen_formatnumber","Format the number into millions, billions, etc")language.Add("Tool_wire_screen_formattime","Format the number as a duration, in seconds")language.Add("Tool_wire_screen_createflat","Create flat to surface")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/props_lab/monitor01b.mdl",singlevalue=0,singlebigfont=1,texta="Value A",textb="Value B",createflat=1,leftalign=0,floor=0,formatnumber=0,formattime=0}function TOOL.BuildCPanel(a)WireToolHelpers.MakePresetControl(a,"wire_screen")WireDermaExts.ModelSelect(a,"wire_screen_model",list.Get("WireScreenModels"),5)a:CheckBox("#Tool_wire_screen_singlevalue","wire_screen_singlevalue")a:CheckBox("#Tool_wire_screen_singlebigfont","wire_screen_singlebigfont")a:CheckBox("#Tool_wire_screen_leftalign","wire_screen_leftalign")a:CheckBox("#Tool_wire_screen_floor","wire_screen_floor")a:CheckBox("#Tool_wire_screen_formatnumber","wire_screen_formatnumber")local b=a:CheckBox("#Tool_wire_screen_formattime","wire_screen_formattime")b:SetToolTip("This overrides the two above settings")a:TextEntry("#Tool_wire_screen_texta","wire_screen_texta")a:TextEntry("#Tool_wire_screen_textb","wire_screen_textb")a:CheckBox("#Tool_wire_screen_createflat","wire_screen_createflat")end
--addons/!lpakr_out/lua/wire/stools/simple_explosive.lua:
WireToolSetup.setCategory("Physics")WireToolSetup.open("simple_explosive","Explosives (Simple)","gmod_wire_simple_explosive",nil,"Simple Explosives")if CLIENT then language.Add("tool.wire_simple_explosive.name","Simple Wired Explosives Tool")language.Add("tool.wire_simple_explosive.desc","Creates a simple explosives for wire system.")language.Add("Tool.simple_explosive.model","Model:")language.Add("Tool.simple_explosive.trigger","Trigger value:")language.Add("Tool.simple_explosive.damage","Damage:")language.Add("Tool.simple_explosive.removeafter","Remove on explosion")language.Add("Tool.simple_explosive.radius","Blast radius:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name},{name="reload",text="Copy model"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={model="models/props_c17/oildrum001_explosive.mdl",modelman="",trigger=1,damage=200,radius=300,removeafter=0}TOOL.ReloadSetsModel=true;function TOOL.BuildCPanel(a)ModelPlug_AddToCPanel(a,"Explosive","wire_simple_explosive")a:Help("This tool is deprecated as its functionality is contained within Wire Explosive, and will be removed soon.")a:NumSlider("#Tool.simple_explosive.trigger","wire_simple_explosive_trigger",-10,10,0)a:NumSlider("#Tool.simple_explosive.damage","wire_simple_explosive_damage",0,500,0)a:NumSlider("#Tool.simple_explosive.radius","wire_simple_explosive_radius",1,1500,0)a:CheckBox("#Tool.simple_explosive.removeafter","wire_simple_explosive_removeafter")end
--addons/!lpakr_out/lua/wire/stools/target_finder.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/teleporter.lua:
WireToolSetup.setCategory("Physics")WireToolSetup.open("teleporter","Teleporter","gmod_wire_teleporter",nil,"Teleporters")if CLIENT then language.Add("Tool.wire_teleporter.name","Teleporter Tool")language.Add("Tool.wire_teleporter.desc","Spawns a Wire Teleporter")language.Add("Tool.wire_teleporter.effects","Toggle effects")language.Add("Tool.wire_teleporter.sounds","Toggle sounds (Also has an input)")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name},{name="reload",text="Copy model"}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(3)TOOL.ClientConVar={model="models/props_c17/utilityconducter001.mdl",sounds=1,effects=1}if SERVER then else function TOOL.BuildCPanel(a)WireDermaExts.ModelSelect(a,"wire_teleporter_model",list.Get("WireTeleporterModels"),4)a:CheckBox("#Tool.wire_teleporter.effects","wire_teleporter_effects")a:CheckBox("#Tool.wire_teleporter.sounds","wire_teleporter_sounds")end end;function TOOL:Reload(b)if!IsValid(b.Entity)then return end;if CLIENT then RunConsoleCommand("wire_teleporter_model",b.Entity:GetModel())else self:GetOwner():ChatPrint("Teleporter model set to: "..b.Entity:GetModel())end;return true end
--addons/!lpakr_out/lua/wire/stools/textentry.lua:
return lpakr()()
--addons/!lpakr_out/lua/wire/stools/trigger.lua:
WireToolSetup.setCategory("Detection")WireToolSetup.open("trigger","Trigger","gmod_wire_trigger",nil,"Triggers")TOOL.ClientConVar={model="models/jaanus/wiretool/wiretool_siren.mdl",filter=0,owneronly=0,sizex=64,sizey=64,sizez=64,offsetx=0,offsety=0,offsetz=0}local a;if CLIENT then a=CreateClientConVar("wire_trigger_drawalltriggers","0",true)language.Add("Tool.wire_trigger.filter","Filters")language.Add("Tool.wire_trigger.owneronly","Owner's Stuff Only")language.Add("Tool.wire_trigger.sizex","Size X")language.Add("Tool.wire_trigger.sizey","Size Y")language.Add("Tool.wire_trigger.sizez","Size Z")language.Add("Tool.wire_trigger.offsetx","Offset X")language.Add("Tool.wire_trigger.offsety","Offset Y")language.Add("Tool.wire_trigger.offsetz","Offset Z")language.Add("tool.wire_trigger.name","Trigger Tool (Wire)")language.Add("tool.wire_trigger.desc","Spawns a Trigger")language.Add("Tool.wire_trigger.alltriggers","All Triggers Visible")language.Add("tool.wire_trigger.resetsize","Reset Size")language.Add("tool.wire_trigger.resetoffset","Reset Offset")language.Add("Tool.wire_trigger.filter_all","All Entities")language.Add("Tool.wire_trigger.filter_players","Only Players")language.Add("Tool.wire_trigger.filter_props","Only Props")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}concommand.Add("wire_trigger_reset_size",function(b,c,d)RunConsoleCommand("wire_trigger_sizex",64)RunConsoleCommand("wire_trigger_sizey",64)RunConsoleCommand("wire_trigger_sizez",64)end)concommand.Add("wire_trigger_reset_offset",function(b,c,d)RunConsoleCommand("wire_trigger_offsetx",0)RunConsoleCommand("wire_trigger_offsety",0)RunConsoleCommand("wire_trigger_offsetz",0)end)end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(64)function TOOL:GetConVars()return self:GetClientInfo("model"),self:GetClientNumber("filter"),self:GetClientNumber("owneronly"),self:GetClientNumber("sizex"),self:GetClientNumber("sizey"),self:GetClientNumber("sizez"),self:GetClientNumber("offsetx"),self:GetClientNumber("offsety"),self:GetClientNumber("offsetz")end;local function e(f)cam.Start3D(LocalPlayer():EyePos(),LocalPlayer():EyeAngles())for g,h in pairs(f)do local i=h:GetTriggerEntity()render.DrawWireframeBox(i:GetPos(),Angle(0,0,0),i:OBBMins(),i:OBBMaxs(),Color(255,255,0),true)render.DrawLine(i:GetPos(),h:GetPos(),Color(255,255,0))end;cam.End3D()end;hook.Add("HUDPaint","wire_trigger_draw_all_triggers",function()if a:GetBool()then e(ents.FindByClass("gmod_wire_trigger"))end end)function TOOL:DrawHUD()local j=util.TraceLine(util.GetPlayerTrace(LocalPlayer()))local h=j.Entity;if IsValid(h)&&h:GetClass()=="gmod_wire_trigger"&&!a:GetBool()then e({h})end end;function TOOL:RightClick(j)if IsValid(j.Entity)then local h=j.Entity;if h:GetClass()=="gmod_wire_trigger"then local k=h:GetTriggerSize()local l=h:GetTriggerOffset()RunConsoleCommand("wire_trigger_sizex",k.x)RunConsoleCommand("wire_trigger_sizey",k.y)RunConsoleCommand("wire_trigger_sizez",k.z)RunConsoleCommand("wire_trigger_offsetx",l.x)RunConsoleCommand("wire_trigger_offsety",l.y)RunConsoleCommand("wire_trigger_offsetz",l.z)RunConsoleCommand("wire_trigger_filter",h:GetFilter())RunConsoleCommand("wire_trigger_owneronly",h:GetOwnerOnly()&&1||0)RunConsoleCommand("wire_trigger_model",h:GetModel())return true end end end;function TOOL.BuildCPanel(m)ModelPlug_AddToCPanel(m,"Misc_Tools","wire_trigger")m:CheckBox("#Tool.wire_trigger.alltriggers","wire_trigger_drawalltriggers")m:AddControl("ComboBox",{Label="#Tool.wire_trigger.filter",Options={["#Tool.wire_trigger.filter_all"]={wire_trigger_filter=0},["#Tool.wire_trigger.filter_players"]={wire_trigger_filter=1},["#Tool.wire_trigger.filter_props"]={wire_trigger_filter=2}}})m:CheckBox("#Tool.wire_trigger.owneronly","wire_trigger_owneronly")m:Button("#Tool.wire_trigger.resetsize","wire_trigger_reset_size")m:NumSlider("#Tool.wire_trigger.sizex","wire_trigger_sizex",-1000,1000,64)m:NumSlider("#Tool.wire_trigger.sizey","wire_trigger_sizey",-1000,1000,64)m:NumSlider("#Tool.wire_trigger.sizez","wire_trigger_sizez",-1000,1000,64)m:Button("#Tool.wire_trigger.resetoffset","wire_trigger_reset_offset")m:NumSlider("#Tool.wire_trigger.offsetx","wire_trigger_offsetx",-1000,1000,0)m:NumSlider("#Tool.wire_trigger.offsety","wire_trigger_offsety",-1000,1000,0)m:NumSlider("#Tool.wire_trigger.offsetz","wire_trigger_offsetz",-1000,1000,0)end
--addons/!lpakr_out/lua/wire/stools/turret.lua:
WireToolSetup.setCategory("Other")WireToolSetup.open("turret","Turret","gmod_wire_turret",nil,"Turrets")Sound("ambient.electrical_zap_3")Sound("NPC_FloorTurret.Shoot")if CLIENT then language.Add("tool.wire_turret.name","Turret")language.Add("tool.wire_turret.desc","Throws bullets at things")language.Add("Tool_wire_turret_spread","Bullet Spread")language.Add("Tool_wire_turret_numbullets","Bullets per Shot")language.Add("Tool_wire_turret_force","Bullet Force")language.Add("Tool_wire_turret_sound","Shoot Sound")language.Add("Tool_wire_turret_tracernum","Tracer Every x Bullets:")TOOL.Information={{name="left",text="Create/Update "..TOOL.Name}}end;WireToolSetup.BaseLang()WireToolSetup.SetupMax(20)TOOL.ClientConVar={delay=0.05,force=1,sound=0,damage=10,spread=0,numbullets=1,automatic=1,tracer="Tracer",tracernum=1,model="models/weapons/w_smg1.mdl"}TOOL.GhostAngle=Angle(-90,0,0)TOOL.GetGhostMin=function()return-2 end;local a={["models/weapons/w_smg1.mdl"]=true,["models/weapons/w_smg_mp5.mdl"]=true,["models/weapons/w_smg_mac10.mdl"]=true,["models/weapons/w_rif_m4a1.mdl"]=true,["models/weapons/w_357.mdl"]=true,["models/weapons/w_shot_m3super90.mdl"]=true}function TOOL:GetModel()local b=WireToolObj.GetModel(self)return a[b]&&b||"models/weapons/w_smg1.mdl"end;function TOOL.BuildCPanel(c)WireToolHelpers.MakePresetControl(c,"wire_turret")local d={Label="#Tool_wire_turret_sound",MenuButton=0,Options={},CVars={}}d["Options"]["#No Weapon"]={wire_turret_sound=""}d["Options"]["#Pistol"]={wire_turret_sound="Weapon_Pistol.Single"}d["Options"]["#SMG"]={wire_turret_sound="Weapon_SMG1.Single"}d["Options"]["#AR2"]={wire_turret_sound="Weapon_AR2.Single"}d["Options"]["#Shotgun"]={wire_turret_sound="Weapon_Shotgun.Single"}d["Options"]["#Floor Turret"]={wire_turret_sound="NPC_FloorTurret.Shoot"}d["Options"]["#Airboat Heavy"]={wire_turret_sound="Airboat.FireGunHeavy"}d["Options"]["#Zap"]={wire_turret_sound="ambient.electrical_zap_3"}c:AddControl("ComboBox",d)WireDermaExts.ModelSelect(c,"wire_turret_model",list.Get("WireTurretModels"),2)local e={Label="#Tracer",MenuButton=0,Options={},CVars={}}e["Options"]["#Default"]={wire_turret_tracer="Tracer"}e["Options"]["#AR2 Tracer"]={wire_turret_tracer="AR2Tracer"}e["Options"]["#Airboat Tracer"]={wire_turret_tracer="AirboatGunHeavyTracer"}e["Options"]["#Laser"]={wire_turret_tracer="LaserTracer"}c:AddControl("ComboBox",e)c:NumSlider("#Tool_wire_turret_numbullets","wire_turret_numbullets",1,10,0)c:NumSlider("#Damage","wire_turret_damage",0,100,0)c:NumSlider("#Tool_wire_turret_spread","wire_turret_spread",0,1.0,2)c:NumSlider("#Tool_wire_turret_force","wire_turret_force",0,500,1)c:NumSlider("#Tool_wire_turret_tracernum","wire_turret_tracernum",0,15,0)c:NumSlider("#Delay","wire_turret_delay",0,1.0,2)end
--addons/!lpakr_out/lua/wire/stools/waypoint.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_chaingun.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dc17_dual_sup.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.AimPos=Vector(0,-5,0)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,-12,-10)SWEP.SprintAng=Vector(50,0,5)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;SWEP.UIPosition=Vector(5,-65,0)SWEP.UIAngle=Angle(0,180,0)SWEP.Category='SUP Custom Weapons'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.Akimbo=true;SWEP.AmmoOffset=Vector(20,-3,-2)SWEP.AmmoOffsetAng=Angle(-20,-90,90)SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.SprintingEnabled=false;SWEP.NormalHoldType='duel'SWEP.RunHoldType='normal'SWEP.FireModes={'semi'}SWEP.Base='cw_base'SWEP.Category='SUP Event Weapons'SWEP.Slot=2;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc17dual_suppressed.mdl'SWEP.WorldModel='models/galactic/weapons/wmodels/supdc17sdualworld_suppressed.mdl'SWEP.Spawnable=true;SWEP.Primary.ClipSize=50;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=false;SWEP.FireDelay=.2;SWEP.FireSound=Sound'blaster.hotson_pistol'SWEP.Recoil=1;SWEP.RecoilAngle=Angle(-1,0,0)SWEP.HipSpread=0.05;SWEP.AimSpread=0.005;SWEP.VelocitySensitivity=5;SWEP.MaxSpreadInc=0;SWEP.SpreadPerShot=0;SWEP.SpreadCooldown=0;SWEP.Shots=1;SWEP.Damage=55;SWEP.DeployTime=1;SWEP.ShowHands=true;sound.Add({name='blaster.hotson_pistol',channel=CHAN_WEAPON,volume=.7,level=75,pitch={95,105},sound='weapons/hotson_pistol.wav'})
--addons/!lpakr_out/lua/weapons/sup_dc17m_shotgun.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/sup_dc17mbr.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.AimPos=Vector(-5.89,0,2)SWEP.AimAng=Vector(0,0,0)SWEP.RestPos=Vector(0,-2,.5)SWEP.SprintPos=Vector(5,-3,1)SWEP.SprintAng=Vector(-15,50,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'end;SWEP.PrintName='DC-17 MBR'SWEP.FadeCrosshairOnAim=true;SWEP.MuzzleEffect='swb_pistol_large'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(16,-1.5,-4)SWEP.SkinSlotId=1;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto','semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/galactic/weapons/vmodels/supdc17m.mdl'SWEP.WorldModel='models/weapons/w_dc17m_br.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=100;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.10;SWEP.FireSound=Sound'blaster.dc17mbr_fire'SWEP.ReloadSound=Sound'blaster.reload_dc17m'SWEP.Recoil=.5;SWEP.RecoilAngle=Angle(-1.5,-.2,0)SWEP.HipSpread=0.025;SWEP.AimSpread=0.01;SWEP.VelocitySensitivity=1.5;SWEP.MaxSpreadInc=0.001;SWEP.SpreadPerShot=0.007;SWEP.SpreadCooldown=0.1;SWEP.Shots=1;SWEP.Damage=30;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.UIPosition=Vector(0,-60,0)SWEP.UIAngle=Angle(0,90,0)
--addons/!lpakr_out/lua/weapons/sup_e5_falcon.lua:
AddCSLuaFile()SWEP.PrintName='Arcturus Rifle'SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.NoStockShells=false;SWEP.NoStockMuzzle=false;SWEP.MuzzleEffect='swb_pistol_large'SWEP.RestPos=Vector(0,-3,0)SWEP.AimPos=Vector(-4.693,-6.5,.342)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(0,0,1)SWEP.SprintAng=Vector(-15,5,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto'}SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=0;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/tobester/weapons/v_arcturus.mdl'SWEP.WorldModel='models/tobester/weapons/w_arcturus.mdl'SWEP.UIPosition=Vector(15,0,0)SWEP.UIAngle=Angle()SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=80;SWEP.Primary.DefaultClip=80;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.14;SWEP.FireSound=Sound'blaster.mando_fire'SWEP.ReloadSound=Sound'blaster.e11_reload'SWEP.Recoil=.4;SWEP.RecoilAngle=Angle(-.5,0,0)SWEP.RecoilAngleSpread=Angle(0,0,0)SWEP.HipSpread=.01;SWEP.AimSpread=.01;SWEP.VelocitySensitivity=1.6;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.5;SWEP.SpreadCooldown=0.4;SWEP.Shots=1;SWEP.Damage=50;SWEP.DeployTime=0;SWEP.ShowHands=false;SWEP.FadeCrosshairOnAim=true;SWEP.DamageType=DMG_DISSOLVE;SWEP.AmmoType='dissolve'SWEP.Tracer=1
--addons/!lpakr_out/lua/weapons/sup_hei.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=true;SWEP.RestPos=Vector(0,-1,0)SWEP.AimPos=Vector(-2,-4,0)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(2,-4,1)SWEP.SprintAng=Vector(-15,40,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'SWEP.DelayedZoom=true;SWEP.SimulateCenterMuzzle=false;SWEP.ZoomAmount=15;SWEP.AdjustableZoom=true;SWEP.MinZoom=1;SWEP.MaxZoom=35;SWEP.ZoomSteps=5;SWEP.ScopeOverrideMaterialIndex=1;SWEP.ScopeFOV=10;SWEP.ScopeFlipX=true;SWEP.ScopeFlipY=false;SWEP.ScopedBlur=false;SWEP.PrintName='Hei'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(25,-2,-2.5)SWEP.CanPenetrate=false;SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='ar2'SWEP.RunHoldType='passive'SWEP.FireModes={'auto','semi'}SWEP.Base='cw_base'SWEP.Category='SUP Custom Weapons'SWEP.Slot=1;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/tobester/weapons/v_hei_blaster.mdl'SWEP.WorldModel='models/tobester/weapons/w_hei_blaster.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=false;SWEP.Hide=true;SWEP.Primary.ClipSize=50;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=true;SWEP.FireDelay=0.10;SWEP.RecoilAngle=Angle(-.8,0,0)SWEP.HipSpread=.02;SWEP.AimSpread=.002;SWEP.VelocitySensitivity=0;SWEP.MaxSpreadInc=0;SWEP.SpreadPerShot=0;SWEP.SpreadCooldown=0;SWEP.Shots=1;SWEP.Damage=32;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.BulletDiameter=0;SWEP.CaseLength=0;SWEP.HasScope=false;SWEP.FadeCrosshairOnAim=false;SWEP.PreventQuickScoping=true;SWEP.Tracer=1;SWEP.TracerName='sup_laser_yellow_mando'SWEP.Primary.Tracer=1;SWEP.Primary.TracerName='sup_laser_yellow_mando'SWEP.ImpactEffectColor=Vector(225,200,0)SWEP.UIPosition=Vector(0,-45,0)SWEP.UIAngle=Angle(0,-90,0)
--addons/!lpakr_out/lua/weapons/sup_mandopistol.lua:
AddCSLuaFile()SWEP.DrawCrosshair=false;SWEP.CSMuzzleFlashes=false;SWEP.AimPos=Vector(-3.15,0,2.4)SWEP.AimAng=Vector(0,0,0)SWEP.SprintPos=Vector(4,-2,2)SWEP.SprintAng=Vector(-20,10,0)SWEP.ViewModelMovementScale=.5;SWEP.IconLetter='b'sound.Add({name='blaster.mandopistol_fire',channel=CHAN_WEAPON,volume=.35,level=90,pitch={95,105},sound='weapons/mandopistol_fire.mp3'})SWEP.PrintName='Mando Pistol'SWEP.BobScale=0;SWEP.SwayScale=0;SWEP.ViewbobIntensity=2;SWEP.ViewbobEnabled=true;SWEP.AmmoOffset=Vector(15,-2.3,-2.5)SWEP.PlayBackRate=30;SWEP.PlayBackRateSV=12;SWEP.BulletDiameter=7.62;SWEP.CaseLength=39;SWEP.Kind=WEAPON_HEAVY;SWEP.AutoSpawnable=false;SWEP.AllowDrop=false;SWEP.NormalHoldType='pistol'SWEP.RunHoldType='normal'SWEP.FireModes={'semi'}SWEP.Base='cw_base'SWEP.Category='SUP Starwars Weapons'SWEP.Slot=2;SWEP.SlotPos=0;SWEP.Author='Scott'SWEP.Contact=''SWEP.Purpose=''SWEP.Instructions=''SWEP.ViewModelFlip=false;SWEP.ViewModel='models/tobester/mando/v_mandopistol.mdl'SWEP.WorldModel='models/tobester/mando/w_mandopistol.mdl'SWEP.Spawnable=true;SWEP.AdminSpawnable=false;SWEP.Primary.ClipSize=25;SWEP.Primary.DefaultClip=0;SWEP.Primary.Automatic=false;SWEP.FireDelay=.25;SWEP.FireSound=Sound'blaster.mandopistol_fire'SWEP.ReloadSound=Sound'blaster.reload_pistol'SWEP.RecoilAngle=Angle(-.75,0,0)SWEP.HipDivRecoil=Vector(0,0,0)SWEP.HipSpread=0.005;SWEP.AimSpread=0.005;SWEP.VelocitySensitivity=1;SWEP.MaxSpreadInc=0;SWEP.SpreadPerShot=0;SWEP.SpreadCooldown=0;SWEP.Shots=1;SWEP.Damage=45;SWEP.DeployTime=1;SWEP.ShowHands=true;SWEP.Tracer=1;SWEP.TracerName='sup_laser_yellow_mando'SWEP.Primary.Tracer=1;SWEP.Primary.TracerName='sup_laser_yellow_mando'SWEP.ImpactEffectColor=Vector(225,200,0)
--addons/!lpakr_out/lua/weapons/sup_remotesatchel/shared.lua:
SWEP.Base='weapon_base'SWEP.Category='SUP Weapons'SWEP.PrintName='Satchel Charge'SWEP.Author='Scott'SWEP.Purpose=''SWEP.Spawnable=true;SWEP.Slot=3;SWEP.SlotPos=0;SWEP.DrawCrosshair=false;SWEP.IsGrenade=true;SWEP.ViewModelFOV=55;SWEP.DrawAmmo=true;SWEP.Ammo3D=false;SWEP.UseHands=true;SWEP.HoldType='slam'SWEP.Cooldown=20;SWEP.Primary.Ammo='slam'SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.ViewModel='models/weapons/v_slam.mdl'SWEP.WorldModel='models/weapons/w_slam.mdl'SWEP.SatchelEnt='rp_satchel'SWEP.MaxFrequency=250;SWEP.MaxSatchels=5;SWEP.UIPosition=Vector(0,-65,-5)SWEP.UIAngle=Angle(0,-45,0)SWEP.DrawAmmo=true;SWEP.FireModeDisplay='Detonator'sound.Add({name='satchel.click',channel=CHAN_WEAPON,volume=.2,level=70,pitch={99,101},sound='ui/buttonclick.wav'})function SWEP:SetupDataTables()self:NetworkVar('Int',0,'Frequency')end;function SWEP:Initialize()self:SetHoldType(self.HoldType)end;function SWEP:PrimaryAttack()if CLIENT then return end;local a=self:GetOwner()if!a||self.NextAttack&&self.NextAttack>CurTime()then return true end;if self:CanPlaceSatchel(a)then self:StartSatchelAttach(a)self.NextAttack=CurTime()+2 else self:Deploy()end end;function SWEP:SecondaryAttack()if CLIENT then return end;local a=self:GetOwner()if!a||self.NextAttack&&self.NextAttack>CurTime()then return true end;local b=self:GetFrequency()||0;local c=self:GetSatchels(b)if#c>0 then self:Detonate(c)self.NextAttack=CurTime()+1.5 else self:FailedDetonate()self.NextAttack=CurTime()+1 end end
--addons/!lpakr_out/lua/weapons/swb_357/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/swb_357/shared.lua:
AddCSLuaFile()if CLIENT then SWEP.DrawCrosshair=false;SWEP.PrintName=".357 Revolver"SWEP.CSMuzzleFlashes=true;SWEP.AimPos=Vector(-4.691,-3.958,0.66)SWEP.AimAng=Vector(0,-0.216,0)SWEP.SprintPos=Vector(1.185,-15.796,-14.254)SWEP.SprintAng=Vector(64.567,0,0)SWEP.ZoomAmount=5;SWEP.ViewModelMovementScale=0.85;SWEP.Shell="smallshell"SWEP.IconLetter="f"killicon.AddFont("swb_357","SWB_KillIcons",SWEP.IconLetter,Color(255,80,0,150))SWEP.MuzzleEffect="CS_MuzzleFlash_X"SWEP.MuzzlePosMod={x=6.5,y=30,z=-2}end;SWEP.SpeedDec=12;SWEP.BulletDiameter=9.1;SWEP.CaseLength=33;SWEP.PlayBackRate=2;SWEP.PlayBackRateSV=2;SWEP.Kind=WEAPON_PISTOL;SWEP.AutoSpawnable=true;SWEP.AllowDrop=true;SWEP.AmmoEnt="item_ammo_revolver_ttt"SWEP.Slot=3;SWEP.SlotPos=0;SWEP.NormalHoldType="Pistol"SWEP.RunHoldType="normal"SWEP.FireModes={"double"}SWEP.Base="swb_base"SWEP.Category="SUP Weapons"SWEP.Author="Spy"SWEP.Contact=""SWEP.Purpose=""SWEP.Instructions=""SWEP.ViewModelFOV=55;SWEP.ViewModelFlip=false;SWEP.ViewModel=Model("models/weapons/c_357.mdl")SWEP.WorldModel=Model("models/weapons/w_357.mdl")SWEP.Spawnable=true;SWEP.AdminSpawnable=true;SWEP.Primary.ClipSize=6;SWEP.Primary.DefaultClip=6;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="Pistol"SWEP.FireDelay=0.45;SWEP.FireSound=Sound("Weapon_357.Single")SWEP.Recoil=3;SWEP.Chamberable=false;SWEP.HipSpread=0.048;SWEP.AimSpread=0.0075;SWEP.VelocitySensitivity=1.85;SWEP.MaxSpreadInc=0.06;SWEP.SpreadPerShot=0.015;SWEP.SpreadCooldown=0.5;SWEP.Shots=1;SWEP.Damage=55;SWEP.DeployTime=3
--addons/!lpakr_out/lua/weapons/swb_base/sh_sounds.lua:
function SWB_RegisterSound(a,b,c,d,e)local f={channel=CHAN_STATIC,volume=1,level=c,name=a,sound=b,pitchstart=d,pitchend=e}sound.Add(f)end;SWB_RegisterSound("SWB_Empty","weapons/shotgun/shotgun_empty.wav",60,95,112)SWB_RegisterSound("SWB_Knife_Hit",{"weapons/knife/knife_hit1.wav","weapons/knife/knife_hit2.wav","weapons/knife/knife_hit3.wav","weapons/knife/knife_hit4.wav"},70,92,122)SWB_RegisterSound("SWB_Knife_HitElse","weapons/knife/knife_hitwall1.wav",70,92,122)SWB_RegisterSound("SWB_Knife_Swing",{"weapons/knife/knife_slash1.wav","weapons/knife/knife_slash2.wav"},65,92,122)
--addons/!lpakr_out/lua/weapons/swb_base/cl_rendericon.lua:
if true then return end;local a={}local b=FindMetaTable('Weapon')file.CreateDir('sup/mrp/wepicons/')local c='324324235'local d='models/error.mdl'local e=Material'models/debug/debugwhite'local f=ClientsideModel'models/weapons/insurgency/w_ak74.mdl'f:SetNoDraw(true)function b:RenderIconTexture(g)if!IsValid(self)then return end;local h=self:GetModel()if h==d then return end;local i=self:GetClass()local j='sup/mrp/wepicons/'..i..'.png'if!g&&(a[i]||file.Exists('data/'..j,'GAME'))then a[i]=Material('data/'..j)self.RenderingIcon=false;self.IconRendered=a[i]return end;f:SetModel(h)f:SetPos(self.IconRenderPos||Vector())f:SetAngles(self.IconRenderAngle||Angle(30,90,0))f:SetModelScale(self.IconRenderScale||1,0)local k=GetRenderTargetEx(i..c,1024,522,RT_SIZE_NO_CHANGE,8,MATERIAL_RT_DEPTH_SHARED,CREATERENDERTARGETFLAGS_AUTOMIPMAP,IMAGE_FORMAT_RGBA8888)local l=CreateMaterial(i..c,'UnlitGeneric',{['$basetexture']=k:GetName(),['$ignorez']=1,['$vertexcolor']=1,['$vertexalpha']=1,['$nolod']=1,['$transparent']=1})surface.SetAlphaMultiplier(1)surface.SetDrawColor(255,255,255,255)render.PushRenderTarget(k)render.SetStencilEnable(true)render.SuppressEngineLighting(true)render.Clear(0,0,0,255,true,true)render.PushFilterMag(3)render.PushFilterMin(3)render.ResetModelLighting(1,1,1)render.SetColorModulation(1,1,1)render.MaterialOverride(e)render.SetBlend(.99)render.SetStencilReferenceValue(1)render.SetStencilFailOperation(STENCILOPERATION_KEEP)render.SetStencilZFailOperation(STENCILOPERATION_KEEP)render.SetStencilPassOperation(STENCILOPERATION_REPLACE)render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_ALWAYS)local m,n,o,p=self.RenderIconX&&self.RenderIconX>0&&self.RenderIconX||0,self.RenderIconY&&self.RenderIconY>0&&self.RenderIconY||0,1004,492;cam.Start3D(Angle(-96,0,0),Vector(0,0,-15),30,m,n,o,p)f:DrawModel()cam.End3D()render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NOTEQUAL)render.ClearBuffersObeyStencil(255,255,255,0)render.SetStencilEnable(false)render.PopFilterMag()render.PopFilterMin()render.MaterialOverride()render.SuppressEngineLighting(false)render.PopRenderTarget()local k=GetRenderTargetEx(i..c..2,1024,522,RT_SIZE_NO_CHANGE,8,MATERIAL_RT_DEPTH_SHARED,CREATERENDERTARGETFLAGS_AUTOMIPMAP,IMAGE_FORMAT_RGBA8888)render.PushRenderTarget(k)render.Clear(50,50,50,0,true)cam.Start2D()surface.SetMaterial(l)surface.DrawTexturedRect(self.RenderIconX&&self.RenderIconX<0&&self.RenderIconX||0,self.RenderIconY&&rf.Y<0&&self.RenderIconY||0,1024,512)cam.End2D()if!g then file.Write(j,render.Capture({format='png',quality=100,x=0,y=0,h=512,w=1024}))end;render.PopRenderTarget()a[i]=g&&l||Material('data/'..j)self.RenderingIcon=false;self.IconRendered=a[i]return self.IconRendered end;function b:GetRenderedIcon()if!self.RenderDynamicIcon then return end;local i=self:GetClass()if a[i]then return a[i]elseif!self.RenderingIcon then self.RenderingIcon=true;return self:RenderIconTexture()end end
--addons/!lpakr_out/lua/weapons/swb_base/cl_hud.lua:
surface.CreateFont("SWB_HUD16",{font="Default",size=16,weight=700,blursize=0,antialias=true,shadow=false})surface.CreateFont("SWB_KillIcons",{font="csd",size=ScreenScale(30),weight=500,blursize=0,antialias=true,shadow=false})surface.CreateFont("SWB_SelectIcons",{font="csd",size=ScreenScale(60),weight=500,blursize=0,antialias=true,shadow=false})SWEP.CrossAmount=0;SWEP.CrossAlpha=255;SWEP.FadeAlpha=0;SWEP.AimTime=0;local a=surface.GetTextureID("supmswb/bullet")local b,c=Color(255,255,255,255),Color(0,0,0,255)local d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s;local t={}local u=draw.SimpleText;function draw.ShadowText(v,w,d,e,x,y,z,A,B)u(v,w,d+z,e+z,y,A,B)u(v,w,d,e,x,A,B)end;function SWEP:DrawHUD()j,k,d,e=FrameTime(),CurTime(),ScrW(),ScrH()q=UnPredictedCurTime()if self.dt.State==SWB_AIMING then if self.FadeDuringAiming then if q<self.AimTime then self.FadeAlpha=math.Approach(self.FadeAlpha,255,j*1500)else self.FadeAlpha=Lerp(j*10,self.FadeAlpha,0)end;surface.SetDrawColor(0,0,0,self.FadeAlpha)surface.DrawRect(0,0,d,e)end else self.FadeAlpha=0 end;local C=self:GetOwner()if!self.CrosshairEnabled||C!=LocalPlayer()then return end;local D=-1*C:GetPunchAngle().p;self.CrossAmount=Lerp(j*55,self.CrossAmount,D*25*100/(math.Clamp(GetConVarNumber("fov_desired"),75,100)-self.CurFOVMod))if self.dt.State==SWB_AIMING&&(self.FadeCrosshairOnAim&&!isThirdPerson()&&!cvar.GetValue('weapon_crosshairads'))||self.dt.State==SWB_RUNNING||self.dt.State==SWB_ACTION||self.dt.Safe||C:InVehicle()||(self.IsReloading||self.IsFiddlingWithSuppressor)&&self.Cycle<=0.9 then self.CrossAlpha=Lerp(j*15,self.CrossAlpha,0)else self.CrossAlpha=Lerp(j*15,self.CrossAlpha,255)end;if cvar.GetValue'weapon_staticcrosshair'then srp.weapons.DrawCrosshair(nil,nil,self.CrossAlpha,self.CrossAmount)else if!cvar.GetValue('weapon_crosshair')then return end;h=C:ShouldDrawLocalPlayer()if h then t.start=C:GetShootPos()t.endpos=t.start+(C:EyeAngles()+C:GetPunchAngle()):Forward()*16384;t.filter=C;l=util.TraceLine(t)f=l.HitPos:ToScreen()f,g=f.x,f.y else f,g=math.Round(d*0.5),math.Round(e*0.5)end;srp.weapons.DrawCrosshair(f,g,self.CrossAlpha,self.CrossAmount)if self.ClumpSpread then surface.DrawCircle(f,g,self.ClumpSpread<.1&&20||40,255,255,255,self.CrossAlpha)end end end;function SWEP:DrawWeaponSelection(d,e,E,F,G)if self.SelectIcon then surface.SetDrawColor(255,210,0,255)surface.SetTexture(self.SelectIcon)surface.DrawTexturedRect(d+F*0.2,e,F,F)else draw.SimpleText(self.IconLetter,"SWB_SelectIcons",d+E/2,e+F*0.2,Color(255,210,0,G),TEXT_ALIGN_CENTER)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_combo_fists.lua:
AddCSLuaFile()SWEP.PrintName="Combo Fists"SWEP.Author="code_gs"SWEP.Purpose="Well we sure as hell didn't use guns! We would just wrestle Hunters to the ground with our bare hands! I used to kill ten, twenty a day, just using my fists."SWEP.Slot=3;SWEP.SlotPos=3;SWEP.Spawnable=true;SWEP.ViewModel=Model("models/code_gs/weapons/c_fists.mdl")SWEP.WorldModel=""SWEP.ViewModelFOV=75;SWEP.UseHands=true;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=true;SWEP.Primary.Ammo="none"SWEP.Primary.Cooldown=0.2;SWEP.DrawAmmo=false;SWEP.HoldType="fist"SWEP.HitDistance=45;SWEP.Damage=10;SWEP.Deviation=8;SWEP.AnimDelay=0.1;SWEP.Activities={["primary"]=ACT_VM_PRIMARYATTACK,["secondary"]=ACT_VM_SECONDARYATTACK,["reload"]=ACT_VM_RELOAD,["deploy"]=ACT_VM_DRAW,["holster"]=ACT_VM_HOLSTER,["idle"]=ACT_VM_IDLE}SWEP.m_Contexts={}SWEP.Sounds={["primary"]="Flesh.ImpactHard",["secondary"]="WeaponFrag.Throw"}SWEP.KnockSounds={Sound("physics/flesh/flesh_impact_bullet2.wav"),Sound("physics/flesh/flesh_impact_bullet4.wav"),Sound("physics/flesh/flesh_impact_bullet5.wav")}function SWEP:SetupDataTables()self:NetworkVar("Float",0,"NextIdle")self:NetworkVar("Float",1,"NextReload")self:NetworkVar("Float",2,"NextThink")end;function SWEP:Initialize()self:SetThinkFunction(self.ItemFrame)self:SetHoldType(self.HoldType)end;function SWEP:SetThinkFunction(a)self.m_fThinkFunc=a end;function SWEP:SetDormant(b)if!self:IsDormant()&&b&&!self:IsCarriedByLocalPlayer()then self:Holster(NULL)end;_R.Entity.SetDormant(self,b)end;local c=function()end;function SWEP:GetThink()return self.m_fThinkFunc||c end;function SWEP:AddContextThink(d,e)if!IsFirstTimePredicted()then return end;self.m_Contexts[#self.m_Contexts+1]={[1]=d,[2]=e,[3]=e+CurTime()}end;function SWEP:SimulateContextThink()local f=CurTime()for g=1,#self.m_Contexts do if self.m_Contexts[g][3]<=f then if self.m_Contexts[g][1](self)then self.m_Contexts[g]=nil else self.m_Contexts[g][3]=f+self.m_Contexts[g][2]end end end end;function SWEP:Think()if self:GetOwner()==NULL||CLIENT&&self:GetOwner()!=LocalPlayer()then return end;self:SimulateContextThink()if self:GetNextThink()<=CurTime()then self:GetThink()(self)end end;function SWEP:Deploy()if self:GetOwner()==NULL then return false end;return true end;function SWEP:SharedDeploy()self:DefaultDeploy(self:LookupActivity("deploy"))end;function SWEP:HasIdleTimeElapsed()local h=self:GetNextIdle()if h!=-1&&CurTime()>self:GetNextIdle()then return true end;return false end;function SWEP:Idle()if self:HasIdleTimeElapsed()then self:_SendWeaponAnim(self:LookupActivity("idle"))end end;SWEP.m_ActivityTimes={}function SWEP:_SendWeaponAnim(i,j,k)if i==-1 then return end;self:SendWeaponAnim(i)local h=CurTime()+self:SequenceDuration()+(j||0)self.m_ActivityTimes[i]=h;if k||self:GetNextIdle()!=-1 then self:SetNextIdle(h)end end;function SWEP:ItemFrame()self:Idle()end;function SWEP:DefaultDeploy()local l=self:GetOwner()if l==NULL||!l:Alive()then return end;self:SetThinkFunction(self.ItemFrame)self:SetNextIdle(0)self:_SendWeaponAnim(self:LookupActivity("deploy"))timer.Simple(0,function()if!IsValid(self)||!self.SetWeaponvisible then return end;self:SetWeaponVisible(true)end)local m=CurTime()+self:SequenceDuration()self:SetNextPrimaryFire(m)self:SetNextSecondaryFire(m)self:SetNextReload(m)end;function SWEP:CanPrimaryAttack()if self:GetNextPrimaryFire()==-1 then return false end;return true end;function SWEP:CanSecondaryAttack()if self:GetNextSecondaryFire()==-1 then return false end;return true end;function SWEP:PrimaryAttack(n)if!self:CanPrimaryAttack()then return end;self:DoFireEffects(n)self:SetNextPrimaryFire(CurTime()+0.4)self:SetNextSecondaryFire(CurTime()+0.4)if CLIENT then return end;self:AddContextThink(function()local o=self:GetOwner()if o==NULL then return true end;o:LagCompensation(true)local p=o:GetShootPos()local q=o:GetAimVector()local r=util.TraceLine({start=p,endpos=p+q*self.HitDistance,filter=o,mask=MASK_SHOT_HULL})if r.Entity==NULL then r=util.TraceHull({start=p,endpos=p+q*self.HitDistance,filter=o,mins=Vector(-10,-10,-8),maxs=Vector(10,10,8),mask=MASK_SHOT_HULL})end;local s=r.Entity;if s!=NULL then local t=self:GetOwner()self:PlaySound("primary")local u=DamageInfo()u:SetAttacker(o)u:SetInflictor(self)u:SetDamageType(DMG_BULLET)local v=o:GetTalentPassive('EpicStrength')local w=v>0&&v+o:GetTalentLevel('labourer')||0;u:SetDamage(math.random(self.Damage-self.Deviation,self.Damage+self.Deviation)+w)s:TakeDamageInfo(u)end;o:LagCompensation(false)return true end,self.AnimDelay)end;function SWEP:PlaySound(x,y)y=y||0;local o=self:GetOwner()local z=self:LookupSound(x)if z==""then z=x end;local A;self:GetOwner():EmitSound(z)end;function SWEP:LookupSound(B)local C=self.Sounds[B:lower()]if istable(C)then return C[math.random(1,#C)]end;return C||""end;function SWEP:SecondaryAttack()self:PrimaryAttack(true)end;function SWEP:LookupActivity(D)return self.Activities[D:lower()]||ACT_INVALID end;function SWEP:DoFireEffects(n)self:_SendWeaponAnim(self:LookupActivity(n&&"secondary"||"primary"))local o=self:GetOwner()if o!=NULL then o:SetAnimation(o:LookupAnimation("attack"))end end;PLAYER.Animations={["attack"]=PLAYER_ATTACK1,["reload"]=PLAYER_RELOAD}PLAYER.AnimEvents={["primary"]=PLAYERANIMEVENT_ATTACK_PRIMARY,["secondary"]=PLAYERANIMEVENT_ATTACK_SECONDARY}function PLAYER:LookupAnimation(E)return self.Animations[E:lower()]||-1 end;function PLAYER:LookupAnimEvent(F)return self.AnimEvents[F:lower()]||-1 end;function PLAYER:MouseLifted()return!(self:KeyDown(IN_ATTACK)&&self:KeyDown(IN_ATTACK2))end
--addons/!lpakr_out/lua/weapons/weapon_e5.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_grenadebase/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_consular.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_consular.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Consular Lightsaber"SWEP.Class="weapon_lightsaber_consular"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=20;SWEP.MaxForce=250;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.UseForms={["Versatile"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb","Force Pull","Force Push","Force Repulse","Force Heal","Group Heal","Resurrect"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.UseHilt="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=Color(127,255,0)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_dual_sentinel.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_electrostaff.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_gonnj.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category='SUP Custom Weapons'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Shusui"SWEP.Class="weapon_lightsaber_gonnj"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=300;SWEP.SaberBurnDamage=10;SWEP.MaxForce=250;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb","Force Heal","Force Pull","Saber Throw","Force Repulse","Force Push"}SWEP.DamageType=DMG_DISSOLVE;SWEP.DevestatorList={}SWEP.Stances={}SWEP.UseHilt="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_guardian.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Guardian Lightsaber"SWEP.Class="weapon_lightsaber_guardian"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=250;SWEP.SaberBurnDamage=10;SWEP.MaxForce=225;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.UseForms={["Versatile"]={1,2,3},["Aggressive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Repulse","Force Push","Force Pull","Saber Throw"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.UseHilt="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=Color(0,0,205)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_init.lua:
AddCSLuaFile()SWEP.Base="wos_adv_single_lightsaber_base"SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.IgnoreCosmetics=true;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Initiate Lightsaber"SWEP.Class="weapon_lightsaber_init"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=50;SWEP.SaberBurnDamage=10;SWEP.MaxForce=175;SWEP.RegenSpeed=2;SWEP.CanKnockback=true;SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb"}SWEP.UseForms={["Versatile"]={1,2,3}}SWEP.DevestatorList={}SWEP.UseHilt="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=Color(255,255,255)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_knight.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Knight Lightsaber"SWEP.Class="weapon_lightsaber_knight"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=200;SWEP.SaberBurnDamage=10;SWEP.MaxForce=180;SWEP.RegenSpeed=2;SWEP.CanKnockback=true;SWEP.UseForms={["Versatile"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb","Force Heal","Force Repulse"}SWEP.DevestatorList={}SWEP.UseHilt="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.UseLength=false;SWEP.UseWidth=false;SWEP.UseColor=Color(0,191,255)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_master.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_scott.lua:
AddCSLuaFile()SWEP.Author='Robotboy655 + King David'SWEP.Category='Lightsabers'SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=info.Dev;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel='models/weapons/v_crowbar.mdl'SWEP.WorldModel='models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl'SWEP.ViewModelFOV=55;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSiz=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo='none'SWEP.PrintName='Scott Lightsaber'SWEP.Class='weapon_lightsaber_Scott'SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=300;SWEP.SaberBurnDamage=10;SWEP.MaxForce=250;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={'Meditate','Strike','Resurrect','Force Leap','Force Heal','Force Push','Force Pull','Saber Throw'}SWEP.DevestatorList={'Kyber Slam','Lightning Coil','Sonic Discharge'}SWEP.Stances={}SWEP.UseHilt="models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl"SWEP.UseLength=50;SWEP.UseWidth=false;SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base='wos_adv_single_lightsaber_base'
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_trainer.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/weapon_lightsaber_trainer.lua:
AddCSLuaFile()SWEP.Author="Robotboy655 + King David + Scott"SWEP.Category="Lightsabers"SWEP.Contact=""SWEP.RenderGroup=RENDERGROUP_BOTH;SWEP.Slot=2;SWEP.SlotPos=4;SWEP.Spawnable=true;SWEP.DrawAmmo=false;SWEP.DrawCrosshair=false;SWEP.AutoSwitchTo=false;SWEP.AutoSwitchFrom=false;SWEP.DrawWeaponInfoBox=false;SWEP.ViewModel="models/weapons/v_crowbar.mdl"SWEP.WorldModel="models/galactic/weapons/trainingsaber/trainingsaber.mdl"SWEP.ViewModelFOV=55;SWEP.IgnoreCosmetics=true;SWEP.Primary.ClipSize=-1;SWEP.Primary.DefaultClip=-1;SWEP.Primary.Automatic=false;SWEP.Primary.Ammo="none"SWEP.Secondary.ClipSize=-1;SWEP.Secondary.DefaultClip=-1;SWEP.Secondary.Automatic=true;SWEP.Secondary.Ammo="none"SWEP.PrintName="Training Saber"SWEP.Class="weapon_lightsaber_trainer"SWEP.DualWielded=false;SWEP.CanMoveWhileAttacking=true;SWEP.SaberDamage=50;SWEP.SaberBurnDamage=20;SWEP.MaxForce=175;SWEP.RegenSpeed=1.5;SWEP.CanKnockback=true;SWEP.UseForms={["Agile"]={1,2,3},["Versatile"]={1,2,3},["Aggressive"]={1,2,3},["Defensive"]={1,2,3}}SWEP.ForcePowerList={"Meditate","Force Leap","Force Absorb"}SWEP.DevestatorList={}SWEP.Stances={}SWEP.NoGlow=false;SWEP.NoTrail=true;SWEP.UseHilt="models/galactic/weapons/trainingsaber/trainingsaber.mdl"SWEP.UseLength=33;SWEP.UseWidth=false;SWEP.UseColor=Color(255,153,51)SWEP.UseDarkInner=false;SWEP.UseLoopSound=false;SWEP.UseSwingSound=false;SWEP.UseOnSound=false;SWEP.UseOffSound=false;SWEP.UseSecHilt=false;SWEP.UseSecLength=false;SWEP.UseSecWidth=false;SWEP.UseSecColor=false;SWEP.UseSecDarkInner=false;SWEP.Base="wos_adv_single_lightsaber_base"SWEP.HolsterBone='ValveBiped.Bip01_Spine'function SWEP:HolsterTranslate(a,b,c)b=b+c:Right()*3+c:Up()*4+c:Forward()*8;return b,c end
--addons/!lpakr_out/gamemodes/srp_base/entities/weapons/weapon_repairtool/cl_init.lua:
include'shared.lua'function SWEP:Initialize()self:SetHoldType'pistol'end;function SWEP:PrimaryAttack()return true end;function SWEP:SecondaryAttack()return true end;function SWEP:DrawHUD()end;function SWEP:Deploy()self.Holstered=nil end;function SWEP:Holster()if self:GetOwner()==LocalPlayer()then self:OnRemove()end end;function SWEP:OnRemove()self.Holstered=true;self:CloseRepairInfo()end;function SWEP:OpenRepairInfo(a)if IsValid(self.UIRepairInfo)then self.UIRepairInfo:Populate(name,count,icon)return end;self.RepairTarget=a;srp.ui.Create('srp_repair_info',function(b)b:Populate(a)self.UIRepairInfo=b end)end;function SWEP:CloseRepairInfo()if IsValid(self.UIRepairInfo)then self.UIRepairInfo:Close()self.UIRepairInfo=nil end;self.RepairTarget=nil end;function SWEP:Think()if self.Holstered then return end;local c=self:GetOwner()if!IsValid(c)then return end;local d=util.TraceLine({start=c:GetShootPos(),endpos=c:GetShootPos()+c:GetAimVector()*200,filter=c})if!IsValid(d.Entity)then self:CloseRepairInfo()return end;if d.Entity==self.RepairTarget then return end;if!d.Entity.GetRepairInfo then return end;self:OpenRepairInfo(d.Entity)end;local e={}local f=col.midnight_dark:Copy()f.a=255;function e:Init()self:SetSize(200,50)self:SetBackgroundColor(f)self:DockPadding(5,5,5,5)self:SetAlpha(0)self:AlphaTo(255,0.5,0)self.Percent=1;self.Color=LocalPlayer():GetChatColor()self.Color.a=225;self:AddPanel('DImage',function(g)g:Dock(LEFT)g:SetSize(50-10)self.Icon=g end)self:AddPanel('srp_panel',function(b)b:DockPadding(0,0,0,0)b:SetBackgroundColor(col.transparent)b:Dock(FILL)b:AddPanel('srp_label',function(h)h:SetText'NAME'h:Dock(FILL)h:DockMargin(0,0,0,0)h:SetContentAlignment(4)h:SetFont'ui_header.s'h:SetTall(15)self.Name=h end)b:AddPanel('srp_label',function(h)h:SetText'+0'h:Dock(LEFT)h:DockMargin(0,0,0,0)h:SetContentAlignment(5)h:SetFont'ui_header.s'h:SetWide(40)self.Count=h end)end)end;function e:Populate(a)self.Target=a;self:Update(a)end;function e:Update(a)if!IsValid(a)then return end;local name,count,i,icon=a:GetRepairInfo(self)if!name then return end;self.Name:SetText(name)self.Percent=i||1;if i>=1 then self.Count:SetText('')else self.Count:SetText('+'..count||0)end;if icon then self.Icon:SetMaterial(icon)end end;function e:PerformLayout(j,k)self:SetPos((ScrW()-j)/2,ScrH()-k-150)end;function e:Close()self:AlphaTo(0,.25,0,function()if IsValid(self)then self:Remove()end end)end;function e:Think()if IsValid(self.Target)then self:Update(self.Target)else self:Close()self.Think=function()end end end;local l=col.green:Copy()l.a=100;function e:Paint(j,k)draw.RoundedBox(6,0,0,j,k,f)draw.RoundedBox(6,2,2,(j-4)*self.Percent,k-4,l)end;vgui.Register('srp_repair_info',e,'srp_panel_rounded')
--addons/!lpakr_out/lua/weapons/weapon_snowball.lua:
DEFINE_BASECLASS("basecombatweapon2")SWEP.PrintName="Snowball"SWEP.ViewModel="models/weapons/v_snowball.mdl"SWEP.WorldModel="models/weapons/w_snowball.mdl"SWEP.Base="basecombatweapon2"SWEP.ViewModelFlip=true;SWEP.Spawnable=true;SWEP.Slot=2;SWEP.Instructions="Left click to throw\nRight click to cheer"SWEP.Activities={["primary"]=ACT_VM_PULLPIN,["reload"]=ACT_VM_THROW}local a=5;SWEP.m_flOldTime=0;function SWEP:Initialize()self.Sounds={["secondary"]={"odessa.nlo_cheer01","odessa.nlo_cheer02","odessa.nlo_cheer03"}}self:SetHoldType("grenade")BaseClass.Initialize(self)end;function SWEP:ItemFrame()local b=self:GetOwner()if!b then return end;if self.m_bDrawBackFinished then if!b:KeyDown(IN_ATTACK)then self:_SendWeaponAnim(self:LookupActivity("reload"))local c=CurTime()self:AddContextThink("Snowball - Throw",function()b:SetAnimation(b:LookupAnimation("attack"))self.m_bRedraw=true;return true end,0.2)self.m_bDrawBackFinished=false end elseif self.m_bRedraw then if self:IsViewModelSequenceFinished()then self:_SendWeaponAnim(self:LookupActivity("deploy"))local d=CurTime()+self:SequenceDuration()self:SetNextPrimaryFire(d)self:SetNextIdle(d)self.m_bRedraw=false end end;self:Idle()end;function SWEP:Deploy()self.m_bRedraw=false;self.m_bDrawBackFinished=false;self:DefaultDeploy(self)self:SetNextSecondaryFire(self.m_flOldTime)return self:CanDeploy()end;function SWEP:Holster()self.m_flOldTime=self:GetNextSecondaryFire()return BaseClass.Holster(self)end;function SWEP:Precache()BaseClass.Precache(self)util.PrecacheSound(self:LookupSound("secondary"))end;function SWEP:PrimaryAttack()if self.m_bRedraw then return end;local b=self:GetOwner()if!IsValid(b)then return end;self:_SendWeaponAnim(self:LookupActivity("primary"))self:SetNextIdle(-1)self:SetNextPrimaryFire(1000000000000)self:AddContextThink("Snowball - Redraw",function()self.m_bDrawBackFinished=true;return true end,self:SequenceDuration())end;function SWEP:SecondaryAttack()self:EmitSound(self:LookupSound("secondary"))self:SetNextSecondaryFire(CurTime()+a)end
--addons/!lpakr_out/lua/weapons/wos_adv_dual_lightsaber_base/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/weapons/wos_adv_single_lightsaber_base/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/base_srp/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_entity.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot/ai.lua:
local a=2500^2;function ENT:IsAIDisabled()return self:GetNW2Bool("DrGBaseAIDisabled")end;function ENT:GetEnemy()return self:GetNW2Entity("DrGBaseEnemy")end;function ENT:HasEnemy()return IsValid(self:GetEnemy())end;function ENT:HaveEnemy()return self:HasEnemy()end;function ENT:HadEnemy()return self._DrGBaseHadEnemy end;function ENT:GetNemesis()if self:HasNemesis()then return self:GetEnemy()else return NULL end end;function ENT:HasNemesis()return self:GetNW2Bool("DrGBaseNemesis")&&self:HasEnemy()end;function ENT:HaveNemesis()return self:HasNemesis()end;function ENT:HadNemesis()return self:GetNW2Bool("DrGBaseNemesis")&&self:HadEnemy()end;function ENT:OnNewEnemy()end;function ENT:OnEnemyChange()end;function ENT:OnLastEnemy()end;function ENT:_InitAI()self:SetNW2VarProxy("DrGBaseEnemy",function(self,b,c,d)if!self._DrGBaseHadEnemy&&IsValid(d)then self._DrGBaseHadEnemy=true;self:OnNewEnemy(d)elseif self._DrGBaseHadEnemy&&!IsValid(d)then self._DrGBaseHadEnemy=false;self:OnLastEnemy(c)else self:OnEnemyChange(c,d)end end)end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/awareness.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot/awareness.lua:
function ENT:IsOmniscient()return false end;function ENT:GetSpotDuration()return self:GetNW2Float("DrGBaseSpotDuration")end;function ENT:OnSpotted()end;function ENT:OnLost()end;function ENT:_InitAwareness()if CLIENT then return end;self._DrGBaseSpotted={}self:SetOmniscient(self.Omniscient)self._DrGBaseLastTimeSpotted={}self._DrGBaseLastKnownPos={}self:SetSpotDuration(self.SpotDuration)end;if SERVER then else local function a(self,b)local c=LocalPlayer()if b then if isfunction(self.OnSpotted)then self._DrGBaseLastTimeSpotted=CurTime()self._DrGBaseLastKnownPosition=c:GetPos()self:OnSpotted(c)else timer.Simple(engine.TickInterval(),function()if IsValid(self)&&IsValid(c)then a(self,b)end end)end elseif isfunction(self.OnLost)then self:OnLost(c)else timer.Simple(engine.TickInterval(),function()if IsValid(self)&&IsValid(c)then a(self,b)end end)end end;net.Receive("DrGBaseNextbotPlayerAwareness",function()local d=net.ReadEntity()local e=net.ReadBit()if IsValid(d)then d._DrGBaseLocalPlayerAwareness=e;a(d,e==1)end end)function ENT:HasSpottedLocalPlayer()if self:IsOmniscient()then return true end;return self._DrGBaseLocalPlayerAwareness==1 end;function ENT:HasLostLocalPlayer()if self:IsOmniscient()then return false end;return self._DrGBaseLocalPlayerAwareness==0 end;function ENT:LastTimeSpotted()return self._DrGBaseLastTimeSpotted||-1 end;function ENT:LastKnownPosition()return self._DrGBaseLastKnownPosition end end
--addons/!lpakr_out/lua/entities/drgbase_nextbot/detection.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot/possession.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/drgbase_nextbot_human/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/dronesrewrite_base/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/dronesrewrite_base/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/dronesrewrite_gm/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/dronesrewrite_gm/shared.lua:
ENT.Base='dronesrewrite_base'ENT.Type='anim'ENT.PrintName='GM Drone'ENT.Spawnable=false;ENT.AdminSpawnable=false;ENT.Category='Drones Rewrite'ENT.UNIT='CAM'ENT.Model='models/player/valley/lgn/probe_droid/probe_droid.mdl'ENT.FirstPersonCam_pos=Vector(4.5,0,-3.6)ENT.ThirdPersonCam_distance=30;ENT.DoExplosionEffect='splode_drone_sparks'ENT.AngOffset=4;ENT.Alignment=0.5;ENT.HealthAmount=300;ENT.DefaultHealth=300;ENT.Speed=1000;ENT.SprintCoefficient=1.7;ENT.RotateSpeed=4;ENT.Fuel=40;ENT.MaxFuel=40;ENT.HUD_hudName='Camera'ENT.OverlayName='No Overlay'ENT.UseNightVision=false;ENT.UseFlashlight=false;ENT.KeysFuncs=DRONES_REWRITE.DefaultKeys()ENT.AllowYawRestrictions=false;ENT.YawMin=-55;ENT.YawMax=55;ENT.PitchMin=-15;ENT.RenderCam=false;ENT.Slots={['Camera']=1}ENT.Sounds={PropellerSound={Name='drones/ardr.wav',Pitch=5,Level=45,PitchCoef=0.01,Volume=0.02},ExplosionSound={Name='ambient/energy/spark3.wav',Level=100,Pitch=150}}ENT.NoPropellers=true;ENT.Propellers={Damage=1,Health=10,HitRange=7,HitPitch=255,HitLevel=60,RandomHitSounds={'physics/metal/metal_box_impact_bullet2.wav','physics/metal/metal_box_impact_bullet2.wav','physics/metal/metal_box_impact_bullet2.wav'},RandomLoseSounds={'physics/glass/glass_cup_break1.wav','physics/glass/glass_cup_break2.wav'},LosePitch=255,LoseLevel=65,Info={Vector(6.4,9.15,1.5),Vector(-6.4,-9.15,1.5),Vector(-6.4,9.15,1.5),Vector(6.4,-9.15,1.5)}}ENT.Weapons={['Camera']={Name='Camera'}}ENT.Modules={}
--addons/!lpakr_out/lua/entities/ent_lightsaber_thrown.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/ent_textscreen/cl_init.lua:
local a={}local function b(c)if!c then return'ui_header.r'end;if!a[c]then local d={font=c,size=100,weight=1500,shadow=true,antialias=true,symbol=c=='Webdings'}surface.CreateFont('textscreen.'..c,d)a[c]=true end;return'textscreen.'..c end;include('shared.lua')function ENT:Initialize()self.HasInitialized=true;self:SetMaterial('models/effects/vol_light001')self:SetRenderMode(RENDERMODE_TRANSALPHA)self:SetColor(Color(255,255,255,0))local e=self:GetLocationID()if e!=1 then self.DisplayLocation=e end end;function ENT:Think()self:Initialize()self.Think=function()end end;function ENT:GetTextureID()return'textscreen.'..self:GetText()..self:GetFont()..self:GetR()..self:GetG()..self:GetB()end;function ENT:RenderTexture()self.Rendering=true;local f=b(srp.TextScreenFonts[self:GetFont()||1])local g={}local h=string.Explode('\\n',self:GetText())for i=1,#h do local j=string.Wrap(h[i],f||'',2000)for k=1,#j do table.insert(g,j[k])end end;self.TextureHeight=#g*100;local l=Color(self:GetR(),self:GetG(),self:GetB())texture.Create(self:GetTextureID()):SetSize(2000,self.TextureHeight):SetFormat('png'):Render(function(m,n,o)local p,q=0,0;for r,s in ipairs(g)do local n,o=draw.SimpleTextOutlined(s,f,1000,q,l,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP,1,col.black)q=q+o end;if IsValid(self)then self.Rendering=false end end,function()if IsValid(self)then self.Rendering=false end end)end;function ENT:Draw()if!cvar.GetValue('srp_textscreens')||self.DisplayLocation&&self.DisplayLocation!=LocalPlayer():GetLocationID()then return end;local t=self:GetPos()if t:Distance(LocalPlayer():GetPos())>750||self.Rendering then return end;local u=texture.Get(self:GetTextureID())if!u then self:RenderTexture()return end;if!self.TextureHeight then local f=b(srp.TextScreenFonts[self:GetFont()||1])local g={}local h=string.Explode('\\n',self:GetText())for i=1,#h do local j=string.Wrap(h[i],f,2000)for k=1,#j do table.insert(g,j[k])end end;self.TextureHeight=#g*100 end;local v=self:GetAngles()t=t+v:Up()local p,q=-1000,-(self.TextureHeight*0.5)local n,o=2000,self.TextureHeight;local w=self:GetSize()/750;surface.SetDrawColor(255,255,255)surface.SetMaterial(u)cam.Start3D2D(t,v,w)surface.DrawTexturedRect(p,q,n,o)cam.End3D2D()v:RotateAroundAxis(v:Right(),180)cam.Start3D2D(t,v,w)surface.DrawTexturedRect(p,q,n,o)cam.End3D2D()end;local x,y=Vector(-2,-2,-2),Vector(2,2,2)local z={['gmod_tool']=true,['weapon_physgun']=true}function ENT:DrawTranslucent()self:Draw()local A=LocalPlayer():GetActiveWeapon()if IsValid(A)&&z[A:GetClass()]then render.DrawWireframeBox(self:GetPos(),self:GetAngles(),x,y,col.white,true)end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/gmod_lamp.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_gmodentity")ENT.Spawnable=false;ENT.RenderGroup=RENDERGROUP_BOTH;local a=Material("sprites/light_ignorez")local b=Material("effects/lamp_beam")AccessorFunc(ENT,"Texture","FlashlightTexture")function ENT:SetupDataTables()self:NetworkVar("Bool",0,"On")self:NetworkVar("Bool",1,"Toggle")self:NetworkVar("Float",0,"LightFOV")self:NetworkVar("Float",1,"Distance")self:NetworkVar("Float",2,"Brightness")end;function ENT:GetEntityDriveMode()return"drive_noclip"end;function ENT:Initialize()if CLIENT then self.PixVis=util.GetPixelVisibleHandle()end end;function ENT:OnTakeDamage(c)self:TakePhysicsDamage(c)end;function ENT:Use(d,e)end;function ENT:Switch(f)if f==self:GetOn()then return end;self.on=f;if!f then SafeRemoveEntity(self.flashlight)self.flashlight=nil;self:SetOn(false)return end;self:SetOn(true)local g=self:GetAngles()self.flashlight=ents.Create("env_projectedtexture")self.flashlight:SetParent(self.Entity)self.flashlight:SetLocalPos(Vector(0,0,0))self.flashlight:SetLocalAngles(Angle(0,0,0))self.flashlight:SetKeyValue("enableshadows",1)self.flashlight:SetKeyValue("farz",self:GetDistance())self.flashlight:SetKeyValue("nearz",12)self.flashlight:SetKeyValue("lightfov",self:GetLightFOV())local h=self:GetColor()local i=self:GetBrightness()self.flashlight:SetKeyValue("lightcolor",Format("%i %i %i 255",h.r*i,h.g*i,h.b*i))self.flashlight:Spawn()self.flashlight:Input("SpotlightTexture",NULL,NULL,self:GetFlashlightTexture())end;function ENT:Toggle()self:Switch(!self:GetOn())end;function ENT:UpdateLight()if!IsValid(self.flashlight)then return end;self.flashlight:Input("SpotlightTexture",NULL,NULL,self:GetFlashlightTexture())self.flashlight:Input("FOV",NULL,NULL,tostring(self:GetLightFOV()))self.flashlight:SetKeyValue("farz",self:GetDistance())local h=self:GetColor()local i=self:GetBrightness()self.flashlight:SetKeyValue("lightcolor",Format("%i %i %i 255",h.r*i,h.g*i,h.b*i))end;function ENT:Draw()BaseClass.Draw(self)end;function ENT:DrawTranslucent()BaseClass.DrawTranslucent(self)if!self:GetOn()then return end;local j=self:GetAngles():Forward()local k=self:GetPos()-EyePos()local l=k:Length()k:Normalize()local m=k:Dot(j*-1)local n=self:GetPos()+j*5;if m>=0 then render.SetMaterial(a)local o=util.PixelVisible(n,16,self.PixVis)if!o then return end;local p=math.Clamp(l*o*m*2,64,512)l=math.Clamp(l,32,800)local q=math.Clamp((1000-l)*o*m,0,100)local r=self:GetColor()r.a=q;render.DrawSprite(n,p,p,r,o*m)render.DrawSprite(n,p*0.4,p*0.4,Color(255,255,255,q),o*m)end end;function ENT:GetOverlayText()return self:GetPlayerName()end
--addons/!lpakr_out/lua/entities/gmod_wire_consolescreen/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_detonator.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Detonator"ENT.WireDebugName="Detonator"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=Wire_CreateInputs(self,{"Trigger"})self.Trigger=0;self.damage=0 end;function ENT:TriggerInput(a,b)if a=="Trigger"then self:ShowOutput(b)end end;function ENT:Setup(c)self.damage=c;self:ShowOutput(0)end;function ENT:ShowOutput(d)if d!=self.Trigger then self:SetOverlayText(self.damage.." = "..d)self.Trigger=d;if d>0 then self:DoDamage()end end end;function ENT:DoDamage()if self.target&&self.target:IsValid()then self.target:TakeDamage(self.damage,self:GetPlayer(),self)end;local e=EffectData()e:SetOrigin(self:GetPos())util.Effect("Explosion",e,true,true)self:Remove()end;function ENT:BuildDupeInfo()local f=BaseClass.BuildDupeInfo(self)||{}if self.target&&self.target:IsValid()then f.target=self.target:EntIndex()end;return f end;function ENT:ApplyDupeInfo(g,h,f,i)BaseClass.ApplyDupeInfo(self,g,h,f,i)self.target=i(f.target)end;duplicator.RegisterEntityClass("gmod_wire_detonator",WireLib.MakeWireEnt,"Data","damage")
--addons/!lpakr_out/lua/entities/gmod_wire_dhdd.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_digitalscreen/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_dynamic_button.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Dynamic Button"ENT.WireDebugName="Dynamic Button"function ENT:SetupDataTables()self:NetworkVar("Bool",0,"On")end;if CLIENT then local a,b;function ENT:Draw()self:DoNormalDraw(true,false)if LocalPlayer():GetEyeTrace().Entity==self&&EyePos():Distance(self:GetPos())<512 then if self:GetOn()then a=self;b=4+math.sin(CurTime()*20)*2 else self:DrawEntityOutline()end end;Wire_Render(self)end;local c=Color(255,100,255)hook.Add("PreDrawHalos","Wiremod_dynbutton_overlay_halos",function()if a then outline.Add(a,c,outline.MODE_BOTH)a=nil end end)return end;ENT.OutputEntID=false;ENT.EntToOutput=NULL;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self:SetUseType(SIMPLE_USE)self.Outputs=Wire_CreateOutputs(self,{"Out"})self.Inputs=Wire_CreateInputs(self,{"Set"})end;function ENT:TriggerInput(d,e)if d=="Set"then if self.toggle then self:Switch(e!=0)self.PrevUser=nil;self.podpress=nil end end end;function ENT:Use(f,g)if!f:IsPlayer()then return end;if self.PrevUser&&self.PrevUser:IsValid()then return end;if self.OutputEntID then self.EntToOutput=f end;if self:GetOn()then if self.toggle then self:Switch(false)end;return end;if IsValid(g)&&g:GetClass()=="gmod_wire_pod"then self.podpress=true end;self:Switch(true)self.PrevUser=f end;function ENT:Think()BaseClass.Think(self)if self:GetOn()then if!self.PrevUser||!self.PrevUser:IsValid()||!self.podpress&&!self.PrevUser:KeyDown(IN_USE)||self.podpress&&!self.PrevUser:KeyDown(IN_ATTACK)then if!self.toggle then self:Switch(false)end;self.PrevUser=nil;self.podpress=nil end;self:NextThink(CurTime()+0.05)return true end end;function ENT:Setup(h,i,j,k,l,m,n,o,p,q,r,s,t)self.toggle=h;self.value_off=j;self.value_on=i;self.Value=j;self.entityout=l;self.material_on=m;self.material_off=n;self:SetOn(false)self.on_r=o;self.on_g=p;self.on_b=q;self.off_r=r;self.off_g=s;self.off_b=t;self:ShowOutput(self.value_off)Wire_TriggerOutput(self,"Out",self.value_off)self:SetMaterial(self.material_off)self:SetColor(Color(self.off_r,self.off_g,self.off_b,255))if l then WireLib.AdjustOutputs(self,{"Out (The button's main output) [NORMAL]","EntID (The entity ID of the player who pressed the button) [NORMAL]","Entity (The player who pressed the button) [ENTITY]"})Wire_TriggerOutput(self,"EntID",0)Wire_TriggerOutput(self,"Entity",nil)self.OutputEntID=true else Wire_AdjustOutputs(self,{"Out"})self.OutputEntID=false end;if h then Wire_AdjustInputs(self,{"Set"})else Wire_AdjustInputs(self,{})end end;function ENT:Switch(u)if!self:IsValid()then return end;self:SetOn(u)if u then self:ShowOutput(self.value_on)self.Value=self.value_on;if self.material_on!=""then self:SetMaterial(self.material_on)end;self:SetColor(Color(self.on_r,self.on_g,self.on_b,255))else self:ShowOutput(self.value_off)self.Value=self.value_off;if self.material_off!=""then self:SetMaterial(self.material_off)end;self:SetColor(Color(self.off_r,self.off_g,self.off_b,255))if self.OutputEntID then self.EntToOutput=NULL end end;Wire_TriggerOutput(self,"Out",self.Value)if self.OutputEntID then Wire_TriggerOutput(self,"EntID",self.EntToOutput:EntIndex())Wire_TriggerOutput(self,"Entity",self.EntToOutput)end;return true end;function ENT:ShowOutput(e)self:SetOverlayText("("..self.value_off.." - "..self.value_on..") = "..e)end;duplicator.RegisterEntityClass("gmod_wire_dynamic_button",WireLib.MakeWireEnt,"Data","toggle","value_on","value_off","description","entityout","material_on","material_off","on_r","on_g","on_b","off_r","off_g","off_b")
--addons/!lpakr_out/lua/entities/gmod_wire_emarker.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Entity Marker"ENT.WireDebugName="EMarker"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Outputs=WireLib.CreateSpecialOutputs(self,{"Entity"},{"ENTITY"})self:SetOverlayText("No Mark selected")end;function ENT:LinkEMarker(a)if a then self.mark=a end;if!IsValid(self.mark)then self:SetOverlayText("No Mark selected")return end;self.mark:CallOnRemove("EMarker.UnLink",function(b)if IsValid(self)&&self.mark==b then self:UnLinkEMarker()end end)Wire_TriggerOutput(self,"Entity",self.mark)self:SetOverlayText("Linked - "..self.mark:GetModel())end;function ENT:UnLinkEMarker()self.mark=NULL;Wire_TriggerOutput(self,"Entity",NULL)self:SetOverlayText("No Mark selected")end;duplicator.RegisterEntityClass("gmod_wire_emarker",WireLib.MakeWireEnt,"Data")function ENT:BuildDupeInfo()local c=BaseClass.BuildDupeInfo(self)||{}if self.mark&&self.mark:IsValid()then c.mark=self.mark:EntIndex()end;return c end;function ENT:ApplyDupeInfo(d,b,c,e)BaseClass.ApplyDupeInfo(self,d,b,c,e)self:LinkEMarker(e(c.mark))end
--addons/!lpakr_out/lua/entities/gmod_wire_exit_point.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/gmod_wire_fx_emitter.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire FX Emitter"ENT.WireDebugName="FX Emitter"function ENT:SetupDataTables()self:NetworkVar("Bool",0,"On")self:NetworkVar("Int",0,"Effect")self:NetworkVar("Float",0,"Delay")self:NetworkVar("Vector",0,"FXDir")end;function ENT:GetFXPos()return self:GetPos()end;ENT.Effects={}ENT.fxcount=0;local a=ENT;ComboBox_Wire_FX_Emitter_Options={}function AddFXEmitterEffect(b,c,d)a.fxcount=a.fxcount+1;ComboBox_Wire_FX_Emitter_Options[b]=a.fxcount;if CLIENT then a.Effects[a.fxcount]=c;language.Add("wire_fx_emitter_"..b,d)end end;include("wire/fx_emitter_default.lua")if CLIENT then ENT.Delay=0.05;function ENT:Draw()local e=LocalPlayer()local f=e:GetActiveWeapon()if f:IsValid()then local g=f:GetClass()if g=="gmod_camera"then return end end;BaseClass.Draw(self)end;function ENT:Think()if!self:GetOn()then return end;if self.Delay>CurTime()then return end;self.Delay=CurTime()+self:GetDelay()local h=self:GetEffect()if!self.Effects[h]then if self.Effects[1]then h=1 else return end end;local i=self:GetAngles()local j=self:GetFXDir()if j&&!j:IsZero()then i=j:Angle()else self:GetUp():Angle()end;local k=self:GetFXPos()if!k||j:IsZero()then k=self:GetPos()+i:Forward()*12 end;local l,m=pcall(self.Effects[h],k,i)if!l then Print(self.Effects)Print(k)Print(i)Msg("Error in Emitter "..tostring(h).."\n -> "..tostring(m).."\n")self.Effects[h]=nil end end;return end;function ENT:Initialize()self:SetModel("models/props_lab/tpplug.mdl")self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self:DrawShadow(false)self:SetCollisionGroup(COLLISION_GROUP_WEAPON)local n=self:GetPhysicsObject()if n:IsValid()then n:Wake()end;self.Inputs=WireLib.CreateInputs(self,{"On","Effect","Delay","Direction [VECTOR]"})end;function ENT:Setup(o,p)if o then self:SetDelay(o)end;if p then self:SetEffect(p)end end;function ENT:TriggerInput(q,r,s)if q=="Direction"then self:SetFXDir(r:GetNormal())elseif q=="Effect"then self:SetEffect(math.Clamp(r-r%1,1,self.fxcount))elseif q=="On"then self:SetOn(r!=0)elseif q=="Delay"then self:SetDelay(math.Clamp(r,0.05,20))end end;function ENT:ApplyDupeInfo(e,t,u,v)BaseClass.ApplyDupeInfo(self,e,t,u,v)if u.Effect then self:SetEffect(u.Effect)end;if u.Delay then self:SetDelay(u.Delay)end end;duplicator.RegisterEntityClass("gmod_wire_fx_emitter",WireLib.MakeWireEnt,"Data","delay","effect")
--addons/!lpakr_out/lua/entities/gmod_wire_holoemitter.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Holographic Emitter"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WireDebugName="Holographic Emitter"if CLIENT then local a=CreateClientConVar("cl_wire_holoemitter_maxfadetime",5,true,false)local b=CreateClientConVar("wire_holoemitter_keeplatestdot","0",true,false)local c=Material("tripmine_laser")local d=Material("sprites/gmdm_pickups/light")function ENT:Initialize()self.Points={}self.RBound=Vector(1024,1024,1024)end;function ENT:AddPoint(e,f,Color,g,h,i,j)if f!=nil&&Color!=nil&&g!=nil&&h!=nil&&i!=nil&&j!=nil then local k={}k.Pos=e;k.Local=f;k.Color=Color;k.LineBeam=h;k.GroundBeam=i;k.Size=j;if g!=0 then k.DieTime=CurTime()+g end;k.SpawnTime=CurTime()self.Points[#self.Points+1]=k end end;net.Receive("WireHoloEmitterData",function(l)local m=net.ReadEntity()if!IsValid(m)then return end;local n=net.ReadFloat()local o=net.ReadUInt(16)for p=1,o do local q=net.ReadVector()local r=net.ReadBit()!=0;local s=Color(net.ReadUInt(8),net.ReadUInt(8),net.ReadUInt(8))local t=net.ReadUInt(16)/100;local u=net.ReadBit()!=0;local v=net.ReadBit()!=0;local w=net.ReadUInt(16)/100;timer.Simple(p/o*n,function()if IsValid(m)then m:AddPoint(q,r,s,t,u,v,w)end end)end end)function ENT:Think()self:NextThink(CurTime())if self:GetNWBool("Clear",false)==true then self.Points={}return true end;if!next(self.Points)then return true end;local x=LocalPlayer():GetPos()self:SetRenderBoundsWS(x-self.RBound,x+self.RBound)local y=a:GetFloat()for z=#self.Points,1,-1 do local A=self.Points[z]if z==#self.Points&&b:GetBool()then continue end;if A.DieTime then A.Color.a=255-(CurTime()-A.SpawnTime)/(A.DieTime-A.SpawnTime)*255;if A.DieTime<CurTime()then table.remove(self.Points,z)if self.Points[z-1]then self.Points[z-1].LineBeam=false end end end;if y!=0&&A.SpawnTime+y<CurTime()then table.remove(self.Points,z)if self.Points[z-1]then self.Points[z-1].LineBeam=false end end end;return true end;function ENT:Draw()BaseClass.Draw(self)local m=self:GetNWEntity("Link",false)if!IsValid(m)then m=self end;local B=false;if m:GetClass()=="gmod_wire_hologrid"then local C=m:GetNWEntity("reference",false)if IsValid(C)then m=C;B=true end end;local D=m:GetPos()local E=#self.Points;if E==0||self:GetNWBool("Active",true)==false then return end;for z=1,E do local A=self.Points[z]local e=A.Pos;if A.Local||B then e=m:LocalToWorld(e)end;if A.GroundBeam then render.SetMaterial(c)render.DrawBeam(D,e,A.Size,0,1,A.Color)end;if A.LineBeam&&z<E then render.SetMaterial(c)local F=self.Points[z+1]local G=F.Pos;if F.Local||B then G=m:LocalToWorld(G)end;render.DrawBeam(G,e,A.Size*2,0,1,A.Color)end;render.SetMaterial(d)render.DrawSprite(e,A.Size,A.Size,A.Color)end end;return end;local a=CreateConVar("wire_holoemitter_interval",0.3,{FCVAR_ARCHIVE,FCVAR_NOTIFY})function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self:DrawShadow(false)self:AddEFlags(EFL_FORCE_CHECK_TRANSMIT)self:SetNWBool("Clear",false)self:SetNWBool("Active",true)self.bools={}self.bools.Local=true;self.bools.LineBeam=true;self.bools.GroundBeam=true;self.Inputs=WireLib.CreateInputs(self,{"Pos (The position of the point. Changing this value causes a new point to be added.) [VECTOR]","X (The X position of the point. Changing this value causes a new point to be added.\nIt's recommended to use the vector input, since that allows you to change all three coordinate values at once without creating a new point.)","Y (The Y position of the point. Changing this value causes a new point to be added.\nIt's recommended to use the vector input, since that allows you to change all three coordinate values at once without creating a new point.)","Z (The Z position of the point. Changing this value causes a new point to be added.\nIt's recommended to use the vector input, since that allows you to change all three coordinate values at once without creating a new point.)","Local (If 1, position will be relative to the emitter.)","Color [VECTOR]","FadeTime (The time it takes for the point to fade away, in seconds.)","LineBeam (If 1, draws a beam between the last point and the next.)","GroundBeam (If 1, draws a beam between the emitter and the next point.)","Size (The size of the point.)","Clear (Removes all points.)","Active"})self.Outputs=WireLib.CreateOutputs(self,{"Memory (Allows zGPU/zCPU to communicate with this device. Serves no other purpose.)"})self.Points={}self.Data={}self.Data.Pos=Vector(0,0,0)self.Data.Local=false;self.Data.Color=Vector(255,255,255)self.Data.FadeTime=1;self.Data.LineBeam=false;self.Data.GroundBeam=false;self.Data.Size=1;self:SetOverlayText("Holo Emitter")end;function ENT:AddPoint()self.Points[#self.Points+1]={Pos=Vector(self.Data.Pos.x,self.Data.Pos.y,self.Data.Pos.z),Local=self.Data.Local,Color=Vector(self.Data.Color.x,self.Data.Color.y,self.Data.Color.z),FadeTime=self.Data.FadeTime,LineBeam=self.Data.LineBeam,GroundBeam=self.Data.GroundBeam,Size=self.Data.Size}end;function ENT:TriggerInput(H,I)if H=="X"then if self.Data.Pos.x!=I then self.Data.Pos.x=I;self:AddPoint()end elseif H=="Y"then if self.Data.Pos.y!=I then self.Data.Pos.y=I;self:AddPoint()end elseif H=="Z"then if self.Data.Pos.z!=I then self.Data.Pos.z=I;self:AddPoint()end elseif H=="Pos"then if self.Data.Pos!=I then self.Data.Pos=I;self:AddPoint()end else if H=="Clear"||H=="Active"then self:SetNWBool(H,I!=0)else if self.bools[H]then I=I!=0 end;self.Data[H]=I end end end;function ENT:ReadCell(J)J=math.floor(J)if J==0 then return 1 elseif J==1 then return self.Data.Pos.x elseif J==2 then return self.Data.Pos.y elseif J==3 then return self.Data.Pos.z elseif J==4 then return self.Data.Local&&1||0 elseif J==5 then return self.Data.Color.x elseif J==6 then return self.Data.Color.y elseif J==7 then return self.Data.Color.z elseif J==8 then return self.Data.FadeTime elseif J==9 then return self.Data.LineBeam&&1||0 elseif J==10 then return self.Data.GroundBeam&&1||0 elseif J==11 then return self.Data.Size elseif J==12 then return self:GetNWBool("Clear",false)&&1||0 elseif J==13 then return self:GetNWBool("Active",true)&&1||0 end end;function ENT:WriteCell(J,I)J=math.floor(J)if J==0 then self:AddPoint()return true elseif J==1 then self.Data.Pos.x=I;return true elseif J==2 then self.Data.Pos.y=I;return true elseif J==3 then self.Data.Pos.z=I;return true elseif J==4 then self.Data.Local=I!=0;return true elseif J==5 then self.Data.Color.x=I;return true elseif J==6 then self.Data.Color.y=I;return true elseif J==7 then self.Data.Color.z=I;return true elseif J==8 then self.Data.FadeTime=I;return true elseif J==9 then self.Data.LineBeam=I!=0;return true elseif J==10 then self.Data.GroundBeam=I!=0;return true elseif J==11 then self.Data.Size=I;return true elseif J==12 then self:SetNWBool("Clear",I!=0)return true elseif J==13 then self:SetNWBool("Active",I!=0)return true end;return false end;function ENT:Link(m)if IsValid(m)&&m:GetClass()=="gmod_wire_hologrid"then WireLib.AdjustInputs(self,{"Pos [VECTOR]","X","Y","Z","Color [VECTOR]","FadeTime","LineBeam","GroundBeam","Size","Clear","Active"})else local K=self:GetNWEntity("Link")if IsValid(K)&&K:GetClass()=="gmod_wire_hologrid"then WireLib.AdjustInputs(self,{"Pos [VECTOR]","X","Y","Z","Local","Color [VECTOR]","FadeTime","LineBeam","GroundBeam","Size","Clear","Active"})end end;self:SetNWEntity("Link",m)end;function ENT:UnLink()local K=self:GetNWEntity("Link")if IsValid(K)&&K:GetClass()=="gmod_wire_hologrid"then WireLib.AdjustInputs(self,{"Pos [VECTOR]","X","Y","Z","Local","Color [VECTOR]","FadeTime","LineBeam","GroundBeam","Size","Clear","Active"})end;self:SetNWEntity("Link",NULL)end;util.AddNetworkString("WireHoloEmitterData")function ENT:Think()self:NextThink(CurTime()+a:GetFloat())if!next(self.Points)then return true end;net.Start("WireHoloEmitterData")net.WriteEntity(self)net.WriteFloat(a:GetFloat())net.WriteUInt(#self.Points,16)for L,A in pairs(self.Points)do net.WriteVector(A.Pos)net.WriteBit(A.Local)net.WriteUInt(A.Color.x,8)net.WriteUInt(A.Color.y,8)net.WriteUInt(A.Color.z,8)net.WriteUInt(math.Clamp(A.FadeTime,0,100)*100,16)net.WriteBit(A.LineBeam)net.WriteBit(A.GroundBeam)net.WriteUInt(math.Clamp(A.Size,0,100)*100,16)end;net.Broadcast()self.Points={}return true end;duplicator.RegisterEntityClass("gmod_wire_holoemitter",WireLib.MakeWireEnt,"Data")function ENT:UpdateTransmitState()return TRANSMIT_ALWAYS end;function ENT:BuildDupeInfo()local M=BaseClass.BuildDupeInfo(self)||{}local N=self:GetNWEntity("Link",false)if N then M.holoemitter_link=N:EntIndex()end;return M end;function ENT:ApplyDupeInfo(O,m,M,P)BaseClass.ApplyDupeInfo(self,O,m,M,P)self:Link(P(M.holoemitter_link))end
--addons/!lpakr_out/lua/entities/gmod_wire_keyboard/cl_init.lua:
include('shared.lua')include("remap.lua")net.Receive("wire_keyboard_blockinput",function(a)if net.ReadBit()!=0 then hook.Add("StartChat","wire_keyboard_startchatoverride",function(b)return true end)hook.Add("PlayerBindPress","wire_keyboard_blockinput",function(c,d,e)if d=="+attack"then return nil end;if d=="+attack2"then return nil end;return true end)else hook.Remove("StartChat","wire_keyboard_startchatoverride")hook.Remove("PlayerBindPress","wire_keyboard_blockinput")end end)local f;local function g()if!f then return end;f:Remove()f=nil end;net.Receive("wire_keyboard_activatemessage",function(a)local h=net.ReadBit()!=0;g()if!h then return end;local i=net.ReadBit()!=0;local j=LocalPlayer():GetInfoNum("wire_keyboard_leavekey",KEY_LALT)local k=string.upper(input.GetKeyName(j))local l;if i then l="This pod is linked to a Wire Keyboard - press "..k.." to leave."else l="Wire Keyboard turned on - press "..k.." to leave."end;f=vgui.Create("DShape")f:SetColor(Color(0,0,0,192))f:SetType("Rect")local m=vgui.Create("DLabel",f)m:SetText(l)m:SizeToContents()local n=3;m:SetPos(2*n,2*n)f:SizeToChildren(true,true)m:SetPos(n,n)f:CenterHorizontal()f:CenterVertical(0.95)end)
--addons/!lpakr_out/lua/entities/gmod_wire_lamp.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Lamp"ENT.RenderGroup=RENDERGROUP_BOTH;ENT.WireDebugName="Lamp"function ENT:SetupDataTables()self:NetworkVar("Bool",0,"On")end;if CLIENT then local a=Material("sprites/light_ignorez")local b=Material("effects/lamp_beam")function ENT:Initialize()self.PixVis=util.GetPixelVisibleHandle()end;function ENT:DrawTranslucent()BaseClass.DrawTranslucent(self)if!self:GetOn()then return end;local c=self:GetAngles():Forward()local d=self:GetPos()-EyePos()local e=d:Length()d:Normalize()local f=d:Dot(c*-1)local g=self:GetPos()+c*5;if f>=0 then render.SetMaterial(a)local h=util.PixelVisible(g,16,self.PixVis)if!h then return end;local i=math.Clamp(e*h*f*2,64,512)e=math.Clamp(e,32,800)local j=math.Clamp((1000-e)*h*f,0,100)local k=self:GetColor()k.a=j;render.DrawSprite(g,i,i,k,h*f)render.DrawSprite(g,i*0.4,i*0.4,Color(255,255,255,j),h*f)end end;return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)local l=self:GetPhysicsObject()if l:IsValid()then l:Wake()end;self.Inputs=WireLib.CreateSpecialInputs(self,{"Red","Green","Blue","RGB","FOV","Distance","Brightness","On","Texture"},{"NORMAL","NORMAL","NORMAL","VECTOR","NORMAL","NORMAL","NORMAL","NORMAL","STRING"})end;function ENT:OnTakeDamage(m)self:TakePhysicsDamage(m)end;function ENT:TriggerInput(n,o)if n=="Red"then self.r=math.Clamp(o,0,255)elseif n=="Green"then self.g=math.Clamp(o,0,255)elseif n=="Blue"then self.b=math.Clamp(o,0,255)elseif n=="RGB"then self.r,self.g,self.b=math.Clamp(o[1],0,255),math.Clamp(o[2],0,255),math.Clamp(o[3],0,255)elseif n=="FOV"then self.FOV=o elseif n=="Distance"then self.Dist=o elseif n=="Brightness"then self.Brightness=math.Clamp(o,0,10)elseif n=="On"then self:Switch(o!=0)elseif n=="Texture"then if o!=""then self.Texture=o else self.Texture="effects/flashlight001"end end;self:UpdateLight()end;function ENT:Switch(p)if p!=!self.flashlight then return end;self.on=p;if!p then SafeRemoveEntity(self.flashlight)self.flashlight=nil;self:SetOn(false)return end;self:SetOn(true)local q=self:GetAngles()self.flashlight=ents.Create("env_projectedtexture")self.flashlight:SetParent(self)self.flashlight:SetLocalPos(Vector(0,0,0))self.flashlight:SetLocalAngles(Angle(0,0,0))self.flashlight:SetKeyValue("enableshadows",1)self.flashlight:SetKeyValue("farz",self.Dist)self.flashlight:SetKeyValue("nearz",12)self.flashlight:SetKeyValue("lightfov",self.FOV)local r=self:GetColor()local s=self.Brightness;self.flashlight:SetKeyValue("lightcolor",Format("%i %i %i 255",r.r*s,r.g*s,r.b*s))self.flashlight:Spawn()self.flashlight:Input("SpotlightTexture",NULL,NULL,self.Texture)end;function ENT:UpdateLight()self:SetColor(Color(self.r,self.g,self.b,self:GetColor().a))if!IsValid(self.flashlight)then return end;self.flashlight:Input("SpotlightTexture",NULL,NULL,self.Texture)self.flashlight:Input("FOV",NULL,NULL,tostring(self.FOV))self.flashlight:SetKeyValue("farz",self.Dist)local r=self:GetColor()local s=self.Brightness;self.flashlight:SetKeyValue("lightcolor",Format("%i %i %i 255",r.r*s,r.g*s,r.b*s))self:SetOverlayText("Red: "..r.r.." Green: "..r.g.." Blue: "..r.b.."\n".."FoV: "..self.FOV.." Distance: "..self.Dist.." Brightness: "..self.Brightness)end;function ENT:Setup(t,u,s,v,w,x,y,p)self.r,self.g,self.b=math.Clamp(t||255,0,255),math.Clamp(u||255,0,255),math.Clamp(s||255,0,255)self.Texture=v||"effects/flashlight001"self.FOV=w||90;self.Dist=x||1024;self.Brightness=math.Clamp(y||8,0,10)self.on=p||false;self:Switch(self.on)self:UpdateLight()end;duplicator.RegisterEntityClass("gmod_wire_lamp",WireLib.MakeWireEnt,"Data","r","g","b","Texture","FOV","Dist","Brightness","on")
--addons/!lpakr_out/lua/entities/gmod_wire_locator.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Locator Beacon"ENT.WireDebugName="Locator"if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)end;function ENT:GetBeaconPos(a)return self:GetPos()end;function ENT:GetBeaconVelocity(a)return self:GetVelocity()end;duplicator.RegisterEntityClass("gmod_wire_locator",WireLib.MakeWireEnt,"Data")
--addons/!lpakr_out/lua/entities/gmod_wire_trail.lua:
AddCSLuaFile()DEFINE_BASECLASS("base_wire_entity")ENT.PrintName="Wire Trail"ENT.WireDebugName="Trail"ENT.RenderGroup=RENDERGROUP_BOTH;if CLIENT then return end;function ENT:Initialize()self:PhysicsInit(SOLID_VPHYSICS)self:SetMoveType(MOVETYPE_VPHYSICS)self:SetSolid(SOLID_VPHYSICS)self.Inputs=Wire_CreateInputs(self,{"Set","Length","StartSize","EndSize","R","G","B","A"})self.Outputs=Wire_CreateOutputs(self,{})self.Trail={Color=Color(255,255,255,255),Length=5,StartSize=32,EndSize=0,Material="trails/lol"}end;function ENT:Setup(a)self.Trail=table.Merge(self.Trail,a)self:SetOverlayText("Trail: "..a.Material)end;function ENT:TriggerInput(b,c)if b=="Set"&&c!=0 then duplicator.EntityModifiers.trail(self:GetOwner(),self,self.Trail)elseif b=="Length"then self.Trail.Length=c elseif b=="StartSize"then self.Trail.StartSize=c elseif b=="EndSize"then self.Trail.EndSize=c elseif b=="R"then self.Trail.Color.r=c elseif b=="G"then self.Trail.Color.g=c elseif b=="B"then self.Trail.Color.b=c elseif b=="A"then self.Trail.Color.a=c end end;duplicator.RegisterEntityClass("gmod_wire_trail",WireLib.MakeWireEnt,"Data","Trail")
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/keypad/cl_init.lua:
include("sh_init.lua")local a=-50;local b=-100;local c=100;local d=200;local e=Vector(0,0,0)local f=Color(0,0,0)local g=Color(255,255,255)local h=Color(50,75,50,255)local i={{a+5,b+100,25,25,-2.2,3.45,1.3,-0},{a+37.5,b+100,25,25,-0.6,1.85,1.3,-0},{a+70,b+100,25,25,1.0,0.25,1.3,-0},{a+5,b+132.5,25,25,-2.2,3.45,2.9,-1.6},{a+37.5,b+132.5,25,25,-0.6,1.85,2.9,-1.6},{a+70,b+132.5,25,25,1.0,0.25,2.9,-1.6},{a+5,b+165,25,25,-2.2,3.45,4.55,-3.3},{a+37.5,b+165,25,25,-0.6,1.85,4.55,-3.3},{a+70,b+165,25,25,1.0,0.25,4.55,-3.3},{a+5,b+67.5,50,25,-2.2,4.7,-0.3,1.6,'KeypadButton'},{a+60,b+67.5,35,25,0.3,1.65,-0.3,1.6}}local j={}local k={}k[KEY_PAD_1]=1;k[KEY_PAD_2]=2;k[KEY_PAD_3]=3;k[KEY_PAD_4]=4;k[KEY_PAD_5]=5;k[KEY_PAD_6]=6;k[KEY_PAD_7]=7;k[KEY_PAD_8]=8;k[KEY_PAD_9]=9;k[KEY_ENTER]=KEY_ENTER;k[KEY_PAD_ENTER]=KEY_PAD_ENTER;k[KEY_PAD_MINUS]=KEY_PAD_MINUS;k[KEY_PAD_PLUS]=KEY_PAD_PLUS;local l={}l[10]=KEY_PAD_MINUS;l[11]=KEY_ENTER;local m={}surface.CreateFont("Keypad",{font="Calibri",size=55,weight=900})surface.CreateFont("KeypadButton",{font="roboto",size=24,weight=500})surface.CreateFont("KeypadSButton",{font="Trebuchet",size=22,weight=900})function ENT:Draw()self:DrawModel()local n=LocalPlayer()if IsValid(n)then local o=n:EyePos():DistToSqr(self:GetPos())if o>562500 then return end;local p=self:GetPos()-n:GetShootPos()local q=util.GetPlayerTrace(n,p)q=util.TraceLine(q)if q.Entity!=self&&q.Entity:GetClass()!='player'then return end;local r=self:GetPos()+self:GetForward()*1.1;p=self:GetAngles()p:RotateAroundAxis(p:Right(),-90)p:RotateAroundAxis(p:Up(),90)cam.Start3D2D(r,p,0.05)m.start=n:GetShootPos()m.endpos=n:GetAimVector()*32+m.start;m.filter=n;q=util.TraceLine(m)local r=self:WorldToLocal(q.HitPos)local s=self:GetNumStars()local t=self:GetStatus()surface.SetDrawColor(0,0,0,255)surface.DrawRect(a-5,b-5,c+10,d+10)local t=self:GetStatus()||0;if t==1 then surface.SetTextColor(255,50,50)elseif t==2 then surface.SetTextColor(50,255,50)else surface.SetTextColor(255,255,255)end;surface.SetDrawColor(50,75,50,255)surface.DrawRect(a+5,b+5,90,50)surface.SetFont("Keypad")surface.SetTextPos(a+5,b+10)surface.DrawText(string.rep('*',self:GetNumStars()))local u=false;for v,w in ipairs(i)do local x=v;local y=w[1]+7;local z=w[2]+1;local A=(r.y-w[5])/(w[5]+w[6])local B=1-(r.z+w[7])/(w[7]+w[8])if v==10 then x="✘"y=w[1]+16;z=w[2]surface.SetTextColor(255,50,50)surface.SetDrawColor(90,25,25,255)elseif v==11 then y=w[1]+8;z=w[2]+1;x="✔"surface.SetTextColor(50,255,50,255)surface.SetDrawColor(25,90,25,255)else surface.SetTextColor(150,150,150,255)surface.SetDrawColor(50,50,50,255)end;if q.Entity==self&&A>=0&&B>=0&&A<=1&&B<=1 then if v<=9 then surface.SetTextColor(0,0,0)surface.SetDrawColor(200,200,200,255)elseif v==10 then surface.SetTextColor(255,255,255)surface.SetDrawColor(200,50,50,255)elseif v==11 then surface.SetTextColor(255,255,255)surface.SetDrawColor(50,200,50,255)end;surface.DrawRect(w[1],w[2],w[3],w[4])if n:KeyDown(IN_USE)then surface.SetDrawColor(0,0,0)surface.DrawOutlinedRect(w[1],w[2],w[3],w[4])if!n.KeypadCooldown||SysTime()>n.KeypadCooldown then self:EnterKey(n,v)end end;u=true else surface.DrawRect(w[1],w[2],w[3],w[4])end;surface.SetFont(w[9]||"KeypadSButton")surface.SetTextPos(y,z)surface.DrawText(x)end;cam.End3D2D()end end;function ENT:EnterKey(n,v)v=k[v]||l[v]||v;n.KeypadCooldown=SysTime()+1;if v<=9 then net.Start("rp.keypad.Number")net.WriteEntity(self)net.WriteUInt(v,4)net.SendToServer()else local C=v==KEY_ENTER||v==KEY_PAD_ENTER;net.Start("rp.keypad.Func")net.WriteEntity(self)net.WriteBool(C)net.SendToServer()end end;hook("Think","Keypad_Keypad",function()local n=LocalPlayer()if IsValid(n)then for v,w in pairs(k)do if k[v]then if input.IsKeyDown(v)&&!j[v]&&(!n.KeypadCooldown||SysTime()>n.KeypadCooldown)then j[v]=true;m.start=n:GetShootPos()m.endpos=n:GetAimVector()*32+m.start;m.filter=n;local q=util.TraceLine(m)if IsValid(q.Entity)&&q.Entity:GetClass()=="keypad"then q.Entity:EnterKey(n,v)end elseif j[v]&&!input.IsKeyDown(v)then j[v]=nil;n.KeypadCooldown=SysTime()+0.1 end end end end end)hook("KeyRelease","Keypad_ReleaseCheck",function(n,v)if!IsFirstTimePredicted()then return end;if v==IN_USE then n.KeypadCooldown=SysTime()+0.1 end end)
--addons/ssrp_lfs/lua/entities/lvs_base/cl_effects.lua:

function ENT:StartWindSounds()
	self:StopWindSounds()

	if LocalPlayer():lvsGetVehicle() ~= self then return end

	self._WindSFX = CreateSound( self, "LVS.Physics.Wind" )
	self._WindSFX:PlayEx(0,100)

	self._WaterSFX = CreateSound( self, "LVS.Physics.Water" )
	self._WaterSFX:PlayEx(0,100)
end

function ENT:StopWindSounds()
	if self._WindSFX then
		self._WindSFX:Stop()
		self._WindSFX = nil
	end

	if self._WaterSFX then
		self._WaterSFX:Stop()
		self._WaterSFX = nil
	end
end

function ENT:DoVehicleFX()
	local Vel = self:GetVelocity():Length()

	if self._WindSFX then self._WindSFX:ChangeVolume( math.Clamp( (Vel - 1200) / 2800,0,1 ), 0.25 ) end

	if Vel < 1500 then
		if self._WaterSFX then self._WaterSFX:ChangeVolume( 0, 0.25 ) end

		return
	end

	if (self.nextFX or 0) < CurTime() then
		self.nextFX = CurTime() + 0.05

		local LCenter = self:OBBCenter()
		LCenter.z = self:OBBMins().z

		local CenterPos = self:LocalToWorld( LCenter )

		local trace = util.TraceLine( {
			start = CenterPos + Vector(0,0,25),
			endpos = CenterPos - Vector(0,0,450),
			filter = self:GetCrosshairFilterEnts(),
		} )

		local traceWater = util.TraceLine( {
			start = CenterPos + Vector(0,0,25),
			endpos = CenterPos - Vector(0,0,450),
			filter = self:GetCrosshairFilterEnts(),
			mask = MASK_WATER,
		} )

		if self._WaterSFX then self._WaterSFX:ChangePitch( math.Clamp((Vel / 1000) * 50,80,150), 0.5 ) end

		if traceWater.Hit and trace.HitPos.z < traceWater.HitPos.z then 
			local effectdata = EffectData()
				effectdata:SetOrigin( traceWater.HitPos )
				effectdata:SetEntity( self )
			util.Effect( "lvs_physics_water", effectdata )

			if self._WaterSFX then self._WaterSFX:ChangeVolume( 1 - math.Clamp(traceWater.Fraction,0,1), 0.5 ) end
		else
			if self._WaterSFX then self._WaterSFX:ChangeVolume( 0, 0.25 ) end
		end

		if trace.Hit then
			local effectdata = EffectData()
				effectdata:SetOrigin( trace.HitPos )
				effectdata:SetEntity( self )
			util.Effect( "lvs_physics_dust", effectdata )
		end
	end
end

function ENT:GetParticleEmitter( Pos )
	local T = CurTime()

	if IsValid( self.Emitter ) and (self.EmitterTime or 0) > T then
		return self.Emitter
	end

	self:StopEmitter()

	self.Emitter = ParticleEmitter( Pos, false )
	self.EmitterTime = T + 2

	return self.Emitter
end

function ENT:StopEmitter()
	if IsValid( self.Emitter ) then
		self.Emitter:Finish()
	end
end
--addons/ssrp_lfs/lua/entities/lvs_base_fighterplane/sh_camera_eyetrace.lua:

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

--addons/ssrp_lfs/lua/entities/lvs_base_fighterplane/cl_deathsound.lua:

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


--addons/ssrp_lfs/lua/entities/lvs_base_gunner/shared.lua:
ENT.Type            = "anim"

ENT.PrintName = "LBaseGunner"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS]"

ENT.Spawnable       = false
ENT.AdminSpawnable  = false
ENT.DoNotDuplicate = true

ENT.LVS_GUNNER = true
ENT.VectorNull = Vector(0,0,0)

function ENT:SetupDataTables()
	self:NetworkVar( "Entity",0, "Driver" )
	self:NetworkVar( "Entity",1, "DriverSeat" )

	self:NetworkVar( "Int", 0, "PodIndex")
	self:NetworkVar( "Int", 1, "NWAmmo")
	self:NetworkVar( "Int", 2, "SelectedWeapon" )

	self:NetworkVar( "Float", 0, "NWHeat" )

	self:NetworkVar( "Vector", 0, "NWAimVector" )

	if SERVER then
		self:NetworkVarNotify( "SelectedWeapon", self.OnWeaponChanged )
	end
end


function ENT:GetEyeTrace()
	local startpos = self:GetPos()

	local trace = util.TraceLine( {
		start = startpos,
		endpos = (startpos + self:GetAimVector() * 50000),
		filter = self:GetCrosshairFilterEnts()
	} )

	return trace
end


function ENT:GetAI()
	if IsValid( self:GetDriver() ) then return false end

	local veh = self:GetVehicle()

	if not IsValid( veh ) then return false end

	return veh:GetAI()
end

function ENT:GetAITEAM()
	local Base = self:GetVehicle()

	if not IsValid( Base ) then return 0 end

	return Base:GetAITEAM()
end

function ENT:GetVehicle()
	local Pod = self:GetParent()

	if not IsValid( Pod ) then return NULL end

	return Pod:GetParent()
end

function ENT:HasWeapon( ID )
	local Base = self:GetVehicle()

	if not IsValid( Base ) then return false end

	return istable( Base.WEAPONS[ self:GetPodIndex() ][ ID ] )
end

function ENT:AIHasWeapon( ID )
	local Base = self:GetVehicle()

	if not IsValid( Base ) then return false end

	local weapon = Base.WEAPONS[ self:GetPodIndex() ][ ID ]

	if not istable( weapon ) then return false end

	return weapon.UseableByAI
end

function ENT:GetActiveWeapon()
	local SelectedID = self:GetSelectedWeapon()

	local Base = self:GetVehicle()

	if not IsValid( Base ) then return {}, SelectedID end

	local CurWeapon = Base.WEAPONS[ self:GetPodIndex() ][ SelectedID ]

	return CurWeapon, SelectedID
end

function ENT:GetMaxAmmo()
	local CurWeapon = self:GetActiveWeapon()

	if not CurWeapon then return -1 end

	return CurWeapon.Ammo or -1
end

function ENT:GetCrosshairFilterEnts()
	local Base = self:GetVehicle()

	if not IsValid( Base ) then return {} end

	return Base:GetCrosshairFilterEnts()
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

--addons/ssrp_lfs/lua/entities/lvs_base_repulsorlift/shared.lua:

ENT.Base = "lvs_base_starfighter"

ENT.PrintName = "[LVS] Base Gunship"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS]"

ENT.ThrustVtol = 30
ENT.ThrustRateVtol = 2

ENT.MaxPitch = 60

function ENT:CalcVtolThrottle( ply, cmd )
	local Delta = FrameTime()

	local ThrottleZero = self:GetThrottle() <= 0

	local VtolX = ThrottleZero and (ply:lvsKeyDown( "-VTOL_X_SF" ) and -1 or 0) or 0
	local VtolY = ((ply:lvsKeyDown( "+VTOL_Y_SF" ) and 1 or 0) - (ply:lvsKeyDown( "-VTOL_Y_SF" ) and 1 or 0))

	if ply:lvsMouseAim() then
		VtolY = math.Clamp( VtolY + ((ply:lvsKeyDown( "-ROLL_SF" ) and 1 or 0) - (ply:lvsKeyDown( "+ROLL_SF" ) and 1 or 0)), -1 , 1)
	end

	VtolY = VtolY * math.max( 1 - self:GetThrottle() ^ 2, 0 )
	local VtolZ = ((ply:lvsKeyDown( "+VTOL_Z_SF" ) and 1 or 0) - (ply:lvsKeyDown( "-VTOL_Z_SF" ) and 1 or 0))

	local DesiredVtol = Vector(VtolX,VtolY,VtolZ)
	local NewVtolMove = self:GetNWVtolMove() + (DesiredVtol - self:GetNWVtolMove()) * self.ThrustRateVtol * Delta

	if not ThrottleZero or self:WorldToLocal( self:GetPos() + self:GetVelocity() ).x > 100 then
		NewVtolMove.x = 0
	end

	self:SetVtolMove( NewVtolMove )
end

function ENT:GetVtolMove()
	if self:GetEngineActive() and not self:GetAI() then
		return self:GetNWVtolMove() * self.ThrustVtol
	else
		return Vector(0,0,0)
	end
end

function ENT:PlayerDirectInput( ply, cmd )
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

	if KeyPitchDown then MouseY = (10 / SensY) * ReturnDelta end
	if KeyPitchUp then MouseY = -(10 / SensY) * ReturnDelta end
	if KeyLeft then MouseX = -(10 / SensX) * ReturnDelta end
	if KeyRight then MouseX = (10 / SensX) * ReturnDelta end

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

function ENT:StartCommand( ply, cmd )
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
		if SERVER then
			self:PlayerMouseAim( ply, cmd )
		end
	else
		self:PlayerDirectInput( ply, cmd )
	end

	self:CalcThrottle( ply, cmd )
	self:CalcVtolThrottle( ply, cmd )
end
--addons/ssrp_lfs/lua/entities/lvs_base_starfighter/cl_camera.lua:

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

		pod._lerpPosL = pod._lerpPosL and (pod._lerpPosL + (Vector(radius, SideForce,150 + radius * 0.1 + radius * pod:GetCameraHeight() + UpForce) - pod._lerpPosL) * RealFrameTime() * 12) or Vector(0,0,0)
		pod._lerpPos = self:LocalToWorld( pod._lerpPosL )

		view.origin = pod._lerpPos
		view.angles = self:LocalToWorldAngles( Angle(0,180,0) )
	else
		local TargetPos = self:LocalToWorld( Vector(500,0,150 + radius * 0.1 + radius * pod:GetCameraHeight()) )

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
--addons/ssrp_lfs/lua/entities/lvs_base_starfighter/cl_deathsound.lua:

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


--addons/ssrp_lfs/lua/entities/lvs_dwarfdroid/cl_init.lua:
include("shared.lua")
-- include( "cl_ikfunctions.lua" )
include( "cl_camera.lua" )
-- include( "cl_legs.lua" )
include( "cl_prediction.lua" )
-- include("sh_turret.lua")
-- include("sh_gunner.lua")

-- function ENT:OnRemoved()
-- 	if (self.TurretEnt) then
-- 		if (IsValid(self.TurretEnt)) then
-- 			self.TurretEnt:Remove()
-- 		end
-- 	end
-- end

function ENT:DamageFX()
	-- self.nextDFX = self.nextDFX or 0

	-- if self.nextDFX < CurTime() then
	-- 	self.nextDFX = CurTime() + 0.05

	-- 	if self:GetIsRagdoll() then
	-- 		if math.random(0,45) < 3 then
	-- 			if math.random(1,2) == 1 then
	-- 				local Pos = self:LocalToWorld( Vector(0,0,70) + VectorRand() * 80 )
	-- 				local effectdata = EffectData()
	-- 					effectdata:SetOrigin( Pos )
	-- 				util.Effect( "cball_explode", effectdata, true, true )
					
	-- 				sound.Play( "lvs/vehicles/atte/spark"..math.random(1,4)..".ogg", Pos, 75 )
	-- 			end
	-- 		end
	-- 	end

	-- 	local HP = self:GetHP()
	-- 	local MaxHP = self:GetMaxHP()

	-- 	if HP > MaxHP * 0.5 then return end

	-- 	local effectdata = EffectData()
	-- 		effectdata:SetOrigin( self:LocalToWorld( Vector(0,0,160) ) )
	-- 		effectdata:SetEntity( self )
	-- 	util.Effect( "lvs_engine_blacksmoke", effectdata )

	-- 	if HP <= MaxHP * 0.25 then
	-- 		local effectdata = EffectData()
	-- 			effectdata:SetOrigin( self:LocalToWorld( Vector(0,20,180) ) )
	-- 			effectdata:SetNormal( self:GetUp() )
	-- 			effectdata:SetMagnitude( math.Rand(1,3) )
	-- 			effectdata:SetEntity( self )
	-- 		util.Effect( "lvs_exhaust_fire", effectdata )

	-- 		local effectdata = EffectData()
	-- 			effectdata:SetOrigin( self:LocalToWorld( Vector(0,-20,180) ) )
	-- 			effectdata:SetNormal( self:GetUp() )
	-- 			effectdata:SetMagnitude( math.Rand(1,3) )
	-- 			effectdata:SetEntity( self )
	-- 		util.Effect( "lvs_exhaust_fire", effectdata )
	-- 	end
	-- end
end

function ENT:PreDraw()
	self:DrawTurretDriver()

	return true
end

function ENT:DrawTurretDriver()
	local pod = self:GetDriverSeat()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and plyL:GetViewEntity() == plyL and not pod:GetThirdPersonMode()) then return end

	local ID = self:LookupAttachment( "driver" )
	local Att = self:GetAttachment( ID )

	if not Att then return end

	local _,Ang = LocalToWorld( Vector(0,0,0), Angle(0,90,0), Att.Pos, Att.Ang )

	ply:SetSequence( "drive_jeep" )
	ply:SetRenderAngles( Ang )
	ply:DrawModel()
end

local lightMat = Material("sprites/light_ignorez")


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

	-- if ply == self:GetDriver() then
	-- 	local pod = ply:GetVehicle()

	-- 	-- if pod == self:GetTurretSeat() or pod == self:GetGunnerSeat() then
	-- 		self:PaintZoom( X, Y, ply )
	-- 	-- end

	-- 	return
	-- end

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

--addons/ssrp_lfs/lua/entities/lvs_dwarfdroid/cl_prediction.lua:

function ENT:PredictPoseParamaters()
	local pod = self:GetTurretSeat()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if ply ~= plyL then return end

	self:SetPosTurret()
	self:SetPoseParameterTurret( pod:lvsGetWeapon() )
end
--addons/ssrp_lfs/lua/entities/lvs_plane_template/shared.lua:

ENT.Base = "lvs_base_fighterplane"

ENT.PrintName = "template script"
ENT.Author = "*your name*"
ENT.Information = ""
ENT.Category = "[LVS] *your category*"

ENT.Spawnable			= false -- set to "true" to make it spawnable
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 15 -- spawn normal offset, raise to prevent spawning into the ground
--ENT.SpawnNormalOffsetSpawner = 0 -- offset for ai vehicle spawner

ENT.MDL = "models/props_wasteland/laundry_cart001.mdl" -- model forward direction must be facing to X+
--[[
ENT.GibModels = {
	"models/XQM/wingpiece2.mdl",
	"models/XQM/wingpiece2.mdl",
	"models/XQM/jetwing2medium.mdl",
	"models/XQM/jetwing2medium.mdl",
	"models/props_phx/misc/propeller3x_small.mdl",
	"models/props_c17/TrapPropeller_Engine.mdl",
	"models/props_junk/Shoe001a.mdl",
	"models/XQM/jetbody2fuselage.mdl",
	"models/XQM/jettailpiece1medium.mdl",
	"models/XQM/pistontype1huge.mdl",
}
]]

ENT.AITEAM = 2
--[[
TEAMS:
	0 = FRIENDLY TO EVERYONE
	1 = FRIENDLY TO TEAM 1 and 0
	2 = FRIENDLY TO TEAM 2 and 0
	3 = HOSTILE TO EVERYONE
]]

ENT.MaxVelocity = 2500 -- max theoretical velocity at 0 degree climb
ENT.MaxPerfVelocity = 1800 -- speed in which the plane will have its maximum turning potential
ENT.MaxThrust = 1250 -- max push power

ENT.ThrottleRateUp = 0.6 -- how fast throttle goes up
ENT.ThrottleRateDown = 0.3 -- how fast throttle goes down

ENT.TurnRatePitch = 1 -- max turn rate in pitch (up / down)
ENT.TurnRateYaw = 1 -- max turn rate in yaw (left / right)
ENT.TurnRateRoll = 1 -- max turn rate in roll

ENT.ForceLinearMultiplier = 1 -- multiplier for linear force in X / Y / Z direction

ENT.ForceAngleMultiplier = 1 -- multiplier for angular forces in pitch / yaw / roll direction
ENT.ForceAngleDampingMultiplier = 1 -- how much angular motion is dampened (smaller value = wobble more)

ENT.MaxSlipAnglePitch = 20 -- how many degrees the plane is allowed to slip from forward-motion direction vs forward-facing direction
ENT.MaxSlipAngleYaw = 10 -- same for yaw

ENT.StallVelocity = 150 -- below which velocity is the plane supposed to start stalling, not: !!this should never be above ENT.MaxPerfVelocity and be about 1/12th of ENT.MaxPerfVelocity!!
ENT.StallForceMultiplier = 1 -- multiply the gravitational rotating-force on stall. The Higher this value, the quicker the plane will rotate towards its directional velocity on stall
ENT.StallForceMax = 15 -- clamp the gravitational rotating-force on stall.

ENT.MaxHealth = 1000

function ENT:OnSetupDataTables() -- use this to add networkvariables instead of ENT:SetupDataTables().
	--self:AddDT(  string_type, string_name, table_extended ) -- self:AddDT() works the same as self:NetworkVar() except AddDT doesnt take a slot variable as it automatically handles slots internally.

	-- example:
	--self:AddDT( "Float", "MyValue", { KeyName = "myvalue", Edit = { type = "Float", order = 3,min = 0, max = 10, category = "Misc"}  )

	-- or:
	-- self:AddDT( "Float", "MyValue" )
end

--[[
function ENT:CalcMainActivity( ply ) -- edit player anims here, works just like GM:CalcMainActivity hook
end

function ENT:UpdateAnimation( ply, velocity, maxseqgroundspeed ) -- just like GM:UpdateAnimation hook
	return false -- prevent original behavior
end
]]

function ENT:InitWeapons()
	-- add a weapon:

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/bullet.png")
	weapon.Ammo = 1000
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		-- "ent" can be either the weapon handler or the vehicle(which has a integrated weapon handler)
		-- "ent" is where ent:SetHeat, ent:GetHeat, ent:GetAmmo ect functions are called on.
		-- for seat 1 (which is the driver), ent is equal to self (the vehicle), passenger seats usually return the weapon handler and not self.
		-- if you want to be 100% sure to get the actual vehicle, just call ent:GetVehicle() it will always return the base vehicle.

		local bullet = {}
		bullet.Src 	= ent:LocalToWorld( Vector(25,0,30) )
		bullet.Dir 	= ent:GetForward()
		bullet.Spread 	= Vector( 0.015,  0.015, 0 )
		bullet.TracerName = "lvs_tracer_orange"
		bullet.Force	= 10
		bullet.HullSize 	= 15
		bullet.Damage	= 10
		bullet.Velocity = 30000
		bullet.SplashDamage = 100
		bullet.SplashDamageRadius = 25
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo) end

		ent:LVSFireBullet( bullet )

		ent:EmitSound("npc/sniper/echo1.wav", 95, math.random(95,105), 1, CHAN_WEAPON )

		ent:TakeAmmo( 1 )
	end
	weapon.StartAttack = function( ent ) end
	weapon.FinishAttack = function( ent ) end
	weapon.OnSelect = function( ent ) end
	weapon.OnDeselect = function( ent ) end
	weapon.OnThink = function( ent, active ) end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	weapon.OnRemove = function( ent ) end
	--[[
	weapon.CalcView = function( ent, ply, pos, angles, fov, pod )

		-- build view yourself:
		local view = {}
		view.origin = pos
		view.angles = angles
		view.fov = fov
		view.drawviewer = false

		return view

		--or use inbuild camera system:
		--if pod:GetThirdPersonMode() then
		--	pos = pos + ent:GetUp() * 100 -- move camera 100 units up in third person
		--end
		--return LVS:CalcView( ent, ply, pos, angles, fov, pod )
	end
	]]
	--[[
	weapon.HudPaint = function( ent, X, Y, ply )
		-- hud paint that is only active when the weapon is selected
		-- draw stuff like crosshair here
	end
	]]
	self:AddWeapon( weapon )

	--self:AddWeapon( weapon, 2 ) -- this would register to weapon to seat 2
	--self:AddWeapon( weapon, 3 ) -- seat 3.. ect

--[[
	-- or use presets (defined in "lvs_base\lua\lvs_framework\autorun\lvs_defaultweapons.lua"):
	self.PosLMG = Vector(25,0,30)	-- this is used internally as variable in LMG script
	self.DirLMG = 0				-- this is used internally as variable in LMG script
	self:AddWeapon( LVS:GetWeaponPreset( "LMG" ) )
]]
end


-- sounds
ENT.FlyByAdvance = 0.5 -- how many second the flyby sound is advanced
ENT.FlyBySound = "lvs/vehicles/bf109/flyby.wav" -- which sound to play on fly by
ENT.DeathSound = "lvs/vehicles/generic/crash.wav" -- which sound to play on death (only in flight)

-- Engine Sounds only work in combination with self:AddEngine in init.lua
-- this is just where it reads the sound data so it doesnt have to be networked
ENT.EngineSounds = {
	{
		sound = "ambient/machines/spin_loop.wav", -- exterior sound
		--sound_int = "vehicles/airboat/fan_motor_fullthrottle_loop1.wav", -- interior sound. Commenting this out makes the exterior sound play while in interior. Set to "" to mute
		Pitch = 80, -- Pitch start value
		PitchMin = 0, -- clamp min pitch, 0 = unclamped
		PitchMax = 255, -- clamp max pitch, 255 = unclamped (max possible value in source)
		PitchMul = 100, -- pitch change is linear to throttle. The math behind this is:  SoundPitch = Pitch + Throttle * PitchMul
		FadeIn = 0, -- fade in at 0 Throttle
		FadeOut = 1, -- fade out at 1 Throttle
		FadeSpeed = 1.5, -- how fast to fade
		UseDoppler = true, -- set false to not use doppler
		--VolumeMin = 0, -- min volume clamp, 0 == unclamped
		--VolumeMax = 1, -- max volume clamp, 1 == unclamped
		--SoundLevel = 110,
	},
}
--addons/ssrp_lfs/lua/entities/lvs_seismic_canister.lua:

AddCSLuaFile()

ENT.Type = "anim"

ENT.Model = "models/jackjack/ships/seismiccanister.mdl"
ENT.Mass = 20
ENT.DMG = 500
ENT.DMGDist = 750
ENT.IdleSound = "slave1/seismicdeploy.wav"
ENT.ExplodeSound = "slave1/seismiccharge.wav"

function ENT:SetupDataTables()
	self:NetworkVar( "Entity",0, "Attacker" )
	self:NetworkVar( "Entity",1, "Inflictor" )
	self:NetworkVar( "Float",0, "StartVelocity" )
	self:NetworkVar( "Bool",1, "CleanMissile" )
	self:NetworkVar( "Bool",2, "DirtyMissile" )
	self:NetworkVar( "Bool",0, "Disabled" )
end

function ENT:BlindFire()
		if self:GetDisabled() then return end
		
		local pObj = self:GetPhysicsObject()
		
		if IsValid( pObj ) then
			pObj:SetVelocityInstantaneous( self:GetForward() * (self:GetStartVelocity() + 3000) )
	end
end

if SERVER then
	function ENT:SpawnFunction( ply, tr, ClassName )



		local ent = ents.Create( ClassName )
		ent:SetPos( tr.HitPos + tr.HitNormal * 20 )
		ent:Spawn()
		ent:Activate()

		return ent

	end

	function ENT:Initialize()
		self:SetModel(self.Model)
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetRenderMode( RENDERMODE_TRANSALPHA )
		self:PhysWake()
		local pObj = self:GetPhysicsObject()
		
		if IsValid( pObj ) then
			pObj:EnableGravity( true ) 
			pObj:SetMass(self.Mass) 
		end
		
		self.SpawnTime = CurTime()
	end

	function ENT:Think()	
		local curtime = CurTime()
		self:NextThink(curtime)
		
		if self.Explode then
			local Inflictor = self:GetInflictor()
			local Attacker = self:GetAttacker()
			util.BlastDamage( IsValid( Inflictor ) and Inflictor or Entity(0), IsValid( Attacker ) and Attacker or Entity(0), self:GetPos(),self.DMGDist,self.DMG)
			
			self:Remove()
		end
		
		if (self.SpawnTime + 35) < curtime then
			self:Remove()
		end
		
		return true
	end

	function ENT:PhysicsCollide( data )
		self.Explode = true
	end

	function ENT:OnTakeDamage( dmginfo )	

	end
else

	function ENT:Initialize()	
		self.Emitter = ParticleEmitter( self:GetPos(), false )
		
		self.Materials = {
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
		
		self.snd = CreateSound(self,self.IdleSound)
		self.snd:Play()
	end

local mat = Material( "sprites/light_glow02_add" )
	function ENT:Draw()
		self:DrawModel()
		
		if self.Disabled then return end
		
		local pos = self:GetPos()
				--particle:SetColor( 138,43,225 )

		local r = 0
		local g = 40
		local b = 250
		
		render.SetMaterial( mat )
		
		if self:GetCleanMissile() then
			r = 0
			g = 127
			b = 255
			
			for i =0,10 do
				local Size = (10 - i) * 25.6
				render.DrawSprite( pos - self:GetForward() * i * 5, Size, Size, Color( r, g, b, 255 ) )
			end
			

		end
		
		render.DrawSprite( pos, 256, 256, Color( r, g, b, 255 ) )
	end

function ENT:Think()
		local curtime = CurTime()
		
		self.NextFX = self.NextFX or 0
		
		if self.NextFX < curtime then
			self.NextFX = curtime + 0.02
			
			local pos = self:LocalToWorld( Vector(-8,0,0) )
			
			if self:GetDisabled() then 
				if not self.Disabled then
					self.Disabled = true
					
					if self.snd then
						self.snd:Stop()
					end
				end
				
				self:doFXbroken( pos )
				
				return
			end
			
			self:doFX( pos )
		end
		
		return true
	end

	function ENT:doFX( pos )
		local emitter = self.Emitter
		if not emitter then return end
	

			if not self:GetCleanMissile() then
				local particle = emitter:Add( self.Materials[math.random(1, table.Count(self.Materials) )], pos )
				
				if particle then
					particle:SetGravity( Vector(0,0,100) + VectorRand() * 50 ) 
					particle:SetVelocity( -self:GetForward() * 500  )
					particle:SetAirResistance( 600 ) 
					particle:SetDieTime( math.Rand(4,6) )
					particle:SetStartAlpha( 150 )
					particle:SetStartSize( math.Rand(6,12) )
					particle:SetEndSize( math.Rand(40,90) )
					particle:SetRoll( math.Rand( -1, 1 ) )
					particle:SetColor( 50,50,50 )
					particle:SetCollide( false )
				end
			end
			
			local particle = emitter:Add( "particles/flamelet"..math.random(1,5), pos )
			if particle then
				particle:SetVelocity( -self:GetForward() * 300 + self:GetVelocity())
				particle:SetDieTime( 0.1 )
				particle:SetAirResistance( 0 ) 
				particle:SetStartAlpha( 255 )
				particle:SetStartSize( 4 )
				particle:SetEndSize( 0 )
				particle:SetRoll( math.Rand(-1,1) )
				particle:SetColor( 255,255,255 )
				particle:SetGravity( Vector( 0, 0, 0 ) )
				particle:SetCollide( false )
		end
	end

	function ENT:OnRemove()
		
		local Pos = self:GetPos()
		
		self:Explosion( Pos + self:GetVelocity() / 20 )
		
		local random = math.random(1,2)
		self.snd:Stop()
		sound.Play(self.ExplodeSound, Pos, 95, 140, 1 )

		if self.Emitter then
			self.Emitter:Finish()
		end
	end

	function ENT:Explosion( pos )
		local emitter = self.Emitter
		if not emitter then return end
		if self.SmallExplosion then
			for i = 0,60 do
				local particle = emitter:Add( self.Materials[math.random(1,table.Count( self.Materials ))], pos )
				
				if particle then
					particle:SetVelocity( VectorRand(-1,1) * 600 )
					particle:SetDieTime( math.Rand(4,6) )
					particle:SetAirResistance( math.Rand(200,600) ) 
					particle:SetStartAlpha( 255 )
					particle:SetStartSize( math.Rand(10,30) )
					particle:SetEndSize( math.Rand(80,120) )
					particle:SetRoll( math.Rand(-1,1) )
					particle:SetColor( 50,50,50 )
					particle:SetGravity( Vector( 0, 0, 100 ) )
					particle:SetCollide( false )
				end
			end
			
			for i = 0, 40 do
				local particle = emitter:Add( "sprites/flamelet"..math.random(1,5), pos )
				
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
			
			local dlight = DynamicLight( math.random(0,9999) )
			if dlight then
				dlight.pos = pos
				dlight.r = 255
				dlight.g = 180
				dlight.b = 100
				dlight.brightness = 8
				dlight.Decay = 2000
				dlight.Size = 200
				dlight.DieTime = CurTime() + 0.1
			end
		else
			for i = 0,90 do
				local particle = emitter:Add( self.Materials[math.random(1,table.Count( self.Materials ))], pos )
				
				if particle then
					particle:SetVelocity( VectorRand(-1,1) * 1300 )
					particle:SetDieTime( math.Rand(5,8) )
					particle:SetAirResistance( math.Rand(200,600) ) 
					particle:SetStartAlpha( 255 )
					particle:SetStartSize( math.Rand(70,90) )
					particle:SetEndSize( math.Rand(180,210) )
					particle:SetRoll( math.Rand(-1,1) )
					particle:SetColor( 50,50,50 )
					particle:SetGravity( Vector( 0, 0, 100 ) )
					particle:SetCollide( false )
				end
			end

			for i = 0, 30 do
				local particle = emitter:Add( "sprites/strider_blackball", pos )
				
				if particle then
					particle:SetVelocity( VectorRand(-1,1) * 200 )
					particle:SetDieTime(0.1)
					particle:SetStartAlpha( 255 )
					particle:SetStartSize(200)
					particle:SetEndSize(0)
					particle:SetEndAlpha( 50 )
					particle:SetRoll( math.Rand( -1, 1 ) )
					particle:SetColor( 200,150,150 )
					particle:SetCollide( false )
				end
			end
		--timer.Simple(1,function()
			-- for i = 0, 1 do
				local particle = emitter:Add( "sprites/strider_blackball", pos )
				
				if particle then
					particle:SetVelocity( VectorRand(-1,1) * 10 )
					particle:SetDieTime(3)
					particle:SetStartAlpha( 150 )
					particle:SetStartSize(0)
					particle:SetEndSize( math.Rand(3000,3500) )
					particle:SetEndAlpha( 0 )
					particle:SetRoll( math.Rand( -1, 1 ) )
					particle:SetColor( 255,255,255 )
					particle:SetCollide( false )
				end
				local particle = emitter:Add( "sprites/blueglow2", pos )
				
				if particle then
					particle:SetVelocity( VectorRand(-1,1) * 10 )
					particle:SetDieTime(3)
					particle:SetStartAlpha( 255 )
					particle:SetStartSize(0)
					particle:SetEndSize( math.Rand(3000,3500) )
					particle:SetEndAlpha( 255 )
					particle:SetRoll( math.Rand( -1, 1 ) )
					particle:SetColor( 255,255,255 )
					particle:SetCollide( false )
				end
			-- end
		-- --end)
			for i = 0, 30 do
				local particle = emitter:Add( "sprites/strider_bluebeam", pos )
				
				if particle then
					particle:SetVelocity( VectorRand(-1,1) * 200 )
					particle:SetDieTime(0.2)
					particle:SetStartAlpha( 255 )
					particle:SetStartSize(500)
					particle:SetEndSize(0)
					particle:SetEndAlpha( 255 )
					particle:SetRoll( math.Rand( -1, 1 ) )
					particle:SetColor( 200,150,150 )
					particle:SetCollide( false )
				end
			end

			local dlight = DynamicLight( math.random(0,9999) )
			if dlight then
				dlight.pos = pos
				dlight.r = 255
				dlight.g = 180
				dlight.b = 100
				dlight.brightness = 8
				dlight.Decay = 2000
				dlight.Size = 200
				dlight.DieTime = CurTime() + 0.1
			end
		end
	end
end


--addons/ssrp_lfs/lua/entities/lvs_starfighter_awing/shared.lua:
ENT.Base = "lvs_base_starfighter"

ENT.PrintName = "A-Wing"
ENT.Author = "Digger"
ENT.Information = "Droid Starfighter of the Trade Federation"
ENT.Category = "[LVS] - Star Wars"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/DiggerThings/AWing/awing3.mdl"
ENT.GibModels = {
	"models/DiggerThings/AWing/gib1.mdl",
	"models/DiggerThings/AWing/gib2.mdl",
	"models/DiggerThings/AWing/gib3.mdl",
	"models/DiggerThings/AWing/gib4.mdl",
	"models/DiggerThings/AWing/gib5.mdl",
	"models/DiggerThings/AWing/gib6.mdl"
}

ENT.AITEAM = 1
ENT.Mass = 2000

ENT.MaxVelocity = 3000
ENT.MaxThrust = 28000

ENT.ThrustVtol = 55
ENT.ThrustRateVtol = 3

ENT.TurnRatePitch = 1
ENT.TurnRateYaw = 1
ENT.TurnRateRoll = 1

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = .8

ENT.MaxHealth = 600
ENT.MaxShield = 500

local blueLight = Vector(100, 100, 255)

function ENT:InitWeapons()
	self.FirePositions = {
		Vector(50, 91.88, 6.196),
		Vector(50, -91.88, 6.196),
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

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/dual_mg.png")
	weapon.Ammo = 400
	weapon.Delay = 0.15
	weapon.HeatRateUp = 0.5
	weapon.HeatRateDown = 1
	weapon.Attack = function( ent )
		local bullet = {}
		bullet.Dir 	= ent:GetForward()
		bullet.Spread 	= Vector( 0.015,  0.015, 0 )
		bullet.TracerName = "lvs_laser_blue"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 20
		bullet.Velocity = 60000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( blueLight )
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_impact", effectdata )
		end

		for _, pos in ipairs( self.FirePositions ) do
			bullet.Src 	= ent:LocalToWorld( pos )

			local effectdata = EffectData()
			effectdata:SetStart( blueLight )
			effectdata:SetOrigin( bullet.Src )
			effectdata:SetNormal( ent:GetForward() )
			effectdata:SetEntity( ent )
			util.Effect( "lvs_muzzle_colorable", effectdata )

			ent:LVSFireBullet( bullet )
		end

		ent:TakeAmmo()

		ent.SecondarySND:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end

	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )
end

ENT.FlyByAdvance = 0.5
ENT.FlyBySound = "lvs/vehicles/vwing/flyby.wav"
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
--addons/ssrp_lfs/lua/entities/lvs_starfighter_azureangel/cl_init.lua:
include("shared.lua")

ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EngineFXColor = Color( 255, 240, 150)
ENT.EngineFxPos = {
	Vector(-120,30,27),
	Vector(-120,-30,27)
}

function ENT:OnSpawn()
	for _, pos in ipairs(self.EngineFxPos) do
		self:RegisterTrail( pos, 0, 20, 2, 1000, 150 )
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

function ENT:CalcViewOverride(pl, pos)
	return self:GetPos() + self:GetForward()*-95 + self:GetRight()*0 + self:GetUp()*80
end
--addons/ssrp_lfs/lua/entities/lvs_turbotank/shared.lua:
ENT.Type = "anim"
ENT.Base = "lvs_base_fakehover"

ENT.PrintName = "Juggernaut"
ENT.Author = "Dec"
ENT.Information = ""
ENT.Category = "[LVS] SW-Vehicles"

ENT.Spawnable		= true
ENT.AdminSpawnable	= false

ENT.MDL = "models/vehicles/sky/turbotank/turbotank_s1.mdl"
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

ENT.AITEAM = 2

ENT.MaxVelocityY = 0
ENT.BoostAddVelocityY = 0

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.ForceLinearMultiplier = 2
ENT.ForceLinearRate = 0.8

ENT.MaxVelocityZ = 0
ENT.BoostAddVelocityZ = 0

ENT.MaxHealth = 7000
ENT.MaxVelocityX = 650
ENT.BoostAddVelocitX = 850
ENT.IgnoreWater = true

ENT.MaxTurnRate = 0.5

ENT.GroundTraceLength = 50
ENT.GroundTraceHull = 100

ENT.Stopturn = false
ENT.AnglGot = false

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "GunnerSeat" )
	self:AddDT( "Entity", "SecondGunnerSeat" )
	self:AddDT( "Entity", "ThirdGunnerSeat" )
	self:AddDT( "Bool", "SpotlightToggle" )
end

function ENT:GetAimAngles( ent, vers )
    local trace = ent:GetEyeTrace()
	local AimAngles
	if vers == 1 then
    	AimAngles = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld(Vector(55.63,-1.86,320.27))):GetNormalized():Angle() )
	elseif vers == 2 then
		AimAngles = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld(Vector(-225,0,300))):GetNormalized():Angle() )
	elseif vers == 3 then
		AimAngles = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld(Vector(250,0,250))):GetNormalized():Angle() )
	end
    return AimAngles
end
	
function ENT:InitWeapons()
	
	self.FirePositions = {
		Vector(300,-32,100),
		Vector(300,-42,100),
		Vector(300,59,100), 
		Vector(300,49,100),
	}

	self.RocketPositions = {
		Vector(275,-125,250),
		Vector(275,125,250),
	}

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Delay = 0.35
	weapon.Ammo = 300
	weapon.Attack = function( ent )
		ent.NumPrim = ent.NumPrim and ent.NumPrim + 1 or 1
		if ent.NumPrim > #ent.FirePositions then ent.NumPrim = 1 end
        --if not ent:GetVehicle():WeaponsInRange( ent ) then return true end
		local pod = ent:GetDriverSeat()

		if not IsValid( pod ) then return end

		local dir = ent:GetAimVector()
		
		if ent:AngleBetweenNormal( dir, ent:GetForward() ) > 15 then return true end

		local trace = ent:GetEyeTrace()

		local veh = ent:GetVehicle()

		veh.SNDTail:PlayOnce( 100 + math.Rand(-3,3), 1 )
		
		local CurPos = ent.FirePositions[ent.NumPrim]

		local bullet = {}
		bullet.Src = ent:LocalToWorld( CurPos )
		bullet.Dir = (trace.HitPos - bullet.Src):GetNormalized()
		bullet.Spread = Vector( 0.01,  0.01, 0.01 )
		bullet.TracerName = "lvs_laser_blue_long"
		bullet.Force = 10
		bullet.HullSize = 25
		bullet.Damage	= 100
		bullet.Velocity = 18000
		bullet.Attacker = ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(0,0,255) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_impact", effectdata )
		end
		ent:TakeAmmo()
		ent:LVSFireBullet( bullet )
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("physics/metal/weapon_impact_soft3.wav")
		self:SetBodygroup(self:FindBodygroupByName( "rockets" ),0)
	end
	weapon.OnThink = function( ent )
		if self:GetThrottle() > 0.3 then
			if self:GetAI() or IsValid(self:GetDriver()) then
				local AimAngles = self:GetAimAngles( ent, 3 )
				if self:GetAI() == false then
					if IsValid(self:GetDriver()) then
						if self:GetDriver():KeyDown( IN_BACK ) == true then 
							AimAngles.y = AimAngles.y * -1
						end
					end
				end
				self:SetPoseParameter("tank_steer", (AimAngles.y * 4) )
			end
		end
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/overheat.wav")
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Col = (ent:AngleBetweenNormal( ent:GetAimVector(), ent:GetForward() ) > 15) and COLOR_RED or COLOR_WHITE

		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen() 

		local base = ent:GetVehicle()
		base:PaintCrosshairCenter( Pos2D, Col )
		base:PaintCrosshairOuter( Pos2D, Col )
		base:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/spotlight.png")
	weapon.Ammo = -1
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 1
	weapon.StartAttack = function( ent )
		if self:GetSpotlightToggle() == true then
			self:SetSpotlightToggle(false)
		else
			self:SetSpotlightToggle(true)
		end
	end
	weapon.OnSelect = function( ent ) 
		ent:EmitSound("physics/metal/weapon_impact_soft3.wav") 
		self:SetBodygroup(self:FindBodygroupByName( "rockets" ),0)
	end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/missile.png")
	weapon.Ammo = 160
	weapon.Delay = 1
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0.08
	weapon.Attack = function( ent )

		ent.NumPrim = ent.NumPrim and ent.NumPrim + 1 or 1
		if ent.NumPrim > #ent.RocketPositions then ent.NumPrim = 1 end

		--if not ent:WeaponsInRange() then return true end
		local veh = ent:GetVehicle()
		local Driver = ent:GetDriver()

		local pod = ent:GetDriverSeat()

		if not IsValid( pod ) then return end

		local dir = ent:GetAimVector()

		local RurPos = ent.RocketPositions[ent.NumPrim]

		if ent:AngleBetweenNormal( dir, ent:GetForward() ) > 45 then return true end

		for i = 1, 15 do
			timer.Simple( (i / 7) * 0.75, function()
				if not IsValid( ent ) then return end

				if ent:GetAmmo() <= 0 then ent:SetHeat( 1 ) return end
	
				ent:TakeAmmo()
				local trace = ent:GetEyeTrace()
				local Start = RurPos
				local Dir = (ent:GetEyeTrace().HitPos - veh:LocalToWorld(Start)):GetNormalized()
				local projectile = ents.Create( "lvs_missile" )
				projectile:SetPos(veh:LocalToWorld(Start))
				projectile:SetAngles( Dir:Angle() )
				projectile:SetParent( )
				projectile:Spawn()
				projectile:Activate()

				projectile.GetTarget = function( missile ) return missile end
				projectile.GetTargetPos = function( missile )
					return missile:LocalToWorld( Vector(150,0,0) + VectorRand() * math.random(-10,10) )
				end

				projectile:SetAttacker( IsValid( Driver ) and Driver or self )
				projectile:SetEntityFilter( ent:GetCrosshairFilterEnts() )
				projectile:SetDamage( 350 )
				projectile:SetRadius( 250 )
				projectile:Enable()
				projectile:EmitSound( "LVS.TURUB.FIRE_MISSILE" )
				projectile:EmitSound( "LVS.TURUB.FLY_MISSILE" )
			end)
		end

		ent:SetHeat( 1 )
		ent:SetOverheated( true )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Col = (ent:AngleBetweenNormal( ent:GetAimVector(), ent:GetForward() ) > 45) and COLOR_RED or COLOR_WHITE

		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen() 

		local base = ent:GetVehicle()
		base:PaintCrosshairCenter( Pos2D, Col )
		base:PaintCrosshairOuter( Pos2D, Col )
		base:LVSPaintHitMarker( Pos2D )
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("weapons/shotgun/shotgun_cock.wav")
		self:SetBodygroup(self:FindBodygroupByName( "rockets" ),1)
	end
	self:AddWeapon( weapon )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Delay = 0.10
	weapon.Ammo = 1000
	weapon.Attack = function( ent )
        --if not ent:GetVehicle():WeaponsInRange( ent ) then return true end
		local pod = ent:GetDriverSeat()

		if not IsValid( pod ) then return end

		local dir = ent:GetAimVector()
		
		if ent:AngleBetweenNormal( dir, ent:GetForward() ) > 360 then return true end

		local trace = ent:GetEyeTrace()

		local veh = ent:GetVehicle()

		veh.SNDTail2:PlayOnce( 100 + math.Rand(-3,3), 1 )

		local ID_1 = self:LookupAttachment( "top_2" )
		local Muzzle1 = self:GetAttachment( ID_1 )
		
		local Pos = Muzzle1.Pos				

		local bullet = {}
		bullet.Src = Pos
		bullet.Dir = (trace.HitPos - bullet.Src):GetNormalized()
		bullet.Spread 	= Vector( 0.01,  0.01, 0.01 )
		bullet.TracerName = "lvs_laser_blue"
		bullet.Force = 10
		bullet.HullSize = 25
		bullet.Damage = 50
		bullet.Velocity = 10000
		bullet.Attacker = ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(0,0,255) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_impact", effectdata )
		end
		ent:TakeAmmo()
		ent:LVSFireBullet( bullet )
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("physics/metal/weapon_impact_soft3.wav")
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/overheat.wav")
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Col = (ent:AngleBetweenNormal( ent:GetAimVector(), ent:GetForward() ) > 360) and COLOR_RED or COLOR_WHITE

		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen() 

		local base = ent:GetVehicle()
		base:PaintCrosshairCenter( Pos2D, Col )
		base:PaintCrosshairOuter( Pos2D, Col )
		base:LVSPaintHitMarker( Pos2D )
	end
	weapon.OnThink = function( ent )
		if self:GetAI() or IsValid(self:GetGunnerSeat():GetDriver()) then
			local AimAngles = self:GetAimAngles( ent, 1 )

			local AimAnglesy = AimAngles.y -- 45 
			--[[
			if (AimAngles.y) < 0 then
				AimAnglesy = AimAngles.y + 45
			else 
				AimAnglesy = AimAngles.y - 45
			end]]


			self:SetPoseParameter("turret1_elevation", -AimAngles.p )
			self:SetPoseParameter("turret1_rotation", AimAnglesy )
		end
	end
	self:AddWeapon( weapon, 2 )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Delay = 0.15
	weapon.HeatRateUp = 0.4
	weapon.Ammo = 200
	weapon.HeatRateDown = 0.1
	weapon.Attack = function( ent )
        --if not ent:GetVehicle():WeaponsInRange( ent ) then return true end
		local pod = ent:GetDriverSeat()

		if not IsValid( pod ) then return end

		local dir = ent:GetAimVector()
		
		if ent:AngleBetweenNormal( dir, ent:GetForward() ) > 360 then return true end

		local trace = ent:GetEyeTrace()

		local veh = ent:GetVehicle()

		veh.SNDTail3:PlayOnce( 70 + math.Rand(-3,3), 1 )

		local ID_1 = self:LookupAttachment( "end_1" )
		local Muzzle1 = self:GetAttachment( ID_1 )
		
		local Pos = Muzzle1.Pos				

		
		local bullet = {}
		bullet.Src = Pos
		bullet.Dir = (trace.HitPos - bullet.Src):GetNormalized()
		bullet.Spread 	= Vector( 0.01,  0.01, 0.01 )
		bullet.TracerName = "lvs_laser_blue"
		bullet.Force = 10
		bullet.HullSize = 25
		bullet.Damage = 100
		bullet.SplashDamage	= 25
		bullet.SplashDamageRadius	= 250
		bullet.Velocity = 20000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(0,0,255) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_concussion_explosion", effectdata )
		end
		ent:TakeAmmo()
		ent:LVSFireBullet( bullet )
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("physics/metal/weapon_impact_soft3.wav")
	end
	weapon.OnThink = function( ent )
		if self:GetAI() or IsValid(self:GetSecondGunnerSeat():GetDriver()) then
			local AimAngles = self:GetAimAngles( ent, 2  )
			local AimAnglesy
			local AimAnglesp
			if AimAngles.y < 0 then
				AimAnglesy = (AimAngles.y + 180)
				AimAnglesp = (AimAngles.p + 35)
			else
				AimAnglesy = (AimAngles.y - 180)
				AimAnglesp = (AimAngles.p + 35)
			end
			self:SetPoseParameter("turret2_elevation", -AimAnglesp )
			self:SetPoseParameter("turret2_rotation", -AimAnglesy )
		end
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/overheat.wav")
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Col = (ent:AngleBetweenNormal( ent:GetAimVector(), ent:GetForward() ) > 360) and COLOR_RED or COLOR_WHITE

		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen() 

		local base = ent:GetVehicle()
		base:PaintCrosshairCenter( Pos2D, Col )
		base:PaintCrosshairOuter( Pos2D, Col )
		base:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon, 3 )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Delay = 0.10
	weapon.Ammo = 1000
	weapon.Attack = function( ent )
        --if not ent:GetVehicle():WeaponsInRange( ent ) then return true end
		local pod = ent:GetDriverSeat()

		if not IsValid( pod ) then return end

		local dir = ent:GetAimVector()
		
		if ent:AngleBetweenNormal( dir, ent:GetForward() ) > 80 then return true end

		local trace = ent:GetEyeTrace()
		
		local veh = ent:GetVehicle()

		veh.SNDTail:PlayOnce( 100 + math.Rand(-3,3), 1 )
		
		local bullet = {}
		bullet.Src = veh:LocalToWorld(  Vector(335,-0,300) )
		bullet.Dir = (trace.HitPos - bullet.Src):GetNormalized()
		bullet.Spread 	= Vector( 0.01,  0.01, 0.01 )
		bullet.TracerName = "lvs_laser_blue"
		bullet.Force	= 10
		bullet.HullSize = 25
		bullet.Damage	= 50
		bullet.Velocity = 30000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(0,0,255) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_impact", effectdata )
		end
		ent:TakeAmmo()
		ent:LVSFireBullet( bullet )
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("physics/metal/weapon_impact_soft3.wav")
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/overheat.wav")
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Col = (ent:AngleBetweenNormal( ent:GetAimVector(), ent:GetForward() ) > 80) and COLOR_RED or COLOR_WHITE

		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen() 

		local base = ent:GetVehicle()
		base:PaintCrosshairCenter( Pos2D, Col )
		base:PaintCrosshairOuter( Pos2D, Col )
		base:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon, 4 )
end

function ENT:CalcMainActivityPassenger( ply )

end


ENT.EngineSounds = {
	{
		sound = "turbo_tank/loop.wav",
		Pitch = 70,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 30,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
		SoundLevel = 110,
	},
	{
		sound = "turbo_tank/stop.wav",
		Pitch = 70,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 30,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
		SoundLevel = 70,
	},
	{
		sound = "turbo_tank/startup.wav",
		Pitch = 70,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 30,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
		SoundLevel = 70,
	},
	{
		sound = "turbo_tank/loop.wav",
		Pitch = 70,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 30,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
		SoundLevel = 100,
	},
	{
		sound = "turbo_tank/dist.wav",
		Pitch = 70,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 30,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		SoundLevel = 80,
	},
}

sound.Add{ {
	name = "LVS.TURUB.FIRE_MISSILE",
	channel = CHAN_WEAPON,
	volume = 6.0,
	level = 3000,
	pitch = 105,
	sound = "sound/turbo_tank/missile_launch.wav"
 } }

 sound.Add{ {
	name = "LVS.TURUB.FLY_MISSILE",
	volume = 8.0,
	level = 2000,
	pitch = 105,
	sound = "sound/turbo_tank/missile_flight.wav"
 } }

ENT.LAATC_PICKUPABLE = true
ENT.LAATC_DROP_IN_AIR = true
ENT.LAATC_PICKUP_POS = Vector(-350,0,-200)
ENT.LAATC_PICKUP_Angle = Angle(0,0,0)

--addons/ssrp_lfs/lua/entities/lvs_turret_ai_red/shared.lua:
ENT.Base = "lvs_base_turret"

ENT.PrintName = "Anti-Infantry Turret AI Red"
ENT.Author = "Luna"
ENT.Information = "Infantry Problem? Rotary laser cannon says 'Not Anymore.'"
ENT.Category = "[LVS] - Turrets (CIS)"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/antiinfantryturret/Anti-InfantryTurret.mdl"

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
		bullet.TracerName = "lvs_laser_red_short"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 20
		bullet.Velocity = 20000
		bullet.SplashDamage	= 20
		bullet.SplashDamageRadius	= 120
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(255,50,50) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_impact", effectdata )
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
end

ENT.DeathSound = "lvs/vehicles/generic_starfighter/crash.wav"
--addons/ssrp_lfs/lua/entities/lvs_turret_av_red/cl_init.lua:
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

--addons/ssrp_lfs/lua/entities/lvs_walker_atte/cl_prediction.lua:

function ENT:PredictPoseParamaters()
	local pod = self:GetTurretSeat()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if ply ~= plyL then return end

	self:SetPosTurret()
	self:SetPoseParameterTurret( pod:lvsGetWeapon() )
end
--addons/ssrp_lfs/lua/entities/lvs_walker_atte_rear.lua:
AddCSLuaFile()

ENT.Base = "lvs_walker_atte_component"

if SERVER then
	function ENT:Initialize()	
		self:SetModel( "models/blu/atte_rear.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )
		self:AddFlags( FL_OBJECT )
	end

	function ENT:Think()
		self:NextThink( CurTime() )
		return true
	end

	return
end

include("entities/lvs_walker_atte/cl_ikfunctions.lua")

function ENT:OnRemove()
	self:OnRemoved()
end
--addons/ssrp_lfs/lua/entities/lvs_walker_hsd/cl_prediction.lua:

function ENT:PredictPoseParamaters()
	local pod = self:GetDriverSeat()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if ply ~= plyL then return end

	self:AimTurretPrimary()
	self:AimTurretSecondary()
end
--MediaLib_DynFile_vimeo.lua:
local oop = medialib.load("oop")

local VimeoService = oop.class("VimeoService", "HTMLService")
VimeoService.identifier = "vimeo"

local all_patterns = {
	"https?://www.vimeo.com/([0-9]+)",
	"https?://vimeo.com/([0-9]+)",
	"https?://www.vimeo.com/channels/staffpicks/([0-9]+)",
	"https?://vimeo.com/channels/staffpicks/([0-9]+)",
}

function VimeoService:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local id = string.match(url, pattern)
		if id then
			return {id = id}
		end
	end
end

function VimeoService:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

local player_url = "http://wyozi.github.io/gmod-medialib/vimeo.html?id=%s"
function VimeoService:resolveUrl(url, callback)
	local urlData = self:parseUrl(url)
	local playerUrl = string.format(player_url, urlData.id)

	callback(playerUrl, {start = urlData.start})
end

function VimeoService:directQuery(url, callback)
	local urlData = self:parseUrl(url)
	local metaurl = string.format("http://vimeo.com/api/v2/video/%s.json", urlData.id)

	http.Fetch(metaurl, function(result, size, _headers, httpcode)
		if size == 0 then
			callback("http body size = 0")
			return
		end

		if httpcode == 404 then
			callback("Invalid id")
			return
		end

		local data = {}
		data.id = urlData.id

		local jsontbl = util.JSONToTable(result)

		if jsontbl then
			data.title = jsontbl[1].title
			data.duration = jsontbl[1].duration
		else
			data.title = "ERROR"
		end

		callback(nil, data)
	end, function(err) callback("HTTP: " .. err) end)
end

function VimeoService:hasReliablePlaybackEvents()
	return true
end

return VimeoService

--addons/!lpakr_out/lua/dash/thirdparty/medialib.service.youtubeplaylist.lua:
dash.IncludeSH'dash/thirdparty/medialib.core/ext/youtube-playlists.lua'
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/media_pvsradio.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/nbot_policedroid.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/nbot_sw_droid_b1.lua:
AddCSLuaFile()ENT.Base='drgbase_nextbot_droidbase'ENT.PrintName='B1 Battle Droid'ENT.Category='GM Hostile Nextbots'ENT.RagdollModel='models/tfa/comm/gg/npc_comb_sw_droid_b1.mdl'ENT.Models={'models/tfa/comm/gg/pm_sw_droid_b1.mdl'}DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/nbot_sw_training_droid_b2.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_baneback_spider.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_civilian.lua:
ENT.Base='drgbase_nextbot_human'ENT.PrintName='Civilian'ENT.Category='GM Friendly Nextbot'ENT.Factions={FACTION_REBELS}ENT.UseWalkframes=true;ENT.WeaponAccuracy=0.75;ENT.WeaponChance=1;ENT.Weapons={}ENT.WalkSpeed=60;ENT.FollowPlayers=true;ENT.SpawnHealth=5000;ENT.RagdollModel='models/player/humans/group01/male_02.mdl'ENT.Models={'models/player/group01/female_01.mdl','models/player/group01/female_02.mdl','models/player/group01/female_03.mdl','models/player/group01/female_04.mdl','models/player/group01/female_05.mdl','models/player/group01/female_06.mdl','models/player/group01/male_01.mdl','models/player/group01/male_02.mdl','models/player/group01/male_03.mdl','models/player/group01/male_04.mdl','models/player/group01/male_05.mdl','models/player/group01/male_06.mdl','models/player/group01/male_07.mdl','models/player/group01/male_08.mdl','models/player/group01/male_09.mdl'}function ENT:OnIdle()self:AddPatrolPos(self:RandomPos(2000))end;function ENT:OnReachedPatrol()self:Wait(math.random(3,15))end;function ENT:OnNewEnemy(a)end;AddCSLuaFile()DrGBase.AddNextbot(ENT)
--addons/!lpakr_out/lua/entities/npc_drg_colicoid.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_massassi.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_mutant_rancor.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/npc_drg_rakghoul.lua:
return lpakr()()
--addons/ssrp_tools_npc/lua/entities/npc_spawner.lua:
AddCSLuaFile()
DEFINE_BASECLASS 'base_anim'

ENT.PrintName   = 'SUP NPC Spawner'
ENT.Author      = 'Scott (STEAM_0:1:26675200)'
ENT.Information = 'Controls NPC Spawn Waves'
ENT.Category    = 'SUP Ents'
ENT.Editable    = false
ENT.Spawnable   = false
ENT.AdminOnly   = false
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize()
    if CLIENT then
        return
    end

    self:SetModel 'models/hunter/blocks/cube025x025x025.mdl'
    self:SetMaterial 'models/debug/debugwhite'
    self:SetColor(color_black)
    self:SetMoveType(MOVETYPE_NONE)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
    self:CreateRoutine()
    self:Reset(self:Enabled(), false)
end

function ENT:CreateRoutine()
    self.Routine = coroutine.create(function()
        self:SpawnWave()
    end)
end

function ENT:Reset(enabled, remove_npcs)
    if remove_npcs then
        self:RemoveNpcs()
        self.npcs = {}
    end

    self.waves   = 1
    self.enabled = enabled

    self:SetNetVar('npc_spawner.enabled', self.enabled)
    self:NextThink(CurTime() + 1)

    srp.notif.Neutral(self.PropOwner, 3, Format('NPC Spawner %i was %s', self:EntIndex(), enabled and 'enabled' or 'disabled'))
    return self.enabled
end

if SERVER then
    function ENT:Think()
        local now = CurTime()
        if not self.enabled then
            self:NextThink(now + 1)
            return true
        end

        if self.waves > self:GetWaves() then
            self:Reset(false, false)
            return true
        end

        local ok, completed = coroutine.resume(self.Routine)
        if not ok or completed then
            self.Routine = nil
            self:NextThink(now + self:GetWaveDelay())
            self.waves = self.waves + 1
            self:CreateRoutine()
            return true
        end

        self:NextThink(now)
        return true
    end
end

function ENT:SpawnWave()
    if not self.npcs then
        self.npcs = {}
    end

    local npc = list.Get('NPC')[self:GetNPC() or 'npc_zombie']
    local amount = self:GetWaveAmount()
    local weapon = self:GetWeapon()
    local range = self:GetRange()
    local proficiency = self:GetProficiency()
    local health = self:GetHP()
    local direction = Angle(0, self:GetAngles().y, 0)
    local i = 0

    while true do
        i = i + 1

        if hook.Run('PlayerSpawnNPC', self.PropOwner, npc) == false then
            coroutine.yield(true)
            break
        end

        local NPC = ents.Create(npc.Class)
        if not IsValid(NPC) then
            coroutine.yield(true)
            break
        end

        local rand1, rand2  = math.random(range - 50, range + 200), math.random(range - 50, range + 200)
        local pos = Vector(math.sin(i * 360) * rand1, math.cos(i * 360) * rand2, 0)

        NPC:SetPos(self:GetPos() + pos)
        NPC:SetAngles(direction)
        
        if npc.Model then
            NPC:SetModel(npc.Model)
        end

        NPC:Spawn()
        NPC:SetHealth(health)
        
        if not NPC:IsNextBot() then
            NPC:SetKeyValue('spawnflags', 8192)
            NPC:CapabilitiesAdd(CAP_AUTO_DOORS)
            NPC:CapabilitiesAdd(CAP_MOVE_SHOOT)
            NPC:CapabilitiesAdd(CAP_MOVE_JUMP)
            NPC:SetCurrentWeaponProficiency(proficiency or 0)
            NPC:DropToFloor()
        end

        if weapon and weapon ~= 'none' then
            NPC:Give(weapon)
        end

        NPC.spawner = true

        hook.Run('PlayerSpawnedNPC', self.PropOwner, NPC)
        table.insert(self.npcs, NPC)

        if i >= amount then
            coroutine.yield(true)
        else
            coroutine.wait(0.2)
        end
    end
end

function ENT:RemoveNpcs()
    if not self.npcs then
        return
    end

    for _, npc in pairs(self.npcs) do
        if IsValid(npc) then
            npc:Remove()
        end
    end
end

-- Convenience Functions
function ENT:GetNPC()
    return  self:GetNetVar('npc_spawner.npc')
            or "npc_zombie"
end

function ENT:GetWaves()
    return  self:GetNetVar('npc_spawner.waves')
            or 1
end

function ENT:GetWaveAmount()
    return  self:GetNetVar('npc_spawner.wave_amount')
            or 1
end

function ENT:GetWaveDelay()
    return  self:GetNetVar('npc_spawner.wave_delay')
            or 10
end

function ENT:GetRange()
    return  self:GetNetVar('npc_spawner.wave_range')
            or 50
end

function ENT:GetWeapon()
    return  self:GetNetVar('npc_spawner.weapon')
            or "none"
end

function ENT:GetProficiency()
    return  self:GetNetVar('npc_spawner.proficiency')
            or WEAPON_PROFICIENCY_AVERAGE
end

function ENT:GetHP()
    return  self:GetNetVar('npc_spawner.health')
            or 100
end

function ENT:GetPodMaxHP()
    return  self:GetNetVar('npc_spawner.podmaxhealth')
            or 20000
end

function ENT:Enabled()
    return self:GetNetVar('npc_spawner.enabled') == true
end

function ENT:IsOwned()
    if not self.owner then
        self.owner = self:GetNetVar('npc_spawner.owner')
        return self.owner == LocalPlayer()
    else
        return self.owner == LocalPlayer()
    end
end

local prof = {
   [0] =  "Poor",
    "Average",
    "Good",
    "Very Good",
    "Perfect"
}

local black = col.black:Copy()
black.a = 200

function ENT:Draw()
    local LP = LocalPlayer()
    if not IsValid(LP) or not self:IsOwned() then
        return
    end

    self:DrawModel()
    self:DrawInfoGraph(LP, Vector(0,0,60))
end

function ENT:DrawInfoGraph(LP, offset)
    local angle = (self:GetPos() - LP:GetPos()):Angle()
    angle.p = 0
    angle.y = angle.y + -90
    angle.r = angle.r + 90

    local npc = self:GetNPC()
    local wep = self:GetWeapon()
    local health = self:GetHP() .. " HP"
    local proficiency = prof[self:GetProficiency()] or prof[2]

    local waves = self:GetWaves() .. " wave(s)"
    local count = self:GetWaveAmount() .. " npc(s)"
    local delay = self:GetWaveDelay()  .. " second delay"

    local enabled = self:Enabled()

    cam.Start3D2D(self:GetPos() + offset, angle, .15)
        draw.Box(-100, -70, 200, 220, black)

        draw.DrawText("ID: " ..  self:EntIndex(), "default", 0, -60, enabled and col.green or col.red, TEXT_ALIGN_CENTER)
        draw.DrawText(enabled and "ENABLED" or "DISABLED", "default", 0, -45, enabled and col.green or col.red, TEXT_ALIGN_CENTER)

        draw.DrawText(proficiency, "default", 0, -15, col.white, TEXT_ALIGN_CENTER)
        draw.DrawText(npc, "default", 0, 0, col.white, TEXT_ALIGN_CENTER)
        draw.DrawText(wep, "default", 0, 15, col.white, TEXT_ALIGN_CENTER)
        draw.DrawText(health, "default", 0, 30, col.white, TEXT_ALIGN_CENTER)
        draw.DrawText("---------------------", "default", 0, 45, col.white, TEXT_ALIGN_CENTER)
        draw.DrawText(waves, "default", 0, 60, col.white, TEXT_ALIGN_CENTER)
        draw.DrawText(count, "default", 0, 75, col.white, TEXT_ALIGN_CENTER)
        draw.DrawText(delay, "default", 0, 90, col.white, TEXT_ALIGN_CENTER)
    cam.End3D2D()
end
--addons/!lpakr_out/lua/entities/particlecontroller_normal.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/particlecontroller_proj.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_00.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_04.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Fire Trail"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]flametrail"
--addons/!lpakr_out/lua/entities/pfx1_06~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Flamethrower 1 [Large]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]flamethrower_large"
--addons/!lpakr_out/lua/entities/pfx1_08.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx1_08_.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Fire [Red]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]_campfire_red"
--addons/!lpakr_out/lua/entities/pfx1_08_l.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Large Fire [Green]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]_large_campfire_green"
--addons/!lpakr_out/lua/entities/pfx1_08_~a_l.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Large Fire [Purple]"ENT.Category="PPE: Fire & Smoke"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[1]_large_campfire_purple"
--addons/!lpakr_out/lua/entities/pfx1_08~_l.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx2_02.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx2_06~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Dripping blood [Alien]"ENT.Category="PPE: Other"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[2]blood_leak_alien"
--addons/!lpakr_out/lua/entities/pfx4_01~.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Blue Jet [Smokeless]"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_b*"
--addons/!lpakr_out/lua/entities/pfx4_02.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Red Jet"ENT.Category="PPE: Tech"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[4]jet_r"
--addons/!lpakr_out/lua/entities/pfx4_09.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx4_0a.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx5_00.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Black Hole"ENT.Category="PPE: Cosmic"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[5]black_hole"
--addons/!lpakr_out/lua/entities/pfx5_00_alt_ss.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Micro Alt Black Hole"ENT.Category="PPE: Cosmic"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[5]black_hole_mmicro_b"
--addons/!lpakr_out/lua/entities/pfx5_00_s.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Small Black Hole"ENT.Category="PPE: Cosmic"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[5]black_hole_micro"
--addons/!lpakr_out/lua/entities/pfx6_01.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/pfx8_02.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Magic Flame 2"ENT.Category="PPE: Magic"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[8]magic_flame"
--addons/!lpakr_out/lua/entities/pfx8_03_alt.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Green Portal"ENT.Category="PPE: Magic"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[8]magic_portal*"
--addons/!lpakr_out/lua/entities/pfx8_07.lua:
AddCSLuaFile()ENT.Type="anim"ENT.Base="pfx_base"ENT.PrintName="Frostbeam"ENT.Category="PPE: Magic"ENT.Spawnable=true;ENT.AdminOnly=false;ENT.pfxname="[8]frostbeam"
--addons/!lpakr_out/lua/entities/proj_drg_default/meta.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/proj_drg_plasma.lua:
if!DrGBase then return end;ENT.Base="proj_drg_default"ENT.PrintName="Plasma Ball"ENT.Category='GM Hostile Nextbots'ENT.AdminOnly=true;ENT.Spawnable=true;ENT.Gravity=false;ENT.Physgun=false;ENT.Gravgun=true;ENT.OnContactDecals={"Scorch"}ENT.LoopSounds={}ENT.OnContactSounds={"weapons/stunstick/stunstick_fleshhit1.wav"}ENT.OnRemoveSounds={}ENT.AttachEffects={"drg_plasma_ball"}ENT.OnContactEffects={}ENT.OnRemoveEffects={}
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_ammobox.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_artilleryshell_smoke.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='rp_artilleryshell'ENT.PrintName='Smoke Mortar Shell'ENT.Category='SUP'ENT.Spawnable=true;ENT.DoNotDuplicate=true;ENT.Interactive=true;ENT.SmokeColor=Color(255,255,255)ENT.SmokeColor2=Color(255,255,255)ENT.Range=400;local a=Vector(0,0,1)function ENT:DoExplosionEffect(b)local c=self.LandingPos||b.HitPos;util.ScreenShake(c,100,100,2,500)self:CreateSmoke(self.SmokeColor,self.SmokeColor2,250,0.15,100,5)self:EmitSound('ambient/fire/ignite.wav',100,100,1)util.Decal('Splash.Large',c+a*4,c-a*6)return 35 end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_artilleryshell_smoke_green.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_aura/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bomb_normal.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_bookshelf.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_building/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_bus/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/rp_casinotable/cl_init.lua:
include'shared.lua'local a=Material'materials/galactic/ui/casino/deck/carddeck_black.png'local b=Vector()local c=64;local d=64;local e=casino.Col.midnight;e.a=200;function ENT:Initialize()self.Initialized=true;self:Clear()end;function ENT:Clear()self.HouseHand={}self.Hands={}end;function ENT:OnStatusChanged(f,g,...)self:Call(self,g,...)if IsValid(self.MenuAction)then self:Call(self.MenuAction,g,...)elseif IsValid(self.MenuJoin)then self:Call(self.MenuJoin,g,...)end end;function ENT:OnPlayerSync()self:OpenJoinMenu()end;function ENT:OnPlayerDesync()self:OnRemove()end;function ENT:OnPlayerReady(h)self:OpenActionMenu(h)if h>0 then self:EmitSound(casino.Sounds.Wager,100,100,1,CHAN_AUTO)end end;function ENT:OnPlayerWon()self:EmitSound(casino.Sounds.Win,100,100,1,CHAN_AUTO)end;function ENT:OnPlayerLost()self:EmitSound(casino.Sounds.Loss,100,100,1,CHAN_AUTO)end;function ENT:OnPlayerUnReady()if self.Casino.wagers then self:OpenJoinMenu()else timer.Simple(0,function()RunConsoleCommand'+use'timer.Simple(.16,function()RunConsoleCommand'-use'end)end)end end;function ENT:OnRoundStarted()self:Clear()end;function ENT:OnCardsAdded(i,j,k)if i then table.Add(self.HouseHand,k)else self.Hands[j]=self.Hands[j]||{}table.Add(self.Hands[j],k)end end;function ENT:OpenJoinMenu()self:CloseJoinMenu()self:CloseActionMenu()if!self.Casino.wagers then self:OpenActionMenu()return end;local l=self.SeatTransforms[self.Casino.MyPosition||-1]ui.Create('rp_casino_join',function(m)m:Populate(self,l&&l.ui)self.MenuJoin=m end)end;function ENT:CloseJoinMenu()if IsValid(self.MenuJoin)then self.MenuJoin:Remove()end end;function ENT:OpenActionMenu(h)if IsValid(self.MenuAction)then self.MenuAction:Remove()end;self:CloseJoinMenu()local l=self.SeatTransforms[self.Casino.MyPosition||-1]ui.Create('rp_casino_action',function(m)m:Populate(self,h,l&&l.ui)self.MenuAction=m end)end;function ENT:CloseActionMenu(n)if IsValid(self.MenuAction)then self.MenuAction:Remove()end end;function ENT:OnRemove()self:CloseJoinMenu()self:CloseActionMenu()self:Clear()end;function ENT:Think()if!self.Initialized then self:Initialize()end end;function ENT:DrawHouseView()local o,p=self:LocalToWorld(self.HouseView.pos),self:LocalToWorldAngles(self.HouseView.ang)local q=self:GetTimeout()local r=q-CurTime()cam.Start3D2D(o,p,self.HouseView.scale)local s=math.max(3,#self.HouseHand)*c+0;local t=-(s/2)draw.RoundedBox(6,-150,-50,300,s==0&&120||200,e)draw.SimpleText(self.PrintName||self.GameID,'ui.28',0,-20,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)draw.SimpleText(self:GetDescription(),'ui.16',0,0,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)if r>0 then draw.SimpleText((self:GetStatus()||'')..' '..string.NiceTime(r),'ui.20',0,30,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)else draw.SimpleText(self:GetStatus()||'','ui.20',0,30,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;local u=3;for v,w in ipairs(self.HouseHand)do surface.SetMaterial(w.icon)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(t,60,c,d)t=t+c;u=u-1 end;if u>0 then for v=1,u do surface.SetMaterial(a)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect(t,60,c,d)t=t+c end end;cam.End3D2D()end;function ENT:Draw(x)self:DrawModel(x)if self.HouseView then self:DrawHouseView()end end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_cloakdevice/cl_init.lua:
include'shared.lua'function ENT:Draw()local a=self:GetParent()if!IsValid(a)||a:GetRenderMode()==RENDERMODE_NONE then return end;if!(a==LocalPlayer()&&!isThirdPerson())&&!a:IsCloaked()then self:DrawModel()else return end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_collectable/cl_init.lua:
include'shared.lua'function ENT:Think()local a=self:GetID()if!a||a==''then return end;if a!=self.StoreID then self.StoreID=self:GetID()self:SetupCollectable(a)end;if self.StoreID&&self:GetCount()!=self.StoreCount then self.StoreCount=self:GetCount()self:UpdateVisibles()end end;function ENT:UpdateVisibles()self.VisibleEnts=self.VisibleEnts||{}self.VisibleResources=self.VisibleResources||{}local b=math.ceil(#self.VisibleResources*self:GetCount()/self:GetMaxCount())for c,d in pairs(self.VisibleEnts)do if IsValid(d)then d:Remove()end end;for e=1,#self.VisibleResources do if e>b then continue end;local f=self.VisibleResources[e]local d=ents.CreateClientProp(f.model)if!IsValid(d)then return end;d:SetMoveType(MOVETYPE_NONE)d:SetCollisionGroup(COLLISION_GROUP_DEBRIS)d:SetParent(self)d:SetLocalPos(f.pos)d:SetLocalAngles(f.ang)d:Spawn()self.VisibleEnts[e]=d end end;local g=20;function ENT:DrawInteraction(h,i,j)if self:GetNoDraw()then return end;surface.SetFont('ui_header.s')surface.SetDrawColor(255,255,255,255)surface.SetMaterial(h.OnPickup)surface.SetTextColor(255,255,255,255)local k=self.InteractionName||''local l,m=surface.GetTextSize(k)l=l+g+4;local n,o=j.x,j.y;surface.DrawTexturedRect(n,o,g,g)surface.SetTextPos(n+g+2,o-2)surface.DrawText(k)end;function ENT:OnRemove()if self.VisibleEnts then for c,d in pairs(self.VisibleEnts)do if IsValid(d)then d:Remove()end end end end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_container/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_crafting_civilian.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_deployable_box.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='base_srp'ENT.PrintName='Deployable Box'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.DoNotDuplicate=true;ENT.Interactive=true;ENT.Model=Model('models/props/campcrate2.mdl')ENT.UIPosition=Vector(6,-2,3)ENT.UIAngle=Angle(-45,90,90)ENT.UIFont='ui_starwars.xxl'ENT.Cooldown=10;ENT.DeployableBox=true;ENT.DeployableUse=true;ENT.DeployableAutomatic=true;ENT.DeployableAutomaticRange=500;function ENT:SetupDataTables()self:NetworkVar('Float',0,'NextUse')self:NetworkVar('Bool',1,'IsPayingOut')end;function ENT:Initialize()self:SetModel(self.Model)end;function ENT:CanUse(a)return!a:IsEventCharacter()end;function ENT:Use(a)if!self.DeployableUse then return end;if!a:CanUse(a)then return end;if self:GetNextUse()>CurTime()then return end;a:GiveItem()a:EmitSound'items/ammocrate_close.wav'self:SetNextUse(CurTime()+self.Cooldown)end;function ENT:GiveItem(a)end;function ENT:Think()self:SetNextThink(CurTime()+self.Cooldown)self:SetNextUse(CurTime()+self.Cooldown)if!self.Deployed then self.Deployed=true;return true end;for b,c in ipairs(ents.FindInSphere(self:GetPos(),self.DeployableAutomaticRange))do if IsValid(c)&&c:IsPlayer()&&self:CanUse(c)then self:GiveItem(c)end end;return true end;function ENT:Draw(d)self:DrawModel(d)cam.Start3D2D(self:LocalToWorld(self.UIPosition),self:LocalToWorldAngles(self.UIAngle),.05)draw.SimpleText(self.PrintName,self.UIFont,0,0,col.blue,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)cam.End3D2D()end;local e='Collect Ammo'local f=20;function ENT:DrawInteraction(g,h,i)surface.SetFont('ui_header.s')surface.SetDrawColor(255,255,255,255)surface.SetMaterial(g.OnPickup)surface.SetTextColor(255,255,255,255)local j,k=surface.GetTextSize(e)j=j+f+4;local l,m=i.x,i.y;surface.DrawTexturedRect(l,m,f,f)surface.SetTextPos(l+f+2,m)surface.DrawText(e)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_eventplatform/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_eventplatform/shared.lua:
ENT.PrintName='Platform Block'ENT.Author='Scott'ENT.Contact='STEAM_0:1:2665200'ENT.Purpose=''ENT.Instructions=''ENT.Type='anim'ENT.Base='base_anim'ENT.Category='SUP Development'ENT.Spawnable=info.Dev;ENT.RenderGroup=RENDERGROUP_OPAQUE;ENT.Model=Model'models/hunter/blocks/cube075x075x025.mdl'ENT.Material='models/debug/debugwhite'ENT.DoNotDuplicate=true;ENT.IgnoreNoGrav=true;ENT.Colors={Color(224,187,228),Color(254,200,216),Color(175,214,247),Color(180,206,179),Color(228,216,185)}function ENT:SetupDataTables()self:NetworkVar('Bool',0,'Bomb')end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_firingrange_orb.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_fob.lua:
AddCSLuaFile()ENT.Base='rp_building'ENT.PrintName='Forward Output'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.Model='models/hunter/blocks/cube025x025x025.mdl'ENT.GUIOffset=Vector(0,0,425)ENT.GUIAngle=Angle(0,90,90)ENT.SpawnZoneRange=1000;ENT.Locations={{model='models/galactic/me3fix/n7_mi_floor_cap_4x1.mdl',pos=Vector(-375,-240,0),ang=Angle(0,-45,0),floor=true},{model='models/galactic/me3fix/n7_mi_floor_cap_4x1.mdl',pos=Vector(-375,240,0),ang=Angle(0,45,0),floor=true},{model='models/galactic/me3fix/n7_mi_floor_cap_4x1.mdl',pos=Vector(385,-240,0),ang=Angle(0,45,0),floor=true},{model='models/galactic/me3fix/n7_mi_floor_cap_4x1.mdl',pos=Vector(365,200,0),ang=Angle(0,-45,0),floor=true},{model='models/galactic/me3fix/n7_mi_floor_cap_corner.mdl',pos=Vector(583,110,0),ang=Angle(0,135,0),floor=true},{model='models/starwars/syphadias/props/sw_tor/bioware_ea/props/republic/rep_tent_large.mdl',pos=Vector(),ang=Angle(0,0,0),scale=0.85},{model='models/starwars/syphadias/props/sw_tor/bioware_ea/props/imperial/imp_holo_table.mdl',pos=Vector(0,0,0),ang=Angle(0,0,0),scale=0.75}}function ENT:SpawnExtras()self.extras={}self:SetColor(self.allegiance:GetColor()||col.white)for a=1,#self.Locations do local b=self.Locations[a]local c=ents.Create'prop_physics'c:SetModel(b.model)c:SetMoveType(MOVETYPE_NONE)c:SetParent(self)c:SetLocalPos(b.pos)c:SetLocalAngles(b.ang||Angle())c:Spawn()if b.scale then c:SetModelScale(b.scale)c:Activate()end;local d=c:GetPhysicsObject()if IsValid(d)then d:EnableMotion(false)end;table.insert(self.extras,c)end end;function ENT:DespawnExtras()if self.extras then for e,f in ipairs(self.extras)do if IsValid(f)then f:Remove()end end end end;function ENT:OnCreated()self:SpawnExtras()local g=srp.npc.Create'MUNITIONS'if IsValid(g)then g:SetParent(self)g:SetLocalPos(Vector(0,-240,0))g:SetLocalAngles(Angle(0,90,0))self:DeleteOnRemove(g)end;local h=ents.Create'rp_armoury'if IsValid(h)then h:SetParent(self)h:SetLocalPos(Vector(0,185,0))h:SetLocalAngles(Angle(0,-90,0))h:Spawn()self:DeleteOnRemove(h)end;srp.spawn.AddCustomPoint('FOB #'..self:EntIndex(),self.allegianceid,{cooldown=180,textcolor=col.yellow:Copy(),outline=col.yellow:Copy(),pos=self:GetPos()+self:GetForward()*100,ang=Angle(0,180,0),ent=self,spawnrange=self.SpawnZoneRange,canuse=function(i,j)return true end})end;function ENT:OnDestroyed()srp.spawn.RemoveCustomPoint('FOB #'..self:EntIndex())self:DespawnExtras()end;function ENT:Draw()self:DrawModel()local k=self:GetColor()||col.white;cam.Start3D2D(self:LocalToWorld(self.GUIOffset),self:LocalToWorldAngles(self.GUIAngle),.8)draw.DrawText('FOB #'..self:EntIndex(),'ui_header.xl',0,0,k,TEXT_ALIGN_CENTER)cam.End3D2D()end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_comms.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_life.lua:
AddCSLuaFile()ENT.Base="rp_funcmodule"ENT.Type="anim"ENT.Spawnable=info.Dev;ENT.Category='SUP'ENT.PrintName="Life Support"ENT.DisplayName="Life\nSupport"ENT.MaxHealth=10000;ENT.Model=Model'models/props/console4.mdl'ENT.Activated=true;ENT.UIPosition=Vector(14,0,35)ENT.UIAngle=Angle(0,90,60)ENT.UIScale=.05;ENT.CanDisable=false;ENT.InteractionRange=200;ENT.CanDisable=true;function ENT:OnStartup()self:CheckLS()end;function ENT:OnShutdown()self:CheckLS()end;function ENT:OnSystemFailure()self:CheckLS()end;function ENT:CheckLS()if self:GetActivated()then srp.funcmodules.RemoveWarning('oxygen')srp.funcmodules.EnableOxygen()else srp.funcmodules.DisplayWarning('oxygen')srp.funcmodules.DisableOxygen()end end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_funcmodule_shields.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/rp_grenade_frag.lua:
AddCSLuaFile()ENT.Base='rp_grenade'ENT.PrintName='Frag Grenade'ENT.Spawnable=false;ENT.WorldModel='models/weapons/w_eq_flashbang.mdl'ENT.ExplosionTime=3;ENT.FreezeMotion=false;ENT.WorldMaterial='models/weapons/v_models/grenades/virus_grenade'ENT.ViewMaterial='models/weapons/v_models/grenades/virus_grenade'ENT.Impact=false;ENT.Range=250;ENT.Damage=400;function ENT:Explode()end
--addons/!lpakr_out/lua/entities/rp_grenade_sticky.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_hyperspace/cl_init.lua:
include'shared.lua'local a=Color(25,75,255)local b=Color(55,200,75)local c=Color(200,50,50)ENT.Color=a;ENT.UIPosition=Vector(-20,0,1)ENT.UIAngle=Angle(0,90,0)local d=CreateMaterial('bridge_scanlines','UnlitGeneric',{['$basetexture']='dev/dev_scanline',['$translucent']=1,['$additive']=1,['$vertexcolor']='1',['$vertexalpha']='1',['$opacity']='.3',['Proxies']={['TextureScroll']={['texturescrollvar']='$baseTextureTransform',['texturescrollrate']=.2,['texturescrollangle']=-90}}})function ENT:Initialize()self.Initialized=true;self.Status='Realspace'self.StartTime=CurTime()hook('OnBridgeStatusUpdated',self,self.UpdateButtonInfo)end;function ENT:UpdateButtonInfo(e,f)if e:find('_')then return end;if self.StartTime&&CurTime()-self.StartTime<15 then self.Alert=true end;self.StartTime=f||CurTime()if e!='Hyperspace'&&e!='Nothing'then self.Status='Planet '..e;self.Color=b else self.Status=e=='Nothing'&&'Realspace'||'Hyperspace'self.Color=a end end;function ENT:Think()if!self.Initialized then self:Initialize()self.Think=function()end end end;function ENT:Draw()if self.Alert&&CurTime()-self.StartTime>15 then self.Alert=false end;render.SetColorMaterial()render.DrawBox(self:GetPos(),self:GetAngles(),self:OBBMins()-Vector(1,1,1),self:OBBMaxs()+Vector(1,1,1),col.black)local g=self:LocalToWorld(self.UIPosition)local h=self:LocalToWorldAngles(self.UIAngle)local i=ba.str.FormatTime(CurTime()-(self.StartTime||0))local j=math.sin(CurTime()+5)>0;cam.Start3D2D(g,h,.15)draw.Box(-80,-44,160,35,col.white)draw.DrawText('Hyperspace Status','ui_header.r',0,-40,col.black,TEXT_ALIGN_CENTER)draw.DrawText(self.Status||'Realspace','ui_header.xl',0,60,col.white,TEXT_ALIGN_CENTER)draw.DrawText(i,'ui_header.xl',0,120,col.white,TEXT_ALIGN_CENTER)if self.Alert then c.a=j&&255||50;draw.Box(-210,230,420,35,c)draw.DrawText('EMERGENCY ENGAGEMENT','ui_header.l',0,225,col.white,TEXT_ALIGN_CENTER)end;cam.End3D2D()render.SetMaterial(d)render.DrawBox(self:GetPos(),self:GetAngles(),self:OBBMins(),self:OBBMaxs(),self.Color||a)end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_incubator.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='base_srp'ENT.Category='SUP'ENT.PrintName='Incubator'ENT.Author='Scott (STEAM_0:1:26675200)'ENT.Information=''ENT.Editable=false;ENT.Spawnable=true;ENT.AdminOnly=false;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.NetworkPlayerUse=true;ENT.Model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/props/imperial/imp_guard_post.mdl'ENT.UIWidth=400;ENT.UIHeight=400;ENT.UIPos=Vector(10,-20,70)ENT.UIAng=Angle(0,90,90)ENT.UIScale=.1;ENT.UIEggMaterialSize=128;local a=Material'materials/galactic/seasonal/easter/egg.png'local b=Material'galactic/seasonal/easter/hatch_1.png'function ENT:Initialize()self:SetModel(self.Model)end;function ENT:ClientPlayerUse()if srp.incubator.CanClaim()then srp.incubator.Claim()elseif!srp.incubator.status then srp.incubator.OpenMenu()else srp.incubator.Upgrade()end end;function ENT:UpdateTransmitState()return TRANSMIT_ALWAYS end;local function c(d)local e=math.floor(d/3600)local f=math.floor(d%3600/60)local g=math.floor(d-e*3600-f*60)if f<10 then f='0'..f end;if g<10 then g='0'..g end;return e..':'..f..':'..g end;function ENT:Draw()self:DrawModel()local h,i=self.UIWidth,self.UIHeight;local j,k=self.UIEggMaterialSize,self.UIEggMaterialSize;local l=srp.incubator.status;local m=l&&l.endTime<os.time()local n,o,p,q=srp.incubator.GetRunningTime()local r=l&&math.Clamp(q/p,0,1)||0;cam.Start3D2D(self:LocalToWorld(self.UIPos),self:LocalToWorldAngles(self.UIAng),self.UIScale)draw.NoTexture()surface.SetDrawColor(0,0,0,200)surface.DrawArc(h*0.5,i*0.5,0,h*.4,0,360,60)surface.SetDrawColor(150,150,150,150)surface.DrawArc(h*0.5,i*0.5,h*.4-15,h*.4,0,360,60)surface.SetDrawColor(m&&col.green_light||col.white)surface.DrawArc(h*0.5,i*0.5,h*.4-15,h*.4,-90,-90+360*(m&&1||r),60)if l then draw.SimpleText(m&&'Claim'||'Incubating','ui_header.l',h/2,i*.25,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)if!m then draw.SimpleText(c(q||0),'ui_header.l',h/2,i*.75,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end;surface.SetMaterial(m&&b||a)surface.SetDrawColor(255,255,255,255)surface.DrawTexturedRect((h-j)/2,(i-k)/2,j,k)else draw.SimpleText('Incubator','ui_header.l',h/2,i*.25,col.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)surface.SetMaterial(a)surface.SetDrawColor(255,255,255,25)surface.DrawTexturedRect((h-j)/2,(i-k)/2,j,k)end;cam.End3D2D()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_itemofinterest.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_itemofinterest.lua:
AddCSLuaFile()ENT.Type='anim'ENT.Base='base_anim'ENT.PrintName='Item of Interest'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.DoNotDuplicate=true;ENT.Model=Model'models/starwars/syphadias/props/sw_tor/bioware_ea/props/imperial/imp_cantina_holopad.mdl'ENT.Interactive=true;ENT.InteractionName='Inspect Item'ENT.InteractionColor=Color(200,50,50)ENT.InteractionDuration=4;ENT.InteractionRange=500;function ENT:Initialize()self:SetModel(self.Model)end;function ENT:Use(a)if self.InUse&&self.NextCooldown&&self.NextCooldown>CurTime()then return end;self:OnInteract(a)end;function ENT:OnInteract(a)self.InUse=true;self.NextCooldown=CurTime()+1;srp.interaction.Start(a,'Inspecting',self.InteractionColor,self.InteractionDuration,self.InteractionRange,function(b,a,c)self.InUse=false;if c&&IsValid(self)&&IsValid(a)then self:DoCollection(a)hook.Run('OnItemOfInterestPickedUp',self,a)end end)end;function ENT:DoCollection(a)self:Remove()end;local d=18;function ENT:DrawInteraction(e,f,g)surface.SetFont'ui_header.s'surface.SetDrawColor(255,255,255,255)surface.SetMaterial(e.OnPickup)surface.SetTextColor(255,255,255,255)local h=self.InteractionName;local i,j=surface.GetTextSize(h)i=i+d+4;local k,l=g.x,g.y;surface.DrawTexturedRect(k,l,d,d)surface.SetTextPos(k+d+2,l-2)surface.DrawText(h)end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_laserbolt/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_laserbolt/shared.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_lava/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_pocketrocket/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_routebuttons/cl_init.lua:
include'shared.lua'function ENT:OnRemove()end;function ENT:Draw()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_routebuttons/shared.lua:
ENT.PrintName='Button Access'ENT.Author='Scott'ENT.Contact='STEAM_0:1:26675200'ENT.Base='rp_routebeacon'ENT.Model=Model'models/hunter/blocks/cube3x3x05.mdl'ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Spawnable=info.Dev;ENT.DoNotDuplicate=true;ENT.DontFreeze=true
--addons/!lpakr_out/lua/entities/rp_satchel/shared.lua:
ENT.Type='anim'ENT.Base='base_anim'ENT.PrintName='Satchel'ENT.Author='Scott'ENT.Spawnable=true;ENT.Category='SUP Weapons'ENT.AutomaticFrameAdvance=true;ENT.RenderGroup=RENDERGROUP_BOTH;ENT.Model=Model'models/weapons/w_slam.mdl'ENT.Min=Vector(-6,-6,-2)ENT.Max=Vector(6,6,2)ENT.IsSatchel=true;ENT.Damage=100;ENT.DamageRadius=100;ENT.MaxFrequency=250;ENT.PlaceSound='det_placed'ENT.UIPosition=Vector(-2,0,2)ENT.UIAngle=Angle(0,90,0)function ENT:SetupDataTables()self:NetworkVar('Bool',0,'Activated')self:NetworkVar('Int',0,'Frequency')end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_shieldray.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_simroom_waves/shared.lua:
ENT.Type='anim'ENT.Base='base_srp'ENT.PrintName='Simroom Wave Manager'ENT.Category='SUP'ENT.Spawnable=info.Dev;ENT.DoNotDuplicate=true;ENT.Interactive=true;ENT.Model=Model'models/props/swdatapad.mdl'ENT.IsSimroomSpawner=true;ENT.UIPosition=Vector(6,-2,3)ENT.UIAngle=Angle(-45,90,90)ENT.UIFont='ui_starwars.xl'ENT.NetworkPlayerUse=true;ENT.RequiredPermission='broadcast'ENT.Interactive=true;ENT.InteractiveMaterialSize=20;ENT.InteractionName='Configure Simroom'ENT.RenderGroup=RENDERGROUP_TRANSLUCENT;function ENT:SetupDataTables()self:NetworkVar('Int',3,'SimRoom')self:NetworkVar('Bool',0,'Running')self:NetworkVar('Int',0,'Wave')self:NetworkVar('Int',1,'Waves')self:NetworkVar('Int',2,'Spawns')if CLIENT then self:NetworkVarNotify('Running',function(a,b,c,d)hook.Run('OnSimroomStatusChanged',self,d)end)end end;function ENT:CanUse(e)if!srp.HasActivePlayers()then return false end;local f=e:GetGroupRank()return f&&f:HasPermission(self.RequiredPermission)||e:IsTrialGamemaster()end
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_steps.lua:
return lpakr()()
--addons/!lpakr_out/gamemodes/starwarsrp/entities/entities/rp_trader_ship.lua:
AddCSLuaFile()ENT.Base='base_anim'ENT.Type='anim'ENT.Spawnable=info.Dev;ENT.Category='SUP'ENT.PrintName='Trader Ship'ENT.MaxHealth=3000;ENT.Model=Model'models/props/vhp4.mdl'ENT.IgnoreNoGrav=true;ENT.Interactive=true;ENT.DoNotDuplicate=true;ENT.Thrusters={{Position=Vector(-129,-105,79),Angle=Angle()},{Position=Vector(-129,105,79),Angle=Angle()}}function ENT:Initialize()self:SetModel(self.Model)end;function ENT:SetupTransform(a,b)self.Origin=a;self.OriginAngles=b;self:SetPos(a)self:SetAngles(b)end;function ENT:Use(c)end;function ENT:AnimateShip()if self.Origin then self:SetPos(self.Origin+Vector(math.cos(RealTime()*1)*5,math.sin(RealTime()*1)*1.5,math.cos(RealTime()*1)*1.5))self:SetAngles(self.OriginAngles+Angle(math.cos(RealTime()*.2)*2,math.cos(RealTime()*.5)*1.5,math.cos(RealTime()*.75)*5))end end;local d=Vector(0,0,1)function ENT:DrawDust()if!self:InSight()then return end;if self.NextEffect&&self.NextEffect>CurTime()then return end;local e=util.TraceLine({start=self:GetPos(),endpos=self:GetPos()-self:GetUp()*23,filter=self})if e.HitWorld then local f=EffectData()local g=EffectData()g:SetStart(e.HitPos)g:SetOrigin(e.HitPos)g:SetNormal(d)g:SetScale(math.random(100,150))g:SetMagnitude(.5)util.Effect('ThumperDust',g,true,true)end;self.NextEffect=CurTime()+.2 end;function ENT:Draw()self:DrawModel()self:DrawDust()end
--addons/!lpakr_out/gamemodes/srp_base/entities/entities/rp_trivia/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/witcher_door/shared.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/wos_lightning_coil/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/wos_sonic_discharge/cl_init.lua:
return lpakr()()
--addons/!lpakr_out/lua/entities/wos_sonic_discharge/cl_init.lua:
include('shared.lua')function ENT:Initialize()end;function ENT:CreateBoom()end;function ENT:OnRemove()end;function ENT:Think()end;function ENT:Draw()end
--addons/!lpakr_out/lua/entities/wos_sonic_discharge/shared.lua:
ENT.Type="anim"ENT.Base="base_anim"
--addons/!lpakr_out/lua/effects/anzati_proton/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=1;if!f then return end;for h=0,d/g do local i=b+c*(d-h*g)local j=f:Add("wos/lightsabers/effects/anzati/proton",i)if j then j:SetLifeTime(0)j:SetDieTime(0.3)j:SetGravity(Vector(0,0,math.random(32,128)))j:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(math.random(100,200))j:SetEndAlpha(0)j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/anzati_swtor2/init.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=a:GetNormal()local d=a:GetRadius()local e=a:GetAngles()local f=ParticleEmitter(b)local g=1;if!f then return end;for h=0,d/g do local i=b+c*(d-h*g)local j=f:Add("wos/lightsabers/effects/anzati/swtor2",i)if j then j:SetLifeTime(0)j:SetDieTime(0.3)j:SetGravity(Vector(0,0,math.random(32,128)))j:SetVelocity(Vector(math.random(-8,8),math.random(-8,8),math.random(-8,8)))j:SetStartSize(1)j:SetEndSize(0)j:SetStartAlpha(math.random(100,200))j:SetEndAlpha(0)j:SetColor(e.p,e.y,e.r)j:SetAngleVelocity(Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)))end end;f:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/gamemodes/srp_base/entities/effects/effect_valentine_explosive.lua:
local a=Material('galactic/seasonal/valentines/heart.png')function EFFECT:Init(b)local c=b:GetMagnitude()local d=math.random(4,6)local e=b:GetScale()if c==0 then c=math.random(100,250)end;if e==0 then e=60 end;local f=b:GetOrigin()local g=ParticleEmitter(f)if!g then return end;for h=1,c do local i=g:Add(a,f+Vector(math.random(-16,16),math.random(-16,16),0))if i then i:SetDieTime(e)i:SetGravity(Vector(0,0,0))i:SetVelocity(Vector(math.random(-25,25),math.random(-25,25),math.random(-35,35)))i:SetStartSize(math.random(0,2))i:SetEndSize(d)i:SetStartAlpha(50)i:SetEndAlpha(255)i:SetColor(255,255,255)i:SetBounce(5)i:SetRoll(math.random(-.5,.5))end end;g:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/fireworks_america.lua:
local a=Material'materials/galactic/seasonal/july4th/eagle_america.png'local b=Material'materials/galactic/seasonal/july4th/eagle_flying.png'local c=Material'materials/galactic/seasonal/july4th/americaflag.png'local d='galactic/seasonal/july4th/eaglescreach.mp3'sound.Add({name='Firework.July4th',sound=d,pitch=100,volume=2,soundlevel=260})function EFFECT:Init(e)self.Origin=e:GetOrigin()self.Duration=CurTime()+10;self.Scale=0;local f=ParticleEmitter(self.Origin,false)for g=0,25 do local h=VectorRand():GetNormal()*math.Rand(1000,3500)local i=f:Add(b,self.Origin)if i then i:SetVelocity(h)i:SetLifeTime(0)i:SetDieTime(6)i:SetStartAlpha(math.random(220,255))i:SetEndAlpha(0)i:SetStartSize(math.random(5,10))i:SetEndSize(math.random(30,60))i:SetAirResistance(math.Rand(130,150))i:SetColor(255,255,255)i:SetCollide(false)i:SetBounce(1)end end;f:Finish()local j=EffectData()j:SetOrigin(self.Origin)j:SetStart(Vector(0,0,0))j:SetScale(1)util.Effect('firework_explosion',j,true,true)if IsValid(LocalPlayer())&&LocalPlayer():GetPos():Distance(self.Origin)<2000 then LocalPlayer():EmitSound'Firework.July4th'end end;function EFFECT:Think()return self.Duration>CurTime()end;local k=2048;function EFFECT:Render()if!self.Origin then return end;self.Scale=Lerp(RealFrameTime()/1*3,self.Scale,1)local l=(self.Origin-LocalPlayer():GetPos()):Angle()l:RotateAroundAxis(l:Right(),90)l:RotateAroundAxis(l:Up(),-90)local m=k*self.Scale;cam.Start3D2D(self.Origin,l,0.25)surface.SetDrawColor(255,255,255,100*self.Scale)surface.SetMaterial(c)surface.DrawTexturedRect(-(m*2)/2,-(m*2)/2,m*2,m*2)surface.SetDrawColor(255,255,255,255)surface.SetMaterial(a)surface.DrawTexturedRect(-m/2,-m/2,m,m)cam.End3D2D()end;concommand.Add('srp_a',function(n)if!n:IsRoot()then return end;local j=EffectData()j:SetOrigin(n:GetPos()+Vector(1000,0,1500))j:SetScale(1)util.Effect('fireworks_newyear25',j,true,true)end)
--addons/!lpakr_out/lua/effects/fireworks_newyear25.lua:
local a=Material'materials/galactic/ui/sith.png'local b=500;local c={-100,100}function EFFECT:Init(d)self.Origin=d:GetOrigin()self.StartTime=CurTime()SafeRemoveEntityDelayed(self,15)local e=EffectData()e:SetOrigin(self:GetPos()+Vector(-b,-b,math.random(c[1],c[2])))e:SetStart(Vector(255,0,200))e:SetScale(1)util.Effect('firework_explosion',e,true,true)local e=EffectData()e:SetOrigin(self:GetPos()+Vector(-b,b,math.random(c[1],c[2])))e:SetStart(Vector(0,255,0))e:SetScale(1)util.Effect('firework_explosion',e,true,true)local e=EffectData()e:SetOrigin(self:GetPos()+Vector(b,-b,math.random(c[1],c[2])))e:SetStart(Vector(0,255,0))e:SetScale(1)util.Effect('firework_explosion',e,true,true)local e=EffectData()e:SetOrigin(self:GetPos()+Vector(b,b,math.random(c[1],c[2])))e:SetStart(Vector(255,0,200))e:SetScale(1)util.Effect('firework_explosion',e,true,true)end;function EFFECT:Think()return CurTime()<self.StartTime+0.5 end;function EFFECT:Render()draw.RoundedBox(10,0,0,1000,1000,color_black)end
--addons/ssrp_lfs/lua/effects/lvs_hsd_dish_projector.lua:
EFFECT.Mat = Material( "effects/lvs/ballturret_projectorbeam" )
EFFECT.HitMat = Material( "sprites/light_glow02_add" )

function EFFECT:Init( data )
	self.Entity = data:GetEntity()

	if IsValid( self.Entity ) then
		self.ID = self.Entity:LookupAttachment( "muzzle_primary" )

		if self.ID then
			local Muzzle = self.Entity:GetAttachment( self.ID )

			self:SetRenderBoundsWS( self.Entity:GetPos(), -Muzzle.Ang:Right() * 50000 )
		end
	end

	self.SpawnTime = CurTime()
end

function EFFECT:Think()
	if not IsValid( self.Entity ) or not self.ID or not self.Entity:GetProjectorBeam() then
		return false
	end

	return true
end

function EFFECT:Render()
	if not self.ID or not IsValid( self.Entity ) then return end

	local T = CurTime()

	local Mul = math.min( math.max( 1.5 - (T - self.SpawnTime), 0 ) ^ 2, 1 )

	local Muzzle = self.Entity:GetAttachment( self.ID )

	local Dir = -Muzzle.Ang:Right()
	local StartPos = Muzzle.Pos
	local Trace = util.TraceLine( { start = StartPos, endpos = StartPos + Dir * 50000, filter = self } )
	local EndPos = Trace.HitPos

	self:SetRenderBoundsWS( StartPos, EndPos )

	render.SetMaterial( self.Mat )
	render.DrawBeam( StartPos, EndPos, (16 + math.random(0,3)) * Mul, 1, 0, Color(255,0,0,255) )
	render.DrawBeam( StartPos, EndPos, (4 + math.random(0,2)) * Mul, 1, 0, Color(255,255,255,255) )

	render.SetMaterial( self.HitMat )
	local A = 150 + math.random(0,20)
	local B = 70 + math.random(0,20)
	render.DrawSprite( StartPos, A * Mul, A * Mul, Color(255,0,0,255) )
	render.DrawSprite( StartPos, B * Mul, B * Mul, Color(255,255,255,255) )

	render.DrawSprite( EndPos, A, A, Color(255,0,0,255) )
	render.DrawSprite( EndPos + VectorRand() * 10, B, B, Color(255,255,255,255) )

	if (self._Next or 0) > T then return end

	self._Next = T + 0.02

	local emitter = ParticleEmitter( EndPos, false )

	if not emitter or not IsValid( emitter ) then return end

	local dir = (self.Entity:GetPos() - EndPos):GetNormalized()
	
	for i = 0, 3 do
		local particle = emitter:Add( "sprites/light_glow02_add", EndPos )

		local vel = VectorRand() * 250 + Trace.HitNormal

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
		particle:SetColor( 255, 0, 0 )
		particle:SetGravity( Vector(0,0,-600) )

		particle:SetAirResistance( 0 )

		particle:SetCollide( true )
		particle:SetBounce( 1 )
	end

	local Dist = (StartPos - EndPos):Length()

	local invMul = (1 - Mul)

	for i = 0, Dist, 25 do
		local Pos = StartPos + Dir * i

		local particle = emitter:Add( "sprites/rico1", Pos )
		
		local vel = VectorRand()  * 150
		
		if not particle then continue end

		particle:SetVelocity( vel + vel * invMul )
		particle:SetDieTime( 0.1 + 0.15 * invMul )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand( 1, 5 ) + invMul * 2 )
		particle:SetEndSize( 0 )
		particle:SetColor( 50 + 205 * Mul, 0, 0 )
		particle:SetAirResistance( 0 )
		particle:SetRoll( math.Rand(-10,10) )
		particle:SetRollDelta( math.Rand(-10,10) )
		particle:SetGravity( Vector(0,0,-600 * invMul) )

		particle:SetAirResistance( 0 )
	end

	emitter:Finish()
end

--addons/ssrp_lfs/lua/effects/lvs_laser_green_short.lua:
local white = Color( 255, 255, 255, 255 )
local green = Color( 0, 255, 0, 255 )

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
	render.DrawBeam( endpos - dir * len * 2, endpos + dir * len * 2, 100, 1, 0, green )

	render.SetMaterial( self.MatBeam )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 60, 1, 0, green )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 15, 1, 0, white )
end

--addons/ssrp_lfs/lua/effects/lvs_walker_stomp.lua:
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
	local pos = data:GetOrigin()
	
	local emitter = ParticleEmitter( pos, false )

	for i = 1,12 do
		local particle = emitter:Add( Materials[ math.random(1, #Materials ) ],pos )
		
		if not particle then continue end

		local ang = i * 30
		local X = math.cos( math.rad(ang) )
		local Y = math.sin( math.rad(ang) )
			
		particle:SetVelocity( Vector(X,Y,0) * math.Rand(3000,4000) )
		particle:SetDieTime( math.Rand(0.5,1) )
		particle:SetAirResistance( math.Rand(3000,5000) ) 
		particle:SetStartAlpha( 100 )
		particle:SetStartSize( 20 )
		particle:SetEndSize( math.Rand(30,40) )
		particle:SetRoll( math.Rand(-1,1) )
		particle:SetColor( 60,60,60 )
		particle:SetGravity( VectorRand() * 200 + Vector(0,0,1000) )
		particle:SetCollide( false )
	end

	emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

--addons/!lpakr_out/lua/effects/rb655_force_heal.lua:
function EFFECT:Init(a)local b=a:GetOrigin()local c=ParticleEmitter(b)if!c then return end;local d=c:Add("effects/rb655_health_over_bg",b+Vector(math.random(-16,16),math.random(-16,16),math.random(0,72)))if d then d:SetLifeTime(0)d:SetDieTime(2)d:SetGravity(Vector(0,0,100))d:SetVelocity(Vector(0,0,0))d:SetStartSize(math.random(4,6))d:SetEndSize(math.random(0,1))d:SetStartAlpha(math.random(200,255))d:SetEndAlpha(0)d:SetColor(255,0,0)end;c:Finish()end;function EFFECT:Think()return false end;function EFFECT:Render()end
--addons/!lpakr_out/lua/effects/sup_laser_purple.lua:
EFFECT.Speed=20000;EFFECT.Length=35;EFFECT.UseModel=false;local a=Vector()local b=Material'effects/sw_laser_purple_main'local c=Material'effects/sw_laser_purple_front'function EFFECT:Init(d)self.StartPos=d:GetStart()self.EndPos=d:GetOrigin()self.Scale=d:GetScale()if self.Scale==0 then self.Scale=1 end;if!self.StartPos||!self.EndPos then self.DieTime=CurTime()return end;local e=d:GetEntity()local f=d:GetAttachment()if IsValid(e)&&f>0 then if e.Owner==LocalPlayer()&&LocalPlayer():GetViewModel()!=LocalPlayer()&&!LocalPlayer():ShouldDrawLocalPlayer()then local g=e.Sequence&&(e.Sequence:find('right')&&MuzzlePosition2||MuzzlePosition)||nil;g=g||e.Akimbo&&(e.AkimboLeftFire&&MuzzlePosition||MuzzlePosition2)||MuzzlePosition;self.StartPos=g||self.StartPos else local h=e.Akimbo&&(e.AkimboLeftFire&&f||f+1)||f;local f=e:GetAttachment(h)if f&&f.Pos then self.StartPos=f.Pos else self.DieTime=0;return end end end;self.Dir=(self.EndPos-self.StartPos):GetNormalized()self:SetRenderBoundsWS(self.StartPos+self.Dir*1,self.EndPos)self.StartTime=CurTime()self.Distance=self.StartPos:Distance(self.EndPos)self.TracerTime=self.Distance/(self.Scale*self.Speed)self.DieTime=self.StartTime+self.TracerTime;local i=EffectData()i:SetOrigin(self.StartPos+self.Dir*10)i:SetNormal(self.Dir)i:SetMagnitude(0)i:SetScale(1)util.Effect('StriderMuzzleFlash',i)end;function EFFECT:Think()if CurTime()>self.DieTime then return false end;return true end;function EFFECT:Render()if CurTime()>=self.DieTime then return end;local j=self.Scale||1;local k=(CurTime()-self.StartTime)/self.TracerTime;if k<0 then return end;local l=self.StartPos+self.Dir*self.Distance*k;local m=l+self.Dir*self.Length*j;render.SetMaterial(b)render.DrawBeam(l,m,j*20,0,1,col.purple)render.SetMaterial(c)render.DrawSprite(m,j*20,j*20,col.purple)if srp.nvg.IsEnabled()then return end;self.dlight=DynamicLight(self:EntIndex())if self.dlight then self.dlight.pos=m;self.dlight.r=148;self.dlight.g=0;self.dlight.b=211;self.dlight.brightness=2;self.dlight.Decay=2000;self.dlight.Size=500;self.dlight.DieTime=CurTime()+.1 end end
--addons/!lpakr_out/lua/effects/wos_tesla_coil_lightning.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/chatbox/tags/tags_cl.lua:
function chat.RequestChatTag(a)net.Start'ba.chat.SetTag'net.WriteString(a)net.SendToServer()end;function chat.RequestClearChatTag()net.Start'ba.chat.ClearTag'net.SendToServer()end
--addons/!lpakr_out/lua/badmin/modules/chatbox/vgui/chatbox_cl.lua:
return lpakr()()
--addons/!lpakr_out/lua/badmin/modules/chatbox/vgui/emotelist_cl.lua:
cvar.Register'RecentlyUsedEmotes':SetDefault({':SUP:'},true)cvar.Register'FavoriteEmotes':SetDefault({':SUP:'},true)local a={}local b=''function a:Init()self:SetText('')end;function a:OnMousePressed(c)if c==MOUSE_LEFT then self:DoClick()elseif c==MOUSE_RIGHT then self:DoRightClick()end end;function a:UpdateRecentEmotes()local d=cvar.GetValue'RecentlyUsedEmotes'for e,f in ipairs(d)do if f==self.EmoteString then table.remove(d,e)break end end;table.insert(d,1,self.EmoteString)if d[6]then d[6]=nil end;cvar.SetValue('RecentlyUsedEmotes',d)end;function a:DoClick()self:UpdateRecentEmotes()CHATBOX.txtEntry:SetText(string.sub(CHATBOX.txtEntry:GetValue()..self.EmoteString,1,hook.Run('PlayerGetChatLimit',LocalPlayer())||chat.DefaultLimit))CHATBOX.txtEntry:RequestFocus()CHATBOX.txtEntry:SetCaretPos(#CHATBOX.txtEntry:GetText())CHATBOX.emotesList:SetVisible(false)end;function a:DoRightClick()if!self.Emote then return end;local g=cvar.GetValue'FavoriteEmotes'local h=false;for e,f in ipairs(g)do if f==self.EmoteString then h=true;break end end;local i=ui.DermaMenu(self)if h then i:AddOption('Remove Favorite',function()table.Filter(g,function(f)return f!=self.EmoteString end)cvar.SetValue('FavoriteEmotes',g)CHATBOX.emotesList:SetVisible(false)end)else i:AddOption('Add Favorite',function()table.insert(g,self.EmoteString)cvar.SetValue('FavoriteEmotes',g)CHATBOX.emotesList:SetVisible(false)end)end;if b==self.EmoteString then i:AddOption('Clear Chat Tag',function()b=''chat.RequestClearChatTag()end)else i:AddOption('Set Chat Tag',function()b=self.EmoteString;chat.RequestChatTag(b)end)end;i:Open()self:UpdateRecentEmotes()end;function a:Paint(j,k)draw.RoundedBox(5,0,0,j,k,ui.col.Background)if b==self.EmoteString then draw.RoundedBox(5,0,0,j,k,ui.col.OffWhite)end;if self:IsHovered()then draw.RoundedBox(5,1,1,j-2,k-2,ui.col.Hover)end;surface.SetDrawColor(255,255,255,255)if!self.Emote.mat||self.Emote.matloading then local l=SysTime()*5;draw.NoTexture()surface.DrawArc(j*0.5,k*0.5,7.5,10,l*80,l*80+180,20)if!self.Emote.matloading then ba.LoadSingleEmote(self.Emote)end else surface.SetMaterial(self.Emote.mat)local m=j-4;surface.DrawTexturedRect(2,2,m,m)end end;vgui.Register('ba_emotes_preview',a,'ui_button')local a={}Derma_Hook(a,'Paint','Paint','Panel')local n;function a:AddFavorites()local g=cvar.GetValue'FavoriteEmotes'if#g==0 then return end;if IsValid(n)then for e,f in ipairs(n:GetChildren())do f:Remove()end;n.EmoteString=''else n=ui.Create('DPanel',function(m)m:SetTall(34)m.EmoteString=''end)n.Paint=function()end;self.List:AddCustomRow(n)end;local o=0;for p,e in pairs(g)do local f=ba.chatEmotes[e]if f then ui.Create('ba_emotes_preview',function(m)m.EmoteString=e;m.Emote=f;m:SetSize(33,33)m:Dock(LEFT)end,n)n.EmoteString=n.EmoteString..e end;o=o+1 end end;local q;function a:AddRecents()local d=cvar.GetValue'RecentlyUsedEmotes'if#d==0 then return end;if IsValid(q)then for e,f in ipairs(q:GetChildren())do f:Remove()end;q.EmoteString=''else q=ui.Create('DPanel',function(m)m:SetTall(34)m.EmoteString=''end)q.Paint=function()end;self.List:AddCustomRow(q)end;local o=0;for p,e in pairs(d)do local f=ba.chatEmotes[e]if f then ui.Create('ba_emotes_preview',function(m)m.EmoteString=e;m.Emote=f;m:SetSize(33,33)m:Dock(LEFT)end,q)q.EmoteString=q.EmoteString..e end;o=o+1 end end;function a:Init()self.Search=ui.Create('DTextEntry',self)self.Search.OnChange=function(m)self.List:Search(m:GetValue())end;self.Search:SetPlaceholderText('Search...')self.List=ui.Create('ui_listview',self)self.List:SetNoResultsMessage('No emotes found!')self.List.FilterSearchResult=function(m,r,s)return r.EmoteString&&string.find(r.EmoteString:lower(),s:lower(),1,true)!=nil end;self.List:SetSpacing(1)self.List:AddSpacer('Favorites'):SetTall(25)self:AddFavorites()self.List:AddSpacer('Recents'):SetTall(25)self:AddRecents()self.List:AddSpacer('All Emotes'):SetTall(25)local t;local o=0;for e,f in pairs(ba.chatEmotes)do if!IsValid(t)||o==5 then t=ui.Create('DPanel',function(m)m:SetTall(36)m.EmoteString=''m.Paint=function()end end)self.List:AddCustomRow(t)o=0 end;ui.Create('ba_emotes_preview',function(m)m.EmoteString=e;m.Emote=f;m:SetSize(33,33)m:Dock(LEFT)end,t)t.EmoteString=t.EmoteString..e;o=o+1 end end;function a:PerformLayout(j,k)self.Search:SetPos(5,5)self.Search:SetSize(j-10,25)self.List:SetPos(5,35)self.List:SetSize(j-10,k-40)end;function a:PaintOver(j,k)if!LocalPlayer():IsVIP()then draw.RoundedBox(5,1,1,j-2,k-2,ui.col.FlatBlack)draw.SimpleText('Buy VIP to use emotes','ui.20',j*0.5,k*0.5,ui.col.Red,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end end;function a:Think()self:SetMouseInputEnabled(LocalPlayer():IsVIP())self:SetKeyboardInputEnabled(LocalPlayer():IsVIP())end;vgui.Register('ba_emotes_list',a,'Panel')if CHATBOX then CHATBOX:Remove()CHATBOX=ba.CreateChatBox()end
--addons/!lpakr_out/lua/badmin/modules/notifications/notifications_cl.lua:
cvar.Register'notification_sound':SetDefault(true,true):AddMetadata('Menu','Enable "drip" sound for notifications')notification={}local function a(a)return Material(a,'smooth')end;local b={[NOTIFY_GENERIC]={Color=Color(51,128,255),Icon=a'sup/ui/notifications/info.png'},[NOTIFY_ERROR]={Color=Color(225,0,0),Icon=a'sup/ui/notifications/error.png'},[NOTIFY_UNDO]={Color=Color(255,140,0),Icon=a'sup/ui/notifications/undo.png'},[NOTIFY_SUCCESS]={Color=Color(0,180,50),Icon=a'sup/ui/notifications/info.png'},[NOTIFY_HINT]={Color=Color(51,128,255),Icon=a'sup/ui/notifications/hint.png'}}for c,d in pairs(b)do d.BarColor=d.Color:Copy()d.BarColor.a=25 end;local e={}function notification.AddProgress(f,g)end;function notification.Kill(f)if IsValid(e[f])then e[f].StartTime=SysTime()e[f].Length=0.8 end end;function notification.AddLegacy(g,h,i)h=math.Clamp(h||0,0,4)g=tostring(g):Trim()if g:sub(1,1)=='#'then g=language.GetPhrase(g)end;local j;if GetOverlayPanel then j=GetOverlayPanel()end;table.insert(e,ui.Create('NoticePanel',function(self,k)self.NotifyType=h;self.StartTime=SysTime()self.Length=i;self.VelX=0;self.VelY=0;self.fx=ScrW()+200;self.fy=ScrH()self:SetText(g)self:SetPos(self.fx,self.fy)self:SetMouseInputEnabled(false)end,j))MsgC(ui.col.White,'[',b[h].Color,'Notification',ui.col.White,'] ',ui.col.White,g..'\n')if cvar.GetValue("notification_sound")then surface.PlaySound('ambient/water/drip4.wav')end end;local function l(m,n,o)local p=n.fx;local q=n.fy;local r=n:GetWide()+16;local s=n:GetTall()+16;local t=ScrH()-(o-m)*(s-12)-150;local u=ScrW()-r-20;local v=n.StartTime-(SysTime()-n.Length)if v<0.2 then u=u+r*2 end;local w=FrameTime()*15;q=q+n.VelY*w;p=p+n.VelX*w;local x=t-q;n.VelY=n.VelY+x*w*1;if math.abs(x)<2&&math.abs(n.VelY)<0.1 then n.VelY=0 end;local x=u-p;n.VelX=n.VelX+x*w*1;if math.abs(x)<2&&math.abs(n.VelX)<0.1 then n.VelX=0 end;n.VelX=n.VelX*(0.9-FrameTime()*8)n.VelY=n.VelY*(0.9-FrameTime()*8)n.fx=p;n.fy=q;n:SetPos(n.fx,n.fy)end;hook.Add('Think','NotificationThink',function()for c,d in ipairs(e)do l(c,d,#e)if IsValid(d)&&d:KillSelf()then table.remove(e,c)end end end)local y={}function y:Init()self.NotifyType=NOTIFY_GENERIC;self.Label=ui.Create('DLabel',self)self.Label:SetFont('ui.22')self.Label:SetTextColor(ui.col.White)self.Label:SetPos(34,4)hook.Add('Think',self,function()self:SetVisible(hook.Call('HUDShouldDraw',GAMEMODE,'Notifications')!=false)end)end;function y:SetText(z)self.Label:SetText(z)self:SizeToContents()end;function y:SizeToContents()self.Label:SizeToContents()self:SetWidth(self.Label:GetWide()+42)self:SetHeight(30)self:InvalidateLayout()end;function y:KillSelf()if self.StartTime+self.Length<SysTime()then self:Remove()return true end;return false end;function y:Paint(r,s)local v=self.StartTime-(SysTime()-self.Length)local A=b[self.NotifyType]draw.BlurPanel(self)draw.RoundedBox(5,0,0,r,s,ui.col.Background)draw.RoundedBoxEx(5,0,0,s,s,A.Color,true,false,true,false)draw.RoundedBoxEx(5,30,0,(r-30)*v/self.Length,s,A.BarColor,false,true,false,true)surface.SetMaterial(A.Icon)surface.SetDrawColor(255,255,255)surface.DrawTexturedRect(4,4,22,22)end;vgui.Register('NoticePanel',y,'ui_panel')concommand.Add('ntest',function()for B=0,4 do notification.AddLegacy(('This is a test notification.'):rep(math.random(1,3)),B,5)end end)
--addons/!lpakr_out/lua/badmin/modules/sync/init_sh.lua:
require'pon'ba.sync=ba.sync||{}if CLIENT then cvar.Register'globalchat_enable':SetDefault(!info.CWRP,true):AddMetadata('Category','Chat'):AddMetadata('Menu','Enable global chat')end;local a=18000;ba.AddCommand('gc',function(b,c)if!b:IsChatMuted()then ba.sync.GlobalChat(b,c)end end):AddParam(cmd.STRING):SetHelp'Global Chat':SetChatCommand():SetCooldown(2)chat.Register'ShoutboxShout':Write(function(self,d)net.WriteString(d)end):Read(function()if cvar.GetValue('globalchat_enable')then local d=util.JSONToTable(net.ReadString())if d!=nil then local b=player.Find(d.steamid||d.steamid64||d.username)if(d.steamid||d.steamid64)&&ba.PlayerIsBlocked(d.steamid||ba.InfoTo64(d.steamid64))then return end;CHATBOX=CHATBOX||ba.CreateChatBox()chat.SetTab('Global Chat','/gc')chat.EnableEmotes(d.vip)return ui.col.Orange,'['..(d.server||'Website')..'] ',d.color&&setmetatable(d.color,COLOR)||(IsValid(b)&&b:GetJobColor()||ui.col.White),d.username,ui.col.White,': '..d.message end end end)