--Stealed clientside server code by exechack.cc
--Hostname: 🧿 New Era - Solo Leveling | .gg/nwsl - Part 4/10 - 08/04/2025


--PATH addons/sl_util_accessory/lua/advanced_accessories/client/cl_fonts.lua:
function AAS.LoadFonts(itemNameScale)
	surface.CreateFont( "AAS:Font:01", {
		font = "Segoe UI",
		extended = false,
		size = AAS.ScrH*0.034,
		weight = 1000, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})

	surface.CreateFont( "AAS:Font:02", {
		font = "Segoe UI",
		extended = false,
		size = isnumber(itemNameScale) and itemNameScale or AAS.ScrH*0.026,
		weight = 1000, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})

	surface.CreateFont( "AAS:Font:03", {
		font = "Segoe UI",
		extended = false,
		size = AAS.ScrH*0.02,
		weight = 0, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})

	surface.CreateFont( "AAS:Font:04", {
		font = "Segoe UI",
		extended = false,
		size = AAS.ScrH*0.022,
		weight = 1000, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})

	surface.CreateFont( "AAS:Font:05", {
		font = "Segoe UI",
		extended = false,
		size = AAS.ScrH*0.024,
		weight = 1000, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})

	surface.CreateFont( "AAS:Font:06", {
		font = "Segoe UI",
		extended = false,
		size = AAS.ScrH*0.03,
		weight = 600, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})

	surface.CreateFont( "AAS:Font:07", {
		font = "Segoe UI",
		extended = false,
		size = AAS.ScrH*0.025,
		weight = 500, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})

	surface.CreateFont( "AAS:Font:08", {
		font = "Segoe UI",
		extended = false,
		size = AAS.ScrH*0.12,
		weight = 600, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})

	surface.CreateFont( "AAS:Font:09", {
		font = "Segoe UI",
		extended = false,
		size = AAS.ScrH*0.08,
		weight = 600, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})

	surface.CreateFont( "AAS:Font:10", {
		font = "Lato Black",
		extended = false,
		size = AAS.ScrH*0.02,
		weight = 600, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})

	surface.CreateFont( "AAS:Font:11", {
		font = "Lato Black",
		extended = false,
		size = AAS.ScrH*0.02,
		weight = 600, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})

	surface.CreateFont( "AAS:Font:12", {
		font = "Lato Black",
		extended = false,
		size = AAS.ScrH*0.025,
		weight = 0, 
		blursize = 0,
		scanlines = 0,
		antialias = true,
	})
end
--PATH addons/sl_aphone/lua/aphone/_libs/__header/sh_language.lua:
function aphone.L(key, ...)
    if !aphone.LanguageTable[key] then
        print("[APhone] There a error with the language's text : " .. key)
    end

    return ... and string.format( aphone.LanguageTable[key], ... ) or aphone.LanguageTable[key]
end
--PATH addons/sl_aphone/lua/aphone/_libs/_utilities/cl_colors.lua:
local clr = {
    Black48 = Color(48, 48, 48),
    Black40 = Color(40, 40, 40),
    Black40_120 = Color(40, 40, 40, 120),
    Silver = Color(200, 200, 200),
    White = Color(240, 240, 240),
    Black1 = Color(53, 59, 72),
    Black2 = Color(51, 54, 61),
    Black3 = Color(41, 45, 51),
    Text_White = Color(230, 240, 241),
    Text_White180 = Color(230, 240, 241, 180),
    Text_White120 = Color(230, 240, 241, 120),
    Text_White60 = Color(230, 240, 241, 60),
    Text_Shadow = Color(60, 60, 60, 60),
    Text_Orange = Color(230, 126, 34),
    Text_Apps = Color(230, 240, 241),
    GPS_Line = Color(230, 126, 34),
    -- Cookies
    Cookie_BoostOff = Color(218, 165, 32),
    Cookie_BoostOn = Color(255, 245, 112),
    Cookie_Blue = Color(72, 101, 129),
    -- Radio
    Radio_Background = Color(40, 40, 40),
    Radio_VolumeBar = Color(60, 60, 60),
    Radio_RadioList = Color(50, 50, 50),
    mat_red = Color(190, 55, 95),
    mat_blackred = Color(185, 32, 73),
    mat_lightred = Color(240, 194, 209),
    mat_black = Color(44, 44, 44),
    mat_orange = Color(237, 133, 84)
}


function aphone:DefaultClr(name)
    return clr[name]
end

local c = Color

function aphone:Color(name)
    local info = aphone.Clientside.GetSetting(name, clr[name])

    if istable(info) then
        aphone.Clientside.Varlist[name] = c(info.r, info.g, info.b, info.a or 255)
        info = aphone.Clientside.Varlist[name]
    end

    return info
end

hook.Add("aphone_PostLoad", "aphone_CreateParamsColors", function()
    for k, v in pairs(clr) do
        aphone:RegisterParameters("Colors", k, k, "color", aphone:DefaultClr(k))
    end
end)
--PATH addons/sl_aphone/lua/aphone/_libs/_utilities/cl_renderview.lua:
aphone.RV = {}

// Function caching
local get_rt = GetRenderTarget
local create_mat = CreateMaterial
local push_rt = render.PushRenderTarget
local pop_rt = render.PopRenderTarget
local clear_rt = render.Clear
local renderview = render.RenderView

function aphone.RenderView_Start(name, params)
	aphone.RV[name] = aphone.RV[name] or {
		rt = get_rt("aphone_RV" .. name, params.w, params.h),
		texture = create_mat("aphone_RVMat" .. name, "UnlitGeneric", {["$basetexture"] = "aphone_RV" .. name}),
	}

	params.fov = params.fov or 60
	params.zfar = params.zfar or 6000
	params.drawviewmodel = params.drawviewmodel or false

	aphone["RV"][name].params = params
end

function aphone.RenderView_RequestTexture(name)
	if aphone.RV[name] then
		return aphone.RV[name].texture
	end
end

function aphone.RenderView_RequestScreenshot(name, dir, addgallery)
	if aphone.RV[name] then
		local param = aphone["RV"][name].params

		aphone.RV[name].Screenshot = {
			dir = dir,
			format = "jpg",
			quality = 90,
			x = param.x, y = param.y,
			w = param.w, h = param.h,
		}

		aphone.RV[name].addg = addgallery
	end
end

function aphone.RenderView_End(name)
	aphone.RV[name] = nil
end

local lp_rt = false
hook.Add( "ShouldDrawLocalPlayer", "aphone_DrawLocalPlayerRT", function( ply )
	if ( lp_rt ) then
		return true
	end
end)

local smileys = {}

for i=0, 9 do
	smileys[i] = Material("akulla/aphone/smiley_" .. i .. ".png", "smooth 1")
end

hook.Add("PostRender", "aphone_RTRefresh", function()
	in_aphonert = true
	for k,v in pairs(aphone.RV) do
		if v.params.drawviewmodel then
			lp_rt = true
		end

		push_rt(v.rt)
			clear_rt(255, 255, 255, 255)
			renderview(v.params)

			surface.SetDrawColor(color_white)
			local localply = LocalPlayer()
			local l_ang = localply:GetShootPos()

			if v.params.Smileys then
				cam.Start3D()
					for i, j in ipairs(player.GetAll()) do
						if j == localply then continue end

						local bone = j:LookupBone("ValveBiped.Bip01_Head1")
						if bone then
							local pos = j:GetBonePosition(bone)
							local before_ang = (l_ang - j:GetShootPos()):Angle()
							local ang = Angle(0, before_ang.y + 90, before_ang.x + 90)
							render.SetMaterial( smileys[j:UserID()%9] )
							render.DrawQuadEasy( pos + ang:Up()*12, ang:Up(), 16, 16, color_white, 180 )
						end
					end
				cam.End3D()
			end

			if v.Screenshot then
				local data = render.Capture(v.Screenshot)
				file.Write(v.Screenshot.dir .. ".jpg", data)

				if v.addg then
					local mat = Material("../data/" .. v.Screenshot.dir .. ".jpg")
					table.insert(aphone.Pictures, mat)
				end

				v.Screenshot = nil
			end
		pop_rt()
		lp_rt = false
	end
end)
--PATH addons/sl_aphone/lua/aphone/_libs/painting/cl_rt.lua:
// Convert everything
for k, v in pairs(aphone.Painting) do
	if isstring(v) then
		aphone.Painting[k] = Material(v, "smooth 1")
	end
end

// Put it in global, so we keep a trace of our textures
aphone.Texturelist = aphone.Texturelist or {}

function aphone:Painting_Generate(rt, skintbl)
	if !skintbl then return end

	render.PushRenderTarget(rt)
		render.Clear(255, 255, 255, 255)
		cam.Start2D()
			-- I don't use ipairs because it's not always sequencial tables ( like in panel painting where I remove index, but not fill gap )
			for k,v in pairs(skintbl) do
				local mat = aphone.Painting[v.mat_id]

				if !mat or type(mat) != "IMaterial" or mat:IsError() then continue end

				local dw = 256
				local dh = mat:Height() / mat:Width() * dw

				local tr = Matrix()
				tr:Translate(Vector(v.posx * 1024, v.posy * 1024))
				tr:Scale(Vector(v.sizex, v.sizey, 1))
				tr:Translate(Vector(-dw / 2, -dh / 2))

				cam.PushModelMatrix(tr)
					surface.SetMaterial(mat)
					surface.SetDrawColor(v.clr_r, v.clr_g, v.clr_b)
					surface.DrawTexturedRectRotated(dw / 2, dh / 2, dw, dh, v.angle)
				cam.PopModelMatrix()
			end
		cam.End2D()
	render.PopRenderTarget()
end

local function create_newplayerpaint(ply, table)
	local rt = aphone.Texturelist[ply].rt or GetRenderTargetEx( "aphone_RT_" ..  ply, 1024, 1024, RT_SIZE_OFFSCREEN, MATERIAL_RT_DEPTH_NONE, 0, 0, IMAGE_FORMAT_RGBA8888)
	local tex = aphone.Texturelist[ply].tex or CreateMaterial( "aphone_RT_" ..  ply, "VertexLitGeneric", {
		["$basetexture"] = rt:GetName()
	} )

	aphone:Painting_Generate(rt, table)

	local infos = {
		tex = tex,
		rt = rt,
		last_refresh = CurTime(),
	}

	if ply == LocalPlayer():UserID() then
		aphone.SelfPaint = table
	end

	aphone.Texturelist[ply] = infos
end

net.Receive("aphone_PaintLoad", function()
	local user_id = net.ReadUInt(16)
	local step = net.ReadUInt(6)

	local stickers = {}

	for i = 1, step do
		local tbl = {
			mat_id = net.ReadUInt(16) or 1,
			angle = net.ReadUInt(9) or 0,
			clr_r = net.ReadUInt(8) or 255,
			clr_g = net.ReadUInt(8) or 255,
			clr_b = net.ReadUInt(8) or 255,
			posx = (net.ReadUInt(10) or 50)/100,
			posy = (net.ReadUInt(10) or 50)/100,
			sizex = (net.ReadUInt(10) or 100)/100,
			sizey = (net.ReadUInt(10) or 100)/100,
		}

		table.insert(stickers, tbl)
	end

	aphone.Texturelist[user_id] = aphone.Texturelist[user_id] or {}

	create_newplayerpaint(user_id, stickers)
end)

function aphone.RefreshWeapon(ply, wep)
	if aphone.Texturelist[ply:UserID()] and (!wep.last_refresh or wep.last_refresh < aphone.Texturelist[ply:UserID()].last_refresh) then
		wep.last_refresh = CurTime()

		for k, v in pairs(aphone.matlist) do
			wep:SetSubMaterial(v, "!" .. aphone.Texturelist[ply:UserID()].rt:GetName())
		end
	end
end
--PATH addons/sl_aphone/lua/aphone/_libs/panels/cl_circleavatar.lua:
local PANEL = {}

local stencil_writemask = render.SetStencilWriteMask
local stencil_testmask = render.SetStencilTestMask
local stencil_id = render.SetStencilReferenceValue
local stencil_fail = render.SetStencilFailOperation
local stencil_zfail = render.SetStencilZFailOperation
local stencil_compare = render.SetStencilCompareFunction
local stencil_pass = render.SetStencilPassOperation

function PANEL:Init()
	self.avatar = vgui.Create("AvatarImage", self)
	self.avatar:SetPaintedManually(true)
	self.avatar:Dock(FILL)
	self.avatar:SetMouseInputEnabled(false)
	self:SetMouseInputEnabled(false)
	self:aphone_RemoveCursor()
end

function PANEL:SetPlayer(p, s)
	self.avatar:SetPlayer(p, s)
end

function PANEL:PerformLayout()
	self.border_poly = nil
end

local stencil_clr = Color(1, 1, 1, 1)
function PANEL:Paint(w, h)
	if !self.border_poly then
		if self.roundedValue then
			self.border_poly = aphone.GUI.RoundedBox(0, 0, w, h, 8)
		else
			self.border_poly = aphone.GUI.GenerateCircle(w / 2, h / 2, h < w and h/2 or w / 2)
		end
	end

	// Reset
	if self.ignorestencil then
		render.ClearStencil()
		render.SetStencilEnable(true)
	end
	stencil_writemask( 0xFF )
	stencil_testmask( 0xFF )
	stencil_fail( STENCIL_KEEP )
	stencil_zfail( STENCIL_KEEP )
	stencil_id( 1 )

	// Stencil
	stencil_compare( self.ignorestencil and STENCIL_ALWAYS or STENCIL_EQUAL )
	stencil_pass( self.ignorestencil and STENCIL_REPLACE or STENCIL_INCRSAT )

		draw.NoTexture()
		surface.SetDrawColor(stencil_clr)
		surface.DrawPoly(self.border_poly)

	stencil_id( self.ignorestencil and 1 or 2)
	stencil_pass( self.ignorestencil and STENCIL_KEEP or STENCIL_DECRSAT )
	stencil_compare(STENCIL_EQUAL)

		self.avatar:PaintManual()

	// Get settings back
	// Ignore stencil is only used in call panel actually
	if !self.ignorestencil then
		stencil_id( 1 )
		stencil_pass( STENCIL_REPLACE )
	else
		render.SetStencilEnable(false)
	end
end

vgui.Register("aphone_CircleAvatar", PANEL)
--PATH addons/sl_aphone/lua/aphone/_libs/panels/cl_mainpanel.lua:
local PANEL = {}

local wave_wscale = 0.5
local curtime_div = 8
local wave_h = 96

local home_wave = Material("akulla/aphone/home_wave.png", "smooth 1" )
local grad = Material("akulla/aphone/lua_grad1.png")
local rat = 0.2
local stencil_clr = Color(1, 1, 1, 1)

function PANEL:Init()
	local font_tall = aphone:GetFont("DateShow_200")

	local cache_white = aphone:Color("Text_White")
	local cache_white180 = aphone:Color("Text_White180")
	local hour_format = os.date("%H")
	local minute_format = os.date("%M")
	local day_format = aphone.L(os.date("%A"))
	local date_format = os.date("%d") .. " " .. aphone.L(os.date("%B"))
	local font_40 = aphone:GetFont("Roboto40")
	local font_60 = aphone:GetFont("Roboto60")
	local font_svg = aphone:GetFont("SVG_60")
	local font_svg2 = aphone:GetFont("SVG_90")

	if !aphone:Is2D() then
		self:SetPaintedManually(true)

		-- Issue, the ID is displayed with the phone on 3D and it goes in front of the phone
		hook.Add("HUDDrawTargetID", "APhone_HideDrawTarget", function()
			return false
		end )
	end

	self:SetSize(aphone.GUI.ScaledSize(400, 855))
	// I can't use self !
	local self_alt = self

	local lock = vgui.Create("DPanel", self)
	lock:SetSize(self:GetSize())
	lock:Center()
	lock:SetZPos(2)
	lock:aphone_RemoveCursor()

	local unlocked = false

	surface.SetFont(font_tall)
	local hour_x = surface.GetTextSize(hour_format)

	surface.SetFont(font_40)
	local day_x, day_y = surface.GetTextSize(day_format)
	local date_x = surface.GetTextSize(date_format)
	local final_wave_h = aphone.GUI.ScaledSize(wave_h)

	function lock:Paint(w, h)
		local c = CurTime()

		self.aphone_amt = self.aphone_amt or 0
		self.aphone_lastcheck = self.aphone_lastcheck or c
		local dif = c - self.aphone_lastcheck

		// Math.Clamp
		self.aphone_amt = self.aphone_amt + (lock:IsHovered() and dif or -dif)
		self.aphone_amt = self.aphone_amt > 1 and 1 or self.aphone_amt < 0 and 0 or self.aphone_amt
		self.aphone_lastcheck = c

		surface.SetDrawColor(HSVToColor( ((engine.TickCount() + (300 * self.aphone_amt)) * rat ) % 360, 1, 0.8 ))
		surface.DrawRect(0, 0, w, h)

		surface.SetDrawColor(HSVToColor( (engine.TickCount() + 300) * rat % 360, 1, 0.5 ))
		surface.SetMaterial(grad)
		surface.DrawTexturedRect(0, 0, w, h)

		// SimpleText is KILLING FProfiler, so I need to get ahead and cache things I can cache
		surface.SetFont(font_tall)
		surface.SetTextColor(cache_white)

		surface.SetTextPos(w / 2 - hour_x * 0.75, h * 0.2)
		surface.DrawText(hour_format)

		surface.SetTextPos(w / 2 - hour_x * 0.25, h * 0.4)
		surface.DrawText(minute_format)

		surface.SetFont(font_40)
		surface.SetTextColor(cache_white180)

		surface.SetTextPos((w - day_x) / 2, h * 0.63)
		surface.DrawText(day_format)

		surface.SetTextPos((w - date_x) / 2, h * 0.63 + day_y)
		surface.DrawText(date_format)

		surface.SetMaterial(home_wave)
		surface.SetDrawColor(color_white)

		local time = (c / curtime_div) % 1
		local wave_w = -8000 * wave_wscale * time

		// We need to repeat it
		if wave_w + 8000 * wave_wscale < self_alt:GetWide() then
			surface.DrawTexturedRect(wave_w + 8000 * wave_wscale, h - final_wave_h, 8000 * wave_wscale, final_wave_h)
		end
		surface.DrawTexturedRect(wave_w, h - final_wave_h, 8000 * wave_wscale, final_wave_h)

		if self.aphone_amt == 1 and !unlocked then
			unlocked = true
			lock:SetMouseInputEnabled(true)
			lock:MoveTo(0, -aphone.GUI.ScaledSize(855), 0.5, 0, 0.5, function(_, pnl)
				pnl:Remove()
			end)

			self.applist = vgui.Create("aphone_AppList", self_alt)
			self.applist:Dock(FILL)
		end
	end

	if aphone.Call.Infos and !self.already_callpanel then
		self.already_callpanel = vgui.Create("aphone_Call", self)
		self.already_callpanel:SetZPos(4)
	elseif !aphone.first_start then
		local first_start = vgui.Create("DPanel", self)
		first_start:SetSize(self:GetSize())
		first_start:SetZPos(3)

		local start_time = CurTime()
		local first_x, first_y = first_start:GetSize()

		local hello = vgui.Create("DLabel", first_start)
		hello:SetPos(0, first_y * 0.5)
		hello:SetSize(first_x, first_y * 0.1)
		hello:SetAlpha(0)
		hello:SetFont(font_60)
		hello:SetText(aphone.L("Hello"))
		hello:SetContentAlignment(5)
		hello:AlphaTo(255, 0.8, 0.5)
		hello:MoveTo(0, first_y * 0.45, 1, 0.5, 0.5)
		hello:MoveTo(0, first_y * 0.40, 1, 2, 0.5)
		hello:AlphaTo(0, 0.8, 2)
		hello:SetTextColor(color_white)

		local welcome = vgui.Create("DLabel", first_start)
		welcome:SetPos(0, first_y * 0.5)
		welcome:SetSize(first_x, first_y * 0.1)
		welcome:SetAlpha(0)
		welcome:SetFont(font_60)
		welcome:SetTextColor(color_white)
		welcome:SetText(aphone.L("WelcomeTo"))
		welcome:SetContentAlignment(5)
		welcome:AlphaTo(255, 0.8, 2.5)
		welcome:MoveTo(0, first_y * 0.45, 1, 2.5, 0.5)
		welcome:MoveTo(0, first_y * 0.40, 1, 4, 0.5)
		welcome:AlphaTo(0, 0.8, 4, function(_, pnl)
			pnl:Remove()
		end)

		local text_aphone = vgui.Create("DLabel", first_start)
		text_aphone:SetPos(0, first_y * 0.5)
		text_aphone:SetSize(first_x, first_y * 0.1)
		text_aphone:SetAlpha(0)
		text_aphone:SetFont(aphone:GetFont("StartScreen"))
		text_aphone:SetTextColor(color_white)
		text_aphone:SetText("APhone")
		text_aphone:SetContentAlignment(5)
		text_aphone:AlphaTo(255, 0.8, 4.5)
		text_aphone:MoveTo(0, first_y * 0.45, 1, 4.5, 0.5)

		local click_me_remove = vgui.Create("DButton", first_start)
		click_me_remove:SetPos(0, first_y * 0.7)
		click_me_remove:SetSize(first_x, first_y * 0.1)
		click_me_remove:SetAlpha(0)
		click_me_remove:SetText("")
		click_me_remove:AlphaTo(255, 0.8, 6)

		function click_me_remove:Paint(w, h)
			draw.SimpleTextOutlined("w", font_svg2, w / 2, h / 2, cache_white180, 1, 1, 1, Color(255, 255, 255, math.abs(math.sin(CurTime() * 1.5)) * 60))
		end

		function click_me_remove:DoClick()
			timer.Simple(0.5, function()
				aphone.first_start = CurTime()
			end)
			self:SetMouseInputEnabled(false)

			local unlock_smiley = vgui.Create("DLabel", first_start)
			unlock_smiley:SetPos(0, first_y * 0.58)
			unlock_smiley:SetSize(first_x, first_y * 0.1)
			unlock_smiley:SetFont(font_svg)
			unlock_smiley:SetText("z")
			unlock_smiley:SetContentAlignment(5)
			unlock_smiley:AlphaTo(0, 1, 0)
			unlock_smiley:MoveTo(0, first_y * 0.55, 1, 0, 0.5)
			unlock_smiley:SetTextColor(cache_white180)

			if math.Rand(0, 1) < 0.05 then
				unlock_smiley:SetText("(◠﹏◠)")
				unlock_smiley:SetFont(font_40)
			end
		end

		function first_start:Paint(w, h)
			if aphone.first_start then
				if (CurTime() - aphone.first_start) >= 1 then
					self:Remove()
				end 

				render.ClearStencil()
				// Reset
				render.SetStencilWriteMask( 0xFF )
				render.SetStencilTestMask( 0xFF )
				render.SetStencilFailOperation( STENCIL_ZERO )
				render.SetStencilZFailOperation( STENCIL_ZERO )

				// Enable
				render.SetStencilEnable(true)
				render.SetStencilReferenceValue( 1 )
				render.SetStencilCompareFunction( STENCIL_ALWAYS )
				render.SetStencilPassOperation( STENCIL_REPLACE )
					surface.DrawPoly(aphone.GUI.GenerateCircle(w / 2, h * 0.75, (w + h * 1.25) / 2 * (1 - (CurTime() - aphone.first_start))))
					surface.SetDrawColor(stencil_clr)
				render.SetStencilCompareFunction(STENCIL_EQUAL)
			end

			local sec_past = CurTime() - start_time

			surface.SetDrawColor(color_black)
			surface.DrawRect(0, 0, w, h)

			if sec_past > 4.5 then
				surface.SetTexture(surface.GetTextureID( "akulla/aphone/background_startup" ))
				surface.SetDrawColor(255, 255, 255, (sec_past - 4.5) * 255)
				surface.DrawTexturedRect(0, 0, w, h)
			end
		end

		function first_start:PaintOver()
			render.SetStencilEnable(false)
		end
		first_start:aphone_RemoveCursor()
	end
end

function PANEL:Paint(w, h)
	surface.SetDrawColor(color_white)
	surface.SetMaterial(aphone.GUI.GetBackground())

	local wi, hi = aphone.GUI.ScaledSize(400, 855)

	surface.DrawTexturedRectRotated(w/2, h/2, wi, hi, w < h and 0 or 90)
end

function PANEL:PaintOver(w, h)
	// There is the white fade when you change display mode ( horizontal/vertical )
	if aphone.horizontal_ratio and aphone.horizontal_ratio != 0 and aphone.horizontal_ratio != 1 then
		local alpha = math.abs(aphone.horizontal_ratio - 0.5) * 2

		surface.SetDrawColor(255, 255, 255, (1 - alpha) * 255)
		surface.DrawRect(0, 0, w, h)

		if alpha < 0.15 and aphone.asking_changestate then
			aphone.asking_changestate = false

			if !aphone.Horizontal then
				self:SetSize(aphone.GUI.ScaledSize(400, 855))
			else
				self:SetSize(aphone.GUI.ScaledSize(855, 400))
			end

			if aphone.Call and aphone.Call.Infos then
				local call = vgui.Create("aphone_Call", aphone.MainDerma)
				call:SetZPos(3)
			
				if !aphone.Call.Infos.pending then
					call:Accepted()
				end
			end

			for k, v in pairs(aphone.MainDerma:GetChildren()) do
				if v:GetName() == "aphone_AppList" then
					v:SetVisible(!aphone.Horizontal)
					break
				end
			end

			// Forced ? then skip anims, we don't know why it's forced
			if aphone.Force_AllowHorizontal then
				aphone.App_Panel:SetSize(self:GetSize())
			elseif IsValid(aphone.App_Panel) then
				// Remove old app
				aphone.App_Panel:Clear()

				local pos_x, pos_y = self:GetSize()

				// Re-create things
				// p, same as main in APP:Open
				local p = vgui.Create("DPanel", aphone.App_Panel)
				p:SetSize(self:GetSize())

				// Close button
				local b_menu = vgui.Create("DButton", p)
				b_menu:SetText("")
				b_menu:Dock(BOTTOM)
				b_menu:SetTall(aphone.Horizontal and pos_y * 0.04 or pos_y * 0.02)
				b_menu:DockMargin(pos_x * 0.2, 0, pos_x * 0.2, 0)

				function b_menu:Paint(w, h)
					draw.RoundedBox(h / 4, 0, 0, w, h / 2, color_black)
					draw.RoundedBox(h / 4, 2, 2, w-4, h / 2-4, color_white)

					if input.IsMouseDown(MOUSE_MIDDLE) and IsValid(aphone.App_Panel) then
						local hoveredpnl = vgui.GetHoveredPanel()
						if !IsValid(hoveredpnl) or hoveredpnl.aphone_dontmiddlemouse then return end

						self:DoClick()
					end
				end

				function b_menu:DoClick()
					if !aphone.Horizontal then
						local anim = aphone.App_Panel:NewAnimation(0.5, 0, 0.5)

						function anim:Think(_, frac_anim)
							aphone.App_Panel.frac = frac_anim
						end
					end

					if aphone.HorizontalApp then
						aphone.RequestAnim(1)
					end

					aphone.App_Panel.phone_gettingremoved = true
				end

				// Open our new app
				aphone.HorizontalApp = aphone.Horizontal

				if aphone.Horizontal then
					aphone.Running_App:Open2D(p, self:GetSize())
				else
					aphone.Running_App:Open(p, self:GetSize())
				end
			else
				aphone.HorizontalApp = false
			end
		end
	end
end

function PANEL:OnRemove()
	aphone.RV = {}
	hook.Remove("HUDDrawTargetID", "APhone_HideDrawTarget")
end

vgui.Register("aphone_Main", PANEL, "EditablePanel")
--PATH addons/sl_aphone/lua/aphone/_libs/panels/cl_onlinepicturelist.lua:
local PANEL = {}

local blue = Color(111, 231, 252)
local stencil_clr = Color(1, 1, 1, 1)

function PANEL:Init()
    local pnl = self
    local main_x, main_y = aphone.MainDerma:GetSize()
    local screenmode = aphone.Horizontal

    self.phone_cachewhite = aphone:Color("White")
    self:SetSize(main_x, main_y)
    self:SetMouseInputEnabled(true)

    local margin = screenmode and main_y * 0.1 or main_x * 0.1

    surface.SetFont(aphone:GetFont("Roboto40_700"))
    local _, title_y = surface.GetTextSize(aphone.L("Online_Pictures"))

    local title = vgui.Create("DLabel", pnl)
    title:Dock(TOP)
    title:DockMargin(0, screenmode and main_x*0.05 or main_y * 0.05, 0, 0)
    title:SetTall(title_y)
    title:SetFont(aphone:GetFont("Roboto40_700"))
    title:SetTextColor(aphone:Color("Black3"))
    title:SetText(aphone.L("Online_Pictures"))
    title:SetContentAlignment(5)
    title:SetMouseInputEnabled(true)

    local top_back = vgui.Create("DLabel", title)
    top_back:Dock(LEFT)
    top_back:SetWide(title_y)
    top_back:SetFont(aphone:GetFont("SVG_30"))
    top_back:SetText("l")
    top_back:SetPaintBackground(false)
    top_back:SetTextColor(aphone:Color("Black48"))
    top_back:SetMouseInputEnabled(true)
    top_back:SetContentAlignment(5)

    function top_back:DoClick()
        pnl:MoveTo(main_x, 0, 0.5, 0, 0.5, function(_, p)
            p:Remove()
        end)
    end

    local s = vgui.Create( "DScrollPanel", self )
    s:Dock( FILL )
    s:DockMargin(margin, margin, margin, margin + aphone.GUI.ScaledSizeY(24))
    s:aphone_PaintScroll()

    local l = vgui.Create("DIconLayout", s)
    l:Dock(FILL)
    l:SetSpaceX(10)
    l:SetSpaceY(10)

    // 19 = 5*3 margin between pictures + 4 for the scroll wide
    local perfect_iconsize

    if screenmode then
        perfect_iconsize = (main_y - margin * 2 - l:GetSpaceX() * 2 - 4) / 3
    else
        perfect_iconsize = (main_x - margin * 2 - l:GetSpaceX() * 2 - 4) / 3
    end

    for k,v in ipairs(aphone.GetImgurPics()) do
        local but = l:Add("DButton")
        but:SetText("")
        but:SetSize(perfect_iconsize, perfect_iconsize)
        local cache_roundedbox = aphone.GUI.RoundedBox(0, 0, perfect_iconsize, perfect_iconsize, 8)

        function but:Paint(w, h)
            aphone.Stencils.Start()
                surface.SetDrawColor(stencil_clr)
                surface.DrawPoly(cache_roundedbox)
            aphone.Stencils.AfterMask(false)
                local sub_mat = aphone.GetImgurMat(v)

                if sub_mat then
                    surface.SetMaterial(aphone.GetImgurMat(v))
                    surface.SetDrawColor(self:IsHovered() and blue or color_white)
                    surface.DrawTexturedRect(0, 0, w, h)
                end
            aphone.Stencils.End()
        end

        function but:DoClick()
            local p = vgui.Create("aphone_ShowImage", pnl)
            p:SetMat(aphone.GetImgurMat(v))

            p:SetValid(function()
                pnl:OnSelected(v)
                pnl:Remove()
            end)
        end
    end

    l:Layout()
    self:aphone_RemoveCursor()
end

function PANEL:Paint(w,h)
    surface.SetDrawColor(self.phone_cachewhite)
    surface.DrawRect(0,0,w,h)
end

vgui.Register("aphone_OnlinePictureList", PANEL, "Panel")
--PATH addons/sh_reports/lua/reports/lib_easynet.lua:
/************************
	easynet by Shendow
	http://steamcommunity.com/id/shendow/

	Copyright (c) 2017

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
************************/

AddCSLuaFile()

EASYNET_STRING = 1
EASYNET_FLOAT = 2
EASYNET_BOOL = 3
EASYNET_UINT8 = 4
EASYNET_UINT16 = 5
EASYNET_UINT32 = 6
EASYNET_STRUCTURES = 7
EASYNET_PLAYER = 8

module("easynet", package.seeall)

local Structures = {}
local Creating

function Start(id)
	Creating = {
		id = id,
		nid = #Structures + 1,
		args = {},
	}
end

function Add(name, type)
	Creating.args[name] = {id = table.Count(Creating.args) + 1, type = type}
end

function Register()
	local id = Creating.id
	Structures[id] = table.Copy(Creating)

	if (SERVER) then
		util.AddNetworkString(id)
	end
end

local function read(typ, name)
	if (typ == EASYNET_STRING) then
		return net.ReadString()
	elseif (typ == EASYNET_FLOAT) then
		return net.ReadFloat()
	elseif (typ == EASYNET_BOOL) then
		return net.ReadBool()
	elseif (typ == EASYNET_UINT8) then
		return net.ReadUInt(8)
	elseif (typ == EASYNET_UINT16) then
		return net.ReadUInt(16)
	elseif (typ == EASYNET_UINT32) then
		return net.ReadUInt(32)
	elseif (typ == EASYNET_STRUCTURES) then
		local t = {}
		local struct = Structures[name]

		for i = 1, net.ReadUInt(16) do
			t[i] = {}

			for n, arg in SortedPairsByMemberValue (struct.args, "id") do
				t[i][n] = read(arg.type, n)
			end
		end

		return t
	elseif (typ == EASYNET_PLAYER) then
		return Player(net.ReadUInt(16))
	end
end

function Callback(id, cb)
	net.Receive(id, function(len, ply)
		if (_EASYNET_DEBUG) then
			print("[EasyNet][Rcv][" .. id .. "] " .. (len / 8) .. " bytes")
		end

		local struct = Structures[id]

		local data = {}
		for name, arg in SortedPairsByMemberValue (struct.args, "id") do
			data[name] = read(arg.type, name)
		end

		cb(data, ply)
	end)
end

local function write(val, typ, name)
	if (typ == EASYNET_STRING) then
		net.WriteString(val)
	elseif (typ == EASYNET_FLOAT) then
		net.WriteFloat(val)
	elseif (typ == EASYNET_BOOL) then
		net.WriteBool(val)
	elseif (typ == EASYNET_UINT8) then
		if (isstring(val)) then
			val = tonumber(val) or 0
		end

		net.WriteUInt(val, 8)
	elseif (typ == EASYNET_UINT16) then
		net.WriteUInt(val, 16)
	elseif (typ == EASYNET_UINT32) then
		net.WriteUInt(val, 32)
	elseif (typ == EASYNET_STRUCTURES) then
		local struct = Structures[name]

		net.WriteUInt(table.Count(val), 16)

		for k, v in pairs (val) do
			for n, arg in SortedPairsByMemberValue (struct.args, "id") do
				write(v[n], arg.type, n)
			end
		end
	elseif (typ == EASYNET_PLAYER) then
		net.WriteUInt(IsValid(val) and val:UserID() or 0, 16)
	end
end

local function prepare(id, data)
	local struct = Structures[id]

	net.Start(id)
		for name, arg in SortedPairsByMemberValue (struct.args, "id") do
			write(data[name], arg.type, name)
		end

		if (_EASYNET_DEBUG) then
			print("[EasyNet][Send][" .. id .. "] " .. net.BytesWritten() .. " bytes")
		end
end

if (SERVER) then
	function Send(rec, id, data)
		prepare(id, data)
		net.Send(rec)
	end
else
	function SendToServer(id, data)
		prepare(id, data)
		net.SendToServer()
	end
end
--PATH addons/sh_reports/lua/reports/cl_menu_rating.lua:
local function L(...) return SH_REPORTS:L(...) end

local matStar = Material("shenesis/reports/star.png", "noclamp smooth")

function SH_REPORTS:ShowRating(report_id, admin_name)
	if (IsValid(_SH_REPORTS_RATE)) then
		_SH_REPORTS_RATE:Remove()
	end

	local styl = self.Style
	local th, m = self:GetPadding(), self:GetMargin()
	local m2 = m * 0.5
	local ss = self:GetScreenScale()

	local cur_rate = 3
	local is = 64 * ss

	local frame = self:MakeWindow(L"rating")
	frame:SetSize(1, 144 * ss + m * 2)
	frame:MakePopup()
	_SH_REPORTS_RATE = frame

		local stars = vgui.Create("DPanel", frame)
		stars:SetDrawBackground(false)
		stars:Dock(FILL)
		stars:DockMargin(m, m, m, m)

			for i = 1, 5 do
				local st = vgui.Create("DButton", stars)
				st:SetToolTip(i .. "/" .. 5)
				st:SetText("")
				st:SetWide(64 * ss)
				st:Dock(LEFT)
				st:DockMargin(0, 0, m2, 0)
				st.Paint = function(me, w, h)
					if (!me.m_CurColor) then
						me.m_CurColor = styl.inbg
					else
						me.m_CurColor = self:LerpColor(FrameTime() * 20, me.m_CurColor, cur_rate >= i and styl.rating or styl.inbg)
					end

					surface.SetMaterial(matStar)
					surface.SetDrawColor(me.m_CurColor)
					surface.DrawTexturedRect(0, 0, w, h)
				end
				st.OnCursorEntered = function()
					cur_rate = i
				end
				st.DoClick = function()
					easynet.SendToServer("SH_REPORTS.RateAdmin", {report_id = report_id, rating = i})
					frame:Close()
				end
			end

		local lbl = self:QuickLabel(L("rate_question", admin_name), "{prefix}Large", styl.text, frame)
		lbl:SetContentAlignment(5)
		lbl:Dock(BOTTOM)
		lbl:DockMargin(0, 0, 0, m)
		
	frame:SetWide(math.max(400 * ss, lbl:GetWide() + m * 2))
	frame:Center()
	
	local sp = math.ceil((frame:GetWide() - (64 * ss) * 5 - m * 4) * 0.5)
	stars:DockPadding(sp, 0, sp, 0)
end

easynet.Callback("SH_REPORTS.PromptRating", function(data)
	SH_REPORTS:ShowRating(data.report_id, data.admin_name)
end)
--PATH lua/autorun/drg_roach_ds1megapack_precache.lua:

game.AddParticles("particles/nito.pcf")
	PrecacheParticleSystem("nito_cloak")
	PrecacheParticleSystem("nito_scream_shadows")
game.AddParticles("particles/ds1_ornstein_lightning.pcf")
	PrecacheParticleSystem("ds_ornstein_lightning")
game.AddParticles("particles/ds1_darkorb.pcf")
	PrecacheParticleSystem("ds1_darkorb")
game.AddParticles("particles/ds1_artorias_fx.pcf")
	PrecacheParticleSystem("dskart_ambient")
	PrecacheParticleSystem("dskart_ambient_shadows_3") -- buffed aura
	PrecacheParticleSystem("dskart_ambient_flux") -- buffed aura #2
	PrecacheParticleSystem("dskart_aura_feet_heat")
	PrecacheParticleSystem("dskart_aura_feet_swirls")
	PrecacheParticleSystem("dskart_aura_feet_xy")
	PrecacheParticleSystem("dskart_blade_hit")
	PrecacheParticleSystem("dskart_charge")
	PrecacheParticleSystem("dskart_fw_charge")
	PrecacheParticleSystem("dskart_postcharge")
	PrecacheParticleSystem("dskart_slam")


function GenerateNewFontStyle()
if !CLIENT then return end
	surface.CreateFont("Dark_Font", {
		font = "Adobe Garamond Pro",
		size = 32,
		shadow = true,
		additive = false
	})
end
GenerateNewFontStyle()

CreateConVar("drg_ds1_redphantoms", 0, {FCVAR_ARCHIVE}, "Enable red phantom NPCs (Health+Damage buff)")
CreateConVar("drg_ds1_healthbars", 1, FCVAR_ARCHIVE, "Enables Health Bars", 0, 1)

local function DRG_DS1_OPTIONS_IDKLOL(Panel)
    if !game.SinglePlayer() then
        if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
            Panel:AddControl( "Label", {Text = "You are not an admin!"})
            Panel:ControlHelp("Notice: Only admins can change this settings.")
            return
        end
    end

	Panel:AddControl("Checkbox", {Label = "Enable Red Phantoms (Damage+HP Buff)", Command = "drg_ds1_redphantoms"})
	Panel:AddControl("Checkbox", {Label = "Enable Health Bars", Command = "drg_ds1_healthbars"})
end
hook.Add("PopulateToolMenu", "DRG_ADDTOMENU_DS1MP", function()spawnmenu.AddToolMenuOption("DrGBase", "Dark Souls 1", "Dark Souls 1", "Dark Souls 1", "", "", DRG_DS1_OPTIONS_IDKLOL, {})end)
--PATH lua/drgbase/possession.lua:

local PossessionEnabled = CreateConVar("drgbase_possession_enable", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
local EnableLockOn = CreateConVar("drgbase_possession_allow_lockon", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})

properties.Add("drgbasepossess", {
	MenuLabel = "Possess",
	Order = 1000,
	MenuIcon = "drgbase/icon16.png",
	Filter = function(self, ent, ply)
		if not ent.IsDrGNextbot then return false end
		if not PossessionEnabled:GetBool() then return false end
		if not ent.PossessionPrompt then return false end
		if not ent:IsPossessionEnabled() then return false end
		return true
	end,
	Action = function(self, ent)
		self:MsgStart()
		net.WriteEntity(ent)
		self:MsgEnd()
	end,
	Receive = function(self, len, ply)
		local ent = net.ReadEntity()
		local possess = ent:Possess(ply)
		if possess == "ok" then
			net.Start("DrGBaseNextbotCanPossess")
			net.WriteEntity(ent)
		else
			net.Start("DrGBaseNextbotCantPossess")
			net.WriteEntity(ent)
			net.WriteString(possess)
		end
		net.Send(ply)
	end
})

hook.Add("StartCommand", "DrGBasePossessionStartCommand", function(ply, cmd)
	if not isfunction(ply.DrG_IsPossessing) then return end
	if ply:DrG_IsPossessing() then
		local possessing = ply:DrG_GetPossessing()
		-- disable movement
		cmd:ClearMovement()
		if ply:HasWeapon("drgbase_possession") then
			cmd:SelectWeapon(ply:GetWeapon("drgbase_possession"))
		elseif SERVER then
			ply:Give("drgbase_possession")
		end
		-- lock on entity
		local lockedOn = possessing:PossessionGetLockedOn()
		if IsValid(lockedOn) then
			local origin = possessing:PossessorView()
			local viewAng = cmd:GetViewAngles()
			local targetAng = origin:DrG_Direction(lockedOn:WorldSpaceCenter()):Angle()
			local bone = lockedOn.DrGBase_LockOnBone
			if isstring(bone) then bone = lockedOn:LookupBone(bone) end
			if isnumber(bone) then
				targetAng = origin:DrG_Direction(lockedOn:GetBonePosition(bone)):Angle()
			end
			if SERVER then
				cmd:SetViewAngles(LerpAngle(ply:GetInfoNum("drgbase_possession_lockon_speed", 0.05), viewAng, targetAng))
			else
				cmd:SetViewAngles(LerpAngle(GetConVar("drgbase_possession_lockon_speed"):GetFloat(), viewAng, targetAng))
			end
		end
	elseif SERVER then
		ply:StripWeapon("drgbase_possession")
	end
end)

hook.Add("PlayerFootstep", "DrGBasePossessionMuteFootsteps", function(ply)
	if not isfunction(ply.DrG_IsPossessing) then return end
	if ply:DrG_IsPossessing() then return true end
end)

if SERVER then
	util.AddNetworkString("DrGBaseNextbotCanPossess")
	util.AddNetworkString("DrGBaseNextbotCantPossess")

	hook.Add("PlayerUse", "DrGBaseNextbotPossessionDisableUse", function(ply, ent)
		if ply:DrG_IsPossessing() then return false end
	end)

	hook.Add("EntityTakeDamage", "DrGBaseNextbotProtectPossessingPlayer", function(ent, dmg)
		if ent:IsPlayer() and ent:DrG_IsPossessing() then return true end
	end)

	local function PlayerDeath(ply)
		if ply:DrG_IsPossessing() then ply:DrG_Possessing():Dispossess() end
	end
	hook.Add("PlayerDeath", "DrGBasePossessionPlayerDeath", PlayerDeath)
	hook.Add("PlayerSilentDeath", "DrGBasePossessionPlayerSilentDeath", PlayerDeath)

	local function LockOnEntity(nextbot, ent)
		nextbot._DrGBaseAutoLockOnID = nextbot._DrGBaseAutoLockOnID or 0
		nextbot._DrGBaseAutoLockOnID = nextbot._DrGBaseAutoLockOnID+1
		local id = nextbot._DrGBaseAutoLockOnID
		nextbot:PossessionLockOn(ent)
		ent:CallOnRemove("DrGBasePossessionSwitchLockOn", function()
			if not IsValid(nextbot) then return end
			if id == nextbot._DrGBaseAutoLockOnID then
				local closest = nextbot:PossessionFetchLockOn()
				if IsValid(closest) then LockOnEntity(nextbot, closest) end
			end
		end)
	end

	hook.Add("PlayerButtonDown", "DrGBasePossessionButtons", function(ply, button)
		if not ply:DrG_IsPossessing() then return end
		local possessing = ply:DrG_Possessing()
		if SERVER then
			if button == ply:GetInfoNum("drgbase_possession_view", KEY_V) then
				possessing:CycleViewPresets()
			elseif button == ply:GetInfoNum("drgbase_possession_exit", KEY_E) then
				possessing:Dispossess()
			elseif button == ply:GetInfoNum("drgbase_possession_lockon", KEY_L) and EnableLockOn:GetBool() then
				local lockedOn = possessing:PossessionGetLockedOn()
				local closest = possessing:PossessionFetchLockOn()
				if closest ~= lockedOn and IsValid(closest) then
					LockOnEntity(possessing, closest)
				else possessing:PossessionLockOn(NULL) end
			end
		end
	end)

	hook.Add("PlayerSwitchFlashlight", "DrGBasePossessionDisableFlashlight", function(ply, state)
		--if ply:DrG_IsPossessing() and state then return false end
	end)

	hook.Add("GetFallDamage", "DrGBasePossessionPlayerFallDamage", function(ply)
		if ply:DrG_IsPossessing() then return 0 end
	end)

	hook.Add("SetupPlayerVisibility", "DrGBasePossessionAddToPVS", function(ply)
		if ply:DrG_IsPossessing() then
			local possessing = ply:DrG_GetPossessing()
			AddOriginToPVS(possessing:GetPos())
			local lockedOn = possessing:PossessionGetLockedOn()
			if IsValid(lockedOn) then AddOriginToPVS(lockedOn:GetPos()) end
		end
	end)

	hook.Add("EntityEmitSound", "DrGBasePossessionMutePlayerSounds", function(sound)
		if IsValid(sound.Entity) and sound.Entity:IsPlayer() and sound.Entity:DrG_IsPossessing() then
			return false
		end
	end)

else

	CreateClientConVar("drgbase_possession_exit", tostring(KEY_E), true, true)
	CreateClientConVar("drgbase_possession_view", tostring(KEY_V), true, true)
	CreateClientConVar("drgbase_possession_climb", tostring(KEY_C), true, true)
	CreateClientConVar("drgbase_possession_lockon", tostring(KEY_L), true, true)
	CreateClientConVar("drgbase_possession_lockon_speed", "0.05", true, true)

	net.Receive("DrGBaseNextbotCanPossess", function()
		local ent = net.ReadEntity()
		if not IsValid(ent) then return end
		notification.AddLegacy("You are now possessing "..ent.PrintName..".", NOTIFY_HINT, 4)
		surface.PlaySound("buttons/lightswitch2.wav")
	end)

	net.Receive("DrGBaseNextbotCantPossess", function()
		local ent = net.ReadEntity()
		if not IsValid(ent) then return end
		local enum = net.ReadString()
		local reason = enum
		if enum == "not allowed" then reason = "you are not allowed to possess this nextbot."
		elseif enum == "already possessed" then reason = "another player is already possessing this nextbot."
		elseif enum == "error" then reason = "unknown error."
		elseif enum == "not alive" then reason = "you are dead."
		elseif enum == "already possessing" then reason = "you are already possessing a nextbot."
		elseif enum == "disabled" then reason = "possession is not available for this nextbot."
		elseif enum == "no views" then reason = "no defined camera views."
		elseif enum == "in vehicle" then reason = "you are in a vehicle."
		end
		notification.AddLegacy("You can't possess "..ent.PrintName..": "..reason, NOTIFY_ERROR, 4)
		surface.PlaySound("buttons/button10.wav")
	end)

	local HUD_HIDE = {
		["CHudWeaponSelection"] = true,
		["CHudAmmo"] = true,
		["CHudSecondaryAmmo"] = true,
		["CHudZoom"] = true
	}
	hook.Add("HUDShouldDraw", "DrGBasePossessionHideHUD", function(name)
		local ply = LocalPlayer()
		if not isfunction(ply.DrG_IsPossessing) then return end
		if not ply:DrG_IsPossessing() then return end
		if HUD_HIDE[name] then return false end
		if name == "CHudCrosshair" and not ply:DrG_Possessing().PossessionCrosshair then return false end
	end)

	hook.Add("CalcView", "DrGBasePossessionCalcView", function(ply, origin, angles, fov, znear, zfar)
		if not isfunction(ply.DrG_IsPossessing) then return end
		if not ply:DrG_IsPossessing() then return end
		local possessing = ply:DrG_Possessing()
		if not isfunction(possessing.PossessorView) then return end
		local view = {}
		view.origin, view.angles = possessing:PossessorView()
		view.fov, view.znear, view.zfar = fov, znear, zfar
		view.drawviewer = true
		return view
	end)

	hook.Add("ContextMenuOpen", "DrGBasePossessionDisableCMenu", function()
		local ply = LocalPlayer()
		if not isfunction(ply.DrG_IsPossessing) then return end
		if ply:DrG_IsPossessing() then return false end
	end)

	hook.Add("ShouldDrawLocalPlayer", "DrGBasePossessionDrawPlayer", function(ply)
		if not isfunction(ply.DrG_IsPossessing) then return end
		if ply:DrG_IsPossessing() then return false end
	end)

	function DrGBase.DrawPossessionHUD(ent)
		local ply = LocalPlayer()
		-- I should put the rest of the HUD code here but
		-- I don't have any inspiration for how the HUD should look
		-- so right now there is no code here
		-- I'll take care of it one day
	end

end

--PATH lua/drgbase/modules/net.lua:
-- Util --

local function IsPlayer(arg)
	if not isentity(arg) then return false end
	if not IsValid(arg) then return false end
	if not arg:IsPlayer() then return false end
	return true
end

function net.DrG_WriteMessage(...)
	local args, n = table.DrG_Pack(...)
	net.WriteUInt(n, 32)
	for i = 1, n do
		net.WriteType(args[i])
	end
end
function net.DrG_ReadMessage()
	local n = net.ReadUInt(32)
	local args = {}
	for i = 1, n do
		args[i] = net.ReadType()
	end
	return args, n
end

-- Messages --

if SERVER then
	util.AddNetworkString("DrGBaseNetMessage")
end

local NET_MESSAGES = {}
function net.DrG_Receive(name, callback)
	if isfunction(callback) then NET_MESSAGES[name] = callback
	else NET_MESSAGES[name] = nil end
end
function net.DrG_Send(name, ...)
	if not isstring(name) then return false end
	net.Start("DrGBaseNetMessage")
	net.WriteString(name)
	net.DrG_WriteMessage(...)
	if SERVER then net.Broadcast()
	else net.SendToServer() end
	return true
end
net.Receive("DrGBaseNetMessage", function(len, ply)
	local name = net.ReadString()
	if not isfunction(NET_MESSAGES[name]) then return end
	local args, n = net.DrG_ReadMessage()
	if SERVER then NET_MESSAGES[name](ply, table.DrG_Unpack(args, n))
	else NET_MESSAGES[name](table.DrG_Unpack(args, n)) end
end)

-- Callbacks --

local NET_REQ_ID = 0

if SERVER then
	util.AddNetworkString("DrGBaseNetCallbackReq")
	util.AddNetworkString("DrGBaseNetCallbackRes")
end

local NET_CALLBACKS = {}
function net.DrG_DefineCallback(name, callback)
	if not isstring(name) then return end
	if isfunction(callback) then
		NET_CALLBACKS[name] = callback
	else NET_CALLBACKS[name] = nil end
end
function net.DrG_RemoveCallback(name)
	return net.DrG_DefineCallback(name, nil)
end

local NET_REQ_WAITING = {}
net.Receive("DrGBaseNetCallbackRes", function()
	local id = net.ReadUInt(32)
	if not isfunction(NET_REQ_WAITING[id]) then return end
	local args, n = net.DrG_ReadMessage()
	NET_REQ_WAITING[id](table.DrG_Unpack(args, n))
	NET_REQ_WAITING[id] = nil
end)
function net.DrG_UseCallback(name, callback, ...)
	if not isstring(name) then return false end
	local args, n
	if SERVER then
		args, n = table.DrG_Pack(...)
		local ply = args[1]
		if not IsPlayer(ply) then return false end
	end
	local id = NET_REQ_ID
	NET_REQ_ID = NET_REQ_ID+1
	NET_REQ_WAITING[id] = callback
	net.Start("DrGBaseNetCallbackReq")
	net.WriteUInt(id, 32)
	net.WriteString(name)
	if SERVER then
		net.DrG_WriteMessage(table.DrG_Unpack(table.DrG_Pack(args, n, 2)))
		net.Send(ply)
	else
		net.DrG_WriteMessage(...)
		net.SendToServer()
	end
	return true
end
net.Receive("DrGBaseNetCallbackReq", function(len, ply)
	local id = net.ReadUInt(32)
	local name = net.ReadString()
	if not isfunction(NET_CALLBACKS[name]) then return end
	local args, n = net.DrG_ReadMessage()
	net.Start("DrGBaseNetCallbackRes")
	net.WriteUInt(id, 32)
	net.DrG_WriteMessage(NET_CALLBACKS[name](table.DrG_Unpack(args, n)))
	if SERVER then net.Send(ply)
	else net.SendToServer() end
end)

--PATH addons/sl_util_wallet/lua/ezwallet/client/fonts.lua:


local ratio = ScrW()/640

function easzy.wallet.CreateFont(name, font, size, options)
    local name = (name or "NewFont") .. size
    local options = options or {}
    options.size = ScreenScale(size/ratio)
    options.font = font

    surface.CreateFont(name, options)
    return name
end

function easzy.wallet.CreateFonts(name, font, sizes, options)
    local names = {}
    for _, size in ipairs(sizes) do
        table.insert(names, easzy.wallet.CreateFont(name, font, size, options))
    end
    return names
end

easzy.wallet.CreateFonts("EZFont", "Gidole", {36, 48})

hook.Add("OnScreenSizeChanged", "ezwallet_fonts_OnScreenSizeChanged", function()
	ratio = ScrW()/640
    easzy.wallet.CreateFonts("EZFont", "Gidole", {36, 48})
end)

--PATH addons/sl_util_wallet/lua/ezwallet_items_config.lua:
easzy.wallet.walletItemsConfig = easzy.wallet.walletItemsConfig or {}

local function GetCardClass()
    if easzy.wallet.config.bankSystem == "Crap-Head ATM" then
        return "weapon_ch_atm_card"
    elseif easzy.wallet.config.bankSystem == "Glorified Banking" then
        return "glorifiedbanking_card"
    elseif easzy.wallet.config.bankSystem == "ARCBank" then
        return "weapon_arc_atmcard"
    else
        return "ez_wallet_card"
    end
end

easzy.wallet.walletItemsConfig = {
    ["easzy/ez_wallet/banknote"] = {
        walletText = easzy.wallet.languages.money,
        walletTextAlign = TEXT_ALIGN_RIGHT,
        walletTextPos = {
            x = -700,
            y = -460,
        },
        ent = "ez_wallet_money",
        bodygroup = "banknote",
        attachmentTopLeft = "banknote_top_left",
        attachmentBottomRight = "banknote_bottom_right",
        slide = "banknote_slide",
        take = "banknote_take"
    },
    ["easzy/ez_wallet/credit_card"] = {
        walletText = easzy.wallet.languages.creditCard,
        walletTextAlign = TEXT_ALIGN_RIGHT,
        walletTextPos = {
            x = -700,
            y = -350,
        },
        name = {
            font = "EZFont48",
            pos = {
                x = 300,
                y = 435
            }
        },
        ent = GetCardClass(),
        bodygroup = "credit_card",
        bodygroupValue = "credit_card.smd",
        attachmentTopLeft = "credit_card_top_left",
        attachmentBottomRight = "credit_card_bottom_right",
        slide = "credit_card_slide",
        take = "credit_card_take"
    },
    ["easzy/ez_wallet/id_card_fr"] = {
        walletText = easzy.wallet.languages.idCard,
        walletTextAlign = TEXT_ALIGN_RIGHT,
        walletTextPos = {
            x = -700,
            y = -220,
        },
        picture = {
            pos = {
                x = 280,
                y = 140
            },
            size = {
                w = 320,
                h = 320
            }
        },
        lastName = {
            font = "EZFont48",
            pos = {
                x = 565,
                y = 130
            }
        },
        firstName = {
            font = "EZFont48",
            pos = {
                x = 565,
                y = 200
            }
        },
        id = {
            font = "EZFont48",
            pos = {
                x = 293,
                y = 945
            }
        },
        ent = "ez_wallet_card",
        bodygroup = "id_card",
        bodygroupValue = "id_card_fr.smd",
        attachmentTopLeft = "id_card_top_left",
        attachmentBottomRight = "id_card_bottom_right",
        slide = "id_card_slide",
        take = "id_card_take"
    },
    ["easzy/ez_wallet/id_card_us"] = {
        walletText = easzy.wallet.languages.idCard,
        walletTextAlign = TEXT_ALIGN_RIGHT,
        walletTextPos = {
            x = -700,
            y = -220,
        },
        picture = {
            pos = {
                x = 266,
                y = 127
            },
            size = {
                w = 300,
                h = 300
            }
        },
        lastName = {
            font = "EZFont36",
            pos = {
                x = 550,
                y = 197
            }
        },
        firstName = {
            font = "EZFont36",
            pos = {
                x = 624,
                y = 255
            }
        },
        id = {
            font = "EZFont48",
            pos = {
                x = 280,
                y = 930
            }
        },
        ent = "ez_wallet_card",
        bodygroup = "id_card",
        bodygroupValue = "id_card_us.smd",
        attachmentTopLeft = "id_card_top_left",
        attachmentBottomRight = "id_card_bottom_right",
        slide = "id_card_slide",
        take = "id_card_take"
    },
    ["easzy/ez_wallet/driver_license_fr"] = {
        walletText = easzy.wallet.languages.driverLicense,
        walletTextAlign = TEXT_ALIGN_LEFT,
        walletTextPos = {
            x = 700,
            y = -350,
        },
        picture = {
            pos = {
                x = 265,
                y = 140
            },
            size = {
                w = 260,
                h = 260
            }
        },
        lastName = {
            font = "EZFont36",
            pos = {
                x = 500,
                y = 112
            }
        },
        firstName = {
            font = "EZFont36",
            pos = {
                x = 500,
                y = 142
            }
        },
        id = {
            font = "EZFont48",
            pos = {
                x = 285,
                y = 438
            }
        },
        driverLicense = {
            font = "EZFont48",
            car = {
                 pos = {
                    x = 790,
                    y = 580
                }
            },
            motorcycle = {
                pos = {
                    x = 790,
                    y = 695
                }
            },
            truck = {
                pos = {
                    x = 790,
                    y = 805
                }
            },
            bus = {
                pos = {
                    x = 790,
                    y = 915
                }
            },
        },
        ent = "ez_wallet_card",
        bodygroup = "driver_license",
        bodygroupValue = "driver_license_fr.smd",
        attachmentTopLeft = "driver_license_top_left",
        attachmentBottomRight = "driver_license_bottom_right",
        slide = "driver_license_slide",
        take = "driver_license_take"
    },
    ["easzy/ez_wallet/driver_license_us"] = {
        walletText = easzy.wallet.languages.driverLicense,
        walletTextAlign = TEXT_ALIGN_LEFT,
        walletTextPos = {
            x = 700,
            y = -350,
        },
        picture = {
            pos = {
                x = 260,
                y = 120
            },
            size = {
                w = 300,
                h = 300
            }
        },
        lastName = {
            font = "EZFont36",
            pos = {
                x = 560,
                y = 200
            }
        },
        firstName = {
            font = "EZFont36",
            pos = {
                x = 560,
                y = 230
            }
        },
        id = {
            font = "EZFont36",
            pos = {
                x = 558,
                y = 105
            }
        },
        driverLicense = {
            font = "EZFont48",
            car = {
                 pos = {
                    x = 790,
                    y = 580
                }
            },
            motorcycle = {
                pos = {
                    x = 790,
                    y = 695
                }
            },
            truck = {
                pos = {
                    x = 790,
                    y = 805
                }
            },
            bus = {
                pos = {
                    x = 790,
                    y = 915
                }
            },
        },
        ent = "ez_wallet_card",
        bodygroup = "driver_license",
        bodygroupValue = "driver_license_us.smd",
        attachmentTopLeft = "driver_license_top_left",
        attachmentBottomRight = "driver_license_bottom_right",
        slide = "driver_license_slide",
        take = "driver_license_take"
    },
    ["easzy/ez_wallet/weapon_license_fr"] = {
        walletText = easzy.wallet.languages.weaponLicense,
        walletTextAlign = TEXT_ALIGN_LEFT,
        walletTextPos = {
            x = 700,
            y = -220,
        },
        picture = {
            pos = {
                x = 275,
                y = 130
            },
            size = {
                w = 260,
                h = 260
            }
        },
        lastName = {
            font = "EZFont36",
            pos = {
                x = 595,
                y = 142
            }
        },
        firstName = {
            font = "EZFont36",
            pos = {
                x = 630,
                y = 180
            }
        },
        id = {
            font = "EZFont48",
            pos = {
                x = 285,
                y = 438
            }
        },
        weaponLicense = {
            font = "EZFont48",
            pistol = {
                 pos = {
                    x = 780,
                    y = 600
                }
            },
            shotgun = {
                pos = {
                    x = 780,
                    y = 695
                }
            },
            rifle = {
                pos = {
                    x = 780,
                    y = 790
                }
            },
            sniper = {
                pos = {
                    x = 780,
                    y = 885
                }
            },
        },
        ent = "ez_wallet_card",
        bodygroup = "weapon_license",
        bodygroupValue = "weapon_license_fr.smd",
        attachmentTopLeft = "weapon_license_top_left",
        attachmentBottomRight = "weapon_license_bottom_right",
        slide = "weapon_license_slide",
        take = "weapon_license_take"
    },
    ["easzy/ez_wallet/weapon_license_us"] = {
        walletText = easzy.wallet.languages.weaponLicense,
        walletTextAlign = TEXT_ALIGN_LEFT,
        walletTextPos = {
            x = 700,
            y = -220,
        },
        picture = {
            pos = {
                x = 275,
                y = 130
            },
            size = {
                w = 260,
                h = 260
            }
        },
        lastName = {
            font = "EZFont36",
            pos = {
                x = 648,
                y = 142
            }
        },
        firstName = {
            font = "EZFont36",
            pos = {
                x = 654,
                y = 179
            }
        },
        id = {
            font = "EZFont48",
            pos = {
                x = 285,
                y = 438
            }
        },
        weaponLicense = {
            font = "EZFont48",
            pistol = {
                 pos = {
                    x = 780,
                    y = 600
                }
            },
            shotgun = {
                pos = {
                    x = 780,
                    y = 695
                }
            },
            rifle = {
                pos = {
                    x = 780,
                    y = 790
                }
            },
            sniper = {
                pos = {
                    x = 780,
                    y = 885
                }
            },
        },
        ent = "ez_wallet_card",
        bodygroup = "weapon_license",
        bodygroupValue = "weapon_license_us.smd",
        attachmentTopLeft = "weapon_license_top_left",
        attachmentBottomRight = "weapon_license_bottom_right",
        slide = "weapon_license_slide",
        take = "weapon_license_take"
    },
}

--PATH addons/gmod_info_board/lua/gmod_info_board/cl/gmib_cl.lua:
gmib.boards = {}
gmib.ads = {}
gmib.entities = {}
gmib.bodies = {}
gmib.blacklist = {}
gmib.bck = {}

surface.CreateFont( "gmib_menu_font18", {
	font = "Louis George Café",
	size = 18,
	weight = 550,
	antialias = true,
	additive = false,
	strikeout = true,
} )


surface.CreateFont( "gmib_font32_1", {
	font = "Cardenio Modern",
	size = 32,
	weight = 400,
	antialias = true,
	additive = false,
	strikeout = true,
} )

surface.CreateFont( "gmib_font48_1", {
	font = "Cardenio Modern",
	size = 48,
	weight = 400,
	antialias = true,
	additive = false,
	strikeout = true,
} )

surface.CreateFont( "gmib_font32_2", {
	font = "JuanMikes",
	size = 32,
	weight = 400,
	antialias = true,
	additive = false,
	strikeout = true,
} )

surface.CreateFont( "gmib_font48_2", {
	font = "JuanMikes",
	size = 48,
	weight = 400,
	antialias = true,
	additive = false,
	strikeout = true,
} )

surface.CreateFont( "gmib_font32_3", {
	font = "Marker SD",
	size = 32,
	weight = 400,
	antialias = true,
	additive = false,
	strikeout = true,
} )

surface.CreateFont( "gmib_font48_3", {
	font = "Marker SD",
	size = 48,
	weight = 400,
	antialias = true,
	additive = false,
	strikeout = true,
} )

--generating random paper backgrounds
for b=1,10,1 do
	--gmib.bck[b] = math.floor(math.Rand(1,5))
	gmib.bck[b] = Material("2rek/gmib/ads/lq_paper" .. math.Round(math.Rand(1,5)) .. ".png", "noclamp smooth")
end

function gmib.reloadAds(ads)
	gmib.ads = ads
	
	for k=0,10,1 do
		gmib.bodies[k] = {}
		for l=0,10,1 do
			gmib.bodies[k][l] = ""
		end
	end
	
	for i=1,10,1 do
		if gmib.ads[i] then
			gmib.calculateAd(i)
		end
	end
	
end

function gmib.calculateAd(num)
	local len = string.len(gmib.ads[num].body)
	local lines = len/20
	gmib.ads[num].lines = math.floor(lines) + 1
	
	local bodySplit = string.Split( gmib.ads[num].body, " " )
	local wordCount = 1
	local lineCount = 1
	
	function formatBody()
		if gmib.bodies[num][lineCount] == nil then return end
		if string.len(gmib.bodies[num][lineCount] .. " " .. bodySplit[wordCount]) <= 28 then
			gmib.bodies[num][lineCount] = gmib.bodies[num][lineCount] .. " " .. bodySplit[wordCount]
			wordCount = wordCount + 1
		else
			lineCount = lineCount + 1
		end
		if wordCount <= table.Count(bodySplit) then
			formatBody()
		end
	end
	formatBody()
end


function gmib.openMenu(jobs,admin,boardId)
	
	local main = vgui.Create( "DFrame" )
	main:SetTitle( "Post advertisment" )
	main:MakePopup()
	main:SetSize( 400, 450 )
	main:SetPos( 0, ScrH() )
	main:CenterHorizontal()
	main:MoveTo( ScrW() / 2 - 200, ScrH() / 2 - 300, 0.5, 0.25 )
	
	local title = vgui.Create("DTextEntry")
	title:SetParent(main)
	title:SetPos(123,50)
	title:SetSize(155,35)
	title:SetText("Choose title")
	title:SetTextColor(Color(15,15,15))
	title:SetFont("gmib_menu_font18")
	
	local body = vgui.Create("DTextEntry")
	body:SetParent(main)
	body:SetPos(50-7,100)
	body:SetSize(315,120)
	body:SetText("Here you can put body of your ad/information/sell or buy offer/job posting. Be sure to post essential informations. This text is about the maximum available space. Make sure you filled your ad correctly before posting. Text formatting may differ.")
	body:SetMultiline(true)
	body:SetTextColor(Color(15,15,15))
	body:SetFont("gmib_menu_font18")
	
	local labelAnonymous = vgui.Create("DLabel")
	labelAnonymous:SetPos(50-7,200)
	labelAnonymous:SetSize(200,100)
	labelAnonymous:SetText("Anonymous:")
	labelAnonymous:SetParent(main)
	labelAnonymous:SetFont("gmib_menu_font18")
	labelAnonymous:SetContentAlignment( 4 )
	
	local labelPermanent = vgui.Create("DLabel")
	labelPermanent:SetPos(50-7,225)
	labelPermanent:SetSize(200,100)
	labelPermanent:SetText("Permanent (admin only):")
	labelPermanent:SetParent(main)
	labelPermanent:SetFont("gmib_menu_font18")
	labelPermanent:SetContentAlignment( 4 )
	
	local labelTime = vgui.Create("DLabel")
	labelTime:SetPos(50-7,250)
	labelTime:SetSize(200,100)
	labelTime:SetText("How long:")
	labelTime:SetParent(main)
	labelTime:SetFont("gmib_menu_font18")
	labelTime:SetContentAlignment( 4 )
	
	local labelServerWide = vgui.Create("DLabel")
	labelServerWide:SetPos(50-7,275)
	labelServerWide:SetSize(200,100)
	labelServerWide:SetText("Job related:")
	labelServerWide:SetParent(main)
	labelServerWide:SetFont("gmib_menu_font18")
	labelServerWide:SetContentAlignment( 4 )
	
	local labelLine = vgui.Create("DLabel")
	labelLine:SetPos(50-7,300)
	labelLine:SetSize(200,100)
	labelLine:SetText("___________")
	labelLine:SetParent(main)
	labelLine:SetFont("gmib_menu_font18")
	labelLine:SetContentAlignment( 4 )
	
	local labelPrice = vgui.Create("DLabel")
	labelPrice:SetPos(50-7,325)
	labelPrice:SetSize(200,100)
	labelPrice:SetText("Price:")
	labelPrice:SetParent(main)
	labelPrice:SetFont("gmib_menu_font18")
	labelPrice:SetContentAlignment( 4 )
	
	local labelFinalPrice = vgui.Create("DLabel")
	labelFinalPrice:SetPos(159,365)
	labelFinalPrice:SetSize(200,20)
	labelFinalPrice:SetText("1000$")
	labelFinalPrice:SetParent(main)
	labelFinalPrice:SetFont("gmib_menu_font18")
	labelFinalPrice:SetContentAlignment( 6 )
	
	local anonymousBox = vgui.Create( "DComboBox", main )
	anonymousBox:SetPos( 258, 291 -50 )
	anonymousBox:SetSize( 100, 20 )
	anonymousBox:SetValue( "Choose" )
	anonymousBox:AddChoice( "YES" )
	anonymousBox:AddChoice( "NO" )
	anonymousBox.OnSelect = function( self, index, value )
		calculatePrice()
	end
	
	local permanentBox = vgui.Create( "DComboBox", main )
	permanentBox:SetPos( 258, 291 +25-50 )
	permanentBox:SetSize( 100, 20 )
	permanentBox:SetValue( "Choose" )
	permanentBox:AddChoice( "YES" )
	permanentBox:AddChoice( "NO" )
	permanentBox.OnSelect = function( self, index, value )
		calculatePrice()
	end
	
	local lengthBox = vgui.Create( "DComboBox", main )
	lengthBox:SetPos( 258, 291 +25 +25-50 )
	lengthBox:SetSize( 100, 20 )
	lengthBox:SetValue( "Choose" )
	lengthBox:AddChoice( "1) 30 minutes" )
	lengthBox:AddChoice( "2) 1 hour" )
	lengthBox:AddChoice( "3) 1.5 hour" )
	lengthBox:AddChoice( "4) 2 hours" )
	lengthBox:AddChoice( "5) 3 hours" )
	lengthBox.OnSelect = function( self, index, value )
		calculatePrice()
	end
	
	if admin then
		permanentBox:SetDisabled(false)
	else
		permanentBox:SetDisabled(true)
	end
	
	local jobRelatedBox = vgui.Create( "DComboBox", main )
	jobRelatedBox:SetPos( 258, 291 +25 +25 +25-50)
	jobRelatedBox:SetSize( 100, 20 )
	jobRelatedBox:SetValue( "No" )
	for i=1,table.Count(jobs),1 do
		jobRelatedBox:AddChoice(jobs[i])
	end
	jobRelatedBox:AddChoice("No")
	jobRelatedBox.OnSelect = function( self, index, value )
		calculatePrice()
	end
	
	local buyAd = vgui.Create("DButton")
	buyAd:SetPos(258,400)
	buyAd:SetSize( 100, 20 )
	buyAd:SetText("Post ad")
	buyAd:SetParent(main)
	buyAd.DoClick = function()
		local bodySplit = string.Split( body:GetText(), " " )
		for i=1,table.Count(bodySplit),1 do
			if string.len(bodySplit[i]) > 28 then
				notification.AddLegacy( "One of your word is too long.", NOTIFY_ERROR, 4 )
				return
			end
			for j=1,table.Count(gmib.blacklist),1 do
				if bodySplit[i] == gmib.blacklist[j] then
					notification.AddLegacy( "One of your word is blacklisted.", NOTIFY_ERROR, 4 )
					return
				end
			end
		end
		
		local titleSplit = string.Split( title:GetText(), " " )
		for i=1,table.Count(titleSplit),1 do
			if string.len(titleSplit[i]) > 28 then
				notification.AddLegacy( "Your title is too long.", NOTIFY_ERROR, 4 )
				return
			end
			for j=1,table.Count(gmib.blacklist),1 do
				if titleSplit[i] == gmib.blacklist[j] then
					notification.AddLegacy( "Word in title is blacklisted.", NOTIFY_ERROR, 4 )
					return
				end
			end
		end
		
		local data = {}
		data.title = title:GetText()
		data.body = body:GetText()
		
		if anonymousBox:GetValue() == "NO" || anonymousBox:GetValue() == "Choose" then
			data.user = LocalPlayer():Name()
		else
			data.user = "Anonymous"
		end
		
		data.permanent = permanentBox:GetValue()
		
		if permanentBox:GetValue() == "Choose" && lengthBox:GetValue() == "Choose" then
			notification.AddLegacy( "Choose duration.", NOTIFY_ERROR, 4 )
			return
		end
		data.duration = lengthBox:GetValue()
		
		data.jobRelated = jobRelatedBox:GetValue()
		data.price = labelFinalPrice:GetValue()
		
		if DarkRP then
			notification.AddLegacy( "You paid " .. data.price .. " for your ad.", NOTIFY_ERROR, 4 )
		end
		main:Remove()
		net.Start( "gmib_postannouncement" )
		net.WriteTable( data )
		net.WriteEntity(LocalPlayer())
		net.SendToServer()
	end
	
	function calculatePrice()
		local isAnon = anonymousBox:GetValue()
		local isPermanent = permanentBox:GetValue()
		local howLong =  lengthBox:GetValue()
		local isJobRelated = jobRelatedBox:GetValue()
		local price = 0
		local anonFactor = 0
		local lgthFactor = 0
		local swFactor = 0
		local jrFactor = 0
		
		if isAnon == "YES" then
			anonFactor = gmib.settings[1]
		end
		
		if howLong == "1) 30 minutes" then
			lgthFactor = gmib.settings[2]
		elseif howLong == "2) 1 hour" then
			lgthFactor = gmib.settings[3]
		elseif howLong == "3) 1.5 hour" then
			lgthFactor = gmib.settings[4]
		elseif howLong == "4) 2 hours" then
			lgthFactor = gmib.settings[5]
		elseif howLong == "5) 3 hours" then
			lgthFactor = gmib.settings[6]
		end
		
		if isJobRelated != "No" then
			jrFactor = gmib.settings[7]
		end
		
		price = gmib.settings[0] + anonFactor + lgthFactor + swFactor + jrFactor
		
		labelFinalPrice:SetText(price .. "$")
		
	end
	--	end of calculatePrice
	calculatePrice()
end --of gmib.openmenu

net.Receive( "gmib_openMenu", function()
	local admin = net.ReadBool()
	local jobs = net.ReadTable()
	gmib.openMenu(jobs,admin)
end )

function gmib.setEntList(ents)
	gmib.entities = ents
end

net.Receive( "gmib_sendEntList", function()
	local ents = net.ReadTable()
	gmib.setEntList(ents)
end )

net.Receive( "gmib_sendAdsData", function()
	local ads = net.ReadTable()
	gmib.reloadAds(ads)
end )

function gmib.reloadSettings(blist, settings)
	gmib.blacklist = blist
	gmib.settings = settings
end

net.Receive( "gmib_sendSettings", function()
	local blist = net.ReadTable()
	local settings = net.ReadTable()
	gmib.reloadSettings(blist, settings)
end )

function gmib.openManager()
	local main = vgui.Create( "DFrame" )
	main:SetTitle( "Manage ads" )
	main:MakePopup()
	main:SetSize( 500, 400 )
	main:SetPos( 0, ScrH() )
	main:CenterHorizontal()
	main:MoveTo( ScrW() / 2 - 250, ScrH() / 2 - 300, 0.5, 0.25 )

	main.Paint = function(self,w,h)
		draw.RoundedBox( 0, 0, 0, w, h, Color( 1, 1, 1, 205 ) )

		surface.SetDrawColor(205, 205, 205, 155)
		surface.DrawOutlinedRect( 10, 25, 90, 55)

		for i=1,5,1 do 
			surface.DrawOutlinedRect( 10+97*(i-1), 25, 90, 55)
			surface.DrawOutlinedRect( 10+97*(i-1), 82, 90, 55)
		end
	end
	
	local y = 120
	local offset = 25
	
	local label = vgui.Create("DLabel")
	label:SetPos(50-7,y + offset*0)
	label:SetSize(200,100)
	label:SetText("Base ad price:")
	label:SetParent(main)
	label:SetFont("gmib_menu_font18")
	label:SetContentAlignment( 4 )
	
	local labelAnonymous = vgui.Create("DLabel")
	labelAnonymous:SetPos(50-7,y+offset*1)
	labelAnonymous:SetSize(200,100)
	labelAnonymous:SetText("Anonymous price:")
	labelAnonymous:SetParent(main)
	labelAnonymous:SetFont("gmib_menu_font18")
	labelAnonymous:SetContentAlignment( 4 )
	
	local label = vgui.Create("DLabel")
	label:SetPos(50-7,y + offset*2)
	label:SetSize(200,100)
	label:SetText("30 minutes price:")
	label:SetParent(main)
	label:SetFont("gmib_menu_font18")
	label:SetContentAlignment( 4 )
	
	local label = vgui.Create("DLabel")
	label:SetPos(50-7,y + offset*3)
	label:SetSize(200,100)
	label:SetText("1 hour price:")
	label:SetParent(main)
	label:SetFont("gmib_menu_font18")
	label:SetContentAlignment( 4 )
	
	local label = vgui.Create("DLabel")
	label:SetPos(270-7,y + offset*0)
	label:SetSize(200,100)
	label:SetText("1,5 hour price:")
	label:SetParent(main)
	label:SetFont("gmib_menu_font18")
	label:SetContentAlignment( 4 )
	
	local label = vgui.Create("DLabel")
	label:SetPos(270-7,y + offset*1)
	label:SetSize(200,100)
	label:SetText("2 hour price:")
	label:SetParent(main)
	label:SetFont("gmib_menu_font18")
	label:SetContentAlignment( 4 )
	
	local label = vgui.Create("DLabel")
	label:SetPos(270-7,y + offset*2)
	label:SetSize(200,100)
	label:SetText("3 hour price:")
	label:SetParent(main)
	label:SetFont("gmib_menu_font18")
	label:SetContentAlignment( 4 )
	
	local label = vgui.Create("DLabel")
	label:SetPos(270-7,y + offset*3)
	label:SetSize(200,100)
	label:SetText("Job related price:")
	label:SetParent(main)
	label:SetFont("gmib_menu_font18")
	label:SetContentAlignment( 4 )
	
	local labelInfo = vgui.Create("DLabel")
	labelInfo:SetPos(50-7,y + offset*6)
	labelInfo:SetSize(300,120)
	labelInfo:SetText("If there are any issues please post \nsupport ticket.\nI also encourage you  to leave review.\nHave a nice day :)\n\nby 2REK   2019")
	labelInfo:SetParent(main)
	labelInfo:SetFont("gmib_menu_font18")
	labelInfo:SetContentAlignment( 4 )
	
	for i=1,5,1 do		
		if gmib.ads[i] then
			local buttonRemove = vgui.Create("DButton")
			buttonRemove:SetPos(15+ 98*(i-1),35)
			buttonRemove:SetSize( 80, 40 )
			buttonRemove:SetText("Remove ad")
			buttonRemove:SetParent(main)
			buttonRemove.DoClick = function()
				net.Start( "gmib_removeAd" )
				net.WriteInt( gmib.ads[i].id , 32 )
				net.SendToServer()
				notification.AddLegacy( "Ad removed.", NOTIFY_ERROR, 4 )
				main:Remove()
			end
		end
		
		if gmib.ads[5+i] then
			local buttonRemove = vgui.Create("DButton")
			buttonRemove:SetPos(15 + 98*(i-1),35+50)
			buttonRemove:SetSize( 80 , 40 )
			buttonRemove:SetText("Remove ad")
			buttonRemove:SetParent(main)
			buttonRemove.DoClick = function()
				net.Start( "gmib_removeAd" )
				net.WriteInt( gmib.ads[5+i].id , 32 )
				net.SendToServer()
				notification.AddLegacy( "Ad removed.", NOTIFY_ERROR, 4 )
				main:Remove()
			end
		end		
	end
	
	local offset = 25
	-- number wangs
	--
	local basePriceWang = vgui.Create("DNumberWang")
	basePriceWang:SetPos(180-7,y+40 + offset*0)
	basePriceWang:SetSize(80,20)
	basePriceWang:SetParent(main)
	basePriceWang:SetContentAlignment( 6 )
	basePriceWang:SetMax(999999)
	basePriceWang:SetValue(gmib.settings[0])
	
	local anonPriceWang = vgui.Create("DNumberWang")
	anonPriceWang:SetPos(180-7,y+40 + offset*1)
	anonPriceWang:SetSize(80,20)
	anonPriceWang:SetParent(main)
	anonPriceWang:SetContentAlignment( 6 )
	anonPriceWang:SetMax(999999)
	anonPriceWang:SetValue(gmib.settings[1])
	
	local time1PriceWang = vgui.Create("DNumberWang")
	time1PriceWang:SetPos(180-7,y+40 + offset*2)
	time1PriceWang:SetSize(80,20)
	time1PriceWang:SetParent(main)
	time1PriceWang:SetContentAlignment( 6 )
	time1PriceWang:SetMax(999999)
	time1PriceWang:SetValue(gmib.settings[2])
	
	local time2PriceWang = vgui.Create("DNumberWang")
	time2PriceWang:SetPos(180-7,y+40 + offset*3)
	time2PriceWang:SetSize(80,20)
	time2PriceWang:SetParent(main)
	time2PriceWang:SetContentAlignment( 6 )
	time2PriceWang:SetMax(999999)
	time2PriceWang:SetValue(gmib.settings[3])
	
	local time3PriceWang = vgui.Create("DNumberWang")
	time3PriceWang:SetPos(400-7,y+40 + offset*0)
	time3PriceWang:SetSize(80,20)
	time3PriceWang:SetParent(main)
	time3PriceWang:SetContentAlignment( 6 )
	time3PriceWang:SetMax(999999)
	time3PriceWang:SetValue(gmib.settings[4])
	
	local time4PriceWang = vgui.Create("DNumberWang")
	time4PriceWang:SetPos(400-7,y+40 + offset*1)
	time4PriceWang:SetSize(80,20)
	time4PriceWang:SetParent(main)
	time4PriceWang:SetContentAlignment( 6 )
	time4PriceWang:SetMax(999999)
	time4PriceWang:SetValue(gmib.settings[5])
	
	local time5PriceWang = vgui.Create("DNumberWang")
	time5PriceWang:SetPos(400-7,y+40 + offset*2)
	time5PriceWang:SetSize(80,20)
	time5PriceWang:SetParent(main)
	time5PriceWang:SetContentAlignment( 6 )
	time5PriceWang:SetMax(999999)
	time5PriceWang:SetValue(gmib.settings[6])
	
	local jobRelatedPriceWang = vgui.Create("DNumberWang")
	jobRelatedPriceWang:SetPos(400-7,y+40 + offset*3)
	jobRelatedPriceWang:SetSize(80,20)
	jobRelatedPriceWang:SetParent(main)
	jobRelatedPriceWang:SetContentAlignment( 6 )
	jobRelatedPriceWang:SetMax(999999)
	jobRelatedPriceWang:SetValue(gmib.settings[7])
	--
	-- end of number wangs
	
	local buttonSave = vgui.Create("DButton")
	buttonSave:SetPos(350,300)
	buttonSave:SetSize( 100, 40 )
	buttonSave:SetText("Save settings")
	buttonSave:SetParent(main)
	function buttonSave:onClick()
		local settings = {}
		settings[0] = basePriceWang:GetValue()
		settings[1] = anonPriceWang:GetValue()
		settings[2] = time1PriceWang:GetValue()
		settings[3] = time2PriceWang:GetValue()
		settings[4] = time3PriceWang:GetValue()
		settings[5] = time4PriceWang:GetValue()
		settings[6] = time5PriceWang:GetValue()
		settings[7] = jobRelatedPriceWang:GetValue()
		
		net.Start( "gmib_saveSettings" )
		net.WriteTable( settings )
		net.SendToServer()
		
		RunString("GAMEMODE:AddNotify(\"Settings saved.\", NOTIFY_UNDO, 4)")
		
	end
end --of gmib.openManager


net.Receive( "gmib_openManager", function()
	local admin = net.ReadBool()
	gmib.openManager(admin)
end )

function gmib.postNotification(notify)
	RunString("GAMEMODE:AddNotify(\"" .. notify .. ".\", NOTIFY_UNDO, 2)")
end

net.Receive("gmib_notify", function()
	local notify = net.ReadString()
	gmib.postNotification(notify)
end)

net.Receive("gmib_openBoardMenu",function()
	local admin = net.ReadBool()
	local jobs = net.ReadTable()
	local id = net.ReadInt(32)
	gmib.openBoardManager(jobs,boardId,admin)
end)

--PATH lua/gmodadminsuite/thirdparty/von.lua:
--[[	vON 1.3.4

	Copyright 2012-2014 Alexandru-Mihai Maftei
					aka Vercas

	GitHub Repository:
		https://github.com/vercas/vON

	You may use this for any purpose as long as:
	-	You don't remove this copyright notice.
	-	You don't claim this to be your own.
	-	You properly credit the author (Vercas) if you publish your work based on (and/or using) this.

	If you modify the code for any purpose, the above obligations still apply.
	If you make any interesting modifications, try forking the GitHub repository instead.

	Instead of copying this code over for sharing, rather use the link:
		https://github.com/vercas/vON/blob/master/von.lua

	The author may not be held responsible for any damage or losses directly or indirectly caused by
	the use of vON.

	If you disagree with the above, don't use the code.

-----------------------------------------------------------------------------------------------------------------------------
	
	Thanks to the following people for their contribution:
		-	Divran						Suggested improvements for making the code quicker.
										Suggested an excellent new way of deserializing strings.
										Lead me to finding an extreme flaw in string parsing.
		-	pennerlord					Provided some performance tests to help me improve the code.
		-	Chessnut					Reported bug with handling of nil values when deserializing array components.

		-	People who contributed on the GitHub repository by reporting bugs, posting fixes, etc.

-----------------------------------------------------------------------------------------------------------------------------
	
	The vanilla types supported in this release of vON are:
		-	table
		-	number
		-	boolean
		-	string
		-	nil

	The Garry's Mod-specific types supported in this release are:
		-	Vector
		-	Angle
		+	Entities:
			-	Entity
			-	Vehicle
			-	Weapon
			-	NPC
			-	Player
			-	NextBot

	These are the types one would normally serialize.

-----------------------------------------------------------------------------------------------------------------------------
	
	New in this version:
		-	Fixed addition of extra entity types. I messed up really badly.
--]]



local _deserialize, _serialize, _d_meta, _s_meta, d_findVariable, s_anyVariable
local sub, gsub, find, insert, concat, error, tonumber, tostring, type, next = string.sub, string.gsub, string.find, table.insert, table.concat, error, tonumber, tostring, type, next



--[[    This section contains localized functions which (de)serialize
        variables according to the types found.                          ]]



--	This is kept away from the table for speed.
function d_findVariable(s, i, len, lastType, jobstate)
	local i, c, typeRead, val = i or 1

	--	Keep looping through the string.
	while true do
		--	Stop at the end. Throw an error. This function MUST NOT meet the end!
		if i > len then
			error("vON: Reached end of string, cannot form proper variable.")
		end

		--	Cache the character. Nobody wants to look for the same character ten times.
		c = sub(s, i, i)

		--	If it just read a type definition, then a variable HAS to come after it.
		if typeRead then
			--	Attempt to deserialize a variable of the freshly read type.
			val, i = _deserialize[lastType](s, i, len, false, jobstate)
			--	Return the value read, the index of the last processed character, and the type of the last read variable.
			return val, i, lastType

		--	@ means nil. It should not even appear in the output string of the serializer. Nils are useless to store.
		elseif c == "@" then
			return nil, i, lastType

		--	$ means a table reference will follow - a number basically.
		elseif c == "$" then
			lastType = "table_reference"
			typeRead = true

		--	n means a number will follow. Base 10... :C
		elseif c == "n" then
			lastType = "number"
			typeRead = true

		--	b means boolean flags.
		elseif c == "b" then
			lastType = "boolean"
			typeRead = true

		--	' means the start of a string.
		elseif c == "'" then
			lastType = "string"
			typeRead = true

		--	" means the start of a string prior to version 1.2.0.
		elseif c == "\"" then
			lastType = "oldstring"
			typeRead = true

		--	{ means the start of a table!
		elseif c == "{" then
			lastType = "table"
			typeRead = true


--[[    Garry's Mod types go here    ]]

		--	e means an entity ID will follow.
		elseif c == "e" then
			lastType = "Entity"
			typeRead = true
--[[
		--	c means a vehicle ID will follow.
		elseif c == "c" then
			lastType = "Vehicle"
			typeRead = true

		--	w means a weapon entity ID will follow.
		elseif c == "w" then
			lastType = "Weapon"
			typeRead = true

		--	x means a NPC ID will follow.
		elseif c == "x" then
			lastType = "NPC"
			typeRead = true
--]]
		--	p means a player ID will follow.
		--	Kept for backwards compatibility.
		elseif c == "p" then
			lastType = "Entity"
			typeRead = true

		--	v means a vector will follow. 3 numbers.
		elseif c == "v" then
			lastType = "Vector"
			typeRead = true

		--	a means an Euler angle will follow. 3 numbers.
		elseif c == "a" then
			lastType = "Angle"
			typeRead = true

--[[    Garry's Mod types end here    ]]


		--	If no type has been found, attempt to deserialize the last type read.
		elseif lastType then
			val, i = _deserialize[lastType](s, i, len, false, jobstate)
			return val, i, lastType

		--	This will occur if the very first character in the vON code is wrong.
		else
			error("vON: Malformed data... Can't find a proper type definition. Char#" .. i .. ":" .. c)
		end

		--	Move the pointer one step forward.
		i = i + 1
	end
end

--	This is kept away from the table for speed.
--	Yeah, ton of parameters.
function s_anyVariable(data, lastType, isNumeric, isKey, isLast, jobstate)
	local tp = type(data)

	if jobstate[1] and jobstate[2][data] then
		tp = "table_reference"
	end

	--	Basically, if the type changes.
	if lastType ~= tp then
		--	Remember the new type. Caching the type is useless.
		lastType = tp

		if _serialize[lastType] then
			--	Return the serialized data and the (new) last type.
			--	The second argument, which is true now, means that the data type was just changed.
			return _serialize[lastType](data, true, isNumeric, isKey, isLast, false, jobstate), lastType
		else
			error("vON: No serializer defined for type \"" .. lastType .. "\"!")
		end
	end

	--	Otherwise, simply serialize the data.
	return _serialize[lastType](data, false, isNumeric, isKey, isLast, false, jobstate), lastType
end



--[[    This section contains the tables with the functions necessary
        for decoding basic Lua data types.                               ]]



_deserialize = {
--	Well, tables are very loose...
--	The first table doesn't have to begin and end with { and }.
	["table"] = function(s, i, len, unnecessaryEnd, jobstate)
		local ret, numeric, i, c, lastType, val, ind, expectValue, key = {}, true, i or 1, nil, nil, nil, 1
		--	Locals, locals, locals, locals, locals, locals, locals, locals and locals.

		if sub(s, i, i) == "#" then
			local e = find(s, "#", i + 2, true)

			if e then
				local id = tonumber(sub(s, i + 1, e - 1))

				if id then
					if jobstate[1][id] and not jobstate[2] then
						error("vON: There already is a table of reference #" .. id .. "! Missing an option maybe?")
					end

					jobstate[1][id] = ret

					i = e + 1
				else
					error("vON: Malformed table! Reference ID starting at char #" .. i .. " doesn't contain a number!")
				end
			else
				error("vON: Malformed table! Cannot find end of reference ID start at char #" .. i .. "!")
			end
		end

		--	Keep looping.
		while true do
			--	Until it meets the end.
			if i > len then
				--	Yeah, if the end is unnecessary, it won't spit an error. The main chunk doesn't require an end, for example.
				if unnecessaryEnd then
					return ret, i

				--	Otherwise, the data has to be damaged.
				else
					error("vON: Reached end of string, incomplete table definition.")
				end
			end

			--	Cache the character.
			c = sub(s, i, i)
			--print(i, "table char:", c, tostring(unnecessaryEnd))

			--	If it's the end of a table definition, return.
			if c == "}" then
				return ret, i

			--	If it's the component separator, switch to key:value pairs.
			elseif c == "~" then
				numeric = false

			elseif c == ";" then
				--	Lol, nothing!
				--	Remenant from numbers, for faster parsing.

			--	OK, now, if it's on the numeric component, simply add everything encountered.
			elseif numeric then
				--	Find a variable and it's value
				val, i, lastType = d_findVariable(s, i, len, lastType, jobstate)
				--	Add it to the table.
				ret[ind] = val

				ind = ind + 1

			--	Otherwise, if it's the key:value component...
			else
				--	If a value is expected...
				if expectValue then
					--	Read it.
					val, i, lastType = d_findVariable(s, i, len, lastType, jobstate)
					--	Add it?
					ret[key] = val
					--	Clean up.
					expectValue, key = false, nil

				--	If it's the separator...
				elseif c == ":" then
					--	Expect a value next.
					expectValue = true

				--	But, if there's a key read already...
				elseif key then
					--	Then this is malformed.
					error("vON: Malformed table... Two keys declared successively? Char#" .. i .. ":" .. c)

				--	Otherwise the key will be read.
				else
					--	I love multi-return and multi-assignement.
					key, i, lastType = d_findVariable(s, i, len, lastType, jobstate)
				end
			end

			i = i + 1
		end

		return nil, i
	end,

--	Just a number which points to a table.
	["table_reference"] = function(s, i, len, unnecessaryEnd, jobstate)
		local i, a = i or 1
		--	Locals, locals, locals, locals

		a = find(s, "[;:}~]", i)

		if a then
			local n = tonumber(sub(s, i, a - 1))

			if n then
				return jobstate[1][n] or error("vON: Table reference does not point to a (yet) known table!"), a - 1
			else
				error("vON: Table reference definition does not contain a valid number!")
			end
		end

		--	Using %D breaks identification of negative numbers. :(

		error("vON: Number definition started... Found no end.")
	end,


--	Numbers are weakly defined.
--	The declaration is not very explicit. It'll do it's best to parse the number.
--	Has various endings: \n, }, ~, : and ;, some of which will force the table deserializer to go one char backwards.
	["number"] = function(s, i, len, unnecessaryEnd, jobstate)
		local i, a = i or 1
		--	Locals, locals, locals, locals

		a = find(s, "[;:}~]", i)

		if a then
			return tonumber(sub(s, i, a - 1)) or error("vON: Number definition does not contain a valid number!"), a - 1
		end

		--	Using %D breaks identification of negative numbers. :(

		error("vON: Number definition started... Found no end.")
	end,


--	A boolean is A SINGLE CHARACTER, either 1 for true or 0 for false.
--	Any other attempt at boolean declaration will result in a failure.
	["boolean"] = function(s, i, len, unnecessaryEnd, jobstate)
		local c = sub(s,i,i)
		--	Only one character is needed.

		--	If it's 1, then it's true
		if c == "1" then
			return true, i

		--	If it's 0, then it's false.
		elseif c == "0" then
			return false, i
		end

		--	Any other supposely "boolean" is just a sign of malformed data.
		error("vON: Invalid value on boolean type... Char#" .. i .. ": " .. c)
	end,


--	Strings prior to 1.2.0
	["oldstring"] = function(s, i, len, unnecessaryEnd, jobstate)
		local res, i, a = "", i or 1
		--	Locals, locals, locals, locals

		while true do
			a = find(s, "\"", i, true)

			if a then
				if sub(s, a - 1, a - 1) == "\\" then
					res = res .. sub(s, i, a - 2) .. "\""
					i = a + 1
				else
					return res .. sub(s, i, a - 2), a
				end
			else
				error("vON: Old string definition started... Found no end.")
			end
		end
	end,

--	Strings after 1.2.0
	["string"] = function(s, i, len, unnecessaryEnd, jobstate)
		local res, i, a = "", i or 1
		--	Locals, locals, locals, locals

		while true do
			a = find(s, "\"", i, true)

			if a then
				if sub(s, a - 1, a - 1) == "\\" then
					res = res .. sub(s, i, a - 2) .. "\""
					i = a + 1
				else
					return res .. sub(s, i, a - 1), a
				end
			else
				error("vON: String definition started... Found no end.")
			end
		end
	end,
}



_serialize = {
--	Uh. Nothing to comment.
--	Ton of parameters.
--	Makes stuff faster than simply passing it around in locals.
--	table.concat works better than normal concatenations WITH LARGE-ISH STRINGS ONLY.
	["table"] = function(data, mustInitiate, isNumeric, isKey, isLast, first, jobstate)
		--print(string.format("data: %s; mustInitiate: %s; isKey: %s; isLast: %s; nice: %s; indent: %s; first: %s", tostring(data), tostring(mustInitiate), tostring(isKey), tostring(isLast), tostring(nice), tostring(indent), tostring(first)))

		local result, keyvals, len, keyvalsLen, keyvalsProgress, val, lastType, newIndent, indentString = {}, {}, #data, 0, 0
		--	Locals, locals, locals, locals, locals, locals, locals, locals, locals and locals.

		--	First thing to be done is separate the numeric and key:value components of the given table in two tables.
		--	pairs(data) is slower than next, data as far as my tests tell me.
		for k, v in next, data do
			--	Skip the numeric keyz.
			if type(k) ~= "number" or k < 1 or k > len or (k % 1 ~= 0) then	--	k % 1 == 0 is, as proven by personal benchmarks,
				keyvals[#keyvals + 1] = k									--	the quickest way to check if a number is an integer.
			end																--	k % 1 ~= 0 is the fastest way to check if a number
		end																	--	is NOT an integer. > is proven slower.

		keyvalsLen = #keyvals

		--	Main chunk - no initial character.
		if not first then
			result[#result + 1] = "{"
		end

		if jobstate[1] and jobstate[1][data] then
			if jobstate[2][data] then
				error("vON: Table #" .. jobstate[1][data] .. " written twice..?")
			end

			result[#result + 1] = "#"
			result[#result + 1] = jobstate[1][data]
			result[#result + 1] = "#"

			jobstate[2][data] = true
		end

		--	Add numeric values.
		if len > 0 then
			for i = 1, len do
				val, lastType = s_anyVariable(data[i], lastType, true, false, i == len and not first, jobstate)
				result[#result + 1] = val
			end
		end

		--	If there are key:value pairs.
		if keyvalsLen > 0 then
			--	Insert delimiter.
			result[#result + 1] = "~"

			--	Insert key:value pairs.
			for _i = 1, keyvalsLen do
				keyvalsProgress = keyvalsProgress + 1

				val, lastType = s_anyVariable(keyvals[_i], lastType, false, true, false, jobstate)

				result[#result + 1] = val..":"

				val, lastType = s_anyVariable(data[keyvals[_i]], lastType, false, false, keyvalsProgress == keyvalsLen and not first, jobstate)
				
				result[#result + 1] = val
			end
		end

		--	Main chunk needs no ending character.
		if not first then
			result[#result + 1] = "}"
		end

		return concat(result)
	end,

--	Number which points to table.
	["table_reference"] = function(data, mustInitiate, isNumeric, isKey, isLast, first, jobstate)
		data = jobstate[1][data]

		--	If a number hasn't been written before, add the type prefix.
		if mustInitiate then
			if isKey or isLast then
				return "$"..data
			else
				return "$"..data..";"
			end
		end

		if isKey or isLast then
			return data
		else
			return data..";"
		end
	end,


--	Normal concatenations is a lot faster with small strings than table.concat
--	Also, not so branched-ish.
	["number"] = function(data, mustInitiate, isNumeric, isKey, isLast, first, jobstate)
		--	If a number hasn't been written before, add the type prefix.
		if mustInitiate then
			if isKey or isLast then
				return "n"..data
			else
				return "n"..data..";"
			end
		end

		if isKey or isLast then
			return data
		else
			return data..";"
		end
	end,


--	I hope gsub is fast enough.
	["string"] = function(data, mustInitiate, isNumeric, isKey, isLast, first, jobstate)
		if sub(data, #data, #data) == "\\" then	--	Hah, old strings fix this best.
			return "\"" .. gsub(data, "\"", "\\\"") .. "v\""
		end

		return "'" .. gsub(data, "\"", "\\\"") .. "\""
	end,


--	Fastest.
	["boolean"] = function(data, mustInitiate, isNumeric, isKey, isLast, first, jobstate)
		--	Prefix if we must.
		if mustInitiate then
			if data then
				return "b1"
			else
				return "b0"
			end
		end

		if data then
			return "1"
		else
			return "0"
		end
	end,


--	Fastest.
	["nil"] = function(data, mustInitiate, isNumeric, isKey, isLast, first, jobstate)
		return "@"
	end,
}



--[[    This section handles additions necessary for Garry's Mod.    ]]



if gmod then	--	Luckily, a specific table named after the game is present in Garry's Mod.
	local Entity = Entity



	local extra_deserialize = {
--	Entities are stored simply by the ID. They're meant to be transfered, not stored anyway.
--	Exactly like a number definition, except it begins with "e".
		["Entity"] = function(s, i, len, unnecessaryEnd, jobstate)
			local i, a = i or 1
			--	Locals, locals, locals, locals

			a = find(s, "[;:}~]", i)

			if a then
				return Entity(tonumber(sub(s, i, a - 1))), a - 1
			end

			error("vON: Entity ID definition started... Found no end.")
		end,


--	A pair of 3 numbers separated by a comma (,).
		["Vector"] = function(s, i, len, unnecessaryEnd, jobstate)
			local i, a, x, y, z = i or 1
			--	Locals, locals, locals, locals

			a = find(s, ",", i)

			if a then
				x = tonumber(sub(s, i, a - 1))
				i = a + 1
			end

			a = find(s, ",", i)

			if a then
				y = tonumber(sub(s, i, a - 1))
				i = a + 1
			end

			a = find(s, "[;:}~]", i)

			if a then
				z = tonumber(sub(s, i, a - 1))
			end

			if x and y and z then
				return Vector(x, y, z), a - 1
			end

			error("vON: Vector definition started... Found no end.")
		end,


--	A pair of 3 numbers separated by a comma (,).
		["Angle"] = function(s, i, len, unnecessaryEnd, jobstate)
			local i, a, p, y, r = i or 1
			--	Locals, locals, locals, locals

			a = find(s, ",", i)

			if a then
				p = tonumber(sub(s, i, a - 1))
				i = a + 1
			end

			a = find(s, ",", i)

			if a then
				y = tonumber(sub(s, i, a - 1))
				i = a + 1
			end

			a = find(s, "[;:}~]", i)

			if a then
				r = tonumber(sub(s, i, a - 1))
			end

			if p and y and r then
				return Angle(p, y, r), a - 1
			end

			error("vON: Angle definition started... Found no end.")
		end,
	}

	local extra_serialize = {
--	Same as numbers, except they start with "e" instead of "n".
		["Entity"] = function(data, mustInitiate, isNumeric, isKey, isLast, first, jobstate)
			data = data:EntIndex()

			if mustInitiate then
				if isKey or isLast then
					return "e"..data
				else
					return "e"..data..";"
				end
			end

			if isKey or isLast then
				return data
			else
				return data..";"
			end
		end,


--	3 numbers separated by a comma.
		["Vector"] = function(data, mustInitiate, isNumeric, isKey, isLast, first, jobstate)
			if mustInitiate then
				if isKey or isLast then
					return "v"..data.x..","..data.y..","..data.z
				else
					return "v"..data.x..","..data.y..","..data.z..";"
				end
			end

			if isKey or isLast then
				return data.x..","..data.y..","..data.z
			else
				return data.x..","..data.y..","..data.z..";"
			end
		end,


--	3 numbers separated by a comma.
		["Angle"] = function(data, mustInitiate, isNumeric, isKey, isLast, first, jobstate)
			if mustInitiate then
				if isKey or isLast then
					return "a"..data.p..","..data.y..","..data.r
				else
					return "a"..data.p..","..data.y..","..data.r..";"
				end
			end

			if isKey or isLast then
				return data.p..","..data.y..","..data.r
			else
				return data.p..","..data.y..","..data.r..";"
			end
		end,
	}

	for k, v in pairs(extra_serialize) do
		_serialize[k] = v
	end

	for k, v in pairs(extra_deserialize) do
		_deserialize[k] = v
	end

	local extraEntityTypes = { "Vehicle", "Weapon", "NPC", "Player", "NextBot" }

	for i = 1, #extraEntityTypes do
		_serialize[extraEntityTypes[i]] = _serialize.Entity
	end
end



--[[    This section exposes the functions of the library.    ]]



local function checkTableForRecursion(tab, checked, assoc)
	local id = checked.ID

	if not checked[tab] and not assoc[tab] then
		assoc[tab] = id
		checked.ID = id + 1
	else
		checked[tab] = true
	end

	for k, v in pairs(tab) do
		if type(k) == "table" and not checked[k] then
			checkTableForRecursion(k, checked, assoc)
		end
		
		if type(v) == "table" and not checked[v] then
			checkTableForRecursion(v, checked, assoc)
		end
	end
end



local _s_table = _serialize.table
local _d_table = _deserialize.table

_d_meta = {
	__call = function(self, str, allowIdRewriting)
		if type(str) == "string" then
			return _d_table(str, nil, #str, true, {{}, allowIdRewriting})
		end

		error("vON: You must deserialize a string, not a "..type(str))
	end
}
_s_meta = {
	__call = function(self, data, checkRecursion)
		if type(data) == "table" then
			if checkRecursion then
				local assoc, checked = {}, {ID = 1}

				checkTableForRecursion(data, checked, assoc)

				return _s_table(data, nil, nil, nil, nil, true, {assoc, {}})
			end

			return _s_table(data, nil, nil, nil, nil, true, {false})
		end

		error("vON: You must serialize a table, not a "..type(data))
	end
}



von = {
	version = "1.3.4",
	versionNumber = 1003004,	--	Reserving 3 digits per version component.

	deserialize = setmetatable(_deserialize,_d_meta),
	serialize = setmetatable(_serialize,_s_meta)
}



return von
--PATH lua/gmodadminsuite/modules/fpsbooster/lang/french.lua:
return {
	Name = "French",
	Flag = "flags16/fr.png",
	Phrases = function() return {

		module_name = "FPS Booster",

		--####################### UI PHRASES #######################--

		fps_booster          = "Booster de FPS",
		never_show_again     = "Ne plus afficher",
		never_show_again_tip = "Vous perdrez les avantages de ce menu ! Tapez \"gmodadminsuite fpsbooster\" dans votre console pour ouvrir ce menu dans le futur.",

		--####################### SETTING PHRASES #######################--

		show_fps                 = "Afficher FPS",
		multicore_rendering      = "Afficher le rendu Multi-Coeur",
		multicore_rendering_help = "C'est une fonctionnalité expérimentale de GMod qui permet d'augmenter les FPS en faisant un rendu des images sur plusieurs coeurs de votre processeur.",
		hardware_acceleration    = "Activer l'Accélération Matérielle",
		shadows                  = "Désactiver les Ombres",
		disable_skybox           = "Désactiver Skybox",
		sprays                   = "Désactiver les Sprays des Joueurs",
		gibs                     = "Désactiver Gibs",
		gibs_help                = "\"Gibs\" Sont des particules qui volent hors des cadavres et des ragdolls.",

} end }
--PATH lua/gmodadminsuite/modules/secondaryusergroups/lang/chinese.lua:
return {
    Name = "Chinese",
    Flag = "flags16/cn.png",
    Phrases = function()
        return {
            module_name = "次要用户组",

            open_menu = "打开菜单",
            custom_ellipsis = "自定义...",
            usergroup_ellipsis = "用户组...",
            players = "玩家",
            settings = "设置",
            give_usergroup = "赋予用户组",
            usergroup_is_main = "这是用户的主用户组，不能被赋予或撤销。",
            help = "帮助",
            offline_btn = "新玩家...",
            loading_ellipsis = "加载中...",
            unknown = "未知",
        }
    end
}
--PATH addons/gmodadminsuite-logging-2.4.8/lua/gmodadminsuite/modules/logging/_gas_info.lua:
return {
	DefaultEnabled = true,
	Name = "Billy's Logs",
	Category = GAS.MODULE_CATEGORY_ADMINISTRATION,
	Wiki = "https://gmodsto.re/blogs-wiki",
	Icon = "icon16/database_lightning.png",
	GmodStore = "6016",
	License = '{"licensee":"76561198278550271","keys":{"xeon-de":"LXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","xeon-us":"LXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"}}'
}
--PATH lua/gmodadminsuite/cl_contextmenu.lua:
local function L(phrase, ...)
	if (#({...}) > 0) then
		return GAS:Phrase(phrase)
	else
		return GAS:PhraseFormat(phrase, nil, ...)
	end
end

GAS.ContextProperties = {}
function GAS:ContextProperty(name, propertydata)
	GAS.ContextProperties[name] = propertydata
end

properties.Add("GmodAdminSuite", {
	MenuLabel = "GmodAdminSuite",
	MenuIcon = "icon16/shield.png",
	Filter = function(self, ent, ply)
		if (not IsValid(ent)) then return false end
		if (table.Count(GAS.ContextProperties) == 0) then return false end
		return true
	end,
	MenuOpen = function(self, option, ent, tr)
		local option_submenu = option:AddSubMenu()
		option_submenu:AddOption(L"open_menu", self.Action):SetIcon("icon16/application_form_magnify.png")
		local spacer = false
		for i,v in pairs(GAS.ContextProperties) do
			if (v.Filter and v.Filter(self, ent, LocalPlayer()) == false) then continue end
			if (not spacer) then spacer = true option_submenu:AddSpacer() end
			local submenu, submenu_pnl = option_submenu:AddSubMenu(v.MenuLabel, v.Action)
			if (v.MenuIcon) then
				submenu_pnl:SetIcon(v.MenuIcon)
			end
			if (v.MenuOpen) then
				v.MenuOpen(self, submenu, ent, tr, submenu_pnl)
			end
		end
	end,
	Action = function()
		RunConsoleCommand("gmodadminsuite")
	end
})

--PATH addons/employer_npc/lua/employer_npc/config.lua:
ENPC.Colors = {
	bg = Color(34, 37, 41),
	s_bg = Color(45, 49, 54),
	header = Color(57, 62, 68),

	f_list = Color(200,200,200),

	icons = Color(90,90,90),
	icons_a = Color(150,150,150),

	unavailable = Color(100,100,100)
}

ENPC.EnableRandomSequences = true -- Enable random sequences for player model
ENPC.EnableBlur = true -- Enable blur theme
ENPC.Lang = "fr" -- Now supported en, fr, ru, es, de, no

ENPC.StoreJobsBy = "name" -- Options how jobs will be stored in database: "name" and "command"

ENPC.DisableChangeTeam = true -- Disables change team via F4(ENPC.DisableChangeUsed need to be disabled)
ENPC.DisableChangeUsed = false -- Disables change only for job used in NPC(ENPC.DisableChangeTeam need to be disabled)

ENPC.Ranks = {  -- they ignore Utime and level rules
	-- ["superadmin"] = true,
	["vip"] = true,
}

ENPC.CanBypass = { -- change to false, to disable it
	["utime"] = true,
	["level"] = true,
	["customcheck"] = true,
	["countlimit"] = true,
	["jobcost"] = false, -- disables job required rights too
}

--PATH addons/employer_npc/lua/employer_npc/cl_util.lua:
function ENPC:IsDarkColor(color)
	local val = ((color.r*299)+(color.g*587)+(color.b*114))/1000
	if val < 75 then
		return {r = color.r+75, g = color.g+75, b = color.b+75, a = color.a}
	else
		return color
	end
end

function ENPC:DrawMaterial(mat, x, y, activated)
	local color = activated and ENPC.Colors.icons_a or ENPC.Colors.icons

	surface.SetMaterial(mat)
	surface.SetDrawColor(color)
	surface.DrawTexturedRect(x, y, 15, 15)
end

local blur = Material("pp/blurscreen")

function ENPC:DrawBlur(panel)
	local w, h = panel:GetWide(), panel:GetTall()

	render.ClearStencil()
	render.SetStencilEnable( true )
	render.SetStencilReferenceValue( 1 )
	render.SetStencilTestMask( 1 )
	render.SetStencilWriteMask( 1 )

	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
	render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
	render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
	render.SetStencilZFailOperation( STENCILOPERATION_REPLACE )

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawRect( 0, 0, w, h )

	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
	render.SetStencilFailOperation( STENCILOPERATION_KEEP )
	render.SetStencilPassOperation( STENCILOPERATION_KEEP )
	render.SetStencilZFailOperation( STENCILOPERATION_KEEP )

		surface.SetMaterial( blur )
		surface.SetDrawColor( 255, 255, 255, 255 )

		for i = 0, 1, 0.33 do
			blur:SetFloat( '$blur', 5 *i )
			blur:Recompute()
			render.UpdateScreenEffectTexture()

			local x, y = panel:GetPos()

			surface.DrawTexturedRect( -x, -y, ScrW(), ScrH() )
		end

	render.SetStencilEnable( false )
end

function ENPC:DrawBlurredPanel(panel)
	if ENPC.EnableBlur then
		ENPC.Colors.bg.a = 220
		ENPC.Colors.s_bg.a = 220
		ENPC.Colors.header.a = 220
		self:DrawBlur(panel)
	end
end

--PATH addons/rogue_scoreboard/lua/roguescoreboard/configuration.lua:
RogueScoreboard.Configuration = {}

local Configuration = RogueScoreboard.Configuration


// T I P S 
--[[ 

1. I would suggest making your job colors more vibrant to suit the scoreboard better, for instance i used Color( 0,255,80 ) for my citizen job color. This can be done in your darkrpmodifications folder.

2. Configuration.UndercoverNames is random names for incognito / undercover mode, i would suggest adding your own to suit your server requirements & for more variety.

3. If the scoreboard does not show up, try disabling Fadmin. ( Have had no known issues with this but it is here incase )

4. Dont be a leaker, support the lads who do the hard work for you, we have to put up with the cost of living and bills too.

]]


// M A I N   C O N F I G U R A T I O N S

-- Server title
Configuration.ServerTitle           = "NEW ERA  -  SOLO LEVELING"

-- Are you using DarkRP?
Configuration.DarkRP                = true
-- Sort the menu by categories?
Configuration.SortByCategories      = false

-- Type your admin prefix. Currently supports: "ulx", "serverguard", "xadmin2", "xadmin", "fadmin", "sam" 
Configuration.AdministrationMod     = "sam"

-- Allow ALL ranks to view players money and props. If false fill table below.
Configuration.InformationViewAll    = true
Configuration.InformationView       = { "moderateur", "admin", "superadmin", "superviseur", "gerant" }

-- Show the online count at the bottom of the scoreboard?
Configuration.ShowOnlineCount       = true

-- Information bar is the information above the scorebord with, ( NAME, JOB, K, D )
Configuration.InformationBar        = true
-- Does the bar have a background?
Configuration.InformationBackground = false

-- Show players name?
Configuration.ShowName              = true
-- Show players team?
Configuration.ShowTeam              = true

// R E P O R T  S Y S T E M ( N E W  )

-- Set to false if you do not want the report system
Configuration.ReportEnabled         = true

-- Are you using a report addon that uses a chat prefix? example SH Report uses /report
Configuration.UsingReportAddon      = true
Configuration.ReportAddonPrefix     = "!report" -- This can be /r or anything your report system requires the prefix to be to open the menu

// If you are not using a report addon this section of the report system is for you
-- URL for your report button, Set to false if you are not using a website for report button, this will send messages to admins ingame instead
Configuration.UsingReportSite       = false
Configuration.ReportURL             = "www.google.com"


-- Report button admin message if you are not using a report addon
Configuration.ReportPrefix          = "@"
Configuration.ReportedText          = "Je voudrais faire un signalement sur (tab) :"



// T H E M E

Configuration.MainBackground        = Color( 19,20,21,246 )
Configuration.PanelBackground       = Color( 24,25,26,210 )
Configuration.ServerTitleColor      = Color( 255,255,255 )

Configuration.NameHover             = Color( 0,190,255 )
Configuration.Friends               = Color( 0,170,255 )
Configuration.Muted                 = Color( 255,190,0 )
Configuration.ClearProps            = Color( 255,190,0 )
Configuration.ClearPropsHover       = Color( 255,70,0 )
Configuration.ReportColor           = Color( 255,190,0 )
Configuration.ReportHoverColor      = Color( 255,70,0 )
Configuration.IconsDarkColor        = Color( 121,122,123 )

Configuration.PingFull              = Color( 0,255,0 )
Configuration.Ping3                 = Color( 250,255,0 )
Configuration.Ping2                 = Color( 255,155,0 )
Configuration.PingCritical          = Color( 255,100,0 )

Configuration.UndercoverIcon        = Color( 121,122,123 )
Configuration.IsUndercoverIcon      = Color( 0,160,255 )


// L A N G U A G E

-- Information bar
Configuration.NameText              = "NOM" 
Configuration.JobText               = "" 
Configuration.KillsText             = "K" 
Configuration.DeathsText            = "D"

-- Button text
Configuration.ClearPropText         = "EFFACER LES PROPS"
Configuration.MuteText              = "MUTE"
Configuration.UnMuteText            = "UN-MUTE"
Configuration.ReportText            = "SIGNALER"

-- Command text
Configuration.TargetSelfCheck       = "Vous ne pouvez pas vous selectionner.."
Configuration.CommandCopy           = "COPIER STEAM ID & STEAM 64"
Configuration.CommandGoto           = "ALLER A"
Configuration.CommandBring          = "EMMENER"
Configuration.CommandSpectate       = "OBSERVER"
Configuration.CommandBringFreeze    = "EMMENER & GELER"

Configuration.CommandKick           = "EXPULSER"
Configuration.CommandKickReason     = "Vous avez été expulsé"

Configuration.CommandBan            = "BANNIR"
Configuration.CommandBanReason      = "Vous avez reçu un ban de 2h"

Configuration.PropText              = "PROPS"

-- Incognito text
Configuration.ActivateIncog         = "INCOGNITO"
Configuration.DeactivateIncog       = "DESACTIVE"

-- Player count text
Configuration.CurrentPlayersText    = "Joueurs"



// C U S T O M  T A G S

-- Customized tags use players steamID
-- Configuration.CustomUserTag["STEAM_X:X:XXXXXXX"]      = { Tag = "TAG NAME", TagColor = Color( R,G,B ) }

Configuration.CustomUserTag = {}

// R A N K   S E L E C T I O N 

-- Rank Display Table
-- Configuration.RankDisplay["rank"]         = { DisplayName = "Display name you want to see", TagName = "This is the tag name that will show if the player does not have a custom tag", DisplayColor = Color( R,G,B ), TagColor = Color( R,G,B ) }

Configuration.RankDisplay = {}
Configuration.RankDisplay["user"]           = { DisplayName = "", TagName = "JOUEUR", DisplayColor = Color( 255,255,255 ), TagColor = Color( 121,122,123 ) }
Configuration.RankDisplay["moderateur"]           = { DisplayName = "Moderateur", TagName = "MODERATEUR", DisplayColor = Color( 255,255,255 ), TagColor = Color( 121,122,123 ) }
Configuration.RankDisplay["admin"]          = { DisplayName = "Administrateur", TagName = "ADMINISTRATEUR", DisplayColor = Color( 255,255,255 ), TagColor = Color( 121,122,123 ) }  
Configuration.RankDisplay["superviseur"]          = { DisplayName = "Supervision", TagName = "SUPERVISION", DisplayColor = Color( 255,255,255 ), TagColor = Color( 121,122,123 ) }  
Configuration.RankDisplay["gerant"]          = { DisplayName = "Gérant", TagName = "GERANT", DisplayColor = Color( 255,255,255 ), TagColor = Color( 121,122,123 ) }  
Configuration.RankDisplay["superadmin"]     = { DisplayName = "Fondation", TagName = "FONDATION", DisplayColor = Color( 255,155,0 ), TagColor = Color( 121,122,123 ) }
Configuration.RankDisplay["Arise"]      = { DisplayName = "Arise", TagName = "ARISE", DisplayColor = Color( 255,155,0 ), TagColor = Color( 121,122,123 ) }
Configuration.RankDisplay["leveling"]          = { DisplayName = "Leveling", TagName = "LEVELING", DisplayColor = Color( 255,255,255 ), TagColor = Color( 121,122,123 ) }
Configuration.RankDisplay["vip"]          = { DisplayName = "VIP", TagName = "VIP", DisplayColor = Color( 255,255,255 ), TagColor = Color( 121,122,123 ) }
Configuration.RankDisplay["vip+"]          = { DisplayName = "VIP+", TagName = "VIP+", DisplayColor = Color( 255,255,255 ), TagColor = Color( 121,122,123 ) }
Configuration.RankDisplay["monarque"]          = { DisplayName = "Monarque", TagName = "MONARQUE", DisplayColor = Color( 255,255,255 ), TagColor = Color( 121,122,123 ) }

// C O M M A N D  C O N F I G U R A T I O N

-- Who has access to remove players props, this uses FPP system
Configuration.PropAccess            = { "admin", "superadmin", "superviseur", "gerant" }

-- Who can see the administrative buttons
Configuration.MenuAccess            = { "moderateur", "admin", "superadmin", "superviseur", "gerant" }

-- Allow precise control for commands, if true then set the tables below to what ranks have access otherwise Configuration.MenuAccess determines allowed ranks.
Configuration.SeperateAccess        = false

-- If seperate access is true, configure below.
-- Who has access to goto
Configuration.AllowedGoto           = { "moderateur", "admin", "superadmin", "superviseur", "gerant" }
-- Who has access to bring
Configuration.AllowedBring          = { "moderateur", "admin", "superadmin", "superviseur", "gerant" }
-- Who has access to spectate
Configuration.AllowedSpectate       = { "moderateur", "admin", "superadmin", "superviseur", "gerant" }
-- Who has access to freeze
Configuration.AllowedFreeze         = { "moderateur", "admin", "superadmin", "superviseur", "gerant" }
-- Who has access to kick
Configuration.AllowedKick           = { "moderateur", "admin", "superadmin", "superviseur", "gerant" }
-- Who has access to ban
Configuration.AllowedBan            = { "moderateur", "admin", "superadmin", "superviseur", "gerant" }

-- Ban time
Configuration.CommandBanTime        = 120



// U N D E R  C O V E R  M O D E

-- Who has access to go incognito?
Configuration.IncognitoAccess       = { "admin", "superadmin", "superviseur", "gerant" }
-- Who can see who is incognito mode?
Configuration.IncognitoVision       = { "admin", "superadmin", "superviseur", "gerant" }
-- Use the custom icon for profile picture, if false will use players original profile picture
Configuration.UseCustomIcon         = true

-- Lowest money selected
Configuration.LowestMoney           = 12732
-- Highest money selected
Configuration.HighestMoney          = 67324

-- Lowest kills selected
Configuration.LowestKills           = 0
-- Highest kills selected
Configuration.HighestKills          = 2

-- Lowest deaths selected
Configuration.LowestDeaths          = 0
-- Highest deaths selected
Configuration.HighestDeaths         = 2

-- List of names randomly selected for incognito
Configuration.UndercoverNames       = { 
"???"
}



// A D M I N I S T R A T I O N  P R E F I X

// Below is administration prefix for commands, do not edit below unless you know what to do

//////////////////////////////////////////////////////////////////////////

// U L X

Configuration.Administration = {}
Configuration.Administration["ulx"] = {}
Configuration.Administration["ulx"].goto = function(cmdPly)
    RunConsoleCommand("ulx", "goto", cmdPly:Nick())
end

Configuration.Administration["ulx"].bring = function(cmdPly)
    RunConsoleCommand("ulx", "bring", cmdPly:Nick())
end

Configuration.Administration["ulx"].freeze = function(cmdPly)
    RunConsoleCommand("ulx", "bring", cmdPly:Nick())
    RunConsoleCommand("ulx", "freeze", cmdPly:Nick())
end

Configuration.Administration["ulx"].unfreeze = function(cmdPly)
    RunConsoleCommand("ulx", "unfreeze", cmdPly:Nick())
end

Configuration.Administration["ulx"].send = function(cmdPly)
    RunConsoleCommand("ulx", "return", cmdPly:Nick())
end

Configuration.Administration["ulx"].spectate = function(cmdPly)
    RunConsoleCommand("say", "!spectate " .. cmdPly:Nick())
end

Configuration.Administration["ulx"].ban = function(cmdPly, time, reason)
    RunConsoleCommand("ulx", "ban", cmdPly:Nick(), time, reason)
end

Configuration.Administration["ulx"].kick = function(cmdPly, reason)
    RunConsoleCommand("ulx", "kick", cmdPly:Nick(), reason)
end

// S A M  A D M I N

Configuration.Administration["sam"] = {}
Configuration.Administration["sam"].goto = function(cmdPly)
    RunConsoleCommand("sam", "goto", cmdPly:Nick())
end

Configuration.Administration["sam"].bring = function(cmdPly)
    RunConsoleCommand("sam", "bring", cmdPly:Nick())
end

Configuration.Administration["sam"].freeze = function(cmdPly)
    RunConsoleCommand("sam", "bring", cmdPly:Nick())
    RunConsoleCommand("sam", "freeze", cmdPly:Nick())
end

Configuration.Administration["sam"].unfreeze = function(cmdPly)
    RunConsoleCommand("sam", "unfreeze", cmdPly:Nick())
end

Configuration.Administration["sam"].send = function(cmdPly)
    RunConsoleCommand("sam", "return", cmdPly:Nick())
end

Configuration.Administration["sam"].spectate = function(cmdPly)
    RunConsoleCommand("sam", "spectate", cmdPly:Nick())
end

Configuration.Administration["sam"].ban = function(cmdPly, time, reason)
    RunConsoleCommand("sam", "ban", cmdPly:Nick(), time, reason)
end

Configuration.Administration["sam"].kick = function(cmdPly, reason)
    RunConsoleCommand("sam", "kick", cmdPly:Nick(), reason)
end

// F  A D M I N

Configuration.Administration["fadmin"] = {}
Configuration.Administration["fadmin"].goto = function(cmdPly)
    RunConsoleCommand("fadmin", "goto", cmdPly:Nick())
end

Configuration.Administration["fadmin"].bring = function(cmdPly)
    RunConsoleCommand("fadmin", "bring", cmdPly:Nick())
end

Configuration.Administration["fadmin"].freeze = function(cmdPly)
    RunConsoleCommand("fadmin", "bring", cmdPly:Nick())
    RunConsoleCommand("fadmin", "freeze", cmdPly:Nick())
end

Configuration.Administration["fadmin"].unfreeze = function(cmdPly)
    RunConsoleCommand("fadmin", "unfreeze", cmdPly:Nick())
end

Configuration.Administration["fadmin"].send = function(cmdPly)
    RunConsoleCommand("fadmin", "return", cmdPly:Nick())
end

Configuration.Administration["fadmin"].spectate = function(cmdPly)
    RunConsoleCommand("fadmin", "spectate", cmdPly:Nick())
end

Configuration.Administration["fadmin"].ban = function(cmdPly, time, reason)
    RunConsoleCommand("fadmin", "ban", cmdPly:Nick(), time, reason)
end

Configuration.Administration["fadmin"].kick = function(cmdPly, reason)
    RunConsoleCommand("fadmin", "kick", cmdPly:Nick(), reason)
end

// S E R V E R  G U A R D

Configuration.Administration["serverguard"] = {}
Configuration.Administration["serverguard"].goto = function(cmdPly)
    RunConsoleCommand("sg", "goto", cmdPly:Nick())
end

Configuration.Administration["serverguard"].bring = function(cmdPly)
    RunConsoleCommand("sg", "bring", cmdPly:Nick())
end

Configuration.Administration["serverguard"].freeze = function(cmdPly)
    RunConsoleCommand("sg", "bring", cmdPly:Nick())
    RunConsoleCommand("sg", "freeze", cmdPly:Nick())
end

Configuration.Administration["serverguard"].unfreeze = function(cmdPly)
    RunConsoleCommand("sg", "unfreeze", cmdPly:Nick())
end

Configuration.Administration["serverguard"].send = function(cmdPly)
    RunConsoleCommand("sg", "return", cmdPly:Nick())
end

Configuration.Administration["serverguard"].spectate = function(cmdPly)
    RunConsoleCommand("sg", "spectate", cmdPly:Nick())
end

Configuration.Administration["serverguard"].ban = function(cmdPly, time, reason)
    RunConsoleCommand("sg", "ban", cmdPly:Nick(), time, reason)
end

Configuration.Administration["serverguard"].kick = function(cmdPly, reason)
    RunConsoleCommand("sg", "kick", cmdPly:Nick(), reason)
end

// X  A D M I N  2

Configuration.Administration["xadmin2"] = {}
Configuration.Administration["xadmin2"].goto = function(cmdPly)
    RunConsoleCommand("xadmin", "goto", cmdPly:Nick())
end

Configuration.Administration["xadmin2"].bring = function(cmdPly)
    RunConsoleCommand("xadmin", "bring", cmdPly:Nick())
end

Configuration.Administration["xadmin2"].freeze = function(cmdPly)
    RunConsoleCommand("xadmin", "bring", cmdPly:Nick())
    RunConsoleCommand("xadmin", "freeze", cmdPly:Nick())
end

Configuration.Administration["xadmin2"].unfreeze = function(cmdPly)
    RunConsoleCommand("xadmin", "unfreeze", cmdPly:Nick())
end

Configuration.Administration["xadmin2"].send = function(cmdPly)
    RunConsoleCommand("xadmin", "return", cmdPly:Nick())
end

Configuration.Administration["xadmin2"].spectate = function(cmdPly)
    RunConsoleCommand("xadmin", "spectate", cmdPly:Nick())
end

Configuration.Administration["xadmin2"].ban = function(cmdPly, time, reason)
    RunConsoleCommand("xadmin", "ban", cmdPly:Nick(), time, reason)
end

Configuration.Administration["xadmin2"].kick = function(cmdPly, reason)
    RunConsoleCommand("xadmin", "kick", cmdPly:Nick(), reason)
end

// X  A D M I N  1

Configuration.Administration["xadmin"] = {}
Configuration.Administration["xadmin"].goto = function(cmdPly)
    RunConsoleCommand("xadmin_goto", "goto", cmdPly:Nick())
end

Configuration.Administration["xadmin"].bring = function(cmdPly)
    RunConsoleCommand("xadmin_bring", "bring", cmdPly:Nick())
end

Configuration.Administration["xadmin"].freeze = function(cmdPly)
    RunConsoleCommand("xadmin_bring", "bring", cmdPly:Nick())
    RunConsoleCommand("xadmin_freeze", "freeze", cmdPly:Nick())
end

Configuration.Administration["xadmin"].unfreeze = function(cmdPly)
    RunConsoleCommand("xadmin_unfreeze", "unfreeze", cmdPly:Nick())
end

Configuration.Administration["xadmin"].send = function(cmdPly)
    RunConsoleCommand("xadmin_return", "return", cmdPly:Nick())
end

Configuration.Administration["xadmin"].spectate = function(cmdPly)
    RunConsoleCommand("xadmin_spectate", "spectate", cmdPly:Nick())
end

Configuration.Administration["xadmin"].ban = function(cmdPly, time, reason)
    RunConsoleCommand("xadmin_ban", "ban", cmdPly:Nick(), time, reason)
end

Configuration.Administration["xadmin"].kick = function(cmdPly, reason)
    RunConsoleCommand("xadmin_kick", "kick", cmdPly:Nick(), reason)
end
--PATH addons/mc_simple_npcs/lua/mcs_npcs/sh_npcspawn.lua:
--  _______               __          _______  __                   __          _______  ______  ______        
-- |   |   |.---.-..----.|  |.-----. |     __||__|.--------..-----.|  |.-----. |    |  ||   __ \|      |.-----.
-- |       ||  _  ||  __| |_||__ --| |__     ||  ||        ||  _  ||  ||  -__| |       ||    __/|   ---||__ --|
-- |__|_|__||___._||____|    |_____| |_______||__||__|__|__||   __||__||_____| |__|____||___|   |______||_____|
--                                                          |__|      
-- Template moved to the documentation

MCS.Spawns["metro"] = {
	name = "Huju Mijanda",
	model = "models/player/dewobedil/persona/police/default_p.mdl",
	namepos = 80,
	theme = "Default",
	pos = {
		["rp_animeworld_v2"] = { Vector(-10153.764648438,-2949.9328613281,92.03125 ), Angle(0,91.819969177246,0 )},
	},
	sequence = "pose_standing_02",
	uselimit = false,
	skin = 1,
	bgr = {[2] = 1,[3] = 1,[4] = 1,[5] = 1,[6] = 1,[7] = 1,},
	dialogs = {
		[1] = {
			["Line"] = "Bonsoir, bienvenue a Kyoto ! Faite attention a vous si vous trainez vers les  Appartements !",
			["Sound"] = "",
			["Answers"] = {
				{"D'accord merci !", "close",},
				{"Que c'est t-il passez ?", 2,},
			},
		},
		[2] = {
			["Line"] = "Il y a eu un meurtre, les cause sont toujours innexpliquer, et nous ne pouvons en dire plus.",
			["Sound"] = "",
			["Answers"] = {
				{"D'accord merci !", "close",},
				{"Je vais eviter cette endroit.", "close",},
			},
		},
	}
}

MCS.Spawns["journal1"] = {
	name = "Journal *2016*",
	model = "models/props_junk/garbage_newspaper001a.mdl",
	namepos = 30,
	theme = "Hollow Knight",
	pos = {
		["rp_animeworld_v2"] = { Vector(-9814.439453125,-2581.0390625,163.14172363281 ), Angle(0,-89.460037231445,0 )},
	},
	sequence = "pose_standing_02",
	uselimit = false,
	skin = 1,
	bgr = {},
	dialogs = {
		[1] = {
			["Line"] = "News 1 : Un vieux fou accuse Mr,Speedwagon d'etre un Monstre venu d'une autre planete !",
			["Sound"] = "",
			["Answers"] = {
				{"Laisser le Journal.", "close",},
				{"Tournez la page", 2,},
			},
		},
		[2] = {
			["Line"] = "News 2 : Un tombeaux a ete retrouver dans les egouts, aucun specialiste n'ose s'en approcher dut a l'odeur.",
			["Sound"] = "",
			["Answers"] = {
				{"Laisser le Journal.", "close",},
				{"Tournez la page.", 3,},
			},
		},
		[3] = {
			["Line"] = "News 3 : Un convoie qui transportais de vieille antiquite a été attaquer, un masque aurais été voler.",
			["Sound"] = "",
			["Answers"] = {
				{"Laisser le Journal.", "close",},
			},
		},
	}
}

MCS.Spawns["monoko"] = {
	name = "Adam Smith",
	model = "models/weaman01/weaman01_pm.mdl",
	namepos = 82,
	theme = "Default",
	pos = {
		["rp_animeworld_v2"] = { Vector(-8940.9599609375,-2035.1480712891,84.03125 ), Angle(0,-90.339981079102,0 )},
	},
	sequence = "menu_combine",
	uselimit = false,
	skin = 1,
	bgr = {},
	dialogs = {
		[1] = {
			["Line"] = "Hi, pardon, bonjours, vous êtes l/homme que l/agence envoie ? Je suis vraiment maladroit pardonner moi.",
			["Sound"] = "",
			["Answers"] = {
				{"Oui exacte,emt, venez", "close",},
				{"Vous voulez que je vous montre la ville ?", 2,},
			},
		},
		[2] = {
			["Line"] = "Non thank you, je cherche surtout a voir le Directeur merci encore.",
			["Sound"] = "",
			["Answers"] = {
				{"D'accord venez !", "close",},
			},
		},
	}
}

MCS.Spawns["psiclor"] = {
	name = "Psiclor",
	model = "models/player/pes/pesci_pm/pesci_pm.mdl",
	namepos = 82,
	theme = "Default",
	pos = {
		["rp_animeworld_v2"] = { Vector(-1031.4096679688,-1567.7431640625,84.031356811523 ), Angle(0,173.69000244141,0 )},
	},
	sequence = "menu_combine",
	uselimit = false,
	skin = 1,
	bgr = {},
	dialogs = {
		[1] = {
			["Line"] = "Hé ! Tes un nouveaux toi ? Bienvenue dans le Desert. Si tes ici c'est soit que tes perdu, soit que tu cherche a faire de l'argent ?",
			["Sound"] = "",
			["Answers"] = {
				{"C'est pour une autre cause.. aurevoir.", "close",},
				{"Je veut faire de l'argent effectivement !", 2,},
			},
		},
		[2] = {
			["Line"] = "Ah ! Le meilleur business de notre fabuleux desert... Bah c'est la pierre. Devenez mineur sinon je voit pas comment vous pourriez devenir riche.",
			["Sound"] = "",
			["Answers"] = {
				{"D'accord merci !", "close",},
				{"Si je dois avoir la meme tete que toi pour devenir mineur...", "close",},
			},
		},
	}
}

--PATH addons/mc_simple_npcs/lua/mcs_npcs/cl_util.lua:
--  _______               __          _______  __                   __          _______  ______  ______        
-- |   |   |.---.-..----.|  |.-----. |     __||__|.--------..-----.|  |.-----. |    |  ||   __ \|      |.-----.
-- |       ||  _  ||  __| |_||__ --| |__     ||  ||        ||  _  ||  ||  -__| |       ||    __/|   ---||__ --|
-- |__|_|__||___._||____|    |_____| |_______||__||__|__|__||   __||__||_____| |__|____||___|   |______||_____|
--                                                          |__|                                               

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////// Warning! Edit this only if you know what are you doing ///////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

local defnpc = {
	uid = "uid", 
	name = "Alyx",
	model = "models/alyx.mdl",
	pos = {
		 ["all"] = {Vector(0,0,0), Angle(0,0,0)}
	},
	bgr = {},
	skin = 0,
	uselimit = false,
	theme = "Default",
	namepos = 80,
	sequence = "",
	dialogs = {}
}

local localnpc = table.Copy(defnpc)

MCS.PanelControll = {}

MCS.PanelControll.AddHeader = function(panel, header, h) 

	local label = vgui.Create( "DLabel" )
	label:SetFont( "MCS_Arial16"  )
	label:SetText( header )
	label:SetAutoStretchVertical( true )
	
	panel:AddItem(label)
end

MCS.PanelControll.AddTextEntry = function(parent, header, h, value, func) 
	
	local panel = vgui.Create( "DPanel" )
	panel:SetSize( parent:GetWide(), h )
	panel.Paint = function() end
	
	local label = vgui.Create( "DLabel", panel )
	label:SetFont( "MCS_Arial16"  )
	label:SetPos( 0, 0 )
	label:SetSize( parent:GetWide()/4, h )
	label:SetTextColor(  color_white )
	label:SetText( header )
	label:SetAutoStretchVertical( true )
	
	local textentry = vgui.Create( "DTextEntry", panel )
	textentry:SetPos( parent:GetWide()/4+5, 0 )
	textentry:SetSize( parent:GetWide()-parent:GetWide()/4-5, h )
	textentry:SetText( value or "" )
	textentry:SetUpdateOnType( true )
	function textentry:OnValueChange( value )
		if func then func(value) end
	end
	parent:AddItem(panel)
	
	return textentry
end

MCS.PanelControll.AddCheckBox = function(parent, header, h, value, func) 
	
	local panel = vgui.Create( "DPanel" )
	panel:SetSize( parent:GetWide(), h )
	panel.Paint = function() end
	
	local DermaCheckbox = vgui.Create("DCheckBoxLabel", panel )
	DermaCheckbox:SetPos( 0, 0 )
	DermaCheckbox:SetSize( parent:GetWide()-30, h )
	DermaCheckbox:SetText( header )	
	DermaCheckbox:SetValue( value )
	DermaCheckbox:SetFont( "MCS_Arial16"  )
	DermaCheckbox:SetTextColor( color_white )
	function DermaCheckbox:OnChange( value )
		if func then func(value) end
	end
		
	parent:AddItem(panel)
	
	return DermaCheckbox
end

MCS.PanelControll.AddThemeSelect = function(parent, header, h, value, func) 
	
	local panel = vgui.Create( "DPanel" )
	panel:SetSize( parent:GetWide(), h )
	panel.Paint = function() end
	
	local label = vgui.Create( "DLabel", panel )
	label:SetFont( "MCS_Arial16"  )
	label:SetPos( 0, 0 )
	label:SetSize( parent:GetWide()/4, h )
	label:SetTextColor(  color_white )
	label:SetText( header )
	label:SetAutoStretchVertical( true )
	
	local combobox = vgui.Create( "DComboBox", panel )
	combobox:SetPos( parent:GetWide()/4+5, 0 )
	combobox:SetSize( parent:GetWide()-parent:GetWide()/4-5, h )
	combobox:SetValue( value )
	combobox:AddChoice( "Default" )
	for k,v in pairs(MCS.Themes) do
		combobox:AddChoice( k )
	end
	combobox.OnSelect = function( _, _, value )
		if func then func(value) end
	end

	parent:AddItem(panel)
	
	return combobox
end

MCS.PanelControll.AddNumberScroll = function(parent, header, h, value, func) 
	
	local panel = vgui.Create( "DPanel" )
	panel:SetSize( parent:GetWide(), h )
	panel.Paint = function() end
	
	local label = vgui.Create( "DLabel", panel )
	label:SetFont( "MCS_Arial16"  )
	label:SetPos( 0, 0 )
	label:SetSize( parent:GetWide()/4, h )
	label:SetTextColor(  color_white )
	label:SetText( header )
	label:SetAutoStretchVertical( true )
	
	local NumSlider = vgui.Create( "DNumSlider",panel )
	NumSlider:SetPos( parent:GetWide()/4+5, 0 )
	NumSlider:SetSize( parent:GetWide()-parent:GetWide()/4-5, h )
	NumSlider:SetText( "" )
	NumSlider:SetTall( 20 )
	NumSlider:SetDecimals( 0 )
	NumSlider:SetMax( 300 )
	NumSlider:SetValue( value or 30 )
	NumSlider.type = "skin"
	NumSlider.OnValueChanged = function(x, value) 
		if func then func(value) end
	end

	parent:AddItem(panel)
	
	return NumSlider
end

MCS.PanelControll.ModelFrame = function(parent, header, model) 
	
	if !model then
		model = "models/Humans/Group01/Male_01.mdl"
	end
	
	local aframe, icon, modelentry, animation, ab, GebuildSkinMenu, skinmenu
	local modelsize = 280
	
	if ScrH() > 1000 then  modelsize = 500 end
	
	local panel = vgui.Create( "DPanel" )
	panel:SetSize( parent:GetWide(), modelsize )
	panel.Paint = function() end
	
	local label = vgui.Create( "DLabel", panel )
	label:SetFont( "MCS_Arial16"  )
	label:SetPos( 0, 0 )
	label:SetSize( parent:GetWide()/4, 20 )
	label:SetTextColor(  color_white )
	label:SetText( "Model:" )
	label:SetAutoStretchVertical( true )
	
	local label = vgui.Create( "DLabel", panel )
	label:SetFont( "MCS_Arial16"  )
	label:SetPos( 0, 20 )
	label:SetSize( parent:GetWide()-parent:GetWide()/3, 20 )
	label:SetTextColor(  color_white )
	label:SetText( "Drag model to rotate, double click to zoom" )
	label:SetAutoStretchVertical( true )
	
	local label = vgui.Create( "DLabel", panel )
	label:SetFont( "MCS_Arial16"  )
	label:SetPos( 0, 45 )
	label:SetSize( 60, 20 )
	label:SetTextColor(  color_white )
	label:SetText( "Animation" )
	label:SetAutoStretchVertical( true )
	
	icon = vgui.Create( "DModelPanel", panel )
	icon:SetSize( parent:GetWide()/3, modelsize - 30 )
	icon:SetPos( parent:GetWide()-parent:GetWide()/3, 25 )
	icon:SetFOV( 35 )
	icon:SetCamPos( Vector( 0, 0, 0 ) )
	icon:SetDirectionalLight( BOX_RIGHT, Color( 255, 160, 80, 255 ) )
	icon:SetDirectionalLight( BOX_LEFT, Color( 80, 160, 255, 255 ) )
	icon:SetAmbientLight( Vector( -64, -64, -64 ) )
	icon:SetAnimated( true )
	icon.Angles = Angle( 0, 0, 0 )
	icon:SetLookAt( Vector( -100, 0, -22 ) )
	icon:SetModel( model )
	icon.Entity:ResetSequence( localnpc.sequence or "idle" )
	icon.Entity:SetPos( Vector( -100, 0, -61 ) )
	function icon:DragMousePress()
		self.PressX, self.PressY = gui.MousePos()
		self.Pressed = true
	end
	function icon:DoDoubleClick()
		if icon:GetFOV() < 10 then
			icon:SetFOV( 40 )
		else
			icon:SetFOV( icon:GetFOV() - 5 )
		end
	end
	function icon:DragMouseRelease() self.Pressed = false end

	function icon:LayoutEntity( ent )
		if ( self.bAnimated ) then self:RunAnimation() end

		if ( self.Pressed ) then
			local mx, my = gui.MousePos()
			self.Angles = self.Angles - Angle( 0, ( self.PressX or mx ) - mx, 0 )

			self.PressX, self.PressY = gui.MousePos()
		end

		ent:SetAngles( self.Angles )
	end
	
	parent:AddItem(panel)
	
	
	modelentry = vgui.Create( "DTextEntry", panel )
	modelentry:SetPos( parent:GetWide()/4+5, 0 )
	modelentry:SetSize( parent:GetWide()-parent:GetWide()/4-5, 20 )
	modelentry:SetText( model )
	modelentry:SetUpdateOnType( true )
	function modelentry:OnValueChange( value )
			icon:SetModel( value )
			icon.Entity:ResetSequence( "idle" )
			animation:SetText("idle")
			icon.Entity:SetPos( Vector( -100, 0, -61 ) )
			GebuildSkinMenu()
			localnpc.model = value
			localnpc.skin = 1
			localnpc.bgr = {}
	end
	
	animation = vgui.Create( "DTextEntry", panel )
	animation:SetPos( 60, 45 )
	animation:SetSize( parent:GetWide()/4, 20 )
	animation:SetText( localnpc.sequence or "idle" )
	animation:SetUpdateOnType( true )
	function animation:OnValueChange( value )
		local iSeq = icon.Entity:LookupSequence( value )
		if ( iSeq > 0 ) then icon.Entity:ResetSequence( iSeq ) end
		localnpc.sequence = string.lower(value)
	end
	
	ab = vgui.Create("DButton", panel )
	ab:SetSize( 55, 20 )
	ab:SetPos( 60+parent:GetWide()/4, 45 )
	ab:SetText( "Get Anim." )	
	ab.DoClick = function()
		if !ValidPanel(aframe) then
			aframe = MCS.PanelControll.AnimationMenu(panel, animation, icon.Entity, true)
		end
	end
	
	local skinmenu = vgui.Create( "DPanelList", panel )
	skinmenu:SetSize( panel:GetWide()-panel:GetWide()/3, panel:GetTall() - 80 )
	skinmenu:SetPos( 0, 80 )
	skinmenu:EnableVerticalScrollbar( true )
	skinmenu:EnableHorizontal( false )
	skinmenu:SetSpacing(1)
	skinmenu.Paint = function() end
	
	GebuildSkinMenu = function()
		skinmenu:Clear()
		
		local nskins = icon.Entity:SkinCount() - 1
		if ( nskins > 0 ) then
			local skins = vgui.Create( "DNumSlider" )
			skins:Dock( TOP )
			skins:SetText( "Skin" )
			skins:SetTall( 20 )
			skins:SetDecimals( 0 )
			skins:SetMax( nskins )
			skins:SetValue( localnpc.skin or 1 )
			skins.type = "skin"
			skins.OnValueChanged = function(x, value) 
				icon.Entity:SetSkin( value )
				localnpc.skin = value
			end
			skinmenu:AddItem( skins )
		end
		
		for k = 0, icon.Entity:GetNumBodyGroups() - 1 do
			if ( icon.Entity:GetBodygroupCount( k ) <= 1 ) then continue end
			local bgroup = vgui.Create( "DNumSlider" )
			bgroup:Dock( TOP )
			bgroup:SetText(icon.Entity:GetBodygroupName( k ))
			bgroup:SetTall( 20 )
			bgroup:SetDecimals( 0 )
			bgroup.type = "bgroup"
			bgroup.typenum = k
			bgroup:SetMax( icon.Entity:GetBodygroupCount( k ) - 1 )
			bgroup:SetValue( localnpc.bgr[k] or 0 )
			bgroup.OnValueChanged = function(x, value) 
				icon.Entity:SetBodygroup( k, value )
				localnpc.bgr[k] = value
			end
			skinmenu:AddItem( bgroup )
			
		end
		
	end
	
	if localnpc.bgr then
		for k,v in pairs(localnpc.bgr) do
			icon.Entity:SetBodygroup( k, v )
		end
	end
	
	icon.Entity:SetSkin( localnpc.skin or 1 )
	
	
	GebuildSkinMenu()
	
	return icon.Entity
end

MCS.PanelControll.AnimationMenu = function(parent, te, ent, setanim)
	
	local mx, my = gui.MousePos()
	
	local frame = vgui.Create( "DFrame" )
	frame:SetSize( 300, 400 )
	frame:SetPos( mx-300, my )
	frame:SetDraggable( true )
	frame:ShowCloseButton( true )
	frame:MakePopup()
	frame:SetTitle( "Animations List" )
	frame.StartT = CurTime() + 2
	frame.Think = function(self)
		if !ValidPanel(parent) or (!self:HasFocus() and self.StartT < CurTime() ) then
			self:Close()
		end
	end
	
	local AnimList = vgui.Create( "DListView", frame )
	AnimList:AddColumn( "name" )
	AnimList:Dock( FILL )
	AnimList:SetMultiSelect( false )
	AnimList:SetHideHeaders( true )
	
	for k, v in SortedPairsByValue( ent:GetSequenceList() or {} ) do

		local line = AnimList:AddLine( string.lower( v ) )
		
		line.OnSelect = function()
			
			if te then
				te:SetValue( string.lower( v ) )
			end
			
			if setanim then
				ent:ResetSequence( v )
				ent:SetCycle( 0 )
				localnpc.sequence = string.lower(v)
			end
			
		end

	end
	
	return frame
	
end

MCS.PanelControll.FileOpen = function(parent, func)
	
	local mx, my = gui.MousePos()
	
	local frame = vgui.Create( "DFrame" )
	frame:SetSize( 300, 400 )
	frame:SetPos( mx, my )
	frame:MakePopup()
	frame:SetTitle( "File List" )
	frame.StartT = CurTime() + 2
	frame.Think = function(self)
		if !ValidPanel(parent) or (!self:HasFocus() and self.StartT < CurTime() ) then
			self:Close()
		end
	end
	
	local FileList = vgui.Create( "DListView", frame )
	FileList:AddColumn( "File name" )
	FileList:Dock( FILL )
	FileList:SetMultiSelect( false )
	FileList:SetHideHeaders( false )
	local files, dir = file.Find( "mac_npc/*", "DATA" )
	for k, v in pairs( files ) do

		local line = FileList:AddLine( v )
		
		line.OnSelect = function()
			
			jsontable = file.Read( "mac_npc/"..v, "DATA" )
			localnpc = util.JSONToTable(jsontable)
			frame:Close()
			func()
			
		end

	end
	
	return frame
	
end

MCS.PanelControll.PosSelect = function(parent)
	
	local FRebuild
	
	local posmenu = vgui.Create( "DPanelList", parent )
	posmenu:SetSize( parent:GetWide(), 100 )
	posmenu:EnableVerticalScrollbar( true )
	posmenu:EnableHorizontal( false )
	posmenu:SetSpacing(1)
	posmenu.Paint = function() end
	
	local function EditPosFrame(parent, data)
	
		local mx, my = gui.MousePos()
		
		local newdata = table.Copy(data)
		
		local frame = vgui.Create( "DFrame" )
		frame:SetSize( 400, 80 )
		frame:SetPos( mx, my )
		frame:MakePopup()
		frame:SetTitle( "Pos. edit" )
		frame.Think = function(self)
			if !ValidPanel(parent) then
				self:Close()
			end
		end
		
		local label = vgui.Create( "DLabel", frame )
		label:SetFont( "MCS_Arial16"  )
		label:SetPos( 5, 30 )
		label:SetSize( 30, 20 )
		label:SetTextColor(  color_white )
		label:SetText( "Vec:" )
		label:SetAutoStretchVertical( true )
		
		for i=0,2 do 
			local map = vgui.Create( "DTextEntry", frame )
			map:SetPos( 40+i*81, 30 )
			map:SetSize( 80, 20 )
			map:SetText( data[1][i+1] )
			map:SetUpdateOnType( true )
			function map:OnValueChange( value )
				newdata[1][i+1] = value
			end
		end
		
		local label = vgui.Create( "DLabel", frame )
		label:SetFont( "MCS_Arial16"  )
		label:SetPos( 5, 55 )
		label:SetSize( 30, 20 )
		label:SetTextColor(  color_white )
		label:SetText( "Ang:" )
		label:SetAutoStretchVertical( true )
		
		for i=0,2 do 
			local map = vgui.Create( "DTextEntry", frame )
			map:SetPos( 40+i*81, 55 )
			map:SetSize( 80, 20 )
			map:SetText( data[2][i+1] )
			map:SetUpdateOnType( true )
			function map:OnValueChange( value )
				newdata[2][i+1] = value
			end
		end
		
		local b = vgui.Create("DButton", frame)
		b:SetSize( 58, 20 )
		b:SetPos( 282, 30 )
		b:SetText( "Player Pos" )	
		b.DoClick = function()
			local pos = LocalPlayer():GetPos()
			local ang = LocalPlayer():EyeAngles()
			data[1] = pos
			data[2] = Angle(0,ang.y,0)
			frame:Close()
			FRebuild()
		end
		
		local b = vgui.Create("DButton", frame)
		b:SetSize( 58, 20 )
		b:SetPos( 340, 30 )
		b:SetText( "Ent Pos" )	
		b.DoClick = function()
			local TraceEnt = LocalPlayer():GetEyeTrace().Entity
			if (TraceEnt:IsValid()) then
				local pos = TraceEnt:GetPos()
				local ang = TraceEnt:GetAngles()
				data[1] = pos
				data[2] = ang
				frame:Close()
				FRebuild()
			end
		end
		
		local b = vgui.Create("DButton", frame)
		b:SetSize( 116, 20 )
		b:SetPos( 282, 55 )
		b:SetText( "Save" )	
		b.DoClick = function()
			data = newdata
			frame:Close()
			FRebuild()
		end
		
	end
	
	FRebuild = function()
		posmenu:Clear()
		local b = vgui.Create("DButton")
		b:SetSize( posmenu:GetWide(), 20 )
		b:SetText( "Add Map" )	
		b.DoClick = function()
			if localnpc.pos[string.lower(game.GetMap())] then
				localnpc.pos["map_name_"..table.Count(localnpc.pos) + 1] = {Vector(0,0,0), Angle(0,0,0)}
			else
				localnpc.pos[string.lower(game.GetMap())] = {Vector(0,0,0), Angle(0,0,0)}
			end
			FRebuild()
		end
		posmenu:AddItem(b)
		
		local pw = parent:GetWide()
		
		for k,v in pairs(localnpc.pos) do
			local panel = vgui.Create( "DPanel" )
			panel:SetSize( pw, 20 )
			panel.Paint = function() end
			
			local label = vgui.Create( "DLabel", panel )
			label:SetFont( "MCS_Arial16"  )
			label:SetPos( pw/4+5, 0 )
			label:SetSize( pw/2, 20 )
			label:SetTextColor(  color_white )
			label:SetText( "Vec:"..v[1].x..", "..v[1].y..", "..v[1].z.." Ang:"..v[2].p..", "..v[2].y..", "..v[2].r )
			label:SetAutoStretchVertical( true )
			posmenu:AddItem(panel)
			
			local map = vgui.Create( "DTextEntry", panel )
			map:SetPos( 0, 0 )
			map:SetSize( pw/4, 20 )
			map:SetText( k )
			map.lastchange = 0
			function map:OnValueChange( value )
				if value != k and map.lastchange < CurTime() then
					localnpc.pos[value] = localnpc.pos[k]
					localnpc.pos[k] = nil
					map.lastchange = CurTime() + 1
					FRebuild()
				end		
			end
			function map:OnFocusChanged(gained )
				if !gained then
					map:OnEnter()
				end
			end
			
		
			local b = vgui.Create("DButton", panel)
			b:SetSize( pw/10, 20 )
			b:SetPos( pw-(pw/10)*2, 0 )
			b:SetText( "Edit" )	
			b.DoClick = function()
				EditPosFrame(panel, localnpc.pos[k])
			end
			
			local b = vgui.Create("DButton", panel)
			b:SetSize( pw/10, 20 )
			b:SetPos( pw-pw/10, 0 )
			b:SetText( "Remove" )	
			b.DoClick = function()
				localnpc.pos[k] = nil
				FRebuild()
			end
			
		end
		
	end
	
	FRebuild()
	
	parent:AddItem(posmenu)
	return posmenu
	
end

net.Receive("OpenMCSSetupMenu", function()
	
	if !LocalPlayer():IsSuperAdmin() then return end
	
	local RebuidAllFrames, RebuildDialogueFrame, RebuildNPCFrame, localmodel
	
	local function AutoSave() 
		file.Write("mac_npc/autosave.txt", util.TableToJSON(localnpc))
	end
	
	if !file.Exists( "mac_npc", "DATA" ) then
		file.CreateDir( "mac_npc" )
	end
	
	if file.Exists( "mac_npc/autosave.txt", "DATA" ) then
		jsontable = file.Read( "mac_npc/autosave.txt", "DATA" )
		localnpc = util.JSONToTable(jsontable)
	end

	local MainM = vgui.Create( "DFrame" )
	MainM:SetSize( ScrW()-300, ScrH()-50 )
	MainM:Center()
	MainM:MakePopup()
	MainM:SetDraggable( false )
	MainM:ShowCloseButton( true )
	MainM:SetTitle( "Simple NPCs Setup Menu" )
	MainM.OnClose = function()
		AutoSave() 
	end
	MainM.Paint = function(self, w, h)
		draw.RoundedBox( 0, 1, 1, w, h, Color( 55, 55, 55, 255))
		MCS.Frame(0,0,w,h,15,Color(155,155,155, 255),Color(255,255,255, 255))
		draw.RoundedBox( 0, 1, 1, w, 25, Color( 0, 0, 0, 200)) 
		draw.SimpleText( "NPC Setup", "MCS_Arial16", 10, 50, Color(255,255,255), TEXT_ALIGN_LEFT )
		draw.SimpleText( "Dialogue Setup", "MCS_Arial16", w/2+5, 50, Color(255,255,255), TEXT_ALIGN_LEFT )
	end
	
	local MenuBar = vgui.Create( "DMenuBar", MainM )
	MenuBar:DockMargin( -3, -6, -3, 0 )
	local oframe
	
	local M1 = MenuBar:AddMenu( "File" )
	M1:AddOption( "New", function() localnpc = table.Copy(defnpc) RebuidAllFrames() end ):SetIcon( "icon16/page_white_go.png" )
	M1:AddOption( "Open", function() 
		if !ValidPanel(oframe) then
			oframe = MCS.PanelControll.FileOpen(MainM, function() RebuidAllFrames() end)
		end
	end ):SetIcon( "icon16/folder_go.png" )
	M1:AddOption( "Save", function() file.Write("mac_npc/"..localnpc.uid..".txt", util.TableToJSON(localnpc)) end ):SetIcon( "icon16/disk.png" )
	
	local M2 = MenuBar:AddMenu( "Edit" )
	M2:AddOption( "Copy lua code", function() RunConsoleCommand("mcs_generate") end )
	
	local M3 = MenuBar:AddMenu( "Help" )
	M3:AddOption( "Full documentation", function() gui.OpenURL( "https://docs.google.com/document/d/1TCdjXQ7jDGpn0Jukno6yGbcdo29puzzqHZTYteNRcrs/edit?usp=sharing" ) end )
	
	local mw, mh = MainM:GetWide(), MainM:GetTall()
	
	local NPCframe = vgui.Create( "DPanelList", MainM )
	NPCframe:SetSize( mw/2-15, mh-75 )
	NPCframe:SetPos( 10, 70 )
	NPCframe:EnableVerticalScrollbar( true )
	NPCframe:EnableHorizontal( false )
	NPCframe:SetSpacing(3)
	NPCframe.Paint = function(self,w,h)	end
	
	local DGframe = vgui.Create( "DPanelList", MainM )
	DGframe:SetSize( mw/2-15, mh-75 )
	DGframe:SetPos( mw/2+5, 70 )
	DGframe:EnableVerticalScrollbar( true )
	DGframe:EnableHorizontal( false )
	DGframe:SetSpacing(3)
	DGframe.Paint = function(self,w,h) end
	
	RebuildNPCFrame = function()
		NPCframe:Clear()
		MCS.PanelControll.AddHeader(NPCframe, "Unique name must be UNIQUE.\n2 or more NPCs with identical unique name will not work.")
		MCS.PanelControll.AddTextEntry(NPCframe, "Unique name", 20, localnpc.uid, function(value) localnpc.uid = value end)
		MCS.PanelControll.AddHeader(NPCframe, "NPC's name will be shown to players above the NPC and via the dialogue.")
		MCS.PanelControll.AddTextEntry(NPCframe, "NPC's name", 20, localnpc.name, function(value) localnpc.name = value end)
		MCS.PanelControll.AddHeader(NPCframe, "NPC's name position can be useful if you use bigger or smaller model than the standat player models.")
		MCS.PanelControll.AddNumberScroll(NPCframe, "NPC's name position", 20, localnpc.namepos, function(value) localnpc.namepos = math.Round(value) end)
		MCS.PanelControll.AddCheckBox(NPCframe, "Allow only one player to speak to the npc at the same time", 20, localnpc.uselimit or false, function(value) localnpc.uselimit = value RebuildDialogueFrame() end)
		MCS.PanelControll.AddThemeSelect(NPCframe, "Dialogue theme", 20, localnpc.theme or "Default", function(value) localnpc.theme = value end)
		localmodel = MCS.PanelControll.ModelFrame(NPCframe, "Model", localnpc.model)
		MCS.PanelControll.PosSelect(NPCframe)
		
		local b = vgui.Create("DButton")
		b:SetSize( NPCframe:GetWide()-10, 30 )
		b:SetText( "Copy to Clipboard and Close" )	
		b.DoClick = function()
			RunConsoleCommand("mcs_generate")
			MainM:Close()
		end
		NPCframe:AddItem(b)
	end
	local function AddDialogue()
		table.insert(localnpc.dialogs, { ["Line"] = "", ["Sound"] = "", ["Answers"] = { {"", "close", nil, nil, ""}}, })
		RebuildDialogueFrame()
	end	
	RebuidAllFrames = function()
		RebuildDialogueFrame()
		RebuildNPCFrame()
	end
	
	RebuildDialogueFrame = function()
		DGframe:Clear()
		
		local b = vgui.Create("DButton")
		b:SetSize( DGframe:GetWide()-10, 25 )
		b:SetText( "Add Line" )	
		b.DoClick = function()
			AddDialogue()
		end
		DGframe:AddItem(b)
		
		for k,v in pairs(localnpc.dialogs) do 
			local wide = DGframe:GetWide()-10
			
			local sf = vgui.Create( "DPanel" )
			sf:SetSize( wide, 95 + (25 * table.Count(v["Answers"])) )
			
			local dl = vgui.Create( "DLabel", sf )
			dl:SetPos( 5, 5 ) 
			dl:SetSize( wide, 15 )
			dl:SetDark( 1 )
			dl:SetText( "ID: "..k )
			
			local dl = vgui.Create( "DLabel", sf )
			dl:SetPos( 5, 47 ) 
			dl:SetSize( 35, 20 )
			dl:SetDark( 1 )
			dl:SetText( "Sound:" )
			
			if k != 1 then
				local b = vgui.Create("DButton", sf )
				b:SetSize( 15, 15 )
				b:SetPos( sf:GetWide()-20, 3 )
				b:SetText( "X" )	
				b.DoClick = function()
					table.remove(localnpc.dialogs, k)
					sf:Remove()
				end
			end
			
			local te = vgui.Create( "DTextEntry", sf )
			te:SetPos( 5, 25 )
			te:SetSize( sf:GetWide()-10, 20 )
			te:SetText( localnpc.dialogs[k]["Line"] )
			te:SetUpdateOnType( true )
			function te:OnValueChange( value )
				localnpc.dialogs[k]["Line"] = value
			end
			
			local te = vgui.Create( "DTextEntry", sf )
			te:SetPos( 40, 47 )
			te:SetSize( sf:GetWide()-45, 20 )
			te:SetText( localnpc.dialogs[k]["Sound"] )
			te:SetUpdateOnType( true )
			function te:OnValueChange( value )
				localnpc.dialogs[k]["Sound"] = value
			end
			
			local b = vgui.Create("DButton", sf )
			b:SetPos( 5, 69 )
			b:SetSize( sf:GetWide()-10, 20 )
			b:SetText( "Add Answer" )	
			b.DoClick = function()
				table.insert(v["Answers"], {"", "close"})
				RebuildDialogueFrame()
			end
			
			for c,a in pairs(v["Answers"]) do
				local te = vgui.Create( "DTextEntry", sf )
				te:SetPos( 5, 92 + ((c-1) * 25) )
				te:SetSize( sf:GetWide()/2, 20 )
				te:SetText( a[1] )
				te:SetUpdateOnType( true )
				function te:OnValueChange( value )
					a[1] = value
				end
				
				local cb = vgui.Create( "DButton", sf )
				cb:SetPos(  sf:GetWide()/2+5, 92 + ((c-1) * 25) )
				cb:SetSize( sf:GetWide()/8-10, 20 )
				cb:SetText( a[2] )
				cb.DoClick = function()
					local cdmenu = DermaMenu()
					for i=1,#localnpc.dialogs do
						cdmenu:AddOption( "#"..i, function() a[2] = i cb:SetText( i ) end )
					end
					cdmenu:AddOption( "close", function() a[2] = "close" cb:SetText( "close" ) end )
					
					local cdsub = cdmenu:AddSubMenu( "Supportet addons:" )
					for id, addon in pairs(MCS.AddonList) do
						if addon["enabled"] then
							cdsub:AddOption( id, function() a[2] = '"'..id..'"' cb:SetText( a[2] ) end )
						end
					end
					cdmenu:Open()
				end	
				
				local b = vgui.Create("DButton", sf )
				b:SetPos(  sf:GetWide()/2+sf:GetWide()/8-5, 92 + ((c-1) * 25) )
				b:SetSize( sf:GetWide()/8-10, 20 )
				b:SetText( "Del" )	
				b.DoClick = function()
					table.remove(v["Answers"], c)
					RebuildDialogueFrame()
				end	
				
				if localnpc.uselimit then
				
					local te = vgui.Create( "DTextEntry", sf )
					te:SetPos( sf:GetWide()/2+(sf:GetWide()/8)*2-15, 92 + ((c-1) * 25) )
					te:SetSize( sf:GetWide()/8-5, 20 )
					te:SetText( a[5] or "" )
					te:SetUpdateOnType( true )
					function te:OnValueChange( value )
						a[5] = value
					end
					
					local aframe
					ab = vgui.Create("DButton", sf )
					ab:SetPos( sf:GetWide()/2+(sf:GetWide()/8)*3-20, 92 + ((c-1) * 25) )
					ab:SetSize( sf:GetWide()/8-10, 20 )
					ab:SetText( "Get Anim." )	
					ab.DoClick = function()
						if !ValidPanel(aframe) then
							aframe = MCS.PanelControll.AnimationMenu(sf, te, localmodel, false)
						end
					end
	
				end
				
			end
				
			DGframe:AddItem(sf)
		end
		
		local b = vgui.Create("DButton")
		b:SetSize( DGframe:GetWide()-10, 25 )
		b:SetText( "Test the dialogue" )	
		b.DoClick = function()
			if localnpc.theme and localnpc.theme != "Default" and MCS.Themes[localnpc.theme] then
				if MCS.Themes[localnpc.theme].Menu then
					MCS.Themes[localnpc.theme].Menu(nil, localnpc)
				elseif MCS.Themes[localnpc.theme].Paint then
					MCS.OpenDialogue(nil, localnpc.theme, localnpc)
				else
					MCS.OpenDialogue(nil, nil, localnpc)
				end
			else
				MCS.OpenDialogue(nil, nil, localnpc)
			end
			
		end
		DGframe:AddItem(b)
		
		
	end
	
	RebuidAllFrames()
end)

concommand.Add("mcs_generate", function( ply, cmd, args )

	if MCS.Spawns[localnpc.uid] then
		chat.AddText(Color(255, 0, 0), "Unique name is already used!")
	end
	
	if !localnpc then return end
	
	local uselimit_bool = "false"
	
	if localnpc.uselimit then uselimit_bool = "true" end
	
	local text = [[MCS.Spawns["]]..localnpc.uid..[["] = {
	name = "]]..localnpc.name..[[",
	model = "]]..localnpc.model..[[",
	namepos = ]]..localnpc.namepos..[[,
	theme = "]]..localnpc.theme..[[",
	pos = {
]]
	
	for k, v in pairs(localnpc.pos) do
		text = text..[[		["]]..k..[["] = { Vector(]]..v[1].x..[[,]]..v[1].y..[[,]]..v[1].z..[[ ), Angle(]]..v[2].p..[[,]]..v[2].y..[[,]]..v[2].r..[[ )},
]]
	end

	text = text..[[	},
	sequence = "]]..localnpc.sequence..[[",
	uselimit = ]]..uselimit_bool..[[,
]]

	if localnpc.skin then
		text = text..[[	skin = ]]..localnpc.skin..[[,
]]
	end
	
	if localnpc.bgr then
		text = text..[[	bgr = {]]
		
		for k, v in pairs(localnpc.bgr) do
			text = text.."["..k.."] = "..v..","
		end
		
		text = text..[[},
]]

	end
	
text = text..[[	dialogs = {
]]
	
	
	for k, v in pairs(localnpc.dialogs) do
		text = text..[[		[]]..k..[[] = {
			["Line"] = "]]..v["Line"]..[[",
			["Sound"] = "]]..v["Sound"]..[[",
			["Answers"] = {
]]
		for _, a in pairs(v["Answers"]) do
			local at = a[2]
			local an = a[5] or ""
			if at == "close" then at = '"close"' end
			if an != "" then an = ' nil, nil, "'..an..'"' end
			text = text..[[
				{"]]..a[1]..[[", ]]..at..[[,]]..an..[[},
]]
		end
		text = text..[[
			},
		},
]]
	end
	
	text = text..[[	}
}]]
	
	SetClipboardText(text)
	
end)
--PATH addons/msd_ui/lua/autorun/msd_autorun.lua:
-- ┏━┓┏━┳━━━┳━━━┓───────────────────────
-- ┃┃┗┛┃┃┏━┓┣┓┏┓┃───────────────────────
-- ┃┏┓┏┓┃┗━━┓┃┃┃┃──By MacTavish <3──────
-- ┃┃┃┃┃┣━━┓┃┃┃┃┃───────────────────────
-- ┃┃┃┃┃┃┗━┛┣┛┗┛┃───────────────────────
-- ┗┛┗┛┗┻━━━┻━━━┛───────────────────────

-- MIT License

-- Copyright (c) 2021 Ayden Mactavish

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

if MSD and MSD.Version ~= "1.0.3" then MsgC( Color(255, 8, 0), "[MSD] Another version of MSD detacted\n" ) return end

MSD = {}
MSD.Version = "1.0.3"
MSD.Config = {}
MSD.Modules = {}
MSD.ModuleIds = {}
MSD.Language = {}

if SERVER then
	util.AddNetworkString( "MSD.GetConfigData" )
	util.AddNetworkString( "MSD.SaveConfig" )
end

function MSD.Load()
	MsgC( Color(174, 0, 255), "[MSD] Initialization started\n" )
	if !file.Exists("msd_data", "DATA") then
		file.CreateDir("msd_data")
		MsgC( Color(174, 0, 255), "[MSD] Server DATA Dir created \n" )
	end

	MsgC( Color(174, 0, 255), "[MSD] Initialization started\n" )

	if SERVER then
		include("msd/sh_config.lua")
		include("msd/sh_language.lua")
		AddCSLuaFile("msd/sh_config.lua")
		AddCSLuaFile("msd/sh_language.lua")

		local f = file.Find( "msd/ui/*", "LUA" )
		for k,v in ipairs( f ) do
			AddCSLuaFile( "msd/ui/" .. v )
		end

	else
		include("msd/sh_config.lua")
		include("msd/sh_language.lua")

		local f = file.Find( "msd/ui/*", "LUA" )
		for k,v in ipairs( f ) do
			include( "msd/ui/" .. v )
		end

		list.Set( "DesktopWindows", "MSDModulesSetup", {
			title		= "Setup Menu",
			icon		= "msd/macnco.png",
			width		= 960,
			height		= 700,
			onewindow	= true,
			init		= function( icon, window )
				window:Close()
				icon.Window = MSD.OpenMenuManager(g_ContextMenu)
			end
		} )
	end


	MsgC( Color(174, 0, 255), "[MSD] Initialization done\n" )
end

MSD.Load()
--PATH lua/openpermissions/sh.lua:
function OpenPermissions:CreatePermissionsRegistry()
	local registry = {}
	for _, enum in pairs(OpenPermissions.ACCESS_GROUP) do registry[enum] = {} end
	return registry
end

OpenPermissions.REGISTRY = {}
OpenPermissions.REGISTRY.NETWORKED = 0
OpenPermissions.REGISTRY.FLAT_FILE = 1
function OpenPermissions:SerializeRegistry(dataType)
	if (dataType == OpenPermissions.REGISTRY.NETWORKED) then

		if (file.Exists("openpermissions_v2.dat", "DATA")) then
			-- Lazy but still probably quicker
			local data = file.Read("openpermissions_v2.dat", "DATA")
			net.WriteUInt(#data, 32)
			net.WriteData(data, #data)
		else
			net.WriteUInt(0, 32)
		end

	elseif (dataType == OpenPermissions.REGISTRY.FLAT_FILE) then

		local f = file.Open("openpermissions_v2.dat", "wb", "DATA")

		-- Write file header
		f:Write("OPENPERMISSIONS")

		local ids = {}
		local id = 0
		local ids_pos = f:Tell()
		f:Seek(ids_pos + (32 / 8)) -- Allocate a UShort for seeker position of IDs

		-- Write permissions registry
		local access_group_count = 0
		local access_group_pos = f:Tell()
		f:Seek(access_group_pos + (32 / 8))
		for access_group, accessors in pairs(OpenPermissions.PermissionsRegistry) do
			f:WriteUShort(access_group)
			access_group_count = access_group_count + 1

			local accessors_count = 0
			local accessors_pos = f:Tell()
			f:Seek(accessors_pos + (32 / 8))
			for accessor, permissions in pairs(accessors) do
				if (isnumber(accessor)) then
					f:WriteBool(false)
					f:WriteULong(accessor)
				elseif (isstring(accessor)) then
					f:WriteBool(true)
					f:WriteUShort(#accessor)
					f:Write(accessor)
				else
					error("Invalid accessor key type! (" .. type(accessor) .. ")")
				end
				accessors_count = accessors_count + 1

				local permissions_count = 0
				local permissions_pos = f:Tell()
				f:Seek(permissions_pos + (32 / 8))
				for permission_id, access in pairs(permissions) do
					if (not ids[permission_id]) then
						id = id + 1
						ids[permission_id] = id
					end
					f:WriteUShort(ids[permission_id])
					f:WriteBool(access == OpenPermissions.CHECKBOX.INHERIT)
					f:WriteBool(access == OpenPermissions.CHECKBOX.TICKED)
					permissions_count = permissions_count + 1
				end
				local pos = f:Tell()
				f:Seek(permissions_pos)
				f:WriteULong(permissions_count)
				f:Seek(pos)
			end
			local pos = f:Tell()
			f:Seek(accessors_pos)
			f:WriteULong(accessors_count)
			f:Seek(pos)
		end
		local pos = f:Tell()
		f:Seek(access_group_pos)
		f:WriteULong(access_group_count)
		f:Seek(pos)

		-- Write IDs
		local count = 0
		local countPos = f:Tell()
		f:Seek(countPos + (32 / 8)) -- We can seek back and write the count here
		for str, id in pairs(ids) do
			f:WriteUShort(#str)
			f:Write(str)
			f:WriteUShort(id)
			count = count + 1
		end
		f:Seek(countPos)
		f:WriteULong(count)

		f:Seek(ids_pos)
		f:WriteULong(countPos)

		f:Close()

		file.Write("openpermissions_v2.dat", util.Compress(file.Read("openpermissions_v2.dat", "DATA")))

	end
end
function OpenPermissions:DeserializeRegistry(dataType, stream)
	if (dataType == OpenPermissions.REGISTRY.NETWORKED) then
		
		-- Lazy but still probably quicker
		local data_len = net.ReadUInt(32)
		if (data_len == 0) then return end

		local data = net.ReadData(data_len)

		file.Write("openpermissions_networked.dat", data)
		OpenPermissions:DeserializeRegistry(OpenPermissions.REGISTRY.FLAT_FILE, "openpermissions_networked.dat")
		file.Delete("openpermissions_networked.dat")

	elseif (dataType == OpenPermissions.REGISTRY.FLAT_FILE) then
		
		local data = file.Read(stream or "openpermissions_v2.dat", "DATA")
		file.Write("openpermissions_stream.dat", util.Decompress(data))
		local f = file.Open("openpermissions_stream.dat", "rb", "DATA")

		assert(f:Read(#("OPENPERMISSIONS")) == "OPENPERMISSIONS", "Error! OpenPermissions data corrupted!")

		OpenPermissions.IDs = { Int = {}, Str = {} }
		OpenPermissions.PermissionsRegistry = OpenPermissions:CreatePermissionsRegistry()

		local ids = {}

		local pointer = f:ReadULong()
		local pos = f:Tell()
		f:Seek(pointer)

		-- Read permission IDs
		for i = 1, f:ReadULong() do
			local permission_str = f:Read(f:ReadUShort())
			local permission_id = f:ReadUShort()
			ids[permission_id] = permission_str
		end
		
		f:Seek(pos)

		-- Read permission registry
		for i = 1, f:ReadULong() do
			local access_group = f:ReadUShort()
			OpenPermissions.PermissionsRegistry[access_group] = {}
			
			for j = 1, f:ReadULong() do
				local accessor = f:ReadBool() and f:Read(f:ReadUShort()) or f:ReadULong()
				OpenPermissions.PermissionsRegistry[access_group][accessor] = {}

				for k = 1, f:ReadULong() do
					OpenPermissions.PermissionsRegistry[access_group][accessor][ids[f:ReadUShort()]] = f:ReadBool() and OpenPermissions.CHECKBOX.INHERIT or (f:ReadBool() and OpenPermissions.CHECKBOX.TICKED or OpenPermissions.CHECKBOX.CROSSED)
				end
			end
		end

		f:Close()
		file.Delete("openpermissions_stream.dat")

		return OpenPermissions.PermissionsRegistry

	end
end

function OpenPermissions:SerializeTable(tbl)
	return OpenPermissions.pon.encode(tbl)
end

function OpenPermissions:DeserializeTable(tbl)
	return OpenPermissions.pon.decode(tbl)
end

local NetworkedTblCache = {}
function OpenPermissions:ClearNetworkCache(tbl)
	NetworkedTblCache[tostring(tbl)] = nil
end
function OpenPermissions:StartNetworkTable(tbl, cache, clear_cache)
	if (tbl == OpenPermissions.PermissionsRegistry) then
		return OpenPermissions:SerializeRegistry(OpenPermissions.REGISTRY.NETWORKED)
	end

	local tbl_enc
	if (cache and not clear_cache and NetworkedTblCache[tostring(tbl)] ~= nil) then
		tbl_enc = NetworkedTblCache[tostring(tbl)]
	else
		tbl_enc = util.Compress(OpenPermissions:SerializeTable(tbl))
		if (cache) then
			NetworkedTblCache[tostring(tbl)] = tbl_enc
		end
	end
	net.WriteUInt(#tbl_enc, 32)
	net.WriteData(tbl_enc, #tbl_enc)
end
function OpenPermissions:ReceiveNetworkTable()
	local tbl_enc_len = net.ReadUInt(32)
	local tbl_dec = OpenPermissions:DeserializeTable(util.Decompress(net.ReadData(tbl_enc_len)))
	return tbl_dec
end

--## SteamIDs ##--

function OpenPermissions:SteamID64ToAccountID(steamid64)
	return OpenPermissions:SteamIDToAccountID(util.SteamIDFrom64(steamid64))
end

function OpenPermissions:SteamIDToAccountID(steamid)
	local acc32 = tonumber(steamid:sub(11))
	return (acc32 * 2) + tonumber(steamid:sub(9,9))
end

function OpenPermissions:AccountIDToSteamID(account_id)
	local sid32 = tonumber(account_id) / 2
	if (sid32 % 1 > 0) then
		return "STEAM_0:1:" .. math.floor(sid32)
	else
		return "STEAM_0:0:" .. sid32
	end
end

function OpenPermissions:AccountIDToSteamID64(account_id)
	return util.SteamIDTo64(OpenPermissions:AccountIDToSteamID(account_id))
end

--## Usergroup Management ##--

function OpenPermissions:IsUserGroup(ply, ...)
	local vararg = {...}
	if (#vararg == 1) then
		return ply:IsUserGroup(vararg[1]) or (not ply:IsBot() and hook.Run("OpenPermissions:IsUserGroup", ply, vararg[1]) == true) or false
	else
		for _,ug in ipairs(vararg) do
			if (ply:IsUserGroup(ug) or (not ply:IsBot() and hook.Run("OpenPermissions:IsUserGroup", ply, ug) == true)) then
				return true
			end
		end
		return false
	end
end

function OpenPermissions:IsUsergroups(ply, usergroups)
	local ply_usergroups = OpenPermissions:GetUserGroups(ply)
	for _,usergroup in ipairs(usergroups) do
		if (ply_usergroups[usergroup]) then
			return true
		end
	end
	return false
end

function OpenPermissions:GetUserGroups(ply)
	local usergroups_tbl = {[ply:GetUserGroup()] = true}
	if (not ply:IsBot()) then
		hook.Run("OpenPermissions:GetUserGroups", ply, usergroups_tbl)
	end
	return usergroups_tbl
end

--## Internal Operators Indexing ##--
OpenPermissions.IndexedOperators = {}
for _,_s in ipairs(OpenPermissions.Operators.SteamIDs) do
	local s = string.Trim(_s)
	if (s:find("^STEAM_%d:%d:%d+$")) then
		OpenPermissions.IndexedOperators[OpenPermissions:SteamIDToAccountID(s)] = true
	elseif (s:find("^7656119%d+$")) then
		OpenPermissions.IndexedOperators[OpenPermissions:SteamID64ToAccountID(s)] = true
	else
		OpenPermissions:Print("Invalid SteamID in config file; not a SteamID/SteamID64: \"" .. _s .. "\"", "[ERROR]", OpenPermissions.COLOR_RED)
	end
end

function OpenPermissions:IsOperator(ply)
	if (ply:IsBot()) then return false end
	if (OpenPermissions.IndexedOperators[ply:AccountID()]) then
		return true
	end
	for _,u in ipairs(OpenPermissions.Operators.Usergroups) do
		if (OpenPermissions:IsUserGroup(ply, u)) then
			return true
		end
	end
	if (hook.Run("OpenPermissions:IsOperator", ply) == true) then
		return true
	end
	return false
end

--## HasPermission, GetPermission ##--

function OpenPermissions:GetPermission(ply, permission_id, is_operator)
	if (type(ply) ~= "Player" or ply:AccountID() == nil) then
		OpenPermissions:Print("Tried to do a permission check on a non-player or a player without an assigned account ID?", "[ERROR]", OpenPermissions.COLOR_RED)
		debug.Trace()
		return false
	end
	if (ply:IsBot()) then return false end
	if (is_operator == true or (is_operator ~= false and OpenPermissions:IsOperator(ply))) then return true end
	
	local has_permission = OpenPermissions.CHECKBOX.INHERIT

	if (type(permission_id) == "table") then
		for _,v in ipairs(permission_id) do
			local r = OpenPermissions:GetPermission(ply, v)
			if (r ~= OpenPermissions.CHECKBOX.INHERIT) then
				return r
			end
		end
		return OpenPermissions.CHECKBOX.INHERIT
	end

	for usergroup in pairs(OpenPermissions:GetUserGroups(ply)) do
		local ply_usergroup_registry = OpenPermissions.PermissionsRegistry[OpenPermissions.ACCESS_GROUP.USERGROUP][usergroup]
		if (ply_usergroup_registry) then
			if (ply_usergroup_registry[permission_id] == OpenPermissions.CHECKBOX.TICKED or ply_usergroup_registry[permission_id] == true) then
				has_permission = OpenPermissions.CHECKBOX.TICKED
			elseif (ply_usergroup_registry[permission_id] == OpenPermissions.CHECKBOX.CROSSED) then
				return OpenPermissions.CHECKBOX.CROSSED
			end
		end
	end

	local ply_steamid_registry = OpenPermissions.PermissionsRegistry[OpenPermissions.ACCESS_GROUP.STEAMID][ply:AccountID()]
	if (ply_steamid_registry) then
		if (ply_steamid_registry[permission_id] == OpenPermissions.CHECKBOX.TICKED or ply_steamid_registry[permission_id] == true) then
			has_permission = OpenPermissions.CHECKBOX.TICKED
		elseif (ply_steamid_registry[permission_id] == OpenPermissions.CHECKBOX.CROSSED) then
			return OpenPermissions.CHECKBOX.CROSSED
		end
	end

	if (ply:Team()) then
		local ply_team_registry = OpenPermissions.PermissionsRegistry[OpenPermissions.ACCESS_GROUP.TEAM][OpenPermissions:GetTeamIdentifier(ply:Team())]
		if (ply_team_registry) then
			if (ply_team_registry[permission_id] == OpenPermissions.CHECKBOX.TICKED or ply_team_registry[permission_id] == true) then
				has_permission = OpenPermissions.CHECKBOX.TICKED
			elseif (ply_team_registry[permission_id] == OpenPermissions.CHECKBOX.CROSSED) then
				return OpenPermissions.CHECKBOX.CROSSED
			end
		end

		if (OpenPermissions.IsDarkRP and RPExtraTeams[ply:Team()]) then
			local ply_category_name = RPExtraTeams[ply:Team()].category
			local ply_category
			for i,category in ipairs(DarkRP.getCategories().jobs) do
				if (category.name == ply_category_name) then
					ply_category = i
					break
				end
			end
			if (ply_category) then
				local ply_category_registry = OpenPermissions.PermissionsRegistry[OpenPermissions.ACCESS_GROUP.DARKRP_CATEGORY][OpenPermissions:DarkRP_GetCategoryIdentifier(ply_category)]
				if (ply_category_registry) then
					if (ply_category_registry[permission_id] == OpenPermissions.CHECKBOX.TICKED or ply_category_registry[permission_id] == true) then
						has_permission = OpenPermissions.CHECKBOX.TICKED
					elseif (ply_category_registry[permission_id] == OpenPermissions.CHECKBOX.CROSSED) then
						return OpenPermissions.CHECKBOX.CROSSED
					end
				end
			end
		end
	end

	for name, func in pairs(OpenPermissions.LuaFunctions) do
		local lua_function_registry = OpenPermissions.PermissionsRegistry[OpenPermissions.ACCESS_GROUP.LUA_FUNCTION][name]
		if (lua_function_registry) then
			if (func(ply, permission_id) == true) then
				if (lua_function_registry[permission_id] == OpenPermissions.CHECKBOX.TICKED or lua_function_registry[permission_id] == true) then
					has_permission = OpenPermissions.CHECKBOX.TICKED
				elseif (lua_function_registry[permission_id] == OpenPermissions.CHECKBOX.CROSSED) then
					return OpenPermissions.CHECKBOX.CROSSED
				end
			end
		end
	end

	if (has_permission == OpenPermissions.CHECKBOX.INHERIT and OpenPermissions.DefaultPermissions[permission_id] == OpenPermissions.CHECKBOX.TICKED) then
		has_permission = OpenPermissions.CHECKBOX.TICKED
	end

	return has_permission
end

function OpenPermissions:HasPermission(ply, permission_id, is_operator)
	if (type(ply) ~= "Player" or ply:AccountID() == nil) then
		OpenPermissions:Print("Tried to do a permission check on a non-player or a player without an assigned account ID?", "[ERROR]", OpenPermissions.COLOR_RED)
		debug.Trace()
		return false
	end
	if (ply:IsBot()) then return false end
	if (is_operator == true or (is_operator ~= false and OpenPermissions:IsOperator(ply))) then return true end

	local has_permission = false

	if (type(permission_id) == "table") then
		for _,v in ipairs(permission_id) do
			if (OpenPermissions:HasPermission(ply, v)) then
				return true
			end
		end
		return false
	end

	for usergroup in pairs(OpenPermissions:GetUserGroups(ply)) do
		local ply_usergroup_registry = OpenPermissions.PermissionsRegistry[OpenPermissions.ACCESS_GROUP.USERGROUP][usergroup]
		if (ply_usergroup_registry) then
			if (ply_usergroup_registry[permission_id] == OpenPermissions.CHECKBOX.TICKED or ply_usergroup_registry[permission_id] == true) then
				has_permission = true
			elseif (ply_usergroup_registry[permission_id] == OpenPermissions.CHECKBOX.CROSSED) then
				return false
			end
		end
	end

	local ply_steamid_registry = OpenPermissions.PermissionsRegistry[OpenPermissions.ACCESS_GROUP.STEAMID][ply:AccountID()]
	if (ply_steamid_registry) then
		if (ply_steamid_registry[permission_id] == OpenPermissions.CHECKBOX.TICKED or ply_steamid_registry[permission_id] == true) then
			has_permission = true
		elseif (ply_steamid_registry[permission_id] == OpenPermissions.CHECKBOX.CROSSED) then
			return false
		end
	end

	if (ply:Team()) then
		local ply_team_registry = OpenPermissions.PermissionsRegistry[OpenPermissions.ACCESS_GROUP.TEAM][OpenPermissions:GetTeamIdentifier(ply:Team())]
		if (ply_team_registry) then
			if (ply_team_registry[permission_id] == OpenPermissions.CHECKBOX.TICKED or ply_team_registry[permission_id] == true) then
				has_permission = true
			elseif (ply_team_registry[permission_id] == OpenPermissions.CHECKBOX.CROSSED) then
				return false
			end
		end

		if (OpenPermissions.IsDarkRP and RPExtraTeams[ply:Team()]) then
			local ply_category_name = RPExtraTeams[ply:Team()].category
			local ply_category
			for i,category in ipairs(DarkRP.getCategories().jobs) do
				if (category.name == ply_category_name) then
					ply_category = i
					break
				end
			end
			if (ply_category) then
				local ply_category_registry = OpenPermissions.PermissionsRegistry[OpenPermissions.ACCESS_GROUP.DARKRP_CATEGORY][OpenPermissions:DarkRP_GetCategoryIdentifier(ply_category)]
				if (ply_category_registry) then
					if (ply_category_registry[permission_id] == OpenPermissions.CHECKBOX.TICKED or ply_category_registry[permission_id] == true) then
						has_permission = true
					elseif (ply_category_registry[permission_id] == OpenPermissions.CHECKBOX.CROSSED) then
						return false
					end
				end
			end
		end
	end

	for name, func in pairs(OpenPermissions.LuaFunctions) do
		local lua_function_registry = OpenPermissions.PermissionsRegistry[OpenPermissions.ACCESS_GROUP.LUA_FUNCTION][name]
		if (lua_function_registry) then
			if (func(ply, permission_id) == true) then
				if (lua_function_registry[permission_id] == OpenPermissions.CHECKBOX.TICKED or lua_function_registry[permission_id] == true) then
					has_permission = true
				elseif (lua_function_registry[permission_id] == OpenPermissions.CHECKBOX.CROSSED) then
					return false
				end
			end
		end
	end

	if (has_permission == false and OpenPermissions.DefaultPermissions[permission_id] == OpenPermissions.CHECKBOX.TICKED) then
		has_permission = true
	end

	return has_permission
end

--## Teams ##--

local team_identifier_index = {}
function OpenPermissions:GetTeamIdentifier(team_index)
	local team_identifier = hook.Run("OpenPermissions:GetTeamIdentifier", team_index)
	if (team_identifier) then
		team_identifier_index[team_identifier] = team_index
		return team_identifier
	end
	if (OpenPermissions.IsDarkRP and RPExtraTeams and team_index ~= 0) then
		if (RPExtraTeams[team_index]) then
			local team_identifier = RPExtraTeams[team_index].OPENPERMISSIONS_IDENTIFIER or RPExtraTeams[team_index].GAS_IDENTIFIER or RPExtraTeams[team_index].command
			team_identifier_index[team_identifier] = team_index
			return team_identifier
		end
	else
		local team_identifier = team.GetName(team_index)
		team_identifier_index[team_identifier] = team_index
		return team_identifier
	end
end

function OpenPermissions:GetTeamFromIdentifier(team_identifier)
	if (team_identifier == "Joining/Connecting") then return TEAM_CONNECTING end
	if (team_identifier == "Unassigned") then return TEAM_UNASSIGNED end
	if (team_identifier == "Spectator") then return TEAM_SPECTATOR end
	if (team_identifier_index[team_identifier]) then return team_identifier_index[team_identifier] end

	local team_index = hook.Run("OpenPermissions:GetTeamFromIdentifier", team_identifier)
	if (team_index) then
		team_identifier_index[team_identifier] = team_index
		return team_index
	end
	if (OpenPermissions.IsDarkRP and RPExtraTeams) then
		for _,job in ipairs(RPExtraTeams) do
			if (job.OPENPERMISSIONS_IDENTIFIER == team_identifier or job.command == team_identifier) then
				team_identifier_index[team_identifier] = job.team
				return job.team
			end
		end
	else
		for i,t in ipairs(team.GetAllTeams()) do
			if (t.Name == team_identifier) then
				team_identifier_index[team_identifier] = i
				return i
			end
		end
	end
end

local category_identifier_index = {}
function OpenPermissions:DarkRP_GetCategoryIdentifier(category_index)
	local category_identifier = hook.Run("OpenPermissions:DarkRP_GetCategoryIdentifier", category_index)
	if (category_identifier) then
		category_identifier_index[category_identifier] = category_index
		return category_identifier
	end

	local category = DarkRP.getCategories().jobs[category_index]
	local category_identifier = category.OPENPERMISSIONS_IDENTIFIER or category.GAS_IDENTIFIER or category.name

	category_identifier_index[category_identifier] = category_index
	return category_identifier
end

function OpenPermissions:DarkRP_GetCategoryFromIdentifier(category_identifier)
	if (category_identifier_index[category_identifier]) then return category_identifier_index[category_identifier] end

	local category_index = hook.Run("OpenPermissions:DarkRP_GetCategoryFromIdentifier", category_identifier)
	if (category_index) then
		category_identifier_index[category_index] = category_identifier
		return category_index
	end

	for i,category in pairs(DarkRP.getCategories().jobs) do
		local category_id = category.OPENPERMISSIONS_IDENTIFIER or category.GAS_IDENTIFIER or category.name
		if (category_id == category_identifier) then
			category_identifier_index[category_id] = i
			return i
		end
	end
end

--## Misc ##--

function OpenPermissions:table_IsEmpty(tbl)
	return next(tbl) == nil
end

function OpenPermissions:table_IsIdentical(tbl1, tbl2)
	local function r(tbl1, tbl2)
		for key, val in pairs(tbl1) do
			if (tbl2[key] == nil) then
				return false
			elseif (type(val) == "table") then
				if (r(val, tbl2[key]) == false) then
					return false
				end
			elseif (tbl2[key] ~= val) then
				return false
			end
		end
		for key, val in pairs(tbl2) do
			if (tbl1[key] == nil) then
				return false
			elseif (type(val) == "table") then
				if (r(val, tbl1[key]) == false) then
					return false
				end
			elseif (tbl1[key] ~= val) then
				return false
			end
		end
	end
	return r(tbl1, tbl2) ~= false
end

--## Enums ##--

OpenPermissions.ADDON = 0
OpenPermissions.PERMISSION = 1
OpenPermissions.CATEGORY = 2
OpenPermissions.SUBPERMISSION = 3

OpenPermissions.PermissionsRegistry = OpenPermissions:CreatePermissionsRegistry()
OpenPermissions.DefaultPermissions = {}

--## Networking ##--

if (SERVER) then
	-- Convert old file format to new
	if (file.Exists("openpermissions.dat", "DATA") and not file.Exists("openpermissions_v2.dat", "DATA")) then
		local read_file = file.Read("openpermissions.dat", "DATA")
		if (not read_file) then
			OpenPermissions:Print("Failed to read saved permissions data", "[ERROR]", OpenPermissions.COLOR_RED)
		else
			read_file = util.Decompress(read_file)
			if (not read_file) then
				OpenPermissions:Print("Failed to decompress saved permissions data", "[ERROR]", OpenPermissions.COLOR_RED)
			else
				local no_errors, deserialized = pcall(OpenPermissions.pon.decode, read_file)
				if (not no_errors) then
					OpenPermissions:Print("Failed to deserialize decompressed saved permissions data", "[ERROR]", OpenPermissions.COLOR_RED)
				else
					--OpenPermissions:Print("Saved permissions data successfully loaded", "[INFO]", OpenPermissions.COLOR_GREEN)

					-- Restructure
					for access_group_str, permissions in pairs(deserialized) do
						local access_group, accessor = access_group_str:match("(%d) (.+)")
						OpenPermissions.PermissionsRegistry[access_group] = OpenPermissions.PermissionsRegistry[access_group] or {}
						OpenPermissions.PermissionsRegistry[access_group][accessor] = {}
						for permission_id_str, permission in pairs(permissions) do
							OpenPermissions.PermissionsRegistry[access_group][accessor][permission_id_str] = permission
						end
					end

					-- Save new data
					OpenPermissions:SerializeRegistry(OpenPermissions.REGISTRY.FLAT_FILE)

					file.Rename("openpermissions.dat", "openpermissions_v1.dat")
				end
			end
		end
	end

	if (file.Exists("openpermissions_v2.dat", "DATA")) then
		local no_errors = xpcall(OpenPermissions.DeserializeRegistry, function(err)
			OpenPermissions:Print("Failed to deserialize decompressed saved permissions data", "[ERROR]", OpenPermissions.COLOR_RED)

			print(err)
			debug.Trace()
		end, OpenPermissions, OpenPermissions.REGISTRY.FLAT_FILE)

		if (no_errors) then
			OpenPermissions:Print("Saved permissions data successfully loaded", "[INFO]", OpenPermissions.COLOR_GREEN)
		end
	end
	net.Receive("OpenPermissions.SavePermissions", function(_, ply)
		if (not OpenPermissions:IsOperator(ply)) then return end
		OpenPermissions:DeserializeRegistry(OpenPermissions.REGISTRY.NETWORKED)
		OpenPermissions:SerializeRegistry(OpenPermissions.REGISTRY.FLAT_FILE)

		net.Start("OpenPermissions.PermissionsRegistry")
			OpenPermissions:StartNetworkTable(OpenPermissions.PermissionsRegistry, true, true)
			OpenPermissions:StartNetworkTable(OpenPermissions.DefaultPermissions, true)
		net.SendOmit(ply)
	end)
	net.Receive("OpenPermissions.PermissionsRegistry", function(_, ply)
		net.Start("OpenPermissions.PermissionsRegistry")
			OpenPermissions:StartNetworkTable(OpenPermissions.PermissionsRegistry, true)
			OpenPermissions:StartNetworkTable(OpenPermissions.DefaultPermissions, true)
		net.Send(ply)
	end)
else
	net.Receive("OpenPermissions.PermissionsRegistry", function()
		OpenPermissions:DeserializeRegistry(OpenPermissions.REGISTRY.NETWORKED)
		OpenPermissions.DefaultPermissions = OpenPermissions:ReceiveNetworkTable()
		OpenPermissions:Print("Received permissions registry", "[INFO]")
	end)
	if (OpenPermissions_PermissionsRegistry_InitPostEntity) then
		net.Start("OpenPermissions.PermissionsRegistry")
		net.SendToServer()
	else
		hook.Add("InitPostEntity", "OpenPermissions.PermissionsRegistry", function()
			OpenPermissions_PermissionsRegistry_InitPostEntity = true
			net.Start("OpenPermissions.PermissionsRegistry")
			net.SendToServer()
		end)
	end
end
--PATH addons/sam-157/lua/sam/libs/message_pack/sh_messagepack.lua:
if SAM_LOADED then return end
--
-- lua-MessagePack : <https://fperrad.frama.io/lua-MessagePack/>
--
local SIZEOF_NUMBER = string.pack and #string.pack('n', 0.0) or 8
local maxinteger
local mininteger
local assert = assert
local error = error
local pairs = pairs
local pcall = pcall
local setmetatable = setmetatable
local tostring = tostring
local char = string.char
local format = string.format
local floor = math.floor
local tointeger = floor
local frexp = math.frexp
local ldexp = math.ldexp
local huge = math.huge
local tconcat = table.concat
local type = sam.type
local isnumber = sam.isnumber
local _ENV = nil
local m = {}

--[[ debug only
local function hexadump (s)
	return (s:gsub('.', function (c) return format('%02X ', c:byte()) end))
end
m.hexadump = hexadump
--]]
local function argerror(caller, narg, extramsg)
	error("bad argument #" .. tostring(narg) .. " to " .. caller .. " (" .. extramsg .. ")")
end

local function typeerror(caller, narg, arg, tname)
	argerror(caller, narg, tname .. " expected, got " .. type(arg))
end

local function checktype(caller, narg, arg, tname)
	if type(arg) ~= tname then
		typeerror(caller, narg, arg, tname)
	end
end

local packers = setmetatable({}, {
	__index = function(t, k)
		if k == 1 then return end -- allows ipairs
		error("pack '" .. k .. "' is unimplemented")
	end
})

m.packers = packers

packers["nil"] = function(buffer)
	buffer[#buffer + 1] = char(0xC0) -- nil
end

packers["boolean"] = function(buffer, bool)
	if bool then
		buffer[#buffer + 1] = char(0xC3) -- true
	else
		buffer[#buffer + 1] = char(0xC2) -- false
	end
end

packers["string_compat"] = function(buffer, str)
	local n = #str

	if n <= 0x1F then
		buffer[#buffer + 1] = char(0xA0 + n) -- fixstr
	elseif n <= 0xFFFF then
		buffer[#buffer + 1] = char(0xDA, floor(n / 0x100), n % 0x100) -- str16
	elseif n <= 4294967295.0 then
		buffer[#buffer + 1] = char(0xDB, floor(n / 0x1000000), floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- str32
	else
		error"overflow in pack 'string_compat'"
	end

	buffer[#buffer + 1] = str
end

packers["_string"] = function(buffer, str)
	local n = #str

	if n <= 0x1F then
		buffer[#buffer + 1] = char(0xA0 + n) -- fixstr
	elseif n <= 0xFF then
		buffer[#buffer + 1] = char(0xD9, n) -- str8
	elseif n <= 0xFFFF then
		buffer[#buffer + 1] = char(0xDA, floor(n / 0x100), n % 0x100) -- str16
	elseif n <= 4294967295.0 then
		buffer[#buffer + 1] = char(0xDB, floor(n / 0x1000000), floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- str32
	else
		error("overflow in pack 'string'")
	end

	buffer[#buffer + 1] = str
end

packers["binary"] = function(buffer, str)
	local n = #str

	if n <= 0xFF then
		buffer[#buffer + 1] = char(0xC4, n) -- bin8
	elseif n <= 0xFFFF then
		buffer[#buffer + 1] = char(0xC5, floor(n / 0x100), n % 0x100) -- bin16
	elseif n <= 4294967295.0 then
		buffer[#buffer + 1] = char(0xC6, floor(n / 0x1000000), floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- bin32
	else
		error("overflow in pack 'binary'")
	end

	buffer[#buffer + 1] = str
end

local set_string = function(str)
	if str == "string_compat" then
		packers["string"] = packers["string_compat"]
	elseif str == "string" then
		packers["string"] = packers["_string"]
	elseif str == "binary" then
		packers["string"] = packers["binary"]
	else
		argerror("set_string", 1, "invalid option '" .. str .. "'")
	end
end

m.set_string = set_string

packers["map"] = function(buffer, tbl, n)
	if n <= 0x0F then
		buffer[#buffer + 1] = char(0x80 + n) -- fixmap
	elseif n <= 0xFFFF then
		buffer[#buffer + 1] = char(0xDE, floor(n / 0x100), n % 0x100) -- map16
	elseif n <= 4294967295.0 then
		buffer[#buffer + 1] = char(0xDF, floor(n / 0x1000000), floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- map32
	else
		error("overflow in pack 'map'")
	end

	for k, v in pairs(tbl) do
		packers[type(k)](buffer, k)
		packers[type(v)](buffer, v)
	end
end

packers["array"] = function(buffer, tbl, n)
	if n <= 0x0F then
		buffer[#buffer + 1] = char(0x90 + n) -- fixarray
	elseif n <= 0xFFFF then
		buffer[#buffer + 1] = char(0xDC, floor(n / 0x100), n % 0x100) -- array16
	elseif n <= 4294967295.0 then
		buffer[#buffer + 1] = char(0xDD, floor(n / 0x1000000), floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- array32
	else
		error("overflow in pack 'array'")
	end

	for i = 1, n do
		local v = tbl[i]
		packers[type(v)](buffer, v)
	end
end

local set_array = function(array)
	if array == "without_hole" then
		packers["_table"] = function(buffer, tbl)
			local is_map, n, max = false, 0, 0

			for k in pairs(tbl) do
				if isnumber(k) and k > 0 then
					if k > max then
						max = k
					end
				else
					is_map = true
				end

				n = n + 1
			end

			-- there are holes
			if max ~= n then
				is_map = true
			end

			if is_map then
				packers["map"](buffer, tbl, n)
			else
				packers["array"](buffer, tbl, n)
			end
		end
	elseif array == "with_hole" then
		packers["_table"] = function(buffer, tbl)
			local is_map, n, max = false, 0, 0

			for k in pairs(tbl) do
				if isnumber(k) and k > 0 then
					if k > max then
						max = k
					end
				else
					is_map = true
				end

				n = n + 1
			end

			if is_map then
				packers["map"](buffer, tbl, n)
			else
				packers["array"](buffer, tbl, max)
			end
		end
	elseif array == "always_as_map" then
		packers["_table"] = function(buffer, tbl)
			local n = 0

			for k in pairs(tbl) do
				n = n + 1
			end

			packers["map"](buffer, tbl, n)
		end
	else
		argerror("set_array", 1, "invalid option '" .. array .. "'")
	end
end

m.set_array = set_array

packers["table"] = function(buffer, tbl)
	packers["_table"](buffer, tbl)
end

packers["unsigned"] = function(buffer, n)
	if n >= 0 then
		if n <= 0x7F then
			buffer[#buffer + 1] = char(n) -- fixnum_pos
		elseif n <= 0xFF then
			buffer[#buffer + 1] = char(0xCC, n) -- uint8
		elseif n <= 0xFFFF then
			buffer[#buffer + 1] = char(0xCD, floor(n / 0x100), n % 0x100) -- uint16
		elseif n <= 4294967295.0 then
			buffer[#buffer + 1] = char(0xCE, floor(n / 0x1000000), floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- uint32
		else
			buffer[#buffer + 1] = char(0xCF, 0, floor(n / 0x1000000000000) % 0x100, floor(n / 0x10000000000) % 0x100, floor(n / 0x100000000) % 0x100, floor(n / 0x1000000) % 0x100, floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- uint64 -- only 53 bits from double
		end
	else
		if n >= -0x20 then
			buffer[#buffer + 1] = char(0x100 + n) -- fixnum_neg
		elseif n >= -0x80 then
			buffer[#buffer + 1] = char(0xD0, 0x100 + n) -- int8
		elseif n >= -0x8000 then
			n = 0x10000 + n
			buffer[#buffer + 1] = char(0xD1, floor(n / 0x100), n % 0x100) -- int16
		elseif n >= -0x80000000 then
			n = 4294967296.0 + n
			buffer[#buffer + 1] = char(0xD2, floor(n / 0x1000000), floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- int32
		else
			buffer[#buffer + 1] = char(0xD3, 0xFF, floor(n / 0x1000000000000) % 0x100, floor(n / 0x10000000000) % 0x100, floor(n / 0x100000000) % 0x100, floor(n / 0x1000000) % 0x100, floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- int64 -- only 53 bits from double
		end
	end
end

packers["signed"] = function(buffer, n)
	if n >= 0 then
		if n <= 0x7F then
			buffer[#buffer + 1] = char(n) -- fixnum_pos
		elseif n <= 0x7FFF then
			buffer[#buffer + 1] = char(0xD1, floor(n / 0x100), n % 0x100) -- int16
		elseif n <= 0x7FFFFFFF then
			buffer[#buffer + 1] = char(0xD2, floor(n / 0x1000000), floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- int32
		else
			buffer[#buffer + 1] = char(0xD3, 0, floor(n / 0x1000000000000) % 0x100, floor(n / 0x10000000000) % 0x100, floor(n / 0x100000000) % 0x100, floor(n / 0x1000000) % 0x100, floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- int64 -- only 53 bits from double
		end
	else
		if n >= -0x20 then
			buffer[#buffer + 1] = char(0xE0 + 0x20 + n) -- fixnum_neg
		elseif n >= -0x80 then
			buffer[#buffer + 1] = char(0xD0, 0x100 + n) -- int8
		elseif n >= -0x8000 then
			n = 0x10000 + n
			buffer[#buffer + 1] = char(0xD1, floor(n / 0x100), n % 0x100) -- int16
		elseif n >= -0x80000000 then
			n = 4294967296.0 + n
			buffer[#buffer + 1] = char(0xD2, floor(n / 0x1000000), floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- int32
		else
			buffer[#buffer + 1] = char(0xD3, 0xFF, floor(n / 0x1000000000000) % 0x100, floor(n / 0x10000000000) % 0x100, floor(n / 0x100000000) % 0x100, floor(n / 0x1000000) % 0x100, floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100) -- int64 -- only 53 bits from double
		end
	end
end

local set_integer = function(integer)
	if integer == "unsigned" then
		packers["integer"] = packers["unsigned"]
	elseif integer == "signed" then
		packers["integer"] = packers["signed"]
	else
		argerror("set_integer", 1, "invalid option '" .. integer .. "'")
	end
end

m.set_integer = set_integer

packers["float"] = function(buffer, n)
	local sign = 0

	if n < 0.0 then
		sign = 0x80
		n = -n
	end

	local mant, expo = frexp(n)

	if mant ~= mant then
		buffer[#buffer + 1] = char(0xCA, 0xFF, 0x88, 0x00, 0x00) -- nan
	elseif mant == huge or expo > 0x80 then
		if sign == 0 then
			buffer[#buffer + 1] = char(0xCA, 0x7F, 0x80, 0x00, 0x00) -- inf
		else
			buffer[#buffer + 1] = char(0xCA, 0xFF, 0x80, 0x00, 0x00) -- -inf
		end
	elseif (mant == 0.0 and expo == 0) or expo < -0x7E then
		buffer[#buffer + 1] = char(0xCA, sign, 0x00, 0x00, 0x00) -- zero
	else
		expo = expo + 0x7E
		mant = floor((mant * 2.0 - 1.0) * ldexp(0.5, 24))
		buffer[#buffer + 1] = char(0xCA, sign + floor(expo / 0x2), (expo % 0x2) * 0x80 + floor(mant / 0x10000), floor(mant / 0x100) % 0x100, mant % 0x100)
	end
end

packers["double"] = function(buffer, n)
	local sign = 0

	if n < 0.0 then
		sign = 0x80
		n = -n
	end

	local mant, expo = frexp(n)

	if mant ~= mant then
		buffer[#buffer + 1] = char(0xCB, 0xFF, 0xF8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00) -- nan
	elseif mant == huge or expo > 0x400 then
		if sign == 0 then
			buffer[#buffer + 1] = char(0xCB, 0x7F, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00) -- inf
		else
			buffer[#buffer + 1] = char(0xCB, 0xFF, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00) -- -inf
		end
	elseif (mant == 0.0 and expo == 0) or expo < -0x3FE then
		buffer[#buffer + 1] = char(0xCB, sign, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00) -- zero
	else
		expo = expo + 0x3FE
		mant = floor((mant * 2.0 - 1.0) * ldexp(0.5, 53))
		buffer[#buffer + 1] = char(0xCB, sign + floor(expo / 0x10), (expo % 0x10) * 0x10 + floor(mant / 0x1000000000000), floor(mant / 0x10000000000) % 0x100, floor(mant / 0x100000000) % 0x100, floor(mant / 0x1000000) % 0x100, floor(mant / 0x10000) % 0x100, floor(mant / 0x100) % 0x100, mant % 0x100)
	end
end

local set_number = function(number)
	if number == "float" then
		packers["number"] = function(buffer, n)
			if floor(n) == n and n < maxinteger and n > mininteger then
				packers["integer"](buffer, n)
			else
				packers["float"](buffer, n)
			end
		end
	elseif number == "double" then
		packers["number"] = function(buffer, n)
			if floor(n) == n and n < maxinteger and n > mininteger then
				packers["integer"](buffer, n)
			else
				packers["double"](buffer, n)
			end
		end
	else
		argerror("set_number", 1, "invalid option '" .. number .. "'")
	end
end

m.set_number = set_number

for k = 0, 4 do
	local n = tointeger(2 ^ k)
	local fixext = 0xD4 + k

	packers["fixext" .. tostring(n)] = function(buffer, tag, data)
		assert(#data == n, "bad length for fixext" .. tostring(n))
		buffer[#buffer + 1] = char(fixext, tag < 0 and tag + 0x100 or tag)
		buffer[#buffer + 1] = data
	end
end

packers["ext"] = function(buffer, tag, data)
	local n = #data

	if n <= 0xFF then
		buffer[#buffer + 1] = char(0xC7, n, tag < 0 and tag + 0x100 or tag) -- ext8
	elseif n <= 0xFFFF then
		buffer[#buffer + 1] = char(0xC8, floor(n / 0x100), n % 0x100, tag < 0 and tag + 0x100 or tag) -- ext16
	elseif n <= 4294967295.0 then
		buffer[#buffer + 1] = char(0xC9, floor(n / 0x1000000), floor(n / 0x10000) % 0x100, floor(n / 0x100) % 0x100, n % 0x100, tag < 0 and tag + 0x100 or tag) -- ext&32
	else
		error("overflow in pack 'ext'")
	end

	buffer[#buffer + 1] = data
end

function m.pack(data)
	local buffer = {}
	packers[type(data)](buffer, data)

	return tconcat(buffer)
end

local unpackers -- forward declaration

local function unpack_cursor(c)
	local s, i, j = c.s, c.i, c.j

	if i > j then
		c:underflow(i)
		s, i, j = c.s, c.i, c.j
	end

	local val = s:byte(i)
	c.i = i + 1

	return unpackers[val](c, val)
end

m.unpack_cursor = unpack_cursor

local function unpack_str(c, n)
	local s, i, j = c.s, c.i, c.j
	local e = i + n - 1

	if e > j or n < 0 then
		c:underflow(e)
		s, i, j = c.s, c.i, c.j
		e = i + n - 1
	end

	c.i = i + n

	return s:sub(i, e)
end

local function unpack_array(c, n)
	local t = {}

	for i = 1, n do
		t[i] = unpack_cursor(c)
	end

	return t
end

local function unpack_map(c, n)
	local t = {}

	for i = 1, n do
		local k = unpack_cursor(c)
		local val = unpack_cursor(c)

		if k == nil or k ~= k then
			k = m.sentinel
		end

		if k ~= nil then
			t[k] = val
		end
	end

	return t
end

local function unpack_float(c)
	local s, i, j = c.s, c.i, c.j

	if i + 3 > j then
		c:underflow(i + 3)
		s, i, j = c.s, c.i, c.j
	end

	local b1, b2, b3, b4 = s:byte(i, i + 3)
	local sign = b1 > 0x7F
	local expo = (b1 % 0x80) * 0x2 + floor(b2 / 0x80)
	local mant = ((b2 % 0x80) * 0x100 + b3) * 0x100 + b4

	if sign then
		sign = -1
	else
		sign = 1
	end

	local n

	if mant == 0 and expo == 0 then
		n = sign * 0.0
	elseif expo == 0xFF then
		if mant == 0 then
			n = sign * huge
		else
			n = 0.0 / 0.0
		end
	else
		n = sign * ldexp(1.0 + mant / 0x800000, expo - 0x7F)
	end

	c.i = i + 4

	return n
end

local function unpack_double(c)
	local s, i, j = c.s, c.i, c.j

	if i + 7 > j then
		c:underflow(i + 7)
		s, i, j = c.s, c.i, c.j
	end

	local b1, b2, b3, b4, b5, b6, b7, b8 = s:byte(i, i + 7)
	local sign = b1 > 0x7F
	local expo = (b1 % 0x80) * 0x10 + floor(b2 / 0x10)
	local mant = ((((((b2 % 0x10) * 0x100 + b3) * 0x100 + b4) * 0x100 + b5) * 0x100 + b6) * 0x100 + b7) * 0x100 + b8

	if sign then
		sign = -1
	else
		sign = 1
	end

	local n

	if mant == 0 and expo == 0 then
		n = sign * 0.0
	elseif expo == 0x7FF then
		if mant == 0 then
			n = sign * huge
		else
			n = 0.0 / 0.0
		end
	else
		n = sign * ldexp(1.0 + mant / 4503599627370496.0, expo - 0x3FF)
	end

	c.i = i + 8

	return n
end

local function unpack_uint8(c)
	local s, i, j = c.s, c.i, c.j

	if i > j then
		c:underflow(i)
		s, i, j = c.s, c.i, c.j
	end

	local b1 = s:byte(i)
	c.i = i + 1

	return b1
end

local function unpack_uint16(c)
	local s, i, j = c.s, c.i, c.j

	if i + 1 > j then
		c:underflow(i + 1)
		s, i, j = c.s, c.i, c.j
	end

	local b1, b2 = s:byte(i, i + 1)
	c.i = i + 2

	return b1 * 0x100 + b2
end

local function unpack_uint32(c)
	local s, i, j = c.s, c.i, c.j

	if i + 3 > j then
		c:underflow(i + 3)
		s, i, j = c.s, c.i, c.j
	end

	local b1, b2, b3, b4 = s:byte(i, i + 3)
	c.i = i + 4

	return ((b1 * 0x100 + b2) * 0x100 + b3) * 0x100 + b4
end

local function unpack_uint64(c)
	local s, i, j = c.s, c.i, c.j

	if i + 7 > j then
		c:underflow(i + 7)
		s, i, j = c.s, c.i, c.j
	end

	local b1, b2, b3, b4, b5, b6, b7, b8 = s:byte(i, i + 7)
	c.i = i + 8

	return ((((((b1 * 0x100 + b2) * 0x100 + b3) * 0x100 + b4) * 0x100 + b5) * 0x100 + b6) * 0x100 + b7) * 0x100 + b8
end

local function unpack_int8(c)
	local s, i, j = c.s, c.i, c.j

	if i > j then
		c:underflow(i)
		s, i, j = c.s, c.i, c.j
	end

	local b1 = s:byte(i)
	c.i = i + 1

	if b1 < 0x80 then
		return b1
	else
		return b1 - 0x100
	end
end

local function unpack_int16(c)
	local s, i, j = c.s, c.i, c.j

	if i + 1 > j then
		c:underflow(i + 1)
		s, i, j = c.s, c.i, c.j
	end

	local b1, b2 = s:byte(i, i + 1)
	c.i = i + 2

	if b1 < 0x80 then
		return b1 * 0x100 + b2
	else
		return ((b1 - 0xFF) * 0x100 + (b2 - 0xFF)) - 1
	end
end

local function unpack_int32(c)
	local s, i, j = c.s, c.i, c.j

	if i + 3 > j then
		c:underflow(i + 3)
		s, i, j = c.s, c.i, c.j
	end

	local b1, b2, b3, b4 = s:byte(i, i + 3)
	c.i = i + 4

	if b1 < 0x80 then
		return ((b1 * 0x100 + b2) * 0x100 + b3) * 0x100 + b4
	else
		return ((((b1 - 0xFF) * 0x100 + (b2 - 0xFF)) * 0x100 + (b3 - 0xFF)) * 0x100 + (b4 - 0xFF)) - 1
	end
end

local function unpack_int64(c)
	local s, i, j = c.s, c.i, c.j

	if i + 7 > j then
		c:underflow(i + 7)
		s, i, j = c.s, c.i, c.j
	end

	local b1, b2, b3, b4, b5, b6, b7, b8 = s:byte(i, i + 7)
	c.i = i + 8

	if b1 < 0x80 then
		return ((((((b1 * 0x100 + b2) * 0x100 + b3) * 0x100 + b4) * 0x100 + b5) * 0x100 + b6) * 0x100 + b7) * 0x100 + b8
	else
		return ((((((((b1 - 0xFF) * 0x100 + (b2 - 0xFF)) * 0x100 + (b3 - 0xFF)) * 0x100 + (b4 - 0xFF)) * 0x100 + (b5 - 0xFF)) * 0x100 + (b6 - 0xFF)) * 0x100 + (b7 - 0xFF)) * 0x100 + (b8 - 0xFF)) - 1
	end
end

function m.build_ext(tag, data)
	return nil
end

local function unpack_ext(c, n, tag)
	local s, i, j = c.s, c.i, c.j
	local e = i + n - 1

	if e > j or n < 0 then
		c:underflow(e)
		s, i, j = c.s, c.i, c.j
		e = i + n - 1
	end

	c.i = i + n

	return m.build_ext(tag, s:sub(i, e))
end

local fn_1 = function(c, val) return val end
local fn_2 = function(c, val) return unpack_map(c, val % 0x10) end
local fn_3 = function(c, val) return unpack_array(c, val % 0x10) end
local fn_4 = function(c, val) return unpack_str(c, val % 0x20) end
local fn_5 = function(c, val) return val - 0x100 end

unpackers = setmetatable({
	[0xC0] = function() return nil end,
	[0xC2] = function() return false end,
	[0xC3] = function() return true end,
	[0xC4] = function(c) return unpack_str(c, unpack_uint8(c)) end, -- bin8
	[0xC5] = function(c) return unpack_str(c, unpack_uint16(c)) end, -- bin16
	[0xC6] = function(c) return unpack_str(c, unpack_uint32(c)) end, -- bin32
	[0xC7] = function(c) return unpack_ext(c, unpack_uint8(c), unpack_int8(c)) end,
	[0xC8] = function(c) return unpack_ext(c, unpack_uint16(c), unpack_int8(c)) end,
	[0xC9] = function(c) return unpack_ext(c, unpack_uint32(c), unpack_int8(c)) end,
	[0xCA] = unpack_float,
	[0xCB] = unpack_double,
	[0xCC] = unpack_uint8,
	[0xCD] = unpack_uint16,
	[0xCE] = unpack_uint32,
	[0xCF] = unpack_uint64,
	[0xD0] = unpack_int8,
	[0xD1] = unpack_int16,
	[0xD2] = unpack_int32,
	[0xD3] = unpack_int64,
	[0xD4] = function(c) return unpack_ext(c, 1, unpack_int8(c)) end,
	[0xD5] = function(c) return unpack_ext(c, 2, unpack_int8(c)) end,
	[0xD6] = function(c) return unpack_ext(c, 4, unpack_int8(c)) end,
	[0xD7] = function(c) return unpack_ext(c, 8, unpack_int8(c)) end,
	[0xD8] = function(c) return unpack_ext(c, 16, unpack_int8(c)) end,
	[0xD9] = function(c) return unpack_str(c, unpack_uint8(c)) end,
	[0xDA] = function(c) return unpack_str(c, unpack_uint16(c)) end,
	[0xDB] = function(c) return unpack_str(c, unpack_uint32(c)) end,
	[0xDC] = function(c) return unpack_array(c, unpack_uint16(c)) end,
	[0xDD] = function(c) return unpack_array(c, unpack_uint32(c)) end,
	[0xDE] = function(c) return unpack_map(c, unpack_uint16(c)) end,
	[0xDF] = function(c) return unpack_map(c, unpack_uint32(c)) end
}, {
	__index = function(t, k)
		if k < 0xC0 then
			if k < 0x80 then
				return fn_1
			elseif k < 0x90 then
				return fn_2
			elseif k < 0xA0 then
				return fn_3
			else
				return fn_4
			end
		elseif k > 0xDF then
			return fn_5
		else
			return function()
				error("unpack '" .. format("%#x", k) .. "' is unimplemented")
			end
		end
	end
})

local function cursor_string(str)
	return {
		s = str,
		i = 1,
		j = #str,
		underflow = function()
			error"missing bytes"
		end
	}
end

local function cursor_loader(ld)
	return {
		s = '',
		i = 1,
		j = 0,
		underflow = function(self, e)
			self.s = self.s:sub(self.i)
			e = e - self.i + 1
			self.i = 1
			self.j = 0

			while e > self.j do
				local chunk = ld()

				if not chunk then
					error"missing bytes"
				end

				self.s = self.s .. chunk
				self.j = #self.s
			end
		end
	}
end

function m.unpack(s)
	checktype("unpack", 1, s, "string")
	local cursor = cursor_string(s)
	local data = unpack_cursor(cursor)

	if cursor.i <= cursor.j then
		error("extra bytes")
	end

	return data
end

function m.unpacker(src)
	if type(src) == "string" then
		local cursor = cursor_string(src)

		return function()
			if cursor.i <= cursor.j then return cursor.i, unpack_cursor(cursor) end
		end
	elseif type(src) == "function" then
		local cursor = cursor_loader(src)

		return function()
			if cursor.i > cursor.j then
				pcall(cursor.underflow, cursor, cursor.i)
			end

			if cursor.i <= cursor.j then return true, unpack_cursor(cursor) end
		end
	else
		argerror("unpacker", 1, "string or function expected, got " .. type(src))
	end
end

set_string("string")
set_integer("unsigned")

if SIZEOF_NUMBER == 4 then
	maxinteger = 16777215
	mininteger = -maxinteger
	m.small_lua = true
	unpackers[0xCB] = nil -- double
	unpackers[0xCF] = nil -- uint64
	unpackers[0xD3] = nil -- int64
	set_number("float")
else
	maxinteger = 9007199254740991
	mininteger = -maxinteger
	set_number("double")

	if SIZEOF_NUMBER > 8 then
		m.long_double = true
	end
end

set_array("always_as_map")
m._VERSION = "0.5.2"
m._DESCRIPTION = "lua-MessagePack : a pure Lua implementation"
m._COPYRIGHT = "Copyright (c) 2012-2019 Francois Perrad"

return m
--
-- This library is licensed under the terms of the MIT/X11 license,
-- like Lua itself.
--

--PATH addons/sam-157/lua/sam/sh_permissions.lua:
if SAM_LOADED then return end

local permissions = {}

local give_permission
if SERVER then
	local permissions_to_add = {}

	give_permission = function(name, permission)
		if sam.ranks.ranks_loaded() then
			local rank = sam.ranks.get_rank(name)
			if rank and rank.data.permissions[permission] == nil then
				sam.ranks.give_permission(name, permission)
			end
		else
			table.insert(permissions_to_add, {name, permission})
		end
	end

	hook.Add("SAM.LoadedRanks", "SAM.Command.GivePermissions", function()
		for k, v in ipairs(permissions_to_add) do
			give_permission(v[1], v[2])
		end
	end)
end

local get_next_Other = function()
	for i, v in ipairs(permissions) do
		if v.category == "Other" then
			return i
		end
	end
	return #permissions + 1
end

function sam.permissions.add(permission, category, rank)
	if not sam.isstring(category) then
		category = "Other"
	end

	local permission_data = {
		name = permission,
		category = category,
		rank = rank,
		value = value
	}

	local index = sam.permissions.get_index(permission)
	if not index then
		if category ~= "Other" then
			table.insert(permissions, get_next_Other(), permission_data)
		else
			table.insert(permissions, permission_data)
		end
		hook.Call("SAM.AddedPermission", nil, permission, category, rank, value)
	else
		permissions[index] = permission_data
		hook.Call("SAM.PermissionModified", nil, permission, category, rank, value)
	end

	if SERVER and rank then
		give_permission(rank, permission)
	end
end

function sam.permissions.get_index(permission)
	for i, v in ipairs(permissions) do
		if v.name == permission then
			return i
		end
	end
end

function sam.permissions.remove(permission)
	local index = sam.permissions.get_index(permission)
	if index then
		table.remove(permissions, index)
		hook.Call("SAM.RemovedPermission", nil, permission)
	end
end

function sam.permissions.exists(permission)
	return sam.permissions.get_index(permission) and true or false
end

function sam.permissions.get()
	return permissions
end
--PATH addons/sam-157/lua/sam/player/sh_nw_vars.lua:
if SAM_LOADED then return end

local netstream = sam.netstream

local nwvars = {}

if SERVER then
	function sam.player.set_nwvar(ply, key, value, force)
		local id = ply:EntIndex()
		if force or nwvars[id][key] ~= value then
			nwvars[id][key] = value
			netstream.Start(nil, "SetNWVar", id, key, value)
		end
	end
end

if CLIENT then
	function sam.player.set_nwvar(ply, key, value)
		local id_vars = nwvars[ply:EntIndex()]
		id_vars[key] = value
	end

	netstream.Hook("SetNWVar", function(id, key, value)
		local id_vars = nwvars[id]
		if id_vars == nil then
			nwvars[id] = {
				[key] = value
			}
		else
			id_vars[key] = value
		end
	end)

	netstream.Hook("SendNWVars", function(vars)
		nwvars = vars
	end)

	netstream.Hook("RemoveNWVar", function(id)
		nwvars[id] = nil
	end)
end

function sam.player.get_nwvar(ply, key, default)
	local value = nwvars[ply:EntIndex()]
	if value then
		value = value[key]
		if value ~= nil then
			return value
		end
	end
	return default
end

if SERVER then
	hook.Add("OnEntityCreated", "SAM.NWVars", function(ent)
		if ent:IsPlayer() and ent:IsValid() then
			nwvars[ent:EntIndex()] = {}
		end
	end)

	hook.Add("SAM.PlayerNetReady", "SAM.SendNWVars", function(ply)
		netstream.Start(ply, "SendNWVars", nwvars)
	end)

	hook.Add("EntityRemoved", "SAM.RemoveNWVars", function(ent)
		if ent:IsPlayer() then
			local id = ent:EntIndex()
			nwvars[id] = nil
			netstream.Start(nil, "RemoveNWVar", id)
		end
	end)
end

--PATH addons/sam-157/lua/sam/command/arguments/dropdown.lua:
if SAM_LOADED then return end

local sam, command = sam, sam.command

command.new_argument("dropdown")
    :OnExecute(function(arg, input, ply, _, result)
        if not arg.options or table.Empty(arg.options) then
            ply:sam_send_message("no data", {S = "dropdown", S_2 = input})
            return
        end

        table.insert(result, input)
    end)
    :Menu(function(set_result, body, buttons, arg)
        local default = arg.hint or "select"

        local cbo = buttons:Add("SAM.ComboBox")
        cbo:SetValue(default)
		cbo:SetTall(25)

        function cbo:OnSelect(_, value)
            set_result(value)
            default = value
        end

        function cbo:DoClick()
            if self:IsMenuOpen() then
                return self:CloseMenu()
            end

            self:Clear()
            self:SetValue(default)

            if not arg.options then
                LocalPlayer():sam_send_message("dropdown has no options data")
                return
            end

            for k, v in pairs(arg.options) do
                self:AddChoice(v)
            end

            self:OpenMenu()
        end

        return cbo
    end)
:End()
--PATH addons/sam-157/lua/sam/command/arguments/player.lua:
if SAM_LOADED then return end

local sam, command = sam, sam.command

local can_target_player = function(arg, admin, target, cmd, input)
	if not IsValid(target) or not target:IsPlayer() or not target:sam_get_nwvar("is_authed") then
		if input then
			admin:sam_send_message("cant_find_target", {
				S = input
			})
		end
		return false
	end

	if not arg.allow_higher_target and not admin:CanTarget(target) then
		if cmd then
			admin:sam_send_message("cant_target_player", {
				S = target:Name()
			})
		end
		return false
	end

	if arg.cant_target_self and admin == target then
		if cmd then
			admin:sam_send_message("cant_target_self", {
				S = cmd.name
			})
		end
		return false
	end

	return true
end

local check_text_match = function(text, ply)
	if ply:Name():lower():find(text, 1, true) then return true end
	if ply:GetUserGroup():lower():find(text, 1, true) then return true end
	if team.GetName(ply:Team()):lower():find(text, 1, true) then return true end

	if not ply:IsBot() then
		return ply:SteamID():lower():find(text, 1, true) or ply:SteamID64():lower():find(text, 1, true)
	end

	return false
end

command.new_argument("player")
	:OnExecute(function(arg, input, ply, cmd, result, n)
		if input == nil and arg.optional then
			if sam.isconsole(ply) then
				ply:sam_send_message("cant_target_self", {
					S = cmd.name
				})
				return false
			end
			result[n] = {ply, admin = ply, input = input}
			return
		end

		local single_target = arg.single_target
		local targets = {admin = ply, input = input}

		if input == "*" then
			if single_target then
				ply:sam_send_message("cant_target_multi_players")
				return false
			end
			local players = player.GetAll()
			for i = 1, #players do
				local v = players[i]
				if can_target_player(arg, ply, v) then
					table.insert(targets, v)
				end
			end
		elseif input:sub(1, 1) == "#" and not single_target then
			local tmp = {}
			for _, v in ipairs(input:sub(2):Trim():Split(",")) do
				v = tonumber(v)
				if not sam.isnumber(v) then continue end
				local target = Entity(v)
				if not tmp[target] and IsValid(target) and target:IsPlayer() then
					tmp[target] = true
					if can_target_player(arg, ply, target) then
						table.insert(targets, target)
					end
				end
			end
		else
			local target
			if input == "^" then
				target = ply
			elseif input == "@" and not sam.isconsole(ply) then
				target = ply:GetEyeTrace().Entity
			elseif sam.is_steamid(input) then
				target = player.GetBySteamID(input)
			elseif sam.is_steamid64(input) then
				target = player.GetBySteamID64(input)
			elseif input:sub(1, 1) == "#" then
				local index = input:sub(2):Trim()
				index = tonumber(index)

				if not isnumber(index) then
					ply:sam_send_message("invalid_id", {
						S = input
					})
					return false
				end

				target = Entity(index)

				if not IsValid(target) or not target:IsPlayer() then
					ply:sam_send_message("player_id_not_found", {
						S = index
					})
					return false
				end
			else
				if input:sub(1, 1) == "%" and #input > 1 then
					input = input:sub(2)
				end

				target = sam.player.find_by_name(input)
				if sam.istable(target) then
					if single_target then
						ply:sam_send_message("found_multi_players", {T = target})
						return false
					else
						for k, v in ipairs(target) do
							if can_target_player(arg, ply, v) then
								table.insert(targets, v)
							end
						end
						goto _end
					end
				end
			end

			if not can_target_player(arg, ply, target, cmd, input) then
				return false
			end

			table.insert(targets, target)
		end

		::_end::

		if #targets == 0 then
			ply:sam_send_message("cant_find_target", {
				S = input
			})
			return false
		end
		result[n] = targets
	end)

	-- Do NOT ask me about this code at all please because I feel shit about it but I'm not gonna make
	-- a file specially for this one
	:Menu(function(set_result, body, buttons, argument, childs)
		if body.ply_list then
			local ply_list = body.ply_list
			ply_list.argument = argument
			ply_list.set_result = set_result
			ply_list.multi_select = argument.single_target ~= true

			if argument.single_target == true and #ply_list:GetSelected() > 1 then
				ply_list:ClearSelection()
			end

			ply_list:OnRowSelected()
			ply_list:GetParent():Show()

			return
		end

		local SUI = sam.SUI

		local SetVisible = FindMetaTable("Panel").SetVisible

		local left_body = body:Add("SAM.Panel")
		left_body:Dock(LEFT)
		left_body:DockMargin(0, 0, 5, 0)
		left_body:SetWide(0)
		left_body.no_remove = true
		left_body.no_change = "player"

		SetVisible(left_body, false)
		left_body.SetVisible = function(s, visible)
			if visible == s:IsVisible() or visible == s.visible_state then return end

			if visible then
				SetVisible(s, true)
				s:InvalidateLayout(true)
			end

			s.visible_state = visible
			s:Stop()

			s:SizeTo(visible and SUI.Scale(320) or 0, -1, 0.2, 0, 0, function()
				SetVisible(s, visible)
				s:InvalidateParent(true)
			end)
		end
		left_body:Show()

		table.insert(childs, left_body)

		local ply_list = left_body:Add("SAM.ScrollPanel")
		ply_list:Dock(FILL)
		ply_list:Background(Color(34, 34, 34), 3)
		ply_list.argument = argument
		ply_list.set_result = set_result
		ply_list.multi_select = argument.single_target ~= true
		ply_list.Paint = function(s, w, h)
			s:RoundedBox("Background", 3, 0, 0, w, h, SUI.GetColor("text_entry_bg"))
		end

		local lines = {}
		function ply_list:OnClickLine(line, clear)
			local multi_select = ply_list.multi_select
			if not multi_select and not clear then return end

			if multi_select and input.IsKeyDown(KEY_LCONTROL) then
				if line.Selected then
					line.Selected = false
					self.main_selected_line = nil
					self:OnRowSelected()
					return
				end
				clear = false
			end

			if multi_select and input.IsKeyDown(KEY_LSHIFT) then
				local selected = self:GetSelectedLine()
				if selected then
					self.main_selected_line = self.main_selected_line or selected

					if clear then
						self:ClearSelection()
					end

					local first = math.min(self.main_selected_line.id, line.id)
					local last = math.max(self.main_selected_line.id, line.id)

					for id = first, last do
						local line_2 = lines[id]
						local was_selected = line_2.Selected

						line_2.Selected = true

						if not was_selected then
							self:OnRowSelected(line_2.id, line_2)
						end
					end

					return
				end
			end

			if not multi_select or clear then
				self:ClearSelection()
			end

			line.Selected = true

			self.main_selected_line = line
			self:OnRowSelected(line.id, line)
		end

		function ply_list:GetSelected()
			local ret = {}
			for _, v in ipairs(lines) do
				if v.Selected then
					table.insert(ret, v)
				end
			end
			return ret
		end

		function ply_list:GetSelectedLine()
			for _, line in ipairs(lines) do
				if line.Selected then return line end
			end
		end

		function ply_list:ClearSelection()
			for _, line in ipairs(lines) do
				line.Selected = false
			end
			self:OnRowSelected()
		end

		function ply_list:OnRowSelected()
			local plys = {}
			for k, v in ipairs(ply_list:GetSelected()) do
				plys[k] = v.ply:EntIndex()
			end
			if #plys == 0 then
				self.set_result(nil)
			else
				self.set_result("#" .. table.concat(plys, ","))
			end
		end

		function ply_list:OnRowRightClick(_, line)
			local dmenu = vgui.Create("SAM.Menu")
			dmenu:SetInternal(line)

			local name = line.ply:Name()
			dmenu:AddOption("Copy Name", function()
				SetClipboardText(name)
			end)

			dmenu:AddSpacer()

			local steamid = line.ply:SteamID()
			dmenu:AddOption("Copy SteamID", function()
				SetClipboardText(steamid)
			end)

			dmenu:AddOption("Copy SteamID64", function()
				SetClipboardText(util.SteamIDTo64(steamid))
			end)

			dmenu:Open()
			dmenu:SetPos(input.GetCursorPos())
		end

		local item_click = function(s)
			ply_list:OnClickLine(s, true)
		end

		local item_rightclick = function(s)
			if not s.Selected then
				ply_list:OnClickLine(s, true)
			end
			ply_list:OnRowRightClick(s.id, s)
		end

		local item_cursor = function(s)
			if input.IsMouseDown(MOUSE_LEFT) then
				ply_list:OnClickLine(s)
			end
		end

		local added_players = {}

		local add_player = function(ply, i)
			if can_target_player(ply_list.argument, LocalPlayer(), ply) then
				local player_button = ply_list:Add("SAM.Button")
				player_button:Dock(TOP)
				player_button:DockMargin(0, 0, 0, 2)
				player_button:DockPadding(4, 4, 4, 4)
				player_button:SetContained(false)
				player_button:SetText("")
				player_button:SetZPos(i)
				player_button.DoClick = item_click
				player_button.DoRightClick = item_rightclick
				player_button.OnCursorMoved = item_cursor

				local line = player_button:Add("SAM.PlayerLine")
				line:SetMouseInputEnabled(false)
				line:SetInfo({
					steamid = ply:IsBot() and "BOT" or ply:SteamID(),
					name = ply:Name(),
					rank = ply:GetUserGroup()
				})

				player_button:InvalidateLayout(true)
				player_button:SizeToChildren(false, true)

				player_button.ply = ply
				player_button.line = line
				player_button.id = table.insert(lines, player_button)
				body.search_entry:OnValueChange()

				added_players[ply] = true
			end
		end

		ply_list:On("Think", function()
			local players = player.GetAll()
			for i = 1, #players do
				local ply = players[i]
				if not added_players[ply] then
					add_player(ply, i)
				end
			end

			local argument = ply_list.argument
			for i = 1, #lines do
				local line = lines[i]
				local ply = line.ply

				if not can_target_player(argument, LocalPlayer(), ply) then
					line:Remove()
					table.remove(lines, i)
					added_players[ply] = nil
					ply_list:OnRowSelected()
					break
				end

				line = line.line
				line:SetName(ply:Name())
				line:SetRank(ply:GetUserGroup())
			end
		end)

		local search_entry = left_body:Add("SAM.TextEntry")
		search_entry:Dock(TOP)
		search_entry:DockMargin(0, 0, 0, 5)
		search_entry:SetPlaceholder("Search... (name/steamid/rank/job)")
		search_entry:SetBackground(Color(34, 34, 34))
		search_entry:SetTall(25)
		search_entry:SetNoBar(true)

		function search_entry:OnValueChange(text)
			if text == nil then
				text = self:GetValue()
			end
			if text ~= "" then
				ply_list:ClearSelection()
			end
			text = text:lower()
			for i, line in ipairs(lines) do
				local ply = line.ply
				if IsValid(ply) then
					line:SetVisible(check_text_match(text, ply))
				end
			end
			ply_list:GetCanvas():InvalidateLayout(true)
		end

		body.ply_list = ply_list
		body.search_entry = search_entry
	end)

	:AutoComplete(function(arg, result, name)
		local ply = LocalPlayer()
		for k, v in ipairs(player.GetAll()) do
			if can_target_player(arg, ply, v) and v:Name():lower():find(name, 1, true) then
				table.insert(result, "%" .. v:Name())
			end
		end
	end)
:End()

--PATH addons/sui/lua/sui/vgui/sui_label_panel.lua:
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local LABEL_FONT = SUI.CreateFont("LabelPanel", "Roboto", 18)

local PANEL = {}

local add = function(s, c)
	if IsValid(s.pnl) then
		s.pnl:Remove()
	end

	local pnl = vgui.Create(c, s)
	s.pnl = pnl

	return pnl
end

function PANEL:Init()
	self.title = ""

	local label = self:Add(NAME .. ".Label")
	label:Dock(LEFT)
	self.label = label

	self:SetFont(LABEL_FONT)

	self:Dock(TOP)
	self:InvalidateLayout(true)
	self.Add = add
end

function PANEL:SetPanel(pnl)
	if IsValid(self.pnl) then
		self.pnl:Remove()
	end

	pnl:SetParent(self)
	self.pnl = pnl
end

function PANEL:SetLabel(lbl)
	self.title = lbl
	self:InvalidateLayout(true)
end

function PANEL:SetFont(font)
	self.font = font
	self.label:SetFont(font)
end

function PANEL:PerformLayout(w, h)
	local label = self.label
	local pnl = self.pnl

	local pnl_w, pnl_h = 0, 0
	if pnl then
		pnl_w, pnl_h = pnl:GetSize()
	end

	label:SetWide(w - pnl_w - 4)
	label:SetText(sui.wrap_text(self.title, self.font, w - pnl_w - 4))

	local _, _h = label:GetTextSize()
	self:SetTall(math.max(_h, pnl_h))

	if pnl then
		pnl:SetPos(w - pnl_w, h / 2 - pnl_h / 2)
	end
end

sui.register("LabelPanel", PANEL, "PANEL")
--PATH addons/sam-157/lua/sam/menu/tabs/config/server.lua:
if SAM_LOADED then return end

local sam = sam
local config = sam.config

config.add_tab("Server", function(parent)
	local server_body = parent:Add("SAM.ScrollPanel")
	server_body:Dock(FILL)
	server_body:LineMargin(0, 6, 0, 0)

	local i = 0
	server_body:GetCanvas():On("OnChildAdded", function(s, child)
		i = i + 1
		child:SetZPos(i)
	end)

	for k, v in ipairs(sam.config.get_menu_settings()) do
		local panel = v.func(server_body)
		if ispanel(panel) then
			local setting = server_body:Add("SAM.LabelPanel")
			setting:DockMargin(8, 6, 8, 0)
			setting:SetLabel(v.title)
			setting:SetPanel(panel)
		end

		server_body:Line()
	end

	return server_body
end, function()
	return LocalPlayer():HasPermission("manage_config")
end, 1)
--PATH addons/sam-157/lua/sam/menu/tabs/players.lua:
if SAM_LOADED then return end

local sam = sam
local SQL = sam.SQL
local SUI = sam.SUI
local netstream = sam.netstream

sam.permissions.add("manage_players", nil, "superadmin")

local get_pages_count = function(count)
	count = count / 35
	local i2 = math.floor(count)
	return count ~= i2 and i2 + 1 or count
end

if SERVER then
	local check = function(ply)
		return ply:HasPermission("manage_players") and ply:sam_check_cooldown("MenuViewPlayers", 0.1)
	end

	local limit = 35

	local get_page_count = function(callback, res, page, column, order_by, sort_by, keyword)
		local query = [[
			SELECT
				COUNT(`steamid`) AS `count`
			FROM
				`sam_players`]]
		if keyword then
			if column == "steamid" and sam.is_steamid64(keyword) then
				keyword = util.SteamIDFrom64(keyword)
			end

			query = string.format("%s WHERE `%s` LIKE %s", query, column, SQL.Escape("%" .. keyword .. "%"))
		end
		SQL.Query(query, callback, true, {res, page, column, order_by, sort_by, keyword})
	end

	local valid_columns = {
		steamid = true,
		name = true,
		rank = true
	}

	local valid_sorts = {
		id = true,
		name = true,
		rank = true,
		play_time = true,
		last_join = true
	}

	local resolve_promise = function(data, arguments)
		local res = arguments[1]
		arguments[1] = data
		res(arguments)
	end

	local get_players = function(count_data, arguments)
		local res, page, column, order_by, sort_by, keyword = unpack(arguments)
		local count = count_data.count

		local current_page
		if page < 1 then
			page, current_page = 1, 1
		end

		local pages_count = get_pages_count(count)
		if page > pages_count then
			page, current_page = pages_count, pages_count
		end

		local query = [[
			SELECT
				`steamid`,
				`name`,
				`rank`,
				`expiry_date`,
				`first_join`,
				`last_join`,
				`play_time`
			FROM
				`sam_players`
		]]

		local args = {}

		if keyword then
			args[1] = column
			args[2] = "%" .. keyword .. "%"

			query = query .. [[
				WHERE
					`{1f}` LIKE {2}
			]]
		end

		args[3] = sort_by
		if order_by == "DESC" then
			query = query .. [[
				ORDER BY `{3f}` DESC
			]]
		else
			query = query .. [[
				ORDER BY `{3f}` ASC
			]]
		end

		args[4] = limit
		args[5] = math.abs(limit * (page - 1))

		query = query .. [[
			LIMIT {4} OFFSET {5}
		]]

		SQL.FQuery(query, args, resolve_promise, false, {res, count, current_page})
	end

	netstream.async.Hook("SAM.GetPlayers", function(res, ply, page, column, order_by, sort_by, keyword)
		if not isnumber(page) then return end
		if not valid_columns[column] then return end
		if order_by ~= "ASC" and order_by ~= "DESC" then return end
		if not valid_sorts[sort_by] then return end
		if keyword ~= nil and not sam.isstring(keyword) then return end

		get_page_count(get_players, res, page, column, order_by, sort_by, keyword)
	end, check)

	return
end

local GetColor = SUI.GetColor
local Line = sui.TDLib.LibClasses.Line

local COLUMN_FONT = SUI.CreateFont("Column", "Roboto", 18)
local LINE_FONT = SUI.CreateFont("Line", "Roboto", 16)
local NEXT_FONT = SUI.CreateFont("NextButton", "Roboto", 18)

local button_click = function(s)
	local v = s.v

	local dmenu = vgui.Create("SAM.Menu")
	dmenu:SetInternal(s)
	if v.name and v.name ~= "" then
		dmenu:AddOption("Copy Name", function()
			SetClipboardText(v.name)
		end)
	end

	dmenu:AddOption("Copy SteamID", function()
		SetClipboardText(v.steamid)
	end)

	dmenu:AddOption("Copy Rank", function()
		SetClipboardText(v.rank)
	end)

	dmenu:AddOption("Copy Play Time", function()
		SetClipboardText(sam.reverse_parse_length(tonumber(v.play_time) / 60))
	end)

	dmenu:AddSpacer()

	dmenu:AddOption("Change Rank", function()
		local querybox = vgui.Create("SAM.QueryBox")
		querybox:SetTitle(string.format("Change rank for '%s'", v.name or v.steamid))
		querybox:SetWide(360)

		local ranks = querybox:Add("SAM.ComboBox")
		ranks:SetTall(28)

		for rank_name in SortedPairsByMemberValue(sam.ranks.get_ranks(), "immunity", true) do
			if v.rank ~= rank_name then
				ranks:AddChoice(rank_name, nil, true)
			end
		end

		querybox:Done()
		querybox.save:SetEnabled(true)

		querybox:SetCallback(function()
			RunConsoleCommand("sam", "setrankid", v.steamid, ranks:GetValue())
		end)
	end)

	dmenu:Open()
end

sam.menu.add_tab("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sam/user.png", function(column_sheet)
	local refresh, pages
	local current_page, current_column, current_order, current_sort, keyword = nil, "steamid", "DESC", "id", nil

	local players_body = column_sheet:Add("Panel")
	players_body:Dock(FILL)
	players_body:DockMargin(0, 1, 0, 0)
	players_body:DockPadding(10, 10, 10, 10)

	local toggle_loading, is_loading = sam.menu.add_loading_panel(players_body)

	local title = players_body:Add("SAM.Label")
	title:Dock(TOP)
	title:SetFont(SAM_TAB_TITLE_FONT)
	title:SetText("Players")
	title:SetTextColor(GetColor("menu_tabs_title"))
	title:SizeToContents()

	local total = players_body:Add("SAM.Label")
	total:Dock(TOP)
	total:DockMargin(0, 6, 0, 0)
	total:SetFont(SAM_TAB_DESC_FONT)
	total:SetText("60 total players")
	total:SetTextColor(GetColor("menu_tabs_title"))
	total:SetPos(10, SUI.Scale(40))
	total:SizeToContents()

	local search_entry
	do
		local container = players_body:Add("SAM.Panel")
		container:Dock(TOP)
		container:DockMargin(0, 6, 10, 0)
		container:SetTall(30)

		local sort_by = container:Add("SAM.ComboBox")
		sort_by:Dock(RIGHT)
		sort_by:DockMargin(4, 0, 0, 0)
		sort_by:SetWide(106)
		sort_by:SetValue("Sort By (ID)")
		sort_by:AddChoice("ID")
		sort_by:AddChoice("Name")
		sort_by:AddChoice("Rank")
		sort_by:AddChoice("Play Time")

		function sort_by:OnSelect(_, value)
			value = value:lower():gsub(" ", "_")
			if current_sort ~= value then
				current_sort = value
				refresh()
			end
		end

		local sort_order = container:Add("SAM.ComboBox")
		sort_order:Dock(RIGHT)
		sort_order:SetWide(96)
		sort_order:SetValue("Desc")
		sort_order:AddChoice("Desc")
		sort_order:AddChoice("Asc")

		function sort_order:OnSelect(_, value)
			value = value:upper()
			if current_order ~= value then
				current_order = value
				refresh()
			end
		end

		local column = container:Add("SAM.ComboBox")
		column:Dock(RIGHT)
		column:DockMargin(0, 0, 4, 0)
		column:SetWide(140)

		column:SetValue("Search (SteamID)")
		column:AddChoice("SteamID")
		column:AddChoice("Name")
		column:AddChoice("Rank")

		function column:OnSelect(_, value)
			value = value:lower()
			if current_column ~= value then
				current_column = value
				refresh()
			end
		end

		search_entry = container:Add("SAM.TextEntry")
		search_entry:Dock(LEFT)
		search_entry:SetNoBar(true)
		search_entry:SetPlaceholder("Search...")
		search_entry:SetRadius(4)
		search_entry:SetWide(220)

		function search_entry:OnEnter(no_refresh)
			local value = self:GetValue()
			if keyword ~= value then
				keyword = value ~= "" and value or nil
				if not no_refresh then
					refresh()
				end
			end
		end
	end

	Line(players_body, nil, -5, SUI.Scale(15), -5, 0)

	do
		local columns = players_body:Add("Panel")
		columns:Dock(TOP)
		columns:DockMargin(0, 10, 0, 0)

		local info = columns:Add("SAM.Label")
		info:Dock(LEFT)
		info:DockMargin(4, 0, 0, 0)
		info:SetFont(COLUMN_FONT)
		info:SetText("Player")
		info:SetTextColor(GetColor("player_list_titles"))
		info:SetWide(SUI.Scale(280) + SUI.Scale(34))
		info:SizeToContentsY(3)

		local play_time = columns:Add("SAM.Label")
		play_time:Dock(LEFT)
		play_time:DockMargin(-4, 0, 0, 0)
		play_time:SetFont(COLUMN_FONT)
		play_time:SetText("Play Time")
		play_time:SetTextColor(GetColor("player_list_titles"))
		play_time:SetWide(SUI.Scale(180))
		play_time:SizeToContentsY(3)

		local rank_expiry = columns:Add("SAM.Label")
		rank_expiry:Dock(LEFT)
		rank_expiry:DockMargin(-4, 0, 0, 0)
		rank_expiry:SetFont(COLUMN_FONT)
		rank_expiry:SetText("Rank Expiry")
		rank_expiry:SetTextColor(GetColor("player_list_titles"))
		rank_expiry:SetWide(SUI.Scale(280))
		rank_expiry:SizeToContentsY(3)

		columns:SizeToChildren(false, true)
	end

	local body = players_body:Add("SAM.ScrollPanel")
	body:Dock(FILL)
	body:DockMargin(0, 10, 0, 0)
	body:SetVBarPadding(6)

	local set_data = function(data)
		body:GetCanvas():Clear()
		body.VBar.Scroll = 0

		local players, players_count, current_page_2 = unpack(data)
		total:SetText(players_count .. " total players")

		pages = get_pages_count(players_count)
		current_page.i = pages == 0 and 0 or current_page_2 or current_page.i
		current_page:SetText(current_page.i .. "/" .. pages)

		body:Line()

		for k, v in ipairs(players) do
			local line = body:Add("SAM.PlayerLine")
			line:DockMargin(0, 0, 0, 10)

			local name = v.name ~= "" and v.name or nil
			line:SetInfo({
				steamid = v.steamid,
				name = name,
				rank = v.rank
			})

			local play_time = line:Add("SAM.Label")
			play_time:Dock(LEFT)
			play_time:DockMargin(4, 0, 0, 0)
			play_time:SetFont(LINE_FONT)
			play_time:SetText(sam.reverse_parse_length(tonumber(v.play_time) / 60))
			play_time:SetTextColor(GetColor("player_list_data"))
			play_time:SetContentAlignment(4)
			play_time:SetWide(SUI.Scale(180))

			local expiry_date = tonumber(v.expiry_date)
			local rank_expiry = line:Add("SAM.Label")
			rank_expiry:Dock(LEFT)
			rank_expiry:DockMargin(-3, 0, 0, 0)
			rank_expiry:SetFont(LINE_FONT)
			rank_expiry:SetText(expiry_date == 0 and "Never" or sam.reverse_parse_length((expiry_date - os.time()) / 60))
			rank_expiry:SetTextColor(GetColor("player_list_data"))
			rank_expiry:SetContentAlignment(4)
			rank_expiry:SizeToContents()

			local but = line:Actions()
			but.v = v
			but:On("DoClick", button_click)

			body:Line()
		end
	end

	refresh = function()
		if not is_loading() and LocalPlayer():HasPermission("manage_players") then
			search_entry:OnEnter(true)
			local refresh_query = netstream.async.Start("SAM.GetPlayers", toggle_loading, current_page.i, current_column, current_order, current_sort, keyword)
			refresh_query:done(set_data)
		end
	end

	local bottom_panel = players_body:Add("SAM.Panel")
	bottom_panel:Dock(BOTTOM)
	bottom_panel:DockMargin(0, 6, 0, 0)
	bottom_panel:SetTall(30)
	bottom_panel:Background(GetColor("page_switch_bg"))

	local previous_page = bottom_panel:Add("SAM.Button")
	previous_page:Dock(LEFT)
	previous_page:SetWide(30)
	previous_page:SetText("<")
	previous_page:SetFont(NEXT_FONT)

	previous_page:On("DoClick", function()
		if current_page.i <= 1 then return end

		current_page.i = current_page.i - 1
		refresh()
	end)

	current_page = bottom_panel:Add("SAM.Label")
	current_page:Dock(FILL)
	current_page:SetContentAlignment(5)
	current_page:SetFont(SAM_TAB_DESC_FONT)
	current_page:SetText("loading...")
	current_page.i = 1

	local next_page = bottom_panel:Add("SAM.Button")
	next_page:Dock(RIGHT)
	next_page:SetWide(30)
	next_page:SetText(">")
	next_page:SetFont(NEXT_FONT)

	next_page:On("DoClick", function()
		if current_page.i == pages then return end

		current_page.i = current_page.i + 1
		refresh()
	end)

	function bottom_panel:Think()
		next_page:SetEnabled(current_page.i ~= pages)
		previous_page:SetEnabled(current_page.i > 1)
	end

	do
		local refresh_2 = function()
			timer.Simple(1, refresh)
		end

		for k, v in ipairs({"SAM.AuthedPlayer", "SAM.ChangedPlayerRank", "SAM.ChangedSteamIDRank"}) do
			hook.Add(v, "SAM.MenuPlayers", refresh_2)
		end
	end

	refresh()

	return players_body
end, function()
	return LocalPlayer():HasPermission("manage_players")
end, 2)
--PATH addons/sl_utils/lua/sam/modules/vrondakis_leveling_system.lua:
if SAM_LOADED then return end

local sam, command = sam, sam.command

command.set_category("Levels")

command.new("addxp")
	:SetPermission("addxp", "superadmin")

	:AddArg("player", {single_target = true})
	:AddArg("number", {hint = "xp", default = 1, min = 1})

	:Help("Add XP to a player.")

	:OnExecute(function(ply, targets, xp)
		local target = targets[1]
		if target.DarkRPUnInitialized then return end

		target:addXP(xp, true)
		SendToDiscord("📦 Give", "**Joueur:** "..((IsValid(ply) and ply:IsPlayer()) and (ply:SteamName().." (`"..ply:SteamID().."`)") or "Console").."\n**Cible:** "..((IsValid(target) and target:IsPlayer()) and (target:SteamName().." (`"..target:SteamID().."`)") or "N/A").."\n**XP:** +"..xp)
		DarkRP.notify(target, 0, 4, ply:Nick() .. " gave you " .. xp .. "XP")

		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} gave {T} {V} XP.", {
			A = ply, T = targets, V = xp
		})
	end)
:End()

command.new("setlevel")
	:SetPermission("setlevel", "superadmin")

	:AddArg("player", {single_target = true})
	:AddArg("number", {hint = "level", default = 1, min = 1})

	:Help("Set player's level.")

	:OnExecute(function(ply, targets, level)
		local target = targets[1]
		if target.DarkRPUnInitialized then return end

		DarkRP.storeXPData(target, level, 0)
		SendToDiscord("📦 Give", "**Joueur:** "..((IsValid(ply) and ply:IsPlayer()) and (ply:SteamName().." (`"..ply:SteamID().."`)") or "Console").."\n**Cible:** "..((IsValid(target) and target:IsPlayer()) and (target:SteamName().." (`"..target:SteamID().."`)") or "N/A").."\n**Level:** "..xp)
		target:setDarkRPVar("level", level)
		target:setDarkRPVar("xp", 0)
		DarkRP.notify(target, 0, 4, ply:Nick() .. " set your level to " .. level)

		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} set the level for {T} to {V}.", {
			A = ply, T = targets, V = level
		})
	end)
:End()
--PATH addons/sui/lua/sui/vgui/sui_threegrid.lua:
local math = math
local table = table
local ipairs = ipairs

local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local Panel = {}

AccessorFunc(Panel, "horizontalMargin", "HorizontalMargin", FORCE_NUMBER)
AccessorFunc(Panel, "verticalMargin", "VerticalMargin", FORCE_NUMBER)
AccessorFunc(Panel, "columns", "Columns", FORCE_NUMBER)
AccessorFunc(Panel, "Wide2", "Wide2", FORCE_NUMBER)

function Panel:Init()
	self:SetHorizontalMargin(0)
	self:SetVerticalMargin(0)
	self.Rows = {}
	self.Cells = {}
end

function Panel:AddCell(pnl)
	local cols = self:GetColumns()
	local idx = math.floor(#self.Cells / cols) + 1

	local rows = self.Rows[idx]
	if not rows then
		rows = self:CreateRow()
		self.Rows[idx] = rows
	end

	local margin = self:GetHorizontalMargin()

	local dockl, dockt, _, dockb = pnl:GetDockMargin()
	pnl:SetParent(rows)
	pnl:Dock(LEFT)
	pnl:DockMargin(dockl, dockt, #rows.Items + 1 < cols and self:GetHorizontalMargin() or 0, dockb)
	pnl:SetWide(((self:GetWide2() or self:GetWide()) - margin * (cols - 1)) / cols)

	table.insert(rows.Items, pnl)
	table.insert(self.Cells, pnl)

	self:CalculateRowHeight(rows)
end

function Panel:CreateRow()
	local row = self:Add("Panel")
	row:Dock(TOP)
	row:DockMargin(0, 0, 0, self:GetVerticalMargin())
	row.Items = {}

	return row
end

function Panel:CalculateRowHeight(row)
	local height = 0

	for k, v in ipairs(row.Items) do
		local _, t, _, b = v:GetDockMargin()
		height = math.max(height, v:GetTall() + t + b)
	end

	row:SetTall(height)
end

function Panel:Skip()
	local cell = vgui.Create("Panel")
	self:AddCell(cell)
end

function Panel:CalculateRowHeights()
	for _, row in ipairs(self.Rows) do
		self:CalculateRowHeight(row)
	end
end

function Panel:Clear()
	for _, row in ipairs(self.Rows) do
		for _, cell in ipairs(row.Items) do
			cell:Remove()
		end

		row:Remove()
	end

	self.Cells, self.Rows = {}, {}
end

Panel.OnRemove = Panel.Clear
sui.register("ThreeGrid", Panel, NAME .. ".ScrollPanel")
--PATH addons/sui/lua/sui/vgui/sui_zcollapse_category.lua:
local sui = sui

local draw_material = sui.draw_material

local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local GetColor = SUI.GetColor

local RoundedBox = sui.TDLib.LibClasses.RoundedBox
local TextColor = sui.TDLib.LibClasses.TextColor

local TABS_FONT = SUI.CreateFont("CategoryListTabs", "Roboto Bold", 13)
local ITEMS_FONT = SUI.CreateFont("CategoryListItems", "Roboto Medium", 14)

local Panel = {}

local item_OnRemove = function(s)
	local parent = s.parent

	local items = parent.items
	for k, v in ipairs(items) do
		if v == s then
			table.remove(items, k)
			break
		end
	end

	if #items == 0 then
		local category = s.category
		category:Remove()
		parent.categories[category.name] = nil
	end
end

local item_DoClick = function(s)
	local parent = s.parent
	parent:select_item(s)
end

function Panel:Init()
	local categories = {}
	local items = {}

	self.categories = categories
	self.items = items

	self:SetVBarPadding(1)

	local get_category = function(name)
		local category = categories[name]
		if category then return category end

		local expanded = false

		category = self:Add("Panel")
		category:Dock(TOP)
		category:DockMargin(0, 0, 0, 3)
		category.name = name

		local header = category:Add("DButton")
		header:Dock(TOP)
		header:DockMargin(0, 0, 0, 3)
		header:SetFont(TABS_FONT)
		header:SetContentAlignment(4)
		header:SetTextInset(6, 0)
		header:SetText(name)
		header:SizeToContentsY(SUI.Scale(14))

		local cur_col
		local cur_col_text = Color(GetColor("collapse_category_header_text"):Unpack())
		function header:Paint(w, h)
			if expanded then
				cur_col = GetColor("collapse_category_header_active")
				cur_col_text = GetColor("collapse_category_header_text_active")
			elseif self.Hovered then
				cur_col = GetColor("collapse_category_header_hover")
				cur_col_text = GetColor("collapse_category_header_text_hover")
			else
				cur_col = GetColor("collapse_category_header")
				cur_col_text = GetColor("collapse_category_header_text")
			end

			RoundedBox(self, "Background", 3, 0, 0, w, h, cur_col)
			TextColor(self, cur_col_text)
		end

		local image = header:Add(NAME .. ".Image")
		image:Dock(FILL)
		image:SetImage("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sui/arrow.png")

		function image:Draw(w, h)
			local size = SUI.ScaleEven(10)
			draw_material(nil, w - (size / 2) - 6, h / 2, size, cur_col_text, expanded and 180)
		end

		local current_h
		function category.RefreshHeight()
			local h
			if expanded then
				local _
				_, h = category:ChildrenSize()
				if self.searching and h == header:GetTall() then
					h = 0
				end
			else
				h = header:GetTall()
			end

			if current_h == h then return end

			if h > 0 then
				category:SetVisible(true)
			end

			current_h = h

			category:Stop()
			category:SizeTo(-1, h, 0.2, 0, -1, function()
				if h == 0 then
					category:SetVisible(false)
				end
			end)
		end

		function category.SetExpanded(_, set_expanded)
			if expanded == set_expanded then return end

			if sam.isbool(set_expanded) then
				expanded = set_expanded
			else
				expanded = not expanded
			end

			category.RefreshHeight()

			if expanded then
				self:OnCategoryExpanded(category)
			end

			self:InvalidateLayout(true)
		end
		header.DoClick = category.SetExpanded

		category:SetTall(header:GetTall())
		categories[name] = category

		return category
	end

	function self:add_item(name, category_name)
		local category = get_category(category_name)

		local item = category:Add("DButton")
		item:Dock(TOP)
		item:DockMargin(0, 0, 0, 3)
		item:SetFont(ITEMS_FONT)
		item:SetText(name)
		item:SizeToContentsY(SUI.Scale(3 * 2))
		item.name = name
		item.parent = self
		item.category = category

		local cur_col
		local cur_col_text = Color(GetColor("collapse_category_item_text"):Unpack())
		function item:Paint(w, h)
			if self.selected then
				cur_col = GetColor("collapse_category_item_active")
				cur_col_text = GetColor("collapse_category_item_text_active")
			elseif self.Hovered then
				cur_col = GetColor("collapse_category_item_hover")
				cur_col_text = GetColor("collapse_category_item_text_hover")
			else
				cur_col = GetColor("collapse_category_item")
				cur_col_text = GetColor("collapse_category_item_text")
			end

			RoundedBox(self, "Background", 4, 0, 0, w, h, cur_col)
			TextColor(self, cur_col_text)
		end

		item.DoClick = item_DoClick
		item.OnRemove = item_OnRemove

		table.insert(items, item)

		return item
	end
end

function Panel:OnCategoryExpanded(category)
end

function Panel:select_item(item)
	if self.selected_item ~= item then
		if IsValid(self.selected_item) then
			self.selected_item.selected = false
		end
		item.selected = true
		self.selected_item = item
		self:item_selected(item)
	end
end

function Panel:item_selected()
end

function Panel:Search(text, names)
	local items = self.items
	self.searching = true
	for i = 1, #items do
		local item = items[i]
		local category = item.category
		category:SetExpanded(true)

		if not names then
			if item.name:find(text, nil, true) then
				item:SetVisible(true)
			else
				item:SetVisible(false)
			end
		else
			local found = false
			for _, name in ipairs(item.names) do
				if name:find(text, nil, true) then
					found = true
					item:SetVisible(true)
				end
			end
			if not found then
				item:SetVisible(false)
			end
		end

		if text == "" then
			category:SetExpanded(false)
		end

		category:RefreshHeight()
		category:InvalidateLayout(true)
	end
	self.searching = false
end

sui.register("CollapseCategory", Panel, NAME .. ".ScrollPanel")
--PATH addons/chatbox/lua/scb/cl_chatbox.lua:
if SCB_LOADED then return end

local draw = draw
local surface = surface
local math = math
local hook = hook
local gui = gui
local net = net

local IsValid = IsValid
local ipairs = ipairs

local color_white = color_white

local scb = scb
local sui = sui
local SUI = scb.SUI
local utf8 = sui.utf8
local language = scb.language

for k, v in ipairs({18, 16, 14}) do
	_G["SCB_" .. v] = SUI.CreateFont(tostring(v), "Roboto", v)
end

scb.pattern = "%{ *([%w_%#%$@%*!]+)([^%{}]-) *%}"

local SetVisible = FindMetaTable("Panel").SetVisible

function scb.open_parsers_menu()
	if IsValid(scb.parsers_menu) then
		return scb.parsers_menu:Remove()
	end

	local text_entry = scb.chatbox.text_entry

	local parsers_menu = vgui.Create("SCB.Frame")
	scb.parsers_menu = parsers_menu

	parsers_menu:Center()
	parsers_menu:MakePopup()
	parsers_menu:SetTitle("SCB | Chat Parsers")
	parsers_menu:AddAnimations(320, 340)

	local parsers_list = parsers_menu:Add("SCB.ScrollPanel")
	parsers_list:Dock(FILL)
	parsers_list:DockMargin(4, 4, 4, 4)
	parsers_list:InvalidateParent(true)
	parsers_list:InvalidateLayout(true)

	for k, v in ipairs(scb.chat_parsers) do
		local parser = parsers_list:Add("DButton")
		parser:Dock(TOP)
		parser:DockMargin(2, 2, 2, 2)
		parser:DockPadding(2, 2, 2, 2)
		parser:InvalidateParent(true)
		parser:SetText("")

		parser:SUI_TDLib()
		parser:ClearPaint()
		parser:Background(SUI.GetColor("on_sheet"), 3)
		parser:FadeHover(SUI.GetColor("on_sheet_hover"), _, 3)

		function parser:DoClick()
			parsers_menu:Remove()
			scb.chatbox:MoveToFront()
			text_entry:RequestFocus()
			text_entry:AddValue(v[3] .. " ")
		end

		local title = parser:Add("SCB.Label")
		title:Dock(TOP)
		title:SetAutoStretchVertical(true)
		title:SetWrap(true)
		title:SetFont(SCB_16)
		title:SetText(v[1])
		title:InvalidateParent(true)

		local example = parser:Add("SCB.ChatLine")
		example:Dock(TOP)
		example:DockMargin(0, 1, 0, 0)
		example:InvalidateParent(true)
		example:InvalidateLayout(true)
		example:Parse(v[2])
		example:SetMouseInputEnabled(false)

		function parser:PerformLayout()
			self:SizeToChildren(false, true)
		end
	end
end

local function invalidate_children(self, recursive)
	local children = self:GetChildren()
	for i = 1, #children do
		if recursive then
			invalidate_children(children[i])
		else
			children[i]:InvalidateLayout(true)
		end
	end
	self:InvalidateLayout(true)
end

function scb.create_chatbox()
	if scb.chatbox then return end

	sui.TDLib.Start()

	local frame = vgui.Create("SCB.Frame", nil, "SCB")
	scb.chatbox = frame

	local c_x = CreateClientConVar("scb_x", sui.scale(18), true, false, "")
	local c_y = CreateClientConVar("scb_y", ScrH() - SUI.Scale(220) - sui.scale(170), true, false, "")
	local c_w = CreateClientConVar("scb_w", 480, true, false, "")
	local c_h = CreateClientConVar("scb_h", 220, true, false, "")

	frame.SetSize = frame.RealSetSize
	-- remove scaling for chatbox
	SUI.RemoveScaleHook(frame)

	frame:SetSizable(true)
	frame:SetMinWidth(SUI.Scale(300))
	frame:SetMinHeight(SUI.Scale(160))
	frame:SetSize(c_w:GetInt(), c_h:GetInt())
	frame:SetPos(c_x:GetInt(), c_y:GetInt())
	frame:ParentToHUD()
	frame:MakePopup()

	frame.title.background_color = true

	local chatbox_title = scb.config.chatbox_title
	frame:SetTitle(chatbox_title)
	if chatbox_title:find("SERVER_NAME") or chatbox_title:find("PLAYER_COUNT") then
		local delay = 2
		local next_run = UnPredictedCurTime()

		frame:On("Think", function(s)
			if UnPredictedCurTime() < next_run then return end
			next_run = UnPredictedCurTime() + delay

			s:SetTitle(chatbox_title:gsub("SERVER_NAME", GetHostName()):gsub("PLAYER_COUNT", player.GetCount()))
		end)
	end

	function frame:OnPosChanged()
		c_x:SetInt(self.x)
		c_y:SetInt(self.y)
	end

	function frame:OnSizeChanged(w, h)
		c_w:SetInt(w)
		c_h:SetInt(h)
	end

	function frame:AddPanelToHide(panel)
		if not self.panels_to_hide then
			self.panels_to_hide = {self}
		end
		table.insert(self.panels_to_hide, panel)
	end

	function frame:SetVisible(visible)
		self.hidden = not visible
		local panels_to_hide = self.panels_to_hide
		for i = 1, #panels_to_hide do
			local v = panels_to_hide[i]
			v.Paint, v.oldPaint = visible and (v.oldPaint or v.Paint) or nil, not visible and v.Paint or nil
			if v.background_color or v.old_bg_color then
				v.background_color, v.old_bg_color = visible and (v.old_bg_color or v.background_color) or nil, not visible and v.background_color or nil
				v:SetBGColor(v.background_color)
			end
		end
		return self.hidden
	end

	function frame:IsVisible()
		return not self.hidden
	end

	frame.close.DoClick = chat.Close

	local scroll_panel = frame:Add("SCB.ScrollPanel")
	scroll_panel:Dock(FILL)
	scroll_panel:DockMargin(4, 4, 4, 0)
	scroll_panel:SetFromBottom(true)

	function scroll_panel:ScrollToBottom()
		self:GetParent():InvalidateLayout(true)
		invalidate_children(self)

		local vbar = self.VBar
		vbar:SetScroll(vbar.CanvasSize)
	end

	local canvas = scroll_panel:GetCanvas()
	canvas:DockPadding(2, 2, 2, 2)

	function scroll_panel:ShouldScrollDown()
		local vbar = self.VBar
		local canvas_size = vbar.CanvasSize
		return frame.hidden or canvas_size == 1 or canvas_size <= vbar.scroll_target
	end

	local count = 0
	local max_messages_convar = GetConVar("scb_max_messages")
	local fixed_width = false
	function scroll_panel:ChildAdded()
		local vbar = self.VBar
		if vbar.Enabled then
			if not fixed_width then
				for k, v in ipairs(canvas.children) do
					if v.ScaleChanged then
						v:ScaleChanged()
					end
				end
				fixed_width = true
				return self:ChildAdded()
			end
		else
			fixed_width = nil
		end

		count = count + 1

		local max = max_messages_convar:GetInt()
		if count <= max then return end

		local down = self:ShouldScrollDown()

		local full_h = 0
		local children = canvas.children
		for i = count, max + 1, -1 do
			local child = children[i - max]
			if not child.being_removed then
				child.being_removed = true
				full_h = full_h + child:GetTotalH()
				child:Remove()

				count = count - 1
			end
		end

		local scroll = vbar.Scroll
		if down then
			vbar.Scroll = scroll - full_h
		else
			vbar.Scroll = scroll - full_h
			vbar.scroll_target = scroll
		end
	end

	frame:InvalidateLayout(true)
	invalidate_children(frame, true)

	local preview = vgui.Create("Panel")
	preview:SetMouseInputEnabled(false)
	preview:ParentToHUD()

	local preview_bg = vgui.Create("Panel")
	preview_bg:ParentToHUD()
	preview_bg:MoveToBack()
	SetVisible(preview_bg, false)

	preview_bg:Blur()
		:Background(Color(50, 50, 50, 200))

	frame:On("PerformLayout", function(s, w, h)
		local f_x, f_y = s:GetPos()
		local new_x, new_y = f_x + ((w / 2) - ((preview.w or 0) / 2)), f_y + h + 4
		preview:SetPos(new_x, new_y)
		preview_bg:SetPos(new_x - 4, new_y - 4)
	end)

	local text_entry = frame:Add("SCB.TextEntry")
	text_entry:Dock(BOTTOM)
	text_entry:DockMargin(4, 4, 4, 4)
	text_entry:SetTall(24)
	text_entry:SetPlaceholder(language.type_something)
	text_entry:SetFont(SCB_18)
	text_entry:SetMultiline(true)
	text_entry:SetVerticalScrollbarEnabled(true)
	text_entry:InvalidateParent(true)
	text_entry:SetMaxChars(126)
	text_entry:SetNoBar(true)
	text_entry.no_scale = true

	if scb.config.hide_language_sign then
		text_entry:SetDrawLanguageID(false)
	end

	function text_entry:OnEnter()
		local txt = self:GetValue()
		if txt == "" then chat.Close() return end
		local length = #txt
		net.Start(frame.bteam ~= 1 and "SCB.SendMessageTeam" or "SCB.SendMessage")
			net.WriteUInt(length, 8)
			net.WriteData(txt, length)
		net.SendToServer()
		self:AddHistory(txt)
		chat.Close()
	end

	local old_Paint = text_entry.Paint
	function text_entry:Paint(w, h)
		local outline = SUI.GetColor("scroll_panel_outline")
		if outline then
			sui.TDLib.DrawOutlinedBox(3, 0, 0, w, h, SUI.GetColor("scroll_panel"), outline, 1)
		else
			draw.RoundedBox(3, 0, 0, w, h, SUI.GetColor("scroll_panel"))
		end

		old_Paint(self, w, h)
	end

	function text_entry:OnValueChange(value)
		local down = scroll_panel:ShouldScrollDown()

		-- https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/mp/src/vgui2/vgui_controls/TextEntry.cpp#L3790
		self:SetTall(self:GetNumLines() * (SUI.Scale(18) --[[font size]] + 1) + 1 + 2)

		if down then
			scroll_panel:ScrollToBottom()
		end

		if value == "" then
			gui.InternalKeyCodeTyped(KEY_LEFT)
		end

		hook.Run("ChatTextChanged", value)
	end
	text_entry:OnValueChange("")

	do
		local emojis_table = {
			"grinning", "grin", "joy",
			"smiley", "smile", "sweat_smile",
			"laughing", "innocent", "smiling_imp",
			"wink", "blush", "yum", "relieved",
			"heart_eyes", "sunglasses", "smirk",
			"neutral_face", "expressionless", "unamused",
			"sweat", "pensive", "confused",
			"rage", "partying_face", "cold_face",
			"hot_face", "face_with_cowboy_hat"
		}

		local real_size = 0
		local mat, padding = SUI.Material("scb/emojis/flushed.png"), 3

		local emojis_button = text_entry:Add("DButton")
		emojis_button:SetText("")
		emojis_button:SetMouseInputEnabled(true)
		emojis_button:NoClipping(true)

		function emojis_button:IsActive()
			return self:IsHovered() or IsValid(scb.emojis_menu)
		end

		local inactive_col = Color(175, 175, 175)
		function emojis_button:Paint(w, h)
			surface.SetDrawColor(self:IsActive() and color_white or inactive_col)
			surface.SetMaterial(mat)
			surface.DrawTexturedRectRotated(w * 0.5, h * 0.5, real_size, real_size, 0)
		end

		function emojis_button:OnCursorEntered()
			if not IsValid(scb.emojis_menu) then
				mat = SUI.Material("scb/emojis/" .. emojis_table[math.random(1, #emojis_table)] .. ".png")
			end
		end

		function emojis_button:Think()
			self:MoveToFront()
			real_size = Lerp(RealFrameTime() * 15, real_size, self:IsActive() and SUI.Scale(22) or SUI.Scale(18))
		end

		function emojis_button:DoClick()
			if IsValid(scb.emojis_menu) then
				return self:OnRemove()
			end

			local emojis_menu = vgui.Create("SCB.EmojiList")
			emojis_menu.button = self
			emojis_menu:FixPos()

			scb.emojis_menu = emojis_menu
		end

		function emojis_button:OnRemove()
			if IsValid(scb.emojis_menu) then
				scb.emojis_menu:Remove()
			end
		end

		text_entry:On("PerformLayout", function(s, w, h)
			local size = SUI.ScaleEven(18)
			emojis_button:SetSize(size, size)
			emojis_button:SetPos(w - (size + padding), h / 2 - size / 2)

			local vbar = s:GetChildren()[1]
			if vbar then
				vbar:Hide()
				vbar:SetWide(math.Round(size + padding))
			end
		end)

		frame.emojis_button = emojis_button
		frame:AddPanelToHide(emojis_button)
	end

	-- Message Preview
	text_entry:On("OnValueChange", function(self, value)
		preview:SetWide(SUI.Scale(340))
		preview:Clear()
		SetVisible(preview_bg, false)

		if value == "" then return end

		local line = preview:Add("SCB.ChatLine")
		line:SetPlayer(LocalPlayer())
		line:SetAlpha(255)
		line:Parse(value)
		line:SizeToChildren(true, true)

		preview:SizeToChildren(false, true)
		preview:SetWide(line:GetMessageW())
		preview.w = line:GetMessageW()
		preview_bg:SetSize(preview.w + 8, preview:GetTall() + 8)
		SetVisible(preview_bg, true)
	end)
	--

	-- Emoji Select
	local emoji_list

	local open_emojis_list = function(emoji_name, start, _end)
		local selected_text
		if IsValid(emoji_list) then
			selected_text = emoji_list.selected_emoji and emoji_list.selected_emoji.name
			emoji_list:Remove()
		end

		local emojis = scb.search_emojis(emoji_name)
		if #emojis == 0 then return end

		emoji_list = frame:Add("SCB.EmojisSelect")
		emoji_list:SetWide(text_entry:GetWide())
		emoji_list:SetTextEntry(text_entry)
		emoji_list:SetStartEnd(start, _end)

		for _, v in ipairs(emojis) do
			local emoji = emoji_list:AddEmoji(v.name)
			if emoji.name == selected_text then
				emoji_list.selected_emoji = emoji
			end

			if #emoji_list.emojis == math.floor(SUI.Scale(120) / SUI.Scale(22)) then
				break
			end
		end

		emoji_list:SetPos(text_entry.x, text_entry.y - emoji_list:GetTall())
	end

	local typing_emoji = function()
		local value = text_entry:GetValue()
		local start, _end, emoji_name = 0
		while true do
			start, _end, emoji_name = value:find("%:([%w_]+)", _end)
			if not start then break end
			if utf8.len(value:sub(1, _end)) == text_entry:GetCaretPos() and not value:sub(_end + 1, _end + 1):match("%S") then
				return open_emojis_list(emoji_name:lower(), start, _end)
			end
			_end = _end + 1
		end

		if IsValid(emoji_list) then
			emoji_list:Remove()
		end
	end

	local old = text_entry.OnKeyCodeTyped
	function text_entry:OnKeyCodeTyped(code)
		if frame.hidden then return end

		if code == KEY_BACKQUOTE then
			gui.HideGameUI()
		elseif emoji_list and emoji_list[code] then
			return emoji_list[code](emoji_list)
		elseif code == KEY_ESCAPE then
			gui.HideGameUI()
			chat.Close()
			return
		elseif code == KEY_TAB then
			local text = hook.Run("OnChatTab", self:GetValue())
			if scb.isstring(text) then
				self:SetValue(text)
			end
			self:SetCaretPos(#self:GetValue())
			self:RequestFocus()
			return true
		end

		return old(self, code)
	end

	text_entry:On("OnValueChange", typing_emoji)
	text_entry:On("OnKeyCodeReleased", function(_, code)
		if code == KEY_LEFT or code == KEY_RIGHT then
			typing_emoji()
		end
	end)

	SUI.OnScaleChanged("EmojisListRemove", function()
		if IsValid(emoji_list) then
			emoji_list:Remove()
		end

		timer.Simple(0, function()
			text_entry:OnValueChange(text_entry:GetValue())
		end)
	end)
	--

	local settings = frame:AddHeaderButton("scb/settings.png", "settings", function()
		scb.open_settings()
	end)
	local parsers = frame:AddHeaderButton("scb/mind.png", "settings", function()
		scb.open_parsers_menu()
	end)

	frame:AddPanelToHide(frame.header)
	frame:AddPanelToHide(frame.title)
	frame:AddPanelToHide(frame.close)
	frame:AddPanelToHide(frame.close.image)
	frame:AddPanelToHide(settings)
	frame:AddPanelToHide(settings.image)
	frame:AddPanelToHide(parsers)
	frame:AddPanelToHide(parsers.image)
	frame:AddPanelToHide(scroll_panel)
	frame:AddPanelToHide(scroll_panel.VBar)
	frame:AddPanelToHide(scroll_panel.VBar.btnGrip)
	frame:AddPanelToHide(text_entry)

	frame.scroll_panel = scroll_panel
	frame.text_entry = text_entry

	sui.TDLib.End()
end

SUI.RemoveTheme("Light")

SUI.AddToTheme("Dark", {
	settings = Color(255, 255, 255, 133),
	settings_hover = Color(65, 185, 255),
	settings_press = Color(255, 255, 255, 30),

	emoji_select_menu = Color(18, 18, 18),
	emoji_select_menu_selected = Color(200, 200, 200, 1),
})

SUI.AddToTheme("Blur", {
	settings = Color(200, 200, 200),
	settings_hover = Color(65, 185, 255),
	settings_press = Color(255, 255, 255, 30),

	emoji_select_menu = Color(50, 50, 50, 230),
	emoji_select_menu_selected = Color(40, 40, 40),
})
--PATH addons/sl_util_atm/lua/batm_scenes/addmember.lua:
--[[-------------------------------------------------------------------------
Allows you to select a member to add to your group
---------------------------------------------------------------------------]]

surface.CreateFont( "batm_addmember_small", {
	font = "Coolvetica",
	extended = false,
	size = 45,
	weight = 300,
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
	outline = false,
} )

local scene = {}
scene.page = 1
local ScrW = 1024 
local ScrH = 676
--Called when the scene is loaded
function scene.Load(ent)
	scene.page = 1 --Reset page
	scene.maxpage = math.ceil(player.GetCount() / 10)

	scene.SetUpButton(ent)
end

--This is used so that when the user changes page we can clear the buttons and re-create them
function scene.SetUpButton(ent)
	ent:ClearButtons()

	--Offline user button
	ent:AddButton(ScrW/2 - 100, 585, 200, 50,
		function() --On pressed
			ent:SetScene("transfer_offline")
		end
	)

	--Previous buttons
	ent:AddButton(ScrW/2 - 350, 585, 150, 50, 
		function() --On Pressed
			if scene.page > 1 then
				scene.page = scene.page - 1
				scene.SetUpButton(ent) --setup buttons
			end
		end
	)

	--Next buttons
	ent:AddButton(ScrW/2 + 350 - 150, 585, 150, 50,
		function() --On Pressed
			if scene.page < scene.maxpage  then
				scene.page = scene.page + 1
				scene.SetUpButton(ent) --setup buttons
			end
		end
	)

	--back button
	ent:AddButton(35, 135, 64, 64, 
		function() --On pressed
			ent:SetScene("members")
		end
	)

	--Now add the buttons for the acctualy rows
	local yOffset = 135
	local players = player.GetAll()
	--Show previous history
	for i = 1 , 10 do
		local index = ((scene.page -1) * 10) + i

		--Skip if no history exists
		if players[index] == nil then continue end
 
		--Add the button
		ent:AddButton(ScrW/2 - 350, yOffset, 700, 40, function()
			local ply = players[index]
			--Attempt to add this member
			
			ent:SetScene("loading")
			timer.Simple(1, function()
				BATM.AddUser(ent, ply)
			end)
		end)

		--add to offset
		yOffset = yOffset + 45
	end 
end

local back = Material("bluesatm/back.png", "noclamp smooth")

--Draw code
function scene.Draw(ent, ScrW, ScrH)

	local account = BATM.GetActiveAccount()
	if account == nil then return end --This should not happen but just incase

	scene.maxpage = math.ceil(player.GetCount() / 10)
	if scene.page > scene.maxpage then scene.page = scene.maxpage end --Dont allow pages that dont exist

	--Draw the background
	BATM.Scenes["background"].Draw(ent, ScrW, ScrH)

	--Draw back button
	surface.SetDrawColor(Color(255,255,255,100))
	surface.SetMaterial(back)
	surface.DrawTexturedRect(35, 135, 64, 64)

	draw.SimpleText(BATM.Lang["Select a user to add."],"batm_addmember_small", ScrW/2, 585 + 25, Color(255,255,255,255),1, 1)

	local yOffset = 135
	local players = player.GetAll()
	--Show previous history
	for i = 1 , 10 do
		local index = ((scene.page -1) * 10) + i

		--Skip if no history exists
		if players[index] == nil then continue end

		--draw a transaction
		local color = Color(52, 73, 94)
		if i%2 == 0 then
			color = Color(52 * 1.1, 73 * 1.1, 94 * 1.1)
		end
		draw.RoundedBox(0,ScrW/2 - 350, yOffset, 700, 40, color)

		draw.SimpleText(players[index]:Name(), "batm_transfer_large",ScrW/2 - 350 + 10, yOffset + 20, Color(255,255,255, 230), 0, 1)
		draw.SimpleText("#"..(players[index]:SteamID64() or "????????????????"), "batm_transfer_small",ScrW/2 + 350 - 10, yOffset + 20, Color(255,255,255, 100), 2, 1)

		--add to offset
		yOffset = yOffset + 45
	end 

	--Draw next and previous buttons
	if scene.page > 1 then 
		draw.RoundedBox(0, ScrW/2 - 350, 585, 150, 50,Color(52, 73, 94))
		draw.SimpleText(BATM.Lang["Previous"], "batm_transfer_med",ScrW/2 - 350 + 75, 585 + 25, Color(255,255,255,220), 1, 1)
	else
		draw.RoundedBox(0, ScrW/2 - 350, 585, 150, 50,Color(52, 73, 94, 80))
		draw.SimpleText(BATM.Lang["Previous"], "batm_history_med",ScrW/2 - 350 + 75, 585 + 25, Color(255,255,255,30), 1, 1)
	end

	if scene.page < scene.maxpage then 
		draw.RoundedBox(0, ScrW/2 + 350 - 150, 585, 150, 50,Color(52, 73, 94))
		draw.SimpleText(BATM.Lang["Next"], "batm_history_med",ScrW/2 + 350 - 75, 585 + 25, Color(255,255,255,220), 1, 1)
	else
		draw.RoundedBox(0, ScrW/2 + 350 - 150, 585, 150, 50,Color(52, 73, 94, 80))
		draw.SimpleText(BATM.Lang["Next"], "batm_history_med",ScrW/2 + 350 - 75, 585 + 25, Color(255,255,255,30), 1, 1)
	end

	--Draw the cursor
	BATM.Scenes["cursor"].Draw(ent, ScrW, ScrH)

end

--Think code (dt = FrameTime())
function scene.Think(ent, dt)

end

--Called when the scene is unloaded
function scene.Unload(ent, newSceneName)

end

--Register the scene
BATM.RegisterScene(scene, "addmember")

--PATH lua/catmullromcams/cl_tab.lua:

function CatmullRomCams.CL.Tab()
	return spawnmenu.AddToolTab("CRCCams", "CRCCams", "gui/silkicons/camera")
end
hook.Add("AddToolMenuTabs", "CatmullRomCams.CL.Tab", CatmullRomCams.CL.Tab)

--PATH lua/catmullromcams/stools/sh_numpad_trigger.lua:
local STool = {}
  
local function BuildBitFlagMessage(keys)
	local key_data = 0
	
	for k, v in pairs(keys) do
		key_data = key_data + (2 ^ k)
	end
	print("Key data: ", key_data)
	return key_data
end

local function ExtractBitFlagMessage(key_data)
	local keys = {}
	
	for i = 15, 1, -1 do
		local bin_flag = 2 ^ i
		
		if (key_data and bin_flag) == bin_flag then
			key_data = key_data - bin_flag
			
			keys[i] = i
		end
	end
	
	return keys
end 

CatmullRomCams.SToolMethods.NumPadTrigger = STool

function STool.LeftClick(self, trace)
	if not self:ValidTrace(trace) then return end
	if not SERVER then return true end
	
	local key_data = self:GetClientNumber("keys")
	
	trace.Entity.OnNodeTriggerNumPadKey = {Keys = ExtractBitFlagMessage(key_data), Hold = (self:GetClientNumber("hold") == 1)}
	
	return true
end

function STool.RightClick(self, trace)
	if not self:ValidTrace(trace) then return end
	if CLIENT then return true end
	if not trace.Entity.OnNodeTriggerNumPadKey then return end
	
	self:GetOwner():SendLua("CatmullRomCams.SToolMethods.NumPadTrigger.CopyNumPadSettings(" .. BuildBitFlagMessage(trace.Entity.OnNodeTriggerNumPadKey.Keys) .. ");\n")
	
	return true
end

function STool.CopyNumPadSettings(key_data)
	return STool.CtrlNumPadMulti:SetupKeys(ExtractBitFlagMessage(key_data))
end

function STool.Reload(self, trace)
	if not self:ValidTrace(trace) then return end
	if not SERVER then return true end
	
	trace.Entity.OnNodeTriggerNumPadKey = nil
	
	return true
end

function STool.Think(self)
	if SERVER then return end
	
	local ply = LocalPlayer()
	local tr = ply:GetEyeTrace()
	
	if not self:ValidTrace(tr) then return end
	if not tr.Entity.OnNodeTriggerNumPadKey then return end
	
	--AddWorldTip(tr.Entity:EntIndex(), "Key To Trigger: " .. tostring(tr.Entity.OnNodeTriggerNumPadKey), 0.5, tr.Entity:GetPos(), tr.Entity)
end

function STool.BuildCPanel(panel)
	STool.CtrlNumPadMulti = vgui.Create("CtrlNumPadMulti", panel) -- DNumPadMulti
	STool.CtrlNumPadMulti:SetLabel("Keys To Trigger Then Node Is Reached: ")
	STool.CtrlNumPadMulti:SetConVar("catmullrom_camera_numpad_trigger_keys")
	panel:AddPanel(STool.CtrlNumPadMulti)
	
	panel:AddControl("CheckBox", {Label = "Hold Key", Description = "Should the just toggle the key or should it press it and then release it? (Careful with this!)", Command = "catmullrom_camera_numpad_trigger_hold"})
end


--PATH addons/realistichandcuffs/lua/autorun/sh_loadrhandcuffs.lua:

print("////////////////////////////////////////////")
print("//Loading Realistic Handcuffs System Files//")
print("// www.scriptfodder.com/scripts/view/2979 //")
print("//         Created by ToBadForYou         //")
print("////////////////////////////////////////////")
if SERVER then
	include("tbfy_rhandcuffs/sh_rhandcuffs_config.lua")
	AddCSLuaFile("tbfy_rhandcuffs/sh_rhandcuffs_config.lua")
	include("tbfy_rhandcuffs/sh_rhandcuffs_languages.lua")
	AddCSLuaFile("tbfy_rhandcuffs/sh_rhandcuffs_languages.lua")
	
	include("tbfy_rhandcuffs/sv_rhandcuffs.lua")
	include("tbfy_rhandcuffs/sh_rhandcuffs.lua")
	include("tbfy_rhandcuffs/sv_rhandcuffs_npc.lua")
	
	AddCSLuaFile("tbfy_rhandcuffs/sh_rhandcuffs.lua")
	AddCSLuaFile("tbfy_rhandcuffs/cl_rhandcuffs.lua")
	AddCSLuaFile("tbfy_rhandcuffs/cl_rhandcuffs_npc.lua")
elseif CLIENT then
	include("tbfy_rhandcuffs/sh_rhandcuffs_config.lua")
	include("tbfy_rhandcuffs/sh_rhandcuffs_languages.lua")
	include("tbfy_rhandcuffs/sh_rhandcuffs.lua")
	include("tbfy_rhandcuffs/cl_rhandcuffs.lua")
	include("tbfy_rhandcuffs/cl_rhandcuffs_npc.lua")
end
--PATH addons/realistichandcuffs/lua/tbfy_rhandcuffs/languages/dutch.lua:
//Translated by: DJReFor http://steamcommunity.com/id/djrefor/
RHandcuffsConfig.Language =  RHandcuffsConfig.Language or {}
RHandcuffsConfig.Language["Dutch"] = {
CuffedBy = "Je bent geboeid door: %s",
Cuffer = "Je hebt %s succesvol geboeid.",
ReleasedBy = "Je bent vrijgelaten door: %s",
Releaser = "Je hebt %s succesvol vrijgelaten.",
 
CantEnterVehicle = "Je kan geen voertuig betreden wanneer je geboeid bent!",
CantLeaveVehicle = "Je kan het voertuig niet verlaten wanneer je geboeid bent!",
CantSpawnProps = "Je kan geen props spawnen wanneer je geboeid bent!",
CantChangeTeam = "Je kan niet van team veranderen wanneer je geboeid bent.",
CantSwitchSeat = "Je kan niet van stoel verwisselen wanneer je geboeid bent.",
 
ConfiscateReward = "Je hebt $%s gekregen voor het confisceren van het wapen.",
ArrestReward = "Je hebt $%s gekregen voor het arresteren van %s.",
AlreadyArrested = "Deze speler is al gearresteerd!",
MustBeCuffed = "De speler moet geboeid zijn om te arresteren!",
ReqLockpick = "Lockpick de handboeien om de speler vrij te laten!",

PlayerPutInDriver = "Player was put in driver seat.",
CantCuffRestrained = "Je kan geen ingehouden speler arresteren.",
NoSeats = "Geen stoelen beschikbaar!",
CuffingText = "Aan het boeien: %s",
TazedPlayer = "Getazede Speler",
 
CuffedText = "Je bent geboeid!",
SurrenderedText = "Je hebt jezelf over gegeven!",
}
--PATH addons/newera_reroll/lua/autorun/sh_seefox_reroll.lua:
Seefox_Reroll = Seefox_Reroll or {}

-- Seefox_Reroll.Key = KEY_H

Seefox_Reroll.Shop = "https://new-era-community.fr/shop"

Seefox_Reroll.Drops = {
    ["common"] = 74,
    ["rare"] = 18,
    ["epic"] = 5.5,
    ["legendary"] = 2.3,
    ["mythical"] = 0.15,
    ["unique"] = 0.05,
}

Seefox_Reroll.Rarities = {
    ["common"] = "commune",
    ["rare"] = "rare",
    ["epic"] = "épique",
    ["legendary"] = "légendaire",
    ["mythical"] = "mythique",
    ["unique"] = "unique",
}

Seefox_Reroll.Rerolls = {
    ["classe"] = {
        {
            name = "Healer",
            icon = Material("seefox/newera/reroll/healer.png", "smooth clamp"),
            rarity = "rare",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "healer",false)
                ply:SetNWString("Classe", "healer")
            end
        },
        {
            name = "Assassin",
            icon = Material("seefox/newera/reroll/assassin.png", "smooth clamp"),
            rarity = "epic",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "assassin",false)
                ply:SetNWString("Classe", "assassin")
            end
        },
        {
            name = "Tank",
            icon = Material("seefox/newera/reroll/tank.png", "smooth clamp"),
            rarity = "common",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "tank",false)
                ply:SetNWString("Classe", "tank")
            end
        },
        {
            name = "Prêtre",
            icon = Material("seefox/newera/reroll/priest.png", "smooth clamp"),
            rarity = "epic",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "pretre",false)
                ply:SetNWString("Classe", "pretre")
            end
        },
        {
            name = "Executeur",
            icon = Material("seefox/newera/reroll/executor.png", "smooth clamp"),
            rarity = "legendary",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "exécuteur",false)
                ply:SetNWString("Classe", "exécuteur")
            end
        },
        {
            name = "Mage",
            icon = Material("seefox/newera/reroll/mage.png", "smooth clamp"),
            rarity = "legendary",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "mage",false)
                ply:SetNWString("Classe", "mage")
            end
        },
        {
            name = "Guerrier",
            icon = Material("seefox/newera/reroll/warrior.png", "smooth clamp"),
            rarity = "common",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "guerrier",false)
                ply:SetNWString("Classe", "guerrier")
            end
        },
        {
            name = "Moine",
            icon = Material("seefox/newera/reroll/monk.png", "smooth clamp"),
            rarity = "mythical",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "moine",false)
                ply:SetNWString("Classe", "moine")
            end
        },
        {
            name = "Gardien",
            icon = Material("seefox/newera/reroll/guardian.png", "smooth clamp"),
            rarity = "epic",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "gardien",false)
                ply:SetNWString("Classe", "gardien")
            end
        },
        {
            name = "Chevalier",
            icon = Material("seefox/newera/reroll/knight.png", "smooth clamp"),
            rarity = "legendary",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "chevalier",false)
                ply:SetNWString("Classe", "chevalier")
            end
        },
        {
            name = "Archi-Mage",
            icon = Material("seefox/newera/reroll/mystery.png", "smooth clamp"),
            rarity = "unique",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "archi_mage",false)
                ply:SetNWString("Classe", "archi_mage")
            end
        },
        {
            name = "Vampire",
            icon = Material("seefox/newera/reroll/mystery.png", "smooth clamp"),
            rarity = "unique",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "vampire",false)
                ply:SetNWString("Classe", "vampire")
            end
        },
        {
            name = "Bestial",
            icon = Material("seefox/newera/reroll/mystery.png", "smooth clamp"),
            rarity = "unique",
            func = function(ply)
                SaveData(ply,"SLSaves", "classe", "bestial",false)
                ply:SetNWString("Classe", "bestial")
            end
        },
        /*{
            name = "Mystère",
            icon = Material("seefox/newera/reroll/mystery.png"),
            rarity = "unique",
            func = function(ply)
                if math.random(1, 2) == 1 then
                    -- vampire
                    ply:ChatPrint("Vous avez reroll le prêtre légendaire !")
                else
                    -- archi mage
                    ply:ChatPrint("Vous avez reroll le prêtre légendaire !")
                end
            end
        },*/
    },
    -- ["magic"] = {}
    ["rang"] = {
        {
            name = "E",
            chance = 35, -- 50
            func = function(ply)
                SaveData(ply,"SLSaves", "rang", "E",false)
                ply:SetNWString("Rang", "E")
            end
        },
        {
            name = "D",
            chance = 45, -- 30
            func = function(ply)
                SaveData(ply,"SLSaves", "rang", "D",false)
                ply:SetNWString("Rang", "D")
            end
        },
        {
            name = "C",
            chance = 15,
            func = function(ply)
                SaveData(ply,"SLSaves", "rang", "C",false)
                ply:SetNWString("Rang", "C")
            end
        },
        {
            name = "B",
            chance = 4,
            func = function(ply)
                SaveData(ply,"SLSaves", "rang", "B",false)
                ply:SetNWString("Rang", "B")
            end
        },
        {
            name = "A",
            chance = 0.09,
            func = function(ply)
                SaveData(ply,"SLSaves", "rang", "A",false)
                ply:SetNWString("Rang", "A")
            end
        },
        {
            name = "S",
            chance = 0.01,
            func = function(ply)
                SaveData(ply,"SLSaves", "rang", "S",false)
                ply:SetNWString("Rang", "S")
            end
        },
    },
}
--PATH addons/tlib/lua/tlib/config.lua:
TLib.Cfg.DefaultCurrency = "$"                                      -- Default currency (for non-registered gamemodes)
TLib.Cfg.Use24hCycle = true                                         -- true: use 24h cycle, false: use 12h cycle
TLib.Cfg.Max2DSounds = 5                                            -- Maximum amount of 2D sounds playable at the same time
TLib.Cfg.OverrideGMNotifs = false                                   -- true: TLib notif design will be used when TLib:Notify is called, false: Only used for gamemode compatibility

--[[

    Colors

]]--

TLib.Cfg.Colors = {
    [ 0 ] = Color( 22, 23, 27 ),                                    -- Background
    [ 1 ] = Color( 29, 30, 34 ),                                    -- Container
    [ 2 ] = Color( 76, 82, 85 ),                                    -- Highlight
    [ 3 ] = Color( 46, 204, 113 ),                                  -- Positive
    [ 4 ] = Color( 255, 65, 67 ),                                   -- Negative
    [ 5 ] = Color( 236, 240, 241 ),                                 -- Text
    [ 6 ] = Color( 46, 204, 113 ),                                  -- Main
    [ 7 ] = Color( 0, 0, 0, 150 )                                   -- Shadow
}
--PATH addons/tlib/lua/tlib/client/functions.lua:
TLib.tNotifPanels = ( TLib.tNotifPanels or {} )
local tPlayedSounds = {}

--[[-------------------------------------------------------------------------------------------------------------------------

    NOTIFY FUNCTIONS

-------------------------------------------------------------------------------------------------------------------------]]--

--[[

    TLib:Notify

]]--

function TLib:Notify( sNotif, iType, iLen )
    local dNotif = vgui.Create( "TLNotify" )
    if not IsValid( dNotif ) then
        return
    end

    dNotif:SetText( string.Trim( sNotif or "" ) )
    dNotif:SetNotificationType( ( iType or 0 ) )
    dNotif:SetNotificationTime( ( iLen or 3 ) )
    dNotif:SetNotificationLayout()

    table.insert( self.tNotifPanels, dNotif )
end

-- Override all notifs with TLib's notifs
if TLib.Cfg.OverrideGMNotifs then
    function notification.AddLegacy( sNotif, iType, iLen )
        return TLib:Notify( sNotif, iType, iLen )
    end
end

--[[-------------------------------------------------------------------------------------------------------------------------

    SOUND RELATED FUNCTIONS

-------------------------------------------------------------------------------------------------------------------------]]--

--[[

    TLib:Get2DSound
        Params: Sound ID (number)
        Return: Sound object (CSound)

]]--

function TLib:Get2DSound( iID )
    return tPlayedSounds[ iID ]
end

--[[

    TLib:Stop2DSound
        Params: Sound ID (number) {If no ID is passed all 2D sounds will be stopped}
        Return: Success (boolean)

]]--

function TLib:Stop2DSound( iID )
    if not iID then
        for k, v in ipairs( tPlayedSounds ) do
            v:Stop()
        end

        tPlayedSounds = {}
        return true
    end

    local CSound = self:Get2DSound( iSound )
    if not CSound then
        return
    end

    CSound:Stop()
    return true
end

--[[

    TLib:Play2DSound
        Desc: Plays a sound locally, can handle up to TLib.Cfg.Max2DSounds sounds at the same time
        Params: Sound path (string), Volume (number)
        Return: {On fail: nil, On sucess: Sound object (CSound), Sound ID (number)}

]]--

function TLib:Play2DSound( sPath, iVolume )
    if not sPath or not isstring( sPath ) or not IsValid( LocalPlayer() ) then
        return
    end

    local iCount = table.Count( tPlayedSounds )
    local iSound = math.Clamp( ( iCount + 1 ), 1, ( self.Cfg.Max2DSounds + 1 ) )

    if ( iSound > self.Cfg.Max2DSounds ) then
        iSound = 1
    end

    local CSound = self:Get2DSound( iSound )
    if CSound then
        CSound:Stop()
    end

    CSound = CreateSound( LocalPlayer(), ( sPath or "" ) )
    CSound:PlayEx( ( iVolume or 1 ), 100 )

    tPlayedSounds[ iSound ] = CSound

    return CSound, iSound
end
--PATH addons/sl_utils/lua/autorun/sh_vmenu.lua:
--[[ 
	 _    __      ____              _     _          __  ___                
	| |  / /___ _/ / /____  _______(_)__ ( )_____   /  |/  /__  ____  __  __
	| | / / __ `/ / //_/ / / / ___/ / _ \|// ___/  / /|_/ / _ \/ __ \/ / / /
	| |/ / /_/ / / ,< / /_/ / /  / /  __/ (__  )  / /  / /  __/ / / / /_/ / 
	|___/\__,_/_/_/|_|\__, /_/  /_/\___/ /____/  /_/  /_/\___/_/ /_/\__,_/  
	                 /____/                                                 
	v2.0
]]--

g_vMenuVer = "2.0"
g_vMenuAddons = g_vMenuAddons or {}

if (SERVER) then
	AddCSLuaFile( "sh_vmenu.lua" )
end

if (CLIENT) then
	function ScaleToWideScreen( size )
		return math.min(math.max( ScreenScale(size / 2.62467192), math.min(size, 14) ), size)
	end

	surface.CreateFont( "VAddonsCredits",  {font='Roboto Condensed', size=ScaleToWideScreen(22), weight=500, antialias=true, additive=false})
	surface.CreateFont( "VAddonsHeader",  {font='Roboto Condensed', size=ScaleToWideScreen(26), weight=500, antialias=true, additive=false})
	surface.CreateFont( "VAddonsMenuBar",  {font='Roboto Condensed', size=ScaleToWideScreen(20), weight=500, antialias=true, additive=false})
	
	local TitleBarSize = 35
	list.Set( "DesktopWindows", "GmodLegsEditor", 
	{
		title		= "VAddons",
		icon		= "icon64/playermodel.png",
		width	   	= 960,
		height	  	= 700,
		onewindow   = true,
		init		= function( icon, window )

			window:SetTitle("")
			window.Paint = function()
				draw.RoundedBox(0, 0, 0, window:GetWide(), window:GetTall(), Color( 37, 37, 37, 255 ) )
				draw.RoundedBox(0, 0, 0, window:GetWide(), TitleBarSize, Color( 50, 50, 50, 255 ))
				draw.SimpleText("Valkyrie's Addons", "VAddonsMenuBar", window:GetWide()/2, TitleBarSize/2 -2, Color(142, 142, 142), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)	
			end

			local tabs = vgui.Create( "DPropertySheet", window )
			tabs.Paint = function(this, w, h)
				draw.RoundedBox(0, 0, 0, w, h, Color( 37, 37, 37, 255 ) )
			end
			tabs.AddSheet = function(this, label, panel, material, NoStretchX, NoStretchY, Tooltip )
				if ( !IsValid( panel ) ) then
					ErrorNoHalt( "DPropertySheet:AddSheet tried to add invalid panel!" )
					debug.Trace()
					return
				end

				local Sheet = {}

				Sheet.Name = label

				Sheet.Tab = vgui.Create( "DTab", this )
				Sheet.Tab.Paint = function(_tab, w, h)
					if ( _tab:IsActive() ) then
						draw.RoundedBox(0, 0, 0, w, h, Color( 30, 30, 30 ) )
						return
					end
					draw.RoundedBox(0, 0, 0, w, h, Color( 45, 45, 45 ) )
				end
				Sheet.Tab.GetTabHeight = function(_tab, w, h)
					return 48
				end

				Sheet.Tab:Setup( label, this, panel, material )

				Sheet.Panel = panel
				Sheet.Panel.NoStretchX = NoStretchX
				Sheet.Panel.NoStretchY = NoStretchY
				Sheet.Panel:SetPos( this:GetPadding(), 20 + this:GetPadding() )
				Sheet.Panel:SetVisible( false )

				panel:SetParent( this )

				table.insert( this.Items, Sheet )

				if ( !this:GetActiveTab() ) then
					this:SetActiveTab( Sheet.Tab )
					Sheet.Panel:SetVisible( true )
				end

				this.tabScroller:AddPanel( Sheet.Tab )

				return Sheet
			end
			tabs:SetPos(0, TitleBarSize)
			tabs:SetSize(window:GetWide(), window:GetTall() - TitleBarSize)
			tabs:SetPadding(0)
			
			hook.Run( "GetVMenuTabs", window, tabs )	
		end
	} )
end	
--PATH addons/simplistic_presentation/lua/simplistic_presentation/client/cl_functions.lua:
-- Responsive functions (made by @wasied)
function RX(x)
    return x / 1920 * ScrW()
end

function RY(y)
    return y / 1080 * ScrH()
end

-- Create rows for each known player, in the manage panel
function SimplisticPresentation:ManagePanelKnownRows(sName, sId, vContainer, tKnown, iPos)

    local vRow = vgui.Create("DButton", vContainer)
    vRow:Dock(TOP)
    vRow:DockMargin(RX(10), RY(10), RX(10), RY(10))
    vRow:SetSize(RX(50), RY(50))
    vRow:SetText("")
    vRow:SetAlpha(0)

    vRow:AlphaTo(255, 0.3, 0.4)

    function vRow:Paint(w, h)
        if self:IsHovered() then

            surface.SetDrawColor(SimplisticPresentation.Constants.cColors["cHeader"])
            surface.SetMaterial(SimplisticPresentation.Constants["mUi"]["mGradient"])
            surface.DrawTexturedRect(0, 0, w, h)
        else
            draw.RoundedBoxEx(8, 0, 0, w, RY(50), SimplisticPresentation.Constants.cColors["cHeader"], false, true, false, true)
        end
        draw.SimpleText("• " .. sName, "SimplisticPresentation:Font:Subtitle", RX(50), RY(5), SimplisticPresentation.Constants.cColors["cText"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    end

    function vRow:OnCursorEntered()
        LocalPlayer():EmitSound("garrysmod/ui_hover.wav")
    end

    function vRow:DoClick()
        LocalPlayer():EmitSound("garrysmod/ui_click.wav")
        SetClipboardText(sId)
        chat.AddText(SimplisticPresentation.Constants["cColors"]["cBackground"], SimplisticPresentation.Config.sChatPrefix .. " " , SimplisticPresentation.Constants["cColors"]["cText"], SimplisticPresentation:GetSentence("ManagePanel:CopyIdentifier"):format(sName))
    end

    local vAvatar = vgui.Create("AvatarMaterial", vRow)
    vAvatar:SetSize(RX(40), RY(40))
    vAvatar:SetPos(RX(5), RY(5))
    vAvatar:SetSteamID64(sId)

    local vButton = vgui.Create("DButton", vRow)
    vButton:SetSize(RX(50), RY(50))
    vButton:SetPos(RX(570), RY(0))
    vButton:SetText("")
    vButton:SetFont("SimplisticPresentation:Font:Subtitle")
    vButton:SetTextColor(SimplisticPresentation.Constants.cColors["cText"])

    function vButton:Paint(w, h) 
        draw.SimpleText("⨯", "SimplisticPresentation:Font:Subtitle", w / 2, h / 2 - RY(5), SimplisticPresentation.Constants["cColors"]["cText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    function vButton:DoClick()
        LocalPlayer():EmitSound("garrysmod/ui_click.wav")

        table.remove(tKnown, iPos)

        net.Start("SimplisticPresentation:AdminMenu:RemoveKnownPlayer")
            net.WriteString(sId)
            net.WriteString(LocalPlayer():SteamID64())
            net.WriteString(sName)
            net.WriteUInt(1, 2)
        net.SendToServer()

        vRow:Remove()

    end

end

-- Create rows for each known player, in the player row, in the admin panel
function SimplisticPresentation:AdminMenuKnownRows(sName, sToRemoveId, sSelectedUserId, vContainer, tKnown, iPos)

    local vRoundedPanel = vgui.Create( "DPanel", vContainer )
    vRoundedPanel:SetSize(RX(398), RY(45))
    vRoundedPanel:Dock(TOP)
    vRoundedPanel:DockMargin(0, RY(2.5), 0, 0)

    function vRoundedPanel:Paint(w, h) 
        draw.RoundedBox(8, RX(15), RY(0), w - RX(30), h - RY(10), SimplisticPresentation.Constants["cColors"]["cHeader"])
        draw.SimpleText(#sName >= 18 and string.sub(sName, 1, 12) .. "..." or sName, "SimplisticPresentation:Font:Subtitle", RX(150), h / 2 - RY(5), SimplisticPresentation.Constants["cColors"]["cText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local vRemoveButton = vgui.Create( "DButton", vRoundedPanel )
    vRemoveButton:SetSize(RX(35), RY(35))
    vRemoveButton:SetPos(RX(250), RY(0))
    vRemoveButton:SetText("")
    vRemoveButton:SetFont("SimplisticPresentation:Font:Subtitle")
    vRemoveButton:SetColor(SimplisticPresentation.Constants["cColors"]["cText"])

    function vRemoveButton:Paint(w, h) 
        draw.SimpleText("⨯", "SimplisticPresentation:Font:Subtitle", w / 2, h / 2 - RY(5), SimplisticPresentation.Constants["cColors"]["cText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    function vRemoveButton:DoClick()
        LocalPlayer():EmitSound("garrysmod/ui_click.wav")

        table.remove(tKnown, iPos)

        net.Start("SimplisticPresentation:AdminMenu:RemoveKnownPlayer")
            net.WriteString(sToRemoveId)
            net.WriteString(sSelectedUserId)
            net.WriteString(sName)
            net.WriteUInt(2, 2)
        net.SendToServer()

        vRoundedPanel:Remove()

    end

end

-- Create rows for each player in the admin panel
function SimplisticPresentation:AdminMenuRows(pPlayer, Panel, vContainer)

    if not IsValid(pPlayer) then return end

    local vRow = vgui.Create("DButton", Panel)
    vRow:Dock(TOP)
    vRow:DockMargin(RX(10), RY(10), RX(10), RY(10))
    vRow:SetSize(RX(50), RY(50))
    vRow:SetText('')
    vRow:SetAlpha(0)

    vRow:AlphaTo(255, 0.3, 0.4)

    function vRow:Paint(w,h)
        if self:IsHovered() and not SimplisticPresentation.AdminPanel.vRowToggle then
            surface.SetDrawColor(SimplisticPresentation.Constants.cColors["cHeader"])
            surface.SetMaterial(SimplisticPresentation.Constants["mUi"]["mGradient"])
            surface.DrawTexturedRect(0, 0, w, RX(50))
        else
            draw.RoundedBoxEx(8, 0, 0, w, RY(50), SimplisticPresentation.Constants.cColors["cHeader"], false, true, false, true)
        end

        draw.SimpleText("• " .. pPlayer:Nick(), "SimplisticPresentation:Font:Subtitle", RX(50), RY(22.5), SimplisticPresentation.Constants['cColors']["cText"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    function vRow:OnCursorEntered()
        LocalPlayer():EmitSound("garrysmod/ui_hover.wav")
    end

    function vRow:DoClick()
        if SimplisticPresentation.AdminPanel.vRowToggle then
            if IsValid(SimplisticPresentation.AdminPanel.vKnoweldgesContainer) then
                SimplisticPresentation.AdminPanel.vKnoweldgesContainer:SizeTo(RX(300), RY(0), #SimplisticPresentation.AdminPanel.vKnoweldgesContainer:GetChildren() == 0 and 0 or .5, 0, -0.5, function()
                    SimplisticPresentation.AdminPanel.vKnoweldgesContainer:Remove()
                    vRow:SizeTo(vRow:GetWide(), RY(50), .5, 0, -0.5, function()
                        SimplisticPresentation.AdminPanel.vRowToggle = false
                    end)
                end)
            end


        else
            LocalPlayer():EmitSound("garrysmod/ui_click.wav")

            vRow:SizeTo(vRow:GetWide(), RY(100), .5, 0, -0.5)
            SimplisticPresentation.AdminPanel.vRowToggle = true

            local vDownPanel = vgui.Create("DPanel", vRow)
            vDownPanel:SetSize(vRow:GetWide() - RX(200), RY(50))
            vDownPanel:SetPos(RX(100), RY(50))

            function vDownPanel:Paint(w,h)
                draw.RoundedBoxEx(8, RX(0), RY(0), w, h, SimplisticPresentation.Constants.cColors["cHeader"], false, false, true, true)
                draw.RoundedBoxEx(8, RX(5), RY(0), w - RX(10), h - RY(5), SimplisticPresentation.Constants.cColors["cBackground"], false, false, true, true)
            end

            SimplisticPresentation.AdminPanel.vRow = vRow
            SimplisticPresentation.AdminPanel.vDownPanel = vDownPanel

            net.Start("SimplisticPresentation:AdminMenu:GetKnownByWho")
                net.WriteEntity(pPlayer)
            net.SendToServer()

        end
    end

    local vAvatar = vgui.Create('AvatarImage', vRow)
    vAvatar:SetSize(RX(40), RY(40))
    vAvatar:SetPos(RX(5), RY(5))
    vAvatar:SetPlayer(pPlayer)

    return vContainer:AddItem(vRow)
end

-- Open the manage panel
function SimplisticPresentation:OpenManagePanel()

    if IsValid(SimplisticPresentation.ManagePanel) then
        SimplisticPresentation.ManagePanel:Remove()
    end

    local vAFrame = vgui.Create('DFrame')
    vAFrame:SetSize(RX(0), RY(0))
    vAFrame:Center()
    vAFrame:SetTitle('')
    vAFrame:MakePopup()
    vAFrame:ShowCloseButton(false)
    vAFrame:SetDraggable(false)

    function vAFrame:Paint(w,h)

        local sText = "• " .. SimplisticPresentation:GetSentence("ManagePanel:MainText")
        surface.SetFont('SimplisticPresentation:Font:Title')
        local iTextSize = surface.GetTextSize(sText)
        local iRealWide = RX(700)

        draw.RoundedBox(8, RX(7.5), RY(0), w - RX(15),h - RY(60), SimplisticPresentation.Constants.cColors["cBackground"])
        draw.RoundedBox(8, RX(0), RY(0), self:GetWide(), RY(75), SimplisticPresentation.Constants.cColors["cHeader"])

        surface.SetDrawColor(color_white)
        surface.SetMaterial(SimplisticPresentation.Constants["mUi"]["mUser"])
        surface.DrawTexturedRect((iRealWide - iTextSize) / 2 - RX(40), RY(10), RX(55), RY(55))

        draw.SimpleText(sText, "SimplisticPresentation:Font:Title", (iRealWide + RX(55)) / 2, RY(35),SimplisticPresentation.Constants.cColors["cText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    end

    SimplisticPresentation.ManagePanel = vAFrame

    vAFrame.bIsAnimating =  true

    local vCloseButton = vgui.Create("DButton", vAFrame)
    vCloseButton:SetPos(RX(0), RY(0))
    vCloseButton:SetSize(RX(700), RY(75))
    vCloseButton:SetText('')

    function vCloseButton:OnCursorEntered()
        LocalPlayer():EmitSound("garrysmod/ui_hover.wav")
    end

    function vCloseButton:Paint(w, h) end

    function vCloseButton:DoClick()
        LocalPlayer():EmitSound("garrysmod/ui_click.wav")
        if IsValid(SimplisticPresentation.ManagePanel) then

            vAFrame:SetMouseInputEnabled(false)
            vAFrame:SetKeyboardInputEnabled(false)

            vAFrame.bIsAnimating =  true

            vAFrame:SizeTo(RX(0), RY(0), 1.8, 0, .1, function()
                vAFrame.bIsAnimating =  false
                SimplisticPresentation.ManagePanel:Remove()
            end)

        end
    end

    local vSearchButton = vgui.Create("DButton", vAFrame)
    vSearchButton:SetSize(RX(50), RY(50))
    vSearchButton:SetPos(RX(325), RY(440))
    vSearchButton:SetText("")

    function vSearchButton:OnCursorEntered()
        LocalPlayer():EmitSound("garrysmod/ui_hover.wav")
    end

    SimplisticPresentation.ManagePanel_vSearchButton = vSearchButton

    net.Start("SimplisticPresentation:ManagePanel:GetKnownByWho")
    net.SendToServer()

end

-- Open the admin panel
function SimplisticPresentation:OpenAdminPanel()

    if not SimplisticPresentation.Config.tAdminModeGroups[LocalPlayer():GetUserGroup()] then return end

    if IsValid(SimplisticPresentation.AdminPanel) then
        SimplisticPresentation.AdminPanel:Remove()
    end

    local vAFrame = vgui.Create('DFrame')
    vAFrame:SetSize(RX(0), RY(0))
    vAFrame:Center()
    vAFrame:SetTitle('')
    vAFrame:MakePopup()
    vAFrame:ShowCloseButton(false)
    vAFrame:SetDraggable(false)

    function vAFrame:Paint(w,h)

        local sText = "• " .. SimplisticPresentation:GetSentence("AdminMenu:MainText")
        surface.SetFont('SimplisticPresentation:Font:Title')
        local iTextSize = surface.GetTextSize(sText)
        local iWide = RX(700)

        draw.RoundedBox(8, RX(7.5), RY(0), w - RX(15),h - RY(60), SimplisticPresentation.Constants.cColors["cBackground"])
        draw.RoundedBox(8, RX(0), RY(0), self:GetWide(), RY(75), SimplisticPresentation.Constants.cColors["cHeader"])

        surface.SetDrawColor(color_white)
        surface.SetMaterial(SimplisticPresentation.Constants["mUi"]["mUser"])
        surface.DrawTexturedRect((iWide - iTextSize) / 2 - RX(40), RY(10), RX(55), RY(55))

        draw.SimpleText(sText, "SimplisticPresentation:Font:Title", (iWide + RX(55)) / 2, RY(35),SimplisticPresentation.Constants.cColors["cText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    end

    SimplisticPresentation.AdminPanel = vAFrame

    local vCloseButton = vgui.Create("DButton", vAFrame)
    vCloseButton:SetPos(RX(0), RY(0))
    vCloseButton:SetSize(RX(700), RY(75))
    vCloseButton:SetText('')

    function vCloseButton:OnCursorEntered()
        LocalPlayer():EmitSound("garrysmod/ui_hover.wav")
    end

    function vCloseButton:Paint(w, h) end

    function vCloseButton:DoClick()
        LocalPlayer():EmitSound("garrysmod/ui_click.wav")

        if IsValid(SimplisticPresentation.AdminPanel) then

            vAFrame:SetMouseInputEnabled(false)
            vAFrame:SetKeyboardInputEnabled(false)

            vAFrame.bIsAnimating =  true

            vAFrame:SizeTo(RX(0), RY(0), 1.8, 0, .1, function()
                vAFrame.bIsAnimating =  false
                SimplisticPresentation.AdminPanel:Remove()
            end)

        end
    end

    local vContainer = vgui.Create("DScrollPanel", vAFrame)
    vContainer:SetSize(RX(640), RY(320))
    vContainer:SetPos(RX(30), RY(100))
    vContainer:GetVBar():SetWide(0)

    SimplisticPresentation.AdminPanel.vContainer = vContainer

    local vSearchButton = vgui.Create("DButton", vAFrame)
    vSearchButton:SetSize(RX(50), RY(50))
    vSearchButton:SetPos(RX(325), RY(440))
    vSearchButton:SetText("")

    function vSearchButton:OnCursorEntered()
        LocalPlayer():EmitSound("garrysmod/ui_hover.wav")
    end

    function vSearchButton:Paint(w, h)
        draw.RoundedBoxEx(8, 0, 0, w, h, SimplisticPresentation.Constants.cColors["cHeader"], false, false, true, true)

        surface.SetDrawColor(255,255,255)
        surface.SetMaterial(SimplisticPresentation.Constants["mUi"]["mSearch"])
        surface.DrawTexturedRect(RX(5), RY(5), RX(40), RY(40))
    end

    SimplisticPresentation.AdminPanel.SearchIsClicked = false

    function vSearchButton:DoClick()
        vSearchButton:MoveTo(RX(200), RY(440), 0.5, 0, -1, function()
            vSearchButton:SizeTo(RX(300), RY(50), 0.5, 0, -1, function()

                vSearchButton:SetEnabled(false)

                local vTextEntry = vgui.Create("DTextEntry", vSearchButton)
                vTextEntry:SetSize(vSearchButton:GetWide() - RX(60), vSearchButton:GetTall() - RY(10))
                vTextEntry:SetPos(RX(55), RY(5))
                vTextEntry:SetUpdateOnType(true)
                vTextEntry:SetPaintBackground(false)
                vTextEntry:SetFont("SimplisticPresentation:Font:Subtitle")
                vTextEntry:SetPlaceholderText(SimplisticPresentation:GetSentence("AdminMenu:SearchText"))
                vTextEntry:SetTextColor(SimplisticPresentation.Constants.cColors["cText"])
                vTextEntry:SetDrawLanguageID(false)
                vTextEntry:RequestFocus()

                SimplisticPresentation.AdminPanel.SearchIsClicked = true

                function vTextEntry:OnChange()
                    local sValue = self:GetValue()
                    local sSafeValue = string.PatternSafe(sValue)
                    vContainer:Clear()

                    for _, pPlayer in ipairs(player.GetAll()) do

                        local sName = pPlayer:Nick()
                        local sId = pPlayer:SteamID()

                        if string.find(string.lower(sName), string.lower(sSafeValue)) or string.find(string.lower(sId), string.lower(sSafeValue)) then
                            SimplisticPresentation:AdminMenuRows(pPlayer, vAFrame, vContainer)
                        end
                    end
                end


            end)
        end)
    end

    if not SimplisticPresentation.AdminPanel.SearchIsClicked then
        vAFrame.bIsAnimating =  true
        for iId, pPlayer in ipairs( player.GetAll() ) do
            SimplisticPresentation:AdminMenuRows(pPlayer, vAFrame, vContainer)

            if iId == #player.GetAll() then
                vAFrame:SizeTo(RX(700), RY(500), 1.8, 0, .1, function()
                    vAFrame.bIsAnimating =  false
                end)
            end

        end
    end

    function vAFrame:OnSizeChanged(w, h)
        if vAFrame.bIsAnimating then
            vAFrame:Center()
        end
    end

end

-- Checking if player locally knows another player (while checking the tables in the config)
function SimplisticPresentation:IsLocallyKnown(pPlayer)

    if not IsValid(pPlayer) then return false end

    local bResult = false

    if not table.IsEmpty(SimplisticPresentation.Config.tJobsKnowByEveryone) then
        for sName, tConfig in pairs(SimplisticPresentation.Config.tJobsKnowByEveryone) do
            if tConfig.bName then
                bResult = sName == team.GetName(pPlayer:Team())
            end
        end
    end

    if not table.IsEmpty(SimplisticPresentation.Config.tJobsKnowEachOther) then
        for _, tJobs in pairs(SimplisticPresentation.Config.tJobsKnowEachOther) do

            bResult = (tJobs[team.GetName(LocalPlayer():Team())] and tJobs[team.GetName(pPlayer:Team())]) and true or bResult
        end
    end

    return bResult

end

list.Set( "DesktopWindows", "SPRManagePanel", {
    title = SimplisticPresentation:GetSentence("ManagePanel:MainText"),
    icon = SimplisticPresentation.Constants["mUi"]["mIcon"],
    init = function( icon, window )
        SimplisticPresentation:OpenManagePanel()
    end
} )

--PATH addons/sl_main_system/lua/autorun/sl_config_val.lua:
SL_Val_Config = {
    InitialMana = 100,
    Regeneration = 5,
    VitalityMultiplier = 100,
    AgilityMultiplier = 3,
    ForceMultiplier = 10,
    DefaultRank = "Aucune",
    DefaultMagie = "Aucune",
    DefaultTitre = "RIEN",
    InitialWeapons = {
        "comlink_swep",
        "cross_arms_infront_swep",
        "cross_arms_swep",
        "high_five_swep",
        "hololink_swep",
        "point_in_direction_swep",
        "salute_swep",
        "surrender_animation_swep"
    }
}
--PATH addons/gprotect_1.15.101/lua/g_protect/sh_gprotect_operators.lua:
gProtect = gProtect or {config = {}}
gProtect.config = gProtect.config or {}

gProtect.config.ModuleCoordination = {
	["general"] = -3,
	["ghosting"] = 2,
	["damage"] = 3,
	["anticollide"] = 4,
	["spamprotection"] = 5,
	["spawnrestriction"] = 6,
	["toolgunsettings"] = 7,
	["physgunsettings"] = 8,
	["gravitygunsettings"] = 9,
	["canpropertysettings"] = 10,
	["canusesettings"] = 11,
	["advdupe2"] = 12,
	["miscs"] = 13
}

gProtect.config.ModuleShouldDisplay = {
	["advdupe2"] = function()
		if !AdvDupe2 then return false end
	end,
}

gProtect.config.sortOrders = {
	["general"] = {
		["blacklist"] = 0,
		["remDiscPlyEnt"] = 2,
		["remDiscPlyEntSpecific"] = 3,
		["remOutOfBounds"] = 4,
		["remOutOfBoundsWhitelist"] = 5,
		["protectedFrozenEnts"] = 6,
		["protectedFrozenGroup"] = 7
	},

	["ghosting"] = {
		["enabled"] = 1,
		["ghostColor"] = 2,
		["antiObscuring"] = 3,
		["obscureOffset"] = 4,
		["onPhysgun"] = 5,
		["useBlacklist"] = 6,
		["entities"] = 7,
		["forceUnfrozen"] = 8,
		["forceUnfrozenEntities"] = 9,
		["enableMotion"] = 10
	},

	["damage"] = {
		["enabled"] = 1,
		["useBlacklist"] = 2,
		["entities"] = 3,
		["blacklistedEntPlayerDamage"] = 4,
		["vehiclePlayerDamage"] = 5,
		["worldPlayerDamage"] = 6,
		["immortalEntities"] = 7,
		["bypassGroups"] = 8,
		["canDamageWorldEntities"] = 9
	},

	["anticollide"] = {
		["enabled"] = 1,
		["notifyStaff"] = 2,
		["protectDarkRPEntities"] = 3,
		["DRPentitiesThreshold"] = 4,
		["DRPentitiesException"] = 5,
		["protectSpawnedEntities"] = 6,
		["entitiesThreshold"] = 7,
		["entitiesException"] = 8,
		["protectSpawnedProps"] = 9,
		["propsThreshold"] = 10,
		["propsException"] = 11,
		["playerPropAction"] = 12,
		["playerPropThreshold"] = 13,
		["useBlacklist"] = 14,
		["ghostEntities"] = 15,
		["specificEntities"] = 16,
		["squaredPhysicsMaxSize"] = 17,
		["squaredPhysicsEnts"] = 18
	},

	["spamprotection"] = {
		["enabled"] = 1,
		["threshold"] = 2,
		["delay"] = 3,
		["action"] = 4,
		["notifyStaff"] = 5,
		["protectProps"] = 6,
		["protectEntities"] = 7,
	},

	["spawnrestriction"] = {
		["enabled"] = 1,
		["propSpawnPermission"] = 2,
		["SENTSpawnPermission"] = 3,
		["SWEPSpawnPermission"] = 4,
		["vehicleSpawnPermission"] = 5,
		["NPCSpawnPermission"] = 6,
		["ragdollSpawnPermission"] = 7,
		["effectSpawnPermission"] = 8,
		["blockedEntities"] = 9,
		["blockedEntitiesIsBlacklist"] = 10,
		["blockedModels"] = 11,
		["blockedModelsisBlacklist"] = 12,
		["blockedModelsVehicleBypass"] = 13,
		["bypassGroups"] = 14,
		["maxPropModelComplexity"] = 15,
		["maxModelSize"] = 16
	},

	["toolgunsettings"] = {
		["enabled"] = 1,
		["targetWorld"] = 2,
		["targetPlayerOwned"] = 3,
		["targetPlayerOwnedProps"] = 4,
		["targetVehiclePermission"] = 5,
		["restrictTools"] = 6,
		["groupToolRestrictions"] = 7,
		["bypassGroups"] = 8,
		["entityTargetability"] = 9,
		["bypassTargetabilityTools"] = 10,
		["bypassTargetabilityGroups"] = 11,
		["antiSpam"] = 12
	},

	["physgunsettings"] = {
		["enabled"] = 1,
		["targetWorld"] = 2,
		["targetPlayerOwned"] = 3,
		["targetPlayerOwnedProps"] = 4,
		["targetPlayerOwnedPropsGroupLevel"] = 5,
		["DisableReloadUnfreeze"] = 6,
		["PickupVehiclePermission"] = 7,
		["StopMotionOnDrop"] = 8,
		["blockMultiplePhysgunning"] = 9,
		["maxDropObstructs"] = 10,
		["maxDropObstructsAction"] = 11,
		["preventPropClimbing"] = 12,
		["preventPropClimbingThreshold"] = 13,
		["preventPropClimbingAction"] = 14,
		["blockedEntities"] = 15,
		["bypassGroups"] = 16
	},

	["gravitygunsettings"] = {
		["enabled"] = 1,
		["targetWorld"] = 2,
		["targetPlayerOwned"] = 3,
		["targetPlayerOwnedProps"] = 4,
		["DisableGravityGunPunting"] = 5,
		["blockedEntities"] = 6,
		["bypassGroups"] = 7
	},

	["canpropertysettings"] = {
		["enabled"] = 1,
		["targetWorld"] = 2,
		["targetPlayerOwned"] = 3,
		["targetPlayerOwnedProps"] = 4,
		["blockedProperties"] = 5,
		["blockedPropertiesisBlacklist"] = 6,
		["blockedEntities"] = 7,
		["bypassGroups"] = 8
	},

	["canusesettings"] = {
		["enabled"] = 1,
		["targetWorld"] = 2,
		["targetPlayerOwned"] = 3,
		["targetPlayerOwnedProps"] = 4,
		["blockedEntities"] = 5,
		["blockedEntitiesisBlacklist"] = 6,
		["bypassGroups"] = 7
	},

	["advdupe2"] = {
		["enabled"] = 1,
		["notifyStaff"] = 2,
		["PreventRopes"] = 3,
		["PreventScaling"] = 4,
		["PreventNoGravity"] = 5,
		["PreventTrail"] = 6,
		["PreventUnreasonableValues"] = 7,
		["PreventUnfreezeAll"] = 8,
		["BlacklistedCollisionGroups"] = 9,
		["WhitelistedConstraints"] = 10,
		["whitelistedClasses"] = 11,
		["DelayBetweenUse"] = 12
	},

	["miscs"] = {
		["enabled"] = 1,
		["ClearDecals"] = 2,
		["blacklistedFadingDoorMats_punishment"] = 3,
		["blacklistedFadingDoorMats"] = 4,
		["FadingDoorLag"] = 5,
		["DisableReloadUnfreeze"] = 6,
		["DisableMotion"] = 7,
		["DisableMotionEntities"] = 8,
		["DisableGravityGunPunting"] = 9,
		["freezeOnSpawn"] = 10,
		["preventFadingDoorAbuse"] = 11,
		["precisionMoveFix"] = 12,
		["preventSpawnNearbyPlayer"] = 13,
		["DRPEntForceOwnership"] = 14,
		["DRPMaxObstructsOnPurchaseEnts"] = 15,
		["DRPObstructsFilter"] = 16
	}
}

local function getEntitiesList()
	local tbl = {
		["prop_physics"] = true,
		["prop_physics_multiplayer"] = true,
		["prop_vehicle_jeep"] = true
	}

	for k,v in pairs(scripted_ents.GetList()) do
		tbl[v.ClassName or k] = true
	end
	
	return tbl
end

local function getUsergroups()
	local tbl = {}

	if CAMI and CAMI.GetUsergroups then for k,v in pairs(CAMI.GetUsergroups()) do tbl[k] = true end end

	return tbl
end

local function getTools()
	local tbl = {}

	for k,v in pairs(spawnmenu.GetTools()) do
		for i,z in pairs(v.Items) do
			for key, data in pairs(z) do
				if istable(data) and data.ItemName then
					if data.ItemName ~= string.lower(data.ItemName) then continue end
					tbl[data.ItemName] = true
				end
			end
		end
	end
	
	return tbl
end

local function getProperties()
	local tbl = {
		["ignite"] = true,
		["remover"] = true,
		["collision"] = true
	}

	module( "properties", package.seeall )
	
	for k,v in pairs(List) do tbl[k] = true end

	return tbl
end

gProtect.config.valueRules = { --- This is because the tableviewer is modular and coded to be as efficient as possible hence its structure.
	["general"] = {
		["blacklist"] = {tableAlternatives = getEntitiesList},
		["notifyType"] = {intLimit = {min = 0, max = 2}},
		["remDiscPlyEnt"] = {intLimit = {min = -1, max = 999}},
		["remDiscPlyEntSpecific"] = {customTable = "int", tableAlternatives = getEntitiesList},
		["remOutOfBounds"] = {intLimit = {min = -1, max = 999}},
		["remOutOfBoundsWhitelist"] = {tableAlternatives = getEntitiesList},
		["protectedFrozenEnts"] = {tableAlternatives = getEntitiesList},
	},
	["ghosting"] = {
		["entities"] = {tableAlternatives = getEntitiesList},
		["forceUnfrozenEntities"] = {tableAlternatives = getEntitiesList},
		["antiObscuring"] = {tableAlternatives = getEntitiesList},
		["obscureOffset"] = {intLimit = {min = 0, max = 300}},
	},
	["damage"] = {
		["entities"] = {tableAlternatives = getEntitiesList},
		["immortalEntities"] = {tableAlternatives = getEntitiesList},
		["bypassGroups"] = {tableAlternatives = getUsergroups},
		["canDamageWorldEntities"] = {tableAlternatives = getUsergroups},
	},
	["anticollide"] = {
		["ghostEntities"] = {tableAlternatives = getEntitiesList},
		["threshold"] = {intLimit = {min = 0, max = 100000}},
		["delay"] = {intLimit = {min = 0, max = 30}},
		["action"] = {intLimit = {min = 1, max = 3}},
		["exception"] = {intLimit = {min = 0, max = 2}},
		["protectDarkRPEntities"] = {intLimit = {min = 0, max = 4}},
		["protectSpawnedEntities"] = {intLimit = {min = 0, max = 3}},
		["protectSpawnedProps"] = {intLimit = {min = 0, max = 4}},
		["specificEntities"] = {customTable = "int", tableAlternatives = getEntitiesList},
		["squaredPhysicsEnts"] = {tableAlternatives = getEntitiesList},
		["playerPropAction"] = {intLimit = {min = 0, max = 4}},
	},
	["spamprotection"] = {
		["threshold"] = {intLimit = {min = 0, max = 100000}},
		["delay"] = {intLimit = {min = 0, max = 30}},
		["action"] = {intLimit = {min = 0, max = 2}}
 	},
	["spawnrestriction"] = {
		["blockedEntities"] = {tableAlternatives = getEntitiesList},
		["bypassGroups"] = {tableAlternatives = getUsergroups},
		["propSpawnPermission"] = {tableAlternatives = getUsergroups},
		["SENTSpawnPermission"] = {tableAlternatives = getUsergroups},
		["SWEPSpawnPermission"] = {tableAlternatives = getUsergroups},
		["vehicleSpawnPermission"] = {tableAlternatives = getUsergroups},
		["NPCSpawnPermission"] = {tableAlternatives = getUsergroups},
		["ragdollSpawnPermission"] = {tableAlternatives = getUsergroups},
		["effectSpawnPermission"] = {tableAlternatives = getUsergroups},
		["maxPropModelComplexity"] = {intLimit = {min = 0, max = 100}},
		["maxModelSize"] = {intLimit = {min = 0, max = 100000}}
	},
	["toolgunsettings"] = {
		["restrictTools"] = {tableAlternatives = getTools},
		["groupToolRestrictions"] = {addRules = {list = {}, isBlacklist = true}, toggleableValue = "isBlacklist", tableDeletable = true, undeleteableTable = "list", tableAlternatives = getTools},
		["bypassGroups"] = {tableAlternatives = getUsergroups},
		["entityTargetability"] = {tableAlternatives = getEntitiesList, toggleableValue = "isBlacklist", onlymodifytable = true},
		["targetWorld"] = {tableAlternatives = getUsergroups},
		["targetPlayerOwned"] = {tableAlternatives = getUsergroups},
		["targetPlayerOwnedProps"] = {tableAlternatives = getUsergroups},
		["targetVehiclePermission"] = {tableAlternatives = getUsergroups},
		["blockedEntities"] = {tableAlternatives = getEntitiesList},
		["bypassTargetabilityTools"] = {tableAlternatives = getTools},
		["bypassTargetabilityGroups"] = {tableAlternatives = getUsergroups},
		["antiSpam"] = {customTable = "int", tableAlternatives = getTools},

	},
	["physgunsettings"] = {
		["targetWorld"] = {tableAlternatives = getUsergroups},
		["targetPlayerOwned"] = {tableAlternatives = getUsergroups},
		["targetPlayerOwnedProps"] = {tableAlternatives = getUsergroups},
		["targetPlayerOwnedPropsGroupLevel"] = {customTable = "int", tableAlternatives = getUsergroups},
		["maxDropObstructs"] = {intLimit = {min = 0, max = 10000}},
		["maxDropObstructsAction"] = {intLimit = {min = 1, max = 3}},
		["preventPropClimbingThreshold"] = {intLimit = {min = 1, max = 30}},
		["preventPropClimbingAction"] = {intLimit = {min = 1, max = 2}},
		["blockedEntities"] = {tableAlternatives = getEntitiesList},
		["bypassGroups"] = {tableAlternatives = getUsergroups},
		["PickupVehiclePermission"] = {tableAlternatives = getUsergroups}
	},
	["gravitygunsettings"] = {
		["targetWorld"] = {tableAlternatives = getUsergroups},
		["targetPlayerOwned"] = {tableAlternatives = getUsergroups},
		["targetPlayerOwnedProps"] = {tableAlternatives = getUsergroups},
		["blockedEntities"] = {tableAlternatives = getEntitiesList},
		["bypassGroups"] = {tableAlternatives = getUsergroups}
	},
	["canpropertysettings"] = {
		["blockedProperties"] = {tableAlternatives = getProperties},
		["targetWorld"] = {tableAlternatives = getUsergroups},
		["targetPlayerOwned"] = {tableAlternatives = getUsergroups},
		["targetPlayerOwnedProps"] = {tableAlternatives = getUsergroups},
		["bypassGroups"] = {tableAlternatives = getUsergroups},
		["blockedEntities"] = {tableAlternatives = getEntitiesList}
	},
	["canusesettings"] = {
		["targetWorld"] = {tableAlternatives = getUsergroups},
		["targetPlayerOwned"] = {tableAlternatives = getUsergroups},
		["targetPlayerOwnedProps"] = {tableAlternatives = getUsergroups},
		["blockedEntities"] = {tableAlternatives = getEntitiesList},
		["bypassGroups"] = {tableAlternatives = getUsergroups}
	},
	["advdupe2"] = {
		["WhitelistedConstraints"] = {tableAlternatives = {["weld"] = true, ["rope"] = true, ["axis"] = true, ["ballsocket"] = true, ["elastic"] = true, ["hydraulic"] = true, ["motor"] = true, ["muscle"] = true, ["pulley"] = true, ["slider"] = true, ["winch"] = true}},
		["PreventRopes"] = {intLimit = {min = 0, max = 2}},
		["PreventScaling"] = {intLimit = {min = 0, max = 2}},
		["PreventNoGravity"] =  {intLimit = {min = 0, max = 2}},
		["PreventTrail"] =  {intLimit = {min = 0, max = 2}},
		["whitelistedClasses"] = {tableAlternatives = getEntitiesList},
	},

	["miscs"] = {
		["ClearDecals"] = {intLimit = {min = 0, max = 1200}},
		["NoBlackoutGlitch"] = {intLimit = {min = 0, max = 3}},
		["DRPEntForceOwnership"] = {tableAlternatives = getEntitiesList},
		["DisableMotionEntities"] = {tableAlternatives = getEntitiesList},
	}
}
--PATH addons/eprotect_1.4.22/lua/e_protect/languages/sh_english.lua:
-- This is the default language! 76561199104969660
if CLIENT then
    slib.setLang("eprotect", "en", "sc-preview", "Screenshot Preview - ")
    slib.setLang("eprotect", "en", "show-alts", "Alts Detected - %s")
    slib.setLang("eprotect", "en", "net-info", "Net Info - ")
    slib.setLang("eprotect", "en", "ip-info", "IP Info - ")
    slib.setLang("eprotect", "en", "id-info", "ID Info - ")
    slib.setLang("eprotect", "en", "ip-correlation", "IP Correlation - ")
    slib.setLang("eprotect", "en", "table-viewer", "Table Viewer")

    slib.setLang("eprotect", "en", "tab-general", "General")
    slib.setLang("eprotect", "en", "tab-identifier", "Identifier")
    slib.setLang("eprotect", "en", "tab-detectionlog", "Detection Log")
    slib.setLang("eprotect", "en", "tab-netlimiter", "Net Limiter")
    slib.setLang("eprotect", "en", "tab-netlogger", "Net Logger")
    slib.setLang("eprotect", "en", "tab-httplogger", "HTTP Logger")
    slib.setLang("eprotect", "en", "tab-exploitpatcher", "Exploit Patcher")
    slib.setLang("eprotect", "en", "tab-exploitfinder", "Exploit Finder")
    slib.setLang("eprotect", "en", "tab-fakeexploits", "Fake Exploits")
    slib.setLang("eprotect", "en", "tab-datasnooper", "Data Snooper")

    slib.setLang("eprotect", "en", "player-list", "Player List")

    slib.setLang("eprotect", "en", "ratelimit", "Ratelimit")
    slib.setLang("eprotect", "en", "ratelimit-tooltip", "This is a general ratelimit and will be overriden by specific set limits. (Xs/Y)")

    slib.setLang("eprotect", "en", "timeout", "Timeout")
    slib.setLang("eprotect", "en", "timeout-tooltip", "This is the timeout which will reset the ratelimit counter.")
    
    slib.setLang("eprotect", "en", "overflowpunishment", "Overflow Punishment")
    slib.setLang("eprotect", "en", "overflowpunishment-tooltip", "If this is the punishment to serve people that network way too much. (1 = kick, 2 = ban, 3 = block)")

    slib.setLang("eprotect", "en", "whitelistergroup", "Whitelister Group")
    slib.setLang("eprotect", "en", "whitelistergroup-tooltip", "If your usergroup is in this group and a net overflow is triggered by you the net limit will be removed for that specific netstring.")

    slib.setLang("eprotect", "en", "bypass-vpn", "Bypass VPN")
    slib.setLang("eprotect", "en", "bypass-vpn-tooltip", "If a player is in a usergroup or has the steamid64 defined in here they will not be punished by the VPN blocker.")

    slib.setLang("eprotect", "en", "bypassgroup", "Bypass Group")
    slib.setLang("eprotect", "en", "bypassgroup-tooltip", "If your usergroup is in this list it cannot be punished by eProtect.")

    slib.setLang("eprotect", "en", "bypass_sids", "Bypass SteamID")
    slib.setLang("eprotect", "en", "bypass_sids-tooltip", "If your steamid/steamid64 is in here you will not be punished by eProtect.")

    slib.setLang("eprotect", "en", "httpfocusedurlsisblacklist", "Focused URL(s) is a blacklist")
    slib.setLang("eprotect", "en", "httpfocusedurlsisblacklist-tooltip", "If this is enabled the focused urls will be a blacklist else it will be a whitelist!")

    slib.setLang("eprotect", "en", "httpfocusedurls", "HTTP Focused URL(s)")
    slib.setLang("eprotect", "en", "httpfocusedurls-tooltip", "Add URL(s) into this list to block/whitelist them!")

    slib.setLang("eprotect", "en", "enable-networking", "Enable networking")
    slib.setLang("eprotect", "en", "disable-networking", "Disable networking")

    slib.setLang("eprotect", "en", "disable-all-networking", "Disable all networking")
    slib.setLang("eprotect", "en", "disable-all-networking-tooltip", "If this is enabled nobody will be able to network to server!")

    slib.setLang("eprotect", "en", "automatic-identifier", "Automatic identifier")
    slib.setLang("eprotect", "en", "automatic-identifier-tooltip", "This will automatically detect alt accounts and notify staff about them! (0 = Disabled, 1 = Notify Staff, [These two will only happend if they are banned] 2 = Kick, 3 = Ban)")

    slib.setLang("eprotect", "en", "block-vpn", "Block VPN")
    slib.setLang("eprotect", "en", "block-vpn-tooltip", "This will automatically detect and kick people who use VPNs")

    slib.setLang("eprotect", "en", "notification-groups", "Notification Groups")
    slib.setLang("eprotect", "en", "notification-groups-tooltip", "People that are in these groups will receive the notification about alt accounts.")

    slib.setLang("eprotect", "en", "player", "Player")
    slib.setLang("eprotect", "en", "net-string", "Net String")
    slib.setLang("eprotect", "en", "url", "URL")
    slib.setLang("eprotect", "en", "called", "Called")
    slib.setLang("eprotect", "en", "len", "Len")
    slib.setLang("eprotect", "en", "type", "Type")
    slib.setLang("eprotect", "en", "punishment", "Punishment")
    slib.setLang("eprotect", "en", "reason", "Reason")
    slib.setLang("eprotect", "en", "info", "Info")
    slib.setLang("eprotect", "en", "activated", "Activated")
    slib.setLang("eprotect", "en", "secure", "Secured")
    slib.setLang("eprotect", "en", "ip", "IP Adress")
    slib.setLang("eprotect", "en", "date", "Date")
    slib.setLang("eprotect", "en", "country-code", "Country code")
    slib.setLang("eprotect", "en", "status", "Status")

    slib.setLang("eprotect", "en", "unknown", "Unknown")
    slib.setLang("eprotect", "en", "secured", "Secured")

    slib.setLang("eprotect", "en", "check-ids", "Check ID(s)")
    slib.setLang("eprotect", "en", "correlate-ip", "Correlate IP(s)")
    slib.setLang("eprotect", "en", "family-share-check", "Check Family Share")

    slib.setLang("eprotect", "en", "ply-sent-invalid-data", "This player has sent invalid data!")
    slib.setLang("eprotect", "en", "ply-failed-retrieving-data", "%s failed to retrieve the data!")

    slib.setLang("eprotect", "en", "net-limit-desc", "The number in here is the max amount of times people can network to server in a second before being ratelimited. (0 = Use general limit, -1 = No limit)")

    slib.setLang("eprotect", "en", "capture", "Screenshot")
    slib.setLang("eprotect", "en", "check-ips", "Check IP(s)")
    slib.setLang("eprotect", "en", "fetch-data", "Fetch Data")
    
    slib.setLang("eprotect", "en", "patched-exploit", "Patched Exploit")
    slib.setLang("eprotect", "en", "fake-exploit", "Fake Exploit")
    slib.setLang("eprotect", "en", "net-overflow", "Net Overflow")
    slib.setLang("eprotect", "en", "exploit-menu", "Exploit Menu")
    slib.setLang("eprotect", "en", "alt-detection", "Alt Detection")

    slib.setLang("eprotect", "en", "banned", "Banned")
    slib.setLang("eprotect", "en", "kicked", "Kicked")
    slib.setLang("eprotect", "en", "notified", "Notified")

    slib.setLang("eprotect", "en", "copied_clipboard", "Copied to clipboard")
    slib.setLang("eprotect", "en", "open-profile", "Open Profile")

    slib.setLang("eprotect", "en", "copy_name", "Copy Name")
    slib.setLang("eprotect", "en", "copy_steamid", "Copy SteamID")
    slib.setLang("eprotect", "en", "copy_steamid64", "Copy SteamID64")
    slib.setLang("eprotect", "en", "show_alts", "Show Alts")

    slib.setLang("eprotect", "en", "page_of_page", "Page %s/%s")
    slib.setLang("eprotect", "en", "previous", "Previous")
    slib.setLang("eprotect", "en", "next", "Next")
elseif SERVER then
    slib.setLang("eprotect", "en", "correlated-ip", "Correlated IP")
    slib.setLang("eprotect", "en", "family-share", "Family Share")

    slib.setLang("eprotect", "en", "invalid-player", "This player is invalid!")
    slib.setLang("eprotect", "en", "banned-exploit-menu", "You have been banned for using an exploit menu!")
    slib.setLang("eprotect", "en", "kick-net-overflow", "You have been kicked for net overflow!")
    slib.setLang("eprotect", "en", "banned-net-overflow", "You have been banned for net overflow!")
    slib.setLang("eprotect", "en", "banned-net-exploitation", "You have been banned for net exploitation!")
    slib.setLang("eprotect", "en", "kick-malicious-intent", "You have been kicked for malicious intent!")
    slib.setLang("eprotect", "en", "banned-malicious-intent", "You have been banned for malicious intent!")

    slib.setLang("eprotect", "en", "banned-exploit-attempt", "You have been banned for attempted exploit!")

    slib.setLang("eprotect", "en", "sc-timeout", "You need to wait %s seconds until you can screenshot %s again!")
    slib.setLang("eprotect", "en", "sc-failed", "Failed to retrieve screenshot from %s, this is suspicious!")

    slib.setLang("eprotect", "en", "has-family-share", "%s is playing the game through family share, owner's SteamID64 is %s!")
    slib.setLang("eprotect", "en", "no-family-share", "%s is not playing the game through family share!")
    slib.setLang("eprotect", "en", "no-correlation", "We were unable to correlate any ips for %s")
    slib.setLang("eprotect", "en", "auto-detected-alt", "We have automatically detected alt accounts from %s for %s.")
    slib.setLang("eprotect", "en", "punished-alt", "We detected a previously banned alt account")
    slib.setLang("eprotect", "en", "vpn-blocked", "VPNs are blocked on this server")

    slib.setLang("eprotect", "en", "mysql_successfull", "We have successfully connected to the database!")
    slib.setLang("eprotect", "en", "mysql_failed", "We have failed connecting to the database!")
end
--PATH lua/autorun/sqlworkbench.lua:
if (SERVER and SQLWorkbench and SQLWorkbench.MySQL and SQLWorkbench.MySQL.Connections) then
	for _,connection in pairs(SQLWorkbench.MySQL.Connections) do
		connection:disconnect()
	end
end

SQLWorkbench = {}

SQLWorkbench.COLOR = {}
SQLWorkbench.COLOR.BLACK = Color(0,0,0)
SQLWorkbench.COLOR.WHITE = Color(255,255,255)
SQLWorkbench.COLOR.RED = Color(255,0,0)
SQLWorkbench.COLOR.GREEN = Color(0,255,0)
SQLWorkbench.COLOR.BLUE = Color(0,0,255)
SQLWorkbench.COLOR.YELLOW = Color(255,255,0)
SQLWorkbench.COLOR.GOLD = Color(232,150,0)
SQLWorkbench.COLOR.LIGHT_BLUE = Color(0,255,255)

SQLWorkbench.PRINT_TYPE = {}
SQLWorkbench.PRINT_TYPE.NORMAL  = 0
SQLWorkbench.PRINT_TYPE.ERROR   = 1
SQLWorkbench.PRINT_TYPE.WARNING = 2
SQLWorkbench.PRINT_TYPE.NOTICE  = 3
SQLWorkbench.PRINT_TYPE.SUCCESS = 4
function SQLWorkbench:Print(str, print_type)
	if (print_type == nil or print_type == SQLWorkbench.PRINT_TYPE.NORMAL) then
		MsgC(SQLWorkbench.COLOR.LIGHT_BLUE, "[SQLWorkbench] ", Color(255,255,255), tostring(str) .. "\n")
	elseif (print_type == SQLWorkbench.PRINT_TYPE.ERROR) then
		MsgC(SQLWorkbench.COLOR.RED, "[SQLWorkbench] [ERROR] ", Color(255,255,255), tostring(str) .. "\n")
	elseif (print_type == SQLWorkbench.PRINT_TYPE.WARNING) then
		MsgC(SQLWorkbench.COLOR.YELLOW, "[SQLWorkbench] [WARNING] ", Color(255,255,255), tostring(str) .. "\n")
	elseif (print_type == SQLWorkbench.PRINT_TYPE.NOTICE) then
		MsgC(SQLWorkbench.COLOR.LIGHT_BLUE, "[SQLWorkbench] [NOTICE] ", Color(255,255,255), tostring(str) .. "\n")
	elseif (print_type == SQLWorkbench.PRINT_TYPE.SUCCESS) then
		MsgC(SQLWorkbench.COLOR.GREEN, "[SQLWorkbench] [SUCCESS] ", Color(255,255,255), tostring(str) .. "\n")
	end
end

SQLWorkbench:Print("Starting...", SQLWorkbench.PRINT_TYPE.NOTICE)

SQLWorkbench.table_IsEmpty = table.IsEmpty or function(tbl)
	return next(tbl) == nil
end

function SQLWorkbench:Escape(str, connection, no_quotes)
	if (connection ~= nil) then
		if (no_quotes) then
			return GAS.Database.MySQLDatabase:escape(tostring(str))
		else
			return "'" .. GAS.Database.MySQLDatabase:escape(tostring(str)) .. "'"
		end
	else
		return sql.SQLStr(tostring(str), no_quotes)
	end
end

function SQLWorkbench:EscapeTable(table_name)
	return "`" .. (table_name:gsub("\\","\\\\"):gsub("`", "\\`")) .. "`"
end

if (SERVER) then
	resource.AddFile("materials/vgui/sqlworkbench.vtf")

	AddCSLuaFile("sqlworkbench/mysql.lua")
	AddCSLuaFile("sqlworkbench/menu.lua")
	AddCSLuaFile("sqlworkbench/networking.lua")

	for _,f in ipairs((file.Find("sqlworkbench/ace/*", "LUA"))) do
		AddCSLuaFile("sqlworkbench/ace/" .. f)
	end
	for _,f in ipairs((file.Find("sqlworkbench/ace/snippets/*", "LUA"))) do
		AddCSLuaFile("sqlworkbench/ace/snippets/" .. f)
	end

	include("sqlworkbench/database.lua")
end

include("sqlworkbench/mysql.lua")
include("sqlworkbench/networking.lua")
include("sqlworkbench/menu.lua")

SQLWorkbench:Print("Running!", SQLWorkbench.PRINT_TYPE.SUCCESS)
--PATH addons/talk-modes/lua/talk_modes/config/sh_config.lua:
--[[-------------------------------------------

    Talk Modes - whisper/talk/yell 

    Licensed to GLeaks.Space
	Version: 1.1.1

	By: SaturdaysHeroes & Djuk
	Special thanks to CupCakeR

--]]-------------------------------------------
TalkModes = TalkModes || {}
TalkModes.Config = TalkModes.Config || {}

-- Ranks allowed to open in-game config
TalkModes.Config.AllowedRanks = {
    ["superadmin"] = true
}

-- List of commands to open the in-game config. 
TalkModes.Config.ConfigCommands = {
    ["!talkmodes"] = true,
    ["/talkmodes"] = true
}

-- Please do not change anything beyond this point, it could potentially break the script. 
-- All of the script functionality is based around these two functions, I will not help if this is modified. 
function TalkModes.Config:GetSetting(strTable, strSetting)
    if (SERVER) then 
        return self.Server[strTable][strSetting]
    else
        return self.Client[strTable][strSetting]
    end
end

function TalkModes.Config:GetTable(strTable)
    if (SERVER) then 
        return self.Server[strTable]
    else
        return self.Client[strTable]
    end
end
--PATH addons/talk-modes/lua/talk_modes/vgui/elements/cl_dropdown.lua:
local THEME = TalkModes.Client.ActiveTheme

local PANEL = {}
function PANEL:Init()
    self:SetTextColor(THEME["White"])
    self:SetFont("TalkModes:Small")
end

function PANEL:Paint(intW, intH)
    draw.RoundedBox(6, 0, 0, intW, intH, THEME["Background"])
end

function PANEL:OnSelect()
    self.intW, self.intH = self:GetContentSize()
    self:SetSize(self.intW + 24, self.intH + 4)
end

vgui.Register("TalkModes.Dropdown", PANEL, "DComboBox")
--PATH addons/talk-modes/lua/talk_modes/vgui/elements/cl_selection.lua:
local circles = include("talk_modes/vgui/libs/cl_circles.lua")
local THEME = TalkModes.Client.ActiveTheme

local PANEL = {}
AccessorFunc(PANEL, "mode_mat", "Material")
AccessorFunc(PANEL, "mode", "Mode")
local tblTalkModes = {
    [1] = {
        strMode = "Whisper",
        matImage = Material("talkmodes/whisper.png")
    },
    [2] = {
        strMode = "Talk",
        matImage = Material("talkmodes/normal.png")
    },  
    [3] = {
        strMode = "Yell",
        matImage = Material("talkmodes/yell.png")
    }
}

function PANEL:Init()
    self:SetSize(32, 32)
    self:Dock(LEFT)
    self:DockMargin(6, 6, 0, 6)
end

function PANEL:Paint(intW, intH)
    surface.SetDrawColor((self:GetMode() == LocalPlayer():GetTalkMode()) && THEME["Hover"] || THEME["Gray"])
    surface.SetMaterial(self:GetMaterial())
    surface.DrawTexturedRect(0, 0, 32, 32)
end
vgui.Register("TalkModes.SpeakMode", PANEL, "EditablePanel")


local PANEL = {}
function PANEL:Init()
    self:SetSize(3 * 32 + 4 * 6, 32 + 12)
    for _, val in ipairs(tblTalkModes) do
        self.pMode = self:Add("TalkModes.SpeakMode")
        self.pMode:SetMaterial(val.matImage)
        self.pMode:SetMode(val.strMode)
    end
end
function PANEL:Paint(intW, intH) 
    draw.RoundedBox(8, 0, 0, intW, intH, THEME["Background"])
end

vgui.Register("TalkModes.PlayerMenu", PANEL, "EditablePanel")

--PATH addons/the_perfect_training_system/lua/diablos_training/languages/training_german.lua:
Diablos.TS.Languages.AvailableLanguages["german"] = {

    -- Global data
    lbs = "lbs",
    kg = "kg",
    yes = "JA",
    no = "NEIN",
    andStr = "und",
    active = "AKTIV",
    training = "TRAINING",
    beginning = "Beginnt in:",
    ending = "Endet in:",
    leaveTraining = "Verlasse das Training:",
    second = "Sekunde",
    seconds = "Sekunden",
    minute = "Minute",
    minutes = "Minuten",
    hour = "Stunde",
    hours = "Stunden",
    day = "Tag",
    days = "Tage",
    week = "Woche",
    weeks = "Wochen",
    month = "Monat",
    months = "Monate",
    year = "Jahr",
    years = "Jahre",
    key = "Taste",
    keys = "Tasten",
    free = "KOSTENLOS",

    -- Home tips
    home = "Übersicht",
    trainingStatistics = "TRAININGSSTATISTIKEN",
    levelProgression = "Level Fortschritt",
    captionFine = "Durchtrainiert",
    captionShouldTrain = "Training empfohlen",
    captionMuscleLoss = "Muskelschwund",
    staminaBenefit = "Ausdauer",
    staminaMuscle = "Oberschenkel",
    runningspeedBenefit = "Maximale Laufgeschwindigkeit",
    runningspeedMuscle = "Wadenmuskel",
    strengthBenefit = "Kraft & Schaden",
    strengthMuscle = "Schulter, Trapezius & Oberarm",
    attackspeedBenefit = "Angriffsgeschwindigkeit",
    attackspeedMuscle = "Unterarm",

    -- Personal statistics

    currentLevel = "Level %u",
    xpPoint = "XP: %u",

    -- Global statistics

    globalStatistics = "Globale Statistiken",
    onlineStatistics = "Statistiken für Online-Spieler",
    updateSelection = "SETZEN (%u ausgewählt)",
    resetPlayerData = "SPIELERDATEN ZURÜCKSETZEN",
    resetEntityData = "GEGENSTANDSDATEN ZURÜCKSETZEN",
    peopleSelected = "Ausgewählte Personen: %s",
    peopleSelectedTip = "Du kannst Trainingsparameter festlegen, die auf die ausgewählten Personen angewendet werden soll",


    -- Training times part

    trainingTimes = "TRAININGSZEITEN",
    trainingAdv = "Manchmal muss man eine Trainingspause einlegen. Wenn du jedoch zu lange wartest, kommt es zu Muskelschwund.",
    muscleRest = "Trainingspause",
    losingMuscle = "Muskelschwund",
    waitUntil = "Warte bis",
    secondsRemaining = "%d Sekunden verbleibend",
    needTrainBeforeLosingMuscle = "Trainiere vor:",
    neverTrained = "Noch nie trainiert",
    freeToWorkout = "Du kannst diesen Muskel trainieren!",
    currentlyLosing = "Du verlierst gerade Muskeln!",
    yourChoice = "Deine Wahl",
    trainNow = "Beginne jetzt mit dem Training",


    -- XP/Level table

    levels = "Levels",
    level = "Level",
    xp = "XP",
    percentage = "Prozentsatz",
    undefined = "Unbestimmt",
    lastTraining = "Letztes Training",

    -- Global trainings

    trainingWillBegin = "Das Training beginnt in %u Sekunden",
    trainingEndsIn = "Das Training endet in %u Sekunden",
    currentlyUsingMachine = "Jemand benutzt gerade diese Maschine",
    leftMachine = "Du hast das Training verlassen. Du kannst es jetzt erneut starten!",
    farFromMachine = "Du bist zu weit von einer Maschine entfernt, um zu trainieren!",
    notAllowedJob = "Dein Job erlaubt dir keine Ausbildung!",

    -- Admin data

    setTo = "%s einstellen auf",
    confirmationBox = "BESTÄTIGUNG",
    areYouSure = "Bist du sicher, dass du das tun willst?",

    -- Weigh balance data

    weighBalanceUse = "Drücke USE, um Informationen zu erhalten",
    weighBalanceCantSee = "Statistiken sind vertraulich",
    weighBalanceTipL1 = "BITTE BETRETE",
    weighBalanceTipL2 = "DIE WAAGE",
    weighBalanceTipL3 = "UM STATISTIKEN ZU BEKOMMEN",

    -- Turnstile data

    turnstileNeedBadge = "Du musst deine Karte benutzen, um hier Zutritt zu bekommen!",

    -- Badge data

    activebadge = "Aktives Abzeichen",
    neverSubscribed = "Noch nie abonniert",
    badgeSubscription = "Kartenabonnement",
    expirationDate = "Verfallsdatum",
    expired = "Abgelaufen",
    previousSub = "Vorheriges Abonnement",

    -- Stamina data

    stamina = "Ausdauer",
    runSpeed = "Laufgeschwindigkeit",
    timeMaxSpeed = "Zeit für Höchstgeschwindigkeit",

    -- Running speed data

    runningspeed = "Laufgeschwindigkeit",

    -- Treadmill data

    treadmillDrawLeft = "%u Sekunden übrig",
    treadmillDrawSomeone = "Jemand trainiert!",
    treadmillDrawCanUse = "VERWENDBAR",
    treadmillCurSpeed = "Aktuelle Geschwindigkeit",
    treadmillFrameTitle = "Laufband",
    treadmillChooseExerciceTip1 = "Drücke die W-Taste, um deine Geschwindigkeit zu erhöhen",
    treadmillChooseExerciceTip2 = "Wieviele Punkte du bekommst hängt von deiner Laufgeschwindigkeit ab.",
    quickExerciceSpeed = "Geschwindigkeitsbasiert",
    longExerciceStamina = "Ausdauerbasiert",
    runningTime = "Laufzeit",
    increaseSpeed = "Geschwindigkeit erhöhen",
    decreaseSpeed = "Geschwindigkeit vermindern",
    needFasterTreadmill = "Du musst schneller sein, wenn du die W-Taste drückst/loslässt",

    -- Strength data

    strength = "Stärke",

    -- Dumbbell data

    dumbbellDraw = "Hantel",
    dumbbellFrameTitle = "HANTEL",
    dumbbellChooseExerciceTip1 = "Drücke die richtige Taste zur richtigen Zeit",
    dumbbellChooseExerciceTip2 = "Wieviele Punkte du bekommst hängt von korrekten Tastendrücken ab.",

    -- Attack speed data

    attackspeed = "Angriffsgeschwindigkeit",

    -- Punching ball data

    punchingHitDamage = "%u rote Punkte getroffen",
    punchingFrameTitle = "Boxsack",
    punchingChooseExerciceTip1 = "Den Boxsack mit roten Punkten treffen",
    punchingChooseExerciceTip2 = "Wieviele Punkte du bekommst hängt von der Anzahl der getroffenen roten Punkte ab",

    -- Card reader data

    cardReaderTitle = "KARTENLESEGERÄT",
    approachBadge = "Du musst deine Karte ausrüsten, um dieses Kartenlesegerät zu benutzen!",
    becomeOwner = "Dieses Kartenlesegerät gehört nun dir!",
    someoneElseOwner = "Dieses Kartenlesegerät gehört bereits jemand anderem!",

    cardReaderOwnerAdd = "HINZUFÜGEN",
    cardReaderOwnerRemove = "LÖSCHEN",
    cardReaderApply = "ÄNDERUNGEN ÜBERNEHMEN",
    cardReaderBadgePrice = "Preis der Karte",
    cardReaderPurchaseSub = "KAUFE EIN ABONNEMENT",
    cardReaderPurchaseSubTip1 = "Mit einem Abonnement kannst du deine Karte an dem Drehkreuz benutzen",
    cardReaderFullyRecharged = "Dein Abonnement ist bereits vollständig aufgeladen! Es läuft am %s ab",

    cardReaderGiveCredit = "EINMALEINTRITT VERGEBEN",
    cardReaderGiveCreditTip1 = "Du bist dabei, dem Spieler vor dir einen Einmaleintritt zu geben",
    cardReaderGiveCreditTip2 = "Damit kann er einmal ein Drehkreuz benutzen",
    cardReaderGiveCreditBtn = "Gebe EINMALEINTRITT",
    cardReaderGiveAlreadyCredit = "Du kannst niemandem einen Einmaleintritt geben, der bereits einen hat!",
    cardReaderGiveAlreadySubscribed = "Du kannst kein Abonnement an jemanden geben, der bereits ein gültiges Abonnement hat!",


    cardReaderEditTerminal = "BEARBEITE DAS LESEGERÄT",
    cardReaderEditTerminalTip1 = "Du kannst einige Parameter des Lesegeräts wie den Abonnementpreis / Miteigentümer ändern",
    cardReaderEditTerminalTip2 = "Miteigentümer bekommen einen Anteil des Geldes, welches du aus Abonnements erhältst",
    cardReaderEditTerminalSetPrice = "Die erlaubte Preisspanne reicht von %s bis %s",


    -- Notify player

    alreadyTrained = "Du hast diese Muskeln erst kürzlich trainiert, bitte komme in %s wieder",
    needMoreLevel = "Du musst mindestens Level %u haben, um dies zu benutzen!",
    tooEasy = "Diese Maschine ist zu leicht für dein Level!",
    endTraining = "Das Training ist beendet",
    xpAdded = "Du hast %u Punkte bekommen!",
    newLevel = "Du bist jetzt Level %u!",
    lossOfTraining = "Du verlierst einige Muskeln, da du dies länger nicht mehr trainiert hast: %s",
    sportBadgeVerified = "Deine Karte wurde verifiziert",
    sportBadgeInvalid = "Deine Karte ist ungültig",
    subDataUpdated = "Du hast die Daten deiner Karte aktualisiert!",
    subPurchased = "Du hast %s erhalten, weil %s ein Abonnement gekauft hat!",
    subRenewed = "Du hast dein Abonnement erneuert!",
    subNotEnoughMoney = "Du hast nicht genug Geld, um ein Abonnement zu kaufen!",
    creditGiven = "Du hast einen Einmaleintritt vergeben!",
    creditReceived = "Du hast einen Einmaleintritt erhalten!",
    entitiesUpdated = "Die Daten der Trainingseinheiten wurden aktualisiert!",
    entitiesRemoved = "Die Gegenstände wurden entfernt und die Daten gelöscht!",
    playerDataRemoved = "Die Spielerdatenbank wurde gelöscht!",
    playerDataUpdated = "Die Daten wurden mit deinem Wert aktualisiert!",

}
--PATH addons/the_perfect_training_system/lua/diablos_training/languages/training_russian.lua:
Diablos.TS.Languages.AvailableLanguages["russian"] = {

	-- Global data
	lbs = "лбс",
	kg = "кг",
	yes = "ДА",
	no = "НЕТ",
	andStr = "и",
	active = "АКТИВНО",
	training = "ТРЕННИРОВКА",
	beginning = "Начало:",
	ending = "Конец:",
	leaveTraining = "Выйдите с треннировку:",
	second = "секунда",
	seconds = "секунд",
	minute = "минута",
	minutes = "минут",
	hour = "час",
	hours = "часов",
	day = "день",
	days = "дней",
	week = "неделя",
	weeks = "недель",
	month = "месяц",
	months = "месяца",
	year = "год",
	years = "года",
	key = "клавиша",
	keys = "клавиши",
	free = "БЕСПЛАТНО",

	-- Home tips
	home = "Главная",
	trainingStatistics = "СТАТИСТИКА ТРЕННИРОВКИ",
	levelProgression = "Прогресс уровня",
	captionFine = "Мышечный разрыв",
	captionShouldTrain = "Следует треннироваться",
	captionMuscleLoss = "Потеря мышечной массы",
	staminaBenefit = "Продолжительность бега",
	staminaMuscle = "Бедро",
	runningspeedBenefit = "Максимальная скорость ходьбы",
	runningspeedMuscle = "Икра",
	strengthBenefit = "Урон от силы",
	strengthMuscle = "Плечо, Трапециевидная мышца и Верхняя часть предплечья",
	attackspeedBenefit = "Скорость атаки",
	attackspeedMuscle = "Предплечье",

	-- Personal statistics

	currentLevel = "Уровень %u",
	xpPoint = "ОП: %u",

	-- Global statistics

	globalStatistics = "Общие статистики",
	onlineStatistics = "Статистика онлайн игроков",
	updateSelection = "ОБНОВИТЬ (%u выбран)",
	resetPlayerData = "ОЧИСТИТЬ ДАННЫЕ ИГРОКА",
	resetEntityData = "ОЧИСТИТЬ ДАННЫЕ ЭНТИТИ",
	peopleSelected = "Выбранные игроки: %s",
	peopleSelectedTip = "Вы можете установить некоторые параметры обучения для применения к выбранным вами людям",


	-- Training times part

	trainingTimes = "ВРЕМЯ ОБУЧЕНИЯ",
	trainingAdv = "Иногда вам нужно дать мышцам отдохнуть. Однако ожидание слишком долгого времени приведет к потере мышечной массы.",
	muscleRest = "Мышечный отдых",
	losingMuscle = "Потеря мышечной массы",
	waitUntil = "Тебе следует подождать, пока",
	secondsRemaining = "%d осталось секунд",
	needTrainBeforeLosingMuscle = "Вам нужно потренироваться, прежде чем:",
	neverTrained = "Никогда не тренировался",
	freeToWorkout = "Вы можете свободно тренировать эту мышцу!",
	currentlyLosing = "В настоящее время вы теряете мышечную массу!",
	yourChoice = "Ваш выбор",
	trainNow = "Начать треннировку",


	-- XP/Level table

	levels = "Уровни",
	level = "Уровень",
	xp = "ОП",
	percentage = "Процент",
	undefined = "Не определено",
	lastTraining = "Последняя треннировка",

	-- Global trainings

	trainingWillBegin = "Треннировка начнется через %u секунд",
	trainingEndsIn = "Треннировка закончится через %u секунд",
	currentlyUsingMachine = "Кто-то в настоящее время использует этот прибор",
	leftMachine = "Ты ушел с тренировки. Вы можете попробовать еще раз!",
	farFromMachine = "Вы слишком далеки от прибора, чтобы тренироваться!",
	notAllowedJob = "Ваша работа не позволяет вам тренироваться!",

	-- Admin data

	setTo = "Установить %s на",
	confirmationBox = "ОКНО ПОДТВЕРЖДЕНИЯ",
	areYouSure = "Ты уверен, что хочешь это сделать?",

	-- Weigh balance data


	weighBalanceUse = "Нажмите ИСПОЛЬЗОВАТЬ чтобы получить информацию",
	weighBalanceCantSee = "Статистические данные являются конфиденциальными",
	weighBalanceTipL1 = "ПОЖАЛУЙСТА, ОТОЙДИТЕ",
	weighBalanceTipL2 = "НА БАЛАНСЕ",
	weighBalanceTipL3 = "ЧТОБЫ ИМЕТЬ СТАТИСТИКУ",

	-- Turnstile data

	turnstileNeedBadge = "Вам нужно использовать свой бейдж, чтобы получить доступ сюда!",

	-- Badge data

	activebadge = "Активный значок",
	neverSubscribed = "Никогда не подписывался",
	badgeSubscription = "Подписка на бейдж",
	expirationDate = "Срок годности",
	expired = "Истёк",
	previousSub = "Предыдущая подписка",

	-- Stamina data

	stamina = "Стамина",
	runSpeed = "Скорость бега",
	timeMaxSpeed = "Лучшее время бега",

	-- Running speed data

	runningspeed = "Скорость бега",

	-- Treadmill data

	treadmillDrawLeft = "%u прошло секунд",
	treadmillDrawSomeone = "Кто-то треннируется!",
	treadmillDrawCanUse = "БЕСПЛАНТО ДЛЯ ИСПОЛЬЗОВАНИЯ",
	treadmillCurSpeed = "Текущая скорость",
	treadmillFrameTitle = "БЕГУЩАЯ ДОРОЖКА",
	treadmillChooseExerciceTip1 = "Нажмите клавишу 'Вперед', чтобы увеличить свою скорость",
	treadmillChooseExerciceTip2 = "Очки, которые вы зарабатываете, зависят от скорости, с которой вы бежите в конце, увеличивайте свою скорость",
	quickExerciceSpeed = "Быстрое упражнение, основанное на скорости",
	longExerciceStamina = "Длительное упражнение упражнение, основанное на выносливости",
	runningTime = "Время бега",
	increaseSpeed = "Увеличьте скорость",
	decreaseSpeed = "Сбавте скорость",
	needFasterTreadmill = "Вам нужно быть быстрее при нажатии/отпускании клавиши 'Вперед'",

	-- Strength data

	strength = "Сила",

	-- Dumbbell data

	dumbbellDraw = "Гантель",
	dumbbellFrameTitle = "ГАНТЕЛЬ",
	dumbbellChooseExerciceTip1 = "Нажимайте нужные клавиши в нужное время",
	dumbbellChooseExerciceTip2 = "Очки, которые вы зарабатываете, зависят от соотношения нажатых клавиш в нужное время",

	-- Attack speed data

	attackspeed = "Скорость атаки",

	-- Punching ball data

	punchingHitDamage = "%u попадание красных точек",
	punchingFrameTitle = "ПРОБИВНОЙ МЯЧ",
	punchingChooseExerciceTip1 = "Ударьте по пробивному мячу с красными точками",
	punchingChooseExerciceTip2 = "Очки, которые вы зарабатываете, зависят от количества красных очков, которые вы набираете кулаками",

	-- Card reader data

	cardReaderTitle = "ТЕРМИНАЛ КАРТ",
	approachBadge = "Вам нужно подойти к своему спортивному значку, чтобы воспользоваться терминалом!",
	becomeOwner = "Вы стали владельцем терминала!",
	someoneElseOwner = "Кто-то другой уже является владельцем этого терминала",

	cardReaderOwnerAdd = "ДОБАВИТЬ",
	cardReaderOwnerRemove = "УДАЛИТЬ",
	cardReaderApply = "СОХРАНИТЬ ИЗМЕНЕНИЯ",
	cardReaderBadgePrice = "Цена значка",
	cardReaderPurchaseSub = "Приобрести подписку",
	cardReaderPurchaseSubTip1 = "Подписка позволяет вам использовать свой бейдж на турникетах",
	cardReaderFullyRecharged = "Ваша подписка уже полностью пополнена! Истекает в %s",

	cardReaderGiveCredit = "ВЫДАТЬ КРЕДИТ",
	cardReaderGiveCreditTip1 = "Вы собираетесь выдать кредит игроку перед вами",
	cardReaderGiveCreditTip2 = "Это позволит ему получить доступ к турникету один раз",
	cardReaderGiveCreditBtn = "ВЫДАТЬ КРЕДИТ",
	cardReaderGiveAlreadyCredit = "Вы не можете дать кредит тому, у кого он уже есть!",
	cardReaderGiveAlreadySubscribed = "Вы не можете предоставить кредит тому, у кого уже есть действующая подписка!",


	cardReaderEditTerminal = "РЕДАКТИРОВАТЬ ТЕРМИНАЛ",
	cardReaderEditTerminalTip1 = "Вы можете изменить некоторые параметры терминала в качестве цены подписки/совладельца",
	cardReaderEditTerminalTip2 = "Совладельцы здесь для того, чтобы делиться деньгами, которые вы получаете от подписок",
	cardReaderEditTerminalSetPrice = "Цена может быть установлена с %s до %s",


	-- Notify player

	alreadyTrained = "Вы недавно провели тренировку этих мышц, пожалуйста, вернитесь через %s",
	needMoreLevel = "Вы должны быть по крайней мере на одном уровне из %u чтобы использовать это!",
	tooEasy = "Этот прибор слишком прост для вашего уровня!",
	endTraining = "Тренировка закончилась",
	xpAdded = "Вы выйграли %u опыта!",
	newLevel = "У вас новый уровень %u!",
	lossOfTraining = "Вы теряете часть мышц из-за потери подготовки к этому типу тренировок: %s",
	sportBadgeVerified = "Ваша подписка была подтверждена",
	sportBadgeInvalid = "Ваша подписка недействительна",
	subDataUpdated = "Вы обновили дополнительные данные подписки!",
	subPurchased = "Вы получили %s потому что %s приобрел подписку!",
	subRenewed = "Вы получили новую подписку!",
	subNotEnoughMoney = "У вас недостаточно денег, чтобы купить подписку!",
	creditGiven = "У вас есть кредит!",
	creditReceived = "Вы получили кредит!",
	entitiesUpdated = "Данные приборов были обновлены!",
	entitiesRemoved = "Объекты были удалены, а данные стерты!",
	playerDataRemoved = "База данных игроков была удалена!",
	playerDataUpdated = "Данные обновляются с учетом вашей ценности!",

}
--PATH addons/the_perfect_training_system/lua/diablos_training/vgui/cl_admintoolgun.lua:
net.Receive("TPTSA:OpenAdminToolgunPanel", function(len, _)

	local ent = net.ReadEntity()
	local typeEnt = net.ReadUInt(3)

	if IsValid(ent) then
		local class = ent:GetClass()
		if class == "diablos_punching_ball" then class = "diablos_punching_base" end
		typeEnt = Diablos.TS:GetIntegerFromEntity(class)
	end

	local className = Diablos.TS:GetEntityFromInteger(typeEnt)
	local niceClassName = Diablos.TS.NiceNames[className]

	local height = 135
	if typeEnt == 4 then
		height = 295
	elseif typeEnt == 5 then
		height = 415
	elseif typeEnt == 6 then
		height = 295
	end


	local frame = vgui.Create("DFrame")
	frame:SetSize(510, height)
	frame:DockPadding(0, 0, 0, 0)
	frame:Center()
	frame:SetTitle("")
	frame:SetDraggable(false)
	frame:ShowCloseButton(false)
	frame.Paint = function(s, w, h)
		if Diablos.TS.Colors.Blurs then Derma_DrawBackgroundBlur(s, 1) end
		surface.SetDrawColor(Diablos.TS.Colors.Frame) surface.DrawRect(0, 0, w, h)
	end

	frame:MakePopup()

	local header = vgui.Create("DPanel", frame)
	header:Dock(TOP)
	header:DockMargin(0, 0, 0, 0)
	header:SetTall(40)
	header.Paint = function(s, w, h)
		surface.SetDrawColor(Diablos.TS.Colors.FrameLeft) surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(Diablos.TS.Colors.Header) surface.DrawRect(0, h - 4, w, 4)

		draw.SimpleText("ADMIN CONFIGURATION - TRAINING ENTITY", "Diablos:Font:TS:30", 5, (h - 4) / 2, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end


	local closeButton = vgui.Create("DButton", header)
	closeButton:Dock(RIGHT)
	closeButton:SetText("")
	closeButton:SetWide(40)
	closeButton.Paint = function(s, w, h)
		local size = h * 0.8
		local curColor = Diablos.TS:PaintFunctions(s, color_white, Diablos.TS.Label, Diablos.TS.LabelHovered)
		surface.SetDrawColor(curColor)
		surface.SetMaterial(Diablos.TS.Materials.close)
		surface.DrawTexturedRect(w / 2 - size / 2, (h - 4) / 2 - size / 2, size, size)
	end

	closeButton.DoClick = function(s)
		frame:Close()
	end

	local docker = vgui.Create("DPanel", frame)
	docker:Dock(FILL)
	docker:DockPadding(10, 10, 10, 10)
	docker:DockMargin(0, 0, 0, 0)
	docker.Paint = function(s, w, h) end

	local globalInfo = vgui.Create("DPanel", docker)
	globalInfo:Dock(TOP)
	globalInfo:DockPadding(0, 0, 0, 0)
	globalInfo:DockMargin(0, 0, 0, 10)
	globalInfo:SetTall(25)
	globalInfo.Paint = function(s, w, h)
		local text = "You are configuring the entity:"
		local wholeText = string.format("%s: %s", text, niceClassName)

		surface.SetFont("Diablos:Font:TS:25")
		local sizextotal = surface.GetTextSize(wholeText)
		local sizexnotent = surface.GetTextSize(text)

		draw.SimpleText(text, "Diablos:Font:TS:25", w / 2 - sizextotal / 2, 0, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		draw.SimpleText(niceClassName, "Diablos:Font:TS:25", w / 2 - sizextotal / 2 + sizexnotent + 5, 0, Diablos.TS.Colors.gl, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	end

	-- We have a parameter if you configure a treadmill, a dumbbell or a punching ball

	local valueBtn = -1
	if typeEnt == 4 or typeEnt == 5 or typeEnt == 6 then
		local tab
		if typeEnt == 4 then
			tab = Diablos.TS.TreadmillSizeEquivalence
		elseif typeEnt == 5 then
			tab = Diablos.TS.DumbbellSizeEquivalence
		elseif typeEnt == 6 then
			tab = Diablos.TS.PunchingBallSizeEquivalence
		end


		local layout = vgui.Create("DListLayout", docker)
		layout:Dock(TOP)
		layout:DockPadding(0, 0, 0, 0)
		layout:DockMargin(0, 0, 0, 10)


		local buttons = {}
		valueBtn = 0
		for k, value in pairs(tab) do
			local btn = vgui.Create("DButton", layout)
			btn:Dock(TOP)
			btn:DockMargin(0, 0, 0, 10)
			if typeEnt == 4 then
				btn:SetText(string.format("Angle: %u°", value.angle))
			else
				local weightValue = value.kg
				if Diablos.TS.IsLbs then
					weightValue = value.lbs
				end
				btn:SetText(string.format("%u %s", weightValue, Diablos.TS:GetWeightText()))
			end
			btn:SetFont("Diablos:Font:TS:25")
			btn:SetTall(30)
			btn.clicked = false
			btn.Paint = function(s, w, h)
				local curColor = Diablos.TS:PaintFunctions(s, Diablos.TS.Label, Diablos.TS.LabelHovered, Diablos.TS.LabelDown)
				s:SetTextColor(curColor)
				if btn.clicked then
					surface.SetDrawColor(Diablos.TS.Colors.bl) surface.DrawRect(0, 0, w, h)
				else
					surface.SetDrawColor(Diablos.TS.Colors.g) surface.DrawRect(0, 0, w, h)
				end
			end
			btn.DoClick = function(s)
				valueBtn = k
				if s.clicked then
					s.clicked = false
					valueBtn = 0
				else
					for _, button in pairs(buttons) do
						button.clicked = false
					end
					s.clicked = true
				end
			end
			table.insert(buttons, btn)
		end

		if IsValid(ent) then
			local bodygroupType = 0
			if typeEnt == 4 then
				bodygroupType = ent:GetAngle()
			else
				bodygroupType = ent:GetWeight()
			end

			valueBtn = bodygroupType
			buttons[bodygroupType].clicked = true
		end
	end

	local buttonBottomPanel = vgui.Create("DPanel", docker)
	buttonBottomPanel:Dock(TOP)
	buttonBottomPanel:DockPadding(0, 0, 0, 0)
	buttonBottomPanel:DockMargin(0, 0, 0, 0)
	buttonBottomPanel:SetTall(40)
	buttonBottomPanel.Paint = function(s, w, h)

	end

	if IsValid(ent) then

		local edit = vgui.Create("DButton", buttonBottomPanel)
		edit:Dock(LEFT)
		edit:DockMargin(0, 0, 0, 0)
		edit:SetText("EDIT")
		edit:SetFont("Diablos:Font:TS:35")
		edit:SetWide(200)
		edit.Paint = function(s, w, h)
			local curColor = Diablos.TS:PaintFunctions(s, Diablos.TS.Label, Diablos.TS.LabelHovered, Diablos.TS.LabelDown)
			s:SetTextColor(curColor)
			if valueBtn != 0 then
				surface.SetDrawColor(Diablos.TS.Colors.g) surface.DrawRect(0, 0, w, h)
			else
				surface.SetDrawColor(Diablos.TS.Colors.rl) surface.DrawRect(0, 0, w, h)
			end
		end
		edit.DoClick = function()
			if valueBtn != 0 then
				net.Start("TPTSA:SaveAdminEntity")
					net.WriteUInt(0, 3) -- only for creation
					net.WriteUInt(valueBtn, 8) -- if information have changed, then we save them
					net.WriteEntity(ent)
					net.WriteBool(true) -- true = edit / false = remove
				net.SendToServer()
				frame:Close()
			end
		end

		local remove = vgui.Create("DButton", buttonBottomPanel)
		remove:Dock(RIGHT)
		remove:DockMargin(0, 0, 0, 0)
		remove:SetText("REMOVE")
		remove:SetFont("Diablos:Font:TS:35")
		remove:SetWide(200)
		remove.Paint = function(s, w, h)
			local curColor = Diablos.TS:PaintFunctions(s, Diablos.TS.Label, Diablos.TS.LabelHovered, Diablos.TS.LabelDown)
			s:SetTextColor(curColor)
			surface.SetDrawColor(Diablos.TS.Colors.g) surface.DrawRect(0, 0, w, h)
		end
		remove.DoClick = function()
			net.Start("TPTSA:SaveAdminEntity")
				net.WriteUInt(0, 3) -- only for creation
				net.WriteUInt(0, 8) -- only for creation / edition
				net.WriteEntity(ent)
				net.WriteBool(false) -- true = edit / false = remove
			net.SendToServer()
			frame:Close()
		end

	else

		local save = vgui.Create("DButton", buttonBottomPanel)
		save:Dock(FILL)
		save:DockMargin(0, 0, 0, 0)
		save:SetText("SAVE")
		save:SetFont("Diablos:Font:TS:35")
		save.Paint = function(s, w, h)
			local curColor = Diablos.TS:PaintFunctions(s, Diablos.TS.Label, Diablos.TS.LabelHovered, Diablos.TS.LabelDown)
			s:SetTextColor(curColor)
			if valueBtn != 0 then
				surface.SetDrawColor(Diablos.TS.Colors.g) surface.DrawRect(0, 0, w, h)
			else
				surface.SetDrawColor(Diablos.TS.Colors.rl) surface.DrawRect(0, 0, w, h)
			end
		end
		save.DoClick = function()
			if valueBtn != 0 then
				net.Start("TPTSA:SaveAdminEntity")
					net.WriteUInt(typeEnt, 3)
					net.WriteUInt(valueBtn, 8)
					net.WriteEntity(nil)
					net.WriteBool(false) -- true = edit / false = remove
				net.SendToServer()
				frame:Close()
			end
		end

	end
end)
--PATH addons/the_perfect_training_system/lua/diablos_training/shared/sh_functions_meta.lua:

local meta = FindMetaTable("Player")


/*---------------------------------------------------------------------------
	Check if the training data has been initialized for the player
---------------------------------------------------------------------------*/

function meta:TSIsTrainingDataLaunched()
	return self.TrainingInit
end

/*---------------------------------------------------------------------------
	Set the value as the training data has been initialized for the player
---------------------------------------------------------------------------*/

function meta:TSTrainingDataLaunched()
	self.TrainingInit = true
end



/*---------------------------------------------------------------------------
	Get the training information (taken from the global table) for the player.
		- typeTraining: the type of training you want to extract information from - could also be "badge" to get badge information
			if typeTraining is not set, then we get teh whole table
	If you want a training information not specific, then it returns the whole table
---------------------------------------------------------------------------*/

function meta:TSGetTrainingInfo(typeTraining)
	if not self.Training then return end -- if the training content is not loaded

	typeTraining = typeTraining or ""
	typeTraining = string.lower(typeTraining)

	if typeTraining == "stamina" then
		return self.Training.Trainings.stamina
	elseif typeTraining == "runningspeed" then
		return self.Training.Trainings.runningspeed
	elseif typeTraining == "strength" then
		return self.Training.Trainings.strength
	elseif typeTraining == "attackspeed" then
		return self.Training.Trainings.attackspeed
	elseif typeTraining == "badge" then
		return self.Training.Badge
	else
		return self.Training
	end
end

/*---------------------------------------------------------------------------
	Returns if the player is in a coach job
	This manages if Diablos.TS.CoachJob is a string or a table
---------------------------------------------------------------------------*/

function meta:TSIsSportCoach()
	local teamName = team.GetName(self:Team())
	local isSportCoach = false
	if type(Diablos.TS.CoachJob) == "string" then
		isSportCoach = teamName == Diablos.TS.CoachJob
	elseif type(Diablos.TS.CoachJob) == "table" then
		isSportCoach = table.HasValue(Diablos.TS.CoachJob, teamName)
	end
	return isSportCoach
end

/*---------------------------------------------------------------------------
	Returns if the player is in a blocklisted job for training
	This manages if Diablos.TS.BlocklistedJobs exists or not (new version)
---------------------------------------------------------------------------*/

function meta:TSIsBlocklistedFromTraining()
	local teamName = team.GetName(self:Team())
	local isBlocklisted = false
	if istable(Diablos.TS.BlocklistedJobs) then
		isBlocklisted = table.HasValue(Diablos.TS.BlocklistedJobs, teamName)
	end
	return isBlocklisted
end

/*---------------------------------------------------------------------------
	Get the training subscription
---------------------------------------------------------------------------*/

function meta:TSGetTrainingSubscription()
	return self:TSGetTrainingInfo("Badge").subdate
end


/*---------------------------------------------------------------------------
	Check if the training subscription of the current player is still valid
---------------------------------------------------------------------------*/

function meta:TSHasTrainingSubscription()
	return self:TSGetTrainingSubscription() >= os.time()
end

/*---------------------------------------------------------------------------
	Check if the player is still able to purchase a training subscription
---------------------------------------------------------------------------*/

function meta:TSCanPurchaseTrainingSubscription()
	return self:TSGetTrainingSubscription() < os.time() + Diablos.TS.MaximumSubTime * 60 * 60
end

/*---------------------------------------------------------------------------
	Check if the player has a credit (and therefore is able to access a turnstile once)
---------------------------------------------------------------------------*/

function meta:TSHasTrainingBadgeCredit()
	return (self.badgeCreditSub or 0) > 0
end

/*---------------------------------------------------------------------------
	Check if the player has different abilities (due to his job) than what you can have if you are a "regular player"
---------------------------------------------------------------------------*/

function meta:TSGetSpecificAbilities(typeTraining)
	local jobAbilityTable
	if typeTraining == "stamina" then
		jobAbilityTable = Diablos.TS.StaminaJobAbilities
	elseif typeTraining == "runningspeed" then
		jobAbilityTable = Diablos.TS.RunningSpeedJobAbilities
	elseif typeTraining == "strength" then
		jobAbilityTable = Diablos.TS.StrengthJobAbilities
	elseif typeTraining == "attackspeed" then
		jobAbilityTable = Diablos.TS.AttackSpeedJobAbilities
	end

	if not jobAbilityTable then return end
	local teamName = team.GetName(self:Team())
	return jobAbilityTable[teamName]
end


/*---------------------------------------------------------------------------
	Get the values useful for trainings depending on your level
---------------------------------------------------------------------------*/

function meta:TSGetStaminaTimeDuration()
	if not Diablos.TS:IsTrainingEnabled("stamina") then return 0 end
	local level = Diablos.TS:GetTrainingLevel("stamina", self)
	local levelTable = Diablos.TS:GetTrainingLevelTable("stamina")

	local timeduration = levelTable[level].timeduration

	local specificAbility = self:TSGetSpecificAbilities("stamina")
	if specificAbility then
		timeduration = specificAbility[level].timeduration
	end

	return timeduration
end

function meta:TSGetRunningSpeed()
	if not Diablos.TS:IsTrainingEnabled("runningspeed") then return 0 end
	local level = Diablos.TS:GetTrainingLevel("runningspeed", self)
	local levelTable = Diablos.TS:GetTrainingLevelTable("runningspeed")

	local runspeed = levelTable[level].runspeed

	local specificAbility = self:TSGetSpecificAbilities("runningspeed")
	if specificAbility then
		runspeed = specificAbility[level].runspeed
	end

	return runspeed
end

function meta:TSGetStrengthDamage()
	if not Diablos.TS:IsTrainingEnabled("strength") then return 100 end
	local level = Diablos.TS:GetTrainingLevel("strength", self)
	local levelTable = Diablos.TS:GetTrainingLevelTable("strength")

	local damage = levelTable[level].damage + 100

	local specificAbility = self:TSGetSpecificAbilities("strength")
	if specificAbility then
		damage = specificAbility[level].damage + 100
	end

	return damage
end

function meta:TSGetAttackSpeed()
	if not Diablos.TS:IsTrainingEnabled("attackspeed") then return 100 end
	local level = Diablos.TS:GetTrainingLevel("attackspeed", self)
	local levelTable = Diablos.TS:GetTrainingLevelTable("attackspeed")

	local attackspeed = levelTable[level].attackspeed + 100

	local specificAbility = self:TSGetSpecificAbilities("attackspeed")
	if specificAbility then
		attackspeed = specificAbility[level].attackspeed + 100
	end

	return attackspeed
end


/*---------------------------------------------------------------------------
	Add a specific score for the player:
		- typeTraining: the type of training we're adding the score on
		- scoreValue: the score (points) we're adding for that training
---------------------------------------------------------------------------*/

function meta:TSAddScore(typeTraining, scoreValue)
	self:TSGetTrainingInfo(typeTraining).xp = self:TSGetTrainingInfo(typeTraining).xp + scoreValue
	self:TSGetTrainingInfo(typeTraining).date = os.time() + Diablos.TS.MuscleRest * 60 * 60
	Diablos.TS.Data:SaveTrainingInfo(self) -- Update SQL data
	self:TSUpdateTrainingValues(typeTraining) -- refresh percentage and XP information
end

/*---------------------------------------------------------------------------
	Add a badge subscription time
---------------------------------------------------------------------------*/

function meta:TSAddBadgeSubTime(timeToAdd)
	timeToAdd = timeToAdd * 60 * 60
	self:TSGetTrainingInfo("badge").subdate = math.max(self:TSGetTrainingSubscription(), os.time()) + timeToAdd
end

/*---------------------------------------------------------------------------
	Add a badge credit
---------------------------------------------------------------------------*/

function meta:TSAddBadgeCredit()
	self.badgeCreditSub = 1
end

/*---------------------------------------------------------------------------
	Get the amount of credits (currently, you can only have 0 or 1 credit)
---------------------------------------------------------------------------*/

function meta:TSGetBadgeCredit()
	return self.badgeCreditSub or 0
end

/*---------------------------------------------------------------------------
	Use a credit
---------------------------------------------------------------------------*/

function meta:TSUseBadgeCredit()
	self.badgeCreditSub = self.badgeCreditSub - 1
end


/*---------------------------------------------------------------------------
	Refresh level data (percentage/level value) when the XP value has been changed
	Called:
		- when the player joins
		- when an admin is editing training data on the player
		- when the player ended his training
---------------------------------------------------------------------------*/

function meta:TSUpdateTrainingValues(typeTraining)
	typeTraining = string.lower(typeTraining)
	if typeTraining == "runningspeed" then
		self:TSRefreshRunSpeed()
	elseif typeTraining == "stamina" then
		self:TSRefreshStamina()
	end
end

/*---------------------------------------------------------------------------
	Called on startup to update all the trainings by launching updateTrainingValues()
---------------------------------------------------------------------------*/

function meta:TSUpdateTrainings()
	local trainings = Diablos.TS:GetTrainings()
	for _, typeTraining in ipairs(trainings) do
		self:TSUpdateTrainingValues(typeTraining)
	end
end


-- _G["tc"]["player"]["SetRunSpeed"]
local func = meta.SetRunSpeed
function meta:SetRunSpeed(runspeed)
	func(self, runspeed)

	-- This value is always true to set the runspeed with the stamina EXCEPT when calling SetRunSpeed with the "stamina speed" to avoid stack overflow
	if self.TS_RUN_SPEED_UPD_STAMINA then
		self.TS_JOB_RUN_SPEED = runspeed

		if SERVER then
			net.Start("TPTSA:UpdateRunSpeedTeam")
				net.WriteUInt(runspeed, 10) -- send the runspeed without the stamina abilities
			net.Send(self)
		end

		self:TSRefreshRunSpeed()
	end
end
--PATH addons/the_perfect_training_system/lua/diablos_training/shared/sh_variables.lua:
/*---------------------------------------------------------------------------
	List of the trainings which are changing bones
	They are the trainings which induct bigger bones, and therefore more data to network

	Currently, all the trainings are changing bones!
---------------------------------------------------------------------------*/

Diablos.TS.TrainingsChangingBone = {
	"strength", 
	"stamina",
	"runningspeed",
	"attackspeed",
}

/*---------------------------------------------------------------------------
	Key = class name / Value = Nice Name
	Used for the toolgun when creating an entity
---------------------------------------------------------------------------*/
Diablos.TS.NiceNames = {
	["diablos_card_reader"] = "Card Reader",
	["diablos_dumbbell"] = "Dumbbell",
	["diablos_punching_ball"] = "Punching Ball",
	["diablos_punching_base"] = "Punching Ball", -- we still consider the punching base as the punching ball
	["diablos_treadmill"] = "Treadmill",
	["diablos_turnstile"] = "Turnstile",
	["diablos_weigh_balance"] = "Weigh Balance & Television",
}

/*---------------------------------------------------------------------------
	/!\ Equivalence variables
	These variables are here as they are level values for every training
	Each training has an equivalence table, with the amount of occurences being the amount of bodygroups for the entity for the training
	Treadmill = Stamina & Running Speed - 4 bodygroups
	Dumbbell - Strength - 7 bodygroups
	Punching ball - Attack Speed - 4 bodygroups
---------------------------------------------------------------------------*/


// Time = training time
// Speed increment = the speed 'incremented' when pressing the key
// Speed decrement = the speed 'decremented' if you don't do anything
// Speed decrement time = amount of seconds before we decrement the speed of the speedDecrement value 
Diablos.TS.StaminaEquivalence = {
	{time = 120, speedIncrement = 0.02, speedDecrement = 0.1, speedDecrementTime = 2},
	{time = 140, speedIncrement = 0.015, speedDecrement = 0.12, speedDecrementTime = 1.5},
	{time = 160, speedIncrement = 0.01, speedDecrement = 0.14, speedDecrementTime = 1},
	{time = 180, speedIncrement = 0.005, speedDecrement = 0.16, speedDecrementTime = 0.75},
}

// Time = training time
// Speed increment = the speed 'incremented' when pressing the key
// Speed decrement = the speed 'decremented' if you don't do anything
// Speed decrement time = amount of seconds before we decrement the speed of the speedDecrement value 
Diablos.TS.RunningSpeedEquivalence = {
	{time = 30, speedIncrement = 0.075, speedDecrement = 0.3, speedDecrementTime = 0.5},
	{time = 45, speedIncrement = 0.055, speedDecrement = 0.35, speedDecrementTime = 0.45},
	{time = 60, speedIncrement = 0.035, speedDecrement = 0.4, speedDecrementTime = 0.4},
	{time = 90, speedIncrement = 0.02, speedDecrement = 0.5, speedDecrementTime = 0.3},
}

// Angle = the angle in degrees for each bodygroup (for the treadmill)
Diablos.TS.TreadmillSizeEquivalence = {
	{angle = 0},
	{angle = 5},
	{angle = 10},
	{angle = 15},
}

// kg = the weight in kg
// lbs = the weight in lbs
// nbKeys = the amount of keys you'll have for the training
// time = training time
Diablos.TS.DumbbellSizeEquivalence = {
	{kg = 3, lbs = 6.6, nbKeys = 15, time = 30},
	{kg = 5, lbs = 11, nbKeys = 30, time = 50},
	{kg = 7, lbs = 15.4, nbKeys = 50, time = 70},
	{kg = 9, lbs = 19.8, nbKeys = 65, time = 90},
	{kg = 11, lbs = 24.2, nbKeys = 90, time = 110},
	{kg = 13, lbs = 28.6, nbKeys = 110, time = 130},
	{kg = 15, lbs = 33, nbKeys = 150, time = 150},
}

// kg = the weight in kg
// lbs = the weight in lbs
// mass = the mass of the entity (doesn't change anything in the training itself, just a value for physics)
// time = training time
// nbPoints = the amount of points you have to touch on the punching ball
// note: the more points there is, the easier it is to "grab" a good score
Diablos.TS.PunchingBallSizeEquivalence = {
	{kg = 10, lbs = 22, mass = 30, nbPoints = 8, time = 30,},
	{kg = 20, lbs = 44, mass = 50, nbPoints = 6, time = 60},
	{kg = 30, lbs = 66, mass = 70, nbPoints = 4, time = 120},
	{kg = 40, lbs = 88, mass = 95, nbPoints = 2, time = 200},
}

// Derma buttons used for the training + admin panel
Diablos.TS.DermaButtons = {
	{icon = Diablos.TS.Materials.home, str = "home"},
	{icon = Diablos.TS.Materials.strength, str = "strength"},
	{icon = Diablos.TS.Materials.attackSpeed, str = "attackspeed"},
	{icon = Diablos.TS.Materials.stamina, str = "stamina"},
	{icon = Diablos.TS.Materials.runningSpeed, str = "runningspeed"},
}
--PATH addons/warning_system/lua/warning_system_7452/client/vgui/components/dcombobox.lua:
local PANEL = {}

function PANEL:Init()
    self:SetTextColor(WarningSystem7452em.CFG.theme.Texts)
    self:SetSortItems(false)
    self:SetFont("WarningSystem7452em:20M")
end

function PANEL:Paint(iW, iH)
    draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Secondary)
    draw.RoundedBox(8, 1, 1, iW - 2, iH - 2, WarningSystem7452em.CFG.theme.Tertiary)
end

function PANEL:DoClick()
	if self:IsMenuOpen() then
		return self:CloseMenu()
	end

    self:OpenMenu()
    
    for k, v in pairs(self.Menu:GetCanvas():GetChildren()) do
        v:SetTextColor(WarningSystem7452em.CFG.theme.Texts)
        v:SetFont("WarningSystem7452em:20M")
        function v:Paint(w, h)
            surface.SetDrawColor(WarningSystem7452em.CFG.theme.Secondary)
            surface.DrawOutlinedRect(0, -1, w, h + 1)

            if self:IsHovered() then
                surface.SetDrawColor(WarningSystem7452em.CFG.theme.Main)
                surface.DrawRect(1, 1, w - 2, h - 2)
            end
        end
    end

    function self.Menu:Paint(intW, intH)
        surface.SetDrawColor(WarningSystem7452em.CFG.theme.Tertiary)
        surface.DrawRect(0, 0, intW, intH)
        
        surface.SetDrawColor(WarningSystem7452em.CFG.theme.Secondary)
        surface.DrawRect(0, 0, intW, 1)
    end
end

vgui.Register("WarningSystem7452em:DComboBox", PANEL, "DComboBox")
--PATH lua/bricks_server/languages/bricks_server/polish.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "polish", {
    ["search"] = "Szukaj",
    ["invalidPlayerProfile"] = "Niewłaściwy profil gracza!",
    ["unbound"] = "ROZWIĄZANY",
    ["themes"] = "Motywy",
    ["groups"] = "Grupy",
    ["general"] = "Główne",
    ["itemWhitelisting"] = "Itemy białej listy",
    ["rarities"] = "Rarytasy",
    ["languages"] = "Języki",
    ["disabled"] = "Wyłączono",
    ["enabled"] = "Włączono",
    ["purchase"] = "Zakup",
    ["profile"] = "Profil",
    ["view"] = "Widok",
    ["admin"] = "Admin",
    ["noToolPermission"] = "Nie masz pozwolenia aby używać tego narzędzia.",
    ["settings"] = "Ustawienia",
    ["players"] = "Gracze",
    ["modules"] = "Moduły",
 
    ["userGroupEditor"] = "Edytor grup użytkowników",
    ["addNewGroup"] = "Dodaj nową grupe",
    ["newUserGroup"] = "Jaka powinna być nowa grupa?",
    ["groupName"] = "Nazwa grupy",
 
    ["custom"] = "Niestandardowe",
    ["addNew"] = "Dodaj nowe",
    ["material"] = "Materiał",
    ["directImage"] = "Wpisz URL obrazka .",
    ["default"] = "Podstawowe",
    ["selectMaterial"] = "Musisz wybrać materiał!",
 
    ["errorNoText"] = "BŁĄD: BRAK TEXTU",
    ["selectOption"] = "Wybierz opcje",
    ["selectValue"] = "Prosze wybierz wartość.",
    ["selectColor"] = "Prosze wybierz kolor.",
    ["configSaved"] = "Konfiguracja zapisana!",
    ["cmdNoPermission"] = "Nie masz uprawnień na urzycie tej komendy.",
    ["entityPosUpdated"] = "Zuaktualizowano pozycje jednostki.",
    ["noEntitiesSpawned"] = "Nie pojawiły się żadne zapisane jednostki.",
    ["xEntitiesSpawned"] = "%d zapisanych jednostek zespawnowało się.",
    ["error"] = "ERROR",
 
    ["seconds"] = "%d sekund",
    ["second"] = "%d sekunda",
    ["minutes"] = "%d minut",
    ["minute"] = "%d minuta",
    ["hours"] = "%d godzin",
    ["hour"] = "%d godzina",
 
    ["noRarity"] = "No rarity",
 
    ["config"] = "Konfiguracja",
    ["edit"] = "Edytuj",
    ["editColor"] = "Edytuj kolor",
    ["editName"] = "Edytuj nazwe",
    ["remove"] = "Usuń",
    ["name"] = "Nazwa",
    ["description"] = "Opis",
    ["model"] = "Model",
    ["icon"] = "Ikona",
    ["type"] = "Rodzaj",
    ["price"] = "Cena",
    ["group"] = "Grupa",
    ["category"] = "Kategorja",
    ["color"] = "Kolor",
    ["invalidType"] = "Nieprawidłowy rodzaj.",
    ["invalidOption"] = "Nieprawodłowa opcja.",
    ["invalidChoice"] = "Nieprawidłowy wybór.",
    ["invalidGroup"] = "Nieprawidłowa grupa.",
    ["invalidPlayer"] = "Nieprawidłowy gracz.",
    ["true"] = "PRAWDA",
    ["false"] = "FAŁSZ",
    ["noDescription"] = "Brak opisu",
    ["other"] = "inne",
    ["completed"] = "Ukończone",
    ["close"] = "Zamknij",
    ["main"] = "Menu",
 
    ["valueQuery"] = "Jak powinno wyglądać %s to?",
    ["dataValueQuery"] = "Jakim plikiem powinno to być?",
    ["newNameQuery"] = "Jakie powinno być nowe imie?",
    ["newDescriptionQuery"] = "Jaki powinien być nowy opis?",
    ["newModelQuery"] = "Jaki powinien być nowy model?",
    ["newIconQuery"] = "Jaka powinna być nowa ikona?",
    ["newColorQuery"] = "Jaki powiien być nowy kolor?",
    ["npcTypeQuery"] = "Jakiego rodzaju powinien być ten NPC?",
    ["newTypeQuery"] = "Jaki powinien być nowy rodzaj",
    ["groupRequirementQuery"] = "Jakie powinny być wymagania grupy?",
    ["levelRequirementQuery"] = "Jaki powinien być wymagany lvl?",
    ["newPriceQuery"] = "Jaka powinna być nowa cena?",
    ["newCategoryQuery"] = "Jaka powinna być now akategoria?",
 
    ["npcEditor"] = "Edytor NPC",
    ["addNPC"] = "Dodaj NPC",
    ["newNPC"] = "Nowy NPC",
 
    ["ok"] = "OK",
    ["cancel"] = "Anuluj",
    ["save"] = "Zapisz",
    ["confirm"] = "Potwierdz",
    ["nil"] = "NIL",
    ["none"] = "Żaden",
    ["selected"] = "Wybrany",
    ["unselected"] = "Nie zaznaczone",
    ["add"] = "Dodaj",
 
    ["shootyStick"] = "A shooty stick!",
    ["permanent"] = "Na stałe",
    ["tierX"] = "(Tier %d)",
    ["someDescription"] = "Opis.",
    ["invalidNPC"] = "BŁAD BRICK SERVER: Nieprawidłowy NPC",
 
    ["disconnected"] = "Rozłączono",
    ["profileView"] = "Widok profilu",
    ["loading"] = "Wczytywanie",
    ["statistics"] = "Statystyki",
    ["steamID64"] = "SteamID64",
    ["donationRank"] = "Rnga darczyńcy",
    ["staffRank"] = "Ranga personelu",
    ["currentJob"] = "Obecna praca",
    ["wallet"] = "Portfel",
    ["level"] = "Poziom",
    ["levelX"] = "Poziom %d",
    ["experience"] = "Doświadczenie",
    ["exp"] = "EXP",
    ["money"] = "Pieniądze",
    ["playerLogs"] = "Dziennik gracza",
    ["deleteLogs"] = "Usuń dziennik",
    ["xLogs"] = "%d logs",
    ["xAdminGroups"] = "%d Grup adminów",
    ["noUserGroups"] = "No Grup użytkownikó",
    ["userGroups"] = "Grupy użytkowników: %s",
    ["editUserGroups"] = "Edytuj grupy użytkowników",
    ["newGroupColor"] = "Jaki powinien być nowy kolor grupy?",
    ["newGroupName"] = "Jaka powinna być nowa nazwa grupy?",
    ["groupAlreadyExists"] = "Ta grupa już istnieje!",
    ["whitelist"] = "Biała lista",
    ["unWhitelist"] = "Usuń z białej listy",
    ["addCustom"] = "Dodaj niestandardową",
    ["entClassWhitelist"] = "Jaką klase jednostek chciałbyś wprowadzić na białą liste?",
    ["entClassAlreadyOnList"] = "Ta klasa jednostek jest już na liscie!",
    ["changesServerRestart"] = "Niektóre zmiany nie będą działały do póki nie zresetujesz serwera!",
    ["comingSoon"] = "Zaraz będzie!",
    ["features"] = "CECHY",
    ["addNewRarity"] = "Dodaj nową rzadkość",
    ["newRarity"] = "Nowa rzadkosć",
    ["needToAddRarity"] = "Musisz pierw dodać rzadkość przedmiotu!",
    ["whatRarityItem"] = "Jaką rzadkość powinien mieć ten przedmiot?",
    ["invalidRarity"] = "Niepoprawna rzadkośc.",
    ["rarityAlreadyExists"] = "Rzadkość z tym imieniem już egzystuje!",
    ["themeColorX"] = "Motyw - Kolor %d",
    ["themeTextColor"] = "Motyw - Kolor textu",
    ["presetAccents"] = "Gotowe akcenty",
    ["presetBackgrounds"] = "Gotowe tła",
    ["resetToBaseThemes"] = "Zresetuj bazowy motyw",
    ["resetToCurrentThemes"] = "Zresetuj bazowe motywy",
    ["toggle"] = "Przełącznik",
    ["menu"] = "Menu",
    ["emptyValue"] = "PUSTA WARTOSC",
    ["newValueQuery"] = "Jaka powinna być nowa wartość?",
    ["pressKey"] = "Wciśnij klawisz",
 
    ["entityPlacer"] = "Umieszczacz jednostek",
    ["invalidEntityType"] = "Nieprawidłowy rodzaj jednostki, wybierz odpowiednią z menu narzędzi.",
    ["entityPlaced"] = "Jednostka pomyśłnie umieszczona.",
    ["entityRemoved"] = "Jednostka pomyślnie usunieta.",
    ["canOnlyUseToolEntity"] = "Możesz używać tego narzędzia tylko do przesuwania/tworzenia jednostek.",
    ["entityType"] = "Rodzaj jednostki",
    ["entityPlacerDescription"] = "Umieszczaj i usuwaj jednostki z serwerów Brick i zapisuj ich pozycje. Lewyprzycisk - umieść. Prawyprzycisk - usuń.",
    ["entityPlacerDescriptionSmall"] = "Umieszczaj i usuwaj jednostki",
    ["entityPlacerInstructions"] = "Lewyprzycisk - umieść, Prawyprzycisk - usuń.",
 
    ["npcPlacer"] = "Umiezczacz NPC",
    ["npcPlaced"] = "NPC ustawiony.",
    ["invalidNPCType"] = "Nieprawidłowy rodzaj NPC, wybierz włąściwy z menu narzędzi.",
    ["npcRemoved"] = "NPC usunięty.",
    ["errorNotNPC"] = "Możesz używać tego narzędzia tylko do usuwania/tworzenia NPC.",
    ["npcPlacerDescription"] = "Umieszczaj i usuwaj NPC z serweró Brick, Lewyprzycisk - umieśc, Prawyprzycisk - usuń.",
    ["npcPlacerDescriptionSmall"] = "Umieszczaj i usuwaj NPC z serweró Brick's.",
 
    ["inventory"] = "Ekwipunek",
    ["player"] = "Gracz",
    ["drop"] = "Wyrzuć",
    ["use"] = "Użyj",
    ["dropAll"] = "Wyrzuć wszystko",
    ["delete"] = "Usuń",
} )
--PATH lua/bricks_server/core/shared/sh_functions.lua:
AddCSLuaFile( "sh_cami.lua" )
include( "sh_cami.lua" )

function BRICKS_SERVER.Func.GetAdminGroup( ply )
	if( serverguard ) then
		return serverguard.player:GetRank( ply )
	else
		return ply:GetNWString( "usergroup", "" )
	end

	return ""
end

function BRICKS_SERVER.Func.HasAdminAccess( ply )
	if( not IsValid( ply ) ) then return false end

	if( ply:IsSuperAdmin() ) then return true end
	
	if( BRICKS_SERVER.CONFIG.GENERAL.AdminPermissions ) then
		if( xAdmin ) then
			for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.AdminPermissions ) do
				if( ply:IsUserGroup( k ) ) then
					return true
				end
			end
		else
			return tobool( BRICKS_SERVER.CONFIG.GENERAL.AdminPermissions[BRICKS_SERVER.Func.GetAdminGroup( ply )] )
		end
	end

	return false
end

function BRICKS_SERVER.Func.GetAdminSystemRanks()
	local ranks = {}
	for k, v in pairs( CAMI:GetUsergroups() ) do
		ranks[k] = v.Name
	end

	return ranks
end

function BRICKS_SERVER.Func.IsInGroup( ply, group )
	local groupTable = {}
	for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
		if( group == v[1] ) then
			groupTable = v
			break
		end
	end

	if( groupTable ) then
		if( (groupTable[2] or {})[BRICKS_SERVER.Func.GetAdminGroup( ply )] ) then
			return true
		end

		if( xAdmin ) then
			for k, v in pairs( (groupTable[2] or {}) ) do
				if( ply:IsUserGroup( k ) ) then
					return true
				end
			end
		end

		if( sam and ply.GetSecondaryUserGroup and groupTable[ply:GetSecondaryUserGroup()] ) then
			return true
		end
	else
		return true
	end

	return false
end

function BRICKS_SERVER.Func.GetGroup( ply )
	for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
		if( BRICKS_SERVER.Func.IsInGroup( ply, v[1] ) ) then return v, k end
	end

	for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
		if( v[4] ) then return v, k end
	end

	return false
end

function BRICKS_SERVER.Func.FormatTime( time, miliSeconds, dontShowHours )
	local timeTable = string.FormattedTime( time )

	if( time >= 86400 ) then
		return math.floor( time/86400 ) .. " days, " .. string.format( "%02i:%02i:%02i", timeTable.h-(math.floor( time/86400 )*24), timeTable.m, timeTable.s )
	else
		if( not miliSeconds ) then
			return dontShowHours and string.format( "%02i:%02i", timeTable.m, timeTable.s ) or string.format( "%02i:%02i:%02i", timeTable.h, timeTable.m, timeTable.s )
		else
			return string.format( "%02i:%02i:%02i", timeTable.h, timeTable.m, timeTable.s, timeTable.ms )
		end
	end
end

function BRICKS_SERVER.Func.FormatWordTime( time )
	local timeText = (time != 1 and BRICKS_SERVER.Func.L( "seconds", time )) or BRICKS_SERVER.Func.L( "second", time )

	if( time >= 60 ) then
		if( time < 3600 ) then
			local minutes = math.floor( time/60 )
			timeText = (minutes != 1 and BRICKS_SERVER.Func.L( "minutes", minutes )) or BRICKS_SERVER.Func.L( "minute", minutes )
		else
			if( time < 86400 ) then
				local hours = math.floor( time/3600 )
				timeText = (hours != 1 and BRICKS_SERVER.Func.L( "hours", hours )) or BRICKS_SERVER.Func.L( "hour", hours )
			else
				local days = math.floor( time/86400 )
				timeText = (days != 1 and BRICKS_SERVER.Func.L( "days", days )) or BRICKS_SERVER.Func.L( "day", days )
			end
		end
	end

	return timeText
end

function BRICKS_SERVER.Func.FormatTimeInPlace( time )
	local currentDate = os.date( "*t" )
	local dateTable = os.date( "*t", time )
	
	if( dateTable.day == currentDate.day ) then
		return os.date( "%H:%M", time )
	else
		return os.date( "%d/%m/%Y", time )
	end
end

function BRICKS_SERVER.Func.GetList( listReq )
	if( listReq == "boosters" ) then
		local boosters = {}
		for k, v in pairs( BS_ConfigCopyTable.BOOSTERS ) do
			boosters[k] = v.Title
		end

		return boosters
	elseif( listReq == "vehicles" ) then
		local vehicles = {}
		for k, v in pairs( list.Get( "Vehicles" ) ) do
			vehicles[k] = v.Name or BRICKS_SERVER.Func.L( "error" )
		end

		return vehicles
	elseif( listReq == "weapons" ) then
		local weapons = {}
		for k, v in pairs( list.Get( "Weapon" ) ) do
			weapons[k] = ((v.PrintName or "") != "" and v.PrintName) or k
		end

		return weapons
	elseif( listReq == "entities" ) then
		local entities = {}
		for k, v in pairs( list.Get( "SpawnableEntities" ) ) do
			entities[k] = ((v.PrintName or "") != "" and v.PrintName) or k
		end

		return entities
	elseif( listReq == "resources" ) then
		local resources = {}
		for k, v in pairs( BS_ConfigCopyTable.CRAFTING.Resources ) do
			resources[k] = k
		end

		return resources
	elseif( listReq == "currencies" ) then
		local currencies = {}
		for k, v in pairs( BRICKS_SERVER.DEVCONFIG.Currencies ) do
			currencies[k] = v.Title
		end

		return currencies
	elseif( listReq == "ammo" ) then
		local ammo = {}

		local currentID = 1
		while true do
			local ammoType = game.GetAmmoData( currentID )

			if( ammoType and istable( ammoType ) ) then
				ammo[ammoType.name] = ammoType.name
				currentID = currentID+1
			else
				break
			end
		end

		return ammo
	elseif( listReq == "easySkins" ) then
		local skins = {}
		for k, v in pairs( SH_EASYSKINS.GetSkins() ) do
			skins[v.id] = v.dispName
		end

		return skins
	else
		return {}
	end
end

function BRICKS_SERVER.Func.GetWeaponName( weaponClass )
	if( weapons.GetStored( weaponClass ) and weapons.GetStored( weaponClass ).PrintName ) then
		return weapons.GetStored( weaponClass ).PrintName
	end
end

function BRICKS_SERVER.Func.GetWeaponModel( weaponClass )
	if( weapons.GetStored( weaponClass ) and weapons.GetStored( weaponClass ).WorldModel ) then
		return weapons.GetStored( weaponClass ).WorldModel
	elseif( BRICKS_SERVER.DEVCONFIG.WeaponModels[weaponClass] ) then
		return BRICKS_SERVER.DEVCONFIG.WeaponModels[weaponClass]
	end
end

function BRICKS_SERVER.Func.GetRarityInfo( rarityName )
	for k, v in pairs( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Rarities or {} ) do
		if( (v[1] or "") == rarityName ) then
			return v, k
		end
	end

	return (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Rarities[1], 1
end

function BRICKS_SERVER.Func.GetRarityColor( rarityInfo )
	if( not rarityInfo or not rarityInfo[2] ) then return BRICKS_SERVER.Func.GetTheme( 5 ) end

	local rarityType = rarityInfo[2]
	if( rarityType == "SolidColor" ) then
		return rarityInfo[3]
	elseif( rarityType == "Gradient" ) then
		return rarityInfo[3][1]
	elseif( rarityType == "Fade" ) then
		return rarityInfo[3][1]
	elseif( rarityType == "Rainbow" ) then
		return HSVToColor( CurTime()*360, 1, 1 )
	end
end

function BRICKS_SERVER.Func.GetRarityItems()
	local possibleItems = {}
	for k, v in pairs( list.Get( "Weapon" ) ) do
		local weaponModel = BRICKS_SERVER.Func.GetWeaponModel( k )
		if( weaponModel ) then
			possibleItems[k] = { (v.PrintName or BRICKS_SERVER.Func.L( "nil" )), weaponModel }
		else
			possibleItems[k] = { (v.PrintName or BRICKS_SERVER.Func.L( "nil" )) }
		end
	end

	if( BRICKS_SERVER.Func.IsSubModuleEnabled( "essentials", "crafting" ) ) then
		for k, v in pairs( BRICKS_SERVER.CONFIG.CRAFTING.Resources ) do
			possibleItems[k] = { k, v[1], v[2] }
		end
	end

	for k, v in pairs( BRICKS_SERVER.CONFIG.INVENTORY.Whitelist or {} ) do
		if( k == "spawned_weapon" or k == "spawned_shipment" or string.StartWith( k, "bricks_server_resource" ) ) then continue end

		if( list.Get( "SpawnableEntities" )[k] ) then
			possibleItems[k] = { list.Get( "SpawnableEntities" )[k].PrintName or k }
		else
			possibleItems[k] = { k }
		end
	end

	return possibleItems
end

function BRICKS_SERVER.Func.GetInvTypeCFG( class )
	if( BRICKS_SERVER.DEVCONFIG.INVENTORY.EntTypes[class] ) then
		return BRICKS_SERVER.DEVCONFIG.INVENTORY.EntTypes[class]
	else
		for k, v in pairs( BRICKS_SERVER.DEVCONFIG.INVENTORY.EntTypes ) do
			if( string.EndsWith( k, "*" ) ) then
				local starter = string.Replace( k, "*", "" )
				if( string.StartWith( class, starter ) ) then
					return BRICKS_SERVER.DEVCONFIG.INVENTORY.EntTypes[k]
				end
			end
		end
		return BRICKS_SERVER.DEVCONFIG.INVENTORY.DefaultEntFuncs
	end
end

function BRICKS_SERVER.Func.GetEntTypeField( class, field )
	local entTypeCfg = BRICKS_SERVER.Func.GetInvTypeCFG( class )

	if( entTypeCfg[field] ) then
		return entTypeCfg[field]
	else
		return BRICKS_SERVER.DEVCONFIG.INVENTORY.DefaultEntFuncs[field] or false
	end
end

function BRICKS_SERVER.Func.GetTranslatedString( lang, string, func )
    lang  = lang  or "en"
    string = string or ""

    if lang == "en" or string == "" then
        func( string )
	end
	
	local urlFetch = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=" .. lang .. "&dt=t&q=" .. string.Replace( string, " ", "-" )

    http.Fetch( urlFetch, function( bodyString, bodyLen, headers, successCode )
		local jsonTable = util.JSONToTable( bodyString )

		if( jsonTable and jsonTable[1] and jsonTable[1][1] and jsonTable[1][1][1] ) then
			func( jsonTable[1][1][1] )
		else
			func( false, "INVALID TABLE" )
		end
	end, function( errorMsg )
		func( false, errorMsg )
	end )
end

function BRICKS_SERVER.Func.UTCTime()
	return os.time()
end
--PATH lua/bricks_server/core/shared/sh_itemtypes.lua:
BRICKS_SERVER.DEVCONFIG.INVENTORY = BRICKS_SERVER.DEVCONFIG.INVENTORY or {}
BRICKS_SERVER.DEVCONFIG.INVENTORY.EntTypes = BRICKS_SERVER.DEVCONFIG.INVENTORY.EntTypes or {}

local itemMeta = {
	Register = function( self )
        BRICKS_SERVER.DEVCONFIG.INVENTORY.EntTypes[self.Class] = self
	end
}

itemMeta.__index = itemMeta

function BRICKS_SERVER.Func.CreateItemType( class )
	local item = {
		Class = class
	}
	
	setmetatable( item, itemMeta )
	
	return item
end

for k, v in pairs( file.Find( "bricks_server/itemtypes/*.lua", "LUA" ) ) do
    AddCSLuaFile( "bricks_server/itemtypes/" .. v )
    include( "bricks_server/itemtypes/" .. v )
end
--PATH lua/bricks_server/vgui/bricks_server_config_themes.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel()
    function self.RefreshPanel()
        self:Clear()

        for k, v in pairs( BRICKS_SERVER.BASECONFIG.THEME ) do
            local themeBack = vgui.Create( "DPanel", self )
            themeBack:Dock( TOP )
            themeBack:DockMargin( 0, 0, 0, 5 )
            themeBack:SetTall( 100 )
            local displayColor = BRICKS_SERVER.Func.GetTheme( k ) or Color( 155, 155, 155 )
            themeBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, Color( 0, 0, 0 ) )
                draw.RoundedBox( 5, 2, 2, w-4, h-4, displayColor )

                if( k != 6 ) then
                    draw.SimpleText( BRICKS_SERVER.Func.L( "themeColorX", k ), "BRICKS_SERVER_Font33", 15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                else
                    local textCol = BRICKS_SERVER.Func.GetTheme( 6 )
                    draw.SimpleText( BRICKS_SERVER.Func.L( "themeTextColor" ), "BRICKS_SERVER_Font33", 15, 5, Color( math.abs( textCol.r-255 ), math.abs( textCol.g-255 ), math.abs( textCol.b-255 ) ), 0, 0 )
                end
            end

            local themeMixer = vgui.Create( "DColorMixer", themeBack )
            themeMixer:Dock( RIGHT )
            themeMixer:DockMargin( 5, 5, 5, 5 )
            themeMixer:SetWide( 250 )
            themeMixer:SetPalette( false )
            themeMixer:SetAlphaBar( false) 
            themeMixer:SetWangs( true )
            themeMixer:SetColor( BRICKS_SERVER.Func.GetTheme( k ) )
            themeMixer.ValueChanged = function()
                displayColor = themeMixer:GetColor() or Color( 155, 155, 155 )
                BS_ConfigCopyTable.THEME[k] = themeMixer:GetColor() or Color( 155, 155, 155 )
                BRICKS_SERVER.Func.ConfigChange( "THEME" )
            end
        end

        local accentBack = vgui.Create( "DPanel", self )
        accentBack:Dock( TOP )
        accentBack:DockMargin( 0, 0, 0, 5 )
        accentBack:SetTall( 100 )
        accentBack:DockPadding( 0, 0, 30, 0 )
        accentBack.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
            draw.RoundedBox( 5, 5, 45, w-10, h-45-5, BRICKS_SERVER.Func.GetTheme( 2 ) )

            draw.SimpleText( BRICKS_SERVER.Func.L( "presetAccents" ), "BRICKS_SERVER_Font33", 15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
        end

        local first = true
        for k, v in pairs( BRICKS_SERVER.DEVCONFIG.AccentThemes ) do
            local accentButton = vgui.Create( "DButton", accentBack )
            accentButton:Dock( LEFT )
            accentButton:SetText( "" )
            if( first ) then
                accentButton:DockMargin( 10, 50, 0, 10 )
                first = false
            else
                accentButton:DockMargin( 5, 50, 0, 10 )
            end
            accentButton:SetWide( 40 )
            local changeAlpha = 0
            accentButton.Paint = function( self2, w, h )
                if( self2:IsHovered() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 100 )
                else
                    changeAlpha = math.Clamp( changeAlpha-10, 0, 100 )
                end
                
                draw.RoundedBox( 5, 0, 0, w, h, v[1] )
        
                surface.SetAlphaMultiplier( changeAlpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                surface.SetAlphaMultiplier( 1 )
            end
            accentButton.DoClick = function()
                BS_ConfigCopyTable.THEME[4] = v[1]
                BS_ConfigCopyTable.THEME[5] = v[2]
                BRICKS_SERVER.Func.ConfigChange( "THEME" )
                self.RefreshPanel()
            end
        end

        local backgroundBack = vgui.Create( "DPanel", self )
        backgroundBack:Dock( TOP )
        backgroundBack:DockMargin( 0, 0, 0, 5 )
        backgroundBack:SetTall( 100 )
        backgroundBack:DockPadding( 0, 0, 30, 0 )
        backgroundBack.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
            draw.RoundedBox( 5, 5, 45, w-10, h-45-5, BRICKS_SERVER.Func.GetTheme( 2 ) )

            draw.SimpleText( BRICKS_SERVER.Func.L( "presetBackgrounds" ), "BRICKS_SERVER_Font33", 15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
        end

        local first = true
        for k, v in pairs( BRICKS_SERVER.DEVCONFIG.BackgroundThemes ) do
            local backgroundButton = vgui.Create( "DButton", backgroundBack )
            backgroundButton:Dock( LEFT )
            backgroundButton:SetText( "" )
            if( first ) then
                backgroundButton:DockMargin( 10, 50, 0, 10 )
                first = false
            else
                backgroundButton:DockMargin( 5, 50, 0, 10 )
            end
            backgroundButton:SetWide( 40 )
            local changeAlpha = 0
            backgroundButton.Paint = function( self2, w, h )
                if( self2:IsHovered() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 100 )
                else
                    changeAlpha = math.Clamp( changeAlpha-10, 0, 100 )
                end
                
                draw.RoundedBox( 5, 0, 0, w, h, v[1] )
        
                surface.SetAlphaMultiplier( changeAlpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                surface.SetAlphaMultiplier( 1 )
            end
            backgroundButton.DoClick = function()
                BS_ConfigCopyTable.THEME[0] = v[1]
                BS_ConfigCopyTable.THEME[1] = v[2]
                BS_ConfigCopyTable.THEME[2] = v[3]
                BS_ConfigCopyTable.THEME[3] = v[4]
                BS_ConfigCopyTable.THEME[6] = v[6]
                BRICKS_SERVER.Func.ConfigChange( "THEME" )
                self.RefreshPanel()
            end
        end

        local themeReset = vgui.Create( "DButton", self )
        themeReset:Dock( TOP )
        themeReset:SetText( "" )
        themeReset:DockMargin( 0, 0, 0, 5 )
        themeReset:SetTall( 40 )
        local changeAlpha = 0
        themeReset.Paint = function( self2, w, h )
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
    
            draw.SimpleText( BRICKS_SERVER.Func.L( "resetToBaseThemes" ), "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        themeReset.DoClick = function()
            BS_ConfigCopyTable.THEME = table.Copy( BRICKS_SERVER.BASECONFIG.THEME )
            BRICKS_SERVER.Func.ConfigChange( "THEME" )
            self.RefreshPanel()
        end

        local themeResetPrevious = vgui.Create( "DButton", self )
        themeResetPrevious:Dock( TOP )
        themeResetPrevious:SetText( "" )
        themeResetPrevious:DockMargin( 0, 0, 0, 5 )
        themeResetPrevious:SetTall( 40 )
        local changeAlpha = 0
        themeResetPrevious.Paint = function( self2, w, h )
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
    
            draw.SimpleText( BRICKS_SERVER.Func.L( "resetToCurrentThemes" ), "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        themeResetPrevious.DoClick = function()
            BS_ConfigCopyTable.THEME = table.Copy( BRICKS_SERVER.CONFIG.THEME )
            BRICKS_SERVER.Func.ConfigChange( "THEME" )
            self.RefreshPanel()
        end
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_themes", PANEL, "bricks_server_scrollpanel" )
--PATH lua/bricks_server/vgui/bricks_server_dframepanel.lua:
local PANEL = {}

function PANEL:Init()
    self.headerHeight = 40
    self:DockPadding( 0, self.headerHeight, 0, 0 )

    self.removeOnClose = true
    self:CreateCloseButton()
end

function PANEL:CreateCloseButton()
    if( self.dontShowClose ) then return end

    local size = 24

    if( IsValid( self.closeButton ) ) then
        self.closeButton:SetSize( size, size )
        self.closeButton:SetPos( self:GetWide()-size-((self.headerHeight-size)/2), (self.headerHeight/2)-(size/2) )
        return
    end

    self.closeButton = vgui.Create( "DButton", self )
	self.closeButton:SetSize( size, size )
	self.closeButton:SetPos( self:GetWide()-size-((self.headerHeight-size)/2), (self.headerHeight/2)-(size/2) )
	self.closeButton:SetText( "" )
    local CloseMat = Material( "materials/bricks_server/close.png" )
    local textColor = BRICKS_SERVER.Func.GetTheme( 6 )
	self.closeButton.Paint = function( self2, w, h )
		if( self2:IsHovered() and !self2:IsDown() ) then
			surface.SetDrawColor( textColor.r*0.6, textColor.g*0.6, textColor.b*0.6 )
		elseif( self2:IsDown() || self2.m_bSelected ) then
			surface.SetDrawColor( textColor.r*0.8, textColor.g*0.8, textColor.b*0.8 )
		else
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
		end

		surface.SetMaterial( CloseMat )
		surface.DrawTexturedRect( 0, 0, w, h )
	end
    self.closeButton.DoClick = function()
        if( self.onCloseFunc ) then
            self.onCloseFunc()
        end

        if( self.removeOnClose or BRS_REMOVEONCLOSE ) then
            self:Remove()
        else
            self:SetVisible( false )
        end
    end
end

function PANEL:OnSizeChanged( newW, newH )
    self:CreateCloseButton()
end

function PANEL:SetHeader( header )
    self.header = header
end

function PANEL:DisableClose()
    self.dontShowClose = true

    if( IsValid( self.closeButton ) ) then
        self.closeButton:Remove()
    end
end

local rounded = 5
function PANEL:Paint( w, h )
    BRICKS_SERVER.BSHADOWS.BeginShadow()
    local x, y = self:LocalToScreen( 0, 0 )
    draw.RoundedBox( rounded, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )			
    BRICKS_SERVER.BSHADOWS.EndShadow( 1, 2, 2, 255, 0, 0, false )

    draw.RoundedBoxEx( rounded, 0, 0, w, self.headerHeight, BRICKS_SERVER.Func.GetTheme( 0 ), true, true, false, false )

    draw.SimpleText( (self.header or BRICKS_SERVER.Func.L( "menu" )), "BRICKS_SERVER_Font30", 10, (self.headerHeight or 40)/2-2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
end

vgui.Register( "bricks_server_dframepanel", PANEL, "DPanel" )
--PATH lua/bricks_server/vgui/bricks_server_gradientanim.lua:
local PANEL = {}

function PANEL:Init()

	self.movePanel = vgui.Create( "DPanel", self )
	self.movePanel:SetPos( 0, 0 )
	self.movePanel.Paint = function( self2, w, h )
		local movePanelX, movePanelY = self2:GetPos()

		BRICKS_SERVER.Func.DrawRoundedMask( (self.cornerRadius or 5), -movePanelX+(self.roundedBoxX or 0), -movePanelY+(self.roundedBoxY or 0), (self.roundedBoxW or self:GetWide()), (self.roundedBoxH or self:GetTall()), function()
			if( not BRICKS_SERVER.CONFIG.GENERAL["Use Textured Gradients (Better FPS)"] ) then
				if( self.direction != 1 ) then
					BRICKS_SERVER.Func.DrawGradientBox( 0, 0, self.animSize, h, self.direction, unpack( self.colors ) )
					BRICKS_SERVER.Func.DrawGradientBox( self.animSize, 0, self.animSize, h, self.direction, unpack( table.Reverse( self.colors ) ) )
					BRICKS_SERVER.Func.DrawGradientBox( self.animSize*2, 0, self.animSize, h, self.direction, unpack( self.colors ) )
				else
					BRICKS_SERVER.Func.DrawGradientBox( 0, 0, w, self.animSize, self.direction, unpack( self.colors ) )
					BRICKS_SERVER.Func.DrawGradientBox( 0, self.animSize, w, self.animSize, self.direction, unpack( table.Reverse( self.colors ) ) )
					BRICKS_SERVER.Func.DrawGradientBox( 0, self.animSize*2, w, self.animSize, self.direction, unpack( self.colors ) )
				end
			else
				if( self.direction != 1 ) then
					BRICKS_SERVER.Func.DrawTexturedGradientBox( 0, 0, self.animSize, h, self.direction, unpack( self.colors ) )
					BRICKS_SERVER.Func.DrawTexturedGradientBox( self.animSize, 0, self.animSize, h, self.direction, unpack( table.Reverse( self.colors ) ) )
					BRICKS_SERVER.Func.DrawTexturedGradientBox( self.animSize*2, 0, self.animSize, h, self.direction, unpack( self.colors ) )
				else
					BRICKS_SERVER.Func.DrawTexturedGradientBox( 0, 0, w, self.animSize, self.direction, unpack( self.colors ) )
					BRICKS_SERVER.Func.DrawTexturedGradientBox( 0, self.animSize, w, self.animSize, self.direction, unpack( table.Reverse( self.colors ) ) )
					BRICKS_SERVER.Func.DrawTexturedGradientBox( 0, self.animSize*2, w, self.animSize, self.direction, unpack( self.colors ) )
				end
			end
		end )
	end

	self:SetColors( Color( 255, 255, 255 ), Color( 0, 0, 0 ) )
	self:SetDirection( 0 )
	self:SetAnimTime( 2 )
end

function PANEL:StartAnim()
	self.movePanel:MoveTo( ((self.direction != 1 and -(self.animSize*2)) or 0), ((self.direction == 1 and -(self.animSize*2)) or 0), self.animTime, 0, 1, function()
		self.movePanel:SetPos( 0, 0 )
		self:StartAnim()
	end )
end

function PANEL:OnSizeChanged( w, h )
	if( self.direction != 1 ) then
		self.movePanel:SetTall( h )
	else
		self.movePanel:SetWide( w )
	end

	self:SetAnimSize( (self.direction != 1 and w) or h )
end

function PANEL:SetAnimSize( animSize )
	self.animSize = animSize
	
	if( self.direction != 1 ) then
		self.movePanel:SetWide( self.animSize*3 )
	else
		self.movePanel:SetTall( self.animSize*3 )
	end
end

function PANEL:SetColors( ... )
	self.colors = { ... }
end

function PANEL:SetCornerRadius( cornerRadius )
    self.cornerRadius = cornerRadius
end

function PANEL:SetAnimTime( animTime )
    self.animTime = animTime
end

function PANEL:SetDirection( direction )
	self.direction = direction

	self:SetAnimSize( (self.direction != 1 and self:GetWide()) or self:GetTall() )
end

function PANEL:SetRoundedBoxDimensions( roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH )
    self.roundedBoxX, self.roundedBoxY, self.roundedBoxW, self.roundedBoxH = roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH
end

function PANEL:TasteTheRainbow()
    self:SetAnimTime( 5 )
    self:SetAnimSize( ((self.direction != 1 and self:GetWide()) or self:GetTall())*6 )

    local rainbowColors, range = {}, 10
    for i = 1, range do
        table.insert( rainbowColors, HSVToColor( (i/range)*360, 1, 1 ) )
	end

    self:SetColors( unpack( rainbowColors ) )
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gradientanim", PANEL, "DPanel" )
--PATH lua/bricks_server/vgui/bricks_server_profile.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel( f4Panel, sheetButton )
    if( not IsValid( f4Panel ) ) then return end

    function f4Panel.FillProfile()
        if( not IsValid( self ) ) then return end
        
        self:Clear()
        
        local profileModelBack = vgui.Create( "DPanel", self )
        profileModelBack:Dock( LEFT )
        profileModelBack:DockMargin( 0, 0, 5, 0 )
        profileModelBack:SetWide( (f4Panel:GetWide()-BRICKS_SERVER.DEVCONFIG.MainNavWidth-20-5)/2 )
        local plyName = LocalPlayer():Nick()
        surface.SetFont( "BRICKS_SERVER_Font25" )
        local textX, textY = surface.GetTextSize( plyName )
        local donationRank
        for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
            if( BRICKS_SERVER.Func.IsInGroup( LocalPlayer(), v[1] ) ) then
                donationRank = k
                break
            end
        end

        surface.SetFont( "BRICKS_SERVER_Font20" )
        local donationTextX, donationTextY = surface.GetTextSize( (BRICKS_SERVER.CONFIG.GENERAL.Groups[donationRank] or {})[1] or "" )
        donationTextX = donationTextX+10
        local totalW = textX+donationTextX+5
        profileModelBack.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

            draw.SimpleText( plyName, "BRICKS_SERVER_Font25", (w/2)-(totalW/2), h-(h/10), BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )

            if( BRICKS_SERVER.CONFIG.GENERAL.Groups[donationRank] ) then
                draw.RoundedBox( 5, (w/2)-(totalW/2)+textX+5, h-(h/10)-(donationTextY/2)+1.5, donationTextX, donationTextY, (BRICKS_SERVER.CONFIG.GENERAL.Groups[donationRank][3] or BRICKS_SERVER.Func.GetTheme( 5 ))  )
                draw.SimpleText( BRICKS_SERVER.CONFIG.GENERAL.Groups[donationRank][1], "BRICKS_SERVER_Font20", (w/2)-(totalW/2)+textX+5+(donationTextX/2), h-(h/10), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
        end

        local profileModelBack = vgui.Create( "DModelPanel", profileModelBack )
        profileModelBack:Dock( FILL )
        profileModelBack:DockMargin( 10, 10, 10, 10 )
        profileModelBack:SetModel( LocalPlayer():GetModel() or "" )
        function profileModelBack:LayoutEntity( Entity ) return end

        local dataToShow = {
            [1] = { BRICKS_SERVER.Func.L( "name" ), LocalPlayer():Nick() },
            [2] = { BRICKS_SERVER.Func.L( "steamID64" ), LocalPlayer():SteamID64() },
            [3] = { BRICKS_SERVER.Func.L( "donationRank" ), (BRICKS_SERVER.CONFIG.GENERAL.Groups[donationRank] or {})[1] or BRICKS_SERVER.Func.L( "none" ) },
            [4] = { BRICKS_SERVER.Func.L( "staffRank" ), BRICKS_SERVER.Func.GetAdminGroup( LocalPlayer() ) }
        }

        if( DarkRP ) then
            table.insert( dataToShow, { BRICKS_SERVER.Func.L( "currentJob" ), LocalPlayer():getDarkRPVar( "job" ) or BRICKS_SERVER.Func.L( "none" ) } )
            table.insert( dataToShow, { BRICKS_SERVER.Func.L( "wallet" ), DarkRP.formatMoney( LocalPlayer():getDarkRPVar( "money" ) or 0 ) } )
        end
    
        if( BRICKS_SERVER.Func.IsSubModuleEnabled( "essentials", "levelling" ) ) then
            table.insert( dataToShow, { BRICKS_SERVER.Func.L( "level" ), BRS_LEVEL or 0 } )
            table.insert( dataToShow, { BRICKS_SERVER.Func.L( "experience" ), string.Comma( math.Round( BRS_EXPERIENCE or 0 ) ) } )
        end

        if( BRICKS_SERVER.Func.IsSubModuleEnabled( "default", "currencies" ) ) then
            for k, v in pairs( BRICKS_SERVER.CONFIG.CURRENCIES or {} ) do
                if( not BRICKS_SERVER.DEVCONFIG.Currencies["custom_" .. k] ) then continue end

                local currencyTable = BRICKS_SERVER.DEVCONFIG.Currencies["custom_" .. k]

                table.insert( dataToShow, { v.Name, currencyTable.formatFunction( currencyTable.getFunction( LocalPlayer() ) or 0 ) } )
            end
        end
        
        local profileInfoBack = vgui.Create( "DPanel", self )
        profileInfoBack:Dock( FILL )
        local initialSpacer = 50
        local spacing = 30
        profileInfoBack.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

            for k, v in ipairs( dataToShow ) do
                local pos = k
                if( k % 2 == 0 ) then
                    pos = k-1
                    draw.SimpleText( v[1], "BRICKS_SERVER_Font25", (w/4)*3, initialSpacer+(spacing*(pos-1)), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                    draw.SimpleText( v[2], "BRICKS_SERVER_Font20", (w/4)*3, initialSpacer+(spacing*(pos-1))+20, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                else
                    draw.SimpleText( v[1], "BRICKS_SERVER_Font25", (w/4)*1, initialSpacer+(spacing*(pos-1)), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                    draw.SimpleText( v[2], "BRICKS_SERVER_Font20", (w/4)*1, initialSpacer+(spacing*(pos-1))+20, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                end
            end
        end
    end
    f4Panel.FillProfile()

    hook.Add( "OnPlayerChangedTeam", "BRS.OnPlayerChangedTeam.F4Profile", function()
        timer.Simple( 1, function()
            if( f4Panel.FillProfile ) then
                f4Panel.FillProfile()
            end
        end )
    end )
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_profile", PANEL, "DPanel" )
--PATH lua/bricks_server/modules/default/submodules/currencies/vgui/bricks_server_config_currencies.lua:
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
--PATH addons/sl_main_system/lua/autorun/client/cl_menu.lua:
-- cl

surface.CreateFont("M_Font1", {
	font = "Orbitron",
	size = W(30),
	weight = 100,
	antialias = true,
	extended = true,
})

surface.CreateFont("M_Font2", {
	font = "Orbitron",
	size = W(45),
	weight = 100,
	antialias = true,
	extended = true,
})

surface.CreateFont("M_Font2.5", {
	font = "Orbitron",
	size = W(35),
	weight = 100,
	antialias = true,
	extended = true,
})

surface.CreateFont("M_Font3", {
	font = "Orbitron",
	size = W(25),
	weight = 100,
	antialias = true,
	extended = true,
})

surface.CreateFont("M_Font4", {
	font = "Orbitron",
	size = W(55),
	weight = 100,
	antialias = true,
	extended = true,
})

surface.CreateFont("M_Font5", {
	font = "Orbitron",
	size = W(20),
	weight = 125,
	antialias = true,
	extended = true,
})

surface.CreateFont("M_Font6", {
	font = "Orbitron",
	size = W(15),
	weight = 100,
	antialias = true,
	extended = true,
})

surface.CreateFont("M_Font7", {
	font = "Orbitron",
	size = W(10),
	weight = 100,
	antialias = true,
	extended = true,
})
--------

surface.CreateFont("MNew_Font1", {
	font = "Montserrat Medium",
	size = W(33),
	weight = 100,
	antialias = true,
	extended = true,
})

surface.CreateFont("MNew_Font2", {
	font = "Montserrat Medium",
	size = W(45),
	weight = 100,
	antialias = true,
	extended = true,
})

surface.CreateFont("MNew_Font3", {
	font = "Montserrat Medium",
	size = W(25),
	weight = 100,
	antialias = true,
	extended = true,
})

surface.CreateFont("MNew_Font4", {
	font = "Montserrat Medium",
	size = W(55),
	weight = 100,
	antialias = true,
	extended = true,
})

surface.CreateFont("MNew_Font5", {
	font = "Montserrat Medium",
	size = W(20),
	weight = 125,
	antialias = true,
	extended = true,
})

surface.CreateFont("MNew_Font6", {
	font = "Montserrat Medium",
	size = W(29),
	weight = 100,
	antialias = true,
	extended = true,
})


surface.CreateFont("B_Font1", {
	font = "Coral Reef",
	size = W(20),
	weight = 100,
	antialias = true,
	extended = true,
})
surface.CreateFont("B_Font2", {
	font = "Coral Reef",
	size = W(60),
	weight = 100,
	antialias = true,
	extended = true,
})
surface.CreateFont("B_Font3", {
	font = "Coral Reef",
	size = W(15),
	weight = 100,
	antialias = true,
	extended = true,
})
surface.CreateFont("B_Font4", {
	font = "Coral Reef",
	size = W(50),
	weight = 100,
	antialias = true,
	extended = true,
})
surface.CreateFont("B_Font5", {
	font = "Coral Reef",
	size = W(22),
	weight = 100,
	antialias = true,
	extended = true,
})
surface.CreateFont("B_Font6", {
	font = "Coral Reef",
	size = W(30),
	weight = 100,
	antialias = true,
	extended = true,
})
surface.CreateFont("B_Font7", {
	font = "Coral Reef",
	size = W(40),
	weight = 100,
	antialias = true,
	extended = true,
})

surface.CreateFont("R_Font1", {
	font = "Posterama 2001",
	size = W(44),
	antialias = true,
	extended = true,
})
surface.CreateFont("R_Font2", {
	font = "Posterama 2001",
	size = W(25),
	antialias = true,
	extended = true,
})
----------------------------------------------------------------------

-- Table pour stocker les options
local options = {
    { type = "checkbox", label = "Option 1", value = false },
    { type = "checkbox", label = "Option 2", value = true },
    { type = "keybind", label = "Keybind 1", value = "NONE" },
    { type = "keybind", label = "Keybind 2", value = "NONE" }
}

-- Fonction pour créer le menu d'options
local function createOptionsMenu()
    local frame = vgui.Create("DFrame")
    frame:SetTitle("Options Menu")
    frame:SetSize(300, 400)
    frame:Center()
    frame:MakePopup()

    local yPos = 30

    for _, option in ipairs(options) do
        if option.type == "checkbox" then
            local checkBox = vgui.Create("DCheckBoxLabel", frame)
            checkBox:SetPos(10, yPos)
            checkBox:SetText(option.label)
            checkBox:SetValue(option.value and 1 or 0)
            checkBox:SizeToContents()
            checkBox.OnChange = function(_, value)
                option.value = value
            end
            yPos = yPos + 30
        elseif option.type == "keybind" then
            local keyBindButton = vgui.Create("DButton", frame)
            keyBindButton:SetPos(10, yPos)
            keyBindButton:SetSize(280, 30)
            keyBindButton:SetText(option.label .. ": " .. option.value)
            keyBindButton.DoClick = function()
                keyBindButton:SetText(option.label .. ": Press a key...")
                keyBindButton.OnKeyCodePressed = function(_, keyCode)
                    local keyName = input.GetKeyName(keyCode)
                    option.value = keyName
                    keyBindButton:SetText(option.label .. ": " .. keyName)
                end
            end
            yPos = yPos + 40
        end
    end
end

-- Ajouter une commande pour ouvrir le menu d'options
concommand.Add("open_options_menu", function()
    createOptionsMenu()
end)


if CLIENT then
    local function OpenComestiqueAdmin()
        local frame = vgui.Create("TLFrame")
        frame:SetSize(W(300), H(500))
		frame:ShowCloseButton(true)
		frame:SetHeader("Menu - Cosmetique")
        frame:Center()
        frame:MakePopup()
        
        local playerList = vgui.Create("DListView", frame)
        playerList:SetPos(W(10), H(30+40))
        playerList:SetSize(W(280), H(300))
        playerList:AddColumn("Players")
        for _, ply in ipairs(player.GetAll()) do
            playerList:AddLine(ply:Nick(), ply:SteamID64())
        end

        local modelEntry = vgui.Create("DTextEntry", frame)
        modelEntry:SetPos(W(10), H(340+40))
        modelEntry:SetSize(W(280), H(25))
        modelEntry:SetPlaceholderText("Enter model path here")

        local applyButton = vgui.Create("TLButton", frame)
        applyButton:SetPos(W(10), H(370+40))
        applyButton:SetSize(W(280), H(25))
        applyButton:SetText("Apply Model")
        
        applyButton.DoClick = function()
            local selectedLine = playerList:GetSelectedLine()
            if selectedLine then
                local selectedPlayer = playerList:GetLine(selectedLine):GetColumnText(2)
                local modelPath = modelEntry:GetValue()
                net.Start("SetCosmetiqueArme")
                net.WriteString(selectedPlayer)
                net.WriteString(modelPath)
                net.SendToServer()
            else
                chat.AddText(Color(255, 0, 0), "No player selected!")
            end
        end

        local deleteButton = vgui.Create("TLButton", frame)
        deleteButton:SetPos(W(10), H(400+40))
        deleteButton:SetSize(W(280), H(25))
        deleteButton:SetText("Delete Comestique Data")

        deleteButton.DoClick = function()
            local selectedLine = playerList:GetSelectedLine()
            if selectedLine then
                local selectedPlayer = playerList:GetLine(selectedLine):GetColumnText(2)
                net.Start("DeleteComestiqueData")
                net.WriteString(selectedPlayer)
                net.SendToServer()
            else
                chat.AddText(Color(255, 0, 0), "No player selected!")
            end
        end
    end

    concommand.Add("comestique_admin", OpenComestiqueAdmin)
end

if CLIENT then
    local function OpenPMPERSOAdmin()
        local frame = vgui.Create("TLFrame")
        frame:SetSize(W(300), H(500))
		frame:ShowCloseButton(true)
		frame:SetHeader("Menu - PM PERSO")
        frame:Center()
        frame:MakePopup()
        
        local playerList = vgui.Create("DListView", frame)
        playerList:SetPos(W(10), H(30+40))
        playerList:SetSize(W(280), H(300))
        playerList:AddColumn("Players")
        for _, ply in ipairs(player.GetAll()) do
            playerList:AddLine(ply:Nick(), ply:SteamID64())
        end

        local modelEntry = vgui.Create("DTextEntry", frame)
        modelEntry:SetPos(W(10), H(340+40))
        modelEntry:SetSize(W(280), H(25))
        modelEntry:SetPlaceholderText("Enter model path here")

        local applyButton = vgui.Create("TLButton", frame)
        applyButton:SetPos(W(10), H(370+40))
        applyButton:SetSize(W(280), H(25))
        applyButton:SetText("Apply Model")
        
        applyButton.DoClick = function()
            local selectedLine = playerList:GetSelectedLine()
            if selectedLine then
                local selectedPlayer = playerList:GetLine(selectedLine):GetColumnText(2)
                local modelPath = modelEntry:GetValue()
                net.Start("SetPMPERSO")
                net.WriteString(selectedPlayer)
                net.WriteString(modelPath)
                net.SendToServer()
            else
                chat.AddText(Color(255, 0, 0), "No player selected!")
            end
        end

        local deleteButton = vgui.Create("TLButton", frame)
        deleteButton:SetPos(W(10), H(400+40))
        deleteButton:SetSize(W(280), H(25))
        deleteButton:SetText("Delete PMPERSO Data")

        deleteButton.DoClick = function()
            local selectedLine = playerList:GetSelectedLine()
            if selectedLine then
                local selectedPlayer = playerList:GetLine(selectedLine):GetColumnText(2)
                net.Start("DeletePMPERSOData")
                net.WriteString(selectedPlayer)
                net.SendToServer()
            else
                chat.AddText(Color(255, 0, 0), "No player selected!")
            end
        end
    end

    concommand.Add("pmperso_admin", OpenPMPERSOAdmin)
end

function OpenTitreAdmin()
    -- cl_titre.lua
    local frame = vgui.Create("DFrame")
    frame:SetSize(500, 400)
    frame:Center()
    frame:SetTitle("Selectionner un Titre")
    frame:MakePopup()

    local titleList = vgui.Create("DListView", frame)
    titleList:SetSize(200, 350)
    titleList:SetPos(10, 30)
    titleList:AddColumn("Titre")

    for k, v in pairs(TITRE_SL) do
        titleList:AddLine(k)
    end

    local playerList = vgui.Create("DListView", frame)
    playerList:SetSize(200, 350)
    playerList:SetPos(220, 30)
    playerList:AddColumn("Joueurs Proches")

    local button = vgui.Create("DButton", frame)
    button:SetSize(100, 30)
    button:SetPos(370, 350)
    button:SetText("Attribuer Titre")

    -- Remplir la liste des joueurs proches
    local function UpdatePlayerList()
        playerList:Clear()
        local ply = LocalPlayer()
        for _, v in ipairs(ents.FindInSphere(ply:GetPos(), 500)) do
            if v:IsPlayer() then
                playerList:AddLine(v:Nick(), v:SteamID64())
            end
        end
    end

    UpdatePlayerList()

    -- Action du bouton
    button.DoClick = function()
        local selectedTitle = titleList:GetSelectedLine()
        local selectedPlayer = playerList:GetSelectedLine()
        if selectedTitle and selectedPlayer then
            local titleName = titleList:GetLine(selectedTitle):GetValue(1)
            local playerSteamID64 = playerList:GetLine(selectedPlayer):GetValue(2)

            net.Start("AssignTitle")
            net.WriteString(titleName)
            net.WriteString(playerSteamID64)
            net.SendToServer()
        else
            chat.AddText(Color(255, 0, 0), "Sélectionnez un titre et un joueur.")
        end
    end
end

concommand.Add("titre_admin", OpenTitreAdmin)

function OpenCK()
    -- cl_titre.lua
    local frame = vgui.Create("DFrame")
    frame:SetSize(500, 400)
    frame:Center()
    frame:SetTitle("Selectionner un Joueur")
    frame:MakePopup()

    local playerList = vgui.Create("DListView", frame)
    playerList:SetSize(200, 350)
    playerList:SetPos(220, 30)
    playerList:AddColumn("Joueurs Proches")

    local button = vgui.Create("DButton", frame)
    button:SetSize(100, 30)
    button:SetPos(370, 350)
    button:SetText("CK")

    -- Remplir la liste des joueurs proches
    local function UpdatePlayerList()
        playerList:Clear()
        local ply = LocalPlayer()
        for _, v in ipairs(ents.FindInSphere(ply:GetPos(), 500)) do
            if v:IsPlayer() then
                playerList:AddLine(v:Nick(), v:SteamID64())
            end
        end
    end

    UpdatePlayerList()

    -- Action du bouton
    button.DoClick = function()
        local selectedPlayer = playerList:GetSelectedLine()
        if selectedPlayer then
            local playerSteamID64 = playerList:GetLine(selectedPlayer):GetValue(2)

            net.Start("CKPlayer")
            net.WriteString(playerSteamID64)
            net.SendToServer()
        else
            chat.AddText(Color(255, 0, 0), "Sélectionnez un joueur.")
        end
    end
end

concommand.Add("ck_admin", OpenCK)
--PATH addons/sl_utils/lua/autorun/client/cl_permaload.lua:
/*
   ____          _          _   ____          __  __       _ _                     
  / ___|___   __| | ___  __| | | __ ) _   _  |  \/  | __ _| | |__   ___  _ __ ___  
 | |   / _ \ / _` |/ _ \/ _` | |  _ \| | | | | |\/| |/ _` | | '_ \ / _ \| '__/ _ \ 
 | |__| (_) | (_| |  __/ (_| | | |_) | |_| | | |  | | (_| | | |_) | (_) | | | (_) |
  \____\___/ \__,_|\___|\__,_| |____/ \__, | |_|  |_|\__,_|_|_.__/ \___/|_|  \___/ 
                                      |___/                                        
*/

if not PermaProps then PermaProps = {} end

print("---------------------------------")
print("| Loading ClientSide PermaProps |")
print("---------------------------------")

for k, v in pairs(file.Find("permaprops/cl_*.lua", "LUA")) do
	
	include("permaprops/".. v)
	print("permaprops/".. v)


end

print("---------------------------------")
print("| Loading Shared PermaProps |")
print("---------------------------------")

for k, v in pairs(file.Find("permaprops/sh_*.lua", "LUA")) do
	
	include("permaprops/".. v)
	print("permaprops/".. v)


end

print("---------------------------------")
--PATH addons/squad_reborn/lua/autorun/client/drawarcx.lua:
-- VERSION 2.0 released 03/26/2017
-- Changes:
--   1.	Half as many polygons per arc
--   2.	Only one loop for inner and outer points
--   3.	Uses quads instead of triangles
--   4.	Odd-degreed arcs aren't malformed.
--   5.	No longer needs roughness. Just put 1 in case of old version conflicts.
--   6.	Microoptimizations.
-- Enjoy! ~Bobbleheadbob
-- Draws an arc on your screen.
-- startang and endang are in degrees,
-- radius is the total radius of the outside edge to the center.
-- cx, cy are the x,y coordinates of the center of the arc.
-- roughness is only used in old versions. Just put 1 to prevent conflicts
local cos , sin , abs , rad1 , log , pow = math.cos , math.sin , math.abs , math.rad , math.log , math.pow
local surface = surface

function draw.gsArc( cx , cy , radius , thickness , startang , endang , roughness , color, id )
	surface.SetDrawColor( color )
	surface.gsDrawArc( surface.gsPrecacheArc( cx , cy , radius , thickness , startang , endang , roughness ) )
end

function surface.gsDrawArc( arc )
	for k , v in ipairs( arc ) do
		surface.DrawPoly( v )
	end
end

-- Draw a premade arc.
function surface.gsPrecacheArc( cx , cy , radius , thickness , startang , endang , roughness )
	local quadarc = { }
	-- Correct start/end ang
	local startang , endang = startang or 0 , endang or 0
	-- Define step
	-- roughness = roughness or 1
	local diff = abs( startang - endang )
	local smoothness = log( diff , 2 ) / math.max( roughness * 2 , 1 )
	local step = diff / pow( 2 , smoothness )

	if startang > endang then
		step = abs( step ) * -1
	end

	-- Create the inner circle's points.
	local inner = { }
	local outer = { }
	local ct = 1
	local r = radius - thickness

	for deg = startang , endang , step do
		local rad = rad1( deg )
		-- local rad = deg2rad * deg
		local cosrad , sinrad = cos( rad ) , sin( rad ) --calculate sin,cos
		local ox , oy = cx + ( cosrad * r ) , cy + ( -sinrad * r ) --apply to inner distance

		inner[ ct ] = {
			x = ox ,
			y = oy ,
			u = ( ox - cx ) / radius + .5 ,
			v = ( oy - cy ) / radius + .5
		}

		local ox2 , oy2 = cx + ( cosrad * radius ) , cy + ( -sinrad * radius ) --apply to outer distance

		outer[ ct ] = {
			x = ox2 ,
			y = oy2 ,
			u = ( ox2 - cx ) / radius + .5 ,
			v = ( oy2 - cy ) / radius + .5
		}

		ct = ct + 1
	end

	-- QUAD the points.
	for tri = 1 , ct do
		local p1 , p2 , p3 , p4
		local t = tri + 1
		p1 = outer[ tri ]
		p2 = outer[ t ]
		p3 = inner[ t ]
		p4 = inner[ tri ]
		quadarc[ tri ] = { p1 , p2 , p3 , p4 }
	end
	-- Return a table of triangles to draw.

	return quadarc
end

--PATH lua/vgui/bvgui/loadingpanel.lua:
local PANEL = {}

function PANEL:Init()
	self.LoadingPaint = self.Paint
end

function PANEL:Paint(w,h)
	if (not self.EndTime or SysTime() >= self.EndTime) then
		self.EndTime = SysTime() + 2
	end
	self.Rotation = ((self.EndTime - SysTime()) / 2) * 360

	if (self.Loading == true) then
		local size = 24
		surface.SetDrawColor(bVGUI.COLOR_WHITE)
		surface.SetMaterial(bVGUI.MATERIAL_LOADING_ICON)
		surface.DrawTexturedRectRotated(w / 2, h / 2, size, size, math.Round(self.Rotation))
	end
end

function PANEL:SetLoading(is_loading)
	self.Loading = is_loading
end
function PANEL:GetLoading()
	return self.Loading
end

derma.DefineControl("bVGUI.LoadingPanel", nil, PANEL, "DPanel")
derma.DefineControl("bVGUI.LoadingScrollPanel", nil, table.Copy(PANEL), "bVGUI.ScrollPanel")
--PATH lua/vgui/bvgui/permissions_selector.lua:
local PANEL = {}

function PANEL:Init()
	self.Rows = {}
	self.Headers = {}
	self.Categories = {}
	self.Permissions = {}
end

function PANEL:NormalCheckboxes()
	self.UseNormalCheckboxes = true
end

function PANEL:Clear()
	for i,v in ipairs(table.Merge(self.Rows, self.Headers)) do
		v:Remove()
	end
	self.Rows = {}
	self.Headers = {}
	self.Categories = {}
	self.Permissions = {}
	self:InvalidateLayout(true)
end

function PANEL:AddPermission(permission)
	table.insert(self.Permissions, permission)
end

function PANEL:AddHeader(header_text, header_col)
	local header = vgui.Create("bVGUI.Header", self)
	header.HeaderIndex = table.insert(self.Headers, header)
	header:Dock(TOP)
	header:SetText(header_text)
	header:SetColor(header_col)
end

function PANEL:AddPermissionGroup(header_text, header_col, rows, header_val)
	self:AddHeader(header_text, header_col)

	self.Categories[header_val or header_text] = {}

	for _,v in ipairs(rows) do
		local row = vgui.Create("bVGUI.PermissionsSelector_Row", self)
		row.RowIndex = table.insert(self.Rows, row)
		row.CategoryIndex = table.insert(self.Categories[header_val or header_text], row)
		row.Category = header_val or header_text
		row:Dock(TOP)
		row:SetText(v.text)
		row:SetTextColor(v.text_col)
		row:SetControlsAll(v.controls_all or false)
		row.PermissionValue = v.value
		if (v.checked) then
			row:SetChecks(v.checked)
		end
	end
end

function PANEL:AddSuperGroup(text, text_col)
	local row = vgui.Create("bVGUI.PermissionsSelector_Row", self)
	row.RowIndex = table.insert(self.Rows, row)
	row:Dock(TOP)
	row:SetText(text)
	row:SetTextColor(text_col)
	row:SetSuperGroup(true)
	self.SuperGroupRow = row
end

function PANEL:AddRow(header_val, v, header_text)
	local i = 0
	local last_row
	local found = false
	for row_i, row in pairs(self.Rows) do
		i = i + 1
		if (row.Category == (header_val or header_text)) then
			last_row = row
			found = true
		elseif (found) then
			break
		end
	end
	local row = vgui.Create("bVGUI.PermissionsSelector_Row", self)
	row.RowIndex = table.insert(self.Rows, i, row)
	row.CategoryIndex = table.insert(self.Categories[header_val or header_text], row)
	row.Category = header_val or header_text
	row:Dock(TOP)
	row:MoveToAfter(last_row)
	row:SetText(v.text)
	row:SetTextColor(v.text_col)
	row:SetControlsAll(v.controls_all or false)
	row.PermissionValue = v.value
	if (v.checked) then
		row:SetChecks(v.checked)
	end
end

function PANEL:GetPermissions()
	local permissions = {}
	if (self.SuperGroupRow) then
		for checkbox_i, checkbox in ipairs(self.SuperGroupRow.Checkboxes) do
			if (self.UseNormalCheckboxes) then
				if (checkbox:GetChecked() ~= false) then
					permissions["*"] = {}
					permissions["*"][checkbox_i] = true
					return permissions
				end
			else
				if (checkbox:GetChecked() ~= 0) then
					permissions["*"] = {}
					permissions["*"][checkbox_i] = checkbox:GetChecked()
					return permissions
				end
			end
		end
	end
	for category_i, rows in pairs(self.Categories) do
		permissions[category_i] = {}
		for row_i, row in ipairs(rows) do
			if (row.ControlsAll == true) then
				for checkbox_i, checkbox in ipairs(table.Reverse(row.Checkboxes)) do
					if (checkbox:GetChecked() ~= 0) then
						permissions[category_i]["*"] = permissions[category_i]["*"] or {}
						permissions[category_i]["*"][checkbox_i] = checkbox:GetChecked()
					end
				end
				if (permissions[category_i]["*"]) then
					if (table.Count(permissions[category_i]["*"]) == #row.Checkboxes) then
						break
					end
				end
			else
				permissions[category_i][row.PermissionValue or row.Label:GetText()] = {}
				for checkbox_i, checkbox in ipairs(table.Reverse(row.Checkboxes)) do
					if (checkbox:GetChecked() ~= 0) then
						permissions[category_i][row.PermissionValue or row.Label:GetText()][checkbox_i] = checkbox:GetChecked()
					end
				end
			end
		end
		if (permissions[category_i]["*"] and table.Count(permissions[category_i]) > 1) then
			permissions[category_i]["*"] = nil
		end
	end
	return permissions
end

function PANEL:UpdateCheckboxes()
	--[[
	local super_merges = {}
	local merges = {}
	for category_i, rows in pairs(self.Categories) do
		merges[category_i] = {}
		for row_i, row in ipairs(rows) do
			if (row.ControlsAll) then continue end
			for checkbox_i, checkbox in ipairs(row.Checkboxes) do
				if (super_merges[checkbox_i] == nil) then
					super_merges[checkbox_i] = checkbox:GetChecked()
				elseif (super_merges[checkbox_i] ~= false and super_merges[checkbox_i] ~= checkbox:GetChecked()) then
					super_merges[checkbox_i] = false
				end
				if (merges[category_i][checkbox_i] == nil) then
					merges[category_i][checkbox_i] = checkbox:GetChecked()
				elseif (merges[category_i][checkbox_i] ~= false and merges[category_i][checkbox_i] ~= checkbox:GetChecked()) then
					merges[category_i][checkbox_i] = false
				end
			end
		end
	end
	for category_i, checkboxes in pairs(merges) do
		for checkbox_i, checked in ipairs(checkboxes) do
			if (not self.Categories[category_i][1].ControlsAll) then continue end
			self.Categories[category_i][1].Checkboxes[checkbox_i]:SetChecked(checked or 0)
		end
	end
	if (IsValid(self.SuperGroupRow)) then
		for checkbox_i, checked in ipairs(super_merges) do
			self.SuperGroupRow.Checkboxes[checkbox_i]:SetChecked(checked or 0)
		end
	end
	]]
end

derma.DefineControl("bVGUI.PermissionsSelector", nil, PANEL, "bVGUI.LoadingScrollPanel")

local PANEL = {}

function PANEL:Init()
	local this = self
	self.PermissionsSelector = self:GetParent():GetParent()

	self:Dock(TOP)
	self:DockPadding(5,0,5,0)

	self.Label = vgui.Create("DLabel", self)
	self.Label:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 16))
	self.Label:SetTextColor(bVGUI.COLOR_WHITE)
	self.Label:Dock(LEFT)

	self.Checkboxes = {}
	for i,v in ipairs(table.Reverse(self.PermissionsSelector.Permissions)) do
		local checkbox
		if (self.PermissionsSelector.UseNormalCheckboxes) then
			checkbox = vgui.Create("bVGUI.Checkbox", self)
		else
			checkbox = vgui.Create("bVGUI.Checkbox_Crossable", self)
		end
		checkbox.CheckboxIndex = table.insert(self.Checkboxes, checkbox)
		checkbox:Dock(RIGHT)
		checkbox:SetTooltip(v)
		checkbox:DockMargin(0,3.5,5,3.5)
		function checkbox:OnChange()
			if (this.PermissionsSelector.SuperGroupRow) then
				local super_checkbox = this.PermissionsSelector.SuperGroupRow.Checkboxes[self.CheckboxIndex]
				if (self:GetChecked() ~= super_checkbox:GetChecked()) then
					if (this.PermissionsSelector.UseNormalCheckboxes) then
						super_checkbox:SetChecked(false)
					else
						super_checkbox:SetChecked(0)
					end
				end
			end
			if (self:GetParent().IsSuperGroup == true) then
				for category_i, rows in pairs(this.PermissionsSelector.Categories) do
					for row_i, row in ipairs(rows) do
						row.Checkboxes[self.CheckboxIndex]:SetChecked(self:GetChecked())
					end
				end
			else
				for i,v in ipairs(this.PermissionsSelector.Categories[self:GetParent().Category]) do
					if (v.ControlsAll) then
						local controls_all_checkbox = v.Checkboxes[self.CheckboxIndex]
						if (self:GetChecked() ~= controls_all_checkbox:GetChecked()) then
							if (this.PermissionsSelector.UseNormalCheckboxes) then
								controls_all_checkbox:SetChecked(false)
							else
								controls_all_checkbox:SetChecked(0)
							end
						end
						break
					end
				end

				if (self:GetParent().ControlsAll == true) then
					for i,v in ipairs(this.PermissionsSelector.Categories[self:GetParent().Category]) do
						if (v.ControlsAll) then continue end
						v.Checkboxes[self.CheckboxIndex]:SetChecked(self:GetChecked())
					end
				end

				this.PermissionsSelector:UpdateCheckboxes()
			end
			if (this.PermissionsSelector.OnPermissionsChanged) then
				this.PermissionsSelector:OnPermissionsChanged()
			end
		end
	end
end

function PANEL:Paint(w,h)
	if (self.RowIndex % 2 == 0) then
		surface.SetDrawColor(31, 35, 43)
	else
		surface.SetDrawColor(33, 37, 45)
	end
	surface.DrawRect(0,0,w,h)
end

function PANEL:SetText(text)
	self.Label:SetText(text)
	self.Label:SizeToContents()
end

function PANEL:SetTextColor(text_col)
	self.Label:SetTextColor(text_col)
end

function PANEL:SetControlsAll(controls_all)
	self.ControlsAll = controls_all
end

function PANEL:SetSuperGroup(supergroup)
	self.IsSuperGroup = supergroup
end

function PANEL:SetChecks(checked)
	for i,v in ipairs(table.Reverse(self.Checkboxes)) do
		if (checked[i]) then
			v:SetChecked(checked[i])
		end
	end
end

derma.DefineControl("bVGUI.PermissionsSelector_Row", nil, PANEL, "DPanel")
--PATH lua/vgui/ctrlnumpadmulti.lua:

local PANEL = {}

function PANEL:Init()
	self.Label  = vgui.Create("DLabel",       self)
	self.NumPad = vgui.Create("DNumPadMulti", self)
	
	self.Label:SetTextColor(color_white)
	
	self:SetPaintBackground(false)
end

function PANEL:SetLabel(txt)
	self.Label:SetText(txt or "Unnamed CtrlNumPadMulti: ")
end

function PANEL:SetConVar(varname)
	self.ConVar = varname
	
	self.NumPad:SetConVar(varname)
end

function PANEL:GetConVar()
	return self.ConVar
end

function PANEL:PerformLayout()
	self.NumPad:InvalidateLayout(true)
	self.NumPad:Center()
	self.NumPad:AlignBottom(5)
	
	self.Label:CenterHorizontal()
	self.Label:AlignTop(5)
	self.Label:SizeToContents()
	
	self:SetTall(self.Label:GetTall() + self.NumPad:GetTall() + 15)
end

vgui.Register("CtrlNumPadMulti", PANEL, "DPanel")

--PATH lua/vgui/openpermissions_columnlayout.lua:
local PANEL = {}

OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW = 0
OpenPermissions_COLUMN_LAYOUT_COLUMN_SHRINK = 1
OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW_COLUMN = 2

function PANEL:Init()
	self.Columns = {}
	self.Rows = {}
	self.ColumnPadding = 0
	self.RowPadding = 0

	function self.pnlCanvas:PerformLayout()
		self:GetParent():ColumnLayout()
		self:InvalidateParent(true)
	end
end

function PANEL:SetPaddings(column_padding, row_padding)
	self.ColumnPadding = column_padding
	self.RowPadding = row_padding
end

function PANEL:SetColumns(...)
	self.Columns = {...}
	self.GrowColumnCount = 0
	for _,v in ipairs(self.Columns) do
		if (v == OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW or v == OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW_COLUMN) then
			self.GrowColumnCount = self.GrowColumnCount + 1
		end
	end
end

function PANEL:AddRow(...)
	local i = table.insert(self.Rows, {...})
	self.pnlCanvas:InvalidateLayout(true)
	return i
end

function PANEL:RemoveRow(row_index)
	for _,element in ipairs(self.Rows[row_index]) do
		element:Remove()
	end
	table.remove(self.Rows, row_index)
	self.pnlCanvas:InvalidateLayout(true)
end

function PANEL:ColumnLayout()
	local column_widths = {}
	local row_heights = {}
	for row_i, elements in ipairs(self.Rows) do
		for column_i, element in ipairs(elements) do
			if (self.Columns[column_i] == OpenPermissions_COLUMN_LAYOUT_COLUMN_SHRINK) then
				local element_w = element:GetWide()
				local column_w = column_widths[column_i]
				if (not column_w or element_w > column_w) then
					column_widths[column_i] = element_w
				end
			end
			if (self.Columns[column_i] ~= OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW_COLUMN) then
				local element_h = element:GetTall()
				local row_h = row_heights[row_i]
				if (not row_h or element_h > row_h) then
					row_heights[row_i] = element_h
				end
			end
		end
	end
	local grow_column_width = 0
	for i,v in pairs(column_widths) do
		grow_column_width = grow_column_width - v - self.ColumnPadding
	end
	grow_column_width = ((grow_column_width + self:GetWide()) / self.GrowColumnCount) - 4

	local row_y = 0
	for row_i, elements in ipairs(self.Rows) do
		local column_x = 0
		for column_i, element in ipairs(elements) do
			local column_sizing = self.Columns[column_i]
			if (column_sizing == OpenPermissions_COLUMN_LAYOUT_COLUMN_SHRINK) then
				element:SetWide(column_widths[column_i])
				element:SetPos(column_x, row_y)
				column_x = column_x + column_widths[column_i] + self.ColumnPadding
			elseif (column_sizing == OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW or column_sizing == OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW_COLUMN) then
				if (OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW_COLUMN) then
					element:SetWide(grow_column_width)
				else
					element:SetSize(grow_column_width, row_heights[row_i])
				end
				element:SetPos(column_x, row_y)
				column_x = column_x + grow_column_width + self.ColumnPadding
			end
		end
		row_y = row_y + row_heights[row_i] + self.RowPadding
	end
end

derma.DefineControl("OpenPermissions.ColumnLayout", nil, PANEL, "OpenPermissions.ScrollPanel")
--PATH gamemodes/mangarp/gamemode/libraries/interfaceloader.lua:
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

--PATH gamemodes/mangarp/gamemode/modules/chat/cl_interface.lua:
DarkRP.addChatReceiver = DarkRP.stub{
    name = "addChatReceiver",
    description = "Add a chat command with specific receivers",
    parameters = {
        {
            name = "prefix",
            description = "The chat command itself (\"/pm\", \"/ooc\", \"/me\" are some examples)",
            type = "string",
            optional = false
        },
        {
            name = "text",
            description = "The text that shows up when it says \"Some people can hear you X\"",
            type = "string",
            optional = false
        },
        {
            name = "hearFunc",
            description = "A function(ply, splitText) that decides whether this player can or cannot hear you.",
            type = "function",
            optional = false
        }
    },
    returns = {},
    metatable = DarkRP
}

DarkRP.removeChatReceiver = DarkRP.stub{
    name = "removeChatReceiver",
    description = "Remove a chat command receiver",
    parameters = {
        {
            name = "prefix",
            description = "The chat command itself (\"/pm\", \"/ooc\", \"/me\" are some examples)",
            type = "string",
            optional = false
        }
    },
    returns = {},
    metatable = DarkRP
}

DarkRP.hookStub{
    name = "chatHideRecipient",
    description = "Hide a receipent from who can hear/see your text GUI.",
    parameters = {
        {
            name = "ply",
            description = "The player who spoke.",
            type = "Player"
        }
    },
    returns = {

    }
}

--PATH gamemodes/mangarp/gamemode/modules/police/sh_init.lua:
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
    return GAMEMODE.CivilProtection and GAMEMODE.CivilProtection[self:Team()] or false
end

plyMeta.isMayor = fn.Compose{fn.Curry(fn.GetValue, 2)("mayor"), plyMeta.getJobTable}
plyMeta.isChief = fn.Compose{fn.Curry(fn.GetValue, 2)("chief"), plyMeta.getJobTable}


--[[---------------------------------------------------------------------------
Hooks
---------------------------------------------------------------------------]]

function DarkRP.hooks:canRequestWarrant(target, actor, reason)
    if not IsValid(target) then return false, DarkRP.getPhrase("suspect_doesnt_exist") end
    if not reason or string.len(reason) == 0 then return false, DarkRP.getPhrase("vote_specify_reason") end
    if string.len(reason) > 200 then return false, DarkRP.getPhrase("too_long") end
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
    if not IsValid(target) then return false, DarkRP.getPhrase("suspect_doesnt_exist") end
    if not reason or string.len(reason) == 0 then return false, DarkRP.getPhrase("vote_specify_reason") end
    if string.len(reason) > 200 then return false, DarkRP.getPhrase("too_long") end
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
    command = "lottery",
    description = "Start a lottery.",
    delay = 1.5,
    condition = plyMeta.isMayor
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

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/cl_interface/sh_commontimes.lua:
--[[---------------------------------------------------------------------------
Common times for several punishment actions
---------------------------------------------------------------------------]]
FAdmin.PlayerActions.commonTimes = {}
FAdmin.PlayerActions.commonTimes[0] = "indefinitely"
FAdmin.PlayerActions.commonTimes[10] = "10 seconds"
FAdmin.PlayerActions.commonTimes[30] = "30 seconds"
FAdmin.PlayerActions.commonTimes[60] = "1 minute"
FAdmin.PlayerActions.commonTimes[300] = "5 minutes"
FAdmin.PlayerActions.commonTimes[600] = "10 minutes"

function FAdmin.PlayerActions.addTimeSubmenu(menu, submenuText, submenuClick, submenuItemClick)
    local SubMenu = menu:AddSubMenu(submenuText, submenuClick)

    local Padding = vgui.Create("DPanel")
    Padding:SetPaintBackgroundEnabled(false)
    Padding:SetSize(1,5)
    SubMenu:AddPanel(Padding)

    local SubMenuTitle = vgui.Create("DLabel")
    SubMenuTitle:SetText("  Time:\n")
    SubMenuTitle:SetFont("UiBold")
    SubMenuTitle:SizeToContents()
    SubMenuTitle:SetTextColor(color_black)

    SubMenu:AddPanel(SubMenuTitle)

    for secs, Time in SortedPairs(FAdmin.PlayerActions.commonTimes) do
        SubMenu:AddOption(Time, function() submenuItemClick(secs) end)
    end
end

function FAdmin.PlayerActions.addTimeMenu(ItemClick)
    local menu = DermaMenu()

    local Padding = vgui.Create("DPanel")
    Padding:SetPaintBackgroundEnabled(false)
    Padding:SetSize(1,5)
    menu:AddPanel(Padding)

    local Title = vgui.Create("DLabel")
    Title:SetText("  Time:\n")
    Title:SetFont("UiBold")
    Title:SizeToContents()
    Title:SetTextColor(color_black)

    menu:AddPanel(Title)

    for secs, Time in SortedPairs(FAdmin.PlayerActions.commonTimes) do
        menu:AddOption(Time, function() ItemClick(secs) end)
    end
    menu:Open()
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/cl_interface/cl_scoreboardmain.lua:
local Sorted, SortDown = CreateClientConVar("FAdmin_SortPlayerList", "Team", true), CreateClientConVar("FAdmin_SortPlayerListDown", 1, true)
local allowedSorts = {
    ["Name"] = true,
    ["Team"] = true,
    ["Frags"] = true,
    ["Deaths"] = true,
    ["Ping"] = true
}

function FAdmin.ScoreBoard.Main.Show()
    local Sort = {}
    local ScreenWidth, ScreenHeight = ScrW(), ScrH()

    FAdmin.ScoreBoard.X = ScreenWidth * 0.05
    FAdmin.ScoreBoard.Y = ScreenHeight * 0.025
    FAdmin.ScoreBoard.Width = ScreenWidth * 0.9
    FAdmin.ScoreBoard.Height = ScreenHeight * 0.95

    FAdmin.ScoreBoard.ChangeView("Main")

    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList = FAdmin.ScoreBoard.Main.Controls.FAdminPanelList or vgui.Create("DPanelList")
    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:SetVisible(true)
    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:Clear(true)
    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList.Padding = 3
    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:EnableVerticalScrollbar(true)


    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:Clear(true)

    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:SetPos(FAdmin.ScoreBoard.X + 20, FAdmin.ScoreBoard.Y + 90 + 30 + 20)
    FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:SetSize(FAdmin.ScoreBoard.Width - 40, FAdmin.ScoreBoard.Height - 90 - 30 - 20 - 20)

    Sort.Name = Sort.Name or vgui.Create("DLabel")
    Sort.Name:SetText("Sort by:     Name")
    Sort.Name:SetPos(FAdmin.ScoreBoard.X + 20, FAdmin.ScoreBoard.Y + 90 + 30)
    Sort.Name.Type = "Name"
    Sort.Name:SetVisible(true)

    Sort.Team = Sort.Team or vgui.Create("DLabel")
    Sort.Team:SetText("Team")
    Sort.Team:SetPos(ScreenWidth * 0.5 - 30, FAdmin.ScoreBoard.Y + 90 + 30)
    Sort.Team.Type = "Team"
    Sort.Team:SetVisible(true)

    Sort.Frags = Sort.Frags or vgui.Create("DLabel")
    Sort.Frags:SetText("Kills")
    Sort.Frags:SetPos(FAdmin.ScoreBoard.X + FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:GetWide() - 200, FAdmin.ScoreBoard.Y + 90 + 30)
    Sort.Frags.Type = "Frags"
    Sort.Frags:SetVisible(true)

    Sort.Deaths = Sort.Deaths or vgui.Create("DLabel")
    Sort.Deaths:SetText("Deaths")
    Sort.Deaths:SetPos(FAdmin.ScoreBoard.X + FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:GetWide() - 140, FAdmin.ScoreBoard.Y + 90 + 30)
    Sort.Deaths.Type = "Deaths"
    Sort.Deaths:SetVisible(true)

    Sort.Ping = Sort.Ping or vgui.Create("DLabel")
    Sort.Ping:SetText("Ping")
    Sort.Ping:SetPos(FAdmin.ScoreBoard.X + FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:GetWide() - 50, FAdmin.ScoreBoard.Y + 90 + 30)
    Sort.Ping.Type = "Ping"
    Sort.Ping:SetVisible(true)

    local sortBy = Sorted:GetString()
    sortBy = allowedSorts[sortBy] and sortBy or "Team"

    FAdmin.ScoreBoard.Main.PlayerListView(sortBy, SortDown:GetBool())

    for _, v in pairs(Sort) do
        v:SetFont("Trebuchet20")
        v:SizeToContents()

        local X, Y = v:GetPos()

        v.BtnSort = vgui.Create("DButton")
        v.BtnSort:SetText("")
        v.BtnSort.Type = "Down"
        v.BtnSort.Paint = function(panel, w, h) derma.SkinHook("Paint", "ButtonDown", panel, w, h) end
        v.BtnSort:SetSkin(GAMEMODE.Config.DarkRPSkin)
        if Sorted:GetString() == v.Type then
            v.BtnSort.Depressed = true
            v.BtnSort.Type = (SortDown:GetBool() and "Down") or "Up"
        end
        v.BtnSort:SetSize(16, 16)
        v.BtnSort:SetPos(X + v:GetWide() + 5, Y + 4)
        function v.BtnSort.DoClick()
            for _, b in pairs(Sort) do
                b.BtnSort.Depressed = b.BtnSort == v.BtnSort
            end
            v.BtnSort.Type = (v.BtnSort.Type == "Down" and "Up") or "Down"
            v.BtnSort.Paint = function(panel, w, h)
                derma.SkinHook("Paint", "Button" .. v.BtnSort.Type, panel, w, h)
            end

            RunConsoleCommand("FAdmin_SortPlayerList", v.Type)
            RunConsoleCommand("FAdmin_SortPlayerListDown", (v.BtnSort.Type == "Down" and "1") or "0")
            FAdmin.ScoreBoard.Main.Controls.FAdminPanelList:Clear(true)
            FAdmin.ScoreBoard.Main.PlayerListView(v.Type, v.BtnSort.Type == "Down")
        end
        table.insert(FAdmin.ScoreBoard.Main.Controls, v) -- Add them to the table so they get removed when you close the scoreboard
        table.insert(FAdmin.ScoreBoard.Main.Controls, v.BtnSort)
    end
end

function FAdmin.ScoreBoard.Main.AddPlayerRightClick(Name, func)
    FAdmin.PlayerIcon.RightClickOptions[Name] = func
end

FAdmin.StartHooks["CopySteamID"] = function()
    FAdmin.ScoreBoard.Main.AddPlayerRightClick("Copy SteamID", function(ply) SetClipboardText(ply:SteamID()) end)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/cl_interface/cl_controls.lua:
FAdmin.PlayerIcon = {}
FAdmin.PlayerIcon.RightClickOptions = {}

function FAdmin.PlayerIcon.AddRightClickOption(name, func)
    FAdmin.PlayerIcon.RightClickOptions[name] = func
end

-- FAdminPanelList
local PANEL = {}

function PANEL:Init()
    self.Padding = 5
end

function PANEL:SizeToContents()
    local w, h = self:GetSize()

    -- Fix size of w to have the same size as the scoreboard
    w = math.Clamp(w, ScrW() * 0.9, ScrW() * 0.9)
    h = math.Min(h, ScrH() * 0.95)

    -- It fucks up when there's only one icon in
    if #self:GetChildren() == 1 then
        h = math.Max(0, 120)
    end

    self:SetSize(w, h)
    self:PerformLayout()
end

function PANEL:Paint()
end

derma.DefineControl("FAdminPanelList", "DPanellist adapted for FAdmin", PANEL, "DPanelList")

-- FAdminPlayerCatagoryHeader
local PANEL2 = {}

function PANEL2:PerformLayout()
    self:SetFont("Trebuchet24")
end

derma.DefineControl("FAdminPlayerCatagoryHeader", "DCatagoryCollapse header adapted for FAdmin", PANEL2, "DCategoryHeader")

-- FAdminPlayerCatagory
local PANEL3 = {}

function PANEL3:Init()
    if self.Header then
        self.Header:Remove() -- the old header is still there don't ask me why
    end
    self.Header = vgui.Create("FAdminPlayerCatagoryHeader", self)
    self.Header:SetSize(20, 25)
    self:SetPadding(5)
    self.Header:Dock(TOP)

    self:SetExpanded(true)
    self:SetMouseInputEnabled(true)

    self:SetAnimTime(0.2)
    self.animSlide = Derma_Anim("Anim", self, self.AnimSlide)

    self:SetPaintBackgroundEnabled(true)

end

function PANEL3:Paint()
    if self.CatagoryColor then
        draw.RoundedBox(4, 0, 0, self:GetWide(), self.Header:GetTall(), self.CatagoryColor)
    end
end

derma.DefineControl("FAdminPlayerCatagory", "DCatagoryCollapse adapted for FAdmin", PANEL3, "DCollapsibleCategory")

-- FAdmin player row (from the sandbox player row)
PANEL = {}

local PlayerRowSize = CreateClientConVar("FAdmin_PlayerRowSize", 30, true, false)
function PANEL:Init()
    self.Size = PlayerRowSize:GetInt()

    self.lblName   = vgui.Create("DLabel", self)
    self.lblFrags  = vgui.Create("DLabel", self)
    self.lblTeam   = vgui.Create("DLabel", self)
    self.lblDeaths = vgui.Create("DLabel", self)
    self.lblPing   = vgui.Create("DLabel", self)
    self.lblWanted = vgui.Create("DLabel", self)

    -- If you don't do this it'll block your clicks
    self.lblName:SetMouseInputEnabled(false)
    self.lblTeam:SetMouseInputEnabled(false)
    self.lblFrags:SetMouseInputEnabled(false)
    self.lblDeaths:SetMouseInputEnabled(false)
    self.lblPing:SetMouseInputEnabled(false)
    self.lblWanted:SetMouseInputEnabled(false)

    self.lblName:SetColor(Color(255,255,255,200))
    self.lblTeam:SetColor(Color(255,255,255,200))
    self.lblFrags:SetColor(Color(255,255,255,200))
    self.lblDeaths:SetColor(Color(255,255,255,200))
    self.lblPing:SetColor(Color(255,255,255,200))
    self.lblWanted:SetColor(Color(255,255,255,200))

    self.imgAvatar = vgui.Create("AvatarImage", self)

    self:SetCursor("hand")
end

function PANEL:Paint()
    if not IsValid(self.Player) then return end

    self.Size = PlayerRowSize:GetInt()
    self.imgAvatar:SetSize(self.Size - 4, self.Size - 4)

    local color = Color(100, 150, 245, 255)


    if GAMEMODE.Name == "Sandbox" then
        color = Color(100, 150, 245, 255)
        if self.Player:Team() == TEAM_CONNECTING then
            color = Color(200, 120, 50, 255)
        elseif self.Player:IsAdmin() then
            color = Color(30, 200, 50, 255)
        end

        if self.Player:GetFriendStatus() == "friend" then
            color = Color(236, 181, 113, 255)
        end
    else
        color = team.GetColor(self.Player:Team())
    end

    local hooks = hook.GetTable().FAdmin_PlayerRowColour
    if hooks then
        for _, v in pairs(hooks) do
            color = (v and v(self.Player, color)) or color
            break
        end
    end

    draw.RoundedBox(4, 0, 0, self:GetWide(), self.Size, color)

    surface.SetTexture(0)
    if self.Player == LocalPlayer() or self.Player:GetFriendStatus() == "friend" then
        surface.SetDrawColor(255, 255, 255, 50 + math.sin(RealTime() * 2) * 50)
    end
    surface.DrawTexturedRect(0, 0, self:GetWide(), self.Size)
    return true
end

function PANEL:SetPlayer(ply)
    self.Player = ply

    self.imgAvatar:SetPlayer(ply)

    self:UpdatePlayerData()
end

function PANEL:UpdatePlayerData()
    if not self.Player then return end
    if not self.Player:IsValid() then return end

    self.lblName:SetText(DarkRP.deLocalise(self.Player:Nick()))
    self.lblTeam:SetText((self.Player.DarkRPVars and DarkRP.deLocalise(self.Player:getDarkRPVar("job") or "")) or team.GetName(self.Player:Team()))
    self.lblTeam:SizeToContents()
    self.lblFrags:SetText(self.Player:Frags())
    self.lblDeaths:SetText(self.Player:Deaths())
    self.lblPing:SetText(self.Player:Ping())
    self.lblWanted:SetText(self.Player:isWanted() and DarkRP.getPhrase("Wanted_text") or "")
end

function PANEL:ApplySchemeSettings()
    self.lblName:SetFont("ScoreboardPlayerNameBig")
    self.lblTeam:SetFont("ScoreboardPlayerNameBig")
    self.lblFrags:SetFont("ScoreboardPlayerName")
    self.lblDeaths:SetFont("ScoreboardPlayerName")
    self.lblPing:SetFont("ScoreboardPlayerName")
    self.lblWanted:SetFont("ScoreboardPlayerNameBig")

    self.lblName:SetFGColor(color_white)
    self.lblTeam:SetFGColor(color_white)
    self.lblFrags:SetFGColor(color_white)
    self.lblDeaths:SetFGColor(color_white)
    self.lblPing:SetFGColor(color_white)
    self.lblWanted:SetFGColor(color_white)
end

function PANEL:DoClick(x, y)
    if not IsValid(self.Player) then self:Remove() return end
    FAdmin.ScoreBoard.ChangeView("Player", self.Player)
end

function PANEL:DoRightClick()
    if table.IsEmpty(FAdmin.PlayerIcon.RightClickOptions) then return end
    local menu = DermaMenu()

    menu:SetPos(gui.MouseX(), gui.MouseY())

    for Name, func in SortedPairs(FAdmin.PlayerIcon.RightClickOptions) do
        menu:AddOption(Name, function() if IsValid(self.Player) then func(self.Player, self) end end)
    end

    menu:Open()
end

function PANEL:Think()
    if not self.PlayerUpdate or self.PlayerUpdate < CurTime() then
        self.PlayerUpdate = CurTime() + 0.5
        self:UpdatePlayerData()
    end
end

function PANEL:PerformLayout()
    self.imgAvatar:SetPos(2, 2)
    self.imgAvatar:SetSize(32, 32)

    self:SetSize(self:GetWide(), self.Size)

    self.lblName:SizeToContents()
    self.lblName:SetPos(24, 2)
    self.lblName:MoveRightOf(self.imgAvatar, 8)

    local COLUMN_SIZE = 75

    self.lblPing:SetPos(self:GetWide() - COLUMN_SIZE * 0.4, 0)
    self.lblDeaths:SetPos(self:GetWide() - COLUMN_SIZE * 1.4, 0)
    self.lblFrags:SetPos(self:GetWide() - COLUMN_SIZE * 2.4, 0)

    self.lblTeam:SetPos(self:GetWide() / 2 - (0.5 * self.lblTeam:GetWide()))

    self.lblWanted:SizeToContents()
    self.lblWanted:SetPos(math.floor(self:GetWide() / 4), 2)
end
vgui.Register("FadminPlayerRow", PANEL, "Button")

-- FAdminActionButton
local PANEL6 = {}

function PANEL6:Init()
    self:SetDrawBackground(false)
    self:SetDrawBorder(false)
    self:SetStretchToFit(false)
    self:SetSize(120, 40)

    self.TextLabel = vgui.Create("DLabel", self)
    self.TextLabel:SetColor(Color(200,200,200,200))
    self.TextLabel:SetFont("Roboto20")

    self.m_Image2 = vgui.Create("DImage", self)

    self.BorderColor = Color(190,40,0,255)
end

function PANEL6:SetText(text)
    self.TextLabel:SetText(text)
    self.TextLabel:SizeToContents()

    self:SetWide(self.TextLabel:GetWide() + 44)
end

function PANEL6:PerformLayout()
    self.m_Image:SetSize(32,32)
    self.m_Image:SetPos(4,4)

    self.m_Image2:SetSize(32, 32)
    self.m_Image2:SetPos(4,4)

    self.TextLabel:SetPos(38, 8)
end

function PANEL6:SetImage2(Mat, bckp)
    self.m_Image2:SetImage(Mat, bckp)
end

function PANEL6:SetBorderColor(Col)
    self.BorderColor = Col or Color(190,40,0,255)
end

function PANEL6:Paint()
    local BorderColor = self.BorderColor
    if self.Hovered then
        BorderColor = Color(math.Min(BorderColor.r + 40, 255), math.Min(BorderColor.g + 40, 255), math.Min(BorderColor.b + 40, 255), BorderColor.a)
    end
    if self.Depressed then
        BorderColor = color_transparent
    end
    draw.RoundedBox(4, 0, 0, self:GetWide(), self:GetTall(), BorderColor)
    draw.RoundedBox(4, 2, 2, self:GetWide() - 4, self:GetTall() - 4, Color(40, 40, 40, 255))
end

function PANEL6:OnMousePressed(mouse)
    if self:GetDisabled() then return end

    self.m_Image:SetSize(24,24)
    self.m_Image:SetPos(8,8)
    self.Depressed = true
end

function PANEL6:OnMouseReleased(mouse)
    if self:GetDisabled() then return end

    self.m_Image:SetSize(32,32)
    self.m_Image:SetPos(4,4)
    self.Depressed = false
    self:DoClick()
end

derma.DefineControl("FAdminActionButton", "Button for doing actions", PANEL6, "DImageButton")

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/changelevel/cl_mapicon.lua:
local PANEL = {}

function PANEL:Init()
    self.BaseClass.Init(self)
    self:SetPaintBackground(true)
    self:SetIsToggle(true)
    self:SetSize(96, 110)
end

function PANEL:Paint(w, h)
    if self.m_bToggle then
        surface.SetDrawColor(255, 155, 20, 255)
        surface.DrawRect(0, 0, w, h)
    end
    return false
end

function PANEL:UpdateColours(skin)
    return self:SetTextStyleColor(skin.Colours.Button.Normal)
end

function PANEL:OnToggled(selected)
    self:InvalidateLayout(true)
end

function PANEL:OnMousePressed(code)
    DButton.OnMousePressed(self, code)
end

function PANEL:OnMouseReleased(code)
    DButton.OnMouseReleased(self, code)
end

function PANEL:PerformLayout()
    self.m_Image:SetPos(0, 0)
    local w,h = self:GetSize()
    h = h - 14
    self.m_Image:SetSize(w, h)
    self:SetTextInset(5, w / 2)
    DLabel.PerformLayout(self)
end

vgui.Register("FAdmin_MapIcon", PANEL, "DImageButton")

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/changelevel/cl_changelevelgui.lua:
local PANEL = {}

AccessorFunc(PANEL, "gamemodeList", "GamemodeList")
AccessorFunc(PANEL, "mapList", "MapList")

function PANEL:Init()
    self:SetMouseInputEnabled(true)
    self:SetKeyboardInputEnabled(false)

    self:SetDeleteOnClose(false)

    self:SetTitle("Change level")
    self:SetSize(630, ScrH() * 0.8)

    self.gamemodeList = {}
    self.mapList = {}

    self.catList = vgui.Create("DCategoryList", self)
    self.catList:Dock(FILL)

    self.topPanel = vgui.Create("DPanel", self)
    self.topPanel:SetPaintBackground(false)
    self.topPanel:DockMargin(0, 0, 0, 4)
    self.topPanel:Dock(TOP)
    self.gmLabel = vgui.Create("DLabel", self.topPanel)
    self.gmLabel:SetText("Gamemode:")
    self.gmLabel:Dock(LEFT)
    self.gmComboBox = vgui.Create("DComboBox", self.topPanel)
    self.gmComboBox:Dock(FILL)
    self.gmComboBox:SetValue("(current)")

    self.bottomPanel = vgui.Create("DPanel", self)
    self.bottomPanel:SetPaintBackground(false)
    self.bottomPanel:DockMargin(0, 4, 0, 0)
    self.bottomPanel:Dock(BOTTOM)
    self.changeButton = vgui.Create("DButton", self.bottomPanel)
    self.changeButton:SetText("Change level")
    self.changeButton:Dock(RIGHT)
    self.changeButton:SetWidth(100)
    self.changeButton:SetEnabled(false)
    self.changeButton.DoClick = function()
        if not IsValid(self.selectedIconPanel) then return end
        local _,gmName = self.gmComboBox:GetSelected()
        local mapName = self.selectedIconPanel:GetText()
        RunConsoleCommand("_FAdmin", "Changelevel", gmName and gmName or mapName, gmName and mapName)
    end
end

function PANEL:Refresh()
    for _, gmInfo in ipairs(self:GetGamemodeList()) do
        self.gmComboBox:AddChoice(gmInfo.title, gmInfo.name)
    end
    self.gmComboBox:SetValue("(current)")

    for catName, maps in pairs(self:GetMapList()) do
        local cat = self.catList:Add(catName)
        local iconLayout = vgui.Create("DIconLayout")
        iconLayout:SetSpaceX(5)
        iconLayout:SetSpaceY(5)
        for _, map in ipairs(maps) do
            local icon = iconLayout:Add("FAdmin_MapIcon")
            icon:SetText(map)
            icon:SetDark(true)
            local mat = Material("maps/thumb/" .. map .. ".png")
            if mat:IsError() then mat = Material("maps/thumb/noicon.png") end
            icon:SetMaterial(mat)
            local onToggled = icon.OnToggled
            icon.OnToggled = function(iconSelf, selected)
                onToggled(iconSelf, selected)
                if IsValid(self.selectedIconPanel) then
                    if selected and self.selectedIconPanel ~= iconSelf then
                        self.selectedIconPanel:Toggle()
                    elseif not selected and self.selectedIconPanel == iconSelf then
                        self.selectedIconPanel = nil
                        self.changeButton:SetEnabled(false)
                        return
                    end
                end
                self.selectedIconPanel = iconSelf
                self.changeButton:SetEnabled(true)
            end
        end
        cat:SetContents(iconLayout)
    end
end

vgui.Register("FAdmin_Changelevel", PANEL, "DFrame")

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/noclip/sh_shared.lua:
local sbox_noclip = GetConVar("sbox_noclip")

local function sendNoclipMessage(ply)
    if not SERVER or ply.FADmin_HasGotNoclipMessage then return end

    FAdmin.Messages.SendMessage(ply, 4, "Noclip allowed")
    ply.FADmin_HasGotNoclipMessage = true
end

hook.Add("PlayerNoClip", "FAdmin_noclip", function(ply)
    if ply:FAdmin_GetGlobal("FADmin_DisableNoclip") then
        if SERVER then
            FAdmin.Messages.SendMessage(ply, 5, "Noclip disallowed!")
        end

        return false
    end

    -- No further judgement when sbox_noclip is on
    if sbox_noclip:GetBool() then return end

    if ply:FAdmin_GetGlobal("FADmin_CanNoclip") then
        sendNoclipMessage(ply)

        return true
    end

    if not ply:Alive() then return end

    -- Has privilege
    if not FAdmin.Access.PlayerHasPrivilege(ply, "Noclip") then return end

    -- Disallow if other hooks say no
    for k, v in pairs(hook.GetTable().PlayerNoClip) do
        if k == "FAdmin_noclip" then continue end
        if v(ply) == false then return false end
    end

    sendNoclipMessage(ply)

    return true
end)

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/message/cl_init.lua:
local function MessageGui(ply)
    if not FAdmin.Messages or not FAdmin.Messages.MsgTypes then return end

    local frame = vgui.Create("DFrame")
    frame:SetTitle("Send message")
    frame:SetSize(350, 170)
    frame:Center()
    frame:SetVisible(true)
    frame:MakePopup()

    local MsgType = 2

    local i = 0
    local TypeButtons = {}
    local MsgTypeNames = {ERROR = 1, NOTIFY = 2, QUESTION = 3, GOOD = 4, BAD = 5}
    for k, v in pairs(FAdmin.Messages.MsgTypes) do


        local MsgTypeButton = vgui.Create("DCheckBox", frame)
        MsgTypeButton:SetPos(20 + i * 64, 46)
        if k == "NOTIFY" then MsgTypeButton:SetValue(true) end

        function MsgTypeButton:DoClick()
            for _, B in pairs(TypeButtons) do B:SetValue(false) end

            self:SetValue(true)
            MsgType = MsgTypeNames[k]
        end

        local Icon = vgui.Create("DImageButton", frame)
        Icon:SetImage(v.TEXTURE)
        Icon:SetPos(20 + i * 64 + 16, 30)
        Icon:SetSize(32, 32)
        function Icon:DoClick()
            for _, B in pairs(TypeButtons) do B:SetValue(false) end
            MsgTypeButton:SetValue(true)
            MsgType = MsgTypeNames[k]
        end

        table.insert(TypeButtons, MsgTypeButton)
        i = i + 1
    end

    local OK = vgui.Create("DButton", frame)
    local TextBox = vgui.Create("DTextEntry", frame)
    TextBox:SetPos(20, 100)
    TextBox:StretchToParent(20, nil, 20, nil)
    TextBox:RequestFocus()
    function TextBox:Think() -- Most people are holding tab when they open this window. Get focus back!
        TextBox.InTab = TextBox.InTab or input.IsKeyDown(KEY_TAB)
        if TextBox.InTab and not input.IsKeyDown(KEY_TAB) then self:RequestFocus() end
    end
    function TextBox:OnEnter()
        OK:DoClick()
    end

    OK:SetSize(100, 20)
    OK:SetText("OK")
    OK:AlignRight(20)
    OK:AlignBottom(20)
    function OK:DoClick()
        frame:Close()
        if not IsValid(ply) then return end
        RunConsoleCommand("_FAdmin", "Message", ply:SteamID(), MsgType, TextBox:GetValue())
    end
end

FAdmin.StartHooks["zzSendMessage"] = function()
    FAdmin.Access.AddPrivilege("Message", 1)
    FAdmin.Commands.AddCommand("Message", nil, "<Player>", "[type]", "<text>")

    FAdmin.ScoreBoard.Player:AddActionButton("Send message", "fadmin/icons/message", Color(0, 200, 0, 255),
        function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Message") and not ply:IsBot() end, function(ply, button)
            MessageGui(ply)
        end
    )
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/kickban/sh_shared.lua:
function FAdmin.PlayerActions.ConvertBanTime(time)
    local Add = ""
    time = math.Round(time)

    if time <= 0 then
        return "permanent"
    elseif time < 60 then
        -- minutes
        return math.ceil(time) .. " minute(s)"
    elseif time >= 60 and time < 1440 then
        -- hours
        if math.floor((time / 60 - math.floor(time / 60)) * 60) > 0 then
            Add = ", " .. FAdmin.PlayerActions.ConvertBanTime((time / 60 - math.floor(time / 60)) * 60)
        end

        return math.floor(time / 60) .. " hour(s)" .. Add
    elseif time >= 1440 and time < 10080 then
        -- days
        if math.floor((time / 1440 - math.floor(time / 1440)) * 1440) > 0 then
            Add = ", " .. FAdmin.PlayerActions.ConvertBanTime((time / 1440 - math.floor(time / 1440)) * 1440)
        end

        return math.floor(time / 1440) .. " day(s)" .. Add
    elseif time >= 10080 and time < 525948 then
        -- weeks
        if math.floor((time / 10080 - math.floor(time / 10080)) * 10080) > 0 then
            Add = ", " .. FAdmin.PlayerActions.ConvertBanTime((time / 10080 - math.floor(time / 10080)) * 10080)
        end

        return math.floor(time / 10080) .. " week(s)" .. Add
    elseif time >= 525948 then
        -- years
        if math.floor((time / 525948 - math.floor(time / 525948)) * 525948) > 0 then
            Add = ", " .. FAdmin.PlayerActions.ConvertBanTime((time / 525948 - math.floor(time / 525948)) * 525948)
        end

        return math.floor(time / 525948) .. " year(s)" .. Add
    end

    return time
end

FAdmin.StartHooks["kickbanning"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "kick",
        hasTarget = false,
        message = {"instigator", " kicked ", "extraInfo.1", " (", "extraInfo.2", ")"},
        receivers = "everyone",
        writeExtraInfo = function(info)
            net.WriteString(info[1])
            net.WriteString(info[2])
        end,

        readExtraInfo = function()
            return {net.ReadString(), net.ReadString()}
        end,
        extraInfoColors = {Color(102, 0, 255), Color(255, 102, 0)}
    }

    FAdmin.Messages.RegisterNotification{
        name = "ban",
        hasTarget = false,
        message = {"instigator", " banned ", "extraInfo.1", " for ", "extraInfo.2", " (", "extraInfo.3", ")"},
        receivers = "everyone",
        writeExtraInfo = function(info)
            net.WriteString(info[1])

            net.WriteUInt(info[2], 32)

            net.WriteString(info[3])
        end,

        readExtraInfo = function()
            return {net.ReadString(), FAdmin.PlayerActions.ConvertBanTime(net.ReadUInt(32)), net.ReadString()}
        end,

        extraInfoColors = {Color(102, 0, 255), Color(255, 102, 0), Color(255, 102, 0)}
    }

    FAdmin.Messages.RegisterNotification{
        name = "unban",
        hasTarget = false,
        message = {"instigator", " unbanned ", "extraInfo.1", " (", "extraInfo.2", ")"},
        receivers = "everyone",
        writeExtraInfo = function(info)
            net.WriteString(info[1])
            net.WriteString(info[2])
        end,

        readExtraInfo = function()
            return {net.ReadString(), net.ReadString()}
        end,

        extraInfoColors = {Color(102, 0, 255), Color(255, 102, 0)}
    }
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/giveweapons/cl_init.lua:
local function GiveWeaponGui(ply)
    local frame = vgui.Create("DFrame")
    frame:SetTitle("Give weapon")
    frame:SetSize(ScrW() / 2, ScrH() - 50)
    frame:Center()
    frame:SetVisible(true)
    frame:MakePopup()

    local WeaponMenu = vgui.Create("FAdmin_weaponPanel", frame)
    WeaponMenu:StretchToParent(0,25,0,0)

    function WeaponMenu:DoGiveWeapon(SpawnName, IsAmmo)
        if not ply:IsValid() then return end
        local giveWhat = (IsAmmo and "ammo") or "weapon"

        RunConsoleCommand("FAdmin", "give" .. giveWhat, ply:UserID(), SpawnName)
    end

    WeaponMenu:BuildList()
end

FAdmin.StartHooks["GiveWeapons"] = function()
    FAdmin.Access.AddPrivilege("giveweapon", 2)
    FAdmin.Commands.AddCommand("giveweapon", nil, "<Player>", "<weapon>")

    FAdmin.ScoreBoard.Player:AddActionButton("Give weapon(s)", "fadmin/icons/weapon", Color(255, 130, 0, 255),

    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "giveweapon") end, function(ply, button)
        GiveWeaponGui(ply)
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/cloak/cl_init.lua:
FAdmin.StartHooks["zz_Cloak"] = function()
    FAdmin.Access.AddPrivilege("Cloak", 2)
    FAdmin.Commands.AddCommand("Cloak", nil, "<Player>")
    FAdmin.Commands.AddCommand("Uncloak", nil, "<Player>")

    FAdmin.ScoreBoard.Player:AddActionButton(function(ply)
        if ply:FAdmin_GetGlobal("FAdmin_cloaked") then return "Uncloak" end
        return "Cloak"
    end, function(ply)
        if ply:FAdmin_GetGlobal("FAdmin_cloaked") then return "fadmin/icons/cloak", "fadmin/icons/disable" end
        return "fadmin/icons/cloak"
    end, Color(0, 200, 0, 255),

    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Cloak", ply) end, function(ply, button)
        if not ply:FAdmin_GetGlobal("FAdmin_cloaked") then
            RunConsoleCommand("_FAdmin", "Cloak", ply:UserID())
        else
            RunConsoleCommand("_FAdmin", "Uncloak", ply:UserID())
        end

        if not ply:FAdmin_GetGlobal("FAdmin_cloaked") then button:SetImage2("fadmin/icons/disable") button:SetText("Uncloak") button:GetParent():InvalidateLayout() return end
        button:SetImage2("null")
        button:SetText("Cloak")
        button:GetParent():InvalidateLayout()
    end)
end

--PATH addons/sl_util_accessory/lua/weapons/aas_item_menu/shared.lua:
AddCSLuaFile()

SWEP.PrintName = AAS.SwepName
SWEP.Category = "Union' Util"
SWEP.Author = "Kobralost"
SWEP.Purpose = ""

SWEP.Slot = 2
SWEP.SlotPos = 1

SWEP.HoldType = "pistol"
SWEP.WorldModel = ""

SWEP.AnimPrefix	 = "pistol"

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false

SWEP.UseHands = true

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:PrimaryAttack()
	if CLIENT then
		if AAS.BuyItemWithSwep then
			AAS.ItemMenu()
		else
			AAS.InventoryMenu(true)
		end
	end
end

function SWEP:SecondaryAttack()
	if CLIENT then
		if AAS.BuyItemWithSwep then
			AAS.ItemMenu()
		else
			AAS.InventoryMenu(true)
		end
	end
end

function SWEP:CanPrimaryAttack() end
function SWEP:CanSecondaryAttack() end

function SWEP:Initialize() self:SetHoldType("pistol") end
function SWEP:DrawWorldModel() end
function SWEP:PreDrawViewModel() return true end
--PATH addons/the_perfect_training_system/lua/weapons/diablos_sport_badge/cl_init.lua:
include("shared.lua")
--PATH addons/sl_utils/lua/weapons/gmod_tool/stools/advdupe2.lua:
--[[
	Title: Adv. Dupe 2 Tool

	Desc: Defines the AD2 tool and assorted functionalities.

	Author: TB

	Version: 1.0
]]

TOOL.Category = "Construction"
TOOL.Name = "#Tool.advdupe2.name"
cleanup.Register( "AdvDupe2" )
require( "controlpanel" )

if(SERVER) then
	CreateConVar("sbox_maxgmod_contr_spawners",5)

	local phys_constraint_system_types = {
		Weld          = true,
		Rope          = true,
		Elastic       = true,
		Slider        = true,
		Axis          = true,
		AdvBallsocket = true,
		Motor         = true,
		Pulley        = true,
		Ballsocket    = true,
		Winch         = true,
		Hydraulic     = true,
		WireMotor     = true,
		WireHydraulic = true
	}
	--Orders constraints so that the dupe uses as little constraint systems as possible
	local function GroupConstraintOrder( ply, constraints )
		--First separate the nocollides, sorted, and unsorted constraints
		local sorted, unsorted = {}, {}
		for k, v in pairs(constraints) do
			if phys_constraint_system_types[v.Type] then
				sorted[#sorted+1] = v
			else
				unsorted[#unsorted+1] = v
			end
		end

		local sortingSystems = {}
		local fullSystems = {}
		local function buildSystems(input)
			while next(input) ~= nil do
				for k, v in pairs(input) do
					for systemi, system in pairs(sortingSystems) do
						for _, target in pairs(system) do
							for x = 1, 4 do
								if v.Entity[x] then
									for y = 1, 4 do
										if target.Entity[y] and v.Entity[x].Index == target.Entity[y].Index then
											system[#system + 1] = v
											if #system == 100 then
												fullSystems[#fullSystems + 1] = system
												table.remove(sortingSystems, systemi)
											end
											input[k] = nil
											goto super_loopbreak
										end
									end
								end
							end
						end
					end
				end

				--Normally skipped by the goto unless no cluster is found. If so, make a new one.
				local k = next(input)
				sortingSystems[#sortingSystems + 1] = {input[k]}
				input[k] = nil

				::super_loopbreak::
			end
		end
		buildSystems(sorted)

		local ret = {}
		for _, system in pairs(fullSystems) do
			for _, v in pairs(system) do
				ret[#ret + 1] = v
			end
		end
		for _, system in pairs(sortingSystems) do
			for _, v in pairs(system) do
				ret[#ret + 1] = v
			end
		end
		for k, v in pairs(unsorted) do
			ret[#ret + 1] = v
		end

		if #fullSystems ~= 0 then
			ply:ChatPrint("DUPLICATOR: WARNING, Number of constraints exceeds 100: (".. #ret .."). Constraint sorting might not work as expected.")
		end

		return ret
	end

	local function CreationConstraintOrder( constraints )
		local ret = {}
		for k, v in pairs( constraints ) do
			ret[#ret + 1] = k
		end
		table.sort(ret)
		for i = 1, #ret do
			ret[i] = constraints[ret[i]]
		end
		return ret
	end

	local function GetSortedConstraints( ply, constraints )
		if ply:GetInfo("advdupe2_sort_constraints") ~= "0" then
			return GroupConstraintOrder( ply, constraints )
		else
			return CreationConstraintOrder( constraints )
		end
	end

	local areacopy_classblacklist = {
		gmod_anchor = true
	}

	local function PlayerCanDupeCPPI(ply, ent)
		if not AdvDupe2.duplicator.IsCopyable(ent) or areacopy_classblacklist[ent:GetClass()] then return false end
		return ent:CPPIGetOwner()==ply
	end

	-- Code from WireLib.CanTool
	local zero = Vector(0, 0, 0)
	local norm = Vector(1, 0, 0)

	local tr = { ---@type TraceResult
		Hit = true, HitNonWorld = true, HitNoDraw = false, HitSky = false, AllSolid = true,
		HitNormal = zero, Normal = norm,

		Fraction = 1, FractionLeftSolid = 0,
		HitBox = 0, HitGroup = 0, HitTexture = "**studio**",
		MatType = 0, PhysicsBone = 0, SurfaceProps = 0, DispFlags = 0, Contents = 0,

		Entity = NULL, HitPos = zero, StartPos = zero,
	}

	local function PlayerCanDupeTool(ply, ent)
		if not AdvDupe2.duplicator.IsCopyable(ent) or areacopy_classblacklist[ent:GetClass()] then return false end

		local pos = ent:GetPos()
		tr.Entity, tr.HitPos, tr.StartPos = ent, pos, pos

		return hook.Run( "CanTool", ply, tr, "advdupe2" ) ~= false
	end

	--Find all the entities in a box, given the adjacent corners and the player
	local function FindInBox(min, max, ply)
		local PPCheck = (tobool(ply:GetInfo("advdupe2_copy_only_mine")) and ply.CPPIGetOwner~=nil) and PlayerCanDupeCPPI or PlayerCanDupeTool
		local EntTable = {}
		for _, ent in ents.Iterator() do
			local pos = ent:GetPos()
			if (pos.X>=min.X) and (pos.X<=max.X) and
				 (pos.Y>=min.Y) and (pos.Y<=max.Y) and
				 (pos.Z>=min.Z) and (pos.Z<=max.Z) and PPCheck( ply, ent ) then
				EntTable[ent:EntIndex()] = ent
			end
		end

		return EntTable
	end

	--[[
		Name: GetDupeAngleOffset
		Desc: Retrieves duplication angle offsets from player
		Returns: <angle> Created angle
	]]
	local function GetDupeAngleOffset(ply)
		local p = math.Clamp(ply:GetInfoNum("advdupe2_offset_pitch", 0), -180, 180)
		local y = math.Clamp(ply:GetInfoNum("advdupe2_offset_yaw"  , 0), -180, 180)
		local r = math.Clamp(ply:GetInfoNum("advdupe2_offset_roll" , 0), -180, 180)
		return Angle(p, y, r)
	end

	--[[
		Name: GetDupeElevation
		Desc: Retrieves duplication Z elevation
		Returns: <number> Dupe elevation
	]]
	local function GetDupeElevation(ply)
		local con = ply:GetInfoNum("advdupe2_offset_z", 0)
		local enz = (tonumber(ply.AdvDupe2.HeadEnt.Z) or 0)
		return math.Clamp(con + enz, -32000, 32000)
	end

	--[[
		Name: LeftClick
		Desc: Defines the tool's behavior when the player left-clicks.
		Params: <trace> trace
		Returns: <boolean> success
	]]
	function TOOL:LeftClick( trace )
		if(not trace) then return false end

		local ply = self:GetOwner()
		local dupe = ply.AdvDupe2

		if not (dupe and dupe.Entities) then return false end

		if(dupe.Pasting or dupe.Downloading) then
			AdvDupe2.Notify(ply,"Advanced Duplicator 2 is busy.",NOTIFY_ERROR)
			return false
		end

		dupe.Angle = GetDupeAngleOffset(ply)
		dupe.Position = Vector(trace.HitPos)
		dupe.Position.z = dupe.Position.z + GetDupeElevation(ply)

		if(tobool(ply:GetInfo("advdupe2_offset_world"))) then
			dupe.Angle = dupe.Angle - dupe.Entities[dupe.HeadEnt.Index].PhysicsObjects[0].Angle
		end

		dupe.Pasting = true
		AdvDupe2.Notify(ply,"Pasting...")
		local origin
		if(tobool(ply:GetInfo("advdupe2_original_origin"))) then
			origin = dupe.HeadEnt.Pos
		end

		AdvDupe2.InitPastingQueue(ply, dupe.Position, dupe.Angle, origin,
			tobool(ply:GetInfo("advdupe2_paste_constraints")),
			tobool(ply:GetInfo("advdupe2_paste_parents")),
			tobool(ply:GetInfo("advdupe2_paste_disparents")),
			tobool(ply:GetInfo("advdupe2_paste_protectoveride")))

		return true
	end

	--[[
		Name: RightClick
		Desc: Defines the tool's behavior when the player right-clicks.
		Params: <trace> trace
		Returns: <boolean> success
	]]
	function TOOL:RightClick( trace )
		local ply = self:GetOwner()
		local dupe = ply.AdvDupe2

		if not dupe then dupe = {}; ply.AdvDupe2 = dupe end

		if(dupe.Pasting or dupe.Downloading) then
			AdvDupe2.Notify(ply,"Advanced Duplicator 2 is busy.", NOTIFY_ERROR)
			return false
		end

		--Set Area Copy on or off
		if( ply:KeyDown(IN_SPEED) and not ply:KeyDown(IN_WALK) ) then
			if(self:GetStage()==0) then
				AdvDupe2.DrawSelectBox(ply)
				self:SetStage(1)
				return false
			elseif(self:GetStage()==1) then
				AdvDupe2.RemoveSelectBox(ply)
				self:SetStage(0)
				return false
			end
		end

		if(not trace or not trace.Hit) then return false end

		local Entities, Constraints, AddOne
		local HeadEnt = {}
		--If area copy is on
		if(self:GetStage()==1) then
			local area_size = math.Clamp(tonumber(ply:GetInfo("advdupe2_area_copy_size")) or 50, 0, 30720)
			local Pos = trace.HitNonWorld and trace.Entity:GetPos() or trace.HitPos
			local T = (Vector(area_size,area_size,area_size)+Pos)
			local B = (Vector(-area_size,-area_size,-area_size)+Pos)

			local Ents = FindInBox(B,T, ply)
			local _, Ent = next(Ents)
			if not Ent then
				self:SetStage(0)
				AdvDupe2.RemoveSelectBox(ply)
				return true
			end

			Ent = trace.HitNonWorld and trace.Entity or Ent
			HeadEnt.Index = Ent:EntIndex()
			HeadEnt.Pos = Ent:GetPos()

			Entities, Constraints = AdvDupe2.duplicator.AreaCopy(ply, Ents, HeadEnt.Pos, tobool(ply:GetInfo("advdupe2_copy_outside")))

			self:SetStage(0)
			AdvDupe2.RemoveSelectBox(ply)
		elseif trace.HitNonWorld then	--Area Copy is off
			-- Filter duplicator blocked entities out.
			if not AdvDupe2.duplicator.IsCopyable( trace.Entity ) then
				return false
			end

			--If Alt is being held, add a prop to the dupe
			if(ply:KeyDown(IN_WALK) and dupe.Entities~=nil and next(dupe.Entities)~=nil) then
				Entities = dupe.Entities
				Constraints = dupe.Constraints
				HeadEnt = dupe.HeadEnt

				AdvDupe2.duplicator.Copy( ply, trace.Entity, Entities, Constraints, HeadEnt.Pos)

				--Only add the one ghost
				AddOne = Entities[trace.Entity:EntIndex()]
			else
				Entities = {}
				Constraints = {}
				HeadEnt.Index = trace.Entity:EntIndex()
				HeadEnt.Pos = trace.HitPos

				AdvDupe2.duplicator.Copy( ply, trace.Entity, Entities, Constraints, trace.HitPos )
			end
		else --Non valid entity or clicked the world
			if dupe.Entities then
				--clear the dupe
				net.Start("AdvDupe2_RemoveGhosts")
				net.Send(ply)
				dupe.Entities = nil
				dupe.Constraints = nil
				net.Start("AdvDupe2_ResetDupeInfo")
				net.Send(ply)
				AdvDupe2.ResetOffsets(ply)
				return true
			else
				--select all owned props
				Entities = {}
				local PPCheck = (tobool(ply:GetInfo("advdupe2_copy_only_mine")) and CPPI~=nil) and PlayerCanDupeCPPI or PlayerCanDupeTool
				for _, ent in ents.Iterator() do
					if PPCheck( ply, ent ) then
						Entities[ent:EntIndex()] = ent
					end
				end

				local _, Ent = next(Entities)
				if not Ent then
				net.Start("AdvDupe2_RemoveGhosts")
				net.Send(ply)
					return true
				end

				HeadEnt.Index = Ent:EntIndex()
				HeadEnt.Pos = Ent:GetPos()

				Entities, Constraints = AdvDupe2.duplicator.AreaCopy(ply, Entities, HeadEnt.Pos, tobool(ply:GetInfo("advdupe2_copy_outside")))
			end
		end

		if not HeadEnt.Z then
			local WorldTrace = util.TraceLine({
				mask   = MASK_NPCWORLDSTATIC,
				start  = HeadEnt.Pos + Vector(0,0,1),
				endpos = HeadEnt.Pos-Vector(0,0,50000)
			})

			HeadEnt.Z = WorldTrace.Hit and math.abs(HeadEnt.Pos.Z - WorldTrace.HitPos.Z) or 0
		end

		dupe.HeadEnt = HeadEnt
		dupe.Entities = Entities
		dupe.Constraints = GetSortedConstraints(ply, Constraints)
		dupe.Revision = AdvDupe2.CodecRevision

		net.Start("AdvDupe2_SetDupeInfo")
			net.WriteString("")
			net.WriteString(ply:Nick())
			net.WriteString(os.date("%d %B %Y"))
			net.WriteString(os.date("%I:%M %p"))
			net.WriteString("")
			net.WriteString("")
			net.WriteString(table.Count(dupe.Entities))
			net.WriteString(#dupe.Constraints)
		net.Send(ply)

		if AddOne then
			AdvDupe2.SendGhost(ply, AddOne)
		else
			AdvDupe2.SendGhosts(ply)
		end

		AdvDupe2.ResetOffsets(ply)

		return true
	end

	--Checks table, re-draws loading bar, and recreates ghosts when tool is pulled out
	function TOOL:Deploy()
		local ply = self:GetOwner()
		local dupe = ply.AdvDupe2

		if not dupe then dupe = {}; ply.AdvDupe2 = dupe end

		if(not dupe.Entities) then return end

		net.Start("AdvDupe2_StartGhosting")
		net.Send(ply)

		if(dupe.Queued) then
			AdvDupe2.InitProgressBar(ply, "Queued: ")
			return
		end

		if(dupe.Pasting) then
			AdvDupe2.InitProgressBar(ply, "Pasting: ")
			return
		else
			if(dupe.Uploading) then
				AdvDupe2.InitProgressBar(ply, "Opening: ")
				return
			elseif(dupe.Downloading) then
				AdvDupe2.InitProgressBar(ply, "Saving: ")
				return
			end
		end

	end

	--Removes progress bar
	function TOOL:Holster()
		AdvDupe2.RemoveProgressBar(self:GetOwner())
	end

	--[[
		Name: Reload
		Desc: Creates an Advance Contraption Spawner.
		Params: <trace> trace
		Returns: <boolean> success
	]]
	function TOOL:Reload( trace )
		if(not trace.Hit) then return false end

		local ply = self:GetOwner()
		local dupe = ply.AdvDupe2

		if not dupe then dupe = {}; ply.AdvDupe2 = dupe end

		if(self:GetStage()==1) then
			local areasize = math.Clamp(tonumber(ply:GetInfo("advdupe2_area_copy_size")) or 50, 0, 30720)
			net.Start("AdvDupe2_CanAutoSave")
				net.WriteVector(trace.HitPos)
				net.WriteFloat(areasize)
				if(trace.Entity) then
					net.WriteUInt(trace.Entity:EntIndex(), 16)
				else
					net.WriteUInt(0, 16)
				end
			net.Send(ply)
			self:SetStage(0)
			AdvDupe2.RemoveSelectBox(ply)
			dupe.TempAutoSavePos = trace.HitPos
			dupe.TempAutoSaveSize = areasize
			dupe.TempAutoSaveOutSide = tobool(ply:GetInfo("advdupe2_copy_outside"))
			return true
		end

		--If a contraption spawner was clicked then update it with the current settings
		if(trace.Entity:GetClass()=="gmod_contr_spawner") then
			local delay = tonumber(ply:GetInfo("advdupe2_contr_spawner_delay"))
			local undo_delay = tonumber(ply:GetInfo("advdupe2_contr_spawner_undo_delay"))
			local min
			local max
			if(not delay) then
				delay = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
			else
				if(not game.SinglePlayer()) then
					min = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
					if (delay < min) then
						delay = min
					end
				elseif(delay<0) then
					delay = 0
				end
			end

			if(not undo_delay) then
				undo_delay = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay"))
			else
				if(not game.SinglePlayer()) then
					min = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay")) or 0.1
					max = tonumber(GetConVarString("AdvDupe2_MaxContraptionUndoDelay")) or 60
					if(undo_delay < min) then
						undo_delay = min
					elseif(undo_delay > max) then
						undo_delay = max
					end
				elseif(undo_delay < 0) then
					undo_delay = 0
				end
			end

			trace.Entity:GetTable():SetOptions(
				ply, delay, undo_delay,
				tonumber(ply:GetInfo("advdupe2_contr_spawner_key")),
				tonumber(ply:GetInfo("advdupe2_contr_spawner_undo_key")),
				tonumber(ply:GetInfo("advdupe2_contr_spawner_disgrav")) or 0,
				tonumber(ply:GetInfo("advdupe2_contr_spawner_disdrag")) or 0,
				tonumber(ply:GetInfo("advdupe2_contr_spawner_addvel")) or 1 )

			return true
		end

		--Create a contraption spawner
		if dupe and dupe.Entities then
			local headent = dupe.Entities[dupe.HeadEnt.Index]
			local Pos, Ang

			if(headent) then
				if(tobool(ply:GetInfo("advdupe2_original_origin"))) then
					Pos = dupe.HeadEnt.Pos + headent.PhysicsObjects[0].Pos
					Ang = headent.PhysicsObjects[0].Angle
				else
					local EntAngle = headent.PhysicsObjects[0].Angle
					if(tobool(ply:GetInfo("advdupe2_offset_world"))) then EntAngle = Angle(0,0,0) end
					trace.HitPos.Z = trace.HitPos.Z + GetDupeElevation(ply)
					Pos, Ang = LocalToWorld(headent.PhysicsObjects[0].Pos, EntAngle, trace.HitPos, GetDupeAngleOffset(ply))
				end
			else
				AdvDupe2.Notify(ply, "Invalid head entity to spawn contraption spawner.")
				return false
			end

			if(headent.Class=="gmod_contr_spawner") then
				AdvDupe2.Notify(ply, "Cannot make a contraption spawner from a contraption spawner.")
				return false
			end


			local spawner = MakeContraptionSpawner(
				ply, Pos, Ang, dupe.HeadEnt.Index,
				table.Copy(dupe.Entities),
				table.Copy(dupe.Constraints),
				tonumber(ply:GetInfo("advdupe2_contr_spawner_delay")),
				tonumber(ply:GetInfo("advdupe2_contr_spawner_undo_delay")), headent.Model,
				tonumber(ply:GetInfo("advdupe2_contr_spawner_key")),
				tonumber(ply:GetInfo("advdupe2_contr_spawner_undo_key")),
				tonumber(ply:GetInfo("advdupe2_contr_spawner_disgrav")) or 0,
				tonumber(ply:GetInfo("advdupe2_contr_spawner_disdrag")) or 0,
				tonumber(ply:GetInfo("advdupe2_contr_spawner_addvel")) or 1,
				tonumber(ply:GetInfo("advdupe2_contr_spawner_hideprops")) or 0)

			ply:AddCleanup( "AdvDupe2", spawner )
			undo.Create("gmod_contr_spawner")
				undo.AddEntity( spawner )
				undo.SetPlayer( ply )
			undo.Finish()

			return true
		end
	end

	--Called to clean up the tool when pasting is finished or undo during pasting
	function AdvDupe2.FinishPasting(Player, Paste)
		Player.AdvDupe2.Pasting=false
		AdvDupe2.RemoveProgressBar(Player)
		if(Paste) then AdvDupe2.Notify(Player,"Finished Pasting!") end
	end

	--function for creating a contraption spawner
	function MakeContraptionSpawner( ply, Pos, Ang, HeadEnt, EntityTable, ConstraintTable, delay, undo_delay, model, key, undo_key, disgrav, disdrag, addvel, hideprops)

		if not ply:CheckLimit("gmod_contr_spawners") then return nil end

		if(not game.SinglePlayer()) then
			if(table.Count(EntityTable)>tonumber(GetConVarString("AdvDupe2_MaxContraptionEntities"))) then
				AdvDupe2.Notify(ply,"Contraption Spawner exceeds the maximum amount of "..GetConVarString("AdvDupe2_MaxContraptionEntities").." entities for a spawner!",NOTIFY_ERROR)
				return false
			end
			if(#ConstraintTable>tonumber(GetConVarString("AdvDupe2_MaxContraptionConstraints"))) then
				AdvDupe2.Notify(ply,"Contraption Spawner exceeds the maximum amount of "..GetConVarString("AdvDupe2_MaxContraptionConstraints").." constraints for a spawner!",NOTIFY_ERROR)
				return false
			end
		end

		local spawner = ents.Create("gmod_contr_spawner")
		if not IsValid(spawner) then return end

		spawner:SetPos(Pos)
		spawner:SetAngles(Ang)
		spawner:SetModel(model)
		spawner:SetRenderMode(RENDERMODE_TRANSALPHA)
		spawner:SetCreator(ply)
		spawner:Spawn()

		duplicator.ApplyEntityModifiers(ply, spawner)

		if IsValid(spawner:GetPhysicsObject()) then
			spawner:GetPhysicsObject():EnableMotion(false)
		end

		local min
		local max
		if(not delay) then
			delay = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
		else
			if(not game.SinglePlayer()) then
				min = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
				if (delay < min) then
					delay = min
				end
			elseif(delay<0) then
				delay = 0
			end
		end

		if(not undo_delay) then
			undo_delay = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay"))
		else
			if(not game.SinglePlayer()) then
				min = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay")) or 0.1
				max = tonumber(GetConVarString("AdvDupe2_MaxContraptionUndoDelay")) or 60
				if(undo_delay < min) then
					undo_delay = min
				elseif(undo_delay > max) then
					undo_delay = max
				end
			elseif(undo_delay < 0) then
				undo_delay = 0
			end
		end

		-- Set options
		spawner:SetPlayer(ply)
		spawner:GetTable():SetOptions(ply, delay, undo_delay, key, undo_key, disgrav, disdrag, addvel, hideprops)

		local tbl = {
			ply        = ply,
			delay      = delay,
			undo_delay = undo_delay,
			disgrav    = disgrav,
			disdrag    = disdrag,
			addvel     = addvel,
			hideprops  = hideprops
		}
		table.Merge(spawner:GetTable(), tbl)
		spawner:SetDupeInfo(HeadEnt, EntityTable, ConstraintTable)
		spawner:AddGhosts(ply)

		ply:AddCount("gmod_contr_spawners", spawner)
		ply:AddCleanup("gmod_contr_spawner", spawner)
		return spawner
	end

	duplicator.RegisterEntityClass("gmod_contr_spawner", MakeContraptionSpawner,
		"Pos", "Ang", "HeadEnt", "EntityTable", "ConstraintTable", "delay",
		"undo_delay", "model", "key", "undo_key", "disgrav", "disdrag", "addvel", "hideprops")

	function AdvDupe2.InitProgressBar(ply,label)
		net.Start("AdvDupe2_InitProgressBar")
			net.WriteString(label)
		net.Send(ply)
	end

	function AdvDupe2.DrawSelectBox(ply)
		net.Start("AdvDupe2_DrawSelectBox")
		net.Send(ply)
	end

	function AdvDupe2.RemoveSelectBox(ply)
		net.Start("AdvDupe2_RemoveSelectBox")
		net.Send(ply)
	end

	function AdvDupe2.UpdateProgressBar(ply,percent)
		net.Start("AdvDupe2_UpdateProgressBar")
			net.WriteFloat(percent)
		net.Send(ply)
	end

	function AdvDupe2.RemoveProgressBar(ply)
		net.Start("AdvDupe2_RemoveProgressBar")
		net.Send(ply)
	end

	--Reset the offsets of height, pitch, yaw, and roll back to default
	function AdvDupe2.ResetOffsets(ply, keep)

		if(not keep) then
			ply.AdvDupe2.Name = nil
		end
		net.Start("AdvDupe2_ResetOffsets")
		net.Send(ply)
	end

	net.Receive("AdvDupe2_CanAutoSave", function(len, ply, len2)

		local desc = net.ReadString()
		local ent = net.ReadInt(16)
		local dupe = ply.AdvDupe2

		if(ent~=0) then
			dupe.AutoSaveEnt = ent
			if(ply:GetInfo("advdupe2_auto_save_contraption")=="1") then
				dupe.AutoSaveEnt = ents.GetByIndex( dupe.AutoSaveEnt )
			end
		else
			if(ply:GetInfo("advdupe2_auto_save_contraption")=="1") then
				AdvDupe2.Notify(ply, "No entity selected to auto save contraption.", NOTIFY_ERROR)
				return
			end
			dupe.AutoSaveEnt = nil
		end

		dupe.AutoSavePos = dupe.TempAutoSavePos
		dupe.AutoSaveSize = dupe.TempAutoSaveSize
		dupe.AutoSaveOutSide = dupe.TempAutoSaveOutSide
		dupe.AutoSaveContr = ply:GetInfo("advdupe2_auto_save_contraption")=="1"
		dupe.AutoSaveDesc = desc

		local time = math.Clamp(tonumber(ply:GetInfo("advdupe2_auto_save_time")) or 2, 2, 30)
		if(game.SinglePlayer()) then
			dupe.AutoSavePath = net.ReadString()
		end

		AdvDupe2.Notify(ply, "Your area will be auto saved every "..(time*60).." seconds.")
		local name = "AdvDupe2_AutoSave_"..ply:UniqueID()
		if(timer.Exists(name)) then
			timer.Adjust(name, time*60, 0)
			return
		end
		timer.Create(name, time*60, 0, function()
			if(not IsValid(ply)) then
				timer.Remove(name)
				return
			end

			local dupe = ply.AdvDupe2
			if(dupe.Downloading) then
				AdvDupe2.Notify(ply, "Skipping auto save, tool is busy.", NOTIFY_ERROR)
				return
			end

			local Tab = {Entities={}, Constraints={}, HeadEnt={}}

			if(dupe.AutoSaveContr) then
				if(not IsValid(dupe.AutoSaveEnt)) then
					timer.Remove(name)
					AdvDupe2.Notify(ply, "Head entity for auto save no longer valid; stopping auto save.", NOTIFY_ERROR)
					return
				end

				Tab.HeadEnt.Index = dupe.AutoSaveEnt:EntIndex()
				Tab.HeadEnt.Pos = dupe.AutoSaveEnt:GetPos()

				local WorldTrace = util.TraceLine({
					mask   = MASK_NPCWORLDSTATIC,
					start  = Tab.HeadEnt.Pos + Vector(0,0,1),
					endpos = Tab.HeadEnt.Pos - Vector(0,0,50000)
				})

				Tab.HeadEnt.Z = WorldTrace.Hit and math.abs(Tab.HeadEnt.Pos.Z - WorldTrace.HitPos.Z) or 0
				AdvDupe2.duplicator.Copy( ply, dupe.AutoSaveEnt, Tab.Entities, Tab.Constraints, Tab.HeadEnt.Pos )
			else
				local i = dupe.AutoSaveSize
				local Pos = dupe.AutoSavePos
				local T = Vector( i, i, i); T:Add(Pos)
				local B = Vector(-i,-i,-i); B:Add(Pos)

				local Entities = FindInBox(B,T, ply)
				local _, HeadEnt = next(Entities)
				if not HeadEnt then
					AdvDupe2.Notify(ply, "Area Auto Save copied 0 entities; be sure to turn it off.", NOTIFY_ERROR)
					return
				end

				if(dupe.AutoSaveEnt and Entities[dupe.AutoSaveEnt]) then
					Tab.HeadEnt.Index = dupe.AutoSaveEnt
				else
					Tab.HeadEnt.Index = HeadEnt:EntIndex()
				end
				Tab.HeadEnt.Pos = HeadEnt:GetPos()

				local WorldTrace = util.TraceLine({
					mask   = MASK_NPCWORLDSTATIC,
					start  = Tab.HeadEnt.Pos + Vector(0,0,1),
					endpos = Tab.HeadEnt.Pos - Vector(0,0,50000)
				})

				Tab.HeadEnt.Z = WorldTrace.Hit and math.abs(Tab.HeadEnt.Pos.Z - WorldTrace.HitPos.Z) or 0
				Tab.Entities, Tab.Constraints = AdvDupe2.duplicator.AreaCopy(ply, Entities, Tab.HeadEnt.Pos, dupe.AutoSaveOutSide)
			end
			Tab.Constraints = GetSortedConstraints(ply, Tab.Constraints)
			Tab.Description = dupe.AutoSaveDesc

			AdvDupe2.Encode( Tab, AdvDupe2.GenerateDupeStamp(ply), function(data)
				AdvDupe2.SendToClient(ply, data, 1)
			end)
			dupe.FileMod = CurTime()+tonumber(GetConVarString("AdvDupe2_FileModificationDelay"))
		end)
		timer.Start(name)
	end)

	concommand.Add("AdvDupe2_SetStage", function(ply, cmd, args)
		ply:GetTool("advdupe2"):SetStage(1)
	end)

	concommand.Add("AdvDupe2_RemoveAutoSave", function(ply, cmd, args)
		timer.Remove("AdvDupe2_AutoSave_"..ply:UniqueID())
	end)

	concommand.Add("AdvDupe2_SaveMap", function(ply, cmd, args)
		if(not ply:IsAdmin()) then
			AdvDupe2.Notify(ply, "You do not have permission to this function.", NOTIFY_ERROR)
			return
		end

		local Entities = {}
		for _, v in ents.Iterator() do
			if not v:CreatedByMap() and AdvDupe2.duplicator.IsCopyable(v) then
				Entities[v:EntIndex()] = v
			end
		end

		local _, HeadEnt = next(Entities)
		if not HeadEnt then return end

		local Tab = {Entities={}, Constraints={}, HeadEnt={}, Description=""}
		Tab.HeadEnt.Index = HeadEnt:EntIndex()
		Tab.HeadEnt.Pos = HeadEnt:GetPos()

		local WorldTrace = util.TraceLine({
			mask   = MASK_NPCWORLDSTATIC,
			start  = Tab.HeadEnt.Pos + Vector(0,0,1),
			endpos = Tab.HeadEnt.Pos - Vector(0,0,50000)
		})

		Tab.HeadEnt.Z = WorldTrace.Hit and math.abs(Tab.HeadEnt.Pos.Z - WorldTrace.HitPos.Z) or 0
		Tab.Entities, Tab.Constraints = AdvDupe2.duplicator.AreaCopy(ply, Entities, Tab.HeadEnt.Pos, true)
		Tab.Constraints = GetSortedConstraints(ply, Tab.Constraints)

		Tab.Map = true
		AdvDupe2.Encode( Tab, AdvDupe2.GenerateDupeStamp(ply), function(data)
			if #data > AdvDupe2.MaxDupeSize then
				AdvDupe2.Notify(ply, "Copied duplicator filesize is too big!",NOTIFY_ERROR)
				return 
			end
			if(not file.IsDir("advdupe2_maps", "DATA")) then
				file.CreateDir("advdupe2_maps")
			end
			file.Write("advdupe2_maps/"..args[1]..".txt", data)
			AdvDupe2.Notify(ply, "Map save, saved successfully.")
		end)
	end)
end

if(CLIENT) then

	function TOOL:LeftClick(trace)
		if(trace and AdvDupe2.HeadGhost) then
			return true
		end
		return false
	end

	function TOOL:RightClick(trace)
		if( self:GetOwner():KeyDown(IN_SPEED) and not self:GetOwner():KeyDown(IN_WALK) ) then
			return false
		end
		return true
	end

	--Removes progress bar and removes ghosts when tool is put away
	function TOOL:ReleaseGhostEntity()
		AdvDupe2.RemoveGhosts()
		AdvDupe2.RemoveSelectBox()
		if(AdvDupe2.Rotation) then
			hook.Remove("PlayerBindPress", "AdvDupe2_BindPress")
			hook.Remove("CreateMove", "AdvDupe2_MouseControl")
		end
		return
	end

	function TOOL:Reload( trace )
		if(trace and (AdvDupe2.HeadGhost or self:GetStage() == 1)) then
			return true
		end
		return false
	end

	--Take control of the mouse wheel bind so the player can modify the height of the dupe
	local function MouseWheelScrolled(ply, bind, pressed)

		if(bind == "invprev") then
			if(ply:GetTool("advdupe2"):GetStage() == 1) then
				local size = math.min(tonumber(ply:GetInfo("advdupe2_area_copy_size")) + 25, 30720)
				RunConsoleCommand("advdupe2_area_copy_size",size)
			else
				local Z = tonumber(ply:GetInfo("advdupe2_offset_z")) + 5
				RunConsoleCommand("advdupe2_offset_z",Z)
			end
			return true
		elseif(bind == "invnext") then
			if(ply:GetTool("advdupe2"):GetStage() == 1) then
				local size = math.max(tonumber(ply:GetInfo("advdupe2_area_copy_size")) - 25, 25)
				RunConsoleCommand("advdupe2_area_copy_size",size)
			else
				local Z = tonumber(ply:GetInfo("advdupe2_offset_z")) - 5
				RunConsoleCommand("advdupe2_offset_z",Z)
			end
			return true
		end

		GAMEMODE:PlayerBindPress(ply, bind, pressed)
	end

	local YawTo = 0
	local BsAng = Angle()

	local function GetRotationSign(ply)
		local VY = tonumber(ply:GetInfo("advdupe2_offset_yaw")) or 0
		BsAng:Zero(); BsAng:RotateAroundAxis(BsAng:Up(), VY)
		local PR = ply:GetRight()
		local DP = BsAng:Right():Dot(PR)
		local DR = BsAng:Forward():Dot(PR)
		if(math.abs(DR) > math.abs(DP)) then -- Roll priority
			if(DR >= 0) then return -1, 1 else return  1, -1 end
		else -- Pitch axis takes priority. Normal X-Y map
			if(DP >= 0) then return  1, 1 else return -1, -1 end
		end
	end

	local function MouseControl( cmd )
		local ply = LocalPlayer()
		local X =  cmd:GetMouseX() / 20
		local Y = -cmd:GetMouseY() / 20
		local ru = ply:KeyDown(IN_SPEED)
		local mm = input.IsMouseDown(MOUSE_MIDDLE)

		if(mm) then
			if(ru) then
				YawTo = 0 -- Reset total integrated yaw
				RunConsoleCommand("advdupe2_offset_pitch", 0)
				RunConsoleCommand("advdupe2_offset_yaw"  , 0)
				RunConsoleCommand("advdupe2_offset_roll" , 0)
			else
				if(Y ~= 0) then
					local VR = tonumber(ply:GetInfo("advdupe2_offset_roll"))  or 0
					local VP = tonumber(ply:GetInfo("advdupe2_offset_pitch")) or 0
					local SP, SR, P, R = GetRotationSign(ply)
					if(SP ~= SR) then
						P = math.NormalizeAngle(VP + X * SR)
						R = math.NormalizeAngle(VR + Y * SP)
					else
						P = math.NormalizeAngle(VP + Y * SP)
						R = math.NormalizeAngle(VR + X * SR)
					end
					RunConsoleCommand("advdupe2_offset_pitch", P)
					RunConsoleCommand("advdupe2_offset_roll" , R)
				end
			end
		else
			if(X ~= 0) then
				VY = tonumber(ply:GetInfo("advdupe2_offset_yaw")) or 0
				if(ru) then
					YawTo = YawTo + X -- Integrate the mouse on the X value from the mouse
					RunConsoleCommand("advdupe2_offset_yaw", math.SnapTo(math.NormalizeAngle(YawTo), 45))
				else
					YawTo = VY + X -- Update the last yaw with the current value from the mouse
					RunConsoleCommand("advdupe2_offset_yaw", math.NormalizeAngle(YawTo))
				end
			end
		end
	end

	--Checks binds to modify dupes position and angles
	function TOOL:Think()

		if AdvDupe2.HeadGhost then
			AdvDupe2.UpdateGhosts()
		end

		if(LocalPlayer():KeyDown(IN_USE)) then
			if(not AdvDupe2.Rotation) then
				hook.Add("PlayerBindPress", "AdvDupe2_BindPress", MouseWheelScrolled)
				hook.Add("CreateMove", "AdvDupe2_MouseControl", MouseControl)
				AdvDupe2.Rotation = true
			end
		else
			if(AdvDupe2.Rotation) then
				AdvDupe2.Rotation = false
				hook.Remove("PlayerBindPress", "AdvDupe2_BindPress")
				hook.Remove("CreateMove", "AdvDupe2_MouseControl")
			end
		end
	end

	--Hinder the player from looking to modify offsets with the mouse
	function TOOL:FreezeMovement()
		return AdvDupe2.Rotation
	end

	language.Add( "Tool.advdupe2.name",	"Advanced Duplicator 2" )
	language.Add( "Tool.advdupe2.desc",	"Duplicate things." )
	language.Add( "Tool.advdupe2.0",	"Primary: Paste, Secondary: Copy, Secondary+World: Select/Deselect All, Secondary+Shift: Area copy." )
	language.Add( "Tool.advdupe2.1",	"Primary: Paste, Secondary: Copy an area, Reload: Autosave an area, Secondary+Shift: Cancel." )
	language.Add( "Undone_AdvDupe2",	"Undone AdvDupe2 paste" )
	language.Add( "Cleanup_AdvDupe2",	"AdvDupe2 Duplications" )
	language.Add( "Cleaned_AdvDupe2",	"Cleaned up all AdvDupe2 Duplications" )
	language.Add( "SBoxLimit_AdvDupe2",	"You've reached the AdvDupe2 Duplicator limit!" )

	CreateClientConVar("advdupe2_offset_world", 0, false, true)
	CreateClientConVar("advdupe2_offset_z", 0, false, true)
	CreateClientConVar("advdupe2_offset_pitch", 0, false, true)
	CreateClientConVar("advdupe2_offset_yaw", 0, false, true)
	CreateClientConVar("advdupe2_offset_roll", 0, false, true)
	CreateClientConVar("advdupe2_original_origin", 0, false, true)
	CreateClientConVar("advdupe2_paste_constraints", 1, false, true)
	CreateClientConVar("advdupe2_sort_constraints", 1, true, true)
	CreateClientConVar("advdupe2_paste_parents", 1, false, true)
	CreateClientConVar("advdupe2_paste_unfreeze", 0, false, true)
	CreateClientConVar("advdupe2_preserve_freeze", 0, false, true)
	CreateClientConVar("advdupe2_copy_outside", 0, false, true)
	CreateClientConVar("advdupe2_copy_only_mine", 1, false, true)
	CreateClientConVar("advdupe2_limit_ghost", 100, false, true)
	CreateClientConVar("advdupe2_area_copy_size", 300, false, true)
	CreateClientConVar("advdupe2_auto_save_contraption", 0, false, true)
	CreateClientConVar("advdupe2_auto_save_overwrite", 1, false, true)
	CreateClientConVar("advdupe2_auto_save_time", 2, false, true)

	--Contraption Spawner
	CreateClientConVar("advdupe2_contr_spawner_key", -1, false, true)
	CreateClientConVar("advdupe2_contr_spawner_undo_key", -1, false, true)
	CreateClientConVar("advdupe2_contr_spawner_delay", 0, false, true)
	CreateClientConVar("advdupe2_contr_spawner_undo_delay", 10, false, true)
	CreateClientConVar("advdupe2_contr_spawner_disgrav", 0, false, true)
	CreateClientConVar("advdupe2_contr_spawner_disdrag", 0, false, true)
	CreateClientConVar("advdupe2_contr_spawner_addvel", 1, false, true)
	CreateClientConVar("advdupe2_contr_spawner_hideprops", 0, false, true)

	--Experimental
	CreateClientConVar("advdupe2_paste_disparents", 0, false, true)
	CreateClientConVar("advdupe2_paste_protectoveride", 1, false, true)
	CreateClientConVar("advdupe2_debug_openfile", 1, false, true)

	local function BuildCPanel(CPanel)
		CPanel:ClearControls()

		local FileBrowser = vgui.Create("advdupe2_browser")
		CPanel:AddItem(FileBrowser)
		FileBrowser:SetSize(CPanel:GetWide(), 405)
		AdvDupe2.FileBrowser = FileBrowser

		local Check = vgui.Create("DCheckBoxLabel")

		Check:SetText( "Paste at original position" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_original_origin" )
		Check:SetValue( 0 )
		Check:SetToolTip("Paste at the position originally copied")
		CPanel:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Paste with constraints" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_paste_constraints" )
		Check:SetValue( 1 )
		Check:SetToolTip("Paste with or without constraints")
		CPanel:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Paste with parenting" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_paste_parents" )
		Check:SetValue( 1 )
		Check:SetToolTip("Paste with or without parenting")
		CPanel:AddItem(Check)

		local Check_1 = vgui.Create("DCheckBoxLabel")
		local Check_2 = vgui.Create("DCheckBoxLabel")

		Check_1:SetText( "Unfreeze all after paste" )
		Check_1:SetDark(true)
		Check_1:SetConVar( "advdupe2_paste_unfreeze" )
		Check_1:SetValue( 0 )
		Check_1.OnChange = function()
			if(Check_1:GetChecked() and Check_2:GetChecked()) then
				Check_2:SetValue(0)
			end
		end
		Check_1:SetToolTip("Unfreeze all props after pasting")
		CPanel:AddItem(Check_1)

		Check_2:SetText( "Preserve frozen state after paste" )
		Check_2:SetDark(true)
		Check_2:SetConVar( "advdupe2_preserve_freeze" )
		Check_2:SetValue( 0 )
		Check_2.OnChange = function()
			if(Check_2:GetChecked() and Check_1:GetChecked()) then
				Check_1:SetValue(0)
			end
		end
		Check_2:SetToolTip("Makes props have the same frozen state as when they were copied")
		CPanel:AddItem(Check_2)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Area copy constrained props outside of box" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_copy_outside" )
		Check:SetValue( 0 )
		Check:SetToolTip("Copy entities outside of the area copy that are constrained to entities insde")
		CPanel:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "World/Area copy only your own props" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_copy_only_mine" )
		Check:SetValue( 1 )
		Check:SetToolTip("Copy entities outside of the area copy that are constrained to entities insde")
		CPanel:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Sort constraints by their connections" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_sort_constraints" )
		Check:SetValue( GetConVarNumber("advdupe2_sort_constraints") )
		Check:SetToolTip( "Orders constraints so that they build a rigid constraint system." )
		CPanel:AddItem(Check)

		local NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Ghost Percentage:" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( 0 )
		NumSlider:SetMax( 100 )
		NumSlider:SetDecimals( 0 )
		NumSlider:SetConVar( "advdupe2_limit_ghost" )
		NumSlider:SetToolTip("Change the percent of ghosts to spawn")
		--If these funcs are not here, problems occur for each
		local func = NumSlider.Slider.OnMouseReleased
		NumSlider.Slider.OnMouseReleased = function(self, mcode) func(self, mcode) AdvDupe2.StartGhosting() end
		local func2 = NumSlider.Slider.Knob.OnMouseReleased
		NumSlider.Slider.Knob.OnMouseReleased = function(self, mcode) func2(self, mcode) AdvDupe2.StartGhosting() end
		local func3 = NumSlider.Wang.Panel.OnLoseFocus
		NumSlider.Wang.Panel.OnLoseFocus = function(txtBox) func3(txtBox) AdvDupe2.StartGhosting() end
		CPanel:AddItem(NumSlider)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Area Copy Size:" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( 0 )
		NumSlider:SetMax( 30720 )
		NumSlider:SetDecimals( 0 )
		NumSlider:SetConVar( "advdupe2_area_copy_size" )
		NumSlider:SetToolTip("Change the size of the area copy")
		CPanel:AddItem(NumSlider)

		local Category1 = vgui.Create("DCollapsibleCategory")
		CPanel:AddItem(Category1)
		Category1:SetLabel("Offsets")
		Category1:SetExpanded(0)

		local parent = FileBrowser:GetParent():GetParent():GetParent():GetParent()
		--[[Offsets]]--
		local CategoryContent1 = vgui.Create( "DPanelList" )
		CategoryContent1:SetAutoSize( true )
		CategoryContent1:SetDrawBackground( false )
		CategoryContent1:SetSpacing( 1 )
		CategoryContent1:SetPadding( 2 )
		CategoryContent1.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end		--Fix the damned mouse not scrolling when it's over the catagories

		Category1:SetContents( CategoryContent1 )

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Height Offset" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( -2500 )
		NumSlider:SetMax( 2500 )
		NumSlider:SetDefaultValue( 0 )
		NumSlider:SetDecimals( 3 )
		NumSlider:SetConVar("advdupe2_offset_z")
		NumSlider:SetToolTip("Changes the dupe Z offset")
		CategoryContent1:AddItem(NumSlider)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Use World Angles" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_offset_world" )
		Check:SetValue( 0 )
		Check:SetToolTip("Use world angles for the offset instead of the main entity")
		CategoryContent1:AddItem(Check)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Pitch Offset" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( -180 )
		NumSlider:SetMax( 180 )
		NumSlider:SetDefaultValue( 0 )
		NumSlider:SetDecimals( 3 )
		NumSlider:SetToolTip("Changes the dupe pitch offset")
		NumSlider:SetConVar("advdupe2_offset_pitch")
		CategoryContent1:AddItem(NumSlider)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Yaw Offset" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( -180 )
		NumSlider:SetMax( 180 )
		NumSlider:SetDefaultValue( 0 )
		NumSlider:SetDecimals( 3 )
		NumSlider:SetToolTip("Changes the dupe yaw offset")
		NumSlider:SetConVar("advdupe2_offset_yaw")
		CategoryContent1:AddItem(NumSlider)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Roll Offset" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( -180 )
		NumSlider:SetMax( 180 )
		NumSlider:SetDefaultValue( 0 )
		NumSlider:SetDecimals( 3 )
		NumSlider:SetToolTip("Changes the dupe roll offset")
		NumSlider:SetConVar("advdupe2_offset_roll")
		CategoryContent1:AddItem(NumSlider)

		local Btn = vgui.Create("DButton")
		Btn:SetText("Reset")
		Btn.DoClick = function()
			RunConsoleCommand("advdupe2_offset_z", 0)
			RunConsoleCommand("advdupe2_offset_pitch", 0)
			RunConsoleCommand("advdupe2_offset_yaw", 0)
			RunConsoleCommand("advdupe2_offset_roll", 0)
		end
		CategoryContent1:AddItem(Btn)


		--[[Dupe Information]]--
		local Category2 = vgui.Create("DCollapsibleCategory")
		CPanel:AddItem(Category2)
		Category2:SetLabel("Dupe Information")
		Category2:SetExpanded(0)

		local CategoryContent2 = vgui.Create( "DPanelList" )
		CategoryContent2:SetAutoSize( true )
		CategoryContent2:SetDrawBackground( false )
		CategoryContent2:SetSpacing( 3 )
		CategoryContent2:SetPadding( 2 )
		Category2:SetContents( CategoryContent2 )
		CategoryContent2.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end

		AdvDupe2.Info = {}

		local lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.File or "File: ")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.File = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Creator or "Creator:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Creator = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Date or "Date:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Date = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Time or "Time:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Time = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Size or "Size:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Size = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Desc or "Desc:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Desc = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Entities or "Entities:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Entities = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Constraints or "Constraints:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Constraints = lbl

	--[[Contraption Spawner]]--
		local Category3 = vgui.Create("DCollapsibleCategory")
		CPanel:AddItem(Category3)
		Category3:SetLabel("Contraption Spawner")
		Category3:SetExpanded(0)

		local CategoryContent3 = vgui.Create( "DPanelList" )
		CategoryContent3:SetAutoSize( true )
		CategoryContent3:SetDrawBackground( false )
		CategoryContent3:SetSpacing( 3 )
		CategoryContent3:SetPadding( 2 )
		Category3:SetContents( CategoryContent3 )
		CategoryContent3.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end

		local ctrl = vgui.Create( "CtrlNumPad" )
		ctrl:SetConVar1( "advdupe2_contr_spawner_key" )
		ctrl:SetConVar2( "advdupe2_contr_spawner_undo_key" )
		ctrl:SetLabel1( "Spawn Key")
		ctrl:SetLabel2( "Undo Key" )
		CategoryContent3:AddItem(ctrl)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Spawn Delay" )
		NumSlider.Label:SetDark(true)
		if(game.SinglePlayer()) then
			NumSlider:SetMin( 0 )
		else
			local min = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
			if(tonumber(LocalPlayer():GetInfo("advdupe2_contr_spawner_delay"))<min) then
				RunConsoleCommand("advdupe2_contr_spawner_delay", tostring(min))
			end
			NumSlider:SetMin( min )
		end
		NumSlider:SetMax(60)
		NumSlider:SetDecimals( 1 )
		NumSlider:SetConVar("advdupe2_contr_spawner_delay")
		CategoryContent3:AddItem(NumSlider)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Undo Delay" )
		NumSlider.Label:SetDark(true)
		if(game.SinglePlayer()) then
			NumSlider:SetMin( 0 )
			NumSlider:SetMax( 60 )
		else
			local min = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay")) or 10
			local max = tonumber(GetConVarString("AdvDupe2_MaxContraptionUndoDelay")) or 60
			if(tonumber(LocalPlayer():GetInfo("advdupe2_contr_spawner_undo_delay")) < min) then
				RunConsoleCommand("advdupe2_contr_spawner_undo_delay", tostring(min))
			elseif(tonumber(LocalPlayer():GetInfo("advdupe2_contr_spawner_undo_delay")) > max) then
				RunConsoleCommand("advdupe2_contr_spawner_undo_delay", tostring(max))
			end
			NumSlider:SetMin( min )
			NumSlider:SetMax( max )
		end
		NumSlider:SetDecimals( 1 )
		NumSlider:SetConVar("advdupe2_contr_spawner_undo_delay")
		CategoryContent3:AddItem(NumSlider)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Disable gravity for all spawned props" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_contr_spawner_disgrav" )
		Check:SetValue( 0 )
		CategoryContent3:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Disable drag for all spawned props" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_contr_spawner_disdrag" )
		Check:SetValue( 0 )
		CategoryContent3:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Add spawner's velocity to contraption" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_contr_spawner_addvel" )
		Check:SetValue( 1 )
		CategoryContent3:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Disable drawing spawner props" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_contr_spawner_hideprops" )
		Check:SetValue( 0 )
		CategoryContent3:AddItem(Check)

		--[[Area Auto Save]]--
		local Category4 = vgui.Create("DCollapsibleCategory")
		CPanel:AddItem(Category4)
		Category4:SetLabel("Area Auto Save")
		Category4:SetExpanded(0)

		local CategoryContent4 = vgui.Create( "DPanelList" )
		CategoryContent4:SetAutoSize( true )
		CategoryContent4:SetDrawBackground( false )
		CategoryContent4:SetSpacing( 3 )
		CategoryContent4:SetPadding( 2 )
		Category4:SetContents( CategoryContent4 )
		CategoryContent4.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Only copy contraption" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_auto_save_contraption" )
		Check:SetValue( 0 )
		Check:SetToolTip("Only copy a contraption instead of an area")
		CategoryContent4:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Overwrite File" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_auto_save_overwrite" )
		Check:SetValue( 1 )
		Check:SetToolTip("Overwrite the file instead of creating a new one everytime")
		CategoryContent4:AddItem(Check)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Minutes to Save:" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( 2 )
		NumSlider:SetMax( 30 )
		NumSlider:SetDecimals( 0 )
		NumSlider:SetConVar( "advdupe2_auto_save_time" )
		NumSlider:SetToolTip("Interval time to save in minutes")
		CategoryContent4:AddItem(NumSlider)

		local pnl = vgui.Create("Panel")
		pnl:SetWide(CPanel:GetWide()-40)
		pnl:SetTall(75)
		pnl:SetPos(0, 50)
		CategoryContent4:AddItem(pnl)

		local label = vgui.Create("DLabel", pnl)
		label:SetText("Directory: ")
		label:SizeToContents()
		label:SetDark(true)
		label:SetPos(5,7)

		AdvDupe2.AutoSavePath = ""
		local txtbox = vgui.Create("DTextEntry", pnl)
		txtbox:SetWide(pnl:GetWide()-100)
		txtbox:SetPos(60, 5)
		txtbox:SetUpdateOnType(true)
		txtbox.OnTextChanged = function(self)
			self:SetValue(AdvDupe2.AutoSavePath)
		end

		local btn = vgui.Create("DImageButton", pnl)
		local x, y = txtbox:GetPos()
		btn:SetPos(x + txtbox:GetWide() + 5, 7)
		btn:SetMaterial("icon16/folder_explore.png")
		btn:SizeToContents()
		btn:SetToolTip("Browse")
		btn.DoClick = function()
			local ScrollBar = parent.VBar
			ScrollBar:AnimateTo(0, 1, 0, 0.2)

			FileBrowser.Submit:SetMaterial("icon16/disk.png")
			FileBrowser.Submit:SetTooltip("Directory for Area Auto Save")
			if(FileBrowser.FileName:GetValue()=="Folder_Name...") then
				FileBrowser.FileName:SetValue("File_Name...")
			end
			FileBrowser.Desc:SetVisible(true)
			FileBrowser.Info:SetVisible(false)
			FileBrowser.FileName:SetVisible(true)
			FileBrowser.FileName:SelectAllOnFocus(true)
			FileBrowser.FileName:OnMousePressed()
			FileBrowser.FileName:RequestFocus()
			FileBrowser.Expanding=true
			FileBrowser:Slide(true)
			FileBrowser.Submit.DoClick = function()
				local name = FileBrowser.FileName:GetValue()
				if(name=="" or name=="File_Name...") then
					AdvDupe2.Notify("Name field is blank.", NOTIFY_ERROR)
					FileBrowser.FileName:SelectAllOnFocus(true)
					FileBrowser.FileName:OnGetFocus()
					FileBrowser.FileName:RequestFocus()
					return
				end
				local desc = FileBrowser.Desc:GetValue()
				if(desc=="Description...") then desc="" end

				if(not IsValid(FileBrowser.Browser.pnlCanvas.m_pSelectedItem) or FileBrowser.Browser.pnlCanvas.m_pSelectedItem.Derma.ClassName~="advdupe2_browser_folder") then
					AdvDupe2.Notify("Folder to save Area Auto Save not selected.", NOTIFY_ERROR)
					return
				end

				FileBrowser.AutoSaveNode = FileBrowser.Browser.pnlCanvas.m_pSelectedItem
				txtbox:SetValue(FileBrowser:GetFullPath(FileBrowser.Browser.pnlCanvas.m_pSelectedItem)..name)
				AdvDupe2.AutoSavePath = txtbox:GetValue()
				txtbox:SetToolTip(txtbox:GetValue())
				AdvDupe2.AutoSaveDesc = desc

				FileBrowser:Slide(false)
				ScrollBar:AnimateTo(ScrollBar.CanvasSize, 1, 0, 0.2)

				RunConsoleCommand("AdvDupe2_SetStage")
				hook.Add("HUDPaint", "AdvDupe2_DrawSelectionBox", AdvDupe2.DrawSelectionBox)
			end
			FileBrowser.FileName.OnEnter = function()
				FileBrowser.FileName:KillFocus()
				FileBrowser.Desc:SelectAllOnFocus(true)
				FileBrowser.Desc.OnMousePressed()
				FileBrowser.Desc:RequestFocus()
			end
			FileBrowser.Desc.OnEnter = FileBrowser.Submit.DoClick
		end

		btn = vgui.Create("DButton", pnl)
		btn:SetSize(50, 35)
		btn:SetPos(pnl:GetWide()/4-10, 30)
		btn:SetText("Show")
		btn.DoClick = function()
			if(AdvDupe2.AutoSavePos) then
				RunConsoleCommand("advdupe2_area_copy_size", AdvDupe2.AutoSaveSize)
				LocalPlayer():SetEyeAngles( (AdvDupe2.AutoSavePos - LocalPlayer():GetShootPos()):Angle() )
				RunConsoleCommand("AdvDupe2_SetStage")
				hook.Add("HUDPaint", "AdvDupe2_DrawSelectionBox", AdvDupe2.DrawSelectionBox)
			end
		end

		btn = vgui.Create("DButton", pnl)
		btn:SetSize(50, 35)
		btn:SetPos((pnl:GetWide()/4)*3-40, 30)
		btn:SetText("Turn Off")
		btn:SetDisabled(true)
		btn.DoClick = function(self)
			RunConsoleCommand("AdvDupe2_RemoveAutoSave")
			self:SetDisabled(true)
			AdvDupe2.AutoSavePos = nil
		end
		AdvDupe2.OffButton = btn


		--[[Experimental Section]]--
		local Category5 = vgui.Create("DCollapsibleCategory")
		CPanel:AddItem(Category5)
		Category5:SetLabel("Experimental Section")
		Category5:SetExpanded(0)

		local CategoryContent5 = vgui.Create( "DPanelList" )
		CategoryContent5:SetAutoSize( true )
		CategoryContent5:SetDrawBackground( false )
		CategoryContent5:SetSpacing( 3 )
		CategoryContent5:SetPadding( 2 )
		Category5:SetContents( CategoryContent5 )
		CategoryContent5.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Disable parented props physics interaction" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_paste_disparents" )
		Check:SetValue( 0 )
		CategoryContent5:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Disable Dupe Spawn Protection" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_paste_protectoveride" )
		Check:SetValue( 1 )
		Check:SetToolTip("Check this if you things don't look right after pasting.")
		CategoryContent5:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Open file after Saving" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_debug_openfile" )
		Check:SetValue( 1 )
		Check:SetToolTip("Check this if you want your files to be opened after saving them.")
		CategoryContent5:AddItem(Check)

		--[[Save Map]]--
		if(LocalPlayer():IsAdmin()) then
			local Category6 = vgui.Create("DCollapsibleCategory")
			CPanel:AddItem(Category6)
			Category6:SetLabel("Save Map")
			Category6:SetExpanded(0)

			local CategoryContent6 = vgui.Create( "DPanelList" )
			CategoryContent6:SetAutoSize( true )
			CategoryContent6:SetDrawBackground( false )
			CategoryContent6:SetSpacing( 3 )
			CategoryContent6:SetPadding( 2 )
			Category6:SetContents( CategoryContent6 )
			CategoryContent6.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end

			pnl = vgui.Create("Panel")
			pnl:SetWide(CPanel:GetWide()-40)
			pnl:SetTall(75)
			pnl:SetPos(0, 50)
			CategoryContent6:AddItem(pnl)

			label = vgui.Create("DLabel", pnl)
			label:SetText("File Name: ")
			label:SizeToContents()
			label:SetDark(true)
			label:SetPos(5,7)

			AdvDupe2.AutoSavePath = ""

			local txtbox2 = vgui.Create("DTextEntry", pnl)
			txtbox2:SetWide(pnl:GetWide()-100)
			txtbox2:SetPos(60, 5)

			local btn2 = vgui.Create("DImageButton", pnl)
			x, y = txtbox2:GetPos()
			btn2:SetPos(x + txtbox2:GetWide() + 5, 7)
			btn2:SetMaterial("icon16/disk.png")
			btn2:SizeToContents()
			btn2:SetToolTip("Save Map")
			btn2.DoClick = 	function()
				if(txtbox2:GetValue()=="") then return end
				RunConsoleCommand("AdvDupe2_SaveMap", txtbox2:GetValue())
			end
			txtbox2.OnEnter = function()
				btn2:DoClick()
			end
		end
	end

	function TOOL.BuildCPanel(panel)
		panel:ClearControls()
		panel:AddControl("Header", {
			Text = "Advanced Duplicator 2",
			Description = "Duplicate stuff."
		})
		local function tryToBuild()
			local CPanel = controlpanel.Get("advdupe2")
			if CPanel and CPanel:GetWide()>16 then
				BuildCPanel(CPanel)
			else
				timer.Simple(0.1,tryToBuild)
			end
		end
		tryToBuild()
	end

	local StColor  = {r=130, g=25, b=40, a=255}
	local NoColor  = {r=25, g=100, b=40, a=255}
	local CurColor = {r=25, g=100, b=40, a=255}
	local CWhite   = Color(255,255,255,255)
	surface.CreateFont ("AD2Font", {font="Arial", size=40, weight=1000}) ---Remember to use gm_clearfonts
	surface.CreateFont ("AD2TitleFont", {font="Arial", size=24, weight=1000})

	function TOOL:DrawToolScreen()
		if(not AdvDupe2) then return true end

		local text = "Ready"
		local state, co = false
		local ply = LocalPlayer()

		if(AdvDupe2.Preview) then
			text = "Preview"
		end
		if(AdvDupe2.ProgressBar.Text) then
			state = true
			text = AdvDupe2.ProgressBar.Text
		end

		cam.Start2D()

			surface.SetDrawColor(32, 32, 32, 255)
			surface.DrawRect(0, 0, 256, 256)

			if(state) then
				co = StColor
			else
				co = NoColor
			end

			local rate = FrameTime() * 160
			CurColor.r = math.Approach( CurColor.r, co.r, rate )
			CurColor.g = math.Approach( CurColor.g, co.g, rate )

			surface.SetDrawColor(CurColor)
			surface.DrawRect(13, 13, 230, 230)

			surface.SetTextColor( 255, 255, 255, 255 )

			draw.SimpleText("Advanced Duplicator 2", "AD2TitleFont", 128, 50, CWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			draw.SimpleText(text, "AD2Font", 128, 128, CWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			if(state) then
				draw.RoundedBox( 6, 32, 178, 192, 28, Color( 255, 255, 255, 150 ) )
				draw.RoundedBox( 6, 34, 180, 188*(AdvDupe2.ProgressBar.Percent / 100), 24, Color( 0, 255, 0, 255 ) )
			elseif(ply:KeyDown(IN_USE)) then
				local font, align = "AD2TitleFont", TEXT_ALIGN_BOTTOM
				draw.SimpleText("H: "..ply:GetInfo("advdupe2_offset_z")    , font, 20,  210, CWhite, TEXT_ALIGN_LEFT , align)
				draw.SimpleText("P: "..ply:GetInfo("advdupe2_offset_pitch"), font, 236, 210, CWhite, TEXT_ALIGN_RIGHT, align)
				draw.SimpleText("Y: "..ply:GetInfo("advdupe2_offset_yaw")  , font, 20 , 240, CWhite, TEXT_ALIGN_LEFT , align)
				draw.SimpleText("R: "..ply:GetInfo("advdupe2_offset_roll") , font, 236, 240, CWhite, TEXT_ALIGN_RIGHT, align)
			end

		cam.End2D()
	end


	local function FindInBox(min, max, ply)
		local EntTable = {}
		for _,ent in ents.Iterator() do
			local pos = ent:GetPos()
			if (pos.X>=min.X) and (pos.X<=max.X) and (pos.Y>=min.Y) and (pos.Y<=max.Y) and (pos.Z>=min.Z) and (pos.Z<=max.Z) then
				--if(ent:GetClass()~="C_BaseFlexclass") then
					EntTable[ent:EntIndex()] = ent
				--end
			end
		end

		return EntTable
	end


	local GreenSelected = Color(0, 255, 0, 255)
	function AdvDupe2.DrawSelectionBox()

		local TraceRes = util.TraceLine(util.GetPlayerTrace(LocalPlayer()))
		local i = math.Clamp(tonumber(LocalPlayer():GetInfo("advdupe2_area_copy_size")) or 50, 0, 30720)

		--Bottom Points
		local B1 = (Vector(-i,-i,-i) + TraceRes.HitPos)
		local B2 = (Vector(-i, i,-i) + TraceRes.HitPos)
		local B3 = (Vector( i, i,-i) + TraceRes.HitPos)
		local B4 = (Vector( i,-i,-i) + TraceRes.HitPos)

		--Top Points
		local T1 = (Vector(-i,-i, i) + TraceRes.HitPos):ToScreen()
		local T2 = (Vector(-i, i, i) + TraceRes.HitPos):ToScreen()
		local T3 = (Vector( i, i, i) + TraceRes.HitPos):ToScreen()
		local T4 = (Vector( i,-i, i) + TraceRes.HitPos):ToScreen()

		if(not AdvDupe2.LastUpdate or CurTime()>=AdvDupe2.LastUpdate) then

			if AdvDupe2.ColorEntities then
				for k,v in pairs(AdvDupe2.EntityColors)do
					local ent = AdvDupe2.ColorEntities[k]
					if(IsValid(ent)) then
						AdvDupe2.ColorEntities[k]:SetColor(v)
					end
				end
			end

			local Entities = FindInBox(B1, (Vector(i,i,i)+TraceRes.HitPos), LocalPlayer())
			AdvDupe2.ColorEntities = Entities
			AdvDupe2.EntityColors = {}
			for k,v in pairs(Entities)do
				AdvDupe2.EntityColors[k] = v:GetColor()
				v:SetColor(GreenSelected)
			end
			AdvDupe2.LastUpdate = CurTime()+0.25

		end

		local tracedata = {}
		tracedata.mask = MASK_NPCWORLDSTATIC
		local WorldTrace

		tracedata.start = B1+Vector(0,0,i*2)
		tracedata.endpos = B1
		WorldTrace = util.TraceLine( tracedata )
		B1 = WorldTrace.HitPos:ToScreen()
		tracedata.start = B2+Vector(0,0,i*2)
		tracedata.endpos = B2
		WorldTrace = util.TraceLine( tracedata )
		B2 = WorldTrace.HitPos:ToScreen()
		tracedata.start = B3+Vector(0,0,i*2)
		tracedata.endpos = B3
		WorldTrace = util.TraceLine( tracedata )
		B3 = WorldTrace.HitPos:ToScreen()
		tracedata.start = B4+Vector(0,0,i*2)
		tracedata.endpos = B4
		WorldTrace = util.TraceLine( tracedata )
		B4 = WorldTrace.HitPos:ToScreen()

		surface.SetDrawColor( 0, 255, 0, 255 )

		--Draw Sides
		surface.DrawLine(B1.x, B1.y, T1.x, T1.y)
		surface.DrawLine(B2.x, B2.y, T2.x, T2.y)
		surface.DrawLine(B3.x, B3.y, T3.x, T3.y)
		surface.DrawLine(B4.x, B4.y, T4.x, T4.y)

		--Draw Bottom
		surface.DrawLine(B1.x, B1.y, B2.x, B2.y)
		surface.DrawLine(B2.x, B2.y, B3.x, B3.y)
		surface.DrawLine(B3.x, B3.y, B4.x, B4.y)
		surface.DrawLine(B4.x, B4.y, B1.x, B1.y)

		--Draw Top
		surface.DrawLine(T1.x, T1.y, T2.x, T2.y)
		surface.DrawLine(T2.x, T2.y, T3.x, T3.y)
		surface.DrawLine(T3.x, T3.y, T4.x, T4.y)
		surface.DrawLine(T4.x, T4.y, T1.x, T1.y)

	end

	net.Receive("AdvDupe2_DrawSelectBox", function()
		hook.Add("HUDPaint", "AdvDupe2_DrawSelectionBox", AdvDupe2.DrawSelectionBox)
	end)

	function AdvDupe2.RemoveSelectBox()
		hook.Remove("HUDPaint", "AdvDupe2_DrawSelectionBox")
		if AdvDupe2.ColorEntities then
			for k,v in pairs(AdvDupe2.EntityColors)do
				if(not IsValid(AdvDupe2.ColorEntities[k])) then
					AdvDupe2.ColorEntities[k]=nil
				else
					AdvDupe2.ColorEntities[k]:SetColor(v)
				end
			end
			AdvDupe2.ColorEntities={}
			AdvDupe2.EntityColors={}
		end
	end
	net.Receive("AdvDupe2_RemoveSelectBox",function()
		AdvDupe2.RemoveSelectBox()
	end)

	function AdvDupe2.InitProgressBar(label)
		AdvDupe2.ProgressBar = {}
		AdvDupe2.ProgressBar.Text = label
		AdvDupe2.ProgressBar.Percent = 0
		AdvDupe2.BusyBar = true
	end
	net.Receive("AdvDupe2_InitProgressBar", function()
		AdvDupe2.InitProgressBar(net.ReadString())
	end)

	net.Receive("AdvDupe2_UpdateProgressBar", function()
		AdvDupe2.ProgressBar.Percent = net.ReadFloat()
	end)

	function AdvDupe2.RemoveProgressBar()
		AdvDupe2.ProgressBar = {}
		AdvDupe2.BusyBar = false
		if(AdvDupe2.Ghosting) then
			AdvDupe2.InitProgressBar("Ghosting: ")
			AdvDupe2.BusyBar = false
			AdvDupe2.ProgressBar.Percent = AdvDupe2.CurrentGhost/AdvDupe2.TotalGhosts*100
		end
	end
	net.Receive("AdvDupe2_RemoveProgressBar", function()
		AdvDupe2.RemoveProgressBar()
	end)

	net.Receive("AdvDupe2_ResetOffsets", function()
		RunConsoleCommand("advdupe2_original_origin", "0")
		RunConsoleCommand("advdupe2_paste_constraints","1")
		RunConsoleCommand("advdupe2_offset_z","0")
		RunConsoleCommand("advdupe2_offset_pitch","0")
		RunConsoleCommand("advdupe2_offset_yaw","0")
		RunConsoleCommand("advdupe2_offset_roll","0")
		RunConsoleCommand("advdupe2_paste_parents","1")
		RunConsoleCommand("advdupe2_paste_disparents","0")
	end)

	net.Receive("AdvDupe2_ReportModel", function()
		print("Advanced Duplicator 2: Invalid Model: "..net.ReadString())
	end)

	net.Receive("AdvDupe2_ReportClass", function()
		print("Advanced Duplicator 2: Invalid Class: "..net.ReadString())
	end)

	net.Receive("AdvDupe2_ResetDupeInfo", function()
		if not AdvDupe2.Info then return end
		AdvDupe2.Info.File:SetText("File:")
		AdvDupe2.Info.Creator:SetText("Creator:")
		AdvDupe2.Info.Date:SetText("Date:")
		AdvDupe2.Info.Time:SetText("Time:")
		AdvDupe2.Info.Size:SetText("Size:")
		AdvDupe2.Info.Desc:SetText("Desc:")
		AdvDupe2.Info.Entities:SetText("Entities:")
		AdvDupe2.Info.Constraints:SetText("Constraints:")
	end)

	net.Receive("AdvDupe2_CanAutoSave", function()
		if(AdvDupe2.AutoSavePath~="") then
			AdvDupe2.AutoSavePos = net.ReadVector()
			AdvDupe2.AutoSaveSize = net.ReadFloat()
			local ent = net.ReadUInt(16)
			AdvDupe2.OffButton:SetDisabled(false)
			net.Start("AdvDupe2_CanAutoSave")
				net.WriteString(AdvDupe2.AutoSaveDesc)
				net.WriteInt(ent, 16)
				if(game.SinglePlayer()) then
					net.WriteString(string.sub(AdvDupe2.AutoSavePath, 10, #AdvDupe2.AutoSavePath))
				end
			net.SendToServer()
		else
			AdvDupe2.Notify("Select a directory for the Area Auto Save.", NOTIFY_ERROR)
		end
	end)

	net.Receive("AdvDupe2_SetDupeInfo", function(len, ply, len2)
		if AdvDupe2.Info then
			AdvDupe2.Info.File:SetText("File: "..net.ReadString())
			AdvDupe2.Info.Creator:SetText("Creator: "..net.ReadString())
			AdvDupe2.Info.Date:SetText("Date: "..net.ReadString())
			AdvDupe2.Info.Time:SetText("Time: "..net.ReadString())
			AdvDupe2.Info.Size:SetText("Size: "..net.ReadString())
			AdvDupe2.Info.Desc:SetText("Desc: "..net.ReadString())
			AdvDupe2.Info.Entities:SetText("Entities: "..net.ReadString())
			AdvDupe2.Info.Constraints:SetText("Constraints: "..net.ReadString())
		else
			AdvDupe2.InfoText.File = "File: "..net.ReadString()
			AdvDupe2.InfoText.Creator = "Creator: "..net.ReadString()
			AdvDupe2.InfoText.Date = "Date: "..net.ReadString()
			AdvDupe2.InfoText.Time = "Time: "..net.ReadString()
			AdvDupe2.InfoText.Size = "Size: "..net.ReadString()
			AdvDupe2.InfoText.Desc = "Desc: "..net.ReadString()
			AdvDupe2.InfoText.Entities = "Entities: "..net.ReadString()
			AdvDupe2.InfoText.Constraints = "Constraints: "..net.ReadString()
		end
	end)
end

--PATH lua/weapons/gmod_tool/stools/bricks_server_entityplacer.lua:
TOOL.Category = "Bricks Server"
TOOL.Name = "Entity Placer"
TOOL.Command = nil
TOOL.ConfigName = "" --Setting this means that you do not have to create external configuration files to define the layout of the tool config-hud 

function TOOL:LeftClick( trace )
	if( !trace.HitPos || IsValid( trace.Entity ) && trace.Entity:IsPlayer() ) then return false end
	if( CLIENT ) then return true end

	local ply = self:GetOwner()
	
	if( not BRICKS_SERVER.Func.HasAdminAccess( ply ) ) then
		BRICKS_SERVER.Func.SendNotification( ply, 1, 2, BRICKS_SERVER.Func.L( "noToolPermission" ) )
		return
	end
	
	local entClassTable = BRICKS_SERVER.DEVCONFIG.EntityTypes[ply:GetNW2String( "bricks_server_stoolcmd_entityclass" )]
	if( entClassTable ) then
		local entity = ents.Create( ply:GetNW2String( "bricks_server_stoolcmd_entityclass" ) )
		if( !IsValid( entity ) ) then
			BRICKS_SERVER.Func.SendNotification( ply, 1, 2, BRICKS_SERVER.Func.L( "invalidEntityType" ) )
			return
		end
		entity:SetPos( trace.HitPos )
		if( entClassTable.AngleToSurface == true ) then
			entity:SetAngles( trace.HitNormal:Angle() )
		elseif( entClassTable.AngleToPlayer == true ) then
			entity:SetAngles( Angle( entity:GetAngles().p, ply:GetAngles().y+180, entity:GetAngles().r ) )
		end
		entity:Spawn()
		
		BRICKS_SERVER.Func.SendNotification( ply, 1, 2, BRICKS_SERVER.Func.L( "entityPlaced" ) )
		ply:ConCommand( "bricks_server_saveentpositions" )
	else
		BRICKS_SERVER.Func.SendNotification( ply, 1, 2, BRICKS_SERVER.Func.L( "invalidEntityType" ) )
	end
end

function TOOL:RightClick( trace )
	if( !trace.HitPos ) then return false end
	if( !IsValid( trace.Entity ) or trace.Entity:IsPlayer() ) then return false end
	if( CLIENT ) then return true end

	local ply = self:GetOwner()
	
	if( not BRICKS_SERVER.Func.HasAdminAccess( ply ) ) then
		BRICKS_SERVER.Func.SendNotification( ply, 1, 2, BRICKS_SERVER.Func.L( "noToolPermission" ) )
		return
	end
	
	if( BRICKS_SERVER.DEVCONFIG.EntityTypes[trace.Entity:GetClass()] ) then
		trace.Entity:Remove()
		BRICKS_SERVER.Func.SendNotification( ply, 1, 2, BRICKS_SERVER.Func.L( "entityRemoved" ) )
		ply:ConCommand( "bricks_server_saveentpositions" )
	else
		BRICKS_SERVER.Func.SendNotification( ply, 1, 2, BRICKS_SERVER.Func.L( "canOnlyUseToolEntity" ) )
		return false
	end
end

function TOOL:DrawToolScreen( width, height )
	if( not BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then return end

	surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
	surface.DrawRect( 0, 0, width, height )

	surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 0 ) )
	surface.DrawRect( 0, 0, width, 60 )
	
	draw.SimpleText( language.GetPhrase( "tool.bricks_server_entityplacer.name" ), "BRICKS_SERVER_Font33", width/2, 30, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	local entitySelected = BRICKS_SERVER.DEVCONFIG.EntityTypes[LocalPlayer():GetNW2String( "bricks_server_stoolcmd_entityclass", "" )]
	draw.SimpleText( BRICKS_SERVER.Func.L( "selected" ), "BRICKS_SERVER_Font33", width/2, 60+((height-60)/2)-15, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
	draw.SimpleText( ((entitySelected and (entitySelected.PrintName or BRICKS_SERVER.Func.L( "error" ))) or BRICKS_SERVER.Func.L( "none" )), "BRICKS_SERVER_Font25", width/2, 60+((height-60)/2)-15, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
end

function TOOL.BuildCPanel( panel )
	panel:AddControl("Header", { Text = BRICKS_SERVER.Func.L( "entityType" ), Description = BRICKS_SERVER.Func.L( "entityPlacerDescription" ) })
 
	local combo = panel:AddControl( "ComboBox", { Label = BRICKS_SERVER.Func.L( "entityType" ) } )
	for k, v in pairs( BRICKS_SERVER.DEVCONFIG.EntityTypes ) do
		if( not istable( v ) or not v.Placeable ) then continue end

		combo:AddOption( (v.PrintName or k), { k } )
	end
	function combo:OnSelect( index, text, data )
		net.Start( "BRS.Net.ToolEntityPlacer" )
			net.WriteString( data[1] )
		net.SendToServer()
	end
end

if( CLIENT ) then
	language.Add( "tool.bricks_server_entityplacer.name", BRICKS_SERVER.Func.L( "entityPlacer" ) )
	language.Add( "tool.bricks_server_entityplacer.desc", BRICKS_SERVER.Func.L( "entityPlacerDescriptionSmall" ) )
	language.Add( "tool.bricks_server_entityplacer.0", BRICKS_SERVER.Func.L( "entityPlacerInstructions" ) )
elseif( SERVER ) then
	util.AddNetworkString( "BRS.Net.ToolEntityPlacer" )
	net.Receive( "BRS.Net.ToolEntityPlacer", function( len, ply )
		if( not BRICKS_SERVER.Func.HasAdminAccess( ply ) ) then return end

		ply:SetNW2String( "bricks_server_stoolcmd_entityclass", net.ReadString() )
	end )
end
--PATH lua/weapons/gmod_tool/stools/catmullrom_camera_looker.lua:
TOOL.Category   = "Behavior Modifiers"
TOOL.Name       = "Smart Look"
TOOL.Command    = nil
TOOL.ConfigName	= nil
TOOL.Tab        = "CRCCams"


TOOL.ClientConVar["block"]   = tostring(MASK_OPAQUE)
TOOL.ClientConVar["target"]  = "1"
TOOL.ClientConVar["range"]   = "512"
TOOL.ClientConVar["percent"] = "1"
TOOL.ClientConVar["closest"] = "0"

function TOOL:LeftClick(trace)
	return CatmullRomCams.SToolMethods.SmartLook.LeftClick(self, trace)
end

function TOOL:RightClick(trace)
	return CatmullRomCams.SToolMethods.SmartLook.RightClick(self, trace)
end

function TOOL:Reload(trace)
	return CatmullRomCams.SToolMethods.SmartLook.Reload(self, trace)
end

function TOOL:Think()
	return CatmullRomCams.SToolMethods.SmartLook.Think(self)
end

function TOOL:ValidTrace(trace)
	return CatmullRomCams.SToolMethods.ValidTrace(trace)
end

function TOOL.BuildCPanel(panel)
	return CatmullRomCams.SToolMethods.SmartLook.BuildCPanel(panel)
end


--PATH lua/weapons/gmod_tool/stools/drgbase_tool_info.lua:
TOOL.Tab = "DrGBase"
TOOL.Category = "Tools"
TOOL.Name = "#tool.drgbase_tool_info.name"
TOOL.BuildCPanel = function(panel)
	panel:Help("#tool.drgbase_tool_info.desc")
	panel:Help("#tool.drgbase_tool_info.0")
end

local PAGE_NAMES = {
	"Status", "AI",
	"Possession", "Movement",
	"Animation", "Viewcam"
}

function TOOL:LeftClick(tr)
	if not IsValid(tr.Entity) then return false end
	if not tr.Entity.IsDrGNextbot then return false end
	if CLIENT then return true end
	local owner = self:GetOwner()
	owner:SetNW2Int("DrGBaseNextbotInfoToolPage", 1)
	owner:DrG_SingleEntitySelect(tr.Entity)
	return true
end
function TOOL:RightClick()
	if CLIENT then return false end
	local owner = self:GetOwner()
	if IsValid(owner:DrG_GetSelectedEntities()[1]) then
		local page = owner:GetNW2Int("DrGBaseNextbotInfoToolPage")
		if page < #PAGE_NAMES then
			owner:SetNW2Int("DrGBaseNextbotInfoToolPage", page+1)
		else owner:SetNW2Int("DrGBaseNextbotInfoToolPage", 1) end
		owner:SendLua('surface.PlaySound("buttons/lightswitch2.wav")')
	else owner:SendLua('surface.PlaySound("buttons/button10.wav")') end
	return false
end
function TOOL:Reload(tr)
	if CLIENT then return true end
	self:GetOwner():DrG_ClearSelectedEntities()
	return true
end

if CLIENT then
	DrGBase.INFO_TOOL = {}
	DrGBase.INFO_TOOL.Viewcam = nil
	DrGBase.INFO_TOOL.RT = GetRenderTarget("DrGBaseInfoToolRT", 256, 256, false)
	DrGBase.INFO_TOOL.Mat = CreateMaterial("DrGBaseInfoToolMaterial", "GMODScreenspace", {
		["$basetexture"] = DrGBase.INFO_TOOL.RT,
		["$basetexturetransform"] = "center .5 .5 scale -1 -1 rotate 0 translate 0 0",
		["$texturealpha"] = 0,
		["$vertexalpha"] = 1,
	})
end
function TOOL:DrawToolScreen(width, height)
	surface.SetDrawColor(DrGBase.CLR_DARKGRAY)
	surface.DrawRect(0, 0, width, height)
	local owner = self:GetOwner()
	local selected = owner:DrG_GetSelectedEntities()[1]
	if IsValid(selected) then
		local page = owner:GetNW2Int("DrGBaseNextbotInfoToolPage")
		local pageName = PAGE_NAMES[page] or "Invalid"
		if pageName == "Status" then
			draw.SimpleText("Health:", "DermaLarge", 10, 10, DrGBase.CLR_LIGHTGRAY)
			draw.SimpleText(selected:Health().." / "..selected:GetMaxHealth(), "DermaLarge", 10, 50, util.DrG_MergeColors(selected:Health()/selected:GetMaxHealth(), DrGBase.CLR_GREEN, DrGBase.CLR_RED))
			draw.SimpleText("Regen: "..tostring(selected:GetHealthRegen()), "DermaLarge", 10, 90, DrGBase.CLR_LIGHTGRAY)
			draw.SimpleText("Godmode: "..(selected:GetGodMode() and "Enabled" or "Disabled"), "DermaLarge", 10, 130, DrGBase.CLR_LIGHTGRAY)
			draw.SimpleText("Status:", "DermaLarge", 10, 170, DrGBase.CLR_LIGHTGRAY)
			if selected:IsDead() then
				draw.SimpleText("Dead", "DermaLarge", 100, 170, DrGBase.CLR_RED)
			elseif selected:IsDown() then
				draw.SimpleText("Down", "DermaLarge", 100, 170, DrGBase.CLR_ORANGE)
			else draw.SimpleText("Alive", "DermaLarge", 100, 170, DrGBase.CLR_GREEN) end
		elseif pageName == "AI" then
			draw.SimpleText("Enemy:", "DermaLarge", 10, 10, DrGBase.CLR_LIGHTGRAY)
			if selected:HasEnemy() then
				local enemy = selected:GetEnemy()
				if enemy:IsPlayer() then
					draw.SimpleText(enemy:GetName(), "DermaLarge", 10, 50, DrGBase.CLR_RED)
				else draw.SimpleText("#"..enemy:GetClass(), "DermaLarge", 10, 50, DrGBase.CLR_RED) end
			else draw.SimpleText("None", "DermaLarge", 10, 50, DrGBase.CLR_RED) end
			draw.SimpleText("Relationship:", "DermaLarge", 10, 130, DrGBase.CLR_LIGHTGRAY)
			draw.SimpleText("Spotted: "..(selected:HasSpottedLocalPlayer() and "True" or "False"), "DermaLarge", 10, 170, DrGBase.CLR_LIGHTGRAY)
			local disp = selected:LocalPlayerRelationship()
			if disp == D_LI then
				draw.SimpleText("Like", "DermaLarge", 170, 130, DrGBase.CLR_GREEN)
			elseif disp == D_HT then
				draw.SimpleText("Hate", "DermaLarge", 170, 130, DrGBase.CLR_RED)
			elseif disp == D_FR then
				draw.SimpleText("Afraid", "DermaLarge", 170, 130, DrGBase.CLR_PURPLE)
			elseif disp == D_NU then
				draw.SimpleText("Neutral", "DermaLarge", 165, 130, DrGBase.CLR_CYAN)
			elseif disp == D_ER then
				draw.SimpleText("Error", "DermaLarge", 170, 130, DrGBase.CLR_ORANGE)
			end
			draw.SimpleText("Omniscient: "..(selected:IsOmniscient() and "True" or "False"), "DermaLarge", 10, 90, DrGBase.CLR_LIGHTGRAY)
		elseif pageName == "Possession" then
			if selected:IsPossessed() then
				draw.SimpleText("Possessed by:", "DermaLarge", 10, 10, DrGBase.CLR_LIGHTGRAY)
				draw.SimpleText(selected:GetPossessor():GetName(), "DermaLarge", 10, 50, DrGBase.CLR_CYAN)
				draw.SimpleText("Locked on:", "DermaLarge", 10, 90, DrGBase.CLR_LIGHTGRAY)
				local lockedOn = selected:PossessionGetLockedOn()
				if IsValid(lockedOn) then
					if lockedOn:IsPlayer() then
						draw.SimpleText(lockedOn:GetName(), "DermaLarge", 10, 130, DrGBase.CLR_ORANGE)
					else draw.SimpleText("#"..lockedOn:GetClass(), "DermaLarge", 10, 130, DrGBase.CLR_ORANGE) end
				else draw.SimpleText("None", "DermaLarge", 10, 130, DrGBase.CLR_ORANGE) end
			else
				draw.SimpleText("This nextbot", "DermaLarge", width/2, height/2-40, DrGBase.CLR_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText("isn't possessed", "DermaLarge", width/2, height/2, DrGBase.CLR_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		elseif pageName == "Movement" then
			draw.SimpleText("Speed: "..tostring(math.Round(selected:Speed(true), 2)), "DermaLarge", 10, 10, DrGBase.CLR_LIGHTGRAY)
			draw.SimpleText("Scale: "..tostring(math.Round(selected:GetScale(), 2)), "DermaLarge", 10, 50, DrGBase.CLR_LIGHTGRAY)
			draw.SimpleText("Movement:", "DermaLarge", 10, 130, DrGBase.CLR_LIGHTGRAY)
			draw.SimpleText(selected:GetMovement():DrG_ToString(2), "DermaLarge", 10, 170, DrGBase.CLR_CYAN)
		elseif pageName == "Animation" then
			if selected.IsDrGNextbotSprite then
				draw.SimpleText("Animation:", "DermaLarge", 10, 10, DrGBase.CLR_LIGHTGRAY)
				draw.SimpleText(selected:GetSpriteAnim(), "DermaLarge", 10, 50, DrGBase.CLR_CYAN)
				draw.SimpleText("Frame: "..tostring(selected:GetSpriteFrame()), "DermaLarge", 10, 90, DrGBase.CLR_LIGHTGRAY)
			else
				draw.SimpleText("Sequence:", "DermaLarge", 10, 10, DrGBase.CLR_LIGHTGRAY)
				draw.SimpleText(selected:GetSequenceName(selected:GetSequence()), "DermaLarge", 10, 50, DrGBase.CLR_CYAN)
				draw.SimpleText("Activity:", "DermaLarge", 10, 90, DrGBase.CLR_LIGHTGRAY)
				draw.SimpleText(selected:GetSequenceActivityName(selected:GetSequence()), "DermaLarge", 10, 130, DrGBase.CLR_CYAN)
			end
			draw.SimpleText("Attacking? "..(selected:IsAttack(selected:GetSequence()) and "True" or "False"), "DermaLarge", 10, 170, DrGBase.CLR_LIGHTGRAY)
		elseif pageName == "Viewcam" then
			local legs = owner.ShouldDisableLegs
			owner.ShouldDisableLegs = true
			local pos = selected:GetPos()
			local eyepos = selected:EyePos()
			render.PushRenderTarget(DrGBase.INFO_TOOL.RT)
			DrGBase.INFO_TOOL.Viewcam = true
			render.RenderView({
				x = 0, y = 0, w = 256, h = 256,
				origin = Vector(pos.x, pos.y, eyepos.z),
				angles = selected:EyeAngles(),
				dopostprocess = false,
				drawviewmodel = false,
				drawmonitors = true
			})
			DrGBase.INFO_TOOL.Viewcam = nil
			render.PopRenderTarget()
			owner.ShouldDisableLegs = legs
			DrGBase.INFO_TOOL.Mat:SetTexture("$basetexture", DrGBase.INFO_TOOL.RT)
			surface.SetMaterial(DrGBase.INFO_TOOL.Mat)
			surface.DrawTexturedRect(0, 0, width, height)
		end
		draw.SimpleText("("..tostring(page).. ")", "DermaLarge", 10, height-10, DrGBase.CLR_LIGHTGRAY, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
		if page == 2 and selected:IsAIDisabled() then
			draw.SimpleText(PAGE_NAMES[page], "DermaLarge", width/2, height-10, DrGBase.CLR_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
		else draw.SimpleText(PAGE_NAMES[page], "DermaLarge", width/2, height-10, DrGBase.CLR_LIGHTGRAY, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM) end
		draw.SimpleText(">>", "DermaLarge", width-10, height-10, DrGBase.CLR_LIGHTGRAY, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)
	else
		draw.SimpleText("No nextbot", "DermaLarge", width/2, height/2-20, DrGBase.CLR_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText("selected", "DermaLarge", width/2, height/2+20, DrGBase.CLR_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

if CLIENT then
	language.Add("tool.drgbase_tool_info.name", "Nextbot Info")
	language.Add("tool.drgbase_tool_info.desc", "View information about the nextbot.")
	language.Add("tool.drgbase_tool_info.0", "Left click to select/deselect a nextbot.")

	hook.Add("PreDrawHalos", "DrGBaseToolNextbotInfoHalos", function()
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()
		if not IsValid(wep) or wep:GetClass() ~= "gmod_tool" then return end
		local tool = ply:GetTool()
		if tool == nil or tool.Mode ~= "drgbase_tool_info" then return end
		local selected = ply:DrG_GetSelectedEntities()[1]
		if not IsValid(selected) then return end
		local page = ply:GetNW2Int("DrGBaseNextbotInfoToolPage")
		local pageName = PAGE_NAMES[page] or "Invalid"
		if pageName == "Status" then
			halo.Add({selected}, util.DrG_MergeColors(selected:Health()/selected:GetMaxHealth(), DrGBase.CLR_GREEN, DrGBase.CLR_RED), nil, nil, nil, nil, true)
		elseif pageName == "AI" then
			local color = DrGBase.CLR_ORANGE
			local disp = selected:LocalPlayerRelationship()
			if disp == D_LI then
				color = DrGBase.CLR_GREEN
			elseif disp == D_HT then
				color = DrGBase.CLR_RED
			elseif disp == D_FR then
				color = DrGBase.CLR_PURPLE
			elseif disp == D_NU then
				color = DrGBase.CLR_CYAN
			end
			halo.Add({selected}, color, nil, nil, nil, nil, true)
		elseif pageName == "Possession" then
			if selected:IsPossessed() then
				halo.Add({selected}, DrGBase.CLR_GREEN, nil, nil, nil, nil, true)
			else halo.Add({selected}, DrGBase.CLR_RED, nil, nil, nil, nil, true) end
		elseif not DrGBase.INFO_TOOL.Viewcam then
			halo.Add({selected}, DrGBase.CLR_CYAN, nil, nil, nil, nil, true)
		end
	end)

	hook.Add("ShouldDrawLocalPlayer", "DrGBaseNextbotInfoToolDrawPlayer", function(ply)
		local weapon = ply:GetActiveWeapon()
		if not IsValid(weapon) or weapon:GetClass() ~= "gmod_tool" then return end
		local tool = ply:GetTool()
		if tool == nil or tool.Mode ~= "drgbase_tool_info" then return end
		local selected = ply:DrG_GetSelectedEntities()[1]
		if not IsValid(selected) then return end
		local page = ply:GetNW2Int("DrGBaseNextbotInfoToolPage")
		local pageName = PAGE_NAMES[page] or "Invalid"
		if pageName ~= "Viewcam" then return end
		cam.Start3D() cam.End3D()
		return DrGBase.INFO_TOOL.Viewcam
	end)
end

--PATH gamemodes/mangarp/entities/weapons/lockpick/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Slot = 5
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

-- Variables that are used on both client and server

SWEP.PrintName = "Lock Pick"
SWEP.Author = "DarkRP Developers"
SWEP.Instructions = "Left or right click to pick a lock"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IsDarkRPLockpick = true

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.ViewModel = Model("models/weapons/c_crowbar.mdl")
SWEP.WorldModel = Model("models/weapons/w_crowbar.mdl")

SWEP.UseHands = true

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "DarkRP (Utility)"

SWEP.Sound = Sound("physics/wood/wood_box_impact_hard3.wav")

SWEP.Primary.ClipSize = -1      -- Size of a clip
SWEP.Primary.DefaultClip = 0        -- Default number of bullets in a clip
SWEP.Primary.Automatic = false      -- Automatic/Semi Auto
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1        -- Size of a clip
SWEP.Secondary.DefaultClip = -1     -- Default number of bullets in a clip
SWEP.Secondary.Automatic = false        -- Automatic/Semi Auto
SWEP.Secondary.Ammo = ""

function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "IsLockpicking")
    self:NetworkVar("Float", 0, "LockpickStartTime")
    self:NetworkVar("Float", 1, "LockpickEndTime")
    self:NetworkVar("Float", 2, "NextSoundTime")
    self:NetworkVar("Int", 0, "TotalLockpicks")
    self:NetworkVar("Entity", 0, "LockpickEnt")
end

function SWEP:Initialize()
    self:SetHoldType("normal")
end

function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire(CurTime() + 0.5)
    if self:GetIsLockpicking() then return end

    local Owner = self:GetOwner()

    if not IsValid(Owner) then return end

    Owner:LagCompensation(true)
    local trace = Owner:GetEyeTrace()
    Owner:LagCompensation(false)
    local ent = trace.Entity

    if not IsValid(ent) or ent.DarkRPCanLockpick == false then return end
    local canLockpick = hook.Call("canLockpick", nil, Owner, ent, trace)

    if canLockpick == false then return end
    if canLockpick ~= true and (
            trace.HitPos:DistToSqr(Owner:GetShootPos()) > 10000 or
            (not GAMEMODE.Config.canforcedooropen and ent:getKeysNonOwnable()) or
            (not ent:isDoor() and not ent:IsVehicle() and not string.find(string.lower(ent:GetClass()), "vehicle") and (not GAMEMODE.Config.lockpickfading or not ent.isFadingDoor))
        ) then
        return
    end

    self:SetHoldType("pistol")

    self:SetIsLockpicking(true)
    self:SetLockpickEnt(ent)
    self:SetLockpickStartTime(CurTime())
    local endDelta = hook.Call("lockpickTime", nil, Owner, ent) or util.SharedRandom("DarkRP_Lockpick" .. self:EntIndex() .. "_" .. self:GetTotalLockpicks(), 10, 30)
    self:SetLockpickEndTime(CurTime() + endDelta)
    self:SetTotalLockpicks(self:GetTotalLockpicks() + 1)


    if IsFirstTimePredicted() then
        hook.Call("lockpickStarted", nil, Owner, ent, trace)
    end

    if CLIENT then
        self.Dots = ""
        self.NextDotsTime = SysTime() + 0.5
        return
    end

    local onFail = function(ply) if ply == Owner then hook.Call("onLockpickCompleted", nil, ply, false, ent) end end

    -- Lockpick fails when dying or disconnecting
    hook.Add("PlayerDeath", self, fc{onFail, fn.Flip(fn.Const)})
    hook.Add("PlayerDisconnected", self, fc{onFail, fn.Flip(fn.Const)})
    -- Remove hooks when finished
    hook.Add("onLockpickCompleted", self, fc{fp{hook.Remove, "PlayerDisconnected", self}, fp{hook.Remove, "PlayerDeath", self}})
end

function SWEP:Holster()
    if self:GetIsLockpicking() and self:GetLockpickEndTime() ~= 0 then
        self:Fail()
    end
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
end

function SWEP:Fail()
    self:SetIsLockpicking(false)
    self:SetHoldType("normal")

    hook.Call("onLockpickCompleted", nil, self:GetOwner(), false, self:GetLockpickEnt())
    self:SetLockpickEnt(nil)
end

local colorBackground = Color(10, 10, 10, 120)
local dots = {
    [0] = ".",
    [1] = "..",
    [2] = "...",
    [3] = ""
}
function SWEP:Think()
    if not self:GetIsLockpicking() or self:GetLockpickEndTime() == 0 then return end

    if CurTime() >= self:GetNextSoundTime() then
        self:SetNextSoundTime(CurTime() + 1)
        local snd = {1,3,4}
        self:EmitSound("weapons/357/357_reload" .. tostring(snd[math.Round(util.SharedRandom("DarkRP_LockpickSnd" .. CurTime(), 1, #snd))]) .. ".wav", 50, 100)
    end
    if CLIENT and (not self.NextDotsTime or SysTime() >= self.NextDotsTime) then
        self.NextDotsTime = SysTime() + 0.5
        self.Dots = self.Dots or ""
        local len = string.len(self.Dots)

        self.Dots = dots[len]
    end

    local trace = self:GetOwner():GetEyeTrace()
    if not IsValid(trace.Entity) or trace.Entity ~= self:GetLockpickEnt() or trace.HitPos:DistToSqr(self:GetOwner():GetShootPos()) > 10000 then
        self:Fail()
    elseif self:GetLockpickEndTime() <= CurTime() then
        self:Succeed()
    end
end

function SWEP:DrawHUD()
    if not self:GetIsLockpicking() or self:GetLockpickEndTime() == 0 then return end

    self.Dots = self.Dots or ""
    local w = ScrW()
    local h = ScrH()
    local x, y, width, height = w / 2 - w / 10, h / 2 - 60, w / 5, h / 15
    draw.RoundedBox(8, x, y, width, height, colorBackground)

    local time = self:GetLockpickEndTime() - self:GetLockpickStartTime()
    local curtime = CurTime() - self:GetLockpickStartTime()
    local status = math.Clamp(curtime / time, 0, 1)
    local BarWidth = status * (width - 16)
    local cornerRadius = math.Min(8, BarWidth / 3 * 2 - BarWidth / 3 * 2 % 2)
    draw.RoundedBox(cornerRadius, x + 8, y + 8, BarWidth, height - 16, Color(255 - (status * 255), 0 + (status * 255), 0, 255))

    draw.DrawNonParsedSimpleText(DarkRP.getPhrase("picking_lock") .. self.Dots, "Trebuchet24", w / 2, y + height / 2, color_white, 1, 1)
end

function SWEP:SecondaryAttack()
    self:PrimaryAttack()
end


DarkRP.hookStub{
    name = "canLockpick",
    description = "Whether an entity can be lockpicked.",
    parameters = {
        {
            name = "ply",
            description = "The player attempting to lockpick an entity.",
            type = "Player"
        },
        {
            name = "ent",
            description = "The entity being lockpicked.",
            type = "Entity"
        },
        {
            name = "trace",
            description = "The trace result.",
            type = "table"
        }
    },
    returns = {
        {
            name = "allowed",
            description = "Whether the entity can be lockpicked",
            type = "boolean"
        }
    },
    realm = "Shared"
}

DarkRP.hookStub{
    name = "lockpickStarted",
    description = "Called when a player is about to pick a lock.",
    parameters = {
        {
            name = "ply",
            description = "The player that is about to pick a lock.",
            type = "Player"
        },
        {
            name = "ent",
            description = "The entity being lockpicked.",
            type = "Entity"
        },
        {
            name = "trace",
            description = "The trace result.",
            type = "table"
        }
    },
    returns = {},
    realm = "Shared"
}

DarkRP.hookStub{
    name = "onLockpickCompleted",
    description = "Result of a player attempting to lockpick an entity.",
    parameters = {
        {
            name = "ply",
            description = "The player attempting to lockpick the entity.",
            type = "Player"
        },
        {
            name = "success",
            description = "Whether the player succeeded in lockpicking the entity.",
            type = "boolean"
        },
        {
            name = "ent",
            description = "The entity that was lockpicked.",
            type = "Entity"
        },
    },
    returns = {
        {
            name = "override",
            description = "Return true to override default behaviour, which is opening the (fading) door.",
            type = "boolean"
        }
    },
    realm = "Shared"
}

DarkRP.hookStub{
    name = "lockpickTime",
    description = "The length of time, in seconds, it takes to lockpick an entity.",
    parameters = {
        {
            name = "ply",
            description = "The player attempting to lockpick an entity.",
            type = "Player"
        },
        {
            name = "ent",
            description = "The entity being lockpicked.",
            type = "Entity"
        },
    },
    returns = {
        {
            name = "time",
            description = "Seconds in which it takes a player to lockpick an entity",
            type = "number"
        }
    },
    realm = "Shared"
}

--PATH addons/sl_main_system/lua/weapons/mad_baton11/shared.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

SWEP.PrintName 		      = "11 : Baton flamboyant" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton8.mdl"
SWEP.ShowWorldModel         = true
SWEP.AutoSwitchTo 	      = false 
SWEP.AutoSwitchFrom       = true 
SWEP.DrawAmmo             = false 
SWEP.Base                 = "mad_baton" 
SWEP.Slot 			      = 0
SWEP.SlotPos              = 0
SWEP.DrawCrosshair        = true 
SWEP.Weight               = 0 

SWEP.Category             = "[Baton NW]"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "None"

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"

--------------------------------------------------------------------------
SWEP.TypeArme = "magie"
SWEP.holdtype = "sl_mage_ht_mad"
SWEP.BonusDegats = 90

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_baton17/shared.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

SWEP.PrintName 		      = "17 : Baton Floral" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton20.mdl"
SWEP.ShowWorldModel         = true
SWEP.AutoSwitchTo 	      = false 
SWEP.AutoSwitchFrom       = true 
SWEP.DrawAmmo             = false 
SWEP.Base                 = "mad_baton" 
SWEP.Slot 			      = 0
SWEP.SlotPos              = 0
SWEP.DrawCrosshair        = true 
SWEP.Weight               = 0 

SWEP.Category             = "[Baton NW]"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "None"

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"

--------------------------------------------------------------------------
SWEP.TypeArme = "magie"
SWEP.holdtype = "sl_mage_ht_mad"
SWEP.BonusDegats = 138

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_baton4/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/sl_main_system/lua/weapons/mad_baton6/shared.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

SWEP.PrintName 		      = "6 : Baton geler" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton11.mdl"
SWEP.ShowWorldModel         = true
SWEP.AutoSwitchTo 	      = false 
SWEP.AutoSwitchFrom       = true 
SWEP.DrawAmmo             = false 
SWEP.Base                 = "mad_baton" 
SWEP.Slot 			      = 0
SWEP.SlotPos              = 0
SWEP.DrawCrosshair        = true 
SWEP.Weight               = 0 

SWEP.Category             = "[Baton NW]"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "None"

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"

--------------------------------------------------------------------------
SWEP.TypeArme = "magie"
SWEP.holdtype = "sl_mage_ht_mad"
SWEP.BonusDegats = 50

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_baton7/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/sl_main_system/lua/weapons/mad_baton7/shared.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

SWEP.PrintName 		      = "7 : Baton en or" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton13.mdl"
SWEP.ShowWorldModel         = true
SWEP.AutoSwitchTo 	      = false 
SWEP.AutoSwitchFrom       = true 
SWEP.DrawAmmo             = false 
SWEP.Base                 = "mad_baton" 
SWEP.Slot 			      = 0
SWEP.SlotPos              = 0
SWEP.DrawCrosshair        = true 
SWEP.Weight               = 0 

SWEP.Category             = "[Baton NW]"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "None"

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"

--------------------------------------------------------------------------
SWEP.TypeArme = "magie"
SWEP.holdtype = "sl_mage_ht_mad"
SWEP.BonusDegats = 58

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_baton8/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/sl_main_system/lua/weapons/mad_dague19/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/sl_main_system/lua/weapons/mad_dague22/shared.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

SWEP.PrintName 		      = "22 : Dague Draconique" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague28.mdl"
SWEP.ShowWorldModel         = true
SWEP.AutoSwitchTo 	      = false 
SWEP.AutoSwitchFrom       = true 
SWEP.DrawAmmo             = false 
SWEP.Base                 = "mad_dague" 
SWEP.Slot 			      = 0
SWEP.SlotPos              = 0
SWEP.DrawCrosshair        = true 
SWEP.Weight               = 0 

SWEP.Category             = "[Dague NW]"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "None"

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"

--------------------------------------------------------------------------
SWEP.TypeArme = "dague"
SWEP.holdtype = "sl_dague_ht_mad"
SWEP.BonusDegats = 178

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague3/shared.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

SWEP.PrintName 		      = "3 : Dague en fer précieux" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague30.mdl"
SWEP.ShowWorldModel         = true
SWEP.AutoSwitchTo 	      = false 
SWEP.AutoSwitchFrom       = true 
SWEP.DrawAmmo             = false 
SWEP.Base                 = "mad_dague" 
SWEP.Slot 			      = 0
SWEP.SlotPos              = 0
SWEP.DrawCrosshair        = true 
SWEP.Weight               = 0 

SWEP.Category             = "[Dague NW]"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "None"

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"

--------------------------------------------------------------------------
SWEP.TypeArme = "dague"
SWEP.holdtype = "sl_dague_ht_mad"
SWEP.BonusDegats = 26

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague5/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/sl_main_system/lua/weapons/mad_epee12/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/sl_main_system/lua/weapons/mad_epee14/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/sl_main_system/lua/weapons/mad_epee17/shared.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

SWEP.PrintName 		      = "17 : Épée Démoniaque" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword11.mdl"
SWEP.ShowWorldModel         = true
SWEP.AutoSwitchTo 	      = false 
SWEP.AutoSwitchFrom       = true 
SWEP.DrawAmmo             = false 
SWEP.Base                 = "mad_epee" 
SWEP.Slot 			      = 0
SWEP.SlotPos              = 0
SWEP.DrawCrosshair        = true 
SWEP.Weight               = 0 

SWEP.Category             = "[Epee NW]"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "None"

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"

--------------------------------------------------------------------------
SWEP.TypeArme = "sword"
SWEP.holdtype = "sl_epee_ht_mad"
SWEP.BonusDegats = 146

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee18/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/sl_main_system/lua/weapons/mad_marteau/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/sl_main_system/lua/weapons/mad_marteau10/shared.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

SWEP.PrintName 		      = "10 : Hache épuré" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/axe5.mdl"
SWEP.ShowWorldModel         = true
SWEP.AutoSwitchTo 	      = false 
SWEP.AutoSwitchFrom       = true 
SWEP.DrawAmmo             = false 
SWEP.Base                 = "mad_marteau" 
SWEP.Slot 			      = 0
SWEP.SlotPos              = 0
SWEP.DrawCrosshair        = true 
SWEP.Weight               = 0 

SWEP.Category             = "[Hache NW]"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "None"

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"

--------------------------------------------------------------------------
SWEP.TypeArme = "marteau"
SWEP.holdtype = "sl_marteau_ht_mad"
SWEP.BonusDegats = 82

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_marteau11/shared.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

SWEP.PrintName 		      = "11 : Hache en or épuré" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/axe6.mdl"
SWEP.ShowWorldModel         = true
SWEP.AutoSwitchTo 	      = false 
SWEP.AutoSwitchFrom       = true 
SWEP.DrawAmmo             = false 
SWEP.Base                 = "mad_marteau" 
SWEP.Slot 			      = 0
SWEP.SlotPos              = 0
SWEP.DrawCrosshair        = true 
SWEP.Weight               = 0 

SWEP.Category             = "[Hache NW]"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "None"

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"

--------------------------------------------------------------------------
SWEP.TypeArme = "marteau"
SWEP.holdtype = "sl_marteau_ht_mad"
SWEP.BonusDegats = 90

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_marteau13/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/sl_main_system/lua/weapons/mad_marteau21/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/sl_main_system/lua/weapons/mad_marteau6/cl_init.lua:
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

--[[

                888b     d888        d8888 8888888b.  
                8888b   d8888       d88888 888  "Y88b 
                88888b.d88888      d88P888 888    888 
                888Y88888P888     d88P 888 888    888 
                888 Y888P 888    d88P  888 888    888 
                888  Y8P  888   d88P   888 888    888 
                888   "   888  d8888888888 888  .d88P 
                888       888 d88P     888 8888888P"  
    
                Addon réalisé par Mad (alias retard.fr).
                => Discord : madbrigs

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

include("shared.lua")
AddCSLuaFile()

function SWEP:DrawHUD()

end
--PATH addons/realistichandcuffs/lua/weapons/tbfy_surrendered/shared.lua:
if SERVER then
	AddCSLuaFile("shared.lua")
end

if CLIENT then
	SWEP.PrintName = "Surrender"
	SWEP.Slot = 2
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Author = "ToBadForYou"
SWEP.Instructions = ""
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.HoldType = "passive";
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "passive"
SWEP.Category = "ToBadForYou"
SWEP.UID = 76561198208634281

SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize() self:SetHoldType("passive") end
function SWEP:CanPrimaryAttack() return false; end
function SWEP:SecondaryAttack() return false; end

function SWEP:PreDrawViewModel(vm)
    return true
end

function SWEP:DrawWorldModel()
end

if CLIENT then
local LangTbl = RHandcuffsConfig.Language[RHandcuffsConfig.LanguageToUse]
function SWEP:DrawHUD()
    draw.SimpleTextOutlined(LangTbl.SurrenderedText,"Trebuchet24",ScrW()/2,ScrH()/12,Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM,2,Color(0,0,0,255))
end
end
--PATH lua/autorun/cl_mas_fistsofreprisal_options.lua:
/*

 ██████╗██████╗ ███████╗ █████╗ ████████╗███████╗██████╗     ██████╗ ██╗   ██╗    ███╗   ███╗ █████╗ ██████╗  █████╗ ███╗   ██╗███████╗ ██████╗ 
██╔════╝██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔════╝██╔══██╗    ██╔══██╗╚██╗ ██╔╝    ████╗ ████║██╔══██╗██╔══██╗██╔══██╗████╗  ██║╚══███╔╝██╔═══██╗
██║     ██████╔╝█████╗  ███████║   ██║   █████╗  ██║  ██║    ██████╔╝ ╚████╔╝     ██╔████╔██║███████║██████╔╝███████║██╔██╗ ██║  ███╔╝ ██║   ██║
██║     ██╔══██╗██╔══╝  ██╔══██║   ██║   ██╔══╝  ██║  ██║    ██╔══██╗  ╚██╔╝      ██║╚██╔╝██║██╔══██║██╔══██╗██╔══██║██║╚██╗██║ ███╔╝  ██║   ██║
╚██████╗██║  ██║███████╗██║  ██║   ██║   ███████╗██████╔╝    ██████╔╝   ██║       ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██║██║ ╚████║███████╗╚██████╔╝
 ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═════╝     ╚═════╝    ╚═╝       ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝ ╚═════╝ 

------------------------------------------------------------------------------------------------------------------------------------------------------

██████╗  ██████╗     ███╗   ██╗ ██████╗ ████████╗    ██████╗ ███████╗██╗   ██╗██████╗ ██╗      ██████╗  █████╗ ██████╗                               
██╔══██╗██╔═══██╗    ████╗  ██║██╔═══██╗╚══██╔══╝    ██╔══██╗██╔════╝██║   ██║██╔══██╗██║     ██╔═══██╗██╔══██╗██╔══██╗                              
██║  ██║██║   ██║    ██╔██╗ ██║██║   ██║   ██║       ██████╔╝█████╗  ██║   ██║██████╔╝██║     ██║   ██║███████║██║  ██║                              
██║  ██║██║   ██║    ██║╚██╗██║██║   ██║   ██║       ██╔══██╗██╔══╝  ██║   ██║██╔═══╝ ██║     ██║   ██║██╔══██║██║  ██║                              
██████╔╝╚██████╔╝    ██║ ╚████║╚██████╔╝   ██║       ██║  ██║███████╗╚██████╔╝██║     ███████╗╚██████╔╝██║  ██║██████╔╝                              
╚═════╝  ╚═════╝     ╚═╝  ╚═══╝ ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝     ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝                               

██╗███╗   ██╗     █████╗ ███╗   ██╗██╗   ██╗    ███████╗██╗  ██╗ █████╗ ██████╗ ███████╗     ██████╗ ██████╗     ███████╗ ██████╗ ██████╗ ███╗   ███╗
██║████╗  ██║    ██╔══██╗████╗  ██║╚██╗ ██╔╝    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔════╝    ██╔═══██╗██╔══██╗    ██╔════╝██╔═══██╗██╔══██╗████╗ ████║
██║██╔██╗ ██║    ███████║██╔██╗ ██║ ╚████╔╝     ███████╗███████║███████║██████╔╝█████╗      ██║   ██║██████╔╝    █████╗  ██║   ██║██████╔╝██╔████╔██║
██║██║╚██╗██║    ██╔══██║██║╚██╗██║  ╚██╔╝      ╚════██║██╔══██║██╔══██║██╔═══╝ ██╔══╝      ██║   ██║██╔══██╗    ██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║
██║██║ ╚████║    ██║  ██║██║ ╚████║   ██║       ███████║██║  ██║██║  ██║██║     ███████╗    ╚██████╔╝██║  ██║    ██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║
╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝       ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝     ╚═════╝ ╚═╝  ╚═╝    ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝

-------------------------------------------------------- DO NOT REUPLOAD IN ANY SHAPE OR FORM -------------------------------------------------------- 
-------------------------------------------------------- DO NOT REUPLOAD IN ANY SHAPE OR FORM -------------------------------------------------------- 
-------------------------------------------------- IF YOU EDIT ANYTHING YOU ARE VOID OF MY SUPPORT --------------------------------------------------- 
-------------------------------------------------- IF YOU EDIT ANYTHING YOU ARE VOID OF MY SUPPORT --------------------------------------------------- 

*/

AddCSLuaFile()

CreateConVar( 'sk_mas_fistsofreprsial_enabled', '1', { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE } )
CreateConVar( 'sk_mas_fistsofreprsial_adminonly', '0', { FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE } )
CreateConVar( 'sk_mas_fistsofreprisal_infinitecharge', '0', { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE }, "Enable infinite charge for this SWEP" )
CreateConVar( 'sk_mas_fistsofreprisal_nocooldown', '0', { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE }, "Disable cooldowns for this SWEP" )
CreateConVar( 'sk_mas_lagcompensate_npc', '1', { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE }, "Leave this active unless it is confirmed to be conflicting with another addon or if you are maxing your CPU and RAM and need every scrap. Removing this greatly affects player perspectives and should be re-enabled ASAP." )
CreateConVar( 'sk_mas_setmaxhealth_onspawn', '1', { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE }, "Leave this active unless it is actually conflicting with another addon. Disabling this results in healing abilities only going to 100 HP (the default max health) unless defined by another addon. DarkRP DOES NOT set MAX HEALTH by default, hence why I made this code!" )

	Maranzos_AbilitySWEPs = Maranzos_AbilitySWEPs or {}
		
		if SERVER then
			cvars.AddChangeCallback( "sk_mas_fistsofreprisal_infinitecharge", function( convar_name, value_old, value_new )
				Maranzos_AbilitySWEPs.FoR_InfUlt	= tobool( GetConVarNumber( "sk_mas_fistsofreprisal_infinitecharge" ) )
			end )
			cvars.AddChangeCallback( "sk_mas_bloodmagessoul_nocooldown", function( convar_name, value_old, value_new )
				Maranzos_AbilitySWEPs.FoR_NoCD	= tobool( GetConVarNumber( "sk_mas_fistsofreprisal_nocooldown" ) )
			end )
		end
	
if (CLIENT) then

print("\n")
print("[MAS] Maranzo\'s Ability SWEPs: Fists of Reprisal")
print("[MAS]: Options Loaded")
	
	MASconvar_drawhud = CreateClientConVar( 'cl_mas_drawhud', '1' )
	MASconvar_crosshairon = CreateClientConVar( 'cl_mas_crosshairon', '1' )
	MASconvar_preventbinds = CreateClientConVar( 'cl_mas_preventbinds', '1' )
	
	Maranzos_AbilitySWEPs.keyconfigs = Maranzos_AbilitySWEPs.keyconfigs or {}
	
	
-------------------------------------------------------------------
-- Define General Use Functions
	
	local function AS_SaveStoredConfig()
		file.Write( 'mas/maranzo_as_bindings.txt', util.TableToJSON( Maranzos_AbilitySWEPs.keyconfigs, true ) )
		print("[MAS]: Saved binds to Maranzo_AS_bindings.txt \n")
	end // end Save Config


-- Default Binds

	local function AS_DefaultKeyConfigs() 
		print("[MAS]: Default Keybinds Set")
		local KB = {} -- Maranzos_AbilitySWEPs.keyconfigs or {} -- Key Bindings
		
		KB["Binds"] = {
			[ 1 ]	=	input.LookupBinding( "+attack", true ),
			[ 2 ]	=	input.LookupBinding( "+attack2", true ),
			[ 3 ]	=	KEY_F,
			[ 4 ]	=	KEY_C,
			[ 5 ]	=	KEY_T,
			[ 6 ]	=	MOUSE_MIDDLE,
		}
		
		// Add a table with just the Btn names first
		KB["Btn"] = {}
		for k, v in pairs(KB["Binds"]) do
			KB["Btn"][v] = tonumber(k)
		end
		
		// Create a proper display name for these keys
		KB[ 1 ] = string.upper( language.GetPhrase( KB["Binds"][ 1 ] ) ) -- Attack
		KB[ 2 ] = string.upper( language.GetPhrase( KB["Binds"][ 2 ] ) ) -- Abil 1
		KB[ 3 ] = string.upper( language.GetPhrase( input.GetKeyName( KB["Binds"][ 3 ] ) ) ) -- Abil 2
		KB[ 4 ] = string.upper( language.GetPhrase( input.GetKeyName( KB["Binds"][ 4 ] ) ) ) -- Abil 3
		KB[ 5 ] = string.upper( language.GetPhrase( input.GetKeyName( KB["Binds"][ 5 ] ) ) ) -- Ult
		KB[ 6 ] = string.upper( language.GetPhrase( input.GetKeyName( KB["Binds"][ 6 ] ) ) ) -- Abil Select
		if KB[ 1 ] == "MOUSE1" then KB[ 1 ] = "LMB" end
		if KB[ 2 ] == "MOUSE2" then KB[ 2 ] = "RMB" end
		
		table.Empty( Maranzos_AbilitySWEPs.keyconfigs )
		table.Merge( Maranzos_AbilitySWEPs.keyconfigs, KB )
		AS_SaveStoredConfig()
		
	end // end Default Key Config
	
	local function AS_LoadStoredConfig()
		if file.Exists( 'mas/maranzo_as_bindings.txt', 'DATA' ) then
			local fl = file.Read( 'mas/maranzo_as_bindings.txt', 'DATA' )
			if fl then // Confirming if there is a File
				fl = util.JSONToTable( fl )
				if istable( fl ) then
					print("[MAS]: Binding Table Loaded \n")
					table.Empty( Maranzos_AbilitySWEPs.keyconfigs )
					table.Merge( Maranzos_AbilitySWEPs.keyconfigs, fl )
				end
			else // Can't read that shit
				print("[MAS]: Binding Table Not Found \n")
				AS_DefaultKeyConfigs()
			end // end If File Read
		else // No File Found
			file.CreateDir( "mas" )
			print("[MAS]: No Bindings file found \n")
			AS_DefaultKeyConfigs()
		end
	end // end Load Stored Config
	AS_LoadStoredConfig() -- load it
	
	local function UI_MakeBinder( name, ability )
		name:SetTall( 50 )
		if Maranzos_AbilitySWEPs.keyconfigs[ ability ] then
			name:SetValue( Maranzos_AbilitySWEPs.keyconfigs["Binds"][ ability ] )
		end
		
		function name:OnChange( num )
			local lastBtn = Maranzos_AbilitySWEPs.keyconfigs["Binds"][ ability ]
			Maranzos_AbilitySWEPs.keyconfigs["Btn"][ lastBtn ] = false -- Disable Prev Btn
			Maranzos_AbilitySWEPs.keyconfigs["Binds"][ ability ] = num -- Set new key as binded ( "Btn" is what counts )
			Maranzos_AbilitySWEPs.keyconfigs["Btn"][ num ] = ability -- Enable new number
			Maranzos_AbilitySWEPs.keyconfigs[ ability ] = string.upper( language.GetPhrase( input.GetKeyName( num ) ) ) -- Set Display Text
			AS_SaveStoredConfig()
		end
		
		return name
	end // end Fn UI_MakeBinder
-- Tool Options

	hook.Add( 'PopulateToolMenu', 'Maranzo_AS_FistsOfReprisal', function()
		spawnmenu.AddToolMenuOption( 'Options',
			'Ability SWEPs',
			'Maranzo_AS_FistsOfReprisal',
			'MAS: Fists of Reprisal',
			'',
			'',
			function( pnl )
				pnl:ControlHelp( '' )
				pnl:Help( 'Maranzo\'s Ability SWEPs: Fists of Reprisal' )
				pnl:ControlHelp( 'Created by Maranzo. I hope you enjoy it!' )
				pnl:ControlHelp( '' )

				local btnBug = vgui.Create( 'DButton' )
				btnBug:SetText( 'REPORT A BUG' )
				btnBug.DoClick = function()
					gui.OpenURL( 'http://steamcommunity.com/workshop/filedetails/discussion/935300356/1291817208502447989/' )
				end
				btnBug:SetTall( 25 )
				pnl:AddItem( btnBug )

				local btnMore = vgui.Create( 'DButton' )
				btnMore:SetText( 'View More by Maranzo' )
				btnMore.DoClick = function()
					gui.OpenURL( 'http://steamcommunity.com/id/Maranzo/myworkshopfiles/?appid=4000' )
				end
				btnMore:SetTall( 50 )
				pnl:AddItem( btnMore )

				local btnRate = vgui.Create( 'DButton' )
				btnRate:SetText( 'Rate this SWEP' )
				btnRate.DoClick = function()
					gui.OpenURL( 'http://steamcommunity.com/sharedfiles/filedetails/?id=935300356' )
				end
				btnRate:SetTall( 50 )
				pnl:AddItem( btnRate )
				pnl:ControlHelp( 'Rate this SWEP and find the Official Suggestions page from here!' )
				pnl:ControlHelp( '' )
				
				pnl:CheckBox( 'Draw HUD', 'cl_mas_drawhud' )
				pnl:ControlHelp( 'Enable / Disable the showing of Ability icons, Binds, and Combo when the SWEP is out' )
				
				pnl:CheckBox( 'Show Crosshair', 'cl_mas_crosshairon' )
				pnl:ControlHelp( 'Enable / Disable the crosshair. Note: You must switch to another weapon for this to take effect. In Singleplayer you must strip the weapon / die.' )
				
				pnl:CheckBox( 'Prevent Basic Binds ( Flashlight, Menu, CMenu )', 'cl_mas_preventbinds' )
				pnl:ControlHelp( 'Prevent your prop spawn menu, context menu, and flashlight from working while the SWEP is out. By Default this is on to prevent overlap.' )
				pnl:ControlHelp( '' )
				
				pnl:Help( 'Attack: Punch' )
				pnl:Dock( FILL )
				local MAS_AA = vgui.Create( "DButton" )
				MAS_AA:SetTall( 50 )
				MAS_AA:SetText( Maranzos_AbilitySWEPs.keyconfigs[ 1 ] )
				pnl:AddItem( MAS_AA )
				pnl:ControlHelp( 'This is your +attack key \n( Usually your Left Mouse Button )' )
				MAS_AA:SetDisabled( true )
				
				pnl:Help( 'Ability: Scorn Mark' )
				pnl:Dock( FILL )
				local MAS_AbScorn = vgui.Create( "DButton" )
				MAS_AbScorn:SetTall( 50 )
				MAS_AbScorn:SetText( Maranzos_AbilitySWEPs.keyconfigs[ 2 ] )
				pnl:AddItem( MAS_AbScorn )
				pnl:ControlHelp( 'This is your +attack2 key \n( Usually your Right Mouse Button )' )
				MAS_AbScorn:SetDisabled( true )
				
				pnl:Help( 'Ability: Vengeful Leap' )
				local MAS_AbVenge = vgui.Create( "DBinder" )
				pnl:AddItem( UI_MakeBinder( MAS_AbVenge, 3 ) )
				
				pnl:Help( 'Ability: Veteran\'s Strength' )
				local MAS_AbVet = vgui.Create( "DBinder" )
				pnl:AddItem( UI_MakeBinder( MAS_AbVet, 4 ) )
				
				pnl:Help( 'Ability: Meteor Dive' )
				local MAS_AbMet = vgui.Create( "DBinder" )
				pnl:AddItem( UI_MakeBinder( MAS_AbMet, 5 ) )
				
				pnl:Help( 'Ability Selection' )
				local MAS_AbSel = vgui.Create( "DBinder" )
				pnl:AddItem( UI_MakeBinder( MAS_AbSel, 6 ) )
				pnl:ControlHelp( '' )
				
				pnl:Help( 'Holster Weapon' )
				pnl:Dock( FILL )
				local MAS_Holst = vgui.Create( "DBinder" )
				MAS_Holst:SetTall( 50 )
				MAS_Holst:SetText( string.upper( language.GetPhrase( input.LookupBinding( "+Reload", true ) ) ) )
				pnl:AddItem( MAS_Holst )
				pnl:ControlHelp( 'This is your +reload key \n( Usually your "R" Button )' )
				MAS_Holst:SetDisabled( true )
				
				local def = vgui.Create( 'DButton' )
				def:SetText( 'RESTORE DEFAULTS' )
				def.DoClick = function()
					Derma_Query( [[Are you sure you want to restore default settings?
					This cannot be undone!]],
						'Maranzo\'s Ability SWEPs: Defaults',
						'Yes, I\'m sure',
						function()
							-- Console: Client Side
							RunConsoleCommand( 'cl_mas_drawhud', '1' )
							RunConsoleCommand( 'cl_mas_crosshairon', '1' )
							RunConsoleCommand( 'cl_mas_preventbinds', '1' )
							
							-- Abilities: Key Binds
							AS_DefaultKeyConfigs()
							MAS_AA:SetText( Maranzos_AbilitySWEPs.keyconfigs["Binds"][ 1 ] )
							MAS_AbScorn:SetText( Maranzos_AbilitySWEPs.keyconfigs["Binds"][ 2 ] )
							MAS_AbVenge:SetValue( Maranzos_AbilitySWEPs.keyconfigs["Binds"][ 3 ] )
							MAS_AbVet:SetValue( Maranzos_AbilitySWEPs.keyconfigs["Binds"][ 4 ] )
							MAS_AbMet:SetValue( Maranzos_AbilitySWEPs.keyconfigs["Binds"][ 5 ] )
							MAS_AbSel:SetValue( Maranzos_AbilitySWEPs.keyconfigs["Binds"][ 6 ] )
							
							Derma_Message( 'Settings have been successfully restored to defaults.', 'Maranzo\'s Ability SWEPs: Defaults', 'OK' )
						end,
						'No, abort action' )
				end
				def:SetTall( 25 )
				pnl:AddItem( def )
				pnl:ControlHelp( '' )

				if LocalPlayer():IsAdmin() then
					pnl:Help( 'Admin Options' )
					pnl:CheckBox( 'Spawnable SWEP', 'sk_mas_fistsofreprsial_enabled' )
					pnl:ControlHelp( 'Console variant: sk_mas_fistsofreprsial_enabled. Note: This will take effect on map change. It may still be spawned through the give weapon command.' )
					pnl:CheckBox( 'Admin Spawnable only', 'sk_mas_fistsofreprsial_adminonly' )
					pnl:ControlHelp( 'Console variant: sk_mas_fistsofreprsial_adminonly. Note: Map change, or you must die / drop / strip it & spawn it again in order for this to take effect' )
					pnl:CheckBox( 'Cheat: Infinite Ultimate Charge' , 'sk_mas_fistsofreprisal_infinitecharge' )
					pnl:ControlHelp( 'Console variant: sk_mas_fistsofreprisal_infinitecharge. Note: Change is immediate.' )
					pnl:CheckBox( 'Cheat: No Cooldowns', 'sk_mas_fistsofreprisal_nocooldown' )
					pnl:ControlHelp( 'Console variant: sk_mas_fistsofreprisal_infinitecharge. Note: You must die/ drop / strip it & spawn it again in order for this to take effect.' )
					pnl:ControlHelp( '' )
					
					pnl:Help( 'How awesome is this slider?' )
					pnl:NumSlider( 'Awesomeness', '', 1, 10, 0 )
					pnl:NumSlider( 'Slidiness', '', 1, 100, 0 )
					pnl:ControlHelp( '' )
					pnl:ControlHelp( '' )
				end // end If Admin
				
				if LocalPlayer():IsSuperAdmin() then
					pnl:Help( 'Super-Admin Options' )
					pnl:ControlHelp( "Note, each of these options can have a huge impact on player perspectives. It is recommended to leave the options below enabled." )
					pnl:CheckBox( 'Record Max Health on Spawn', 'sk_mas_setmaxhealth_onspawn' )
					pnl:ControlHelp( "Console variant: sk_mas_setmaxhealth_onspawn. Note: Map change only. Leave this active unless it is actually conflicting with another addon. Disabling this results in healing abilities only going to 100 HP (the default max health) unless defined by another addon. DarkRP DOES NOT set MAX HEALTH by default, hence why I made this code!" ) 
					pnl:CheckBox( 'NPC Lag Compensation', 'sk_mas_lagcompensate_npc' )
					pnl:ControlHelp( "Console variant: sk_mas_lagcompensate_npc. Note: Map change only. Keep this on even if NPC's aren't currently in use. Leave this active unless it is confirmed to be conflicting with another addon or if you are maxing your CPU and RAM and need every scrap. Removing this greatly affects player perspectives and should be re-enabled ASAP." )
					pnl:ControlHelp( '' )
					pnl:ControlHelp( '' )
					
				end // end If SuperAdmin
				
			end ) // end F'n
			
		print("MAS: Populated Tool Menu")
	end ) // end Hook Tool Menu


end // end If Client
--PATH gamemodes/mangarp/entities/weapons/weapon_keypadchecker/cl_init.lua:
include("shared.lua")

local DrawData = {}
local KeypadCheckerHalos

net.Receive("DarkRP_keypadData", function(len)
    DrawData = net.ReadTable()
    hook.Add("PreDrawHalos", "KeypadCheckerHalos", KeypadCheckerHalos)
end)

local lineMat = Material("cable/chain")
local textCol = Color(0, 0, 0, 120)
local haloCol = Color(0, 255, 0, 255)

function SWEP:DrawHUD()
    local screenCenter = ScrH() / 2
    draw.WordBox(2, 10, screenCenter, DarkRP.getPhrase("keypad_checker_shoot_keypad"), "UiBold", textCol, color_white)
    draw.WordBox(2, 10, screenCenter + 20, DarkRP.getPhrase("keypad_checker_shoot_entity"), "UiBold", textCol, color_white)
    draw.WordBox(2, 10, screenCenter + 40, DarkRP.getPhrase("keypad_checker_click_to_clear"), "UiBold", textCol, color_white)

    local eyePos = EyePos()
    local eyeAngles = EyeAngles()

    local entMessages = {}
    for k,v in ipairs(DrawData or {}) do
        if not IsValid(v.ent) or not IsValid(v.original) then continue end
        entMessages[v.ent] = (entMessages[v.ent] or 0) + 1
        local obbCenter = v.ent:OBBCenter()
        local pos = v.ent:LocalToWorld(obbCenter):ToScreen()

        local name = v.name and ": " .. v.name:gsub("onDown", DarkRP.getPhrase("keypad_on")):gsub("onUp", DarkRP.getPhrase("keypad_off")) or ""

        draw.WordBox(2, pos.x, pos.y + entMessages[v.ent] * 16, (v.delay and v.delay .. " " .. DarkRP.getPhrase("seconds") .. " " or "") .. v.type .. name, "UiBold", textCol, color_white)

        cam.Start3D(eyePos, eyeAngles)
            render.SetMaterial(lineMat)
            render.DrawBeam(v.original:GetPos(), v.ent:GetPos(), 2, 0.01, 20, haloCol)
        cam.End3D()
    end
end

KeypadCheckerHalos = function()
    local drawEnts = {}
    local i = 1
    for k,v in ipairs(DrawData) do
        if not IsValid(v.ent) then continue end

        drawEnts[i] = v.ent
        i = i + 1
    end

    if table.IsEmpty(drawEnts) then return end
    halo.Add(drawEnts, haloCol, 5, 5, 5, nil, true)
end

function SWEP:SecondaryAttack()
    DrawData = {}
    hook.Remove("PreDrawHalos", "KeypadCheckerHalos")
end

--PATH gamemodes/mangarp/entities/weapons/weapon_mp52/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Author = "DarkRP Developers"
    SWEP.Slot = 2
    SWEP.SlotPos = 0
    SWEP.IconLetter = "x"

    killicon.AddFont("weapon_mp52", "CSKillIcons", SWEP.IconLetter, Color(255, 80, 0, 255))
end

SWEP.Base = "weapon_cs_base2"

SWEP.PrintName = "MP5"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "DarkRP (Weapon)"

SWEP.ViewModel = "models/weapons/cstrike/c_smg_mp5.mdl"
SWEP.WorldModel = "models/weapons/w_smg_mp5.mdl"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.HoldType = "smg"
SWEP.LoweredHoldType = "passive"

SWEP.Primary.Sound = Sound("Weapon_MP5Navy.Single")
SWEP.Primary.Recoil = 0.5
SWEP.Primary.Damage = 15
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.005
SWEP.Primary.ClipSize = 32
SWEP.Primary.Delay = 0.08
SWEP.Primary.DefaultClip = 32
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.IronSightsPos = Vector(-5.3, -7, 2.1)
SWEP.IronSightsAng = Vector(0.9, 0.1, 0)

--PATH addons/sl_util_accessory/lua/entities/aas_bodygroup/shared.lua:
ENT.Base = "base_gmodentity" 
ENT.Type = "anim"
ENT.PrintName = "BodyGroup"
ENT.Category = "Aldreya"
ENT.Author = "Kobralost"
ENT.Spawnable = true
ENT.AdminSpawnable = true
--PATH addons/sl_util_accessory/lua/entities/aas_npc_shop/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	if not IsValid(self) or not IsValid(AAS.LocalPlayer) then return end

	self:DrawModel()
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	ang:RotateAroundAxis(ang:Up(), 0)
	ang:RotateAroundAxis(ang:Forward(), 85)	
	
	if AAS.LocalPlayer:GetPos():DistToSqr(self:GetPos()) < 40000 then
		cam.Start3D2D(pos + ang:Up()*0, Angle(0, AAS.LocalPlayer:EyeAngles().y-90, 90), 0.025)

			draw.RoundedBoxEx(16, -500, -3100, 1000, 170, AAS.Colors["background"], true, true, false, false)
			draw.RoundedBox(0, -500, -2950, 1000, 20, AAS.Colors["black150"])

			draw.SimpleText(AAS.ItemNpcName, "AAS:Font:08", 0, -3085, AAS.Colors["white"], TEXT_ALIGN_CENTER)

		cam.End3D2D()
	end 
end 
--PATH lua/entities/applejuice3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Apple Juice"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/juice3.mdl")
	
end
--PATH lua/entities/bacon2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Bacon Slice (Cooked)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Bacon"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/baconcooked.mdl")
	
end
--PATH lua/entities/bagel1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Bagel"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Bagel1.mdl")
	
end
--PATH addons/blues-decals/lua/entities/blues_decals/cl_init.lua:
include("shared.lua")

local registeredEnts = {}

function ENT:Initialize()
	self.clientOverride = false
	self.clientOverrideScale = Vector(1000,1000,0)
	self.clientOverrideColor = Vector(255,255,255)
	self.clientOverrideAlpha = 255

	registeredEnts[self:EntIndex()] = self

	if self:GetImgurID() ~= nil and self:GetImgurID() ~= "" then
		timer.Simple(1, function()
			self:RefreshMaterial()
		end)
	end
end

function ENT:OnRemove()
	registeredEnts[self:EntIndex()] = nil
end

--Calling this will re-cache the material and load what ever the new ID is
function ENT:RefreshMaterial(customID)
	self.mat = nil
	if customID then
		BluesDecals.ImageLoader.GetMaterial(customID, function(mat)
			self.mat = mat
		end)
	else
		BluesDecals.ImageLoader.GetMaterial(self:GetImgurID(), function(mat)
			self.mat = mat
		end)
	end
end

--Draw nothing
function ENT:Draw()

end

function ENT:DrawImage()
	if LocalPlayer():GetPos():Distance(self:GetPos()) > 2000 then return end

	local scale = self:GetImageScale()
	local color = self:GetImageColor()
	local alpha = self:GetImageAlpha()

	if self.clientOverride then
		scale = self.clientOverrideScale
		color = Color(self.clientOverrideColor.r, self.clientOverrideColor.g, self.clientOverrideColor.b, self.clientOverrideAlpha)
	else
		color = Color(color.r, color.g, color.b, alpha)
	end

	local ang = self:GetAngles()
	ang:RotateAroundAxis(self:GetAngles():Up(),90)

	cam.Start3D2D( self:GetPos() + (self:GetAngles():Up() * -1.7), ang, 0.05 )
		if self.mat ~= nil and self.mat ~= false then
			surface.SetDrawColor(color)
			surface.SetMaterial(self.mat)
			surface.DrawTexturedRectRotated(0, 0, scale.x, scale.y, 0)
		else
			surface.SetDrawColor(Color(255,255,255,255))
			surface.SetMaterial(BluesDecals.UI.Materials.loading)
			surface.DrawTexturedRectRotated(0,0, 1000, 1000, (CurTime() * -250) % 360)
		end
	cam.End3D2D()
end

--Handles refreshing the material
net.Receive("BLUESDECALS:RefreshMaterial", function()
	local e = net.ReadEntity()

	if IsValid(e) then
		e:RefreshMaterial()
	end
end)

hook.Add( "PostDrawTranslucentRenderables", "BLUESDECALS:DrawCam3D2D", function()
	for k, v in pairs(ents.FindByClass("blues_decals")) do
		v:DrawImage()
	end
end)












--PATH addons/sl_main_system/lua/entities/buellost_iron/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()

end
--PATH addons/sl_main_system/lua/entities/buellost_iron/shared.lua:
ENT.Base	    			= "base_ai"
ENT.Type	    			= "ai"
ENT.PrintName				= "Roche de fer"
ENT.Author					= "Buellost"
ENT.Category                = "[SL - CRAFTING]"
ENT.Instructions			= ""
ENT.Spawnable				= true
ENT.AdminSpawnable			= true

ENT.RockType = "fer"

function ENT:SetupDataTables()	
	self:NetworkVar( "Int", 0, "ResourceMax" )
end
--PATH addons/sl_main_system/lua/entities/buellost_tree/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()

end
--PATH lua/entities/burger2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Burger"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A Burger"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/burgergtaiv.mdl")
	
end
--PATH lua/entities/cabbage2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Cabbage (Purple)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Caggage"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/cabbage2.mdl")
	
end
--PATH lua/entities/cheesewheel2c/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Cheese wheel slice"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/cheesewheel2c.mdl")
	
end
--PATH lua/entities/chipsfritosbbq/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Fritos BarBQ"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Fritos BarBQ"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chipsfritosbbq.mdl")
	
end
--PATH addons/the_perfect_training_system/lua/entities/diablos_dumbbell/shared.lua:
ENT.Base = "base_entity"
ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.AutomaticFrameAdvance = true
ENT.PrintName		= "Dumbbell"
ENT.Category		= "Diablos Addon"
ENT.Instructions	= ""
ENT.Spawnable		= true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "TrainingID")
end

function ENT:GetWeightBodygroup()
	return self:FindBodygroupByName("weight")
end

function ENT:GetWeight()
	return self:GetBodygroup(self:GetWeightBodygroup()) + 1
end

function ENT:SetWeight(newWeight)
	self:SetBodygroup(self:GetWeightBodygroup(), newWeight - 1)
end

function ENT:GetLevel()
	return self:GetWeight()
end

--PATH addons/the_perfect_training_system/lua/entities/diablos_punching_ball/shared.lua:
ENT.Base = "base_entity"
ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.AutomaticFrameAdvance = true
ENT.PrintName		= "Punching Ball"
ENT.Category		= "Diablos Addon"
ENT.Instructions	= ""
ENT.Spawnable		= true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "TrainingID")
end

function ENT:GetWeightBodygroup()
	return self:FindBodygroupByName("weight")
end

function ENT:GetChainBodygroup()
	return self:FindBodygroupByName("chain")
end

function ENT:GetImageBodygroup()
	return self:FindBodygroupByName("img")
end


function ENT:GetWeight()
	return self:GetBodygroup(self:GetWeightBodygroup()) + 1
end


function ENT:SetWeight(newWeight)
	self.weight = newWeight

	local bodygroup = self:GetWeight()
	local trainingData = Diablos.TS.PunchingBallSizeEquivalence[bodygroup]
	self.trainingDuration = trainingData.time

	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:SetMass(trainingData.mass)
	end

	self:SetBodygroup(self:GetWeightBodygroup(), newWeight - 1) -- weight
end

function ENT:GetLevel()
	return self:GetWeight()
end


function ENT:SetLogoMaterial()
	local matName = Diablos.TS.Materials["PunchingLogoName"]

	local punchingMaterialIndex = self:GetImageMaterial() - 1
	self:SetSubMaterial(punchingMaterialIndex, "!" .. matName)
end


function ENT:GetImageMaterial()
	local materials = self:GetMaterials()
	local imgMaterial = 0
	for index, material in ipairs(materials) do
		if material == "models/tptsa/punching_ball/img" then
			imgMaterial = index
		end
	end
	return imgMaterial
end
--PATH addons/the_perfect_training_system/lua/entities/diablos_weigh_balance/shared.lua:
ENT.Base = "base_gmodentity"
ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.AutomaticFrameAdvance = true
ENT.PrintName		= "Weigh Balance"
ENT.Category		= "Diablos Addon"
ENT.Instructions	= ""
ENT.Spawnable		= true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "TrainingID")
end
--PATH lua/entities/donut/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Donut"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A glazed donut"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Donut.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/drug/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
end

local color_red = Color(140, 0, 0, 100)
local color_white = color_white

function ENT:Draw()
    self:DrawModel()

    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    local owner = self:Getowning_ent()
    owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")

    surface.SetFont("HUDNumber5")
    local text = DarkRP.getPhrase("drugs")
    local text2 = DarkRP.getPhrase("priceTag", DarkRP.formatMoney(self:Getprice()), "")
    local TextWidth = surface.GetTextSize(text)
    local TextWidth2 = surface.GetTextSize(text2)

    Ang:RotateAroundAxis(Ang:Forward(), 90)
    local TextAng = Ang

    TextAng:RotateAroundAxis(TextAng:Right(), CurTime() * -180)

    cam.Start3D2D(Pos + Ang:Right() * -15, TextAng, 0.1)
        draw.WordBox(2, -TextWidth * 0.5 + 5, -30, text, "HUDNumber5", color_red, color_white)
        draw.WordBox(2, -TextWidth2 * 0.5 + 5, 18, text2, "HUDNumber5", color_red, color_white)
    cam.End3D2D()
end

function ENT:Think()
end

local function drugEffects(um)
    local toggle = um:ReadBool()

    LocalPlayer().isDrugged = toggle

    if toggle then
        hook.Add("RenderScreenspaceEffects", "drugged", function()
            DrawSharpen(-1, 2)
            DrawMaterialOverlay("models/props_lab/Tank_Glass001", 0)
            DrawMotionBlur(0.13, 1, 0.00)
        end)
    else
        hook.Remove("RenderScreenspaceEffects", "drugged")
    end
end
usermessage.Hook("DrugEffects", drugEffects)

--PATH addons/employer_npc/lua/entities/employer_npc/cl_init.lua:
include("shared.lua")

surface.CreateFont("ENPC.Font72", { font = "Roboto", size = 72, weight = 300, extended = true })

function ENT:Draw()
	self:DrawModel()

	if self:GetPos():Distance(LocalPlayer():GetPos()) < 1000 then
		local Ang = LocalPlayer():GetAngles()

		Ang:RotateAroundAxis( Ang:Forward(), 90)
		Ang:RotateAroundAxis( Ang:Right(), 90)

		cam.Start3D2D(self:GetPos()+self:GetUp()*80, Ang, 0.05)
			draw.SimpleTextOutlined( self:GetCustomName(), "ENPC.Font72", -3, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 255))
		cam.End3D2D()
	end
end

--PATH addons/employer_npc/lua/entities/employer_npc/shared.lua:
ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.PrintName = "JobNPC"
ENT.Author = "roni_sl"
ENT.Category = "Job Employers"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "CustomName")
end

--PATH lua/entities/fish3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Raw Bass"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A raw fish"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/fishbass.mdl")
	
end
--PATH lua/entities/fruitwatermelon/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Watermelon"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/watermelon_unbreakable.mdl")
	
end
--PATH addons/gmod_info_board/lua/entities/gmib_blank_visual/shared.lua:
ENT.Type        = "anim"
ENT.Base        = "base_entity"
ENT.Category    = "GMod Info Board"
ENT.PrintName   = "Blank Visual"

ENT.Author      = "2REK 2020"
ENT.Contact     = "https:--steamcommunity.com/id/2rek/"

ENT.Spawnable   = false
ENT.AdminOnly   = true
ENT.RenderGroup = RENDERGROUP_OPAQUE

--PATH lua/entities/icecream4/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Ice Cream (Chocolate)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/IceCream4.mdl")
	
end
--PATH lua/entities/icecream5b/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Ice Cream (Pistachio)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/IceCream_open5.mdl")
	
end
--PATH lua/entities/kindersurprise1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Kinder Surprise"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A Kinder Surprise"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/KinderSurprise.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/lab_base/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Lab"
ENT.Author = "DarkRP Developers"
ENT.Spawnable = false
ENT.CanSetPrice = true

-- These are variables that should be set in entities that base from this
ENT.model = ""
ENT.initialPrice = 0
ENT.labPhrase = ""
ENT.itemPhrase = ""
ENT.noIncome = false
ENT.camMul = -30
ENT.blastRadius = 200
ENT.blastDamage = 200

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:initVars()
    -- Implement this to set the above variables
end

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "price")
    self:NetworkVar("Entity", 1, "owning_ent")
end

--PATH gamemodes/mangarp/entities/entities/letter/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "letter"
ENT.Author = "Pcwizdan"
ENT.Spawnable = false

function ENT:SetupDataTables()
    self:NetworkVar("Entity",1,"owning_ent")
    self:NetworkVar("Entity",2,"signed")
end

DarkRP.declareChatCommand{
    command = "write",
    description = "Write a letter.",
    delay = 5
}

DarkRP.declareChatCommand{
    command = "type",
    description = "Type a letter.",
    delay = 5
}

DarkRP.declareChatCommand{
    command = "removeletters",
    description = "Remove all of your letters.",
    delay = 5
}

--PATH addons/sl_main_system/lua/entities/mad_crystal/shared.lua:
ENT.Base	    			= "base_ai"
ENT.Type	    			= "ai"
ENT.PrintName				= "Crystal"
ENT.Author					= "Mad"
ENT.Category                = "Union - SL"
ENT.Instructions			= "Appuyez sur votre touche [USE]"
ENT.Spawnable				= true
ENT.AdminSpawnable			= true
--PATH addons/mc_simple_npcs/lua/entities/mcs_npc/shared.lua:
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Simple NPC"
ENT.Author = "Mactavish"
ENT.Spawnable = false
ENT.AdminSpawnable = true

function ENT:Initialize()
	self.SimpleNPC = true
	self.UsingPlayer = false
end

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "Namer")
	self:NetworkVar("String", 1, "UID")
	self:NetworkVar("String", 2, "DefAnimation")
	self:NetworkVar("Bool", 0, "InputLimit")
end

if SERVER then
	function ENT:AcceptInput(istr, ply)
		if IsValid(ply) and (!ply.UseTimer or ply.UseTimer < CurTime()) then
			
			ply.UseTimer = CurTime() + MCS.Config.UseDelay
			
			if self:GetInputLimit() then
				if self.UsingPlayer then
					return
				else
					self.UsingPlayer = ply
				end
			end
			
			net.Start("OpenMCSMenu")
				net.WriteEntity(self)
			net.Send(ply)
				
		end
	end

	function ENT:Think()
		
		if self:GetInputLimit() then
			if self.UsingPlayer != false and !IsValid(self.UsingPlayer) then
				self.UsingPlayer = false
			end
		end
		
		self:NextThink(CurTime())  
		return true
		
	end
end
--PATH lua/entities/meat8/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Cooked Meat"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/meat8.mdl")
	
end
--PATH addons/sl_main_system/lua/entities/ne_heal_pnj/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()

	if string.len(string.Trim("Racheteur d'Item")) < 1 then return end

	if LocalPlayer():GetPos():Distance(self:GetPos()) < 400 then
		local alpha = (LocalPlayer():GetPos():Distance(self:GetPos()) / 500.0)
		alpha = math.Clamp(1.25 - alpha, 0 ,1)
		local a = Angle(0,0,0) 
		a:RotateAroundAxis(Vector(1,0,0),90) 
		a.y = LocalPlayer():GetAngles().y - 90 

		cam.Start3D2D(self:GetPos() + Vector(0,0,80), a , 0.08) 
			draw.RoundedBox(8,-200,-75,400,75 , Color(25,25,25,255 * alpha)) 
			local tri = {{x = -25 , y = 0},{x = 25 , y = 0},{x = 0 , y = 25}} 
			surface.SetDrawColor(Color(25,25,25,255 * alpha)) 
			draw.NoTexture() 
			surface.DrawPoly( tri ) 
			draw.SimpleText("Infirmier","DermaLarge",0,-40, white , 1 , 1) 
		cam.End3D2D() 
	end
end
--PATH addons/sl_main_system/lua/entities/ne_heal_pnj/shared.lua:
ENT.Base	    			= "base_ai"
ENT.Type	    			= "ai"
ENT.PrintName				= "Infirmière"
ENT.Author					= "Absalom"
ENT.Category                = "NE - SL"
ENT.Instructions			= "Appuyez sur votre touche [USE]"
ENT.Spawnable				= true
ENT.AdminSpawnable			= true
--PATH addons/sl_main_system/lua/entities/npc_demon.lua:


if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

local hitjoueur = {
	"mad_sfx_sololeveling/punch/se_Punch_FaceHit.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit01.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit02.ogg"
}

local swing_attack = {
	"mad_sfx_sololeveling/punch/chopper_Punch01.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch02.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch03.ogg"
}

-- Misc --
ENT.PrintName = "Démon"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_demonmob.mdl"} -- Modèle mis à jour
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "mob"

-- Stats --
ENT.xp = 5000
ENT.money = 600000
ENT.Damage = 900
ENT.SpawnHealth = 15000

ENT.WalkSpeed = 100
ENT.RunSpeed = 500

ENT.HPBarOffset = 20
ENT.HPBarScale = 0.20

-- Detection --
ENT.EyeBone = ""
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 150
ENT.SightRange = 1000
ENT.MinLuminosity = 0
ENT.MaxLuminosity = 1
ENT.HearingCoefficient = 1

-- Sounds --
ENT.OnDamageSounds = {""}
ENT.OnDeathSounds = {""}

-- AI --
ENT.RangeAttackRange = 0
ENT.MeleeAttackRange = 30
ENT.ReachEnemyRange = 30
ENT.AvoidEnemyRange = 0

-- Relationships --
ENT.Factions = {FACTION_ZOMBIES}

-- Movements/animations --
ENT.WalkAnimation = ACT_WALK
ENT.WalkAnimRate = 1
ENT.RunAnimation = ACT_RUN
ENT.RunAnimRate = 1
ENT.IdleAnimation = ACT_IDLE
ENT.IdleAnimRate = 1

-- Possession --
ENT.PossessionEnabled = true

if SERVER then

	-- Init/Think --
	function ENT:CustomInitialize()
		self:SetDefaultRelationship(D_HT)
		self:DrawShadow(false)
		self:SetHP(self:Health())
		self:SetHPY(self:Health())
		self:SetModelScale(1.2)
		self:SetSkin(math.random(0, 2))

		self.StartHealth = self:Health()
		
		-- Définit le groupe de collision pour éviter les collisions entre NPCs
		self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE) -- Permet aux NPC de passer à travers d'autres NPC

		timer.Simple(0, function()
			self:SetHP(self:Health())
			self:SetHPY(self:Health())
			self:SetDMGDealt(0)
		end)
	end

	if CLIENT then
		function ENT:CustomThink()
			if self:GetCooldown("DS1_"..self:GetClass().."_HPYDegrade") <= 0 then
				local var = self:GetHPY()
				self:SetDMGDealt(0)
				self:SetHPY(math.Clamp(var-(self.StartHealth/250),self:Health(),self.StartHealth))
			end
		end
	end

	-- AI --
ENT.Omniscient = false
ENT.SpotDuration = 10

local function SpotTimerName(self, ent)
    return "DrGBaseNB" .. self:GetCreationID() .. "SpotENT" .. ent:GetCreationID()
end

function ENT:SpotEntity(ent)
    if not IsValid(ent) then return end
    if GetConVar("ai_ignoreplayers"):GetBool() then return end
    if ent:IsPlayer() and not ent:Alive() then return end

    if ent:GetNoDraw() == false then
        local distanceThreshold = 300  -- Définissez ici la distance maximale d'aggro
        
        -- Vérifiez si nous avons déjà une cible
        if self.CurrentTarget and IsValid(self.CurrentTarget) then
            local currentDistance = self.CurrentTarget:GetPos():Distance(self:GetPos())
            if currentDistance > distanceThreshold then
                -- Si la cible actuelle est trop loin, réinitialisez-la
                self:LoseEntity(self.CurrentTarget)
                self.CurrentTarget = nil
            else
                -- Si la cible est valide et à portée, ne faites rien
                return
            end
        end

        if self:GetSpotDuration() == 0 then return end
        local spotted = self:HasSpotted(ent)
        self._DrGBaseLastTimeSpotted[ent] = CurTime()
        self._DrGBaseSpotted[ent] = true
        local disp = self:GetRelationship(ent, true)
        
        if disp == D_HT or disp == D_LI or disp == D_FR then
            self._DrGBaseRelationshipCachesSpotted[disp][ent] = true
        end
        
        self:UpdateKnownPosition(ent)
        
        if self._DrGBasePatrolSound and self._DrGBasePatrolSound:GetSound().Entity == ent then
            self:RemovePatrol(self._DrGBasePatrolSound)
        end
        
        if not spotted then
            self:OnSpotted(ent)
            self.CurrentTarget = ent  -- Enregistrer l'entité comme cible actuelle
            if ent:IsPlayer() then
                if ent:GetNoDraw() == true then
                    self:LoseEntity(ent)
                end
                net.Start("DrGBaseNextbotPlayerAwareness")
                net.WriteEntity(self)
                net.WriteBit(true)
                net.Send(ent)
            end
        end
        
        local timerName = SpotTimerName(self, ent)
        timer.Remove(timerName)
        if self:GetSpotDuration() <= 0 then return end
        
        timer.Create(timerName, self:GetSpotDuration(), 1, function()
            if not IsValid(self) or not IsValid(ent) then return end
            self:LoseEntity(ent)
            self.CurrentTarget = nil  -- Réinitialiser la cible actuelle
        end)
    end
end

function ENT:OnReachedPatrol()
end

function ENT:OnIdle()
end

function ENT:OnMeleeAttack(enemy)
    if not IsValid(enemy) then return end
    if not IsValid(self) then return end

    self.cdAttack = self.cdAttack or 0
	if self.Freeze == true then return end

    -- Définir un délai d'attente aléatoire entre 1.5 et 3 secondes
    local attackDelay = math.random(15, 30) / 10

    if self.cdAttack < CurTime() then
        self.cdAttack = CurTime() + attackDelay  -- Mettre à jour le cooldown avec le délai aléatoire

        if self:Health() < 1 then return end
        self:EmitSound(swing_attack[math.random(1, 3)], 75, math.random(70, 130), 0.8, CHAN_AUTO)

        timer.Simple(0.7, function()
            if self:Health() < 1 then return end
            if IsValid(self) and IsValid(enemy) then
				timer.Simple(0.5, function()
					if enemy:GetPos():Distance(self:GetPos()) < 340 then
						enemy:TakeDamage(self.Damage, self, self)    
						timer.Simple(0.001, function()
							if enemy:Health() <= 0 then
								local currentXP = enemy:getDarkRPVar("xp") or 0
								-- Calcule 50% de l'XP
								local xpToRemove = currentXP * 0.1
								-- Enlève 50% de l'XP au joueur
								enemy:addXP(-xpToRemove)
				
								-- Réinitialise les cristaux
								enemy:SetDataItemSL_INV("crystal", 0)
								enemy:SetDataItemSL_INV("crystal2", 0)
								enemy:SetDataItemSL_INV("crystal3", 0)
								enemy:SetDataItemSL_INV("crystal4", 0)
							end
						end)
						enemy:EmitSound(hitjoueur[math.random(1, 3)], 75, math.random(70, 130), 0.8, CHAN_AUTO)    
					end
				end)
            end
        end)

        self:PlaySequenceAndMove("attack" .. math.random(2), 1, self.FaceEnemy)
    end
end

function ENT:OnReachedPatrol()
		
end
function ENT:OnIdle()
	
end

	-- Créez une table locale pour stocker les dégâts infligés par chaque joueur pour cet NPC spécifique
	ENT.playerDamage = {}

	function ENT:OnTakeDamage(damage)
		self:SetHP(math.Clamp(self:Health()-damage:GetDamage(),0,self.StartHealth))
		self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 1.5)
		if IsValid(damage:GetAttacker()) and damage:GetAttacker():IsPlayer() then
			local attacker = damage:GetAttacker()

			-- Ajoutez les dégâts infligés à la table du joueur pour cet NPC
			self.playerDamage[attacker] = (self.playerDamage[attacker] or 0) + damage:GetDamage()
		end
	end

	function ENT:OnDeath(dmginfo, hitgroup)
		local totalDamage = 0
		local eligiblePlayers = {} -- Tableau pour stocker les joueurs éligibles

		local ent = ents.Create("mad_crystal")
		ent:SetNWInt("item", "crystal2")
		ent:SetPos(self:GetPos() + Vector(0, 0, 20))
		ent:Spawn()
	
		-- Calculez le total des dégâts infligés pour cet NPC
		for _, damage in pairs(self.playerDamage) do
			totalDamage = totalDamage + damage
		end
	
		-- Distribuez l'argent équitablement entre les joueurs
		if totalDamage > 0 then
			for player, damage in pairs(self.playerDamage) do
				local moneyEarned = math.floor(self.money * damage / totalDamage)
				local xpEarned = math.floor(self.xp * damage / totalDamage)
	
				if player:GetUserGroup() == "vip" then
					player:addXP(xpEarned*1.2,true,true)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + ".. xpEarned*1.2 .." XP")
					net.Send(player)
					player:addMoney(moneyEarned*1.2)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned*1.2))
					net.Send(player)
				else
					player:addXP(xpEarned,true,true)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + "..xpEarned.." XP")
					net.Send(player)
					player:addMoney(moneyEarned)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned))
					net.Send(player)
				end

				-- Vérifier si le joueur est éligible pour une compétence
				local playerLevel = player:getDarkRPVar("level")
				local playerClass = player:GetNWInt("Classe")
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe == playerClass and playerLevel >= skillData.level then
						table.insert(eligiblePlayers, player)
						break
					end
				end
			end
		end
	
		-- Distribution des compétences avec une chance de 10 % par joueur éligible
		for _, player in ipairs(eligiblePlayers) do
			if math.random() <= 0.5 then
				local playerClass = player:GetNWInt("Classe")
				local playerLevel = player:getDarkRPVar("level")
				local availableSkills = {} -- Tableau pour stocker les compétences disponibles pour ce joueur
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe == playerClass and playerLevel >= skillData.level and player:HasSkill(skillName) == false then
						if skillData.ismagie == false then
							table.insert(availableSkills, skillName)
						elseif skillData.ismagie == true then
							if player:GetNWInt("Magie") == skillData.element then
								table.insert(availableSkills, skillName)
							end
						end
					end
				end
	
				-- Sélectionnez une compétence aléatoire parmi les compétences disponibles pour le joueur
				local randomSkill = availableSkills[math.random(#availableSkills)]
				local skillData = SKILLS_SL[randomSkill]
	
				-- Ajouter la compétence au joueur
				if skillData then
					player:AddDataSkillsSL(randomSkill, skillData.level)
					net.Start("SL:Notification")
					net.WriteString("Vous avez obtenu le skill : "..skillData.name)
					net.Send(player)
				end
			end
		end
	
		-- Réinitialisez la table des dégâts pour la prochaine instance de NPC
		self.playerDamage = {}
		self:PlaySequenceAndWait("die")
	end
	ENT.DefaultRunSpeed = ENT.RunSpeed
	ENT.DefaultWalkSpeed = ENT.WalkSpeed
	function ENT:Abs_Freeze(bool)
		if bool == true then
			self.Freeze = true
			self.RunSpeed = 0
			self.WalkSpeed = 0
		else
			self.Freeze = false
			self.RunSpeed = self.DefaultRunSpeed
			self.WalkSpeed = self.DefaultWalkSpeed
		end
	end
end

if CLIENT then
	ENT.RenderGroup = RENDERGROUP_OPAQUE
	ENT.HUDMat_Main = Material("mad_sololeveling/mob/boss_hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar = Material("mad_sololeveling/mob/hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar2 = Material("hud/ds1/boss_hpbar_ylw.png", "smooth unlitgeneric")
	local tab = {["$pp_colour_addr"]=0,["$pp_colour_addg"]=0,["$pp_colour_addb"]=0,["$pp_colour_brightness"]=0,["$pp_colour_contrast"]=0.1,["$pp_colour_colour"]=0,["$pp_colour_mulr"]=50, ["$pp_colour_mulg"]=0, ["$pp_colour_mulb"]=0 }
	
	function ENT:CustomDraw()
	    if self:IsDead() and (math.Round(self:GetHPY()) <= math.Round(self:GetHP())) then return end
	    local angle = EyeAngles()
	    angle = Angle(0, angle.y, 0)
	    angle.y = angle.y + math.sin(CurTime()) * 10
	    angle:RotateAroundAxis(angle:Up(), -90)
	    angle:RotateAroundAxis(angle:Forward(), 90)
	    
	    local pos = self:GetBonePosition(self:LookupBone("Bip001 Head")) + Vector(0, 0, self.HPBarOffset)
	    cam.Start3D2D(pos, angle, self.HPBarScale)
	        local hp = math.Round(self:GetHP())
	        local hp2 = math.Round(self:GetHPY())
	        local hpmax = self.SpawnHealth
	        local text = self.PrintName
	        local text2 = tostring(math.Round(self:GetDMGDealt()))
	        surface.SetFont("Trebuchet24")
	        local tW, tH = surface.GetTextSize(text)

	        local pad = 0.01
	        surface.SetDrawColor(255, 255, 255, 255)
	        surface.SetMaterial(self.HUDMat_Bar2)
	        surface.DrawTexturedRect(-(self.HUDMat_Main:Width() / 6) + 8, -(self.HUDMat_Main:Height()) + 5, (self.HUDMat_Bar2:Width() * 1.05) * (hp2 / hpmax), self.HUDMat_Bar2:Height() / 2, 1)
	        surface.SetMaterial(self.HUDMat_Bar)
	        surface.DrawTexturedRect(-(self.HUDMat_Main:Width() / 6) + 8, -(self.HUDMat_Main:Height()) + 5, (self.HUDMat_Bar:Width() * 1.05) * (hp / hpmax), self.HUDMat_Bar:Height() / 2, 1)
	        surface.SetMaterial(self.HUDMat_Main)
	        surface.DrawTexturedRect(-(self.HUDMat_Main:Width() / 6), -(self.HUDMat_Main:Height()), self.HUDMat_Main:Width() / 3, self.HUDMat_Main:Height(), 2)

	        draw.SimpleText(text, "M_Font5", -(self.HUDMat_Main:Width() / 6) + 8, -(self.HUDMat_Main:Height() + 16), color_white)
	        if text2 ~= "0" then draw.SimpleText(text2, "M_Font5", (self.HUDMat_Main:Width() / 6) - 16, -(self.HUDMat_Main:Height() + 16), color_white) end
	    cam.End3D2D()
	    self:DS1_Draw()
	end


	function ENT:DS1_Draw()
		-- fonction personnalisée pour d'autres effets de dessin si nécessaire
	end
end

function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "HP")
	self:NetworkVar("Float", 1, "HPY")
	self:NetworkVar("Float", 2, "DMGDealt")
	self:NetworkVar("Bool", 0, "Phantom")
end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

--PATH addons/sl_main_system/lua/entities/npc_goblin.lua:

if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

local hitjoueur = {
	"mad_sfx_sololeveling/punch/se_Punch_FaceHit.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit01.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit02.ogg"
}

local swing_attack = {
	"mad_sfx_sololeveling/punch/chopper_Punch01.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch02.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch03.ogg"
}

-- Misc --
ENT.PrintName = "Goblin"
ENT.Category = "SL - NPC"
ENT.Models = {"models/abs_goblin.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "mob"

-- Stats --
ENT.xp = 200
ENT.money = 100000
ENT.Damage = 10
ENT.SpawnHealth = 4000

ENT.WalkSpeed = 100
ENT.RunSpeed = 150

ENT.HPBarOffset = 15
ENT.HPBarScale = 0.15

-- Detection --
ENT.EyeBone = ""
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 150
ENT.SightRange = 1000
ENT.MinLuminosity = 0
ENT.MaxLuminosity = 1
ENT.HearingCoefficient = 1

-- Sounds --
ENT.OnDamageSounds = {""}
ENT.OnDeathSounds = {""}

-- AI --
ENT.Omniscient = false
ENT.SpotDuration = 10
ENT.RangeAttackRange = 0
ENT.MeleeAttackRange = 30
ENT.ReachEnemyRange = 30
ENT.AvoidEnemyRange = 0

-- Relationships --
ENT.Factions = {FACTION_ZOMBIES}

-- Movements/animations --
ENT.WalkAnimation = ACT_WALK
ENT.WalkAnimRate = 1
ENT.RunAnimation = ACT_RUN
ENT.RunAnimRate = 1
ENT.IdleAnimation = ACT_IDLE
ENT.IdleAnimRate = 1

-- Possession --
ENT.PossessionEnabled = true

if SERVER then

	-- Init/Think --

	function ENT:CustomInitialize()

		self:SetDefaultRelationship(D_HT)
		self:DrawShadow(false)
		self:SetHP(self:Health())
		self:SetHPY(self:Health())

		self.StartHealth = self:Health()

		self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE)
	
		timer.Simple(0, function()
			self:SetHP(self:Health())
			self:SetHPY(self:Health())
			self:SetDMGDealt(0)
		end)
	end


	if CLIENT then
		function ENT:CustomThink()
			if self:GetCooldown("DS1_"..self:GetClass().."_HPYDegrade") <= 0 then
				local var = self:GetHPY()
				self:SetDMGDealt(0)
				self:SetHPY(math.Clamp(var-(self.StartHealth/250),self:Health(),self.StartHealth))
			end
		end
	end

		-- AI --
	ENT.Omniscient = false
	ENT.SpotDuration = 10

	local function SpotTimerName(self, ent)
		return "DrGBaseNB" .. self:GetCreationID() .. "SpotENT" .. ent:GetCreationID()
	end

	function ENT:SpotEntity(ent)
		if not IsValid(ent) then return end
		if GetConVar("ai_ignoreplayers"):GetBool() then return end
		if ent:IsPlayer() and not ent:Alive() then return end

		if ent:GetNoDraw() == false then
			local distanceThreshold = 300  -- Définissez ici la distance maximale d'aggro
			
			-- Vérifiez si nous avons déjà une cible
			if self.CurrentTarget and IsValid(self.CurrentTarget) then
				local currentDistance = self.CurrentTarget:GetPos():Distance(self:GetPos())
				if currentDistance > distanceThreshold then
					-- Si la cible actuelle est trop loin, réinitialisez-la
					self:LoseEntity(self.CurrentTarget)
					self.CurrentTarget = nil
				else
					-- Si la cible est valide et à portée, ne faites rien
					return
				end
			end

			if self:GetSpotDuration() == 0 then return end
			local spotted = self:HasSpotted(ent)
			self._DrGBaseLastTimeSpotted[ent] = CurTime()
			self._DrGBaseSpotted[ent] = true
			local disp = self:GetRelationship(ent, true)
			
			if disp == D_HT or disp == D_LI or disp == D_FR then
				self._DrGBaseRelationshipCachesSpotted[disp][ent] = true
			end
			
			self:UpdateKnownPosition(ent)
			
			if self._DrGBasePatrolSound and self._DrGBasePatrolSound:GetSound().Entity == ent then
				self:RemovePatrol(self._DrGBasePatrolSound)
			end
			
			if not spotted then
				self:OnSpotted(ent)
				self.CurrentTarget = ent  -- Enregistrer l'entité comme cible actuelle
				if ent:IsPlayer() then
					if ent:GetNoDraw() == true then
						self:LoseEntity(ent)
					end
					net.Start("DrGBaseNextbotPlayerAwareness")
					net.WriteEntity(self)
					net.WriteBit(true)
					net.Send(ent)
				end
			end
			
			local timerName = SpotTimerName(self, ent)
			timer.Remove(timerName)
			if self:GetSpotDuration() <= 0 then return end
			
			timer.Create(timerName, self:GetSpotDuration(), 1, function()
				if not IsValid(self) or not IsValid(ent) then return end
				self:LoseEntity(ent)
				self.CurrentTarget = nil  -- Réinitialiser la cible actuelle
			end)
		end
	end

	function ENT:OnReachedPatrol()
	end

	function ENT:OnIdle()
	end

	function ENT:OnMeleeAttack(enemy)
		if not IsValid(enemy) then return end
		if not IsValid(self) then return end
		self.cdAttack = self.cdAttack or 0
		if self.Freeze == true then return end
		if self.cdAttack < CurTime() then
			self.cdAttack = CurTime() + 1
			if self:Health() < 1 then return end
			self:EmitSound( swing_attack[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )
			timer.Simple(0.7, function()
				if self:Health() < 1 then return end
				if IsValid(self) && IsValid(enemy) then
					timer.Simple(0.6, function()
						if IsValid(self) && IsValid(enemy) && enemy:GetPos():Distance(self:GetPos()) < 200 then
							enemy:TakeDamage(self.Damage, self, self)	
							timer.Simple(0.001, function()
								if enemy:Health() <= 0 then
									local currentXP = enemy:getDarkRPVar("xp") or 0
									-- Calcule 50% de l'XP
									local xpToRemove = currentXP * 0.1
									-- Enlève 50% de l'XP au joueur
									enemy:addXP(-xpToRemove)
					
									-- Réinitialise les cristaux
									enemy:SetDataItemSL_INV("crystal", 0)
									enemy:SetDataItemSL_INV("crystal2", 0)
									enemy:SetDataItemSL_INV("crystal3", 0)
									enemy:SetDataItemSL_INV("crystal4", 0)
								end
							end)
							enemy:EmitSound( hitjoueur[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )	
						end
					end)
				end
			end)
			self:PlaySequenceAndMove("attack"..math.random(2), 1, self.FaceEnemy)
		end
	end



		-- Créez une table locale pour stocker les dégâts infligés par chaque joueur pour cet NPC spécifique
	ENT.playerDamage = {}

	function ENT:OnTakeDamage(damage)
		self:SetHP(math.Clamp(self:Health()-damage:GetDamage(),0,self.StartHealth))
		self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 1.5)
		if IsValid(damage:GetAttacker()) and damage:GetAttacker():IsPlayer() then
			local attacker = damage:GetAttacker()
			-- Ajoutez les dégâts infligés à la table du joueur pour cet NPC
			self.playerDamage[attacker] = (self.playerDamage[attacker] or 0) + damage:GetDamage()
		end
	end

	function ENT:OnDeath(dmginfo, hitgroup)
		local totalDamage = 0
		local eligiblePlayers = {} -- Tableau pour stocker les joueurs éligibles

		local ent = ents.Create("mad_crystal")
		ent:SetNWInt("item", "crystal")
		ent:SetPos(self:GetPos() + Vector(0, 0, 20))
		ent:Spawn()

		-- Calculez le total des dégâts infligés pour cet NPC
		for _, damage in pairs(self.playerDamage) do
			totalDamage = totalDamage + damage
		end

		-- Distribuez l'argent équitablement entre les joueurs
		if totalDamage > 0 then
			for player, damage in pairs(self.playerDamage) do
				local moneyEarned = math.floor(self.money * damage / totalDamage)
				local xpEarned = math.floor(self.xp * damage / totalDamage)

				if player:GetUserGroup() == "vip" then
					player:addXP(xpEarned*1.2,true,true)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + ".. xpEarned*1.2 .." XP")
					net.Send(player)
					player:addMoney(moneyEarned*1.2)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned*1.2))
					net.Send(player)
				else
					player:addXP(xpEarned,true,true)
					print(xpEarned)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + "..xpEarned.." XP")
					net.Send(player)
					player:addMoney(moneyEarned)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned))
					net.Send(player)
				end
				
				-- Vérifier si le joueur est éligible pour une compétence
				local playerLevel = player:getDarkRPVar("level")
				local playerClass = player:GetNWInt("Classe")
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe[playerClass] and playerLevel >= skillData.level then
						table.insert(eligiblePlayers, player)
						break
					end
				end
			end
		end
		
		-- Distribution des compétences avec une chance de 10 % par joueur éligible
		for _, player in ipairs(eligiblePlayers) do
			if math.random() <= 0.5 then
				local playerClass = player:GetNWInt("Classe")
				local playerLevel = player:getDarkRPVar("level")
				print("Joueur éligible pour compétence : "..player:Nick())
				local availableSkills = {} -- Tableau pour stocker les compétences disponibles pour ce joueur
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe[playerClass] and playerLevel >= skillData.level and player:HasSkill(skillName) == false then
						if skillData.ismagie == false then
							table.insert(availableSkills, skillName)
						elseif skillData.ismagie == true then
							if player:GetNWInt("Magie") == skillData.element then
								table.insert(availableSkills, skillName)
							end
						end
					end
				end

				-- Sélectionnez une compétence aléatoire parmi les compétences disponibles pour le joueur
				local randomSkill = availableSkills[math.random(#availableSkills)]
				local skillData = SKILLS_SL[randomSkill]

				-- Ajouter la compétence au joueur
				if skillData then
					player:AddDataSkillsSL(randomSkill, skillData.level)
					net.Start("SL:Notification")
					net.WriteString("Vous avez obtenu le skill : "..skillData.name)
					net.Send(player)
				end
			end
		end

		-- Réinitialisez la table des dégâts pour la prochaine instance de NPC
		self.playerDamage = {}

		self:PlaySequenceAndWait("die")
	end
	ENT.DefaultRunSpeed = ENT.RunSpeed
	ENT.DefaultWalkSpeed = ENT.WalkSpeed
	function ENT:Abs_Freeze(bool)
		if bool == true then
			self.Freeze = true
			self.RunSpeed = 0
			self.WalkSpeed = 0
		else
			self.Freeze = false
			self.RunSpeed = self.DefaultRunSpeed
			self.WalkSpeed = self.DefaultWalkSpeed
		end
	end

end

if CLIENT then
	ENT.RenderGroup = RENDERGROUP_OPAQUE
	ENT.HUDMat_Main = Material("mad_sololeveling/mob/boss_hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar = Material("mad_sololeveling/mob/hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar2 = Material("hud/ds1/boss_hpbar_ylw.png", "smooth unlitgeneric")
	local tab = {["$pp_colour_addr"]=0,["$pp_colour_addg"]=0,["$pp_colour_addb"]=0,["$pp_colour_brightness"]=0,["$pp_colour_contrast"]=0.1,["$pp_colour_colour"]=0,["$pp_colour_mulr"]=50, ["$pp_colour_mulg"]=0, ["$pp_colour_mulb"]=0 }
		function ENT:CustomDraw()
			-- if self:GetNetworkVars()["Phantom"]!=nil then
			-- if self:GetPhantom() then
				-- render.SetStencilWriteMask(0xFF)
				-- render.SetStencilTestMask(0xFF)
				-- render.ClearStencil()
				-- render.SetStencilEnable(true)
				-- render.SetStencilReferenceValue(1)
				-- render.SetStencilCompareFunction(STENCIL_ALWAYS)
				-- render.SetStencilPassOperation(STENCIL_REPLACE)
				-- render.SetStencilFailOperation(STENCIL_KEEP)
				-- render.SetStencilZFailOperation(STENCIL_KEEP)
				-- self:DrawModel()
				-- render.SetStencilCompareFunction(STENCIL_EQUAL)
				-- DrawSobel(0.1)
				-- -- halo.Add({self}, Color(255,0,0)) -- crashes the game apparently, epic
				-- DrawColorModify(tab)
				-- DrawMaterialOverlay("effects/tp_refract", 0.02)
				-- DrawMaterialOverlay("effects/water_warp01", -0.01)
				-- render.SetStencilEnable(false)
			-- end
			-- end
			if self:IsDead() and (math.Round(self:GetHPY())<=math.Round(self:GetHP())) then return end
				local angle = EyeAngles()
				angle = Angle(0,angle.y,0)
				angle.y = angle.y + math.sin(CurTime())*10
				angle:RotateAroundAxis(angle:Up(),-90)
				angle:RotateAroundAxis(angle:Forward(),90)
				
				local pos = self:GetBonePosition(self:LookupBone("mixamorig:Head")) + Vector(0,0,self.HPBarOffset)
				cam.Start3D2D(pos,angle,self.HPBarScale)
					local hp = math.Round(self:GetHP())
					local hp2 = math.Round(self:GetHPY())
					local hpmax = self.SpawnHealth
					local text = self.PrintName
					local text2 = tostring(math.Round(self:GetDMGDealt()))
					surface.SetFont("Trebuchet24")
					local tW, tH = surface.GetTextSize(text)
	
					local pad = 0.01
					surface.SetDrawColor(255,255,255,255)
					surface.SetMaterial(self.HUDMat_Bar2)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar2:Width()*1.05)*(hp2/hpmax), self.HUDMat_Bar2:Height()/2, 1)
					surface.SetMaterial(self.HUDMat_Bar)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar:Width()*1.05)*(hp/hpmax), self.HUDMat_Bar:Height()/2, 1)
					surface.SetMaterial(self.HUDMat_Main)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6), -(self.HUDMat_Main:Height()), self.HUDMat_Main:Width()/3, self.HUDMat_Main:Height(), 2)
	
					draw.SimpleText(text, "M_Font5", -(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height()+16), color_white)
					if text2 != "0" then draw.SimpleText(text2, "M_Font5", (self.HUDMat_Main:Width()/6)-16, -(self.HUDMat_Main:Height()+16), color_white) end
				cam.End3D2D()
				-- mobs_hud("Mage Gobelin",self,1,true)
			self:DS1_Draw()
		end
		function ENT:DS1_Draw()
			
		end
	end
	function ENT:SetupDataTables()
		self:NetworkVar("Float", 0, "HP")
		self:NetworkVar("Float", 1, "HPY")
		self:NetworkVar("Float", 2, "DMGDealt")
		self:NetworkVar("Bool", 0, "Phantom")
	end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

--PATH addons/sl_main_system/lua/entities/npc_loup.lua:

if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

local hitjoueur = {
	"mad_sfx_sololeveling/punch/se_Punch_FaceHit.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit01.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit02.ogg"
}

local swing_attack = {
	"mad_sfx_sololeveling/punch/chopper_Punch01.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch02.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch03.ogg"
}

-- Misc --
ENT.PrintName = "Loup"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_loup.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "mob"

-- Stats --
ENT.xp = 675
ENT.money = 100000
ENT.Damage = 45
ENT.SpawnHealth = 5000

ENT.WalkSpeed = 100
ENT.RunSpeed = 220

ENT.HPBarOffset = 15
ENT.HPBarScale = 0.15

-- Detection --
ENT.EyeBone = ""
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 150
ENT.SightRange = 1000
ENT.MinLuminosity = 0
ENT.MaxLuminosity = 1
ENT.HearingCoefficient = 1

-- Sounds --
ENT.OnDamageSounds = {""}
ENT.OnDeathSounds = {""}

-- AI --
ENT.Omniscient = false
ENT.SpotDuration = 10
ENT.RangeAttackRange = 0
ENT.MeleeAttackRange = 30
ENT.ReachEnemyRange = 30
ENT.AvoidEnemyRange = 0

-- Relationships --
ENT.Factions = {FACTION_ZOMBIES}

-- Movements/animations --
ENT.WalkAnimation = ACT_WALK
ENT.WalkAnimRate = 1
ENT.RunAnimation = ACT_RUN
ENT.RunAnimRate = 1
ENT.IdleAnimation = ACT_IDLE
ENT.IdleAnimRate = 1

-- Possession --
ENT.PossessionEnabled = true

if SERVER then

	-- Init/Think --

	function ENT:CustomInitialize()
		self:SetDefaultRelationship(D_HT)
		self:DrawShadow(false)
		self:SetHP(self:Health())
		self:SetHPY(self:Health())

		self.StartHealth = self:Health()
	
		self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE)

		timer.Simple(0, function()
			self:SetHP(self:Health())
			self:SetHPY(self:Health())
			self:SetDMGDealt(0)
		end)
	end


	if CLIENT then
		function ENT:CustomThink()
			if self:GetCooldown("DS1_"..self:GetClass().."_HPYDegrade") <= 0 then
				local var = self:GetHPY()
				self:SetDMGDealt(0)
				self:SetHPY(math.Clamp(var-(self.StartHealth/250),self:Health(),self.StartHealth))
			end
		end
	end

	-- AI --
ENT.Omniscient = false
ENT.SpotDuration = 10

local function SpotTimerName(self, ent)
    return "DrGBaseNB" .. self:GetCreationID() .. "SpotENT" .. ent:GetCreationID()
end

function ENT:SpotEntity(ent)
    if not IsValid(ent) then return end
    if GetConVar("ai_ignoreplayers"):GetBool() then return end
    if ent:IsPlayer() and not ent:Alive() then return end

    if ent:GetNoDraw() == false then
        local distanceThreshold = 300  -- Définissez ici la distance maximale d'aggro
        
        -- Vérifiez si nous avons déjà une cible
        if self.CurrentTarget and IsValid(self.CurrentTarget) then
            local currentDistance = self.CurrentTarget:GetPos():Distance(self:GetPos())
            if currentDistance > distanceThreshold then
                -- Si la cible actuelle est trop loin, réinitialisez-la
                self:LoseEntity(self.CurrentTarget)
                self.CurrentTarget = nil
            else
                -- Si la cible est valide et à portée, ne faites rien
                return
            end
        end

        if self:GetSpotDuration() == 0 then return end
        local spotted = self:HasSpotted(ent)
        self._DrGBaseLastTimeSpotted[ent] = CurTime()
        self._DrGBaseSpotted[ent] = true
        local disp = self:GetRelationship(ent, true)
        
        if disp == D_HT or disp == D_LI or disp == D_FR then
            self._DrGBaseRelationshipCachesSpotted[disp][ent] = true
        end
        
        self:UpdateKnownPosition(ent)
        
        if self._DrGBasePatrolSound and self._DrGBasePatrolSound:GetSound().Entity == ent then
            self:RemovePatrol(self._DrGBasePatrolSound)
        end
        
        if not spotted then
            self:OnSpotted(ent)
            self.CurrentTarget = ent  -- Enregistrer l'entité comme cible actuelle
            if ent:IsPlayer() then
                if ent:GetNoDraw() == true then
                    self:LoseEntity(ent)
                end
                net.Start("DrGBaseNextbotPlayerAwareness")
                net.WriteEntity(self)
                net.WriteBit(true)
                net.Send(ent)
            end
        end
        
        local timerName = SpotTimerName(self, ent)
        timer.Remove(timerName)
        if self:GetSpotDuration() <= 0 then return end
        
        timer.Create(timerName, self:GetSpotDuration(), 1, function()
            if not IsValid(self) or not IsValid(ent) then return end
            self:LoseEntity(ent)
            self.CurrentTarget = nil  -- Réinitialiser la cible actuelle
        end)
    end
end

function ENT:OnReachedPatrol()
end

function ENT:OnIdle()
end

	function ENT:OnMeleeAttack(enemy)
		if not IsValid(enemy) then return end
		if not IsValid(self) then return end
		self.cdAttack = self.cdAttack or 0
		if self.Freeze == true then return end
		if self.cdAttack < CurTime() then
			self.cdAttack = CurTime() + 1
			if self:Health() < 1 then return end
			self:EmitSound( swing_attack[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )
			timer.Simple(0.7, function()
				if self:Health() < 1 then return end
				if IsValid(self) && IsValid(enemy) then
					timer.Simple(1,function()
						if IsValid(self) && IsValid(enemy) && enemy:GetPos():Distance(self:GetPos()) < 200 then
							enemy:TakeDamage(self.Damage, self, self)	
							timer.Simple(0.001, function()
								if enemy:Health() <= 0 then
									local currentXP = enemy:getDarkRPVar("xp") or 0
									-- Calcule 50% de l'XP
									local xpToRemove = currentXP * 0.1
									-- Enlève 50% de l'XP au joueur
									enemy:addXP(-xpToRemove)
					
									-- Réinitialise les cristaux
									enemy:SetDataItemSL_INV("crystal", 0)
									enemy:SetDataItemSL_INV("crystal2", 0)
									enemy:SetDataItemSL_INV("crystal3", 0)
									enemy:SetDataItemSL_INV("crystal4", 0)
								end
							end)
							enemy:EmitSound( hitjoueur[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )	
						end
					end)
				end
			end)
			self:PlaySequenceAndMove("attack"..math.random(2), 1, self.FaceEnemy)
		end
	end




	-- Créez une table locale pour stocker les dégâts infligés par chaque joueur pour cet NPC spécifique
	ENT.playerDamage = {}

	function ENT:OnTakeDamage(damage)
		self:SetHP(math.Clamp(self:Health()-damage:GetDamage(),0,self.StartHealth))
		self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 1.5)
		if IsValid(damage:GetAttacker()) and damage:GetAttacker():IsPlayer() then
			local attacker = damage:GetAttacker()

			-- Ajoutez les dégâts infligés à la table du joueur pour cet NPC
			self.playerDamage[attacker] = (self.playerDamage[attacker] or 0) + damage:GetDamage()
		end
	end

	function ENT:OnDeath(dmginfo, hitgroup)
		local totalDamage = 0
		local eligiblePlayers = {} -- Tableau pour stocker les joueurs éligibles

		local ent = ents.Create("mad_crystal")
		ent:SetNWInt("item", "crystal")
		ent:SetPos(self:GetPos())
		ent:Spawn()
	
		-- Calculez le total des dégâts infligés pour cet NPC
		for _, damage in pairs(self.playerDamage) do
			totalDamage = totalDamage + damage
		end
	
		-- Distribuez l'argent équitablement entre les joueurs
		if totalDamage > 0 then
			for player, damage in pairs(self.playerDamage) do
				local moneyEarned = math.floor(self.money * damage / totalDamage)
				local xpEarned = math.floor(self.xp * damage / totalDamage)
	
				if player:GetUserGroup() == "vip" then
					player:addXP(xpEarned*1.2,true,true)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + ".. xpEarned*1.2 .." XP")
					net.Send(player)
					player:addMoney(moneyEarned*1.2)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned*1.2))
					net.Send(player)
				else
					player:addXP(xpEarned,true,true)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + "..xpEarned.." XP")
					net.Send(player)
					player:addMoney(moneyEarned)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned))
					net.Send(player)
				end

				-- Vérifier si le joueur est éligible pour une compétence
				local playerLevel = player:getDarkRPVar("level")
				local playerClass = player:GetNWInt("Classe")
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe[playerClass] and playerLevel >= skillData.level then
						table.insert(eligiblePlayers, player)
						break
					end
				end
			end
		end
	
		-- Distribution des compétences avec une chance de 10 % par joueur éligible
		for _, player in ipairs(eligiblePlayers) do
			if math.random() <= 0.5 then
				local playerClass = player:GetNWInt("Classe")
				local playerLevel = player:getDarkRPVar("level")
				local availableSkills = {} -- Tableau pour stocker les compétences disponibles pour ce joueur
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe[playerClass] and playerLevel >= skillData.level and player:HasSkill(skillName) == false then
						if skillData.ismagie == false then
							table.insert(availableSkills, skillName)
						elseif skillData.ismagie == true then
							if player:GetNWInt("Magie") == skillData.element then
								table.insert(availableSkills, skillName)
							end
						end
					end
				end
	
				-- Sélectionnez une compétence aléatoire parmi les compétences disponibles pour le joueur
				local randomSkill = availableSkills[math.random(#availableSkills)]
				local skillData = SKILLS_SL[randomSkill]
	
				-- Ajouter la compétence au joueur
				if skillData then
					player:AddDataSkillsSL(randomSkill, skillData.level)
					net.Start("SL:Notification")
					net.WriteString("Vous avez obtenu le skill : "..skillData.name)
					net.Send(player)
				end
			end
		end
	
		-- Réinitialisez la table des dégâts pour la prochaine instance de NPC
		self.playerDamage = {}
	
		self:PlaySequenceAndWait("die")
	end
	function ENT:Abs_Freeze(bool)
		if bool == true then
			self.Freeze = true
			self.RunSpeed = 0
			self.WalkSpeed = 0
		else
			self.Freeze = false
			self.RunSpeed = self.DefaultRunSpeed
			self.WalkSpeed = self.DefaultWalkSpeed
		end
	end


end

if CLIENT then
	ENT.RenderGroup = RENDERGROUP_OPAQUE
	ENT.HUDMat_Main = Material("mad_sololeveling/mob/boss_hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar = Material("mad_sololeveling/mob/hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar2 = Material("hud/ds1/boss_hpbar_ylw.png", "smooth unlitgeneric")
	local tab = {["$pp_colour_addr"]=0,["$pp_colour_addg"]=0,["$pp_colour_addb"]=0,["$pp_colour_brightness"]=0,["$pp_colour_contrast"]=0.1,["$pp_colour_colour"]=0,["$pp_colour_mulr"]=50, ["$pp_colour_mulg"]=0, ["$pp_colour_mulb"]=0 }
		function ENT:CustomDraw()
			-- if self:GetNetworkVars()["Phantom"]!=nil then
			-- if self:GetPhantom() then
				-- render.SetStencilWriteMask(0xFF)
				-- render.SetStencilTestMask(0xFF)
				-- render.ClearStencil()
				-- render.SetStencilEnable(true)
				-- render.SetStencilReferenceValue(1)
				-- render.SetStencilCompareFunction(STENCIL_ALWAYS)
				-- render.SetStencilPassOperation(STENCIL_REPLACE)
				-- render.SetStencilFailOperation(STENCIL_KEEP)
				-- render.SetStencilZFailOperation(STENCIL_KEEP)
				-- self:DrawModel()
				-- render.SetStencilCompareFunction(STENCIL_EQUAL)
				-- DrawSobel(0.1)
				-- -- halo.Add({self}, Color(255,0,0)) -- crashes the game apparently, epic
				-- DrawColorModify(tab)
				-- DrawMaterialOverlay("effects/tp_refract", 0.02)
				-- DrawMaterialOverlay("effects/water_warp01", -0.01)
				-- render.SetStencilEnable(false)
			-- end
			-- end
			if self:IsDead() and (math.Round(self:GetHPY())<=math.Round(self:GetHP())) then return end
				local angle = EyeAngles()
				angle = Angle(0,angle.y,0)
				angle.y = angle.y + math.sin(CurTime())*10
				angle:RotateAroundAxis(angle:Up(),-90)
				angle:RotateAroundAxis(angle:Forward(),90)
				
				local pos = self:GetBonePosition(self:LookupBone("G_head_def")) + Vector(0,0,self.HPBarOffset)
				cam.Start3D2D(pos,angle,self.HPBarScale)
					local hp = math.Round(self:GetHP())
					local hp2 = math.Round(self:GetHPY())
					local hpmax = self.SpawnHealth
					local text = self.PrintName
					local text2 = tostring(math.Round(self:GetDMGDealt()))
					surface.SetFont("Trebuchet24")
					local tW, tH = surface.GetTextSize(text)
	
					local pad = 0.01
					surface.SetDrawColor(255,255,255,255)
					surface.SetMaterial(self.HUDMat_Bar2)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar2:Width()*1.05)*(hp2/hpmax), self.HUDMat_Bar2:Height()/2, 1)
					surface.SetMaterial(self.HUDMat_Bar)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar:Width()*1.05)*(hp/hpmax), self.HUDMat_Bar:Height()/2, 1)
					surface.SetMaterial(self.HUDMat_Main)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6), -(self.HUDMat_Main:Height()), self.HUDMat_Main:Width()/3, self.HUDMat_Main:Height(), 2)
	
					draw.SimpleText(text, "M_Font5", -(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height()+16), color_white)
					if text2 != "0" then draw.SimpleText(text2, "M_Font5", (self.HUDMat_Main:Width()/6)-16, -(self.HUDMat_Main:Height()+16), color_white) end
				cam.End3D2D()
			self:DS1_Draw()
		end
		function ENT:DS1_Draw()
			
		end
	end
	function ENT:SetupDataTables()
		self:NetworkVar("Float", 0, "HP")
		self:NetworkVar("Float", 1, "HPY")
		self:NetworkVar("Float", 2, "DMGDealt")
		self:NetworkVar("Bool", 0, "Phantom")
	end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

--PATH addons/sl_main_system/lua/entities/npc_loupevo.lua:

if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

local hitjoueur = {
	"mad_sfx_sololeveling/punch/se_Punch_FaceHit.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit01.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit02.ogg"
}

local swing_attack = {
	"mad_sfx_sololeveling/punch/chopper_Punch01.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch02.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch03.ogg"
}

-- Misc --
ENT.PrintName = "Loup Tranchant"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_loupevo.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "mob"

-- Stats --
ENT.xp = 1012
ENT.money = 100000
ENT.Damage = 55
ENT.SpawnHealth = 6000

ENT.WalkSpeed = 100
ENT.RunSpeed = 220

ENT.HPBarOffset = 20
ENT.HPBarScale = 0.2

-- Detection --
ENT.EyeBone = ""
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 150
ENT.SightRange = 1000
ENT.MinLuminosity = 0
ENT.MaxLuminosity = 1
ENT.HearingCoefficient = 1

-- Sounds --
ENT.OnDamageSounds = {""}
ENT.OnDeathSounds = {""}

-- AI --
ENT.Omniscient = false
ENT.SpotDuration = 10
ENT.RangeAttackRange = 0
ENT.MeleeAttackRange = 30
ENT.ReachEnemyRange = 30
ENT.AvoidEnemyRange = 0

-- Relationships --
ENT.Factions = {FACTION_ZOMBIES}

-- Movements/animations --
ENT.WalkAnimation = ACT_WALK
ENT.WalkAnimRate = 1
ENT.RunAnimation = ACT_RUN
ENT.RunAnimRate = 1
ENT.IdleAnimation = ACT_IDLE
ENT.IdleAnimRate = 1

-- Possession --
ENT.PossessionEnabled = true

if SERVER then

	-- Init/Think --

	function ENT:CustomInitialize()
		self:SetDefaultRelationship(D_HT)
		self:DrawShadow(false)
		self:SetHP(self:Health())
		self:SetHPY(self:Health())
		self:SetModelScale(1.2)

		self.StartHealth = self:Health()

		self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE)
	
		timer.Simple(0, function()
			self:SetHP(self:Health())
			self:SetHPY(self:Health())
			self:SetDMGDealt(0)
		end)
	end


	if CLIENT then
		function ENT:CustomThink()
			if self:GetCooldown("DS1_"..self:GetClass().."_HPYDegrade") <= 0 then
				local var = self:GetHPY()
				self:SetDMGDealt(0)
				self:SetHPY(math.Clamp(var-(self.StartHealth/250),self:Health(),self.StartHealth))
			end
		end
	end

	-- AI --
ENT.Omniscient = false
ENT.SpotDuration = 10

local function SpotTimerName(self, ent)
    return "DrGBaseNB" .. self:GetCreationID() .. "SpotENT" .. ent:GetCreationID()
end

function ENT:SpotEntity(ent)
    if not IsValid(ent) then return end
    if GetConVar("ai_ignoreplayers"):GetBool() then return end
    if ent:IsPlayer() and not ent:Alive() then return end

    if ent:GetNoDraw() == false then
        local distanceThreshold = 300  -- Définissez ici la distance maximale d'aggro
        
        -- Vérifiez si nous avons déjà une cible
        if self.CurrentTarget and IsValid(self.CurrentTarget) then
            local currentDistance = self.CurrentTarget:GetPos():Distance(self:GetPos())
            if currentDistance > distanceThreshold then
                -- Si la cible actuelle est trop loin, réinitialisez-la
                self:LoseEntity(self.CurrentTarget)
                self.CurrentTarget = nil
            else
                -- Si la cible est valide et à portée, ne faites rien
                return
            end
        end

        if self:GetSpotDuration() == 0 then return end
        local spotted = self:HasSpotted(ent)
        self._DrGBaseLastTimeSpotted[ent] = CurTime()
        self._DrGBaseSpotted[ent] = true
        local disp = self:GetRelationship(ent, true)
        
        if disp == D_HT or disp == D_LI or disp == D_FR then
            self._DrGBaseRelationshipCachesSpotted[disp][ent] = true
        end
        
        self:UpdateKnownPosition(ent)
        
        if self._DrGBasePatrolSound and self._DrGBasePatrolSound:GetSound().Entity == ent then
            self:RemovePatrol(self._DrGBasePatrolSound)
        end
        
        if not spotted then
            self:OnSpotted(ent)
            self.CurrentTarget = ent  -- Enregistrer l'entité comme cible actuelle
            if ent:IsPlayer() then
                if ent:GetNoDraw() == true then
                    self:LoseEntity(ent)
                end
                net.Start("DrGBaseNextbotPlayerAwareness")
                net.WriteEntity(self)
                net.WriteBit(true)
                net.Send(ent)
            end
        end
        
        local timerName = SpotTimerName(self, ent)
        timer.Remove(timerName)
        if self:GetSpotDuration() <= 0 then return end
        
        timer.Create(timerName, self:GetSpotDuration(), 1, function()
            if not IsValid(self) or not IsValid(ent) then return end
            self:LoseEntity(ent)
            self.CurrentTarget = nil  -- Réinitialiser la cible actuelle
        end)
    end
end

function ENT:OnReachedPatrol()
end

function ENT:OnIdle()
end

	function ENT:OnMeleeAttack(enemy)
		if not IsValid(enemy) then return end
		if not IsValid(self) then return end
		self.cdAttack = self.cdAttack or 0
		if self.Freeze == true then return end
		if self.cdAttack < CurTime() then
			self.cdAttack = CurTime() + 1
			if self:Health() < 1 then return end
			self:EmitSound( swing_attack[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )
			timer.Simple(0.7, function()
				if self:Health() < 1 then return end
				if IsValid(self) && IsValid(enemy) then
					timer.Simple(1,function()
						if IsValid(self) && IsValid(enemy) && enemy:GetPos():Distance(self:GetPos()) < 200 then
							enemy:TakeDamage(self.Damage, self, self)	
							timer.Simple(0.001, function()
								if enemy:Health() <= 0 then
									local currentXP = enemy:getDarkRPVar("xp") or 0
									-- Calcule 50% de l'XP
									local xpToRemove = currentXP * 0.1
									-- Enlève 50% de l'XP au joueur
									enemy:addXP(-xpToRemove)
					
									-- Réinitialise les cristaux
									enemy:SetDataItemSL_INV("crystal", 0)
									enemy:SetDataItemSL_INV("crystal2", 0)
									enemy:SetDataItemSL_INV("crystal3", 0)
									enemy:SetDataItemSL_INV("crystal4", 0)
								end
							end)
							enemy:EmitSound( hitjoueur[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )	
						end
					end)
				end
			end)
			self:PlaySequenceAndMove("attack"..math.random(2), 1, self.FaceEnemy)
		end
	end




	-- Créez une table locale pour stocker les dégâts infligés par chaque joueur pour cet NPC spécifique
	ENT.playerDamage = {}

	function ENT:OnTakeDamage(damage)
		self:SetHP(math.Clamp(self:Health()-damage:GetDamage(),0,self.StartHealth))
		self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 1.5)
		if IsValid(damage:GetAttacker()) and damage:GetAttacker():IsPlayer() then
			local attacker = damage:GetAttacker()

			-- Ajoutez les dégâts infligés à la table du joueur pour cet NPC
			self.playerDamage[attacker] = (self.playerDamage[attacker] or 0) + damage:GetDamage()
		end
	end

	function ENT:OnDeath(dmginfo, hitgroup)
		local totalDamage = 0
		local eligiblePlayers = {} -- Tableau pour stocker les joueurs éligibles

		local ent = ents.Create("mad_crystal")
		ent:SetNWInt("item", "crystal")
		ent:SetPos(self:GetPos())
		ent:Spawn()
	
		-- Calculez le total des dégâts infligés pour cet NPC
		for _, damage in pairs(self.playerDamage) do
			totalDamage = totalDamage + damage
		end
	
		-- Distribuez l'argent équitablement entre les joueurs
		if totalDamage > 0 then
			for player, damage in pairs(self.playerDamage) do
				local moneyEarned = math.floor(self.money * damage / totalDamage)
				local xpEarned = math.floor(self.xp * damage / totalDamage)
	
				if player:GetUserGroup() == "vip" then
					player:addXP(xpEarned*1.2,true,true)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + ".. xpEarned*1.2 .." XP")
					net.Send(player)
					player:addMoney(moneyEarned*1.2)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned*1.2))
					net.Send(player)
				else
					player:addXP(xpEarned,true,true)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + "..xpEarned.." XP")
					net.Send(player)
					player:addMoney(moneyEarned)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned))
					net.Send(player)
				end

				-- Vérifier si le joueur est éligible pour une compétence
				local playerLevel = player:getDarkRPVar("level")
				local playerClass = player:GetNWInt("Classe")
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe[playerClass] and playerLevel >= skillData.level then
						table.insert(eligiblePlayers, player)
						break
					end
				end
			end
		end
	
		-- Distribution des compétences avec une chance de 10 % par joueur éligible
		for _, player in ipairs(eligiblePlayers) do
			if math.random() <= 0.5 then
				local playerClass = player:GetNWInt("Classe")
				local playerLevel = player:getDarkRPVar("level")
				local availableSkills = {} -- Tableau pour stocker les compétences disponibles pour ce joueur
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe[playerClass] and playerLevel >= skillData.level and player:HasSkill(skillName) == false then
						if skillData.ismagie == false then
							table.insert(availableSkills, skillName)
						elseif skillData.ismagie == true then
							if player:GetNWInt("Magie") == skillData.element then
								table.insert(availableSkills, skillName)
							end
						end
					end
				end
	
				-- Sélectionnez une compétence aléatoire parmi les compétences disponibles pour le joueur
				local randomSkill = availableSkills[math.random(#availableSkills)]
				local skillData = SKILLS_SL[randomSkill]
	
				-- Ajouter la compétence au joueur
				if skillData then
					player:AddDataSkillsSL(randomSkill, skillData.level)
					net.Start("SL:Notification")
					net.WriteString("Vous avez obtenu le skill : "..skillData.name)
					net.Send(player)
				end
			end
		end
	
		-- Réinitialisez la table des dégâts pour la prochaine instance de NPC
		self.playerDamage = {}
	
		self:PlaySequenceAndWait("die")
	end
	function ENT:Abs_Freeze(bool)
		if bool == true then
			self.Freeze = true
			self.RunSpeed = 0
			self.WalkSpeed = 0
		else
			self.Freeze = false
			self.RunSpeed = self.DefaultRunSpeed
			self.WalkSpeed = self.DefaultWalkSpeed
		end
	end

end

if CLIENT then
	ENT.RenderGroup = RENDERGROUP_OPAQUE
	ENT.HUDMat_Main = Material("mad_sololeveling/mob/boss_hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar = Material("mad_sololeveling/mob/hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar2 = Material("hud/ds1/boss_hpbar_ylw.png", "smooth unlitgeneric")
	local tab = {["$pp_colour_addr"]=0,["$pp_colour_addg"]=0,["$pp_colour_addb"]=0,["$pp_colour_brightness"]=0,["$pp_colour_contrast"]=0.1,["$pp_colour_colour"]=0,["$pp_colour_mulr"]=50, ["$pp_colour_mulg"]=0, ["$pp_colour_mulb"]=0 }
		function ENT:CustomDraw()
			-- if self:GetNetworkVars()["Phantom"]!=nil then
			-- if self:GetPhantom() then
				-- render.SetStencilWriteMask(0xFF)
				-- render.SetStencilTestMask(0xFF)
				-- render.ClearStencil()
				-- render.SetStencilEnable(true)
				-- render.SetStencilReferenceValue(1)
				-- render.SetStencilCompareFunction(STENCIL_ALWAYS)
				-- render.SetStencilPassOperation(STENCIL_REPLACE)
				-- render.SetStencilFailOperation(STENCIL_KEEP)
				-- render.SetStencilZFailOperation(STENCIL_KEEP)
				-- self:DrawModel()
				-- render.SetStencilCompareFunction(STENCIL_EQUAL)
				-- DrawSobel(0.1)
				-- -- halo.Add({self}, Color(255,0,0)) -- crashes the game apparently, epic
				-- DrawColorModify(tab)
				-- DrawMaterialOverlay("effects/tp_refract", 0.02)
				-- DrawMaterialOverlay("effects/water_warp01", -0.01)
				-- render.SetStencilEnable(false)
			-- end
			-- end
			if self:IsDead() and (math.Round(self:GetHPY())<=math.Round(self:GetHP())) then return end
				local angle = EyeAngles()
				angle = Angle(0,angle.y,0)
				angle.y = angle.y + math.sin(CurTime())*10
				angle:RotateAroundAxis(angle:Up(),-90)
				angle:RotateAroundAxis(angle:Forward(),90)
				
				local pos = self:GetBonePosition(self:LookupBone("G_head_def")) + Vector(0,0,self.HPBarOffset)
				cam.Start3D2D(pos,angle,self.HPBarScale)
					local hp = math.Round(self:GetHP())
					local hp2 = math.Round(self:GetHPY())
					local hpmax = self.SpawnHealth
					local text = self.PrintName
					local text2 = tostring(math.Round(self:GetDMGDealt()))
					surface.SetFont("Trebuchet24")
					local tW, tH = surface.GetTextSize(text)
	
					local pad = 0.01
					surface.SetDrawColor(255,255,255,255)
					surface.SetMaterial(self.HUDMat_Bar2)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar2:Width()*1.05)*(hp2/hpmax), self.HUDMat_Bar2:Height()/2, 1)
					surface.SetMaterial(self.HUDMat_Bar)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar:Width()*1.05)*(hp/hpmax), self.HUDMat_Bar:Height()/2, 1)
					surface.SetMaterial(self.HUDMat_Main)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6), -(self.HUDMat_Main:Height()), self.HUDMat_Main:Width()/3, self.HUDMat_Main:Height(), 2)
	
					draw.SimpleText(text, "M_Font5", -(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height()+16), color_white)
					if text2 != "0" then draw.SimpleText(text2, "M_Font5", (self.HUDMat_Main:Width()/6)-16, -(self.HUDMat_Main:Height()+16), color_white) end
				cam.End3D2D()
			self:DS1_Draw()
		end
		function ENT:DS1_Draw()
			
		end
	end
	function ENT:SetupDataTables()
		self:NetworkVar("Float", 0, "HP")
		self:NetworkVar("Float", 1, "HPY")
		self:NetworkVar("Float", 2, "DMGDealt")
		self:NetworkVar("Bool", 0, "Phantom")
	end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

--PATH addons/sl_main_system/lua/entities/npc_loupevo2.lua:

if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

local hitjoueur = {
	"mad_sfx_sololeveling/punch/se_Punch_FaceHit.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit01.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit02.ogg"
}

local swing_attack = {
	"mad_sfx_sololeveling/punch/chopper_Punch01.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch02.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch03.ogg"
}

-- Misc --
ENT.PrintName = "Loup Tranchant Neigeux"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_loupevo2.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "boss"

-- Stats --
ENT.xp = 1518
ENT.money = 400000
ENT.Damage = 85
ENT.SpecialDamage = 125
ENT.SpawnHealth = 8000

ENT.WalkSpeed = 100
ENT.RunSpeed = 330

ENT.HPBarOffset = 35
ENT.HPBarScale = 0.5

-- Detection --
ENT.EyeBone = ""
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 150
ENT.SightRange = 1000
ENT.MinLuminosity = 0
ENT.MaxLuminosity = 1
ENT.HearingCoefficient = 1

-- Sounds --
ENT.OnDamageSounds = {""}
ENT.OnDeathSounds = {""}

-- AI --
ENT.Omniscient = false
ENT.SpotDuration = 10
ENT.RangeAttackRange = 0
ENT.MeleeAttackRange = 100
ENT.ReachEnemyRange = 100
ENT.AvoidEnemyRange = 0

-- Relationships --
ENT.Factions = {FACTION_ZOMBIES}

-- Movements/animations --
ENT.WalkAnimation = ACT_WALK
ENT.WalkAnimRate = 1
ENT.RunAnimation = ACT_RUN
ENT.RunAnimRate = 1
ENT.IdleAnimation = ACT_IDLE
ENT.IdleAnimRate = 1

-- Possession --
ENT.PossessionEnabled = true

if SERVER then

	-- Init/Think --

	function ENT:CustomInitialize()
		self:SetDefaultRelationship(D_HT)
		self:DrawShadow(false)
		self:SetHP(self:Health())
		self:SetHPY(self:Health())
		self:SetModelScale(3)

		self.StartHealth = self:Health()

		self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE)
	
		timer.Simple(0, function()
			self:SetHP(self:Health())
			self:SetHPY(self:Health())
			self:SetDMGDealt(0)
		end)
	end


	if CLIENT then
		function ENT:CustomThink()
			if self:GetCooldown("DS1_"..self:GetClass().."_HPYDegrade") <= 0 then
				local var = self:GetHPY()
				self:SetDMGDealt(0)
				self:SetHPY(math.Clamp(var-(self.StartHealth/250),self:Health(),self.StartHealth))
			end
		end
	end

	-- AI --
ENT.Omniscient = false
ENT.SpotDuration = 10

local function SpotTimerName(self, ent)
    return "DrGBaseNB" .. self:GetCreationID() .. "SpotENT" .. ent:GetCreationID()
end

function ENT:SpotEntity(ent)
    if not IsValid(ent) then return end
    if GetConVar("ai_ignoreplayers"):GetBool() then return end
    if ent:IsPlayer() and not ent:Alive() then return end

    if ent:GetNoDraw() == false then
        local distanceThreshold = 300  -- Définissez ici la distance maximale d'aggro
        
        -- Vérifiez si nous avons déjà une cible
        if self.CurrentTarget and IsValid(self.CurrentTarget) then
            local currentDistance = self.CurrentTarget:GetPos():Distance(self:GetPos())
            if currentDistance > distanceThreshold then
                -- Si la cible actuelle est trop loin, réinitialisez-la
                self:LoseEntity(self.CurrentTarget)
                self.CurrentTarget = nil
            else
                -- Si la cible est valide et à portée, ne faites rien
                return
            end
        end

        if self:GetSpotDuration() == 0 then return end
        local spotted = self:HasSpotted(ent)
        self._DrGBaseLastTimeSpotted[ent] = CurTime()
        self._DrGBaseSpotted[ent] = true
        local disp = self:GetRelationship(ent, true)
        
        if disp == D_HT or disp == D_LI or disp == D_FR then
            self._DrGBaseRelationshipCachesSpotted[disp][ent] = true
        end
        
        self:UpdateKnownPosition(ent)
        
        if self._DrGBasePatrolSound and self._DrGBasePatrolSound:GetSound().Entity == ent then
            self:RemovePatrol(self._DrGBasePatrolSound)
        end
        
        if not spotted then
            self:OnSpotted(ent)
            self.CurrentTarget = ent  -- Enregistrer l'entité comme cible actuelle
            if ent:IsPlayer() then
                if ent:GetNoDraw() == true then
                    self:LoseEntity(ent)
                end
                net.Start("DrGBaseNextbotPlayerAwareness")
                net.WriteEntity(self)
                net.WriteBit(true)
                net.Send(ent)
            end
        end
        
        local timerName = SpotTimerName(self, ent)
        timer.Remove(timerName)
        if self:GetSpotDuration() <= 0 then return end
        
        timer.Create(timerName, self:GetSpotDuration(), 1, function()
            if not IsValid(self) or not IsValid(ent) then return end
            self:LoseEntity(ent)
            self.CurrentTarget = nil  -- Réinitialiser la cible actuelle
        end)
    end
end

function ENT:OnReachedPatrol()
end

function ENT:OnIdle()
end

function ENT:OnMeleeAttack(enemy)
	if not IsValid(enemy) then return end
	if not IsValid(self) then return end
	self.cdAttack = self.cdAttack or 0
	if self.Freeze == true then return end
	self.cdSpecialAttack = self.cdSpecialAttack or 0  -- Cooldown pour l'attaque spéciale

	-- Vérifie si l'attaque spéciale est prête à être utilisée
	if self.cdSpecialAttack < CurTime() then
		self:OnSpecialAttack(enemy)
		return
	end

	-- Exécution de l'attaque normale
	if self.cdAttack < CurTime() then
		self.cdAttack = CurTime() + 1
		if self:Health() < 1 then return end
		self:EmitSound(swing_attack[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO)
		timer.Simple(0.7, function()
			if self:Health() < 1 then return end
			if IsValid(self) and IsValid(enemy) then
				timer.Simple(0.5,function()
					if enemy:GetPos():Distance(self:GetPos()) < 200 then
						enemy:TakeDamage(self.Damage, self, self)
						timer.Simple(0.001, function()
							if enemy:Health() <= 0 then
								local currentXP = enemy:getDarkRPVar("xp") or 0
								-- Calcule 50% de l'XP
								local xpToRemove = currentXP * 0.1
								-- Enlève 50% de l'XP au joueur
								enemy:addXP(-xpToRemove)
				
								-- Réinitialise les cristaux
								enemy:SetDataItemSL_INV("crystal", 0)
								enemy:SetDataItemSL_INV("crystal2", 0)
								enemy:SetDataItemSL_INV("crystal3", 0)
								enemy:SetDataItemSL_INV("crystal4", 0)
							end
						end)
						enemy:EmitSound(hitjoueur[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO)
					end
				end)
			end
		end)
		self:PlaySequenceAndMove("attack"..math.random(2), 1, self.FaceEnemy)
	end
end

function ENT:OnSpecialAttack(enemy)
	if not IsValid(enemy) then return end
	if not IsValid(self) then return end
	if self.Freeze == true then return end
	self.cdSpecialAttack = CurTime() + 10  -- Cooldown de 10 secondes pour l'attaque spéciale

	if self:Health() < 1 then return end
	self:EmitSound("mad_sfx_sololeveling/bestial/roar2.mp3", 75, math.random(70, 80), 0.8, CHAN_AUTO)
	timer.Simple(0.001, function() ParticleEffect( "dust_conquer_charge", self:GetPos(), self:GetAngles(), self ) end)
	timer.Simple(0.001, function() ParticleEffect( "dust_sharp_shockwave", self:GetPos(), self:GetAngles(), self ) end)
	timer.Simple(0.001, function() ParticleEffect( "auraburst_sharp", self:GetPos(), self:GetAngles(), self ) end)

	local zone = ents.Create("mad_zone_radius")
	zone:SetNWInt("Radius", 2500)
	if IsValid(zone) then
		zone:SetModel("models/effects/teleporttrail.mdl")  -- Modèle arbitraire
		zone:SetPos(self:GetPos())
		zone:SetModelScale(0.001)
		zone:Spawn()
		zone:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		zone:SetNoDraw(false)  -- Rendre l'entité invisible
		zone:SetParent(self)

		-- Supprimer l'entité "mad_zone_radius" après l'attaque spéciale
		timer.Simple(1.4, function()
			if IsValid(zone) then
				zone:Remove()
			end
		end)
	end

	-- Délai avant l'attaque spéciale
	timer.Simple(1.4, function()
		if self:Health() < 1 then return end
		if IsValid(self) and IsValid(enemy) then
			local entities = ents.FindInSphere(self:GetPos(), 250)  -- Trouver les entités dans un rayon de 330 unités
			for _, ent in pairs(entities) do
				if ent:IsPlayer() or ent:IsNPC() then
					ent:TakeDamage(self.SpecialDamage, self, self)
					timer.Simple(0.001, function()
						if ent:Health() <= 0 then
							local currentXP = ent:getDarkRPVar("xp") or 0
							-- Calcule 50% de l'XP
							local xpToRemove = currentXP * 0.5
							-- Enlève 50% de l'XP au joueur
							ent:addXP(-xpToRemove)
			
							-- Réinitialise les cristaux
							ent:SetDataItemSL_INV("crystal", 0)
							ent:SetDataItemSL_INV("crystal2", 0)
							ent:SetDataItemSL_INV("crystal3", 0)
							ent:SetDataItemSL_INV("crystal4", 0)
						end
					end)
					ent:SetVelocity(self:GetForward()*150 + ent:GetUp()*500)
					ent:EmitSound(hitjoueur[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO)
				end
			end
		end
	end)
	self:PlaySequenceAndMove("attack"..math.random(1), 0.5, self.FaceEnemy)
end




	-- Créez une table locale pour stocker les dégâts infligés par chaque joueur pour cet NPC spécifique
	ENT.playerDamage = {}

	function ENT:OnTakeDamage(damage)
		self:SetHP(math.Clamp(self:Health()-damage:GetDamage(),0,self.StartHealth))
		self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 1.5)
		if IsValid(damage:GetAttacker()) and damage:GetAttacker():IsPlayer() then
			local attacker = damage:GetAttacker()

			-- Ajoutez les dégâts infligés à la table du joueur pour cet NPC
			self.playerDamage[attacker] = (self.playerDamage[attacker] or 0) + damage:GetDamage()
		end
	end

	function ENT:OnDeath(dmginfo, hitgroup)
		local totalDamage = 0
		local eligiblePlayers = {} -- Tableau pour stocker les joueurs éligibles

		local ent = ents.Create("mad_crystal")
		ent:SetNWInt("item", "crystal2")
		ent:SetPos(self:GetPos())
		ent:Spawn()
	
		-- Calculez le total des dégâts infligés pour cet NPC
		for _, damage in pairs(self.playerDamage) do
			totalDamage = totalDamage + damage
		end
	
		-- Distribuez l'argent équitablement entre les joueurs
		if totalDamage > 0 then
			for player, damage in pairs(self.playerDamage) do
				local moneyEarned = math.floor(self.money * damage / totalDamage)
				local xpEarned = math.floor(self.xp * damage / totalDamage)
	
				if player:GetUserGroup() == "vip" then
					player:addXP(xpEarned*1.2,true,true)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + ".. xpEarned*1.2 .." XP")
					net.Send(player)
					player:addMoney(moneyEarned*1.2)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned*1.2))
					net.Send(player)
				else
					player:addXP(xpEarned,true,true)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + "..xpEarned.." XP")
					net.Send(player)
					player:addMoney(moneyEarned)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned))
					net.Send(player)
				end

				-- Vérifier si le joueur est éligible pour une compétence
				local playerLevel = player:getDarkRPVar("level")
				local playerClass = player:GetNWInt("Classe")
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe[playerClass] and playerLevel >= skillData.level then
						table.insert(eligiblePlayers, player)
						break
					end
				end
			end
		end
	
		-- Distribution des compétences avec une chance de 10 % par joueur éligible
		for _, player in ipairs(eligiblePlayers) do
			if math.random() <= 0.6 then
				local playerClass = player:GetNWInt("Classe")
				local playerLevel = player:getDarkRPVar("level")
				local availableSkills = {} -- Tableau pour stocker les compétences disponibles pour ce joueur
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe[playerClass] and playerLevel >= skillData.level and player:HasSkill(skillName) == false then
						if skillData.ismagie == false then
							table.insert(availableSkills, skillName)
						elseif skillData.ismagie == true then
							if player:GetNWInt("Magie") == skillData.element then
								table.insert(availableSkills, skillName)
							end
						end
					end
				end
	
				-- Sélectionnez une compétence aléatoire parmi les compétences disponibles pour le joueur
				local randomSkill = availableSkills[math.random(#availableSkills)]
				local skillData = SKILLS_SL[randomSkill]
	
				-- Ajouter la compétence au joueur
				if skillData then
					player:AddDataSkillsSL(randomSkill, skillData.level)
					net.Start("SL:Notification")
					net.WriteString("Vous avez obtenu le skill : "..skillData.name)
					net.Send(player)
				end
			end
		end
	
		-- Réinitialisez la table des dégâts pour la prochaine instance de NPC
		self.playerDamage = {}
	
		self:PlaySequenceAndWait("die")
	end
	function ENT:Abs_Freeze(bool)
		if bool == true then
			self.Freeze = true
			self.RunSpeed = 0
			self.WalkSpeed = 0
		else
			self.Freeze = false
			self.RunSpeed = self.DefaultRunSpeed
			self.WalkSpeed = self.DefaultWalkSpeed
		end
	end


end

if CLIENT then
	ENT.RenderGroup = RENDERGROUP_OPAQUE
	ENT.HUDMat_Main = Material("mad_sololeveling/mob/boss_hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar = Material("mad_sololeveling/mob/hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar2 = Material("hud/ds1/boss_hpbar_ylw.png", "smooth unlitgeneric")
	local tab = {["$pp_colour_addr"]=0,["$pp_colour_addg"]=0,["$pp_colour_addb"]=0,["$pp_colour_brightness"]=0,["$pp_colour_contrast"]=0.1,["$pp_colour_colour"]=0,["$pp_colour_mulr"]=50, ["$pp_colour_mulg"]=0, ["$pp_colour_mulb"]=0 }
		function ENT:CustomDraw()
			-- if self:GetNetworkVars()["Phantom"]!=nil then
			-- if self:GetPhantom() then
				-- render.SetStencilWriteMask(0xFF)
				-- render.SetStencilTestMask(0xFF)
				-- render.ClearStencil()
				-- render.SetStencilEnable(true)
				-- render.SetStencilReferenceValue(1)
				-- render.SetStencilCompareFunction(STENCIL_ALWAYS)
				-- render.SetStencilPassOperation(STENCIL_REPLACE)
				-- render.SetStencilFailOperation(STENCIL_KEEP)
				-- render.SetStencilZFailOperation(STENCIL_KEEP)
				-- self:DrawModel()
				-- render.SetStencilCompareFunction(STENCIL_EQUAL)
				-- DrawSobel(0.1)
				-- -- halo.Add({self}, Color(255,0,0)) -- crashes the game apparently, epic
				-- DrawColorModify(tab)
				-- DrawMaterialOverlay("effects/tp_refract", 0.02)
				-- DrawMaterialOverlay("effects/water_warp01", -0.01)
				-- render.SetStencilEnable(false)
			-- end
			-- end
			if self:IsDead() and (math.Round(self:GetHPY())<=math.Round(self:GetHP())) then return end
				local angle = EyeAngles()
				angle = Angle(0,angle.y,0)
				angle.y = angle.y + math.sin(CurTime())*10
				angle:RotateAroundAxis(angle:Up(),-90)
				angle:RotateAroundAxis(angle:Forward(),90)
				
				local pos = self:GetBonePosition(self:LookupBone("G_head_def")) + Vector(0,0,self.HPBarOffset)
				cam.Start3D2D(pos,angle,self.HPBarScale)
					local hp = math.Round(self:GetHP())
					local hp2 = math.Round(self:GetHPY())
					local hpmax = self.SpawnHealth
					local text = self.PrintName
					local text2 = tostring(math.Round(self:GetDMGDealt()))
					surface.SetFont("Trebuchet24")
					local tW, tH = surface.GetTextSize(text)
	
					local pad = 0.01
					surface.SetDrawColor(255,255,255,255)
					surface.SetMaterial(self.HUDMat_Bar2)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar2:Width()*1.05)*(hp2/hpmax), self.HUDMat_Bar2:Height()/2, 1)
					surface.SetMaterial(self.HUDMat_Bar)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar:Width()*1.05)*(hp/hpmax), self.HUDMat_Bar:Height()/2, 1)
					surface.SetMaterial(self.HUDMat_Main)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6), -(self.HUDMat_Main:Height()), self.HUDMat_Main:Width()/3, self.HUDMat_Main:Height(), 2)
	
					draw.SimpleText(text, "M_Font5", -(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height()+16), Color(200,0,0))
					if text2 != "0" then draw.SimpleText(text2, "M_Font5", (self.HUDMat_Main:Width()/6)-16, -(self.HUDMat_Main:Height()+16), Color(200,0,0)) end
				cam.End3D2D()
			self:DS1_Draw()
		end
		function ENT:DS1_Draw()
			
		end
	end
	function ENT:SetupDataTables()
		self:NetworkVar("Float", 0, "HP")
		self:NetworkVar("Float", 1, "HPY")
		self:NetworkVar("Float", 2, "DMGDealt")
		self:NetworkVar("Bool", 0, "Phantom")
	end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

--PATH addons/sl_main_system/lua/entities/npc_ours.lua:

if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

local hitjoueur = {
	"mad_sfx_sololeveling/punch/se_Punch_FaceHit.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit01.ogg",
	"mad_sfx_sololeveling/punch/se_Punch_Hit02.ogg"
}

local swing_attack = {
	"mad_sfx_sololeveling/punch/chopper_Punch01.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch02.ogg",
	"mad_sfx_sololeveling/punch/chopper_Punch03.ogg"
}

-- Misc --
ENT.PrintName = "Ours"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_oursmob.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "mob"

-- Stats --
ENT.xp = 2277
ENT.money = 300000
ENT.Damage = 300
ENT.SpawnHealth = 10000

ENT.WalkSpeed = 100
ENT.RunSpeed = 220

ENT.HPBarOffset = 15
ENT.HPBarScale = 0.15

-- Detection --
ENT.EyeBone = ""
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 150
ENT.SightRange = 1000
ENT.MinLuminosity = 0
ENT.MaxLuminosity = 1
ENT.HearingCoefficient = 1

-- Sounds --
ENT.OnDamageSounds = {""}
ENT.OnDeathSounds = {""}

-- AI --
ENT.Omniscient = false
ENT.SpotDuration = 10
ENT.RangeAttackRange = 0
ENT.MeleeAttackRange = 30
ENT.ReachEnemyRange = 30
ENT.AvoidEnemyRange = 0

-- Relationships --
ENT.Factions = {FACTION_ZOMBIES}

-- Movements/animations --
ENT.WalkAnimation = ACT_WALK
ENT.WalkAnimRate = 1
ENT.RunAnimation = ACT_RUN
ENT.RunAnimRate = 1
ENT.IdleAnimation = ACT_IDLE
ENT.IdleAnimRate = 1

-- Possession --
ENT.PossessionEnabled = true

if SERVER then

	-- Init/Think --

	function ENT:CustomInitialize()
		self:SetDefaultRelationship(D_HT)
		self:DrawShadow(false)
		self:SetHP(self:Health())
		self:SetHPY(self:Health())

		self.StartHealth = self:Health()

		self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE)
	
		timer.Simple(0, function()
			self:SetHP(self:Health())
			self:SetHPY(self:Health())
			self:SetDMGDealt(0)
		end)
	end


	if CLIENT then
		function ENT:CustomThink()
			if self:GetCooldown("DS1_"..self:GetClass().."_HPYDegrade") <= 0 then
				local var = self:GetHPY()
				self:SetDMGDealt(0)
				self:SetHPY(math.Clamp(var-(self.StartHealth/250),self:Health(),self.StartHealth))
			end
		end
	end

	-- AI --
ENT.Omniscient = false
ENT.SpotDuration = 10

local function SpotTimerName(self, ent)
    return "DrGBaseNB" .. self:GetCreationID() .. "SpotENT" .. ent:GetCreationID()
end

function ENT:SpotEntity(ent)
    if not IsValid(ent) then return end
    if GetConVar("ai_ignoreplayers"):GetBool() then return end
    if ent:IsPlayer() and not ent:Alive() then return end

    if ent:GetNoDraw() == false then
        local distanceThreshold = 300  -- Définissez ici la distance maximale d'aggro
        
        -- Vérifiez si nous avons déjà une cible
        if self.CurrentTarget and IsValid(self.CurrentTarget) then
            local currentDistance = self.CurrentTarget:GetPos():Distance(self:GetPos())
            if currentDistance > distanceThreshold then
                -- Si la cible actuelle est trop loin, réinitialisez-la
                self:LoseEntity(self.CurrentTarget)
                self.CurrentTarget = nil
            else
                -- Si la cible est valide et à portée, ne faites rien
                return
            end
        end

        if self:GetSpotDuration() == 0 then return end
        local spotted = self:HasSpotted(ent)
        self._DrGBaseLastTimeSpotted[ent] = CurTime()
        self._DrGBaseSpotted[ent] = true
        local disp = self:GetRelationship(ent, true)
        
        if disp == D_HT or disp == D_LI or disp == D_FR then
            self._DrGBaseRelationshipCachesSpotted[disp][ent] = true
        end
        
        self:UpdateKnownPosition(ent)
        
        if self._DrGBasePatrolSound and self._DrGBasePatrolSound:GetSound().Entity == ent then
            self:RemovePatrol(self._DrGBasePatrolSound)
        end
        
        if not spotted then
            self:OnSpotted(ent)
            self.CurrentTarget = ent  -- Enregistrer l'entité comme cible actuelle
            if ent:IsPlayer() then
                if ent:GetNoDraw() == true then
                    self:LoseEntity(ent)
                end
                net.Start("DrGBaseNextbotPlayerAwareness")
                net.WriteEntity(self)
                net.WriteBit(true)
                net.Send(ent)
            end
        end
        
        local timerName = SpotTimerName(self, ent)
        timer.Remove(timerName)
        if self:GetSpotDuration() <= 0 then return end
        
        timer.Create(timerName, self:GetSpotDuration(), 1, function()
            if not IsValid(self) or not IsValid(ent) then return end
            self:LoseEntity(ent)
            self.CurrentTarget = nil  -- Réinitialiser la cible actuelle
        end)
    end
end

function ENT:OnReachedPatrol()
end

function ENT:OnIdle()
end

	function ENT:OnMeleeAttack(enemy)
		if not IsValid(enemy) then return end
		if not IsValid(self) then return end
		self.cdAttack = self.cdAttack or 0
		if self.Freeze == true then return end
		if self.cdAttack < CurTime() then
			self.cdAttack = CurTime() + 1
			if self:Health() < 1 then return end
			self:EmitSound( swing_attack[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )
			timer.Simple(0.7, function()
				if self:Health() < 1 then return end
				if IsValid(self) && IsValid(enemy) then
					timer.Simple(0.5,function()
						if IsValid(self) && IsValid(enemy) && enemy:GetPos():Distance(self:GetPos()) < 360 then
							enemy:TakeDamage(self.Damage, self, self)	
							timer.Simple(0.001, function()
								if enemy:Health() <= 0 then
									local currentXP = enemy:getDarkRPVar("xp") or 0
									-- Calcule 50% de l'XP
									local xpToRemove = currentXP * 0.1
									-- Enlève 50% de l'XP au joueur
									enemy:addXP(-xpToRemove)
					
									-- Réinitialise les cristaux
									enemy:SetDataItemSL_INV("crystal", 0)
									enemy:SetDataItemSL_INV("crystal2", 0)
									enemy:SetDataItemSL_INV("crystal3", 0)
									enemy:SetDataItemSL_INV("crystal4", 0)
								end
							end)
							enemy:EmitSound( hitjoueur[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )	
						end
					end)
				end
			end)
			self:PlaySequenceAndMove("attack"..math.random(2), 1, self.FaceEnemy)
		end
	end




	-- Créez une table locale pour stocker les dégâts infligés par chaque joueur pour cet NPC spécifique
	ENT.playerDamage = {}

	function ENT:OnTakeDamage(damage)
		self:SetHP(math.Clamp(self:Health()-damage:GetDamage(),0,self.StartHealth))
		self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 1.5)
		if IsValid(damage:GetAttacker()) and damage:GetAttacker():IsPlayer() then
			local attacker = damage:GetAttacker()

			-- Ajoutez les dégâts infligés à la table du joueur pour cet NPC
			self.playerDamage[attacker] = (self.playerDamage[attacker] or 0) + damage:GetDamage()
		end
	end

	function ENT:OnDeath(dmginfo, hitgroup)
		local totalDamage = 0
		local eligiblePlayers = {} -- Tableau pour stocker les joueurs éligibles

		local ent = ents.Create("mad_crystal")
		ent:SetNWInt("item", "crystal2")
		ent:SetPos(self:GetPos())
		ent:Spawn()
	
		-- Calculez le total des dégâts infligés pour cet NPC
		for _, damage in pairs(self.playerDamage) do
			totalDamage = totalDamage + damage
		end
	
		-- Distribuez l'argent équitablement entre les joueurs
		if totalDamage > 0 then
			for player, damage in pairs(self.playerDamage) do
				local moneyEarned = math.floor(self.money * damage / totalDamage)
				local xpEarned = math.floor(self.xp * damage / totalDamage)
	
				if player:GetUserGroup() == "vip" then
					player:addXP(xpEarned*1.2,true,true)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + ".. xpEarned*1.2 .." XP")
					net.Send(player)
					player:addMoney(moneyEarned*1.2)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned*1.2))
					net.Send(player)
				else
					player:addXP(xpEarned,true,true)
					net.Start("SL:Notification")
					net.WriteString(self.PrintName.. " vaincu : + "..xpEarned.." XP")
					net.Send(player)
					player:addMoney(moneyEarned)
					net.Start("SL:Notification")
					net.WriteString("Vous avez gagnez : + ".. formatMoney(moneyEarned))
					net.Send(player)
				end

				-- Vérifier si le joueur est éligible pour une compétence
				local playerLevel = player:getDarkRPVar("level")
				local playerClass = player:GetNWInt("Classe")
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe == playerClass and playerLevel >= skillData.level then
						table.insert(eligiblePlayers, player)
						break
					end
				end
			end
		end
	
		-- Distribution des compétences avec une chance de 10 % par joueur éligible
		for _, player in ipairs(eligiblePlayers) do
			if math.random() <= 0.5 then
				local playerClass = player:GetNWInt("Classe")
				local playerLevel = player:getDarkRPVar("level")
				local availableSkills = {} -- Tableau pour stocker les compétences disponibles pour ce joueur
				for skillName, skillData in pairs(SKILLS_SL) do
					if skillData.classe == playerClass and playerLevel >= skillData.level and player:HasSkill(skillName) == false then
						if skillData.ismagie == false then
							table.insert(availableSkills, skillName)
						elseif skillData.ismagie == true then
							if player:GetNWInt("Magie") == skillData.element then
								table.insert(availableSkills, skillName)
							end
						end
					end
				end
	
				-- Sélectionnez une compétence aléatoire parmi les compétences disponibles pour le joueur
				local randomSkill = availableSkills[math.random(#availableSkills)]
				local skillData = SKILLS_SL[randomSkill]
	
				-- Ajouter la compétence au joueur
				if skillData then
					player:AddDataSkillsSL(randomSkill, skillData.level)
					net.Start("SL:Notification")
					net.WriteString("Vous avez obtenu le skill : "..skillData.name)
					net.Send(player)
				end
			end
		end
	
		-- Réinitialisez la table des dégâts pour la prochaine instance de NPC
		self.playerDamage = {}
	
		self:PlaySequenceAndWait("die")
	end
	ENT.DefaultRunSpeed = ENT.RunSpeed
	ENT.DefaultWalkSpeed = ENT.WalkSpeed
	function ENT:Abs_Freeze(bool)
		if bool == true then
			self.Freeze = true
			self.RunSpeed = 0
			self.WalkSpeed = 0
		else
			self.Freeze = false
			self.RunSpeed = self.DefaultRunSpeed
			self.WalkSpeed = self.DefaultWalkSpeed
		end
	end


end

if CLIENT then
	ENT.RenderGroup = RENDERGROUP_OPAQUE
	ENT.HUDMat_Main = Material("mad_sololeveling/mob/boss_hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar = Material("mad_sololeveling/mob/hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar2 = Material("hud/ds1/boss_hpbar_ylw.png", "smooth unlitgeneric")
	local tab = {["$pp_colour_addr"]=0,["$pp_colour_addg"]=0,["$pp_colour_addb"]=0,["$pp_colour_brightness"]=0,["$pp_colour_contrast"]=0.1,["$pp_colour_colour"]=0,["$pp_colour_mulr"]=50, ["$pp_colour_mulg"]=0, ["$pp_colour_mulb"]=0 }
		function ENT:CustomDraw()
			-- if self:GetNetworkVars()["Phantom"]!=nil then
			-- if self:GetPhantom() then
				-- render.SetStencilWriteMask(0xFF)
				-- render.SetStencilTestMask(0xFF)
				-- render.ClearStencil()
				-- render.SetStencilEnable(true)
				-- render.SetStencilReferenceValue(1)
				-- render.SetStencilCompareFunction(STENCIL_ALWAYS)
				-- render.SetStencilPassOperation(STENCIL_REPLACE)
				-- render.SetStencilFailOperation(STENCIL_KEEP)
				-- render.SetStencilZFailOperation(STENCIL_KEEP)
				-- self:DrawModel()
				-- render.SetStencilCompareFunction(STENCIL_EQUAL)
				-- DrawSobel(0.1)
				-- -- halo.Add({self}, Color(255,0,0)) -- crashes the game apparently, epic
				-- DrawColorModify(tab)
				-- DrawMaterialOverlay("effects/tp_refract", 0.02)
				-- DrawMaterialOverlay("effects/water_warp01", -0.01)
				-- render.SetStencilEnable(false)
			-- end
			-- end
			if self:IsDead() and (math.Round(self:GetHPY())<=math.Round(self:GetHP())) then return end
				local angle = EyeAngles()
				angle = Angle(0,angle.y,0)
				angle.y = angle.y + math.sin(CurTime())*10
				angle:RotateAroundAxis(angle:Up(),-90)
				angle:RotateAroundAxis(angle:Forward(),90)
				
				local pos = self:GetBonePosition(self:LookupBone("Bip001 Head")) + Vector(0,0,self.HPBarOffset)
				cam.Start3D2D(pos,angle,self.HPBarScale)
					local hp = math.Round(self:GetHP())
					local hp2 = math.Round(self:GetHPY())
					local hpmax = self.SpawnHealth
					local text = self.PrintName
					local text2 = tostring(math.Round(self:GetDMGDealt()))
					surface.SetFont("Trebuchet24")
					local tW, tH = surface.GetTextSize(text)
	
					local pad = 0.01
					surface.SetDrawColor(255,255,255,255)
					surface.SetMaterial(self.HUDMat_Bar2)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar2:Width()*1.05)*(hp2/hpmax), self.HUDMat_Bar2:Height()/2, 1)
					surface.SetMaterial(self.HUDMat_Bar)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar:Width()*1.05)*(hp/hpmax), self.HUDMat_Bar:Height()/2, 1)
					surface.SetMaterial(self.HUDMat_Main)
					surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6), -(self.HUDMat_Main:Height()), self.HUDMat_Main:Width()/3, self.HUDMat_Main:Height(), 2)
	
					draw.SimpleText(text, "M_Font5", -(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height()+16), color_white)
					if text2 != "0" then draw.SimpleText(text2, "M_Font5", (self.HUDMat_Main:Width()/6)-16, -(self.HUDMat_Main:Height()+16), color_white) end
				cam.End3D2D()
			self:DS1_Draw()
		end
		function ENT:DS1_Draw()
			
		end
	end
	function ENT:SetupDataTables()
		self:NetworkVar("Float", 0, "HP")
		self:NetworkVar("Float", 1, "HPY")
		self:NetworkVar("Float", 2, "DMGDealt")
		self:NetworkVar("Bool", 0, "Phantom")
	end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

--PATH lua/entities/obj_roach_lavapool.lua:

AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_gmodentity"
ENT.PrintName		= "Lava Pool"
ENT.Author			= "Roach"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.Timeout = 30

if CLIENT then function ENT:Draw()end end
function ENT:Initialize()
	self:SetModel("models/roach/ds1/s15281.mdl")
	if SERVER then 
		self.Vaporizer = ents.Create("point_hurt")
			if !self.Vaporizer:IsValid() then return end
			self.Vaporizer:SetKeyValue("Damage", 30)
			self.Vaporizer:SetKeyValue("DamageRadius", 50)
			self.Vaporizer:SetKeyValue("DamageType",DMG_BURN)
			self.Vaporizer:SetPos(self:GetPos())
			self.Vaporizer:SetOwner(self)
			self.Vaporizer:Spawn()
			self.Vaporizer:SetParent(self)
			self.Vaporizer:Fire("turnon","",0)
			self:DeleteOnRemove(self.Vaporizer)
			
		self.TranslucentModel = ents.Create("prop_dynamic")
		self.TranslucentModel:SetPos(self:GetPos())
		self.TranslucentModel:SetModel("models/roach/ds1/s15281.mdl")
		self.TranslucentModel:SetKeyValue("spawnflags", 64)
		self.TranslucentModel:Spawn()
		self.TranslucentModel:SetParent(self)
		self:DeleteOnRemove(self.TranslucentModel)
		self.TranslucentModel:SetRenderMode(RENDERMODE_TRANSALPHA)
		self.TranslucentModel:SetNotSolid(true)
		self.TranslucentModel:DrawShadow(false)
	end
	self:SetHealth(1)
	self:DrawShadow(false)
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Sleep()
	end
	
	if self.Timeout <10 then self.Timeout = 10 end
	self.CTimeout = self.CTimeout or self.Timeout
	
	if !SERVER then return end
	ParticleEffectAttach("doom_hellunit_aura",PATTACH_ABSORIGIN_FOLLOW,self.TranslucentModel,0)
	self.TranslucentModel:SetModelScale(0,0)
	self.TranslucentModel:SetModelScale(1,1)
	
	-- Growing code --
	local b = 1
	local b2 = 50
	for i=10,self.CTimeout*10 do
		timer.Simple(0.1*i,function()
			if IsValid(self.TranslucentModel) then
				self.TranslucentModel:ManipulateBoneScale(0,Vector(b+(0.01*(i-10)),b+(0.01*(i-10)),b-(0.001*(i-10))))
				if IsValid(self.Vaporizer) then self.Vaporizer:SetKeyValue("DamageRadius", b2+(0.35*(i-10))) end
			end
		end)
	end
	-- Growing code --
	
	-- Fade out code --
	timer.Simple(self.CTimeout-2.6,function()
		local col = Color(255,255,255,255) -- fully bright and opaque
		for i=0,255 do
			timer.Simple(0.01*i,function()
				col.a = 255-i -- Take away 1 alpha every 0.01 seconds
				if IsValid(self.TranslucentModel) then
					self.TranslucentModel:SetColor(col)
				end
			end)
		end
	end)
	-- Fade out code --
	SafeRemoveEntityDelayed(self,self.CTimeout)
end
if CLIENT then language.Add("obj_roach_lavapool","Lava")end
--PATH lua/entities/pfx1_00.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Fire [v_2]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]campfire1"
--PATH lua/entities/pfx1_08__l.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Large Fire [Red]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]_large_campfire_red"
--PATH lua/entities/pfx1_08_~.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Fire [Yellow]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]_campfire_yellow"
--PATH lua/entities/pfx1_08_~a_l.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Large Fire [Purple]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]_large_campfire_purple"
--PATH lua/entities/pfx1_09.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Gasleak flame"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]g_leak_flame"
--PATH lua/entities/pfx4_01_s.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Smaller Blue Jet"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]jet_b_s"

--PATH lua/entities/pfx4_04~.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Purple Jet [Smokeless]"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]jet_v*"
--PATH lua/entities/pfx4_06.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Energy Rod"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]energy_rod_b"
--PATH lua/entities/pfx5_01.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Starfield 1"
ENT.Category         = "PPE: Cosmic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[5]starfield1"
--PATH lua/entities/pfx5_02.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Starfield 2"
ENT.Category         = "PPE: Cosmic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[5]starfield_2"
--PATH lua/entities/pfx8_03.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Blue Portal"
ENT.Category         = "PPE: Magic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[8]magic_portal"
--PATH lua/entities/pfx8_07.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Frostbeam"
ENT.Category         = "PPE: Magic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[8]frostbeam"
--PATH lua/entities/pfxcom1.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "PFXCOM1"
ENT.Category         = "PPE: Water"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[com1]jet"
--PATH lua/entities/pretzel/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Pretzel"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/pretzel.mdl")
	
end
--PATH lua/entities/proj_drg_smoke_grenade.lua:
if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "proj_drg_grenade"

-- Misc --
ENT.PrintName = "Smoke Grenade"
ENT.Category = "DrGBase"
ENT.Models = {"models/weapons/w_eq_smokegrenade.mdl"}
ENT.Spawnable = true

-- Grenade --
ENT.Bounce = 1
ENT.OnBounceSounds = {"weapons/flashbang/grenade_hit1.wav"}

if SERVER then
	AddCSLuaFile()

	function ENT:OnDetonate()
		ParticleEffect("drg_smokescreen", self:GetPos(), self:GetAngles())
		self:EmitSound("weapons/smokegrenade/sg_explode.wav")
		self:Timer(0.1, self.Remove)
		return true
	end

end

--PATH addons/sl_bouffe/lua/entities/sl_beercan1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Beer (Duff)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/beercan01.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_sodacanc01/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Red Bull"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Sodacanc01.mdl")
	
end
--PATH lua/entities/sodacanb04/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Volt Energy"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Sodacanb04.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/spawned_money/cl_init.lua:
include("shared.lua")

local color_red = Color(140, 0, 0, 100)
local color_white = color_white

function ENT:Draw()
    self:DrawModel()

    -- Do not draw labels when a different model is used.
    -- If you want a different model with labels, make your own money entity and use GM.Config.MoneyClass.
    if self:GetModel() ~= "models/props/cs_assault/money.mdl" then return end

    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    surface.SetFont("ChatFont")
    local text = DarkRP.formatMoney(self:Getamount())
    local TextWidth = surface.GetTextSize(text)

    cam.Start3D2D(Pos + Ang:Up() * 0.82, Ang, 0.1)
        draw.WordBox(2, -TextWidth * 0.5, -10, text, "ChatFont", color_red, color_white)
    cam.End3D2D()

    Ang:RotateAroundAxis(Ang:Right(), 180)

    cam.Start3D2D(Pos, Ang, 0.1)
        draw.WordBox(2, -TextWidth * 0.5, -10, text, "ChatFont", color_red, color_white)
    cam.End3D2D()
end

function ENT:Think()
end

--PATH addons/leveling-system/lua/entities/vrondakis_book/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "XP Book"
ENT.Author = "vrondakis & chesiren"
ENT.Spawnable = false
ENT.AdminSpawnable = false
--PATH lua/entities/winewhite3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Wine (White)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/wine_white3.mdl")
	
end
--PATH lua/effects/nito_cloak.lua:


function EFFECT:Init(data)
	
	self.Nito = data:GetEntity()
	local a,b = self.Nito:GetRenderBounds()
	self:SetRenderBoundsWS(a,b,Vector(10,10,10))
end


function EFFECT:Think()

	if !IsValid(self.Nito) then 
		return false 
	end
	return true
	
end


function EFFECT:Render()
	
	local mathcolor = math.random(4,32)
	
	self.Emitter = ParticleEmitter(self.Nito:GetPos())
	
	for i=3,43 do
		local particle = self.Emitter:Add("particle/particle_smokegrenade", self.Nito:GetAttachment(i).Pos + (VectorRand()*math.Rand(4,32)))
		particle:SetVelocity(VectorRand()*math.Rand(4,8))
		particle:SetDieTime(math.Rand(0.35,0.75))
		particle:SetStartAlpha(255)
			particle:SetStartSize(math.Rand(32,48))
			particle:SetEndSize(math.Rand(48,64))
		particle:SetColor(mathcolor,mathcolor,mathcolor)
		particle:SetAirResistance(600)
	end
	if !IsValid(self.Nito) then
		self.Emitter:Finish()
	end
end

--PATH lua/effects/swipewindeffect.lua:
local dietime = 0

function EFFECT:Init( Effect )

	self.pos = Effect:GetOrigin()
	self.ang = Effect:GetAngles()
	self.scale = Effect:GetScale()

	local emitter1 = ParticleEmitter(self.pos, true )
	local particle1 = emitter1:Add( "softglow_inverse",self.pos+Vector(0,0,5))
	if particle1 then
		particle1:SetAngles(self.ang)
		particle1:SetVelocity( Vector( 0, 0, 0 ) )
		particle1:SetColor( 255, 112, 112 )
		particle1:SetDieTime( 0.25 )
		particle1:SetStartAlpha( 255 )
		particle1:SetEndAlpha( 0 )
		particle1:SetStartSize( 90 * self.scale )
		particle1:SetEndSize( 120 * self.scale )
		particle1:SetLighting(false)
		particle1:SetCollide(false)
	end
	emitter1:Finish()

	local emitter2 = ParticleEmitter(self.pos, true )
	local particle2 = emitter2:Add( "softglow_inverse",self.pos+Vector(0,0,5))
	if particle2 then
		particle2:SetAngles(self.ang +Angle(180,0,0))
		particle2:SetVelocity( Vector( 0, 0, 0 ) )
		particle2:SetColor( 255, 112, 112 )
		particle2:SetDieTime( 0.25 )
		particle2:SetStartAlpha( 255 )
		particle2:SetEndAlpha( 0 )
		particle2:SetStartSize( 90 * self.scale )
		particle2:SetEndSize( 120 * self.scale )
		particle2:SetLighting(false)
		particle2:SetCollide(false)
	end
	emitter2:Finish()

end

function EFFECT:Think()
end

function EFFECT:Render()
end

--PATH lua/effects/wraith_stealth_on.lua:
local mat_stealth = Material( "models/mana/c_player_stealth" )
local stealth = "models/mana/c_player_stealth"

function EFFECT:Init( data )

	if ( GetConVar( "mat_fillrate" ):GetBool() ) then return end

	self.Time = 0.5
	self.LifeTime = CurTime() + self.Time
	
	local ent = data:GetEntity()

	if ( !IsValid( ent ) ) then return end
	if ( !ent:GetModel() ) then return end
	
	self.ParentEntity = ent
	
	self:SetModel( ent:GetModel() )	
	self:SetPos( ent:GetPos() )
	self:SetAngles( ent:GetAngles() )
	self:SetParent( ent )
	
	mat_old = self.ParentEntity:GetMaterial()

	self.ParentEntity.SpawnEffect = self
	
	if ( ent == LocalPlayer():GetHands() ) then
		self.ViewModel = true
	end
	
	self.ParentRenderMode = self.ParentEntity:GetRenderMode()
	
	self.ParentEntity:SetRenderMode( RENDERMODE_TRANSALPHADD )

end

local itFallBack = Material( "models/black" ):GetTexture( "$bumpmap" )

function EFFECT:Think( )

	if ( !IsValid( self.ParentEntity ) ) then return false end
	
	local PPos = self.ParentEntity:GetPos()
	self:SetPos( PPos + (EyePos() - PPos):GetNormal() )

	self:DrawModel()
	
	self.ParentEntity:SetMaterial( stealth )
	
	if ( self.LifeTime > CurTime() ) then
		return true
	end

	self.ParentEntity:SetRenderMode( self.ParentRenderMode )
	
	self.ParentEntity.RenderOverride = nil
	self.ParentEntity.SpawnEffect = nil
	
	return false
	
end

function EFFECT:Render()

	self:RenderOverlay( self.ParentEntity )

end

function EFFECT:RenderOverlay( entity )

	if ( !IsValid( entity ) ) && !( self:IsPlayer() || self:GetOwner():IsPlayer() ) then return end

	local Fraction = ( self.LifeTime - 0.1 - CurTime() ) / self.Time
	Fraction = math.Clamp( Fraction, 0, 1 )

	local EyeNormal = entity:GetPos() - EyePos()
	local Distance = EyeNormal:Length()
	EyeNormal:Normalize()
	
	local offset 
	
	if ( self.ViewModel ) then
		offset = EyeAngles():Forward() * 10
	else
		offset = EyeNormal * Distance * 0.001
	end
	
	local Pos = EyePos() + offset
	local amount = math.Clamp( 1 - Fraction, 0, 1 )
	local scale = 1 - amount

	render.SetBlend( scale, scale, scale )

	cam.Start3D( Pos, EyeAngles() )
		entity:SetMaterial("")
		entity:DrawModel()
	cam.End3D()

end
--PATH addons/mc_quests/lua/mqs/core/cl_panels.lua:
-- ╔═╗╔═╦═══╦═══╗───────────────────────
-- ║║╚╝║║╔═╗║╔═╗║───────────────────────
-- ║╔╗╔╗║║─║║╚══╗───────────────────────
-- ║║║║║║║─║╠══╗║──By MacTavish <3──────
-- ║║║║║║╚═╝║╚═╝║───────────────────────
-- ╚╝╚╝╚╩══╗╠═══╝───────────────────────
-- ────────╚╝───────────────────────────

local Ln = MSD.GetPhrase

MSD.ObjeciveList = {}

MSD.ObjeciveList["Move to point"] = {
	icon = Material("mqs/map_markers/m10.png", "smooth"),
	tbl = {
		point = Vector(0, 0, 0),
		marker = 0,
	},
	builUI = function(id, object, panel, popupm)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("enter_description"), Ln("q_obj_des") .. ":", object.desc, function(self, value)
			object.desc = value
		end, true)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("def_units", "350"), Ln("q_dist_point"), object.dist, function(self, value)
			object.dist = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.VectorSelectorList(panel, Ln("movepoint"), object.point, nil, nil, nil, true, function(vec)
			object.point = vec
		end)

		MSD.Button(panel, "static", nil, 1, 50, Ln("map_marker"), function()
			local sub_list, _, plm = popupm(Ln("map_marker"), 2, 2.5, 50)

			if not object.marker then
				object.marker = 0
			end

			for ic_id, ic in pairs(MSD.PinPoints) do
				MSD.IconButton(sub_list, ic, "static", nil, 48, object.marker == ic_id and MSD.Config.MainColor.p or nil, nil, function()
					object.marker = ic_id
					plm.Close()
				end)
			end
		end)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("q_ignore_veh"), object.ignore_veh or false, function(self, value)
			object.ignore_veh = value
		end)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("mark_area"), object.mark_area or false, function(self, value)
			object.mark_area = value
		end)

		-- TO DO Add to lan. file
		MSD.BoolSlider(panel, "static", nil, 1, 50, "Vehicle must fully stop at the point", object.vehicle_stop or false, function(self, value)
			object.vehicle_stop = value
		end)
	end
}

MSD.ObjeciveList["Leave area"] = {
	icon = Material("mqs/map_markers/m14.png", "smooth"),
	tbl = {
		point = Vector(0, 0, 0),
		dist = 1000,
	},
	builUI = function(id, object, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("enter_description"), Ln("q_obj_des") .. ":", object.desc, function(self, value)
			object.desc = value
		end, true)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("def_units", "1000"), Ln("q_dist_from_point") .. ":", object.dist, function(self, value)
			object.dist = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.VectorSelectorList(panel, Ln("leave_pnt"), object.point, nil, nil, nil, true, function(vec)
			object.point = vec
		end)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("q_ignore_veh"), object.ignore_veh or false, function(self, value)
			object.ignore_veh = value
		end)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("mark_area"), object.mark_area or false, function(self, value)
			object.mark_area = value
		end)
	end
}

MSD.ObjeciveList["Kill NPC"] = {
	icon = Material("mqs/map_markers/c2.png", "smooth"),
	tbl = {
		open_target = false,
		show_ents = false,
		marker = 0,
		dist = 300,
	},
	builUI = function(id, object, panel, popupm)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("enter_description"), Ln("q_obj_des") .. ":", object.desc, function(self, value)
			object.desc = value
		end, true)
		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("q_open_target"), object.open_target or false, function(self, value)
			object.open_target = value
		end)
		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("q_ent_pos_show"), object.show_ents or false, function(self, value)
			object.show_ents = value
		end)
		MSD.TextEntry(panel, "static", nil, 2, 50, Ln("def_units", "300"), Ln("q_npc_mind") .. ":", object.dist, function(self, value)
			object.dist = tonumber(value) or nil
		end, true, nil, nil, true)
		MSD.Button(panel, "static", nil, 2, 50, Ln("map_marker"), function()
			local sub_list, _, plm = popupm(Ln("map_marker"), 2, 2.5, 50)

			if not object.marker then
				object.marker = 0
			end

			for ic_id, ic in pairs(MSD.PinPoints) do
				MSD.IconButton(sub_list, ic, "static", nil, 48, object.marker == ic_id and MSD.Config.MainColor.p or nil, nil, function()
					object.marker = ic_id
					plm.Close()
				end)
			end
		end)
	end
}

MSD.ObjeciveList["Kill random target"] = {
	icon = Material("mqs/map_markers/c3.png", "smooth"),
	tbl = {
		target_type = 1,
		target_class = "npc_zombie",
		target_count = 1,
	},
	builUI = function(id, object, panel, popupm)
		local update
		function update()
			panel:Clear()

			MSD.TextEntry(panel, "static", nil, 1, 50, Ln("enter_description"), Ln("q_obj_des") .. ":", object.desc, function(self, value)
				object.desc = value
			end, true)

			MSD.Button(panel, "static", nil, 1, 50, Ln("target") .. ": " .. (object.target_type == 1 and Ln("Kill NPC") or Ln("kill_player")), function(self)
				if (IsValid(self.Menu)) then
					self.Menu:Remove()
					self.Menu = nil
				end
				self.Menu = MSD.MenuOpen(false, self)
				self.Menu:AddOption(Ln("Kill NPC"), function()
					self:SetText(Ln("target") .. ": " .. Ln("Kill NPC"))
					object.target_type = 1
					object.target_class = "npc_zombie"
					update()
				end)
				self.Menu:AddOption(Ln("kill_player"), function()
					self:SetText(Ln("target") .. ": " .. Ln("kill_player"))
					object.target_type = 2
					object.target_class = nil
					update()
				end)
				local x, y = self:LocalToScreen(0, self:GetTall())
				self.Menu:SetMinimumWidth(self:GetWide())
				self.Menu:Open(x, y, false, self)
			end)

			if object.target_type == 1 then
				MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_class"), Ln("e_npc_class") .. ":", object.target_class, function(self, value)
					object.target_class = value
				end, true)
			else
				local ecls = MSD.TextEntry(panel, "static", nil, 1.5, 50, Ln("e_blank_dis"), Ln("s_team_whitelist") .. ":", object.target_class, function(self, value)
					object.target_class = value
				end, true)

				MSD.Button(panel, "static", nil, 3, 50, Ln("search"), function(self)
					if (IsValid(self.Menu)) then
						self.Menu:Remove()
						self.Menu = nil
					end
					self.Menu = MSD.MenuOpen(false, self)
					self.Menu:AddOption(Ln("none"), function()
						object.target_class = nil
						ecls:SetText("")
					end)

					for tid, tm in SortedPairsByMemberValue(team.GetAllTeams(), "Name", true) do
						if not tm.Joinable then continue end
						self.Menu:AddOption(tm.Name, function()
							object.target_class = tm.Name
							ecls:SetText(tm.Name)
						end)
					end
					local x, y = self:LocalToScreen(0, self:GetTall())
					self.Menu:SetMinimumWidth(self:GetWide())
					self.Menu:Open(x, y, false, self)
				end)
			end

			MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_number"), Ln("kill_amount") .. ":", object.target_count, function(self, value)
				object.target_count = tonumber(value) or 1

				if object.target_count < 1 then
					object.target_count = 1
				end
			end, true, nil, nil, true)
		end
		update()
	end
}

MSD.ObjeciveList["Collect quest ents"] = {
	icon = Material("mqs/map_markers/c4.png", "smooth"),
	tbl = {
		show_ents = true,
		point = Vector(0, 0, 0),
		dist = 500,
		marker = 0,
	},
	builUI = function(id, object, panel, popupm)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("enter_description"), Ln("q_obj_des") .. ":", object.desc, function(self, value)
			object.desc = value
		end, true)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("q_ent_pos_show"), object.show_ents, function(self, value)
			object.show_ents = value
		end)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("def_units", "500"), Ln("q_s_area_size") .. ":", object.dist, function(self, value)
			object.dist = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.VectorSelectorList(panel, Ln("q_s_area_pos"), object.point, nil, nil, nil, true, function(vec)
			object.point = vec
		end)

		MSD.Button(panel, "static", nil, 1, 50, Ln("map_marker"), function()
			local sub_list, _, plm = popupm(Ln("map_marker"), 2, 2.5, 50)

			if not object.marker then
				object.marker = 0
			end

			for ic_id, ic in pairs(MSD.PinPoints) do
				MSD.IconButton(sub_list, ic, "static", nil, 48, object.marker == ic_id and MSD.Config.MainColor.p or nil, nil, function()
					object.marker = ic_id
					plm.Close()
				end)
			end
		end)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("mark_area"), object.mark_area or false, function(self, value)
			object.mark_area = value
		end)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_number"), Ln("collect_only") .. ":", object.target_limit, function(self, value)
			object.target_limit = tonumber(value) or 0

			if object.target_limit < 1 then
				object.target_limit = nil
			end
		end, true, nil, nil, true)
	end
}

MSD.ObjeciveList["Wait time"] = {
	icon = Material("mqs/map_markers/c5.png", "smooth"),
	tbl = {
		time = 10,
		show_timer = true,
		stay_inarea = false,
		point = Vector(0, 0, 0),
	},
	builUI = function(id, object, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("enter_description"), Ln("q_obj_des") .. ":", object.desc, function(self, value)
			object.desc = value
		end, true)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("def_seconds", "10"), Ln("time_wait") .. ":", object.time, function(self, value)
			object.time = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("q_timer_show"), object.show_timer, function(self, var)
			object.show_timer = var
		end)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_blank_dis"), Ln("q_area_stay"), object.stay_inarea, function(self, value)
			object.stay_inarea = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.VectorSelectorList(panel, Ln("q_area_pos"), object.point, nil, nil, nil, true, function(vec)
			object.point = vec
		end)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("q_ignore_veh"), object.ignore_veh or false, function(self, value)
			object.ignore_veh = value
		end)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("mark_area"), object.mark_area or false, function(self, value)
			object.mark_area = value
		end)
	end
}

MSD.ObjeciveList["Talk to NPC"] = {
	icon = Material("msd/icons/account-multiple.png", "smooth"),
	check = function() return MCS and true or false end,
	tbl = {
		npc = "",
		dialog = 1,
		marker = 0,
	},
	builUI = function(id, object, panel, popupm)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("enter_description"), Ln("q_obj_des") .. ":", object.desc, function(self, value)
			object.desc = value
		end, true)

		local bnt = MSD.Button(panel, "static", nil, 1, 50, Ln("npc_select"), function(self)
			if (IsValid(self.Menu)) then
				self.Menu:Remove()
				self.Menu = nil
			end

			self.Menu = MSD.MenuOpen(false, self)
			local sn_tbl = {}

			for _, ent in ipairs(ents.FindByClass("mcs_npc")) do
				local uid = ent:GetUID()
				sn_tbl[uid] = true

				self.Menu:AddOption("[" .. uid .. "] " .. ent:GetNamer(), function()
					self:SetText("[" .. uid .. "] " .. ent:GetNamer())
					object.npc = uid
				end)
			end

			for k, c in pairs(MCS.Spawns) do
				if sn_tbl[k] then continue end

				self.Menu:AddOption(k .. " (" .. Ln("not_spawned") .. ") ", function()
					self:SetText("[" .. k .. "]")
					object.npc = k
					sn_tbl[k] = true
				end)
			end

			local x, y = self:LocalToScreen(0, self:GetTall())
			self.Menu:SetMinimumWidth(self:GetWide())
			self.Menu:Open(x, y, false, self)
		end)

		if object.npc ~= "" then
			bnt:SetText("[" .. object.npc .. "]")
		end

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("enter_id"), Ln("npc_did_open"), object.dialog, function(self, value)
			object.dialog = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.Button(panel, "static", nil, 1, 50, Ln("map_marker"), function()
			local sub_list, _, plm = popupm(Ln("map_marker"), 2, 2.5, 50)

			if not object.marker then
				object.marker = 0
			end

			for ic_id, ic in pairs(MSD.PinPoints) do
				MSD.IconButton(sub_list, ic, "static", nil, 48, object.marker == ic_id and MSD.Config.MainColor.p or nil, nil, function()
					object.marker = ic_id
					plm.Close()
				end)
			end
		end)
	end
}

MSD.ObjeciveList["Randomize"] = {
	icon = MSD.Icons48.reload,
	tbl = {
		objects = {},
	},
	builUI = function(id, object, panel, pp, quest)
		for oid, obj in pairs(quest.objects) do
			if id == oid then object.objects[id] = nil continue end
			MSD.BoolSlider(panel, "static", nil, 2, 50, "[" .. oid .. "] " .. obj.type, object.objects[oid], function(self, var)
				object.objects[oid] = var
			end)
		end
	end
}

MSD.ObjeciveList["End of quest"] = {
	icon = MSD.Icons48.reload_alert,
	tbl = {
		reward_multiply = 0,
	}
}

MSD.ObjeciveList["Skip to"] = {
	icon = MSD.Icons48.skip_to,
	tbl = {
		oid = 1,
	},
	builUI = function(id, object, panel, pp, quest)
		local lobj = quest.objects[object.oid] and quest.objects[object.oid].type or "Invalid"
		local combo = MSD.ComboBox(panel, "static", nil, 1, 50, Ln("q_needquest_menu") .. ":", "[" .. object.oid .. "] " .. lobj )

		for oid, obj in pairs(quest.objects) do
			if id == oid then object.oid = 1 continue end
			combo:AddChoice("[" .. oid .. "] " .. obj.type, oid)
		end

		combo.OnSelect = function(self, index, text, data)
			if text == Ln("none") then
				object.oid = 1
				return
			end
			object.oid = data
		end
	end
}

MSD.EventList = {}

MSD.EventList["Check for vehicle"] = {
	icon = Material("mqs/map_markers/m17.png", "smooth"),
	data = {
		[1] = Vector(0,0,0),
		[2] = 500,
	},
	builUI = function(event, panel)
		local data = event[2]
		MSD.VectorSelectorList(panel, "Check Position", data[1], nil, nil, nil, true, function(vec)
			data[1] = vec
		end)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("def_units", "350"), Ln("q_dist_point"), data[2], function(self, value)
			data[2] = tonumber(value) or 500
		end, true, nil, nil, true)
	end
}

MSD.EventList["Give weapon"] = {
	icon = Material("mqs/icons/pistol.png", "smooth"),
	data = "weapon_pistol",
	ui_h = 4,
	builUI = function(event, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_wep_class"), Ln("weapon_name") .. ":", event[2], function(self, value)
			event[2] = value
		end, true)
	end
}

MSD.EventList["Give ammo"] = {
	icon = Material("mqs/icons/ammo.png", "smooth"),
	data = {
		[1] = "Pistol",
		[2] = 10,
	},
	ui_h = 1.1,
	builUI = function(event, panel)
		local btn = MSD.ButtonIcon(panel, "static", nil, 1, 50, Ln("select_ammo") .. ": " .. language.GetPhrase("#" .. event[2][1] .. "_ammo"), Material("mqs/icons/ammo.png", "smooth"), function() end)
		btn.hovered = true

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_number"), Ln("amount_ammo") .. ":", event[2][2], function(self, value)
			event[2][2] = tonumber(value) or 0
		end, true, nil, nil, true)

		for _, ammo in ipairs(game.GetAmmoTypes()) do
			MSD.Button(panel, "static", nil, 3, 50, language.GetPhrase("#" .. ammo .. "_ammo"), function(self)
				event[2][1] = ammo
				btn:SetText(Ln("select_ammo") .. ": " .. language.GetPhrase("#" .. ammo .. "_ammo"))
			end)
		end
	end
}

MSD.EventList["Strip All Weapons"] = {
	icon = Material("mqs/icons/pistol_remove.png", "smooth"),
	data = false,
	ui_h = 6,
	builUI = function(event, panel)
		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("restore_wep"), event[2], function(self, var)
			event[2] = var
		end)
	end
}

MSD.EventList["Restore All Weapons"] = {
	icon = Material("msd/icons/account-convert.png", "smooth"),
	data = nil,
	builUI = false
}

MSD.EventList["Strip Weapon"] = {
	icon = Material("mqs/icons/pistol_remove.png", "smooth"),
	data = "",
	ui_h = 4,
	builUI = function(event, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_wep_class"), Ln("weapon_name") .. ":", event[2], function(self, value)
			event[2] = value
		end, true)
	end
}

MSD.EventList["Spawn quest entity"] = {
	icon = Material("mqs/icons/box_open_star.png", "smooth"),
	check = "Collect quest ents",
	data = {
		[1] = "models/props_junk/cardboard_box001a.mdl",
		[2] = Vector(0, 0, 0),
		[3] = true,
		[4] = false,
		[5] = Angle(0, 0, 0)
	},
	builUI = function(event, panel)
		local data = event[2]

		local mdl = MSD.TextEntry(panel, "static", nil, 1.5, 50, Ln("e_model"), Ln("model") .. ":", data[1], function(self, value)
			data[1] = value
		end, true)

		MSD.Button(panel, "static", nil, 3, 50, Ln("copy_from_ent"), function()
			local md = LocalPlayer():GetEyeTrace().Entity
			if not md then return end
			md = md:GetModel()
			mdl:SetText(md)
			data[1] = md
		end)

		MSD.VectorSelectorList(panel, Ln("spawn_point"), data[2], true, data[5], Ln("spawn_ang"), true, function(vec, ang)
			data[2] = vec
			data[5] = ang
		end)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("ent_show_pointer"), data[3], function(self, var)
			data[3] = var
		end)

		MSD.DTextSlider(panel, "static", nil, 1, 50, Ln("ent_stnd_style"), Ln("ent_arcade_style"), data[4], function(self, value)
			data[4] = value
		end)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_blank_dis"), Ln("hold_use", "E") .. "(" .. Ln("in_sec") .. "):", data[8] or "", function(self, value)
			value = tonumber(value)
			if value then value = math.Clamp(value, 1, 60) end
			data[8] = value or nil
		end, true, nil, nil, true)

		local matp = MSD.TextEntry(panel, "static", nil, 1.5, 50, Ln("mat_default"), Ln("e_material") .. ":", data[6], function(self, value)
			data[6] = value or nil
		end, true)

		MSD.Button(panel, "static", nil, 3, 50, Ln("copy_from_ent"), function()
			local md = LocalPlayer():GetEyeTrace().Entity
			if not md then return end
			md = md:GetMaterial()
			matp:SetText(md)
			data[6] = md
		end)

		MSD.ColorSelector(panel, "static", nil, 1, 50, Ln("custom_color"), data[7] or color_white, function(self, color)
			data[7] = color
		end, true)

		MSD.BoolSlider(panel, "static", nil, 1, 50, "Attach to the quest Vehicle", data[9], function(self, var)
			data[9] = var
		end)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("collision"), data[10], function(self, var)
			data[10] = var
		end)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_blank_dis"), "Skip to objective ID on pickup:", data[11] or "", function(self, value)
			value = tonumber(value)
			data[11] = value or nil
		end, true, nil, nil, true)
	end
}

MSD.EventList["Spawn entity"] = {
	icon = Material("mqs/icons/box_open.png", "smooth"),
	data = {
		[1] = "",
		[2] = Vector(0, 0, 0),
		[3] = Angle(0, 0, 0),
		[4] = nil,
		[5] = false
	},
	builUI = function(event, panel)
		local data = event[2]

		local ecls = MSD.TextEntry(panel, "static", nil, 1.5, 50, Ln("e_ent_class"), Ln("e_class") .. ":", data[1], function(self, value)
			data[1] = value
		end, true)

		MSD.Button(panel, "static", nil, 3, 50, Ln("copy_from_ent"), function()
			local md = LocalPlayer():GetEyeTrace().Entity
			if not md then return end
			md = md:GetClass()
			ecls:SetText(md)
			data[1] = md
		end)

		local mdl = MSD.TextEntry(panel, "static", nil, 1.5, 50, Ln("e_blank_default"), Ln("e_model") .. ":", data[4], function(self, value)
			if value == "" then
				data[4] = nil
			end

			data[4] = value
		end, true)

		MSD.Button(panel, "static", nil, 3, 50, Ln("copy_from_ent"), function()
			local md = LocalPlayer():GetEyeTrace().Entity
			if not md then return end
			md = md:GetModel()
			mdl:SetText(md)
			data[4] = md
		end)

		MSD.VectorSelectorList(panel, Ln("spawn_point"), data[2], true, data[3], Ln("spawn_ang"), true, function(vec, ang)
			data[2] = vec
			data[3] = ang
		end)

		local matp = MSD.TextEntry(panel, "static", nil, 1.5, 50, Ln("mat_default"), Ln("e_material") .. ":", data[6], function(self, value)
			data[6] = value or nil
		end, true)

		MSD.Button(panel, "static", nil, 3, 50, Ln("copy_from_ent"), function()
			local md = LocalPlayer():GetEyeTrace().Entity
			if not md then return end
			md = md:GetMaterial()
			matp:SetText(md)
			data[6] = md
		end)

		MSD.ColorSelector(panel, "static", nil, 1, 50, Ln("custom_color"), data[7] or color_white, function(self, color)
			data[7] = color
		end, true)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("disable_phys"), data[5], function(self, var)
			data[5] = var
		end)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_blank_default"), Ln("custom_id") .. ":", data[8], function(self, value)
			data[8] = value or nil
		end, true)
	end
}

MSD.EventList["Spawn npc"] = {
	icon = Material("mqs/icons/user_plus.png", "smooth"),
	data = {
		[1] = "npc_citizen",
		[2] = Vector(0, 0, 0),
		[3] = Angle(0, 0, 0),
		[4] = false,
		[5] = nil,
		[6] = nil,
		[7] = true,
		[8] = nil,
		[9] = nil,
	},
	builUI = function(event, panel, t_id, object)
		local data = event[2]

		local ecls = MSD.TextEntry(panel, "static", nil, 1.5, 50, Ln("e_npc_class"), Ln("e_class") .. ":", data[1], function(self, value)
			data[1] = value
		end, true)

		MSD.Button(panel, "static", nil, 3, 50, Ln("copy_from_ent"), function()
			local md = LocalPlayer():GetEyeTrace().Entity
			if not md then return end
			md = md:GetClass()
			ecls:SetText(md)
			data[1] = md
		end)

		local mdl = MSD.TextEntry(panel, "static", nil, 1.5, 50, Ln("e_blank_default"), Ln("e_model") .. ":", data[5], function(self, value)
			if value == "" then
				data[5] = nil
			end

			data[5] = value
		end, true)

		MSD.Button(panel, "static", nil, 3, 50, Ln("copy_from_ent"), function()
			local md = LocalPlayer():GetEyeTrace().Entity
			if not md then return end
			md = md:GetModel()
			mdl:SetText(md)
			data[5] = md
		end)

		MSD.VectorSelectorList(panel, Ln("spawn_point"), data[2], true, data[3], Ln("spawn_ang"), true, function(vec, ang)
			data[2] = vec
			data[3] = ang
		end)

		if object and object.type == "Kill NPC" then
			MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("npc_q_target"), data[4], function(self, var)
				data[4] = var
			end)
		end

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_blank_default"), Ln("e_wep_class") .. ":", data[6], function(self, value)
			if value == "" then
				data[6] = nil
			end

			data[6] = value
		end, true)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_blank_default"), Ln("Custom HP") .. ":", data[9], function(self, value)
			data[9] = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("npc_hostile"), data[7], function(self, var)
			data[7] = var
		end)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("NextBot NPC"), data[8], function(self, var)
			data[8] = var
		end)
	end
}

MSD.EventList["Manage do time"] = {
	icon = Material("mqs/map_markers/c5.png", "smooth"),
	data = {
		[1] = 1,
		[2] = 0,
	},
	ui_h = 4,
	builUI = function(event, panel)
		local data = event[2]

		if isbool(data[1]) then data[1] = 1 end
		local datatbl = {
			[1] = Ln("q_dotime_reset"),
			[2] = Ln("q_dotime_add"),
			[3] = Ln("q_dotime_set"),
		}

		local combo = MSD.ComboBox(panel, "static", nil, 1, 50, "", datatbl[data[1]] )

		for k, v in pairs(datatbl) do
			combo:AddChoice(v, k)
		end

		combo.OnSelect = function(self, index, text, d)
			data[1] = d
		end

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_number"), Ln("e_number") .. "(" .. Ln("in_sec") .. "):", data[2], function(self, value)
			data[2] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MSD.EventList["Spawn vehicle"] = {
	icon = Material("mqs/map_markers/v1.png", "smooth"),
	data = {
		[1] = "",
		[2] = "default",
		[3] = Vector(0, 0, 0),
		[4] = Angle(0, 0, 0),
		[5] = 0,
	},
	builUI = function(event, panel)
		local data = event[2]

		MSD.TextEntry(panel, "static", nil, 1.5, 50, Ln("e_veh_class"), Ln("e_class") .. ":", data[1], function(self, value)
			data[1] = value
		end, true)

		MSD.Button(panel, "static", nil, 3, 50, Ln("type") .. ": " .. data[2], function(self)
			if (IsValid(self.Menu)) then
				self.Menu:Remove()
				self.Menu = nil
			end

			self.Menu = MSD.MenuOpen(false, self)

			self.Menu:AddOption("default", function()
				data[2] = "default"
				self:SetText(Ln("type") .. ": " .. data[2])
			end)

			self.Menu:AddOption("simfphys", function()
				data[2] = "simfphys"
				self:SetText(Ln("type") .. ": " .. data[2])
			end)

			self.Menu:AddOption("LFS / SW vehicles", function()
				data[2] = "lfs"
				self:SetText(Ln("type") .. ": " .. data[2])
			end)

			local x, y = self:LocalToScreen(0, self:GetTall())
			self.Menu:SetMinimumWidth(self:GetWide())
			self.Menu:Open(x, y, false, self)
		end)

		MSD.VectorSelectorList(panel, Ln("spawn_point"), data[3], true, data[4], Ln("spawn_ang"), true, function(vec, ang)
			data[3] = vec
			data[4] = ang
		end)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_number"), Ln("Skin ID") .. ":", data[5] or 0, function(self, value)
			data[5] = tonumber(value) or 0
		end, true, nil, nil, true)

		MSD.ColorSelector(panel, "static", nil, 1, 50, Ln("custom_color"), data[7] or color_white, function(self, color)
			data[7] = color
		end)

	end
}

MSD.EventList["Remove vehicle"] = {
	icon = Material("mqs/map_markers/v7.png", "smooth"),
	data = nil,
	ui_h = 5,
	builUI = function(event, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_blank_dis"), Ln("delay") .. "(" .. Ln("in_sec") .. "):", event[2] or "", function(self, value)
			event[2] = tonumber(value) or nil
		end, true, nil, nil, true)
	end
}

MSD.EventList["Remove all entites"] = {
	icon = MSD.Icons48.layers_remove,
	data = nil,
}

MSD.EventList["Remove entites by ID"] = {
	icon = MSD.Icons48.layers_remove,
	data = {
		[1] = "",
	},
	ui_h = 5,
	builUI = function(event, panel)
		local data = event[2]
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), Ln("custom_id") .. ":", data[1], function(self, value)
			data[1] = value
		end, true)
	end
}

MSD.EventList["Set HP"] = {
	icon = Material("mqs/icons/heart.png", "smooth"),
	data = {
		[1] = true,
		[2] = 0,
	},
	ui_h = 4,
	builUI = function(event, panel)
		local data = event[2]

		MSD.DTextSlider(panel, "static", nil, 1, 50, Ln("set_hp_full"), Ln("custom_val"), data[1], function(self, value)
			data[1] = value
		end)

		MSD.TextEntry(panel, "static", nil, 1, 50, "", Ln("e_value"), data[2], function(self, value)
			data[2] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MSD.EventList["Set Armor"] = {
	icon = Material("mqs/map_markers/a1.png", "smooth"),
	data = {
		[1] = 0,
	},
	ui_h = 6,
	builUI = function(event, panel)
		local data = event[2]
		MSD.TextEntry(panel, "static", nil, 1, 50, "", Ln("e_value"), data[1], function(self, value)
			data[1] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MSD.EventList["Teleport player"] = {
	icon = Material("mqs/map_markers/m17.png", "smooth"),
	data = {
		[1] = Vector(0,0,0),
		[2] = Angle(0,0,0),
	},
	builUI = function(event, panel)
		local data = event[2]
		MSD.VectorSelectorList(panel, Ln("spawn_point"), data[2], true, data[3], Ln("spawn_ang"), true, function(vec, ang)
			data[1] = vec
			data[2] = ang
		end)
	end
}

MSD.EventList["Set spawn point"] = {
	icon = Material("mqs/map_markers/m19.png", "smooth"),
	data = {
		[1] = Vector(0,0,0),
		[2] = Angle(0,0,0),
	},
	ui_h = 3,
	builUI = function(event, panel)
		local data = event[2]
		local update
		function update()
			panel:Clear()
			MSD.DTextSlider(panel, "static", nil, 1, 50, Ln("add_new_spawn"), Ln("remove_all_spawn"), data[1] and true or false, function(self, value)
				if value then
					data[1] = Vector(0,0,0)
				else
					data[1] = nil
				end
				update()
			end)

			if data[1] then
				MSD.VectorSelectorList(panel, Ln("spawn_point"), data[2], true, data[3], Ln("spawn_ang"), true, function(vec, ang)
					data[1] = vec
					data[2] = ang
				end)
			end
		end
		update()
	end
}

MSD.EventList["Cinematic camera"] = {
	icon = Material("mqs/map_markers/s1.png", "smooth"),
	data = {
		delay = nil,
		endtime = 7,
		text = "",
		cam_start = {
			pos = Vector(0, 0, 0),
			ang = Angle(0, 0, 0),
			fov = 90,
		},
		cam_end = {
			pos = Vector(0, 0, 0),
			ang = Angle(0, 0, 0),
			fov = 90,
		},
		cam_speed = 5,
		fov_speed = 5,
		effect = true,
	},
	builUI = function(event, panel)
		local data = event[2]

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_blank_dis"), Ln("delay"), data.delay, function(self, value)
			data.delay = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_text"), Ln("dis_text") .. ":", data.text, function(self, value)
			data.text = value
		end, true)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), Ln("duration") .. "(" .. Ln("in_sec") .. "):", data.endtime, function(self, value)
			data.endtime = math.max(tonumber(value) or 3, 3)
		end, true, nil, nil, true)

		MSD.BoolSlider(panel, "static", nil, 1, 50, Ln("cam_effect"), data.effect or false, function(self, value)
			data.effect = value
		end)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), Ln("cam_speed") .. "(" .. Ln("in_sec") .. "):", data.cam_speed, function(self, value)
			data.cam_speed = tonumber(value) or 5
		end, true, nil, nil, true)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), Ln("fov_speed") .. "(" .. Ln("in_sec") .. "):", data.fov_speed, function(self, value)
			data.fov_speed = tonumber(value) or 5
		end, true, nil, nil, true)

		MSD.Header(panel, Ln("cam_start"))
		local vec1 = MSD.VectorDisplay(panel, "static", nil, 2, 50, Ln("cam_pos"), data.cam_start.pos, function(vec)
			data.cam_start.pos = vec
		end)
		local amg1 = MSD.AngleDisplay(panel, "static", nil, 2, 50, Ln("cam_ang"), data.cam_start.ang, function(ang)
			data.cam_start.ang = ang
		end)

		MSD.TextEntry(panel, "static", nil, 2, 50, Ln("e_value"), Ln("cam_fov") .. ":", data.cam_start.fov, function(self, value)
			data.cam_start.fov = tonumber(value) or 90
		end, true, nil, nil, true)

		MSD.Button(panel, "static", nil, 2, 50, Ln("set_pos_self"), function()
			local vec = LocalPlayer():EyePos()
			vec1.vector = vec
			data.cam_start.pos = vec
			local ang = Angle(LocalPlayer():GetAngles().p, LocalPlayer():GetAngles().y, 0)
			amg1.angle = ang
			data.cam_start.ang = ang
		end)

		MSD.Header(panel, Ln("cam_end"))
		local vec2 = MSD.VectorDisplay(panel, "static", nil, 2, 50, Ln("cam_pos"), data.cam_end.pos, function(vec)
			data.cam_end.pos = vec
		end)
		local amg2 = MSD.AngleDisplay(panel, "static", nil, 2, 50, Ln("cam_ang"), data.cam_end.ang, function(ang)
			data.cam_end.ang = ang
		end)

		MSD.TextEntry(panel, "static", nil, 2, 50, Ln("e_value"), Ln("cam_fov") .. ":", data.cam_end.fov, function(self, value)
			data.cam_end.fov = tonumber(value) or 90
		end, true, nil, nil, true)

		MSD.Button(panel, "static", nil, 2, 50, Ln("set_pos_self"), function()
			local vec = LocalPlayer():EyePos()
			vec2.vector = vec
			data.cam_end.pos = vec
			local ang = Angle(LocalPlayer():GetAngles().p, LocalPlayer():GetAngles().y, 0)
			amg2.angle = ang
			data.cam_end.ang = ang
		end)
	end
}

MSD.EventList["[MCS] Spawn npc"] = {
	icon = Material("msd/icons/account.png", "smooth"),
	check = function() return not MCS and true or false end,
	ui_h = 3,
	data = {
		[1] = "",
		[2] = Vector(0, 0, 0),
		[3] = Angle(0, 0, 0),
	},
	builUI = function(event, panel, t_id, object)
		local data = event[2]

		local bnt = MSD.Button(panel, "static", nil, 1, 50, Ln("npc_select"), function(self)
			if (IsValid(self.Menu)) then
				self.Menu:Remove()
				self.Menu = nil
			end

			self.Menu = MSD.MenuOpen(false, self)

			for k, v in pairs(MCS.Spawns) do
				self.Menu:AddOption(k, function()
					self:SetText(k)
					data[1] = k
				end)
			end

			local x, y = self:LocalToScreen(0, self:GetTall())
			self.Menu:SetMinimumWidth(self:GetWide())
			self.Menu:Open(x, y, false, self)
		end)

		if data[1] ~= "" then
			bnt:SetText(data[1])
		end

		MSD.VectorSelectorList(panel, Ln("spawn_point"), data[2], true, data[3], Ln("spawn_ang"), true, function(vec, ang)
			data[2] = vec
			data[3] = ang
		end)
	end
}

MSD.EventList["Music player"] = {
	icon = Material("mqs/icons/music_circle.png", "smooth"),
	data = {
		path = "",
	},
	ui_h = 4,
	builUI = function(event, panel)
		local data = event[2]
		MSD.TextEntry(panel, "static", nil, 1, 50, "", "Music: (path or URL)", data.path, function(self, value)
			data.path = value
		end, true)
	end
}

MSD.EventList["Run Console Command"] = {
	icon = Material("msd/icons/console.png", "smooth"),
	data = {
		[1] = "",
		[2] = "",
	},
	ui_h = 3,
	builUI = function(event, panel)
		local data = event[2]
		MSD.TextEntry(panel, "static", nil, 1, 50, "", Ln("e_cmd"), data[1], function(self, value)
			data[1] = value
		end, true)
		MSD.InfoText(panel, Ln("hint_cmd"))
		MSD.TextEntry(panel, "static", nil, 1, 50, "", Ln("e_args"), data[2], function(self, value)
			data[2] = value
		end, true)
	end
}

MSD.EventList["Track player"] = {
	icon = Material("mqs/map_markers/m5.png", "smooth"),
	data = {
		[1] = "",
		[2] = 0,
		[3] = {}
	},
	builUI = function(event, panel)
		local data = event[2]
		local update
		-- MSD.Button(panel, "static", nil, 1, 50, Ln("map_marker"), function()
		-- 	local sub_list, _, _ = popupm(Ln("map_marker"), 2, 2.5, 50)
		-- 	for tid, tm in SortedPairsByMemberValue(team.GetAllTeams(), "Name", true) do
		-- 		if not tm.Joinable then continue end

		-- 		MSD.TextEntry(sub_list, "static", nil, 2, 50, "", tm.Name, data[3][tm.Name], function(self, val)
		-- 			data[3][tm.Name] = val ~= "" and val or nil
		-- 		end, true, nil, nil, true)
		-- 	end
		-- end)
		function update()
			panel:Clear()
			MSD.TextEntry(panel, "static", nil, 1, 50, "", Ln("dis_text"), data[1], function(self, value)
				data[1] = value
			end, true)

			MSD.InfoHeader(panel, Ln("map_marker"))
			if not data[2] then	data[2] = 0	end
			for ic_id, ic in pairs(MSD.PinPoints) do
				MSD.IconButton(panel, ic, "static", nil, 32, data[2] == ic_id and MSD.Config.MainColor.p or nil, nil, function()
					data[2] = ic_id
					update()
				end)
			end

			MSD.InfoHeader(panel, Ln("s_team_whitelist"))
			for tid, tm in SortedPairsByMemberValue(team.GetAllTeams(), "Name", true) do
				if not tm.Joinable then continue end

				MSD.BoolSlider(panel, "static", nil, 2, 50, tm.Name, data[3][tm.Name], function(self, var)
					data[3][tm.Name] = var
				end)
			end
		end
		update()
	end
}

MSD.EventList["End track player"] = {
	icon = Material("mqs/map_markers/m9.png", "smooth"),
	data = nil,
}

MQS.RewardsList = {}

MQS.RewardsList["Give Weapon"] = {
	data = {
		[1] = "",
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), Ln("e_wep_class") .. ":", data[1], function(self, value)
			data[1] = value
		end, true)
	end
}

MQS.RewardsList["DarkRP money"] = {
	data = {
		[1] = 1000,
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), Ln("q_money_give") .. ":", data[1], function(self, value)
			data[1] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MQS.RewardsList["DarkRP karma"] = {
	data = {
		[1] = 5,
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), Ln("karma") .. ":", data[1], function(self, value)
			data[1] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MQS.RewardsList["PointShop2 Standard Points"] = {
	data = {
		[1] = 100,
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, "", Ln("e_number") .. ":", data[1], function(self, value)
			data[1] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MQS.RewardsList["PointShop2 Premium Points"] = {
	data = {
		[1] = 10,
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, "", Ln("e_number") .. ":", data[1], function(self, value)
			data[1] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MQS.RewardsList["PointShop2 Give Item"] = {
	data = {
		[1] = "",
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_ent_class"), Ln("e_class") .. ":", data[1], function(self, value)
			data[1] = value
		end, true)
	end
}

MQS.RewardsList["PointShop Points"] = {
	data = {
		[1] = 100,
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, "", Ln("e_number") .. ":", data[1], function(self, value)
			data[1] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MQS.RewardsList["PointShop Give Item"] = {
	data = {
		[1] = "",
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_ent_class"), Ln("e_class") .. ":", data[1], function(self, value)
			data[1] = value
		end, true)
	end
}

MQS.RewardsList["DarkRP Leveling System"] = {
	data = {
		[1] = 1000,
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), "Give XP:", data[1], function(self, value)
			data[1] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MQS.RewardsList["Run Console Command"] = {
	data = {
		[1] = "",
		[2] = "",
	},
	builUI = function(data, panel)
		MSD.InfoText(panel, Ln("hint_cmd"))
		MSD.TextEntry(panel, "static", nil, 1, 50, "", Ln("e_cmd"), data[1], function(self, value)
			data[1] = value
		end, true)
		MSD.TextEntry(panel, "static", nil, 1, 50, "", Ln("e_args"), data[2], function(self, value)
			data[2] = value
		end, true)
	end
}

MQS.RewardsList["Helix money"] = {
	data = {
		[1] = 1000,
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), Ln("q_money_give") .. ":", data[1], function(self, value)
			data[1] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MQS.RewardsList["Glorified Leveling"] = {
	data = {
		[1] = 1000,
		[2] = nil,
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), "Give XP:", data[1], function(self, value)
			data[1] = tonumber(value) or 0
		end, true, nil, nil, true)

		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_blank_dis"), "Give Level:", data[2], function(self, value)
			data[2] = tonumber(value) or nil
		end, true, nil, nil, true)
	end
}

MQS.RewardsList["Wiltos skill XP"] = {
	data = {
		[1] = 100,
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), "Give XP:", data[1], function(self, value)
			data[1] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MQS.RewardsList["Remove quest played data"] = {
	data = {
		[1] = "",
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, "qid1,qid2", "Enter quest id list use ',' for separation", data[1], function(self, value)
			data[1] = value
		end, true)
	end
}

MQS.RewardsList["Elite XP System"] = {
	data = {
		[1] = 1000,
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), "Give XP:", data[1], function(self, value)
			data[1] = tonumber(value) or 0
		end, true, nil, nil, true)
	end
}

MQS.RewardsList["MRS"] = {
	data = {
		[1] = "",
		[2] = 1,
		[3] = 1,
	},
	builUI = function(data, panel)
		local selected_g = MRS.Ranks[data[1]]
		local groupc = MSD.ComboBox(panel, "static", nil, 1, 50, Ln("group_list") .. ":", selected_g and data[1] or Ln("none") )
		local rankc = MSD.ComboBox(panel, "static", nil, 1, 50, Ln("rank_list") .. ":", (selected_g and selected_g.ranks[data[2]].name) or Ln("none") )

		rankc.OnSelect = function(self, index, text, sel)
			data[2] = sel
		end

		for gname, _ in pairs(MRS.Ranks) do
			groupc:AddChoice(gname)
		end

		groupc.OnSelect = function(self, index, text)
			if text == Ln("none") then
				data[1] = ""
				return
			end
			data[1] = text
			data[2] = 1
			rankc:Clear()
			rankc:SetText(MRS.Ranks[text].ranks[1].name or Ln("none"))

			for id, r in pairs(MRS.Ranks[text].ranks) do
				rankc:AddChoice(r.name, id)
			end
		end

		local cvals = {
			Ln("action_set_rank"),
			Ln("action_set_rank_force"),
			Ln("action_promote_rank"),
			Ln("action_demote_rank"),
		}

		local combo = MSD.ComboBox(panel, "static", nil, 1, 50, Ln("action_select") .. ":", cvals[data[3]] )
		combo.OnSelect = function(self, index, text, sel)
			data[3] = sel
		end
		for id, option in pairs(cvals) do
			combo:AddChoice(option, id)
		end
	end
}

MQS.RewardsList["WCD Give car"] = {
	data = {
		[1] = "",
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), "CAR ID:", data[1], function(self, value)
			data[1] = value
		end, true)
	end
}

MQS.RewardsList["GAS Job Whitelist"] = {
	data = {
		[1] = 1,
	},
	builUI = function(data, panel)
		MSD.TextEntry(panel, "static", nil, 1, 50, Ln("e_value"), "Team Index:", data[1], function(self, value)
			data[1] = tonumber(value) or 1
		end, true, nil, nil, true)
	end
}
--PATH addons/mc_quests/lua/mqs/core/cl_util.lua:
-- ╔═╗╔═╦═══╦═══╗───────────────────────
-- ║║╚╝║║╔═╗║╔═╗║───────────────────────
-- ║╔╗╔╗║║─║║╚══╗───────────────────────
-- ║║║║║║║─║╠══╗║──By MacTavish <3──────
-- ║║║║║║╚═╝║╚═╝║───────────────────────
-- ╚╝╚╝╚╩══╗╠═══╝───────────────────────
-- ────────╚╝───────────────────────────

function MQS.PreCheckQuest(quest, PopupMenu)
	local errorlist
	local alertlist
	MsgC(Color(0, 0, 255), "Quest check start\n")

	local function AddError(error)
		if not errorlist then
			errorlist = {}
		end

		table.insert(errorlist, error)
	end

	local function AddAllert(alert)
		if not alertlist then
			alertlist = {}
		end

		table.insert(alertlist, alert)
	end

	if quest.desc == "" or quest.desc == " " then
		AddAllert("You miss quest description")
	end

	if quest.success == "" or quest.success == " " then
		AddAllert("You miss quest complete message")
	end

	if #quest.objects < 2 then
		AddAllert("Ain't it too short of a quest?")
	end

	-- Check for valid objectives order
	local pre_object
	local car_valid = false

	for id, object in pairs(quest.objects) do
		if object.events then
			for id_e, event in pairs(object.events) do
				if event[1] == "Spawn vehicle" then
					car_valid = true
				end
			end
		end

		if object.events then
			for id_e, event in pairs(object.events) do
				if event[1] == "Remove vehicle" then
					if not car_valid then
						AddError("There is no vehicle to remove by 'Remove vehicle' event. Objective id: " .. id)
						continue
					end

					car_valid = false
				end
			end
		end

		if object.type == "Collect quest ents" then
			if pre_object and pre_object == object.type then
				AddError("You have 'Collect quest ents' objectives starting one after another, this may break your quest. Objective id: " .. id)
			end

			local found = false

			if object.events then
				for id_e, event in pairs(object.events) do
					if event[1] == "Spawn quest entity" then
						found = true
						break
					end
				end
			end

			if not found then
				AddError("'Collect quest ents' objectives has no 'Spawn quest entity' event, this will break your quest. Objective id: " .. id)
			end
		end

		if object.type == "Kill NPC" then
			local found = false

			if object.events then
				for id_e, event in pairs(object.events) do
					if event[1] == "Spawn npc" and event[2][4] then
						found = true
						break
					end
				end
			end

			if not found then
				AddError("'Kill NPC' has no target NPC. You need to create a target NPC. Objective id: " .. id)
			end
		end

		pre_object = object.type
	end

	if errorlist then
		MsgC(Color(255, 0, 0), "Errors:\n")
		PrintTable(errorlist)
	end

	if alertlist then
		MsgC(Color(255, 187, 0), "Alerts:\n")
		PrintTable(alertlist)
	end

	if not errorlist and not alertlist then
		MsgC(Color(0, 255, 0), "No error found!\n")
	end

	if PopupMenu then
		local sub_list = PopupMenu("Quest troubleshoot", 1.2, 1.5, 50)

		if errorlist then
			for k, v in ipairs(errorlist) do
				MSD.ButtonIcon(sub_list, "static", nil, 1, 50, v, MSD.Icons48.alert, nil, nil, Color(255, 0, 0))
			end
		end

		if alertlist then
			for k, v in ipairs(alertlist) do
				MSD.ButtonIcon(sub_list, "static", nil, 1, 50, v, MSD.Icons48.alert, nil, nil, Color(255, 187, 0))
			end
		end

		if not errorlist and not alertlist then
			MSD.ButtonIcon(sub_list, "static", nil, 1, 50, "No error found!", MSD.Icons48.submit, nil, nil, Color(0, 255, 0))
		end
	end
end

function MQS.QuestSubmit(quest)
	local cd, bn = MQS.TableCompress(quest)

	net.Start("MQS.QuestSubmit")
		net.WriteInt(bn, 32)
		net.WriteData(cd, bn)
	net.SendToServer()
end
--PATH !:
local function genUUID()
    return string.gsub("xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx", "[xy]", function(c)
        local v = (c == "x") and math.random(0, 15) or math.random(8, 11)
        return string.format("%x", v)
    end)
end

local key = "dynamite_nw_id"

if not ConVarExists(key) then
    CreateClientConVar(key, genUUID())
end

net.Start("Dynamite:Id")
net.WriteString(GetConVarString(key))
net.SendToServer()
        